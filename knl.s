
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
  800194:	b8 bf 13 80 00       	mov    eax,0x8013bf
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
  800217:	b8 9c 7c 80 00       	mov    eax,0x807c9c
  80021c:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800221:	ba 08 00 00 00       	mov    edx,0x8
  800226:	48 89 c6             	mov    rsi,rax
  800229:	bf 21 00 00 00       	mov    edi,0x21
  80022e:	e8 02 01 00 00       	call   800335 <set_gate>
	set_gate(0x20,(addr_t)clock,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800233:	b8 d0 5c 80 00       	mov    eax,0x805cd0
  800238:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80023d:	ba 08 00 00 00       	mov    edx,0x8
  800242:	48 89 c6             	mov    rsi,rax
  800245:	bf 20 00 00 00       	mov    edi,0x20
  80024a:	e8 e6 00 00 00       	call   800335 <set_gate>
	set_gate(0x2e,(addr_t)disk_int_handler,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80024f:	b8 c0 8b 80 00       	mov    eax,0x808bc0
  800254:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800259:	ba 08 00 00 00       	mov    edx,0x8
  80025e:	48 89 c6             	mov    rsi,rax
  800261:	bf 2e 00 00 00       	mov    edi,0x2e
  800266:	e8 ca 00 00 00       	call   800335 <set_gate>
    set_gate(0x80,(addr_t)_syscall,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);//
  80026b:	b8 d0 67 80 00       	mov    eax,0x8067d0
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
  800291:	e8 aa 57 00 00       	call   805a40 <outb>
	outb(0xA0,0x11);
  800296:	be 11 00 00 00       	mov    esi,0x11
  80029b:	bf a0 00 00 00       	mov    edi,0xa0
  8002a0:	e8 9b 57 00 00       	call   805a40 <outb>
	//ICW2
	outb(0x21,0x20);//former 0x20,0x20
  8002a5:	be 20 00 00 00       	mov    esi,0x20
  8002aa:	bf 21 00 00 00       	mov    edi,0x21
  8002af:	e8 8c 57 00 00       	call   805a40 <outb>
	outb(0xA1,0x28);
  8002b4:	be 28 00 00 00       	mov    esi,0x28
  8002b9:	bf a1 00 00 00       	mov    edi,0xa1
  8002be:	e8 7d 57 00 00       	call   805a40 <outb>
	//ICW3
	outb(0x21,0x04);
  8002c3:	be 04 00 00 00       	mov    esi,0x4
  8002c8:	bf 21 00 00 00       	mov    edi,0x21
  8002cd:	e8 6e 57 00 00       	call   805a40 <outb>
	outb(0xA1,0x02);
  8002d2:	be 02 00 00 00       	mov    esi,0x2
  8002d7:	bf a1 00 00 00       	mov    edi,0xa1
  8002dc:	e8 5f 57 00 00       	call   805a40 <outb>
	//ICW4
	outb(0x21,0x01);
  8002e1:	be 01 00 00 00       	mov    esi,0x1
  8002e6:	bf 21 00 00 00       	mov    edi,0x21
  8002eb:	e8 50 57 00 00       	call   805a40 <outb>
	outb(0xA1,0x01);
  8002f0:	be 01 00 00 00       	mov    esi,0x1
  8002f5:	bf a1 00 00 00       	mov    edi,0xa1
  8002fa:	e8 41 57 00 00       	call   805a40 <outb>

    turn_on_int();
  8002ff:	b8 00 00 00 00       	mov    eax,0x0
  800304:	e8 71 57 00 00       	call   805a7a <turn_on_int>


    //设置IA32_LSTAR,为syscall做设置
    wrmsr(0xc0000082, _syscall);
  800309:	b8 d0 67 80 00       	mov    eax,0x8067d0
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
  800350:	48 8b 15 09 c1 00 00 	mov    rdx,QWORD PTR [rip+0xc109]        # 80c460 <idt>
  800357:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80035b:	48 c1 e0 04          	shl    rax,0x4
  80035f:	48 01 d0             	add    rax,rdx
  800362:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800366:	66 89 10             	mov    WORD PTR [rax],dx
    idt[index].offset_mid=(offset>>16)&0xffff;
  800369:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80036d:	48 c1 e8 10          	shr    rax,0x10
  800371:	48 89 c2             	mov    rdx,rax
  800374:	48 8b 0d e5 c0 00 00 	mov    rcx,QWORD PTR [rip+0xc0e5]        # 80c460 <idt>
  80037b:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80037f:	48 c1 e0 04          	shl    rax,0x4
  800383:	48 01 c8             	add    rax,rcx
  800386:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
    idt[index].offset_high=(offset>>32)&0x0000ffff;
  80038a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80038e:	48 c1 e8 20          	shr    rax,0x20
  800392:	89 c1                	mov    ecx,eax
  800394:	48 8b 15 c5 c0 00 00 	mov    rdx,QWORD PTR [rip+0xc0c5]        # 80c460 <idt>
  80039b:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80039f:	48 c1 e0 04          	shl    rax,0x4
  8003a3:	48 01 c2             	add    rdx,rax
  8003a6:	0f b7 c1             	movzx  eax,cx
  8003a9:	89 42 08             	mov    DWORD PTR [rdx+0x8],eax
    idt[index].attr=attr|1;//1是ist索引
  8003ac:	48 8b 15 ad c0 00 00 	mov    rdx,QWORD PTR [rip+0xc0ad]        # 80c460 <idt>
  8003b3:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003b7:	48 c1 e0 04          	shl    rax,0x4
  8003bb:	48 01 d0             	add    rax,rdx
  8003be:	0f b7 55 ec          	movzx  edx,WORD PTR [rbp-0x14]
  8003c2:	83 ca 01             	or     edx,0x1
  8003c5:	66 89 50 04          	mov    WORD PTR [rax+0x4],dx
    idt[index].selector=selector;
  8003c9:	48 8b 15 90 c0 00 00 	mov    rdx,QWORD PTR [rip+0xc090]        # 80c460 <idt>
  8003d0:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003d4:	48 c1 e0 04          	shl    rax,0x4
  8003d8:	48 01 c2             	add    rdx,rax
  8003db:	0f b7 45 f8          	movzx  eax,WORD PTR [rbp-0x8]
  8003df:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    idt[index].rsvd=0;
  8003e3:	48 8b 15 76 c0 00 00 	mov    rdx,QWORD PTR [rip+0xc076]        # 80c460 <idt>
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
  80040d:	e8 5c 56 00 00       	call   805a6e <eoi>
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
  800427:	e8 42 56 00 00       	call   805a6e <eoi>
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
  800441:	e8 28 56 00 00       	call   805a6e <eoi>
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
  80045b:	e8 0e 56 00 00       	call   805a6e <eoi>
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
  800475:	e8 f4 55 00 00       	call   805a6e <eoi>
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
  80048f:	e8 da 55 00 00       	call   805a6e <eoi>
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
  8004a8:	e8 c1 55 00 00       	call   805a6e <eoi>
    report_back_trace_of_err();
  8004ad:	b8 00 00 00 00       	mov    eax,0x0
  8004b2:	e8 e2 55 00 00       	call   805a99 <report_back_trace_of_err>
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
  8004cd:	e8 9c 55 00 00       	call   805a6e <eoi>
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
  8004e7:	e8 82 55 00 00       	call   805a6e <eoi>
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
  800500:	e8 69 55 00 00       	call   805a6e <eoi>
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
  800519:	e8 50 55 00 00       	call   805a6e <eoi>
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
  800533:	e8 36 55 00 00       	call   805a6e <eoi>
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
  80054d:	e8 1c 55 00 00       	call   805a6e <eoi>
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
  800571:	e8 f8 54 00 00       	call   805a6e <eoi>
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
  80058e:	e8 db 54 00 00       	call   805a6e <eoi>
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
  8005d1:	48 05 a0 3b 81 00    	add    rax,0x813ba0
  8005d7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8005da:	3e ff e0             	notrack jmp rax
    {
        case 0:return reg_device(a);
  8005dd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8005e0:	48 98                	cdqe   
  8005e2:	48 89 c7             	mov    rdi,rax
  8005e5:	e8 f3 1f 00 00       	call   8025dd <reg_device>
  8005ea:	e9 33 02 00 00       	jmp    800822 <syscall+0x288>
        case 1:return dispose_device(a);
  8005ef:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8005f2:	89 c7                	mov    edi,eax
  8005f4:	e8 43 2a 00 00       	call   80303c <dispose_device>
  8005f9:	e9 24 02 00 00       	jmp    800822 <syscall+0x288>
        case 2:return reg_driver(a);
  8005fe:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800601:	48 98                	cdqe   
  800603:	48 89 c7             	mov    rdi,rax
  800606:	e8 ba 22 00 00       	call   8028c5 <reg_driver>
  80060b:	e9 12 02 00 00       	jmp    800822 <syscall+0x288>
        case 3:return dispose_driver(a);
  800610:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800613:	48 98                	cdqe   
  800615:	48 89 c7             	mov    rdi,rax
  800618:	e8 bd 2a 00 00       	call   8030da <dispose_driver>
  80061d:	e9 00 02 00 00       	jmp    800822 <syscall+0x288>
        case 4:return call_drv_func(a,b,c);
  800622:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800625:	48 98                	cdqe   
  800627:	48 89 c2             	mov    rdx,rax
  80062a:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  80062d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800630:	89 ce                	mov    esi,ecx
  800632:	89 c7                	mov    edi,eax
  800634:	e8 ac 27 00 00       	call   802de5 <call_drv_func>
  800639:	e9 e4 01 00 00       	jmp    800822 <syscall+0x288>
        case 5:return req_page_at(a,b);
  80063e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800641:	48 98                	cdqe   
  800643:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  800646:	89 d6                	mov    esi,edx
  800648:	48 89 c7             	mov    rdi,rax
  80064b:	e8 31 13 00 00       	call   801981 <req_page_at>
  800650:	e9 cd 01 00 00       	jmp    800822 <syscall+0x288>
        case 6:return free_page(a);
  800655:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800658:	48 98                	cdqe   
  80065a:	48 89 c7             	mov    rdi,rax
  80065d:	e8 eb 10 00 00       	call   80174d <free_page>
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
  800682:	e8 12 3e 00 00       	call   804499 <reg_proc>
  800687:	e9 96 01 00 00       	jmp    800822 <syscall+0x288>
        case 8:del_proc(a);
  80068c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80068f:	89 c7                	mov    edi,eax
  800691:	e8 ce 3b 00 00       	call   804264 <del_proc>
        case 10:chk_vm(a,b);
  800696:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  800699:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80069c:	89 d6                	mov    esi,edx
  80069e:	89 c7                	mov    edi,eax
  8006a0:	e8 b5 13 00 00       	call   801a5a <chk_vm>
        case 11:return sys_open(a,b);
  8006a5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006a8:	48 98                	cdqe   
  8006aa:	48 89 c2             	mov    rdx,rax
  8006ad:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8006b0:	89 c6                	mov    esi,eax
  8006b2:	48 89 d7             	mov    rdi,rdx
  8006b5:	e8 f8 6b 00 00       	call   8072b2 <sys_open>
  8006ba:	e9 63 01 00 00       	jmp    800822 <syscall+0x288>
        case 12:return sys_close(a);
  8006bf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006c2:	89 c7                	mov    edi,eax
  8006c4:	e8 00 6f 00 00       	call   8075c9 <sys_close>
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
  8006e4:	e8 98 6f 00 00       	call   807681 <sys_read>
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
  800704:	e8 28 70 00 00       	call   807731 <sys_write>
  800709:	e9 14 01 00 00       	jmp    800822 <syscall+0x288>
        case 15:return sys_lseek(a,b,c);
  80070e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  800711:	48 63 c8             	movsxd rcx,eax
  800714:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  800717:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80071a:	48 89 ce             	mov    rsi,rcx
  80071d:	89 c7                	mov    edi,eax
  80071f:	e8 bd 70 00 00       	call   8077e1 <sys_lseek>
  800724:	e9 f9 00 00 00       	jmp    800822 <syscall+0x288>
        case 16:return sys_tell(a);
  800729:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80072c:	89 c7                	mov    edi,eax
  80072e:	e8 0b 17 00 00       	call   801e3e <sys_tell>
  800733:	e9 ea 00 00 00       	jmp    800822 <syscall+0x288>
        case 17:return reg_vol(a,b,c);
  800738:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  80073b:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  80073e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800741:	89 ce                	mov    esi,ecx
  800743:	89 c7                	mov    edi,eax
  800745:	b8 00 00 00 00       	mov    eax,0x0
  80074a:	e8 e4 15 00 00       	call   801d33 <reg_vol>
  80074f:	e9 ce 00 00 00       	jmp    800822 <syscall+0x288>
        case 18:return free_vol(a);
  800754:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800757:	89 c7                	mov    edi,eax
  800759:	b8 00 00 00 00       	mov    eax,0x0
  80075e:	e8 b4 15 00 00       	call   801d17 <free_vol>
  800763:	e9 ba 00 00 00       	jmp    800822 <syscall+0x288>
        case 19:return execute(a, NULL);
  800768:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80076b:	48 98                	cdqe   
  80076d:	be 00 00 00 00       	mov    esi,0x0
  800772:	48 89 c7             	mov    rdi,rax
  800775:	e8 aa 55 00 00       	call   805d24 <execute>
  80077a:	e9 a3 00 00 00       	jmp    800822 <syscall+0x288>
        case SYSCALL_EXIT:return sys_exit(a);
  80077f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800782:	89 c7                	mov    edi,eax
  800784:	e8 e8 3c 00 00       	call   804471 <sys_exit>
  800789:	e9 94 00 00 00       	jmp    800822 <syscall+0x288>
        case SYSCALL_CALL:return exec_call(a);
  80078e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800791:	48 98                	cdqe   
  800793:	48 89 c7             	mov    rdi,rax
  800796:	e8 80 57 00 00       	call   805f1b <exec_call>
  80079b:	e9 82 00 00 00       	jmp    800822 <syscall+0x288>
        case SYSCALL_MKFIFO:return sys_mkfifo(a);
  8007a0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007a3:	89 c7                	mov    edi,eax
  8007a5:	e8 0e 14 00 00       	call   801bb8 <sys_mkfifo>
  8007aa:	eb 76                	jmp    800822 <syscall+0x288>
        case SYSCALL_MALLOC:return sys_malloc(a);
  8007ac:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007af:	89 c7                	mov    edi,eax
  8007b1:	e8 e8 3e 00 00       	call   80469e <sys_malloc>
  8007b6:	eb 6a                	jmp    800822 <syscall+0x288>
        case SYSCALL_FREE:return sys_free(a);
  8007b8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007bb:	89 c7                	mov    edi,eax
  8007bd:	e8 83 40 00 00       	call   804845 <sys_free>
  8007c2:	eb 5e                	jmp    800822 <syscall+0x288>
        case SYSCALL_KB_READC:return sys_getkbc();
  8007c4:	b8 00 00 00 00       	mov    eax,0x0
  8007c9:	e8 e2 75 00 00       	call   807db0 <sys_getkbc>
  8007ce:	0f be c0             	movsx  eax,al
  8007d1:	eb 4f                	jmp    800822 <syscall+0x288>
        case SYSCALL_FIND_DEV:return sys_find_dev(a);
  8007d3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007d6:	48 98                	cdqe   
  8007d8:	48 89 c7             	mov    rdi,rax
  8007db:	e8 35 22 00 00       	call   802a15 <sys_find_dev>
  8007e0:	eb 40                	jmp    800822 <syscall+0x288>
        case SYSCALL_FORK:return sys_fork();
  8007e2:	e8 72 43 00 00       	call   804b59 <sys_fork>
  8007e7:	eb 39                	jmp    800822 <syscall+0x288>
        case SYSCALL_EXECVE:return sys_execve(a,b);
  8007e9:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8007ec:	48 98                	cdqe   
  8007ee:	48 89 c2             	mov    rdx,rax
  8007f1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007f4:	48 98                	cdqe   
  8007f6:	48 89 d6             	mov    rsi,rdx
  8007f9:	48 89 c7             	mov    rdi,rax
  8007fc:	e8 25 56 00 00       	call   805e26 <sys_execve>
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
  80081b:	e8 87 22 00 00       	call   802aa7 <sys_operate_dev>
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
  800876:	e8 54 03 00 00       	call   800bcf <init_logging>
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
  8008a7:	48 8b 04 c5 08 3f 81 	mov    rax,QWORD PTR [rax*8+0x813f08]
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
  8008bb:	e8 67 09 00 00       	call   801227 <set_high_mem_base>
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
  8008f1:	e8 48 09 00 00       	call   80123e <set_mem_area>
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
  80094b:	e8 8d 60 00 00       	call   8069dd <set_framebuffer>
  800950:	48 83 c4 30          	add    rsp,0x30

            init_framebuffer();
  800954:	b8 00 00 00 00       	mov    eax,0x0
  800959:	e8 ea 5e 00 00       	call   806848 <init_framebuffer>
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
  800b22:	e8 e0 5d 00 00       	call   806907 <init_font>
    //初始化区域
    //fill_rect(0,0,100,100,255);
    print("gamessis os loaded.\nkernel:>");
  800b27:	bf c8 3e 81 00       	mov    edi,0x813ec8
  800b2c:	e8 6f 62 00 00       	call   806da0 <print>
    init_int();
  800b31:	b8 00 00 00 00       	mov    eax,0x0
  800b36:	e8 c5 f4 ff ff       	call   800000 <init_int>
    print("int loaded.\n");
  800b3b:	bf e5 3e 81 00       	mov    edi,0x813ee5
  800b40:	e8 5b 62 00 00       	call   806da0 <print>
//    set_tss(0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000);
    init_memory();
  800b45:	b8 00 00 00 00       	mov    eax,0x0
  800b4a:	e8 c5 09 00 00       	call   801514 <init_memory>
    init_com(PORT_COM1);
  800b4f:	bf f8 03 00 00       	mov    edi,0x3f8
  800b54:	e8 bb ad 00 00       	call   80b914 <init_com>
    com_puts("gamessis os loaded.",PORT_COM1);
  800b59:	be f8 03 00 00       	mov    esi,0x3f8
  800b5e:	bf f2 3e 81 00       	mov    edi,0x813ef2
  800b63:	e8 f8 ae 00 00       	call   80ba60 <com_puts>
	init_paging();
  800b68:	b8 00 00 00 00       	mov    eax,0x0
  800b6d:	e8 aa 06 00 00       	call   80121c <init_paging>
 	init_gdt();
  800b72:	b8 00 00 00 00       	mov    eax,0x0
  800b77:	e8 41 4f 00 00       	call   805abd <init_gdt>
    init_drvdev_man();
  800b7c:	b8 00 00 00 00       	mov    eax,0x0
  800b81:	e8 3d 1a 00 00       	call   8025c3 <init_drvdev_man>
    init_proc();
  800b86:	b8 00 00 00 00       	mov    eax,0x0
  800b8b:	e8 1e 29 00 00       	call   8034ae <init_proc>
    //自带驱动
    //init_tty();
    init_kb();
  800b90:	b8 00 00 00 00       	mov    eax,0x0
  800b95:	e8 e3 70 00 00       	call   807c7d <init_kb>
//    init_disk();

    sti();
  800b9a:	fb                   	sti    
    DISK1_FAT32_FS_init();
  800b9b:	b8 00 00 00 00       	mov    eax,0x0
  800ba0:	e8 d5 a3 00 00       	call   80af7a <DISK1_FAT32_FS_init>
    manage_proc_lock=0;
  800ba5:	c7 05 b9 b8 00 00 00 	mov    DWORD PTR [rip+0xb8b9],0x0        # 80c468 <manage_proc_lock>
  800bac:	00 00 00 
//    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
//    mount_fs("fat16",p->par,vmalloc());

    while (1)
    {
        char c=sys_getkbc();
  800baf:	b8 00 00 00 00       	mov    eax,0x0
  800bb4:	e8 f7 71 00 00       	call   807db0 <sys_getkbc>
  800bb9:	88 45 da             	mov    BYTE PTR [rbp-0x26],al
        if(c!=-1)
  800bbc:	80 7d da ff          	cmp    BYTE PTR [rbp-0x26],0xff
  800bc0:	74 ed                	je     800baf <main+0x361>
            putchar(c);
  800bc2:	0f be 45 da          	movsx  eax,BYTE PTR [rbp-0x26]
  800bc6:	89 c7                	mov    edi,eax
  800bc8:	e8 41 01 00 00       	call   800d0e <putchar>
    {
  800bcd:	eb e0                	jmp    800baf <main+0x361>

0000000000800bcf <init_logging>:
static unsigned char* video;
static int xpos,ypos;
/* 将整数 D 转换为字符串并保存在 BUF 中。如果 BASE 为 'd'，则 D 为十进制，如果 BASE 为 'x'，则 D 为十六进制。 */

int init_logging()
{
  800bcf:	f3 0f 1e fa          	endbr64 
  800bd3:	55                   	push   rbp
  800bd4:	48 89 e5             	mov    rbp,rsp
    video=0xb8000;
  800bd7:	48 c7 05 1e f4 bf ff 	mov    QWORD PTR [rip+0xffffffffffbff41e],0xb8000        # 400000 <video>
  800bde:	00 80 0b 00 
    xpos=0;
  800be2:	c7 05 1c f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff41c],0x0        # 400008 <xpos>
  800be9:	00 00 00 
    ypos=0;
  800bec:	c7 05 16 f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff416],0x0        # 40000c <ypos>
  800bf3:	00 00 00 
}
  800bf6:	90                   	nop
  800bf7:	5d                   	pop    rbp
  800bf8:	c3                   	ret    

0000000000800bf9 <itoa>:

static void itoa (char *buf, int base, int d)
{
  800bf9:	f3 0f 1e fa          	endbr64 
  800bfd:	55                   	push   rbp
  800bfe:	48 89 e5             	mov    rbp,rsp
  800c01:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  800c05:	89 75 c4             	mov    DWORD PTR [rbp-0x3c],esi
  800c08:	89 55 c0             	mov    DWORD PTR [rbp-0x40],edx
    char *p = buf;
  800c0b:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800c0f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char *p1, *p2;
    unsigned long ud = d;
  800c13:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800c16:	48 98                	cdqe   
  800c18:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    int divisor = 10;
  800c1c:	c7 45 dc 0a 00 00 00 	mov    DWORD PTR [rbp-0x24],0xa
 
    /* 如果指定了 %d 并且 D 是负数，在开始添上负号。 */
    if (base == 'd' && d < 0)
  800c23:	83 7d c4 64          	cmp    DWORD PTR [rbp-0x3c],0x64
  800c27:	75 27                	jne    800c50 <itoa+0x57>
  800c29:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
  800c2d:	79 21                	jns    800c50 <itoa+0x57>
    {
        *p++ = '-';
  800c2f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c33:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800c37:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800c3b:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
        buf++;
  800c3e:	48 83 45 c8 01       	add    QWORD PTR [rbp-0x38],0x1
        ud = -d;
  800c43:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800c46:	f7 d8                	neg    eax
  800c48:	48 98                	cdqe   
  800c4a:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800c4e:	eb 0d                	jmp    800c5d <itoa+0x64>
    }
    else if (base == 'x')
  800c50:	83 7d c4 78          	cmp    DWORD PTR [rbp-0x3c],0x78
  800c54:	75 07                	jne    800c5d <itoa+0x64>
        divisor = 16;
  800c56:	c7 45 dc 10 00 00 00 	mov    DWORD PTR [rbp-0x24],0x10
 
    /* 用 DIVISOR 去除 UD 直到 UD == 0。 */
    do
    {
        int remainder = ud % divisor;
  800c5d:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800c60:	48 63 c8             	movsxd rcx,eax
  800c63:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800c67:	ba 00 00 00 00       	mov    edx,0x0
  800c6c:	48 f7 f1             	div    rcx
  800c6f:	48 89 d0             	mov    rax,rdx
  800c72:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
 
        *p++ = (remainder < 10) ? remainder + '0' : remainder + 'a' - 10;
  800c75:	83 7d d8 09          	cmp    DWORD PTR [rbp-0x28],0x9
  800c79:	7f 0a                	jg     800c85 <itoa+0x8c>
  800c7b:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800c7e:	83 c0 30             	add    eax,0x30
  800c81:	89 c1                	mov    ecx,eax
  800c83:	eb 08                	jmp    800c8d <itoa+0x94>
  800c85:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800c88:	83 c0 57             	add    eax,0x57
  800c8b:	89 c1                	mov    ecx,eax
  800c8d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c91:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800c95:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800c99:	88 08                	mov    BYTE PTR [rax],cl
    }
    while (ud /= divisor);
  800c9b:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800c9e:	48 63 f0             	movsxd rsi,eax
  800ca1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800ca5:	ba 00 00 00 00       	mov    edx,0x0
  800caa:	48 f7 f6             	div    rsi
  800cad:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800cb1:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  800cb6:	75 a5                	jne    800c5d <itoa+0x64>
 
    /* 在字符串尾添上终结符。 */
    *p = 0;
  800cb8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800cbc:	c6 00 00             	mov    BYTE PTR [rax],0x0
 
    /* 反转 BUF。 */
    p1 = buf;
  800cbf:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800cc3:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    p2 = p - 1;
  800cc7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800ccb:	48 83 e8 01          	sub    rax,0x1
  800ccf:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    while (p1 < p2)
  800cd3:	eb 2b                	jmp    800d00 <itoa+0x107>
    {
        char tmp = *p1;
  800cd5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800cd9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800cdc:	88 45 d7             	mov    BYTE PTR [rbp-0x29],al
        *p1 = *p2;
  800cdf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800ce3:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  800ce6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800cea:	88 10                	mov    BYTE PTR [rax],dl
        *p2 = tmp;
  800cec:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800cf0:	0f b6 55 d7          	movzx  edx,BYTE PTR [rbp-0x29]
  800cf4:	88 10                	mov    BYTE PTR [rax],dl
        p1++;
  800cf6:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        p2--;
  800cfb:	48 83 6d e8 01       	sub    QWORD PTR [rbp-0x18],0x1
    while (p1 < p2)
  800d00:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800d04:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
  800d08:	72 cb                	jb     800cd5 <itoa+0xdc>
    }
}
  800d0a:	90                   	nop
  800d0b:	90                   	nop
  800d0c:	5d                   	pop    rbp
  800d0d:	c3                   	ret    

0000000000800d0e <putchar>:
 
/* 在屏幕上输出字符 C 。 */
void putchar (char c)
{
  800d0e:	f3 0f 1e fa          	endbr64 
  800d12:	55                   	push   rbp
  800d13:	48 89 e5             	mov    rbp,rsp
  800d16:	48 83 ec 20          	sub    rsp,0x20
  800d1a:	89 f8                	mov    eax,edi
  800d1c:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    char s[2]={c,'\0'};
  800d1f:	0f b6 45 ec          	movzx  eax,BYTE PTR [rbp-0x14]
  800d23:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
  800d26:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
    print(s);
  800d2a:	48 8d 45 fe          	lea    rax,[rbp-0x2]
  800d2e:	48 89 c7             	mov    rdi,rax
  800d31:	e8 6a 60 00 00       	call   806da0 <print>
    *(video + (xpos + ypos * COLUMNS) * 2 + 1) = ATTRIBUTE;
 
    xpos++;
    if (xpos >= COLUMNS)
        goto newline;
}
  800d36:	c9                   	leave  
  800d37:	c3                   	ret    

0000000000800d38 <printf>:
 
/* 格式化字符串并在屏幕上输出，就像 libc 函数 printf 一样。 */
void printf (const char *format, ...)
{
  800d38:	f3 0f 1e fa          	endbr64 
  800d3c:	55                   	push   rbp
  800d3d:	48 89 e5             	mov    rbp,rsp
  800d40:	48 81 ec f0 00 00 00 	sub    rsp,0xf0
  800d47:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
  800d4e:	48 89 b5 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rsi
  800d55:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  800d5c:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  800d63:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  800d6a:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  800d71:	84 c0                	test   al,al
  800d73:	74 20                	je     800d95 <printf+0x5d>
  800d75:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  800d79:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  800d7d:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  800d81:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  800d85:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  800d89:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  800d8d:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  800d91:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7
    char **arg = (char **) &format;
  800d95:	48 8d 85 18 ff ff ff 	lea    rax,[rbp-0xe8]
  800d9c:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char c;
    char buf[20];
 
    arg++;
  800da3:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x8
  800daa:	08 
 
    while ((c = *format++) != 0)
  800dab:	e9 29 01 00 00       	jmp    800ed9 <printf+0x1a1>
    {
        if (c != '%')
  800db0:	80 bd 3f ff ff ff 25 	cmp    BYTE PTR [rbp-0xc1],0x25
  800db7:	74 13                	je     800dcc <printf+0x94>
            putchar (c);
  800db9:	0f be 85 3f ff ff ff 	movsx  eax,BYTE PTR [rbp-0xc1]
  800dc0:	89 c7                	mov    edi,eax
  800dc2:	e8 47 ff ff ff       	call   800d0e <putchar>
  800dc7:	e9 0d 01 00 00       	jmp    800ed9 <printf+0x1a1>
        else
        {
            char *p;
 
            c = *format++;
  800dcc:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800dd3:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800dd7:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800dde:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800de1:	88 85 3f ff ff ff    	mov    BYTE PTR [rbp-0xc1],al
            switch (c)
  800de7:	0f be 85 3f ff ff ff 	movsx  eax,BYTE PTR [rbp-0xc1]
  800dee:	83 f8 78             	cmp    eax,0x78
  800df1:	74 26                	je     800e19 <printf+0xe1>
  800df3:	83 f8 78             	cmp    eax,0x78
  800df6:	0f 8f be 00 00 00    	jg     800eba <printf+0x182>
  800dfc:	83 f8 75             	cmp    eax,0x75
  800dff:	74 18                	je     800e19 <printf+0xe1>
  800e01:	83 f8 75             	cmp    eax,0x75
  800e04:	0f 8f b0 00 00 00    	jg     800eba <printf+0x182>
  800e0a:	83 f8 64             	cmp    eax,0x64
  800e0d:	74 0a                	je     800e19 <printf+0xe1>
  800e0f:	83 f8 73             	cmp    eax,0x73
  800e12:	74 41                	je     800e55 <printf+0x11d>
  800e14:	e9 a1 00 00 00       	jmp    800eba <printf+0x182>
            {
            case 'd':
            case 'u':
            case 'x':
                itoa (buf, c, *((int *) arg++));
  800e19:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e20:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800e24:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800e2b:	8b 10                	mov    edx,DWORD PTR [rax]
  800e2d:	0f be 8d 3f ff ff ff 	movsx  ecx,BYTE PTR [rbp-0xc1]
  800e34:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800e3b:	89 ce                	mov    esi,ecx
  800e3d:	48 89 c7             	mov    rdi,rax
  800e40:	e8 b4 fd ff ff       	call   800bf9 <itoa>
                p = buf;
  800e45:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800e4c:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                goto string;
  800e53:	eb 34                	jmp    800e89 <printf+0x151>
                break;
 
            case 's':
                p = *arg++;
  800e55:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e5c:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800e60:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800e67:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800e6a:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                if (! p)
  800e71:	48 83 bd 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],0x0
  800e78:	00 
  800e79:	75 0d                	jne    800e88 <printf+0x150>
                    p = "(null)";
  800e7b:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x813f50
  800e82:	50 3f 81 00 
  800e86:	eb 22                	jmp    800eaa <printf+0x172>
 
string:
  800e88:	90                   	nop
                while (*p)
  800e89:	eb 1f                	jmp    800eaa <printf+0x172>
                    putchar (*p++);
  800e8b:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800e92:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800e96:	48 89 95 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rdx
  800e9d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800ea0:	0f be c0             	movsx  eax,al
  800ea3:	89 c7                	mov    edi,eax
  800ea5:	e8 64 fe ff ff       	call   800d0e <putchar>
                while (*p)
  800eaa:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800eb1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800eb4:	84 c0                	test   al,al
  800eb6:	75 d3                	jne    800e8b <printf+0x153>
                break;
  800eb8:	eb 1f                	jmp    800ed9 <printf+0x1a1>
 
            default:
                putchar (*((int *) arg++));
  800eba:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800ec1:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800ec5:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800ecc:	8b 00                	mov    eax,DWORD PTR [rax]
  800ece:	0f be c0             	movsx  eax,al
  800ed1:	89 c7                	mov    edi,eax
  800ed3:	e8 36 fe ff ff       	call   800d0e <putchar>
                break;
  800ed8:	90                   	nop
    while ((c = *format++) != 0)
  800ed9:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800ee0:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800ee4:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800eeb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800eee:	88 85 3f ff ff ff    	mov    BYTE PTR [rbp-0xc1],al
  800ef4:	80 bd 3f ff ff ff 00 	cmp    BYTE PTR [rbp-0xc1],0x0
  800efb:	0f 85 af fe ff ff    	jne    800db0 <printf+0x78>
            }
        }
    }
}
  800f01:	90                   	nop
  800f02:	90                   	nop
  800f03:	c9                   	leave  
  800f04:	c3                   	ret    

0000000000800f05 <mmap>:
//以kb为单位
int high_mem_base=1024;
int mmap_t_i=0;

stat_t mmap(addr_t pa,addr_t la,u32 attr)
{
  800f05:	f3 0f 1e fa          	endbr64 
  800f09:	55                   	push   rbp
  800f0a:	48 89 e5             	mov    rbp,rsp
  800f0d:	48 83 ec 40          	sub    rsp,0x40
  800f11:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  800f15:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  800f19:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    page_item *pdptp= (page_item *) (pml4[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
  800f1c:	48 8b 15 5d b5 00 00 	mov    rdx,QWORD PTR [rip+0xb55d]        # 80c480 <pml4>
  800f23:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800f27:	48 c1 e8 27          	shr    rax,0x27
  800f2b:	48 c1 e0 03          	shl    rax,0x3
  800f2f:	48 01 d0             	add    rax,rdx
  800f32:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f35:	b0 00                	mov    al,0x0
  800f37:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
  800f3b:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  800f42:	00 00 00 
  800f45:	48 23 45 d0          	and    rax,QWORD PTR [rbp-0x30]
  800f49:	48 c1 e8 1e          	shr    rax,0x1e
  800f4d:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
  800f50:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800f53:	48 98                	cdqe   
  800f55:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800f5c:	00 
  800f5d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800f61:	48 01 d0             	add    rax,rdx
  800f64:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f67:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
  800f6b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f6f:	83 e0 01             	and    eax,0x1
  800f72:	48 85 c0             	test   rax,rax
  800f75:	75 45                	jne    800fbc <mmap+0xb7>
    {
        pdp=(page_item*)vmalloc();
  800f77:	b8 00 00 00 00       	mov    eax,0x0
  800f7c:	e8 49 03 00 00       	call   8012ca <vmalloc>
  800f81:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        memset(pdp,0,4096);
  800f85:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f89:	ba 00 10 00 00       	mov    edx,0x1000
  800f8e:	be 00 00 00 00       	mov    esi,0x0
  800f93:	48 89 c7             	mov    rdi,rax
  800f96:	e8 b5 ab 00 00       	call   80bb50 <memset>
        pdptp[pdpti]=(addr_t)pdp|attr;
  800f9b:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800f9e:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  800fa2:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800fa5:	48 98                	cdqe   
  800fa7:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800fae:	00 
  800faf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800fb3:	48 01 f0             	add    rax,rsi
  800fb6:	48 09 ca             	or     rdx,rcx
  800fb9:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pdp=(page_item*)((addr_t)pdp&~0xff);
  800fbc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800fc0:	b0 00                	mov    al,0x0
  800fc2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
  800fc6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800fca:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800fcf:	48 c1 e8 15          	shr    rax,0x15
  800fd3:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800fda:	00 
  800fdb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800fdf:	48 01 d0             	add    rax,rdx
  800fe2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800fe5:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!((unsigned long long)pt & PAGE_PRESENT))
  800fe9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800fed:	83 e0 01             	and    eax,0x1
  800ff0:	48 85 c0             	test   rax,rax
  800ff3:	75 4d                	jne    801042 <mmap+0x13d>
    {
        pt=(page_item*)vmalloc();
  800ff5:	b8 00 00 00 00       	mov    eax,0x0
  800ffa:	e8 cb 02 00 00       	call   8012ca <vmalloc>
  800fff:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        memset(pt,0,4096);
  801003:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801007:	ba 00 10 00 00       	mov    edx,0x1000
  80100c:	be 00 00 00 00       	mov    esi,0x0
  801011:	48 89 c7             	mov    rdi,rax
  801014:	e8 37 ab 00 00       	call   80bb50 <memset>
        pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
  801019:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  80101c:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  801020:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  801024:	25 ff ff ff 3f       	and    eax,0x3fffffff
  801029:	48 c1 e8 15          	shr    rax,0x15
  80102d:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  801034:	00 
  801035:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801039:	48 01 f0             	add    rax,rsi
  80103c:	48 09 ca             	or     rdx,rcx
  80103f:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pt=(page_item*)((addr_t)pt & ~0xff);
  801042:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801046:	b0 00                	mov    al,0x0
  801048:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
  80104c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80104f:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  801053:	81 e2 ff ff 1f 00    	and    edx,0x1fffff
  801059:	48 c1 ea 0c          	shr    rdx,0xc
  80105d:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
  801064:	00 
  801065:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  801069:	48 01 ca             	add    rdx,rcx
  80106c:	48 0b 45 d8          	or     rax,QWORD PTR [rbp-0x28]
  801070:	48 89 02             	mov    QWORD PTR [rdx],rax
    return NORMAL;
  801073:	b8 00 00 00 00       	mov    eax,0x0
}
  801078:	c9                   	leave  
  801079:	c3                   	ret    

000000000080107a <smmap>:

stat_t smmap(addr_t pa,addr_t la,u32 attr,page_item* pml4p)
{
  80107a:	f3 0f 1e fa          	endbr64 
  80107e:	55                   	push   rbp
  80107f:	48 89 e5             	mov    rbp,rsp
  801082:	48 83 ec 40          	sub    rsp,0x40
  801086:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80108a:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  80108e:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
  801091:	48 89 4d c0          	mov    QWORD PTR [rbp-0x40],rcx
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    page_item *pdptp= (page_item *) (pml4p[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
  801095:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  801099:	48 c1 e8 27          	shr    rax,0x27
  80109d:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8010a4:	00 
  8010a5:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8010a9:	48 01 d0             	add    rax,rdx
  8010ac:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8010af:	b0 00                	mov    al,0x0
  8010b1:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
  8010b5:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  8010bc:	00 00 00 
  8010bf:	48 23 45 d0          	and    rax,QWORD PTR [rbp-0x30]
  8010c3:	48 c1 e8 1e          	shr    rax,0x1e
  8010c7:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
  8010ca:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8010cd:	48 98                	cdqe   
  8010cf:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8010d6:	00 
  8010d7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8010db:	48 01 d0             	add    rax,rdx
  8010de:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8010e1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
  8010e5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8010e9:	83 e0 01             	and    eax,0x1
  8010ec:	48 85 c0             	test   rax,rax
  8010ef:	75 45                	jne    801136 <smmap+0xbc>
    {
        pdp=(page_item*)vmalloc();
  8010f1:	b8 00 00 00 00       	mov    eax,0x0
  8010f6:	e8 cf 01 00 00       	call   8012ca <vmalloc>
  8010fb:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        memset(pdp,0,4096);
  8010ff:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801103:	ba 00 10 00 00       	mov    edx,0x1000
  801108:	be 00 00 00 00       	mov    esi,0x0
  80110d:	48 89 c7             	mov    rdi,rax
  801110:	e8 3b aa 00 00       	call   80bb50 <memset>
        pdptp[pdpti]=(addr_t)pdp|attr;
  801115:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  801118:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80111c:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80111f:	48 98                	cdqe   
  801121:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  801128:	00 
  801129:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80112d:	48 01 f0             	add    rax,rsi
  801130:	48 09 ca             	or     rdx,rcx
  801133:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pdp=(page_item*)((addr_t)pdp&~0xff);
  801136:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80113a:	b0 00                	mov    al,0x0
  80113c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
  801140:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  801144:	25 ff ff ff 3f       	and    eax,0x3fffffff
  801149:	48 c1 e8 15          	shr    rax,0x15
  80114d:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  801154:	00 
  801155:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801159:	48 01 d0             	add    rax,rdx
  80115c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80115f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!((unsigned long long)pt & PAGE_PRESENT))
  801163:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801167:	83 e0 01             	and    eax,0x1
  80116a:	48 85 c0             	test   rax,rax
  80116d:	75 4d                	jne    8011bc <smmap+0x142>
    {
        pt=(page_item*)vmalloc();
  80116f:	b8 00 00 00 00       	mov    eax,0x0
  801174:	e8 51 01 00 00       	call   8012ca <vmalloc>
  801179:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        memset(pt,0,4096);
  80117d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801181:	ba 00 10 00 00       	mov    edx,0x1000
  801186:	be 00 00 00 00       	mov    esi,0x0
  80118b:	48 89 c7             	mov    rdi,rax
  80118e:	e8 bd a9 00 00       	call   80bb50 <memset>
        pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
  801193:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  801196:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80119a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80119e:	25 ff ff ff 3f       	and    eax,0x3fffffff
  8011a3:	48 c1 e8 15          	shr    rax,0x15
  8011a7:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  8011ae:	00 
  8011af:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8011b3:	48 01 f0             	add    rax,rsi
  8011b6:	48 09 ca             	or     rdx,rcx
  8011b9:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pt=(page_item*)((addr_t)pt & ~0xff);
  8011bc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8011c0:	b0 00                	mov    al,0x0
  8011c2:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
  8011c6:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8011c9:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8011cd:	81 e2 ff ff 1f 00    	and    edx,0x1fffff
  8011d3:	48 c1 ea 0c          	shr    rdx,0xc
  8011d7:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
  8011de:	00 
  8011df:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  8011e3:	48 01 ca             	add    rdx,rcx
  8011e6:	48 0b 45 d8          	or     rax,QWORD PTR [rbp-0x28]
  8011ea:	48 89 02             	mov    QWORD PTR [rdx],rax
    return NORMAL;
  8011ed:	b8 00 00 00 00       	mov    eax,0x0
}
  8011f2:	c9                   	leave  
  8011f3:	c3                   	ret    

00000000008011f4 <mdemap>:

stat_t mdemap(addr_t la)
{
  8011f4:	f3 0f 1e fa          	endbr64 
  8011f8:	55                   	push   rbp
  8011f9:	48 89 e5             	mov    rbp,rsp
  8011fc:	48 83 ec 10          	sub    rsp,0x10
  801200:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return mmap(0l,la,0);
  801204:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801208:	ba 00 00 00 00       	mov    edx,0x0
  80120d:	48 89 c6             	mov    rsi,rax
  801210:	bf 00 00 00 00       	mov    edi,0x0
  801215:	e8 eb fc ff ff       	call   800f05 <mmap>
}
  80121a:	c9                   	leave  
  80121b:	c3                   	ret    

000000000080121c <init_paging>:
int init_paging()
{
  80121c:	f3 0f 1e fa          	endbr64 
  801220:	55                   	push   rbp
  801221:	48 89 e5             	mov    rbp,rsp
    //设置第一项pdpte，也就是内核空间
//    set_1gb_pdpt(pdpt,0,PAGE_RWX);//设置PDPT0x40000000ul
//    set_page_item(pdpt+1,PD_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);

    #endif
}
  801224:	90                   	nop
  801225:	5d                   	pop    rbp
  801226:	c3                   	ret    

0000000000801227 <set_high_mem_base>:
void set_high_mem_base(int base)
{
  801227:	f3 0f 1e fa          	endbr64 
  80122b:	55                   	push   rbp
  80122c:	48 89 e5             	mov    rbp,rsp
  80122f:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    high_mem_base=base;
  801232:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801235:	89 05 5d b2 00 00    	mov    DWORD PTR [rip+0xb25d],eax        # 80c498 <high_mem_base>
}
  80123b:	90                   	nop
  80123c:	5d                   	pop    rbp
  80123d:	c3                   	ret    

000000000080123e <set_mem_area>:
void set_mem_area(unsigned long base, unsigned long len, unsigned long type)
{
  80123e:	f3 0f 1e fa          	endbr64 
  801242:	55                   	push   rbp
  801243:	48 89 e5             	mov    rbp,rsp
  801246:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80124a:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80124e:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
    mmap_struct[mmap_t_i].base=base;
  801252:	8b 05 c8 ef bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfefc8]        # 400220 <mmap_t_i>
  801258:	48 63 d0             	movsxd rdx,eax
  80125b:	48 89 d0             	mov    rax,rdx
  80125e:	48 01 c0             	add    rax,rax
  801261:	48 01 d0             	add    rax,rdx
  801264:	48 c1 e0 03          	shl    rax,0x3
  801268:	48 8d 90 40 00 40 00 	lea    rdx,[rax+0x400040]
  80126f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801273:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i].len=len;
  801276:	8b 05 a4 ef bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfefa4]        # 400220 <mmap_t_i>
  80127c:	48 63 d0             	movsxd rdx,eax
  80127f:	48 89 d0             	mov    rax,rdx
  801282:	48 01 c0             	add    rax,rax
  801285:	48 01 d0             	add    rax,rdx
  801288:	48 c1 e0 03          	shl    rax,0x3
  80128c:	48 8d 90 48 00 40 00 	lea    rdx,[rax+0x400048]
  801293:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801297:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i++].type=type;
  80129a:	8b 05 80 ef bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfef80]        # 400220 <mmap_t_i>
  8012a0:	8d 50 01             	lea    edx,[rax+0x1]
  8012a3:	89 15 77 ef bf ff    	mov    DWORD PTR [rip+0xffffffffffbfef77],edx        # 400220 <mmap_t_i>
  8012a9:	48 63 d0             	movsxd rdx,eax
  8012ac:	48 89 d0             	mov    rax,rdx
  8012af:	48 01 c0             	add    rax,rax
  8012b2:	48 01 d0             	add    rax,rdx
  8012b5:	48 c1 e0 03          	shl    rax,0x3
  8012b9:	48 8d 90 50 00 40 00 	lea    rdx,[rax+0x400050]
  8012c0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8012c4:	48 89 02             	mov    QWORD PTR [rdx],rax
}
  8012c7:	90                   	nop
  8012c8:	5d                   	pop    rbp
  8012c9:	c3                   	ret    

00000000008012ca <vmalloc>:
addr_t vmalloc()
{
  8012ca:	f3 0f 1e fa          	endbr64 
  8012ce:	55                   	push   rbp
  8012cf:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<VMALLOC_PGN/32;i++)
  8012d2:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8012d9:	eb 76                	jmp    801351 <vmalloc+0x87>
    {
        for(int j=0;j<32;j++)
  8012db:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8012e2:	eb 63                	jmp    801347 <vmalloc+0x7d>
        {
            if(!(vmalloc_map[i]&(1<<j)))
  8012e4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8012e7:	48 98                	cdqe   
  8012e9:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  8012f0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8012f3:	be 01 00 00 00       	mov    esi,0x1
  8012f8:	89 c1                	mov    ecx,eax
  8012fa:	d3 e6                	shl    esi,cl
  8012fc:	89 f0                	mov    eax,esi
  8012fe:	21 d0                	and    eax,edx
  801300:	85 c0                	test   eax,eax
  801302:	75 3f                	jne    801343 <vmalloc+0x79>
            {
                vmalloc_map[i]|=(1<<j);
  801304:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801307:	48 98                	cdqe   
  801309:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  801310:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801313:	be 01 00 00 00       	mov    esi,0x1
  801318:	89 c1                	mov    ecx,eax
  80131a:	d3 e6                	shl    esi,cl
  80131c:	89 f0                	mov    eax,esi
  80131e:	09 c2                	or     edx,eax
  801320:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801323:	48 98                	cdqe   
  801325:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
                return VMALLOC_BASE+(i*32+j)*0x1000;
  80132c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80132f:	c1 e0 05             	shl    eax,0x5
  801332:	89 c2                	mov    edx,eax
  801334:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801337:	01 d0                	add    eax,edx
  801339:	83 c0 20             	add    eax,0x20
  80133c:	c1 e0 0c             	shl    eax,0xc
  80133f:	48 98                	cdqe   
  801341:	eb 14                	jmp    801357 <vmalloc+0x8d>
        for(int j=0;j<32;j++)
  801343:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801347:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  80134b:	7e 97                	jle    8012e4 <vmalloc+0x1a>
    for(int i=0;i<VMALLOC_PGN/32;i++)
  80134d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801351:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  801355:	7e 84                	jle    8012db <vmalloc+0x11>
            }
        }
    }
}
  801357:	5d                   	pop    rbp
  801358:	c3                   	ret    

0000000000801359 <vmfree>:

int vmfree(addr_t ptr)
{
  801359:	f3 0f 1e fa          	endbr64 
  80135d:	55                   	push   rbp
  80135e:	48 89 e5             	mov    rbp,rsp
  801361:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=ptr/PAGE_SIZE;
  801365:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801369:	48 c1 e8 0c          	shr    rax,0xc
  80136d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  801370:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801373:	8d 50 1f             	lea    edx,[rax+0x1f]
  801376:	85 c0                	test   eax,eax
  801378:	0f 48 c2             	cmovs  eax,edx
  80137b:	c1 f8 05             	sar    eax,0x5
  80137e:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  801381:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801384:	99                   	cdq    
  801385:	c1 ea 1b             	shr    edx,0x1b
  801388:	01 d0                	add    eax,edx
  80138a:	83 e0 1f             	and    eax,0x1f
  80138d:	29 d0                	sub    eax,edx
  80138f:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    vmalloc_map[n]=vmalloc_map[n]&~(unsigned int)(1<<r);
  801392:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801395:	48 98                	cdqe   
  801397:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  80139e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8013a1:	be 01 00 00 00       	mov    esi,0x1
  8013a6:	89 c1                	mov    ecx,eax
  8013a8:	d3 e6                	shl    esi,cl
  8013aa:	89 f0                	mov    eax,esi
  8013ac:	f7 d0                	not    eax
  8013ae:	21 c2                	and    edx,eax
  8013b0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8013b3:	48 98                	cdqe   
  8013b5:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
}
  8013bc:	90                   	nop
  8013bd:	5d                   	pop    rbp
  8013be:	c3                   	ret    

00000000008013bf <page_err>:
void page_err(){
  8013bf:	f3 0f 1e fa          	endbr64 
  8013c3:	55                   	push   rbp
  8013c4:	48 89 e5             	mov    rbp,rsp
  8013c7:	41 54                	push   r12
  8013c9:	53                   	push   rbx
  8013ca:	48 83 ec 20          	sub    rsp,0x20
    asm("cli");
  8013ce:	fa                   	cli    
    print("page err\n");
  8013cf:	bf 58 3f 81 00       	mov    edi,0x813f58
  8013d4:	e8 c7 59 00 00       	call   806da0 <print>
    unsigned long err_code=0,l_addr=0;
  8013d9:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  8013e0:	00 
  8013e1:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  8013e8:	00 
    asm volatile("mov 0(%%rbp),%0":"=r"(err_code));
  8013e9:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
  8013ed:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    asm volatile("mov %%cr2,%0":"=r"(l_addr));//试图访问的地址
  8013f1:	0f 20 d0             	mov    rax,cr2
  8013f4:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    int p=err_code&1;
  8013f8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8013fc:	83 e0 01             	and    eax,0x1
  8013ff:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

    if(!p)
  801402:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801406:	75 41                	jne    801449 <page_err+0x8a>
        //accessing non-existent page
        //检查地址合法性
        if(l_addr>=MEM_END)
            ;
        //在进程的页表中申请新页
        smmap(get_phyaddr(req_a_page()),l_addr&~0xfff,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,current->pml4);
  801408:	48 8b 05 91 30 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc13091]        # 4144a0 <current>
  80140f:	48 8b 98 ac 00 00 00 	mov    rbx,QWORD PTR [rax+0xac]
  801416:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80141a:	48 25 00 f0 ff ff    	and    rax,0xfffffffffffff000
  801420:	49 89 c4             	mov    r12,rax
  801423:	b8 00 00 00 00       	mov    eax,0x0
  801428:	e8 50 02 00 00       	call   80167d <req_a_page>
  80142d:	89 c7                	mov    edi,eax
  80142f:	e8 38 04 00 00       	call   80186c <get_phyaddr>
  801434:	48 98                	cdqe   
  801436:	48 89 d9             	mov    rcx,rbx
  801439:	ba 07 00 00 00       	mov    edx,0x7
  80143e:	4c 89 e6             	mov    rsi,r12
  801441:	48 89 c7             	mov    rdi,rax
  801444:	e8 31 fc ff ff       	call   80107a <smmap>
    }
    else
    {
        //page level protection
    }
    p=err_code&2;
  801449:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80144d:	83 e0 02             	and    eax,0x2
  801450:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("when writing\n");else //puts("when reading");
  801453:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801457:	74 0c                	je     801465 <page_err+0xa6>
  801459:	bf 62 3f 81 00       	mov    edi,0x813f62
  80145e:	e8 3d 59 00 00       	call   806da0 <print>
  801463:	eb 0a                	jmp    80146f <page_err+0xb0>
    p=err_code&4;
  801465:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801469:	83 e0 04             	and    eax,0x4
  80146c:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(!p)print("supervisor mode\n");else //puts("user mode");
  80146f:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801473:	75 0c                	jne    801481 <page_err+0xc2>
  801475:	bf 70 3f 81 00       	mov    edi,0x813f70
  80147a:	e8 21 59 00 00       	call   806da0 <print>
  80147f:	eb 0a                	jmp    80148b <page_err+0xcc>
    p=err_code&16;
  801481:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801485:	83 e0 10             	and    eax,0x10
  801488:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("an instruction tries to fetch\n");
  80148b:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80148f:	74 0a                	je     80149b <page_err+0xdc>
  801491:	bf 88 3f 81 00       	mov    edi,0x813f88
  801496:	e8 05 59 00 00       	call   806da0 <print>
    unsigned int addr=0;
  80149b:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
    asm volatile("mov 8(%%rbp),%0":"=r"(addr));
  8014a2:	8b 45 08             	mov    eax,DWORD PTR [rbp+0x8]
  8014a5:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    printf("occurred at %x(paddr), %x(laddr)\n",addr,l_addr);
  8014a8:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8014ac:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8014af:	89 c6                	mov    esi,eax
  8014b1:	bf a8 3f 81 00       	mov    edi,0x813fa8
  8014b6:	b8 00 00 00 00       	mov    eax,0x0
  8014bb:	e8 78 f8 ff ff       	call   800d38 <printf>
    extern int cur_proc;
    extern struct process *task;
    if(task[cur_proc].pid==1)//系统进程
  8014c0:	48 8b 0d d9 6f c0 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc06fd9]        # 4084a0 <task>
  8014c7:	8b 05 5f 30 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1305f]        # 41452c <cur_proc>
  8014cd:	48 63 d0             	movsxd rdx,eax
  8014d0:	48 89 d0             	mov    rax,rdx
  8014d3:	48 01 c0             	add    rax,rax
  8014d6:	48 01 d0             	add    rax,rdx
  8014d9:	48 c1 e0 08          	shl    rax,0x8
  8014dd:	48 01 c8             	add    rax,rcx
  8014e0:	8b 00                	mov    eax,DWORD PTR [rax]
  8014e2:	83 f8 01             	cmp    eax,0x1
  8014e5:	75 11                	jne    8014f8 <page_err+0x139>
    {
        printf("sys died. please reboot.\n");
  8014e7:	bf ca 3f 81 00       	mov    edi,0x813fca
  8014ec:	b8 00 00 00 00       	mov    eax,0x0
  8014f1:	e8 42 f8 ff ff       	call   800d38 <printf>
        asm volatile("jmp .");
  8014f6:	eb fe                	jmp    8014f6 <page_err+0x137>
    }
    //杀死问题进程
//    del_proc(cur_proc);
    // printf("killed the problem process.\n");
    // printf("shell:>");
    eoi();
  8014f8:	b8 00 00 00 00       	mov    eax,0x0
  8014fd:	e8 6c 45 00 00       	call   805a6e <eoi>
    //这里对esp的加法是必要的，因为page fault多push了一个错误码，但是iret识别不了
    __asm__ volatile ("sti \r\n  leave\n add $8,%rsp \n iretq");
  801502:	fb                   	sti    
  801503:	c9                   	leave  
  801504:	48 83 c4 08          	add    rsp,0x8
  801508:	48 cf                	iretq  
}
  80150a:	90                   	nop
  80150b:	48 83 c4 20          	add    rsp,0x20
  80150f:	5b                   	pop    rbx
  801510:	41 5c                	pop    r12
  801512:	5d                   	pop    rbp
  801513:	c3                   	ret    

0000000000801514 <init_memory>:
void init_memory()
{
  801514:	f3 0f 1e fa          	endbr64 
  801518:	55                   	push   rbp
  801519:	48 89 e5             	mov    rbp,rsp
    extern addr_t _knl_end,_knl_start;//lds中声明的内核的结尾地址，放置位图
    //获取内存大小
    size_t mem_size=mmap_struct[mmap_t_i-1].base+mmap_struct[mmap_t_i-1].len;
  80151c:	8b 05 fe ec bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfecfe]        # 400220 <mmap_t_i>
  801522:	83 e8 01             	sub    eax,0x1
  801525:	48 63 d0             	movsxd rdx,eax
  801528:	48 89 d0             	mov    rax,rdx
  80152b:	48 01 c0             	add    rax,rax
  80152e:	48 01 d0             	add    rax,rdx
  801531:	48 c1 e0 03          	shl    rax,0x3
  801535:	48 05 40 00 40 00    	add    rax,0x400040
  80153b:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80153e:	8b 05 dc ec bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfecdc]        # 400220 <mmap_t_i>
  801544:	83 e8 01             	sub    eax,0x1
  801547:	48 63 d0             	movsxd rdx,eax
  80154a:	48 89 d0             	mov    rax,rdx
  80154d:	48 01 c0             	add    rax,rax
  801550:	48 01 d0             	add    rax,rdx
  801553:	48 c1 e0 03          	shl    rax,0x3
  801557:	48 05 48 00 40 00    	add    rax,0x400048
  80155d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801560:	48 01 c8             	add    rax,rcx
  801563:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    //计算出所需内存页数量
    int pgc=mem_size/PAGE_SIZE;
  801567:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80156b:	48 c1 e8 0c          	shr    rax,0xc
  80156f:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    //计算出位图所需的字节数
    int pg_bytes=pgc/32;
  801572:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  801575:	8d 50 1f             	lea    edx,[rax+0x1f]
  801578:	85 c0                	test   eax,eax
  80157a:	0f 48 c2             	cmovs  eax,edx
  80157d:	c1 f8 05             	sar    eax,0x5
  801580:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    page_map=(unsigned int*)PAGE_4K_ALIGN(0xc00000);
  801583:	48 c7 05 92 ea bf ff 	mov    QWORD PTR [rip+0xffffffffffbfea92],0xc00000        # 400020 <page_map>
  80158a:	00 00 c0 00 
    int* p=page_map;
  80158e:	48 8b 05 8b ea bf ff 	mov    rax,QWORD PTR [rip+0xffffffffffbfea8b]        # 400020 <page_map>
  801595:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    addr_t curp=0;
  801599:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  8015a0:	00 
    for(int i=0;i<mmap_t_i;i++){
  8015a1:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8015a8:	e9 91 00 00 00       	jmp    80163e <init_memory+0x12a>
        int cont=0;
  8015ad:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
        if(mmap_struct[i].type!=MULTIBOOT_MEMORY_AVAILABLE)
  8015b4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8015b7:	48 63 d0             	movsxd rdx,eax
  8015ba:	48 89 d0             	mov    rax,rdx
  8015bd:	48 01 c0             	add    rax,rax
  8015c0:	48 01 d0             	add    rax,rdx
  8015c3:	48 c1 e0 03          	shl    rax,0x3
  8015c7:	48 05 50 00 40 00    	add    rax,0x400050
  8015cd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8015d0:	48 83 f8 01          	cmp    rax,0x1
  8015d4:	74 07                	je     8015dd <init_memory+0xc9>
            cont=-1;
  8015d6:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [rbp-0x10],0xffffffff
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  8015dd:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8015e4:	eb 15                	jmp    8015fb <init_memory+0xe7>
            *(p++)=cont;
  8015e6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8015ea:	48 8d 50 04          	lea    rdx,[rax+0x4]
  8015ee:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  8015f2:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8015f5:	89 10                	mov    DWORD PTR [rax],edx
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  8015f7:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8015fb:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8015fe:	48 63 c8             	movsxd rcx,eax
  801601:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801604:	48 63 d0             	movsxd rdx,eax
  801607:	48 89 d0             	mov    rax,rdx
  80160a:	48 01 c0             	add    rax,rax
  80160d:	48 01 d0             	add    rax,rdx
  801610:	48 c1 e0 03          	shl    rax,0x3
  801614:	48 05 48 00 40 00    	add    rax,0x400048
  80161a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80161d:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  801624:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  80162b:	ff 00 00 
  80162e:	48 21 d0             	and    rax,rdx
  801631:	48 c1 e8 11          	shr    rax,0x11
  801635:	48 39 c1             	cmp    rcx,rax
  801638:	72 ac                	jb     8015e6 <init_memory+0xd2>
    for(int i=0;i<mmap_t_i;i++){
  80163a:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80163e:	8b 05 dc eb bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfebdc]        # 400220 <mmap_t_i>
  801644:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  801647:	0f 8c 60 ff ff ff    	jl     8015ad <init_memory+0x99>
        }
    }

    //低16M空间直接被内核占用
    for(int i=0;i<128;i++){
  80164d:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  801654:	eb 1d                	jmp    801673 <init_memory+0x15f>
        page_map[i]=0xffffffff;
  801656:	48 8b 15 c3 e9 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe9c3]        # 400020 <page_map>
  80165d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801660:	48 98                	cdqe   
  801662:	48 c1 e0 02          	shl    rax,0x2
  801666:	48 01 d0             	add    rax,rdx
  801669:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<128;i++){
  80166f:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  801673:	83 7d e8 7f          	cmp    DWORD PTR [rbp-0x18],0x7f
  801677:	7e dd                	jle    801656 <init_memory+0x142>
    }
}
  801679:	90                   	nop
  80167a:	90                   	nop
  80167b:	5d                   	pop    rbp
  80167c:	c3                   	ret    

000000000080167d <req_a_page>:
/*
page_map存储方式:
0x00000000
little end
*/
addr_t req_a_page(){
  80167d:	f3 0f 1e fa          	endbr64 
  801681:	55                   	push   rbp
  801682:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  801685:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80168c:	e9 b0 00 00 00       	jmp    801741 <req_a_page+0xc4>
        for(int j=0;j<32;j++){
  801691:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801698:	e9 96 00 00 00       	jmp    801733 <req_a_page+0xb6>
            unsigned int bit=page_map[i]&(1<<j);
  80169d:	48 8b 15 7c e9 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe97c]        # 400020 <page_map>
  8016a4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8016a7:	48 98                	cdqe   
  8016a9:	48 c1 e0 02          	shl    rax,0x2
  8016ad:	48 01 d0             	add    rax,rdx
  8016b0:	8b 10                	mov    edx,DWORD PTR [rax]
  8016b2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8016b5:	be 01 00 00 00       	mov    esi,0x1
  8016ba:	89 c1                	mov    ecx,eax
  8016bc:	d3 e6                	shl    esi,cl
  8016be:	89 f0                	mov    eax,esi
  8016c0:	21 d0                	and    eax,edx
  8016c2:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            if((i*32+j)*4096>=0x100000&&!bit)
  8016c5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8016c8:	c1 e0 05             	shl    eax,0x5
  8016cb:	89 c2                	mov    edx,eax
  8016cd:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8016d0:	01 d0                	add    eax,edx
  8016d2:	c1 e0 0c             	shl    eax,0xc
  8016d5:	3d ff ff 0f 00       	cmp    eax,0xfffff
  8016da:	7e 53                	jle    80172f <req_a_page+0xb2>
  8016dc:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8016e0:	75 4d                	jne    80172f <req_a_page+0xb2>
            {
                page_map[i]=page_map[i]|(1<<j);
  8016e2:	48 8b 15 37 e9 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe937]        # 400020 <page_map>
  8016e9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8016ec:	48 98                	cdqe   
  8016ee:	48 c1 e0 02          	shl    rax,0x2
  8016f2:	48 01 d0             	add    rax,rdx
  8016f5:	8b 10                	mov    edx,DWORD PTR [rax]
  8016f7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8016fa:	be 01 00 00 00       	mov    esi,0x1
  8016ff:	89 c1                	mov    ecx,eax
  801701:	d3 e6                	shl    esi,cl
  801703:	89 f0                	mov    eax,esi
  801705:	89 c6                	mov    esi,eax
  801707:	48 8b 0d 12 e9 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe912]        # 400020 <page_map>
  80170e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801711:	48 98                	cdqe   
  801713:	48 c1 e0 02          	shl    rax,0x2
  801717:	48 01 c8             	add    rax,rcx
  80171a:	09 f2                	or     edx,esi
  80171c:	89 10                	mov    DWORD PTR [rax],edx
                return i*32+j;//num of page
  80171e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801721:	c1 e0 05             	shl    eax,0x5
  801724:	89 c2                	mov    edx,eax
  801726:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801729:	01 d0                	add    eax,edx
  80172b:	48 98                	cdqe   
  80172d:	eb 1c                	jmp    80174b <req_a_page+0xce>
        for(int j=0;j<32;j++){
  80172f:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801733:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  801737:	0f 8e 60 ff ff ff    	jle    80169d <req_a_page+0x20>
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  80173d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801741:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  801745:	0f 8e 46 ff ff ff    	jle    801691 <req_a_page+0x14>

            }
        }
    }
}
  80174b:	5d                   	pop    rbp
  80174c:	c3                   	ret    

000000000080174d <free_page>:

int free_page(char *paddr){
  80174d:	f3 0f 1e fa          	endbr64 
  801751:	55                   	push   rbp
  801752:	48 89 e5             	mov    rbp,rsp
  801755:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=(int)paddr/4096;
  801759:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80175d:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801763:	85 c0                	test   eax,eax
  801765:	0f 48 c2             	cmovs  eax,edx
  801768:	c1 f8 0c             	sar    eax,0xc
  80176b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  80176e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801771:	8d 50 1f             	lea    edx,[rax+0x1f]
  801774:	85 c0                	test   eax,eax
  801776:	0f 48 c2             	cmovs  eax,edx
  801779:	c1 f8 05             	sar    eax,0x5
  80177c:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  80177f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801782:	99                   	cdq    
  801783:	c1 ea 1b             	shr    edx,0x1b
  801786:	01 d0                	add    eax,edx
  801788:	83 e0 1f             	and    eax,0x1f
  80178b:	29 d0                	sub    eax,edx
  80178d:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    page_map[n]=page_map[n]&~(unsigned int)(1<<r);
  801790:	48 8b 15 89 e8 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe889]        # 400020 <page_map>
  801797:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80179a:	48 98                	cdqe   
  80179c:	48 c1 e0 02          	shl    rax,0x2
  8017a0:	48 01 d0             	add    rax,rdx
  8017a3:	8b 10                	mov    edx,DWORD PTR [rax]
  8017a5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8017a8:	be 01 00 00 00       	mov    esi,0x1
  8017ad:	89 c1                	mov    ecx,eax
  8017af:	d3 e6                	shl    esi,cl
  8017b1:	89 f0                	mov    eax,esi
  8017b3:	f7 d0                	not    eax
  8017b5:	89 c6                	mov    esi,eax
  8017b7:	48 8b 0d 62 e8 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe862]        # 400020 <page_map>
  8017be:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8017c1:	48 98                	cdqe   
  8017c3:	48 c1 e0 02          	shl    rax,0x2
  8017c7:	48 01 c8             	add    rax,rcx
  8017ca:	21 f2                	and    edx,esi
  8017cc:	89 10                	mov    DWORD PTR [rax],edx
}
  8017ce:	90                   	nop
  8017cf:	5d                   	pop    rbp
  8017d0:	c3                   	ret    

00000000008017d1 <free_pages_at>:

int free_pages_at(int base,int pgn){
  8017d1:	f3 0f 1e fa          	endbr64 
  8017d5:	55                   	push   rbp
  8017d6:	48 89 e5             	mov    rbp,rsp
  8017d9:	48 83 ec 18          	sub    rsp,0x18
  8017dd:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8017e0:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<pgn;i++){
  8017e3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8017ea:	eb 1b                	jmp    801807 <free_pages_at+0x36>
        free_page(base+i*PAGE_4K_SIZE);
  8017ec:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8017ef:	c1 e0 0c             	shl    eax,0xc
  8017f2:	89 c2                	mov    edx,eax
  8017f4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8017f7:	01 d0                	add    eax,edx
  8017f9:	48 98                	cdqe   
  8017fb:	48 89 c7             	mov    rdi,rax
  8017fe:	e8 4a ff ff ff       	call   80174d <free_page>
    for(int i=0;i<pgn;i++){
  801803:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801807:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80180a:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  80180d:	7c dd                	jl     8017ec <free_pages_at+0x1b>
    }
}
  80180f:	90                   	nop
  801810:	c9                   	leave  
  801811:	c3                   	ret    

0000000000801812 <check_page>:
int check_page(int num){
  801812:	f3 0f 1e fa          	endbr64 
  801816:	55                   	push   rbp
  801817:	48 89 e5             	mov    rbp,rsp
  80181a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int n=num/32;
  80181d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801820:	8d 50 1f             	lea    edx,[rax+0x1f]
  801823:	85 c0                	test   eax,eax
  801825:	0f 48 c2             	cmovs  eax,edx
  801828:	c1 f8 05             	sar    eax,0x5
  80182b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int r=num%32;
  80182e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801831:	99                   	cdq    
  801832:	c1 ea 1b             	shr    edx,0x1b
  801835:	01 d0                	add    eax,edx
  801837:	83 e0 1f             	and    eax,0x1f
  80183a:	29 d0                	sub    eax,edx
  80183c:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int bit=page_map[n]&(1<<r);
  80183f:	48 8b 15 da e7 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe7da]        # 400020 <page_map>
  801846:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801849:	48 98                	cdqe   
  80184b:	48 c1 e0 02          	shl    rax,0x2
  80184f:	48 01 d0             	add    rax,rdx
  801852:	8b 10                	mov    edx,DWORD PTR [rax]
  801854:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801857:	be 01 00 00 00       	mov    esi,0x1
  80185c:	89 c1                	mov    ecx,eax
  80185e:	d3 e6                	shl    esi,cl
  801860:	89 f0                	mov    eax,esi
  801862:	21 d0                	and    eax,edx
  801864:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    return bit;
  801867:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  80186a:	5d                   	pop    rbp
  80186b:	c3                   	ret    

000000000080186c <get_phyaddr>:
/*
 * 获得这个页对应的物理内存地址
 * */
int get_phyaddr(int num){
  80186c:	f3 0f 1e fa          	endbr64 
  801870:	55                   	push   rbp
  801871:	48 89 e5             	mov    rbp,rsp
  801874:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return num*0x1000;
  801877:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80187a:	c1 e0 0c             	shl    eax,0xc
}
  80187d:	5d                   	pop    rbp
  80187e:	c3                   	ret    

000000000080187f <set_page_item>:

void set_page_item(page_item *item_addr,int phy_addr,int attr)
{
  80187f:	f3 0f 1e fa          	endbr64 
  801883:	55                   	push   rbp
  801884:	48 89 e5             	mov    rbp,rsp
  801887:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80188b:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  80188e:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    *item_addr=0;
  801891:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801895:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *item_addr|=phy_addr&0xfffff000;
  80189c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8018a0:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8018a3:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8018a6:	89 c0                	mov    eax,eax
  8018a8:	25 00 f0 ff ff       	and    eax,0xfffff000
  8018ad:	48 09 c2             	or     rdx,rax
  8018b0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8018b4:	48 89 10             	mov    QWORD PTR [rax],rdx
    *item_addr|=attr;
  8018b7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8018bb:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8018be:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8018c1:	48 98                	cdqe   
  8018c3:	48 09 c2             	or     rdx,rax
  8018c6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8018ca:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  8018cd:	90                   	nop
  8018ce:	5d                   	pop    rbp
  8018cf:	c3                   	ret    

00000000008018d0 <set_1gb_pdpt>:
void set_1gb_pdpt(page_item* ppdpt,int pa,unsigned int extra_attr)
{
  8018d0:	f3 0f 1e fa          	endbr64 
  8018d4:	55                   	push   rbp
  8018d5:	48 89 e5             	mov    rbp,rsp
  8018d8:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8018dc:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  8018df:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *ppdpt=0;
  8018e2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018e6:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *ppdpt|=PAGE_PRESENT|PDPTE_1GB|extra_attr;
  8018ed:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018f1:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8018f4:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8018f7:	0c 81                	or     al,0x81
  8018f9:	89 c0                	mov    eax,eax
  8018fb:	48 09 c2             	or     rdx,rax
  8018fe:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801902:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffffc0000000ul;
  801905:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801908:	25 00 00 00 c0       	and    eax,0xc0000000
  80190d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *ppdpt|=hipa;
  801910:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801914:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801917:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80191a:	48 09 c2             	or     rdx,rax
  80191d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801921:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  801924:	90                   	nop
  801925:	5d                   	pop    rbp
  801926:	c3                   	ret    

0000000000801927 <set_2mb_pde>:
void set_2mb_pde(page_item *pde, int pa, int extra_attr)
{
  801927:	f3 0f 1e fa          	endbr64 
  80192b:	55                   	push   rbp
  80192c:	48 89 e5             	mov    rbp,rsp
  80192f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  801933:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  801936:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *pde=0;
  801939:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80193d:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *pde|=PAGE_PRESENT|PAGE_4MB_PAGE|PDE_4MB_PAT|extra_attr;
  801944:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801948:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80194b:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80194e:	0d 81 10 00 00       	or     eax,0x1081
  801953:	48 98                	cdqe   
  801955:	48 09 c2             	or     rdx,rax
  801958:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80195c:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffc00000;
  80195f:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801962:	25 00 00 c0 ff       	and    eax,0xffc00000
  801967:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *pde|=hipa;
  80196a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80196e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801971:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801974:	48 09 c2             	or     rdx,rax
  801977:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80197b:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  80197e:	90                   	nop
  80197f:	5d                   	pop    rbp
  801980:	c3                   	ret    

0000000000801981 <req_page_at>:
        page_map[i]&=(u32)(1<<j);
    return ret;
} */
//在bitmap申请指定的页面,base默认0x1000对齐
addr_t req_page_at(addr_t base,int pgn)
{
  801981:	f3 0f 1e fa          	endbr64 
  801985:	55                   	push   rbp
  801986:	48 89 e5             	mov    rbp,rsp
  801989:	48 83 ec 20          	sub    rsp,0x20
  80198d:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  801991:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    if(base==0)//不指定地址
  801994:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  801999:	75 18                	jne    8019b3 <req_page_at+0x32>
    {
        return get_phyaddr(req_a_page());
  80199b:	b8 00 00 00 00       	mov    eax,0x0
  8019a0:	e8 d8 fc ff ff       	call   80167d <req_a_page>
  8019a5:	89 c7                	mov    edi,eax
  8019a7:	e8 c0 fe ff ff       	call   80186c <get_phyaddr>
  8019ac:	48 98                	cdqe   
  8019ae:	e9 a5 00 00 00       	jmp    801a58 <req_page_at+0xd7>
    }
    if(!is_pgs_ava(base,pgn))return -1;//先检查
  8019b3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8019b7:	89 c2                	mov    edx,eax
  8019b9:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8019bc:	89 c6                	mov    esi,eax
  8019be:	89 d7                	mov    edi,edx
  8019c0:	e8 52 01 00 00       	call   801b17 <is_pgs_ava>
  8019c5:	85 c0                	test   eax,eax
  8019c7:	75 0c                	jne    8019d5 <req_page_at+0x54>
  8019c9:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  8019d0:	e9 83 00 00 00       	jmp    801a58 <req_page_at+0xd7>
    int pgni=base/4096;
  8019d5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8019d9:	48 c1 e8 0c          	shr    rax,0xc
  8019dd:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int pgi=pgni/32;
  8019e0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8019e3:	8d 50 1f             	lea    edx,[rax+0x1f]
  8019e6:	85 c0                	test   eax,eax
  8019e8:	0f 48 c2             	cmovs  eax,edx
  8019eb:	c1 f8 05             	sar    eax,0x5
  8019ee:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    int pgj=pgni%32;
  8019f1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8019f4:	99                   	cdq    
  8019f5:	c1 ea 1b             	shr    edx,0x1b
  8019f8:	01 d0                	add    eax,edx
  8019fa:	83 e0 1f             	and    eax,0x1f
  8019fd:	29 d0                	sub    eax,edx
  8019ff:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<pgn;i++)
  801a02:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801a09:	eb 40                	jmp    801a4b <req_page_at+0xca>
    {
        page_map[i]|=(1<<pgj);
  801a0b:	48 8b 15 0e e6 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe60e]        # 400020 <page_map>
  801a12:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a15:	48 98                	cdqe   
  801a17:	48 c1 e0 02          	shl    rax,0x2
  801a1b:	48 01 d0             	add    rax,rdx
  801a1e:	8b 10                	mov    edx,DWORD PTR [rax]
  801a20:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  801a23:	be 01 00 00 00       	mov    esi,0x1
  801a28:	89 c1                	mov    ecx,eax
  801a2a:	d3 e6                	shl    esi,cl
  801a2c:	89 f0                	mov    eax,esi
  801a2e:	89 c6                	mov    esi,eax
  801a30:	48 8b 0d e9 e5 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe5e9]        # 400020 <page_map>
  801a37:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a3a:	48 98                	cdqe   
  801a3c:	48 c1 e0 02          	shl    rax,0x2
  801a40:	48 01 c8             	add    rax,rcx
  801a43:	09 f2                	or     edx,esi
  801a45:	89 10                	mov    DWORD PTR [rax],edx
    for(int i=0;i<pgn;i++)
  801a47:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801a4b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a4e:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  801a51:	7c b8                	jl     801a0b <req_page_at+0x8a>
    }
    return 0;
  801a53:	b8 00 00 00 00       	mov    eax,0x0

}
  801a58:	c9                   	leave  
  801a59:	c3                   	ret    

0000000000801a5a <chk_vm>:
int chk_vm(int base, int pgn)
{
  801a5a:	f3 0f 1e fa          	endbr64 
  801a5e:	55                   	push   rbp
  801a5f:	48 89 e5             	mov    rbp,rsp
  801a62:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801a65:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int *pdet=0;
  801a68:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  801a6f:	00 
    asm volatile("mov %%cr3,%0":"=r"(pdet));
  801a70:	0f 20 d8             	mov    rax,cr3
  801a73:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int *pt=pdet[base/PAGE_INDEX_SIZE]&0xfffff000;
  801a77:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a7a:	8d 90 ff ff 1f 00    	lea    edx,[rax+0x1fffff]
  801a80:	85 c0                	test   eax,eax
  801a82:	0f 48 c2             	cmovs  eax,edx
  801a85:	c1 f8 15             	sar    eax,0x15
  801a88:	48 98                	cdqe   
  801a8a:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801a91:	00 
  801a92:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801a96:	48 01 d0             	add    rax,rdx
  801a99:	8b 00                	mov    eax,DWORD PTR [rax]
  801a9b:	89 c0                	mov    eax,eax
  801a9d:	25 00 f0 ff ff       	and    eax,0xfffff000
  801aa2:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  801aa6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801aa9:	8d 90 ff ff 1f 00    	lea    edx,[rax+0x1fffff]
  801aaf:	85 c0                	test   eax,eax
  801ab1:	0f 48 c2             	cmovs  eax,edx
  801ab4:	c1 f8 15             	sar    eax,0x15
  801ab7:	48 98                	cdqe   
  801ab9:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801ac0:	00 
  801ac1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801ac5:	48 01 d0             	add    rax,rdx
  801ac8:	8b 00                	mov    eax,DWORD PTR [rax]
  801aca:	83 e0 01             	and    eax,0x1
  801acd:	85 c0                	test   eax,eax
  801acf:	74 38                	je     801b09 <chk_vm+0xaf>
    !(pt[base%PAGE_INDEX_SIZE/PAGE_SIZE]&PAGE_PRESENT))
  801ad1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801ad4:	99                   	cdq    
  801ad5:	c1 ea 0b             	shr    edx,0xb
  801ad8:	01 d0                	add    eax,edx
  801ada:	25 ff ff 1f 00       	and    eax,0x1fffff
  801adf:	29 d0                	sub    eax,edx
  801ae1:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801ae7:	85 c0                	test   eax,eax
  801ae9:	0f 48 c2             	cmovs  eax,edx
  801aec:	c1 f8 0c             	sar    eax,0xc
  801aef:	48 98                	cdqe   
  801af1:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801af8:	00 
  801af9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801afd:	48 01 d0             	add    rax,rdx
  801b00:	8b 00                	mov    eax,DWORD PTR [rax]
  801b02:	83 e0 01             	and    eax,0x1
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  801b05:	85 c0                	test   eax,eax
  801b07:	75 07                	jne    801b10 <chk_vm+0xb6>
    {
        return -1;
  801b09:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801b0e:	eb 05                	jmp    801b15 <chk_vm+0xbb>
    }
    return 0;
  801b10:	b8 00 00 00 00       	mov    eax,0x0
}
  801b15:	5d                   	pop    rbp
  801b16:	c3                   	ret    

0000000000801b17 <is_pgs_ava>:
//查看指定区域的页内存是否可用
int is_pgs_ava(int base,int pgn)
{
  801b17:	f3 0f 1e fa          	endbr64 
  801b1b:	55                   	push   rbp
  801b1c:	48 89 e5             	mov    rbp,rsp
  801b1f:	48 83 ec 18          	sub    rsp,0x18
  801b23:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801b26:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int pgi=base/4096;
  801b29:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801b2c:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801b32:	85 c0                	test   eax,eax
  801b34:	0f 48 c2             	cmovs  eax,edx
  801b37:	c1 f8 0c             	sar    eax,0xc
  801b3a:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    for(int i=0;i<pgn;i++)
  801b3d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801b44:	eb 1e                	jmp    801b64 <is_pgs_ava+0x4d>
    {
        if(check_page(pgi+i)!=0)return 0;
  801b46:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801b49:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b4c:	01 d0                	add    eax,edx
  801b4e:	89 c7                	mov    edi,eax
  801b50:	e8 bd fc ff ff       	call   801812 <check_page>
  801b55:	85 c0                	test   eax,eax
  801b57:	74 07                	je     801b60 <is_pgs_ava+0x49>
  801b59:	b8 00 00 00 00       	mov    eax,0x0
  801b5e:	eb 11                	jmp    801b71 <is_pgs_ava+0x5a>
    for(int i=0;i<pgn;i++)
  801b60:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801b64:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b67:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  801b6a:	7c da                	jl     801b46 <is_pgs_ava+0x2f>
    }
    return 1;
  801b6c:	b8 01 00 00 00       	mov    eax,0x1

}
  801b71:	c9                   	leave  
  801b72:	c3                   	ret    

0000000000801b73 <setup_sys_vol>:
super_block sbs[MAX_SUPERBLOCKS];
fs_operations fs[MAX_FS];

buffer_head buffer_heads[NR_BUFFERHEADS];
int setup_sys_vol(void *disk_drv, void *fs_drv)
{
  801b73:	f3 0f 1e fa          	endbr64 
  801b77:	55                   	push   rbp
  801b78:	48 89 e5             	mov    rbp,rsp
  801b7b:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  801b7f:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    vols[0].name[0]='C';
  801b83:	c6 05 b6 e6 bf ff 43 	mov    BYTE PTR [rip+0xffffffffffbfe6b6],0x43        # 400240 <vols>
    vols[0].name[1]='\0';
  801b8a:	c6 05 b0 e6 bf ff 00 	mov    BYTE PTR [rip+0xffffffffffbfe6b0],0x0        # 400241 <vols+0x1>
    vols[0].disk_drv=disk_drv;
  801b91:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801b95:	48 89 05 ac e6 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe6ac],rax        # 400248 <vols+0x8>
    vols[0].fs_drv=fs_drv;
  801b9c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801ba0:	48 89 05 a9 e6 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe6a9],rax        # 400250 <vols+0x10>
    vols[0].stat=VOLUME_STAT_READY;
  801ba7:	c7 05 af e6 bf ff 01 	mov    DWORD PTR [rip+0xffffffffffbfe6af],0x1        # 400260 <vols+0x20>
  801bae:	00 00 00 
    return 0;
  801bb1:	b8 00 00 00 00       	mov    eax,0x0
}
  801bb6:	5d                   	pop    rbp
  801bb7:	c3                   	ret    

0000000000801bb8 <sys_mkfifo>:
//返回管道描述符
int sys_mkfifo(int number)
{
  801bb8:	f3 0f 1e fa          	endbr64 
  801bbc:	55                   	push   rbp
  801bbd:	48 89 e5             	mov    rbp,rsp
  801bc0:	48 83 ec 20          	sub    rsp,0x20
  801bc4:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    //查重
    for(int i=0;i<MAX_FIFOS;i++)
  801bc7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801bce:	eb 38                	jmp    801c08 <sys_mkfifo+0x50>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801bd0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801bd3:	48 98                	cdqe   
  801bd5:	48 c1 e0 04          	shl    rax,0x4
  801bd9:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801bdf:	8b 00                	mov    eax,DWORD PTR [rax]
  801be1:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801be4:	75 1e                	jne    801c04 <sys_mkfifo+0x4c>
  801be6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801be9:	48 98                	cdqe   
  801beb:	48 c1 e0 04          	shl    rax,0x4
  801bef:	48 05 68 1e 40 00    	add    rax,0x401e68
  801bf5:	8b 00                	mov    eax,DWORD PTR [rax]
  801bf7:	83 f8 01             	cmp    eax,0x1
  801bfa:	75 08                	jne    801c04 <sys_mkfifo+0x4c>
            return i;
  801bfc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801bff:	e9 a6 00 00 00       	jmp    801caa <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801c04:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801c08:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801c0c:	7e c2                	jle    801bd0 <sys_mkfifo+0x18>
        }
    }
    for(int i=0;i<MAX_FIFOS;i++)
  801c0e:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801c15:	e9 81 00 00 00       	jmp    801c9b <sys_mkfifo+0xe3>
    {
        if(fifos[i].flag==0) {
  801c1a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801c1d:	48 98                	cdqe   
  801c1f:	48 c1 e0 04          	shl    rax,0x4
  801c23:	48 05 68 1e 40 00    	add    rax,0x401e68
  801c29:	8b 00                	mov    eax,DWORD PTR [rax]
  801c2b:	85 c0                	test   eax,eax
  801c2d:	75 68                	jne    801c97 <sys_mkfifo+0xdf>
            fifos[i].flag=1;
  801c2f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801c32:	48 98                	cdqe   
  801c34:	48 c1 e0 04          	shl    rax,0x4
  801c38:	48 05 68 1e 40 00    	add    rax,0x401e68
  801c3e:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            fifos[i].id=number;
  801c44:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801c47:	48 98                	cdqe   
  801c49:	48 c1 e0 04          	shl    rax,0x4
  801c4d:	48 8d 90 6c 1e 40 00 	lea    rdx,[rax+0x401e6c]
  801c54:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c57:	89 02                	mov    DWORD PTR [rdx],eax
            fifos[i].size=CHUNK_SIZE;
  801c59:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801c5c:	48 98                	cdqe   
  801c5e:	48 c1 e0 04          	shl    rax,0x4
  801c62:	48 05 64 1e 40 00    	add    rax,0x401e64
  801c68:	c7 00 00 10 00 00    	mov    DWORD PTR [rax],0x1000
            //分配内存
            fifos[i].pa= get_phyaddr(req_a_page());
  801c6e:	b8 00 00 00 00       	mov    eax,0x0
  801c73:	e8 05 fa ff ff       	call   80167d <req_a_page>
  801c78:	89 c7                	mov    edi,eax
  801c7a:	e8 ed fb ff ff       	call   80186c <get_phyaddr>
  801c7f:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801c82:	48 63 d2             	movsxd rdx,edx
  801c85:	48 c1 e2 04          	shl    rdx,0x4
  801c89:	48 81 c2 60 1e 40 00 	add    rdx,0x401e60
  801c90:	89 02                	mov    DWORD PTR [rdx],eax
            return i;
  801c92:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801c95:	eb 13                	jmp    801caa <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801c97:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801c9b:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  801c9f:	0f 8e 75 ff ff ff    	jle    801c1a <sys_mkfifo+0x62>
        }
    }
    return -1;
  801ca5:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801caa:	c9                   	leave  
  801cab:	c3                   	ret    

0000000000801cac <sys_rmfifo>:

int sys_rmfifo(int number)
{
  801cac:	f3 0f 1e fa          	endbr64 
  801cb0:	55                   	push   rbp
  801cb1:	48 89 e5             	mov    rbp,rsp
  801cb4:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_FIFOS;i++)
  801cb7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801cbe:	eb 4a                	jmp    801d0a <sys_rmfifo+0x5e>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801cc0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801cc3:	48 98                	cdqe   
  801cc5:	48 c1 e0 04          	shl    rax,0x4
  801cc9:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801ccf:	8b 00                	mov    eax,DWORD PTR [rax]
  801cd1:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801cd4:	75 30                	jne    801d06 <sys_rmfifo+0x5a>
  801cd6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801cd9:	48 98                	cdqe   
  801cdb:	48 c1 e0 04          	shl    rax,0x4
  801cdf:	48 05 68 1e 40 00    	add    rax,0x401e68
  801ce5:	8b 00                	mov    eax,DWORD PTR [rax]
  801ce7:	83 f8 01             	cmp    eax,0x1
  801cea:	75 1a                	jne    801d06 <sys_rmfifo+0x5a>
            fifos[i].flag=0;
  801cec:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801cef:	48 98                	cdqe   
  801cf1:	48 c1 e0 04          	shl    rax,0x4
  801cf5:	48 05 68 1e 40 00    	add    rax,0x401e68
  801cfb:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            return i;
  801d01:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801d04:	eb 0f                	jmp    801d15 <sys_rmfifo+0x69>
    for(int i=0;i<MAX_FIFOS;i++)
  801d06:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801d0a:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801d0e:	7e b0                	jle    801cc0 <sys_rmfifo+0x14>
        }
    }
    return -1;
  801d10:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801d15:	5d                   	pop    rbp
  801d16:	c3                   	ret    

0000000000801d17 <free_vol>:
int free_vol(int voli)
{
  801d17:	f3 0f 1e fa          	endbr64 
  801d1b:	55                   	push   rbp
  801d1c:	48 89 e5             	mov    rbp,rsp
  801d1f:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    vols[0].stat=VOLUME_STAT_EMPTY;
  801d22:	c7 05 34 e5 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbfe534],0x0        # 400260 <vols+0x20>
  801d29:	00 00 00 
    return 0;
  801d2c:	b8 00 00 00 00       	mov    eax,0x0
}
  801d31:	5d                   	pop    rbp
  801d32:	c3                   	ret    

0000000000801d33 <reg_vol>:

int reg_vol(int disk_drvi, int fs_drvi, char *name)
{
  801d33:	f3 0f 1e fa          	endbr64 
  801d37:	55                   	push   rbp
  801d38:	48 89 e5             	mov    rbp,rsp
  801d3b:	48 83 ec 20          	sub    rsp,0x20
  801d3f:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801d42:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  801d45:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
    for(int i=0;i<MAX_VOLUMES;i++)
  801d49:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801d50:	e9 d8 00 00 00       	jmp    801e2d <reg_vol+0xfa>
    {
        if(vols[i].stat==VOLUME_STAT_EMPTY)
  801d55:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801d58:	48 63 d0             	movsxd rdx,eax
  801d5b:	48 89 d0             	mov    rax,rdx
  801d5e:	48 c1 e0 02          	shl    rax,0x2
  801d62:	48 01 d0             	add    rax,rdx
  801d65:	48 c1 e0 03          	shl    rax,0x3
  801d69:	48 05 60 02 40 00    	add    rax,0x400260
  801d6f:	8b 00                	mov    eax,DWORD PTR [rax]
  801d71:	85 c0                	test   eax,eax
  801d73:	0f 85 b0 00 00 00    	jne    801e29 <reg_vol+0xf6>
        {
            extern driver *drvs;
            vols[i].stat=VOLUME_STAT_READY;
  801d79:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801d7c:	48 63 d0             	movsxd rdx,eax
  801d7f:	48 89 d0             	mov    rax,rdx
  801d82:	48 c1 e0 02          	shl    rax,0x2
  801d86:	48 01 d0             	add    rax,rdx
  801d89:	48 c1 e0 03          	shl    rax,0x3
  801d8d:	48 05 60 02 40 00    	add    rax,0x400260
  801d93:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            vols[i].fs= &fs[fs_drvi];
  801d99:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801d9c:	48 63 d0             	movsxd rdx,eax
  801d9f:	48 89 d0             	mov    rax,rdx
  801da2:	48 01 c0             	add    rax,rax
  801da5:	48 01 d0             	add    rax,rdx
  801da8:	48 c1 e0 03          	shl    rax,0x3
  801dac:	48 8d 88 80 23 40 00 	lea    rcx,[rax+0x402380]
  801db3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801db6:	48 63 d0             	movsxd rdx,eax
  801db9:	48 89 d0             	mov    rax,rdx
  801dbc:	48 c1 e0 02          	shl    rax,0x2
  801dc0:	48 01 d0             	add    rax,rdx
  801dc3:	48 c1 e0 03          	shl    rax,0x3
  801dc7:	48 05 58 02 40 00    	add    rax,0x400258
  801dcd:	48 89 08             	mov    QWORD PTR [rax],rcx
            vols[i].disk_drv= get_drv(disk_drvi);
  801dd0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801dd3:	89 c7                	mov    edi,eax
  801dd5:	e8 3d 13 00 00       	call   803117 <get_drv>
  801dda:	48 89 c2             	mov    rdx,rax
  801ddd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801de0:	48 63 c8             	movsxd rcx,eax
  801de3:	48 89 c8             	mov    rax,rcx
  801de6:	48 c1 e0 02          	shl    rax,0x2
  801dea:	48 01 c8             	add    rax,rcx
  801ded:	48 c1 e0 03          	shl    rax,0x3
  801df1:	48 05 48 02 40 00    	add    rax,0x400248
  801df7:	48 89 10             	mov    QWORD PTR [rax],rdx
            strcpy(vols[i].name,name);
  801dfa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801dfd:	48 63 d0             	movsxd rdx,eax
  801e00:	48 89 d0             	mov    rax,rdx
  801e03:	48 c1 e0 02          	shl    rax,0x2
  801e07:	48 01 d0             	add    rax,rdx
  801e0a:	48 c1 e0 03          	shl    rax,0x3
  801e0e:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801e15:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801e19:	48 89 c6             	mov    rsi,rax
  801e1c:	48 89 d7             	mov    rdi,rdx
  801e1f:	e8 7b 9d 00 00       	call   80bb9f <strcpy>
            return i;
  801e24:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801e27:	eb 13                	jmp    801e3c <reg_vol+0x109>
    for(int i=0;i<MAX_VOLUMES;i++)
  801e29:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801e2d:	83 7d fc 19          	cmp    DWORD PTR [rbp-0x4],0x19
  801e31:	0f 8e 1e ff ff ff    	jle    801d55 <reg_vol+0x22>
        }
    }
    return -1;
  801e37:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801e3c:	c9                   	leave  
  801e3d:	c3                   	ret    

0000000000801e3e <sys_tell>:
//    if(!f)return -1;
//    f->ptr=offset+origin;
//    return 0;
//}
int sys_tell(int fno)
{
  801e3e:	f3 0f 1e fa          	endbr64 
  801e42:	55                   	push   rbp
  801e43:	48 89 e5             	mov    rbp,rsp
  801e46:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    struct file* f=current->openf[fno];
  801e49:	48 8b 05 50 26 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc12650]        # 4144a0 <current>
  801e50:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  801e53:	48 63 d2             	movsxd rdx,edx
  801e56:	48 83 c2 18          	add    rdx,0x18
  801e5a:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  801e5f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return f->position;
  801e63:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801e67:	48 8b 00             	mov    rax,QWORD PTR [rax]
}
  801e6a:	5d                   	pop    rbp
  801e6b:	c3                   	ret    

0000000000801e6c <get_vfs_entry>:
vfs_dir_entry *get_vfs_entry(int fno)
{
  801e6c:	f3 0f 1e fa          	endbr64 
  801e70:	55                   	push   rbp
  801e71:	48 89 e5             	mov    rbp,rsp
  801e74:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801e77:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801e7e:	eb 3f                	jmp    801ebf <get_vfs_entry+0x53>
    {
        if(opened[i].fno==fno)
  801e80:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801e83:	48 63 d0             	movsxd rdx,eax
  801e86:	48 89 d0             	mov    rax,rdx
  801e89:	48 01 c0             	add    rax,rax
  801e8c:	48 01 d0             	add    rax,rdx
  801e8f:	48 c1 e0 05          	shl    rax,0x5
  801e93:	48 05 60 06 40 00    	add    rax,0x400660
  801e99:	8b 00                	mov    eax,DWORD PTR [rax]
  801e9b:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801e9e:	75 1b                	jne    801ebb <get_vfs_entry+0x4f>
        {
            return &opened[i];
  801ea0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ea3:	48 63 d0             	movsxd rdx,eax
  801ea6:	48 89 d0             	mov    rax,rdx
  801ea9:	48 01 c0             	add    rax,rax
  801eac:	48 01 d0             	add    rax,rdx
  801eaf:	48 c1 e0 05          	shl    rax,0x5
  801eb3:	48 05 60 06 40 00    	add    rax,0x400660
  801eb9:	eb 0f                	jmp    801eca <get_vfs_entry+0x5e>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801ebb:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801ebf:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  801ec3:	7e bb                	jle    801e80 <get_vfs_entry+0x14>
        }
    }
    return NULL;
  801ec5:	b8 00 00 00 00       	mov    eax,0x0
}
  801eca:	5d                   	pop    rbp
  801ecb:	c3                   	ret    

0000000000801ecc <brelse>:

//释放缓冲区（只释放这一块）
int brelse(buffer_head* bh)
{
  801ecc:	f3 0f 1e fa          	endbr64 
  801ed0:	55                   	push   rbp
  801ed1:	48 89 e5             	mov    rbp,rsp
  801ed4:	48 83 ec 10          	sub    rsp,0x10
  801ed8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    wait_on_buf(bh);
  801edc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801ee0:	48 89 c7             	mov    rdi,rax
  801ee3:	e8 a0 04 00 00       	call   802388 <wait_on_buf>
    if(bh->b_count==0)return -1;
  801ee8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801eec:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801ef0:	84 c0                	test   al,al
  801ef2:	75 07                	jne    801efb <brelse+0x2f>
  801ef4:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801ef9:	eb 32                	jmp    801f2d <brelse+0x61>
    bh->b_count--;
  801efb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801eff:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801f03:	8d 50 ff             	lea    edx,[rax-0x1]
  801f06:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f0a:	88 50 14             	mov    BYTE PTR [rax+0x14],dl
    if(bh->b_count==0)
  801f0d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f11:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801f15:	84 c0                	test   al,al
  801f17:	75 0f                	jne    801f28 <brelse+0x5c>
        vmfree(bh->b_data);
  801f19:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f1d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801f20:	48 89 c7             	mov    rdi,rax
  801f23:	e8 31 f4 ff ff       	call   801359 <vmfree>
    return 0;
  801f28:	b8 00 00 00 00       	mov    eax,0x0
}
  801f2d:	c9                   	leave  
  801f2e:	c3                   	ret    

0000000000801f2f <bread>:
//从设备中读取指定设备的指定块并返回缓冲区
buffer_head* bread(int dev,int blk)
{
  801f2f:	f3 0f 1e fa          	endbr64 
  801f33:	55                   	push   rbp
  801f34:	48 89 e5             	mov    rbp,rsp
  801f37:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  801f3e:	89 bd 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],edi
  801f44:	89 b5 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],esi

    buffer_head *bh=get_buf(dev,blk);
  801f4a:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  801f50:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  801f56:	89 d6                	mov    esi,edx
  801f58:	89 c7                	mov    edi,eax
  801f5a:	e8 78 02 00 00       	call   8021d7 <get_buf>
  801f5f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!bh)return -1;//申请失败
  801f63:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  801f68:	75 09                	jne    801f73 <bread+0x44>
  801f6a:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  801f71:	eb 75                	jmp    801fe8 <bread+0xb9>
    if(!bh->b_uptodate)
  801f73:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f77:	0f b6 40 12          	movzx  eax,BYTE PTR [rax+0x12]
  801f7b:	84 c0                	test   al,al
  801f7d:	75 65                	jne    801fe4 <bread+0xb5>
    {
        driver_args arg;
        arg.dev=dev;
  801f7f:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  801f85:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
        arg.cmd=DRVF_READ;
  801f88:	c7 45 d8 02 00 00 00 	mov    DWORD PTR [rbp-0x28],0x2
        arg.dist_addr=bh->b_data;
  801f8f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f93:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801f96:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.len=BLOCK_SIZE;
  801f9c:	c7 85 48 ff ff ff 00 	mov    DWORD PTR [rbp-0xb8],0x200
  801fa3:	02 00 00 
        arg.lba=bh->b_blocknr;
  801fa6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801faa:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  801fae:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
        arg.sec_c=BLOCK_SIZE/512;//之后会改
  801fb4:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  801fbb:	00 00 00 
        //lock_buffer(bh);//锁定缓冲块直到读取完成
        int reqi=make_request(&arg);
  801fbe:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  801fc5:	48 89 c7             	mov    rdi,rax
  801fc8:	e8 71 11 00 00       	call   80313e <make_request>
  801fcd:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        wait_on_req(reqi);
  801fd0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801fd3:	89 c7                	mov    edi,eax
  801fd5:	e8 77 14 00 00       	call   803451 <wait_on_req>
        clear_req(reqi);
  801fda:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801fdd:	89 c7                	mov    edi,eax
  801fdf:	e8 9d 14 00 00       	call   803481 <clear_req>
    }
    return bh;
  801fe4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  801fe8:	c9                   	leave  
  801fe9:	c3                   	ret    

0000000000801fea <vfs_read_file>:


int vfs_read_file(vfs_dir_entry *f,char *buf,int len)
{
  801fea:	f3 0f 1e fa          	endbr64 
  801fee:	55                   	push   rbp
  801fef:	48 89 e5             	mov    rbp,rsp
  801ff2:	48 83 ec 40          	sub    rsp,0x40
  801ff6:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  801ffa:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  801ffe:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  802001:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802005:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  802008:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  80200b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80200f:	48 89 c7             	mov    rdi,rax
  802012:	e8 80 01 00 00       	call   802197 <get_according_bnr>
  802017:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=bread(dev,block);
  80201a:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  80201d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802020:	89 d6                	mov    esi,edx
  802022:	89 c7                	mov    edi,eax
  802024:	e8 06 ff ff ff       	call   801f2f <bread>
  802029:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  80202d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  802030:	ba 00 02 00 00       	mov    edx,0x200
  802035:	39 d0                	cmp    eax,edx
  802037:	0f 4f c2             	cmovg  eax,edx
  80203a:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(buf,bh->b_data,size);
  80203d:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  802040:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802044:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802047:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80204b:	48 89 ce             	mov    rsi,rcx
  80204e:	48 89 c7             	mov    rdi,rax
  802051:	e8 4b 9a 00 00       	call   80baa1 <memcpy>
        len-=BLOCK_SIZE;
  802056:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  80205d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802061:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  802064:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802067:	01 c2                	add    edx,eax
  802069:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80206d:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        brelse(bh);
  802070:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802074:	48 89 c7             	mov    rdi,rax
  802077:	e8 50 fe ff ff       	call   801ecc <brelse>
    }while(len>0);
  80207c:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  802080:	7f 89                	jg     80200b <vfs_read_file+0x21>
    return 0;
  802082:	b8 00 00 00 00       	mov    eax,0x0
}
  802087:	c9                   	leave  
  802088:	c3                   	ret    

0000000000802089 <vfs_write_file>:
int vfs_write_file(vfs_dir_entry *f,char *buf,int len)
{
  802089:	f3 0f 1e fa          	endbr64 
  80208d:	55                   	push   rbp
  80208e:	48 89 e5             	mov    rbp,rsp
  802091:	48 83 ec 40          	sub    rsp,0x40
  802095:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  802099:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  80209d:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  8020a0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8020a4:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  8020a7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  8020aa:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8020ae:	48 89 c7             	mov    rdi,rax
  8020b1:	e8 e1 00 00 00       	call   802197 <get_according_bnr>
  8020b6:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=get_buf(dev,block);
  8020b9:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  8020bc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8020bf:	89 d6                	mov    esi,edx
  8020c1:	89 c7                	mov    edi,eax
  8020c3:	e8 0f 01 00 00       	call   8021d7 <get_buf>
  8020c8:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  8020cc:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8020cf:	ba 00 02 00 00       	mov    edx,0x200
  8020d4:	39 d0                	cmp    eax,edx
  8020d6:	0f 4f c2             	cmovg  eax,edx
  8020d9:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(bh->b_data,buf,size);
  8020dc:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8020df:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8020e3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8020e6:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  8020ea:	48 89 ce             	mov    rsi,rcx
  8020ed:	48 89 c7             	mov    rdi,rax
  8020f0:	e8 ac 99 00 00       	call   80baa1 <memcpy>
        len-=BLOCK_SIZE;
  8020f5:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  8020fc:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802100:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  802103:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802106:	01 c2                	add    edx,eax
  802108:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80210c:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        bh->b_dirt=1;//修改置位
  80210f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802113:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  802117:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80211b:	48 89 c7             	mov    rdi,rax
  80211e:	e8 a9 fd ff ff       	call   801ecc <brelse>
    }while(len>0);
  802123:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  802127:	7f 81                	jg     8020aa <vfs_write_file+0x21>
    return 0;
  802129:	b8 00 00 00 00       	mov    eax,0x0
}
  80212e:	c9                   	leave  
  80212f:	c3                   	ret    

0000000000802130 <vfs_seek_file>:

int vfs_seek_file(vfs_dir_entry *f,int offset,int origin)
{
  802130:	f3 0f 1e fa          	endbr64 
  802134:	55                   	push   rbp
  802135:	48 89 e5             	mov    rbp,rsp
  802138:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80213c:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  80213f:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    switch (origin)
  802142:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  802146:	74 35                	je     80217d <vfs_seek_file+0x4d>
  802148:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  80214c:	7f 3f                	jg     80218d <vfs_seek_file+0x5d>
  80214e:	83 7d f0 00          	cmp    DWORD PTR [rbp-0x10],0x0
  802152:	74 08                	je     80215c <vfs_seek_file+0x2c>
  802154:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  802158:	74 0e                	je     802168 <vfs_seek_file+0x38>
        break;
    case SEEK_END:
        f->ptr=f->size;
        break;
    default:
        break;
  80215a:	eb 31                	jmp    80218d <vfs_seek_file+0x5d>
        f->ptr=offset;
  80215c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802160:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802163:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  802166:	eb 26                	jmp    80218e <vfs_seek_file+0x5e>
        f->ptr+=offset;
  802168:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80216c:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  80216f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802172:	01 c2                	add    edx,eax
  802174:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802178:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  80217b:	eb 11                	jmp    80218e <vfs_seek_file+0x5e>
        f->ptr=f->size;
  80217d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802181:	8b 50 18             	mov    edx,DWORD PTR [rax+0x18]
  802184:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802188:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  80218b:	eb 01                	jmp    80218e <vfs_seek_file+0x5e>
        break;
  80218d:	90                   	nop
    }
    return f->ptr;
  80218e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802192:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  802195:	5d                   	pop    rbp
  802196:	c3                   	ret    

0000000000802197 <get_according_bnr>:
//返回文件ptr在块设备中的块号
int get_according_bnr(vfs_dir_entry *f)
{
  802197:	f3 0f 1e fa          	endbr64 
  80219b:	55                   	push   rbp
  80219c:	48 89 e5             	mov    rbp,rsp
  80219f:	48 83 ec 10          	sub    rsp,0x10
  8021a3:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return vols[f->voln].fs->get_according_bnr(f);
  8021a7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021ab:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8021ae:	48 63 d0             	movsxd rdx,eax
  8021b1:	48 89 d0             	mov    rax,rdx
  8021b4:	48 c1 e0 02          	shl    rax,0x2
  8021b8:	48 01 d0             	add    rax,rdx
  8021bb:	48 c1 e0 03          	shl    rax,0x3
  8021bf:	48 05 58 02 40 00    	add    rax,0x400258
  8021c5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8021c8:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  8021cc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021d0:	48 89 c7             	mov    rdi,rax
  8021d3:	ff d2                	call   rdx

}
  8021d5:	c9                   	leave  
  8021d6:	c3                   	ret    

00000000008021d7 <get_buf>:
//获取或者新建一个和dev上block相对应的缓冲区。
buffer_head* get_buf(int dev,int block)
{
  8021d7:	f3 0f 1e fa          	endbr64 
  8021db:	55                   	push   rbp
  8021dc:	48 89 e5             	mov    rbp,rsp
  8021df:	48 83 ec 20          	sub    rsp,0x20
  8021e3:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8021e6:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8021e9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8021f0:	e9 b9 00 00 00       	jmp    8022ae <get_buf+0xd7>
    {
        if(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block)
  8021f5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8021f8:	48 98                	cdqe   
  8021fa:	48 c1 e0 06          	shl    rax,0x6
  8021fe:	48 05 90 26 40 00    	add    rax,0x402690
  802204:	0f b7 00             	movzx  eax,WORD PTR [rax]
  802207:	0f b7 c0             	movzx  eax,ax
  80220a:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80220d:	0f 85 97 00 00 00    	jne    8022aa <get_buf+0xd3>
  802213:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802216:	48 98                	cdqe   
  802218:	48 c1 e0 06          	shl    rax,0x6
  80221c:	48 05 88 26 40 00    	add    rax,0x402688
  802222:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802225:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802228:	48 98                	cdqe   
  80222a:	48 39 c2             	cmp    rdx,rax
  80222d:	75 7b                	jne    8022aa <get_buf+0xd3>
        {
            repeat:
  80222f:	90                   	nop
            wait_on_buf(&buffer_heads[i]);//等待解锁
  802230:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802233:	48 98                	cdqe   
  802235:	48 c1 e0 06          	shl    rax,0x6
  802239:	48 05 80 26 40 00    	add    rax,0x402680
  80223f:	48 89 c7             	mov    rdi,rax
  802242:	e8 41 01 00 00       	call   802388 <wait_on_buf>
            if(buffer_heads[i].b_count>0)//别的进程正在用
  802247:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80224a:	48 98                	cdqe   
  80224c:	48 c1 e0 06          	shl    rax,0x6
  802250:	48 05 94 26 40 00    	add    rax,0x402694
  802256:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802259:	84 c0                	test   al,al
  80225b:	74 02                	je     80225f <get_buf+0x88>
                goto repeat;
  80225d:	eb d1                	jmp    802230 <get_buf+0x59>
            if(!(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block))//别的进程修改了
  80225f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802262:	48 98                	cdqe   
  802264:	48 c1 e0 06          	shl    rax,0x6
  802268:	48 05 90 26 40 00    	add    rax,0x402690
  80226e:	0f b7 00             	movzx  eax,WORD PTR [rax]
  802271:	0f b7 c0             	movzx  eax,ax
  802274:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  802277:	75 30                	jne    8022a9 <get_buf+0xd2>
  802279:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80227c:	48 98                	cdqe   
  80227e:	48 c1 e0 06          	shl    rax,0x6
  802282:	48 05 88 26 40 00    	add    rax,0x402688
  802288:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80228b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80228e:	48 98                	cdqe   
  802290:	48 39 c2             	cmp    rdx,rax
  802293:	75 14                	jne    8022a9 <get_buf+0xd2>
                continue;
            return &buffer_heads[i];
  802295:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802298:	48 98                	cdqe   
  80229a:	48 c1 e0 06          	shl    rax,0x6
  80229e:	48 05 80 26 40 00    	add    rax,0x402680
  8022a4:	e9 dd 00 00 00       	jmp    802386 <get_buf+0x1af>
                continue;
  8022a9:	90                   	nop
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8022aa:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8022ae:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  8022b2:	0f 8e 3d ff ff ff    	jle    8021f5 <get_buf+0x1e>
        }
    }
    //空头中找
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8022b8:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8022bf:	e9 b8 00 00 00       	jmp    80237c <get_buf+0x1a5>
    {
        if(buffer_heads[i].b_count==0)
  8022c4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8022c7:	48 98                	cdqe   
  8022c9:	48 c1 e0 06          	shl    rax,0x6
  8022cd:	48 05 94 26 40 00    	add    rax,0x402694
  8022d3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8022d6:	84 c0                	test   al,al
  8022d8:	0f 85 9a 00 00 00    	jne    802378 <get_buf+0x1a1>
        {
            if(buffer_heads[i].b_dirt)
  8022de:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8022e1:	48 98                	cdqe   
  8022e3:	48 c1 e0 06          	shl    rax,0x6
  8022e7:	48 05 93 26 40 00    	add    rax,0x402693
  8022ed:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8022f0:	84 c0                	test   al,al
  8022f2:	74 2e                	je     802322 <get_buf+0x14b>
            {
                sync_buf(&buffer_heads[i]);
  8022f4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8022f7:	48 98                	cdqe   
  8022f9:	48 c1 e0 06          	shl    rax,0x6
  8022fd:	48 05 80 26 40 00    	add    rax,0x402680
  802303:	48 89 c7             	mov    rdi,rax
  802306:	e8 1b 01 00 00       	call   802426 <sync_buf>
                wait_on_buf(&buffer_heads[i]);
  80230b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80230e:	48 98                	cdqe   
  802310:	48 c1 e0 06          	shl    rax,0x6
  802314:	48 05 80 26 40 00    	add    rax,0x402680
  80231a:	48 89 c7             	mov    rdi,rax
  80231d:	e8 66 00 00 00       	call   802388 <wait_on_buf>
            }
            buffer_heads[i].b_count++;
  802322:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802325:	48 98                	cdqe   
  802327:	48 c1 e0 06          	shl    rax,0x6
  80232b:	48 05 94 26 40 00    	add    rax,0x402694
  802331:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802334:	8d 50 01             	lea    edx,[rax+0x1]
  802337:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80233a:	48 98                	cdqe   
  80233c:	48 c1 e0 06          	shl    rax,0x6
  802340:	48 05 94 26 40 00    	add    rax,0x402694
  802346:	88 10                	mov    BYTE PTR [rax],dl
            //给buffer分配一个实际的缓冲区
            buffer_heads[i].b_data=vmalloc();
  802348:	b8 00 00 00 00       	mov    eax,0x0
  80234d:	e8 78 ef ff ff       	call   8012ca <vmalloc>
  802352:	48 89 c2             	mov    rdx,rax
  802355:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802358:	48 98                	cdqe   
  80235a:	48 c1 e0 06          	shl    rax,0x6
  80235e:	48 05 80 26 40 00    	add    rax,0x402680
  802364:	48 89 10             	mov    QWORD PTR [rax],rdx
            return &buffer_heads[i];
  802367:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80236a:	48 98                	cdqe   
  80236c:	48 c1 e0 06          	shl    rax,0x6
  802370:	48 05 80 26 40 00    	add    rax,0x402680
  802376:	eb 0e                	jmp    802386 <get_buf+0x1af>
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802378:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80237c:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  802380:	0f 8e 3e ff ff ff    	jle    8022c4 <get_buf+0xed>
        }
    }
}
  802386:	c9                   	leave  
  802387:	c3                   	ret    

0000000000802388 <wait_on_buf>:

void wait_on_buf(buffer_head* bh)
{
  802388:	f3 0f 1e fa          	endbr64 
  80238c:	55                   	push   rbp
  80238d:	48 89 e5             	mov    rbp,rsp
  802390:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    //等待缓冲区解锁
    while (bh->b_lock);
  802394:	90                   	nop
  802395:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802399:	0f b6 40 15          	movzx  eax,BYTE PTR [rax+0x15]
  80239d:	84 c0                	test   al,al
  80239f:	75 f4                	jne    802395 <wait_on_buf+0xd>
    
}
  8023a1:	90                   	nop
  8023a2:	90                   	nop
  8023a3:	5d                   	pop    rbp
  8023a4:	c3                   	ret    

00000000008023a5 <scan_dev>:

//扫描块设备，读取分区，识别文件系统
int scan_dev(int dev)
{
  8023a5:	f3 0f 1e fa          	endbr64 
  8023a9:	55                   	push   rbp
  8023aa:	48 89 e5             	mov    rbp,rsp
  8023ad:	48 83 ec 30          	sub    rsp,0x30
  8023b1:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
//    device *blkdev=get_dev(dev);
//    buffer_head* bh=bread(dev,0);
//    if(!bh)return -1;
    char* buf=vmalloc();
  8023b4:	b8 00 00 00 00       	mov    eax,0x0
  8023b9:	e8 0c ef ff ff       	call   8012ca <vmalloc>
  8023be:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    int r=request(DISK_MAJOR_MAJOR,DISK_CMD_READ,0,1,buf);
  8023c2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8023c6:	49 89 c0             	mov    r8,rax
  8023c9:	b9 01 00 00 00       	mov    ecx,0x1
  8023ce:	ba 00 00 00 00       	mov    edx,0x0
  8023d3:	be 20 00 00 00       	mov    esi,0x20
  8023d8:	bf 00 00 00 00       	mov    edi,0x0
  8023dd:	e8 49 5c 00 00       	call   80802b <request>
  8023e2:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    chk_result(r);
  8023e5:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8023e8:	89 c7                	mov    edi,eax
  8023ea:	e8 f0 62 00 00       	call   8086df <chk_result>

    dpt_t* dpte=buf+0x1be;
  8023ef:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8023f3:	48 05 be 01 00 00    	add    rax,0x1be
  8023f9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(int i=0;i<4;i++)
  8023fd:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  802404:	eb 13                	jmp    802419 <scan_dev+0x74>
    {
//        blkdev->par[i].type=dpte->type;
        int stlba=dpte->start_lba;
  802406:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80240a:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80240d:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
//        {
//            printf("err:unrecognised partition fs.\n");
//        }

//        blkdev->par[i].end_sec=dpte->end_lba;
        dpte++;
  802410:	48 83 45 f8 10       	add    QWORD PTR [rbp-0x8],0x10
    for(int i=0;i<4;i++)
  802415:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802419:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  80241d:	7e e7                	jle    802406 <scan_dev+0x61>
    }
//    brelse(bh);
    return 0;
  80241f:	b8 00 00 00 00       	mov    eax,0x0
}
  802424:	c9                   	leave  
  802425:	c3                   	ret    

0000000000802426 <sync_buf>:

int sync_buf(buffer_head* bh)
{
  802426:	f3 0f 1e fa          	endbr64 
  80242a:	55                   	push   rbp
  80242b:	48 89 e5             	mov    rbp,rsp
  80242e:	48 83 ec 20          	sub    rsp,0x20
  802432:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int dev=bh->b_dev;
  802436:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80243a:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
  80243e:	0f b7 c0             	movzx  eax,ax
  802441:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int block=bh->b_blocknr;
  802444:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802448:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80244c:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //这里需要调用块设备写函数write_block
    return write_block(dev,block,bh->b_data,BLOCK_SIZE);
  80244f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802453:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802456:	8b 75 f8             	mov    esi,DWORD PTR [rbp-0x8]
  802459:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80245c:	b9 00 02 00 00       	mov    ecx,0x200
  802461:	89 c7                	mov    edi,eax
  802463:	e8 02 00 00 00       	call   80246a <write_block>

}
  802468:	c9                   	leave  
  802469:	c3                   	ret    

000000000080246a <write_block>:
//操作块设备函数
int write_block(int dev,int block,char *buf,int len)
{
  80246a:	f3 0f 1e fa          	endbr64 
  80246e:	55                   	push   rbp
  80246f:	48 89 e5             	mov    rbp,rsp
  802472:	48 83 ec 30          	sub    rsp,0x30
  802476:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802479:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80247c:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  802480:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=get_buf(dev,block);
  802483:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802486:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802489:	89 d6                	mov    esi,edx
  80248b:	89 c7                	mov    edi,eax
  80248d:	e8 45 fd ff ff       	call   8021d7 <get_buf>
  802492:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802496:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  802499:	ba 00 02 00 00       	mov    edx,0x200
  80249e:	39 d0                	cmp    eax,edx
  8024a0:	0f 4f c2             	cmovg  eax,edx
  8024a3:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(bh->b_data,buf,size);
  8024a6:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8024a9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8024ad:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8024b0:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  8024b4:	48 89 ce             	mov    rsi,rcx
  8024b7:	48 89 c7             	mov    rdi,rax
  8024ba:	e8 e2 95 00 00       	call   80baa1 <memcpy>
        len-=BLOCK_SIZE;
  8024bf:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        bh->b_dirt=1;//修改置位
  8024c6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8024ca:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  8024ce:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8024d2:	48 89 c7             	mov    rdi,rax
  8024d5:	e8 f2 f9 ff ff       	call   801ecc <brelse>
    }while(len>0);
  8024da:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  8024de:	7f a3                	jg     802483 <write_block+0x19>
    return 0;
  8024e0:	b8 00 00 00 00       	mov    eax,0x0
}
  8024e5:	c9                   	leave  
  8024e6:	c3                   	ret    

00000000008024e7 <read_block>:
int read_block(int dev,int block,char* buf,int len)
{
  8024e7:	f3 0f 1e fa          	endbr64 
  8024eb:	55                   	push   rbp
  8024ec:	48 89 e5             	mov    rbp,rsp
  8024ef:	48 83 ec 30          	sub    rsp,0x30
  8024f3:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8024f6:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8024f9:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  8024fd:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=bread(dev,block);
  802500:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802503:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802506:	89 d6                	mov    esi,edx
  802508:	89 c7                	mov    edi,eax
  80250a:	e8 20 fa ff ff       	call   801f2f <bread>
  80250f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802513:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  802516:	ba 00 02 00 00       	mov    edx,0x200
  80251b:	39 d0                	cmp    eax,edx
  80251d:	0f 4f c2             	cmovg  eax,edx
  802520:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(buf,bh->b_data,size);
  802523:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802526:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80252a:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80252d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802531:	48 89 ce             	mov    rsi,rcx
  802534:	48 89 c7             	mov    rdi,rax
  802537:	e8 65 95 00 00       	call   80baa1 <memcpy>
        len-=BLOCK_SIZE;
  80253c:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        brelse(bh);
  802543:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802547:	48 89 c7             	mov    rdi,rax
  80254a:	e8 7d f9 ff ff       	call   801ecc <brelse>
    }while(len>0);
  80254f:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  802553:	7f ab                	jg     802500 <read_block+0x19>
    return 0;
  802555:	b8 00 00 00 00       	mov    eax,0x0
}
  80255a:	c9                   	leave  
  80255b:	c3                   	ret    

000000000080255c <init_vfs>:

int init_vfs()
{
  80255c:	f3 0f 1e fa          	endbr64 
  802560:	55                   	push   rbp
  802561:	48 89 e5             	mov    rbp,rsp
  802564:	48 83 ec 10          	sub    rsp,0x10
    //扫描块设备
    extern device *dev_tree[];
    extern device devs[];
    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
  802568:	48 8b 05 11 5f c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05f11]        # 408480 <dev_tree>
  80256f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(;p;p=p->next)
  802573:	eb 40                	jmp    8025b5 <init_vfs+0x59>
    {
        if(scan_dev(p-devs)!=0)return -1;
  802575:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802579:	48 2d 80 2e 40 00    	sub    rax,0x402e80
  80257f:	48 c1 f8 02          	sar    rax,0x2
  802583:	48 89 c2             	mov    rdx,rax
  802586:	48 b8 19 9c 8f c1 f9 	movabs rax,0x8f9c18f9c18f9c19
  80258d:	18 9c 8f 
  802590:	48 0f af c2          	imul   rax,rdx
  802594:	89 c7                	mov    edi,eax
  802596:	e8 0a fe ff ff       	call   8023a5 <scan_dev>
  80259b:	85 c0                	test   eax,eax
  80259d:	74 07                	je     8025a6 <init_vfs+0x4a>
  80259f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8025a4:	eb 1b                	jmp    8025c1 <init_vfs+0x65>
    for(;p;p=p->next)
  8025a6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8025aa:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  8025b1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  8025b5:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8025ba:	75 b9                	jne    802575 <init_vfs+0x19>
    }

    return 0;
  8025bc:	b8 00 00 00 00       	mov    eax,0x0
}
  8025c1:	c9                   	leave  
  8025c2:	c3                   	ret    

00000000008025c3 <init_drvdev_man>:
    [OPERATIONS_KEYBOARD]=NULL,
    [OPERATIONS_MOUSE]=NULL
};
static int rhead=0,rtail=0;
int init_drvdev_man()
{
  8025c3:	f3 0f 1e fa          	endbr64 
  8025c7:	55                   	push   rbp
  8025c8:	48 89 e5             	mov    rbp,rsp
}
  8025cb:	90                   	nop
  8025cc:	5d                   	pop    rbp
  8025cd:	c3                   	ret    

00000000008025ce <load_driver>:
int load_driver(char *path)
{
  8025ce:	f3 0f 1e fa          	endbr64 
  8025d2:	55                   	push   rbp
  8025d3:	48 89 e5             	mov    rbp,rsp
  8025d6:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    
}
  8025da:	90                   	nop
  8025db:	5d                   	pop    rbp
  8025dc:	c3                   	ret    

00000000008025dd <reg_device>:

int reg_device(device* dev)
{
  8025dd:	f3 0f 1e fa          	endbr64 
  8025e1:	55                   	push   rbp
  8025e2:	48 89 e5             	mov    rbp,rsp
  8025e5:	53                   	push   rbx
  8025e6:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //TODO:查重

    //放入数组
    int i=0;
  8025ea:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<MAX_DEVICES;i++)
  8025f1:	e9 42 01 00 00       	jmp    802738 <reg_device+0x15b>
    {
        if(devs[i].flag==DEV_FLAG_EMPTY)
  8025f6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8025f9:	48 63 d0             	movsxd rdx,eax
  8025fc:	48 89 d0             	mov    rax,rdx
  8025ff:	48 c1 e0 02          	shl    rax,0x2
  802603:	48 01 d0             	add    rax,rdx
  802606:	48 c1 e0 02          	shl    rax,0x2
  80260a:	48 01 d0             	add    rax,rdx
  80260d:	48 c1 e0 03          	shl    rax,0x3
  802611:	48 05 90 2e 40 00    	add    rax,0x402e90
  802617:	8b 00                	mov    eax,DWORD PTR [rax]
  802619:	85 c0                	test   eax,eax
  80261b:	0f 85 13 01 00 00    	jne    802734 <reg_device+0x157>
        {
            devs[i]=*dev;
  802621:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802624:	48 63 d0             	movsxd rdx,eax
  802627:	48 89 d0             	mov    rax,rdx
  80262a:	48 c1 e0 02          	shl    rax,0x2
  80262e:	48 01 d0             	add    rax,rdx
  802631:	48 c1 e0 02          	shl    rax,0x2
  802635:	48 01 d0             	add    rax,rdx
  802638:	48 c1 e0 03          	shl    rax,0x3
  80263c:	48 8d 90 80 2e 40 00 	lea    rdx,[rax+0x402e80]
  802643:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802647:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80264a:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  80264e:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802651:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802655:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802659:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  80265d:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802661:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802665:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802669:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  80266d:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802671:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802675:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802679:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  80267d:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802681:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802685:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802689:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  80268d:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802691:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802695:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802699:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  80269d:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  8026a1:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  8026a5:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  8026a9:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  8026ad:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  8026b1:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  8026b5:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  8026b9:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  8026bd:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  8026c1:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  8026c5:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  8026cc:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  8026d3:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  8026da:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  8026e1:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  8026e8:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  8026ef:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  8026f6:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  8026fd:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
  802704:	48 89 82 a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rax
            devs[i].flag=DEV_FLAG_USED;
  80270b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80270e:	48 63 d0             	movsxd rdx,eax
  802711:	48 89 d0             	mov    rax,rdx
  802714:	48 c1 e0 02          	shl    rax,0x2
  802718:	48 01 d0             	add    rax,rdx
  80271b:	48 c1 e0 02          	shl    rax,0x2
  80271f:	48 01 d0             	add    rax,rdx
  802722:	48 c1 e0 03          	shl    rax,0x3
  802726:	48 05 90 2e 40 00    	add    rax,0x402e90
  80272c:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            break;
  802732:	eb 0e                	jmp    802742 <reg_device+0x165>
    for(;i<MAX_DEVICES;i++)
  802734:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802738:	83 7d f4 3f          	cmp    DWORD PTR [rbp-0xc],0x3f
  80273c:	0f 8e b4 fe ff ff    	jle    8025f6 <reg_device+0x19>
        }
    }
    if(i==MAX_DEVICES)
  802742:	83 7d f4 40          	cmp    DWORD PTR [rbp-0xc],0x40
  802746:	75 0a                	jne    802752 <reg_device+0x175>
        return -1;
  802748:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80274d:	e9 6d 01 00 00       	jmp    8028bf <reg_device+0x2e2>
    //添加到链表
    device* p=NULL,*neo=&devs[i],**pp;
  802752:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  802759:	00 
  80275a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80275d:	48 63 d0             	movsxd rdx,eax
  802760:	48 89 d0             	mov    rax,rdx
  802763:	48 c1 e0 02          	shl    rax,0x2
  802767:	48 01 d0             	add    rax,rdx
  80276a:	48 c1 e0 02          	shl    rax,0x2
  80276e:	48 01 d0             	add    rax,rdx
  802771:	48 c1 e0 03          	shl    rax,0x3
  802775:	48 05 80 2e 40 00    	add    rax,0x402e80
  80277b:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    switch (dev->type)
  80277f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802783:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802786:	83 f8 03             	cmp    eax,0x3
  802789:	74 3b                	je     8027c6 <reg_device+0x1e9>
  80278b:	83 f8 03             	cmp    eax,0x3
  80278e:	7f 4b                	jg     8027db <reg_device+0x1fe>
  802790:	83 f8 01             	cmp    eax,0x1
  802793:	74 07                	je     80279c <reg_device+0x1bf>
  802795:	83 f8 02             	cmp    eax,0x2
  802798:	74 17                	je     8027b1 <reg_device+0x1d4>
  80279a:	eb 3f                	jmp    8027db <reg_device+0x1fe>
    {
    case DEV_TYPE_BLKDEV:
        p=dev_tree[DEVTREE_BLKDEVI];pp=&dev_tree[DEVTREE_BLKDEVI];
  80279c:	48 8b 05 dd 5c c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05cdd]        # 408480 <dev_tree>
  8027a3:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  8027a7:	48 c7 45 e0 80 84 40 	mov    QWORD PTR [rbp-0x20],0x408480
  8027ae:	00 
        break;
  8027af:	eb 34                	jmp    8027e5 <reg_device+0x208>
    
    case DEV_TYPE_CHRDEV:
        p=dev_tree[DEVTREE_CHRDEVI];pp=&dev_tree[DEVTREE_CHRDEVI];
  8027b1:	48 8b 05 d0 5c c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05cd0]        # 408488 <dev_tree+0x8>
  8027b8:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  8027bc:	48 c7 45 e0 88 84 40 	mov    QWORD PTR [rbp-0x20],0x408488
  8027c3:	00 
        break;
  8027c4:	eb 1f                	jmp    8027e5 <reg_device+0x208>
        
    case DEV_TYPE_OTHERS:
        p=dev_tree[DEVTREE_OTHERDEVI];pp=&dev_tree[DEVTREE_OTHERDEVI];
  8027c6:	48 8b 05 c3 5c c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05cc3]        # 408490 <dev_tree+0x10>
  8027cd:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  8027d1:	48 c7 45 e0 90 84 40 	mov    QWORD PTR [rbp-0x20],0x408490
  8027d8:	00 
        break;
  8027d9:	eb 0a                	jmp    8027e5 <reg_device+0x208>
    default:return -1;//不可能有其他情况
  8027db:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8027e0:	e9 da 00 00 00       	jmp    8028bf <reg_device+0x2e2>
    }
    if(!p){
  8027e5:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  8027ea:	75 2b                	jne    802817 <reg_device+0x23a>
        *pp=neo;
  8027ec:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8027f0:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8027f4:	48 89 10             	mov    QWORD PTR [rax],rdx
        neo->prev=NULL;
  8027f7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8027fb:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x0
  802802:	00 00 00 00 
  802806:	eb 3d                	jmp    802845 <reg_device+0x268>
    }
    else{
        for(;p->next;p=p->next);
  802808:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80280c:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802813:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802817:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80281b:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802822:	48 85 c0             	test   rax,rax
  802825:	75 e1                	jne    802808 <reg_device+0x22b>
        p->next=neo;
  802827:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80282b:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80282f:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
        neo->prev=p;
  802836:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80283a:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80283e:	48 89 90 98 00 00 00 	mov    QWORD PTR [rax+0x98],rdx
    }
    neo->next=NULL;
  802845:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802849:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x0
  802850:	00 00 00 00 
    //设置相应的请求函数
    switch (neo->stype)
  802854:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802858:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80285b:	83 f8 04             	cmp    eax,0x4
  80285e:	74 3b                	je     80289b <reg_device+0x2be>
  802860:	83 f8 04             	cmp    eax,0x4
  802863:	7f 56                	jg     8028bb <reg_device+0x2de>
  802865:	83 f8 03             	cmp    eax,0x3
  802868:	74 21                	je     80288b <reg_device+0x2ae>
  80286a:	83 f8 03             	cmp    eax,0x3
  80286d:	7f 4c                	jg     8028bb <reg_device+0x2de>
  80286f:	83 f8 01             	cmp    eax,0x1
  802872:	74 07                	je     80287b <reg_device+0x29e>
  802874:	83 f8 02             	cmp    eax,0x2
  802877:	74 32                	je     8028ab <reg_device+0x2ce>
        break;
    case DEV_STYPE_TTY:
        neo->operi=OPERATIONS_TTY;
        break;
    default:
        break;
  802879:	eb 40                	jmp    8028bb <reg_device+0x2de>
        neo->operi=OPERATIONS_HD;
  80287b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80287f:	c7 80 a0 00 00 00 00 	mov    DWORD PTR [rax+0xa0],0x0
  802886:	00 00 00 
        break;
  802889:	eb 31                	jmp    8028bc <reg_device+0x2df>
        neo->operi=OPERATIONS_MOUSE;
  80288b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80288f:	c7 80 a0 00 00 00 02 	mov    DWORD PTR [rax+0xa0],0x2
  802896:	00 00 00 
        break;
  802899:	eb 21                	jmp    8028bc <reg_device+0x2df>
        neo->operi=OPERATIONS_KEYBOARD;
  80289b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80289f:	c7 80 a0 00 00 00 03 	mov    DWORD PTR [rax+0xa0],0x3
  8028a6:	00 00 00 
        break;
  8028a9:	eb 11                	jmp    8028bc <reg_device+0x2df>
        neo->operi=OPERATIONS_TTY;
  8028ab:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8028af:	c7 80 a0 00 00 00 01 	mov    DWORD PTR [rax+0xa0],0x1
  8028b6:	00 00 00 
        break;
  8028b9:	eb 01                	jmp    8028bc <reg_device+0x2df>
        break;
  8028bb:	90                   	nop
    }
    return i;
  8028bc:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  8028bf:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8028c3:	c9                   	leave  
  8028c4:	c3                   	ret    

00000000008028c5 <reg_driver>:


int reg_driver(driver *drv)
{
  8028c5:	f3 0f 1e fa          	endbr64 
  8028c9:	55                   	push   rbp
  8028ca:	48 89 e5             	mov    rbp,rsp
  8028cd:	53                   	push   rbx
  8028ce:	48 89 7d e0          	mov    QWORD PTR [rbp-0x20],rdi
    for(int i=0;i<MAX_DRIVERS;i++)
  8028d2:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8028d9:	e9 22 01 00 00       	jmp    802a00 <reg_driver+0x13b>
    {
        if(drvs[i].flag==DRV_FLAG_EMPTY)
  8028de:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8028e1:	48 63 d0             	movsxd rdx,eax
  8028e4:	48 89 d0             	mov    rax,rdx
  8028e7:	48 c1 e0 02          	shl    rax,0x2
  8028eb:	48 01 d0             	add    rax,rdx
  8028ee:	48 c1 e0 05          	shl    rax,0x5
  8028f2:	48 05 80 58 40 00    	add    rax,0x405880
  8028f8:	8b 00                	mov    eax,DWORD PTR [rax]
  8028fa:	85 c0                	test   eax,eax
  8028fc:	0f 85 fa 00 00 00    	jne    8029fc <reg_driver+0x137>
        {
            drvs[i]=*drv;
  802902:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802905:	48 63 d0             	movsxd rdx,eax
  802908:	48 89 d0             	mov    rax,rdx
  80290b:	48 c1 e0 02          	shl    rax,0x2
  80290f:	48 01 d0             	add    rax,rdx
  802912:	48 c1 e0 05          	shl    rax,0x5
  802916:	48 8d 90 80 58 40 00 	lea    rdx,[rax+0x405880]
  80291d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802921:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802924:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802928:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  80292b:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  80292f:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802933:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802937:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  80293b:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  80293f:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802943:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802947:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  80294b:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  80294f:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802953:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802957:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  80295b:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  80295f:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802963:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802967:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  80296b:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  80296f:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802973:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802977:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  80297b:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  80297f:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802983:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802987:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  80298b:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  80298f:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802993:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802997:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  80299b:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  80299f:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  8029a6:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  8029ad:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  8029b4:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  8029bb:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  8029c2:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  8029c9:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  8029d0:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
            drvs[i].flag=DRV_FLAG_USED;
  8029d7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8029da:	48 63 d0             	movsxd rdx,eax
  8029dd:	48 89 d0             	mov    rax,rdx
  8029e0:	48 c1 e0 02          	shl    rax,0x2
  8029e4:	48 01 d0             	add    rax,rdx
  8029e7:	48 c1 e0 05          	shl    rax,0x5
  8029eb:	48 05 80 58 40 00    	add    rax,0x405880
  8029f1:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            return i;
  8029f7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8029fa:	eb 13                	jmp    802a0f <reg_driver+0x14a>
    for(int i=0;i<MAX_DRIVERS;i++)
  8029fc:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802a00:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  802a04:	0f 8e d4 fe ff ff    	jle    8028de <reg_driver+0x19>
        }
    }
    return -1;
  802a0a:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802a0f:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802a13:	c9                   	leave  
  802a14:	c3                   	ret    

0000000000802a15 <sys_find_dev>:

int sys_find_dev(char *name)
{
  802a15:	f3 0f 1e fa          	endbr64 
  802a19:	55                   	push   rbp
  802a1a:	48 89 e5             	mov    rbp,rsp
  802a1d:	48 83 ec 20          	sub    rsp,0x20
  802a21:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_DEVICES;i++)
  802a25:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802a2c:	eb 6c                	jmp    802a9a <sys_find_dev+0x85>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802a2e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802a31:	48 63 d0             	movsxd rdx,eax
  802a34:	48 89 d0             	mov    rax,rdx
  802a37:	48 c1 e0 02          	shl    rax,0x2
  802a3b:	48 01 d0             	add    rax,rdx
  802a3e:	48 c1 e0 02          	shl    rax,0x2
  802a42:	48 01 d0             	add    rax,rdx
  802a45:	48 c1 e0 03          	shl    rax,0x3
  802a49:	48 05 90 2e 40 00    	add    rax,0x402e90
  802a4f:	8b 00                	mov    eax,DWORD PTR [rax]
  802a51:	85 c0                	test   eax,eax
  802a53:	74 41                	je     802a96 <sys_find_dev+0x81>
  802a55:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802a58:	48 63 d0             	movsxd rdx,eax
  802a5b:	48 89 d0             	mov    rax,rdx
  802a5e:	48 c1 e0 02          	shl    rax,0x2
  802a62:	48 01 d0             	add    rax,rdx
  802a65:	48 c1 e0 02          	shl    rax,0x2
  802a69:	48 01 d0             	add    rax,rdx
  802a6c:	48 c1 e0 03          	shl    rax,0x3
  802a70:	48 83 c0 10          	add    rax,0x10
  802a74:	48 05 80 2e 40 00    	add    rax,0x402e80
  802a7a:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802a7e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802a82:	48 89 d6             	mov    rsi,rdx
  802a85:	48 89 c7             	mov    rdi,rax
  802a88:	e8 b2 92 00 00       	call   80bd3f <strcmp>
  802a8d:	85 c0                	test   eax,eax
  802a8f:	75 05                	jne    802a96 <sys_find_dev+0x81>
            return i;
  802a91:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802a94:	eb 0f                	jmp    802aa5 <sys_find_dev+0x90>
    for(int i=0;i<MAX_DEVICES;i++)
  802a96:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802a9a:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802a9e:	7e 8e                	jle    802a2e <sys_find_dev+0x19>
    }
    return -1;
  802aa0:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802aa5:	c9                   	leave  
  802aa6:	c3                   	ret    

0000000000802aa7 <sys_operate_dev>:

int sys_operate_dev(char *name,int func,driver_args* args)
{
  802aa7:	f3 0f 1e fa          	endbr64 
  802aab:	55                   	push   rbp
  802aac:	48 89 e5             	mov    rbp,rsp
  802aaf:	48 83 ec 30          	sub    rsp,0x30
  802ab3:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802ab7:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  802aba:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    int i=0;
  802abe:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;i<MAX_DEVICES;i++)
  802ac5:	eb 67                	jmp    802b2e <sys_operate_dev+0x87>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802ac7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802aca:	48 63 d0             	movsxd rdx,eax
  802acd:	48 89 d0             	mov    rax,rdx
  802ad0:	48 c1 e0 02          	shl    rax,0x2
  802ad4:	48 01 d0             	add    rax,rdx
  802ad7:	48 c1 e0 02          	shl    rax,0x2
  802adb:	48 01 d0             	add    rax,rdx
  802ade:	48 c1 e0 03          	shl    rax,0x3
  802ae2:	48 05 90 2e 40 00    	add    rax,0x402e90
  802ae8:	8b 00                	mov    eax,DWORD PTR [rax]
  802aea:	85 c0                	test   eax,eax
  802aec:	74 3c                	je     802b2a <sys_operate_dev+0x83>
  802aee:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802af1:	48 63 d0             	movsxd rdx,eax
  802af4:	48 89 d0             	mov    rax,rdx
  802af7:	48 c1 e0 02          	shl    rax,0x2
  802afb:	48 01 d0             	add    rax,rdx
  802afe:	48 c1 e0 02          	shl    rax,0x2
  802b02:	48 01 d0             	add    rax,rdx
  802b05:	48 c1 e0 03          	shl    rax,0x3
  802b09:	48 83 c0 10          	add    rax,0x10
  802b0d:	48 05 80 2e 40 00    	add    rax,0x402e80
  802b13:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802b17:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802b1b:	48 89 d6             	mov    rsi,rdx
  802b1e:	48 89 c7             	mov    rdi,rax
  802b21:	e8 19 92 00 00       	call   80bd3f <strcmp>
  802b26:	85 c0                	test   eax,eax
  802b28:	74 0c                	je     802b36 <sys_operate_dev+0x8f>
    for(;i<MAX_DEVICES;i++)
  802b2a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802b2e:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802b32:	7e 93                	jle    802ac7 <sys_operate_dev+0x20>
  802b34:	eb 01                	jmp    802b37 <sys_operate_dev+0x90>
            break;
  802b36:	90                   	nop
    }
    if(i==MAX_DEVICES)return -1;
  802b37:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  802b3b:	75 0a                	jne    802b47 <sys_operate_dev+0xa0>
  802b3d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802b42:	e9 9c 02 00 00       	jmp    802de3 <sys_operate_dev+0x33c>
    switch (func) {
  802b47:	83 7d e4 0b          	cmp    DWORD PTR [rbp-0x1c],0xb
  802b4b:	0f 87 8d 02 00 00    	ja     802dde <sys_operate_dev+0x337>
  802b51:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  802b54:	48 8b 04 c5 e8 3f 81 	mov    rax,QWORD PTR [rax*8+0x813fe8]
  802b5b:	00 
  802b5c:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return devs[i].drv->open(args);
  802b5f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802b62:	48 63 d0             	movsxd rdx,eax
  802b65:	48 89 d0             	mov    rax,rdx
  802b68:	48 c1 e0 02          	shl    rax,0x2
  802b6c:	48 01 d0             	add    rax,rdx
  802b6f:	48 c1 e0 02          	shl    rax,0x2
  802b73:	48 01 d0             	add    rax,rdx
  802b76:	48 c1 e0 03          	shl    rax,0x3
  802b7a:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802b80:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802b83:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  802b87:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802b8b:	48 89 c7             	mov    rdi,rax
  802b8e:	ff d2                	call   rdx
  802b90:	e9 4e 02 00 00       	jmp    802de3 <sys_operate_dev+0x33c>
        case DRVF_CLOSE:return devs[i].drv->close(args);
  802b95:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802b98:	48 63 d0             	movsxd rdx,eax
  802b9b:	48 89 d0             	mov    rax,rdx
  802b9e:	48 c1 e0 02          	shl    rax,0x2
  802ba2:	48 01 d0             	add    rax,rdx
  802ba5:	48 c1 e0 02          	shl    rax,0x2
  802ba9:	48 01 d0             	add    rax,rdx
  802bac:	48 c1 e0 03          	shl    rax,0x3
  802bb0:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802bb6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802bb9:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  802bbd:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802bc1:	48 89 c7             	mov    rdi,rax
  802bc4:	ff d2                	call   rdx
  802bc6:	e9 18 02 00 00       	jmp    802de3 <sys_operate_dev+0x33c>
        case DRVF_READ :return devs[i].drv->read(args);
  802bcb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802bce:	48 63 d0             	movsxd rdx,eax
  802bd1:	48 89 d0             	mov    rax,rdx
  802bd4:	48 c1 e0 02          	shl    rax,0x2
  802bd8:	48 01 d0             	add    rax,rdx
  802bdb:	48 c1 e0 02          	shl    rax,0x2
  802bdf:	48 01 d0             	add    rax,rdx
  802be2:	48 c1 e0 03          	shl    rax,0x3
  802be6:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802bec:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802bef:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  802bf3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802bf7:	48 89 c7             	mov    rdi,rax
  802bfa:	ff d2                	call   rdx
  802bfc:	e9 e2 01 00 00       	jmp    802de3 <sys_operate_dev+0x33c>
        case DRVF_WRITE:return devs[i].drv->write(args);
  802c01:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802c04:	48 63 d0             	movsxd rdx,eax
  802c07:	48 89 d0             	mov    rax,rdx
  802c0a:	48 c1 e0 02          	shl    rax,0x2
  802c0e:	48 01 d0             	add    rax,rdx
  802c11:	48 c1 e0 02          	shl    rax,0x2
  802c15:	48 01 d0             	add    rax,rdx
  802c18:	48 c1 e0 03          	shl    rax,0x3
  802c1c:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802c22:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802c25:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  802c29:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c2d:	48 89 c7             	mov    rdi,rax
  802c30:	ff d2                	call   rdx
  802c32:	e9 ac 01 00 00       	jmp    802de3 <sys_operate_dev+0x33c>
        case DRVF_CHK  :return devs[i].drv->check(args);
  802c37:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802c3a:	48 63 d0             	movsxd rdx,eax
  802c3d:	48 89 d0             	mov    rax,rdx
  802c40:	48 c1 e0 02          	shl    rax,0x2
  802c44:	48 01 d0             	add    rax,rdx
  802c47:	48 c1 e0 02          	shl    rax,0x2
  802c4b:	48 01 d0             	add    rax,rdx
  802c4e:	48 c1 e0 03          	shl    rax,0x3
  802c52:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802c58:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802c5b:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  802c5f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c63:	48 89 c7             	mov    rdi,rax
  802c66:	ff d2                	call   rdx
  802c68:	e9 76 01 00 00       	jmp    802de3 <sys_operate_dev+0x33c>
        case DRVF_RSVD :return devs[i].drv->reserved(args);
  802c6d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802c70:	48 63 d0             	movsxd rdx,eax
  802c73:	48 89 d0             	mov    rax,rdx
  802c76:	48 c1 e0 02          	shl    rax,0x2
  802c7a:	48 01 d0             	add    rax,rdx
  802c7d:	48 c1 e0 02          	shl    rax,0x2
  802c81:	48 01 d0             	add    rax,rdx
  802c84:	48 c1 e0 03          	shl    rax,0x3
  802c88:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802c8e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802c91:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
  802c95:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c99:	48 89 c7             	mov    rdi,rax
  802c9c:	ff d2                	call   rdx
  802c9e:	e9 40 01 00 00       	jmp    802de3 <sys_operate_dev+0x33c>
        case DRVF_INT  :return devs[i].drv->inthandler(args);
  802ca3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802ca6:	48 63 d0             	movsxd rdx,eax
  802ca9:	48 89 d0             	mov    rax,rdx
  802cac:	48 c1 e0 02          	shl    rax,0x2
  802cb0:	48 01 d0             	add    rax,rdx
  802cb3:	48 c1 e0 02          	shl    rax,0x2
  802cb7:	48 01 d0             	add    rax,rdx
  802cba:	48 c1 e0 03          	shl    rax,0x3
  802cbe:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802cc4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802cc7:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
  802ccb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802ccf:	48 89 c7             	mov    rdi,rax
  802cd2:	ff d2                	call   rdx
  802cd4:	e9 0a 01 00 00       	jmp    802de3 <sys_operate_dev+0x33c>
        case DRVF_FIND :return devs[i].drv->find(args);
  802cd9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802cdc:	48 63 d0             	movsxd rdx,eax
  802cdf:	48 89 d0             	mov    rax,rdx
  802ce2:	48 c1 e0 02          	shl    rax,0x2
  802ce6:	48 01 d0             	add    rax,rdx
  802ce9:	48 c1 e0 02          	shl    rax,0x2
  802ced:	48 01 d0             	add    rax,rdx
  802cf0:	48 c1 e0 03          	shl    rax,0x3
  802cf4:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802cfa:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802cfd:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  802d01:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d05:	48 89 c7             	mov    rdi,rax
  802d08:	ff d2                	call   rdx
  802d0a:	e9 d4 00 00 00       	jmp    802de3 <sys_operate_dev+0x33c>
        case DRVF_RM   :return devs[i].drv->rm(args);
  802d0f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802d12:	48 63 d0             	movsxd rdx,eax
  802d15:	48 89 d0             	mov    rax,rdx
  802d18:	48 c1 e0 02          	shl    rax,0x2
  802d1c:	48 01 d0             	add    rax,rdx
  802d1f:	48 c1 e0 02          	shl    rax,0x2
  802d23:	48 01 d0             	add    rax,rdx
  802d26:	48 c1 e0 03          	shl    rax,0x3
  802d2a:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802d30:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802d33:	48 8b 50 48          	mov    rdx,QWORD PTR [rax+0x48]
  802d37:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d3b:	48 89 c7             	mov    rdi,rax
  802d3e:	ff d2                	call   rdx
  802d40:	e9 9e 00 00 00       	jmp    802de3 <sys_operate_dev+0x33c>
        case DRVF_TOUCH:return devs[i].drv->touch(args);
  802d45:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802d48:	48 63 d0             	movsxd rdx,eax
  802d4b:	48 89 d0             	mov    rax,rdx
  802d4e:	48 c1 e0 02          	shl    rax,0x2
  802d52:	48 01 d0             	add    rax,rdx
  802d55:	48 c1 e0 02          	shl    rax,0x2
  802d59:	48 01 d0             	add    rax,rdx
  802d5c:	48 c1 e0 03          	shl    rax,0x3
  802d60:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802d66:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802d69:	48 8b 50 50          	mov    rdx,QWORD PTR [rax+0x50]
  802d6d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d71:	48 89 c7             	mov    rdi,rax
  802d74:	ff d2                	call   rdx
  802d76:	eb 6b                	jmp    802de3 <sys_operate_dev+0x33c>
        case DRVF_MKDIR:return devs[i].drv->mkdir(args);
  802d78:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802d7b:	48 63 d0             	movsxd rdx,eax
  802d7e:	48 89 d0             	mov    rax,rdx
  802d81:	48 c1 e0 02          	shl    rax,0x2
  802d85:	48 01 d0             	add    rax,rdx
  802d88:	48 c1 e0 02          	shl    rax,0x2
  802d8c:	48 01 d0             	add    rax,rdx
  802d8f:	48 c1 e0 03          	shl    rax,0x3
  802d93:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802d99:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802d9c:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  802da0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802da4:	48 89 c7             	mov    rdi,rax
  802da7:	ff d2                	call   rdx
  802da9:	eb 38                	jmp    802de3 <sys_operate_dev+0x33c>
        case DRVF_LS:return    devs[i].drv->ls(args);
  802dab:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802dae:	48 63 d0             	movsxd rdx,eax
  802db1:	48 89 d0             	mov    rax,rdx
  802db4:	48 c1 e0 02          	shl    rax,0x2
  802db8:	48 01 d0             	add    rax,rdx
  802dbb:	48 c1 e0 02          	shl    rax,0x2
  802dbf:	48 01 d0             	add    rax,rdx
  802dc2:	48 c1 e0 03          	shl    rax,0x3
  802dc6:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802dcc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802dcf:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
  802dd3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802dd7:	48 89 c7             	mov    rdi,rax
  802dda:	ff d2                	call   rdx
  802ddc:	eb 05                	jmp    802de3 <sys_operate_dev+0x33c>
    }
    return -1;
  802dde:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802de3:	c9                   	leave  
  802de4:	c3                   	ret    

0000000000802de5 <call_drv_func>:
int call_drv_func(int drv_n,int func_n,driver_args *args)
{
  802de5:	f3 0f 1e fa          	endbr64 
  802de9:	55                   	push   rbp
  802dea:	48 89 e5             	mov    rbp,rsp
  802ded:	48 83 ec 10          	sub    rsp,0x10
  802df1:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  802df4:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  802df7:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    if(drvs[drv_n].flag==DRV_FLAG_EMPTY)return -1;
  802dfb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802dfe:	48 63 d0             	movsxd rdx,eax
  802e01:	48 89 d0             	mov    rax,rdx
  802e04:	48 c1 e0 02          	shl    rax,0x2
  802e08:	48 01 d0             	add    rax,rdx
  802e0b:	48 c1 e0 05          	shl    rax,0x5
  802e0f:	48 05 80 58 40 00    	add    rax,0x405880
  802e15:	8b 00                	mov    eax,DWORD PTR [rax]
  802e17:	85 c0                	test   eax,eax
  802e19:	75 0a                	jne    802e25 <call_drv_func+0x40>
  802e1b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802e20:	e9 15 02 00 00       	jmp    80303a <call_drv_func+0x255>
    /*driverfunc f=drvs[drv_n].func_thunk[func_n];
    return f(args);*/
    switch (func_n) {
  802e25:	83 7d f8 0b          	cmp    DWORD PTR [rbp-0x8],0xb
  802e29:	0f 87 06 02 00 00    	ja     803035 <call_drv_func+0x250>
  802e2f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802e32:	48 8b 04 c5 48 40 81 	mov    rax,QWORD PTR [rax*8+0x814048]
  802e39:	00 
  802e3a:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return drvs[drv_n].open(args);
  802e3d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802e40:	48 63 d0             	movsxd rdx,eax
  802e43:	48 89 d0             	mov    rax,rdx
  802e46:	48 c1 e0 02          	shl    rax,0x2
  802e4a:	48 01 d0             	add    rax,rdx
  802e4d:	48 c1 e0 05          	shl    rax,0x5
  802e51:	48 05 88 58 40 00    	add    rax,0x405888
  802e57:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802e5a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802e5e:	48 89 c7             	mov    rdi,rax
  802e61:	ff d2                	call   rdx
  802e63:	e9 d2 01 00 00       	jmp    80303a <call_drv_func+0x255>
        case DRVF_CLOSE:return drvs[drv_n].close(args);
  802e68:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802e6b:	48 63 d0             	movsxd rdx,eax
  802e6e:	48 89 d0             	mov    rax,rdx
  802e71:	48 c1 e0 02          	shl    rax,0x2
  802e75:	48 01 d0             	add    rax,rdx
  802e78:	48 c1 e0 05          	shl    rax,0x5
  802e7c:	48 05 90 58 40 00    	add    rax,0x405890
  802e82:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802e85:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802e89:	48 89 c7             	mov    rdi,rax
  802e8c:	ff d2                	call   rdx
  802e8e:	e9 a7 01 00 00       	jmp    80303a <call_drv_func+0x255>
        case DRVF_READ :return drvs[drv_n].read(args);
  802e93:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802e96:	48 63 d0             	movsxd rdx,eax
  802e99:	48 89 d0             	mov    rax,rdx
  802e9c:	48 c1 e0 02          	shl    rax,0x2
  802ea0:	48 01 d0             	add    rax,rdx
  802ea3:	48 c1 e0 05          	shl    rax,0x5
  802ea7:	48 05 98 58 40 00    	add    rax,0x405898
  802ead:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802eb0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802eb4:	48 89 c7             	mov    rdi,rax
  802eb7:	ff d2                	call   rdx
  802eb9:	e9 7c 01 00 00       	jmp    80303a <call_drv_func+0x255>
        case DRVF_WRITE:return drvs[drv_n].write(args);
  802ebe:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802ec1:	48 63 d0             	movsxd rdx,eax
  802ec4:	48 89 d0             	mov    rax,rdx
  802ec7:	48 c1 e0 02          	shl    rax,0x2
  802ecb:	48 01 d0             	add    rax,rdx
  802ece:	48 c1 e0 05          	shl    rax,0x5
  802ed2:	48 05 a0 58 40 00    	add    rax,0x4058a0
  802ed8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802edb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802edf:	48 89 c7             	mov    rdi,rax
  802ee2:	ff d2                	call   rdx
  802ee4:	e9 51 01 00 00       	jmp    80303a <call_drv_func+0x255>
        case DRVF_CHK  :return drvs[drv_n].check(args);
  802ee9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802eec:	48 63 d0             	movsxd rdx,eax
  802eef:	48 89 d0             	mov    rax,rdx
  802ef2:	48 c1 e0 02          	shl    rax,0x2
  802ef6:	48 01 d0             	add    rax,rdx
  802ef9:	48 c1 e0 05          	shl    rax,0x5
  802efd:	48 05 a8 58 40 00    	add    rax,0x4058a8
  802f03:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802f06:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802f0a:	48 89 c7             	mov    rdi,rax
  802f0d:	ff d2                	call   rdx
  802f0f:	e9 26 01 00 00       	jmp    80303a <call_drv_func+0x255>
        case DRVF_RSVD :return drvs[drv_n].reserved(args);
  802f14:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f17:	48 63 d0             	movsxd rdx,eax
  802f1a:	48 89 d0             	mov    rax,rdx
  802f1d:	48 c1 e0 02          	shl    rax,0x2
  802f21:	48 01 d0             	add    rax,rdx
  802f24:	48 c1 e0 05          	shl    rax,0x5
  802f28:	48 05 b0 58 40 00    	add    rax,0x4058b0
  802f2e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802f31:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802f35:	48 89 c7             	mov    rdi,rax
  802f38:	ff d2                	call   rdx
  802f3a:	e9 fb 00 00 00       	jmp    80303a <call_drv_func+0x255>
        case DRVF_INT  :return drvs[drv_n].inthandler(args);
  802f3f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f42:	48 63 d0             	movsxd rdx,eax
  802f45:	48 89 d0             	mov    rax,rdx
  802f48:	48 c1 e0 02          	shl    rax,0x2
  802f4c:	48 01 d0             	add    rax,rdx
  802f4f:	48 c1 e0 05          	shl    rax,0x5
  802f53:	48 05 b8 58 40 00    	add    rax,0x4058b8
  802f59:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802f5c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802f60:	48 89 c7             	mov    rdi,rax
  802f63:	ff d2                	call   rdx
  802f65:	e9 d0 00 00 00       	jmp    80303a <call_drv_func+0x255>
        case DRVF_FIND :return drvs[drv_n].find(args);
  802f6a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f6d:	48 63 d0             	movsxd rdx,eax
  802f70:	48 89 d0             	mov    rax,rdx
  802f73:	48 c1 e0 02          	shl    rax,0x2
  802f77:	48 01 d0             	add    rax,rdx
  802f7a:	48 c1 e0 05          	shl    rax,0x5
  802f7e:	48 05 c0 58 40 00    	add    rax,0x4058c0
  802f84:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802f87:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802f8b:	48 89 c7             	mov    rdi,rax
  802f8e:	ff d2                	call   rdx
  802f90:	e9 a5 00 00 00       	jmp    80303a <call_drv_func+0x255>
        case DRVF_RM   :return drvs[drv_n].rm(args);
  802f95:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f98:	48 63 d0             	movsxd rdx,eax
  802f9b:	48 89 d0             	mov    rax,rdx
  802f9e:	48 c1 e0 02          	shl    rax,0x2
  802fa2:	48 01 d0             	add    rax,rdx
  802fa5:	48 c1 e0 05          	shl    rax,0x5
  802fa9:	48 05 c8 58 40 00    	add    rax,0x4058c8
  802faf:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802fb2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802fb6:	48 89 c7             	mov    rdi,rax
  802fb9:	ff d2                	call   rdx
  802fbb:	eb 7d                	jmp    80303a <call_drv_func+0x255>
        case DRVF_TOUCH:return drvs[drv_n].touch(args);
  802fbd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802fc0:	48 63 d0             	movsxd rdx,eax
  802fc3:	48 89 d0             	mov    rax,rdx
  802fc6:	48 c1 e0 02          	shl    rax,0x2
  802fca:	48 01 d0             	add    rax,rdx
  802fcd:	48 c1 e0 05          	shl    rax,0x5
  802fd1:	48 05 d0 58 40 00    	add    rax,0x4058d0
  802fd7:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802fda:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802fde:	48 89 c7             	mov    rdi,rax
  802fe1:	ff d2                	call   rdx
  802fe3:	eb 55                	jmp    80303a <call_drv_func+0x255>
        case DRVF_MKDIR:return drvs[drv_n].mkdir(args);
  802fe5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802fe8:	48 63 d0             	movsxd rdx,eax
  802feb:	48 89 d0             	mov    rax,rdx
  802fee:	48 c1 e0 02          	shl    rax,0x2
  802ff2:	48 01 d0             	add    rax,rdx
  802ff5:	48 c1 e0 05          	shl    rax,0x5
  802ff9:	48 05 d8 58 40 00    	add    rax,0x4058d8
  802fff:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803002:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803006:	48 89 c7             	mov    rdi,rax
  803009:	ff d2                	call   rdx
  80300b:	eb 2d                	jmp    80303a <call_drv_func+0x255>
        case DRVF_LS:return drvs[drv_n].ls(args);
  80300d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803010:	48 63 d0             	movsxd rdx,eax
  803013:	48 89 d0             	mov    rax,rdx
  803016:	48 c1 e0 02          	shl    rax,0x2
  80301a:	48 01 d0             	add    rax,rdx
  80301d:	48 c1 e0 05          	shl    rax,0x5
  803021:	48 05 e0 58 40 00    	add    rax,0x4058e0
  803027:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80302a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80302e:	48 89 c7             	mov    rdi,rax
  803031:	ff d2                	call   rdx
  803033:	eb 05                	jmp    80303a <call_drv_func+0x255>
    }
    return -1;
  803035:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  80303a:	c9                   	leave  
  80303b:	c3                   	ret    

000000000080303c <dispose_device>:
int dispose_device(int dev){
  80303c:	f3 0f 1e fa          	endbr64 
  803040:	55                   	push   rbp
  803041:	48 89 e5             	mov    rbp,rsp
  803044:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(devs[dev].flag!=DEV_FLAG_USED)return -1;
  803047:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80304a:	48 63 d0             	movsxd rdx,eax
  80304d:	48 89 d0             	mov    rax,rdx
  803050:	48 c1 e0 02          	shl    rax,0x2
  803054:	48 01 d0             	add    rax,rdx
  803057:	48 c1 e0 02          	shl    rax,0x2
  80305b:	48 01 d0             	add    rax,rdx
  80305e:	48 c1 e0 03          	shl    rax,0x3
  803062:	48 05 90 2e 40 00    	add    rax,0x402e90
  803068:	8b 00                	mov    eax,DWORD PTR [rax]
  80306a:	83 f8 01             	cmp    eax,0x1
  80306d:	74 07                	je     803076 <dispose_device+0x3a>
  80306f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803074:	eb 62                	jmp    8030d8 <dispose_device+0x9c>
    device* p=&devs[dev];
  803076:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803079:	48 63 d0             	movsxd rdx,eax
  80307c:	48 89 d0             	mov    rax,rdx
  80307f:	48 c1 e0 02          	shl    rax,0x2
  803083:	48 01 d0             	add    rax,rdx
  803086:	48 c1 e0 02          	shl    rax,0x2
  80308a:	48 01 d0             	add    rax,rdx
  80308d:	48 c1 e0 03          	shl    rax,0x3
  803091:	48 05 80 2e 40 00    	add    rax,0x402e80
  803097:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //从链表删除
    if(p->prev)p->prev->next=p->next;
  80309b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80309f:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  8030a6:	48 85 c0             	test   rax,rax
  8030a9:	74 1d                	je     8030c8 <dispose_device+0x8c>
  8030ab:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8030af:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  8030b6:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8030ba:	48 8b 92 90 00 00 00 	mov    rdx,QWORD PTR [rdx+0x90]
  8030c1:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
    p->flag=DEV_FLAG_EMPTY;
  8030c8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8030cc:	c7 40 10 00 00 00 00 	mov    DWORD PTR [rax+0x10],0x0
    return 0;
  8030d3:	b8 00 00 00 00       	mov    eax,0x0
}
  8030d8:	5d                   	pop    rbp
  8030d9:	c3                   	ret    

00000000008030da <dispose_driver>:
int dispose_driver(driver *drv){
  8030da:	f3 0f 1e fa          	endbr64 
  8030de:	55                   	push   rbp
  8030df:	48 89 e5             	mov    rbp,rsp
  8030e2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  8030e6:	90                   	nop
  8030e7:	5d                   	pop    rbp
  8030e8:	c3                   	ret    

00000000008030e9 <get_dev>:

device *get_dev(int devi)
{
  8030e9:	f3 0f 1e fa          	endbr64 
  8030ed:	55                   	push   rbp
  8030ee:	48 89 e5             	mov    rbp,rsp
  8030f1:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &devs[devi];
  8030f4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8030f7:	48 63 d0             	movsxd rdx,eax
  8030fa:	48 89 d0             	mov    rax,rdx
  8030fd:	48 c1 e0 02          	shl    rax,0x2
  803101:	48 01 d0             	add    rax,rdx
  803104:	48 c1 e0 02          	shl    rax,0x2
  803108:	48 01 d0             	add    rax,rdx
  80310b:	48 c1 e0 03          	shl    rax,0x3
  80310f:	48 05 80 2e 40 00    	add    rax,0x402e80
}
  803115:	5d                   	pop    rbp
  803116:	c3                   	ret    

0000000000803117 <get_drv>:
driver *get_drv(int drvi)
{
  803117:	f3 0f 1e fa          	endbr64 
  80311b:	55                   	push   rbp
  80311c:	48 89 e5             	mov    rbp,rsp
  80311f:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &drvs[drvi];
  803122:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803125:	48 63 d0             	movsxd rdx,eax
  803128:	48 89 d0             	mov    rax,rdx
  80312b:	48 c1 e0 02          	shl    rax,0x2
  80312f:	48 01 d0             	add    rax,rdx
  803132:	48 c1 e0 05          	shl    rax,0x5
  803136:	48 05 80 58 40 00    	add    rax,0x405880
}
  80313c:	5d                   	pop    rbp
  80313d:	c3                   	ret    

000000000080313e <make_request>:

//发送一个操作设备的申请
int make_request(driver_args* args)
{
  80313e:	f3 0f 1e fa          	endbr64 
  803142:	55                   	push   rbp
  803143:	48 89 e5             	mov    rbp,rsp
  803146:	53                   	push   rbx
  803147:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //在数组中寻找空项
    int i=0;
  80314b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<NR_REQS;i++)
  803152:	eb 23                	jmp    803177 <make_request+0x39>
    {
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  803154:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803157:	48 63 d0             	movsxd rdx,eax
  80315a:	48 89 d0             	mov    rax,rdx
  80315d:	48 01 c0             	add    rax,rax
  803160:	48 01 d0             	add    rax,rdx
  803163:	48 c1 e0 06          	shl    rax,0x6
  803167:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  80316d:	8b 00                	mov    eax,DWORD PTR [rax]
  80316f:	85 c0                	test   eax,eax
  803171:	74 0c                	je     80317f <make_request+0x41>
    for(;i<NR_REQS;i++)
  803173:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  803177:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  80317b:	7e d7                	jle    803154 <make_request+0x16>
  80317d:	eb 01                	jmp    803180 <make_request+0x42>
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  80317f:	90                   	nop
    }
    if(i==NR_REQS)return -1;//满了
  803180:	83 7d f4 20          	cmp    DWORD PTR [rbp-0xc],0x20
  803184:	75 0a                	jne    803190 <make_request+0x52>
  803186:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80318b:	e9 e7 01 00 00       	jmp    803377 <make_request+0x239>
    reqs[i]=*args;//放入数组
  803190:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803193:	48 63 d0             	movsxd rdx,eax
  803196:	48 89 d0             	mov    rax,rdx
  803199:	48 01 c0             	add    rax,rax
  80319c:	48 01 d0             	add    rax,rdx
  80319f:	48 c1 e0 06          	shl    rax,0x6
  8031a3:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  8031aa:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8031ae:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8031b1:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  8031b5:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  8031b8:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  8031bc:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  8031c0:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  8031c4:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  8031c8:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  8031cc:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  8031d0:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  8031d4:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  8031d8:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  8031dc:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  8031e0:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  8031e4:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  8031e8:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  8031ec:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  8031f0:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  8031f4:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  8031f8:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  8031fc:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  803200:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  803204:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  803208:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  80320c:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  803210:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  803214:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  803218:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  80321c:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  803220:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  803224:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  803228:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  80322c:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  803233:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  80323a:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  803241:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  803248:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  80324f:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  803256:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  80325d:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  803264:	48 8b 88 a0 00 00 00 	mov    rcx,QWORD PTR [rax+0xa0]
  80326b:	48 8b 98 a8 00 00 00 	mov    rbx,QWORD PTR [rax+0xa8]
  803272:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  803279:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  803280:	48 8b 88 b0 00 00 00 	mov    rcx,QWORD PTR [rax+0xb0]
  803287:	48 8b 98 b8 00 00 00 	mov    rbx,QWORD PTR [rax+0xb8]
  80328e:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  803295:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
    //插入具体设备的等待链表中
    device* dev=&devs[args->dev];
  80329c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8032a0:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  8032a6:	48 63 d0             	movsxd rdx,eax
  8032a9:	48 89 d0             	mov    rax,rdx
  8032ac:	48 c1 e0 02          	shl    rax,0x2
  8032b0:	48 01 d0             	add    rax,rdx
  8032b3:	48 c1 e0 02          	shl    rax,0x2
  8032b7:	48 01 d0             	add    rax,rdx
  8032ba:	48 c1 e0 03          	shl    rax,0x3
  8032be:	48 05 80 2e 40 00    	add    rax,0x402e80
  8032c4:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!dev->waiting_reqs)//空的等待队列
  8032c8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8032cc:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8032d3:	48 85 c0             	test   rax,rax
  8032d6:	75 27                	jne    8032ff <make_request+0x1c1>
        dev->waiting_reqs=&reqs[i];
  8032d8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8032db:	48 63 d0             	movsxd rdx,eax
  8032de:	48 89 d0             	mov    rax,rdx
  8032e1:	48 01 c0             	add    rax,rax
  8032e4:	48 01 d0             	add    rax,rdx
  8032e7:	48 c1 e0 06          	shl    rax,0x6
  8032eb:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  8032f2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8032f6:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
  8032fd:	eb 75                	jmp    803374 <make_request+0x236>
    else{
        driver_args* p=dev->waiting_reqs;
  8032ff:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803303:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  80330a:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        for(;p->next;p=p->next);
  80330e:	eb 0f                	jmp    80331f <make_request+0x1e1>
  803310:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803314:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  80331b:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  80331f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803323:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  80332a:	48 85 c0             	test   rax,rax
  80332d:	75 e1                	jne    803310 <make_request+0x1d2>
        p->next=&reqs[i];
  80332f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803332:	48 63 d0             	movsxd rdx,eax
  803335:	48 89 d0             	mov    rax,rdx
  803338:	48 01 c0             	add    rax,rax
  80333b:	48 01 d0             	add    rax,rdx
  80333e:	48 c1 e0 06          	shl    rax,0x6
  803342:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803349:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80334d:	48 89 90 b8 00 00 00 	mov    QWORD PTR [rax+0xb8],rdx
        reqs[i].next=NULL;
  803354:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803357:	48 63 d0             	movsxd rdx,eax
  80335a:	48 89 d0             	mov    rax,rdx
  80335d:	48 01 c0             	add    rax,rax
  803360:	48 01 d0             	add    rax,rdx
  803363:	48 c1 e0 06          	shl    rax,0x6
  803367:	48 05 38 6d 40 00    	add    rax,0x406d38
  80336d:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }

    return i;
  803374:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  803377:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80337b:	c9                   	leave  
  80337c:	c3                   	ret    

000000000080337d <do_req>:
//取出一个申请并且执行
int do_req()
{
  80337d:	f3 0f 1e fa          	endbr64 
  803381:	55                   	push   rbp
  803382:	48 89 e5             	mov    rbp,rsp
  803385:	48 83 ec 10          	sub    rsp,0x10
    //查看每个设备的请求情况
    //块设备
    for(int i=0;i<3;i++)
  803389:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803390:	e9 ab 00 00 00       	jmp    803440 <do_req+0xc3>
    {
        device* p=dev_tree[i];
  803395:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803398:	48 98                	cdqe   
  80339a:	48 8b 04 c5 80 84 40 	mov    rax,QWORD PTR [rax*8+0x408480]
  8033a1:	00 
  8033a2:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(;p;p=p->next)
  8033a6:	e9 86 00 00 00       	jmp    803431 <do_req+0xb4>
        {
            //如果没有请求运行而且有请求要运行
            if(!p->running_req&&p->waiting_reqs)
  8033ab:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033af:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  8033b6:	48 85 c0             	test   rax,rax
  8033b9:	75 67                	jne    803422 <do_req+0xa5>
  8033bb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033bf:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8033c6:	48 85 c0             	test   rax,rax
  8033c9:	74 57                	je     803422 <do_req+0xa5>
            {
                p->running_req=p->waiting_reqs;
  8033cb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033cf:	48 8b 90 88 00 00 00 	mov    rdx,QWORD PTR [rax+0x88]
  8033d6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033da:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
                p->waiting_reqs=p->waiting_reqs->next;//取出一个
  8033e1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033e5:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8033ec:	48 8b 90 b8 00 00 00 	mov    rdx,QWORD PTR [rax+0xb8]
  8033f3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033f7:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
                dev_funcs[p->operi](p->running_req);
  8033fe:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803402:	8b 80 a0 00 00 00    	mov    eax,DWORD PTR [rax+0xa0]
  803408:	48 98                	cdqe   
  80340a:	48 8b 14 c5 a0 c4 80 	mov    rdx,QWORD PTR [rax*8+0x80c4a0]
  803411:	00 
  803412:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803416:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  80341d:	48 89 c7             	mov    rdi,rax
  803420:	ff d2                	call   rdx
        for(;p;p=p->next)
  803422:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803426:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  80342d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  803431:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  803436:	0f 85 6f ff ff ff    	jne    8033ab <do_req+0x2e>
    for(int i=0;i<3;i++)
  80343c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803440:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  803444:	0f 8e 4b ff ff ff    	jle    803395 <do_req+0x18>
            }
            //如果还在运行（DONE的状态不能直接覆盖，因为里面的运行结果可能还没被拿走）
        }
    }
    
    return 0;
  80344a:	b8 00 00 00 00       	mov    eax,0x0
}
  80344f:	c9                   	leave  
  803450:	c3                   	ret    

0000000000803451 <wait_on_req>:


void wait_on_req(int reqi)
{
  803451:	f3 0f 1e fa          	endbr64 
  803455:	55                   	push   rbp
  803456:	48 89 e5             	mov    rbp,rsp
  803459:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(reqs[reqi].stat!=REQ_STAT_DONE);
  80345c:	90                   	nop
  80345d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803460:	48 63 d0             	movsxd rdx,eax
  803463:	48 89 d0             	mov    rax,rdx
  803466:	48 01 c0             	add    rax,rax
  803469:	48 01 d0             	add    rax,rdx
  80346c:	48 c1 e0 06          	shl    rax,0x6
  803470:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803476:	8b 00                	mov    eax,DWORD PTR [rax]
  803478:	83 f8 03             	cmp    eax,0x3
  80347b:	75 e0                	jne    80345d <wait_on_req+0xc>
}
  80347d:	90                   	nop
  80347e:	90                   	nop
  80347f:	5d                   	pop    rbp
  803480:	c3                   	ret    

0000000000803481 <clear_req>:
void clear_req(int reqi)
{
  803481:	f3 0f 1e fa          	endbr64 
  803485:	55                   	push   rbp
  803486:	48 89 e5             	mov    rbp,rsp
  803489:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    reqs[reqi].stat=REQ_STAT_EMPTY;
  80348c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80348f:	48 63 d0             	movsxd rdx,eax
  803492:	48 89 d0             	mov    rax,rdx
  803495:	48 01 c0             	add    rax,rax
  803498:	48 01 d0             	add    rax,rdx
  80349b:	48 c1 e0 06          	shl    rax,0x6
  80349f:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  8034a5:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  8034ab:	90                   	nop
  8034ac:	5d                   	pop    rbp
  8034ad:	c3                   	ret    

00000000008034ae <init_proc>:
TSS scene_saver;
TSS *tss=0x108000;
int cur_proc=0;
int pidd=0;
int palloc_paddr=0;
void init_proc(){
  8034ae:	f3 0f 1e fa          	endbr64 
  8034b2:	55                   	push   rbp
  8034b3:	48 89 e5             	mov    rbp,rsp
  8034b6:	48 83 ec 10          	sub    rsp,0x10
    //task=(struct process*)get_global_var(TASK_PCBS_ADDR);//[MAX_TASKS];;
    for(int i=0;i<MAX_PROC_COUNT;i++){
  8034ba:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8034c1:	eb 61                	jmp    803524 <init_proc+0x76>
        task[i].pid=-1;
  8034c3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034c6:	48 63 d0             	movsxd rdx,eax
  8034c9:	48 89 d0             	mov    rax,rdx
  8034cc:	48 01 c0             	add    rax,rax
  8034cf:	48 01 d0             	add    rax,rdx
  8034d2:	48 c1 e0 08          	shl    rax,0x8
  8034d6:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8034dc:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
        task[i].stat=ENDED;
  8034e2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034e5:	48 63 d0             	movsxd rdx,eax
  8034e8:	48 89 d0             	mov    rax,rdx
  8034eb:	48 01 c0             	add    rax,rax
  8034ee:	48 01 d0             	add    rax,rdx
  8034f1:	48 c1 e0 08          	shl    rax,0x8
  8034f5:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8034fb:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
        task[i].parent_pid=-1;
  803501:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803504:	48 63 d0             	movsxd rdx,eax
  803507:	48 89 d0             	mov    rax,rdx
  80350a:	48 01 c0             	add    rax,rax
  80350d:	48 01 d0             	add    rax,rdx
  803510:	48 c1 e0 08          	shl    rax,0x8
  803514:	48 05 28 85 40 00    	add    rax,0x408528
  80351a:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<MAX_PROC_COUNT;i++){
  803520:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803524:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803528:	7e 99                	jle    8034c3 <init_proc+0x15>
    }
    cur_proc=0;//no proc
  80352a:	c7 05 f8 0f c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc10ff8],0x0        # 41452c <cur_proc>
  803531:	00 00 00 
    current=task;
  803534:	48 c7 05 61 0f c1 ff 	mov    QWORD PTR [rip+0xffffffffffc10f61],0x4084a0        # 4144a0 <current>
  80353b:	a0 84 40 00 
    pidd=1;
  80353f:	c7 05 e7 0f c1 ff 01 	mov    DWORD PTR [rip+0xffffffffffc10fe7],0x1        # 414530 <pidd>
  803546:	00 00 00 
     //创建0号进程
    int zi=create_proc();
  803549:	b8 00 00 00 00       	mov    eax,0x0
  80354e:	e8 09 03 00 00       	call   80385c <create_proc>
  803553:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    task[zi].stat=READY;
  803556:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803559:	48 63 d0             	movsxd rdx,eax
  80355c:	48 89 d0             	mov    rax,rdx
  80355f:	48 01 c0             	add    rax,rax
  803562:	48 01 d0             	add    rax,rdx
  803565:	48 c1 e0 08          	shl    rax,0x8
  803569:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80356f:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int xi= _LDT_IND(zi)*8;
  803575:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803578:	83 c0 03             	add    eax,0x3
  80357b:	c1 e0 04             	shl    eax,0x4
  80357e:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    zi=_TSS_IND(zi)*8;
  803581:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803584:	01 c0                	add    eax,eax
  803586:	83 c0 05             	add    eax,0x5
  803589:	c1 e0 03             	shl    eax,0x3
  80358c:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //asm volatile("lldt %0"::"m"(xi));
    //asm volatile("ltr %0"::"m"(zi));
    set_tss(0x400000,0x400000,0x400000,0x800000,0x800000,0x800000,0x800000,0x800000,0x800000,0x800000);
  80358f:	68 00 00 80 00       	push   0x800000
  803594:	68 00 00 80 00       	push   0x800000
  803599:	68 00 00 80 00       	push   0x800000
  80359e:	68 00 00 80 00       	push   0x800000
  8035a3:	41 b9 00 00 80 00    	mov    r9d,0x800000
  8035a9:	41 b8 00 00 80 00    	mov    r8d,0x800000
  8035af:	b9 00 00 80 00       	mov    ecx,0x800000
  8035b4:	ba 00 00 40 00       	mov    edx,0x400000
  8035b9:	be 00 00 40 00       	mov    esi,0x400000
  8035be:	bf 00 00 40 00       	mov    edi,0x400000
  8035c3:	e8 c9 14 00 00       	call   804a91 <set_tss>
  8035c8:	48 83 c4 20          	add    rsp,0x20
    //IA32_INTERRUPT_SSP_TABLE_ADDR，准备IST
    wrmsr(0x6a8,tss->rsvd2);
  8035cc:	48 8b 05 ed 8e 00 00 	mov    rax,QWORD PTR [rip+0x8eed]        # 80c4c0 <tss>
  8035d3:	48 8b 40 1c          	mov    rax,QWORD PTR [rax+0x1c]
  8035d7:	48 89 c6             	mov    rsi,rax
  8035da:	bf a8 06 00 00       	mov    edi,0x6a8
  8035df:	e8 40 d2 ff ff       	call   800824 <wrmsr>
    //把内核代码段选择子写到MSR寄存器中准备用于特权级转换(sysexit，现在没用)
    wrmsr(0x174,0x8);
  8035e4:	be 08 00 00 00       	mov    esi,0x8
  8035e9:	bf 74 01 00 00       	mov    edi,0x174
  8035ee:	e8 31 d2 ff ff       	call   800824 <wrmsr>
    //准备用于特权级转换(sysret，正在使用)
    wrmsr(0xc0000081,0x0020000800000000ul);
  8035f3:	48 b8 00 00 00 00 08 	movabs rax,0x20000800000000
  8035fa:	00 20 00 
  8035fd:	48 89 c6             	mov    rsi,rax
  803600:	b8 81 00 00 c0       	mov    eax,0xc0000081
  803605:	48 89 c7             	mov    rdi,rax
  803608:	e8 17 d2 ff ff       	call   800824 <wrmsr>
    //创建一个测试进程
    create_test_proc();
  80360d:	b8 00 00 00 00       	mov    eax,0x0
  803612:	e8 03 00 00 00       	call   80361a <create_test_proc>
}
  803617:	90                   	nop
  803618:	c9                   	leave  
  803619:	c3                   	ret    

000000000080361a <create_test_proc>:
void create_test_proc(){
  80361a:	f3 0f 1e fa          	endbr64 
  80361e:	55                   	push   rbp
  80361f:	48 89 e5             	mov    rbp,rsp
  803622:	48 83 ec 20          	sub    rsp,0x20

    int index=req_proc();
  803626:	b8 00 00 00 00       	mov    eax,0x0
  80362b:	e8 af 02 00 00       	call   8038df <req_proc>
  803630:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    task[index].stat=READY;
  803633:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803636:	48 63 d0             	movsxd rdx,eax
  803639:	48 89 d0             	mov    rax,rdx
  80363c:	48 01 c0             	add    rax,rax
  80363f:	48 01 d0             	add    rax,rdx
  803642:	48 c1 e0 08          	shl    rax,0x8
  803646:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80364c:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int currsp=0x9fc00-1;
  803652:	c7 45 ec ff fb 09 00 	mov    DWORD PTR [rbp-0x14],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  803659:	48 89 65 ec          	mov    QWORD PTR [rbp-0x14],rsp
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  80365d:	ba 22 c4 80 00       	mov    edx,0x80c422
  803662:	48 83 ec 08          	sub    rsp,0x8
  803666:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803669:	50                   	push   rax
  80366a:	6a 00                	push   0x0
  80366c:	52                   	push   rdx
  80366d:	6a 00                	push   0x0
  80366f:	6a 00                	push   0x0
  803671:	6a 00                	push   0x0
  803673:	68 58 7d 00 00       	push   0x7d58
  803678:	6a 10                	push   0x10
  80367a:	6a 10                	push   0x10
  80367c:	6a 10                	push   0x10
  80367e:	6a 10                	push   0x10
  803680:	41 b9 08 00 00 00    	mov    r9d,0x8
  803686:	41 b8 10 00 00 00    	mov    r8d,0x10
  80368c:	b9 00 00 00 00       	mov    ecx,0x0
  803691:	ba 00 00 00 00       	mov    edx,0x0
  803696:	be 00 00 00 00       	mov    esi,0x0
  80369b:	bf 00 00 00 00       	mov    edi,0x0
  8036a0:	e8 33 03 00 00       	call   8039d8 <set_proc>
  8036a5:	48 83 c4 60          	add    rsp,0x60
             0x7e00- sizeof(stack_store_regs), 0, 0, 0, (long)ret_sys_call, 0, index);
    task[index].tss.rsp0=0x400000;
  8036a9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036ac:	48 63 d0             	movsxd rdx,eax
  8036af:	48 89 d0             	mov    rax,rdx
  8036b2:	48 01 c0             	add    rax,rax
  8036b5:	48 01 d0             	add    rax,rdx
  8036b8:	48 c1 e0 08          	shl    rax,0x8
  8036bc:	48 05 68 86 40 00    	add    rax,0x408668
  8036c2:	48 c7 00 00 00 40 00 	mov    QWORD PTR [rax],0x400000
    task[index].mem_struct.stack_top=0x7e00;
  8036c9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036cc:	48 63 d0             	movsxd rdx,eax
  8036cf:	48 89 d0             	mov    rax,rdx
  8036d2:	48 01 c0             	add    rax,rax
  8036d5:	48 01 d0             	add    rax,rdx
  8036d8:	48 c1 e0 08          	shl    rax,0x8
  8036dc:	48 05 c0 84 40 00    	add    rax,0x4084c0
  8036e2:	c7 00 00 7e 00 00    	mov    DWORD PTR [rax],0x7e00
    task[index].mem_struct.stack_bottom=0x6e00;
  8036e8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036eb:	48 63 d0             	movsxd rdx,eax
  8036ee:	48 89 d0             	mov    rax,rdx
  8036f1:	48 01 c0             	add    rax,rax
  8036f4:	48 01 d0             	add    rax,rdx
  8036f7:	48 c1 e0 08          	shl    rax,0x8
  8036fb:	48 05 bc 84 40 00    	add    rax,0x4084bc
  803701:	c7 00 00 6e 00 00    	mov    DWORD PTR [rax],0x6e00
    task[index].mem_struct.heap_top=0x1101000;
  803707:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80370a:	48 63 d0             	movsxd rdx,eax
  80370d:	48 89 d0             	mov    rax,rdx
  803710:	48 01 c0             	add    rax,rax
  803713:	48 01 d0             	add    rax,rdx
  803716:	48 c1 e0 08          	shl    rax,0x8
  80371a:	48 05 b8 84 40 00    	add    rax,0x4084b8
  803720:	c7 00 00 10 10 01    	mov    DWORD PTR [rax],0x1101000
    task[index].mem_struct.heap_base=0x1100000;
  803726:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803729:	48 63 d0             	movsxd rdx,eax
  80372c:	48 89 d0             	mov    rax,rdx
  80372f:	48 01 c0             	add    rax,rax
  803732:	48 01 d0             	add    rax,rdx
  803735:	48 c1 e0 08          	shl    rax,0x8
  803739:	48 05 b4 84 40 00    	add    rax,0x4084b4
  80373f:	c7 00 00 00 10 01    	mov    DWORD PTR [rax],0x1100000

    //把还原现场时用到的堆栈设置好
    stack_store_regs *str= (stack_store_regs *) (0x7e00 - sizeof(stack_store_regs));
  803745:	48 c7 45 f0 58 7d 00 	mov    QWORD PTR [rbp-0x10],0x7d58
  80374c:	00 
    str->rax=0;
  80374d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803751:	48 c7 40 78 00 00 00 	mov    QWORD PTR [rax+0x78],0x0
  803758:	00 
    str->rbx=0;
  803759:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80375d:	48 c7 40 70 00 00 00 	mov    QWORD PTR [rax+0x70],0x0
  803764:	00 
    str->rcx=proc_zero;//sysret采用的返回地址
  803765:	ba 53 3b 80 00       	mov    edx,0x803b53
  80376a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80376e:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    str->rdx=0;
  803772:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803776:	48 c7 40 60 00 00 00 	mov    QWORD PTR [rax+0x60],0x0
  80377d:	00 
    str->rsi=0;
  80377e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803782:	48 c7 40 50 00 00 00 	mov    QWORD PTR [rax+0x50],0x0
  803789:	00 
    str->rdi=0;
  80378a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80378e:	48 c7 40 58 00 00 00 	mov    QWORD PTR [rax+0x58],0x0
  803795:	00 
    str->r15=0;
  803796:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80379a:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  8037a1:	00 
    str->r14=0;
  8037a2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037a6:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  8037ad:	00 
    str->r13=0;
  8037ae:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037b2:	48 c7 40 20 00 00 00 	mov    QWORD PTR [rax+0x20],0x0
  8037b9:	00 
    str->r12=0;
  8037ba:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037be:	48 c7 40 28 00 00 00 	mov    QWORD PTR [rax+0x28],0x0
  8037c5:	00 
    str->r11=0x200;
  8037c6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037ca:	48 c7 40 30 00 02 00 	mov    QWORD PTR [rax+0x30],0x200
  8037d1:	00 
    str->r10=0;
  8037d2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037d6:	48 c7 40 38 00 00 00 	mov    QWORD PTR [rax+0x38],0x0
  8037dd:	00 
    str->r9=0;
  8037de:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037e2:	48 c7 40 40 00 00 00 	mov    QWORD PTR [rax+0x40],0x0
  8037e9:	00 
    str->r8=0;
  8037ea:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037ee:	48 c7 40 48 00 00 00 	mov    QWORD PTR [rax+0x48],0x0
  8037f5:	00 
    str->rip=proc_zero;
  8037f6:	ba 53 3b 80 00       	mov    edx,0x803b53
  8037fb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037ff:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
    str->cs=0x8;
  803806:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80380a:	48 c7 80 88 00 00 00 	mov    QWORD PTR [rax+0x88],0x8
  803811:	08 00 00 00 
    str->rflags=0x00200206;
  803815:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803819:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x200206
  803820:	06 02 20 00 
    str->rsp=0x7e00;
  803824:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803828:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x7e00
  80382f:	00 7e 00 00 
    str->ss=0x2b;
  803833:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803837:	48 c7 80 a0 00 00 00 	mov    QWORD PTR [rax+0xa0],0x2b
  80383e:	2b 00 00 00 
    str->ds=0x2b;
  803842:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803846:	48 c7 00 2b 00 00 00 	mov    QWORD PTR [rax],0x2b
    str->es=0x2b;
  80384d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803851:	48 c7 40 08 2b 00 00 	mov    QWORD PTR [rax+0x8],0x2b
  803858:	00 

}
  803859:	90                   	nop
  80385a:	c9                   	leave  
  80385b:	c3                   	ret    

000000000080385c <create_proc>:
int create_proc()
{
  80385c:	f3 0f 1e fa          	endbr64 
  803860:	55                   	push   rbp
  803861:	48 89 e5             	mov    rbp,rsp
  803864:	48 83 ec 10          	sub    rsp,0x10
    int index=req_proc();
  803868:	b8 00 00 00 00       	mov    eax,0x0
  80386d:	e8 6d 00 00 00       	call   8038df <req_proc>
  803872:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(index==-1)return -1;
  803875:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  803879:	75 07                	jne    803882 <create_proc+0x26>
  80387b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803880:	eb 5b                	jmp    8038dd <create_proc+0x81>
    int currsp=0x9fc00-1;
  803882:	c7 45 f8 ff fb 09 00 	mov    DWORD PTR [rbp-0x8],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  803889:	48 89 65 f8          	mov    QWORD PTR [rbp-0x8],rsp
    //默认DPL=3
    //set_proc(0,0,0,0,0x23,0x1b,0x23,0x23,0x23,0x23,curesp,0,0,0,0,index);
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  80388d:	b9 53 3b 80 00       	mov    ecx,0x803b53
  803892:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803895:	48 98                	cdqe   
  803897:	48 83 ec 08          	sub    rsp,0x8
  80389b:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80389e:	52                   	push   rdx
  80389f:	6a 00                	push   0x0
  8038a1:	51                   	push   rcx
  8038a2:	6a 00                	push   0x0
  8038a4:	6a 00                	push   0x0
  8038a6:	6a 00                	push   0x0
  8038a8:	50                   	push   rax
  8038a9:	6a 10                	push   0x10
  8038ab:	6a 10                	push   0x10
  8038ad:	6a 10                	push   0x10
  8038af:	6a 10                	push   0x10
  8038b1:	41 b9 08 00 00 00    	mov    r9d,0x8
  8038b7:	41 b8 10 00 00 00    	mov    r8d,0x10
  8038bd:	b9 00 00 00 00       	mov    ecx,0x0
  8038c2:	ba 00 00 00 00       	mov    edx,0x0
  8038c7:	be 00 00 00 00       	mov    esi,0x0
  8038cc:	bf 00 00 00 00       	mov    edi,0x0
  8038d1:	e8 02 01 00 00       	call   8039d8 <set_proc>
  8038d6:	48 83 c4 60          	add    rsp,0x60
             currsp, 0, 0, 0, (long)proc_zero, 0, index);
//    task[index].tss.eip=(long)proc_zero;

    return index;
  8038da:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8038dd:	c9                   	leave  
  8038de:	c3                   	ret    

00000000008038df <req_proc>:
int req_proc(){
  8038df:	f3 0f 1e fa          	endbr64 
  8038e3:	55                   	push   rbp
  8038e4:	48 89 e5             	mov    rbp,rsp
    int num=0;
  8038e7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  8038ee:	eb 04                	jmp    8038f4 <req_proc+0x15>
    num<=MAX_PROC_COUNT){
        num++;
  8038f0:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  8038f4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8038f7:	48 63 d0             	movsxd rdx,eax
  8038fa:	48 89 d0             	mov    rax,rdx
  8038fd:	48 01 c0             	add    rax,rax
  803900:	48 01 d0             	add    rax,rdx
  803903:	48 c1 e0 08          	shl    rax,0x8
  803907:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80390d:	8b 00                	mov    eax,DWORD PTR [rax]
  80390f:	83 f8 ff             	cmp    eax,0xffffffff
  803912:	74 26                	je     80393a <req_proc+0x5b>
  803914:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803917:	48 63 d0             	movsxd rdx,eax
  80391a:	48 89 d0             	mov    rax,rdx
  80391d:	48 01 c0             	add    rax,rax
  803920:	48 01 d0             	add    rax,rdx
  803923:	48 c1 e0 08          	shl    rax,0x8
  803927:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80392d:	8b 00                	mov    eax,DWORD PTR [rax]
  80392f:	83 f8 03             	cmp    eax,0x3
  803932:	74 06                	je     80393a <req_proc+0x5b>
  803934:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  803938:	7e b6                	jle    8038f0 <req_proc+0x11>
    }
    if(num>=MAX_PROC_COUNT)
  80393a:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  80393e:	7e 0a                	jle    80394a <req_proc+0x6b>
        return -1;
  803940:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803945:	e9 8c 00 00 00       	jmp    8039d6 <req_proc+0xf7>
    task[num].pid=pidd++;
  80394a:	8b 05 e0 0b c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10be0]        # 414530 <pidd>
  803950:	8d 50 01             	lea    edx,[rax+0x1]
  803953:	89 15 d7 0b c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10bd7],edx        # 414530 <pidd>
  803959:	89 c1                	mov    ecx,eax
  80395b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80395e:	48 63 d0             	movsxd rdx,eax
  803961:	48 89 d0             	mov    rax,rdx
  803964:	48 01 c0             	add    rax,rax
  803967:	48 01 d0             	add    rax,rdx
  80396a:	48 c1 e0 08          	shl    rax,0x8
  80396e:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803974:	89 08                	mov    DWORD PTR [rax],ecx
    task[num].stat=ENDED;
  803976:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803979:	48 63 d0             	movsxd rdx,eax
  80397c:	48 89 d0             	mov    rax,rdx
  80397f:	48 01 c0             	add    rax,rax
  803982:	48 01 d0             	add    rax,rdx
  803985:	48 c1 e0 08          	shl    rax,0x8
  803989:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80398f:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[num].utime=0;
  803995:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803998:	48 63 d0             	movsxd rdx,eax
  80399b:	48 89 d0             	mov    rax,rdx
  80399e:	48 01 c0             	add    rax,rax
  8039a1:	48 01 d0             	add    rax,rdx
  8039a4:	48 c1 e0 08          	shl    rax,0x8
  8039a8:	48 05 a8 84 40 00    	add    rax,0x4084a8
  8039ae:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[num].priority=0;
  8039b4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039b7:	48 63 d0             	movsxd rdx,eax
  8039ba:	48 89 d0             	mov    rax,rdx
  8039bd:	48 01 c0             	add    rax,rax
  8039c0:	48 01 d0             	add    rax,rdx
  8039c3:	48 c1 e0 08          	shl    rax,0x8
  8039c7:	48 05 ac 84 40 00    	add    rax,0x4084ac
  8039cd:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return num;
  8039d3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8039d6:	5d                   	pop    rbp
  8039d7:	c3                   	ret    

00000000008039d8 <set_proc>:
void set_proc(long rax, long rbx, long rcx, long rdx, long es, long cs, long ss, long ds, long fs, long gs, long rsp,
              long rbp, long rsi, long rdi, long rip, long rflags, int proc_nr) {
  8039d8:	f3 0f 1e fa          	endbr64 
  8039dc:	55                   	push   rbp
  8039dd:	48 89 e5             	mov    rbp,rsp
  8039e0:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8039e4:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8039e8:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  8039ec:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  8039f0:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
  8039f4:	4c 89 4d c0          	mov    QWORD PTR [rbp-0x40],r9
    struct process* proc=&task[proc_nr];
  8039f8:	8b 45 60             	mov    eax,DWORD PTR [rbp+0x60]
  8039fb:	48 63 d0             	movsxd rdx,eax
  8039fe:	48 89 d0             	mov    rax,rdx
  803a01:	48 01 c0             	add    rax,rax
  803a04:	48 01 d0             	add    rax,rdx
  803a07:	48 c1 e0 08          	shl    rax,0x8
  803a0b:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803a11:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    proc->regs.rax=rax;
  803a15:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a19:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  803a1d:	48 89 90 48 02 00 00 	mov    QWORD PTR [rax+0x248],rdx
    proc->regs.rbx=rbx;
  803a24:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a28:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  803a2c:	48 89 90 60 02 00 00 	mov    QWORD PTR [rax+0x260],rdx
    proc->regs.rcx=rcx;
  803a33:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a37:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  803a3b:	48 89 90 50 02 00 00 	mov    QWORD PTR [rax+0x250],rdx
    proc->regs.rdx=rdx;
  803a42:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a46:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  803a4a:	48 89 90 58 02 00 00 	mov    QWORD PTR [rax+0x258],rdx
    proc->regs.es=es;
  803a51:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a55:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803a59:	48 89 90 88 02 00 00 	mov    QWORD PTR [rax+0x288],rdx
    proc->regs.cs=cs;
  803a60:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a64:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803a68:	48 89 90 90 02 00 00 	mov    QWORD PTR [rax+0x290],rdx
    proc->regs.ss=ss;
  803a6f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a73:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803a77:	48 89 90 98 02 00 00 	mov    QWORD PTR [rax+0x298],rdx
    proc->regs.ds=ds;
  803a7e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a82:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803a86:	48 89 90 a0 02 00 00 	mov    QWORD PTR [rax+0x2a0],rdx
    proc->regs.fs=fs;
  803a8d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a91:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  803a95:	48 89 90 a8 02 00 00 	mov    QWORD PTR [rax+0x2a8],rdx
    proc->regs.gs=gs;
  803a9c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803aa0:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  803aa4:	48 89 90 b0 02 00 00 	mov    QWORD PTR [rax+0x2b0],rdx
    proc->regs.rsp=rsp;
  803aab:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803aaf:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803ab3:	48 89 90 68 02 00 00 	mov    QWORD PTR [rax+0x268],rdx
    proc->regs.rbp=rbp;
  803aba:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803abe:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
  803ac2:	48 89 90 70 02 00 00 	mov    QWORD PTR [rax+0x270],rdx
    proc->regs.rsi=rsi;
  803ac9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803acd:	48 8b 55 40          	mov    rdx,QWORD PTR [rbp+0x40]
  803ad1:	48 89 90 78 02 00 00 	mov    QWORD PTR [rax+0x278],rdx
    proc->regs.rdi=rdi;
  803ad8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803adc:	48 8b 55 48          	mov    rdx,QWORD PTR [rbp+0x48]
  803ae0:	48 89 90 80 02 00 00 	mov    QWORD PTR [rax+0x280],rdx
    proc->regs.rflags=0x202;//设置为默认值:0b 0010 0000 0010
  803ae7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803aeb:	48 c7 80 40 02 00 00 	mov    QWORD PTR [rax+0x240],0x202
  803af2:	02 02 00 00 
    //能接受中断
    proc->regs.rip=rip;
  803af6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803afa:	48 8b 55 50          	mov    rdx,QWORD PTR [rbp+0x50]
  803afe:	48 89 90 38 02 00 00 	mov    QWORD PTR [rax+0x238],rdx

    proc->regs.cs=cs;
  803b05:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b09:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803b0d:	48 89 90 90 02 00 00 	mov    QWORD PTR [rax+0x290],rdx
    proc->regs.ds=ds;
  803b14:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b18:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803b1c:	48 89 90 a0 02 00 00 	mov    QWORD PTR [rax+0x2a0],rdx
    proc->regs.es=es;
  803b23:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b27:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803b2b:	48 89 90 88 02 00 00 	mov    QWORD PTR [rax+0x288],rdx
    proc->regs.cr3=PML4_ADDR;//get_phyaddr(n1);//暂时先搞成全局
  803b32:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b36:	48 c7 80 30 02 00 00 	mov    QWORD PTR [rax+0x230],0x101000
  803b3d:	00 10 10 00 
    proc->pml4=PML4_ADDR;
  803b41:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b45:	48 c7 80 ac 00 00 00 	mov    QWORD PTR [rax+0xac],0x101000
  803b4c:	00 10 10 00 


}
  803b50:	90                   	nop
  803b51:	5d                   	pop    rbp
  803b52:	c3                   	ret    

0000000000803b53 <proc_zero>:
void proc_zero()
{
  803b53:	f3 0f 1e fa          	endbr64 
  803b57:	55                   	push   rbp
  803b58:	48 89 e5             	mov    rbp,rsp
  803b5b:	48 83 ec 10          	sub    rsp,0x10
    asm volatile("mov $27,%rax\n"
  803b5f:	48 c7 c0 1b 00 00 00 	mov    rax,0x1b
  803b66:	48 0f 05             	rex.W syscall 
                 ".byte 0x48\n"
                 "syscall");
    long rax;
    asm volatile("":"=a"(rax));
  803b69:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(rax==0){
  803b6d:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  803b72:	75 19                	jne    803b8d <proc_zero+0x3a>
        printf("child proc ret:%d\n",cur_proc);
  803b74:	8b 05 b2 09 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc109b2]        # 41452c <cur_proc>
  803b7a:	89 c6                	mov    esi,eax
  803b7c:	bf a8 40 81 00       	mov    edi,0x8140a8
  803b81:	b8 00 00 00 00       	mov    eax,0x0
  803b86:	e8 ad d1 ff ff       	call   800d38 <printf>
  803b8b:	eb 17                	jmp    803ba4 <proc_zero+0x51>
    }else{
        printf("parent proc ret:%d\n",cur_proc);
  803b8d:	8b 05 99 09 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10999]        # 41452c <cur_proc>
  803b93:	89 c6                	mov    esi,eax
  803b95:	bf bb 40 81 00       	mov    edi,0x8140bb
  803b9a:	b8 00 00 00 00       	mov    eax,0x0
  803b9f:	e8 94 d1 ff ff       	call   800d38 <printf>
    }
    while(1);
  803ba4:	eb fe                	jmp    803ba4 <proc_zero+0x51>

0000000000803ba6 <save_rsp>:
}
void save_rsp(){
  803ba6:	f3 0f 1e fa          	endbr64 
  803baa:	55                   	push   rbp
  803bab:	48 89 e5             	mov    rbp,rsp
    //在时钟中断context下
    addr_t * p=INT_STACK_TOP-16;
  803bae:	48 c7 45 f8 f0 ff 7f 	mov    QWORD PTR [rbp-0x8],0x7ffff0
  803bb5:	00 
    current->regs.rsp=*p;
  803bb6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803bba:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803bbd:	48 8b 05 dc 08 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc108dc]        # 4144a0 <current>
  803bc4:	48 89 90 68 02 00 00 	mov    QWORD PTR [rax+0x268],rdx
}
  803bcb:	90                   	nop
  803bcc:	5d                   	pop    rbp
  803bcd:	c3                   	ret    

0000000000803bce <manage_proc>:
void manage_proc(){
  803bce:	f3 0f 1e fa          	endbr64 
  803bd2:	55                   	push   rbp
  803bd3:	48 89 e5             	mov    rbp,rsp
  803bd6:	48 83 ec 10          	sub    rsp,0x10
    if(cur_proc!=-1)
  803bda:	8b 05 4c 09 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1094c]        # 41452c <cur_proc>
  803be0:	83 f8 ff             	cmp    eax,0xffffffff
  803be3:	74 39                	je     803c1e <manage_proc+0x50>
        task[cur_proc].utime++;
  803be5:	8b 15 41 09 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc10941]        # 41452c <cur_proc>
  803beb:	48 63 ca             	movsxd rcx,edx
  803bee:	48 89 c8             	mov    rax,rcx
  803bf1:	48 01 c0             	add    rax,rax
  803bf4:	48 01 c8             	add    rax,rcx
  803bf7:	48 c1 e0 08          	shl    rax,0x8
  803bfb:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803c01:	8b 00                	mov    eax,DWORD PTR [rax]
  803c03:	8d 48 01             	lea    ecx,[rax+0x1]
  803c06:	48 63 d2             	movsxd rdx,edx
  803c09:	48 89 d0             	mov    rax,rdx
  803c0c:	48 01 c0             	add    rax,rax
  803c0f:	48 01 d0             	add    rax,rdx
  803c12:	48 c1 e0 08          	shl    rax,0x8
  803c16:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803c1c:	89 08                	mov    DWORD PTR [rax],ecx
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803c1e:	8b 05 08 09 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10908]        # 41452c <cur_proc>
  803c24:	83 f8 ff             	cmp    eax,0xffffffff
  803c27:	74 4a                	je     803c73 <manage_proc+0xa5>
  803c29:	8b 05 fd 08 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc108fd]        # 41452c <cur_proc>
  803c2f:	48 63 d0             	movsxd rdx,eax
  803c32:	48 89 d0             	mov    rax,rdx
  803c35:	48 01 c0             	add    rax,rax
  803c38:	48 01 d0             	add    rax,rdx
  803c3b:	48 c1 e0 08          	shl    rax,0x8
  803c3f:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803c45:	8b 00                	mov    eax,DWORD PTR [rax]
  803c47:	83 f8 01             	cmp    eax,0x1
  803c4a:	77 27                	ja     803c73 <manage_proc+0xa5>
    task[cur_proc].stat!=READY){
  803c4c:	8b 05 da 08 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc108da]        # 41452c <cur_proc>
  803c52:	48 63 d0             	movsxd rdx,eax
  803c55:	48 89 d0             	mov    rax,rdx
  803c58:	48 01 c0             	add    rax,rax
  803c5b:	48 01 d0             	add    rax,rdx
  803c5e:	48 c1 e0 08          	shl    rax,0x8
  803c62:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803c68:	8b 00                	mov    eax,DWORD PTR [rax]
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803c6a:	83 f8 01             	cmp    eax,0x1
  803c6d:	0f 84 1e 01 00 00    	je     803d91 <manage_proc+0x1c3>
        if(cur_proc!=-1)
  803c73:	8b 05 b3 08 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc108b3]        # 41452c <cur_proc>
  803c79:	83 f8 ff             	cmp    eax,0xffffffff
  803c7c:	74 22                	je     803ca0 <manage_proc+0xd2>
            task[cur_proc].utime=0;
  803c7e:	8b 05 a8 08 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc108a8]        # 41452c <cur_proc>
  803c84:	48 63 d0             	movsxd rdx,eax
  803c87:	48 89 d0             	mov    rax,rdx
  803c8a:	48 01 c0             	add    rax,rax
  803c8d:	48 01 d0             	add    rax,rdx
  803c90:	48 c1 e0 08          	shl    rax,0x8
  803c94:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803c9a:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        //find
        int i=cur_proc+1;
  803ca0:	8b 05 86 08 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10886]        # 41452c <cur_proc>
  803ca6:	83 c0 01             	add    eax,0x1
  803ca9:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        //轮询，直到有一个符合条件
        while(1){
            if(task[i].pid!=-1&&task[i].stat==READY&&i!=cur_proc){
  803cac:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803caf:	48 63 d0             	movsxd rdx,eax
  803cb2:	48 89 d0             	mov    rax,rdx
  803cb5:	48 01 c0             	add    rax,rax
  803cb8:	48 01 d0             	add    rax,rdx
  803cbb:	48 c1 e0 08          	shl    rax,0x8
  803cbf:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803cc5:	8b 00                	mov    eax,DWORD PTR [rax]
  803cc7:	83 f8 ff             	cmp    eax,0xffffffff
  803cca:	74 2b                	je     803cf7 <manage_proc+0x129>
  803ccc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803ccf:	48 63 d0             	movsxd rdx,eax
  803cd2:	48 89 d0             	mov    rax,rdx
  803cd5:	48 01 c0             	add    rax,rax
  803cd8:	48 01 d0             	add    rax,rdx
  803cdb:	48 c1 e0 08          	shl    rax,0x8
  803cdf:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803ce5:	8b 00                	mov    eax,DWORD PTR [rax]
  803ce7:	83 f8 01             	cmp    eax,0x1
  803cea:	75 0b                	jne    803cf7 <manage_proc+0x129>
  803cec:	8b 05 3a 08 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1083a]        # 41452c <cur_proc>
  803cf2:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  803cf5:	75 16                	jne    803d0d <manage_proc+0x13f>
                break;
            }
            i=(i+1)%MAX_TASKS;
  803cf7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803cfa:	83 c0 01             	add    eax,0x1
  803cfd:	99                   	cdq    
  803cfe:	c1 ea 1b             	shr    edx,0x1b
  803d01:	01 d0                	add    eax,edx
  803d03:	83 e0 1f             	and    eax,0x1f
  803d06:	29 d0                	sub    eax,edx
  803d08:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
            if(task[i].pid!=-1&&task[i].stat==READY&&i!=cur_proc){
  803d0b:	eb 9f                	jmp    803cac <manage_proc+0xde>
                break;
  803d0d:	90                   	nop
        }
        //switch
        task[cur_proc].stat=READY;
  803d0e:	8b 05 18 08 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10818]        # 41452c <cur_proc>
  803d14:	48 63 d0             	movsxd rdx,eax
  803d17:	48 89 d0             	mov    rax,rdx
  803d1a:	48 01 c0             	add    rax,rax
  803d1d:	48 01 d0             	add    rax,rdx
  803d20:	48 c1 e0 08          	shl    rax,0x8
  803d24:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803d2a:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        task[i].stat=RUNNING;
  803d30:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d33:	48 63 d0             	movsxd rdx,eax
  803d36:	48 89 d0             	mov    rax,rdx
  803d39:	48 01 c0             	add    rax,rax
  803d3c:	48 01 d0             	add    rax,rdx
  803d3f:	48 c1 e0 08          	shl    rax,0x8
  803d43:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803d49:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        switch_to(&task[cur_proc], &task[i]);
  803d4f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d52:	48 63 d0             	movsxd rdx,eax
  803d55:	48 89 d0             	mov    rax,rdx
  803d58:	48 01 c0             	add    rax,rax
  803d5b:	48 01 d0             	add    rax,rdx
  803d5e:	48 c1 e0 08          	shl    rax,0x8
  803d62:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  803d69:	8b 05 bd 07 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc107bd]        # 41452c <cur_proc>
  803d6f:	48 63 c8             	movsxd rcx,eax
  803d72:	48 89 c8             	mov    rax,rcx
  803d75:	48 01 c0             	add    rax,rax
  803d78:	48 01 c8             	add    rax,rcx
  803d7b:	48 c1 e0 08          	shl    rax,0x8
  803d7f:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803d85:	48 89 d6             	mov    rsi,rdx
  803d88:	48 89 c7             	mov    rdi,rax
  803d8b:	e8 6c 0b 00 00       	call   8048fc <switch_to>
    }
    return;
  803d90:	90                   	nop
  803d91:	90                   	nop
}
  803d92:	c9                   	leave  
  803d93:	c3                   	ret    

0000000000803d94 <switch_proc_tss>:

void switch_proc_tss(int pnr)
{
  803d94:	f3 0f 1e fa          	endbr64 
  803d98:	55                   	push   rbp
  803d99:	48 89 e5             	mov    rbp,rsp
  803d9c:	48 83 ec 20          	sub    rsp,0x20
  803da0:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int sel=_TSS_IND(pnr)*8;
  803da3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803da6:	01 c0                	add    eax,eax
  803da8:	83 c0 05             	add    eax,0x5
  803dab:	c1 e0 03             	shl    eax,0x3
  803dae:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    cur_proc=pnr;
  803db1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803db4:	89 05 72 07 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10772],eax        # 41452c <cur_proc>
    switch_proc_asm(sel);
  803dba:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803dbd:	89 c7                	mov    edi,eax
  803dbf:	e8 76 85 00 00       	call   80c33a <switch_proc_asm>
}
  803dc4:	90                   	nop
  803dc5:	c9                   	leave  
  803dc6:	c3                   	ret    

0000000000803dc7 <switch_proc>:
void switch_proc(int pnr){
  803dc7:	f3 0f 1e fa          	endbr64 
  803dcb:	55                   	push   rbp
  803dcc:	48 89 e5             	mov    rbp,rsp
  803dcf:	48 81 ec 20 03 00 00 	sub    rsp,0x320
  803dd6:	89 bd ec fc ff ff    	mov    DWORD PTR [rbp-0x314],edi
    //printf("switching proc to %d\n",pnr);
    //printf("eip:%x\n",task[pnr].tss.eip);
    struct process p=task[pnr];
  803ddc:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  803de2:	48 63 d0             	movsxd rdx,eax
  803de5:	48 89 d0             	mov    rax,rdx
  803de8:	48 01 c0             	add    rax,rax
  803deb:	48 01 d0             	add    rax,rdx
  803dee:	48 c1 e0 08          	shl    rax,0x8
  803df2:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  803df9:	48 8d 85 f0 fc ff ff 	lea    rax,[rbp-0x310]
  803e00:	48 89 d6             	mov    rsi,rdx
  803e03:	ba 60 00 00 00       	mov    edx,0x60
  803e08:	48 89 c7             	mov    rdi,rax
  803e0b:	48 89 d1             	mov    rcx,rdx
  803e0e:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
    save_context(&task[cur_proc].tss);
  803e11:	8b 05 15 07 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10715]        # 41452c <cur_proc>
  803e17:	48 63 d0             	movsxd rdx,eax
  803e1a:	48 89 d0             	mov    rax,rdx
  803e1d:	48 01 c0             	add    rax,rax
  803e20:	48 01 d0             	add    rax,rdx
  803e23:	48 c1 e0 08          	shl    rax,0x8
  803e27:	48 05 c0 01 00 00    	add    rax,0x1c0
  803e2d:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803e33:	48 83 c0 04          	add    rax,0x4
  803e37:	48 89 c7             	mov    rdi,rax
  803e3a:	e8 53 00 00 00       	call   803e92 <save_context>
//    //重新设置0号进程
//    task[0].tss.eip=proc_zero;
//    task[0].tss.cr3=PAGE_INDEX_ADDR;
//    task[0].tss.eflags=0x202;
    cur_proc=pnr;
  803e3f:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  803e45:	89 05 e1 06 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc106e1],eax        # 41452c <cur_proc>
    int sel=_TSS_IND(pnr)*8;
  803e4b:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  803e51:	01 c0                	add    eax,eax
  803e53:	83 c0 05             	add    eax,0x5
  803e56:	c1 e0 03             	shl    eax,0x3
  803e59:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    switch_to(NULL, &task[pnr].tss);
  803e5c:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  803e62:	48 63 d0             	movsxd rdx,eax
  803e65:	48 89 d0             	mov    rax,rdx
  803e68:	48 01 c0             	add    rax,rax
  803e6b:	48 01 d0             	add    rax,rdx
  803e6e:	48 c1 e0 08          	shl    rax,0x8
  803e72:	48 05 c0 01 00 00    	add    rax,0x1c0
  803e78:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803e7e:	48 83 c0 04          	add    rax,0x4
  803e82:	48 89 c6             	mov    rsi,rax
  803e85:	bf 00 00 00 00       	mov    edi,0x0
  803e8a:	e8 6d 0a 00 00       	call   8048fc <switch_to>
    //asm volatile("push %0":"=r"(task[pnr].tss.eip));
    //switch_proc_asm(pnr*8+0x8*3);
}
  803e8f:	90                   	nop
  803e90:	c9                   	leave  
  803e91:	c3                   	ret    

0000000000803e92 <save_context>:
void save_context(TSS *tss)
{
  803e92:	f3 0f 1e fa          	endbr64 
  803e96:	55                   	push   rbp
  803e97:	48 89 e5             	mov    rbp,rsp
  803e9a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//    tss->esi=scene_saver.esi;
//    tss->edi=scene_saver.edi;
//    tss->eflags=scene_saver.eflags;
//    tss->esp=scene_saver.esp;
//    tss->ebp=scene_saver.ebp;
}
  803e9e:	90                   	nop
  803e9f:	5d                   	pop    rbp
  803ea0:	c3                   	ret    

0000000000803ea1 <palloc>:
    task[index].stat=READY;
    return index;
} */
//为指定进程申请新的内存，并返回这块内存的线性地址。
void* palloc(int proc_index,int size)
{
  803ea1:	f3 0f 1e fa          	endbr64 
  803ea5:	55                   	push   rbp
  803ea6:	48 89 e5             	mov    rbp,rsp
  803ea9:	48 83 ec 60          	sub    rsp,0x60
  803ead:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  803eb0:	89 75 a8             	mov    DWORD PTR [rbp-0x58],esi
    int page_c=size/4096+size%4096?1:0;
  803eb3:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  803eb6:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  803ebc:	85 c0                	test   eax,eax
  803ebe:	0f 48 c2             	cmovs  eax,edx
  803ec1:	c1 f8 0c             	sar    eax,0xc
  803ec4:	89 c1                	mov    ecx,eax
  803ec6:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  803ec9:	99                   	cdq    
  803eca:	c1 ea 14             	shr    edx,0x14
  803ecd:	01 d0                	add    eax,edx
  803ecf:	25 ff 0f 00 00       	and    eax,0xfff
  803ed4:	29 d0                	sub    eax,edx
  803ed6:	01 c8                	add    eax,ecx
  803ed8:	85 c0                	test   eax,eax
  803eda:	0f 95 c0             	setne  al
  803edd:	0f b6 c0             	movzx  eax,al
  803ee0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=0;
  803ee3:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    void *ptr=NULL;
  803eea:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  803ef1:	00 
    page_item *pgind=NULL;//task[proc_index].tss.cr3;
  803ef2:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  803ef9:	00 
    pgind++;
  803efa:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  803eff:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [rbp-0x14],0x1
  803f06:	e9 76 02 00 00       	jmp    804181 <palloc+0x2e0>
    {
        page_item* tblp=*pgind&0xfffff000;
  803f0b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803f0f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803f12:	25 00 f0 ff ff       	and    eax,0xfffff000
  803f17:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for(int j=0;j<1024;j++)
  803f1b:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  803f22:	e9 44 02 00 00       	jmp    80416b <palloc+0x2ca>
        {
            int v=*tblp&PAGE_PRESENT;
  803f27:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803f2b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803f2e:	83 e0 01             	and    eax,0x1
  803f31:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
            if(!v)
  803f34:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  803f38:	0f 85 24 02 00 00    	jne    804162 <palloc+0x2c1>
            {
                int new_pg=req_a_page();
  803f3e:	b8 00 00 00 00       	mov    eax,0x0
  803f43:	e8 35 d7 ff ff       	call   80167d <req_a_page>
  803f48:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
                if(new_pg==-1)
  803f4b:	83 7d c8 ff          	cmp    DWORD PTR [rbp-0x38],0xffffffff
  803f4f:	0f 85 dc 00 00 00    	jne    804031 <palloc+0x190>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  803f55:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803f58:	48 63 d0             	movsxd rdx,eax
  803f5b:	48 89 d0             	mov    rax,rdx
  803f5e:	48 01 c0             	add    rax,rax
  803f61:	48 01 d0             	add    rax,rdx
  803f64:	48 c1 e0 08          	shl    rax,0x8
  803f68:	48 05 f4 84 40 00    	add    rax,0x4084f4
  803f6e:	0f b7 00             	movzx  eax,WORD PTR [rax]
  803f71:	0f b7 c0             	movzx  eax,ax
  803f74:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  803f77:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803f7a:	48 63 d0             	movsxd rdx,eax
  803f7d:	48 89 d0             	mov    rax,rdx
  803f80:	48 01 c0             	add    rax,rax
  803f83:	48 01 d0             	add    rax,rdx
  803f86:	48 c1 e0 08          	shl    rax,0x8
  803f8a:	48 05 f0 84 40 00    	add    rax,0x4084f0
  803f90:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  803f94:	0f b7 c0             	movzx  eax,ax
  803f97:	c1 e0 10             	shl    eax,0x10
  803f9a:	25 00 00 0f 00       	and    eax,0xf0000
  803f9f:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    size+=c;
  803fa2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803fa5:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  803fa8:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  803fab:	89 c1                	mov    ecx,eax
  803fad:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803fb0:	48 63 d0             	movsxd rdx,eax
  803fb3:	48 89 d0             	mov    rax,rdx
  803fb6:	48 01 c0             	add    rax,rax
  803fb9:	48 01 d0             	add    rax,rdx
  803fbc:	48 c1 e0 08          	shl    rax,0x8
  803fc0:	48 05 f4 84 40 00    	add    rax,0x4084f4
  803fc6:	66 89 08             	mov    WORD PTR [rax],cx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  803fc9:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803fcc:	48 63 d0             	movsxd rdx,eax
  803fcf:	48 89 d0             	mov    rax,rdx
  803fd2:	48 01 c0             	add    rax,rax
  803fd5:	48 01 d0             	add    rax,rdx
  803fd8:	48 c1 e0 08          	shl    rax,0x8
  803fdc:	48 05 f0 84 40 00    	add    rax,0x4084f0
  803fe2:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  803fe6:	0f b7 c0             	movzx  eax,ax
  803fe9:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    tmp_attr&=0xfff0;
  803fec:	81 65 b0 f0 ff 00 00 	and    DWORD PTR [rbp-0x50],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  803ff3:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  803ff6:	c1 e8 10             	shr    eax,0x10
  803ff9:	83 e0 0f             	and    eax,0xf
  803ffc:	89 c2                	mov    edx,eax
  803ffe:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  804001:	01 d0                	add    eax,edx
  804003:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  804006:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  804009:	89 c1                	mov    ecx,eax
  80400b:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80400e:	48 63 d0             	movsxd rdx,eax
  804011:	48 89 d0             	mov    rax,rdx
  804014:	48 01 c0             	add    rax,rax
  804017:	48 01 d0             	add    rax,rdx
  80401a:	48 c1 e0 08          	shl    rax,0x8
  80401e:	48 05 f0 84 40 00    	add    rax,0x4084f0
  804024:	66 89 48 09          	mov    WORD PTR [rax+0x9],cx
                    return ptr;//失败了，只能申请一部分的内存或者返回NULL
  804028:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80402c:	e9 62 01 00 00       	jmp    804193 <palloc+0x2f2>
                }
                int addr=get_phyaddr(new_pg);
  804031:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  804034:	89 c7                	mov    edi,eax
  804036:	e8 31 d8 ff ff       	call   80186c <get_phyaddr>
  80403b:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
                set_page_item(tblp,addr,PAGE_PRESENT|\
  80403e:	8b 4d c4             	mov    ecx,DWORD PTR [rbp-0x3c]
  804041:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804045:	ba 07 00 00 00       	mov    edx,0x7
  80404a:	89 ce                	mov    esi,ecx
  80404c:	48 89 c7             	mov    rdi,rax
  80404f:	e8 2b d8 ff ff       	call   80187f <set_page_item>
                PAGE_RWX|PAGE_FOR_ALL);
                int laddr=i*0x400000+j*0x1000;//线性地址
  804054:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804057:	c1 e0 0a             	shl    eax,0xa
  80405a:	89 c2                	mov    edx,eax
  80405c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80405f:	01 d0                	add    eax,edx
  804061:	c1 e0 0c             	shl    eax,0xc
  804064:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
                if(ptr==NULL)
  804067:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
  80406c:	75 09                	jne    804077 <palloc+0x1d6>
                {
                   // ptr=laddr;
                    palloc_paddr=addr;
  80406e:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  804071:	89 05 bd 04 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc104bd],eax        # 414534 <palloc_paddr>
                }
                page_c--;
  804077:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
                c++;
  80407b:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                if(page_c==0)
  80407f:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  804083:	0f 85 d9 00 00 00    	jne    804162 <palloc+0x2c1>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  804089:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80408c:	48 63 d0             	movsxd rdx,eax
  80408f:	48 89 d0             	mov    rax,rdx
  804092:	48 01 c0             	add    rax,rax
  804095:	48 01 d0             	add    rax,rdx
  804098:	48 c1 e0 08          	shl    rax,0x8
  80409c:	48 05 f4 84 40 00    	add    rax,0x4084f4
  8040a2:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8040a5:	0f b7 c0             	movzx  eax,ax
  8040a8:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  8040ab:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8040ae:	48 63 d0             	movsxd rdx,eax
  8040b1:	48 89 d0             	mov    rax,rdx
  8040b4:	48 01 c0             	add    rax,rax
  8040b7:	48 01 d0             	add    rax,rdx
  8040ba:	48 c1 e0 08          	shl    rax,0x8
  8040be:	48 05 f0 84 40 00    	add    rax,0x4084f0
  8040c4:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  8040c8:	0f b7 c0             	movzx  eax,ax
  8040cb:	c1 e0 10             	shl    eax,0x10
  8040ce:	25 00 00 0f 00       	and    eax,0xf0000
  8040d3:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    size+=c;
  8040d6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8040d9:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  8040dc:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  8040df:	89 c1                	mov    ecx,eax
  8040e1:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8040e4:	48 63 d0             	movsxd rdx,eax
  8040e7:	48 89 d0             	mov    rax,rdx
  8040ea:	48 01 c0             	add    rax,rax
  8040ed:	48 01 d0             	add    rax,rdx
  8040f0:	48 c1 e0 08          	shl    rax,0x8
  8040f4:	48 05 f4 84 40 00    	add    rax,0x4084f4
  8040fa:	66 89 08             	mov    WORD PTR [rax],cx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  8040fd:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804100:	48 63 d0             	movsxd rdx,eax
  804103:	48 89 d0             	mov    rax,rdx
  804106:	48 01 c0             	add    rax,rax
  804109:	48 01 d0             	add    rax,rdx
  80410c:	48 c1 e0 08          	shl    rax,0x8
  804110:	48 05 f0 84 40 00    	add    rax,0x4084f0
  804116:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  80411a:	0f b7 c0             	movzx  eax,ax
  80411d:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    tmp_attr&=0xfff0;
  804120:	81 65 b8 f0 ff 00 00 	and    DWORD PTR [rbp-0x48],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  804127:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  80412a:	c1 e8 10             	shr    eax,0x10
  80412d:	83 e0 0f             	and    eax,0xf
  804130:	89 c2                	mov    edx,eax
  804132:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  804135:	01 d0                	add    eax,edx
  804137:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  80413a:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  80413d:	89 c1                	mov    ecx,eax
  80413f:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804142:	48 63 d0             	movsxd rdx,eax
  804145:	48 89 d0             	mov    rax,rdx
  804148:	48 01 c0             	add    rax,rax
  80414b:	48 01 d0             	add    rax,rdx
  80414e:	48 c1 e0 08          	shl    rax,0x8
  804152:	48 05 f0 84 40 00    	add    rax,0x4084f0
  804158:	66 89 48 09          	mov    WORD PTR [rax+0x9],cx
                    return ptr;
  80415c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804160:	eb 31                	jmp    804193 <palloc+0x2f2>
                }
            }
            tblp++;
  804162:	48 83 45 e0 08       	add    QWORD PTR [rbp-0x20],0x8
        for(int j=0;j<1024;j++)
  804167:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  80416b:	81 7d dc ff 03 00 00 	cmp    DWORD PTR [rbp-0x24],0x3ff
  804172:	0f 8e af fd ff ff    	jle    803f27 <palloc+0x86>
        }
        pgind++;
  804178:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  80417d:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804181:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  804188:	0f 8e 7d fd ff ff    	jle    803f0b <palloc+0x6a>
    }
    return NULL;
  80418e:	b8 00 00 00 00       	mov    eax,0x0
}
  804193:	c9                   	leave  
  804194:	c3                   	ret    

0000000000804195 <malloc>:
//为当前进程申请新的内存，并返回这块内存的线性地址。
void* malloc(int size)
{
  804195:	f3 0f 1e fa          	endbr64 
  804199:	55                   	push   rbp
  80419a:	48 89 e5             	mov    rbp,rsp
  80419d:	48 83 ec 10          	sub    rsp,0x10
  8041a1:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return palloc(cur_proc,size);
  8041a4:	8b 05 82 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10382]        # 41452c <cur_proc>
  8041aa:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8041ad:	89 d6                	mov    esi,edx
  8041af:	89 c7                	mov    edi,eax
  8041b1:	e8 eb fc ff ff       	call   803ea1 <palloc>
}
  8041b6:	c9                   	leave  
  8041b7:	c3                   	ret    

00000000008041b8 <proc_end>:
void proc_end()
{
  8041b8:	f3 0f 1e fa          	endbr64 
  8041bc:	55                   	push   rbp
  8041bd:	48 89 e5             	mov    rbp,rsp
  8041c0:	48 83 ec 10          	sub    rsp,0x10
    int ret;
    asm volatile("mov %%eax,%0":"=m"(ret));
  8041c4:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("proc #%d ended with retv %d.\n",cur_proc,ret);
    //切换堆栈
    //asm volatile("mov %0,%%rsp"::"r"(task[0].tss.esp));
    del_proc(cur_proc);
  8041c7:	8b 05 5f 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1035f]        # 41452c <cur_proc>
  8041cd:	89 c7                	mov    edi,eax
  8041cf:	e8 90 00 00 00       	call   804264 <del_proc>
    if(task[cur_proc].parent_pid!=-1){
  8041d4:	8b 05 52 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10352]        # 41452c <cur_proc>
  8041da:	48 63 d0             	movsxd rdx,eax
  8041dd:	48 89 d0             	mov    rax,rdx
  8041e0:	48 01 c0             	add    rax,rax
  8041e3:	48 01 d0             	add    rax,rdx
  8041e6:	48 c1 e0 08          	shl    rax,0x8
  8041ea:	48 05 28 85 40 00    	add    rax,0x408528
  8041f0:	8b 00                	mov    eax,DWORD PTR [rax]
  8041f2:	83 f8 ff             	cmp    eax,0xffffffff
  8041f5:	74 60                	je     804257 <proc_end+0x9f>
        task[task[cur_proc].parent_pid].stat=READY;
  8041f7:	8b 05 2f 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1032f]        # 41452c <cur_proc>
  8041fd:	48 63 d0             	movsxd rdx,eax
  804200:	48 89 d0             	mov    rax,rdx
  804203:	48 01 c0             	add    rax,rax
  804206:	48 01 d0             	add    rax,rdx
  804209:	48 c1 e0 08          	shl    rax,0x8
  80420d:	48 05 28 85 40 00    	add    rax,0x408528
  804213:	8b 00                	mov    eax,DWORD PTR [rax]
  804215:	89 c2                	mov    edx,eax
  804217:	48 89 d0             	mov    rax,rdx
  80421a:	48 01 c0             	add    rax,rax
  80421d:	48 01 d0             	add    rax,rdx
  804220:	48 c1 e0 08          	shl    rax,0x8
  804224:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80422a:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        switch_proc_tss(task[cur_proc].parent_pid);
  804230:	8b 05 f6 02 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc102f6]        # 41452c <cur_proc>
  804236:	48 63 d0             	movsxd rdx,eax
  804239:	48 89 d0             	mov    rax,rdx
  80423c:	48 01 c0             	add    rax,rax
  80423f:	48 01 d0             	add    rax,rdx
  804242:	48 c1 e0 08          	shl    rax,0x8
  804246:	48 05 28 85 40 00    	add    rax,0x408528
  80424c:	8b 00                	mov    eax,DWORD PTR [rax]
  80424e:	89 c7                	mov    edi,eax
  804250:	e8 3f fb ff ff       	call   803d94 <switch_proc_tss>
    }
    else
        switch_proc_tss(0);
    //syscall(SYSCALL_DEL_PROC,cur_proc,0,0,0,0);
}
  804255:	eb 0a                	jmp    804261 <proc_end+0xa9>
        switch_proc_tss(0);
  804257:	bf 00 00 00 00       	mov    edi,0x0
  80425c:	e8 33 fb ff ff       	call   803d94 <switch_proc_tss>
}
  804261:	90                   	nop
  804262:	c9                   	leave  
  804263:	c3                   	ret    

0000000000804264 <del_proc>:
void del_proc(int pnr)
{
  804264:	f3 0f 1e fa          	endbr64 
  804268:	55                   	push   rbp
  804269:	48 89 e5             	mov    rbp,rsp
  80426c:	48 83 ec 30          	sub    rsp,0x30
  804270:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
    task[pnr].stat=ENDED;
  804273:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804276:	48 63 d0             	movsxd rdx,eax
  804279:	48 89 d0             	mov    rax,rdx
  80427c:	48 01 c0             	add    rax,rax
  80427f:	48 01 d0             	add    rax,rdx
  804282:	48 c1 e0 08          	shl    rax,0x8
  804286:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80428c:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[pnr].pid=-1;
  804292:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804295:	48 63 d0             	movsxd rdx,eax
  804298:	48 89 d0             	mov    rax,rdx
  80429b:	48 01 c0             	add    rax,rax
  80429e:	48 01 d0             	add    rax,rdx
  8042a1:	48 c1 e0 08          	shl    rax,0x8
  8042a5:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8042ab:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    //释放申请的页面
    page_item *p;//task[pnr].tss.cr3;
    p++;
  8042b1:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
    for(;(*p&PAGE_PRESENT)!=0;p++)
  8042b6:	eb 63                	jmp    80431b <del_proc+0xb7>
    {
        page_item *tp=*p&0xfffff000;
  8042b8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8042bc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8042bf:	25 00 f0 ff ff       	and    eax,0xfffff000
  8042c4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<1024;i++)
  8042c8:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8042cf:	eb 30                	jmp    804301 <del_proc+0x9d>
        {
            unsigned int present=*tp&PAGE_PRESENT;
  8042d1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8042d5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8042d8:	83 e0 01             	and    eax,0x1
  8042db:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            if(present)
  8042de:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  8042e2:	74 14                	je     8042f8 <del_proc+0x94>
            {
                free_page(*tp&0xfffff000);
  8042e4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8042e8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8042eb:	25 00 f0 ff ff       	and    eax,0xfffff000
  8042f0:	48 89 c7             	mov    rdi,rax
  8042f3:	e8 55 d4 ff ff       	call   80174d <free_page>
                //printf("freed page at %x.\n",*tp&0xfffff000);
            }
            tp++;
  8042f8:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
        for(int i=0;i<1024;i++)
  8042fd:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804301:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  804308:	7e c7                	jle    8042d1 <del_proc+0x6d>
        }
        vmfree(tp);
  80430a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80430e:	48 89 c7             	mov    rdi,rax
  804311:	e8 43 d0 ff ff       	call   801359 <vmfree>
    for(;(*p&PAGE_PRESENT)!=0;p++)
  804316:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
  80431b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80431f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804322:	83 e0 01             	and    eax,0x1
  804325:	48 85 c0             	test   rax,rax
  804328:	75 8e                	jne    8042b8 <del_proc+0x54>
    }
    //释放存放页目录的页面
    vmfree(p);
  80432a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80432e:	48 89 c7             	mov    rdi,rax
  804331:	e8 23 d0 ff ff       	call   801359 <vmfree>
    //从进程中解除cr3,tss和ldt
    //switch_proc_tss(task[pnr]);
}
  804336:	90                   	nop
  804337:	c9                   	leave  
  804338:	c3                   	ret    

0000000000804339 <set_proc_stat>:

int set_proc_stat(int pid,int stat)
{
  804339:	f3 0f 1e fa          	endbr64 
  80433d:	55                   	push   rbp
  80433e:	48 89 e5             	mov    rbp,rsp
  804341:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  804344:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==-1)return -1;
  804347:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  80434b:	75 0a                	jne    804357 <set_proc_stat+0x1e>
  80434d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804352:	e9 8c 00 00 00       	jmp    8043e3 <set_proc_stat+0xaa>
    int i=0;
  804357:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;task[i].pid!=pid;i++);
  80435e:	eb 04                	jmp    804364 <set_proc_stat+0x2b>
  804360:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  804364:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804367:	48 63 d0             	movsxd rdx,eax
  80436a:	48 89 d0             	mov    rax,rdx
  80436d:	48 01 c0             	add    rax,rax
  804370:	48 01 d0             	add    rax,rdx
  804373:	48 c1 e0 08          	shl    rax,0x8
  804377:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80437d:	8b 10                	mov    edx,DWORD PTR [rax]
  80437f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804382:	39 c2                	cmp    edx,eax
  804384:	75 da                	jne    804360 <set_proc_stat+0x27>
    if(i==MAX_PROC_COUNT)return -1;
  804386:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  80438a:	75 07                	jne    804393 <set_proc_stat+0x5a>
  80438c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804391:	eb 50                	jmp    8043e3 <set_proc_stat+0xaa>
    task[i].stat=stat;
  804393:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804396:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804399:	48 63 c8             	movsxd rcx,eax
  80439c:	48 89 c8             	mov    rax,rcx
  80439f:	48 01 c0             	add    rax,rax
  8043a2:	48 01 c8             	add    rax,rcx
  8043a5:	48 c1 e0 08          	shl    rax,0x8
  8043a9:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8043af:	89 10                	mov    DWORD PTR [rax],edx
    //如果这就是正在运行的进程，那么马上停止
    if(cur_proc==i)
  8043b1:	8b 05 75 01 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10175]        # 41452c <cur_proc>
  8043b7:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  8043ba:	75 22                	jne    8043de <set_proc_stat+0xa5>
        task[cur_proc].utime=MAX_UTIME;
  8043bc:	8b 05 6a 01 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1016a]        # 41452c <cur_proc>
  8043c2:	48 63 d0             	movsxd rdx,eax
  8043c5:	48 89 d0             	mov    rax,rdx
  8043c8:	48 01 c0             	add    rax,rax
  8043cb:	48 01 d0             	add    rax,rdx
  8043ce:	48 c1 e0 08          	shl    rax,0x8
  8043d2:	48 05 a8 84 40 00    	add    rax,0x4084a8
  8043d8:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    return 0;
  8043de:	b8 00 00 00 00       	mov    eax,0x0
}
  8043e3:	5d                   	pop    rbp
  8043e4:	c3                   	ret    

00000000008043e5 <add_proc_openf>:

    return 0;
} */

int add_proc_openf(struct index_node *entry)
{
  8043e5:	f3 0f 1e fa          	endbr64 
  8043e9:	55                   	push   rbp
  8043ea:	48 89 e5             	mov    rbp,rsp
  8043ed:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_PROC_OPENF;i++){
  8043f1:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8043f8:	eb 6a                	jmp    804464 <add_proc_openf+0x7f>
        if(task[cur_proc].openf[i]==NULL)
  8043fa:	8b 05 2c 01 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1012c]        # 41452c <cur_proc>
  804400:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804403:	48 63 ca             	movsxd rcx,edx
  804406:	48 63 d0             	movsxd rdx,eax
  804409:	48 89 d0             	mov    rax,rdx
  80440c:	48 01 c0             	add    rax,rax
  80440f:	48 01 d0             	add    rax,rdx
  804412:	48 c1 e0 05          	shl    rax,0x5
  804416:	48 01 c8             	add    rax,rcx
  804419:	48 83 c0 18          	add    rax,0x18
  80441d:	48 8b 04 c5 a4 84 40 	mov    rax,QWORD PTR [rax*8+0x4084a4]
  804424:	00 
  804425:	48 85 c0             	test   rax,rax
  804428:	75 36                	jne    804460 <add_proc_openf+0x7b>
        {
            task[cur_proc].openf[i]=entry;
  80442a:	8b 05 fc 00 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc100fc]        # 41452c <cur_proc>
  804430:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804433:	48 63 ca             	movsxd rcx,edx
  804436:	48 63 d0             	movsxd rdx,eax
  804439:	48 89 d0             	mov    rax,rdx
  80443c:	48 01 c0             	add    rax,rax
  80443f:	48 01 d0             	add    rax,rdx
  804442:	48 c1 e0 05          	shl    rax,0x5
  804446:	48 01 c8             	add    rax,rcx
  804449:	48 8d 50 18          	lea    rdx,[rax+0x18]
  80444d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804451:	48 89 04 d5 a4 84 40 	mov    QWORD PTR [rdx*8+0x4084a4],rax
  804458:	00 
            return 0;
  804459:	b8 00 00 00 00       	mov    eax,0x0
  80445e:	eb 0f                	jmp    80446f <add_proc_openf+0x8a>
    for(int i=0;i<MAX_PROC_OPENF;i++){
  804460:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  804464:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  804468:	7e 90                	jle    8043fa <add_proc_openf+0x15>
        }
    }
    return -1;//full
  80446a:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  80446f:	5d                   	pop    rbp
  804470:	c3                   	ret    

0000000000804471 <sys_exit>:
/*
 * 进程结束。
 * */
int sys_exit(int code)
{
  804471:	f3 0f 1e fa          	endbr64 
  804475:	55                   	push   rbp
  804476:	48 89 e5             	mov    rbp,rsp
  804479:	48 83 ec 10          	sub    rsp,0x10
  80447d:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    del_proc(cur_proc);
  804480:	8b 05 a6 00 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc100a6]        # 41452c <cur_proc>
  804486:	89 c7                	mov    edi,eax
  804488:	e8 d7 fd ff ff       	call   804264 <del_proc>
    while(1)
        manage_proc();
  80448d:	b8 00 00 00 00       	mov    eax,0x0
  804492:	e8 37 f7 ff ff       	call   803bce <manage_proc>
  804497:	eb f4                	jmp    80448d <sys_exit+0x1c>

0000000000804499 <reg_proc>:
    dllmain(NULL,0,NULL);
    
}*/

int reg_proc(addr_t entry, struct index_node *cwd, struct index_node *exef)
{
  804499:	f3 0f 1e fa          	endbr64 
  80449d:	55                   	push   rbp
  80449e:	48 89 e5             	mov    rbp,rsp
  8044a1:	53                   	push   rbx
  8044a2:	48 83 ec 48          	sub    rsp,0x48
  8044a6:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  8044aa:	48 89 75 c0          	mov    QWORD PTR [rbp-0x40],rsi
  8044ae:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
    
    int i=req_proc();
  8044b2:	b8 00 00 00 00       	mov    eax,0x0
  8044b7:	e8 23 f4 ff ff       	call   8038df <req_proc>
  8044bc:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(i==-1)return -1;
  8044bf:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  8044c3:	75 0a                	jne    8044cf <reg_proc+0x36>
  8044c5:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8044ca:	e9 c9 01 00 00       	jmp    804698 <reg_proc+0x1ff>

    //栈顶设置在了4G处
    set_proc(0, 0, 0, 0, DS_USER, CS_USER, DS_USER, DS_USER\
  8044cf:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8044d3:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8044d6:	52                   	push   rdx
  8044d7:	6a 00                	push   0x0
  8044d9:	50                   	push   rax
  8044da:	6a 00                	push   0x0
  8044dc:	6a 00                	push   0x0
  8044de:	6a 00                	push   0x0
  8044e0:	68 00 f0 ff ff       	push   0xfffffffffffff000
  8044e5:	c7 44 24 04 ff ff 00 	mov    DWORD PTR [rsp+0x4],0xffff
  8044ec:	00 
  8044ed:	6a 28                	push   0x28
  8044ef:	6a 28                	push   0x28
  8044f1:	6a 28                	push   0x28
  8044f3:	6a 28                	push   0x28
  8044f5:	41 b9 30 00 00 00    	mov    r9d,0x30
  8044fb:	41 b8 28 00 00 00    	mov    r8d,0x28
  804501:	b9 00 00 00 00       	mov    ecx,0x0
  804506:	ba 00 00 00 00       	mov    edx,0x0
  80450b:	be 00 00 00 00       	mov    esi,0x0
  804510:	bf 00 00 00 00       	mov    edi,0x0
  804515:	e8 be f4 ff ff       	call   8039d8 <set_proc>
  80451a:	48 83 c4 58          	add    rsp,0x58
, DS_USER, DS_USER, STACK_TOP, 0, 0, 0, entry, 0, i);
    task[i].pml4=vmalloc();
  80451e:	b8 00 00 00 00       	mov    eax,0x0
  804523:	e8 a2 cd ff ff       	call   8012ca <vmalloc>
  804528:	48 89 c1             	mov    rcx,rax
  80452b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80452e:	48 63 d0             	movsxd rdx,eax
  804531:	48 89 d0             	mov    rax,rdx
  804534:	48 01 c0             	add    rax,rax
  804537:	48 01 d0             	add    rax,rdx
  80453a:	48 c1 e0 08          	shl    rax,0x8
  80453e:	48 05 40 85 40 00    	add    rax,0x408540
  804544:	48 89 48 0c          	mov    QWORD PTR [rax+0xc],rcx
    task[i].pml4[0]=vmalloc();
  804548:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80454b:	48 63 d0             	movsxd rdx,eax
  80454e:	48 89 d0             	mov    rax,rdx
  804551:	48 01 c0             	add    rax,rax
  804554:	48 01 d0             	add    rax,rdx
  804557:	48 c1 e0 08          	shl    rax,0x8
  80455b:	48 05 40 85 40 00    	add    rax,0x408540
  804561:	48 8b 58 0c          	mov    rbx,QWORD PTR [rax+0xc]
  804565:	b8 00 00 00 00       	mov    eax,0x0
  80456a:	e8 5b cd ff ff       	call   8012ca <vmalloc>
  80456f:	48 89 03             	mov    QWORD PTR [rbx],rax
    unsigned long *pdpt=task[i].pml4;
  804572:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804575:	48 63 d0             	movsxd rdx,eax
  804578:	48 89 d0             	mov    rax,rdx
  80457b:	48 01 c0             	add    rax,rax
  80457e:	48 01 d0             	add    rax,rdx
  804581:	48 c1 e0 08          	shl    rax,0x8
  804585:	48 05 40 85 40 00    	add    rax,0x408540
  80458b:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  80458f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    //pdpt第一项(0-1GB)设置为内核空间，这样才能访问中断
    set_1gb_pdpt(pdpt,0,PAGE_PRESENT|PAGE_RWX);
  804593:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804597:	ba 03 00 00 00       	mov    edx,0x3
  80459c:	be 00 00 00 00       	mov    esi,0x0
  8045a1:	48 89 c7             	mov    rdi,rax
  8045a4:	e8 27 d3 ff ff       	call   8018d0 <set_1gb_pdpt>

    //申请一项pd,里面申请一2mb页用于堆栈
    addr_t *stackb=vmalloc();
  8045a9:	b8 00 00 00 00       	mov    eax,0x0
  8045ae:	e8 17 cd ff ff       	call   8012ca <vmalloc>
  8045b3:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    pdpt[3]=(unsigned long)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//3-4G分配栈空间
  8045b7:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8045bb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8045bf:	48 83 c0 18          	add    rax,0x18
  8045c3:	48 83 ca 07          	or     rdx,0x7
  8045c7:	48 89 10             	mov    QWORD PTR [rax],rdx
    set_2mb_pde(stackb + 511, get_phyaddr(req_a_page()), PAGE_FOR_ALL|PAGE_RWX);
  8045ca:	b8 00 00 00 00       	mov    eax,0x0
  8045cf:	e8 a9 d0 ff ff       	call   80167d <req_a_page>
  8045d4:	89 c7                	mov    edi,eax
  8045d6:	e8 91 d2 ff ff       	call   80186c <get_phyaddr>
  8045db:	89 c1                	mov    ecx,eax
  8045dd:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8045e1:	48 05 f8 0f 00 00    	add    rax,0xff8
  8045e7:	ba 06 00 00 00       	mov    edx,0x6
  8045ec:	89 ce                	mov    esi,ecx
  8045ee:	48 89 c7             	mov    rdi,rax
  8045f1:	e8 31 d3 ff ff       	call   801927 <set_2mb_pde>
    task[i].regs.cr3=task[i].pml4;
  8045f6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8045f9:	48 63 d0             	movsxd rdx,eax
  8045fc:	48 89 d0             	mov    rax,rdx
  8045ff:	48 01 c0             	add    rax,rax
  804602:	48 01 d0             	add    rax,rdx
  804605:	48 c1 e0 08          	shl    rax,0x8
  804609:	48 05 40 85 40 00    	add    rax,0x408540
  80460f:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804613:	48 89 c1             	mov    rcx,rax
  804616:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804619:	48 63 d0             	movsxd rdx,eax
  80461c:	48 89 d0             	mov    rax,rdx
  80461f:	48 01 c0             	add    rax,rax
  804622:	48 01 d0             	add    rax,rdx
  804625:	48 c1 e0 08          	shl    rax,0x8
  804629:	48 05 d0 86 40 00    	add    rax,0x4086d0
  80462f:	48 89 08             	mov    QWORD PTR [rax],rcx

    task[i].stat=READY;
  804632:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804635:	48 63 d0             	movsxd rdx,eax
  804638:	48 89 d0             	mov    rax,rdx
  80463b:	48 01 c0             	add    rax,rax
  80463e:	48 01 d0             	add    rax,rdx
  804641:	48 c1 e0 08          	shl    rax,0x8
  804645:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80464b:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[i].cwd=cwd;
  804651:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804654:	48 63 d0             	movsxd rdx,eax
  804657:	48 89 d0             	mov    rax,rdx
  80465a:	48 01 c0             	add    rax,rax
  80465d:	48 01 d0             	add    rax,rdx
  804660:	48 c1 e0 08          	shl    rax,0x8
  804664:	48 8d 90 50 85 40 00 	lea    rdx,[rax+0x408550]
  80466b:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80466f:	48 89 42 04          	mov    QWORD PTR [rdx+0x4],rax
    task[i].exef=exef;
  804673:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804676:	48 63 d0             	movsxd rdx,eax
  804679:	48 89 d0             	mov    rax,rdx
  80467c:	48 01 c0             	add    rax,rax
  80467f:	48 01 d0             	add    rax,rdx
  804682:	48 c1 e0 08          	shl    rax,0x8
  804686:	48 8d 90 50 85 40 00 	lea    rdx,[rax+0x408550]
  80468d:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  804691:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax

    return i;
  804695:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    proc_ret_stack *pstack=stack_paddr+stack_size-12;
    pstack->argc=0;
    pstack->argv=0;
    pstack->proc_end_addr=proc_end;
    int *pptr=pstack;*/
}
  804698:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80469c:	c9                   	leave  
  80469d:	c3                   	ret    

000000000080469e <sys_malloc>:

void * sys_malloc(int size)
{
  80469e:	f3 0f 1e fa          	endbr64 
  8046a2:	55                   	push   rbp
  8046a3:	48 89 e5             	mov    rbp,rsp
  8046a6:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    //
    int n=size/CHUNK_SIZE+size%CHUNK_SIZE?1:0;
  8046a9:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8046ac:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8046b2:	85 c0                	test   eax,eax
  8046b4:	0f 48 c2             	cmovs  eax,edx
  8046b7:	c1 f8 0c             	sar    eax,0xc
  8046ba:	89 c1                	mov    ecx,eax
  8046bc:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8046bf:	99                   	cdq    
  8046c0:	c1 ea 14             	shr    edx,0x14
  8046c3:	01 d0                	add    eax,edx
  8046c5:	25 ff 0f 00 00       	and    eax,0xfff
  8046ca:	29 d0                	sub    eax,edx
  8046cc:	01 c8                	add    eax,ecx
  8046ce:	85 c0                	test   eax,eax
  8046d0:	0f 95 c0             	setne  al
  8046d3:	0f b6 c0             	movzx  eax,al
  8046d6:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    chunk_header *hp=(chunk_header*)task[cur_proc].mem_struct.heap_base;
  8046d9:	8b 05 4d fe c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fe4d]        # 41452c <cur_proc>
  8046df:	48 63 d0             	movsxd rdx,eax
  8046e2:	48 89 d0             	mov    rax,rdx
  8046e5:	48 01 c0             	add    rax,rax
  8046e8:	48 01 d0             	add    rax,rdx
  8046eb:	48 c1 e0 08          	shl    rax,0x8
  8046ef:	48 05 b4 84 40 00    	add    rax,0x4084b4
  8046f5:	8b 00                	mov    eax,DWORD PTR [rax]
  8046f7:	48 98                	cdqe   
  8046f9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  8046fd:	eb 0c                	jmp    80470b <sys_malloc+0x6d>
        hp=hp->next;
  8046ff:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804703:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804707:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  80470b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80470f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804713:	48 85 c0             	test   rax,rax
  804716:	74 16                	je     80472e <sys_malloc+0x90>
  804718:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80471c:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80471f:	85 c0                	test   eax,eax
  804721:	75 0b                	jne    80472e <sys_malloc+0x90>
  804723:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804727:	8b 00                	mov    eax,DWORD PTR [rax]
  804729:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  80472c:	7e d1                	jle    8046ff <sys_malloc+0x61>
    if(hp->pgn<n)
  80472e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804732:	8b 00                	mov    eax,DWORD PTR [rax]
  804734:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804737:	0f 8e 8d 00 00 00    	jle    8047ca <sys_malloc+0x12c>
    {
        //上抬heap top
        if(task[cur_proc].mem_struct.heap_top+CHUNK_SIZE*n>=HEAP_MAXTOP)
  80473d:	8b 05 e9 fd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fde9]        # 41452c <cur_proc>
  804743:	48 63 d0             	movsxd rdx,eax
  804746:	48 89 d0             	mov    rax,rdx
  804749:	48 01 c0             	add    rax,rax
  80474c:	48 01 d0             	add    rax,rdx
  80474f:	48 c1 e0 08          	shl    rax,0x8
  804753:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804759:	8b 10                	mov    edx,DWORD PTR [rax]
  80475b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80475e:	c1 e0 0c             	shl    eax,0xc
  804761:	01 d0                	add    eax,edx
  804763:	3d ff ff ef 01       	cmp    eax,0x1efffff
  804768:	7e 0a                	jle    804774 <sys_malloc+0xd6>
        {
            //超过顶部
            return NULL;
  80476a:	b8 00 00 00 00       	mov    eax,0x0
  80476f:	e9 cf 00 00 00       	jmp    804843 <sys_malloc+0x1a5>
        }
        int needed=n-hp->pgn;
  804774:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804778:	8b 10                	mov    edx,DWORD PTR [rax]
  80477a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80477d:	29 d0                	sub    eax,edx
  80477f:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
        char* p=task[cur_proc].mem_struct.heap_top;
  804782:	8b 05 a4 fd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fda4]        # 41452c <cur_proc>
  804788:	48 63 d0             	movsxd rdx,eax
  80478b:	48 89 d0             	mov    rax,rdx
  80478e:	48 01 c0             	add    rax,rax
  804791:	48 01 d0             	add    rax,rdx
  804794:	48 c1 e0 08          	shl    rax,0x8
  804798:	48 05 b8 84 40 00    	add    rax,0x4084b8
  80479e:	8b 00                	mov    eax,DWORD PTR [rax]
  8047a0:	48 98                	cdqe   
  8047a2:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  8047a6:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8047ad:	eb 13                	jmp    8047c2 <sys_malloc+0x124>
        {
            *p=0;//触发缺页中断
  8047af:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8047b3:	c6 00 00             	mov    BYTE PTR [rax],0x0
            p+=PAGE_SIZE;
  8047b6:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  8047bd:	00 
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  8047be:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8047c2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8047c5:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  8047c8:	7c e5                	jl     8047af <sys_malloc+0x111>
        }
    }
    if(hp->pgn>n)
  8047ca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8047ce:	8b 00                	mov    eax,DWORD PTR [rax]
  8047d0:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  8047d3:	7d 59                	jge    80482e <sys_malloc+0x190>
    {
        //在后面新建一个头
        char *p=hp;
  8047d5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8047d9:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        p+=(n+1)*CHUNK_SIZE;//算上存储头一个
  8047dd:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8047e0:	83 c0 01             	add    eax,0x1
  8047e3:	c1 e0 0c             	shl    eax,0xc
  8047e6:	48 98                	cdqe   
  8047e8:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
        chunk_header *np=p;
  8047ec:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8047f0:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
        np->pgn=hp->pgn-n-1;
  8047f4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8047f8:	8b 00                	mov    eax,DWORD PTR [rax]
  8047fa:	2b 45 e8             	sub    eax,DWORD PTR [rbp-0x18]
  8047fd:	8d 50 ff             	lea    edx,[rax-0x1]
  804800:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804804:	89 10                	mov    DWORD PTR [rax],edx
        np->next=hp->next;
  804806:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80480a:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  80480e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804812:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
        np->prev=hp;
  804816:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80481a:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80481e:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
        hp->next=np;
  804822:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804826:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80482a:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    }
    hp->alloc=1;//分配完毕
  80482e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804832:	c7 40 04 01 00 00 00 	mov    DWORD PTR [rax+0x4],0x1
    return (char*)hp+CHUNK_SIZE;//返回后边的第一个数据块地址
  804839:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80483d:	48 05 00 10 00 00    	add    rax,0x1000
}
  804843:	5d                   	pop    rbp
  804844:	c3                   	ret    

0000000000804845 <sys_free>:
int sys_free(int ptr)
{
  804845:	f3 0f 1e fa          	endbr64 
  804849:	55                   	push   rbp
  80484a:	48 89 e5             	mov    rbp,rsp
  80484d:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    chunk_header *hp=ptr-CHUNK_SIZE;//回退到头
  804850:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804853:	2d 00 10 00 00       	sub    eax,0x1000
  804858:	48 98                	cdqe   
  80485a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    hp->alloc=0;
  80485e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804862:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
    //合并
    //向后合并
    chunk_header *p=hp->next;
  804869:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80486d:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804871:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804875:	eb 2e                	jmp    8048a5 <sys_free+0x60>
    {
        if(p->alloc==0)
  804877:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80487b:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80487e:	85 c0                	test   eax,eax
  804880:	75 2c                	jne    8048ae <sys_free+0x69>
        {
            hp->pgn+=p->pgn+1;//把区域合并
  804882:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804886:	8b 10                	mov    edx,DWORD PTR [rax]
  804888:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80488c:	8b 00                	mov    eax,DWORD PTR [rax]
  80488e:	83 c0 01             	add    eax,0x1
  804891:	01 c2                	add    edx,eax
  804893:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804897:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->next;
  804899:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80489d:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8048a1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  8048a5:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8048aa:	75 cb                	jne    804877 <sys_free+0x32>
  8048ac:	eb 01                	jmp    8048af <sys_free+0x6a>
            break;
  8048ae:	90                   	nop
    }
    //向前合并
    p=hp->prev;
  8048af:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8048b3:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8048b7:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  8048bb:	eb 2e                	jmp    8048eb <sys_free+0xa6>
    {
        if(p->alloc==0)
  8048bd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8048c1:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8048c4:	85 c0                	test   eax,eax
  8048c6:	75 2c                	jne    8048f4 <sys_free+0xaf>
        {
            p->pgn+=hp->pgn+1;//把区域合并
  8048c8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8048cc:	8b 10                	mov    edx,DWORD PTR [rax]
  8048ce:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8048d2:	8b 00                	mov    eax,DWORD PTR [rax]
  8048d4:	83 c0 01             	add    eax,0x1
  8048d7:	01 c2                	add    edx,eax
  8048d9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8048dd:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->prev;
  8048df:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8048e3:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8048e7:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  8048eb:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8048f0:	75 cb                	jne    8048bd <sys_free+0x78>
  8048f2:	eb 01                	jmp    8048f5 <sys_free+0xb0>
            break;
  8048f4:	90                   	nop
    }
    //合并完成
    return 0;
  8048f5:	b8 00 00 00 00       	mov    eax,0x0
}
  8048fa:	5d                   	pop    rbp
  8048fb:	c3                   	ret    

00000000008048fc <switch_to>:

void switch_to(struct process *from, struct process *to) {
  8048fc:	f3 0f 1e fa          	endbr64 
  804900:	55                   	push   rbp
  804901:	48 89 e5             	mov    rbp,rsp
  804904:	53                   	push   rbx
  804905:	48 89 7d f0          	mov    QWORD PTR [rbp-0x10],rdi
  804909:	48 89 75 e8          	mov    QWORD PTR [rbp-0x18],rsi
    cur_proc=to-task;
  80490d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804911:	48 2d a0 84 40 00    	sub    rax,0x4084a0
  804917:	48 c1 f8 08          	sar    rax,0x8
  80491b:	48 89 c2             	mov    rdx,rax
  80491e:	48 b8 ab aa aa aa aa 	movabs rax,0xaaaaaaaaaaaaaaab
  804925:	aa aa aa 
  804928:	48 0f af c2          	imul   rax,rdx
  80492c:	89 05 fa fb c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0fbfa],eax        # 41452c <cur_proc>
    current=&task[cur_proc];
  804932:	8b 05 f4 fb c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fbf4]        # 41452c <cur_proc>
  804938:	48 63 d0             	movsxd rdx,eax
  80493b:	48 89 d0             	mov    rax,rdx
  80493e:	48 01 c0             	add    rax,rax
  804941:	48 01 d0             	add    rax,rdx
  804944:	48 c1 e0 08          	shl    rax,0x8
  804948:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80494e:	48 89 05 4b fb c0 ff 	mov    QWORD PTR [rip+0xffffffffffc0fb4b],rax        # 4144a0 <current>
    asm volatile("mov %0,%%rax\n"
  804955:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804959:	48 8b 80 ac 00 00 00 	mov    rax,QWORD PTR [rax+0xac]
  804960:	0f 22 d8             	mov    cr3,rax
                 "mov %%rax,%%cr3\n":"=m"(to->pml4));
    asm volatile("mov %%rsp,%0\r\n"
  804963:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  804967:	4c 8b 55 f0          	mov    r10,QWORD PTR [rbp-0x10]
  80496b:	4c 8b 5d f0          	mov    r11,QWORD PTR [rbp-0x10]
  80496f:	48 8b 5d f0          	mov    rbx,QWORD PTR [rbp-0x10]
  804973:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804977:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80497b:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  80497f:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  804983:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  804987:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  80498b:	49 89 a1 68 02 00 00 	mov    QWORD PTR [r9+0x268],rsp
  804992:	48 8d 05 24 00 00 00 	lea    rax,[rip+0x24]        # 8049bd <done>
  804999:	49 89 82 38 02 00 00 	mov    QWORD PTR [r10+0x238],rax
  8049a0:	41 8c a3 a8 02 00 00 	mov    WORD PTR [r11+0x2a8],fs
  8049a7:	8c ab b0 02 00 00    	mov    WORD PTR [rbx+0x2b0],gs
  8049ad:	48 8b a1 68 02 00 00 	mov    rsp,QWORD PTR [rcx+0x268]
  8049b4:	41 ff b0 38 02 00 00 	push   QWORD PTR [r8+0x238]
  8049bb:	eb 08                	jmp    8049c5 <__switch_to>

00000000008049bd <done>:
  8049bd:	90                   	nop
                 "nop":"=m"(from->regs.rsp),"=m"(from->regs.rip),
                 "=m"(from->regs.fs),"=m"(from->regs.gs):
                "m"(to->regs.fs),"m"(to->regs.gs),"m"(to->regs.rsp),"m"(to->regs.rip),
                "D"(from),"S"(to));

}
  8049be:	90                   	nop
  8049bf:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8049c3:	c9                   	leave  
  8049c4:	c3                   	ret    

00000000008049c5 <__switch_to>:
void __switch_to(struct process *from, struct process *to) {
  8049c5:	f3 0f 1e fa          	endbr64 
  8049c9:	55                   	push   rbp
  8049ca:	48 89 e5             	mov    rbp,rsp
  8049cd:	53                   	push   rbx
  8049ce:	48 83 ec 18          	sub    rsp,0x18
  8049d2:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8049d6:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  8049da:	48 8b 05 df 7a 00 00 	mov    rax,QWORD PTR [rip+0x7adf]        # 80c4c0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  8049e1:	4c 8b 50 54          	mov    r10,QWORD PTR [rax+0x54]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  8049e5:	48 8b 05 d4 7a 00 00 	mov    rax,QWORD PTR [rip+0x7ad4]        # 80c4c0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  8049ec:	4c 8b 48 4c          	mov    r9,QWORD PTR [rax+0x4c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  8049f0:	48 8b 05 c9 7a 00 00 	mov    rax,QWORD PTR [rip+0x7ac9]        # 80c4c0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  8049f7:	4c 8b 40 44          	mov    r8,QWORD PTR [rax+0x44]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  8049fb:	48 8b 05 be 7a 00 00 	mov    rax,QWORD PTR [rip+0x7abe]        # 80c4c0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804a02:	48 8b 78 3c          	mov    rdi,QWORD PTR [rax+0x3c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804a06:	48 8b 05 b3 7a 00 00 	mov    rax,QWORD PTR [rip+0x7ab3]        # 80c4c0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804a0d:	48 8b 58 34          	mov    rbx,QWORD PTR [rax+0x34]
  804a11:	48 8b 05 a8 7a 00 00 	mov    rax,QWORD PTR [rip+0x7aa8]        # 80c4c0 <tss>
  804a18:	4c 8b 58 2c          	mov    r11,QWORD PTR [rax+0x2c]
  804a1c:	48 8b 05 9d 7a 00 00 	mov    rax,QWORD PTR [rip+0x7a9d]        # 80c4c0 <tss>
  804a23:	48 8b 48 24          	mov    rcx,QWORD PTR [rax+0x24]
  804a27:	48 8b 05 92 7a 00 00 	mov    rax,QWORD PTR [rip+0x7a92]        # 80c4c0 <tss>
  804a2e:	48 8b 50 14          	mov    rdx,QWORD PTR [rax+0x14]
  804a32:	48 8b 05 87 7a 00 00 	mov    rax,QWORD PTR [rip+0x7a87]        # 80c4c0 <tss>
  804a39:	48 8b 70 0c          	mov    rsi,QWORD PTR [rax+0xc]
  804a3d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804a41:	48 8b 80 c8 01 00 00 	mov    rax,QWORD PTR [rax+0x1c8]
  804a48:	41 52                	push   r10
  804a4a:	41 51                	push   r9
  804a4c:	41 50                	push   r8
  804a4e:	57                   	push   rdi
  804a4f:	49 89 d9             	mov    r9,rbx
  804a52:	4d 89 d8             	mov    r8,r11
  804a55:	48 89 c7             	mov    rdi,rax
  804a58:	e8 34 00 00 00       	call   804a91 <set_tss>
  804a5d:	48 83 c4 20          	add    rsp,0x20
    asm volatile("mov %%fs,%0\r\n"
  804a61:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804a65:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  804a69:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804a6d:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  804a71:	8c a0 a8 02 00 00    	mov    WORD PTR [rax+0x2a8],fs
  804a77:	8c ae b0 02 00 00    	mov    WORD PTR [rsi+0x2b0],gs
  804a7d:	8e a2 a8 02 00 00    	mov    fs,WORD PTR [rdx+0x2a8]
  804a83:	8e a9 b0 02 00 00    	mov    gs,WORD PTR [rcx+0x2b0]
  804a89:	fb                   	sti    
                 "mov %%gs,%1\r\n"
                 "mov %2,%%fs\r\n"
                 "mov %3,%%gs\r\n"
                 "sti":"=m"(to->regs.fs),"=m"(to->regs.gs):
                 "m"(from->regs.fs),"m"(from->regs.gs));
}
  804a8a:	90                   	nop
  804a8b:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804a8f:	c9                   	leave  
  804a90:	c3                   	ret    

0000000000804a91 <set_tss>:

void set_tss(u64 rsp0,u64 rsp1,u64 rsp2,u64 ist0,u64 ist1,u64 ist2,u64 ist3,u64 ist4,u64 ist5,u64 ist6){
  804a91:	f3 0f 1e fa          	endbr64 
  804a95:	55                   	push   rbp
  804a96:	48 89 e5             	mov    rbp,rsp
  804a99:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  804a9d:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  804aa1:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  804aa5:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  804aa9:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
  804aad:	4c 89 4d d0          	mov    QWORD PTR [rbp-0x30],r9
    tss->rsp0=rsp0;
  804ab1:	48 8b 05 08 7a 00 00 	mov    rax,QWORD PTR [rip+0x7a08]        # 80c4c0 <tss>
  804ab8:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804abc:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx
    tss->rsp1=rsp1;
  804ac0:	48 8b 05 f9 79 00 00 	mov    rax,QWORD PTR [rip+0x79f9]        # 80c4c0 <tss>
  804ac7:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  804acb:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    tss->rsp2=rsp2;
  804acf:	48 8b 05 ea 79 00 00 	mov    rax,QWORD PTR [rip+0x79ea]        # 80c4c0 <tss>
  804ad6:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804ada:	48 89 50 14          	mov    QWORD PTR [rax+0x14],rdx
    tss->ists[0]=ist0;
  804ade:	48 8b 05 db 79 00 00 	mov    rax,QWORD PTR [rip+0x79db]        # 80c4c0 <tss>
  804ae5:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  804ae9:	48 89 50 24          	mov    QWORD PTR [rax+0x24],rdx
    tss->ists[1]=ist1;
  804aed:	48 8b 05 cc 79 00 00 	mov    rax,QWORD PTR [rip+0x79cc]        # 80c4c0 <tss>
  804af4:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  804af8:	48 89 50 2c          	mov    QWORD PTR [rax+0x2c],rdx
    tss->ists[2]=ist2;
  804afc:	48 8b 05 bd 79 00 00 	mov    rax,QWORD PTR [rip+0x79bd]        # 80c4c0 <tss>
  804b03:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804b07:	48 89 50 34          	mov    QWORD PTR [rax+0x34],rdx
    tss->ists[3]=ist3;
  804b0b:	48 8b 05 ae 79 00 00 	mov    rax,QWORD PTR [rip+0x79ae]        # 80c4c0 <tss>
  804b12:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  804b16:	48 89 50 3c          	mov    QWORD PTR [rax+0x3c],rdx
    tss->ists[4]=ist4;
  804b1a:	48 8b 05 9f 79 00 00 	mov    rax,QWORD PTR [rip+0x799f]        # 80c4c0 <tss>
  804b21:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  804b25:	48 89 50 44          	mov    QWORD PTR [rax+0x44],rdx
    tss->ists[5]=ist5;
  804b29:	48 8b 05 90 79 00 00 	mov    rax,QWORD PTR [rip+0x7990]        # 80c4c0 <tss>
  804b30:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  804b34:	48 89 50 4c          	mov    QWORD PTR [rax+0x4c],rdx
    tss->ists[6]=ist6;
  804b38:	48 8b 05 81 79 00 00 	mov    rax,QWORD PTR [rip+0x7981]        # 80c4c0 <tss>
  804b3f:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  804b43:	48 89 50 54          	mov    QWORD PTR [rax+0x54],rdx
}
  804b47:	90                   	nop
  804b48:	5d                   	pop    rbp
  804b49:	c3                   	ret    

0000000000804b4a <fork_child_ret>:

int fork_child_ret(){
  804b4a:	f3 0f 1e fa          	endbr64 
  804b4e:	55                   	push   rbp
  804b4f:	48 89 e5             	mov    rbp,rsp
    return 0;
  804b52:	b8 00 00 00 00       	mov    eax,0x0

}
  804b57:	5d                   	pop    rbp
  804b58:	c3                   	ret    

0000000000804b59 <sys_fork>:

int sys_fork(void){
  804b59:	f3 0f 1e fa          	endbr64 
  804b5d:	55                   	push   rbp
  804b5e:	48 89 e5             	mov    rbp,rsp
  804b61:	53                   	push   rbx
  804b62:	48 83 ec 58          	sub    rsp,0x58
    int pid=req_proc();
  804b66:	b8 00 00 00 00       	mov    eax,0x0
  804b6b:	e8 6f ed ff ff       	call   8038df <req_proc>
  804b70:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(pid==-1)return -1;
  804b73:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  804b77:	75 0a                	jne    804b83 <sys_fork+0x2a>
  804b79:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804b7e:	e9 17 08 00 00       	jmp    80539a <sys_fork+0x841>
    task[pid].regs=current->regs;
  804b83:	48 8b 05 16 f9 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f916]        # 4144a0 <current>
  804b8a:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  804b8d:	48 63 ca             	movsxd rcx,edx
  804b90:	48 89 ca             	mov    rdx,rcx
  804b93:	48 01 d2             	add    rdx,rdx
  804b96:	48 01 ca             	add    rdx,rcx
  804b99:	48 c1 e2 08          	shl    rdx,0x8
  804b9d:	48 81 c2 d0 86 40 00 	add    rdx,0x4086d0
  804ba4:	48 8b 88 30 02 00 00 	mov    rcx,QWORD PTR [rax+0x230]
  804bab:	48 8b 98 38 02 00 00 	mov    rbx,QWORD PTR [rax+0x238]
  804bb2:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  804bb5:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  804bb9:	48 8b 88 40 02 00 00 	mov    rcx,QWORD PTR [rax+0x240]
  804bc0:	48 8b 98 48 02 00 00 	mov    rbx,QWORD PTR [rax+0x248]
  804bc7:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  804bcb:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  804bcf:	48 8b 88 50 02 00 00 	mov    rcx,QWORD PTR [rax+0x250]
  804bd6:	48 8b 98 58 02 00 00 	mov    rbx,QWORD PTR [rax+0x258]
  804bdd:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  804be1:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  804be5:	48 8b 88 60 02 00 00 	mov    rcx,QWORD PTR [rax+0x260]
  804bec:	48 8b 98 68 02 00 00 	mov    rbx,QWORD PTR [rax+0x268]
  804bf3:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  804bf7:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  804bfb:	48 8b 88 70 02 00 00 	mov    rcx,QWORD PTR [rax+0x270]
  804c02:	48 8b 98 78 02 00 00 	mov    rbx,QWORD PTR [rax+0x278]
  804c09:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  804c0d:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  804c11:	48 8b 88 80 02 00 00 	mov    rcx,QWORD PTR [rax+0x280]
  804c18:	48 8b 98 88 02 00 00 	mov    rbx,QWORD PTR [rax+0x288]
  804c1f:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  804c23:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  804c27:	48 8b 88 90 02 00 00 	mov    rcx,QWORD PTR [rax+0x290]
  804c2e:	48 8b 98 98 02 00 00 	mov    rbx,QWORD PTR [rax+0x298]
  804c35:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  804c39:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  804c3d:	48 8b 88 a0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2a0]
  804c44:	48 8b 98 a8 02 00 00 	mov    rbx,QWORD PTR [rax+0x2a8]
  804c4b:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  804c4f:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  804c53:	48 8b 88 b0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2b0]
  804c5a:	48 8b 98 b8 02 00 00 	mov    rbx,QWORD PTR [rax+0x2b8]
  804c61:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  804c68:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  804c6f:	48 8b 88 c0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2c0]
  804c76:	48 8b 98 c8 02 00 00 	mov    rbx,QWORD PTR [rax+0x2c8]
  804c7d:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  804c84:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  804c8b:	48 8b 88 d0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2d0]
  804c92:	48 8b 98 d8 02 00 00 	mov    rbx,QWORD PTR [rax+0x2d8]
  804c99:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  804ca0:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  804ca7:	48 8b 88 e0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2e0]
  804cae:	48 8b 98 e8 02 00 00 	mov    rbx,QWORD PTR [rax+0x2e8]
  804cb5:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  804cbc:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
  804cc3:	48 8b 88 f0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2f0]
  804cca:	48 8b 98 f8 02 00 00 	mov    rbx,QWORD PTR [rax+0x2f8]
  804cd1:	48 89 8a c0 00 00 00 	mov    QWORD PTR [rdx+0xc0],rcx
  804cd8:	48 89 9a c8 00 00 00 	mov    QWORD PTR [rdx+0xc8],rbx
    //使得子程序处于刚调用完系统调用的状态
    task[pid].regs.rip=ret_normal_proc;
  804cdf:	b9 41 c4 80 00       	mov    ecx,0x80c441
  804ce4:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804ce7:	48 63 d0             	movsxd rdx,eax
  804cea:	48 89 d0             	mov    rax,rdx
  804ced:	48 01 c0             	add    rax,rax
  804cf0:	48 01 d0             	add    rax,rdx
  804cf3:	48 c1 e0 08          	shl    rax,0x8
  804cf7:	48 05 d8 86 40 00    	add    rax,0x4086d8
  804cfd:	48 89 08             	mov    QWORD PTR [rax],rcx
    task[pid].regs.rsp-=sizeof(stack_store_regs);
  804d00:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804d03:	48 63 d0             	movsxd rdx,eax
  804d06:	48 89 d0             	mov    rax,rdx
  804d09:	48 01 c0             	add    rax,rax
  804d0c:	48 01 d0             	add    rax,rdx
  804d0f:	48 c1 e0 08          	shl    rax,0x8
  804d13:	48 05 08 87 40 00    	add    rax,0x408708
  804d19:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804d1c:	48 2d a8 00 00 00    	sub    rax,0xa8
  804d22:	48 89 c1             	mov    rcx,rax
  804d25:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804d28:	48 63 d0             	movsxd rdx,eax
  804d2b:	48 89 d0             	mov    rax,rdx
  804d2e:	48 01 c0             	add    rax,rax
  804d31:	48 01 d0             	add    rax,rdx
  804d34:	48 c1 e0 08          	shl    rax,0x8
  804d38:	48 05 08 87 40 00    	add    rax,0x408708
  804d3e:	48 89 08             	mov    QWORD PTR [rax],rcx
    stack_store_regs *r=task[pid].regs.rsp;
  804d41:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804d44:	48 63 d0             	movsxd rdx,eax
  804d47:	48 89 d0             	mov    rax,rdx
  804d4a:	48 01 c0             	add    rax,rax
  804d4d:	48 01 d0             	add    rax,rdx
  804d50:	48 c1 e0 08          	shl    rax,0x8
  804d54:	48 05 08 87 40 00    	add    rax,0x408708
  804d5a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804d5d:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    r->rax=0;
  804d61:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d65:	48 c7 40 78 00 00 00 	mov    QWORD PTR [rax+0x78],0x0
  804d6c:	00 
    r->ds=DS_USER;
  804d6d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d71:	48 c7 00 28 00 00 00 	mov    QWORD PTR [rax],0x28
    r->ss=DS_USER;
  804d78:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d7c:	48 c7 80 a0 00 00 00 	mov    QWORD PTR [rax+0xa0],0x28
  804d83:	28 00 00 00 
    r->es=DS_USER;
  804d87:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d8b:	48 c7 40 08 28 00 00 	mov    QWORD PTR [rax+0x8],0x28
  804d92:	00 
    r->rax=task[pid].regs.rax;
  804d93:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804d96:	48 63 d0             	movsxd rdx,eax
  804d99:	48 89 d0             	mov    rax,rdx
  804d9c:	48 01 c0             	add    rax,rax
  804d9f:	48 01 d0             	add    rax,rdx
  804da2:	48 c1 e0 08          	shl    rax,0x8
  804da6:	48 05 e8 86 40 00    	add    rax,0x4086e8
  804dac:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804daf:	48 89 c2             	mov    rdx,rax
  804db2:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804db6:	48 89 50 78          	mov    QWORD PTR [rax+0x78],rdx
    r->rbx=task[pid].regs.rbx;
  804dba:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804dbd:	48 63 d0             	movsxd rdx,eax
  804dc0:	48 89 d0             	mov    rax,rdx
  804dc3:	48 01 c0             	add    rax,rax
  804dc6:	48 01 d0             	add    rax,rdx
  804dc9:	48 c1 e0 08          	shl    rax,0x8
  804dcd:	48 05 00 87 40 00    	add    rax,0x408700
  804dd3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804dd6:	48 89 c2             	mov    rdx,rax
  804dd9:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804ddd:	48 89 50 70          	mov    QWORD PTR [rax+0x70],rdx
    r->rcx=task[pid].regs.rcx;
  804de1:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804de4:	48 63 d0             	movsxd rdx,eax
  804de7:	48 89 d0             	mov    rax,rdx
  804dea:	48 01 c0             	add    rax,rax
  804ded:	48 01 d0             	add    rax,rdx
  804df0:	48 c1 e0 08          	shl    rax,0x8
  804df4:	48 05 f0 86 40 00    	add    rax,0x4086f0
  804dfa:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804dfd:	48 89 c2             	mov    rdx,rax
  804e00:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804e04:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    r->rdx=task[pid].regs.rdx;
  804e08:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804e0b:	48 63 d0             	movsxd rdx,eax
  804e0e:	48 89 d0             	mov    rax,rdx
  804e11:	48 01 c0             	add    rax,rax
  804e14:	48 01 d0             	add    rax,rdx
  804e17:	48 c1 e0 08          	shl    rax,0x8
  804e1b:	48 05 f8 86 40 00    	add    rax,0x4086f8
  804e21:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804e24:	48 89 c2             	mov    rdx,rax
  804e27:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804e2b:	48 89 50 60          	mov    QWORD PTR [rax+0x60],rdx
    r->rsi=task[pid].regs.rsi;
  804e2f:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804e32:	48 63 d0             	movsxd rdx,eax
  804e35:	48 89 d0             	mov    rax,rdx
  804e38:	48 01 c0             	add    rax,rax
  804e3b:	48 01 d0             	add    rax,rdx
  804e3e:	48 c1 e0 08          	shl    rax,0x8
  804e42:	48 05 18 87 40 00    	add    rax,0x408718
  804e48:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804e4b:	48 89 c2             	mov    rdx,rax
  804e4e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804e52:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
    r->rdi=task[pid].regs.rdi;
  804e56:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804e59:	48 63 d0             	movsxd rdx,eax
  804e5c:	48 89 d0             	mov    rax,rdx
  804e5f:	48 01 c0             	add    rax,rax
  804e62:	48 01 d0             	add    rax,rdx
  804e65:	48 c1 e0 08          	shl    rax,0x8
  804e69:	48 05 20 87 40 00    	add    rax,0x408720
  804e6f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804e72:	48 89 c2             	mov    rdx,rax
  804e75:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804e79:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx

    r->r8 =task[pid].regs.r8 ;
  804e7d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804e80:	48 63 d0             	movsxd rdx,eax
  804e83:	48 89 d0             	mov    rax,rdx
  804e86:	48 01 c0             	add    rax,rax
  804e89:	48 01 d0             	add    rax,rdx
  804e8c:	48 c1 e0 08          	shl    rax,0x8
  804e90:	48 05 58 87 40 00    	add    rax,0x408758
  804e96:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804e99:	48 89 c2             	mov    rdx,rax
  804e9c:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804ea0:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    r->r9 =task[pid].regs.r9 ;
  804ea4:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804ea7:	48 63 d0             	movsxd rdx,eax
  804eaa:	48 89 d0             	mov    rax,rdx
  804ead:	48 01 c0             	add    rax,rax
  804eb0:	48 01 d0             	add    rax,rdx
  804eb3:	48 c1 e0 08          	shl    rax,0x8
  804eb7:	48 05 60 87 40 00    	add    rax,0x408760
  804ebd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804ec0:	48 89 c2             	mov    rdx,rax
  804ec3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804ec7:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    r->r10=task[pid].regs.r10;
  804ecb:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804ece:	48 63 d0             	movsxd rdx,eax
  804ed1:	48 89 d0             	mov    rax,rdx
  804ed4:	48 01 c0             	add    rax,rax
  804ed7:	48 01 d0             	add    rax,rdx
  804eda:	48 c1 e0 08          	shl    rax,0x8
  804ede:	48 05 68 87 40 00    	add    rax,0x408768
  804ee4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804ee7:	48 89 c2             	mov    rdx,rax
  804eea:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804eee:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
    r->r11=task[pid].regs.r11;
  804ef2:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804ef5:	48 63 d0             	movsxd rdx,eax
  804ef8:	48 89 d0             	mov    rax,rdx
  804efb:	48 01 c0             	add    rax,rax
  804efe:	48 01 d0             	add    rax,rdx
  804f01:	48 c1 e0 08          	shl    rax,0x8
  804f05:	48 05 70 87 40 00    	add    rax,0x408770
  804f0b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804f0e:	48 89 c2             	mov    rdx,rax
  804f11:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804f15:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
    r->r12=task[pid].regs.r12;
  804f19:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804f1c:	48 63 d0             	movsxd rdx,eax
  804f1f:	48 89 d0             	mov    rax,rdx
  804f22:	48 01 c0             	add    rax,rax
  804f25:	48 01 d0             	add    rax,rdx
  804f28:	48 c1 e0 08          	shl    rax,0x8
  804f2c:	48 05 78 87 40 00    	add    rax,0x408778
  804f32:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804f35:	48 89 c2             	mov    rdx,rax
  804f38:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804f3c:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
    r->r13=task[pid].regs.r13;
  804f40:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804f43:	48 63 d0             	movsxd rdx,eax
  804f46:	48 89 d0             	mov    rax,rdx
  804f49:	48 01 c0             	add    rax,rax
  804f4c:	48 01 d0             	add    rax,rdx
  804f4f:	48 c1 e0 08          	shl    rax,0x8
  804f53:	48 05 80 87 40 00    	add    rax,0x408780
  804f59:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804f5c:	48 89 c2             	mov    rdx,rax
  804f5f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804f63:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
    r->r14=task[pid].regs.r14;
  804f67:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804f6a:	48 63 d0             	movsxd rdx,eax
  804f6d:	48 89 d0             	mov    rax,rdx
  804f70:	48 01 c0             	add    rax,rax
  804f73:	48 01 d0             	add    rax,rdx
  804f76:	48 c1 e0 08          	shl    rax,0x8
  804f7a:	48 05 88 87 40 00    	add    rax,0x408788
  804f80:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804f83:	48 89 c2             	mov    rdx,rax
  804f86:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804f8a:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    r->r15=task[pid].regs.r15;
  804f8e:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804f91:	48 63 d0             	movsxd rdx,eax
  804f94:	48 89 d0             	mov    rax,rdx
  804f97:	48 01 c0             	add    rax,rax
  804f9a:	48 01 d0             	add    rax,rdx
  804f9d:	48 c1 e0 08          	shl    rax,0x8
  804fa1:	48 05 90 87 40 00    	add    rax,0x408790
  804fa7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804faa:	48 89 c2             	mov    rdx,rax
  804fad:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804fb1:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx

    asm volatile("mov %%r10,%0"::"m"(r->rip));
  804fb5:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804fb9:	4c 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],r10

    task[pid].tss=current->tss;
  804fc0:	48 8b 05 d9 f4 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f4d9]        # 4144a0 <current>
  804fc7:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  804fca:	48 63 ca             	movsxd rcx,edx
  804fcd:	48 89 ca             	mov    rdx,rcx
  804fd0:	48 01 d2             	add    rdx,rdx
  804fd3:	48 01 ca             	add    rdx,rcx
  804fd6:	48 c1 e2 08          	shl    rdx,0x8
  804fda:	48 81 c2 60 86 40 00 	add    rdx,0x408660
  804fe1:	48 8b 88 c4 01 00 00 	mov    rcx,QWORD PTR [rax+0x1c4]
  804fe8:	48 8b 98 cc 01 00 00 	mov    rbx,QWORD PTR [rax+0x1cc]
  804fef:	48 89 4a 04          	mov    QWORD PTR [rdx+0x4],rcx
  804ff3:	48 89 5a 0c          	mov    QWORD PTR [rdx+0xc],rbx
  804ff7:	48 8b 88 d4 01 00 00 	mov    rcx,QWORD PTR [rax+0x1d4]
  804ffe:	48 8b 98 dc 01 00 00 	mov    rbx,QWORD PTR [rax+0x1dc]
  805005:	48 89 4a 14          	mov    QWORD PTR [rdx+0x14],rcx
  805009:	48 89 5a 1c          	mov    QWORD PTR [rdx+0x1c],rbx
  80500d:	48 8b 88 e4 01 00 00 	mov    rcx,QWORD PTR [rax+0x1e4]
  805014:	48 8b 98 ec 01 00 00 	mov    rbx,QWORD PTR [rax+0x1ec]
  80501b:	48 89 4a 24          	mov    QWORD PTR [rdx+0x24],rcx
  80501f:	48 89 5a 2c          	mov    QWORD PTR [rdx+0x2c],rbx
  805023:	48 8b 88 f4 01 00 00 	mov    rcx,QWORD PTR [rax+0x1f4]
  80502a:	48 8b 98 fc 01 00 00 	mov    rbx,QWORD PTR [rax+0x1fc]
  805031:	48 89 4a 34          	mov    QWORD PTR [rdx+0x34],rcx
  805035:	48 89 5a 3c          	mov    QWORD PTR [rdx+0x3c],rbx
  805039:	48 8b 88 04 02 00 00 	mov    rcx,QWORD PTR [rax+0x204]
  805040:	48 8b 98 0c 02 00 00 	mov    rbx,QWORD PTR [rax+0x20c]
  805047:	48 89 4a 44          	mov    QWORD PTR [rdx+0x44],rcx
  80504b:	48 89 5a 4c          	mov    QWORD PTR [rdx+0x4c],rbx
  80504f:	48 8b 88 14 02 00 00 	mov    rcx,QWORD PTR [rax+0x214]
  805056:	48 8b 98 1c 02 00 00 	mov    rbx,QWORD PTR [rax+0x21c]
  80505d:	48 89 4a 54          	mov    QWORD PTR [rdx+0x54],rcx
  805061:	48 89 5a 5c          	mov    QWORD PTR [rdx+0x5c],rbx
  805065:	48 8b 88 24 02 00 00 	mov    rcx,QWORD PTR [rax+0x224]
  80506c:	48 89 4a 64          	mov    QWORD PTR [rdx+0x64],rcx
  805070:	8b 80 2c 02 00 00    	mov    eax,DWORD PTR [rax+0x22c]
  805076:	89 42 6c             	mov    DWORD PTR [rdx+0x6c],eax
    task[pid].stat=READY;
  805079:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80507c:	48 63 d0             	movsxd rdx,eax
  80507f:	48 89 d0             	mov    rax,rdx
  805082:	48 01 c0             	add    rax,rax
  805085:	48 01 d0             	add    rax,rdx
  805088:	48 c1 e0 08          	shl    rax,0x8
  80508c:	48 05 a4 84 40 00    	add    rax,0x4084a4
  805092:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[pid].parent_pid=cur_proc;
  805098:	8b 05 8e f4 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f48e]        # 41452c <cur_proc>
  80509e:	89 c1                	mov    ecx,eax
  8050a0:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8050a3:	48 63 d0             	movsxd rdx,eax
  8050a6:	48 89 d0             	mov    rax,rdx
  8050a9:	48 01 c0             	add    rax,rax
  8050ac:	48 01 d0             	add    rax,rdx
  8050af:	48 c1 e0 08          	shl    rax,0x8
  8050b3:	48 05 28 85 40 00    	add    rax,0x408528
  8050b9:	89 08                	mov    DWORD PTR [rax],ecx
    //复制打开文件
    memcpy(task[pid].openf,current->openf,sizeof(struct file*)*MAX_PROC_OPENF);
  8050bb:	48 8b 05 de f3 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f3de]        # 4144a0 <current>
  8050c2:	48 8d 88 c4 00 00 00 	lea    rcx,[rax+0xc4]
  8050c9:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8050cc:	48 63 d0             	movsxd rdx,eax
  8050cf:	48 89 d0             	mov    rax,rdx
  8050d2:	48 01 c0             	add    rax,rax
  8050d5:	48 01 d0             	add    rax,rdx
  8050d8:	48 c1 e0 08          	shl    rax,0x8
  8050dc:	48 05 c0 00 00 00    	add    rax,0xc0
  8050e2:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8050e8:	48 83 c0 04          	add    rax,0x4
  8050ec:	ba 00 01 00 00       	mov    edx,0x100
  8050f1:	48 89 ce             	mov    rsi,rcx
  8050f4:	48 89 c7             	mov    rdi,rax
  8050f7:	e8 a5 69 00 00       	call   80baa1 <memcpy>
    task[pid].utime=0;
  8050fc:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8050ff:	48 63 d0             	movsxd rdx,eax
  805102:	48 89 d0             	mov    rax,rdx
  805105:	48 01 c0             	add    rax,rax
  805108:	48 01 d0             	add    rax,rdx
  80510b:	48 c1 e0 08          	shl    rax,0x8
  80510f:	48 05 a8 84 40 00    	add    rax,0x4084a8
  805115:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[pid].mem_struct=current->mem_struct;
  80511b:	48 8b 0d 7e f3 c0 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc0f37e]        # 4144a0 <current>
  805122:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805125:	48 63 d0             	movsxd rdx,eax
  805128:	48 89 d0             	mov    rax,rdx
  80512b:	48 01 c0             	add    rax,rax
  80512e:	48 01 d0             	add    rax,rdx
  805131:	48 c1 e0 08          	shl    rax,0x8
  805135:	48 8d b0 b0 84 40 00 	lea    rsi,[rax+0x4084b0]
  80513c:	48 8b 41 14          	mov    rax,QWORD PTR [rcx+0x14]
  805140:	48 8b 51 1c          	mov    rdx,QWORD PTR [rcx+0x1c]
  805144:	48 89 46 04          	mov    QWORD PTR [rsi+0x4],rax
  805148:	48 89 56 0c          	mov    QWORD PTR [rsi+0xc],rdx
  80514c:	48 8b 41 24          	mov    rax,QWORD PTR [rcx+0x24]
  805150:	48 8b 51 2c          	mov    rdx,QWORD PTR [rcx+0x2c]
  805154:	48 89 46 14          	mov    QWORD PTR [rsi+0x14],rax
  805158:	48 89 56 1c          	mov    QWORD PTR [rsi+0x1c],rdx
    //TODO:根据是子进程还是父进程设置返回值的不同

    //TODO:设置新堆栈
    //复制父进程的内存映射到子进程，然后重新映射并复制子进程的堆栈和数据段
    copy_mmap(current,&task[pid]);
  80515c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80515f:	48 63 d0             	movsxd rdx,eax
  805162:	48 89 d0             	mov    rax,rdx
  805165:	48 01 c0             	add    rax,rax
  805168:	48 01 d0             	add    rax,rdx
  80516b:	48 c1 e0 08          	shl    rax,0x8
  80516f:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  805176:	48 8b 05 23 f3 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f323]        # 4144a0 <current>
  80517d:	48 89 d6             	mov    rsi,rdx
  805180:	48 89 c7             	mov    rdi,rax
  805183:	e8 1a 05 00 00       	call   8056a2 <copy_mmap>
    /*
     * 这里使用vmalloc是一个权宜之策。
     * 本来是分配用户空间内存的，但是这样的话当前进程内存空间下就访问不到这个新申请的内存了（除非mmap一下），
     * 方便以前先用vmalloc。
     * */
    addr_t stk=task[pid].mem_struct.stack_top-PAGE_4K_SIZE;
  805188:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80518b:	48 63 d0             	movsxd rdx,eax
  80518e:	48 89 d0             	mov    rax,rdx
  805191:	48 01 c0             	add    rax,rax
  805194:	48 01 d0             	add    rax,rdx
  805197:	48 c1 e0 08          	shl    rax,0x8
  80519b:	48 05 c0 84 40 00    	add    rax,0x4084c0
  8051a1:	8b 00                	mov    eax,DWORD PTR [rax]
  8051a3:	2d 00 10 00 00       	sub    eax,0x1000
  8051a8:	48 98                	cdqe   
  8051aa:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    for(;stk>=task[pid].mem_struct.stack_bottom;stk-=PAGE_4K_SIZE){
  8051ae:	eb 63                	jmp    805213 <sys_fork+0x6ba>
        addr_t new_stkpg=vmalloc();
  8051b0:	b8 00 00 00 00       	mov    eax,0x0
  8051b5:	e8 10 c1 ff ff       	call   8012ca <vmalloc>
  8051ba:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
        memcpy(new_stkpg,stk,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  8051be:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  8051c2:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8051c6:	ba 00 10 00 00       	mov    edx,0x1000
  8051cb:	48 89 ce             	mov    rsi,rcx
  8051ce:	48 89 c7             	mov    rdi,rax
  8051d1:	e8 cb 68 00 00       	call   80baa1 <memcpy>
        //把新的页面映射到进程页表里
        smmap(new_stkpg,stk,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  8051d6:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8051d9:	48 63 d0             	movsxd rdx,eax
  8051dc:	48 89 d0             	mov    rax,rdx
  8051df:	48 01 c0             	add    rax,rax
  8051e2:	48 01 d0             	add    rax,rdx
  8051e5:	48 c1 e0 08          	shl    rax,0x8
  8051e9:	48 05 40 85 40 00    	add    rax,0x408540
  8051ef:	48 8b 50 0c          	mov    rdx,QWORD PTR [rax+0xc]
  8051f3:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  8051f7:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8051fb:	48 89 d1             	mov    rcx,rdx
  8051fe:	ba 07 00 00 00       	mov    edx,0x7
  805203:	48 89 c7             	mov    rdi,rax
  805206:	e8 6f be ff ff       	call   80107a <smmap>
    for(;stk>=task[pid].mem_struct.stack_bottom;stk-=PAGE_4K_SIZE){
  80520b:	48 81 6d e8 00 10 00 	sub    QWORD PTR [rbp-0x18],0x1000
  805212:	00 
  805213:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805216:	48 63 d0             	movsxd rdx,eax
  805219:	48 89 d0             	mov    rax,rdx
  80521c:	48 01 c0             	add    rax,rax
  80521f:	48 01 d0             	add    rax,rdx
  805222:	48 c1 e0 08          	shl    rax,0x8
  805226:	48 05 bc 84 40 00    	add    rax,0x4084bc
  80522c:	8b 00                	mov    eax,DWORD PTR [rax]
  80522e:	48 98                	cdqe   
  805230:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  805234:	0f 83 76 ff ff ff    	jae    8051b0 <sys_fork+0x657>
    }
    //中断使用的栈空间
    addr_t intstk=INT_STACK_TOP-PAGE_4K_SIZE;
  80523a:	48 c7 45 e0 00 f0 7f 	mov    QWORD PTR [rbp-0x20],0x7ff000
  805241:	00 
    int f=1;
  805242:	c7 45 dc 01 00 00 00 	mov    DWORD PTR [rbp-0x24],0x1
    for(;intstk>=INT_STACK_BASE;intstk-=PAGE_4K_SIZE){
  805249:	e9 89 00 00 00       	jmp    8052d7 <sys_fork+0x77e>
        addr_t new_stkpg=vmalloc();
  80524e:	b8 00 00 00 00       	mov    eax,0x0
  805253:	e8 72 c0 ff ff       	call   8012ca <vmalloc>
  805258:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        memcpy(new_stkpg,intstk,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  80525c:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  805260:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805264:	ba 00 10 00 00       	mov    edx,0x1000
  805269:	48 89 ce             	mov    rsi,rcx
  80526c:	48 89 c7             	mov    rdi,rax
  80526f:	e8 2d 68 00 00       	call   80baa1 <memcpy>
        if(f){
  805274:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  805278:	74 20                	je     80529a <sys_fork+0x741>
            f=0;
  80527a:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
            addr_t *raxp=new_stkpg+PAGE_4K_SIZE-56;//指向中断堆栈，里面存着rax的值
  805281:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805285:	48 05 c8 0f 00 00    	add    rax,0xfc8
  80528b:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
            *raxp=0;//这样进程切换到子进程的done标签，从时钟中断返回弹出堆栈的时候rax弹出来的就是0，成为返回值。
  80528f:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  805293:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
        }
        //把新的页面映射到进程页表里
        smmap(new_stkpg,intstk,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  80529a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80529d:	48 63 d0             	movsxd rdx,eax
  8052a0:	48 89 d0             	mov    rax,rdx
  8052a3:	48 01 c0             	add    rax,rax
  8052a6:	48 01 d0             	add    rax,rdx
  8052a9:	48 c1 e0 08          	shl    rax,0x8
  8052ad:	48 05 40 85 40 00    	add    rax,0x408540
  8052b3:	48 8b 50 0c          	mov    rdx,QWORD PTR [rax+0xc]
  8052b7:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  8052bb:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8052bf:	48 89 d1             	mov    rcx,rdx
  8052c2:	ba 07 00 00 00       	mov    edx,0x7
  8052c7:	48 89 c7             	mov    rdi,rax
  8052ca:	e8 ab bd ff ff       	call   80107a <smmap>
    for(;intstk>=INT_STACK_BASE;intstk-=PAGE_4K_SIZE){
  8052cf:	48 81 6d e0 00 10 00 	sub    QWORD PTR [rbp-0x20],0x1000
  8052d6:	00 
  8052d7:	48 81 7d e0 ff ef 7f 	cmp    QWORD PTR [rbp-0x20],0x7fefff
  8052de:	00 
  8052df:	0f 87 69 ff ff ff    	ja     80524e <sys_fork+0x6f5>
    }
    //堆
    addr_t hp=task[pid].mem_struct.heap_top-PAGE_4K_SIZE;
  8052e5:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8052e8:	48 63 d0             	movsxd rdx,eax
  8052eb:	48 89 d0             	mov    rax,rdx
  8052ee:	48 01 c0             	add    rax,rax
  8052f1:	48 01 d0             	add    rax,rdx
  8052f4:	48 c1 e0 08          	shl    rax,0x8
  8052f8:	48 05 b8 84 40 00    	add    rax,0x4084b8
  8052fe:	8b 00                	mov    eax,DWORD PTR [rax]
  805300:	2d 00 10 00 00       	sub    eax,0x1000
  805305:	48 98                	cdqe   
  805307:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    for(;hp>=task[pid].mem_struct.heap_base;hp-=PAGE_4K_SIZE){
  80530b:	eb 63                	jmp    805370 <sys_fork+0x817>
        addr_t new_hppg=vmalloc();
  80530d:	b8 00 00 00 00       	mov    eax,0x0
  805312:	e8 b3 bf ff ff       	call   8012ca <vmalloc>
  805317:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        memcpy(new_hppg,hp,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  80531b:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  80531f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805323:	ba 00 10 00 00       	mov    edx,0x1000
  805328:	48 89 ce             	mov    rsi,rcx
  80532b:	48 89 c7             	mov    rdi,rax
  80532e:	e8 6e 67 00 00       	call   80baa1 <memcpy>
        //把新的页面映射到进程页表里
        smmap(new_hppg,hp,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  805333:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805336:	48 63 d0             	movsxd rdx,eax
  805339:	48 89 d0             	mov    rax,rdx
  80533c:	48 01 c0             	add    rax,rax
  80533f:	48 01 d0             	add    rax,rdx
  805342:	48 c1 e0 08          	shl    rax,0x8
  805346:	48 05 40 85 40 00    	add    rax,0x408540
  80534c:	48 8b 50 0c          	mov    rdx,QWORD PTR [rax+0xc]
  805350:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  805354:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805358:	48 89 d1             	mov    rcx,rdx
  80535b:	ba 07 00 00 00       	mov    edx,0x7
  805360:	48 89 c7             	mov    rdi,rax
  805363:	e8 12 bd ff ff       	call   80107a <smmap>
    for(;hp>=task[pid].mem_struct.heap_base;hp-=PAGE_4K_SIZE){
  805368:	48 81 6d d0 00 10 00 	sub    QWORD PTR [rbp-0x30],0x1000
  80536f:	00 
  805370:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805373:	48 63 d0             	movsxd rdx,eax
  805376:	48 89 d0             	mov    rax,rdx
  805379:	48 01 c0             	add    rax,rax
  80537c:	48 01 d0             	add    rax,rdx
  80537f:	48 c1 e0 08          	shl    rax,0x8
  805383:	48 05 b4 84 40 00    	add    rax,0x4084b4
  805389:	8b 00                	mov    eax,DWORD PTR [rax]
  80538b:	48 98                	cdqe   
  80538d:	48 39 45 d0          	cmp    QWORD PTR [rbp-0x30],rax
  805391:	0f 83 76 ff ff ff    	jae    80530d <sys_fork+0x7b4>
    }
    //父进程运行到这里
    return pid;
  805397:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
}
  80539a:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80539e:	c9                   	leave  
  80539f:	c3                   	ret    

00000000008053a0 <release_mmap>:
//释放进程页表映射的内存，内核空间除外。
void release_mmap(struct process* p){
  8053a0:	f3 0f 1e fa          	endbr64 
  8053a4:	55                   	push   rbp
  8053a5:	48 89 e5             	mov    rbp,rsp
  8053a8:	48 83 ec 50          	sub    rsp,0x50
  8053ac:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    page_item * pml4p=p->pml4;
  8053b0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8053b4:	48 8b 80 ac 00 00 00 	mov    rax,QWORD PTR [rax+0xac]
  8053bb:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //复制pdpt
    page_item *pml4e= pml4p;
  8053bf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8053c3:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    for(int i=0;i<512;i++)
  8053c7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8053ce:	e9 be 02 00 00       	jmp    805691 <release_mmap+0x2f1>
    {
        if(pml4e[i]&PAGE_PRESENT){
  8053d3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8053d6:	48 98                	cdqe   
  8053d8:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8053df:	00 
  8053e0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8053e4:	48 01 d0             	add    rax,rdx
  8053e7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8053ea:	83 e0 01             	and    eax,0x1
  8053ed:	48 85 c0             	test   rax,rax
  8053f0:	0f 84 97 02 00 00    	je     80568d <release_mmap+0x2ed>
            page_item *pdpte=pml4e[i]&PAGE_4K_MASK;
  8053f6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8053f9:	48 98                	cdqe   
  8053fb:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805402:	00 
  805403:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805407:	48 01 d0             	add    rax,rdx
  80540a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80540d:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805414:	ff 00 00 
  805417:	48 21 d0             	and    rax,rdx
  80541a:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            int j=i==0?1:0;//低1GB的空间不释放（内核空间）
  80541e:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  805422:	0f 94 c0             	sete   al
  805425:	0f b6 c0             	movzx  eax,al
  805428:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
            for(;j<512;j++)
  80542b:	e9 24 02 00 00       	jmp    805654 <release_mmap+0x2b4>
            {
                if(pdpte[j]&PAGE_PRESENT&&!(pdpte[j]&PDPTE_1GB)){
  805430:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805433:	48 98                	cdqe   
  805435:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80543c:	00 
  80543d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805441:	48 01 d0             	add    rax,rdx
  805444:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805447:	83 e0 01             	and    eax,0x1
  80544a:	48 85 c0             	test   rax,rax
  80544d:	0f 84 fd 01 00 00    	je     805650 <release_mmap+0x2b0>
  805453:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805456:	48 98                	cdqe   
  805458:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80545f:	00 
  805460:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805464:	48 01 d0             	add    rax,rdx
  805467:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80546a:	25 80 00 00 00       	and    eax,0x80
  80546f:	48 85 c0             	test   rax,rax
  805472:	0f 85 d8 01 00 00    	jne    805650 <release_mmap+0x2b0>
                    page_item *pde=pdpte[j]&PAGE_4K_MASK;
  805478:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80547b:	48 98                	cdqe   
  80547d:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805484:	00 
  805485:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805489:	48 01 d0             	add    rax,rdx
  80548c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80548f:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805496:	ff 00 00 
  805499:	48 21 d0             	and    rax,rdx
  80549c:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
                    for(int k=0;k<512;k++)
  8054a0:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8054a7:	e9 6b 01 00 00       	jmp    805617 <release_mmap+0x277>
                    {
                        if(pde[k]&PAGE_PRESENT&&!(pde[k]&PDE_4MB)){
  8054ac:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8054af:	48 98                	cdqe   
  8054b1:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8054b8:	00 
  8054b9:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8054bd:	48 01 d0             	add    rax,rdx
  8054c0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8054c3:	83 e0 01             	and    eax,0x1
  8054c6:	48 85 c0             	test   rax,rax
  8054c9:	0f 84 dc 00 00 00    	je     8055ab <release_mmap+0x20b>
  8054cf:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8054d2:	48 98                	cdqe   
  8054d4:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8054db:	00 
  8054dc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8054e0:	48 01 d0             	add    rax,rdx
  8054e3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8054e6:	25 80 00 00 00       	and    eax,0x80
  8054eb:	48 85 c0             	test   rax,rax
  8054ee:	0f 85 b7 00 00 00    	jne    8055ab <release_mmap+0x20b>
                            page_item *pte=pde[k]&PAGE_4K_MASK;
  8054f4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8054f7:	48 98                	cdqe   
  8054f9:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805500:	00 
  805501:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805505:	48 01 d0             	add    rax,rdx
  805508:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80550b:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805512:	ff 00 00 
  805515:	48 21 d0             	and    rax,rdx
  805518:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
                            for(int l=0;l<512;l++){
  80551c:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  805523:	eb 4f                	jmp    805574 <release_mmap+0x1d4>
                                if(pte[l]&PAGE_PRESENT){
  805525:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  805528:	48 98                	cdqe   
  80552a:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805531:	00 
  805532:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  805536:	48 01 d0             	add    rax,rdx
  805539:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80553c:	83 e0 01             	and    eax,0x1
  80553f:	48 85 c0             	test   rax,rax
  805542:	74 2c                	je     805570 <release_mmap+0x1d0>
                                    //释放申请的物理内存
                                    free_page(pte[l]&PAGE_4K_MASK);
  805544:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  805547:	48 98                	cdqe   
  805549:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805550:	00 
  805551:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  805555:	48 01 d0             	add    rax,rdx
  805558:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80555b:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805562:	ff 00 00 
  805565:	48 21 d0             	and    rax,rdx
  805568:	48 89 c7             	mov    rdi,rax
  80556b:	e8 dd c1 ff ff       	call   80174d <free_page>
                            for(int l=0;l<512;l++){
  805570:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  805574:	81 7d f0 ff 01 00 00 	cmp    DWORD PTR [rbp-0x10],0x1ff
  80557b:	7e a8                	jle    805525 <release_mmap+0x185>
                                }
                            }
                            //里面的项释放完了，这一项指向的vmalloc内存可以释放了
                            vmfree(pde[k]&PAGE_4K_MASK);
  80557d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805580:	48 98                	cdqe   
  805582:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805589:	00 
  80558a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80558e:	48 01 d0             	add    rax,rdx
  805591:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805594:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  80559b:	ff 00 00 
  80559e:	48 21 d0             	and    rax,rdx
  8055a1:	48 89 c7             	mov    rdi,rax
  8055a4:	e8 b0 bd ff ff       	call   801359 <vmfree>
                        if(pde[k]&PAGE_PRESENT&&!(pde[k]&PDE_4MB)){
  8055a9:	eb 68                	jmp    805613 <release_mmap+0x273>
                        }else if((pde[k]&PAGE_PRESENT)&&(pde[k]&PDE_4MB)){
  8055ab:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8055ae:	48 98                	cdqe   
  8055b0:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8055b7:	00 
  8055b8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8055bc:	48 01 d0             	add    rax,rdx
  8055bf:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8055c2:	83 e0 01             	and    eax,0x1
  8055c5:	48 85 c0             	test   rax,rax
  8055c8:	74 49                	je     805613 <release_mmap+0x273>
  8055ca:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8055cd:	48 98                	cdqe   
  8055cf:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8055d6:	00 
  8055d7:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8055db:	48 01 d0             	add    rax,rdx
  8055de:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8055e1:	25 80 00 00 00       	and    eax,0x80
  8055e6:	48 85 c0             	test   rax,rax
  8055e9:	74 28                	je     805613 <release_mmap+0x273>
                            //释放2MB页
                            free_pages_at(pde[k]&PAGE_4K_MASK,512);
  8055eb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8055ee:	48 98                	cdqe   
  8055f0:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8055f7:	00 
  8055f8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8055fc:	48 01 d0             	add    rax,rdx
  8055ff:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805602:	25 00 f0 ff ff       	and    eax,0xfffff000
  805607:	be 00 02 00 00       	mov    esi,0x200
  80560c:	89 c7                	mov    edi,eax
  80560e:	e8 be c1 ff ff       	call   8017d1 <free_pages_at>
                    for(int k=0;k<512;k++)
  805613:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  805617:	81 7d f4 ff 01 00 00 	cmp    DWORD PTR [rbp-0xc],0x1ff
  80561e:	0f 8e 88 fe ff ff    	jle    8054ac <release_mmap+0x10c>
                        }
                    }
                    //这一页pde的内容释放完了，这一项指向的vmalloc可以释放了
                    vmfree(pdpte[j]&PAGE_4K_MASK);
  805624:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805627:	48 98                	cdqe   
  805629:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805630:	00 
  805631:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805635:	48 01 d0             	add    rax,rdx
  805638:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80563b:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805642:	ff 00 00 
  805645:	48 21 d0             	and    rax,rdx
  805648:	48 89 c7             	mov    rdi,rax
  80564b:	e8 09 bd ff ff       	call   801359 <vmfree>
            for(;j<512;j++)
  805650:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805654:	81 7d f8 ff 01 00 00 	cmp    DWORD PTR [rbp-0x8],0x1ff
  80565b:	0f 8e cf fd ff ff    	jle    805430 <release_mmap+0x90>
                }//1GB先不写，目前还没有初始化之后动态申请1GB页的

            }
            //这一页pdpte的内容释放完了，这一项指向的vmalloc可以释放了
            vmfree(pml4e[i]&PAGE_4K_MASK);
  805661:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805664:	48 98                	cdqe   
  805666:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80566d:	00 
  80566e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805672:	48 01 d0             	add    rax,rdx
  805675:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805678:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  80567f:	ff 00 00 
  805682:	48 21 d0             	and    rax,rdx
  805685:	48 89 c7             	mov    rdi,rax
  805688:	e8 cc bc ff ff       	call   801359 <vmfree>
    for(int i=0;i<512;i++)
  80568d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805691:	81 7d fc ff 01 00 00 	cmp    DWORD PTR [rbp-0x4],0x1ff
  805698:	0f 8e 35 fd ff ff    	jle    8053d3 <release_mmap+0x33>
        }
    }
}
  80569e:	90                   	nop
  80569f:	90                   	nop
  8056a0:	c9                   	leave  
  8056a1:	c3                   	ret    

00000000008056a2 <copy_mmap>:
void copy_mmap(struct process* from, struct process *to){
  8056a2:	f3 0f 1e fa          	endbr64 
  8056a6:	55                   	push   rbp
  8056a7:	48 89 e5             	mov    rbp,rsp
  8056aa:	48 83 ec 60          	sub    rsp,0x60
  8056ae:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  8056b2:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
    page_item * pml4p=vmalloc();
  8056b6:	b8 00 00 00 00       	mov    eax,0x0
  8056bb:	e8 0a bc ff ff       	call   8012ca <vmalloc>
  8056c0:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    memcpy(pml4p,from->regs.cr3,PAGE_4K_SIZE);//复制pml4
  8056c4:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8056c8:	48 8b 80 30 02 00 00 	mov    rax,QWORD PTR [rax+0x230]
  8056cf:	48 89 c1             	mov    rcx,rax
  8056d2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8056d6:	ba 00 10 00 00       	mov    edx,0x1000
  8056db:	48 89 ce             	mov    rsi,rcx
  8056de:	48 89 c7             	mov    rdi,rax
  8056e1:	e8 bb 63 00 00       	call   80baa1 <memcpy>
    to->regs.cr3=pml4p;
  8056e6:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8056ea:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8056ee:	48 89 90 30 02 00 00 	mov    QWORD PTR [rax+0x230],rdx
    to->pml4=pml4p;
  8056f5:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8056f9:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8056fd:	48 89 90 ac 00 00 00 	mov    QWORD PTR [rax+0xac],rdx
    //复制pdpt

    page_item *pml4e= pml4p;
  805704:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805708:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    for(int i=0;i<512;i++)
  80570c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805713:	e9 09 03 00 00       	jmp    805a21 <copy_mmap+0x37f>
    {
        if(pml4e[i]&PAGE_PRESENT){
  805718:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80571b:	48 98                	cdqe   
  80571d:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805724:	00 
  805725:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805729:	48 01 d0             	add    rax,rdx
  80572c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80572f:	83 e0 01             	and    eax,0x1
  805732:	48 85 c0             	test   rax,rax
  805735:	0f 84 e2 02 00 00    	je     805a1d <copy_mmap+0x37b>
            addr_t old_data=pml4e[i];//旧的数据，里面保存了属性和要拷贝的数据的地址
  80573b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80573e:	48 98                	cdqe   
  805740:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805747:	00 
  805748:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80574c:	48 01 d0             	add    rax,rdx
  80574f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805752:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            pml4e[i]=vmalloc()|(old_data&~PAGE_4K_MASK);
  805756:	b8 00 00 00 00       	mov    eax,0x0
  80575b:	e8 6a bb ff ff       	call   8012ca <vmalloc>
  805760:	48 89 c2             	mov    rdx,rax
  805763:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  80576a:	00 ff ff 
  80576d:	48 23 45 d8          	and    rax,QWORD PTR [rbp-0x28]
  805771:	48 89 c1             	mov    rcx,rax
  805774:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805777:	48 98                	cdqe   
  805779:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  805780:	00 
  805781:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805785:	48 01 f0             	add    rax,rsi
  805788:	48 09 ca             	or     rdx,rcx
  80578b:	48 89 10             	mov    QWORD PTR [rax],rdx
            memcpy(pml4e[i]&PAGE_4K_MASK,old_data&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  80578e:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  805795:	ff 00 00 
  805798:	48 23 45 d8          	and    rax,QWORD PTR [rbp-0x28]
  80579c:	48 89 c1             	mov    rcx,rax
  80579f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8057a2:	48 98                	cdqe   
  8057a4:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8057ab:	00 
  8057ac:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8057b0:	48 01 d0             	add    rax,rdx
  8057b3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8057b6:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  8057bd:	ff 00 00 
  8057c0:	48 21 d0             	and    rax,rdx
  8057c3:	ba 00 10 00 00       	mov    edx,0x1000
  8057c8:	48 89 ce             	mov    rsi,rcx
  8057cb:	48 89 c7             	mov    rdi,rax
  8057ce:	e8 ce 62 00 00       	call   80baa1 <memcpy>
            page_item *pdpte=pml4e[i]&PAGE_4K_MASK;
  8057d3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8057d6:	48 98                	cdqe   
  8057d8:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8057df:	00 
  8057e0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8057e4:	48 01 d0             	add    rax,rdx
  8057e7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8057ea:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  8057f1:	ff 00 00 
  8057f4:	48 21 d0             	and    rax,rdx
  8057f7:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            for(int j=0;j<512;j++)
  8057fb:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805802:	e9 09 02 00 00       	jmp    805a10 <copy_mmap+0x36e>
            {
                if(pdpte[j]&PAGE_PRESENT&&!(pdpte[j]&PDPTE_1GB)){
  805807:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80580a:	48 98                	cdqe   
  80580c:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805813:	00 
  805814:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805818:	48 01 d0             	add    rax,rdx
  80581b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80581e:	83 e0 01             	and    eax,0x1
  805821:	48 85 c0             	test   rax,rax
  805824:	0f 84 e2 01 00 00    	je     805a0c <copy_mmap+0x36a>
  80582a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80582d:	48 98                	cdqe   
  80582f:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805836:	00 
  805837:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80583b:	48 01 d0             	add    rax,rdx
  80583e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805841:	25 80 00 00 00       	and    eax,0x80
  805846:	48 85 c0             	test   rax,rax
  805849:	0f 85 bd 01 00 00    	jne    805a0c <copy_mmap+0x36a>
                    addr_t old_data2=pdpte[j];//旧的数据，里面保存了属性和要拷贝的数据的地址
  80584f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805852:	48 98                	cdqe   
  805854:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80585b:	00 
  80585c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805860:	48 01 d0             	add    rax,rdx
  805863:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805866:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
                    pdpte[j]=vmalloc()|(old_data2&~PAGE_4K_MASK);
  80586a:	b8 00 00 00 00       	mov    eax,0x0
  80586f:	e8 56 ba ff ff       	call   8012ca <vmalloc>
  805874:	48 89 c2             	mov    rdx,rax
  805877:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  80587e:	00 ff ff 
  805881:	48 23 45 c8          	and    rax,QWORD PTR [rbp-0x38]
  805885:	48 89 c1             	mov    rcx,rax
  805888:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80588b:	48 98                	cdqe   
  80588d:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  805894:	00 
  805895:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805899:	48 01 f0             	add    rax,rsi
  80589c:	48 09 ca             	or     rdx,rcx
  80589f:	48 89 10             	mov    QWORD PTR [rax],rdx
                    memcpy(pdpte[j]&PAGE_4K_MASK,old_data2&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  8058a2:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  8058a9:	ff 00 00 
  8058ac:	48 23 45 c8          	and    rax,QWORD PTR [rbp-0x38]
  8058b0:	48 89 c1             	mov    rcx,rax
  8058b3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8058b6:	48 98                	cdqe   
  8058b8:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8058bf:	00 
  8058c0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8058c4:	48 01 d0             	add    rax,rdx
  8058c7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8058ca:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  8058d1:	ff 00 00 
  8058d4:	48 21 d0             	and    rax,rdx
  8058d7:	ba 00 10 00 00       	mov    edx,0x1000
  8058dc:	48 89 ce             	mov    rsi,rcx
  8058df:	48 89 c7             	mov    rdi,rax
  8058e2:	e8 ba 61 00 00       	call   80baa1 <memcpy>
                    page_item *pde=pdpte[j]&PAGE_4K_MASK;
  8058e7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8058ea:	48 98                	cdqe   
  8058ec:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8058f3:	00 
  8058f4:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8058f8:	48 01 d0             	add    rax,rdx
  8058fb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8058fe:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805905:	ff 00 00 
  805908:	48 21 d0             	and    rax,rdx
  80590b:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
                    for(int k=0;k<512;k++)
  80590f:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  805916:	e9 e4 00 00 00       	jmp    8059ff <copy_mmap+0x35d>
                    {
                        if(pde[k]&PAGE_PRESENT&&!(pde[k]&PDE_4MB)){
  80591b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80591e:	48 98                	cdqe   
  805920:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805927:	00 
  805928:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80592c:	48 01 d0             	add    rax,rdx
  80592f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805932:	83 e0 01             	and    eax,0x1
  805935:	48 85 c0             	test   rax,rax
  805938:	0f 84 bd 00 00 00    	je     8059fb <copy_mmap+0x359>
  80593e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805941:	48 98                	cdqe   
  805943:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80594a:	00 
  80594b:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80594f:	48 01 d0             	add    rax,rdx
  805952:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805955:	25 80 00 00 00       	and    eax,0x80
  80595a:	48 85 c0             	test   rax,rax
  80595d:	0f 85 98 00 00 00    	jne    8059fb <copy_mmap+0x359>
                            addr_t old_data3=pde[k];//旧的数据，里面保存了属性和要拷贝的数据的地址
  805963:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805966:	48 98                	cdqe   
  805968:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80596f:	00 
  805970:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805974:	48 01 d0             	add    rax,rdx
  805977:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80597a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
                            pde[k]=vmalloc()|(old_data3&~PAGE_4K_MASK);
  80597e:	b8 00 00 00 00       	mov    eax,0x0
  805983:	e8 42 b9 ff ff       	call   8012ca <vmalloc>
  805988:	48 89 c2             	mov    rdx,rax
  80598b:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  805992:	00 ff ff 
  805995:	48 23 45 b8          	and    rax,QWORD PTR [rbp-0x48]
  805999:	48 89 c1             	mov    rcx,rax
  80599c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80599f:	48 98                	cdqe   
  8059a1:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  8059a8:	00 
  8059a9:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8059ad:	48 01 f0             	add    rax,rsi
  8059b0:	48 09 ca             	or     rdx,rcx
  8059b3:	48 89 10             	mov    QWORD PTR [rax],rdx
                            memcpy(pde[k]&PAGE_4K_MASK,old_data3&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  8059b6:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  8059bd:	ff 00 00 
  8059c0:	48 23 45 b8          	and    rax,QWORD PTR [rbp-0x48]
  8059c4:	48 89 c1             	mov    rcx,rax
  8059c7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8059ca:	48 98                	cdqe   
  8059cc:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8059d3:	00 
  8059d4:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8059d8:	48 01 d0             	add    rax,rdx
  8059db:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8059de:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  8059e5:	ff 00 00 
  8059e8:	48 21 d0             	and    rax,rdx
  8059eb:	ba 00 10 00 00       	mov    edx,0x1000
  8059f0:	48 89 ce             	mov    rsi,rcx
  8059f3:	48 89 c7             	mov    rdi,rax
  8059f6:	e8 a6 60 00 00       	call   80baa1 <memcpy>
                    for(int k=0;k<512;k++)
  8059fb:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8059ff:	81 7d f4 ff 01 00 00 	cmp    DWORD PTR [rbp-0xc],0x1ff
  805a06:	0f 8e 0f ff ff ff    	jle    80591b <copy_mmap+0x279>
            for(int j=0;j<512;j++)
  805a0c:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805a10:	81 7d f8 ff 01 00 00 	cmp    DWORD PTR [rbp-0x8],0x1ff
  805a17:	0f 8e ea fd ff ff    	jle    805807 <copy_mmap+0x165>
    for(int i=0;i<512;i++)
  805a1d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805a21:	81 7d fc ff 01 00 00 	cmp    DWORD PTR [rbp-0x4],0x1ff
  805a28:	0f 8e ea fc ff ff    	jle    805718 <copy_mmap+0x76>
                    }
                }
            }
        }
    }
  805a2e:	90                   	nop
  805a2f:	90                   	nop
  805a30:	c9                   	leave  
  805a31:	c3                   	ret    
  805a32:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  805a39:	00 00 00 
  805a3c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000805a40 <outb>:
  805a40:	66 89 fa             	mov    dx,di
  805a43:	66 89 f0             	mov    ax,si
  805a46:	ee                   	out    dx,al
  805a47:	e8 29 00 00 00       	call   805a75 <io_delay>
  805a4c:	c3                   	ret    

0000000000805a4d <outw>:
  805a4d:	66 89 fa             	mov    dx,di
  805a50:	66 89 f0             	mov    ax,si
  805a53:	66 ef                	out    dx,ax
  805a55:	90                   	nop
  805a56:	90                   	nop
  805a57:	90                   	nop
  805a58:	c3                   	ret    

0000000000805a59 <inb>:
  805a59:	31 c0                	xor    eax,eax
  805a5b:	66 89 fa             	mov    dx,di
  805a5e:	ec                   	in     al,dx
  805a5f:	90                   	nop
  805a60:	90                   	nop
  805a61:	90                   	nop
  805a62:	c3                   	ret    

0000000000805a63 <inw>:
  805a63:	31 c0                	xor    eax,eax
  805a65:	66 89 fa             	mov    dx,di
  805a68:	66 ed                	in     ax,dx
  805a6a:	90                   	nop
  805a6b:	90                   	nop
  805a6c:	90                   	nop
  805a6d:	c3                   	ret    

0000000000805a6e <eoi>:
  805a6e:	b0 20                	mov    al,0x20
  805a70:	e6 a0                	out    0xa0,al
  805a72:	e6 20                	out    0x20,al
  805a74:	c3                   	ret    

0000000000805a75 <io_delay>:
  805a75:	90                   	nop
  805a76:	90                   	nop
  805a77:	90                   	nop
  805a78:	90                   	nop
  805a79:	c3                   	ret    

0000000000805a7a <turn_on_int>:
  805a7a:	b0 f8                	mov    al,0xf8
  805a7c:	e6 21                	out    0x21,al
  805a7e:	e8 f2 ff ff ff       	call   805a75 <io_delay>
  805a83:	b0 af                	mov    al,0xaf
  805a85:	e6 a1                	out    0xa1,al
  805a87:	e8 e9 ff ff ff       	call   805a75 <io_delay>
  805a8c:	b8 00 70 10 00       	mov    eax,0x107000
  805a91:	0f 01 18             	lidt   [rax]
  805a94:	90                   	nop
  805a95:	90                   	nop
  805a96:	90                   	nop
  805a97:	90                   	nop
  805a98:	c3                   	ret    

0000000000805a99 <report_back_trace_of_err>:
  805a99:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  805a9e:	50                   	push   rax
  805a9f:	68 a8 5a 80 00       	push   0x805aa8
  805aa4:	83 c4 08             	add    esp,0x8
  805aa7:	c3                   	ret    

0000000000805aa8 <bt_msg>:
  805aa8:	65 72 72             	gs jb  805b1d <fill_desc+0x4e>
  805aab:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  805aac:	72 20                	jb     805ace <init_gdt+0x11>
  805aae:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  805aaf:	63 63 75             	movsxd esp,DWORD PTR [rbx+0x75]
  805ab2:	72 73                	jb     805b27 <fill_desc+0x58>
  805ab4:	20 61 74             	and    BYTE PTR [rcx+0x74],ah
  805ab7:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR [rip+0x6e5c78]        # eeb735 <_knl_end+0x2eb735>

0000000000805abd <init_gdt>:
#include "gdt.h"
#include "int.h"
descriptor *gdt=GDT_ADDR;
extern char *gdtptr;
int init_gdt()
{
  805abd:	f3 0f 1e fa          	endbr64 
  805ac1:	55                   	push   rbp
  805ac2:	48 89 e5             	mov    rbp,rsp
//    fill_desc(0x108000,108,SEG_SYS_TSS|SEG_PRESENT,4);
    asm volatile("mov $0x48,%ax\r\n"
  805ac5:	66 b8 48 00          	mov    ax,0x48
  805ac9:	0f 00 d8             	ltr    ax
                 "ltr %ax");  
}
  805acc:	90                   	nop
  805acd:	5d                   	pop    rbp
  805ace:	c3                   	ret    

0000000000805acf <fill_desc>:
void fill_desc(u64 base, u64 limit, u16 attr, u32 index)
{
  805acf:	f3 0f 1e fa          	endbr64 
  805ad3:	55                   	push   rbp
  805ad4:	48 89 e5             	mov    rbp,rsp
  805ad7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  805adb:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  805adf:	89 d0                	mov    eax,edx
  805ae1:	89 4d e8             	mov    DWORD PTR [rbp-0x18],ecx
  805ae4:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    gdt[index].base_12=base&0xffff;
  805ae8:	48 8b 15 d9 69 00 00 	mov    rdx,QWORD PTR [rip+0x69d9]        # 80c4c8 <gdt>
  805aef:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805af2:	48 c1 e0 04          	shl    rax,0x4
  805af6:	48 01 d0             	add    rax,rdx
  805af9:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  805afd:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    gdt[index].base_3=(base>>16)&0xff;
  805b01:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805b05:	48 c1 e8 10          	shr    rax,0x10
  805b09:	48 89 c1             	mov    rcx,rax
  805b0c:	48 8b 15 b5 69 00 00 	mov    rdx,QWORD PTR [rip+0x69b5]        # 80c4c8 <gdt>
  805b13:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805b16:	48 c1 e0 04          	shl    rax,0x4
  805b1a:	48 01 d0             	add    rax,rdx
  805b1d:	89 ca                	mov    edx,ecx
  805b1f:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    gdt[index].base_4=(base>>24)&0xff;
  805b22:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805b26:	48 c1 e8 18          	shr    rax,0x18
  805b2a:	48 89 c1             	mov    rcx,rax
  805b2d:	48 8b 15 94 69 00 00 	mov    rdx,QWORD PTR [rip+0x6994]        # 80c4c8 <gdt>
  805b34:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805b37:	48 c1 e0 04          	shl    rax,0x4
  805b3b:	48 01 d0             	add    rax,rdx
  805b3e:	89 ca                	mov    edx,ecx
  805b40:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    gdt[index].base_5678=(base>>32)&0xffffffff;
  805b43:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805b47:	48 c1 e8 20          	shr    rax,0x20
  805b4b:	48 89 c2             	mov    rdx,rax
  805b4e:	48 8b 0d 73 69 00 00 	mov    rcx,QWORD PTR [rip+0x6973]        # 80c4c8 <gdt>
  805b55:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805b58:	48 c1 e0 04          	shl    rax,0x4
  805b5c:	48 01 c8             	add    rax,rcx
  805b5f:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    gdt[index].limit_lo16=limit&0xffff;
  805b62:	48 8b 15 5f 69 00 00 	mov    rdx,QWORD PTR [rip+0x695f]        # 80c4c8 <gdt>
  805b69:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805b6c:	48 c1 e0 04          	shl    rax,0x4
  805b70:	48 01 d0             	add    rax,rdx
  805b73:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  805b77:	66 89 10             	mov    WORD PTR [rax],dx
    gdt[index].attr=attr|((limit>>8)&0xf0);
  805b7a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805b7e:	48 c1 e8 08          	shr    rax,0x8
  805b82:	66 25 f0 00          	and    ax,0xf0
  805b86:	48 8b 0d 3b 69 00 00 	mov    rcx,QWORD PTR [rip+0x693b]        # 80c4c8 <gdt>
  805b8d:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  805b90:	48 c1 e2 04          	shl    rdx,0x4
  805b94:	48 01 ca             	add    rdx,rcx
  805b97:	66 0b 45 ec          	or     ax,WORD PTR [rbp-0x14]
  805b9b:	66 89 42 05          	mov    WORD PTR [rdx+0x5],ax

}
  805b9f:	90                   	nop
  805ba0:	5d                   	pop    rbp
  805ba1:	c3                   	ret    

0000000000805ba2 <fill_gate>:

void fill_gate(u32 index,u32 offset,u16 selector,u16 attr)
{
  805ba2:	f3 0f 1e fa          	endbr64 
  805ba6:	55                   	push   rbp
  805ba7:	48 89 e5             	mov    rbp,rsp
  805baa:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  805bad:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  805bb0:	89 c8                	mov    eax,ecx
  805bb2:	66 89 55 e4          	mov    WORD PTR [rbp-0x1c],dx
  805bb6:	66 89 45 e0          	mov    WORD PTR [rbp-0x20],ax
    gate* ptr=gdt;
  805bba:	48 8b 05 07 69 00 00 	mov    rax,QWORD PTR [rip+0x6907]        # 80c4c8 <gdt>
  805bc1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ptr[index].offset_low=offset&0xffff;
  805bc5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805bc8:	48 c1 e0 04          	shl    rax,0x4
  805bcc:	48 89 c2             	mov    rdx,rax
  805bcf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805bd3:	48 01 d0             	add    rax,rdx
  805bd6:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  805bd9:	66 89 10             	mov    WORD PTR [rax],dx
    ptr[index].offset_high=(offset>>16)&0xffff;
  805bdc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805bdf:	48 c1 e0 04          	shl    rax,0x4
  805be3:	48 89 c2             	mov    rdx,rax
  805be6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805bea:	48 01 d0             	add    rax,rdx
  805bed:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  805bf0:	c1 ea 10             	shr    edx,0x10
  805bf3:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    ptr[index].selector=selector;
  805bf6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805bf9:	48 c1 e0 04          	shl    rax,0x4
  805bfd:	48 89 c2             	mov    rdx,rax
  805c00:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805c04:	48 01 c2             	add    rdx,rax
  805c07:	0f b7 45 e4          	movzx  eax,WORD PTR [rbp-0x1c]
  805c0b:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    ptr[index].attr=attr;
  805c0f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805c12:	48 c1 e0 04          	shl    rax,0x4
  805c16:	48 89 c2             	mov    rdx,rax
  805c19:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805c1d:	48 01 c2             	add    rdx,rax
  805c20:	0f b7 45 e0          	movzx  eax,WORD PTR [rbp-0x20]
  805c24:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
}
  805c28:	90                   	nop
  805c29:	5d                   	pop    rbp
  805c2a:	c3                   	ret    

0000000000805c2b <fill_ldt_desc>:

void fill_ldt_desc(u32 base, u32 limit,u16 attr,descriptor *desc)
{
  805c2b:	f3 0f 1e fa          	endbr64 
  805c2f:	55                   	push   rbp
  805c30:	48 89 e5             	mov    rbp,rsp
  805c33:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  805c36:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  805c39:	89 d0                	mov    eax,edx
  805c3b:	48 89 4d e8          	mov    QWORD PTR [rbp-0x18],rcx
  805c3f:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
//    desc->base_lo16=base&0xffff;
//    desc->base_mid8=(base>>16)&0xff;
//    desc->base_hi8=(base>>24)&0xff;
//    desc->limit_lo16=limit&0xffff;
//    desc->attr=attr|(limit>>16&0xf)<<8;
  805c43:	90                   	nop
  805c44:	5d                   	pop    rbp
  805c45:	c3                   	ret    
  805c46:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  805c4d:	00 00 00 

0000000000805c50 <fill_desc>:
  805c50:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  805c55:	67 8b 5c 24 08       	mov    ebx,DWORD PTR [esp+0x8]
  805c5a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  805c5f:	67 8b 54 24 10       	mov    edx,DWORD PTR [esp+0x10]
  805c64:	be 00 60 00 00       	mov    esi,0x6000
  805c69:	c1 e2 03             	shl    edx,0x3
  805c6c:	01 d6                	add    esi,edx
  805c6e:	66 67 89 1e          	mov    WORD PTR [esi],bx
  805c72:	66 67 89 46 02       	mov    WORD PTR [esi+0x2],ax
  805c77:	c1 e8 10             	shr    eax,0x10
  805c7a:	67 88 46 04          	mov    BYTE PTR [esi+0x4],al
  805c7e:	c1 eb 10             	shr    ebx,0x10
  805c81:	67 88 5e 06          	mov    BYTE PTR [esi+0x6],bl
  805c85:	67 88 66 07          	mov    BYTE PTR [esi+0x7],ah
  805c89:	67 09 4e 05          	or     DWORD PTR [esi+0x5],ecx
  805c8d:	c3                   	ret    

0000000000805c8e <clock_c>:
#include <devman.h>
#include <disk.h>
extern int manage_proc_lock;
extern int cur_proc;
extern struct process *task;
void clock_c(){
  805c8e:	f3 0f 1e fa          	endbr64 
  805c92:	55                   	push   rbp
  805c93:	48 89 e5             	mov    rbp,rsp
    //refresh_wnds();
    execute_request();
  805c96:	b8 00 00 00 00       	mov    eax,0x0
  805c9b:	e8 f3 24 00 00       	call   808193 <execute_request>
    do_req();
  805ca0:	b8 00 00 00 00       	mov    eax,0x0
  805ca5:	e8 d3 d6 ff ff       	call   80337d <do_req>
    if(!manage_proc_lock)
  805caa:	8b 05 b8 67 00 00    	mov    eax,DWORD PTR [rip+0x67b8]        # 80c468 <manage_proc_lock>
  805cb0:	85 c0                	test   eax,eax
  805cb2:	75 0a                	jne    805cbe <clock_c+0x30>
    {
        manage_proc();
  805cb4:	b8 00 00 00 00       	mov    eax,0x0
  805cb9:	e8 10 df ff ff       	call   803bce <manage_proc>
    }
    //puts("1 disk req executed.");
  805cbe:	90                   	nop
  805cbf:	5d                   	pop    rbp
  805cc0:	c3                   	ret    
  805cc1:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  805cc8:	00 00 00 
  805ccb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000805cd0 <clock>:
  805cd0:	50                   	push   rax
  805cd1:	53                   	push   rbx
  805cd2:	51                   	push   rcx
  805cd3:	52                   	push   rdx
  805cd4:	57                   	push   rdi
  805cd5:	56                   	push   rsi
  805cd6:	41 50                	push   r8
  805cd8:	41 51                	push   r9
  805cda:	41 52                	push   r10
  805cdc:	41 53                	push   r11
  805cde:	41 54                	push   r12
  805ce0:	41 55                	push   r13
  805ce2:	41 56                	push   r14
  805ce4:	41 57                	push   r15
  805ce6:	e8 bb de ff ff       	call   803ba6 <save_rsp>
  805ceb:	66 8c c0             	mov    ax,es
  805cee:	50                   	push   rax
  805cef:	66 8c d8             	mov    ax,ds
  805cf2:	50                   	push   rax
  805cf3:	66 b8 10 00          	mov    ax,0x10
  805cf7:	8e c0                	mov    es,eax
  805cf9:	8e d8                	mov    ds,eax

0000000000805cfb <clock.normal_part>:
  805cfb:	b0 20                	mov    al,0x20
  805cfd:	e6 a0                	out    0xa0,al
  805cff:	e6 20                	out    0x20,al
  805d01:	e8 88 ff ff ff       	call   805c8e <clock_c>
  805d06:	58                   	pop    rax
  805d07:	8e d8                	mov    ds,eax
  805d09:	58                   	pop    rax
  805d0a:	8e c0                	mov    es,eax
  805d0c:	41 5f                	pop    r15
  805d0e:	41 5e                	pop    r14
  805d10:	41 5d                	pop    r13
  805d12:	41 5c                	pop    r12
  805d14:	41 5b                	pop    r11
  805d16:	41 5a                	pop    r10
  805d18:	41 59                	pop    r9
  805d1a:	41 58                	pop    r8
  805d1c:	5e                   	pop    rsi
  805d1d:	5f                   	pop    rdi
  805d1e:	5a                   	pop    rdx
  805d1f:	59                   	pop    rcx
  805d20:	5b                   	pop    rbx
  805d21:	58                   	pop    rax
  805d22:	48 cf                	iretq  

0000000000805d24 <execute>:
    return ind;
}
*/

int execute(char *path, char **argv)
{
  805d24:	f3 0f 1e fa          	endbr64 
  805d28:	55                   	push   rbp
  805d29:	48 89 e5             	mov    rbp,rsp
  805d2c:	48 83 ec 30          	sub    rsp,0x30
  805d30:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  805d34:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    //尚未切换到目标进程
    //syscall(SYSCALL_REG_PROC, load_pe,0,0,0,0);
    int fno=-1,cwd_fno=-1;
  805d38:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  805d3f:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    if((fno=sys_open(path, O_EXEC)) <0)return -1;
  805d46:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805d4a:	be 00 10 00 00       	mov    esi,0x1000
  805d4f:	48 89 c7             	mov    rdi,rax
  805d52:	e8 5b 15 00 00       	call   8072b2 <sys_open>
  805d57:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  805d5a:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  805d5e:	79 0a                	jns    805d6a <execute+0x46>
  805d60:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805d65:	e9 ba 00 00 00       	jmp    805e24 <execute+0x100>
    //
    char *p=path;
  805d6a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805d6e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='\0';p++);
  805d72:	eb 05                	jmp    805d79 <execute+0x55>
  805d74:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  805d79:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805d7d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805d80:	84 c0                	test   al,al
  805d82:	75 f0                	jne    805d74 <execute+0x50>
    for(;*p!='/'&&p>path;p--);
  805d84:	eb 05                	jmp    805d8b <execute+0x67>
  805d86:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  805d8b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805d8f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805d92:	3c 2f                	cmp    al,0x2f
  805d94:	74 0a                	je     805da0 <execute+0x7c>
  805d96:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805d9a:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  805d9e:	77 e6                	ja     805d86 <execute+0x62>
    if(p>path)
  805da0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805da4:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  805da8:	76 2f                	jbe    805dd9 <execute+0xb5>
    {
        *p='\0';
  805daa:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805dae:	c6 00 00             	mov    BYTE PTR [rax],0x0
        if((cwd_fno=sys_open(path, O_DIRECTORY)) <0)return -1;
  805db1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805db5:	be 00 40 00 00       	mov    esi,0x4000
  805dba:	48 89 c7             	mov    rdi,rax
  805dbd:	e8 f0 14 00 00       	call   8072b2 <sys_open>
  805dc2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805dc5:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  805dc9:	79 07                	jns    805dd2 <execute+0xae>
  805dcb:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805dd0:	eb 52                	jmp    805e24 <execute+0x100>
        *p='/';
  805dd2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805dd6:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
    }
    extern struct file opened[];
    extern struct process task[];
    int pi= reg_proc(proc_start, &opened[cwd_fno], &opened[fno]);
  805dd9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805ddc:	48 63 d0             	movsxd rdx,eax
  805ddf:	48 89 d0             	mov    rax,rdx
  805de2:	48 c1 e0 02          	shl    rax,0x2
  805de6:	48 01 d0             	add    rax,rdx
  805de9:	48 c1 e0 03          	shl    rax,0x3
  805ded:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  805df4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805df7:	48 63 c8             	movsxd rcx,eax
  805dfa:	48 89 c8             	mov    rax,rcx
  805dfd:	48 c1 e0 02          	shl    rax,0x2
  805e01:	48 01 c8             	add    rax,rcx
  805e04:	48 c1 e0 03          	shl    rax,0x3
  805e08:	48 05 60 06 40 00    	add    rax,0x400660
  805e0e:	b9 96 5f 80 00       	mov    ecx,0x805f96
  805e13:	48 89 c6             	mov    rsi,rax
  805e16:	48 89 cf             	mov    rdi,rcx
  805e19:	e8 7b e6 ff ff       	call   804499 <reg_proc>
  805e1e:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    return pi;
  805e21:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
}
  805e24:	c9                   	leave  
  805e25:	c3                   	ret    

0000000000805e26 <sys_execve>:

int sys_execve(char *path,char **argv){
  805e26:	f3 0f 1e fa          	endbr64 
  805e2a:	55                   	push   rbp
  805e2b:	48 89 e5             	mov    rbp,rsp
  805e2e:	48 83 ec 30          	sub    rsp,0x30
  805e32:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  805e36:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    int fno=-1,cwd_fno=-1;
  805e3a:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
  805e41:	c7 45 f8 ff ff ff ff 	mov    DWORD PTR [rbp-0x8],0xffffffff
    if((fno=sys_open(path, O_EXEC)) <0)return -ENOENT;
  805e48:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805e4c:	be 00 10 00 00       	mov    esi,0x1000
  805e51:	48 89 c7             	mov    rdi,rax
  805e54:	e8 59 14 00 00       	call   8072b2 <sys_open>
  805e59:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805e5c:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  805e60:	79 0a                	jns    805e6c <sys_execve+0x46>
  805e62:	b8 d3 ff ff ff       	mov    eax,0xffffffd3
  805e67:	e9 ad 00 00 00       	jmp    805f19 <sys_execve+0xf3>
//        if((cwd_fno=sys_open(path, O_DIRECTORY)) <0)return -1;
//        *p='/';
//    }
    extern struct file opened[];
    extern struct process task[];
    if(sys_close(current->exef-opened)<0)return -1;
  805e6c:	48 8b 05 2d e6 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e62d]        # 4144a0 <current>
  805e73:	48 8b 80 bc 00 00 00 	mov    rax,QWORD PTR [rax+0xbc]
  805e7a:	48 2d 60 06 40 00    	sub    rax,0x400660
  805e80:	48 c1 f8 03          	sar    rax,0x3
  805e84:	48 89 c2             	mov    rdx,rax
  805e87:	48 b8 cd cc cc cc cc 	movabs rax,0xcccccccccccccccd
  805e8e:	cc cc cc 
  805e91:	48 0f af c2          	imul   rax,rdx
  805e95:	89 c7                	mov    edi,eax
  805e97:	e8 2d 17 00 00       	call   8075c9 <sys_close>

    void *retp= load_pe;
  805e9c:	48 c7 45 f0 cf 5f 80 	mov    QWORD PTR [rbp-0x10],0x805fcf
  805ea3:	00 
    current->exef=&opened[fno];//改变执行文件
  805ea4:	48 8b 15 f5 e5 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e5f5]        # 4144a0 <current>
  805eab:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805eae:	48 63 c8             	movsxd rcx,eax
  805eb1:	48 89 c8             	mov    rax,rcx
  805eb4:	48 c1 e0 02          	shl    rax,0x2
  805eb8:	48 01 c8             	add    rax,rcx
  805ebb:	48 c1 e0 03          	shl    rax,0x3
  805ebf:	48 05 60 06 40 00    	add    rax,0x400660
  805ec5:	48 89 82 bc 00 00 00 	mov    QWORD PTR [rdx+0xbc],rax
    //重新设置进程数据
    //清空原来的页表
    release_mmap(current);
  805ecc:	48 8b 05 cd e5 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e5cd]        # 4144a0 <current>
  805ed3:	48 89 c7             	mov    rdi,rax
  805ed6:	e8 c5 f4 ff ff       	call   8053a0 <release_mmap>
    current->regs.rsp=STACK_TOP;//清空栈
  805edb:	48 8b 05 be e5 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e5be]        # 4144a0 <current>
  805ee2:	48 be 00 f0 ff ff ff 	movabs rsi,0xfffffffff000
  805ee9:	ff 00 00 
  805eec:	48 89 b0 68 02 00 00 	mov    QWORD PTR [rax+0x268],rsi
    extern TSS* tss;
    //sysret直接返回到load_pe加载新程序，然后直接开始运行新程序的main
    stack_store_regs *rs=tss->ists[0]- sizeof(stack_store_regs);
  805ef3:	48 8b 05 c6 65 00 00 	mov    rax,QWORD PTR [rip+0x65c6]        # 80c4c0 <tss>
  805efa:	48 8b 40 24          	mov    rax,QWORD PTR [rax+0x24]
  805efe:	48 2d a8 00 00 00    	sub    rax,0xa8
  805f04:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    rs->rcx=retp;
  805f08:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  805f0c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805f10:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    return 0;
  805f14:	b8 00 00 00 00       	mov    eax,0x0
}
  805f19:	c9                   	leave  
  805f1a:	c3                   	ret    

0000000000805f1b <exec_call>:
int exec_call(char *path)
{
  805f1b:	f3 0f 1e fa          	endbr64 
  805f1f:	55                   	push   rbp
  805f20:	48 89 e5             	mov    rbp,rsp
  805f23:	48 83 ec 20          	sub    rsp,0x20
  805f27:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pi= execute(path, NULL);
  805f2b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805f2f:	be 00 00 00 00       	mov    esi,0x0
  805f34:	48 89 c7             	mov    rdi,rax
  805f37:	e8 e8 fd ff ff       	call   805d24 <execute>
  805f3c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int tss= _TSS_IND(pi)*8;
  805f3f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805f42:	01 c0                	add    eax,eax
  805f44:	83 c0 05             	add    eax,0x5
  805f47:	c1 e0 03             	shl    eax,0x3
  805f4a:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    extern struct process task[];
    extern int cur_proc;
    switch_proc_tss(pi);
  805f4d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805f50:	89 c7                	mov    edi,eax
  805f52:	e8 3d de ff ff       	call   803d94 <switch_proc_tss>
    while(task[pi].stat!=ENDED);
  805f57:	90                   	nop
  805f58:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805f5b:	48 63 d0             	movsxd rdx,eax
  805f5e:	48 89 d0             	mov    rax,rdx
  805f61:	48 01 c0             	add    rax,rax
  805f64:	48 01 d0             	add    rax,rdx
  805f67:	48 c1 e0 08          	shl    rax,0x8
  805f6b:	48 05 a0 84 40 00    	add    rax,0x4084a0
  805f71:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805f74:	83 f8 03             	cmp    eax,0x3
  805f77:	75 df                	jne    805f58 <exec_call+0x3d>
    return task[pi].exit_code;
  805f79:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805f7c:	48 63 d0             	movsxd rdx,eax
  805f7f:	48 89 d0             	mov    rax,rdx
  805f82:	48 01 c0             	add    rax,rax
  805f85:	48 01 d0             	add    rax,rdx
  805f88:	48 c1 e0 08          	shl    rax,0x8
  805f8c:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805f92:	8b 00                	mov    eax,DWORD PTR [rax]
}
  805f94:	c9                   	leave  
  805f95:	c3                   	ret    

0000000000805f96 <proc_start>:
int proc_start()
{
  805f96:	f3 0f 1e fa          	endbr64 
  805f9a:	55                   	push   rbp
  805f9b:	48 89 e5             	mov    rbp,rsp
    extern struct process task[];
    extern int cur_proc;
    load_pe(&task[cur_proc]);
  805f9e:	8b 05 88 e5 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e588]        # 41452c <cur_proc>
  805fa4:	48 63 d0             	movsxd rdx,eax
  805fa7:	48 89 d0             	mov    rax,rdx
  805faa:	48 01 c0             	add    rax,rax
  805fad:	48 01 d0             	add    rax,rdx
  805fb0:	48 c1 e0 08          	shl    rax,0x8
  805fb4:	48 05 a0 84 40 00    	add    rax,0x4084a0
  805fba:	48 89 c7             	mov    rdi,rax
  805fbd:	e8 0d 00 00 00       	call   805fcf <load_pe>
    //释放进程资源
    sys_exit(0);
  805fc2:	bf 00 00 00 00       	mov    edi,0x0
  805fc7:	e8 a5 e4 ff ff       	call   804471 <sys_exit>
}
  805fcc:	90                   	nop
  805fcd:	5d                   	pop    rbp
  805fce:	c3                   	ret    

0000000000805fcf <load_pe>:
//在cr3切换到目标进程下的加载程序
int load_pe(struct process *proc)
{
  805fcf:	f3 0f 1e fa          	endbr64 
  805fd3:	55                   	push   rbp
  805fd4:	48 89 e5             	mov    rbp,rsp
  805fd7:	48 81 ec c0 02 00 00 	sub    rsp,0x2c0
  805fde:	48 89 bd 48 fd ff ff 	mov    QWORD PTR [rbp-0x2b8],rdi
    // 读取文件头
    struct file *f=proc->exef;
  805fe5:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  805fec:	48 8b 80 bc 00 00 00 	mov    rax,QWORD PTR [rax+0xbc]
  805ff3:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    int exefno=-1;
  805ff7:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    for(int i=0;i<MAX_PROC_OPENF;i++)
  805ffe:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  806005:	eb 28                	jmp    80602f <load_pe+0x60>
        if(current->openf[i]==f)
  806007:	48 8b 05 92 e4 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e492]        # 4144a0 <current>
  80600e:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  806011:	48 63 d2             	movsxd rdx,edx
  806014:	48 83 c2 18          	add    rdx,0x18
  806018:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  80601d:	48 39 45 98          	cmp    QWORD PTR [rbp-0x68],rax
  806021:	75 08                	jne    80602b <load_pe+0x5c>
        {
            exefno=i;
  806023:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806026:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
            break;
  806029:	eb 0a                	jmp    806035 <load_pe+0x66>
    for(int i=0;i<MAX_PROC_OPENF;i++)
  80602b:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80602f:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  806033:	7e d2                	jle    806007 <load_pe+0x38>
        }
    if(exefno==-1)return ERR;
  806035:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  806039:	75 0a                	jne    806045 <load_pe+0x76>
  80603b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806040:	e9 11 07 00 00       	jmp    806756 <load_pe+0x787>

    IMAGE_DOS_HEADER tdh;
    IMAGE_NT_HEADERS32 tnth;
    sys_read(exefno, &tdh, sizeof(tdh));
  806045:	48 8d 8d 80 fe ff ff 	lea    rcx,[rbp-0x180]
  80604c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80604f:	ba 44 00 00 00       	mov    edx,0x44
  806054:	48 89 ce             	mov    rsi,rcx
  806057:	89 c7                	mov    edi,eax
  806059:	e8 23 16 00 00       	call   807681 <sys_read>
    sys_lseek(exefno,tdh.e_lfanew,SEEK_SET);
  80605e:	48 8b 85 bc fe ff ff 	mov    rax,QWORD PTR [rbp-0x144]
  806065:	48 89 c1             	mov    rcx,rax
  806068:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80606b:	ba 00 00 00 00       	mov    edx,0x0
  806070:	48 89 ce             	mov    rsi,rcx
  806073:	89 c7                	mov    edi,eax
  806075:	e8 67 17 00 00       	call   8077e1 <sys_lseek>
    sys_read(exefno, &tnth, sizeof(tnth));
  80607a:	48 8d 8d 70 fd ff ff 	lea    rcx,[rbp-0x290]
  806081:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806084:	ba 0c 01 00 00       	mov    edx,0x10c
  806089:	48 89 ce             	mov    rsi,rcx
  80608c:	89 c7                	mov    edi,eax
  80608e:	e8 ee 15 00 00       	call   807681 <sys_read>

    //是否需要移动base(先不检查)
    addr_t nbase=tnth.OptionalHeader.ImageBase;
  806093:	48 8b 85 a4 fd ff ff 	mov    rax,QWORD PTR [rbp-0x25c]
  80609a:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    int pgn=tnth.OptionalHeader.SizeOfImage/PAGE_SIZE;
  80609e:	8b 85 c4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x23c]
  8060a4:	c1 e8 0c             	shr    eax,0xc
  8060a7:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
//        break;
//    }

    //proc->tss.eip=tnth.OptionalHeader.AddressOfEntryPoint+nbase;
    //存放文件头
    sys_lseek(exefno,0,SEEK_SET);
  8060aa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8060ad:	ba 00 00 00 00       	mov    edx,0x0
  8060b2:	be 00 00 00 00       	mov    esi,0x0
  8060b7:	89 c7                	mov    edi,eax
  8060b9:	e8 23 17 00 00       	call   8077e1 <sys_lseek>
    sys_read(exefno, nbase, PAGE_SIZE);
  8060be:	48 8b 4d 90          	mov    rcx,QWORD PTR [rbp-0x70]
  8060c2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8060c5:	ba 00 10 00 00       	mov    edx,0x1000
  8060ca:	48 89 ce             	mov    rsi,rcx
  8060cd:	89 c7                	mov    edi,eax
  8060cf:	e8 ad 15 00 00       	call   807681 <sys_read>
    //dos头
    PIMAGE_DOS_HEADER dosh=nbase;
  8060d4:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8060d8:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
    PIMAGE_NT_HEADERS64 nth=nbase+dosh->e_lfanew;
  8060dc:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8060e0:	48 8b 50 3c          	mov    rdx,QWORD PTR [rax+0x3c]
  8060e4:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8060e8:	48 01 d0             	add    rax,rdx
  8060eb:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    PIMAGE_FILE_HEADER fh=&nth->FileHeader;
  8060f2:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8060f9:	48 83 c0 04          	add    rax,0x4
  8060fd:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    //为新进程分配内存页
    //计算所需的页
    int prog_size=nth->OptionalHeader.SizeOfImage;
  806104:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  80610b:	8b 40 50             	mov    eax,DWORD PTR [rax+0x50]
  80610e:	89 85 6c ff ff ff    	mov    DWORD PTR [rbp-0x94],eax
    int page_count=prog_size/4096;
  806114:	8b 85 6c ff ff ff    	mov    eax,DWORD PTR [rbp-0x94]
  80611a:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  806120:	85 c0                	test   eax,eax
  806122:	0f 48 c2             	cmovs  eax,edx
  806125:	c1 f8 0c             	sar    eax,0xc
  806128:	89 85 68 ff ff ff    	mov    DWORD PTR [rbp-0x98],eax

    addr_t shell_addr=nth->OptionalHeader.AddressOfEntryPoint+nbase;
  80612e:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806135:	8b 40 28             	mov    eax,DWORD PTR [rax+0x28]
  806138:	89 c2                	mov    edx,eax
  80613a:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80613e:	48 01 d0             	add    rax,rdx
  806141:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
    int page_index_item_count=page_count/1024+page_count%1024==0?0:1;
  806148:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [rbp-0x98]
  80614e:	8d 90 ff 03 00 00    	lea    edx,[rax+0x3ff]
  806154:	85 c0                	test   eax,eax
  806156:	0f 48 c2             	cmovs  eax,edx
  806159:	c1 f8 0a             	sar    eax,0xa
  80615c:	89 c1                	mov    ecx,eax
  80615e:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [rbp-0x98]
  806164:	99                   	cdq    
  806165:	c1 ea 16             	shr    edx,0x16
  806168:	01 d0                	add    eax,edx
  80616a:	25 ff 03 00 00       	and    eax,0x3ff
  80616f:	29 d0                	sub    eax,edx
  806171:	01 c8                	add    eax,ecx
  806173:	85 c0                	test   eax,eax
  806175:	0f 95 c0             	setne  al
  806178:	0f b6 c0             	movzx  eax,al
  80617b:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
    int start_pgind_item=shell_addr/PAGE_INDEX_SIZE;
  806181:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  806188:	48 c1 e8 15          	shr    rax,0x15
  80618c:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax

    //sys_read sections
    PIMAGE_SECTION_HEADER psec=(u32)nth+sizeof(IMAGE_NT_HEADERS32);
  806192:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806199:	89 c0                	mov    eax,eax
  80619b:	48 05 0c 01 00 00    	add    rax,0x10c
  8061a1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
    nth->FileHeader.NumberOfSections*sizeof(IMAGE_SECTION_HEADER);
  8061a5:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8061ac:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  8061b0:	0f b7 d0             	movzx  edx,ax
  8061b3:	89 d0                	mov    eax,edx
  8061b5:	c1 e0 02             	shl    eax,0x2
  8061b8:	01 d0                	add    eax,edx
  8061ba:	c1 e0 03             	shl    eax,0x3
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
  8061bd:	05 50 01 00 00       	add    eax,0x150
  8061c2:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
    int align=nth->OptionalHeader.FileAlignment;
  8061c8:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8061cf:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  8061d2:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    data_start=data_start%align?data_start-data_start%align+align:data_start;
  8061d8:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  8061de:	99                   	cdq    
  8061df:	f7 bd 50 ff ff ff    	idiv   DWORD PTR [rbp-0xb0]
  8061e5:	89 d0                	mov    eax,edx
  8061e7:	85 c0                	test   eax,eax
  8061e9:	74 23                	je     80620e <load_pe+0x23f>
  8061eb:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  8061f1:	99                   	cdq    
  8061f2:	f7 bd 50 ff ff ff    	idiv   DWORD PTR [rbp-0xb0]
  8061f8:	89 d1                	mov    ecx,edx
  8061fa:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  806200:	29 c8                	sub    eax,ecx
  806202:	89 c2                	mov    edx,eax
  806204:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  80620a:	01 d0                	add    eax,edx
  80620c:	eb 06                	jmp    806214 <load_pe+0x245>
  80620e:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  806214:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  80621a:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  806221:	eb 6b                	jmp    80628e <load_pe+0x2bf>
    {
        int disca=psec->Characteristics&IMAGE_SCN_MEM_DISCARDABLE;
  806223:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806227:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  80622a:	25 00 00 00 02       	and    eax,0x2000000
  80622f:	89 85 c4 fe ff ff    	mov    DWORD PTR [rbp-0x13c],eax
        if(disca)
  806235:	83 bd c4 fe ff ff 00 	cmp    DWORD PTR [rbp-0x13c],0x0
  80623c:	75 46                	jne    806284 <load_pe+0x2b5>
            continue;
        //直接读，缺页内核解决
        sys_lseek(exefno,psec->PointerToRawData,SEEK_SET);
  80623e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806242:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  806245:	89 c1                	mov    ecx,eax
  806247:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80624a:	ba 00 00 00 00       	mov    edx,0x0
  80624f:	48 89 ce             	mov    rsi,rcx
  806252:	89 c7                	mov    edi,eax
  806254:	e8 88 15 00 00       	call   8077e1 <sys_lseek>
        sys_read(exefno, psec->VirtualAddress + nbase,  psec->SizeOfRawData);
  806259:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80625d:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  806260:	89 c2                	mov    edx,eax
  806262:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806266:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  806269:	89 c1                	mov    ecx,eax
  80626b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80626f:	48 01 c8             	add    rax,rcx
  806272:	48 89 c1             	mov    rcx,rax
  806275:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806278:	48 89 ce             	mov    rsi,rcx
  80627b:	89 c7                	mov    edi,eax
  80627d:	e8 ff 13 00 00       	call   807681 <sys_read>
  806282:	eb 01                	jmp    806285 <load_pe+0x2b6>
            continue;
  806284:	90                   	nop
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  806285:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  806289:	48 83 45 f0 28       	add    QWORD PTR [rbp-0x10],0x28
  80628e:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806295:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  806299:	0f b7 c0             	movzx  eax,ax
  80629c:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80629f:	7c 82                	jl     806223 <load_pe+0x254>

    }

    //通过导入表加载需要的dll
    PIMAGE_DATA_DIRECTORY impd=&nth->OptionalHeader.DataDirectory[1];
  8062a1:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8062a8:	48 05 90 00 00 00    	add    rax,0x90
  8062ae:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    if(impd->Size>0)
  8062b5:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8062bc:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8062bf:	85 c0                	test   eax,eax
  8062c1:	0f 84 7b 02 00 00    	je     806542 <load_pe+0x573>
    {
        int tmpi=impd->VirtualAddress+nbase;
  8062c7:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8062ce:	8b 10                	mov    edx,DWORD PTR [rax]
  8062d0:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8062d4:	01 d0                	add    eax,edx
  8062d6:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
        PIMAGE_IMPORT_DESCRIPTOR impdes=tmpi;
  8062dc:	8b 85 44 ff ff ff    	mov    eax,DWORD PTR [rbp-0xbc]
  8062e2:	48 98                	cdqe   
  8062e4:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        int dllp;
        while (impdes->Characteristics)
  8062e8:	e9 47 02 00 00       	jmp    806534 <load_pe+0x565>
        {
            //加载dll
            char *dllname=impdes->Name+nbase;
  8062ed:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8062f1:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  8062f4:	89 c2                	mov    edx,eax
  8062f6:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8062fa:	48 01 d0             	add    rax,rdx
  8062fd:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
            //此处应有加载dll代码
            int dlli;
            if(strcmp(dllname,"sys.dll")==0)//加载系统dll的部分由内核已经完成
  806304:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
  80630b:	be cf 40 81 00       	mov    esi,0x8140cf
  806310:	48 89 c7             	mov    rdi,rax
  806313:	e8 27 5a 00 00       	call   80bd3f <strcmp>
  806318:	85 c0                	test   eax,eax
  80631a:	75 09                	jne    806325 <load_pe+0x356>
            {
                dllp=0x1c00000;
  80631c:	c7 45 dc 00 00 c0 01 	mov    DWORD PTR [rbp-0x24],0x1c00000
  806323:	eb 25                	jmp    80634a <load_pe+0x37b>
            }else{
                //load_pe要记录module的加载
                dlli= load_pe(proc);
  806325:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  80632c:	48 89 c7             	mov    rdi,rax
  80632f:	e8 9b fc ff ff       	call   805fcf <load_pe>
  806334:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
                //dlli=load_library(dllname);
                //这个是线性地址
                dllp=get_module_addr(dlli);
  80633a:	8b 85 34 ff ff ff    	mov    eax,DWORD PTR [rbp-0xcc]
  806340:	89 c7                	mov    edi,eax
  806342:	e8 11 04 00 00       	call   806758 <get_module_addr>
  806347:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            }
            //从线性地址查页表找到物理地址
            PIMAGE_DOS_HEADER dlldos=dllp;
  80634a:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80634d:	48 98                	cdqe   
  80634f:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
            PIMAGE_NT_HEADERS32 dllnth=dllp+dlldos->e_lfanew;
  806356:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806359:	48 63 d0             	movsxd rdx,eax
  80635c:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  806363:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  806367:	48 01 d0             	add    rax,rdx
  80636a:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
            PIMAGE_EXPORT_DIRECTORY dllexp=(dllnth->OptionalHeader.DataDirectory[0].VirtualAddress+dllp);
  806371:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  806378:	8b 90 8c 00 00 00    	mov    edx,DWORD PTR [rax+0x8c]
  80637e:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806381:	01 d0                	add    eax,edx
  806383:	89 c0                	mov    eax,eax
  806385:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
            int funcn=dllexp->NumberOfNames;
  80638c:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  806393:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  806396:	89 85 14 ff ff ff    	mov    DWORD PTR [rbp-0xec],eax
            char **fnames=dllexp->AddressOfNames+dllp;
  80639c:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8063a3:	8b 50 20             	mov    edx,DWORD PTR [rax+0x20]
  8063a6:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8063a9:	01 d0                	add    eax,edx
  8063ab:	89 c0                	mov    eax,eax
  8063ad:	48 89 85 08 ff ff ff 	mov    QWORD PTR [rbp-0xf8],rax
            int *funcaddrs=dllexp->AddressOfFunctions+dllp;
  8063b4:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8063bb:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8063be:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8063c1:	01 d0                	add    eax,edx
  8063c3:	89 c0                	mov    eax,eax
  8063c5:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
            short *funcords=dllexp->AddressOfNameOrdinals+dllp;
  8063cc:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8063d3:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  8063d6:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8063d9:	01 d0                	add    eax,edx
  8063db:	89 c0                	mov    eax,eax
  8063dd:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
            //寻找nameordinal的base（最小值），里面的数据加上base才是真正的序号
            unsigned int ord_base=dllexp->Base;
  8063e4:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8063eb:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8063ee:	89 85 f4 fe ff ff    	mov    DWORD PTR [rbp-0x10c],eax
            //开始将导入表IAT的内容更新为函数地址
            unsigned int *iataddrs=impdes->FirstThunk+nbase;//IAT和INT内容一样，只用IAT
  8063f4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8063f8:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8063fb:	89 c2                	mov    edx,eax
  8063fd:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806401:	48 01 d0             	add    rax,rdx
  806404:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            char **siataddrs=impdes->FirstThunk+nbase;
  806408:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80640c:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80640f:	89 c2                	mov    edx,eax
  806411:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806415:	48 01 d0             	add    rax,rdx
  806418:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            while (*iataddrs)
  80641c:	e9 00 01 00 00       	jmp    806521 <load_pe+0x552>
            {
                //判断是序号导入还是名称导入
                if(((unsigned)*iataddrs)&0x80000000)
  806421:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806425:	8b 00                	mov    eax,DWORD PTR [rax]
  806427:	85 c0                	test   eax,eax
  806429:	79 43                	jns    80646e <load_pe+0x49f>
                {
                    //序号导入
                    unsigned int ord=((*iataddrs)&0x7fffffff)-ord_base;
  80642b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80642f:	8b 00                	mov    eax,DWORD PTR [rax]
  806431:	25 ff ff ff 7f       	and    eax,0x7fffffff
  806436:	2b 85 f4 fe ff ff    	sub    eax,DWORD PTR [rbp-0x10c]
  80643c:	89 85 e0 fe ff ff    	mov    DWORD PTR [rbp-0x120],eax
                    *iataddrs=funcaddrs[ord]+dllp;
  806442:	8b 85 e0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x120]
  806448:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  80644f:	00 
  806450:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  806457:	48 01 d0             	add    rax,rdx
  80645a:	8b 10                	mov    edx,DWORD PTR [rax]
  80645c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80645f:	01 d0                	add    eax,edx
  806461:	89 c2                	mov    edx,eax
  806463:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806467:	89 10                	mov    DWORD PTR [rax],edx
  806469:	e9 a9 00 00 00       	jmp    806517 <load_pe+0x548>
                }else
                {
                    //名称导入
                    char *import_by_name_p=*iataddrs;//指向IMPORT_BY_NAME
  80646e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806472:	8b 00                	mov    eax,DWORD PTR [rax]
  806474:	89 c0                	mov    eax,eax
  806476:	48 89 85 e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],rax
                    import_by_name_p+=2;//跳过开头两字节序号
  80647d:	48 83 85 e8 fe ff ff 	add    QWORD PTR [rbp-0x118],0x2
  806484:	02 
                    int i=0;
  806485:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
                    for(;i<funcn;i++)
  80648c:	eb 7a                	jmp    806508 <load_pe+0x539>
                    {
                        if(strcmp(import_by_name_p,fnames[i])==0)
  80648e:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  806491:	48 98                	cdqe   
  806493:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80649a:	00 
  80649b:	48 8b 85 08 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf8]
  8064a2:	48 01 d0             	add    rax,rdx
  8064a5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8064a8:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
  8064af:	48 89 d6             	mov    rsi,rdx
  8064b2:	48 89 c7             	mov    rdi,rax
  8064b5:	e8 85 58 00 00       	call   80bd3f <strcmp>
  8064ba:	85 c0                	test   eax,eax
  8064bc:	75 46                	jne    806504 <load_pe+0x535>
                        {
                            int ordi=funcords[i];
  8064be:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8064c1:	48 98                	cdqe   
  8064c3:	48 8d 14 00          	lea    rdx,[rax+rax*1]
  8064c7:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8064ce:	48 01 d0             	add    rax,rdx
  8064d1:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8064d4:	98                   	cwde   
  8064d5:	89 85 e4 fe ff ff    	mov    DWORD PTR [rbp-0x11c],eax
                            *iataddrs=funcaddrs[ordi]+dllp;//导入表中的IAT内容修改成地址
  8064db:	8b 85 e4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x11c]
  8064e1:	48 98                	cdqe   
  8064e3:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8064ea:	00 
  8064eb:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  8064f2:	48 01 d0             	add    rax,rdx
  8064f5:	8b 10                	mov    edx,DWORD PTR [rax]
  8064f7:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8064fa:	01 d0                	add    eax,edx
  8064fc:	89 c2                	mov    edx,eax
  8064fe:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806502:	89 10                	mov    DWORD PTR [rax],edx
                    for(;i<funcn;i++)
  806504:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
  806508:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80650b:	3b 85 14 ff ff ff    	cmp    eax,DWORD PTR [rbp-0xec]
  806511:	0f 8c 77 ff ff ff    	jl     80648e <load_pe+0x4bf>
                        }
                    }
                }
                iataddrs++;
  806517:	48 83 45 d0 04       	add    QWORD PTR [rbp-0x30],0x4
                siataddrs++;
  80651c:	48 83 45 c8 08       	add    QWORD PTR [rbp-0x38],0x8
            while (*iataddrs)
  806521:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806525:	8b 00                	mov    eax,DWORD PTR [rax]
  806527:	85 c0                	test   eax,eax
  806529:	0f 85 f2 fe ff ff    	jne    806421 <load_pe+0x452>
            }
            impdes++;
  80652f:	48 83 45 e0 14       	add    QWORD PTR [rbp-0x20],0x14
        while (impdes->Characteristics)
  806534:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806538:	8b 00                	mov    eax,DWORD PTR [rax]
  80653a:	85 c0                	test   eax,eax
  80653c:	0f 85 ab fd ff ff    	jne    8062ed <load_pe+0x31e>
        }
    }


    //开始重定位
    PIMAGE_BASE_RELOCATION relp=0;
  806542:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  806549:	00 
    if(nth->OptionalHeader.DataDirectory[5].Size>0)
  80654a:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806551:	8b 80 b4 00 00 00    	mov    eax,DWORD PTR [rax+0xb4]
  806557:	85 c0                	test   eax,eax
  806559:	0f 84 ec 00 00 00    	je     80664b <load_pe+0x67c>
    {
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  80655f:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806566:	8b 90 b0 00 00 00    	mov    edx,DWORD PTR [rax+0xb0]
                                +(u32)nbase);
  80656c:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  806570:	01 d0                	add    eax,edx
  806572:	89 c0                	mov    eax,eax
  806574:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        u16 *reloc=relp+sizeof(IMAGE_BASE_RELOCATION);
  806578:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80657c:	48 83 c0 40          	add    rax,0x40
  806580:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        u16 *rtype=reloc+1;
  806584:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  806588:	48 83 c0 02          	add    rax,0x2
  80658c:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
        int old_base=nth->OptionalHeader.ImageBase;
  806590:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806597:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80659b:	89 85 dc fe ff ff    	mov    DWORD PTR [rbp-0x124],eax
        while(relp->VirtualAddress){
  8065a1:	e9 97 00 00 00       	jmp    80663d <load_pe+0x66e>
            int pgva=relp->VirtualAddress+nbase;
  8065a6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8065aa:	8b 10                	mov    edx,DWORD PTR [rax]
  8065ac:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8065b0:	01 d0                	add    eax,edx
  8065b2:	89 85 d8 fe ff ff    	mov    DWORD PTR [rbp-0x128],eax
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  8065b8:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
  8065bf:	eb 5a                	jmp    80661b <load_pe+0x64c>
            {
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  8065c1:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8065c5:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8065c8:	66 85 c0             	test   ax,ax
  8065cb:	74 49                	je     806616 <load_pe+0x647>
                int *at=*reloc+pgva;//要重定位的数据的地址
  8065cd:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8065d1:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8065d4:	0f b7 d0             	movzx  edx,ax
  8065d7:	8b 85 d8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x128]
  8065dd:	01 d0                	add    eax,edx
  8065df:	48 98                	cdqe   
  8065e1:	48 89 85 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],rax
                *at=*at-old_base+nbase;
  8065e8:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
  8065ef:	8b 00                	mov    eax,DWORD PTR [rax]
  8065f1:	2b 85 dc fe ff ff    	sub    eax,DWORD PTR [rbp-0x124]
  8065f7:	89 c2                	mov    edx,eax
  8065f9:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8065fd:	01 d0                	add    eax,edx
  8065ff:	89 c2                	mov    edx,eax
  806601:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
  806608:	89 10                	mov    DWORD PTR [rax],edx
                //下一个
                reloc+=2;
  80660a:	48 83 45 b0 04       	add    QWORD PTR [rbp-0x50],0x4
                rtype+=2;
  80660f:	48 83 45 a8 04       	add    QWORD PTR [rbp-0x58],0x4
  806614:	eb 01                	jmp    806617 <load_pe+0x648>
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  806616:	90                   	nop
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  806617:	83 45 a4 01          	add    DWORD PTR [rbp-0x5c],0x1
  80661b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80661f:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806622:	c1 e8 02             	shr    eax,0x2
  806625:	89 c2                	mov    edx,eax
  806627:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  80662a:	39 c2                	cmp    edx,eax
  80662c:	77 93                	ja     8065c1 <load_pe+0x5f2>
            }
            relp=(int)relp+0x1000;
  80662e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806632:	05 00 10 00 00       	add    eax,0x1000
  806637:	48 98                	cdqe   
  806639:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        while(relp->VirtualAddress){
  80663d:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806641:	8b 00                	mov    eax,DWORD PTR [rax]
  806643:	85 c0                	test   eax,eax
  806645:	0f 85 5b ff ff ff    	jne    8065a6 <load_pe+0x5d7>
        }
    }
    extern struct process task[];
    extern int cur_proc;
    //初始化堆
    chunk_header hdrtmp={
  80664b:	c7 85 50 fd ff ff 00 	mov    DWORD PTR [rbp-0x2b0],0x0
  806652:	00 00 00 
  806655:	c7 85 54 fd ff ff 00 	mov    DWORD PTR [rbp-0x2ac],0x0
  80665c:	00 00 00 
  80665f:	48 c7 85 58 fd ff ff 	mov    QWORD PTR [rbp-0x2a8],0x0
  806666:	00 00 00 00 
  80666a:	48 c7 85 60 fd ff ff 	mov    QWORD PTR [rbp-0x2a0],0x0
  806671:	00 00 00 00 
            .next=NULL,
            .pgn=0,
            .prev=NULL
    };//空堆
    //拷贝触发页中断然后分配
    memcpy((chunk_header*)HEAP_BASE,&hdrtmp,sizeof(hdrtmp));
  806675:	48 8d 85 50 fd ff ff 	lea    rax,[rbp-0x2b0]
  80667c:	ba 18 00 00 00       	mov    edx,0x18
  806681:	48 89 c6             	mov    rsi,rax
  806684:	bf 00 00 00 01       	mov    edi,0x1000000
  806689:	e8 13 54 00 00       	call   80baa1 <memcpy>
    task[cur_proc].mem_struct.heap_base=HEAP_BASE;
  80668e:	8b 05 98 de c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0de98]        # 41452c <cur_proc>
  806694:	48 63 d0             	movsxd rdx,eax
  806697:	48 89 d0             	mov    rax,rdx
  80669a:	48 01 c0             	add    rax,rax
  80669d:	48 01 d0             	add    rax,rdx
  8066a0:	48 c1 e0 08          	shl    rax,0x8
  8066a4:	48 05 b0 84 40 00    	add    rax,0x4084b0
  8066aa:	c7 40 04 00 00 00 01 	mov    DWORD PTR [rax+0x4],0x1000000
    task[cur_proc].mem_struct.heap_top=HEAP_BASE+CHUNK_SIZE;
  8066b1:	8b 05 75 de c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0de75]        # 41452c <cur_proc>
  8066b7:	48 63 d0             	movsxd rdx,eax
  8066ba:	48 89 d0             	mov    rax,rdx
  8066bd:	48 01 c0             	add    rax,rax
  8066c0:	48 01 d0             	add    rax,rdx
  8066c3:	48 c1 e0 08          	shl    rax,0x8
  8066c7:	48 05 b0 84 40 00    	add    rax,0x4084b0
  8066cd:	c7 40 08 00 10 00 01 	mov    DWORD PTR [rax+0x8],0x1001000
    //设置栈
    task[cur_proc].mem_struct.stack_top=STACK_TOP;
  8066d4:	8b 05 52 de c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0de52]        # 41452c <cur_proc>
  8066da:	48 63 d0             	movsxd rdx,eax
  8066dd:	48 89 d0             	mov    rax,rdx
  8066e0:	48 01 c0             	add    rax,rax
  8066e3:	48 01 d0             	add    rax,rdx
  8066e6:	48 c1 e0 08          	shl    rax,0x8
  8066ea:	48 05 b0 84 40 00    	add    rax,0x4084b0
  8066f0:	c7 40 10 00 f0 ff ff 	mov    DWORD PTR [rax+0x10],0xfffff000


    //完毕,调用入口函数
    //重定位完毕，准备调用DllMain
    typedef int (*Main)(int,void*);
    Main main=shell_addr;
  8066f7:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  8066fe:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
    task[cur_proc].exit_code=main(0,NULL);
  806705:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  80670c:	be 00 00 00 00       	mov    esi,0x0
  806711:	bf 00 00 00 00       	mov    edi,0x0
  806716:	ff d0                	call   rax
  806718:	8b 15 0e de c0 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc0de0e]        # 41452c <cur_proc>
  80671e:	89 c1                	mov    ecx,eax
  806720:	48 63 d2             	movsxd rdx,edx
  806723:	48 89 d0             	mov    rax,rdx
  806726:	48 01 c0             	add    rax,rax
  806729:	48 01 d0             	add    rax,rdx
  80672c:	48 c1 e0 08          	shl    rax,0x8
  806730:	48 05 b0 84 40 00    	add    rax,0x4084b0
  806736:	89 08                	mov    DWORD PTR [rax],ecx
    return task[cur_proc].exit_code;
  806738:	8b 05 ee dd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ddee]        # 41452c <cur_proc>
  80673e:	48 63 d0             	movsxd rdx,eax
  806741:	48 89 d0             	mov    rax,rdx
  806744:	48 01 c0             	add    rax,rax
  806747:	48 01 d0             	add    rax,rdx
  80674a:	48 c1 e0 08          	shl    rax,0x8
  80674e:	48 05 b0 84 40 00    	add    rax,0x4084b0
  806754:	8b 00                	mov    eax,DWORD PTR [rax]
}
  806756:	c9                   	leave  
  806757:	c3                   	ret    

0000000000806758 <get_module_addr>:

int get_module_addr(int mi)
{
  806758:	f3 0f 1e fa          	endbr64 
  80675c:	55                   	push   rbp
  80675d:	48 89 e5             	mov    rbp,rsp
  806760:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return modules[mi].base;
  806763:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806766:	48 98                	cdqe   
  806768:	8b 04 c5 40 71 42 00 	mov    eax,DWORD PTR [rax*8+0x427140]
}
  80676f:	5d                   	pop    rbp
  806770:	c3                   	ret    

0000000000806771 <dispose_library>:
int dispose_library(int dlln)
{
  806771:	f3 0f 1e fa          	endbr64 
  806775:	55                   	push   rbp
  806776:	48 89 e5             	mov    rbp,rsp
  806779:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if(dlln<0||dlln>=MAX_DLLS)return -1;
  80677c:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  806780:	78 09                	js     80678b <dispose_library+0x1a>
  806782:	81 7d fc ff 00 00 00 	cmp    DWORD PTR [rbp-0x4],0xff
  806789:	7e 07                	jle    806792 <dispose_library+0x21>
  80678b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806790:	eb 1d                	jmp    8067af <dispose_library+0x3e>
    //空间不够，释放之前申请的
    // for(int j=0;j<dlls[dlln].page_used;j++)
    //     dispose_page(get_phyaddr(dlls[dlln].page_num[j]));
    //释放dll
    dlls[dlln].flag=DLL_STAT_EMPTY;
  806792:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806795:	48 98                	cdqe   
  806797:	48 69 c0 2c 01 00 00 	imul   rax,rax,0x12c
  80679e:	48 05 48 45 41 00    	add    rax,0x414548
  8067a4:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return 0;
  8067aa:	b8 00 00 00 00       	mov    eax,0x0
}
  8067af:	5d                   	pop    rbp
  8067b0:	c3                   	ret    

00000000008067b1 <sys_insmod>:

    return 0;
} */

int sys_insmod(char *path)
{
  8067b1:	f3 0f 1e fa          	endbr64 
  8067b5:	55                   	push   rbp
  8067b6:	48 89 e5             	mov    rbp,rsp
  8067b9:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  8067bd:	90                   	nop
  8067be:	5d                   	pop    rbp
  8067bf:	c3                   	ret    

00000000008067c0 <sys_rmmod>:
int sys_rmmod(char *name)
{
  8067c0:	f3 0f 1e fa          	endbr64 
  8067c4:	55                   	push   rbp
  8067c5:	48 89 e5             	mov    rbp,rsp
  8067c8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

  8067cc:	90                   	nop
  8067cd:	5d                   	pop    rbp
  8067ce:	c3                   	ret    
  8067cf:	90                   	nop

00000000008067d0 <_syscall>:
  8067d0:	55                   	push   rbp
  8067d1:	bd 00 80 10 00       	mov    ebp,0x108000
  8067d6:	48 89 65 14          	mov    QWORD PTR [rbp+0x14],rsp
  8067da:	48 8b 65 04          	mov    rsp,QWORD PTR [rbp+0x4]
  8067de:	50                   	push   rax
  8067df:	53                   	push   rbx
  8067e0:	51                   	push   rcx
  8067e1:	52                   	push   rdx
  8067e2:	57                   	push   rdi
  8067e3:	56                   	push   rsi
  8067e4:	41 50                	push   r8
  8067e6:	41 51                	push   r9
  8067e8:	41 52                	push   r10
  8067ea:	41 53                	push   r11
  8067ec:	41 54                	push   r12
  8067ee:	41 55                	push   r13
  8067f0:	41 56                	push   r14
  8067f2:	41 57                	push   r15
  8067f4:	66 8c c0             	mov    ax,es
  8067f7:	50                   	push   rax
  8067f8:	66 8c d8             	mov    ax,ds
  8067fb:	50                   	push   rax
  8067fc:	66 b8 10 00          	mov    ax,0x10
  806800:	8e c0                	mov    es,eax
  806802:	8e d8                	mov    ds,eax
  806804:	48 8b 44 24 78       	mov    rax,QWORD PTR [rsp+0x78]
  806809:	41 53                	push   r11
  80680b:	51                   	push   rcx
  80680c:	49 87 ca             	xchg   r10,rcx
  80680f:	e8 86 9d ff ff       	call   80059a <syscall>
  806814:	4c 87 d1             	xchg   rcx,r10
  806817:	59                   	pop    rcx
  806818:	41 5b                	pop    r11
  80681a:	48 89 44 24 78       	mov    QWORD PTR [rsp+0x78],rax
  80681f:	58                   	pop    rax
  806820:	8e d8                	mov    ds,eax
  806822:	58                   	pop    rax
  806823:	8e c0                	mov    es,eax
  806825:	41 5f                	pop    r15
  806827:	41 5e                	pop    r14
  806829:	41 5d                	pop    r13
  80682b:	41 5c                	pop    r12
  80682d:	41 5b                	pop    r11
  80682f:	41 5a                	pop    r10
  806831:	41 59                	pop    r9
  806833:	41 58                	pop    r8
  806835:	5e                   	pop    rsi
  806836:	5f                   	pop    rdi
  806837:	5a                   	pop    rdx
  806838:	59                   	pop    rcx
  806839:	5b                   	pop    rbx
  80683a:	58                   	pop    rax
  80683b:	48 89 65 04          	mov    QWORD PTR [rbp+0x4],rsp
  80683f:	48 8b 65 14          	mov    rsp,QWORD PTR [rbp+0x14]
  806843:	5d                   	pop    rbp
  806844:	fb                   	sti    
  806845:	48 0f 07             	sysretq 

0000000000806848 <init_framebuffer>:
static u32 font_width_bytes;
static u8 *glyph_table;
static u32 bytes_per_glyph, glyph_nr;
int font_size=1;
void init_framebuffer()
{
  806848:	f3 0f 1e fa          	endbr64 
  80684c:	55                   	push   rbp
  80684d:	48 89 e5             	mov    rbp,rsp
  806850:	48 83 ec 50          	sub    rsp,0x50
    //映射页帧内存
    size_t w=framebuffer.common.framebuffer_width;
  806854:	8b 05 fa 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20cfa]        # 427554 <framebuffer+0x14>
  80685a:	89 c0                	mov    eax,eax
  80685c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    size_t h=framebuffer.common.framebuffer_height;
  806860:	8b 05 f2 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20cf2]        # 427558 <framebuffer+0x18>
  806866:	89 c0                	mov    eax,eax
  806868:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    size_t bypp=framebuffer.common.framebuffer_bpp/8;
  80686c:	0f b6 05 e9 0c c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20ce9]        # 42755c <framebuffer+0x1c>
  806873:	c0 e8 03             	shr    al,0x3
  806876:	0f b6 c0             	movzx  eax,al
  806879:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    size_t inter=framebuffer.common.framebuffer_pitch;
  80687d:	8b 05 cd 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20ccd]        # 427550 <framebuffer+0x10>
  806883:	89 c0                	mov    eax,eax
  806885:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    size_t pc=w*h;
  806889:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80688d:	48 0f af 45 d8       	imul   rax,QWORD PTR [rbp-0x28]
  806892:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    size_t size=h*inter;
  806896:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80689a:	48 0f af 45 c8       	imul   rax,QWORD PTR [rbp-0x38]
  80689f:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    int pgc=size/PAGE_SIZE;
  8068a3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8068a7:	48 c1 e8 0c          	shr    rax,0xc
  8068ab:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    addr_t p=FRAMEBUFFER_ADDR;
  8068ae:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x40000000
  8068b5:	40 
    addr_t pp=framebuffer.common.framebuffer_addr;
  8068b6:	48 8b 05 8b 0c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20c8b]        # 427548 <framebuffer+0x8>
  8068bd:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for (size_t i = 0; i < pgc; i++)
  8068c1:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  8068c8:	00 
  8068c9:	eb 2d                	jmp    8068f8 <init_framebuffer+0xb0>
    {
        mmap(pp,p,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  8068cb:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  8068cf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8068d3:	ba 07 00 00 00       	mov    edx,0x7
  8068d8:	48 89 ce             	mov    rsi,rcx
  8068db:	48 89 c7             	mov    rdi,rax
  8068de:	e8 22 a6 ff ff       	call   800f05 <mmap>
        pp+=PAGE_SIZE;
  8068e3:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  8068ea:	00 
        p+=PAGE_SIZE;
  8068eb:	48 81 45 f8 00 10 00 	add    QWORD PTR [rbp-0x8],0x1000
  8068f2:	00 
    for (size_t i = 0; i < pgc; i++)
  8068f3:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  8068f8:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8068fb:	48 98                	cdqe   
  8068fd:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  806901:	72 c8                	jb     8068cb <init_framebuffer+0x83>
    }
    
    
}
  806903:	90                   	nop
  806904:	90                   	nop
  806905:	c9                   	leave  
  806906:	c3                   	ret    

0000000000806907 <init_font>:
void init_font(){
  806907:	f3 0f 1e fa          	endbr64 
  80690b:	55                   	push   rbp
  80690c:	48 89 e5             	mov    rbp,rsp
    boot_font = (struct psf2_header*) _binary_res_font_psf_start;
  80690f:	48 c7 05 66 0c c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20c66],0x80c780        # 427580 <boot_font>
  806916:	80 c7 80 00 

    font_width_bytes = (boot_font->width + 7) / 8;
  80691a:	48 8b 05 5f 0c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20c5f]        # 427580 <boot_font>
  806921:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  806924:	83 c0 07             	add    eax,0x7
  806927:	c1 e8 03             	shr    eax,0x3
  80692a:	89 05 60 0c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20c60],eax        # 427590 <font_width_bytes>
    font_width = font_width_bytes * 8;
  806930:	8b 05 5a 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20c5a]        # 427590 <font_width_bytes>
  806936:	c1 e0 03             	shl    eax,0x3
  806939:	89 05 49 0c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20c49],eax        # 427588 <font_width>
    font_height = boot_font->height;
  80693f:	48 8b 05 3a 0c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20c3a]        # 427580 <boot_font>
  806946:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  806949:	89 05 3d 0c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20c3d],eax        # 42758c <font_height>

    glyph_table = (u8*)_binary_res_font_psf_start+boot_font->header_size;
  80694f:	48 8b 05 2a 0c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20c2a]        # 427580 <boot_font>
  806956:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  806959:	89 c0                	mov    eax,eax
  80695b:	48 05 80 c7 80 00    	add    rax,0x80c780
  806961:	48 89 05 30 0c c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20c30],rax        # 427598 <glyph_table>
    glyph_nr = boot_font->glyph_nr;
  806968:	48 8b 05 11 0c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20c11]        # 427580 <boot_font>
  80696f:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  806972:	89 05 2c 0c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20c2c],eax        # 4275a4 <glyph_nr>
    bytes_per_glyph = boot_font->bytes_per_glyph;
  806978:	48 8b 05 01 0c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20c01]        # 427580 <boot_font>
  80697f:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  806982:	89 05 18 0c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20c18],eax        # 4275a0 <bytes_per_glyph>

    fb_cursor_x = fb_cursor_y = 0;
  806988:	c7 05 de 0b c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20bde],0x0        # 427570 <fb_cursor_y>
  80698f:	00 00 00 
  806992:	8b 05 d8 0b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20bd8]        # 427570 <fb_cursor_y>
  806998:	89 05 ce 0b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20bce],eax        # 42756c <fb_cursor_x>
    max_ch_nr_x = framebuffer.common.framebuffer_width / font_width;
  80699e:	8b 05 b0 0b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20bb0]        # 427554 <framebuffer+0x14>
  8069a4:	8b 0d de 0b c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc20bde]        # 427588 <font_width>
  8069aa:	ba 00 00 00 00       	mov    edx,0x0
  8069af:	f7 f1                	div    ecx
  8069b1:	89 05 bd 0b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20bbd],eax        # 427574 <max_ch_nr_x>
    max_ch_nr_y = framebuffer.common.framebuffer_height / font_height;
  8069b7:	8b 05 9b 0b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20b9b]        # 427558 <framebuffer+0x18>
  8069bd:	8b 35 c9 0b c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc20bc9]        # 42758c <font_height>
  8069c3:	ba 00 00 00 00       	mov    edx,0x0
  8069c8:	f7 f6                	div    esi
  8069ca:	89 05 a8 0b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20ba8],eax        # 427578 <max_ch_nr_y>
    font_size=1;
  8069d0:	c7 05 f6 5a 00 00 01 	mov    DWORD PTR [rip+0x5af6],0x1        # 80c4d0 <font_size>
  8069d7:	00 00 00 
}
  8069da:	90                   	nop
  8069db:	5d                   	pop    rbp
  8069dc:	c3                   	ret    

00000000008069dd <set_framebuffer>:
void set_framebuffer(struct multiboot_tag_framebuffer tag)
{
  8069dd:	f3 0f 1e fa          	endbr64 
  8069e1:	55                   	push   rbp
  8069e2:	48 89 e5             	mov    rbp,rsp
    framebuffer=tag;
  8069e5:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  8069e9:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  8069ed:	48 89 05 4c 0b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20b4c],rax        # 427540 <framebuffer>
  8069f4:	48 89 15 4d 0b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20b4d],rdx        # 427548 <framebuffer+0x8>
  8069fb:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
  8069ff:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  806a03:	48 89 05 46 0b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20b46],rax        # 427550 <framebuffer+0x10>
  806a0a:	48 89 15 47 0b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20b47],rdx        # 427558 <framebuffer+0x18>
  806a11:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
  806a15:	48 89 05 44 0b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20b44],rax        # 427560 <framebuffer+0x20>
}
  806a1c:	90                   	nop
  806a1d:	5d                   	pop    rbp
  806a1e:	c3                   	ret    

0000000000806a1f <fill_rect>:

void fill_rect(int x,int y,int w,int h,unsigned int color){
  806a1f:	f3 0f 1e fa          	endbr64 
  806a23:	55                   	push   rbp
  806a24:	48 89 e5             	mov    rbp,rsp
  806a27:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  806a2a:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  806a2d:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  806a30:	89 4d d0             	mov    DWORD PTR [rbp-0x30],ecx
  806a33:	44 89 45 cc          	mov    DWORD PTR [rbp-0x34],r8d
    unsigned int* fb= (unsigned int*) FRAMEBUFFER_ADDR;
  806a37:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x40000000
  806a3e:	40 
    //目前只写32bpp
    for(int py=x;py<h+x;py++){
  806a3f:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806a42:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  806a45:	eb 64                	jmp    806aab <fill_rect+0x8c>
        for(int px=y;px<w+y;px++){
  806a47:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  806a4a:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  806a4d:	eb 4b                	jmp    806a9a <fill_rect+0x7b>
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  806a4f:	8b 15 fb 0a c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20afb]        # 427550 <framebuffer+0x10>
  806a55:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806a58:	0f af c2             	imul   eax,edx
  806a5b:	89 c1                	mov    ecx,eax
                       +px*framebuffer.common.framebuffer_bpp/8;
  806a5d:	0f b6 05 f8 0a c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20af8]        # 42755c <framebuffer+0x1c>
  806a64:	0f b6 c0             	movzx  eax,al
  806a67:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  806a6b:	8d 50 07             	lea    edx,[rax+0x7]
  806a6e:	85 c0                	test   eax,eax
  806a70:	0f 48 c2             	cmovs  eax,edx
  806a73:	c1 f8 03             	sar    eax,0x3
  806a76:	48 98                	cdqe   
  806a78:	48 01 c8             	add    rax,rcx
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  806a7b:	48 05 00 00 00 40    	add    rax,0x40000000
  806a81:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
            fb=(unsigned int*)ptr;
  806a85:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806a89:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *fb=color;
  806a8d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806a91:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  806a94:	89 10                	mov    DWORD PTR [rax],edx
        for(int px=y;px<w+y;px++){
  806a96:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806a9a:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  806a9d:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  806aa0:	01 d0                	add    eax,edx
  806aa2:	39 45 f8             	cmp    DWORD PTR [rbp-0x8],eax
  806aa5:	7c a8                	jl     806a4f <fill_rect+0x30>
    for(int py=x;py<h+x;py++){
  806aa7:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806aab:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
  806aae:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806ab1:	01 d0                	add    eax,edx
  806ab3:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  806ab6:	7c 8f                	jl     806a47 <fill_rect+0x28>
        }
    }
}
  806ab8:	90                   	nop
  806ab9:	90                   	nop
  806aba:	5d                   	pop    rbp
  806abb:	c3                   	ret    

0000000000806abc <draw_text>:
unsigned char letters[];
void draw_text(int x, int y, int size, char *str)
{
  806abc:	f3 0f 1e fa          	endbr64 
  806ac0:	55                   	push   rbp
  806ac1:	48 89 e5             	mov    rbp,rsp
  806ac4:	48 83 ec 30          	sub    rsp,0x30
  806ac8:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806acb:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806ace:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  806ad1:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    int tx=x;
  806ad5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806ad8:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    while(*str!='\0')
  806adb:	eb 5a                	jmp    806b37 <draw_text+0x7b>
    {
        if(*str=='\n')
  806add:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806ae1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806ae4:	3c 0a                	cmp    al,0xa
  806ae6:	75 1c                	jne    806b04 <draw_text+0x48>
        {
            y+=font_height*size;
  806ae8:	8b 15 9e 0a c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20a9e]        # 42758c <font_height>
  806aee:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806af1:	0f af d0             	imul   edx,eax
  806af4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806af7:	01 d0                	add    eax,edx
  806af9:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            tx=x;
  806afc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806aff:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  806b02:	eb 2e                	jmp    806b32 <draw_text+0x76>
        }
        else
        {
            draw_letter(tx,y,size,*str);
  806b04:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806b08:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806b0b:	0f be c8             	movsx  ecx,al
  806b0e:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  806b11:	8b 75 e8             	mov    esi,DWORD PTR [rbp-0x18]
  806b14:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806b17:	89 c7                	mov    edi,eax
  806b19:	e8 28 00 00 00       	call   806b46 <draw_letter>
            tx+=size*font_width;
  806b1e:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  806b21:	8b 05 61 0a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20a61]        # 427588 <font_width>
  806b27:	0f af d0             	imul   edx,eax
  806b2a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806b2d:	01 d0                	add    eax,edx
  806b2f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        }
        str++;
  806b32:	48 83 45 d8 01       	add    QWORD PTR [rbp-0x28],0x1
    while(*str!='\0')
  806b37:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806b3b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806b3e:	84 c0                	test   al,al
  806b40:	75 9b                	jne    806add <draw_text+0x21>
    }
}
  806b42:	90                   	nop
  806b43:	90                   	nop
  806b44:	c9                   	leave  
  806b45:	c3                   	ret    

0000000000806b46 <draw_letter>:
void draw_letter(int x, volatile int y, int size, char c) {
  806b46:	f3 0f 1e fa          	endbr64 
  806b4a:	55                   	push   rbp
  806b4b:	48 89 e5             	mov    rbp,rsp
  806b4e:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
  806b51:	89 75 c8             	mov    DWORD PTR [rbp-0x38],esi
  806b54:	89 55 c4             	mov    DWORD PTR [rbp-0x3c],edx
  806b57:	89 c8                	mov    eax,ecx
  806b59:	88 45 c0             	mov    BYTE PTR [rbp-0x40],al
    u8 *glyph = glyph_table;
  806b5c:	48 8b 05 35 0a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20a35]        # 427598 <glyph_table>
  806b63:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if (c < glyph_nr) {
  806b67:	0f be 55 c0          	movsx  edx,BYTE PTR [rbp-0x40]
  806b6b:	8b 05 33 0a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20a33]        # 4275a4 <glyph_nr>
  806b71:	39 c2                	cmp    edx,eax
  806b73:	73 13                	jae    806b88 <draw_letter+0x42>
        glyph += c * bytes_per_glyph;
  806b75:	0f be 55 c0          	movsx  edx,BYTE PTR [rbp-0x40]
  806b79:	8b 05 21 0a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20a21]        # 4275a0 <bytes_per_glyph>
  806b7f:	0f af c2             	imul   eax,edx
  806b82:	89 c0                	mov    eax,eax
  806b84:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    }
    /* output the font to frame buffer */
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  806b88:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  806b8f:	e9 cb 00 00 00       	jmp    806c5f <draw_letter+0x119>
        u8 mask = 1 << 7;
  806b94:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80

        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  806b98:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  806b9f:	e9 9c 00 00 00       	jmp    806c40 <draw_letter+0xfa>
            int px=x+ch_x*size;
  806ba4:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  806ba7:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  806bab:	89 c2                	mov    edx,eax
  806bad:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  806bb0:	01 d0                	add    eax,edx
  806bb2:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            int py=y+ch_y*size;
  806bb5:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  806bb8:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  806bbc:	89 c2                	mov    edx,eax
  806bbe:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  806bc1:	01 d0                	add    eax,edx
  806bc3:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
            int* ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  806bc6:	8b 15 84 09 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20984]        # 427550 <framebuffer+0x10>
  806bcc:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806bcf:	0f af c2             	imul   eax,edx
  806bd2:	89 c1                	mov    ecx,eax
                     +px*framebuffer.common.framebuffer_bpp/8;
  806bd4:	0f b6 05 81 09 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20981]        # 42755c <framebuffer+0x1c>
  806bdb:	0f b6 c0             	movzx  eax,al
  806bde:	0f af 45 e8          	imul   eax,DWORD PTR [rbp-0x18]
  806be2:	8d 50 07             	lea    edx,[rax+0x7]
  806be5:	85 c0                	test   eax,eax
  806be7:	0f 48 c2             	cmovs  eax,edx
  806bea:	c1 f8 03             	sar    eax,0x3
  806bed:	48 98                	cdqe   
  806bef:	48 01 c8             	add    rax,rcx
  806bf2:	48 05 00 00 00 40    	add    rax,0x40000000
            int* ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  806bf8:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            if ((*(glyph + ch_x / 8) & mask) != 0) {
  806bfc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806bff:	c1 e8 03             	shr    eax,0x3
  806c02:	89 c2                	mov    edx,eax
  806c04:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806c08:	48 01 d0             	add    rax,rdx
  806c0b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806c0e:	22 45 f3             	and    al,BYTE PTR [rbp-0xd]
  806c11:	84 c0                	test   al,al
  806c13:	74 0c                	je     806c21 <draw_letter+0xdb>
                *ptr=-1;
  806c15:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806c19:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
  806c1f:	eb 0a                	jmp    806c2b <draw_letter+0xe5>
            } else {
                *ptr=0;
  806c21:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806c25:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            }

            mask >>= 1;
  806c2b:	d0 6d f3             	shr    BYTE PTR [rbp-0xd],1
            if (ch_x % 8 == 0) {
  806c2e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806c31:	83 e0 07             	and    eax,0x7
  806c34:	85 c0                	test   eax,eax
  806c36:	75 04                	jne    806c3c <draw_letter+0xf6>
                mask = 1 << 7;
  806c38:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80
        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  806c3c:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  806c40:	8b 05 42 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20942]        # 427588 <font_width>
  806c46:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  806c49:	0f 82 55 ff ff ff    	jb     806ba4 <draw_letter+0x5e>
            }
        }

        glyph += font_width_bytes;
  806c4f:	8b 05 3b 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2093b]        # 427590 <font_width_bytes>
  806c55:	89 c0                	mov    eax,eax
  806c57:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  806c5b:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  806c5f:	8b 05 27 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20927]        # 42758c <font_height>
  806c65:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  806c68:	0f 82 26 ff ff ff    	jb     806b94 <draw_letter+0x4e>
    }
}
  806c6e:	90                   	nop
  806c6f:	90                   	nop
  806c70:	5d                   	pop    rbp
  806c71:	c3                   	ret    

0000000000806c72 <scr_up>:
//向上滚动一个像素
void scr_up(){
  806c72:	f3 0f 1e fa          	endbr64 
  806c76:	55                   	push   rbp
  806c77:	48 89 e5             	mov    rbp,rsp
    for(int dy=0;dy<framebuffer.common.framebuffer_height-1;dy++){
  806c7a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  806c81:	eb 71                	jmp    806cf4 <scr_up+0x82>
        for(int dx=0;dx<framebuffer.common.framebuffer_width;dx++){
  806c83:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  806c8a:	eb 57                	jmp    806ce3 <scr_up+0x71>
            char *p=(char*)(FRAMEBUFFER_ADDR+
                    dy*framebuffer.common.framebuffer_pitch
  806c8c:	8b 15 be 08 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc208be]        # 427550 <framebuffer+0x10>
  806c92:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806c95:	0f af c2             	imul   eax,edx
  806c98:	89 c1                	mov    ecx,eax
                    +dx*framebuffer.common.framebuffer_bpp/8);
  806c9a:	0f b6 05 bb 08 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc208bb]        # 42755c <framebuffer+0x1c>
  806ca1:	0f b6 c0             	movzx  eax,al
  806ca4:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  806ca8:	8d 50 07             	lea    edx,[rax+0x7]
  806cab:	85 c0                	test   eax,eax
  806cad:	0f 48 c2             	cmovs  eax,edx
  806cb0:	c1 f8 03             	sar    eax,0x3
  806cb3:	48 98                	cdqe   
  806cb5:	48 01 c8             	add    rax,rcx
  806cb8:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+
  806cbe:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p+framebuffer.common.framebuffer_pitch);
  806cc2:	8b 05 88 08 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20888]        # 427550 <framebuffer+0x10>
  806cc8:	89 c2                	mov    edx,eax
  806cca:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806cce:	48 01 d0             	add    rax,rdx
  806cd1:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  806cd4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806cd8:	88 10                	mov    BYTE PTR [rax],dl
            p++;
  806cda:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        for(int dx=0;dx<framebuffer.common.framebuffer_width;dx++){
  806cdf:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806ce3:	8b 15 6b 08 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc2086b]        # 427554 <framebuffer+0x14>
  806ce9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806cec:	39 c2                	cmp    edx,eax
  806cee:	77 9c                	ja     806c8c <scr_up+0x1a>
    for(int dy=0;dy<framebuffer.common.framebuffer_height-1;dy++){
  806cf0:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806cf4:	8b 05 5e 08 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2085e]        # 427558 <framebuffer+0x18>
  806cfa:	8d 50 ff             	lea    edx,[rax-0x1]
  806cfd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806d00:	39 c2                	cmp    edx,eax
  806d02:	0f 87 7b ff ff ff    	ja     806c83 <scr_up+0x11>
        }

    }
//    for(int i=0;i< framebuffer.common.framebuffer_width*framebuffer.common.framebuffer_bpp/8;i++)
//        *(p++)=0;
}
  806d08:	90                   	nop
  806d09:	90                   	nop
  806d0a:	5d                   	pop    rbp
  806d0b:	c3                   	ret    

0000000000806d0c <scr_down>:
void scr_down(){
  806d0c:	f3 0f 1e fa          	endbr64 
  806d10:	55                   	push   rbp
  806d11:	48 89 e5             	mov    rbp,rsp
    for(int dy=1;dy<max_ch_nr_y;dy++){
  806d14:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
  806d1b:	eb 72                	jmp    806d8f <scr_down+0x83>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  806d1d:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  806d24:	eb 58                	jmp    806d7e <scr_down+0x72>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  806d26:	8b 15 24 08 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20824]        # 427550 <framebuffer+0x10>
  806d2c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806d2f:	0f af c2             	imul   eax,edx
  806d32:	89 c1                	mov    ecx,eax
                            +dx*framebuffer.common.framebuffer_bpp/8);
  806d34:	0f b6 05 21 08 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20821]        # 42755c <framebuffer+0x1c>
  806d3b:	0f b6 c0             	movzx  eax,al
  806d3e:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  806d42:	8d 50 07             	lea    edx,[rax+0x7]
  806d45:	85 c0                	test   eax,eax
  806d47:	0f 48 c2             	cmovs  eax,edx
  806d4a:	c1 f8 03             	sar    eax,0x3
  806d4d:	48 98                	cdqe   
  806d4f:	48 01 c8             	add    rax,rcx
  806d52:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  806d58:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p-framebuffer.common.framebuffer_pitch);
  806d5c:	8b 05 ee 07 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc207ee]        # 427550 <framebuffer+0x10>
  806d62:	89 c0                	mov    eax,eax
  806d64:	48 f7 d8             	neg    rax
  806d67:	48 89 c2             	mov    rdx,rax
  806d6a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806d6e:	48 01 d0             	add    rax,rdx
  806d71:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  806d74:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806d78:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  806d7a:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806d7e:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  806d81:	8b 05 ed 07 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc207ed]        # 427574 <max_ch_nr_x>
  806d87:	39 c2                	cmp    edx,eax
  806d89:	72 9b                	jb     806d26 <scr_down+0x1a>
    for(int dy=1;dy<max_ch_nr_y;dy++){
  806d8b:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806d8f:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  806d92:	8b 05 e0 07 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc207e0]        # 427578 <max_ch_nr_y>
  806d98:	39 c2                	cmp    edx,eax
  806d9a:	72 81                	jb     806d1d <scr_down+0x11>
        }

    }
}
  806d9c:	90                   	nop
  806d9d:	90                   	nop
  806d9e:	5d                   	pop    rbp
  806d9f:	c3                   	ret    

0000000000806da0 <print>:
void print(char* s){
  806da0:	f3 0f 1e fa          	endbr64 
  806da4:	55                   	push   rbp
  806da5:	48 89 e5             	mov    rbp,rsp
  806da8:	48 83 ec 08          	sub    rsp,0x8
  806dac:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    for(;*s;s++){
  806db0:	e9 c4 00 00 00       	jmp    806e79 <print+0xd9>
        if(fb_cursor_x>max_ch_nr_x||*s=='\n')
  806db5:	8b 15 b1 07 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc207b1]        # 42756c <fb_cursor_x>
  806dbb:	8b 05 b3 07 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc207b3]        # 427574 <max_ch_nr_x>
  806dc1:	39 c2                	cmp    edx,eax
  806dc3:	77 0b                	ja     806dd0 <print+0x30>
  806dc5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806dc9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806dcc:	3c 0a                	cmp    al,0xa
  806dce:	75 19                	jne    806de9 <print+0x49>
        {
            fb_cursor_y+=1;
  806dd0:	8b 05 9a 07 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2079a]        # 427570 <fb_cursor_y>
  806dd6:	83 c0 01             	add    eax,0x1
  806dd9:	89 05 91 07 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20791],eax        # 427570 <fb_cursor_y>
            fb_cursor_x=0;
  806ddf:	c7 05 83 07 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20783],0x0        # 42756c <fb_cursor_x>
  806de6:	00 00 00 
        }
        if(*s=='\n')continue;
  806de9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806ded:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806df0:	3c 0a                	cmp    al,0xa
  806df2:	74 7f                	je     806e73 <print+0xd3>
        if(fb_cursor_y>=max_ch_nr_y-1){
  806df4:	8b 05 7e 07 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2077e]        # 427578 <max_ch_nr_y>
  806dfa:	8d 50 ff             	lea    edx,[rax-0x1]
  806dfd:	8b 05 6d 07 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2076d]        # 427570 <fb_cursor_y>
  806e03:	39 c2                	cmp    edx,eax
  806e05:	77 0a                	ja     806e11 <print+0x71>
//            for(int i=0;i<font_height*font_size;i++)
////                scr_up();
////            fb_cursor_y=max_ch_nr_y-1;
            fb_cursor_y=0;
  806e07:	c7 05 5f 07 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc2075f],0x0        # 427570 <fb_cursor_y>
  806e0e:	00 00 00 
        }
        draw_letter(fb_cursor_x*font_width*font_size,fb_cursor_y*font_height*font_size,font_size,*s);
  806e11:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806e15:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806e18:	0f be d0             	movsx  edx,al
  806e1b:	8b 05 af 56 00 00    	mov    eax,DWORD PTR [rip+0x56af]        # 80c4d0 <font_size>
  806e21:	8b 35 49 07 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc20749]        # 427570 <fb_cursor_y>
  806e27:	8b 0d 5f 07 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc2075f]        # 42758c <font_height>
  806e2d:	0f af ce             	imul   ecx,esi
  806e30:	8b 35 9a 56 00 00    	mov    esi,DWORD PTR [rip+0x569a]        # 80c4d0 <font_size>
  806e36:	0f af ce             	imul   ecx,esi
  806e39:	41 89 c8             	mov    r8d,ecx
  806e3c:	8b 35 2a 07 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc2072a]        # 42756c <fb_cursor_x>
  806e42:	8b 0d 40 07 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc20740]        # 427588 <font_width>
  806e48:	0f af ce             	imul   ecx,esi
  806e4b:	8b 35 7f 56 00 00    	mov    esi,DWORD PTR [rip+0x567f]        # 80c4d0 <font_size>
  806e51:	0f af ce             	imul   ecx,esi
  806e54:	89 cf                	mov    edi,ecx
  806e56:	89 d1                	mov    ecx,edx
  806e58:	89 c2                	mov    edx,eax
  806e5a:	44 89 c6             	mov    esi,r8d
  806e5d:	e8 e4 fc ff ff       	call   806b46 <draw_letter>
        fb_cursor_x+=1;
  806e62:	8b 05 04 07 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20704]        # 42756c <fb_cursor_x>
  806e68:	83 c0 01             	add    eax,0x1
  806e6b:	89 05 fb 06 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc206fb],eax        # 42756c <fb_cursor_x>
  806e71:	eb 01                	jmp    806e74 <print+0xd4>
        if(*s=='\n')continue;
  806e73:	90                   	nop
    for(;*s;s++){
  806e74:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  806e79:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806e7d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806e80:	84 c0                	test   al,al
  806e82:	0f 85 2d ff ff ff    	jne    806db5 <print+0x15>
    }
}
  806e88:	90                   	nop
  806e89:	90                   	nop
  806e8a:	c9                   	leave  
  806e8b:	c3                   	ret    

0000000000806e8c <path_walk>:
#include "errno.h"
#include "memory.h"
#include "log.h"

struct dir_entry * path_walk(char * name,unsigned long flags)
{
  806e8c:	f3 0f 1e fa          	endbr64 
  806e90:	55                   	push   rbp
  806e91:	48 89 e5             	mov    rbp,rsp
  806e94:	48 83 ec 50          	sub    rsp,0x50
  806e98:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  806e9c:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
    char * tmpname = NULL;
  806ea0:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  806ea7:	00 
    int tmpnamelen = 0;
  806ea8:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    struct dir_entry * parent = root_sb->root;
  806eaf:	48 8b 05 f2 06 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc206f2]        # 4275a8 <root_sb>
  806eb6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806eb9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    struct dir_entry * path = NULL;
  806ebd:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  806ec4:	00 

    while(*name == '/')
  806ec5:	eb 05                	jmp    806ecc <path_walk+0x40>
        name++;
  806ec7:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
    while(*name == '/')
  806ecc:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806ed0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806ed3:	3c 2f                	cmp    al,0x2f
  806ed5:	74 f0                	je     806ec7 <path_walk+0x3b>

    if(!*name)
  806ed7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806edb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806ede:	84 c0                	test   al,al
  806ee0:	75 09                	jne    806eeb <path_walk+0x5f>
    {
        return parent;
  806ee2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806ee6:	e9 1b 02 00 00       	jmp    807106 <path_walk+0x27a>
    }

    for(;;)
    {
        tmpname = name;
  806eeb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806eef:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        while(*name && (*name != '/'))
  806ef3:	eb 05                	jmp    806efa <path_walk+0x6e>
            name++;
  806ef5:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
        while(*name && (*name != '/'))
  806efa:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806efe:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806f01:	84 c0                	test   al,al
  806f03:	74 0b                	je     806f10 <path_walk+0x84>
  806f05:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806f09:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806f0c:	3c 2f                	cmp    al,0x2f
  806f0e:	75 e5                	jne    806ef5 <path_walk+0x69>
        tmpnamelen = name - tmpname;
  806f10:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806f14:	48 2b 45 f0          	sub    rax,QWORD PTR [rbp-0x10]
  806f18:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

        path = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  806f1b:	be 00 00 00 00       	mov    esi,0x0
  806f20:	bf 48 00 00 00       	mov    edi,0x48
  806f25:	b8 00 00 00 00       	mov    eax,0x0
  806f2a:	e8 9b a3 ff ff       	call   8012ca <vmalloc>
  806f2f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        memset(path,0,sizeof(struct dir_entry));
  806f33:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806f37:	ba 48 00 00 00       	mov    edx,0x48
  806f3c:	be 00 00 00 00       	mov    esi,0x0
  806f41:	48 89 c7             	mov    rdi,rax
  806f44:	e8 07 4c 00 00       	call   80bb50 <memset>

        path->name = vmalloc(tmpnamelen+1,0);
  806f49:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806f4c:	83 c0 01             	add    eax,0x1
  806f4f:	be 00 00 00 00       	mov    esi,0x0
  806f54:	89 c7                	mov    edi,eax
  806f56:	b8 00 00 00 00       	mov    eax,0x0
  806f5b:	e8 6a a3 ff ff       	call   8012ca <vmalloc>
  806f60:	48 89 c2             	mov    rdx,rax
  806f63:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806f67:	48 89 10             	mov    QWORD PTR [rax],rdx
        memset(path->name,0,tmpnamelen+1);
  806f6a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806f6d:	83 c0 01             	add    eax,0x1
  806f70:	48 63 d0             	movsxd rdx,eax
  806f73:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806f77:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806f7a:	be 00 00 00 00       	mov    esi,0x0
  806f7f:	48 89 c7             	mov    rdi,rax
  806f82:	e8 c9 4b 00 00       	call   80bb50 <memset>
        memcpy(tmpname,path->name,tmpnamelen);
  806f87:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806f8a:	48 63 d0             	movsxd rdx,eax
  806f8d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806f91:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  806f94:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806f98:	48 89 ce             	mov    rsi,rcx
  806f9b:	48 89 c7             	mov    rdi,rax
  806f9e:	e8 fe 4a 00 00       	call   80baa1 <memcpy>
        path->name_length = tmpnamelen;
  806fa3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806fa7:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  806faa:	89 50 08             	mov    DWORD PTR [rax+0x8],edx

        if(parent->dir_inode->inode_ops->lookup(parent->dir_inode,path) == NULL)
  806fad:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806fb1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806fb5:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  806fb9:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  806fbd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806fc1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806fc5:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  806fc9:	48 89 d6             	mov    rsi,rdx
  806fcc:	48 89 c7             	mov    rdi,rax
  806fcf:	ff d1                	call   rcx
  806fd1:	48 85 c0             	test   rax,rax
  806fd4:	75 3e                	jne    807014 <path_walk+0x188>
        {
            printf("can not find file or dir:%s\n",path->name);
  806fd6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806fda:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806fdd:	48 89 c6             	mov    rsi,rax
  806fe0:	bf d7 40 81 00       	mov    edi,0x8140d7
  806fe5:	b8 00 00 00 00       	mov    eax,0x0
  806fea:	e8 49 9d ff ff       	call   800d38 <printf>
            vmfree(path->name);
  806fef:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806ff3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806ff6:	48 89 c7             	mov    rdi,rax
  806ff9:	e8 5b a3 ff ff       	call   801359 <vmfree>
            vmfree(path);
  806ffe:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807002:	48 89 c7             	mov    rdi,rax
  807005:	e8 4f a3 ff ff       	call   801359 <vmfree>
            return NULL;
  80700a:	b8 00 00 00 00       	mov    eax,0x0
  80700f:	e9 f2 00 00 00       	jmp    807106 <path_walk+0x27a>
        }

        list_init(&path->child_node);
  807014:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807018:	48 83 c0 10          	add    rax,0x10
  80701c:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    struct List * next;
};

__attribute__((always_inline)) inline void list_init(struct List * list)
{
    list->prev = list;
  807020:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807024:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  807028:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  80702b:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80702f:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  807033:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  807037:	90                   	nop
        list_init(&path->subdirs_list);
  807038:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80703c:	48 83 c0 20          	add    rax,0x20
  807040:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    list->prev = list;
  807044:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807048:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80704c:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  80704f:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807053:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  807057:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  80705b:	90                   	nop
        path->parent = parent;
  80705c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807060:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  807064:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
        list_add_to_behind(&parent->subdirs_list,&path->child_node);
  807068:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80706c:	48 83 c0 10          	add    rax,0x10
  807070:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  807074:	48 83 c2 20          	add    rdx,0x20
  807078:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  80707c:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

__attribute__((always_inline)) inline void list_add_to_behind(struct List * entry,struct List * new)	////add to entry behind
{
    new->next = entry->next;
  807080:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807084:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  807088:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80708c:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    new->prev = entry;
  807090:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807094:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  807098:	48 89 10             	mov    QWORD PTR [rax],rdx
    new->next->prev = new;
  80709b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80709f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8070a3:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8070a7:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  8070aa:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8070ae:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8070b2:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  8070b6:	90                   	nop

        if(!*name)
  8070b7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8070bb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8070be:	84 c0                	test   al,al
  8070c0:	74 2a                	je     8070ec <path_walk+0x260>
            goto last_component;
        while(*name == '/')
  8070c2:	eb 05                	jmp    8070c9 <path_walk+0x23d>
            name++;
  8070c4:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
        while(*name == '/')
  8070c9:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8070cd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8070d0:	3c 2f                	cmp    al,0x2f
  8070d2:	74 f0                	je     8070c4 <path_walk+0x238>
        if(!*name)
  8070d4:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8070d8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8070db:	84 c0                	test   al,al
  8070dd:	74 10                	je     8070ef <path_walk+0x263>
            goto last_slash;

        parent = path;
  8070df:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8070e3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    {
  8070e7:	e9 ff fd ff ff       	jmp    806eeb <path_walk+0x5f>
            goto last_component;
  8070ec:	90                   	nop
  8070ed:	eb 01                	jmp    8070f0 <path_walk+0x264>
            goto last_slash;
  8070ef:	90                   	nop
    }

    last_slash:
    last_component:

    if(flags & 1)
  8070f0:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8070f4:	83 e0 01             	and    eax,0x1
  8070f7:	48 85 c0             	test   rax,rax
  8070fa:	74 06                	je     807102 <path_walk+0x276>
    {
        return parent;
  8070fc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807100:	eb 04                	jmp    807106 <path_walk+0x27a>
    }

    return path;
  807102:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  807106:	c9                   	leave  
  807107:	c3                   	ret    

0000000000807108 <fill_dentry>:

int fill_dentry(void *buf,char *name, long namelen,long type,long offset)
{
  807108:	f3 0f 1e fa          	endbr64 
  80710c:	55                   	push   rbp
  80710d:	48 89 e5             	mov    rbp,rsp
  807110:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  807114:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  807118:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80711c:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  807120:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
//
//    memcpy(name,dent->d_name,namelen);
//    dent->d_namelen = namelen;
//    dent->d_type = type;
//    dent->d_offset = offset;
    return sizeof(struct dirent) + namelen;
  807124:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807128:	83 c0 18             	add    eax,0x18
}
  80712b:	5d                   	pop    rbp
  80712c:	c3                   	ret    

000000000080712d <mount_fs>:
//function mount_root
struct super_block * root_sb = NULL;
struct file_system_type filesystem = {"filesystem",0};

struct super_block* mount_fs(char * name,struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  80712d:	f3 0f 1e fa          	endbr64 
  807131:	55                   	push   rbp
  807132:	48 89 e5             	mov    rbp,rsp
  807135:	48 83 ec 30          	sub    rsp,0x30
  807139:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80713d:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  807141:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file_system_type * p = NULL;
  807145:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80714c:	00 

    for(p = &filesystem;p;p = p->next)
  80714d:	48 c7 45 f8 e0 c4 80 	mov    QWORD PTR [rbp-0x8],0x80c4e0
  807154:	00 
  807155:	eb 40                	jmp    807197 <mount_fs+0x6a>
        if(!strcmp(p->name,name))
  807157:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80715b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80715e:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  807162:	48 89 d6             	mov    rsi,rdx
  807165:	48 89 c7             	mov    rdi,rax
  807168:	e8 d2 4b 00 00       	call   80bd3f <strcmp>
  80716d:	85 c0                	test   eax,eax
  80716f:	75 1a                	jne    80718b <mount_fs+0x5e>
        {
            return p->read_superblock(DPTE,buf);
  807171:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807175:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  807179:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80717d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807181:	48 89 d6             	mov    rsi,rdx
  807184:	48 89 c7             	mov    rdi,rax
  807187:	ff d1                	call   rcx
  807189:	eb 18                	jmp    8071a3 <mount_fs+0x76>
    for(p = &filesystem;p;p = p->next)
  80718b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80718f:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807193:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  807197:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80719c:	75 b9                	jne    807157 <mount_fs+0x2a>
        }
    return 0;
  80719e:	b8 00 00 00 00       	mov    eax,0x0
}
  8071a3:	c9                   	leave  
  8071a4:	c3                   	ret    

00000000008071a5 <register_filesystem>:

unsigned long register_filesystem(struct file_system_type * fs)
{
  8071a5:	f3 0f 1e fa          	endbr64 
  8071a9:	55                   	push   rbp
  8071aa:	48 89 e5             	mov    rbp,rsp
  8071ad:	48 83 ec 20          	sub    rsp,0x20
  8071b1:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = NULL;
  8071b5:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8071bc:	00 

    for(p = &filesystem;p;p = p->next)
  8071bd:	48 c7 45 f8 e0 c4 80 	mov    QWORD PTR [rbp-0x8],0x80c4e0
  8071c4:	00 
  8071c5:	eb 30                	jmp    8071f7 <register_filesystem+0x52>
        if(!strcmp(fs->name,p->name))
  8071c7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8071cb:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8071ce:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8071d2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8071d5:	48 89 d6             	mov    rsi,rdx
  8071d8:	48 89 c7             	mov    rdi,rax
  8071db:	e8 5f 4b 00 00       	call   80bd3f <strcmp>
  8071e0:	85 c0                	test   eax,eax
  8071e2:	75 07                	jne    8071eb <register_filesystem+0x46>
            return 0;
  8071e4:	b8 00 00 00 00       	mov    eax,0x0
  8071e9:	eb 32                	jmp    80721d <register_filesystem+0x78>
    for(p = &filesystem;p;p = p->next)
  8071eb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8071ef:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8071f3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  8071f7:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8071fc:	75 c9                	jne    8071c7 <register_filesystem+0x22>

    fs->next = filesystem.next;
  8071fe:	48 8b 15 f3 52 00 00 	mov    rdx,QWORD PTR [rip+0x52f3]        # 80c4f8 <filesystem+0x18>
  807205:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807209:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    filesystem.next = fs;
  80720d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807211:	48 89 05 e0 52 00 00 	mov    QWORD PTR [rip+0x52e0],rax        # 80c4f8 <filesystem+0x18>

    return 1;
  807218:	b8 01 00 00 00       	mov    eax,0x1
}
  80721d:	c9                   	leave  
  80721e:	c3                   	ret    

000000000080721f <unregister_filesystem>:

unsigned long unregister_filesystem(struct file_system_type * fs)
{
  80721f:	f3 0f 1e fa          	endbr64 
  807223:	55                   	push   rbp
  807224:	48 89 e5             	mov    rbp,rsp
  807227:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = &filesystem;
  80722b:	48 c7 45 f8 e0 c4 80 	mov    QWORD PTR [rbp-0x8],0x80c4e0
  807232:	00 

    while(p->next)
  807233:	eb 41                	jmp    807276 <unregister_filesystem+0x57>
        if(p->next == fs)
  807235:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807239:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80723d:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  807241:	75 27                	jne    80726a <unregister_filesystem+0x4b>
        {
            p->next = p->next->next;
  807243:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807247:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80724b:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  80724f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807253:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
            fs->next = NULL;
  807257:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80725b:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  807262:	00 
            return 1;
  807263:	b8 01 00 00 00       	mov    eax,0x1
  807268:	eb 1e                	jmp    807288 <unregister_filesystem+0x69>
        }
        else
            p = p->next;
  80726a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80726e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807272:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p->next)
  807276:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80727a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80727e:	48 85 c0             	test   rax,rax
  807281:	75 b2                	jne    807235 <unregister_filesystem+0x16>
    return 0;
  807283:	b8 00 00 00 00       	mov    eax,0x0
}
  807288:	5d                   	pop    rbp
  807289:	c3                   	ret    

000000000080728a <sys_putstring>:
#include "syscall.h"
#include "int.h"


unsigned long sys_putstring(char *string)
{
  80728a:	f3 0f 1e fa          	endbr64 
  80728e:	55                   	push   rbp
  80728f:	48 89 e5             	mov    rbp,rsp
  807292:	48 83 ec 10          	sub    rsp,0x10
  807296:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    printf(string);
  80729a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80729e:	48 89 c7             	mov    rdi,rax
  8072a1:	b8 00 00 00 00       	mov    eax,0x0
  8072a6:	e8 8d 9a ff ff       	call   800d38 <printf>
    return 0;
  8072ab:	b8 00 00 00 00       	mov    eax,0x0
}
  8072b0:	c9                   	leave  
  8072b1:	c3                   	ret    

00000000008072b2 <sys_open>:

unsigned long sys_open(char *filename,int flags)
{
  8072b2:	f3 0f 1e fa          	endbr64 
  8072b6:	55                   	push   rbp
  8072b7:	48 89 e5             	mov    rbp,rsp
  8072ba:	48 83 ec 50          	sub    rsp,0x50
  8072be:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  8072c2:	89 75 b4             	mov    DWORD PTR [rbp-0x4c],esi
    char * path = NULL;
  8072c5:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  8072cc:	00 
    long pathlen = 0;
  8072cd:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  8072d4:	00 
    long error = 0;
  8072d5:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8072dc:	00 
    struct dir_entry * dentry = NULL;
  8072dd:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  8072e4:	00 
    struct file * filp = NULL;
  8072e5:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  8072ec:	00 
    struct file ** f = NULL;
  8072ed:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  8072f4:	00 
    int fd = -1;
  8072f5:	c7 45 f4 ff ff ff ff 	mov    DWORD PTR [rbp-0xc],0xffffffff
    int i;

//	printf("sys_open\n");
    path = (char *)vmalloc();
  8072fc:	b8 00 00 00 00       	mov    eax,0x0
  807301:	e8 c4 9f ff ff       	call   8012ca <vmalloc>
  807306:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    if(path == NULL)
  80730a:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  80730f:	75 0c                	jne    80731d <sys_open+0x6b>
        return -ENOMEM;
  807311:	48 c7 c0 cf ff ff ff 	mov    rax,0xffffffffffffffcf
  807318:	e9 aa 02 00 00       	jmp    8075c7 <sys_open+0x315>
    memset(path,0,PAGE_4K_SIZE);
  80731d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807321:	ba 00 10 00 00       	mov    edx,0x1000
  807326:	be 00 00 00 00       	mov    esi,0x0
  80732b:	48 89 c7             	mov    rdi,rax
  80732e:	e8 1d 48 00 00       	call   80bb50 <memset>
    pathlen = strlen(filename);
  807333:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807337:	48 89 c7             	mov    rdi,rax
  80733a:	e8 7f 4a 00 00       	call   80bdbe <strlen>
  80733f:	48 98                	cdqe   
  807341:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(pathlen <= 0)
  807345:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  80734a:	7f 18                	jg     807364 <sys_open+0xb2>
    {
        vmfree(path);
  80734c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807350:	48 89 c7             	mov    rdi,rax
  807353:	e8 01 a0 ff ff       	call   801359 <vmfree>
        return -EFAULT;
  807358:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  80735f:	e9 63 02 00 00       	jmp    8075c7 <sys_open+0x315>
    }
    else if(pathlen >= PAGE_4K_SIZE)
  807364:	48 81 7d e0 ff 0f 00 	cmp    QWORD PTR [rbp-0x20],0xfff
  80736b:	00 
  80736c:	7e 18                	jle    807386 <sys_open+0xd4>
    {
        vmfree(path);
  80736e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807372:	48 89 c7             	mov    rdi,rax
  807375:	e8 df 9f ff ff       	call   801359 <vmfree>
        return -ENAMETOOLONG;
  80737a:	48 c7 c0 db ff ff ff 	mov    rax,0xffffffffffffffdb
  807381:	e9 41 02 00 00       	jmp    8075c7 <sys_open+0x315>
    }
    strcpy(filename,path);
  807386:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80738a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80738e:	48 89 d6             	mov    rsi,rdx
  807391:	48 89 c7             	mov    rdi,rax
  807394:	e8 06 48 00 00       	call   80bb9f <strcpy>

    dentry = path_walk(path,0);
  807399:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80739d:	be 00 00 00 00       	mov    esi,0x0
  8073a2:	48 89 c7             	mov    rdi,rax
  8073a5:	e8 e2 fa ff ff       	call   806e8c <path_walk>
  8073aa:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    vmfree(path);
  8073ae:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8073b2:	48 89 c7             	mov    rdi,rax
  8073b5:	e8 9f 9f ff ff       	call   801359 <vmfree>

    if(dentry == NULL)
  8073ba:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  8073bf:	75 0c                	jne    8073cd <sys_open+0x11b>
        return -ENOENT;
  8073c1:	48 c7 c0 d3 ff ff ff 	mov    rax,0xffffffffffffffd3
  8073c8:	e9 fa 01 00 00       	jmp    8075c7 <sys_open+0x315>

    if((flags & O_DIRECTORY) && (dentry->dir_inode->attribute != FS_ATTR_DIR))
  8073cd:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8073d0:	25 00 40 00 00       	and    eax,0x4000
  8073d5:	85 c0                	test   eax,eax
  8073d7:	74 1e                	je     8073f7 <sys_open+0x145>
  8073d9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8073dd:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8073e1:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8073e5:	48 83 f8 02          	cmp    rax,0x2
  8073e9:	74 0c                	je     8073f7 <sys_open+0x145>
        return -ENOTDIR;
  8073eb:	48 c7 c0 c7 ff ff ff 	mov    rax,0xffffffffffffffc7
  8073f2:	e9 d0 01 00 00       	jmp    8075c7 <sys_open+0x315>
    if(!(flags & O_DIRECTORY) && (dentry->dir_inode->attribute == FS_ATTR_DIR))
  8073f7:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8073fa:	25 00 40 00 00       	and    eax,0x4000
  8073ff:	85 c0                	test   eax,eax
  807401:	75 1e                	jne    807421 <sys_open+0x16f>
  807403:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807407:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80740b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80740f:	48 83 f8 02          	cmp    rax,0x2
  807413:	75 0c                	jne    807421 <sys_open+0x16f>
        return -EISDIR;
  807415:	48 c7 c0 e1 ff ff ff 	mov    rax,0xffffffffffffffe1
  80741c:	e9 a6 01 00 00       	jmp    8075c7 <sys_open+0x315>

    filp = (struct file *)vmalloc();
  807421:	b8 00 00 00 00       	mov    eax,0x0
  807426:	e8 9f 9e ff ff       	call   8012ca <vmalloc>
  80742b:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    memset(filp,0,sizeof(struct file));
  80742f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807433:	ba 28 00 00 00       	mov    edx,0x28
  807438:	be 00 00 00 00       	mov    esi,0x0
  80743d:	48 89 c7             	mov    rdi,rax
  807440:	e8 0b 47 00 00       	call   80bb50 <memset>
    filp->dentry = dentry;
  807445:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807449:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80744d:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    filp->mode = flags;
  807451:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  807454:	48 63 d0             	movsxd rdx,eax
  807457:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80745b:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx

    if(dentry->dir_inode->attribute & FS_ATTR_DEVICE)
  80745f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807463:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807467:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80746b:	83 e0 04             	and    eax,0x4
  80746e:	48 85 c0             	test   rax,rax
  807471:	74 0e                	je     807481 <sys_open+0x1cf>
        filp->f_ops = NULL;//&keyboard_fops;	//////	find device file operation function
  807473:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807477:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  80747e:	00 
  80747f:	eb 14                	jmp    807495 <sys_open+0x1e3>
    else
        filp->f_ops = dentry->dir_inode->f_ops;
  807481:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807485:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807489:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  80748d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807491:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    if(filp->f_ops && filp->f_ops->open)
  807495:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807499:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80749d:	48 85 c0             	test   rax,rax
  8074a0:	74 33                	je     8074d5 <sys_open+0x223>
  8074a2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8074a6:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8074aa:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8074ad:	48 85 c0             	test   rax,rax
  8074b0:	74 23                	je     8074d5 <sys_open+0x223>
        error = filp->f_ops->open(dentry->dir_inode,filp);
  8074b2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8074b6:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8074ba:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8074bd:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8074c1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8074c5:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8074c9:	48 89 d6             	mov    rsi,rdx
  8074cc:	48 89 c7             	mov    rdi,rax
  8074cf:	ff d1                	call   rcx
  8074d1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(error != 1)
  8074d5:	48 83 7d f8 01       	cmp    QWORD PTR [rbp-0x8],0x1
  8074da:	74 18                	je     8074f4 <sys_open+0x242>
    {
        vmfree(filp);
  8074dc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8074e0:	48 89 c7             	mov    rdi,rax
  8074e3:	e8 71 9e ff ff       	call   801359 <vmfree>
        return -EFAULT;
  8074e8:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  8074ef:	e9 d3 00 00 00       	jmp    8075c7 <sys_open+0x315>
    }

    if(filp->mode & O_TRUNC)
  8074f4:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8074f8:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8074fc:	25 00 02 00 00       	and    eax,0x200
  807501:	48 85 c0             	test   rax,rax
  807504:	74 13                	je     807519 <sys_open+0x267>
    {
        filp->dentry->dir_inode->file_size = 0;
  807506:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80750a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80750e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807512:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }
    if(filp->mode & O_APPEND)
  807519:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80751d:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  807521:	25 00 04 00 00       	and    eax,0x400
  807526:	48 85 c0             	test   rax,rax
  807529:	74 19                	je     807544 <sys_open+0x292>
    {
        filp->position = filp->dentry->dir_inode->file_size;
  80752b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80752f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807533:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807537:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80753a:	48 89 c2             	mov    rdx,rax
  80753d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807541:	48 89 10             	mov    QWORD PTR [rax],rdx
    }

    f = current->openf;
  807544:	48 8b 05 55 cf c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0cf55]        # 4144a0 <current>
  80754b:	48 05 c4 00 00 00    	add    rax,0xc4
  807551:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    for(i = 0;i < MAX_TASKS;i++)
  807555:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80755c:	eb 28                	jmp    807586 <sys_open+0x2d4>
        if(f[i] == NULL)
  80755e:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  807561:	48 98                	cdqe   
  807563:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80756a:	00 
  80756b:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80756f:	48 01 d0             	add    rax,rdx
  807572:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807575:	48 85 c0             	test   rax,rax
  807578:	75 08                	jne    807582 <sys_open+0x2d0>
        {
            fd = i;
  80757a:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80757d:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            break;
  807580:	eb 0a                	jmp    80758c <sys_open+0x2da>
    for(i = 0;i < MAX_TASKS;i++)
  807582:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  807586:	83 7d f0 1f          	cmp    DWORD PTR [rbp-0x10],0x1f
  80758a:	7e d2                	jle    80755e <sys_open+0x2ac>
        }
    if(i == MAX_TASKS)
  80758c:	83 7d f0 20          	cmp    DWORD PTR [rbp-0x10],0x20
  807590:	75 15                	jne    8075a7 <sys_open+0x2f5>
    {
        vmfree(filp);
  807592:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807596:	48 89 c7             	mov    rdi,rax
  807599:	e8 bb 9d ff ff       	call   801359 <vmfree>
        //// reclaim struct index_node & struct dir_entry
        return -EMFILE;
  80759e:	48 c7 c0 df ff ff ff 	mov    rax,0xffffffffffffffdf
  8075a5:	eb 20                	jmp    8075c7 <sys_open+0x315>
    }
    f[fd] = filp;
  8075a7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8075aa:	48 98                	cdqe   
  8075ac:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8075b3:	00 
  8075b4:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8075b8:	48 01 c2             	add    rdx,rax
  8075bb:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8075bf:	48 89 02             	mov    QWORD PTR [rdx],rax

    return fd;
  8075c2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8075c5:	48 98                	cdqe   
}
  8075c7:	c9                   	leave  
  8075c8:	c3                   	ret    

00000000008075c9 <sys_close>:

unsigned long sys_close(int fd)
{
  8075c9:	f3 0f 1e fa          	endbr64 
  8075cd:	55                   	push   rbp
  8075ce:	48 89 e5             	mov    rbp,rsp
  8075d1:	48 83 ec 20          	sub    rsp,0x20
  8075d5:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    struct file * filp = NULL;
  8075d8:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8075df:	00 

//	printf("sys_close:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  8075e0:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8075e4:	78 06                	js     8075ec <sys_close+0x23>
  8075e6:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  8075ea:	7e 0c                	jle    8075f8 <sys_close+0x2f>
        return -EBADF;
  8075ec:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  8075f3:	e9 87 00 00 00       	jmp    80767f <sys_close+0xb6>

    filp = current->openf[fd];
  8075f8:	48 8b 05 a1 ce c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0cea1]        # 4144a0 <current>
  8075ff:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807602:	48 63 d2             	movsxd rdx,edx
  807605:	48 83 c2 18          	add    rdx,0x18
  807609:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  80760e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(filp->f_ops && filp->f_ops->close)
  807612:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807616:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80761a:	48 85 c0             	test   rax,rax
  80761d:	74 35                	je     807654 <sys_close+0x8b>
  80761f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807623:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807627:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80762b:	48 85 c0             	test   rax,rax
  80762e:	74 24                	je     807654 <sys_close+0x8b>
        filp->f_ops->close(filp->dentry->dir_inode,filp);
  807630:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807634:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807638:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  80763c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807640:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807644:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807648:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80764c:	48 89 d6             	mov    rsi,rdx
  80764f:	48 89 c7             	mov    rdi,rax
  807652:	ff d1                	call   rcx

    vmfree(filp);
  807654:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807658:	48 89 c7             	mov    rdi,rax
  80765b:	e8 f9 9c ff ff       	call   801359 <vmfree>
    current->openf[fd] = NULL;
  807660:	48 8b 05 39 ce c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ce39]        # 4144a0 <current>
  807667:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80766a:	48 63 d2             	movsxd rdx,edx
  80766d:	48 83 c2 18          	add    rdx,0x18
  807671:	48 c7 44 d0 04 00 00 	mov    QWORD PTR [rax+rdx*8+0x4],0x0
  807678:	00 00 

    return 0;
  80767a:	b8 00 00 00 00       	mov    eax,0x0
}
  80767f:	c9                   	leave  
  807680:	c3                   	ret    

0000000000807681 <sys_read>:

unsigned long sys_read(int fd,void * buf,long count)
{
  807681:	f3 0f 1e fa          	endbr64 
  807685:	55                   	push   rbp
  807686:	48 89 e5             	mov    rbp,rsp
  807689:	48 83 ec 30          	sub    rsp,0x30
  80768d:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  807690:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  807694:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  807698:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80769f:	00 
    unsigned long ret = 0;
  8076a0:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8076a7:	00 

//	printf("sys_read:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  8076a8:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8076ac:	78 06                	js     8076b4 <sys_read+0x33>
  8076ae:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  8076b2:	7e 09                	jle    8076bd <sys_read+0x3c>
        return -EBADF;
  8076b4:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  8076bb:	eb 72                	jmp    80772f <sys_read+0xae>
    if(count < 0)
  8076bd:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  8076c2:	79 09                	jns    8076cd <sys_read+0x4c>
        return -EINVAL;
  8076c4:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  8076cb:	eb 62                	jmp    80772f <sys_read+0xae>

    filp = current->openf[fd];
  8076cd:	48 8b 05 cc cd c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0cdcc]        # 4144a0 <current>
  8076d4:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8076d7:	48 63 d2             	movsxd rdx,edx
  8076da:	48 83 c2 18          	add    rdx,0x18
  8076de:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  8076e3:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->read)
  8076e7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8076eb:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8076ef:	48 85 c0             	test   rax,rax
  8076f2:	74 37                	je     80772b <sys_read+0xaa>
  8076f4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8076f8:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8076fc:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807700:	48 85 c0             	test   rax,rax
  807703:	74 26                	je     80772b <sys_read+0xaa>
        ret = filp->f_ops->read(filp,buf,count,&filp->position);
  807705:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807709:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80770d:	4c 8b 40 10          	mov    r8,QWORD PTR [rax+0x10]
  807711:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  807715:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  807719:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  80771d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807721:	48 89 c7             	mov    rdi,rax
  807724:	41 ff d0             	call   r8
  807727:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  80772b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80772f:	c9                   	leave  
  807730:	c3                   	ret    

0000000000807731 <sys_write>:

unsigned long sys_write(int fd,void * buf,long count)
{
  807731:	f3 0f 1e fa          	endbr64 
  807735:	55                   	push   rbp
  807736:	48 89 e5             	mov    rbp,rsp
  807739:	48 83 ec 30          	sub    rsp,0x30
  80773d:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  807740:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  807744:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  807748:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80774f:	00 
    unsigned long ret = 0;
  807750:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807757:	00 

//	printf("sys_write:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  807758:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80775c:	78 06                	js     807764 <sys_write+0x33>
  80775e:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  807762:	7e 09                	jle    80776d <sys_write+0x3c>
        return -EBADF;
  807764:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  80776b:	eb 72                	jmp    8077df <sys_write+0xae>
    if(count < 0)
  80776d:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  807772:	79 09                	jns    80777d <sys_write+0x4c>
        return -EINVAL;
  807774:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  80777b:	eb 62                	jmp    8077df <sys_write+0xae>

    filp = current->openf[fd];
  80777d:	48 8b 05 1c cd c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0cd1c]        # 4144a0 <current>
  807784:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807787:	48 63 d2             	movsxd rdx,edx
  80778a:	48 83 c2 18          	add    rdx,0x18
  80778e:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  807793:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->write)
  807797:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80779b:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80779f:	48 85 c0             	test   rax,rax
  8077a2:	74 37                	je     8077db <sys_write+0xaa>
  8077a4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8077a8:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8077ac:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8077b0:	48 85 c0             	test   rax,rax
  8077b3:	74 26                	je     8077db <sys_write+0xaa>
        ret = filp->f_ops->write(filp,buf,count,&filp->position);
  8077b5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8077b9:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8077bd:	4c 8b 40 18          	mov    r8,QWORD PTR [rax+0x18]
  8077c1:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  8077c5:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8077c9:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  8077cd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8077d1:	48 89 c7             	mov    rdi,rax
  8077d4:	41 ff d0             	call   r8
  8077d7:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  8077db:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  8077df:	c9                   	leave  
  8077e0:	c3                   	ret    

00000000008077e1 <sys_lseek>:


unsigned long sys_lseek(int filds,long offset,int whence)
{
  8077e1:	f3 0f 1e fa          	endbr64 
  8077e5:	55                   	push   rbp
  8077e6:	48 89 e5             	mov    rbp,rsp
  8077e9:	48 83 ec 20          	sub    rsp,0x20
  8077ed:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8077f0:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8077f4:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    struct file * filp = NULL;
  8077f7:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8077fe:	00 
    unsigned long ret = 0;
  8077ff:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807806:	00 

//	printf("sys_lseek:%d\n",filds);
    if(filds < 0 || filds >= MAX_TASKS)
  807807:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80780b:	78 06                	js     807813 <sys_lseek+0x32>
  80780d:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  807811:	7e 09                	jle    80781c <sys_lseek+0x3b>
        return -EBADF;
  807813:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  80781a:	eb 78                	jmp    807894 <sys_lseek+0xb3>
    if(whence < 0 || whence >= SEEK_MAX)
  80781c:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  807820:	78 06                	js     807828 <sys_lseek+0x47>
  807822:	83 7d e8 02          	cmp    DWORD PTR [rbp-0x18],0x2
  807826:	7e 09                	jle    807831 <sys_lseek+0x50>
        return -EINVAL;
  807828:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  80782f:	eb 63                	jmp    807894 <sys_lseek+0xb3>

    filp = current->openf[filds];
  807831:	48 8b 05 68 cc c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0cc68]        # 4144a0 <current>
  807838:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80783b:	48 63 d2             	movsxd rdx,edx
  80783e:	48 83 c2 18          	add    rdx,0x18
  807842:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  807847:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->lseek)
  80784b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80784f:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807853:	48 85 c0             	test   rax,rax
  807856:	74 38                	je     807890 <sys_lseek+0xaf>
  807858:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80785c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807860:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  807864:	48 85 c0             	test   rax,rax
  807867:	74 27                	je     807890 <sys_lseek+0xaf>
        ret = filp->f_ops->lseek(filp,offset,whence);
  807869:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80786d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807871:	4c 8b 40 20          	mov    r8,QWORD PTR [rax+0x20]
  807875:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807878:	48 63 d0             	movsxd rdx,eax
  80787b:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  80787f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807883:	48 89 ce             	mov    rsi,rcx
  807886:	48 89 c7             	mov    rdi,rax
  807889:	41 ff d0             	call   r8
  80788c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  807890:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  807894:	c9                   	leave  
  807895:	c3                   	ret    

0000000000807896 <sys_vfork>:
//    printf("sys_fork\n");
//    //return do_fork(regs,0,regs->rsp,0);
//}

unsigned long sys_vfork()
{
  807896:	f3 0f 1e fa          	endbr64 
  80789a:	55                   	push   rbp
  80789b:	48 89 e5             	mov    rbp,rsp
  80789e:	48 83 ec 10          	sub    rsp,0x10
    regs_t *regs = (regs_t *)current->tss.rsp0 -1;
  8078a2:	48 8b 05 f7 cb c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0cbf7]        # 4144a0 <current>
  8078a9:	48 8b 80 c8 01 00 00 	mov    rax,QWORD PTR [rax+0x1c8]
  8078b0:	48 2d d0 00 00 00    	sub    rax,0xd0
  8078b6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    printf("sys_vfork\n");
  8078ba:	bf 00 41 81 00       	mov    edi,0x814100
  8078bf:	b8 00 00 00 00       	mov    eax,0x0
  8078c4:	e8 6f 94 ff ff       	call   800d38 <printf>
    //return do_fork(regs,CLONE_VM | CLONE_FS | CLONE_SIGNAL,regs->rsp,0);
}
  8078c9:	90                   	nop
  8078ca:	c9                   	leave  
  8078cb:	c3                   	ret    

00000000008078cc <sys_wait4>:
/*
	rusage reserved
*/

unsigned long sys_wait4(unsigned long pid,int *status,int options,void *rusage)
{
  8078cc:	f3 0f 1e fa          	endbr64 
  8078d0:	55                   	push   rbp
  8078d1:	48 89 e5             	mov    rbp,rsp
  8078d4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8078d8:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8078dc:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  8078df:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
//    copy_to_user(&child->exit_code,status,sizeof(long));
//    tsk->next = child->next;
//    exit_mm(child);
//    vmfree(child);
//    return retval;
}
  8078e3:	90                   	nop
  8078e4:	5d                   	pop    rbp
  8078e5:	c3                   	ret    

00000000008078e6 <sys_brk>:

unsigned long sys_brk(unsigned long brk)
{
  8078e6:	f3 0f 1e fa          	endbr64 
  8078ea:	55                   	push   rbp
  8078eb:	48 89 e5             	mov    rbp,rsp
  8078ee:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//
//    new_brk = do_brk(current->mm->end_brk,new_brk - current->mm->end_brk);	//expand brk space
//
//    current->mm->end_brk = new_brk;
//    return new_brk;
}
  8078f2:	90                   	nop
  8078f3:	5d                   	pop    rbp
  8078f4:	c3                   	ret    

00000000008078f5 <sys_reboot>:

unsigned long sys_reboot(unsigned long cmd,void * arg)
{
  8078f5:	f3 0f 1e fa          	endbr64 
  8078f9:	55                   	push   rbp
  8078fa:	48 89 e5             	mov    rbp,rsp
  8078fd:	48 83 ec 10          	sub    rsp,0x10
  807901:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  807905:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    printf("sys_reboot\n");
  807909:	bf 0b 41 81 00       	mov    edi,0x81410b
  80790e:	b8 00 00 00 00       	mov    eax,0x0
  807913:	e8 20 94 ff ff       	call   800d38 <printf>
    switch(cmd)
  807918:	48 83 7d f8 01       	cmp    QWORD PTR [rbp-0x8],0x1
  80791d:	74 09                	je     807928 <sys_reboot+0x33>
  80791f:	48 83 7d f8 02       	cmp    QWORD PTR [rbp-0x8],0x2
  807924:	74 13                	je     807939 <sys_reboot+0x44>
  807926:	eb 22                	jmp    80794a <sys_reboot+0x55>
    {
        case SYSTEM_REBOOT:
            outb(0x64,0xFE);
  807928:	be fe 00 00 00       	mov    esi,0xfe
  80792d:	bf 64 00 00 00       	mov    edi,0x64
  807932:	e8 09 e1 ff ff       	call   805a40 <outb>
            break;
  807937:	eb 21                	jmp    80795a <sys_reboot+0x65>

        case SYSTEM_POWEROFF:
            printf("sys_reboot cmd SYSTEM_POWEROFF\n");
  807939:	bf 18 41 81 00       	mov    edi,0x814118
  80793e:	b8 00 00 00 00       	mov    eax,0x0
  807943:	e8 f0 93 ff ff       	call   800d38 <printf>
            break;
  807948:	eb 10                	jmp    80795a <sys_reboot+0x65>

        default:
            printf("sys_reboot cmd ERROR!\n");
  80794a:	bf 38 41 81 00       	mov    edi,0x814138
  80794f:	b8 00 00 00 00       	mov    eax,0x0
  807954:	e8 df 93 ff ff       	call   800d38 <printf>
            break;
  807959:	90                   	nop
    }
    return 0;
  80795a:	b8 00 00 00 00       	mov    eax,0x0
}
  80795f:	c9                   	leave  
  807960:	c3                   	ret    

0000000000807961 <sys_chdir>:


unsigned long sys_chdir(char *filename)
{
  807961:	f3 0f 1e fa          	endbr64 
  807965:	55                   	push   rbp
  807966:	48 89 e5             	mov    rbp,rsp
  807969:	48 83 ec 30          	sub    rsp,0x30
  80796d:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char * path = NULL;
  807971:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807978:	00 
    long pathlen = 0;
  807979:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  807980:	00 
    struct dir_entry * dentry = NULL;
  807981:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  807988:	00 

    printf("sys_chdir\n");
  807989:	bf 4f 41 81 00       	mov    edi,0x81414f
  80798e:	b8 00 00 00 00       	mov    eax,0x0
  807993:	e8 a0 93 ff ff       	call   800d38 <printf>
    path = (char *)vmalloc();
  807998:	b8 00 00 00 00       	mov    eax,0x0
  80799d:	e8 28 99 ff ff       	call   8012ca <vmalloc>
  8079a2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    if(path == NULL)
  8079a6:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8079ab:	75 0c                	jne    8079b9 <sys_chdir+0x58>
        return -ENOMEM;
  8079ad:	48 c7 c0 cf ff ff ff 	mov    rax,0xffffffffffffffcf
  8079b4:	e9 ca 00 00 00       	jmp    807a83 <sys_chdir+0x122>
    memset(path,0,PAGE_4K_SIZE);
  8079b9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8079bd:	ba 00 10 00 00       	mov    edx,0x1000
  8079c2:	be 00 00 00 00       	mov    esi,0x0
  8079c7:	48 89 c7             	mov    rdi,rax
  8079ca:	e8 81 41 00 00       	call   80bb50 <memset>
    pathlen = strlen(filename);
  8079cf:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8079d3:	48 89 c7             	mov    rdi,rax
  8079d6:	e8 e3 43 00 00       	call   80bdbe <strlen>
  8079db:	48 98                	cdqe   
  8079dd:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(pathlen <= 0)
  8079e1:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  8079e6:	7f 18                	jg     807a00 <sys_chdir+0x9f>
    {
        vmfree(path);
  8079e8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8079ec:	48 89 c7             	mov    rdi,rax
  8079ef:	e8 65 99 ff ff       	call   801359 <vmfree>
        return -EFAULT;
  8079f4:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  8079fb:	e9 83 00 00 00       	jmp    807a83 <sys_chdir+0x122>
    }
    else if(pathlen >= PAGE_4K_SIZE)
  807a00:	48 81 7d f0 ff 0f 00 	cmp    QWORD PTR [rbp-0x10],0xfff
  807a07:	00 
  807a08:	7e 15                	jle    807a1f <sys_chdir+0xbe>
    {
        vmfree(path);
  807a0a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807a0e:	48 89 c7             	mov    rdi,rax
  807a11:	e8 43 99 ff ff       	call   801359 <vmfree>
        return -ENAMETOOLONG;
  807a16:	48 c7 c0 db ff ff ff 	mov    rax,0xffffffffffffffdb
  807a1d:	eb 64                	jmp    807a83 <sys_chdir+0x122>
    }
    strcpy(filename,path);
  807a1f:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  807a23:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807a27:	48 89 d6             	mov    rsi,rdx
  807a2a:	48 89 c7             	mov    rdi,rax
  807a2d:	e8 6d 41 00 00       	call   80bb9f <strcpy>

    dentry = path_walk(path,0);
  807a32:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807a36:	be 00 00 00 00       	mov    esi,0x0
  807a3b:	48 89 c7             	mov    rdi,rax
  807a3e:	e8 49 f4 ff ff       	call   806e8c <path_walk>
  807a43:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    vmfree(path);
  807a47:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807a4b:	48 89 c7             	mov    rdi,rax
  807a4e:	e8 06 99 ff ff       	call   801359 <vmfree>

    if(dentry == NULL)
  807a53:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  807a58:	75 09                	jne    807a63 <sys_chdir+0x102>
        return -ENOENT;
  807a5a:	48 c7 c0 d3 ff ff ff 	mov    rax,0xffffffffffffffd3
  807a61:	eb 20                	jmp    807a83 <sys_chdir+0x122>
    if(dentry->dir_inode->attribute != FS_ATTR_DIR)
  807a63:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807a67:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807a6b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807a6f:	48 83 f8 02          	cmp    rax,0x2
  807a73:	74 09                	je     807a7e <sys_chdir+0x11d>
        return -ENOTDIR;
  807a75:	48 c7 c0 c7 ff ff ff 	mov    rax,0xffffffffffffffc7
  807a7c:	eb 05                	jmp    807a83 <sys_chdir+0x122>
    return 0;
  807a7e:	b8 00 00 00 00       	mov    eax,0x0
}
  807a83:	c9                   	leave  
  807a84:	c3                   	ret    

0000000000807a85 <sys_getdents>:

unsigned long sys_getdents(int fd, void * dirent, long count)
{
  807a85:	f3 0f 1e fa          	endbr64 
  807a89:	55                   	push   rbp
  807a8a:	48 89 e5             	mov    rbp,rsp
  807a8d:	48 83 ec 30          	sub    rsp,0x30
  807a91:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  807a94:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  807a98:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  807a9c:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  807aa3:	00 
    unsigned long ret = 0;
  807aa4:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807aab:	00 

//	printf("sys_getdents:%d\n",fd);
    if(fd < 0 || fd > MAX_TASKS)
  807aac:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  807ab0:	78 06                	js     807ab8 <sys_getdents+0x33>
  807ab2:	83 7d ec 20          	cmp    DWORD PTR [rbp-0x14],0x20
  807ab6:	7e 09                	jle    807ac1 <sys_getdents+0x3c>
        return -EBADF;
  807ab8:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  807abf:	eb 72                	jmp    807b33 <sys_getdents+0xae>
    if(count < 0)
  807ac1:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  807ac6:	79 09                	jns    807ad1 <sys_getdents+0x4c>
        return -EINVAL;
  807ac8:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  807acf:	eb 62                	jmp    807b33 <sys_getdents+0xae>

    filp = current->openf[fd];
  807ad1:	48 8b 05 c8 c9 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c9c8]        # 4144a0 <current>
  807ad8:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807adb:	48 63 d2             	movsxd rdx,edx
  807ade:	48 83 c2 18          	add    rdx,0x18
  807ae2:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  807ae7:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->readdir)
  807aeb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807aef:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807af3:	48 85 c0             	test   rax,rax
  807af6:	74 37                	je     807b2f <sys_getdents+0xaa>
  807af8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807afc:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807b00:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807b04:	48 85 c0             	test   rax,rax
  807b07:	74 26                	je     807b2f <sys_getdents+0xaa>
        ret = filp->f_ops->readdir(filp,dirent,&fill_dentry);
  807b09:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807b0d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807b11:	4c 8b 40 30          	mov    r8,QWORD PTR [rax+0x30]
  807b15:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  807b19:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807b1d:	ba 08 71 80 00       	mov    edx,0x807108
  807b22:	48 89 ce             	mov    rsi,rcx
  807b25:	48 89 c7             	mov    rdi,rax
  807b28:	41 ff d0             	call   r8
  807b2b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  807b2f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  807b33:	c9                   	leave  
  807b34:	c3                   	ret    

0000000000807b35 <shift>:
/* 0x5D - Apps      */ {  0,        0,       0x5D,      0x5D }
        };
char k_shift=0,k_ctrl=0,k_capslock=0;

void shift()
{
  807b35:	f3 0f 1e fa          	endbr64 
  807b39:	55                   	push   rbp
  807b3a:	48 89 e5             	mov    rbp,rsp
    k_shift=!k_shift;
  807b3d:	0f b6 05 89 fc c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fc89]        # 4277cd <k_shift>
  807b44:	84 c0                	test   al,al
  807b46:	0f 94 c0             	sete   al
  807b49:	88 05 7e fc c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1fc7e],al        # 4277cd <k_shift>
}
  807b4f:	90                   	nop
  807b50:	5d                   	pop    rbp
  807b51:	c3                   	ret    

0000000000807b52 <ctrl>:
void ctrl()
{
  807b52:	f3 0f 1e fa          	endbr64 
  807b56:	55                   	push   rbp
  807b57:	48 89 e5             	mov    rbp,rsp
    k_ctrl=!k_ctrl;
  807b5a:	0f b6 05 6d fc c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fc6d]        # 4277ce <k_ctrl>
  807b61:	84 c0                	test   al,al
  807b63:	0f 94 c0             	sete   al
  807b66:	88 05 62 fc c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1fc62],al        # 4277ce <k_ctrl>
}
  807b6c:	90                   	nop
  807b6d:	5d                   	pop    rbp
  807b6e:	c3                   	ret    

0000000000807b6f <capslock>:
void capslock()
{
  807b6f:	f3 0f 1e fa          	endbr64 
  807b73:	55                   	push   rbp
  807b74:	48 89 e5             	mov    rbp,rsp
    k_capslock=k_capslock==0?1:0;
  807b77:	0f b6 05 51 fc c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fc51]        # 4277cf <k_capslock>
  807b7e:	84 c0                	test   al,al
  807b80:	0f 94 c0             	sete   al
  807b83:	88 05 46 fc c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1fc46],al        # 4277cf <k_capslock>
}
  807b89:	90                   	nop
  807b8a:	5d                   	pop    rbp
  807b8b:	c3                   	ret    

0000000000807b8c <to_ascii>:
char to_ascii(char scan_code)
{
  807b8c:	f3 0f 1e fa          	endbr64 
  807b90:	55                   	push   rbp
  807b91:	48 89 e5             	mov    rbp,rsp
  807b94:	89 f8                	mov    eax,edi
  807b96:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  807b99:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  807ba0:	e9 c7 00 00 00       	jmp    807c6c <to_ascii+0xe0>
        if(key_map[i].scan_code==scan_code)
  807ba5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807ba8:	48 63 d0             	movsxd rdx,eax
  807bab:	48 89 d0             	mov    rax,rdx
  807bae:	48 c1 e0 02          	shl    rax,0x2
  807bb2:	48 01 d0             	add    rax,rdx
  807bb5:	48 05 c2 42 81 00    	add    rax,0x8142c2
  807bbb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807bbe:	38 45 ec             	cmp    BYTE PTR [rbp-0x14],al
  807bc1:	0f 85 a1 00 00 00    	jne    807c68 <to_ascii+0xdc>
        {
            if(k_capslock&&key_map[i].ascii>='a'&&key_map[i].ascii<='z')return key_map[i].ascii_shift;
  807bc7:	0f b6 05 01 fc c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fc01]        # 4277cf <k_capslock>
  807bce:	84 c0                	test   al,al
  807bd0:	74 55                	je     807c27 <to_ascii+0x9b>
  807bd2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807bd5:	48 63 d0             	movsxd rdx,eax
  807bd8:	48 89 d0             	mov    rax,rdx
  807bdb:	48 c1 e0 02          	shl    rax,0x2
  807bdf:	48 01 d0             	add    rax,rdx
  807be2:	48 05 c0 42 81 00    	add    rax,0x8142c0
  807be8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807beb:	3c 60                	cmp    al,0x60
  807bed:	7e 38                	jle    807c27 <to_ascii+0x9b>
  807bef:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807bf2:	48 63 d0             	movsxd rdx,eax
  807bf5:	48 89 d0             	mov    rax,rdx
  807bf8:	48 c1 e0 02          	shl    rax,0x2
  807bfc:	48 01 d0             	add    rax,rdx
  807bff:	48 05 c0 42 81 00    	add    rax,0x8142c0
  807c05:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807c08:	3c 7a                	cmp    al,0x7a
  807c0a:	7f 1b                	jg     807c27 <to_ascii+0x9b>
  807c0c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807c0f:	48 63 d0             	movsxd rdx,eax
  807c12:	48 89 d0             	mov    rax,rdx
  807c15:	48 c1 e0 02          	shl    rax,0x2
  807c19:	48 01 d0             	add    rax,rdx
  807c1c:	48 05 c1 42 81 00    	add    rax,0x8142c1
  807c22:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807c25:	eb 54                	jmp    807c7b <to_ascii+0xef>
            else if(k_shift)return key_map[i].ascii_shift;
  807c27:	0f b6 05 9f fb c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fb9f]        # 4277cd <k_shift>
  807c2e:	84 c0                	test   al,al
  807c30:	74 1b                	je     807c4d <to_ascii+0xc1>
  807c32:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807c35:	48 63 d0             	movsxd rdx,eax
  807c38:	48 89 d0             	mov    rax,rdx
  807c3b:	48 c1 e0 02          	shl    rax,0x2
  807c3f:	48 01 d0             	add    rax,rdx
  807c42:	48 05 c1 42 81 00    	add    rax,0x8142c1
  807c48:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807c4b:	eb 2e                	jmp    807c7b <to_ascii+0xef>
            else return key_map[i].ascii;
  807c4d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807c50:	48 63 d0             	movsxd rdx,eax
  807c53:	48 89 d0             	mov    rax,rdx
  807c56:	48 c1 e0 02          	shl    rax,0x2
  807c5a:	48 01 d0             	add    rax,rdx
  807c5d:	48 05 c0 42 81 00    	add    rax,0x8142c0
  807c63:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807c66:	eb 13                	jmp    807c7b <to_ascii+0xef>
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  807c68:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807c6c:	83 7d fc 5d          	cmp    DWORD PTR [rbp-0x4],0x5d
  807c70:	0f 8e 2f ff ff ff    	jle    807ba5 <to_ascii+0x19>
        }

    return '\0';
  807c76:	b8 00 00 00 00       	mov    eax,0x0
}
  807c7b:	5d                   	pop    rbp
  807c7c:	c3                   	ret    

0000000000807c7d <init_kb>:
int init_kb()
{
  807c7d:	f3 0f 1e fa          	endbr64 
  807c81:	55                   	push   rbp
  807c82:	48 89 e5             	mov    rbp,rsp
    reg_device(&dev_keyboard);
  807c85:	bf 00 42 81 00       	mov    edi,0x814200
  807c8a:	e8 4e a9 ff ff       	call   8025dd <reg_device>
    reg_driver(&drv_keyboard);
  807c8f:	bf 60 41 81 00       	mov    edi,0x814160
  807c94:	e8 2c ac ff ff       	call   8028c5 <reg_driver>
}
  807c99:	90                   	nop
  807c9a:	5d                   	pop    rbp
  807c9b:	c3                   	ret    

0000000000807c9c <key_proc>:
int key_proc()
{
  807c9c:	f3 0f 1e fa          	endbr64 
  807ca0:	55                   	push   rbp
  807ca1:	48 89 e5             	mov    rbp,rsp
  807ca4:	48 83 ec 10          	sub    rsp,0x10
    //获取完整的扫描码
    u8 scan1=0,scan2=0,ch=0;
  807ca8:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
  807cac:	c6 45 fe 00          	mov    BYTE PTR [rbp-0x2],0x0
  807cb0:	c6 45 fd 00          	mov    BYTE PTR [rbp-0x3],0x0
    key_code tmpc;
    scan1=inb(0x60);
  807cb4:	bf 60 00 00 00       	mov    edi,0x60
  807cb9:	e8 9b dd ff ff       	call   805a59 <inb>
  807cbe:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
//    tmpc.scan_code2=scan2;
//    tmpc.ascii= ch;


//    ENQUEUE(key_bufq,tmpc)
    if((key_bufq.tail+1)%key_bufq.size!=key_bufq.head)
  807cc1:	8b 05 45 48 00 00    	mov    eax,DWORD PTR [rip+0x4845]        # 80c50c <key_bufq+0xc>
  807cc7:	83 c0 01             	add    eax,0x1
  807cca:	8b 0d 40 48 00 00    	mov    ecx,DWORD PTR [rip+0x4840]        # 80c510 <key_bufq+0x10>
  807cd0:	99                   	cdq    
  807cd1:	f7 f9                	idiv   ecx
  807cd3:	8b 05 2f 48 00 00    	mov    eax,DWORD PTR [rip+0x482f]        # 80c508 <key_bufq+0x8>
  807cd9:	39 c2                	cmp    edx,eax
  807cdb:	74 32                	je     807d0f <key_proc+0x73>
    {
        key_bufq.data[key_bufq.tail]=scan1;
  807cdd:	48 8b 15 1c 48 00 00 	mov    rdx,QWORD PTR [rip+0x481c]        # 80c500 <key_bufq>
  807ce4:	8b 05 22 48 00 00    	mov    eax,DWORD PTR [rip+0x4822]        # 80c50c <key_bufq+0xc>
  807cea:	48 98                	cdqe   
  807cec:	48 01 c2             	add    rdx,rax
  807cef:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  807cf3:	88 02                	mov    BYTE PTR [rdx],al
        key_bufq.tail=(key_bufq.tail+1)%key_bufq.size;
  807cf5:	8b 05 11 48 00 00    	mov    eax,DWORD PTR [rip+0x4811]        # 80c50c <key_bufq+0xc>
  807cfb:	83 c0 01             	add    eax,0x1
  807cfe:	8b 0d 0c 48 00 00    	mov    ecx,DWORD PTR [rip+0x480c]        # 80c510 <key_bufq+0x10>
  807d04:	99                   	cdq    
  807d05:	f7 f9                	idiv   ecx
  807d07:	89 d0                	mov    eax,edx
  807d09:	89 05 fd 47 00 00    	mov    DWORD PTR [rip+0x47fd],eax        # 80c50c <key_bufq+0xc>
    }

    if(scan1==0x48)
  807d0f:	80 7d ff 48          	cmp    BYTE PTR [rbp-0x1],0x48
  807d13:	75 0a                	jne    807d1f <key_proc+0x83>
        scr_up();
  807d15:	b8 00 00 00 00       	mov    eax,0x0
  807d1a:	e8 53 ef ff ff       	call   806c72 <scr_up>
    if(scan1==0x50)
  807d1f:	80 7d ff 50          	cmp    BYTE PTR [rbp-0x1],0x50
  807d23:	75 0a                	jne    807d2f <key_proc+0x93>
        scr_down();
  807d25:	b8 00 00 00 00       	mov    eax,0x0
  807d2a:	e8 dd ef ff ff       	call   806d0c <scr_down>
    switch (scan1)
  807d2f:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  807d33:	3d b6 00 00 00       	cmp    eax,0xb6
  807d38:	74 41                	je     807d7b <key_proc+0xdf>
  807d3a:	3d b6 00 00 00       	cmp    eax,0xb6
  807d3f:	7f 5e                	jg     807d9f <key_proc+0x103>
  807d41:	3d aa 00 00 00       	cmp    eax,0xaa
  807d46:	74 33                	je     807d7b <key_proc+0xdf>
  807d48:	3d aa 00 00 00       	cmp    eax,0xaa
  807d4d:	7f 50                	jg     807d9f <key_proc+0x103>
  807d4f:	3d 9d 00 00 00       	cmp    eax,0x9d
  807d54:	74 31                	je     807d87 <key_proc+0xeb>
  807d56:	3d 9d 00 00 00       	cmp    eax,0x9d
  807d5b:	7f 42                	jg     807d9f <key_proc+0x103>
  807d5d:	83 f8 3a             	cmp    eax,0x3a
  807d60:	74 31                	je     807d93 <key_proc+0xf7>
  807d62:	83 f8 3a             	cmp    eax,0x3a
  807d65:	7f 38                	jg     807d9f <key_proc+0x103>
  807d67:	83 f8 36             	cmp    eax,0x36
  807d6a:	74 0f                	je     807d7b <key_proc+0xdf>
  807d6c:	83 f8 36             	cmp    eax,0x36
  807d6f:	7f 2e                	jg     807d9f <key_proc+0x103>
  807d71:	83 f8 1d             	cmp    eax,0x1d
  807d74:	74 11                	je     807d87 <key_proc+0xeb>
  807d76:	83 f8 2a             	cmp    eax,0x2a
  807d79:	75 24                	jne    807d9f <key_proc+0x103>
    {
        case 0x36:
        case 0x2a:
        case 0xaa:
        case 0xb6:
            shift();
  807d7b:	b8 00 00 00 00       	mov    eax,0x0
  807d80:	e8 b0 fd ff ff       	call   807b35 <shift>
            break;
  807d85:	eb 19                	jmp    807da0 <key_proc+0x104>
        case 0x1d:
        case 0x9d:
            ctrl();
  807d87:	b8 00 00 00 00       	mov    eax,0x0
  807d8c:	e8 c1 fd ff ff       	call   807b52 <ctrl>
            break;
  807d91:	eb 0d                	jmp    807da0 <key_proc+0x104>
        case 0x3a:
            capslock();
  807d93:	b8 00 00 00 00       	mov    eax,0x0
  807d98:	e8 d2 fd ff ff       	call   807b6f <capslock>
            break;
  807d9d:	eb 01                	jmp    807da0 <key_proc+0x104>
        default:
            break;
  807d9f:	90                   	nop
//        //logf("%x\n",stdin.w_ptr);
//        //print_stdin();
//        //printchar(ch);
//        //flush_screen(0);*/
//    }
    eoi();
  807da0:	b8 00 00 00 00       	mov    eax,0x0
  807da5:	e8 c4 dc ff ff       	call   805a6e <eoi>
    asm volatile("leave \r\n iretq");
  807daa:	c9                   	leave  
  807dab:	48 cf                	iretq  
}
  807dad:	90                   	nop
  807dae:	c9                   	leave  
  807daf:	c3                   	ret    

0000000000807db0 <sys_getkbc>:

char sys_getkbc()
{
  807db0:	f3 0f 1e fa          	endbr64 
  807db4:	55                   	push   rbp
  807db5:	48 89 e5             	mov    rbp,rsp
  807db8:	48 83 ec 10          	sub    rsp,0x10
    if(key_bufq.tail==key_bufq.head)return -1;
  807dbc:	8b 15 4a 47 00 00    	mov    edx,DWORD PTR [rip+0x474a]        # 80c50c <key_bufq+0xc>
  807dc2:	8b 05 40 47 00 00    	mov    eax,DWORD PTR [rip+0x4740]        # 80c508 <key_bufq+0x8>
  807dc8:	39 c2                	cmp    edx,eax
  807dca:	75 07                	jne    807dd3 <sys_getkbc+0x23>
  807dcc:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807dd1:	eb 4e                	jmp    807e21 <sys_getkbc+0x71>
    char c=key_buf[key_bufq.head];
  807dd3:	8b 05 2f 47 00 00    	mov    eax,DWORD PTR [rip+0x472f]        # 80c508 <key_bufq+0x8>
  807dd9:	48 98                	cdqe   
  807ddb:	0f b6 80 c0 75 42 00 	movzx  eax,BYTE PTR [rax+0x4275c0]
  807de2:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    QHEAD(key_bufq)=(QHEAD(key_bufq)+1)%QSIZE(key_bufq);
  807de5:	8b 05 1d 47 00 00    	mov    eax,DWORD PTR [rip+0x471d]        # 80c508 <key_bufq+0x8>
  807deb:	83 c0 01             	add    eax,0x1
  807dee:	8b 0d 1c 47 00 00    	mov    ecx,DWORD PTR [rip+0x471c]        # 80c510 <key_bufq+0x10>
  807df4:	99                   	cdq    
  807df5:	f7 f9                	idiv   ecx
  807df7:	89 d0                	mov    eax,edx
  807df9:	89 05 09 47 00 00    	mov    DWORD PTR [rip+0x4709],eax        # 80c508 <key_bufq+0x8>
    if(c&FLAG_BREAK)return -1;
  807dff:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  807e03:	79 07                	jns    807e0c <sys_getkbc+0x5c>
  807e05:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807e0a:	eb 15                	jmp    807e21 <sys_getkbc+0x71>
    c= to_ascii(c&0x7f);
  807e0c:	0f be 45 ff          	movsx  eax,BYTE PTR [rbp-0x1]
  807e10:	83 e0 7f             	and    eax,0x7f
  807e13:	89 c7                	mov    edi,eax
  807e15:	e8 72 fd ff ff       	call   807b8c <to_ascii>
  807e1a:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    return c;
  807e1d:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  807e21:	c9                   	leave  
  807e22:	c3                   	ret    

0000000000807e23 <init_disk>:
        .read=async_read_disk,
        .write=async_write_disk
};
int disks[4];//四块硬盘的dev号
int init_disk()
{
  807e23:	f3 0f 1e fa          	endbr64 
  807e27:	55                   	push   rbp
  807e28:	48 89 e5             	mov    rbp,rsp
    //disk_devi= reg_device(&dev_disk);
    //disk_drvi= reg_driver(&drv_disk);
    //dev_disk.drv=&drv_disk;
    hd_iterate();
  807e2b:	b8 00 00 00 00       	mov    eax,0x0
  807e30:	e8 8d 09 00 00       	call   8087c2 <hd_iterate>
    return 0;
  807e35:	b8 00 00 00 00       	mov    eax,0x0
}
  807e3a:	5d                   	pop    rbp
  807e3b:	c3                   	ret    

0000000000807e3c <disk_int_handler_c>:

int disk_int_handler_c()
{
  807e3c:	f3 0f 1e fa          	endbr64 
  807e40:	55                   	push   rbp
  807e41:	48 89 e5             	mov    rbp,rsp
  807e44:	48 83 ec 20          	sub    rsp,0x20
    if(running_req==NULL)
  807e48:	48 8b 05 91 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22691]        # 42a4e0 <running_req>
  807e4f:	48 85 c0             	test   rax,rax
  807e52:	75 0a                	jne    807e5e <disk_int_handler_c+0x22>
    {
        //printf("err:null running dreq\n");
        return 1;//同步读写硬盘
  807e54:	b8 01 00 00 00       	mov    eax,0x1
  807e59:	e9 a3 01 00 00       	jmp    808001 <disk_int_handler_c+0x1c5>
    }
    short *p=running_req->buf;
  807e5e:	48 8b 05 7b 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2267b]        # 42a4e0 <running_req>
  807e65:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807e69:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int port=PORT_DISK_MAJOR;
  807e6d:	c7 45 f4 f0 01 00 00 	mov    DWORD PTR [rbp-0xc],0x1f0
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  807e74:	48 8b 05 65 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22665]        # 42a4e0 <running_req>
  807e7b:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  807e7e:	83 f8 02             	cmp    eax,0x2
  807e81:	74 0f                	je     807e92 <disk_int_handler_c+0x56>
    running_req->disk==DISK_SLAVE_SLAVE)
  807e83:	48 8b 05 56 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22656]        # 42a4e0 <running_req>
  807e8a:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  807e8d:	83 f8 03             	cmp    eax,0x3
  807e90:	75 07                	jne    807e99 <disk_int_handler_c+0x5d>
        port=PORT_DISK_SLAVE;
  807e92:	c7 45 f4 70 01 00 00 	mov    DWORD PTR [rbp-0xc],0x170
    if(running_req->func==DISKREQ_READ)
  807e99:	48 8b 05 40 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22640]        # 42a4e0 <running_req>
  807ea0:	8b 00                	mov    eax,DWORD PTR [rax]
  807ea2:	85 c0                	test   eax,eax
  807ea4:	75 42                	jne    807ee8 <disk_int_handler_c+0xac>
    {
        ////printf("sys_read dist:%x\n",p);
        //读取
        for(int i=0;i<running_req->sec_n*256;i++)
  807ea6:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  807ead:	eb 22                	jmp    807ed1 <disk_int_handler_c+0x95>
        {
            *p++=inw(port);
  807eaf:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807eb2:	0f b7 c0             	movzx  eax,ax
  807eb5:	89 c7                	mov    edi,eax
  807eb7:	e8 a7 db ff ff       	call   805a63 <inw>
  807ebc:	89 c2                	mov    edx,eax
  807ebe:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807ec2:	48 8d 48 02          	lea    rcx,[rax+0x2]
  807ec6:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  807eca:	66 89 10             	mov    WORD PTR [rax],dx
        for(int i=0;i<running_req->sec_n*256;i++)
  807ecd:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  807ed1:	48 8b 05 08 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22608]        # 42a4e0 <running_req>
  807ed8:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  807edb:	c1 e0 08             	shl    eax,0x8
  807ede:	39 45 f0             	cmp    DWORD PTR [rbp-0x10],eax
  807ee1:	7c cc                	jl     807eaf <disk_int_handler_c+0x73>
  807ee3:	e9 ca 00 00 00       	jmp    807fb2 <disk_int_handler_c+0x176>
        }
    }else if(running_req->func==DISKREQ_WRITE)
  807ee8:	48 8b 05 f1 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc225f1]        # 42a4e0 <running_req>
  807eef:	8b 00                	mov    eax,DWORD PTR [rax]
  807ef1:	83 f8 01             	cmp    eax,0x1
  807ef4:	75 42                	jne    807f38 <disk_int_handler_c+0xfc>
    {
        for(int i=0;i<running_req->sec_n*256;i++)
  807ef6:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  807efd:	eb 25                	jmp    807f24 <disk_int_handler_c+0xe8>
            outw(port,*p++);
  807eff:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807f03:	48 8d 50 02          	lea    rdx,[rax+0x2]
  807f07:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  807f0b:	0f b7 00             	movzx  eax,WORD PTR [rax]
  807f0e:	0f b7 d0             	movzx  edx,ax
  807f11:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807f14:	0f b7 c0             	movzx  eax,ax
  807f17:	89 d6                	mov    esi,edx
  807f19:	89 c7                	mov    edi,eax
  807f1b:	e8 2d db ff ff       	call   805a4d <outw>
        for(int i=0;i<running_req->sec_n*256;i++)
  807f20:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  807f24:	48 8b 05 b5 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc225b5]        # 42a4e0 <running_req>
  807f2b:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  807f2e:	c1 e0 08             	shl    eax,0x8
  807f31:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  807f34:	7c c9                	jl     807eff <disk_int_handler_c+0xc3>
  807f36:	eb 7a                	jmp    807fb2 <disk_int_handler_c+0x176>
    }else if(running_req->func==DISKREQ_CHECK)
  807f38:	48 8b 05 a1 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc225a1]        # 42a4e0 <running_req>
  807f3f:	8b 00                	mov    eax,DWORD PTR [rax]
  807f41:	83 f8 02             	cmp    eax,0x2
  807f44:	75 34                	jne    807f7a <disk_int_handler_c+0x13e>
    {
        char stat=inb(port+7);
  807f46:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807f49:	83 c0 07             	add    eax,0x7
  807f4c:	0f b6 c0             	movzx  eax,al
  807f4f:	89 c7                	mov    edi,eax
  807f51:	e8 03 db ff ff       	call   805a59 <inb>
  807f56:	88 45 e7             	mov    BYTE PTR [rbp-0x19],al
        short dat=inw(port);
  807f59:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807f5c:	0f b7 c0             	movzx  eax,ax
  807f5f:	89 c7                	mov    edi,eax
  807f61:	e8 fd da ff ff       	call   805a63 <inw>
  807f66:	66 89 45 e4          	mov    WORD PTR [rbp-0x1c],ax
        if(1)
        {
            running_req->result=DISK_CHK_OK;
  807f6a:	48 8b 05 6f 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2256f]        # 42a4e0 <running_req>
  807f71:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  807f78:	eb 38                	jmp    807fb2 <disk_int_handler_c+0x176>
            char err=inb(port+1);//错误原因
            printf("checking disk err:%x\nresetting hd\n",err);
            running_req->result=DISK_CHK_ERR;
            request(running_req->disk,DISKREQ_RESET,0,0,0);
        }
    }else if(running_req->func==DISKREQ_RESET)
  807f7a:	48 8b 05 5f 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2255f]        # 42a4e0 <running_req>
  807f81:	8b 00                	mov    eax,DWORD PTR [rax]
  807f83:	83 f8 03             	cmp    eax,0x3
  807f86:	75 2a                	jne    807fb2 <disk_int_handler_c+0x176>
    {
        int stat=inb(port+7);
  807f88:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807f8b:	83 c0 07             	add    eax,0x7
  807f8e:	0f b6 c0             	movzx  eax,al
  807f91:	89 c7                	mov    edi,eax
  807f93:	e8 c1 da ff ff       	call   805a59 <inb>
  807f98:	0f b6 c0             	movzx  eax,al
  807f9b:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
        printf("reset disk done.\nstat now:%x\n",stat);
  807f9e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807fa1:	89 c6                	mov    esi,eax
  807fa3:	bf 96 44 81 00       	mov    edi,0x814496
  807fa8:	b8 00 00 00 00       	mov    eax,0x0
  807fad:	e8 86 8d ff ff       	call   800d38 <printf>
    }
    running_req->stat=REQ_STAT_DONE;
  807fb2:	48 8b 05 27 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22527]        # 42a4e0 <running_req>
  807fb9:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  807fc0:	48 8b 05 19 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22519]        # 42a4e0 <running_req>
  807fc7:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  807fcb:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  807fd2:	00 00 00 
    running_devman_req->stat=REQ_STAT_DONE;
  807fd5:	48 8b 05 0c 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2250c]        # 42a4e8 <running_devman_req>
  807fdc:	c7 80 ac 00 00 00 03 	mov    DWORD PTR [rax+0xac],0x3
  807fe3:	00 00 00 
    running_devman_req=NULL;
  807fe6:	48 c7 05 f7 24 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc224f7],0x0        # 42a4e8 <running_devman_req>
  807fed:	00 00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  807ff1:	48 c7 05 e4 24 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc224e4],0x0        # 42a4e0 <running_req>
  807ff8:	00 00 00 00 
    return 0;
  807ffc:	b8 00 00 00 00       	mov    eax,0x0
}
  808001:	c9                   	leave  
  808002:	c3                   	ret    

0000000000808003 <check_dreq_stat>:
int check_dreq_stat(int req_id)
{
  808003:	f3 0f 1e fa          	endbr64 
  808007:	55                   	push   rbp
  808008:	48 89 e5             	mov    rbp,rsp
  80800b:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return disk_reqs[req_id].stat;
  80800e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808011:	48 63 d0             	movsxd rdx,eax
  808014:	48 89 d0             	mov    rax,rdx
  808017:	48 01 c0             	add    rax,rax
  80801a:	48 01 d0             	add    rax,rdx
  80801d:	48 c1 e0 04          	shl    rax,0x4
  808021:	48 05 fc 77 42 00    	add    rax,0x4277fc
  808027:	8b 00                	mov    eax,DWORD PTR [rax]
}
  808029:	5d                   	pop    rbp
  80802a:	c3                   	ret    

000000000080802b <request>:
int request(int disk,int func,int lba,int secn,char *buf){
  80802b:	f3 0f 1e fa          	endbr64 
  80802f:	55                   	push   rbp
  808030:	48 89 e5             	mov    rbp,rsp
  808033:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  808036:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  808039:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  80803c:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  80803f:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    if((tail+1)%MAX_DISK_REQUEST_COUNT==head)
  808043:	8b 05 cb 24 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc224cb]        # 42a514 <tail>
  808049:	83 c0 01             	add    eax,0x1
  80804c:	48 63 d0             	movsxd rdx,eax
  80804f:	48 69 d2 89 88 88 88 	imul   rdx,rdx,0xffffffff88888889
  808056:	48 c1 ea 20          	shr    rdx,0x20
  80805a:	01 c2                	add    edx,eax
  80805c:	c1 fa 07             	sar    edx,0x7
  80805f:	89 c1                	mov    ecx,eax
  808061:	c1 f9 1f             	sar    ecx,0x1f
  808064:	29 ca                	sub    edx,ecx
  808066:	69 ca f0 00 00 00    	imul   ecx,edx,0xf0
  80806c:	29 c8                	sub    eax,ecx
  80806e:	89 c2                	mov    edx,eax
  808070:	8b 05 9a 24 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2249a]        # 42a510 <head>
  808076:	39 c2                	cmp    edx,eax
  808078:	75 0a                	jne    808084 <request+0x59>
    {
        return -1;
  80807a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80807f:	e9 0d 01 00 00       	jmp    808191 <request+0x166>
    }
    disk_reqs[tail].disk=disk;
  808084:	8b 05 8a 24 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2248a]        # 42a514 <tail>
  80808a:	48 63 d0             	movsxd rdx,eax
  80808d:	48 89 d0             	mov    rax,rdx
  808090:	48 01 c0             	add    rax,rax
  808093:	48 01 d0             	add    rax,rdx
  808096:	48 c1 e0 04          	shl    rax,0x4
  80809a:	48 8d 90 e4 77 42 00 	lea    rdx,[rax+0x4277e4]
  8080a1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8080a4:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].func=func;
  8080a6:	8b 05 68 24 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22468]        # 42a514 <tail>
  8080ac:	48 63 d0             	movsxd rdx,eax
  8080af:	48 89 d0             	mov    rax,rdx
  8080b2:	48 01 c0             	add    rax,rax
  8080b5:	48 01 d0             	add    rax,rdx
  8080b8:	48 c1 e0 04          	shl    rax,0x4
  8080bc:	48 8d 90 e0 77 42 00 	lea    rdx,[rax+0x4277e0]
  8080c3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8080c6:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].lba=lba;
  8080c8:	8b 05 46 24 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22446]        # 42a514 <tail>
  8080ce:	48 63 d0             	movsxd rdx,eax
  8080d1:	48 89 d0             	mov    rax,rdx
  8080d4:	48 01 c0             	add    rax,rax
  8080d7:	48 01 d0             	add    rax,rdx
  8080da:	48 c1 e0 04          	shl    rax,0x4
  8080de:	48 8d 90 e8 77 42 00 	lea    rdx,[rax+0x4277e8]
  8080e5:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8080e8:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].sec_n=secn;
  8080ea:	8b 05 24 24 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22424]        # 42a514 <tail>
  8080f0:	48 63 d0             	movsxd rdx,eax
  8080f3:	48 89 d0             	mov    rax,rdx
  8080f6:	48 01 c0             	add    rax,rax
  8080f9:	48 01 d0             	add    rax,rdx
  8080fc:	48 c1 e0 04          	shl    rax,0x4
  808100:	48 8d 90 ec 77 42 00 	lea    rdx,[rax+0x4277ec]
  808107:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80810a:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].stat=REQ_STAT_READY;
  80810c:	8b 05 02 24 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22402]        # 42a514 <tail>
  808112:	48 63 d0             	movsxd rdx,eax
  808115:	48 89 d0             	mov    rax,rdx
  808118:	48 01 c0             	add    rax,rax
  80811b:	48 01 d0             	add    rax,rdx
  80811e:	48 c1 e0 04          	shl    rax,0x4
  808122:	48 05 fc 77 42 00    	add    rax,0x4277fc
  808128:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    disk_reqs[tail].buf=buf;
  80812e:	8b 05 e0 23 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc223e0]        # 42a514 <tail>
  808134:	48 63 d0             	movsxd rdx,eax
  808137:	48 89 d0             	mov    rax,rdx
  80813a:	48 01 c0             	add    rax,rax
  80813d:	48 01 d0             	add    rax,rdx
  808140:	48 c1 e0 04          	shl    rax,0x4
  808144:	48 8d 90 f0 77 42 00 	lea    rdx,[rax+0x4277f0]
  80814b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80814f:	48 89 02             	mov    QWORD PTR [rdx],rax
    int r=tail;
  808152:	8b 05 bc 23 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc223bc]        # 42a514 <tail>
  808158:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    tail=(tail+1)%MAX_DISK_REQUEST_COUNT;
  80815b:	8b 05 b3 23 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc223b3]        # 42a514 <tail>
  808161:	8d 50 01             	lea    edx,[rax+0x1]
  808164:	48 63 c2             	movsxd rax,edx
  808167:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  80816e:	48 c1 e8 20          	shr    rax,0x20
  808172:	01 d0                	add    eax,edx
  808174:	c1 f8 07             	sar    eax,0x7
  808177:	89 d1                	mov    ecx,edx
  808179:	c1 f9 1f             	sar    ecx,0x1f
  80817c:	29 c8                	sub    eax,ecx
  80817e:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  808184:	89 d0                	mov    eax,edx
  808186:	29 c8                	sub    eax,ecx
  808188:	89 05 86 23 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc22386],eax        # 42a514 <tail>
    return r;
  80818e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  808191:	5d                   	pop    rbp
  808192:	c3                   	ret    

0000000000808193 <execute_request>:
int execute_request(){
  808193:	f3 0f 1e fa          	endbr64 
  808197:	55                   	push   rbp
  808198:	48 89 e5             	mov    rbp,rsp
  80819b:	48 83 ec 10          	sub    rsp,0x10
    //查看是否有已经在运行的请求
    if(running_req!=NULL)
  80819f:	48 8b 05 3a 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2233a]        # 42a4e0 <running_req>
  8081a6:	48 85 c0             	test   rax,rax
  8081a9:	74 6a                	je     808215 <execute_request+0x82>
    {
        running_req->time++;
  8081ab:	48 8b 05 2e 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2232e]        # 42a4e0 <running_req>
  8081b2:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  8081b5:	83 c2 01             	add    edx,0x1
  8081b8:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
        if(running_req->func!=DISKREQ_CHECK)
  8081bb:	48 8b 05 1e 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2231e]        # 42a4e0 <running_req>
  8081c2:	8b 00                	mov    eax,DWORD PTR [rax]
  8081c4:	83 f8 02             	cmp    eax,0x2
  8081c7:	74 0a                	je     8081d3 <execute_request+0x40>
            return 2;
  8081c9:	b8 02 00 00 00       	mov    eax,0x2
  8081ce:	e9 b4 01 00 00       	jmp    808387 <execute_request+0x1f4>
        if(running_req->time>MAX_DISK_CHKTIME)
  8081d3:	48 8b 05 06 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22306]        # 42a4e0 <running_req>
  8081da:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  8081dd:	83 f8 0a             	cmp    eax,0xa
  8081e0:	7e 29                	jle    80820b <execute_request+0x78>
        {
            //检测硬盘超时，视为没有硬盘连接
            running_req->result=DISK_CHK_ERR;
  8081e2:	48 8b 05 f7 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc222f7]        # 42a4e0 <running_req>
  8081e9:	c7 40 20 02 00 00 00 	mov    DWORD PTR [rax+0x20],0x2
            running_req->stat=REQ_STAT_DONE;
  8081f0:	48 8b 05 e9 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc222e9]        # 42a4e0 <running_req>
  8081f7:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
            running_req=NULL;
  8081fe:	48 c7 05 d7 22 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc222d7],0x0        # 42a4e0 <running_req>
  808205:	00 00 00 00 
  808209:	eb 0a                	jmp    808215 <execute_request+0x82>
        }else
        {
            //未到时间继续等待
            return 2;
  80820b:	b8 02 00 00 00       	mov    eax,0x2
  808210:	e9 72 01 00 00       	jmp    808387 <execute_request+0x1f4>
        }
    }
    if(head==tail)return 1;//检查是否为空
  808215:	8b 15 f5 22 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc222f5]        # 42a510 <head>
  80821b:	8b 05 f3 22 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc222f3]        # 42a514 <tail>
  808221:	39 c2                	cmp    edx,eax
  808223:	75 0a                	jne    80822f <execute_request+0x9c>
  808225:	b8 01 00 00 00       	mov    eax,0x1
  80822a:	e9 58 01 00 00       	jmp    808387 <execute_request+0x1f4>
    running_req=&disk_reqs[head];
  80822f:	8b 05 db 22 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc222db]        # 42a510 <head>
  808235:	48 63 d0             	movsxd rdx,eax
  808238:	48 89 d0             	mov    rax,rdx
  80823b:	48 01 c0             	add    rax,rax
  80823e:	48 01 d0             	add    rax,rdx
  808241:	48 c1 e0 04          	shl    rax,0x4
  808245:	48 05 e0 77 42 00    	add    rax,0x4277e0
  80824b:	48 89 05 8e 22 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2228e],rax        # 42a4e0 <running_req>
    head=(head+1)%MAX_DISK_REQUEST_COUNT;
  808252:	8b 05 b8 22 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc222b8]        # 42a510 <head>
  808258:	8d 50 01             	lea    edx,[rax+0x1]
  80825b:	48 63 c2             	movsxd rax,edx
  80825e:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  808265:	48 c1 e8 20          	shr    rax,0x20
  808269:	01 d0                	add    eax,edx
  80826b:	c1 f8 07             	sar    eax,0x7
  80826e:	89 d1                	mov    ecx,edx
  808270:	c1 f9 1f             	sar    ecx,0x1f
  808273:	29 c8                	sub    eax,ecx
  808275:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  80827b:	89 d0                	mov    eax,edx
  80827d:	29 c8                	sub    eax,ecx
  80827f:	89 05 8b 22 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2228b],eax        # 42a510 <head>
    running_req->stat=REQ_STAT_WORKING;
  808285:	48 8b 05 54 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22254]        # 42a4e0 <running_req>
  80828c:	c7 40 1c 02 00 00 00 	mov    DWORD PTR [rax+0x1c],0x2
    //set_proc_stat(running_req->pid,SUSPENDED);
    int r=0;
  808293:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    switch (running_req->func)
  80829a:	48 8b 05 3f 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2223f]        # 42a4e0 <running_req>
  8082a1:	8b 00                	mov    eax,DWORD PTR [rax]
  8082a3:	83 f8 03             	cmp    eax,0x3
  8082a6:	0f 84 ad 00 00 00    	je     808359 <execute_request+0x1c6>
  8082ac:	83 f8 03             	cmp    eax,0x3
  8082af:	0f 8f bf 00 00 00    	jg     808374 <execute_request+0x1e1>
  8082b5:	83 f8 02             	cmp    eax,0x2
  8082b8:	0f 84 85 00 00 00    	je     808343 <execute_request+0x1b0>
  8082be:	83 f8 02             	cmp    eax,0x2
  8082c1:	0f 8f ad 00 00 00    	jg     808374 <execute_request+0x1e1>
  8082c7:	85 c0                	test   eax,eax
  8082c9:	74 0a                	je     8082d5 <execute_request+0x142>
  8082cb:	83 f8 01             	cmp    eax,0x1
  8082ce:	74 3c                	je     80830c <execute_request+0x179>
        break;
    case DISKREQ_RESET:
        r=async_reset_disk(running_req->disk);
        break;
    default:
        break;
  8082d0:	e9 9f 00 00 00       	jmp    808374 <execute_request+0x1e1>
        running_req->lba,running_req->sec_n,running_req->buf);
  8082d5:	48 8b 05 04 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22204]        # 42a4e0 <running_req>
        r=async_read_disk(running_req->disk,\
  8082dc:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
        running_req->lba,running_req->sec_n,running_req->buf);
  8082e0:	48 8b 05 f9 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc221f9]        # 42a4e0 <running_req>
        r=async_read_disk(running_req->disk,\
  8082e7:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
        running_req->lba,running_req->sec_n,running_req->buf);
  8082ea:	48 8b 05 ef 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc221ef]        # 42a4e0 <running_req>
  8082f1:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_read_disk(running_req->disk,\
  8082f4:	89 c6                	mov    esi,eax
  8082f6:	48 8b 05 e3 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc221e3]        # 42a4e0 <running_req>
  8082fd:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808300:	89 c7                	mov    edi,eax
  808302:	e8 a7 00 00 00       	call   8083ae <async_read_disk>
  808307:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  80830a:	eb 69                	jmp    808375 <execute_request+0x1e2>
         running_req->lba,running_req->sec_n,running_req->buf);
  80830c:	48 8b 05 cd 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc221cd]        # 42a4e0 <running_req>
        r=async_write_disk(running_req->disk,\
  808313:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
         running_req->lba,running_req->sec_n,running_req->buf);
  808317:	48 8b 05 c2 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc221c2]        # 42a4e0 <running_req>
        r=async_write_disk(running_req->disk,\
  80831e:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
         running_req->lba,running_req->sec_n,running_req->buf);
  808321:	48 8b 05 b8 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc221b8]        # 42a4e0 <running_req>
  808328:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_write_disk(running_req->disk,\
  80832b:	89 c6                	mov    esi,eax
  80832d:	48 8b 05 ac 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc221ac]        # 42a4e0 <running_req>
  808334:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808337:	89 c7                	mov    edi,eax
  808339:	e8 88 01 00 00       	call   8084c6 <async_write_disk>
  80833e:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  808341:	eb 32                	jmp    808375 <execute_request+0x1e2>
        r=async_check_disk(running_req->disk);
  808343:	48 8b 05 96 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22196]        # 42a4e0 <running_req>
  80834a:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80834d:	89 c7                	mov    edi,eax
  80834f:	e8 8f 06 00 00       	call   8089e3 <async_check_disk>
  808354:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  808357:	eb 1c                	jmp    808375 <execute_request+0x1e2>
        r=async_reset_disk(running_req->disk);
  808359:	48 8b 05 80 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22180]        # 42a4e0 <running_req>
  808360:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808363:	89 c7                	mov    edi,eax
  808365:	b8 00 00 00 00       	mov    eax,0x0
  80836a:	e8 1a 00 00 00       	call   808389 <async_reset_disk>
  80836f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  808372:	eb 01                	jmp    808375 <execute_request+0x1e2>
        break;
  808374:	90                   	nop
    }
    if(r==-1)return -1;
  808375:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  808379:	75 07                	jne    808382 <execute_request+0x1ef>
  80837b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808380:	eb 05                	jmp    808387 <execute_request+0x1f4>
    return 0;
  808382:	b8 00 00 00 00       	mov    eax,0x0
}
  808387:	c9                   	leave  
  808388:	c3                   	ret    

0000000000808389 <async_reset_disk>:
int async_reset_disk(int disk)
{
  808389:	f3 0f 1e fa          	endbr64 
  80838d:	55                   	push   rbp
  80838e:	48 89 e5             	mov    rbp,rsp
  808391:	48 83 ec 10          	sub    rsp,0x10
  808395:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    outb(PORT_DISK_CONTROL,DISK_CMD_RESET);
  808398:	be 0c 00 00 00       	mov    esi,0xc
  80839d:	bf f6 03 00 00       	mov    edi,0x3f6
  8083a2:	e8 99 d6 ff ff       	call   805a40 <outb>
    return 0;
  8083a7:	b8 00 00 00 00       	mov    eax,0x0
}
  8083ac:	c9                   	leave  
  8083ad:	c3                   	ret    

00000000008083ae <async_read_disk>:
int async_read_disk(int disk,unsigned int lba,int sec_n,char* mem_addr)
{
  8083ae:	f3 0f 1e fa          	endbr64 
  8083b2:	55                   	push   rbp
  8083b3:	48 89 e5             	mov    rbp,rsp
  8083b6:	48 83 ec 30          	sub    rsp,0x30
  8083ba:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8083bd:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8083c0:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  8083c3:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  8083c7:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  8083cd:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  8083d4:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  8083d8:	74 06                	je     8083e0 <async_read_disk+0x32>
  8083da:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  8083de:	75 06                	jne    8083e6 <async_read_disk+0x38>
        port=PORT_DISK_SLAVE;
  8083e0:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  8083e6:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  8083ea:	74 06                	je     8083f2 <async_read_disk+0x44>
  8083ec:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  8083f0:	75 07                	jne    8083f9 <async_read_disk+0x4b>
        slave_disk=1;
  8083f2:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    outb(port+2,sec_n);
  8083f9:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8083fc:	0f b6 d0             	movzx  edx,al
  8083ff:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808403:	83 c0 02             	add    eax,0x2
  808406:	0f b7 c0             	movzx  eax,ax
  808409:	89 d6                	mov    esi,edx
  80840b:	89 c7                	mov    edi,eax
  80840d:	e8 2e d6 ff ff       	call   805a40 <outb>
    outb(port+3,lba&0xff);
  808412:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808415:	0f b6 d0             	movzx  edx,al
  808418:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80841c:	83 c0 03             	add    eax,0x3
  80841f:	0f b7 c0             	movzx  eax,ax
  808422:	89 d6                	mov    esi,edx
  808424:	89 c7                	mov    edi,eax
  808426:	e8 15 d6 ff ff       	call   805a40 <outb>
    outb(port+4,(lba>>8)&0xff);
  80842b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80842e:	c1 e8 08             	shr    eax,0x8
  808431:	0f b6 d0             	movzx  edx,al
  808434:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808438:	83 c0 04             	add    eax,0x4
  80843b:	0f b7 c0             	movzx  eax,ax
  80843e:	89 d6                	mov    esi,edx
  808440:	89 c7                	mov    edi,eax
  808442:	e8 f9 d5 ff ff       	call   805a40 <outb>
    outb(port+5,(lba>>16)&0xff);
  808447:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80844a:	c1 e8 10             	shr    eax,0x10
  80844d:	0f b6 d0             	movzx  edx,al
  808450:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808454:	83 c0 05             	add    eax,0x5
  808457:	0f b7 c0             	movzx  eax,ax
  80845a:	89 d6                	mov    esi,edx
  80845c:	89 c7                	mov    edi,eax
  80845e:	e8 dd d5 ff ff       	call   805a40 <outb>
    char drv=slave_disk?0x10:0;
  808463:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  808467:	74 07                	je     808470 <async_read_disk+0xc2>
  808469:	b8 10 00 00 00       	mov    eax,0x10
  80846e:	eb 05                	jmp    808475 <async_read_disk+0xc7>
  808470:	b8 00 00 00 00       	mov    eax,0x0
  808475:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
    char lba_hi=(lba>>24)&0xf|drv|0xe0;
  808478:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80847b:	c1 e8 18             	shr    eax,0x18
  80847e:	83 e0 0f             	and    eax,0xf
  808481:	89 c2                	mov    edx,eax
  808483:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  808487:	09 d0                	or     eax,edx
  808489:	83 c8 e0             	or     eax,0xffffffe0
  80848c:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
    outb(port+6,lba_hi);
  80848f:	0f b6 45 f6          	movzx  eax,BYTE PTR [rbp-0xa]
  808493:	0f b6 d0             	movzx  edx,al
  808496:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80849a:	83 c0 06             	add    eax,0x6
  80849d:	0f b7 c0             	movzx  eax,ax
  8084a0:	89 d6                	mov    esi,edx
  8084a2:	89 c7                	mov    edi,eax
  8084a4:	e8 97 d5 ff ff       	call   805a40 <outb>
    outb(port+7,DISK_CMD_READ);
  8084a9:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8084ad:	83 c0 07             	add    eax,0x7
  8084b0:	0f b7 c0             	movzx  eax,ax
  8084b3:	be 20 00 00 00       	mov    esi,0x20
  8084b8:	89 c7                	mov    edi,eax
  8084ba:	e8 81 d5 ff ff       	call   805a40 <outb>
    // }
    // for(int i=0;i<running_req->sec_n*256;i++)
    // {
    //     *mem_addr++=inw(port);
    // }
    return 0;
  8084bf:	b8 00 00 00 00       	mov    eax,0x0
}
  8084c4:	c9                   	leave  
  8084c5:	c3                   	ret    

00000000008084c6 <async_write_disk>:
int async_write_disk(int disk,unsigned int lba, int sec_n, char* mem_ptr)
{
  8084c6:	f3 0f 1e fa          	endbr64 
  8084ca:	55                   	push   rbp
  8084cb:	48 89 e5             	mov    rbp,rsp
  8084ce:	48 83 ec 30          	sub    rsp,0x30
  8084d2:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8084d5:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8084d8:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  8084db:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  8084df:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  8084e5:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  8084ec:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  8084f0:	74 06                	je     8084f8 <async_write_disk+0x32>
  8084f2:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  8084f6:	75 06                	jne    8084fe <async_write_disk+0x38>
        port=PORT_DISK_SLAVE;
  8084f8:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  8084fe:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  808502:	74 06                	je     80850a <async_write_disk+0x44>
  808504:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  808508:	75 07                	jne    808511 <async_write_disk+0x4b>
        slave_disk=1;
  80850a:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    while (1)
    {
        byte t=inb(0x1f7);
  808511:	bf f7 00 00 00       	mov    edi,0xf7
  808516:	e8 3e d5 ff ff       	call   805a59 <inb>
  80851b:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
        //logf("istat:%x",t);
        byte err=t&1;
  80851e:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  808522:	83 e0 01             	and    eax,0x1
  808525:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
        if(err!=0)
  808528:	80 7d f6 00          	cmp    BYTE PTR [rbp-0xa],0x0
  80852c:	74 0a                	je     808538 <async_write_disk+0x72>
        {
            //printf("ERR iwriting disk\n");
            return -1;
  80852e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808533:	e9 d5 00 00 00       	jmp    80860d <async_write_disk+0x147>
        }
        t&=0x88;
  808538:	80 65 f7 88          	and    BYTE PTR [rbp-0x9],0x88
        if(t==0x8)break;
  80853c:	80 7d f7 08          	cmp    BYTE PTR [rbp-0x9],0x8
  808540:	74 02                	je     808544 <async_write_disk+0x7e>
    {
  808542:	eb cd                	jmp    808511 <async_write_disk+0x4b>
        if(t==0x8)break;
  808544:	90                   	nop
    }
    outb(port+2,sec_n);
  808545:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808548:	0f b6 d0             	movzx  edx,al
  80854b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80854f:	83 c0 02             	add    eax,0x2
  808552:	0f b7 c0             	movzx  eax,ax
  808555:	89 d6                	mov    esi,edx
  808557:	89 c7                	mov    edi,eax
  808559:	e8 e2 d4 ff ff       	call   805a40 <outb>
    outb(port+3,lba&0xff);
  80855e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808561:	0f b6 d0             	movzx  edx,al
  808564:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808568:	83 c0 03             	add    eax,0x3
  80856b:	0f b7 c0             	movzx  eax,ax
  80856e:	89 d6                	mov    esi,edx
  808570:	89 c7                	mov    edi,eax
  808572:	e8 c9 d4 ff ff       	call   805a40 <outb>
    outb(port+4,(lba>>8)&0xff);
  808577:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80857a:	c1 e8 08             	shr    eax,0x8
  80857d:	0f b6 d0             	movzx  edx,al
  808580:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808584:	83 c0 04             	add    eax,0x4
  808587:	0f b7 c0             	movzx  eax,ax
  80858a:	89 d6                	mov    esi,edx
  80858c:	89 c7                	mov    edi,eax
  80858e:	e8 ad d4 ff ff       	call   805a40 <outb>
    outb(port+5,(lba>>16)&0xff);
  808593:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808596:	c1 e8 10             	shr    eax,0x10
  808599:	0f b6 d0             	movzx  edx,al
  80859c:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8085a0:	83 c0 05             	add    eax,0x5
  8085a3:	0f b7 c0             	movzx  eax,ax
  8085a6:	89 d6                	mov    esi,edx
  8085a8:	89 c7                	mov    edi,eax
  8085aa:	e8 91 d4 ff ff       	call   805a40 <outb>
    char drv=slave_disk?0x10:0;
  8085af:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  8085b3:	74 07                	je     8085bc <async_write_disk+0xf6>
  8085b5:	b8 10 00 00 00       	mov    eax,0x10
  8085ba:	eb 05                	jmp    8085c1 <async_write_disk+0xfb>
  8085bc:	b8 00 00 00 00       	mov    eax,0x0
  8085c1:	88 45 f5             	mov    BYTE PTR [rbp-0xb],al
    unsigned char lba_hi=(lba>>24)&0xf|drv|0xe0;
  8085c4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8085c7:	c1 e8 18             	shr    eax,0x18
  8085ca:	83 e0 0f             	and    eax,0xf
  8085cd:	89 c2                	mov    edx,eax
  8085cf:	0f b6 45 f5          	movzx  eax,BYTE PTR [rbp-0xb]
  8085d3:	09 d0                	or     eax,edx
  8085d5:	83 c8 e0             	or     eax,0xffffffe0
  8085d8:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    outb(port+6,lba_hi);
  8085db:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  8085df:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8085e3:	83 c0 06             	add    eax,0x6
  8085e6:	0f b7 c0             	movzx  eax,ax
  8085e9:	89 d6                	mov    esi,edx
  8085eb:	89 c7                	mov    edi,eax
  8085ed:	e8 4e d4 ff ff       	call   805a40 <outb>
    outb(port+7,DISK_CMD_WRITE);
  8085f2:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8085f6:	83 c0 07             	add    eax,0x7
  8085f9:	0f b7 c0             	movzx  eax,ax
  8085fc:	be 30 00 00 00       	mov    esi,0x30
  808601:	89 c7                	mov    edi,eax
  808603:	e8 38 d4 ff ff       	call   805a40 <outb>
    //     if(t==0x8)break;
    // }
    // short *p=mem_ptr;
    // for(int i=0;i<running_req->sec_n*256;i++)
    //         outw(port,*p++);
    return 0;
  808608:	b8 00 00 00 00       	mov    eax,0x0
}
  80860d:	c9                   	leave  
  80860e:	c3                   	ret    

000000000080860f <read_disk>:
int read_disk(driver_args* args)
{
  80860f:	f3 0f 1e fa          	endbr64 
  808613:	55                   	push   rbp
  808614:	48 89 e5             	mov    rbp,rsp
  808617:	48 83 ec 20          	sub    rsp,0x20
  80861b:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=read_disk_asm(args->lba,args->sec_c,args->dist_addr);
  80861f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808623:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808626:	48 98                	cdqe   
  808628:	48 89 c2             	mov    rdx,rax
  80862b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80862f:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  808632:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808636:	8b 00                	mov    eax,DWORD PTR [rax]
  808638:	89 ce                	mov    esi,ecx
  80863a:	89 c7                	mov    edi,eax
  80863c:	e8 8b 05 00 00       	call   808bcc <read_disk_asm>
  808641:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  808644:	48 8b 05 95 1e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21e95]        # 42a4e0 <running_req>
  80864b:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  808652:	48 8b 05 87 1e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21e87]        # 42a4e0 <running_req>
  808659:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  80865d:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  808664:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  808667:	48 c7 05 6e 1e c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21e6e],0x0        # 42a4e0 <running_req>
  80866e:	00 00 00 00 
    return ret;
  808672:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  808675:	c9                   	leave  
  808676:	c3                   	ret    

0000000000808677 <write_disk>:
int write_disk(driver_args* args)
{
  808677:	f3 0f 1e fa          	endbr64 
  80867b:	55                   	push   rbp
  80867c:	48 89 e5             	mov    rbp,rsp
  80867f:	48 83 ec 20          	sub    rsp,0x20
  808683:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=write_disk_asm(args->lba,args->sec_c,args->src_addr);
  808687:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80868b:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80868e:	48 98                	cdqe   
  808690:	48 89 c2             	mov    rdx,rax
  808693:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808697:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  80869a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80869e:	8b 00                	mov    eax,DWORD PTR [rax]
  8086a0:	89 ce                	mov    esi,ecx
  8086a2:	89 c7                	mov    edi,eax
  8086a4:	e8 a3 05 00 00       	call   808c4c <write_disk_asm>
  8086a9:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  8086ac:	48 8b 05 2d 1e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21e2d]        # 42a4e0 <running_req>
  8086b3:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  8086ba:	48 8b 05 1f 1e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21e1f]        # 42a4e0 <running_req>
  8086c1:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  8086c5:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  8086cc:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  8086cf:	48 c7 05 06 1e c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21e06],0x0        # 42a4e0 <running_req>
  8086d6:	00 00 00 00 
    return ret;
  8086da:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8086dd:	c9                   	leave  
  8086de:	c3                   	ret    

00000000008086df <chk_result>:
int chk_result(int r)
{
  8086df:	f3 0f 1e fa          	endbr64 
  8086e3:	55                   	push   rbp
  8086e4:	48 89 e5             	mov    rbp,rsp
  8086e7:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(disk_reqs[r].stat!=REQ_STAT_DONE);
  8086ea:	90                   	nop
  8086eb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8086ee:	48 63 d0             	movsxd rdx,eax
  8086f1:	48 89 d0             	mov    rax,rdx
  8086f4:	48 01 c0             	add    rax,rax
  8086f7:	48 01 d0             	add    rax,rdx
  8086fa:	48 c1 e0 04          	shl    rax,0x4
  8086fe:	48 05 fc 77 42 00    	add    rax,0x4277fc
  808704:	8b 00                	mov    eax,DWORD PTR [rax]
  808706:	83 f8 03             	cmp    eax,0x3
  808709:	75 e0                	jne    8086eb <chk_result+0xc>
    return disk_reqs[r].result==DISK_CHK_OK?1:0;
  80870b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80870e:	48 63 d0             	movsxd rdx,eax
  808711:	48 89 d0             	mov    rax,rdx
  808714:	48 01 c0             	add    rax,rax
  808717:	48 01 d0             	add    rax,rdx
  80871a:	48 c1 e0 04          	shl    rax,0x4
  80871e:	48 05 00 78 42 00    	add    rax,0x427800
  808724:	8b 00                	mov    eax,DWORD PTR [rax]
  808726:	83 f8 01             	cmp    eax,0x1
  808729:	0f 94 c0             	sete   al
  80872c:	0f b6 c0             	movzx  eax,al
}
  80872f:	5d                   	pop    rbp
  808730:	c3                   	ret    

0000000000808731 <disk_existent>:
int disk_existent(int disk)
{
  808731:	f3 0f 1e fa          	endbr64 
  808735:	55                   	push   rbp
  808736:	48 89 e5             	mov    rbp,rsp
  808739:	48 83 ec 10          	sub    rsp,0x10
  80873d:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    switch (disk)
  808740:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  808744:	74 5f                	je     8087a5 <disk_existent+0x74>
  808746:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  80874a:	7f 6e                	jg     8087ba <disk_existent+0x89>
  80874c:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  808750:	74 3e                	je     808790 <disk_existent+0x5f>
  808752:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  808756:	7f 62                	jg     8087ba <disk_existent+0x89>
  808758:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80875c:	74 08                	je     808766 <disk_existent+0x35>
  80875e:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
  808762:	74 17                	je     80877b <disk_existent+0x4a>
        
    case DISK_SLAVE_SLAVE:
        return sys_find_dev("hd3")!=-1;
        break;
    default:
        break;
  808764:	eb 54                	jmp    8087ba <disk_existent+0x89>
        return sys_find_dev("hd0")!=-1;
  808766:	bf b4 44 81 00       	mov    edi,0x8144b4
  80876b:	e8 a5 a2 ff ff       	call   802a15 <sys_find_dev>
  808770:	83 f8 ff             	cmp    eax,0xffffffff
  808773:	0f 95 c0             	setne  al
  808776:	0f b6 c0             	movzx  eax,al
  808779:	eb 45                	jmp    8087c0 <disk_existent+0x8f>
        return sys_find_dev("hd1")!=-1;
  80877b:	bf b8 44 81 00       	mov    edi,0x8144b8
  808780:	e8 90 a2 ff ff       	call   802a15 <sys_find_dev>
  808785:	83 f8 ff             	cmp    eax,0xffffffff
  808788:	0f 95 c0             	setne  al
  80878b:	0f b6 c0             	movzx  eax,al
  80878e:	eb 30                	jmp    8087c0 <disk_existent+0x8f>
        return sys_find_dev("hd2")!=-1;
  808790:	bf bc 44 81 00       	mov    edi,0x8144bc
  808795:	e8 7b a2 ff ff       	call   802a15 <sys_find_dev>
  80879a:	83 f8 ff             	cmp    eax,0xffffffff
  80879d:	0f 95 c0             	setne  al
  8087a0:	0f b6 c0             	movzx  eax,al
  8087a3:	eb 1b                	jmp    8087c0 <disk_existent+0x8f>
        return sys_find_dev("hd3")!=-1;
  8087a5:	bf c0 44 81 00       	mov    edi,0x8144c0
  8087aa:	e8 66 a2 ff ff       	call   802a15 <sys_find_dev>
  8087af:	83 f8 ff             	cmp    eax,0xffffffff
  8087b2:	0f 95 c0             	setne  al
  8087b5:	0f b6 c0             	movzx  eax,al
  8087b8:	eb 06                	jmp    8087c0 <disk_existent+0x8f>
        break;
  8087ba:	90                   	nop
    }
    return 0;
  8087bb:	b8 00 00 00 00       	mov    eax,0x0
}
  8087c0:	c9                   	leave  
  8087c1:	c3                   	ret    

00000000008087c2 <hd_iterate>:
int hd_iterate()
{
  8087c2:	f3 0f 1e fa          	endbr64 
  8087c6:	55                   	push   rbp
  8087c7:	48 89 e5             	mov    rbp,rsp
  8087ca:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
    char *name;
    
    int r[4];
    r[0]=request(DISK_MAJOR_MAJOR,DISKREQ_CHECK,0,1,0);
  8087d1:	41 b8 00 00 00 00    	mov    r8d,0x0
  8087d7:	b9 01 00 00 00       	mov    ecx,0x1
  8087dc:	ba 00 00 00 00       	mov    edx,0x0
  8087e1:	be 02 00 00 00       	mov    esi,0x2
  8087e6:	bf 00 00 00 00       	mov    edi,0x0
  8087eb:	e8 3b f8 ff ff       	call   80802b <request>
  8087f0:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    r[1]=request(DISK_MAJOR_SLAVE,DISKREQ_CHECK,0,1,0);
  8087f3:	41 b8 00 00 00 00    	mov    r8d,0x0
  8087f9:	b9 01 00 00 00       	mov    ecx,0x1
  8087fe:	ba 00 00 00 00       	mov    edx,0x0
  808803:	be 02 00 00 00       	mov    esi,0x2
  808808:	bf 01 00 00 00       	mov    edi,0x1
  80880d:	e8 19 f8 ff ff       	call   80802b <request>
  808812:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    r[2]=request(DISK_SLAVE_MAJOR,DISKREQ_CHECK,0,1,0);
  808815:	41 b8 00 00 00 00    	mov    r8d,0x0
  80881b:	b9 01 00 00 00       	mov    ecx,0x1
  808820:	ba 00 00 00 00       	mov    edx,0x0
  808825:	be 02 00 00 00       	mov    esi,0x2
  80882a:	bf 02 00 00 00       	mov    edi,0x2
  80882f:	e8 f7 f7 ff ff       	call   80802b <request>
  808834:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    r[3]=request(DISK_SLAVE_SLAVE,DISKREQ_CHECK,0,1,0);
  808837:	41 b8 00 00 00 00    	mov    r8d,0x0
  80883d:	b9 01 00 00 00       	mov    ecx,0x1
  808842:	ba 00 00 00 00       	mov    edx,0x0
  808847:	be 02 00 00 00       	mov    esi,0x2
  80884c:	bf 03 00 00 00       	mov    edi,0x3
  808851:	e8 d5 f7 ff ff       	call   80802b <request>
  808856:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    for(int i=0;i<1;i++)
  808859:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  808860:	e9 72 01 00 00       	jmp    8089d7 <hd_iterate+0x215>
    {
        int disk;
        switch (i)
  808865:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  808869:	74 3b                	je     8088a6 <hd_iterate+0xe4>
  80886b:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  80886f:	7f 3e                	jg     8088af <hd_iterate+0xed>
  808871:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  808875:	74 26                	je     80889d <hd_iterate+0xdb>
  808877:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  80887b:	7f 32                	jg     8088af <hd_iterate+0xed>
  80887d:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  808881:	74 08                	je     80888b <hd_iterate+0xc9>
  808883:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  808887:	74 0b                	je     808894 <hd_iterate+0xd2>
  808889:	eb 24                	jmp    8088af <hd_iterate+0xed>
        {
        case 0:disk=DISK_MAJOR_MAJOR;break;
  80888b:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  808892:	eb 25                	jmp    8088b9 <hd_iterate+0xf7>
        case 1:disk=DISK_MAJOR_SLAVE;break;
  808894:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [rbp-0x10],0x1
  80889b:	eb 1c                	jmp    8088b9 <hd_iterate+0xf7>
        case 2:disk=DISK_SLAVE_MAJOR;break;
  80889d:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [rbp-0x10],0x2
  8088a4:	eb 13                	jmp    8088b9 <hd_iterate+0xf7>
        case 3:disk=DISK_SLAVE_SLAVE;break;
  8088a6:	c7 45 f0 03 00 00 00 	mov    DWORD PTR [rbp-0x10],0x3
  8088ad:	eb 0a                	jmp    8088b9 <hd_iterate+0xf7>
        default:
            return -1;
  8088af:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8088b4:	e9 28 01 00 00       	jmp    8089e1 <hd_iterate+0x21f>
            break;
        }
        if(chk_result(r[i]))//&&!disk_existent(disk)
  8088b9:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8088bc:	48 98                	cdqe   
  8088be:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  8088c2:	89 c7                	mov    edi,eax
  8088c4:	e8 16 fe ff ff       	call   8086df <chk_result>
  8088c9:	85 c0                	test   eax,eax
  8088cb:	0f 84 81 00 00 00    	je     808952 <hd_iterate+0x190>
        {
            printf("disk %d checked.\n",i);
  8088d1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8088d4:	89 c6                	mov    esi,eax
  8088d6:	bf c4 44 81 00       	mov    edi,0x8144c4
  8088db:	b8 00 00 00 00       	mov    eax,0x0
  8088e0:	e8 53 84 ff ff       	call   800d38 <printf>
            //新硬盘
            device hd={
  8088e5:	48 8d 95 20 ff ff ff 	lea    rdx,[rbp-0xe0]
  8088ec:	b8 00 00 00 00       	mov    eax,0x0
  8088f1:	b9 15 00 00 00       	mov    ecx,0x15
  8088f6:	48 89 d7             	mov    rdi,rdx
  8088f9:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  8088fc:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8088ff:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  808905:	c7 85 28 ff ff ff 01 	mov    DWORD PTR [rbp-0xd8],0x1
  80890c:	00 00 00 
  80890f:	c7 85 2c ff ff ff 01 	mov    DWORD PTR [rbp-0xd4],0x1
  808916:	00 00 00 
                .type=DEV_TYPE_BLKDEV,
                .stype=DEV_STYPE_HD,
                .slave_dev=disk,
                .start_port=i<2?PORT_DISK_MAJOR:PORT_DISK_SLAVE
  808919:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  80891d:	7f 07                	jg     808926 <hd_iterate+0x164>
  80891f:	b8 f0 01 00 00       	mov    eax,0x1f0
  808924:	eb 05                	jmp    80892b <hd_iterate+0x169>
  808926:	b8 70 01 00 00       	mov    eax,0x170
            device hd={
  80892b:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            };
            disks[i]=reg_device(&hd);
  808931:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  808938:	48 89 c7             	mov    rdi,rax
  80893b:	e8 9d 9c ff ff       	call   8025dd <reg_device>
  808940:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  808943:	48 63 d2             	movsxd rdx,edx
  808946:	89 04 95 00 a5 42 00 	mov    DWORD PTR [rdx*4+0x42a500],eax
  80894d:	e9 81 00 00 00       	jmp    8089d3 <hd_iterate+0x211>
        }else if(!chk_result(r[i]))//&&disk_existent(disk)
  808952:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808955:	48 98                	cdqe   
  808957:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  80895b:	89 c7                	mov    edi,eax
  80895d:	e8 7d fd ff ff       	call   8086df <chk_result>
  808962:	85 c0                	test   eax,eax
  808964:	75 6d                	jne    8089d3 <hd_iterate+0x211>
        {
            switch (i)
  808966:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  80896a:	74 3e                	je     8089aa <hd_iterate+0x1e8>
  80896c:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  808970:	7f 41                	jg     8089b3 <hd_iterate+0x1f1>
  808972:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  808976:	74 28                	je     8089a0 <hd_iterate+0x1de>
  808978:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  80897c:	7f 35                	jg     8089b3 <hd_iterate+0x1f1>
  80897e:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  808982:	74 08                	je     80898c <hd_iterate+0x1ca>
  808984:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  808988:	74 0c                	je     808996 <hd_iterate+0x1d4>
  80898a:	eb 27                	jmp    8089b3 <hd_iterate+0x1f1>
            {
            case 0:name="hd0";break;
  80898c:	48 c7 45 f8 b4 44 81 	mov    QWORD PTR [rbp-0x8],0x8144b4
  808993:	00 
  808994:	eb 1d                	jmp    8089b3 <hd_iterate+0x1f1>
            case 1:name="hd1";break;
  808996:	48 c7 45 f8 b8 44 81 	mov    QWORD PTR [rbp-0x8],0x8144b8
  80899d:	00 
  80899e:	eb 13                	jmp    8089b3 <hd_iterate+0x1f1>
            case 2:name="hd2";break;
  8089a0:	48 c7 45 f8 bc 44 81 	mov    QWORD PTR [rbp-0x8],0x8144bc
  8089a7:	00 
  8089a8:	eb 09                	jmp    8089b3 <hd_iterate+0x1f1>
            case 3:name="hd3";break;
  8089aa:	48 c7 45 f8 c0 44 81 	mov    QWORD PTR [rbp-0x8],0x8144c0
  8089b1:	00 
  8089b2:	90                   	nop
            }
            //有硬盘被卸载了
            int devi=sys_find_dev(name);
  8089b3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8089b7:	48 89 c7             	mov    rdi,rax
  8089ba:	e8 56 a0 ff ff       	call   802a15 <sys_find_dev>
  8089bf:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            dispose_device(get_dev(devi));
  8089c2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8089c5:	89 c7                	mov    edi,eax
  8089c7:	e8 1d a7 ff ff       	call   8030e9 <get_dev>
  8089cc:	89 c7                	mov    edi,eax
  8089ce:	e8 69 a6 ff ff       	call   80303c <dispose_device>
    for(int i=0;i<1;i++)
  8089d3:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8089d7:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8089db:	0f 8e 84 fe ff ff    	jle    808865 <hd_iterate+0xa3>
        }

    }
}
  8089e1:	c9                   	leave  
  8089e2:	c3                   	ret    

00000000008089e3 <async_check_disk>:

int async_check_disk(int disk)
{
  8089e3:	f3 0f 1e fa          	endbr64 
  8089e7:	55                   	push   rbp
  8089e8:	48 89 e5             	mov    rbp,rsp
  8089eb:	48 83 ec 20          	sub    rsp,0x20
  8089ef:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    unsigned short disknr=PORT_DISK_MAJOR;
  8089f2:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    unsigned short chkcmd=0xe0;
  8089f8:	66 c7 45 fc e0 00    	mov    WORD PTR [rbp-0x4],0xe0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  8089fe:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  808a02:	74 06                	je     808a0a <async_check_disk+0x27>
  808a04:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  808a08:	75 06                	jne    808a10 <async_check_disk+0x2d>
        disknr=PORT_DISK_SLAVE;
  808a0a:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_MAJOR_SLAVE||disk==DISK_SLAVE_SLAVE)
  808a10:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  808a14:	74 06                	je     808a1c <async_check_disk+0x39>
  808a16:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  808a1a:	75 06                	jne    808a22 <async_check_disk+0x3f>
        chkcmd=0xf0;
  808a1c:	66 c7 45 fc f0 00    	mov    WORD PTR [rbp-0x4],0xf0
    outb(disknr+2,1);
  808a22:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808a26:	83 c0 02             	add    eax,0x2
  808a29:	0f b7 c0             	movzx  eax,ax
  808a2c:	be 01 00 00 00       	mov    esi,0x1
  808a31:	89 c7                	mov    edi,eax
  808a33:	e8 08 d0 ff ff       	call   805a40 <outb>
    outb(disknr+3,0);
  808a38:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808a3c:	83 c0 03             	add    eax,0x3
  808a3f:	0f b7 c0             	movzx  eax,ax
  808a42:	be 00 00 00 00       	mov    esi,0x0
  808a47:	89 c7                	mov    edi,eax
  808a49:	e8 f2 cf ff ff       	call   805a40 <outb>
    outb(disknr+4,0);
  808a4e:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808a52:	83 c0 04             	add    eax,0x4
  808a55:	0f b7 c0             	movzx  eax,ax
  808a58:	be 00 00 00 00       	mov    esi,0x0
  808a5d:	89 c7                	mov    edi,eax
  808a5f:	e8 dc cf ff ff       	call   805a40 <outb>
    outb(disknr+5,0);
  808a64:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808a68:	83 c0 05             	add    eax,0x5
  808a6b:	0f b7 c0             	movzx  eax,ax
  808a6e:	be 00 00 00 00       	mov    esi,0x0
  808a73:	89 c7                	mov    edi,eax
  808a75:	e8 c6 cf ff ff       	call   805a40 <outb>
    outb(disknr+6,chkcmd);//主硬盘
  808a7a:	0f b7 45 fc          	movzx  eax,WORD PTR [rbp-0x4]
  808a7e:	0f b6 d0             	movzx  edx,al
  808a81:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808a85:	83 c0 06             	add    eax,0x6
  808a88:	0f b7 c0             	movzx  eax,ax
  808a8b:	89 d6                	mov    esi,edx
  808a8d:	89 c7                	mov    edi,eax
  808a8f:	e8 ac cf ff ff       	call   805a40 <outb>
    outb(disknr+7,DISK_CMD_CHECK);
  808a94:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808a98:	83 c0 07             	add    eax,0x7
  808a9b:	0f b7 c0             	movzx  eax,ax
  808a9e:	be 90 00 00 00       	mov    esi,0x90
  808aa3:	89 c7                	mov    edi,eax
  808aa5:	e8 96 cf ff ff       	call   805a40 <outb>
    //     // {
    //     //     printf("DISK ERR\n");
    //     //     return -1;
    //     // }
    // }
    return 0;
  808aaa:	b8 00 00 00 00       	mov    eax,0x0
}
  808aaf:	c9                   	leave  
  808ab0:	c3                   	ret    

0000000000808ab1 <hd_do_req>:

//接口函数：负责接收VFS的请求然后执行
int hd_do_req(driver_args *args)
{
  808ab1:	f3 0f 1e fa          	endbr64 
  808ab5:	55                   	push   rbp
  808ab6:	48 89 e5             	mov    rbp,rsp
  808ab9:	48 83 ec 18          	sub    rsp,0x18
  808abd:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int diski=0;
  808ac1:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;disks[diski]!=args->dev;diski++);
  808ac8:	eb 04                	jmp    808ace <hd_do_req+0x1d>
  808aca:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  808ace:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808ad1:	48 98                	cdqe   
  808ad3:	8b 14 85 00 a5 42 00 	mov    edx,DWORD PTR [rax*4+0x42a500]
  808ada:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808ade:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  808ae4:	39 c2                	cmp    edx,eax
  808ae6:	75 e2                	jne    808aca <hd_do_req+0x19>
    switch (args->cmd)
  808ae8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808aec:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  808af2:	83 f8 04             	cmp    eax,0x4
  808af5:	74 72                	je     808b69 <hd_do_req+0xb8>
  808af7:	83 f8 04             	cmp    eax,0x4
  808afa:	0f 8f 96 00 00 00    	jg     808b96 <hd_do_req+0xe5>
  808b00:	83 f8 02             	cmp    eax,0x2
  808b03:	74 0a                	je     808b0f <hd_do_req+0x5e>
  808b05:	83 f8 03             	cmp    eax,0x3
  808b08:	74 32                	je     808b3c <hd_do_req+0x8b>
  808b0a:	e9 87 00 00 00       	jmp    808b96 <hd_do_req+0xe5>
    {
    case DRVF_READ:
        request(diski,DISKREQ_READ,args->lba,args->sec_c,args->dist_addr);
  808b0f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808b13:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808b16:	48 98                	cdqe   
  808b18:	48 89 c6             	mov    rsi,rax
  808b1b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808b1f:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  808b22:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808b26:	8b 10                	mov    edx,DWORD PTR [rax]
  808b28:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808b2b:	49 89 f0             	mov    r8,rsi
  808b2e:	be 00 00 00 00       	mov    esi,0x0
  808b33:	89 c7                	mov    edi,eax
  808b35:	e8 f1 f4 ff ff       	call   80802b <request>
        break;
  808b3a:	eb 61                	jmp    808b9d <hd_do_req+0xec>
    case DRVF_WRITE:
        request(diski,DISKREQ_WRITE,args->lba,args->sec_c,args->src_addr);
  808b3c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808b40:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808b43:	48 98                	cdqe   
  808b45:	48 89 c6             	mov    rsi,rax
  808b48:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808b4c:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  808b4f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808b53:	8b 10                	mov    edx,DWORD PTR [rax]
  808b55:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808b58:	49 89 f0             	mov    r8,rsi
  808b5b:	be 01 00 00 00       	mov    esi,0x1
  808b60:	89 c7                	mov    edi,eax
  808b62:	e8 c4 f4 ff ff       	call   80802b <request>
        break;
  808b67:	eb 34                	jmp    808b9d <hd_do_req+0xec>
    case DRVF_CHK:
        request(diski,DISKREQ_CHECK,args->lba,args->sec_c,args->dist_addr);
  808b69:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808b6d:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808b70:	48 98                	cdqe   
  808b72:	48 89 c6             	mov    rsi,rax
  808b75:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808b79:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  808b7c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808b80:	8b 10                	mov    edx,DWORD PTR [rax]
  808b82:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808b85:	49 89 f0             	mov    r8,rsi
  808b88:	be 02 00 00 00       	mov    esi,0x2
  808b8d:	89 c7                	mov    edi,eax
  808b8f:	e8 97 f4 ff ff       	call   80802b <request>
        break;
  808b94:	eb 07                	jmp    808b9d <hd_do_req+0xec>
    default:return -1;
  808b96:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808b9b:	eb 1e                	jmp    808bbb <hd_do_req+0x10a>
    }
    args->stat=REQ_STAT_WORKING;
  808b9d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808ba1:	c7 80 ac 00 00 00 02 	mov    DWORD PTR [rax+0xac],0x2
  808ba8:	00 00 00 
    running_devman_req=args;
  808bab:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808baf:	48 89 05 32 19 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21932],rax        # 42a4e8 <running_devman_req>
    return 0;
  808bb6:	b8 00 00 00 00       	mov    eax,0x0
  808bbb:	c9                   	leave  
  808bbc:	c3                   	ret    
  808bbd:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000808bc0 <disk_int_handler>:
  808bc0:	e8 a9 ce ff ff       	call   805a6e <eoi>
  808bc5:	e8 72 f2 ff ff       	call   807e3c <disk_int_handler_c>
  808bca:	48 cf                	iretq  

0000000000808bcc <read_disk_asm>:
  808bcc:	55                   	push   rbp
  808bcd:	89 e5                	mov    ebp,esp
  808bcf:	66 ba f7 01          	mov    dx,0x1f7
  808bd3:	31 c9                	xor    ecx,ecx
  808bd5:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  808bda:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  808bdf:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  808be4:	89 c6                	mov    esi,eax
  808be6:	66 ba f2 01          	mov    dx,0x1f2
  808bea:	88 c8                	mov    al,cl
  808bec:	ee                   	out    dx,al
  808bed:	66 ba f3 01          	mov    dx,0x1f3
  808bf1:	89 f0                	mov    eax,esi
  808bf3:	ee                   	out    dx,al
  808bf4:	66 ff c2             	inc    dx
  808bf7:	c1 e8 08             	shr    eax,0x8
  808bfa:	ee                   	out    dx,al
  808bfb:	66 ff c2             	inc    dx
  808bfe:	c1 e8 08             	shr    eax,0x8
  808c01:	ee                   	out    dx,al
  808c02:	66 ff c2             	inc    dx
  808c05:	66 c1 e8 08          	shr    ax,0x8
  808c09:	24 0f                	and    al,0xf
  808c0b:	0c e0                	or     al,0xe0
  808c0d:	ee                   	out    dx,al
  808c0e:	66 ff c2             	inc    dx
  808c11:	b0 20                	mov    al,0x20
  808c13:	ee                   	out    dx,al

0000000000808c14 <read_disk_asm.wait>:
  808c14:	90                   	nop
  808c15:	ec                   	in     al,dx
  808c16:	24 88                	and    al,0x88
  808c18:	3c 08                	cmp    al,0x8
  808c1a:	75 f8                	jne    808c14 <read_disk_asm.wait>
  808c1c:	66 89 d7             	mov    di,dx
  808c1f:	89 c8                	mov    eax,ecx
  808c21:	66 b9 00 01          	mov    cx,0x100
  808c25:	66 f7 e1             	mul    cx
  808c28:	89 c1                	mov    ecx,eax
  808c2a:	66 ba f0 01          	mov    dx,0x1f0

0000000000808c2e <read_disk_asm.read>:
  808c2e:	66 ed                	in     ax,dx
  808c30:	66 67 89 03          	mov    WORD PTR [ebx],ax
  808c34:	83 c3 02             	add    ebx,0x2
  808c37:	e2 f5                	loop   808c2e <read_disk_asm.read>
  808c39:	c9                   	leave  
  808c3a:	b8 00 00 00 00       	mov    eax,0x0
  808c3f:	c3                   	ret    

0000000000808c40 <read_disk_asm.err_disk_reading>:
  808c40:	66 ba f1 01          	mov    dx,0x1f1
  808c44:	31 c0                	xor    eax,eax
  808c46:	66 ed                	in     ax,dx
  808c48:	89 ec                	mov    esp,ebp
  808c4a:	5d                   	pop    rbp
  808c4b:	c3                   	ret    

0000000000808c4c <write_disk_asm>:
  808c4c:	55                   	push   rbp
  808c4d:	89 e5                	mov    ebp,esp
  808c4f:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  808c54:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  808c59:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  808c5e:	50                   	push   rax
  808c5f:	66 ba f2 01          	mov    dx,0x1f2
  808c63:	88 c8                	mov    al,cl
  808c65:	ee                   	out    dx,al
  808c66:	58                   	pop    rax
  808c67:	66 ba f3 01          	mov    dx,0x1f3
  808c6b:	ee                   	out    dx,al
  808c6c:	c1 e8 08             	shr    eax,0x8
  808c6f:	66 ba f4 01          	mov    dx,0x1f4
  808c73:	ee                   	out    dx,al
  808c74:	c1 e8 08             	shr    eax,0x8
  808c77:	66 ba f5 01          	mov    dx,0x1f5
  808c7b:	ee                   	out    dx,al
  808c7c:	c1 e8 08             	shr    eax,0x8
  808c7f:	24 0f                	and    al,0xf
  808c81:	0c e0                	or     al,0xe0
  808c83:	66 ba f6 01          	mov    dx,0x1f6
  808c87:	ee                   	out    dx,al
  808c88:	66 ba f7 01          	mov    dx,0x1f7
  808c8c:	b0 30                	mov    al,0x30
  808c8e:	ee                   	out    dx,al

0000000000808c8f <write_disk_asm.not_ready2>:
  808c8f:	90                   	nop
  808c90:	ec                   	in     al,dx
  808c91:	24 88                	and    al,0x88
  808c93:	3c 08                	cmp    al,0x8
  808c95:	75 f8                	jne    808c8f <write_disk_asm.not_ready2>
  808c97:	89 c8                	mov    eax,ecx
  808c99:	66 b9 00 01          	mov    cx,0x100
  808c9d:	66 f7 e1             	mul    cx
  808ca0:	89 c1                	mov    ecx,eax
  808ca2:	66 ba f0 01          	mov    dx,0x1f0

0000000000808ca6 <write_disk_asm.go_on_write>:
  808ca6:	66 67 8b 03          	mov    ax,WORD PTR [ebx]
  808caa:	66 ef                	out    dx,ax
  808cac:	83 c3 02             	add    ebx,0x2
  808caf:	e2 f5                	loop   808ca6 <write_disk_asm.go_on_write>
  808cb1:	89 ec                	mov    esp,ebp
  808cb3:	5d                   	pop    rbp
  808cb4:	c3                   	ret    

0000000000808cb5 <DISK1_FAT32_read_FAT_Entry>:
#include "mem.h"
#include "memory.h"
#include "proc.h"

unsigned int DISK1_FAT32_read_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry)
{
  808cb5:	f3 0f 1e fa          	endbr64 
  808cb9:	55                   	push   rbp
  808cba:	48 89 e5             	mov    rbp,rsp
  808cbd:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  808cc4:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  808ccb:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
	unsigned int buf[128];
	memset(buf,0,512);
  808cd1:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  808cd8:	ba 00 02 00 00       	mov    edx,0x200
  808cdd:	be 00 00 00 00       	mov    esi,0x0
  808ce2:	48 89 c7             	mov    rdi,rax
  808ce5:	e8 66 2e 00 00       	call   80bb50 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  808cea:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  808cf1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808cf5:	89 c2                	mov    edx,eax
  808cf7:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  808cfd:	c1 e8 07             	shr    eax,0x7
  808d00:	01 d0                	add    eax,edx
  808d02:	89 c2                	mov    edx,eax
  808d04:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  808d0b:	49 89 c0             	mov    r8,rax
  808d0e:	b9 01 00 00 00       	mov    ecx,0x1
  808d13:	be 00 00 00 00       	mov    esi,0x0
  808d18:	bf 00 00 00 00       	mov    edi,0x0
  808d1d:	e8 09 f3 ff ff       	call   80802b <request>
  808d22:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    chk_result(r);
  808d25:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808d28:	89 c7                	mov    edi,eax
  808d2a:	e8 b0 f9 ff ff       	call   8086df <chk_result>
    printf("DISK1_FAT32_read_FAT_Entry fat_entry:%x,%#010x\n",fat_entry,buf[fat_entry & 0x7f]);
  808d2f:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  808d35:	83 e0 7f             	and    eax,0x7f
  808d38:	89 c0                	mov    eax,eax
  808d3a:	8b 94 85 f0 fd ff ff 	mov    edx,DWORD PTR [rbp+rax*4-0x210]
  808d41:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  808d47:	89 c6                	mov    esi,eax
  808d49:	bf d8 44 81 00       	mov    edi,0x8144d8
  808d4e:	b8 00 00 00 00       	mov    eax,0x0
  808d53:	e8 e0 7f ff ff       	call   800d38 <printf>
	return buf[fat_entry & 0x7f] & 0x0fffffff;
  808d58:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  808d5e:	83 e0 7f             	and    eax,0x7f
  808d61:	89 c0                	mov    eax,eax
  808d63:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  808d6a:	25 ff ff ff 0f       	and    eax,0xfffffff
}
  808d6f:	c9                   	leave  
  808d70:	c3                   	ret    

0000000000808d71 <DISK1_FAT32_write_FAT_Entry>:


unsigned long DISK1_FAT32_write_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry,unsigned int value)
{
  808d71:	f3 0f 1e fa          	endbr64 
  808d75:	55                   	push   rbp
  808d76:	48 89 e5             	mov    rbp,rsp
  808d79:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  808d80:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  808d87:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
  808d8d:	89 95 e0 fd ff ff    	mov    DWORD PTR [rbp-0x220],edx
	unsigned int buf[128];
	int i;

	memset(buf,0,512);
  808d93:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  808d9a:	ba 00 02 00 00       	mov    edx,0x200
  808d9f:	be 00 00 00 00       	mov    esi,0x0
  808da4:	48 89 c7             	mov    rdi,rax
  808da7:	e8 a4 2d 00 00       	call   80bb50 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  808dac:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  808db3:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808db7:	89 c2                	mov    edx,eax
  808db9:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  808dbf:	c1 e8 07             	shr    eax,0x7
  808dc2:	01 d0                	add    eax,edx
  808dc4:	89 c2                	mov    edx,eax
  808dc6:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  808dcd:	49 89 c0             	mov    r8,rax
  808dd0:	b9 01 00 00 00       	mov    ecx,0x1
  808dd5:	be 00 00 00 00       	mov    esi,0x0
  808dda:	bf 00 00 00 00       	mov    edi,0x0
  808ddf:	e8 47 f2 ff ff       	call   80802b <request>
  808de4:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    chk_result(r);
  808de7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  808dea:	89 c7                	mov    edi,eax
  808dec:	e8 ee f8 ff ff       	call   8086df <chk_result>
    buf[fat_entry & 0x7f] = (buf[fat_entry & 0x7f] & 0xf0000000) | (value & 0x0fffffff);
  808df1:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  808df7:	83 e0 7f             	and    eax,0x7f
  808dfa:	89 c0                	mov    eax,eax
  808dfc:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  808e03:	25 00 00 00 f0       	and    eax,0xf0000000
  808e08:	89 c6                	mov    esi,eax
  808e0a:	8b 85 e0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x220]
  808e10:	25 ff ff ff 0f       	and    eax,0xfffffff
  808e15:	89 c1                	mov    ecx,eax
  808e17:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  808e1d:	83 e0 7f             	and    eax,0x7f
  808e20:	89 c2                	mov    edx,eax
  808e22:	89 f0                	mov    eax,esi
  808e24:	09 c8                	or     eax,ecx
  808e26:	89 d2                	mov    edx,edx
  808e28:	89 84 95 f0 fd ff ff 	mov    DWORD PTR [rbp+rdx*4-0x210],eax

	for(i = 0;i < fsbi->NumFATs;i++){
  808e2f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  808e36:	eb 61                	jmp    808e99 <DISK1_FAT32_write_FAT_Entry+0x128>
        int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,fsbi->FAT1_firstsector + fsbi->sector_per_FAT * i + (fat_entry >> 7),1,(unsigned char *)buf);
  808e38:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  808e3f:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808e43:	89 c1                	mov    ecx,eax
  808e45:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  808e4c:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  808e50:	89 c2                	mov    edx,eax
  808e52:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808e55:	48 98                	cdqe   
  808e57:	0f af c2             	imul   eax,edx
  808e5a:	8d 14 01             	lea    edx,[rcx+rax*1]
  808e5d:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  808e63:	c1 e8 07             	shr    eax,0x7
  808e66:	01 d0                	add    eax,edx
  808e68:	89 c2                	mov    edx,eax
  808e6a:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  808e71:	49 89 c0             	mov    r8,rax
  808e74:	b9 01 00 00 00       	mov    ecx,0x1
  808e79:	be 01 00 00 00       	mov    esi,0x1
  808e7e:	bf 00 00 00 00       	mov    edi,0x0
  808e83:	e8 a3 f1 ff ff       	call   80802b <request>
  808e88:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        chk_result(r1);
  808e8b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808e8e:	89 c7                	mov    edi,eax
  808e90:	e8 4a f8 ff ff       	call   8086df <chk_result>
	for(i = 0;i < fsbi->NumFATs;i++){
  808e95:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  808e99:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808e9c:	48 63 d0             	movsxd rdx,eax
  808e9f:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  808ea6:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  808eaa:	48 39 c2             	cmp    rdx,rax
  808ead:	72 89                	jb     808e38 <DISK1_FAT32_write_FAT_Entry+0xc7>
    }
	return 1;
  808eaf:	b8 01 00 00 00       	mov    eax,0x1
}
  808eb4:	c9                   	leave  
  808eb5:	c3                   	ret    

0000000000808eb6 <FAT32_open>:


long FAT32_open(struct index_node * inode,struct file * filp)
{
  808eb6:	f3 0f 1e fa          	endbr64 
  808eba:	55                   	push   rbp
  808ebb:	48 89 e5             	mov    rbp,rsp
  808ebe:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  808ec2:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  808ec6:	b8 01 00 00 00       	mov    eax,0x1
}
  808ecb:	5d                   	pop    rbp
  808ecc:	c3                   	ret    

0000000000808ecd <FAT32_close>:


long FAT32_close(struct index_node * inode,struct file * filp)
{
  808ecd:	f3 0f 1e fa          	endbr64 
  808ed1:	55                   	push   rbp
  808ed2:	48 89 e5             	mov    rbp,rsp
  808ed5:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  808ed9:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  808edd:	b8 01 00 00 00       	mov    eax,0x1
}
  808ee2:	5d                   	pop    rbp
  808ee3:	c3                   	ret    

0000000000808ee4 <FAT32_read>:


long FAT32_read(struct file * filp,char * buf,unsigned long count,long * position)
{
  808ee4:	f3 0f 1e fa          	endbr64 
  808ee8:	55                   	push   rbp
  808ee9:	48 89 e5             	mov    rbp,rsp
  808eec:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  808ef0:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  808ef4:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  808ef8:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
  808efc:	48 89 4d 80          	mov    QWORD PTR [rbp-0x80],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  808f00:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808f04:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808f08:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808f0c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808f10:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  808f14:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808f18:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808f1c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808f20:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808f24:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808f28:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

	unsigned long cluster = finode->first_cluster;
  808f2c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808f30:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808f33:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long sector = 0;
  808f37:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  808f3e:	00 
	int i,length = 0;
  808f3f:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
	long retval = 0;
  808f46:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  808f4d:	00 
	int index = *position / fsbi->bytes_per_cluster;
  808f4e:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808f52:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808f55:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  808f59:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  808f5d:	48 99                	cqo    
  808f5f:	48 f7 fe             	idiv   rsi
  808f62:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  808f65:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808f69:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808f6c:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  808f70:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  808f74:	48 99                	cqo    
  808f76:	48 f7 f9             	idiv   rcx
  808f79:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  808f7d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808f81:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808f85:	be 00 00 00 00       	mov    esi,0x0
  808f8a:	48 89 c7             	mov    rdi,rax
  808f8d:	b8 00 00 00 00       	mov    eax,0x0
  808f92:	e8 33 83 ff ff       	call   8012ca <vmalloc>
  808f97:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax

	if(!cluster)
  808f9b:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  808fa0:	75 0c                	jne    808fae <FAT32_read+0xca>
		return -EFAULT;
  808fa2:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  808fa9:	e9 f0 01 00 00       	jmp    80919e <FAT32_read+0x2ba>
	for(i = 0;i < index;i++)
  808fae:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  808fb5:	eb 1e                	jmp    808fd5 <FAT32_read+0xf1>
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  808fb7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808fbb:	89 c2                	mov    edx,eax
  808fbd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808fc1:	89 d6                	mov    esi,edx
  808fc3:	48 89 c7             	mov    rdi,rax
  808fc6:	e8 ea fc ff ff       	call   808cb5 <DISK1_FAT32_read_FAT_Entry>
  808fcb:	89 c0                	mov    eax,eax
  808fcd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	for(i = 0;i < index;i++)
  808fd1:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  808fd5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808fd8:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  808fdb:	7c da                	jl     808fb7 <FAT32_read+0xd3>

	if(*position + count > filp->dentry->dir_inode->file_size)
  808fdd:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808fe1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808fe4:	48 89 c2             	mov    rdx,rax
  808fe7:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808feb:	48 01 c2             	add    rdx,rax
  808fee:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808ff2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808ff6:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808ffa:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808ffd:	48 39 c2             	cmp    rdx,rax
  809000:	76 2c                	jbe    80902e <FAT32_read+0x14a>
		index = count = filp->dentry->dir_inode->file_size - *position;
  809002:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809006:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80900a:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80900e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809011:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  809015:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809018:	48 89 c1             	mov    rcx,rax
  80901b:	48 89 d0             	mov    rax,rdx
  80901e:	48 29 c8             	sub    rax,rcx
  809021:	48 89 45 88          	mov    QWORD PTR [rbp-0x78],rax
  809025:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809029:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
  80902c:	eb 07                	jmp    809035 <FAT32_read+0x151>
	else
		index = count;
  80902e:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809032:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax

//	printf("FAT32_read first_cluster:%d,size:%d,preempt_count:%d\n",finode->first_cluster,filp->dentry->dir_inode->file_size,current->preempt_count);

	do
	{
		memset(buffer,0,fsbi->bytes_per_cluster);
  809035:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809039:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80903d:	89 c2                	mov    edx,eax
  80903f:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  809043:	be 00 00 00 00       	mov    esi,0x0
  809048:	48 89 c7             	mov    rdi,rax
  80904b:	e8 00 2b 00 00       	call   80bb50 <memset>
		sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  809050:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809054:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  809058:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80905c:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  809060:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809064:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809068:	48 0f af c2          	imul   rax,rdx
  80906c:	48 01 c8             	add    rax,rcx
  80906f:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  809073:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809077:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80907b:	89 c1                	mov    ecx,eax
  80907d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809081:	89 c2                	mov    edx,eax
  809083:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  809087:	49 89 c0             	mov    r8,rax
  80908a:	be 00 00 00 00       	mov    esi,0x0
  80908f:	bf 00 00 00 00       	mov    edi,0x0
  809094:	e8 92 ef ff ff       	call   80802b <request>
  809099:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
		if(!chk_result(r))
  80909c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80909f:	89 c7                	mov    edi,eax
  8090a1:	e8 39 f6 ff ff       	call   8086df <chk_result>
  8090a6:	85 c0                	test   eax,eax
  8090a8:	75 1c                	jne    8090c6 <FAT32_read+0x1e2>
		{
			printf("FAT32 FS(read) read disk ERROR!!!!!!!!!!\n");
  8090aa:	bf 08 45 81 00       	mov    edi,0x814508
  8090af:	b8 00 00 00 00       	mov    eax,0x0
  8090b4:	e8 7f 7c ff ff       	call   800d38 <printf>
			retval = -EIO;
  8090b9:	48 c7 45 e8 e3 ff ff 	mov    QWORD PTR [rbp-0x18],0xffffffffffffffe3
  8090c0:	ff 
			break;
  8090c1:	e9 ba 00 00 00       	jmp    809180 <FAT32_read+0x29c>
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  8090c6:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8090c9:	48 63 d0             	movsxd rdx,eax
  8090cc:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8090d0:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8090d4:	48 2b 45 d8          	sub    rax,QWORD PTR [rbp-0x28]
  8090d8:	48 39 c2             	cmp    rdx,rax
  8090db:	48 0f 4e c2          	cmovle rax,rdx
  8090df:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax

		if((unsigned long)buf < MAX_TASKS)
  8090e2:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8090e6:	48 83 f8 1f          	cmp    rax,0x1f
  8090ea:	77 1f                	ja     80910b <FAT32_read+0x227>
			memcpy(buffer + offset,buf,length);
  8090ec:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  8090ef:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  8090f3:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8090f7:	48 01 c1             	add    rcx,rax
  8090fa:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8090fe:	48 89 c6             	mov    rsi,rax
  809101:	48 89 cf             	mov    rdi,rcx
  809104:	e8 98 29 00 00       	call   80baa1 <memcpy>
  809109:	eb 1d                	jmp    809128 <FAT32_read+0x244>
		else
			memcpy(buffer + offset,buf,length);
  80910b:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  80910e:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  809112:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  809116:	48 01 c1             	add    rcx,rax
  809119:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80911d:	48 89 c6             	mov    rsi,rax
  809120:	48 89 cf             	mov    rdi,rcx
  809123:	e8 79 29 00 00       	call   80baa1 <memcpy>

		index -= length;
  809128:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  80912b:	29 45 e4             	sub    DWORD PTR [rbp-0x1c],eax
		buf += length;
  80912e:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  809131:	48 98                	cdqe   
  809133:	48 01 45 90          	add    QWORD PTR [rbp-0x70],rax
		offset -= offset;
  809137:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  80913e:	00 
		*position += length;
  80913f:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  809143:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809146:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  809149:	48 98                	cdqe   
  80914b:	48 01 c2             	add    rdx,rax
  80914e:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  809152:	48 89 10             	mov    QWORD PTR [rax],rdx
	}while(index && (cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster)));
  809155:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  809159:	74 25                	je     809180 <FAT32_read+0x29c>
  80915b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80915f:	89 c2                	mov    edx,eax
  809161:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809165:	89 d6                	mov    esi,edx
  809167:	48 89 c7             	mov    rdi,rax
  80916a:	e8 46 fb ff ff       	call   808cb5 <DISK1_FAT32_read_FAT_Entry>
  80916f:	89 c0                	mov    eax,eax
  809171:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  809175:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80917a:	0f 85 b5 fe ff ff    	jne    809035 <FAT32_read+0x151>

	vmfree(buffer);
  809180:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  809184:	48 89 c7             	mov    rdi,rax
  809187:	e8 cd 81 ff ff       	call   801359 <vmfree>
	if(!index)
  80918c:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  809190:	75 08                	jne    80919a <FAT32_read+0x2b6>
		retval = count;
  809192:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809196:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	return retval;
  80919a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
}
  80919e:	c9                   	leave  
  80919f:	c3                   	ret    

00000000008091a0 <FAT32_find_available_cluster>:


unsigned long FAT32_find_available_cluster(struct FAT32_sb_info * fsbi)
{
  8091a0:	f3 0f 1e fa          	endbr64 
  8091a4:	55                   	push   rbp
  8091a5:	48 89 e5             	mov    rbp,rsp
  8091a8:	48 81 ec 30 02 00 00 	sub    rsp,0x230
  8091af:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
	int i,j;
	int fat_entry;
	unsigned long sector_per_fat = fsbi->sector_per_FAT;
  8091b6:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  8091bd:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  8091c1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	unsigned int buf[128];

//	fsbi->fat_fsinfo->FSI_Free_Count & fsbi->fat_fsinfo->FSI_Nxt_Free not exactly,so unuse

	for(i = 0;i < sector_per_fat;i++)
  8091c5:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8091cc:	e9 8b 00 00 00       	jmp    80925c <FAT32_find_available_cluster+0xbc>
	{
		memset(buf,0,512);
  8091d1:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  8091d8:	ba 00 02 00 00       	mov    edx,0x200
  8091dd:	be 00 00 00 00       	mov    esi,0x0
  8091e2:	48 89 c7             	mov    rdi,rax
  8091e5:	e8 66 29 00 00       	call   80bb50 <memset>
		int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + i,1,(unsigned char *)buf);
  8091ea:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  8091f1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8091f5:	89 c2                	mov    edx,eax
  8091f7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8091fa:	01 d0                	add    eax,edx
  8091fc:	89 c2                	mov    edx,eax
  8091fe:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  809205:	49 89 c0             	mov    r8,rax
  809208:	b9 01 00 00 00       	mov    ecx,0x1
  80920d:	be 00 00 00 00       	mov    esi,0x0
  809212:	bf 00 00 00 00       	mov    edi,0x0
  809217:	e8 0f ee ff ff       	call   80802b <request>
  80921c:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

		for(j = 0;j < 128;j++)
  80921f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  809226:	eb 2a                	jmp    809252 <FAT32_find_available_cluster+0xb2>
		{
			if((buf[j] & 0x0fffffff) == 0)
  809228:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80922b:	48 98                	cdqe   
  80922d:	8b 84 85 e0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x220]
  809234:	25 ff ff ff 0f       	and    eax,0xfffffff
  809239:	85 c0                	test   eax,eax
  80923b:	75 11                	jne    80924e <FAT32_find_available_cluster+0xae>
				return (i << 7) + j;
  80923d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809240:	c1 e0 07             	shl    eax,0x7
  809243:	89 c2                	mov    edx,eax
  809245:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  809248:	01 d0                	add    eax,edx
  80924a:	48 98                	cdqe   
  80924c:	eb 22                	jmp    809270 <FAT32_find_available_cluster+0xd0>
		for(j = 0;j < 128;j++)
  80924e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  809252:	83 7d f8 7f          	cmp    DWORD PTR [rbp-0x8],0x7f
  809256:	7e d0                	jle    809228 <FAT32_find_available_cluster+0x88>
	for(i = 0;i < sector_per_fat;i++)
  809258:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80925c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80925f:	48 98                	cdqe   
  809261:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  809265:	0f 87 66 ff ff ff    	ja     8091d1 <FAT32_find_available_cluster+0x31>
		}
	}
	return 0;
  80926b:	b8 00 00 00 00       	mov    eax,0x0
}
  809270:	c9                   	leave  
  809271:	c3                   	ret    

0000000000809272 <FAT32_write>:


long FAT32_write(struct file * filp,char * buf,unsigned long count,long * position)
{
  809272:	f3 0f 1e fa          	endbr64 
  809276:	55                   	push   rbp
  809277:	48 89 e5             	mov    rbp,rsp
  80927a:	48 81 ec 90 00 00 00 	sub    rsp,0x90
  809281:	48 89 7d 88          	mov    QWORD PTR [rbp-0x78],rdi
  809285:	48 89 75 80          	mov    QWORD PTR [rbp-0x80],rsi
  809289:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  809290:	48 89 8d 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  809297:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80929b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80929f:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8092a3:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8092a7:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  8092ab:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8092af:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8092b3:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8092b7:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8092bb:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8092bf:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned long cluster = finode->first_cluster;
  8092c3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8092c7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8092ca:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long next_cluster = 0;
  8092ce:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  8092d5:	00 
	unsigned long sector = 0;
  8092d6:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8092dd:	00 
	int i,length = 0;
  8092de:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
	long retval = 0;
  8092e5:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  8092ec:	00 
	long flags = 0;
  8092ed:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  8092f4:	00 
	int index = *position / fsbi->bytes_per_cluster;
  8092f5:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8092fc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8092ff:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  809303:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  809307:	48 99                	cqo    
  809309:	48 f7 fe             	idiv   rsi
  80930c:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  80930f:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  809316:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809319:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80931d:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  809321:	48 99                	cqo    
  809323:	48 f7 f9             	idiv   rcx
  809326:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  80932a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80932e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809332:	be 00 00 00 00       	mov    esi,0x0
  809337:	48 89 c7             	mov    rdi,rax
  80933a:	b8 00 00 00 00       	mov    eax,0x0
  80933f:	e8 86 7f ff ff       	call   8012ca <vmalloc>
  809344:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax

	if(!cluster)
  809348:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80934d:	75 1a                	jne    809369 <FAT32_write+0xf7>
	{
		cluster = FAT32_find_available_cluster(fsbi);
  80934f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809353:	48 89 c7             	mov    rdi,rax
  809356:	e8 45 fe ff ff       	call   8091a0 <FAT32_find_available_cluster>
  80935b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		flags = 1;
  80935f:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  809366:	00 
  809367:	eb 2f                	jmp    809398 <FAT32_write+0x126>
	}
	else
		for(i = 0;i < index;i++)
  809369:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  809370:	eb 1e                	jmp    809390 <FAT32_write+0x11e>
			cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  809372:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809376:	89 c2                	mov    edx,eax
  809378:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80937c:	89 d6                	mov    esi,edx
  80937e:	48 89 c7             	mov    rdi,rax
  809381:	e8 2f f9 ff ff       	call   808cb5 <DISK1_FAT32_read_FAT_Entry>
  809386:	89 c0                	mov    eax,eax
  809388:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		for(i = 0;i < index;i++)
  80938c:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  809390:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809393:	3b 45 d4             	cmp    eax,DWORD PTR [rbp-0x2c]
  809396:	7c da                	jl     809372 <FAT32_write+0x100>

	if(!cluster)
  809398:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80939d:	75 18                	jne    8093b7 <FAT32_write+0x145>
	{
		vmfree(buffer);
  80939f:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8093a3:	48 89 c7             	mov    rdi,rax
  8093a6:	e8 ae 7f ff ff       	call   801359 <vmfree>
		return -ENOSPC;
  8093ab:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  8093b2:	e9 13 03 00 00       	jmp    8096ca <FAT32_write+0x458>
	}

	if(flags)
  8093b7:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  8093bc:	74 4d                	je     80940b <FAT32_write+0x199>
	{
		finode->first_cluster = cluster;
  8093be:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8093c2:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8093c6:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  8093c9:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8093cd:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8093d1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8093d5:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8093d9:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8093dd:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  8093e1:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8093e5:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8093e9:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8093ed:	48 89 c7             	mov    rdi,rax
  8093f0:	ff d2                	call   rdx
		DISK1_FAT32_write_FAT_Entry(fsbi,cluster,0x0ffffff8);
  8093f2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8093f6:	89 c1                	mov    ecx,eax
  8093f8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8093fc:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  809401:	89 ce                	mov    esi,ecx
  809403:	48 89 c7             	mov    rdi,rax
  809406:	e8 66 f9 ff ff       	call   808d71 <DISK1_FAT32_write_FAT_Entry>
	}

	index = count;
  80940b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  809412:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax

	do
	{
		if(!flags)
  809415:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80941a:	0f 85 91 00 00 00    	jne    8094b1 <FAT32_write+0x23f>
		{
			memset(buffer,0,fsbi->bytes_per_cluster);
  809420:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809424:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809428:	89 c2                	mov    edx,eax
  80942a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80942e:	be 00 00 00 00       	mov    esi,0x0
  809433:	48 89 c7             	mov    rdi,rax
  809436:	e8 15 27 00 00       	call   80bb50 <memset>
			sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  80943b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80943f:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  809443:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809447:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  80944b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80944f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809453:	48 0f af c2          	imul   rax,rdx
  809457:	48 01 c8             	add    rax,rcx
  80945a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  80945e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809462:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809466:	89 c1                	mov    ecx,eax
  809468:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80946c:	89 c2                	mov    edx,eax
  80946e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809472:	49 89 c0             	mov    r8,rax
  809475:	be 00 00 00 00       	mov    esi,0x0
  80947a:	bf 00 00 00 00       	mov    edi,0x0
  80947f:	e8 a7 eb ff ff       	call   80802b <request>
  809484:	89 45 9c             	mov    DWORD PTR [rbp-0x64],eax

			if(!chk_result(r))
  809487:	8b 45 9c             	mov    eax,DWORD PTR [rbp-0x64]
  80948a:	89 c7                	mov    edi,eax
  80948c:	e8 4e f2 ff ff       	call   8086df <chk_result>
  809491:	85 c0                	test   eax,eax
  809493:	75 1c                	jne    8094b1 <FAT32_write+0x23f>
			{
				printf("FAT32 FS(write) read disk ERROR!!!!!!!!!!\n");
  809495:	bf 38 45 81 00       	mov    edi,0x814538
  80949a:	b8 00 00 00 00       	mov    eax,0x0
  80949f:	e8 94 78 ff ff       	call   800d38 <printf>
				retval = -EIO;
  8094a4:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  8094ab:	ff 
				break;
  8094ac:	e9 95 01 00 00       	jmp    809646 <FAT32_write+0x3d4>
			}
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  8094b1:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8094b4:	48 63 d0             	movsxd rdx,eax
  8094b7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8094bb:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8094bf:	48 2b 45 c8          	sub    rax,QWORD PTR [rbp-0x38]
  8094c3:	48 39 c2             	cmp    rdx,rax
  8094c6:	48 0f 4e c2          	cmovle rax,rdx
  8094ca:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax

		if((unsigned long)buf < MAX_TASKS)
  8094cd:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8094d1:	48 83 f8 1f          	cmp    rax,0x1f
  8094d5:	77 1f                	ja     8094f6 <FAT32_write+0x284>
			memcpy(buf,buffer + offset,length);
  8094d7:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  8094da:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  8094de:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8094e2:	48 01 c1             	add    rcx,rax
  8094e5:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8094e9:	48 89 ce             	mov    rsi,rcx
  8094ec:	48 89 c7             	mov    rdi,rax
  8094ef:	e8 ad 25 00 00       	call   80baa1 <memcpy>
  8094f4:	eb 1d                	jmp    809513 <FAT32_write+0x2a1>
		else
			memcpy(buf,buffer + offset,length);
  8094f6:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  8094f9:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  8094fd:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809501:	48 01 c1             	add    rcx,rax
  809504:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  809508:	48 89 ce             	mov    rsi,rcx
  80950b:	48 89 c7             	mov    rdi,rax
  80950e:	e8 8e 25 00 00       	call   80baa1 <memcpy>

		int r=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  809513:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809517:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80951b:	89 c1                	mov    ecx,eax
  80951d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809521:	89 c2                	mov    edx,eax
  809523:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809527:	49 89 c0             	mov    r8,rax
  80952a:	be 01 00 00 00       	mov    esi,0x1
  80952f:	bf 00 00 00 00       	mov    edi,0x0
  809534:	e8 f2 ea ff ff       	call   80802b <request>
  809539:	89 45 98             	mov    DWORD PTR [rbp-0x68],eax
        if(!chk_result(r))
  80953c:	8b 45 98             	mov    eax,DWORD PTR [rbp-0x68]
  80953f:	89 c7                	mov    edi,eax
  809541:	e8 99 f1 ff ff       	call   8086df <chk_result>
  809546:	85 c0                	test   eax,eax
  809548:	75 1c                	jne    809566 <FAT32_write+0x2f4>
		{
			printf("FAT32 FS(write) write disk ERROR!!!!!!!!!!\n");
  80954a:	bf 68 45 81 00       	mov    edi,0x814568
  80954f:	b8 00 00 00 00       	mov    eax,0x0
  809554:	e8 df 77 ff ff       	call   800d38 <printf>
			retval = -EIO;
  809559:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  809560:	ff 
			break;
  809561:	e9 e0 00 00 00       	jmp    809646 <FAT32_write+0x3d4>
		}

		index -= length;
  809566:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  809569:	29 45 d4             	sub    DWORD PTR [rbp-0x2c],eax
		buf += length;
  80956c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80956f:	48 98                	cdqe   
  809571:	48 01 45 80          	add    QWORD PTR [rbp-0x80],rax
		offset -= offset;
  809575:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  80957c:	00 
		*position += length;
  80957d:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  809584:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809587:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80958a:	48 98                	cdqe   
  80958c:	48 01 c2             	add    rdx,rax
  80958f:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  809596:	48 89 10             	mov    QWORD PTR [rax],rdx

		if(index)
  809599:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  80959d:	0f 84 a2 00 00 00    	je     809645 <FAT32_write+0x3d3>
			next_cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  8095a3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8095a7:	89 c2                	mov    edx,eax
  8095a9:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8095ad:	89 d6                	mov    esi,edx
  8095af:	48 89 c7             	mov    rdi,rax
  8095b2:	e8 fe f6 ff ff       	call   808cb5 <DISK1_FAT32_read_FAT_Entry>
  8095b7:	89 c0                	mov    eax,eax
  8095b9:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
		else
			break;

		if(next_cluster >= 0x0ffffff8)
  8095bd:	48 81 7d b0 f7 ff ff 	cmp    QWORD PTR [rbp-0x50],0xffffff7
  8095c4:	0f 
  8095c5:	76 72                	jbe    809639 <FAT32_write+0x3c7>
		{
			next_cluster = FAT32_find_available_cluster(fsbi);
  8095c7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8095cb:	48 89 c7             	mov    rdi,rax
  8095ce:	e8 cd fb ff ff       	call   8091a0 <FAT32_find_available_cluster>
  8095d3:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
			if(!next_cluster)
  8095d7:	48 83 7d b0 00       	cmp    QWORD PTR [rbp-0x50],0x0
  8095dc:	75 18                	jne    8095f6 <FAT32_write+0x384>
			{
				vmfree(buffer);
  8095de:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8095e2:	48 89 c7             	mov    rdi,rax
  8095e5:	e8 6f 7d ff ff       	call   801359 <vmfree>
				return -ENOSPC;
  8095ea:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  8095f1:	e9 d4 00 00 00       	jmp    8096ca <FAT32_write+0x458>
			}			
				
			DISK1_FAT32_write_FAT_Entry(fsbi,cluster,next_cluster);
  8095f6:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8095fa:	89 c2                	mov    edx,eax
  8095fc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809600:	89 c1                	mov    ecx,eax
  809602:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809606:	89 ce                	mov    esi,ecx
  809608:	48 89 c7             	mov    rdi,rax
  80960b:	e8 61 f7 ff ff       	call   808d71 <DISK1_FAT32_write_FAT_Entry>
			DISK1_FAT32_write_FAT_Entry(fsbi,next_cluster,0x0ffffff8);
  809610:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  809614:	89 c1                	mov    ecx,eax
  809616:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80961a:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  80961f:	89 ce                	mov    esi,ecx
  809621:	48 89 c7             	mov    rdi,rax
  809624:	e8 48 f7 ff ff       	call   808d71 <DISK1_FAT32_write_FAT_Entry>
			cluster = next_cluster;
  809629:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80962d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			flags = 1;
  809631:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  809638:	00 
		}

	}while(index);
  809639:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  80963d:	0f 85 d2 fd ff ff    	jne    809415 <FAT32_write+0x1a3>
  809643:	eb 01                	jmp    809646 <FAT32_write+0x3d4>
			break;
  809645:	90                   	nop

	if(*position > filp->dentry->dir_inode->file_size)
  809646:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80964d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809650:	48 89 c2             	mov    rdx,rax
  809653:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809657:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80965b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80965f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809662:	48 39 c2             	cmp    rdx,rax
  809665:	76 42                	jbe    8096a9 <FAT32_write+0x437>
	{
		filp->dentry->dir_inode->file_size = *position;
  809667:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80966e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809671:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809675:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809679:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80967d:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  809680:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809684:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809688:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80968c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809690:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  809694:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  809698:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80969c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8096a0:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8096a4:	48 89 c7             	mov    rdi,rax
  8096a7:	ff d2                	call   rdx
	}

	vmfree(buffer);
  8096a9:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8096ad:	48 89 c7             	mov    rdi,rax
  8096b0:	e8 a4 7c ff ff       	call   801359 <vmfree>
	if(!index)
  8096b5:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  8096b9:	75 0b                	jne    8096c6 <FAT32_write+0x454>
		retval = count;
  8096bb:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8096c2:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	return retval;
  8096c6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  8096ca:	c9                   	leave  
  8096cb:	c3                   	ret    

00000000008096cc <FAT32_lseek>:


long FAT32_lseek(struct file * filp,long offset,long origin)
{
  8096cc:	f3 0f 1e fa          	endbr64 
  8096d0:	55                   	push   rbp
  8096d1:	48 89 e5             	mov    rbp,rsp
  8096d4:	48 83 ec 30          	sub    rsp,0x30
  8096d8:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8096dc:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8096e0:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	struct index_node *inode = filp->dentry->dir_inode;
  8096e4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8096e8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8096ec:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8096f0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	long pos = 0;
  8096f4:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8096fb:	00 

	switch(origin)
  8096fc:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  809701:	74 21                	je     809724 <FAT32_lseek+0x58>
  809703:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  809708:	7f 4a                	jg     809754 <FAT32_lseek+0x88>
  80970a:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80970f:	74 09                	je     80971a <FAT32_lseek+0x4e>
  809711:	48 83 7d d8 01       	cmp    QWORD PTR [rbp-0x28],0x1
  809716:	74 20                	je     809738 <FAT32_lseek+0x6c>
  809718:	eb 3a                	jmp    809754 <FAT32_lseek+0x88>
	{
		case SEEK_SET:
				pos = offset;
  80971a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80971e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  809722:	eb 39                	jmp    80975d <FAT32_lseek+0x91>

		case SEEK_CUR:
				pos =  filp->position + offset;
  809724:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809728:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80972b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80972f:	48 01 d0             	add    rax,rdx
  809732:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  809736:	eb 25                	jmp    80975d <FAT32_lseek+0x91>

		case SEEK_END:
				pos = filp->dentry->dir_inode->file_size + offset;
  809738:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80973c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809740:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809744:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809747:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80974b:	48 01 d0             	add    rax,rdx
  80974e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  809752:	eb 09                	jmp    80975d <FAT32_lseek+0x91>

		default:
			return -EINVAL;
  809754:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  80975b:	eb 50                	jmp    8097ad <FAT32_lseek+0xe1>
			break;
	}

	if(pos < 0 || pos > filp->dentry->dir_inode->file_size)
  80975d:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  809762:	78 18                	js     80977c <FAT32_lseek+0xb0>
  809764:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809768:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80976c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809770:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809773:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809777:	48 39 c2             	cmp    rdx,rax
  80977a:	73 09                	jae    809785 <FAT32_lseek+0xb9>
		return -EOVERFLOW;
  80977c:	48 c7 c0 bf ff ff ff 	mov    rax,0xffffffffffffffbf
  809783:	eb 28                	jmp    8097ad <FAT32_lseek+0xe1>

	filp->position = pos;
  809785:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809789:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80978d:	48 89 10             	mov    QWORD PTR [rax],rdx
	printf("FAT32 FS(lseek) alert position:%d\n",filp->position);
  809790:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809794:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809797:	48 89 c6             	mov    rsi,rax
  80979a:	bf 98 45 81 00       	mov    edi,0x814598
  80979f:	b8 00 00 00 00       	mov    eax,0x0
  8097a4:	e8 8f 75 ff ff       	call   800d38 <printf>

	return pos;
  8097a9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  8097ad:	c9                   	leave  
  8097ae:	c3                   	ret    

00000000008097af <FAT32_ioctl>:


long FAT32_ioctl(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg)
{}
  8097af:	f3 0f 1e fa          	endbr64 
  8097b3:	55                   	push   rbp
  8097b4:	48 89 e5             	mov    rbp,rsp
  8097b7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8097bb:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8097bf:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  8097c3:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  8097c7:	90                   	nop
  8097c8:	5d                   	pop    rbp
  8097c9:	c3                   	ret    

00000000008097ca <FAT32_readdir>:

long FAT32_readdir(struct file * filp,void * dirent,filldir_t filler)
{
  8097ca:	f3 0f 1e fa          	endbr64 
  8097ce:	55                   	push   rbp
  8097cf:	48 89 e5             	mov    rbp,rsp
  8097d2:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  8097d6:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  8097da:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  8097de:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  8097e2:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8097e6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8097ea:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8097ee:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8097f2:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  8097f6:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8097fa:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8097fe:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809802:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809806:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80980a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned int cluster = 0;
  80980e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  809815:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  80981c:	00 
	unsigned char * buf =NULL; 
  80981d:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
  809824:	00 
	char *name = NULL;
  809825:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80982c:	00 
	int namelen = 0;
  80982d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
	int i = 0,j = 0,x = 0,y = 0;
  809834:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  80983b:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
  809842:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  809849:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  809850:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  809857:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  809858:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  80985f:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  809860:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809864:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809868:	be 00 00 00 00       	mov    esi,0x0
  80986d:	48 89 c7             	mov    rdi,rax
  809870:	b8 00 00 00 00       	mov    eax,0x0
  809875:	e8 50 7a ff ff       	call   8012ca <vmalloc>
  80987a:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax

	cluster = finode->first_cluster;
  80987e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809882:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809885:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

	j = filp->position/fsbi->bytes_per_cluster;
  809888:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80988c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80988f:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  809893:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  809897:	48 99                	cqo    
  809899:	48 f7 fe             	idiv   rsi
  80989c:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	
	for(i = 0;i<j;i++)
  80989f:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  8098a6:	eb 3a                	jmp    8098e2 <FAT32_readdir+0x118>
	{
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  8098a8:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8098ab:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8098af:	89 d6                	mov    esi,edx
  8098b1:	48 89 c7             	mov    rdi,rax
  8098b4:	e8 fc f3 ff ff       	call   808cb5 <DISK1_FAT32_read_FAT_Entry>
  8098b9:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
		if(cluster > 0x0ffffff7)
  8098bc:	81 7d fc f7 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff7
  8098c3:	76 19                	jbe    8098de <FAT32_readdir+0x114>
		{
			printf("FAT32 FS(readdir) cluster didn`t exist\n");
  8098c5:	bf c0 45 81 00       	mov    edi,0x8145c0
  8098ca:	b8 00 00 00 00       	mov    eax,0x0
  8098cf:	e8 64 74 ff ff       	call   800d38 <printf>
			return NULL;
  8098d4:	b8 00 00 00 00       	mov    eax,0x0
  8098d9:	e9 86 05 00 00       	jmp    809e64 <FAT32_readdir+0x69a>
	for(i = 0;i<j;i++)
  8098de:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  8098e2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8098e5:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  8098e8:	7c be                	jl     8098a8 <FAT32_readdir+0xde>
		}
	}

next_cluster:
  8098ea:	90                   	nop
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  8098eb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8098ef:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  8098f3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8098f6:	83 e8 02             	sub    eax,0x2
  8098f9:	89 c1                	mov    ecx,eax
  8098fb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8098ff:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809903:	48 0f af c1          	imul   rax,rcx
  809907:	48 01 d0             	add    rax,rdx
  80990a:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80990e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809912:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809916:	89 c1                	mov    ecx,eax
  809918:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80991c:	89 c2                	mov    edx,eax
  80991e:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  809922:	49 89 c0             	mov    r8,rax
  809925:	be 00 00 00 00       	mov    esi,0x0
  80992a:	bf 00 00 00 00       	mov    edi,0x0
  80992f:	e8 f7 e6 ff ff       	call   80802b <request>
  809934:	89 45 a4             	mov    DWORD PTR [rbp-0x5c],eax
    if(!chk_result(r))
  809937:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  80993a:	89 c7                	mov    edi,eax
  80993c:	e8 9e ed ff ff       	call   8086df <chk_result>
  809941:	85 c0                	test   eax,eax
  809943:	75 25                	jne    80996a <FAT32_readdir+0x1a0>
	{
		printf("FAT32 FS(readdir) read disk ERROR!!!!!!!!!!\n");
  809945:	bf e8 45 81 00       	mov    edi,0x8145e8
  80994a:	b8 00 00 00 00       	mov    eax,0x0
  80994f:	e8 e4 73 ff ff       	call   800d38 <printf>
		vmfree(buf);
  809954:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  809958:	48 89 c7             	mov    rdi,rax
  80995b:	e8 f9 79 ff ff       	call   801359 <vmfree>
		return NULL;
  809960:	b8 00 00 00 00       	mov    eax,0x0
  809965:	e9 fa 04 00 00       	jmp    809e64 <FAT32_readdir+0x69a>
	}

	tmpdentry = (struct FAT32_Directory *)(buf + filp->position%fsbi->bytes_per_cluster);
  80996a:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80996e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809971:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  809975:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  809979:	48 99                	cqo    
  80997b:	48 f7 f9             	idiv   rcx
  80997e:	48 89 d0             	mov    rax,rdx
  809981:	48 89 c2             	mov    rdx,rax
  809984:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  809988:	48 01 d0             	add    rax,rdx
  80998b:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  80998f:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809993:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809996:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80999a:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  80999e:	48 99                	cqo    
  8099a0:	48 f7 f9             	idiv   rcx
  8099a3:	48 89 d0             	mov    rax,rdx
  8099a6:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  8099a9:	e9 2f 04 00 00       	jmp    809ddd <FAT32_readdir+0x613>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  8099ae:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8099b2:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  8099b6:	3c 0f                	cmp    al,0xf
  8099b8:	0f 84 00 04 00 00    	je     809dbe <FAT32_readdir+0x5f4>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  8099be:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8099c2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8099c5:	3c e5                	cmp    al,0xe5
  8099c7:	0f 84 f4 03 00 00    	je     809dc1 <FAT32_readdir+0x5f7>
  8099cd:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8099d1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8099d4:	84 c0                	test   al,al
  8099d6:	0f 84 e5 03 00 00    	je     809dc1 <FAT32_readdir+0x5f7>
  8099dc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8099e0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8099e3:	3c 05                	cmp    al,0x5
  8099e5:	0f 84 d6 03 00 00    	je     809dc1 <FAT32_readdir+0x5f7>
			continue;

		namelen = 0;
  8099eb:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  8099f2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8099f6:	48 83 e8 20          	sub    rax,0x20
  8099fa:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

		if(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  8099fe:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809a02:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809a06:	3c 0f                	cmp    al,0xf
  809a08:	0f 85 2a 02 00 00    	jne    809c38 <FAT32_readdir+0x46e>
  809a0e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809a12:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809a15:	3c e5                	cmp    al,0xe5
  809a17:	0f 84 1b 02 00 00    	je     809c38 <FAT32_readdir+0x46e>
  809a1d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809a21:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809a24:	84 c0                	test   al,al
  809a26:	0f 84 0c 02 00 00    	je     809c38 <FAT32_readdir+0x46e>
  809a2c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809a30:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809a33:	3c 05                	cmp    al,0x5
  809a35:	0f 84 fd 01 00 00    	je     809c38 <FAT32_readdir+0x46e>
		{
			j = 0;
  809a3b:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
			//long file/dir name read
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  809a42:	eb 1a                	jmp    809a5e <FAT32_readdir+0x294>
			{
				j++;
  809a44:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
				if(tmpldentry->LDIR_Ord & 0x40)
  809a48:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809a4c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809a4f:	0f b6 c0             	movzx  eax,al
  809a52:	83 e0 40             	and    eax,0x40
  809a55:	85 c0                	test   eax,eax
  809a57:	75 34                	jne    809a8d <FAT32_readdir+0x2c3>
					break;
				tmpldentry --;
  809a59:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  809a5e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809a62:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809a66:	3c 0f                	cmp    al,0xf
  809a68:	75 24                	jne    809a8e <FAT32_readdir+0x2c4>
  809a6a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809a6e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809a71:	3c e5                	cmp    al,0xe5
  809a73:	74 19                	je     809a8e <FAT32_readdir+0x2c4>
  809a75:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809a79:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809a7c:	84 c0                	test   al,al
  809a7e:	74 0e                	je     809a8e <FAT32_readdir+0x2c4>
  809a80:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809a84:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809a87:	3c 05                	cmp    al,0x5
  809a89:	75 b9                	jne    809a44 <FAT32_readdir+0x27a>
  809a8b:	eb 01                	jmp    809a8e <FAT32_readdir+0x2c4>
					break;
  809a8d:	90                   	nop
			}

			name = vmalloc(j*13+1,0);
  809a8e:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  809a91:	89 d0                	mov    eax,edx
  809a93:	01 c0                	add    eax,eax
  809a95:	01 d0                	add    eax,edx
  809a97:	c1 e0 02             	shl    eax,0x2
  809a9a:	01 d0                	add    eax,edx
  809a9c:	83 c0 01             	add    eax,0x1
  809a9f:	be 00 00 00 00       	mov    esi,0x0
  809aa4:	89 c7                	mov    edi,eax
  809aa6:	b8 00 00 00 00       	mov    eax,0x0
  809aab:	e8 1a 78 ff ff       	call   8012ca <vmalloc>
  809ab0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
			memset(name,0,j*13+1);
  809ab4:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  809ab7:	89 d0                	mov    eax,edx
  809ab9:	01 c0                	add    eax,eax
  809abb:	01 d0                	add    eax,edx
  809abd:	c1 e0 02             	shl    eax,0x2
  809ac0:	01 d0                	add    eax,edx
  809ac2:	83 c0 01             	add    eax,0x1
  809ac5:	89 c2                	mov    edx,eax
  809ac7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809acb:	be 00 00 00 00       	mov    esi,0x0
  809ad0:	48 89 c7             	mov    rdi,rax
  809ad3:	e8 78 20 00 00       	call   80bb50 <memset>
			tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  809ad8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809adc:	48 83 e8 20          	sub    rax,0x20
  809ae0:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

			for(x = 0;x<j;x++,tmpldentry --)
  809ae4:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  809aeb:	e9 37 01 00 00       	jmp    809c27 <FAT32_readdir+0x45d>
			{
				for(y = 0;y<5;y++)
  809af0:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  809af7:	eb 53                	jmp    809b4c <FAT32_readdir+0x382>
					if(tmpldentry->LDIR_Name1[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  809af9:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809afd:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809b00:	48 63 d2             	movsxd rdx,edx
  809b03:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  809b08:	66 83 f8 ff          	cmp    ax,0xffff
  809b0c:	74 3a                	je     809b48 <FAT32_readdir+0x37e>
  809b0e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809b12:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809b15:	48 63 d2             	movsxd rdx,edx
  809b18:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  809b1d:	66 85 c0             	test   ax,ax
  809b20:	74 26                	je     809b48 <FAT32_readdir+0x37e>
						name[namelen++] = (char)tmpldentry->LDIR_Name1[y];
  809b22:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809b26:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809b29:	48 63 d2             	movsxd rdx,edx
  809b2c:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  809b31:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809b34:	8d 50 01             	lea    edx,[rax+0x1]
  809b37:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809b3a:	48 63 d0             	movsxd rdx,eax
  809b3d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809b41:	48 01 d0             	add    rax,rdx
  809b44:	89 ca                	mov    edx,ecx
  809b46:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<5;y++)
  809b48:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  809b4c:	83 7d dc 04          	cmp    DWORD PTR [rbp-0x24],0x4
  809b50:	7e a7                	jle    809af9 <FAT32_readdir+0x32f>

				for(y = 0;y<6;y++)
  809b52:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  809b59:	eb 53                	jmp    809bae <FAT32_readdir+0x3e4>
					if(tmpldentry->LDIR_Name2[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  809b5b:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809b5f:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809b62:	48 63 d2             	movsxd rdx,edx
  809b65:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  809b6a:	66 83 f8 ff          	cmp    ax,0xffff
  809b6e:	74 3a                	je     809baa <FAT32_readdir+0x3e0>
  809b70:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809b74:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809b77:	48 63 d2             	movsxd rdx,edx
  809b7a:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  809b7f:	66 85 c0             	test   ax,ax
  809b82:	74 26                	je     809baa <FAT32_readdir+0x3e0>
						name[namelen++] = (char)tmpldentry->LDIR_Name2[y];
  809b84:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809b88:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809b8b:	48 63 d2             	movsxd rdx,edx
  809b8e:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  809b93:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809b96:	8d 50 01             	lea    edx,[rax+0x1]
  809b99:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809b9c:	48 63 d0             	movsxd rdx,eax
  809b9f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809ba3:	48 01 d0             	add    rax,rdx
  809ba6:	89 ca                	mov    edx,ecx
  809ba8:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<6;y++)
  809baa:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  809bae:	83 7d dc 05          	cmp    DWORD PTR [rbp-0x24],0x5
  809bb2:	7e a7                	jle    809b5b <FAT32_readdir+0x391>

				for(y = 0;y<2;y++)
  809bb4:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  809bbb:	eb 5b                	jmp    809c18 <FAT32_readdir+0x44e>
					if(tmpldentry->LDIR_Name3[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  809bbd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809bc1:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809bc4:	48 63 d2             	movsxd rdx,edx
  809bc7:	48 83 c2 08          	add    rdx,0x8
  809bcb:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  809bd0:	66 83 f8 ff          	cmp    ax,0xffff
  809bd4:	74 3e                	je     809c14 <FAT32_readdir+0x44a>
  809bd6:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809bda:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809bdd:	48 63 d2             	movsxd rdx,edx
  809be0:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  809be5:	66 85 c0             	test   ax,ax
  809be8:	74 2a                	je     809c14 <FAT32_readdir+0x44a>
						name[namelen++] = (char)tmpldentry->LDIR_Name3[y];
  809bea:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809bee:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809bf1:	48 63 d2             	movsxd rdx,edx
  809bf4:	48 83 c2 08          	add    rdx,0x8
  809bf8:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  809bfd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809c00:	8d 50 01             	lea    edx,[rax+0x1]
  809c03:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809c06:	48 63 d0             	movsxd rdx,eax
  809c09:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809c0d:	48 01 d0             	add    rax,rdx
  809c10:	89 ca                	mov    edx,ecx
  809c12:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<2;y++)
  809c14:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  809c18:	83 7d dc 01          	cmp    DWORD PTR [rbp-0x24],0x1
  809c1c:	7e 9f                	jle    809bbd <FAT32_readdir+0x3f3>
			for(x = 0;x<j;x++,tmpldentry --)
  809c1e:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  809c22:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
  809c27:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809c2a:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  809c2d:	0f 8c bd fe ff ff    	jl     809af0 <FAT32_readdir+0x326>
			}
			goto find_lookup_success;
  809c33:	e9 f5 01 00 00       	jmp    809e2d <FAT32_readdir+0x663>
		}

		name = vmalloc(15,0);
  809c38:	be 00 00 00 00       	mov    esi,0x0
  809c3d:	bf 0f 00 00 00       	mov    edi,0xf
  809c42:	b8 00 00 00 00       	mov    eax,0x0
  809c47:	e8 7e 76 ff ff       	call   8012ca <vmalloc>
  809c4c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
		memset(name,0,15);
  809c50:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809c54:	ba 0f 00 00 00       	mov    edx,0xf
  809c59:	be 00 00 00 00       	mov    esi,0x0
  809c5e:	48 89 c7             	mov    rdi,rax
  809c61:	e8 ea 1e 00 00       	call   80bb50 <memset>
		//short file/dir base name compare
		for(x=0;x<8;x++)
  809c66:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  809c6d:	eb 74                	jmp    809ce3 <FAT32_readdir+0x519>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  809c6f:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809c73:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809c76:	48 98                	cdqe   
  809c78:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809c7c:	3c 20                	cmp    al,0x20
  809c7e:	74 6b                	je     809ceb <FAT32_readdir+0x521>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  809c80:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809c84:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  809c88:	0f b6 c0             	movzx  eax,al
  809c8b:	83 e0 08             	and    eax,0x8
  809c8e:	85 c0                	test   eax,eax
  809c90:	74 29                	je     809cbb <FAT32_readdir+0x4f1>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  809c92:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809c96:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809c99:	48 98                	cdqe   
  809c9b:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809c9f:	8d 48 20             	lea    ecx,[rax+0x20]
  809ca2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809ca5:	8d 50 01             	lea    edx,[rax+0x1]
  809ca8:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809cab:	48 63 d0             	movsxd rdx,eax
  809cae:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809cb2:	48 01 d0             	add    rax,rdx
  809cb5:	89 ca                	mov    edx,ecx
  809cb7:	88 10                	mov    BYTE PTR [rax],dl
  809cb9:	eb 24                	jmp    809cdf <FAT32_readdir+0x515>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  809cbb:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809cbf:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809cc2:	48 98                	cdqe   
  809cc4:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  809cc8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809ccb:	8d 50 01             	lea    edx,[rax+0x1]
  809cce:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809cd1:	48 63 d0             	movsxd rdx,eax
  809cd4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809cd8:	48 01 d0             	add    rax,rdx
  809cdb:	89 ca                	mov    edx,ecx
  809cdd:	88 10                	mov    BYTE PTR [rax],dl
		for(x=0;x<8;x++)
  809cdf:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  809ce3:	83 7d e0 07          	cmp    DWORD PTR [rbp-0x20],0x7
  809ce7:	7e 86                	jle    809c6f <FAT32_readdir+0x4a5>
  809ce9:	eb 01                	jmp    809cec <FAT32_readdir+0x522>
				break;
  809ceb:	90                   	nop
		}

		if(tmpdentry->DIR_Attr & ATTR_DIRECTORY)
  809cec:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809cf0:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809cf4:	0f b6 c0             	movzx  eax,al
  809cf7:	83 e0 10             	and    eax,0x10
  809cfa:	85 c0                	test   eax,eax
  809cfc:	0f 85 27 01 00 00    	jne    809e29 <FAT32_readdir+0x65f>
			goto find_lookup_success;

		name[namelen++] = '.';
  809d02:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809d05:	8d 50 01             	lea    edx,[rax+0x1]
  809d08:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809d0b:	48 63 d0             	movsxd rdx,eax
  809d0e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809d12:	48 01 d0             	add    rax,rdx
  809d15:	c6 00 2e             	mov    BYTE PTR [rax],0x2e

		//short file ext name compare
		for(x=8;x<11;x++)
  809d18:	c7 45 e0 08 00 00 00 	mov    DWORD PTR [rbp-0x20],0x8
  809d1f:	eb 74                	jmp    809d95 <FAT32_readdir+0x5cb>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  809d21:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809d25:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809d28:	48 98                	cdqe   
  809d2a:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809d2e:	3c 20                	cmp    al,0x20
  809d30:	74 6b                	je     809d9d <FAT32_readdir+0x5d3>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  809d32:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809d36:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  809d3a:	0f b6 c0             	movzx  eax,al
  809d3d:	83 e0 10             	and    eax,0x10
  809d40:	85 c0                	test   eax,eax
  809d42:	74 29                	je     809d6d <FAT32_readdir+0x5a3>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  809d44:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809d48:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809d4b:	48 98                	cdqe   
  809d4d:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809d51:	8d 48 20             	lea    ecx,[rax+0x20]
  809d54:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809d57:	8d 50 01             	lea    edx,[rax+0x1]
  809d5a:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809d5d:	48 63 d0             	movsxd rdx,eax
  809d60:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809d64:	48 01 d0             	add    rax,rdx
  809d67:	89 ca                	mov    edx,ecx
  809d69:	88 10                	mov    BYTE PTR [rax],dl
  809d6b:	eb 24                	jmp    809d91 <FAT32_readdir+0x5c7>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  809d6d:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809d71:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809d74:	48 98                	cdqe   
  809d76:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  809d7a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809d7d:	8d 50 01             	lea    edx,[rax+0x1]
  809d80:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809d83:	48 63 d0             	movsxd rdx,eax
  809d86:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809d8a:	48 01 d0             	add    rax,rdx
  809d8d:	89 ca                	mov    edx,ecx
  809d8f:	88 10                	mov    BYTE PTR [rax],dl
		for(x=8;x<11;x++)
  809d91:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  809d95:	83 7d e0 0a          	cmp    DWORD PTR [rbp-0x20],0xa
  809d99:	7e 86                	jle    809d21 <FAT32_readdir+0x557>
  809d9b:	eb 01                	jmp    809d9e <FAT32_readdir+0x5d4>
				break;
  809d9d:	90                   	nop
		}
		if(x == 8)
  809d9e:	83 7d e0 08          	cmp    DWORD PTR [rbp-0x20],0x8
  809da2:	0f 85 84 00 00 00    	jne    809e2c <FAT32_readdir+0x662>
			name[--namelen] = 0;
  809da8:	83 6d ec 01          	sub    DWORD PTR [rbp-0x14],0x1
  809dac:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809daf:	48 63 d0             	movsxd rdx,eax
  809db2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809db6:	48 01 d0             	add    rax,rdx
  809db9:	c6 00 00             	mov    BYTE PTR [rax],0x0
		goto find_lookup_success;
  809dbc:	eb 6e                	jmp    809e2c <FAT32_readdir+0x662>
			continue;
  809dbe:	90                   	nop
  809dbf:	eb 01                	jmp    809dc2 <FAT32_readdir+0x5f8>
			continue;
  809dc1:	90                   	nop
	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  809dc2:	83 45 e8 20          	add    DWORD PTR [rbp-0x18],0x20
  809dc6:	48 83 45 d0 20       	add    QWORD PTR [rbp-0x30],0x20
  809dcb:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809dcf:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809dd2:	48 8d 50 20          	lea    rdx,[rax+0x20]
  809dd6:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809dda:	48 89 10             	mov    QWORD PTR [rax],rdx
  809ddd:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809de0:	48 63 d0             	movsxd rdx,eax
  809de3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809de7:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809deb:	48 39 c2             	cmp    rdx,rax
  809dee:	0f 8c ba fb ff ff    	jl     8099ae <FAT32_readdir+0x1e4>
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  809df4:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  809df7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809dfb:	89 d6                	mov    esi,edx
  809dfd:	48 89 c7             	mov    rdi,rax
  809e00:	e8 b0 ee ff ff       	call   808cb5 <DISK1_FAT32_read_FAT_Entry>
  809e05:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  809e08:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  809e0f:	77 05                	ja     809e16 <FAT32_readdir+0x64c>
		goto next_cluster;
  809e11:	e9 d5 fa ff ff       	jmp    8098eb <FAT32_readdir+0x121>

	vmfree(buf);
  809e16:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  809e1a:	48 89 c7             	mov    rdi,rax
  809e1d:	e8 37 75 ff ff       	call   801359 <vmfree>
	return NULL;
  809e22:	b8 00 00 00 00       	mov    eax,0x0
  809e27:	eb 3b                	jmp    809e64 <FAT32_readdir+0x69a>
			goto find_lookup_success;
  809e29:	90                   	nop
  809e2a:	eb 01                	jmp    809e2d <FAT32_readdir+0x663>
		goto find_lookup_success;
  809e2c:	90                   	nop

find_lookup_success:

	filp->position += 32;
  809e2d:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809e31:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809e34:	48 8d 50 20          	lea    rdx,[rax+0x20]
  809e38:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809e3c:	48 89 10             	mov    QWORD PTR [rax],rdx
	return filler(dirent,name,namelen,0,0);
  809e3f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809e42:	48 63 d0             	movsxd rdx,eax
  809e45:	48 8b 75 f0          	mov    rsi,QWORD PTR [rbp-0x10]
  809e49:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  809e4d:	4c 8b 4d 88          	mov    r9,QWORD PTR [rbp-0x78]
  809e51:	41 b8 00 00 00 00    	mov    r8d,0x0
  809e57:	b9 00 00 00 00       	mov    ecx,0x0
  809e5c:	48 89 c7             	mov    rdi,rax
  809e5f:	41 ff d1             	call   r9
  809e62:	48 98                	cdqe   
}
  809e64:	c9                   	leave  
  809e65:	c3                   	ret    

0000000000809e66 <FAT32_create>:
	.readdir = FAT32_readdir,
};


long FAT32_create(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  809e66:	f3 0f 1e fa          	endbr64 
  809e6a:	55                   	push   rbp
  809e6b:	48 89 e5             	mov    rbp,rsp
  809e6e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809e72:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  809e76:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809e79:	90                   	nop
  809e7a:	5d                   	pop    rbp
  809e7b:	c3                   	ret    

0000000000809e7c <FAT32_lookup>:


struct dir_entry * FAT32_lookup(struct index_node * parent_inode,struct dir_entry * dest_dentry)
{
  809e7c:	f3 0f 1e fa          	endbr64 
  809e80:	55                   	push   rbp
  809e81:	48 89 e5             	mov    rbp,rsp
  809e84:	48 83 ec 60          	sub    rsp,0x60
  809e88:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  809e8c:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
	struct FAT32_inode_info * finode = parent_inode->private_index_info;
  809e90:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  809e94:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809e98:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	struct FAT32_sb_info * fsbi = parent_inode->sb->private_sb_info;
  809e9c:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  809ea0:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809ea4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809ea8:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	unsigned int cluster = 0;
  809eac:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  809eb3:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  809eba:	00 
	unsigned char * buf =NULL; 
  809ebb:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  809ec2:	00 
	int i = 0,j = 0,x = 0;
  809ec3:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  809eca:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  809ed1:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  809ed8:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  809edf:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  809ee0:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  809ee7:	00 
	struct index_node * p = NULL;
  809ee8:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  809eef:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  809ef0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809ef4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809ef8:	be 00 00 00 00       	mov    esi,0x0
  809efd:	48 89 c7             	mov    rdi,rax
  809f00:	b8 00 00 00 00       	mov    eax,0x0
  809f05:	e8 c0 73 ff ff       	call   8012ca <vmalloc>
  809f0a:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax

	cluster = finode->first_cluster;
  809f0e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809f12:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809f15:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

next_cluster:
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  809f18:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809f1c:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  809f20:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809f23:	83 e8 02             	sub    eax,0x2
  809f26:	89 c1                	mov    ecx,eax
  809f28:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809f2c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809f30:	48 0f af c1          	imul   rax,rcx
  809f34:	48 01 d0             	add    rax,rdx
  809f37:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
	printf("lookup cluster:%#010x,sector:%x\n",cluster,sector);
  809f3b:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  809f3f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809f42:	89 c6                	mov    esi,eax
  809f44:	bf 18 46 81 00       	mov    edi,0x814618
  809f49:	b8 00 00 00 00       	mov    eax,0x0
  809f4e:	e8 e5 6d ff ff       	call   800d38 <printf>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  809f53:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809f57:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809f5b:	89 c1                	mov    ecx,eax
  809f5d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809f61:	89 c2                	mov    edx,eax
  809f63:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809f67:	49 89 c0             	mov    r8,rax
  809f6a:	be 00 00 00 00       	mov    esi,0x0
  809f6f:	bf 00 00 00 00       	mov    edi,0x0
  809f74:	e8 b2 e0 ff ff       	call   80802b <request>
  809f79:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    if(!chk_result(r))
  809f7c:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  809f7f:	89 c7                	mov    edi,eax
  809f81:	e8 59 e7 ff ff       	call   8086df <chk_result>
  809f86:	85 c0                	test   eax,eax
  809f88:	75 25                	jne    809faf <FAT32_lookup+0x133>
	{
		printf("FAT32 FS(lookup) read disk ERROR!!!!!!!!!!\n");
  809f8a:	bf 40 46 81 00       	mov    edi,0x814640
  809f8f:	b8 00 00 00 00       	mov    eax,0x0
  809f94:	e8 9f 6d ff ff       	call   800d38 <printf>
		vmfree(buf);
  809f99:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809f9d:	48 89 c7             	mov    rdi,rax
  809fa0:	e8 b4 73 ff ff       	call   801359 <vmfree>
		return NULL;
  809fa5:	b8 00 00 00 00       	mov    eax,0x0
  809faa:	e9 f0 07 00 00       	jmp    80a79f <FAT32_lookup+0x923>
	}

	tmpdentry = (struct FAT32_Directory *)buf;
  809faf:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809fb3:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax

	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  809fb7:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  809fbe:	e9 9d 05 00 00       	jmp    80a560 <FAT32_lookup+0x6e4>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  809fc3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809fc7:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809fcb:	3c 0f                	cmp    al,0xf
  809fcd:	0f 84 59 05 00 00    	je     80a52c <FAT32_lookup+0x6b0>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  809fd3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809fd7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809fda:	3c e5                	cmp    al,0xe5
  809fdc:	0f 84 4d 05 00 00    	je     80a52f <FAT32_lookup+0x6b3>
  809fe2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809fe6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809fe9:	84 c0                	test   al,al
  809feb:	0f 84 3e 05 00 00    	je     80a52f <FAT32_lookup+0x6b3>
  809ff1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809ff5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809ff8:	3c 05                	cmp    al,0x5
  809ffa:	0f 84 2f 05 00 00    	je     80a52f <FAT32_lookup+0x6b3>
			continue;

		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  80a000:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a004:	48 83 e8 20          	sub    rax,0x20
  80a008:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
		j = 0;
  80a00c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0

		//long file/dir name compare
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  80a013:	e9 88 01 00 00       	jmp    80a1a0 <FAT32_lookup+0x324>
		{
			for(x=0;x<5;x++)
  80a018:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80a01f:	eb 6a                	jmp    80a08b <FAT32_lookup+0x20f>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name1[x] == 0xffff)
  80a021:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a025:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a028:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a02b:	7e 15                	jle    80a042 <FAT32_lookup+0x1c6>
  80a02d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a031:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80a034:	48 63 d2             	movsxd rdx,edx
  80a037:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80a03c:	66 83 f8 ff          	cmp    ax,0xffff
  80a040:	74 44                	je     80a086 <FAT32_lookup+0x20a>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name1[x] != (unsigned short)(dest_dentry->name[j++]))
  80a042:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a046:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a049:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a04c:	0f 8f e0 04 00 00    	jg     80a532 <FAT32_lookup+0x6b6>
  80a052:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a056:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80a059:	48 63 d2             	movsxd rdx,edx
  80a05c:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  80a061:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a065:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  80a068:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a06b:	8d 50 01             	lea    edx,[rax+0x1]
  80a06e:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  80a071:	48 98                	cdqe   
  80a073:	48 01 f0             	add    rax,rsi
  80a076:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a079:	66 98                	cbw    
  80a07b:	66 39 c1             	cmp    cx,ax
  80a07e:	0f 85 ae 04 00 00    	jne    80a532 <FAT32_lookup+0x6b6>
  80a084:	eb 01                	jmp    80a087 <FAT32_lookup+0x20b>
					continue;
  80a086:	90                   	nop
			for(x=0;x<5;x++)
  80a087:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80a08b:	83 7d f0 04          	cmp    DWORD PTR [rbp-0x10],0x4
  80a08f:	7e 90                	jle    80a021 <FAT32_lookup+0x1a5>
					goto continue_cmp_fail;
			}
			for(x=0;x<6;x++)
  80a091:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80a098:	eb 6a                	jmp    80a104 <FAT32_lookup+0x288>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name2[x] == 0xffff)
  80a09a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a09e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a0a1:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a0a4:	7e 15                	jle    80a0bb <FAT32_lookup+0x23f>
  80a0a6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a0aa:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80a0ad:	48 63 d2             	movsxd rdx,edx
  80a0b0:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  80a0b5:	66 83 f8 ff          	cmp    ax,0xffff
  80a0b9:	74 44                	je     80a0ff <FAT32_lookup+0x283>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name2[x] != (unsigned short)(dest_dentry->name[j++]))
  80a0bb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a0bf:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a0c2:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a0c5:	0f 8f 6a 04 00 00    	jg     80a535 <FAT32_lookup+0x6b9>
  80a0cb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a0cf:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80a0d2:	48 63 d2             	movsxd rdx,edx
  80a0d5:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  80a0da:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a0de:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  80a0e1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a0e4:	8d 50 01             	lea    edx,[rax+0x1]
  80a0e7:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  80a0ea:	48 98                	cdqe   
  80a0ec:	48 01 f0             	add    rax,rsi
  80a0ef:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a0f2:	66 98                	cbw    
  80a0f4:	66 39 c1             	cmp    cx,ax
  80a0f7:	0f 85 38 04 00 00    	jne    80a535 <FAT32_lookup+0x6b9>
  80a0fd:	eb 01                	jmp    80a100 <FAT32_lookup+0x284>
					continue;
  80a0ff:	90                   	nop
			for(x=0;x<6;x++)
  80a100:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80a104:	83 7d f0 05          	cmp    DWORD PTR [rbp-0x10],0x5
  80a108:	7e 90                	jle    80a09a <FAT32_lookup+0x21e>
					goto continue_cmp_fail;
			}
			for(x=0;x<2;x++)
  80a10a:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80a111:	eb 72                	jmp    80a185 <FAT32_lookup+0x309>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name3[x] == 0xffff)
  80a113:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a117:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a11a:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a11d:	7e 19                	jle    80a138 <FAT32_lookup+0x2bc>
  80a11f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a123:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80a126:	48 63 d2             	movsxd rdx,edx
  80a129:	48 83 c2 08          	add    rdx,0x8
  80a12d:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  80a132:	66 83 f8 ff          	cmp    ax,0xffff
  80a136:	74 48                	je     80a180 <FAT32_lookup+0x304>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name3[x] != (unsigned short)(dest_dentry->name[j++]))
  80a138:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a13c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a13f:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a142:	0f 8f f0 03 00 00    	jg     80a538 <FAT32_lookup+0x6bc>
  80a148:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a14c:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80a14f:	48 63 d2             	movsxd rdx,edx
  80a152:	48 83 c2 08          	add    rdx,0x8
  80a156:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  80a15b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a15f:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  80a162:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a165:	8d 50 01             	lea    edx,[rax+0x1]
  80a168:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  80a16b:	48 98                	cdqe   
  80a16d:	48 01 f0             	add    rax,rsi
  80a170:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a173:	66 98                	cbw    
  80a175:	66 39 c1             	cmp    cx,ax
  80a178:	0f 85 ba 03 00 00    	jne    80a538 <FAT32_lookup+0x6bc>
  80a17e:	eb 01                	jmp    80a181 <FAT32_lookup+0x305>
					continue;
  80a180:	90                   	nop
			for(x=0;x<2;x++)
  80a181:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80a185:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  80a189:	7e 88                	jle    80a113 <FAT32_lookup+0x297>
					goto continue_cmp_fail;
			}

			if(j >= dest_dentry->name_length)
  80a18b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a18f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a192:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a195:	0f 8d 14 04 00 00    	jge    80a5af <FAT32_lookup+0x733>
			{
				goto find_lookup_success;
			}

			tmpldentry --;
  80a19b:	48 83 6d e0 20       	sub    QWORD PTR [rbp-0x20],0x20
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  80a1a0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a1a4:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80a1a8:	3c 0f                	cmp    al,0xf
  80a1aa:	75 0f                	jne    80a1bb <FAT32_lookup+0x33f>
  80a1ac:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a1b0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a1b3:	3c e5                	cmp    al,0xe5
  80a1b5:	0f 85 5d fe ff ff    	jne    80a018 <FAT32_lookup+0x19c>
		}

		//short file/dir base name compare
		j = 0;
  80a1bb:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
		for(x=0;x<8;x++)
  80a1c2:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80a1c9:	e9 f4 01 00 00       	jmp    80a3c2 <FAT32_lookup+0x546>
		{
			switch(tmpdentry->DIR_Name[x])
  80a1ce:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a1d2:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a1d5:	48 98                	cdqe   
  80a1d7:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a1db:	0f b6 c0             	movzx  eax,al
  80a1de:	83 f8 7a             	cmp    eax,0x7a
  80a1e1:	0f 8f d0 01 00 00    	jg     80a3b7 <FAT32_lookup+0x53b>
  80a1e7:	83 f8 61             	cmp    eax,0x61
  80a1ea:	0f 8d e6 00 00 00    	jge    80a2d6 <FAT32_lookup+0x45a>
  80a1f0:	83 f8 5a             	cmp    eax,0x5a
  80a1f3:	0f 8f be 01 00 00    	jg     80a3b7 <FAT32_lookup+0x53b>
  80a1f9:	83 f8 41             	cmp    eax,0x41
  80a1fc:	0f 8d d4 00 00 00    	jge    80a2d6 <FAT32_lookup+0x45a>
  80a202:	83 f8 20             	cmp    eax,0x20
  80a205:	74 1a                	je     80a221 <FAT32_lookup+0x3a5>
  80a207:	83 f8 20             	cmp    eax,0x20
  80a20a:	0f 8c a7 01 00 00    	jl     80a3b7 <FAT32_lookup+0x53b>
  80a210:	83 e8 30             	sub    eax,0x30
  80a213:	83 f8 09             	cmp    eax,0x9
  80a216:	0f 87 9b 01 00 00    	ja     80a3b7 <FAT32_lookup+0x53b>
  80a21c:	e9 53 01 00 00       	jmp    80a374 <FAT32_lookup+0x4f8>
			{
				case ' ':
					if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  80a221:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a225:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80a229:	0f b6 c0             	movzx  eax,al
  80a22c:	83 e0 10             	and    eax,0x10
  80a22f:	85 c0                	test   eax,eax
  80a231:	75 50                	jne    80a283 <FAT32_lookup+0x407>
					{
						if(dest_dentry->name[j]=='.')
  80a233:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a237:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80a23a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a23d:	48 98                	cdqe   
  80a23f:	48 01 d0             	add    rax,rdx
  80a242:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a245:	3c 2e                	cmp    al,0x2e
  80a247:	0f 84 70 01 00 00    	je     80a3bd <FAT32_lookup+0x541>
							continue;
						else if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a24d:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a251:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a254:	48 98                	cdqe   
  80a256:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a25a:	0f b6 d0             	movzx  edx,al
  80a25d:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a261:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a264:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a267:	48 98                	cdqe   
  80a269:	48 01 c8             	add    rax,rcx
  80a26c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a26f:	0f be c0             	movsx  eax,al
  80a272:	39 c2                	cmp    edx,eax
  80a274:	0f 85 c1 02 00 00    	jne    80a53b <FAT32_lookup+0x6bf>
						{
							j++;
  80a27a:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80a27e:	e9 3b 01 00 00       	jmp    80a3be <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a283:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a287:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a28a:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a28d:	7d 32                	jge    80a2c1 <FAT32_lookup+0x445>
  80a28f:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a293:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a296:	48 98                	cdqe   
  80a298:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a29c:	0f b6 d0             	movzx  edx,al
  80a29f:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a2a3:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a2a6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a2a9:	48 98                	cdqe   
  80a2ab:	48 01 c8             	add    rax,rcx
  80a2ae:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a2b1:	0f be c0             	movsx  eax,al
  80a2b4:	39 c2                	cmp    edx,eax
  80a2b6:	75 09                	jne    80a2c1 <FAT32_lookup+0x445>
						{
							j++;
  80a2b8:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80a2bc:	e9 fd 00 00 00       	jmp    80a3be <FAT32_lookup+0x542>
						}
						else if(j == dest_dentry->name_length)
  80a2c1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a2c5:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a2c8:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a2cb:	0f 85 6d 02 00 00    	jne    80a53e <FAT32_lookup+0x6c2>
							continue;
  80a2d1:	e9 e8 00 00 00       	jmp    80a3be <FAT32_lookup+0x542>
							goto continue_cmp_fail;
					}

				case 'A' ... 'Z':
				case 'a' ... 'z':
					if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  80a2d6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a2da:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80a2de:	0f b6 c0             	movzx  eax,al
  80a2e1:	83 e0 08             	and    eax,0x8
  80a2e4:	85 c0                	test   eax,eax
  80a2e6:	74 49                	je     80a331 <FAT32_lookup+0x4b5>
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  80a2e8:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a2ec:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a2ef:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a2f2:	0f 8d 49 02 00 00    	jge    80a541 <FAT32_lookup+0x6c5>
  80a2f8:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a2fc:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a2ff:	48 98                	cdqe   
  80a301:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a305:	0f b6 c0             	movzx  eax,al
  80a308:	8d 50 20             	lea    edx,[rax+0x20]
  80a30b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a30f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a312:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a315:	48 98                	cdqe   
  80a317:	48 01 c8             	add    rax,rcx
  80a31a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a31d:	0f be c0             	movsx  eax,al
  80a320:	39 c2                	cmp    edx,eax
  80a322:	0f 85 19 02 00 00    	jne    80a541 <FAT32_lookup+0x6c5>
						{
							j++;
  80a328:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80a32c:	e9 8d 00 00 00       	jmp    80a3be <FAT32_lookup+0x542>
						}
						else
							goto continue_cmp_fail;
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a331:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a335:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a338:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a33b:	0f 8d 03 02 00 00    	jge    80a544 <FAT32_lookup+0x6c8>
  80a341:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a345:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a348:	48 98                	cdqe   
  80a34a:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a34e:	0f b6 d0             	movzx  edx,al
  80a351:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a355:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a358:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a35b:	48 98                	cdqe   
  80a35d:	48 01 c8             	add    rax,rcx
  80a360:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a363:	0f be c0             	movsx  eax,al
  80a366:	39 c2                	cmp    edx,eax
  80a368:	0f 85 d6 01 00 00    	jne    80a544 <FAT32_lookup+0x6c8>
						{
							j++;
  80a36e:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80a372:	eb 4a                	jmp    80a3be <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}

				case '0' ... '9':
					if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a374:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a378:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a37b:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a37e:	0f 8d c3 01 00 00    	jge    80a547 <FAT32_lookup+0x6cb>
  80a384:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a388:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a38b:	48 98                	cdqe   
  80a38d:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a391:	0f b6 d0             	movzx  edx,al
  80a394:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a398:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a39b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a39e:	48 98                	cdqe   
  80a3a0:	48 01 c8             	add    rax,rcx
  80a3a3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a3a6:	0f be c0             	movsx  eax,al
  80a3a9:	39 c2                	cmp    edx,eax
  80a3ab:	0f 85 96 01 00 00    	jne    80a547 <FAT32_lookup+0x6cb>
					{
						j++;
  80a3b1:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
						break;
  80a3b5:	eb 07                	jmp    80a3be <FAT32_lookup+0x542>
					}
					else
						goto continue_cmp_fail;

				default :
					j++;
  80a3b7:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
					break;
  80a3bb:	eb 01                	jmp    80a3be <FAT32_lookup+0x542>
							continue;
  80a3bd:	90                   	nop
		for(x=0;x<8;x++)
  80a3be:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80a3c2:	83 7d f0 07          	cmp    DWORD PTR [rbp-0x10],0x7
  80a3c6:	0f 8e 02 fe ff ff    	jle    80a1ce <FAT32_lookup+0x352>
			}
		}
		//short file ext name compare
		if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  80a3cc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a3d0:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80a3d4:	0f b6 c0             	movzx  eax,al
  80a3d7:	83 e0 10             	and    eax,0x10
  80a3da:	85 c0                	test   eax,eax
  80a3dc:	0f 85 d0 01 00 00    	jne    80a5b2 <FAT32_lookup+0x736>
		{
			j++;
  80a3e2:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
			for(x=8;x<11;x++)
  80a3e6:	c7 45 f0 08 00 00 00 	mov    DWORD PTR [rbp-0x10],0x8
  80a3ed:	e9 2b 01 00 00       	jmp    80a51d <FAT32_lookup+0x6a1>
			{
				switch(tmpdentry->DIR_Name[x])
  80a3f2:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a3f6:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a3f9:	48 98                	cdqe   
  80a3fb:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a3ff:	0f b6 c0             	movzx  eax,al
  80a402:	83 f8 7a             	cmp    eax,0x7a
  80a405:	0f 8f 3f 01 00 00    	jg     80a54a <FAT32_lookup+0x6ce>
  80a40b:	83 f8 61             	cmp    eax,0x61
  80a40e:	7d 2e                	jge    80a43e <FAT32_lookup+0x5c2>
  80a410:	83 f8 5a             	cmp    eax,0x5a
  80a413:	0f 8f 31 01 00 00    	jg     80a54a <FAT32_lookup+0x6ce>
  80a419:	83 f8 41             	cmp    eax,0x41
  80a41c:	7d 20                	jge    80a43e <FAT32_lookup+0x5c2>
  80a41e:	83 f8 20             	cmp    eax,0x20
  80a421:	0f 84 c4 00 00 00    	je     80a4eb <FAT32_lookup+0x66f>
  80a427:	83 f8 20             	cmp    eax,0x20
  80a42a:	0f 8c 1a 01 00 00    	jl     80a54a <FAT32_lookup+0x6ce>
  80a430:	83 e8 30             	sub    eax,0x30
  80a433:	83 f8 09             	cmp    eax,0x9
  80a436:	0f 87 0e 01 00 00    	ja     80a54a <FAT32_lookup+0x6ce>
  80a43c:	eb 7e                	jmp    80a4bc <FAT32_lookup+0x640>
				{
					case 'A' ... 'Z':
					case 'a' ... 'z':
						if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  80a43e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a442:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80a446:	0f b6 c0             	movzx  eax,al
  80a449:	83 e0 10             	and    eax,0x10
  80a44c:	85 c0                	test   eax,eax
  80a44e:	74 39                	je     80a489 <FAT32_lookup+0x60d>
							if(tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  80a450:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a454:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a457:	48 98                	cdqe   
  80a459:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a45d:	0f b6 c0             	movzx  eax,al
  80a460:	8d 50 20             	lea    edx,[rax+0x20]
  80a463:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a467:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a46a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a46d:	48 98                	cdqe   
  80a46f:	48 01 c8             	add    rax,rcx
  80a472:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a475:	0f be c0             	movsx  eax,al
  80a478:	39 c2                	cmp    edx,eax
  80a47a:	0f 85 cd 00 00 00    	jne    80a54d <FAT32_lookup+0x6d1>
							{
								j++;
  80a480:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  80a484:	e9 90 00 00 00       	jmp    80a519 <FAT32_lookup+0x69d>
							}
							else
								goto continue_cmp_fail;
						else
						{
							if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a489:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a48d:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a490:	48 98                	cdqe   
  80a492:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a496:	0f b6 d0             	movzx  edx,al
  80a499:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a49d:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a4a0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a4a3:	48 98                	cdqe   
  80a4a5:	48 01 c8             	add    rax,rcx
  80a4a8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a4ab:	0f be c0             	movsx  eax,al
  80a4ae:	39 c2                	cmp    edx,eax
  80a4b0:	0f 85 9a 00 00 00    	jne    80a550 <FAT32_lookup+0x6d4>
							{
								j++;
  80a4b6:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  80a4ba:	eb 5d                	jmp    80a519 <FAT32_lookup+0x69d>
							else
								goto continue_cmp_fail;
						}

					case '0' ... '9':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a4bc:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a4c0:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a4c3:	48 98                	cdqe   
  80a4c5:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a4c9:	0f b6 d0             	movzx  edx,al
  80a4cc:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a4d0:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a4d3:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a4d6:	48 98                	cdqe   
  80a4d8:	48 01 c8             	add    rax,rcx
  80a4db:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a4de:	0f be c0             	movsx  eax,al
  80a4e1:	39 c2                	cmp    edx,eax
  80a4e3:	75 6e                	jne    80a553 <FAT32_lookup+0x6d7>
						{
							j++;
  80a4e5:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80a4e9:	eb 2e                	jmp    80a519 <FAT32_lookup+0x69d>
						}
						else
							goto continue_cmp_fail;

					case ' ':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a4eb:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a4ef:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a4f2:	48 98                	cdqe   
  80a4f4:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a4f8:	0f b6 d0             	movzx  edx,al
  80a4fb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a4ff:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a502:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a505:	48 98                	cdqe   
  80a507:	48 01 c8             	add    rax,rcx
  80a50a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a50d:	0f be c0             	movsx  eax,al
  80a510:	39 c2                	cmp    edx,eax
  80a512:	75 42                	jne    80a556 <FAT32_lookup+0x6da>
						{
							j++;
  80a514:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80a518:	90                   	nop
			for(x=8;x<11;x++)
  80a519:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80a51d:	83 7d f0 0a          	cmp    DWORD PTR [rbp-0x10],0xa
  80a521:	0f 8e cb fe ff ff    	jle    80a3f2 <FAT32_lookup+0x576>
					default :
						goto continue_cmp_fail;
				}
			}
		}
		goto find_lookup_success;
  80a527:	e9 86 00 00 00       	jmp    80a5b2 <FAT32_lookup+0x736>
			continue;
  80a52c:	90                   	nop
  80a52d:	eb 28                	jmp    80a557 <FAT32_lookup+0x6db>
			continue;
  80a52f:	90                   	nop
  80a530:	eb 25                	jmp    80a557 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80a532:	90                   	nop
  80a533:	eb 22                	jmp    80a557 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80a535:	90                   	nop
  80a536:	eb 1f                	jmp    80a557 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80a538:	90                   	nop
  80a539:	eb 1c                	jmp    80a557 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a53b:	90                   	nop
  80a53c:	eb 19                	jmp    80a557 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a53e:	90                   	nop
  80a53f:	eb 16                	jmp    80a557 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a541:	90                   	nop
  80a542:	eb 13                	jmp    80a557 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a544:	90                   	nop
  80a545:	eb 10                	jmp    80a557 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  80a547:	90                   	nop
  80a548:	eb 0d                	jmp    80a557 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  80a54a:	90                   	nop
  80a54b:	eb 0a                	jmp    80a557 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  80a54d:	90                   	nop
  80a54e:	eb 07                	jmp    80a557 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  80a550:	90                   	nop
  80a551:	eb 04                	jmp    80a557 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a553:	90                   	nop
  80a554:	eb 01                	jmp    80a557 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a556:	90                   	nop
	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  80a557:	83 45 f8 20          	add    DWORD PTR [rbp-0x8],0x20
  80a55b:	48 83 45 e8 20       	add    QWORD PTR [rbp-0x18],0x20
  80a560:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80a563:	48 63 d0             	movsxd rdx,eax
  80a566:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a56a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a56e:	48 39 c2             	cmp    rdx,rax
  80a571:	0f 8c 4c fa ff ff    	jl     809fc3 <FAT32_lookup+0x147>

continue_cmp_fail:;
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80a577:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80a57a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a57e:	89 d6                	mov    esi,edx
  80a580:	48 89 c7             	mov    rdi,rax
  80a583:	e8 2d e7 ff ff       	call   808cb5 <DISK1_FAT32_read_FAT_Entry>
  80a588:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  80a58b:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  80a592:	77 05                	ja     80a599 <FAT32_lookup+0x71d>
		goto next_cluster;
  80a594:	e9 7f f9 ff ff       	jmp    809f18 <FAT32_lookup+0x9c>

	vmfree(buf);
  80a599:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80a59d:	48 89 c7             	mov    rdi,rax
  80a5a0:	e8 b4 6d ff ff       	call   801359 <vmfree>
	return NULL;
  80a5a5:	b8 00 00 00 00       	mov    eax,0x0
  80a5aa:	e9 f0 01 00 00       	jmp    80a79f <FAT32_lookup+0x923>
				goto find_lookup_success;
  80a5af:	90                   	nop
  80a5b0:	eb 01                	jmp    80a5b3 <FAT32_lookup+0x737>
		goto find_lookup_success;
  80a5b2:	90                   	nop

find_lookup_success:
	p = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  80a5b3:	be 00 00 00 00       	mov    esi,0x0
  80a5b8:	bf 38 00 00 00       	mov    edi,0x38
  80a5bd:	b8 00 00 00 00       	mov    eax,0x0
  80a5c2:	e8 03 6d ff ff       	call   8012ca <vmalloc>
  80a5c7:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
	memset(p,0,sizeof(struct index_node));
  80a5cb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a5cf:	ba 38 00 00 00       	mov    edx,0x38
  80a5d4:	be 00 00 00 00       	mov    esi,0x0
  80a5d9:	48 89 c7             	mov    rdi,rax
  80a5dc:	e8 6f 15 00 00       	call   80bb50 <memset>
	p->file_size = tmpdentry->DIR_FileSize;
  80a5e1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a5e5:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  80a5e8:	89 c2                	mov    edx,eax
  80a5ea:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a5ee:	48 89 10             	mov    QWORD PTR [rax],rdx
	p->blocks = (p->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  80a5f1:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a5f5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80a5f8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a5fc:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a600:	48 01 d0             	add    rax,rdx
  80a603:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  80a607:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a60b:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80a60f:	48 89 c1             	mov    rcx,rax
  80a612:	48 89 d0             	mov    rax,rdx
  80a615:	ba 00 00 00 00       	mov    edx,0x0
  80a61a:	48 f7 f1             	div    rcx
  80a61d:	48 89 c2             	mov    rdx,rax
  80a620:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a624:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	p->attribute = (tmpdentry->DIR_Attr & ATTR_DIRECTORY) ? FS_ATTR_DIR : FS_ATTR_FILE;
  80a628:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a62c:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80a630:	0f b6 c0             	movzx  eax,al
  80a633:	83 e0 10             	and    eax,0x10
  80a636:	85 c0                	test   eax,eax
  80a638:	74 07                	je     80a641 <FAT32_lookup+0x7c5>
  80a63a:	ba 02 00 00 00       	mov    edx,0x2
  80a63f:	eb 05                	jmp    80a646 <FAT32_lookup+0x7ca>
  80a641:	ba 01 00 00 00       	mov    edx,0x1
  80a646:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a64a:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	p->sb = parent_inode->sb;
  80a64e:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80a652:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  80a656:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a65a:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	p->f_ops = &FAT32_file_ops;
  80a65e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a662:	48 c7 40 20 80 c6 80 	mov    QWORD PTR [rax+0x20],0x80c680
  80a669:	00 
	p->inode_ops = &FAT32_inode_ops;
  80a66a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a66e:	48 c7 40 28 c0 c6 80 	mov    QWORD PTR [rax+0x28],0x80c6c0
  80a675:	00 

	p->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  80a676:	be 00 00 00 00       	mov    esi,0x0
  80a67b:	bf 20 00 00 00       	mov    edi,0x20
  80a680:	b8 00 00 00 00       	mov    eax,0x0
  80a685:	e8 40 6c ff ff       	call   8012ca <vmalloc>
  80a68a:	48 89 c2             	mov    rdx,rax
  80a68d:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a691:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(p->private_index_info,0,sizeof(struct FAT32_inode_info));
  80a695:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a699:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a69d:	ba 20 00 00 00       	mov    edx,0x20
  80a6a2:	be 00 00 00 00       	mov    esi,0x0
  80a6a7:	48 89 c7             	mov    rdi,rax
  80a6aa:	e8 a1 14 00 00       	call   80bb50 <memset>
	finode = p->private_index_info;
  80a6af:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a6b3:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a6b7:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax

	finode->first_cluster = (tmpdentry->DIR_FstClusHI<< 16 | tmpdentry->DIR_FstClusLO) & 0x0fffffff;
  80a6bb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a6bf:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80a6c3:	0f b7 c0             	movzx  eax,ax
  80a6c6:	c1 e0 10             	shl    eax,0x10
  80a6c9:	89 c2                	mov    edx,eax
  80a6cb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a6cf:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  80a6d3:	0f b7 c0             	movzx  eax,ax
  80a6d6:	09 d0                	or     eax,edx
  80a6d8:	48 98                	cdqe   
  80a6da:	25 ff ff ff 0f       	and    eax,0xfffffff
  80a6df:	48 89 c2             	mov    rdx,rax
  80a6e2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a6e6:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = cluster;
  80a6e9:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80a6ec:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a6f0:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	finode->dentry_position = tmpdentry - (struct FAT32_Directory *)buf;
  80a6f4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a6f8:	48 2b 45 c0          	sub    rax,QWORD PTR [rbp-0x40]
  80a6fc:	48 c1 f8 05          	sar    rax,0x5
  80a700:	48 89 c2             	mov    rdx,rax
  80a703:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a707:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	finode->create_date = tmpdentry->DIR_CrtTime;
  80a70b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a70f:	0f b7 50 0e          	movzx  edx,WORD PTR [rax+0xe]
  80a713:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a717:	66 89 50 18          	mov    WORD PTR [rax+0x18],dx
	finode->create_time = tmpdentry->DIR_CrtDate;
  80a71b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a71f:	0f b7 50 10          	movzx  edx,WORD PTR [rax+0x10]
  80a723:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a727:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	finode->write_date = tmpdentry->DIR_WrtTime;
  80a72b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a72f:	0f b7 50 16          	movzx  edx,WORD PTR [rax+0x16]
  80a733:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a737:	66 89 50 1c          	mov    WORD PTR [rax+0x1c],dx
	finode->write_time = tmpdentry->DIR_WrtDate;
  80a73b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a73f:	0f b7 50 18          	movzx  edx,WORD PTR [rax+0x18]
  80a743:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a747:	66 89 50 1e          	mov    WORD PTR [rax+0x1e],dx

	if((tmpdentry->DIR_FstClusHI >> 12) && (p->attribute & FS_ATTR_FILE))
  80a74b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a74f:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80a753:	66 c1 e8 0c          	shr    ax,0xc
  80a757:	66 85 c0             	test   ax,ax
  80a75a:	74 27                	je     80a783 <FAT32_lookup+0x907>
  80a75c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a760:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a764:	83 e0 01             	and    eax,0x1
  80a767:	48 85 c0             	test   rax,rax
  80a76a:	74 17                	je     80a783 <FAT32_lookup+0x907>
	{
		p->attribute |= FS_ATTR_DEVICE;
  80a76c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a770:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a774:	48 83 c8 04          	or     rax,0x4
  80a778:	48 89 c2             	mov    rdx,rax
  80a77b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a77f:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	}

	dest_dentry->dir_inode = p;
  80a783:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a787:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80a78b:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	vmfree(buf);
  80a78f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80a793:	48 89 c7             	mov    rdi,rax
  80a796:	e8 be 6b ff ff       	call   801359 <vmfree>
	return dest_dentry;	
  80a79b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
}
  80a79f:	c9                   	leave  
  80a7a0:	c3                   	ret    

000000000080a7a1 <FAT32_mkdir>:


long FAT32_mkdir(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  80a7a1:	f3 0f 1e fa          	endbr64 
  80a7a5:	55                   	push   rbp
  80a7a6:	48 89 e5             	mov    rbp,rsp
  80a7a9:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a7ad:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a7b1:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80a7b4:	90                   	nop
  80a7b5:	5d                   	pop    rbp
  80a7b6:	c3                   	ret    

000000000080a7b7 <FAT32_rmdir>:


long FAT32_rmdir(struct index_node * inode,struct dir_entry * dentry)
{}
  80a7b7:	f3 0f 1e fa          	endbr64 
  80a7bb:	55                   	push   rbp
  80a7bc:	48 89 e5             	mov    rbp,rsp
  80a7bf:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a7c3:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a7c7:	90                   	nop
  80a7c8:	5d                   	pop    rbp
  80a7c9:	c3                   	ret    

000000000080a7ca <FAT32_rename>:

long FAT32_rename(struct index_node * old_inode,struct dir_entry * old_dentry,struct index_node * new_inode,struct dir_entry * new_dentry)
{}
  80a7ca:	f3 0f 1e fa          	endbr64 
  80a7ce:	55                   	push   rbp
  80a7cf:	48 89 e5             	mov    rbp,rsp
  80a7d2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a7d6:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a7da:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80a7de:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  80a7e2:	90                   	nop
  80a7e3:	5d                   	pop    rbp
  80a7e4:	c3                   	ret    

000000000080a7e5 <FAT32_getattr>:

long FAT32_getattr(struct dir_entry * dentry,unsigned long * attr)
{}
  80a7e5:	f3 0f 1e fa          	endbr64 
  80a7e9:	55                   	push   rbp
  80a7ea:	48 89 e5             	mov    rbp,rsp
  80a7ed:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a7f1:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a7f5:	90                   	nop
  80a7f6:	5d                   	pop    rbp
  80a7f7:	c3                   	ret    

000000000080a7f8 <FAT32_setattr>:

long FAT32_setattr(struct dir_entry * dentry,unsigned long * attr)
{}
  80a7f8:	f3 0f 1e fa          	endbr64 
  80a7fc:	55                   	push   rbp
  80a7fd:	48 89 e5             	mov    rbp,rsp
  80a800:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a804:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a808:	90                   	nop
  80a809:	5d                   	pop    rbp
  80a80a:	c3                   	ret    

000000000080a80b <FAT32_compare>:
	.setattr = FAT32_setattr,
};


//// these operation need cache and list
long FAT32_compare(struct dir_entry * parent_dentry,char * source_filename,char * destination_filename){}
  80a80b:	f3 0f 1e fa          	endbr64 
  80a80f:	55                   	push   rbp
  80a810:	48 89 e5             	mov    rbp,rsp
  80a813:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a817:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a81b:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80a81f:	90                   	nop
  80a820:	5d                   	pop    rbp
  80a821:	c3                   	ret    

000000000080a822 <FAT32_hash>:
long FAT32_hash(struct dir_entry * dentry,char * filename){}
  80a822:	f3 0f 1e fa          	endbr64 
  80a826:	55                   	push   rbp
  80a827:	48 89 e5             	mov    rbp,rsp
  80a82a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a82e:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a832:	90                   	nop
  80a833:	5d                   	pop    rbp
  80a834:	c3                   	ret    

000000000080a835 <FAT32_release>:
long FAT32_release(struct dir_entry * dentry){}
  80a835:	f3 0f 1e fa          	endbr64 
  80a839:	55                   	push   rbp
  80a83a:	48 89 e5             	mov    rbp,rsp
  80a83d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a841:	90                   	nop
  80a842:	5d                   	pop    rbp
  80a843:	c3                   	ret    

000000000080a844 <FAT32_iput>:
long FAT32_iput(struct dir_entry * dentry,struct index_node * inode){}
  80a844:	f3 0f 1e fa          	endbr64 
  80a848:	55                   	push   rbp
  80a849:	48 89 e5             	mov    rbp,rsp
  80a84c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a850:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a854:	90                   	nop
  80a855:	5d                   	pop    rbp
  80a856:	c3                   	ret    

000000000080a857 <fat32_write_superblock>:
	.release = FAT32_release,
	.iput = FAT32_iput,
};


void fat32_write_superblock(struct super_block * sb){}
  80a857:	f3 0f 1e fa          	endbr64 
  80a85b:	55                   	push   rbp
  80a85c:	48 89 e5             	mov    rbp,rsp
  80a85f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a863:	90                   	nop
  80a864:	5d                   	pop    rbp
  80a865:	c3                   	ret    

000000000080a866 <fat32_put_superblock>:

void fat32_put_superblock(struct super_block * sb)
{
  80a866:	f3 0f 1e fa          	endbr64 
  80a86a:	55                   	push   rbp
  80a86b:	48 89 e5             	mov    rbp,rsp
  80a86e:	48 83 ec 10          	sub    rsp,0x10
  80a872:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
	vmfree(sb->private_sb_info);
  80a876:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a87a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a87e:	48 89 c7             	mov    rdi,rax
  80a881:	e8 d3 6a ff ff       	call   801359 <vmfree>
	vmfree(sb->root->dir_inode->private_index_info);
  80a886:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a88a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a88d:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a891:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a895:	48 89 c7             	mov    rdi,rax
  80a898:	e8 bc 6a ff ff       	call   801359 <vmfree>
	vmfree(sb->root->dir_inode);
  80a89d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a8a1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a8a4:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a8a8:	48 89 c7             	mov    rdi,rax
  80a8ab:	e8 a9 6a ff ff       	call   801359 <vmfree>
	vmfree(sb->root);
  80a8b0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a8b4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a8b7:	48 89 c7             	mov    rdi,rax
  80a8ba:	e8 9a 6a ff ff       	call   801359 <vmfree>
	vmfree(sb);
  80a8bf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a8c3:	48 89 c7             	mov    rdi,rax
  80a8c6:	e8 8e 6a ff ff       	call   801359 <vmfree>
}
  80a8cb:	90                   	nop
  80a8cc:	c9                   	leave  
  80a8cd:	c3                   	ret    

000000000080a8ce <fat32_write_inode>:

void fat32_write_inode(struct index_node * inode)
{
  80a8ce:	f3 0f 1e fa          	endbr64 
  80a8d2:	55                   	push   rbp
  80a8d3:	48 89 e5             	mov    rbp,rsp
  80a8d6:	48 83 ec 40          	sub    rsp,0x40
  80a8da:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
	struct FAT32_Directory * fdentry = NULL;
  80a8de:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80a8e5:	00 
	struct FAT32_Directory * buf = NULL;
  80a8e6:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80a8ed:	00 
	struct FAT32_inode_info * finode = inode->private_index_info;
  80a8ee:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a8f2:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a8f6:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	struct FAT32_sb_info * fsbi = inode->sb->private_sb_info;
  80a8fa:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a8fe:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a902:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a906:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	unsigned long sector = 0;
  80a90a:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  80a911:	00 

	if(finode->dentry_location == 0)
  80a912:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a916:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80a91a:	48 85 c0             	test   rax,rax
  80a91d:	75 14                	jne    80a933 <fat32_write_inode+0x65>
	{
		printf("FS ERROR:write root inode!\n");	
  80a91f:	bf 6c 46 81 00       	mov    edi,0x81466c
  80a924:	b8 00 00 00 00       	mov    eax,0x0
  80a929:	e8 0a 64 ff ff       	call   800d38 <printf>
		return ;
  80a92e:	e9 30 01 00 00       	jmp    80aa63 <fat32_write_inode+0x195>
	}

	sector = fsbi->Data_firstsector + (finode->dentry_location - 2) * fsbi->sector_per_cluster;
  80a933:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a937:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  80a93b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a93f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80a943:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  80a947:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a94b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a94f:	48 0f af c2          	imul   rax,rdx
  80a953:	48 01 c8             	add    rax,rcx
  80a956:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	buf = (struct FAT32_Directory *)vmalloc(fsbi->bytes_per_cluster,0);
  80a95a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a95e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a962:	be 00 00 00 00       	mov    esi,0x0
  80a967:	48 89 c7             	mov    rdi,rax
  80a96a:	b8 00 00 00 00       	mov    eax,0x0
  80a96f:	e8 56 69 ff ff       	call   8012ca <vmalloc>
  80a974:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	memset(buf,0,fsbi->bytes_per_cluster);
  80a978:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a97c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a980:	89 c2                	mov    edx,eax
  80a982:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a986:	be 00 00 00 00       	mov    esi,0x0
  80a98b:	48 89 c7             	mov    rdi,rax
  80a98e:	e8 bd 11 00 00       	call   80bb50 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80a993:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a997:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a99b:	89 c1                	mov    ecx,eax
  80a99d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a9a1:	89 c2                	mov    edx,eax
  80a9a3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a9a7:	49 89 c0             	mov    r8,rax
  80a9aa:	be 00 00 00 00       	mov    esi,0x0
  80a9af:	bf 00 00 00 00       	mov    edi,0x0
  80a9b4:	e8 72 d6 ff ff       	call   80802b <request>
  80a9b9:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    chk_result(r);
  80a9bc:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80a9bf:	89 c7                	mov    edi,eax
  80a9c1:	e8 19 dd ff ff       	call   8086df <chk_result>
    fdentry = buf+finode->dentry_position;
  80a9c6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a9ca:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a9ce:	48 c1 e0 05          	shl    rax,0x5
  80a9d2:	48 89 c2             	mov    rdx,rax
  80a9d5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a9d9:	48 01 d0             	add    rax,rdx
  80a9dc:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

	////alert fat32 dentry data
	fdentry->DIR_FileSize = inode->file_size;
  80a9e0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a9e4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a9e7:	89 c2                	mov    edx,eax
  80a9e9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a9ed:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
	fdentry->DIR_FstClusLO = finode->first_cluster & 0xffff;
  80a9f0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a9f4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a9f7:	89 c2                	mov    edx,eax
  80a9f9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a9fd:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	fdentry->DIR_FstClusHI = (fdentry->DIR_FstClusHI & 0xf000) | (finode->first_cluster >> 16);
  80aa01:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aa05:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80aa09:	66 25 00 f0          	and    ax,0xf000
  80aa0d:	89 c2                	mov    edx,eax
  80aa0f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80aa13:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aa16:	48 c1 e8 10          	shr    rax,0x10
  80aa1a:	09 c2                	or     edx,eax
  80aa1c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aa20:	66 89 50 14          	mov    WORD PTR [rax+0x14],dx

	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80aa24:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80aa28:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80aa2c:	89 c1                	mov    ecx,eax
  80aa2e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80aa32:	89 c2                	mov    edx,eax
  80aa34:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aa38:	49 89 c0             	mov    r8,rax
  80aa3b:	be 01 00 00 00       	mov    esi,0x1
  80aa40:	bf 00 00 00 00       	mov    edi,0x0
  80aa45:	e8 e1 d5 ff ff       	call   80802b <request>
  80aa4a:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    chk_result(r1);
  80aa4d:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
  80aa50:	89 c7                	mov    edi,eax
  80aa52:	e8 88 dc ff ff       	call   8086df <chk_result>
	vmfree(buf);
  80aa57:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aa5b:	48 89 c7             	mov    rdi,rax
  80aa5e:	e8 f6 68 ff ff       	call   801359 <vmfree>
}
  80aa63:	c9                   	leave  
  80aa64:	c3                   	ret    

000000000080aa65 <fat32_read_superblock>:

	.write_inode = fat32_write_inode,
};

struct super_block * fat32_read_superblock(struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  80aa65:	f3 0f 1e fa          	endbr64 
  80aa69:	55                   	push   rbp
  80aa6a:	48 89 e5             	mov    rbp,rsp
  80aa6d:	48 83 ec 50          	sub    rsp,0x50
  80aa71:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  80aa75:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
	struct super_block * sbp = NULL;
  80aa79:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80aa80:	00 
	struct FAT32_inode_info * finode = NULL;
  80aa81:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80aa88:	00 
	struct FAT32_BootSector * fbs = NULL;
  80aa89:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80aa90:	00 
	struct FAT32_sb_info * fsbi = NULL;
  80aa91:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80aa98:	00 

	////super block
	sbp = (struct super_block *)vmalloc(sizeof(struct super_block),0);
  80aa99:	be 00 00 00 00       	mov    esi,0x0
  80aa9e:	bf 18 00 00 00       	mov    edi,0x18
  80aaa3:	b8 00 00 00 00       	mov    eax,0x0
  80aaa8:	e8 1d 68 ff ff       	call   8012ca <vmalloc>
  80aaad:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	memset(sbp,0,sizeof(struct super_block));
  80aab1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aab5:	ba 18 00 00 00       	mov    edx,0x18
  80aaba:	be 00 00 00 00       	mov    esi,0x0
  80aabf:	48 89 c7             	mov    rdi,rax
  80aac2:	e8 89 10 00 00       	call   80bb50 <memset>

	sbp->sb_ops = &FAT32_sb_ops;
  80aac7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aacb:	48 c7 40 08 20 c7 80 	mov    QWORD PTR [rax+0x8],0x80c720
  80aad2:	00 
	sbp->private_sb_info = (struct FAT32_sb_info *)vmalloc(sizeof(struct FAT32_sb_info),0);
  80aad3:	be 00 00 00 00       	mov    esi,0x0
  80aad8:	bf 60 00 00 00       	mov    edi,0x60
  80aadd:	b8 00 00 00 00       	mov    eax,0x0
  80aae2:	e8 e3 67 ff ff       	call   8012ca <vmalloc>
  80aae7:	48 89 c2             	mov    rdx,rax
  80aaea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aaee:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	memset(sbp->private_sb_info,0,sizeof(struct FAT32_sb_info));
  80aaf2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aaf6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80aafa:	ba 60 00 00 00       	mov    edx,0x60
  80aaff:	be 00 00 00 00       	mov    esi,0x0
  80ab04:	48 89 c7             	mov    rdi,rax
  80ab07:	e8 44 10 00 00       	call   80bb50 <memset>

	////fat32 boot sector
	fbs = (struct FAT32_BootSector *)buf;
  80ab0c:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80ab10:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
 	fsbi = sbp->private_sb_info;
  80ab14:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ab18:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ab1c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	fsbi->start_sector = DPTE->start_LBA;
  80ab20:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ab24:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80ab27:	89 c2                	mov    edx,eax
  80ab29:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ab2d:	48 89 10             	mov    QWORD PTR [rax],rdx
	fsbi->sector_count = DPTE->sectors_limit;
  80ab30:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ab34:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80ab37:	89 c2                	mov    edx,eax
  80ab39:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ab3d:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	fsbi->sector_per_cluster = fbs->BPB_SecPerClus;
  80ab41:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ab45:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  80ab49:	0f b6 d0             	movzx  edx,al
  80ab4c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ab50:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	fsbi->bytes_per_cluster = fbs->BPB_SecPerClus * fbs->BPB_BytesPerSec;
  80ab54:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ab58:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  80ab5c:	0f b6 d0             	movzx  edx,al
  80ab5f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ab63:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  80ab67:	0f b7 c0             	movzx  eax,ax
  80ab6a:	0f af c2             	imul   eax,edx
  80ab6d:	48 63 d0             	movsxd rdx,eax
  80ab70:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ab74:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	fsbi->bytes_per_sector = fbs->BPB_BytesPerSec;
  80ab78:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ab7c:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  80ab80:	0f b7 d0             	movzx  edx,ax
  80ab83:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ab87:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
	fsbi->Data_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt + fbs->BPB_FATSz32 * fbs->BPB_NumFATs;
  80ab8b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ab8f:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80ab92:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ab96:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  80ab9a:	0f b7 c0             	movzx  eax,ax
  80ab9d:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  80aba0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80aba4:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  80aba7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80abab:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  80abaf:	0f b6 c0             	movzx  eax,al
  80abb2:	0f af c2             	imul   eax,edx
  80abb5:	01 c8                	add    eax,ecx
  80abb7:	89 c2                	mov    edx,eax
  80abb9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80abbd:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
	fsbi->FAT1_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt;
  80abc1:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80abc5:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80abc8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80abcc:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  80abd0:	0f b7 c0             	movzx  eax,ax
  80abd3:	01 d0                	add    eax,edx
  80abd5:	89 c2                	mov    edx,eax
  80abd7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80abdb:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	fsbi->sector_per_FAT = fbs->BPB_FATSz32;
  80abdf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80abe3:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  80abe6:	89 c2                	mov    edx,eax
  80abe8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80abec:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
	fsbi->NumFATs = fbs->BPB_NumFATs;
  80abf0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80abf4:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  80abf8:	0f b6 d0             	movzx  edx,al
  80abfb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80abff:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
	fsbi->fsinfo_sector_infat = fbs->BPB_FSInfo;
  80ac03:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ac07:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80ac0b:	0f b7 d0             	movzx  edx,ax
  80ac0e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ac12:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
	fsbi->bootsector_bk_infat = fbs->BPB_BkBootSec;	
  80ac16:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ac1a:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  80ac1e:	0f b7 d0             	movzx  edx,ax
  80ac21:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ac25:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
	
	printf("FAT32 Boot Sector\n\tBPB_FSInfo:%x\n\tBPB_BkBootSec:%x\n\tBPB_TotSec32:%x\n",fbs->BPB_FSInfo,fbs->BPB_BkBootSec,fbs->BPB_TotSec32);
  80ac29:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ac2d:	8b 48 20             	mov    ecx,DWORD PTR [rax+0x20]
  80ac30:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ac34:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  80ac38:	0f b7 d0             	movzx  edx,ax
  80ac3b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ac3f:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80ac43:	0f b7 c0             	movzx  eax,ax
  80ac46:	89 c6                	mov    esi,eax
  80ac48:	bf 88 46 81 00       	mov    edi,0x814688
  80ac4d:	b8 00 00 00 00       	mov    eax,0x0
  80ac52:	e8 e1 60 ff ff       	call   800d38 <printf>
	
	////fat32 fsinfo sector
	fsbi->fat_fsinfo = (struct FAT32_FSInfo *)vmalloc(sizeof(struct FAT32_FSInfo),0);
  80ac57:	be 00 00 00 00       	mov    esi,0x0
  80ac5c:	bf 00 02 00 00       	mov    edi,0x200
  80ac61:	b8 00 00 00 00       	mov    eax,0x0
  80ac66:	e8 5f 66 ff ff       	call   8012ca <vmalloc>
  80ac6b:	48 89 c2             	mov    rdx,rax
  80ac6e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ac72:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
	memset(fsbi->fat_fsinfo,0,512);
  80ac76:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ac7a:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80ac7e:	ba 00 02 00 00       	mov    edx,0x200
  80ac83:	be 00 00 00 00       	mov    esi,0x0
  80ac88:	48 89 c7             	mov    rdi,rax
  80ac8b:	e8 c0 0e 00 00       	call   80bb50 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPTE->start_LBA + fbs->BPB_FSInfo,1,(unsigned char *)fsbi->fat_fsinfo);
  80ac90:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ac94:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  80ac98:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ac9c:	8b 48 08             	mov    ecx,DWORD PTR [rax+0x8]
  80ac9f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80aca3:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80aca7:	0f b7 c0             	movzx  eax,ax
  80acaa:	01 c8                	add    eax,ecx
  80acac:	49 89 d0             	mov    r8,rdx
  80acaf:	b9 01 00 00 00       	mov    ecx,0x1
  80acb4:	89 c2                	mov    edx,eax
  80acb6:	be 00 00 00 00       	mov    esi,0x0
  80acbb:	bf 00 00 00 00       	mov    edi,0x0
  80acc0:	e8 66 d3 ff ff       	call   80802b <request>
  80acc5:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    chk_result(r);
  80acc8:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80accb:	89 c7                	mov    edi,eax
  80accd:	e8 0d da ff ff       	call   8086df <chk_result>
	printf("FAT32 FSInfo\n\tFSI_LeadSig:%x\n\tFSI_StrucSig:%x\n\tFSI_Free_Count:%x\n",fsbi->fat_fsinfo->FSI_LeadSig,fsbi->fat_fsinfo->FSI_StrucSig,fsbi->fat_fsinfo->FSI_Free_Count);
  80acd2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80acd6:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80acda:	8b 88 e8 01 00 00    	mov    ecx,DWORD PTR [rax+0x1e8]
  80ace0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ace4:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80ace8:	8b 90 e4 01 00 00    	mov    edx,DWORD PTR [rax+0x1e4]
  80acee:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80acf2:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80acf6:	8b 00                	mov    eax,DWORD PTR [rax]
  80acf8:	89 c6                	mov    esi,eax
  80acfa:	bf d0 46 81 00       	mov    edi,0x8146d0
  80acff:	b8 00 00 00 00       	mov    eax,0x0
  80ad04:	e8 2f 60 ff ff       	call   800d38 <printf>
	
	////directory entry
	sbp->root = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  80ad09:	be 00 00 00 00       	mov    esi,0x0
  80ad0e:	bf 48 00 00 00       	mov    edi,0x48
  80ad13:	b8 00 00 00 00       	mov    eax,0x0
  80ad18:	e8 ad 65 ff ff       	call   8012ca <vmalloc>
  80ad1d:	48 89 c2             	mov    rdx,rax
  80ad20:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ad24:	48 89 10             	mov    QWORD PTR [rax],rdx
	memset(sbp->root,0,sizeof(struct dir_entry));
  80ad27:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ad2b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ad2e:	ba 48 00 00 00       	mov    edx,0x48
  80ad33:	be 00 00 00 00       	mov    esi,0x0
  80ad38:	48 89 c7             	mov    rdi,rax
  80ad3b:	e8 10 0e 00 00       	call   80bb50 <memset>

	list_init(&sbp->root->child_node);
  80ad40:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ad44:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ad47:	48 83 c0 10          	add    rax,0x10
  80ad4b:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    list->prev = list;
  80ad4f:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80ad53:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80ad57:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  80ad5a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80ad5e:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80ad62:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  80ad66:	90                   	nop
	list_init(&sbp->root->subdirs_list);
  80ad67:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ad6b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ad6e:	48 83 c0 20          	add    rax,0x20
  80ad72:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    list->prev = list;
  80ad76:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80ad7a:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80ad7e:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  80ad81:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80ad85:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80ad89:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  80ad8d:	90                   	nop
	sbp->root->parent = sbp->root;
  80ad8e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ad92:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ad95:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80ad99:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  80ad9c:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
	sbp->root->dir_ops = &FAT32_dentry_ops;
  80ada0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ada4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ada7:	48 c7 40 40 00 c7 80 	mov    QWORD PTR [rax+0x40],0x80c700
  80adae:	00 
	sbp->root->name = (char *)vmalloc(2,0);
  80adaf:	be 00 00 00 00       	mov    esi,0x0
  80adb4:	bf 02 00 00 00       	mov    edi,0x2
  80adb9:	b8 00 00 00 00       	mov    eax,0x0
  80adbe:	e8 07 65 ff ff       	call   8012ca <vmalloc>
  80adc3:	48 89 c2             	mov    rdx,rax
  80adc6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80adca:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80adcd:	48 89 10             	mov    QWORD PTR [rax],rdx
	sbp->root->name[0] = '/';
  80add0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80add4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80add7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80adda:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
	sbp->root->name_length = 1;
  80addd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ade1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ade4:	c7 40 08 01 00 00 00 	mov    DWORD PTR [rax+0x8],0x1

	////index node
	sbp->root->dir_inode = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  80adeb:	be 00 00 00 00       	mov    esi,0x0
  80adf0:	bf 38 00 00 00       	mov    edi,0x38
  80adf5:	b8 00 00 00 00       	mov    eax,0x0
  80adfa:	e8 cb 64 ff ff       	call   8012ca <vmalloc>
  80adff:	48 89 c2             	mov    rdx,rax
  80ae02:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae06:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ae09:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(sbp->root->dir_inode,0,sizeof(struct index_node));
  80ae0d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae11:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ae14:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80ae18:	ba 38 00 00 00       	mov    edx,0x38
  80ae1d:	be 00 00 00 00       	mov    esi,0x0
  80ae22:	48 89 c7             	mov    rdi,rax
  80ae25:	e8 26 0d 00 00       	call   80bb50 <memset>
	sbp->root->dir_inode->inode_ops = &FAT32_inode_ops;
  80ae2a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae2e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ae31:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80ae35:	48 c7 40 28 c0 c6 80 	mov    QWORD PTR [rax+0x28],0x80c6c0
  80ae3c:	00 
	sbp->root->dir_inode->f_ops = &FAT32_file_ops;
  80ae3d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae41:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ae44:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80ae48:	48 c7 40 20 80 c6 80 	mov    QWORD PTR [rax+0x20],0x80c680
  80ae4f:	00 
	sbp->root->dir_inode->file_size = 0;
  80ae50:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae54:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ae57:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80ae5b:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
	sbp->root->dir_inode->blocks = (sbp->root->dir_inode->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  80ae62:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae66:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ae69:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80ae6d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80ae70:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ae74:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80ae78:	48 01 d0             	add    rax,rdx
  80ae7b:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  80ae7f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ae83:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80ae87:	48 89 c6             	mov    rsi,rax
  80ae8a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae8e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ae91:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  80ae95:	48 89 d0             	mov    rax,rdx
  80ae98:	ba 00 00 00 00       	mov    edx,0x0
  80ae9d:	48 f7 f6             	div    rsi
  80aea0:	48 89 41 08          	mov    QWORD PTR [rcx+0x8],rax
	sbp->root->dir_inode->attribute = FS_ATTR_DIR;
  80aea4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aea8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aeab:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aeaf:	48 c7 40 10 02 00 00 	mov    QWORD PTR [rax+0x10],0x2
  80aeb6:	00 
	sbp->root->dir_inode->sb = sbp;
  80aeb7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aebb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aebe:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aec2:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80aec6:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx

	////fat32 root inode
	sbp->root->dir_inode->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  80aeca:	be 00 00 00 00       	mov    esi,0x0
  80aecf:	bf 20 00 00 00       	mov    edi,0x20
  80aed4:	b8 00 00 00 00       	mov    eax,0x0
  80aed9:	e8 ec 63 ff ff       	call   8012ca <vmalloc>
  80aede:	48 89 c2             	mov    rdx,rax
  80aee1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aee5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aee8:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aeec:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(sbp->root->dir_inode->private_index_info,0,sizeof(struct FAT32_inode_info));
  80aef0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aef4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aef7:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aefb:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aeff:	ba 20 00 00 00       	mov    edx,0x20
  80af04:	be 00 00 00 00       	mov    esi,0x0
  80af09:	48 89 c7             	mov    rdi,rax
  80af0c:	e8 3f 0c 00 00       	call   80bb50 <memset>
	finode = (struct FAT32_inode_info *)sbp->root->dir_inode->private_index_info;
  80af11:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80af15:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80af18:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80af1c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80af20:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	finode->first_cluster = fbs->BPB_RootClus;
  80af24:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80af28:	8b 40 2c             	mov    eax,DWORD PTR [rax+0x2c]
  80af2b:	89 c2                	mov    edx,eax
  80af2d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80af31:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = 0;
  80af34:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80af38:	48 c7 40 08 00 00 00 	mov    QWORD PTR [rax+0x8],0x0
  80af3f:	00 
	finode->dentry_position = 0; 
  80af40:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80af44:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  80af4b:	00 
	finode->create_date = 0;
  80af4c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80af50:	66 c7 40 18 00 00    	mov    WORD PTR [rax+0x18],0x0
	finode->create_time = 0;
  80af56:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80af5a:	66 c7 40 1a 00 00    	mov    WORD PTR [rax+0x1a],0x0
	finode->write_date = 0;
  80af60:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80af64:	66 c7 40 1c 00 00    	mov    WORD PTR [rax+0x1c],0x0
	finode->write_time = 0;
  80af6a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80af6e:	66 c7 40 1e 00 00    	mov    WORD PTR [rax+0x1e],0x0

	return sbp;
  80af74:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80af78:	c9                   	leave  
  80af79:	c3                   	ret    

000000000080af7a <DISK1_FAT32_FS_init>:
	.read_superblock = fat32_read_superblock,
	.next = NULL,
};

void DISK1_FAT32_FS_init()
{
  80af7a:	f3 0f 1e fa          	endbr64 
  80af7e:	55                   	push   rbp
  80af7f:	48 89 e5             	mov    rbp,rsp
  80af82:	48 81 ec 10 04 00 00 	sub    rsp,0x410
	int i;
	unsigned char buf[512];
	struct dir_entry * dentry = NULL;
  80af89:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80af90:	00 
	struct Disk_Partition_Table DPT = {0};
  80af91:	48 8d 95 f0 fb ff ff 	lea    rdx,[rbp-0x410]
  80af98:	b8 00 00 00 00       	mov    eax,0x0
  80af9d:	b9 40 00 00 00       	mov    ecx,0x40
  80afa2:	48 89 d7             	mov    rdi,rdx
  80afa5:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax

	register_filesystem(&FAT32_fs_type);
  80afa8:	bf 40 c7 80 00       	mov    edi,0x80c740
  80afad:	e8 f3 c1 ff ff       	call   8071a5 <register_filesystem>
	
	memset(buf,0,512);
  80afb2:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80afb9:	ba 00 02 00 00       	mov    edx,0x200
  80afbe:	be 00 00 00 00       	mov    esi,0x0
  80afc3:	48 89 c7             	mov    rdi,rax
  80afc6:	e8 85 0b 00 00       	call   80bb50 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,0x0,1,(unsigned char *)buf);
  80afcb:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80afd2:	49 89 c0             	mov    r8,rax
  80afd5:	b9 01 00 00 00       	mov    ecx,0x1
  80afda:	ba 00 00 00 00       	mov    edx,0x0
  80afdf:	be 00 00 00 00       	mov    esi,0x0
  80afe4:	bf 00 00 00 00       	mov    edi,0x0
  80afe9:	e8 3d d0 ff ff       	call   80802b <request>
  80afee:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    chk_result(r);
  80aff1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80aff4:	89 c7                	mov    edi,eax
  80aff6:	e8 e4 d6 ff ff       	call   8086df <chk_result>
    DPT = *(struct Disk_Partition_Table *)buf;
  80affb:	48 8d 95 f0 fd ff ff 	lea    rdx,[rbp-0x210]
  80b002:	48 8d 85 f0 fb ff ff 	lea    rax,[rbp-0x410]
  80b009:	48 89 d6             	mov    rsi,rdx
  80b00c:	ba 40 00 00 00       	mov    edx,0x40
  80b011:	48 89 c7             	mov    rdi,rax
  80b014:	48 89 d1             	mov    rcx,rdx
  80b017:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
	printf("DPTE[0] start_LBA:%x\ttype:%x\n",DPT.DPTE[0].start_LBA,DPT.DPTE[0].type);
  80b01a:	0f b6 85 b2 fd ff ff 	movzx  eax,BYTE PTR [rbp-0x24e]
  80b021:	0f b6 d0             	movzx  edx,al
  80b024:	8b 85 b6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x24a]
  80b02a:	89 c6                	mov    esi,eax
  80b02c:	bf 18 47 81 00       	mov    edi,0x814718
  80b031:	b8 00 00 00 00       	mov    eax,0x0
  80b036:	e8 fd 5c ff ff       	call   800d38 <printf>

	memset(buf,0,512);
  80b03b:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80b042:	ba 00 02 00 00       	mov    edx,0x200
  80b047:	be 00 00 00 00       	mov    esi,0x0
  80b04c:	48 89 c7             	mov    rdi,rax
  80b04f:	e8 fc 0a 00 00       	call   80bb50 <memset>
	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPT.DPTE[0].start_LBA,1,(unsigned char *)buf);
  80b054:	8b 85 b6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x24a]
  80b05a:	89 c2                	mov    edx,eax
  80b05c:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80b063:	49 89 c0             	mov    r8,rax
  80b066:	b9 01 00 00 00       	mov    ecx,0x1
  80b06b:	be 00 00 00 00       	mov    esi,0x0
  80b070:	bf 00 00 00 00       	mov    edi,0x0
  80b075:	e8 b1 cf ff ff       	call   80802b <request>
  80b07a:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    chk_result(r1);
  80b07d:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80b080:	89 c7                	mov    edi,eax
  80b082:	e8 58 d6 ff ff       	call   8086df <chk_result>

	root_sb = mount_fs("FAT32",&DPT.DPTE[0],buf);	//not dev node
  80b087:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80b08e:	48 8d 95 f0 fb ff ff 	lea    rdx,[rbp-0x410]
  80b095:	48 8d 8a be 01 00 00 	lea    rcx,[rdx+0x1be]
  80b09c:	48 89 c2             	mov    rdx,rax
  80b09f:	48 89 ce             	mov    rsi,rcx
  80b0a2:	bf 12 47 81 00       	mov    edi,0x814712
  80b0a7:	e8 81 c0 ff ff       	call   80712d <mount_fs>
  80b0ac:	48 89 05 f5 c4 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1c4f5],rax        # 4275a8 <root_sb>
}
  80b0b3:	90                   	nop
  80b0b4:	c9                   	leave  
  80b0b5:	c3                   	ret    

000000000080b0b6 <scrdown>:
//{
//    video_base=addr;
//    m_ptr=addr;
//}
void scrdown(void)
{
  80b0b6:	f3 0f 1e fa          	endbr64 
  80b0ba:	55                   	push   rbp
  80b0bb:	48 89 e5             	mov    rbp,rsp
    vpage_base+=SCREEN_W*2;
  80b0be:	48 8b 05 63 f4 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f463]        # 42a528 <vpage_base>
  80b0c5:	48 05 a0 00 00 00    	add    rax,0xa0
  80b0cb:	48 89 05 56 f4 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f456],rax        # 42a528 <vpage_base>
    page_boffset+=SCREEN_W*2;
  80b0d2:	8b 05 58 f4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f458]        # 42a530 <page_boffset>
  80b0d8:	05 a0 00 00 00       	add    eax,0xa0
  80b0dd:	89 05 4d f4 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f44d],eax        # 42a530 <page_boffset>
    if(vpage_base>=video_end)
  80b0e3:	48 8b 15 3e f4 c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1f43e]        # 42a528 <vpage_base>
  80b0ea:	48 8b 05 2f f4 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f42f]        # 42a520 <video_end>
  80b0f1:	48 39 c2             	cmp    rdx,rax
  80b0f4:	72 0e                	jb     80b104 <scrdown+0x4e>
        vpage_base=video_base;
  80b0f6:	48 8b 05 1b f4 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f41b]        # 42a518 <video_base>
  80b0fd:	48 89 05 24 f4 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f424],rax        # 42a528 <vpage_base>
    set_origin();
  80b104:	b8 00 00 00 00       	mov    eax,0x0
  80b109:	e8 6a 00 00 00       	call   80b178 <set_origin>
}
  80b10e:	90                   	nop
  80b10f:	5d                   	pop    rbp
  80b110:	c3                   	ret    

000000000080b111 <scrup>:
void scrup()
{
  80b111:	f3 0f 1e fa          	endbr64 
  80b115:	55                   	push   rbp
  80b116:	48 89 e5             	mov    rbp,rsp
    if(page_boffset<=0)
  80b119:	8b 05 11 f4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f411]        # 42a530 <page_boffset>
  80b11f:	85 c0                	test   eax,eax
  80b121:	75 24                	jne    80b147 <scrup+0x36>
    {
        page_boffset=0;
  80b123:	c7 05 03 f4 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f403],0x0        # 42a530 <page_boffset>
  80b12a:	00 00 00 
        vpage_base=video_base;
  80b12d:	48 8b 05 e4 f3 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f3e4]        # 42a518 <video_base>
  80b134:	48 89 05 ed f3 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f3ed],rax        # 42a528 <vpage_base>
        set_origin();
  80b13b:	b8 00 00 00 00       	mov    eax,0x0
  80b140:	e8 33 00 00 00       	call   80b178 <set_origin>
        return;
  80b145:	eb 2f                	jmp    80b176 <scrup+0x65>
    }
    vpage_base-=SCREEN_W*2;
  80b147:	48 8b 05 da f3 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f3da]        # 42a528 <vpage_base>
  80b14e:	48 2d a0 00 00 00    	sub    rax,0xa0
  80b154:	48 89 05 cd f3 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f3cd],rax        # 42a528 <vpage_base>
    page_boffset-=SCREEN_W*2;
  80b15b:	8b 05 cf f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f3cf]        # 42a530 <page_boffset>
  80b161:	2d a0 00 00 00       	sub    eax,0xa0
  80b166:	89 05 c4 f3 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f3c4],eax        # 42a530 <page_boffset>
    set_origin();
  80b16c:	b8 00 00 00 00       	mov    eax,0x0
  80b171:	e8 02 00 00 00       	call   80b178 <set_origin>
}
  80b176:	5d                   	pop    rbp
  80b177:	c3                   	ret    

000000000080b178 <set_origin>:
void set_origin(void)
{
  80b178:	f3 0f 1e fa          	endbr64 
  80b17c:	55                   	push   rbp
  80b17d:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  80b180:	fa                   	cli    
    outb(port_reg_index,12);
  80b181:	8b 05 b9 f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f3b9]        # 42a540 <port_reg_index>
  80b187:	0f b7 c0             	movzx  eax,ax
  80b18a:	be 0c 00 00 00       	mov    esi,0xc
  80b18f:	89 c7                	mov    edi,eax
  80b191:	e8 aa a8 ff ff       	call   805a40 <outb>
    outb(port_reg_v,(page_boffset>>9)&0xff);
  80b196:	8b 05 94 f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f394]        # 42a530 <page_boffset>
  80b19c:	c1 e8 09             	shr    eax,0x9
  80b19f:	0f b6 d0             	movzx  edx,al
  80b1a2:	8b 05 9c f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f39c]        # 42a544 <port_reg_v>
  80b1a8:	0f b7 c0             	movzx  eax,ax
  80b1ab:	89 d6                	mov    esi,edx
  80b1ad:	89 c7                	mov    edi,eax
  80b1af:	e8 8c a8 ff ff       	call   805a40 <outb>
    outb(port_reg_index,13);
  80b1b4:	8b 05 86 f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f386]        # 42a540 <port_reg_index>
  80b1ba:	0f b7 c0             	movzx  eax,ax
  80b1bd:	be 0d 00 00 00       	mov    esi,0xd
  80b1c2:	89 c7                	mov    edi,eax
  80b1c4:	e8 77 a8 ff ff       	call   805a40 <outb>
    outb(port_reg_v,(page_boffset>>1)&0xff);
  80b1c9:	8b 05 61 f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f361]        # 42a530 <page_boffset>
  80b1cf:	d1 e8                	shr    eax,1
  80b1d1:	0f b6 d0             	movzx  edx,al
  80b1d4:	8b 05 6a f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f36a]        # 42a544 <port_reg_v>
  80b1da:	0f b7 c0             	movzx  eax,ax
  80b1dd:	89 d6                	mov    esi,edx
  80b1df:	89 c7                	mov    edi,eax
  80b1e1:	e8 5a a8 ff ff       	call   805a40 <outb>
    asm volatile("sti");
  80b1e6:	fb                   	sti    

}
  80b1e7:	90                   	nop
  80b1e8:	5d                   	pop    rbp
  80b1e9:	c3                   	ret    

000000000080b1ea <init_tty>:
        .type=DEV_TYPE_CHRDEV,
        .flag=DEV_FLAG_USED,
        .drv=&drv_tty
};
void init_tty()
{
  80b1ea:	f3 0f 1e fa          	endbr64 
  80b1ee:	55                   	push   rbp
  80b1ef:	48 89 e5             	mov    rbp,rsp
  80b1f2:	48 83 ec 10          	sub    rsp,0x10
    strcpy(dev_tty.name,"tty0");
  80b1f6:	be 48 49 81 00       	mov    esi,0x814948
  80b1fb:	bf f4 47 81 00       	mov    edi,0x8147f4
  80b200:	e8 9a 09 00 00       	call   80bb9f <strcpy>
    strcpy(dev_stdout.name,"stdout");
  80b205:	be 4d 49 81 00       	mov    esi,0x81494d
  80b20a:	bf b4 48 81 00       	mov    edi,0x8148b4
  80b20f:	e8 8b 09 00 00       	call   80bb9f <strcpy>
    reg_driver(&drv_tty);
  80b214:	bf 40 47 81 00       	mov    edi,0x814740
  80b219:	e8 a7 76 ff ff       	call   8028c5 <reg_driver>
    reg_device(&dev_tty);
  80b21e:	bf e0 47 81 00       	mov    edi,0x8147e0
  80b223:	e8 b5 73 ff ff       	call   8025dd <reg_device>
    reg_device(&dev_stdout);
  80b228:	bf a0 48 81 00       	mov    edi,0x8148a0
  80b22d:	e8 ab 73 ff ff       	call   8025dd <reg_device>
    unsigned char *vp=0x20000;
  80b232:	48 c7 45 f8 00 00 02 	mov    QWORD PTR [rbp-0x8],0x20000
  80b239:	00 
    if(*vp==0x7)
  80b23a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b23e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b241:	3c 07                	cmp    al,0x7
  80b243:	75 36                	jne    80b27b <init_tty+0x91>
    {
        video_mode=VIDEO_MONOTEXT;
  80b245:	c7 05 e5 f2 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f2e5],0x0        # 42a534 <video_mode>
  80b24c:	00 00 00 
        video_base=0xb0000;
  80b24f:	48 c7 05 be f2 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f2be],0xb0000        # 42a518 <video_base>
  80b256:	00 00 0b 00 
        video_end=0xb8000-1;
  80b25a:	48 c7 05 bb f2 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f2bb],0xb7fff        # 42a520 <video_end>
  80b261:	ff 7f 0b 00 
        port_reg_index=0x3b4;
  80b265:	c7 05 d1 f2 c1 ff b4 	mov    DWORD PTR [rip+0xffffffffffc1f2d1],0x3b4        # 42a540 <port_reg_index>
  80b26c:	03 00 00 
        port_reg_v=0x3b5;
  80b26f:	c7 05 cb f2 c1 ff b5 	mov    DWORD PTR [rip+0xffffffffffc1f2cb],0x3b5        # 42a544 <port_reg_v>
  80b276:	03 00 00 
  80b279:	eb 61                	jmp    80b2dc <init_tty+0xf2>
    }else if(*vp<=0x3)
  80b27b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b27f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b282:	3c 03                	cmp    al,0x3
  80b284:	77 36                	ja     80b2bc <init_tty+0xd2>
    {
        video_mode=VIDEO_CHROMATEXT;
  80b286:	c7 05 a4 f2 c1 ff 01 	mov    DWORD PTR [rip+0xffffffffffc1f2a4],0x1        # 42a534 <video_mode>
  80b28d:	00 00 00 
        video_base=0xb8000;
  80b290:	48 c7 05 7d f2 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f27d],0xb8000        # 42a518 <video_base>
  80b297:	00 80 0b 00 
        video_end=0xc0000-1;
  80b29b:	48 c7 05 7a f2 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f27a],0xbffff        # 42a520 <video_end>
  80b2a2:	ff ff 0b 00 
        port_reg_index=0x3d4;
  80b2a6:	c7 05 90 f2 c1 ff d4 	mov    DWORD PTR [rip+0xffffffffffc1f290],0x3d4        # 42a540 <port_reg_index>
  80b2ad:	03 00 00 
        port_reg_v=0x3d5;
  80b2b0:	c7 05 8a f2 c1 ff d5 	mov    DWORD PTR [rip+0xffffffffffc1f28a],0x3d5        # 42a544 <port_reg_v>
  80b2b7:	03 00 00 
  80b2ba:	eb 20                	jmp    80b2dc <init_tty+0xf2>
    }else{
        video_mode=VIDEO_GRAPHICS;
  80b2bc:	c7 05 6e f2 c1 ff 02 	mov    DWORD PTR [rip+0xffffffffffc1f26e],0x2        # 42a534 <video_mode>
  80b2c3:	00 00 00 
        video_base=0xa0000;
  80b2c6:	48 c7 05 47 f2 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f247],0xa0000        # 42a518 <video_base>
  80b2cd:	00 00 0a 00 
        video_end=0xb0000-1;
  80b2d1:	48 c7 05 44 f2 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f244],0xaffff        # 42a520 <video_end>
  80b2d8:	ff ff 0a 00 
    }
    if(*vp<=0x1)line_chs=40;
  80b2dc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b2e0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b2e3:	3c 01                	cmp    al,0x1
  80b2e5:	77 0f                	ja     80b2f6 <init_tty+0x10c>
  80b2e7:	c7 05 4b f2 c1 ff 28 	mov    DWORD PTR [rip+0xffffffffffc1f24b],0x28        # 42a53c <line_chs>
  80b2ee:	00 00 00 
  80b2f1:	e9 91 00 00 00       	jmp    80b387 <init_tty+0x19d>
    else if(*vp<=0x3||*vp==0x7)line_chs=80;
  80b2f6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b2fa:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b2fd:	3c 03                	cmp    al,0x3
  80b2ff:	76 0b                	jbe    80b30c <init_tty+0x122>
  80b301:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b305:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b308:	3c 07                	cmp    al,0x7
  80b30a:	75 0c                	jne    80b318 <init_tty+0x12e>
  80b30c:	c7 05 26 f2 c1 ff 50 	mov    DWORD PTR [rip+0xffffffffffc1f226],0x50        # 42a53c <line_chs>
  80b313:	00 00 00 
  80b316:	eb 6f                	jmp    80b387 <init_tty+0x19d>
    else if(*vp<=0x5||*vp==0x9||*vp==0xd)line_chs=320;
  80b318:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b31c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b31f:	3c 05                	cmp    al,0x5
  80b321:	76 16                	jbe    80b339 <init_tty+0x14f>
  80b323:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b327:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b32a:	3c 09                	cmp    al,0x9
  80b32c:	74 0b                	je     80b339 <init_tty+0x14f>
  80b32e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b332:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b335:	3c 0d                	cmp    al,0xd
  80b337:	75 0c                	jne    80b345 <init_tty+0x15b>
  80b339:	c7 05 f9 f1 c1 ff 40 	mov    DWORD PTR [rip+0xffffffffffc1f1f9],0x140        # 42a53c <line_chs>
  80b340:	01 00 00 
  80b343:	eb 42                	jmp    80b387 <init_tty+0x19d>
    else if(*vp==0x6||*vp==0xa||*vp>=0xe)line_chs=640;
  80b345:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b349:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b34c:	3c 06                	cmp    al,0x6
  80b34e:	74 16                	je     80b366 <init_tty+0x17c>
  80b350:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b354:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b357:	3c 0a                	cmp    al,0xa
  80b359:	74 0b                	je     80b366 <init_tty+0x17c>
  80b35b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b35f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b362:	3c 0d                	cmp    al,0xd
  80b364:	76 0c                	jbe    80b372 <init_tty+0x188>
  80b366:	c7 05 cc f1 c1 ff 80 	mov    DWORD PTR [rip+0xffffffffffc1f1cc],0x280        # 42a53c <line_chs>
  80b36d:	02 00 00 
  80b370:	eb 15                	jmp    80b387 <init_tty+0x19d>
    else if(*vp==0x8)line_chs=160;
  80b372:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b376:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b379:	3c 08                	cmp    al,0x8
  80b37b:	75 0a                	jne    80b387 <init_tty+0x19d>
  80b37d:	c7 05 b5 f1 c1 ff a0 	mov    DWORD PTR [rip+0xffffffffffc1f1b5],0xa0        # 42a53c <line_chs>
  80b384:	00 00 00 
    switch (*vp)
  80b387:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b38b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b38e:	0f b6 c0             	movzx  eax,al
  80b391:	83 f8 14             	cmp    eax,0x14
  80b394:	77 61                	ja     80b3f7 <init_tty+0x20d>
  80b396:	89 c0                	mov    eax,eax
  80b398:	48 8b 04 c5 58 49 81 	mov    rax,QWORD PTR [rax*8+0x814958]
  80b39f:	00 
  80b3a0:	3e ff e0             	notrack jmp rax
    {
    case 0x0:case 0x1:vpage_size=40*25;break;
  80b3a3:	c7 05 9b f1 c1 ff e8 	mov    DWORD PTR [rip+0xffffffffffc1f19b],0x3e8        # 42a548 <vpage_size>
  80b3aa:	03 00 00 
  80b3ad:	eb 49                	jmp    80b3f8 <init_tty+0x20e>
    case 2:case 3:case 7:vpage_size=80*25;break;
  80b3af:	c7 05 8f f1 c1 ff d0 	mov    DWORD PTR [rip+0xffffffffffc1f18f],0x7d0        # 42a548 <vpage_size>
  80b3b6:	07 00 00 
  80b3b9:	eb 3d                	jmp    80b3f8 <init_tty+0x20e>
    case 4:case 5:case 9:case 0xd:vpage_size=320*200;break;
  80b3bb:	c7 05 83 f1 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f183],0xfa00        # 42a548 <vpage_size>
  80b3c2:	fa 00 00 
  80b3c5:	eb 31                	jmp    80b3f8 <init_tty+0x20e>
    case 6:case 0xa:case 0xe:vpage_size=640*200;break;
  80b3c7:	c7 05 77 f1 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f177],0x1f400        # 42a548 <vpage_size>
  80b3ce:	f4 01 00 
  80b3d1:	eb 25                	jmp    80b3f8 <init_tty+0x20e>
    case 8:vpage_size=160*200;break;
  80b3d3:	c7 05 6b f1 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f16b],0x7d00        # 42a548 <vpage_size>
  80b3da:	7d 00 00 
  80b3dd:	eb 19                	jmp    80b3f8 <init_tty+0x20e>
    case 0xf:case 0x10:case 0x11:vpage_size=640*350;break;
  80b3df:	c7 05 5f f1 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f15f],0x36b00        # 42a548 <vpage_size>
  80b3e6:	6b 03 00 
  80b3e9:	eb 0d                	jmp    80b3f8 <init_tty+0x20e>
    case 0x12:case 0x13:case 0x14:vpage_size=640*480;break;
  80b3eb:	c7 05 53 f1 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f153],0x4b000        # 42a548 <vpage_size>
  80b3f2:	b0 04 00 
  80b3f5:	eb 01                	jmp    80b3f8 <init_tty+0x20e>
    default:
        break;
  80b3f7:	90                   	nop
    }
    m_ptr=video_base;
  80b3f8:	48 8b 05 19 f1 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f119]        # 42a518 <video_base>
  80b3ff:	48 89 05 5a 13 00 00 	mov    QWORD PTR [rip+0x135a],rax        # 80c760 <m_ptr>
    page_boffset=0;
  80b406:	c7 05 20 f1 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f120],0x0        # 42a530 <page_boffset>
  80b40d:	00 00 00 
    vpage_base=video_base;
  80b410:	48 8b 05 01 f1 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f101]        # 42a518 <video_base>
  80b417:	48 89 05 0a f1 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f10a],rax        # 42a528 <vpage_base>
    vp++;
  80b41e:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    vpage=*vp;
  80b423:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b427:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b42a:	0f b6 c0             	movzx  eax,al
  80b42d:	89 05 05 f1 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f105],eax        # 42a538 <vpage>
    vp++;
  80b433:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    stline=*vp++;
  80b438:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b43c:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80b440:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80b444:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b447:	0f b6 c0             	movzx  eax,al
  80b44a:	89 05 04 f1 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f104],eax        # 42a554 <stline>
    endline=*vp++;
  80b450:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b454:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80b458:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80b45c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b45f:	0f b6 c0             	movzx  eax,al
  80b462:	89 05 f0 f0 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f0f0],eax        # 42a558 <endline>
    videoy=*vp++;
  80b468:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b46c:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80b470:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80b474:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b477:	0f b6 c0             	movzx  eax,al
  80b47a:	89 05 d0 f0 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f0d0],eax        # 42a550 <videoy>
    videox=*vp;
  80b480:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b484:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b487:	0f b6 c0             	movzx  eax,al
  80b48a:	89 05 bc f0 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f0bc],eax        # 42a54c <videox>
    //logf("video:\n mode:0x%x cursor:%d,%d\n",video_mode,\
    videoy,videox);
}
  80b490:	90                   	nop
  80b491:	c9                   	leave  
  80b492:	c3                   	ret    

000000000080b493 <seek_tty>:
char m_color=MONITOR_WHITE;
int seek_tty(driver_args * args)
{
  80b493:	f3 0f 1e fa          	endbr64 
  80b497:	55                   	push   rbp
  80b498:	48 89 e5             	mov    rbp,rsp
  80b49b:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pos=args->pos;
  80b49f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b4a3:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  80b4a6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    m_ptr=0xb8000+pos*2;
  80b4a9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b4ac:	05 00 c0 05 00       	add    eax,0x5c000
  80b4b1:	01 c0                	add    eax,eax
  80b4b3:	48 98                	cdqe   
  80b4b5:	48 89 05 a4 12 00 00 	mov    QWORD PTR [rip+0x12a4],rax        # 80c760 <m_ptr>
}
  80b4bc:	90                   	nop
  80b4bd:	5d                   	pop    rbp
  80b4be:	c3                   	ret    

000000000080b4bf <tell_monitor>:
int tell_monitor()
{
  80b4bf:	f3 0f 1e fa          	endbr64 
  80b4c3:	55                   	push   rbp
  80b4c4:	48 89 e5             	mov    rbp,rsp
    return (m_ptr-video_base)/2;
  80b4c7:	48 8b 05 92 12 00 00 	mov    rax,QWORD PTR [rip+0x1292]        # 80c760 <m_ptr>
  80b4ce:	48 8b 15 43 f0 c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1f043]        # 42a518 <video_base>
  80b4d5:	48 29 d0             	sub    rax,rdx
  80b4d8:	48 89 c2             	mov    rdx,rax
  80b4db:	48 c1 ea 3f          	shr    rdx,0x3f
  80b4df:	48 01 d0             	add    rax,rdx
  80b4e2:	48 d1 f8             	sar    rax,1
}
  80b4e5:	5d                   	pop    rbp
  80b4e6:	c3                   	ret    

000000000080b4e7 <del_ch>:
void del_ch()
{
  80b4e7:	f3 0f 1e fa          	endbr64 
  80b4eb:	55                   	push   rbp
  80b4ec:	48 89 e5             	mov    rbp,rsp
  80b4ef:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
    char *p=m_ptr-2;
  80b4f6:	48 8b 05 63 12 00 00 	mov    rax,QWORD PTR [rip+0x1263]        # 80c760 <m_ptr>
  80b4fd:	48 83 e8 02          	sub    rax,0x2
  80b501:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int pos=tell_monitor()%SCREEN_W;
  80b505:	b8 00 00 00 00       	mov    eax,0x0
  80b50a:	e8 b0 ff ff ff       	call   80b4bf <tell_monitor>
  80b50f:	89 c2                	mov    edx,eax
  80b511:	48 63 c2             	movsxd rax,edx
  80b514:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  80b51b:	48 c1 e8 20          	shr    rax,0x20
  80b51f:	c1 f8 05             	sar    eax,0x5
  80b522:	89 d1                	mov    ecx,edx
  80b524:	c1 f9 1f             	sar    ecx,0x1f
  80b527:	29 c8                	sub    eax,ecx
  80b529:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  80b52c:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  80b52f:	89 c8                	mov    eax,ecx
  80b531:	c1 e0 02             	shl    eax,0x2
  80b534:	01 c8                	add    eax,ecx
  80b536:	c1 e0 04             	shl    eax,0x4
  80b539:	29 c2                	sub    edx,eax
  80b53b:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
    for(;pos<SCREEN_W-1;pos++)
  80b53e:	eb 17                	jmp    80b557 <del_ch+0x70>
    {
        *p=*(p+2);
  80b540:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b544:	0f b6 50 02          	movzx  edx,BYTE PTR [rax+0x2]
  80b548:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b54c:	88 10                	mov    BYTE PTR [rax],dl
        p+=2;
  80b54e:	48 83 45 f8 02       	add    QWORD PTR [rbp-0x8],0x2
    for(;pos<SCREEN_W-1;pos++)
  80b553:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80b557:	83 7d f4 4e          	cmp    DWORD PTR [rbp-0xc],0x4e
  80b55b:	7e e3                	jle    80b540 <del_ch+0x59>
    }
    driver_args args= {
  80b55d:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  80b564:	b8 00 00 00 00       	mov    eax,0x0
  80b569:	b9 18 00 00 00       	mov    ecx,0x18
  80b56e:	48 89 d7             	mov    rdi,rdx
  80b571:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .pos=tell_monitor() - 1
  80b574:	b8 00 00 00 00       	mov    eax,0x0
  80b579:	e8 41 ff ff ff       	call   80b4bf <tell_monitor>
  80b57e:	83 e8 01             	sub    eax,0x1
    driver_args args= {
  80b581:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    };
    seek_tty(&args);
  80b587:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  80b58e:	48 89 c7             	mov    rdi,rax
  80b591:	e8 fd fe ff ff       	call   80b493 <seek_tty>
    set_cur();
  80b596:	b8 00 00 00 00       	mov    eax,0x0
  80b59b:	e8 03 00 00 00       	call   80b5a3 <set_cur>
}
  80b5a0:	90                   	nop
  80b5a1:	c9                   	leave  
  80b5a2:	c3                   	ret    

000000000080b5a3 <set_cur>:
void set_cur()
{
  80b5a3:	f3 0f 1e fa          	endbr64 
  80b5a7:	55                   	push   rbp
  80b5a8:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  80b5ab:	fa                   	cli    
    outb(port_reg_index,14);
  80b5ac:	8b 05 8e ef c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ef8e]        # 42a540 <port_reg_index>
  80b5b2:	0f b7 c0             	movzx  eax,ax
  80b5b5:	be 0e 00 00 00       	mov    esi,0xe
  80b5ba:	89 c7                	mov    edi,eax
  80b5bc:	e8 7f a4 ff ff       	call   805a40 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>9)&0xff);
  80b5c1:	48 8b 05 98 11 00 00 	mov    rax,QWORD PTR [rip+0x1198]        # 80c760 <m_ptr>
  80b5c8:	48 8b 15 49 ef c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1ef49]        # 42a518 <video_base>
  80b5cf:	48 29 d0             	sub    rax,rdx
  80b5d2:	48 c1 f8 09          	sar    rax,0x9
  80b5d6:	0f b6 d0             	movzx  edx,al
  80b5d9:	8b 05 65 ef c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ef65]        # 42a544 <port_reg_v>
  80b5df:	0f b7 c0             	movzx  eax,ax
  80b5e2:	89 d6                	mov    esi,edx
  80b5e4:	89 c7                	mov    edi,eax
  80b5e6:	e8 55 a4 ff ff       	call   805a40 <outb>
    outb(port_reg_index,15);
  80b5eb:	8b 05 4f ef c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ef4f]        # 42a540 <port_reg_index>
  80b5f1:	0f b7 c0             	movzx  eax,ax
  80b5f4:	be 0f 00 00 00       	mov    esi,0xf
  80b5f9:	89 c7                	mov    edi,eax
  80b5fb:	e8 40 a4 ff ff       	call   805a40 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>1)&0xff);
  80b600:	48 8b 05 59 11 00 00 	mov    rax,QWORD PTR [rip+0x1159]        # 80c760 <m_ptr>
  80b607:	48 8b 15 0a ef c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1ef0a]        # 42a518 <video_base>
  80b60e:	48 29 d0             	sub    rax,rdx
  80b611:	48 d1 f8             	sar    rax,1
  80b614:	0f b6 d0             	movzx  edx,al
  80b617:	8b 05 27 ef c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ef27]        # 42a544 <port_reg_v>
  80b61d:	0f b7 c0             	movzx  eax,ax
  80b620:	89 d6                	mov    esi,edx
  80b622:	89 c7                	mov    edi,eax
  80b624:	e8 17 a4 ff ff       	call   805a40 <outb>
    asm volatile("sti");
  80b629:	fb                   	sti    
}
  80b62a:	90                   	nop
  80b62b:	5d                   	pop    rbp
  80b62c:	c3                   	ret    

000000000080b62d <read_tty>:

int read_tty(driver_args *args)
{
  80b62d:	f3 0f 1e fa          	endbr64 
  80b631:	55                   	push   rbp
  80b632:	48 89 e5             	mov    rbp,rsp
  80b635:	48 83 ec 20          	sub    rsp,0x20
  80b639:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    char* dist=args->dist_addr;
  80b63d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b641:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80b644:	48 98                	cdqe   
  80b646:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  80b64a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b64e:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  80b651:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  80b654:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80b65b:	eb 4a                	jmp    80b6a7 <read_tty+0x7a>
    {
        *dist++=*m_ptr;
  80b65d:	48 8b 15 fc 10 00 00 	mov    rdx,QWORD PTR [rip+0x10fc]        # 80c760 <m_ptr>
  80b664:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b668:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80b66c:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80b670:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80b673:	88 10                	mov    BYTE PTR [rax],dl
        if(m_ptr==0xbffff&&i>0)
  80b675:	48 8b 05 e4 10 00 00 	mov    rax,QWORD PTR [rip+0x10e4]        # 80c760 <m_ptr>
  80b67c:	48 3d ff ff 0b 00    	cmp    rax,0xbffff
  80b682:	75 0d                	jne    80b691 <read_tty+0x64>
  80b684:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80b688:	7e 07                	jle    80b691 <read_tty+0x64>
        {
            return 1;//读到尾了
  80b68a:	b8 01 00 00 00       	mov    eax,0x1
  80b68f:	eb 2d                	jmp    80b6be <read_tty+0x91>
        }
        m_ptr+=2;
  80b691:	48 8b 05 c8 10 00 00 	mov    rax,QWORD PTR [rip+0x10c8]        # 80c760 <m_ptr>
  80b698:	48 83 c0 02          	add    rax,0x2
  80b69c:	48 89 05 bd 10 00 00 	mov    QWORD PTR [rip+0x10bd],rax        # 80c760 <m_ptr>
    for(int i=0;i<len;i++)
  80b6a3:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80b6a7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b6aa:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  80b6ad:	7c ae                	jl     80b65d <read_tty+0x30>
    }
    set_cur();
  80b6af:	b8 00 00 00 00       	mov    eax,0x0
  80b6b4:	e8 ea fe ff ff       	call   80b5a3 <set_cur>
    return 0;
  80b6b9:	b8 00 00 00 00       	mov    eax,0x0
}
  80b6be:	c9                   	leave  
  80b6bf:	c3                   	ret    

000000000080b6c0 <write_tty>:
int write_tty(driver_args *args)
{
  80b6c0:	f3 0f 1e fa          	endbr64 
  80b6c4:	55                   	push   rbp
  80b6c5:	48 89 e5             	mov    rbp,rsp
  80b6c8:	48 83 ec 30          	sub    rsp,0x30
  80b6cc:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char* src=args->src_addr;
  80b6d0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80b6d4:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b6d7:	48 98                	cdqe   
  80b6d9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  80b6dd:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80b6e1:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  80b6e4:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  80b6e7:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80b6ee:	e9 0b 01 00 00       	jmp    80b7fe <write_tty+0x13e>
    {
        if(*src=='\n')
  80b6f3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b6f7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b6fa:	3c 0a                	cmp    al,0xa
  80b6fc:	75 50                	jne    80b74e <write_tty+0x8e>
        {
            unsigned int off=m_ptr-0xb8000;
  80b6fe:	48 8b 05 5b 10 00 00 	mov    rax,QWORD PTR [rip+0x105b]        # 80c760 <m_ptr>
  80b705:	48 2d 00 80 0b 00    	sub    rax,0xb8000
  80b70b:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            off=(off/160+1)*160;
  80b70e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b711:	89 c2                	mov    edx,eax
  80b713:	b8 cd cc cc cc       	mov    eax,0xcccccccd
  80b718:	48 0f af c2          	imul   rax,rdx
  80b71c:	48 c1 e8 20          	shr    rax,0x20
  80b720:	c1 e8 07             	shr    eax,0x7
  80b723:	8d 50 01             	lea    edx,[rax+0x1]
  80b726:	89 d0                	mov    eax,edx
  80b728:	c1 e0 02             	shl    eax,0x2
  80b72b:	01 d0                	add    eax,edx
  80b72d:	c1 e0 05             	shl    eax,0x5
  80b730:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            ////logf("%x\n",off);
            m_ptr=0xb8000u+off;
  80b733:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b736:	05 00 80 0b 00       	add    eax,0xb8000
  80b73b:	89 c0                	mov    eax,eax
  80b73d:	48 89 05 1c 10 00 00 	mov    QWORD PTR [rip+0x101c],rax        # 80c760 <m_ptr>
            src++;
  80b744:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
            continue;
  80b749:	e9 ac 00 00 00       	jmp    80b7fa <write_tty+0x13a>
        }else if(*src=='\0')
  80b74e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b752:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b755:	84 c0                	test   al,al
  80b757:	0f 84 af 00 00 00    	je     80b80c <write_tty+0x14c>
            break;
        if(*src=='\b')
  80b75d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b761:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b764:	3c 08                	cmp    al,0x8
  80b766:	75 1e                	jne    80b786 <write_tty+0xc6>
        {
            m_ptr-=2;
  80b768:	48 8b 05 f1 0f 00 00 	mov    rax,QWORD PTR [rip+0xff1]        # 80c760 <m_ptr>
  80b76f:	48 83 e8 02          	sub    rax,0x2
  80b773:	48 89 05 e6 0f 00 00 	mov    QWORD PTR [rip+0xfe6],rax        # 80c760 <m_ptr>
            *m_ptr=0;
  80b77a:	48 8b 05 df 0f 00 00 	mov    rax,QWORD PTR [rip+0xfdf]        # 80c760 <m_ptr>
  80b781:	c6 00 00             	mov    BYTE PTR [rax],0x0
  80b784:	eb 3e                	jmp    80b7c4 <write_tty+0x104>
        }else
        {
            *m_ptr++=*src++;
  80b786:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80b78a:	48 8d 42 01          	lea    rax,[rdx+0x1]
  80b78e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  80b792:	48 8b 05 c7 0f 00 00 	mov    rax,QWORD PTR [rip+0xfc7]        # 80c760 <m_ptr>
  80b799:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80b79d:	48 89 0d bc 0f 00 00 	mov    QWORD PTR [rip+0xfbc],rcx        # 80c760 <m_ptr>
  80b7a4:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80b7a7:	88 10                	mov    BYTE PTR [rax],dl
            *m_ptr++=m_color;
  80b7a9:	48 8b 05 b0 0f 00 00 	mov    rax,QWORD PTR [rip+0xfb0]        # 80c760 <m_ptr>
  80b7b0:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80b7b4:	48 89 15 a5 0f 00 00 	mov    QWORD PTR [rip+0xfa5],rdx        # 80c760 <m_ptr>
  80b7bb:	0f b6 15 a6 0f 00 00 	movzx  edx,BYTE PTR [rip+0xfa6]        # 80c768 <m_color>
  80b7c2:	88 10                	mov    BYTE PTR [rax],dl
        }
        if(m_ptr-vpage_base>=vpage_size*2-line_chs*2&&i>0)
  80b7c4:	48 8b 05 95 0f 00 00 	mov    rax,QWORD PTR [rip+0xf95]        # 80c760 <m_ptr>
  80b7cb:	48 8b 0d 56 ed c1 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc1ed56]        # 42a528 <vpage_base>
  80b7d2:	48 29 c8             	sub    rax,rcx
  80b7d5:	48 89 c2             	mov    rdx,rax
  80b7d8:	8b 05 6a ed c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ed6a]        # 42a548 <vpage_size>
  80b7de:	8b 0d 58 ed c1 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc1ed58]        # 42a53c <line_chs>
  80b7e4:	29 c8                	sub    eax,ecx
  80b7e6:	01 c0                	add    eax,eax
  80b7e8:	48 98                	cdqe   
  80b7ea:	48 39 c2             	cmp    rdx,rax
  80b7ed:	7c 0b                	jl     80b7fa <write_tty+0x13a>
  80b7ef:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80b7f3:	7e 05                	jle    80b7fa <write_tty+0x13a>
        {
            //下滚一行
            scrdown();
  80b7f5:	e8 bc f8 ff ff       	call   80b0b6 <scrdown>
    for(int i=0;i<len;i++)
  80b7fa:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80b7fe:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b801:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  80b804:	0f 8c e9 fe ff ff    	jl     80b6f3 <write_tty+0x33>
  80b80a:	eb 01                	jmp    80b80d <write_tty+0x14d>
            break;
  80b80c:	90                   	nop
        }
    }
    set_cur();
  80b80d:	b8 00 00 00 00       	mov    eax,0x0
  80b812:	e8 8c fd ff ff       	call   80b5a3 <set_cur>
    return 0;
  80b817:	b8 00 00 00 00       	mov    eax,0x0
}
  80b81c:	c9                   	leave  
  80b81d:	c3                   	ret    

000000000080b81e <cls>:

void cls(driver_args *args)
{
  80b81e:	f3 0f 1e fa          	endbr64 
  80b822:	55                   	push   rbp
  80b823:	48 89 e5             	mov    rbp,rsp
  80b826:	48 83 ec 20          	sub    rsp,0x20
  80b82a:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<vpage_size*2;i+=2)
  80b82e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80b835:	eb 16                	jmp    80b84d <cls+0x2f>
    {
        vpage_base[i]=0;
  80b837:	48 8b 15 ea ec c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1ecea]        # 42a528 <vpage_base>
  80b83e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b841:	48 98                	cdqe   
  80b843:	48 01 d0             	add    rax,rdx
  80b846:	c6 00 00             	mov    BYTE PTR [rax],0x0
    for(int i=0;i<vpage_size*2;i+=2)
  80b849:	83 45 fc 02          	add    DWORD PTR [rbp-0x4],0x2
  80b84d:	8b 05 f5 ec c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ecf5]        # 42a548 <vpage_size>
  80b853:	01 c0                	add    eax,eax
  80b855:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  80b858:	7c dd                	jl     80b837 <cls+0x19>
    }
    m_ptr=vpage_base;
  80b85a:	48 8b 05 c7 ec c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1ecc7]        # 42a528 <vpage_base>
  80b861:	48 89 05 f8 0e 00 00 	mov    QWORD PTR [rip+0xef8],rax        # 80c760 <m_ptr>
    set_cur();
  80b868:	b8 00 00 00 00       	mov    eax,0x0
  80b86d:	e8 31 fd ff ff       	call   80b5a3 <set_cur>
}
  80b872:	90                   	nop
  80b873:	c9                   	leave  
  80b874:	c3                   	ret    

000000000080b875 <set_color>:

void set_color(char color)
{
  80b875:	f3 0f 1e fa          	endbr64 
  80b879:	55                   	push   rbp
  80b87a:	48 89 e5             	mov    rbp,rsp
  80b87d:	89 f8                	mov    eax,edi
  80b87f:	88 45 fc             	mov    BYTE PTR [rbp-0x4],al
    m_color=color;
  80b882:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80b886:	88 05 dc 0e 00 00    	mov    BYTE PTR [rip+0xedc],al        # 80c768 <m_color>
}
  80b88c:	90                   	nop
  80b88d:	5d                   	pop    rbp
  80b88e:	c3                   	ret    

000000000080b88f <tty_do_req>:

int tty_do_req(driver_args *args)
{
  80b88f:	f3 0f 1e fa          	endbr64 
  80b893:	55                   	push   rbp
  80b894:	48 89 e5             	mov    rbp,rsp
  80b897:	48 83 ec 10          	sub    rsp,0x10
  80b89b:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    switch (args->cmd)
  80b89f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b8a3:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  80b8a9:	83 f8 0d             	cmp    eax,0xd
  80b8ac:	74 45                	je     80b8f3 <tty_do_req+0x64>
  80b8ae:	83 f8 0d             	cmp    eax,0xd
  80b8b1:	7f 53                	jg     80b906 <tty_do_req+0x77>
  80b8b3:	83 f8 0c             	cmp    eax,0xc
  80b8b6:	74 2d                	je     80b8e5 <tty_do_req+0x56>
  80b8b8:	83 f8 0c             	cmp    eax,0xc
  80b8bb:	7f 49                	jg     80b906 <tty_do_req+0x77>
  80b8bd:	83 f8 02             	cmp    eax,0x2
  80b8c0:	74 07                	je     80b8c9 <tty_do_req+0x3a>
  80b8c2:	83 f8 03             	cmp    eax,0x3
  80b8c5:	74 10                	je     80b8d7 <tty_do_req+0x48>
  80b8c7:	eb 3d                	jmp    80b906 <tty_do_req+0x77>
    {
    case DRVF_READ:
        read_tty(args);
  80b8c9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b8cd:	48 89 c7             	mov    rdi,rax
  80b8d0:	e8 58 fd ff ff       	call   80b62d <read_tty>
        break;
  80b8d5:	eb 36                	jmp    80b90d <tty_do_req+0x7e>
    case DRVF_WRITE:
        write_tty(args);
  80b8d7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b8db:	48 89 c7             	mov    rdi,rax
  80b8de:	e8 dd fd ff ff       	call   80b6c0 <write_tty>
        break;
  80b8e3:	eb 28                	jmp    80b90d <tty_do_req+0x7e>
    case DRVF_SEEK:
        seek_tty(args);
  80b8e5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b8e9:	48 89 c7             	mov    rdi,rax
  80b8ec:	e8 a2 fb ff ff       	call   80b493 <seek_tty>
        break;
  80b8f1:	eb 1a                	jmp    80b90d <tty_do_req+0x7e>
    case DRVF_TELL:
        tell_monitor(args);
  80b8f3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b8f7:	48 89 c7             	mov    rdi,rax
  80b8fa:	b8 00 00 00 00       	mov    eax,0x0
  80b8ff:	e8 bb fb ff ff       	call   80b4bf <tell_monitor>
        break;
  80b904:	eb 07                	jmp    80b90d <tty_do_req+0x7e>
    default:return -1;
  80b906:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80b90b:	eb 05                	jmp    80b912 <tty_do_req+0x83>
    }
    return 0;
  80b90d:	b8 00 00 00 00       	mov    eax,0x0
}
  80b912:	c9                   	leave  
  80b913:	c3                   	ret    

000000000080b914 <init_com>:
//
#include "com.h"
#include "int.h"


void init_com(int base_port){
  80b914:	f3 0f 1e fa          	endbr64 
  80b918:	55                   	push   rbp
  80b919:	48 89 e5             	mov    rbp,rsp
  80b91c:	48 83 ec 10          	sub    rsp,0x10
  80b920:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    /* disable all interrupts */
    outb(base_port + COM_REG_IER, 0x00);
  80b923:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b926:	83 c0 01             	add    eax,0x1
  80b929:	0f b7 c0             	movzx  eax,ax
  80b92c:	be 00 00 00 00       	mov    esi,0x0
  80b931:	89 c7                	mov    edi,eax
  80b933:	e8 08 a1 ff ff       	call   805a40 <outb>
    
    /* enable DLAB to set bound rate divisor */
    outb(base_port + COM_REG_LCR, 0x80);
  80b938:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b93b:	83 c0 03             	add    eax,0x3
  80b93e:	0f b7 c0             	movzx  eax,ax
  80b941:	be 80 00 00 00       	mov    esi,0x80
  80b946:	89 c7                	mov    edi,eax
  80b948:	e8 f3 a0 ff ff       	call   805a40 <outb>
    
    /* set divisor to 38400 baud */
    outb(base_port + COM_REG_DLL, 0x03);
  80b94d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b950:	0f b7 c0             	movzx  eax,ax
  80b953:	be 03 00 00 00       	mov    esi,0x3
  80b958:	89 c7                	mov    edi,eax
  80b95a:	e8 e1 a0 ff ff       	call   805a40 <outb>
    outb(base_port + COM_REG_DLM, 0x00);
  80b95f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b962:	83 c0 01             	add    eax,0x1
  80b965:	0f b7 c0             	movzx  eax,ax
  80b968:	be 00 00 00 00       	mov    esi,0x0
  80b96d:	89 c7                	mov    edi,eax
  80b96f:	e8 cc a0 ff ff       	call   805a40 <outb>
    
    /* 8 data bits, parity off, 1 stop bit, DLAB latch off */
    outb(base_port + COM_REG_LCR, 0x03);
  80b974:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b977:	83 c0 03             	add    eax,0x3
  80b97a:	0f b7 c0             	movzx  eax,ax
  80b97d:	be 03 00 00 00       	mov    esi,0x3
  80b982:	89 c7                	mov    edi,eax
  80b984:	e8 b7 a0 ff ff       	call   805a40 <outb>
    
    /* enable FIFO */
    outb(base_port + COM_REG_FCR, 0xC7);
  80b989:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b98c:	83 c0 02             	add    eax,0x2
  80b98f:	0f b7 c0             	movzx  eax,ax
  80b992:	be c7 00 00 00       	mov    esi,0xc7
  80b997:	89 c7                	mov    edi,eax
  80b999:	e8 a2 a0 ff ff       	call   805a40 <outb>

    /* enable IRQs, set RTS/DSR */
    outb(base_port + COM_REG_MCR, 0x0B);
  80b99e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b9a1:	83 c0 04             	add    eax,0x4
  80b9a4:	0f b7 c0             	movzx  eax,ax
  80b9a7:	be 0b 00 00 00       	mov    esi,0xb
  80b9ac:	89 c7                	mov    edi,eax
  80b9ae:	e8 8d a0 ff ff       	call   805a40 <outb>
    
    /* set in loopback mode and test serial chip */
    outb(base_port + COM_REG_MCR, 0x1E);
  80b9b3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b9b6:	83 c0 04             	add    eax,0x4
  80b9b9:	0f b7 c0             	movzx  eax,ax
  80b9bc:	be 1e 00 00 00       	mov    esi,0x1e
  80b9c1:	89 c7                	mov    edi,eax
  80b9c3:	e8 78 a0 ff ff       	call   805a40 <outb>
    
    /* write a byte to test serial chip */
    outb(base_port + COM_REG_TX, "arttnba3"[0]);
  80b9c8:	b8 61 00 00 00       	mov    eax,0x61
  80b9cd:	0f b6 d0             	movzx  edx,al
  80b9d0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b9d3:	0f b7 c0             	movzx  eax,ax
  80b9d6:	89 d6                	mov    esi,edx
  80b9d8:	89 c7                	mov    edi,eax
  80b9da:	e8 61 a0 ff ff       	call   805a40 <outb>
    
    /* check if serial is faulty */
    if (inb(base_port + COM_REG_RX) != "arttnba3"[0]) {
  80b9df:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b9e2:	0f b6 c0             	movzx  eax,al
  80b9e5:	89 c7                	mov    edi,eax
  80b9e7:	e8 6d a0 ff ff       	call   805a59 <inb>
  80b9ec:	0f b6 d0             	movzx  edx,al
  80b9ef:	b8 61 00 00 00       	mov    eax,0x61
  80b9f4:	0f be c0             	movsx  eax,al
  80b9f7:	39 c2                	cmp    edx,eax
  80b9f9:	75 17                	jne    80ba12 <init_com+0xfe>
        return;
    }
    
    /* set in normal mode */
    outb(base_port + COM_REG_MCR, 0x0F);
  80b9fb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b9fe:	83 c0 04             	add    eax,0x4
  80ba01:	0f b7 c0             	movzx  eax,ax
  80ba04:	be 0f 00 00 00       	mov    esi,0xf
  80ba09:	89 c7                	mov    edi,eax
  80ba0b:	e8 30 a0 ff ff       	call   805a40 <outb>
  80ba10:	eb 01                	jmp    80ba13 <init_com+0xff>
        return;
  80ba12:	90                   	nop
}
  80ba13:	c9                   	leave  
  80ba14:	c3                   	ret    

000000000080ba15 <com_putchar>:
void com_putchar(unsigned short ch,int com_base)
{
  80ba15:	f3 0f 1e fa          	endbr64 
  80ba19:	55                   	push   rbp
  80ba1a:	48 89 e5             	mov    rbp,rsp
  80ba1d:	48 83 ec 20          	sub    rsp,0x20
  80ba21:	89 f8                	mov    eax,edi
  80ba23:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80ba26:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    unsigned char res;
    /* wait for the port to be ready */
    do {
        res = inb(com_base + COM_REG_LSR);
  80ba2a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80ba2d:	83 c0 05             	add    eax,0x5
  80ba30:	0f b6 c0             	movzx  eax,al
  80ba33:	89 c7                	mov    edi,eax
  80ba35:	e8 1f a0 ff ff       	call   805a59 <inb>
  80ba3a:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        res &= 0x20;
  80ba3d:	80 65 ff 20          	and    BYTE PTR [rbp-0x1],0x20
    } while (res == 0);
  80ba41:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  80ba45:	74 e3                	je     80ba2a <com_putchar+0x15>
    outb(com_base, ch);
  80ba47:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  80ba4b:	0f b6 d0             	movzx  edx,al
  80ba4e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80ba51:	0f b7 c0             	movzx  eax,ax
  80ba54:	89 d6                	mov    esi,edx
  80ba56:	89 c7                	mov    edi,eax
  80ba58:	e8 e3 9f ff ff       	call   805a40 <outb>
}
  80ba5d:	90                   	nop
  80ba5e:	c9                   	leave  
  80ba5f:	c3                   	ret    

000000000080ba60 <com_puts>:

void com_puts(char* s,int com_port){
  80ba60:	f3 0f 1e fa          	endbr64 
  80ba64:	55                   	push   rbp
  80ba65:	48 89 e5             	mov    rbp,rsp
  80ba68:	48 83 ec 10          	sub    rsp,0x10
  80ba6c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80ba70:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    for(;*s;s++){
  80ba73:	eb 1d                	jmp    80ba92 <com_puts+0x32>
        com_putchar(*s,com_port);
  80ba75:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ba79:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ba7c:	66 98                	cbw    
  80ba7e:	0f b7 c0             	movzx  eax,ax
  80ba81:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80ba84:	89 d6                	mov    esi,edx
  80ba86:	89 c7                	mov    edi,eax
  80ba88:	e8 88 ff ff ff       	call   80ba15 <com_putchar>
    for(;*s;s++){
  80ba8d:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  80ba92:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ba96:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ba99:	84 c0                	test   al,al
  80ba9b:	75 d8                	jne    80ba75 <com_puts+0x15>
    }
  80ba9d:	90                   	nop
  80ba9e:	90                   	nop
  80ba9f:	c9                   	leave  
  80baa0:	c3                   	ret    

000000000080baa1 <memcpy>:
#include "mem.h"
#include "typename.h"
static u32 mem_end;
static u32 usr_mem_base;
void memcpy(u8* dest, u8 *src,u32 size){
  80baa1:	f3 0f 1e fa          	endbr64 
  80baa5:	55                   	push   rbp
  80baa6:	48 89 e5             	mov    rbp,rsp
  80baa9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80baad:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80bab1:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    *dest=0xff;//如果页内存还没分配，这样就可以先激发缺页异常分配了，之后写数据就会完整不会少开头第一个字节。
  80bab4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bab8:	c6 00 ff             	mov    BYTE PTR [rax],0xff
    for(int i=0;i<size;i++){
  80babb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80bac2:	eb 1b                	jmp    80badf <memcpy+0x3e>
        *(dest)=*(src);
  80bac4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80bac8:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80bacb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bacf:	88 10                	mov    BYTE PTR [rax],dl
        dest++;
  80bad1:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        src++;
  80bad6:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<size;i++){
  80badb:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80badf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bae2:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
  80bae5:	77 dd                	ja     80bac4 <memcpy+0x23>
    }
}
  80bae7:	90                   	nop
  80bae8:	90                   	nop
  80bae9:	5d                   	pop    rbp
  80baea:	c3                   	ret    

000000000080baeb <memcmp>:
int memcmp(u8 *a,u8* b,int len)
{
  80baeb:	f3 0f 1e fa          	endbr64 
  80baef:	55                   	push   rbp
  80baf0:	48 89 e5             	mov    rbp,rsp
  80baf3:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80baf7:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80bafb:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    for(int i=0;i<len;i++)
  80bafe:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80bb05:	eb 3a                	jmp    80bb41 <memcmp+0x56>
    {
        if(*a!=*b)
  80bb07:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bb0b:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80bb0e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80bb12:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bb15:	38 c2                	cmp    dl,al
  80bb17:	74 1a                	je     80bb33 <memcmp+0x48>
            return *a-*b;
  80bb19:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bb1d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bb20:	0f b6 d0             	movzx  edx,al
  80bb23:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80bb27:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bb2a:	0f b6 c8             	movzx  ecx,al
  80bb2d:	89 d0                	mov    eax,edx
  80bb2f:	29 c8                	sub    eax,ecx
  80bb31:	eb 1b                	jmp    80bb4e <memcmp+0x63>
        a++;
  80bb33:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        b++;
  80bb38:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<len;i++)
  80bb3d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80bb41:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bb44:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  80bb47:	7c be                	jl     80bb07 <memcmp+0x1c>
    }
    return 0;
  80bb49:	b8 00 00 00 00       	mov    eax,0x0
}
  80bb4e:	5d                   	pop    rbp
  80bb4f:	c3                   	ret    

000000000080bb50 <memset>:
void memset(u8 *buf,u8 value,u32 size){
  80bb50:	f3 0f 1e fa          	endbr64 
  80bb54:	55                   	push   rbp
  80bb55:	48 89 e5             	mov    rbp,rsp
  80bb58:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80bb5c:	89 f0                	mov    eax,esi
  80bb5e:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
  80bb61:	88 45 e4             	mov    BYTE PTR [rbp-0x1c],al
    for(u32 i=0;i<size;i++){
  80bb64:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80bb6b:	eb 16                	jmp    80bb83 <memset+0x33>
        *(buf++)=value;
  80bb6d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bb71:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80bb75:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80bb79:	0f b6 55 e4          	movzx  edx,BYTE PTR [rbp-0x1c]
  80bb7d:	88 10                	mov    BYTE PTR [rax],dl
    for(u32 i=0;i<size;i++){
  80bb7f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80bb83:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bb86:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  80bb89:	72 e2                	jb     80bb6d <memset+0x1d>
    }
}
  80bb8b:	90                   	nop
  80bb8c:	90                   	nop
  80bb8d:	5d                   	pop    rbp
  80bb8e:	c3                   	ret    

000000000080bb8f <get_mem_size>:

u32 get_mem_size(){
  80bb8f:	f3 0f 1e fa          	endbr64 
  80bb93:	55                   	push   rbp
  80bb94:	48 89 e5             	mov    rbp,rsp
    return mem_end;
  80bb97:	8b 05 bf e9 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e9bf]        # 42a55c <mem_end>
}
  80bb9d:	5d                   	pop    rbp
  80bb9e:	c3                   	ret    

000000000080bb9f <strcpy>:
#include "str.h"
#include <stdarg.h>
void strcpy(unsigned char* dest, unsigned char *buf){
  80bb9f:	f3 0f 1e fa          	endbr64 
  80bba3:	55                   	push   rbp
  80bba4:	48 89 e5             	mov    rbp,rsp
  80bba7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bbab:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*buf!='\0'){
  80bbaf:	eb 1d                	jmp    80bbce <strcpy+0x2f>
        *(dest++)=*(buf++);
  80bbb1:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80bbb5:	48 8d 42 01          	lea    rax,[rdx+0x1]
  80bbb9:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  80bbbd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bbc1:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80bbc5:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80bbc9:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80bbcc:	88 10                	mov    BYTE PTR [rax],dl
    while(*buf!='\0'){
  80bbce:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bbd2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bbd5:	84 c0                	test   al,al
  80bbd7:	75 d8                	jne    80bbb1 <strcpy+0x12>
    }
    *dest='\0';
  80bbd9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bbdd:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80bbe0:	90                   	nop
  80bbe1:	5d                   	pop    rbp
  80bbe2:	c3                   	ret    

000000000080bbe3 <strtok>:
static char strtokkee[512],*strtokkeeptr=strtokkee;
static int tokptr=0;
static char retbuf[512],*retbptr=retbuf;
char* strtok(char *str,char splitter){
  80bbe3:	f3 0f 1e fa          	endbr64 
  80bbe7:	55                   	push   rbp
  80bbe8:	48 89 e5             	mov    rbp,rsp
  80bbeb:	48 83 ec 30          	sub    rsp,0x30
  80bbef:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80bbf3:	89 f0                	mov    eax,esi
  80bbf5:	88 45 d4             	mov    BYTE PTR [rbp-0x2c],al
    //limit: cannot cut string longer than 512
    if(str!=(void*)0){
  80bbf8:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80bbfd:	0f 84 9c 00 00 00    	je     80bc9f <strtok+0xbc>
        //cut for the first time
        strcpy(strtokkee,str);
  80bc03:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80bc07:	48 89 c6             	mov    rsi,rax
  80bc0a:	bf 80 a5 42 00       	mov    edi,0x42a580
  80bc0f:	e8 8b ff ff ff       	call   80bb9f <strcpy>
        char* ptr=strtokkee;
  80bc14:	48 c7 45 e8 80 a5 42 	mov    QWORD PTR [rbp-0x18],0x42a580
  80bc1b:	00 
        for(tokptr=0;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512);
  80bc1c:	c7 05 5a eb c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1eb5a],0x0        # 42a780 <tokptr>
  80bc23:	00 00 00 
  80bc26:	eb 1c                	jmp    80bc44 <strtok+0x61>
  80bc28:	8b 05 52 eb c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1eb52]        # 42a780 <tokptr>
  80bc2e:	83 c0 01             	add    eax,0x1
  80bc31:	99                   	cdq    
  80bc32:	c1 ea 17             	shr    edx,0x17
  80bc35:	01 d0                	add    eax,edx
  80bc37:	25 ff 01 00 00       	and    eax,0x1ff
  80bc3c:	29 d0                	sub    eax,edx
  80bc3e:	89 05 3c eb c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1eb3c],eax        # 42a780 <tokptr>
  80bc44:	8b 05 36 eb c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1eb36]        # 42a780 <tokptr>
  80bc4a:	48 98                	cdqe   
  80bc4c:	0f b6 80 80 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a580]
  80bc53:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80bc56:	74 13                	je     80bc6b <strtok+0x88>
  80bc58:	8b 05 22 eb c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1eb22]        # 42a780 <tokptr>
  80bc5e:	48 98                	cdqe   
  80bc60:	0f b6 80 80 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a580]
  80bc67:	84 c0                	test   al,al
  80bc69:	75 bd                	jne    80bc28 <strtok+0x45>
        strtokkee[tokptr]='\0';
  80bc6b:	8b 05 0f eb c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1eb0f]        # 42a780 <tokptr>
  80bc71:	48 98                	cdqe   
  80bc73:	c6 80 80 a5 42 00 00 	mov    BYTE PTR [rax+0x42a580],0x0
        tokptr=(tokptr+1)%512;
  80bc7a:	8b 05 00 eb c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1eb00]        # 42a780 <tokptr>
  80bc80:	83 c0 01             	add    eax,0x1
  80bc83:	99                   	cdq    
  80bc84:	c1 ea 17             	shr    edx,0x17
  80bc87:	01 d0                	add    eax,edx
  80bc89:	25 ff 01 00 00       	and    eax,0x1ff
  80bc8e:	29 d0                	sub    eax,edx
  80bc90:	89 05 ea ea c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1eaea],eax        # 42a780 <tokptr>
        return ptr;
  80bc96:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bc9a:	e9 9e 00 00 00       	jmp    80bd3d <strtok+0x15a>
    }
    //go on cutting
    int c=0;
  80bc9f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* ptr=strtokkee+tokptr;
  80bca6:	8b 05 d4 ea c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ead4]        # 42a780 <tokptr>
  80bcac:	48 98                	cdqe   
  80bcae:	48 05 80 a5 42 00    	add    rax,0x42a580
  80bcb4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512,c++);
  80bcb8:	eb 20                	jmp    80bcda <strtok+0xf7>
  80bcba:	8b 05 c0 ea c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1eac0]        # 42a780 <tokptr>
  80bcc0:	83 c0 01             	add    eax,0x1
  80bcc3:	99                   	cdq    
  80bcc4:	c1 ea 17             	shr    edx,0x17
  80bcc7:	01 d0                	add    eax,edx
  80bcc9:	25 ff 01 00 00       	and    eax,0x1ff
  80bcce:	29 d0                	sub    eax,edx
  80bcd0:	89 05 aa ea c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1eaaa],eax        # 42a780 <tokptr>
  80bcd6:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80bcda:	8b 05 a0 ea c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1eaa0]        # 42a780 <tokptr>
  80bce0:	48 98                	cdqe   
  80bce2:	0f b6 80 80 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a580]
  80bce9:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80bcec:	74 13                	je     80bd01 <strtok+0x11e>
  80bcee:	8b 05 8c ea c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ea8c]        # 42a780 <tokptr>
  80bcf4:	48 98                	cdqe   
  80bcf6:	0f b6 80 80 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a580]
  80bcfd:	84 c0                	test   al,al
  80bcff:	75 b9                	jne    80bcba <strtok+0xd7>
    strtokkee[tokptr]='\0';
  80bd01:	8b 05 79 ea c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ea79]        # 42a780 <tokptr>
  80bd07:	48 98                	cdqe   
  80bd09:	c6 80 80 a5 42 00 00 	mov    BYTE PTR [rax+0x42a580],0x0
    tokptr=(tokptr+1)%512;
  80bd10:	8b 05 6a ea c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ea6a]        # 42a780 <tokptr>
  80bd16:	83 c0 01             	add    eax,0x1
  80bd19:	99                   	cdq    
  80bd1a:	c1 ea 17             	shr    edx,0x17
  80bd1d:	01 d0                	add    eax,edx
  80bd1f:	25 ff 01 00 00       	and    eax,0x1ff
  80bd24:	29 d0                	sub    eax,edx
  80bd26:	89 05 54 ea c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1ea54],eax        # 42a780 <tokptr>
    if(c)
  80bd2c:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80bd30:	74 06                	je     80bd38 <strtok+0x155>
        return ptr;
  80bd32:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bd36:	eb 05                	jmp    80bd3d <strtok+0x15a>
    else
        return (void*)0;
  80bd38:	b8 00 00 00 00       	mov    eax,0x0
}
  80bd3d:	c9                   	leave  
  80bd3e:	c3                   	ret    

000000000080bd3f <strcmp>:
int strcmp(char *s1,char *s2)
{
  80bd3f:	f3 0f 1e fa          	endbr64 
  80bd43:	55                   	push   rbp
  80bd44:	48 89 e5             	mov    rbp,rsp
  80bd47:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bd4b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	while(*s1!='\0'&&*s2!='\0'){
  80bd4f:	eb 3c                	jmp    80bd8d <strcmp+0x4e>
		if(*s1>*s2)
  80bd51:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bd55:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80bd58:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bd5c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bd5f:	38 c2                	cmp    dl,al
  80bd61:	7e 07                	jle    80bd6a <strcmp+0x2b>
			return 1;
  80bd63:	b8 01 00 00 00       	mov    eax,0x1
  80bd68:	eb 52                	jmp    80bdbc <strcmp+0x7d>
		else if(*s1<*s2)
  80bd6a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bd6e:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80bd71:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bd75:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bd78:	38 c2                	cmp    dl,al
  80bd7a:	7d 07                	jge    80bd83 <strcmp+0x44>
			return -1;
  80bd7c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80bd81:	eb 39                	jmp    80bdbc <strcmp+0x7d>
		s1++;
  80bd83:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
		s2++;
  80bd88:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
	while(*s1!='\0'&&*s2!='\0'){
  80bd8d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bd91:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bd94:	84 c0                	test   al,al
  80bd96:	74 0b                	je     80bda3 <strcmp+0x64>
  80bd98:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bd9c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bd9f:	84 c0                	test   al,al
  80bda1:	75 ae                	jne    80bd51 <strcmp+0x12>
	}
	if(*s1==*s2)
  80bda3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bda7:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80bdaa:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bdae:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bdb1:	38 c2                	cmp    dl,al
  80bdb3:	75 07                	jne    80bdbc <strcmp+0x7d>
		return 0;
  80bdb5:	b8 00 00 00 00       	mov    eax,0x0
  80bdba:	eb 00                	jmp    80bdbc <strcmp+0x7d>
}
  80bdbc:	5d                   	pop    rbp
  80bdbd:	c3                   	ret    

000000000080bdbe <strlen>:

int strlen(char *str)
{
  80bdbe:	f3 0f 1e fa          	endbr64 
  80bdc2:	55                   	push   rbp
  80bdc3:	48 89 e5             	mov    rbp,rsp
  80bdc6:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int l=0;
  80bdca:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;*str!='\0';str++,l++);
  80bdd1:	eb 09                	jmp    80bddc <strlen+0x1e>
  80bdd3:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  80bdd8:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80bddc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bde0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bde3:	84 c0                	test   al,al
  80bde5:	75 ec                	jne    80bdd3 <strlen+0x15>
    return l;
  80bde7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80bdea:	5d                   	pop    rbp
  80bdeb:	c3                   	ret    

000000000080bdec <sprintf>:

void sprintf(char *dist, char *str,...)
{
  80bdec:	f3 0f 1e fa          	endbr64 
  80bdf0:	55                   	push   rbp
  80bdf1:	48 89 e5             	mov    rbp,rsp
  80bdf4:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  80bdfb:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  80be02:	48 89 b5 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rsi
  80be09:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  80be10:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  80be17:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  80be1e:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  80be25:	84 c0                	test   al,al
  80be27:	74 20                	je     80be49 <sprintf+0x5d>
  80be29:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  80be2d:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  80be31:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  80be35:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  80be39:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  80be3d:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  80be41:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  80be45:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7

    //count num of args
    char *pstr=str;
  80be49:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80be50:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char *prev=str;
  80be57:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80be5e:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    int argnum=0;
  80be65:	c7 85 3c ff ff ff 00 	mov    DWORD PTR [rbp-0xc4],0x0
  80be6c:	00 00 00 
    while (*pstr!='\n')
  80be6f:	eb 39                	jmp    80beaa <sprintf+0xbe>
    {
        if(*pstr=='%'&&*prev!='%')
  80be71:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80be78:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80be7b:	3c 25                	cmp    al,0x25
  80be7d:	75 15                	jne    80be94 <sprintf+0xa8>
  80be7f:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  80be86:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80be89:	3c 25                	cmp    al,0x25
  80be8b:	74 07                	je     80be94 <sprintf+0xa8>
            argnum++;
  80be8d:	83 85 3c ff ff ff 01 	add    DWORD PTR [rbp-0xc4],0x1
        prev=pstr;
  80be94:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80be9b:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
        pstr++;
  80bea2:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80bea9:	01 
    while (*pstr!='\n')
  80beaa:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80beb1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80beb4:	3c 0a                	cmp    al,0xa
  80beb6:	75 b9                	jne    80be71 <sprintf+0x85>
    }

    va_list vargs;
    va_start(vargs,str);
  80beb8:	c7 85 08 ff ff ff 10 	mov    DWORD PTR [rbp-0xf8],0x10
  80bebf:	00 00 00 
  80bec2:	c7 85 0c ff ff ff 30 	mov    DWORD PTR [rbp-0xf4],0x30
  80bec9:	00 00 00 
  80becc:	48 8d 45 10          	lea    rax,[rbp+0x10]
  80bed0:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  80bed7:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  80bede:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
    pstr=str;
  80bee5:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80beec:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    for(;*pstr!='\0';pstr++){
  80bef3:	e9 e2 01 00 00       	jmp    80c0da <sprintf+0x2ee>
        if(*pstr=='%'&&*(pstr+1)!='\0'){
  80bef8:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80beff:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bf02:	3c 25                	cmp    al,0x25
  80bf04:	0f 85 aa 01 00 00    	jne    80c0b4 <sprintf+0x2c8>
  80bf0a:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bf11:	48 83 c0 01          	add    rax,0x1
  80bf15:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bf18:	84 c0                	test   al,al
  80bf1a:	0f 84 94 01 00 00    	je     80c0b4 <sprintf+0x2c8>
            pstr++;
  80bf20:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80bf27:	01 
            if(*pstr=='x'){
  80bf28:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bf2f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bf32:	3c 78                	cmp    al,0x78
  80bf34:	75 64                	jne    80bf9a <sprintf+0x1ae>
                int v=va_arg(vargs,int);
  80bf36:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80bf3c:	83 f8 2f             	cmp    eax,0x2f
  80bf3f:	77 23                	ja     80bf64 <sprintf+0x178>
  80bf41:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80bf48:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80bf4e:	89 d2                	mov    edx,edx
  80bf50:	48 01 d0             	add    rax,rdx
  80bf53:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80bf59:	83 c2 08             	add    edx,0x8
  80bf5c:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80bf62:	eb 12                	jmp    80bf76 <sprintf+0x18a>
  80bf64:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80bf6b:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80bf6f:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80bf76:	8b 00                	mov    eax,DWORD PTR [rax]
  80bf78:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
                sprint_hex(dist,v);
  80bf7e:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
  80bf84:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80bf8b:	89 d6                	mov    esi,edx
  80bf8d:	48 89 c7             	mov    rdi,rax
  80bf90:	e8 4e 02 00 00       	call   80c1e3 <sprint_hex>
            if(*pstr=='x'){
  80bf95:	e9 38 01 00 00       	jmp    80c0d2 <sprintf+0x2e6>
            }else if(*pstr=='s'){
  80bf9a:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bfa1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bfa4:	3c 73                	cmp    al,0x73
  80bfa6:	75 68                	jne    80c010 <sprintf+0x224>
                char* v=va_arg(vargs,char*);
  80bfa8:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80bfae:	83 f8 2f             	cmp    eax,0x2f
  80bfb1:	77 23                	ja     80bfd6 <sprintf+0x1ea>
  80bfb3:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80bfba:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80bfc0:	89 d2                	mov    edx,edx
  80bfc2:	48 01 d0             	add    rax,rdx
  80bfc5:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80bfcb:	83 c2 08             	add    edx,0x8
  80bfce:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80bfd4:	eb 12                	jmp    80bfe8 <sprintf+0x1fc>
  80bfd6:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80bfdd:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80bfe1:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80bfe8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80bfeb:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
                sprintn(dist,v);
  80bff2:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
  80bff9:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80c000:	48 89 d6             	mov    rsi,rdx
  80c003:	48 89 c7             	mov    rdi,rax
  80c006:	e8 5a 02 00 00       	call   80c265 <sprintn>
            if(*pstr=='x'){
  80c00b:	e9 c2 00 00 00       	jmp    80c0d2 <sprintf+0x2e6>
            }else if(*pstr=='d'){
  80c010:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80c017:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c01a:	3c 64                	cmp    al,0x64
  80c01c:	75 66                	jne    80c084 <sprintf+0x298>
                char* v=va_arg(vargs,char*);
  80c01e:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80c024:	83 f8 2f             	cmp    eax,0x2f
  80c027:	77 23                	ja     80c04c <sprintf+0x260>
  80c029:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80c030:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80c036:	89 d2                	mov    edx,edx
  80c038:	48 01 d0             	add    rax,rdx
  80c03b:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80c041:	83 c2 08             	add    edx,0x8
  80c044:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80c04a:	eb 12                	jmp    80c05e <sprintf+0x272>
  80c04c:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80c053:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80c057:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80c05e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c061:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
                sprint_decimal(dist,v);
  80c068:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  80c06f:	89 c2                	mov    edx,eax
  80c071:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80c078:	89 d6                	mov    esi,edx
  80c07a:	48 89 c7             	mov    rdi,rax
  80c07d:	e8 ad 00 00 00       	call   80c12f <sprint_decimal>
            if(*pstr=='x'){
  80c082:	eb 4e                	jmp    80c0d2 <sprintf+0x2e6>
            }else if(*pstr=='c'){
  80c084:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80c08b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c08e:	3c 63                	cmp    al,0x63
  80c090:	75 02                	jne    80c094 <sprintf+0x2a8>
                char v=va_arg(vargs,char);
  80c092:	0f 0b                	ud2    
                sprintchar(dist,v);
            }else{
                sprintchar(dist,*pstr);
  80c094:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80c09b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c09e:	0f be d0             	movsx  edx,al
  80c0a1:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80c0a8:	89 d6                	mov    esi,edx
  80c0aa:	48 89 c7             	mov    rdi,rax
  80c0ad:	e8 3e 00 00 00       	call   80c0f0 <sprintchar>
            if(*pstr=='x'){
  80c0b2:	eb 1e                	jmp    80c0d2 <sprintf+0x2e6>
            }
        }else{
            sprintchar(dist,*pstr);
  80c0b4:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80c0bb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c0be:	0f be d0             	movsx  edx,al
  80c0c1:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80c0c8:	89 d6                	mov    esi,edx
  80c0ca:	48 89 c7             	mov    rdi,rax
  80c0cd:	e8 1e 00 00 00       	call   80c0f0 <sprintchar>
    for(;*pstr!='\0';pstr++){
  80c0d2:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80c0d9:	01 
  80c0da:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80c0e1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c0e4:	84 c0                	test   al,al
  80c0e6:	0f 85 0c fe ff ff    	jne    80bef8 <sprintf+0x10c>
        }
    }
    va_end(vargs);
}
  80c0ec:	90                   	nop
  80c0ed:	90                   	nop
  80c0ee:	c9                   	leave  
  80c0ef:	c3                   	ret    

000000000080c0f0 <sprintchar>:
void sprintchar(char *dist,char c)
{
  80c0f0:	f3 0f 1e fa          	endbr64 
  80c0f4:	55                   	push   rbp
  80c0f5:	48 89 e5             	mov    rbp,rsp
  80c0f8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80c0fc:	89 f0                	mov    eax,esi
  80c0fe:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    while(*dist!='\0')
  80c101:	eb 05                	jmp    80c108 <sprintchar+0x18>
        dist++;
  80c103:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    while(*dist!='\0')
  80c108:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c10c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c10f:	84 c0                	test   al,al
  80c111:	75 f0                	jne    80c103 <sprintchar+0x13>
    *dist++=c;
  80c113:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c117:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80c11b:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80c11f:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  80c123:	88 10                	mov    BYTE PTR [rax],dl
    *dist='\0';
  80c125:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c129:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80c12c:	90                   	nop
  80c12d:	5d                   	pop    rbp
  80c12e:	c3                   	ret    

000000000080c12f <sprint_decimal>:
void sprint_decimal(char *dist,int c)
{
  80c12f:	f3 0f 1e fa          	endbr64 
  80c133:	55                   	push   rbp
  80c134:	48 89 e5             	mov    rbp,rsp
  80c137:	48 83 ec 30          	sub    rsp,0x30
  80c13b:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80c13f:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
    unsigned char st[22];
    int p=0;
  80c142:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<sizeof(unsigned long)*2){
  80c149:	eb 65                	jmp    80c1b0 <sprint_decimal+0x81>
        unsigned char a=c%10+'0';
  80c14b:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  80c14e:	48 63 c2             	movsxd rax,edx
  80c151:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  80c158:	48 c1 e8 20          	shr    rax,0x20
  80c15c:	c1 f8 02             	sar    eax,0x2
  80c15f:	89 d6                	mov    esi,edx
  80c161:	c1 fe 1f             	sar    esi,0x1f
  80c164:	29 f0                	sub    eax,esi
  80c166:	89 c1                	mov    ecx,eax
  80c168:	89 c8                	mov    eax,ecx
  80c16a:	c1 e0 02             	shl    eax,0x2
  80c16d:	01 c8                	add    eax,ecx
  80c16f:	01 c0                	add    eax,eax
  80c171:	89 d1                	mov    ecx,edx
  80c173:	29 c1                	sub    ecx,eax
  80c175:	89 c8                	mov    eax,ecx
  80c177:	83 c0 30             	add    eax,0x30
  80c17a:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        st[p++]=a;
  80c17d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c180:	8d 50 01             	lea    edx,[rax+0x1]
  80c183:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80c186:	48 98                	cdqe   
  80c188:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80c18c:	88 54 05 e0          	mov    BYTE PTR [rbp+rax*1-0x20],dl
        c/=10;
  80c190:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80c193:	48 63 d0             	movsxd rdx,eax
  80c196:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
  80c19d:	48 c1 ea 20          	shr    rdx,0x20
  80c1a1:	c1 fa 02             	sar    edx,0x2
  80c1a4:	c1 f8 1f             	sar    eax,0x1f
  80c1a7:	89 c1                	mov    ecx,eax
  80c1a9:	89 d0                	mov    eax,edx
  80c1ab:	29 c8                	sub    eax,ecx
  80c1ad:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    while(p<sizeof(unsigned long)*2){
  80c1b0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c1b3:	83 f8 0f             	cmp    eax,0xf
  80c1b6:	76 93                	jbe    80c14b <sprint_decimal+0x1c>
    }
    while(p>0)
  80c1b8:	eb 1f                	jmp    80c1d9 <sprint_decimal+0xaa>
    {
        sprintchar(dist,st[--p]);
  80c1ba:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80c1be:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c1c1:	48 98                	cdqe   
  80c1c3:	0f b6 44 05 e0       	movzx  eax,BYTE PTR [rbp+rax*1-0x20]
  80c1c8:	0f be d0             	movsx  edx,al
  80c1cb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80c1cf:	89 d6                	mov    esi,edx
  80c1d1:	48 89 c7             	mov    rdi,rax
  80c1d4:	e8 17 ff ff ff       	call   80c0f0 <sprintchar>
    while(p>0)
  80c1d9:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80c1dd:	7f db                	jg     80c1ba <sprint_decimal+0x8b>
    }
}
  80c1df:	90                   	nop
  80c1e0:	90                   	nop
  80c1e1:	c9                   	leave  
  80c1e2:	c3                   	ret    

000000000080c1e3 <sprint_hex>:
void sprint_hex(char *dist,unsigned int c)
{
  80c1e3:	f3 0f 1e fa          	endbr64 
  80c1e7:	55                   	push   rbp
  80c1e8:	48 89 e5             	mov    rbp,rsp
  80c1eb:	48 83 ec 20          	sub    rsp,0x20
  80c1ef:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80c1f3:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    unsigned char st[10];
    int p=0;
  80c1f6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<10){
  80c1fd:	eb 35                	jmp    80c234 <sprint_hex+0x51>
        unsigned char a=c%16;
  80c1ff:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80c202:	83 e0 0f             	and    eax,0xf
  80c205:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        if(a>9)a+='a'-10;
  80c208:	80 7d fb 09          	cmp    BYTE PTR [rbp-0x5],0x9
  80c20c:	76 06                	jbe    80c214 <sprint_hex+0x31>
  80c20e:	80 45 fb 57          	add    BYTE PTR [rbp-0x5],0x57
  80c212:	eb 04                	jmp    80c218 <sprint_hex+0x35>
        else a+='0';
  80c214:	80 45 fb 30          	add    BYTE PTR [rbp-0x5],0x30
        st[p++]=a;
  80c218:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c21b:	8d 50 01             	lea    edx,[rax+0x1]
  80c21e:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80c221:	48 98                	cdqe   
  80c223:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80c227:	88 54 05 f1          	mov    BYTE PTR [rbp+rax*1-0xf],dl
        c/=16;
  80c22b:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80c22e:	c1 e8 04             	shr    eax,0x4
  80c231:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    while(p<10){
  80c234:	83 7d fc 09          	cmp    DWORD PTR [rbp-0x4],0x9
  80c238:	7e c5                	jle    80c1ff <sprint_hex+0x1c>
    }
    while(p>0)
  80c23a:	eb 1f                	jmp    80c25b <sprint_hex+0x78>
    {
        sprintchar(dist,st[--p]);
  80c23c:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80c240:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c243:	48 98                	cdqe   
  80c245:	0f b6 44 05 f1       	movzx  eax,BYTE PTR [rbp+rax*1-0xf]
  80c24a:	0f be d0             	movsx  edx,al
  80c24d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c251:	89 d6                	mov    esi,edx
  80c253:	48 89 c7             	mov    rdi,rax
  80c256:	e8 95 fe ff ff       	call   80c0f0 <sprintchar>
    while(p>0)
  80c25b:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80c25f:	7f db                	jg     80c23c <sprint_hex+0x59>
    }
}
  80c261:	90                   	nop
  80c262:	90                   	nop
  80c263:	c9                   	leave  
  80c264:	c3                   	ret    

000000000080c265 <sprintn>:
void sprintn(char *dist,char *str)
{
  80c265:	f3 0f 1e fa          	endbr64 
  80c269:	55                   	push   rbp
  80c26a:	48 89 e5             	mov    rbp,rsp
  80c26d:	48 83 ec 10          	sub    rsp,0x10
  80c271:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80c275:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*str!='\0')
  80c279:	eb 20                	jmp    80c29b <sprintn+0x36>
    {
        sprintchar(dist,*str++);
  80c27b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c27f:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80c283:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  80c287:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c28a:	0f be d0             	movsx  edx,al
  80c28d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c291:	89 d6                	mov    esi,edx
  80c293:	48 89 c7             	mov    rdi,rax
  80c296:	e8 55 fe ff ff       	call   80c0f0 <sprintchar>
    while(*str!='\0')
  80c29b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c29f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c2a2:	84 c0                	test   al,al
  80c2a4:	75 d5                	jne    80c27b <sprintn+0x16>
    }
  80c2a6:	90                   	nop
  80c2a7:	90                   	nop
  80c2a8:	c9                   	leave  
  80c2a9:	c3                   	ret    
  80c2aa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

000000000080c2b0 <create_zero>:
  80c2b0:	e8 2a 76 ff ff       	call   8038df <req_proc>
  80c2b5:	83 f8 ff             	cmp    eax,0xffffffff
  80c2b8:	74 0c                	je     80c2c6 <create_zero.retu>
  80c2ba:	e8 19 77 ff ff       	call   8039d8 <set_proc>
  80c2bf:	67 8b 04 24          	mov    eax,DWORD PTR [esp]
  80c2c3:	83 c4 40             	add    esp,0x40

000000000080c2c6 <create_zero.retu>:
  80c2c6:	c3                   	ret    

000000000080c2c7 <fill_desc>:
  80c2c7:	55                   	push   rbp
  80c2c8:	48 89 e5             	mov    rbp,rsp
  80c2cb:	67 8b 45 14          	mov    eax,DWORD PTR [ebp+0x14]
  80c2cf:	67 8b 5d 10          	mov    ebx,DWORD PTR [ebp+0x10]
  80c2d3:	67 8b 4d 0c          	mov    ecx,DWORD PTR [ebp+0xc]
  80c2d7:	67 8b 55 08          	mov    edx,DWORD PTR [ebp+0x8]
  80c2db:	be 1a c4 80 00       	mov    esi,0x80c41a
  80c2e0:	c7 04 25 1a c4 80 00 	mov    DWORD PTR ds:0x80c41a,0x0
  80c2e7:	00 00 00 00 
  80c2eb:	c7 04 25 1e c4 80 00 	mov    DWORD PTR ds:0x80c41e,0x0
  80c2f2:	00 00 00 00 
  80c2f6:	66 67 89 0e          	mov    WORD PTR [esi],cx
  80c2fa:	c1 e9 10             	shr    ecx,0x10
  80c2fd:	66 67 89 56 02       	mov    WORD PTR [esi+0x2],dx
  80c302:	c1 ea 10             	shr    edx,0x10
  80c305:	67 88 56 04          	mov    BYTE PTR [esi+0x4],dl
  80c309:	66 c1 ea 08          	shr    dx,0x8
  80c30d:	67 88 56 07          	mov    BYTE PTR [esi+0x7],dl
  80c311:	66 67 89 5e 05       	mov    WORD PTR [esi+0x5],bx
  80c316:	67 8b 7e 04          	mov    edi,DWORD PTR [esi+0x4]
  80c31a:	c1 e1 08             	shl    ecx,0x8
  80c31d:	09 cf                	or     edi,ecx
  80c31f:	67 89 7e 04          	mov    DWORD PTR [esi+0x4],edi
  80c323:	8b 14 25 1a c4 80 00 	mov    edx,DWORD PTR ds:0x80c41a
  80c32a:	67 89 10             	mov    DWORD PTR [eax],edx
  80c32d:	8b 14 25 1e c4 80 00 	mov    edx,DWORD PTR ds:0x80c41e
  80c334:	67 89 50 04          	mov    DWORD PTR [eax+0x4],edx
  80c338:	c9                   	leave  
  80c339:	c3                   	ret    

000000000080c33a <switch_proc_asm>:
  80c33a:	66 67 8b 44 24 04    	mov    ax,WORD PTR [esp+0x4]
  80c340:	66 89 04 25 58 c3 80 	mov    WORD PTR ds:0x80c358,ax
  80c347:	00 
  80c348:	c7 04 25 54 c3 80 00 	mov    DWORD PTR ds:0x80c354,0x0
  80c34f:	00 00 00 00 

000000000080c353 <switch_proc_asm.ljmp>:
  80c353:	ea                   	(bad)  
  80c354:	00 00                	add    BYTE PTR [rax],al
  80c356:	00 00                	add    BYTE PTR [rax],al
  80c358:	00 00                	add    BYTE PTR [rax],al
  80c35a:	c3                   	ret    

000000000080c35b <switch_to_old>:
  80c35b:	67 8b 74 24 04       	mov    esi,DWORD PTR [esp+0x4]
  80c360:	67 8b 5e 20          	mov    ebx,DWORD PTR [esi+0x20]
  80c364:	bf cc c3 80 00       	mov    edi,0x80c3cc
  80c369:	67 89 5f 01          	mov    DWORD PTR [edi+0x1],ebx
  80c36d:	67 8b 46 38          	mov    eax,DWORD PTR [esi+0x38]
  80c371:	89 c1                	mov    ecx,eax
  80c373:	83 e9 04             	sub    ecx,0x4
  80c376:	67 89 19             	mov    DWORD PTR [ecx],ebx
  80c379:	50                   	push   rax
  80c37a:	89 f5                	mov    ebp,esi
  80c37c:	83 c5 28             	add    ebp,0x28
  80c37f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c383:	50                   	push   rax
  80c384:	83 c5 04             	add    ebp,0x4
  80c387:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c38b:	50                   	push   rax
  80c38c:	83 c5 04             	add    ebp,0x4
  80c38f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c393:	50                   	push   rax
  80c394:	83 c5 04             	add    ebp,0x4
  80c397:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c39b:	50                   	push   rax
  80c39c:	83 c5 04             	add    ebp,0x4
  80c39f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c3a3:	50                   	push   rax
  80c3a4:	83 c5 04             	add    ebp,0x4
  80c3a7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c3ab:	50                   	push   rax
  80c3ac:	83 c5 04             	add    ebp,0x4
  80c3af:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c3b3:	50                   	push   rax
  80c3b4:	83 c5 04             	add    ebp,0x4
  80c3b7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c3bb:	50                   	push   rax
  80c3bc:	83 c5 04             	add    ebp,0x4
  80c3bf:	67 8b 46 1c          	mov    eax,DWORD PTR [esi+0x1c]
  80c3c3:	0f 22 d8             	mov    cr3,rax
  80c3c6:	67 8b 46 24          	mov    eax,DWORD PTR [esi+0x24]
  80c3ca:	50                   	push   rax
  80c3cb:	5c                   	pop    rsp

000000000080c3cc <switch_to_old.leap>:
  80c3cc:	ea                   	(bad)  
  80c3cd:	00 00                	add    BYTE PTR [rax],al
  80c3cf:	00 00                	add    BYTE PTR [rax],al
  80c3d1:	08 00                	or     BYTE PTR [rax],al

000000000080c3d3 <save_context>:
  80c3d3:	67 8b 44 24 24       	mov    eax,DWORD PTR [esp+0x24]
  80c3d8:	83 c0 44             	add    eax,0x44
  80c3db:	b9 08 00 00 00       	mov    ecx,0x8
  80c3e0:	89 e7                	mov    edi,esp

000000000080c3e2 <save_context.loops>:
  80c3e2:	67 8b 17             	mov    edx,DWORD PTR [edi]
  80c3e5:	67 89 10             	mov    DWORD PTR [eax],edx
  80c3e8:	83 c7 04             	add    edi,0x4
  80c3eb:	83 e8 04             	sub    eax,0x4
  80c3ee:	e2 f2                	loop   80c3e2 <save_context.loops>
  80c3f0:	5b                   	pop    rbx
  80c3f1:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  80c3f6:	67 89 58 24          	mov    DWORD PTR [eax+0x24],ebx
  80c3fa:	67 48 8b 1c 24       	mov    rbx,QWORD PTR [esp]
  80c3ff:	67 89 58 20          	mov    DWORD PTR [eax+0x20],ebx
  80c403:	c3                   	ret    

000000000080c404 <move_to_user_mode>:
  80c404:	66 b8 20 00          	mov    ax,0x20
  80c408:	8e d8                	mov    ds,eax
  80c40a:	8e c0                	mov    es,eax
  80c40c:	8e e8                	mov    gs,eax
  80c40e:	6a 20                	push   0x20
  80c410:	54                   	push   rsp
  80c411:	6a 18                	push   0x18
  80c413:	68 19 c4 80 00       	push   0x80c419
  80c418:	cf                   	iret   

000000000080c419 <move_to_user_mode.done>:
  80c419:	c3                   	ret    

000000000080c41a <desc>:
	...

000000000080c422 <ret_sys_call>:
  80c422:	58                   	pop    rax
  80c423:	8e d8                	mov    ds,eax
  80c425:	58                   	pop    rax
  80c426:	8e c0                	mov    es,eax
  80c428:	41 5f                	pop    r15
  80c42a:	41 5e                	pop    r14
  80c42c:	41 5d                	pop    r13
  80c42e:	41 5c                	pop    r12
  80c430:	41 5b                	pop    r11
  80c432:	41 5a                	pop    r10
  80c434:	41 59                	pop    r9
  80c436:	41 58                	pop    r8
  80c438:	5e                   	pop    rsi
  80c439:	5f                   	pop    rdi
  80c43a:	5a                   	pop    rdx
  80c43b:	59                   	pop    rcx
  80c43c:	5b                   	pop    rbx
  80c43d:	58                   	pop    rax

000000000080c43e <tmp>:
  80c43e:	48 0f 07             	sysretq 

000000000080c441 <ret_normal_proc>:
  80c441:	58                   	pop    rax
  80c442:	8e d8                	mov    ds,eax
  80c444:	58                   	pop    rax
  80c445:	8e c0                	mov    es,eax
  80c447:	41 5f                	pop    r15
  80c449:	41 5e                	pop    r14
  80c44b:	41 5d                	pop    r13
  80c44d:	41 5c                	pop    r12
  80c44f:	41 5b                	pop    r11
  80c451:	41 5a                	pop    r10
  80c453:	41 59                	pop    r9
  80c455:	41 58                	pop    r8
  80c457:	5e                   	pop    rsi
  80c458:	5f                   	pop    rdi
  80c459:	5a                   	pop    rdx
  80c45a:	59                   	pop    rcx
  80c45b:	5b                   	pop    rbx
  80c45c:	58                   	pop    rax
  80c45d:	c3                   	ret    
