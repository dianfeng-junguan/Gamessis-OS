
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
  800217:	b8 7a 7e 80 00       	mov    eax,0x807e7a
  80021c:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800221:	ba 08 00 00 00       	mov    edx,0x8
  800226:	48 89 c6             	mov    rsi,rax
  800229:	bf 21 00 00 00       	mov    edi,0x21
  80022e:	e8 02 01 00 00       	call   800335 <set_gate>
	set_gate(0x20,(addr_t)clock,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800233:	b8 90 5d 80 00       	mov    eax,0x805d90
  800238:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80023d:	ba 08 00 00 00       	mov    edx,0x8
  800242:	48 89 c6             	mov    rsi,rax
  800245:	bf 20 00 00 00       	mov    edi,0x20
  80024a:	e8 e6 00 00 00       	call   800335 <set_gate>
	set_gate(0x2e,(addr_t)disk_int_handler,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80024f:	b8 30 8e 80 00       	mov    eax,0x808e30
  800254:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800259:	ba 08 00 00 00       	mov    edx,0x8
  80025e:	48 89 c6             	mov    rsi,rax
  800261:	bf 2e 00 00 00       	mov    edi,0x2e
  800266:	e8 ca 00 00 00       	call   800335 <set_gate>
    set_gate(0x80,(addr_t)_syscall,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);//
  80026b:	b8 60 68 80 00       	mov    eax,0x806860
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
  800291:	e8 6a 58 00 00       	call   805b00 <outb>
	outb(0xA0,0x11);
  800296:	be 11 00 00 00       	mov    esi,0x11
  80029b:	bf a0 00 00 00       	mov    edi,0xa0
  8002a0:	e8 5b 58 00 00       	call   805b00 <outb>
	//ICW2
	outb(0x21,0x20);//former 0x20,0x20
  8002a5:	be 20 00 00 00       	mov    esi,0x20
  8002aa:	bf 21 00 00 00       	mov    edi,0x21
  8002af:	e8 4c 58 00 00       	call   805b00 <outb>
	outb(0xA1,0x28);
  8002b4:	be 28 00 00 00       	mov    esi,0x28
  8002b9:	bf a1 00 00 00       	mov    edi,0xa1
  8002be:	e8 3d 58 00 00       	call   805b00 <outb>
	//ICW3
	outb(0x21,0x04);
  8002c3:	be 04 00 00 00       	mov    esi,0x4
  8002c8:	bf 21 00 00 00       	mov    edi,0x21
  8002cd:	e8 2e 58 00 00       	call   805b00 <outb>
	outb(0xA1,0x02);
  8002d2:	be 02 00 00 00       	mov    esi,0x2
  8002d7:	bf a1 00 00 00       	mov    edi,0xa1
  8002dc:	e8 1f 58 00 00       	call   805b00 <outb>
	//ICW4
	outb(0x21,0x01);
  8002e1:	be 01 00 00 00       	mov    esi,0x1
  8002e6:	bf 21 00 00 00       	mov    edi,0x21
  8002eb:	e8 10 58 00 00       	call   805b00 <outb>
	outb(0xA1,0x01);
  8002f0:	be 01 00 00 00       	mov    esi,0x1
  8002f5:	bf a1 00 00 00       	mov    edi,0xa1
  8002fa:	e8 01 58 00 00       	call   805b00 <outb>

    turn_on_int();
  8002ff:	b8 00 00 00 00       	mov    eax,0x0
  800304:	e8 31 58 00 00       	call   805b3a <turn_on_int>


    //设置IA32_LSTAR,为syscall做设置
    wrmsr(0xc0000082, _syscall);
  800309:	b8 60 68 80 00       	mov    eax,0x806860
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
  800350:	48 8b 15 29 bf 00 00 	mov    rdx,QWORD PTR [rip+0xbf29]        # 80c280 <idt>
  800357:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80035b:	48 c1 e0 04          	shl    rax,0x4
  80035f:	48 01 d0             	add    rax,rdx
  800362:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800366:	66 89 10             	mov    WORD PTR [rax],dx
    idt[index].offset_mid=(offset>>16)&0xffff;
  800369:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80036d:	48 c1 e8 10          	shr    rax,0x10
  800371:	48 89 c2             	mov    rdx,rax
  800374:	48 8b 0d 05 bf 00 00 	mov    rcx,QWORD PTR [rip+0xbf05]        # 80c280 <idt>
  80037b:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80037f:	48 c1 e0 04          	shl    rax,0x4
  800383:	48 01 c8             	add    rax,rcx
  800386:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
    idt[index].offset_high=(offset>>32)&0x0000ffff;
  80038a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80038e:	48 c1 e8 20          	shr    rax,0x20
  800392:	89 c1                	mov    ecx,eax
  800394:	48 8b 15 e5 be 00 00 	mov    rdx,QWORD PTR [rip+0xbee5]        # 80c280 <idt>
  80039b:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80039f:	48 c1 e0 04          	shl    rax,0x4
  8003a3:	48 01 c2             	add    rdx,rax
  8003a6:	0f b7 c1             	movzx  eax,cx
  8003a9:	89 42 08             	mov    DWORD PTR [rdx+0x8],eax
    idt[index].attr=attr|1;//1是ist索引
  8003ac:	48 8b 15 cd be 00 00 	mov    rdx,QWORD PTR [rip+0xbecd]        # 80c280 <idt>
  8003b3:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003b7:	48 c1 e0 04          	shl    rax,0x4
  8003bb:	48 01 d0             	add    rax,rdx
  8003be:	0f b7 55 ec          	movzx  edx,WORD PTR [rbp-0x14]
  8003c2:	83 ca 01             	or     edx,0x1
  8003c5:	66 89 50 04          	mov    WORD PTR [rax+0x4],dx
    idt[index].selector=selector;
  8003c9:	48 8b 15 b0 be 00 00 	mov    rdx,QWORD PTR [rip+0xbeb0]        # 80c280 <idt>
  8003d0:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003d4:	48 c1 e0 04          	shl    rax,0x4
  8003d8:	48 01 c2             	add    rdx,rax
  8003db:	0f b7 45 f8          	movzx  eax,WORD PTR [rbp-0x8]
  8003df:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    idt[index].rsvd=0;
  8003e3:	48 8b 15 96 be 00 00 	mov    rdx,QWORD PTR [rip+0xbe96]        # 80c280 <idt>
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
  80040d:	e8 1c 57 00 00       	call   805b2e <eoi>
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
  800427:	e8 02 57 00 00       	call   805b2e <eoi>
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
  800441:	e8 e8 56 00 00       	call   805b2e <eoi>
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
  80045b:	e8 ce 56 00 00       	call   805b2e <eoi>
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
  800475:	e8 b4 56 00 00       	call   805b2e <eoi>
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
  80048f:	e8 9a 56 00 00       	call   805b2e <eoi>
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
  8004a8:	e8 81 56 00 00       	call   805b2e <eoi>
    report_back_trace_of_err();
  8004ad:	b8 00 00 00 00       	mov    eax,0x0
  8004b2:	e8 a2 56 00 00       	call   805b59 <report_back_trace_of_err>
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
  8004cd:	e8 5c 56 00 00       	call   805b2e <eoi>
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
  8004e7:	e8 42 56 00 00       	call   805b2e <eoi>
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
  800500:	e8 29 56 00 00       	call   805b2e <eoi>
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
  800519:	e8 10 56 00 00       	call   805b2e <eoi>
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
  800533:	e8 f6 55 00 00       	call   805b2e <eoi>
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
  80054d:	e8 dc 55 00 00       	call   805b2e <eoi>
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
  800571:	e8 b8 55 00 00       	call   805b2e <eoi>
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
  80058e:	e8 9b 55 00 00       	call   805b2e <eoi>
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
  8005d1:	48 05 60 3a 81 00    	add    rax,0x813a60
  8005d7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8005da:	3e ff e0             	notrack jmp rax
    {
        case 0:return reg_device(a);
  8005dd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8005e0:	48 98                	cdqe   
  8005e2:	48 89 c7             	mov    rdi,rax
  8005e5:	e8 e9 1f 00 00       	call   8025d3 <reg_device>
  8005ea:	e9 33 02 00 00       	jmp    800822 <syscall+0x288>
        case 1:return dispose_device(a);
  8005ef:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8005f2:	89 c7                	mov    edi,eax
  8005f4:	e8 39 2a 00 00       	call   803032 <dispose_device>
  8005f9:	e9 24 02 00 00       	jmp    800822 <syscall+0x288>
        case 2:return reg_driver(a);
  8005fe:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800601:	48 98                	cdqe   
  800603:	48 89 c7             	mov    rdi,rax
  800606:	e8 b0 22 00 00       	call   8028bb <reg_driver>
  80060b:	e9 12 02 00 00       	jmp    800822 <syscall+0x288>
        case 3:return dispose_driver(a);
  800610:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800613:	48 98                	cdqe   
  800615:	48 89 c7             	mov    rdi,rax
  800618:	e8 b3 2a 00 00       	call   8030d0 <dispose_driver>
  80061d:	e9 00 02 00 00       	jmp    800822 <syscall+0x288>
        case 4:return call_drv_func(a,b,c);
  800622:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800625:	48 98                	cdqe   
  800627:	48 89 c2             	mov    rdx,rax
  80062a:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  80062d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800630:	89 ce                	mov    esi,ecx
  800632:	89 c7                	mov    edi,eax
  800634:	e8 a2 27 00 00       	call   802ddb <call_drv_func>
  800639:	e9 e4 01 00 00       	jmp    800822 <syscall+0x288>
        case 5:return req_page_at(a,b);
  80063e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800641:	48 98                	cdqe   
  800643:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  800646:	89 d6                	mov    esi,edx
  800648:	48 89 c7             	mov    rdi,rax
  80064b:	e8 27 13 00 00       	call   801977 <req_page_at>
  800650:	e9 cd 01 00 00       	jmp    800822 <syscall+0x288>
        case 6:return free_page(a);
  800655:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800658:	48 98                	cdqe   
  80065a:	48 89 c7             	mov    rdi,rax
  80065d:	e8 e1 10 00 00       	call   801743 <free_page>
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
  800682:	e8 8f 3c 00 00       	call   804316 <reg_proc>
  800687:	e9 96 01 00 00       	jmp    800822 <syscall+0x288>
        case 8:del_proc(a);
  80068c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80068f:	89 c7                	mov    edi,eax
  800691:	e8 72 3a 00 00       	call   804108 <del_proc>
        case 10:chk_vm(a,b);
  800696:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  800699:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80069c:	89 d6                	mov    esi,edx
  80069e:	89 c7                	mov    edi,eax
  8006a0:	e8 ab 13 00 00       	call   801a50 <chk_vm>
        case 11:return sys_open(a,b);
  8006a5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006a8:	48 98                	cdqe   
  8006aa:	48 89 c2             	mov    rdx,rax
  8006ad:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8006b0:	89 c6                	mov    esi,eax
  8006b2:	48 89 d7             	mov    rdi,rdx
  8006b5:	e8 d6 6d 00 00       	call   807490 <sys_open>
  8006ba:	e9 63 01 00 00       	jmp    800822 <syscall+0x288>
        case 12:return sys_close(a);
  8006bf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006c2:	89 c7                	mov    edi,eax
  8006c4:	e8 de 70 00 00       	call   8077a7 <sys_close>
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
  8006e4:	e8 76 71 00 00       	call   80785f <sys_read>
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
  800704:	e8 06 72 00 00       	call   80790f <sys_write>
  800709:	e9 14 01 00 00       	jmp    800822 <syscall+0x288>
        case 15:return sys_lseek(a,b,c);
  80070e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  800711:	48 63 c8             	movsxd rcx,eax
  800714:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  800717:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80071a:	48 89 ce             	mov    rsi,rcx
  80071d:	89 c7                	mov    edi,eax
  80071f:	e8 9b 72 00 00       	call   8079bf <sys_lseek>
  800724:	e9 f9 00 00 00       	jmp    800822 <syscall+0x288>
        case 16:return sys_tell(a);
  800729:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80072c:	89 c7                	mov    edi,eax
  80072e:	e8 01 17 00 00       	call   801e34 <sys_tell>
  800733:	e9 ea 00 00 00       	jmp    800822 <syscall+0x288>
        case 17:return reg_vol(a,b,c);
  800738:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  80073b:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  80073e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800741:	89 ce                	mov    esi,ecx
  800743:	89 c7                	mov    edi,eax
  800745:	b8 00 00 00 00       	mov    eax,0x0
  80074a:	e8 da 15 00 00       	call   801d29 <reg_vol>
  80074f:	e9 ce 00 00 00       	jmp    800822 <syscall+0x288>
        case 18:return free_vol(a);
  800754:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800757:	89 c7                	mov    edi,eax
  800759:	b8 00 00 00 00       	mov    eax,0x0
  80075e:	e8 aa 15 00 00       	call   801d0d <free_vol>
  800763:	e9 ba 00 00 00       	jmp    800822 <syscall+0x288>
        case 19:return execute(a, NULL);
  800768:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80076b:	48 98                	cdqe   
  80076d:	be 00 00 00 00       	mov    esi,0x0
  800772:	48 89 c7             	mov    rdi,rax
  800775:	e8 6a 56 00 00       	call   805de4 <execute>
  80077a:	e9 a3 00 00 00       	jmp    800822 <syscall+0x288>
        case SYSCALL_EXIT:return sys_exit(a);
  80077f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800782:	89 c7                	mov    edi,eax
  800784:	e8 65 3b 00 00       	call   8042ee <sys_exit>
  800789:	e9 94 00 00 00       	jmp    800822 <syscall+0x288>
        case SYSCALL_CALL:return exec_call(a);
  80078e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800791:	48 98                	cdqe   
  800793:	48 89 c7             	mov    rdi,rax
  800796:	e8 40 58 00 00       	call   805fdb <exec_call>
  80079b:	e9 82 00 00 00       	jmp    800822 <syscall+0x288>
        case SYSCALL_MKFIFO:return sys_mkfifo(a);
  8007a0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007a3:	89 c7                	mov    edi,eax
  8007a5:	e8 04 14 00 00       	call   801bae <sys_mkfifo>
  8007aa:	eb 76                	jmp    800822 <syscall+0x288>
        case SYSCALL_MALLOC:return sys_malloc(a);
  8007ac:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007af:	89 c7                	mov    edi,eax
  8007b1:	e8 28 3d 00 00       	call   8044de <sys_malloc>
  8007b6:	eb 6a                	jmp    800822 <syscall+0x288>
        case SYSCALL_FREE:return sys_free(a);
  8007b8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007bb:	89 c7                	mov    edi,eax
  8007bd:	e8 aa 3e 00 00       	call   80466c <sys_free>
  8007c2:	eb 5e                	jmp    800822 <syscall+0x288>
        case SYSCALL_KB_READC:return sys_analyse_key();
  8007c4:	b8 00 00 00 00       	mov    eax,0x0
  8007c9:	e8 c1 77 00 00       	call   807f8f <sys_analyse_key>
  8007ce:	0f be c0             	movsx  eax,al
  8007d1:	eb 4f                	jmp    800822 <syscall+0x288>
        case SYSCALL_FIND_DEV:return sys_find_dev(a);
  8007d3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007d6:	48 98                	cdqe   
  8007d8:	48 89 c7             	mov    rdi,rax
  8007db:	e8 2b 22 00 00       	call   802a0b <sys_find_dev>
  8007e0:	eb 40                	jmp    800822 <syscall+0x288>
        case SYSCALL_FORK:return sys_fork();
  8007e2:	e8 92 41 00 00       	call   804979 <sys_fork>
  8007e7:	eb 39                	jmp    800822 <syscall+0x288>
        case SYSCALL_EXECVE:return sys_execve(a,b);
  8007e9:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8007ec:	48 98                	cdqe   
  8007ee:	48 89 c2             	mov    rdx,rax
  8007f1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007f4:	48 98                	cdqe   
  8007f6:	48 89 d6             	mov    rsi,rdx
  8007f9:	48 89 c7             	mov    rdi,rax
  8007fc:	e8 e5 56 00 00       	call   805ee6 <sys_execve>
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
  80081b:	e8 7d 22 00 00       	call   802a9d <sys_operate_dev>
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
  8008a7:	48 8b 04 c5 c8 3d 81 	mov    rax,QWORD PTR [rax*8+0x813dc8]
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
  80094b:	e8 2b 61 00 00       	call   806a7b <set_framebuffer>
  800950:	48 83 c4 30          	add    rsp,0x30

            init_framebuffer();
  800954:	b8 00 00 00 00       	mov    eax,0x0
  800959:	e8 7a 5f 00 00       	call   8068d8 <init_framebuffer>
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
  800b22:	e8 7e 5e 00 00       	call   8069a5 <init_font>
    //初始化区域
    //fill_rect(0,0,100,100,255);
    print("gamessis os loaded.\nkernel:>");
  800b27:	bf 88 3d 81 00       	mov    edi,0x813d88
  800b2c:	e8 0d 63 00 00       	call   806e3e <print>
    init_int();
  800b31:	b8 00 00 00 00       	mov    eax,0x0
  800b36:	e8 c5 f4 ff ff       	call   800000 <init_int>
    print("int loaded.\n");
  800b3b:	bf a5 3d 81 00       	mov    edi,0x813da5
  800b40:	e8 f9 62 00 00       	call   806e3e <print>
//    set_tss(0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000);
    init_memory();
  800b45:	b8 00 00 00 00       	mov    eax,0x0
  800b4a:	e8 ad 09 00 00       	call   8014fc <init_memory>
    init_com(PORT_COM1);
  800b4f:	bf f8 03 00 00       	mov    edi,0x3f8
  800b54:	e8 16 ac 00 00       	call   80b76f <init_com>
    com_puts("gamessis os loaded.",PORT_COM1);
  800b59:	be f8 03 00 00       	mov    esi,0x3f8
  800b5e:	bf b2 3d 81 00       	mov    edi,0x813db2
  800b63:	e8 09 ad 00 00       	call   80b871 <com_puts>
	init_paging();
  800b68:	b8 00 00 00 00       	mov    eax,0x0
  800b6d:	e8 99 06 00 00       	call   80120b <init_paging>
 	init_gdt();
  800b72:	b8 00 00 00 00       	mov    eax,0x0
  800b77:	e8 01 50 00 00       	call   805b7d <init_gdt>
    init_drvdev_man();
  800b7c:	b8 00 00 00 00       	mov    eax,0x0
  800b81:	e8 33 1a 00 00       	call   8025b9 <init_drvdev_man>
    init_proc();
  800b86:	b8 00 00 00 00       	mov    eax,0x0
  800b8b:	e8 14 29 00 00       	call   8034a4 <init_proc>
    //自带驱动
    //init_tty();
    init_kb();
  800b90:	b8 00 00 00 00       	mov    eax,0x0
  800b95:	e8 c1 72 00 00       	call   807e5b <init_kb>
//    init_disk();

    sti();
  800b9a:	fb                   	sti    
    DISK1_FAT32_FS_init();
  800b9b:	b8 00 00 00 00       	mov    eax,0x0
  800ba0:	e8 45 a6 00 00       	call   80b1ea <DISK1_FAT32_FS_init>

    manage_proc_lock=0;
  800ba5:	c7 05 d9 b6 00 00 00 	mov    DWORD PTR [rip+0xb6d9],0x0        # 80c288 <manage_proc_lock>
  800bac:	00 00 00 
//    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
//    mount_fs("fat16",p->par,vmalloc());

    while (1)
    {
        char c= sys_analyse_key();
  800baf:	b8 00 00 00 00       	mov    eax,0x0
  800bb4:	e8 d6 73 00 00       	call   807f8f <sys_analyse_key>
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
  800d20:	e8 19 61 00 00       	call   806e3e <print>
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
  800e6a:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x813e10
  800e71:	10 3e 81 00 
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
  800f0b:	48 8b 15 8e b3 00 00 	mov    rdx,QWORD PTR [rip+0xb38e]        # 80c2a0 <pml4>
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
  800f85:	e8 d7 a9 00 00       	call   80b961 <memset>
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
  801003:	e8 59 a9 00 00       	call   80b961 <memset>
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
  8010ff:	e8 5d a8 00 00       	call   80b961 <memset>
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
  80117d:	e8 df a7 00 00       	call   80b961 <memset>
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
  801224:	89 05 8e b0 00 00    	mov    DWORD PTR [rip+0xb08e],eax        # 80c2b8 <high_mem_base>
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
  8013be:	bf 18 3e 81 00       	mov    edi,0x813e18
  8013c3:	e8 76 5a 00 00       	call   806e3e <print>
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
  8013f7:	48 8b 05 a2 41 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc141a2]        # 4155a0 <current>
  8013fe:	48 8b 98 c0 00 00 00 	mov    rbx,QWORD PTR [rax+0xc0]
  801405:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801409:	48 25 00 f0 ff ff    	and    rax,0xfffffffffffff000
  80140f:	49 89 c4             	mov    r12,rax
  801412:	b8 00 00 00 00       	mov    eax,0x0
  801417:	e8 57 02 00 00       	call   801673 <req_a_page>
  80141c:	89 c7                	mov    edi,eax
  80141e:	e8 3f 04 00 00       	call   801862 <get_phyaddr>
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
  801448:	bf 22 3e 81 00       	mov    edi,0x813e22
  80144d:	e8 ec 59 00 00       	call   806e3e <print>
  801452:	eb 0a                	jmp    80145e <page_err+0xb0>
    p=err_code&4;
  801454:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801458:	83 e0 04             	and    eax,0x4
  80145b:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(!p)print("supervisor mode\n");else //puts("user mode");
  80145e:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801462:	75 0c                	jne    801470 <page_err+0xc2>
  801464:	bf 30 3e 81 00       	mov    edi,0x813e30
  801469:	e8 d0 59 00 00       	call   806e3e <print>
  80146e:	eb 0a                	jmp    80147a <page_err+0xcc>
    p=err_code&16;
  801470:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801474:	83 e0 10             	and    eax,0x10
  801477:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("an instruction tries to fetch\n");
  80147a:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80147e:	74 0a                	je     80148a <page_err+0xdc>
  801480:	bf 48 3e 81 00       	mov    edi,0x813e48
  801485:	e8 b4 59 00 00       	call   806e3e <print>
    unsigned int addr=0;
  80148a:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
    asm volatile("mov 8(%%rbp),%0":"=r"(addr));
  801491:	8b 45 08             	mov    eax,DWORD PTR [rbp+0x8]
  801494:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    printf("occurred at %x(paddr), %x(laddr)\n",addr,l_addr);
  801497:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80149b:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80149e:	89 c6                	mov    esi,eax
  8014a0:	bf 68 3e 81 00       	mov    edi,0x813e68
  8014a5:	b8 00 00 00 00       	mov    eax,0x0
  8014aa:	e8 78 f8 ff ff       	call   800d27 <printf>
    extern int cur_proc;
    extern struct process *task;
    if(task[cur_proc].pid==1)//系统进程
  8014af:	48 8b 15 ea 6f c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc06fea]        # 4084a0 <task>
  8014b6:	8b 05 70 41 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc14170]        # 41562c <cur_proc>
  8014bc:	48 98                	cdqe   
  8014be:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8014c5:	48 01 d0             	add    rax,rdx
  8014c8:	8b 00                	mov    eax,DWORD PTR [rax]
  8014ca:	83 f8 01             	cmp    eax,0x1
  8014cd:	75 11                	jne    8014e0 <page_err+0x132>
    {
        printf("sys died. please reboot.\n");
  8014cf:	bf 8a 3e 81 00       	mov    edi,0x813e8a
  8014d4:	b8 00 00 00 00       	mov    eax,0x0
  8014d9:	e8 49 f8 ff ff       	call   800d27 <printf>
        asm volatile("jmp .");
  8014de:	eb fe                	jmp    8014de <page_err+0x130>
    }
    //杀死问题进程
//    del_proc(cur_proc);
    // printf("killed the problem process.\n");
    // printf("shell:>");
    eoi();
  8014e0:	b8 00 00 00 00       	mov    eax,0x0
  8014e5:	e8 44 46 00 00       	call   805b2e <eoi>
    //这里对esp的加法是必要的，因为page fault多push了一个错误码，但是iret识别不了
    __asm__ volatile ("sti \r\n  leave\n add $8,%rsp \n iretq");
  8014ea:	fb                   	sti    
  8014eb:	c9                   	leave  
  8014ec:	48 83 c4 08          	add    rsp,0x8
  8014f0:	48 cf                	iretq  
}
  8014f2:	90                   	nop
  8014f3:	48 83 c4 20          	add    rsp,0x20
  8014f7:	5b                   	pop    rbx
  8014f8:	41 5c                	pop    r12
  8014fa:	5d                   	pop    rbp
  8014fb:	c3                   	ret    

00000000008014fc <init_memory>:
void init_memory()
{
  8014fc:	f3 0f 1e fa          	endbr64 
  801500:	55                   	push   rbp
  801501:	48 89 e5             	mov    rbp,rsp
    extern addr_t _knl_end,_knl_start;//lds中声明的内核的结尾地址，放置位图
    //获取内存大小
    size_t mem_size=mmap_struct[mmap_t_i-1].base+mmap_struct[mmap_t_i-1].len;
  801504:	8b 05 16 ed bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfed16]        # 400220 <mmap_t_i>
  80150a:	83 e8 01             	sub    eax,0x1
  80150d:	48 63 d0             	movsxd rdx,eax
  801510:	48 89 d0             	mov    rax,rdx
  801513:	48 01 c0             	add    rax,rax
  801516:	48 01 d0             	add    rax,rdx
  801519:	48 c1 e0 03          	shl    rax,0x3
  80151d:	48 05 40 00 40 00    	add    rax,0x400040
  801523:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  801526:	8b 05 f4 ec bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfecf4]        # 400220 <mmap_t_i>
  80152c:	83 e8 01             	sub    eax,0x1
  80152f:	48 63 d0             	movsxd rdx,eax
  801532:	48 89 d0             	mov    rax,rdx
  801535:	48 01 c0             	add    rax,rax
  801538:	48 01 d0             	add    rax,rdx
  80153b:	48 c1 e0 03          	shl    rax,0x3
  80153f:	48 05 48 00 40 00    	add    rax,0x400048
  801545:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801548:	48 01 c8             	add    rax,rcx
  80154b:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    //计算出所需内存页数量
    int pgc=mem_size/PAGE_SIZE;
  80154f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801553:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  80155a:	48 85 c0             	test   rax,rax
  80155d:	48 0f 48 c2          	cmovs  rax,rdx
  801561:	48 c1 f8 0c          	sar    rax,0xc
  801565:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    //计算出位图所需的字节数
    int pg_bytes=pgc/32;
  801568:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80156b:	8d 50 1f             	lea    edx,[rax+0x1f]
  80156e:	85 c0                	test   eax,eax
  801570:	0f 48 c2             	cmovs  eax,edx
  801573:	c1 f8 05             	sar    eax,0x5
  801576:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    page_map=(unsigned int*)PAGE_4K_ALIGN(0xc00000);
  801579:	48 c7 05 9c ea bf ff 	mov    QWORD PTR [rip+0xffffffffffbfea9c],0xc00000        # 400020 <page_map>
  801580:	00 00 c0 00 
    int* p=page_map;
  801584:	48 8b 05 95 ea bf ff 	mov    rax,QWORD PTR [rip+0xffffffffffbfea95]        # 400020 <page_map>
  80158b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    addr_t curp=0;
  80158f:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  801596:	00 
    for(int i=0;i<mmap_t_i;i++){
  801597:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80159e:	e9 91 00 00 00       	jmp    801634 <init_memory+0x138>
        int cont=0;
  8015a3:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
        if(mmap_struct[i].type!=MULTIBOOT_MEMORY_AVAILABLE)
  8015aa:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8015ad:	48 63 d0             	movsxd rdx,eax
  8015b0:	48 89 d0             	mov    rax,rdx
  8015b3:	48 01 c0             	add    rax,rax
  8015b6:	48 01 d0             	add    rax,rdx
  8015b9:	48 c1 e0 03          	shl    rax,0x3
  8015bd:	48 05 50 00 40 00    	add    rax,0x400050
  8015c3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8015c6:	48 83 f8 01          	cmp    rax,0x1
  8015ca:	74 07                	je     8015d3 <init_memory+0xd7>
            cont=-1;
  8015cc:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [rbp-0x10],0xffffffff
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  8015d3:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8015da:	eb 15                	jmp    8015f1 <init_memory+0xf5>
            *(p++)=cont;
  8015dc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8015e0:	48 8d 50 04          	lea    rdx,[rax+0x4]
  8015e4:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  8015e8:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8015eb:	89 10                	mov    DWORD PTR [rax],edx
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  8015ed:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8015f1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8015f4:	48 63 c8             	movsxd rcx,eax
  8015f7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8015fa:	48 63 d0             	movsxd rdx,eax
  8015fd:	48 89 d0             	mov    rax,rdx
  801600:	48 01 c0             	add    rax,rax
  801603:	48 01 d0             	add    rax,rdx
  801606:	48 c1 e0 03          	shl    rax,0x3
  80160a:	48 05 48 00 40 00    	add    rax,0x400048
  801610:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801613:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  80161a:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  801621:	ff 00 00 
  801624:	48 21 d0             	and    rax,rdx
  801627:	48 c1 e8 11          	shr    rax,0x11
  80162b:	48 39 c1             	cmp    rcx,rax
  80162e:	72 ac                	jb     8015dc <init_memory+0xe0>
    for(int i=0;i<mmap_t_i;i++){
  801630:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  801634:	8b 05 e6 eb bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfebe6]        # 400220 <mmap_t_i>
  80163a:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80163d:	0f 8c 60 ff ff ff    	jl     8015a3 <init_memory+0xa7>
        }
    }

    //低16M空间直接被内核占用
    for(int i=0;i<128;i++){
  801643:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  80164a:	eb 1d                	jmp    801669 <init_memory+0x16d>
        page_map[i]=0xffffffff;
  80164c:	48 8b 15 cd e9 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe9cd]        # 400020 <page_map>
  801653:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801656:	48 98                	cdqe   
  801658:	48 c1 e0 02          	shl    rax,0x2
  80165c:	48 01 d0             	add    rax,rdx
  80165f:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<128;i++){
  801665:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  801669:	83 7d e8 7f          	cmp    DWORD PTR [rbp-0x18],0x7f
  80166d:	7e dd                	jle    80164c <init_memory+0x150>
    }
}
  80166f:	90                   	nop
  801670:	90                   	nop
  801671:	5d                   	pop    rbp
  801672:	c3                   	ret    

0000000000801673 <req_a_page>:
/*
page_map存储方式:
0x00000000
little end
*/
addr_t req_a_page(){
  801673:	f3 0f 1e fa          	endbr64 
  801677:	55                   	push   rbp
  801678:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  80167b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801682:	e9 b0 00 00 00       	jmp    801737 <req_a_page+0xc4>
        for(int j=0;j<32;j++){
  801687:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80168e:	e9 96 00 00 00       	jmp    801729 <req_a_page+0xb6>
            unsigned int bit=page_map[i]&(1<<j);
  801693:	48 8b 15 86 e9 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe986]        # 400020 <page_map>
  80169a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80169d:	48 98                	cdqe   
  80169f:	48 c1 e0 02          	shl    rax,0x2
  8016a3:	48 01 d0             	add    rax,rdx
  8016a6:	8b 10                	mov    edx,DWORD PTR [rax]
  8016a8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8016ab:	be 01 00 00 00       	mov    esi,0x1
  8016b0:	89 c1                	mov    ecx,eax
  8016b2:	d3 e6                	shl    esi,cl
  8016b4:	89 f0                	mov    eax,esi
  8016b6:	21 d0                	and    eax,edx
  8016b8:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            if((i*32+j)*4096>=0x100000&&!bit)
  8016bb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8016be:	c1 e0 05             	shl    eax,0x5
  8016c1:	89 c2                	mov    edx,eax
  8016c3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8016c6:	01 d0                	add    eax,edx
  8016c8:	c1 e0 0c             	shl    eax,0xc
  8016cb:	3d ff ff 0f 00       	cmp    eax,0xfffff
  8016d0:	7e 53                	jle    801725 <req_a_page+0xb2>
  8016d2:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8016d6:	75 4d                	jne    801725 <req_a_page+0xb2>
            {
                page_map[i]=page_map[i]|(1<<j);
  8016d8:	48 8b 15 41 e9 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe941]        # 400020 <page_map>
  8016df:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8016e2:	48 98                	cdqe   
  8016e4:	48 c1 e0 02          	shl    rax,0x2
  8016e8:	48 01 d0             	add    rax,rdx
  8016eb:	8b 10                	mov    edx,DWORD PTR [rax]
  8016ed:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8016f0:	be 01 00 00 00       	mov    esi,0x1
  8016f5:	89 c1                	mov    ecx,eax
  8016f7:	d3 e6                	shl    esi,cl
  8016f9:	89 f0                	mov    eax,esi
  8016fb:	89 c6                	mov    esi,eax
  8016fd:	48 8b 0d 1c e9 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe91c]        # 400020 <page_map>
  801704:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801707:	48 98                	cdqe   
  801709:	48 c1 e0 02          	shl    rax,0x2
  80170d:	48 01 c8             	add    rax,rcx
  801710:	09 f2                	or     edx,esi
  801712:	89 10                	mov    DWORD PTR [rax],edx
                return i*32+j;//num of page
  801714:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801717:	c1 e0 05             	shl    eax,0x5
  80171a:	89 c2                	mov    edx,eax
  80171c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80171f:	01 d0                	add    eax,edx
  801721:	48 98                	cdqe   
  801723:	eb 1c                	jmp    801741 <req_a_page+0xce>
        for(int j=0;j<32;j++){
  801725:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801729:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  80172d:	0f 8e 60 ff ff ff    	jle    801693 <req_a_page+0x20>
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  801733:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801737:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  80173b:	0f 8e 46 ff ff ff    	jle    801687 <req_a_page+0x14>

            }
        }
    }
}
  801741:	5d                   	pop    rbp
  801742:	c3                   	ret    

0000000000801743 <free_page>:

int free_page(char *paddr){
  801743:	f3 0f 1e fa          	endbr64 
  801747:	55                   	push   rbp
  801748:	48 89 e5             	mov    rbp,rsp
  80174b:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=(int)paddr/4096;
  80174f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801753:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801759:	85 c0                	test   eax,eax
  80175b:	0f 48 c2             	cmovs  eax,edx
  80175e:	c1 f8 0c             	sar    eax,0xc
  801761:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  801764:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801767:	8d 50 1f             	lea    edx,[rax+0x1f]
  80176a:	85 c0                	test   eax,eax
  80176c:	0f 48 c2             	cmovs  eax,edx
  80176f:	c1 f8 05             	sar    eax,0x5
  801772:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  801775:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801778:	99                   	cdq    
  801779:	c1 ea 1b             	shr    edx,0x1b
  80177c:	01 d0                	add    eax,edx
  80177e:	83 e0 1f             	and    eax,0x1f
  801781:	29 d0                	sub    eax,edx
  801783:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    page_map[n]=page_map[n]&~(unsigned int)(1<<r);
  801786:	48 8b 15 93 e8 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe893]        # 400020 <page_map>
  80178d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801790:	48 98                	cdqe   
  801792:	48 c1 e0 02          	shl    rax,0x2
  801796:	48 01 d0             	add    rax,rdx
  801799:	8b 10                	mov    edx,DWORD PTR [rax]
  80179b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80179e:	be 01 00 00 00       	mov    esi,0x1
  8017a3:	89 c1                	mov    ecx,eax
  8017a5:	d3 e6                	shl    esi,cl
  8017a7:	89 f0                	mov    eax,esi
  8017a9:	f7 d0                	not    eax
  8017ab:	89 c6                	mov    esi,eax
  8017ad:	48 8b 0d 6c e8 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe86c]        # 400020 <page_map>
  8017b4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8017b7:	48 98                	cdqe   
  8017b9:	48 c1 e0 02          	shl    rax,0x2
  8017bd:	48 01 c8             	add    rax,rcx
  8017c0:	21 f2                	and    edx,esi
  8017c2:	89 10                	mov    DWORD PTR [rax],edx
}
  8017c4:	90                   	nop
  8017c5:	5d                   	pop    rbp
  8017c6:	c3                   	ret    

00000000008017c7 <free_pages_at>:

int free_pages_at(int base,int pgn){
  8017c7:	f3 0f 1e fa          	endbr64 
  8017cb:	55                   	push   rbp
  8017cc:	48 89 e5             	mov    rbp,rsp
  8017cf:	48 83 ec 18          	sub    rsp,0x18
  8017d3:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8017d6:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<pgn;i++){
  8017d9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8017e0:	eb 1b                	jmp    8017fd <free_pages_at+0x36>
        free_page(base+i*PAGE_4K_SIZE);
  8017e2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8017e5:	c1 e0 0c             	shl    eax,0xc
  8017e8:	89 c2                	mov    edx,eax
  8017ea:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8017ed:	01 d0                	add    eax,edx
  8017ef:	48 98                	cdqe   
  8017f1:	48 89 c7             	mov    rdi,rax
  8017f4:	e8 4a ff ff ff       	call   801743 <free_page>
    for(int i=0;i<pgn;i++){
  8017f9:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8017fd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801800:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  801803:	7c dd                	jl     8017e2 <free_pages_at+0x1b>
    }
}
  801805:	90                   	nop
  801806:	c9                   	leave  
  801807:	c3                   	ret    

0000000000801808 <check_page>:
int check_page(int num){
  801808:	f3 0f 1e fa          	endbr64 
  80180c:	55                   	push   rbp
  80180d:	48 89 e5             	mov    rbp,rsp
  801810:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int n=num/32;
  801813:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801816:	8d 50 1f             	lea    edx,[rax+0x1f]
  801819:	85 c0                	test   eax,eax
  80181b:	0f 48 c2             	cmovs  eax,edx
  80181e:	c1 f8 05             	sar    eax,0x5
  801821:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int r=num%32;
  801824:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801827:	99                   	cdq    
  801828:	c1 ea 1b             	shr    edx,0x1b
  80182b:	01 d0                	add    eax,edx
  80182d:	83 e0 1f             	and    eax,0x1f
  801830:	29 d0                	sub    eax,edx
  801832:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int bit=page_map[n]&(1<<r);
  801835:	48 8b 15 e4 e7 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe7e4]        # 400020 <page_map>
  80183c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80183f:	48 98                	cdqe   
  801841:	48 c1 e0 02          	shl    rax,0x2
  801845:	48 01 d0             	add    rax,rdx
  801848:	8b 10                	mov    edx,DWORD PTR [rax]
  80184a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80184d:	be 01 00 00 00       	mov    esi,0x1
  801852:	89 c1                	mov    ecx,eax
  801854:	d3 e6                	shl    esi,cl
  801856:	89 f0                	mov    eax,esi
  801858:	21 d0                	and    eax,edx
  80185a:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    return bit;
  80185d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  801860:	5d                   	pop    rbp
  801861:	c3                   	ret    

0000000000801862 <get_phyaddr>:
/*
 * 获得这个页对应的物理内存地址
 * */
int get_phyaddr(int num){
  801862:	f3 0f 1e fa          	endbr64 
  801866:	55                   	push   rbp
  801867:	48 89 e5             	mov    rbp,rsp
  80186a:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return num*0x1000;
  80186d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801870:	c1 e0 0c             	shl    eax,0xc
}
  801873:	5d                   	pop    rbp
  801874:	c3                   	ret    

0000000000801875 <set_page_item>:

void set_page_item(page_item *item_addr,int phy_addr,int attr)
{
  801875:	f3 0f 1e fa          	endbr64 
  801879:	55                   	push   rbp
  80187a:	48 89 e5             	mov    rbp,rsp
  80187d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  801881:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  801884:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    *item_addr=0;
  801887:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80188b:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *item_addr|=phy_addr&0xfffff000;
  801892:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801896:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801899:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80189c:	89 c0                	mov    eax,eax
  80189e:	25 00 f0 ff ff       	and    eax,0xfffff000
  8018a3:	48 09 c2             	or     rdx,rax
  8018a6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8018aa:	48 89 10             	mov    QWORD PTR [rax],rdx
    *item_addr|=attr;
  8018ad:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8018b1:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8018b4:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8018b7:	48 98                	cdqe   
  8018b9:	48 09 c2             	or     rdx,rax
  8018bc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8018c0:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  8018c3:	90                   	nop
  8018c4:	5d                   	pop    rbp
  8018c5:	c3                   	ret    

00000000008018c6 <set_1gb_pdpt>:
void set_1gb_pdpt(page_item* ppdpt,int pa,unsigned int extra_attr)
{
  8018c6:	f3 0f 1e fa          	endbr64 
  8018ca:	55                   	push   rbp
  8018cb:	48 89 e5             	mov    rbp,rsp
  8018ce:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8018d2:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  8018d5:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *ppdpt=0;
  8018d8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018dc:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *ppdpt|=PAGE_PRESENT|PDPTE_1GB|extra_attr;
  8018e3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018e7:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8018ea:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8018ed:	0c 81                	or     al,0x81
  8018ef:	89 c0                	mov    eax,eax
  8018f1:	48 09 c2             	or     rdx,rax
  8018f4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018f8:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffffc0000000ul;
  8018fb:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8018fe:	25 00 00 00 c0       	and    eax,0xc0000000
  801903:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *ppdpt|=hipa;
  801906:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80190a:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80190d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801910:	48 09 c2             	or     rdx,rax
  801913:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801917:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  80191a:	90                   	nop
  80191b:	5d                   	pop    rbp
  80191c:	c3                   	ret    

000000000080191d <set_2mb_pde>:
void set_2mb_pde(page_item *pde, int pa, int extra_attr)
{
  80191d:	f3 0f 1e fa          	endbr64 
  801921:	55                   	push   rbp
  801922:	48 89 e5             	mov    rbp,rsp
  801925:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  801929:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  80192c:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *pde=0;
  80192f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801933:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *pde|=PAGE_PRESENT|PAGE_4MB_PAGE|PDE_4MB_PAT|extra_attr;
  80193a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80193e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801941:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  801944:	0d 81 10 00 00       	or     eax,0x1081
  801949:	48 98                	cdqe   
  80194b:	48 09 c2             	or     rdx,rax
  80194e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801952:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffc00000;
  801955:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801958:	25 00 00 c0 ff       	and    eax,0xffc00000
  80195d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *pde|=hipa;
  801960:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801964:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801967:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80196a:	48 09 c2             	or     rdx,rax
  80196d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801971:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  801974:	90                   	nop
  801975:	5d                   	pop    rbp
  801976:	c3                   	ret    

0000000000801977 <req_page_at>:
        page_map[i]&=(u32)(1<<j);
    return ret;
} */
//在bitmap申请指定的页面,base默认0x1000对齐
addr_t req_page_at(addr_t base,int pgn)
{
  801977:	f3 0f 1e fa          	endbr64 
  80197b:	55                   	push   rbp
  80197c:	48 89 e5             	mov    rbp,rsp
  80197f:	48 83 ec 20          	sub    rsp,0x20
  801983:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  801987:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    if(base==0)//不指定地址
  80198a:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  80198f:	75 18                	jne    8019a9 <req_page_at+0x32>
    {
        return get_phyaddr(req_a_page());
  801991:	b8 00 00 00 00       	mov    eax,0x0
  801996:	e8 d8 fc ff ff       	call   801673 <req_a_page>
  80199b:	89 c7                	mov    edi,eax
  80199d:	e8 c0 fe ff ff       	call   801862 <get_phyaddr>
  8019a2:	48 98                	cdqe   
  8019a4:	e9 a5 00 00 00       	jmp    801a4e <req_page_at+0xd7>
    }
    if(!is_pgs_ava(base,pgn))return -1;//先检查
  8019a9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8019ad:	89 c2                	mov    edx,eax
  8019af:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8019b2:	89 c6                	mov    esi,eax
  8019b4:	89 d7                	mov    edi,edx
  8019b6:	e8 52 01 00 00       	call   801b0d <is_pgs_ava>
  8019bb:	85 c0                	test   eax,eax
  8019bd:	75 0c                	jne    8019cb <req_page_at+0x54>
  8019bf:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  8019c6:	e9 83 00 00 00       	jmp    801a4e <req_page_at+0xd7>
    int pgni=base/4096;
  8019cb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8019cf:	48 c1 e8 0c          	shr    rax,0xc
  8019d3:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int pgi=pgni/32;
  8019d6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8019d9:	8d 50 1f             	lea    edx,[rax+0x1f]
  8019dc:	85 c0                	test   eax,eax
  8019de:	0f 48 c2             	cmovs  eax,edx
  8019e1:	c1 f8 05             	sar    eax,0x5
  8019e4:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    int pgj=pgni%32;
  8019e7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8019ea:	99                   	cdq    
  8019eb:	c1 ea 1b             	shr    edx,0x1b
  8019ee:	01 d0                	add    eax,edx
  8019f0:	83 e0 1f             	and    eax,0x1f
  8019f3:	29 d0                	sub    eax,edx
  8019f5:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<pgn;i++)
  8019f8:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8019ff:	eb 40                	jmp    801a41 <req_page_at+0xca>
    {
        page_map[i]|=(1<<pgj);
  801a01:	48 8b 15 18 e6 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe618]        # 400020 <page_map>
  801a08:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a0b:	48 98                	cdqe   
  801a0d:	48 c1 e0 02          	shl    rax,0x2
  801a11:	48 01 d0             	add    rax,rdx
  801a14:	8b 10                	mov    edx,DWORD PTR [rax]
  801a16:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  801a19:	be 01 00 00 00       	mov    esi,0x1
  801a1e:	89 c1                	mov    ecx,eax
  801a20:	d3 e6                	shl    esi,cl
  801a22:	89 f0                	mov    eax,esi
  801a24:	89 c6                	mov    esi,eax
  801a26:	48 8b 0d f3 e5 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe5f3]        # 400020 <page_map>
  801a2d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a30:	48 98                	cdqe   
  801a32:	48 c1 e0 02          	shl    rax,0x2
  801a36:	48 01 c8             	add    rax,rcx
  801a39:	09 f2                	or     edx,esi
  801a3b:	89 10                	mov    DWORD PTR [rax],edx
    for(int i=0;i<pgn;i++)
  801a3d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801a41:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a44:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  801a47:	7c b8                	jl     801a01 <req_page_at+0x8a>
    }
    return 0;
  801a49:	b8 00 00 00 00       	mov    eax,0x0

}
  801a4e:	c9                   	leave  
  801a4f:	c3                   	ret    

0000000000801a50 <chk_vm>:
int chk_vm(int base, int pgn)
{
  801a50:	f3 0f 1e fa          	endbr64 
  801a54:	55                   	push   rbp
  801a55:	48 89 e5             	mov    rbp,rsp
  801a58:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801a5b:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int *pdet=0;
  801a5e:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  801a65:	00 
    asm volatile("mov %%cr3,%0":"=r"(pdet));
  801a66:	0f 20 d8             	mov    rax,cr3
  801a69:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int *pt=pdet[base/PAGE_INDEX_SIZE]&0xfffff000;
  801a6d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a70:	8d 90 ff ff 1f 00    	lea    edx,[rax+0x1fffff]
  801a76:	85 c0                	test   eax,eax
  801a78:	0f 48 c2             	cmovs  eax,edx
  801a7b:	c1 f8 15             	sar    eax,0x15
  801a7e:	48 98                	cdqe   
  801a80:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801a87:	00 
  801a88:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801a8c:	48 01 d0             	add    rax,rdx
  801a8f:	8b 00                	mov    eax,DWORD PTR [rax]
  801a91:	89 c0                	mov    eax,eax
  801a93:	25 00 f0 ff ff       	and    eax,0xfffff000
  801a98:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  801a9c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a9f:	8d 90 ff ff 1f 00    	lea    edx,[rax+0x1fffff]
  801aa5:	85 c0                	test   eax,eax
  801aa7:	0f 48 c2             	cmovs  eax,edx
  801aaa:	c1 f8 15             	sar    eax,0x15
  801aad:	48 98                	cdqe   
  801aaf:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801ab6:	00 
  801ab7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801abb:	48 01 d0             	add    rax,rdx
  801abe:	8b 00                	mov    eax,DWORD PTR [rax]
  801ac0:	83 e0 01             	and    eax,0x1
  801ac3:	85 c0                	test   eax,eax
  801ac5:	74 38                	je     801aff <chk_vm+0xaf>
    !(pt[base%PAGE_INDEX_SIZE/PAGE_SIZE]&PAGE_PRESENT))
  801ac7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801aca:	99                   	cdq    
  801acb:	c1 ea 0b             	shr    edx,0xb
  801ace:	01 d0                	add    eax,edx
  801ad0:	25 ff ff 1f 00       	and    eax,0x1fffff
  801ad5:	29 d0                	sub    eax,edx
  801ad7:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801add:	85 c0                	test   eax,eax
  801adf:	0f 48 c2             	cmovs  eax,edx
  801ae2:	c1 f8 0c             	sar    eax,0xc
  801ae5:	48 98                	cdqe   
  801ae7:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801aee:	00 
  801aef:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801af3:	48 01 d0             	add    rax,rdx
  801af6:	8b 00                	mov    eax,DWORD PTR [rax]
  801af8:	83 e0 01             	and    eax,0x1
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  801afb:	85 c0                	test   eax,eax
  801afd:	75 07                	jne    801b06 <chk_vm+0xb6>
    {
        return -1;
  801aff:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801b04:	eb 05                	jmp    801b0b <chk_vm+0xbb>
    }
    return 0;
  801b06:	b8 00 00 00 00       	mov    eax,0x0
}
  801b0b:	5d                   	pop    rbp
  801b0c:	c3                   	ret    

0000000000801b0d <is_pgs_ava>:
//查看指定区域的页内存是否可用
int is_pgs_ava(int base,int pgn)
{
  801b0d:	f3 0f 1e fa          	endbr64 
  801b11:	55                   	push   rbp
  801b12:	48 89 e5             	mov    rbp,rsp
  801b15:	48 83 ec 18          	sub    rsp,0x18
  801b19:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801b1c:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int pgi=base/4096;
  801b1f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801b22:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801b28:	85 c0                	test   eax,eax
  801b2a:	0f 48 c2             	cmovs  eax,edx
  801b2d:	c1 f8 0c             	sar    eax,0xc
  801b30:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    for(int i=0;i<pgn;i++)
  801b33:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801b3a:	eb 1e                	jmp    801b5a <is_pgs_ava+0x4d>
    {
        if(check_page(pgi+i)!=0)return 0;
  801b3c:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801b3f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b42:	01 d0                	add    eax,edx
  801b44:	89 c7                	mov    edi,eax
  801b46:	e8 bd fc ff ff       	call   801808 <check_page>
  801b4b:	85 c0                	test   eax,eax
  801b4d:	74 07                	je     801b56 <is_pgs_ava+0x49>
  801b4f:	b8 00 00 00 00       	mov    eax,0x0
  801b54:	eb 11                	jmp    801b67 <is_pgs_ava+0x5a>
    for(int i=0;i<pgn;i++)
  801b56:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801b5a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b5d:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  801b60:	7c da                	jl     801b3c <is_pgs_ava+0x2f>
    }
    return 1;
  801b62:	b8 01 00 00 00       	mov    eax,0x1

}
  801b67:	c9                   	leave  
  801b68:	c3                   	ret    

0000000000801b69 <setup_sys_vol>:
super_block sbs[MAX_SUPERBLOCKS];
fs_operations fs[MAX_FS];

buffer_head buffer_heads[NR_BUFFERHEADS];
int setup_sys_vol(void *disk_drv, void *fs_drv)
{
  801b69:	f3 0f 1e fa          	endbr64 
  801b6d:	55                   	push   rbp
  801b6e:	48 89 e5             	mov    rbp,rsp
  801b71:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  801b75:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    vols[0].name[0]='C';
  801b79:	c6 05 c0 e6 bf ff 43 	mov    BYTE PTR [rip+0xffffffffffbfe6c0],0x43        # 400240 <vols>
    vols[0].name[1]='\0';
  801b80:	c6 05 ba e6 bf ff 00 	mov    BYTE PTR [rip+0xffffffffffbfe6ba],0x0        # 400241 <vols+0x1>
    vols[0].disk_drv=disk_drv;
  801b87:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801b8b:	48 89 05 b6 e6 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe6b6],rax        # 400248 <vols+0x8>
    vols[0].fs_drv=fs_drv;
  801b92:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801b96:	48 89 05 b3 e6 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe6b3],rax        # 400250 <vols+0x10>
    vols[0].stat=VOLUME_STAT_READY;
  801b9d:	c7 05 b9 e6 bf ff 01 	mov    DWORD PTR [rip+0xffffffffffbfe6b9],0x1        # 400260 <vols+0x20>
  801ba4:	00 00 00 
    return 0;
  801ba7:	b8 00 00 00 00       	mov    eax,0x0
}
  801bac:	5d                   	pop    rbp
  801bad:	c3                   	ret    

0000000000801bae <sys_mkfifo>:
//返回管道描述符
int sys_mkfifo(int number)
{
  801bae:	f3 0f 1e fa          	endbr64 
  801bb2:	55                   	push   rbp
  801bb3:	48 89 e5             	mov    rbp,rsp
  801bb6:	48 83 ec 20          	sub    rsp,0x20
  801bba:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    //查重
    for(int i=0;i<MAX_FIFOS;i++)
  801bbd:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801bc4:	eb 38                	jmp    801bfe <sys_mkfifo+0x50>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801bc6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801bc9:	48 98                	cdqe   
  801bcb:	48 c1 e0 04          	shl    rax,0x4
  801bcf:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801bd5:	8b 00                	mov    eax,DWORD PTR [rax]
  801bd7:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801bda:	75 1e                	jne    801bfa <sys_mkfifo+0x4c>
  801bdc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801bdf:	48 98                	cdqe   
  801be1:	48 c1 e0 04          	shl    rax,0x4
  801be5:	48 05 68 1e 40 00    	add    rax,0x401e68
  801beb:	8b 00                	mov    eax,DWORD PTR [rax]
  801bed:	83 f8 01             	cmp    eax,0x1
  801bf0:	75 08                	jne    801bfa <sys_mkfifo+0x4c>
            return i;
  801bf2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801bf5:	e9 a6 00 00 00       	jmp    801ca0 <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801bfa:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801bfe:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801c02:	7e c2                	jle    801bc6 <sys_mkfifo+0x18>
        }
    }
    for(int i=0;i<MAX_FIFOS;i++)
  801c04:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801c0b:	e9 81 00 00 00       	jmp    801c91 <sys_mkfifo+0xe3>
    {
        if(fifos[i].flag==0) {
  801c10:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801c13:	48 98                	cdqe   
  801c15:	48 c1 e0 04          	shl    rax,0x4
  801c19:	48 05 68 1e 40 00    	add    rax,0x401e68
  801c1f:	8b 00                	mov    eax,DWORD PTR [rax]
  801c21:	85 c0                	test   eax,eax
  801c23:	75 68                	jne    801c8d <sys_mkfifo+0xdf>
            fifos[i].flag=1;
  801c25:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801c28:	48 98                	cdqe   
  801c2a:	48 c1 e0 04          	shl    rax,0x4
  801c2e:	48 05 68 1e 40 00    	add    rax,0x401e68
  801c34:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            fifos[i].id=number;
  801c3a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801c3d:	48 98                	cdqe   
  801c3f:	48 c1 e0 04          	shl    rax,0x4
  801c43:	48 8d 90 6c 1e 40 00 	lea    rdx,[rax+0x401e6c]
  801c4a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c4d:	89 02                	mov    DWORD PTR [rdx],eax
            fifos[i].size=CHUNK_SIZE;
  801c4f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801c52:	48 98                	cdqe   
  801c54:	48 c1 e0 04          	shl    rax,0x4
  801c58:	48 05 64 1e 40 00    	add    rax,0x401e64
  801c5e:	c7 00 00 10 00 00    	mov    DWORD PTR [rax],0x1000
            //分配内存
            fifos[i].pa= get_phyaddr(req_a_page());
  801c64:	b8 00 00 00 00       	mov    eax,0x0
  801c69:	e8 05 fa ff ff       	call   801673 <req_a_page>
  801c6e:	89 c7                	mov    edi,eax
  801c70:	e8 ed fb ff ff       	call   801862 <get_phyaddr>
  801c75:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801c78:	48 63 d2             	movsxd rdx,edx
  801c7b:	48 c1 e2 04          	shl    rdx,0x4
  801c7f:	48 81 c2 60 1e 40 00 	add    rdx,0x401e60
  801c86:	89 02                	mov    DWORD PTR [rdx],eax
            return i;
  801c88:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801c8b:	eb 13                	jmp    801ca0 <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801c8d:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801c91:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  801c95:	0f 8e 75 ff ff ff    	jle    801c10 <sys_mkfifo+0x62>
        }
    }
    return -1;
  801c9b:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801ca0:	c9                   	leave  
  801ca1:	c3                   	ret    

0000000000801ca2 <sys_rmfifo>:

int sys_rmfifo(int number)
{
  801ca2:	f3 0f 1e fa          	endbr64 
  801ca6:	55                   	push   rbp
  801ca7:	48 89 e5             	mov    rbp,rsp
  801caa:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_FIFOS;i++)
  801cad:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801cb4:	eb 4a                	jmp    801d00 <sys_rmfifo+0x5e>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801cb6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801cb9:	48 98                	cdqe   
  801cbb:	48 c1 e0 04          	shl    rax,0x4
  801cbf:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801cc5:	8b 00                	mov    eax,DWORD PTR [rax]
  801cc7:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801cca:	75 30                	jne    801cfc <sys_rmfifo+0x5a>
  801ccc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ccf:	48 98                	cdqe   
  801cd1:	48 c1 e0 04          	shl    rax,0x4
  801cd5:	48 05 68 1e 40 00    	add    rax,0x401e68
  801cdb:	8b 00                	mov    eax,DWORD PTR [rax]
  801cdd:	83 f8 01             	cmp    eax,0x1
  801ce0:	75 1a                	jne    801cfc <sys_rmfifo+0x5a>
            fifos[i].flag=0;
  801ce2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ce5:	48 98                	cdqe   
  801ce7:	48 c1 e0 04          	shl    rax,0x4
  801ceb:	48 05 68 1e 40 00    	add    rax,0x401e68
  801cf1:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            return i;
  801cf7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801cfa:	eb 0f                	jmp    801d0b <sys_rmfifo+0x69>
    for(int i=0;i<MAX_FIFOS;i++)
  801cfc:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801d00:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801d04:	7e b0                	jle    801cb6 <sys_rmfifo+0x14>
        }
    }
    return -1;
  801d06:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801d0b:	5d                   	pop    rbp
  801d0c:	c3                   	ret    

0000000000801d0d <free_vol>:
int free_vol(int voli)
{
  801d0d:	f3 0f 1e fa          	endbr64 
  801d11:	55                   	push   rbp
  801d12:	48 89 e5             	mov    rbp,rsp
  801d15:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    vols[0].stat=VOLUME_STAT_EMPTY;
  801d18:	c7 05 3e e5 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbfe53e],0x0        # 400260 <vols+0x20>
  801d1f:	00 00 00 
    return 0;
  801d22:	b8 00 00 00 00       	mov    eax,0x0
}
  801d27:	5d                   	pop    rbp
  801d28:	c3                   	ret    

0000000000801d29 <reg_vol>:

int reg_vol(int disk_drvi, int fs_drvi, char *name)
{
  801d29:	f3 0f 1e fa          	endbr64 
  801d2d:	55                   	push   rbp
  801d2e:	48 89 e5             	mov    rbp,rsp
  801d31:	48 83 ec 20          	sub    rsp,0x20
  801d35:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801d38:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  801d3b:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
    for(int i=0;i<MAX_VOLUMES;i++)
  801d3f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801d46:	e9 d8 00 00 00       	jmp    801e23 <reg_vol+0xfa>
    {
        if(vols[i].stat==VOLUME_STAT_EMPTY)
  801d4b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801d4e:	48 63 d0             	movsxd rdx,eax
  801d51:	48 89 d0             	mov    rax,rdx
  801d54:	48 c1 e0 02          	shl    rax,0x2
  801d58:	48 01 d0             	add    rax,rdx
  801d5b:	48 c1 e0 03          	shl    rax,0x3
  801d5f:	48 05 60 02 40 00    	add    rax,0x400260
  801d65:	8b 00                	mov    eax,DWORD PTR [rax]
  801d67:	85 c0                	test   eax,eax
  801d69:	0f 85 b0 00 00 00    	jne    801e1f <reg_vol+0xf6>
        {
            extern driver *drvs;
            vols[i].stat=VOLUME_STAT_READY;
  801d6f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801d72:	48 63 d0             	movsxd rdx,eax
  801d75:	48 89 d0             	mov    rax,rdx
  801d78:	48 c1 e0 02          	shl    rax,0x2
  801d7c:	48 01 d0             	add    rax,rdx
  801d7f:	48 c1 e0 03          	shl    rax,0x3
  801d83:	48 05 60 02 40 00    	add    rax,0x400260
  801d89:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            vols[i].fs= &fs[fs_drvi];
  801d8f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801d92:	48 63 d0             	movsxd rdx,eax
  801d95:	48 89 d0             	mov    rax,rdx
  801d98:	48 01 c0             	add    rax,rax
  801d9b:	48 01 d0             	add    rax,rdx
  801d9e:	48 c1 e0 03          	shl    rax,0x3
  801da2:	48 8d 88 80 23 40 00 	lea    rcx,[rax+0x402380]
  801da9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801dac:	48 63 d0             	movsxd rdx,eax
  801daf:	48 89 d0             	mov    rax,rdx
  801db2:	48 c1 e0 02          	shl    rax,0x2
  801db6:	48 01 d0             	add    rax,rdx
  801db9:	48 c1 e0 03          	shl    rax,0x3
  801dbd:	48 05 58 02 40 00    	add    rax,0x400258
  801dc3:	48 89 08             	mov    QWORD PTR [rax],rcx
            vols[i].disk_drv= get_drv(disk_drvi);
  801dc6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801dc9:	89 c7                	mov    edi,eax
  801dcb:	e8 3d 13 00 00       	call   80310d <get_drv>
  801dd0:	48 89 c2             	mov    rdx,rax
  801dd3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801dd6:	48 63 c8             	movsxd rcx,eax
  801dd9:	48 89 c8             	mov    rax,rcx
  801ddc:	48 c1 e0 02          	shl    rax,0x2
  801de0:	48 01 c8             	add    rax,rcx
  801de3:	48 c1 e0 03          	shl    rax,0x3
  801de7:	48 05 48 02 40 00    	add    rax,0x400248
  801ded:	48 89 10             	mov    QWORD PTR [rax],rdx
            strcpy(vols[i].name,name);
  801df0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801df3:	48 63 d0             	movsxd rdx,eax
  801df6:	48 89 d0             	mov    rax,rdx
  801df9:	48 c1 e0 02          	shl    rax,0x2
  801dfd:	48 01 d0             	add    rax,rdx
  801e00:	48 c1 e0 03          	shl    rax,0x3
  801e04:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801e0b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801e0f:	48 89 c6             	mov    rsi,rax
  801e12:	48 89 d7             	mov    rdi,rdx
  801e15:	e8 96 9b 00 00       	call   80b9b0 <strcpy>
            return i;
  801e1a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801e1d:	eb 13                	jmp    801e32 <reg_vol+0x109>
    for(int i=0;i<MAX_VOLUMES;i++)
  801e1f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801e23:	83 7d fc 19          	cmp    DWORD PTR [rbp-0x4],0x19
  801e27:	0f 8e 1e ff ff ff    	jle    801d4b <reg_vol+0x22>
        }
    }
    return -1;
  801e2d:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801e32:	c9                   	leave  
  801e33:	c3                   	ret    

0000000000801e34 <sys_tell>:
//    if(!f)return -1;
//    f->ptr=offset+origin;
//    return 0;
//}
int sys_tell(int fno)
{
  801e34:	f3 0f 1e fa          	endbr64 
  801e38:	55                   	push   rbp
  801e39:	48 89 e5             	mov    rbp,rsp
  801e3c:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    struct file* f=current->openf[fno];
  801e3f:	48 8b 05 5a 37 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1375a]        # 4155a0 <current>
  801e46:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  801e49:	48 63 d2             	movsxd rdx,edx
  801e4c:	48 83 c2 1a          	add    rdx,0x1a
  801e50:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  801e55:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return f->position;
  801e59:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801e5d:	48 8b 00             	mov    rax,QWORD PTR [rax]
}
  801e60:	5d                   	pop    rbp
  801e61:	c3                   	ret    

0000000000801e62 <get_vfs_entry>:
vfs_dir_entry *get_vfs_entry(int fno)
{
  801e62:	f3 0f 1e fa          	endbr64 
  801e66:	55                   	push   rbp
  801e67:	48 89 e5             	mov    rbp,rsp
  801e6a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801e6d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801e74:	eb 3f                	jmp    801eb5 <get_vfs_entry+0x53>
    {
        if(opened[i].fno==fno)
  801e76:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801e79:	48 63 d0             	movsxd rdx,eax
  801e7c:	48 89 d0             	mov    rax,rdx
  801e7f:	48 01 c0             	add    rax,rax
  801e82:	48 01 d0             	add    rax,rdx
  801e85:	48 c1 e0 05          	shl    rax,0x5
  801e89:	48 05 60 06 40 00    	add    rax,0x400660
  801e8f:	8b 00                	mov    eax,DWORD PTR [rax]
  801e91:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801e94:	75 1b                	jne    801eb1 <get_vfs_entry+0x4f>
        {
            return &opened[i];
  801e96:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801e99:	48 63 d0             	movsxd rdx,eax
  801e9c:	48 89 d0             	mov    rax,rdx
  801e9f:	48 01 c0             	add    rax,rax
  801ea2:	48 01 d0             	add    rax,rdx
  801ea5:	48 c1 e0 05          	shl    rax,0x5
  801ea9:	48 05 60 06 40 00    	add    rax,0x400660
  801eaf:	eb 0f                	jmp    801ec0 <get_vfs_entry+0x5e>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801eb1:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801eb5:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  801eb9:	7e bb                	jle    801e76 <get_vfs_entry+0x14>
        }
    }
    return NULL;
  801ebb:	b8 00 00 00 00       	mov    eax,0x0
}
  801ec0:	5d                   	pop    rbp
  801ec1:	c3                   	ret    

0000000000801ec2 <brelse>:

//释放缓冲区（只释放这一块）
int brelse(buffer_head* bh)
{
  801ec2:	f3 0f 1e fa          	endbr64 
  801ec6:	55                   	push   rbp
  801ec7:	48 89 e5             	mov    rbp,rsp
  801eca:	48 83 ec 10          	sub    rsp,0x10
  801ece:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    wait_on_buf(bh);
  801ed2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801ed6:	48 89 c7             	mov    rdi,rax
  801ed9:	e8 a0 04 00 00       	call   80237e <wait_on_buf>
    if(bh->b_count==0)return -1;
  801ede:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801ee2:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801ee6:	84 c0                	test   al,al
  801ee8:	75 07                	jne    801ef1 <brelse+0x2f>
  801eea:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801eef:	eb 32                	jmp    801f23 <brelse+0x61>
    bh->b_count--;
  801ef1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801ef5:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801ef9:	8d 50 ff             	lea    edx,[rax-0x1]
  801efc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f00:	88 50 14             	mov    BYTE PTR [rax+0x14],dl
    if(bh->b_count==0)
  801f03:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f07:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801f0b:	84 c0                	test   al,al
  801f0d:	75 0f                	jne    801f1e <brelse+0x5c>
        vmfree(bh->b_data);
  801f0f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f13:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801f16:	48 89 c7             	mov    rdi,rax
  801f19:	e8 2a f4 ff ff       	call   801348 <vmfree>
    return 0;
  801f1e:	b8 00 00 00 00       	mov    eax,0x0
}
  801f23:	c9                   	leave  
  801f24:	c3                   	ret    

0000000000801f25 <bread>:
//从设备中读取指定设备的指定块并返回缓冲区
buffer_head* bread(int dev,int blk)
{
  801f25:	f3 0f 1e fa          	endbr64 
  801f29:	55                   	push   rbp
  801f2a:	48 89 e5             	mov    rbp,rsp
  801f2d:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  801f34:	89 bd 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],edi
  801f3a:	89 b5 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],esi

    buffer_head *bh=get_buf(dev,blk);
  801f40:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  801f46:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  801f4c:	89 d6                	mov    esi,edx
  801f4e:	89 c7                	mov    edi,eax
  801f50:	e8 78 02 00 00       	call   8021cd <get_buf>
  801f55:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!bh)return -1;//申请失败
  801f59:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  801f5e:	75 09                	jne    801f69 <bread+0x44>
  801f60:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  801f67:	eb 75                	jmp    801fde <bread+0xb9>
    if(!bh->b_uptodate)
  801f69:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f6d:	0f b6 40 12          	movzx  eax,BYTE PTR [rax+0x12]
  801f71:	84 c0                	test   al,al
  801f73:	75 65                	jne    801fda <bread+0xb5>
    {
        driver_args arg;
        arg.dev=dev;
  801f75:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  801f7b:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
        arg.cmd=DRVF_READ;
  801f7e:	c7 45 d8 02 00 00 00 	mov    DWORD PTR [rbp-0x28],0x2
        arg.dist_addr=bh->b_data;
  801f85:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f89:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801f8c:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.len=BLOCK_SIZE;
  801f92:	c7 85 48 ff ff ff 00 	mov    DWORD PTR [rbp-0xb8],0x200
  801f99:	02 00 00 
        arg.lba=bh->b_blocknr;
  801f9c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801fa0:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  801fa4:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
        arg.sec_c=BLOCK_SIZE/512;//之后会改
  801faa:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  801fb1:	00 00 00 
        //lock_buffer(bh);//锁定缓冲块直到读取完成
        int reqi=make_request(&arg);
  801fb4:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  801fbb:	48 89 c7             	mov    rdi,rax
  801fbe:	e8 71 11 00 00       	call   803134 <make_request>
  801fc3:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        wait_on_req(reqi);
  801fc6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801fc9:	89 c7                	mov    edi,eax
  801fcb:	e8 77 14 00 00       	call   803447 <wait_on_req>
        clear_req(reqi);
  801fd0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801fd3:	89 c7                	mov    edi,eax
  801fd5:	e8 9d 14 00 00       	call   803477 <clear_req>
    }
    return bh;
  801fda:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  801fde:	c9                   	leave  
  801fdf:	c3                   	ret    

0000000000801fe0 <vfs_read_file>:


int vfs_read_file(vfs_dir_entry *f,char *buf,int len)
{
  801fe0:	f3 0f 1e fa          	endbr64 
  801fe4:	55                   	push   rbp
  801fe5:	48 89 e5             	mov    rbp,rsp
  801fe8:	48 83 ec 40          	sub    rsp,0x40
  801fec:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  801ff0:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  801ff4:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  801ff7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801ffb:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  801ffe:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  802001:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802005:	48 89 c7             	mov    rdi,rax
  802008:	e8 80 01 00 00       	call   80218d <get_according_bnr>
  80200d:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=bread(dev,block);
  802010:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  802013:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802016:	89 d6                	mov    esi,edx
  802018:	89 c7                	mov    edi,eax
  80201a:	e8 06 ff ff ff       	call   801f25 <bread>
  80201f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802023:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  802026:	ba 00 02 00 00       	mov    edx,0x200
  80202b:	39 d0                	cmp    eax,edx
  80202d:	0f 4f c2             	cmovg  eax,edx
  802030:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(buf,bh->b_data,size);
  802033:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  802036:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80203a:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80203d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802041:	48 89 ce             	mov    rsi,rcx
  802044:	48 89 c7             	mov    rdi,rax
  802047:	e8 66 98 00 00       	call   80b8b2 <memcpy>
        len-=BLOCK_SIZE;
  80204c:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  802053:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802057:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  80205a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80205d:	01 c2                	add    edx,eax
  80205f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802063:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        brelse(bh);
  802066:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80206a:	48 89 c7             	mov    rdi,rax
  80206d:	e8 50 fe ff ff       	call   801ec2 <brelse>
    }while(len>0);
  802072:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  802076:	7f 89                	jg     802001 <vfs_read_file+0x21>
    return 0;
  802078:	b8 00 00 00 00       	mov    eax,0x0
}
  80207d:	c9                   	leave  
  80207e:	c3                   	ret    

000000000080207f <vfs_write_file>:
int vfs_write_file(vfs_dir_entry *f,char *buf,int len)
{
  80207f:	f3 0f 1e fa          	endbr64 
  802083:	55                   	push   rbp
  802084:	48 89 e5             	mov    rbp,rsp
  802087:	48 83 ec 40          	sub    rsp,0x40
  80208b:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80208f:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  802093:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  802096:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80209a:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  80209d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  8020a0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8020a4:	48 89 c7             	mov    rdi,rax
  8020a7:	e8 e1 00 00 00       	call   80218d <get_according_bnr>
  8020ac:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=get_buf(dev,block);
  8020af:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  8020b2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8020b5:	89 d6                	mov    esi,edx
  8020b7:	89 c7                	mov    edi,eax
  8020b9:	e8 0f 01 00 00       	call   8021cd <get_buf>
  8020be:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  8020c2:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8020c5:	ba 00 02 00 00       	mov    edx,0x200
  8020ca:	39 d0                	cmp    eax,edx
  8020cc:	0f 4f c2             	cmovg  eax,edx
  8020cf:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(bh->b_data,buf,size);
  8020d2:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8020d5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8020d9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8020dc:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  8020e0:	48 89 ce             	mov    rsi,rcx
  8020e3:	48 89 c7             	mov    rdi,rax
  8020e6:	e8 c7 97 00 00       	call   80b8b2 <memcpy>
        len-=BLOCK_SIZE;
  8020eb:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  8020f2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8020f6:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8020f9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8020fc:	01 c2                	add    edx,eax
  8020fe:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802102:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        bh->b_dirt=1;//修改置位
  802105:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802109:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  80210d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802111:	48 89 c7             	mov    rdi,rax
  802114:	e8 a9 fd ff ff       	call   801ec2 <brelse>
    }while(len>0);
  802119:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  80211d:	7f 81                	jg     8020a0 <vfs_write_file+0x21>
    return 0;
  80211f:	b8 00 00 00 00       	mov    eax,0x0
}
  802124:	c9                   	leave  
  802125:	c3                   	ret    

0000000000802126 <vfs_seek_file>:

int vfs_seek_file(vfs_dir_entry *f,int offset,int origin)
{
  802126:	f3 0f 1e fa          	endbr64 
  80212a:	55                   	push   rbp
  80212b:	48 89 e5             	mov    rbp,rsp
  80212e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  802132:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  802135:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    switch (origin)
  802138:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  80213c:	74 35                	je     802173 <vfs_seek_file+0x4d>
  80213e:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  802142:	7f 3f                	jg     802183 <vfs_seek_file+0x5d>
  802144:	83 7d f0 00          	cmp    DWORD PTR [rbp-0x10],0x0
  802148:	74 08                	je     802152 <vfs_seek_file+0x2c>
  80214a:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  80214e:	74 0e                	je     80215e <vfs_seek_file+0x38>
        break;
    case SEEK_END:
        f->ptr=f->size;
        break;
    default:
        break;
  802150:	eb 31                	jmp    802183 <vfs_seek_file+0x5d>
        f->ptr=offset;
  802152:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802156:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802159:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  80215c:	eb 26                	jmp    802184 <vfs_seek_file+0x5e>
        f->ptr+=offset;
  80215e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802162:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  802165:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802168:	01 c2                	add    edx,eax
  80216a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80216e:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  802171:	eb 11                	jmp    802184 <vfs_seek_file+0x5e>
        f->ptr=f->size;
  802173:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802177:	8b 50 18             	mov    edx,DWORD PTR [rax+0x18]
  80217a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80217e:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  802181:	eb 01                	jmp    802184 <vfs_seek_file+0x5e>
        break;
  802183:	90                   	nop
    }
    return f->ptr;
  802184:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802188:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  80218b:	5d                   	pop    rbp
  80218c:	c3                   	ret    

000000000080218d <get_according_bnr>:
//返回文件ptr在块设备中的块号
int get_according_bnr(vfs_dir_entry *f)
{
  80218d:	f3 0f 1e fa          	endbr64 
  802191:	55                   	push   rbp
  802192:	48 89 e5             	mov    rbp,rsp
  802195:	48 83 ec 10          	sub    rsp,0x10
  802199:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return vols[f->voln].fs->get_according_bnr(f);
  80219d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021a1:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8021a4:	48 63 d0             	movsxd rdx,eax
  8021a7:	48 89 d0             	mov    rax,rdx
  8021aa:	48 c1 e0 02          	shl    rax,0x2
  8021ae:	48 01 d0             	add    rax,rdx
  8021b1:	48 c1 e0 03          	shl    rax,0x3
  8021b5:	48 05 58 02 40 00    	add    rax,0x400258
  8021bb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8021be:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  8021c2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021c6:	48 89 c7             	mov    rdi,rax
  8021c9:	ff d2                	call   rdx

}
  8021cb:	c9                   	leave  
  8021cc:	c3                   	ret    

00000000008021cd <get_buf>:
//获取或者新建一个和dev上block相对应的缓冲区。
buffer_head* get_buf(int dev,int block)
{
  8021cd:	f3 0f 1e fa          	endbr64 
  8021d1:	55                   	push   rbp
  8021d2:	48 89 e5             	mov    rbp,rsp
  8021d5:	48 83 ec 20          	sub    rsp,0x20
  8021d9:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8021dc:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8021df:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8021e6:	e9 b9 00 00 00       	jmp    8022a4 <get_buf+0xd7>
    {
        if(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block)
  8021eb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8021ee:	48 98                	cdqe   
  8021f0:	48 c1 e0 06          	shl    rax,0x6
  8021f4:	48 05 90 26 40 00    	add    rax,0x402690
  8021fa:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8021fd:	0f b7 c0             	movzx  eax,ax
  802200:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  802203:	0f 85 97 00 00 00    	jne    8022a0 <get_buf+0xd3>
  802209:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80220c:	48 98                	cdqe   
  80220e:	48 c1 e0 06          	shl    rax,0x6
  802212:	48 05 88 26 40 00    	add    rax,0x402688
  802218:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80221b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80221e:	48 98                	cdqe   
  802220:	48 39 c2             	cmp    rdx,rax
  802223:	75 7b                	jne    8022a0 <get_buf+0xd3>
        {
            repeat:
  802225:	90                   	nop
            wait_on_buf(&buffer_heads[i]);//等待解锁
  802226:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802229:	48 98                	cdqe   
  80222b:	48 c1 e0 06          	shl    rax,0x6
  80222f:	48 05 80 26 40 00    	add    rax,0x402680
  802235:	48 89 c7             	mov    rdi,rax
  802238:	e8 41 01 00 00       	call   80237e <wait_on_buf>
            if(buffer_heads[i].b_count>0)//别的进程正在用
  80223d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802240:	48 98                	cdqe   
  802242:	48 c1 e0 06          	shl    rax,0x6
  802246:	48 05 94 26 40 00    	add    rax,0x402694
  80224c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80224f:	84 c0                	test   al,al
  802251:	74 02                	je     802255 <get_buf+0x88>
                goto repeat;
  802253:	eb d1                	jmp    802226 <get_buf+0x59>
            if(!(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block))//别的进程修改了
  802255:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802258:	48 98                	cdqe   
  80225a:	48 c1 e0 06          	shl    rax,0x6
  80225e:	48 05 90 26 40 00    	add    rax,0x402690
  802264:	0f b7 00             	movzx  eax,WORD PTR [rax]
  802267:	0f b7 c0             	movzx  eax,ax
  80226a:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80226d:	75 30                	jne    80229f <get_buf+0xd2>
  80226f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802272:	48 98                	cdqe   
  802274:	48 c1 e0 06          	shl    rax,0x6
  802278:	48 05 88 26 40 00    	add    rax,0x402688
  80227e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802281:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802284:	48 98                	cdqe   
  802286:	48 39 c2             	cmp    rdx,rax
  802289:	75 14                	jne    80229f <get_buf+0xd2>
                continue;
            return &buffer_heads[i];
  80228b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80228e:	48 98                	cdqe   
  802290:	48 c1 e0 06          	shl    rax,0x6
  802294:	48 05 80 26 40 00    	add    rax,0x402680
  80229a:	e9 dd 00 00 00       	jmp    80237c <get_buf+0x1af>
                continue;
  80229f:	90                   	nop
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8022a0:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8022a4:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  8022a8:	0f 8e 3d ff ff ff    	jle    8021eb <get_buf+0x1e>
        }
    }
    //空头中找
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8022ae:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8022b5:	e9 b8 00 00 00       	jmp    802372 <get_buf+0x1a5>
    {
        if(buffer_heads[i].b_count==0)
  8022ba:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8022bd:	48 98                	cdqe   
  8022bf:	48 c1 e0 06          	shl    rax,0x6
  8022c3:	48 05 94 26 40 00    	add    rax,0x402694
  8022c9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8022cc:	84 c0                	test   al,al
  8022ce:	0f 85 9a 00 00 00    	jne    80236e <get_buf+0x1a1>
        {
            if(buffer_heads[i].b_dirt)
  8022d4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8022d7:	48 98                	cdqe   
  8022d9:	48 c1 e0 06          	shl    rax,0x6
  8022dd:	48 05 93 26 40 00    	add    rax,0x402693
  8022e3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8022e6:	84 c0                	test   al,al
  8022e8:	74 2e                	je     802318 <get_buf+0x14b>
            {
                sync_buf(&buffer_heads[i]);
  8022ea:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8022ed:	48 98                	cdqe   
  8022ef:	48 c1 e0 06          	shl    rax,0x6
  8022f3:	48 05 80 26 40 00    	add    rax,0x402680
  8022f9:	48 89 c7             	mov    rdi,rax
  8022fc:	e8 1b 01 00 00       	call   80241c <sync_buf>
                wait_on_buf(&buffer_heads[i]);
  802301:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802304:	48 98                	cdqe   
  802306:	48 c1 e0 06          	shl    rax,0x6
  80230a:	48 05 80 26 40 00    	add    rax,0x402680
  802310:	48 89 c7             	mov    rdi,rax
  802313:	e8 66 00 00 00       	call   80237e <wait_on_buf>
            }
            buffer_heads[i].b_count++;
  802318:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80231b:	48 98                	cdqe   
  80231d:	48 c1 e0 06          	shl    rax,0x6
  802321:	48 05 94 26 40 00    	add    rax,0x402694
  802327:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80232a:	8d 50 01             	lea    edx,[rax+0x1]
  80232d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802330:	48 98                	cdqe   
  802332:	48 c1 e0 06          	shl    rax,0x6
  802336:	48 05 94 26 40 00    	add    rax,0x402694
  80233c:	88 10                	mov    BYTE PTR [rax],dl
            //给buffer分配一个实际的缓冲区
            buffer_heads[i].b_data=vmalloc();
  80233e:	b8 00 00 00 00       	mov    eax,0x0
  802343:	e8 71 ef ff ff       	call   8012b9 <vmalloc>
  802348:	48 89 c2             	mov    rdx,rax
  80234b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80234e:	48 98                	cdqe   
  802350:	48 c1 e0 06          	shl    rax,0x6
  802354:	48 05 80 26 40 00    	add    rax,0x402680
  80235a:	48 89 10             	mov    QWORD PTR [rax],rdx
            return &buffer_heads[i];
  80235d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802360:	48 98                	cdqe   
  802362:	48 c1 e0 06          	shl    rax,0x6
  802366:	48 05 80 26 40 00    	add    rax,0x402680
  80236c:	eb 0e                	jmp    80237c <get_buf+0x1af>
    for(int i=0;i<NR_BUFFERHEADS;i++)
  80236e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  802372:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  802376:	0f 8e 3e ff ff ff    	jle    8022ba <get_buf+0xed>
        }
    }
}
  80237c:	c9                   	leave  
  80237d:	c3                   	ret    

000000000080237e <wait_on_buf>:

void wait_on_buf(buffer_head* bh)
{
  80237e:	f3 0f 1e fa          	endbr64 
  802382:	55                   	push   rbp
  802383:	48 89 e5             	mov    rbp,rsp
  802386:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    //等待缓冲区解锁
    while (bh->b_lock);
  80238a:	90                   	nop
  80238b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80238f:	0f b6 40 15          	movzx  eax,BYTE PTR [rax+0x15]
  802393:	84 c0                	test   al,al
  802395:	75 f4                	jne    80238b <wait_on_buf+0xd>
    
}
  802397:	90                   	nop
  802398:	90                   	nop
  802399:	5d                   	pop    rbp
  80239a:	c3                   	ret    

000000000080239b <scan_dev>:

//扫描块设备，读取分区，识别文件系统
int scan_dev(int dev)
{
  80239b:	f3 0f 1e fa          	endbr64 
  80239f:	55                   	push   rbp
  8023a0:	48 89 e5             	mov    rbp,rsp
  8023a3:	48 83 ec 30          	sub    rsp,0x30
  8023a7:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
//    device *blkdev=get_dev(dev);
//    buffer_head* bh=bread(dev,0);
//    if(!bh)return -1;
    char* buf=vmalloc();
  8023aa:	b8 00 00 00 00       	mov    eax,0x0
  8023af:	e8 05 ef ff ff       	call   8012b9 <vmalloc>
  8023b4:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    int r=request(DISK_MAJOR_MAJOR,DISK_CMD_READ,0,1,buf);
  8023b8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8023bc:	49 89 c0             	mov    r8,rax
  8023bf:	b9 01 00 00 00       	mov    ecx,0x1
  8023c4:	ba 00 00 00 00       	mov    edx,0x0
  8023c9:	be 20 00 00 00       	mov    esi,0x20
  8023ce:	bf 00 00 00 00       	mov    edi,0x0
  8023d3:	e8 c6 5e 00 00       	call   80829e <request>
  8023d8:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    chk_result(r);
  8023db:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8023de:	89 c7                	mov    edi,eax
  8023e0:	e8 6d 65 00 00       	call   808952 <chk_result>

    dpt_t* dpte=buf+0x1be;
  8023e5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8023e9:	48 05 be 01 00 00    	add    rax,0x1be
  8023ef:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(int i=0;i<4;i++)
  8023f3:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8023fa:	eb 13                	jmp    80240f <scan_dev+0x74>
    {
//        blkdev->par[i].type=dpte->type;
        int stlba=dpte->start_lba;
  8023fc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802400:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802403:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
//        {
//            printf("err:unrecognised partition fs.\n");
//        }

//        blkdev->par[i].end_sec=dpte->end_lba;
        dpte++;
  802406:	48 83 45 f8 10       	add    QWORD PTR [rbp-0x8],0x10
    for(int i=0;i<4;i++)
  80240b:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80240f:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  802413:	7e e7                	jle    8023fc <scan_dev+0x61>
    }
//    brelse(bh);
    return 0;
  802415:	b8 00 00 00 00       	mov    eax,0x0
}
  80241a:	c9                   	leave  
  80241b:	c3                   	ret    

000000000080241c <sync_buf>:

int sync_buf(buffer_head* bh)
{
  80241c:	f3 0f 1e fa          	endbr64 
  802420:	55                   	push   rbp
  802421:	48 89 e5             	mov    rbp,rsp
  802424:	48 83 ec 20          	sub    rsp,0x20
  802428:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int dev=bh->b_dev;
  80242c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802430:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
  802434:	0f b7 c0             	movzx  eax,ax
  802437:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int block=bh->b_blocknr;
  80243a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80243e:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  802442:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //这里需要调用块设备写函数write_block
    return write_block(dev,block,bh->b_data,BLOCK_SIZE);
  802445:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802449:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80244c:	8b 75 f8             	mov    esi,DWORD PTR [rbp-0x8]
  80244f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802452:	b9 00 02 00 00       	mov    ecx,0x200
  802457:	89 c7                	mov    edi,eax
  802459:	e8 02 00 00 00       	call   802460 <write_block>

}
  80245e:	c9                   	leave  
  80245f:	c3                   	ret    

0000000000802460 <write_block>:
//操作块设备函数
int write_block(int dev,int block,char *buf,int len)
{
  802460:	f3 0f 1e fa          	endbr64 
  802464:	55                   	push   rbp
  802465:	48 89 e5             	mov    rbp,rsp
  802468:	48 83 ec 30          	sub    rsp,0x30
  80246c:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80246f:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  802472:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  802476:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=get_buf(dev,block);
  802479:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80247c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80247f:	89 d6                	mov    esi,edx
  802481:	89 c7                	mov    edi,eax
  802483:	e8 45 fd ff ff       	call   8021cd <get_buf>
  802488:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  80248c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80248f:	ba 00 02 00 00       	mov    edx,0x200
  802494:	39 d0                	cmp    eax,edx
  802496:	0f 4f c2             	cmovg  eax,edx
  802499:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(bh->b_data,buf,size);
  80249c:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80249f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8024a3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8024a6:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  8024aa:	48 89 ce             	mov    rsi,rcx
  8024ad:	48 89 c7             	mov    rdi,rax
  8024b0:	e8 fd 93 00 00       	call   80b8b2 <memcpy>
        len-=BLOCK_SIZE;
  8024b5:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        bh->b_dirt=1;//修改置位
  8024bc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8024c0:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  8024c4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8024c8:	48 89 c7             	mov    rdi,rax
  8024cb:	e8 f2 f9 ff ff       	call   801ec2 <brelse>
    }while(len>0);
  8024d0:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  8024d4:	7f a3                	jg     802479 <write_block+0x19>
    return 0;
  8024d6:	b8 00 00 00 00       	mov    eax,0x0
}
  8024db:	c9                   	leave  
  8024dc:	c3                   	ret    

00000000008024dd <read_block>:
int read_block(int dev,int block,char* buf,int len)
{
  8024dd:	f3 0f 1e fa          	endbr64 
  8024e1:	55                   	push   rbp
  8024e2:	48 89 e5             	mov    rbp,rsp
  8024e5:	48 83 ec 30          	sub    rsp,0x30
  8024e9:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8024ec:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8024ef:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  8024f3:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=bread(dev,block);
  8024f6:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8024f9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8024fc:	89 d6                	mov    esi,edx
  8024fe:	89 c7                	mov    edi,eax
  802500:	e8 20 fa ff ff       	call   801f25 <bread>
  802505:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802509:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80250c:	ba 00 02 00 00       	mov    edx,0x200
  802511:	39 d0                	cmp    eax,edx
  802513:	0f 4f c2             	cmovg  eax,edx
  802516:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(buf,bh->b_data,size);
  802519:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80251c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802520:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802523:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802527:	48 89 ce             	mov    rsi,rcx
  80252a:	48 89 c7             	mov    rdi,rax
  80252d:	e8 80 93 00 00       	call   80b8b2 <memcpy>
        len-=BLOCK_SIZE;
  802532:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        brelse(bh);
  802539:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80253d:	48 89 c7             	mov    rdi,rax
  802540:	e8 7d f9 ff ff       	call   801ec2 <brelse>
    }while(len>0);
  802545:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  802549:	7f ab                	jg     8024f6 <read_block+0x19>
    return 0;
  80254b:	b8 00 00 00 00       	mov    eax,0x0
}
  802550:	c9                   	leave  
  802551:	c3                   	ret    

0000000000802552 <init_vfs>:

int init_vfs()
{
  802552:	f3 0f 1e fa          	endbr64 
  802556:	55                   	push   rbp
  802557:	48 89 e5             	mov    rbp,rsp
  80255a:	48 83 ec 10          	sub    rsp,0x10
    //扫描块设备
    extern device *dev_tree[];
    extern device devs[];
    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
  80255e:	48 8b 05 1b 5f c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05f1b]        # 408480 <dev_tree>
  802565:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(;p;p=p->next)
  802569:	eb 40                	jmp    8025ab <init_vfs+0x59>
    {
        if(scan_dev(p-devs)!=0)return -1;
  80256b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80256f:	48 2d 80 2e 40 00    	sub    rax,0x402e80
  802575:	48 c1 f8 02          	sar    rax,0x2
  802579:	48 89 c2             	mov    rdx,rax
  80257c:	48 b8 19 9c 8f c1 f9 	movabs rax,0x8f9c18f9c18f9c19
  802583:	18 9c 8f 
  802586:	48 0f af c2          	imul   rax,rdx
  80258a:	89 c7                	mov    edi,eax
  80258c:	e8 0a fe ff ff       	call   80239b <scan_dev>
  802591:	85 c0                	test   eax,eax
  802593:	74 07                	je     80259c <init_vfs+0x4a>
  802595:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80259a:	eb 1b                	jmp    8025b7 <init_vfs+0x65>
    for(;p;p=p->next)
  80259c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8025a0:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  8025a7:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  8025ab:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8025b0:	75 b9                	jne    80256b <init_vfs+0x19>
    }

    return 0;
  8025b2:	b8 00 00 00 00       	mov    eax,0x0
}
  8025b7:	c9                   	leave  
  8025b8:	c3                   	ret    

00000000008025b9 <init_drvdev_man>:
    [OPERATIONS_KEYBOARD]=NULL,
    [OPERATIONS_MOUSE]=NULL
};
static int rhead=0,rtail=0;
int init_drvdev_man()
{
  8025b9:	f3 0f 1e fa          	endbr64 
  8025bd:	55                   	push   rbp
  8025be:	48 89 e5             	mov    rbp,rsp
}
  8025c1:	90                   	nop
  8025c2:	5d                   	pop    rbp
  8025c3:	c3                   	ret    

00000000008025c4 <load_driver>:
int load_driver(char *path)
{
  8025c4:	f3 0f 1e fa          	endbr64 
  8025c8:	55                   	push   rbp
  8025c9:	48 89 e5             	mov    rbp,rsp
  8025cc:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    
}
  8025d0:	90                   	nop
  8025d1:	5d                   	pop    rbp
  8025d2:	c3                   	ret    

00000000008025d3 <reg_device>:

int reg_device(device* dev)
{
  8025d3:	f3 0f 1e fa          	endbr64 
  8025d7:	55                   	push   rbp
  8025d8:	48 89 e5             	mov    rbp,rsp
  8025db:	53                   	push   rbx
  8025dc:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //TODO:查重

    //放入数组
    int i=0;
  8025e0:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<MAX_DEVICES;i++)
  8025e7:	e9 42 01 00 00       	jmp    80272e <reg_device+0x15b>
    {
        if(devs[i].flag==DEV_FLAG_EMPTY)
  8025ec:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8025ef:	48 63 d0             	movsxd rdx,eax
  8025f2:	48 89 d0             	mov    rax,rdx
  8025f5:	48 c1 e0 02          	shl    rax,0x2
  8025f9:	48 01 d0             	add    rax,rdx
  8025fc:	48 c1 e0 02          	shl    rax,0x2
  802600:	48 01 d0             	add    rax,rdx
  802603:	48 c1 e0 03          	shl    rax,0x3
  802607:	48 05 90 2e 40 00    	add    rax,0x402e90
  80260d:	8b 00                	mov    eax,DWORD PTR [rax]
  80260f:	85 c0                	test   eax,eax
  802611:	0f 85 13 01 00 00    	jne    80272a <reg_device+0x157>
        {
            devs[i]=*dev;
  802617:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80261a:	48 63 d0             	movsxd rdx,eax
  80261d:	48 89 d0             	mov    rax,rdx
  802620:	48 c1 e0 02          	shl    rax,0x2
  802624:	48 01 d0             	add    rax,rdx
  802627:	48 c1 e0 02          	shl    rax,0x2
  80262b:	48 01 d0             	add    rax,rdx
  80262e:	48 c1 e0 03          	shl    rax,0x3
  802632:	48 8d 90 80 2e 40 00 	lea    rdx,[rax+0x402e80]
  802639:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80263d:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802640:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802644:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802647:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  80264b:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  80264f:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802653:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802657:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  80265b:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  80265f:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802663:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802667:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  80266b:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  80266f:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802673:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802677:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  80267b:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  80267f:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802683:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802687:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  80268b:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  80268f:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802693:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802697:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  80269b:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  80269f:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  8026a3:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  8026a7:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  8026ab:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  8026af:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  8026b3:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  8026b7:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  8026bb:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  8026c2:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  8026c9:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  8026d0:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  8026d7:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  8026de:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  8026e5:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  8026ec:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  8026f3:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
  8026fa:	48 89 82 a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rax
            devs[i].flag=DEV_FLAG_USED;
  802701:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802704:	48 63 d0             	movsxd rdx,eax
  802707:	48 89 d0             	mov    rax,rdx
  80270a:	48 c1 e0 02          	shl    rax,0x2
  80270e:	48 01 d0             	add    rax,rdx
  802711:	48 c1 e0 02          	shl    rax,0x2
  802715:	48 01 d0             	add    rax,rdx
  802718:	48 c1 e0 03          	shl    rax,0x3
  80271c:	48 05 90 2e 40 00    	add    rax,0x402e90
  802722:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            break;
  802728:	eb 0e                	jmp    802738 <reg_device+0x165>
    for(;i<MAX_DEVICES;i++)
  80272a:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80272e:	83 7d f4 3f          	cmp    DWORD PTR [rbp-0xc],0x3f
  802732:	0f 8e b4 fe ff ff    	jle    8025ec <reg_device+0x19>
        }
    }
    if(i==MAX_DEVICES)
  802738:	83 7d f4 40          	cmp    DWORD PTR [rbp-0xc],0x40
  80273c:	75 0a                	jne    802748 <reg_device+0x175>
        return -1;
  80273e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802743:	e9 6d 01 00 00       	jmp    8028b5 <reg_device+0x2e2>
    //添加到链表
    device* p=NULL,*neo=&devs[i],**pp;
  802748:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80274f:	00 
  802750:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802753:	48 63 d0             	movsxd rdx,eax
  802756:	48 89 d0             	mov    rax,rdx
  802759:	48 c1 e0 02          	shl    rax,0x2
  80275d:	48 01 d0             	add    rax,rdx
  802760:	48 c1 e0 02          	shl    rax,0x2
  802764:	48 01 d0             	add    rax,rdx
  802767:	48 c1 e0 03          	shl    rax,0x3
  80276b:	48 05 80 2e 40 00    	add    rax,0x402e80
  802771:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    switch (dev->type)
  802775:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802779:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80277c:	83 f8 03             	cmp    eax,0x3
  80277f:	74 3b                	je     8027bc <reg_device+0x1e9>
  802781:	83 f8 03             	cmp    eax,0x3
  802784:	7f 4b                	jg     8027d1 <reg_device+0x1fe>
  802786:	83 f8 01             	cmp    eax,0x1
  802789:	74 07                	je     802792 <reg_device+0x1bf>
  80278b:	83 f8 02             	cmp    eax,0x2
  80278e:	74 17                	je     8027a7 <reg_device+0x1d4>
  802790:	eb 3f                	jmp    8027d1 <reg_device+0x1fe>
    {
    case DEV_TYPE_BLKDEV:
        p=dev_tree[DEVTREE_BLKDEVI];pp=&dev_tree[DEVTREE_BLKDEVI];
  802792:	48 8b 05 e7 5c c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05ce7]        # 408480 <dev_tree>
  802799:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  80279d:	48 c7 45 e0 80 84 40 	mov    QWORD PTR [rbp-0x20],0x408480
  8027a4:	00 
        break;
  8027a5:	eb 34                	jmp    8027db <reg_device+0x208>
    
    case DEV_TYPE_CHRDEV:
        p=dev_tree[DEVTREE_CHRDEVI];pp=&dev_tree[DEVTREE_CHRDEVI];
  8027a7:	48 8b 05 da 5c c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05cda]        # 408488 <dev_tree+0x8>
  8027ae:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  8027b2:	48 c7 45 e0 88 84 40 	mov    QWORD PTR [rbp-0x20],0x408488
  8027b9:	00 
        break;
  8027ba:	eb 1f                	jmp    8027db <reg_device+0x208>
        
    case DEV_TYPE_OTHERS:
        p=dev_tree[DEVTREE_OTHERDEVI];pp=&dev_tree[DEVTREE_OTHERDEVI];
  8027bc:	48 8b 05 cd 5c c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05ccd]        # 408490 <dev_tree+0x10>
  8027c3:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  8027c7:	48 c7 45 e0 90 84 40 	mov    QWORD PTR [rbp-0x20],0x408490
  8027ce:	00 
        break;
  8027cf:	eb 0a                	jmp    8027db <reg_device+0x208>
    default:return -1;//不可能有其他情况
  8027d1:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8027d6:	e9 da 00 00 00       	jmp    8028b5 <reg_device+0x2e2>
    }
    if(!p){
  8027db:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  8027e0:	75 2b                	jne    80280d <reg_device+0x23a>
        *pp=neo;
  8027e2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8027e6:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8027ea:	48 89 10             	mov    QWORD PTR [rax],rdx
        neo->prev=NULL;
  8027ed:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8027f1:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x0
  8027f8:	00 00 00 00 
  8027fc:	eb 3d                	jmp    80283b <reg_device+0x268>
    }
    else{
        for(;p->next;p=p->next);
  8027fe:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802802:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802809:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  80280d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802811:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802818:	48 85 c0             	test   rax,rax
  80281b:	75 e1                	jne    8027fe <reg_device+0x22b>
        p->next=neo;
  80281d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802821:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802825:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
        neo->prev=p;
  80282c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802830:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  802834:	48 89 90 98 00 00 00 	mov    QWORD PTR [rax+0x98],rdx
    }
    neo->next=NULL;
  80283b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80283f:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x0
  802846:	00 00 00 00 
    //设置相应的请求函数
    switch (neo->stype)
  80284a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80284e:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  802851:	83 f8 04             	cmp    eax,0x4
  802854:	74 3b                	je     802891 <reg_device+0x2be>
  802856:	83 f8 04             	cmp    eax,0x4
  802859:	7f 56                	jg     8028b1 <reg_device+0x2de>
  80285b:	83 f8 03             	cmp    eax,0x3
  80285e:	74 21                	je     802881 <reg_device+0x2ae>
  802860:	83 f8 03             	cmp    eax,0x3
  802863:	7f 4c                	jg     8028b1 <reg_device+0x2de>
  802865:	83 f8 01             	cmp    eax,0x1
  802868:	74 07                	je     802871 <reg_device+0x29e>
  80286a:	83 f8 02             	cmp    eax,0x2
  80286d:	74 32                	je     8028a1 <reg_device+0x2ce>
        break;
    case DEV_STYPE_TTY:
        neo->operi=OPERATIONS_TTY;
        break;
    default:
        break;
  80286f:	eb 40                	jmp    8028b1 <reg_device+0x2de>
        neo->operi=OPERATIONS_HD;
  802871:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802875:	c7 80 a0 00 00 00 00 	mov    DWORD PTR [rax+0xa0],0x0
  80287c:	00 00 00 
        break;
  80287f:	eb 31                	jmp    8028b2 <reg_device+0x2df>
        neo->operi=OPERATIONS_MOUSE;
  802881:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802885:	c7 80 a0 00 00 00 02 	mov    DWORD PTR [rax+0xa0],0x2
  80288c:	00 00 00 
        break;
  80288f:	eb 21                	jmp    8028b2 <reg_device+0x2df>
        neo->operi=OPERATIONS_KEYBOARD;
  802891:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802895:	c7 80 a0 00 00 00 03 	mov    DWORD PTR [rax+0xa0],0x3
  80289c:	00 00 00 
        break;
  80289f:	eb 11                	jmp    8028b2 <reg_device+0x2df>
        neo->operi=OPERATIONS_TTY;
  8028a1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8028a5:	c7 80 a0 00 00 00 01 	mov    DWORD PTR [rax+0xa0],0x1
  8028ac:	00 00 00 
        break;
  8028af:	eb 01                	jmp    8028b2 <reg_device+0x2df>
        break;
  8028b1:	90                   	nop
    }
    return i;
  8028b2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  8028b5:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8028b9:	c9                   	leave  
  8028ba:	c3                   	ret    

00000000008028bb <reg_driver>:


int reg_driver(driver *drv)
{
  8028bb:	f3 0f 1e fa          	endbr64 
  8028bf:	55                   	push   rbp
  8028c0:	48 89 e5             	mov    rbp,rsp
  8028c3:	53                   	push   rbx
  8028c4:	48 89 7d e0          	mov    QWORD PTR [rbp-0x20],rdi
    for(int i=0;i<MAX_DRIVERS;i++)
  8028c8:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8028cf:	e9 22 01 00 00       	jmp    8029f6 <reg_driver+0x13b>
    {
        if(drvs[i].flag==DRV_FLAG_EMPTY)
  8028d4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8028d7:	48 63 d0             	movsxd rdx,eax
  8028da:	48 89 d0             	mov    rax,rdx
  8028dd:	48 c1 e0 02          	shl    rax,0x2
  8028e1:	48 01 d0             	add    rax,rdx
  8028e4:	48 c1 e0 05          	shl    rax,0x5
  8028e8:	48 05 80 58 40 00    	add    rax,0x405880
  8028ee:	8b 00                	mov    eax,DWORD PTR [rax]
  8028f0:	85 c0                	test   eax,eax
  8028f2:	0f 85 fa 00 00 00    	jne    8029f2 <reg_driver+0x137>
        {
            drvs[i]=*drv;
  8028f8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8028fb:	48 63 d0             	movsxd rdx,eax
  8028fe:	48 89 d0             	mov    rax,rdx
  802901:	48 c1 e0 02          	shl    rax,0x2
  802905:	48 01 d0             	add    rax,rdx
  802908:	48 c1 e0 05          	shl    rax,0x5
  80290c:	48 8d 90 80 58 40 00 	lea    rdx,[rax+0x405880]
  802913:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802917:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80291a:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  80291e:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802921:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802925:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802929:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  80292d:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802931:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802935:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802939:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  80293d:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802941:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802945:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802949:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  80294d:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802951:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802955:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802959:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  80295d:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802961:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802965:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802969:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  80296d:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802971:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802975:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802979:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  80297d:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802981:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802985:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802989:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  80298d:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802991:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802995:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  80299c:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  8029a3:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  8029aa:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  8029b1:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  8029b8:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  8029bf:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  8029c6:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
            drvs[i].flag=DRV_FLAG_USED;
  8029cd:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8029d0:	48 63 d0             	movsxd rdx,eax
  8029d3:	48 89 d0             	mov    rax,rdx
  8029d6:	48 c1 e0 02          	shl    rax,0x2
  8029da:	48 01 d0             	add    rax,rdx
  8029dd:	48 c1 e0 05          	shl    rax,0x5
  8029e1:	48 05 80 58 40 00    	add    rax,0x405880
  8029e7:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            return i;
  8029ed:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8029f0:	eb 13                	jmp    802a05 <reg_driver+0x14a>
    for(int i=0;i<MAX_DRIVERS;i++)
  8029f2:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8029f6:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  8029fa:	0f 8e d4 fe ff ff    	jle    8028d4 <reg_driver+0x19>
        }
    }
    return -1;
  802a00:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802a05:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802a09:	c9                   	leave  
  802a0a:	c3                   	ret    

0000000000802a0b <sys_find_dev>:

int sys_find_dev(char *name)
{
  802a0b:	f3 0f 1e fa          	endbr64 
  802a0f:	55                   	push   rbp
  802a10:	48 89 e5             	mov    rbp,rsp
  802a13:	48 83 ec 20          	sub    rsp,0x20
  802a17:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_DEVICES;i++)
  802a1b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802a22:	eb 6c                	jmp    802a90 <sys_find_dev+0x85>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802a24:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802a27:	48 63 d0             	movsxd rdx,eax
  802a2a:	48 89 d0             	mov    rax,rdx
  802a2d:	48 c1 e0 02          	shl    rax,0x2
  802a31:	48 01 d0             	add    rax,rdx
  802a34:	48 c1 e0 02          	shl    rax,0x2
  802a38:	48 01 d0             	add    rax,rdx
  802a3b:	48 c1 e0 03          	shl    rax,0x3
  802a3f:	48 05 90 2e 40 00    	add    rax,0x402e90
  802a45:	8b 00                	mov    eax,DWORD PTR [rax]
  802a47:	85 c0                	test   eax,eax
  802a49:	74 41                	je     802a8c <sys_find_dev+0x81>
  802a4b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802a4e:	48 63 d0             	movsxd rdx,eax
  802a51:	48 89 d0             	mov    rax,rdx
  802a54:	48 c1 e0 02          	shl    rax,0x2
  802a58:	48 01 d0             	add    rax,rdx
  802a5b:	48 c1 e0 02          	shl    rax,0x2
  802a5f:	48 01 d0             	add    rax,rdx
  802a62:	48 c1 e0 03          	shl    rax,0x3
  802a66:	48 83 c0 10          	add    rax,0x10
  802a6a:	48 05 80 2e 40 00    	add    rax,0x402e80
  802a70:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802a74:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802a78:	48 89 d6             	mov    rsi,rdx
  802a7b:	48 89 c7             	mov    rdi,rax
  802a7e:	e8 cd 90 00 00       	call   80bb50 <strcmp>
  802a83:	85 c0                	test   eax,eax
  802a85:	75 05                	jne    802a8c <sys_find_dev+0x81>
            return i;
  802a87:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802a8a:	eb 0f                	jmp    802a9b <sys_find_dev+0x90>
    for(int i=0;i<MAX_DEVICES;i++)
  802a8c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802a90:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802a94:	7e 8e                	jle    802a24 <sys_find_dev+0x19>
    }
    return -1;
  802a96:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802a9b:	c9                   	leave  
  802a9c:	c3                   	ret    

0000000000802a9d <sys_operate_dev>:

int sys_operate_dev(char *name,int func,driver_args* args)
{
  802a9d:	f3 0f 1e fa          	endbr64 
  802aa1:	55                   	push   rbp
  802aa2:	48 89 e5             	mov    rbp,rsp
  802aa5:	48 83 ec 30          	sub    rsp,0x30
  802aa9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802aad:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  802ab0:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    int i=0;
  802ab4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;i<MAX_DEVICES;i++)
  802abb:	eb 67                	jmp    802b24 <sys_operate_dev+0x87>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802abd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802ac0:	48 63 d0             	movsxd rdx,eax
  802ac3:	48 89 d0             	mov    rax,rdx
  802ac6:	48 c1 e0 02          	shl    rax,0x2
  802aca:	48 01 d0             	add    rax,rdx
  802acd:	48 c1 e0 02          	shl    rax,0x2
  802ad1:	48 01 d0             	add    rax,rdx
  802ad4:	48 c1 e0 03          	shl    rax,0x3
  802ad8:	48 05 90 2e 40 00    	add    rax,0x402e90
  802ade:	8b 00                	mov    eax,DWORD PTR [rax]
  802ae0:	85 c0                	test   eax,eax
  802ae2:	74 3c                	je     802b20 <sys_operate_dev+0x83>
  802ae4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802ae7:	48 63 d0             	movsxd rdx,eax
  802aea:	48 89 d0             	mov    rax,rdx
  802aed:	48 c1 e0 02          	shl    rax,0x2
  802af1:	48 01 d0             	add    rax,rdx
  802af4:	48 c1 e0 02          	shl    rax,0x2
  802af8:	48 01 d0             	add    rax,rdx
  802afb:	48 c1 e0 03          	shl    rax,0x3
  802aff:	48 83 c0 10          	add    rax,0x10
  802b03:	48 05 80 2e 40 00    	add    rax,0x402e80
  802b09:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802b0d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802b11:	48 89 d6             	mov    rsi,rdx
  802b14:	48 89 c7             	mov    rdi,rax
  802b17:	e8 34 90 00 00       	call   80bb50 <strcmp>
  802b1c:	85 c0                	test   eax,eax
  802b1e:	74 0c                	je     802b2c <sys_operate_dev+0x8f>
    for(;i<MAX_DEVICES;i++)
  802b20:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802b24:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802b28:	7e 93                	jle    802abd <sys_operate_dev+0x20>
  802b2a:	eb 01                	jmp    802b2d <sys_operate_dev+0x90>
            break;
  802b2c:	90                   	nop
    }
    if(i==MAX_DEVICES)return -1;
  802b2d:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  802b31:	75 0a                	jne    802b3d <sys_operate_dev+0xa0>
  802b33:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802b38:	e9 9c 02 00 00       	jmp    802dd9 <sys_operate_dev+0x33c>
    switch (func) {
  802b3d:	83 7d e4 0b          	cmp    DWORD PTR [rbp-0x1c],0xb
  802b41:	0f 87 8d 02 00 00    	ja     802dd4 <sys_operate_dev+0x337>
  802b47:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  802b4a:	48 8b 04 c5 a8 3e 81 	mov    rax,QWORD PTR [rax*8+0x813ea8]
  802b51:	00 
  802b52:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return devs[i].drv->open(args);
  802b55:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802b58:	48 63 d0             	movsxd rdx,eax
  802b5b:	48 89 d0             	mov    rax,rdx
  802b5e:	48 c1 e0 02          	shl    rax,0x2
  802b62:	48 01 d0             	add    rax,rdx
  802b65:	48 c1 e0 02          	shl    rax,0x2
  802b69:	48 01 d0             	add    rax,rdx
  802b6c:	48 c1 e0 03          	shl    rax,0x3
  802b70:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802b76:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802b79:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  802b7d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802b81:	48 89 c7             	mov    rdi,rax
  802b84:	ff d2                	call   rdx
  802b86:	e9 4e 02 00 00       	jmp    802dd9 <sys_operate_dev+0x33c>
        case DRVF_CLOSE:return devs[i].drv->close(args);
  802b8b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802b8e:	48 63 d0             	movsxd rdx,eax
  802b91:	48 89 d0             	mov    rax,rdx
  802b94:	48 c1 e0 02          	shl    rax,0x2
  802b98:	48 01 d0             	add    rax,rdx
  802b9b:	48 c1 e0 02          	shl    rax,0x2
  802b9f:	48 01 d0             	add    rax,rdx
  802ba2:	48 c1 e0 03          	shl    rax,0x3
  802ba6:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802bac:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802baf:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  802bb3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802bb7:	48 89 c7             	mov    rdi,rax
  802bba:	ff d2                	call   rdx
  802bbc:	e9 18 02 00 00       	jmp    802dd9 <sys_operate_dev+0x33c>
        case DRVF_READ :return devs[i].drv->read(args);
  802bc1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802bc4:	48 63 d0             	movsxd rdx,eax
  802bc7:	48 89 d0             	mov    rax,rdx
  802bca:	48 c1 e0 02          	shl    rax,0x2
  802bce:	48 01 d0             	add    rax,rdx
  802bd1:	48 c1 e0 02          	shl    rax,0x2
  802bd5:	48 01 d0             	add    rax,rdx
  802bd8:	48 c1 e0 03          	shl    rax,0x3
  802bdc:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802be2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802be5:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  802be9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802bed:	48 89 c7             	mov    rdi,rax
  802bf0:	ff d2                	call   rdx
  802bf2:	e9 e2 01 00 00       	jmp    802dd9 <sys_operate_dev+0x33c>
        case DRVF_WRITE:return devs[i].drv->write(args);
  802bf7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802bfa:	48 63 d0             	movsxd rdx,eax
  802bfd:	48 89 d0             	mov    rax,rdx
  802c00:	48 c1 e0 02          	shl    rax,0x2
  802c04:	48 01 d0             	add    rax,rdx
  802c07:	48 c1 e0 02          	shl    rax,0x2
  802c0b:	48 01 d0             	add    rax,rdx
  802c0e:	48 c1 e0 03          	shl    rax,0x3
  802c12:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802c18:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802c1b:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  802c1f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c23:	48 89 c7             	mov    rdi,rax
  802c26:	ff d2                	call   rdx
  802c28:	e9 ac 01 00 00       	jmp    802dd9 <sys_operate_dev+0x33c>
        case DRVF_CHK  :return devs[i].drv->check(args);
  802c2d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802c30:	48 63 d0             	movsxd rdx,eax
  802c33:	48 89 d0             	mov    rax,rdx
  802c36:	48 c1 e0 02          	shl    rax,0x2
  802c3a:	48 01 d0             	add    rax,rdx
  802c3d:	48 c1 e0 02          	shl    rax,0x2
  802c41:	48 01 d0             	add    rax,rdx
  802c44:	48 c1 e0 03          	shl    rax,0x3
  802c48:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802c4e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802c51:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  802c55:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c59:	48 89 c7             	mov    rdi,rax
  802c5c:	ff d2                	call   rdx
  802c5e:	e9 76 01 00 00       	jmp    802dd9 <sys_operate_dev+0x33c>
        case DRVF_RSVD :return devs[i].drv->reserved(args);
  802c63:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802c66:	48 63 d0             	movsxd rdx,eax
  802c69:	48 89 d0             	mov    rax,rdx
  802c6c:	48 c1 e0 02          	shl    rax,0x2
  802c70:	48 01 d0             	add    rax,rdx
  802c73:	48 c1 e0 02          	shl    rax,0x2
  802c77:	48 01 d0             	add    rax,rdx
  802c7a:	48 c1 e0 03          	shl    rax,0x3
  802c7e:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802c84:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802c87:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
  802c8b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c8f:	48 89 c7             	mov    rdi,rax
  802c92:	ff d2                	call   rdx
  802c94:	e9 40 01 00 00       	jmp    802dd9 <sys_operate_dev+0x33c>
        case DRVF_INT  :return devs[i].drv->inthandler(args);
  802c99:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802c9c:	48 63 d0             	movsxd rdx,eax
  802c9f:	48 89 d0             	mov    rax,rdx
  802ca2:	48 c1 e0 02          	shl    rax,0x2
  802ca6:	48 01 d0             	add    rax,rdx
  802ca9:	48 c1 e0 02          	shl    rax,0x2
  802cad:	48 01 d0             	add    rax,rdx
  802cb0:	48 c1 e0 03          	shl    rax,0x3
  802cb4:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802cba:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802cbd:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
  802cc1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802cc5:	48 89 c7             	mov    rdi,rax
  802cc8:	ff d2                	call   rdx
  802cca:	e9 0a 01 00 00       	jmp    802dd9 <sys_operate_dev+0x33c>
        case DRVF_FIND :return devs[i].drv->find(args);
  802ccf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802cd2:	48 63 d0             	movsxd rdx,eax
  802cd5:	48 89 d0             	mov    rax,rdx
  802cd8:	48 c1 e0 02          	shl    rax,0x2
  802cdc:	48 01 d0             	add    rax,rdx
  802cdf:	48 c1 e0 02          	shl    rax,0x2
  802ce3:	48 01 d0             	add    rax,rdx
  802ce6:	48 c1 e0 03          	shl    rax,0x3
  802cea:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802cf0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802cf3:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  802cf7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802cfb:	48 89 c7             	mov    rdi,rax
  802cfe:	ff d2                	call   rdx
  802d00:	e9 d4 00 00 00       	jmp    802dd9 <sys_operate_dev+0x33c>
        case DRVF_RM   :return devs[i].drv->rm(args);
  802d05:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802d08:	48 63 d0             	movsxd rdx,eax
  802d0b:	48 89 d0             	mov    rax,rdx
  802d0e:	48 c1 e0 02          	shl    rax,0x2
  802d12:	48 01 d0             	add    rax,rdx
  802d15:	48 c1 e0 02          	shl    rax,0x2
  802d19:	48 01 d0             	add    rax,rdx
  802d1c:	48 c1 e0 03          	shl    rax,0x3
  802d20:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802d26:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802d29:	48 8b 50 48          	mov    rdx,QWORD PTR [rax+0x48]
  802d2d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d31:	48 89 c7             	mov    rdi,rax
  802d34:	ff d2                	call   rdx
  802d36:	e9 9e 00 00 00       	jmp    802dd9 <sys_operate_dev+0x33c>
        case DRVF_TOUCH:return devs[i].drv->touch(args);
  802d3b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802d3e:	48 63 d0             	movsxd rdx,eax
  802d41:	48 89 d0             	mov    rax,rdx
  802d44:	48 c1 e0 02          	shl    rax,0x2
  802d48:	48 01 d0             	add    rax,rdx
  802d4b:	48 c1 e0 02          	shl    rax,0x2
  802d4f:	48 01 d0             	add    rax,rdx
  802d52:	48 c1 e0 03          	shl    rax,0x3
  802d56:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802d5c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802d5f:	48 8b 50 50          	mov    rdx,QWORD PTR [rax+0x50]
  802d63:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d67:	48 89 c7             	mov    rdi,rax
  802d6a:	ff d2                	call   rdx
  802d6c:	eb 6b                	jmp    802dd9 <sys_operate_dev+0x33c>
        case DRVF_MKDIR:return devs[i].drv->mkdir(args);
  802d6e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802d71:	48 63 d0             	movsxd rdx,eax
  802d74:	48 89 d0             	mov    rax,rdx
  802d77:	48 c1 e0 02          	shl    rax,0x2
  802d7b:	48 01 d0             	add    rax,rdx
  802d7e:	48 c1 e0 02          	shl    rax,0x2
  802d82:	48 01 d0             	add    rax,rdx
  802d85:	48 c1 e0 03          	shl    rax,0x3
  802d89:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802d8f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802d92:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  802d96:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d9a:	48 89 c7             	mov    rdi,rax
  802d9d:	ff d2                	call   rdx
  802d9f:	eb 38                	jmp    802dd9 <sys_operate_dev+0x33c>
        case DRVF_LS:return    devs[i].drv->ls(args);
  802da1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802da4:	48 63 d0             	movsxd rdx,eax
  802da7:	48 89 d0             	mov    rax,rdx
  802daa:	48 c1 e0 02          	shl    rax,0x2
  802dae:	48 01 d0             	add    rax,rdx
  802db1:	48 c1 e0 02          	shl    rax,0x2
  802db5:	48 01 d0             	add    rax,rdx
  802db8:	48 c1 e0 03          	shl    rax,0x3
  802dbc:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802dc2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802dc5:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
  802dc9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802dcd:	48 89 c7             	mov    rdi,rax
  802dd0:	ff d2                	call   rdx
  802dd2:	eb 05                	jmp    802dd9 <sys_operate_dev+0x33c>
    }
    return -1;
  802dd4:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802dd9:	c9                   	leave  
  802dda:	c3                   	ret    

0000000000802ddb <call_drv_func>:
int call_drv_func(int drv_n,int func_n,driver_args *args)
{
  802ddb:	f3 0f 1e fa          	endbr64 
  802ddf:	55                   	push   rbp
  802de0:	48 89 e5             	mov    rbp,rsp
  802de3:	48 83 ec 10          	sub    rsp,0x10
  802de7:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  802dea:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  802ded:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    if(drvs[drv_n].flag==DRV_FLAG_EMPTY)return -1;
  802df1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802df4:	48 63 d0             	movsxd rdx,eax
  802df7:	48 89 d0             	mov    rax,rdx
  802dfa:	48 c1 e0 02          	shl    rax,0x2
  802dfe:	48 01 d0             	add    rax,rdx
  802e01:	48 c1 e0 05          	shl    rax,0x5
  802e05:	48 05 80 58 40 00    	add    rax,0x405880
  802e0b:	8b 00                	mov    eax,DWORD PTR [rax]
  802e0d:	85 c0                	test   eax,eax
  802e0f:	75 0a                	jne    802e1b <call_drv_func+0x40>
  802e11:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802e16:	e9 15 02 00 00       	jmp    803030 <call_drv_func+0x255>
    /*driverfunc f=drvs[drv_n].func_thunk[func_n];
    return f(args);*/
    switch (func_n) {
  802e1b:	83 7d f8 0b          	cmp    DWORD PTR [rbp-0x8],0xb
  802e1f:	0f 87 06 02 00 00    	ja     80302b <call_drv_func+0x250>
  802e25:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802e28:	48 8b 04 c5 08 3f 81 	mov    rax,QWORD PTR [rax*8+0x813f08]
  802e2f:	00 
  802e30:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return drvs[drv_n].open(args);
  802e33:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802e36:	48 63 d0             	movsxd rdx,eax
  802e39:	48 89 d0             	mov    rax,rdx
  802e3c:	48 c1 e0 02          	shl    rax,0x2
  802e40:	48 01 d0             	add    rax,rdx
  802e43:	48 c1 e0 05          	shl    rax,0x5
  802e47:	48 05 88 58 40 00    	add    rax,0x405888
  802e4d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802e50:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802e54:	48 89 c7             	mov    rdi,rax
  802e57:	ff d2                	call   rdx
  802e59:	e9 d2 01 00 00       	jmp    803030 <call_drv_func+0x255>
        case DRVF_CLOSE:return drvs[drv_n].close(args);
  802e5e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802e61:	48 63 d0             	movsxd rdx,eax
  802e64:	48 89 d0             	mov    rax,rdx
  802e67:	48 c1 e0 02          	shl    rax,0x2
  802e6b:	48 01 d0             	add    rax,rdx
  802e6e:	48 c1 e0 05          	shl    rax,0x5
  802e72:	48 05 90 58 40 00    	add    rax,0x405890
  802e78:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802e7b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802e7f:	48 89 c7             	mov    rdi,rax
  802e82:	ff d2                	call   rdx
  802e84:	e9 a7 01 00 00       	jmp    803030 <call_drv_func+0x255>
        case DRVF_READ :return drvs[drv_n].read(args);
  802e89:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802e8c:	48 63 d0             	movsxd rdx,eax
  802e8f:	48 89 d0             	mov    rax,rdx
  802e92:	48 c1 e0 02          	shl    rax,0x2
  802e96:	48 01 d0             	add    rax,rdx
  802e99:	48 c1 e0 05          	shl    rax,0x5
  802e9d:	48 05 98 58 40 00    	add    rax,0x405898
  802ea3:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802ea6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802eaa:	48 89 c7             	mov    rdi,rax
  802ead:	ff d2                	call   rdx
  802eaf:	e9 7c 01 00 00       	jmp    803030 <call_drv_func+0x255>
        case DRVF_WRITE:return drvs[drv_n].write(args);
  802eb4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802eb7:	48 63 d0             	movsxd rdx,eax
  802eba:	48 89 d0             	mov    rax,rdx
  802ebd:	48 c1 e0 02          	shl    rax,0x2
  802ec1:	48 01 d0             	add    rax,rdx
  802ec4:	48 c1 e0 05          	shl    rax,0x5
  802ec8:	48 05 a0 58 40 00    	add    rax,0x4058a0
  802ece:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802ed1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802ed5:	48 89 c7             	mov    rdi,rax
  802ed8:	ff d2                	call   rdx
  802eda:	e9 51 01 00 00       	jmp    803030 <call_drv_func+0x255>
        case DRVF_CHK  :return drvs[drv_n].check(args);
  802edf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802ee2:	48 63 d0             	movsxd rdx,eax
  802ee5:	48 89 d0             	mov    rax,rdx
  802ee8:	48 c1 e0 02          	shl    rax,0x2
  802eec:	48 01 d0             	add    rax,rdx
  802eef:	48 c1 e0 05          	shl    rax,0x5
  802ef3:	48 05 a8 58 40 00    	add    rax,0x4058a8
  802ef9:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802efc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802f00:	48 89 c7             	mov    rdi,rax
  802f03:	ff d2                	call   rdx
  802f05:	e9 26 01 00 00       	jmp    803030 <call_drv_func+0x255>
        case DRVF_RSVD :return drvs[drv_n].reserved(args);
  802f0a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f0d:	48 63 d0             	movsxd rdx,eax
  802f10:	48 89 d0             	mov    rax,rdx
  802f13:	48 c1 e0 02          	shl    rax,0x2
  802f17:	48 01 d0             	add    rax,rdx
  802f1a:	48 c1 e0 05          	shl    rax,0x5
  802f1e:	48 05 b0 58 40 00    	add    rax,0x4058b0
  802f24:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802f27:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802f2b:	48 89 c7             	mov    rdi,rax
  802f2e:	ff d2                	call   rdx
  802f30:	e9 fb 00 00 00       	jmp    803030 <call_drv_func+0x255>
        case DRVF_INT  :return drvs[drv_n].inthandler(args);
  802f35:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f38:	48 63 d0             	movsxd rdx,eax
  802f3b:	48 89 d0             	mov    rax,rdx
  802f3e:	48 c1 e0 02          	shl    rax,0x2
  802f42:	48 01 d0             	add    rax,rdx
  802f45:	48 c1 e0 05          	shl    rax,0x5
  802f49:	48 05 b8 58 40 00    	add    rax,0x4058b8
  802f4f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802f52:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802f56:	48 89 c7             	mov    rdi,rax
  802f59:	ff d2                	call   rdx
  802f5b:	e9 d0 00 00 00       	jmp    803030 <call_drv_func+0x255>
        case DRVF_FIND :return drvs[drv_n].find(args);
  802f60:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f63:	48 63 d0             	movsxd rdx,eax
  802f66:	48 89 d0             	mov    rax,rdx
  802f69:	48 c1 e0 02          	shl    rax,0x2
  802f6d:	48 01 d0             	add    rax,rdx
  802f70:	48 c1 e0 05          	shl    rax,0x5
  802f74:	48 05 c0 58 40 00    	add    rax,0x4058c0
  802f7a:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802f7d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802f81:	48 89 c7             	mov    rdi,rax
  802f84:	ff d2                	call   rdx
  802f86:	e9 a5 00 00 00       	jmp    803030 <call_drv_func+0x255>
        case DRVF_RM   :return drvs[drv_n].rm(args);
  802f8b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f8e:	48 63 d0             	movsxd rdx,eax
  802f91:	48 89 d0             	mov    rax,rdx
  802f94:	48 c1 e0 02          	shl    rax,0x2
  802f98:	48 01 d0             	add    rax,rdx
  802f9b:	48 c1 e0 05          	shl    rax,0x5
  802f9f:	48 05 c8 58 40 00    	add    rax,0x4058c8
  802fa5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802fa8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802fac:	48 89 c7             	mov    rdi,rax
  802faf:	ff d2                	call   rdx
  802fb1:	eb 7d                	jmp    803030 <call_drv_func+0x255>
        case DRVF_TOUCH:return drvs[drv_n].touch(args);
  802fb3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802fb6:	48 63 d0             	movsxd rdx,eax
  802fb9:	48 89 d0             	mov    rax,rdx
  802fbc:	48 c1 e0 02          	shl    rax,0x2
  802fc0:	48 01 d0             	add    rax,rdx
  802fc3:	48 c1 e0 05          	shl    rax,0x5
  802fc7:	48 05 d0 58 40 00    	add    rax,0x4058d0
  802fcd:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802fd0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802fd4:	48 89 c7             	mov    rdi,rax
  802fd7:	ff d2                	call   rdx
  802fd9:	eb 55                	jmp    803030 <call_drv_func+0x255>
        case DRVF_MKDIR:return drvs[drv_n].mkdir(args);
  802fdb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802fde:	48 63 d0             	movsxd rdx,eax
  802fe1:	48 89 d0             	mov    rax,rdx
  802fe4:	48 c1 e0 02          	shl    rax,0x2
  802fe8:	48 01 d0             	add    rax,rdx
  802feb:	48 c1 e0 05          	shl    rax,0x5
  802fef:	48 05 d8 58 40 00    	add    rax,0x4058d8
  802ff5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802ff8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802ffc:	48 89 c7             	mov    rdi,rax
  802fff:	ff d2                	call   rdx
  803001:	eb 2d                	jmp    803030 <call_drv_func+0x255>
        case DRVF_LS:return drvs[drv_n].ls(args);
  803003:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803006:	48 63 d0             	movsxd rdx,eax
  803009:	48 89 d0             	mov    rax,rdx
  80300c:	48 c1 e0 02          	shl    rax,0x2
  803010:	48 01 d0             	add    rax,rdx
  803013:	48 c1 e0 05          	shl    rax,0x5
  803017:	48 05 e0 58 40 00    	add    rax,0x4058e0
  80301d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803020:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803024:	48 89 c7             	mov    rdi,rax
  803027:	ff d2                	call   rdx
  803029:	eb 05                	jmp    803030 <call_drv_func+0x255>
    }
    return -1;
  80302b:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  803030:	c9                   	leave  
  803031:	c3                   	ret    

0000000000803032 <dispose_device>:
int dispose_device(int dev){
  803032:	f3 0f 1e fa          	endbr64 
  803036:	55                   	push   rbp
  803037:	48 89 e5             	mov    rbp,rsp
  80303a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(devs[dev].flag!=DEV_FLAG_USED)return -1;
  80303d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803040:	48 63 d0             	movsxd rdx,eax
  803043:	48 89 d0             	mov    rax,rdx
  803046:	48 c1 e0 02          	shl    rax,0x2
  80304a:	48 01 d0             	add    rax,rdx
  80304d:	48 c1 e0 02          	shl    rax,0x2
  803051:	48 01 d0             	add    rax,rdx
  803054:	48 c1 e0 03          	shl    rax,0x3
  803058:	48 05 90 2e 40 00    	add    rax,0x402e90
  80305e:	8b 00                	mov    eax,DWORD PTR [rax]
  803060:	83 f8 01             	cmp    eax,0x1
  803063:	74 07                	je     80306c <dispose_device+0x3a>
  803065:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80306a:	eb 62                	jmp    8030ce <dispose_device+0x9c>
    device* p=&devs[dev];
  80306c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80306f:	48 63 d0             	movsxd rdx,eax
  803072:	48 89 d0             	mov    rax,rdx
  803075:	48 c1 e0 02          	shl    rax,0x2
  803079:	48 01 d0             	add    rax,rdx
  80307c:	48 c1 e0 02          	shl    rax,0x2
  803080:	48 01 d0             	add    rax,rdx
  803083:	48 c1 e0 03          	shl    rax,0x3
  803087:	48 05 80 2e 40 00    	add    rax,0x402e80
  80308d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //从链表删除
    if(p->prev)p->prev->next=p->next;
  803091:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803095:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  80309c:	48 85 c0             	test   rax,rax
  80309f:	74 1d                	je     8030be <dispose_device+0x8c>
  8030a1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8030a5:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  8030ac:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8030b0:	48 8b 92 90 00 00 00 	mov    rdx,QWORD PTR [rdx+0x90]
  8030b7:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
    p->flag=DEV_FLAG_EMPTY;
  8030be:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8030c2:	c7 40 10 00 00 00 00 	mov    DWORD PTR [rax+0x10],0x0
    return 0;
  8030c9:	b8 00 00 00 00       	mov    eax,0x0
}
  8030ce:	5d                   	pop    rbp
  8030cf:	c3                   	ret    

00000000008030d0 <dispose_driver>:
int dispose_driver(driver *drv){
  8030d0:	f3 0f 1e fa          	endbr64 
  8030d4:	55                   	push   rbp
  8030d5:	48 89 e5             	mov    rbp,rsp
  8030d8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  8030dc:	90                   	nop
  8030dd:	5d                   	pop    rbp
  8030de:	c3                   	ret    

00000000008030df <get_dev>:

device *get_dev(int devi)
{
  8030df:	f3 0f 1e fa          	endbr64 
  8030e3:	55                   	push   rbp
  8030e4:	48 89 e5             	mov    rbp,rsp
  8030e7:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &devs[devi];
  8030ea:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8030ed:	48 63 d0             	movsxd rdx,eax
  8030f0:	48 89 d0             	mov    rax,rdx
  8030f3:	48 c1 e0 02          	shl    rax,0x2
  8030f7:	48 01 d0             	add    rax,rdx
  8030fa:	48 c1 e0 02          	shl    rax,0x2
  8030fe:	48 01 d0             	add    rax,rdx
  803101:	48 c1 e0 03          	shl    rax,0x3
  803105:	48 05 80 2e 40 00    	add    rax,0x402e80
}
  80310b:	5d                   	pop    rbp
  80310c:	c3                   	ret    

000000000080310d <get_drv>:
driver *get_drv(int drvi)
{
  80310d:	f3 0f 1e fa          	endbr64 
  803111:	55                   	push   rbp
  803112:	48 89 e5             	mov    rbp,rsp
  803115:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &drvs[drvi];
  803118:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80311b:	48 63 d0             	movsxd rdx,eax
  80311e:	48 89 d0             	mov    rax,rdx
  803121:	48 c1 e0 02          	shl    rax,0x2
  803125:	48 01 d0             	add    rax,rdx
  803128:	48 c1 e0 05          	shl    rax,0x5
  80312c:	48 05 80 58 40 00    	add    rax,0x405880
}
  803132:	5d                   	pop    rbp
  803133:	c3                   	ret    

0000000000803134 <make_request>:

//发送一个操作设备的申请
int make_request(driver_args* args)
{
  803134:	f3 0f 1e fa          	endbr64 
  803138:	55                   	push   rbp
  803139:	48 89 e5             	mov    rbp,rsp
  80313c:	53                   	push   rbx
  80313d:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //在数组中寻找空项
    int i=0;
  803141:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<NR_REQS;i++)
  803148:	eb 23                	jmp    80316d <make_request+0x39>
    {
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  80314a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80314d:	48 63 d0             	movsxd rdx,eax
  803150:	48 89 d0             	mov    rax,rdx
  803153:	48 01 c0             	add    rax,rax
  803156:	48 01 d0             	add    rax,rdx
  803159:	48 c1 e0 06          	shl    rax,0x6
  80315d:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803163:	8b 00                	mov    eax,DWORD PTR [rax]
  803165:	85 c0                	test   eax,eax
  803167:	74 0c                	je     803175 <make_request+0x41>
    for(;i<NR_REQS;i++)
  803169:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80316d:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  803171:	7e d7                	jle    80314a <make_request+0x16>
  803173:	eb 01                	jmp    803176 <make_request+0x42>
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  803175:	90                   	nop
    }
    if(i==NR_REQS)return -1;//满了
  803176:	83 7d f4 20          	cmp    DWORD PTR [rbp-0xc],0x20
  80317a:	75 0a                	jne    803186 <make_request+0x52>
  80317c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803181:	e9 e7 01 00 00       	jmp    80336d <make_request+0x239>
    reqs[i]=*args;//放入数组
  803186:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803189:	48 63 d0             	movsxd rdx,eax
  80318c:	48 89 d0             	mov    rax,rdx
  80318f:	48 01 c0             	add    rax,rax
  803192:	48 01 d0             	add    rax,rdx
  803195:	48 c1 e0 06          	shl    rax,0x6
  803199:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  8031a0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8031a4:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8031a7:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  8031ab:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  8031ae:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  8031b2:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  8031b6:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  8031ba:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  8031be:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  8031c2:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  8031c6:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  8031ca:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  8031ce:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  8031d2:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  8031d6:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  8031da:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  8031de:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  8031e2:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  8031e6:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  8031ea:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  8031ee:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  8031f2:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  8031f6:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  8031fa:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  8031fe:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  803202:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  803206:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  80320a:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  80320e:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  803212:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  803216:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  80321a:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  80321e:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  803222:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  803229:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  803230:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  803237:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  80323e:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  803245:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  80324c:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  803253:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  80325a:	48 8b 88 a0 00 00 00 	mov    rcx,QWORD PTR [rax+0xa0]
  803261:	48 8b 98 a8 00 00 00 	mov    rbx,QWORD PTR [rax+0xa8]
  803268:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  80326f:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  803276:	48 8b 88 b0 00 00 00 	mov    rcx,QWORD PTR [rax+0xb0]
  80327d:	48 8b 98 b8 00 00 00 	mov    rbx,QWORD PTR [rax+0xb8]
  803284:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  80328b:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
    //插入具体设备的等待链表中
    device* dev=&devs[args->dev];
  803292:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803296:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  80329c:	48 63 d0             	movsxd rdx,eax
  80329f:	48 89 d0             	mov    rax,rdx
  8032a2:	48 c1 e0 02          	shl    rax,0x2
  8032a6:	48 01 d0             	add    rax,rdx
  8032a9:	48 c1 e0 02          	shl    rax,0x2
  8032ad:	48 01 d0             	add    rax,rdx
  8032b0:	48 c1 e0 03          	shl    rax,0x3
  8032b4:	48 05 80 2e 40 00    	add    rax,0x402e80
  8032ba:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!dev->waiting_reqs)//空的等待队列
  8032be:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8032c2:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8032c9:	48 85 c0             	test   rax,rax
  8032cc:	75 27                	jne    8032f5 <make_request+0x1c1>
        dev->waiting_reqs=&reqs[i];
  8032ce:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8032d1:	48 63 d0             	movsxd rdx,eax
  8032d4:	48 89 d0             	mov    rax,rdx
  8032d7:	48 01 c0             	add    rax,rax
  8032da:	48 01 d0             	add    rax,rdx
  8032dd:	48 c1 e0 06          	shl    rax,0x6
  8032e1:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  8032e8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8032ec:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
  8032f3:	eb 75                	jmp    80336a <make_request+0x236>
    else{
        driver_args* p=dev->waiting_reqs;
  8032f5:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8032f9:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803300:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        for(;p->next;p=p->next);
  803304:	eb 0f                	jmp    803315 <make_request+0x1e1>
  803306:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80330a:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  803311:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  803315:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803319:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  803320:	48 85 c0             	test   rax,rax
  803323:	75 e1                	jne    803306 <make_request+0x1d2>
        p->next=&reqs[i];
  803325:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803328:	48 63 d0             	movsxd rdx,eax
  80332b:	48 89 d0             	mov    rax,rdx
  80332e:	48 01 c0             	add    rax,rax
  803331:	48 01 d0             	add    rax,rdx
  803334:	48 c1 e0 06          	shl    rax,0x6
  803338:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  80333f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803343:	48 89 90 b8 00 00 00 	mov    QWORD PTR [rax+0xb8],rdx
        reqs[i].next=NULL;
  80334a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80334d:	48 63 d0             	movsxd rdx,eax
  803350:	48 89 d0             	mov    rax,rdx
  803353:	48 01 c0             	add    rax,rax
  803356:	48 01 d0             	add    rax,rdx
  803359:	48 c1 e0 06          	shl    rax,0x6
  80335d:	48 05 38 6d 40 00    	add    rax,0x406d38
  803363:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }

    return i;
  80336a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  80336d:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  803371:	c9                   	leave  
  803372:	c3                   	ret    

0000000000803373 <do_req>:
//取出一个申请并且执行
int do_req()
{
  803373:	f3 0f 1e fa          	endbr64 
  803377:	55                   	push   rbp
  803378:	48 89 e5             	mov    rbp,rsp
  80337b:	48 83 ec 10          	sub    rsp,0x10
    //查看每个设备的请求情况
    //块设备
    for(int i=0;i<3;i++)
  80337f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803386:	e9 ab 00 00 00       	jmp    803436 <do_req+0xc3>
    {
        device* p=dev_tree[i];
  80338b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80338e:	48 98                	cdqe   
  803390:	48 8b 04 c5 80 84 40 	mov    rax,QWORD PTR [rax*8+0x408480]
  803397:	00 
  803398:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(;p;p=p->next)
  80339c:	e9 86 00 00 00       	jmp    803427 <do_req+0xb4>
        {
            //如果没有请求运行而且有请求要运行
            if(!p->running_req&&p->waiting_reqs)
  8033a1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033a5:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  8033ac:	48 85 c0             	test   rax,rax
  8033af:	75 67                	jne    803418 <do_req+0xa5>
  8033b1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033b5:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8033bc:	48 85 c0             	test   rax,rax
  8033bf:	74 57                	je     803418 <do_req+0xa5>
            {
                p->running_req=p->waiting_reqs;
  8033c1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033c5:	48 8b 90 88 00 00 00 	mov    rdx,QWORD PTR [rax+0x88]
  8033cc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033d0:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
                p->waiting_reqs=p->waiting_reqs->next;//取出一个
  8033d7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033db:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8033e2:	48 8b 90 b8 00 00 00 	mov    rdx,QWORD PTR [rax+0xb8]
  8033e9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033ed:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
                dev_funcs[p->operi](p->running_req);
  8033f4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033f8:	8b 80 a0 00 00 00    	mov    eax,DWORD PTR [rax+0xa0]
  8033fe:	48 98                	cdqe   
  803400:	48 8b 14 c5 c0 c2 80 	mov    rdx,QWORD PTR [rax*8+0x80c2c0]
  803407:	00 
  803408:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80340c:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  803413:	48 89 c7             	mov    rdi,rax
  803416:	ff d2                	call   rdx
        for(;p;p=p->next)
  803418:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80341c:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  803423:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  803427:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  80342c:	0f 85 6f ff ff ff    	jne    8033a1 <do_req+0x2e>
    for(int i=0;i<3;i++)
  803432:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803436:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  80343a:	0f 8e 4b ff ff ff    	jle    80338b <do_req+0x18>
            }
            //如果还在运行（DONE的状态不能直接覆盖，因为里面的运行结果可能还没被拿走）
        }
    }
    
    return 0;
  803440:	b8 00 00 00 00       	mov    eax,0x0
}
  803445:	c9                   	leave  
  803446:	c3                   	ret    

0000000000803447 <wait_on_req>:


void wait_on_req(int reqi)
{
  803447:	f3 0f 1e fa          	endbr64 
  80344b:	55                   	push   rbp
  80344c:	48 89 e5             	mov    rbp,rsp
  80344f:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(reqs[reqi].stat!=REQ_STAT_DONE);
  803452:	90                   	nop
  803453:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803456:	48 63 d0             	movsxd rdx,eax
  803459:	48 89 d0             	mov    rax,rdx
  80345c:	48 01 c0             	add    rax,rax
  80345f:	48 01 d0             	add    rax,rdx
  803462:	48 c1 e0 06          	shl    rax,0x6
  803466:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  80346c:	8b 00                	mov    eax,DWORD PTR [rax]
  80346e:	83 f8 03             	cmp    eax,0x3
  803471:	75 e0                	jne    803453 <wait_on_req+0xc>
}
  803473:	90                   	nop
  803474:	90                   	nop
  803475:	5d                   	pop    rbp
  803476:	c3                   	ret    

0000000000803477 <clear_req>:
void clear_req(int reqi)
{
  803477:	f3 0f 1e fa          	endbr64 
  80347b:	55                   	push   rbp
  80347c:	48 89 e5             	mov    rbp,rsp
  80347f:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    reqs[reqi].stat=REQ_STAT_EMPTY;
  803482:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803485:	48 63 d0             	movsxd rdx,eax
  803488:	48 89 d0             	mov    rax,rdx
  80348b:	48 01 c0             	add    rax,rax
  80348e:	48 01 d0             	add    rax,rdx
  803491:	48 c1 e0 06          	shl    rax,0x6
  803495:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  80349b:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  8034a1:	90                   	nop
  8034a2:	5d                   	pop    rbp
  8034a3:	c3                   	ret    

00000000008034a4 <init_proc>:
TSS *tss=0x108000;
int cur_proc=0;
int pidd=0;
int palloc_paddr=0;
static pid_t sidd=0;
void init_proc(){
  8034a4:	f3 0f 1e fa          	endbr64 
  8034a8:	55                   	push   rbp
  8034a9:	48 89 e5             	mov    rbp,rsp
  8034ac:	48 83 ec 10          	sub    rsp,0x10
    //task=(struct process*)get_global_var(TASK_PCBS_ADDR);//[MAX_TASKS];;
    for(int i=0;i<MAX_PROC_COUNT;i++){
  8034b0:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8034b7:	eb 4c                	jmp    803505 <init_proc+0x61>
        task[i].pid=-1;
  8034b9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034bc:	48 98                	cdqe   
  8034be:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8034c5:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8034cb:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
        task[i].stat=ENDED;
  8034d1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034d4:	48 98                	cdqe   
  8034d6:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8034dd:	48 05 b8 84 40 00    	add    rax,0x4084b8
  8034e3:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
        task[i].parent_pid=-1;
  8034e9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034ec:	48 98                	cdqe   
  8034ee:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8034f5:	48 05 3c 85 40 00    	add    rax,0x40853c
  8034fb:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<MAX_PROC_COUNT;i++){
  803501:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803505:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803509:	7e ae                	jle    8034b9 <init_proc+0x15>
    }
    cur_proc=0;//no proc
  80350b:	c7 05 17 21 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc12117],0x0        # 41562c <cur_proc>
  803512:	00 00 00 
    current=task;
  803515:	48 c7 05 80 20 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc12080],0x4084a0        # 4155a0 <current>
  80351c:	a0 84 40 00 
    pidd=1;
  803520:	c7 05 06 21 c1 ff 01 	mov    DWORD PTR [rip+0xffffffffffc12106],0x1        # 415630 <pidd>
  803527:	00 00 00 
     //创建0号进程
    int zi=create_proc();
  80352a:	b8 00 00 00 00       	mov    eax,0x0
  80352f:	e8 cf 02 00 00       	call   803803 <create_proc>
  803534:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    task[zi].stat=READY;
  803537:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80353a:	48 98                	cdqe   
  80353c:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803543:	48 05 b8 84 40 00    	add    rax,0x4084b8
  803549:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int xi= _LDT_IND(zi)*8;
  80354f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803552:	83 c0 03             	add    eax,0x3
  803555:	c1 e0 04             	shl    eax,0x4
  803558:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    zi=_TSS_IND(zi)*8;
  80355b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80355e:	01 c0                	add    eax,eax
  803560:	83 c0 05             	add    eax,0x5
  803563:	c1 e0 03             	shl    eax,0x3
  803566:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //asm volatile("lldt %0"::"m"(xi));
    //asm volatile("ltr %0"::"m"(zi));
    set_tss(0x400000,0x400000,0x400000,0x800000,0x800000,0x800000,0x800000,0x800000,0x800000,0x800000);
  803569:	68 00 00 80 00       	push   0x800000
  80356e:	68 00 00 80 00       	push   0x800000
  803573:	68 00 00 80 00       	push   0x800000
  803578:	68 00 00 80 00       	push   0x800000
  80357d:	41 b9 00 00 80 00    	mov    r9d,0x800000
  803583:	41 b8 00 00 80 00    	mov    r8d,0x800000
  803589:	b9 00 00 80 00       	mov    ecx,0x800000
  80358e:	ba 00 00 40 00       	mov    edx,0x400000
  803593:	be 00 00 40 00       	mov    esi,0x400000
  803598:	bf 00 00 40 00       	mov    edi,0x400000
  80359d:	e8 0f 13 00 00       	call   8048b1 <set_tss>
  8035a2:	48 83 c4 20          	add    rsp,0x20
    //IA32_INTERRUPT_SSP_TABLE_ADDR，准备IST
    wrmsr(0x6a8,tss->rsvd2);
  8035a6:	48 8b 05 33 8d 00 00 	mov    rax,QWORD PTR [rip+0x8d33]        # 80c2e0 <tss>
  8035ad:	48 8b 40 1c          	mov    rax,QWORD PTR [rax+0x1c]
  8035b1:	48 89 c6             	mov    rsi,rax
  8035b4:	bf a8 06 00 00       	mov    edi,0x6a8
  8035b9:	e8 66 d2 ff ff       	call   800824 <wrmsr>
    //把内核代码段选择子写到MSR寄存器中准备用于特权级转换(sysexit，现在没用)
    wrmsr(0x174,0x8);
  8035be:	be 08 00 00 00       	mov    esi,0x8
  8035c3:	bf 74 01 00 00       	mov    edi,0x174
  8035c8:	e8 57 d2 ff ff       	call   800824 <wrmsr>
    //准备用于特权级转换(sysret，正在使用)
    wrmsr(0xc0000081,0x0020000800000000ul);
  8035cd:	48 b8 00 00 00 00 08 	movabs rax,0x20000800000000
  8035d4:	00 20 00 
  8035d7:	48 89 c6             	mov    rsi,rax
  8035da:	b8 81 00 00 c0       	mov    eax,0xc0000081
  8035df:	48 89 c7             	mov    rdi,rax
  8035e2:	e8 3d d2 ff ff       	call   800824 <wrmsr>
    //创建一个测试进程
//    create_test_proc();
}
  8035e7:	90                   	nop
  8035e8:	c9                   	leave  
  8035e9:	c3                   	ret    

00000000008035ea <create_test_proc>:
void create_test_proc(){
  8035ea:	f3 0f 1e fa          	endbr64 
  8035ee:	55                   	push   rbp
  8035ef:	48 89 e5             	mov    rbp,rsp
  8035f2:	48 83 ec 20          	sub    rsp,0x20

    int index=req_proc();
  8035f6:	b8 00 00 00 00       	mov    eax,0x0
  8035fb:	e8 86 02 00 00       	call   803886 <req_proc>
  803600:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    task[index].stat=READY;
  803603:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803606:	48 98                	cdqe   
  803608:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80360f:	48 05 b8 84 40 00    	add    rax,0x4084b8
  803615:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int currsp=0x9fc00-1;
  80361b:	c7 45 ec ff fb 09 00 	mov    DWORD PTR [rbp-0x14],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  803622:	48 89 65 ec          	mov    QWORD PTR [rbp-0x14],rsp
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  803626:	ba 32 c2 80 00       	mov    edx,0x80c232
  80362b:	48 83 ec 08          	sub    rsp,0x8
  80362f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803632:	50                   	push   rax
  803633:	6a 00                	push   0x0
  803635:	52                   	push   rdx
  803636:	6a 00                	push   0x0
  803638:	6a 00                	push   0x0
  80363a:	6a 00                	push   0x0
  80363c:	68 58 7d 00 00       	push   0x7d58
  803641:	6a 10                	push   0x10
  803643:	6a 10                	push   0x10
  803645:	6a 10                	push   0x10
  803647:	6a 10                	push   0x10
  803649:	41 b9 08 00 00 00    	mov    r9d,0x8
  80364f:	41 b8 10 00 00 00    	mov    r8d,0x10
  803655:	b9 00 00 00 00       	mov    ecx,0x0
  80365a:	ba 00 00 00 00       	mov    edx,0x0
  80365f:	be 00 00 00 00       	mov    esi,0x0
  803664:	bf 00 00 00 00       	mov    edi,0x0
  803669:	e8 e4 02 00 00       	call   803952 <set_proc>
  80366e:	48 83 c4 60          	add    rsp,0x60
             0x7e00- sizeof(stack_store_regs), 0, 0, 0, (long)ret_sys_call, 0, index);
    task[index].tss.rsp0=0x400000;
  803672:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803675:	48 98                	cdqe   
  803677:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80367e:	48 05 70 86 40 00    	add    rax,0x408670
  803684:	48 c7 40 0c 00 00 40 	mov    QWORD PTR [rax+0xc],0x400000
  80368b:	00 
    task[index].mem_struct.stack_top=0x7e00;
  80368c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80368f:	48 98                	cdqe   
  803691:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803698:	48 05 d4 84 40 00    	add    rax,0x4084d4
  80369e:	c7 00 00 7e 00 00    	mov    DWORD PTR [rax],0x7e00
    task[index].mem_struct.stack_bottom=0x6e00;
  8036a4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036a7:	48 98                	cdqe   
  8036a9:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8036b0:	48 05 d0 84 40 00    	add    rax,0x4084d0
  8036b6:	c7 00 00 6e 00 00    	mov    DWORD PTR [rax],0x6e00
    task[index].mem_struct.heap_top=0x1101000;
  8036bc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036bf:	48 98                	cdqe   
  8036c1:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8036c8:	48 05 cc 84 40 00    	add    rax,0x4084cc
  8036ce:	c7 00 00 10 10 01    	mov    DWORD PTR [rax],0x1101000
    task[index].mem_struct.heap_base=0x1100000;
  8036d4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036d7:	48 98                	cdqe   
  8036d9:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8036e0:	48 05 c8 84 40 00    	add    rax,0x4084c8
  8036e6:	c7 00 00 00 10 01    	mov    DWORD PTR [rax],0x1100000

    //把还原现场时用到的堆栈设置好
    stack_store_regs *str= (stack_store_regs *) (0x7e00 - sizeof(stack_store_regs));
  8036ec:	48 c7 45 f0 58 7d 00 	mov    QWORD PTR [rbp-0x10],0x7d58
  8036f3:	00 
    str->rax=0;
  8036f4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8036f8:	48 c7 40 78 00 00 00 	mov    QWORD PTR [rax+0x78],0x0
  8036ff:	00 
    str->rbx=0;
  803700:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803704:	48 c7 40 70 00 00 00 	mov    QWORD PTR [rax+0x70],0x0
  80370b:	00 
    str->rcx=proc_zero;//sysret采用的返回地址
  80370c:	ba c6 3a 80 00       	mov    edx,0x803ac6
  803711:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803715:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    str->rdx=0;
  803719:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80371d:	48 c7 40 60 00 00 00 	mov    QWORD PTR [rax+0x60],0x0
  803724:	00 
    str->rsi=0;
  803725:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803729:	48 c7 40 50 00 00 00 	mov    QWORD PTR [rax+0x50],0x0
  803730:	00 
    str->rdi=0;
  803731:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803735:	48 c7 40 58 00 00 00 	mov    QWORD PTR [rax+0x58],0x0
  80373c:	00 
    str->r15=0;
  80373d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803741:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  803748:	00 
    str->r14=0;
  803749:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80374d:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  803754:	00 
    str->r13=0;
  803755:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803759:	48 c7 40 20 00 00 00 	mov    QWORD PTR [rax+0x20],0x0
  803760:	00 
    str->r12=0;
  803761:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803765:	48 c7 40 28 00 00 00 	mov    QWORD PTR [rax+0x28],0x0
  80376c:	00 
    str->r11=0x200;
  80376d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803771:	48 c7 40 30 00 02 00 	mov    QWORD PTR [rax+0x30],0x200
  803778:	00 
    str->r10=0;
  803779:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80377d:	48 c7 40 38 00 00 00 	mov    QWORD PTR [rax+0x38],0x0
  803784:	00 
    str->r9=0;
  803785:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803789:	48 c7 40 40 00 00 00 	mov    QWORD PTR [rax+0x40],0x0
  803790:	00 
    str->r8=0;
  803791:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803795:	48 c7 40 48 00 00 00 	mov    QWORD PTR [rax+0x48],0x0
  80379c:	00 
    str->rip=proc_zero;
  80379d:	ba c6 3a 80 00       	mov    edx,0x803ac6
  8037a2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037a6:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
    str->cs=0x8;
  8037ad:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037b1:	48 c7 80 88 00 00 00 	mov    QWORD PTR [rax+0x88],0x8
  8037b8:	08 00 00 00 
    str->rflags=0x00200206;
  8037bc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037c0:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x200206
  8037c7:	06 02 20 00 
    str->rsp=0x7e00;
  8037cb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037cf:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x7e00
  8037d6:	00 7e 00 00 
    str->ss=0x2b;
  8037da:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037de:	48 c7 80 a0 00 00 00 	mov    QWORD PTR [rax+0xa0],0x2b
  8037e5:	2b 00 00 00 
    str->ds=0x2b;
  8037e9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037ed:	48 c7 00 2b 00 00 00 	mov    QWORD PTR [rax],0x2b
    str->es=0x2b;
  8037f4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037f8:	48 c7 40 08 2b 00 00 	mov    QWORD PTR [rax+0x8],0x2b
  8037ff:	00 

}
  803800:	90                   	nop
  803801:	c9                   	leave  
  803802:	c3                   	ret    

0000000000803803 <create_proc>:
int create_proc()
{
  803803:	f3 0f 1e fa          	endbr64 
  803807:	55                   	push   rbp
  803808:	48 89 e5             	mov    rbp,rsp
  80380b:	48 83 ec 10          	sub    rsp,0x10
    int index=req_proc();
  80380f:	b8 00 00 00 00       	mov    eax,0x0
  803814:	e8 6d 00 00 00       	call   803886 <req_proc>
  803819:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(index==-1)return -1;
  80381c:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  803820:	75 07                	jne    803829 <create_proc+0x26>
  803822:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803827:	eb 5b                	jmp    803884 <create_proc+0x81>
    int currsp=0x9fc00-1;
  803829:	c7 45 f8 ff fb 09 00 	mov    DWORD PTR [rbp-0x8],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  803830:	48 89 65 f8          	mov    QWORD PTR [rbp-0x8],rsp
    //默认DPL=3
    //set_proc(0,0,0,0,0x23,0x1b,0x23,0x23,0x23,0x23,curesp,0,0,0,0,index);
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  803834:	b9 c6 3a 80 00       	mov    ecx,0x803ac6
  803839:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80383c:	48 98                	cdqe   
  80383e:	48 83 ec 08          	sub    rsp,0x8
  803842:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  803845:	52                   	push   rdx
  803846:	6a 00                	push   0x0
  803848:	51                   	push   rcx
  803849:	6a 00                	push   0x0
  80384b:	6a 00                	push   0x0
  80384d:	6a 00                	push   0x0
  80384f:	50                   	push   rax
  803850:	6a 10                	push   0x10
  803852:	6a 10                	push   0x10
  803854:	6a 10                	push   0x10
  803856:	6a 10                	push   0x10
  803858:	41 b9 08 00 00 00    	mov    r9d,0x8
  80385e:	41 b8 10 00 00 00    	mov    r8d,0x10
  803864:	b9 00 00 00 00       	mov    ecx,0x0
  803869:	ba 00 00 00 00       	mov    edx,0x0
  80386e:	be 00 00 00 00       	mov    esi,0x0
  803873:	bf 00 00 00 00       	mov    edi,0x0
  803878:	e8 d5 00 00 00       	call   803952 <set_proc>
  80387d:	48 83 c4 60          	add    rsp,0x60
             currsp, 0, 0, 0, (long)proc_zero, 0, index);
//    task[index].tss.eip=(long)proc_zero;

    return index;
  803881:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803884:	c9                   	leave  
  803885:	c3                   	ret    

0000000000803886 <req_proc>:
int req_proc(){
  803886:	f3 0f 1e fa          	endbr64 
  80388a:	55                   	push   rbp
  80388b:	48 89 e5             	mov    rbp,rsp
    int num=0;
  80388e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803895:	eb 04                	jmp    80389b <req_proc+0x15>
    num<=MAX_PROC_COUNT){
        num++;
  803897:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  80389b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80389e:	48 98                	cdqe   
  8038a0:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8038a7:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8038ad:	8b 00                	mov    eax,DWORD PTR [rax]
  8038af:	83 f8 ff             	cmp    eax,0xffffffff
  8038b2:	74 1f                	je     8038d3 <req_proc+0x4d>
  8038b4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8038b7:	48 98                	cdqe   
  8038b9:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8038c0:	48 05 b8 84 40 00    	add    rax,0x4084b8
  8038c6:	8b 00                	mov    eax,DWORD PTR [rax]
  8038c8:	83 f8 03             	cmp    eax,0x3
  8038cb:	74 06                	je     8038d3 <req_proc+0x4d>
  8038cd:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  8038d1:	7e c4                	jle    803897 <req_proc+0x11>
    }
    if(num>=MAX_PROC_COUNT)
  8038d3:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8038d7:	7e 07                	jle    8038e0 <req_proc+0x5a>
        return -1;
  8038d9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8038de:	eb 70                	jmp    803950 <req_proc+0xca>
    task[num].pid=pidd++;
  8038e0:	8b 05 4a 1d c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11d4a]        # 415630 <pidd>
  8038e6:	8d 50 01             	lea    edx,[rax+0x1]
  8038e9:	89 15 41 1d c1 ff    	mov    DWORD PTR [rip+0xffffffffffc11d41],edx        # 415630 <pidd>
  8038ef:	89 c2                	mov    edx,eax
  8038f1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8038f4:	48 98                	cdqe   
  8038f6:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8038fd:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803903:	89 10                	mov    DWORD PTR [rax],edx
    task[num].stat=ENDED;
  803905:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803908:	48 98                	cdqe   
  80390a:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803911:	48 05 b8 84 40 00    	add    rax,0x4084b8
  803917:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[num].utime=0;
  80391d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803920:	48 98                	cdqe   
  803922:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803929:	48 05 bc 84 40 00    	add    rax,0x4084bc
  80392f:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[num].priority=0;
  803935:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803938:	48 98                	cdqe   
  80393a:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803941:	48 05 c0 84 40 00    	add    rax,0x4084c0
  803947:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return num;
  80394d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803950:	5d                   	pop    rbp
  803951:	c3                   	ret    

0000000000803952 <set_proc>:
void set_proc(long rax, long rbx, long rcx, long rdx, long es, long cs, long ss, long ds, long fs, long gs, long rsp,
              long rbp, long rsi, long rdi, long rip, long rflags, int proc_nr) {
  803952:	f3 0f 1e fa          	endbr64 
  803956:	55                   	push   rbp
  803957:	48 89 e5             	mov    rbp,rsp
  80395a:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80395e:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  803962:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  803966:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  80396a:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
  80396e:	4c 89 4d c0          	mov    QWORD PTR [rbp-0x40],r9
    struct process* proc=&task[proc_nr];
  803972:	8b 45 60             	mov    eax,DWORD PTR [rbp+0x60]
  803975:	48 98                	cdqe   
  803977:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80397e:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803984:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    proc->regs.rax=rax;
  803988:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80398c:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  803990:	48 89 90 5c 02 00 00 	mov    QWORD PTR [rax+0x25c],rdx
    proc->regs.rbx=rbx;
  803997:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80399b:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  80399f:	48 89 90 74 02 00 00 	mov    QWORD PTR [rax+0x274],rdx
    proc->regs.rcx=rcx;
  8039a6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8039aa:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8039ae:	48 89 90 64 02 00 00 	mov    QWORD PTR [rax+0x264],rdx
    proc->regs.rdx=rdx;
  8039b5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8039b9:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8039bd:	48 89 90 6c 02 00 00 	mov    QWORD PTR [rax+0x26c],rdx
    proc->regs.es=es;
  8039c4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8039c8:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  8039cc:	48 89 90 9c 02 00 00 	mov    QWORD PTR [rax+0x29c],rdx
    proc->regs.cs=cs;
  8039d3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8039d7:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  8039db:	48 89 90 a4 02 00 00 	mov    QWORD PTR [rax+0x2a4],rdx
    proc->regs.ss=ss;
  8039e2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8039e6:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  8039ea:	48 89 90 ac 02 00 00 	mov    QWORD PTR [rax+0x2ac],rdx
    proc->regs.ds=ds;
  8039f1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8039f5:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  8039f9:	48 89 90 b4 02 00 00 	mov    QWORD PTR [rax+0x2b4],rdx
    proc->regs.fs=fs;
  803a00:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a04:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  803a08:	48 89 90 bc 02 00 00 	mov    QWORD PTR [rax+0x2bc],rdx
    proc->regs.gs=gs;
  803a0f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a13:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  803a17:	48 89 90 c4 02 00 00 	mov    QWORD PTR [rax+0x2c4],rdx
    proc->regs.rsp=rsp;
  803a1e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a22:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803a26:	48 89 90 7c 02 00 00 	mov    QWORD PTR [rax+0x27c],rdx
    proc->regs.rbp=rbp;
  803a2d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a31:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
  803a35:	48 89 90 84 02 00 00 	mov    QWORD PTR [rax+0x284],rdx
    proc->regs.rsi=rsi;
  803a3c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a40:	48 8b 55 40          	mov    rdx,QWORD PTR [rbp+0x40]
  803a44:	48 89 90 8c 02 00 00 	mov    QWORD PTR [rax+0x28c],rdx
    proc->regs.rdi=rdi;
  803a4b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a4f:	48 8b 55 48          	mov    rdx,QWORD PTR [rbp+0x48]
  803a53:	48 89 90 94 02 00 00 	mov    QWORD PTR [rax+0x294],rdx
    proc->regs.rflags=0x202;//设置为默认值:0b 0010 0000 0010
  803a5a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a5e:	48 c7 80 54 02 00 00 	mov    QWORD PTR [rax+0x254],0x202
  803a65:	02 02 00 00 
    //能接受中断
    proc->regs.rip=rip;
  803a69:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a6d:	48 8b 55 50          	mov    rdx,QWORD PTR [rbp+0x50]
  803a71:	48 89 90 4c 02 00 00 	mov    QWORD PTR [rax+0x24c],rdx

    proc->regs.cs=cs;
  803a78:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a7c:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803a80:	48 89 90 a4 02 00 00 	mov    QWORD PTR [rax+0x2a4],rdx
    proc->regs.ds=ds;
  803a87:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a8b:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803a8f:	48 89 90 b4 02 00 00 	mov    QWORD PTR [rax+0x2b4],rdx
    proc->regs.es=es;
  803a96:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a9a:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803a9e:	48 89 90 9c 02 00 00 	mov    QWORD PTR [rax+0x29c],rdx
    proc->regs.cr3=PML4_ADDR;//get_phyaddr(n1);//暂时先搞成全局
  803aa5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803aa9:	48 c7 80 44 02 00 00 	mov    QWORD PTR [rax+0x244],0x101000
  803ab0:	00 10 10 00 
    proc->pml4=PML4_ADDR;
  803ab4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ab8:	48 c7 80 c0 00 00 00 	mov    QWORD PTR [rax+0xc0],0x101000
  803abf:	00 10 10 00 


}
  803ac3:	90                   	nop
  803ac4:	5d                   	pop    rbp
  803ac5:	c3                   	ret    

0000000000803ac6 <proc_zero>:
void proc_zero()
{
  803ac6:	f3 0f 1e fa          	endbr64 
  803aca:	55                   	push   rbp
  803acb:	48 89 e5             	mov    rbp,rsp
  803ace:	48 83 ec 10          	sub    rsp,0x10
//    }else{
//        printf("parent proc ret:%d\n",rax);
//    }
    while (1)
    {
        char c= sys_analyse_key();
  803ad2:	b8 00 00 00 00       	mov    eax,0x0
  803ad7:	e8 b3 44 00 00       	call   807f8f <sys_analyse_key>
  803adc:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        putchar(c);
  803adf:	0f be 45 ff          	movsx  eax,BYTE PTR [rbp-0x1]
  803ae3:	89 c7                	mov    edi,eax
  803ae5:	e8 13 d2 ff ff       	call   800cfd <putchar>
    {
  803aea:	eb e6                	jmp    803ad2 <proc_zero+0xc>

0000000000803aec <save_rsp>:
    }
}
void save_rsp(){
  803aec:	f3 0f 1e fa          	endbr64 
  803af0:	55                   	push   rbp
  803af1:	48 89 e5             	mov    rbp,rsp
    //在时钟中断context下
    addr_t * p=INT_STACK_TOP-16;
  803af4:	48 c7 45 f8 f0 ff 7f 	mov    QWORD PTR [rbp-0x8],0x7ffff0
  803afb:	00 
    current->regs.rsp=*p;
  803afc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b00:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803b03:	48 8b 05 96 1a c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc11a96]        # 4155a0 <current>
  803b0a:	48 89 90 7c 02 00 00 	mov    QWORD PTR [rax+0x27c],rdx
}
  803b11:	90                   	nop
  803b12:	5d                   	pop    rbp
  803b13:	c3                   	ret    

0000000000803b14 <manage_proc>:
void manage_proc(){
  803b14:	f3 0f 1e fa          	endbr64 
  803b18:	55                   	push   rbp
  803b19:	48 89 e5             	mov    rbp,rsp
  803b1c:	48 83 ec 10          	sub    rsp,0x10
    if(cur_proc!=-1)
  803b20:	8b 05 06 1b c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11b06]        # 41562c <cur_proc>
  803b26:	83 f8 ff             	cmp    eax,0xffffffff
  803b29:	74 2d                	je     803b58 <manage_proc+0x44>
        task[cur_proc].utime++;
  803b2b:	8b 05 fb 1a c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11afb]        # 41562c <cur_proc>
  803b31:	48 63 d0             	movsxd rdx,eax
  803b34:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  803b3b:	48 81 c2 bc 84 40 00 	add    rdx,0x4084bc
  803b42:	8b 12                	mov    edx,DWORD PTR [rdx]
  803b44:	83 c2 01             	add    edx,0x1
  803b47:	48 98                	cdqe   
  803b49:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803b50:	48 05 bc 84 40 00    	add    rax,0x4084bc
  803b56:	89 10                	mov    DWORD PTR [rax],edx
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803b58:	8b 05 ce 1a c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11ace]        # 41562c <cur_proc>
  803b5e:	83 f8 ff             	cmp    eax,0xffffffff
  803b61:	74 3c                	je     803b9f <manage_proc+0x8b>
  803b63:	8b 05 c3 1a c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11ac3]        # 41562c <cur_proc>
  803b69:	48 98                	cdqe   
  803b6b:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803b72:	48 05 bc 84 40 00    	add    rax,0x4084bc
  803b78:	8b 00                	mov    eax,DWORD PTR [rax]
  803b7a:	83 f8 0a             	cmp    eax,0xa
  803b7d:	77 20                	ja     803b9f <manage_proc+0x8b>
    task[cur_proc].stat!=READY){
  803b7f:	8b 05 a7 1a c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11aa7]        # 41562c <cur_proc>
  803b85:	48 98                	cdqe   
  803b87:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803b8e:	48 05 b8 84 40 00    	add    rax,0x4084b8
  803b94:	8b 00                	mov    eax,DWORD PTR [rax]
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803b96:	83 f8 01             	cmp    eax,0x1
  803b99:	0f 84 02 01 00 00    	je     803ca1 <manage_proc+0x18d>
        if(cur_proc!=-1)
  803b9f:	8b 05 87 1a c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11a87]        # 41562c <cur_proc>
  803ba5:	83 f8 ff             	cmp    eax,0xffffffff
  803ba8:	74 1b                	je     803bc5 <manage_proc+0xb1>
            task[cur_proc].utime=0;
  803baa:	8b 05 7c 1a c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11a7c]        # 41562c <cur_proc>
  803bb0:	48 98                	cdqe   
  803bb2:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803bb9:	48 05 bc 84 40 00    	add    rax,0x4084bc
  803bbf:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        //find
        int i=cur_proc+1;
  803bc5:	8b 05 61 1a c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11a61]        # 41562c <cur_proc>
  803bcb:	83 c0 01             	add    eax,0x1
  803bce:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        int times=0;
  803bd1:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
        //轮询，直到有一个符合条件
        while(times<10){
  803bd8:	eb 52                	jmp    803c2c <manage_proc+0x118>
            if(task[i].pid!=-1&&task[i].stat==READY&&i!=cur_proc){
  803bda:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803bdd:	48 98                	cdqe   
  803bdf:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803be6:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803bec:	8b 00                	mov    eax,DWORD PTR [rax]
  803bee:	83 f8 ff             	cmp    eax,0xffffffff
  803bf1:	74 24                	je     803c17 <manage_proc+0x103>
  803bf3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803bf6:	48 98                	cdqe   
  803bf8:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803bff:	48 05 b8 84 40 00    	add    rax,0x4084b8
  803c05:	8b 00                	mov    eax,DWORD PTR [rax]
  803c07:	83 f8 01             	cmp    eax,0x1
  803c0a:	75 0b                	jne    803c17 <manage_proc+0x103>
  803c0c:	8b 05 1a 1a c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11a1a]        # 41562c <cur_proc>
  803c12:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  803c15:	75 1d                	jne    803c34 <manage_proc+0x120>
                break;
            }
            i++;
  803c17:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
            if(i>=MAX_TASKS){
  803c1b:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  803c1f:	7e 0b                	jle    803c2c <manage_proc+0x118>
                times++;
  803c21:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                i=0;
  803c25:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        while(times<10){
  803c2c:	83 7d f8 09          	cmp    DWORD PTR [rbp-0x8],0x9
  803c30:	7e a8                	jle    803bda <manage_proc+0xc6>
  803c32:	eb 01                	jmp    803c35 <manage_proc+0x121>
                break;
  803c34:	90                   	nop
            }
        }
        if(times==10)return;//超过十次尝试都没有，暂时不切换
  803c35:	83 7d f8 0a          	cmp    DWORD PTR [rbp-0x8],0xa
  803c39:	74 69                	je     803ca4 <manage_proc+0x190>
        //switch
        task[cur_proc].stat=READY;
  803c3b:	8b 05 eb 19 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc119eb]        # 41562c <cur_proc>
  803c41:	48 98                	cdqe   
  803c43:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803c4a:	48 05 b8 84 40 00    	add    rax,0x4084b8
  803c50:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        task[i].stat=RUNNING;
  803c56:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803c59:	48 98                	cdqe   
  803c5b:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803c62:	48 05 b8 84 40 00    	add    rax,0x4084b8
  803c68:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        switch_to(&task[cur_proc], &task[i]);
  803c6e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803c71:	48 98                	cdqe   
  803c73:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803c7a:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  803c81:	8b 05 a5 19 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc119a5]        # 41562c <cur_proc>
  803c87:	48 98                	cdqe   
  803c89:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803c90:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803c96:	48 89 d6             	mov    rsi,rdx
  803c99:	48 89 c7             	mov    rdi,rax
  803c9c:	e8 82 0a 00 00       	call   804723 <switch_to>
    }
    return;
  803ca1:	90                   	nop
  803ca2:	eb 01                	jmp    803ca5 <manage_proc+0x191>
        if(times==10)return;//超过十次尝试都没有，暂时不切换
  803ca4:	90                   	nop
}
  803ca5:	c9                   	leave  
  803ca6:	c3                   	ret    

0000000000803ca7 <switch_proc_tss>:

void switch_proc_tss(int pnr)
{
  803ca7:	f3 0f 1e fa          	endbr64 
  803cab:	55                   	push   rbp
  803cac:	48 89 e5             	mov    rbp,rsp
  803caf:	48 83 ec 20          	sub    rsp,0x20
  803cb3:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int sel=_TSS_IND(pnr)*8;
  803cb6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803cb9:	01 c0                	add    eax,eax
  803cbb:	83 c0 05             	add    eax,0x5
  803cbe:	c1 e0 03             	shl    eax,0x3
  803cc1:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    cur_proc=pnr;
  803cc4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803cc7:	89 05 5f 19 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1195f],eax        # 41562c <cur_proc>
    switch_proc_asm(sel);
  803ccd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803cd0:	89 c7                	mov    edi,eax
  803cd2:	e8 73 84 00 00       	call   80c14a <switch_proc_asm>
}
  803cd7:	90                   	nop
  803cd8:	c9                   	leave  
  803cd9:	c3                   	ret    

0000000000803cda <switch_proc>:
void switch_proc(int pnr){
  803cda:	f3 0f 1e fa          	endbr64 
  803cde:	55                   	push   rbp
  803cdf:	48 89 e5             	mov    rbp,rsp
  803ce2:	48 81 ec 30 03 00 00 	sub    rsp,0x330
  803ce9:	89 bd dc fc ff ff    	mov    DWORD PTR [rbp-0x324],edi
    //printf("switching proc to %d\n",pnr);
    //printf("eip:%x\n",task[pnr].tss.eip);
    struct process p=task[pnr];
  803cef:	8b 85 dc fc ff ff    	mov    eax,DWORD PTR [rbp-0x324]
  803cf5:	48 98                	cdqe   
  803cf7:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803cfe:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  803d05:	48 8d 85 e0 fc ff ff 	lea    rax,[rbp-0x320]
  803d0c:	b9 63 00 00 00       	mov    ecx,0x63
  803d11:	48 89 c7             	mov    rdi,rax
  803d14:	48 89 d6             	mov    rsi,rdx
  803d17:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
  803d1a:	48 89 f2             	mov    rdx,rsi
  803d1d:	48 89 f8             	mov    rax,rdi
  803d20:	8b 0a                	mov    ecx,DWORD PTR [rdx]
  803d22:	89 08                	mov    DWORD PTR [rax],ecx
    save_context(&task[cur_proc].tss);
  803d24:	8b 05 02 19 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11902]        # 41562c <cur_proc>
  803d2a:	48 98                	cdqe   
  803d2c:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803d33:	48 05 d0 01 00 00    	add    rax,0x1d0
  803d39:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803d3f:	48 83 c0 08          	add    rax,0x8
  803d43:	48 89 c7             	mov    rdi,rax
  803d46:	e8 4c 00 00 00       	call   803d97 <save_context>
//    //重新设置0号进程
//    task[0].tss.eip=proc_zero;
//    task[0].tss.cr3=PAGE_INDEX_ADDR;
//    task[0].tss.eflags=0x202;
    cur_proc=pnr;
  803d4b:	8b 85 dc fc ff ff    	mov    eax,DWORD PTR [rbp-0x324]
  803d51:	89 05 d5 18 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc118d5],eax        # 41562c <cur_proc>
    int sel=_TSS_IND(pnr)*8;
  803d57:	8b 85 dc fc ff ff    	mov    eax,DWORD PTR [rbp-0x324]
  803d5d:	01 c0                	add    eax,eax
  803d5f:	83 c0 05             	add    eax,0x5
  803d62:	c1 e0 03             	shl    eax,0x3
  803d65:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    switch_to(NULL, &task[pnr].tss);
  803d68:	8b 85 dc fc ff ff    	mov    eax,DWORD PTR [rbp-0x324]
  803d6e:	48 98                	cdqe   
  803d70:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803d77:	48 05 d0 01 00 00    	add    rax,0x1d0
  803d7d:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803d83:	48 83 c0 08          	add    rax,0x8
  803d87:	48 89 c6             	mov    rsi,rax
  803d8a:	bf 00 00 00 00       	mov    edi,0x0
  803d8f:	e8 8f 09 00 00       	call   804723 <switch_to>
    //asm volatile("push %0":"=r"(task[pnr].tss.eip));
    //switch_proc_asm(pnr*8+0x8*3);
}
  803d94:	90                   	nop
  803d95:	c9                   	leave  
  803d96:	c3                   	ret    

0000000000803d97 <save_context>:
void save_context(TSS *tss)
{
  803d97:	f3 0f 1e fa          	endbr64 
  803d9b:	55                   	push   rbp
  803d9c:	48 89 e5             	mov    rbp,rsp
  803d9f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//    tss->esi=scene_saver.esi;
//    tss->edi=scene_saver.edi;
//    tss->eflags=scene_saver.eflags;
//    tss->esp=scene_saver.esp;
//    tss->ebp=scene_saver.ebp;
}
  803da3:	90                   	nop
  803da4:	5d                   	pop    rbp
  803da5:	c3                   	ret    

0000000000803da6 <palloc>:
    task[index].stat=READY;
    return index;
} */
//为指定进程申请新的内存，并返回这块内存的线性地址。
void* palloc(int proc_index,int size)
{
  803da6:	f3 0f 1e fa          	endbr64 
  803daa:	55                   	push   rbp
  803dab:	48 89 e5             	mov    rbp,rsp
  803dae:	48 83 ec 60          	sub    rsp,0x60
  803db2:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  803db5:	89 75 a8             	mov    DWORD PTR [rbp-0x58],esi
    int page_c=size/4096+size%4096?1:0;
  803db8:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  803dbb:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  803dc1:	85 c0                	test   eax,eax
  803dc3:	0f 48 c2             	cmovs  eax,edx
  803dc6:	c1 f8 0c             	sar    eax,0xc
  803dc9:	89 c1                	mov    ecx,eax
  803dcb:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  803dce:	99                   	cdq    
  803dcf:	c1 ea 14             	shr    edx,0x14
  803dd2:	01 d0                	add    eax,edx
  803dd4:	25 ff 0f 00 00       	and    eax,0xfff
  803dd9:	29 d0                	sub    eax,edx
  803ddb:	01 c8                	add    eax,ecx
  803ddd:	85 c0                	test   eax,eax
  803ddf:	0f 95 c0             	setne  al
  803de2:	0f b6 c0             	movzx  eax,al
  803de5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=0;
  803de8:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    void *ptr=NULL;
  803def:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  803df6:	00 
    page_item *pgind=NULL;//task[proc_index].tss.cr3;
  803df7:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  803dfe:	00 
    pgind++;
  803dff:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  803e04:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [rbp-0x14],0x1
  803e0b:	e9 30 02 00 00       	jmp    804040 <palloc+0x29a>
    {
        page_item* tblp=*pgind&0xfffff000;
  803e10:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803e14:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803e17:	25 00 f0 ff ff       	and    eax,0xfffff000
  803e1c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for(int j=0;j<1024;j++)
  803e20:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  803e27:	e9 fe 01 00 00       	jmp    80402a <palloc+0x284>
        {
            int v=*tblp&PAGE_PRESENT;
  803e2c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803e30:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803e33:	83 e0 01             	and    eax,0x1
  803e36:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
            if(!v)
  803e39:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  803e3d:	0f 85 de 01 00 00    	jne    804021 <palloc+0x27b>
            {
                int new_pg=req_a_page();
  803e43:	b8 00 00 00 00       	mov    eax,0x0
  803e48:	e8 26 d8 ff ff       	call   801673 <req_a_page>
  803e4d:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
                if(new_pg==-1)
  803e50:	83 7d c8 ff          	cmp    DWORD PTR [rbp-0x38],0xffffffff
  803e54:	0f 85 b9 00 00 00    	jne    803f13 <palloc+0x16d>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  803e5a:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803e5d:	48 98                	cdqe   
  803e5f:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803e66:	48 05 08 85 40 00    	add    rax,0x408508
  803e6c:	0f b7 00             	movzx  eax,WORD PTR [rax]
  803e6f:	0f b7 c0             	movzx  eax,ax
  803e72:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  803e75:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803e78:	48 98                	cdqe   
  803e7a:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803e81:	48 05 00 85 40 00    	add    rax,0x408500
  803e87:	0f b7 40 0d          	movzx  eax,WORD PTR [rax+0xd]
  803e8b:	0f b7 c0             	movzx  eax,ax
  803e8e:	c1 e0 10             	shl    eax,0x10
  803e91:	25 00 00 0f 00       	and    eax,0xf0000
  803e96:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    size+=c;
  803e99:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803e9c:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  803e9f:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  803ea2:	89 c2                	mov    edx,eax
  803ea4:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803ea7:	48 98                	cdqe   
  803ea9:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803eb0:	48 05 08 85 40 00    	add    rax,0x408508
  803eb6:	66 89 10             	mov    WORD PTR [rax],dx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  803eb9:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803ebc:	48 98                	cdqe   
  803ebe:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803ec5:	48 05 00 85 40 00    	add    rax,0x408500
  803ecb:	0f b7 40 0d          	movzx  eax,WORD PTR [rax+0xd]
  803ecf:	0f b7 c0             	movzx  eax,ax
  803ed2:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    tmp_attr&=0xfff0;
  803ed5:	81 65 b0 f0 ff 00 00 	and    DWORD PTR [rbp-0x50],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  803edc:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  803edf:	c1 e8 10             	shr    eax,0x10
  803ee2:	83 e0 0f             	and    eax,0xf
  803ee5:	89 c2                	mov    edx,eax
  803ee7:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  803eea:	01 d0                	add    eax,edx
  803eec:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  803eef:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  803ef2:	89 c2                	mov    edx,eax
  803ef4:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803ef7:	48 98                	cdqe   
  803ef9:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803f00:	48 05 00 85 40 00    	add    rax,0x408500
  803f06:	66 89 50 0d          	mov    WORD PTR [rax+0xd],dx
                    return ptr;//失败了，只能申请一部分的内存或者返回NULL
  803f0a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803f0e:	e9 3f 01 00 00       	jmp    804052 <palloc+0x2ac>
                }
                int addr=get_phyaddr(new_pg);
  803f13:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  803f16:	89 c7                	mov    edi,eax
  803f18:	e8 45 d9 ff ff       	call   801862 <get_phyaddr>
  803f1d:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
                set_page_item(tblp,addr,PAGE_PRESENT|\
  803f20:	8b 4d c4             	mov    ecx,DWORD PTR [rbp-0x3c]
  803f23:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803f27:	ba 07 00 00 00       	mov    edx,0x7
  803f2c:	89 ce                	mov    esi,ecx
  803f2e:	48 89 c7             	mov    rdi,rax
  803f31:	e8 3f d9 ff ff       	call   801875 <set_page_item>
                PAGE_RWX|PAGE_FOR_ALL);
                int laddr=i*0x400000+j*0x1000;//线性地址
  803f36:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803f39:	c1 e0 0a             	shl    eax,0xa
  803f3c:	89 c2                	mov    edx,eax
  803f3e:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  803f41:	01 d0                	add    eax,edx
  803f43:	c1 e0 0c             	shl    eax,0xc
  803f46:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
                if(ptr==NULL)
  803f49:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
  803f4e:	75 09                	jne    803f59 <palloc+0x1b3>
                {
                   // ptr=laddr;
                    palloc_paddr=addr;
  803f50:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  803f53:	89 05 db 16 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc116db],eax        # 415634 <palloc_paddr>
                }
                page_c--;
  803f59:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
                c++;
  803f5d:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                if(page_c==0)
  803f61:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  803f65:	0f 85 b6 00 00 00    	jne    804021 <palloc+0x27b>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  803f6b:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803f6e:	48 98                	cdqe   
  803f70:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803f77:	48 05 08 85 40 00    	add    rax,0x408508
  803f7d:	0f b7 00             	movzx  eax,WORD PTR [rax]
  803f80:	0f b7 c0             	movzx  eax,ax
  803f83:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  803f86:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803f89:	48 98                	cdqe   
  803f8b:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803f92:	48 05 00 85 40 00    	add    rax,0x408500
  803f98:	0f b7 40 0d          	movzx  eax,WORD PTR [rax+0xd]
  803f9c:	0f b7 c0             	movzx  eax,ax
  803f9f:	c1 e0 10             	shl    eax,0x10
  803fa2:	25 00 00 0f 00       	and    eax,0xf0000
  803fa7:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    size+=c;
  803faa:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803fad:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  803fb0:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  803fb3:	89 c2                	mov    edx,eax
  803fb5:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803fb8:	48 98                	cdqe   
  803fba:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803fc1:	48 05 08 85 40 00    	add    rax,0x408508
  803fc7:	66 89 10             	mov    WORD PTR [rax],dx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  803fca:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803fcd:	48 98                	cdqe   
  803fcf:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803fd6:	48 05 00 85 40 00    	add    rax,0x408500
  803fdc:	0f b7 40 0d          	movzx  eax,WORD PTR [rax+0xd]
  803fe0:	0f b7 c0             	movzx  eax,ax
  803fe3:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    tmp_attr&=0xfff0;
  803fe6:	81 65 b8 f0 ff 00 00 	and    DWORD PTR [rbp-0x48],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  803fed:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  803ff0:	c1 e8 10             	shr    eax,0x10
  803ff3:	83 e0 0f             	and    eax,0xf
  803ff6:	89 c2                	mov    edx,eax
  803ff8:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  803ffb:	01 d0                	add    eax,edx
  803ffd:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  804000:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  804003:	89 c2                	mov    edx,eax
  804005:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804008:	48 98                	cdqe   
  80400a:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804011:	48 05 00 85 40 00    	add    rax,0x408500
  804017:	66 89 50 0d          	mov    WORD PTR [rax+0xd],dx
                    return ptr;
  80401b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80401f:	eb 31                	jmp    804052 <palloc+0x2ac>
                }
            }
            tblp++;
  804021:	48 83 45 e0 08       	add    QWORD PTR [rbp-0x20],0x8
        for(int j=0;j<1024;j++)
  804026:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  80402a:	81 7d dc ff 03 00 00 	cmp    DWORD PTR [rbp-0x24],0x3ff
  804031:	0f 8e f5 fd ff ff    	jle    803e2c <palloc+0x86>
        }
        pgind++;
  804037:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  80403c:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804040:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  804047:	0f 8e c3 fd ff ff    	jle    803e10 <palloc+0x6a>
    }
    return NULL;
  80404d:	b8 00 00 00 00       	mov    eax,0x0
}
  804052:	c9                   	leave  
  804053:	c3                   	ret    

0000000000804054 <malloc>:
//为当前进程申请新的内存，并返回这块内存的线性地址。
void* malloc(int size)
{
  804054:	f3 0f 1e fa          	endbr64 
  804058:	55                   	push   rbp
  804059:	48 89 e5             	mov    rbp,rsp
  80405c:	48 83 ec 10          	sub    rsp,0x10
  804060:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return palloc(cur_proc,size);
  804063:	8b 05 c3 15 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc115c3]        # 41562c <cur_proc>
  804069:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80406c:	89 d6                	mov    esi,edx
  80406e:	89 c7                	mov    edi,eax
  804070:	e8 31 fd ff ff       	call   803da6 <palloc>
}
  804075:	c9                   	leave  
  804076:	c3                   	ret    

0000000000804077 <proc_end>:
void proc_end()
{
  804077:	f3 0f 1e fa          	endbr64 
  80407b:	55                   	push   rbp
  80407c:	48 89 e5             	mov    rbp,rsp
  80407f:	48 83 ec 10          	sub    rsp,0x10
    int ret;
    asm volatile("mov %%eax,%0":"=m"(ret));
  804083:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("proc #%d ended with retv %d.\n",cur_proc,ret);
    //切换堆栈
    //asm volatile("mov %0,%%rsp"::"r"(task[0].tss.esp));
    del_proc(cur_proc);
  804086:	8b 05 a0 15 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc115a0]        # 41562c <cur_proc>
  80408c:	89 c7                	mov    edi,eax
  80408e:	e8 75 00 00 00       	call   804108 <del_proc>
    if(task[cur_proc].parent_pid!=-1){
  804093:	8b 05 93 15 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11593]        # 41562c <cur_proc>
  804099:	48 98                	cdqe   
  80409b:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8040a2:	48 05 3c 85 40 00    	add    rax,0x40853c
  8040a8:	8b 00                	mov    eax,DWORD PTR [rax]
  8040aa:	83 f8 ff             	cmp    eax,0xffffffff
  8040ad:	74 4c                	je     8040fb <proc_end+0x84>
        task[task[cur_proc].parent_pid].stat=READY;
  8040af:	8b 05 77 15 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11577]        # 41562c <cur_proc>
  8040b5:	48 98                	cdqe   
  8040b7:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8040be:	48 05 3c 85 40 00    	add    rax,0x40853c
  8040c4:	8b 00                	mov    eax,DWORD PTR [rax]
  8040c6:	89 c0                	mov    eax,eax
  8040c8:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8040cf:	48 05 b8 84 40 00    	add    rax,0x4084b8
  8040d5:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        switch_proc_tss(task[cur_proc].parent_pid);
  8040db:	8b 05 4b 15 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1154b]        # 41562c <cur_proc>
  8040e1:	48 98                	cdqe   
  8040e3:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8040ea:	48 05 3c 85 40 00    	add    rax,0x40853c
  8040f0:	8b 00                	mov    eax,DWORD PTR [rax]
  8040f2:	89 c7                	mov    edi,eax
  8040f4:	e8 ae fb ff ff       	call   803ca7 <switch_proc_tss>
    }
    else
        switch_proc_tss(0);
    //syscall(SYSCALL_DEL_PROC,cur_proc,0,0,0,0);
}
  8040f9:	eb 0a                	jmp    804105 <proc_end+0x8e>
        switch_proc_tss(0);
  8040fb:	bf 00 00 00 00       	mov    edi,0x0
  804100:	e8 a2 fb ff ff       	call   803ca7 <switch_proc_tss>
}
  804105:	90                   	nop
  804106:	c9                   	leave  
  804107:	c3                   	ret    

0000000000804108 <del_proc>:
void del_proc(int pnr)
{
  804108:	f3 0f 1e fa          	endbr64 
  80410c:	55                   	push   rbp
  80410d:	48 89 e5             	mov    rbp,rsp
  804110:	48 83 ec 30          	sub    rsp,0x30
  804114:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
    task[pnr].stat=ENDED;
  804117:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80411a:	48 98                	cdqe   
  80411c:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804123:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804129:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[pnr].pid=-1;
  80412f:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804132:	48 98                	cdqe   
  804134:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80413b:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804141:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    //释放申请的页面
    page_item *p;//task[pnr].tss.cr3;
    p++;
  804147:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
    for(;(*p&PAGE_PRESENT)!=0;p++)
  80414c:	eb 63                	jmp    8041b1 <del_proc+0xa9>
    {
        page_item *tp=*p&0xfffff000;
  80414e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804152:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804155:	25 00 f0 ff ff       	and    eax,0xfffff000
  80415a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<1024;i++)
  80415e:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804165:	eb 30                	jmp    804197 <del_proc+0x8f>
        {
            unsigned int present=*tp&PAGE_PRESENT;
  804167:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80416b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80416e:	83 e0 01             	and    eax,0x1
  804171:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            if(present)
  804174:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  804178:	74 14                	je     80418e <del_proc+0x86>
            {
                free_page(*tp&0xfffff000);
  80417a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80417e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804181:	25 00 f0 ff ff       	and    eax,0xfffff000
  804186:	48 89 c7             	mov    rdi,rax
  804189:	e8 b5 d5 ff ff       	call   801743 <free_page>
                //printf("freed page at %x.\n",*tp&0xfffff000);
            }
            tp++;
  80418e:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
        for(int i=0;i<1024;i++)
  804193:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804197:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  80419e:	7e c7                	jle    804167 <del_proc+0x5f>
        }
        vmfree(tp);
  8041a0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8041a4:	48 89 c7             	mov    rdi,rax
  8041a7:	e8 9c d1 ff ff       	call   801348 <vmfree>
    for(;(*p&PAGE_PRESENT)!=0;p++)
  8041ac:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
  8041b1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8041b5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8041b8:	83 e0 01             	and    eax,0x1
  8041bb:	48 85 c0             	test   rax,rax
  8041be:	75 8e                	jne    80414e <del_proc+0x46>
    }
    //释放存放页目录的页面
    vmfree(p);
  8041c0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8041c4:	48 89 c7             	mov    rdi,rax
  8041c7:	e8 7c d1 ff ff       	call   801348 <vmfree>
    //从进程中解除cr3,tss和ldt
    //switch_proc_tss(task[pnr]);
}
  8041cc:	90                   	nop
  8041cd:	c9                   	leave  
  8041ce:	c3                   	ret    

00000000008041cf <set_proc_stat>:

int set_proc_stat(int pid,int stat)
{
  8041cf:	f3 0f 1e fa          	endbr64 
  8041d3:	55                   	push   rbp
  8041d4:	48 89 e5             	mov    rbp,rsp
  8041d7:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8041da:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==-1)return -1;
  8041dd:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  8041e1:	75 07                	jne    8041ea <set_proc_stat+0x1b>
  8041e3:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8041e8:	eb 79                	jmp    804263 <set_proc_stat+0x94>
    int i=0;
  8041ea:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;task[i].pid!=pid;i++);
  8041f1:	eb 04                	jmp    8041f7 <set_proc_stat+0x28>
  8041f3:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8041f7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8041fa:	48 98                	cdqe   
  8041fc:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804203:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804209:	8b 10                	mov    edx,DWORD PTR [rax]
  80420b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80420e:	39 c2                	cmp    edx,eax
  804210:	75 e1                	jne    8041f3 <set_proc_stat+0x24>
    if(i==MAX_PROC_COUNT)return -1;
  804212:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  804216:	75 07                	jne    80421f <set_proc_stat+0x50>
  804218:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80421d:	eb 44                	jmp    804263 <set_proc_stat+0x94>
    task[i].stat=stat;
  80421f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804222:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804225:	48 63 d2             	movsxd rdx,edx
  804228:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  80422f:	48 81 c2 b8 84 40 00 	add    rdx,0x4084b8
  804236:	89 02                	mov    DWORD PTR [rdx],eax
    //如果这就是正在运行的进程，那么马上停止
    if(cur_proc==i)
  804238:	8b 05 ee 13 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc113ee]        # 41562c <cur_proc>
  80423e:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  804241:	75 1b                	jne    80425e <set_proc_stat+0x8f>
        task[cur_proc].utime=MAX_UTIME;
  804243:	8b 05 e3 13 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc113e3]        # 41562c <cur_proc>
  804249:	48 98                	cdqe   
  80424b:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804252:	48 05 bc 84 40 00    	add    rax,0x4084bc
  804258:	c7 00 0a 00 00 00    	mov    DWORD PTR [rax],0xa
    return 0;
  80425e:	b8 00 00 00 00       	mov    eax,0x0
}
  804263:	5d                   	pop    rbp
  804264:	c3                   	ret    

0000000000804265 <add_proc_openf>:

    return 0;
} */

int add_proc_openf(struct index_node *entry)
{
  804265:	f3 0f 1e fa          	endbr64 
  804269:	55                   	push   rbp
  80426a:	48 89 e5             	mov    rbp,rsp
  80426d:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_PROC_OPENF;i++){
  804271:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  804278:	eb 67                	jmp    8042e1 <add_proc_openf+0x7c>
        if(task[cur_proc].openf[i]==NULL)
  80427a:	8b 05 ac 13 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc113ac]        # 41562c <cur_proc>
  804280:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804283:	48 63 d2             	movsxd rdx,edx
  804286:	48 83 c2 1a          	add    rdx,0x1a
  80428a:	48 98                	cdqe   
  80428c:	48 c1 e2 03          	shl    rdx,0x3
  804290:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804297:	48 01 d0             	add    rax,rdx
  80429a:	48 05 a8 84 40 00    	add    rax,0x4084a8
  8042a0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8042a3:	48 85 c0             	test   rax,rax
  8042a6:	75 35                	jne    8042dd <add_proc_openf+0x78>
        {
            task[cur_proc].openf[i]=entry;
  8042a8:	8b 05 7e 13 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1137e]        # 41562c <cur_proc>
  8042ae:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8042b1:	48 63 d2             	movsxd rdx,edx
  8042b4:	48 83 c2 1a          	add    rdx,0x1a
  8042b8:	48 98                	cdqe   
  8042ba:	48 c1 e2 03          	shl    rdx,0x3
  8042be:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8042c5:	48 01 d0             	add    rax,rdx
  8042c8:	48 8d 90 a8 84 40 00 	lea    rdx,[rax+0x4084a8]
  8042cf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8042d3:	48 89 02             	mov    QWORD PTR [rdx],rax
            return 0;
  8042d6:	b8 00 00 00 00       	mov    eax,0x0
  8042db:	eb 0f                	jmp    8042ec <add_proc_openf+0x87>
    for(int i=0;i<MAX_PROC_OPENF;i++){
  8042dd:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8042e1:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  8042e5:	7e 93                	jle    80427a <add_proc_openf+0x15>
        }
    }
    return -1;//full
  8042e7:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8042ec:	5d                   	pop    rbp
  8042ed:	c3                   	ret    

00000000008042ee <sys_exit>:
/*
 * 进程结束。
 * */
int sys_exit(int code)
{
  8042ee:	f3 0f 1e fa          	endbr64 
  8042f2:	55                   	push   rbp
  8042f3:	48 89 e5             	mov    rbp,rsp
  8042f6:	48 83 ec 10          	sub    rsp,0x10
  8042fa:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    del_proc(cur_proc);
  8042fd:	8b 05 29 13 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11329]        # 41562c <cur_proc>
  804303:	89 c7                	mov    edi,eax
  804305:	e8 fe fd ff ff       	call   804108 <del_proc>
    while(1)
        manage_proc();
  80430a:	b8 00 00 00 00       	mov    eax,0x0
  80430f:	e8 00 f8 ff ff       	call   803b14 <manage_proc>
  804314:	eb f4                	jmp    80430a <sys_exit+0x1c>

0000000000804316 <reg_proc>:
    dllmain(NULL,0,NULL);
    
}*/

int reg_proc(addr_t entry, struct index_node *cwd, struct index_node *exef)
{
  804316:	f3 0f 1e fa          	endbr64 
  80431a:	55                   	push   rbp
  80431b:	48 89 e5             	mov    rbp,rsp
  80431e:	53                   	push   rbx
  80431f:	48 83 ec 48          	sub    rsp,0x48
  804323:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  804327:	48 89 75 c0          	mov    QWORD PTR [rbp-0x40],rsi
  80432b:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
    
    int i=req_proc();
  80432f:	b8 00 00 00 00       	mov    eax,0x0
  804334:	e8 4d f5 ff ff       	call   803886 <req_proc>
  804339:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(i==-1)return -1;
  80433c:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  804340:	75 0a                	jne    80434c <reg_proc+0x36>
  804342:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804347:	e9 8c 01 00 00       	jmp    8044d8 <reg_proc+0x1c2>

    //栈顶设置在了4G处
    set_proc(0, 0, 0, 0, DS_USER, CS_USER, DS_USER, DS_USER\
  80434c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  804350:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  804353:	52                   	push   rdx
  804354:	6a 00                	push   0x0
  804356:	50                   	push   rax
  804357:	6a 00                	push   0x0
  804359:	6a 00                	push   0x0
  80435b:	6a 00                	push   0x0
  80435d:	68 00 f0 ff ff       	push   0xfffffffffffff000
  804362:	c7 44 24 04 ff ff 00 	mov    DWORD PTR [rsp+0x4],0xffff
  804369:	00 
  80436a:	6a 28                	push   0x28
  80436c:	6a 28                	push   0x28
  80436e:	6a 28                	push   0x28
  804370:	6a 28                	push   0x28
  804372:	41 b9 30 00 00 00    	mov    r9d,0x30
  804378:	41 b8 28 00 00 00    	mov    r8d,0x28
  80437e:	b9 00 00 00 00       	mov    ecx,0x0
  804383:	ba 00 00 00 00       	mov    edx,0x0
  804388:	be 00 00 00 00       	mov    esi,0x0
  80438d:	bf 00 00 00 00       	mov    edi,0x0
  804392:	e8 bb f5 ff ff       	call   803952 <set_proc>
  804397:	48 83 c4 58          	add    rsp,0x58
, DS_USER, DS_USER, STACK_TOP, 0, 0, 0, entry, 0, i);
    task[i].pml4=vmalloc();
  80439b:	b8 00 00 00 00       	mov    eax,0x0
  8043a0:	e8 14 cf ff ff       	call   8012b9 <vmalloc>
  8043a5:	48 89 c2             	mov    rdx,rax
  8043a8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8043ab:	48 98                	cdqe   
  8043ad:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8043b4:	48 05 60 85 40 00    	add    rax,0x408560
  8043ba:	48 89 10             	mov    QWORD PTR [rax],rdx
    task[i].pml4[0]=vmalloc();
  8043bd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8043c0:	48 98                	cdqe   
  8043c2:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8043c9:	48 05 60 85 40 00    	add    rax,0x408560
  8043cf:	48 8b 18             	mov    rbx,QWORD PTR [rax]
  8043d2:	b8 00 00 00 00       	mov    eax,0x0
  8043d7:	e8 dd ce ff ff       	call   8012b9 <vmalloc>
  8043dc:	48 89 03             	mov    QWORD PTR [rbx],rax
    unsigned long *pdpt=task[i].pml4;
  8043df:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8043e2:	48 98                	cdqe   
  8043e4:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8043eb:	48 05 60 85 40 00    	add    rax,0x408560
  8043f1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8043f4:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    //pdpt第一项(0-1GB)设置为内核空间，这样才能访问中断
    set_1gb_pdpt(pdpt,0,PAGE_PRESENT|PAGE_RWX);
  8043f8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8043fc:	ba 03 00 00 00       	mov    edx,0x3
  804401:	be 00 00 00 00       	mov    esi,0x0
  804406:	48 89 c7             	mov    rdi,rax
  804409:	e8 b8 d4 ff ff       	call   8018c6 <set_1gb_pdpt>

    //申请一项pd,里面申请一2mb页用于堆栈
    addr_t *stackb=vmalloc();
  80440e:	b8 00 00 00 00       	mov    eax,0x0
  804413:	e8 a1 ce ff ff       	call   8012b9 <vmalloc>
  804418:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    pdpt[3]=(unsigned long)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//3-4G分配栈空间
  80441c:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  804420:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804424:	48 83 c0 18          	add    rax,0x18
  804428:	48 83 ca 07          	or     rdx,0x7
  80442c:	48 89 10             	mov    QWORD PTR [rax],rdx
    set_2mb_pde(stackb + 511, get_phyaddr(req_a_page()), PAGE_FOR_ALL|PAGE_RWX);
  80442f:	b8 00 00 00 00       	mov    eax,0x0
  804434:	e8 3a d2 ff ff       	call   801673 <req_a_page>
  804439:	89 c7                	mov    edi,eax
  80443b:	e8 22 d4 ff ff       	call   801862 <get_phyaddr>
  804440:	89 c1                	mov    ecx,eax
  804442:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804446:	48 05 f8 0f 00 00    	add    rax,0xff8
  80444c:	ba 06 00 00 00       	mov    edx,0x6
  804451:	89 ce                	mov    esi,ecx
  804453:	48 89 c7             	mov    rdi,rax
  804456:	e8 c2 d4 ff ff       	call   80191d <set_2mb_pde>
    task[i].regs.cr3=task[i].pml4;
  80445b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80445e:	48 98                	cdqe   
  804460:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804467:	48 05 60 85 40 00    	add    rax,0x408560
  80446d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804470:	48 89 c2             	mov    rdx,rax
  804473:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804476:	48 98                	cdqe   
  804478:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80447f:	48 05 e0 86 40 00    	add    rax,0x4086e0
  804485:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx

    task[i].stat=READY;
  804489:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80448c:	48 98                	cdqe   
  80448e:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804495:	48 05 b8 84 40 00    	add    rax,0x4084b8
  80449b:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[i].cwd=cwd;
  8044a1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8044a4:	48 98                	cdqe   
  8044a6:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8044ad:	48 8d 90 68 85 40 00 	lea    rdx,[rax+0x408568]
  8044b4:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8044b8:	48 89 02             	mov    QWORD PTR [rdx],rax
    task[i].exef=exef;
  8044bb:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8044be:	48 98                	cdqe   
  8044c0:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8044c7:	48 8d 90 70 85 40 00 	lea    rdx,[rax+0x408570]
  8044ce:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8044d2:	48 89 02             	mov    QWORD PTR [rdx],rax

    return i;
  8044d5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    proc_ret_stack *pstack=stack_paddr+stack_size-12;
    pstack->argc=0;
    pstack->argv=0;
    pstack->proc_end_addr=proc_end;
    int *pptr=pstack;*/
}
  8044d8:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8044dc:	c9                   	leave  
  8044dd:	c3                   	ret    

00000000008044de <sys_malloc>:

void * sys_malloc(int size)
{
  8044de:	f3 0f 1e fa          	endbr64 
  8044e2:	55                   	push   rbp
  8044e3:	48 89 e5             	mov    rbp,rsp
  8044e6:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    //
    int n=size/CHUNK_SIZE+size%CHUNK_SIZE?1:0;
  8044e9:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8044ec:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8044f2:	85 c0                	test   eax,eax
  8044f4:	0f 48 c2             	cmovs  eax,edx
  8044f7:	c1 f8 0c             	sar    eax,0xc
  8044fa:	89 c1                	mov    ecx,eax
  8044fc:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8044ff:	99                   	cdq    
  804500:	c1 ea 14             	shr    edx,0x14
  804503:	01 d0                	add    eax,edx
  804505:	25 ff 0f 00 00       	and    eax,0xfff
  80450a:	29 d0                	sub    eax,edx
  80450c:	01 c8                	add    eax,ecx
  80450e:	85 c0                	test   eax,eax
  804510:	0f 95 c0             	setne  al
  804513:	0f b6 c0             	movzx  eax,al
  804516:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    chunk_header *hp=(chunk_header*)task[cur_proc].mem_struct.heap_base;
  804519:	8b 05 0d 11 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1110d]        # 41562c <cur_proc>
  80451f:	48 98                	cdqe   
  804521:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804528:	48 05 c8 84 40 00    	add    rax,0x4084c8
  80452e:	8b 00                	mov    eax,DWORD PTR [rax]
  804530:	48 98                	cdqe   
  804532:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804536:	eb 0c                	jmp    804544 <sys_malloc+0x66>
        hp=hp->next;
  804538:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80453c:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804540:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804544:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804548:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80454c:	48 85 c0             	test   rax,rax
  80454f:	74 16                	je     804567 <sys_malloc+0x89>
  804551:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804555:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804558:	85 c0                	test   eax,eax
  80455a:	75 0b                	jne    804567 <sys_malloc+0x89>
  80455c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804560:	8b 00                	mov    eax,DWORD PTR [rax]
  804562:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804565:	7e d1                	jle    804538 <sys_malloc+0x5a>
    if(hp->pgn<n)
  804567:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80456b:	8b 00                	mov    eax,DWORD PTR [rax]
  80456d:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804570:	7e 7f                	jle    8045f1 <sys_malloc+0x113>
    {
        //上抬heap top
        if(task[cur_proc].mem_struct.heap_top+CHUNK_SIZE*n>=HEAP_MAXTOP)
  804572:	8b 05 b4 10 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc110b4]        # 41562c <cur_proc>
  804578:	48 98                	cdqe   
  80457a:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804581:	48 05 cc 84 40 00    	add    rax,0x4084cc
  804587:	8b 10                	mov    edx,DWORD PTR [rax]
  804589:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80458c:	c1 e0 0c             	shl    eax,0xc
  80458f:	01 d0                	add    eax,edx
  804591:	3d ff ff ef 01       	cmp    eax,0x1efffff
  804596:	7e 0a                	jle    8045a2 <sys_malloc+0xc4>
        {
            //超过顶部
            return NULL;
  804598:	b8 00 00 00 00       	mov    eax,0x0
  80459d:	e9 c8 00 00 00       	jmp    80466a <sys_malloc+0x18c>
        }
        int needed=n-hp->pgn;
  8045a2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8045a6:	8b 10                	mov    edx,DWORD PTR [rax]
  8045a8:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8045ab:	29 d0                	sub    eax,edx
  8045ad:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
        char* p=task[cur_proc].mem_struct.heap_top;
  8045b0:	8b 05 76 10 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11076]        # 41562c <cur_proc>
  8045b6:	48 98                	cdqe   
  8045b8:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8045bf:	48 05 cc 84 40 00    	add    rax,0x4084cc
  8045c5:	8b 00                	mov    eax,DWORD PTR [rax]
  8045c7:	48 98                	cdqe   
  8045c9:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  8045cd:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8045d4:	eb 13                	jmp    8045e9 <sys_malloc+0x10b>
        {
            *p=0;//触发缺页中断
  8045d6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8045da:	c6 00 00             	mov    BYTE PTR [rax],0x0
            p+=PAGE_SIZE;
  8045dd:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  8045e4:	00 
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  8045e5:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8045e9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8045ec:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  8045ef:	7c e5                	jl     8045d6 <sys_malloc+0xf8>
        }
    }
    if(hp->pgn>n)
  8045f1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8045f5:	8b 00                	mov    eax,DWORD PTR [rax]
  8045f7:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  8045fa:	7d 59                	jge    804655 <sys_malloc+0x177>
    {
        //在后面新建一个头
        char *p=hp;
  8045fc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804600:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        p+=(n+1)*CHUNK_SIZE;//算上存储头一个
  804604:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804607:	83 c0 01             	add    eax,0x1
  80460a:	c1 e0 0c             	shl    eax,0xc
  80460d:	48 98                	cdqe   
  80460f:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
        chunk_header *np=p;
  804613:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804617:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
        np->pgn=hp->pgn-n-1;
  80461b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80461f:	8b 00                	mov    eax,DWORD PTR [rax]
  804621:	2b 45 e8             	sub    eax,DWORD PTR [rbp-0x18]
  804624:	8d 50 ff             	lea    edx,[rax-0x1]
  804627:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80462b:	89 10                	mov    DWORD PTR [rax],edx
        np->next=hp->next;
  80462d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804631:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  804635:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804639:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
        np->prev=hp;
  80463d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804641:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804645:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
        hp->next=np;
  804649:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80464d:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804651:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    }
    hp->alloc=1;//分配完毕
  804655:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804659:	c7 40 04 01 00 00 00 	mov    DWORD PTR [rax+0x4],0x1
    return (char*)hp+CHUNK_SIZE;//返回后边的第一个数据块地址
  804660:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804664:	48 05 00 10 00 00    	add    rax,0x1000
}
  80466a:	5d                   	pop    rbp
  80466b:	c3                   	ret    

000000000080466c <sys_free>:
int sys_free(int ptr)
{
  80466c:	f3 0f 1e fa          	endbr64 
  804670:	55                   	push   rbp
  804671:	48 89 e5             	mov    rbp,rsp
  804674:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    chunk_header *hp=ptr-CHUNK_SIZE;//回退到头
  804677:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80467a:	2d 00 10 00 00       	sub    eax,0x1000
  80467f:	48 98                	cdqe   
  804681:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    hp->alloc=0;    //合并
  804685:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804689:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
    //向后合并
    chunk_header *p=hp->next;
  804690:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804694:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804698:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  80469c:	eb 2e                	jmp    8046cc <sys_free+0x60>
    {
        if(p->alloc==0)
  80469e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046a2:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8046a5:	85 c0                	test   eax,eax
  8046a7:	75 2c                	jne    8046d5 <sys_free+0x69>
        {
            hp->pgn+=p->pgn+1;//把区域合并
  8046a9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8046ad:	8b 10                	mov    edx,DWORD PTR [rax]
  8046af:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046b3:	8b 00                	mov    eax,DWORD PTR [rax]
  8046b5:	83 c0 01             	add    eax,0x1
  8046b8:	01 c2                	add    edx,eax
  8046ba:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8046be:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->next;
  8046c0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046c4:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8046c8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  8046cc:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8046d1:	75 cb                	jne    80469e <sys_free+0x32>
  8046d3:	eb 01                	jmp    8046d6 <sys_free+0x6a>
            break;
  8046d5:	90                   	nop
    }
    //向前合并
    p=hp->prev;
  8046d6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8046da:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8046de:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  8046e2:	eb 2e                	jmp    804712 <sys_free+0xa6>
    {
        if(p->alloc==0)
  8046e4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046e8:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8046eb:	85 c0                	test   eax,eax
  8046ed:	75 2c                	jne    80471b <sys_free+0xaf>
        {
            p->pgn+=hp->pgn+1;//把区域合并
  8046ef:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046f3:	8b 10                	mov    edx,DWORD PTR [rax]
  8046f5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8046f9:	8b 00                	mov    eax,DWORD PTR [rax]
  8046fb:	83 c0 01             	add    eax,0x1
  8046fe:	01 c2                	add    edx,eax
  804700:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804704:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->prev;
  804706:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80470a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80470e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804712:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804717:	75 cb                	jne    8046e4 <sys_free+0x78>
  804719:	eb 01                	jmp    80471c <sys_free+0xb0>
            break;
  80471b:	90                   	nop
    }
    //合并完成
    return 0;
  80471c:	b8 00 00 00 00       	mov    eax,0x0
}
  804721:	5d                   	pop    rbp
  804722:	c3                   	ret    

0000000000804723 <switch_to>:

void switch_to(struct process *from, struct process *to) {
  804723:	f3 0f 1e fa          	endbr64 
  804727:	55                   	push   rbp
  804728:	48 89 e5             	mov    rbp,rsp
  80472b:	53                   	push   rbx
  80472c:	48 89 7d f0          	mov    QWORD PTR [rbp-0x10],rdi
  804730:	48 89 75 e8          	mov    QWORD PTR [rbp-0x18],rsi
    cur_proc=to-task;
  804734:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804738:	48 2d a0 84 40 00    	sub    rax,0x4084a0
  80473e:	48 c1 f8 02          	sar    rax,0x2
  804742:	48 89 c2             	mov    rdx,rax
  804745:	48 b8 f7 c0 46 ef 8a 	movabs rax,0x2697cc8aef46c0f7
  80474c:	cc 97 26 
  80474f:	48 0f af c2          	imul   rax,rdx
  804753:	89 05 d3 0e c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10ed3],eax        # 41562c <cur_proc>
    current=&task[cur_proc];
  804759:	8b 05 cd 0e c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10ecd]        # 41562c <cur_proc>
  80475f:	48 98                	cdqe   
  804761:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804768:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80476e:	48 89 05 2b 0e c1 ff 	mov    QWORD PTR [rip+0xffffffffffc10e2b],rax        # 4155a0 <current>
    asm volatile("mov %0,%%rax\n"
  804775:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804779:	48 8b 80 c0 00 00 00 	mov    rax,QWORD PTR [rax+0xc0]
  804780:	0f 22 d8             	mov    cr3,rax
                 "mov %%rax,%%cr3\n":"=m"(to->pml4));
    asm volatile("mov %%rsp,%0\r\n"
  804783:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  804787:	4c 8b 55 f0          	mov    r10,QWORD PTR [rbp-0x10]
  80478b:	4c 8b 5d f0          	mov    r11,QWORD PTR [rbp-0x10]
  80478f:	48 8b 5d f0          	mov    rbx,QWORD PTR [rbp-0x10]
  804793:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804797:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80479b:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  80479f:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  8047a3:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  8047a7:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  8047ab:	49 89 a1 7c 02 00 00 	mov    QWORD PTR [r9+0x27c],rsp
  8047b2:	48 8d 05 24 00 00 00 	lea    rax,[rip+0x24]        # 8047dd <done>
  8047b9:	49 89 82 4c 02 00 00 	mov    QWORD PTR [r10+0x24c],rax
  8047c0:	41 8c a3 bc 02 00 00 	mov    WORD PTR [r11+0x2bc],fs
  8047c7:	8c ab c4 02 00 00    	mov    WORD PTR [rbx+0x2c4],gs
  8047cd:	48 8b a1 7c 02 00 00 	mov    rsp,QWORD PTR [rcx+0x27c]
  8047d4:	41 ff b0 4c 02 00 00 	push   QWORD PTR [r8+0x24c]
  8047db:	eb 08                	jmp    8047e5 <__switch_to>

00000000008047dd <done>:
  8047dd:	90                   	nop
                 "nop":"=m"(from->regs.rsp),"=m"(from->regs.rip),
                 "=m"(from->regs.fs),"=m"(from->regs.gs):
                "m"(to->regs.fs),"m"(to->regs.gs),"m"(to->regs.rsp),"m"(to->regs.rip),
                "D"(from),"S"(to));

}
  8047de:	90                   	nop
  8047df:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8047e3:	c9                   	leave  
  8047e4:	c3                   	ret    

00000000008047e5 <__switch_to>:
void __switch_to(struct process *from, struct process *to) {
  8047e5:	f3 0f 1e fa          	endbr64 
  8047e9:	55                   	push   rbp
  8047ea:	48 89 e5             	mov    rbp,rsp
  8047ed:	53                   	push   rbx
  8047ee:	48 83 ec 18          	sub    rsp,0x18
  8047f2:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8047f6:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  8047fa:	48 8b 05 df 7a 00 00 	mov    rax,QWORD PTR [rip+0x7adf]        # 80c2e0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804801:	4c 8b 50 54          	mov    r10,QWORD PTR [rax+0x54]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804805:	48 8b 05 d4 7a 00 00 	mov    rax,QWORD PTR [rip+0x7ad4]        # 80c2e0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  80480c:	4c 8b 48 4c          	mov    r9,QWORD PTR [rax+0x4c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804810:	48 8b 05 c9 7a 00 00 	mov    rax,QWORD PTR [rip+0x7ac9]        # 80c2e0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804817:	4c 8b 40 44          	mov    r8,QWORD PTR [rax+0x44]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  80481b:	48 8b 05 be 7a 00 00 	mov    rax,QWORD PTR [rip+0x7abe]        # 80c2e0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804822:	48 8b 78 3c          	mov    rdi,QWORD PTR [rax+0x3c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804826:	48 8b 05 b3 7a 00 00 	mov    rax,QWORD PTR [rip+0x7ab3]        # 80c2e0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  80482d:	48 8b 58 34          	mov    rbx,QWORD PTR [rax+0x34]
  804831:	48 8b 05 a8 7a 00 00 	mov    rax,QWORD PTR [rip+0x7aa8]        # 80c2e0 <tss>
  804838:	4c 8b 58 2c          	mov    r11,QWORD PTR [rax+0x2c]
  80483c:	48 8b 05 9d 7a 00 00 	mov    rax,QWORD PTR [rip+0x7a9d]        # 80c2e0 <tss>
  804843:	48 8b 48 24          	mov    rcx,QWORD PTR [rax+0x24]
  804847:	48 8b 05 92 7a 00 00 	mov    rax,QWORD PTR [rip+0x7a92]        # 80c2e0 <tss>
  80484e:	48 8b 50 14          	mov    rdx,QWORD PTR [rax+0x14]
  804852:	48 8b 05 87 7a 00 00 	mov    rax,QWORD PTR [rip+0x7a87]        # 80c2e0 <tss>
  804859:	48 8b 70 0c          	mov    rsi,QWORD PTR [rax+0xc]
  80485d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804861:	48 8b 80 dc 01 00 00 	mov    rax,QWORD PTR [rax+0x1dc]
  804868:	41 52                	push   r10
  80486a:	41 51                	push   r9
  80486c:	41 50                	push   r8
  80486e:	57                   	push   rdi
  80486f:	49 89 d9             	mov    r9,rbx
  804872:	4d 89 d8             	mov    r8,r11
  804875:	48 89 c7             	mov    rdi,rax
  804878:	e8 34 00 00 00       	call   8048b1 <set_tss>
  80487d:	48 83 c4 20          	add    rsp,0x20
    asm volatile("mov %%fs,%0\r\n"
  804881:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804885:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  804889:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80488d:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  804891:	8c a0 bc 02 00 00    	mov    WORD PTR [rax+0x2bc],fs
  804897:	8c ae c4 02 00 00    	mov    WORD PTR [rsi+0x2c4],gs
  80489d:	8e a2 bc 02 00 00    	mov    fs,WORD PTR [rdx+0x2bc]
  8048a3:	8e a9 c4 02 00 00    	mov    gs,WORD PTR [rcx+0x2c4]
  8048a9:	fb                   	sti    
                 "mov %%gs,%1\r\n"
                 "mov %2,%%fs\r\n"
                 "mov %3,%%gs\r\n"
                 "sti":"=m"(to->regs.fs),"=m"(to->regs.gs):
                 "m"(from->regs.fs),"m"(from->regs.gs));
}
  8048aa:	90                   	nop
  8048ab:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8048af:	c9                   	leave  
  8048b0:	c3                   	ret    

00000000008048b1 <set_tss>:

void set_tss(u64 rsp0,u64 rsp1,u64 rsp2,u64 ist0,u64 ist1,u64 ist2,u64 ist3,u64 ist4,u64 ist5,u64 ist6){
  8048b1:	f3 0f 1e fa          	endbr64 
  8048b5:	55                   	push   rbp
  8048b6:	48 89 e5             	mov    rbp,rsp
  8048b9:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8048bd:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8048c1:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  8048c5:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  8048c9:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
  8048cd:	4c 89 4d d0          	mov    QWORD PTR [rbp-0x30],r9
    tss->rsp0=rsp0;
  8048d1:	48 8b 05 08 7a 00 00 	mov    rax,QWORD PTR [rip+0x7a08]        # 80c2e0 <tss>
  8048d8:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8048dc:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx
    tss->rsp1=rsp1;
  8048e0:	48 8b 05 f9 79 00 00 	mov    rax,QWORD PTR [rip+0x79f9]        # 80c2e0 <tss>
  8048e7:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  8048eb:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    tss->rsp2=rsp2;
  8048ef:	48 8b 05 ea 79 00 00 	mov    rax,QWORD PTR [rip+0x79ea]        # 80c2e0 <tss>
  8048f6:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8048fa:	48 89 50 14          	mov    QWORD PTR [rax+0x14],rdx
    tss->ists[0]=ist0;
  8048fe:	48 8b 05 db 79 00 00 	mov    rax,QWORD PTR [rip+0x79db]        # 80c2e0 <tss>
  804905:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  804909:	48 89 50 24          	mov    QWORD PTR [rax+0x24],rdx
    tss->ists[1]=ist1;
  80490d:	48 8b 05 cc 79 00 00 	mov    rax,QWORD PTR [rip+0x79cc]        # 80c2e0 <tss>
  804914:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  804918:	48 89 50 2c          	mov    QWORD PTR [rax+0x2c],rdx
    tss->ists[2]=ist2;
  80491c:	48 8b 05 bd 79 00 00 	mov    rax,QWORD PTR [rip+0x79bd]        # 80c2e0 <tss>
  804923:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804927:	48 89 50 34          	mov    QWORD PTR [rax+0x34],rdx
    tss->ists[3]=ist3;
  80492b:	48 8b 05 ae 79 00 00 	mov    rax,QWORD PTR [rip+0x79ae]        # 80c2e0 <tss>
  804932:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  804936:	48 89 50 3c          	mov    QWORD PTR [rax+0x3c],rdx
    tss->ists[4]=ist4;
  80493a:	48 8b 05 9f 79 00 00 	mov    rax,QWORD PTR [rip+0x799f]        # 80c2e0 <tss>
  804941:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  804945:	48 89 50 44          	mov    QWORD PTR [rax+0x44],rdx
    tss->ists[5]=ist5;
  804949:	48 8b 05 90 79 00 00 	mov    rax,QWORD PTR [rip+0x7990]        # 80c2e0 <tss>
  804950:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  804954:	48 89 50 4c          	mov    QWORD PTR [rax+0x4c],rdx
    tss->ists[6]=ist6;
  804958:	48 8b 05 81 79 00 00 	mov    rax,QWORD PTR [rip+0x7981]        # 80c2e0 <tss>
  80495f:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  804963:	48 89 50 54          	mov    QWORD PTR [rax+0x54],rdx
}
  804967:	90                   	nop
  804968:	5d                   	pop    rbp
  804969:	c3                   	ret    

000000000080496a <fork_child_ret>:

int fork_child_ret(){
  80496a:	f3 0f 1e fa          	endbr64 
  80496e:	55                   	push   rbp
  80496f:	48 89 e5             	mov    rbp,rsp
    return 0;
  804972:	b8 00 00 00 00       	mov    eax,0x0

}
  804977:	5d                   	pop    rbp
  804978:	c3                   	ret    

0000000000804979 <sys_fork>:

int sys_fork(void){
  804979:	f3 0f 1e fa          	endbr64 
  80497d:	55                   	push   rbp
  80497e:	48 89 e5             	mov    rbp,rsp
  804981:	53                   	push   rbx
  804982:	48 83 ec 58          	sub    rsp,0x58
    int pid=req_proc();
  804986:	b8 00 00 00 00       	mov    eax,0x0
  80498b:	e8 f6 ee ff ff       	call   803886 <req_proc>
  804990:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(pid==-1)return -1;
  804993:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  804997:	75 0a                	jne    8049a3 <sys_fork+0x2a>
  804999:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80499e:	e9 7a 07 00 00       	jmp    80511d <sys_fork+0x7a4>
    task[pid].regs=current->regs;
  8049a3:	48 8b 05 f6 0b c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc10bf6]        # 4155a0 <current>
  8049aa:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  8049ad:	48 63 d2             	movsxd rdx,edx
  8049b0:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  8049b7:	48 81 c2 e0 86 40 00 	add    rdx,0x4086e0
  8049be:	48 8b 88 44 02 00 00 	mov    rcx,QWORD PTR [rax+0x244]
  8049c5:	48 8b 98 4c 02 00 00 	mov    rbx,QWORD PTR [rax+0x24c]
  8049cc:	48 89 4a 04          	mov    QWORD PTR [rdx+0x4],rcx
  8049d0:	48 89 5a 0c          	mov    QWORD PTR [rdx+0xc],rbx
  8049d4:	48 8b 88 54 02 00 00 	mov    rcx,QWORD PTR [rax+0x254]
  8049db:	48 8b 98 5c 02 00 00 	mov    rbx,QWORD PTR [rax+0x25c]
  8049e2:	48 89 4a 14          	mov    QWORD PTR [rdx+0x14],rcx
  8049e6:	48 89 5a 1c          	mov    QWORD PTR [rdx+0x1c],rbx
  8049ea:	48 8b 88 64 02 00 00 	mov    rcx,QWORD PTR [rax+0x264]
  8049f1:	48 8b 98 6c 02 00 00 	mov    rbx,QWORD PTR [rax+0x26c]
  8049f8:	48 89 4a 24          	mov    QWORD PTR [rdx+0x24],rcx
  8049fc:	48 89 5a 2c          	mov    QWORD PTR [rdx+0x2c],rbx
  804a00:	48 8b 88 74 02 00 00 	mov    rcx,QWORD PTR [rax+0x274]
  804a07:	48 8b 98 7c 02 00 00 	mov    rbx,QWORD PTR [rax+0x27c]
  804a0e:	48 89 4a 34          	mov    QWORD PTR [rdx+0x34],rcx
  804a12:	48 89 5a 3c          	mov    QWORD PTR [rdx+0x3c],rbx
  804a16:	48 8b 88 84 02 00 00 	mov    rcx,QWORD PTR [rax+0x284]
  804a1d:	48 8b 98 8c 02 00 00 	mov    rbx,QWORD PTR [rax+0x28c]
  804a24:	48 89 4a 44          	mov    QWORD PTR [rdx+0x44],rcx
  804a28:	48 89 5a 4c          	mov    QWORD PTR [rdx+0x4c],rbx
  804a2c:	48 8b 88 94 02 00 00 	mov    rcx,QWORD PTR [rax+0x294]
  804a33:	48 8b 98 9c 02 00 00 	mov    rbx,QWORD PTR [rax+0x29c]
  804a3a:	48 89 4a 54          	mov    QWORD PTR [rdx+0x54],rcx
  804a3e:	48 89 5a 5c          	mov    QWORD PTR [rdx+0x5c],rbx
  804a42:	48 8b 88 a4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2a4]
  804a49:	48 8b 98 ac 02 00 00 	mov    rbx,QWORD PTR [rax+0x2ac]
  804a50:	48 89 4a 64          	mov    QWORD PTR [rdx+0x64],rcx
  804a54:	48 89 5a 6c          	mov    QWORD PTR [rdx+0x6c],rbx
  804a58:	48 8b 88 b4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2b4]
  804a5f:	48 8b 98 bc 02 00 00 	mov    rbx,QWORD PTR [rax+0x2bc]
  804a66:	48 89 4a 74          	mov    QWORD PTR [rdx+0x74],rcx
  804a6a:	48 89 5a 7c          	mov    QWORD PTR [rdx+0x7c],rbx
  804a6e:	48 8b 88 c4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2c4]
  804a75:	48 8b 98 cc 02 00 00 	mov    rbx,QWORD PTR [rax+0x2cc]
  804a7c:	48 89 8a 84 00 00 00 	mov    QWORD PTR [rdx+0x84],rcx
  804a83:	48 89 9a 8c 00 00 00 	mov    QWORD PTR [rdx+0x8c],rbx
  804a8a:	48 8b 88 d4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2d4]
  804a91:	48 8b 98 dc 02 00 00 	mov    rbx,QWORD PTR [rax+0x2dc]
  804a98:	48 89 8a 94 00 00 00 	mov    QWORD PTR [rdx+0x94],rcx
  804a9f:	48 89 9a 9c 00 00 00 	mov    QWORD PTR [rdx+0x9c],rbx
  804aa6:	48 8b 88 e4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2e4]
  804aad:	48 8b 98 ec 02 00 00 	mov    rbx,QWORD PTR [rax+0x2ec]
  804ab4:	48 89 8a a4 00 00 00 	mov    QWORD PTR [rdx+0xa4],rcx
  804abb:	48 89 9a ac 00 00 00 	mov    QWORD PTR [rdx+0xac],rbx
  804ac2:	48 8b 88 f4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2f4]
  804ac9:	48 8b 98 fc 02 00 00 	mov    rbx,QWORD PTR [rax+0x2fc]
  804ad0:	48 89 8a b4 00 00 00 	mov    QWORD PTR [rdx+0xb4],rcx
  804ad7:	48 89 9a bc 00 00 00 	mov    QWORD PTR [rdx+0xbc],rbx
  804ade:	48 8b 88 04 03 00 00 	mov    rcx,QWORD PTR [rax+0x304]
  804ae5:	48 8b 98 0c 03 00 00 	mov    rbx,QWORD PTR [rax+0x30c]
  804aec:	48 89 8a c4 00 00 00 	mov    QWORD PTR [rdx+0xc4],rcx
  804af3:	48 89 9a cc 00 00 00 	mov    QWORD PTR [rdx+0xcc],rbx
    //使得子程序处于刚调用完系统调用的状态
    task[pid].regs.rip=ret_normal_proc;
  804afa:	ba 51 c2 80 00       	mov    edx,0x80c251
  804aff:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804b02:	48 98                	cdqe   
  804b04:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804b0b:	48 05 e0 86 40 00    	add    rax,0x4086e0
  804b11:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    task[pid].regs.rsp-=sizeof(stack_store_regs);
  804b15:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804b18:	48 98                	cdqe   
  804b1a:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804b21:	48 05 10 87 40 00    	add    rax,0x408710
  804b27:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804b2b:	48 2d a8 00 00 00    	sub    rax,0xa8
  804b31:	48 89 c2             	mov    rdx,rax
  804b34:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804b37:	48 98                	cdqe   
  804b39:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804b40:	48 05 10 87 40 00    	add    rax,0x408710
  804b46:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    task[pid].sid=current->sid;
  804b4a:	48 8b 05 4f 0a c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc10a4f]        # 4155a0 <current>
  804b51:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  804b54:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  804b57:	48 63 d2             	movsxd rdx,edx
  804b5a:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  804b61:	48 81 c2 a8 84 40 00 	add    rdx,0x4084a8
  804b68:	89 02                	mov    DWORD PTR [rdx],eax
    task[pid].gpid=current->gpid;
  804b6a:	48 8b 05 2f 0a c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc10a2f]        # 4155a0 <current>
  804b71:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804b74:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  804b77:	48 63 d2             	movsxd rdx,edx
  804b7a:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  804b81:	48 81 c2 a4 84 40 00 	add    rdx,0x4084a4
  804b88:	89 02                	mov    DWORD PTR [rdx],eax
    stack_store_regs *r=task[pid].regs.rsp;
  804b8a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804b8d:	48 98                	cdqe   
  804b8f:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804b96:	48 05 10 87 40 00    	add    rax,0x408710
  804b9c:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804ba0:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    r->rax=0;
  804ba4:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804ba8:	48 c7 40 78 00 00 00 	mov    QWORD PTR [rax+0x78],0x0
  804baf:	00 
    r->ds=DS_USER;
  804bb0:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804bb4:	48 c7 00 28 00 00 00 	mov    QWORD PTR [rax],0x28
    r->ss=DS_USER;
  804bbb:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804bbf:	48 c7 80 a0 00 00 00 	mov    QWORD PTR [rax+0xa0],0x28
  804bc6:	28 00 00 00 
    r->es=DS_USER;
  804bca:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804bce:	48 c7 40 08 28 00 00 	mov    QWORD PTR [rax+0x8],0x28
  804bd5:	00 
    r->rax=task[pid].regs.rax;
  804bd6:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804bd9:	48 98                	cdqe   
  804bdb:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804be2:	48 05 f0 86 40 00    	add    rax,0x4086f0
  804be8:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804bec:	48 89 c2             	mov    rdx,rax
  804bef:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804bf3:	48 89 50 78          	mov    QWORD PTR [rax+0x78],rdx
    r->rbx=task[pid].regs.rbx;
  804bf7:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804bfa:	48 98                	cdqe   
  804bfc:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804c03:	48 05 10 87 40 00    	add    rax,0x408710
  804c09:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  804c0d:	48 89 c2             	mov    rdx,rax
  804c10:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804c14:	48 89 50 70          	mov    QWORD PTR [rax+0x70],rdx
    r->rcx=task[pid].regs.rcx;
  804c18:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804c1b:	48 98                	cdqe   
  804c1d:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804c24:	48 05 00 87 40 00    	add    rax,0x408700
  804c2a:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  804c2e:	48 89 c2             	mov    rdx,rax
  804c31:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804c35:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    r->rdx=task[pid].regs.rdx;
  804c39:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804c3c:	48 98                	cdqe   
  804c3e:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804c45:	48 05 00 87 40 00    	add    rax,0x408700
  804c4b:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804c4f:	48 89 c2             	mov    rdx,rax
  804c52:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804c56:	48 89 50 60          	mov    QWORD PTR [rax+0x60],rdx
    r->rsi=task[pid].regs.rsi;
  804c5a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804c5d:	48 98                	cdqe   
  804c5f:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804c66:	48 05 20 87 40 00    	add    rax,0x408720
  804c6c:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804c70:	48 89 c2             	mov    rdx,rax
  804c73:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804c77:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
    r->rdi=task[pid].regs.rdi;
  804c7b:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804c7e:	48 98                	cdqe   
  804c80:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804c87:	48 05 30 87 40 00    	add    rax,0x408730
  804c8d:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  804c91:	48 89 c2             	mov    rdx,rax
  804c94:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804c98:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx

    r->r8 =task[pid].regs.r8 ;
  804c9c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804c9f:	48 98                	cdqe   
  804ca1:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804ca8:	48 05 60 87 40 00    	add    rax,0x408760
  804cae:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804cb2:	48 89 c2             	mov    rdx,rax
  804cb5:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804cb9:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    r->r9 =task[pid].regs.r9 ;
  804cbd:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804cc0:	48 98                	cdqe   
  804cc2:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804cc9:	48 05 70 87 40 00    	add    rax,0x408770
  804ccf:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  804cd3:	48 89 c2             	mov    rdx,rax
  804cd6:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804cda:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    r->r10=task[pid].regs.r10;
  804cde:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804ce1:	48 98                	cdqe   
  804ce3:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804cea:	48 05 70 87 40 00    	add    rax,0x408770
  804cf0:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804cf4:	48 89 c2             	mov    rdx,rax
  804cf7:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804cfb:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
    r->r11=task[pid].regs.r11;
  804cff:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804d02:	48 98                	cdqe   
  804d04:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804d0b:	48 05 80 87 40 00    	add    rax,0x408780
  804d11:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  804d15:	48 89 c2             	mov    rdx,rax
  804d18:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d1c:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
    r->r12=task[pid].regs.r12;
  804d20:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804d23:	48 98                	cdqe   
  804d25:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804d2c:	48 05 80 87 40 00    	add    rax,0x408780
  804d32:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804d36:	48 89 c2             	mov    rdx,rax
  804d39:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d3d:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
    r->r13=task[pid].regs.r13;
  804d41:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804d44:	48 98                	cdqe   
  804d46:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804d4d:	48 05 90 87 40 00    	add    rax,0x408790
  804d53:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  804d57:	48 89 c2             	mov    rdx,rax
  804d5a:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d5e:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
    r->r14=task[pid].regs.r14;
  804d62:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804d65:	48 98                	cdqe   
  804d67:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804d6e:	48 05 90 87 40 00    	add    rax,0x408790
  804d74:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804d78:	48 89 c2             	mov    rdx,rax
  804d7b:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d7f:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    r->r15=task[pid].regs.r15;
  804d83:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804d86:	48 98                	cdqe   
  804d88:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804d8f:	48 05 a0 87 40 00    	add    rax,0x4087a0
  804d95:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  804d99:	48 89 c2             	mov    rdx,rax
  804d9c:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804da0:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx

    asm volatile("mov %%r10,%0"::"m"(r->rip));
  804da4:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804da8:	4c 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],r10

    task[pid].tss=current->tss;
  804daf:	48 8b 05 ea 07 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc107ea]        # 4155a0 <current>
  804db6:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  804db9:	48 63 d2             	movsxd rdx,edx
  804dbc:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  804dc3:	48 81 c2 70 86 40 00 	add    rdx,0x408670
  804dca:	48 8b 88 d8 01 00 00 	mov    rcx,QWORD PTR [rax+0x1d8]
  804dd1:	48 8b 98 e0 01 00 00 	mov    rbx,QWORD PTR [rax+0x1e0]
  804dd8:	48 89 4a 08          	mov    QWORD PTR [rdx+0x8],rcx
  804ddc:	48 89 5a 10          	mov    QWORD PTR [rdx+0x10],rbx
  804de0:	48 8b 88 e8 01 00 00 	mov    rcx,QWORD PTR [rax+0x1e8]
  804de7:	48 8b 98 f0 01 00 00 	mov    rbx,QWORD PTR [rax+0x1f0]
  804dee:	48 89 4a 18          	mov    QWORD PTR [rdx+0x18],rcx
  804df2:	48 89 5a 20          	mov    QWORD PTR [rdx+0x20],rbx
  804df6:	48 8b 88 f8 01 00 00 	mov    rcx,QWORD PTR [rax+0x1f8]
  804dfd:	48 8b 98 00 02 00 00 	mov    rbx,QWORD PTR [rax+0x200]
  804e04:	48 89 4a 28          	mov    QWORD PTR [rdx+0x28],rcx
  804e08:	48 89 5a 30          	mov    QWORD PTR [rdx+0x30],rbx
  804e0c:	48 8b 88 08 02 00 00 	mov    rcx,QWORD PTR [rax+0x208]
  804e13:	48 8b 98 10 02 00 00 	mov    rbx,QWORD PTR [rax+0x210]
  804e1a:	48 89 4a 38          	mov    QWORD PTR [rdx+0x38],rcx
  804e1e:	48 89 5a 40          	mov    QWORD PTR [rdx+0x40],rbx
  804e22:	48 8b 88 18 02 00 00 	mov    rcx,QWORD PTR [rax+0x218]
  804e29:	48 8b 98 20 02 00 00 	mov    rbx,QWORD PTR [rax+0x220]
  804e30:	48 89 4a 48          	mov    QWORD PTR [rdx+0x48],rcx
  804e34:	48 89 5a 50          	mov    QWORD PTR [rdx+0x50],rbx
  804e38:	48 8b 88 28 02 00 00 	mov    rcx,QWORD PTR [rax+0x228]
  804e3f:	48 8b 98 30 02 00 00 	mov    rbx,QWORD PTR [rax+0x230]
  804e46:	48 89 4a 58          	mov    QWORD PTR [rdx+0x58],rcx
  804e4a:	48 89 5a 60          	mov    QWORD PTR [rdx+0x60],rbx
  804e4e:	48 8b 88 38 02 00 00 	mov    rcx,QWORD PTR [rax+0x238]
  804e55:	48 89 4a 68          	mov    QWORD PTR [rdx+0x68],rcx
  804e59:	8b 80 40 02 00 00    	mov    eax,DWORD PTR [rax+0x240]
  804e5f:	89 42 70             	mov    DWORD PTR [rdx+0x70],eax
    task[pid].stat=READY;
  804e62:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804e65:	48 98                	cdqe   
  804e67:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804e6e:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804e74:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[pid].parent_pid=cur_proc;
  804e7a:	8b 05 ac 07 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc107ac]        # 41562c <cur_proc>
  804e80:	89 c2                	mov    edx,eax
  804e82:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804e85:	48 98                	cdqe   
  804e87:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804e8e:	48 05 3c 85 40 00    	add    rax,0x40853c
  804e94:	89 10                	mov    DWORD PTR [rax],edx
    //复制打开文件
    memcpy(task[pid].openf,current->openf,sizeof(struct file*)*MAX_PROC_OPENF);
  804e96:	48 8b 05 03 07 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc10703]        # 4155a0 <current>
  804e9d:	48 8d 88 d8 00 00 00 	lea    rcx,[rax+0xd8]
  804ea4:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804ea7:	48 98                	cdqe   
  804ea9:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804eb0:	48 05 d0 00 00 00    	add    rax,0xd0
  804eb6:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804ebc:	48 83 c0 08          	add    rax,0x8
  804ec0:	ba 00 01 00 00       	mov    edx,0x100
  804ec5:	48 89 ce             	mov    rsi,rcx
  804ec8:	48 89 c7             	mov    rdi,rax
  804ecb:	e8 e2 69 00 00       	call   80b8b2 <memcpy>
    task[pid].utime=0;
  804ed0:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804ed3:	48 98                	cdqe   
  804ed5:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804edc:	48 05 bc 84 40 00    	add    rax,0x4084bc
  804ee2:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[pid].mem_struct=current->mem_struct;
  804ee8:	48 8b 0d b1 06 c1 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc106b1]        # 4155a0 <current>
  804eef:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804ef2:	48 98                	cdqe   
  804ef4:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804efb:	48 8d b0 c0 84 40 00 	lea    rsi,[rax+0x4084c0]
  804f02:	48 8b 41 28          	mov    rax,QWORD PTR [rcx+0x28]
  804f06:	48 8b 51 30          	mov    rdx,QWORD PTR [rcx+0x30]
  804f0a:	48 89 46 08          	mov    QWORD PTR [rsi+0x8],rax
  804f0e:	48 89 56 10          	mov    QWORD PTR [rsi+0x10],rdx
  804f12:	48 8b 41 38          	mov    rax,QWORD PTR [rcx+0x38]
  804f16:	48 8b 51 40          	mov    rdx,QWORD PTR [rcx+0x40]
  804f1a:	48 89 46 18          	mov    QWORD PTR [rsi+0x18],rax
  804f1e:	48 89 56 20          	mov    QWORD PTR [rsi+0x20],rdx
    //TODO:根据是子进程还是父进程设置返回值的不同

    //TODO:设置新堆栈
    //复制父进程的内存映射到子进程，然后重新映射并复制子进程的堆栈和数据段
    copy_mmap(current,&task[pid]);
  804f22:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804f25:	48 98                	cdqe   
  804f27:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804f2e:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  804f35:	48 8b 05 64 06 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc10664]        # 4155a0 <current>
  804f3c:	48 89 d6             	mov    rsi,rdx
  804f3f:	48 89 c7             	mov    rdi,rax
  804f42:	e8 de 04 00 00       	call   805425 <copy_mmap>
    /*
     * 这里使用vmalloc是一个权宜之策。
     * 本来是分配用户空间内存的，但是这样的话当前进程内存空间下就访问不到这个新申请的内存了（除非mmap一下），
     * 方便以前先用vmalloc。
     * */
    addr_t stk=task[pid].mem_struct.stack_top-PAGE_4K_SIZE;
  804f47:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804f4a:	48 98                	cdqe   
  804f4c:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804f53:	48 05 d4 84 40 00    	add    rax,0x4084d4
  804f59:	8b 00                	mov    eax,DWORD PTR [rax]
  804f5b:	2d 00 10 00 00       	sub    eax,0x1000
  804f60:	48 98                	cdqe   
  804f62:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    for(;stk>=task[pid].mem_struct.stack_bottom;stk-=PAGE_4K_SIZE){
  804f66:	eb 5b                	jmp    804fc3 <sys_fork+0x64a>
        addr_t new_stkpg=vmalloc();
  804f68:	b8 00 00 00 00       	mov    eax,0x0
  804f6d:	e8 47 c3 ff ff       	call   8012b9 <vmalloc>
  804f72:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
        memcpy(new_stkpg,stk,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  804f76:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  804f7a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  804f7e:	ba 00 10 00 00       	mov    edx,0x1000
  804f83:	48 89 ce             	mov    rsi,rcx
  804f86:	48 89 c7             	mov    rdi,rax
  804f89:	e8 24 69 00 00       	call   80b8b2 <memcpy>
        //把新的页面映射到进程页表里
        smmap(new_stkpg,stk,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  804f8e:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804f91:	48 98                	cdqe   
  804f93:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804f9a:	48 05 60 85 40 00    	add    rax,0x408560
  804fa0:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  804fa3:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  804fa7:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  804fab:	48 89 d1             	mov    rcx,rdx
  804fae:	ba 07 00 00 00       	mov    edx,0x7
  804fb3:	48 89 c7             	mov    rdi,rax
  804fb6:	e8 ae c0 ff ff       	call   801069 <smmap>
    for(;stk>=task[pid].mem_struct.stack_bottom;stk-=PAGE_4K_SIZE){
  804fbb:	48 81 6d e8 00 10 00 	sub    QWORD PTR [rbp-0x18],0x1000
  804fc2:	00 
  804fc3:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804fc6:	48 98                	cdqe   
  804fc8:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804fcf:	48 05 d0 84 40 00    	add    rax,0x4084d0
  804fd5:	8b 00                	mov    eax,DWORD PTR [rax]
  804fd7:	48 98                	cdqe   
  804fd9:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  804fdd:	73 89                	jae    804f68 <sys_fork+0x5ef>
    }
    //中断使用的栈空间
    addr_t intstk=INT_STACK_TOP-PAGE_4K_SIZE;
  804fdf:	48 c7 45 e0 00 f0 7f 	mov    QWORD PTR [rbp-0x20],0x7ff000
  804fe6:	00 
    int f=1;
  804fe7:	c7 45 dc 01 00 00 00 	mov    DWORD PTR [rbp-0x24],0x1
    for(;intstk>=INT_STACK_BASE;intstk-=PAGE_4K_SIZE){
  804fee:	e9 81 00 00 00       	jmp    805074 <sys_fork+0x6fb>
        addr_t new_stkpg=vmalloc();
  804ff3:	b8 00 00 00 00       	mov    eax,0x0
  804ff8:	e8 bc c2 ff ff       	call   8012b9 <vmalloc>
  804ffd:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        memcpy(new_stkpg,intstk,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  805001:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  805005:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805009:	ba 00 10 00 00       	mov    edx,0x1000
  80500e:	48 89 ce             	mov    rsi,rcx
  805011:	48 89 c7             	mov    rdi,rax
  805014:	e8 99 68 00 00       	call   80b8b2 <memcpy>
        if(f){
  805019:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  80501d:	74 20                	je     80503f <sys_fork+0x6c6>
            f=0;
  80501f:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
            addr_t *raxp=new_stkpg+PAGE_4K_SIZE-56;//指向中断堆栈，里面存着rax的值
  805026:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80502a:	48 05 c8 0f 00 00    	add    rax,0xfc8
  805030:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
            *raxp=0;//这样进程切换到子进程的done标签，从时钟中断返回弹出堆栈的时候rax弹出来的就是0，成为返回值。
  805034:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  805038:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
        }
        //把新的页面映射到进程页表里
        smmap(new_stkpg,intstk,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  80503f:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805042:	48 98                	cdqe   
  805044:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80504b:	48 05 60 85 40 00    	add    rax,0x408560
  805051:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  805054:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  805058:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80505c:	48 89 d1             	mov    rcx,rdx
  80505f:	ba 07 00 00 00       	mov    edx,0x7
  805064:	48 89 c7             	mov    rdi,rax
  805067:	e8 fd bf ff ff       	call   801069 <smmap>
    for(;intstk>=INT_STACK_BASE;intstk-=PAGE_4K_SIZE){
  80506c:	48 81 6d e0 00 10 00 	sub    QWORD PTR [rbp-0x20],0x1000
  805073:	00 
  805074:	48 81 7d e0 ff ef 7f 	cmp    QWORD PTR [rbp-0x20],0x7fefff
  80507b:	00 
  80507c:	0f 87 71 ff ff ff    	ja     804ff3 <sys_fork+0x67a>
    }
    //堆
    addr_t hp=task[pid].mem_struct.heap_top-PAGE_4K_SIZE;
  805082:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805085:	48 98                	cdqe   
  805087:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80508e:	48 05 cc 84 40 00    	add    rax,0x4084cc
  805094:	8b 00                	mov    eax,DWORD PTR [rax]
  805096:	2d 00 10 00 00       	sub    eax,0x1000
  80509b:	48 98                	cdqe   
  80509d:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    for(;hp>=task[pid].mem_struct.heap_base;hp-=PAGE_4K_SIZE){
  8050a1:	eb 5b                	jmp    8050fe <sys_fork+0x785>
        addr_t new_hppg=vmalloc();
  8050a3:	b8 00 00 00 00       	mov    eax,0x0
  8050a8:	e8 0c c2 ff ff       	call   8012b9 <vmalloc>
  8050ad:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        memcpy(new_hppg,hp,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  8050b1:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  8050b5:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8050b9:	ba 00 10 00 00       	mov    edx,0x1000
  8050be:	48 89 ce             	mov    rsi,rcx
  8050c1:	48 89 c7             	mov    rdi,rax
  8050c4:	e8 e9 67 00 00       	call   80b8b2 <memcpy>
        //把新的页面映射到进程页表里
        smmap(new_hppg,hp,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  8050c9:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8050cc:	48 98                	cdqe   
  8050ce:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8050d5:	48 05 60 85 40 00    	add    rax,0x408560
  8050db:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8050de:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  8050e2:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8050e6:	48 89 d1             	mov    rcx,rdx
  8050e9:	ba 07 00 00 00       	mov    edx,0x7
  8050ee:	48 89 c7             	mov    rdi,rax
  8050f1:	e8 73 bf ff ff       	call   801069 <smmap>
    for(;hp>=task[pid].mem_struct.heap_base;hp-=PAGE_4K_SIZE){
  8050f6:	48 81 6d d0 00 10 00 	sub    QWORD PTR [rbp-0x30],0x1000
  8050fd:	00 
  8050fe:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805101:	48 98                	cdqe   
  805103:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80510a:	48 05 c8 84 40 00    	add    rax,0x4084c8
  805110:	8b 00                	mov    eax,DWORD PTR [rax]
  805112:	48 98                	cdqe   
  805114:	48 39 45 d0          	cmp    QWORD PTR [rbp-0x30],rax
  805118:	73 89                	jae    8050a3 <sys_fork+0x72a>
    }
    //父进程运行到这里
    return pid;
  80511a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
}
  80511d:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  805121:	c9                   	leave  
  805122:	c3                   	ret    

0000000000805123 <release_mmap>:
//释放进程页表映射的内存，内核空间除外。
void release_mmap(struct process* p){
  805123:	f3 0f 1e fa          	endbr64 
  805127:	55                   	push   rbp
  805128:	48 89 e5             	mov    rbp,rsp
  80512b:	48 83 ec 50          	sub    rsp,0x50
  80512f:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    page_item * pml4p=p->pml4;
  805133:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805137:	48 8b 80 c0 00 00 00 	mov    rax,QWORD PTR [rax+0xc0]
  80513e:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //复制pdpt
    page_item *pml4e= pml4p;
  805142:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805146:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    for(int i=0;i<512;i++)
  80514a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805151:	e9 be 02 00 00       	jmp    805414 <release_mmap+0x2f1>
    {
        if(pml4e[i]&PAGE_PRESENT){
  805156:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805159:	48 98                	cdqe   
  80515b:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805162:	00 
  805163:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805167:	48 01 d0             	add    rax,rdx
  80516a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80516d:	83 e0 01             	and    eax,0x1
  805170:	48 85 c0             	test   rax,rax
  805173:	0f 84 97 02 00 00    	je     805410 <release_mmap+0x2ed>
            page_item *pdpte=pml4e[i]&PAGE_4K_MASK;
  805179:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80517c:	48 98                	cdqe   
  80517e:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805185:	00 
  805186:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80518a:	48 01 d0             	add    rax,rdx
  80518d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805190:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805197:	ff 00 00 
  80519a:	48 21 d0             	and    rax,rdx
  80519d:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            int j=i==0?1:0;//低1GB的空间不释放（内核空间）
  8051a1:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8051a5:	0f 94 c0             	sete   al
  8051a8:	0f b6 c0             	movzx  eax,al
  8051ab:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
            for(;j<512;j++)
  8051ae:	e9 24 02 00 00       	jmp    8053d7 <release_mmap+0x2b4>
            {
                if(pdpte[j]&PAGE_PRESENT&&!(pdpte[j]&PDPTE_1GB)){
  8051b3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8051b6:	48 98                	cdqe   
  8051b8:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8051bf:	00 
  8051c0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8051c4:	48 01 d0             	add    rax,rdx
  8051c7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8051ca:	83 e0 01             	and    eax,0x1
  8051cd:	48 85 c0             	test   rax,rax
  8051d0:	0f 84 fd 01 00 00    	je     8053d3 <release_mmap+0x2b0>
  8051d6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8051d9:	48 98                	cdqe   
  8051db:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8051e2:	00 
  8051e3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8051e7:	48 01 d0             	add    rax,rdx
  8051ea:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8051ed:	25 80 00 00 00       	and    eax,0x80
  8051f2:	48 85 c0             	test   rax,rax
  8051f5:	0f 85 d8 01 00 00    	jne    8053d3 <release_mmap+0x2b0>
                    page_item *pde=pdpte[j]&PAGE_4K_MASK;
  8051fb:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8051fe:	48 98                	cdqe   
  805200:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805207:	00 
  805208:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80520c:	48 01 d0             	add    rax,rdx
  80520f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805212:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805219:	ff 00 00 
  80521c:	48 21 d0             	and    rax,rdx
  80521f:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
                    for(int k=0;k<512;k++)
  805223:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80522a:	e9 6b 01 00 00       	jmp    80539a <release_mmap+0x277>
                    {
                        if(pde[k]&PAGE_PRESENT&&!(pde[k]&PDE_4MB)){
  80522f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805232:	48 98                	cdqe   
  805234:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80523b:	00 
  80523c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805240:	48 01 d0             	add    rax,rdx
  805243:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805246:	83 e0 01             	and    eax,0x1
  805249:	48 85 c0             	test   rax,rax
  80524c:	0f 84 dc 00 00 00    	je     80532e <release_mmap+0x20b>
  805252:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805255:	48 98                	cdqe   
  805257:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80525e:	00 
  80525f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805263:	48 01 d0             	add    rax,rdx
  805266:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805269:	25 80 00 00 00       	and    eax,0x80
  80526e:	48 85 c0             	test   rax,rax
  805271:	0f 85 b7 00 00 00    	jne    80532e <release_mmap+0x20b>
                            page_item *pte=pde[k]&PAGE_4K_MASK;
  805277:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80527a:	48 98                	cdqe   
  80527c:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805283:	00 
  805284:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805288:	48 01 d0             	add    rax,rdx
  80528b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80528e:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805295:	ff 00 00 
  805298:	48 21 d0             	and    rax,rdx
  80529b:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
                            for(int l=0;l<512;l++){
  80529f:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  8052a6:	eb 4f                	jmp    8052f7 <release_mmap+0x1d4>
                                if(pte[l]&PAGE_PRESENT){
  8052a8:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8052ab:	48 98                	cdqe   
  8052ad:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8052b4:	00 
  8052b5:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8052b9:	48 01 d0             	add    rax,rdx
  8052bc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8052bf:	83 e0 01             	and    eax,0x1
  8052c2:	48 85 c0             	test   rax,rax
  8052c5:	74 2c                	je     8052f3 <release_mmap+0x1d0>
                                    //释放申请的物理内存
                                    free_page(pte[l]&PAGE_4K_MASK);
  8052c7:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8052ca:	48 98                	cdqe   
  8052cc:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8052d3:	00 
  8052d4:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8052d8:	48 01 d0             	add    rax,rdx
  8052db:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8052de:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  8052e5:	ff 00 00 
  8052e8:	48 21 d0             	and    rax,rdx
  8052eb:	48 89 c7             	mov    rdi,rax
  8052ee:	e8 50 c4 ff ff       	call   801743 <free_page>
                            for(int l=0;l<512;l++){
  8052f3:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  8052f7:	81 7d f0 ff 01 00 00 	cmp    DWORD PTR [rbp-0x10],0x1ff
  8052fe:	7e a8                	jle    8052a8 <release_mmap+0x185>
                                }
                            }
                            //里面的项释放完了，这一项指向的vmalloc内存可以释放了
                            vmfree(pde[k]&PAGE_4K_MASK);
  805300:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805303:	48 98                	cdqe   
  805305:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80530c:	00 
  80530d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805311:	48 01 d0             	add    rax,rdx
  805314:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805317:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  80531e:	ff 00 00 
  805321:	48 21 d0             	and    rax,rdx
  805324:	48 89 c7             	mov    rdi,rax
  805327:	e8 1c c0 ff ff       	call   801348 <vmfree>
                        if(pde[k]&PAGE_PRESENT&&!(pde[k]&PDE_4MB)){
  80532c:	eb 68                	jmp    805396 <release_mmap+0x273>
                        }else if((pde[k]&PAGE_PRESENT)&&(pde[k]&PDE_4MB)){
  80532e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805331:	48 98                	cdqe   
  805333:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80533a:	00 
  80533b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80533f:	48 01 d0             	add    rax,rdx
  805342:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805345:	83 e0 01             	and    eax,0x1
  805348:	48 85 c0             	test   rax,rax
  80534b:	74 49                	je     805396 <release_mmap+0x273>
  80534d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805350:	48 98                	cdqe   
  805352:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805359:	00 
  80535a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80535e:	48 01 d0             	add    rax,rdx
  805361:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805364:	25 80 00 00 00       	and    eax,0x80
  805369:	48 85 c0             	test   rax,rax
  80536c:	74 28                	je     805396 <release_mmap+0x273>
                            //释放2MB页
                            free_pages_at(pde[k]&PAGE_4K_MASK,512);
  80536e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805371:	48 98                	cdqe   
  805373:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80537a:	00 
  80537b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80537f:	48 01 d0             	add    rax,rdx
  805382:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805385:	25 00 f0 ff ff       	and    eax,0xfffff000
  80538a:	be 00 02 00 00       	mov    esi,0x200
  80538f:	89 c7                	mov    edi,eax
  805391:	e8 31 c4 ff ff       	call   8017c7 <free_pages_at>
                    for(int k=0;k<512;k++)
  805396:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80539a:	81 7d f4 ff 01 00 00 	cmp    DWORD PTR [rbp-0xc],0x1ff
  8053a1:	0f 8e 88 fe ff ff    	jle    80522f <release_mmap+0x10c>
                        }
                    }
                    //这一页pde的内容释放完了，这一项指向的vmalloc可以释放了
                    vmfree(pdpte[j]&PAGE_4K_MASK);
  8053a7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8053aa:	48 98                	cdqe   
  8053ac:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8053b3:	00 
  8053b4:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8053b8:	48 01 d0             	add    rax,rdx
  8053bb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8053be:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  8053c5:	ff 00 00 
  8053c8:	48 21 d0             	and    rax,rdx
  8053cb:	48 89 c7             	mov    rdi,rax
  8053ce:	e8 75 bf ff ff       	call   801348 <vmfree>
            for(;j<512;j++)
  8053d3:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8053d7:	81 7d f8 ff 01 00 00 	cmp    DWORD PTR [rbp-0x8],0x1ff
  8053de:	0f 8e cf fd ff ff    	jle    8051b3 <release_mmap+0x90>
                }//1GB先不写，目前还没有初始化之后动态申请1GB页的

            }
            //这一页pdpte的内容释放完了，这一项指向的vmalloc可以释放了
            vmfree(pml4e[i]&PAGE_4K_MASK);
  8053e4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8053e7:	48 98                	cdqe   
  8053e9:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8053f0:	00 
  8053f1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8053f5:	48 01 d0             	add    rax,rdx
  8053f8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8053fb:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805402:	ff 00 00 
  805405:	48 21 d0             	and    rax,rdx
  805408:	48 89 c7             	mov    rdi,rax
  80540b:	e8 38 bf ff ff       	call   801348 <vmfree>
    for(int i=0;i<512;i++)
  805410:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805414:	81 7d fc ff 01 00 00 	cmp    DWORD PTR [rbp-0x4],0x1ff
  80541b:	0f 8e 35 fd ff ff    	jle    805156 <release_mmap+0x33>
        }
    }
}
  805421:	90                   	nop
  805422:	90                   	nop
  805423:	c9                   	leave  
  805424:	c3                   	ret    

0000000000805425 <copy_mmap>:
void copy_mmap(struct process* from, struct process *to){
  805425:	f3 0f 1e fa          	endbr64 
  805429:	55                   	push   rbp
  80542a:	48 89 e5             	mov    rbp,rsp
  80542d:	48 83 ec 60          	sub    rsp,0x60
  805431:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  805435:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
    page_item * pml4p=vmalloc();
  805439:	b8 00 00 00 00       	mov    eax,0x0
  80543e:	e8 76 be ff ff       	call   8012b9 <vmalloc>
  805443:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    memcpy(pml4p,from->regs.cr3,PAGE_4K_SIZE);//复制pml4
  805447:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80544b:	48 8b 80 44 02 00 00 	mov    rax,QWORD PTR [rax+0x244]
  805452:	48 89 c1             	mov    rcx,rax
  805455:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805459:	ba 00 10 00 00       	mov    edx,0x1000
  80545e:	48 89 ce             	mov    rsi,rcx
  805461:	48 89 c7             	mov    rdi,rax
  805464:	e8 49 64 00 00       	call   80b8b2 <memcpy>
    to->regs.cr3=pml4p;
  805469:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80546d:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  805471:	48 89 90 44 02 00 00 	mov    QWORD PTR [rax+0x244],rdx
    to->pml4=pml4p;
  805478:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80547c:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  805480:	48 89 90 c0 00 00 00 	mov    QWORD PTR [rax+0xc0],rdx
    //复制pdpt

    page_item *pml4e= pml4p;
  805487:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80548b:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    for(int i=0;i<512;i++)
  80548f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805496:	e9 09 03 00 00       	jmp    8057a4 <copy_mmap+0x37f>
    {
        if(pml4e[i]&PAGE_PRESENT){
  80549b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80549e:	48 98                	cdqe   
  8054a0:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8054a7:	00 
  8054a8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8054ac:	48 01 d0             	add    rax,rdx
  8054af:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8054b2:	83 e0 01             	and    eax,0x1
  8054b5:	48 85 c0             	test   rax,rax
  8054b8:	0f 84 e2 02 00 00    	je     8057a0 <copy_mmap+0x37b>
            addr_t old_data=pml4e[i];//旧的数据，里面保存了属性和要拷贝的数据的地址
  8054be:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8054c1:	48 98                	cdqe   
  8054c3:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8054ca:	00 
  8054cb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8054cf:	48 01 d0             	add    rax,rdx
  8054d2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8054d5:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            pml4e[i]=vmalloc()|(old_data&~PAGE_4K_MASK);
  8054d9:	b8 00 00 00 00       	mov    eax,0x0
  8054de:	e8 d6 bd ff ff       	call   8012b9 <vmalloc>
  8054e3:	48 89 c2             	mov    rdx,rax
  8054e6:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  8054ed:	00 ff ff 
  8054f0:	48 23 45 d8          	and    rax,QWORD PTR [rbp-0x28]
  8054f4:	48 89 c1             	mov    rcx,rax
  8054f7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8054fa:	48 98                	cdqe   
  8054fc:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  805503:	00 
  805504:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805508:	48 01 f0             	add    rax,rsi
  80550b:	48 09 ca             	or     rdx,rcx
  80550e:	48 89 10             	mov    QWORD PTR [rax],rdx
            memcpy(pml4e[i]&PAGE_4K_MASK,old_data&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  805511:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  805518:	ff 00 00 
  80551b:	48 23 45 d8          	and    rax,QWORD PTR [rbp-0x28]
  80551f:	48 89 c1             	mov    rcx,rax
  805522:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805525:	48 98                	cdqe   
  805527:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80552e:	00 
  80552f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805533:	48 01 d0             	add    rax,rdx
  805536:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805539:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805540:	ff 00 00 
  805543:	48 21 d0             	and    rax,rdx
  805546:	ba 00 10 00 00       	mov    edx,0x1000
  80554b:	48 89 ce             	mov    rsi,rcx
  80554e:	48 89 c7             	mov    rdi,rax
  805551:	e8 5c 63 00 00       	call   80b8b2 <memcpy>
            page_item *pdpte=pml4e[i]&PAGE_4K_MASK;
  805556:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805559:	48 98                	cdqe   
  80555b:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805562:	00 
  805563:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805567:	48 01 d0             	add    rax,rdx
  80556a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80556d:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805574:	ff 00 00 
  805577:	48 21 d0             	and    rax,rdx
  80557a:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            for(int j=0;j<512;j++)
  80557e:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805585:	e9 09 02 00 00       	jmp    805793 <copy_mmap+0x36e>
            {
                if(pdpte[j]&PAGE_PRESENT&&!(pdpte[j]&PDPTE_1GB)){
  80558a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80558d:	48 98                	cdqe   
  80558f:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805596:	00 
  805597:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80559b:	48 01 d0             	add    rax,rdx
  80559e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8055a1:	83 e0 01             	and    eax,0x1
  8055a4:	48 85 c0             	test   rax,rax
  8055a7:	0f 84 e2 01 00 00    	je     80578f <copy_mmap+0x36a>
  8055ad:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8055b0:	48 98                	cdqe   
  8055b2:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8055b9:	00 
  8055ba:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8055be:	48 01 d0             	add    rax,rdx
  8055c1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8055c4:	25 80 00 00 00       	and    eax,0x80
  8055c9:	48 85 c0             	test   rax,rax
  8055cc:	0f 85 bd 01 00 00    	jne    80578f <copy_mmap+0x36a>
                    addr_t old_data2=pdpte[j];//旧的数据，里面保存了属性和要拷贝的数据的地址
  8055d2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8055d5:	48 98                	cdqe   
  8055d7:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8055de:	00 
  8055df:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8055e3:	48 01 d0             	add    rax,rdx
  8055e6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8055e9:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
                    pdpte[j]=vmalloc()|(old_data2&~PAGE_4K_MASK);
  8055ed:	b8 00 00 00 00       	mov    eax,0x0
  8055f2:	e8 c2 bc ff ff       	call   8012b9 <vmalloc>
  8055f7:	48 89 c2             	mov    rdx,rax
  8055fa:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  805601:	00 ff ff 
  805604:	48 23 45 c8          	and    rax,QWORD PTR [rbp-0x38]
  805608:	48 89 c1             	mov    rcx,rax
  80560b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80560e:	48 98                	cdqe   
  805610:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  805617:	00 
  805618:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80561c:	48 01 f0             	add    rax,rsi
  80561f:	48 09 ca             	or     rdx,rcx
  805622:	48 89 10             	mov    QWORD PTR [rax],rdx
                    memcpy(pdpte[j]&PAGE_4K_MASK,old_data2&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  805625:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  80562c:	ff 00 00 
  80562f:	48 23 45 c8          	and    rax,QWORD PTR [rbp-0x38]
  805633:	48 89 c1             	mov    rcx,rax
  805636:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805639:	48 98                	cdqe   
  80563b:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805642:	00 
  805643:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805647:	48 01 d0             	add    rax,rdx
  80564a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80564d:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805654:	ff 00 00 
  805657:	48 21 d0             	and    rax,rdx
  80565a:	ba 00 10 00 00       	mov    edx,0x1000
  80565f:	48 89 ce             	mov    rsi,rcx
  805662:	48 89 c7             	mov    rdi,rax
  805665:	e8 48 62 00 00       	call   80b8b2 <memcpy>
                    page_item *pde=pdpte[j]&PAGE_4K_MASK;
  80566a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80566d:	48 98                	cdqe   
  80566f:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805676:	00 
  805677:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80567b:	48 01 d0             	add    rax,rdx
  80567e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805681:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805688:	ff 00 00 
  80568b:	48 21 d0             	and    rax,rdx
  80568e:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
                    for(int k=0;k<512;k++)
  805692:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  805699:	e9 e4 00 00 00       	jmp    805782 <copy_mmap+0x35d>
                    {
                        if(pde[k]&PAGE_PRESENT&&!(pde[k]&PDE_4MB)){
  80569e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8056a1:	48 98                	cdqe   
  8056a3:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8056aa:	00 
  8056ab:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8056af:	48 01 d0             	add    rax,rdx
  8056b2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8056b5:	83 e0 01             	and    eax,0x1
  8056b8:	48 85 c0             	test   rax,rax
  8056bb:	0f 84 bd 00 00 00    	je     80577e <copy_mmap+0x359>
  8056c1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8056c4:	48 98                	cdqe   
  8056c6:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8056cd:	00 
  8056ce:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8056d2:	48 01 d0             	add    rax,rdx
  8056d5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8056d8:	25 80 00 00 00       	and    eax,0x80
  8056dd:	48 85 c0             	test   rax,rax
  8056e0:	0f 85 98 00 00 00    	jne    80577e <copy_mmap+0x359>
                            addr_t old_data3=pde[k];//旧的数据，里面保存了属性和要拷贝的数据的地址
  8056e6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8056e9:	48 98                	cdqe   
  8056eb:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8056f2:	00 
  8056f3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8056f7:	48 01 d0             	add    rax,rdx
  8056fa:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8056fd:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
                            pde[k]=vmalloc()|(old_data3&~PAGE_4K_MASK);
  805701:	b8 00 00 00 00       	mov    eax,0x0
  805706:	e8 ae bb ff ff       	call   8012b9 <vmalloc>
  80570b:	48 89 c2             	mov    rdx,rax
  80570e:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  805715:	00 ff ff 
  805718:	48 23 45 b8          	and    rax,QWORD PTR [rbp-0x48]
  80571c:	48 89 c1             	mov    rcx,rax
  80571f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805722:	48 98                	cdqe   
  805724:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  80572b:	00 
  80572c:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805730:	48 01 f0             	add    rax,rsi
  805733:	48 09 ca             	or     rdx,rcx
  805736:	48 89 10             	mov    QWORD PTR [rax],rdx
                            memcpy(pde[k]&PAGE_4K_MASK,old_data3&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  805739:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  805740:	ff 00 00 
  805743:	48 23 45 b8          	and    rax,QWORD PTR [rbp-0x48]
  805747:	48 89 c1             	mov    rcx,rax
  80574a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80574d:	48 98                	cdqe   
  80574f:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805756:	00 
  805757:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80575b:	48 01 d0             	add    rax,rdx
  80575e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805761:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805768:	ff 00 00 
  80576b:	48 21 d0             	and    rax,rdx
  80576e:	ba 00 10 00 00       	mov    edx,0x1000
  805773:	48 89 ce             	mov    rsi,rcx
  805776:	48 89 c7             	mov    rdi,rax
  805779:	e8 34 61 00 00       	call   80b8b2 <memcpy>
                    for(int k=0;k<512;k++)
  80577e:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  805782:	81 7d f4 ff 01 00 00 	cmp    DWORD PTR [rbp-0xc],0x1ff
  805789:	0f 8e 0f ff ff ff    	jle    80569e <copy_mmap+0x279>
            for(int j=0;j<512;j++)
  80578f:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805793:	81 7d f8 ff 01 00 00 	cmp    DWORD PTR [rbp-0x8],0x1ff
  80579a:	0f 8e ea fd ff ff    	jle    80558a <copy_mmap+0x165>
    for(int i=0;i<512;i++)
  8057a0:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8057a4:	81 7d fc ff 01 00 00 	cmp    DWORD PTR [rbp-0x4],0x1ff
  8057ab:	0f 8e ea fc ff ff    	jle    80549b <copy_mmap+0x76>
                    }
                }
            }
        }
    }
}
  8057b1:	90                   	nop
  8057b2:	90                   	nop
  8057b3:	c9                   	leave  
  8057b4:	c3                   	ret    

00000000008057b5 <getpgrp>:

pid_t getpgrp(void){
  8057b5:	f3 0f 1e fa          	endbr64 
  8057b9:	55                   	push   rbp
  8057ba:	48 89 e5             	mov    rbp,rsp
    return current->gpid;
  8057bd:	48 8b 05 dc fd c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fddc]        # 4155a0 <current>
  8057c4:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
}
  8057c7:	5d                   	pop    rbp
  8057c8:	c3                   	ret    

00000000008057c9 <getpgid>:

int getpgid(pid_t pid,gid_t gid){
  8057c9:	f3 0f 1e fa          	endbr64 
  8057cd:	55                   	push   rbp
  8057ce:	48 89 e5             	mov    rbp,rsp
  8057d1:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8057d4:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==0)
  8057d7:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8057db:	75 0c                	jne    8057e9 <getpgid+0x20>
        return current->gpid;
  8057dd:	48 8b 05 bc fd c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fdbc]        # 4155a0 <current>
  8057e4:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8057e7:	eb 49                	jmp    805832 <getpgid+0x69>
    for (int i = 0; i <MAX_TASKS; ++i) {
  8057e9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8057f0:	eb 35                	jmp    805827 <getpgid+0x5e>
        if(task[i].pid==pid)
  8057f2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8057f5:	48 98                	cdqe   
  8057f7:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8057fe:	48 05 a0 84 40 00    	add    rax,0x4084a0
  805804:	8b 10                	mov    edx,DWORD PTR [rax]
  805806:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805809:	39 c2                	cmp    edx,eax
  80580b:	75 16                	jne    805823 <getpgid+0x5a>
            return task[i].gpid;
  80580d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805810:	48 98                	cdqe   
  805812:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805819:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80581f:	8b 00                	mov    eax,DWORD PTR [rax]
  805821:	eb 0f                	jmp    805832 <getpgid+0x69>
    for (int i = 0; i <MAX_TASKS; ++i) {
  805823:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805827:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  80582b:	7e c5                	jle    8057f2 <getpgid+0x29>
    }
    return -1;
  80582d:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  805832:	5d                   	pop    rbp
  805833:	c3                   	ret    

0000000000805834 <setpgid>:
int setpgid(pid_t pid,gid_t gid){
  805834:	f3 0f 1e fa          	endbr64 
  805838:	55                   	push   rbp
  805839:	48 89 e5             	mov    rbp,rsp
  80583c:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80583f:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==0)
  805842:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  805846:	75 38                	jne    805880 <setpgid+0x4c>
    {
        if(current->sid==current->pid)
  805848:	48 8b 05 51 fd c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fd51]        # 4155a0 <current>
  80584f:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  805852:	48 8b 05 47 fd c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fd47]        # 4155a0 <current>
  805859:	8b 00                	mov    eax,DWORD PTR [rax]
  80585b:	39 c2                	cmp    edx,eax
  80585d:	75 0a                	jne    805869 <setpgid+0x35>
            return -1;
  80585f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805864:	e9 9d 00 00 00       	jmp    805906 <setpgid+0xd2>
        current->gpid=gid;
  805869:	48 8b 05 30 fd c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fd30]        # 4155a0 <current>
  805870:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  805873:	89 50 04             	mov    DWORD PTR [rax+0x4],edx
        return 0;
  805876:	b8 00 00 00 00       	mov    eax,0x0
  80587b:	e9 86 00 00 00       	jmp    805906 <setpgid+0xd2>
    }
    for (int i = 0; i <MAX_TASKS; ++i) {
  805880:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805887:	eb 72                	jmp    8058fb <setpgid+0xc7>
        if(task[i].pid==pid)
  805889:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80588c:	48 98                	cdqe   
  80588e:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805895:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80589b:	8b 10                	mov    edx,DWORD PTR [rax]
  80589d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8058a0:	39 c2                	cmp    edx,eax
  8058a2:	75 53                	jne    8058f7 <setpgid+0xc3>
        {
            if(task[i].sid==task[i].pid)
  8058a4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8058a7:	48 98                	cdqe   
  8058a9:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8058b0:	48 05 a8 84 40 00    	add    rax,0x4084a8
  8058b6:	8b 10                	mov    edx,DWORD PTR [rax]
  8058b8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8058bb:	48 98                	cdqe   
  8058bd:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8058c4:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8058ca:	8b 00                	mov    eax,DWORD PTR [rax]
  8058cc:	39 c2                	cmp    edx,eax
  8058ce:	75 07                	jne    8058d7 <setpgid+0xa3>
                return -1;
  8058d0:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8058d5:	eb 2f                	jmp    805906 <setpgid+0xd2>
            task[i].gpid=gid;
  8058d7:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8058da:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8058dd:	48 63 d2             	movsxd rdx,edx
  8058e0:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  8058e7:	48 81 c2 a4 84 40 00 	add    rdx,0x4084a4
  8058ee:	89 02                	mov    DWORD PTR [rdx],eax
            return 0;
  8058f0:	b8 00 00 00 00       	mov    eax,0x0
  8058f5:	eb 0f                	jmp    805906 <setpgid+0xd2>
    for (int i = 0; i <MAX_TASKS; ++i) {
  8058f7:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8058fb:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  8058ff:	7e 88                	jle    805889 <setpgid+0x55>
        }
    }
    return -1;
  805901:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  805906:	5d                   	pop    rbp
  805907:	c3                   	ret    

0000000000805908 <setsid>:

pid_t setsid(void){
  805908:	f3 0f 1e fa          	endbr64 
  80590c:	55                   	push   rbp
  80590d:	48 89 e5             	mov    rbp,rsp
    current->sid=current->pid;
  805910:	48 8b 15 89 fc c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0fc89]        # 4155a0 <current>
  805917:	48 8b 05 82 fc c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fc82]        # 4155a0 <current>
  80591e:	8b 12                	mov    edx,DWORD PTR [rdx]
  805920:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
}
  805923:	90                   	nop
  805924:	5d                   	pop    rbp
  805925:	c3                   	ret    

0000000000805926 <getsid>:
pid_t getsid(pid_t pid){
  805926:	f3 0f 1e fa          	endbr64 
  80592a:	55                   	push   rbp
  80592b:	48 89 e5             	mov    rbp,rsp
  80592e:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(pid==0)
  805931:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  805935:	75 0c                	jne    805943 <getsid+0x1d>
        return current->sid;
  805937:	48 8b 05 62 fc c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fc62]        # 4155a0 <current>
  80593e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  805941:	eb 49                	jmp    80598c <getsid+0x66>
    for (int i = 0; i <MAX_TASKS; ++i) {
  805943:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80594a:	eb 35                	jmp    805981 <getsid+0x5b>
        if(task[i].pid==pid)
  80594c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80594f:	48 98                	cdqe   
  805951:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805958:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80595e:	8b 10                	mov    edx,DWORD PTR [rax]
  805960:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805963:	39 c2                	cmp    edx,eax
  805965:	75 16                	jne    80597d <getsid+0x57>
            return task[i].sid;
  805967:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80596a:	48 98                	cdqe   
  80596c:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805973:	48 05 a8 84 40 00    	add    rax,0x4084a8
  805979:	8b 00                	mov    eax,DWORD PTR [rax]
  80597b:	eb 0f                	jmp    80598c <getsid+0x66>
    for (int i = 0; i <MAX_TASKS; ++i) {
  80597d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805981:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  805985:	7e c5                	jle    80594c <getsid+0x26>
    }
    return -1;
  805987:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  80598c:	5d                   	pop    rbp
  80598d:	c3                   	ret    

000000000080598e <tcsetpgrp>:
int tcsetpgrp(int fildes,pid_t pgid_id){
  80598e:	f3 0f 1e fa          	endbr64 
  805992:	55                   	push   rbp
  805993:	48 89 e5             	mov    rbp,rsp
  805996:	48 83 ec 20          	sub    rsp,0x20
  80599a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80599d:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    //当前controlling terminal断联
    sys_ioctl(fildes,TTY_DISCONNECT,0);
  8059a0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8059a3:	ba 00 00 00 00       	mov    edx,0x0
  8059a8:	be 02 00 00 00       	mov    esi,0x2
  8059ad:	89 c7                	mov    edi,eax
  8059af:	e8 ca 00 00 00       	call   805a7e <sys_ioctl>
    int sid= getsid(0);//获取session id
  8059b4:	bf 00 00 00 00       	mov    edi,0x0
  8059b9:	e8 68 ff ff ff       	call   805926 <getsid>
  8059be:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    struct process* new_fgl=NULL;
  8059c1:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8059c8:	00 
    for (int i = 0; i <MAX_TASKS; ++i) {
  8059c9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8059d0:	e9 85 00 00 00       	jmp    805a5a <tcsetpgrp+0xcc>
        if(task[i].stat==ENDED)continue;
  8059d5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8059d8:	48 98                	cdqe   
  8059da:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8059e1:	48 05 b8 84 40 00    	add    rax,0x4084b8
  8059e7:	8b 00                	mov    eax,DWORD PTR [rax]
  8059e9:	83 f8 03             	cmp    eax,0x3
  8059ec:	74 67                	je     805a55 <tcsetpgrp+0xc7>
        if(task[i].sid==sid){
  8059ee:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8059f1:	48 98                	cdqe   
  8059f3:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8059fa:	48 05 a8 84 40 00    	add    rax,0x4084a8
  805a00:	8b 10                	mov    edx,DWORD PTR [rax]
  805a02:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805a05:	39 c2                	cmp    edx,eax
  805a07:	75 4d                	jne    805a56 <tcsetpgrp+0xc8>
            task[i].fg_pgid=pgid_id;
  805a09:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805a0c:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  805a0f:	48 63 d2             	movsxd rdx,edx
  805a12:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  805a19:	48 81 c2 ac 84 40 00 	add    rdx,0x4084ac
  805a20:	89 02                	mov    DWORD PTR [rdx],eax
            if(task[i].pid==pgid_id){
  805a22:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805a25:	48 98                	cdqe   
  805a27:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805a2e:	48 05 a0 84 40 00    	add    rax,0x4084a0
  805a34:	8b 10                	mov    edx,DWORD PTR [rax]
  805a36:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805a39:	39 c2                	cmp    edx,eax
  805a3b:	75 19                	jne    805a56 <tcsetpgrp+0xc8>
                //这是新前台进程组的leader
                new_fgl=&task[i];
  805a3d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805a40:	48 98                	cdqe   
  805a42:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805a49:	48 05 a0 84 40 00    	add    rax,0x4084a0
  805a4f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  805a53:	eb 01                	jmp    805a56 <tcsetpgrp+0xc8>
        if(task[i].stat==ENDED)continue;
  805a55:	90                   	nop
    for (int i = 0; i <MAX_TASKS; ++i) {
  805a56:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805a5a:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  805a5e:	0f 8e 71 ff ff ff    	jle    8059d5 <tcsetpgrp+0x47>
            }
        }
    }
    //TODO:通知新leader把tty连接
}
  805a64:	90                   	nop
  805a65:	c9                   	leave  
  805a66:	c3                   	ret    

0000000000805a67 <tcgetpgrp>:
pid_t tcgetpgrp(int fildes){
  805a67:	f3 0f 1e fa          	endbr64 
  805a6b:	55                   	push   rbp
  805a6c:	48 89 e5             	mov    rbp,rsp
  805a6f:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return current->fg_pgid;
  805a72:	48 8b 05 27 fb c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fb27]        # 4155a0 <current>
  805a79:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
}
  805a7c:	5d                   	pop    rbp
  805a7d:	c3                   	ret    

0000000000805a7e <sys_ioctl>:
//===============

int sys_ioctl(int fildes, int request, unsigned long args){
  805a7e:	f3 0f 1e fa          	endbr64 
  805a82:	55                   	push   rbp
  805a83:	48 89 e5             	mov    rbp,rsp
  805a86:	48 83 ec 10          	sub    rsp,0x10
  805a8a:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  805a8d:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  805a90:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    current->openf[fildes]->f_ops->ioctl(current->openf[fildes]->dentry->dir_inode,current->openf[fildes]\
  805a94:	48 8b 05 05 fb c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fb05]        # 4155a0 <current>
  805a9b:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  805a9e:	48 63 d2             	movsxd rdx,edx
  805aa1:	48 83 c2 1a          	add    rdx,0x1a
  805aa5:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  805aaa:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  805aae:	4c 8b 40 28          	mov    r8,QWORD PTR [rax+0x28]
  805ab2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805ab5:	48 63 d0             	movsxd rdx,eax
  805ab8:	48 8b 05 e1 fa c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fae1]        # 4155a0 <current>
  805abf:	8b 4d fc             	mov    ecx,DWORD PTR [rbp-0x4]
  805ac2:	48 63 c9             	movsxd rcx,ecx
  805ac5:	48 83 c1 1a          	add    rcx,0x1a
  805ac9:	48 8b 74 c8 08       	mov    rsi,QWORD PTR [rax+rcx*8+0x8]
  805ace:	48 8b 05 cb fa c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0facb]        # 4155a0 <current>
  805ad5:	8b 4d fc             	mov    ecx,DWORD PTR [rbp-0x4]
  805ad8:	48 63 c9             	movsxd rcx,ecx
  805adb:	48 83 c1 1a          	add    rcx,0x1a
  805adf:	48 8b 44 c8 08       	mov    rax,QWORD PTR [rax+rcx*8+0x8]
  805ae4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  805ae8:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  805aec:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  805af0:	48 89 c7             	mov    rdi,rax
  805af3:	41 ff d0             	call   r8
    ,request,args);
  805af6:	90                   	nop
  805af7:	c9                   	leave  
  805af8:	c3                   	ret    
  805af9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000805b00 <outb>:
  805b00:	66 89 fa             	mov    dx,di
  805b03:	66 89 f0             	mov    ax,si
  805b06:	ee                   	out    dx,al
  805b07:	e8 29 00 00 00       	call   805b35 <io_delay>
  805b0c:	c3                   	ret    

0000000000805b0d <outw>:
  805b0d:	66 89 fa             	mov    dx,di
  805b10:	66 89 f0             	mov    ax,si
  805b13:	66 ef                	out    dx,ax
  805b15:	90                   	nop
  805b16:	90                   	nop
  805b17:	90                   	nop
  805b18:	c3                   	ret    

0000000000805b19 <inb>:
  805b19:	31 c0                	xor    eax,eax
  805b1b:	66 89 fa             	mov    dx,di
  805b1e:	ec                   	in     al,dx
  805b1f:	90                   	nop
  805b20:	90                   	nop
  805b21:	90                   	nop
  805b22:	c3                   	ret    

0000000000805b23 <inw>:
  805b23:	31 c0                	xor    eax,eax
  805b25:	66 89 fa             	mov    dx,di
  805b28:	66 ed                	in     ax,dx
  805b2a:	90                   	nop
  805b2b:	90                   	nop
  805b2c:	90                   	nop
  805b2d:	c3                   	ret    

0000000000805b2e <eoi>:
  805b2e:	b0 20                	mov    al,0x20
  805b30:	e6 a0                	out    0xa0,al
  805b32:	e6 20                	out    0x20,al
  805b34:	c3                   	ret    

0000000000805b35 <io_delay>:
  805b35:	90                   	nop
  805b36:	90                   	nop
  805b37:	90                   	nop
  805b38:	90                   	nop
  805b39:	c3                   	ret    

0000000000805b3a <turn_on_int>:
  805b3a:	b0 f8                	mov    al,0xf8
  805b3c:	e6 21                	out    0x21,al
  805b3e:	e8 f2 ff ff ff       	call   805b35 <io_delay>
  805b43:	b0 af                	mov    al,0xaf
  805b45:	e6 a1                	out    0xa1,al
  805b47:	e8 e9 ff ff ff       	call   805b35 <io_delay>
  805b4c:	b8 00 70 10 00       	mov    eax,0x107000
  805b51:	0f 01 18             	lidt   [rax]
  805b54:	90                   	nop
  805b55:	90                   	nop
  805b56:	90                   	nop
  805b57:	90                   	nop
  805b58:	c3                   	ret    

0000000000805b59 <report_back_trace_of_err>:
  805b59:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  805b5e:	50                   	push   rax
  805b5f:	68 68 5b 80 00       	push   0x805b68
  805b64:	83 c4 08             	add    esp,0x8
  805b67:	c3                   	ret    

0000000000805b68 <bt_msg>:
  805b68:	65 72 72             	gs jb  805bdd <fill_desc+0x4e>
  805b6b:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  805b6c:	72 20                	jb     805b8e <init_gdt+0x11>
  805b6e:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  805b6f:	63 63 75             	movsxd esp,DWORD PTR [rbx+0x75]
  805b72:	72 73                	jb     805be7 <fill_desc+0x58>
  805b74:	20 61 74             	and    BYTE PTR [rcx+0x74],ah
  805b77:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR [rip+0x6e5c78]        # eeb7f5 <_knl_end+0x2eb7f5>

0000000000805b7d <init_gdt>:
#include "gdt.h"
#include "int.h"
descriptor *gdt=GDT_ADDR;
extern char *gdtptr;
int init_gdt()
{
  805b7d:	f3 0f 1e fa          	endbr64 
  805b81:	55                   	push   rbp
  805b82:	48 89 e5             	mov    rbp,rsp
//    fill_desc(0x108000,108,SEG_SYS_TSS|SEG_PRESENT,4);
    asm volatile("mov $0x48,%ax\r\n"
  805b85:	66 b8 48 00          	mov    ax,0x48
  805b89:	0f 00 d8             	ltr    ax
                 "ltr %ax");  
}
  805b8c:	90                   	nop
  805b8d:	5d                   	pop    rbp
  805b8e:	c3                   	ret    

0000000000805b8f <fill_desc>:
void fill_desc(u64 base, u64 limit, u16 attr, u32 index)
{
  805b8f:	f3 0f 1e fa          	endbr64 
  805b93:	55                   	push   rbp
  805b94:	48 89 e5             	mov    rbp,rsp
  805b97:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  805b9b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  805b9f:	89 d0                	mov    eax,edx
  805ba1:	89 4d e8             	mov    DWORD PTR [rbp-0x18],ecx
  805ba4:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    gdt[index].base_12=base&0xffff;
  805ba8:	48 8b 15 39 67 00 00 	mov    rdx,QWORD PTR [rip+0x6739]        # 80c2e8 <gdt>
  805baf:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805bb2:	48 c1 e0 04          	shl    rax,0x4
  805bb6:	48 01 d0             	add    rax,rdx
  805bb9:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  805bbd:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    gdt[index].base_3=(base>>16)&0xff;
  805bc1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805bc5:	48 c1 e8 10          	shr    rax,0x10
  805bc9:	48 89 c1             	mov    rcx,rax
  805bcc:	48 8b 15 15 67 00 00 	mov    rdx,QWORD PTR [rip+0x6715]        # 80c2e8 <gdt>
  805bd3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805bd6:	48 c1 e0 04          	shl    rax,0x4
  805bda:	48 01 d0             	add    rax,rdx
  805bdd:	89 ca                	mov    edx,ecx
  805bdf:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    gdt[index].base_4=(base>>24)&0xff;
  805be2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805be6:	48 c1 e8 18          	shr    rax,0x18
  805bea:	48 89 c1             	mov    rcx,rax
  805bed:	48 8b 15 f4 66 00 00 	mov    rdx,QWORD PTR [rip+0x66f4]        # 80c2e8 <gdt>
  805bf4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805bf7:	48 c1 e0 04          	shl    rax,0x4
  805bfb:	48 01 d0             	add    rax,rdx
  805bfe:	89 ca                	mov    edx,ecx
  805c00:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    gdt[index].base_5678=(base>>32)&0xffffffff;
  805c03:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805c07:	48 c1 e8 20          	shr    rax,0x20
  805c0b:	48 89 c2             	mov    rdx,rax
  805c0e:	48 8b 0d d3 66 00 00 	mov    rcx,QWORD PTR [rip+0x66d3]        # 80c2e8 <gdt>
  805c15:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805c18:	48 c1 e0 04          	shl    rax,0x4
  805c1c:	48 01 c8             	add    rax,rcx
  805c1f:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    gdt[index].limit_lo16=limit&0xffff;
  805c22:	48 8b 15 bf 66 00 00 	mov    rdx,QWORD PTR [rip+0x66bf]        # 80c2e8 <gdt>
  805c29:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805c2c:	48 c1 e0 04          	shl    rax,0x4
  805c30:	48 01 d0             	add    rax,rdx
  805c33:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  805c37:	66 89 10             	mov    WORD PTR [rax],dx
    gdt[index].attr=attr|((limit>>8)&0xf0);
  805c3a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805c3e:	48 c1 e8 08          	shr    rax,0x8
  805c42:	66 25 f0 00          	and    ax,0xf0
  805c46:	48 8b 0d 9b 66 00 00 	mov    rcx,QWORD PTR [rip+0x669b]        # 80c2e8 <gdt>
  805c4d:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  805c50:	48 c1 e2 04          	shl    rdx,0x4
  805c54:	48 01 ca             	add    rdx,rcx
  805c57:	66 0b 45 ec          	or     ax,WORD PTR [rbp-0x14]
  805c5b:	66 89 42 05          	mov    WORD PTR [rdx+0x5],ax

}
  805c5f:	90                   	nop
  805c60:	5d                   	pop    rbp
  805c61:	c3                   	ret    

0000000000805c62 <fill_gate>:

void fill_gate(u32 index,u32 offset,u16 selector,u16 attr)
{
  805c62:	f3 0f 1e fa          	endbr64 
  805c66:	55                   	push   rbp
  805c67:	48 89 e5             	mov    rbp,rsp
  805c6a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  805c6d:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  805c70:	89 c8                	mov    eax,ecx
  805c72:	66 89 55 e4          	mov    WORD PTR [rbp-0x1c],dx
  805c76:	66 89 45 e0          	mov    WORD PTR [rbp-0x20],ax
    gate* ptr=gdt;
  805c7a:	48 8b 05 67 66 00 00 	mov    rax,QWORD PTR [rip+0x6667]        # 80c2e8 <gdt>
  805c81:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ptr[index].offset_low=offset&0xffff;
  805c85:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805c88:	48 c1 e0 04          	shl    rax,0x4
  805c8c:	48 89 c2             	mov    rdx,rax
  805c8f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805c93:	48 01 d0             	add    rax,rdx
  805c96:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  805c99:	66 89 10             	mov    WORD PTR [rax],dx
    ptr[index].offset_high=(offset>>16)&0xffff;
  805c9c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805c9f:	48 c1 e0 04          	shl    rax,0x4
  805ca3:	48 89 c2             	mov    rdx,rax
  805ca6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805caa:	48 01 d0             	add    rax,rdx
  805cad:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  805cb0:	c1 ea 10             	shr    edx,0x10
  805cb3:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    ptr[index].selector=selector;
  805cb6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805cb9:	48 c1 e0 04          	shl    rax,0x4
  805cbd:	48 89 c2             	mov    rdx,rax
  805cc0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805cc4:	48 01 c2             	add    rdx,rax
  805cc7:	0f b7 45 e4          	movzx  eax,WORD PTR [rbp-0x1c]
  805ccb:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    ptr[index].attr=attr;
  805ccf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805cd2:	48 c1 e0 04          	shl    rax,0x4
  805cd6:	48 89 c2             	mov    rdx,rax
  805cd9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805cdd:	48 01 c2             	add    rdx,rax
  805ce0:	0f b7 45 e0          	movzx  eax,WORD PTR [rbp-0x20]
  805ce4:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
}
  805ce8:	90                   	nop
  805ce9:	5d                   	pop    rbp
  805cea:	c3                   	ret    

0000000000805ceb <fill_ldt_desc>:

void fill_ldt_desc(u32 base, u32 limit,u16 attr,descriptor *desc)
{
  805ceb:	f3 0f 1e fa          	endbr64 
  805cef:	55                   	push   rbp
  805cf0:	48 89 e5             	mov    rbp,rsp
  805cf3:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  805cf6:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  805cf9:	89 d0                	mov    eax,edx
  805cfb:	48 89 4d e8          	mov    QWORD PTR [rbp-0x18],rcx
  805cff:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
//    desc->base_lo16=base&0xffff;
//    desc->base_mid8=(base>>16)&0xff;
//    desc->base_hi8=(base>>24)&0xff;
//    desc->limit_lo16=limit&0xffff;
//    desc->attr=attr|(limit>>16&0xf)<<8;
  805d03:	90                   	nop
  805d04:	5d                   	pop    rbp
  805d05:	c3                   	ret    
  805d06:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  805d0d:	00 00 00 

0000000000805d10 <fill_desc>:
  805d10:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  805d15:	67 8b 5c 24 08       	mov    ebx,DWORD PTR [esp+0x8]
  805d1a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  805d1f:	67 8b 54 24 10       	mov    edx,DWORD PTR [esp+0x10]
  805d24:	be 00 60 00 00       	mov    esi,0x6000
  805d29:	c1 e2 03             	shl    edx,0x3
  805d2c:	01 d6                	add    esi,edx
  805d2e:	66 67 89 1e          	mov    WORD PTR [esi],bx
  805d32:	66 67 89 46 02       	mov    WORD PTR [esi+0x2],ax
  805d37:	c1 e8 10             	shr    eax,0x10
  805d3a:	67 88 46 04          	mov    BYTE PTR [esi+0x4],al
  805d3e:	c1 eb 10             	shr    ebx,0x10
  805d41:	67 88 5e 06          	mov    BYTE PTR [esi+0x6],bl
  805d45:	67 88 66 07          	mov    BYTE PTR [esi+0x7],ah
  805d49:	67 09 4e 05          	or     DWORD PTR [esi+0x5],ecx
  805d4d:	c3                   	ret    

0000000000805d4e <clock_c>:
#include <devman.h>
#include <disk.h>
extern int manage_proc_lock;
extern int cur_proc;
extern struct process *task;
void clock_c(){
  805d4e:	f3 0f 1e fa          	endbr64 
  805d52:	55                   	push   rbp
  805d53:	48 89 e5             	mov    rbp,rsp
    //refresh_wnds();
    execute_request();
  805d56:	b8 00 00 00 00       	mov    eax,0x0
  805d5b:	e8 a6 26 00 00       	call   808406 <execute_request>
    do_req();
  805d60:	b8 00 00 00 00       	mov    eax,0x0
  805d65:	e8 09 d6 ff ff       	call   803373 <do_req>
    if(!manage_proc_lock)
  805d6a:	8b 05 18 65 00 00    	mov    eax,DWORD PTR [rip+0x6518]        # 80c288 <manage_proc_lock>
  805d70:	85 c0                	test   eax,eax
  805d72:	75 0a                	jne    805d7e <clock_c+0x30>
    {
        manage_proc();
  805d74:	b8 00 00 00 00       	mov    eax,0x0
  805d79:	e8 96 dd ff ff       	call   803b14 <manage_proc>
    }
    //puts("1 disk req executed.");
  805d7e:	90                   	nop
  805d7f:	5d                   	pop    rbp
  805d80:	c3                   	ret    
  805d81:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  805d88:	00 00 00 
  805d8b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000805d90 <clock>:
  805d90:	50                   	push   rax
  805d91:	53                   	push   rbx
  805d92:	51                   	push   rcx
  805d93:	52                   	push   rdx
  805d94:	57                   	push   rdi
  805d95:	56                   	push   rsi
  805d96:	41 50                	push   r8
  805d98:	41 51                	push   r9
  805d9a:	41 52                	push   r10
  805d9c:	41 53                	push   r11
  805d9e:	41 54                	push   r12
  805da0:	41 55                	push   r13
  805da2:	41 56                	push   r14
  805da4:	41 57                	push   r15
  805da6:	e8 41 dd ff ff       	call   803aec <save_rsp>
  805dab:	66 8c c0             	mov    ax,es
  805dae:	50                   	push   rax
  805daf:	66 8c d8             	mov    ax,ds
  805db2:	50                   	push   rax
  805db3:	66 b8 10 00          	mov    ax,0x10
  805db7:	8e c0                	mov    es,eax
  805db9:	8e d8                	mov    ds,eax

0000000000805dbb <clock.normal_part>:
  805dbb:	b0 20                	mov    al,0x20
  805dbd:	e6 a0                	out    0xa0,al
  805dbf:	e6 20                	out    0x20,al
  805dc1:	e8 88 ff ff ff       	call   805d4e <clock_c>
  805dc6:	58                   	pop    rax
  805dc7:	8e d8                	mov    ds,eax
  805dc9:	58                   	pop    rax
  805dca:	8e c0                	mov    es,eax
  805dcc:	41 5f                	pop    r15
  805dce:	41 5e                	pop    r14
  805dd0:	41 5d                	pop    r13
  805dd2:	41 5c                	pop    r12
  805dd4:	41 5b                	pop    r11
  805dd6:	41 5a                	pop    r10
  805dd8:	41 59                	pop    r9
  805dda:	41 58                	pop    r8
  805ddc:	5e                   	pop    rsi
  805ddd:	5f                   	pop    rdi
  805dde:	5a                   	pop    rdx
  805ddf:	59                   	pop    rcx
  805de0:	5b                   	pop    rbx
  805de1:	58                   	pop    rax
  805de2:	48 cf                	iretq  

0000000000805de4 <execute>:
    return ind;
}
*/

int execute(char *path, char **argv)
{
  805de4:	f3 0f 1e fa          	endbr64 
  805de8:	55                   	push   rbp
  805de9:	48 89 e5             	mov    rbp,rsp
  805dec:	48 83 ec 30          	sub    rsp,0x30
  805df0:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  805df4:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    //尚未切换到目标进程
    //syscall(SYSCALL_REG_PROC, load_pe,0,0,0,0);
    int fno=-1,cwd_fno=-1;
  805df8:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  805dff:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    if((fno=sys_open(path, O_EXEC)) <0)return -1;
  805e06:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805e0a:	be 00 10 00 00       	mov    esi,0x1000
  805e0f:	48 89 c7             	mov    rdi,rax
  805e12:	e8 79 16 00 00       	call   807490 <sys_open>
  805e17:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  805e1a:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  805e1e:	79 0a                	jns    805e2a <execute+0x46>
  805e20:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805e25:	e9 ba 00 00 00       	jmp    805ee4 <execute+0x100>
    //
    char *p=path;
  805e2a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805e2e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='\0';p++);
  805e32:	eb 05                	jmp    805e39 <execute+0x55>
  805e34:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  805e39:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805e3d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805e40:	84 c0                	test   al,al
  805e42:	75 f0                	jne    805e34 <execute+0x50>
    for(;*p!='/'&&p>path;p--);
  805e44:	eb 05                	jmp    805e4b <execute+0x67>
  805e46:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  805e4b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805e4f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805e52:	3c 2f                	cmp    al,0x2f
  805e54:	74 0a                	je     805e60 <execute+0x7c>
  805e56:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805e5a:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  805e5e:	77 e6                	ja     805e46 <execute+0x62>
    if(p>path)
  805e60:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805e64:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  805e68:	76 2f                	jbe    805e99 <execute+0xb5>
    {
        *p='\0';
  805e6a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805e6e:	c6 00 00             	mov    BYTE PTR [rax],0x0
        if((cwd_fno=sys_open(path, O_DIRECTORY)) <0)return -1;
  805e71:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805e75:	be 00 40 00 00       	mov    esi,0x4000
  805e7a:	48 89 c7             	mov    rdi,rax
  805e7d:	e8 0e 16 00 00       	call   807490 <sys_open>
  805e82:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805e85:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  805e89:	79 07                	jns    805e92 <execute+0xae>
  805e8b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805e90:	eb 52                	jmp    805ee4 <execute+0x100>
        *p='/';
  805e92:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805e96:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
    }
    extern struct file opened[];
    extern struct process task[];
    int pi= reg_proc(proc_start, &opened[cwd_fno], &opened[fno]);
  805e99:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805e9c:	48 63 d0             	movsxd rdx,eax
  805e9f:	48 89 d0             	mov    rax,rdx
  805ea2:	48 c1 e0 02          	shl    rax,0x2
  805ea6:	48 01 d0             	add    rax,rdx
  805ea9:	48 c1 e0 03          	shl    rax,0x3
  805ead:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  805eb4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805eb7:	48 63 c8             	movsxd rcx,eax
  805eba:	48 89 c8             	mov    rax,rcx
  805ebd:	48 c1 e0 02          	shl    rax,0x2
  805ec1:	48 01 c8             	add    rax,rcx
  805ec4:	48 c1 e0 03          	shl    rax,0x3
  805ec8:	48 05 60 06 40 00    	add    rax,0x400660
  805ece:	b9 49 60 80 00       	mov    ecx,0x806049
  805ed3:	48 89 c6             	mov    rsi,rax
  805ed6:	48 89 cf             	mov    rdi,rcx
  805ed9:	e8 38 e4 ff ff       	call   804316 <reg_proc>
  805ede:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    return pi;
  805ee1:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
}
  805ee4:	c9                   	leave  
  805ee5:	c3                   	ret    

0000000000805ee6 <sys_execve>:

int sys_execve(char *path,char **argv){
  805ee6:	f3 0f 1e fa          	endbr64 
  805eea:	55                   	push   rbp
  805eeb:	48 89 e5             	mov    rbp,rsp
  805eee:	48 83 ec 30          	sub    rsp,0x30
  805ef2:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  805ef6:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    int fno=-1,cwd_fno=-1;
  805efa:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
  805f01:	c7 45 f8 ff ff ff ff 	mov    DWORD PTR [rbp-0x8],0xffffffff
    if((fno=sys_open(path, O_EXEC)) <0)return -ENOENT;
  805f08:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805f0c:	be 00 10 00 00       	mov    esi,0x1000
  805f11:	48 89 c7             	mov    rdi,rax
  805f14:	e8 77 15 00 00       	call   807490 <sys_open>
  805f19:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805f1c:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  805f20:	79 0a                	jns    805f2c <sys_execve+0x46>
  805f22:	b8 d3 ff ff ff       	mov    eax,0xffffffd3
  805f27:	e9 ad 00 00 00       	jmp    805fd9 <sys_execve+0xf3>
//        if((cwd_fno=sys_open(path, O_DIRECTORY)) <0)return -1;
//        *p='/';
//    }
    extern struct file opened[];
    extern struct process task[];
    if(sys_close(current->exef-opened)<0)return -1;
  805f2c:	48 8b 05 6d f6 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f66d]        # 4155a0 <current>
  805f33:	48 8b 80 d0 00 00 00 	mov    rax,QWORD PTR [rax+0xd0]
  805f3a:	48 2d 60 06 40 00    	sub    rax,0x400660
  805f40:	48 c1 f8 03          	sar    rax,0x3
  805f44:	48 89 c2             	mov    rdx,rax
  805f47:	48 b8 cd cc cc cc cc 	movabs rax,0xcccccccccccccccd
  805f4e:	cc cc cc 
  805f51:	48 0f af c2          	imul   rax,rdx
  805f55:	89 c7                	mov    edi,eax
  805f57:	e8 4b 18 00 00       	call   8077a7 <sys_close>

    void *retp= load_pe;
  805f5c:	48 c7 45 f0 7b 60 80 	mov    QWORD PTR [rbp-0x10],0x80607b
  805f63:	00 
    current->exef=&opened[fno];//改变执行文件
  805f64:	48 8b 15 35 f6 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0f635]        # 4155a0 <current>
  805f6b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805f6e:	48 63 c8             	movsxd rcx,eax
  805f71:	48 89 c8             	mov    rax,rcx
  805f74:	48 c1 e0 02          	shl    rax,0x2
  805f78:	48 01 c8             	add    rax,rcx
  805f7b:	48 c1 e0 03          	shl    rax,0x3
  805f7f:	48 05 60 06 40 00    	add    rax,0x400660
  805f85:	48 89 82 d0 00 00 00 	mov    QWORD PTR [rdx+0xd0],rax
    //重新设置进程数据
    //清空原来的页表
    release_mmap(current);
  805f8c:	48 8b 05 0d f6 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f60d]        # 4155a0 <current>
  805f93:	48 89 c7             	mov    rdi,rax
  805f96:	e8 88 f1 ff ff       	call   805123 <release_mmap>
    current->regs.rsp=STACK_TOP;//清空栈
  805f9b:	48 8b 05 fe f5 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f5fe]        # 4155a0 <current>
  805fa2:	48 be 00 f0 ff ff ff 	movabs rsi,0xfffffffff000
  805fa9:	ff 00 00 
  805fac:	48 89 b0 7c 02 00 00 	mov    QWORD PTR [rax+0x27c],rsi
    extern TSS* tss;
    //sysret直接返回到load_pe加载新程序，然后直接开始运行新程序的main
    stack_store_regs *rs=tss->ists[0]- sizeof(stack_store_regs);
  805fb3:	48 8b 05 26 63 00 00 	mov    rax,QWORD PTR [rip+0x6326]        # 80c2e0 <tss>
  805fba:	48 8b 40 24          	mov    rax,QWORD PTR [rax+0x24]
  805fbe:	48 2d a8 00 00 00    	sub    rax,0xa8
  805fc4:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    rs->rcx=retp;
  805fc8:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  805fcc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805fd0:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    return 0;
  805fd4:	b8 00 00 00 00       	mov    eax,0x0
}
  805fd9:	c9                   	leave  
  805fda:	c3                   	ret    

0000000000805fdb <exec_call>:
int exec_call(char *path)
{
  805fdb:	f3 0f 1e fa          	endbr64 
  805fdf:	55                   	push   rbp
  805fe0:	48 89 e5             	mov    rbp,rsp
  805fe3:	48 83 ec 20          	sub    rsp,0x20
  805fe7:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pi= execute(path, NULL);
  805feb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805fef:	be 00 00 00 00       	mov    esi,0x0
  805ff4:	48 89 c7             	mov    rdi,rax
  805ff7:	e8 e8 fd ff ff       	call   805de4 <execute>
  805ffc:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int tss= _TSS_IND(pi)*8;
  805fff:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806002:	01 c0                	add    eax,eax
  806004:	83 c0 05             	add    eax,0x5
  806007:	c1 e0 03             	shl    eax,0x3
  80600a:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    extern struct process task[];
    extern int cur_proc;
    switch_proc_tss(pi);
  80600d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806010:	89 c7                	mov    edi,eax
  806012:	e8 90 dc ff ff       	call   803ca7 <switch_proc_tss>
    while(task[pi].stat!=ENDED);
  806017:	90                   	nop
  806018:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80601b:	48 98                	cdqe   
  80601d:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  806024:	48 05 b0 84 40 00    	add    rax,0x4084b0
  80602a:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80602d:	83 f8 03             	cmp    eax,0x3
  806030:	75 e6                	jne    806018 <exec_call+0x3d>
    return task[pi].exit_code;
  806032:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806035:	48 98                	cdqe   
  806037:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80603e:	48 05 c0 84 40 00    	add    rax,0x4084c0
  806044:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
}
  806047:	c9                   	leave  
  806048:	c3                   	ret    

0000000000806049 <proc_start>:
int proc_start()
{
  806049:	f3 0f 1e fa          	endbr64 
  80604d:	55                   	push   rbp
  80604e:	48 89 e5             	mov    rbp,rsp
    extern struct process task[];
    extern int cur_proc;
    load_pe(&task[cur_proc]);
  806051:	8b 05 d5 f5 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f5d5]        # 41562c <cur_proc>
  806057:	48 98                	cdqe   
  806059:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  806060:	48 05 a0 84 40 00    	add    rax,0x4084a0
  806066:	48 89 c7             	mov    rdi,rax
  806069:	e8 0d 00 00 00       	call   80607b <load_pe>
    //释放进程资源
    sys_exit(0);
  80606e:	bf 00 00 00 00       	mov    edi,0x0
  806073:	e8 76 e2 ff ff       	call   8042ee <sys_exit>
}
  806078:	90                   	nop
  806079:	5d                   	pop    rbp
  80607a:	c3                   	ret    

000000000080607b <load_pe>:
//在cr3切换到目标进程下的加载程序
int load_pe(struct process *proc)
{
  80607b:	f3 0f 1e fa          	endbr64 
  80607f:	55                   	push   rbp
  806080:	48 89 e5             	mov    rbp,rsp
  806083:	48 81 ec c0 02 00 00 	sub    rsp,0x2c0
  80608a:	48 89 bd 48 fd ff ff 	mov    QWORD PTR [rbp-0x2b8],rdi
    // 读取文件头
    struct file *f=proc->exef;
  806091:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  806098:	48 8b 80 d0 00 00 00 	mov    rax,QWORD PTR [rax+0xd0]
  80609f:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    int exefno=-1;
  8060a3:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    for(int i=0;i<MAX_PROC_OPENF;i++)
  8060aa:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8060b1:	eb 28                	jmp    8060db <load_pe+0x60>
        if(current->openf[i]==f)
  8060b3:	48 8b 05 e6 f4 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f4e6]        # 4155a0 <current>
  8060ba:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  8060bd:	48 63 d2             	movsxd rdx,edx
  8060c0:	48 83 c2 1a          	add    rdx,0x1a
  8060c4:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  8060c9:	48 39 45 98          	cmp    QWORD PTR [rbp-0x68],rax
  8060cd:	75 08                	jne    8060d7 <load_pe+0x5c>
        {
            exefno=i;
  8060cf:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8060d2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
            break;
  8060d5:	eb 0a                	jmp    8060e1 <load_pe+0x66>
    for(int i=0;i<MAX_PROC_OPENF;i++)
  8060d7:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8060db:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  8060df:	7e d2                	jle    8060b3 <load_pe+0x38>
        }
    if(exefno==-1)return ERR;
  8060e1:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  8060e5:	75 0a                	jne    8060f1 <load_pe+0x76>
  8060e7:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8060ec:	e9 f1 06 00 00       	jmp    8067e2 <load_pe+0x767>

    IMAGE_DOS_HEADER tdh;
    IMAGE_NT_HEADERS32 tnth;
    sys_read(exefno, &tdh, sizeof(tdh));
  8060f1:	48 8d 8d 80 fe ff ff 	lea    rcx,[rbp-0x180]
  8060f8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8060fb:	ba 44 00 00 00       	mov    edx,0x44
  806100:	48 89 ce             	mov    rsi,rcx
  806103:	89 c7                	mov    edi,eax
  806105:	e8 55 17 00 00       	call   80785f <sys_read>
    sys_lseek(exefno,tdh.e_lfanew,SEEK_SET);
  80610a:	48 8b 85 bc fe ff ff 	mov    rax,QWORD PTR [rbp-0x144]
  806111:	48 89 c1             	mov    rcx,rax
  806114:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806117:	ba 00 00 00 00       	mov    edx,0x0
  80611c:	48 89 ce             	mov    rsi,rcx
  80611f:	89 c7                	mov    edi,eax
  806121:	e8 99 18 00 00       	call   8079bf <sys_lseek>
    sys_read(exefno, &tnth, sizeof(tnth));
  806126:	48 8d 8d 70 fd ff ff 	lea    rcx,[rbp-0x290]
  80612d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806130:	ba 0c 01 00 00       	mov    edx,0x10c
  806135:	48 89 ce             	mov    rsi,rcx
  806138:	89 c7                	mov    edi,eax
  80613a:	e8 20 17 00 00       	call   80785f <sys_read>

    //是否需要移动base(先不检查)
    addr_t nbase=tnth.OptionalHeader.ImageBase;
  80613f:	48 8b 85 a4 fd ff ff 	mov    rax,QWORD PTR [rbp-0x25c]
  806146:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    int pgn=tnth.OptionalHeader.SizeOfImage/PAGE_SIZE;
  80614a:	8b 85 c4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x23c]
  806150:	c1 e8 0c             	shr    eax,0xc
  806153:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
//        break;
//    }

    //proc->tss.eip=tnth.OptionalHeader.AddressOfEntryPoint+nbase;
    //存放文件头
    sys_lseek(exefno,0,SEEK_SET);
  806156:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806159:	ba 00 00 00 00       	mov    edx,0x0
  80615e:	be 00 00 00 00       	mov    esi,0x0
  806163:	89 c7                	mov    edi,eax
  806165:	e8 55 18 00 00       	call   8079bf <sys_lseek>
    sys_read(exefno, nbase, PAGE_SIZE);
  80616a:	48 8b 4d 90          	mov    rcx,QWORD PTR [rbp-0x70]
  80616e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806171:	ba 00 10 00 00       	mov    edx,0x1000
  806176:	48 89 ce             	mov    rsi,rcx
  806179:	89 c7                	mov    edi,eax
  80617b:	e8 df 16 00 00       	call   80785f <sys_read>
    //dos头
    PIMAGE_DOS_HEADER dosh=nbase;
  806180:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806184:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
    PIMAGE_NT_HEADERS64 nth=nbase+dosh->e_lfanew;
  806188:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80618c:	48 8b 50 3c          	mov    rdx,QWORD PTR [rax+0x3c]
  806190:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806194:	48 01 d0             	add    rax,rdx
  806197:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    PIMAGE_FILE_HEADER fh=&nth->FileHeader;
  80619e:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8061a5:	48 83 c0 04          	add    rax,0x4
  8061a9:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    //为新进程分配内存页
    //计算所需的页
    int prog_size=nth->OptionalHeader.SizeOfImage;
  8061b0:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8061b7:	8b 40 50             	mov    eax,DWORD PTR [rax+0x50]
  8061ba:	89 85 6c ff ff ff    	mov    DWORD PTR [rbp-0x94],eax
    int page_count=prog_size/4096;
  8061c0:	8b 85 6c ff ff ff    	mov    eax,DWORD PTR [rbp-0x94]
  8061c6:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8061cc:	85 c0                	test   eax,eax
  8061ce:	0f 48 c2             	cmovs  eax,edx
  8061d1:	c1 f8 0c             	sar    eax,0xc
  8061d4:	89 85 68 ff ff ff    	mov    DWORD PTR [rbp-0x98],eax

    addr_t shell_addr=nth->OptionalHeader.AddressOfEntryPoint+nbase;
  8061da:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8061e1:	8b 40 28             	mov    eax,DWORD PTR [rax+0x28]
  8061e4:	89 c2                	mov    edx,eax
  8061e6:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8061ea:	48 01 d0             	add    rax,rdx
  8061ed:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
    int page_index_item_count=page_count/1024+page_count%1024==0?0:1;
  8061f4:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [rbp-0x98]
  8061fa:	8d 90 ff 03 00 00    	lea    edx,[rax+0x3ff]
  806200:	85 c0                	test   eax,eax
  806202:	0f 48 c2             	cmovs  eax,edx
  806205:	c1 f8 0a             	sar    eax,0xa
  806208:	89 c1                	mov    ecx,eax
  80620a:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [rbp-0x98]
  806210:	99                   	cdq    
  806211:	c1 ea 16             	shr    edx,0x16
  806214:	01 d0                	add    eax,edx
  806216:	25 ff 03 00 00       	and    eax,0x3ff
  80621b:	29 d0                	sub    eax,edx
  80621d:	01 c8                	add    eax,ecx
  80621f:	85 c0                	test   eax,eax
  806221:	0f 95 c0             	setne  al
  806224:	0f b6 c0             	movzx  eax,al
  806227:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
    int start_pgind_item=shell_addr/PAGE_INDEX_SIZE;
  80622d:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  806234:	48 c1 e8 15          	shr    rax,0x15
  806238:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax

    //sys_read sections
    PIMAGE_SECTION_HEADER psec=(u32)nth+sizeof(IMAGE_NT_HEADERS32);
  80623e:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806245:	89 c0                	mov    eax,eax
  806247:	48 05 0c 01 00 00    	add    rax,0x10c
  80624d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
    nth->FileHeader.NumberOfSections*sizeof(IMAGE_SECTION_HEADER);
  806251:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806258:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  80625c:	0f b7 d0             	movzx  edx,ax
  80625f:	89 d0                	mov    eax,edx
  806261:	c1 e0 02             	shl    eax,0x2
  806264:	01 d0                	add    eax,edx
  806266:	c1 e0 03             	shl    eax,0x3
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
  806269:	05 50 01 00 00       	add    eax,0x150
  80626e:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
    int align=nth->OptionalHeader.FileAlignment;
  806274:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  80627b:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  80627e:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    data_start=data_start%align?data_start-data_start%align+align:data_start;
  806284:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  80628a:	99                   	cdq    
  80628b:	f7 bd 50 ff ff ff    	idiv   DWORD PTR [rbp-0xb0]
  806291:	89 d0                	mov    eax,edx
  806293:	85 c0                	test   eax,eax
  806295:	74 23                	je     8062ba <load_pe+0x23f>
  806297:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  80629d:	99                   	cdq    
  80629e:	f7 bd 50 ff ff ff    	idiv   DWORD PTR [rbp-0xb0]
  8062a4:	89 d1                	mov    ecx,edx
  8062a6:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  8062ac:	29 c8                	sub    eax,ecx
  8062ae:	89 c2                	mov    edx,eax
  8062b0:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  8062b6:	01 d0                	add    eax,edx
  8062b8:	eb 06                	jmp    8062c0 <load_pe+0x245>
  8062ba:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  8062c0:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  8062c6:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8062cd:	eb 6b                	jmp    80633a <load_pe+0x2bf>
    {
        int disca=psec->Characteristics&IMAGE_SCN_MEM_DISCARDABLE;
  8062cf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8062d3:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  8062d6:	25 00 00 00 02       	and    eax,0x2000000
  8062db:	89 85 c4 fe ff ff    	mov    DWORD PTR [rbp-0x13c],eax
        if(disca)
  8062e1:	83 bd c4 fe ff ff 00 	cmp    DWORD PTR [rbp-0x13c],0x0
  8062e8:	75 46                	jne    806330 <load_pe+0x2b5>
            continue;
        //直接读，缺页内核解决
        sys_lseek(exefno,psec->PointerToRawData,SEEK_SET);
  8062ea:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8062ee:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  8062f1:	89 c1                	mov    ecx,eax
  8062f3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8062f6:	ba 00 00 00 00       	mov    edx,0x0
  8062fb:	48 89 ce             	mov    rsi,rcx
  8062fe:	89 c7                	mov    edi,eax
  806300:	e8 ba 16 00 00       	call   8079bf <sys_lseek>
        sys_read(exefno, psec->VirtualAddress + nbase,  psec->SizeOfRawData);
  806305:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806309:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80630c:	89 c2                	mov    edx,eax
  80630e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806312:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  806315:	89 c1                	mov    ecx,eax
  806317:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80631b:	48 01 c8             	add    rax,rcx
  80631e:	48 89 c1             	mov    rcx,rax
  806321:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806324:	48 89 ce             	mov    rsi,rcx
  806327:	89 c7                	mov    edi,eax
  806329:	e8 31 15 00 00       	call   80785f <sys_read>
  80632e:	eb 01                	jmp    806331 <load_pe+0x2b6>
            continue;
  806330:	90                   	nop
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  806331:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  806335:	48 83 45 f0 28       	add    QWORD PTR [rbp-0x10],0x28
  80633a:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806341:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  806345:	0f b7 c0             	movzx  eax,ax
  806348:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80634b:	7c 82                	jl     8062cf <load_pe+0x254>

    }

    //通过导入表加载需要的dll
    PIMAGE_DATA_DIRECTORY impd=&nth->OptionalHeader.DataDirectory[1];
  80634d:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806354:	48 05 90 00 00 00    	add    rax,0x90
  80635a:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    if(impd->Size>0)
  806361:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  806368:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80636b:	85 c0                	test   eax,eax
  80636d:	0f 84 7b 02 00 00    	je     8065ee <load_pe+0x573>
    {
        int tmpi=impd->VirtualAddress+nbase;
  806373:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80637a:	8b 10                	mov    edx,DWORD PTR [rax]
  80637c:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806380:	01 d0                	add    eax,edx
  806382:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
        PIMAGE_IMPORT_DESCRIPTOR impdes=tmpi;
  806388:	8b 85 44 ff ff ff    	mov    eax,DWORD PTR [rbp-0xbc]
  80638e:	48 98                	cdqe   
  806390:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        int dllp;
        while (impdes->Characteristics)
  806394:	e9 47 02 00 00       	jmp    8065e0 <load_pe+0x565>
        {
            //加载dll
            char *dllname=impdes->Name+nbase;
  806399:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80639d:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  8063a0:	89 c2                	mov    edx,eax
  8063a2:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8063a6:	48 01 d0             	add    rax,rdx
  8063a9:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
            //此处应有加载dll代码
            int dlli;
            if(strcmp(dllname,"sys.dll")==0)//加载系统dll的部分由内核已经完成
  8063b0:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
  8063b7:	be 68 3f 81 00       	mov    esi,0x813f68
  8063bc:	48 89 c7             	mov    rdi,rax
  8063bf:	e8 8c 57 00 00       	call   80bb50 <strcmp>
  8063c4:	85 c0                	test   eax,eax
  8063c6:	75 09                	jne    8063d1 <load_pe+0x356>
            {
                dllp=0x1c00000;
  8063c8:	c7 45 dc 00 00 c0 01 	mov    DWORD PTR [rbp-0x24],0x1c00000
  8063cf:	eb 25                	jmp    8063f6 <load_pe+0x37b>
            }else{
                //load_pe要记录module的加载
                dlli= load_pe(proc);
  8063d1:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  8063d8:	48 89 c7             	mov    rdi,rax
  8063db:	e8 9b fc ff ff       	call   80607b <load_pe>
  8063e0:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
                //dlli=load_library(dllname);
                //这个是线性地址
                dllp=get_module_addr(dlli);
  8063e6:	8b 85 34 ff ff ff    	mov    eax,DWORD PTR [rbp-0xcc]
  8063ec:	89 c7                	mov    edi,eax
  8063ee:	e8 f1 03 00 00       	call   8067e4 <get_module_addr>
  8063f3:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            }
            //从线性地址查页表找到物理地址
            PIMAGE_DOS_HEADER dlldos=dllp;
  8063f6:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8063f9:	48 98                	cdqe   
  8063fb:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
            PIMAGE_NT_HEADERS32 dllnth=dllp+dlldos->e_lfanew;
  806402:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806405:	48 63 d0             	movsxd rdx,eax
  806408:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  80640f:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  806413:	48 01 d0             	add    rax,rdx
  806416:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
            PIMAGE_EXPORT_DIRECTORY dllexp=(dllnth->OptionalHeader.DataDirectory[0].VirtualAddress+dllp);
  80641d:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  806424:	8b 90 8c 00 00 00    	mov    edx,DWORD PTR [rax+0x8c]
  80642a:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80642d:	01 d0                	add    eax,edx
  80642f:	89 c0                	mov    eax,eax
  806431:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
            int funcn=dllexp->NumberOfNames;
  806438:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80643f:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  806442:	89 85 14 ff ff ff    	mov    DWORD PTR [rbp-0xec],eax
            char **fnames=dllexp->AddressOfNames+dllp;
  806448:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80644f:	8b 50 20             	mov    edx,DWORD PTR [rax+0x20]
  806452:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806455:	01 d0                	add    eax,edx
  806457:	89 c0                	mov    eax,eax
  806459:	48 89 85 08 ff ff ff 	mov    QWORD PTR [rbp-0xf8],rax
            int *funcaddrs=dllexp->AddressOfFunctions+dllp;
  806460:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  806467:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  80646a:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80646d:	01 d0                	add    eax,edx
  80646f:	89 c0                	mov    eax,eax
  806471:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
            short *funcords=dllexp->AddressOfNameOrdinals+dllp;
  806478:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80647f:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  806482:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806485:	01 d0                	add    eax,edx
  806487:	89 c0                	mov    eax,eax
  806489:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
            //寻找nameordinal的base（最小值），里面的数据加上base才是真正的序号
            unsigned int ord_base=dllexp->Base;
  806490:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  806497:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80649a:	89 85 f4 fe ff ff    	mov    DWORD PTR [rbp-0x10c],eax
            //开始将导入表IAT的内容更新为函数地址
            unsigned int *iataddrs=impdes->FirstThunk+nbase;//IAT和INT内容一样，只用IAT
  8064a0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8064a4:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8064a7:	89 c2                	mov    edx,eax
  8064a9:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8064ad:	48 01 d0             	add    rax,rdx
  8064b0:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            char **siataddrs=impdes->FirstThunk+nbase;
  8064b4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8064b8:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8064bb:	89 c2                	mov    edx,eax
  8064bd:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8064c1:	48 01 d0             	add    rax,rdx
  8064c4:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            while (*iataddrs)
  8064c8:	e9 00 01 00 00       	jmp    8065cd <load_pe+0x552>
            {
                //判断是序号导入还是名称导入
                if(((unsigned)*iataddrs)&0x80000000)
  8064cd:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8064d1:	8b 00                	mov    eax,DWORD PTR [rax]
  8064d3:	85 c0                	test   eax,eax
  8064d5:	79 43                	jns    80651a <load_pe+0x49f>
                {
                    //序号导入
                    unsigned int ord=((*iataddrs)&0x7fffffff)-ord_base;
  8064d7:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8064db:	8b 00                	mov    eax,DWORD PTR [rax]
  8064dd:	25 ff ff ff 7f       	and    eax,0x7fffffff
  8064e2:	2b 85 f4 fe ff ff    	sub    eax,DWORD PTR [rbp-0x10c]
  8064e8:	89 85 e0 fe ff ff    	mov    DWORD PTR [rbp-0x120],eax
                    *iataddrs=funcaddrs[ord]+dllp;
  8064ee:	8b 85 e0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x120]
  8064f4:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8064fb:	00 
  8064fc:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  806503:	48 01 d0             	add    rax,rdx
  806506:	8b 10                	mov    edx,DWORD PTR [rax]
  806508:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80650b:	01 d0                	add    eax,edx
  80650d:	89 c2                	mov    edx,eax
  80650f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806513:	89 10                	mov    DWORD PTR [rax],edx
  806515:	e9 a9 00 00 00       	jmp    8065c3 <load_pe+0x548>
                }else
                {
                    //名称导入
                    char *import_by_name_p=*iataddrs;//指向IMPORT_BY_NAME
  80651a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80651e:	8b 00                	mov    eax,DWORD PTR [rax]
  806520:	89 c0                	mov    eax,eax
  806522:	48 89 85 e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],rax
                    import_by_name_p+=2;//跳过开头两字节序号
  806529:	48 83 85 e8 fe ff ff 	add    QWORD PTR [rbp-0x118],0x2
  806530:	02 
                    int i=0;
  806531:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
                    for(;i<funcn;i++)
  806538:	eb 7a                	jmp    8065b4 <load_pe+0x539>
                    {
                        if(strcmp(import_by_name_p,fnames[i])==0)
  80653a:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80653d:	48 98                	cdqe   
  80653f:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806546:	00 
  806547:	48 8b 85 08 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf8]
  80654e:	48 01 d0             	add    rax,rdx
  806551:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  806554:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
  80655b:	48 89 d6             	mov    rsi,rdx
  80655e:	48 89 c7             	mov    rdi,rax
  806561:	e8 ea 55 00 00       	call   80bb50 <strcmp>
  806566:	85 c0                	test   eax,eax
  806568:	75 46                	jne    8065b0 <load_pe+0x535>
                        {
                            int ordi=funcords[i];
  80656a:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80656d:	48 98                	cdqe   
  80656f:	48 8d 14 00          	lea    rdx,[rax+rax*1]
  806573:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80657a:	48 01 d0             	add    rax,rdx
  80657d:	0f b7 00             	movzx  eax,WORD PTR [rax]
  806580:	98                   	cwde   
  806581:	89 85 e4 fe ff ff    	mov    DWORD PTR [rbp-0x11c],eax
                            *iataddrs=funcaddrs[ordi]+dllp;//导入表中的IAT内容修改成地址
  806587:	8b 85 e4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x11c]
  80658d:	48 98                	cdqe   
  80658f:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  806596:	00 
  806597:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  80659e:	48 01 d0             	add    rax,rdx
  8065a1:	8b 10                	mov    edx,DWORD PTR [rax]
  8065a3:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8065a6:	01 d0                	add    eax,edx
  8065a8:	89 c2                	mov    edx,eax
  8065aa:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8065ae:	89 10                	mov    DWORD PTR [rax],edx
                    for(;i<funcn;i++)
  8065b0:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
  8065b4:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8065b7:	3b 85 14 ff ff ff    	cmp    eax,DWORD PTR [rbp-0xec]
  8065bd:	0f 8c 77 ff ff ff    	jl     80653a <load_pe+0x4bf>
                        }
                    }
                }
                iataddrs++;
  8065c3:	48 83 45 d0 04       	add    QWORD PTR [rbp-0x30],0x4
                siataddrs++;
  8065c8:	48 83 45 c8 08       	add    QWORD PTR [rbp-0x38],0x8
            while (*iataddrs)
  8065cd:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8065d1:	8b 00                	mov    eax,DWORD PTR [rax]
  8065d3:	85 c0                	test   eax,eax
  8065d5:	0f 85 f2 fe ff ff    	jne    8064cd <load_pe+0x452>
            }
            impdes++;
  8065db:	48 83 45 e0 14       	add    QWORD PTR [rbp-0x20],0x14
        while (impdes->Characteristics)
  8065e0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8065e4:	8b 00                	mov    eax,DWORD PTR [rax]
  8065e6:	85 c0                	test   eax,eax
  8065e8:	0f 85 ab fd ff ff    	jne    806399 <load_pe+0x31e>
        }
    }


    //开始重定位
    PIMAGE_BASE_RELOCATION relp=0;
  8065ee:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  8065f5:	00 
    if(nth->OptionalHeader.DataDirectory[5].Size>0)
  8065f6:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8065fd:	8b 80 b4 00 00 00    	mov    eax,DWORD PTR [rax+0xb4]
  806603:	85 c0                	test   eax,eax
  806605:	0f 84 ec 00 00 00    	je     8066f7 <load_pe+0x67c>
    {
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  80660b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806612:	8b 90 b0 00 00 00    	mov    edx,DWORD PTR [rax+0xb0]
                                +(u32)nbase);
  806618:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  80661c:	01 d0                	add    eax,edx
  80661e:	89 c0                	mov    eax,eax
  806620:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        u16 *reloc=relp+sizeof(IMAGE_BASE_RELOCATION);
  806624:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806628:	48 83 c0 40          	add    rax,0x40
  80662c:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        u16 *rtype=reloc+1;
  806630:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  806634:	48 83 c0 02          	add    rax,0x2
  806638:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
        int old_base=nth->OptionalHeader.ImageBase;
  80663c:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806643:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806647:	89 85 dc fe ff ff    	mov    DWORD PTR [rbp-0x124],eax
        while(relp->VirtualAddress){
  80664d:	e9 97 00 00 00       	jmp    8066e9 <load_pe+0x66e>
            int pgva=relp->VirtualAddress+nbase;
  806652:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806656:	8b 10                	mov    edx,DWORD PTR [rax]
  806658:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80665c:	01 d0                	add    eax,edx
  80665e:	89 85 d8 fe ff ff    	mov    DWORD PTR [rbp-0x128],eax
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  806664:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
  80666b:	eb 5a                	jmp    8066c7 <load_pe+0x64c>
            {
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  80666d:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  806671:	0f b7 00             	movzx  eax,WORD PTR [rax]
  806674:	66 85 c0             	test   ax,ax
  806677:	74 49                	je     8066c2 <load_pe+0x647>
                int *at=*reloc+pgva;//要重定位的数据的地址
  806679:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80667d:	0f b7 00             	movzx  eax,WORD PTR [rax]
  806680:	0f b7 d0             	movzx  edx,ax
  806683:	8b 85 d8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x128]
  806689:	01 d0                	add    eax,edx
  80668b:	48 98                	cdqe   
  80668d:	48 89 85 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],rax
                *at=*at-old_base+nbase;
  806694:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
  80669b:	8b 00                	mov    eax,DWORD PTR [rax]
  80669d:	2b 85 dc fe ff ff    	sub    eax,DWORD PTR [rbp-0x124]
  8066a3:	89 c2                	mov    edx,eax
  8066a5:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8066a9:	01 d0                	add    eax,edx
  8066ab:	89 c2                	mov    edx,eax
  8066ad:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
  8066b4:	89 10                	mov    DWORD PTR [rax],edx
                //下一个
                reloc+=2;
  8066b6:	48 83 45 b0 04       	add    QWORD PTR [rbp-0x50],0x4
                rtype+=2;
  8066bb:	48 83 45 a8 04       	add    QWORD PTR [rbp-0x58],0x4
  8066c0:	eb 01                	jmp    8066c3 <load_pe+0x648>
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  8066c2:	90                   	nop
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  8066c3:	83 45 a4 01          	add    DWORD PTR [rbp-0x5c],0x1
  8066c7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8066cb:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8066ce:	c1 e8 02             	shr    eax,0x2
  8066d1:	89 c2                	mov    edx,eax
  8066d3:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  8066d6:	39 c2                	cmp    edx,eax
  8066d8:	77 93                	ja     80666d <load_pe+0x5f2>
            }
            relp=(int)relp+0x1000;
  8066da:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8066de:	05 00 10 00 00       	add    eax,0x1000
  8066e3:	48 98                	cdqe   
  8066e5:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        while(relp->VirtualAddress){
  8066e9:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8066ed:	8b 00                	mov    eax,DWORD PTR [rax]
  8066ef:	85 c0                	test   eax,eax
  8066f1:	0f 85 5b ff ff ff    	jne    806652 <load_pe+0x5d7>
        }
    }
    extern struct process task[];
    extern int cur_proc;
    //初始化堆
    chunk_header hdrtmp={
  8066f7:	c7 85 50 fd ff ff 00 	mov    DWORD PTR [rbp-0x2b0],0x0
  8066fe:	00 00 00 
  806701:	c7 85 54 fd ff ff 00 	mov    DWORD PTR [rbp-0x2ac],0x0
  806708:	00 00 00 
  80670b:	48 c7 85 58 fd ff ff 	mov    QWORD PTR [rbp-0x2a8],0x0
  806712:	00 00 00 00 
  806716:	48 c7 85 60 fd ff ff 	mov    QWORD PTR [rbp-0x2a0],0x0
  80671d:	00 00 00 00 
            .next=NULL,
            .pgn=0,
            .prev=NULL
    };//空堆
    //拷贝触发页中断然后分配
    memcpy((chunk_header*)HEAP_BASE,&hdrtmp,sizeof(hdrtmp));
  806721:	48 8d 85 50 fd ff ff 	lea    rax,[rbp-0x2b0]
  806728:	ba 18 00 00 00       	mov    edx,0x18
  80672d:	48 89 c6             	mov    rsi,rax
  806730:	bf 00 00 00 01       	mov    edi,0x1000000
  806735:	e8 78 51 00 00       	call   80b8b2 <memcpy>
    task[cur_proc].mem_struct.heap_base=HEAP_BASE;
  80673a:	8b 05 ec ee c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0eeec]        # 41562c <cur_proc>
  806740:	48 98                	cdqe   
  806742:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  806749:	48 05 c0 84 40 00    	add    rax,0x4084c0
  80674f:	c7 40 08 00 00 00 01 	mov    DWORD PTR [rax+0x8],0x1000000
    task[cur_proc].mem_struct.heap_top=HEAP_BASE+CHUNK_SIZE;
  806756:	8b 05 d0 ee c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0eed0]        # 41562c <cur_proc>
  80675c:	48 98                	cdqe   
  80675e:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  806765:	48 05 c0 84 40 00    	add    rax,0x4084c0
  80676b:	c7 40 0c 00 10 00 01 	mov    DWORD PTR [rax+0xc],0x1001000
    //设置栈
    task[cur_proc].mem_struct.stack_top=STACK_TOP;
  806772:	8b 05 b4 ee c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0eeb4]        # 41562c <cur_proc>
  806778:	48 98                	cdqe   
  80677a:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  806781:	48 05 c0 84 40 00    	add    rax,0x4084c0
  806787:	c7 40 14 00 f0 ff ff 	mov    DWORD PTR [rax+0x14],0xfffff000


    //完毕,调用入口函数
    //重定位完毕，准备调用DllMain
    typedef int (*Main)(int,void*);
    Main main=shell_addr;
  80678e:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  806795:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
    task[cur_proc].exit_code=main(0,NULL);
  80679c:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  8067a3:	be 00 00 00 00       	mov    esi,0x0
  8067a8:	bf 00 00 00 00       	mov    edi,0x0
  8067ad:	ff d0                	call   rax
  8067af:	8b 15 77 ee c0 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc0ee77]        # 41562c <cur_proc>
  8067b5:	89 c1                	mov    ecx,eax
  8067b7:	48 63 c2             	movsxd rax,edx
  8067ba:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8067c1:	48 05 c0 84 40 00    	add    rax,0x4084c0
  8067c7:	89 48 04             	mov    DWORD PTR [rax+0x4],ecx
    return task[cur_proc].exit_code;
  8067ca:	8b 05 5c ee c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ee5c]        # 41562c <cur_proc>
  8067d0:	48 98                	cdqe   
  8067d2:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8067d9:	48 05 c0 84 40 00    	add    rax,0x4084c0
  8067df:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
}
  8067e2:	c9                   	leave  
  8067e3:	c3                   	ret    

00000000008067e4 <get_module_addr>:

int get_module_addr(int mi)
{
  8067e4:	f3 0f 1e fa          	endbr64 
  8067e8:	55                   	push   rbp
  8067e9:	48 89 e5             	mov    rbp,rsp
  8067ec:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return modules[mi].base;
  8067ef:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8067f2:	48 98                	cdqe   
  8067f4:	8b 04 c5 40 82 42 00 	mov    eax,DWORD PTR [rax*8+0x428240]
}
  8067fb:	5d                   	pop    rbp
  8067fc:	c3                   	ret    

00000000008067fd <dispose_library>:
int dispose_library(int dlln)
{
  8067fd:	f3 0f 1e fa          	endbr64 
  806801:	55                   	push   rbp
  806802:	48 89 e5             	mov    rbp,rsp
  806805:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if(dlln<0||dlln>=MAX_DLLS)return -1;
  806808:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80680c:	78 09                	js     806817 <dispose_library+0x1a>
  80680e:	81 7d fc ff 00 00 00 	cmp    DWORD PTR [rbp-0x4],0xff
  806815:	7e 07                	jle    80681e <dispose_library+0x21>
  806817:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80681c:	eb 1d                	jmp    80683b <dispose_library+0x3e>
    //空间不够，释放之前申请的
    // for(int j=0;j<dlls[dlln].page_used;j++)
    //     dispose_page(get_phyaddr(dlls[dlln].page_num[j]));
    //释放dll
    dlls[dlln].flag=DLL_STAT_EMPTY;
  80681e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806821:	48 98                	cdqe   
  806823:	48 69 c0 2c 01 00 00 	imul   rax,rax,0x12c
  80682a:	48 05 48 56 41 00    	add    rax,0x415648
  806830:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return 0;
  806836:	b8 00 00 00 00       	mov    eax,0x0
}
  80683b:	5d                   	pop    rbp
  80683c:	c3                   	ret    

000000000080683d <sys_insmod>:

    return 0;
} */

int sys_insmod(char *path)
{
  80683d:	f3 0f 1e fa          	endbr64 
  806841:	55                   	push   rbp
  806842:	48 89 e5             	mov    rbp,rsp
  806845:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  806849:	90                   	nop
  80684a:	5d                   	pop    rbp
  80684b:	c3                   	ret    

000000000080684c <sys_rmmod>:
int sys_rmmod(char *name)
{
  80684c:	f3 0f 1e fa          	endbr64 
  806850:	55                   	push   rbp
  806851:	48 89 e5             	mov    rbp,rsp
  806854:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

  806858:	90                   	nop
  806859:	5d                   	pop    rbp
  80685a:	c3                   	ret    
  80685b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000806860 <_syscall>:
  806860:	55                   	push   rbp
  806861:	bd 00 80 10 00       	mov    ebp,0x108000
  806866:	48 89 65 14          	mov    QWORD PTR [rbp+0x14],rsp
  80686a:	48 8b 65 04          	mov    rsp,QWORD PTR [rbp+0x4]
  80686e:	50                   	push   rax
  80686f:	53                   	push   rbx
  806870:	51                   	push   rcx
  806871:	52                   	push   rdx
  806872:	57                   	push   rdi
  806873:	56                   	push   rsi
  806874:	41 50                	push   r8
  806876:	41 51                	push   r9
  806878:	41 52                	push   r10
  80687a:	41 53                	push   r11
  80687c:	41 54                	push   r12
  80687e:	41 55                	push   r13
  806880:	41 56                	push   r14
  806882:	41 57                	push   r15
  806884:	66 8c c0             	mov    ax,es
  806887:	50                   	push   rax
  806888:	66 8c d8             	mov    ax,ds
  80688b:	50                   	push   rax
  80688c:	66 b8 10 00          	mov    ax,0x10
  806890:	8e c0                	mov    es,eax
  806892:	8e d8                	mov    ds,eax
  806894:	48 8b 44 24 78       	mov    rax,QWORD PTR [rsp+0x78]
  806899:	41 53                	push   r11
  80689b:	51                   	push   rcx
  80689c:	49 87 ca             	xchg   r10,rcx
  80689f:	e8 f6 9c ff ff       	call   80059a <syscall>
  8068a4:	4c 87 d1             	xchg   rcx,r10
  8068a7:	59                   	pop    rcx
  8068a8:	41 5b                	pop    r11
  8068aa:	48 89 44 24 78       	mov    QWORD PTR [rsp+0x78],rax
  8068af:	58                   	pop    rax
  8068b0:	8e d8                	mov    ds,eax
  8068b2:	58                   	pop    rax
  8068b3:	8e c0                	mov    es,eax
  8068b5:	41 5f                	pop    r15
  8068b7:	41 5e                	pop    r14
  8068b9:	41 5d                	pop    r13
  8068bb:	41 5c                	pop    r12
  8068bd:	41 5b                	pop    r11
  8068bf:	41 5a                	pop    r10
  8068c1:	41 59                	pop    r9
  8068c3:	41 58                	pop    r8
  8068c5:	5e                   	pop    rsi
  8068c6:	5f                   	pop    rdi
  8068c7:	5a                   	pop    rdx
  8068c8:	59                   	pop    rcx
  8068c9:	5b                   	pop    rbx
  8068ca:	58                   	pop    rax
  8068cb:	48 89 65 04          	mov    QWORD PTR [rbp+0x4],rsp
  8068cf:	48 8b 65 14          	mov    rsp,QWORD PTR [rbp+0x14]
  8068d3:	5d                   	pop    rbp
  8068d4:	fb                   	sti    
  8068d5:	48 0f 07             	sysretq 

00000000008068d8 <init_framebuffer>:
static u32 font_width_bytes;
static u8 *glyph_table;
static u32 bytes_per_glyph, glyph_nr;
int font_size=1;
void init_framebuffer()
{
  8068d8:	f3 0f 1e fa          	endbr64 
  8068dc:	55                   	push   rbp
  8068dd:	48 89 e5             	mov    rbp,rsp
  8068e0:	48 83 ec 50          	sub    rsp,0x50
    //映射页帧内存
    size_t w=framebuffer.common.framebuffer_width;
  8068e4:	8b 05 6a 1d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21d6a]        # 428654 <framebuffer+0x14>
  8068ea:	89 c0                	mov    eax,eax
  8068ec:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    size_t h=framebuffer.common.framebuffer_height;
  8068f0:	8b 05 62 1d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21d62]        # 428658 <framebuffer+0x18>
  8068f6:	89 c0                	mov    eax,eax
  8068f8:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    size_t bypp=framebuffer.common.framebuffer_bpp/8;
  8068fc:	0f b6 05 59 1d c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21d59]        # 42865c <framebuffer+0x1c>
  806903:	c0 e8 03             	shr    al,0x3
  806906:	0f b6 c0             	movzx  eax,al
  806909:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    size_t inter=framebuffer.common.framebuffer_pitch;
  80690d:	8b 05 3d 1d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21d3d]        # 428650 <framebuffer+0x10>
  806913:	89 c0                	mov    eax,eax
  806915:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    size_t pc=w*h;
  806919:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80691d:	48 0f af 45 d8       	imul   rax,QWORD PTR [rbp-0x28]
  806922:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    size_t size=h*inter;
  806926:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80692a:	48 0f af 45 c8       	imul   rax,QWORD PTR [rbp-0x38]
  80692f:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    int pgc=size/PAGE_SIZE;
  806933:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806937:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  80693e:	48 85 c0             	test   rax,rax
  806941:	48 0f 48 c2          	cmovs  rax,rdx
  806945:	48 c1 f8 0c          	sar    rax,0xc
  806949:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    addr_t p=FRAMEBUFFER_ADDR;
  80694c:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x40000000
  806953:	40 
    addr_t pp=framebuffer.common.framebuffer_addr;
  806954:	48 8b 05 ed 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21ced]        # 428648 <framebuffer+0x8>
  80695b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for (size_t i = 0; i < pgc; i++)
  80695f:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  806966:	00 
  806967:	eb 2d                	jmp    806996 <init_framebuffer+0xbe>
    {
        mmap(pp,p,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  806969:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  80696d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806971:	ba 07 00 00 00       	mov    edx,0x7
  806976:	48 89 ce             	mov    rsi,rcx
  806979:	48 89 c7             	mov    rdi,rax
  80697c:	e8 73 a5 ff ff       	call   800ef4 <mmap>
        pp+=PAGE_SIZE;
  806981:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  806988:	00 
        p+=PAGE_SIZE;
  806989:	48 81 45 f8 00 10 00 	add    QWORD PTR [rbp-0x8],0x1000
  806990:	00 
    for (size_t i = 0; i < pgc; i++)
  806991:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  806996:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  806999:	48 98                	cdqe   
  80699b:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  80699f:	7c c8                	jl     806969 <init_framebuffer+0x91>
    }
    
    
}
  8069a1:	90                   	nop
  8069a2:	90                   	nop
  8069a3:	c9                   	leave  
  8069a4:	c3                   	ret    

00000000008069a5 <init_font>:
void init_font(){
  8069a5:	f3 0f 1e fa          	endbr64 
  8069a9:	55                   	push   rbp
  8069aa:	48 89 e5             	mov    rbp,rsp
    boot_font = (struct psf2_header*) _binary_res_font_psf_start;
  8069ad:	48 c7 05 c8 1c c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21cc8],0x80c628        # 428680 <boot_font>
  8069b4:	28 c6 80 00 

    font_width_bytes = (boot_font->width + 7) / 8;
  8069b8:	48 8b 05 c1 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21cc1]        # 428680 <boot_font>
  8069bf:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  8069c2:	83 c0 07             	add    eax,0x7
  8069c5:	c1 e8 03             	shr    eax,0x3
  8069c8:	89 05 c2 1c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21cc2],eax        # 428690 <font_width_bytes>
    font_width = font_width_bytes * 8;
  8069ce:	8b 05 bc 1c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21cbc]        # 428690 <font_width_bytes>
  8069d4:	c1 e0 03             	shl    eax,0x3
  8069d7:	89 05 ab 1c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21cab],eax        # 428688 <font_width>
    font_height = boot_font->height;
  8069dd:	48 8b 05 9c 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21c9c]        # 428680 <boot_font>
  8069e4:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  8069e7:	89 05 9f 1c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21c9f],eax        # 42868c <font_height>

    glyph_table = (u8*)_binary_res_font_psf_start+boot_font->header_size;
  8069ed:	48 8b 05 8c 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21c8c]        # 428680 <boot_font>
  8069f4:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8069f7:	89 c0                	mov    eax,eax
  8069f9:	48 05 28 c6 80 00    	add    rax,0x80c628
  8069ff:	48 89 05 92 1c c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21c92],rax        # 428698 <glyph_table>
    glyph_nr = boot_font->glyph_nr;
  806a06:	48 8b 05 73 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21c73]        # 428680 <boot_font>
  806a0d:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  806a10:	89 05 8e 1c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21c8e],eax        # 4286a4 <glyph_nr>
    bytes_per_glyph = boot_font->bytes_per_glyph;
  806a16:	48 8b 05 63 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21c63]        # 428680 <boot_font>
  806a1d:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  806a20:	89 05 7a 1c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21c7a],eax        # 4286a0 <bytes_per_glyph>

    fb_cursor_x = fb_cursor_y = 0;
  806a26:	c7 05 40 1c c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc21c40],0x0        # 428670 <fb_cursor_y>
  806a2d:	00 00 00 
  806a30:	8b 05 3a 1c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21c3a]        # 428670 <fb_cursor_y>
  806a36:	89 05 30 1c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21c30],eax        # 42866c <fb_cursor_x>
    max_ch_nr_x = framebuffer.common.framebuffer_width / font_width;
  806a3c:	8b 05 12 1c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21c12]        # 428654 <framebuffer+0x14>
  806a42:	8b 0d 40 1c c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc21c40]        # 428688 <font_width>
  806a48:	ba 00 00 00 00       	mov    edx,0x0
  806a4d:	f7 f1                	div    ecx
  806a4f:	89 05 1f 1c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21c1f],eax        # 428674 <max_ch_nr_x>
    max_ch_nr_y = framebuffer.common.framebuffer_height / font_height;
  806a55:	8b 05 fd 1b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21bfd]        # 428658 <framebuffer+0x18>
  806a5b:	8b 35 2b 1c c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc21c2b]        # 42868c <font_height>
  806a61:	ba 00 00 00 00       	mov    edx,0x0
  806a66:	f7 f6                	div    esi
  806a68:	89 05 0a 1c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21c0a],eax        # 428678 <max_ch_nr_y>
    font_size=1;
  806a6e:	c7 05 88 58 00 00 01 	mov    DWORD PTR [rip+0x5888],0x1        # 80c300 <font_size>
  806a75:	00 00 00 
}
  806a78:	90                   	nop
  806a79:	5d                   	pop    rbp
  806a7a:	c3                   	ret    

0000000000806a7b <set_framebuffer>:
void set_framebuffer(struct multiboot_tag_framebuffer tag)
{
  806a7b:	f3 0f 1e fa          	endbr64 
  806a7f:	55                   	push   rbp
  806a80:	48 89 e5             	mov    rbp,rsp
    framebuffer=tag;
  806a83:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  806a87:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  806a8b:	48 89 05 ae 1b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21bae],rax        # 428640 <framebuffer>
  806a92:	48 89 15 af 1b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21baf],rdx        # 428648 <framebuffer+0x8>
  806a99:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
  806a9d:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  806aa1:	48 89 05 a8 1b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21ba8],rax        # 428650 <framebuffer+0x10>
  806aa8:	48 89 15 a9 1b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21ba9],rdx        # 428658 <framebuffer+0x18>
  806aaf:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
  806ab3:	48 89 05 a6 1b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21ba6],rax        # 428660 <framebuffer+0x20>
}
  806aba:	90                   	nop
  806abb:	5d                   	pop    rbp
  806abc:	c3                   	ret    

0000000000806abd <fill_rect>:

void fill_rect(int x,int y,int w,int h,unsigned int color){
  806abd:	f3 0f 1e fa          	endbr64 
  806ac1:	55                   	push   rbp
  806ac2:	48 89 e5             	mov    rbp,rsp
  806ac5:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  806ac8:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  806acb:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  806ace:	89 4d d0             	mov    DWORD PTR [rbp-0x30],ecx
  806ad1:	44 89 45 cc          	mov    DWORD PTR [rbp-0x34],r8d
    unsigned int* fb= (unsigned int*) FRAMEBUFFER_ADDR;
  806ad5:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x40000000
  806adc:	40 
    //目前只写32bpp
    for(int py=x;py<h+x;py++){
  806add:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806ae0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  806ae3:	eb 64                	jmp    806b49 <fill_rect+0x8c>
        for(int px=y;px<w+y;px++){
  806ae5:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  806ae8:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  806aeb:	eb 4b                	jmp    806b38 <fill_rect+0x7b>
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  806aed:	8b 15 5d 1b c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21b5d]        # 428650 <framebuffer+0x10>
  806af3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806af6:	0f af c2             	imul   eax,edx
  806af9:	89 c1                	mov    ecx,eax
                       +px*framebuffer.common.framebuffer_bpp/8;
  806afb:	0f b6 05 5a 1b c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21b5a]        # 42865c <framebuffer+0x1c>
  806b02:	0f b6 c0             	movzx  eax,al
  806b05:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  806b09:	8d 50 07             	lea    edx,[rax+0x7]
  806b0c:	85 c0                	test   eax,eax
  806b0e:	0f 48 c2             	cmovs  eax,edx
  806b11:	c1 f8 03             	sar    eax,0x3
  806b14:	48 98                	cdqe   
  806b16:	48 01 c8             	add    rax,rcx
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  806b19:	48 05 00 00 00 40    	add    rax,0x40000000
  806b1f:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
            fb=(unsigned int*)ptr;
  806b23:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806b27:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *fb=color;
  806b2b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806b2f:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  806b32:	89 10                	mov    DWORD PTR [rax],edx
        for(int px=y;px<w+y;px++){
  806b34:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806b38:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  806b3b:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  806b3e:	01 d0                	add    eax,edx
  806b40:	39 45 f8             	cmp    DWORD PTR [rbp-0x8],eax
  806b43:	7c a8                	jl     806aed <fill_rect+0x30>
    for(int py=x;py<h+x;py++){
  806b45:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806b49:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
  806b4c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806b4f:	01 d0                	add    eax,edx
  806b51:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  806b54:	7c 8f                	jl     806ae5 <fill_rect+0x28>
        }
    }
}
  806b56:	90                   	nop
  806b57:	90                   	nop
  806b58:	5d                   	pop    rbp
  806b59:	c3                   	ret    

0000000000806b5a <draw_text>:
unsigned char letters[];
void draw_text(int x, int y, int size, char *str)
{
  806b5a:	f3 0f 1e fa          	endbr64 
  806b5e:	55                   	push   rbp
  806b5f:	48 89 e5             	mov    rbp,rsp
  806b62:	48 83 ec 30          	sub    rsp,0x30
  806b66:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806b69:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806b6c:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  806b6f:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    int tx=x;
  806b73:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806b76:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    while(*str!='\0')
  806b79:	eb 5a                	jmp    806bd5 <draw_text+0x7b>
    {
        if(*str=='\n')
  806b7b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806b7f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806b82:	3c 0a                	cmp    al,0xa
  806b84:	75 1c                	jne    806ba2 <draw_text+0x48>
        {
            y+=font_height*size;
  806b86:	8b 15 00 1b c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21b00]        # 42868c <font_height>
  806b8c:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806b8f:	0f af d0             	imul   edx,eax
  806b92:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806b95:	01 d0                	add    eax,edx
  806b97:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            tx=x;
  806b9a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806b9d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  806ba0:	eb 2e                	jmp    806bd0 <draw_text+0x76>
        }
        else
        {
            draw_letter(tx,y,size,*str);
  806ba2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806ba6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806ba9:	0f be c8             	movsx  ecx,al
  806bac:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  806baf:	8b 75 e8             	mov    esi,DWORD PTR [rbp-0x18]
  806bb2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806bb5:	89 c7                	mov    edi,eax
  806bb7:	e8 28 00 00 00       	call   806be4 <draw_letter>
            tx+=size*font_width;
  806bbc:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  806bbf:	8b 05 c3 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21ac3]        # 428688 <font_width>
  806bc5:	0f af d0             	imul   edx,eax
  806bc8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806bcb:	01 d0                	add    eax,edx
  806bcd:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        }
        str++;
  806bd0:	48 83 45 d8 01       	add    QWORD PTR [rbp-0x28],0x1
    while(*str!='\0')
  806bd5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806bd9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806bdc:	84 c0                	test   al,al
  806bde:	75 9b                	jne    806b7b <draw_text+0x21>
    }
}
  806be0:	90                   	nop
  806be1:	90                   	nop
  806be2:	c9                   	leave  
  806be3:	c3                   	ret    

0000000000806be4 <draw_letter>:
void draw_letter(int x, volatile int y, int size, char c) {
  806be4:	f3 0f 1e fa          	endbr64 
  806be8:	55                   	push   rbp
  806be9:	48 89 e5             	mov    rbp,rsp
  806bec:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
  806bef:	89 75 c8             	mov    DWORD PTR [rbp-0x38],esi
  806bf2:	89 55 c4             	mov    DWORD PTR [rbp-0x3c],edx
  806bf5:	89 c8                	mov    eax,ecx
  806bf7:	88 45 c0             	mov    BYTE PTR [rbp-0x40],al
    u8 *glyph = glyph_table;
  806bfa:	48 8b 05 97 1a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21a97]        # 428698 <glyph_table>
  806c01:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if (c < glyph_nr) {
  806c05:	0f be 55 c0          	movsx  edx,BYTE PTR [rbp-0x40]
  806c09:	8b 05 95 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21a95]        # 4286a4 <glyph_nr>
  806c0f:	39 c2                	cmp    edx,eax
  806c11:	73 13                	jae    806c26 <draw_letter+0x42>
        glyph += c * bytes_per_glyph;
  806c13:	0f be 55 c0          	movsx  edx,BYTE PTR [rbp-0x40]
  806c17:	8b 05 83 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21a83]        # 4286a0 <bytes_per_glyph>
  806c1d:	0f af c2             	imul   eax,edx
  806c20:	89 c0                	mov    eax,eax
  806c22:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    }
    /* output the font to frame buffer */
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  806c26:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  806c2d:	e9 cb 00 00 00       	jmp    806cfd <draw_letter+0x119>
        u8 mask = 1 << 7;
  806c32:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80

        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  806c36:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  806c3d:	e9 9c 00 00 00       	jmp    806cde <draw_letter+0xfa>
            int px=x+ch_x*size;
  806c42:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  806c45:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  806c49:	89 c2                	mov    edx,eax
  806c4b:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  806c4e:	01 d0                	add    eax,edx
  806c50:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            int py=y+ch_y*size;
  806c53:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  806c56:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  806c5a:	89 c2                	mov    edx,eax
  806c5c:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  806c5f:	01 d0                	add    eax,edx
  806c61:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
            int* ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  806c64:	8b 15 e6 19 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc219e6]        # 428650 <framebuffer+0x10>
  806c6a:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806c6d:	0f af c2             	imul   eax,edx
  806c70:	89 c1                	mov    ecx,eax
                     +px*framebuffer.common.framebuffer_bpp/8;
  806c72:	0f b6 05 e3 19 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc219e3]        # 42865c <framebuffer+0x1c>
  806c79:	0f b6 c0             	movzx  eax,al
  806c7c:	0f af 45 e8          	imul   eax,DWORD PTR [rbp-0x18]
  806c80:	8d 50 07             	lea    edx,[rax+0x7]
  806c83:	85 c0                	test   eax,eax
  806c85:	0f 48 c2             	cmovs  eax,edx
  806c88:	c1 f8 03             	sar    eax,0x3
  806c8b:	48 98                	cdqe   
  806c8d:	48 01 c8             	add    rax,rcx
  806c90:	48 05 00 00 00 40    	add    rax,0x40000000
            int* ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  806c96:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            if ((*(glyph + ch_x / 8) & mask) != 0) {
  806c9a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806c9d:	c1 e8 03             	shr    eax,0x3
  806ca0:	89 c2                	mov    edx,eax
  806ca2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806ca6:	48 01 d0             	add    rax,rdx
  806ca9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806cac:	22 45 f3             	and    al,BYTE PTR [rbp-0xd]
  806caf:	84 c0                	test   al,al
  806cb1:	74 0c                	je     806cbf <draw_letter+0xdb>
                *ptr=-1;
  806cb3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806cb7:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
  806cbd:	eb 0a                	jmp    806cc9 <draw_letter+0xe5>
            } else {
                *ptr=0;
  806cbf:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806cc3:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            }

            mask >>= 1;
  806cc9:	d0 6d f3             	shr    BYTE PTR [rbp-0xd],1
            if (ch_x % 8 == 0) {
  806ccc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806ccf:	83 e0 07             	and    eax,0x7
  806cd2:	85 c0                	test   eax,eax
  806cd4:	75 04                	jne    806cda <draw_letter+0xf6>
                mask = 1 << 7;
  806cd6:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80
        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  806cda:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  806cde:	8b 05 a4 19 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc219a4]        # 428688 <font_width>
  806ce4:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  806ce7:	0f 82 55 ff ff ff    	jb     806c42 <draw_letter+0x5e>
            }
        }

        glyph += font_width_bytes;
  806ced:	8b 05 9d 19 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2199d]        # 428690 <font_width_bytes>
  806cf3:	89 c0                	mov    eax,eax
  806cf5:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  806cf9:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  806cfd:	8b 05 89 19 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21989]        # 42868c <font_height>
  806d03:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  806d06:	0f 82 26 ff ff ff    	jb     806c32 <draw_letter+0x4e>
    }
}
  806d0c:	90                   	nop
  806d0d:	90                   	nop
  806d0e:	5d                   	pop    rbp
  806d0f:	c3                   	ret    

0000000000806d10 <scr_up>:
//向上滚动一个像素
void scr_up(){
  806d10:	f3 0f 1e fa          	endbr64 
  806d14:	55                   	push   rbp
  806d15:	48 89 e5             	mov    rbp,rsp
    for(int dy=0;dy<framebuffer.common.framebuffer_height-1;dy++){
  806d18:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  806d1f:	eb 71                	jmp    806d92 <scr_up+0x82>
        for(int dx=0;dx<framebuffer.common.framebuffer_width;dx++){
  806d21:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  806d28:	eb 57                	jmp    806d81 <scr_up+0x71>
            char *p=(char*)(FRAMEBUFFER_ADDR+
                    dy*framebuffer.common.framebuffer_pitch
  806d2a:	8b 15 20 19 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21920]        # 428650 <framebuffer+0x10>
  806d30:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806d33:	0f af c2             	imul   eax,edx
  806d36:	89 c1                	mov    ecx,eax
                    +dx*framebuffer.common.framebuffer_bpp/8);
  806d38:	0f b6 05 1d 19 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2191d]        # 42865c <framebuffer+0x1c>
  806d3f:	0f b6 c0             	movzx  eax,al
  806d42:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  806d46:	8d 50 07             	lea    edx,[rax+0x7]
  806d49:	85 c0                	test   eax,eax
  806d4b:	0f 48 c2             	cmovs  eax,edx
  806d4e:	c1 f8 03             	sar    eax,0x3
  806d51:	48 98                	cdqe   
  806d53:	48 01 c8             	add    rax,rcx
  806d56:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+
  806d5c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p+framebuffer.common.framebuffer_pitch);
  806d60:	8b 05 ea 18 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc218ea]        # 428650 <framebuffer+0x10>
  806d66:	89 c2                	mov    edx,eax
  806d68:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806d6c:	48 01 d0             	add    rax,rdx
  806d6f:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  806d72:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806d76:	88 10                	mov    BYTE PTR [rax],dl
            p++;
  806d78:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        for(int dx=0;dx<framebuffer.common.framebuffer_width;dx++){
  806d7d:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806d81:	8b 15 cd 18 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc218cd]        # 428654 <framebuffer+0x14>
  806d87:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806d8a:	39 c2                	cmp    edx,eax
  806d8c:	77 9c                	ja     806d2a <scr_up+0x1a>
    for(int dy=0;dy<framebuffer.common.framebuffer_height-1;dy++){
  806d8e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806d92:	8b 05 c0 18 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc218c0]        # 428658 <framebuffer+0x18>
  806d98:	8d 50 ff             	lea    edx,[rax-0x1]
  806d9b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806d9e:	39 c2                	cmp    edx,eax
  806da0:	0f 87 7b ff ff ff    	ja     806d21 <scr_up+0x11>
        }

    }
//    for(int i=0;i< framebuffer.common.framebuffer_width*framebuffer.common.framebuffer_bpp/8;i++)
//        *(p++)=0;
}
  806da6:	90                   	nop
  806da7:	90                   	nop
  806da8:	5d                   	pop    rbp
  806da9:	c3                   	ret    

0000000000806daa <scr_down>:
void scr_down(){
  806daa:	f3 0f 1e fa          	endbr64 
  806dae:	55                   	push   rbp
  806daf:	48 89 e5             	mov    rbp,rsp
    for(int dy=1;dy<max_ch_nr_y;dy++){
  806db2:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
  806db9:	eb 72                	jmp    806e2d <scr_down+0x83>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  806dbb:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  806dc2:	eb 58                	jmp    806e1c <scr_down+0x72>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  806dc4:	8b 15 86 18 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21886]        # 428650 <framebuffer+0x10>
  806dca:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806dcd:	0f af c2             	imul   eax,edx
  806dd0:	89 c1                	mov    ecx,eax
                            +dx*framebuffer.common.framebuffer_bpp/8);
  806dd2:	0f b6 05 83 18 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21883]        # 42865c <framebuffer+0x1c>
  806dd9:	0f b6 c0             	movzx  eax,al
  806ddc:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  806de0:	8d 50 07             	lea    edx,[rax+0x7]
  806de3:	85 c0                	test   eax,eax
  806de5:	0f 48 c2             	cmovs  eax,edx
  806de8:	c1 f8 03             	sar    eax,0x3
  806deb:	48 98                	cdqe   
  806ded:	48 01 c8             	add    rax,rcx
  806df0:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  806df6:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p-framebuffer.common.framebuffer_pitch);
  806dfa:	8b 05 50 18 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21850]        # 428650 <framebuffer+0x10>
  806e00:	89 c0                	mov    eax,eax
  806e02:	48 f7 d8             	neg    rax
  806e05:	48 89 c2             	mov    rdx,rax
  806e08:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806e0c:	48 01 d0             	add    rax,rdx
  806e0f:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  806e12:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806e16:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  806e18:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806e1c:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  806e1f:	8b 05 4f 18 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2184f]        # 428674 <max_ch_nr_x>
  806e25:	39 c2                	cmp    edx,eax
  806e27:	72 9b                	jb     806dc4 <scr_down+0x1a>
    for(int dy=1;dy<max_ch_nr_y;dy++){
  806e29:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806e2d:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  806e30:	8b 05 42 18 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21842]        # 428678 <max_ch_nr_y>
  806e36:	39 c2                	cmp    edx,eax
  806e38:	72 81                	jb     806dbb <scr_down+0x11>
        }

    }
}
  806e3a:	90                   	nop
  806e3b:	90                   	nop
  806e3c:	5d                   	pop    rbp
  806e3d:	c3                   	ret    

0000000000806e3e <print>:
void print(char* s){
  806e3e:	f3 0f 1e fa          	endbr64 
  806e42:	55                   	push   rbp
  806e43:	48 89 e5             	mov    rbp,rsp
  806e46:	48 83 ec 08          	sub    rsp,0x8
  806e4a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    for(;*s;s++){
  806e4e:	e9 c4 00 00 00       	jmp    806f17 <print+0xd9>
        if(fb_cursor_x>max_ch_nr_x||*s=='\n')
  806e53:	8b 15 13 18 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21813]        # 42866c <fb_cursor_x>
  806e59:	8b 05 15 18 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21815]        # 428674 <max_ch_nr_x>
  806e5f:	39 c2                	cmp    edx,eax
  806e61:	77 0b                	ja     806e6e <print+0x30>
  806e63:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806e67:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806e6a:	3c 0a                	cmp    al,0xa
  806e6c:	75 19                	jne    806e87 <print+0x49>
        {
            fb_cursor_y+=1;
  806e6e:	8b 05 fc 17 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc217fc]        # 428670 <fb_cursor_y>
  806e74:	83 c0 01             	add    eax,0x1
  806e77:	89 05 f3 17 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc217f3],eax        # 428670 <fb_cursor_y>
            fb_cursor_x=0;
  806e7d:	c7 05 e5 17 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc217e5],0x0        # 42866c <fb_cursor_x>
  806e84:	00 00 00 
        }
        if(*s=='\n')continue;
  806e87:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806e8b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806e8e:	3c 0a                	cmp    al,0xa
  806e90:	74 7f                	je     806f11 <print+0xd3>
        if(fb_cursor_y>=max_ch_nr_y-1){
  806e92:	8b 05 e0 17 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc217e0]        # 428678 <max_ch_nr_y>
  806e98:	8d 50 ff             	lea    edx,[rax-0x1]
  806e9b:	8b 05 cf 17 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc217cf]        # 428670 <fb_cursor_y>
  806ea1:	39 c2                	cmp    edx,eax
  806ea3:	77 0a                	ja     806eaf <print+0x71>
//            for(int i=0;i<font_height*font_size;i++)
////                scr_up();
////            fb_cursor_y=max_ch_nr_y-1;
            fb_cursor_y=0;
  806ea5:	c7 05 c1 17 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc217c1],0x0        # 428670 <fb_cursor_y>
  806eac:	00 00 00 
        }
        draw_letter(fb_cursor_x*font_width*font_size,fb_cursor_y*font_height*font_size,font_size,*s);
  806eaf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806eb3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806eb6:	0f be d0             	movsx  edx,al
  806eb9:	8b 05 41 54 00 00    	mov    eax,DWORD PTR [rip+0x5441]        # 80c300 <font_size>
  806ebf:	8b 35 ab 17 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc217ab]        # 428670 <fb_cursor_y>
  806ec5:	8b 0d c1 17 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc217c1]        # 42868c <font_height>
  806ecb:	0f af ce             	imul   ecx,esi
  806ece:	8b 35 2c 54 00 00    	mov    esi,DWORD PTR [rip+0x542c]        # 80c300 <font_size>
  806ed4:	0f af ce             	imul   ecx,esi
  806ed7:	41 89 c8             	mov    r8d,ecx
  806eda:	8b 35 8c 17 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc2178c]        # 42866c <fb_cursor_x>
  806ee0:	8b 0d a2 17 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc217a2]        # 428688 <font_width>
  806ee6:	0f af ce             	imul   ecx,esi
  806ee9:	8b 35 11 54 00 00    	mov    esi,DWORD PTR [rip+0x5411]        # 80c300 <font_size>
  806eef:	0f af ce             	imul   ecx,esi
  806ef2:	89 cf                	mov    edi,ecx
  806ef4:	89 d1                	mov    ecx,edx
  806ef6:	89 c2                	mov    edx,eax
  806ef8:	44 89 c6             	mov    esi,r8d
  806efb:	e8 e4 fc ff ff       	call   806be4 <draw_letter>
        fb_cursor_x+=1;
  806f00:	8b 05 66 17 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21766]        # 42866c <fb_cursor_x>
  806f06:	83 c0 01             	add    eax,0x1
  806f09:	89 05 5d 17 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2175d],eax        # 42866c <fb_cursor_x>
  806f0f:	eb 01                	jmp    806f12 <print+0xd4>
        if(*s=='\n')continue;
  806f11:	90                   	nop
    for(;*s;s++){
  806f12:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  806f17:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806f1b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806f1e:	84 c0                	test   al,al
  806f20:	0f 85 2d ff ff ff    	jne    806e53 <print+0x15>
    }
}
  806f26:	90                   	nop
  806f27:	90                   	nop
  806f28:	c9                   	leave  
  806f29:	c3                   	ret    

0000000000806f2a <open_framebuffer>:
struct file_operations framebuffer_fops={
        .open=open_framebuffer,.close=close_framebuffer,.read=read_framebuffer,.write=write_framebuffer,
        .ioctl=ioctl_framebuffer
};
long open_framebuffer(struct index_node * inode,struct file * filp){
  806f2a:	f3 0f 1e fa          	endbr64 
  806f2e:	55                   	push   rbp
  806f2f:	48 89 e5             	mov    rbp,rsp
  806f32:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  806f36:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    inode->f_ops=&framebuffer_fops;
  806f3a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806f3e:	48 c7 40 20 20 c3 80 	mov    QWORD PTR [rax+0x20],0x80c320
  806f45:	00 
    filp->f_ops=&framebuffer_fops;
  806f46:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806f4a:	48 c7 40 18 20 c3 80 	mov    QWORD PTR [rax+0x18],0x80c320
  806f51:	00 
}
  806f52:	90                   	nop
  806f53:	5d                   	pop    rbp
  806f54:	c3                   	ret    

0000000000806f55 <close_framebuffer>:
long close_framebuffer(struct index_node * inode,struct file * filp){
  806f55:	f3 0f 1e fa          	endbr64 
  806f59:	55                   	push   rbp
  806f5a:	48 89 e5             	mov    rbp,rsp
  806f5d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  806f61:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi

}
  806f65:	90                   	nop
  806f66:	5d                   	pop    rbp
  806f67:	c3                   	ret    

0000000000806f68 <read_framebuffer>:
long read_framebuffer(struct file * filp,char * buf,unsigned long count,long * position){
  806f68:	f3 0f 1e fa          	endbr64 
  806f6c:	55                   	push   rbp
  806f6d:	48 89 e5             	mov    rbp,rsp
  806f70:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  806f74:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  806f78:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  806f7c:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx

}
  806f80:	90                   	nop
  806f81:	5d                   	pop    rbp
  806f82:	c3                   	ret    

0000000000806f83 <write_framebuffer>:
long write_framebuffer(struct file * filp,char * buf,unsigned long count,long * position){
  806f83:	f3 0f 1e fa          	endbr64 
  806f87:	55                   	push   rbp
  806f88:	48 89 e5             	mov    rbp,rsp
  806f8b:	48 83 ec 40          	sub    rsp,0x40
  806f8f:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  806f93:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  806f97:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  806f9b:	48 89 4d c0          	mov    QWORD PTR [rbp-0x40],rcx
    char *tmp= (char*)vmalloc();
  806f9f:	b8 00 00 00 00       	mov    eax,0x0
  806fa4:	e8 10 a3 ff ff       	call   8012b9 <vmalloc>
  806fa9:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int c=count/(PAGE_4K_SIZE-1),p=0;
  806fad:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  806fb1:	48 ba 11 00 01 10 00 	movabs rdx,0x10010010010011
  806fb8:	01 10 00 
  806fbb:	48 89 c8             	mov    rax,rcx
  806fbe:	48 f7 e2             	mul    rdx
  806fc1:	48 89 c8             	mov    rax,rcx
  806fc4:	48 29 d0             	sub    rax,rdx
  806fc7:	48 d1 e8             	shr    rax,1
  806fca:	48 01 d0             	add    rax,rdx
  806fcd:	48 c1 e8 0b          	shr    rax,0xb
  806fd1:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  806fd4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    //一块一块输出
    for(int i=0;i<count?count:1;i++){
  806fdb:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  806fe2:	eb 46                	jmp    80702a <write_framebuffer+0xa7>
        memcpy(tmp,buf+p,PAGE_4K_SIZE-1);
  806fe4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806fe7:	48 63 d0             	movsxd rdx,eax
  806fea:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806fee:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  806ff2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806ff6:	ba ff 0f 00 00       	mov    edx,0xfff
  806ffb:	48 89 ce             	mov    rsi,rcx
  806ffe:	48 89 c7             	mov    rdi,rax
  807001:	e8 ac 48 00 00       	call   80b8b2 <memcpy>
        tmp[PAGE_4K_SIZE-1]=0;
  807006:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80700a:	48 05 ff 0f 00 00    	add    rax,0xfff
  807010:	c6 00 00             	mov    BYTE PTR [rax],0x0
        print(tmp);
  807013:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807017:	48 89 c7             	mov    rdi,rax
  80701a:	e8 1f fe ff ff       	call   806e3e <print>
        p+=PAGE_4K_SIZE-1;
  80701f:	81 45 fc ff 0f 00 00 	add    DWORD PTR [rbp-0x4],0xfff
    for(int i=0;i<count?count:1;i++){
  807026:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80702a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80702d:	48 98                	cdqe   
  80702f:	48 39 45 c8          	cmp    QWORD PTR [rbp-0x38],rax
  807033:	76 af                	jbe    806fe4 <write_framebuffer+0x61>
  807035:	48 83 7d c8 00       	cmp    QWORD PTR [rbp-0x38],0x0
  80703a:	75 a8                	jne    806fe4 <write_framebuffer+0x61>
    }
    vmfree(tmp);
  80703c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807040:	48 89 c7             	mov    rdi,rax
  807043:	e8 00 a3 ff ff       	call   801348 <vmfree>
    return 0;
  807048:	b8 00 00 00 00       	mov    eax,0x0
}
  80704d:	c9                   	leave  
  80704e:	c3                   	ret    

000000000080704f <ioctl_framebuffer>:
long ioctl_framebuffer(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg){
  80704f:	f3 0f 1e fa          	endbr64 
  807053:	55                   	push   rbp
  807054:	48 89 e5             	mov    rbp,rsp
  807057:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80705b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80705f:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  807063:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx

}
  807067:	90                   	nop
  807068:	5d                   	pop    rbp
  807069:	c3                   	ret    

000000000080706a <path_walk>:
#include "errno.h"
#include "memory.h"
#include "log.h"

struct dir_entry * path_walk(char * name,unsigned long flags)
{
  80706a:	f3 0f 1e fa          	endbr64 
  80706e:	55                   	push   rbp
  80706f:	48 89 e5             	mov    rbp,rsp
  807072:	48 83 ec 50          	sub    rsp,0x50
  807076:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  80707a:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
    char * tmpname = NULL;
  80707e:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  807085:	00 
    int tmpnamelen = 0;
  807086:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    struct dir_entry * parent = root_sb->root;
  80708d:	48 8b 05 14 16 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21614]        # 4286a8 <root_sb>
  807094:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807097:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    struct dir_entry * path = NULL;
  80709b:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  8070a2:	00 

    while(*name == '/')
  8070a3:	eb 05                	jmp    8070aa <path_walk+0x40>
        name++;
  8070a5:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
    while(*name == '/')
  8070aa:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8070ae:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8070b1:	3c 2f                	cmp    al,0x2f
  8070b3:	74 f0                	je     8070a5 <path_walk+0x3b>

    if(!*name)
  8070b5:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8070b9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8070bc:	84 c0                	test   al,al
  8070be:	75 09                	jne    8070c9 <path_walk+0x5f>
    {
        return parent;
  8070c0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8070c4:	e9 1b 02 00 00       	jmp    8072e4 <path_walk+0x27a>
    }

    for(;;)
    {
        tmpname = name;
  8070c9:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8070cd:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        while(*name && (*name != '/'))
  8070d1:	eb 05                	jmp    8070d8 <path_walk+0x6e>
            name++;
  8070d3:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
        while(*name && (*name != '/'))
  8070d8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8070dc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8070df:	84 c0                	test   al,al
  8070e1:	74 0b                	je     8070ee <path_walk+0x84>
  8070e3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8070e7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8070ea:	3c 2f                	cmp    al,0x2f
  8070ec:	75 e5                	jne    8070d3 <path_walk+0x69>
        tmpnamelen = name - tmpname;
  8070ee:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8070f2:	48 2b 45 f0          	sub    rax,QWORD PTR [rbp-0x10]
  8070f6:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

        path = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  8070f9:	be 00 00 00 00       	mov    esi,0x0
  8070fe:	bf 48 00 00 00       	mov    edi,0x48
  807103:	b8 00 00 00 00       	mov    eax,0x0
  807108:	e8 ac a1 ff ff       	call   8012b9 <vmalloc>
  80710d:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        memset(path,0,sizeof(struct dir_entry));
  807111:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807115:	ba 48 00 00 00       	mov    edx,0x48
  80711a:	be 00 00 00 00       	mov    esi,0x0
  80711f:	48 89 c7             	mov    rdi,rax
  807122:	e8 3a 48 00 00       	call   80b961 <memset>

        path->name = vmalloc(tmpnamelen+1,0);
  807127:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80712a:	83 c0 01             	add    eax,0x1
  80712d:	be 00 00 00 00       	mov    esi,0x0
  807132:	89 c7                	mov    edi,eax
  807134:	b8 00 00 00 00       	mov    eax,0x0
  807139:	e8 7b a1 ff ff       	call   8012b9 <vmalloc>
  80713e:	48 89 c2             	mov    rdx,rax
  807141:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807145:	48 89 10             	mov    QWORD PTR [rax],rdx
        memset(path->name,0,tmpnamelen+1);
  807148:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80714b:	83 c0 01             	add    eax,0x1
  80714e:	48 63 d0             	movsxd rdx,eax
  807151:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807155:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807158:	be 00 00 00 00       	mov    esi,0x0
  80715d:	48 89 c7             	mov    rdi,rax
  807160:	e8 fc 47 00 00       	call   80b961 <memset>
        memcpy(tmpname,path->name,tmpnamelen);
  807165:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807168:	48 63 d0             	movsxd rdx,eax
  80716b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80716f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  807172:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807176:	48 89 ce             	mov    rsi,rcx
  807179:	48 89 c7             	mov    rdi,rax
  80717c:	e8 31 47 00 00       	call   80b8b2 <memcpy>
        path->name_length = tmpnamelen;
  807181:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807185:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807188:	89 50 08             	mov    DWORD PTR [rax+0x8],edx

        if(parent->dir_inode->inode_ops->lookup(parent->dir_inode,path) == NULL)
  80718b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80718f:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807193:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  807197:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  80719b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80719f:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8071a3:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  8071a7:	48 89 d6             	mov    rsi,rdx
  8071aa:	48 89 c7             	mov    rdi,rax
  8071ad:	ff d1                	call   rcx
  8071af:	48 85 c0             	test   rax,rax
  8071b2:	75 3e                	jne    8071f2 <path_walk+0x188>
        {
            printf("can not find file or dir:%s\n",path->name);
  8071b4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8071b8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8071bb:	48 89 c6             	mov    rsi,rax
  8071be:	bf 70 3f 81 00       	mov    edi,0x813f70
  8071c3:	b8 00 00 00 00       	mov    eax,0x0
  8071c8:	e8 5a 9b ff ff       	call   800d27 <printf>
            vmfree(path->name);
  8071cd:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8071d1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8071d4:	48 89 c7             	mov    rdi,rax
  8071d7:	e8 6c a1 ff ff       	call   801348 <vmfree>
            vmfree(path);
  8071dc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8071e0:	48 89 c7             	mov    rdi,rax
  8071e3:	e8 60 a1 ff ff       	call   801348 <vmfree>
            return NULL;
  8071e8:	b8 00 00 00 00       	mov    eax,0x0
  8071ed:	e9 f2 00 00 00       	jmp    8072e4 <path_walk+0x27a>
        }

        list_init(&path->child_node);
  8071f2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8071f6:	48 83 c0 10          	add    rax,0x10
  8071fa:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    struct List * next;
};

__attribute__((always_inline)) inline void list_init(struct List * list)
{
    list->prev = list;
  8071fe:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807202:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  807206:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  807209:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80720d:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  807211:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  807215:	90                   	nop
        list_init(&path->subdirs_list);
  807216:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80721a:	48 83 c0 20          	add    rax,0x20
  80721e:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    list->prev = list;
  807222:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807226:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80722a:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  80722d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807231:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  807235:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  807239:	90                   	nop
        path->parent = parent;
  80723a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80723e:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  807242:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
        list_add_to_behind(&parent->subdirs_list,&path->child_node);
  807246:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80724a:	48 83 c0 10          	add    rax,0x10
  80724e:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  807252:	48 83 c2 20          	add    rdx,0x20
  807256:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  80725a:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

__attribute__((always_inline)) inline void list_add_to_behind(struct List * entry,struct List * new)	////add to entry behind
{
    new->next = entry->next;
  80725e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807262:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  807266:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80726a:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    new->prev = entry;
  80726e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807272:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  807276:	48 89 10             	mov    QWORD PTR [rax],rdx
    new->next->prev = new;
  807279:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80727d:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  807281:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  807285:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  807288:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80728c:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  807290:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  807294:	90                   	nop

        if(!*name)
  807295:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807299:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80729c:	84 c0                	test   al,al
  80729e:	74 2a                	je     8072ca <path_walk+0x260>
            goto last_component;
        while(*name == '/')
  8072a0:	eb 05                	jmp    8072a7 <path_walk+0x23d>
            name++;
  8072a2:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
        while(*name == '/')
  8072a7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8072ab:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8072ae:	3c 2f                	cmp    al,0x2f
  8072b0:	74 f0                	je     8072a2 <path_walk+0x238>
        if(!*name)
  8072b2:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8072b6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8072b9:	84 c0                	test   al,al
  8072bb:	74 10                	je     8072cd <path_walk+0x263>
            goto last_slash;

        parent = path;
  8072bd:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8072c1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    {
  8072c5:	e9 ff fd ff ff       	jmp    8070c9 <path_walk+0x5f>
            goto last_component;
  8072ca:	90                   	nop
  8072cb:	eb 01                	jmp    8072ce <path_walk+0x264>
            goto last_slash;
  8072cd:	90                   	nop
    }

    last_slash:
    last_component:

    if(flags & 1)
  8072ce:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8072d2:	83 e0 01             	and    eax,0x1
  8072d5:	48 85 c0             	test   rax,rax
  8072d8:	74 06                	je     8072e0 <path_walk+0x276>
    {
        return parent;
  8072da:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8072de:	eb 04                	jmp    8072e4 <path_walk+0x27a>
    }

    return path;
  8072e0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  8072e4:	c9                   	leave  
  8072e5:	c3                   	ret    

00000000008072e6 <fill_dentry>:

int fill_dentry(void *buf,char *name, long namelen,long type,long offset)
{
  8072e6:	f3 0f 1e fa          	endbr64 
  8072ea:	55                   	push   rbp
  8072eb:	48 89 e5             	mov    rbp,rsp
  8072ee:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8072f2:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8072f6:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  8072fa:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  8072fe:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
//
//    memcpy(name,dent->d_name,namelen);
//    dent->d_namelen = namelen;
//    dent->d_type = type;
//    dent->d_offset = offset;
    return sizeof(struct dirent) + namelen;
  807302:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807306:	83 c0 18             	add    eax,0x18
}
  807309:	5d                   	pop    rbp
  80730a:	c3                   	ret    

000000000080730b <mount_fs>:
//function mount_root
struct super_block * root_sb = NULL;
struct file_system_type filesystem = {"filesystem",0};

struct super_block* mount_fs(char * name,struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  80730b:	f3 0f 1e fa          	endbr64 
  80730f:	55                   	push   rbp
  807310:	48 89 e5             	mov    rbp,rsp
  807313:	48 83 ec 30          	sub    rsp,0x30
  807317:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80731b:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80731f:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file_system_type * p = NULL;
  807323:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80732a:	00 

    for(p = &filesystem;p;p = p->next)
  80732b:	48 c7 45 f8 60 c3 80 	mov    QWORD PTR [rbp-0x8],0x80c360
  807332:	00 
  807333:	eb 40                	jmp    807375 <mount_fs+0x6a>
        if(!strcmp(p->name,name))
  807335:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807339:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80733c:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  807340:	48 89 d6             	mov    rsi,rdx
  807343:	48 89 c7             	mov    rdi,rax
  807346:	e8 05 48 00 00       	call   80bb50 <strcmp>
  80734b:	85 c0                	test   eax,eax
  80734d:	75 1a                	jne    807369 <mount_fs+0x5e>
        {
            return p->read_superblock(DPTE,buf);
  80734f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807353:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  807357:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80735b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80735f:	48 89 d6             	mov    rsi,rdx
  807362:	48 89 c7             	mov    rdi,rax
  807365:	ff d1                	call   rcx
  807367:	eb 18                	jmp    807381 <mount_fs+0x76>
    for(p = &filesystem;p;p = p->next)
  807369:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80736d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807371:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  807375:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80737a:	75 b9                	jne    807335 <mount_fs+0x2a>
        }
    return 0;
  80737c:	b8 00 00 00 00       	mov    eax,0x0
}
  807381:	c9                   	leave  
  807382:	c3                   	ret    

0000000000807383 <register_filesystem>:

unsigned long register_filesystem(struct file_system_type * fs)
{
  807383:	f3 0f 1e fa          	endbr64 
  807387:	55                   	push   rbp
  807388:	48 89 e5             	mov    rbp,rsp
  80738b:	48 83 ec 20          	sub    rsp,0x20
  80738f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = NULL;
  807393:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80739a:	00 

    for(p = &filesystem;p;p = p->next)
  80739b:	48 c7 45 f8 60 c3 80 	mov    QWORD PTR [rbp-0x8],0x80c360
  8073a2:	00 
  8073a3:	eb 30                	jmp    8073d5 <register_filesystem+0x52>
        if(!strcmp(fs->name,p->name))
  8073a5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8073a9:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8073ac:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8073b0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8073b3:	48 89 d6             	mov    rsi,rdx
  8073b6:	48 89 c7             	mov    rdi,rax
  8073b9:	e8 92 47 00 00       	call   80bb50 <strcmp>
  8073be:	85 c0                	test   eax,eax
  8073c0:	75 07                	jne    8073c9 <register_filesystem+0x46>
            return 0;
  8073c2:	b8 00 00 00 00       	mov    eax,0x0
  8073c7:	eb 32                	jmp    8073fb <register_filesystem+0x78>
    for(p = &filesystem;p;p = p->next)
  8073c9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8073cd:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8073d1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  8073d5:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8073da:	75 c9                	jne    8073a5 <register_filesystem+0x22>

    fs->next = filesystem.next;
  8073dc:	48 8b 15 95 4f 00 00 	mov    rdx,QWORD PTR [rip+0x4f95]        # 80c378 <filesystem+0x18>
  8073e3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8073e7:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    filesystem.next = fs;
  8073eb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8073ef:	48 89 05 82 4f 00 00 	mov    QWORD PTR [rip+0x4f82],rax        # 80c378 <filesystem+0x18>

    return 1;
  8073f6:	b8 01 00 00 00       	mov    eax,0x1
}
  8073fb:	c9                   	leave  
  8073fc:	c3                   	ret    

00000000008073fd <unregister_filesystem>:

unsigned long unregister_filesystem(struct file_system_type * fs)
{
  8073fd:	f3 0f 1e fa          	endbr64 
  807401:	55                   	push   rbp
  807402:	48 89 e5             	mov    rbp,rsp
  807405:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = &filesystem;
  807409:	48 c7 45 f8 60 c3 80 	mov    QWORD PTR [rbp-0x8],0x80c360
  807410:	00 

    while(p->next)
  807411:	eb 41                	jmp    807454 <unregister_filesystem+0x57>
        if(p->next == fs)
  807413:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807417:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80741b:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  80741f:	75 27                	jne    807448 <unregister_filesystem+0x4b>
        {
            p->next = p->next->next;
  807421:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807425:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807429:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  80742d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807431:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
            fs->next = NULL;
  807435:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807439:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  807440:	00 
            return 1;
  807441:	b8 01 00 00 00       	mov    eax,0x1
  807446:	eb 1e                	jmp    807466 <unregister_filesystem+0x69>
        }
        else
            p = p->next;
  807448:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80744c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807450:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p->next)
  807454:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807458:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80745c:	48 85 c0             	test   rax,rax
  80745f:	75 b2                	jne    807413 <unregister_filesystem+0x16>
    return 0;
  807461:	b8 00 00 00 00       	mov    eax,0x0
}
  807466:	5d                   	pop    rbp
  807467:	c3                   	ret    

0000000000807468 <sys_putstring>:
#include "syscall.h"
#include "int.h"


unsigned long sys_putstring(char *string)
{
  807468:	f3 0f 1e fa          	endbr64 
  80746c:	55                   	push   rbp
  80746d:	48 89 e5             	mov    rbp,rsp
  807470:	48 83 ec 10          	sub    rsp,0x10
  807474:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    printf(string);
  807478:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80747c:	48 89 c7             	mov    rdi,rax
  80747f:	b8 00 00 00 00       	mov    eax,0x0
  807484:	e8 9e 98 ff ff       	call   800d27 <printf>
    return 0;
  807489:	b8 00 00 00 00       	mov    eax,0x0
}
  80748e:	c9                   	leave  
  80748f:	c3                   	ret    

0000000000807490 <sys_open>:

unsigned long sys_open(char *filename,int flags)
{
  807490:	f3 0f 1e fa          	endbr64 
  807494:	55                   	push   rbp
  807495:	48 89 e5             	mov    rbp,rsp
  807498:	48 83 ec 50          	sub    rsp,0x50
  80749c:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  8074a0:	89 75 b4             	mov    DWORD PTR [rbp-0x4c],esi
    char * path = NULL;
  8074a3:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  8074aa:	00 
    long pathlen = 0;
  8074ab:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  8074b2:	00 
    long error = 0;
  8074b3:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8074ba:	00 
    struct dir_entry * dentry = NULL;
  8074bb:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  8074c2:	00 
    struct file * filp = NULL;
  8074c3:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  8074ca:	00 
    struct file ** f = NULL;
  8074cb:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  8074d2:	00 
    int fd = -1;
  8074d3:	c7 45 f4 ff ff ff ff 	mov    DWORD PTR [rbp-0xc],0xffffffff
    int i;

//	printf("sys_open\n");
    path = (char *)vmalloc();
  8074da:	b8 00 00 00 00       	mov    eax,0x0
  8074df:	e8 d5 9d ff ff       	call   8012b9 <vmalloc>
  8074e4:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    if(path == NULL)
  8074e8:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  8074ed:	75 0c                	jne    8074fb <sys_open+0x6b>
        return -ENOMEM;
  8074ef:	48 c7 c0 cf ff ff ff 	mov    rax,0xffffffffffffffcf
  8074f6:	e9 aa 02 00 00       	jmp    8077a5 <sys_open+0x315>
    memset(path,0,PAGE_4K_SIZE);
  8074fb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8074ff:	ba 00 10 00 00       	mov    edx,0x1000
  807504:	be 00 00 00 00       	mov    esi,0x0
  807509:	48 89 c7             	mov    rdi,rax
  80750c:	e8 50 44 00 00       	call   80b961 <memset>
    pathlen = strlen(filename);
  807511:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807515:	48 89 c7             	mov    rdi,rax
  807518:	e8 b2 46 00 00       	call   80bbcf <strlen>
  80751d:	48 98                	cdqe   
  80751f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(pathlen <= 0)
  807523:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  807528:	7f 18                	jg     807542 <sys_open+0xb2>
    {
        vmfree(path);
  80752a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80752e:	48 89 c7             	mov    rdi,rax
  807531:	e8 12 9e ff ff       	call   801348 <vmfree>
        return -EFAULT;
  807536:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  80753d:	e9 63 02 00 00       	jmp    8077a5 <sys_open+0x315>
    }
    else if(pathlen >= PAGE_4K_SIZE)
  807542:	48 81 7d e0 ff 0f 00 	cmp    QWORD PTR [rbp-0x20],0xfff
  807549:	00 
  80754a:	7e 18                	jle    807564 <sys_open+0xd4>
    {
        vmfree(path);
  80754c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807550:	48 89 c7             	mov    rdi,rax
  807553:	e8 f0 9d ff ff       	call   801348 <vmfree>
        return -ENAMETOOLONG;
  807558:	48 c7 c0 db ff ff ff 	mov    rax,0xffffffffffffffdb
  80755f:	e9 41 02 00 00       	jmp    8077a5 <sys_open+0x315>
    }
    strcpy(filename,path);
  807564:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  807568:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80756c:	48 89 d6             	mov    rsi,rdx
  80756f:	48 89 c7             	mov    rdi,rax
  807572:	e8 39 44 00 00       	call   80b9b0 <strcpy>

    dentry = path_walk(path,0);
  807577:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80757b:	be 00 00 00 00       	mov    esi,0x0
  807580:	48 89 c7             	mov    rdi,rax
  807583:	e8 e2 fa ff ff       	call   80706a <path_walk>
  807588:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    vmfree(path);
  80758c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807590:	48 89 c7             	mov    rdi,rax
  807593:	e8 b0 9d ff ff       	call   801348 <vmfree>

    if(dentry == NULL)
  807598:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80759d:	75 0c                	jne    8075ab <sys_open+0x11b>
        return -ENOENT;
  80759f:	48 c7 c0 d3 ff ff ff 	mov    rax,0xffffffffffffffd3
  8075a6:	e9 fa 01 00 00       	jmp    8077a5 <sys_open+0x315>

    if((flags & O_DIRECTORY) && (dentry->dir_inode->attribute != FS_ATTR_DIR))
  8075ab:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8075ae:	25 00 40 00 00       	and    eax,0x4000
  8075b3:	85 c0                	test   eax,eax
  8075b5:	74 1e                	je     8075d5 <sys_open+0x145>
  8075b7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8075bb:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8075bf:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8075c3:	48 83 f8 02          	cmp    rax,0x2
  8075c7:	74 0c                	je     8075d5 <sys_open+0x145>
        return -ENOTDIR;
  8075c9:	48 c7 c0 c7 ff ff ff 	mov    rax,0xffffffffffffffc7
  8075d0:	e9 d0 01 00 00       	jmp    8077a5 <sys_open+0x315>
    if(!(flags & O_DIRECTORY) && (dentry->dir_inode->attribute == FS_ATTR_DIR))
  8075d5:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8075d8:	25 00 40 00 00       	and    eax,0x4000
  8075dd:	85 c0                	test   eax,eax
  8075df:	75 1e                	jne    8075ff <sys_open+0x16f>
  8075e1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8075e5:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8075e9:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8075ed:	48 83 f8 02          	cmp    rax,0x2
  8075f1:	75 0c                	jne    8075ff <sys_open+0x16f>
        return -EISDIR;
  8075f3:	48 c7 c0 e1 ff ff ff 	mov    rax,0xffffffffffffffe1
  8075fa:	e9 a6 01 00 00       	jmp    8077a5 <sys_open+0x315>

    filp = (struct file *)vmalloc();
  8075ff:	b8 00 00 00 00       	mov    eax,0x0
  807604:	e8 b0 9c ff ff       	call   8012b9 <vmalloc>
  807609:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    memset(filp,0,sizeof(struct file));
  80760d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807611:	ba 28 00 00 00       	mov    edx,0x28
  807616:	be 00 00 00 00       	mov    esi,0x0
  80761b:	48 89 c7             	mov    rdi,rax
  80761e:	e8 3e 43 00 00       	call   80b961 <memset>
    filp->dentry = dentry;
  807623:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807627:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80762b:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    filp->mode = flags;
  80762f:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  807632:	48 63 d0             	movsxd rdx,eax
  807635:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807639:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx

    if(dentry->dir_inode->attribute & FS_ATTR_DEVICE)
  80763d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807641:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807645:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807649:	83 e0 04             	and    eax,0x4
  80764c:	48 85 c0             	test   rax,rax
  80764f:	74 0e                	je     80765f <sys_open+0x1cf>
        filp->f_ops = NULL;//&keyboard_fops;	//////	find device file operation function
  807651:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807655:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  80765c:	00 
  80765d:	eb 14                	jmp    807673 <sys_open+0x1e3>
    else
        filp->f_ops = dentry->dir_inode->f_ops;
  80765f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807663:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807667:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  80766b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80766f:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    if(filp->f_ops && filp->f_ops->open)
  807673:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807677:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80767b:	48 85 c0             	test   rax,rax
  80767e:	74 33                	je     8076b3 <sys_open+0x223>
  807680:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807684:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807688:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80768b:	48 85 c0             	test   rax,rax
  80768e:	74 23                	je     8076b3 <sys_open+0x223>
        error = filp->f_ops->open(dentry->dir_inode,filp);
  807690:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807694:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807698:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80769b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80769f:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8076a3:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8076a7:	48 89 d6             	mov    rsi,rdx
  8076aa:	48 89 c7             	mov    rdi,rax
  8076ad:	ff d1                	call   rcx
  8076af:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(error != 1)
  8076b3:	48 83 7d f8 01       	cmp    QWORD PTR [rbp-0x8],0x1
  8076b8:	74 18                	je     8076d2 <sys_open+0x242>
    {
        vmfree(filp);
  8076ba:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8076be:	48 89 c7             	mov    rdi,rax
  8076c1:	e8 82 9c ff ff       	call   801348 <vmfree>
        return -EFAULT;
  8076c6:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  8076cd:	e9 d3 00 00 00       	jmp    8077a5 <sys_open+0x315>
    }

    if(filp->mode & O_TRUNC)
  8076d2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8076d6:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8076da:	25 00 02 00 00       	and    eax,0x200
  8076df:	48 85 c0             	test   rax,rax
  8076e2:	74 13                	je     8076f7 <sys_open+0x267>
    {
        filp->dentry->dir_inode->file_size = 0;
  8076e4:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8076e8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8076ec:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8076f0:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }
    if(filp->mode & O_APPEND)
  8076f7:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8076fb:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8076ff:	25 00 04 00 00       	and    eax,0x400
  807704:	48 85 c0             	test   rax,rax
  807707:	74 19                	je     807722 <sys_open+0x292>
    {
        filp->position = filp->dentry->dir_inode->file_size;
  807709:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80770d:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807711:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807715:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807718:	48 89 c2             	mov    rdx,rax
  80771b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80771f:	48 89 10             	mov    QWORD PTR [rax],rdx
    }

    f = current->openf;
  807722:	48 8b 05 77 de c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0de77]        # 4155a0 <current>
  807729:	48 05 d8 00 00 00    	add    rax,0xd8
  80772f:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    for(i = 0;i < MAX_TASKS;i++)
  807733:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80773a:	eb 28                	jmp    807764 <sys_open+0x2d4>
        if(f[i] == NULL)
  80773c:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80773f:	48 98                	cdqe   
  807741:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  807748:	00 
  807749:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80774d:	48 01 d0             	add    rax,rdx
  807750:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807753:	48 85 c0             	test   rax,rax
  807756:	75 08                	jne    807760 <sys_open+0x2d0>
        {
            fd = i;
  807758:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80775b:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            break;
  80775e:	eb 0a                	jmp    80776a <sys_open+0x2da>
    for(i = 0;i < MAX_TASKS;i++)
  807760:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  807764:	83 7d f0 1f          	cmp    DWORD PTR [rbp-0x10],0x1f
  807768:	7e d2                	jle    80773c <sys_open+0x2ac>
        }
    if(i == MAX_TASKS)
  80776a:	83 7d f0 20          	cmp    DWORD PTR [rbp-0x10],0x20
  80776e:	75 15                	jne    807785 <sys_open+0x2f5>
    {
        vmfree(filp);
  807770:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807774:	48 89 c7             	mov    rdi,rax
  807777:	e8 cc 9b ff ff       	call   801348 <vmfree>
        //// reclaim struct index_node & struct dir_entry
        return -EMFILE;
  80777c:	48 c7 c0 df ff ff ff 	mov    rax,0xffffffffffffffdf
  807783:	eb 20                	jmp    8077a5 <sys_open+0x315>
    }
    f[fd] = filp;
  807785:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807788:	48 98                	cdqe   
  80778a:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  807791:	00 
  807792:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807796:	48 01 c2             	add    rdx,rax
  807799:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80779d:	48 89 02             	mov    QWORD PTR [rdx],rax

    return fd;
  8077a0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8077a3:	48 98                	cdqe   
}
  8077a5:	c9                   	leave  
  8077a6:	c3                   	ret    

00000000008077a7 <sys_close>:

unsigned long sys_close(int fd)
{
  8077a7:	f3 0f 1e fa          	endbr64 
  8077ab:	55                   	push   rbp
  8077ac:	48 89 e5             	mov    rbp,rsp
  8077af:	48 83 ec 20          	sub    rsp,0x20
  8077b3:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    struct file * filp = NULL;
  8077b6:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8077bd:	00 

//	printf("sys_close:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  8077be:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8077c2:	78 06                	js     8077ca <sys_close+0x23>
  8077c4:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  8077c8:	7e 0c                	jle    8077d6 <sys_close+0x2f>
        return -EBADF;
  8077ca:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  8077d1:	e9 87 00 00 00       	jmp    80785d <sys_close+0xb6>

    filp = current->openf[fd];
  8077d6:	48 8b 05 c3 dd c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ddc3]        # 4155a0 <current>
  8077dd:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8077e0:	48 63 d2             	movsxd rdx,edx
  8077e3:	48 83 c2 1a          	add    rdx,0x1a
  8077e7:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  8077ec:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(filp->f_ops && filp->f_ops->close)
  8077f0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8077f4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8077f8:	48 85 c0             	test   rax,rax
  8077fb:	74 35                	je     807832 <sys_close+0x8b>
  8077fd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807801:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807805:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  807809:	48 85 c0             	test   rax,rax
  80780c:	74 24                	je     807832 <sys_close+0x8b>
        filp->f_ops->close(filp->dentry->dir_inode,filp);
  80780e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807812:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807816:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  80781a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80781e:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807822:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807826:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80782a:	48 89 d6             	mov    rsi,rdx
  80782d:	48 89 c7             	mov    rdi,rax
  807830:	ff d1                	call   rcx

    vmfree(filp);
  807832:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807836:	48 89 c7             	mov    rdi,rax
  807839:	e8 0a 9b ff ff       	call   801348 <vmfree>
    current->openf[fd] = NULL;
  80783e:	48 8b 05 5b dd c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0dd5b]        # 4155a0 <current>
  807845:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807848:	48 63 d2             	movsxd rdx,edx
  80784b:	48 83 c2 1a          	add    rdx,0x1a
  80784f:	48 c7 44 d0 08 00 00 	mov    QWORD PTR [rax+rdx*8+0x8],0x0
  807856:	00 00 

    return 0;
  807858:	b8 00 00 00 00       	mov    eax,0x0
}
  80785d:	c9                   	leave  
  80785e:	c3                   	ret    

000000000080785f <sys_read>:

unsigned long sys_read(int fd,void * buf,long count)
{
  80785f:	f3 0f 1e fa          	endbr64 
  807863:	55                   	push   rbp
  807864:	48 89 e5             	mov    rbp,rsp
  807867:	48 83 ec 30          	sub    rsp,0x30
  80786b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80786e:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  807872:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  807876:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80787d:	00 
    unsigned long ret = 0;
  80787e:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807885:	00 

//	printf("sys_read:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  807886:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80788a:	78 06                	js     807892 <sys_read+0x33>
  80788c:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  807890:	7e 09                	jle    80789b <sys_read+0x3c>
        return -EBADF;
  807892:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  807899:	eb 72                	jmp    80790d <sys_read+0xae>
    if(count < 0)
  80789b:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  8078a0:	79 09                	jns    8078ab <sys_read+0x4c>
        return -EINVAL;
  8078a2:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  8078a9:	eb 62                	jmp    80790d <sys_read+0xae>

    filp = current->openf[fd];
  8078ab:	48 8b 05 ee dc c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0dcee]        # 4155a0 <current>
  8078b2:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8078b5:	48 63 d2             	movsxd rdx,edx
  8078b8:	48 83 c2 1a          	add    rdx,0x1a
  8078bc:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  8078c1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->read)
  8078c5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8078c9:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8078cd:	48 85 c0             	test   rax,rax
  8078d0:	74 37                	je     807909 <sys_read+0xaa>
  8078d2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8078d6:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8078da:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8078de:	48 85 c0             	test   rax,rax
  8078e1:	74 26                	je     807909 <sys_read+0xaa>
        ret = filp->f_ops->read(filp,buf,count,&filp->position);
  8078e3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8078e7:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8078eb:	4c 8b 40 10          	mov    r8,QWORD PTR [rax+0x10]
  8078ef:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  8078f3:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8078f7:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  8078fb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8078ff:	48 89 c7             	mov    rdi,rax
  807902:	41 ff d0             	call   r8
  807905:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  807909:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80790d:	c9                   	leave  
  80790e:	c3                   	ret    

000000000080790f <sys_write>:

unsigned long sys_write(int fd,void * buf,long count)
{
  80790f:	f3 0f 1e fa          	endbr64 
  807913:	55                   	push   rbp
  807914:	48 89 e5             	mov    rbp,rsp
  807917:	48 83 ec 30          	sub    rsp,0x30
  80791b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80791e:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  807922:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  807926:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80792d:	00 
    unsigned long ret = 0;
  80792e:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807935:	00 

//	printf("sys_write:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  807936:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80793a:	78 06                	js     807942 <sys_write+0x33>
  80793c:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  807940:	7e 09                	jle    80794b <sys_write+0x3c>
        return -EBADF;
  807942:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  807949:	eb 72                	jmp    8079bd <sys_write+0xae>
    if(count < 0)
  80794b:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  807950:	79 09                	jns    80795b <sys_write+0x4c>
        return -EINVAL;
  807952:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  807959:	eb 62                	jmp    8079bd <sys_write+0xae>

    filp = current->openf[fd];
  80795b:	48 8b 05 3e dc c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0dc3e]        # 4155a0 <current>
  807962:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807965:	48 63 d2             	movsxd rdx,edx
  807968:	48 83 c2 1a          	add    rdx,0x1a
  80796c:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  807971:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->write)
  807975:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807979:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80797d:	48 85 c0             	test   rax,rax
  807980:	74 37                	je     8079b9 <sys_write+0xaa>
  807982:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807986:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80798a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80798e:	48 85 c0             	test   rax,rax
  807991:	74 26                	je     8079b9 <sys_write+0xaa>
        ret = filp->f_ops->write(filp,buf,count,&filp->position);
  807993:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807997:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80799b:	4c 8b 40 18          	mov    r8,QWORD PTR [rax+0x18]
  80799f:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  8079a3:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8079a7:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  8079ab:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8079af:	48 89 c7             	mov    rdi,rax
  8079b2:	41 ff d0             	call   r8
  8079b5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  8079b9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  8079bd:	c9                   	leave  
  8079be:	c3                   	ret    

00000000008079bf <sys_lseek>:


unsigned long sys_lseek(int filds,long offset,int whence)
{
  8079bf:	f3 0f 1e fa          	endbr64 
  8079c3:	55                   	push   rbp
  8079c4:	48 89 e5             	mov    rbp,rsp
  8079c7:	48 83 ec 20          	sub    rsp,0x20
  8079cb:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8079ce:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8079d2:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    struct file * filp = NULL;
  8079d5:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8079dc:	00 
    unsigned long ret = 0;
  8079dd:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8079e4:	00 

//	printf("sys_lseek:%d\n",filds);
    if(filds < 0 || filds >= MAX_TASKS)
  8079e5:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8079e9:	78 06                	js     8079f1 <sys_lseek+0x32>
  8079eb:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  8079ef:	7e 09                	jle    8079fa <sys_lseek+0x3b>
        return -EBADF;
  8079f1:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  8079f8:	eb 78                	jmp    807a72 <sys_lseek+0xb3>
    if(whence < 0 || whence >= SEEK_MAX)
  8079fa:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  8079fe:	78 06                	js     807a06 <sys_lseek+0x47>
  807a00:	83 7d e8 02          	cmp    DWORD PTR [rbp-0x18],0x2
  807a04:	7e 09                	jle    807a0f <sys_lseek+0x50>
        return -EINVAL;
  807a06:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  807a0d:	eb 63                	jmp    807a72 <sys_lseek+0xb3>

    filp = current->openf[filds];
  807a0f:	48 8b 05 8a db c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0db8a]        # 4155a0 <current>
  807a16:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807a19:	48 63 d2             	movsxd rdx,edx
  807a1c:	48 83 c2 1a          	add    rdx,0x1a
  807a20:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  807a25:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->lseek)
  807a29:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807a2d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807a31:	48 85 c0             	test   rax,rax
  807a34:	74 38                	je     807a6e <sys_lseek+0xaf>
  807a36:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807a3a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807a3e:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  807a42:	48 85 c0             	test   rax,rax
  807a45:	74 27                	je     807a6e <sys_lseek+0xaf>
        ret = filp->f_ops->lseek(filp,offset,whence);
  807a47:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807a4b:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807a4f:	4c 8b 40 20          	mov    r8,QWORD PTR [rax+0x20]
  807a53:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807a56:	48 63 d0             	movsxd rdx,eax
  807a59:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  807a5d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807a61:	48 89 ce             	mov    rsi,rcx
  807a64:	48 89 c7             	mov    rdi,rax
  807a67:	41 ff d0             	call   r8
  807a6a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  807a6e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  807a72:	c9                   	leave  
  807a73:	c3                   	ret    

0000000000807a74 <sys_vfork>:
//    printf("sys_fork\n");
//    //return do_fork(regs,0,regs->rsp,0);
//}

unsigned long sys_vfork()
{
  807a74:	f3 0f 1e fa          	endbr64 
  807a78:	55                   	push   rbp
  807a79:	48 89 e5             	mov    rbp,rsp
  807a7c:	48 83 ec 10          	sub    rsp,0x10
    regs_t *regs = (regs_t *)current->tss.rsp0 -1;
  807a80:	48 8b 05 19 db c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0db19]        # 4155a0 <current>
  807a87:	48 8b 80 dc 01 00 00 	mov    rax,QWORD PTR [rax+0x1dc]
  807a8e:	48 2d d0 00 00 00    	sub    rax,0xd0
  807a94:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    printf("sys_vfork\n");
  807a98:	bf 98 3f 81 00       	mov    edi,0x813f98
  807a9d:	b8 00 00 00 00       	mov    eax,0x0
  807aa2:	e8 80 92 ff ff       	call   800d27 <printf>
    //return do_fork(regs,CLONE_VM | CLONE_FS | CLONE_SIGNAL,regs->rsp,0);
}
  807aa7:	90                   	nop
  807aa8:	c9                   	leave  
  807aa9:	c3                   	ret    

0000000000807aaa <sys_wait4>:
/*
	rusage reserved
*/

unsigned long sys_wait4(unsigned long pid,int *status,int options,void *rusage)
{
  807aaa:	f3 0f 1e fa          	endbr64 
  807aae:	55                   	push   rbp
  807aaf:	48 89 e5             	mov    rbp,rsp
  807ab2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  807ab6:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  807aba:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  807abd:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
//    copy_to_user(&child->exit_code,status,sizeof(long));
//    tsk->next = child->next;
//    exit_mm(child);
//    vmfree(child);
//    return retval;
}
  807ac1:	90                   	nop
  807ac2:	5d                   	pop    rbp
  807ac3:	c3                   	ret    

0000000000807ac4 <sys_brk>:

unsigned long sys_brk(unsigned long brk)
{
  807ac4:	f3 0f 1e fa          	endbr64 
  807ac8:	55                   	push   rbp
  807ac9:	48 89 e5             	mov    rbp,rsp
  807acc:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//
//    new_brk = do_brk(current->mm->end_brk,new_brk - current->mm->end_brk);	//expand brk space
//
//    current->mm->end_brk = new_brk;
//    return new_brk;
}
  807ad0:	90                   	nop
  807ad1:	5d                   	pop    rbp
  807ad2:	c3                   	ret    

0000000000807ad3 <sys_reboot>:

unsigned long sys_reboot(unsigned long cmd,void * arg)
{
  807ad3:	f3 0f 1e fa          	endbr64 
  807ad7:	55                   	push   rbp
  807ad8:	48 89 e5             	mov    rbp,rsp
  807adb:	48 83 ec 10          	sub    rsp,0x10
  807adf:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  807ae3:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    printf("sys_reboot\n");
  807ae7:	bf a3 3f 81 00       	mov    edi,0x813fa3
  807aec:	b8 00 00 00 00       	mov    eax,0x0
  807af1:	e8 31 92 ff ff       	call   800d27 <printf>
    switch(cmd)
  807af6:	48 83 7d f8 01       	cmp    QWORD PTR [rbp-0x8],0x1
  807afb:	74 09                	je     807b06 <sys_reboot+0x33>
  807afd:	48 83 7d f8 02       	cmp    QWORD PTR [rbp-0x8],0x2
  807b02:	74 13                	je     807b17 <sys_reboot+0x44>
  807b04:	eb 22                	jmp    807b28 <sys_reboot+0x55>
    {
        case SYSTEM_REBOOT:
            outb(0x64,0xFE);
  807b06:	be fe 00 00 00       	mov    esi,0xfe
  807b0b:	bf 64 00 00 00       	mov    edi,0x64
  807b10:	e8 eb df ff ff       	call   805b00 <outb>
            break;
  807b15:	eb 21                	jmp    807b38 <sys_reboot+0x65>

        case SYSTEM_POWEROFF:
            printf("sys_reboot cmd SYSTEM_POWEROFF\n");
  807b17:	bf b0 3f 81 00       	mov    edi,0x813fb0
  807b1c:	b8 00 00 00 00       	mov    eax,0x0
  807b21:	e8 01 92 ff ff       	call   800d27 <printf>
            break;
  807b26:	eb 10                	jmp    807b38 <sys_reboot+0x65>

        default:
            printf("sys_reboot cmd ERROR!\n");
  807b28:	bf d0 3f 81 00       	mov    edi,0x813fd0
  807b2d:	b8 00 00 00 00       	mov    eax,0x0
  807b32:	e8 f0 91 ff ff       	call   800d27 <printf>
            break;
  807b37:	90                   	nop
    }
    return 0;
  807b38:	b8 00 00 00 00       	mov    eax,0x0
}
  807b3d:	c9                   	leave  
  807b3e:	c3                   	ret    

0000000000807b3f <sys_chdir>:


unsigned long sys_chdir(char *filename)
{
  807b3f:	f3 0f 1e fa          	endbr64 
  807b43:	55                   	push   rbp
  807b44:	48 89 e5             	mov    rbp,rsp
  807b47:	48 83 ec 30          	sub    rsp,0x30
  807b4b:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char * path = NULL;
  807b4f:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807b56:	00 
    long pathlen = 0;
  807b57:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  807b5e:	00 
    struct dir_entry * dentry = NULL;
  807b5f:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  807b66:	00 

    printf("sys_chdir\n");
  807b67:	bf e7 3f 81 00       	mov    edi,0x813fe7
  807b6c:	b8 00 00 00 00       	mov    eax,0x0
  807b71:	e8 b1 91 ff ff       	call   800d27 <printf>
    path = (char *)vmalloc();
  807b76:	b8 00 00 00 00       	mov    eax,0x0
  807b7b:	e8 39 97 ff ff       	call   8012b9 <vmalloc>
  807b80:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    if(path == NULL)
  807b84:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  807b89:	75 0c                	jne    807b97 <sys_chdir+0x58>
        return -ENOMEM;
  807b8b:	48 c7 c0 cf ff ff ff 	mov    rax,0xffffffffffffffcf
  807b92:	e9 ca 00 00 00       	jmp    807c61 <sys_chdir+0x122>
    memset(path,0,PAGE_4K_SIZE);
  807b97:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807b9b:	ba 00 10 00 00       	mov    edx,0x1000
  807ba0:	be 00 00 00 00       	mov    esi,0x0
  807ba5:	48 89 c7             	mov    rdi,rax
  807ba8:	e8 b4 3d 00 00       	call   80b961 <memset>
    pathlen = strlen(filename);
  807bad:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807bb1:	48 89 c7             	mov    rdi,rax
  807bb4:	e8 16 40 00 00       	call   80bbcf <strlen>
  807bb9:	48 98                	cdqe   
  807bbb:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(pathlen <= 0)
  807bbf:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  807bc4:	7f 18                	jg     807bde <sys_chdir+0x9f>
    {
        vmfree(path);
  807bc6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807bca:	48 89 c7             	mov    rdi,rax
  807bcd:	e8 76 97 ff ff       	call   801348 <vmfree>
        return -EFAULT;
  807bd2:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  807bd9:	e9 83 00 00 00       	jmp    807c61 <sys_chdir+0x122>
    }
    else if(pathlen >= PAGE_4K_SIZE)
  807bde:	48 81 7d f0 ff 0f 00 	cmp    QWORD PTR [rbp-0x10],0xfff
  807be5:	00 
  807be6:	7e 15                	jle    807bfd <sys_chdir+0xbe>
    {
        vmfree(path);
  807be8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807bec:	48 89 c7             	mov    rdi,rax
  807bef:	e8 54 97 ff ff       	call   801348 <vmfree>
        return -ENAMETOOLONG;
  807bf4:	48 c7 c0 db ff ff ff 	mov    rax,0xffffffffffffffdb
  807bfb:	eb 64                	jmp    807c61 <sys_chdir+0x122>
    }
    strcpy(filename,path);
  807bfd:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  807c01:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807c05:	48 89 d6             	mov    rsi,rdx
  807c08:	48 89 c7             	mov    rdi,rax
  807c0b:	e8 a0 3d 00 00       	call   80b9b0 <strcpy>

    dentry = path_walk(path,0);
  807c10:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807c14:	be 00 00 00 00       	mov    esi,0x0
  807c19:	48 89 c7             	mov    rdi,rax
  807c1c:	e8 49 f4 ff ff       	call   80706a <path_walk>
  807c21:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    vmfree(path);
  807c25:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807c29:	48 89 c7             	mov    rdi,rax
  807c2c:	e8 17 97 ff ff       	call   801348 <vmfree>

    if(dentry == NULL)
  807c31:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  807c36:	75 09                	jne    807c41 <sys_chdir+0x102>
        return -ENOENT;
  807c38:	48 c7 c0 d3 ff ff ff 	mov    rax,0xffffffffffffffd3
  807c3f:	eb 20                	jmp    807c61 <sys_chdir+0x122>
    if(dentry->dir_inode->attribute != FS_ATTR_DIR)
  807c41:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807c45:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807c49:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807c4d:	48 83 f8 02          	cmp    rax,0x2
  807c51:	74 09                	je     807c5c <sys_chdir+0x11d>
        return -ENOTDIR;
  807c53:	48 c7 c0 c7 ff ff ff 	mov    rax,0xffffffffffffffc7
  807c5a:	eb 05                	jmp    807c61 <sys_chdir+0x122>
    return 0;
  807c5c:	b8 00 00 00 00       	mov    eax,0x0
}
  807c61:	c9                   	leave  
  807c62:	c3                   	ret    

0000000000807c63 <sys_getdents>:

unsigned long sys_getdents(int fd, void * dirent, long count)
{
  807c63:	f3 0f 1e fa          	endbr64 
  807c67:	55                   	push   rbp
  807c68:	48 89 e5             	mov    rbp,rsp
  807c6b:	48 83 ec 30          	sub    rsp,0x30
  807c6f:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  807c72:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  807c76:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  807c7a:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  807c81:	00 
    unsigned long ret = 0;
  807c82:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807c89:	00 

//	printf("sys_getdents:%d\n",fd);
    if(fd < 0 || fd > MAX_TASKS)
  807c8a:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  807c8e:	78 06                	js     807c96 <sys_getdents+0x33>
  807c90:	83 7d ec 20          	cmp    DWORD PTR [rbp-0x14],0x20
  807c94:	7e 09                	jle    807c9f <sys_getdents+0x3c>
        return -EBADF;
  807c96:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  807c9d:	eb 72                	jmp    807d11 <sys_getdents+0xae>
    if(count < 0)
  807c9f:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  807ca4:	79 09                	jns    807caf <sys_getdents+0x4c>
        return -EINVAL;
  807ca6:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  807cad:	eb 62                	jmp    807d11 <sys_getdents+0xae>

    filp = current->openf[fd];
  807caf:	48 8b 05 ea d8 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0d8ea]        # 4155a0 <current>
  807cb6:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807cb9:	48 63 d2             	movsxd rdx,edx
  807cbc:	48 83 c2 1a          	add    rdx,0x1a
  807cc0:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  807cc5:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->readdir)
  807cc9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807ccd:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807cd1:	48 85 c0             	test   rax,rax
  807cd4:	74 37                	je     807d0d <sys_getdents+0xaa>
  807cd6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807cda:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807cde:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807ce2:	48 85 c0             	test   rax,rax
  807ce5:	74 26                	je     807d0d <sys_getdents+0xaa>
        ret = filp->f_ops->readdir(filp,dirent,&fill_dentry);
  807ce7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807ceb:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807cef:	4c 8b 40 30          	mov    r8,QWORD PTR [rax+0x30]
  807cf3:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  807cf7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807cfb:	ba e6 72 80 00       	mov    edx,0x8072e6
  807d00:	48 89 ce             	mov    rsi,rcx
  807d03:	48 89 c7             	mov    rdi,rax
  807d06:	41 ff d0             	call   r8
  807d09:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  807d0d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  807d11:	c9                   	leave  
  807d12:	c3                   	ret    

0000000000807d13 <shift>:
/* 0x5D - Apps      */ {  0,        0,       0x5D,      0x5D }
        };
char k_shift=0,k_ctrl=0,k_capslock=0;

void shift()
{
  807d13:	f3 0f 1e fa          	endbr64 
  807d17:	55                   	push   rbp
  807d18:	48 89 e5             	mov    rbp,rsp
    k_shift=!k_shift;
  807d1b:	0f b6 05 ab 0b c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20bab]        # 4288cd <k_shift>
  807d22:	84 c0                	test   al,al
  807d24:	0f 94 c0             	sete   al
  807d27:	88 05 a0 0b c2 ff    	mov    BYTE PTR [rip+0xffffffffffc20ba0],al        # 4288cd <k_shift>
}
  807d2d:	90                   	nop
  807d2e:	5d                   	pop    rbp
  807d2f:	c3                   	ret    

0000000000807d30 <ctrl>:
void ctrl()
{
  807d30:	f3 0f 1e fa          	endbr64 
  807d34:	55                   	push   rbp
  807d35:	48 89 e5             	mov    rbp,rsp
    k_ctrl=!k_ctrl;
  807d38:	0f b6 05 8f 0b c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20b8f]        # 4288ce <k_ctrl>
  807d3f:	84 c0                	test   al,al
  807d41:	0f 94 c0             	sete   al
  807d44:	88 05 84 0b c2 ff    	mov    BYTE PTR [rip+0xffffffffffc20b84],al        # 4288ce <k_ctrl>
}
  807d4a:	90                   	nop
  807d4b:	5d                   	pop    rbp
  807d4c:	c3                   	ret    

0000000000807d4d <capslock>:
void capslock()
{
  807d4d:	f3 0f 1e fa          	endbr64 
  807d51:	55                   	push   rbp
  807d52:	48 89 e5             	mov    rbp,rsp
    k_capslock=k_capslock==0?1:0;
  807d55:	0f b6 05 73 0b c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20b73]        # 4288cf <k_capslock>
  807d5c:	84 c0                	test   al,al
  807d5e:	0f 94 c0             	sete   al
  807d61:	88 05 68 0b c2 ff    	mov    BYTE PTR [rip+0xffffffffffc20b68],al        # 4288cf <k_capslock>
}
  807d67:	90                   	nop
  807d68:	5d                   	pop    rbp
  807d69:	c3                   	ret    

0000000000807d6a <to_ascii>:
char to_ascii(char scan_code)
{
  807d6a:	f3 0f 1e fa          	endbr64 
  807d6e:	55                   	push   rbp
  807d6f:	48 89 e5             	mov    rbp,rsp
  807d72:	89 f8                	mov    eax,edi
  807d74:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  807d77:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  807d7e:	e9 c7 00 00 00       	jmp    807e4a <to_ascii+0xe0>
        if(key_map[i].scan_code==scan_code)
  807d83:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807d86:	48 63 d0             	movsxd rdx,eax
  807d89:	48 89 d0             	mov    rax,rdx
  807d8c:	48 c1 e0 02          	shl    rax,0x2
  807d90:	48 01 d0             	add    rax,rdx
  807d93:	48 05 62 41 81 00    	add    rax,0x814162
  807d99:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807d9c:	38 45 ec             	cmp    BYTE PTR [rbp-0x14],al
  807d9f:	0f 85 a1 00 00 00    	jne    807e46 <to_ascii+0xdc>
        {
            if(k_capslock&&key_map[i].ascii>='a'&&key_map[i].ascii<='z')return key_map[i].ascii_shift;
  807da5:	0f b6 05 23 0b c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20b23]        # 4288cf <k_capslock>
  807dac:	84 c0                	test   al,al
  807dae:	74 55                	je     807e05 <to_ascii+0x9b>
  807db0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807db3:	48 63 d0             	movsxd rdx,eax
  807db6:	48 89 d0             	mov    rax,rdx
  807db9:	48 c1 e0 02          	shl    rax,0x2
  807dbd:	48 01 d0             	add    rax,rdx
  807dc0:	48 05 60 41 81 00    	add    rax,0x814160
  807dc6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807dc9:	3c 60                	cmp    al,0x60
  807dcb:	7e 38                	jle    807e05 <to_ascii+0x9b>
  807dcd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807dd0:	48 63 d0             	movsxd rdx,eax
  807dd3:	48 89 d0             	mov    rax,rdx
  807dd6:	48 c1 e0 02          	shl    rax,0x2
  807dda:	48 01 d0             	add    rax,rdx
  807ddd:	48 05 60 41 81 00    	add    rax,0x814160
  807de3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807de6:	3c 7a                	cmp    al,0x7a
  807de8:	7f 1b                	jg     807e05 <to_ascii+0x9b>
  807dea:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807ded:	48 63 d0             	movsxd rdx,eax
  807df0:	48 89 d0             	mov    rax,rdx
  807df3:	48 c1 e0 02          	shl    rax,0x2
  807df7:	48 01 d0             	add    rax,rdx
  807dfa:	48 05 61 41 81 00    	add    rax,0x814161
  807e00:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807e03:	eb 54                	jmp    807e59 <to_ascii+0xef>
            else if(k_shift)return key_map[i].ascii_shift;
  807e05:	0f b6 05 c1 0a c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20ac1]        # 4288cd <k_shift>
  807e0c:	84 c0                	test   al,al
  807e0e:	74 1b                	je     807e2b <to_ascii+0xc1>
  807e10:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807e13:	48 63 d0             	movsxd rdx,eax
  807e16:	48 89 d0             	mov    rax,rdx
  807e19:	48 c1 e0 02          	shl    rax,0x2
  807e1d:	48 01 d0             	add    rax,rdx
  807e20:	48 05 61 41 81 00    	add    rax,0x814161
  807e26:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807e29:	eb 2e                	jmp    807e59 <to_ascii+0xef>
            else return key_map[i].ascii;
  807e2b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807e2e:	48 63 d0             	movsxd rdx,eax
  807e31:	48 89 d0             	mov    rax,rdx
  807e34:	48 c1 e0 02          	shl    rax,0x2
  807e38:	48 01 d0             	add    rax,rdx
  807e3b:	48 05 60 41 81 00    	add    rax,0x814160
  807e41:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807e44:	eb 13                	jmp    807e59 <to_ascii+0xef>
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  807e46:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807e4a:	83 7d fc 5d          	cmp    DWORD PTR [rbp-0x4],0x5d
  807e4e:	0f 8e 2f ff ff ff    	jle    807d83 <to_ascii+0x19>
        }

    return '\0';
  807e54:	b8 00 00 00 00       	mov    eax,0x0
}
  807e59:	5d                   	pop    rbp
  807e5a:	c3                   	ret    

0000000000807e5b <init_kb>:
int init_kb()
{
  807e5b:	f3 0f 1e fa          	endbr64 
  807e5f:	55                   	push   rbp
  807e60:	48 89 e5             	mov    rbp,rsp
    reg_device(&dev_keyboard);
  807e63:	bf a0 40 81 00       	mov    edi,0x8140a0
  807e68:	e8 66 a7 ff ff       	call   8025d3 <reg_device>
    reg_driver(&drv_keyboard);
  807e6d:	bf 00 40 81 00       	mov    edi,0x814000
  807e72:	e8 44 aa ff ff       	call   8028bb <reg_driver>
}
  807e77:	90                   	nop
  807e78:	5d                   	pop    rbp
  807e79:	c3                   	ret    

0000000000807e7a <key_proc>:
int key_proc()
{
  807e7a:	f3 0f 1e fa          	endbr64 
  807e7e:	55                   	push   rbp
  807e7f:	48 89 e5             	mov    rbp,rsp
  807e82:	48 83 ec 10          	sub    rsp,0x10
    asm volatile("cli");
  807e86:	fa                   	cli    
    //获取完整的扫描码
    u8 scan1=0,scan2=0,ch=0;
  807e87:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
  807e8b:	c6 45 fe 00          	mov    BYTE PTR [rbp-0x2],0x0
  807e8f:	c6 45 fd 00          	mov    BYTE PTR [rbp-0x3],0x0
    key_code tmpc;
    scan1=inb(0x60);
  807e93:	bf 60 00 00 00       	mov    edi,0x60
  807e98:	e8 7c dc ff ff       	call   805b19 <inb>
  807e9d:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
//    tmpc.scan_code2=scan2;
//    tmpc.ascii= ch;


//    ENQUEUE(key_bufq,tmpc)
    if((key_bufq.tail+1)%key_bufq.size!=key_bufq.head)
  807ea0:	8b 05 e6 44 00 00    	mov    eax,DWORD PTR [rip+0x44e6]        # 80c38c <key_bufq+0xc>
  807ea6:	83 c0 01             	add    eax,0x1
  807ea9:	8b 0d e1 44 00 00    	mov    ecx,DWORD PTR [rip+0x44e1]        # 80c390 <key_bufq+0x10>
  807eaf:	99                   	cdq    
  807eb0:	f7 f9                	idiv   ecx
  807eb2:	8b 05 d0 44 00 00    	mov    eax,DWORD PTR [rip+0x44d0]        # 80c388 <key_bufq+0x8>
  807eb8:	39 c2                	cmp    edx,eax
  807eba:	74 32                	je     807eee <key_proc+0x74>
    {
        key_bufq.data[key_bufq.tail]=scan1;
  807ebc:	48 8b 15 bd 44 00 00 	mov    rdx,QWORD PTR [rip+0x44bd]        # 80c380 <key_bufq>
  807ec3:	8b 05 c3 44 00 00    	mov    eax,DWORD PTR [rip+0x44c3]        # 80c38c <key_bufq+0xc>
  807ec9:	48 98                	cdqe   
  807ecb:	48 01 c2             	add    rdx,rax
  807ece:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  807ed2:	88 02                	mov    BYTE PTR [rdx],al
        key_bufq.tail=(key_bufq.tail+1)%key_bufq.size;
  807ed4:	8b 05 b2 44 00 00    	mov    eax,DWORD PTR [rip+0x44b2]        # 80c38c <key_bufq+0xc>
  807eda:	83 c0 01             	add    eax,0x1
  807edd:	8b 0d ad 44 00 00    	mov    ecx,DWORD PTR [rip+0x44ad]        # 80c390 <key_bufq+0x10>
  807ee3:	99                   	cdq    
  807ee4:	f7 f9                	idiv   ecx
  807ee6:	89 d0                	mov    eax,edx
  807ee8:	89 05 9e 44 00 00    	mov    DWORD PTR [rip+0x449e],eax        # 80c38c <key_bufq+0xc>
    }

    if(scan1==0x48)
  807eee:	80 7d ff 48          	cmp    BYTE PTR [rbp-0x1],0x48
  807ef2:	75 0a                	jne    807efe <key_proc+0x84>
        scr_up();
  807ef4:	b8 00 00 00 00       	mov    eax,0x0
  807ef9:	e8 12 ee ff ff       	call   806d10 <scr_up>
    if(scan1==0x50)
  807efe:	80 7d ff 50          	cmp    BYTE PTR [rbp-0x1],0x50
  807f02:	75 0a                	jne    807f0e <key_proc+0x94>
        scr_down();
  807f04:	b8 00 00 00 00       	mov    eax,0x0
  807f09:	e8 9c ee ff ff       	call   806daa <scr_down>
    switch (scan1)
  807f0e:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  807f12:	3d b6 00 00 00       	cmp    eax,0xb6
  807f17:	74 41                	je     807f5a <key_proc+0xe0>
  807f19:	3d b6 00 00 00       	cmp    eax,0xb6
  807f1e:	7f 5e                	jg     807f7e <key_proc+0x104>
  807f20:	3d aa 00 00 00       	cmp    eax,0xaa
  807f25:	74 33                	je     807f5a <key_proc+0xe0>
  807f27:	3d aa 00 00 00       	cmp    eax,0xaa
  807f2c:	7f 50                	jg     807f7e <key_proc+0x104>
  807f2e:	3d 9d 00 00 00       	cmp    eax,0x9d
  807f33:	74 31                	je     807f66 <key_proc+0xec>
  807f35:	3d 9d 00 00 00       	cmp    eax,0x9d
  807f3a:	7f 42                	jg     807f7e <key_proc+0x104>
  807f3c:	83 f8 3a             	cmp    eax,0x3a
  807f3f:	74 31                	je     807f72 <key_proc+0xf8>
  807f41:	83 f8 3a             	cmp    eax,0x3a
  807f44:	7f 38                	jg     807f7e <key_proc+0x104>
  807f46:	83 f8 36             	cmp    eax,0x36
  807f49:	74 0f                	je     807f5a <key_proc+0xe0>
  807f4b:	83 f8 36             	cmp    eax,0x36
  807f4e:	7f 2e                	jg     807f7e <key_proc+0x104>
  807f50:	83 f8 1d             	cmp    eax,0x1d
  807f53:	74 11                	je     807f66 <key_proc+0xec>
  807f55:	83 f8 2a             	cmp    eax,0x2a
  807f58:	75 24                	jne    807f7e <key_proc+0x104>
    {
        case 0x36:
        case 0x2a:
        case 0xaa:
        case 0xb6:
            shift();
  807f5a:	b8 00 00 00 00       	mov    eax,0x0
  807f5f:	e8 af fd ff ff       	call   807d13 <shift>
            break;
  807f64:	eb 19                	jmp    807f7f <key_proc+0x105>
        case 0x1d:
        case 0x9d:
            ctrl();
  807f66:	b8 00 00 00 00       	mov    eax,0x0
  807f6b:	e8 c0 fd ff ff       	call   807d30 <ctrl>
            break;
  807f70:	eb 0d                	jmp    807f7f <key_proc+0x105>
        case 0x3a:
            capslock();
  807f72:	b8 00 00 00 00       	mov    eax,0x0
  807f77:	e8 d1 fd ff ff       	call   807d4d <capslock>
            break;
  807f7c:	eb 01                	jmp    807f7f <key_proc+0x105>
        default:
            break;
  807f7e:	90                   	nop
//        //logf("%x\n",stdin.w_ptr);
//        //print_stdin();
//        //printchar(ch);
//        //flush_screen(0);*/
//    }
    eoi();
  807f7f:	b8 00 00 00 00       	mov    eax,0x0
  807f84:	e8 a5 db ff ff       	call   805b2e <eoi>
    asm volatile("leave\r\n iretq");
  807f89:	c9                   	leave  
  807f8a:	48 cf                	iretq  
}
  807f8c:	90                   	nop
  807f8d:	c9                   	leave  
  807f8e:	c3                   	ret    

0000000000807f8f <sys_analyse_key>:

char sys_analyse_key()
{
  807f8f:	f3 0f 1e fa          	endbr64 
  807f93:	55                   	push   rbp
  807f94:	48 89 e5             	mov    rbp,rsp
  807f97:	48 83 ec 30          	sub    rsp,0x30
    if(key_bufq.tail==key_bufq.head)return -1;
  807f9b:	8b 15 eb 43 00 00    	mov    edx,DWORD PTR [rip+0x43eb]        # 80c38c <key_bufq+0xc>
  807fa1:	8b 05 e1 43 00 00    	mov    eax,DWORD PTR [rip+0x43e1]        # 80c388 <key_bufq+0x8>
  807fa7:	39 c2                	cmp    edx,eax
  807fa9:	75 0a                	jne    807fb5 <sys_analyse_key+0x26>
  807fab:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807fb0:	e9 df 00 00 00       	jmp    808094 <sys_analyse_key+0x105>
    char c=key_buf[key_bufq.head];
  807fb5:	8b 05 cd 43 00 00    	mov    eax,DWORD PTR [rip+0x43cd]        # 80c388 <key_bufq+0x8>
  807fbb:	48 98                	cdqe   
  807fbd:	0f b6 80 c0 86 42 00 	movzx  eax,BYTE PTR [rax+0x4286c0]
  807fc4:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    key_bufq.head=(key_bufq.head+1)%key_bufq.size;
  807fc7:	8b 05 bb 43 00 00    	mov    eax,DWORD PTR [rip+0x43bb]        # 80c388 <key_bufq+0x8>
  807fcd:	83 c0 01             	add    eax,0x1
  807fd0:	8b 0d ba 43 00 00    	mov    ecx,DWORD PTR [rip+0x43ba]        # 80c390 <key_bufq+0x10>
  807fd6:	99                   	cdq    
  807fd7:	f7 f9                	idiv   ecx
  807fd9:	89 d0                	mov    eax,edx
  807fdb:	89 05 a7 43 00 00    	mov    DWORD PTR [rip+0x43a7],eax        # 80c388 <key_bufq+0x8>
//    QHEAD(key_bufq)=(QHEAD(key_bufq)+1)%QSIZE(key_bufq);
    printf("scan code:");
  807fe1:	bf 36 43 81 00       	mov    edi,0x814336
  807fe6:	b8 00 00 00 00       	mov    eax,0x0
  807feb:	e8 37 8d ff ff       	call   800d27 <printf>
    char res[33]={0};
  807ff0:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  807ff7:	00 
  807ff8:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  807fff:	00 
  808000:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  808007:	00 
  808008:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80800f:	00 
  808010:	c6 45 f0 00          	mov    BYTE PTR [rbp-0x10],0x0
    itoa(res,16,c);
  808014:	0f be 55 ff          	movsx  edx,BYTE PTR [rbp-0x1]
  808018:	48 8d 45 d0          	lea    rax,[rbp-0x30]
  80801c:	be 10 00 00 00       	mov    esi,0x10
  808021:	48 89 c7             	mov    rdi,rax
  808024:	e8 bf 8b ff ff       	call   800be8 <itoa>
    printf(res);
  808029:	48 8d 45 d0          	lea    rax,[rbp-0x30]
  80802d:	48 89 c7             	mov    rdi,rax
  808030:	b8 00 00 00 00       	mov    eax,0x0
  808035:	e8 ed 8c ff ff       	call   800d27 <printf>
    if(c&FLAG_BREAK){
  80803a:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  80803e:	79 16                	jns    808056 <sys_analyse_key+0xc7>
        printf("\n");
  808040:	bf 41 43 81 00       	mov    edi,0x814341
  808045:	b8 00 00 00 00       	mov    eax,0x0
  80804a:	e8 d8 8c ff ff       	call   800d27 <printf>
        return -1;
  80804f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808054:	eb 3e                	jmp    808094 <sys_analyse_key+0x105>
    }
    c= to_ascii(c&0x7f);
  808056:	0f be 45 ff          	movsx  eax,BYTE PTR [rbp-0x1]
  80805a:	83 e0 7f             	and    eax,0x7f
  80805d:	89 c7                	mov    edi,eax
  80805f:	e8 06 fd ff ff       	call   807d6a <to_ascii>
  808064:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    printf(" char:");
  808067:	bf 43 43 81 00       	mov    edi,0x814343
  80806c:	b8 00 00 00 00       	mov    eax,0x0
  808071:	e8 b1 8c ff ff       	call   800d27 <printf>
    putchar(c);
  808076:	0f be 45 ff          	movsx  eax,BYTE PTR [rbp-0x1]
  80807a:	89 c7                	mov    edi,eax
  80807c:	e8 7c 8c ff ff       	call   800cfd <putchar>
    printf("\n");
  808081:	bf 41 43 81 00       	mov    edi,0x814341
  808086:	b8 00 00 00 00       	mov    eax,0x0
  80808b:	e8 97 8c ff ff       	call   800d27 <printf>
    return c;
  808090:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  808094:	c9                   	leave  
  808095:	c3                   	ret    

0000000000808096 <init_disk>:
        .read=async_read_disk,
        .write=async_write_disk
};
int disks[4];//四块硬盘的dev号
int init_disk()
{
  808096:	f3 0f 1e fa          	endbr64 
  80809a:	55                   	push   rbp
  80809b:	48 89 e5             	mov    rbp,rsp
    //disk_devi= reg_device(&dev_disk);
    //disk_drvi= reg_driver(&drv_disk);
    //dev_disk.drv=&drv_disk;
    hd_iterate();
  80809e:	b8 00 00 00 00       	mov    eax,0x0
  8080a3:	e8 8d 09 00 00       	call   808a35 <hd_iterate>
    return 0;
  8080a8:	b8 00 00 00 00       	mov    eax,0x0
}
  8080ad:	5d                   	pop    rbp
  8080ae:	c3                   	ret    

00000000008080af <disk_int_handler_c>:

int disk_int_handler_c()
{
  8080af:	f3 0f 1e fa          	endbr64 
  8080b3:	55                   	push   rbp
  8080b4:	48 89 e5             	mov    rbp,rsp
  8080b7:	48 83 ec 20          	sub    rsp,0x20
    if(running_req==NULL)
  8080bb:	48 8b 05 1e 35 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2351e]        # 42b5e0 <running_req>
  8080c2:	48 85 c0             	test   rax,rax
  8080c5:	75 0a                	jne    8080d1 <disk_int_handler_c+0x22>
    {
        //printf("err:null running dreq\n");
        return 1;//同步读写硬盘
  8080c7:	b8 01 00 00 00       	mov    eax,0x1
  8080cc:	e9 a3 01 00 00       	jmp    808274 <disk_int_handler_c+0x1c5>
    }
    short *p=running_req->buf;
  8080d1:	48 8b 05 08 35 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23508]        # 42b5e0 <running_req>
  8080d8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8080dc:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int port=PORT_DISK_MAJOR;
  8080e0:	c7 45 f4 f0 01 00 00 	mov    DWORD PTR [rbp-0xc],0x1f0
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  8080e7:	48 8b 05 f2 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc234f2]        # 42b5e0 <running_req>
  8080ee:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8080f1:	83 f8 02             	cmp    eax,0x2
  8080f4:	74 0f                	je     808105 <disk_int_handler_c+0x56>
    running_req->disk==DISK_SLAVE_SLAVE)
  8080f6:	48 8b 05 e3 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc234e3]        # 42b5e0 <running_req>
  8080fd:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  808100:	83 f8 03             	cmp    eax,0x3
  808103:	75 07                	jne    80810c <disk_int_handler_c+0x5d>
        port=PORT_DISK_SLAVE;
  808105:	c7 45 f4 70 01 00 00 	mov    DWORD PTR [rbp-0xc],0x170
    if(running_req->func==DISKREQ_READ)
  80810c:	48 8b 05 cd 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc234cd]        # 42b5e0 <running_req>
  808113:	8b 00                	mov    eax,DWORD PTR [rax]
  808115:	85 c0                	test   eax,eax
  808117:	75 42                	jne    80815b <disk_int_handler_c+0xac>
    {
        ////printf("sys_read dist:%x\n",p);
        //读取
        for(int i=0;i<running_req->sec_n*256;i++)
  808119:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  808120:	eb 22                	jmp    808144 <disk_int_handler_c+0x95>
        {
            *p++=inw(port);
  808122:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808125:	0f b7 c0             	movzx  eax,ax
  808128:	89 c7                	mov    edi,eax
  80812a:	e8 f4 d9 ff ff       	call   805b23 <inw>
  80812f:	89 c2                	mov    edx,eax
  808131:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808135:	48 8d 48 02          	lea    rcx,[rax+0x2]
  808139:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80813d:	66 89 10             	mov    WORD PTR [rax],dx
        for(int i=0;i<running_req->sec_n*256;i++)
  808140:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  808144:	48 8b 05 95 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23495]        # 42b5e0 <running_req>
  80814b:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80814e:	c1 e0 08             	shl    eax,0x8
  808151:	39 45 f0             	cmp    DWORD PTR [rbp-0x10],eax
  808154:	7c cc                	jl     808122 <disk_int_handler_c+0x73>
  808156:	e9 ca 00 00 00       	jmp    808225 <disk_int_handler_c+0x176>
        }
    }else if(running_req->func==DISKREQ_WRITE)
  80815b:	48 8b 05 7e 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2347e]        # 42b5e0 <running_req>
  808162:	8b 00                	mov    eax,DWORD PTR [rax]
  808164:	83 f8 01             	cmp    eax,0x1
  808167:	75 42                	jne    8081ab <disk_int_handler_c+0xfc>
    {
        for(int i=0;i<running_req->sec_n*256;i++)
  808169:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  808170:	eb 25                	jmp    808197 <disk_int_handler_c+0xe8>
            outw(port,*p++);
  808172:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808176:	48 8d 50 02          	lea    rdx,[rax+0x2]
  80817a:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80817e:	0f b7 00             	movzx  eax,WORD PTR [rax]
  808181:	0f b7 d0             	movzx  edx,ax
  808184:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808187:	0f b7 c0             	movzx  eax,ax
  80818a:	89 d6                	mov    esi,edx
  80818c:	89 c7                	mov    edi,eax
  80818e:	e8 7a d9 ff ff       	call   805b0d <outw>
        for(int i=0;i<running_req->sec_n*256;i++)
  808193:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  808197:	48 8b 05 42 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23442]        # 42b5e0 <running_req>
  80819e:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  8081a1:	c1 e0 08             	shl    eax,0x8
  8081a4:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8081a7:	7c c9                	jl     808172 <disk_int_handler_c+0xc3>
  8081a9:	eb 7a                	jmp    808225 <disk_int_handler_c+0x176>
    }else if(running_req->func==DISKREQ_CHECK)
  8081ab:	48 8b 05 2e 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2342e]        # 42b5e0 <running_req>
  8081b2:	8b 00                	mov    eax,DWORD PTR [rax]
  8081b4:	83 f8 02             	cmp    eax,0x2
  8081b7:	75 34                	jne    8081ed <disk_int_handler_c+0x13e>
    {
        char stat=inb(port+7);
  8081b9:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8081bc:	83 c0 07             	add    eax,0x7
  8081bf:	0f b6 c0             	movzx  eax,al
  8081c2:	89 c7                	mov    edi,eax
  8081c4:	e8 50 d9 ff ff       	call   805b19 <inb>
  8081c9:	88 45 e7             	mov    BYTE PTR [rbp-0x19],al
        short dat=inw(port);
  8081cc:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8081cf:	0f b7 c0             	movzx  eax,ax
  8081d2:	89 c7                	mov    edi,eax
  8081d4:	e8 4a d9 ff ff       	call   805b23 <inw>
  8081d9:	66 89 45 e4          	mov    WORD PTR [rbp-0x1c],ax
        if(1)
        {
            running_req->result=DISK_CHK_OK;
  8081dd:	48 8b 05 fc 33 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc233fc]        # 42b5e0 <running_req>
  8081e4:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  8081eb:	eb 38                	jmp    808225 <disk_int_handler_c+0x176>
            char err=inb(port+1);//错误原因
            printf("checking disk err:%x\nresetting hd\n",err);
            running_req->result=DISK_CHK_ERR;
            request(running_req->disk,DISKREQ_RESET,0,0,0);
        }
    }else if(running_req->func==DISKREQ_RESET)
  8081ed:	48 8b 05 ec 33 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc233ec]        # 42b5e0 <running_req>
  8081f4:	8b 00                	mov    eax,DWORD PTR [rax]
  8081f6:	83 f8 03             	cmp    eax,0x3
  8081f9:	75 2a                	jne    808225 <disk_int_handler_c+0x176>
    {
        int stat=inb(port+7);
  8081fb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8081fe:	83 c0 07             	add    eax,0x7
  808201:	0f b6 c0             	movzx  eax,al
  808204:	89 c7                	mov    edi,eax
  808206:	e8 0e d9 ff ff       	call   805b19 <inb>
  80820b:	0f b6 c0             	movzx  eax,al
  80820e:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
        printf("reset disk done.\nstat now:%x\n",stat);
  808211:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808214:	89 c6                	mov    esi,eax
  808216:	bf 4a 43 81 00       	mov    edi,0x81434a
  80821b:	b8 00 00 00 00       	mov    eax,0x0
  808220:	e8 02 8b ff ff       	call   800d27 <printf>
    }
    running_req->stat=REQ_STAT_DONE;
  808225:	48 8b 05 b4 33 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc233b4]        # 42b5e0 <running_req>
  80822c:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  808233:	48 8b 05 a6 33 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc233a6]        # 42b5e0 <running_req>
  80823a:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  80823e:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  808245:	00 00 00 
    running_devman_req->stat=REQ_STAT_DONE;
  808248:	48 8b 05 99 33 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23399]        # 42b5e8 <running_devman_req>
  80824f:	c7 80 ac 00 00 00 03 	mov    DWORD PTR [rax+0xac],0x3
  808256:	00 00 00 
    running_devman_req=NULL;
  808259:	48 c7 05 84 33 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23384],0x0        # 42b5e8 <running_devman_req>
  808260:	00 00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  808264:	48 c7 05 71 33 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23371],0x0        # 42b5e0 <running_req>
  80826b:	00 00 00 00 
    return 0;
  80826f:	b8 00 00 00 00       	mov    eax,0x0
}
  808274:	c9                   	leave  
  808275:	c3                   	ret    

0000000000808276 <check_dreq_stat>:
int check_dreq_stat(int req_id)
{
  808276:	f3 0f 1e fa          	endbr64 
  80827a:	55                   	push   rbp
  80827b:	48 89 e5             	mov    rbp,rsp
  80827e:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return disk_reqs[req_id].stat;
  808281:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808284:	48 63 d0             	movsxd rdx,eax
  808287:	48 89 d0             	mov    rax,rdx
  80828a:	48 01 c0             	add    rax,rax
  80828d:	48 01 d0             	add    rax,rdx
  808290:	48 c1 e0 04          	shl    rax,0x4
  808294:	48 05 fc 88 42 00    	add    rax,0x4288fc
  80829a:	8b 00                	mov    eax,DWORD PTR [rax]
}
  80829c:	5d                   	pop    rbp
  80829d:	c3                   	ret    

000000000080829e <request>:
int request(int disk,int func,int lba,int secn,char *buf){
  80829e:	f3 0f 1e fa          	endbr64 
  8082a2:	55                   	push   rbp
  8082a3:	48 89 e5             	mov    rbp,rsp
  8082a6:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8082a9:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8082ac:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  8082af:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  8082b2:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    if((tail+1)%MAX_DISK_REQUEST_COUNT==head)
  8082b6:	8b 05 58 33 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23358]        # 42b614 <tail>
  8082bc:	83 c0 01             	add    eax,0x1
  8082bf:	48 63 d0             	movsxd rdx,eax
  8082c2:	48 69 d2 89 88 88 88 	imul   rdx,rdx,0xffffffff88888889
  8082c9:	48 c1 ea 20          	shr    rdx,0x20
  8082cd:	01 c2                	add    edx,eax
  8082cf:	c1 fa 07             	sar    edx,0x7
  8082d2:	89 c1                	mov    ecx,eax
  8082d4:	c1 f9 1f             	sar    ecx,0x1f
  8082d7:	29 ca                	sub    edx,ecx
  8082d9:	69 ca f0 00 00 00    	imul   ecx,edx,0xf0
  8082df:	29 c8                	sub    eax,ecx
  8082e1:	89 c2                	mov    edx,eax
  8082e3:	8b 05 27 33 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23327]        # 42b610 <head>
  8082e9:	39 c2                	cmp    edx,eax
  8082eb:	75 0a                	jne    8082f7 <request+0x59>
    {
        return -1;
  8082ed:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8082f2:	e9 0d 01 00 00       	jmp    808404 <request+0x166>
    }
    disk_reqs[tail].disk=disk;
  8082f7:	8b 05 17 33 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23317]        # 42b614 <tail>
  8082fd:	48 63 d0             	movsxd rdx,eax
  808300:	48 89 d0             	mov    rax,rdx
  808303:	48 01 c0             	add    rax,rax
  808306:	48 01 d0             	add    rax,rdx
  808309:	48 c1 e0 04          	shl    rax,0x4
  80830d:	48 8d 90 e4 88 42 00 	lea    rdx,[rax+0x4288e4]
  808314:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808317:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].func=func;
  808319:	8b 05 f5 32 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc232f5]        # 42b614 <tail>
  80831f:	48 63 d0             	movsxd rdx,eax
  808322:	48 89 d0             	mov    rax,rdx
  808325:	48 01 c0             	add    rax,rax
  808328:	48 01 d0             	add    rax,rdx
  80832b:	48 c1 e0 04          	shl    rax,0x4
  80832f:	48 8d 90 e0 88 42 00 	lea    rdx,[rax+0x4288e0]
  808336:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808339:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].lba=lba;
  80833b:	8b 05 d3 32 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc232d3]        # 42b614 <tail>
  808341:	48 63 d0             	movsxd rdx,eax
  808344:	48 89 d0             	mov    rax,rdx
  808347:	48 01 c0             	add    rax,rax
  80834a:	48 01 d0             	add    rax,rdx
  80834d:	48 c1 e0 04          	shl    rax,0x4
  808351:	48 8d 90 e8 88 42 00 	lea    rdx,[rax+0x4288e8]
  808358:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80835b:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].sec_n=secn;
  80835d:	8b 05 b1 32 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc232b1]        # 42b614 <tail>
  808363:	48 63 d0             	movsxd rdx,eax
  808366:	48 89 d0             	mov    rax,rdx
  808369:	48 01 c0             	add    rax,rax
  80836c:	48 01 d0             	add    rax,rdx
  80836f:	48 c1 e0 04          	shl    rax,0x4
  808373:	48 8d 90 ec 88 42 00 	lea    rdx,[rax+0x4288ec]
  80837a:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80837d:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].stat=REQ_STAT_READY;
  80837f:	8b 05 8f 32 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2328f]        # 42b614 <tail>
  808385:	48 63 d0             	movsxd rdx,eax
  808388:	48 89 d0             	mov    rax,rdx
  80838b:	48 01 c0             	add    rax,rax
  80838e:	48 01 d0             	add    rax,rdx
  808391:	48 c1 e0 04          	shl    rax,0x4
  808395:	48 05 fc 88 42 00    	add    rax,0x4288fc
  80839b:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    disk_reqs[tail].buf=buf;
  8083a1:	8b 05 6d 32 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2326d]        # 42b614 <tail>
  8083a7:	48 63 d0             	movsxd rdx,eax
  8083aa:	48 89 d0             	mov    rax,rdx
  8083ad:	48 01 c0             	add    rax,rax
  8083b0:	48 01 d0             	add    rax,rdx
  8083b3:	48 c1 e0 04          	shl    rax,0x4
  8083b7:	48 8d 90 f0 88 42 00 	lea    rdx,[rax+0x4288f0]
  8083be:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8083c2:	48 89 02             	mov    QWORD PTR [rdx],rax
    int r=tail;
  8083c5:	8b 05 49 32 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23249]        # 42b614 <tail>
  8083cb:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    tail=(tail+1)%MAX_DISK_REQUEST_COUNT;
  8083ce:	8b 05 40 32 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23240]        # 42b614 <tail>
  8083d4:	8d 50 01             	lea    edx,[rax+0x1]
  8083d7:	48 63 c2             	movsxd rax,edx
  8083da:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  8083e1:	48 c1 e8 20          	shr    rax,0x20
  8083e5:	01 d0                	add    eax,edx
  8083e7:	c1 f8 07             	sar    eax,0x7
  8083ea:	89 d1                	mov    ecx,edx
  8083ec:	c1 f9 1f             	sar    ecx,0x1f
  8083ef:	29 c8                	sub    eax,ecx
  8083f1:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  8083f7:	89 d0                	mov    eax,edx
  8083f9:	29 c8                	sub    eax,ecx
  8083fb:	89 05 13 32 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc23213],eax        # 42b614 <tail>
    return r;
  808401:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  808404:	5d                   	pop    rbp
  808405:	c3                   	ret    

0000000000808406 <execute_request>:
int execute_request(){
  808406:	f3 0f 1e fa          	endbr64 
  80840a:	55                   	push   rbp
  80840b:	48 89 e5             	mov    rbp,rsp
  80840e:	48 83 ec 10          	sub    rsp,0x10
    //查看是否有已经在运行的请求
    if(running_req!=NULL)
  808412:	48 8b 05 c7 31 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc231c7]        # 42b5e0 <running_req>
  808419:	48 85 c0             	test   rax,rax
  80841c:	74 6a                	je     808488 <execute_request+0x82>
    {
        running_req->time++;
  80841e:	48 8b 05 bb 31 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc231bb]        # 42b5e0 <running_req>
  808425:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  808428:	83 c2 01             	add    edx,0x1
  80842b:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
        if(running_req->func!=DISKREQ_CHECK)
  80842e:	48 8b 05 ab 31 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc231ab]        # 42b5e0 <running_req>
  808435:	8b 00                	mov    eax,DWORD PTR [rax]
  808437:	83 f8 02             	cmp    eax,0x2
  80843a:	74 0a                	je     808446 <execute_request+0x40>
            return 2;
  80843c:	b8 02 00 00 00       	mov    eax,0x2
  808441:	e9 b4 01 00 00       	jmp    8085fa <execute_request+0x1f4>
        if(running_req->time>MAX_DISK_CHKTIME)
  808446:	48 8b 05 93 31 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23193]        # 42b5e0 <running_req>
  80844d:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  808450:	83 f8 0a             	cmp    eax,0xa
  808453:	7e 29                	jle    80847e <execute_request+0x78>
        {
            //检测硬盘超时，视为没有硬盘连接
            running_req->result=DISK_CHK_ERR;
  808455:	48 8b 05 84 31 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23184]        # 42b5e0 <running_req>
  80845c:	c7 40 20 02 00 00 00 	mov    DWORD PTR [rax+0x20],0x2
            running_req->stat=REQ_STAT_DONE;
  808463:	48 8b 05 76 31 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23176]        # 42b5e0 <running_req>
  80846a:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
            running_req=NULL;
  808471:	48 c7 05 64 31 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23164],0x0        # 42b5e0 <running_req>
  808478:	00 00 00 00 
  80847c:	eb 0a                	jmp    808488 <execute_request+0x82>
        }else
        {
            //未到时间继续等待
            return 2;
  80847e:	b8 02 00 00 00       	mov    eax,0x2
  808483:	e9 72 01 00 00       	jmp    8085fa <execute_request+0x1f4>
        }
    }
    if(head==tail)return 1;//检查是否为空
  808488:	8b 15 82 31 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc23182]        # 42b610 <head>
  80848e:	8b 05 80 31 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23180]        # 42b614 <tail>
  808494:	39 c2                	cmp    edx,eax
  808496:	75 0a                	jne    8084a2 <execute_request+0x9c>
  808498:	b8 01 00 00 00       	mov    eax,0x1
  80849d:	e9 58 01 00 00       	jmp    8085fa <execute_request+0x1f4>
    running_req=&disk_reqs[head];
  8084a2:	8b 05 68 31 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23168]        # 42b610 <head>
  8084a8:	48 63 d0             	movsxd rdx,eax
  8084ab:	48 89 d0             	mov    rax,rdx
  8084ae:	48 01 c0             	add    rax,rax
  8084b1:	48 01 d0             	add    rax,rdx
  8084b4:	48 c1 e0 04          	shl    rax,0x4
  8084b8:	48 05 e0 88 42 00    	add    rax,0x4288e0
  8084be:	48 89 05 1b 31 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2311b],rax        # 42b5e0 <running_req>
    head=(head+1)%MAX_DISK_REQUEST_COUNT;
  8084c5:	8b 05 45 31 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23145]        # 42b610 <head>
  8084cb:	8d 50 01             	lea    edx,[rax+0x1]
  8084ce:	48 63 c2             	movsxd rax,edx
  8084d1:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  8084d8:	48 c1 e8 20          	shr    rax,0x20
  8084dc:	01 d0                	add    eax,edx
  8084de:	c1 f8 07             	sar    eax,0x7
  8084e1:	89 d1                	mov    ecx,edx
  8084e3:	c1 f9 1f             	sar    ecx,0x1f
  8084e6:	29 c8                	sub    eax,ecx
  8084e8:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  8084ee:	89 d0                	mov    eax,edx
  8084f0:	29 c8                	sub    eax,ecx
  8084f2:	89 05 18 31 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc23118],eax        # 42b610 <head>
    running_req->stat=REQ_STAT_WORKING;
  8084f8:	48 8b 05 e1 30 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc230e1]        # 42b5e0 <running_req>
  8084ff:	c7 40 1c 02 00 00 00 	mov    DWORD PTR [rax+0x1c],0x2
    //set_proc_stat(running_req->pid,SUSPENDED);
    int r=0;
  808506:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    switch (running_req->func)
  80850d:	48 8b 05 cc 30 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc230cc]        # 42b5e0 <running_req>
  808514:	8b 00                	mov    eax,DWORD PTR [rax]
  808516:	83 f8 03             	cmp    eax,0x3
  808519:	0f 84 ad 00 00 00    	je     8085cc <execute_request+0x1c6>
  80851f:	83 f8 03             	cmp    eax,0x3
  808522:	0f 8f bf 00 00 00    	jg     8085e7 <execute_request+0x1e1>
  808528:	83 f8 02             	cmp    eax,0x2
  80852b:	0f 84 85 00 00 00    	je     8085b6 <execute_request+0x1b0>
  808531:	83 f8 02             	cmp    eax,0x2
  808534:	0f 8f ad 00 00 00    	jg     8085e7 <execute_request+0x1e1>
  80853a:	85 c0                	test   eax,eax
  80853c:	74 0a                	je     808548 <execute_request+0x142>
  80853e:	83 f8 01             	cmp    eax,0x1
  808541:	74 3c                	je     80857f <execute_request+0x179>
        break;
    case DISKREQ_RESET:
        r=async_reset_disk(running_req->disk);
        break;
    default:
        break;
  808543:	e9 9f 00 00 00       	jmp    8085e7 <execute_request+0x1e1>
        running_req->lba,running_req->sec_n,running_req->buf);
  808548:	48 8b 05 91 30 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23091]        # 42b5e0 <running_req>
        r=async_read_disk(running_req->disk,\
  80854f:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
        running_req->lba,running_req->sec_n,running_req->buf);
  808553:	48 8b 05 86 30 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23086]        # 42b5e0 <running_req>
        r=async_read_disk(running_req->disk,\
  80855a:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
        running_req->lba,running_req->sec_n,running_req->buf);
  80855d:	48 8b 05 7c 30 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2307c]        # 42b5e0 <running_req>
  808564:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_read_disk(running_req->disk,\
  808567:	89 c6                	mov    esi,eax
  808569:	48 8b 05 70 30 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23070]        # 42b5e0 <running_req>
  808570:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808573:	89 c7                	mov    edi,eax
  808575:	e8 a7 00 00 00       	call   808621 <async_read_disk>
  80857a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  80857d:	eb 69                	jmp    8085e8 <execute_request+0x1e2>
         running_req->lba,running_req->sec_n,running_req->buf);
  80857f:	48 8b 05 5a 30 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2305a]        # 42b5e0 <running_req>
        r=async_write_disk(running_req->disk,\
  808586:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
         running_req->lba,running_req->sec_n,running_req->buf);
  80858a:	48 8b 05 4f 30 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2304f]        # 42b5e0 <running_req>
        r=async_write_disk(running_req->disk,\
  808591:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
         running_req->lba,running_req->sec_n,running_req->buf);
  808594:	48 8b 05 45 30 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23045]        # 42b5e0 <running_req>
  80859b:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_write_disk(running_req->disk,\
  80859e:	89 c6                	mov    esi,eax
  8085a0:	48 8b 05 39 30 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23039]        # 42b5e0 <running_req>
  8085a7:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8085aa:	89 c7                	mov    edi,eax
  8085ac:	e8 88 01 00 00       	call   808739 <async_write_disk>
  8085b1:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  8085b4:	eb 32                	jmp    8085e8 <execute_request+0x1e2>
        r=async_check_disk(running_req->disk);
  8085b6:	48 8b 05 23 30 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23023]        # 42b5e0 <running_req>
  8085bd:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8085c0:	89 c7                	mov    edi,eax
  8085c2:	e8 8f 06 00 00       	call   808c56 <async_check_disk>
  8085c7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  8085ca:	eb 1c                	jmp    8085e8 <execute_request+0x1e2>
        r=async_reset_disk(running_req->disk);
  8085cc:	48 8b 05 0d 30 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2300d]        # 42b5e0 <running_req>
  8085d3:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8085d6:	89 c7                	mov    edi,eax
  8085d8:	b8 00 00 00 00       	mov    eax,0x0
  8085dd:	e8 1a 00 00 00       	call   8085fc <async_reset_disk>
  8085e2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  8085e5:	eb 01                	jmp    8085e8 <execute_request+0x1e2>
        break;
  8085e7:	90                   	nop
    }
    if(r==-1)return -1;
  8085e8:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  8085ec:	75 07                	jne    8085f5 <execute_request+0x1ef>
  8085ee:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8085f3:	eb 05                	jmp    8085fa <execute_request+0x1f4>
    return 0;
  8085f5:	b8 00 00 00 00       	mov    eax,0x0
}
  8085fa:	c9                   	leave  
  8085fb:	c3                   	ret    

00000000008085fc <async_reset_disk>:
int async_reset_disk(int disk)
{
  8085fc:	f3 0f 1e fa          	endbr64 
  808600:	55                   	push   rbp
  808601:	48 89 e5             	mov    rbp,rsp
  808604:	48 83 ec 10          	sub    rsp,0x10
  808608:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    outb(PORT_DISK_CONTROL,DISK_CMD_RESET);
  80860b:	be 0c 00 00 00       	mov    esi,0xc
  808610:	bf f6 03 00 00       	mov    edi,0x3f6
  808615:	e8 e6 d4 ff ff       	call   805b00 <outb>
    return 0;
  80861a:	b8 00 00 00 00       	mov    eax,0x0
}
  80861f:	c9                   	leave  
  808620:	c3                   	ret    

0000000000808621 <async_read_disk>:
int async_read_disk(int disk,unsigned int lba,int sec_n,char* mem_addr)
{
  808621:	f3 0f 1e fa          	endbr64 
  808625:	55                   	push   rbp
  808626:	48 89 e5             	mov    rbp,rsp
  808629:	48 83 ec 30          	sub    rsp,0x30
  80862d:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  808630:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  808633:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  808636:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  80863a:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  808640:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  808647:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  80864b:	74 06                	je     808653 <async_read_disk+0x32>
  80864d:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  808651:	75 06                	jne    808659 <async_read_disk+0x38>
        port=PORT_DISK_SLAVE;
  808653:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  808659:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  80865d:	74 06                	je     808665 <async_read_disk+0x44>
  80865f:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  808663:	75 07                	jne    80866c <async_read_disk+0x4b>
        slave_disk=1;
  808665:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    outb(port+2,sec_n);
  80866c:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80866f:	0f b6 d0             	movzx  edx,al
  808672:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808676:	83 c0 02             	add    eax,0x2
  808679:	0f b7 c0             	movzx  eax,ax
  80867c:	89 d6                	mov    esi,edx
  80867e:	89 c7                	mov    edi,eax
  808680:	e8 7b d4 ff ff       	call   805b00 <outb>
    outb(port+3,lba&0xff);
  808685:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808688:	0f b6 d0             	movzx  edx,al
  80868b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80868f:	83 c0 03             	add    eax,0x3
  808692:	0f b7 c0             	movzx  eax,ax
  808695:	89 d6                	mov    esi,edx
  808697:	89 c7                	mov    edi,eax
  808699:	e8 62 d4 ff ff       	call   805b00 <outb>
    outb(port+4,(lba>>8)&0xff);
  80869e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8086a1:	c1 e8 08             	shr    eax,0x8
  8086a4:	0f b6 d0             	movzx  edx,al
  8086a7:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8086ab:	83 c0 04             	add    eax,0x4
  8086ae:	0f b7 c0             	movzx  eax,ax
  8086b1:	89 d6                	mov    esi,edx
  8086b3:	89 c7                	mov    edi,eax
  8086b5:	e8 46 d4 ff ff       	call   805b00 <outb>
    outb(port+5,(lba>>16)&0xff);
  8086ba:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8086bd:	c1 e8 10             	shr    eax,0x10
  8086c0:	0f b6 d0             	movzx  edx,al
  8086c3:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8086c7:	83 c0 05             	add    eax,0x5
  8086ca:	0f b7 c0             	movzx  eax,ax
  8086cd:	89 d6                	mov    esi,edx
  8086cf:	89 c7                	mov    edi,eax
  8086d1:	e8 2a d4 ff ff       	call   805b00 <outb>
    char drv=slave_disk?0x10:0;
  8086d6:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  8086da:	74 07                	je     8086e3 <async_read_disk+0xc2>
  8086dc:	b8 10 00 00 00       	mov    eax,0x10
  8086e1:	eb 05                	jmp    8086e8 <async_read_disk+0xc7>
  8086e3:	b8 00 00 00 00       	mov    eax,0x0
  8086e8:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
    char lba_hi=(lba>>24)&0xf|drv|0xe0;
  8086eb:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8086ee:	c1 e8 18             	shr    eax,0x18
  8086f1:	83 e0 0f             	and    eax,0xf
  8086f4:	89 c2                	mov    edx,eax
  8086f6:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  8086fa:	09 d0                	or     eax,edx
  8086fc:	83 c8 e0             	or     eax,0xffffffe0
  8086ff:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
    outb(port+6,lba_hi);
  808702:	0f b6 45 f6          	movzx  eax,BYTE PTR [rbp-0xa]
  808706:	0f b6 d0             	movzx  edx,al
  808709:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80870d:	83 c0 06             	add    eax,0x6
  808710:	0f b7 c0             	movzx  eax,ax
  808713:	89 d6                	mov    esi,edx
  808715:	89 c7                	mov    edi,eax
  808717:	e8 e4 d3 ff ff       	call   805b00 <outb>
    outb(port+7,DISK_CMD_READ);
  80871c:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808720:	83 c0 07             	add    eax,0x7
  808723:	0f b7 c0             	movzx  eax,ax
  808726:	be 20 00 00 00       	mov    esi,0x20
  80872b:	89 c7                	mov    edi,eax
  80872d:	e8 ce d3 ff ff       	call   805b00 <outb>
    // }
    // for(int i=0;i<running_req->sec_n*256;i++)
    // {
    //     *mem_addr++=inw(port);
    // }
    return 0;
  808732:	b8 00 00 00 00       	mov    eax,0x0
}
  808737:	c9                   	leave  
  808738:	c3                   	ret    

0000000000808739 <async_write_disk>:
int async_write_disk(int disk,unsigned int lba, int sec_n, char* mem_ptr)
{
  808739:	f3 0f 1e fa          	endbr64 
  80873d:	55                   	push   rbp
  80873e:	48 89 e5             	mov    rbp,rsp
  808741:	48 83 ec 30          	sub    rsp,0x30
  808745:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  808748:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80874b:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  80874e:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  808752:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  808758:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  80875f:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  808763:	74 06                	je     80876b <async_write_disk+0x32>
  808765:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  808769:	75 06                	jne    808771 <async_write_disk+0x38>
        port=PORT_DISK_SLAVE;
  80876b:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  808771:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  808775:	74 06                	je     80877d <async_write_disk+0x44>
  808777:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  80877b:	75 07                	jne    808784 <async_write_disk+0x4b>
        slave_disk=1;
  80877d:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    while (1)
    {
        byte t=inb(0x1f7);
  808784:	bf f7 00 00 00       	mov    edi,0xf7
  808789:	e8 8b d3 ff ff       	call   805b19 <inb>
  80878e:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
        //logf("istat:%x",t);
        byte err=t&1;
  808791:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  808795:	83 e0 01             	and    eax,0x1
  808798:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
        if(err!=0)
  80879b:	80 7d f6 00          	cmp    BYTE PTR [rbp-0xa],0x0
  80879f:	74 0a                	je     8087ab <async_write_disk+0x72>
        {
            //printf("ERR iwriting disk\n");
            return -1;
  8087a1:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8087a6:	e9 d5 00 00 00       	jmp    808880 <async_write_disk+0x147>
        }
        t&=0x88;
  8087ab:	80 65 f7 88          	and    BYTE PTR [rbp-0x9],0x88
        if(t==0x8)break;
  8087af:	80 7d f7 08          	cmp    BYTE PTR [rbp-0x9],0x8
  8087b3:	74 02                	je     8087b7 <async_write_disk+0x7e>
    {
  8087b5:	eb cd                	jmp    808784 <async_write_disk+0x4b>
        if(t==0x8)break;
  8087b7:	90                   	nop
    }
    outb(port+2,sec_n);
  8087b8:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8087bb:	0f b6 d0             	movzx  edx,al
  8087be:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8087c2:	83 c0 02             	add    eax,0x2
  8087c5:	0f b7 c0             	movzx  eax,ax
  8087c8:	89 d6                	mov    esi,edx
  8087ca:	89 c7                	mov    edi,eax
  8087cc:	e8 2f d3 ff ff       	call   805b00 <outb>
    outb(port+3,lba&0xff);
  8087d1:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8087d4:	0f b6 d0             	movzx  edx,al
  8087d7:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8087db:	83 c0 03             	add    eax,0x3
  8087de:	0f b7 c0             	movzx  eax,ax
  8087e1:	89 d6                	mov    esi,edx
  8087e3:	89 c7                	mov    edi,eax
  8087e5:	e8 16 d3 ff ff       	call   805b00 <outb>
    outb(port+4,(lba>>8)&0xff);
  8087ea:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8087ed:	c1 e8 08             	shr    eax,0x8
  8087f0:	0f b6 d0             	movzx  edx,al
  8087f3:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8087f7:	83 c0 04             	add    eax,0x4
  8087fa:	0f b7 c0             	movzx  eax,ax
  8087fd:	89 d6                	mov    esi,edx
  8087ff:	89 c7                	mov    edi,eax
  808801:	e8 fa d2 ff ff       	call   805b00 <outb>
    outb(port+5,(lba>>16)&0xff);
  808806:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808809:	c1 e8 10             	shr    eax,0x10
  80880c:	0f b6 d0             	movzx  edx,al
  80880f:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808813:	83 c0 05             	add    eax,0x5
  808816:	0f b7 c0             	movzx  eax,ax
  808819:	89 d6                	mov    esi,edx
  80881b:	89 c7                	mov    edi,eax
  80881d:	e8 de d2 ff ff       	call   805b00 <outb>
    char drv=slave_disk?0x10:0;
  808822:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  808826:	74 07                	je     80882f <async_write_disk+0xf6>
  808828:	b8 10 00 00 00       	mov    eax,0x10
  80882d:	eb 05                	jmp    808834 <async_write_disk+0xfb>
  80882f:	b8 00 00 00 00       	mov    eax,0x0
  808834:	88 45 f5             	mov    BYTE PTR [rbp-0xb],al
    unsigned char lba_hi=(lba>>24)&0xf|drv|0xe0;
  808837:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80883a:	c1 e8 18             	shr    eax,0x18
  80883d:	83 e0 0f             	and    eax,0xf
  808840:	89 c2                	mov    edx,eax
  808842:	0f b6 45 f5          	movzx  eax,BYTE PTR [rbp-0xb]
  808846:	09 d0                	or     eax,edx
  808848:	83 c8 e0             	or     eax,0xffffffe0
  80884b:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    outb(port+6,lba_hi);
  80884e:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  808852:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808856:	83 c0 06             	add    eax,0x6
  808859:	0f b7 c0             	movzx  eax,ax
  80885c:	89 d6                	mov    esi,edx
  80885e:	89 c7                	mov    edi,eax
  808860:	e8 9b d2 ff ff       	call   805b00 <outb>
    outb(port+7,DISK_CMD_WRITE);
  808865:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808869:	83 c0 07             	add    eax,0x7
  80886c:	0f b7 c0             	movzx  eax,ax
  80886f:	be 30 00 00 00       	mov    esi,0x30
  808874:	89 c7                	mov    edi,eax
  808876:	e8 85 d2 ff ff       	call   805b00 <outb>
    //     if(t==0x8)break;
    // }
    // short *p=mem_ptr;
    // for(int i=0;i<running_req->sec_n*256;i++)
    //         outw(port,*p++);
    return 0;
  80887b:	b8 00 00 00 00       	mov    eax,0x0
}
  808880:	c9                   	leave  
  808881:	c3                   	ret    

0000000000808882 <read_disk>:
int read_disk(driver_args* args)
{
  808882:	f3 0f 1e fa          	endbr64 
  808886:	55                   	push   rbp
  808887:	48 89 e5             	mov    rbp,rsp
  80888a:	48 83 ec 20          	sub    rsp,0x20
  80888e:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=read_disk_asm(args->lba,args->sec_c,args->dist_addr);
  808892:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808896:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808899:	48 98                	cdqe   
  80889b:	48 89 c2             	mov    rdx,rax
  80889e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8088a2:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  8088a5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8088a9:	8b 00                	mov    eax,DWORD PTR [rax]
  8088ab:	89 ce                	mov    esi,ecx
  8088ad:	89 c7                	mov    edi,eax
  8088af:	e8 88 05 00 00       	call   808e3c <read_disk_asm>
  8088b4:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  8088b7:	48 8b 05 22 2d c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22d22]        # 42b5e0 <running_req>
  8088be:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  8088c5:	48 8b 05 14 2d c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22d14]        # 42b5e0 <running_req>
  8088cc:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  8088d0:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  8088d7:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  8088da:	48 c7 05 fb 2c c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22cfb],0x0        # 42b5e0 <running_req>
  8088e1:	00 00 00 00 
    return ret;
  8088e5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8088e8:	c9                   	leave  
  8088e9:	c3                   	ret    

00000000008088ea <write_disk>:
int write_disk(driver_args* args)
{
  8088ea:	f3 0f 1e fa          	endbr64 
  8088ee:	55                   	push   rbp
  8088ef:	48 89 e5             	mov    rbp,rsp
  8088f2:	48 83 ec 20          	sub    rsp,0x20
  8088f6:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=write_disk_asm(args->lba,args->sec_c,args->src_addr);
  8088fa:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8088fe:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808901:	48 98                	cdqe   
  808903:	48 89 c2             	mov    rdx,rax
  808906:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80890a:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  80890d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808911:	8b 00                	mov    eax,DWORD PTR [rax]
  808913:	89 ce                	mov    esi,ecx
  808915:	89 c7                	mov    edi,eax
  808917:	e8 a0 05 00 00       	call   808ebc <write_disk_asm>
  80891c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  80891f:	48 8b 05 ba 2c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22cba]        # 42b5e0 <running_req>
  808926:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  80892d:	48 8b 05 ac 2c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22cac]        # 42b5e0 <running_req>
  808934:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  808938:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  80893f:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  808942:	48 c7 05 93 2c c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22c93],0x0        # 42b5e0 <running_req>
  808949:	00 00 00 00 
    return ret;
  80894d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  808950:	c9                   	leave  
  808951:	c3                   	ret    

0000000000808952 <chk_result>:
int chk_result(int r)
{
  808952:	f3 0f 1e fa          	endbr64 
  808956:	55                   	push   rbp
  808957:	48 89 e5             	mov    rbp,rsp
  80895a:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(disk_reqs[r].stat!=REQ_STAT_DONE);
  80895d:	90                   	nop
  80895e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808961:	48 63 d0             	movsxd rdx,eax
  808964:	48 89 d0             	mov    rax,rdx
  808967:	48 01 c0             	add    rax,rax
  80896a:	48 01 d0             	add    rax,rdx
  80896d:	48 c1 e0 04          	shl    rax,0x4
  808971:	48 05 fc 88 42 00    	add    rax,0x4288fc
  808977:	8b 00                	mov    eax,DWORD PTR [rax]
  808979:	83 f8 03             	cmp    eax,0x3
  80897c:	75 e0                	jne    80895e <chk_result+0xc>
    return disk_reqs[r].result==DISK_CHK_OK?1:0;
  80897e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808981:	48 63 d0             	movsxd rdx,eax
  808984:	48 89 d0             	mov    rax,rdx
  808987:	48 01 c0             	add    rax,rax
  80898a:	48 01 d0             	add    rax,rdx
  80898d:	48 c1 e0 04          	shl    rax,0x4
  808991:	48 05 00 89 42 00    	add    rax,0x428900
  808997:	8b 00                	mov    eax,DWORD PTR [rax]
  808999:	83 f8 01             	cmp    eax,0x1
  80899c:	0f 94 c0             	sete   al
  80899f:	0f b6 c0             	movzx  eax,al
}
  8089a2:	5d                   	pop    rbp
  8089a3:	c3                   	ret    

00000000008089a4 <disk_existent>:
int disk_existent(int disk)
{
  8089a4:	f3 0f 1e fa          	endbr64 
  8089a8:	55                   	push   rbp
  8089a9:	48 89 e5             	mov    rbp,rsp
  8089ac:	48 83 ec 10          	sub    rsp,0x10
  8089b0:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    switch (disk)
  8089b3:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  8089b7:	74 5f                	je     808a18 <disk_existent+0x74>
  8089b9:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  8089bd:	7f 6e                	jg     808a2d <disk_existent+0x89>
  8089bf:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  8089c3:	74 3e                	je     808a03 <disk_existent+0x5f>
  8089c5:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  8089c9:	7f 62                	jg     808a2d <disk_existent+0x89>
  8089cb:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8089cf:	74 08                	je     8089d9 <disk_existent+0x35>
  8089d1:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
  8089d5:	74 17                	je     8089ee <disk_existent+0x4a>
        
    case DISK_SLAVE_SLAVE:
        return sys_find_dev("hd3")!=-1;
        break;
    default:
        break;
  8089d7:	eb 54                	jmp    808a2d <disk_existent+0x89>
        return sys_find_dev("hd0")!=-1;
  8089d9:	bf 68 43 81 00       	mov    edi,0x814368
  8089de:	e8 28 a0 ff ff       	call   802a0b <sys_find_dev>
  8089e3:	83 f8 ff             	cmp    eax,0xffffffff
  8089e6:	0f 95 c0             	setne  al
  8089e9:	0f b6 c0             	movzx  eax,al
  8089ec:	eb 45                	jmp    808a33 <disk_existent+0x8f>
        return sys_find_dev("hd1")!=-1;
  8089ee:	bf 6c 43 81 00       	mov    edi,0x81436c
  8089f3:	e8 13 a0 ff ff       	call   802a0b <sys_find_dev>
  8089f8:	83 f8 ff             	cmp    eax,0xffffffff
  8089fb:	0f 95 c0             	setne  al
  8089fe:	0f b6 c0             	movzx  eax,al
  808a01:	eb 30                	jmp    808a33 <disk_existent+0x8f>
        return sys_find_dev("hd2")!=-1;
  808a03:	bf 70 43 81 00       	mov    edi,0x814370
  808a08:	e8 fe 9f ff ff       	call   802a0b <sys_find_dev>
  808a0d:	83 f8 ff             	cmp    eax,0xffffffff
  808a10:	0f 95 c0             	setne  al
  808a13:	0f b6 c0             	movzx  eax,al
  808a16:	eb 1b                	jmp    808a33 <disk_existent+0x8f>
        return sys_find_dev("hd3")!=-1;
  808a18:	bf 74 43 81 00       	mov    edi,0x814374
  808a1d:	e8 e9 9f ff ff       	call   802a0b <sys_find_dev>
  808a22:	83 f8 ff             	cmp    eax,0xffffffff
  808a25:	0f 95 c0             	setne  al
  808a28:	0f b6 c0             	movzx  eax,al
  808a2b:	eb 06                	jmp    808a33 <disk_existent+0x8f>
        break;
  808a2d:	90                   	nop
    }
    return 0;
  808a2e:	b8 00 00 00 00       	mov    eax,0x0
}
  808a33:	c9                   	leave  
  808a34:	c3                   	ret    

0000000000808a35 <hd_iterate>:
int hd_iterate()
{
  808a35:	f3 0f 1e fa          	endbr64 
  808a39:	55                   	push   rbp
  808a3a:	48 89 e5             	mov    rbp,rsp
  808a3d:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
    char *name;
    
    int r[4];
    r[0]=request(DISK_MAJOR_MAJOR,DISKREQ_CHECK,0,1,0);
  808a44:	41 b8 00 00 00 00    	mov    r8d,0x0
  808a4a:	b9 01 00 00 00       	mov    ecx,0x1
  808a4f:	ba 00 00 00 00       	mov    edx,0x0
  808a54:	be 02 00 00 00       	mov    esi,0x2
  808a59:	bf 00 00 00 00       	mov    edi,0x0
  808a5e:	e8 3b f8 ff ff       	call   80829e <request>
  808a63:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    r[1]=request(DISK_MAJOR_SLAVE,DISKREQ_CHECK,0,1,0);
  808a66:	41 b8 00 00 00 00    	mov    r8d,0x0
  808a6c:	b9 01 00 00 00       	mov    ecx,0x1
  808a71:	ba 00 00 00 00       	mov    edx,0x0
  808a76:	be 02 00 00 00       	mov    esi,0x2
  808a7b:	bf 01 00 00 00       	mov    edi,0x1
  808a80:	e8 19 f8 ff ff       	call   80829e <request>
  808a85:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    r[2]=request(DISK_SLAVE_MAJOR,DISKREQ_CHECK,0,1,0);
  808a88:	41 b8 00 00 00 00    	mov    r8d,0x0
  808a8e:	b9 01 00 00 00       	mov    ecx,0x1
  808a93:	ba 00 00 00 00       	mov    edx,0x0
  808a98:	be 02 00 00 00       	mov    esi,0x2
  808a9d:	bf 02 00 00 00       	mov    edi,0x2
  808aa2:	e8 f7 f7 ff ff       	call   80829e <request>
  808aa7:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    r[3]=request(DISK_SLAVE_SLAVE,DISKREQ_CHECK,0,1,0);
  808aaa:	41 b8 00 00 00 00    	mov    r8d,0x0
  808ab0:	b9 01 00 00 00       	mov    ecx,0x1
  808ab5:	ba 00 00 00 00       	mov    edx,0x0
  808aba:	be 02 00 00 00       	mov    esi,0x2
  808abf:	bf 03 00 00 00       	mov    edi,0x3
  808ac4:	e8 d5 f7 ff ff       	call   80829e <request>
  808ac9:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    for(int i=0;i<1;i++)
  808acc:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  808ad3:	e9 72 01 00 00       	jmp    808c4a <hd_iterate+0x215>
    {
        int disk;
        switch (i)
  808ad8:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  808adc:	74 3b                	je     808b19 <hd_iterate+0xe4>
  808ade:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  808ae2:	7f 3e                	jg     808b22 <hd_iterate+0xed>
  808ae4:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  808ae8:	74 26                	je     808b10 <hd_iterate+0xdb>
  808aea:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  808aee:	7f 32                	jg     808b22 <hd_iterate+0xed>
  808af0:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  808af4:	74 08                	je     808afe <hd_iterate+0xc9>
  808af6:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  808afa:	74 0b                	je     808b07 <hd_iterate+0xd2>
  808afc:	eb 24                	jmp    808b22 <hd_iterate+0xed>
        {
        case 0:disk=DISK_MAJOR_MAJOR;break;
  808afe:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  808b05:	eb 25                	jmp    808b2c <hd_iterate+0xf7>
        case 1:disk=DISK_MAJOR_SLAVE;break;
  808b07:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [rbp-0x10],0x1
  808b0e:	eb 1c                	jmp    808b2c <hd_iterate+0xf7>
        case 2:disk=DISK_SLAVE_MAJOR;break;
  808b10:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [rbp-0x10],0x2
  808b17:	eb 13                	jmp    808b2c <hd_iterate+0xf7>
        case 3:disk=DISK_SLAVE_SLAVE;break;
  808b19:	c7 45 f0 03 00 00 00 	mov    DWORD PTR [rbp-0x10],0x3
  808b20:	eb 0a                	jmp    808b2c <hd_iterate+0xf7>
        default:
            return -1;
  808b22:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808b27:	e9 28 01 00 00       	jmp    808c54 <hd_iterate+0x21f>
            break;
        }
        if(chk_result(r[i]))//&&!disk_existent(disk)
  808b2c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808b2f:	48 98                	cdqe   
  808b31:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  808b35:	89 c7                	mov    edi,eax
  808b37:	e8 16 fe ff ff       	call   808952 <chk_result>
  808b3c:	85 c0                	test   eax,eax
  808b3e:	0f 84 81 00 00 00    	je     808bc5 <hd_iterate+0x190>
        {
            printf("disk %d checked.\n",i);
  808b44:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808b47:	89 c6                	mov    esi,eax
  808b49:	bf 78 43 81 00       	mov    edi,0x814378
  808b4e:	b8 00 00 00 00       	mov    eax,0x0
  808b53:	e8 cf 81 ff ff       	call   800d27 <printf>
            //新硬盘
            device hd={
  808b58:	48 8d 95 20 ff ff ff 	lea    rdx,[rbp-0xe0]
  808b5f:	b8 00 00 00 00       	mov    eax,0x0
  808b64:	b9 15 00 00 00       	mov    ecx,0x15
  808b69:	48 89 d7             	mov    rdi,rdx
  808b6c:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  808b6f:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808b72:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  808b78:	c7 85 28 ff ff ff 01 	mov    DWORD PTR [rbp-0xd8],0x1
  808b7f:	00 00 00 
  808b82:	c7 85 2c ff ff ff 01 	mov    DWORD PTR [rbp-0xd4],0x1
  808b89:	00 00 00 
                .type=DEV_TYPE_BLKDEV,
                .stype=DEV_STYPE_HD,
                .slave_dev=disk,
                .start_port=i<2?PORT_DISK_MAJOR:PORT_DISK_SLAVE
  808b8c:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  808b90:	7f 07                	jg     808b99 <hd_iterate+0x164>
  808b92:	b8 f0 01 00 00       	mov    eax,0x1f0
  808b97:	eb 05                	jmp    808b9e <hd_iterate+0x169>
  808b99:	b8 70 01 00 00       	mov    eax,0x170
            device hd={
  808b9e:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            };
            disks[i]=reg_device(&hd);
  808ba4:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  808bab:	48 89 c7             	mov    rdi,rax
  808bae:	e8 20 9a ff ff       	call   8025d3 <reg_device>
  808bb3:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  808bb6:	48 63 d2             	movsxd rdx,edx
  808bb9:	89 04 95 00 b6 42 00 	mov    DWORD PTR [rdx*4+0x42b600],eax
  808bc0:	e9 81 00 00 00       	jmp    808c46 <hd_iterate+0x211>
        }else if(!chk_result(r[i]))//&&disk_existent(disk)
  808bc5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808bc8:	48 98                	cdqe   
  808bca:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  808bce:	89 c7                	mov    edi,eax
  808bd0:	e8 7d fd ff ff       	call   808952 <chk_result>
  808bd5:	85 c0                	test   eax,eax
  808bd7:	75 6d                	jne    808c46 <hd_iterate+0x211>
        {
            switch (i)
  808bd9:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  808bdd:	74 3e                	je     808c1d <hd_iterate+0x1e8>
  808bdf:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  808be3:	7f 41                	jg     808c26 <hd_iterate+0x1f1>
  808be5:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  808be9:	74 28                	je     808c13 <hd_iterate+0x1de>
  808beb:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  808bef:	7f 35                	jg     808c26 <hd_iterate+0x1f1>
  808bf1:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  808bf5:	74 08                	je     808bff <hd_iterate+0x1ca>
  808bf7:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  808bfb:	74 0c                	je     808c09 <hd_iterate+0x1d4>
  808bfd:	eb 27                	jmp    808c26 <hd_iterate+0x1f1>
            {
            case 0:name="hd0";break;
  808bff:	48 c7 45 f8 68 43 81 	mov    QWORD PTR [rbp-0x8],0x814368
  808c06:	00 
  808c07:	eb 1d                	jmp    808c26 <hd_iterate+0x1f1>
            case 1:name="hd1";break;
  808c09:	48 c7 45 f8 6c 43 81 	mov    QWORD PTR [rbp-0x8],0x81436c
  808c10:	00 
  808c11:	eb 13                	jmp    808c26 <hd_iterate+0x1f1>
            case 2:name="hd2";break;
  808c13:	48 c7 45 f8 70 43 81 	mov    QWORD PTR [rbp-0x8],0x814370
  808c1a:	00 
  808c1b:	eb 09                	jmp    808c26 <hd_iterate+0x1f1>
            case 3:name="hd3";break;
  808c1d:	48 c7 45 f8 74 43 81 	mov    QWORD PTR [rbp-0x8],0x814374
  808c24:	00 
  808c25:	90                   	nop
            }
            //有硬盘被卸载了
            int devi=sys_find_dev(name);
  808c26:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808c2a:	48 89 c7             	mov    rdi,rax
  808c2d:	e8 d9 9d ff ff       	call   802a0b <sys_find_dev>
  808c32:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            dispose_device(get_dev(devi));
  808c35:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808c38:	89 c7                	mov    edi,eax
  808c3a:	e8 a0 a4 ff ff       	call   8030df <get_dev>
  808c3f:	89 c7                	mov    edi,eax
  808c41:	e8 ec a3 ff ff       	call   803032 <dispose_device>
    for(int i=0;i<1;i++)
  808c46:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  808c4a:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  808c4e:	0f 8e 84 fe ff ff    	jle    808ad8 <hd_iterate+0xa3>
        }

    }
}
  808c54:	c9                   	leave  
  808c55:	c3                   	ret    

0000000000808c56 <async_check_disk>:

int async_check_disk(int disk)
{
  808c56:	f3 0f 1e fa          	endbr64 
  808c5a:	55                   	push   rbp
  808c5b:	48 89 e5             	mov    rbp,rsp
  808c5e:	48 83 ec 20          	sub    rsp,0x20
  808c62:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    unsigned short disknr=PORT_DISK_MAJOR;
  808c65:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    unsigned short chkcmd=0xe0;
  808c6b:	66 c7 45 fc e0 00    	mov    WORD PTR [rbp-0x4],0xe0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  808c71:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  808c75:	74 06                	je     808c7d <async_check_disk+0x27>
  808c77:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  808c7b:	75 06                	jne    808c83 <async_check_disk+0x2d>
        disknr=PORT_DISK_SLAVE;
  808c7d:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_MAJOR_SLAVE||disk==DISK_SLAVE_SLAVE)
  808c83:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  808c87:	74 06                	je     808c8f <async_check_disk+0x39>
  808c89:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  808c8d:	75 06                	jne    808c95 <async_check_disk+0x3f>
        chkcmd=0xf0;
  808c8f:	66 c7 45 fc f0 00    	mov    WORD PTR [rbp-0x4],0xf0
    outb(disknr+2,1);
  808c95:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808c99:	83 c0 02             	add    eax,0x2
  808c9c:	0f b7 c0             	movzx  eax,ax
  808c9f:	be 01 00 00 00       	mov    esi,0x1
  808ca4:	89 c7                	mov    edi,eax
  808ca6:	e8 55 ce ff ff       	call   805b00 <outb>
    outb(disknr+3,0);
  808cab:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808caf:	83 c0 03             	add    eax,0x3
  808cb2:	0f b7 c0             	movzx  eax,ax
  808cb5:	be 00 00 00 00       	mov    esi,0x0
  808cba:	89 c7                	mov    edi,eax
  808cbc:	e8 3f ce ff ff       	call   805b00 <outb>
    outb(disknr+4,0);
  808cc1:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808cc5:	83 c0 04             	add    eax,0x4
  808cc8:	0f b7 c0             	movzx  eax,ax
  808ccb:	be 00 00 00 00       	mov    esi,0x0
  808cd0:	89 c7                	mov    edi,eax
  808cd2:	e8 29 ce ff ff       	call   805b00 <outb>
    outb(disknr+5,0);
  808cd7:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808cdb:	83 c0 05             	add    eax,0x5
  808cde:	0f b7 c0             	movzx  eax,ax
  808ce1:	be 00 00 00 00       	mov    esi,0x0
  808ce6:	89 c7                	mov    edi,eax
  808ce8:	e8 13 ce ff ff       	call   805b00 <outb>
    outb(disknr+6,chkcmd);//主硬盘
  808ced:	0f b7 45 fc          	movzx  eax,WORD PTR [rbp-0x4]
  808cf1:	0f b6 d0             	movzx  edx,al
  808cf4:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808cf8:	83 c0 06             	add    eax,0x6
  808cfb:	0f b7 c0             	movzx  eax,ax
  808cfe:	89 d6                	mov    esi,edx
  808d00:	89 c7                	mov    edi,eax
  808d02:	e8 f9 cd ff ff       	call   805b00 <outb>
    outb(disknr+7,DISK_CMD_CHECK);
  808d07:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808d0b:	83 c0 07             	add    eax,0x7
  808d0e:	0f b7 c0             	movzx  eax,ax
  808d11:	be 90 00 00 00       	mov    esi,0x90
  808d16:	89 c7                	mov    edi,eax
  808d18:	e8 e3 cd ff ff       	call   805b00 <outb>
    //     // {
    //     //     printf("DISK ERR\n");
    //     //     return -1;
    //     // }
    // }
    return 0;
  808d1d:	b8 00 00 00 00       	mov    eax,0x0
}
  808d22:	c9                   	leave  
  808d23:	c3                   	ret    

0000000000808d24 <hd_do_req>:

//接口函数：负责接收VFS的请求然后执行
int hd_do_req(driver_args *args)
{
  808d24:	f3 0f 1e fa          	endbr64 
  808d28:	55                   	push   rbp
  808d29:	48 89 e5             	mov    rbp,rsp
  808d2c:	48 83 ec 18          	sub    rsp,0x18
  808d30:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int diski=0;
  808d34:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;disks[diski]!=args->dev;diski++);
  808d3b:	eb 04                	jmp    808d41 <hd_do_req+0x1d>
  808d3d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  808d41:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808d44:	48 98                	cdqe   
  808d46:	8b 14 85 00 b6 42 00 	mov    edx,DWORD PTR [rax*4+0x42b600]
  808d4d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808d51:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  808d57:	39 c2                	cmp    edx,eax
  808d59:	75 e2                	jne    808d3d <hd_do_req+0x19>
    switch (args->cmd)
  808d5b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808d5f:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  808d65:	83 f8 04             	cmp    eax,0x4
  808d68:	74 72                	je     808ddc <hd_do_req+0xb8>
  808d6a:	83 f8 04             	cmp    eax,0x4
  808d6d:	0f 8f 96 00 00 00    	jg     808e09 <hd_do_req+0xe5>
  808d73:	83 f8 02             	cmp    eax,0x2
  808d76:	74 0a                	je     808d82 <hd_do_req+0x5e>
  808d78:	83 f8 03             	cmp    eax,0x3
  808d7b:	74 32                	je     808daf <hd_do_req+0x8b>
  808d7d:	e9 87 00 00 00       	jmp    808e09 <hd_do_req+0xe5>
    {
    case DRVF_READ:
        request(diski,DISKREQ_READ,args->lba,args->sec_c,args->dist_addr);
  808d82:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808d86:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808d89:	48 98                	cdqe   
  808d8b:	48 89 c6             	mov    rsi,rax
  808d8e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808d92:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  808d95:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808d99:	8b 10                	mov    edx,DWORD PTR [rax]
  808d9b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808d9e:	49 89 f0             	mov    r8,rsi
  808da1:	be 00 00 00 00       	mov    esi,0x0
  808da6:	89 c7                	mov    edi,eax
  808da8:	e8 f1 f4 ff ff       	call   80829e <request>
        break;
  808dad:	eb 61                	jmp    808e10 <hd_do_req+0xec>
    case DRVF_WRITE:
        request(diski,DISKREQ_WRITE,args->lba,args->sec_c,args->src_addr);
  808daf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808db3:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808db6:	48 98                	cdqe   
  808db8:	48 89 c6             	mov    rsi,rax
  808dbb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808dbf:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  808dc2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808dc6:	8b 10                	mov    edx,DWORD PTR [rax]
  808dc8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808dcb:	49 89 f0             	mov    r8,rsi
  808dce:	be 01 00 00 00       	mov    esi,0x1
  808dd3:	89 c7                	mov    edi,eax
  808dd5:	e8 c4 f4 ff ff       	call   80829e <request>
        break;
  808dda:	eb 34                	jmp    808e10 <hd_do_req+0xec>
    case DRVF_CHK:
        request(diski,DISKREQ_CHECK,args->lba,args->sec_c,args->dist_addr);
  808ddc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808de0:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808de3:	48 98                	cdqe   
  808de5:	48 89 c6             	mov    rsi,rax
  808de8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808dec:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  808def:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808df3:	8b 10                	mov    edx,DWORD PTR [rax]
  808df5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808df8:	49 89 f0             	mov    r8,rsi
  808dfb:	be 02 00 00 00       	mov    esi,0x2
  808e00:	89 c7                	mov    edi,eax
  808e02:	e8 97 f4 ff ff       	call   80829e <request>
        break;
  808e07:	eb 07                	jmp    808e10 <hd_do_req+0xec>
    default:return -1;
  808e09:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808e0e:	eb 1e                	jmp    808e2e <hd_do_req+0x10a>
    }
    args->stat=REQ_STAT_WORKING;
  808e10:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808e14:	c7 80 ac 00 00 00 02 	mov    DWORD PTR [rax+0xac],0x2
  808e1b:	00 00 00 
    running_devman_req=args;
  808e1e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808e22:	48 89 05 bf 27 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc227bf],rax        # 42b5e8 <running_devman_req>
    return 0;
  808e29:	b8 00 00 00 00       	mov    eax,0x0
  808e2e:	c9                   	leave  
  808e2f:	c3                   	ret    

0000000000808e30 <disk_int_handler>:
  808e30:	e8 f9 cc ff ff       	call   805b2e <eoi>
  808e35:	e8 75 f2 ff ff       	call   8080af <disk_int_handler_c>
  808e3a:	48 cf                	iretq  

0000000000808e3c <read_disk_asm>:
  808e3c:	55                   	push   rbp
  808e3d:	89 e5                	mov    ebp,esp
  808e3f:	66 ba f7 01          	mov    dx,0x1f7
  808e43:	31 c9                	xor    ecx,ecx
  808e45:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  808e4a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  808e4f:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  808e54:	89 c6                	mov    esi,eax
  808e56:	66 ba f2 01          	mov    dx,0x1f2
  808e5a:	88 c8                	mov    al,cl
  808e5c:	ee                   	out    dx,al
  808e5d:	66 ba f3 01          	mov    dx,0x1f3
  808e61:	89 f0                	mov    eax,esi
  808e63:	ee                   	out    dx,al
  808e64:	66 ff c2             	inc    dx
  808e67:	c1 e8 08             	shr    eax,0x8
  808e6a:	ee                   	out    dx,al
  808e6b:	66 ff c2             	inc    dx
  808e6e:	c1 e8 08             	shr    eax,0x8
  808e71:	ee                   	out    dx,al
  808e72:	66 ff c2             	inc    dx
  808e75:	66 c1 e8 08          	shr    ax,0x8
  808e79:	24 0f                	and    al,0xf
  808e7b:	0c e0                	or     al,0xe0
  808e7d:	ee                   	out    dx,al
  808e7e:	66 ff c2             	inc    dx
  808e81:	b0 20                	mov    al,0x20
  808e83:	ee                   	out    dx,al

0000000000808e84 <read_disk_asm.wait>:
  808e84:	90                   	nop
  808e85:	ec                   	in     al,dx
  808e86:	24 88                	and    al,0x88
  808e88:	3c 08                	cmp    al,0x8
  808e8a:	75 f8                	jne    808e84 <read_disk_asm.wait>
  808e8c:	66 89 d7             	mov    di,dx
  808e8f:	89 c8                	mov    eax,ecx
  808e91:	66 b9 00 01          	mov    cx,0x100
  808e95:	66 f7 e1             	mul    cx
  808e98:	89 c1                	mov    ecx,eax
  808e9a:	66 ba f0 01          	mov    dx,0x1f0

0000000000808e9e <read_disk_asm.read>:
  808e9e:	66 ed                	in     ax,dx
  808ea0:	66 67 89 03          	mov    WORD PTR [ebx],ax
  808ea4:	83 c3 02             	add    ebx,0x2
  808ea7:	e2 f5                	loop   808e9e <read_disk_asm.read>
  808ea9:	c9                   	leave  
  808eaa:	b8 00 00 00 00       	mov    eax,0x0
  808eaf:	c3                   	ret    

0000000000808eb0 <read_disk_asm.err_disk_reading>:
  808eb0:	66 ba f1 01          	mov    dx,0x1f1
  808eb4:	31 c0                	xor    eax,eax
  808eb6:	66 ed                	in     ax,dx
  808eb8:	89 ec                	mov    esp,ebp
  808eba:	5d                   	pop    rbp
  808ebb:	c3                   	ret    

0000000000808ebc <write_disk_asm>:
  808ebc:	55                   	push   rbp
  808ebd:	89 e5                	mov    ebp,esp
  808ebf:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  808ec4:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  808ec9:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  808ece:	50                   	push   rax
  808ecf:	66 ba f2 01          	mov    dx,0x1f2
  808ed3:	88 c8                	mov    al,cl
  808ed5:	ee                   	out    dx,al
  808ed6:	58                   	pop    rax
  808ed7:	66 ba f3 01          	mov    dx,0x1f3
  808edb:	ee                   	out    dx,al
  808edc:	c1 e8 08             	shr    eax,0x8
  808edf:	66 ba f4 01          	mov    dx,0x1f4
  808ee3:	ee                   	out    dx,al
  808ee4:	c1 e8 08             	shr    eax,0x8
  808ee7:	66 ba f5 01          	mov    dx,0x1f5
  808eeb:	ee                   	out    dx,al
  808eec:	c1 e8 08             	shr    eax,0x8
  808eef:	24 0f                	and    al,0xf
  808ef1:	0c e0                	or     al,0xe0
  808ef3:	66 ba f6 01          	mov    dx,0x1f6
  808ef7:	ee                   	out    dx,al
  808ef8:	66 ba f7 01          	mov    dx,0x1f7
  808efc:	b0 30                	mov    al,0x30
  808efe:	ee                   	out    dx,al

0000000000808eff <write_disk_asm.not_ready2>:
  808eff:	90                   	nop
  808f00:	ec                   	in     al,dx
  808f01:	24 88                	and    al,0x88
  808f03:	3c 08                	cmp    al,0x8
  808f05:	75 f8                	jne    808eff <write_disk_asm.not_ready2>
  808f07:	89 c8                	mov    eax,ecx
  808f09:	66 b9 00 01          	mov    cx,0x100
  808f0d:	66 f7 e1             	mul    cx
  808f10:	89 c1                	mov    ecx,eax
  808f12:	66 ba f0 01          	mov    dx,0x1f0

0000000000808f16 <write_disk_asm.go_on_write>:
  808f16:	66 67 8b 03          	mov    ax,WORD PTR [ebx]
  808f1a:	66 ef                	out    dx,ax
  808f1c:	83 c3 02             	add    ebx,0x2
  808f1f:	e2 f5                	loop   808f16 <write_disk_asm.go_on_write>
  808f21:	89 ec                	mov    esp,ebp
  808f23:	5d                   	pop    rbp
  808f24:	c3                   	ret    

0000000000808f25 <DISK1_FAT32_read_FAT_Entry>:
#include "mem.h"
#include "memory.h"
#include "proc.h"

unsigned int DISK1_FAT32_read_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry)
{
  808f25:	f3 0f 1e fa          	endbr64 
  808f29:	55                   	push   rbp
  808f2a:	48 89 e5             	mov    rbp,rsp
  808f2d:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  808f34:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  808f3b:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
	unsigned int buf[128];
	memset(buf,0,512);
  808f41:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  808f48:	ba 00 02 00 00       	mov    edx,0x200
  808f4d:	be 00 00 00 00       	mov    esi,0x0
  808f52:	48 89 c7             	mov    rdi,rax
  808f55:	e8 07 2a 00 00       	call   80b961 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  808f5a:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  808f61:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808f65:	89 c2                	mov    edx,eax
  808f67:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  808f6d:	c1 e8 07             	shr    eax,0x7
  808f70:	01 d0                	add    eax,edx
  808f72:	89 c2                	mov    edx,eax
  808f74:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  808f7b:	49 89 c0             	mov    r8,rax
  808f7e:	b9 01 00 00 00       	mov    ecx,0x1
  808f83:	be 00 00 00 00       	mov    esi,0x0
  808f88:	bf 00 00 00 00       	mov    edi,0x0
  808f8d:	e8 0c f3 ff ff       	call   80829e <request>
  808f92:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    chk_result(r);
  808f95:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808f98:	89 c7                	mov    edi,eax
  808f9a:	e8 b3 f9 ff ff       	call   808952 <chk_result>
    printf("DISK1_FAT32_read_FAT_Entry fat_entry:%x,%#010x\n",fat_entry,buf[fat_entry & 0x7f]);
  808f9f:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  808fa5:	83 e0 7f             	and    eax,0x7f
  808fa8:	89 c0                	mov    eax,eax
  808faa:	8b 94 85 f0 fd ff ff 	mov    edx,DWORD PTR [rbp+rax*4-0x210]
  808fb1:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  808fb7:	89 c6                	mov    esi,eax
  808fb9:	bf 90 43 81 00       	mov    edi,0x814390
  808fbe:	b8 00 00 00 00       	mov    eax,0x0
  808fc3:	e8 5f 7d ff ff       	call   800d27 <printf>
	return buf[fat_entry & 0x7f] & 0x0fffffff;
  808fc8:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  808fce:	83 e0 7f             	and    eax,0x7f
  808fd1:	89 c0                	mov    eax,eax
  808fd3:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  808fda:	25 ff ff ff 0f       	and    eax,0xfffffff
}
  808fdf:	c9                   	leave  
  808fe0:	c3                   	ret    

0000000000808fe1 <DISK1_FAT32_write_FAT_Entry>:


unsigned long DISK1_FAT32_write_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry,unsigned int value)
{
  808fe1:	f3 0f 1e fa          	endbr64 
  808fe5:	55                   	push   rbp
  808fe6:	48 89 e5             	mov    rbp,rsp
  808fe9:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  808ff0:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  808ff7:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
  808ffd:	89 95 e0 fd ff ff    	mov    DWORD PTR [rbp-0x220],edx
	unsigned int buf[128];
	int i;

	memset(buf,0,512);
  809003:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80900a:	ba 00 02 00 00       	mov    edx,0x200
  80900f:	be 00 00 00 00       	mov    esi,0x0
  809014:	48 89 c7             	mov    rdi,rax
  809017:	e8 45 29 00 00       	call   80b961 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  80901c:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  809023:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809027:	89 c2                	mov    edx,eax
  809029:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80902f:	c1 e8 07             	shr    eax,0x7
  809032:	01 d0                	add    eax,edx
  809034:	89 c2                	mov    edx,eax
  809036:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80903d:	49 89 c0             	mov    r8,rax
  809040:	b9 01 00 00 00       	mov    ecx,0x1
  809045:	be 00 00 00 00       	mov    esi,0x0
  80904a:	bf 00 00 00 00       	mov    edi,0x0
  80904f:	e8 4a f2 ff ff       	call   80829e <request>
  809054:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    chk_result(r);
  809057:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80905a:	89 c7                	mov    edi,eax
  80905c:	e8 f1 f8 ff ff       	call   808952 <chk_result>
    buf[fat_entry & 0x7f] = (buf[fat_entry & 0x7f] & 0xf0000000) | (value & 0x0fffffff);
  809061:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  809067:	83 e0 7f             	and    eax,0x7f
  80906a:	89 c0                	mov    eax,eax
  80906c:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  809073:	25 00 00 00 f0       	and    eax,0xf0000000
  809078:	89 c6                	mov    esi,eax
  80907a:	8b 85 e0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x220]
  809080:	25 ff ff ff 0f       	and    eax,0xfffffff
  809085:	89 c1                	mov    ecx,eax
  809087:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80908d:	83 e0 7f             	and    eax,0x7f
  809090:	89 c2                	mov    edx,eax
  809092:	89 f0                	mov    eax,esi
  809094:	09 c8                	or     eax,ecx
  809096:	89 d2                	mov    edx,edx
  809098:	89 84 95 f0 fd ff ff 	mov    DWORD PTR [rbp+rdx*4-0x210],eax

	for(i = 0;i < fsbi->NumFATs;i++){
  80909f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8090a6:	eb 61                	jmp    809109 <DISK1_FAT32_write_FAT_Entry+0x128>
        int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,fsbi->FAT1_firstsector + fsbi->sector_per_FAT * i + (fat_entry >> 7),1,(unsigned char *)buf);
  8090a8:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  8090af:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8090b3:	89 c1                	mov    ecx,eax
  8090b5:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  8090bc:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  8090c0:	89 c2                	mov    edx,eax
  8090c2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8090c5:	48 98                	cdqe   
  8090c7:	0f af c2             	imul   eax,edx
  8090ca:	8d 14 01             	lea    edx,[rcx+rax*1]
  8090cd:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  8090d3:	c1 e8 07             	shr    eax,0x7
  8090d6:	01 d0                	add    eax,edx
  8090d8:	89 c2                	mov    edx,eax
  8090da:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  8090e1:	49 89 c0             	mov    r8,rax
  8090e4:	b9 01 00 00 00       	mov    ecx,0x1
  8090e9:	be 01 00 00 00       	mov    esi,0x1
  8090ee:	bf 00 00 00 00       	mov    edi,0x0
  8090f3:	e8 a6 f1 ff ff       	call   80829e <request>
  8090f8:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        chk_result(r1);
  8090fb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8090fe:	89 c7                	mov    edi,eax
  809100:	e8 4d f8 ff ff       	call   808952 <chk_result>
	for(i = 0;i < fsbi->NumFATs;i++){
  809105:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809109:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80910c:	48 63 d0             	movsxd rdx,eax
  80910f:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  809116:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80911a:	48 39 c2             	cmp    rdx,rax
  80911d:	72 89                	jb     8090a8 <DISK1_FAT32_write_FAT_Entry+0xc7>
    }
	return 1;
  80911f:	b8 01 00 00 00       	mov    eax,0x1
}
  809124:	c9                   	leave  
  809125:	c3                   	ret    

0000000000809126 <FAT32_open>:


long FAT32_open(struct index_node * inode,struct file * filp)
{
  809126:	f3 0f 1e fa          	endbr64 
  80912a:	55                   	push   rbp
  80912b:	48 89 e5             	mov    rbp,rsp
  80912e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809132:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  809136:	b8 01 00 00 00       	mov    eax,0x1
}
  80913b:	5d                   	pop    rbp
  80913c:	c3                   	ret    

000000000080913d <FAT32_close>:


long FAT32_close(struct index_node * inode,struct file * filp)
{
  80913d:	f3 0f 1e fa          	endbr64 
  809141:	55                   	push   rbp
  809142:	48 89 e5             	mov    rbp,rsp
  809145:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809149:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  80914d:	b8 01 00 00 00       	mov    eax,0x1
}
  809152:	5d                   	pop    rbp
  809153:	c3                   	ret    

0000000000809154 <FAT32_read>:


long FAT32_read(struct file * filp,char * buf,unsigned long count,long * position)
{
  809154:	f3 0f 1e fa          	endbr64 
  809158:	55                   	push   rbp
  809159:	48 89 e5             	mov    rbp,rsp
  80915c:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  809160:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  809164:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  809168:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
  80916c:	48 89 4d 80          	mov    QWORD PTR [rbp-0x80],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  809170:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809174:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809178:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80917c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809180:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  809184:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809188:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80918c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809190:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809194:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809198:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

	unsigned long cluster = finode->first_cluster;
  80919c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8091a0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8091a3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long sector = 0;
  8091a7:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  8091ae:	00 
	int i,length = 0;
  8091af:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
	long retval = 0;
  8091b6:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  8091bd:	00 
	int index = *position / fsbi->bytes_per_cluster;
  8091be:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8091c2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8091c5:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  8091c9:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  8091cd:	48 99                	cqo    
  8091cf:	48 f7 fe             	idiv   rsi
  8091d2:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  8091d5:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8091d9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8091dc:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  8091e0:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  8091e4:	48 99                	cqo    
  8091e6:	48 f7 f9             	idiv   rcx
  8091e9:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  8091ed:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8091f1:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8091f5:	be 00 00 00 00       	mov    esi,0x0
  8091fa:	48 89 c7             	mov    rdi,rax
  8091fd:	b8 00 00 00 00       	mov    eax,0x0
  809202:	e8 b2 80 ff ff       	call   8012b9 <vmalloc>
  809207:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax

	if(!cluster)
  80920b:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  809210:	75 0c                	jne    80921e <FAT32_read+0xca>
		return -EFAULT;
  809212:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  809219:	e9 f0 01 00 00       	jmp    80940e <FAT32_read+0x2ba>
	for(i = 0;i < index;i++)
  80921e:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  809225:	eb 1e                	jmp    809245 <FAT32_read+0xf1>
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  809227:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80922b:	89 c2                	mov    edx,eax
  80922d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809231:	89 d6                	mov    esi,edx
  809233:	48 89 c7             	mov    rdi,rax
  809236:	e8 ea fc ff ff       	call   808f25 <DISK1_FAT32_read_FAT_Entry>
  80923b:	89 c0                	mov    eax,eax
  80923d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	for(i = 0;i < index;i++)
  809241:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  809245:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809248:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80924b:	7c da                	jl     809227 <FAT32_read+0xd3>

	if(*position + count > filp->dentry->dir_inode->file_size)
  80924d:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  809251:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809254:	48 89 c2             	mov    rdx,rax
  809257:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80925b:	48 01 c2             	add    rdx,rax
  80925e:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809262:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809266:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80926a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80926d:	48 39 c2             	cmp    rdx,rax
  809270:	76 2c                	jbe    80929e <FAT32_read+0x14a>
		index = count = filp->dentry->dir_inode->file_size - *position;
  809272:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809276:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80927a:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80927e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809281:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  809285:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809288:	48 89 c1             	mov    rcx,rax
  80928b:	48 89 d0             	mov    rax,rdx
  80928e:	48 29 c8             	sub    rax,rcx
  809291:	48 89 45 88          	mov    QWORD PTR [rbp-0x78],rax
  809295:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809299:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
  80929c:	eb 07                	jmp    8092a5 <FAT32_read+0x151>
	else
		index = count;
  80929e:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8092a2:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax

//	printf("FAT32_read first_cluster:%d,size:%d,preempt_count:%d\n",finode->first_cluster,filp->dentry->dir_inode->file_size,current->preempt_count);

	do
	{
		memset(buffer,0,fsbi->bytes_per_cluster);
  8092a5:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8092a9:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8092ad:	89 c2                	mov    edx,eax
  8092af:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8092b3:	be 00 00 00 00       	mov    esi,0x0
  8092b8:	48 89 c7             	mov    rdi,rax
  8092bb:	e8 a1 26 00 00       	call   80b961 <memset>
		sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  8092c0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8092c4:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  8092c8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092cc:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  8092d0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8092d4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8092d8:	48 0f af c2          	imul   rax,rdx
  8092dc:	48 01 c8             	add    rax,rcx
  8092df:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  8092e3:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8092e7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8092eb:	89 c1                	mov    ecx,eax
  8092ed:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8092f1:	89 c2                	mov    edx,eax
  8092f3:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8092f7:	49 89 c0             	mov    r8,rax
  8092fa:	be 00 00 00 00       	mov    esi,0x0
  8092ff:	bf 00 00 00 00       	mov    edi,0x0
  809304:	e8 95 ef ff ff       	call   80829e <request>
  809309:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
		if(!chk_result(r))
  80930c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80930f:	89 c7                	mov    edi,eax
  809311:	e8 3c f6 ff ff       	call   808952 <chk_result>
  809316:	85 c0                	test   eax,eax
  809318:	75 1c                	jne    809336 <FAT32_read+0x1e2>
		{
			printf("FAT32 FS(read) read disk ERROR!!!!!!!!!!\n");
  80931a:	bf c0 43 81 00       	mov    edi,0x8143c0
  80931f:	b8 00 00 00 00       	mov    eax,0x0
  809324:	e8 fe 79 ff ff       	call   800d27 <printf>
			retval = -EIO;
  809329:	48 c7 45 e8 e3 ff ff 	mov    QWORD PTR [rbp-0x18],0xffffffffffffffe3
  809330:	ff 
			break;
  809331:	e9 ba 00 00 00       	jmp    8093f0 <FAT32_read+0x29c>
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  809336:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  809339:	48 63 d0             	movsxd rdx,eax
  80933c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809340:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809344:	48 2b 45 d8          	sub    rax,QWORD PTR [rbp-0x28]
  809348:	48 39 c2             	cmp    rdx,rax
  80934b:	48 0f 4e c2          	cmovle rax,rdx
  80934f:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax

		if((unsigned long)buf < MAX_TASKS)
  809352:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  809356:	48 83 f8 1f          	cmp    rax,0x1f
  80935a:	77 1f                	ja     80937b <FAT32_read+0x227>
			memcpy(buffer + offset,buf,length);
  80935c:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  80935f:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  809363:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  809367:	48 01 c1             	add    rcx,rax
  80936a:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80936e:	48 89 c6             	mov    rsi,rax
  809371:	48 89 cf             	mov    rdi,rcx
  809374:	e8 39 25 00 00       	call   80b8b2 <memcpy>
  809379:	eb 1d                	jmp    809398 <FAT32_read+0x244>
		else
			memcpy(buffer + offset,buf,length);
  80937b:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  80937e:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  809382:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  809386:	48 01 c1             	add    rcx,rax
  809389:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80938d:	48 89 c6             	mov    rsi,rax
  809390:	48 89 cf             	mov    rdi,rcx
  809393:	e8 1a 25 00 00       	call   80b8b2 <memcpy>

		index -= length;
  809398:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  80939b:	29 45 e4             	sub    DWORD PTR [rbp-0x1c],eax
		buf += length;
  80939e:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  8093a1:	48 98                	cdqe   
  8093a3:	48 01 45 90          	add    QWORD PTR [rbp-0x70],rax
		offset -= offset;
  8093a7:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  8093ae:	00 
		*position += length;
  8093af:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8093b3:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8093b6:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  8093b9:	48 98                	cdqe   
  8093bb:	48 01 c2             	add    rdx,rax
  8093be:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8093c2:	48 89 10             	mov    QWORD PTR [rax],rdx
	}while(index && (cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster)));
  8093c5:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  8093c9:	74 25                	je     8093f0 <FAT32_read+0x29c>
  8093cb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8093cf:	89 c2                	mov    edx,eax
  8093d1:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8093d5:	89 d6                	mov    esi,edx
  8093d7:	48 89 c7             	mov    rdi,rax
  8093da:	e8 46 fb ff ff       	call   808f25 <DISK1_FAT32_read_FAT_Entry>
  8093df:	89 c0                	mov    eax,eax
  8093e1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  8093e5:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8093ea:	0f 85 b5 fe ff ff    	jne    8092a5 <FAT32_read+0x151>

	vmfree(buffer);
  8093f0:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8093f4:	48 89 c7             	mov    rdi,rax
  8093f7:	e8 4c 7f ff ff       	call   801348 <vmfree>
	if(!index)
  8093fc:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  809400:	75 08                	jne    80940a <FAT32_read+0x2b6>
		retval = count;
  809402:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809406:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	return retval;
  80940a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
}
  80940e:	c9                   	leave  
  80940f:	c3                   	ret    

0000000000809410 <FAT32_find_available_cluster>:


unsigned long FAT32_find_available_cluster(struct FAT32_sb_info * fsbi)
{
  809410:	f3 0f 1e fa          	endbr64 
  809414:	55                   	push   rbp
  809415:	48 89 e5             	mov    rbp,rsp
  809418:	48 81 ec 30 02 00 00 	sub    rsp,0x230
  80941f:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
	int i,j;
	int fat_entry;
	unsigned long sector_per_fat = fsbi->sector_per_FAT;
  809426:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  80942d:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  809431:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	unsigned int buf[128];

//	fsbi->fat_fsinfo->FSI_Free_Count & fsbi->fat_fsinfo->FSI_Nxt_Free not exactly,so unuse

	for(i = 0;i < sector_per_fat;i++)
  809435:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80943c:	e9 8b 00 00 00       	jmp    8094cc <FAT32_find_available_cluster+0xbc>
	{
		memset(buf,0,512);
  809441:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  809448:	ba 00 02 00 00       	mov    edx,0x200
  80944d:	be 00 00 00 00       	mov    esi,0x0
  809452:	48 89 c7             	mov    rdi,rax
  809455:	e8 07 25 00 00       	call   80b961 <memset>
		int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + i,1,(unsigned char *)buf);
  80945a:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  809461:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809465:	89 c2                	mov    edx,eax
  809467:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80946a:	01 d0                	add    eax,edx
  80946c:	89 c2                	mov    edx,eax
  80946e:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  809475:	49 89 c0             	mov    r8,rax
  809478:	b9 01 00 00 00       	mov    ecx,0x1
  80947d:	be 00 00 00 00       	mov    esi,0x0
  809482:	bf 00 00 00 00       	mov    edi,0x0
  809487:	e8 12 ee ff ff       	call   80829e <request>
  80948c:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

		for(j = 0;j < 128;j++)
  80948f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  809496:	eb 2a                	jmp    8094c2 <FAT32_find_available_cluster+0xb2>
		{
			if((buf[j] & 0x0fffffff) == 0)
  809498:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80949b:	48 98                	cdqe   
  80949d:	8b 84 85 e0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x220]
  8094a4:	25 ff ff ff 0f       	and    eax,0xfffffff
  8094a9:	85 c0                	test   eax,eax
  8094ab:	75 11                	jne    8094be <FAT32_find_available_cluster+0xae>
				return (i << 7) + j;
  8094ad:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8094b0:	c1 e0 07             	shl    eax,0x7
  8094b3:	89 c2                	mov    edx,eax
  8094b5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8094b8:	01 d0                	add    eax,edx
  8094ba:	48 98                	cdqe   
  8094bc:	eb 22                	jmp    8094e0 <FAT32_find_available_cluster+0xd0>
		for(j = 0;j < 128;j++)
  8094be:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8094c2:	83 7d f8 7f          	cmp    DWORD PTR [rbp-0x8],0x7f
  8094c6:	7e d0                	jle    809498 <FAT32_find_available_cluster+0x88>
	for(i = 0;i < sector_per_fat;i++)
  8094c8:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8094cc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8094cf:	48 98                	cdqe   
  8094d1:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  8094d5:	0f 87 66 ff ff ff    	ja     809441 <FAT32_find_available_cluster+0x31>
		}
	}
	return 0;
  8094db:	b8 00 00 00 00       	mov    eax,0x0
}
  8094e0:	c9                   	leave  
  8094e1:	c3                   	ret    

00000000008094e2 <FAT32_write>:


long FAT32_write(struct file * filp,char * buf,unsigned long count,long * position)
{
  8094e2:	f3 0f 1e fa          	endbr64 
  8094e6:	55                   	push   rbp
  8094e7:	48 89 e5             	mov    rbp,rsp
  8094ea:	48 81 ec 90 00 00 00 	sub    rsp,0x90
  8094f1:	48 89 7d 88          	mov    QWORD PTR [rbp-0x78],rdi
  8094f5:	48 89 75 80          	mov    QWORD PTR [rbp-0x80],rsi
  8094f9:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  809500:	48 89 8d 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  809507:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80950b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80950f:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809513:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809517:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  80951b:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80951f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809523:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809527:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80952b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80952f:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned long cluster = finode->first_cluster;
  809533:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809537:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80953a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long next_cluster = 0;
  80953e:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  809545:	00 
	unsigned long sector = 0;
  809546:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80954d:	00 
	int i,length = 0;
  80954e:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
	long retval = 0;
  809555:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80955c:	00 
	long flags = 0;
  80955d:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  809564:	00 
	int index = *position / fsbi->bytes_per_cluster;
  809565:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80956c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80956f:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  809573:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  809577:	48 99                	cqo    
  809579:	48 f7 fe             	idiv   rsi
  80957c:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  80957f:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  809586:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809589:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80958d:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  809591:	48 99                	cqo    
  809593:	48 f7 f9             	idiv   rcx
  809596:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  80959a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80959e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8095a2:	be 00 00 00 00       	mov    esi,0x0
  8095a7:	48 89 c7             	mov    rdi,rax
  8095aa:	b8 00 00 00 00       	mov    eax,0x0
  8095af:	e8 05 7d ff ff       	call   8012b9 <vmalloc>
  8095b4:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax

	if(!cluster)
  8095b8:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8095bd:	75 1a                	jne    8095d9 <FAT32_write+0xf7>
	{
		cluster = FAT32_find_available_cluster(fsbi);
  8095bf:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8095c3:	48 89 c7             	mov    rdi,rax
  8095c6:	e8 45 fe ff ff       	call   809410 <FAT32_find_available_cluster>
  8095cb:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		flags = 1;
  8095cf:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  8095d6:	00 
  8095d7:	eb 2f                	jmp    809608 <FAT32_write+0x126>
	}
	else
		for(i = 0;i < index;i++)
  8095d9:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8095e0:	eb 1e                	jmp    809600 <FAT32_write+0x11e>
			cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  8095e2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8095e6:	89 c2                	mov    edx,eax
  8095e8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8095ec:	89 d6                	mov    esi,edx
  8095ee:	48 89 c7             	mov    rdi,rax
  8095f1:	e8 2f f9 ff ff       	call   808f25 <DISK1_FAT32_read_FAT_Entry>
  8095f6:	89 c0                	mov    eax,eax
  8095f8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		for(i = 0;i < index;i++)
  8095fc:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  809600:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809603:	3b 45 d4             	cmp    eax,DWORD PTR [rbp-0x2c]
  809606:	7c da                	jl     8095e2 <FAT32_write+0x100>

	if(!cluster)
  809608:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80960d:	75 18                	jne    809627 <FAT32_write+0x145>
	{
		vmfree(buffer);
  80960f:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809613:	48 89 c7             	mov    rdi,rax
  809616:	e8 2d 7d ff ff       	call   801348 <vmfree>
		return -ENOSPC;
  80961b:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  809622:	e9 13 03 00 00       	jmp    80993a <FAT32_write+0x458>
	}

	if(flags)
  809627:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80962c:	74 4d                	je     80967b <FAT32_write+0x199>
	{
		finode->first_cluster = cluster;
  80962e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809632:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  809636:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  809639:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80963d:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809641:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809645:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809649:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80964d:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  809651:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809655:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809659:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80965d:	48 89 c7             	mov    rdi,rax
  809660:	ff d2                	call   rdx
		DISK1_FAT32_write_FAT_Entry(fsbi,cluster,0x0ffffff8);
  809662:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809666:	89 c1                	mov    ecx,eax
  809668:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80966c:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  809671:	89 ce                	mov    esi,ecx
  809673:	48 89 c7             	mov    rdi,rax
  809676:	e8 66 f9 ff ff       	call   808fe1 <DISK1_FAT32_write_FAT_Entry>
	}

	index = count;
  80967b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  809682:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax

	do
	{
		if(!flags)
  809685:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80968a:	0f 85 91 00 00 00    	jne    809721 <FAT32_write+0x23f>
		{
			memset(buffer,0,fsbi->bytes_per_cluster);
  809690:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809694:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809698:	89 c2                	mov    edx,eax
  80969a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80969e:	be 00 00 00 00       	mov    esi,0x0
  8096a3:	48 89 c7             	mov    rdi,rax
  8096a6:	e8 b6 22 00 00       	call   80b961 <memset>
			sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  8096ab:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8096af:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  8096b3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8096b7:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  8096bb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8096bf:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8096c3:	48 0f af c2          	imul   rax,rdx
  8096c7:	48 01 c8             	add    rax,rcx
  8096ca:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  8096ce:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8096d2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8096d6:	89 c1                	mov    ecx,eax
  8096d8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8096dc:	89 c2                	mov    edx,eax
  8096de:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8096e2:	49 89 c0             	mov    r8,rax
  8096e5:	be 00 00 00 00       	mov    esi,0x0
  8096ea:	bf 00 00 00 00       	mov    edi,0x0
  8096ef:	e8 aa eb ff ff       	call   80829e <request>
  8096f4:	89 45 9c             	mov    DWORD PTR [rbp-0x64],eax

			if(!chk_result(r))
  8096f7:	8b 45 9c             	mov    eax,DWORD PTR [rbp-0x64]
  8096fa:	89 c7                	mov    edi,eax
  8096fc:	e8 51 f2 ff ff       	call   808952 <chk_result>
  809701:	85 c0                	test   eax,eax
  809703:	75 1c                	jne    809721 <FAT32_write+0x23f>
			{
				printf("FAT32 FS(write) read disk ERROR!!!!!!!!!!\n");
  809705:	bf f0 43 81 00       	mov    edi,0x8143f0
  80970a:	b8 00 00 00 00       	mov    eax,0x0
  80970f:	e8 13 76 ff ff       	call   800d27 <printf>
				retval = -EIO;
  809714:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  80971b:	ff 
				break;
  80971c:	e9 95 01 00 00       	jmp    8098b6 <FAT32_write+0x3d4>
			}
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  809721:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  809724:	48 63 d0             	movsxd rdx,eax
  809727:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80972b:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80972f:	48 2b 45 c8          	sub    rax,QWORD PTR [rbp-0x38]
  809733:	48 39 c2             	cmp    rdx,rax
  809736:	48 0f 4e c2          	cmovle rax,rdx
  80973a:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax

		if((unsigned long)buf < MAX_TASKS)
  80973d:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  809741:	48 83 f8 1f          	cmp    rax,0x1f
  809745:	77 1f                	ja     809766 <FAT32_write+0x284>
			memcpy(buf,buffer + offset,length);
  809747:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  80974a:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  80974e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809752:	48 01 c1             	add    rcx,rax
  809755:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  809759:	48 89 ce             	mov    rsi,rcx
  80975c:	48 89 c7             	mov    rdi,rax
  80975f:	e8 4e 21 00 00       	call   80b8b2 <memcpy>
  809764:	eb 1d                	jmp    809783 <FAT32_write+0x2a1>
		else
			memcpy(buf,buffer + offset,length);
  809766:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  809769:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  80976d:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809771:	48 01 c1             	add    rcx,rax
  809774:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  809778:	48 89 ce             	mov    rsi,rcx
  80977b:	48 89 c7             	mov    rdi,rax
  80977e:	e8 2f 21 00 00       	call   80b8b2 <memcpy>

		int r=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  809783:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809787:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80978b:	89 c1                	mov    ecx,eax
  80978d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809791:	89 c2                	mov    edx,eax
  809793:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809797:	49 89 c0             	mov    r8,rax
  80979a:	be 01 00 00 00       	mov    esi,0x1
  80979f:	bf 00 00 00 00       	mov    edi,0x0
  8097a4:	e8 f5 ea ff ff       	call   80829e <request>
  8097a9:	89 45 98             	mov    DWORD PTR [rbp-0x68],eax
        if(!chk_result(r))
  8097ac:	8b 45 98             	mov    eax,DWORD PTR [rbp-0x68]
  8097af:	89 c7                	mov    edi,eax
  8097b1:	e8 9c f1 ff ff       	call   808952 <chk_result>
  8097b6:	85 c0                	test   eax,eax
  8097b8:	75 1c                	jne    8097d6 <FAT32_write+0x2f4>
		{
			printf("FAT32 FS(write) write disk ERROR!!!!!!!!!!\n");
  8097ba:	bf 20 44 81 00       	mov    edi,0x814420
  8097bf:	b8 00 00 00 00       	mov    eax,0x0
  8097c4:	e8 5e 75 ff ff       	call   800d27 <printf>
			retval = -EIO;
  8097c9:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  8097d0:	ff 
			break;
  8097d1:	e9 e0 00 00 00       	jmp    8098b6 <FAT32_write+0x3d4>
		}

		index -= length;
  8097d6:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8097d9:	29 45 d4             	sub    DWORD PTR [rbp-0x2c],eax
		buf += length;
  8097dc:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8097df:	48 98                	cdqe   
  8097e1:	48 01 45 80          	add    QWORD PTR [rbp-0x80],rax
		offset -= offset;
  8097e5:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  8097ec:	00 
		*position += length;
  8097ed:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8097f4:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8097f7:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8097fa:	48 98                	cdqe   
  8097fc:	48 01 c2             	add    rdx,rax
  8097ff:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  809806:	48 89 10             	mov    QWORD PTR [rax],rdx

		if(index)
  809809:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  80980d:	0f 84 a2 00 00 00    	je     8098b5 <FAT32_write+0x3d3>
			next_cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  809813:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809817:	89 c2                	mov    edx,eax
  809819:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80981d:	89 d6                	mov    esi,edx
  80981f:	48 89 c7             	mov    rdi,rax
  809822:	e8 fe f6 ff ff       	call   808f25 <DISK1_FAT32_read_FAT_Entry>
  809827:	89 c0                	mov    eax,eax
  809829:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
		else
			break;

		if(next_cluster >= 0x0ffffff8)
  80982d:	48 81 7d b0 f7 ff ff 	cmp    QWORD PTR [rbp-0x50],0xffffff7
  809834:	0f 
  809835:	76 72                	jbe    8098a9 <FAT32_write+0x3c7>
		{
			next_cluster = FAT32_find_available_cluster(fsbi);
  809837:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80983b:	48 89 c7             	mov    rdi,rax
  80983e:	e8 cd fb ff ff       	call   809410 <FAT32_find_available_cluster>
  809843:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
			if(!next_cluster)
  809847:	48 83 7d b0 00       	cmp    QWORD PTR [rbp-0x50],0x0
  80984c:	75 18                	jne    809866 <FAT32_write+0x384>
			{
				vmfree(buffer);
  80984e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809852:	48 89 c7             	mov    rdi,rax
  809855:	e8 ee 7a ff ff       	call   801348 <vmfree>
				return -ENOSPC;
  80985a:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  809861:	e9 d4 00 00 00       	jmp    80993a <FAT32_write+0x458>
			}			
				
			DISK1_FAT32_write_FAT_Entry(fsbi,cluster,next_cluster);
  809866:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80986a:	89 c2                	mov    edx,eax
  80986c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809870:	89 c1                	mov    ecx,eax
  809872:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809876:	89 ce                	mov    esi,ecx
  809878:	48 89 c7             	mov    rdi,rax
  80987b:	e8 61 f7 ff ff       	call   808fe1 <DISK1_FAT32_write_FAT_Entry>
			DISK1_FAT32_write_FAT_Entry(fsbi,next_cluster,0x0ffffff8);
  809880:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  809884:	89 c1                	mov    ecx,eax
  809886:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80988a:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  80988f:	89 ce                	mov    esi,ecx
  809891:	48 89 c7             	mov    rdi,rax
  809894:	e8 48 f7 ff ff       	call   808fe1 <DISK1_FAT32_write_FAT_Entry>
			cluster = next_cluster;
  809899:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80989d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			flags = 1;
  8098a1:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  8098a8:	00 
		}

	}while(index);
  8098a9:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  8098ad:	0f 85 d2 fd ff ff    	jne    809685 <FAT32_write+0x1a3>
  8098b3:	eb 01                	jmp    8098b6 <FAT32_write+0x3d4>
			break;
  8098b5:	90                   	nop

	if(*position > filp->dentry->dir_inode->file_size)
  8098b6:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8098bd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8098c0:	48 89 c2             	mov    rdx,rax
  8098c3:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8098c7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8098cb:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8098cf:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8098d2:	48 39 c2             	cmp    rdx,rax
  8098d5:	76 42                	jbe    809919 <FAT32_write+0x437>
	{
		filp->dentry->dir_inode->file_size = *position;
  8098d7:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8098de:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8098e1:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8098e5:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8098e9:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8098ed:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  8098f0:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8098f4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8098f8:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8098fc:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809900:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  809904:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  809908:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80990c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809910:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809914:	48 89 c7             	mov    rdi,rax
  809917:	ff d2                	call   rdx
	}

	vmfree(buffer);
  809919:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80991d:	48 89 c7             	mov    rdi,rax
  809920:	e8 23 7a ff ff       	call   801348 <vmfree>
	if(!index)
  809925:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  809929:	75 0b                	jne    809936 <FAT32_write+0x454>
		retval = count;
  80992b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  809932:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	return retval;
  809936:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  80993a:	c9                   	leave  
  80993b:	c3                   	ret    

000000000080993c <FAT32_lseek>:


long FAT32_lseek(struct file * filp,long offset,long origin)
{
  80993c:	f3 0f 1e fa          	endbr64 
  809940:	55                   	push   rbp
  809941:	48 89 e5             	mov    rbp,rsp
  809944:	48 83 ec 30          	sub    rsp,0x30
  809948:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80994c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  809950:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	struct index_node *inode = filp->dentry->dir_inode;
  809954:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809958:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80995c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809960:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	long pos = 0;
  809964:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80996b:	00 

	switch(origin)
  80996c:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  809971:	74 21                	je     809994 <FAT32_lseek+0x58>
  809973:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  809978:	7f 4a                	jg     8099c4 <FAT32_lseek+0x88>
  80997a:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80997f:	74 09                	je     80998a <FAT32_lseek+0x4e>
  809981:	48 83 7d d8 01       	cmp    QWORD PTR [rbp-0x28],0x1
  809986:	74 20                	je     8099a8 <FAT32_lseek+0x6c>
  809988:	eb 3a                	jmp    8099c4 <FAT32_lseek+0x88>
	{
		case SEEK_SET:
				pos = offset;
  80998a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80998e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  809992:	eb 39                	jmp    8099cd <FAT32_lseek+0x91>

		case SEEK_CUR:
				pos =  filp->position + offset;
  809994:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809998:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80999b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80999f:	48 01 d0             	add    rax,rdx
  8099a2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  8099a6:	eb 25                	jmp    8099cd <FAT32_lseek+0x91>

		case SEEK_END:
				pos = filp->dentry->dir_inode->file_size + offset;
  8099a8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8099ac:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8099b0:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8099b4:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8099b7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8099bb:	48 01 d0             	add    rax,rdx
  8099be:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  8099c2:	eb 09                	jmp    8099cd <FAT32_lseek+0x91>

		default:
			return -EINVAL;
  8099c4:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  8099cb:	eb 50                	jmp    809a1d <FAT32_lseek+0xe1>
			break;
	}

	if(pos < 0 || pos > filp->dentry->dir_inode->file_size)
  8099cd:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8099d2:	78 18                	js     8099ec <FAT32_lseek+0xb0>
  8099d4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8099d8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8099dc:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8099e0:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8099e3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8099e7:	48 39 c2             	cmp    rdx,rax
  8099ea:	73 09                	jae    8099f5 <FAT32_lseek+0xb9>
		return -EOVERFLOW;
  8099ec:	48 c7 c0 bf ff ff ff 	mov    rax,0xffffffffffffffbf
  8099f3:	eb 28                	jmp    809a1d <FAT32_lseek+0xe1>

	filp->position = pos;
  8099f5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8099f9:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8099fd:	48 89 10             	mov    QWORD PTR [rax],rdx
	printf("FAT32 FS(lseek) alert position:%d\n",filp->position);
  809a00:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809a04:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809a07:	48 89 c6             	mov    rsi,rax
  809a0a:	bf 50 44 81 00       	mov    edi,0x814450
  809a0f:	b8 00 00 00 00       	mov    eax,0x0
  809a14:	e8 0e 73 ff ff       	call   800d27 <printf>

	return pos;
  809a19:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  809a1d:	c9                   	leave  
  809a1e:	c3                   	ret    

0000000000809a1f <FAT32_ioctl>:


long FAT32_ioctl(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg)
{}
  809a1f:	f3 0f 1e fa          	endbr64 
  809a23:	55                   	push   rbp
  809a24:	48 89 e5             	mov    rbp,rsp
  809a27:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809a2b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  809a2f:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  809a33:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  809a37:	90                   	nop
  809a38:	5d                   	pop    rbp
  809a39:	c3                   	ret    

0000000000809a3a <FAT32_readdir>:

long FAT32_readdir(struct file * filp,void * dirent,filldir_t filler)
{
  809a3a:	f3 0f 1e fa          	endbr64 
  809a3e:	55                   	push   rbp
  809a3f:	48 89 e5             	mov    rbp,rsp
  809a42:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  809a46:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  809a4a:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  809a4e:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  809a52:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809a56:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809a5a:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809a5e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809a62:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  809a66:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809a6a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809a6e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809a72:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809a76:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809a7a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned int cluster = 0;
  809a7e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  809a85:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  809a8c:	00 
	unsigned char * buf =NULL; 
  809a8d:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
  809a94:	00 
	char *name = NULL;
  809a95:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  809a9c:	00 
	int namelen = 0;
  809a9d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
	int i = 0,j = 0,x = 0,y = 0;
  809aa4:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  809aab:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
  809ab2:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  809ab9:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  809ac0:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  809ac7:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  809ac8:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  809acf:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  809ad0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809ad4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809ad8:	be 00 00 00 00       	mov    esi,0x0
  809add:	48 89 c7             	mov    rdi,rax
  809ae0:	b8 00 00 00 00       	mov    eax,0x0
  809ae5:	e8 cf 77 ff ff       	call   8012b9 <vmalloc>
  809aea:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax

	cluster = finode->first_cluster;
  809aee:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809af2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809af5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

	j = filp->position/fsbi->bytes_per_cluster;
  809af8:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809afc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809aff:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  809b03:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  809b07:	48 99                	cqo    
  809b09:	48 f7 fe             	idiv   rsi
  809b0c:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	
	for(i = 0;i<j;i++)
  809b0f:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  809b16:	eb 3a                	jmp    809b52 <FAT32_readdir+0x118>
	{
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  809b18:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  809b1b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809b1f:	89 d6                	mov    esi,edx
  809b21:	48 89 c7             	mov    rdi,rax
  809b24:	e8 fc f3 ff ff       	call   808f25 <DISK1_FAT32_read_FAT_Entry>
  809b29:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
		if(cluster > 0x0ffffff7)
  809b2c:	81 7d fc f7 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff7
  809b33:	76 19                	jbe    809b4e <FAT32_readdir+0x114>
		{
			printf("FAT32 FS(readdir) cluster didn`t exist\n");
  809b35:	bf 78 44 81 00       	mov    edi,0x814478
  809b3a:	b8 00 00 00 00       	mov    eax,0x0
  809b3f:	e8 e3 71 ff ff       	call   800d27 <printf>
			return NULL;
  809b44:	b8 00 00 00 00       	mov    eax,0x0
  809b49:	e9 86 05 00 00       	jmp    80a0d4 <FAT32_readdir+0x69a>
	for(i = 0;i<j;i++)
  809b4e:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  809b52:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809b55:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  809b58:	7c be                	jl     809b18 <FAT32_readdir+0xde>
		}
	}

next_cluster:
  809b5a:	90                   	nop
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  809b5b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809b5f:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  809b63:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809b66:	83 e8 02             	sub    eax,0x2
  809b69:	89 c1                	mov    ecx,eax
  809b6b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809b6f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809b73:	48 0f af c1          	imul   rax,rcx
  809b77:	48 01 d0             	add    rax,rdx
  809b7a:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  809b7e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809b82:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809b86:	89 c1                	mov    ecx,eax
  809b88:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  809b8c:	89 c2                	mov    edx,eax
  809b8e:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  809b92:	49 89 c0             	mov    r8,rax
  809b95:	be 00 00 00 00       	mov    esi,0x0
  809b9a:	bf 00 00 00 00       	mov    edi,0x0
  809b9f:	e8 fa e6 ff ff       	call   80829e <request>
  809ba4:	89 45 a4             	mov    DWORD PTR [rbp-0x5c],eax
    if(!chk_result(r))
  809ba7:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  809baa:	89 c7                	mov    edi,eax
  809bac:	e8 a1 ed ff ff       	call   808952 <chk_result>
  809bb1:	85 c0                	test   eax,eax
  809bb3:	75 25                	jne    809bda <FAT32_readdir+0x1a0>
	{
		printf("FAT32 FS(readdir) read disk ERROR!!!!!!!!!!\n");
  809bb5:	bf a0 44 81 00       	mov    edi,0x8144a0
  809bba:	b8 00 00 00 00       	mov    eax,0x0
  809bbf:	e8 63 71 ff ff       	call   800d27 <printf>
		vmfree(buf);
  809bc4:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  809bc8:	48 89 c7             	mov    rdi,rax
  809bcb:	e8 78 77 ff ff       	call   801348 <vmfree>
		return NULL;
  809bd0:	b8 00 00 00 00       	mov    eax,0x0
  809bd5:	e9 fa 04 00 00       	jmp    80a0d4 <FAT32_readdir+0x69a>
	}

	tmpdentry = (struct FAT32_Directory *)(buf + filp->position%fsbi->bytes_per_cluster);
  809bda:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809bde:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809be1:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  809be5:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  809be9:	48 99                	cqo    
  809beb:	48 f7 f9             	idiv   rcx
  809bee:	48 89 d0             	mov    rax,rdx
  809bf1:	48 89 c2             	mov    rdx,rax
  809bf4:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  809bf8:	48 01 d0             	add    rax,rdx
  809bfb:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  809bff:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809c03:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809c06:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  809c0a:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  809c0e:	48 99                	cqo    
  809c10:	48 f7 f9             	idiv   rcx
  809c13:	48 89 d0             	mov    rax,rdx
  809c16:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  809c19:	e9 2f 04 00 00       	jmp    80a04d <FAT32_readdir+0x613>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  809c1e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809c22:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809c26:	3c 0f                	cmp    al,0xf
  809c28:	0f 84 00 04 00 00    	je     80a02e <FAT32_readdir+0x5f4>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  809c2e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809c32:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809c35:	3c e5                	cmp    al,0xe5
  809c37:	0f 84 f4 03 00 00    	je     80a031 <FAT32_readdir+0x5f7>
  809c3d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809c41:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809c44:	84 c0                	test   al,al
  809c46:	0f 84 e5 03 00 00    	je     80a031 <FAT32_readdir+0x5f7>
  809c4c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809c50:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809c53:	3c 05                	cmp    al,0x5
  809c55:	0f 84 d6 03 00 00    	je     80a031 <FAT32_readdir+0x5f7>
			continue;

		namelen = 0;
  809c5b:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  809c62:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809c66:	48 83 e8 20          	sub    rax,0x20
  809c6a:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

		if(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  809c6e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809c72:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809c76:	3c 0f                	cmp    al,0xf
  809c78:	0f 85 2a 02 00 00    	jne    809ea8 <FAT32_readdir+0x46e>
  809c7e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809c82:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809c85:	3c e5                	cmp    al,0xe5
  809c87:	0f 84 1b 02 00 00    	je     809ea8 <FAT32_readdir+0x46e>
  809c8d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809c91:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809c94:	84 c0                	test   al,al
  809c96:	0f 84 0c 02 00 00    	je     809ea8 <FAT32_readdir+0x46e>
  809c9c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809ca0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809ca3:	3c 05                	cmp    al,0x5
  809ca5:	0f 84 fd 01 00 00    	je     809ea8 <FAT32_readdir+0x46e>
		{
			j = 0;
  809cab:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
			//long file/dir name read
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  809cb2:	eb 1a                	jmp    809cce <FAT32_readdir+0x294>
			{
				j++;
  809cb4:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
				if(tmpldentry->LDIR_Ord & 0x40)
  809cb8:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809cbc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809cbf:	0f b6 c0             	movzx  eax,al
  809cc2:	83 e0 40             	and    eax,0x40
  809cc5:	85 c0                	test   eax,eax
  809cc7:	75 34                	jne    809cfd <FAT32_readdir+0x2c3>
					break;
				tmpldentry --;
  809cc9:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  809cce:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809cd2:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809cd6:	3c 0f                	cmp    al,0xf
  809cd8:	75 24                	jne    809cfe <FAT32_readdir+0x2c4>
  809cda:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809cde:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809ce1:	3c e5                	cmp    al,0xe5
  809ce3:	74 19                	je     809cfe <FAT32_readdir+0x2c4>
  809ce5:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809ce9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809cec:	84 c0                	test   al,al
  809cee:	74 0e                	je     809cfe <FAT32_readdir+0x2c4>
  809cf0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809cf4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809cf7:	3c 05                	cmp    al,0x5
  809cf9:	75 b9                	jne    809cb4 <FAT32_readdir+0x27a>
  809cfb:	eb 01                	jmp    809cfe <FAT32_readdir+0x2c4>
					break;
  809cfd:	90                   	nop
			}

			name = vmalloc(j*13+1,0);
  809cfe:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  809d01:	89 d0                	mov    eax,edx
  809d03:	01 c0                	add    eax,eax
  809d05:	01 d0                	add    eax,edx
  809d07:	c1 e0 02             	shl    eax,0x2
  809d0a:	01 d0                	add    eax,edx
  809d0c:	83 c0 01             	add    eax,0x1
  809d0f:	be 00 00 00 00       	mov    esi,0x0
  809d14:	89 c7                	mov    edi,eax
  809d16:	b8 00 00 00 00       	mov    eax,0x0
  809d1b:	e8 99 75 ff ff       	call   8012b9 <vmalloc>
  809d20:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
			memset(name,0,j*13+1);
  809d24:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  809d27:	89 d0                	mov    eax,edx
  809d29:	01 c0                	add    eax,eax
  809d2b:	01 d0                	add    eax,edx
  809d2d:	c1 e0 02             	shl    eax,0x2
  809d30:	01 d0                	add    eax,edx
  809d32:	83 c0 01             	add    eax,0x1
  809d35:	89 c2                	mov    edx,eax
  809d37:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809d3b:	be 00 00 00 00       	mov    esi,0x0
  809d40:	48 89 c7             	mov    rdi,rax
  809d43:	e8 19 1c 00 00       	call   80b961 <memset>
			tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  809d48:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809d4c:	48 83 e8 20          	sub    rax,0x20
  809d50:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

			for(x = 0;x<j;x++,tmpldentry --)
  809d54:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  809d5b:	e9 37 01 00 00       	jmp    809e97 <FAT32_readdir+0x45d>
			{
				for(y = 0;y<5;y++)
  809d60:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  809d67:	eb 53                	jmp    809dbc <FAT32_readdir+0x382>
					if(tmpldentry->LDIR_Name1[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  809d69:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809d6d:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809d70:	48 63 d2             	movsxd rdx,edx
  809d73:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  809d78:	66 83 f8 ff          	cmp    ax,0xffff
  809d7c:	74 3a                	je     809db8 <FAT32_readdir+0x37e>
  809d7e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809d82:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809d85:	48 63 d2             	movsxd rdx,edx
  809d88:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  809d8d:	66 85 c0             	test   ax,ax
  809d90:	74 26                	je     809db8 <FAT32_readdir+0x37e>
						name[namelen++] = (char)tmpldentry->LDIR_Name1[y];
  809d92:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809d96:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809d99:	48 63 d2             	movsxd rdx,edx
  809d9c:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  809da1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809da4:	8d 50 01             	lea    edx,[rax+0x1]
  809da7:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809daa:	48 63 d0             	movsxd rdx,eax
  809dad:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809db1:	48 01 d0             	add    rax,rdx
  809db4:	89 ca                	mov    edx,ecx
  809db6:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<5;y++)
  809db8:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  809dbc:	83 7d dc 04          	cmp    DWORD PTR [rbp-0x24],0x4
  809dc0:	7e a7                	jle    809d69 <FAT32_readdir+0x32f>

				for(y = 0;y<6;y++)
  809dc2:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  809dc9:	eb 53                	jmp    809e1e <FAT32_readdir+0x3e4>
					if(tmpldentry->LDIR_Name2[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  809dcb:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809dcf:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809dd2:	48 63 d2             	movsxd rdx,edx
  809dd5:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  809dda:	66 83 f8 ff          	cmp    ax,0xffff
  809dde:	74 3a                	je     809e1a <FAT32_readdir+0x3e0>
  809de0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809de4:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809de7:	48 63 d2             	movsxd rdx,edx
  809dea:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  809def:	66 85 c0             	test   ax,ax
  809df2:	74 26                	je     809e1a <FAT32_readdir+0x3e0>
						name[namelen++] = (char)tmpldentry->LDIR_Name2[y];
  809df4:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809df8:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809dfb:	48 63 d2             	movsxd rdx,edx
  809dfe:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  809e03:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809e06:	8d 50 01             	lea    edx,[rax+0x1]
  809e09:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809e0c:	48 63 d0             	movsxd rdx,eax
  809e0f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809e13:	48 01 d0             	add    rax,rdx
  809e16:	89 ca                	mov    edx,ecx
  809e18:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<6;y++)
  809e1a:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  809e1e:	83 7d dc 05          	cmp    DWORD PTR [rbp-0x24],0x5
  809e22:	7e a7                	jle    809dcb <FAT32_readdir+0x391>

				for(y = 0;y<2;y++)
  809e24:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  809e2b:	eb 5b                	jmp    809e88 <FAT32_readdir+0x44e>
					if(tmpldentry->LDIR_Name3[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  809e2d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809e31:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809e34:	48 63 d2             	movsxd rdx,edx
  809e37:	48 83 c2 08          	add    rdx,0x8
  809e3b:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  809e40:	66 83 f8 ff          	cmp    ax,0xffff
  809e44:	74 3e                	je     809e84 <FAT32_readdir+0x44a>
  809e46:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809e4a:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809e4d:	48 63 d2             	movsxd rdx,edx
  809e50:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  809e55:	66 85 c0             	test   ax,ax
  809e58:	74 2a                	je     809e84 <FAT32_readdir+0x44a>
						name[namelen++] = (char)tmpldentry->LDIR_Name3[y];
  809e5a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809e5e:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809e61:	48 63 d2             	movsxd rdx,edx
  809e64:	48 83 c2 08          	add    rdx,0x8
  809e68:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  809e6d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809e70:	8d 50 01             	lea    edx,[rax+0x1]
  809e73:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809e76:	48 63 d0             	movsxd rdx,eax
  809e79:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809e7d:	48 01 d0             	add    rax,rdx
  809e80:	89 ca                	mov    edx,ecx
  809e82:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<2;y++)
  809e84:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  809e88:	83 7d dc 01          	cmp    DWORD PTR [rbp-0x24],0x1
  809e8c:	7e 9f                	jle    809e2d <FAT32_readdir+0x3f3>
			for(x = 0;x<j;x++,tmpldentry --)
  809e8e:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  809e92:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
  809e97:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809e9a:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  809e9d:	0f 8c bd fe ff ff    	jl     809d60 <FAT32_readdir+0x326>
			}
			goto find_lookup_success;
  809ea3:	e9 f5 01 00 00       	jmp    80a09d <FAT32_readdir+0x663>
		}

		name = vmalloc(15,0);
  809ea8:	be 00 00 00 00       	mov    esi,0x0
  809ead:	bf 0f 00 00 00       	mov    edi,0xf
  809eb2:	b8 00 00 00 00       	mov    eax,0x0
  809eb7:	e8 fd 73 ff ff       	call   8012b9 <vmalloc>
  809ebc:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
		memset(name,0,15);
  809ec0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809ec4:	ba 0f 00 00 00       	mov    edx,0xf
  809ec9:	be 00 00 00 00       	mov    esi,0x0
  809ece:	48 89 c7             	mov    rdi,rax
  809ed1:	e8 8b 1a 00 00       	call   80b961 <memset>
		//short file/dir base name compare
		for(x=0;x<8;x++)
  809ed6:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  809edd:	eb 74                	jmp    809f53 <FAT32_readdir+0x519>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  809edf:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809ee3:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809ee6:	48 98                	cdqe   
  809ee8:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809eec:	3c 20                	cmp    al,0x20
  809eee:	74 6b                	je     809f5b <FAT32_readdir+0x521>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  809ef0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809ef4:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  809ef8:	0f b6 c0             	movzx  eax,al
  809efb:	83 e0 08             	and    eax,0x8
  809efe:	85 c0                	test   eax,eax
  809f00:	74 29                	je     809f2b <FAT32_readdir+0x4f1>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  809f02:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809f06:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809f09:	48 98                	cdqe   
  809f0b:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809f0f:	8d 48 20             	lea    ecx,[rax+0x20]
  809f12:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809f15:	8d 50 01             	lea    edx,[rax+0x1]
  809f18:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809f1b:	48 63 d0             	movsxd rdx,eax
  809f1e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809f22:	48 01 d0             	add    rax,rdx
  809f25:	89 ca                	mov    edx,ecx
  809f27:	88 10                	mov    BYTE PTR [rax],dl
  809f29:	eb 24                	jmp    809f4f <FAT32_readdir+0x515>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  809f2b:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809f2f:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809f32:	48 98                	cdqe   
  809f34:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  809f38:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809f3b:	8d 50 01             	lea    edx,[rax+0x1]
  809f3e:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809f41:	48 63 d0             	movsxd rdx,eax
  809f44:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809f48:	48 01 d0             	add    rax,rdx
  809f4b:	89 ca                	mov    edx,ecx
  809f4d:	88 10                	mov    BYTE PTR [rax],dl
		for(x=0;x<8;x++)
  809f4f:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  809f53:	83 7d e0 07          	cmp    DWORD PTR [rbp-0x20],0x7
  809f57:	7e 86                	jle    809edf <FAT32_readdir+0x4a5>
  809f59:	eb 01                	jmp    809f5c <FAT32_readdir+0x522>
				break;
  809f5b:	90                   	nop
		}

		if(tmpdentry->DIR_Attr & ATTR_DIRECTORY)
  809f5c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809f60:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809f64:	0f b6 c0             	movzx  eax,al
  809f67:	83 e0 10             	and    eax,0x10
  809f6a:	85 c0                	test   eax,eax
  809f6c:	0f 85 27 01 00 00    	jne    80a099 <FAT32_readdir+0x65f>
			goto find_lookup_success;

		name[namelen++] = '.';
  809f72:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809f75:	8d 50 01             	lea    edx,[rax+0x1]
  809f78:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809f7b:	48 63 d0             	movsxd rdx,eax
  809f7e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809f82:	48 01 d0             	add    rax,rdx
  809f85:	c6 00 2e             	mov    BYTE PTR [rax],0x2e

		//short file ext name compare
		for(x=8;x<11;x++)
  809f88:	c7 45 e0 08 00 00 00 	mov    DWORD PTR [rbp-0x20],0x8
  809f8f:	eb 74                	jmp    80a005 <FAT32_readdir+0x5cb>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  809f91:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809f95:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809f98:	48 98                	cdqe   
  809f9a:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809f9e:	3c 20                	cmp    al,0x20
  809fa0:	74 6b                	je     80a00d <FAT32_readdir+0x5d3>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  809fa2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809fa6:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  809faa:	0f b6 c0             	movzx  eax,al
  809fad:	83 e0 10             	and    eax,0x10
  809fb0:	85 c0                	test   eax,eax
  809fb2:	74 29                	je     809fdd <FAT32_readdir+0x5a3>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  809fb4:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809fb8:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809fbb:	48 98                	cdqe   
  809fbd:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809fc1:	8d 48 20             	lea    ecx,[rax+0x20]
  809fc4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809fc7:	8d 50 01             	lea    edx,[rax+0x1]
  809fca:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809fcd:	48 63 d0             	movsxd rdx,eax
  809fd0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809fd4:	48 01 d0             	add    rax,rdx
  809fd7:	89 ca                	mov    edx,ecx
  809fd9:	88 10                	mov    BYTE PTR [rax],dl
  809fdb:	eb 24                	jmp    80a001 <FAT32_readdir+0x5c7>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  809fdd:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809fe1:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809fe4:	48 98                	cdqe   
  809fe6:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  809fea:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809fed:	8d 50 01             	lea    edx,[rax+0x1]
  809ff0:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809ff3:	48 63 d0             	movsxd rdx,eax
  809ff6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809ffa:	48 01 d0             	add    rax,rdx
  809ffd:	89 ca                	mov    edx,ecx
  809fff:	88 10                	mov    BYTE PTR [rax],dl
		for(x=8;x<11;x++)
  80a001:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  80a005:	83 7d e0 0a          	cmp    DWORD PTR [rbp-0x20],0xa
  80a009:	7e 86                	jle    809f91 <FAT32_readdir+0x557>
  80a00b:	eb 01                	jmp    80a00e <FAT32_readdir+0x5d4>
				break;
  80a00d:	90                   	nop
		}
		if(x == 8)
  80a00e:	83 7d e0 08          	cmp    DWORD PTR [rbp-0x20],0x8
  80a012:	0f 85 84 00 00 00    	jne    80a09c <FAT32_readdir+0x662>
			name[--namelen] = 0;
  80a018:	83 6d ec 01          	sub    DWORD PTR [rbp-0x14],0x1
  80a01c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80a01f:	48 63 d0             	movsxd rdx,eax
  80a022:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a026:	48 01 d0             	add    rax,rdx
  80a029:	c6 00 00             	mov    BYTE PTR [rax],0x0
		goto find_lookup_success;
  80a02c:	eb 6e                	jmp    80a09c <FAT32_readdir+0x662>
			continue;
  80a02e:	90                   	nop
  80a02f:	eb 01                	jmp    80a032 <FAT32_readdir+0x5f8>
			continue;
  80a031:	90                   	nop
	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  80a032:	83 45 e8 20          	add    DWORD PTR [rbp-0x18],0x20
  80a036:	48 83 45 d0 20       	add    QWORD PTR [rbp-0x30],0x20
  80a03b:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a03f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a042:	48 8d 50 20          	lea    rdx,[rax+0x20]
  80a046:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a04a:	48 89 10             	mov    QWORD PTR [rax],rdx
  80a04d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80a050:	48 63 d0             	movsxd rdx,eax
  80a053:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a057:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a05b:	48 39 c2             	cmp    rdx,rax
  80a05e:	0f 8c ba fb ff ff    	jl     809c1e <FAT32_readdir+0x1e4>
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80a064:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80a067:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a06b:	89 d6                	mov    esi,edx
  80a06d:	48 89 c7             	mov    rdi,rax
  80a070:	e8 b0 ee ff ff       	call   808f25 <DISK1_FAT32_read_FAT_Entry>
  80a075:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  80a078:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  80a07f:	77 05                	ja     80a086 <FAT32_readdir+0x64c>
		goto next_cluster;
  80a081:	e9 d5 fa ff ff       	jmp    809b5b <FAT32_readdir+0x121>

	vmfree(buf);
  80a086:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80a08a:	48 89 c7             	mov    rdi,rax
  80a08d:	e8 b6 72 ff ff       	call   801348 <vmfree>
	return NULL;
  80a092:	b8 00 00 00 00       	mov    eax,0x0
  80a097:	eb 3b                	jmp    80a0d4 <FAT32_readdir+0x69a>
			goto find_lookup_success;
  80a099:	90                   	nop
  80a09a:	eb 01                	jmp    80a09d <FAT32_readdir+0x663>
		goto find_lookup_success;
  80a09c:	90                   	nop

find_lookup_success:

	filp->position += 32;
  80a09d:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a0a1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a0a4:	48 8d 50 20          	lea    rdx,[rax+0x20]
  80a0a8:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a0ac:	48 89 10             	mov    QWORD PTR [rax],rdx
	return filler(dirent,name,namelen,0,0);
  80a0af:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80a0b2:	48 63 d0             	movsxd rdx,eax
  80a0b5:	48 8b 75 f0          	mov    rsi,QWORD PTR [rbp-0x10]
  80a0b9:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80a0bd:	4c 8b 4d 88          	mov    r9,QWORD PTR [rbp-0x78]
  80a0c1:	41 b8 00 00 00 00    	mov    r8d,0x0
  80a0c7:	b9 00 00 00 00       	mov    ecx,0x0
  80a0cc:	48 89 c7             	mov    rdi,rax
  80a0cf:	41 ff d1             	call   r9
  80a0d2:	48 98                	cdqe   
}
  80a0d4:	c9                   	leave  
  80a0d5:	c3                   	ret    

000000000080a0d6 <FAT32_create>:
	.readdir = FAT32_readdir,
};


long FAT32_create(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  80a0d6:	f3 0f 1e fa          	endbr64 
  80a0da:	55                   	push   rbp
  80a0db:	48 89 e5             	mov    rbp,rsp
  80a0de:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a0e2:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a0e6:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80a0e9:	90                   	nop
  80a0ea:	5d                   	pop    rbp
  80a0eb:	c3                   	ret    

000000000080a0ec <FAT32_lookup>:


struct dir_entry * FAT32_lookup(struct index_node * parent_inode,struct dir_entry * dest_dentry)
{
  80a0ec:	f3 0f 1e fa          	endbr64 
  80a0f0:	55                   	push   rbp
  80a0f1:	48 89 e5             	mov    rbp,rsp
  80a0f4:	48 83 ec 60          	sub    rsp,0x60
  80a0f8:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  80a0fc:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
	struct FAT32_inode_info * finode = parent_inode->private_index_info;
  80a100:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80a104:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a108:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	struct FAT32_sb_info * fsbi = parent_inode->sb->private_sb_info;
  80a10c:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80a110:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a114:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a118:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	unsigned int cluster = 0;
  80a11c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  80a123:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  80a12a:	00 
	unsigned char * buf =NULL; 
  80a12b:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  80a132:	00 
	int i = 0,j = 0,x = 0;
  80a133:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80a13a:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80a141:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  80a148:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80a14f:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  80a150:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80a157:	00 
	struct index_node * p = NULL;
  80a158:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  80a15f:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  80a160:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a164:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a168:	be 00 00 00 00       	mov    esi,0x0
  80a16d:	48 89 c7             	mov    rdi,rax
  80a170:	b8 00 00 00 00       	mov    eax,0x0
  80a175:	e8 3f 71 ff ff       	call   8012b9 <vmalloc>
  80a17a:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax

	cluster = finode->first_cluster;
  80a17e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a182:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a185:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

next_cluster:
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  80a188:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a18c:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  80a190:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a193:	83 e8 02             	sub    eax,0x2
  80a196:	89 c1                	mov    ecx,eax
  80a198:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a19c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a1a0:	48 0f af c1          	imul   rax,rcx
  80a1a4:	48 01 d0             	add    rax,rdx
  80a1a7:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
	printf("lookup cluster:%#010x,sector:%x\n",cluster,sector);
  80a1ab:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80a1af:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a1b2:	89 c6                	mov    esi,eax
  80a1b4:	bf d0 44 81 00       	mov    edi,0x8144d0
  80a1b9:	b8 00 00 00 00       	mov    eax,0x0
  80a1be:	e8 64 6b ff ff       	call   800d27 <printf>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80a1c3:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a1c7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a1cb:	89 c1                	mov    ecx,eax
  80a1cd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a1d1:	89 c2                	mov    edx,eax
  80a1d3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80a1d7:	49 89 c0             	mov    r8,rax
  80a1da:	be 00 00 00 00       	mov    esi,0x0
  80a1df:	bf 00 00 00 00       	mov    edi,0x0
  80a1e4:	e8 b5 e0 ff ff       	call   80829e <request>
  80a1e9:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    if(!chk_result(r))
  80a1ec:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80a1ef:	89 c7                	mov    edi,eax
  80a1f1:	e8 5c e7 ff ff       	call   808952 <chk_result>
  80a1f6:	85 c0                	test   eax,eax
  80a1f8:	75 25                	jne    80a21f <FAT32_lookup+0x133>
	{
		printf("FAT32 FS(lookup) read disk ERROR!!!!!!!!!!\n");
  80a1fa:	bf f8 44 81 00       	mov    edi,0x8144f8
  80a1ff:	b8 00 00 00 00       	mov    eax,0x0
  80a204:	e8 1e 6b ff ff       	call   800d27 <printf>
		vmfree(buf);
  80a209:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80a20d:	48 89 c7             	mov    rdi,rax
  80a210:	e8 33 71 ff ff       	call   801348 <vmfree>
		return NULL;
  80a215:	b8 00 00 00 00       	mov    eax,0x0
  80a21a:	e9 f0 07 00 00       	jmp    80aa0f <FAT32_lookup+0x923>
	}

	tmpdentry = (struct FAT32_Directory *)buf;
  80a21f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80a223:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax

	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  80a227:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80a22e:	e9 9d 05 00 00       	jmp    80a7d0 <FAT32_lookup+0x6e4>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  80a233:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a237:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80a23b:	3c 0f                	cmp    al,0xf
  80a23d:	0f 84 59 05 00 00    	je     80a79c <FAT32_lookup+0x6b0>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  80a243:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a247:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a24a:	3c e5                	cmp    al,0xe5
  80a24c:	0f 84 4d 05 00 00    	je     80a79f <FAT32_lookup+0x6b3>
  80a252:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a256:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a259:	84 c0                	test   al,al
  80a25b:	0f 84 3e 05 00 00    	je     80a79f <FAT32_lookup+0x6b3>
  80a261:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a265:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a268:	3c 05                	cmp    al,0x5
  80a26a:	0f 84 2f 05 00 00    	je     80a79f <FAT32_lookup+0x6b3>
			continue;

		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  80a270:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a274:	48 83 e8 20          	sub    rax,0x20
  80a278:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
		j = 0;
  80a27c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0

		//long file/dir name compare
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  80a283:	e9 88 01 00 00       	jmp    80a410 <FAT32_lookup+0x324>
		{
			for(x=0;x<5;x++)
  80a288:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80a28f:	eb 6a                	jmp    80a2fb <FAT32_lookup+0x20f>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name1[x] == 0xffff)
  80a291:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a295:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a298:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a29b:	7e 15                	jle    80a2b2 <FAT32_lookup+0x1c6>
  80a29d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a2a1:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80a2a4:	48 63 d2             	movsxd rdx,edx
  80a2a7:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80a2ac:	66 83 f8 ff          	cmp    ax,0xffff
  80a2b0:	74 44                	je     80a2f6 <FAT32_lookup+0x20a>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name1[x] != (unsigned short)(dest_dentry->name[j++]))
  80a2b2:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a2b6:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a2b9:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a2bc:	0f 8f e0 04 00 00    	jg     80a7a2 <FAT32_lookup+0x6b6>
  80a2c2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a2c6:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80a2c9:	48 63 d2             	movsxd rdx,edx
  80a2cc:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  80a2d1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a2d5:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  80a2d8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a2db:	8d 50 01             	lea    edx,[rax+0x1]
  80a2de:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  80a2e1:	48 98                	cdqe   
  80a2e3:	48 01 f0             	add    rax,rsi
  80a2e6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a2e9:	66 98                	cbw    
  80a2eb:	66 39 c1             	cmp    cx,ax
  80a2ee:	0f 85 ae 04 00 00    	jne    80a7a2 <FAT32_lookup+0x6b6>
  80a2f4:	eb 01                	jmp    80a2f7 <FAT32_lookup+0x20b>
					continue;
  80a2f6:	90                   	nop
			for(x=0;x<5;x++)
  80a2f7:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80a2fb:	83 7d f0 04          	cmp    DWORD PTR [rbp-0x10],0x4
  80a2ff:	7e 90                	jle    80a291 <FAT32_lookup+0x1a5>
					goto continue_cmp_fail;
			}
			for(x=0;x<6;x++)
  80a301:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80a308:	eb 6a                	jmp    80a374 <FAT32_lookup+0x288>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name2[x] == 0xffff)
  80a30a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a30e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a311:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a314:	7e 15                	jle    80a32b <FAT32_lookup+0x23f>
  80a316:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a31a:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80a31d:	48 63 d2             	movsxd rdx,edx
  80a320:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  80a325:	66 83 f8 ff          	cmp    ax,0xffff
  80a329:	74 44                	je     80a36f <FAT32_lookup+0x283>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name2[x] != (unsigned short)(dest_dentry->name[j++]))
  80a32b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a32f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a332:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a335:	0f 8f 6a 04 00 00    	jg     80a7a5 <FAT32_lookup+0x6b9>
  80a33b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a33f:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80a342:	48 63 d2             	movsxd rdx,edx
  80a345:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  80a34a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a34e:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  80a351:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a354:	8d 50 01             	lea    edx,[rax+0x1]
  80a357:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  80a35a:	48 98                	cdqe   
  80a35c:	48 01 f0             	add    rax,rsi
  80a35f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a362:	66 98                	cbw    
  80a364:	66 39 c1             	cmp    cx,ax
  80a367:	0f 85 38 04 00 00    	jne    80a7a5 <FAT32_lookup+0x6b9>
  80a36d:	eb 01                	jmp    80a370 <FAT32_lookup+0x284>
					continue;
  80a36f:	90                   	nop
			for(x=0;x<6;x++)
  80a370:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80a374:	83 7d f0 05          	cmp    DWORD PTR [rbp-0x10],0x5
  80a378:	7e 90                	jle    80a30a <FAT32_lookup+0x21e>
					goto continue_cmp_fail;
			}
			for(x=0;x<2;x++)
  80a37a:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80a381:	eb 72                	jmp    80a3f5 <FAT32_lookup+0x309>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name3[x] == 0xffff)
  80a383:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a387:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a38a:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a38d:	7e 19                	jle    80a3a8 <FAT32_lookup+0x2bc>
  80a38f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a393:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80a396:	48 63 d2             	movsxd rdx,edx
  80a399:	48 83 c2 08          	add    rdx,0x8
  80a39d:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  80a3a2:	66 83 f8 ff          	cmp    ax,0xffff
  80a3a6:	74 48                	je     80a3f0 <FAT32_lookup+0x304>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name3[x] != (unsigned short)(dest_dentry->name[j++]))
  80a3a8:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a3ac:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a3af:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a3b2:	0f 8f f0 03 00 00    	jg     80a7a8 <FAT32_lookup+0x6bc>
  80a3b8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a3bc:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80a3bf:	48 63 d2             	movsxd rdx,edx
  80a3c2:	48 83 c2 08          	add    rdx,0x8
  80a3c6:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  80a3cb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a3cf:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  80a3d2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a3d5:	8d 50 01             	lea    edx,[rax+0x1]
  80a3d8:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  80a3db:	48 98                	cdqe   
  80a3dd:	48 01 f0             	add    rax,rsi
  80a3e0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a3e3:	66 98                	cbw    
  80a3e5:	66 39 c1             	cmp    cx,ax
  80a3e8:	0f 85 ba 03 00 00    	jne    80a7a8 <FAT32_lookup+0x6bc>
  80a3ee:	eb 01                	jmp    80a3f1 <FAT32_lookup+0x305>
					continue;
  80a3f0:	90                   	nop
			for(x=0;x<2;x++)
  80a3f1:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80a3f5:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  80a3f9:	7e 88                	jle    80a383 <FAT32_lookup+0x297>
					goto continue_cmp_fail;
			}

			if(j >= dest_dentry->name_length)
  80a3fb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a3ff:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a402:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a405:	0f 8d 14 04 00 00    	jge    80a81f <FAT32_lookup+0x733>
			{
				goto find_lookup_success;
			}

			tmpldentry --;
  80a40b:	48 83 6d e0 20       	sub    QWORD PTR [rbp-0x20],0x20
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  80a410:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a414:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80a418:	3c 0f                	cmp    al,0xf
  80a41a:	75 0f                	jne    80a42b <FAT32_lookup+0x33f>
  80a41c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a420:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a423:	3c e5                	cmp    al,0xe5
  80a425:	0f 85 5d fe ff ff    	jne    80a288 <FAT32_lookup+0x19c>
		}

		//short file/dir base name compare
		j = 0;
  80a42b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
		for(x=0;x<8;x++)
  80a432:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80a439:	e9 f4 01 00 00       	jmp    80a632 <FAT32_lookup+0x546>
		{
			switch(tmpdentry->DIR_Name[x])
  80a43e:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a442:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a445:	48 98                	cdqe   
  80a447:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a44b:	0f b6 c0             	movzx  eax,al
  80a44e:	83 f8 7a             	cmp    eax,0x7a
  80a451:	0f 8f d0 01 00 00    	jg     80a627 <FAT32_lookup+0x53b>
  80a457:	83 f8 61             	cmp    eax,0x61
  80a45a:	0f 8d e6 00 00 00    	jge    80a546 <FAT32_lookup+0x45a>
  80a460:	83 f8 5a             	cmp    eax,0x5a
  80a463:	0f 8f be 01 00 00    	jg     80a627 <FAT32_lookup+0x53b>
  80a469:	83 f8 41             	cmp    eax,0x41
  80a46c:	0f 8d d4 00 00 00    	jge    80a546 <FAT32_lookup+0x45a>
  80a472:	83 f8 20             	cmp    eax,0x20
  80a475:	74 1a                	je     80a491 <FAT32_lookup+0x3a5>
  80a477:	83 f8 20             	cmp    eax,0x20
  80a47a:	0f 8c a7 01 00 00    	jl     80a627 <FAT32_lookup+0x53b>
  80a480:	83 e8 30             	sub    eax,0x30
  80a483:	83 f8 09             	cmp    eax,0x9
  80a486:	0f 87 9b 01 00 00    	ja     80a627 <FAT32_lookup+0x53b>
  80a48c:	e9 53 01 00 00       	jmp    80a5e4 <FAT32_lookup+0x4f8>
			{
				case ' ':
					if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  80a491:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a495:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80a499:	0f b6 c0             	movzx  eax,al
  80a49c:	83 e0 10             	and    eax,0x10
  80a49f:	85 c0                	test   eax,eax
  80a4a1:	75 50                	jne    80a4f3 <FAT32_lookup+0x407>
					{
						if(dest_dentry->name[j]=='.')
  80a4a3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a4a7:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80a4aa:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a4ad:	48 98                	cdqe   
  80a4af:	48 01 d0             	add    rax,rdx
  80a4b2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a4b5:	3c 2e                	cmp    al,0x2e
  80a4b7:	0f 84 70 01 00 00    	je     80a62d <FAT32_lookup+0x541>
							continue;
						else if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a4bd:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a4c1:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a4c4:	48 98                	cdqe   
  80a4c6:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a4ca:	0f b6 d0             	movzx  edx,al
  80a4cd:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a4d1:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a4d4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a4d7:	48 98                	cdqe   
  80a4d9:	48 01 c8             	add    rax,rcx
  80a4dc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a4df:	0f be c0             	movsx  eax,al
  80a4e2:	39 c2                	cmp    edx,eax
  80a4e4:	0f 85 c1 02 00 00    	jne    80a7ab <FAT32_lookup+0x6bf>
						{
							j++;
  80a4ea:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80a4ee:	e9 3b 01 00 00       	jmp    80a62e <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a4f3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a4f7:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a4fa:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a4fd:	7d 32                	jge    80a531 <FAT32_lookup+0x445>
  80a4ff:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a503:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a506:	48 98                	cdqe   
  80a508:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a50c:	0f b6 d0             	movzx  edx,al
  80a50f:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a513:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a516:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a519:	48 98                	cdqe   
  80a51b:	48 01 c8             	add    rax,rcx
  80a51e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a521:	0f be c0             	movsx  eax,al
  80a524:	39 c2                	cmp    edx,eax
  80a526:	75 09                	jne    80a531 <FAT32_lookup+0x445>
						{
							j++;
  80a528:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80a52c:	e9 fd 00 00 00       	jmp    80a62e <FAT32_lookup+0x542>
						}
						else if(j == dest_dentry->name_length)
  80a531:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a535:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a538:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a53b:	0f 85 6d 02 00 00    	jne    80a7ae <FAT32_lookup+0x6c2>
							continue;
  80a541:	e9 e8 00 00 00       	jmp    80a62e <FAT32_lookup+0x542>
							goto continue_cmp_fail;
					}

				case 'A' ... 'Z':
				case 'a' ... 'z':
					if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  80a546:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a54a:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80a54e:	0f b6 c0             	movzx  eax,al
  80a551:	83 e0 08             	and    eax,0x8
  80a554:	85 c0                	test   eax,eax
  80a556:	74 49                	je     80a5a1 <FAT32_lookup+0x4b5>
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  80a558:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a55c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a55f:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a562:	0f 8d 49 02 00 00    	jge    80a7b1 <FAT32_lookup+0x6c5>
  80a568:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a56c:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a56f:	48 98                	cdqe   
  80a571:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a575:	0f b6 c0             	movzx  eax,al
  80a578:	8d 50 20             	lea    edx,[rax+0x20]
  80a57b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a57f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a582:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a585:	48 98                	cdqe   
  80a587:	48 01 c8             	add    rax,rcx
  80a58a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a58d:	0f be c0             	movsx  eax,al
  80a590:	39 c2                	cmp    edx,eax
  80a592:	0f 85 19 02 00 00    	jne    80a7b1 <FAT32_lookup+0x6c5>
						{
							j++;
  80a598:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80a59c:	e9 8d 00 00 00       	jmp    80a62e <FAT32_lookup+0x542>
						}
						else
							goto continue_cmp_fail;
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a5a1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a5a5:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a5a8:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a5ab:	0f 8d 03 02 00 00    	jge    80a7b4 <FAT32_lookup+0x6c8>
  80a5b1:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a5b5:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a5b8:	48 98                	cdqe   
  80a5ba:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a5be:	0f b6 d0             	movzx  edx,al
  80a5c1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a5c5:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a5c8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a5cb:	48 98                	cdqe   
  80a5cd:	48 01 c8             	add    rax,rcx
  80a5d0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a5d3:	0f be c0             	movsx  eax,al
  80a5d6:	39 c2                	cmp    edx,eax
  80a5d8:	0f 85 d6 01 00 00    	jne    80a7b4 <FAT32_lookup+0x6c8>
						{
							j++;
  80a5de:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80a5e2:	eb 4a                	jmp    80a62e <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}

				case '0' ... '9':
					if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a5e4:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a5e8:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a5eb:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a5ee:	0f 8d c3 01 00 00    	jge    80a7b7 <FAT32_lookup+0x6cb>
  80a5f4:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a5f8:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a5fb:	48 98                	cdqe   
  80a5fd:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a601:	0f b6 d0             	movzx  edx,al
  80a604:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a608:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a60b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a60e:	48 98                	cdqe   
  80a610:	48 01 c8             	add    rax,rcx
  80a613:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a616:	0f be c0             	movsx  eax,al
  80a619:	39 c2                	cmp    edx,eax
  80a61b:	0f 85 96 01 00 00    	jne    80a7b7 <FAT32_lookup+0x6cb>
					{
						j++;
  80a621:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
						break;
  80a625:	eb 07                	jmp    80a62e <FAT32_lookup+0x542>
					}
					else
						goto continue_cmp_fail;

				default :
					j++;
  80a627:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
					break;
  80a62b:	eb 01                	jmp    80a62e <FAT32_lookup+0x542>
							continue;
  80a62d:	90                   	nop
		for(x=0;x<8;x++)
  80a62e:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80a632:	83 7d f0 07          	cmp    DWORD PTR [rbp-0x10],0x7
  80a636:	0f 8e 02 fe ff ff    	jle    80a43e <FAT32_lookup+0x352>
			}
		}
		//short file ext name compare
		if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  80a63c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a640:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80a644:	0f b6 c0             	movzx  eax,al
  80a647:	83 e0 10             	and    eax,0x10
  80a64a:	85 c0                	test   eax,eax
  80a64c:	0f 85 d0 01 00 00    	jne    80a822 <FAT32_lookup+0x736>
		{
			j++;
  80a652:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
			for(x=8;x<11;x++)
  80a656:	c7 45 f0 08 00 00 00 	mov    DWORD PTR [rbp-0x10],0x8
  80a65d:	e9 2b 01 00 00       	jmp    80a78d <FAT32_lookup+0x6a1>
			{
				switch(tmpdentry->DIR_Name[x])
  80a662:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a666:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a669:	48 98                	cdqe   
  80a66b:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a66f:	0f b6 c0             	movzx  eax,al
  80a672:	83 f8 7a             	cmp    eax,0x7a
  80a675:	0f 8f 3f 01 00 00    	jg     80a7ba <FAT32_lookup+0x6ce>
  80a67b:	83 f8 61             	cmp    eax,0x61
  80a67e:	7d 2e                	jge    80a6ae <FAT32_lookup+0x5c2>
  80a680:	83 f8 5a             	cmp    eax,0x5a
  80a683:	0f 8f 31 01 00 00    	jg     80a7ba <FAT32_lookup+0x6ce>
  80a689:	83 f8 41             	cmp    eax,0x41
  80a68c:	7d 20                	jge    80a6ae <FAT32_lookup+0x5c2>
  80a68e:	83 f8 20             	cmp    eax,0x20
  80a691:	0f 84 c4 00 00 00    	je     80a75b <FAT32_lookup+0x66f>
  80a697:	83 f8 20             	cmp    eax,0x20
  80a69a:	0f 8c 1a 01 00 00    	jl     80a7ba <FAT32_lookup+0x6ce>
  80a6a0:	83 e8 30             	sub    eax,0x30
  80a6a3:	83 f8 09             	cmp    eax,0x9
  80a6a6:	0f 87 0e 01 00 00    	ja     80a7ba <FAT32_lookup+0x6ce>
  80a6ac:	eb 7e                	jmp    80a72c <FAT32_lookup+0x640>
				{
					case 'A' ... 'Z':
					case 'a' ... 'z':
						if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  80a6ae:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a6b2:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80a6b6:	0f b6 c0             	movzx  eax,al
  80a6b9:	83 e0 10             	and    eax,0x10
  80a6bc:	85 c0                	test   eax,eax
  80a6be:	74 39                	je     80a6f9 <FAT32_lookup+0x60d>
							if(tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  80a6c0:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a6c4:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a6c7:	48 98                	cdqe   
  80a6c9:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a6cd:	0f b6 c0             	movzx  eax,al
  80a6d0:	8d 50 20             	lea    edx,[rax+0x20]
  80a6d3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a6d7:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a6da:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a6dd:	48 98                	cdqe   
  80a6df:	48 01 c8             	add    rax,rcx
  80a6e2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a6e5:	0f be c0             	movsx  eax,al
  80a6e8:	39 c2                	cmp    edx,eax
  80a6ea:	0f 85 cd 00 00 00    	jne    80a7bd <FAT32_lookup+0x6d1>
							{
								j++;
  80a6f0:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  80a6f4:	e9 90 00 00 00       	jmp    80a789 <FAT32_lookup+0x69d>
							}
							else
								goto continue_cmp_fail;
						else
						{
							if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a6f9:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a6fd:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a700:	48 98                	cdqe   
  80a702:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a706:	0f b6 d0             	movzx  edx,al
  80a709:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a70d:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a710:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a713:	48 98                	cdqe   
  80a715:	48 01 c8             	add    rax,rcx
  80a718:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a71b:	0f be c0             	movsx  eax,al
  80a71e:	39 c2                	cmp    edx,eax
  80a720:	0f 85 9a 00 00 00    	jne    80a7c0 <FAT32_lookup+0x6d4>
							{
								j++;
  80a726:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  80a72a:	eb 5d                	jmp    80a789 <FAT32_lookup+0x69d>
							else
								goto continue_cmp_fail;
						}

					case '0' ... '9':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a72c:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a730:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a733:	48 98                	cdqe   
  80a735:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a739:	0f b6 d0             	movzx  edx,al
  80a73c:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a740:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a743:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a746:	48 98                	cdqe   
  80a748:	48 01 c8             	add    rax,rcx
  80a74b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a74e:	0f be c0             	movsx  eax,al
  80a751:	39 c2                	cmp    edx,eax
  80a753:	75 6e                	jne    80a7c3 <FAT32_lookup+0x6d7>
						{
							j++;
  80a755:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80a759:	eb 2e                	jmp    80a789 <FAT32_lookup+0x69d>
						}
						else
							goto continue_cmp_fail;

					case ' ':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a75b:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a75f:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a762:	48 98                	cdqe   
  80a764:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a768:	0f b6 d0             	movzx  edx,al
  80a76b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a76f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a772:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a775:	48 98                	cdqe   
  80a777:	48 01 c8             	add    rax,rcx
  80a77a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a77d:	0f be c0             	movsx  eax,al
  80a780:	39 c2                	cmp    edx,eax
  80a782:	75 42                	jne    80a7c6 <FAT32_lookup+0x6da>
						{
							j++;
  80a784:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80a788:	90                   	nop
			for(x=8;x<11;x++)
  80a789:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80a78d:	83 7d f0 0a          	cmp    DWORD PTR [rbp-0x10],0xa
  80a791:	0f 8e cb fe ff ff    	jle    80a662 <FAT32_lookup+0x576>
					default :
						goto continue_cmp_fail;
				}
			}
		}
		goto find_lookup_success;
  80a797:	e9 86 00 00 00       	jmp    80a822 <FAT32_lookup+0x736>
			continue;
  80a79c:	90                   	nop
  80a79d:	eb 28                	jmp    80a7c7 <FAT32_lookup+0x6db>
			continue;
  80a79f:	90                   	nop
  80a7a0:	eb 25                	jmp    80a7c7 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80a7a2:	90                   	nop
  80a7a3:	eb 22                	jmp    80a7c7 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80a7a5:	90                   	nop
  80a7a6:	eb 1f                	jmp    80a7c7 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80a7a8:	90                   	nop
  80a7a9:	eb 1c                	jmp    80a7c7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a7ab:	90                   	nop
  80a7ac:	eb 19                	jmp    80a7c7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a7ae:	90                   	nop
  80a7af:	eb 16                	jmp    80a7c7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a7b1:	90                   	nop
  80a7b2:	eb 13                	jmp    80a7c7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a7b4:	90                   	nop
  80a7b5:	eb 10                	jmp    80a7c7 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  80a7b7:	90                   	nop
  80a7b8:	eb 0d                	jmp    80a7c7 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  80a7ba:	90                   	nop
  80a7bb:	eb 0a                	jmp    80a7c7 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  80a7bd:	90                   	nop
  80a7be:	eb 07                	jmp    80a7c7 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  80a7c0:	90                   	nop
  80a7c1:	eb 04                	jmp    80a7c7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a7c3:	90                   	nop
  80a7c4:	eb 01                	jmp    80a7c7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a7c6:	90                   	nop
	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  80a7c7:	83 45 f8 20          	add    DWORD PTR [rbp-0x8],0x20
  80a7cb:	48 83 45 e8 20       	add    QWORD PTR [rbp-0x18],0x20
  80a7d0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80a7d3:	48 63 d0             	movsxd rdx,eax
  80a7d6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a7da:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a7de:	48 39 c2             	cmp    rdx,rax
  80a7e1:	0f 8c 4c fa ff ff    	jl     80a233 <FAT32_lookup+0x147>

continue_cmp_fail:;
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80a7e7:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80a7ea:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a7ee:	89 d6                	mov    esi,edx
  80a7f0:	48 89 c7             	mov    rdi,rax
  80a7f3:	e8 2d e7 ff ff       	call   808f25 <DISK1_FAT32_read_FAT_Entry>
  80a7f8:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  80a7fb:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  80a802:	77 05                	ja     80a809 <FAT32_lookup+0x71d>
		goto next_cluster;
  80a804:	e9 7f f9 ff ff       	jmp    80a188 <FAT32_lookup+0x9c>

	vmfree(buf);
  80a809:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80a80d:	48 89 c7             	mov    rdi,rax
  80a810:	e8 33 6b ff ff       	call   801348 <vmfree>
	return NULL;
  80a815:	b8 00 00 00 00       	mov    eax,0x0
  80a81a:	e9 f0 01 00 00       	jmp    80aa0f <FAT32_lookup+0x923>
				goto find_lookup_success;
  80a81f:	90                   	nop
  80a820:	eb 01                	jmp    80a823 <FAT32_lookup+0x737>
		goto find_lookup_success;
  80a822:	90                   	nop

find_lookup_success:
	p = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  80a823:	be 00 00 00 00       	mov    esi,0x0
  80a828:	bf 38 00 00 00       	mov    edi,0x38
  80a82d:	b8 00 00 00 00       	mov    eax,0x0
  80a832:	e8 82 6a ff ff       	call   8012b9 <vmalloc>
  80a837:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
	memset(p,0,sizeof(struct index_node));
  80a83b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a83f:	ba 38 00 00 00       	mov    edx,0x38
  80a844:	be 00 00 00 00       	mov    esi,0x0
  80a849:	48 89 c7             	mov    rdi,rax
  80a84c:	e8 10 11 00 00       	call   80b961 <memset>
	p->file_size = tmpdentry->DIR_FileSize;
  80a851:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a855:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  80a858:	89 c2                	mov    edx,eax
  80a85a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a85e:	48 89 10             	mov    QWORD PTR [rax],rdx
	p->blocks = (p->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  80a861:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a865:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80a868:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a86c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a870:	48 01 d0             	add    rax,rdx
  80a873:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  80a877:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a87b:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80a87f:	48 89 c1             	mov    rcx,rax
  80a882:	48 89 d0             	mov    rax,rdx
  80a885:	ba 00 00 00 00       	mov    edx,0x0
  80a88a:	48 f7 f1             	div    rcx
  80a88d:	48 89 c2             	mov    rdx,rax
  80a890:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a894:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	p->attribute = (tmpdentry->DIR_Attr & ATTR_DIRECTORY) ? FS_ATTR_DIR : FS_ATTR_FILE;
  80a898:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a89c:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80a8a0:	0f b6 c0             	movzx  eax,al
  80a8a3:	83 e0 10             	and    eax,0x10
  80a8a6:	85 c0                	test   eax,eax
  80a8a8:	74 07                	je     80a8b1 <FAT32_lookup+0x7c5>
  80a8aa:	ba 02 00 00 00       	mov    edx,0x2
  80a8af:	eb 05                	jmp    80a8b6 <FAT32_lookup+0x7ca>
  80a8b1:	ba 01 00 00 00       	mov    edx,0x1
  80a8b6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a8ba:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	p->sb = parent_inode->sb;
  80a8be:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80a8c2:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  80a8c6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a8ca:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	p->f_ops = &FAT32_file_ops;
  80a8ce:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a8d2:	48 c7 40 20 00 c5 80 	mov    QWORD PTR [rax+0x20],0x80c500
  80a8d9:	00 
	p->inode_ops = &FAT32_inode_ops;
  80a8da:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a8de:	48 c7 40 28 40 c5 80 	mov    QWORD PTR [rax+0x28],0x80c540
  80a8e5:	00 

	p->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  80a8e6:	be 00 00 00 00       	mov    esi,0x0
  80a8eb:	bf 20 00 00 00       	mov    edi,0x20
  80a8f0:	b8 00 00 00 00       	mov    eax,0x0
  80a8f5:	e8 bf 69 ff ff       	call   8012b9 <vmalloc>
  80a8fa:	48 89 c2             	mov    rdx,rax
  80a8fd:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a901:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(p->private_index_info,0,sizeof(struct FAT32_inode_info));
  80a905:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a909:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a90d:	ba 20 00 00 00       	mov    edx,0x20
  80a912:	be 00 00 00 00       	mov    esi,0x0
  80a917:	48 89 c7             	mov    rdi,rax
  80a91a:	e8 42 10 00 00       	call   80b961 <memset>
	finode = p->private_index_info;
  80a91f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a923:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a927:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax

	finode->first_cluster = (tmpdentry->DIR_FstClusHI<< 16 | tmpdentry->DIR_FstClusLO) & 0x0fffffff;
  80a92b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a92f:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80a933:	0f b7 c0             	movzx  eax,ax
  80a936:	c1 e0 10             	shl    eax,0x10
  80a939:	89 c2                	mov    edx,eax
  80a93b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a93f:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  80a943:	0f b7 c0             	movzx  eax,ax
  80a946:	09 d0                	or     eax,edx
  80a948:	48 98                	cdqe   
  80a94a:	25 ff ff ff 0f       	and    eax,0xfffffff
  80a94f:	48 89 c2             	mov    rdx,rax
  80a952:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a956:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = cluster;
  80a959:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80a95c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a960:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	finode->dentry_position = tmpdentry - (struct FAT32_Directory *)buf;
  80a964:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a968:	48 2b 45 c0          	sub    rax,QWORD PTR [rbp-0x40]
  80a96c:	48 c1 f8 05          	sar    rax,0x5
  80a970:	48 89 c2             	mov    rdx,rax
  80a973:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a977:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	finode->create_date = tmpdentry->DIR_CrtTime;
  80a97b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a97f:	0f b7 50 0e          	movzx  edx,WORD PTR [rax+0xe]
  80a983:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a987:	66 89 50 18          	mov    WORD PTR [rax+0x18],dx
	finode->create_time = tmpdentry->DIR_CrtDate;
  80a98b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a98f:	0f b7 50 10          	movzx  edx,WORD PTR [rax+0x10]
  80a993:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a997:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	finode->write_date = tmpdentry->DIR_WrtTime;
  80a99b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a99f:	0f b7 50 16          	movzx  edx,WORD PTR [rax+0x16]
  80a9a3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a9a7:	66 89 50 1c          	mov    WORD PTR [rax+0x1c],dx
	finode->write_time = tmpdentry->DIR_WrtDate;
  80a9ab:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a9af:	0f b7 50 18          	movzx  edx,WORD PTR [rax+0x18]
  80a9b3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a9b7:	66 89 50 1e          	mov    WORD PTR [rax+0x1e],dx

	if((tmpdentry->DIR_FstClusHI >> 12) && (p->attribute & FS_ATTR_FILE))
  80a9bb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a9bf:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80a9c3:	66 c1 e8 0c          	shr    ax,0xc
  80a9c7:	66 85 c0             	test   ax,ax
  80a9ca:	74 27                	je     80a9f3 <FAT32_lookup+0x907>
  80a9cc:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a9d0:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a9d4:	83 e0 01             	and    eax,0x1
  80a9d7:	48 85 c0             	test   rax,rax
  80a9da:	74 17                	je     80a9f3 <FAT32_lookup+0x907>
	{
		p->attribute |= FS_ATTR_DEVICE;
  80a9dc:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a9e0:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a9e4:	48 83 c8 04          	or     rax,0x4
  80a9e8:	48 89 c2             	mov    rdx,rax
  80a9eb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a9ef:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	}

	dest_dentry->dir_inode = p;
  80a9f3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a9f7:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80a9fb:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	vmfree(buf);
  80a9ff:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80aa03:	48 89 c7             	mov    rdi,rax
  80aa06:	e8 3d 69 ff ff       	call   801348 <vmfree>
	return dest_dentry;	
  80aa0b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
}
  80aa0f:	c9                   	leave  
  80aa10:	c3                   	ret    

000000000080aa11 <FAT32_mkdir>:


long FAT32_mkdir(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  80aa11:	f3 0f 1e fa          	endbr64 
  80aa15:	55                   	push   rbp
  80aa16:	48 89 e5             	mov    rbp,rsp
  80aa19:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80aa1d:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80aa21:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80aa24:	90                   	nop
  80aa25:	5d                   	pop    rbp
  80aa26:	c3                   	ret    

000000000080aa27 <FAT32_rmdir>:


long FAT32_rmdir(struct index_node * inode,struct dir_entry * dentry)
{}
  80aa27:	f3 0f 1e fa          	endbr64 
  80aa2b:	55                   	push   rbp
  80aa2c:	48 89 e5             	mov    rbp,rsp
  80aa2f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80aa33:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80aa37:	90                   	nop
  80aa38:	5d                   	pop    rbp
  80aa39:	c3                   	ret    

000000000080aa3a <FAT32_rename>:

long FAT32_rename(struct index_node * old_inode,struct dir_entry * old_dentry,struct index_node * new_inode,struct dir_entry * new_dentry)
{}
  80aa3a:	f3 0f 1e fa          	endbr64 
  80aa3e:	55                   	push   rbp
  80aa3f:	48 89 e5             	mov    rbp,rsp
  80aa42:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80aa46:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80aa4a:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80aa4e:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  80aa52:	90                   	nop
  80aa53:	5d                   	pop    rbp
  80aa54:	c3                   	ret    

000000000080aa55 <FAT32_getattr>:

long FAT32_getattr(struct dir_entry * dentry,unsigned long * attr)
{}
  80aa55:	f3 0f 1e fa          	endbr64 
  80aa59:	55                   	push   rbp
  80aa5a:	48 89 e5             	mov    rbp,rsp
  80aa5d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80aa61:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80aa65:	90                   	nop
  80aa66:	5d                   	pop    rbp
  80aa67:	c3                   	ret    

000000000080aa68 <FAT32_setattr>:

long FAT32_setattr(struct dir_entry * dentry,unsigned long * attr)
{}
  80aa68:	f3 0f 1e fa          	endbr64 
  80aa6c:	55                   	push   rbp
  80aa6d:	48 89 e5             	mov    rbp,rsp
  80aa70:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80aa74:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80aa78:	90                   	nop
  80aa79:	5d                   	pop    rbp
  80aa7a:	c3                   	ret    

000000000080aa7b <FAT32_compare>:
	.setattr = FAT32_setattr,
};


//// these operation need cache and list
long FAT32_compare(struct dir_entry * parent_dentry,char * source_filename,char * destination_filename){}
  80aa7b:	f3 0f 1e fa          	endbr64 
  80aa7f:	55                   	push   rbp
  80aa80:	48 89 e5             	mov    rbp,rsp
  80aa83:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80aa87:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80aa8b:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80aa8f:	90                   	nop
  80aa90:	5d                   	pop    rbp
  80aa91:	c3                   	ret    

000000000080aa92 <FAT32_hash>:
long FAT32_hash(struct dir_entry * dentry,char * filename){}
  80aa92:	f3 0f 1e fa          	endbr64 
  80aa96:	55                   	push   rbp
  80aa97:	48 89 e5             	mov    rbp,rsp
  80aa9a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80aa9e:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80aaa2:	90                   	nop
  80aaa3:	5d                   	pop    rbp
  80aaa4:	c3                   	ret    

000000000080aaa5 <FAT32_release>:
long FAT32_release(struct dir_entry * dentry){}
  80aaa5:	f3 0f 1e fa          	endbr64 
  80aaa9:	55                   	push   rbp
  80aaaa:	48 89 e5             	mov    rbp,rsp
  80aaad:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80aab1:	90                   	nop
  80aab2:	5d                   	pop    rbp
  80aab3:	c3                   	ret    

000000000080aab4 <FAT32_iput>:
long FAT32_iput(struct dir_entry * dentry,struct index_node * inode){}
  80aab4:	f3 0f 1e fa          	endbr64 
  80aab8:	55                   	push   rbp
  80aab9:	48 89 e5             	mov    rbp,rsp
  80aabc:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80aac0:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80aac4:	90                   	nop
  80aac5:	5d                   	pop    rbp
  80aac6:	c3                   	ret    

000000000080aac7 <fat32_write_superblock>:
	.release = FAT32_release,
	.iput = FAT32_iput,
};


void fat32_write_superblock(struct super_block * sb){}
  80aac7:	f3 0f 1e fa          	endbr64 
  80aacb:	55                   	push   rbp
  80aacc:	48 89 e5             	mov    rbp,rsp
  80aacf:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80aad3:	90                   	nop
  80aad4:	5d                   	pop    rbp
  80aad5:	c3                   	ret    

000000000080aad6 <fat32_put_superblock>:

void fat32_put_superblock(struct super_block * sb)
{
  80aad6:	f3 0f 1e fa          	endbr64 
  80aada:	55                   	push   rbp
  80aadb:	48 89 e5             	mov    rbp,rsp
  80aade:	48 83 ec 10          	sub    rsp,0x10
  80aae2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
	vmfree(sb->private_sb_info);
  80aae6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aaea:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80aaee:	48 89 c7             	mov    rdi,rax
  80aaf1:	e8 52 68 ff ff       	call   801348 <vmfree>
	vmfree(sb->root->dir_inode->private_index_info);
  80aaf6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aafa:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aafd:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80ab01:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80ab05:	48 89 c7             	mov    rdi,rax
  80ab08:	e8 3b 68 ff ff       	call   801348 <vmfree>
	vmfree(sb->root->dir_inode);
  80ab0d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ab11:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ab14:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80ab18:	48 89 c7             	mov    rdi,rax
  80ab1b:	e8 28 68 ff ff       	call   801348 <vmfree>
	vmfree(sb->root);
  80ab20:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ab24:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ab27:	48 89 c7             	mov    rdi,rax
  80ab2a:	e8 19 68 ff ff       	call   801348 <vmfree>
	vmfree(sb);
  80ab2f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ab33:	48 89 c7             	mov    rdi,rax
  80ab36:	e8 0d 68 ff ff       	call   801348 <vmfree>
}
  80ab3b:	90                   	nop
  80ab3c:	c9                   	leave  
  80ab3d:	c3                   	ret    

000000000080ab3e <fat32_write_inode>:

void fat32_write_inode(struct index_node * inode)
{
  80ab3e:	f3 0f 1e fa          	endbr64 
  80ab42:	55                   	push   rbp
  80ab43:	48 89 e5             	mov    rbp,rsp
  80ab46:	48 83 ec 40          	sub    rsp,0x40
  80ab4a:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
	struct FAT32_Directory * fdentry = NULL;
  80ab4e:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80ab55:	00 
	struct FAT32_Directory * buf = NULL;
  80ab56:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80ab5d:	00 
	struct FAT32_inode_info * finode = inode->private_index_info;
  80ab5e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80ab62:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80ab66:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	struct FAT32_sb_info * fsbi = inode->sb->private_sb_info;
  80ab6a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80ab6e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80ab72:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ab76:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	unsigned long sector = 0;
  80ab7a:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  80ab81:	00 

	if(finode->dentry_location == 0)
  80ab82:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ab86:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80ab8a:	48 85 c0             	test   rax,rax
  80ab8d:	75 14                	jne    80aba3 <fat32_write_inode+0x65>
	{
		printf("FS ERROR:write root inode!\n");	
  80ab8f:	bf 24 45 81 00       	mov    edi,0x814524
  80ab94:	b8 00 00 00 00       	mov    eax,0x0
  80ab99:	e8 89 61 ff ff       	call   800d27 <printf>
		return ;
  80ab9e:	e9 30 01 00 00       	jmp    80acd3 <fat32_write_inode+0x195>
	}

	sector = fsbi->Data_firstsector + (finode->dentry_location - 2) * fsbi->sector_per_cluster;
  80aba3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80aba7:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  80abab:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80abaf:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80abb3:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  80abb7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80abbb:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80abbf:	48 0f af c2          	imul   rax,rdx
  80abc3:	48 01 c8             	add    rax,rcx
  80abc6:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	buf = (struct FAT32_Directory *)vmalloc(fsbi->bytes_per_cluster,0);
  80abca:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80abce:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80abd2:	be 00 00 00 00       	mov    esi,0x0
  80abd7:	48 89 c7             	mov    rdi,rax
  80abda:	b8 00 00 00 00       	mov    eax,0x0
  80abdf:	e8 d5 66 ff ff       	call   8012b9 <vmalloc>
  80abe4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	memset(buf,0,fsbi->bytes_per_cluster);
  80abe8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80abec:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80abf0:	89 c2                	mov    edx,eax
  80abf2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80abf6:	be 00 00 00 00       	mov    esi,0x0
  80abfb:	48 89 c7             	mov    rdi,rax
  80abfe:	e8 5e 0d 00 00       	call   80b961 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80ac03:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ac07:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ac0b:	89 c1                	mov    ecx,eax
  80ac0d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80ac11:	89 c2                	mov    edx,eax
  80ac13:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ac17:	49 89 c0             	mov    r8,rax
  80ac1a:	be 00 00 00 00       	mov    esi,0x0
  80ac1f:	bf 00 00 00 00       	mov    edi,0x0
  80ac24:	e8 75 d6 ff ff       	call   80829e <request>
  80ac29:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    chk_result(r);
  80ac2c:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80ac2f:	89 c7                	mov    edi,eax
  80ac31:	e8 1c dd ff ff       	call   808952 <chk_result>
    fdentry = buf+finode->dentry_position;
  80ac36:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ac3a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ac3e:	48 c1 e0 05          	shl    rax,0x5
  80ac42:	48 89 c2             	mov    rdx,rax
  80ac45:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ac49:	48 01 d0             	add    rax,rdx
  80ac4c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

	////alert fat32 dentry data
	fdentry->DIR_FileSize = inode->file_size;
  80ac50:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80ac54:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ac57:	89 c2                	mov    edx,eax
  80ac59:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ac5d:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
	fdentry->DIR_FstClusLO = finode->first_cluster & 0xffff;
  80ac60:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ac64:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ac67:	89 c2                	mov    edx,eax
  80ac69:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ac6d:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	fdentry->DIR_FstClusHI = (fdentry->DIR_FstClusHI & 0xf000) | (finode->first_cluster >> 16);
  80ac71:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ac75:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80ac79:	66 25 00 f0          	and    ax,0xf000
  80ac7d:	89 c2                	mov    edx,eax
  80ac7f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ac83:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ac86:	48 c1 e8 10          	shr    rax,0x10
  80ac8a:	09 c2                	or     edx,eax
  80ac8c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ac90:	66 89 50 14          	mov    WORD PTR [rax+0x14],dx

	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80ac94:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ac98:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ac9c:	89 c1                	mov    ecx,eax
  80ac9e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80aca2:	89 c2                	mov    edx,eax
  80aca4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aca8:	49 89 c0             	mov    r8,rax
  80acab:	be 01 00 00 00       	mov    esi,0x1
  80acb0:	bf 00 00 00 00       	mov    edi,0x0
  80acb5:	e8 e4 d5 ff ff       	call   80829e <request>
  80acba:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    chk_result(r1);
  80acbd:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
  80acc0:	89 c7                	mov    edi,eax
  80acc2:	e8 8b dc ff ff       	call   808952 <chk_result>
	vmfree(buf);
  80acc7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80accb:	48 89 c7             	mov    rdi,rax
  80acce:	e8 75 66 ff ff       	call   801348 <vmfree>
}
  80acd3:	c9                   	leave  
  80acd4:	c3                   	ret    

000000000080acd5 <fat32_read_superblock>:

	.write_inode = fat32_write_inode,
};

struct super_block * fat32_read_superblock(struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  80acd5:	f3 0f 1e fa          	endbr64 
  80acd9:	55                   	push   rbp
  80acda:	48 89 e5             	mov    rbp,rsp
  80acdd:	48 83 ec 50          	sub    rsp,0x50
  80ace1:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  80ace5:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
	struct super_block * sbp = NULL;
  80ace9:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80acf0:	00 
	struct FAT32_inode_info * finode = NULL;
  80acf1:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80acf8:	00 
	struct FAT32_BootSector * fbs = NULL;
  80acf9:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80ad00:	00 
	struct FAT32_sb_info * fsbi = NULL;
  80ad01:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80ad08:	00 

	////super block
	sbp = (struct super_block *)vmalloc(sizeof(struct super_block),0);
  80ad09:	be 00 00 00 00       	mov    esi,0x0
  80ad0e:	bf 18 00 00 00       	mov    edi,0x18
  80ad13:	b8 00 00 00 00       	mov    eax,0x0
  80ad18:	e8 9c 65 ff ff       	call   8012b9 <vmalloc>
  80ad1d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	memset(sbp,0,sizeof(struct super_block));
  80ad21:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ad25:	ba 18 00 00 00       	mov    edx,0x18
  80ad2a:	be 00 00 00 00       	mov    esi,0x0
  80ad2f:	48 89 c7             	mov    rdi,rax
  80ad32:	e8 2a 0c 00 00       	call   80b961 <memset>

	sbp->sb_ops = &FAT32_sb_ops;
  80ad37:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ad3b:	48 c7 40 08 a0 c5 80 	mov    QWORD PTR [rax+0x8],0x80c5a0
  80ad42:	00 
	sbp->private_sb_info = (struct FAT32_sb_info *)vmalloc(sizeof(struct FAT32_sb_info),0);
  80ad43:	be 00 00 00 00       	mov    esi,0x0
  80ad48:	bf 60 00 00 00       	mov    edi,0x60
  80ad4d:	b8 00 00 00 00       	mov    eax,0x0
  80ad52:	e8 62 65 ff ff       	call   8012b9 <vmalloc>
  80ad57:	48 89 c2             	mov    rdx,rax
  80ad5a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ad5e:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	memset(sbp->private_sb_info,0,sizeof(struct FAT32_sb_info));
  80ad62:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ad66:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ad6a:	ba 60 00 00 00       	mov    edx,0x60
  80ad6f:	be 00 00 00 00       	mov    esi,0x0
  80ad74:	48 89 c7             	mov    rdi,rax
  80ad77:	e8 e5 0b 00 00       	call   80b961 <memset>

	////fat32 boot sector
	fbs = (struct FAT32_BootSector *)buf;
  80ad7c:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80ad80:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
 	fsbi = sbp->private_sb_info;
  80ad84:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ad88:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ad8c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	fsbi->start_sector = DPTE->start_LBA;
  80ad90:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ad94:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80ad97:	89 c2                	mov    edx,eax
  80ad99:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ad9d:	48 89 10             	mov    QWORD PTR [rax],rdx
	fsbi->sector_count = DPTE->sectors_limit;
  80ada0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ada4:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80ada7:	89 c2                	mov    edx,eax
  80ada9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80adad:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	fsbi->sector_per_cluster = fbs->BPB_SecPerClus;
  80adb1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80adb5:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  80adb9:	0f b6 d0             	movzx  edx,al
  80adbc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80adc0:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	fsbi->bytes_per_cluster = fbs->BPB_SecPerClus * fbs->BPB_BytesPerSec;
  80adc4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80adc8:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  80adcc:	0f b6 d0             	movzx  edx,al
  80adcf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80add3:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  80add7:	0f b7 c0             	movzx  eax,ax
  80adda:	0f af c2             	imul   eax,edx
  80addd:	48 63 d0             	movsxd rdx,eax
  80ade0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ade4:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	fsbi->bytes_per_sector = fbs->BPB_BytesPerSec;
  80ade8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80adec:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  80adf0:	0f b7 d0             	movzx  edx,ax
  80adf3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80adf7:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
	fsbi->Data_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt + fbs->BPB_FATSz32 * fbs->BPB_NumFATs;
  80adfb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80adff:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80ae02:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ae06:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  80ae0a:	0f b7 c0             	movzx  eax,ax
  80ae0d:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  80ae10:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ae14:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  80ae17:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ae1b:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  80ae1f:	0f b6 c0             	movzx  eax,al
  80ae22:	0f af c2             	imul   eax,edx
  80ae25:	01 c8                	add    eax,ecx
  80ae27:	89 c2                	mov    edx,eax
  80ae29:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ae2d:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
	fsbi->FAT1_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt;
  80ae31:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ae35:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80ae38:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ae3c:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  80ae40:	0f b7 c0             	movzx  eax,ax
  80ae43:	01 d0                	add    eax,edx
  80ae45:	89 c2                	mov    edx,eax
  80ae47:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ae4b:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	fsbi->sector_per_FAT = fbs->BPB_FATSz32;
  80ae4f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ae53:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  80ae56:	89 c2                	mov    edx,eax
  80ae58:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ae5c:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
	fsbi->NumFATs = fbs->BPB_NumFATs;
  80ae60:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ae64:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  80ae68:	0f b6 d0             	movzx  edx,al
  80ae6b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ae6f:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
	fsbi->fsinfo_sector_infat = fbs->BPB_FSInfo;
  80ae73:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ae77:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80ae7b:	0f b7 d0             	movzx  edx,ax
  80ae7e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ae82:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
	fsbi->bootsector_bk_infat = fbs->BPB_BkBootSec;	
  80ae86:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ae8a:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  80ae8e:	0f b7 d0             	movzx  edx,ax
  80ae91:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ae95:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
	
	printf("FAT32 Boot Sector\n\tBPB_FSInfo:%x\n\tBPB_BkBootSec:%x\n\tBPB_TotSec32:%x\n",fbs->BPB_FSInfo,fbs->BPB_BkBootSec,fbs->BPB_TotSec32);
  80ae99:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ae9d:	8b 48 20             	mov    ecx,DWORD PTR [rax+0x20]
  80aea0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80aea4:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  80aea8:	0f b7 d0             	movzx  edx,ax
  80aeab:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80aeaf:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80aeb3:	0f b7 c0             	movzx  eax,ax
  80aeb6:	89 c6                	mov    esi,eax
  80aeb8:	bf 40 45 81 00       	mov    edi,0x814540
  80aebd:	b8 00 00 00 00       	mov    eax,0x0
  80aec2:	e8 60 5e ff ff       	call   800d27 <printf>
	
	////fat32 fsinfo sector
	fsbi->fat_fsinfo = (struct FAT32_FSInfo *)vmalloc(sizeof(struct FAT32_FSInfo),0);
  80aec7:	be 00 00 00 00       	mov    esi,0x0
  80aecc:	bf 00 02 00 00       	mov    edi,0x200
  80aed1:	b8 00 00 00 00       	mov    eax,0x0
  80aed6:	e8 de 63 ff ff       	call   8012b9 <vmalloc>
  80aedb:	48 89 c2             	mov    rdx,rax
  80aede:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80aee2:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
	memset(fsbi->fat_fsinfo,0,512);
  80aee6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80aeea:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80aeee:	ba 00 02 00 00       	mov    edx,0x200
  80aef3:	be 00 00 00 00       	mov    esi,0x0
  80aef8:	48 89 c7             	mov    rdi,rax
  80aefb:	e8 61 0a 00 00       	call   80b961 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPTE->start_LBA + fbs->BPB_FSInfo,1,(unsigned char *)fsbi->fat_fsinfo);
  80af00:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80af04:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  80af08:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80af0c:	8b 48 08             	mov    ecx,DWORD PTR [rax+0x8]
  80af0f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80af13:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80af17:	0f b7 c0             	movzx  eax,ax
  80af1a:	01 c8                	add    eax,ecx
  80af1c:	49 89 d0             	mov    r8,rdx
  80af1f:	b9 01 00 00 00       	mov    ecx,0x1
  80af24:	89 c2                	mov    edx,eax
  80af26:	be 00 00 00 00       	mov    esi,0x0
  80af2b:	bf 00 00 00 00       	mov    edi,0x0
  80af30:	e8 69 d3 ff ff       	call   80829e <request>
  80af35:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    chk_result(r);
  80af38:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80af3b:	89 c7                	mov    edi,eax
  80af3d:	e8 10 da ff ff       	call   808952 <chk_result>
	printf("FAT32 FSInfo\n\tFSI_LeadSig:%x\n\tFSI_StrucSig:%x\n\tFSI_Free_Count:%x\n",fsbi->fat_fsinfo->FSI_LeadSig,fsbi->fat_fsinfo->FSI_StrucSig,fsbi->fat_fsinfo->FSI_Free_Count);
  80af42:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80af46:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80af4a:	8b 88 e8 01 00 00    	mov    ecx,DWORD PTR [rax+0x1e8]
  80af50:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80af54:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80af58:	8b 90 e4 01 00 00    	mov    edx,DWORD PTR [rax+0x1e4]
  80af5e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80af62:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80af66:	8b 00                	mov    eax,DWORD PTR [rax]
  80af68:	89 c6                	mov    esi,eax
  80af6a:	bf 88 45 81 00       	mov    edi,0x814588
  80af6f:	b8 00 00 00 00       	mov    eax,0x0
  80af74:	e8 ae 5d ff ff       	call   800d27 <printf>
	
	////directory entry
	sbp->root = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  80af79:	be 00 00 00 00       	mov    esi,0x0
  80af7e:	bf 48 00 00 00       	mov    edi,0x48
  80af83:	b8 00 00 00 00       	mov    eax,0x0
  80af88:	e8 2c 63 ff ff       	call   8012b9 <vmalloc>
  80af8d:	48 89 c2             	mov    rdx,rax
  80af90:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80af94:	48 89 10             	mov    QWORD PTR [rax],rdx
	memset(sbp->root,0,sizeof(struct dir_entry));
  80af97:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80af9b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80af9e:	ba 48 00 00 00       	mov    edx,0x48
  80afa3:	be 00 00 00 00       	mov    esi,0x0
  80afa8:	48 89 c7             	mov    rdi,rax
  80afab:	e8 b1 09 00 00       	call   80b961 <memset>

	list_init(&sbp->root->child_node);
  80afb0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80afb4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80afb7:	48 83 c0 10          	add    rax,0x10
  80afbb:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    list->prev = list;
  80afbf:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80afc3:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80afc7:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  80afca:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80afce:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80afd2:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  80afd6:	90                   	nop
	list_init(&sbp->root->subdirs_list);
  80afd7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80afdb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80afde:	48 83 c0 20          	add    rax,0x20
  80afe2:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    list->prev = list;
  80afe6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80afea:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80afee:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  80aff1:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80aff5:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80aff9:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  80affd:	90                   	nop
	sbp->root->parent = sbp->root;
  80affe:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b002:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b005:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80b009:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  80b00c:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
	sbp->root->dir_ops = &FAT32_dentry_ops;
  80b010:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b014:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b017:	48 c7 40 40 80 c5 80 	mov    QWORD PTR [rax+0x40],0x80c580
  80b01e:	00 
	sbp->root->name = (char *)vmalloc(2,0);
  80b01f:	be 00 00 00 00       	mov    esi,0x0
  80b024:	bf 02 00 00 00       	mov    edi,0x2
  80b029:	b8 00 00 00 00       	mov    eax,0x0
  80b02e:	e8 86 62 ff ff       	call   8012b9 <vmalloc>
  80b033:	48 89 c2             	mov    rdx,rax
  80b036:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b03a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b03d:	48 89 10             	mov    QWORD PTR [rax],rdx
	sbp->root->name[0] = '/';
  80b040:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b044:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b047:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b04a:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
	sbp->root->name_length = 1;
  80b04d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b051:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b054:	c7 40 08 01 00 00 00 	mov    DWORD PTR [rax+0x8],0x1

	////index node
	sbp->root->dir_inode = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  80b05b:	be 00 00 00 00       	mov    esi,0x0
  80b060:	bf 38 00 00 00       	mov    edi,0x38
  80b065:	b8 00 00 00 00       	mov    eax,0x0
  80b06a:	e8 4a 62 ff ff       	call   8012b9 <vmalloc>
  80b06f:	48 89 c2             	mov    rdx,rax
  80b072:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b076:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b079:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(sbp->root->dir_inode,0,sizeof(struct index_node));
  80b07d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b081:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b084:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b088:	ba 38 00 00 00       	mov    edx,0x38
  80b08d:	be 00 00 00 00       	mov    esi,0x0
  80b092:	48 89 c7             	mov    rdi,rax
  80b095:	e8 c7 08 00 00       	call   80b961 <memset>
	sbp->root->dir_inode->inode_ops = &FAT32_inode_ops;
  80b09a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b09e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b0a1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b0a5:	48 c7 40 28 40 c5 80 	mov    QWORD PTR [rax+0x28],0x80c540
  80b0ac:	00 
	sbp->root->dir_inode->f_ops = &FAT32_file_ops;
  80b0ad:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b0b1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b0b4:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b0b8:	48 c7 40 20 00 c5 80 	mov    QWORD PTR [rax+0x20],0x80c500
  80b0bf:	00 
	sbp->root->dir_inode->file_size = 0;
  80b0c0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b0c4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b0c7:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b0cb:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
	sbp->root->dir_inode->blocks = (sbp->root->dir_inode->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  80b0d2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b0d6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b0d9:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b0dd:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80b0e0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b0e4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80b0e8:	48 01 d0             	add    rax,rdx
  80b0eb:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  80b0ef:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b0f3:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80b0f7:	48 89 c6             	mov    rsi,rax
  80b0fa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b0fe:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b101:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  80b105:	48 89 d0             	mov    rax,rdx
  80b108:	ba 00 00 00 00       	mov    edx,0x0
  80b10d:	48 f7 f6             	div    rsi
  80b110:	48 89 41 08          	mov    QWORD PTR [rcx+0x8],rax
	sbp->root->dir_inode->attribute = FS_ATTR_DIR;
  80b114:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b118:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b11b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b11f:	48 c7 40 10 02 00 00 	mov    QWORD PTR [rax+0x10],0x2
  80b126:	00 
	sbp->root->dir_inode->sb = sbp;
  80b127:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b12b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b12e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b132:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80b136:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx

	////fat32 root inode
	sbp->root->dir_inode->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  80b13a:	be 00 00 00 00       	mov    esi,0x0
  80b13f:	bf 20 00 00 00       	mov    edi,0x20
  80b144:	b8 00 00 00 00       	mov    eax,0x0
  80b149:	e8 6b 61 ff ff       	call   8012b9 <vmalloc>
  80b14e:	48 89 c2             	mov    rdx,rax
  80b151:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b155:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b158:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b15c:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(sbp->root->dir_inode->private_index_info,0,sizeof(struct FAT32_inode_info));
  80b160:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b164:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b167:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b16b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b16f:	ba 20 00 00 00       	mov    edx,0x20
  80b174:	be 00 00 00 00       	mov    esi,0x0
  80b179:	48 89 c7             	mov    rdi,rax
  80b17c:	e8 e0 07 00 00       	call   80b961 <memset>
	finode = (struct FAT32_inode_info *)sbp->root->dir_inode->private_index_info;
  80b181:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b185:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b188:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b18c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b190:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	finode->first_cluster = fbs->BPB_RootClus;
  80b194:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b198:	8b 40 2c             	mov    eax,DWORD PTR [rax+0x2c]
  80b19b:	89 c2                	mov    edx,eax
  80b19d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b1a1:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = 0;
  80b1a4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b1a8:	48 c7 40 08 00 00 00 	mov    QWORD PTR [rax+0x8],0x0
  80b1af:	00 
	finode->dentry_position = 0; 
  80b1b0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b1b4:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  80b1bb:	00 
	finode->create_date = 0;
  80b1bc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b1c0:	66 c7 40 18 00 00    	mov    WORD PTR [rax+0x18],0x0
	finode->create_time = 0;
  80b1c6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b1ca:	66 c7 40 1a 00 00    	mov    WORD PTR [rax+0x1a],0x0
	finode->write_date = 0;
  80b1d0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b1d4:	66 c7 40 1c 00 00    	mov    WORD PTR [rax+0x1c],0x0
	finode->write_time = 0;
  80b1da:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b1de:	66 c7 40 1e 00 00    	mov    WORD PTR [rax+0x1e],0x0

	return sbp;
  80b1e4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80b1e8:	c9                   	leave  
  80b1e9:	c3                   	ret    

000000000080b1ea <DISK1_FAT32_FS_init>:
	.read_superblock = fat32_read_superblock,
	.next = NULL,
};

void DISK1_FAT32_FS_init()
{
  80b1ea:	f3 0f 1e fa          	endbr64 
  80b1ee:	55                   	push   rbp
  80b1ef:	48 89 e5             	mov    rbp,rsp
  80b1f2:	48 81 ec 10 04 00 00 	sub    rsp,0x410
	int i;
	unsigned char buf[512];
	struct dir_entry * dentry = NULL;
  80b1f9:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80b200:	00 
	struct Disk_Partition_Table DPT = {0};
  80b201:	48 8d 95 f0 fb ff ff 	lea    rdx,[rbp-0x410]
  80b208:	b8 00 00 00 00       	mov    eax,0x0
  80b20d:	b9 40 00 00 00       	mov    ecx,0x40
  80b212:	48 89 d7             	mov    rdi,rdx
  80b215:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax

	register_filesystem(&FAT32_fs_type);
  80b218:	bf c0 c5 80 00       	mov    edi,0x80c5c0
  80b21d:	e8 61 c1 ff ff       	call   807383 <register_filesystem>
	
	memset(buf,0,512);
  80b222:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80b229:	ba 00 02 00 00       	mov    edx,0x200
  80b22e:	be 00 00 00 00       	mov    esi,0x0
  80b233:	48 89 c7             	mov    rdi,rax
  80b236:	e8 26 07 00 00       	call   80b961 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,0x0,1,(unsigned char *)buf);
  80b23b:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80b242:	49 89 c0             	mov    r8,rax
  80b245:	b9 01 00 00 00       	mov    ecx,0x1
  80b24a:	ba 00 00 00 00       	mov    edx,0x0
  80b24f:	be 00 00 00 00       	mov    esi,0x0
  80b254:	bf 00 00 00 00       	mov    edi,0x0
  80b259:	e8 40 d0 ff ff       	call   80829e <request>
  80b25e:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    chk_result(r);
  80b261:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b264:	89 c7                	mov    edi,eax
  80b266:	e8 e7 d6 ff ff       	call   808952 <chk_result>
    DPT = *(struct Disk_Partition_Table *)buf;
  80b26b:	48 8d 95 f0 fd ff ff 	lea    rdx,[rbp-0x210]
  80b272:	48 8d 85 f0 fb ff ff 	lea    rax,[rbp-0x410]
  80b279:	48 89 d6             	mov    rsi,rdx
  80b27c:	ba 40 00 00 00       	mov    edx,0x40
  80b281:	48 89 c7             	mov    rdi,rax
  80b284:	48 89 d1             	mov    rcx,rdx
  80b287:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
	printf("DPTE[0] start_LBA:%x\ttype:%x\n",DPT.DPTE[0].start_LBA,DPT.DPTE[0].type);
  80b28a:	0f b6 85 b2 fd ff ff 	movzx  eax,BYTE PTR [rbp-0x24e]
  80b291:	0f b6 d0             	movzx  edx,al
  80b294:	8b 85 b6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x24a]
  80b29a:	89 c6                	mov    esi,eax
  80b29c:	bf d0 45 81 00       	mov    edi,0x8145d0
  80b2a1:	b8 00 00 00 00       	mov    eax,0x0
  80b2a6:	e8 7c 5a ff ff       	call   800d27 <printf>

	memset(buf,0,512);
  80b2ab:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80b2b2:	ba 00 02 00 00       	mov    edx,0x200
  80b2b7:	be 00 00 00 00       	mov    esi,0x0
  80b2bc:	48 89 c7             	mov    rdi,rax
  80b2bf:	e8 9d 06 00 00       	call   80b961 <memset>
	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPT.DPTE[0].start_LBA,1,(unsigned char *)buf);
  80b2c4:	8b 85 b6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x24a]
  80b2ca:	89 c2                	mov    edx,eax
  80b2cc:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80b2d3:	49 89 c0             	mov    r8,rax
  80b2d6:	b9 01 00 00 00       	mov    ecx,0x1
  80b2db:	be 00 00 00 00       	mov    esi,0x0
  80b2e0:	bf 00 00 00 00       	mov    edi,0x0
  80b2e5:	e8 b4 cf ff ff       	call   80829e <request>
  80b2ea:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    chk_result(r1);
  80b2ed:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80b2f0:	89 c7                	mov    edi,eax
  80b2f2:	e8 5b d6 ff ff       	call   808952 <chk_result>

	root_sb = mount_fs("FAT32",&DPT.DPTE[0],buf);	//not dev node
  80b2f7:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80b2fe:	48 8d 95 f0 fb ff ff 	lea    rdx,[rbp-0x410]
  80b305:	48 8d 8a be 01 00 00 	lea    rcx,[rdx+0x1be]
  80b30c:	48 89 c2             	mov    rdx,rax
  80b30f:	48 89 ce             	mov    rsi,rcx
  80b312:	bf ca 45 81 00       	mov    edi,0x8145ca
  80b317:	e8 ef bf ff ff       	call   80730b <mount_fs>
  80b31c:	48 89 05 85 d3 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1d385],rax        # 4286a8 <root_sb>
}
  80b323:	90                   	nop
  80b324:	c9                   	leave  
  80b325:	c3                   	ret    

000000000080b326 <close_tty>:
int stdd=0;
struct file_operations tty_fops={
        .open=init_tty, .close=close_tty,.write=write_tty,.read=read_tty,.ioctl=tty_do_req
};

long close_tty(struct index_node * inode,struct file * filp){
  80b326:	f3 0f 1e fa          	endbr64 
  80b32a:	55                   	push   rbp
  80b32b:	48 89 e5             	mov    rbp,rsp
  80b32e:	48 83 ec 30          	sub    rsp,0x30
  80b332:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80b336:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    stdbuf_t * bi=&((tty_t*)filp->private_data)->stdin_buf;
  80b33a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b33e:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80b342:	48 83 c0 18          	add    rax,0x18
  80b346:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    stdbuf_t * bo=&((tty_t*)filp->private_data)->stdout_buf;
  80b34a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b34e:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80b352:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    stdbuf_t * be=&((tty_t*)filp->private_data)->stderr_buf;
  80b356:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b35a:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80b35e:	48 83 c0 30          	add    rax,0x30
  80b362:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    vmfree((addr_t)bi);
  80b366:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b36a:	48 89 c7             	mov    rdi,rax
  80b36d:	e8 d6 5f ff ff       	call   801348 <vmfree>
    vmfree((addr_t)bo);
  80b372:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b376:	48 89 c7             	mov    rdi,rax
  80b379:	e8 ca 5f ff ff       	call   801348 <vmfree>
    vmfree((addr_t)be);
  80b37e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b382:	48 89 c7             	mov    rdi,rax
  80b385:	e8 be 5f ff ff       	call   801348 <vmfree>
    vmfree((addr_t)filp->private_data);
  80b38a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b38e:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80b392:	48 89 c7             	mov    rdi,rax
  80b395:	e8 ae 5f ff ff       	call   801348 <vmfree>
    return 0;
  80b39a:	b8 00 00 00 00       	mov    eax,0x0
}
  80b39f:	c9                   	leave  
  80b3a0:	c3                   	ret    

000000000080b3a1 <init_tty>:
//打开文件
long init_tty(struct index_node * inode,struct file * filp)
{
  80b3a1:	f3 0f 1e fa          	endbr64 
  80b3a5:	55                   	push   rbp
  80b3a6:	48 89 e5             	mov    rbp,rsp
  80b3a9:	48 83 ec 20          	sub    rsp,0x20
  80b3ad:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80b3b1:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    tty_t *ntty=(tty_t*)vmalloc();
  80b3b5:	b8 00 00 00 00       	mov    eax,0x0
  80b3ba:	e8 fa 5e ff ff       	call   8012b9 <vmalloc>
  80b3bf:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //创建三个缓冲区
    ntty->stdin_buf.data= (char*)vmalloc();
  80b3c3:	b8 00 00 00 00       	mov    eax,0x0
  80b3c8:	e8 ec 5e ff ff       	call   8012b9 <vmalloc>
  80b3cd:	48 89 c2             	mov    rdx,rax
  80b3d0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b3d4:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    ntty->stdout_buf.data=(char*)vmalloc();
  80b3d8:	b8 00 00 00 00       	mov    eax,0x0
  80b3dd:	e8 d7 5e ff ff       	call   8012b9 <vmalloc>
  80b3e2:	48 89 c2             	mov    rdx,rax
  80b3e5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b3e9:	48 89 10             	mov    QWORD PTR [rax],rdx
    ntty->stderr_buf.data=(char*)vmalloc();
  80b3ec:	b8 00 00 00 00       	mov    eax,0x0
  80b3f1:	e8 c3 5e ff ff       	call   8012b9 <vmalloc>
  80b3f6:	48 89 c2             	mov    rdx,rax
  80b3f9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b3fd:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
    ntty->stdin_buf. wptr= 0;
  80b401:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b405:	c7 40 20 00 00 00 00 	mov    DWORD PTR [rax+0x20],0x0
    ntty->stdout_buf.wptr= 0;
  80b40c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b410:	c7 40 08 00 00 00 00 	mov    DWORD PTR [rax+0x8],0x0
    ntty->stderr_buf.wptr= 0;
  80b417:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b41b:	c7 40 38 00 00 00 00 	mov    DWORD PTR [rax+0x38],0x0
    ntty->stdin_buf. rptr= 0;
  80b422:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b426:	c7 40 24 00 00 00 00 	mov    DWORD PTR [rax+0x24],0x0
    ntty->stdout_buf.rptr= 0;
  80b42d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b431:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [rax+0xc],0x0
    ntty->stderr_buf.rptr= 0;
  80b438:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b43c:	c7 40 3c 00 00 00 00 	mov    DWORD PTR [rax+0x3c],0x0
    ntty->stdin_buf.size= PAGE_4K_SIZE;
  80b443:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b447:	c7 40 28 00 10 00 00 	mov    DWORD PTR [rax+0x28],0x1000
    ntty->stdout_buf.size= PAGE_4K_SIZE;
  80b44e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b452:	c7 40 10 00 10 00 00 	mov    DWORD PTR [rax+0x10],0x1000
    ntty->stderr_buf.size= PAGE_4K_SIZE;
  80b459:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b45d:	c7 40 40 00 10 00 00 	mov    DWORD PTR [rax+0x40],0x1000
    //设置inode文件操作方式为tty方式
    inode->f_ops=&tty_fops;
  80b464:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b468:	48 c7 40 20 e0 c5 80 	mov    QWORD PTR [rax+0x20],0x80c5e0
  80b46f:	00 
    filp->f_ops=&tty_fops;
  80b470:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b474:	48 c7 40 18 e0 c5 80 	mov    QWORD PTR [rax+0x18],0x80c5e0
  80b47b:	00 
    filp->private_data=ntty;
  80b47c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b480:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80b484:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
    return 0;
  80b488:	b8 00 00 00 00       	mov    eax,0x0
}
  80b48d:	c9                   	leave  
  80b48e:	c3                   	ret    

000000000080b48f <read_tty>:

long read_tty(struct file * filp,char * buf,unsigned long count,long * position)
{
  80b48f:	f3 0f 1e fa          	endbr64 
  80b493:	55                   	push   rbp
  80b494:	48 89 e5             	mov    rbp,rsp
  80b497:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80b49b:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80b49f:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  80b4a3:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
    stdbuf_t * b=&((tty_t*)filp->private_data)->stdin_buf;
  80b4a7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b4ab:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80b4af:	48 83 c0 18          	add    rax,0x18
  80b4b3:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int i=0;
  80b4b7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while (i<count){
  80b4be:	eb 5a                	jmp    80b51a <read_tty+0x8b>
        if(b->rptr==b->size)
  80b4c0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b4c4:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  80b4c7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b4cb:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80b4ce:	39 c2                	cmp    edx,eax
  80b4d0:	75 0b                	jne    80b4dd <read_tty+0x4e>
            b->rptr=0;
  80b4d2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b4d6:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [rax+0xc],0x0
        buf[i++]=b->data[b->rptr];
  80b4dd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b4e1:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80b4e4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b4e8:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80b4eb:	48 98                	cdqe   
  80b4ed:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80b4f1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b4f4:	8d 50 01             	lea    edx,[rax+0x1]
  80b4f7:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80b4fa:	48 63 d0             	movsxd rdx,eax
  80b4fd:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b501:	48 01 c2             	add    rdx,rax
  80b504:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
  80b507:	88 02                	mov    BYTE PTR [rdx],al
        b->rptr++;
  80b509:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b50d:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80b510:	8d 50 01             	lea    edx,[rax+0x1]
  80b513:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b517:	89 50 0c             	mov    DWORD PTR [rax+0xc],edx
    while (i<count){
  80b51a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b51d:	48 98                	cdqe   
  80b51f:	48 39 45 d8          	cmp    QWORD PTR [rbp-0x28],rax
  80b523:	77 9b                	ja     80b4c0 <read_tty+0x31>
    }
}
  80b525:	90                   	nop
  80b526:	5d                   	pop    rbp
  80b527:	c3                   	ret    

000000000080b528 <write_tty>:
long write_tty(struct file * filp,char * buf,unsigned long count,long * position)
{
  80b528:	f3 0f 1e fa          	endbr64 
  80b52c:	55                   	push   rbp
  80b52d:	48 89 e5             	mov    rbp,rsp
  80b530:	48 83 ec 40          	sub    rsp,0x40
  80b534:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80b538:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  80b53c:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  80b540:	48 89 4d c0          	mov    QWORD PTR [rbp-0x40],rcx
    stdbuf_t * b=&((tty_t*)filp->private_data)->stdout_buf;
  80b544:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80b548:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80b54c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int i=0;
  80b550:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    int saved_wptr=b->wptr;
  80b557:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b55b:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b55e:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    while (i<count){
  80b561:	eb 5a                	jmp    80b5bd <write_tty+0x95>
        if(b->wptr==b->size)
  80b563:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b567:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80b56a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b56e:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80b571:	39 c2                	cmp    edx,eax
  80b573:	75 0b                	jne    80b580 <write_tty+0x58>
            b->wptr=0;
  80b575:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b579:	c7 40 08 00 00 00 00 	mov    DWORD PTR [rax+0x8],0x0
        b->data[b->wptr]=buf[i++];
  80b580:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b583:	8d 50 01             	lea    edx,[rax+0x1]
  80b586:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80b589:	48 63 d0             	movsxd rdx,eax
  80b58c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b590:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80b594:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b598:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80b59b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b59f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b5a2:	48 98                	cdqe   
  80b5a4:	48 01 c2             	add    rdx,rax
  80b5a7:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
  80b5aa:	88 02                	mov    BYTE PTR [rdx],al
        b->wptr++;
  80b5ac:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b5b0:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b5b3:	8d 50 01             	lea    edx,[rax+0x1]
  80b5b6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b5ba:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    while (i<count){
  80b5bd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b5c0:	48 98                	cdqe   
  80b5c2:	48 39 45 c8          	cmp    QWORD PTR [rbp-0x38],rax
  80b5c6:	77 9b                	ja     80b563 <write_tty+0x3b>
    }
    //刷新到framebuffer
    write_framebuffer(filp,b->data+saved_wptr,count,0);
  80b5c8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b5cc:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80b5cf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b5d2:	48 98                	cdqe   
  80b5d4:	48 8d 34 02          	lea    rsi,[rdx+rax*1]
  80b5d8:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80b5dc:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80b5e0:	b9 00 00 00 00       	mov    ecx,0x0
  80b5e5:	48 89 c7             	mov    rdi,rax
  80b5e8:	e8 96 b9 ff ff       	call   806f83 <write_framebuffer>
}
  80b5ed:	90                   	nop
  80b5ee:	c9                   	leave  
  80b5ef:	c3                   	ret    

000000000080b5f0 <tty_do_req>:
 * TTY_CONNECT:尝试连接到dev/console,这样会成为controlling terminal,里面的数据才能输出到屏幕上，
 * 因为除了特殊指定的进程都会有一个自己的天tty。
 * 成功返回0。
 * */
long tty_do_req(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg)
{
  80b5f0:	f3 0f 1e fa          	endbr64 
  80b5f4:	55                   	push   rbp
  80b5f5:	48 89 e5             	mov    rbp,rsp
  80b5f8:	48 83 ec 50          	sub    rsp,0x50
  80b5fc:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  80b600:	48 89 75 c0          	mov    QWORD PTR [rbp-0x40],rsi
  80b604:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  80b608:	48 89 4d b0          	mov    QWORD PTR [rbp-0x50],rcx
    stdbuf_t * b=&((tty_t*)filp->private_data)->stderr_buf;
  80b60c:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80b610:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80b614:	48 83 c0 30          	add    rax,0x30
  80b618:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int i=0;
  80b61c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* buf=*((char**)arg);
  80b623:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80b627:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b62a:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    unsigned long count=*((unsigned long*)(arg+8));
  80b62e:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80b632:	48 83 c0 08          	add    rax,0x8
  80b636:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b639:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    int saved_wptr=b->wptr;
  80b63d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b641:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b644:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    int fd=-1;
  80b647:	c7 45 d8 ff ff ff ff 	mov    DWORD PTR [rbp-0x28],0xffffffff
    switch (cmd)
  80b64e:	48 83 7d b8 02       	cmp    QWORD PTR [rbp-0x48],0x2
  80b653:	0f 84 df 00 00 00    	je     80b738 <tty_do_req+0x148>
  80b659:	48 83 7d b8 02       	cmp    QWORD PTR [rbp-0x48],0x2
  80b65e:	0f 87 fb 00 00 00    	ja     80b75f <tty_do_req+0x16f>
  80b664:	48 83 7d b8 00       	cmp    QWORD PTR [rbp-0x48],0x0
  80b669:	74 6a                	je     80b6d5 <tty_do_req+0xe5>
  80b66b:	48 83 7d b8 01       	cmp    QWORD PTR [rbp-0x48],0x1
  80b670:	0f 84 91 00 00 00    	je     80b707 <tty_do_req+0x117>
  80b676:	e9 e4 00 00 00       	jmp    80b75f <tty_do_req+0x16f>
    {
        case TTY_WSTDERR:
            while (i<count){
                if(b->wptr==b->size)
  80b67b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b67f:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80b682:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b686:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80b689:	39 c2                	cmp    edx,eax
  80b68b:	75 0b                	jne    80b698 <tty_do_req+0xa8>
                    b->wptr=0;
  80b68d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b691:	c7 40 08 00 00 00 00 	mov    DWORD PTR [rax+0x8],0x0
                b->data[b->wptr]=buf[i++];
  80b698:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b69b:	8d 50 01             	lea    edx,[rax+0x1]
  80b69e:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80b6a1:	48 63 d0             	movsxd rdx,eax
  80b6a4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b6a8:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80b6ac:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b6b0:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80b6b3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b6b7:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b6ba:	48 98                	cdqe   
  80b6bc:	48 01 c2             	add    rdx,rax
  80b6bf:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
  80b6c2:	88 02                	mov    BYTE PTR [rdx],al
                b->wptr++;
  80b6c4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b6c8:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b6cb:	8d 50 01             	lea    edx,[rax+0x1]
  80b6ce:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b6d2:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
            while (i<count){
  80b6d5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b6d8:	48 98                	cdqe   
  80b6da:	48 39 45 e0          	cmp    QWORD PTR [rbp-0x20],rax
  80b6de:	77 9b                	ja     80b67b <tty_do_req+0x8b>
            }
            //刷新到framebuffer
            write_framebuffer(filp,b->data+saved_wptr,count,0);
  80b6e0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b6e4:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80b6e7:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80b6ea:	48 98                	cdqe   
  80b6ec:	48 8d 34 02          	lea    rsi,[rdx+rax*1]
  80b6f0:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  80b6f4:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80b6f8:	b9 00 00 00 00       	mov    ecx,0x0
  80b6fd:	48 89 c7             	mov    rdi,rax
  80b700:	e8 7e b8 ff ff       	call   806f83 <write_framebuffer>
        break;
  80b705:	eb 61                	jmp    80b768 <tty_do_req+0x178>
        case TTY_CONNECT:
            fd=sys_open("sys/console",O_WRONLY|O_CREAT|O_EXCL);
  80b707:	be c1 00 00 00       	mov    esi,0xc1
  80b70c:	bf ee 45 81 00       	mov    edi,0x8145ee
  80b711:	e8 7a bd ff ff       	call   807490 <sys_open>
  80b716:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
            if(fd==-1)return -1;
  80b719:	83 7d d8 ff          	cmp    DWORD PTR [rbp-0x28],0xffffffff
  80b71d:	75 09                	jne    80b728 <tty_do_req+0x138>
  80b71f:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80b726:	eb 45                	jmp    80b76d <tty_do_req+0x17d>
            ((tty_t*)filp->private_data)->console_fd=fd;
  80b728:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80b72c:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80b730:	8b 55 d8             	mov    edx,DWORD PTR [rbp-0x28]
  80b733:	89 50 48             	mov    DWORD PTR [rax+0x48],edx
            break;
  80b736:	eb 30                	jmp    80b768 <tty_do_req+0x178>
        case TTY_DISCONNECT:
            fd=((tty_t*)filp->private_data)->console_fd;
  80b738:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80b73c:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80b740:	8b 40 48             	mov    eax,DWORD PTR [rax+0x48]
  80b743:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
            if(fd==-1)return -1;
  80b746:	83 7d d8 ff          	cmp    DWORD PTR [rbp-0x28],0xffffffff
  80b74a:	75 09                	jne    80b755 <tty_do_req+0x165>
  80b74c:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80b753:	eb 18                	jmp    80b76d <tty_do_req+0x17d>
            sys_close(fd);
  80b755:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  80b758:	89 c7                	mov    edi,eax
  80b75a:	e8 48 c0 ff ff       	call   8077a7 <sys_close>
    default:return -1;
  80b75f:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80b766:	eb 05                	jmp    80b76d <tty_do_req+0x17d>
    }
    return 0;
  80b768:	b8 00 00 00 00       	mov    eax,0x0
}
  80b76d:	c9                   	leave  
  80b76e:	c3                   	ret    

000000000080b76f <init_com>:
//
#include "com.h"
#include "int.h"


void init_com(int base_port){
  80b76f:	f3 0f 1e fa          	endbr64 
  80b773:	55                   	push   rbp
  80b774:	48 89 e5             	mov    rbp,rsp
  80b777:	48 83 ec 10          	sub    rsp,0x10
  80b77b:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    /* disable all interrupts */
    outb(base_port + COM_REG_IER, 0x00);
  80b77e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b781:	83 c0 01             	add    eax,0x1
  80b784:	0f b7 c0             	movzx  eax,ax
  80b787:	be 00 00 00 00       	mov    esi,0x0
  80b78c:	89 c7                	mov    edi,eax
  80b78e:	e8 6d a3 ff ff       	call   805b00 <outb>
    
    /* enable DLAB to set bound rate divisor */
    outb(base_port + COM_REG_LCR, 0x80);
  80b793:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b796:	83 c0 03             	add    eax,0x3
  80b799:	0f b7 c0             	movzx  eax,ax
  80b79c:	be 80 00 00 00       	mov    esi,0x80
  80b7a1:	89 c7                	mov    edi,eax
  80b7a3:	e8 58 a3 ff ff       	call   805b00 <outb>
    
    /* set divisor to 38400 baud */
    outb(base_port + COM_REG_DLL, 0x03);
  80b7a8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b7ab:	0f b7 c0             	movzx  eax,ax
  80b7ae:	be 03 00 00 00       	mov    esi,0x3
  80b7b3:	89 c7                	mov    edi,eax
  80b7b5:	e8 46 a3 ff ff       	call   805b00 <outb>
    outb(base_port + COM_REG_DLM, 0x00);
  80b7ba:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b7bd:	83 c0 01             	add    eax,0x1
  80b7c0:	0f b7 c0             	movzx  eax,ax
  80b7c3:	be 00 00 00 00       	mov    esi,0x0
  80b7c8:	89 c7                	mov    edi,eax
  80b7ca:	e8 31 a3 ff ff       	call   805b00 <outb>
    
    /* 8 data bits, parity off, 1 stop bit, DLAB latch off */
    outb(base_port + COM_REG_LCR, 0x03);
  80b7cf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b7d2:	83 c0 03             	add    eax,0x3
  80b7d5:	0f b7 c0             	movzx  eax,ax
  80b7d8:	be 03 00 00 00       	mov    esi,0x3
  80b7dd:	89 c7                	mov    edi,eax
  80b7df:	e8 1c a3 ff ff       	call   805b00 <outb>
    
    /* enable FIFO */
    outb(base_port + COM_REG_FCR, 0x87);//0xc7
  80b7e4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b7e7:	83 c0 02             	add    eax,0x2
  80b7ea:	0f b7 c0             	movzx  eax,ax
  80b7ed:	be 87 00 00 00       	mov    esi,0x87
  80b7f2:	89 c7                	mov    edi,eax
  80b7f4:	e8 07 a3 ff ff       	call   805b00 <outb>

    /* enable IRQs, set RTS/DSR */
    outb(base_port + COM_REG_MCR, 0x0B);
  80b7f9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b7fc:	83 c0 04             	add    eax,0x4
  80b7ff:	0f b7 c0             	movzx  eax,ax
  80b802:	be 0b 00 00 00       	mov    esi,0xb
  80b807:	89 c7                	mov    edi,eax
  80b809:	e8 f2 a2 ff ff       	call   805b00 <outb>
//    if (inb(base_port + COM_REG_RX) != 0xae) {
//        return;
//    }
    
    /* set in normal mode */
    outb(base_port + COM_REG_MCR, 0x0F);
  80b80e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b811:	83 c0 04             	add    eax,0x4
  80b814:	0f b7 c0             	movzx  eax,ax
  80b817:	be 0f 00 00 00       	mov    esi,0xf
  80b81c:	89 c7                	mov    edi,eax
  80b81e:	e8 dd a2 ff ff       	call   805b00 <outb>
}
  80b823:	90                   	nop
  80b824:	c9                   	leave  
  80b825:	c3                   	ret    

000000000080b826 <com_putchar>:
void com_putchar(unsigned short ch,int com_base)
{
  80b826:	f3 0f 1e fa          	endbr64 
  80b82a:	55                   	push   rbp
  80b82b:	48 89 e5             	mov    rbp,rsp
  80b82e:	48 83 ec 20          	sub    rsp,0x20
  80b832:	89 f8                	mov    eax,edi
  80b834:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80b837:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    unsigned char res;
    /* wait for the port to be ready */
    do {
        res = inb(com_base + COM_REG_LSR);
  80b83b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80b83e:	83 c0 05             	add    eax,0x5
  80b841:	0f b6 c0             	movzx  eax,al
  80b844:	89 c7                	mov    edi,eax
  80b846:	e8 ce a2 ff ff       	call   805b19 <inb>
  80b84b:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        res &= 0x20;
  80b84e:	80 65 ff 20          	and    BYTE PTR [rbp-0x1],0x20
    } while (res == 0);
  80b852:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  80b856:	74 e3                	je     80b83b <com_putchar+0x15>
    outb(com_base, ch);
  80b858:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  80b85c:	0f b6 d0             	movzx  edx,al
  80b85f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80b862:	0f b7 c0             	movzx  eax,ax
  80b865:	89 d6                	mov    esi,edx
  80b867:	89 c7                	mov    edi,eax
  80b869:	e8 92 a2 ff ff       	call   805b00 <outb>
}
  80b86e:	90                   	nop
  80b86f:	c9                   	leave  
  80b870:	c3                   	ret    

000000000080b871 <com_puts>:

void com_puts(char* s,int com_port){
  80b871:	f3 0f 1e fa          	endbr64 
  80b875:	55                   	push   rbp
  80b876:	48 89 e5             	mov    rbp,rsp
  80b879:	48 83 ec 10          	sub    rsp,0x10
  80b87d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80b881:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    for(;*s;s++){
  80b884:	eb 1d                	jmp    80b8a3 <com_puts+0x32>
        com_putchar(*s,com_port);
  80b886:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b88a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b88d:	66 98                	cbw    
  80b88f:	0f b7 c0             	movzx  eax,ax
  80b892:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80b895:	89 d6                	mov    esi,edx
  80b897:	89 c7                	mov    edi,eax
  80b899:	e8 88 ff ff ff       	call   80b826 <com_putchar>
    for(;*s;s++){
  80b89e:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  80b8a3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b8a7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b8aa:	84 c0                	test   al,al
  80b8ac:	75 d8                	jne    80b886 <com_puts+0x15>
    }
  80b8ae:	90                   	nop
  80b8af:	90                   	nop
  80b8b0:	c9                   	leave  
  80b8b1:	c3                   	ret    

000000000080b8b2 <memcpy>:
#include "mem.h"
#include "typename.h"
static u32 mem_end;
static u32 usr_mem_base;
void memcpy(u8* dest, u8 *src,u32 size){
  80b8b2:	f3 0f 1e fa          	endbr64 
  80b8b6:	55                   	push   rbp
  80b8b7:	48 89 e5             	mov    rbp,rsp
  80b8ba:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80b8be:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80b8c2:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    *dest=0xff;//如果页内存还没分配，这样就可以先激发缺页异常分配了，之后写数据就会完整不会少开头第一个字节。
  80b8c5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b8c9:	c6 00 ff             	mov    BYTE PTR [rax],0xff
    for(int i=0;i<size;i++){
  80b8cc:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80b8d3:	eb 1b                	jmp    80b8f0 <memcpy+0x3e>
        *(dest)=*(src);
  80b8d5:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b8d9:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80b8dc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b8e0:	88 10                	mov    BYTE PTR [rax],dl
        dest++;
  80b8e2:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        src++;
  80b8e7:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<size;i++){
  80b8ec:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80b8f0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b8f3:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
  80b8f6:	77 dd                	ja     80b8d5 <memcpy+0x23>
    }
}
  80b8f8:	90                   	nop
  80b8f9:	90                   	nop
  80b8fa:	5d                   	pop    rbp
  80b8fb:	c3                   	ret    

000000000080b8fc <memcmp>:
int memcmp(u8 *a,u8* b,int len)
{
  80b8fc:	f3 0f 1e fa          	endbr64 
  80b900:	55                   	push   rbp
  80b901:	48 89 e5             	mov    rbp,rsp
  80b904:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80b908:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80b90c:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    for(int i=0;i<len;i++)
  80b90f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80b916:	eb 3a                	jmp    80b952 <memcmp+0x56>
    {
        if(*a!=*b)
  80b918:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b91c:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80b91f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b923:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b926:	38 c2                	cmp    dl,al
  80b928:	74 1a                	je     80b944 <memcmp+0x48>
            return *a-*b;
  80b92a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b92e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b931:	0f b6 d0             	movzx  edx,al
  80b934:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b938:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b93b:	0f b6 c8             	movzx  ecx,al
  80b93e:	89 d0                	mov    eax,edx
  80b940:	29 c8                	sub    eax,ecx
  80b942:	eb 1b                	jmp    80b95f <memcmp+0x63>
        a++;
  80b944:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        b++;
  80b949:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<len;i++)
  80b94e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80b952:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b955:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  80b958:	7c be                	jl     80b918 <memcmp+0x1c>
    }
    return 0;
  80b95a:	b8 00 00 00 00       	mov    eax,0x0
}
  80b95f:	5d                   	pop    rbp
  80b960:	c3                   	ret    

000000000080b961 <memset>:
void memset(u8 *buf,u8 value,u32 size){
  80b961:	f3 0f 1e fa          	endbr64 
  80b965:	55                   	push   rbp
  80b966:	48 89 e5             	mov    rbp,rsp
  80b969:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80b96d:	89 f0                	mov    eax,esi
  80b96f:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
  80b972:	88 45 e4             	mov    BYTE PTR [rbp-0x1c],al
    for(u32 i=0;i<size;i++){
  80b975:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80b97c:	eb 16                	jmp    80b994 <memset+0x33>
        *(buf++)=value;
  80b97e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b982:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80b986:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80b98a:	0f b6 55 e4          	movzx  edx,BYTE PTR [rbp-0x1c]
  80b98e:	88 10                	mov    BYTE PTR [rax],dl
    for(u32 i=0;i<size;i++){
  80b990:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80b994:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b997:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  80b99a:	72 e2                	jb     80b97e <memset+0x1d>
    }
}
  80b99c:	90                   	nop
  80b99d:	90                   	nop
  80b99e:	5d                   	pop    rbp
  80b99f:	c3                   	ret    

000000000080b9a0 <get_mem_size>:

u32 get_mem_size(){
  80b9a0:	f3 0f 1e fa          	endbr64 
  80b9a4:	55                   	push   rbp
  80b9a5:	48 89 e5             	mov    rbp,rsp
    return mem_end;
  80b9a8:	8b 05 6e fc c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fc6e]        # 42b61c <mem_end>
}
  80b9ae:	5d                   	pop    rbp
  80b9af:	c3                   	ret    

000000000080b9b0 <strcpy>:
#include "str.h"
#include <stdarg.h>
void strcpy(unsigned char* dest, unsigned char *buf){
  80b9b0:	f3 0f 1e fa          	endbr64 
  80b9b4:	55                   	push   rbp
  80b9b5:	48 89 e5             	mov    rbp,rsp
  80b9b8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80b9bc:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*buf!='\0'){
  80b9c0:	eb 1d                	jmp    80b9df <strcpy+0x2f>
        *(dest++)=*(buf++);
  80b9c2:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80b9c6:	48 8d 42 01          	lea    rax,[rdx+0x1]
  80b9ca:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  80b9ce:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b9d2:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80b9d6:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80b9da:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80b9dd:	88 10                	mov    BYTE PTR [rax],dl
    while(*buf!='\0'){
  80b9df:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b9e3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b9e6:	84 c0                	test   al,al
  80b9e8:	75 d8                	jne    80b9c2 <strcpy+0x12>
    }
    *dest='\0';
  80b9ea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b9ee:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80b9f1:	90                   	nop
  80b9f2:	5d                   	pop    rbp
  80b9f3:	c3                   	ret    

000000000080b9f4 <strtok>:
static char strtokkee[512],*strtokkeeptr=strtokkee;
static int tokptr=0;
static char retbuf[512],*retbptr=retbuf;
char* strtok(char *str,char splitter){
  80b9f4:	f3 0f 1e fa          	endbr64 
  80b9f8:	55                   	push   rbp
  80b9f9:	48 89 e5             	mov    rbp,rsp
  80b9fc:	48 83 ec 30          	sub    rsp,0x30
  80ba00:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80ba04:	89 f0                	mov    eax,esi
  80ba06:	88 45 d4             	mov    BYTE PTR [rbp-0x2c],al
    //limit: cannot cut string longer than 512
    if(str!=(void*)0){
  80ba09:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80ba0e:	0f 84 9c 00 00 00    	je     80bab0 <strtok+0xbc>
        //cut for the first time
        strcpy(strtokkee,str);
  80ba14:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80ba18:	48 89 c6             	mov    rsi,rax
  80ba1b:	bf 40 b6 42 00       	mov    edi,0x42b640
  80ba20:	e8 8b ff ff ff       	call   80b9b0 <strcpy>
        char* ptr=strtokkee;
  80ba25:	48 c7 45 e8 40 b6 42 	mov    QWORD PTR [rbp-0x18],0x42b640
  80ba2c:	00 
        for(tokptr=0;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512);
  80ba2d:	c7 05 09 fe c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1fe09],0x0        # 42b840 <tokptr>
  80ba34:	00 00 00 
  80ba37:	eb 1c                	jmp    80ba55 <strtok+0x61>
  80ba39:	8b 05 01 fe c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fe01]        # 42b840 <tokptr>
  80ba3f:	83 c0 01             	add    eax,0x1
  80ba42:	99                   	cdq    
  80ba43:	c1 ea 17             	shr    edx,0x17
  80ba46:	01 d0                	add    eax,edx
  80ba48:	25 ff 01 00 00       	and    eax,0x1ff
  80ba4d:	29 d0                	sub    eax,edx
  80ba4f:	89 05 eb fd c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1fdeb],eax        # 42b840 <tokptr>
  80ba55:	8b 05 e5 fd c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fde5]        # 42b840 <tokptr>
  80ba5b:	48 98                	cdqe   
  80ba5d:	0f b6 80 40 b6 42 00 	movzx  eax,BYTE PTR [rax+0x42b640]
  80ba64:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80ba67:	74 13                	je     80ba7c <strtok+0x88>
  80ba69:	8b 05 d1 fd c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fdd1]        # 42b840 <tokptr>
  80ba6f:	48 98                	cdqe   
  80ba71:	0f b6 80 40 b6 42 00 	movzx  eax,BYTE PTR [rax+0x42b640]
  80ba78:	84 c0                	test   al,al
  80ba7a:	75 bd                	jne    80ba39 <strtok+0x45>
        strtokkee[tokptr]='\0';
  80ba7c:	8b 05 be fd c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fdbe]        # 42b840 <tokptr>
  80ba82:	48 98                	cdqe   
  80ba84:	c6 80 40 b6 42 00 00 	mov    BYTE PTR [rax+0x42b640],0x0
        tokptr=(tokptr+1)%512;
  80ba8b:	8b 05 af fd c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fdaf]        # 42b840 <tokptr>
  80ba91:	83 c0 01             	add    eax,0x1
  80ba94:	99                   	cdq    
  80ba95:	c1 ea 17             	shr    edx,0x17
  80ba98:	01 d0                	add    eax,edx
  80ba9a:	25 ff 01 00 00       	and    eax,0x1ff
  80ba9f:	29 d0                	sub    eax,edx
  80baa1:	89 05 99 fd c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1fd99],eax        # 42b840 <tokptr>
        return ptr;
  80baa7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80baab:	e9 9e 00 00 00       	jmp    80bb4e <strtok+0x15a>
    }
    //go on cutting
    int c=0;
  80bab0:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* ptr=strtokkee+tokptr;
  80bab7:	8b 05 83 fd c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fd83]        # 42b840 <tokptr>
  80babd:	48 98                	cdqe   
  80babf:	48 05 40 b6 42 00    	add    rax,0x42b640
  80bac5:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512,c++);
  80bac9:	eb 20                	jmp    80baeb <strtok+0xf7>
  80bacb:	8b 05 6f fd c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fd6f]        # 42b840 <tokptr>
  80bad1:	83 c0 01             	add    eax,0x1
  80bad4:	99                   	cdq    
  80bad5:	c1 ea 17             	shr    edx,0x17
  80bad8:	01 d0                	add    eax,edx
  80bada:	25 ff 01 00 00       	and    eax,0x1ff
  80badf:	29 d0                	sub    eax,edx
  80bae1:	89 05 59 fd c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1fd59],eax        # 42b840 <tokptr>
  80bae7:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80baeb:	8b 05 4f fd c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fd4f]        # 42b840 <tokptr>
  80baf1:	48 98                	cdqe   
  80baf3:	0f b6 80 40 b6 42 00 	movzx  eax,BYTE PTR [rax+0x42b640]
  80bafa:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80bafd:	74 13                	je     80bb12 <strtok+0x11e>
  80baff:	8b 05 3b fd c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fd3b]        # 42b840 <tokptr>
  80bb05:	48 98                	cdqe   
  80bb07:	0f b6 80 40 b6 42 00 	movzx  eax,BYTE PTR [rax+0x42b640]
  80bb0e:	84 c0                	test   al,al
  80bb10:	75 b9                	jne    80bacb <strtok+0xd7>
    strtokkee[tokptr]='\0';
  80bb12:	8b 05 28 fd c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fd28]        # 42b840 <tokptr>
  80bb18:	48 98                	cdqe   
  80bb1a:	c6 80 40 b6 42 00 00 	mov    BYTE PTR [rax+0x42b640],0x0
    tokptr=(tokptr+1)%512;
  80bb21:	8b 05 19 fd c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fd19]        # 42b840 <tokptr>
  80bb27:	83 c0 01             	add    eax,0x1
  80bb2a:	99                   	cdq    
  80bb2b:	c1 ea 17             	shr    edx,0x17
  80bb2e:	01 d0                	add    eax,edx
  80bb30:	25 ff 01 00 00       	and    eax,0x1ff
  80bb35:	29 d0                	sub    eax,edx
  80bb37:	89 05 03 fd c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1fd03],eax        # 42b840 <tokptr>
    if(c)
  80bb3d:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80bb41:	74 06                	je     80bb49 <strtok+0x155>
        return ptr;
  80bb43:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bb47:	eb 05                	jmp    80bb4e <strtok+0x15a>
    else
        return (void*)0;
  80bb49:	b8 00 00 00 00       	mov    eax,0x0
}
  80bb4e:	c9                   	leave  
  80bb4f:	c3                   	ret    

000000000080bb50 <strcmp>:
int strcmp(char *s1,char *s2)
{
  80bb50:	f3 0f 1e fa          	endbr64 
  80bb54:	55                   	push   rbp
  80bb55:	48 89 e5             	mov    rbp,rsp
  80bb58:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bb5c:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	while(*s1!='\0'&&*s2!='\0'){
  80bb60:	eb 3c                	jmp    80bb9e <strcmp+0x4e>
		if(*s1>*s2)
  80bb62:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bb66:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80bb69:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bb6d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bb70:	38 c2                	cmp    dl,al
  80bb72:	7e 07                	jle    80bb7b <strcmp+0x2b>
			return 1;
  80bb74:	b8 01 00 00 00       	mov    eax,0x1
  80bb79:	eb 52                	jmp    80bbcd <strcmp+0x7d>
		else if(*s1<*s2)
  80bb7b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bb7f:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80bb82:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bb86:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bb89:	38 c2                	cmp    dl,al
  80bb8b:	7d 07                	jge    80bb94 <strcmp+0x44>
			return -1;
  80bb8d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80bb92:	eb 39                	jmp    80bbcd <strcmp+0x7d>
		s1++;
  80bb94:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
		s2++;
  80bb99:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
	while(*s1!='\0'&&*s2!='\0'){
  80bb9e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bba2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bba5:	84 c0                	test   al,al
  80bba7:	74 0b                	je     80bbb4 <strcmp+0x64>
  80bba9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bbad:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bbb0:	84 c0                	test   al,al
  80bbb2:	75 ae                	jne    80bb62 <strcmp+0x12>
	}
	if(*s1==*s2)
  80bbb4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bbb8:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80bbbb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bbbf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bbc2:	38 c2                	cmp    dl,al
  80bbc4:	75 07                	jne    80bbcd <strcmp+0x7d>
		return 0;
  80bbc6:	b8 00 00 00 00       	mov    eax,0x0
  80bbcb:	eb 00                	jmp    80bbcd <strcmp+0x7d>
}
  80bbcd:	5d                   	pop    rbp
  80bbce:	c3                   	ret    

000000000080bbcf <strlen>:

int strlen(char *str)
{
  80bbcf:	f3 0f 1e fa          	endbr64 
  80bbd3:	55                   	push   rbp
  80bbd4:	48 89 e5             	mov    rbp,rsp
  80bbd7:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int l=0;
  80bbdb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;*str!='\0';str++,l++);
  80bbe2:	eb 09                	jmp    80bbed <strlen+0x1e>
  80bbe4:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  80bbe9:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80bbed:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bbf1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bbf4:	84 c0                	test   al,al
  80bbf6:	75 ec                	jne    80bbe4 <strlen+0x15>
    return l;
  80bbf8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80bbfb:	5d                   	pop    rbp
  80bbfc:	c3                   	ret    

000000000080bbfd <sprintf>:

void sprintf(char *dist, char *str,...)
{
  80bbfd:	f3 0f 1e fa          	endbr64 
  80bc01:	55                   	push   rbp
  80bc02:	48 89 e5             	mov    rbp,rsp
  80bc05:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  80bc0c:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  80bc13:	48 89 b5 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rsi
  80bc1a:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  80bc21:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  80bc28:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  80bc2f:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  80bc36:	84 c0                	test   al,al
  80bc38:	74 20                	je     80bc5a <sprintf+0x5d>
  80bc3a:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  80bc3e:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  80bc42:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  80bc46:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  80bc4a:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  80bc4e:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  80bc52:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  80bc56:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7

    //count num of args
    char *pstr=str;
  80bc5a:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80bc61:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char *prev=str;
  80bc68:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80bc6f:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    int argnum=0;
  80bc76:	c7 85 3c ff ff ff 00 	mov    DWORD PTR [rbp-0xc4],0x0
  80bc7d:	00 00 00 
    while (*pstr!='\n')
  80bc80:	eb 39                	jmp    80bcbb <sprintf+0xbe>
    {
        if(*pstr=='%'&&*prev!='%')
  80bc82:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bc89:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bc8c:	3c 25                	cmp    al,0x25
  80bc8e:	75 15                	jne    80bca5 <sprintf+0xa8>
  80bc90:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  80bc97:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bc9a:	3c 25                	cmp    al,0x25
  80bc9c:	74 07                	je     80bca5 <sprintf+0xa8>
            argnum++;
  80bc9e:	83 85 3c ff ff ff 01 	add    DWORD PTR [rbp-0xc4],0x1
        prev=pstr;
  80bca5:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bcac:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
        pstr++;
  80bcb3:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80bcba:	01 
    while (*pstr!='\n')
  80bcbb:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bcc2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bcc5:	3c 0a                	cmp    al,0xa
  80bcc7:	75 b9                	jne    80bc82 <sprintf+0x85>
    }

    va_list vargs;
    va_start(vargs,str);
  80bcc9:	c7 85 08 ff ff ff 10 	mov    DWORD PTR [rbp-0xf8],0x10
  80bcd0:	00 00 00 
  80bcd3:	c7 85 0c ff ff ff 30 	mov    DWORD PTR [rbp-0xf4],0x30
  80bcda:	00 00 00 
  80bcdd:	48 8d 45 10          	lea    rax,[rbp+0x10]
  80bce1:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  80bce8:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  80bcef:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
    pstr=str;
  80bcf6:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80bcfd:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    for(;*pstr!='\0';pstr++){
  80bd04:	e9 e2 01 00 00       	jmp    80beeb <sprintf+0x2ee>
        if(*pstr=='%'&&*(pstr+1)!='\0'){
  80bd09:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bd10:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bd13:	3c 25                	cmp    al,0x25
  80bd15:	0f 85 aa 01 00 00    	jne    80bec5 <sprintf+0x2c8>
  80bd1b:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bd22:	48 83 c0 01          	add    rax,0x1
  80bd26:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bd29:	84 c0                	test   al,al
  80bd2b:	0f 84 94 01 00 00    	je     80bec5 <sprintf+0x2c8>
            pstr++;
  80bd31:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80bd38:	01 
            if(*pstr=='x'){
  80bd39:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bd40:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bd43:	3c 78                	cmp    al,0x78
  80bd45:	75 64                	jne    80bdab <sprintf+0x1ae>
                int v=va_arg(vargs,int);
  80bd47:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80bd4d:	83 f8 2f             	cmp    eax,0x2f
  80bd50:	77 23                	ja     80bd75 <sprintf+0x178>
  80bd52:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80bd59:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80bd5f:	89 d2                	mov    edx,edx
  80bd61:	48 01 d0             	add    rax,rdx
  80bd64:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80bd6a:	83 c2 08             	add    edx,0x8
  80bd6d:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80bd73:	eb 12                	jmp    80bd87 <sprintf+0x18a>
  80bd75:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80bd7c:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80bd80:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80bd87:	8b 00                	mov    eax,DWORD PTR [rax]
  80bd89:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
                sprint_hex(dist,v);
  80bd8f:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
  80bd95:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80bd9c:	89 d6                	mov    esi,edx
  80bd9e:	48 89 c7             	mov    rdi,rax
  80bda1:	e8 4e 02 00 00       	call   80bff4 <sprint_hex>
            if(*pstr=='x'){
  80bda6:	e9 38 01 00 00       	jmp    80bee3 <sprintf+0x2e6>
            }else if(*pstr=='s'){
  80bdab:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bdb2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bdb5:	3c 73                	cmp    al,0x73
  80bdb7:	75 68                	jne    80be21 <sprintf+0x224>
                char* v=va_arg(vargs,char*);
  80bdb9:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80bdbf:	83 f8 2f             	cmp    eax,0x2f
  80bdc2:	77 23                	ja     80bde7 <sprintf+0x1ea>
  80bdc4:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80bdcb:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80bdd1:	89 d2                	mov    edx,edx
  80bdd3:	48 01 d0             	add    rax,rdx
  80bdd6:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80bddc:	83 c2 08             	add    edx,0x8
  80bddf:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80bde5:	eb 12                	jmp    80bdf9 <sprintf+0x1fc>
  80bde7:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80bdee:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80bdf2:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80bdf9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80bdfc:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
                sprintn(dist,v);
  80be03:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
  80be0a:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80be11:	48 89 d6             	mov    rsi,rdx
  80be14:	48 89 c7             	mov    rdi,rax
  80be17:	e8 5a 02 00 00       	call   80c076 <sprintn>
            if(*pstr=='x'){
  80be1c:	e9 c2 00 00 00       	jmp    80bee3 <sprintf+0x2e6>
            }else if(*pstr=='d'){
  80be21:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80be28:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80be2b:	3c 64                	cmp    al,0x64
  80be2d:	75 66                	jne    80be95 <sprintf+0x298>
                char* v=va_arg(vargs,char*);
  80be2f:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80be35:	83 f8 2f             	cmp    eax,0x2f
  80be38:	77 23                	ja     80be5d <sprintf+0x260>
  80be3a:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80be41:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80be47:	89 d2                	mov    edx,edx
  80be49:	48 01 d0             	add    rax,rdx
  80be4c:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80be52:	83 c2 08             	add    edx,0x8
  80be55:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80be5b:	eb 12                	jmp    80be6f <sprintf+0x272>
  80be5d:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80be64:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80be68:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80be6f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80be72:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
                sprint_decimal(dist,v);
  80be79:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  80be80:	89 c2                	mov    edx,eax
  80be82:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80be89:	89 d6                	mov    esi,edx
  80be8b:	48 89 c7             	mov    rdi,rax
  80be8e:	e8 ad 00 00 00       	call   80bf40 <sprint_decimal>
            if(*pstr=='x'){
  80be93:	eb 4e                	jmp    80bee3 <sprintf+0x2e6>
            }else if(*pstr=='c'){
  80be95:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80be9c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80be9f:	3c 63                	cmp    al,0x63
  80bea1:	75 02                	jne    80bea5 <sprintf+0x2a8>
                char v=va_arg(vargs,char);
  80bea3:	0f 0b                	ud2    
                sprintchar(dist,v);
            }else{
                sprintchar(dist,*pstr);
  80bea5:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80beac:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80beaf:	0f be d0             	movsx  edx,al
  80beb2:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80beb9:	89 d6                	mov    esi,edx
  80bebb:	48 89 c7             	mov    rdi,rax
  80bebe:	e8 3e 00 00 00       	call   80bf01 <sprintchar>
            if(*pstr=='x'){
  80bec3:	eb 1e                	jmp    80bee3 <sprintf+0x2e6>
            }
        }else{
            sprintchar(dist,*pstr);
  80bec5:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80becc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80becf:	0f be d0             	movsx  edx,al
  80bed2:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80bed9:	89 d6                	mov    esi,edx
  80bedb:	48 89 c7             	mov    rdi,rax
  80bede:	e8 1e 00 00 00       	call   80bf01 <sprintchar>
    for(;*pstr!='\0';pstr++){
  80bee3:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80beea:	01 
  80beeb:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bef2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bef5:	84 c0                	test   al,al
  80bef7:	0f 85 0c fe ff ff    	jne    80bd09 <sprintf+0x10c>
        }
    }
    va_end(vargs);
}
  80befd:	90                   	nop
  80befe:	90                   	nop
  80beff:	c9                   	leave  
  80bf00:	c3                   	ret    

000000000080bf01 <sprintchar>:
void sprintchar(char *dist,char c)
{
  80bf01:	f3 0f 1e fa          	endbr64 
  80bf05:	55                   	push   rbp
  80bf06:	48 89 e5             	mov    rbp,rsp
  80bf09:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bf0d:	89 f0                	mov    eax,esi
  80bf0f:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    while(*dist!='\0')
  80bf12:	eb 05                	jmp    80bf19 <sprintchar+0x18>
        dist++;
  80bf14:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    while(*dist!='\0')
  80bf19:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bf1d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bf20:	84 c0                	test   al,al
  80bf22:	75 f0                	jne    80bf14 <sprintchar+0x13>
    *dist++=c;
  80bf24:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bf28:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80bf2c:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80bf30:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  80bf34:	88 10                	mov    BYTE PTR [rax],dl
    *dist='\0';
  80bf36:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bf3a:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80bf3d:	90                   	nop
  80bf3e:	5d                   	pop    rbp
  80bf3f:	c3                   	ret    

000000000080bf40 <sprint_decimal>:
void sprint_decimal(char *dist,int c)
{
  80bf40:	f3 0f 1e fa          	endbr64 
  80bf44:	55                   	push   rbp
  80bf45:	48 89 e5             	mov    rbp,rsp
  80bf48:	48 83 ec 30          	sub    rsp,0x30
  80bf4c:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80bf50:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
    unsigned char st[22];
    int p=0;
  80bf53:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<sizeof(unsigned long)*2){
  80bf5a:	eb 65                	jmp    80bfc1 <sprint_decimal+0x81>
        unsigned char a=c%10+'0';
  80bf5c:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  80bf5f:	48 63 c2             	movsxd rax,edx
  80bf62:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  80bf69:	48 c1 e8 20          	shr    rax,0x20
  80bf6d:	c1 f8 02             	sar    eax,0x2
  80bf70:	89 d6                	mov    esi,edx
  80bf72:	c1 fe 1f             	sar    esi,0x1f
  80bf75:	29 f0                	sub    eax,esi
  80bf77:	89 c1                	mov    ecx,eax
  80bf79:	89 c8                	mov    eax,ecx
  80bf7b:	c1 e0 02             	shl    eax,0x2
  80bf7e:	01 c8                	add    eax,ecx
  80bf80:	01 c0                	add    eax,eax
  80bf82:	89 d1                	mov    ecx,edx
  80bf84:	29 c1                	sub    ecx,eax
  80bf86:	89 c8                	mov    eax,ecx
  80bf88:	83 c0 30             	add    eax,0x30
  80bf8b:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        st[p++]=a;
  80bf8e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bf91:	8d 50 01             	lea    edx,[rax+0x1]
  80bf94:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80bf97:	48 98                	cdqe   
  80bf99:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80bf9d:	88 54 05 e0          	mov    BYTE PTR [rbp+rax*1-0x20],dl
        c/=10;
  80bfa1:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80bfa4:	48 63 d0             	movsxd rdx,eax
  80bfa7:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
  80bfae:	48 c1 ea 20          	shr    rdx,0x20
  80bfb2:	c1 fa 02             	sar    edx,0x2
  80bfb5:	c1 f8 1f             	sar    eax,0x1f
  80bfb8:	89 c1                	mov    ecx,eax
  80bfba:	89 d0                	mov    eax,edx
  80bfbc:	29 c8                	sub    eax,ecx
  80bfbe:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    while(p<sizeof(unsigned long)*2){
  80bfc1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bfc4:	83 f8 0f             	cmp    eax,0xf
  80bfc7:	76 93                	jbe    80bf5c <sprint_decimal+0x1c>
    }
    while(p>0)
  80bfc9:	eb 1f                	jmp    80bfea <sprint_decimal+0xaa>
    {
        sprintchar(dist,st[--p]);
  80bfcb:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80bfcf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bfd2:	48 98                	cdqe   
  80bfd4:	0f b6 44 05 e0       	movzx  eax,BYTE PTR [rbp+rax*1-0x20]
  80bfd9:	0f be d0             	movsx  edx,al
  80bfdc:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80bfe0:	89 d6                	mov    esi,edx
  80bfe2:	48 89 c7             	mov    rdi,rax
  80bfe5:	e8 17 ff ff ff       	call   80bf01 <sprintchar>
    while(p>0)
  80bfea:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80bfee:	7f db                	jg     80bfcb <sprint_decimal+0x8b>
    }
}
  80bff0:	90                   	nop
  80bff1:	90                   	nop
  80bff2:	c9                   	leave  
  80bff3:	c3                   	ret    

000000000080bff4 <sprint_hex>:
void sprint_hex(char *dist,unsigned int c)
{
  80bff4:	f3 0f 1e fa          	endbr64 
  80bff8:	55                   	push   rbp
  80bff9:	48 89 e5             	mov    rbp,rsp
  80bffc:	48 83 ec 20          	sub    rsp,0x20
  80c000:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80c004:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    unsigned char st[10];
    int p=0;
  80c007:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<10){
  80c00e:	eb 35                	jmp    80c045 <sprint_hex+0x51>
        unsigned char a=c%16;
  80c010:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80c013:	83 e0 0f             	and    eax,0xf
  80c016:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        if(a>9)a+='a'-10;
  80c019:	80 7d fb 09          	cmp    BYTE PTR [rbp-0x5],0x9
  80c01d:	76 06                	jbe    80c025 <sprint_hex+0x31>
  80c01f:	80 45 fb 57          	add    BYTE PTR [rbp-0x5],0x57
  80c023:	eb 04                	jmp    80c029 <sprint_hex+0x35>
        else a+='0';
  80c025:	80 45 fb 30          	add    BYTE PTR [rbp-0x5],0x30
        st[p++]=a;
  80c029:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c02c:	8d 50 01             	lea    edx,[rax+0x1]
  80c02f:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80c032:	48 98                	cdqe   
  80c034:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80c038:	88 54 05 f1          	mov    BYTE PTR [rbp+rax*1-0xf],dl
        c/=16;
  80c03c:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80c03f:	c1 e8 04             	shr    eax,0x4
  80c042:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    while(p<10){
  80c045:	83 7d fc 09          	cmp    DWORD PTR [rbp-0x4],0x9
  80c049:	7e c5                	jle    80c010 <sprint_hex+0x1c>
    }
    while(p>0)
  80c04b:	eb 1f                	jmp    80c06c <sprint_hex+0x78>
    {
        sprintchar(dist,st[--p]);
  80c04d:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80c051:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c054:	48 98                	cdqe   
  80c056:	0f b6 44 05 f1       	movzx  eax,BYTE PTR [rbp+rax*1-0xf]
  80c05b:	0f be d0             	movsx  edx,al
  80c05e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c062:	89 d6                	mov    esi,edx
  80c064:	48 89 c7             	mov    rdi,rax
  80c067:	e8 95 fe ff ff       	call   80bf01 <sprintchar>
    while(p>0)
  80c06c:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80c070:	7f db                	jg     80c04d <sprint_hex+0x59>
    }
}
  80c072:	90                   	nop
  80c073:	90                   	nop
  80c074:	c9                   	leave  
  80c075:	c3                   	ret    

000000000080c076 <sprintn>:
void sprintn(char *dist,char *str)
{
  80c076:	f3 0f 1e fa          	endbr64 
  80c07a:	55                   	push   rbp
  80c07b:	48 89 e5             	mov    rbp,rsp
  80c07e:	48 83 ec 10          	sub    rsp,0x10
  80c082:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80c086:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*str!='\0')
  80c08a:	eb 20                	jmp    80c0ac <sprintn+0x36>
    {
        sprintchar(dist,*str++);
  80c08c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c090:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80c094:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  80c098:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c09b:	0f be d0             	movsx  edx,al
  80c09e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c0a2:	89 d6                	mov    esi,edx
  80c0a4:	48 89 c7             	mov    rdi,rax
  80c0a7:	e8 55 fe ff ff       	call   80bf01 <sprintchar>
    while(*str!='\0')
  80c0ac:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c0b0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c0b3:	84 c0                	test   al,al
  80c0b5:	75 d5                	jne    80c08c <sprintn+0x16>
    }
  80c0b7:	90                   	nop
  80c0b8:	90                   	nop
  80c0b9:	c9                   	leave  
  80c0ba:	c3                   	ret    
  80c0bb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

000000000080c0c0 <create_zero>:
  80c0c0:	e8 c1 77 ff ff       	call   803886 <req_proc>
  80c0c5:	83 f8 ff             	cmp    eax,0xffffffff
  80c0c8:	74 0c                	je     80c0d6 <create_zero.retu>
  80c0ca:	e8 83 78 ff ff       	call   803952 <set_proc>
  80c0cf:	67 8b 04 24          	mov    eax,DWORD PTR [esp]
  80c0d3:	83 c4 40             	add    esp,0x40

000000000080c0d6 <create_zero.retu>:
  80c0d6:	c3                   	ret    

000000000080c0d7 <fill_desc>:
  80c0d7:	55                   	push   rbp
  80c0d8:	48 89 e5             	mov    rbp,rsp
  80c0db:	67 8b 45 14          	mov    eax,DWORD PTR [ebp+0x14]
  80c0df:	67 8b 5d 10          	mov    ebx,DWORD PTR [ebp+0x10]
  80c0e3:	67 8b 4d 0c          	mov    ecx,DWORD PTR [ebp+0xc]
  80c0e7:	67 8b 55 08          	mov    edx,DWORD PTR [ebp+0x8]
  80c0eb:	be 2a c2 80 00       	mov    esi,0x80c22a
  80c0f0:	c7 04 25 2a c2 80 00 	mov    DWORD PTR ds:0x80c22a,0x0
  80c0f7:	00 00 00 00 
  80c0fb:	c7 04 25 2e c2 80 00 	mov    DWORD PTR ds:0x80c22e,0x0
  80c102:	00 00 00 00 
  80c106:	66 67 89 0e          	mov    WORD PTR [esi],cx
  80c10a:	c1 e9 10             	shr    ecx,0x10
  80c10d:	66 67 89 56 02       	mov    WORD PTR [esi+0x2],dx
  80c112:	c1 ea 10             	shr    edx,0x10
  80c115:	67 88 56 04          	mov    BYTE PTR [esi+0x4],dl
  80c119:	66 c1 ea 08          	shr    dx,0x8
  80c11d:	67 88 56 07          	mov    BYTE PTR [esi+0x7],dl
  80c121:	66 67 89 5e 05       	mov    WORD PTR [esi+0x5],bx
  80c126:	67 8b 7e 04          	mov    edi,DWORD PTR [esi+0x4]
  80c12a:	c1 e1 08             	shl    ecx,0x8
  80c12d:	09 cf                	or     edi,ecx
  80c12f:	67 89 7e 04          	mov    DWORD PTR [esi+0x4],edi
  80c133:	8b 14 25 2a c2 80 00 	mov    edx,DWORD PTR ds:0x80c22a
  80c13a:	67 89 10             	mov    DWORD PTR [eax],edx
  80c13d:	8b 14 25 2e c2 80 00 	mov    edx,DWORD PTR ds:0x80c22e
  80c144:	67 89 50 04          	mov    DWORD PTR [eax+0x4],edx
  80c148:	c9                   	leave  
  80c149:	c3                   	ret    

000000000080c14a <switch_proc_asm>:
  80c14a:	66 67 8b 44 24 04    	mov    ax,WORD PTR [esp+0x4]
  80c150:	66 89 04 25 68 c1 80 	mov    WORD PTR ds:0x80c168,ax
  80c157:	00 
  80c158:	c7 04 25 64 c1 80 00 	mov    DWORD PTR ds:0x80c164,0x0
  80c15f:	00 00 00 00 

000000000080c163 <switch_proc_asm.ljmp>:
  80c163:	ea                   	(bad)  
  80c164:	00 00                	add    BYTE PTR [rax],al
  80c166:	00 00                	add    BYTE PTR [rax],al
  80c168:	00 00                	add    BYTE PTR [rax],al
  80c16a:	c3                   	ret    

000000000080c16b <switch_to_old>:
  80c16b:	67 8b 74 24 04       	mov    esi,DWORD PTR [esp+0x4]
  80c170:	67 8b 5e 20          	mov    ebx,DWORD PTR [esi+0x20]
  80c174:	bf dc c1 80 00       	mov    edi,0x80c1dc
  80c179:	67 89 5f 01          	mov    DWORD PTR [edi+0x1],ebx
  80c17d:	67 8b 46 38          	mov    eax,DWORD PTR [esi+0x38]
  80c181:	89 c1                	mov    ecx,eax
  80c183:	83 e9 04             	sub    ecx,0x4
  80c186:	67 89 19             	mov    DWORD PTR [ecx],ebx
  80c189:	50                   	push   rax
  80c18a:	89 f5                	mov    ebp,esi
  80c18c:	83 c5 28             	add    ebp,0x28
  80c18f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c193:	50                   	push   rax
  80c194:	83 c5 04             	add    ebp,0x4
  80c197:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c19b:	50                   	push   rax
  80c19c:	83 c5 04             	add    ebp,0x4
  80c19f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c1a3:	50                   	push   rax
  80c1a4:	83 c5 04             	add    ebp,0x4
  80c1a7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c1ab:	50                   	push   rax
  80c1ac:	83 c5 04             	add    ebp,0x4
  80c1af:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c1b3:	50                   	push   rax
  80c1b4:	83 c5 04             	add    ebp,0x4
  80c1b7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c1bb:	50                   	push   rax
  80c1bc:	83 c5 04             	add    ebp,0x4
  80c1bf:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c1c3:	50                   	push   rax
  80c1c4:	83 c5 04             	add    ebp,0x4
  80c1c7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c1cb:	50                   	push   rax
  80c1cc:	83 c5 04             	add    ebp,0x4
  80c1cf:	67 8b 46 1c          	mov    eax,DWORD PTR [esi+0x1c]
  80c1d3:	0f 22 d8             	mov    cr3,rax
  80c1d6:	67 8b 46 24          	mov    eax,DWORD PTR [esi+0x24]
  80c1da:	50                   	push   rax
  80c1db:	5c                   	pop    rsp

000000000080c1dc <switch_to_old.leap>:
  80c1dc:	ea                   	(bad)  
  80c1dd:	00 00                	add    BYTE PTR [rax],al
  80c1df:	00 00                	add    BYTE PTR [rax],al
  80c1e1:	08 00                	or     BYTE PTR [rax],al

000000000080c1e3 <save_context>:
  80c1e3:	67 8b 44 24 24       	mov    eax,DWORD PTR [esp+0x24]
  80c1e8:	83 c0 44             	add    eax,0x44
  80c1eb:	b9 08 00 00 00       	mov    ecx,0x8
  80c1f0:	89 e7                	mov    edi,esp

000000000080c1f2 <save_context.loops>:
  80c1f2:	67 8b 17             	mov    edx,DWORD PTR [edi]
  80c1f5:	67 89 10             	mov    DWORD PTR [eax],edx
  80c1f8:	83 c7 04             	add    edi,0x4
  80c1fb:	83 e8 04             	sub    eax,0x4
  80c1fe:	e2 f2                	loop   80c1f2 <save_context.loops>
  80c200:	5b                   	pop    rbx
  80c201:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  80c206:	67 89 58 24          	mov    DWORD PTR [eax+0x24],ebx
  80c20a:	67 48 8b 1c 24       	mov    rbx,QWORD PTR [esp]
  80c20f:	67 89 58 20          	mov    DWORD PTR [eax+0x20],ebx
  80c213:	c3                   	ret    

000000000080c214 <move_to_user_mode>:
  80c214:	66 b8 20 00          	mov    ax,0x20
  80c218:	8e d8                	mov    ds,eax
  80c21a:	8e c0                	mov    es,eax
  80c21c:	8e e8                	mov    gs,eax
  80c21e:	6a 20                	push   0x20
  80c220:	54                   	push   rsp
  80c221:	6a 18                	push   0x18
  80c223:	68 29 c2 80 00       	push   0x80c229
  80c228:	cf                   	iret   

000000000080c229 <move_to_user_mode.done>:
  80c229:	c3                   	ret    

000000000080c22a <desc>:
	...

000000000080c232 <ret_sys_call>:
  80c232:	58                   	pop    rax
  80c233:	8e d8                	mov    ds,eax
  80c235:	58                   	pop    rax
  80c236:	8e c0                	mov    es,eax
  80c238:	41 5f                	pop    r15
  80c23a:	41 5e                	pop    r14
  80c23c:	41 5d                	pop    r13
  80c23e:	41 5c                	pop    r12
  80c240:	41 5b                	pop    r11
  80c242:	41 5a                	pop    r10
  80c244:	41 59                	pop    r9
  80c246:	41 58                	pop    r8
  80c248:	5e                   	pop    rsi
  80c249:	5f                   	pop    rdi
  80c24a:	5a                   	pop    rdx
  80c24b:	59                   	pop    rcx
  80c24c:	5b                   	pop    rbx
  80c24d:	58                   	pop    rax

000000000080c24e <tmp>:
  80c24e:	48 0f 07             	sysretq 

000000000080c251 <ret_normal_proc>:
  80c251:	58                   	pop    rax
  80c252:	8e d8                	mov    ds,eax
  80c254:	58                   	pop    rax
  80c255:	8e c0                	mov    es,eax
  80c257:	41 5f                	pop    r15
  80c259:	41 5e                	pop    r14
  80c25b:	41 5d                	pop    r13
  80c25d:	41 5c                	pop    r12
  80c25f:	41 5b                	pop    r11
  80c261:	41 5a                	pop    r10
  80c263:	41 59                	pop    r9
  80c265:	41 58                	pop    r8
  80c267:	5e                   	pop    rsi
  80c268:	5f                   	pop    rdi
  80c269:	5a                   	pop    rdx
  80c26a:	59                   	pop    rcx
  80c26b:	5b                   	pop    rbx
  80c26c:	58                   	pop    rax
  80c26d:	c3                   	ret    
