
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
  800194:	b8 f2 12 80 00       	mov    eax,0x8012f2
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
  800217:	b8 0d 84 80 00       	mov    eax,0x80840d
  80021c:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800221:	ba 08 00 00 00       	mov    edx,0x8
  800226:	48 89 c6             	mov    rsi,rax
  800229:	bf 21 00 00 00       	mov    edi,0x21
  80022e:	e8 02 01 00 00       	call   800335 <set_gate>
	set_gate(0x20,(addr_t)clock,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800233:	b8 00 62 80 00       	mov    eax,0x806200
  800238:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80023d:	ba 08 00 00 00       	mov    edx,0x8
  800242:	48 89 c6             	mov    rsi,rax
  800245:	bf 20 00 00 00       	mov    edi,0x20
  80024a:	e8 e6 00 00 00       	call   800335 <set_gate>
	set_gate(0x2e,(addr_t)disk_int_handler,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80024f:	b8 00 94 80 00       	mov    eax,0x809400
  800254:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800259:	ba 08 00 00 00       	mov    edx,0x8
  80025e:	48 89 c6             	mov    rsi,rax
  800261:	bf 2e 00 00 00       	mov    edi,0x2e
  800266:	e8 ca 00 00 00       	call   800335 <set_gate>
    set_gate(0x80,(addr_t)_syscall,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);//
  80026b:	b8 d0 6c 80 00       	mov    eax,0x806cd0
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
  800291:	e8 da 5c 00 00       	call   805f70 <outb>
	outb(0xA0,0x11);
  800296:	be 11 00 00 00       	mov    esi,0x11
  80029b:	bf a0 00 00 00       	mov    edi,0xa0
  8002a0:	e8 cb 5c 00 00       	call   805f70 <outb>
	//ICW2
	outb(0x21,0x20);//former 0x20,0x20
  8002a5:	be 20 00 00 00       	mov    esi,0x20
  8002aa:	bf 21 00 00 00       	mov    edi,0x21
  8002af:	e8 bc 5c 00 00       	call   805f70 <outb>
	outb(0xA1,0x28);
  8002b4:	be 28 00 00 00       	mov    esi,0x28
  8002b9:	bf a1 00 00 00       	mov    edi,0xa1
  8002be:	e8 ad 5c 00 00       	call   805f70 <outb>
	//ICW3
	outb(0x21,0x04);
  8002c3:	be 04 00 00 00       	mov    esi,0x4
  8002c8:	bf 21 00 00 00       	mov    edi,0x21
  8002cd:	e8 9e 5c 00 00       	call   805f70 <outb>
	outb(0xA1,0x02);
  8002d2:	be 02 00 00 00       	mov    esi,0x2
  8002d7:	bf a1 00 00 00       	mov    edi,0xa1
  8002dc:	e8 8f 5c 00 00       	call   805f70 <outb>
	//ICW4
	outb(0x21,0x01);
  8002e1:	be 01 00 00 00       	mov    esi,0x1
  8002e6:	bf 21 00 00 00       	mov    edi,0x21
  8002eb:	e8 80 5c 00 00       	call   805f70 <outb>
	outb(0xA1,0x01);
  8002f0:	be 01 00 00 00       	mov    esi,0x1
  8002f5:	bf a1 00 00 00       	mov    edi,0xa1
  8002fa:	e8 71 5c 00 00       	call   805f70 <outb>

    turn_on_int();
  8002ff:	b8 00 00 00 00       	mov    eax,0x0
  800304:	e8 a1 5c 00 00       	call   805faa <turn_on_int>


    //设置IA32_LSTAR,为syscall做设置
    wrmsr(0xc0000082, _syscall);
  800309:	b8 d0 6c 80 00       	mov    eax,0x806cd0
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
  800350:	48 8b 15 69 c5 00 00 	mov    rdx,QWORD PTR [rip+0xc569]        # 80c8c0 <idt>
  800357:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80035b:	48 c1 e0 04          	shl    rax,0x4
  80035f:	48 01 d0             	add    rax,rdx
  800362:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800366:	66 89 10             	mov    WORD PTR [rax],dx
    idt[index].offset_mid=(offset>>16)&0xffff;
  800369:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80036d:	48 c1 e8 10          	shr    rax,0x10
  800371:	48 89 c2             	mov    rdx,rax
  800374:	48 8b 0d 45 c5 00 00 	mov    rcx,QWORD PTR [rip+0xc545]        # 80c8c0 <idt>
  80037b:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80037f:	48 c1 e0 04          	shl    rax,0x4
  800383:	48 01 c8             	add    rax,rcx
  800386:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
    idt[index].offset_high=(offset>>32)&0x0000ffff;
  80038a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80038e:	48 c1 e8 20          	shr    rax,0x20
  800392:	89 c1                	mov    ecx,eax
  800394:	48 8b 15 25 c5 00 00 	mov    rdx,QWORD PTR [rip+0xc525]        # 80c8c0 <idt>
  80039b:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80039f:	48 c1 e0 04          	shl    rax,0x4
  8003a3:	48 01 c2             	add    rdx,rax
  8003a6:	0f b7 c1             	movzx  eax,cx
  8003a9:	89 42 08             	mov    DWORD PTR [rdx+0x8],eax
    idt[index].attr=attr|1;//1是ist索引
  8003ac:	48 8b 15 0d c5 00 00 	mov    rdx,QWORD PTR [rip+0xc50d]        # 80c8c0 <idt>
  8003b3:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003b7:	48 c1 e0 04          	shl    rax,0x4
  8003bb:	48 01 d0             	add    rax,rdx
  8003be:	0f b7 55 ec          	movzx  edx,WORD PTR [rbp-0x14]
  8003c2:	83 ca 01             	or     edx,0x1
  8003c5:	66 89 50 04          	mov    WORD PTR [rax+0x4],dx
    idt[index].selector=selector;
  8003c9:	48 8b 15 f0 c4 00 00 	mov    rdx,QWORD PTR [rip+0xc4f0]        # 80c8c0 <idt>
  8003d0:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003d4:	48 c1 e0 04          	shl    rax,0x4
  8003d8:	48 01 c2             	add    rdx,rax
  8003db:	0f b7 45 f8          	movzx  eax,WORD PTR [rbp-0x8]
  8003df:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    idt[index].rsvd=0;
  8003e3:	48 8b 15 d6 c4 00 00 	mov    rdx,QWORD PTR [rip+0xc4d6]        # 80c8c0 <idt>
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
  80040d:	e8 8c 5b 00 00       	call   805f9e <eoi>
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
  800427:	e8 72 5b 00 00       	call   805f9e <eoi>
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
  800441:	e8 58 5b 00 00       	call   805f9e <eoi>
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
  80045b:	e8 3e 5b 00 00       	call   805f9e <eoi>
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
  800475:	e8 24 5b 00 00       	call   805f9e <eoi>
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
  80048f:	e8 0a 5b 00 00       	call   805f9e <eoi>
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
  8004a8:	e8 f1 5a 00 00       	call   805f9e <eoi>
    report_back_trace_of_err();
  8004ad:	b8 00 00 00 00       	mov    eax,0x0
  8004b2:	e8 12 5b 00 00       	call   805fc9 <report_back_trace_of_err>
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
  8004cd:	e8 cc 5a 00 00       	call   805f9e <eoi>
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
  8004e7:	e8 b2 5a 00 00       	call   805f9e <eoi>
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
  800500:	e8 99 5a 00 00       	call   805f9e <eoi>
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
  800519:	e8 80 5a 00 00       	call   805f9e <eoi>
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
  800533:	e8 66 5a 00 00       	call   805f9e <eoi>
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
  80054d:	e8 4c 5a 00 00       	call   805f9e <eoi>
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
  800571:	e8 28 5a 00 00       	call   805f9e <eoi>
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
  80058e:	e8 0b 5a 00 00       	call   805f9e <eoi>
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
  8005d1:	48 05 00 41 81 00    	add    rax,0x814100
  8005d7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8005da:	3e ff e0             	notrack jmp rax
    {
        case 0:return reg_device(a);
  8005dd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8005e0:	48 98                	cdqe   
  8005e2:	48 89 c7             	mov    rdi,rax
  8005e5:	e8 d7 23 00 00       	call   8029c1 <reg_device>
  8005ea:	e9 33 02 00 00       	jmp    800822 <syscall+0x288>
        case 1:return dispose_device(a);
  8005ef:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8005f2:	89 c7                	mov    edi,eax
  8005f4:	e8 27 2e 00 00       	call   803420 <dispose_device>
  8005f9:	e9 24 02 00 00       	jmp    800822 <syscall+0x288>
        case 2:return reg_driver(a);
  8005fe:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800601:	48 98                	cdqe   
  800603:	48 89 c7             	mov    rdi,rax
  800606:	e8 9e 26 00 00       	call   802ca9 <reg_driver>
  80060b:	e9 12 02 00 00       	jmp    800822 <syscall+0x288>
        case 3:return dispose_driver(a);
  800610:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800613:	48 98                	cdqe   
  800615:	48 89 c7             	mov    rdi,rax
  800618:	e8 a1 2e 00 00       	call   8034be <dispose_driver>
  80061d:	e9 00 02 00 00       	jmp    800822 <syscall+0x288>
        case 4:return call_drv_func(a,b,c);
  800622:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800625:	48 98                	cdqe   
  800627:	48 89 c2             	mov    rdx,rax
  80062a:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  80062d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800630:	89 ce                	mov    esi,ecx
  800632:	89 c7                	mov    edi,eax
  800634:	e8 90 2b 00 00       	call   8031c9 <call_drv_func>
  800639:	e9 e4 01 00 00       	jmp    800822 <syscall+0x288>
        case 5:return req_page_at(a,b);
  80063e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800641:	48 98                	cdqe   
  800643:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  800646:	89 d6                	mov    esi,edx
  800648:	48 89 c7             	mov    rdi,rax
  80064b:	e8 6b 12 00 00       	call   8018bb <req_page_at>
  800650:	e9 cd 01 00 00       	jmp    800822 <syscall+0x288>
        case 6:return free_page(a);
  800655:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800658:	48 98                	cdqe   
  80065a:	48 89 c7             	mov    rdi,rax
  80065d:	e8 25 10 00 00       	call   801687 <free_page>
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
  800682:	e8 9a 40 00 00       	call   804721 <reg_proc>
  800687:	e9 96 01 00 00       	jmp    800822 <syscall+0x288>
        case 8:del_proc(a);
  80068c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80068f:	89 c7                	mov    edi,eax
  800691:	e8 7d 3e 00 00       	call   804513 <del_proc>
        case 10:chk_vm(a,b);
  800696:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  800699:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80069c:	89 d6                	mov    esi,edx
  80069e:	89 c7                	mov    edi,eax
  8006a0:	e8 ef 12 00 00       	call   801994 <chk_vm>
        case 11:return sys_open(a,b);
  8006a5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006a8:	48 98                	cdqe   
  8006aa:	48 89 c2             	mov    rdx,rax
  8006ad:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8006b0:	89 c6                	mov    esi,eax
  8006b2:	48 89 d7             	mov    rdi,rdx
  8006b5:	e8 42 72 00 00       	call   8078fc <sys_open>
  8006ba:	e9 63 01 00 00       	jmp    800822 <syscall+0x288>
        case 12:return sys_close(a);
  8006bf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006c2:	89 c7                	mov    edi,eax
  8006c4:	e8 71 76 00 00       	call   807d3a <sys_close>
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
  8006e4:	e8 09 77 00 00       	call   807df2 <sys_read>
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
  800704:	e8 99 77 00 00       	call   807ea2 <sys_write>
  800709:	e9 14 01 00 00       	jmp    800822 <syscall+0x288>
        case 15:return sys_lseek(a,b,c);
  80070e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  800711:	48 63 c8             	movsxd rcx,eax
  800714:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  800717:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80071a:	48 89 ce             	mov    rsi,rcx
  80071d:	89 c7                	mov    edi,eax
  80071f:	e8 2e 78 00 00       	call   807f52 <sys_lseek>
  800724:	e9 f9 00 00 00       	jmp    800822 <syscall+0x288>
        case 16:return sys_tell(a);
  800729:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80072c:	89 c7                	mov    edi,eax
  80072e:	e8 45 16 00 00       	call   801d78 <sys_tell>
  800733:	e9 ea 00 00 00       	jmp    800822 <syscall+0x288>
        case 17:return reg_vol(a,b,c);
  800738:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  80073b:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  80073e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800741:	89 ce                	mov    esi,ecx
  800743:	89 c7                	mov    edi,eax
  800745:	b8 00 00 00 00       	mov    eax,0x0
  80074a:	e8 1e 15 00 00       	call   801c6d <reg_vol>
  80074f:	e9 ce 00 00 00       	jmp    800822 <syscall+0x288>
        case 18:return free_vol(a);
  800754:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800757:	89 c7                	mov    edi,eax
  800759:	b8 00 00 00 00       	mov    eax,0x0
  80075e:	e8 ee 14 00 00       	call   801c51 <free_vol>
  800763:	e9 ba 00 00 00       	jmp    800822 <syscall+0x288>
        case 19:return execute(a, NULL);
  800768:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80076b:	48 98                	cdqe   
  80076d:	be 00 00 00 00       	mov    esi,0x0
  800772:	48 89 c7             	mov    rdi,rax
  800775:	e8 da 5a 00 00       	call   806254 <execute>
  80077a:	e9 a3 00 00 00       	jmp    800822 <syscall+0x288>
        case SYSCALL_EXIT:return sys_exit(a);
  80077f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800782:	89 c7                	mov    edi,eax
  800784:	e8 70 3f 00 00       	call   8046f9 <sys_exit>
  800789:	e9 94 00 00 00       	jmp    800822 <syscall+0x288>
        case SYSCALL_CALL:return exec_call(a);
  80078e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800791:	48 98                	cdqe   
  800793:	48 89 c7             	mov    rdi,rax
  800796:	e8 b0 5c 00 00       	call   80644b <exec_call>
  80079b:	e9 82 00 00 00       	jmp    800822 <syscall+0x288>
        case SYSCALL_MKFIFO:return sys_mkfifo(a);
  8007a0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007a3:	89 c7                	mov    edi,eax
  8007a5:	e8 48 13 00 00       	call   801af2 <sys_mkfifo>
  8007aa:	eb 76                	jmp    800822 <syscall+0x288>
        case SYSCALL_MALLOC:return sys_malloc(a);
  8007ac:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007af:	89 c7                	mov    edi,eax
  8007b1:	e8 33 41 00 00       	call   8048e9 <sys_malloc>
  8007b6:	eb 6a                	jmp    800822 <syscall+0x288>
        case SYSCALL_FREE:return sys_free(a);
  8007b8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007bb:	89 c7                	mov    edi,eax
  8007bd:	e8 b5 42 00 00       	call   804a77 <sys_free>
  8007c2:	eb 5e                	jmp    800822 <syscall+0x288>
        case SYSCALL_KB_READC:return sys_analyse_key();
  8007c4:	b8 00 00 00 00       	mov    eax,0x0
  8007c9:	e8 54 7d 00 00       	call   808522 <sys_analyse_key>
  8007ce:	0f be c0             	movsx  eax,al
  8007d1:	eb 4f                	jmp    800822 <syscall+0x288>
        case SYSCALL_FIND_DEV:return sys_find_dev(a);
  8007d3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007d6:	48 98                	cdqe   
  8007d8:	48 89 c7             	mov    rdi,rax
  8007db:	e8 19 26 00 00       	call   802df9 <sys_find_dev>
  8007e0:	eb 40                	jmp    800822 <syscall+0x288>
        case SYSCALL_FORK:return sys_fork();
  8007e2:	e8 9d 45 00 00       	call   804d84 <sys_fork>
  8007e7:	eb 39                	jmp    800822 <syscall+0x288>
        case SYSCALL_EXECVE:return sys_execve(a,b);
  8007e9:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8007ec:	48 98                	cdqe   
  8007ee:	48 89 c2             	mov    rdx,rax
  8007f1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007f4:	48 98                	cdqe   
  8007f6:	48 89 d6             	mov    rsi,rdx
  8007f9:	48 89 c7             	mov    rdi,rax
  8007fc:	e8 55 5b 00 00       	call   806356 <sys_execve>
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
  80081b:	e8 6b 26 00 00       	call   802e8b <sys_operate_dev>
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
  8008a7:	48 8b 04 c5 70 44 81 	mov    rax,QWORD PTR [rax*8+0x814470]
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
  8008bb:	e8 9a 08 00 00       	call   80115a <set_high_mem_base>
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
  8008f1:	e8 7b 08 00 00       	call   801171 <set_mem_area>
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
  80094b:	e8 9b 65 00 00       	call   806eeb <set_framebuffer>
  800950:	48 83 c4 30          	add    rsp,0x30

            init_framebuffer();
  800954:	b8 00 00 00 00       	mov    eax,0x0
  800959:	e8 ea 63 00 00       	call   806d48 <init_framebuffer>
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
  800b22:	e8 ee 62 00 00       	call   806e15 <init_font>
    //初始化区域
    //fill_rect(0,0,100,100,255);
    print("gamessis os loaded.\nkernel:>");
  800b27:	bf 28 44 81 00       	mov    edi,0x814428
  800b2c:	e8 7d 67 00 00       	call   8072ae <print>
    init_int();
  800b31:	b8 00 00 00 00       	mov    eax,0x0
  800b36:	e8 c5 f4 ff ff       	call   800000 <init_int>
    print("int loaded.\n");
  800b3b:	bf 45 44 81 00       	mov    edi,0x814445
  800b40:	e8 69 67 00 00       	call   8072ae <print>
//    set_tss(0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000);
    init_memory();
  800b45:	b8 00 00 00 00       	mov    eax,0x0
  800b4a:	e8 f1 08 00 00       	call   801440 <init_memory>
    init_com(PORT_COM1);
  800b4f:	bf f8 03 00 00       	mov    edi,0x3f8
  800b54:	e8 e6 b1 00 00       	call   80bd3f <init_com>
    comprintf("\rgamessis os loaded.\r\n");
  800b59:	bf 52 44 81 00       	mov    edi,0x814452
  800b5e:	b8 00 00 00 00       	mov    eax,0x0
  800b63:	e8 1a b3 00 00       	call   80be82 <comprintf>
	init_paging();
  800b68:	b8 00 00 00 00       	mov    eax,0x0
  800b6d:	e8 dd 05 00 00       	call   80114f <init_paging>
 	init_gdt();
  800b72:	b8 00 00 00 00       	mov    eax,0x0
  800b77:	e8 71 54 00 00       	call   805fed <init_gdt>
    init_proc();
  800b7c:	b8 00 00 00 00       	mov    eax,0x0
  800b81:	e8 0c 2d 00 00       	call   803892 <init_proc>
    sti();
  800b86:	fb                   	sti    
    DISK1_FAT32_FS_init();
  800b87:	b8 00 00 00 00       	mov    eax,0x0
  800b8c:	e8 29 ac 00 00       	call   80b7ba <DISK1_FAT32_FS_init>
    init_devman();
  800b91:	b8 00 00 00 00       	mov    eax,0x0
  800b96:	e8 62 19 00 00       	call   8024fd <init_devman>
    //自带驱动
    //init_tty();
    init_kb();
  800b9b:	b8 00 00 00 00       	mov    eax,0x0
  800ba0:	e8 49 78 00 00       	call   8083ee <init_kb>
//    init_disk();


    manage_proc_lock=0;
  800ba5:	c7 05 19 bd 00 00 00 	mov    DWORD PTR [rip+0xbd19],0x0        # 80c8c8 <manage_proc_lock>
  800bac:	00 00 00 
//    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
//    mount_fs("fat16",p->par,vmalloc());

    while (1)
    {
        char c= sys_analyse_key();
  800baf:	b8 00 00 00 00       	mov    eax,0x0
  800bb4:	e8 69 79 00 00       	call   808522 <sys_analyse_key>
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
  800d20:	e8 89 65 00 00       	call   8072ae <print>
    *(video + (xpos + ypos * COLUMNS) * 2 + 1) = ATTRIBUTE;
 
    xpos++;
    if (xpos >= COLUMNS)
        goto newline;
}
  800d25:	c9                   	leave  
  800d26:	c3                   	ret    

0000000000800d27 <printf>:
 
/* 格式化字符串并在屏幕上输出，就像 libc 函数 printf 一样。 */
void printf (const char *format,...)
{
  800d27:	f3 0f 1e fa          	endbr64 
  800d2b:	55                   	push   rbp
  800d2c:	48 89 e5             	mov    rbp,rsp
  800d2f:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  800d36:	48 89 bd 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rdi
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
    if(strlen(format)>=1024)
  800d84:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  800d8b:	48 89 c7             	mov    rdi,rax
  800d8e:	e8 7f b4 00 00       	call   80c212 <strlen>
  800d93:	3d ff 03 00 00       	cmp    eax,0x3ff
  800d98:	0f 8f 97 00 00 00    	jg     800e35 <printf+0x10e>
        return;//一次性输出不了太长
    char* tmp=(char*)vmalloc();
  800d9e:	b8 00 00 00 00       	mov    eax,0x0
  800da3:	e8 55 04 00 00       	call   8011fd <vmalloc>
  800da8:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    va_list vargs;
    va_start(vargs,format);
  800daf:	c7 85 30 ff ff ff 08 	mov    DWORD PTR [rbp-0xd0],0x8
  800db6:	00 00 00 
  800db9:	c7 85 34 ff ff ff 30 	mov    DWORD PTR [rbp-0xcc],0x30
  800dc0:	00 00 00 
  800dc3:	48 8d 45 10          	lea    rax,[rbp+0x10]
  800dc7:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
  800dce:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  800dd5:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    sprintf(tmp,format,vargs);
  800ddc:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  800de3:	48 8b 8d 28 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xd8]
  800dea:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800df1:	48 89 ce             	mov    rsi,rcx
  800df4:	48 89 c7             	mov    rdi,rax
  800df7:	b8 00 00 00 00       	mov    eax,0x0
  800dfc:	e8 3f b4 00 00       	call   80c240 <sprintf>
    va_end(vargs);
    print(tmp);
  800e01:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e08:	48 89 c7             	mov    rdi,rax
  800e0b:	e8 9e 64 00 00       	call   8072ae <print>
    comprintf(tmp);
  800e10:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e17:	48 89 c7             	mov    rdi,rax
  800e1a:	b8 00 00 00 00       	mov    eax,0x0
  800e1f:	e8 5e b0 00 00       	call   80be82 <comprintf>
    vmfree(tmp);
  800e24:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e2b:	48 89 c7             	mov    rdi,rax
  800e2e:	e8 59 04 00 00       	call   80128c <vmfree>
  800e33:	eb 01                	jmp    800e36 <printf+0x10f>
        return;//一次性输出不了太长
  800e35:	90                   	nop
//                putchar (*((int *) arg++));
//                break;
//            }
//        }
//    }
}
  800e36:	c9                   	leave  
  800e37:	c3                   	ret    

0000000000800e38 <mmap>:
//以kb为单位
int high_mem_base=1024;
int mmap_t_i=0;

stat_t mmap(addr_t pa,addr_t la,u32 attr)
{
  800e38:	f3 0f 1e fa          	endbr64 
  800e3c:	55                   	push   rbp
  800e3d:	48 89 e5             	mov    rbp,rsp
  800e40:	48 83 ec 40          	sub    rsp,0x40
  800e44:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  800e48:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  800e4c:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    page_item *pdptp= (page_item *) (pml4[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
  800e4f:	48 8b 15 8a ba 00 00 	mov    rdx,QWORD PTR [rip+0xba8a]        # 80c8e0 <pml4>
  800e56:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800e5a:	48 c1 e8 27          	shr    rax,0x27
  800e5e:	48 c1 e0 03          	shl    rax,0x3
  800e62:	48 01 d0             	add    rax,rdx
  800e65:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800e68:	b0 00                	mov    al,0x0
  800e6a:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
  800e6e:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  800e75:	00 00 00 
  800e78:	48 23 45 d0          	and    rax,QWORD PTR [rbp-0x30]
  800e7c:	48 c1 e8 1e          	shr    rax,0x1e
  800e80:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
  800e83:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800e86:	48 98                	cdqe   
  800e88:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800e8f:	00 
  800e90:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800e94:	48 01 d0             	add    rax,rdx
  800e97:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800e9a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
  800e9e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800ea2:	83 e0 01             	and    eax,0x1
  800ea5:	48 85 c0             	test   rax,rax
  800ea8:	75 45                	jne    800eef <mmap+0xb7>
    {
        pdp=(page_item*)vmalloc();
  800eaa:	b8 00 00 00 00       	mov    eax,0x0
  800eaf:	e8 49 03 00 00       	call   8011fd <vmalloc>
  800eb4:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        memset(pdp,0,4096);
  800eb8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800ebc:	ba 00 10 00 00       	mov    edx,0x1000
  800ec1:	be 00 00 00 00       	mov    esi,0x0
  800ec6:	48 89 c7             	mov    rdi,rax
  800ec9:	e8 d6 b0 00 00       	call   80bfa4 <memset>
        pdptp[pdpti]=(addr_t)pdp|attr;
  800ece:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800ed1:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  800ed5:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800ed8:	48 98                	cdqe   
  800eda:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800ee1:	00 
  800ee2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800ee6:	48 01 f0             	add    rax,rsi
  800ee9:	48 09 ca             	or     rdx,rcx
  800eec:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pdp=(page_item*)((addr_t)pdp&~0xff);
  800eef:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800ef3:	b0 00                	mov    al,0x0
  800ef5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
  800ef9:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800efd:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800f02:	48 c1 e8 15          	shr    rax,0x15
  800f06:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800f0d:	00 
  800f0e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f12:	48 01 d0             	add    rax,rdx
  800f15:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f18:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!((unsigned long long)pt & PAGE_PRESENT))
  800f1c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800f20:	83 e0 01             	and    eax,0x1
  800f23:	48 85 c0             	test   rax,rax
  800f26:	75 4d                	jne    800f75 <mmap+0x13d>
    {
        pt=(page_item*)vmalloc();
  800f28:	b8 00 00 00 00       	mov    eax,0x0
  800f2d:	e8 cb 02 00 00       	call   8011fd <vmalloc>
  800f32:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        memset(pt,0,4096);
  800f36:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800f3a:	ba 00 10 00 00       	mov    edx,0x1000
  800f3f:	be 00 00 00 00       	mov    esi,0x0
  800f44:	48 89 c7             	mov    rdi,rax
  800f47:	e8 58 b0 00 00       	call   80bfa4 <memset>
        pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
  800f4c:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800f4f:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800f53:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800f57:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800f5c:	48 c1 e8 15          	shr    rax,0x15
  800f60:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800f67:	00 
  800f68:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f6c:	48 01 f0             	add    rax,rsi
  800f6f:	48 09 ca             	or     rdx,rcx
  800f72:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pt=(page_item*)((addr_t)pt & ~0xff);
  800f75:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800f79:	b0 00                	mov    al,0x0
  800f7b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
  800f7f:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  800f82:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  800f86:	81 e2 ff ff 1f 00    	and    edx,0x1fffff
  800f8c:	48 c1 ea 0c          	shr    rdx,0xc
  800f90:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
  800f97:	00 
  800f98:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800f9c:	48 01 ca             	add    rdx,rcx
  800f9f:	48 0b 45 d8          	or     rax,QWORD PTR [rbp-0x28]
  800fa3:	48 89 02             	mov    QWORD PTR [rdx],rax
    return NORMAL;
  800fa6:	b8 00 00 00 00       	mov    eax,0x0
}
  800fab:	c9                   	leave  
  800fac:	c3                   	ret    

0000000000800fad <smmap>:

stat_t smmap(addr_t pa,addr_t la,u32 attr,page_item* pml4p)
{
  800fad:	f3 0f 1e fa          	endbr64 
  800fb1:	55                   	push   rbp
  800fb2:	48 89 e5             	mov    rbp,rsp
  800fb5:	48 83 ec 40          	sub    rsp,0x40
  800fb9:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  800fbd:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  800fc1:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
  800fc4:	48 89 4d c0          	mov    QWORD PTR [rbp-0x40],rcx
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    page_item *pdptp= (page_item *) (pml4p[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
  800fc8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800fcc:	48 c1 e8 27          	shr    rax,0x27
  800fd0:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800fd7:	00 
  800fd8:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  800fdc:	48 01 d0             	add    rax,rdx
  800fdf:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800fe2:	b0 00                	mov    al,0x0
  800fe4:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
  800fe8:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  800fef:	00 00 00 
  800ff2:	48 23 45 d0          	and    rax,QWORD PTR [rbp-0x30]
  800ff6:	48 c1 e8 1e          	shr    rax,0x1e
  800ffa:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
  800ffd:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801000:	48 98                	cdqe   
  801002:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  801009:	00 
  80100a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80100e:	48 01 d0             	add    rax,rdx
  801011:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801014:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
  801018:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80101c:	83 e0 01             	and    eax,0x1
  80101f:	48 85 c0             	test   rax,rax
  801022:	75 45                	jne    801069 <smmap+0xbc>
    {
        pdp=(page_item*)vmalloc();
  801024:	b8 00 00 00 00       	mov    eax,0x0
  801029:	e8 cf 01 00 00       	call   8011fd <vmalloc>
  80102e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        memset(pdp,0,4096);
  801032:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801036:	ba 00 10 00 00       	mov    edx,0x1000
  80103b:	be 00 00 00 00       	mov    esi,0x0
  801040:	48 89 c7             	mov    rdi,rax
  801043:	e8 5c af 00 00       	call   80bfa4 <memset>
        pdptp[pdpti]=(addr_t)pdp|attr;
  801048:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  80104b:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80104f:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801052:	48 98                	cdqe   
  801054:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  80105b:	00 
  80105c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801060:	48 01 f0             	add    rax,rsi
  801063:	48 09 ca             	or     rdx,rcx
  801066:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pdp=(page_item*)((addr_t)pdp&~0xff);
  801069:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80106d:	b0 00                	mov    al,0x0
  80106f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
  801073:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  801077:	25 ff ff ff 3f       	and    eax,0x3fffffff
  80107c:	48 c1 e8 15          	shr    rax,0x15
  801080:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  801087:	00 
  801088:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80108c:	48 01 d0             	add    rax,rdx
  80108f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801092:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!((unsigned long long)pt & PAGE_PRESENT))
  801096:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80109a:	83 e0 01             	and    eax,0x1
  80109d:	48 85 c0             	test   rax,rax
  8010a0:	75 4d                	jne    8010ef <smmap+0x142>
    {
        pt=(page_item*)vmalloc();
  8010a2:	b8 00 00 00 00       	mov    eax,0x0
  8010a7:	e8 51 01 00 00       	call   8011fd <vmalloc>
  8010ac:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        memset(pt,0,4096);
  8010b0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8010b4:	ba 00 10 00 00       	mov    edx,0x1000
  8010b9:	be 00 00 00 00       	mov    esi,0x0
  8010be:	48 89 c7             	mov    rdi,rax
  8010c1:	e8 de ae 00 00       	call   80bfa4 <memset>
        pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
  8010c6:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  8010c9:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  8010cd:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8010d1:	25 ff ff ff 3f       	and    eax,0x3fffffff
  8010d6:	48 c1 e8 15          	shr    rax,0x15
  8010da:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  8010e1:	00 
  8010e2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8010e6:	48 01 f0             	add    rax,rsi
  8010e9:	48 09 ca             	or     rdx,rcx
  8010ec:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pt=(page_item*)((addr_t)pt & ~0xff);
  8010ef:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8010f3:	b0 00                	mov    al,0x0
  8010f5:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
  8010f9:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8010fc:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  801100:	81 e2 ff ff 1f 00    	and    edx,0x1fffff
  801106:	48 c1 ea 0c          	shr    rdx,0xc
  80110a:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
  801111:	00 
  801112:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  801116:	48 01 ca             	add    rdx,rcx
  801119:	48 0b 45 d8          	or     rax,QWORD PTR [rbp-0x28]
  80111d:	48 89 02             	mov    QWORD PTR [rdx],rax
    return NORMAL;
  801120:	b8 00 00 00 00       	mov    eax,0x0
}
  801125:	c9                   	leave  
  801126:	c3                   	ret    

0000000000801127 <mdemap>:

stat_t mdemap(addr_t la)
{
  801127:	f3 0f 1e fa          	endbr64 
  80112b:	55                   	push   rbp
  80112c:	48 89 e5             	mov    rbp,rsp
  80112f:	48 83 ec 10          	sub    rsp,0x10
  801133:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return mmap(0l,la,0);
  801137:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80113b:	ba 00 00 00 00       	mov    edx,0x0
  801140:	48 89 c6             	mov    rsi,rax
  801143:	bf 00 00 00 00       	mov    edi,0x0
  801148:	e8 eb fc ff ff       	call   800e38 <mmap>
}
  80114d:	c9                   	leave  
  80114e:	c3                   	ret    

000000000080114f <init_paging>:
int init_paging()
{
  80114f:	f3 0f 1e fa          	endbr64 
  801153:	55                   	push   rbp
  801154:	48 89 e5             	mov    rbp,rsp
    //设置第一项pdpte，也就是内核空间
//    set_1gb_pdpt(pdpt,0,PAGE_RWX);//设置PDPT0x40000000ul
//    set_page_item(pdpt+1,PD_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);

    #endif
}
  801157:	90                   	nop
  801158:	5d                   	pop    rbp
  801159:	c3                   	ret    

000000000080115a <set_high_mem_base>:
void set_high_mem_base(int base)
{
  80115a:	f3 0f 1e fa          	endbr64 
  80115e:	55                   	push   rbp
  80115f:	48 89 e5             	mov    rbp,rsp
  801162:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    high_mem_base=base;
  801165:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801168:	89 05 8a b7 00 00    	mov    DWORD PTR [rip+0xb78a],eax        # 80c8f8 <high_mem_base>
}
  80116e:	90                   	nop
  80116f:	5d                   	pop    rbp
  801170:	c3                   	ret    

0000000000801171 <set_mem_area>:
void set_mem_area(unsigned long base, unsigned long len, unsigned long type)
{
  801171:	f3 0f 1e fa          	endbr64 
  801175:	55                   	push   rbp
  801176:	48 89 e5             	mov    rbp,rsp
  801179:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80117d:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  801181:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
    mmap_struct[mmap_t_i].base=base;
  801185:	8b 05 95 f0 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff095]        # 400220 <mmap_t_i>
  80118b:	48 63 d0             	movsxd rdx,eax
  80118e:	48 89 d0             	mov    rax,rdx
  801191:	48 01 c0             	add    rax,rax
  801194:	48 01 d0             	add    rax,rdx
  801197:	48 c1 e0 03          	shl    rax,0x3
  80119b:	48 8d 90 40 00 40 00 	lea    rdx,[rax+0x400040]
  8011a2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8011a6:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i].len=len;
  8011a9:	8b 05 71 f0 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff071]        # 400220 <mmap_t_i>
  8011af:	48 63 d0             	movsxd rdx,eax
  8011b2:	48 89 d0             	mov    rax,rdx
  8011b5:	48 01 c0             	add    rax,rax
  8011b8:	48 01 d0             	add    rax,rdx
  8011bb:	48 c1 e0 03          	shl    rax,0x3
  8011bf:	48 8d 90 48 00 40 00 	lea    rdx,[rax+0x400048]
  8011c6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8011ca:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i++].type=type;
  8011cd:	8b 05 4d f0 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff04d]        # 400220 <mmap_t_i>
  8011d3:	8d 50 01             	lea    edx,[rax+0x1]
  8011d6:	89 15 44 f0 bf ff    	mov    DWORD PTR [rip+0xffffffffffbff044],edx        # 400220 <mmap_t_i>
  8011dc:	48 63 d0             	movsxd rdx,eax
  8011df:	48 89 d0             	mov    rax,rdx
  8011e2:	48 01 c0             	add    rax,rax
  8011e5:	48 01 d0             	add    rax,rdx
  8011e8:	48 c1 e0 03          	shl    rax,0x3
  8011ec:	48 8d 90 50 00 40 00 	lea    rdx,[rax+0x400050]
  8011f3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8011f7:	48 89 02             	mov    QWORD PTR [rdx],rax
}
  8011fa:	90                   	nop
  8011fb:	5d                   	pop    rbp
  8011fc:	c3                   	ret    

00000000008011fd <vmalloc>:
addr_t vmalloc()
{
  8011fd:	f3 0f 1e fa          	endbr64 
  801201:	55                   	push   rbp
  801202:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<VMALLOC_PGN/32;i++)
  801205:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80120c:	eb 76                	jmp    801284 <vmalloc+0x87>
    {
        for(int j=0;j<32;j++)
  80120e:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801215:	eb 63                	jmp    80127a <vmalloc+0x7d>
        {
            if(!(vmalloc_map[i]&(1<<j)))
  801217:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80121a:	48 98                	cdqe   
  80121c:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  801223:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801226:	be 01 00 00 00       	mov    esi,0x1
  80122b:	89 c1                	mov    ecx,eax
  80122d:	d3 e6                	shl    esi,cl
  80122f:	89 f0                	mov    eax,esi
  801231:	21 d0                	and    eax,edx
  801233:	85 c0                	test   eax,eax
  801235:	75 3f                	jne    801276 <vmalloc+0x79>
            {
                vmalloc_map[i]|=(1<<j);
  801237:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80123a:	48 98                	cdqe   
  80123c:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  801243:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801246:	be 01 00 00 00       	mov    esi,0x1
  80124b:	89 c1                	mov    ecx,eax
  80124d:	d3 e6                	shl    esi,cl
  80124f:	89 f0                	mov    eax,esi
  801251:	09 c2                	or     edx,eax
  801253:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801256:	48 98                	cdqe   
  801258:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
                return VMALLOC_BASE+(i*32+j)*0x1000;
  80125f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801262:	c1 e0 05             	shl    eax,0x5
  801265:	89 c2                	mov    edx,eax
  801267:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80126a:	01 d0                	add    eax,edx
  80126c:	83 c0 20             	add    eax,0x20
  80126f:	c1 e0 0c             	shl    eax,0xc
  801272:	48 98                	cdqe   
  801274:	eb 14                	jmp    80128a <vmalloc+0x8d>
        for(int j=0;j<32;j++)
  801276:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80127a:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  80127e:	7e 97                	jle    801217 <vmalloc+0x1a>
    for(int i=0;i<VMALLOC_PGN/32;i++)
  801280:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801284:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  801288:	7e 84                	jle    80120e <vmalloc+0x11>
            }
        }
    }
}
  80128a:	5d                   	pop    rbp
  80128b:	c3                   	ret    

000000000080128c <vmfree>:

int vmfree(addr_t ptr)
{
  80128c:	f3 0f 1e fa          	endbr64 
  801290:	55                   	push   rbp
  801291:	48 89 e5             	mov    rbp,rsp
  801294:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=ptr/PAGE_SIZE;
  801298:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80129c:	48 c1 e8 0c          	shr    rax,0xc
  8012a0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  8012a3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8012a6:	8d 50 1f             	lea    edx,[rax+0x1f]
  8012a9:	85 c0                	test   eax,eax
  8012ab:	0f 48 c2             	cmovs  eax,edx
  8012ae:	c1 f8 05             	sar    eax,0x5
  8012b1:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  8012b4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8012b7:	99                   	cdq    
  8012b8:	c1 ea 1b             	shr    edx,0x1b
  8012bb:	01 d0                	add    eax,edx
  8012bd:	83 e0 1f             	and    eax,0x1f
  8012c0:	29 d0                	sub    eax,edx
  8012c2:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    vmalloc_map[n]=vmalloc_map[n]&~(unsigned int)(1<<r);
  8012c5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8012c8:	48 98                	cdqe   
  8012ca:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  8012d1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8012d4:	be 01 00 00 00       	mov    esi,0x1
  8012d9:	89 c1                	mov    ecx,eax
  8012db:	d3 e6                	shl    esi,cl
  8012dd:	89 f0                	mov    eax,esi
  8012df:	f7 d0                	not    eax
  8012e1:	21 c2                	and    edx,eax
  8012e3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8012e6:	48 98                	cdqe   
  8012e8:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
}
  8012ef:	90                   	nop
  8012f0:	5d                   	pop    rbp
  8012f1:	c3                   	ret    

00000000008012f2 <page_err>:
void page_err(){
  8012f2:	f3 0f 1e fa          	endbr64 
  8012f6:	55                   	push   rbp
  8012f7:	48 89 e5             	mov    rbp,rsp
  8012fa:	41 54                	push   r12
  8012fc:	53                   	push   rbx
  8012fd:	48 83 ec 20          	sub    rsp,0x20
    asm("cli");
  801301:	fa                   	cli    
    print("page err\n");
  801302:	bf b8 44 81 00       	mov    edi,0x8144b8
  801307:	e8 a2 5f 00 00       	call   8072ae <print>
    unsigned long err_code=0,l_addr=0;
  80130c:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  801313:	00 
  801314:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  80131b:	00 
    asm volatile("mov 0(%%rbp),%0":"=r"(err_code));
  80131c:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
  801320:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    asm volatile("mov %%cr2,%0":"=r"(l_addr));//试图访问的地址
  801324:	0f 20 d0             	mov    rax,cr2
  801327:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    int p=err_code&1;
  80132b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80132f:	83 e0 01             	and    eax,0x1
  801332:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

    if(!p)
  801335:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801339:	75 41                	jne    80137c <page_err+0x8a>
        //accessing non-existent page
        //检查地址合法性
        if(l_addr>=MEM_END)
            ;
        //在进程的页表中申请新页
        smmap(get_phyaddr(req_a_page()),l_addr&~0xfff,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,current->pml4);
  80133b:	48 8b 05 5e 42 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1425e]        # 4155a0 <current>
  801342:	48 8b 98 c0 00 00 00 	mov    rbx,QWORD PTR [rax+0xc0]
  801349:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80134d:	48 25 00 f0 ff ff    	and    rax,0xfffffffffffff000
  801353:	49 89 c4             	mov    r12,rax
  801356:	b8 00 00 00 00       	mov    eax,0x0
  80135b:	e8 57 02 00 00       	call   8015b7 <req_a_page>
  801360:	89 c7                	mov    edi,eax
  801362:	e8 3f 04 00 00       	call   8017a6 <get_phyaddr>
  801367:	48 98                	cdqe   
  801369:	48 89 d9             	mov    rcx,rbx
  80136c:	ba 07 00 00 00       	mov    edx,0x7
  801371:	4c 89 e6             	mov    rsi,r12
  801374:	48 89 c7             	mov    rdi,rax
  801377:	e8 31 fc ff ff       	call   800fad <smmap>
    }
    else
    {
        //page level protection
    }
    p=err_code&2;
  80137c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801380:	83 e0 02             	and    eax,0x2
  801383:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("when writing\n");else //puts("when reading");
  801386:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80138a:	74 0c                	je     801398 <page_err+0xa6>
  80138c:	bf c2 44 81 00       	mov    edi,0x8144c2
  801391:	e8 18 5f 00 00       	call   8072ae <print>
  801396:	eb 0a                	jmp    8013a2 <page_err+0xb0>
    p=err_code&4;
  801398:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80139c:	83 e0 04             	and    eax,0x4
  80139f:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(!p)print("supervisor mode\n");else //puts("user mode");
  8013a2:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8013a6:	75 0c                	jne    8013b4 <page_err+0xc2>
  8013a8:	bf d0 44 81 00       	mov    edi,0x8144d0
  8013ad:	e8 fc 5e 00 00       	call   8072ae <print>
  8013b2:	eb 0a                	jmp    8013be <page_err+0xcc>
    p=err_code&16;
  8013b4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8013b8:	83 e0 10             	and    eax,0x10
  8013bb:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("an instruction tries to fetch\n");
  8013be:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8013c2:	74 0a                	je     8013ce <page_err+0xdc>
  8013c4:	bf e8 44 81 00       	mov    edi,0x8144e8
  8013c9:	e8 e0 5e 00 00       	call   8072ae <print>
    unsigned int addr=0;
  8013ce:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
    asm volatile("mov 8(%%rbp),%0":"=r"(addr));
  8013d5:	8b 45 08             	mov    eax,DWORD PTR [rbp+0x8]
  8013d8:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    printf("occurred at %x(paddr), %x(laddr)\n",addr,l_addr);
  8013db:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8013df:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8013e2:	89 c6                	mov    esi,eax
  8013e4:	bf 08 45 81 00       	mov    edi,0x814508
  8013e9:	b8 00 00 00 00       	mov    eax,0x0
  8013ee:	e8 34 f9 ff ff       	call   800d27 <printf>
    extern int cur_proc;
    extern struct process *task;
    if(task[cur_proc].pid==1)//系统进程
  8013f3:	48 8b 15 a6 70 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc070a6]        # 4084a0 <task>
  8013fa:	8b 05 2c 42 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1422c]        # 41562c <cur_proc>
  801400:	48 98                	cdqe   
  801402:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  801409:	48 01 d0             	add    rax,rdx
  80140c:	8b 00                	mov    eax,DWORD PTR [rax]
  80140e:	83 f8 01             	cmp    eax,0x1
  801411:	75 11                	jne    801424 <page_err+0x132>
    {
        printf("sys died. please reboot.\n");
  801413:	bf 2a 45 81 00       	mov    edi,0x81452a
  801418:	b8 00 00 00 00       	mov    eax,0x0
  80141d:	e8 05 f9 ff ff       	call   800d27 <printf>
        asm volatile("jmp .");
  801422:	eb fe                	jmp    801422 <page_err+0x130>
    }
    //杀死问题进程
//    del_proc(cur_proc);
    // printf("killed the problem process.\n");
    // printf("shell:>");
    eoi();
  801424:	b8 00 00 00 00       	mov    eax,0x0
  801429:	e8 70 4b 00 00       	call   805f9e <eoi>
    //这里对esp的加法是必要的，因为page fault多push了一个错误码，但是iret识别不了
    __asm__ volatile ("sti \r\n  leave\n add $8,%rsp \n iretq");
  80142e:	fb                   	sti    
  80142f:	c9                   	leave  
  801430:	48 83 c4 08          	add    rsp,0x8
  801434:	48 cf                	iretq  
}
  801436:	90                   	nop
  801437:	48 83 c4 20          	add    rsp,0x20
  80143b:	5b                   	pop    rbx
  80143c:	41 5c                	pop    r12
  80143e:	5d                   	pop    rbp
  80143f:	c3                   	ret    

0000000000801440 <init_memory>:
void init_memory()
{
  801440:	f3 0f 1e fa          	endbr64 
  801444:	55                   	push   rbp
  801445:	48 89 e5             	mov    rbp,rsp
    extern addr_t _knl_end,_knl_start;//lds中声明的内核的结尾地址，放置位图
    //获取内存大小
    size_t mem_size=mmap_struct[mmap_t_i-1].base+mmap_struct[mmap_t_i-1].len;
  801448:	8b 05 d2 ed bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfedd2]        # 400220 <mmap_t_i>
  80144e:	83 e8 01             	sub    eax,0x1
  801451:	48 63 d0             	movsxd rdx,eax
  801454:	48 89 d0             	mov    rax,rdx
  801457:	48 01 c0             	add    rax,rax
  80145a:	48 01 d0             	add    rax,rdx
  80145d:	48 c1 e0 03          	shl    rax,0x3
  801461:	48 05 40 00 40 00    	add    rax,0x400040
  801467:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80146a:	8b 05 b0 ed bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfedb0]        # 400220 <mmap_t_i>
  801470:	83 e8 01             	sub    eax,0x1
  801473:	48 63 d0             	movsxd rdx,eax
  801476:	48 89 d0             	mov    rax,rdx
  801479:	48 01 c0             	add    rax,rax
  80147c:	48 01 d0             	add    rax,rdx
  80147f:	48 c1 e0 03          	shl    rax,0x3
  801483:	48 05 48 00 40 00    	add    rax,0x400048
  801489:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80148c:	48 01 c8             	add    rax,rcx
  80148f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    //计算出所需内存页数量
    int pgc=mem_size/PAGE_SIZE;
  801493:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801497:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  80149e:	48 85 c0             	test   rax,rax
  8014a1:	48 0f 48 c2          	cmovs  rax,rdx
  8014a5:	48 c1 f8 0c          	sar    rax,0xc
  8014a9:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    //计算出位图所需的字节数
    int pg_bytes=pgc/32;
  8014ac:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8014af:	8d 50 1f             	lea    edx,[rax+0x1f]
  8014b2:	85 c0                	test   eax,eax
  8014b4:	0f 48 c2             	cmovs  eax,edx
  8014b7:	c1 f8 05             	sar    eax,0x5
  8014ba:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    page_map=(unsigned int*)PAGE_4K_ALIGN(0xc00000);
  8014bd:	48 c7 05 58 eb bf ff 	mov    QWORD PTR [rip+0xffffffffffbfeb58],0xc00000        # 400020 <page_map>
  8014c4:	00 00 c0 00 
    int* p=page_map;
  8014c8:	48 8b 05 51 eb bf ff 	mov    rax,QWORD PTR [rip+0xffffffffffbfeb51]        # 400020 <page_map>
  8014cf:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    addr_t curp=0;
  8014d3:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  8014da:	00 
    for(int i=0;i<mmap_t_i;i++){
  8014db:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8014e2:	e9 91 00 00 00       	jmp    801578 <init_memory+0x138>
        int cont=0;
  8014e7:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
        if(mmap_struct[i].type!=MULTIBOOT_MEMORY_AVAILABLE)
  8014ee:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8014f1:	48 63 d0             	movsxd rdx,eax
  8014f4:	48 89 d0             	mov    rax,rdx
  8014f7:	48 01 c0             	add    rax,rax
  8014fa:	48 01 d0             	add    rax,rdx
  8014fd:	48 c1 e0 03          	shl    rax,0x3
  801501:	48 05 50 00 40 00    	add    rax,0x400050
  801507:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80150a:	48 83 f8 01          	cmp    rax,0x1
  80150e:	74 07                	je     801517 <init_memory+0xd7>
            cont=-1;
  801510:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [rbp-0x10],0xffffffff
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  801517:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80151e:	eb 15                	jmp    801535 <init_memory+0xf5>
            *(p++)=cont;
  801520:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801524:	48 8d 50 04          	lea    rdx,[rax+0x4]
  801528:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80152c:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80152f:	89 10                	mov    DWORD PTR [rax],edx
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  801531:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801535:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801538:	48 63 c8             	movsxd rcx,eax
  80153b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80153e:	48 63 d0             	movsxd rdx,eax
  801541:	48 89 d0             	mov    rax,rdx
  801544:	48 01 c0             	add    rax,rax
  801547:	48 01 d0             	add    rax,rdx
  80154a:	48 c1 e0 03          	shl    rax,0x3
  80154e:	48 05 48 00 40 00    	add    rax,0x400048
  801554:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801557:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  80155e:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  801565:	ff 00 00 
  801568:	48 21 d0             	and    rax,rdx
  80156b:	48 c1 e8 11          	shr    rax,0x11
  80156f:	48 39 c1             	cmp    rcx,rax
  801572:	72 ac                	jb     801520 <init_memory+0xe0>
    for(int i=0;i<mmap_t_i;i++){
  801574:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  801578:	8b 05 a2 ec bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfeca2]        # 400220 <mmap_t_i>
  80157e:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  801581:	0f 8c 60 ff ff ff    	jl     8014e7 <init_memory+0xa7>
        }
    }

    //低16M空间直接被内核占用
    for(int i=0;i<128;i++){
  801587:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  80158e:	eb 1d                	jmp    8015ad <init_memory+0x16d>
        page_map[i]=0xffffffff;
  801590:	48 8b 15 89 ea bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfea89]        # 400020 <page_map>
  801597:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80159a:	48 98                	cdqe   
  80159c:	48 c1 e0 02          	shl    rax,0x2
  8015a0:	48 01 d0             	add    rax,rdx
  8015a3:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<128;i++){
  8015a9:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  8015ad:	83 7d e8 7f          	cmp    DWORD PTR [rbp-0x18],0x7f
  8015b1:	7e dd                	jle    801590 <init_memory+0x150>
    }
}
  8015b3:	90                   	nop
  8015b4:	90                   	nop
  8015b5:	5d                   	pop    rbp
  8015b6:	c3                   	ret    

00000000008015b7 <req_a_page>:
/*
page_map存储方式:
0x00000000
little end
*/
addr_t req_a_page(){
  8015b7:	f3 0f 1e fa          	endbr64 
  8015bb:	55                   	push   rbp
  8015bc:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  8015bf:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8015c6:	e9 b0 00 00 00       	jmp    80167b <req_a_page+0xc4>
        for(int j=0;j<32;j++){
  8015cb:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8015d2:	e9 96 00 00 00       	jmp    80166d <req_a_page+0xb6>
            unsigned int bit=page_map[i]&(1<<j);
  8015d7:	48 8b 15 42 ea bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfea42]        # 400020 <page_map>
  8015de:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8015e1:	48 98                	cdqe   
  8015e3:	48 c1 e0 02          	shl    rax,0x2
  8015e7:	48 01 d0             	add    rax,rdx
  8015ea:	8b 10                	mov    edx,DWORD PTR [rax]
  8015ec:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8015ef:	be 01 00 00 00       	mov    esi,0x1
  8015f4:	89 c1                	mov    ecx,eax
  8015f6:	d3 e6                	shl    esi,cl
  8015f8:	89 f0                	mov    eax,esi
  8015fa:	21 d0                	and    eax,edx
  8015fc:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            if((i*32+j)*4096>=0x100000&&!bit)
  8015ff:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801602:	c1 e0 05             	shl    eax,0x5
  801605:	89 c2                	mov    edx,eax
  801607:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80160a:	01 d0                	add    eax,edx
  80160c:	c1 e0 0c             	shl    eax,0xc
  80160f:	3d ff ff 0f 00       	cmp    eax,0xfffff
  801614:	7e 53                	jle    801669 <req_a_page+0xb2>
  801616:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80161a:	75 4d                	jne    801669 <req_a_page+0xb2>
            {
                page_map[i]=page_map[i]|(1<<j);
  80161c:	48 8b 15 fd e9 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe9fd]        # 400020 <page_map>
  801623:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801626:	48 98                	cdqe   
  801628:	48 c1 e0 02          	shl    rax,0x2
  80162c:	48 01 d0             	add    rax,rdx
  80162f:	8b 10                	mov    edx,DWORD PTR [rax]
  801631:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801634:	be 01 00 00 00       	mov    esi,0x1
  801639:	89 c1                	mov    ecx,eax
  80163b:	d3 e6                	shl    esi,cl
  80163d:	89 f0                	mov    eax,esi
  80163f:	89 c6                	mov    esi,eax
  801641:	48 8b 0d d8 e9 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe9d8]        # 400020 <page_map>
  801648:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80164b:	48 98                	cdqe   
  80164d:	48 c1 e0 02          	shl    rax,0x2
  801651:	48 01 c8             	add    rax,rcx
  801654:	09 f2                	or     edx,esi
  801656:	89 10                	mov    DWORD PTR [rax],edx
                return i*32+j;//num of page
  801658:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80165b:	c1 e0 05             	shl    eax,0x5
  80165e:	89 c2                	mov    edx,eax
  801660:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801663:	01 d0                	add    eax,edx
  801665:	48 98                	cdqe   
  801667:	eb 1c                	jmp    801685 <req_a_page+0xce>
        for(int j=0;j<32;j++){
  801669:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80166d:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  801671:	0f 8e 60 ff ff ff    	jle    8015d7 <req_a_page+0x20>
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  801677:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80167b:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  80167f:	0f 8e 46 ff ff ff    	jle    8015cb <req_a_page+0x14>

            }
        }
    }
}
  801685:	5d                   	pop    rbp
  801686:	c3                   	ret    

0000000000801687 <free_page>:

int free_page(char *paddr){
  801687:	f3 0f 1e fa          	endbr64 
  80168b:	55                   	push   rbp
  80168c:	48 89 e5             	mov    rbp,rsp
  80168f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=(int)paddr/4096;
  801693:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801697:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80169d:	85 c0                	test   eax,eax
  80169f:	0f 48 c2             	cmovs  eax,edx
  8016a2:	c1 f8 0c             	sar    eax,0xc
  8016a5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  8016a8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8016ab:	8d 50 1f             	lea    edx,[rax+0x1f]
  8016ae:	85 c0                	test   eax,eax
  8016b0:	0f 48 c2             	cmovs  eax,edx
  8016b3:	c1 f8 05             	sar    eax,0x5
  8016b6:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  8016b9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8016bc:	99                   	cdq    
  8016bd:	c1 ea 1b             	shr    edx,0x1b
  8016c0:	01 d0                	add    eax,edx
  8016c2:	83 e0 1f             	and    eax,0x1f
  8016c5:	29 d0                	sub    eax,edx
  8016c7:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    page_map[n]=page_map[n]&~(unsigned int)(1<<r);
  8016ca:	48 8b 15 4f e9 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe94f]        # 400020 <page_map>
  8016d1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8016d4:	48 98                	cdqe   
  8016d6:	48 c1 e0 02          	shl    rax,0x2
  8016da:	48 01 d0             	add    rax,rdx
  8016dd:	8b 10                	mov    edx,DWORD PTR [rax]
  8016df:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8016e2:	be 01 00 00 00       	mov    esi,0x1
  8016e7:	89 c1                	mov    ecx,eax
  8016e9:	d3 e6                	shl    esi,cl
  8016eb:	89 f0                	mov    eax,esi
  8016ed:	f7 d0                	not    eax
  8016ef:	89 c6                	mov    esi,eax
  8016f1:	48 8b 0d 28 e9 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe928]        # 400020 <page_map>
  8016f8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8016fb:	48 98                	cdqe   
  8016fd:	48 c1 e0 02          	shl    rax,0x2
  801701:	48 01 c8             	add    rax,rcx
  801704:	21 f2                	and    edx,esi
  801706:	89 10                	mov    DWORD PTR [rax],edx
}
  801708:	90                   	nop
  801709:	5d                   	pop    rbp
  80170a:	c3                   	ret    

000000000080170b <free_pages_at>:

int free_pages_at(int base,int pgn){
  80170b:	f3 0f 1e fa          	endbr64 
  80170f:	55                   	push   rbp
  801710:	48 89 e5             	mov    rbp,rsp
  801713:	48 83 ec 18          	sub    rsp,0x18
  801717:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80171a:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<pgn;i++){
  80171d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801724:	eb 1b                	jmp    801741 <free_pages_at+0x36>
        free_page(base+i*PAGE_4K_SIZE);
  801726:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801729:	c1 e0 0c             	shl    eax,0xc
  80172c:	89 c2                	mov    edx,eax
  80172e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801731:	01 d0                	add    eax,edx
  801733:	48 98                	cdqe   
  801735:	48 89 c7             	mov    rdi,rax
  801738:	e8 4a ff ff ff       	call   801687 <free_page>
    for(int i=0;i<pgn;i++){
  80173d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801741:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801744:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  801747:	7c dd                	jl     801726 <free_pages_at+0x1b>
    }
}
  801749:	90                   	nop
  80174a:	c9                   	leave  
  80174b:	c3                   	ret    

000000000080174c <check_page>:
int check_page(int num){
  80174c:	f3 0f 1e fa          	endbr64 
  801750:	55                   	push   rbp
  801751:	48 89 e5             	mov    rbp,rsp
  801754:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int n=num/32;
  801757:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80175a:	8d 50 1f             	lea    edx,[rax+0x1f]
  80175d:	85 c0                	test   eax,eax
  80175f:	0f 48 c2             	cmovs  eax,edx
  801762:	c1 f8 05             	sar    eax,0x5
  801765:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int r=num%32;
  801768:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80176b:	99                   	cdq    
  80176c:	c1 ea 1b             	shr    edx,0x1b
  80176f:	01 d0                	add    eax,edx
  801771:	83 e0 1f             	and    eax,0x1f
  801774:	29 d0                	sub    eax,edx
  801776:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int bit=page_map[n]&(1<<r);
  801779:	48 8b 15 a0 e8 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe8a0]        # 400020 <page_map>
  801780:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801783:	48 98                	cdqe   
  801785:	48 c1 e0 02          	shl    rax,0x2
  801789:	48 01 d0             	add    rax,rdx
  80178c:	8b 10                	mov    edx,DWORD PTR [rax]
  80178e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801791:	be 01 00 00 00       	mov    esi,0x1
  801796:	89 c1                	mov    ecx,eax
  801798:	d3 e6                	shl    esi,cl
  80179a:	89 f0                	mov    eax,esi
  80179c:	21 d0                	and    eax,edx
  80179e:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    return bit;
  8017a1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  8017a4:	5d                   	pop    rbp
  8017a5:	c3                   	ret    

00000000008017a6 <get_phyaddr>:
/*
 * 获得这个页对应的物理内存地址
 * */
int get_phyaddr(int num){
  8017a6:	f3 0f 1e fa          	endbr64 
  8017aa:	55                   	push   rbp
  8017ab:	48 89 e5             	mov    rbp,rsp
  8017ae:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return num*0x1000;
  8017b1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8017b4:	c1 e0 0c             	shl    eax,0xc
}
  8017b7:	5d                   	pop    rbp
  8017b8:	c3                   	ret    

00000000008017b9 <set_page_item>:

void set_page_item(page_item *item_addr,int phy_addr,int attr)
{
  8017b9:	f3 0f 1e fa          	endbr64 
  8017bd:	55                   	push   rbp
  8017be:	48 89 e5             	mov    rbp,rsp
  8017c1:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8017c5:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  8017c8:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    *item_addr=0;
  8017cb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8017cf:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *item_addr|=phy_addr&0xfffff000;
  8017d6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8017da:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8017dd:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8017e0:	89 c0                	mov    eax,eax
  8017e2:	25 00 f0 ff ff       	and    eax,0xfffff000
  8017e7:	48 09 c2             	or     rdx,rax
  8017ea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8017ee:	48 89 10             	mov    QWORD PTR [rax],rdx
    *item_addr|=attr;
  8017f1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8017f5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8017f8:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8017fb:	48 98                	cdqe   
  8017fd:	48 09 c2             	or     rdx,rax
  801800:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801804:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  801807:	90                   	nop
  801808:	5d                   	pop    rbp
  801809:	c3                   	ret    

000000000080180a <set_1gb_pdpt>:
void set_1gb_pdpt(page_item* ppdpt,int pa,unsigned int extra_attr)
{
  80180a:	f3 0f 1e fa          	endbr64 
  80180e:	55                   	push   rbp
  80180f:	48 89 e5             	mov    rbp,rsp
  801812:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  801816:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  801819:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *ppdpt=0;
  80181c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801820:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *ppdpt|=PAGE_PRESENT|PDPTE_1GB|extra_attr;
  801827:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80182b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80182e:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  801831:	0c 81                	or     al,0x81
  801833:	89 c0                	mov    eax,eax
  801835:	48 09 c2             	or     rdx,rax
  801838:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80183c:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffffc0000000ul;
  80183f:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801842:	25 00 00 00 c0       	and    eax,0xc0000000
  801847:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *ppdpt|=hipa;
  80184a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80184e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801851:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801854:	48 09 c2             	or     rdx,rax
  801857:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80185b:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  80185e:	90                   	nop
  80185f:	5d                   	pop    rbp
  801860:	c3                   	ret    

0000000000801861 <set_2mb_pde>:
void set_2mb_pde(page_item *pde, int pa, int extra_attr)
{
  801861:	f3 0f 1e fa          	endbr64 
  801865:	55                   	push   rbp
  801866:	48 89 e5             	mov    rbp,rsp
  801869:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80186d:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  801870:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *pde=0;
  801873:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801877:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *pde|=PAGE_PRESENT|PAGE_4MB_PAGE|PDE_4MB_PAT|extra_attr;
  80187e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801882:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801885:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  801888:	0d 81 10 00 00       	or     eax,0x1081
  80188d:	48 98                	cdqe   
  80188f:	48 09 c2             	or     rdx,rax
  801892:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801896:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffc00000;
  801899:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80189c:	25 00 00 c0 ff       	and    eax,0xffc00000
  8018a1:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *pde|=hipa;
  8018a4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018a8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8018ab:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8018ae:	48 09 c2             	or     rdx,rax
  8018b1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018b5:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  8018b8:	90                   	nop
  8018b9:	5d                   	pop    rbp
  8018ba:	c3                   	ret    

00000000008018bb <req_page_at>:
        page_map[i]&=(u32)(1<<j);
    return ret;
} */
//在bitmap申请指定的页面,base默认0x1000对齐
addr_t req_page_at(addr_t base,int pgn)
{
  8018bb:	f3 0f 1e fa          	endbr64 
  8018bf:	55                   	push   rbp
  8018c0:	48 89 e5             	mov    rbp,rsp
  8018c3:	48 83 ec 20          	sub    rsp,0x20
  8018c7:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8018cb:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    if(base==0)//不指定地址
  8018ce:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  8018d3:	75 18                	jne    8018ed <req_page_at+0x32>
    {
        return get_phyaddr(req_a_page());
  8018d5:	b8 00 00 00 00       	mov    eax,0x0
  8018da:	e8 d8 fc ff ff       	call   8015b7 <req_a_page>
  8018df:	89 c7                	mov    edi,eax
  8018e1:	e8 c0 fe ff ff       	call   8017a6 <get_phyaddr>
  8018e6:	48 98                	cdqe   
  8018e8:	e9 a5 00 00 00       	jmp    801992 <req_page_at+0xd7>
    }
    if(!is_pgs_ava(base,pgn))return -1;//先检查
  8018ed:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018f1:	89 c2                	mov    edx,eax
  8018f3:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8018f6:	89 c6                	mov    esi,eax
  8018f8:	89 d7                	mov    edi,edx
  8018fa:	e8 52 01 00 00       	call   801a51 <is_pgs_ava>
  8018ff:	85 c0                	test   eax,eax
  801901:	75 0c                	jne    80190f <req_page_at+0x54>
  801903:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80190a:	e9 83 00 00 00       	jmp    801992 <req_page_at+0xd7>
    int pgni=base/4096;
  80190f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801913:	48 c1 e8 0c          	shr    rax,0xc
  801917:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int pgi=pgni/32;
  80191a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80191d:	8d 50 1f             	lea    edx,[rax+0x1f]
  801920:	85 c0                	test   eax,eax
  801922:	0f 48 c2             	cmovs  eax,edx
  801925:	c1 f8 05             	sar    eax,0x5
  801928:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    int pgj=pgni%32;
  80192b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80192e:	99                   	cdq    
  80192f:	c1 ea 1b             	shr    edx,0x1b
  801932:	01 d0                	add    eax,edx
  801934:	83 e0 1f             	and    eax,0x1f
  801937:	29 d0                	sub    eax,edx
  801939:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<pgn;i++)
  80193c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801943:	eb 40                	jmp    801985 <req_page_at+0xca>
    {
        page_map[i]|=(1<<pgj);
  801945:	48 8b 15 d4 e6 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe6d4]        # 400020 <page_map>
  80194c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80194f:	48 98                	cdqe   
  801951:	48 c1 e0 02          	shl    rax,0x2
  801955:	48 01 d0             	add    rax,rdx
  801958:	8b 10                	mov    edx,DWORD PTR [rax]
  80195a:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80195d:	be 01 00 00 00       	mov    esi,0x1
  801962:	89 c1                	mov    ecx,eax
  801964:	d3 e6                	shl    esi,cl
  801966:	89 f0                	mov    eax,esi
  801968:	89 c6                	mov    esi,eax
  80196a:	48 8b 0d af e6 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe6af]        # 400020 <page_map>
  801971:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801974:	48 98                	cdqe   
  801976:	48 c1 e0 02          	shl    rax,0x2
  80197a:	48 01 c8             	add    rax,rcx
  80197d:	09 f2                	or     edx,esi
  80197f:	89 10                	mov    DWORD PTR [rax],edx
    for(int i=0;i<pgn;i++)
  801981:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801985:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801988:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80198b:	7c b8                	jl     801945 <req_page_at+0x8a>
    }
    return 0;
  80198d:	b8 00 00 00 00       	mov    eax,0x0

}
  801992:	c9                   	leave  
  801993:	c3                   	ret    

0000000000801994 <chk_vm>:
int chk_vm(int base, int pgn)
{
  801994:	f3 0f 1e fa          	endbr64 
  801998:	55                   	push   rbp
  801999:	48 89 e5             	mov    rbp,rsp
  80199c:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80199f:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int *pdet=0;
  8019a2:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8019a9:	00 
    asm volatile("mov %%cr3,%0":"=r"(pdet));
  8019aa:	0f 20 d8             	mov    rax,cr3
  8019ad:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int *pt=pdet[base/PAGE_INDEX_SIZE]&0xfffff000;
  8019b1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8019b4:	8d 90 ff ff 1f 00    	lea    edx,[rax+0x1fffff]
  8019ba:	85 c0                	test   eax,eax
  8019bc:	0f 48 c2             	cmovs  eax,edx
  8019bf:	c1 f8 15             	sar    eax,0x15
  8019c2:	48 98                	cdqe   
  8019c4:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8019cb:	00 
  8019cc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8019d0:	48 01 d0             	add    rax,rdx
  8019d3:	8b 00                	mov    eax,DWORD PTR [rax]
  8019d5:	89 c0                	mov    eax,eax
  8019d7:	25 00 f0 ff ff       	and    eax,0xfffff000
  8019dc:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  8019e0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8019e3:	8d 90 ff ff 1f 00    	lea    edx,[rax+0x1fffff]
  8019e9:	85 c0                	test   eax,eax
  8019eb:	0f 48 c2             	cmovs  eax,edx
  8019ee:	c1 f8 15             	sar    eax,0x15
  8019f1:	48 98                	cdqe   
  8019f3:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8019fa:	00 
  8019fb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8019ff:	48 01 d0             	add    rax,rdx
  801a02:	8b 00                	mov    eax,DWORD PTR [rax]
  801a04:	83 e0 01             	and    eax,0x1
  801a07:	85 c0                	test   eax,eax
  801a09:	74 38                	je     801a43 <chk_vm+0xaf>
    !(pt[base%PAGE_INDEX_SIZE/PAGE_SIZE]&PAGE_PRESENT))
  801a0b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a0e:	99                   	cdq    
  801a0f:	c1 ea 0b             	shr    edx,0xb
  801a12:	01 d0                	add    eax,edx
  801a14:	25 ff ff 1f 00       	and    eax,0x1fffff
  801a19:	29 d0                	sub    eax,edx
  801a1b:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801a21:	85 c0                	test   eax,eax
  801a23:	0f 48 c2             	cmovs  eax,edx
  801a26:	c1 f8 0c             	sar    eax,0xc
  801a29:	48 98                	cdqe   
  801a2b:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801a32:	00 
  801a33:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801a37:	48 01 d0             	add    rax,rdx
  801a3a:	8b 00                	mov    eax,DWORD PTR [rax]
  801a3c:	83 e0 01             	and    eax,0x1
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  801a3f:	85 c0                	test   eax,eax
  801a41:	75 07                	jne    801a4a <chk_vm+0xb6>
    {
        return -1;
  801a43:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801a48:	eb 05                	jmp    801a4f <chk_vm+0xbb>
    }
    return 0;
  801a4a:	b8 00 00 00 00       	mov    eax,0x0
}
  801a4f:	5d                   	pop    rbp
  801a50:	c3                   	ret    

0000000000801a51 <is_pgs_ava>:
//查看指定区域的页内存是否可用
int is_pgs_ava(int base,int pgn)
{
  801a51:	f3 0f 1e fa          	endbr64 
  801a55:	55                   	push   rbp
  801a56:	48 89 e5             	mov    rbp,rsp
  801a59:	48 83 ec 18          	sub    rsp,0x18
  801a5d:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801a60:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int pgi=base/4096;
  801a63:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a66:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801a6c:	85 c0                	test   eax,eax
  801a6e:	0f 48 c2             	cmovs  eax,edx
  801a71:	c1 f8 0c             	sar    eax,0xc
  801a74:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    for(int i=0;i<pgn;i++)
  801a77:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801a7e:	eb 1e                	jmp    801a9e <is_pgs_ava+0x4d>
    {
        if(check_page(pgi+i)!=0)return 0;
  801a80:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801a83:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a86:	01 d0                	add    eax,edx
  801a88:	89 c7                	mov    edi,eax
  801a8a:	e8 bd fc ff ff       	call   80174c <check_page>
  801a8f:	85 c0                	test   eax,eax
  801a91:	74 07                	je     801a9a <is_pgs_ava+0x49>
  801a93:	b8 00 00 00 00       	mov    eax,0x0
  801a98:	eb 11                	jmp    801aab <is_pgs_ava+0x5a>
    for(int i=0;i<pgn;i++)
  801a9a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801a9e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801aa1:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  801aa4:	7c da                	jl     801a80 <is_pgs_ava+0x2f>
    }
    return 1;
  801aa6:	b8 01 00 00 00       	mov    eax,0x1

}
  801aab:	c9                   	leave  
  801aac:	c3                   	ret    

0000000000801aad <setup_sys_vol>:
super_block sbs[MAX_SUPERBLOCKS];
fs_operations fs[MAX_FS];

buffer_head buffer_heads[NR_BUFFERHEADS];
int setup_sys_vol(void *disk_drv, void *fs_drv)
{
  801aad:	f3 0f 1e fa          	endbr64 
  801ab1:	55                   	push   rbp
  801ab2:	48 89 e5             	mov    rbp,rsp
  801ab5:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  801ab9:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    vols[0].name[0]='C';
  801abd:	c6 05 7c e7 bf ff 43 	mov    BYTE PTR [rip+0xffffffffffbfe77c],0x43        # 400240 <vols>
    vols[0].name[1]='\0';
  801ac4:	c6 05 76 e7 bf ff 00 	mov    BYTE PTR [rip+0xffffffffffbfe776],0x0        # 400241 <vols+0x1>
    vols[0].disk_drv=disk_drv;
  801acb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801acf:	48 89 05 72 e7 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe772],rax        # 400248 <vols+0x8>
    vols[0].fs_drv=fs_drv;
  801ad6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801ada:	48 89 05 6f e7 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe76f],rax        # 400250 <vols+0x10>
    vols[0].stat=VOLUME_STAT_READY;
  801ae1:	c7 05 75 e7 bf ff 01 	mov    DWORD PTR [rip+0xffffffffffbfe775],0x1        # 400260 <vols+0x20>
  801ae8:	00 00 00 
    return 0;
  801aeb:	b8 00 00 00 00       	mov    eax,0x0
}
  801af0:	5d                   	pop    rbp
  801af1:	c3                   	ret    

0000000000801af2 <sys_mkfifo>:
//返回管道描述符
int sys_mkfifo(int number)
{
  801af2:	f3 0f 1e fa          	endbr64 
  801af6:	55                   	push   rbp
  801af7:	48 89 e5             	mov    rbp,rsp
  801afa:	48 83 ec 20          	sub    rsp,0x20
  801afe:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    //查重
    for(int i=0;i<MAX_FIFOS;i++)
  801b01:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801b08:	eb 38                	jmp    801b42 <sys_mkfifo+0x50>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801b0a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b0d:	48 98                	cdqe   
  801b0f:	48 c1 e0 04          	shl    rax,0x4
  801b13:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801b19:	8b 00                	mov    eax,DWORD PTR [rax]
  801b1b:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801b1e:	75 1e                	jne    801b3e <sys_mkfifo+0x4c>
  801b20:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b23:	48 98                	cdqe   
  801b25:	48 c1 e0 04          	shl    rax,0x4
  801b29:	48 05 68 1e 40 00    	add    rax,0x401e68
  801b2f:	8b 00                	mov    eax,DWORD PTR [rax]
  801b31:	83 f8 01             	cmp    eax,0x1
  801b34:	75 08                	jne    801b3e <sys_mkfifo+0x4c>
            return i;
  801b36:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b39:	e9 a6 00 00 00       	jmp    801be4 <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801b3e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801b42:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801b46:	7e c2                	jle    801b0a <sys_mkfifo+0x18>
        }
    }
    for(int i=0;i<MAX_FIFOS;i++)
  801b48:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801b4f:	e9 81 00 00 00       	jmp    801bd5 <sys_mkfifo+0xe3>
    {
        if(fifos[i].flag==0) {
  801b54:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801b57:	48 98                	cdqe   
  801b59:	48 c1 e0 04          	shl    rax,0x4
  801b5d:	48 05 68 1e 40 00    	add    rax,0x401e68
  801b63:	8b 00                	mov    eax,DWORD PTR [rax]
  801b65:	85 c0                	test   eax,eax
  801b67:	75 68                	jne    801bd1 <sys_mkfifo+0xdf>
            fifos[i].flag=1;
  801b69:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801b6c:	48 98                	cdqe   
  801b6e:	48 c1 e0 04          	shl    rax,0x4
  801b72:	48 05 68 1e 40 00    	add    rax,0x401e68
  801b78:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            fifos[i].id=number;
  801b7e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801b81:	48 98                	cdqe   
  801b83:	48 c1 e0 04          	shl    rax,0x4
  801b87:	48 8d 90 6c 1e 40 00 	lea    rdx,[rax+0x401e6c]
  801b8e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801b91:	89 02                	mov    DWORD PTR [rdx],eax
            fifos[i].size=CHUNK_SIZE;
  801b93:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801b96:	48 98                	cdqe   
  801b98:	48 c1 e0 04          	shl    rax,0x4
  801b9c:	48 05 64 1e 40 00    	add    rax,0x401e64
  801ba2:	c7 00 00 10 00 00    	mov    DWORD PTR [rax],0x1000
            //分配内存
            fifos[i].pa= get_phyaddr(req_a_page());
  801ba8:	b8 00 00 00 00       	mov    eax,0x0
  801bad:	e8 05 fa ff ff       	call   8015b7 <req_a_page>
  801bb2:	89 c7                	mov    edi,eax
  801bb4:	e8 ed fb ff ff       	call   8017a6 <get_phyaddr>
  801bb9:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801bbc:	48 63 d2             	movsxd rdx,edx
  801bbf:	48 c1 e2 04          	shl    rdx,0x4
  801bc3:	48 81 c2 60 1e 40 00 	add    rdx,0x401e60
  801bca:	89 02                	mov    DWORD PTR [rdx],eax
            return i;
  801bcc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801bcf:	eb 13                	jmp    801be4 <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801bd1:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801bd5:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  801bd9:	0f 8e 75 ff ff ff    	jle    801b54 <sys_mkfifo+0x62>
        }
    }
    return -1;
  801bdf:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801be4:	c9                   	leave  
  801be5:	c3                   	ret    

0000000000801be6 <sys_rmfifo>:

int sys_rmfifo(int number)
{
  801be6:	f3 0f 1e fa          	endbr64 
  801bea:	55                   	push   rbp
  801beb:	48 89 e5             	mov    rbp,rsp
  801bee:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_FIFOS;i++)
  801bf1:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801bf8:	eb 4a                	jmp    801c44 <sys_rmfifo+0x5e>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801bfa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801bfd:	48 98                	cdqe   
  801bff:	48 c1 e0 04          	shl    rax,0x4
  801c03:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801c09:	8b 00                	mov    eax,DWORD PTR [rax]
  801c0b:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801c0e:	75 30                	jne    801c40 <sys_rmfifo+0x5a>
  801c10:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801c13:	48 98                	cdqe   
  801c15:	48 c1 e0 04          	shl    rax,0x4
  801c19:	48 05 68 1e 40 00    	add    rax,0x401e68
  801c1f:	8b 00                	mov    eax,DWORD PTR [rax]
  801c21:	83 f8 01             	cmp    eax,0x1
  801c24:	75 1a                	jne    801c40 <sys_rmfifo+0x5a>
            fifos[i].flag=0;
  801c26:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801c29:	48 98                	cdqe   
  801c2b:	48 c1 e0 04          	shl    rax,0x4
  801c2f:	48 05 68 1e 40 00    	add    rax,0x401e68
  801c35:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            return i;
  801c3b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801c3e:	eb 0f                	jmp    801c4f <sys_rmfifo+0x69>
    for(int i=0;i<MAX_FIFOS;i++)
  801c40:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801c44:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801c48:	7e b0                	jle    801bfa <sys_rmfifo+0x14>
        }
    }
    return -1;
  801c4a:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801c4f:	5d                   	pop    rbp
  801c50:	c3                   	ret    

0000000000801c51 <free_vol>:
int free_vol(int voli)
{
  801c51:	f3 0f 1e fa          	endbr64 
  801c55:	55                   	push   rbp
  801c56:	48 89 e5             	mov    rbp,rsp
  801c59:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    vols[0].stat=VOLUME_STAT_EMPTY;
  801c5c:	c7 05 fa e5 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbfe5fa],0x0        # 400260 <vols+0x20>
  801c63:	00 00 00 
    return 0;
  801c66:	b8 00 00 00 00       	mov    eax,0x0
}
  801c6b:	5d                   	pop    rbp
  801c6c:	c3                   	ret    

0000000000801c6d <reg_vol>:

int reg_vol(int disk_drvi, int fs_drvi, char *name)
{
  801c6d:	f3 0f 1e fa          	endbr64 
  801c71:	55                   	push   rbp
  801c72:	48 89 e5             	mov    rbp,rsp
  801c75:	48 83 ec 20          	sub    rsp,0x20
  801c79:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801c7c:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  801c7f:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
    for(int i=0;i<MAX_VOLUMES;i++)
  801c83:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801c8a:	e9 d8 00 00 00       	jmp    801d67 <reg_vol+0xfa>
    {
        if(vols[i].stat==VOLUME_STAT_EMPTY)
  801c8f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801c92:	48 63 d0             	movsxd rdx,eax
  801c95:	48 89 d0             	mov    rax,rdx
  801c98:	48 c1 e0 02          	shl    rax,0x2
  801c9c:	48 01 d0             	add    rax,rdx
  801c9f:	48 c1 e0 03          	shl    rax,0x3
  801ca3:	48 05 60 02 40 00    	add    rax,0x400260
  801ca9:	8b 00                	mov    eax,DWORD PTR [rax]
  801cab:	85 c0                	test   eax,eax
  801cad:	0f 85 b0 00 00 00    	jne    801d63 <reg_vol+0xf6>
        {
            extern driver *drvs;
            vols[i].stat=VOLUME_STAT_READY;
  801cb3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801cb6:	48 63 d0             	movsxd rdx,eax
  801cb9:	48 89 d0             	mov    rax,rdx
  801cbc:	48 c1 e0 02          	shl    rax,0x2
  801cc0:	48 01 d0             	add    rax,rdx
  801cc3:	48 c1 e0 03          	shl    rax,0x3
  801cc7:	48 05 60 02 40 00    	add    rax,0x400260
  801ccd:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            vols[i].fs= &fs[fs_drvi];
  801cd3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801cd6:	48 63 d0             	movsxd rdx,eax
  801cd9:	48 89 d0             	mov    rax,rdx
  801cdc:	48 01 c0             	add    rax,rax
  801cdf:	48 01 d0             	add    rax,rdx
  801ce2:	48 c1 e0 03          	shl    rax,0x3
  801ce6:	48 8d 88 80 23 40 00 	lea    rcx,[rax+0x402380]
  801ced:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801cf0:	48 63 d0             	movsxd rdx,eax
  801cf3:	48 89 d0             	mov    rax,rdx
  801cf6:	48 c1 e0 02          	shl    rax,0x2
  801cfa:	48 01 d0             	add    rax,rdx
  801cfd:	48 c1 e0 03          	shl    rax,0x3
  801d01:	48 05 58 02 40 00    	add    rax,0x400258
  801d07:	48 89 08             	mov    QWORD PTR [rax],rcx
            vols[i].disk_drv= get_drv(disk_drvi);
  801d0a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801d0d:	89 c7                	mov    edi,eax
  801d0f:	e8 e7 17 00 00       	call   8034fb <get_drv>
  801d14:	48 89 c2             	mov    rdx,rax
  801d17:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801d1a:	48 63 c8             	movsxd rcx,eax
  801d1d:	48 89 c8             	mov    rax,rcx
  801d20:	48 c1 e0 02          	shl    rax,0x2
  801d24:	48 01 c8             	add    rax,rcx
  801d27:	48 c1 e0 03          	shl    rax,0x3
  801d2b:	48 05 48 02 40 00    	add    rax,0x400248
  801d31:	48 89 10             	mov    QWORD PTR [rax],rdx
            strcpy(vols[i].name,name);
  801d34:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801d37:	48 63 d0             	movsxd rdx,eax
  801d3a:	48 89 d0             	mov    rax,rdx
  801d3d:	48 c1 e0 02          	shl    rax,0x2
  801d41:	48 01 d0             	add    rax,rdx
  801d44:	48 c1 e0 03          	shl    rax,0x3
  801d48:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801d4f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801d53:	48 89 c6             	mov    rsi,rax
  801d56:	48 89 d7             	mov    rdi,rdx
  801d59:	e8 95 a2 00 00       	call   80bff3 <strcpy>
            return i;
  801d5e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801d61:	eb 13                	jmp    801d76 <reg_vol+0x109>
    for(int i=0;i<MAX_VOLUMES;i++)
  801d63:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801d67:	83 7d fc 19          	cmp    DWORD PTR [rbp-0x4],0x19
  801d6b:	0f 8e 1e ff ff ff    	jle    801c8f <reg_vol+0x22>
        }
    }
    return -1;
  801d71:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801d76:	c9                   	leave  
  801d77:	c3                   	ret    

0000000000801d78 <sys_tell>:
//    if(!f)return -1;
//    f->ptr=offset+origin;
//    return 0;
//}
int sys_tell(int fno)
{
  801d78:	f3 0f 1e fa          	endbr64 
  801d7c:	55                   	push   rbp
  801d7d:	48 89 e5             	mov    rbp,rsp
  801d80:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    struct file* f=current->openf[fno];
  801d83:	48 8b 05 16 38 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc13816]        # 4155a0 <current>
  801d8a:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  801d8d:	48 63 d2             	movsxd rdx,edx
  801d90:	48 83 c2 1a          	add    rdx,0x1a
  801d94:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  801d99:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return f->position;
  801d9d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801da1:	48 8b 00             	mov    rax,QWORD PTR [rax]
}
  801da4:	5d                   	pop    rbp
  801da5:	c3                   	ret    

0000000000801da6 <get_vfs_entry>:
vfs_dir_entry *get_vfs_entry(int fno)
{
  801da6:	f3 0f 1e fa          	endbr64 
  801daa:	55                   	push   rbp
  801dab:	48 89 e5             	mov    rbp,rsp
  801dae:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801db1:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801db8:	eb 3f                	jmp    801df9 <get_vfs_entry+0x53>
    {
        if(opened[i].fno==fno)
  801dba:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801dbd:	48 63 d0             	movsxd rdx,eax
  801dc0:	48 89 d0             	mov    rax,rdx
  801dc3:	48 01 c0             	add    rax,rax
  801dc6:	48 01 d0             	add    rax,rdx
  801dc9:	48 c1 e0 05          	shl    rax,0x5
  801dcd:	48 05 60 06 40 00    	add    rax,0x400660
  801dd3:	8b 00                	mov    eax,DWORD PTR [rax]
  801dd5:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801dd8:	75 1b                	jne    801df5 <get_vfs_entry+0x4f>
        {
            return &opened[i];
  801dda:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ddd:	48 63 d0             	movsxd rdx,eax
  801de0:	48 89 d0             	mov    rax,rdx
  801de3:	48 01 c0             	add    rax,rax
  801de6:	48 01 d0             	add    rax,rdx
  801de9:	48 c1 e0 05          	shl    rax,0x5
  801ded:	48 05 60 06 40 00    	add    rax,0x400660
  801df3:	eb 0f                	jmp    801e04 <get_vfs_entry+0x5e>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801df5:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801df9:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  801dfd:	7e bb                	jle    801dba <get_vfs_entry+0x14>
        }
    }
    return NULL;
  801dff:	b8 00 00 00 00       	mov    eax,0x0
}
  801e04:	5d                   	pop    rbp
  801e05:	c3                   	ret    

0000000000801e06 <brelse>:

//释放缓冲区（只释放这一块）
int brelse(buffer_head* bh)
{
  801e06:	f3 0f 1e fa          	endbr64 
  801e0a:	55                   	push   rbp
  801e0b:	48 89 e5             	mov    rbp,rsp
  801e0e:	48 83 ec 10          	sub    rsp,0x10
  801e12:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    wait_on_buf(bh);
  801e16:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801e1a:	48 89 c7             	mov    rdi,rax
  801e1d:	e8 a0 04 00 00       	call   8022c2 <wait_on_buf>
    if(bh->b_count==0)return -1;
  801e22:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801e26:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801e2a:	84 c0                	test   al,al
  801e2c:	75 07                	jne    801e35 <brelse+0x2f>
  801e2e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801e33:	eb 32                	jmp    801e67 <brelse+0x61>
    bh->b_count--;
  801e35:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801e39:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801e3d:	8d 50 ff             	lea    edx,[rax-0x1]
  801e40:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801e44:	88 50 14             	mov    BYTE PTR [rax+0x14],dl
    if(bh->b_count==0)
  801e47:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801e4b:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801e4f:	84 c0                	test   al,al
  801e51:	75 0f                	jne    801e62 <brelse+0x5c>
        vmfree(bh->b_data);
  801e53:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801e57:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801e5a:	48 89 c7             	mov    rdi,rax
  801e5d:	e8 2a f4 ff ff       	call   80128c <vmfree>
    return 0;
  801e62:	b8 00 00 00 00       	mov    eax,0x0
}
  801e67:	c9                   	leave  
  801e68:	c3                   	ret    

0000000000801e69 <bread>:
//从设备中读取指定设备的指定块并返回缓冲区
buffer_head* bread(int dev,int blk)
{
  801e69:	f3 0f 1e fa          	endbr64 
  801e6d:	55                   	push   rbp
  801e6e:	48 89 e5             	mov    rbp,rsp
  801e71:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  801e78:	89 bd 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],edi
  801e7e:	89 b5 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],esi

    buffer_head *bh=get_buf(dev,blk);
  801e84:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  801e8a:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  801e90:	89 d6                	mov    esi,edx
  801e92:	89 c7                	mov    edi,eax
  801e94:	e8 78 02 00 00       	call   802111 <get_buf>
  801e99:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!bh)return -1;//申请失败
  801e9d:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  801ea2:	75 09                	jne    801ead <bread+0x44>
  801ea4:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  801eab:	eb 75                	jmp    801f22 <bread+0xb9>
    if(!bh->b_uptodate)
  801ead:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801eb1:	0f b6 40 12          	movzx  eax,BYTE PTR [rax+0x12]
  801eb5:	84 c0                	test   al,al
  801eb7:	75 65                	jne    801f1e <bread+0xb5>
    {
        driver_args arg;
        arg.dev=dev;
  801eb9:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  801ebf:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
        arg.cmd=DRVF_READ;
  801ec2:	c7 45 d8 02 00 00 00 	mov    DWORD PTR [rbp-0x28],0x2
        arg.dist_addr=bh->b_data;
  801ec9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801ecd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801ed0:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.len=BLOCK_SIZE;
  801ed6:	c7 85 48 ff ff ff 00 	mov    DWORD PTR [rbp-0xb8],0x200
  801edd:	02 00 00 
        arg.lba=bh->b_blocknr;
  801ee0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801ee4:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  801ee8:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
        arg.sec_c=BLOCK_SIZE/512;//之后会改
  801eee:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  801ef5:	00 00 00 
        //lock_buffer(bh);//锁定缓冲块直到读取完成
        int reqi=make_request(&arg);
  801ef8:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  801eff:	48 89 c7             	mov    rdi,rax
  801f02:	e8 1b 16 00 00       	call   803522 <make_request>
  801f07:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        wait_on_req(reqi);
  801f0a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801f0d:	89 c7                	mov    edi,eax
  801f0f:	e8 21 19 00 00       	call   803835 <wait_on_req>
        clear_req(reqi);
  801f14:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801f17:	89 c7                	mov    edi,eax
  801f19:	e8 47 19 00 00       	call   803865 <clear_req>
    }
    return bh;
  801f1e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  801f22:	c9                   	leave  
  801f23:	c3                   	ret    

0000000000801f24 <vfs_read_file>:


int vfs_read_file(vfs_dir_entry *f,char *buf,int len)
{
  801f24:	f3 0f 1e fa          	endbr64 
  801f28:	55                   	push   rbp
  801f29:	48 89 e5             	mov    rbp,rsp
  801f2c:	48 83 ec 40          	sub    rsp,0x40
  801f30:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  801f34:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  801f38:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  801f3b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801f3f:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  801f42:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  801f45:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801f49:	48 89 c7             	mov    rdi,rax
  801f4c:	e8 80 01 00 00       	call   8020d1 <get_according_bnr>
  801f51:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=bread(dev,block);
  801f54:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801f57:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801f5a:	89 d6                	mov    esi,edx
  801f5c:	89 c7                	mov    edi,eax
  801f5e:	e8 06 ff ff ff       	call   801e69 <bread>
  801f63:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  801f67:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  801f6a:	ba 00 02 00 00       	mov    edx,0x200
  801f6f:	39 d0                	cmp    eax,edx
  801f71:	0f 4f c2             	cmovg  eax,edx
  801f74:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(buf,bh->b_data,size);
  801f77:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  801f7a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801f7e:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  801f81:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  801f85:	48 89 ce             	mov    rsi,rcx
  801f88:	48 89 c7             	mov    rdi,rax
  801f8b:	e8 65 9f 00 00       	call   80bef5 <memcpy>
        len-=BLOCK_SIZE;
  801f90:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  801f97:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801f9b:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  801f9e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801fa1:	01 c2                	add    edx,eax
  801fa3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801fa7:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        brelse(bh);
  801faa:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801fae:	48 89 c7             	mov    rdi,rax
  801fb1:	e8 50 fe ff ff       	call   801e06 <brelse>
    }while(len>0);
  801fb6:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  801fba:	7f 89                	jg     801f45 <vfs_read_file+0x21>
    return 0;
  801fbc:	b8 00 00 00 00       	mov    eax,0x0
}
  801fc1:	c9                   	leave  
  801fc2:	c3                   	ret    

0000000000801fc3 <vfs_write_file>:
int vfs_write_file(vfs_dir_entry *f,char *buf,int len)
{
  801fc3:	f3 0f 1e fa          	endbr64 
  801fc7:	55                   	push   rbp
  801fc8:	48 89 e5             	mov    rbp,rsp
  801fcb:	48 83 ec 40          	sub    rsp,0x40
  801fcf:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  801fd3:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  801fd7:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  801fda:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801fde:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  801fe1:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  801fe4:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801fe8:	48 89 c7             	mov    rdi,rax
  801feb:	e8 e1 00 00 00       	call   8020d1 <get_according_bnr>
  801ff0:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=get_buf(dev,block);
  801ff3:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801ff6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ff9:	89 d6                	mov    esi,edx
  801ffb:	89 c7                	mov    edi,eax
  801ffd:	e8 0f 01 00 00       	call   802111 <get_buf>
  802002:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802006:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  802009:	ba 00 02 00 00       	mov    edx,0x200
  80200e:	39 d0                	cmp    eax,edx
  802010:	0f 4f c2             	cmovg  eax,edx
  802013:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(bh->b_data,buf,size);
  802016:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  802019:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80201d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802020:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802024:	48 89 ce             	mov    rsi,rcx
  802027:	48 89 c7             	mov    rdi,rax
  80202a:	e8 c6 9e 00 00       	call   80bef5 <memcpy>
        len-=BLOCK_SIZE;
  80202f:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  802036:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80203a:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  80203d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802040:	01 c2                	add    edx,eax
  802042:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802046:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        bh->b_dirt=1;//修改置位
  802049:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80204d:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  802051:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802055:	48 89 c7             	mov    rdi,rax
  802058:	e8 a9 fd ff ff       	call   801e06 <brelse>
    }while(len>0);
  80205d:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  802061:	7f 81                	jg     801fe4 <vfs_write_file+0x21>
    return 0;
  802063:	b8 00 00 00 00       	mov    eax,0x0
}
  802068:	c9                   	leave  
  802069:	c3                   	ret    

000000000080206a <vfs_seek_file>:

int vfs_seek_file(vfs_dir_entry *f,int offset,int origin)
{
  80206a:	f3 0f 1e fa          	endbr64 
  80206e:	55                   	push   rbp
  80206f:	48 89 e5             	mov    rbp,rsp
  802072:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  802076:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  802079:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    switch (origin)
  80207c:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  802080:	74 35                	je     8020b7 <vfs_seek_file+0x4d>
  802082:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  802086:	7f 3f                	jg     8020c7 <vfs_seek_file+0x5d>
  802088:	83 7d f0 00          	cmp    DWORD PTR [rbp-0x10],0x0
  80208c:	74 08                	je     802096 <vfs_seek_file+0x2c>
  80208e:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  802092:	74 0e                	je     8020a2 <vfs_seek_file+0x38>
        break;
    case SEEK_END:
        f->ptr=f->size;
        break;
    default:
        break;
  802094:	eb 31                	jmp    8020c7 <vfs_seek_file+0x5d>
        f->ptr=offset;
  802096:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80209a:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80209d:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  8020a0:	eb 26                	jmp    8020c8 <vfs_seek_file+0x5e>
        f->ptr+=offset;
  8020a2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8020a6:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8020a9:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8020ac:	01 c2                	add    edx,eax
  8020ae:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8020b2:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  8020b5:	eb 11                	jmp    8020c8 <vfs_seek_file+0x5e>
        f->ptr=f->size;
  8020b7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8020bb:	8b 50 18             	mov    edx,DWORD PTR [rax+0x18]
  8020be:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8020c2:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  8020c5:	eb 01                	jmp    8020c8 <vfs_seek_file+0x5e>
        break;
  8020c7:	90                   	nop
    }
    return f->ptr;
  8020c8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8020cc:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  8020cf:	5d                   	pop    rbp
  8020d0:	c3                   	ret    

00000000008020d1 <get_according_bnr>:
//返回文件ptr在块设备中的块号
int get_according_bnr(vfs_dir_entry *f)
{
  8020d1:	f3 0f 1e fa          	endbr64 
  8020d5:	55                   	push   rbp
  8020d6:	48 89 e5             	mov    rbp,rsp
  8020d9:	48 83 ec 10          	sub    rsp,0x10
  8020dd:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return vols[f->voln].fs->get_according_bnr(f);
  8020e1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8020e5:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8020e8:	48 63 d0             	movsxd rdx,eax
  8020eb:	48 89 d0             	mov    rax,rdx
  8020ee:	48 c1 e0 02          	shl    rax,0x2
  8020f2:	48 01 d0             	add    rax,rdx
  8020f5:	48 c1 e0 03          	shl    rax,0x3
  8020f9:	48 05 58 02 40 00    	add    rax,0x400258
  8020ff:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802102:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  802106:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80210a:	48 89 c7             	mov    rdi,rax
  80210d:	ff d2                	call   rdx

}
  80210f:	c9                   	leave  
  802110:	c3                   	ret    

0000000000802111 <get_buf>:
//获取或者新建一个和dev上block相对应的缓冲区。
buffer_head* get_buf(int dev,int block)
{
  802111:	f3 0f 1e fa          	endbr64 
  802115:	55                   	push   rbp
  802116:	48 89 e5             	mov    rbp,rsp
  802119:	48 83 ec 20          	sub    rsp,0x20
  80211d:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802120:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802123:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80212a:	e9 b9 00 00 00       	jmp    8021e8 <get_buf+0xd7>
    {
        if(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block)
  80212f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802132:	48 98                	cdqe   
  802134:	48 c1 e0 06          	shl    rax,0x6
  802138:	48 05 90 26 40 00    	add    rax,0x402690
  80213e:	0f b7 00             	movzx  eax,WORD PTR [rax]
  802141:	0f b7 c0             	movzx  eax,ax
  802144:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  802147:	0f 85 97 00 00 00    	jne    8021e4 <get_buf+0xd3>
  80214d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802150:	48 98                	cdqe   
  802152:	48 c1 e0 06          	shl    rax,0x6
  802156:	48 05 88 26 40 00    	add    rax,0x402688
  80215c:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80215f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802162:	48 98                	cdqe   
  802164:	48 39 c2             	cmp    rdx,rax
  802167:	75 7b                	jne    8021e4 <get_buf+0xd3>
        {
            repeat:
  802169:	90                   	nop
            wait_on_buf(&buffer_heads[i]);//等待解锁
  80216a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80216d:	48 98                	cdqe   
  80216f:	48 c1 e0 06          	shl    rax,0x6
  802173:	48 05 80 26 40 00    	add    rax,0x402680
  802179:	48 89 c7             	mov    rdi,rax
  80217c:	e8 41 01 00 00       	call   8022c2 <wait_on_buf>
            if(buffer_heads[i].b_count>0)//别的进程正在用
  802181:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802184:	48 98                	cdqe   
  802186:	48 c1 e0 06          	shl    rax,0x6
  80218a:	48 05 94 26 40 00    	add    rax,0x402694
  802190:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802193:	84 c0                	test   al,al
  802195:	74 02                	je     802199 <get_buf+0x88>
                goto repeat;
  802197:	eb d1                	jmp    80216a <get_buf+0x59>
            if(!(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block))//别的进程修改了
  802199:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80219c:	48 98                	cdqe   
  80219e:	48 c1 e0 06          	shl    rax,0x6
  8021a2:	48 05 90 26 40 00    	add    rax,0x402690
  8021a8:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8021ab:	0f b7 c0             	movzx  eax,ax
  8021ae:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8021b1:	75 30                	jne    8021e3 <get_buf+0xd2>
  8021b3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8021b6:	48 98                	cdqe   
  8021b8:	48 c1 e0 06          	shl    rax,0x6
  8021bc:	48 05 88 26 40 00    	add    rax,0x402688
  8021c2:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8021c5:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8021c8:	48 98                	cdqe   
  8021ca:	48 39 c2             	cmp    rdx,rax
  8021cd:	75 14                	jne    8021e3 <get_buf+0xd2>
                continue;
            return &buffer_heads[i];
  8021cf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8021d2:	48 98                	cdqe   
  8021d4:	48 c1 e0 06          	shl    rax,0x6
  8021d8:	48 05 80 26 40 00    	add    rax,0x402680
  8021de:	e9 dd 00 00 00       	jmp    8022c0 <get_buf+0x1af>
                continue;
  8021e3:	90                   	nop
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8021e4:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8021e8:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  8021ec:	0f 8e 3d ff ff ff    	jle    80212f <get_buf+0x1e>
        }
    }
    //空头中找
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8021f2:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8021f9:	e9 b8 00 00 00       	jmp    8022b6 <get_buf+0x1a5>
    {
        if(buffer_heads[i].b_count==0)
  8021fe:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802201:	48 98                	cdqe   
  802203:	48 c1 e0 06          	shl    rax,0x6
  802207:	48 05 94 26 40 00    	add    rax,0x402694
  80220d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802210:	84 c0                	test   al,al
  802212:	0f 85 9a 00 00 00    	jne    8022b2 <get_buf+0x1a1>
        {
            if(buffer_heads[i].b_dirt)
  802218:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80221b:	48 98                	cdqe   
  80221d:	48 c1 e0 06          	shl    rax,0x6
  802221:	48 05 93 26 40 00    	add    rax,0x402693
  802227:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80222a:	84 c0                	test   al,al
  80222c:	74 2e                	je     80225c <get_buf+0x14b>
            {
                sync_buf(&buffer_heads[i]);
  80222e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802231:	48 98                	cdqe   
  802233:	48 c1 e0 06          	shl    rax,0x6
  802237:	48 05 80 26 40 00    	add    rax,0x402680
  80223d:	48 89 c7             	mov    rdi,rax
  802240:	e8 1b 01 00 00       	call   802360 <sync_buf>
                wait_on_buf(&buffer_heads[i]);
  802245:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802248:	48 98                	cdqe   
  80224a:	48 c1 e0 06          	shl    rax,0x6
  80224e:	48 05 80 26 40 00    	add    rax,0x402680
  802254:	48 89 c7             	mov    rdi,rax
  802257:	e8 66 00 00 00       	call   8022c2 <wait_on_buf>
            }
            buffer_heads[i].b_count++;
  80225c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80225f:	48 98                	cdqe   
  802261:	48 c1 e0 06          	shl    rax,0x6
  802265:	48 05 94 26 40 00    	add    rax,0x402694
  80226b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80226e:	8d 50 01             	lea    edx,[rax+0x1]
  802271:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802274:	48 98                	cdqe   
  802276:	48 c1 e0 06          	shl    rax,0x6
  80227a:	48 05 94 26 40 00    	add    rax,0x402694
  802280:	88 10                	mov    BYTE PTR [rax],dl
            //给buffer分配一个实际的缓冲区
            buffer_heads[i].b_data=vmalloc();
  802282:	b8 00 00 00 00       	mov    eax,0x0
  802287:	e8 71 ef ff ff       	call   8011fd <vmalloc>
  80228c:	48 89 c2             	mov    rdx,rax
  80228f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802292:	48 98                	cdqe   
  802294:	48 c1 e0 06          	shl    rax,0x6
  802298:	48 05 80 26 40 00    	add    rax,0x402680
  80229e:	48 89 10             	mov    QWORD PTR [rax],rdx
            return &buffer_heads[i];
  8022a1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8022a4:	48 98                	cdqe   
  8022a6:	48 c1 e0 06          	shl    rax,0x6
  8022aa:	48 05 80 26 40 00    	add    rax,0x402680
  8022b0:	eb 0e                	jmp    8022c0 <get_buf+0x1af>
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8022b2:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8022b6:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  8022ba:	0f 8e 3e ff ff ff    	jle    8021fe <get_buf+0xed>
        }
    }
}
  8022c0:	c9                   	leave  
  8022c1:	c3                   	ret    

00000000008022c2 <wait_on_buf>:

void wait_on_buf(buffer_head* bh)
{
  8022c2:	f3 0f 1e fa          	endbr64 
  8022c6:	55                   	push   rbp
  8022c7:	48 89 e5             	mov    rbp,rsp
  8022ca:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    //等待缓冲区解锁
    while (bh->b_lock);
  8022ce:	90                   	nop
  8022cf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8022d3:	0f b6 40 15          	movzx  eax,BYTE PTR [rax+0x15]
  8022d7:	84 c0                	test   al,al
  8022d9:	75 f4                	jne    8022cf <wait_on_buf+0xd>
    
}
  8022db:	90                   	nop
  8022dc:	90                   	nop
  8022dd:	5d                   	pop    rbp
  8022de:	c3                   	ret    

00000000008022df <scan_dev>:

//扫描块设备，读取分区，识别文件系统
int scan_dev(int dev)
{
  8022df:	f3 0f 1e fa          	endbr64 
  8022e3:	55                   	push   rbp
  8022e4:	48 89 e5             	mov    rbp,rsp
  8022e7:	48 83 ec 30          	sub    rsp,0x30
  8022eb:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
//    device *blkdev=get_dev(dev);
//    buffer_head* bh=bread(dev,0);
//    if(!bh)return -1;
    char* buf=vmalloc();
  8022ee:	b8 00 00 00 00       	mov    eax,0x0
  8022f3:	e8 05 ef ff ff       	call   8011fd <vmalloc>
  8022f8:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    int r=request(DISK_MAJOR_MAJOR,DISK_CMD_READ,0,1,buf);
  8022fc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802300:	49 89 c0             	mov    r8,rax
  802303:	b9 01 00 00 00       	mov    ecx,0x1
  802308:	ba 00 00 00 00       	mov    edx,0x0
  80230d:	be 20 00 00 00       	mov    esi,0x20
  802312:	bf 00 00 00 00       	mov    edi,0x0
  802317:	e8 31 65 00 00       	call   80884d <request>
  80231c:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    chk_result(r);
  80231f:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  802322:	89 c7                	mov    edi,eax
  802324:	e8 d8 6b 00 00       	call   808f01 <chk_result>

    dpt_t* dpte=buf+0x1be;
  802329:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80232d:	48 05 be 01 00 00    	add    rax,0x1be
  802333:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(int i=0;i<4;i++)
  802337:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80233e:	eb 13                	jmp    802353 <scan_dev+0x74>
    {
//        blkdev->par[i].type=dpte->type;
        int stlba=dpte->start_lba;
  802340:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802344:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802347:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
//        {
//            printf("err:unrecognised partition fs.\n");
//        }

//        blkdev->par[i].end_sec=dpte->end_lba;
        dpte++;
  80234a:	48 83 45 f8 10       	add    QWORD PTR [rbp-0x8],0x10
    for(int i=0;i<4;i++)
  80234f:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802353:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  802357:	7e e7                	jle    802340 <scan_dev+0x61>
    }
//    brelse(bh);
    return 0;
  802359:	b8 00 00 00 00       	mov    eax,0x0
}
  80235e:	c9                   	leave  
  80235f:	c3                   	ret    

0000000000802360 <sync_buf>:

int sync_buf(buffer_head* bh)
{
  802360:	f3 0f 1e fa          	endbr64 
  802364:	55                   	push   rbp
  802365:	48 89 e5             	mov    rbp,rsp
  802368:	48 83 ec 20          	sub    rsp,0x20
  80236c:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int dev=bh->b_dev;
  802370:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802374:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
  802378:	0f b7 c0             	movzx  eax,ax
  80237b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int block=bh->b_blocknr;
  80237e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802382:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  802386:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //这里需要调用块设备写函数write_block
    return write_block(dev,block,bh->b_data,BLOCK_SIZE);
  802389:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80238d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802390:	8b 75 f8             	mov    esi,DWORD PTR [rbp-0x8]
  802393:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802396:	b9 00 02 00 00       	mov    ecx,0x200
  80239b:	89 c7                	mov    edi,eax
  80239d:	e8 02 00 00 00       	call   8023a4 <write_block>

}
  8023a2:	c9                   	leave  
  8023a3:	c3                   	ret    

00000000008023a4 <write_block>:
//操作块设备函数
int write_block(int dev,int block,char *buf,int len)
{
  8023a4:	f3 0f 1e fa          	endbr64 
  8023a8:	55                   	push   rbp
  8023a9:	48 89 e5             	mov    rbp,rsp
  8023ac:	48 83 ec 30          	sub    rsp,0x30
  8023b0:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8023b3:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8023b6:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  8023ba:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=get_buf(dev,block);
  8023bd:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8023c0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8023c3:	89 d6                	mov    esi,edx
  8023c5:	89 c7                	mov    edi,eax
  8023c7:	e8 45 fd ff ff       	call   802111 <get_buf>
  8023cc:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  8023d0:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8023d3:	ba 00 02 00 00       	mov    edx,0x200
  8023d8:	39 d0                	cmp    eax,edx
  8023da:	0f 4f c2             	cmovg  eax,edx
  8023dd:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(bh->b_data,buf,size);
  8023e0:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8023e3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023e7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8023ea:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  8023ee:	48 89 ce             	mov    rsi,rcx
  8023f1:	48 89 c7             	mov    rdi,rax
  8023f4:	e8 fc 9a 00 00       	call   80bef5 <memcpy>
        len-=BLOCK_SIZE;
  8023f9:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        bh->b_dirt=1;//修改置位
  802400:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802404:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  802408:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80240c:	48 89 c7             	mov    rdi,rax
  80240f:	e8 f2 f9 ff ff       	call   801e06 <brelse>
    }while(len>0);
  802414:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  802418:	7f a3                	jg     8023bd <write_block+0x19>
    return 0;
  80241a:	b8 00 00 00 00       	mov    eax,0x0
}
  80241f:	c9                   	leave  
  802420:	c3                   	ret    

0000000000802421 <read_block>:
int read_block(int dev,int block,char* buf,int len)
{
  802421:	f3 0f 1e fa          	endbr64 
  802425:	55                   	push   rbp
  802426:	48 89 e5             	mov    rbp,rsp
  802429:	48 83 ec 30          	sub    rsp,0x30
  80242d:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802430:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  802433:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  802437:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=bread(dev,block);
  80243a:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80243d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802440:	89 d6                	mov    esi,edx
  802442:	89 c7                	mov    edi,eax
  802444:	e8 20 fa ff ff       	call   801e69 <bread>
  802449:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  80244d:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  802450:	ba 00 02 00 00       	mov    edx,0x200
  802455:	39 d0                	cmp    eax,edx
  802457:	0f 4f c2             	cmovg  eax,edx
  80245a:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(buf,bh->b_data,size);
  80245d:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802460:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802464:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802467:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80246b:	48 89 ce             	mov    rsi,rcx
  80246e:	48 89 c7             	mov    rdi,rax
  802471:	e8 7f 9a 00 00       	call   80bef5 <memcpy>
        len-=BLOCK_SIZE;
  802476:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        brelse(bh);
  80247d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802481:	48 89 c7             	mov    rdi,rax
  802484:	e8 7d f9 ff ff       	call   801e06 <brelse>
    }while(len>0);
  802489:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  80248d:	7f ab                	jg     80243a <read_block+0x19>
    return 0;
  80248f:	b8 00 00 00 00       	mov    eax,0x0
}
  802494:	c9                   	leave  
  802495:	c3                   	ret    

0000000000802496 <init_vfs>:

int init_vfs()
{
  802496:	f3 0f 1e fa          	endbr64 
  80249a:	55                   	push   rbp
  80249b:	48 89 e5             	mov    rbp,rsp
  80249e:	48 83 ec 10          	sub    rsp,0x10
    //扫描块设备
    extern device *dev_tree[];
    extern device devs[];
    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
  8024a2:	48 8b 05 d7 5f c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05fd7]        # 408480 <dev_tree>
  8024a9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(;p;p=p->next)
  8024ad:	eb 40                	jmp    8024ef <init_vfs+0x59>
    {
        if(scan_dev(p-devs)!=0)return -1;
  8024af:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8024b3:	48 2d 80 2e 40 00    	sub    rax,0x402e80
  8024b9:	48 c1 f8 02          	sar    rax,0x2
  8024bd:	48 89 c2             	mov    rdx,rax
  8024c0:	48 b8 19 9c 8f c1 f9 	movabs rax,0x8f9c18f9c18f9c19
  8024c7:	18 9c 8f 
  8024ca:	48 0f af c2          	imul   rax,rdx
  8024ce:	89 c7                	mov    edi,eax
  8024d0:	e8 0a fe ff ff       	call   8022df <scan_dev>
  8024d5:	85 c0                	test   eax,eax
  8024d7:	74 07                	je     8024e0 <init_vfs+0x4a>
  8024d9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8024de:	eb 1b                	jmp    8024fb <init_vfs+0x65>
    for(;p;p=p->next)
  8024e0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8024e4:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  8024eb:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  8024ef:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8024f4:	75 b9                	jne    8024af <init_vfs+0x19>
    }

    return 0;
  8024f6:	b8 00 00 00 00       	mov    eax,0x0
}
  8024fb:	c9                   	leave  
  8024fc:	c3                   	ret    

00000000008024fd <init_devman>:
struct file_operations dev_dir_fops={
    .open=open_dev,.close=close_dev,.ioctl=ioctl_dev,.read=read_dev,.write=write_dev
};
static int devd_fd=-1;
int init_devman()
{
  8024fd:	f3 0f 1e fa          	endbr64 
  802501:	55                   	push   rbp
  802502:	48 89 e5             	mov    rbp,rsp
    //创建几个设备文件
    //console-framebuffer.c
    extern struct process *current;
    devd_fd= sys_open("/dev",O_DIRECTORY);
  802505:	be 00 40 00 00       	mov    esi,0x4000
  80250a:	bf 48 45 81 00       	mov    edi,0x814548
  80250f:	e8 e8 53 00 00       	call   8078fc <sys_open>
  802514:	89 05 5e a4 00 00    	mov    DWORD PTR [rip+0xa45e],eax        # 80c978 <devd_fd>
    comprintf("devman:/dev opened. now setting attrs...\r\n");
  80251a:	bf 50 45 81 00       	mov    edi,0x814550
  80251f:	b8 00 00 00 00       	mov    eax,0x0
  802524:	e8 59 99 00 00       	call   80be82 <comprintf>
    //设置设备的特殊属性，之后创建文件的时候，就会复制这个属性，然后操作就会引导到这里
    *(unsigned long*)current->openf[devd_fd]->dentry->dir_inode->private_index_info=FS_ATTR_DEVICE;
  802529:	48 8b 05 70 30 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc13070]        # 4155a0 <current>
  802530:	8b 15 42 a4 00 00    	mov    edx,DWORD PTR [rip+0xa442]        # 80c978 <devd_fd>
  802536:	48 63 d2             	movsxd rdx,edx
  802539:	48 83 c2 1a          	add    rdx,0x1a
  80253d:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  802542:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802546:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80254a:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80254e:	48 c7 00 04 00 00 00 	mov    QWORD PTR [rax],0x4

}
  802555:	90                   	nop
  802556:	5d                   	pop    rbp
  802557:	c3                   	ret    

0000000000802558 <open_dev>:
//
long open_dev(struct index_node * inode,struct file * filp){
  802558:	f3 0f 1e fa          	endbr64 
  80255c:	55                   	push   rbp
  80255d:	48 89 e5             	mov    rbp,rsp
  802560:	48 83 ec 20          	sub    rsp,0x20
  802564:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802568:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    //查看文件名
    char* name=filp->dentry->name;
  80256c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802570:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802574:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802577:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char* p=name+ strlen(name)-1;
  80257b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80257f:	48 89 c7             	mov    rdi,rax
  802582:	e8 8b 9c 00 00       	call   80c212 <strlen>
  802587:	48 98                	cdqe   
  802589:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  80258d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802591:	48 01 d0             	add    rax,rdx
  802594:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='/'&&p>=name;p--);
  802598:	eb 05                	jmp    80259f <open_dev+0x47>
  80259a:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  80259f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8025a3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8025a6:	3c 2f                	cmp    al,0x2f
  8025a8:	74 0a                	je     8025b4 <open_dev+0x5c>
  8025aa:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8025ae:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  8025b2:	73 e6                	jae    80259a <open_dev+0x42>
    if(p>=name)
  8025b4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8025b8:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  8025bc:	72 0c                	jb     8025ca <open_dev+0x72>
        name=p+1;
  8025be:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8025c2:	48 83 c0 01          	add    rax,0x1
  8025c6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(memcmp(name,"tty",3)==0){
  8025ca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8025ce:	ba 03 00 00 00       	mov    edx,0x3
  8025d3:	be 7b 45 81 00       	mov    esi,0x81457b
  8025d8:	48 89 c7             	mov    rdi,rax
  8025db:	e8 5f 99 00 00       	call   80bf3f <memcmp>
  8025e0:	85 c0                	test   eax,eax
  8025e2:	75 15                	jne    8025f9 <open_dev+0xa1>
        return init_tty(inode,filp);
  8025e4:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  8025e8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8025ec:	48 89 d6             	mov    rsi,rdx
  8025ef:	48 89 c7             	mov    rdi,rax
  8025f2:	e8 7a 93 00 00       	call   80b971 <init_tty>
  8025f7:	eb 31                	jmp    80262a <open_dev+0xd2>
    }else if(strcmp(name,"console")==0){
  8025f9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8025fd:	be 7f 45 81 00       	mov    esi,0x81457f
  802602:	48 89 c7             	mov    rdi,rax
  802605:	e8 89 9b 00 00       	call   80c193 <strcmp>
  80260a:	85 c0                	test   eax,eax
  80260c:	75 15                	jne    802623 <open_dev+0xcb>
        return open_framebuffer(inode,filp);
  80260e:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802612:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802616:	48 89 d6             	mov    rsi,rdx
  802619:	48 89 c7             	mov    rdi,rax
  80261c:	e8 79 4d 00 00       	call   80739a <open_framebuffer>
  802621:	eb 07                	jmp    80262a <open_dev+0xd2>
    }
    return -1;
  802623:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
}
  80262a:	c9                   	leave  
  80262b:	c3                   	ret    

000000000080262c <close_dev>:
long close_dev(struct index_node * inode,struct file * filp){
  80262c:	f3 0f 1e fa          	endbr64 
  802630:	55                   	push   rbp
  802631:	48 89 e5             	mov    rbp,rsp
  802634:	48 83 ec 20          	sub    rsp,0x20
  802638:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80263c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    //查看文件名
    char* name=filp->dentry->name;
  802640:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802644:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802648:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80264b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char* p=name+ strlen(name)-1;
  80264f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802653:	48 89 c7             	mov    rdi,rax
  802656:	e8 b7 9b 00 00       	call   80c212 <strlen>
  80265b:	48 98                	cdqe   
  80265d:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  802661:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802665:	48 01 d0             	add    rax,rdx
  802668:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='/'&&p>=name;p--);
  80266c:	eb 05                	jmp    802673 <close_dev+0x47>
  80266e:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  802673:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802677:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80267a:	3c 2f                	cmp    al,0x2f
  80267c:	74 0a                	je     802688 <close_dev+0x5c>
  80267e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802682:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802686:	73 e6                	jae    80266e <close_dev+0x42>
    if(p>=name)
  802688:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80268c:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802690:	72 0c                	jb     80269e <close_dev+0x72>
        name=p+1;
  802692:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802696:	48 83 c0 01          	add    rax,0x1
  80269a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(memcmp(name,"tty",3)==0){
  80269e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8026a2:	ba 03 00 00 00       	mov    edx,0x3
  8026a7:	be 7b 45 81 00       	mov    esi,0x81457b
  8026ac:	48 89 c7             	mov    rdi,rax
  8026af:	e8 8b 98 00 00       	call   80bf3f <memcmp>
  8026b4:	85 c0                	test   eax,eax
  8026b6:	75 15                	jne    8026cd <close_dev+0xa1>
        return close_tty(inode,filp);
  8026b8:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  8026bc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8026c0:	48 89 d6             	mov    rsi,rdx
  8026c3:	48 89 c7             	mov    rdi,rax
  8026c6:	e8 2b 92 00 00       	call   80b8f6 <close_tty>
  8026cb:	eb 31                	jmp    8026fe <close_dev+0xd2>
    }else if(strcmp(name,"console")==0){
  8026cd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8026d1:	be 7f 45 81 00       	mov    esi,0x81457f
  8026d6:	48 89 c7             	mov    rdi,rax
  8026d9:	e8 b5 9a 00 00       	call   80c193 <strcmp>
  8026de:	85 c0                	test   eax,eax
  8026e0:	75 15                	jne    8026f7 <close_dev+0xcb>
        return close_framebuffer(inode,filp);
  8026e2:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  8026e6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8026ea:	48 89 d6             	mov    rsi,rdx
  8026ed:	48 89 c7             	mov    rdi,rax
  8026f0:	e8 d0 4c 00 00       	call   8073c5 <close_framebuffer>
  8026f5:	eb 07                	jmp    8026fe <close_dev+0xd2>
    }
    return -1;
  8026f7:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff

}
  8026fe:	c9                   	leave  
  8026ff:	c3                   	ret    

0000000000802700 <read_dev>:
long read_dev(struct file * filp,char * buf,unsigned long count,long * position){
  802700:	f3 0f 1e fa          	endbr64 
  802704:	55                   	push   rbp
  802705:	48 89 e5             	mov    rbp,rsp
  802708:	48 83 ec 30          	sub    rsp,0x30
  80270c:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802710:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  802714:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  802718:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
    //查看文件名
    char* name=filp->dentry->name;
  80271c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802720:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802724:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802727:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char* p=name+ strlen(name)-1;
  80272b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80272f:	48 89 c7             	mov    rdi,rax
  802732:	e8 db 9a 00 00       	call   80c212 <strlen>
  802737:	48 98                	cdqe   
  802739:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  80273d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802741:	48 01 d0             	add    rax,rdx
  802744:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='/'&&p>=name;p--);
  802748:	eb 05                	jmp    80274f <read_dev+0x4f>
  80274a:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  80274f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802753:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802756:	3c 2f                	cmp    al,0x2f
  802758:	74 0a                	je     802764 <read_dev+0x64>
  80275a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80275e:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802762:	73 e6                	jae    80274a <read_dev+0x4a>
    if(p>=name)
  802764:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802768:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  80276c:	72 0c                	jb     80277a <read_dev+0x7a>
        name=p+1;
  80276e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802772:	48 83 c0 01          	add    rax,0x1
  802776:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(memcmp(name,"tty",3)==0){
  80277a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80277e:	ba 03 00 00 00       	mov    edx,0x3
  802783:	be 7b 45 81 00       	mov    esi,0x81457b
  802788:	48 89 c7             	mov    rdi,rax
  80278b:	e8 af 97 00 00       	call   80bf3f <memcmp>
  802790:	85 c0                	test   eax,eax
  802792:	75 1a                	jne    8027ae <read_dev+0xae>
        return read_tty(filp,buf,count,position);
  802794:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802798:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80279c:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  8027a0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8027a4:	48 89 c7             	mov    rdi,rax
  8027a7:	e8 b3 92 00 00       	call   80ba5f <read_tty>
  8027ac:	eb 36                	jmp    8027e4 <read_dev+0xe4>
    }else if(strcmp(name,"console")==0){
  8027ae:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8027b2:	be 7f 45 81 00       	mov    esi,0x81457f
  8027b7:	48 89 c7             	mov    rdi,rax
  8027ba:	e8 d4 99 00 00       	call   80c193 <strcmp>
  8027bf:	85 c0                	test   eax,eax
  8027c1:	75 1a                	jne    8027dd <read_dev+0xdd>
        return read_framebuffer(filp,buf,count,position);
  8027c3:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  8027c7:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8027cb:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  8027cf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8027d3:	48 89 c7             	mov    rdi,rax
  8027d6:	e8 fd 4b 00 00       	call   8073d8 <read_framebuffer>
  8027db:	eb 07                	jmp    8027e4 <read_dev+0xe4>
    }
    return -1;
  8027dd:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff

}
  8027e4:	c9                   	leave  
  8027e5:	c3                   	ret    

00000000008027e6 <write_dev>:
long write_dev(struct file * filp,char * buf,unsigned long count,long * position){
  8027e6:	f3 0f 1e fa          	endbr64 
  8027ea:	55                   	push   rbp
  8027eb:	48 89 e5             	mov    rbp,rsp
  8027ee:	48 83 ec 30          	sub    rsp,0x30
  8027f2:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8027f6:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8027fa:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  8027fe:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
    //查看文件名
    char* name=filp->dentry->name;
  802802:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802806:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80280a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80280d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char* p=name+ strlen(name)-1;
  802811:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802815:	48 89 c7             	mov    rdi,rax
  802818:	e8 f5 99 00 00       	call   80c212 <strlen>
  80281d:	48 98                	cdqe   
  80281f:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  802823:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802827:	48 01 d0             	add    rax,rdx
  80282a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='/'&&p>=name;p--);
  80282e:	eb 05                	jmp    802835 <write_dev+0x4f>
  802830:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  802835:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802839:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80283c:	3c 2f                	cmp    al,0x2f
  80283e:	74 0a                	je     80284a <write_dev+0x64>
  802840:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802844:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802848:	73 e6                	jae    802830 <write_dev+0x4a>
    if(p>=name)
  80284a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80284e:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802852:	72 0c                	jb     802860 <write_dev+0x7a>
        name=p+1;
  802854:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802858:	48 83 c0 01          	add    rax,0x1
  80285c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(memcmp(name,"tty",3)==0){
  802860:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802864:	ba 03 00 00 00       	mov    edx,0x3
  802869:	be 7b 45 81 00       	mov    esi,0x81457b
  80286e:	48 89 c7             	mov    rdi,rax
  802871:	e8 c9 96 00 00       	call   80bf3f <memcmp>
  802876:	85 c0                	test   eax,eax
  802878:	75 1a                	jne    802894 <write_dev+0xae>
        return write_tty(filp,buf,count,position);
  80287a:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  80287e:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802882:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  802886:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80288a:	48 89 c7             	mov    rdi,rax
  80288d:	e8 66 92 00 00       	call   80baf8 <write_tty>
  802892:	eb 36                	jmp    8028ca <write_dev+0xe4>
    }else if(strcmp(name,"console")==0){
  802894:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802898:	be 7f 45 81 00       	mov    esi,0x81457f
  80289d:	48 89 c7             	mov    rdi,rax
  8028a0:	e8 ee 98 00 00       	call   80c193 <strcmp>
  8028a5:	85 c0                	test   eax,eax
  8028a7:	75 1a                	jne    8028c3 <write_dev+0xdd>
        return write_framebuffer(filp,buf,count,position);
  8028a9:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  8028ad:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8028b1:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  8028b5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8028b9:	48 89 c7             	mov    rdi,rax
  8028bc:	e8 32 4b 00 00       	call   8073f3 <write_framebuffer>
  8028c1:	eb 07                	jmp    8028ca <write_dev+0xe4>
    }
    return -1;
  8028c3:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff

}
  8028ca:	c9                   	leave  
  8028cb:	c3                   	ret    

00000000008028cc <ioctl_dev>:
long ioctl_dev(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg){
  8028cc:	f3 0f 1e fa          	endbr64 
  8028d0:	55                   	push   rbp
  8028d1:	48 89 e5             	mov    rbp,rsp
  8028d4:	48 83 ec 30          	sub    rsp,0x30
  8028d8:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8028dc:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8028e0:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  8028e4:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
    //查看文件名
    char* name=filp->dentry->name;
  8028e8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8028ec:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8028f0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8028f3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char* p=name+ strlen(name)-1;
  8028f7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8028fb:	48 89 c7             	mov    rdi,rax
  8028fe:	e8 0f 99 00 00       	call   80c212 <strlen>
  802903:	48 98                	cdqe   
  802905:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  802909:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80290d:	48 01 d0             	add    rax,rdx
  802910:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='/'&&p>=name;p--);
  802914:	eb 05                	jmp    80291b <ioctl_dev+0x4f>
  802916:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  80291b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80291f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802922:	3c 2f                	cmp    al,0x2f
  802924:	74 0a                	je     802930 <ioctl_dev+0x64>
  802926:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80292a:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  80292e:	73 e6                	jae    802916 <ioctl_dev+0x4a>
    if(p>=name)
  802930:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802934:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802938:	72 0c                	jb     802946 <ioctl_dev+0x7a>
        name=p+1;
  80293a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80293e:	48 83 c0 01          	add    rax,0x1
  802942:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(memcmp(name,"tty",3)==0){
  802946:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80294a:	ba 03 00 00 00       	mov    edx,0x3
  80294f:	be 7b 45 81 00       	mov    esi,0x81457b
  802954:	48 89 c7             	mov    rdi,rax
  802957:	e8 e3 95 00 00       	call   80bf3f <memcmp>
  80295c:	85 c0                	test   eax,eax
  80295e:	75 1a                	jne    80297a <ioctl_dev+0xae>
        return tty_do_req(inode,filp,cmd,arg);
  802960:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802964:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802968:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  80296c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802970:	48 89 c7             	mov    rdi,rax
  802973:	e8 48 92 00 00       	call   80bbc0 <tty_do_req>
  802978:	eb 36                	jmp    8029b0 <ioctl_dev+0xe4>
    }else if(strcmp(name,"console")==0){
  80297a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80297e:	be 7f 45 81 00       	mov    esi,0x81457f
  802983:	48 89 c7             	mov    rdi,rax
  802986:	e8 08 98 00 00       	call   80c193 <strcmp>
  80298b:	85 c0                	test   eax,eax
  80298d:	75 1a                	jne    8029a9 <ioctl_dev+0xdd>
        return ioctl_framebuffer(inode,filp,cmd,arg);
  80298f:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802993:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802997:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  80299b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80299f:	48 89 c7             	mov    rdi,rax
  8029a2:	e8 18 4b 00 00       	call   8074bf <ioctl_framebuffer>
  8029a7:	eb 07                	jmp    8029b0 <ioctl_dev+0xe4>
    }
    return -1;
  8029a9:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff

}
  8029b0:	c9                   	leave  
  8029b1:	c3                   	ret    

00000000008029b2 <load_driver>:
int load_driver(char *path)
{
  8029b2:	f3 0f 1e fa          	endbr64 
  8029b6:	55                   	push   rbp
  8029b7:	48 89 e5             	mov    rbp,rsp
  8029ba:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    
}
  8029be:	90                   	nop
  8029bf:	5d                   	pop    rbp
  8029c0:	c3                   	ret    

00000000008029c1 <reg_device>:

int reg_device(device* dev)
{
  8029c1:	f3 0f 1e fa          	endbr64 
  8029c5:	55                   	push   rbp
  8029c6:	48 89 e5             	mov    rbp,rsp
  8029c9:	53                   	push   rbx
  8029ca:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //TODO:查重

    //放入数组
    int i=0;
  8029ce:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<MAX_DEVICES;i++)
  8029d5:	e9 42 01 00 00       	jmp    802b1c <reg_device+0x15b>
    {
        if(devs[i].flag==DEV_FLAG_EMPTY)
  8029da:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8029dd:	48 63 d0             	movsxd rdx,eax
  8029e0:	48 89 d0             	mov    rax,rdx
  8029e3:	48 c1 e0 02          	shl    rax,0x2
  8029e7:	48 01 d0             	add    rax,rdx
  8029ea:	48 c1 e0 02          	shl    rax,0x2
  8029ee:	48 01 d0             	add    rax,rdx
  8029f1:	48 c1 e0 03          	shl    rax,0x3
  8029f5:	48 05 90 2e 40 00    	add    rax,0x402e90
  8029fb:	8b 00                	mov    eax,DWORD PTR [rax]
  8029fd:	85 c0                	test   eax,eax
  8029ff:	0f 85 13 01 00 00    	jne    802b18 <reg_device+0x157>
        {
            devs[i]=*dev;
  802a05:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802a08:	48 63 d0             	movsxd rdx,eax
  802a0b:	48 89 d0             	mov    rax,rdx
  802a0e:	48 c1 e0 02          	shl    rax,0x2
  802a12:	48 01 d0             	add    rax,rdx
  802a15:	48 c1 e0 02          	shl    rax,0x2
  802a19:	48 01 d0             	add    rax,rdx
  802a1c:	48 c1 e0 03          	shl    rax,0x3
  802a20:	48 8d 90 80 2e 40 00 	lea    rdx,[rax+0x402e80]
  802a27:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802a2b:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802a2e:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802a32:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802a35:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802a39:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802a3d:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802a41:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802a45:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802a49:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802a4d:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802a51:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802a55:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802a59:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802a5d:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802a61:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802a65:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802a69:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802a6d:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802a71:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802a75:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802a79:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802a7d:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802a81:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802a85:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802a89:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802a8d:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802a91:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802a95:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802a99:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802a9d:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802aa1:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802aa5:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802aa9:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802ab0:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802ab7:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802abe:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  802ac5:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802acc:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  802ad3:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802ada:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  802ae1:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
  802ae8:	48 89 82 a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rax
            devs[i].flag=DEV_FLAG_USED;
  802aef:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802af2:	48 63 d0             	movsxd rdx,eax
  802af5:	48 89 d0             	mov    rax,rdx
  802af8:	48 c1 e0 02          	shl    rax,0x2
  802afc:	48 01 d0             	add    rax,rdx
  802aff:	48 c1 e0 02          	shl    rax,0x2
  802b03:	48 01 d0             	add    rax,rdx
  802b06:	48 c1 e0 03          	shl    rax,0x3
  802b0a:	48 05 90 2e 40 00    	add    rax,0x402e90
  802b10:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            break;
  802b16:	eb 0e                	jmp    802b26 <reg_device+0x165>
    for(;i<MAX_DEVICES;i++)
  802b18:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802b1c:	83 7d f4 3f          	cmp    DWORD PTR [rbp-0xc],0x3f
  802b20:	0f 8e b4 fe ff ff    	jle    8029da <reg_device+0x19>
        }
    }
    if(i==MAX_DEVICES)
  802b26:	83 7d f4 40          	cmp    DWORD PTR [rbp-0xc],0x40
  802b2a:	75 0a                	jne    802b36 <reg_device+0x175>
        return -1;
  802b2c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802b31:	e9 6d 01 00 00       	jmp    802ca3 <reg_device+0x2e2>
    //添加到链表
    device* p=NULL,*neo=&devs[i],**pp;
  802b36:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  802b3d:	00 
  802b3e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802b41:	48 63 d0             	movsxd rdx,eax
  802b44:	48 89 d0             	mov    rax,rdx
  802b47:	48 c1 e0 02          	shl    rax,0x2
  802b4b:	48 01 d0             	add    rax,rdx
  802b4e:	48 c1 e0 02          	shl    rax,0x2
  802b52:	48 01 d0             	add    rax,rdx
  802b55:	48 c1 e0 03          	shl    rax,0x3
  802b59:	48 05 80 2e 40 00    	add    rax,0x402e80
  802b5f:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    switch (dev->type)
  802b63:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802b67:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802b6a:	83 f8 03             	cmp    eax,0x3
  802b6d:	74 3b                	je     802baa <reg_device+0x1e9>
  802b6f:	83 f8 03             	cmp    eax,0x3
  802b72:	7f 4b                	jg     802bbf <reg_device+0x1fe>
  802b74:	83 f8 01             	cmp    eax,0x1
  802b77:	74 07                	je     802b80 <reg_device+0x1bf>
  802b79:	83 f8 02             	cmp    eax,0x2
  802b7c:	74 17                	je     802b95 <reg_device+0x1d4>
  802b7e:	eb 3f                	jmp    802bbf <reg_device+0x1fe>
    {
    case DEV_TYPE_BLKDEV:
        p=dev_tree[DEVTREE_BLKDEVI];pp=&dev_tree[DEVTREE_BLKDEVI];
  802b80:	48 8b 05 f9 58 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc058f9]        # 408480 <dev_tree>
  802b87:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802b8b:	48 c7 45 e0 80 84 40 	mov    QWORD PTR [rbp-0x20],0x408480
  802b92:	00 
        break;
  802b93:	eb 34                	jmp    802bc9 <reg_device+0x208>
    
    case DEV_TYPE_CHRDEV:
        p=dev_tree[DEVTREE_CHRDEVI];pp=&dev_tree[DEVTREE_CHRDEVI];
  802b95:	48 8b 05 ec 58 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc058ec]        # 408488 <dev_tree+0x8>
  802b9c:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802ba0:	48 c7 45 e0 88 84 40 	mov    QWORD PTR [rbp-0x20],0x408488
  802ba7:	00 
        break;
  802ba8:	eb 1f                	jmp    802bc9 <reg_device+0x208>
        
    case DEV_TYPE_OTHERS:
        p=dev_tree[DEVTREE_OTHERDEVI];pp=&dev_tree[DEVTREE_OTHERDEVI];
  802baa:	48 8b 05 df 58 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc058df]        # 408490 <dev_tree+0x10>
  802bb1:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802bb5:	48 c7 45 e0 90 84 40 	mov    QWORD PTR [rbp-0x20],0x408490
  802bbc:	00 
        break;
  802bbd:	eb 0a                	jmp    802bc9 <reg_device+0x208>
    default:return -1;//不可能有其他情况
  802bbf:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802bc4:	e9 da 00 00 00       	jmp    802ca3 <reg_device+0x2e2>
    }
    if(!p){
  802bc9:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  802bce:	75 2b                	jne    802bfb <reg_device+0x23a>
        *pp=neo;
  802bd0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802bd4:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802bd8:	48 89 10             	mov    QWORD PTR [rax],rdx
        neo->prev=NULL;
  802bdb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802bdf:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x0
  802be6:	00 00 00 00 
  802bea:	eb 3d                	jmp    802c29 <reg_device+0x268>
    }
    else{
        for(;p->next;p=p->next);
  802bec:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802bf0:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802bf7:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802bfb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802bff:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802c06:	48 85 c0             	test   rax,rax
  802c09:	75 e1                	jne    802bec <reg_device+0x22b>
        p->next=neo;
  802c0b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802c0f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802c13:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
        neo->prev=p;
  802c1a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c1e:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  802c22:	48 89 90 98 00 00 00 	mov    QWORD PTR [rax+0x98],rdx
    }
    neo->next=NULL;
  802c29:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c2d:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x0
  802c34:	00 00 00 00 
    //设置相应的请求函数
    switch (neo->stype)
  802c38:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c3c:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  802c3f:	83 f8 04             	cmp    eax,0x4
  802c42:	74 3b                	je     802c7f <reg_device+0x2be>
  802c44:	83 f8 04             	cmp    eax,0x4
  802c47:	7f 56                	jg     802c9f <reg_device+0x2de>
  802c49:	83 f8 03             	cmp    eax,0x3
  802c4c:	74 21                	je     802c6f <reg_device+0x2ae>
  802c4e:	83 f8 03             	cmp    eax,0x3
  802c51:	7f 4c                	jg     802c9f <reg_device+0x2de>
  802c53:	83 f8 01             	cmp    eax,0x1
  802c56:	74 07                	je     802c5f <reg_device+0x29e>
  802c58:	83 f8 02             	cmp    eax,0x2
  802c5b:	74 32                	je     802c8f <reg_device+0x2ce>
        break;
    case DEV_STYPE_TTY:
        neo->operi=OPERATIONS_TTY;
        break;
    default:
        break;
  802c5d:	eb 40                	jmp    802c9f <reg_device+0x2de>
        neo->operi=OPERATIONS_HD;
  802c5f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c63:	c7 80 a0 00 00 00 00 	mov    DWORD PTR [rax+0xa0],0x0
  802c6a:	00 00 00 
        break;
  802c6d:	eb 31                	jmp    802ca0 <reg_device+0x2df>
        neo->operi=OPERATIONS_MOUSE;
  802c6f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c73:	c7 80 a0 00 00 00 02 	mov    DWORD PTR [rax+0xa0],0x2
  802c7a:	00 00 00 
        break;
  802c7d:	eb 21                	jmp    802ca0 <reg_device+0x2df>
        neo->operi=OPERATIONS_KEYBOARD;
  802c7f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c83:	c7 80 a0 00 00 00 03 	mov    DWORD PTR [rax+0xa0],0x3
  802c8a:	00 00 00 
        break;
  802c8d:	eb 11                	jmp    802ca0 <reg_device+0x2df>
        neo->operi=OPERATIONS_TTY;
  802c8f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c93:	c7 80 a0 00 00 00 01 	mov    DWORD PTR [rax+0xa0],0x1
  802c9a:	00 00 00 
        break;
  802c9d:	eb 01                	jmp    802ca0 <reg_device+0x2df>
        break;
  802c9f:	90                   	nop
    }
    return i;
  802ca0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  802ca3:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802ca7:	c9                   	leave  
  802ca8:	c3                   	ret    

0000000000802ca9 <reg_driver>:


int reg_driver(driver *drv)
{
  802ca9:	f3 0f 1e fa          	endbr64 
  802cad:	55                   	push   rbp
  802cae:	48 89 e5             	mov    rbp,rsp
  802cb1:	53                   	push   rbx
  802cb2:	48 89 7d e0          	mov    QWORD PTR [rbp-0x20],rdi
    for(int i=0;i<MAX_DRIVERS;i++)
  802cb6:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  802cbd:	e9 22 01 00 00       	jmp    802de4 <reg_driver+0x13b>
    {
        if(drvs[i].flag==DRV_FLAG_EMPTY)
  802cc2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802cc5:	48 63 d0             	movsxd rdx,eax
  802cc8:	48 89 d0             	mov    rax,rdx
  802ccb:	48 c1 e0 02          	shl    rax,0x2
  802ccf:	48 01 d0             	add    rax,rdx
  802cd2:	48 c1 e0 05          	shl    rax,0x5
  802cd6:	48 05 80 58 40 00    	add    rax,0x405880
  802cdc:	8b 00                	mov    eax,DWORD PTR [rax]
  802cde:	85 c0                	test   eax,eax
  802ce0:	0f 85 fa 00 00 00    	jne    802de0 <reg_driver+0x137>
        {
            drvs[i]=*drv;
  802ce6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802ce9:	48 63 d0             	movsxd rdx,eax
  802cec:	48 89 d0             	mov    rax,rdx
  802cef:	48 c1 e0 02          	shl    rax,0x2
  802cf3:	48 01 d0             	add    rax,rdx
  802cf6:	48 c1 e0 05          	shl    rax,0x5
  802cfa:	48 8d 90 80 58 40 00 	lea    rdx,[rax+0x405880]
  802d01:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802d05:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802d08:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802d0c:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802d0f:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802d13:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802d17:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802d1b:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802d1f:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802d23:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802d27:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802d2b:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802d2f:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802d33:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802d37:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802d3b:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802d3f:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802d43:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802d47:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802d4b:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802d4f:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802d53:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802d57:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802d5b:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802d5f:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802d63:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802d67:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802d6b:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802d6f:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802d73:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802d77:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802d7b:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802d7f:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802d83:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802d8a:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802d91:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802d98:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  802d9f:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802da6:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  802dad:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802db4:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
            drvs[i].flag=DRV_FLAG_USED;
  802dbb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802dbe:	48 63 d0             	movsxd rdx,eax
  802dc1:	48 89 d0             	mov    rax,rdx
  802dc4:	48 c1 e0 02          	shl    rax,0x2
  802dc8:	48 01 d0             	add    rax,rdx
  802dcb:	48 c1 e0 05          	shl    rax,0x5
  802dcf:	48 05 80 58 40 00    	add    rax,0x405880
  802dd5:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            return i;
  802ddb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802dde:	eb 13                	jmp    802df3 <reg_driver+0x14a>
    for(int i=0;i<MAX_DRIVERS;i++)
  802de0:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802de4:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  802de8:	0f 8e d4 fe ff ff    	jle    802cc2 <reg_driver+0x19>
        }
    }
    return -1;
  802dee:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802df3:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802df7:	c9                   	leave  
  802df8:	c3                   	ret    

0000000000802df9 <sys_find_dev>:

int sys_find_dev(char *name)
{
  802df9:	f3 0f 1e fa          	endbr64 
  802dfd:	55                   	push   rbp
  802dfe:	48 89 e5             	mov    rbp,rsp
  802e01:	48 83 ec 20          	sub    rsp,0x20
  802e05:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_DEVICES;i++)
  802e09:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802e10:	eb 6c                	jmp    802e7e <sys_find_dev+0x85>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802e12:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802e15:	48 63 d0             	movsxd rdx,eax
  802e18:	48 89 d0             	mov    rax,rdx
  802e1b:	48 c1 e0 02          	shl    rax,0x2
  802e1f:	48 01 d0             	add    rax,rdx
  802e22:	48 c1 e0 02          	shl    rax,0x2
  802e26:	48 01 d0             	add    rax,rdx
  802e29:	48 c1 e0 03          	shl    rax,0x3
  802e2d:	48 05 90 2e 40 00    	add    rax,0x402e90
  802e33:	8b 00                	mov    eax,DWORD PTR [rax]
  802e35:	85 c0                	test   eax,eax
  802e37:	74 41                	je     802e7a <sys_find_dev+0x81>
  802e39:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802e3c:	48 63 d0             	movsxd rdx,eax
  802e3f:	48 89 d0             	mov    rax,rdx
  802e42:	48 c1 e0 02          	shl    rax,0x2
  802e46:	48 01 d0             	add    rax,rdx
  802e49:	48 c1 e0 02          	shl    rax,0x2
  802e4d:	48 01 d0             	add    rax,rdx
  802e50:	48 c1 e0 03          	shl    rax,0x3
  802e54:	48 83 c0 10          	add    rax,0x10
  802e58:	48 05 80 2e 40 00    	add    rax,0x402e80
  802e5e:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802e62:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802e66:	48 89 d6             	mov    rsi,rdx
  802e69:	48 89 c7             	mov    rdi,rax
  802e6c:	e8 22 93 00 00       	call   80c193 <strcmp>
  802e71:	85 c0                	test   eax,eax
  802e73:	75 05                	jne    802e7a <sys_find_dev+0x81>
            return i;
  802e75:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802e78:	eb 0f                	jmp    802e89 <sys_find_dev+0x90>
    for(int i=0;i<MAX_DEVICES;i++)
  802e7a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802e7e:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802e82:	7e 8e                	jle    802e12 <sys_find_dev+0x19>
    }
    return -1;
  802e84:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802e89:	c9                   	leave  
  802e8a:	c3                   	ret    

0000000000802e8b <sys_operate_dev>:

int sys_operate_dev(char *name,int func,driver_args* args)
{
  802e8b:	f3 0f 1e fa          	endbr64 
  802e8f:	55                   	push   rbp
  802e90:	48 89 e5             	mov    rbp,rsp
  802e93:	48 83 ec 30          	sub    rsp,0x30
  802e97:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802e9b:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  802e9e:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    int i=0;
  802ea2:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;i<MAX_DEVICES;i++)
  802ea9:	eb 67                	jmp    802f12 <sys_operate_dev+0x87>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802eab:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802eae:	48 63 d0             	movsxd rdx,eax
  802eb1:	48 89 d0             	mov    rax,rdx
  802eb4:	48 c1 e0 02          	shl    rax,0x2
  802eb8:	48 01 d0             	add    rax,rdx
  802ebb:	48 c1 e0 02          	shl    rax,0x2
  802ebf:	48 01 d0             	add    rax,rdx
  802ec2:	48 c1 e0 03          	shl    rax,0x3
  802ec6:	48 05 90 2e 40 00    	add    rax,0x402e90
  802ecc:	8b 00                	mov    eax,DWORD PTR [rax]
  802ece:	85 c0                	test   eax,eax
  802ed0:	74 3c                	je     802f0e <sys_operate_dev+0x83>
  802ed2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802ed5:	48 63 d0             	movsxd rdx,eax
  802ed8:	48 89 d0             	mov    rax,rdx
  802edb:	48 c1 e0 02          	shl    rax,0x2
  802edf:	48 01 d0             	add    rax,rdx
  802ee2:	48 c1 e0 02          	shl    rax,0x2
  802ee6:	48 01 d0             	add    rax,rdx
  802ee9:	48 c1 e0 03          	shl    rax,0x3
  802eed:	48 83 c0 10          	add    rax,0x10
  802ef1:	48 05 80 2e 40 00    	add    rax,0x402e80
  802ef7:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802efb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802eff:	48 89 d6             	mov    rsi,rdx
  802f02:	48 89 c7             	mov    rdi,rax
  802f05:	e8 89 92 00 00       	call   80c193 <strcmp>
  802f0a:	85 c0                	test   eax,eax
  802f0c:	74 0c                	je     802f1a <sys_operate_dev+0x8f>
    for(;i<MAX_DEVICES;i++)
  802f0e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802f12:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802f16:	7e 93                	jle    802eab <sys_operate_dev+0x20>
  802f18:	eb 01                	jmp    802f1b <sys_operate_dev+0x90>
            break;
  802f1a:	90                   	nop
    }
    if(i==MAX_DEVICES)return -1;
  802f1b:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  802f1f:	75 0a                	jne    802f2b <sys_operate_dev+0xa0>
  802f21:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802f26:	e9 9c 02 00 00       	jmp    8031c7 <sys_operate_dev+0x33c>
    switch (func) {
  802f2b:	83 7d e4 0b          	cmp    DWORD PTR [rbp-0x1c],0xb
  802f2f:	0f 87 8d 02 00 00    	ja     8031c2 <sys_operate_dev+0x337>
  802f35:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  802f38:	48 8b 04 c5 88 45 81 	mov    rax,QWORD PTR [rax*8+0x814588]
  802f3f:	00 
  802f40:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return devs[i].drv->open(args);
  802f43:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f46:	48 63 d0             	movsxd rdx,eax
  802f49:	48 89 d0             	mov    rax,rdx
  802f4c:	48 c1 e0 02          	shl    rax,0x2
  802f50:	48 01 d0             	add    rax,rdx
  802f53:	48 c1 e0 02          	shl    rax,0x2
  802f57:	48 01 d0             	add    rax,rdx
  802f5a:	48 c1 e0 03          	shl    rax,0x3
  802f5e:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802f64:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802f67:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  802f6b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802f6f:	48 89 c7             	mov    rdi,rax
  802f72:	ff d2                	call   rdx
  802f74:	e9 4e 02 00 00       	jmp    8031c7 <sys_operate_dev+0x33c>
        case DRVF_CLOSE:return devs[i].drv->close(args);
  802f79:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f7c:	48 63 d0             	movsxd rdx,eax
  802f7f:	48 89 d0             	mov    rax,rdx
  802f82:	48 c1 e0 02          	shl    rax,0x2
  802f86:	48 01 d0             	add    rax,rdx
  802f89:	48 c1 e0 02          	shl    rax,0x2
  802f8d:	48 01 d0             	add    rax,rdx
  802f90:	48 c1 e0 03          	shl    rax,0x3
  802f94:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802f9a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802f9d:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  802fa1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802fa5:	48 89 c7             	mov    rdi,rax
  802fa8:	ff d2                	call   rdx
  802faa:	e9 18 02 00 00       	jmp    8031c7 <sys_operate_dev+0x33c>
        case DRVF_READ :return devs[i].drv->read(args);
  802faf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802fb2:	48 63 d0             	movsxd rdx,eax
  802fb5:	48 89 d0             	mov    rax,rdx
  802fb8:	48 c1 e0 02          	shl    rax,0x2
  802fbc:	48 01 d0             	add    rax,rdx
  802fbf:	48 c1 e0 02          	shl    rax,0x2
  802fc3:	48 01 d0             	add    rax,rdx
  802fc6:	48 c1 e0 03          	shl    rax,0x3
  802fca:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802fd0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802fd3:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  802fd7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802fdb:	48 89 c7             	mov    rdi,rax
  802fde:	ff d2                	call   rdx
  802fe0:	e9 e2 01 00 00       	jmp    8031c7 <sys_operate_dev+0x33c>
        case DRVF_WRITE:return devs[i].drv->write(args);
  802fe5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802fe8:	48 63 d0             	movsxd rdx,eax
  802feb:	48 89 d0             	mov    rax,rdx
  802fee:	48 c1 e0 02          	shl    rax,0x2
  802ff2:	48 01 d0             	add    rax,rdx
  802ff5:	48 c1 e0 02          	shl    rax,0x2
  802ff9:	48 01 d0             	add    rax,rdx
  802ffc:	48 c1 e0 03          	shl    rax,0x3
  803000:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803006:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803009:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  80300d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803011:	48 89 c7             	mov    rdi,rax
  803014:	ff d2                	call   rdx
  803016:	e9 ac 01 00 00       	jmp    8031c7 <sys_operate_dev+0x33c>
        case DRVF_CHK  :return devs[i].drv->check(args);
  80301b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80301e:	48 63 d0             	movsxd rdx,eax
  803021:	48 89 d0             	mov    rax,rdx
  803024:	48 c1 e0 02          	shl    rax,0x2
  803028:	48 01 d0             	add    rax,rdx
  80302b:	48 c1 e0 02          	shl    rax,0x2
  80302f:	48 01 d0             	add    rax,rdx
  803032:	48 c1 e0 03          	shl    rax,0x3
  803036:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80303c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80303f:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  803043:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803047:	48 89 c7             	mov    rdi,rax
  80304a:	ff d2                	call   rdx
  80304c:	e9 76 01 00 00       	jmp    8031c7 <sys_operate_dev+0x33c>
        case DRVF_RSVD :return devs[i].drv->reserved(args);
  803051:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803054:	48 63 d0             	movsxd rdx,eax
  803057:	48 89 d0             	mov    rax,rdx
  80305a:	48 c1 e0 02          	shl    rax,0x2
  80305e:	48 01 d0             	add    rax,rdx
  803061:	48 c1 e0 02          	shl    rax,0x2
  803065:	48 01 d0             	add    rax,rdx
  803068:	48 c1 e0 03          	shl    rax,0x3
  80306c:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803072:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803075:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
  803079:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80307d:	48 89 c7             	mov    rdi,rax
  803080:	ff d2                	call   rdx
  803082:	e9 40 01 00 00       	jmp    8031c7 <sys_operate_dev+0x33c>
        case DRVF_INT  :return devs[i].drv->inthandler(args);
  803087:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80308a:	48 63 d0             	movsxd rdx,eax
  80308d:	48 89 d0             	mov    rax,rdx
  803090:	48 c1 e0 02          	shl    rax,0x2
  803094:	48 01 d0             	add    rax,rdx
  803097:	48 c1 e0 02          	shl    rax,0x2
  80309b:	48 01 d0             	add    rax,rdx
  80309e:	48 c1 e0 03          	shl    rax,0x3
  8030a2:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8030a8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8030ab:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
  8030af:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8030b3:	48 89 c7             	mov    rdi,rax
  8030b6:	ff d2                	call   rdx
  8030b8:	e9 0a 01 00 00       	jmp    8031c7 <sys_operate_dev+0x33c>
        case DRVF_FIND :return devs[i].drv->find(args);
  8030bd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8030c0:	48 63 d0             	movsxd rdx,eax
  8030c3:	48 89 d0             	mov    rax,rdx
  8030c6:	48 c1 e0 02          	shl    rax,0x2
  8030ca:	48 01 d0             	add    rax,rdx
  8030cd:	48 c1 e0 02          	shl    rax,0x2
  8030d1:	48 01 d0             	add    rax,rdx
  8030d4:	48 c1 e0 03          	shl    rax,0x3
  8030d8:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8030de:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8030e1:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  8030e5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8030e9:	48 89 c7             	mov    rdi,rax
  8030ec:	ff d2                	call   rdx
  8030ee:	e9 d4 00 00 00       	jmp    8031c7 <sys_operate_dev+0x33c>
        case DRVF_RM   :return devs[i].drv->rm(args);
  8030f3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8030f6:	48 63 d0             	movsxd rdx,eax
  8030f9:	48 89 d0             	mov    rax,rdx
  8030fc:	48 c1 e0 02          	shl    rax,0x2
  803100:	48 01 d0             	add    rax,rdx
  803103:	48 c1 e0 02          	shl    rax,0x2
  803107:	48 01 d0             	add    rax,rdx
  80310a:	48 c1 e0 03          	shl    rax,0x3
  80310e:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803114:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803117:	48 8b 50 48          	mov    rdx,QWORD PTR [rax+0x48]
  80311b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80311f:	48 89 c7             	mov    rdi,rax
  803122:	ff d2                	call   rdx
  803124:	e9 9e 00 00 00       	jmp    8031c7 <sys_operate_dev+0x33c>
        case DRVF_TOUCH:return devs[i].drv->touch(args);
  803129:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80312c:	48 63 d0             	movsxd rdx,eax
  80312f:	48 89 d0             	mov    rax,rdx
  803132:	48 c1 e0 02          	shl    rax,0x2
  803136:	48 01 d0             	add    rax,rdx
  803139:	48 c1 e0 02          	shl    rax,0x2
  80313d:	48 01 d0             	add    rax,rdx
  803140:	48 c1 e0 03          	shl    rax,0x3
  803144:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80314a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80314d:	48 8b 50 50          	mov    rdx,QWORD PTR [rax+0x50]
  803151:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803155:	48 89 c7             	mov    rdi,rax
  803158:	ff d2                	call   rdx
  80315a:	eb 6b                	jmp    8031c7 <sys_operate_dev+0x33c>
        case DRVF_MKDIR:return devs[i].drv->mkdir(args);
  80315c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80315f:	48 63 d0             	movsxd rdx,eax
  803162:	48 89 d0             	mov    rax,rdx
  803165:	48 c1 e0 02          	shl    rax,0x2
  803169:	48 01 d0             	add    rax,rdx
  80316c:	48 c1 e0 02          	shl    rax,0x2
  803170:	48 01 d0             	add    rax,rdx
  803173:	48 c1 e0 03          	shl    rax,0x3
  803177:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80317d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803180:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  803184:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803188:	48 89 c7             	mov    rdi,rax
  80318b:	ff d2                	call   rdx
  80318d:	eb 38                	jmp    8031c7 <sys_operate_dev+0x33c>
        case DRVF_LS:return    devs[i].drv->ls(args);
  80318f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803192:	48 63 d0             	movsxd rdx,eax
  803195:	48 89 d0             	mov    rax,rdx
  803198:	48 c1 e0 02          	shl    rax,0x2
  80319c:	48 01 d0             	add    rax,rdx
  80319f:	48 c1 e0 02          	shl    rax,0x2
  8031a3:	48 01 d0             	add    rax,rdx
  8031a6:	48 c1 e0 03          	shl    rax,0x3
  8031aa:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8031b0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8031b3:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
  8031b7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8031bb:	48 89 c7             	mov    rdi,rax
  8031be:	ff d2                	call   rdx
  8031c0:	eb 05                	jmp    8031c7 <sys_operate_dev+0x33c>
    }
    return -1;
  8031c2:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8031c7:	c9                   	leave  
  8031c8:	c3                   	ret    

00000000008031c9 <call_drv_func>:
int call_drv_func(int drv_n,int func_n,driver_args *args)
{
  8031c9:	f3 0f 1e fa          	endbr64 
  8031cd:	55                   	push   rbp
  8031ce:	48 89 e5             	mov    rbp,rsp
  8031d1:	48 83 ec 10          	sub    rsp,0x10
  8031d5:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  8031d8:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  8031db:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    if(drvs[drv_n].flag==DRV_FLAG_EMPTY)return -1;
  8031df:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8031e2:	48 63 d0             	movsxd rdx,eax
  8031e5:	48 89 d0             	mov    rax,rdx
  8031e8:	48 c1 e0 02          	shl    rax,0x2
  8031ec:	48 01 d0             	add    rax,rdx
  8031ef:	48 c1 e0 05          	shl    rax,0x5
  8031f3:	48 05 80 58 40 00    	add    rax,0x405880
  8031f9:	8b 00                	mov    eax,DWORD PTR [rax]
  8031fb:	85 c0                	test   eax,eax
  8031fd:	75 0a                	jne    803209 <call_drv_func+0x40>
  8031ff:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803204:	e9 15 02 00 00       	jmp    80341e <call_drv_func+0x255>
    /*driverfunc f=drvs[drv_n].func_thunk[func_n];
    return f(args);*/
    switch (func_n) {
  803209:	83 7d f8 0b          	cmp    DWORD PTR [rbp-0x8],0xb
  80320d:	0f 87 06 02 00 00    	ja     803419 <call_drv_func+0x250>
  803213:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803216:	48 8b 04 c5 e8 45 81 	mov    rax,QWORD PTR [rax*8+0x8145e8]
  80321d:	00 
  80321e:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return drvs[drv_n].open(args);
  803221:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803224:	48 63 d0             	movsxd rdx,eax
  803227:	48 89 d0             	mov    rax,rdx
  80322a:	48 c1 e0 02          	shl    rax,0x2
  80322e:	48 01 d0             	add    rax,rdx
  803231:	48 c1 e0 05          	shl    rax,0x5
  803235:	48 05 88 58 40 00    	add    rax,0x405888
  80323b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80323e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803242:	48 89 c7             	mov    rdi,rax
  803245:	ff d2                	call   rdx
  803247:	e9 d2 01 00 00       	jmp    80341e <call_drv_func+0x255>
        case DRVF_CLOSE:return drvs[drv_n].close(args);
  80324c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80324f:	48 63 d0             	movsxd rdx,eax
  803252:	48 89 d0             	mov    rax,rdx
  803255:	48 c1 e0 02          	shl    rax,0x2
  803259:	48 01 d0             	add    rax,rdx
  80325c:	48 c1 e0 05          	shl    rax,0x5
  803260:	48 05 90 58 40 00    	add    rax,0x405890
  803266:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803269:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80326d:	48 89 c7             	mov    rdi,rax
  803270:	ff d2                	call   rdx
  803272:	e9 a7 01 00 00       	jmp    80341e <call_drv_func+0x255>
        case DRVF_READ :return drvs[drv_n].read(args);
  803277:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80327a:	48 63 d0             	movsxd rdx,eax
  80327d:	48 89 d0             	mov    rax,rdx
  803280:	48 c1 e0 02          	shl    rax,0x2
  803284:	48 01 d0             	add    rax,rdx
  803287:	48 c1 e0 05          	shl    rax,0x5
  80328b:	48 05 98 58 40 00    	add    rax,0x405898
  803291:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803294:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803298:	48 89 c7             	mov    rdi,rax
  80329b:	ff d2                	call   rdx
  80329d:	e9 7c 01 00 00       	jmp    80341e <call_drv_func+0x255>
        case DRVF_WRITE:return drvs[drv_n].write(args);
  8032a2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032a5:	48 63 d0             	movsxd rdx,eax
  8032a8:	48 89 d0             	mov    rax,rdx
  8032ab:	48 c1 e0 02          	shl    rax,0x2
  8032af:	48 01 d0             	add    rax,rdx
  8032b2:	48 c1 e0 05          	shl    rax,0x5
  8032b6:	48 05 a0 58 40 00    	add    rax,0x4058a0
  8032bc:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8032bf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8032c3:	48 89 c7             	mov    rdi,rax
  8032c6:	ff d2                	call   rdx
  8032c8:	e9 51 01 00 00       	jmp    80341e <call_drv_func+0x255>
        case DRVF_CHK  :return drvs[drv_n].check(args);
  8032cd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032d0:	48 63 d0             	movsxd rdx,eax
  8032d3:	48 89 d0             	mov    rax,rdx
  8032d6:	48 c1 e0 02          	shl    rax,0x2
  8032da:	48 01 d0             	add    rax,rdx
  8032dd:	48 c1 e0 05          	shl    rax,0x5
  8032e1:	48 05 a8 58 40 00    	add    rax,0x4058a8
  8032e7:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8032ea:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8032ee:	48 89 c7             	mov    rdi,rax
  8032f1:	ff d2                	call   rdx
  8032f3:	e9 26 01 00 00       	jmp    80341e <call_drv_func+0x255>
        case DRVF_RSVD :return drvs[drv_n].reserved(args);
  8032f8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032fb:	48 63 d0             	movsxd rdx,eax
  8032fe:	48 89 d0             	mov    rax,rdx
  803301:	48 c1 e0 02          	shl    rax,0x2
  803305:	48 01 d0             	add    rax,rdx
  803308:	48 c1 e0 05          	shl    rax,0x5
  80330c:	48 05 b0 58 40 00    	add    rax,0x4058b0
  803312:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803315:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803319:	48 89 c7             	mov    rdi,rax
  80331c:	ff d2                	call   rdx
  80331e:	e9 fb 00 00 00       	jmp    80341e <call_drv_func+0x255>
        case DRVF_INT  :return drvs[drv_n].inthandler(args);
  803323:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803326:	48 63 d0             	movsxd rdx,eax
  803329:	48 89 d0             	mov    rax,rdx
  80332c:	48 c1 e0 02          	shl    rax,0x2
  803330:	48 01 d0             	add    rax,rdx
  803333:	48 c1 e0 05          	shl    rax,0x5
  803337:	48 05 b8 58 40 00    	add    rax,0x4058b8
  80333d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803340:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803344:	48 89 c7             	mov    rdi,rax
  803347:	ff d2                	call   rdx
  803349:	e9 d0 00 00 00       	jmp    80341e <call_drv_func+0x255>
        case DRVF_FIND :return drvs[drv_n].find(args);
  80334e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803351:	48 63 d0             	movsxd rdx,eax
  803354:	48 89 d0             	mov    rax,rdx
  803357:	48 c1 e0 02          	shl    rax,0x2
  80335b:	48 01 d0             	add    rax,rdx
  80335e:	48 c1 e0 05          	shl    rax,0x5
  803362:	48 05 c0 58 40 00    	add    rax,0x4058c0
  803368:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80336b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80336f:	48 89 c7             	mov    rdi,rax
  803372:	ff d2                	call   rdx
  803374:	e9 a5 00 00 00       	jmp    80341e <call_drv_func+0x255>
        case DRVF_RM   :return drvs[drv_n].rm(args);
  803379:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80337c:	48 63 d0             	movsxd rdx,eax
  80337f:	48 89 d0             	mov    rax,rdx
  803382:	48 c1 e0 02          	shl    rax,0x2
  803386:	48 01 d0             	add    rax,rdx
  803389:	48 c1 e0 05          	shl    rax,0x5
  80338d:	48 05 c8 58 40 00    	add    rax,0x4058c8
  803393:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803396:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80339a:	48 89 c7             	mov    rdi,rax
  80339d:	ff d2                	call   rdx
  80339f:	eb 7d                	jmp    80341e <call_drv_func+0x255>
        case DRVF_TOUCH:return drvs[drv_n].touch(args);
  8033a1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8033a4:	48 63 d0             	movsxd rdx,eax
  8033a7:	48 89 d0             	mov    rax,rdx
  8033aa:	48 c1 e0 02          	shl    rax,0x2
  8033ae:	48 01 d0             	add    rax,rdx
  8033b1:	48 c1 e0 05          	shl    rax,0x5
  8033b5:	48 05 d0 58 40 00    	add    rax,0x4058d0
  8033bb:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8033be:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033c2:	48 89 c7             	mov    rdi,rax
  8033c5:	ff d2                	call   rdx
  8033c7:	eb 55                	jmp    80341e <call_drv_func+0x255>
        case DRVF_MKDIR:return drvs[drv_n].mkdir(args);
  8033c9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8033cc:	48 63 d0             	movsxd rdx,eax
  8033cf:	48 89 d0             	mov    rax,rdx
  8033d2:	48 c1 e0 02          	shl    rax,0x2
  8033d6:	48 01 d0             	add    rax,rdx
  8033d9:	48 c1 e0 05          	shl    rax,0x5
  8033dd:	48 05 d8 58 40 00    	add    rax,0x4058d8
  8033e3:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8033e6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033ea:	48 89 c7             	mov    rdi,rax
  8033ed:	ff d2                	call   rdx
  8033ef:	eb 2d                	jmp    80341e <call_drv_func+0x255>
        case DRVF_LS:return drvs[drv_n].ls(args);
  8033f1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8033f4:	48 63 d0             	movsxd rdx,eax
  8033f7:	48 89 d0             	mov    rax,rdx
  8033fa:	48 c1 e0 02          	shl    rax,0x2
  8033fe:	48 01 d0             	add    rax,rdx
  803401:	48 c1 e0 05          	shl    rax,0x5
  803405:	48 05 e0 58 40 00    	add    rax,0x4058e0
  80340b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80340e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803412:	48 89 c7             	mov    rdi,rax
  803415:	ff d2                	call   rdx
  803417:	eb 05                	jmp    80341e <call_drv_func+0x255>
    }
    return -1;
  803419:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  80341e:	c9                   	leave  
  80341f:	c3                   	ret    

0000000000803420 <dispose_device>:
int dispose_device(int dev){
  803420:	f3 0f 1e fa          	endbr64 
  803424:	55                   	push   rbp
  803425:	48 89 e5             	mov    rbp,rsp
  803428:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(devs[dev].flag!=DEV_FLAG_USED)return -1;
  80342b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80342e:	48 63 d0             	movsxd rdx,eax
  803431:	48 89 d0             	mov    rax,rdx
  803434:	48 c1 e0 02          	shl    rax,0x2
  803438:	48 01 d0             	add    rax,rdx
  80343b:	48 c1 e0 02          	shl    rax,0x2
  80343f:	48 01 d0             	add    rax,rdx
  803442:	48 c1 e0 03          	shl    rax,0x3
  803446:	48 05 90 2e 40 00    	add    rax,0x402e90
  80344c:	8b 00                	mov    eax,DWORD PTR [rax]
  80344e:	83 f8 01             	cmp    eax,0x1
  803451:	74 07                	je     80345a <dispose_device+0x3a>
  803453:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803458:	eb 62                	jmp    8034bc <dispose_device+0x9c>
    device* p=&devs[dev];
  80345a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80345d:	48 63 d0             	movsxd rdx,eax
  803460:	48 89 d0             	mov    rax,rdx
  803463:	48 c1 e0 02          	shl    rax,0x2
  803467:	48 01 d0             	add    rax,rdx
  80346a:	48 c1 e0 02          	shl    rax,0x2
  80346e:	48 01 d0             	add    rax,rdx
  803471:	48 c1 e0 03          	shl    rax,0x3
  803475:	48 05 80 2e 40 00    	add    rax,0x402e80
  80347b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //从链表删除
    if(p->prev)p->prev->next=p->next;
  80347f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803483:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  80348a:	48 85 c0             	test   rax,rax
  80348d:	74 1d                	je     8034ac <dispose_device+0x8c>
  80348f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803493:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  80349a:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80349e:	48 8b 92 90 00 00 00 	mov    rdx,QWORD PTR [rdx+0x90]
  8034a5:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
    p->flag=DEV_FLAG_EMPTY;
  8034ac:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8034b0:	c7 40 10 00 00 00 00 	mov    DWORD PTR [rax+0x10],0x0
    return 0;
  8034b7:	b8 00 00 00 00       	mov    eax,0x0
}
  8034bc:	5d                   	pop    rbp
  8034bd:	c3                   	ret    

00000000008034be <dispose_driver>:
int dispose_driver(driver *drv){
  8034be:	f3 0f 1e fa          	endbr64 
  8034c2:	55                   	push   rbp
  8034c3:	48 89 e5             	mov    rbp,rsp
  8034c6:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  8034ca:	90                   	nop
  8034cb:	5d                   	pop    rbp
  8034cc:	c3                   	ret    

00000000008034cd <get_dev>:

device *get_dev(int devi)
{
  8034cd:	f3 0f 1e fa          	endbr64 
  8034d1:	55                   	push   rbp
  8034d2:	48 89 e5             	mov    rbp,rsp
  8034d5:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &devs[devi];
  8034d8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034db:	48 63 d0             	movsxd rdx,eax
  8034de:	48 89 d0             	mov    rax,rdx
  8034e1:	48 c1 e0 02          	shl    rax,0x2
  8034e5:	48 01 d0             	add    rax,rdx
  8034e8:	48 c1 e0 02          	shl    rax,0x2
  8034ec:	48 01 d0             	add    rax,rdx
  8034ef:	48 c1 e0 03          	shl    rax,0x3
  8034f3:	48 05 80 2e 40 00    	add    rax,0x402e80
}
  8034f9:	5d                   	pop    rbp
  8034fa:	c3                   	ret    

00000000008034fb <get_drv>:
driver *get_drv(int drvi)
{
  8034fb:	f3 0f 1e fa          	endbr64 
  8034ff:	55                   	push   rbp
  803500:	48 89 e5             	mov    rbp,rsp
  803503:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &drvs[drvi];
  803506:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803509:	48 63 d0             	movsxd rdx,eax
  80350c:	48 89 d0             	mov    rax,rdx
  80350f:	48 c1 e0 02          	shl    rax,0x2
  803513:	48 01 d0             	add    rax,rdx
  803516:	48 c1 e0 05          	shl    rax,0x5
  80351a:	48 05 80 58 40 00    	add    rax,0x405880
}
  803520:	5d                   	pop    rbp
  803521:	c3                   	ret    

0000000000803522 <make_request>:

//发送一个操作设备的申请
int make_request(driver_args* args)
{
  803522:	f3 0f 1e fa          	endbr64 
  803526:	55                   	push   rbp
  803527:	48 89 e5             	mov    rbp,rsp
  80352a:	53                   	push   rbx
  80352b:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //在数组中寻找空项
    int i=0;
  80352f:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<NR_REQS;i++)
  803536:	eb 23                	jmp    80355b <make_request+0x39>
    {
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  803538:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80353b:	48 63 d0             	movsxd rdx,eax
  80353e:	48 89 d0             	mov    rax,rdx
  803541:	48 01 c0             	add    rax,rax
  803544:	48 01 d0             	add    rax,rdx
  803547:	48 c1 e0 06          	shl    rax,0x6
  80354b:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803551:	8b 00                	mov    eax,DWORD PTR [rax]
  803553:	85 c0                	test   eax,eax
  803555:	74 0c                	je     803563 <make_request+0x41>
    for(;i<NR_REQS;i++)
  803557:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80355b:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  80355f:	7e d7                	jle    803538 <make_request+0x16>
  803561:	eb 01                	jmp    803564 <make_request+0x42>
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  803563:	90                   	nop
    }
    if(i==NR_REQS)return -1;//满了
  803564:	83 7d f4 20          	cmp    DWORD PTR [rbp-0xc],0x20
  803568:	75 0a                	jne    803574 <make_request+0x52>
  80356a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80356f:	e9 e7 01 00 00       	jmp    80375b <make_request+0x239>
    reqs[i]=*args;//放入数组
  803574:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803577:	48 63 d0             	movsxd rdx,eax
  80357a:	48 89 d0             	mov    rax,rdx
  80357d:	48 01 c0             	add    rax,rax
  803580:	48 01 d0             	add    rax,rdx
  803583:	48 c1 e0 06          	shl    rax,0x6
  803587:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  80358e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803592:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  803595:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  803599:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  80359c:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  8035a0:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  8035a4:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  8035a8:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  8035ac:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  8035b0:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  8035b4:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  8035b8:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  8035bc:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  8035c0:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  8035c4:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  8035c8:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  8035cc:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  8035d0:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  8035d4:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  8035d8:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  8035dc:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  8035e0:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  8035e4:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  8035e8:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  8035ec:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  8035f0:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  8035f4:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  8035f8:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  8035fc:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  803600:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  803604:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  803608:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  80360c:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  803610:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  803617:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  80361e:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  803625:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  80362c:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  803633:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  80363a:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  803641:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  803648:	48 8b 88 a0 00 00 00 	mov    rcx,QWORD PTR [rax+0xa0]
  80364f:	48 8b 98 a8 00 00 00 	mov    rbx,QWORD PTR [rax+0xa8]
  803656:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  80365d:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  803664:	48 8b 88 b0 00 00 00 	mov    rcx,QWORD PTR [rax+0xb0]
  80366b:	48 8b 98 b8 00 00 00 	mov    rbx,QWORD PTR [rax+0xb8]
  803672:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  803679:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
    //插入具体设备的等待链表中
    device* dev=&devs[args->dev];
  803680:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803684:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  80368a:	48 63 d0             	movsxd rdx,eax
  80368d:	48 89 d0             	mov    rax,rdx
  803690:	48 c1 e0 02          	shl    rax,0x2
  803694:	48 01 d0             	add    rax,rdx
  803697:	48 c1 e0 02          	shl    rax,0x2
  80369b:	48 01 d0             	add    rax,rdx
  80369e:	48 c1 e0 03          	shl    rax,0x3
  8036a2:	48 05 80 2e 40 00    	add    rax,0x402e80
  8036a8:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!dev->waiting_reqs)//空的等待队列
  8036ac:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8036b0:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8036b7:	48 85 c0             	test   rax,rax
  8036ba:	75 27                	jne    8036e3 <make_request+0x1c1>
        dev->waiting_reqs=&reqs[i];
  8036bc:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8036bf:	48 63 d0             	movsxd rdx,eax
  8036c2:	48 89 d0             	mov    rax,rdx
  8036c5:	48 01 c0             	add    rax,rax
  8036c8:	48 01 d0             	add    rax,rdx
  8036cb:	48 c1 e0 06          	shl    rax,0x6
  8036cf:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  8036d6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8036da:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
  8036e1:	eb 75                	jmp    803758 <make_request+0x236>
    else{
        driver_args* p=dev->waiting_reqs;
  8036e3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8036e7:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8036ee:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        for(;p->next;p=p->next);
  8036f2:	eb 0f                	jmp    803703 <make_request+0x1e1>
  8036f4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8036f8:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  8036ff:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  803703:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803707:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  80370e:	48 85 c0             	test   rax,rax
  803711:	75 e1                	jne    8036f4 <make_request+0x1d2>
        p->next=&reqs[i];
  803713:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803716:	48 63 d0             	movsxd rdx,eax
  803719:	48 89 d0             	mov    rax,rdx
  80371c:	48 01 c0             	add    rax,rax
  80371f:	48 01 d0             	add    rax,rdx
  803722:	48 c1 e0 06          	shl    rax,0x6
  803726:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  80372d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803731:	48 89 90 b8 00 00 00 	mov    QWORD PTR [rax+0xb8],rdx
        reqs[i].next=NULL;
  803738:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80373b:	48 63 d0             	movsxd rdx,eax
  80373e:	48 89 d0             	mov    rax,rdx
  803741:	48 01 c0             	add    rax,rax
  803744:	48 01 d0             	add    rax,rdx
  803747:	48 c1 e0 06          	shl    rax,0x6
  80374b:	48 05 38 6d 40 00    	add    rax,0x406d38
  803751:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }

    return i;
  803758:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  80375b:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80375f:	c9                   	leave  
  803760:	c3                   	ret    

0000000000803761 <do_req>:
//取出一个申请并且执行
int do_req()
{
  803761:	f3 0f 1e fa          	endbr64 
  803765:	55                   	push   rbp
  803766:	48 89 e5             	mov    rbp,rsp
  803769:	48 83 ec 10          	sub    rsp,0x10
    //查看每个设备的请求情况
    //块设备
    for(int i=0;i<3;i++)
  80376d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803774:	e9 ab 00 00 00       	jmp    803824 <do_req+0xc3>
    {
        device* p=dev_tree[i];
  803779:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80377c:	48 98                	cdqe   
  80377e:	48 8b 04 c5 80 84 40 	mov    rax,QWORD PTR [rax*8+0x408480]
  803785:	00 
  803786:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(;p;p=p->next)
  80378a:	e9 86 00 00 00       	jmp    803815 <do_req+0xb4>
        {
            //如果没有请求运行而且有请求要运行
            if(!p->running_req&&p->waiting_reqs)
  80378f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803793:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  80379a:	48 85 c0             	test   rax,rax
  80379d:	75 67                	jne    803806 <do_req+0xa5>
  80379f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037a3:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8037aa:	48 85 c0             	test   rax,rax
  8037ad:	74 57                	je     803806 <do_req+0xa5>
            {
                p->running_req=p->waiting_reqs;
  8037af:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037b3:	48 8b 90 88 00 00 00 	mov    rdx,QWORD PTR [rax+0x88]
  8037ba:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037be:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
                p->waiting_reqs=p->waiting_reqs->next;//取出一个
  8037c5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037c9:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8037d0:	48 8b 90 b8 00 00 00 	mov    rdx,QWORD PTR [rax+0xb8]
  8037d7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037db:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
                dev_funcs[p->operi](p->running_req);
  8037e2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037e6:	8b 80 a0 00 00 00    	mov    eax,DWORD PTR [rax+0xa0]
  8037ec:	48 98                	cdqe   
  8037ee:	48 8b 14 c5 00 c9 80 	mov    rdx,QWORD PTR [rax*8+0x80c900]
  8037f5:	00 
  8037f6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037fa:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  803801:	48 89 c7             	mov    rdi,rax
  803804:	ff d2                	call   rdx
        for(;p;p=p->next)
  803806:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80380a:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  803811:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  803815:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  80381a:	0f 85 6f ff ff ff    	jne    80378f <do_req+0x2e>
    for(int i=0;i<3;i++)
  803820:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803824:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  803828:	0f 8e 4b ff ff ff    	jle    803779 <do_req+0x18>
            }
            //如果还在运行（DONE的状态不能直接覆盖，因为里面的运行结果可能还没被拿走）
        }
    }
    
    return 0;
  80382e:	b8 00 00 00 00       	mov    eax,0x0
}
  803833:	c9                   	leave  
  803834:	c3                   	ret    

0000000000803835 <wait_on_req>:


void wait_on_req(int reqi)
{
  803835:	f3 0f 1e fa          	endbr64 
  803839:	55                   	push   rbp
  80383a:	48 89 e5             	mov    rbp,rsp
  80383d:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(reqs[reqi].stat!=REQ_STAT_DONE);
  803840:	90                   	nop
  803841:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803844:	48 63 d0             	movsxd rdx,eax
  803847:	48 89 d0             	mov    rax,rdx
  80384a:	48 01 c0             	add    rax,rax
  80384d:	48 01 d0             	add    rax,rdx
  803850:	48 c1 e0 06          	shl    rax,0x6
  803854:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  80385a:	8b 00                	mov    eax,DWORD PTR [rax]
  80385c:	83 f8 03             	cmp    eax,0x3
  80385f:	75 e0                	jne    803841 <wait_on_req+0xc>
}
  803861:	90                   	nop
  803862:	90                   	nop
  803863:	5d                   	pop    rbp
  803864:	c3                   	ret    

0000000000803865 <clear_req>:
void clear_req(int reqi)
{
  803865:	f3 0f 1e fa          	endbr64 
  803869:	55                   	push   rbp
  80386a:	48 89 e5             	mov    rbp,rsp
  80386d:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    reqs[reqi].stat=REQ_STAT_EMPTY;
  803870:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803873:	48 63 d0             	movsxd rdx,eax
  803876:	48 89 d0             	mov    rax,rdx
  803879:	48 01 c0             	add    rax,rax
  80387c:	48 01 d0             	add    rax,rdx
  80387f:	48 c1 e0 06          	shl    rax,0x6
  803883:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803889:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  80388f:	90                   	nop
  803890:	5d                   	pop    rbp
  803891:	c3                   	ret    

0000000000803892 <init_proc>:
TSS *tss=0x108000;
int cur_proc=0;
int pidd=0;
int palloc_paddr=0;
static pid_t sidd=0;
void init_proc(){
  803892:	f3 0f 1e fa          	endbr64 
  803896:	55                   	push   rbp
  803897:	48 89 e5             	mov    rbp,rsp
  80389a:	48 83 ec 10          	sub    rsp,0x10
    //task=(struct process*)get_global_var(TASK_PCBS_ADDR);//[MAX_TASKS];;
    for(int i=0;i<MAX_PROC_COUNT;i++){
  80389e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8038a5:	eb 4c                	jmp    8038f3 <init_proc+0x61>
        task[i].pid=-1;
  8038a7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8038aa:	48 98                	cdqe   
  8038ac:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8038b3:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8038b9:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
        task[i].stat=ENDED;
  8038bf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8038c2:	48 98                	cdqe   
  8038c4:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8038cb:	48 05 b8 84 40 00    	add    rax,0x4084b8
  8038d1:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
        task[i].parent_pid=-1;
  8038d7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8038da:	48 98                	cdqe   
  8038dc:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8038e3:	48 05 3c 85 40 00    	add    rax,0x40853c
  8038e9:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<MAX_PROC_COUNT;i++){
  8038ef:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8038f3:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8038f7:	7e ae                	jle    8038a7 <init_proc+0x15>
    }
    cur_proc=0;//no proc
  8038f9:	c7 05 29 1d c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc11d29],0x0        # 41562c <cur_proc>
  803900:	00 00 00 
    current=task;
  803903:	48 c7 05 92 1c c1 ff 	mov    QWORD PTR [rip+0xffffffffffc11c92],0x4084a0        # 4155a0 <current>
  80390a:	a0 84 40 00 
    pidd=1;
  80390e:	c7 05 18 1d c1 ff 01 	mov    DWORD PTR [rip+0xffffffffffc11d18],0x1        # 415630 <pidd>
  803915:	00 00 00 
     //创建0号进程
    int zi=create_proc();
  803918:	b8 00 00 00 00       	mov    eax,0x0
  80391d:	e8 ec 02 00 00       	call   803c0e <create_proc>
  803922:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    task[zi].stat=READY;
  803925:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803928:	48 98                	cdqe   
  80392a:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803931:	48 05 b8 84 40 00    	add    rax,0x4084b8
  803937:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int xi= _LDT_IND(zi)*8;
  80393d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803940:	83 c0 03             	add    eax,0x3
  803943:	c1 e0 04             	shl    eax,0x4
  803946:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    zi=_TSS_IND(zi)*8;
  803949:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80394c:	01 c0                	add    eax,eax
  80394e:	83 c0 05             	add    eax,0x5
  803951:	c1 e0 03             	shl    eax,0x3
  803954:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //asm volatile("lldt %0"::"m"(xi));
    //asm volatile("ltr %0"::"m"(zi));
    set_tss(0x400000,0x400000,0x400000,0x800000,0x800000,0x800000,0x800000,0x800000,0x800000,0x800000);
  803957:	68 00 00 80 00       	push   0x800000
  80395c:	68 00 00 80 00       	push   0x800000
  803961:	68 00 00 80 00       	push   0x800000
  803966:	68 00 00 80 00       	push   0x800000
  80396b:	41 b9 00 00 80 00    	mov    r9d,0x800000
  803971:	41 b8 00 00 80 00    	mov    r8d,0x800000
  803977:	b9 00 00 80 00       	mov    ecx,0x800000
  80397c:	ba 00 00 40 00       	mov    edx,0x400000
  803981:	be 00 00 40 00       	mov    esi,0x400000
  803986:	bf 00 00 40 00       	mov    edi,0x400000
  80398b:	e8 2c 13 00 00       	call   804cbc <set_tss>
  803990:	48 83 c4 20          	add    rsp,0x20
    //IA32_INTERRUPT_SSP_TABLE_ADDR，准备IST
    wrmsr(0x6a8,tss->rsvd2);
  803994:	48 8b 05 e5 8f 00 00 	mov    rax,QWORD PTR [rip+0x8fe5]        # 80c980 <tss>
  80399b:	48 8b 40 1c          	mov    rax,QWORD PTR [rax+0x1c]
  80399f:	48 89 c6             	mov    rsi,rax
  8039a2:	bf a8 06 00 00       	mov    edi,0x6a8
  8039a7:	e8 78 ce ff ff       	call   800824 <wrmsr>
    //把内核代码段选择子写到MSR寄存器中准备用于特权级转换(sysexit，现在没用)
    wrmsr(0x174,0x8);
  8039ac:	be 08 00 00 00       	mov    esi,0x8
  8039b1:	bf 74 01 00 00       	mov    edi,0x174
  8039b6:	e8 69 ce ff ff       	call   800824 <wrmsr>
    //准备用于特权级转换(sysret，正在使用)
    wrmsr(0xc0000081,0x0020000800000000ul);
  8039bb:	48 b8 00 00 00 00 08 	movabs rax,0x20000800000000
  8039c2:	00 20 00 
  8039c5:	48 89 c6             	mov    rsi,rax
  8039c8:	b8 81 00 00 c0       	mov    eax,0xc0000081
  8039cd:	48 89 c7             	mov    rdi,rax
  8039d0:	e8 4f ce ff ff       	call   800824 <wrmsr>
    comprintf("proc init set.\r\ntss.ist=0x%x\r\n",tss->ists[0]);
  8039d5:	48 8b 05 a4 8f 00 00 	mov    rax,QWORD PTR [rip+0x8fa4]        # 80c980 <tss>
  8039dc:	48 8b 40 24          	mov    rax,QWORD PTR [rax+0x24]
  8039e0:	48 89 c6             	mov    rsi,rax
  8039e3:	bf 48 46 81 00       	mov    edi,0x814648
  8039e8:	b8 00 00 00 00       	mov    eax,0x0
  8039ed:	e8 90 84 00 00       	call   80be82 <comprintf>
    //创建一个测试进程
//    create_test_proc();
}
  8039f2:	90                   	nop
  8039f3:	c9                   	leave  
  8039f4:	c3                   	ret    

00000000008039f5 <create_test_proc>:
void create_test_proc(){
  8039f5:	f3 0f 1e fa          	endbr64 
  8039f9:	55                   	push   rbp
  8039fa:	48 89 e5             	mov    rbp,rsp
  8039fd:	48 83 ec 20          	sub    rsp,0x20

    int index=req_proc();
  803a01:	b8 00 00 00 00       	mov    eax,0x0
  803a06:	e8 86 02 00 00       	call   803c91 <req_proc>
  803a0b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    task[index].stat=READY;
  803a0e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a11:	48 98                	cdqe   
  803a13:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803a1a:	48 05 b8 84 40 00    	add    rax,0x4084b8
  803a20:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int currsp=0x9fc00-1;
  803a26:	c7 45 ec ff fb 09 00 	mov    DWORD PTR [rbp-0x14],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  803a2d:	48 89 65 ec          	mov    QWORD PTR [rbp-0x14],rsp
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  803a31:	ba 72 c8 80 00       	mov    edx,0x80c872
  803a36:	48 83 ec 08          	sub    rsp,0x8
  803a3a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a3d:	50                   	push   rax
  803a3e:	6a 00                	push   0x0
  803a40:	52                   	push   rdx
  803a41:	6a 00                	push   0x0
  803a43:	6a 00                	push   0x0
  803a45:	6a 00                	push   0x0
  803a47:	68 58 7d 00 00       	push   0x7d58
  803a4c:	6a 10                	push   0x10
  803a4e:	6a 10                	push   0x10
  803a50:	6a 10                	push   0x10
  803a52:	6a 10                	push   0x10
  803a54:	41 b9 08 00 00 00    	mov    r9d,0x8
  803a5a:	41 b8 10 00 00 00    	mov    r8d,0x10
  803a60:	b9 00 00 00 00       	mov    ecx,0x0
  803a65:	ba 00 00 00 00       	mov    edx,0x0
  803a6a:	be 00 00 00 00       	mov    esi,0x0
  803a6f:	bf 00 00 00 00       	mov    edi,0x0
  803a74:	e8 e4 02 00 00       	call   803d5d <set_proc>
  803a79:	48 83 c4 60          	add    rsp,0x60
             0x7e00- sizeof(stack_store_regs), 0, 0, 0, (long)ret_sys_call, 0, index);
    task[index].tss.rsp0=0x400000;
  803a7d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a80:	48 98                	cdqe   
  803a82:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803a89:	48 05 70 86 40 00    	add    rax,0x408670
  803a8f:	48 c7 40 0c 00 00 40 	mov    QWORD PTR [rax+0xc],0x400000
  803a96:	00 
    task[index].mem_struct.stack_top=0x7e00;
  803a97:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a9a:	48 98                	cdqe   
  803a9c:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803aa3:	48 05 d4 84 40 00    	add    rax,0x4084d4
  803aa9:	c7 00 00 7e 00 00    	mov    DWORD PTR [rax],0x7e00
    task[index].mem_struct.stack_bottom=0x6e00;
  803aaf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803ab2:	48 98                	cdqe   
  803ab4:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803abb:	48 05 d0 84 40 00    	add    rax,0x4084d0
  803ac1:	c7 00 00 6e 00 00    	mov    DWORD PTR [rax],0x6e00
    task[index].mem_struct.heap_top=0x1101000;
  803ac7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803aca:	48 98                	cdqe   
  803acc:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803ad3:	48 05 cc 84 40 00    	add    rax,0x4084cc
  803ad9:	c7 00 00 10 10 01    	mov    DWORD PTR [rax],0x1101000
    task[index].mem_struct.heap_base=0x1100000;
  803adf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803ae2:	48 98                	cdqe   
  803ae4:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803aeb:	48 05 c8 84 40 00    	add    rax,0x4084c8
  803af1:	c7 00 00 00 10 01    	mov    DWORD PTR [rax],0x1100000

    //把还原现场时用到的堆栈设置好
    stack_store_regs *str= (stack_store_regs *) (0x7e00 - sizeof(stack_store_regs));
  803af7:	48 c7 45 f0 58 7d 00 	mov    QWORD PTR [rbp-0x10],0x7d58
  803afe:	00 
    str->rax=0;
  803aff:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b03:	48 c7 40 78 00 00 00 	mov    QWORD PTR [rax+0x78],0x0
  803b0a:	00 
    str->rbx=0;
  803b0b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b0f:	48 c7 40 70 00 00 00 	mov    QWORD PTR [rax+0x70],0x0
  803b16:	00 
    str->rcx=proc_zero;//sysret采用的返回地址
  803b17:	ba d1 3e 80 00       	mov    edx,0x803ed1
  803b1c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b20:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    str->rdx=0;
  803b24:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b28:	48 c7 40 60 00 00 00 	mov    QWORD PTR [rax+0x60],0x0
  803b2f:	00 
    str->rsi=0;
  803b30:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b34:	48 c7 40 50 00 00 00 	mov    QWORD PTR [rax+0x50],0x0
  803b3b:	00 
    str->rdi=0;
  803b3c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b40:	48 c7 40 58 00 00 00 	mov    QWORD PTR [rax+0x58],0x0
  803b47:	00 
    str->r15=0;
  803b48:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b4c:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  803b53:	00 
    str->r14=0;
  803b54:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b58:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  803b5f:	00 
    str->r13=0;
  803b60:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b64:	48 c7 40 20 00 00 00 	mov    QWORD PTR [rax+0x20],0x0
  803b6b:	00 
    str->r12=0;
  803b6c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b70:	48 c7 40 28 00 00 00 	mov    QWORD PTR [rax+0x28],0x0
  803b77:	00 
    str->r11=0x200;
  803b78:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b7c:	48 c7 40 30 00 02 00 	mov    QWORD PTR [rax+0x30],0x200
  803b83:	00 
    str->r10=0;
  803b84:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b88:	48 c7 40 38 00 00 00 	mov    QWORD PTR [rax+0x38],0x0
  803b8f:	00 
    str->r9=0;
  803b90:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b94:	48 c7 40 40 00 00 00 	mov    QWORD PTR [rax+0x40],0x0
  803b9b:	00 
    str->r8=0;
  803b9c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803ba0:	48 c7 40 48 00 00 00 	mov    QWORD PTR [rax+0x48],0x0
  803ba7:	00 
    str->rip=proc_zero;
  803ba8:	ba d1 3e 80 00       	mov    edx,0x803ed1
  803bad:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bb1:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
    str->cs=0x8;
  803bb8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bbc:	48 c7 80 88 00 00 00 	mov    QWORD PTR [rax+0x88],0x8
  803bc3:	08 00 00 00 
    str->rflags=0x00200206;
  803bc7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bcb:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x200206
  803bd2:	06 02 20 00 
    str->rsp=0x7e00;
  803bd6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bda:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x7e00
  803be1:	00 7e 00 00 
    str->ss=0x2b;
  803be5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803be9:	48 c7 80 a0 00 00 00 	mov    QWORD PTR [rax+0xa0],0x2b
  803bf0:	2b 00 00 00 
    str->ds=0x2b;
  803bf4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bf8:	48 c7 00 2b 00 00 00 	mov    QWORD PTR [rax],0x2b
    str->es=0x2b;
  803bff:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c03:	48 c7 40 08 2b 00 00 	mov    QWORD PTR [rax+0x8],0x2b
  803c0a:	00 

}
  803c0b:	90                   	nop
  803c0c:	c9                   	leave  
  803c0d:	c3                   	ret    

0000000000803c0e <create_proc>:
int create_proc()
{
  803c0e:	f3 0f 1e fa          	endbr64 
  803c12:	55                   	push   rbp
  803c13:	48 89 e5             	mov    rbp,rsp
  803c16:	48 83 ec 10          	sub    rsp,0x10
    int index=req_proc();
  803c1a:	b8 00 00 00 00       	mov    eax,0x0
  803c1f:	e8 6d 00 00 00       	call   803c91 <req_proc>
  803c24:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(index==-1)return -1;
  803c27:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  803c2b:	75 07                	jne    803c34 <create_proc+0x26>
  803c2d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803c32:	eb 5b                	jmp    803c8f <create_proc+0x81>
    int currsp=0x9fc00-1;
  803c34:	c7 45 f8 ff fb 09 00 	mov    DWORD PTR [rbp-0x8],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  803c3b:	48 89 65 f8          	mov    QWORD PTR [rbp-0x8],rsp
    //默认DPL=3
    //set_proc(0,0,0,0,0x23,0x1b,0x23,0x23,0x23,0x23,curesp,0,0,0,0,index);
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  803c3f:	b9 d1 3e 80 00       	mov    ecx,0x803ed1
  803c44:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803c47:	48 98                	cdqe   
  803c49:	48 83 ec 08          	sub    rsp,0x8
  803c4d:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  803c50:	52                   	push   rdx
  803c51:	6a 00                	push   0x0
  803c53:	51                   	push   rcx
  803c54:	6a 00                	push   0x0
  803c56:	6a 00                	push   0x0
  803c58:	6a 00                	push   0x0
  803c5a:	50                   	push   rax
  803c5b:	6a 10                	push   0x10
  803c5d:	6a 10                	push   0x10
  803c5f:	6a 10                	push   0x10
  803c61:	6a 10                	push   0x10
  803c63:	41 b9 08 00 00 00    	mov    r9d,0x8
  803c69:	41 b8 10 00 00 00    	mov    r8d,0x10
  803c6f:	b9 00 00 00 00       	mov    ecx,0x0
  803c74:	ba 00 00 00 00       	mov    edx,0x0
  803c79:	be 00 00 00 00       	mov    esi,0x0
  803c7e:	bf 00 00 00 00       	mov    edi,0x0
  803c83:	e8 d5 00 00 00       	call   803d5d <set_proc>
  803c88:	48 83 c4 60          	add    rsp,0x60
             currsp, 0, 0, 0, (long)proc_zero, 0, index);
//    task[index].tss.eip=(long)proc_zero;

    return index;
  803c8c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803c8f:	c9                   	leave  
  803c90:	c3                   	ret    

0000000000803c91 <req_proc>:
int req_proc(){
  803c91:	f3 0f 1e fa          	endbr64 
  803c95:	55                   	push   rbp
  803c96:	48 89 e5             	mov    rbp,rsp
    int num=0;
  803c99:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803ca0:	eb 04                	jmp    803ca6 <req_proc+0x15>
    num<=MAX_PROC_COUNT){
        num++;
  803ca2:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803ca6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803ca9:	48 98                	cdqe   
  803cab:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803cb2:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803cb8:	8b 00                	mov    eax,DWORD PTR [rax]
  803cba:	83 f8 ff             	cmp    eax,0xffffffff
  803cbd:	74 1f                	je     803cde <req_proc+0x4d>
  803cbf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803cc2:	48 98                	cdqe   
  803cc4:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803ccb:	48 05 b8 84 40 00    	add    rax,0x4084b8
  803cd1:	8b 00                	mov    eax,DWORD PTR [rax]
  803cd3:	83 f8 03             	cmp    eax,0x3
  803cd6:	74 06                	je     803cde <req_proc+0x4d>
  803cd8:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  803cdc:	7e c4                	jle    803ca2 <req_proc+0x11>
    }
    if(num>=MAX_PROC_COUNT)
  803cde:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803ce2:	7e 07                	jle    803ceb <req_proc+0x5a>
        return -1;
  803ce4:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803ce9:	eb 70                	jmp    803d5b <req_proc+0xca>
    task[num].pid=pidd++;
  803ceb:	8b 05 3f 19 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1193f]        # 415630 <pidd>
  803cf1:	8d 50 01             	lea    edx,[rax+0x1]
  803cf4:	89 15 36 19 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc11936],edx        # 415630 <pidd>
  803cfa:	89 c2                	mov    edx,eax
  803cfc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803cff:	48 98                	cdqe   
  803d01:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803d08:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803d0e:	89 10                	mov    DWORD PTR [rax],edx
    task[num].stat=ENDED;
  803d10:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d13:	48 98                	cdqe   
  803d15:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803d1c:	48 05 b8 84 40 00    	add    rax,0x4084b8
  803d22:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[num].utime=0;
  803d28:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d2b:	48 98                	cdqe   
  803d2d:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803d34:	48 05 bc 84 40 00    	add    rax,0x4084bc
  803d3a:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[num].priority=0;
  803d40:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d43:	48 98                	cdqe   
  803d45:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803d4c:	48 05 c0 84 40 00    	add    rax,0x4084c0
  803d52:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return num;
  803d58:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803d5b:	5d                   	pop    rbp
  803d5c:	c3                   	ret    

0000000000803d5d <set_proc>:
void set_proc(long rax, long rbx, long rcx, long rdx, long es, long cs, long ss, long ds, long fs, long gs, long rsp,
              long rbp, long rsi, long rdi, long rip, long rflags, int proc_nr) {
  803d5d:	f3 0f 1e fa          	endbr64 
  803d61:	55                   	push   rbp
  803d62:	48 89 e5             	mov    rbp,rsp
  803d65:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  803d69:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  803d6d:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  803d71:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  803d75:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
  803d79:	4c 89 4d c0          	mov    QWORD PTR [rbp-0x40],r9
    struct process* proc=&task[proc_nr];
  803d7d:	8b 45 60             	mov    eax,DWORD PTR [rbp+0x60]
  803d80:	48 98                	cdqe   
  803d82:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803d89:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803d8f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    proc->regs.rax=rax;
  803d93:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803d97:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  803d9b:	48 89 90 5c 02 00 00 	mov    QWORD PTR [rax+0x25c],rdx
    proc->regs.rbx=rbx;
  803da2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803da6:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  803daa:	48 89 90 74 02 00 00 	mov    QWORD PTR [rax+0x274],rdx
    proc->regs.rcx=rcx;
  803db1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803db5:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  803db9:	48 89 90 64 02 00 00 	mov    QWORD PTR [rax+0x264],rdx
    proc->regs.rdx=rdx;
  803dc0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803dc4:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  803dc8:	48 89 90 6c 02 00 00 	mov    QWORD PTR [rax+0x26c],rdx
    proc->regs.es=es;
  803dcf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803dd3:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803dd7:	48 89 90 9c 02 00 00 	mov    QWORD PTR [rax+0x29c],rdx
    proc->regs.cs=cs;
  803dde:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803de2:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803de6:	48 89 90 a4 02 00 00 	mov    QWORD PTR [rax+0x2a4],rdx
    proc->regs.ss=ss;
  803ded:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803df1:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803df5:	48 89 90 ac 02 00 00 	mov    QWORD PTR [rax+0x2ac],rdx
    proc->regs.ds=ds;
  803dfc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e00:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803e04:	48 89 90 b4 02 00 00 	mov    QWORD PTR [rax+0x2b4],rdx
    proc->regs.fs=fs;
  803e0b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e0f:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  803e13:	48 89 90 bc 02 00 00 	mov    QWORD PTR [rax+0x2bc],rdx
    proc->regs.gs=gs;
  803e1a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e1e:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  803e22:	48 89 90 c4 02 00 00 	mov    QWORD PTR [rax+0x2c4],rdx
    proc->regs.rsp=rsp;
  803e29:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e2d:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803e31:	48 89 90 7c 02 00 00 	mov    QWORD PTR [rax+0x27c],rdx
    proc->regs.rbp=rbp;
  803e38:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e3c:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
  803e40:	48 89 90 84 02 00 00 	mov    QWORD PTR [rax+0x284],rdx
    proc->regs.rsi=rsi;
  803e47:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e4b:	48 8b 55 40          	mov    rdx,QWORD PTR [rbp+0x40]
  803e4f:	48 89 90 8c 02 00 00 	mov    QWORD PTR [rax+0x28c],rdx
    proc->regs.rdi=rdi;
  803e56:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e5a:	48 8b 55 48          	mov    rdx,QWORD PTR [rbp+0x48]
  803e5e:	48 89 90 94 02 00 00 	mov    QWORD PTR [rax+0x294],rdx
    proc->regs.rflags=0x202;//设置为默认值:0b 0010 0000 0010
  803e65:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e69:	48 c7 80 54 02 00 00 	mov    QWORD PTR [rax+0x254],0x202
  803e70:	02 02 00 00 
    //能接受中断
    proc->regs.rip=rip;
  803e74:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e78:	48 8b 55 50          	mov    rdx,QWORD PTR [rbp+0x50]
  803e7c:	48 89 90 4c 02 00 00 	mov    QWORD PTR [rax+0x24c],rdx

    proc->regs.cs=cs;
  803e83:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e87:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803e8b:	48 89 90 a4 02 00 00 	mov    QWORD PTR [rax+0x2a4],rdx
    proc->regs.ds=ds;
  803e92:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e96:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803e9a:	48 89 90 b4 02 00 00 	mov    QWORD PTR [rax+0x2b4],rdx
    proc->regs.es=es;
  803ea1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ea5:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803ea9:	48 89 90 9c 02 00 00 	mov    QWORD PTR [rax+0x29c],rdx
    proc->regs.cr3=PML4_ADDR;//get_phyaddr(n1);//暂时先搞成全局
  803eb0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803eb4:	48 c7 80 44 02 00 00 	mov    QWORD PTR [rax+0x244],0x101000
  803ebb:	00 10 10 00 
    proc->pml4=PML4_ADDR;
  803ebf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ec3:	48 c7 80 c0 00 00 00 	mov    QWORD PTR [rax+0xc0],0x101000
  803eca:	00 10 10 00 


}
  803ece:	90                   	nop
  803ecf:	5d                   	pop    rbp
  803ed0:	c3                   	ret    

0000000000803ed1 <proc_zero>:
void proc_zero()
{
  803ed1:	f3 0f 1e fa          	endbr64 
  803ed5:	55                   	push   rbp
  803ed6:	48 89 e5             	mov    rbp,rsp
  803ed9:	48 83 ec 10          	sub    rsp,0x10
//    }else{
//        printf("parent proc ret:%d\n",rax);
//    }
    while (1)
    {
        char c= sys_analyse_key();
  803edd:	b8 00 00 00 00       	mov    eax,0x0
  803ee2:	e8 3b 46 00 00       	call   808522 <sys_analyse_key>
  803ee7:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        putchar(c);
  803eea:	0f be 45 ff          	movsx  eax,BYTE PTR [rbp-0x1]
  803eee:	89 c7                	mov    edi,eax
  803ef0:	e8 08 ce ff ff       	call   800cfd <putchar>
    {
  803ef5:	eb e6                	jmp    803edd <proc_zero+0xc>

0000000000803ef7 <save_rsp>:
    }
}
void save_rsp(){
  803ef7:	f3 0f 1e fa          	endbr64 
  803efb:	55                   	push   rbp
  803efc:	48 89 e5             	mov    rbp,rsp
    //在时钟中断context下
    addr_t * p=INT_STACK_TOP-16;
  803eff:	48 c7 45 f8 f0 ff 7f 	mov    QWORD PTR [rbp-0x8],0x7ffff0
  803f06:	00 
    current->regs.rsp=*p;
  803f07:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f0b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803f0e:	48 8b 05 8b 16 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1168b]        # 4155a0 <current>
  803f15:	48 89 90 7c 02 00 00 	mov    QWORD PTR [rax+0x27c],rdx
}
  803f1c:	90                   	nop
  803f1d:	5d                   	pop    rbp
  803f1e:	c3                   	ret    

0000000000803f1f <manage_proc>:
void manage_proc(){
  803f1f:	f3 0f 1e fa          	endbr64 
  803f23:	55                   	push   rbp
  803f24:	48 89 e5             	mov    rbp,rsp
  803f27:	48 83 ec 10          	sub    rsp,0x10
    if(cur_proc!=-1)
  803f2b:	8b 05 fb 16 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc116fb]        # 41562c <cur_proc>
  803f31:	83 f8 ff             	cmp    eax,0xffffffff
  803f34:	74 2d                	je     803f63 <manage_proc+0x44>
        task[cur_proc].utime++;
  803f36:	8b 05 f0 16 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc116f0]        # 41562c <cur_proc>
  803f3c:	48 63 d0             	movsxd rdx,eax
  803f3f:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  803f46:	48 81 c2 bc 84 40 00 	add    rdx,0x4084bc
  803f4d:	8b 12                	mov    edx,DWORD PTR [rdx]
  803f4f:	83 c2 01             	add    edx,0x1
  803f52:	48 98                	cdqe   
  803f54:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803f5b:	48 05 bc 84 40 00    	add    rax,0x4084bc
  803f61:	89 10                	mov    DWORD PTR [rax],edx
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803f63:	8b 05 c3 16 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc116c3]        # 41562c <cur_proc>
  803f69:	83 f8 ff             	cmp    eax,0xffffffff
  803f6c:	74 3c                	je     803faa <manage_proc+0x8b>
  803f6e:	8b 05 b8 16 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc116b8]        # 41562c <cur_proc>
  803f74:	48 98                	cdqe   
  803f76:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803f7d:	48 05 bc 84 40 00    	add    rax,0x4084bc
  803f83:	8b 00                	mov    eax,DWORD PTR [rax]
  803f85:	83 f8 0a             	cmp    eax,0xa
  803f88:	77 20                	ja     803faa <manage_proc+0x8b>
    task[cur_proc].stat!=READY){
  803f8a:	8b 05 9c 16 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1169c]        # 41562c <cur_proc>
  803f90:	48 98                	cdqe   
  803f92:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803f99:	48 05 b8 84 40 00    	add    rax,0x4084b8
  803f9f:	8b 00                	mov    eax,DWORD PTR [rax]
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803fa1:	83 f8 01             	cmp    eax,0x1
  803fa4:	0f 84 02 01 00 00    	je     8040ac <manage_proc+0x18d>
        if(cur_proc!=-1)
  803faa:	8b 05 7c 16 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1167c]        # 41562c <cur_proc>
  803fb0:	83 f8 ff             	cmp    eax,0xffffffff
  803fb3:	74 1b                	je     803fd0 <manage_proc+0xb1>
            task[cur_proc].utime=0;
  803fb5:	8b 05 71 16 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11671]        # 41562c <cur_proc>
  803fbb:	48 98                	cdqe   
  803fbd:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803fc4:	48 05 bc 84 40 00    	add    rax,0x4084bc
  803fca:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        //find
        int i=cur_proc+1;
  803fd0:	8b 05 56 16 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11656]        # 41562c <cur_proc>
  803fd6:	83 c0 01             	add    eax,0x1
  803fd9:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        int times=0;
  803fdc:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
        //轮询，直到有一个符合条件
        while(times<10){
  803fe3:	eb 52                	jmp    804037 <manage_proc+0x118>
            if(task[i].pid!=-1&&task[i].stat==READY&&i!=cur_proc){
  803fe5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803fe8:	48 98                	cdqe   
  803fea:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803ff1:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803ff7:	8b 00                	mov    eax,DWORD PTR [rax]
  803ff9:	83 f8 ff             	cmp    eax,0xffffffff
  803ffc:	74 24                	je     804022 <manage_proc+0x103>
  803ffe:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804001:	48 98                	cdqe   
  804003:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80400a:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804010:	8b 00                	mov    eax,DWORD PTR [rax]
  804012:	83 f8 01             	cmp    eax,0x1
  804015:	75 0b                	jne    804022 <manage_proc+0x103>
  804017:	8b 05 0f 16 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1160f]        # 41562c <cur_proc>
  80401d:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  804020:	75 1d                	jne    80403f <manage_proc+0x120>
                break;
            }
            i++;
  804022:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
            if(i>=MAX_TASKS){
  804026:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  80402a:	7e 0b                	jle    804037 <manage_proc+0x118>
                times++;
  80402c:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                i=0;
  804030:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        while(times<10){
  804037:	83 7d f8 09          	cmp    DWORD PTR [rbp-0x8],0x9
  80403b:	7e a8                	jle    803fe5 <manage_proc+0xc6>
  80403d:	eb 01                	jmp    804040 <manage_proc+0x121>
                break;
  80403f:	90                   	nop
            }
        }
        if(times==10)return;//超过十次尝试都没有，暂时不切换
  804040:	83 7d f8 0a          	cmp    DWORD PTR [rbp-0x8],0xa
  804044:	74 69                	je     8040af <manage_proc+0x190>
        //switch
        task[cur_proc].stat=READY;
  804046:	8b 05 e0 15 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc115e0]        # 41562c <cur_proc>
  80404c:	48 98                	cdqe   
  80404e:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804055:	48 05 b8 84 40 00    	add    rax,0x4084b8
  80405b:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        task[i].stat=RUNNING;
  804061:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804064:	48 98                	cdqe   
  804066:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80406d:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804073:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        switch_to(&task[cur_proc], &task[i]);
  804079:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80407c:	48 98                	cdqe   
  80407e:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804085:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  80408c:	8b 05 9a 15 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1159a]        # 41562c <cur_proc>
  804092:	48 98                	cdqe   
  804094:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80409b:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8040a1:	48 89 d6             	mov    rsi,rdx
  8040a4:	48 89 c7             	mov    rdi,rax
  8040a7:	e8 82 0a 00 00       	call   804b2e <switch_to>
    }
    return;
  8040ac:	90                   	nop
  8040ad:	eb 01                	jmp    8040b0 <manage_proc+0x191>
        if(times==10)return;//超过十次尝试都没有，暂时不切换
  8040af:	90                   	nop
}
  8040b0:	c9                   	leave  
  8040b1:	c3                   	ret    

00000000008040b2 <switch_proc_tss>:

void switch_proc_tss(int pnr)
{
  8040b2:	f3 0f 1e fa          	endbr64 
  8040b6:	55                   	push   rbp
  8040b7:	48 89 e5             	mov    rbp,rsp
  8040ba:	48 83 ec 20          	sub    rsp,0x20
  8040be:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int sel=_TSS_IND(pnr)*8;
  8040c1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8040c4:	01 c0                	add    eax,eax
  8040c6:	83 c0 05             	add    eax,0x5
  8040c9:	c1 e0 03             	shl    eax,0x3
  8040cc:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    cur_proc=pnr;
  8040cf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8040d2:	89 05 54 15 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc11554],eax        # 41562c <cur_proc>
    switch_proc_asm(sel);
  8040d8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8040db:	89 c7                	mov    edi,eax
  8040dd:	e8 a8 86 00 00       	call   80c78a <switch_proc_asm>
}
  8040e2:	90                   	nop
  8040e3:	c9                   	leave  
  8040e4:	c3                   	ret    

00000000008040e5 <switch_proc>:
void switch_proc(int pnr){
  8040e5:	f3 0f 1e fa          	endbr64 
  8040e9:	55                   	push   rbp
  8040ea:	48 89 e5             	mov    rbp,rsp
  8040ed:	48 81 ec 30 03 00 00 	sub    rsp,0x330
  8040f4:	89 bd dc fc ff ff    	mov    DWORD PTR [rbp-0x324],edi
    //printf("switching proc to %d\n",pnr);
    //printf("eip:%x\n",task[pnr].tss.eip);
    struct process p=task[pnr];
  8040fa:	8b 85 dc fc ff ff    	mov    eax,DWORD PTR [rbp-0x324]
  804100:	48 98                	cdqe   
  804102:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804109:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  804110:	48 8d 85 e0 fc ff ff 	lea    rax,[rbp-0x320]
  804117:	b9 63 00 00 00       	mov    ecx,0x63
  80411c:	48 89 c7             	mov    rdi,rax
  80411f:	48 89 d6             	mov    rsi,rdx
  804122:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
  804125:	48 89 f2             	mov    rdx,rsi
  804128:	48 89 f8             	mov    rax,rdi
  80412b:	8b 0a                	mov    ecx,DWORD PTR [rdx]
  80412d:	89 08                	mov    DWORD PTR [rax],ecx
    save_context(&task[cur_proc].tss);
  80412f:	8b 05 f7 14 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc114f7]        # 41562c <cur_proc>
  804135:	48 98                	cdqe   
  804137:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80413e:	48 05 d0 01 00 00    	add    rax,0x1d0
  804144:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80414a:	48 83 c0 08          	add    rax,0x8
  80414e:	48 89 c7             	mov    rdi,rax
  804151:	e8 4c 00 00 00       	call   8041a2 <save_context>
//    //重新设置0号进程
//    task[0].tss.eip=proc_zero;
//    task[0].tss.cr3=PAGE_INDEX_ADDR;
//    task[0].tss.eflags=0x202;
    cur_proc=pnr;
  804156:	8b 85 dc fc ff ff    	mov    eax,DWORD PTR [rbp-0x324]
  80415c:	89 05 ca 14 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc114ca],eax        # 41562c <cur_proc>
    int sel=_TSS_IND(pnr)*8;
  804162:	8b 85 dc fc ff ff    	mov    eax,DWORD PTR [rbp-0x324]
  804168:	01 c0                	add    eax,eax
  80416a:	83 c0 05             	add    eax,0x5
  80416d:	c1 e0 03             	shl    eax,0x3
  804170:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    switch_to(NULL, &task[pnr].tss);
  804173:	8b 85 dc fc ff ff    	mov    eax,DWORD PTR [rbp-0x324]
  804179:	48 98                	cdqe   
  80417b:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804182:	48 05 d0 01 00 00    	add    rax,0x1d0
  804188:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80418e:	48 83 c0 08          	add    rax,0x8
  804192:	48 89 c6             	mov    rsi,rax
  804195:	bf 00 00 00 00       	mov    edi,0x0
  80419a:	e8 8f 09 00 00       	call   804b2e <switch_to>
    //asm volatile("push %0":"=r"(task[pnr].tss.eip));
    //switch_proc_asm(pnr*8+0x8*3);
}
  80419f:	90                   	nop
  8041a0:	c9                   	leave  
  8041a1:	c3                   	ret    

00000000008041a2 <save_context>:
void save_context(TSS *tss)
{
  8041a2:	f3 0f 1e fa          	endbr64 
  8041a6:	55                   	push   rbp
  8041a7:	48 89 e5             	mov    rbp,rsp
  8041aa:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//    tss->esi=scene_saver.esi;
//    tss->edi=scene_saver.edi;
//    tss->eflags=scene_saver.eflags;
//    tss->esp=scene_saver.esp;
//    tss->ebp=scene_saver.ebp;
}
  8041ae:	90                   	nop
  8041af:	5d                   	pop    rbp
  8041b0:	c3                   	ret    

00000000008041b1 <palloc>:
    task[index].stat=READY;
    return index;
} */
//为指定进程申请新的内存，并返回这块内存的线性地址。
void* palloc(int proc_index,int size)
{
  8041b1:	f3 0f 1e fa          	endbr64 
  8041b5:	55                   	push   rbp
  8041b6:	48 89 e5             	mov    rbp,rsp
  8041b9:	48 83 ec 60          	sub    rsp,0x60
  8041bd:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  8041c0:	89 75 a8             	mov    DWORD PTR [rbp-0x58],esi
    int page_c=size/4096+size%4096?1:0;
  8041c3:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  8041c6:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8041cc:	85 c0                	test   eax,eax
  8041ce:	0f 48 c2             	cmovs  eax,edx
  8041d1:	c1 f8 0c             	sar    eax,0xc
  8041d4:	89 c1                	mov    ecx,eax
  8041d6:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  8041d9:	99                   	cdq    
  8041da:	c1 ea 14             	shr    edx,0x14
  8041dd:	01 d0                	add    eax,edx
  8041df:	25 ff 0f 00 00       	and    eax,0xfff
  8041e4:	29 d0                	sub    eax,edx
  8041e6:	01 c8                	add    eax,ecx
  8041e8:	85 c0                	test   eax,eax
  8041ea:	0f 95 c0             	setne  al
  8041ed:	0f b6 c0             	movzx  eax,al
  8041f0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=0;
  8041f3:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    void *ptr=NULL;
  8041fa:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  804201:	00 
    page_item *pgind=NULL;//task[proc_index].tss.cr3;
  804202:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  804209:	00 
    pgind++;
  80420a:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  80420f:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [rbp-0x14],0x1
  804216:	e9 30 02 00 00       	jmp    80444b <palloc+0x29a>
    {
        page_item* tblp=*pgind&0xfffff000;
  80421b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80421f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804222:	25 00 f0 ff ff       	and    eax,0xfffff000
  804227:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for(int j=0;j<1024;j++)
  80422b:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  804232:	e9 fe 01 00 00       	jmp    804435 <palloc+0x284>
        {
            int v=*tblp&PAGE_PRESENT;
  804237:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80423b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80423e:	83 e0 01             	and    eax,0x1
  804241:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
            if(!v)
  804244:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  804248:	0f 85 de 01 00 00    	jne    80442c <palloc+0x27b>
            {
                int new_pg=req_a_page();
  80424e:	b8 00 00 00 00       	mov    eax,0x0
  804253:	e8 5f d3 ff ff       	call   8015b7 <req_a_page>
  804258:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
                if(new_pg==-1)
  80425b:	83 7d c8 ff          	cmp    DWORD PTR [rbp-0x38],0xffffffff
  80425f:	0f 85 b9 00 00 00    	jne    80431e <palloc+0x16d>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  804265:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804268:	48 98                	cdqe   
  80426a:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804271:	48 05 08 85 40 00    	add    rax,0x408508
  804277:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80427a:	0f b7 c0             	movzx  eax,ax
  80427d:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  804280:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804283:	48 98                	cdqe   
  804285:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80428c:	48 05 00 85 40 00    	add    rax,0x408500
  804292:	0f b7 40 0d          	movzx  eax,WORD PTR [rax+0xd]
  804296:	0f b7 c0             	movzx  eax,ax
  804299:	c1 e0 10             	shl    eax,0x10
  80429c:	25 00 00 0f 00       	and    eax,0xf0000
  8042a1:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    size+=c;
  8042a4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8042a7:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  8042aa:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8042ad:	89 c2                	mov    edx,eax
  8042af:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8042b2:	48 98                	cdqe   
  8042b4:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8042bb:	48 05 08 85 40 00    	add    rax,0x408508
  8042c1:	66 89 10             	mov    WORD PTR [rax],dx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  8042c4:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8042c7:	48 98                	cdqe   
  8042c9:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8042d0:	48 05 00 85 40 00    	add    rax,0x408500
  8042d6:	0f b7 40 0d          	movzx  eax,WORD PTR [rax+0xd]
  8042da:	0f b7 c0             	movzx  eax,ax
  8042dd:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    tmp_attr&=0xfff0;
  8042e0:	81 65 b0 f0 ff 00 00 	and    DWORD PTR [rbp-0x50],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  8042e7:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8042ea:	c1 e8 10             	shr    eax,0x10
  8042ed:	83 e0 0f             	and    eax,0xf
  8042f0:	89 c2                	mov    edx,eax
  8042f2:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  8042f5:	01 d0                	add    eax,edx
  8042f7:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  8042fa:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  8042fd:	89 c2                	mov    edx,eax
  8042ff:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804302:	48 98                	cdqe   
  804304:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80430b:	48 05 00 85 40 00    	add    rax,0x408500
  804311:	66 89 50 0d          	mov    WORD PTR [rax+0xd],dx
                    return ptr;//失败了，只能申请一部分的内存或者返回NULL
  804315:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804319:	e9 3f 01 00 00       	jmp    80445d <palloc+0x2ac>
                }
                int addr=get_phyaddr(new_pg);
  80431e:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  804321:	89 c7                	mov    edi,eax
  804323:	e8 7e d4 ff ff       	call   8017a6 <get_phyaddr>
  804328:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
                set_page_item(tblp,addr,PAGE_PRESENT|\
  80432b:	8b 4d c4             	mov    ecx,DWORD PTR [rbp-0x3c]
  80432e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804332:	ba 07 00 00 00       	mov    edx,0x7
  804337:	89 ce                	mov    esi,ecx
  804339:	48 89 c7             	mov    rdi,rax
  80433c:	e8 78 d4 ff ff       	call   8017b9 <set_page_item>
                PAGE_RWX|PAGE_FOR_ALL);
                int laddr=i*0x400000+j*0x1000;//线性地址
  804341:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804344:	c1 e0 0a             	shl    eax,0xa
  804347:	89 c2                	mov    edx,eax
  804349:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80434c:	01 d0                	add    eax,edx
  80434e:	c1 e0 0c             	shl    eax,0xc
  804351:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
                if(ptr==NULL)
  804354:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
  804359:	75 09                	jne    804364 <palloc+0x1b3>
                {
                   // ptr=laddr;
                    palloc_paddr=addr;
  80435b:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80435e:	89 05 d0 12 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc112d0],eax        # 415634 <palloc_paddr>
                }
                page_c--;
  804364:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
                c++;
  804368:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                if(page_c==0)
  80436c:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  804370:	0f 85 b6 00 00 00    	jne    80442c <palloc+0x27b>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  804376:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804379:	48 98                	cdqe   
  80437b:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804382:	48 05 08 85 40 00    	add    rax,0x408508
  804388:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80438b:	0f b7 c0             	movzx  eax,ax
  80438e:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  804391:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804394:	48 98                	cdqe   
  804396:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80439d:	48 05 00 85 40 00    	add    rax,0x408500
  8043a3:	0f b7 40 0d          	movzx  eax,WORD PTR [rax+0xd]
  8043a7:	0f b7 c0             	movzx  eax,ax
  8043aa:	c1 e0 10             	shl    eax,0x10
  8043ad:	25 00 00 0f 00       	and    eax,0xf0000
  8043b2:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    size+=c;
  8043b5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8043b8:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  8043bb:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  8043be:	89 c2                	mov    edx,eax
  8043c0:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8043c3:	48 98                	cdqe   
  8043c5:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8043cc:	48 05 08 85 40 00    	add    rax,0x408508
  8043d2:	66 89 10             	mov    WORD PTR [rax],dx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  8043d5:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8043d8:	48 98                	cdqe   
  8043da:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8043e1:	48 05 00 85 40 00    	add    rax,0x408500
  8043e7:	0f b7 40 0d          	movzx  eax,WORD PTR [rax+0xd]
  8043eb:	0f b7 c0             	movzx  eax,ax
  8043ee:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    tmp_attr&=0xfff0;
  8043f1:	81 65 b8 f0 ff 00 00 	and    DWORD PTR [rbp-0x48],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  8043f8:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  8043fb:	c1 e8 10             	shr    eax,0x10
  8043fe:	83 e0 0f             	and    eax,0xf
  804401:	89 c2                	mov    edx,eax
  804403:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  804406:	01 d0                	add    eax,edx
  804408:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  80440b:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  80440e:	89 c2                	mov    edx,eax
  804410:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804413:	48 98                	cdqe   
  804415:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80441c:	48 05 00 85 40 00    	add    rax,0x408500
  804422:	66 89 50 0d          	mov    WORD PTR [rax+0xd],dx
                    return ptr;
  804426:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80442a:	eb 31                	jmp    80445d <palloc+0x2ac>
                }
            }
            tblp++;
  80442c:	48 83 45 e0 08       	add    QWORD PTR [rbp-0x20],0x8
        for(int j=0;j<1024;j++)
  804431:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  804435:	81 7d dc ff 03 00 00 	cmp    DWORD PTR [rbp-0x24],0x3ff
  80443c:	0f 8e f5 fd ff ff    	jle    804237 <palloc+0x86>
        }
        pgind++;
  804442:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  804447:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  80444b:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  804452:	0f 8e c3 fd ff ff    	jle    80421b <palloc+0x6a>
    }
    return NULL;
  804458:	b8 00 00 00 00       	mov    eax,0x0
}
  80445d:	c9                   	leave  
  80445e:	c3                   	ret    

000000000080445f <malloc>:
//为当前进程申请新的内存，并返回这块内存的线性地址。
void* malloc(int size)
{
  80445f:	f3 0f 1e fa          	endbr64 
  804463:	55                   	push   rbp
  804464:	48 89 e5             	mov    rbp,rsp
  804467:	48 83 ec 10          	sub    rsp,0x10
  80446b:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return palloc(cur_proc,size);
  80446e:	8b 05 b8 11 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc111b8]        # 41562c <cur_proc>
  804474:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804477:	89 d6                	mov    esi,edx
  804479:	89 c7                	mov    edi,eax
  80447b:	e8 31 fd ff ff       	call   8041b1 <palloc>
}
  804480:	c9                   	leave  
  804481:	c3                   	ret    

0000000000804482 <proc_end>:
void proc_end()
{
  804482:	f3 0f 1e fa          	endbr64 
  804486:	55                   	push   rbp
  804487:	48 89 e5             	mov    rbp,rsp
  80448a:	48 83 ec 10          	sub    rsp,0x10
    int ret;
    asm volatile("mov %%eax,%0":"=m"(ret));
  80448e:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("proc #%d ended with retv %d.\n",cur_proc,ret);
    //切换堆栈
    //asm volatile("mov %0,%%rsp"::"r"(task[0].tss.esp));
    del_proc(cur_proc);
  804491:	8b 05 95 11 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11195]        # 41562c <cur_proc>
  804497:	89 c7                	mov    edi,eax
  804499:	e8 75 00 00 00       	call   804513 <del_proc>
    if(task[cur_proc].parent_pid!=-1){
  80449e:	8b 05 88 11 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11188]        # 41562c <cur_proc>
  8044a4:	48 98                	cdqe   
  8044a6:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8044ad:	48 05 3c 85 40 00    	add    rax,0x40853c
  8044b3:	8b 00                	mov    eax,DWORD PTR [rax]
  8044b5:	83 f8 ff             	cmp    eax,0xffffffff
  8044b8:	74 4c                	je     804506 <proc_end+0x84>
        task[task[cur_proc].parent_pid].stat=READY;
  8044ba:	8b 05 6c 11 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1116c]        # 41562c <cur_proc>
  8044c0:	48 98                	cdqe   
  8044c2:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8044c9:	48 05 3c 85 40 00    	add    rax,0x40853c
  8044cf:	8b 00                	mov    eax,DWORD PTR [rax]
  8044d1:	89 c0                	mov    eax,eax
  8044d3:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8044da:	48 05 b8 84 40 00    	add    rax,0x4084b8
  8044e0:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        switch_proc_tss(task[cur_proc].parent_pid);
  8044e6:	8b 05 40 11 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11140]        # 41562c <cur_proc>
  8044ec:	48 98                	cdqe   
  8044ee:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8044f5:	48 05 3c 85 40 00    	add    rax,0x40853c
  8044fb:	8b 00                	mov    eax,DWORD PTR [rax]
  8044fd:	89 c7                	mov    edi,eax
  8044ff:	e8 ae fb ff ff       	call   8040b2 <switch_proc_tss>
    }
    else
        switch_proc_tss(0);
    //syscall(SYSCALL_DEL_PROC,cur_proc,0,0,0,0);
}
  804504:	eb 0a                	jmp    804510 <proc_end+0x8e>
        switch_proc_tss(0);
  804506:	bf 00 00 00 00       	mov    edi,0x0
  80450b:	e8 a2 fb ff ff       	call   8040b2 <switch_proc_tss>
}
  804510:	90                   	nop
  804511:	c9                   	leave  
  804512:	c3                   	ret    

0000000000804513 <del_proc>:
void del_proc(int pnr)
{
  804513:	f3 0f 1e fa          	endbr64 
  804517:	55                   	push   rbp
  804518:	48 89 e5             	mov    rbp,rsp
  80451b:	48 83 ec 30          	sub    rsp,0x30
  80451f:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
    task[pnr].stat=ENDED;
  804522:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804525:	48 98                	cdqe   
  804527:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80452e:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804534:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[pnr].pid=-1;
  80453a:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80453d:	48 98                	cdqe   
  80453f:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804546:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80454c:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    //释放申请的页面
    page_item *p;//task[pnr].tss.cr3;
    p++;
  804552:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
    for(;(*p&PAGE_PRESENT)!=0;p++)
  804557:	eb 63                	jmp    8045bc <del_proc+0xa9>
    {
        page_item *tp=*p&0xfffff000;
  804559:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80455d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804560:	25 00 f0 ff ff       	and    eax,0xfffff000
  804565:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<1024;i++)
  804569:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804570:	eb 30                	jmp    8045a2 <del_proc+0x8f>
        {
            unsigned int present=*tp&PAGE_PRESENT;
  804572:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804576:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804579:	83 e0 01             	and    eax,0x1
  80457c:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            if(present)
  80457f:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  804583:	74 14                	je     804599 <del_proc+0x86>
            {
                free_page(*tp&0xfffff000);
  804585:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804589:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80458c:	25 00 f0 ff ff       	and    eax,0xfffff000
  804591:	48 89 c7             	mov    rdi,rax
  804594:	e8 ee d0 ff ff       	call   801687 <free_page>
                //printf("freed page at %x.\n",*tp&0xfffff000);
            }
            tp++;
  804599:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
        for(int i=0;i<1024;i++)
  80459e:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8045a2:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  8045a9:	7e c7                	jle    804572 <del_proc+0x5f>
        }
        vmfree(tp);
  8045ab:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8045af:	48 89 c7             	mov    rdi,rax
  8045b2:	e8 d5 cc ff ff       	call   80128c <vmfree>
    for(;(*p&PAGE_PRESENT)!=0;p++)
  8045b7:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
  8045bc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8045c0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8045c3:	83 e0 01             	and    eax,0x1
  8045c6:	48 85 c0             	test   rax,rax
  8045c9:	75 8e                	jne    804559 <del_proc+0x46>
    }
    //释放存放页目录的页面
    vmfree(p);
  8045cb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8045cf:	48 89 c7             	mov    rdi,rax
  8045d2:	e8 b5 cc ff ff       	call   80128c <vmfree>
    //从进程中解除cr3,tss和ldt
    //switch_proc_tss(task[pnr]);
}
  8045d7:	90                   	nop
  8045d8:	c9                   	leave  
  8045d9:	c3                   	ret    

00000000008045da <set_proc_stat>:

int set_proc_stat(int pid,int stat)
{
  8045da:	f3 0f 1e fa          	endbr64 
  8045de:	55                   	push   rbp
  8045df:	48 89 e5             	mov    rbp,rsp
  8045e2:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8045e5:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==-1)return -1;
  8045e8:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  8045ec:	75 07                	jne    8045f5 <set_proc_stat+0x1b>
  8045ee:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8045f3:	eb 79                	jmp    80466e <set_proc_stat+0x94>
    int i=0;
  8045f5:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;task[i].pid!=pid;i++);
  8045fc:	eb 04                	jmp    804602 <set_proc_stat+0x28>
  8045fe:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  804602:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804605:	48 98                	cdqe   
  804607:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80460e:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804614:	8b 10                	mov    edx,DWORD PTR [rax]
  804616:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804619:	39 c2                	cmp    edx,eax
  80461b:	75 e1                	jne    8045fe <set_proc_stat+0x24>
    if(i==MAX_PROC_COUNT)return -1;
  80461d:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  804621:	75 07                	jne    80462a <set_proc_stat+0x50>
  804623:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804628:	eb 44                	jmp    80466e <set_proc_stat+0x94>
    task[i].stat=stat;
  80462a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80462d:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804630:	48 63 d2             	movsxd rdx,edx
  804633:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  80463a:	48 81 c2 b8 84 40 00 	add    rdx,0x4084b8
  804641:	89 02                	mov    DWORD PTR [rdx],eax
    //如果这就是正在运行的进程，那么马上停止
    if(cur_proc==i)
  804643:	8b 05 e3 0f c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10fe3]        # 41562c <cur_proc>
  804649:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  80464c:	75 1b                	jne    804669 <set_proc_stat+0x8f>
        task[cur_proc].utime=MAX_UTIME;
  80464e:	8b 05 d8 0f c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10fd8]        # 41562c <cur_proc>
  804654:	48 98                	cdqe   
  804656:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80465d:	48 05 bc 84 40 00    	add    rax,0x4084bc
  804663:	c7 00 0a 00 00 00    	mov    DWORD PTR [rax],0xa
    return 0;
  804669:	b8 00 00 00 00       	mov    eax,0x0
}
  80466e:	5d                   	pop    rbp
  80466f:	c3                   	ret    

0000000000804670 <add_proc_openf>:

    return 0;
} */

int add_proc_openf(struct index_node *entry)
{
  804670:	f3 0f 1e fa          	endbr64 
  804674:	55                   	push   rbp
  804675:	48 89 e5             	mov    rbp,rsp
  804678:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_PROC_OPENF;i++){
  80467c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  804683:	eb 67                	jmp    8046ec <add_proc_openf+0x7c>
        if(task[cur_proc].openf[i]==NULL)
  804685:	8b 05 a1 0f c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10fa1]        # 41562c <cur_proc>
  80468b:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80468e:	48 63 d2             	movsxd rdx,edx
  804691:	48 83 c2 1a          	add    rdx,0x1a
  804695:	48 98                	cdqe   
  804697:	48 c1 e2 03          	shl    rdx,0x3
  80469b:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8046a2:	48 01 d0             	add    rax,rdx
  8046a5:	48 05 a8 84 40 00    	add    rax,0x4084a8
  8046ab:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8046ae:	48 85 c0             	test   rax,rax
  8046b1:	75 35                	jne    8046e8 <add_proc_openf+0x78>
        {
            task[cur_proc].openf[i]=entry;
  8046b3:	8b 05 73 0f c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10f73]        # 41562c <cur_proc>
  8046b9:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8046bc:	48 63 d2             	movsxd rdx,edx
  8046bf:	48 83 c2 1a          	add    rdx,0x1a
  8046c3:	48 98                	cdqe   
  8046c5:	48 c1 e2 03          	shl    rdx,0x3
  8046c9:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8046d0:	48 01 d0             	add    rax,rdx
  8046d3:	48 8d 90 a8 84 40 00 	lea    rdx,[rax+0x4084a8]
  8046da:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8046de:	48 89 02             	mov    QWORD PTR [rdx],rax
            return 0;
  8046e1:	b8 00 00 00 00       	mov    eax,0x0
  8046e6:	eb 0f                	jmp    8046f7 <add_proc_openf+0x87>
    for(int i=0;i<MAX_PROC_OPENF;i++){
  8046e8:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8046ec:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  8046f0:	7e 93                	jle    804685 <add_proc_openf+0x15>
        }
    }
    return -1;//full
  8046f2:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8046f7:	5d                   	pop    rbp
  8046f8:	c3                   	ret    

00000000008046f9 <sys_exit>:
/*
 * 进程结束。
 * */
int sys_exit(int code)
{
  8046f9:	f3 0f 1e fa          	endbr64 
  8046fd:	55                   	push   rbp
  8046fe:	48 89 e5             	mov    rbp,rsp
  804701:	48 83 ec 10          	sub    rsp,0x10
  804705:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    del_proc(cur_proc);
  804708:	8b 05 1e 0f c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10f1e]        # 41562c <cur_proc>
  80470e:	89 c7                	mov    edi,eax
  804710:	e8 fe fd ff ff       	call   804513 <del_proc>
    while(1)
        manage_proc();
  804715:	b8 00 00 00 00       	mov    eax,0x0
  80471a:	e8 00 f8 ff ff       	call   803f1f <manage_proc>
  80471f:	eb f4                	jmp    804715 <sys_exit+0x1c>

0000000000804721 <reg_proc>:
    dllmain(NULL,0,NULL);
    
}*/

int reg_proc(addr_t entry, struct index_node *cwd, struct index_node *exef)
{
  804721:	f3 0f 1e fa          	endbr64 
  804725:	55                   	push   rbp
  804726:	48 89 e5             	mov    rbp,rsp
  804729:	53                   	push   rbx
  80472a:	48 83 ec 48          	sub    rsp,0x48
  80472e:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  804732:	48 89 75 c0          	mov    QWORD PTR [rbp-0x40],rsi
  804736:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
    
    int i=req_proc();
  80473a:	b8 00 00 00 00       	mov    eax,0x0
  80473f:	e8 4d f5 ff ff       	call   803c91 <req_proc>
  804744:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(i==-1)return -1;
  804747:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  80474b:	75 0a                	jne    804757 <reg_proc+0x36>
  80474d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804752:	e9 8c 01 00 00       	jmp    8048e3 <reg_proc+0x1c2>

    //栈顶设置在了4G处
    set_proc(0, 0, 0, 0, DS_USER, CS_USER, DS_USER, DS_USER\
  804757:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80475b:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80475e:	52                   	push   rdx
  80475f:	6a 00                	push   0x0
  804761:	50                   	push   rax
  804762:	6a 00                	push   0x0
  804764:	6a 00                	push   0x0
  804766:	6a 00                	push   0x0
  804768:	68 00 f0 ff ff       	push   0xfffffffffffff000
  80476d:	c7 44 24 04 ff ff 00 	mov    DWORD PTR [rsp+0x4],0xffff
  804774:	00 
  804775:	6a 28                	push   0x28
  804777:	6a 28                	push   0x28
  804779:	6a 28                	push   0x28
  80477b:	6a 28                	push   0x28
  80477d:	41 b9 30 00 00 00    	mov    r9d,0x30
  804783:	41 b8 28 00 00 00    	mov    r8d,0x28
  804789:	b9 00 00 00 00       	mov    ecx,0x0
  80478e:	ba 00 00 00 00       	mov    edx,0x0
  804793:	be 00 00 00 00       	mov    esi,0x0
  804798:	bf 00 00 00 00       	mov    edi,0x0
  80479d:	e8 bb f5 ff ff       	call   803d5d <set_proc>
  8047a2:	48 83 c4 58          	add    rsp,0x58
, DS_USER, DS_USER, STACK_TOP, 0, 0, 0, entry, 0, i);
    task[i].pml4=vmalloc();
  8047a6:	b8 00 00 00 00       	mov    eax,0x0
  8047ab:	e8 4d ca ff ff       	call   8011fd <vmalloc>
  8047b0:	48 89 c2             	mov    rdx,rax
  8047b3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8047b6:	48 98                	cdqe   
  8047b8:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8047bf:	48 05 60 85 40 00    	add    rax,0x408560
  8047c5:	48 89 10             	mov    QWORD PTR [rax],rdx
    task[i].pml4[0]=vmalloc();
  8047c8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8047cb:	48 98                	cdqe   
  8047cd:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8047d4:	48 05 60 85 40 00    	add    rax,0x408560
  8047da:	48 8b 18             	mov    rbx,QWORD PTR [rax]
  8047dd:	b8 00 00 00 00       	mov    eax,0x0
  8047e2:	e8 16 ca ff ff       	call   8011fd <vmalloc>
  8047e7:	48 89 03             	mov    QWORD PTR [rbx],rax
    unsigned long *pdpt=task[i].pml4;
  8047ea:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8047ed:	48 98                	cdqe   
  8047ef:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8047f6:	48 05 60 85 40 00    	add    rax,0x408560
  8047fc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8047ff:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    //pdpt第一项(0-1GB)设置为内核空间，这样才能访问中断
    set_1gb_pdpt(pdpt,0,PAGE_PRESENT|PAGE_RWX);
  804803:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804807:	ba 03 00 00 00       	mov    edx,0x3
  80480c:	be 00 00 00 00       	mov    esi,0x0
  804811:	48 89 c7             	mov    rdi,rax
  804814:	e8 f1 cf ff ff       	call   80180a <set_1gb_pdpt>

    //申请一项pd,里面申请一2mb页用于堆栈
    addr_t *stackb=vmalloc();
  804819:	b8 00 00 00 00       	mov    eax,0x0
  80481e:	e8 da c9 ff ff       	call   8011fd <vmalloc>
  804823:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    pdpt[3]=(unsigned long)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//3-4G分配栈空间
  804827:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80482b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80482f:	48 83 c0 18          	add    rax,0x18
  804833:	48 83 ca 07          	or     rdx,0x7
  804837:	48 89 10             	mov    QWORD PTR [rax],rdx
    set_2mb_pde(stackb + 511, get_phyaddr(req_a_page()), PAGE_FOR_ALL|PAGE_RWX);
  80483a:	b8 00 00 00 00       	mov    eax,0x0
  80483f:	e8 73 cd ff ff       	call   8015b7 <req_a_page>
  804844:	89 c7                	mov    edi,eax
  804846:	e8 5b cf ff ff       	call   8017a6 <get_phyaddr>
  80484b:	89 c1                	mov    ecx,eax
  80484d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804851:	48 05 f8 0f 00 00    	add    rax,0xff8
  804857:	ba 06 00 00 00       	mov    edx,0x6
  80485c:	89 ce                	mov    esi,ecx
  80485e:	48 89 c7             	mov    rdi,rax
  804861:	e8 fb cf ff ff       	call   801861 <set_2mb_pde>
    task[i].regs.cr3=task[i].pml4;
  804866:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804869:	48 98                	cdqe   
  80486b:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804872:	48 05 60 85 40 00    	add    rax,0x408560
  804878:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80487b:	48 89 c2             	mov    rdx,rax
  80487e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804881:	48 98                	cdqe   
  804883:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80488a:	48 05 e0 86 40 00    	add    rax,0x4086e0
  804890:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx

    task[i].stat=READY;
  804894:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804897:	48 98                	cdqe   
  804899:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8048a0:	48 05 b8 84 40 00    	add    rax,0x4084b8
  8048a6:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[i].cwd=cwd;
  8048ac:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8048af:	48 98                	cdqe   
  8048b1:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8048b8:	48 8d 90 68 85 40 00 	lea    rdx,[rax+0x408568]
  8048bf:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8048c3:	48 89 02             	mov    QWORD PTR [rdx],rax
    task[i].exef=exef;
  8048c6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8048c9:	48 98                	cdqe   
  8048cb:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8048d2:	48 8d 90 70 85 40 00 	lea    rdx,[rax+0x408570]
  8048d9:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8048dd:	48 89 02             	mov    QWORD PTR [rdx],rax

    return i;
  8048e0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    proc_ret_stack *pstack=stack_paddr+stack_size-12;
    pstack->argc=0;
    pstack->argv=0;
    pstack->proc_end_addr=proc_end;
    int *pptr=pstack;*/
}
  8048e3:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8048e7:	c9                   	leave  
  8048e8:	c3                   	ret    

00000000008048e9 <sys_malloc>:

void * sys_malloc(int size)
{
  8048e9:	f3 0f 1e fa          	endbr64 
  8048ed:	55                   	push   rbp
  8048ee:	48 89 e5             	mov    rbp,rsp
  8048f1:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    //
    int n=size/CHUNK_SIZE+size%CHUNK_SIZE?1:0;
  8048f4:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8048f7:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8048fd:	85 c0                	test   eax,eax
  8048ff:	0f 48 c2             	cmovs  eax,edx
  804902:	c1 f8 0c             	sar    eax,0xc
  804905:	89 c1                	mov    ecx,eax
  804907:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80490a:	99                   	cdq    
  80490b:	c1 ea 14             	shr    edx,0x14
  80490e:	01 d0                	add    eax,edx
  804910:	25 ff 0f 00 00       	and    eax,0xfff
  804915:	29 d0                	sub    eax,edx
  804917:	01 c8                	add    eax,ecx
  804919:	85 c0                	test   eax,eax
  80491b:	0f 95 c0             	setne  al
  80491e:	0f b6 c0             	movzx  eax,al
  804921:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    chunk_header *hp=(chunk_header*)task[cur_proc].mem_struct.heap_base;
  804924:	8b 05 02 0d c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10d02]        # 41562c <cur_proc>
  80492a:	48 98                	cdqe   
  80492c:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804933:	48 05 c8 84 40 00    	add    rax,0x4084c8
  804939:	8b 00                	mov    eax,DWORD PTR [rax]
  80493b:	48 98                	cdqe   
  80493d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804941:	eb 0c                	jmp    80494f <sys_malloc+0x66>
        hp=hp->next;
  804943:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804947:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80494b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  80494f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804953:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804957:	48 85 c0             	test   rax,rax
  80495a:	74 16                	je     804972 <sys_malloc+0x89>
  80495c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804960:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804963:	85 c0                	test   eax,eax
  804965:	75 0b                	jne    804972 <sys_malloc+0x89>
  804967:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80496b:	8b 00                	mov    eax,DWORD PTR [rax]
  80496d:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804970:	7e d1                	jle    804943 <sys_malloc+0x5a>
    if(hp->pgn<n)
  804972:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804976:	8b 00                	mov    eax,DWORD PTR [rax]
  804978:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  80497b:	7e 7f                	jle    8049fc <sys_malloc+0x113>
    {
        //上抬heap top
        if(task[cur_proc].mem_struct.heap_top+CHUNK_SIZE*n>=HEAP_MAXTOP)
  80497d:	8b 05 a9 0c c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10ca9]        # 41562c <cur_proc>
  804983:	48 98                	cdqe   
  804985:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80498c:	48 05 cc 84 40 00    	add    rax,0x4084cc
  804992:	8b 10                	mov    edx,DWORD PTR [rax]
  804994:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804997:	c1 e0 0c             	shl    eax,0xc
  80499a:	01 d0                	add    eax,edx
  80499c:	3d ff ff ef 01       	cmp    eax,0x1efffff
  8049a1:	7e 0a                	jle    8049ad <sys_malloc+0xc4>
        {
            //超过顶部
            return NULL;
  8049a3:	b8 00 00 00 00       	mov    eax,0x0
  8049a8:	e9 c8 00 00 00       	jmp    804a75 <sys_malloc+0x18c>
        }
        int needed=n-hp->pgn;
  8049ad:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8049b1:	8b 10                	mov    edx,DWORD PTR [rax]
  8049b3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8049b6:	29 d0                	sub    eax,edx
  8049b8:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
        char* p=task[cur_proc].mem_struct.heap_top;
  8049bb:	8b 05 6b 0c c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10c6b]        # 41562c <cur_proc>
  8049c1:	48 98                	cdqe   
  8049c3:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8049ca:	48 05 cc 84 40 00    	add    rax,0x4084cc
  8049d0:	8b 00                	mov    eax,DWORD PTR [rax]
  8049d2:	48 98                	cdqe   
  8049d4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  8049d8:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8049df:	eb 13                	jmp    8049f4 <sys_malloc+0x10b>
        {
            *p=0;//触发缺页中断
  8049e1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8049e5:	c6 00 00             	mov    BYTE PTR [rax],0x0
            p+=PAGE_SIZE;
  8049e8:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  8049ef:	00 
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  8049f0:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8049f4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8049f7:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  8049fa:	7c e5                	jl     8049e1 <sys_malloc+0xf8>
        }
    }
    if(hp->pgn>n)
  8049fc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a00:	8b 00                	mov    eax,DWORD PTR [rax]
  804a02:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804a05:	7d 59                	jge    804a60 <sys_malloc+0x177>
    {
        //在后面新建一个头
        char *p=hp;
  804a07:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a0b:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        p+=(n+1)*CHUNK_SIZE;//算上存储头一个
  804a0f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804a12:	83 c0 01             	add    eax,0x1
  804a15:	c1 e0 0c             	shl    eax,0xc
  804a18:	48 98                	cdqe   
  804a1a:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
        chunk_header *np=p;
  804a1e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804a22:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
        np->pgn=hp->pgn-n-1;
  804a26:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a2a:	8b 00                	mov    eax,DWORD PTR [rax]
  804a2c:	2b 45 e8             	sub    eax,DWORD PTR [rbp-0x18]
  804a2f:	8d 50 ff             	lea    edx,[rax-0x1]
  804a32:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804a36:	89 10                	mov    DWORD PTR [rax],edx
        np->next=hp->next;
  804a38:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a3c:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  804a40:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804a44:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
        np->prev=hp;
  804a48:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804a4c:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804a50:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
        hp->next=np;
  804a54:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a58:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804a5c:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    }
    hp->alloc=1;//分配完毕
  804a60:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a64:	c7 40 04 01 00 00 00 	mov    DWORD PTR [rax+0x4],0x1
    return (char*)hp+CHUNK_SIZE;//返回后边的第一个数据块地址
  804a6b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a6f:	48 05 00 10 00 00    	add    rax,0x1000
}
  804a75:	5d                   	pop    rbp
  804a76:	c3                   	ret    

0000000000804a77 <sys_free>:
int sys_free(int ptr)
{
  804a77:	f3 0f 1e fa          	endbr64 
  804a7b:	55                   	push   rbp
  804a7c:	48 89 e5             	mov    rbp,rsp
  804a7f:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    chunk_header *hp=ptr-CHUNK_SIZE;//回退到头
  804a82:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804a85:	2d 00 10 00 00       	sub    eax,0x1000
  804a8a:	48 98                	cdqe   
  804a8c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    hp->alloc=0;    //合并
  804a90:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804a94:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
    //向后合并
    chunk_header *p=hp->next;
  804a9b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804a9f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804aa3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804aa7:	eb 2e                	jmp    804ad7 <sys_free+0x60>
    {
        if(p->alloc==0)
  804aa9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804aad:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804ab0:	85 c0                	test   eax,eax
  804ab2:	75 2c                	jne    804ae0 <sys_free+0x69>
        {
            hp->pgn+=p->pgn+1;//把区域合并
  804ab4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804ab8:	8b 10                	mov    edx,DWORD PTR [rax]
  804aba:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804abe:	8b 00                	mov    eax,DWORD PTR [rax]
  804ac0:	83 c0 01             	add    eax,0x1
  804ac3:	01 c2                	add    edx,eax
  804ac5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804ac9:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->next;
  804acb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804acf:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804ad3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804ad7:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804adc:	75 cb                	jne    804aa9 <sys_free+0x32>
  804ade:	eb 01                	jmp    804ae1 <sys_free+0x6a>
            break;
  804ae0:	90                   	nop
    }
    //向前合并
    p=hp->prev;
  804ae1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804ae5:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  804ae9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804aed:	eb 2e                	jmp    804b1d <sys_free+0xa6>
    {
        if(p->alloc==0)
  804aef:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804af3:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804af6:	85 c0                	test   eax,eax
  804af8:	75 2c                	jne    804b26 <sys_free+0xaf>
        {
            p->pgn+=hp->pgn+1;//把区域合并
  804afa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804afe:	8b 10                	mov    edx,DWORD PTR [rax]
  804b00:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b04:	8b 00                	mov    eax,DWORD PTR [rax]
  804b06:	83 c0 01             	add    eax,0x1
  804b09:	01 c2                	add    edx,eax
  804b0b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b0f:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->prev;
  804b11:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b15:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  804b19:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804b1d:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804b22:	75 cb                	jne    804aef <sys_free+0x78>
  804b24:	eb 01                	jmp    804b27 <sys_free+0xb0>
            break;
  804b26:	90                   	nop
    }
    //合并完成
    return 0;
  804b27:	b8 00 00 00 00       	mov    eax,0x0
}
  804b2c:	5d                   	pop    rbp
  804b2d:	c3                   	ret    

0000000000804b2e <switch_to>:

void switch_to(struct process *from, struct process *to) {
  804b2e:	f3 0f 1e fa          	endbr64 
  804b32:	55                   	push   rbp
  804b33:	48 89 e5             	mov    rbp,rsp
  804b36:	53                   	push   rbx
  804b37:	48 89 7d f0          	mov    QWORD PTR [rbp-0x10],rdi
  804b3b:	48 89 75 e8          	mov    QWORD PTR [rbp-0x18],rsi
    cur_proc=to-task;
  804b3f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804b43:	48 2d a0 84 40 00    	sub    rax,0x4084a0
  804b49:	48 c1 f8 02          	sar    rax,0x2
  804b4d:	48 89 c2             	mov    rdx,rax
  804b50:	48 b8 f7 c0 46 ef 8a 	movabs rax,0x2697cc8aef46c0f7
  804b57:	cc 97 26 
  804b5a:	48 0f af c2          	imul   rax,rdx
  804b5e:	89 05 c8 0a c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10ac8],eax        # 41562c <cur_proc>
    current=&task[cur_proc];
  804b64:	8b 05 c2 0a c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10ac2]        # 41562c <cur_proc>
  804b6a:	48 98                	cdqe   
  804b6c:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804b73:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804b79:	48 89 05 20 0a c1 ff 	mov    QWORD PTR [rip+0xffffffffffc10a20],rax        # 4155a0 <current>
    asm volatile("mov %0,%%rax\n"
  804b80:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804b84:	48 8b 80 c0 00 00 00 	mov    rax,QWORD PTR [rax+0xc0]
  804b8b:	0f 22 d8             	mov    cr3,rax
                 "mov %%rax,%%cr3\n":"=m"(to->pml4));
    asm volatile("mov %%rsp,%0\r\n"
  804b8e:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  804b92:	4c 8b 55 f0          	mov    r10,QWORD PTR [rbp-0x10]
  804b96:	4c 8b 5d f0          	mov    r11,QWORD PTR [rbp-0x10]
  804b9a:	48 8b 5d f0          	mov    rbx,QWORD PTR [rbp-0x10]
  804b9e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804ba2:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804ba6:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  804baa:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  804bae:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  804bb2:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  804bb6:	49 89 a1 7c 02 00 00 	mov    QWORD PTR [r9+0x27c],rsp
  804bbd:	48 8d 05 24 00 00 00 	lea    rax,[rip+0x24]        # 804be8 <done>
  804bc4:	49 89 82 4c 02 00 00 	mov    QWORD PTR [r10+0x24c],rax
  804bcb:	41 8c a3 bc 02 00 00 	mov    WORD PTR [r11+0x2bc],fs
  804bd2:	8c ab c4 02 00 00    	mov    WORD PTR [rbx+0x2c4],gs
  804bd8:	48 8b a1 7c 02 00 00 	mov    rsp,QWORD PTR [rcx+0x27c]
  804bdf:	41 ff b0 4c 02 00 00 	push   QWORD PTR [r8+0x24c]
  804be6:	eb 08                	jmp    804bf0 <__switch_to>

0000000000804be8 <done>:
  804be8:	90                   	nop
                 "nop":"=m"(from->regs.rsp),"=m"(from->regs.rip),
                 "=m"(from->regs.fs),"=m"(from->regs.gs):
                "m"(to->regs.fs),"m"(to->regs.gs),"m"(to->regs.rsp),"m"(to->regs.rip),
                "D"(from),"S"(to));

}
  804be9:	90                   	nop
  804bea:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804bee:	c9                   	leave  
  804bef:	c3                   	ret    

0000000000804bf0 <__switch_to>:
void __switch_to(struct process *from, struct process *to) {
  804bf0:	f3 0f 1e fa          	endbr64 
  804bf4:	55                   	push   rbp
  804bf5:	48 89 e5             	mov    rbp,rsp
  804bf8:	53                   	push   rbx
  804bf9:	48 83 ec 18          	sub    rsp,0x18
  804bfd:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  804c01:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804c05:	48 8b 05 74 7d 00 00 	mov    rax,QWORD PTR [rip+0x7d74]        # 80c980 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804c0c:	4c 8b 50 54          	mov    r10,QWORD PTR [rax+0x54]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804c10:	48 8b 05 69 7d 00 00 	mov    rax,QWORD PTR [rip+0x7d69]        # 80c980 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804c17:	4c 8b 48 4c          	mov    r9,QWORD PTR [rax+0x4c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804c1b:	48 8b 05 5e 7d 00 00 	mov    rax,QWORD PTR [rip+0x7d5e]        # 80c980 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804c22:	4c 8b 40 44          	mov    r8,QWORD PTR [rax+0x44]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804c26:	48 8b 05 53 7d 00 00 	mov    rax,QWORD PTR [rip+0x7d53]        # 80c980 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804c2d:	48 8b 78 3c          	mov    rdi,QWORD PTR [rax+0x3c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804c31:	48 8b 05 48 7d 00 00 	mov    rax,QWORD PTR [rip+0x7d48]        # 80c980 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804c38:	48 8b 58 34          	mov    rbx,QWORD PTR [rax+0x34]
  804c3c:	48 8b 05 3d 7d 00 00 	mov    rax,QWORD PTR [rip+0x7d3d]        # 80c980 <tss>
  804c43:	4c 8b 58 2c          	mov    r11,QWORD PTR [rax+0x2c]
  804c47:	48 8b 05 32 7d 00 00 	mov    rax,QWORD PTR [rip+0x7d32]        # 80c980 <tss>
  804c4e:	48 8b 48 24          	mov    rcx,QWORD PTR [rax+0x24]
  804c52:	48 8b 05 27 7d 00 00 	mov    rax,QWORD PTR [rip+0x7d27]        # 80c980 <tss>
  804c59:	48 8b 50 14          	mov    rdx,QWORD PTR [rax+0x14]
  804c5d:	48 8b 05 1c 7d 00 00 	mov    rax,QWORD PTR [rip+0x7d1c]        # 80c980 <tss>
  804c64:	48 8b 70 0c          	mov    rsi,QWORD PTR [rax+0xc]
  804c68:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804c6c:	48 8b 80 dc 01 00 00 	mov    rax,QWORD PTR [rax+0x1dc]
  804c73:	41 52                	push   r10
  804c75:	41 51                	push   r9
  804c77:	41 50                	push   r8
  804c79:	57                   	push   rdi
  804c7a:	49 89 d9             	mov    r9,rbx
  804c7d:	4d 89 d8             	mov    r8,r11
  804c80:	48 89 c7             	mov    rdi,rax
  804c83:	e8 34 00 00 00       	call   804cbc <set_tss>
  804c88:	48 83 c4 20          	add    rsp,0x20
    asm volatile("mov %%fs,%0\r\n"
  804c8c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804c90:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  804c94:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804c98:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  804c9c:	8c a0 bc 02 00 00    	mov    WORD PTR [rax+0x2bc],fs
  804ca2:	8c ae c4 02 00 00    	mov    WORD PTR [rsi+0x2c4],gs
  804ca8:	8e a2 bc 02 00 00    	mov    fs,WORD PTR [rdx+0x2bc]
  804cae:	8e a9 c4 02 00 00    	mov    gs,WORD PTR [rcx+0x2c4]
  804cb4:	fb                   	sti    
                 "mov %%gs,%1\r\n"
                 "mov %2,%%fs\r\n"
                 "mov %3,%%gs\r\n"
                 "sti":"=m"(to->regs.fs),"=m"(to->regs.gs):
                 "m"(from->regs.fs),"m"(from->regs.gs));
}
  804cb5:	90                   	nop
  804cb6:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804cba:	c9                   	leave  
  804cbb:	c3                   	ret    

0000000000804cbc <set_tss>:

void set_tss(u64 rsp0,u64 rsp1,u64 rsp2,u64 ist0,u64 ist1,u64 ist2,u64 ist3,u64 ist4,u64 ist5,u64 ist6){
  804cbc:	f3 0f 1e fa          	endbr64 
  804cc0:	55                   	push   rbp
  804cc1:	48 89 e5             	mov    rbp,rsp
  804cc4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  804cc8:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  804ccc:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  804cd0:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  804cd4:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
  804cd8:	4c 89 4d d0          	mov    QWORD PTR [rbp-0x30],r9
    tss->rsp0=rsp0;
  804cdc:	48 8b 05 9d 7c 00 00 	mov    rax,QWORD PTR [rip+0x7c9d]        # 80c980 <tss>
  804ce3:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804ce7:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx
    tss->rsp1=rsp1;
  804ceb:	48 8b 05 8e 7c 00 00 	mov    rax,QWORD PTR [rip+0x7c8e]        # 80c980 <tss>
  804cf2:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  804cf6:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    tss->rsp2=rsp2;
  804cfa:	48 8b 05 7f 7c 00 00 	mov    rax,QWORD PTR [rip+0x7c7f]        # 80c980 <tss>
  804d01:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804d05:	48 89 50 14          	mov    QWORD PTR [rax+0x14],rdx
    tss->ists[0]=ist0;
  804d09:	48 8b 05 70 7c 00 00 	mov    rax,QWORD PTR [rip+0x7c70]        # 80c980 <tss>
  804d10:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  804d14:	48 89 50 24          	mov    QWORD PTR [rax+0x24],rdx
    tss->ists[1]=ist1;
  804d18:	48 8b 05 61 7c 00 00 	mov    rax,QWORD PTR [rip+0x7c61]        # 80c980 <tss>
  804d1f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  804d23:	48 89 50 2c          	mov    QWORD PTR [rax+0x2c],rdx
    tss->ists[2]=ist2;
  804d27:	48 8b 05 52 7c 00 00 	mov    rax,QWORD PTR [rip+0x7c52]        # 80c980 <tss>
  804d2e:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804d32:	48 89 50 34          	mov    QWORD PTR [rax+0x34],rdx
    tss->ists[3]=ist3;
  804d36:	48 8b 05 43 7c 00 00 	mov    rax,QWORD PTR [rip+0x7c43]        # 80c980 <tss>
  804d3d:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  804d41:	48 89 50 3c          	mov    QWORD PTR [rax+0x3c],rdx
    tss->ists[4]=ist4;
  804d45:	48 8b 05 34 7c 00 00 	mov    rax,QWORD PTR [rip+0x7c34]        # 80c980 <tss>
  804d4c:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  804d50:	48 89 50 44          	mov    QWORD PTR [rax+0x44],rdx
    tss->ists[5]=ist5;
  804d54:	48 8b 05 25 7c 00 00 	mov    rax,QWORD PTR [rip+0x7c25]        # 80c980 <tss>
  804d5b:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  804d5f:	48 89 50 4c          	mov    QWORD PTR [rax+0x4c],rdx
    tss->ists[6]=ist6;
  804d63:	48 8b 05 16 7c 00 00 	mov    rax,QWORD PTR [rip+0x7c16]        # 80c980 <tss>
  804d6a:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  804d6e:	48 89 50 54          	mov    QWORD PTR [rax+0x54],rdx
}
  804d72:	90                   	nop
  804d73:	5d                   	pop    rbp
  804d74:	c3                   	ret    

0000000000804d75 <fork_child_ret>:

int fork_child_ret(){
  804d75:	f3 0f 1e fa          	endbr64 
  804d79:	55                   	push   rbp
  804d7a:	48 89 e5             	mov    rbp,rsp
    return 0;
  804d7d:	b8 00 00 00 00       	mov    eax,0x0

}
  804d82:	5d                   	pop    rbp
  804d83:	c3                   	ret    

0000000000804d84 <sys_fork>:

int sys_fork(void){
  804d84:	f3 0f 1e fa          	endbr64 
  804d88:	55                   	push   rbp
  804d89:	48 89 e5             	mov    rbp,rsp
  804d8c:	53                   	push   rbx
  804d8d:	48 83 ec 58          	sub    rsp,0x58
    int pid=req_proc();
  804d91:	b8 00 00 00 00       	mov    eax,0x0
  804d96:	e8 f6 ee ff ff       	call   803c91 <req_proc>
  804d9b:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(pid==-1)return -1;
  804d9e:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  804da2:	75 0a                	jne    804dae <sys_fork+0x2a>
  804da4:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804da9:	e9 7a 07 00 00       	jmp    805528 <sys_fork+0x7a4>
    task[pid].regs=current->regs;
  804dae:	48 8b 05 eb 07 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc107eb]        # 4155a0 <current>
  804db5:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  804db8:	48 63 d2             	movsxd rdx,edx
  804dbb:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  804dc2:	48 81 c2 e0 86 40 00 	add    rdx,0x4086e0
  804dc9:	48 8b 88 44 02 00 00 	mov    rcx,QWORD PTR [rax+0x244]
  804dd0:	48 8b 98 4c 02 00 00 	mov    rbx,QWORD PTR [rax+0x24c]
  804dd7:	48 89 4a 04          	mov    QWORD PTR [rdx+0x4],rcx
  804ddb:	48 89 5a 0c          	mov    QWORD PTR [rdx+0xc],rbx
  804ddf:	48 8b 88 54 02 00 00 	mov    rcx,QWORD PTR [rax+0x254]
  804de6:	48 8b 98 5c 02 00 00 	mov    rbx,QWORD PTR [rax+0x25c]
  804ded:	48 89 4a 14          	mov    QWORD PTR [rdx+0x14],rcx
  804df1:	48 89 5a 1c          	mov    QWORD PTR [rdx+0x1c],rbx
  804df5:	48 8b 88 64 02 00 00 	mov    rcx,QWORD PTR [rax+0x264]
  804dfc:	48 8b 98 6c 02 00 00 	mov    rbx,QWORD PTR [rax+0x26c]
  804e03:	48 89 4a 24          	mov    QWORD PTR [rdx+0x24],rcx
  804e07:	48 89 5a 2c          	mov    QWORD PTR [rdx+0x2c],rbx
  804e0b:	48 8b 88 74 02 00 00 	mov    rcx,QWORD PTR [rax+0x274]
  804e12:	48 8b 98 7c 02 00 00 	mov    rbx,QWORD PTR [rax+0x27c]
  804e19:	48 89 4a 34          	mov    QWORD PTR [rdx+0x34],rcx
  804e1d:	48 89 5a 3c          	mov    QWORD PTR [rdx+0x3c],rbx
  804e21:	48 8b 88 84 02 00 00 	mov    rcx,QWORD PTR [rax+0x284]
  804e28:	48 8b 98 8c 02 00 00 	mov    rbx,QWORD PTR [rax+0x28c]
  804e2f:	48 89 4a 44          	mov    QWORD PTR [rdx+0x44],rcx
  804e33:	48 89 5a 4c          	mov    QWORD PTR [rdx+0x4c],rbx
  804e37:	48 8b 88 94 02 00 00 	mov    rcx,QWORD PTR [rax+0x294]
  804e3e:	48 8b 98 9c 02 00 00 	mov    rbx,QWORD PTR [rax+0x29c]
  804e45:	48 89 4a 54          	mov    QWORD PTR [rdx+0x54],rcx
  804e49:	48 89 5a 5c          	mov    QWORD PTR [rdx+0x5c],rbx
  804e4d:	48 8b 88 a4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2a4]
  804e54:	48 8b 98 ac 02 00 00 	mov    rbx,QWORD PTR [rax+0x2ac]
  804e5b:	48 89 4a 64          	mov    QWORD PTR [rdx+0x64],rcx
  804e5f:	48 89 5a 6c          	mov    QWORD PTR [rdx+0x6c],rbx
  804e63:	48 8b 88 b4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2b4]
  804e6a:	48 8b 98 bc 02 00 00 	mov    rbx,QWORD PTR [rax+0x2bc]
  804e71:	48 89 4a 74          	mov    QWORD PTR [rdx+0x74],rcx
  804e75:	48 89 5a 7c          	mov    QWORD PTR [rdx+0x7c],rbx
  804e79:	48 8b 88 c4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2c4]
  804e80:	48 8b 98 cc 02 00 00 	mov    rbx,QWORD PTR [rax+0x2cc]
  804e87:	48 89 8a 84 00 00 00 	mov    QWORD PTR [rdx+0x84],rcx
  804e8e:	48 89 9a 8c 00 00 00 	mov    QWORD PTR [rdx+0x8c],rbx
  804e95:	48 8b 88 d4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2d4]
  804e9c:	48 8b 98 dc 02 00 00 	mov    rbx,QWORD PTR [rax+0x2dc]
  804ea3:	48 89 8a 94 00 00 00 	mov    QWORD PTR [rdx+0x94],rcx
  804eaa:	48 89 9a 9c 00 00 00 	mov    QWORD PTR [rdx+0x9c],rbx
  804eb1:	48 8b 88 e4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2e4]
  804eb8:	48 8b 98 ec 02 00 00 	mov    rbx,QWORD PTR [rax+0x2ec]
  804ebf:	48 89 8a a4 00 00 00 	mov    QWORD PTR [rdx+0xa4],rcx
  804ec6:	48 89 9a ac 00 00 00 	mov    QWORD PTR [rdx+0xac],rbx
  804ecd:	48 8b 88 f4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2f4]
  804ed4:	48 8b 98 fc 02 00 00 	mov    rbx,QWORD PTR [rax+0x2fc]
  804edb:	48 89 8a b4 00 00 00 	mov    QWORD PTR [rdx+0xb4],rcx
  804ee2:	48 89 9a bc 00 00 00 	mov    QWORD PTR [rdx+0xbc],rbx
  804ee9:	48 8b 88 04 03 00 00 	mov    rcx,QWORD PTR [rax+0x304]
  804ef0:	48 8b 98 0c 03 00 00 	mov    rbx,QWORD PTR [rax+0x30c]
  804ef7:	48 89 8a c4 00 00 00 	mov    QWORD PTR [rdx+0xc4],rcx
  804efe:	48 89 9a cc 00 00 00 	mov    QWORD PTR [rdx+0xcc],rbx
    //使得子程序处于刚调用完系统调用的状态
    task[pid].regs.rip=ret_normal_proc;
  804f05:	ba 91 c8 80 00       	mov    edx,0x80c891
  804f0a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804f0d:	48 98                	cdqe   
  804f0f:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804f16:	48 05 e0 86 40 00    	add    rax,0x4086e0
  804f1c:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    task[pid].regs.rsp-=sizeof(stack_store_regs);
  804f20:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804f23:	48 98                	cdqe   
  804f25:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804f2c:	48 05 10 87 40 00    	add    rax,0x408710
  804f32:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804f36:	48 2d a8 00 00 00    	sub    rax,0xa8
  804f3c:	48 89 c2             	mov    rdx,rax
  804f3f:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804f42:	48 98                	cdqe   
  804f44:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804f4b:	48 05 10 87 40 00    	add    rax,0x408710
  804f51:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    task[pid].sid=current->sid;
  804f55:	48 8b 05 44 06 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc10644]        # 4155a0 <current>
  804f5c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  804f5f:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  804f62:	48 63 d2             	movsxd rdx,edx
  804f65:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  804f6c:	48 81 c2 a8 84 40 00 	add    rdx,0x4084a8
  804f73:	89 02                	mov    DWORD PTR [rdx],eax
    task[pid].gpid=current->gpid;
  804f75:	48 8b 05 24 06 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc10624]        # 4155a0 <current>
  804f7c:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804f7f:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  804f82:	48 63 d2             	movsxd rdx,edx
  804f85:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  804f8c:	48 81 c2 a4 84 40 00 	add    rdx,0x4084a4
  804f93:	89 02                	mov    DWORD PTR [rdx],eax
    stack_store_regs *r=task[pid].regs.rsp;
  804f95:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804f98:	48 98                	cdqe   
  804f9a:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804fa1:	48 05 10 87 40 00    	add    rax,0x408710
  804fa7:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804fab:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    r->rax=0;
  804faf:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804fb3:	48 c7 40 78 00 00 00 	mov    QWORD PTR [rax+0x78],0x0
  804fba:	00 
    r->ds=DS_USER;
  804fbb:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804fbf:	48 c7 00 28 00 00 00 	mov    QWORD PTR [rax],0x28
    r->ss=DS_USER;
  804fc6:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804fca:	48 c7 80 a0 00 00 00 	mov    QWORD PTR [rax+0xa0],0x28
  804fd1:	28 00 00 00 
    r->es=DS_USER;
  804fd5:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804fd9:	48 c7 40 08 28 00 00 	mov    QWORD PTR [rax+0x8],0x28
  804fe0:	00 
    r->rax=task[pid].regs.rax;
  804fe1:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804fe4:	48 98                	cdqe   
  804fe6:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804fed:	48 05 f0 86 40 00    	add    rax,0x4086f0
  804ff3:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804ff7:	48 89 c2             	mov    rdx,rax
  804ffa:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804ffe:	48 89 50 78          	mov    QWORD PTR [rax+0x78],rdx
    r->rbx=task[pid].regs.rbx;
  805002:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805005:	48 98                	cdqe   
  805007:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80500e:	48 05 10 87 40 00    	add    rax,0x408710
  805014:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  805018:	48 89 c2             	mov    rdx,rax
  80501b:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80501f:	48 89 50 70          	mov    QWORD PTR [rax+0x70],rdx
    r->rcx=task[pid].regs.rcx;
  805023:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805026:	48 98                	cdqe   
  805028:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80502f:	48 05 00 87 40 00    	add    rax,0x408700
  805035:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  805039:	48 89 c2             	mov    rdx,rax
  80503c:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805040:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    r->rdx=task[pid].regs.rdx;
  805044:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805047:	48 98                	cdqe   
  805049:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805050:	48 05 00 87 40 00    	add    rax,0x408700
  805056:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  80505a:	48 89 c2             	mov    rdx,rax
  80505d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805061:	48 89 50 60          	mov    QWORD PTR [rax+0x60],rdx
    r->rsi=task[pid].regs.rsi;
  805065:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805068:	48 98                	cdqe   
  80506a:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805071:	48 05 20 87 40 00    	add    rax,0x408720
  805077:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  80507b:	48 89 c2             	mov    rdx,rax
  80507e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805082:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
    r->rdi=task[pid].regs.rdi;
  805086:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805089:	48 98                	cdqe   
  80508b:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805092:	48 05 30 87 40 00    	add    rax,0x408730
  805098:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  80509c:	48 89 c2             	mov    rdx,rax
  80509f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8050a3:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx

    r->r8 =task[pid].regs.r8 ;
  8050a7:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8050aa:	48 98                	cdqe   
  8050ac:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8050b3:	48 05 60 87 40 00    	add    rax,0x408760
  8050b9:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8050bd:	48 89 c2             	mov    rdx,rax
  8050c0:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8050c4:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    r->r9 =task[pid].regs.r9 ;
  8050c8:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8050cb:	48 98                	cdqe   
  8050cd:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8050d4:	48 05 70 87 40 00    	add    rax,0x408770
  8050da:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  8050de:	48 89 c2             	mov    rdx,rax
  8050e1:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8050e5:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    r->r10=task[pid].regs.r10;
  8050e9:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8050ec:	48 98                	cdqe   
  8050ee:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8050f5:	48 05 70 87 40 00    	add    rax,0x408770
  8050fb:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8050ff:	48 89 c2             	mov    rdx,rax
  805102:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805106:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
    r->r11=task[pid].regs.r11;
  80510a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80510d:	48 98                	cdqe   
  80510f:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805116:	48 05 80 87 40 00    	add    rax,0x408780
  80511c:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  805120:	48 89 c2             	mov    rdx,rax
  805123:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805127:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
    r->r12=task[pid].regs.r12;
  80512b:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80512e:	48 98                	cdqe   
  805130:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805137:	48 05 80 87 40 00    	add    rax,0x408780
  80513d:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  805141:	48 89 c2             	mov    rdx,rax
  805144:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805148:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
    r->r13=task[pid].regs.r13;
  80514c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80514f:	48 98                	cdqe   
  805151:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805158:	48 05 90 87 40 00    	add    rax,0x408790
  80515e:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  805162:	48 89 c2             	mov    rdx,rax
  805165:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805169:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
    r->r14=task[pid].regs.r14;
  80516d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805170:	48 98                	cdqe   
  805172:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805179:	48 05 90 87 40 00    	add    rax,0x408790
  80517f:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  805183:	48 89 c2             	mov    rdx,rax
  805186:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80518a:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    r->r15=task[pid].regs.r15;
  80518e:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805191:	48 98                	cdqe   
  805193:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80519a:	48 05 a0 87 40 00    	add    rax,0x4087a0
  8051a0:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  8051a4:	48 89 c2             	mov    rdx,rax
  8051a7:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8051ab:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx

    asm volatile("mov %%r10,%0"::"m"(r->rip));
  8051af:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8051b3:	4c 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],r10

    task[pid].tss=current->tss;
  8051ba:	48 8b 05 df 03 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc103df]        # 4155a0 <current>
  8051c1:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  8051c4:	48 63 d2             	movsxd rdx,edx
  8051c7:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  8051ce:	48 81 c2 70 86 40 00 	add    rdx,0x408670
  8051d5:	48 8b 88 d8 01 00 00 	mov    rcx,QWORD PTR [rax+0x1d8]
  8051dc:	48 8b 98 e0 01 00 00 	mov    rbx,QWORD PTR [rax+0x1e0]
  8051e3:	48 89 4a 08          	mov    QWORD PTR [rdx+0x8],rcx
  8051e7:	48 89 5a 10          	mov    QWORD PTR [rdx+0x10],rbx
  8051eb:	48 8b 88 e8 01 00 00 	mov    rcx,QWORD PTR [rax+0x1e8]
  8051f2:	48 8b 98 f0 01 00 00 	mov    rbx,QWORD PTR [rax+0x1f0]
  8051f9:	48 89 4a 18          	mov    QWORD PTR [rdx+0x18],rcx
  8051fd:	48 89 5a 20          	mov    QWORD PTR [rdx+0x20],rbx
  805201:	48 8b 88 f8 01 00 00 	mov    rcx,QWORD PTR [rax+0x1f8]
  805208:	48 8b 98 00 02 00 00 	mov    rbx,QWORD PTR [rax+0x200]
  80520f:	48 89 4a 28          	mov    QWORD PTR [rdx+0x28],rcx
  805213:	48 89 5a 30          	mov    QWORD PTR [rdx+0x30],rbx
  805217:	48 8b 88 08 02 00 00 	mov    rcx,QWORD PTR [rax+0x208]
  80521e:	48 8b 98 10 02 00 00 	mov    rbx,QWORD PTR [rax+0x210]
  805225:	48 89 4a 38          	mov    QWORD PTR [rdx+0x38],rcx
  805229:	48 89 5a 40          	mov    QWORD PTR [rdx+0x40],rbx
  80522d:	48 8b 88 18 02 00 00 	mov    rcx,QWORD PTR [rax+0x218]
  805234:	48 8b 98 20 02 00 00 	mov    rbx,QWORD PTR [rax+0x220]
  80523b:	48 89 4a 48          	mov    QWORD PTR [rdx+0x48],rcx
  80523f:	48 89 5a 50          	mov    QWORD PTR [rdx+0x50],rbx
  805243:	48 8b 88 28 02 00 00 	mov    rcx,QWORD PTR [rax+0x228]
  80524a:	48 8b 98 30 02 00 00 	mov    rbx,QWORD PTR [rax+0x230]
  805251:	48 89 4a 58          	mov    QWORD PTR [rdx+0x58],rcx
  805255:	48 89 5a 60          	mov    QWORD PTR [rdx+0x60],rbx
  805259:	48 8b 88 38 02 00 00 	mov    rcx,QWORD PTR [rax+0x238]
  805260:	48 89 4a 68          	mov    QWORD PTR [rdx+0x68],rcx
  805264:	8b 80 40 02 00 00    	mov    eax,DWORD PTR [rax+0x240]
  80526a:	89 42 70             	mov    DWORD PTR [rdx+0x70],eax
    task[pid].stat=READY;
  80526d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805270:	48 98                	cdqe   
  805272:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805279:	48 05 b8 84 40 00    	add    rax,0x4084b8
  80527f:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[pid].parent_pid=cur_proc;
  805285:	8b 05 a1 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc103a1]        # 41562c <cur_proc>
  80528b:	89 c2                	mov    edx,eax
  80528d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805290:	48 98                	cdqe   
  805292:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805299:	48 05 3c 85 40 00    	add    rax,0x40853c
  80529f:	89 10                	mov    DWORD PTR [rax],edx
    //复制打开文件
    memcpy(task[pid].openf,current->openf,sizeof(struct file*)*MAX_PROC_OPENF);
  8052a1:	48 8b 05 f8 02 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc102f8]        # 4155a0 <current>
  8052a8:	48 8d 88 d8 00 00 00 	lea    rcx,[rax+0xd8]
  8052af:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8052b2:	48 98                	cdqe   
  8052b4:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8052bb:	48 05 d0 00 00 00    	add    rax,0xd0
  8052c1:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8052c7:	48 83 c0 08          	add    rax,0x8
  8052cb:	ba 00 01 00 00       	mov    edx,0x100
  8052d0:	48 89 ce             	mov    rsi,rcx
  8052d3:	48 89 c7             	mov    rdi,rax
  8052d6:	e8 1a 6c 00 00       	call   80bef5 <memcpy>
    task[pid].utime=0;
  8052db:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8052de:	48 98                	cdqe   
  8052e0:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8052e7:	48 05 bc 84 40 00    	add    rax,0x4084bc
  8052ed:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[pid].mem_struct=current->mem_struct;
  8052f3:	48 8b 0d a6 02 c1 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc102a6]        # 4155a0 <current>
  8052fa:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8052fd:	48 98                	cdqe   
  8052ff:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805306:	48 8d b0 c0 84 40 00 	lea    rsi,[rax+0x4084c0]
  80530d:	48 8b 41 28          	mov    rax,QWORD PTR [rcx+0x28]
  805311:	48 8b 51 30          	mov    rdx,QWORD PTR [rcx+0x30]
  805315:	48 89 46 08          	mov    QWORD PTR [rsi+0x8],rax
  805319:	48 89 56 10          	mov    QWORD PTR [rsi+0x10],rdx
  80531d:	48 8b 41 38          	mov    rax,QWORD PTR [rcx+0x38]
  805321:	48 8b 51 40          	mov    rdx,QWORD PTR [rcx+0x40]
  805325:	48 89 46 18          	mov    QWORD PTR [rsi+0x18],rax
  805329:	48 89 56 20          	mov    QWORD PTR [rsi+0x20],rdx
    //TODO:根据是子进程还是父进程设置返回值的不同

    //TODO:设置新堆栈
    //复制父进程的内存映射到子进程，然后重新映射并复制子进程的堆栈和数据段
    copy_mmap(current,&task[pid]);
  80532d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805330:	48 98                	cdqe   
  805332:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805339:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  805340:	48 8b 05 59 02 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc10259]        # 4155a0 <current>
  805347:	48 89 d6             	mov    rsi,rdx
  80534a:	48 89 c7             	mov    rdi,rax
  80534d:	e8 de 04 00 00       	call   805830 <copy_mmap>
    /*
     * 这里使用vmalloc是一个权宜之策。
     * 本来是分配用户空间内存的，但是这样的话当前进程内存空间下就访问不到这个新申请的内存了（除非mmap一下），
     * 方便以前先用vmalloc。
     * */
    addr_t stk=task[pid].mem_struct.stack_top-PAGE_4K_SIZE;
  805352:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805355:	48 98                	cdqe   
  805357:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80535e:	48 05 d4 84 40 00    	add    rax,0x4084d4
  805364:	8b 00                	mov    eax,DWORD PTR [rax]
  805366:	2d 00 10 00 00       	sub    eax,0x1000
  80536b:	48 98                	cdqe   
  80536d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    for(;stk>=task[pid].mem_struct.stack_bottom;stk-=PAGE_4K_SIZE){
  805371:	eb 5b                	jmp    8053ce <sys_fork+0x64a>
        addr_t new_stkpg=vmalloc();
  805373:	b8 00 00 00 00       	mov    eax,0x0
  805378:	e8 80 be ff ff       	call   8011fd <vmalloc>
  80537d:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
        memcpy(new_stkpg,stk,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  805381:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  805385:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  805389:	ba 00 10 00 00       	mov    edx,0x1000
  80538e:	48 89 ce             	mov    rsi,rcx
  805391:	48 89 c7             	mov    rdi,rax
  805394:	e8 5c 6b 00 00       	call   80bef5 <memcpy>
        //把新的页面映射到进程页表里
        smmap(new_stkpg,stk,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  805399:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80539c:	48 98                	cdqe   
  80539e:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8053a5:	48 05 60 85 40 00    	add    rax,0x408560
  8053ab:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8053ae:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  8053b2:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8053b6:	48 89 d1             	mov    rcx,rdx
  8053b9:	ba 07 00 00 00       	mov    edx,0x7
  8053be:	48 89 c7             	mov    rdi,rax
  8053c1:	e8 e7 bb ff ff       	call   800fad <smmap>
    for(;stk>=task[pid].mem_struct.stack_bottom;stk-=PAGE_4K_SIZE){
  8053c6:	48 81 6d e8 00 10 00 	sub    QWORD PTR [rbp-0x18],0x1000
  8053cd:	00 
  8053ce:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8053d1:	48 98                	cdqe   
  8053d3:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8053da:	48 05 d0 84 40 00    	add    rax,0x4084d0
  8053e0:	8b 00                	mov    eax,DWORD PTR [rax]
  8053e2:	48 98                	cdqe   
  8053e4:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  8053e8:	73 89                	jae    805373 <sys_fork+0x5ef>
    }
    //中断使用的栈空间
    addr_t intstk=INT_STACK_TOP-PAGE_4K_SIZE;
  8053ea:	48 c7 45 e0 00 f0 7f 	mov    QWORD PTR [rbp-0x20],0x7ff000
  8053f1:	00 
    int f=1;
  8053f2:	c7 45 dc 01 00 00 00 	mov    DWORD PTR [rbp-0x24],0x1
    for(;intstk>=INT_STACK_BASE;intstk-=PAGE_4K_SIZE){
  8053f9:	e9 81 00 00 00       	jmp    80547f <sys_fork+0x6fb>
        addr_t new_stkpg=vmalloc();
  8053fe:	b8 00 00 00 00       	mov    eax,0x0
  805403:	e8 f5 bd ff ff       	call   8011fd <vmalloc>
  805408:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        memcpy(new_stkpg,intstk,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  80540c:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  805410:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805414:	ba 00 10 00 00       	mov    edx,0x1000
  805419:	48 89 ce             	mov    rsi,rcx
  80541c:	48 89 c7             	mov    rdi,rax
  80541f:	e8 d1 6a 00 00       	call   80bef5 <memcpy>
        if(f){
  805424:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  805428:	74 20                	je     80544a <sys_fork+0x6c6>
            f=0;
  80542a:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
            addr_t *raxp=new_stkpg+PAGE_4K_SIZE-56;//指向中断堆栈，里面存着rax的值
  805431:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805435:	48 05 c8 0f 00 00    	add    rax,0xfc8
  80543b:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
            *raxp=0;//这样进程切换到子进程的done标签，从时钟中断返回弹出堆栈的时候rax弹出来的就是0，成为返回值。
  80543f:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  805443:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
        }
        //把新的页面映射到进程页表里
        smmap(new_stkpg,intstk,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  80544a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80544d:	48 98                	cdqe   
  80544f:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805456:	48 05 60 85 40 00    	add    rax,0x408560
  80545c:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80545f:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  805463:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805467:	48 89 d1             	mov    rcx,rdx
  80546a:	ba 07 00 00 00       	mov    edx,0x7
  80546f:	48 89 c7             	mov    rdi,rax
  805472:	e8 36 bb ff ff       	call   800fad <smmap>
    for(;intstk>=INT_STACK_BASE;intstk-=PAGE_4K_SIZE){
  805477:	48 81 6d e0 00 10 00 	sub    QWORD PTR [rbp-0x20],0x1000
  80547e:	00 
  80547f:	48 81 7d e0 ff ef 7f 	cmp    QWORD PTR [rbp-0x20],0x7fefff
  805486:	00 
  805487:	0f 87 71 ff ff ff    	ja     8053fe <sys_fork+0x67a>
    }
    //堆
    addr_t hp=task[pid].mem_struct.heap_top-PAGE_4K_SIZE;
  80548d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805490:	48 98                	cdqe   
  805492:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805499:	48 05 cc 84 40 00    	add    rax,0x4084cc
  80549f:	8b 00                	mov    eax,DWORD PTR [rax]
  8054a1:	2d 00 10 00 00       	sub    eax,0x1000
  8054a6:	48 98                	cdqe   
  8054a8:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    for(;hp>=task[pid].mem_struct.heap_base;hp-=PAGE_4K_SIZE){
  8054ac:	eb 5b                	jmp    805509 <sys_fork+0x785>
        addr_t new_hppg=vmalloc();
  8054ae:	b8 00 00 00 00       	mov    eax,0x0
  8054b3:	e8 45 bd ff ff       	call   8011fd <vmalloc>
  8054b8:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        memcpy(new_hppg,hp,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  8054bc:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  8054c0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8054c4:	ba 00 10 00 00       	mov    edx,0x1000
  8054c9:	48 89 ce             	mov    rsi,rcx
  8054cc:	48 89 c7             	mov    rdi,rax
  8054cf:	e8 21 6a 00 00       	call   80bef5 <memcpy>
        //把新的页面映射到进程页表里
        smmap(new_hppg,hp,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  8054d4:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8054d7:	48 98                	cdqe   
  8054d9:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8054e0:	48 05 60 85 40 00    	add    rax,0x408560
  8054e6:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8054e9:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  8054ed:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8054f1:	48 89 d1             	mov    rcx,rdx
  8054f4:	ba 07 00 00 00       	mov    edx,0x7
  8054f9:	48 89 c7             	mov    rdi,rax
  8054fc:	e8 ac ba ff ff       	call   800fad <smmap>
    for(;hp>=task[pid].mem_struct.heap_base;hp-=PAGE_4K_SIZE){
  805501:	48 81 6d d0 00 10 00 	sub    QWORD PTR [rbp-0x30],0x1000
  805508:	00 
  805509:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80550c:	48 98                	cdqe   
  80550e:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805515:	48 05 c8 84 40 00    	add    rax,0x4084c8
  80551b:	8b 00                	mov    eax,DWORD PTR [rax]
  80551d:	48 98                	cdqe   
  80551f:	48 39 45 d0          	cmp    QWORD PTR [rbp-0x30],rax
  805523:	73 89                	jae    8054ae <sys_fork+0x72a>
    }
    //父进程运行到这里
    return pid;
  805525:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
}
  805528:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80552c:	c9                   	leave  
  80552d:	c3                   	ret    

000000000080552e <release_mmap>:
//释放进程页表映射的内存，内核空间除外。
void release_mmap(struct process* p){
  80552e:	f3 0f 1e fa          	endbr64 
  805532:	55                   	push   rbp
  805533:	48 89 e5             	mov    rbp,rsp
  805536:	48 83 ec 50          	sub    rsp,0x50
  80553a:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    page_item * pml4p=p->pml4;
  80553e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805542:	48 8b 80 c0 00 00 00 	mov    rax,QWORD PTR [rax+0xc0]
  805549:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //复制pdpt
    page_item *pml4e= pml4p;
  80554d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805551:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    for(int i=0;i<512;i++)
  805555:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80555c:	e9 be 02 00 00       	jmp    80581f <release_mmap+0x2f1>
    {
        if(pml4e[i]&PAGE_PRESENT){
  805561:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805564:	48 98                	cdqe   
  805566:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80556d:	00 
  80556e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805572:	48 01 d0             	add    rax,rdx
  805575:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805578:	83 e0 01             	and    eax,0x1
  80557b:	48 85 c0             	test   rax,rax
  80557e:	0f 84 97 02 00 00    	je     80581b <release_mmap+0x2ed>
            page_item *pdpte=pml4e[i]&PAGE_4K_MASK;
  805584:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805587:	48 98                	cdqe   
  805589:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805590:	00 
  805591:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805595:	48 01 d0             	add    rax,rdx
  805598:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80559b:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  8055a2:	ff 00 00 
  8055a5:	48 21 d0             	and    rax,rdx
  8055a8:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            int j=i==0?1:0;//低1GB的空间不释放（内核空间）
  8055ac:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8055b0:	0f 94 c0             	sete   al
  8055b3:	0f b6 c0             	movzx  eax,al
  8055b6:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
            for(;j<512;j++)
  8055b9:	e9 24 02 00 00       	jmp    8057e2 <release_mmap+0x2b4>
            {
                if(pdpte[j]&PAGE_PRESENT&&!(pdpte[j]&PDPTE_1GB)){
  8055be:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8055c1:	48 98                	cdqe   
  8055c3:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8055ca:	00 
  8055cb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8055cf:	48 01 d0             	add    rax,rdx
  8055d2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8055d5:	83 e0 01             	and    eax,0x1
  8055d8:	48 85 c0             	test   rax,rax
  8055db:	0f 84 fd 01 00 00    	je     8057de <release_mmap+0x2b0>
  8055e1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8055e4:	48 98                	cdqe   
  8055e6:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8055ed:	00 
  8055ee:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8055f2:	48 01 d0             	add    rax,rdx
  8055f5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8055f8:	25 80 00 00 00       	and    eax,0x80
  8055fd:	48 85 c0             	test   rax,rax
  805600:	0f 85 d8 01 00 00    	jne    8057de <release_mmap+0x2b0>
                    page_item *pde=pdpte[j]&PAGE_4K_MASK;
  805606:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805609:	48 98                	cdqe   
  80560b:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805612:	00 
  805613:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805617:	48 01 d0             	add    rax,rdx
  80561a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80561d:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805624:	ff 00 00 
  805627:	48 21 d0             	and    rax,rdx
  80562a:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
                    for(int k=0;k<512;k++)
  80562e:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  805635:	e9 6b 01 00 00       	jmp    8057a5 <release_mmap+0x277>
                    {
                        if(pde[k]&PAGE_PRESENT&&!(pde[k]&PDE_4MB)){
  80563a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80563d:	48 98                	cdqe   
  80563f:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805646:	00 
  805647:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80564b:	48 01 d0             	add    rax,rdx
  80564e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805651:	83 e0 01             	and    eax,0x1
  805654:	48 85 c0             	test   rax,rax
  805657:	0f 84 dc 00 00 00    	je     805739 <release_mmap+0x20b>
  80565d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805660:	48 98                	cdqe   
  805662:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805669:	00 
  80566a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80566e:	48 01 d0             	add    rax,rdx
  805671:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805674:	25 80 00 00 00       	and    eax,0x80
  805679:	48 85 c0             	test   rax,rax
  80567c:	0f 85 b7 00 00 00    	jne    805739 <release_mmap+0x20b>
                            page_item *pte=pde[k]&PAGE_4K_MASK;
  805682:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805685:	48 98                	cdqe   
  805687:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80568e:	00 
  80568f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805693:	48 01 d0             	add    rax,rdx
  805696:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805699:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  8056a0:	ff 00 00 
  8056a3:	48 21 d0             	and    rax,rdx
  8056a6:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
                            for(int l=0;l<512;l++){
  8056aa:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  8056b1:	eb 4f                	jmp    805702 <release_mmap+0x1d4>
                                if(pte[l]&PAGE_PRESENT){
  8056b3:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8056b6:	48 98                	cdqe   
  8056b8:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8056bf:	00 
  8056c0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8056c4:	48 01 d0             	add    rax,rdx
  8056c7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8056ca:	83 e0 01             	and    eax,0x1
  8056cd:	48 85 c0             	test   rax,rax
  8056d0:	74 2c                	je     8056fe <release_mmap+0x1d0>
                                    //释放申请的物理内存
                                    free_page(pte[l]&PAGE_4K_MASK);
  8056d2:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8056d5:	48 98                	cdqe   
  8056d7:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8056de:	00 
  8056df:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8056e3:	48 01 d0             	add    rax,rdx
  8056e6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8056e9:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  8056f0:	ff 00 00 
  8056f3:	48 21 d0             	and    rax,rdx
  8056f6:	48 89 c7             	mov    rdi,rax
  8056f9:	e8 89 bf ff ff       	call   801687 <free_page>
                            for(int l=0;l<512;l++){
  8056fe:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  805702:	81 7d f0 ff 01 00 00 	cmp    DWORD PTR [rbp-0x10],0x1ff
  805709:	7e a8                	jle    8056b3 <release_mmap+0x185>
                                }
                            }
                            //里面的项释放完了，这一项指向的vmalloc内存可以释放了
                            vmfree(pde[k]&PAGE_4K_MASK);
  80570b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80570e:	48 98                	cdqe   
  805710:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805717:	00 
  805718:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80571c:	48 01 d0             	add    rax,rdx
  80571f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805722:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805729:	ff 00 00 
  80572c:	48 21 d0             	and    rax,rdx
  80572f:	48 89 c7             	mov    rdi,rax
  805732:	e8 55 bb ff ff       	call   80128c <vmfree>
                        if(pde[k]&PAGE_PRESENT&&!(pde[k]&PDE_4MB)){
  805737:	eb 68                	jmp    8057a1 <release_mmap+0x273>
                        }else if((pde[k]&PAGE_PRESENT)&&(pde[k]&PDE_4MB)){
  805739:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80573c:	48 98                	cdqe   
  80573e:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805745:	00 
  805746:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80574a:	48 01 d0             	add    rax,rdx
  80574d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805750:	83 e0 01             	and    eax,0x1
  805753:	48 85 c0             	test   rax,rax
  805756:	74 49                	je     8057a1 <release_mmap+0x273>
  805758:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80575b:	48 98                	cdqe   
  80575d:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805764:	00 
  805765:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805769:	48 01 d0             	add    rax,rdx
  80576c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80576f:	25 80 00 00 00       	and    eax,0x80
  805774:	48 85 c0             	test   rax,rax
  805777:	74 28                	je     8057a1 <release_mmap+0x273>
                            //释放2MB页
                            free_pages_at(pde[k]&PAGE_4K_MASK,512);
  805779:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80577c:	48 98                	cdqe   
  80577e:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805785:	00 
  805786:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80578a:	48 01 d0             	add    rax,rdx
  80578d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805790:	25 00 f0 ff ff       	and    eax,0xfffff000
  805795:	be 00 02 00 00       	mov    esi,0x200
  80579a:	89 c7                	mov    edi,eax
  80579c:	e8 6a bf ff ff       	call   80170b <free_pages_at>
                    for(int k=0;k<512;k++)
  8057a1:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8057a5:	81 7d f4 ff 01 00 00 	cmp    DWORD PTR [rbp-0xc],0x1ff
  8057ac:	0f 8e 88 fe ff ff    	jle    80563a <release_mmap+0x10c>
                        }
                    }
                    //这一页pde的内容释放完了，这一项指向的vmalloc可以释放了
                    vmfree(pdpte[j]&PAGE_4K_MASK);
  8057b2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8057b5:	48 98                	cdqe   
  8057b7:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8057be:	00 
  8057bf:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8057c3:	48 01 d0             	add    rax,rdx
  8057c6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8057c9:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  8057d0:	ff 00 00 
  8057d3:	48 21 d0             	and    rax,rdx
  8057d6:	48 89 c7             	mov    rdi,rax
  8057d9:	e8 ae ba ff ff       	call   80128c <vmfree>
            for(;j<512;j++)
  8057de:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8057e2:	81 7d f8 ff 01 00 00 	cmp    DWORD PTR [rbp-0x8],0x1ff
  8057e9:	0f 8e cf fd ff ff    	jle    8055be <release_mmap+0x90>
                }//1GB先不写，目前还没有初始化之后动态申请1GB页的

            }
            //这一页pdpte的内容释放完了，这一项指向的vmalloc可以释放了
            vmfree(pml4e[i]&PAGE_4K_MASK);
  8057ef:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8057f2:	48 98                	cdqe   
  8057f4:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8057fb:	00 
  8057fc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805800:	48 01 d0             	add    rax,rdx
  805803:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805806:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  80580d:	ff 00 00 
  805810:	48 21 d0             	and    rax,rdx
  805813:	48 89 c7             	mov    rdi,rax
  805816:	e8 71 ba ff ff       	call   80128c <vmfree>
    for(int i=0;i<512;i++)
  80581b:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80581f:	81 7d fc ff 01 00 00 	cmp    DWORD PTR [rbp-0x4],0x1ff
  805826:	0f 8e 35 fd ff ff    	jle    805561 <release_mmap+0x33>
        }
    }
}
  80582c:	90                   	nop
  80582d:	90                   	nop
  80582e:	c9                   	leave  
  80582f:	c3                   	ret    

0000000000805830 <copy_mmap>:
void copy_mmap(struct process* from, struct process *to){
  805830:	f3 0f 1e fa          	endbr64 
  805834:	55                   	push   rbp
  805835:	48 89 e5             	mov    rbp,rsp
  805838:	48 83 ec 60          	sub    rsp,0x60
  80583c:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  805840:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
    page_item * pml4p=vmalloc();
  805844:	b8 00 00 00 00       	mov    eax,0x0
  805849:	e8 af b9 ff ff       	call   8011fd <vmalloc>
  80584e:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    memcpy(pml4p,from->regs.cr3,PAGE_4K_SIZE);//复制pml4
  805852:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  805856:	48 8b 80 44 02 00 00 	mov    rax,QWORD PTR [rax+0x244]
  80585d:	48 89 c1             	mov    rcx,rax
  805860:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805864:	ba 00 10 00 00       	mov    edx,0x1000
  805869:	48 89 ce             	mov    rsi,rcx
  80586c:	48 89 c7             	mov    rdi,rax
  80586f:	e8 81 66 00 00       	call   80bef5 <memcpy>
    to->regs.cr3=pml4p;
  805874:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  805878:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80587c:	48 89 90 44 02 00 00 	mov    QWORD PTR [rax+0x244],rdx
    to->pml4=pml4p;
  805883:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  805887:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80588b:	48 89 90 c0 00 00 00 	mov    QWORD PTR [rax+0xc0],rdx
    //复制pdpt

    page_item *pml4e= pml4p;
  805892:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805896:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    for(int i=0;i<512;i++)
  80589a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8058a1:	e9 09 03 00 00       	jmp    805baf <copy_mmap+0x37f>
    {
        if(pml4e[i]&PAGE_PRESENT){
  8058a6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8058a9:	48 98                	cdqe   
  8058ab:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8058b2:	00 
  8058b3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8058b7:	48 01 d0             	add    rax,rdx
  8058ba:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8058bd:	83 e0 01             	and    eax,0x1
  8058c0:	48 85 c0             	test   rax,rax
  8058c3:	0f 84 e2 02 00 00    	je     805bab <copy_mmap+0x37b>
            addr_t old_data=pml4e[i];//旧的数据，里面保存了属性和要拷贝的数据的地址
  8058c9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8058cc:	48 98                	cdqe   
  8058ce:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8058d5:	00 
  8058d6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8058da:	48 01 d0             	add    rax,rdx
  8058dd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8058e0:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            pml4e[i]=vmalloc()|(old_data&~PAGE_4K_MASK);
  8058e4:	b8 00 00 00 00       	mov    eax,0x0
  8058e9:	e8 0f b9 ff ff       	call   8011fd <vmalloc>
  8058ee:	48 89 c2             	mov    rdx,rax
  8058f1:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  8058f8:	00 ff ff 
  8058fb:	48 23 45 d8          	and    rax,QWORD PTR [rbp-0x28]
  8058ff:	48 89 c1             	mov    rcx,rax
  805902:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805905:	48 98                	cdqe   
  805907:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  80590e:	00 
  80590f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805913:	48 01 f0             	add    rax,rsi
  805916:	48 09 ca             	or     rdx,rcx
  805919:	48 89 10             	mov    QWORD PTR [rax],rdx
            memcpy(pml4e[i]&PAGE_4K_MASK,old_data&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  80591c:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  805923:	ff 00 00 
  805926:	48 23 45 d8          	and    rax,QWORD PTR [rbp-0x28]
  80592a:	48 89 c1             	mov    rcx,rax
  80592d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805930:	48 98                	cdqe   
  805932:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805939:	00 
  80593a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80593e:	48 01 d0             	add    rax,rdx
  805941:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805944:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  80594b:	ff 00 00 
  80594e:	48 21 d0             	and    rax,rdx
  805951:	ba 00 10 00 00       	mov    edx,0x1000
  805956:	48 89 ce             	mov    rsi,rcx
  805959:	48 89 c7             	mov    rdi,rax
  80595c:	e8 94 65 00 00       	call   80bef5 <memcpy>
            page_item *pdpte=pml4e[i]&PAGE_4K_MASK;
  805961:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805964:	48 98                	cdqe   
  805966:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80596d:	00 
  80596e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805972:	48 01 d0             	add    rax,rdx
  805975:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805978:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  80597f:	ff 00 00 
  805982:	48 21 d0             	and    rax,rdx
  805985:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            for(int j=0;j<512;j++)
  805989:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805990:	e9 09 02 00 00       	jmp    805b9e <copy_mmap+0x36e>
            {
                if(pdpte[j]&PAGE_PRESENT&&!(pdpte[j]&PDPTE_1GB)){
  805995:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805998:	48 98                	cdqe   
  80599a:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8059a1:	00 
  8059a2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8059a6:	48 01 d0             	add    rax,rdx
  8059a9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8059ac:	83 e0 01             	and    eax,0x1
  8059af:	48 85 c0             	test   rax,rax
  8059b2:	0f 84 e2 01 00 00    	je     805b9a <copy_mmap+0x36a>
  8059b8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8059bb:	48 98                	cdqe   
  8059bd:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8059c4:	00 
  8059c5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8059c9:	48 01 d0             	add    rax,rdx
  8059cc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8059cf:	25 80 00 00 00       	and    eax,0x80
  8059d4:	48 85 c0             	test   rax,rax
  8059d7:	0f 85 bd 01 00 00    	jne    805b9a <copy_mmap+0x36a>
                    addr_t old_data2=pdpte[j];//旧的数据，里面保存了属性和要拷贝的数据的地址
  8059dd:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8059e0:	48 98                	cdqe   
  8059e2:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8059e9:	00 
  8059ea:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8059ee:	48 01 d0             	add    rax,rdx
  8059f1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8059f4:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
                    pdpte[j]=vmalloc()|(old_data2&~PAGE_4K_MASK);
  8059f8:	b8 00 00 00 00       	mov    eax,0x0
  8059fd:	e8 fb b7 ff ff       	call   8011fd <vmalloc>
  805a02:	48 89 c2             	mov    rdx,rax
  805a05:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  805a0c:	00 ff ff 
  805a0f:	48 23 45 c8          	and    rax,QWORD PTR [rbp-0x38]
  805a13:	48 89 c1             	mov    rcx,rax
  805a16:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805a19:	48 98                	cdqe   
  805a1b:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  805a22:	00 
  805a23:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805a27:	48 01 f0             	add    rax,rsi
  805a2a:	48 09 ca             	or     rdx,rcx
  805a2d:	48 89 10             	mov    QWORD PTR [rax],rdx
                    memcpy(pdpte[j]&PAGE_4K_MASK,old_data2&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  805a30:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  805a37:	ff 00 00 
  805a3a:	48 23 45 c8          	and    rax,QWORD PTR [rbp-0x38]
  805a3e:	48 89 c1             	mov    rcx,rax
  805a41:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805a44:	48 98                	cdqe   
  805a46:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805a4d:	00 
  805a4e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805a52:	48 01 d0             	add    rax,rdx
  805a55:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805a58:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805a5f:	ff 00 00 
  805a62:	48 21 d0             	and    rax,rdx
  805a65:	ba 00 10 00 00       	mov    edx,0x1000
  805a6a:	48 89 ce             	mov    rsi,rcx
  805a6d:	48 89 c7             	mov    rdi,rax
  805a70:	e8 80 64 00 00       	call   80bef5 <memcpy>
                    page_item *pde=pdpte[j]&PAGE_4K_MASK;
  805a75:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805a78:	48 98                	cdqe   
  805a7a:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805a81:	00 
  805a82:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805a86:	48 01 d0             	add    rax,rdx
  805a89:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805a8c:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805a93:	ff 00 00 
  805a96:	48 21 d0             	and    rax,rdx
  805a99:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
                    for(int k=0;k<512;k++)
  805a9d:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  805aa4:	e9 e4 00 00 00       	jmp    805b8d <copy_mmap+0x35d>
                    {
                        if(pde[k]&PAGE_PRESENT&&!(pde[k]&PDE_4MB)){
  805aa9:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805aac:	48 98                	cdqe   
  805aae:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805ab5:	00 
  805ab6:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805aba:	48 01 d0             	add    rax,rdx
  805abd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805ac0:	83 e0 01             	and    eax,0x1
  805ac3:	48 85 c0             	test   rax,rax
  805ac6:	0f 84 bd 00 00 00    	je     805b89 <copy_mmap+0x359>
  805acc:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805acf:	48 98                	cdqe   
  805ad1:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805ad8:	00 
  805ad9:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805add:	48 01 d0             	add    rax,rdx
  805ae0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805ae3:	25 80 00 00 00       	and    eax,0x80
  805ae8:	48 85 c0             	test   rax,rax
  805aeb:	0f 85 98 00 00 00    	jne    805b89 <copy_mmap+0x359>
                            addr_t old_data3=pde[k];//旧的数据，里面保存了属性和要拷贝的数据的地址
  805af1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805af4:	48 98                	cdqe   
  805af6:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805afd:	00 
  805afe:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805b02:	48 01 d0             	add    rax,rdx
  805b05:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805b08:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
                            pde[k]=vmalloc()|(old_data3&~PAGE_4K_MASK);
  805b0c:	b8 00 00 00 00       	mov    eax,0x0
  805b11:	e8 e7 b6 ff ff       	call   8011fd <vmalloc>
  805b16:	48 89 c2             	mov    rdx,rax
  805b19:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  805b20:	00 ff ff 
  805b23:	48 23 45 b8          	and    rax,QWORD PTR [rbp-0x48]
  805b27:	48 89 c1             	mov    rcx,rax
  805b2a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805b2d:	48 98                	cdqe   
  805b2f:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  805b36:	00 
  805b37:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805b3b:	48 01 f0             	add    rax,rsi
  805b3e:	48 09 ca             	or     rdx,rcx
  805b41:	48 89 10             	mov    QWORD PTR [rax],rdx
                            memcpy(pde[k]&PAGE_4K_MASK,old_data3&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  805b44:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  805b4b:	ff 00 00 
  805b4e:	48 23 45 b8          	and    rax,QWORD PTR [rbp-0x48]
  805b52:	48 89 c1             	mov    rcx,rax
  805b55:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805b58:	48 98                	cdqe   
  805b5a:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805b61:	00 
  805b62:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805b66:	48 01 d0             	add    rax,rdx
  805b69:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805b6c:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805b73:	ff 00 00 
  805b76:	48 21 d0             	and    rax,rdx
  805b79:	ba 00 10 00 00       	mov    edx,0x1000
  805b7e:	48 89 ce             	mov    rsi,rcx
  805b81:	48 89 c7             	mov    rdi,rax
  805b84:	e8 6c 63 00 00       	call   80bef5 <memcpy>
                    for(int k=0;k<512;k++)
  805b89:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  805b8d:	81 7d f4 ff 01 00 00 	cmp    DWORD PTR [rbp-0xc],0x1ff
  805b94:	0f 8e 0f ff ff ff    	jle    805aa9 <copy_mmap+0x279>
            for(int j=0;j<512;j++)
  805b9a:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805b9e:	81 7d f8 ff 01 00 00 	cmp    DWORD PTR [rbp-0x8],0x1ff
  805ba5:	0f 8e ea fd ff ff    	jle    805995 <copy_mmap+0x165>
    for(int i=0;i<512;i++)
  805bab:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805baf:	81 7d fc ff 01 00 00 	cmp    DWORD PTR [rbp-0x4],0x1ff
  805bb6:	0f 8e ea fc ff ff    	jle    8058a6 <copy_mmap+0x76>
                    }
                }
            }
        }
    }
}
  805bbc:	90                   	nop
  805bbd:	90                   	nop
  805bbe:	c9                   	leave  
  805bbf:	c3                   	ret    

0000000000805bc0 <getpgrp>:

pid_t getpgrp(void){
  805bc0:	f3 0f 1e fa          	endbr64 
  805bc4:	55                   	push   rbp
  805bc5:	48 89 e5             	mov    rbp,rsp
    return current->gpid;
  805bc8:	48 8b 05 d1 f9 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f9d1]        # 4155a0 <current>
  805bcf:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
}
  805bd2:	5d                   	pop    rbp
  805bd3:	c3                   	ret    

0000000000805bd4 <getpgid>:

int getpgid(pid_t pid,gid_t gid){
  805bd4:	f3 0f 1e fa          	endbr64 
  805bd8:	55                   	push   rbp
  805bd9:	48 89 e5             	mov    rbp,rsp
  805bdc:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  805bdf:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==0)
  805be2:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  805be6:	75 0c                	jne    805bf4 <getpgid+0x20>
        return current->gpid;
  805be8:	48 8b 05 b1 f9 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f9b1]        # 4155a0 <current>
  805bef:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805bf2:	eb 49                	jmp    805c3d <getpgid+0x69>
    for (int i = 0; i <MAX_TASKS; ++i) {
  805bf4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805bfb:	eb 35                	jmp    805c32 <getpgid+0x5e>
        if(task[i].pid==pid)
  805bfd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805c00:	48 98                	cdqe   
  805c02:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805c09:	48 05 a0 84 40 00    	add    rax,0x4084a0
  805c0f:	8b 10                	mov    edx,DWORD PTR [rax]
  805c11:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805c14:	39 c2                	cmp    edx,eax
  805c16:	75 16                	jne    805c2e <getpgid+0x5a>
            return task[i].gpid;
  805c18:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805c1b:	48 98                	cdqe   
  805c1d:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805c24:	48 05 a4 84 40 00    	add    rax,0x4084a4
  805c2a:	8b 00                	mov    eax,DWORD PTR [rax]
  805c2c:	eb 0f                	jmp    805c3d <getpgid+0x69>
    for (int i = 0; i <MAX_TASKS; ++i) {
  805c2e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805c32:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  805c36:	7e c5                	jle    805bfd <getpgid+0x29>
    }
    return -1;
  805c38:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  805c3d:	5d                   	pop    rbp
  805c3e:	c3                   	ret    

0000000000805c3f <setpgid>:
int setpgid(pid_t pid,gid_t gid){
  805c3f:	f3 0f 1e fa          	endbr64 
  805c43:	55                   	push   rbp
  805c44:	48 89 e5             	mov    rbp,rsp
  805c47:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  805c4a:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==0)
  805c4d:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  805c51:	75 38                	jne    805c8b <setpgid+0x4c>
    {
        if(current->sid==current->pid)
  805c53:	48 8b 05 46 f9 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f946]        # 4155a0 <current>
  805c5a:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  805c5d:	48 8b 05 3c f9 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f93c]        # 4155a0 <current>
  805c64:	8b 00                	mov    eax,DWORD PTR [rax]
  805c66:	39 c2                	cmp    edx,eax
  805c68:	75 0a                	jne    805c74 <setpgid+0x35>
            return -1;
  805c6a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805c6f:	e9 9d 00 00 00       	jmp    805d11 <setpgid+0xd2>
        current->gpid=gid;
  805c74:	48 8b 05 25 f9 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f925]        # 4155a0 <current>
  805c7b:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  805c7e:	89 50 04             	mov    DWORD PTR [rax+0x4],edx
        return 0;
  805c81:	b8 00 00 00 00       	mov    eax,0x0
  805c86:	e9 86 00 00 00       	jmp    805d11 <setpgid+0xd2>
    }
    for (int i = 0; i <MAX_TASKS; ++i) {
  805c8b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805c92:	eb 72                	jmp    805d06 <setpgid+0xc7>
        if(task[i].pid==pid)
  805c94:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805c97:	48 98                	cdqe   
  805c99:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805ca0:	48 05 a0 84 40 00    	add    rax,0x4084a0
  805ca6:	8b 10                	mov    edx,DWORD PTR [rax]
  805ca8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805cab:	39 c2                	cmp    edx,eax
  805cad:	75 53                	jne    805d02 <setpgid+0xc3>
        {
            if(task[i].sid==task[i].pid)
  805caf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805cb2:	48 98                	cdqe   
  805cb4:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805cbb:	48 05 a8 84 40 00    	add    rax,0x4084a8
  805cc1:	8b 10                	mov    edx,DWORD PTR [rax]
  805cc3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805cc6:	48 98                	cdqe   
  805cc8:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805ccf:	48 05 a0 84 40 00    	add    rax,0x4084a0
  805cd5:	8b 00                	mov    eax,DWORD PTR [rax]
  805cd7:	39 c2                	cmp    edx,eax
  805cd9:	75 07                	jne    805ce2 <setpgid+0xa3>
                return -1;
  805cdb:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805ce0:	eb 2f                	jmp    805d11 <setpgid+0xd2>
            task[i].gpid=gid;
  805ce2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805ce5:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  805ce8:	48 63 d2             	movsxd rdx,edx
  805ceb:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  805cf2:	48 81 c2 a4 84 40 00 	add    rdx,0x4084a4
  805cf9:	89 02                	mov    DWORD PTR [rdx],eax
            return 0;
  805cfb:	b8 00 00 00 00       	mov    eax,0x0
  805d00:	eb 0f                	jmp    805d11 <setpgid+0xd2>
    for (int i = 0; i <MAX_TASKS; ++i) {
  805d02:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805d06:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  805d0a:	7e 88                	jle    805c94 <setpgid+0x55>
        }
    }
    return -1;
  805d0c:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  805d11:	5d                   	pop    rbp
  805d12:	c3                   	ret    

0000000000805d13 <setsid>:

pid_t setsid(void){
  805d13:	f3 0f 1e fa          	endbr64 
  805d17:	55                   	push   rbp
  805d18:	48 89 e5             	mov    rbp,rsp
    current->sid=current->pid;
  805d1b:	48 8b 15 7e f8 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0f87e]        # 4155a0 <current>
  805d22:	48 8b 05 77 f8 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f877]        # 4155a0 <current>
  805d29:	8b 12                	mov    edx,DWORD PTR [rdx]
  805d2b:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
}
  805d2e:	90                   	nop
  805d2f:	5d                   	pop    rbp
  805d30:	c3                   	ret    

0000000000805d31 <getsid>:
pid_t getsid(pid_t pid){
  805d31:	f3 0f 1e fa          	endbr64 
  805d35:	55                   	push   rbp
  805d36:	48 89 e5             	mov    rbp,rsp
  805d39:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(pid==0)
  805d3c:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  805d40:	75 0c                	jne    805d4e <getsid+0x1d>
        return current->sid;
  805d42:	48 8b 05 57 f8 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f857]        # 4155a0 <current>
  805d49:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  805d4c:	eb 49                	jmp    805d97 <getsid+0x66>
    for (int i = 0; i <MAX_TASKS; ++i) {
  805d4e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805d55:	eb 35                	jmp    805d8c <getsid+0x5b>
        if(task[i].pid==pid)
  805d57:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805d5a:	48 98                	cdqe   
  805d5c:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805d63:	48 05 a0 84 40 00    	add    rax,0x4084a0
  805d69:	8b 10                	mov    edx,DWORD PTR [rax]
  805d6b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805d6e:	39 c2                	cmp    edx,eax
  805d70:	75 16                	jne    805d88 <getsid+0x57>
            return task[i].sid;
  805d72:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805d75:	48 98                	cdqe   
  805d77:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805d7e:	48 05 a8 84 40 00    	add    rax,0x4084a8
  805d84:	8b 00                	mov    eax,DWORD PTR [rax]
  805d86:	eb 0f                	jmp    805d97 <getsid+0x66>
    for (int i = 0; i <MAX_TASKS; ++i) {
  805d88:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805d8c:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  805d90:	7e c5                	jle    805d57 <getsid+0x26>
    }
    return -1;
  805d92:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  805d97:	5d                   	pop    rbp
  805d98:	c3                   	ret    

0000000000805d99 <tcsetpgrp>:
int tcsetpgrp(int fildes,pid_t pgid_id){
  805d99:	f3 0f 1e fa          	endbr64 
  805d9d:	55                   	push   rbp
  805d9e:	48 89 e5             	mov    rbp,rsp
  805da1:	48 83 ec 20          	sub    rsp,0x20
  805da5:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  805da8:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    //当前controlling terminal断联
    sys_ioctl(fildes,TTY_DISCONNECT,0);
  805dab:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805dae:	ba 00 00 00 00       	mov    edx,0x0
  805db3:	be 02 00 00 00       	mov    esi,0x2
  805db8:	89 c7                	mov    edi,eax
  805dba:	e8 27 01 00 00       	call   805ee6 <sys_ioctl>
    int sid= getsid(0);//获取session id
  805dbf:	bf 00 00 00 00       	mov    edi,0x0
  805dc4:	e8 68 ff ff ff       	call   805d31 <getsid>
  805dc9:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    struct process* new_fgl=NULL;
  805dcc:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  805dd3:	00 
    for (int i = 0; i <MAX_TASKS; ++i) {
  805dd4:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  805ddb:	e9 85 00 00 00       	jmp    805e65 <tcsetpgrp+0xcc>
        if(task[i].stat==ENDED)continue;
  805de0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805de3:	48 98                	cdqe   
  805de5:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805dec:	48 05 b8 84 40 00    	add    rax,0x4084b8
  805df2:	8b 00                	mov    eax,DWORD PTR [rax]
  805df4:	83 f8 03             	cmp    eax,0x3
  805df7:	74 67                	je     805e60 <tcsetpgrp+0xc7>
        if(task[i].sid==sid){
  805df9:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805dfc:	48 98                	cdqe   
  805dfe:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805e05:	48 05 a8 84 40 00    	add    rax,0x4084a8
  805e0b:	8b 10                	mov    edx,DWORD PTR [rax]
  805e0d:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  805e10:	39 c2                	cmp    edx,eax
  805e12:	75 4d                	jne    805e61 <tcsetpgrp+0xc8>
            task[i].fg_pgid=pgid_id;
  805e14:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805e17:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  805e1a:	48 63 d2             	movsxd rdx,edx
  805e1d:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  805e24:	48 81 c2 ac 84 40 00 	add    rdx,0x4084ac
  805e2b:	89 02                	mov    DWORD PTR [rdx],eax
            if(task[i].pid==pgid_id){
  805e2d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805e30:	48 98                	cdqe   
  805e32:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805e39:	48 05 a0 84 40 00    	add    rax,0x4084a0
  805e3f:	8b 10                	mov    edx,DWORD PTR [rax]
  805e41:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805e44:	39 c2                	cmp    edx,eax
  805e46:	75 19                	jne    805e61 <tcsetpgrp+0xc8>
                //这是新前台进程组的leader
                new_fgl=&task[i];
  805e48:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805e4b:	48 98                	cdqe   
  805e4d:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805e54:	48 05 a0 84 40 00    	add    rax,0x4084a0
  805e5a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  805e5e:	eb 01                	jmp    805e61 <tcsetpgrp+0xc8>
        if(task[i].stat==ENDED)continue;
  805e60:	90                   	nop
    for (int i = 0; i <MAX_TASKS; ++i) {
  805e61:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  805e65:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  805e69:	0f 8e 71 ff ff ff    	jle    805de0 <tcsetpgrp+0x47>
            }
        }
    }
    //新leader把tty连接
    new_fgl->openf[new_fgl->tty_fd]->f_ops->ioctl(new_fgl->openf[fildes]->dentry->dir_inode,new_fgl->openf[fildes]\
  805e6f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805e73:	8b 50 14             	mov    edx,DWORD PTR [rax+0x14]
  805e76:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805e7a:	48 63 d2             	movsxd rdx,edx
  805e7d:	48 83 c2 1a          	add    rdx,0x1a
  805e81:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  805e86:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  805e8a:	4c 8b 40 28          	mov    r8,QWORD PTR [rax+0x28]
  805e8e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805e92:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  805e95:	48 63 d2             	movsxd rdx,edx
  805e98:	48 83 c2 1a          	add    rdx,0x1a
  805e9c:	48 8b 74 d0 08       	mov    rsi,QWORD PTR [rax+rdx*8+0x8]
  805ea1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805ea5:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  805ea8:	48 63 d2             	movsxd rdx,edx
  805eab:	48 83 c2 1a          	add    rdx,0x1a
  805eaf:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  805eb4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  805eb8:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  805ebc:	b9 00 00 00 00       	mov    ecx,0x0
  805ec1:	ba 01 00 00 00       	mov    edx,0x1
  805ec6:	48 89 c7             	mov    rdi,rax
  805ec9:	41 ff d0             	call   r8
    ,TTY_CONNECT,0);
}
  805ecc:	90                   	nop
  805ecd:	c9                   	leave  
  805ece:	c3                   	ret    

0000000000805ecf <tcgetpgrp>:
pid_t tcgetpgrp(int fildes){
  805ecf:	f3 0f 1e fa          	endbr64 
  805ed3:	55                   	push   rbp
  805ed4:	48 89 e5             	mov    rbp,rsp
  805ed7:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return current->fg_pgid;
  805eda:	48 8b 05 bf f6 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f6bf]        # 4155a0 <current>
  805ee1:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
}
  805ee4:	5d                   	pop    rbp
  805ee5:	c3                   	ret    

0000000000805ee6 <sys_ioctl>:
//===============

int sys_ioctl(int fildes, int request, unsigned long args){
  805ee6:	f3 0f 1e fa          	endbr64 
  805eea:	55                   	push   rbp
  805eeb:	48 89 e5             	mov    rbp,rsp
  805eee:	48 83 ec 10          	sub    rsp,0x10
  805ef2:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  805ef5:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  805ef8:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    current->openf[fildes]->f_ops->ioctl(current->openf[fildes]->dentry->dir_inode,current->openf[fildes]\
  805efc:	48 8b 05 9d f6 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f69d]        # 4155a0 <current>
  805f03:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  805f06:	48 63 d2             	movsxd rdx,edx
  805f09:	48 83 c2 1a          	add    rdx,0x1a
  805f0d:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  805f12:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  805f16:	4c 8b 40 28          	mov    r8,QWORD PTR [rax+0x28]
  805f1a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805f1d:	48 63 d0             	movsxd rdx,eax
  805f20:	48 8b 05 79 f6 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f679]        # 4155a0 <current>
  805f27:	8b 4d fc             	mov    ecx,DWORD PTR [rbp-0x4]
  805f2a:	48 63 c9             	movsxd rcx,ecx
  805f2d:	48 83 c1 1a          	add    rcx,0x1a
  805f31:	48 8b 74 c8 08       	mov    rsi,QWORD PTR [rax+rcx*8+0x8]
  805f36:	48 8b 05 63 f6 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f663]        # 4155a0 <current>
  805f3d:	8b 4d fc             	mov    ecx,DWORD PTR [rbp-0x4]
  805f40:	48 63 c9             	movsxd rcx,ecx
  805f43:	48 83 c1 1a          	add    rcx,0x1a
  805f47:	48 8b 44 c8 08       	mov    rax,QWORD PTR [rax+rcx*8+0x8]
  805f4c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  805f50:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  805f54:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  805f58:	48 89 c7             	mov    rdi,rax
  805f5b:	41 ff d0             	call   r8
    ,request,args);
  805f5e:	90                   	nop
  805f5f:	c9                   	leave  
  805f60:	c3                   	ret    
  805f61:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  805f68:	00 00 00 
  805f6b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000805f70 <outb>:
  805f70:	66 89 fa             	mov    dx,di
  805f73:	66 89 f0             	mov    ax,si
  805f76:	ee                   	out    dx,al
  805f77:	e8 29 00 00 00       	call   805fa5 <io_delay>
  805f7c:	c3                   	ret    

0000000000805f7d <outw>:
  805f7d:	66 89 fa             	mov    dx,di
  805f80:	66 89 f0             	mov    ax,si
  805f83:	66 ef                	out    dx,ax
  805f85:	90                   	nop
  805f86:	90                   	nop
  805f87:	90                   	nop
  805f88:	c3                   	ret    

0000000000805f89 <inb>:
  805f89:	31 c0                	xor    eax,eax
  805f8b:	66 89 fa             	mov    dx,di
  805f8e:	ec                   	in     al,dx
  805f8f:	90                   	nop
  805f90:	90                   	nop
  805f91:	90                   	nop
  805f92:	c3                   	ret    

0000000000805f93 <inw>:
  805f93:	31 c0                	xor    eax,eax
  805f95:	66 89 fa             	mov    dx,di
  805f98:	66 ed                	in     ax,dx
  805f9a:	90                   	nop
  805f9b:	90                   	nop
  805f9c:	90                   	nop
  805f9d:	c3                   	ret    

0000000000805f9e <eoi>:
  805f9e:	b0 20                	mov    al,0x20
  805fa0:	e6 a0                	out    0xa0,al
  805fa2:	e6 20                	out    0x20,al
  805fa4:	c3                   	ret    

0000000000805fa5 <io_delay>:
  805fa5:	90                   	nop
  805fa6:	90                   	nop
  805fa7:	90                   	nop
  805fa8:	90                   	nop
  805fa9:	c3                   	ret    

0000000000805faa <turn_on_int>:
  805faa:	b0 f8                	mov    al,0xf8
  805fac:	e6 21                	out    0x21,al
  805fae:	e8 f2 ff ff ff       	call   805fa5 <io_delay>
  805fb3:	b0 af                	mov    al,0xaf
  805fb5:	e6 a1                	out    0xa1,al
  805fb7:	e8 e9 ff ff ff       	call   805fa5 <io_delay>
  805fbc:	b8 00 70 10 00       	mov    eax,0x107000
  805fc1:	0f 01 18             	lidt   [rax]
  805fc4:	90                   	nop
  805fc5:	90                   	nop
  805fc6:	90                   	nop
  805fc7:	90                   	nop
  805fc8:	c3                   	ret    

0000000000805fc9 <report_back_trace_of_err>:
  805fc9:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  805fce:	50                   	push   rax
  805fcf:	68 d8 5f 80 00       	push   0x805fd8
  805fd4:	83 c4 08             	add    esp,0x8
  805fd7:	c3                   	ret    

0000000000805fd8 <bt_msg>:
  805fd8:	65 72 72             	gs jb  80604d <fill_desc+0x4e>
  805fdb:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  805fdc:	72 20                	jb     805ffe <init_gdt+0x11>
  805fde:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  805fdf:	63 63 75             	movsxd esp,DWORD PTR [rbx+0x75]
  805fe2:	72 73                	jb     806057 <fill_desc+0x58>
  805fe4:	20 61 74             	and    BYTE PTR [rcx+0x74],ah
  805fe7:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR [rip+0x6e5c78]        # eebc65 <_knl_end+0x2ebc65>

0000000000805fed <init_gdt>:
#include "gdt.h"
#include "int.h"
descriptor *gdt=GDT_ADDR;
extern char *gdtptr;
int init_gdt()
{
  805fed:	f3 0f 1e fa          	endbr64 
  805ff1:	55                   	push   rbp
  805ff2:	48 89 e5             	mov    rbp,rsp
//    fill_desc(0x108000,108,SEG_SYS_TSS|SEG_PRESENT,4);
    asm volatile("mov $0x48,%ax\r\n"
  805ff5:	66 b8 48 00          	mov    ax,0x48
  805ff9:	0f 00 d8             	ltr    ax
                 "ltr %ax");  
}
  805ffc:	90                   	nop
  805ffd:	5d                   	pop    rbp
  805ffe:	c3                   	ret    

0000000000805fff <fill_desc>:
void fill_desc(u64 base, u64 limit, u16 attr, u32 index)
{
  805fff:	f3 0f 1e fa          	endbr64 
  806003:	55                   	push   rbp
  806004:	48 89 e5             	mov    rbp,rsp
  806007:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80600b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80600f:	89 d0                	mov    eax,edx
  806011:	89 4d e8             	mov    DWORD PTR [rbp-0x18],ecx
  806014:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    gdt[index].base_12=base&0xffff;
  806018:	48 8b 15 69 69 00 00 	mov    rdx,QWORD PTR [rip+0x6969]        # 80c988 <gdt>
  80601f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806022:	48 c1 e0 04          	shl    rax,0x4
  806026:	48 01 d0             	add    rax,rdx
  806029:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80602d:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    gdt[index].base_3=(base>>16)&0xff;
  806031:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806035:	48 c1 e8 10          	shr    rax,0x10
  806039:	48 89 c1             	mov    rcx,rax
  80603c:	48 8b 15 45 69 00 00 	mov    rdx,QWORD PTR [rip+0x6945]        # 80c988 <gdt>
  806043:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806046:	48 c1 e0 04          	shl    rax,0x4
  80604a:	48 01 d0             	add    rax,rdx
  80604d:	89 ca                	mov    edx,ecx
  80604f:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    gdt[index].base_4=(base>>24)&0xff;
  806052:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806056:	48 c1 e8 18          	shr    rax,0x18
  80605a:	48 89 c1             	mov    rcx,rax
  80605d:	48 8b 15 24 69 00 00 	mov    rdx,QWORD PTR [rip+0x6924]        # 80c988 <gdt>
  806064:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806067:	48 c1 e0 04          	shl    rax,0x4
  80606b:	48 01 d0             	add    rax,rdx
  80606e:	89 ca                	mov    edx,ecx
  806070:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    gdt[index].base_5678=(base>>32)&0xffffffff;
  806073:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806077:	48 c1 e8 20          	shr    rax,0x20
  80607b:	48 89 c2             	mov    rdx,rax
  80607e:	48 8b 0d 03 69 00 00 	mov    rcx,QWORD PTR [rip+0x6903]        # 80c988 <gdt>
  806085:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806088:	48 c1 e0 04          	shl    rax,0x4
  80608c:	48 01 c8             	add    rax,rcx
  80608f:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    gdt[index].limit_lo16=limit&0xffff;
  806092:	48 8b 15 ef 68 00 00 	mov    rdx,QWORD PTR [rip+0x68ef]        # 80c988 <gdt>
  806099:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80609c:	48 c1 e0 04          	shl    rax,0x4
  8060a0:	48 01 d0             	add    rax,rdx
  8060a3:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  8060a7:	66 89 10             	mov    WORD PTR [rax],dx
    gdt[index].attr=attr|((limit>>8)&0xf0);
  8060aa:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8060ae:	48 c1 e8 08          	shr    rax,0x8
  8060b2:	66 25 f0 00          	and    ax,0xf0
  8060b6:	48 8b 0d cb 68 00 00 	mov    rcx,QWORD PTR [rip+0x68cb]        # 80c988 <gdt>
  8060bd:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8060c0:	48 c1 e2 04          	shl    rdx,0x4
  8060c4:	48 01 ca             	add    rdx,rcx
  8060c7:	66 0b 45 ec          	or     ax,WORD PTR [rbp-0x14]
  8060cb:	66 89 42 05          	mov    WORD PTR [rdx+0x5],ax

}
  8060cf:	90                   	nop
  8060d0:	5d                   	pop    rbp
  8060d1:	c3                   	ret    

00000000008060d2 <fill_gate>:

void fill_gate(u32 index,u32 offset,u16 selector,u16 attr)
{
  8060d2:	f3 0f 1e fa          	endbr64 
  8060d6:	55                   	push   rbp
  8060d7:	48 89 e5             	mov    rbp,rsp
  8060da:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8060dd:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8060e0:	89 c8                	mov    eax,ecx
  8060e2:	66 89 55 e4          	mov    WORD PTR [rbp-0x1c],dx
  8060e6:	66 89 45 e0          	mov    WORD PTR [rbp-0x20],ax
    gate* ptr=gdt;
  8060ea:	48 8b 05 97 68 00 00 	mov    rax,QWORD PTR [rip+0x6897]        # 80c988 <gdt>
  8060f1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ptr[index].offset_low=offset&0xffff;
  8060f5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8060f8:	48 c1 e0 04          	shl    rax,0x4
  8060fc:	48 89 c2             	mov    rdx,rax
  8060ff:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806103:	48 01 d0             	add    rax,rdx
  806106:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  806109:	66 89 10             	mov    WORD PTR [rax],dx
    ptr[index].offset_high=(offset>>16)&0xffff;
  80610c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80610f:	48 c1 e0 04          	shl    rax,0x4
  806113:	48 89 c2             	mov    rdx,rax
  806116:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80611a:	48 01 d0             	add    rax,rdx
  80611d:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  806120:	c1 ea 10             	shr    edx,0x10
  806123:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    ptr[index].selector=selector;
  806126:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806129:	48 c1 e0 04          	shl    rax,0x4
  80612d:	48 89 c2             	mov    rdx,rax
  806130:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806134:	48 01 c2             	add    rdx,rax
  806137:	0f b7 45 e4          	movzx  eax,WORD PTR [rbp-0x1c]
  80613b:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    ptr[index].attr=attr;
  80613f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806142:	48 c1 e0 04          	shl    rax,0x4
  806146:	48 89 c2             	mov    rdx,rax
  806149:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80614d:	48 01 c2             	add    rdx,rax
  806150:	0f b7 45 e0          	movzx  eax,WORD PTR [rbp-0x20]
  806154:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
}
  806158:	90                   	nop
  806159:	5d                   	pop    rbp
  80615a:	c3                   	ret    

000000000080615b <fill_ldt_desc>:

void fill_ldt_desc(u32 base, u32 limit,u16 attr,descriptor *desc)
{
  80615b:	f3 0f 1e fa          	endbr64 
  80615f:	55                   	push   rbp
  806160:	48 89 e5             	mov    rbp,rsp
  806163:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  806166:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  806169:	89 d0                	mov    eax,edx
  80616b:	48 89 4d e8          	mov    QWORD PTR [rbp-0x18],rcx
  80616f:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
//    desc->base_lo16=base&0xffff;
//    desc->base_mid8=(base>>16)&0xff;
//    desc->base_hi8=(base>>24)&0xff;
//    desc->limit_lo16=limit&0xffff;
//    desc->attr=attr|(limit>>16&0xf)<<8;
  806173:	90                   	nop
  806174:	5d                   	pop    rbp
  806175:	c3                   	ret    
  806176:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  80617d:	00 00 00 

0000000000806180 <fill_desc>:
  806180:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  806185:	67 8b 5c 24 08       	mov    ebx,DWORD PTR [esp+0x8]
  80618a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  80618f:	67 8b 54 24 10       	mov    edx,DWORD PTR [esp+0x10]
  806194:	be 00 60 00 00       	mov    esi,0x6000
  806199:	c1 e2 03             	shl    edx,0x3
  80619c:	01 d6                	add    esi,edx
  80619e:	66 67 89 1e          	mov    WORD PTR [esi],bx
  8061a2:	66 67 89 46 02       	mov    WORD PTR [esi+0x2],ax
  8061a7:	c1 e8 10             	shr    eax,0x10
  8061aa:	67 88 46 04          	mov    BYTE PTR [esi+0x4],al
  8061ae:	c1 eb 10             	shr    ebx,0x10
  8061b1:	67 88 5e 06          	mov    BYTE PTR [esi+0x6],bl
  8061b5:	67 88 66 07          	mov    BYTE PTR [esi+0x7],ah
  8061b9:	67 09 4e 05          	or     DWORD PTR [esi+0x5],ecx
  8061bd:	c3                   	ret    

00000000008061be <clock_c>:
#include <devman.h>
#include <disk.h>
extern int manage_proc_lock;
extern int cur_proc;
extern struct process *task;
void clock_c(){
  8061be:	f3 0f 1e fa          	endbr64 
  8061c2:	55                   	push   rbp
  8061c3:	48 89 e5             	mov    rbp,rsp
    //refresh_wnds();
    execute_request();
  8061c6:	b8 00 00 00 00       	mov    eax,0x0
  8061cb:	e8 e5 27 00 00       	call   8089b5 <execute_request>
    do_req();
  8061d0:	b8 00 00 00 00       	mov    eax,0x0
  8061d5:	e8 87 d5 ff ff       	call   803761 <do_req>
    if(!manage_proc_lock)
  8061da:	8b 05 e8 66 00 00    	mov    eax,DWORD PTR [rip+0x66e8]        # 80c8c8 <manage_proc_lock>
  8061e0:	85 c0                	test   eax,eax
  8061e2:	75 0a                	jne    8061ee <clock_c+0x30>
    {
        manage_proc();
  8061e4:	b8 00 00 00 00       	mov    eax,0x0
  8061e9:	e8 31 dd ff ff       	call   803f1f <manage_proc>
    }
    //puts("1 disk req executed.");
  8061ee:	90                   	nop
  8061ef:	5d                   	pop    rbp
  8061f0:	c3                   	ret    
  8061f1:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  8061f8:	00 00 00 
  8061fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000806200 <clock>:
  806200:	50                   	push   rax
  806201:	53                   	push   rbx
  806202:	51                   	push   rcx
  806203:	52                   	push   rdx
  806204:	57                   	push   rdi
  806205:	56                   	push   rsi
  806206:	41 50                	push   r8
  806208:	41 51                	push   r9
  80620a:	41 52                	push   r10
  80620c:	41 53                	push   r11
  80620e:	41 54                	push   r12
  806210:	41 55                	push   r13
  806212:	41 56                	push   r14
  806214:	41 57                	push   r15
  806216:	e8 dc dc ff ff       	call   803ef7 <save_rsp>
  80621b:	66 8c c0             	mov    ax,es
  80621e:	50                   	push   rax
  80621f:	66 8c d8             	mov    ax,ds
  806222:	50                   	push   rax
  806223:	66 b8 10 00          	mov    ax,0x10
  806227:	8e c0                	mov    es,eax
  806229:	8e d8                	mov    ds,eax

000000000080622b <clock.normal_part>:
  80622b:	b0 20                	mov    al,0x20
  80622d:	e6 a0                	out    0xa0,al
  80622f:	e6 20                	out    0x20,al
  806231:	e8 88 ff ff ff       	call   8061be <clock_c>
  806236:	58                   	pop    rax
  806237:	8e d8                	mov    ds,eax
  806239:	58                   	pop    rax
  80623a:	8e c0                	mov    es,eax
  80623c:	41 5f                	pop    r15
  80623e:	41 5e                	pop    r14
  806240:	41 5d                	pop    r13
  806242:	41 5c                	pop    r12
  806244:	41 5b                	pop    r11
  806246:	41 5a                	pop    r10
  806248:	41 59                	pop    r9
  80624a:	41 58                	pop    r8
  80624c:	5e                   	pop    rsi
  80624d:	5f                   	pop    rdi
  80624e:	5a                   	pop    rdx
  80624f:	59                   	pop    rcx
  806250:	5b                   	pop    rbx
  806251:	58                   	pop    rax
  806252:	48 cf                	iretq  

0000000000806254 <execute>:
    return ind;
}
*/

int execute(char *path, char **argv)
{
  806254:	f3 0f 1e fa          	endbr64 
  806258:	55                   	push   rbp
  806259:	48 89 e5             	mov    rbp,rsp
  80625c:	48 83 ec 30          	sub    rsp,0x30
  806260:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  806264:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    //尚未切换到目标进程
    //syscall(SYSCALL_REG_PROC, load_pe,0,0,0,0);
    int fno=-1,cwd_fno=-1;
  806268:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  80626f:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    if((fno=sys_open(path, O_EXEC)) <0)return -1;
  806276:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80627a:	be 00 10 00 00       	mov    esi,0x1000
  80627f:	48 89 c7             	mov    rdi,rax
  806282:	e8 75 16 00 00       	call   8078fc <sys_open>
  806287:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  80628a:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80628e:	79 0a                	jns    80629a <execute+0x46>
  806290:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806295:	e9 ba 00 00 00       	jmp    806354 <execute+0x100>
    //
    char *p=path;
  80629a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80629e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='\0';p++);
  8062a2:	eb 05                	jmp    8062a9 <execute+0x55>
  8062a4:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  8062a9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8062ad:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8062b0:	84 c0                	test   al,al
  8062b2:	75 f0                	jne    8062a4 <execute+0x50>
    for(;*p!='/'&&p>path;p--);
  8062b4:	eb 05                	jmp    8062bb <execute+0x67>
  8062b6:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  8062bb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8062bf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8062c2:	3c 2f                	cmp    al,0x2f
  8062c4:	74 0a                	je     8062d0 <execute+0x7c>
  8062c6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8062ca:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  8062ce:	77 e6                	ja     8062b6 <execute+0x62>
    if(p>path)
  8062d0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8062d4:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  8062d8:	76 2f                	jbe    806309 <execute+0xb5>
    {
        *p='\0';
  8062da:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8062de:	c6 00 00             	mov    BYTE PTR [rax],0x0
        if((cwd_fno=sys_open(path, O_DIRECTORY)) <0)return -1;
  8062e1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8062e5:	be 00 40 00 00       	mov    esi,0x4000
  8062ea:	48 89 c7             	mov    rdi,rax
  8062ed:	e8 0a 16 00 00       	call   8078fc <sys_open>
  8062f2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  8062f5:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8062f9:	79 07                	jns    806302 <execute+0xae>
  8062fb:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806300:	eb 52                	jmp    806354 <execute+0x100>
        *p='/';
  806302:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806306:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
    }
    extern struct file opened[];
    extern struct process task[];
    int pi= reg_proc(proc_start, &opened[cwd_fno], &opened[fno]);
  806309:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80630c:	48 63 d0             	movsxd rdx,eax
  80630f:	48 89 d0             	mov    rax,rdx
  806312:	48 c1 e0 02          	shl    rax,0x2
  806316:	48 01 d0             	add    rax,rdx
  806319:	48 c1 e0 03          	shl    rax,0x3
  80631d:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  806324:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806327:	48 63 c8             	movsxd rcx,eax
  80632a:	48 89 c8             	mov    rax,rcx
  80632d:	48 c1 e0 02          	shl    rax,0x2
  806331:	48 01 c8             	add    rax,rcx
  806334:	48 c1 e0 03          	shl    rax,0x3
  806338:	48 05 60 06 40 00    	add    rax,0x400660
  80633e:	b9 b9 64 80 00       	mov    ecx,0x8064b9
  806343:	48 89 c6             	mov    rsi,rax
  806346:	48 89 cf             	mov    rdi,rcx
  806349:	e8 d3 e3 ff ff       	call   804721 <reg_proc>
  80634e:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    return pi;
  806351:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
}
  806354:	c9                   	leave  
  806355:	c3                   	ret    

0000000000806356 <sys_execve>:

int sys_execve(char *path,char **argv){
  806356:	f3 0f 1e fa          	endbr64 
  80635a:	55                   	push   rbp
  80635b:	48 89 e5             	mov    rbp,rsp
  80635e:	48 83 ec 30          	sub    rsp,0x30
  806362:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  806366:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    int fno=-1,cwd_fno=-1;
  80636a:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
  806371:	c7 45 f8 ff ff ff ff 	mov    DWORD PTR [rbp-0x8],0xffffffff
    if((fno=sys_open(path, O_EXEC)) <0)return -ENOENT;
  806378:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80637c:	be 00 10 00 00       	mov    esi,0x1000
  806381:	48 89 c7             	mov    rdi,rax
  806384:	e8 73 15 00 00       	call   8078fc <sys_open>
  806389:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  80638c:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  806390:	79 0a                	jns    80639c <sys_execve+0x46>
  806392:	b8 d3 ff ff ff       	mov    eax,0xffffffd3
  806397:	e9 ad 00 00 00       	jmp    806449 <sys_execve+0xf3>
//        if((cwd_fno=sys_open(path, O_DIRECTORY)) <0)return -1;
//        *p='/';
//    }
    extern struct file opened[];
    extern struct process task[];
    if(sys_close(current->exef-opened)<0)return -1;
  80639c:	48 8b 05 fd f1 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f1fd]        # 4155a0 <current>
  8063a3:	48 8b 80 d0 00 00 00 	mov    rax,QWORD PTR [rax+0xd0]
  8063aa:	48 2d 60 06 40 00    	sub    rax,0x400660
  8063b0:	48 c1 f8 03          	sar    rax,0x3
  8063b4:	48 89 c2             	mov    rdx,rax
  8063b7:	48 b8 cd cc cc cc cc 	movabs rax,0xcccccccccccccccd
  8063be:	cc cc cc 
  8063c1:	48 0f af c2          	imul   rax,rdx
  8063c5:	89 c7                	mov    edi,eax
  8063c7:	e8 6e 19 00 00       	call   807d3a <sys_close>

    void *retp= load_pe;
  8063cc:	48 c7 45 f0 eb 64 80 	mov    QWORD PTR [rbp-0x10],0x8064eb
  8063d3:	00 
    current->exef=&opened[fno];//改变执行文件
  8063d4:	48 8b 15 c5 f1 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0f1c5]        # 4155a0 <current>
  8063db:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8063de:	48 63 c8             	movsxd rcx,eax
  8063e1:	48 89 c8             	mov    rax,rcx
  8063e4:	48 c1 e0 02          	shl    rax,0x2
  8063e8:	48 01 c8             	add    rax,rcx
  8063eb:	48 c1 e0 03          	shl    rax,0x3
  8063ef:	48 05 60 06 40 00    	add    rax,0x400660
  8063f5:	48 89 82 d0 00 00 00 	mov    QWORD PTR [rdx+0xd0],rax
    //重新设置进程数据
    //清空原来的页表
    release_mmap(current);
  8063fc:	48 8b 05 9d f1 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f19d]        # 4155a0 <current>
  806403:	48 89 c7             	mov    rdi,rax
  806406:	e8 23 f1 ff ff       	call   80552e <release_mmap>
    current->regs.rsp=STACK_TOP;//清空栈
  80640b:	48 8b 05 8e f1 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f18e]        # 4155a0 <current>
  806412:	48 be 00 f0 ff ff ff 	movabs rsi,0xfffffffff000
  806419:	ff 00 00 
  80641c:	48 89 b0 7c 02 00 00 	mov    QWORD PTR [rax+0x27c],rsi
    extern TSS* tss;
    //sysret直接返回到load_pe加载新程序，然后直接开始运行新程序的main
    stack_store_regs *rs=tss->ists[0]- sizeof(stack_store_regs);
  806423:	48 8b 05 56 65 00 00 	mov    rax,QWORD PTR [rip+0x6556]        # 80c980 <tss>
  80642a:	48 8b 40 24          	mov    rax,QWORD PTR [rax+0x24]
  80642e:	48 2d a8 00 00 00    	sub    rax,0xa8
  806434:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    rs->rcx=retp;
  806438:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80643c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806440:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    return 0;
  806444:	b8 00 00 00 00       	mov    eax,0x0
}
  806449:	c9                   	leave  
  80644a:	c3                   	ret    

000000000080644b <exec_call>:
int exec_call(char *path)
{
  80644b:	f3 0f 1e fa          	endbr64 
  80644f:	55                   	push   rbp
  806450:	48 89 e5             	mov    rbp,rsp
  806453:	48 83 ec 20          	sub    rsp,0x20
  806457:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pi= execute(path, NULL);
  80645b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80645f:	be 00 00 00 00       	mov    esi,0x0
  806464:	48 89 c7             	mov    rdi,rax
  806467:	e8 e8 fd ff ff       	call   806254 <execute>
  80646c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int tss= _TSS_IND(pi)*8;
  80646f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806472:	01 c0                	add    eax,eax
  806474:	83 c0 05             	add    eax,0x5
  806477:	c1 e0 03             	shl    eax,0x3
  80647a:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    extern struct process task[];
    extern int cur_proc;
    switch_proc_tss(pi);
  80647d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806480:	89 c7                	mov    edi,eax
  806482:	e8 2b dc ff ff       	call   8040b2 <switch_proc_tss>
    while(task[pi].stat!=ENDED);
  806487:	90                   	nop
  806488:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80648b:	48 98                	cdqe   
  80648d:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  806494:	48 05 b0 84 40 00    	add    rax,0x4084b0
  80649a:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80649d:	83 f8 03             	cmp    eax,0x3
  8064a0:	75 e6                	jne    806488 <exec_call+0x3d>
    return task[pi].exit_code;
  8064a2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8064a5:	48 98                	cdqe   
  8064a7:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8064ae:	48 05 c0 84 40 00    	add    rax,0x4084c0
  8064b4:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
}
  8064b7:	c9                   	leave  
  8064b8:	c3                   	ret    

00000000008064b9 <proc_start>:
int proc_start()
{
  8064b9:	f3 0f 1e fa          	endbr64 
  8064bd:	55                   	push   rbp
  8064be:	48 89 e5             	mov    rbp,rsp
    extern struct process task[];
    extern int cur_proc;
    load_pe(&task[cur_proc]);
  8064c1:	8b 05 65 f1 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f165]        # 41562c <cur_proc>
  8064c7:	48 98                	cdqe   
  8064c9:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8064d0:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8064d6:	48 89 c7             	mov    rdi,rax
  8064d9:	e8 0d 00 00 00       	call   8064eb <load_pe>
    //释放进程资源
    sys_exit(0);
  8064de:	bf 00 00 00 00       	mov    edi,0x0
  8064e3:	e8 11 e2 ff ff       	call   8046f9 <sys_exit>
}
  8064e8:	90                   	nop
  8064e9:	5d                   	pop    rbp
  8064ea:	c3                   	ret    

00000000008064eb <load_pe>:
//在cr3切换到目标进程下的加载程序
int load_pe(struct process *proc)
{
  8064eb:	f3 0f 1e fa          	endbr64 
  8064ef:	55                   	push   rbp
  8064f0:	48 89 e5             	mov    rbp,rsp
  8064f3:	48 81 ec c0 02 00 00 	sub    rsp,0x2c0
  8064fa:	48 89 bd 48 fd ff ff 	mov    QWORD PTR [rbp-0x2b8],rdi
    // 读取文件头
    struct file *f=proc->exef;
  806501:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  806508:	48 8b 80 d0 00 00 00 	mov    rax,QWORD PTR [rax+0xd0]
  80650f:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    int exefno=-1;
  806513:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    for(int i=0;i<MAX_PROC_OPENF;i++)
  80651a:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  806521:	eb 28                	jmp    80654b <load_pe+0x60>
        if(current->openf[i]==f)
  806523:	48 8b 05 76 f0 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f076]        # 4155a0 <current>
  80652a:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  80652d:	48 63 d2             	movsxd rdx,edx
  806530:	48 83 c2 1a          	add    rdx,0x1a
  806534:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  806539:	48 39 45 98          	cmp    QWORD PTR [rbp-0x68],rax
  80653d:	75 08                	jne    806547 <load_pe+0x5c>
        {
            exefno=i;
  80653f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806542:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
            break;
  806545:	eb 0a                	jmp    806551 <load_pe+0x66>
    for(int i=0;i<MAX_PROC_OPENF;i++)
  806547:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80654b:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  80654f:	7e d2                	jle    806523 <load_pe+0x38>
        }
    if(exefno==-1)return ERR;
  806551:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  806555:	75 0a                	jne    806561 <load_pe+0x76>
  806557:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80655c:	e9 f1 06 00 00       	jmp    806c52 <load_pe+0x767>

    IMAGE_DOS_HEADER tdh;
    IMAGE_NT_HEADERS32 tnth;
    sys_read(exefno, &tdh, sizeof(tdh));
  806561:	48 8d 8d 80 fe ff ff 	lea    rcx,[rbp-0x180]
  806568:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80656b:	ba 44 00 00 00       	mov    edx,0x44
  806570:	48 89 ce             	mov    rsi,rcx
  806573:	89 c7                	mov    edi,eax
  806575:	e8 78 18 00 00       	call   807df2 <sys_read>
    sys_lseek(exefno,tdh.e_lfanew,SEEK_SET);
  80657a:	48 8b 85 bc fe ff ff 	mov    rax,QWORD PTR [rbp-0x144]
  806581:	48 89 c1             	mov    rcx,rax
  806584:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806587:	ba 00 00 00 00       	mov    edx,0x0
  80658c:	48 89 ce             	mov    rsi,rcx
  80658f:	89 c7                	mov    edi,eax
  806591:	e8 bc 19 00 00       	call   807f52 <sys_lseek>
    sys_read(exefno, &tnth, sizeof(tnth));
  806596:	48 8d 8d 70 fd ff ff 	lea    rcx,[rbp-0x290]
  80659d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8065a0:	ba 0c 01 00 00       	mov    edx,0x10c
  8065a5:	48 89 ce             	mov    rsi,rcx
  8065a8:	89 c7                	mov    edi,eax
  8065aa:	e8 43 18 00 00       	call   807df2 <sys_read>

    //是否需要移动base(先不检查)
    addr_t nbase=tnth.OptionalHeader.ImageBase;
  8065af:	48 8b 85 a4 fd ff ff 	mov    rax,QWORD PTR [rbp-0x25c]
  8065b6:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    int pgn=tnth.OptionalHeader.SizeOfImage/PAGE_SIZE;
  8065ba:	8b 85 c4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x23c]
  8065c0:	c1 e8 0c             	shr    eax,0xc
  8065c3:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
//        break;
//    }

    //proc->tss.eip=tnth.OptionalHeader.AddressOfEntryPoint+nbase;
    //存放文件头
    sys_lseek(exefno,0,SEEK_SET);
  8065c6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8065c9:	ba 00 00 00 00       	mov    edx,0x0
  8065ce:	be 00 00 00 00       	mov    esi,0x0
  8065d3:	89 c7                	mov    edi,eax
  8065d5:	e8 78 19 00 00       	call   807f52 <sys_lseek>
    sys_read(exefno, nbase, PAGE_SIZE);
  8065da:	48 8b 4d 90          	mov    rcx,QWORD PTR [rbp-0x70]
  8065de:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8065e1:	ba 00 10 00 00       	mov    edx,0x1000
  8065e6:	48 89 ce             	mov    rsi,rcx
  8065e9:	89 c7                	mov    edi,eax
  8065eb:	e8 02 18 00 00       	call   807df2 <sys_read>
    //dos头
    PIMAGE_DOS_HEADER dosh=nbase;
  8065f0:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8065f4:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
    PIMAGE_NT_HEADERS64 nth=nbase+dosh->e_lfanew;
  8065f8:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8065fc:	48 8b 50 3c          	mov    rdx,QWORD PTR [rax+0x3c]
  806600:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806604:	48 01 d0             	add    rax,rdx
  806607:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    PIMAGE_FILE_HEADER fh=&nth->FileHeader;
  80660e:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806615:	48 83 c0 04          	add    rax,0x4
  806619:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    //为新进程分配内存页
    //计算所需的页
    int prog_size=nth->OptionalHeader.SizeOfImage;
  806620:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806627:	8b 40 50             	mov    eax,DWORD PTR [rax+0x50]
  80662a:	89 85 6c ff ff ff    	mov    DWORD PTR [rbp-0x94],eax
    int page_count=prog_size/4096;
  806630:	8b 85 6c ff ff ff    	mov    eax,DWORD PTR [rbp-0x94]
  806636:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80663c:	85 c0                	test   eax,eax
  80663e:	0f 48 c2             	cmovs  eax,edx
  806641:	c1 f8 0c             	sar    eax,0xc
  806644:	89 85 68 ff ff ff    	mov    DWORD PTR [rbp-0x98],eax

    addr_t shell_addr=nth->OptionalHeader.AddressOfEntryPoint+nbase;
  80664a:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806651:	8b 40 28             	mov    eax,DWORD PTR [rax+0x28]
  806654:	89 c2                	mov    edx,eax
  806656:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80665a:	48 01 d0             	add    rax,rdx
  80665d:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
    int page_index_item_count=page_count/1024+page_count%1024==0?0:1;
  806664:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [rbp-0x98]
  80666a:	8d 90 ff 03 00 00    	lea    edx,[rax+0x3ff]
  806670:	85 c0                	test   eax,eax
  806672:	0f 48 c2             	cmovs  eax,edx
  806675:	c1 f8 0a             	sar    eax,0xa
  806678:	89 c1                	mov    ecx,eax
  80667a:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [rbp-0x98]
  806680:	99                   	cdq    
  806681:	c1 ea 16             	shr    edx,0x16
  806684:	01 d0                	add    eax,edx
  806686:	25 ff 03 00 00       	and    eax,0x3ff
  80668b:	29 d0                	sub    eax,edx
  80668d:	01 c8                	add    eax,ecx
  80668f:	85 c0                	test   eax,eax
  806691:	0f 95 c0             	setne  al
  806694:	0f b6 c0             	movzx  eax,al
  806697:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
    int start_pgind_item=shell_addr/PAGE_INDEX_SIZE;
  80669d:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  8066a4:	48 c1 e8 15          	shr    rax,0x15
  8066a8:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax

    //sys_read sections
    PIMAGE_SECTION_HEADER psec=(u32)nth+sizeof(IMAGE_NT_HEADERS32);
  8066ae:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8066b5:	89 c0                	mov    eax,eax
  8066b7:	48 05 0c 01 00 00    	add    rax,0x10c
  8066bd:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
    nth->FileHeader.NumberOfSections*sizeof(IMAGE_SECTION_HEADER);
  8066c1:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8066c8:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  8066cc:	0f b7 d0             	movzx  edx,ax
  8066cf:	89 d0                	mov    eax,edx
  8066d1:	c1 e0 02             	shl    eax,0x2
  8066d4:	01 d0                	add    eax,edx
  8066d6:	c1 e0 03             	shl    eax,0x3
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
  8066d9:	05 50 01 00 00       	add    eax,0x150
  8066de:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
    int align=nth->OptionalHeader.FileAlignment;
  8066e4:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8066eb:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  8066ee:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    data_start=data_start%align?data_start-data_start%align+align:data_start;
  8066f4:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  8066fa:	99                   	cdq    
  8066fb:	f7 bd 50 ff ff ff    	idiv   DWORD PTR [rbp-0xb0]
  806701:	89 d0                	mov    eax,edx
  806703:	85 c0                	test   eax,eax
  806705:	74 23                	je     80672a <load_pe+0x23f>
  806707:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  80670d:	99                   	cdq    
  80670e:	f7 bd 50 ff ff ff    	idiv   DWORD PTR [rbp-0xb0]
  806714:	89 d1                	mov    ecx,edx
  806716:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  80671c:	29 c8                	sub    eax,ecx
  80671e:	89 c2                	mov    edx,eax
  806720:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  806726:	01 d0                	add    eax,edx
  806728:	eb 06                	jmp    806730 <load_pe+0x245>
  80672a:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  806730:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  806736:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80673d:	eb 6b                	jmp    8067aa <load_pe+0x2bf>
    {
        int disca=psec->Characteristics&IMAGE_SCN_MEM_DISCARDABLE;
  80673f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806743:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  806746:	25 00 00 00 02       	and    eax,0x2000000
  80674b:	89 85 c4 fe ff ff    	mov    DWORD PTR [rbp-0x13c],eax
        if(disca)
  806751:	83 bd c4 fe ff ff 00 	cmp    DWORD PTR [rbp-0x13c],0x0
  806758:	75 46                	jne    8067a0 <load_pe+0x2b5>
            continue;
        //直接读，缺页内核解决
        sys_lseek(exefno,psec->PointerToRawData,SEEK_SET);
  80675a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80675e:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  806761:	89 c1                	mov    ecx,eax
  806763:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806766:	ba 00 00 00 00       	mov    edx,0x0
  80676b:	48 89 ce             	mov    rsi,rcx
  80676e:	89 c7                	mov    edi,eax
  806770:	e8 dd 17 00 00       	call   807f52 <sys_lseek>
        sys_read(exefno, psec->VirtualAddress + nbase,  psec->SizeOfRawData);
  806775:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806779:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80677c:	89 c2                	mov    edx,eax
  80677e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806782:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  806785:	89 c1                	mov    ecx,eax
  806787:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80678b:	48 01 c8             	add    rax,rcx
  80678e:	48 89 c1             	mov    rcx,rax
  806791:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806794:	48 89 ce             	mov    rsi,rcx
  806797:	89 c7                	mov    edi,eax
  806799:	e8 54 16 00 00       	call   807df2 <sys_read>
  80679e:	eb 01                	jmp    8067a1 <load_pe+0x2b6>
            continue;
  8067a0:	90                   	nop
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  8067a1:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8067a5:	48 83 45 f0 28       	add    QWORD PTR [rbp-0x10],0x28
  8067aa:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8067b1:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  8067b5:	0f b7 c0             	movzx  eax,ax
  8067b8:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8067bb:	7c 82                	jl     80673f <load_pe+0x254>

    }

    //通过导入表加载需要的dll
    PIMAGE_DATA_DIRECTORY impd=&nth->OptionalHeader.DataDirectory[1];
  8067bd:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8067c4:	48 05 90 00 00 00    	add    rax,0x90
  8067ca:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    if(impd->Size>0)
  8067d1:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8067d8:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8067db:	85 c0                	test   eax,eax
  8067dd:	0f 84 7b 02 00 00    	je     806a5e <load_pe+0x573>
    {
        int tmpi=impd->VirtualAddress+nbase;
  8067e3:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8067ea:	8b 10                	mov    edx,DWORD PTR [rax]
  8067ec:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8067f0:	01 d0                	add    eax,edx
  8067f2:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
        PIMAGE_IMPORT_DESCRIPTOR impdes=tmpi;
  8067f8:	8b 85 44 ff ff ff    	mov    eax,DWORD PTR [rbp-0xbc]
  8067fe:	48 98                	cdqe   
  806800:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        int dllp;
        while (impdes->Characteristics)
  806804:	e9 47 02 00 00       	jmp    806a50 <load_pe+0x565>
        {
            //加载dll
            char *dllname=impdes->Name+nbase;
  806809:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80680d:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  806810:	89 c2                	mov    edx,eax
  806812:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806816:	48 01 d0             	add    rax,rdx
  806819:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
            //此处应有加载dll代码
            int dlli;
            if(strcmp(dllname,"sys.dll")==0)//加载系统dll的部分由内核已经完成
  806820:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
  806827:	be 67 46 81 00       	mov    esi,0x814667
  80682c:	48 89 c7             	mov    rdi,rax
  80682f:	e8 5f 59 00 00       	call   80c193 <strcmp>
  806834:	85 c0                	test   eax,eax
  806836:	75 09                	jne    806841 <load_pe+0x356>
            {
                dllp=0x1c00000;
  806838:	c7 45 dc 00 00 c0 01 	mov    DWORD PTR [rbp-0x24],0x1c00000
  80683f:	eb 25                	jmp    806866 <load_pe+0x37b>
            }else{
                //load_pe要记录module的加载
                dlli= load_pe(proc);
  806841:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  806848:	48 89 c7             	mov    rdi,rax
  80684b:	e8 9b fc ff ff       	call   8064eb <load_pe>
  806850:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
                //dlli=load_library(dllname);
                //这个是线性地址
                dllp=get_module_addr(dlli);
  806856:	8b 85 34 ff ff ff    	mov    eax,DWORD PTR [rbp-0xcc]
  80685c:	89 c7                	mov    edi,eax
  80685e:	e8 f1 03 00 00       	call   806c54 <get_module_addr>
  806863:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            }
            //从线性地址查页表找到物理地址
            PIMAGE_DOS_HEADER dlldos=dllp;
  806866:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806869:	48 98                	cdqe   
  80686b:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
            PIMAGE_NT_HEADERS32 dllnth=dllp+dlldos->e_lfanew;
  806872:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806875:	48 63 d0             	movsxd rdx,eax
  806878:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  80687f:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  806883:	48 01 d0             	add    rax,rdx
  806886:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
            PIMAGE_EXPORT_DIRECTORY dllexp=(dllnth->OptionalHeader.DataDirectory[0].VirtualAddress+dllp);
  80688d:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  806894:	8b 90 8c 00 00 00    	mov    edx,DWORD PTR [rax+0x8c]
  80689a:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80689d:	01 d0                	add    eax,edx
  80689f:	89 c0                	mov    eax,eax
  8068a1:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
            int funcn=dllexp->NumberOfNames;
  8068a8:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8068af:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  8068b2:	89 85 14 ff ff ff    	mov    DWORD PTR [rbp-0xec],eax
            char **fnames=dllexp->AddressOfNames+dllp;
  8068b8:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8068bf:	8b 50 20             	mov    edx,DWORD PTR [rax+0x20]
  8068c2:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8068c5:	01 d0                	add    eax,edx
  8068c7:	89 c0                	mov    eax,eax
  8068c9:	48 89 85 08 ff ff ff 	mov    QWORD PTR [rbp-0xf8],rax
            int *funcaddrs=dllexp->AddressOfFunctions+dllp;
  8068d0:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8068d7:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8068da:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8068dd:	01 d0                	add    eax,edx
  8068df:	89 c0                	mov    eax,eax
  8068e1:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
            short *funcords=dllexp->AddressOfNameOrdinals+dllp;
  8068e8:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8068ef:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  8068f2:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8068f5:	01 d0                	add    eax,edx
  8068f7:	89 c0                	mov    eax,eax
  8068f9:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
            //寻找nameordinal的base（最小值），里面的数据加上base才是真正的序号
            unsigned int ord_base=dllexp->Base;
  806900:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  806907:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80690a:	89 85 f4 fe ff ff    	mov    DWORD PTR [rbp-0x10c],eax
            //开始将导入表IAT的内容更新为函数地址
            unsigned int *iataddrs=impdes->FirstThunk+nbase;//IAT和INT内容一样，只用IAT
  806910:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806914:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  806917:	89 c2                	mov    edx,eax
  806919:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80691d:	48 01 d0             	add    rax,rdx
  806920:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            char **siataddrs=impdes->FirstThunk+nbase;
  806924:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806928:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80692b:	89 c2                	mov    edx,eax
  80692d:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806931:	48 01 d0             	add    rax,rdx
  806934:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            while (*iataddrs)
  806938:	e9 00 01 00 00       	jmp    806a3d <load_pe+0x552>
            {
                //判断是序号导入还是名称导入
                if(((unsigned)*iataddrs)&0x80000000)
  80693d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806941:	8b 00                	mov    eax,DWORD PTR [rax]
  806943:	85 c0                	test   eax,eax
  806945:	79 43                	jns    80698a <load_pe+0x49f>
                {
                    //序号导入
                    unsigned int ord=((*iataddrs)&0x7fffffff)-ord_base;
  806947:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80694b:	8b 00                	mov    eax,DWORD PTR [rax]
  80694d:	25 ff ff ff 7f       	and    eax,0x7fffffff
  806952:	2b 85 f4 fe ff ff    	sub    eax,DWORD PTR [rbp-0x10c]
  806958:	89 85 e0 fe ff ff    	mov    DWORD PTR [rbp-0x120],eax
                    *iataddrs=funcaddrs[ord]+dllp;
  80695e:	8b 85 e0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x120]
  806964:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  80696b:	00 
  80696c:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  806973:	48 01 d0             	add    rax,rdx
  806976:	8b 10                	mov    edx,DWORD PTR [rax]
  806978:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80697b:	01 d0                	add    eax,edx
  80697d:	89 c2                	mov    edx,eax
  80697f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806983:	89 10                	mov    DWORD PTR [rax],edx
  806985:	e9 a9 00 00 00       	jmp    806a33 <load_pe+0x548>
                }else
                {
                    //名称导入
                    char *import_by_name_p=*iataddrs;//指向IMPORT_BY_NAME
  80698a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80698e:	8b 00                	mov    eax,DWORD PTR [rax]
  806990:	89 c0                	mov    eax,eax
  806992:	48 89 85 e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],rax
                    import_by_name_p+=2;//跳过开头两字节序号
  806999:	48 83 85 e8 fe ff ff 	add    QWORD PTR [rbp-0x118],0x2
  8069a0:	02 
                    int i=0;
  8069a1:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
                    for(;i<funcn;i++)
  8069a8:	eb 7a                	jmp    806a24 <load_pe+0x539>
                    {
                        if(strcmp(import_by_name_p,fnames[i])==0)
  8069aa:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8069ad:	48 98                	cdqe   
  8069af:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8069b6:	00 
  8069b7:	48 8b 85 08 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf8]
  8069be:	48 01 d0             	add    rax,rdx
  8069c1:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8069c4:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
  8069cb:	48 89 d6             	mov    rsi,rdx
  8069ce:	48 89 c7             	mov    rdi,rax
  8069d1:	e8 bd 57 00 00       	call   80c193 <strcmp>
  8069d6:	85 c0                	test   eax,eax
  8069d8:	75 46                	jne    806a20 <load_pe+0x535>
                        {
                            int ordi=funcords[i];
  8069da:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8069dd:	48 98                	cdqe   
  8069df:	48 8d 14 00          	lea    rdx,[rax+rax*1]
  8069e3:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8069ea:	48 01 d0             	add    rax,rdx
  8069ed:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8069f0:	98                   	cwde   
  8069f1:	89 85 e4 fe ff ff    	mov    DWORD PTR [rbp-0x11c],eax
                            *iataddrs=funcaddrs[ordi]+dllp;//导入表中的IAT内容修改成地址
  8069f7:	8b 85 e4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x11c]
  8069fd:	48 98                	cdqe   
  8069ff:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  806a06:	00 
  806a07:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  806a0e:	48 01 d0             	add    rax,rdx
  806a11:	8b 10                	mov    edx,DWORD PTR [rax]
  806a13:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806a16:	01 d0                	add    eax,edx
  806a18:	89 c2                	mov    edx,eax
  806a1a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806a1e:	89 10                	mov    DWORD PTR [rax],edx
                    for(;i<funcn;i++)
  806a20:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
  806a24:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  806a27:	3b 85 14 ff ff ff    	cmp    eax,DWORD PTR [rbp-0xec]
  806a2d:	0f 8c 77 ff ff ff    	jl     8069aa <load_pe+0x4bf>
                        }
                    }
                }
                iataddrs++;
  806a33:	48 83 45 d0 04       	add    QWORD PTR [rbp-0x30],0x4
                siataddrs++;
  806a38:	48 83 45 c8 08       	add    QWORD PTR [rbp-0x38],0x8
            while (*iataddrs)
  806a3d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806a41:	8b 00                	mov    eax,DWORD PTR [rax]
  806a43:	85 c0                	test   eax,eax
  806a45:	0f 85 f2 fe ff ff    	jne    80693d <load_pe+0x452>
            }
            impdes++;
  806a4b:	48 83 45 e0 14       	add    QWORD PTR [rbp-0x20],0x14
        while (impdes->Characteristics)
  806a50:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806a54:	8b 00                	mov    eax,DWORD PTR [rax]
  806a56:	85 c0                	test   eax,eax
  806a58:	0f 85 ab fd ff ff    	jne    806809 <load_pe+0x31e>
        }
    }


    //开始重定位
    PIMAGE_BASE_RELOCATION relp=0;
  806a5e:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  806a65:	00 
    if(nth->OptionalHeader.DataDirectory[5].Size>0)
  806a66:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806a6d:	8b 80 b4 00 00 00    	mov    eax,DWORD PTR [rax+0xb4]
  806a73:	85 c0                	test   eax,eax
  806a75:	0f 84 ec 00 00 00    	je     806b67 <load_pe+0x67c>
    {
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  806a7b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806a82:	8b 90 b0 00 00 00    	mov    edx,DWORD PTR [rax+0xb0]
                                +(u32)nbase);
  806a88:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  806a8c:	01 d0                	add    eax,edx
  806a8e:	89 c0                	mov    eax,eax
  806a90:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        u16 *reloc=relp+sizeof(IMAGE_BASE_RELOCATION);
  806a94:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806a98:	48 83 c0 40          	add    rax,0x40
  806a9c:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        u16 *rtype=reloc+1;
  806aa0:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  806aa4:	48 83 c0 02          	add    rax,0x2
  806aa8:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
        int old_base=nth->OptionalHeader.ImageBase;
  806aac:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806ab3:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806ab7:	89 85 dc fe ff ff    	mov    DWORD PTR [rbp-0x124],eax
        while(relp->VirtualAddress){
  806abd:	e9 97 00 00 00       	jmp    806b59 <load_pe+0x66e>
            int pgva=relp->VirtualAddress+nbase;
  806ac2:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806ac6:	8b 10                	mov    edx,DWORD PTR [rax]
  806ac8:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806acc:	01 d0                	add    eax,edx
  806ace:	89 85 d8 fe ff ff    	mov    DWORD PTR [rbp-0x128],eax
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  806ad4:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
  806adb:	eb 5a                	jmp    806b37 <load_pe+0x64c>
            {
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  806add:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  806ae1:	0f b7 00             	movzx  eax,WORD PTR [rax]
  806ae4:	66 85 c0             	test   ax,ax
  806ae7:	74 49                	je     806b32 <load_pe+0x647>
                int *at=*reloc+pgva;//要重定位的数据的地址
  806ae9:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  806aed:	0f b7 00             	movzx  eax,WORD PTR [rax]
  806af0:	0f b7 d0             	movzx  edx,ax
  806af3:	8b 85 d8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x128]
  806af9:	01 d0                	add    eax,edx
  806afb:	48 98                	cdqe   
  806afd:	48 89 85 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],rax
                *at=*at-old_base+nbase;
  806b04:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
  806b0b:	8b 00                	mov    eax,DWORD PTR [rax]
  806b0d:	2b 85 dc fe ff ff    	sub    eax,DWORD PTR [rbp-0x124]
  806b13:	89 c2                	mov    edx,eax
  806b15:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806b19:	01 d0                	add    eax,edx
  806b1b:	89 c2                	mov    edx,eax
  806b1d:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
  806b24:	89 10                	mov    DWORD PTR [rax],edx
                //下一个
                reloc+=2;
  806b26:	48 83 45 b0 04       	add    QWORD PTR [rbp-0x50],0x4
                rtype+=2;
  806b2b:	48 83 45 a8 04       	add    QWORD PTR [rbp-0x58],0x4
  806b30:	eb 01                	jmp    806b33 <load_pe+0x648>
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  806b32:	90                   	nop
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  806b33:	83 45 a4 01          	add    DWORD PTR [rbp-0x5c],0x1
  806b37:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806b3b:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806b3e:	c1 e8 02             	shr    eax,0x2
  806b41:	89 c2                	mov    edx,eax
  806b43:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  806b46:	39 c2                	cmp    edx,eax
  806b48:	77 93                	ja     806add <load_pe+0x5f2>
            }
            relp=(int)relp+0x1000;
  806b4a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806b4e:	05 00 10 00 00       	add    eax,0x1000
  806b53:	48 98                	cdqe   
  806b55:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        while(relp->VirtualAddress){
  806b59:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806b5d:	8b 00                	mov    eax,DWORD PTR [rax]
  806b5f:	85 c0                	test   eax,eax
  806b61:	0f 85 5b ff ff ff    	jne    806ac2 <load_pe+0x5d7>
        }
    }
    extern struct process task[];
    extern int cur_proc;
    //初始化堆
    chunk_header hdrtmp={
  806b67:	c7 85 50 fd ff ff 00 	mov    DWORD PTR [rbp-0x2b0],0x0
  806b6e:	00 00 00 
  806b71:	c7 85 54 fd ff ff 00 	mov    DWORD PTR [rbp-0x2ac],0x0
  806b78:	00 00 00 
  806b7b:	48 c7 85 58 fd ff ff 	mov    QWORD PTR [rbp-0x2a8],0x0
  806b82:	00 00 00 00 
  806b86:	48 c7 85 60 fd ff ff 	mov    QWORD PTR [rbp-0x2a0],0x0
  806b8d:	00 00 00 00 
            .next=NULL,
            .pgn=0,
            .prev=NULL
    };//空堆
    //拷贝触发页中断然后分配
    memcpy((chunk_header*)HEAP_BASE,&hdrtmp,sizeof(hdrtmp));
  806b91:	48 8d 85 50 fd ff ff 	lea    rax,[rbp-0x2b0]
  806b98:	ba 18 00 00 00       	mov    edx,0x18
  806b9d:	48 89 c6             	mov    rsi,rax
  806ba0:	bf 00 00 00 01       	mov    edi,0x1000000
  806ba5:	e8 4b 53 00 00       	call   80bef5 <memcpy>
    task[cur_proc].mem_struct.heap_base=HEAP_BASE;
  806baa:	8b 05 7c ea c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ea7c]        # 41562c <cur_proc>
  806bb0:	48 98                	cdqe   
  806bb2:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  806bb9:	48 05 c0 84 40 00    	add    rax,0x4084c0
  806bbf:	c7 40 08 00 00 00 01 	mov    DWORD PTR [rax+0x8],0x1000000
    task[cur_proc].mem_struct.heap_top=HEAP_BASE+CHUNK_SIZE;
  806bc6:	8b 05 60 ea c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ea60]        # 41562c <cur_proc>
  806bcc:	48 98                	cdqe   
  806bce:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  806bd5:	48 05 c0 84 40 00    	add    rax,0x4084c0
  806bdb:	c7 40 0c 00 10 00 01 	mov    DWORD PTR [rax+0xc],0x1001000
    //设置栈
    task[cur_proc].mem_struct.stack_top=STACK_TOP;
  806be2:	8b 05 44 ea c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ea44]        # 41562c <cur_proc>
  806be8:	48 98                	cdqe   
  806bea:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  806bf1:	48 05 c0 84 40 00    	add    rax,0x4084c0
  806bf7:	c7 40 14 00 f0 ff ff 	mov    DWORD PTR [rax+0x14],0xfffff000


    //完毕,调用入口函数
    //重定位完毕，准备调用DllMain
    typedef int (*Main)(int,void*);
    Main main=shell_addr;
  806bfe:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  806c05:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
    task[cur_proc].exit_code=main(0,NULL);
  806c0c:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  806c13:	be 00 00 00 00       	mov    esi,0x0
  806c18:	bf 00 00 00 00       	mov    edi,0x0
  806c1d:	ff d0                	call   rax
  806c1f:	8b 15 07 ea c0 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc0ea07]        # 41562c <cur_proc>
  806c25:	89 c1                	mov    ecx,eax
  806c27:	48 63 c2             	movsxd rax,edx
  806c2a:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  806c31:	48 05 c0 84 40 00    	add    rax,0x4084c0
  806c37:	89 48 04             	mov    DWORD PTR [rax+0x4],ecx
    return task[cur_proc].exit_code;
  806c3a:	8b 05 ec e9 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e9ec]        # 41562c <cur_proc>
  806c40:	48 98                	cdqe   
  806c42:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  806c49:	48 05 c0 84 40 00    	add    rax,0x4084c0
  806c4f:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
}
  806c52:	c9                   	leave  
  806c53:	c3                   	ret    

0000000000806c54 <get_module_addr>:

int get_module_addr(int mi)
{
  806c54:	f3 0f 1e fa          	endbr64 
  806c58:	55                   	push   rbp
  806c59:	48 89 e5             	mov    rbp,rsp
  806c5c:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return modules[mi].base;
  806c5f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806c62:	48 98                	cdqe   
  806c64:	8b 04 c5 40 82 42 00 	mov    eax,DWORD PTR [rax*8+0x428240]
}
  806c6b:	5d                   	pop    rbp
  806c6c:	c3                   	ret    

0000000000806c6d <dispose_library>:
int dispose_library(int dlln)
{
  806c6d:	f3 0f 1e fa          	endbr64 
  806c71:	55                   	push   rbp
  806c72:	48 89 e5             	mov    rbp,rsp
  806c75:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if(dlln<0||dlln>=MAX_DLLS)return -1;
  806c78:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  806c7c:	78 09                	js     806c87 <dispose_library+0x1a>
  806c7e:	81 7d fc ff 00 00 00 	cmp    DWORD PTR [rbp-0x4],0xff
  806c85:	7e 07                	jle    806c8e <dispose_library+0x21>
  806c87:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806c8c:	eb 1d                	jmp    806cab <dispose_library+0x3e>
    //空间不够，释放之前申请的
    // for(int j=0;j<dlls[dlln].page_used;j++)
    //     dispose_page(get_phyaddr(dlls[dlln].page_num[j]));
    //释放dll
    dlls[dlln].flag=DLL_STAT_EMPTY;
  806c8e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806c91:	48 98                	cdqe   
  806c93:	48 69 c0 2c 01 00 00 	imul   rax,rax,0x12c
  806c9a:	48 05 48 56 41 00    	add    rax,0x415648
  806ca0:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return 0;
  806ca6:	b8 00 00 00 00       	mov    eax,0x0
}
  806cab:	5d                   	pop    rbp
  806cac:	c3                   	ret    

0000000000806cad <sys_insmod>:

    return 0;
} */

int sys_insmod(char *path)
{
  806cad:	f3 0f 1e fa          	endbr64 
  806cb1:	55                   	push   rbp
  806cb2:	48 89 e5             	mov    rbp,rsp
  806cb5:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  806cb9:	90                   	nop
  806cba:	5d                   	pop    rbp
  806cbb:	c3                   	ret    

0000000000806cbc <sys_rmmod>:
int sys_rmmod(char *name)
{
  806cbc:	f3 0f 1e fa          	endbr64 
  806cc0:	55                   	push   rbp
  806cc1:	48 89 e5             	mov    rbp,rsp
  806cc4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

  806cc8:	90                   	nop
  806cc9:	5d                   	pop    rbp
  806cca:	c3                   	ret    
  806ccb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000806cd0 <_syscall>:
  806cd0:	55                   	push   rbp
  806cd1:	bd 00 80 10 00       	mov    ebp,0x108000
  806cd6:	48 89 65 14          	mov    QWORD PTR [rbp+0x14],rsp
  806cda:	48 8b 65 04          	mov    rsp,QWORD PTR [rbp+0x4]
  806cde:	50                   	push   rax
  806cdf:	53                   	push   rbx
  806ce0:	51                   	push   rcx
  806ce1:	52                   	push   rdx
  806ce2:	57                   	push   rdi
  806ce3:	56                   	push   rsi
  806ce4:	41 50                	push   r8
  806ce6:	41 51                	push   r9
  806ce8:	41 52                	push   r10
  806cea:	41 53                	push   r11
  806cec:	41 54                	push   r12
  806cee:	41 55                	push   r13
  806cf0:	41 56                	push   r14
  806cf2:	41 57                	push   r15
  806cf4:	66 8c c0             	mov    ax,es
  806cf7:	50                   	push   rax
  806cf8:	66 8c d8             	mov    ax,ds
  806cfb:	50                   	push   rax
  806cfc:	66 b8 10 00          	mov    ax,0x10
  806d00:	8e c0                	mov    es,eax
  806d02:	8e d8                	mov    ds,eax
  806d04:	48 8b 44 24 78       	mov    rax,QWORD PTR [rsp+0x78]
  806d09:	41 53                	push   r11
  806d0b:	51                   	push   rcx
  806d0c:	49 87 ca             	xchg   r10,rcx
  806d0f:	e8 86 98 ff ff       	call   80059a <syscall>
  806d14:	4c 87 d1             	xchg   rcx,r10
  806d17:	59                   	pop    rcx
  806d18:	41 5b                	pop    r11
  806d1a:	48 89 44 24 78       	mov    QWORD PTR [rsp+0x78],rax
  806d1f:	58                   	pop    rax
  806d20:	8e d8                	mov    ds,eax
  806d22:	58                   	pop    rax
  806d23:	8e c0                	mov    es,eax
  806d25:	41 5f                	pop    r15
  806d27:	41 5e                	pop    r14
  806d29:	41 5d                	pop    r13
  806d2b:	41 5c                	pop    r12
  806d2d:	41 5b                	pop    r11
  806d2f:	41 5a                	pop    r10
  806d31:	41 59                	pop    r9
  806d33:	41 58                	pop    r8
  806d35:	5e                   	pop    rsi
  806d36:	5f                   	pop    rdi
  806d37:	5a                   	pop    rdx
  806d38:	59                   	pop    rcx
  806d39:	5b                   	pop    rbx
  806d3a:	58                   	pop    rax
  806d3b:	48 89 65 04          	mov    QWORD PTR [rbp+0x4],rsp
  806d3f:	48 8b 65 14          	mov    rsp,QWORD PTR [rbp+0x14]
  806d43:	5d                   	pop    rbp
  806d44:	fb                   	sti    
  806d45:	48 0f 07             	sysretq 

0000000000806d48 <init_framebuffer>:
static u32 font_width_bytes;
static u8 *glyph_table;
static u32 bytes_per_glyph, glyph_nr;
int font_size=1;
void init_framebuffer()
{
  806d48:	f3 0f 1e fa          	endbr64 
  806d4c:	55                   	push   rbp
  806d4d:	48 89 e5             	mov    rbp,rsp
  806d50:	48 83 ec 50          	sub    rsp,0x50
    //映射页帧内存
    size_t w=framebuffer.common.framebuffer_width;
  806d54:	8b 05 fa 18 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc218fa]        # 428654 <framebuffer+0x14>
  806d5a:	89 c0                	mov    eax,eax
  806d5c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    size_t h=framebuffer.common.framebuffer_height;
  806d60:	8b 05 f2 18 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc218f2]        # 428658 <framebuffer+0x18>
  806d66:	89 c0                	mov    eax,eax
  806d68:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    size_t bypp=framebuffer.common.framebuffer_bpp/8;
  806d6c:	0f b6 05 e9 18 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc218e9]        # 42865c <framebuffer+0x1c>
  806d73:	c0 e8 03             	shr    al,0x3
  806d76:	0f b6 c0             	movzx  eax,al
  806d79:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    size_t inter=framebuffer.common.framebuffer_pitch;
  806d7d:	8b 05 cd 18 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc218cd]        # 428650 <framebuffer+0x10>
  806d83:	89 c0                	mov    eax,eax
  806d85:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    size_t pc=w*h;
  806d89:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806d8d:	48 0f af 45 d8       	imul   rax,QWORD PTR [rbp-0x28]
  806d92:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    size_t size=h*inter;
  806d96:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806d9a:	48 0f af 45 c8       	imul   rax,QWORD PTR [rbp-0x38]
  806d9f:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    int pgc=size/PAGE_SIZE;
  806da3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806da7:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  806dae:	48 85 c0             	test   rax,rax
  806db1:	48 0f 48 c2          	cmovs  rax,rdx
  806db5:	48 c1 f8 0c          	sar    rax,0xc
  806db9:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    addr_t p=FRAMEBUFFER_ADDR;
  806dbc:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x40000000
  806dc3:	40 
    addr_t pp=framebuffer.common.framebuffer_addr;
  806dc4:	48 8b 05 7d 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2187d]        # 428648 <framebuffer+0x8>
  806dcb:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for (size_t i = 0; i < pgc; i++)
  806dcf:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  806dd6:	00 
  806dd7:	eb 2d                	jmp    806e06 <init_framebuffer+0xbe>
    {
        mmap(pp,p,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  806dd9:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  806ddd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806de1:	ba 07 00 00 00       	mov    edx,0x7
  806de6:	48 89 ce             	mov    rsi,rcx
  806de9:	48 89 c7             	mov    rdi,rax
  806dec:	e8 47 a0 ff ff       	call   800e38 <mmap>
        pp+=PAGE_SIZE;
  806df1:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  806df8:	00 
        p+=PAGE_SIZE;
  806df9:	48 81 45 f8 00 10 00 	add    QWORD PTR [rbp-0x8],0x1000
  806e00:	00 
    for (size_t i = 0; i < pgc; i++)
  806e01:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  806e06:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  806e09:	48 98                	cdqe   
  806e0b:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  806e0f:	7c c8                	jl     806dd9 <init_framebuffer+0x91>
    }
    
    
}
  806e11:	90                   	nop
  806e12:	90                   	nop
  806e13:	c9                   	leave  
  806e14:	c3                   	ret    

0000000000806e15 <init_font>:
void init_font(){
  806e15:	f3 0f 1e fa          	endbr64 
  806e19:	55                   	push   rbp
  806e1a:	48 89 e5             	mov    rbp,rsp
    boot_font = (struct psf2_header*) _binary_res_font_psf_start;
  806e1d:	48 c7 05 58 18 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21858],0x80ccc8        # 428680 <boot_font>
  806e24:	c8 cc 80 00 

    font_width_bytes = (boot_font->width + 7) / 8;
  806e28:	48 8b 05 51 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21851]        # 428680 <boot_font>
  806e2f:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  806e32:	83 c0 07             	add    eax,0x7
  806e35:	c1 e8 03             	shr    eax,0x3
  806e38:	89 05 52 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21852],eax        # 428690 <font_width_bytes>
    font_width = font_width_bytes * 8;
  806e3e:	8b 05 4c 18 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2184c]        # 428690 <font_width_bytes>
  806e44:	c1 e0 03             	shl    eax,0x3
  806e47:	89 05 3b 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2183b],eax        # 428688 <font_width>
    font_height = boot_font->height;
  806e4d:	48 8b 05 2c 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2182c]        # 428680 <boot_font>
  806e54:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  806e57:	89 05 2f 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2182f],eax        # 42868c <font_height>

    glyph_table = (u8*)_binary_res_font_psf_start+boot_font->header_size;
  806e5d:	48 8b 05 1c 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2181c]        # 428680 <boot_font>
  806e64:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  806e67:	89 c0                	mov    eax,eax
  806e69:	48 05 c8 cc 80 00    	add    rax,0x80ccc8
  806e6f:	48 89 05 22 18 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21822],rax        # 428698 <glyph_table>
    glyph_nr = boot_font->glyph_nr;
  806e76:	48 8b 05 03 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21803]        # 428680 <boot_font>
  806e7d:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  806e80:	89 05 1e 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2181e],eax        # 4286a4 <glyph_nr>
    bytes_per_glyph = boot_font->bytes_per_glyph;
  806e86:	48 8b 05 f3 17 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc217f3]        # 428680 <boot_font>
  806e8d:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  806e90:	89 05 0a 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2180a],eax        # 4286a0 <bytes_per_glyph>

    fb_cursor_x = fb_cursor_y = 0;
  806e96:	c7 05 d0 17 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc217d0],0x0        # 428670 <fb_cursor_y>
  806e9d:	00 00 00 
  806ea0:	8b 05 ca 17 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc217ca]        # 428670 <fb_cursor_y>
  806ea6:	89 05 c0 17 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc217c0],eax        # 42866c <fb_cursor_x>
    max_ch_nr_x = framebuffer.common.framebuffer_width / font_width;
  806eac:	8b 05 a2 17 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc217a2]        # 428654 <framebuffer+0x14>
  806eb2:	8b 0d d0 17 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc217d0]        # 428688 <font_width>
  806eb8:	ba 00 00 00 00       	mov    edx,0x0
  806ebd:	f7 f1                	div    ecx
  806ebf:	89 05 af 17 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc217af],eax        # 428674 <max_ch_nr_x>
    max_ch_nr_y = framebuffer.common.framebuffer_height / font_height;
  806ec5:	8b 05 8d 17 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2178d]        # 428658 <framebuffer+0x18>
  806ecb:	8b 35 bb 17 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc217bb]        # 42868c <font_height>
  806ed1:	ba 00 00 00 00       	mov    edx,0x0
  806ed6:	f7 f6                	div    esi
  806ed8:	89 05 9a 17 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2179a],eax        # 428678 <max_ch_nr_y>
    font_size=1;
  806ede:	c7 05 b8 5a 00 00 01 	mov    DWORD PTR [rip+0x5ab8],0x1        # 80c9a0 <font_size>
  806ee5:	00 00 00 
}
  806ee8:	90                   	nop
  806ee9:	5d                   	pop    rbp
  806eea:	c3                   	ret    

0000000000806eeb <set_framebuffer>:
void set_framebuffer(struct multiboot_tag_framebuffer tag)
{
  806eeb:	f3 0f 1e fa          	endbr64 
  806eef:	55                   	push   rbp
  806ef0:	48 89 e5             	mov    rbp,rsp
    framebuffer=tag;
  806ef3:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  806ef7:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  806efb:	48 89 05 3e 17 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2173e],rax        # 428640 <framebuffer>
  806f02:	48 89 15 3f 17 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2173f],rdx        # 428648 <framebuffer+0x8>
  806f09:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
  806f0d:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  806f11:	48 89 05 38 17 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21738],rax        # 428650 <framebuffer+0x10>
  806f18:	48 89 15 39 17 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21739],rdx        # 428658 <framebuffer+0x18>
  806f1f:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
  806f23:	48 89 05 36 17 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21736],rax        # 428660 <framebuffer+0x20>
}
  806f2a:	90                   	nop
  806f2b:	5d                   	pop    rbp
  806f2c:	c3                   	ret    

0000000000806f2d <fill_rect>:

void fill_rect(int x,int y,int w,int h,unsigned int color){
  806f2d:	f3 0f 1e fa          	endbr64 
  806f31:	55                   	push   rbp
  806f32:	48 89 e5             	mov    rbp,rsp
  806f35:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  806f38:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  806f3b:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  806f3e:	89 4d d0             	mov    DWORD PTR [rbp-0x30],ecx
  806f41:	44 89 45 cc          	mov    DWORD PTR [rbp-0x34],r8d
    unsigned int* fb= (unsigned int*) FRAMEBUFFER_ADDR;
  806f45:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x40000000
  806f4c:	40 
    //目前只写32bpp
    for(int py=x;py<h+x;py++){
  806f4d:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806f50:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  806f53:	eb 64                	jmp    806fb9 <fill_rect+0x8c>
        for(int px=y;px<w+y;px++){
  806f55:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  806f58:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  806f5b:	eb 4b                	jmp    806fa8 <fill_rect+0x7b>
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  806f5d:	8b 15 ed 16 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc216ed]        # 428650 <framebuffer+0x10>
  806f63:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806f66:	0f af c2             	imul   eax,edx
  806f69:	89 c1                	mov    ecx,eax
                       +px*framebuffer.common.framebuffer_bpp/8;
  806f6b:	0f b6 05 ea 16 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc216ea]        # 42865c <framebuffer+0x1c>
  806f72:	0f b6 c0             	movzx  eax,al
  806f75:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  806f79:	8d 50 07             	lea    edx,[rax+0x7]
  806f7c:	85 c0                	test   eax,eax
  806f7e:	0f 48 c2             	cmovs  eax,edx
  806f81:	c1 f8 03             	sar    eax,0x3
  806f84:	48 98                	cdqe   
  806f86:	48 01 c8             	add    rax,rcx
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  806f89:	48 05 00 00 00 40    	add    rax,0x40000000
  806f8f:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
            fb=(unsigned int*)ptr;
  806f93:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806f97:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *fb=color;
  806f9b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806f9f:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  806fa2:	89 10                	mov    DWORD PTR [rax],edx
        for(int px=y;px<w+y;px++){
  806fa4:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806fa8:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  806fab:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  806fae:	01 d0                	add    eax,edx
  806fb0:	39 45 f8             	cmp    DWORD PTR [rbp-0x8],eax
  806fb3:	7c a8                	jl     806f5d <fill_rect+0x30>
    for(int py=x;py<h+x;py++){
  806fb5:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806fb9:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
  806fbc:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806fbf:	01 d0                	add    eax,edx
  806fc1:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  806fc4:	7c 8f                	jl     806f55 <fill_rect+0x28>
        }
    }
}
  806fc6:	90                   	nop
  806fc7:	90                   	nop
  806fc8:	5d                   	pop    rbp
  806fc9:	c3                   	ret    

0000000000806fca <draw_text>:
unsigned char letters[];
void draw_text(int x, int y, int size, char *str)
{
  806fca:	f3 0f 1e fa          	endbr64 
  806fce:	55                   	push   rbp
  806fcf:	48 89 e5             	mov    rbp,rsp
  806fd2:	48 83 ec 30          	sub    rsp,0x30
  806fd6:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806fd9:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806fdc:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  806fdf:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    int tx=x;
  806fe3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806fe6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    while(*str!='\0')
  806fe9:	eb 5a                	jmp    807045 <draw_text+0x7b>
    {
        if(*str=='\n')
  806feb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806fef:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806ff2:	3c 0a                	cmp    al,0xa
  806ff4:	75 1c                	jne    807012 <draw_text+0x48>
        {
            y+=font_height*size;
  806ff6:	8b 15 90 16 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21690]        # 42868c <font_height>
  806ffc:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806fff:	0f af d0             	imul   edx,eax
  807002:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807005:	01 d0                	add    eax,edx
  807007:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            tx=x;
  80700a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80700d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  807010:	eb 2e                	jmp    807040 <draw_text+0x76>
        }
        else
        {
            draw_letter(tx,y,size,*str);
  807012:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807016:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807019:	0f be c8             	movsx  ecx,al
  80701c:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  80701f:	8b 75 e8             	mov    esi,DWORD PTR [rbp-0x18]
  807022:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807025:	89 c7                	mov    edi,eax
  807027:	e8 28 00 00 00       	call   807054 <draw_letter>
            tx+=size*font_width;
  80702c:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  80702f:	8b 05 53 16 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21653]        # 428688 <font_width>
  807035:	0f af d0             	imul   edx,eax
  807038:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80703b:	01 d0                	add    eax,edx
  80703d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        }
        str++;
  807040:	48 83 45 d8 01       	add    QWORD PTR [rbp-0x28],0x1
    while(*str!='\0')
  807045:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807049:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80704c:	84 c0                	test   al,al
  80704e:	75 9b                	jne    806feb <draw_text+0x21>
    }
}
  807050:	90                   	nop
  807051:	90                   	nop
  807052:	c9                   	leave  
  807053:	c3                   	ret    

0000000000807054 <draw_letter>:
void draw_letter(int x, volatile int y, int size, char c) {
  807054:	f3 0f 1e fa          	endbr64 
  807058:	55                   	push   rbp
  807059:	48 89 e5             	mov    rbp,rsp
  80705c:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
  80705f:	89 75 c8             	mov    DWORD PTR [rbp-0x38],esi
  807062:	89 55 c4             	mov    DWORD PTR [rbp-0x3c],edx
  807065:	89 c8                	mov    eax,ecx
  807067:	88 45 c0             	mov    BYTE PTR [rbp-0x40],al
    u8 *glyph = glyph_table;
  80706a:	48 8b 05 27 16 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21627]        # 428698 <glyph_table>
  807071:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if (c < glyph_nr) {
  807075:	0f be 55 c0          	movsx  edx,BYTE PTR [rbp-0x40]
  807079:	8b 05 25 16 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21625]        # 4286a4 <glyph_nr>
  80707f:	39 c2                	cmp    edx,eax
  807081:	73 13                	jae    807096 <draw_letter+0x42>
        glyph += c * bytes_per_glyph;
  807083:	0f be 55 c0          	movsx  edx,BYTE PTR [rbp-0x40]
  807087:	8b 05 13 16 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21613]        # 4286a0 <bytes_per_glyph>
  80708d:	0f af c2             	imul   eax,edx
  807090:	89 c0                	mov    eax,eax
  807092:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    }
    /* output the font to frame buffer */
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  807096:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80709d:	e9 cb 00 00 00       	jmp    80716d <draw_letter+0x119>
        u8 mask = 1 << 7;
  8070a2:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80

        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  8070a6:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8070ad:	e9 9c 00 00 00       	jmp    80714e <draw_letter+0xfa>
            int px=x+ch_x*size;
  8070b2:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8070b5:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  8070b9:	89 c2                	mov    edx,eax
  8070bb:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8070be:	01 d0                	add    eax,edx
  8070c0:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            int py=y+ch_y*size;
  8070c3:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8070c6:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  8070ca:	89 c2                	mov    edx,eax
  8070cc:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  8070cf:	01 d0                	add    eax,edx
  8070d1:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
            int* ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  8070d4:	8b 15 76 15 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21576]        # 428650 <framebuffer+0x10>
  8070da:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8070dd:	0f af c2             	imul   eax,edx
  8070e0:	89 c1                	mov    ecx,eax
                     +px*framebuffer.common.framebuffer_bpp/8;
  8070e2:	0f b6 05 73 15 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21573]        # 42865c <framebuffer+0x1c>
  8070e9:	0f b6 c0             	movzx  eax,al
  8070ec:	0f af 45 e8          	imul   eax,DWORD PTR [rbp-0x18]
  8070f0:	8d 50 07             	lea    edx,[rax+0x7]
  8070f3:	85 c0                	test   eax,eax
  8070f5:	0f 48 c2             	cmovs  eax,edx
  8070f8:	c1 f8 03             	sar    eax,0x3
  8070fb:	48 98                	cdqe   
  8070fd:	48 01 c8             	add    rax,rcx
  807100:	48 05 00 00 00 40    	add    rax,0x40000000
            int* ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  807106:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            if ((*(glyph + ch_x / 8) & mask) != 0) {
  80710a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80710d:	c1 e8 03             	shr    eax,0x3
  807110:	89 c2                	mov    edx,eax
  807112:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807116:	48 01 d0             	add    rax,rdx
  807119:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80711c:	22 45 f3             	and    al,BYTE PTR [rbp-0xd]
  80711f:	84 c0                	test   al,al
  807121:	74 0c                	je     80712f <draw_letter+0xdb>
                *ptr=-1;
  807123:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807127:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
  80712d:	eb 0a                	jmp    807139 <draw_letter+0xe5>
            } else {
                *ptr=0;
  80712f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807133:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            }

            mask >>= 1;
  807139:	d0 6d f3             	shr    BYTE PTR [rbp-0xd],1
            if (ch_x % 8 == 0) {
  80713c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80713f:	83 e0 07             	and    eax,0x7
  807142:	85 c0                	test   eax,eax
  807144:	75 04                	jne    80714a <draw_letter+0xf6>
                mask = 1 << 7;
  807146:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80
        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  80714a:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  80714e:	8b 05 34 15 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21534]        # 428688 <font_width>
  807154:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  807157:	0f 82 55 ff ff ff    	jb     8070b2 <draw_letter+0x5e>
            }
        }

        glyph += font_width_bytes;
  80715d:	8b 05 2d 15 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2152d]        # 428690 <font_width_bytes>
  807163:	89 c0                	mov    eax,eax
  807165:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  807169:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80716d:	8b 05 19 15 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21519]        # 42868c <font_height>
  807173:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  807176:	0f 82 26 ff ff ff    	jb     8070a2 <draw_letter+0x4e>
    }
}
  80717c:	90                   	nop
  80717d:	90                   	nop
  80717e:	5d                   	pop    rbp
  80717f:	c3                   	ret    

0000000000807180 <scr_up>:
//向上滚动一个像素
void scr_up(){
  807180:	f3 0f 1e fa          	endbr64 
  807184:	55                   	push   rbp
  807185:	48 89 e5             	mov    rbp,rsp
    for(int dy=0;dy<framebuffer.common.framebuffer_height-1;dy++){
  807188:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80718f:	eb 71                	jmp    807202 <scr_up+0x82>
        for(int dx=0;dx<framebuffer.common.framebuffer_width;dx++){
  807191:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807198:	eb 57                	jmp    8071f1 <scr_up+0x71>
            char *p=(char*)(FRAMEBUFFER_ADDR+
                    dy*framebuffer.common.framebuffer_pitch
  80719a:	8b 15 b0 14 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc214b0]        # 428650 <framebuffer+0x10>
  8071a0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8071a3:	0f af c2             	imul   eax,edx
  8071a6:	89 c1                	mov    ecx,eax
                    +dx*framebuffer.common.framebuffer_bpp/8);
  8071a8:	0f b6 05 ad 14 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc214ad]        # 42865c <framebuffer+0x1c>
  8071af:	0f b6 c0             	movzx  eax,al
  8071b2:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  8071b6:	8d 50 07             	lea    edx,[rax+0x7]
  8071b9:	85 c0                	test   eax,eax
  8071bb:	0f 48 c2             	cmovs  eax,edx
  8071be:	c1 f8 03             	sar    eax,0x3
  8071c1:	48 98                	cdqe   
  8071c3:	48 01 c8             	add    rax,rcx
  8071c6:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+
  8071cc:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p+framebuffer.common.framebuffer_pitch);
  8071d0:	8b 05 7a 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2147a]        # 428650 <framebuffer+0x10>
  8071d6:	89 c2                	mov    edx,eax
  8071d8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8071dc:	48 01 d0             	add    rax,rdx
  8071df:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  8071e2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8071e6:	88 10                	mov    BYTE PTR [rax],dl
            p++;
  8071e8:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        for(int dx=0;dx<framebuffer.common.framebuffer_width;dx++){
  8071ed:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8071f1:	8b 15 5d 14 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc2145d]        # 428654 <framebuffer+0x14>
  8071f7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8071fa:	39 c2                	cmp    edx,eax
  8071fc:	77 9c                	ja     80719a <scr_up+0x1a>
    for(int dy=0;dy<framebuffer.common.framebuffer_height-1;dy++){
  8071fe:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807202:	8b 05 50 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21450]        # 428658 <framebuffer+0x18>
  807208:	8d 50 ff             	lea    edx,[rax-0x1]
  80720b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80720e:	39 c2                	cmp    edx,eax
  807210:	0f 87 7b ff ff ff    	ja     807191 <scr_up+0x11>
        }

    }
//    for(int i=0;i< framebuffer.common.framebuffer_width*framebuffer.common.framebuffer_bpp/8;i++)
//        *(p++)=0;
}
  807216:	90                   	nop
  807217:	90                   	nop
  807218:	5d                   	pop    rbp
  807219:	c3                   	ret    

000000000080721a <scr_down>:
void scr_down(){
  80721a:	f3 0f 1e fa          	endbr64 
  80721e:	55                   	push   rbp
  80721f:	48 89 e5             	mov    rbp,rsp
    for(int dy=1;dy<max_ch_nr_y;dy++){
  807222:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
  807229:	eb 72                	jmp    80729d <scr_down+0x83>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  80722b:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807232:	eb 58                	jmp    80728c <scr_down+0x72>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  807234:	8b 15 16 14 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21416]        # 428650 <framebuffer+0x10>
  80723a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80723d:	0f af c2             	imul   eax,edx
  807240:	89 c1                	mov    ecx,eax
                            +dx*framebuffer.common.framebuffer_bpp/8);
  807242:	0f b6 05 13 14 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21413]        # 42865c <framebuffer+0x1c>
  807249:	0f b6 c0             	movzx  eax,al
  80724c:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  807250:	8d 50 07             	lea    edx,[rax+0x7]
  807253:	85 c0                	test   eax,eax
  807255:	0f 48 c2             	cmovs  eax,edx
  807258:	c1 f8 03             	sar    eax,0x3
  80725b:	48 98                	cdqe   
  80725d:	48 01 c8             	add    rax,rcx
  807260:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  807266:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p-framebuffer.common.framebuffer_pitch);
  80726a:	8b 05 e0 13 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc213e0]        # 428650 <framebuffer+0x10>
  807270:	89 c0                	mov    eax,eax
  807272:	48 f7 d8             	neg    rax
  807275:	48 89 c2             	mov    rdx,rax
  807278:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80727c:	48 01 d0             	add    rax,rdx
  80727f:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  807282:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807286:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  807288:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80728c:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  80728f:	8b 05 df 13 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc213df]        # 428674 <max_ch_nr_x>
  807295:	39 c2                	cmp    edx,eax
  807297:	72 9b                	jb     807234 <scr_down+0x1a>
    for(int dy=1;dy<max_ch_nr_y;dy++){
  807299:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80729d:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8072a0:	8b 05 d2 13 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc213d2]        # 428678 <max_ch_nr_y>
  8072a6:	39 c2                	cmp    edx,eax
  8072a8:	72 81                	jb     80722b <scr_down+0x11>
        }

    }
}
  8072aa:	90                   	nop
  8072ab:	90                   	nop
  8072ac:	5d                   	pop    rbp
  8072ad:	c3                   	ret    

00000000008072ae <print>:
void print(char* s){
  8072ae:	f3 0f 1e fa          	endbr64 
  8072b2:	55                   	push   rbp
  8072b3:	48 89 e5             	mov    rbp,rsp
  8072b6:	48 83 ec 08          	sub    rsp,0x8
  8072ba:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    for(;*s;s++){
  8072be:	e9 c4 00 00 00       	jmp    807387 <print+0xd9>
        if(fb_cursor_x>max_ch_nr_x||*s=='\n')
  8072c3:	8b 15 a3 13 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc213a3]        # 42866c <fb_cursor_x>
  8072c9:	8b 05 a5 13 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc213a5]        # 428674 <max_ch_nr_x>
  8072cf:	39 c2                	cmp    edx,eax
  8072d1:	77 0b                	ja     8072de <print+0x30>
  8072d3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8072d7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8072da:	3c 0a                	cmp    al,0xa
  8072dc:	75 19                	jne    8072f7 <print+0x49>
        {
            fb_cursor_y+=1;
  8072de:	8b 05 8c 13 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2138c]        # 428670 <fb_cursor_y>
  8072e4:	83 c0 01             	add    eax,0x1
  8072e7:	89 05 83 13 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21383],eax        # 428670 <fb_cursor_y>
            fb_cursor_x=0;
  8072ed:	c7 05 75 13 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc21375],0x0        # 42866c <fb_cursor_x>
  8072f4:	00 00 00 
        }
        if(*s=='\n')continue;
  8072f7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8072fb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8072fe:	3c 0a                	cmp    al,0xa
  807300:	74 7f                	je     807381 <print+0xd3>
        if(fb_cursor_y>=max_ch_nr_y-1){
  807302:	8b 05 70 13 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21370]        # 428678 <max_ch_nr_y>
  807308:	8d 50 ff             	lea    edx,[rax-0x1]
  80730b:	8b 05 5f 13 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2135f]        # 428670 <fb_cursor_y>
  807311:	39 c2                	cmp    edx,eax
  807313:	77 0a                	ja     80731f <print+0x71>
//            for(int i=0;i<font_height*font_size;i++)
////                scr_up();
////            fb_cursor_y=max_ch_nr_y-1;
            fb_cursor_y=0;
  807315:	c7 05 51 13 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc21351],0x0        # 428670 <fb_cursor_y>
  80731c:	00 00 00 
        }
        draw_letter(fb_cursor_x*font_width*font_size,fb_cursor_y*font_height*font_size,font_size,*s);
  80731f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807323:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807326:	0f be d0             	movsx  edx,al
  807329:	8b 05 71 56 00 00    	mov    eax,DWORD PTR [rip+0x5671]        # 80c9a0 <font_size>
  80732f:	8b 35 3b 13 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc2133b]        # 428670 <fb_cursor_y>
  807335:	8b 0d 51 13 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc21351]        # 42868c <font_height>
  80733b:	0f af ce             	imul   ecx,esi
  80733e:	8b 35 5c 56 00 00    	mov    esi,DWORD PTR [rip+0x565c]        # 80c9a0 <font_size>
  807344:	0f af ce             	imul   ecx,esi
  807347:	41 89 c8             	mov    r8d,ecx
  80734a:	8b 35 1c 13 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc2131c]        # 42866c <fb_cursor_x>
  807350:	8b 0d 32 13 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc21332]        # 428688 <font_width>
  807356:	0f af ce             	imul   ecx,esi
  807359:	8b 35 41 56 00 00    	mov    esi,DWORD PTR [rip+0x5641]        # 80c9a0 <font_size>
  80735f:	0f af ce             	imul   ecx,esi
  807362:	89 cf                	mov    edi,ecx
  807364:	89 d1                	mov    ecx,edx
  807366:	89 c2                	mov    edx,eax
  807368:	44 89 c6             	mov    esi,r8d
  80736b:	e8 e4 fc ff ff       	call   807054 <draw_letter>
        fb_cursor_x+=1;
  807370:	8b 05 f6 12 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc212f6]        # 42866c <fb_cursor_x>
  807376:	83 c0 01             	add    eax,0x1
  807379:	89 05 ed 12 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc212ed],eax        # 42866c <fb_cursor_x>
  80737f:	eb 01                	jmp    807382 <print+0xd4>
        if(*s=='\n')continue;
  807381:	90                   	nop
    for(;*s;s++){
  807382:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  807387:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80738b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80738e:	84 c0                	test   al,al
  807390:	0f 85 2d ff ff ff    	jne    8072c3 <print+0x15>
    }
}
  807396:	90                   	nop
  807397:	90                   	nop
  807398:	c9                   	leave  
  807399:	c3                   	ret    

000000000080739a <open_framebuffer>:
struct file_operations framebuffer_fops={
        .open=open_framebuffer,.close=close_framebuffer,.read=read_framebuffer,.write=write_framebuffer,
        .ioctl=ioctl_framebuffer
};
long open_framebuffer(struct index_node * inode,struct file * filp){
  80739a:	f3 0f 1e fa          	endbr64 
  80739e:	55                   	push   rbp
  80739f:	48 89 e5             	mov    rbp,rsp
  8073a2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8073a6:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    inode->f_ops=&framebuffer_fops;
  8073aa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8073ae:	48 c7 40 20 c0 c9 80 	mov    QWORD PTR [rax+0x20],0x80c9c0
  8073b5:	00 
    filp->f_ops=&framebuffer_fops;
  8073b6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8073ba:	48 c7 40 18 c0 c9 80 	mov    QWORD PTR [rax+0x18],0x80c9c0
  8073c1:	00 
}
  8073c2:	90                   	nop
  8073c3:	5d                   	pop    rbp
  8073c4:	c3                   	ret    

00000000008073c5 <close_framebuffer>:
long close_framebuffer(struct index_node * inode,struct file * filp){
  8073c5:	f3 0f 1e fa          	endbr64 
  8073c9:	55                   	push   rbp
  8073ca:	48 89 e5             	mov    rbp,rsp
  8073cd:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8073d1:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi

}
  8073d5:	90                   	nop
  8073d6:	5d                   	pop    rbp
  8073d7:	c3                   	ret    

00000000008073d8 <read_framebuffer>:
long read_framebuffer(struct file * filp,char * buf,unsigned long count,long * position){
  8073d8:	f3 0f 1e fa          	endbr64 
  8073dc:	55                   	push   rbp
  8073dd:	48 89 e5             	mov    rbp,rsp
  8073e0:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8073e4:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8073e8:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  8073ec:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx

}
  8073f0:	90                   	nop
  8073f1:	5d                   	pop    rbp
  8073f2:	c3                   	ret    

00000000008073f3 <write_framebuffer>:
long write_framebuffer(struct file * filp,char * buf,unsigned long count,long * position){
  8073f3:	f3 0f 1e fa          	endbr64 
  8073f7:	55                   	push   rbp
  8073f8:	48 89 e5             	mov    rbp,rsp
  8073fb:	48 83 ec 40          	sub    rsp,0x40
  8073ff:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  807403:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  807407:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  80740b:	48 89 4d c0          	mov    QWORD PTR [rbp-0x40],rcx
    char *tmp= (char*)vmalloc();
  80740f:	b8 00 00 00 00       	mov    eax,0x0
  807414:	e8 e4 9d ff ff       	call   8011fd <vmalloc>
  807419:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int c=count/(PAGE_4K_SIZE-1),p=0;
  80741d:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  807421:	48 ba 11 00 01 10 00 	movabs rdx,0x10010010010011
  807428:	01 10 00 
  80742b:	48 89 c8             	mov    rax,rcx
  80742e:	48 f7 e2             	mul    rdx
  807431:	48 89 c8             	mov    rax,rcx
  807434:	48 29 d0             	sub    rax,rdx
  807437:	48 d1 e8             	shr    rax,1
  80743a:	48 01 d0             	add    rax,rdx
  80743d:	48 c1 e8 0b          	shr    rax,0xb
  807441:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  807444:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    //一块一块输出
    for(int i=0;i<count?count:1;i++){
  80744b:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807452:	eb 46                	jmp    80749a <write_framebuffer+0xa7>
        memcpy(tmp,buf+p,PAGE_4K_SIZE-1);
  807454:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807457:	48 63 d0             	movsxd rdx,eax
  80745a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80745e:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  807462:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807466:	ba ff 0f 00 00       	mov    edx,0xfff
  80746b:	48 89 ce             	mov    rsi,rcx
  80746e:	48 89 c7             	mov    rdi,rax
  807471:	e8 7f 4a 00 00       	call   80bef5 <memcpy>
        tmp[PAGE_4K_SIZE-1]=0;
  807476:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80747a:	48 05 ff 0f 00 00    	add    rax,0xfff
  807480:	c6 00 00             	mov    BYTE PTR [rax],0x0
        print(tmp);
  807483:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807487:	48 89 c7             	mov    rdi,rax
  80748a:	e8 1f fe ff ff       	call   8072ae <print>
        p+=PAGE_4K_SIZE-1;
  80748f:	81 45 fc ff 0f 00 00 	add    DWORD PTR [rbp-0x4],0xfff
    for(int i=0;i<count?count:1;i++){
  807496:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80749a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80749d:	48 98                	cdqe   
  80749f:	48 39 45 c8          	cmp    QWORD PTR [rbp-0x38],rax
  8074a3:	76 af                	jbe    807454 <write_framebuffer+0x61>
  8074a5:	48 83 7d c8 00       	cmp    QWORD PTR [rbp-0x38],0x0
  8074aa:	75 a8                	jne    807454 <write_framebuffer+0x61>
    }
    vmfree(tmp);
  8074ac:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8074b0:	48 89 c7             	mov    rdi,rax
  8074b3:	e8 d4 9d ff ff       	call   80128c <vmfree>
    return 0;
  8074b8:	b8 00 00 00 00       	mov    eax,0x0
}
  8074bd:	c9                   	leave  
  8074be:	c3                   	ret    

00000000008074bf <ioctl_framebuffer>:
long ioctl_framebuffer(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg){
  8074bf:	f3 0f 1e fa          	endbr64 
  8074c3:	55                   	push   rbp
  8074c4:	48 89 e5             	mov    rbp,rsp
  8074c7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8074cb:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8074cf:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  8074d3:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx

}
  8074d7:	90                   	nop
  8074d8:	5d                   	pop    rbp
  8074d9:	c3                   	ret    

00000000008074da <path_walk>:
#include "memory.h"
#include "log.h"
#include "mem.h"

struct dir_entry * path_walk(char * name,unsigned long flags)
{
  8074da:	f3 0f 1e fa          	endbr64 
  8074de:	55                   	push   rbp
  8074df:	48 89 e5             	mov    rbp,rsp
  8074e2:	48 83 ec 50          	sub    rsp,0x50
  8074e6:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  8074ea:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
    char * tmpname = NULL;
  8074ee:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8074f5:	00 
    int tmpnamelen = 0;
  8074f6:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    struct dir_entry * parent = root_sb->root;
  8074fd:	48 8b 05 a4 11 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc211a4]        # 4286a8 <root_sb>
  807504:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807507:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    struct dir_entry * path = NULL;
  80750b:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  807512:	00 

    while(*name == '/')
  807513:	eb 05                	jmp    80751a <path_walk+0x40>
        name++;
  807515:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
    while(*name == '/')
  80751a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80751e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807521:	3c 2f                	cmp    al,0x2f
  807523:	74 f0                	je     807515 <path_walk+0x3b>

    if(!*name)
  807525:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807529:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80752c:	84 c0                	test   al,al
  80752e:	75 09                	jne    807539 <path_walk+0x5f>
    {
        return parent;
  807530:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807534:	e9 17 02 00 00       	jmp    807750 <path_walk+0x276>
    }

    for(;;)
    {
        tmpname = name;
  807539:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80753d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        while(*name && (*name != '/'))
  807541:	eb 05                	jmp    807548 <path_walk+0x6e>
            name++;
  807543:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
        while(*name && (*name != '/'))
  807548:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80754c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80754f:	84 c0                	test   al,al
  807551:	74 0b                	je     80755e <path_walk+0x84>
  807553:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807557:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80755a:	3c 2f                	cmp    al,0x2f
  80755c:	75 e5                	jne    807543 <path_walk+0x69>
        tmpnamelen = name - tmpname;
  80755e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807562:	48 2b 45 f0          	sub    rax,QWORD PTR [rbp-0x10]
  807566:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

        path = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  807569:	be 00 00 00 00       	mov    esi,0x0
  80756e:	bf 48 00 00 00       	mov    edi,0x48
  807573:	b8 00 00 00 00       	mov    eax,0x0
  807578:	e8 80 9c ff ff       	call   8011fd <vmalloc>
  80757d:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        memset(path,0,sizeof(struct dir_entry));
  807581:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807585:	ba 48 00 00 00       	mov    edx,0x48
  80758a:	be 00 00 00 00       	mov    esi,0x0
  80758f:	48 89 c7             	mov    rdi,rax
  807592:	e8 0d 4a 00 00       	call   80bfa4 <memset>

        path->name = vmalloc(tmpnamelen+1,0);
  807597:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80759a:	83 c0 01             	add    eax,0x1
  80759d:	be 00 00 00 00       	mov    esi,0x0
  8075a2:	89 c7                	mov    edi,eax
  8075a4:	b8 00 00 00 00       	mov    eax,0x0
  8075a9:	e8 4f 9c ff ff       	call   8011fd <vmalloc>
  8075ae:	48 89 c2             	mov    rdx,rax
  8075b1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8075b5:	48 89 10             	mov    QWORD PTR [rax],rdx
        memset(path->name,0,tmpnamelen+1);
  8075b8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8075bb:	83 c0 01             	add    eax,0x1
  8075be:	89 c2                	mov    edx,eax
  8075c0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8075c4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8075c7:	be 00 00 00 00       	mov    esi,0x0
  8075cc:	48 89 c7             	mov    rdi,rax
  8075cf:	e8 d0 49 00 00       	call   80bfa4 <memset>
        memcpy(tmpname,path->name,tmpnamelen);
  8075d4:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8075d7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8075db:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8075de:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8075e2:	48 89 ce             	mov    rsi,rcx
  8075e5:	48 89 c7             	mov    rdi,rax
  8075e8:	e8 08 49 00 00       	call   80bef5 <memcpy>
        path->name_length = tmpnamelen;
  8075ed:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8075f1:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8075f4:	89 50 08             	mov    DWORD PTR [rax+0x8],edx

        if(parent->dir_inode->inode_ops->lookup(parent->dir_inode,path) == NULL)
  8075f7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8075fb:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8075ff:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  807603:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  807607:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80760b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80760f:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  807613:	48 89 d6             	mov    rsi,rdx
  807616:	48 89 c7             	mov    rdi,rax
  807619:	ff d1                	call   rcx
  80761b:	48 85 c0             	test   rax,rax
  80761e:	75 3e                	jne    80765e <path_walk+0x184>
        {
            printf("can not find file or dir:%s\n",path->name);
  807620:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807624:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807627:	48 89 c6             	mov    rsi,rax
  80762a:	bf 6f 46 81 00       	mov    edi,0x81466f
  80762f:	b8 00 00 00 00       	mov    eax,0x0
  807634:	e8 ee 96 ff ff       	call   800d27 <printf>
            vmfree(path->name);
  807639:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80763d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807640:	48 89 c7             	mov    rdi,rax
  807643:	e8 44 9c ff ff       	call   80128c <vmfree>
            vmfree(path);
  807648:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80764c:	48 89 c7             	mov    rdi,rax
  80764f:	e8 38 9c ff ff       	call   80128c <vmfree>
            return NULL;
  807654:	b8 00 00 00 00       	mov    eax,0x0
  807659:	e9 f2 00 00 00       	jmp    807750 <path_walk+0x276>
        }

        list_init(&path->child_node);
  80765e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807662:	48 83 c0 10          	add    rax,0x10
  807666:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    struct List * next;
};

__attribute__((always_inline)) inline void list_init(struct List * list)
{
    list->prev = list;
  80766a:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80766e:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  807672:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  807675:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807679:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  80767d:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  807681:	90                   	nop
        list_init(&path->subdirs_list);
  807682:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807686:	48 83 c0 20          	add    rax,0x20
  80768a:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    list->prev = list;
  80768e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807692:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  807696:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  807699:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80769d:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  8076a1:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  8076a5:	90                   	nop
        path->parent = parent;
  8076a6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8076aa:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8076ae:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
        list_add_to_behind(&parent->subdirs_list,&path->child_node);
  8076b2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8076b6:	48 83 c0 10          	add    rax,0x10
  8076ba:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8076be:	48 83 c2 20          	add    rdx,0x20
  8076c2:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  8076c6:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

__attribute__((always_inline)) inline void list_add_to_behind(struct List * entry,struct List * new)	////add to entry behind
{
    new->next = entry->next;
  8076ca:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8076ce:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  8076d2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8076d6:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    new->prev = entry;
  8076da:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8076de:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8076e2:	48 89 10             	mov    QWORD PTR [rax],rdx
    new->next->prev = new;
  8076e5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8076e9:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8076ed:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8076f1:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  8076f4:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8076f8:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8076fc:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  807700:	90                   	nop

        if(!*name)
  807701:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807705:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807708:	84 c0                	test   al,al
  80770a:	74 2a                	je     807736 <path_walk+0x25c>
            goto last_component;
        while(*name == '/')
  80770c:	eb 05                	jmp    807713 <path_walk+0x239>
            name++;
  80770e:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
        while(*name == '/')
  807713:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807717:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80771a:	3c 2f                	cmp    al,0x2f
  80771c:	74 f0                	je     80770e <path_walk+0x234>
        if(!*name)
  80771e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807722:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807725:	84 c0                	test   al,al
  807727:	74 10                	je     807739 <path_walk+0x25f>
            goto last_slash;

        parent = path;
  807729:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80772d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        tmpname = name;
  807731:	e9 03 fe ff ff       	jmp    807539 <path_walk+0x5f>
            goto last_component;
  807736:	90                   	nop
  807737:	eb 01                	jmp    80773a <path_walk+0x260>
            goto last_slash;
  807739:	90                   	nop
    }

    last_slash:
    last_component:

    if(flags & 1)
  80773a:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80773e:	83 e0 01             	and    eax,0x1
  807741:	48 85 c0             	test   rax,rax
  807744:	74 06                	je     80774c <path_walk+0x272>
    {
        return parent;
  807746:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80774a:	eb 04                	jmp    807750 <path_walk+0x276>
    }

    return path;
  80774c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  807750:	c9                   	leave  
  807751:	c3                   	ret    

0000000000807752 <fill_dentry>:


int fill_dentry(void *buf,char *name, long namelen,long type,long offset)
{
  807752:	f3 0f 1e fa          	endbr64 
  807756:	55                   	push   rbp
  807757:	48 89 e5             	mov    rbp,rsp
  80775a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80775e:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  807762:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  807766:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  80776a:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
//
//    memcpy(name,dent->d_name,namelen);
//    dent->d_namelen = namelen;
//    dent->d_type = type;
//    dent->d_offset = offset;
    return sizeof(struct dirent) + namelen;
  80776e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807772:	83 c0 18             	add    eax,0x18
}
  807775:	5d                   	pop    rbp
  807776:	c3                   	ret    

0000000000807777 <mount_fs>:
//function mount_root
struct super_block * root_sb = NULL;
struct file_system_type filesystem = {"filesystem",0};

struct super_block* mount_fs(char * name,struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  807777:	f3 0f 1e fa          	endbr64 
  80777b:	55                   	push   rbp
  80777c:	48 89 e5             	mov    rbp,rsp
  80777f:	48 83 ec 30          	sub    rsp,0x30
  807783:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  807787:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80778b:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file_system_type * p = NULL;
  80778f:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807796:	00 

    for(p = &filesystem;p;p = p->next)
  807797:	48 c7 45 f8 00 ca 80 	mov    QWORD PTR [rbp-0x8],0x80ca00
  80779e:	00 
  80779f:	eb 40                	jmp    8077e1 <mount_fs+0x6a>
        if(!strcmp(p->name,name))
  8077a1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8077a5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8077a8:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8077ac:	48 89 d6             	mov    rsi,rdx
  8077af:	48 89 c7             	mov    rdi,rax
  8077b2:	e8 dc 49 00 00       	call   80c193 <strcmp>
  8077b7:	85 c0                	test   eax,eax
  8077b9:	75 1a                	jne    8077d5 <mount_fs+0x5e>
        {
            return p->read_superblock(DPTE,buf);
  8077bb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8077bf:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  8077c3:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8077c7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8077cb:	48 89 d6             	mov    rsi,rdx
  8077ce:	48 89 c7             	mov    rdi,rax
  8077d1:	ff d1                	call   rcx
  8077d3:	eb 18                	jmp    8077ed <mount_fs+0x76>
    for(p = &filesystem;p;p = p->next)
  8077d5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8077d9:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8077dd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  8077e1:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8077e6:	75 b9                	jne    8077a1 <mount_fs+0x2a>
        }
    return 0;
  8077e8:	b8 00 00 00 00       	mov    eax,0x0
}
  8077ed:	c9                   	leave  
  8077ee:	c3                   	ret    

00000000008077ef <register_filesystem>:

unsigned long register_filesystem(struct file_system_type * fs)
{
  8077ef:	f3 0f 1e fa          	endbr64 
  8077f3:	55                   	push   rbp
  8077f4:	48 89 e5             	mov    rbp,rsp
  8077f7:	48 83 ec 20          	sub    rsp,0x20
  8077fb:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = NULL;
  8077ff:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807806:	00 

    for(p = &filesystem;p;p = p->next)
  807807:	48 c7 45 f8 00 ca 80 	mov    QWORD PTR [rbp-0x8],0x80ca00
  80780e:	00 
  80780f:	eb 30                	jmp    807841 <register_filesystem+0x52>
        if(!strcmp(fs->name,p->name))
  807811:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807815:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  807818:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80781c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80781f:	48 89 d6             	mov    rsi,rdx
  807822:	48 89 c7             	mov    rdi,rax
  807825:	e8 69 49 00 00       	call   80c193 <strcmp>
  80782a:	85 c0                	test   eax,eax
  80782c:	75 07                	jne    807835 <register_filesystem+0x46>
            return 0;
  80782e:	b8 00 00 00 00       	mov    eax,0x0
  807833:	eb 32                	jmp    807867 <register_filesystem+0x78>
    for(p = &filesystem;p;p = p->next)
  807835:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807839:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80783d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  807841:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  807846:	75 c9                	jne    807811 <register_filesystem+0x22>

    fs->next = filesystem.next;
  807848:	48 8b 15 c9 51 00 00 	mov    rdx,QWORD PTR [rip+0x51c9]        # 80ca18 <filesystem+0x18>
  80784f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807853:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    filesystem.next = fs;
  807857:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80785b:	48 89 05 b6 51 00 00 	mov    QWORD PTR [rip+0x51b6],rax        # 80ca18 <filesystem+0x18>

    return 1;
  807862:	b8 01 00 00 00       	mov    eax,0x1
}
  807867:	c9                   	leave  
  807868:	c3                   	ret    

0000000000807869 <unregister_filesystem>:

unsigned long unregister_filesystem(struct file_system_type * fs)
{
  807869:	f3 0f 1e fa          	endbr64 
  80786d:	55                   	push   rbp
  80786e:	48 89 e5             	mov    rbp,rsp
  807871:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = &filesystem;
  807875:	48 c7 45 f8 00 ca 80 	mov    QWORD PTR [rbp-0x8],0x80ca00
  80787c:	00 

    while(p->next)
  80787d:	eb 41                	jmp    8078c0 <unregister_filesystem+0x57>
        if(p->next == fs)
  80787f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807883:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807887:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  80788b:	75 27                	jne    8078b4 <unregister_filesystem+0x4b>
        {
            p->next = p->next->next;
  80788d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807891:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807895:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  807899:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80789d:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
            fs->next = NULL;
  8078a1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8078a5:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  8078ac:	00 
            return 1;
  8078ad:	b8 01 00 00 00       	mov    eax,0x1
  8078b2:	eb 1e                	jmp    8078d2 <unregister_filesystem+0x69>
        }
        else
            p = p->next;
  8078b4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8078b8:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8078bc:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p->next)
  8078c0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8078c4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8078c8:	48 85 c0             	test   rax,rax
  8078cb:	75 b2                	jne    80787f <unregister_filesystem+0x16>
    return 0;
  8078cd:	b8 00 00 00 00       	mov    eax,0x0
}
  8078d2:	5d                   	pop    rbp
  8078d3:	c3                   	ret    

00000000008078d4 <sys_putstring>:
#include "syscall.h"
#include "int.h"


unsigned long sys_putstring(char *string)
{
  8078d4:	f3 0f 1e fa          	endbr64 
  8078d8:	55                   	push   rbp
  8078d9:	48 89 e5             	mov    rbp,rsp
  8078dc:	48 83 ec 10          	sub    rsp,0x10
  8078e0:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    printf(string);
  8078e4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8078e8:	48 89 c7             	mov    rdi,rax
  8078eb:	b8 00 00 00 00       	mov    eax,0x0
  8078f0:	e8 32 94 ff ff       	call   800d27 <printf>
    return 0;
  8078f5:	b8 00 00 00 00       	mov    eax,0x0
}
  8078fa:	c9                   	leave  
  8078fb:	c3                   	ret    

00000000008078fc <sys_open>:

unsigned long sys_open(char *filename,int flags)
{
  8078fc:	f3 0f 1e fa          	endbr64 
  807900:	55                   	push   rbp
  807901:	48 89 e5             	mov    rbp,rsp
  807904:	48 83 ec 70          	sub    rsp,0x70
  807908:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  80790c:	89 75 94             	mov    DWORD PTR [rbp-0x6c],esi
    char * path = NULL;
  80790f:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  807916:	00 
    long pathlen = 0;
  807917:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  80791e:	00 
    long error = 0;
  80791f:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807926:	00 
    struct dir_entry * dentry = NULL;
  807927:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80792e:	00 
    struct file * filp = NULL;
  80792f:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  807936:	00 
    struct file ** f = NULL;
  807937:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  80793e:	00 
    int fd = -1;
  80793f:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
    int i;

//	printf("sys_open\n");
    path = (char *)vmalloc();
  807946:	b8 00 00 00 00       	mov    eax,0x0
  80794b:	e8 ad 98 ff ff       	call   8011fd <vmalloc>
  807950:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    if(path == NULL)
  807954:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  807959:	75 0c                	jne    807967 <sys_open+0x6b>
        return -ENOMEM;
  80795b:	48 c7 c0 cf ff ff ff 	mov    rax,0xffffffffffffffcf
  807962:	e9 d1 03 00 00       	jmp    807d38 <sys_open+0x43c>
    memset(path,0,PAGE_4K_SIZE);
  807967:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80796b:	ba 00 10 00 00       	mov    edx,0x1000
  807970:	be 00 00 00 00       	mov    esi,0x0
  807975:	48 89 c7             	mov    rdi,rax
  807978:	e8 27 46 00 00       	call   80bfa4 <memset>
    pathlen = strlen(filename);
  80797d:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807981:	48 89 c7             	mov    rdi,rax
  807984:	e8 89 48 00 00       	call   80c212 <strlen>
  807989:	48 98                	cdqe   
  80798b:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    if(pathlen <= 0)
  80798f:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
  807994:	7f 18                	jg     8079ae <sys_open+0xb2>
    {
        vmfree(path);
  807996:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80799a:	48 89 c7             	mov    rdi,rax
  80799d:	e8 ea 98 ff ff       	call   80128c <vmfree>
        return -EFAULT;
  8079a2:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  8079a9:	e9 8a 03 00 00       	jmp    807d38 <sys_open+0x43c>
    }
    else if(pathlen >= PAGE_4K_SIZE)
  8079ae:	48 81 7d d0 ff 0f 00 	cmp    QWORD PTR [rbp-0x30],0xfff
  8079b5:	00 
  8079b6:	7e 18                	jle    8079d0 <sys_open+0xd4>
    {
        vmfree(path);
  8079b8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8079bc:	48 89 c7             	mov    rdi,rax
  8079bf:	e8 c8 98 ff ff       	call   80128c <vmfree>
        return -ENAMETOOLONG;
  8079c4:	48 c7 c0 db ff ff ff 	mov    rax,0xffffffffffffffdb
  8079cb:	e9 68 03 00 00       	jmp    807d38 <sys_open+0x43c>
    }
    strcpy(path,filename);
  8079d0:	48 8b 55 98          	mov    rdx,QWORD PTR [rbp-0x68]
  8079d4:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8079d8:	48 89 d6             	mov    rsi,rdx
  8079db:	48 89 c7             	mov    rdi,rax
  8079de:	e8 10 46 00 00       	call   80bff3 <strcpy>

    dentry = path_walk(path,0);
  8079e3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8079e7:	be 00 00 00 00       	mov    esi,0x0
  8079ec:	48 89 c7             	mov    rdi,rax
  8079ef:	e8 e6 fa ff ff       	call   8074da <path_walk>
  8079f4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    if(dentry == NULL){
  8079f8:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  8079fd:	0f 85 2f 01 00 00    	jne    807b32 <sys_open+0x236>
        if(!flags&O_CREAT)
            return -ENOENT;
        //创建文件
        //找到上一级目录
        char* p=path+strlen(path)-1;
  807a03:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807a07:	48 89 c7             	mov    rdi,rax
  807a0a:	e8 03 48 00 00       	call   80c212 <strlen>
  807a0f:	48 98                	cdqe   
  807a11:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  807a15:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807a19:	48 01 d0             	add    rax,rdx
  807a1c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for(;*p!='/'&&p>path;p--);
  807a20:	eb 05                	jmp    807a27 <sys_open+0x12b>
  807a22:	48 83 6d e0 01       	sub    QWORD PTR [rbp-0x20],0x1
  807a27:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807a2b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807a2e:	3c 2f                	cmp    al,0x2f
  807a30:	74 0a                	je     807a3c <sys_open+0x140>
  807a32:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807a36:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  807a3a:	77 e6                	ja     807a22 <sys_open+0x126>
        *p='\0';
  807a3c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807a40:	c6 00 00             	mov    BYTE PTR [rax],0x0
        struct dir_entry *parent= path_walk(path,O_DIRECTORY);
  807a43:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807a47:	be 00 40 00 00       	mov    esi,0x4000
  807a4c:	48 89 c7             	mov    rdi,rax
  807a4f:	e8 86 fa ff ff       	call   8074da <path_walk>
  807a54:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        if(parent==NULL)
  807a58:	48 83 7d b8 00       	cmp    QWORD PTR [rbp-0x48],0x0
  807a5d:	75 0c                	jne    807a6b <sys_open+0x16f>
            return -ENOENT;//上级目录也不在
  807a5f:	48 c7 c0 d3 ff ff ff 	mov    rax,0xffffffffffffffd3
  807a66:	e9 cd 02 00 00       	jmp    807d38 <sys_open+0x43c>
        //创建新的文件
        dentry=(struct dir_entry*)vmalloc();
  807a6b:	b8 00 00 00 00       	mov    eax,0x0
  807a70:	e8 88 97 ff ff       	call   8011fd <vmalloc>
  807a75:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        list_add_to_behind(&parent->subdirs_list,dentry);
  807a79:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807a7d:	48 83 c0 20          	add    rax,0x20
  807a81:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  807a85:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807a89:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
    new->next = entry->next;
  807a8d:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807a91:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  807a95:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  807a99:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    new->prev = entry;
  807a9d:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  807aa1:	48 8b 55 b0          	mov    rdx,QWORD PTR [rbp-0x50]
  807aa5:	48 89 10             	mov    QWORD PTR [rax],rdx
    new->next->prev = new;
  807aa8:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  807aac:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  807ab0:	48 8b 55 a8          	mov    rdx,QWORD PTR [rbp-0x58]
  807ab4:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  807ab7:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807abb:	48 8b 55 a8          	mov    rdx,QWORD PTR [rbp-0x58]
  807abf:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  807ac3:	90                   	nop
        dentry->parent=parent;
  807ac4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807ac8:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  807acc:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
        dentry->dir_inode=dentry+1;//放在后面
  807ad0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807ad4:	48 8d 50 48          	lea    rdx,[rax+0x48]
  807ad8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807adc:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
        dentry->dir_inode->file_size=0;
  807ae0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807ae4:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807ae8:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
        //继承操作方法
        dentry->dir_inode->f_ops=parent->dir_inode->f_ops;
  807aef:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807af3:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
  807af7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807afb:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807aff:	48 8b 52 20          	mov    rdx,QWORD PTR [rdx+0x20]
  807b03:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
        dentry->dir_ops=parent->dir_ops;
  807b07:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807b0b:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  807b0f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807b13:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
        //继承上级目录的特殊属性
        dentry->dir_inode->attribute=*(unsigned long*)parent->dir_inode->private_index_info;
  807b17:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807b1b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807b1f:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
  807b23:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807b27:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807b2b:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  807b2e:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    }
    vmfree(path);
  807b32:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807b36:	48 89 c7             	mov    rdi,rax
  807b39:	e8 4e 97 ff ff       	call   80128c <vmfree>

    if((flags & O_DIRECTORY) && (dentry->dir_inode->attribute != FS_ATTR_DIR))
  807b3e:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  807b41:	25 00 40 00 00       	and    eax,0x4000
  807b46:	85 c0                	test   eax,eax
  807b48:	74 1e                	je     807b68 <sys_open+0x26c>
  807b4a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807b4e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807b52:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807b56:	48 83 f8 02          	cmp    rax,0x2
  807b5a:	74 0c                	je     807b68 <sys_open+0x26c>
        return -ENOTDIR;
  807b5c:	48 c7 c0 c7 ff ff ff 	mov    rax,0xffffffffffffffc7
  807b63:	e9 d0 01 00 00       	jmp    807d38 <sys_open+0x43c>
    if(!(flags & O_DIRECTORY) && (dentry->dir_inode->attribute == FS_ATTR_DIR))
  807b68:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  807b6b:	25 00 40 00 00       	and    eax,0x4000
  807b70:	85 c0                	test   eax,eax
  807b72:	75 1e                	jne    807b92 <sys_open+0x296>
  807b74:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807b78:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807b7c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807b80:	48 83 f8 02          	cmp    rax,0x2
  807b84:	75 0c                	jne    807b92 <sys_open+0x296>
        return -EISDIR;
  807b86:	48 c7 c0 e1 ff ff ff 	mov    rax,0xffffffffffffffe1
  807b8d:	e9 a6 01 00 00       	jmp    807d38 <sys_open+0x43c>

    filp = (struct file *)vmalloc();
  807b92:	b8 00 00 00 00       	mov    eax,0x0
  807b97:	e8 61 96 ff ff       	call   8011fd <vmalloc>
  807b9c:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    memset(filp,0,sizeof(struct file));
  807ba0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807ba4:	ba 28 00 00 00       	mov    edx,0x28
  807ba9:	be 00 00 00 00       	mov    esi,0x0
  807bae:	48 89 c7             	mov    rdi,rax
  807bb1:	e8 ee 43 00 00       	call   80bfa4 <memset>
    filp->dentry = dentry;
  807bb6:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807bba:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  807bbe:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    filp->mode = flags;
  807bc2:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  807bc5:	48 63 d0             	movsxd rdx,eax
  807bc8:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807bcc:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx

    if(dentry->dir_inode->attribute & FS_ATTR_DEVICE){
  807bd0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807bd4:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807bd8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807bdc:	83 e0 04             	and    eax,0x4
  807bdf:	48 85 c0             	test   rax,rax
  807be2:	74 0e                	je     807bf2 <sys_open+0x2f6>
        extern struct file_operations dev_dir_fops;
        filp->f_ops = &dev_dir_fops;	//////	find device file operation function
  807be4:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807be8:	48 c7 40 18 40 c9 80 	mov    QWORD PTR [rax+0x18],0x80c940
  807bef:	00 
  807bf0:	eb 14                	jmp    807c06 <sys_open+0x30a>
    }
    else
        filp->f_ops = dentry->dir_inode->f_ops;
  807bf2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807bf6:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807bfa:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  807bfe:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807c02:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    if(filp->f_ops && filp->f_ops->open)
  807c06:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807c0a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807c0e:	48 85 c0             	test   rax,rax
  807c11:	74 33                	je     807c46 <sys_open+0x34a>
  807c13:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807c17:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807c1b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807c1e:	48 85 c0             	test   rax,rax
  807c21:	74 23                	je     807c46 <sys_open+0x34a>
        error = filp->f_ops->open(dentry->dir_inode,filp);
  807c23:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807c27:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807c2b:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  807c2e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807c32:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807c36:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  807c3a:	48 89 d6             	mov    rsi,rdx
  807c3d:	48 89 c7             	mov    rdi,rax
  807c40:	ff d1                	call   rcx
  807c42:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(error != 1)
  807c46:	48 83 7d f8 01       	cmp    QWORD PTR [rbp-0x8],0x1
  807c4b:	74 18                	je     807c65 <sys_open+0x369>
    {
        vmfree(filp);
  807c4d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807c51:	48 89 c7             	mov    rdi,rax
  807c54:	e8 33 96 ff ff       	call   80128c <vmfree>
        return -EFAULT;
  807c59:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  807c60:	e9 d3 00 00 00       	jmp    807d38 <sys_open+0x43c>
    }

    if(filp->mode & O_TRUNC)
  807c65:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807c69:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  807c6d:	25 00 02 00 00       	and    eax,0x200
  807c72:	48 85 c0             	test   rax,rax
  807c75:	74 13                	je     807c8a <sys_open+0x38e>
    {
        filp->dentry->dir_inode->file_size = 0;
  807c77:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807c7b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807c7f:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807c83:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }
    if(filp->mode & O_APPEND)
  807c8a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807c8e:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  807c92:	25 00 04 00 00       	and    eax,0x400
  807c97:	48 85 c0             	test   rax,rax
  807c9a:	74 19                	je     807cb5 <sys_open+0x3b9>
    {
        filp->position = filp->dentry->dir_inode->file_size;
  807c9c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807ca0:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807ca4:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807ca8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807cab:	48 89 c2             	mov    rdx,rax
  807cae:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807cb2:	48 89 10             	mov    QWORD PTR [rax],rdx
    }

    f = current->openf;
  807cb5:	48 8b 05 e4 d8 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0d8e4]        # 4155a0 <current>
  807cbc:	48 05 d8 00 00 00    	add    rax,0xd8
  807cc2:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    for(i = 0;i < MAX_TASKS;i++)
  807cc6:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  807ccd:	eb 28                	jmp    807cf7 <sys_open+0x3fb>
        if(f[i] == NULL)
  807ccf:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807cd2:	48 98                	cdqe   
  807cd4:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  807cdb:	00 
  807cdc:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807ce0:	48 01 d0             	add    rax,rdx
  807ce3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807ce6:	48 85 c0             	test   rax,rax
  807ce9:	75 08                	jne    807cf3 <sys_open+0x3f7>
        {
            fd = i;
  807ceb:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807cee:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            break;
  807cf1:	eb 0a                	jmp    807cfd <sys_open+0x401>
    for(i = 0;i < MAX_TASKS;i++)
  807cf3:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  807cf7:	83 7d e8 1f          	cmp    DWORD PTR [rbp-0x18],0x1f
  807cfb:	7e d2                	jle    807ccf <sys_open+0x3d3>
        }
    if(i == MAX_TASKS)
  807cfd:	83 7d e8 20          	cmp    DWORD PTR [rbp-0x18],0x20
  807d01:	75 15                	jne    807d18 <sys_open+0x41c>
    {
        vmfree(filp);
  807d03:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807d07:	48 89 c7             	mov    rdi,rax
  807d0a:	e8 7d 95 ff ff       	call   80128c <vmfree>
        //// reclaim struct index_node & struct dir_entry
        return -EMFILE;
  807d0f:	48 c7 c0 df ff ff ff 	mov    rax,0xffffffffffffffdf
  807d16:	eb 20                	jmp    807d38 <sys_open+0x43c>
    }
    f[fd] = filp;
  807d18:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807d1b:	48 98                	cdqe   
  807d1d:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  807d24:	00 
  807d25:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807d29:	48 01 c2             	add    rdx,rax
  807d2c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807d30:	48 89 02             	mov    QWORD PTR [rdx],rax

    return fd;
  807d33:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807d36:	48 98                	cdqe   
}
  807d38:	c9                   	leave  
  807d39:	c3                   	ret    

0000000000807d3a <sys_close>:

unsigned long sys_close(int fd)
{
  807d3a:	f3 0f 1e fa          	endbr64 
  807d3e:	55                   	push   rbp
  807d3f:	48 89 e5             	mov    rbp,rsp
  807d42:	48 83 ec 20          	sub    rsp,0x20
  807d46:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    struct file * filp = NULL;
  807d49:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807d50:	00 

//	printf("sys_close:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  807d51:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  807d55:	78 06                	js     807d5d <sys_close+0x23>
  807d57:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  807d5b:	7e 0c                	jle    807d69 <sys_close+0x2f>
        return -EBADF;
  807d5d:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  807d64:	e9 87 00 00 00       	jmp    807df0 <sys_close+0xb6>

    filp = current->openf[fd];
  807d69:	48 8b 05 30 d8 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0d830]        # 4155a0 <current>
  807d70:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807d73:	48 63 d2             	movsxd rdx,edx
  807d76:	48 83 c2 1a          	add    rdx,0x1a
  807d7a:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  807d7f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(filp->f_ops && filp->f_ops->close)
  807d83:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807d87:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807d8b:	48 85 c0             	test   rax,rax
  807d8e:	74 35                	je     807dc5 <sys_close+0x8b>
  807d90:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807d94:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807d98:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  807d9c:	48 85 c0             	test   rax,rax
  807d9f:	74 24                	je     807dc5 <sys_close+0x8b>
        filp->f_ops->close(filp->dentry->dir_inode,filp);
  807da1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807da5:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807da9:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  807dad:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807db1:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807db5:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807db9:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  807dbd:	48 89 d6             	mov    rsi,rdx
  807dc0:	48 89 c7             	mov    rdi,rax
  807dc3:	ff d1                	call   rcx

    vmfree(filp);
  807dc5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807dc9:	48 89 c7             	mov    rdi,rax
  807dcc:	e8 bb 94 ff ff       	call   80128c <vmfree>
    current->openf[fd] = NULL;
  807dd1:	48 8b 05 c8 d7 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0d7c8]        # 4155a0 <current>
  807dd8:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807ddb:	48 63 d2             	movsxd rdx,edx
  807dde:	48 83 c2 1a          	add    rdx,0x1a
  807de2:	48 c7 44 d0 08 00 00 	mov    QWORD PTR [rax+rdx*8+0x8],0x0
  807de9:	00 00 

    return 0;
  807deb:	b8 00 00 00 00       	mov    eax,0x0
}
  807df0:	c9                   	leave  
  807df1:	c3                   	ret    

0000000000807df2 <sys_read>:

unsigned long sys_read(int fd,void * buf,long count)
{
  807df2:	f3 0f 1e fa          	endbr64 
  807df6:	55                   	push   rbp
  807df7:	48 89 e5             	mov    rbp,rsp
  807dfa:	48 83 ec 30          	sub    rsp,0x30
  807dfe:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  807e01:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  807e05:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  807e09:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  807e10:	00 
    unsigned long ret = 0;
  807e11:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807e18:	00 

//	printf("sys_read:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  807e19:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  807e1d:	78 06                	js     807e25 <sys_read+0x33>
  807e1f:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  807e23:	7e 09                	jle    807e2e <sys_read+0x3c>
        return -EBADF;
  807e25:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  807e2c:	eb 72                	jmp    807ea0 <sys_read+0xae>
    if(count < 0)
  807e2e:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  807e33:	79 09                	jns    807e3e <sys_read+0x4c>
        return -EINVAL;
  807e35:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  807e3c:	eb 62                	jmp    807ea0 <sys_read+0xae>

    filp = current->openf[fd];
  807e3e:	48 8b 05 5b d7 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0d75b]        # 4155a0 <current>
  807e45:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807e48:	48 63 d2             	movsxd rdx,edx
  807e4b:	48 83 c2 1a          	add    rdx,0x1a
  807e4f:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  807e54:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->read)
  807e58:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807e5c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807e60:	48 85 c0             	test   rax,rax
  807e63:	74 37                	je     807e9c <sys_read+0xaa>
  807e65:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807e69:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807e6d:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807e71:	48 85 c0             	test   rax,rax
  807e74:	74 26                	je     807e9c <sys_read+0xaa>
        ret = filp->f_ops->read(filp,buf,count,&filp->position);
  807e76:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807e7a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807e7e:	4c 8b 40 10          	mov    r8,QWORD PTR [rax+0x10]
  807e82:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  807e86:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  807e8a:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  807e8e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807e92:	48 89 c7             	mov    rdi,rax
  807e95:	41 ff d0             	call   r8
  807e98:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  807e9c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  807ea0:	c9                   	leave  
  807ea1:	c3                   	ret    

0000000000807ea2 <sys_write>:

unsigned long sys_write(int fd,void * buf,long count)
{
  807ea2:	f3 0f 1e fa          	endbr64 
  807ea6:	55                   	push   rbp
  807ea7:	48 89 e5             	mov    rbp,rsp
  807eaa:	48 83 ec 30          	sub    rsp,0x30
  807eae:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  807eb1:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  807eb5:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  807eb9:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  807ec0:	00 
    unsigned long ret = 0;
  807ec1:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807ec8:	00 

//	printf("sys_write:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  807ec9:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  807ecd:	78 06                	js     807ed5 <sys_write+0x33>
  807ecf:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  807ed3:	7e 09                	jle    807ede <sys_write+0x3c>
        return -EBADF;
  807ed5:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  807edc:	eb 72                	jmp    807f50 <sys_write+0xae>
    if(count < 0)
  807ede:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  807ee3:	79 09                	jns    807eee <sys_write+0x4c>
        return -EINVAL;
  807ee5:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  807eec:	eb 62                	jmp    807f50 <sys_write+0xae>

    filp = current->openf[fd];
  807eee:	48 8b 05 ab d6 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0d6ab]        # 4155a0 <current>
  807ef5:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807ef8:	48 63 d2             	movsxd rdx,edx
  807efb:	48 83 c2 1a          	add    rdx,0x1a
  807eff:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  807f04:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->write)
  807f08:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807f0c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807f10:	48 85 c0             	test   rax,rax
  807f13:	74 37                	je     807f4c <sys_write+0xaa>
  807f15:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807f19:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807f1d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807f21:	48 85 c0             	test   rax,rax
  807f24:	74 26                	je     807f4c <sys_write+0xaa>
        ret = filp->f_ops->write(filp,buf,count,&filp->position);
  807f26:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807f2a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807f2e:	4c 8b 40 18          	mov    r8,QWORD PTR [rax+0x18]
  807f32:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  807f36:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  807f3a:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  807f3e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807f42:	48 89 c7             	mov    rdi,rax
  807f45:	41 ff d0             	call   r8
  807f48:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  807f4c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  807f50:	c9                   	leave  
  807f51:	c3                   	ret    

0000000000807f52 <sys_lseek>:


unsigned long sys_lseek(int filds,long offset,int whence)
{
  807f52:	f3 0f 1e fa          	endbr64 
  807f56:	55                   	push   rbp
  807f57:	48 89 e5             	mov    rbp,rsp
  807f5a:	48 83 ec 20          	sub    rsp,0x20
  807f5e:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  807f61:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  807f65:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    struct file * filp = NULL;
  807f68:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  807f6f:	00 
    unsigned long ret = 0;
  807f70:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807f77:	00 

//	printf("sys_lseek:%d\n",filds);
    if(filds < 0 || filds >= MAX_TASKS)
  807f78:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  807f7c:	78 06                	js     807f84 <sys_lseek+0x32>
  807f7e:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  807f82:	7e 09                	jle    807f8d <sys_lseek+0x3b>
        return -EBADF;
  807f84:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  807f8b:	eb 78                	jmp    808005 <sys_lseek+0xb3>
    if(whence < 0 || whence >= SEEK_MAX)
  807f8d:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  807f91:	78 06                	js     807f99 <sys_lseek+0x47>
  807f93:	83 7d e8 02          	cmp    DWORD PTR [rbp-0x18],0x2
  807f97:	7e 09                	jle    807fa2 <sys_lseek+0x50>
        return -EINVAL;
  807f99:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  807fa0:	eb 63                	jmp    808005 <sys_lseek+0xb3>

    filp = current->openf[filds];
  807fa2:	48 8b 05 f7 d5 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0d5f7]        # 4155a0 <current>
  807fa9:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807fac:	48 63 d2             	movsxd rdx,edx
  807faf:	48 83 c2 1a          	add    rdx,0x1a
  807fb3:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  807fb8:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->lseek)
  807fbc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807fc0:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807fc4:	48 85 c0             	test   rax,rax
  807fc7:	74 38                	je     808001 <sys_lseek+0xaf>
  807fc9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807fcd:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807fd1:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  807fd5:	48 85 c0             	test   rax,rax
  807fd8:	74 27                	je     808001 <sys_lseek+0xaf>
        ret = filp->f_ops->lseek(filp,offset,whence);
  807fda:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807fde:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807fe2:	4c 8b 40 20          	mov    r8,QWORD PTR [rax+0x20]
  807fe6:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807fe9:	48 63 d0             	movsxd rdx,eax
  807fec:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  807ff0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807ff4:	48 89 ce             	mov    rsi,rcx
  807ff7:	48 89 c7             	mov    rdi,rax
  807ffa:	41 ff d0             	call   r8
  807ffd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  808001:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  808005:	c9                   	leave  
  808006:	c3                   	ret    

0000000000808007 <sys_vfork>:
//    printf("sys_fork\n");
//    //return do_fork(regs,0,regs->rsp,0);
//}

unsigned long sys_vfork()
{
  808007:	f3 0f 1e fa          	endbr64 
  80800b:	55                   	push   rbp
  80800c:	48 89 e5             	mov    rbp,rsp
  80800f:	48 83 ec 10          	sub    rsp,0x10
    regs_t *regs = (regs_t *)current->tss.rsp0 -1;
  808013:	48 8b 05 86 d5 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0d586]        # 4155a0 <current>
  80801a:	48 8b 80 dc 01 00 00 	mov    rax,QWORD PTR [rax+0x1dc]
  808021:	48 2d d0 00 00 00    	sub    rax,0xd0
  808027:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    printf("sys_vfork\n");
  80802b:	bf 98 46 81 00       	mov    edi,0x814698
  808030:	b8 00 00 00 00       	mov    eax,0x0
  808035:	e8 ed 8c ff ff       	call   800d27 <printf>
    //return do_fork(regs,CLONE_VM | CLONE_FS | CLONE_SIGNAL,regs->rsp,0);
}
  80803a:	90                   	nop
  80803b:	c9                   	leave  
  80803c:	c3                   	ret    

000000000080803d <sys_wait4>:
/*
	rusage reserved
*/

unsigned long sys_wait4(unsigned long pid,int *status,int options,void *rusage)
{
  80803d:	f3 0f 1e fa          	endbr64 
  808041:	55                   	push   rbp
  808042:	48 89 e5             	mov    rbp,rsp
  808045:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  808049:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80804d:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  808050:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
//    copy_to_user(&child->exit_code,status,sizeof(long));
//    tsk->next = child->next;
//    exit_mm(child);
//    vmfree(child);
//    return retval;
}
  808054:	90                   	nop
  808055:	5d                   	pop    rbp
  808056:	c3                   	ret    

0000000000808057 <sys_brk>:

unsigned long sys_brk(unsigned long brk)
{
  808057:	f3 0f 1e fa          	endbr64 
  80805b:	55                   	push   rbp
  80805c:	48 89 e5             	mov    rbp,rsp
  80805f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//
//    new_brk = do_brk(current->mm->end_brk,new_brk - current->mm->end_brk);	//expand brk space
//
//    current->mm->end_brk = new_brk;
//    return new_brk;
}
  808063:	90                   	nop
  808064:	5d                   	pop    rbp
  808065:	c3                   	ret    

0000000000808066 <sys_reboot>:

unsigned long sys_reboot(unsigned long cmd,void * arg)
{
  808066:	f3 0f 1e fa          	endbr64 
  80806a:	55                   	push   rbp
  80806b:	48 89 e5             	mov    rbp,rsp
  80806e:	48 83 ec 10          	sub    rsp,0x10
  808072:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  808076:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    printf("sys_reboot\n");
  80807a:	bf a3 46 81 00       	mov    edi,0x8146a3
  80807f:	b8 00 00 00 00       	mov    eax,0x0
  808084:	e8 9e 8c ff ff       	call   800d27 <printf>
    switch(cmd)
  808089:	48 83 7d f8 01       	cmp    QWORD PTR [rbp-0x8],0x1
  80808e:	74 09                	je     808099 <sys_reboot+0x33>
  808090:	48 83 7d f8 02       	cmp    QWORD PTR [rbp-0x8],0x2
  808095:	74 13                	je     8080aa <sys_reboot+0x44>
  808097:	eb 22                	jmp    8080bb <sys_reboot+0x55>
    {
        case SYSTEM_REBOOT:
            outb(0x64,0xFE);
  808099:	be fe 00 00 00       	mov    esi,0xfe
  80809e:	bf 64 00 00 00       	mov    edi,0x64
  8080a3:	e8 c8 de ff ff       	call   805f70 <outb>
            break;
  8080a8:	eb 21                	jmp    8080cb <sys_reboot+0x65>

        case SYSTEM_POWEROFF:
            printf("sys_reboot cmd SYSTEM_POWEROFF\n");
  8080aa:	bf b0 46 81 00       	mov    edi,0x8146b0
  8080af:	b8 00 00 00 00       	mov    eax,0x0
  8080b4:	e8 6e 8c ff ff       	call   800d27 <printf>
            break;
  8080b9:	eb 10                	jmp    8080cb <sys_reboot+0x65>

        default:
            printf("sys_reboot cmd ERROR!\n");
  8080bb:	bf d0 46 81 00       	mov    edi,0x8146d0
  8080c0:	b8 00 00 00 00       	mov    eax,0x0
  8080c5:	e8 5d 8c ff ff       	call   800d27 <printf>
            break;
  8080ca:	90                   	nop
    }
    return 0;
  8080cb:	b8 00 00 00 00       	mov    eax,0x0
}
  8080d0:	c9                   	leave  
  8080d1:	c3                   	ret    

00000000008080d2 <sys_chdir>:


unsigned long sys_chdir(char *filename)
{
  8080d2:	f3 0f 1e fa          	endbr64 
  8080d6:	55                   	push   rbp
  8080d7:	48 89 e5             	mov    rbp,rsp
  8080da:	48 83 ec 30          	sub    rsp,0x30
  8080de:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char * path = NULL;
  8080e2:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8080e9:	00 
    long pathlen = 0;
  8080ea:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8080f1:	00 
    struct dir_entry * dentry = NULL;
  8080f2:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  8080f9:	00 

    printf("sys_chdir\n");
  8080fa:	bf e7 46 81 00       	mov    edi,0x8146e7
  8080ff:	b8 00 00 00 00       	mov    eax,0x0
  808104:	e8 1e 8c ff ff       	call   800d27 <printf>
    path = (char *)vmalloc();
  808109:	b8 00 00 00 00       	mov    eax,0x0
  80810e:	e8 ea 90 ff ff       	call   8011fd <vmalloc>
  808113:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    if(path == NULL)
  808117:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80811c:	75 0c                	jne    80812a <sys_chdir+0x58>
        return -ENOMEM;
  80811e:	48 c7 c0 cf ff ff ff 	mov    rax,0xffffffffffffffcf
  808125:	e9 ca 00 00 00       	jmp    8081f4 <sys_chdir+0x122>
    memset(path,0,PAGE_4K_SIZE);
  80812a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80812e:	ba 00 10 00 00       	mov    edx,0x1000
  808133:	be 00 00 00 00       	mov    esi,0x0
  808138:	48 89 c7             	mov    rdi,rax
  80813b:	e8 64 3e 00 00       	call   80bfa4 <memset>
    pathlen = strlen(filename);
  808140:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808144:	48 89 c7             	mov    rdi,rax
  808147:	e8 c6 40 00 00       	call   80c212 <strlen>
  80814c:	48 98                	cdqe   
  80814e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(pathlen <= 0)
  808152:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  808157:	7f 18                	jg     808171 <sys_chdir+0x9f>
    {
        vmfree(path);
  808159:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80815d:	48 89 c7             	mov    rdi,rax
  808160:	e8 27 91 ff ff       	call   80128c <vmfree>
        return -EFAULT;
  808165:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  80816c:	e9 83 00 00 00       	jmp    8081f4 <sys_chdir+0x122>
    }
    else if(pathlen >= PAGE_4K_SIZE)
  808171:	48 81 7d f0 ff 0f 00 	cmp    QWORD PTR [rbp-0x10],0xfff
  808178:	00 
  808179:	7e 15                	jle    808190 <sys_chdir+0xbe>
    {
        vmfree(path);
  80817b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80817f:	48 89 c7             	mov    rdi,rax
  808182:	e8 05 91 ff ff       	call   80128c <vmfree>
        return -ENAMETOOLONG;
  808187:	48 c7 c0 db ff ff ff 	mov    rax,0xffffffffffffffdb
  80818e:	eb 64                	jmp    8081f4 <sys_chdir+0x122>
    }
    strcpy(filename,path);
  808190:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  808194:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808198:	48 89 d6             	mov    rsi,rdx
  80819b:	48 89 c7             	mov    rdi,rax
  80819e:	e8 50 3e 00 00       	call   80bff3 <strcpy>

    dentry = path_walk(path,0);
  8081a3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8081a7:	be 00 00 00 00       	mov    esi,0x0
  8081ac:	48 89 c7             	mov    rdi,rax
  8081af:	e8 26 f3 ff ff       	call   8074da <path_walk>
  8081b4:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    vmfree(path);
  8081b8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8081bc:	48 89 c7             	mov    rdi,rax
  8081bf:	e8 c8 90 ff ff       	call   80128c <vmfree>

    if(dentry == NULL)
  8081c4:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  8081c9:	75 09                	jne    8081d4 <sys_chdir+0x102>
        return -ENOENT;
  8081cb:	48 c7 c0 d3 ff ff ff 	mov    rax,0xffffffffffffffd3
  8081d2:	eb 20                	jmp    8081f4 <sys_chdir+0x122>
    if(dentry->dir_inode->attribute != FS_ATTR_DIR)
  8081d4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8081d8:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8081dc:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8081e0:	48 83 f8 02          	cmp    rax,0x2
  8081e4:	74 09                	je     8081ef <sys_chdir+0x11d>
        return -ENOTDIR;
  8081e6:	48 c7 c0 c7 ff ff ff 	mov    rax,0xffffffffffffffc7
  8081ed:	eb 05                	jmp    8081f4 <sys_chdir+0x122>
    return 0;
  8081ef:	b8 00 00 00 00       	mov    eax,0x0
}
  8081f4:	c9                   	leave  
  8081f5:	c3                   	ret    

00000000008081f6 <sys_getdents>:

unsigned long sys_getdents(int fd, void * dirent, long count)
{
  8081f6:	f3 0f 1e fa          	endbr64 
  8081fa:	55                   	push   rbp
  8081fb:	48 89 e5             	mov    rbp,rsp
  8081fe:	48 83 ec 30          	sub    rsp,0x30
  808202:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  808205:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  808209:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  80820d:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  808214:	00 
    unsigned long ret = 0;
  808215:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80821c:	00 

//	printf("sys_getdents:%d\n",fd);
    if(fd < 0 || fd > MAX_TASKS)
  80821d:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  808221:	78 06                	js     808229 <sys_getdents+0x33>
  808223:	83 7d ec 20          	cmp    DWORD PTR [rbp-0x14],0x20
  808227:	7e 09                	jle    808232 <sys_getdents+0x3c>
        return -EBADF;
  808229:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  808230:	eb 72                	jmp    8082a4 <sys_getdents+0xae>
    if(count < 0)
  808232:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  808237:	79 09                	jns    808242 <sys_getdents+0x4c>
        return -EINVAL;
  808239:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  808240:	eb 62                	jmp    8082a4 <sys_getdents+0xae>

    filp = current->openf[fd];
  808242:	48 8b 05 57 d3 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0d357]        # 4155a0 <current>
  808249:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80824c:	48 63 d2             	movsxd rdx,edx
  80824f:	48 83 c2 1a          	add    rdx,0x1a
  808253:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  808258:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->readdir)
  80825c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808260:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808264:	48 85 c0             	test   rax,rax
  808267:	74 37                	je     8082a0 <sys_getdents+0xaa>
  808269:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80826d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808271:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808275:	48 85 c0             	test   rax,rax
  808278:	74 26                	je     8082a0 <sys_getdents+0xaa>
        ret = filp->f_ops->readdir(filp,dirent,&fill_dentry);
  80827a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80827e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808282:	4c 8b 40 30          	mov    r8,QWORD PTR [rax+0x30]
  808286:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  80828a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80828e:	ba 52 77 80 00       	mov    edx,0x807752
  808293:	48 89 ce             	mov    rsi,rcx
  808296:	48 89 c7             	mov    rdi,rax
  808299:	41 ff d0             	call   r8
  80829c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  8082a0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  8082a4:	c9                   	leave  
  8082a5:	c3                   	ret    

00000000008082a6 <shift>:
/* 0x5D - Apps      */ {  0,        0,       0x5D,      0x5D }
        };
char k_shift=0,k_ctrl=0,k_capslock=0;

void shift()
{
  8082a6:	f3 0f 1e fa          	endbr64 
  8082aa:	55                   	push   rbp
  8082ab:	48 89 e5             	mov    rbp,rsp
    k_shift=!k_shift;
  8082ae:	0f b6 05 18 06 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20618]        # 4288cd <k_shift>
  8082b5:	84 c0                	test   al,al
  8082b7:	0f 94 c0             	sete   al
  8082ba:	88 05 0d 06 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc2060d],al        # 4288cd <k_shift>
}
  8082c0:	90                   	nop
  8082c1:	5d                   	pop    rbp
  8082c2:	c3                   	ret    

00000000008082c3 <ctrl>:
void ctrl()
{
  8082c3:	f3 0f 1e fa          	endbr64 
  8082c7:	55                   	push   rbp
  8082c8:	48 89 e5             	mov    rbp,rsp
    k_ctrl=!k_ctrl;
  8082cb:	0f b6 05 fc 05 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc205fc]        # 4288ce <k_ctrl>
  8082d2:	84 c0                	test   al,al
  8082d4:	0f 94 c0             	sete   al
  8082d7:	88 05 f1 05 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc205f1],al        # 4288ce <k_ctrl>
}
  8082dd:	90                   	nop
  8082de:	5d                   	pop    rbp
  8082df:	c3                   	ret    

00000000008082e0 <capslock>:
void capslock()
{
  8082e0:	f3 0f 1e fa          	endbr64 
  8082e4:	55                   	push   rbp
  8082e5:	48 89 e5             	mov    rbp,rsp
    k_capslock=k_capslock==0?1:0;
  8082e8:	0f b6 05 e0 05 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc205e0]        # 4288cf <k_capslock>
  8082ef:	84 c0                	test   al,al
  8082f1:	0f 94 c0             	sete   al
  8082f4:	88 05 d5 05 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc205d5],al        # 4288cf <k_capslock>
}
  8082fa:	90                   	nop
  8082fb:	5d                   	pop    rbp
  8082fc:	c3                   	ret    

00000000008082fd <to_ascii>:
char to_ascii(char scan_code)
{
  8082fd:	f3 0f 1e fa          	endbr64 
  808301:	55                   	push   rbp
  808302:	48 89 e5             	mov    rbp,rsp
  808305:	89 f8                	mov    eax,edi
  808307:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  80830a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  808311:	e9 c7 00 00 00       	jmp    8083dd <to_ascii+0xe0>
        if(key_map[i].scan_code==scan_code)
  808316:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808319:	48 63 d0             	movsxd rdx,eax
  80831c:	48 89 d0             	mov    rax,rdx
  80831f:	48 c1 e0 02          	shl    rax,0x2
  808323:	48 01 d0             	add    rax,rdx
  808326:	48 05 62 48 81 00    	add    rax,0x814862
  80832c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80832f:	38 45 ec             	cmp    BYTE PTR [rbp-0x14],al
  808332:	0f 85 a1 00 00 00    	jne    8083d9 <to_ascii+0xdc>
        {
            if(k_capslock&&key_map[i].ascii>='a'&&key_map[i].ascii<='z')return key_map[i].ascii_shift;
  808338:	0f b6 05 90 05 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20590]        # 4288cf <k_capslock>
  80833f:	84 c0                	test   al,al
  808341:	74 55                	je     808398 <to_ascii+0x9b>
  808343:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808346:	48 63 d0             	movsxd rdx,eax
  808349:	48 89 d0             	mov    rax,rdx
  80834c:	48 c1 e0 02          	shl    rax,0x2
  808350:	48 01 d0             	add    rax,rdx
  808353:	48 05 60 48 81 00    	add    rax,0x814860
  808359:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80835c:	3c 60                	cmp    al,0x60
  80835e:	7e 38                	jle    808398 <to_ascii+0x9b>
  808360:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808363:	48 63 d0             	movsxd rdx,eax
  808366:	48 89 d0             	mov    rax,rdx
  808369:	48 c1 e0 02          	shl    rax,0x2
  80836d:	48 01 d0             	add    rax,rdx
  808370:	48 05 60 48 81 00    	add    rax,0x814860
  808376:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808379:	3c 7a                	cmp    al,0x7a
  80837b:	7f 1b                	jg     808398 <to_ascii+0x9b>
  80837d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808380:	48 63 d0             	movsxd rdx,eax
  808383:	48 89 d0             	mov    rax,rdx
  808386:	48 c1 e0 02          	shl    rax,0x2
  80838a:	48 01 d0             	add    rax,rdx
  80838d:	48 05 61 48 81 00    	add    rax,0x814861
  808393:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808396:	eb 54                	jmp    8083ec <to_ascii+0xef>
            else if(k_shift)return key_map[i].ascii_shift;
  808398:	0f b6 05 2e 05 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2052e]        # 4288cd <k_shift>
  80839f:	84 c0                	test   al,al
  8083a1:	74 1b                	je     8083be <to_ascii+0xc1>
  8083a3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8083a6:	48 63 d0             	movsxd rdx,eax
  8083a9:	48 89 d0             	mov    rax,rdx
  8083ac:	48 c1 e0 02          	shl    rax,0x2
  8083b0:	48 01 d0             	add    rax,rdx
  8083b3:	48 05 61 48 81 00    	add    rax,0x814861
  8083b9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8083bc:	eb 2e                	jmp    8083ec <to_ascii+0xef>
            else return key_map[i].ascii;
  8083be:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8083c1:	48 63 d0             	movsxd rdx,eax
  8083c4:	48 89 d0             	mov    rax,rdx
  8083c7:	48 c1 e0 02          	shl    rax,0x2
  8083cb:	48 01 d0             	add    rax,rdx
  8083ce:	48 05 60 48 81 00    	add    rax,0x814860
  8083d4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8083d7:	eb 13                	jmp    8083ec <to_ascii+0xef>
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  8083d9:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8083dd:	83 7d fc 5d          	cmp    DWORD PTR [rbp-0x4],0x5d
  8083e1:	0f 8e 2f ff ff ff    	jle    808316 <to_ascii+0x19>
        }

    return '\0';
  8083e7:	b8 00 00 00 00       	mov    eax,0x0
}
  8083ec:	5d                   	pop    rbp
  8083ed:	c3                   	ret    

00000000008083ee <init_kb>:
int init_kb()
{
  8083ee:	f3 0f 1e fa          	endbr64 
  8083f2:	55                   	push   rbp
  8083f3:	48 89 e5             	mov    rbp,rsp
    reg_device(&dev_keyboard);
  8083f6:	bf a0 47 81 00       	mov    edi,0x8147a0
  8083fb:	e8 c1 a5 ff ff       	call   8029c1 <reg_device>
    reg_driver(&drv_keyboard);
  808400:	bf 00 47 81 00       	mov    edi,0x814700
  808405:	e8 9f a8 ff ff       	call   802ca9 <reg_driver>
}
  80840a:	90                   	nop
  80840b:	5d                   	pop    rbp
  80840c:	c3                   	ret    

000000000080840d <key_proc>:
int key_proc()
{
  80840d:	f3 0f 1e fa          	endbr64 
  808411:	55                   	push   rbp
  808412:	48 89 e5             	mov    rbp,rsp
  808415:	48 83 ec 10          	sub    rsp,0x10
    asm volatile("cli");
  808419:	fa                   	cli    
    //获取完整的扫描码
    u8 scan1=0,scan2=0,ch=0;
  80841a:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
  80841e:	c6 45 fe 00          	mov    BYTE PTR [rbp-0x2],0x0
  808422:	c6 45 fd 00          	mov    BYTE PTR [rbp-0x3],0x0
    key_code tmpc;
    scan1=inb(0x60);
  808426:	bf 60 00 00 00       	mov    edi,0x60
  80842b:	e8 59 db ff ff       	call   805f89 <inb>
  808430:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
//    tmpc.scan_code2=scan2;
//    tmpc.ascii= ch;


//    ENQUEUE(key_bufq,tmpc)
    if((key_bufq.tail+1)%key_bufq.size!=key_bufq.head)
  808433:	8b 05 f3 45 00 00    	mov    eax,DWORD PTR [rip+0x45f3]        # 80ca2c <key_bufq+0xc>
  808439:	83 c0 01             	add    eax,0x1
  80843c:	8b 0d ee 45 00 00    	mov    ecx,DWORD PTR [rip+0x45ee]        # 80ca30 <key_bufq+0x10>
  808442:	99                   	cdq    
  808443:	f7 f9                	idiv   ecx
  808445:	8b 05 dd 45 00 00    	mov    eax,DWORD PTR [rip+0x45dd]        # 80ca28 <key_bufq+0x8>
  80844b:	39 c2                	cmp    edx,eax
  80844d:	74 32                	je     808481 <key_proc+0x74>
    {
        key_bufq.data[key_bufq.tail]=scan1;
  80844f:	48 8b 15 ca 45 00 00 	mov    rdx,QWORD PTR [rip+0x45ca]        # 80ca20 <key_bufq>
  808456:	8b 05 d0 45 00 00    	mov    eax,DWORD PTR [rip+0x45d0]        # 80ca2c <key_bufq+0xc>
  80845c:	48 98                	cdqe   
  80845e:	48 01 c2             	add    rdx,rax
  808461:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  808465:	88 02                	mov    BYTE PTR [rdx],al
        key_bufq.tail=(key_bufq.tail+1)%key_bufq.size;
  808467:	8b 05 bf 45 00 00    	mov    eax,DWORD PTR [rip+0x45bf]        # 80ca2c <key_bufq+0xc>
  80846d:	83 c0 01             	add    eax,0x1
  808470:	8b 0d ba 45 00 00    	mov    ecx,DWORD PTR [rip+0x45ba]        # 80ca30 <key_bufq+0x10>
  808476:	99                   	cdq    
  808477:	f7 f9                	idiv   ecx
  808479:	89 d0                	mov    eax,edx
  80847b:	89 05 ab 45 00 00    	mov    DWORD PTR [rip+0x45ab],eax        # 80ca2c <key_bufq+0xc>
    }

    if(scan1==0x48)
  808481:	80 7d ff 48          	cmp    BYTE PTR [rbp-0x1],0x48
  808485:	75 0a                	jne    808491 <key_proc+0x84>
        scr_up();
  808487:	b8 00 00 00 00       	mov    eax,0x0
  80848c:	e8 ef ec ff ff       	call   807180 <scr_up>
    if(scan1==0x50)
  808491:	80 7d ff 50          	cmp    BYTE PTR [rbp-0x1],0x50
  808495:	75 0a                	jne    8084a1 <key_proc+0x94>
        scr_down();
  808497:	b8 00 00 00 00       	mov    eax,0x0
  80849c:	e8 79 ed ff ff       	call   80721a <scr_down>
    switch (scan1)
  8084a1:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  8084a5:	3d b6 00 00 00       	cmp    eax,0xb6
  8084aa:	74 41                	je     8084ed <key_proc+0xe0>
  8084ac:	3d b6 00 00 00       	cmp    eax,0xb6
  8084b1:	7f 5e                	jg     808511 <key_proc+0x104>
  8084b3:	3d aa 00 00 00       	cmp    eax,0xaa
  8084b8:	74 33                	je     8084ed <key_proc+0xe0>
  8084ba:	3d aa 00 00 00       	cmp    eax,0xaa
  8084bf:	7f 50                	jg     808511 <key_proc+0x104>
  8084c1:	3d 9d 00 00 00       	cmp    eax,0x9d
  8084c6:	74 31                	je     8084f9 <key_proc+0xec>
  8084c8:	3d 9d 00 00 00       	cmp    eax,0x9d
  8084cd:	7f 42                	jg     808511 <key_proc+0x104>
  8084cf:	83 f8 3a             	cmp    eax,0x3a
  8084d2:	74 31                	je     808505 <key_proc+0xf8>
  8084d4:	83 f8 3a             	cmp    eax,0x3a
  8084d7:	7f 38                	jg     808511 <key_proc+0x104>
  8084d9:	83 f8 36             	cmp    eax,0x36
  8084dc:	74 0f                	je     8084ed <key_proc+0xe0>
  8084de:	83 f8 36             	cmp    eax,0x36
  8084e1:	7f 2e                	jg     808511 <key_proc+0x104>
  8084e3:	83 f8 1d             	cmp    eax,0x1d
  8084e6:	74 11                	je     8084f9 <key_proc+0xec>
  8084e8:	83 f8 2a             	cmp    eax,0x2a
  8084eb:	75 24                	jne    808511 <key_proc+0x104>
    {
        case 0x36:
        case 0x2a:
        case 0xaa:
        case 0xb6:
            shift();
  8084ed:	b8 00 00 00 00       	mov    eax,0x0
  8084f2:	e8 af fd ff ff       	call   8082a6 <shift>
            break;
  8084f7:	eb 19                	jmp    808512 <key_proc+0x105>
        case 0x1d:
        case 0x9d:
            ctrl();
  8084f9:	b8 00 00 00 00       	mov    eax,0x0
  8084fe:	e8 c0 fd ff ff       	call   8082c3 <ctrl>
            break;
  808503:	eb 0d                	jmp    808512 <key_proc+0x105>
        case 0x3a:
            capslock();
  808505:	b8 00 00 00 00       	mov    eax,0x0
  80850a:	e8 d1 fd ff ff       	call   8082e0 <capslock>
            break;
  80850f:	eb 01                	jmp    808512 <key_proc+0x105>
        default:
            break;
  808511:	90                   	nop
//        //logf("%x\n",stdin.w_ptr);
//        //print_stdin();
//        //printchar(ch);
//        //flush_screen(0);*/
//    }
    eoi();
  808512:	b8 00 00 00 00       	mov    eax,0x0
  808517:	e8 82 da ff ff       	call   805f9e <eoi>
    asm volatile("leave\r\n iretq");
  80851c:	c9                   	leave  
  80851d:	48 cf                	iretq  
}
  80851f:	90                   	nop
  808520:	c9                   	leave  
  808521:	c3                   	ret    

0000000000808522 <sys_analyse_key>:

char sys_analyse_key()
{
  808522:	f3 0f 1e fa          	endbr64 
  808526:	55                   	push   rbp
  808527:	48 89 e5             	mov    rbp,rsp
  80852a:	48 83 ec 30          	sub    rsp,0x30
    if(key_bufq.tail==key_bufq.head)return -1;
  80852e:	8b 15 f8 44 00 00    	mov    edx,DWORD PTR [rip+0x44f8]        # 80ca2c <key_bufq+0xc>
  808534:	8b 05 ee 44 00 00    	mov    eax,DWORD PTR [rip+0x44ee]        # 80ca28 <key_bufq+0x8>
  80853a:	39 c2                	cmp    edx,eax
  80853c:	75 0a                	jne    808548 <sys_analyse_key+0x26>
  80853e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808543:	e9 df 00 00 00       	jmp    808627 <sys_analyse_key+0x105>
    char c=key_buf[key_bufq.head];
  808548:	8b 05 da 44 00 00    	mov    eax,DWORD PTR [rip+0x44da]        # 80ca28 <key_bufq+0x8>
  80854e:	48 98                	cdqe   
  808550:	0f b6 80 c0 86 42 00 	movzx  eax,BYTE PTR [rax+0x4286c0]
  808557:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    key_bufq.head=(key_bufq.head+1)%key_bufq.size;
  80855a:	8b 05 c8 44 00 00    	mov    eax,DWORD PTR [rip+0x44c8]        # 80ca28 <key_bufq+0x8>
  808560:	83 c0 01             	add    eax,0x1
  808563:	8b 0d c7 44 00 00    	mov    ecx,DWORD PTR [rip+0x44c7]        # 80ca30 <key_bufq+0x10>
  808569:	99                   	cdq    
  80856a:	f7 f9                	idiv   ecx
  80856c:	89 d0                	mov    eax,edx
  80856e:	89 05 b4 44 00 00    	mov    DWORD PTR [rip+0x44b4],eax        # 80ca28 <key_bufq+0x8>
//    QHEAD(key_bufq)=(QHEAD(key_bufq)+1)%QSIZE(key_bufq);
    printf("scan code:");
  808574:	bf 36 4a 81 00       	mov    edi,0x814a36
  808579:	b8 00 00 00 00       	mov    eax,0x0
  80857e:	e8 a4 87 ff ff       	call   800d27 <printf>
    char res[33]={0};
  808583:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  80858a:	00 
  80858b:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  808592:	00 
  808593:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80859a:	00 
  80859b:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  8085a2:	00 
  8085a3:	c6 45 f0 00          	mov    BYTE PTR [rbp-0x10],0x0
    itoa(res,16,c);
  8085a7:	0f be 55 ff          	movsx  edx,BYTE PTR [rbp-0x1]
  8085ab:	48 8d 45 d0          	lea    rax,[rbp-0x30]
  8085af:	be 10 00 00 00       	mov    esi,0x10
  8085b4:	48 89 c7             	mov    rdi,rax
  8085b7:	e8 2c 86 ff ff       	call   800be8 <itoa>
    printf(res);
  8085bc:	48 8d 45 d0          	lea    rax,[rbp-0x30]
  8085c0:	48 89 c7             	mov    rdi,rax
  8085c3:	b8 00 00 00 00       	mov    eax,0x0
  8085c8:	e8 5a 87 ff ff       	call   800d27 <printf>
    if(c&FLAG_BREAK){
  8085cd:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  8085d1:	79 16                	jns    8085e9 <sys_analyse_key+0xc7>
        printf("\n");
  8085d3:	bf 41 4a 81 00       	mov    edi,0x814a41
  8085d8:	b8 00 00 00 00       	mov    eax,0x0
  8085dd:	e8 45 87 ff ff       	call   800d27 <printf>
        return -1;
  8085e2:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8085e7:	eb 3e                	jmp    808627 <sys_analyse_key+0x105>
    }
    c= to_ascii(c&0x7f);
  8085e9:	0f be 45 ff          	movsx  eax,BYTE PTR [rbp-0x1]
  8085ed:	83 e0 7f             	and    eax,0x7f
  8085f0:	89 c7                	mov    edi,eax
  8085f2:	e8 06 fd ff ff       	call   8082fd <to_ascii>
  8085f7:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    printf(" char:");
  8085fa:	bf 43 4a 81 00       	mov    edi,0x814a43
  8085ff:	b8 00 00 00 00       	mov    eax,0x0
  808604:	e8 1e 87 ff ff       	call   800d27 <printf>
    putchar(c);
  808609:	0f be 45 ff          	movsx  eax,BYTE PTR [rbp-0x1]
  80860d:	89 c7                	mov    edi,eax
  80860f:	e8 e9 86 ff ff       	call   800cfd <putchar>
    printf("\n");
  808614:	bf 41 4a 81 00       	mov    edi,0x814a41
  808619:	b8 00 00 00 00       	mov    eax,0x0
  80861e:	e8 04 87 ff ff       	call   800d27 <printf>
    return c;
  808623:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  808627:	c9                   	leave  
  808628:	c3                   	ret    

0000000000808629 <init_disk>:
        .read=async_read_disk,
        .write=async_write_disk
};
int disks[4];//四块硬盘的dev号
int init_disk()
{
  808629:	f3 0f 1e fa          	endbr64 
  80862d:	55                   	push   rbp
  80862e:	48 89 e5             	mov    rbp,rsp
    //disk_devi= reg_device(&dev_disk);
    //disk_drvi= reg_driver(&drv_disk);
    //dev_disk.drv=&drv_disk;
    hd_iterate();
  808631:	b8 00 00 00 00       	mov    eax,0x0
  808636:	e8 c4 09 00 00       	call   808fff <hd_iterate>
    return 0;
  80863b:	b8 00 00 00 00       	mov    eax,0x0
}
  808640:	5d                   	pop    rbp
  808641:	c3                   	ret    

0000000000808642 <disk_int_handler_c>:

int disk_int_handler_c()
{
  808642:	f3 0f 1e fa          	endbr64 
  808646:	55                   	push   rbp
  808647:	48 89 e5             	mov    rbp,rsp
  80864a:	48 83 ec 20          	sub    rsp,0x20
    if(running_req==NULL)
  80864e:	48 8b 05 8b 2f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22f8b]        # 42b5e0 <running_req>
  808655:	48 85 c0             	test   rax,rax
  808658:	75 0a                	jne    808664 <disk_int_handler_c+0x22>
    {
        //printf("err:null running dreq\n");
        return 1;//同步读写硬盘
  80865a:	b8 01 00 00 00       	mov    eax,0x1
  80865f:	e9 bf 01 00 00       	jmp    808823 <disk_int_handler_c+0x1e1>
    }
    short *p=running_req->buf;
  808664:	48 8b 05 75 2f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22f75]        # 42b5e0 <running_req>
  80866b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80866f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int port=PORT_DISK_MAJOR;
  808673:	c7 45 f4 f0 01 00 00 	mov    DWORD PTR [rbp-0xc],0x1f0
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  80867a:	48 8b 05 5f 2f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22f5f]        # 42b5e0 <running_req>
  808681:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808684:	83 f8 02             	cmp    eax,0x2
  808687:	74 0f                	je     808698 <disk_int_handler_c+0x56>
    running_req->disk==DISK_SLAVE_SLAVE)
  808689:	48 8b 05 50 2f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22f50]        # 42b5e0 <running_req>
  808690:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  808693:	83 f8 03             	cmp    eax,0x3
  808696:	75 07                	jne    80869f <disk_int_handler_c+0x5d>
        port=PORT_DISK_SLAVE;
  808698:	c7 45 f4 70 01 00 00 	mov    DWORD PTR [rbp-0xc],0x170
    if(running_req->func==DISKREQ_READ)
  80869f:	48 8b 05 3a 2f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22f3a]        # 42b5e0 <running_req>
  8086a6:	8b 00                	mov    eax,DWORD PTR [rax]
  8086a8:	85 c0                	test   eax,eax
  8086aa:	75 50                	jne    8086fc <disk_int_handler_c+0xba>
    {
        ////printf("sys_read dist:%x\n",p);
        //读取
        for(int i=0;i<running_req->sec_n*256;i++)
  8086ac:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  8086b3:	eb 22                	jmp    8086d7 <disk_int_handler_c+0x95>
        {
            *p++=inw(port);
  8086b5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8086b8:	0f b7 c0             	movzx  eax,ax
  8086bb:	89 c7                	mov    edi,eax
  8086bd:	e8 d1 d8 ff ff       	call   805f93 <inw>
  8086c2:	89 c2                	mov    edx,eax
  8086c4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8086c8:	48 8d 48 02          	lea    rcx,[rax+0x2]
  8086cc:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  8086d0:	66 89 10             	mov    WORD PTR [rax],dx
        for(int i=0;i<running_req->sec_n*256;i++)
  8086d3:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  8086d7:	48 8b 05 02 2f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22f02]        # 42b5e0 <running_req>
  8086de:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  8086e1:	c1 e0 08             	shl    eax,0x8
  8086e4:	39 45 f0             	cmp    DWORD PTR [rbp-0x10],eax
  8086e7:	7c cc                	jl     8086b5 <disk_int_handler_c+0x73>
        }
        running_req->result=DISK_CHK_OK;
  8086e9:	48 8b 05 f0 2e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22ef0]        # 42b5e0 <running_req>
  8086f0:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  8086f7:	e9 d8 00 00 00       	jmp    8087d4 <disk_int_handler_c+0x192>
    }else if(running_req->func==DISKREQ_WRITE)
  8086fc:	48 8b 05 dd 2e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22edd]        # 42b5e0 <running_req>
  808703:	8b 00                	mov    eax,DWORD PTR [rax]
  808705:	83 f8 01             	cmp    eax,0x1
  808708:	75 50                	jne    80875a <disk_int_handler_c+0x118>
    {
        for(int i=0;i<running_req->sec_n*256;i++)
  80870a:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  808711:	eb 25                	jmp    808738 <disk_int_handler_c+0xf6>
            outw(port,*p++);
  808713:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808717:	48 8d 50 02          	lea    rdx,[rax+0x2]
  80871b:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80871f:	0f b7 00             	movzx  eax,WORD PTR [rax]
  808722:	0f b7 d0             	movzx  edx,ax
  808725:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808728:	0f b7 c0             	movzx  eax,ax
  80872b:	89 d6                	mov    esi,edx
  80872d:	89 c7                	mov    edi,eax
  80872f:	e8 49 d8 ff ff       	call   805f7d <outw>
        for(int i=0;i<running_req->sec_n*256;i++)
  808734:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  808738:	48 8b 05 a1 2e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22ea1]        # 42b5e0 <running_req>
  80873f:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  808742:	c1 e0 08             	shl    eax,0x8
  808745:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  808748:	7c c9                	jl     808713 <disk_int_handler_c+0xd1>
        running_req->result=DISK_CHK_OK;
  80874a:	48 8b 05 8f 2e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22e8f]        # 42b5e0 <running_req>
  808751:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  808758:	eb 7a                	jmp    8087d4 <disk_int_handler_c+0x192>
    }else if(running_req->func==DISKREQ_CHECK)
  80875a:	48 8b 05 7f 2e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22e7f]        # 42b5e0 <running_req>
  808761:	8b 00                	mov    eax,DWORD PTR [rax]
  808763:	83 f8 02             	cmp    eax,0x2
  808766:	75 34                	jne    80879c <disk_int_handler_c+0x15a>
    {
        char stat=inb(port+7);
  808768:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80876b:	83 c0 07             	add    eax,0x7
  80876e:	0f b6 c0             	movzx  eax,al
  808771:	89 c7                	mov    edi,eax
  808773:	e8 11 d8 ff ff       	call   805f89 <inb>
  808778:	88 45 e7             	mov    BYTE PTR [rbp-0x19],al
        short dat=inw(port);
  80877b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80877e:	0f b7 c0             	movzx  eax,ax
  808781:	89 c7                	mov    edi,eax
  808783:	e8 0b d8 ff ff       	call   805f93 <inw>
  808788:	66 89 45 e4          	mov    WORD PTR [rbp-0x1c],ax
        if(1)
        {
            running_req->result=DISK_CHK_OK;
  80878c:	48 8b 05 4d 2e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22e4d]        # 42b5e0 <running_req>
  808793:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  80879a:	eb 38                	jmp    8087d4 <disk_int_handler_c+0x192>
            char err=inb(port+1);//错误原因
            printf("checking disk err:%x\nresetting hd\n",err);
            running_req->result=DISK_CHK_ERR;
            request(running_req->disk,DISKREQ_RESET,0,0,0);
        }
    }else if(running_req->func==DISKREQ_RESET)
  80879c:	48 8b 05 3d 2e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22e3d]        # 42b5e0 <running_req>
  8087a3:	8b 00                	mov    eax,DWORD PTR [rax]
  8087a5:	83 f8 03             	cmp    eax,0x3
  8087a8:	75 2a                	jne    8087d4 <disk_int_handler_c+0x192>
    {
        int stat=inb(port+7);
  8087aa:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8087ad:	83 c0 07             	add    eax,0x7
  8087b0:	0f b6 c0             	movzx  eax,al
  8087b3:	89 c7                	mov    edi,eax
  8087b5:	e8 cf d7 ff ff       	call   805f89 <inb>
  8087ba:	0f b6 c0             	movzx  eax,al
  8087bd:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
        printf("reset disk done.\nstat now:%x\n",stat);
  8087c0:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8087c3:	89 c6                	mov    esi,eax
  8087c5:	bf 4a 4a 81 00       	mov    edi,0x814a4a
  8087ca:	b8 00 00 00 00       	mov    eax,0x0
  8087cf:	e8 53 85 ff ff       	call   800d27 <printf>
    }
    running_req->stat=REQ_STAT_DONE;
  8087d4:	48 8b 05 05 2e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22e05]        # 42b5e0 <running_req>
  8087db:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  8087e2:	48 8b 05 f7 2d c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22df7]        # 42b5e0 <running_req>
  8087e9:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  8087ed:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  8087f4:	00 00 00 
    running_devman_req->stat=REQ_STAT_DONE;
  8087f7:	48 8b 05 ea 2d c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22dea]        # 42b5e8 <running_devman_req>
  8087fe:	c7 80 ac 00 00 00 03 	mov    DWORD PTR [rax+0xac],0x3
  808805:	00 00 00 
    running_devman_req=NULL;
  808808:	48 c7 05 d5 2d c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22dd5],0x0        # 42b5e8 <running_devman_req>
  80880f:	00 00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  808813:	48 c7 05 c2 2d c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22dc2],0x0        # 42b5e0 <running_req>
  80881a:	00 00 00 00 
    return 0;
  80881e:	b8 00 00 00 00       	mov    eax,0x0
}
  808823:	c9                   	leave  
  808824:	c3                   	ret    

0000000000808825 <check_dreq_stat>:
int check_dreq_stat(int req_id)
{
  808825:	f3 0f 1e fa          	endbr64 
  808829:	55                   	push   rbp
  80882a:	48 89 e5             	mov    rbp,rsp
  80882d:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return disk_reqs[req_id].stat;
  808830:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808833:	48 63 d0             	movsxd rdx,eax
  808836:	48 89 d0             	mov    rax,rdx
  808839:	48 01 c0             	add    rax,rax
  80883c:	48 01 d0             	add    rax,rdx
  80883f:	48 c1 e0 04          	shl    rax,0x4
  808843:	48 05 fc 88 42 00    	add    rax,0x4288fc
  808849:	8b 00                	mov    eax,DWORD PTR [rax]
}
  80884b:	5d                   	pop    rbp
  80884c:	c3                   	ret    

000000000080884d <request>:
int request(int disk,int func,int lba,int secn,char *buf){
  80884d:	f3 0f 1e fa          	endbr64 
  808851:	55                   	push   rbp
  808852:	48 89 e5             	mov    rbp,rsp
  808855:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  808858:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80885b:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  80885e:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  808861:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    if((tail+1)%MAX_DISK_REQUEST_COUNT==head)
  808865:	8b 05 a9 2d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22da9]        # 42b614 <tail>
  80886b:	83 c0 01             	add    eax,0x1
  80886e:	48 63 d0             	movsxd rdx,eax
  808871:	48 69 d2 89 88 88 88 	imul   rdx,rdx,0xffffffff88888889
  808878:	48 c1 ea 20          	shr    rdx,0x20
  80887c:	01 c2                	add    edx,eax
  80887e:	c1 fa 07             	sar    edx,0x7
  808881:	89 c1                	mov    ecx,eax
  808883:	c1 f9 1f             	sar    ecx,0x1f
  808886:	29 ca                	sub    edx,ecx
  808888:	69 ca f0 00 00 00    	imul   ecx,edx,0xf0
  80888e:	29 c8                	sub    eax,ecx
  808890:	89 c2                	mov    edx,eax
  808892:	8b 05 78 2d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22d78]        # 42b610 <head>
  808898:	39 c2                	cmp    edx,eax
  80889a:	75 0a                	jne    8088a6 <request+0x59>
    {
        return -1;
  80889c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8088a1:	e9 0d 01 00 00       	jmp    8089b3 <request+0x166>
    }
    disk_reqs[tail].disk=disk;
  8088a6:	8b 05 68 2d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22d68]        # 42b614 <tail>
  8088ac:	48 63 d0             	movsxd rdx,eax
  8088af:	48 89 d0             	mov    rax,rdx
  8088b2:	48 01 c0             	add    rax,rax
  8088b5:	48 01 d0             	add    rax,rdx
  8088b8:	48 c1 e0 04          	shl    rax,0x4
  8088bc:	48 8d 90 e4 88 42 00 	lea    rdx,[rax+0x4288e4]
  8088c3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8088c6:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].func=func;
  8088c8:	8b 05 46 2d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22d46]        # 42b614 <tail>
  8088ce:	48 63 d0             	movsxd rdx,eax
  8088d1:	48 89 d0             	mov    rax,rdx
  8088d4:	48 01 c0             	add    rax,rax
  8088d7:	48 01 d0             	add    rax,rdx
  8088da:	48 c1 e0 04          	shl    rax,0x4
  8088de:	48 8d 90 e0 88 42 00 	lea    rdx,[rax+0x4288e0]
  8088e5:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8088e8:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].lba=lba;
  8088ea:	8b 05 24 2d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22d24]        # 42b614 <tail>
  8088f0:	48 63 d0             	movsxd rdx,eax
  8088f3:	48 89 d0             	mov    rax,rdx
  8088f6:	48 01 c0             	add    rax,rax
  8088f9:	48 01 d0             	add    rax,rdx
  8088fc:	48 c1 e0 04          	shl    rax,0x4
  808900:	48 8d 90 e8 88 42 00 	lea    rdx,[rax+0x4288e8]
  808907:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80890a:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].sec_n=secn;
  80890c:	8b 05 02 2d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22d02]        # 42b614 <tail>
  808912:	48 63 d0             	movsxd rdx,eax
  808915:	48 89 d0             	mov    rax,rdx
  808918:	48 01 c0             	add    rax,rax
  80891b:	48 01 d0             	add    rax,rdx
  80891e:	48 c1 e0 04          	shl    rax,0x4
  808922:	48 8d 90 ec 88 42 00 	lea    rdx,[rax+0x4288ec]
  808929:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80892c:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].stat=REQ_STAT_READY;
  80892e:	8b 05 e0 2c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22ce0]        # 42b614 <tail>
  808934:	48 63 d0             	movsxd rdx,eax
  808937:	48 89 d0             	mov    rax,rdx
  80893a:	48 01 c0             	add    rax,rax
  80893d:	48 01 d0             	add    rax,rdx
  808940:	48 c1 e0 04          	shl    rax,0x4
  808944:	48 05 fc 88 42 00    	add    rax,0x4288fc
  80894a:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    disk_reqs[tail].buf=buf;
  808950:	8b 05 be 2c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22cbe]        # 42b614 <tail>
  808956:	48 63 d0             	movsxd rdx,eax
  808959:	48 89 d0             	mov    rax,rdx
  80895c:	48 01 c0             	add    rax,rax
  80895f:	48 01 d0             	add    rax,rdx
  808962:	48 c1 e0 04          	shl    rax,0x4
  808966:	48 8d 90 f0 88 42 00 	lea    rdx,[rax+0x4288f0]
  80896d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808971:	48 89 02             	mov    QWORD PTR [rdx],rax
    int r=tail;
  808974:	8b 05 9a 2c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22c9a]        # 42b614 <tail>
  80897a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    tail=(tail+1)%MAX_DISK_REQUEST_COUNT;
  80897d:	8b 05 91 2c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22c91]        # 42b614 <tail>
  808983:	8d 50 01             	lea    edx,[rax+0x1]
  808986:	48 63 c2             	movsxd rax,edx
  808989:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  808990:	48 c1 e8 20          	shr    rax,0x20
  808994:	01 d0                	add    eax,edx
  808996:	c1 f8 07             	sar    eax,0x7
  808999:	89 d1                	mov    ecx,edx
  80899b:	c1 f9 1f             	sar    ecx,0x1f
  80899e:	29 c8                	sub    eax,ecx
  8089a0:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  8089a6:	89 d0                	mov    eax,edx
  8089a8:	29 c8                	sub    eax,ecx
  8089aa:	89 05 64 2c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc22c64],eax        # 42b614 <tail>
    return r;
  8089b0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8089b3:	5d                   	pop    rbp
  8089b4:	c3                   	ret    

00000000008089b5 <execute_request>:
int execute_request(){
  8089b5:	f3 0f 1e fa          	endbr64 
  8089b9:	55                   	push   rbp
  8089ba:	48 89 e5             	mov    rbp,rsp
  8089bd:	48 83 ec 10          	sub    rsp,0x10
    //查看是否有已经在运行的请求
    if(running_req!=NULL)
  8089c1:	48 8b 05 18 2c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22c18]        # 42b5e0 <running_req>
  8089c8:	48 85 c0             	test   rax,rax
  8089cb:	74 6a                	je     808a37 <execute_request+0x82>
    {
        running_req->time++;
  8089cd:	48 8b 05 0c 2c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22c0c]        # 42b5e0 <running_req>
  8089d4:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  8089d7:	83 c2 01             	add    edx,0x1
  8089da:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
        if(running_req->func!=DISKREQ_CHECK)
  8089dd:	48 8b 05 fc 2b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22bfc]        # 42b5e0 <running_req>
  8089e4:	8b 00                	mov    eax,DWORD PTR [rax]
  8089e6:	83 f8 02             	cmp    eax,0x2
  8089e9:	74 0a                	je     8089f5 <execute_request+0x40>
            return 2;
  8089eb:	b8 02 00 00 00       	mov    eax,0x2
  8089f0:	e9 b4 01 00 00       	jmp    808ba9 <execute_request+0x1f4>
        if(running_req->time>MAX_DISK_CHKTIME)
  8089f5:	48 8b 05 e4 2b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22be4]        # 42b5e0 <running_req>
  8089fc:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  8089ff:	83 f8 0a             	cmp    eax,0xa
  808a02:	7e 29                	jle    808a2d <execute_request+0x78>
        {
            //检测硬盘超时，视为没有硬盘连接
            running_req->result=DISK_CHK_ERR;
  808a04:	48 8b 05 d5 2b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22bd5]        # 42b5e0 <running_req>
  808a0b:	c7 40 20 02 00 00 00 	mov    DWORD PTR [rax+0x20],0x2
            running_req->stat=REQ_STAT_DONE;
  808a12:	48 8b 05 c7 2b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22bc7]        # 42b5e0 <running_req>
  808a19:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
            running_req=NULL;
  808a20:	48 c7 05 b5 2b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22bb5],0x0        # 42b5e0 <running_req>
  808a27:	00 00 00 00 
  808a2b:	eb 0a                	jmp    808a37 <execute_request+0x82>
        }else
        {
            //未到时间继续等待
            return 2;
  808a2d:	b8 02 00 00 00       	mov    eax,0x2
  808a32:	e9 72 01 00 00       	jmp    808ba9 <execute_request+0x1f4>
        }
    }
    if(head==tail)return 1;//检查是否为空
  808a37:	8b 15 d3 2b c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc22bd3]        # 42b610 <head>
  808a3d:	8b 05 d1 2b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22bd1]        # 42b614 <tail>
  808a43:	39 c2                	cmp    edx,eax
  808a45:	75 0a                	jne    808a51 <execute_request+0x9c>
  808a47:	b8 01 00 00 00       	mov    eax,0x1
  808a4c:	e9 58 01 00 00       	jmp    808ba9 <execute_request+0x1f4>
    running_req=&disk_reqs[head];
  808a51:	8b 05 b9 2b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22bb9]        # 42b610 <head>
  808a57:	48 63 d0             	movsxd rdx,eax
  808a5a:	48 89 d0             	mov    rax,rdx
  808a5d:	48 01 c0             	add    rax,rax
  808a60:	48 01 d0             	add    rax,rdx
  808a63:	48 c1 e0 04          	shl    rax,0x4
  808a67:	48 05 e0 88 42 00    	add    rax,0x4288e0
  808a6d:	48 89 05 6c 2b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22b6c],rax        # 42b5e0 <running_req>
    head=(head+1)%MAX_DISK_REQUEST_COUNT;
  808a74:	8b 05 96 2b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22b96]        # 42b610 <head>
  808a7a:	8d 50 01             	lea    edx,[rax+0x1]
  808a7d:	48 63 c2             	movsxd rax,edx
  808a80:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  808a87:	48 c1 e8 20          	shr    rax,0x20
  808a8b:	01 d0                	add    eax,edx
  808a8d:	c1 f8 07             	sar    eax,0x7
  808a90:	89 d1                	mov    ecx,edx
  808a92:	c1 f9 1f             	sar    ecx,0x1f
  808a95:	29 c8                	sub    eax,ecx
  808a97:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  808a9d:	89 d0                	mov    eax,edx
  808a9f:	29 c8                	sub    eax,ecx
  808aa1:	89 05 69 2b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc22b69],eax        # 42b610 <head>
    running_req->stat=REQ_STAT_WORKING;
  808aa7:	48 8b 05 32 2b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22b32]        # 42b5e0 <running_req>
  808aae:	c7 40 1c 02 00 00 00 	mov    DWORD PTR [rax+0x1c],0x2
    //set_proc_stat(running_req->pid,SUSPENDED);
    int r=0;
  808ab5:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    switch (running_req->func)
  808abc:	48 8b 05 1d 2b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22b1d]        # 42b5e0 <running_req>
  808ac3:	8b 00                	mov    eax,DWORD PTR [rax]
  808ac5:	83 f8 03             	cmp    eax,0x3
  808ac8:	0f 84 ad 00 00 00    	je     808b7b <execute_request+0x1c6>
  808ace:	83 f8 03             	cmp    eax,0x3
  808ad1:	0f 8f bf 00 00 00    	jg     808b96 <execute_request+0x1e1>
  808ad7:	83 f8 02             	cmp    eax,0x2
  808ada:	0f 84 85 00 00 00    	je     808b65 <execute_request+0x1b0>
  808ae0:	83 f8 02             	cmp    eax,0x2
  808ae3:	0f 8f ad 00 00 00    	jg     808b96 <execute_request+0x1e1>
  808ae9:	85 c0                	test   eax,eax
  808aeb:	74 0a                	je     808af7 <execute_request+0x142>
  808aed:	83 f8 01             	cmp    eax,0x1
  808af0:	74 3c                	je     808b2e <execute_request+0x179>
        break;
    case DISKREQ_RESET:
        r=async_reset_disk(running_req->disk);
        break;
    default:
        break;
  808af2:	e9 9f 00 00 00       	jmp    808b96 <execute_request+0x1e1>
        running_req->lba,running_req->sec_n,running_req->buf);
  808af7:	48 8b 05 e2 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22ae2]        # 42b5e0 <running_req>
        r=async_read_disk(running_req->disk,\
  808afe:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
        running_req->lba,running_req->sec_n,running_req->buf);
  808b02:	48 8b 05 d7 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22ad7]        # 42b5e0 <running_req>
        r=async_read_disk(running_req->disk,\
  808b09:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
        running_req->lba,running_req->sec_n,running_req->buf);
  808b0c:	48 8b 05 cd 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22acd]        # 42b5e0 <running_req>
  808b13:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_read_disk(running_req->disk,\
  808b16:	89 c6                	mov    esi,eax
  808b18:	48 8b 05 c1 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22ac1]        # 42b5e0 <running_req>
  808b1f:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808b22:	89 c7                	mov    edi,eax
  808b24:	e8 a7 00 00 00       	call   808bd0 <async_read_disk>
  808b29:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  808b2c:	eb 69                	jmp    808b97 <execute_request+0x1e2>
         running_req->lba,running_req->sec_n,running_req->buf);
  808b2e:	48 8b 05 ab 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22aab]        # 42b5e0 <running_req>
        r=async_write_disk(running_req->disk,\
  808b35:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
         running_req->lba,running_req->sec_n,running_req->buf);
  808b39:	48 8b 05 a0 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22aa0]        # 42b5e0 <running_req>
        r=async_write_disk(running_req->disk,\
  808b40:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
         running_req->lba,running_req->sec_n,running_req->buf);
  808b43:	48 8b 05 96 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22a96]        # 42b5e0 <running_req>
  808b4a:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_write_disk(running_req->disk,\
  808b4d:	89 c6                	mov    esi,eax
  808b4f:	48 8b 05 8a 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22a8a]        # 42b5e0 <running_req>
  808b56:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808b59:	89 c7                	mov    edi,eax
  808b5b:	e8 88 01 00 00       	call   808ce8 <async_write_disk>
  808b60:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  808b63:	eb 32                	jmp    808b97 <execute_request+0x1e2>
        r=async_check_disk(running_req->disk);
  808b65:	48 8b 05 74 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22a74]        # 42b5e0 <running_req>
  808b6c:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808b6f:	89 c7                	mov    edi,eax
  808b71:	e8 aa 06 00 00       	call   809220 <async_check_disk>
  808b76:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  808b79:	eb 1c                	jmp    808b97 <execute_request+0x1e2>
        r=async_reset_disk(running_req->disk);
  808b7b:	48 8b 05 5e 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22a5e]        # 42b5e0 <running_req>
  808b82:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808b85:	89 c7                	mov    edi,eax
  808b87:	b8 00 00 00 00       	mov    eax,0x0
  808b8c:	e8 1a 00 00 00       	call   808bab <async_reset_disk>
  808b91:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  808b94:	eb 01                	jmp    808b97 <execute_request+0x1e2>
        break;
  808b96:	90                   	nop
    }
    if(r==-1)return -1;
  808b97:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  808b9b:	75 07                	jne    808ba4 <execute_request+0x1ef>
  808b9d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808ba2:	eb 05                	jmp    808ba9 <execute_request+0x1f4>
    return 0;
  808ba4:	b8 00 00 00 00       	mov    eax,0x0
}
  808ba9:	c9                   	leave  
  808baa:	c3                   	ret    

0000000000808bab <async_reset_disk>:
int async_reset_disk(int disk)
{
  808bab:	f3 0f 1e fa          	endbr64 
  808baf:	55                   	push   rbp
  808bb0:	48 89 e5             	mov    rbp,rsp
  808bb3:	48 83 ec 10          	sub    rsp,0x10
  808bb7:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    outb(PORT_DISK_CONTROL,DISK_CMD_RESET);
  808bba:	be 0c 00 00 00       	mov    esi,0xc
  808bbf:	bf f6 03 00 00       	mov    edi,0x3f6
  808bc4:	e8 a7 d3 ff ff       	call   805f70 <outb>
    return 0;
  808bc9:	b8 00 00 00 00       	mov    eax,0x0
}
  808bce:	c9                   	leave  
  808bcf:	c3                   	ret    

0000000000808bd0 <async_read_disk>:
int async_read_disk(int disk,unsigned int lba,int sec_n,char* mem_addr)
{
  808bd0:	f3 0f 1e fa          	endbr64 
  808bd4:	55                   	push   rbp
  808bd5:	48 89 e5             	mov    rbp,rsp
  808bd8:	48 83 ec 30          	sub    rsp,0x30
  808bdc:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  808bdf:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  808be2:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  808be5:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  808be9:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  808bef:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  808bf6:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  808bfa:	74 06                	je     808c02 <async_read_disk+0x32>
  808bfc:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  808c00:	75 06                	jne    808c08 <async_read_disk+0x38>
        port=PORT_DISK_SLAVE;
  808c02:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  808c08:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  808c0c:	74 06                	je     808c14 <async_read_disk+0x44>
  808c0e:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  808c12:	75 07                	jne    808c1b <async_read_disk+0x4b>
        slave_disk=1;
  808c14:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    outb(port+2,sec_n);
  808c1b:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808c1e:	0f b6 d0             	movzx  edx,al
  808c21:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808c25:	83 c0 02             	add    eax,0x2
  808c28:	0f b7 c0             	movzx  eax,ax
  808c2b:	89 d6                	mov    esi,edx
  808c2d:	89 c7                	mov    edi,eax
  808c2f:	e8 3c d3 ff ff       	call   805f70 <outb>
    outb(port+3,lba&0xff);
  808c34:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808c37:	0f b6 d0             	movzx  edx,al
  808c3a:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808c3e:	83 c0 03             	add    eax,0x3
  808c41:	0f b7 c0             	movzx  eax,ax
  808c44:	89 d6                	mov    esi,edx
  808c46:	89 c7                	mov    edi,eax
  808c48:	e8 23 d3 ff ff       	call   805f70 <outb>
    outb(port+4,(lba>>8)&0xff);
  808c4d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808c50:	c1 e8 08             	shr    eax,0x8
  808c53:	0f b6 d0             	movzx  edx,al
  808c56:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808c5a:	83 c0 04             	add    eax,0x4
  808c5d:	0f b7 c0             	movzx  eax,ax
  808c60:	89 d6                	mov    esi,edx
  808c62:	89 c7                	mov    edi,eax
  808c64:	e8 07 d3 ff ff       	call   805f70 <outb>
    outb(port+5,(lba>>16)&0xff);
  808c69:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808c6c:	c1 e8 10             	shr    eax,0x10
  808c6f:	0f b6 d0             	movzx  edx,al
  808c72:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808c76:	83 c0 05             	add    eax,0x5
  808c79:	0f b7 c0             	movzx  eax,ax
  808c7c:	89 d6                	mov    esi,edx
  808c7e:	89 c7                	mov    edi,eax
  808c80:	e8 eb d2 ff ff       	call   805f70 <outb>
    char drv=slave_disk?0x10:0;
  808c85:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  808c89:	74 07                	je     808c92 <async_read_disk+0xc2>
  808c8b:	b8 10 00 00 00       	mov    eax,0x10
  808c90:	eb 05                	jmp    808c97 <async_read_disk+0xc7>
  808c92:	b8 00 00 00 00       	mov    eax,0x0
  808c97:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
    char lba_hi=(lba>>24)&0xf|drv|0xe0;
  808c9a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808c9d:	c1 e8 18             	shr    eax,0x18
  808ca0:	83 e0 0f             	and    eax,0xf
  808ca3:	89 c2                	mov    edx,eax
  808ca5:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  808ca9:	09 d0                	or     eax,edx
  808cab:	83 c8 e0             	or     eax,0xffffffe0
  808cae:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
    outb(port+6,lba_hi);
  808cb1:	0f b6 45 f6          	movzx  eax,BYTE PTR [rbp-0xa]
  808cb5:	0f b6 d0             	movzx  edx,al
  808cb8:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808cbc:	83 c0 06             	add    eax,0x6
  808cbf:	0f b7 c0             	movzx  eax,ax
  808cc2:	89 d6                	mov    esi,edx
  808cc4:	89 c7                	mov    edi,eax
  808cc6:	e8 a5 d2 ff ff       	call   805f70 <outb>
    outb(port+7,DISK_CMD_READ);
  808ccb:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808ccf:	83 c0 07             	add    eax,0x7
  808cd2:	0f b7 c0             	movzx  eax,ax
  808cd5:	be 20 00 00 00       	mov    esi,0x20
  808cda:	89 c7                	mov    edi,eax
  808cdc:	e8 8f d2 ff ff       	call   805f70 <outb>
    // }
    // for(int i=0;i<running_req->sec_n*256;i++)
    // {
    //     *mem_addr++=inw(port);
    // }
    return 0;
  808ce1:	b8 00 00 00 00       	mov    eax,0x0
}
  808ce6:	c9                   	leave  
  808ce7:	c3                   	ret    

0000000000808ce8 <async_write_disk>:
int async_write_disk(int disk,unsigned int lba, int sec_n, char* mem_ptr)
{
  808ce8:	f3 0f 1e fa          	endbr64 
  808cec:	55                   	push   rbp
  808ced:	48 89 e5             	mov    rbp,rsp
  808cf0:	48 83 ec 30          	sub    rsp,0x30
  808cf4:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  808cf7:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  808cfa:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  808cfd:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  808d01:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  808d07:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  808d0e:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  808d12:	74 06                	je     808d1a <async_write_disk+0x32>
  808d14:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  808d18:	75 06                	jne    808d20 <async_write_disk+0x38>
        port=PORT_DISK_SLAVE;
  808d1a:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  808d20:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  808d24:	74 06                	je     808d2c <async_write_disk+0x44>
  808d26:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  808d2a:	75 07                	jne    808d33 <async_write_disk+0x4b>
        slave_disk=1;
  808d2c:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    while (1)
    {
        byte t=inb(0x1f7);
  808d33:	bf f7 00 00 00       	mov    edi,0xf7
  808d38:	e8 4c d2 ff ff       	call   805f89 <inb>
  808d3d:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
        //logf("istat:%x",t);
        byte err=t&1;
  808d40:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  808d44:	83 e0 01             	and    eax,0x1
  808d47:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
        if(err!=0)
  808d4a:	80 7d f6 00          	cmp    BYTE PTR [rbp-0xa],0x0
  808d4e:	74 0a                	je     808d5a <async_write_disk+0x72>
        {
            //printf("ERR iwriting disk\n");
            return -1;
  808d50:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808d55:	e9 d5 00 00 00       	jmp    808e2f <async_write_disk+0x147>
        }
        t&=0x88;
  808d5a:	80 65 f7 88          	and    BYTE PTR [rbp-0x9],0x88
        if(t==0x8)break;
  808d5e:	80 7d f7 08          	cmp    BYTE PTR [rbp-0x9],0x8
  808d62:	74 02                	je     808d66 <async_write_disk+0x7e>
    {
  808d64:	eb cd                	jmp    808d33 <async_write_disk+0x4b>
        if(t==0x8)break;
  808d66:	90                   	nop
    }
    outb(port+2,sec_n);
  808d67:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808d6a:	0f b6 d0             	movzx  edx,al
  808d6d:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808d71:	83 c0 02             	add    eax,0x2
  808d74:	0f b7 c0             	movzx  eax,ax
  808d77:	89 d6                	mov    esi,edx
  808d79:	89 c7                	mov    edi,eax
  808d7b:	e8 f0 d1 ff ff       	call   805f70 <outb>
    outb(port+3,lba&0xff);
  808d80:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808d83:	0f b6 d0             	movzx  edx,al
  808d86:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808d8a:	83 c0 03             	add    eax,0x3
  808d8d:	0f b7 c0             	movzx  eax,ax
  808d90:	89 d6                	mov    esi,edx
  808d92:	89 c7                	mov    edi,eax
  808d94:	e8 d7 d1 ff ff       	call   805f70 <outb>
    outb(port+4,(lba>>8)&0xff);
  808d99:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808d9c:	c1 e8 08             	shr    eax,0x8
  808d9f:	0f b6 d0             	movzx  edx,al
  808da2:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808da6:	83 c0 04             	add    eax,0x4
  808da9:	0f b7 c0             	movzx  eax,ax
  808dac:	89 d6                	mov    esi,edx
  808dae:	89 c7                	mov    edi,eax
  808db0:	e8 bb d1 ff ff       	call   805f70 <outb>
    outb(port+5,(lba>>16)&0xff);
  808db5:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808db8:	c1 e8 10             	shr    eax,0x10
  808dbb:	0f b6 d0             	movzx  edx,al
  808dbe:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808dc2:	83 c0 05             	add    eax,0x5
  808dc5:	0f b7 c0             	movzx  eax,ax
  808dc8:	89 d6                	mov    esi,edx
  808dca:	89 c7                	mov    edi,eax
  808dcc:	e8 9f d1 ff ff       	call   805f70 <outb>
    char drv=slave_disk?0x10:0;
  808dd1:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  808dd5:	74 07                	je     808dde <async_write_disk+0xf6>
  808dd7:	b8 10 00 00 00       	mov    eax,0x10
  808ddc:	eb 05                	jmp    808de3 <async_write_disk+0xfb>
  808dde:	b8 00 00 00 00       	mov    eax,0x0
  808de3:	88 45 f5             	mov    BYTE PTR [rbp-0xb],al
    unsigned char lba_hi=(lba>>24)&0xf|drv|0xe0;
  808de6:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808de9:	c1 e8 18             	shr    eax,0x18
  808dec:	83 e0 0f             	and    eax,0xf
  808def:	89 c2                	mov    edx,eax
  808df1:	0f b6 45 f5          	movzx  eax,BYTE PTR [rbp-0xb]
  808df5:	09 d0                	or     eax,edx
  808df7:	83 c8 e0             	or     eax,0xffffffe0
  808dfa:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    outb(port+6,lba_hi);
  808dfd:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  808e01:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808e05:	83 c0 06             	add    eax,0x6
  808e08:	0f b7 c0             	movzx  eax,ax
  808e0b:	89 d6                	mov    esi,edx
  808e0d:	89 c7                	mov    edi,eax
  808e0f:	e8 5c d1 ff ff       	call   805f70 <outb>
    outb(port+7,DISK_CMD_WRITE);
  808e14:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808e18:	83 c0 07             	add    eax,0x7
  808e1b:	0f b7 c0             	movzx  eax,ax
  808e1e:	be 30 00 00 00       	mov    esi,0x30
  808e23:	89 c7                	mov    edi,eax
  808e25:	e8 46 d1 ff ff       	call   805f70 <outb>
    //     if(t==0x8)break;
    // }
    // short *p=mem_ptr;
    // for(int i=0;i<running_req->sec_n*256;i++)
    //         outw(port,*p++);
    return 0;
  808e2a:	b8 00 00 00 00       	mov    eax,0x0
}
  808e2f:	c9                   	leave  
  808e30:	c3                   	ret    

0000000000808e31 <read_disk>:
int read_disk(driver_args* args)
{
  808e31:	f3 0f 1e fa          	endbr64 
  808e35:	55                   	push   rbp
  808e36:	48 89 e5             	mov    rbp,rsp
  808e39:	48 83 ec 20          	sub    rsp,0x20
  808e3d:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=read_disk_asm(args->lba,args->sec_c,args->dist_addr);
  808e41:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808e45:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808e48:	48 98                	cdqe   
  808e4a:	48 89 c2             	mov    rdx,rax
  808e4d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808e51:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  808e54:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808e58:	8b 00                	mov    eax,DWORD PTR [rax]
  808e5a:	89 ce                	mov    esi,ecx
  808e5c:	89 c7                	mov    edi,eax
  808e5e:	e8 a9 05 00 00       	call   80940c <read_disk_asm>
  808e63:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  808e66:	48 8b 05 73 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22773]        # 42b5e0 <running_req>
  808e6d:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  808e74:	48 8b 05 65 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22765]        # 42b5e0 <running_req>
  808e7b:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  808e7f:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  808e86:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  808e89:	48 c7 05 4c 27 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2274c],0x0        # 42b5e0 <running_req>
  808e90:	00 00 00 00 
    return ret;
  808e94:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  808e97:	c9                   	leave  
  808e98:	c3                   	ret    

0000000000808e99 <write_disk>:
int write_disk(driver_args* args)
{
  808e99:	f3 0f 1e fa          	endbr64 
  808e9d:	55                   	push   rbp
  808e9e:	48 89 e5             	mov    rbp,rsp
  808ea1:	48 83 ec 20          	sub    rsp,0x20
  808ea5:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=write_disk_asm(args->lba,args->sec_c,args->src_addr);
  808ea9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808ead:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808eb0:	48 98                	cdqe   
  808eb2:	48 89 c2             	mov    rdx,rax
  808eb5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808eb9:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  808ebc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808ec0:	8b 00                	mov    eax,DWORD PTR [rax]
  808ec2:	89 ce                	mov    esi,ecx
  808ec4:	89 c7                	mov    edi,eax
  808ec6:	e8 c1 05 00 00       	call   80948c <write_disk_asm>
  808ecb:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  808ece:	48 8b 05 0b 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2270b]        # 42b5e0 <running_req>
  808ed5:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  808edc:	48 8b 05 fd 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc226fd]        # 42b5e0 <running_req>
  808ee3:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  808ee7:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  808eee:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  808ef1:	48 c7 05 e4 26 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc226e4],0x0        # 42b5e0 <running_req>
  808ef8:	00 00 00 00 
    return ret;
  808efc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  808eff:	c9                   	leave  
  808f00:	c3                   	ret    

0000000000808f01 <chk_result>:
int chk_result(int r)
{
  808f01:	f3 0f 1e fa          	endbr64 
  808f05:	55                   	push   rbp
  808f06:	48 89 e5             	mov    rbp,rsp
  808f09:	48 83 ec 10          	sub    rsp,0x10
  808f0d:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(disk_reqs[r].stat!=REQ_STAT_DONE);
  808f10:	90                   	nop
  808f11:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808f14:	48 63 d0             	movsxd rdx,eax
  808f17:	48 89 d0             	mov    rax,rdx
  808f1a:	48 01 c0             	add    rax,rax
  808f1d:	48 01 d0             	add    rax,rdx
  808f20:	48 c1 e0 04          	shl    rax,0x4
  808f24:	48 05 fc 88 42 00    	add    rax,0x4288fc
  808f2a:	8b 00                	mov    eax,DWORD PTR [rax]
  808f2c:	83 f8 03             	cmp    eax,0x3
  808f2f:	75 e0                	jne    808f11 <chk_result+0x10>
    if(disk_reqs[r].result==DISK_CHK_OK)
  808f31:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808f34:	48 63 d0             	movsxd rdx,eax
  808f37:	48 89 d0             	mov    rax,rdx
  808f3a:	48 01 c0             	add    rax,rax
  808f3d:	48 01 d0             	add    rax,rdx
  808f40:	48 c1 e0 04          	shl    rax,0x4
  808f44:	48 05 00 89 42 00    	add    rax,0x428900
  808f4a:	8b 00                	mov    eax,DWORD PTR [rax]
  808f4c:	83 f8 01             	cmp    eax,0x1
  808f4f:	75 07                	jne    808f58 <chk_result+0x57>
        return 1;
  808f51:	b8 01 00 00 00       	mov    eax,0x1
  808f56:	eb 14                	jmp    808f6c <chk_result+0x6b>
    comprintf("disk err\n");
  808f58:	bf 68 4a 81 00       	mov    edi,0x814a68
  808f5d:	b8 00 00 00 00       	mov    eax,0x0
  808f62:	e8 1b 2f 00 00       	call   80be82 <comprintf>
    return 0;
  808f67:	b8 00 00 00 00       	mov    eax,0x0
}
  808f6c:	c9                   	leave  
  808f6d:	c3                   	ret    

0000000000808f6e <disk_existent>:
int disk_existent(int disk)
{
  808f6e:	f3 0f 1e fa          	endbr64 
  808f72:	55                   	push   rbp
  808f73:	48 89 e5             	mov    rbp,rsp
  808f76:	48 83 ec 10          	sub    rsp,0x10
  808f7a:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    switch (disk)
  808f7d:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  808f81:	74 5f                	je     808fe2 <disk_existent+0x74>
  808f83:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  808f87:	7f 6e                	jg     808ff7 <disk_existent+0x89>
  808f89:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  808f8d:	74 3e                	je     808fcd <disk_existent+0x5f>
  808f8f:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  808f93:	7f 62                	jg     808ff7 <disk_existent+0x89>
  808f95:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  808f99:	74 08                	je     808fa3 <disk_existent+0x35>
  808f9b:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
  808f9f:	74 17                	je     808fb8 <disk_existent+0x4a>
        
    case DISK_SLAVE_SLAVE:
        return sys_find_dev("hd3")!=-1;
        break;
    default:
        break;
  808fa1:	eb 54                	jmp    808ff7 <disk_existent+0x89>
        return sys_find_dev("hd0")!=-1;
  808fa3:	bf 72 4a 81 00       	mov    edi,0x814a72
  808fa8:	e8 4c 9e ff ff       	call   802df9 <sys_find_dev>
  808fad:	83 f8 ff             	cmp    eax,0xffffffff
  808fb0:	0f 95 c0             	setne  al
  808fb3:	0f b6 c0             	movzx  eax,al
  808fb6:	eb 45                	jmp    808ffd <disk_existent+0x8f>
        return sys_find_dev("hd1")!=-1;
  808fb8:	bf 76 4a 81 00       	mov    edi,0x814a76
  808fbd:	e8 37 9e ff ff       	call   802df9 <sys_find_dev>
  808fc2:	83 f8 ff             	cmp    eax,0xffffffff
  808fc5:	0f 95 c0             	setne  al
  808fc8:	0f b6 c0             	movzx  eax,al
  808fcb:	eb 30                	jmp    808ffd <disk_existent+0x8f>
        return sys_find_dev("hd2")!=-1;
  808fcd:	bf 7a 4a 81 00       	mov    edi,0x814a7a
  808fd2:	e8 22 9e ff ff       	call   802df9 <sys_find_dev>
  808fd7:	83 f8 ff             	cmp    eax,0xffffffff
  808fda:	0f 95 c0             	setne  al
  808fdd:	0f b6 c0             	movzx  eax,al
  808fe0:	eb 1b                	jmp    808ffd <disk_existent+0x8f>
        return sys_find_dev("hd3")!=-1;
  808fe2:	bf 7e 4a 81 00       	mov    edi,0x814a7e
  808fe7:	e8 0d 9e ff ff       	call   802df9 <sys_find_dev>
  808fec:	83 f8 ff             	cmp    eax,0xffffffff
  808fef:	0f 95 c0             	setne  al
  808ff2:	0f b6 c0             	movzx  eax,al
  808ff5:	eb 06                	jmp    808ffd <disk_existent+0x8f>
        break;
  808ff7:	90                   	nop
    }
    return 0;
  808ff8:	b8 00 00 00 00       	mov    eax,0x0
}
  808ffd:	c9                   	leave  
  808ffe:	c3                   	ret    

0000000000808fff <hd_iterate>:
int hd_iterate()
{
  808fff:	f3 0f 1e fa          	endbr64 
  809003:	55                   	push   rbp
  809004:	48 89 e5             	mov    rbp,rsp
  809007:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
    char *name;
    
    int r[4];
    r[0]=request(DISK_MAJOR_MAJOR,DISKREQ_CHECK,0,1,0);
  80900e:	41 b8 00 00 00 00    	mov    r8d,0x0
  809014:	b9 01 00 00 00       	mov    ecx,0x1
  809019:	ba 00 00 00 00       	mov    edx,0x0
  80901e:	be 02 00 00 00       	mov    esi,0x2
  809023:	bf 00 00 00 00       	mov    edi,0x0
  809028:	e8 20 f8 ff ff       	call   80884d <request>
  80902d:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    r[1]=request(DISK_MAJOR_SLAVE,DISKREQ_CHECK,0,1,0);
  809030:	41 b8 00 00 00 00    	mov    r8d,0x0
  809036:	b9 01 00 00 00       	mov    ecx,0x1
  80903b:	ba 00 00 00 00       	mov    edx,0x0
  809040:	be 02 00 00 00       	mov    esi,0x2
  809045:	bf 01 00 00 00       	mov    edi,0x1
  80904a:	e8 fe f7 ff ff       	call   80884d <request>
  80904f:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    r[2]=request(DISK_SLAVE_MAJOR,DISKREQ_CHECK,0,1,0);
  809052:	41 b8 00 00 00 00    	mov    r8d,0x0
  809058:	b9 01 00 00 00       	mov    ecx,0x1
  80905d:	ba 00 00 00 00       	mov    edx,0x0
  809062:	be 02 00 00 00       	mov    esi,0x2
  809067:	bf 02 00 00 00       	mov    edi,0x2
  80906c:	e8 dc f7 ff ff       	call   80884d <request>
  809071:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    r[3]=request(DISK_SLAVE_SLAVE,DISKREQ_CHECK,0,1,0);
  809074:	41 b8 00 00 00 00    	mov    r8d,0x0
  80907a:	b9 01 00 00 00       	mov    ecx,0x1
  80907f:	ba 00 00 00 00       	mov    edx,0x0
  809084:	be 02 00 00 00       	mov    esi,0x2
  809089:	bf 03 00 00 00       	mov    edi,0x3
  80908e:	e8 ba f7 ff ff       	call   80884d <request>
  809093:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    for(int i=0;i<1;i++)
  809096:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80909d:	e9 72 01 00 00       	jmp    809214 <hd_iterate+0x215>
    {
        int disk;
        switch (i)
  8090a2:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8090a6:	74 3b                	je     8090e3 <hd_iterate+0xe4>
  8090a8:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8090ac:	7f 3e                	jg     8090ec <hd_iterate+0xed>
  8090ae:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  8090b2:	74 26                	je     8090da <hd_iterate+0xdb>
  8090b4:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  8090b8:	7f 32                	jg     8090ec <hd_iterate+0xed>
  8090ba:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8090be:	74 08                	je     8090c8 <hd_iterate+0xc9>
  8090c0:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  8090c4:	74 0b                	je     8090d1 <hd_iterate+0xd2>
  8090c6:	eb 24                	jmp    8090ec <hd_iterate+0xed>
        {
        case 0:disk=DISK_MAJOR_MAJOR;break;
  8090c8:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  8090cf:	eb 25                	jmp    8090f6 <hd_iterate+0xf7>
        case 1:disk=DISK_MAJOR_SLAVE;break;
  8090d1:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [rbp-0x10],0x1
  8090d8:	eb 1c                	jmp    8090f6 <hd_iterate+0xf7>
        case 2:disk=DISK_SLAVE_MAJOR;break;
  8090da:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [rbp-0x10],0x2
  8090e1:	eb 13                	jmp    8090f6 <hd_iterate+0xf7>
        case 3:disk=DISK_SLAVE_SLAVE;break;
  8090e3:	c7 45 f0 03 00 00 00 	mov    DWORD PTR [rbp-0x10],0x3
  8090ea:	eb 0a                	jmp    8090f6 <hd_iterate+0xf7>
        default:
            return -1;
  8090ec:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8090f1:	e9 28 01 00 00       	jmp    80921e <hd_iterate+0x21f>
            break;
        }
        if(chk_result(r[i]))//&&!disk_existent(disk)
  8090f6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8090f9:	48 98                	cdqe   
  8090fb:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  8090ff:	89 c7                	mov    edi,eax
  809101:	e8 fb fd ff ff       	call   808f01 <chk_result>
  809106:	85 c0                	test   eax,eax
  809108:	0f 84 81 00 00 00    	je     80918f <hd_iterate+0x190>
        {
            printf("disk %d checked.\n",i);
  80910e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809111:	89 c6                	mov    esi,eax
  809113:	bf 82 4a 81 00       	mov    edi,0x814a82
  809118:	b8 00 00 00 00       	mov    eax,0x0
  80911d:	e8 05 7c ff ff       	call   800d27 <printf>
            //新硬盘
            device hd={
  809122:	48 8d 95 20 ff ff ff 	lea    rdx,[rbp-0xe0]
  809129:	b8 00 00 00 00       	mov    eax,0x0
  80912e:	b9 15 00 00 00       	mov    ecx,0x15
  809133:	48 89 d7             	mov    rdi,rdx
  809136:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  809139:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80913c:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  809142:	c7 85 28 ff ff ff 01 	mov    DWORD PTR [rbp-0xd8],0x1
  809149:	00 00 00 
  80914c:	c7 85 2c ff ff ff 01 	mov    DWORD PTR [rbp-0xd4],0x1
  809153:	00 00 00 
                .type=DEV_TYPE_BLKDEV,
                .stype=DEV_STYPE_HD,
                .slave_dev=disk,
                .start_port=i<2?PORT_DISK_MAJOR:PORT_DISK_SLAVE
  809156:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  80915a:	7f 07                	jg     809163 <hd_iterate+0x164>
  80915c:	b8 f0 01 00 00       	mov    eax,0x1f0
  809161:	eb 05                	jmp    809168 <hd_iterate+0x169>
  809163:	b8 70 01 00 00       	mov    eax,0x170
            device hd={
  809168:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            };
            disks[i]=reg_device(&hd);
  80916e:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  809175:	48 89 c7             	mov    rdi,rax
  809178:	e8 44 98 ff ff       	call   8029c1 <reg_device>
  80917d:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  809180:	48 63 d2             	movsxd rdx,edx
  809183:	89 04 95 00 b6 42 00 	mov    DWORD PTR [rdx*4+0x42b600],eax
  80918a:	e9 81 00 00 00       	jmp    809210 <hd_iterate+0x211>
        }else if(!chk_result(r[i]))//&&disk_existent(disk)
  80918f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809192:	48 98                	cdqe   
  809194:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  809198:	89 c7                	mov    edi,eax
  80919a:	e8 62 fd ff ff       	call   808f01 <chk_result>
  80919f:	85 c0                	test   eax,eax
  8091a1:	75 6d                	jne    809210 <hd_iterate+0x211>
        {
            switch (i)
  8091a3:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8091a7:	74 3e                	je     8091e7 <hd_iterate+0x1e8>
  8091a9:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8091ad:	7f 41                	jg     8091f0 <hd_iterate+0x1f1>
  8091af:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  8091b3:	74 28                	je     8091dd <hd_iterate+0x1de>
  8091b5:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  8091b9:	7f 35                	jg     8091f0 <hd_iterate+0x1f1>
  8091bb:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8091bf:	74 08                	je     8091c9 <hd_iterate+0x1ca>
  8091c1:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  8091c5:	74 0c                	je     8091d3 <hd_iterate+0x1d4>
  8091c7:	eb 27                	jmp    8091f0 <hd_iterate+0x1f1>
            {
            case 0:name="hd0";break;
  8091c9:	48 c7 45 f8 72 4a 81 	mov    QWORD PTR [rbp-0x8],0x814a72
  8091d0:	00 
  8091d1:	eb 1d                	jmp    8091f0 <hd_iterate+0x1f1>
            case 1:name="hd1";break;
  8091d3:	48 c7 45 f8 76 4a 81 	mov    QWORD PTR [rbp-0x8],0x814a76
  8091da:	00 
  8091db:	eb 13                	jmp    8091f0 <hd_iterate+0x1f1>
            case 2:name="hd2";break;
  8091dd:	48 c7 45 f8 7a 4a 81 	mov    QWORD PTR [rbp-0x8],0x814a7a
  8091e4:	00 
  8091e5:	eb 09                	jmp    8091f0 <hd_iterate+0x1f1>
            case 3:name="hd3";break;
  8091e7:	48 c7 45 f8 7e 4a 81 	mov    QWORD PTR [rbp-0x8],0x814a7e
  8091ee:	00 
  8091ef:	90                   	nop
            }
            //有硬盘被卸载了
            int devi=sys_find_dev(name);
  8091f0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8091f4:	48 89 c7             	mov    rdi,rax
  8091f7:	e8 fd 9b ff ff       	call   802df9 <sys_find_dev>
  8091fc:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            dispose_device(get_dev(devi));
  8091ff:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809202:	89 c7                	mov    edi,eax
  809204:	e8 c4 a2 ff ff       	call   8034cd <get_dev>
  809209:	89 c7                	mov    edi,eax
  80920b:	e8 10 a2 ff ff       	call   803420 <dispose_device>
    for(int i=0;i<1;i++)
  809210:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  809214:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  809218:	0f 8e 84 fe ff ff    	jle    8090a2 <hd_iterate+0xa3>
        }

    }
}
  80921e:	c9                   	leave  
  80921f:	c3                   	ret    

0000000000809220 <async_check_disk>:

int async_check_disk(int disk)
{
  809220:	f3 0f 1e fa          	endbr64 
  809224:	55                   	push   rbp
  809225:	48 89 e5             	mov    rbp,rsp
  809228:	48 83 ec 20          	sub    rsp,0x20
  80922c:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    unsigned short disknr=PORT_DISK_MAJOR;
  80922f:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    unsigned short chkcmd=0xe0;
  809235:	66 c7 45 fc e0 00    	mov    WORD PTR [rbp-0x4],0xe0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  80923b:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  80923f:	74 06                	je     809247 <async_check_disk+0x27>
  809241:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  809245:	75 06                	jne    80924d <async_check_disk+0x2d>
        disknr=PORT_DISK_SLAVE;
  809247:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_MAJOR_SLAVE||disk==DISK_SLAVE_SLAVE)
  80924d:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  809251:	74 06                	je     809259 <async_check_disk+0x39>
  809253:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  809257:	75 06                	jne    80925f <async_check_disk+0x3f>
        chkcmd=0xf0;
  809259:	66 c7 45 fc f0 00    	mov    WORD PTR [rbp-0x4],0xf0
    outb(disknr+2,1);
  80925f:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809263:	83 c0 02             	add    eax,0x2
  809266:	0f b7 c0             	movzx  eax,ax
  809269:	be 01 00 00 00       	mov    esi,0x1
  80926e:	89 c7                	mov    edi,eax
  809270:	e8 fb cc ff ff       	call   805f70 <outb>
    outb(disknr+3,0);
  809275:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809279:	83 c0 03             	add    eax,0x3
  80927c:	0f b7 c0             	movzx  eax,ax
  80927f:	be 00 00 00 00       	mov    esi,0x0
  809284:	89 c7                	mov    edi,eax
  809286:	e8 e5 cc ff ff       	call   805f70 <outb>
    outb(disknr+4,0);
  80928b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80928f:	83 c0 04             	add    eax,0x4
  809292:	0f b7 c0             	movzx  eax,ax
  809295:	be 00 00 00 00       	mov    esi,0x0
  80929a:	89 c7                	mov    edi,eax
  80929c:	e8 cf cc ff ff       	call   805f70 <outb>
    outb(disknr+5,0);
  8092a1:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8092a5:	83 c0 05             	add    eax,0x5
  8092a8:	0f b7 c0             	movzx  eax,ax
  8092ab:	be 00 00 00 00       	mov    esi,0x0
  8092b0:	89 c7                	mov    edi,eax
  8092b2:	e8 b9 cc ff ff       	call   805f70 <outb>
    outb(disknr+6,chkcmd);//主硬盘
  8092b7:	0f b7 45 fc          	movzx  eax,WORD PTR [rbp-0x4]
  8092bb:	0f b6 d0             	movzx  edx,al
  8092be:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8092c2:	83 c0 06             	add    eax,0x6
  8092c5:	0f b7 c0             	movzx  eax,ax
  8092c8:	89 d6                	mov    esi,edx
  8092ca:	89 c7                	mov    edi,eax
  8092cc:	e8 9f cc ff ff       	call   805f70 <outb>
    outb(disknr+7,DISK_CMD_CHECK);
  8092d1:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8092d5:	83 c0 07             	add    eax,0x7
  8092d8:	0f b7 c0             	movzx  eax,ax
  8092db:	be 90 00 00 00       	mov    esi,0x90
  8092e0:	89 c7                	mov    edi,eax
  8092e2:	e8 89 cc ff ff       	call   805f70 <outb>
    //     // {
    //     //     printf("DISK ERR\n");
    //     //     return -1;
    //     // }
    // }
    return 0;
  8092e7:	b8 00 00 00 00       	mov    eax,0x0
}
  8092ec:	c9                   	leave  
  8092ed:	c3                   	ret    

00000000008092ee <hd_do_req>:

//接口函数：负责接收VFS的请求然后执行
int hd_do_req(driver_args *args)
{
  8092ee:	f3 0f 1e fa          	endbr64 
  8092f2:	55                   	push   rbp
  8092f3:	48 89 e5             	mov    rbp,rsp
  8092f6:	48 83 ec 18          	sub    rsp,0x18
  8092fa:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int diski=0;
  8092fe:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;disks[diski]!=args->dev;diski++);
  809305:	eb 04                	jmp    80930b <hd_do_req+0x1d>
  809307:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80930b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80930e:	48 98                	cdqe   
  809310:	8b 14 85 00 b6 42 00 	mov    edx,DWORD PTR [rax*4+0x42b600]
  809317:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80931b:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  809321:	39 c2                	cmp    edx,eax
  809323:	75 e2                	jne    809307 <hd_do_req+0x19>
    switch (args->cmd)
  809325:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809329:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  80932f:	83 f8 04             	cmp    eax,0x4
  809332:	74 72                	je     8093a6 <hd_do_req+0xb8>
  809334:	83 f8 04             	cmp    eax,0x4
  809337:	0f 8f 96 00 00 00    	jg     8093d3 <hd_do_req+0xe5>
  80933d:	83 f8 02             	cmp    eax,0x2
  809340:	74 0a                	je     80934c <hd_do_req+0x5e>
  809342:	83 f8 03             	cmp    eax,0x3
  809345:	74 32                	je     809379 <hd_do_req+0x8b>
  809347:	e9 87 00 00 00       	jmp    8093d3 <hd_do_req+0xe5>
    {
    case DRVF_READ:
        request(diski,DISKREQ_READ,args->lba,args->sec_c,args->dist_addr);
  80934c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809350:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  809353:	48 98                	cdqe   
  809355:	48 89 c6             	mov    rsi,rax
  809358:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80935c:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  80935f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809363:	8b 10                	mov    edx,DWORD PTR [rax]
  809365:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809368:	49 89 f0             	mov    r8,rsi
  80936b:	be 00 00 00 00       	mov    esi,0x0
  809370:	89 c7                	mov    edi,eax
  809372:	e8 d6 f4 ff ff       	call   80884d <request>
        break;
  809377:	eb 61                	jmp    8093da <hd_do_req+0xec>
    case DRVF_WRITE:
        request(diski,DISKREQ_WRITE,args->lba,args->sec_c,args->src_addr);
  809379:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80937d:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809380:	48 98                	cdqe   
  809382:	48 89 c6             	mov    rsi,rax
  809385:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809389:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  80938c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809390:	8b 10                	mov    edx,DWORD PTR [rax]
  809392:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809395:	49 89 f0             	mov    r8,rsi
  809398:	be 01 00 00 00       	mov    esi,0x1
  80939d:	89 c7                	mov    edi,eax
  80939f:	e8 a9 f4 ff ff       	call   80884d <request>
        break;
  8093a4:	eb 34                	jmp    8093da <hd_do_req+0xec>
    case DRVF_CHK:
        request(diski,DISKREQ_CHECK,args->lba,args->sec_c,args->dist_addr);
  8093a6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8093aa:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8093ad:	48 98                	cdqe   
  8093af:	48 89 c6             	mov    rsi,rax
  8093b2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8093b6:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  8093b9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8093bd:	8b 10                	mov    edx,DWORD PTR [rax]
  8093bf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8093c2:	49 89 f0             	mov    r8,rsi
  8093c5:	be 02 00 00 00       	mov    esi,0x2
  8093ca:	89 c7                	mov    edi,eax
  8093cc:	e8 7c f4 ff ff       	call   80884d <request>
        break;
  8093d1:	eb 07                	jmp    8093da <hd_do_req+0xec>
    default:return -1;
  8093d3:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8093d8:	eb 1e                	jmp    8093f8 <hd_do_req+0x10a>
    }
    args->stat=REQ_STAT_WORKING;
  8093da:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8093de:	c7 80 ac 00 00 00 02 	mov    DWORD PTR [rax+0xac],0x2
  8093e5:	00 00 00 
    running_devman_req=args;
  8093e8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8093ec:	48 89 05 f5 21 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc221f5],rax        # 42b5e8 <running_devman_req>
    return 0;
  8093f3:	b8 00 00 00 00       	mov    eax,0x0
  8093f8:	c9                   	leave  
  8093f9:	c3                   	ret    
  8093fa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000809400 <disk_int_handler>:
  809400:	e8 99 cb ff ff       	call   805f9e <eoi>
  809405:	e8 38 f2 ff ff       	call   808642 <disk_int_handler_c>
  80940a:	48 cf                	iretq  

000000000080940c <read_disk_asm>:
  80940c:	55                   	push   rbp
  80940d:	89 e5                	mov    ebp,esp
  80940f:	66 ba f7 01          	mov    dx,0x1f7
  809413:	31 c9                	xor    ecx,ecx
  809415:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  80941a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  80941f:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  809424:	89 c6                	mov    esi,eax
  809426:	66 ba f2 01          	mov    dx,0x1f2
  80942a:	88 c8                	mov    al,cl
  80942c:	ee                   	out    dx,al
  80942d:	66 ba f3 01          	mov    dx,0x1f3
  809431:	89 f0                	mov    eax,esi
  809433:	ee                   	out    dx,al
  809434:	66 ff c2             	inc    dx
  809437:	c1 e8 08             	shr    eax,0x8
  80943a:	ee                   	out    dx,al
  80943b:	66 ff c2             	inc    dx
  80943e:	c1 e8 08             	shr    eax,0x8
  809441:	ee                   	out    dx,al
  809442:	66 ff c2             	inc    dx
  809445:	66 c1 e8 08          	shr    ax,0x8
  809449:	24 0f                	and    al,0xf
  80944b:	0c e0                	or     al,0xe0
  80944d:	ee                   	out    dx,al
  80944e:	66 ff c2             	inc    dx
  809451:	b0 20                	mov    al,0x20
  809453:	ee                   	out    dx,al

0000000000809454 <read_disk_asm.wait>:
  809454:	90                   	nop
  809455:	ec                   	in     al,dx
  809456:	24 88                	and    al,0x88
  809458:	3c 08                	cmp    al,0x8
  80945a:	75 f8                	jne    809454 <read_disk_asm.wait>
  80945c:	66 89 d7             	mov    di,dx
  80945f:	89 c8                	mov    eax,ecx
  809461:	66 b9 00 01          	mov    cx,0x100
  809465:	66 f7 e1             	mul    cx
  809468:	89 c1                	mov    ecx,eax
  80946a:	66 ba f0 01          	mov    dx,0x1f0

000000000080946e <read_disk_asm.read>:
  80946e:	66 ed                	in     ax,dx
  809470:	66 67 89 03          	mov    WORD PTR [ebx],ax
  809474:	83 c3 02             	add    ebx,0x2
  809477:	e2 f5                	loop   80946e <read_disk_asm.read>
  809479:	c9                   	leave  
  80947a:	b8 00 00 00 00       	mov    eax,0x0
  80947f:	c3                   	ret    

0000000000809480 <read_disk_asm.err_disk_reading>:
  809480:	66 ba f1 01          	mov    dx,0x1f1
  809484:	31 c0                	xor    eax,eax
  809486:	66 ed                	in     ax,dx
  809488:	89 ec                	mov    esp,ebp
  80948a:	5d                   	pop    rbp
  80948b:	c3                   	ret    

000000000080948c <write_disk_asm>:
  80948c:	55                   	push   rbp
  80948d:	89 e5                	mov    ebp,esp
  80948f:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  809494:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  809499:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  80949e:	50                   	push   rax
  80949f:	66 ba f2 01          	mov    dx,0x1f2
  8094a3:	88 c8                	mov    al,cl
  8094a5:	ee                   	out    dx,al
  8094a6:	58                   	pop    rax
  8094a7:	66 ba f3 01          	mov    dx,0x1f3
  8094ab:	ee                   	out    dx,al
  8094ac:	c1 e8 08             	shr    eax,0x8
  8094af:	66 ba f4 01          	mov    dx,0x1f4
  8094b3:	ee                   	out    dx,al
  8094b4:	c1 e8 08             	shr    eax,0x8
  8094b7:	66 ba f5 01          	mov    dx,0x1f5
  8094bb:	ee                   	out    dx,al
  8094bc:	c1 e8 08             	shr    eax,0x8
  8094bf:	24 0f                	and    al,0xf
  8094c1:	0c e0                	or     al,0xe0
  8094c3:	66 ba f6 01          	mov    dx,0x1f6
  8094c7:	ee                   	out    dx,al
  8094c8:	66 ba f7 01          	mov    dx,0x1f7
  8094cc:	b0 30                	mov    al,0x30
  8094ce:	ee                   	out    dx,al

00000000008094cf <write_disk_asm.not_ready2>:
  8094cf:	90                   	nop
  8094d0:	ec                   	in     al,dx
  8094d1:	24 88                	and    al,0x88
  8094d3:	3c 08                	cmp    al,0x8
  8094d5:	75 f8                	jne    8094cf <write_disk_asm.not_ready2>
  8094d7:	89 c8                	mov    eax,ecx
  8094d9:	66 b9 00 01          	mov    cx,0x100
  8094dd:	66 f7 e1             	mul    cx
  8094e0:	89 c1                	mov    ecx,eax
  8094e2:	66 ba f0 01          	mov    dx,0x1f0

00000000008094e6 <write_disk_asm.go_on_write>:
  8094e6:	66 67 8b 03          	mov    ax,WORD PTR [ebx]
  8094ea:	66 ef                	out    dx,ax
  8094ec:	83 c3 02             	add    ebx,0x2
  8094ef:	e2 f5                	loop   8094e6 <write_disk_asm.go_on_write>
  8094f1:	89 ec                	mov    esp,ebp
  8094f3:	5d                   	pop    rbp
  8094f4:	c3                   	ret    

00000000008094f5 <DISK1_FAT32_read_FAT_Entry>:
#include "mem.h"
#include "memory.h"
#include "proc.h"

unsigned int DISK1_FAT32_read_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry)
{
  8094f5:	f3 0f 1e fa          	endbr64 
  8094f9:	55                   	push   rbp
  8094fa:	48 89 e5             	mov    rbp,rsp
  8094fd:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  809504:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  80950b:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
	unsigned int buf[128];
	memset(buf,0,512);
  809511:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  809518:	ba 00 02 00 00       	mov    edx,0x200
  80951d:	be 00 00 00 00       	mov    esi,0x0
  809522:	48 89 c7             	mov    rdi,rax
  809525:	e8 7a 2a 00 00       	call   80bfa4 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  80952a:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  809531:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809535:	89 c2                	mov    edx,eax
  809537:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80953d:	c1 e8 07             	shr    eax,0x7
  809540:	01 d0                	add    eax,edx
  809542:	89 c2                	mov    edx,eax
  809544:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80954b:	49 89 c0             	mov    r8,rax
  80954e:	b9 01 00 00 00       	mov    ecx,0x1
  809553:	be 00 00 00 00       	mov    esi,0x0
  809558:	bf 00 00 00 00       	mov    edi,0x0
  80955d:	e8 eb f2 ff ff       	call   80884d <request>
  809562:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    chk_result(r);
  809565:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809568:	89 c7                	mov    edi,eax
  80956a:	e8 92 f9 ff ff       	call   808f01 <chk_result>
    printf("DISK1_FAT32_read_FAT_Entry fat_entry:%x,%#010x\n",fat_entry,buf[fat_entry & 0x7f]);
  80956f:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  809575:	83 e0 7f             	and    eax,0x7f
  809578:	89 c0                	mov    eax,eax
  80957a:	8b 94 85 f0 fd ff ff 	mov    edx,DWORD PTR [rbp+rax*4-0x210]
  809581:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  809587:	89 c6                	mov    esi,eax
  809589:	bf 98 4a 81 00       	mov    edi,0x814a98
  80958e:	b8 00 00 00 00       	mov    eax,0x0
  809593:	e8 8f 77 ff ff       	call   800d27 <printf>
	return buf[fat_entry & 0x7f] & 0x0fffffff;
  809598:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80959e:	83 e0 7f             	and    eax,0x7f
  8095a1:	89 c0                	mov    eax,eax
  8095a3:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  8095aa:	25 ff ff ff 0f       	and    eax,0xfffffff
}
  8095af:	c9                   	leave  
  8095b0:	c3                   	ret    

00000000008095b1 <DISK1_FAT32_write_FAT_Entry>:


unsigned long DISK1_FAT32_write_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry,unsigned int value)
{
  8095b1:	f3 0f 1e fa          	endbr64 
  8095b5:	55                   	push   rbp
  8095b6:	48 89 e5             	mov    rbp,rsp
  8095b9:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  8095c0:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  8095c7:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
  8095cd:	89 95 e0 fd ff ff    	mov    DWORD PTR [rbp-0x220],edx
	unsigned int buf[128];
	int i;

	memset(buf,0,512);
  8095d3:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  8095da:	ba 00 02 00 00       	mov    edx,0x200
  8095df:	be 00 00 00 00       	mov    esi,0x0
  8095e4:	48 89 c7             	mov    rdi,rax
  8095e7:	e8 b8 29 00 00       	call   80bfa4 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  8095ec:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  8095f3:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8095f7:	89 c2                	mov    edx,eax
  8095f9:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  8095ff:	c1 e8 07             	shr    eax,0x7
  809602:	01 d0                	add    eax,edx
  809604:	89 c2                	mov    edx,eax
  809606:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80960d:	49 89 c0             	mov    r8,rax
  809610:	b9 01 00 00 00       	mov    ecx,0x1
  809615:	be 00 00 00 00       	mov    esi,0x0
  80961a:	bf 00 00 00 00       	mov    edi,0x0
  80961f:	e8 29 f2 ff ff       	call   80884d <request>
  809624:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    chk_result(r);
  809627:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80962a:	89 c7                	mov    edi,eax
  80962c:	e8 d0 f8 ff ff       	call   808f01 <chk_result>
    buf[fat_entry & 0x7f] = (buf[fat_entry & 0x7f] & 0xf0000000) | (value & 0x0fffffff);
  809631:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  809637:	83 e0 7f             	and    eax,0x7f
  80963a:	89 c0                	mov    eax,eax
  80963c:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  809643:	25 00 00 00 f0       	and    eax,0xf0000000
  809648:	89 c6                	mov    esi,eax
  80964a:	8b 85 e0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x220]
  809650:	25 ff ff ff 0f       	and    eax,0xfffffff
  809655:	89 c1                	mov    ecx,eax
  809657:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80965d:	83 e0 7f             	and    eax,0x7f
  809660:	89 c2                	mov    edx,eax
  809662:	89 f0                	mov    eax,esi
  809664:	09 c8                	or     eax,ecx
  809666:	89 d2                	mov    edx,edx
  809668:	89 84 95 f0 fd ff ff 	mov    DWORD PTR [rbp+rdx*4-0x210],eax

	for(i = 0;i < fsbi->NumFATs;i++){
  80966f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  809676:	eb 61                	jmp    8096d9 <DISK1_FAT32_write_FAT_Entry+0x128>
        int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,fsbi->FAT1_firstsector + fsbi->sector_per_FAT * i + (fat_entry >> 7),1,(unsigned char *)buf);
  809678:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  80967f:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809683:	89 c1                	mov    ecx,eax
  809685:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  80968c:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  809690:	89 c2                	mov    edx,eax
  809692:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809695:	48 98                	cdqe   
  809697:	0f af c2             	imul   eax,edx
  80969a:	8d 14 01             	lea    edx,[rcx+rax*1]
  80969d:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  8096a3:	c1 e8 07             	shr    eax,0x7
  8096a6:	01 d0                	add    eax,edx
  8096a8:	89 c2                	mov    edx,eax
  8096aa:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  8096b1:	49 89 c0             	mov    r8,rax
  8096b4:	b9 01 00 00 00       	mov    ecx,0x1
  8096b9:	be 01 00 00 00       	mov    esi,0x1
  8096be:	bf 00 00 00 00       	mov    edi,0x0
  8096c3:	e8 85 f1 ff ff       	call   80884d <request>
  8096c8:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        chk_result(r1);
  8096cb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8096ce:	89 c7                	mov    edi,eax
  8096d0:	e8 2c f8 ff ff       	call   808f01 <chk_result>
	for(i = 0;i < fsbi->NumFATs;i++){
  8096d5:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8096d9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8096dc:	48 63 d0             	movsxd rdx,eax
  8096df:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  8096e6:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8096ea:	48 39 c2             	cmp    rdx,rax
  8096ed:	72 89                	jb     809678 <DISK1_FAT32_write_FAT_Entry+0xc7>
    }
	return 1;
  8096ef:	b8 01 00 00 00       	mov    eax,0x1
}
  8096f4:	c9                   	leave  
  8096f5:	c3                   	ret    

00000000008096f6 <FAT32_open>:


long FAT32_open(struct index_node * inode,struct file * filp)
{
  8096f6:	f3 0f 1e fa          	endbr64 
  8096fa:	55                   	push   rbp
  8096fb:	48 89 e5             	mov    rbp,rsp
  8096fe:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809702:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  809706:	b8 01 00 00 00       	mov    eax,0x1
}
  80970b:	5d                   	pop    rbp
  80970c:	c3                   	ret    

000000000080970d <FAT32_close>:


long FAT32_close(struct index_node * inode,struct file * filp)
{
  80970d:	f3 0f 1e fa          	endbr64 
  809711:	55                   	push   rbp
  809712:	48 89 e5             	mov    rbp,rsp
  809715:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809719:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  80971d:	b8 01 00 00 00       	mov    eax,0x1
}
  809722:	5d                   	pop    rbp
  809723:	c3                   	ret    

0000000000809724 <FAT32_read>:


long FAT32_read(struct file * filp,char * buf,unsigned long count,long * position)
{
  809724:	f3 0f 1e fa          	endbr64 
  809728:	55                   	push   rbp
  809729:	48 89 e5             	mov    rbp,rsp
  80972c:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  809730:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  809734:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  809738:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
  80973c:	48 89 4d 80          	mov    QWORD PTR [rbp-0x80],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  809740:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809744:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809748:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80974c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809750:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  809754:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809758:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80975c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809760:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809764:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809768:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

	unsigned long cluster = finode->first_cluster;
  80976c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809770:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809773:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long sector = 0;
  809777:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  80977e:	00 
	int i,length = 0;
  80977f:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
	long retval = 0;
  809786:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80978d:	00 
	int index = *position / fsbi->bytes_per_cluster;
  80978e:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  809792:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809795:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  809799:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  80979d:	48 99                	cqo    
  80979f:	48 f7 fe             	idiv   rsi
  8097a2:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  8097a5:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8097a9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8097ac:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  8097b0:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  8097b4:	48 99                	cqo    
  8097b6:	48 f7 f9             	idiv   rcx
  8097b9:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  8097bd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8097c1:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8097c5:	be 00 00 00 00       	mov    esi,0x0
  8097ca:	48 89 c7             	mov    rdi,rax
  8097cd:	b8 00 00 00 00       	mov    eax,0x0
  8097d2:	e8 26 7a ff ff       	call   8011fd <vmalloc>
  8097d7:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax

	if(!cluster)
  8097db:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8097e0:	75 0c                	jne    8097ee <FAT32_read+0xca>
		return -EFAULT;
  8097e2:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  8097e9:	e9 f0 01 00 00       	jmp    8099de <FAT32_read+0x2ba>
	for(i = 0;i < index;i++)
  8097ee:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8097f5:	eb 1e                	jmp    809815 <FAT32_read+0xf1>
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  8097f7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8097fb:	89 c2                	mov    edx,eax
  8097fd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809801:	89 d6                	mov    esi,edx
  809803:	48 89 c7             	mov    rdi,rax
  809806:	e8 ea fc ff ff       	call   8094f5 <DISK1_FAT32_read_FAT_Entry>
  80980b:	89 c0                	mov    eax,eax
  80980d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	for(i = 0;i < index;i++)
  809811:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  809815:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809818:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80981b:	7c da                	jl     8097f7 <FAT32_read+0xd3>

	if(*position + count > filp->dentry->dir_inode->file_size)
  80981d:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  809821:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809824:	48 89 c2             	mov    rdx,rax
  809827:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80982b:	48 01 c2             	add    rdx,rax
  80982e:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809832:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809836:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80983a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80983d:	48 39 c2             	cmp    rdx,rax
  809840:	76 2c                	jbe    80986e <FAT32_read+0x14a>
		index = count = filp->dentry->dir_inode->file_size - *position;
  809842:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809846:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80984a:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80984e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809851:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  809855:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809858:	48 89 c1             	mov    rcx,rax
  80985b:	48 89 d0             	mov    rax,rdx
  80985e:	48 29 c8             	sub    rax,rcx
  809861:	48 89 45 88          	mov    QWORD PTR [rbp-0x78],rax
  809865:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809869:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
  80986c:	eb 07                	jmp    809875 <FAT32_read+0x151>
	else
		index = count;
  80986e:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809872:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax

//	printf("FAT32_read first_cluster:%d,size:%d,preempt_count:%d\n",finode->first_cluster,filp->dentry->dir_inode->file_size,current->preempt_count);

	do
	{
		memset(buffer,0,fsbi->bytes_per_cluster);
  809875:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809879:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80987d:	89 c2                	mov    edx,eax
  80987f:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  809883:	be 00 00 00 00       	mov    esi,0x0
  809888:	48 89 c7             	mov    rdi,rax
  80988b:	e8 14 27 00 00       	call   80bfa4 <memset>
		sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  809890:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809894:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  809898:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80989c:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  8098a0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8098a4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8098a8:	48 0f af c2          	imul   rax,rdx
  8098ac:	48 01 c8             	add    rax,rcx
  8098af:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  8098b3:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8098b7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8098bb:	89 c1                	mov    ecx,eax
  8098bd:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8098c1:	89 c2                	mov    edx,eax
  8098c3:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8098c7:	49 89 c0             	mov    r8,rax
  8098ca:	be 00 00 00 00       	mov    esi,0x0
  8098cf:	bf 00 00 00 00       	mov    edi,0x0
  8098d4:	e8 74 ef ff ff       	call   80884d <request>
  8098d9:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
		if(!chk_result(r))
  8098dc:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8098df:	89 c7                	mov    edi,eax
  8098e1:	e8 1b f6 ff ff       	call   808f01 <chk_result>
  8098e6:	85 c0                	test   eax,eax
  8098e8:	75 1c                	jne    809906 <FAT32_read+0x1e2>
		{
			printf("FAT32 FS(read) read disk ERROR!!!!!!!!!!\n");
  8098ea:	bf c8 4a 81 00       	mov    edi,0x814ac8
  8098ef:	b8 00 00 00 00       	mov    eax,0x0
  8098f4:	e8 2e 74 ff ff       	call   800d27 <printf>
			retval = -EIO;
  8098f9:	48 c7 45 e8 e3 ff ff 	mov    QWORD PTR [rbp-0x18],0xffffffffffffffe3
  809900:	ff 
			break;
  809901:	e9 ba 00 00 00       	jmp    8099c0 <FAT32_read+0x29c>
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  809906:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  809909:	48 63 d0             	movsxd rdx,eax
  80990c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809910:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809914:	48 2b 45 d8          	sub    rax,QWORD PTR [rbp-0x28]
  809918:	48 39 c2             	cmp    rdx,rax
  80991b:	48 0f 4e c2          	cmovle rax,rdx
  80991f:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax

		if((unsigned long)buf < MAX_TASKS)
  809922:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  809926:	48 83 f8 1f          	cmp    rax,0x1f
  80992a:	77 1f                	ja     80994b <FAT32_read+0x227>
			memcpy(buffer + offset,buf,length);
  80992c:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  80992f:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  809933:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  809937:	48 01 c1             	add    rcx,rax
  80993a:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80993e:	48 89 c6             	mov    rsi,rax
  809941:	48 89 cf             	mov    rdi,rcx
  809944:	e8 ac 25 00 00       	call   80bef5 <memcpy>
  809949:	eb 1d                	jmp    809968 <FAT32_read+0x244>
		else
			memcpy(buffer + offset,buf,length);
  80994b:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  80994e:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  809952:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  809956:	48 01 c1             	add    rcx,rax
  809959:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80995d:	48 89 c6             	mov    rsi,rax
  809960:	48 89 cf             	mov    rdi,rcx
  809963:	e8 8d 25 00 00       	call   80bef5 <memcpy>

		index -= length;
  809968:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  80996b:	29 45 e4             	sub    DWORD PTR [rbp-0x1c],eax
		buf += length;
  80996e:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  809971:	48 98                	cdqe   
  809973:	48 01 45 90          	add    QWORD PTR [rbp-0x70],rax
		offset -= offset;
  809977:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  80997e:	00 
		*position += length;
  80997f:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  809983:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809986:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  809989:	48 98                	cdqe   
  80998b:	48 01 c2             	add    rdx,rax
  80998e:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  809992:	48 89 10             	mov    QWORD PTR [rax],rdx
	}while(index && (cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster)));
  809995:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  809999:	74 25                	je     8099c0 <FAT32_read+0x29c>
  80999b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80999f:	89 c2                	mov    edx,eax
  8099a1:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8099a5:	89 d6                	mov    esi,edx
  8099a7:	48 89 c7             	mov    rdi,rax
  8099aa:	e8 46 fb ff ff       	call   8094f5 <DISK1_FAT32_read_FAT_Entry>
  8099af:	89 c0                	mov    eax,eax
  8099b1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  8099b5:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8099ba:	0f 85 b5 fe ff ff    	jne    809875 <FAT32_read+0x151>

	vmfree(buffer);
  8099c0:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8099c4:	48 89 c7             	mov    rdi,rax
  8099c7:	e8 c0 78 ff ff       	call   80128c <vmfree>
	if(!index)
  8099cc:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  8099d0:	75 08                	jne    8099da <FAT32_read+0x2b6>
		retval = count;
  8099d2:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8099d6:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	return retval;
  8099da:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
}
  8099de:	c9                   	leave  
  8099df:	c3                   	ret    

00000000008099e0 <FAT32_find_available_cluster>:


unsigned long FAT32_find_available_cluster(struct FAT32_sb_info * fsbi)
{
  8099e0:	f3 0f 1e fa          	endbr64 
  8099e4:	55                   	push   rbp
  8099e5:	48 89 e5             	mov    rbp,rsp
  8099e8:	48 81 ec 30 02 00 00 	sub    rsp,0x230
  8099ef:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
	int i,j;
	int fat_entry;
	unsigned long sector_per_fat = fsbi->sector_per_FAT;
  8099f6:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  8099fd:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  809a01:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	unsigned int buf[128];

//	fsbi->fat_fsinfo->FSI_Free_Count & fsbi->fat_fsinfo->FSI_Nxt_Free not exactly,so unuse

	for(i = 0;i < sector_per_fat;i++)
  809a05:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  809a0c:	e9 8b 00 00 00       	jmp    809a9c <FAT32_find_available_cluster+0xbc>
	{
		memset(buf,0,512);
  809a11:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  809a18:	ba 00 02 00 00       	mov    edx,0x200
  809a1d:	be 00 00 00 00       	mov    esi,0x0
  809a22:	48 89 c7             	mov    rdi,rax
  809a25:	e8 7a 25 00 00       	call   80bfa4 <memset>
		int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + i,1,(unsigned char *)buf);
  809a2a:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  809a31:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809a35:	89 c2                	mov    edx,eax
  809a37:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809a3a:	01 d0                	add    eax,edx
  809a3c:	89 c2                	mov    edx,eax
  809a3e:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  809a45:	49 89 c0             	mov    r8,rax
  809a48:	b9 01 00 00 00       	mov    ecx,0x1
  809a4d:	be 00 00 00 00       	mov    esi,0x0
  809a52:	bf 00 00 00 00       	mov    edi,0x0
  809a57:	e8 f1 ed ff ff       	call   80884d <request>
  809a5c:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

		for(j = 0;j < 128;j++)
  809a5f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  809a66:	eb 2a                	jmp    809a92 <FAT32_find_available_cluster+0xb2>
		{
			if((buf[j] & 0x0fffffff) == 0)
  809a68:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  809a6b:	48 98                	cdqe   
  809a6d:	8b 84 85 e0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x220]
  809a74:	25 ff ff ff 0f       	and    eax,0xfffffff
  809a79:	85 c0                	test   eax,eax
  809a7b:	75 11                	jne    809a8e <FAT32_find_available_cluster+0xae>
				return (i << 7) + j;
  809a7d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809a80:	c1 e0 07             	shl    eax,0x7
  809a83:	89 c2                	mov    edx,eax
  809a85:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  809a88:	01 d0                	add    eax,edx
  809a8a:	48 98                	cdqe   
  809a8c:	eb 22                	jmp    809ab0 <FAT32_find_available_cluster+0xd0>
		for(j = 0;j < 128;j++)
  809a8e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  809a92:	83 7d f8 7f          	cmp    DWORD PTR [rbp-0x8],0x7f
  809a96:	7e d0                	jle    809a68 <FAT32_find_available_cluster+0x88>
	for(i = 0;i < sector_per_fat;i++)
  809a98:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809a9c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809a9f:	48 98                	cdqe   
  809aa1:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  809aa5:	0f 87 66 ff ff ff    	ja     809a11 <FAT32_find_available_cluster+0x31>
		}
	}
	return 0;
  809aab:	b8 00 00 00 00       	mov    eax,0x0
}
  809ab0:	c9                   	leave  
  809ab1:	c3                   	ret    

0000000000809ab2 <FAT32_write>:


long FAT32_write(struct file * filp,char * buf,unsigned long count,long * position)
{
  809ab2:	f3 0f 1e fa          	endbr64 
  809ab6:	55                   	push   rbp
  809ab7:	48 89 e5             	mov    rbp,rsp
  809aba:	48 81 ec 90 00 00 00 	sub    rsp,0x90
  809ac1:	48 89 7d 88          	mov    QWORD PTR [rbp-0x78],rdi
  809ac5:	48 89 75 80          	mov    QWORD PTR [rbp-0x80],rsi
  809ac9:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  809ad0:	48 89 8d 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  809ad7:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809adb:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809adf:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809ae3:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809ae7:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  809aeb:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809aef:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809af3:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809af7:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809afb:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809aff:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned long cluster = finode->first_cluster;
  809b03:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809b07:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809b0a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long next_cluster = 0;
  809b0e:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  809b15:	00 
	unsigned long sector = 0;
  809b16:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  809b1d:	00 
	int i,length = 0;
  809b1e:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
	long retval = 0;
  809b25:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  809b2c:	00 
	long flags = 0;
  809b2d:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  809b34:	00 
	int index = *position / fsbi->bytes_per_cluster;
  809b35:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  809b3c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809b3f:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  809b43:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  809b47:	48 99                	cqo    
  809b49:	48 f7 fe             	idiv   rsi
  809b4c:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  809b4f:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  809b56:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809b59:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  809b5d:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  809b61:	48 99                	cqo    
  809b63:	48 f7 f9             	idiv   rcx
  809b66:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  809b6a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809b6e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809b72:	be 00 00 00 00       	mov    esi,0x0
  809b77:	48 89 c7             	mov    rdi,rax
  809b7a:	b8 00 00 00 00       	mov    eax,0x0
  809b7f:	e8 79 76 ff ff       	call   8011fd <vmalloc>
  809b84:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax

	if(!cluster)
  809b88:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  809b8d:	75 1a                	jne    809ba9 <FAT32_write+0xf7>
	{
		cluster = FAT32_find_available_cluster(fsbi);
  809b8f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809b93:	48 89 c7             	mov    rdi,rax
  809b96:	e8 45 fe ff ff       	call   8099e0 <FAT32_find_available_cluster>
  809b9b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		flags = 1;
  809b9f:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  809ba6:	00 
  809ba7:	eb 2f                	jmp    809bd8 <FAT32_write+0x126>
	}
	else
		for(i = 0;i < index;i++)
  809ba9:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  809bb0:	eb 1e                	jmp    809bd0 <FAT32_write+0x11e>
			cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  809bb2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809bb6:	89 c2                	mov    edx,eax
  809bb8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809bbc:	89 d6                	mov    esi,edx
  809bbe:	48 89 c7             	mov    rdi,rax
  809bc1:	e8 2f f9 ff ff       	call   8094f5 <DISK1_FAT32_read_FAT_Entry>
  809bc6:	89 c0                	mov    eax,eax
  809bc8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		for(i = 0;i < index;i++)
  809bcc:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  809bd0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809bd3:	3b 45 d4             	cmp    eax,DWORD PTR [rbp-0x2c]
  809bd6:	7c da                	jl     809bb2 <FAT32_write+0x100>

	if(!cluster)
  809bd8:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  809bdd:	75 18                	jne    809bf7 <FAT32_write+0x145>
	{
		vmfree(buffer);
  809bdf:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809be3:	48 89 c7             	mov    rdi,rax
  809be6:	e8 a1 76 ff ff       	call   80128c <vmfree>
		return -ENOSPC;
  809beb:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  809bf2:	e9 13 03 00 00       	jmp    809f0a <FAT32_write+0x458>
	}

	if(flags)
  809bf7:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  809bfc:	74 4d                	je     809c4b <FAT32_write+0x199>
	{
		finode->first_cluster = cluster;
  809bfe:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809c02:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  809c06:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  809c09:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809c0d:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809c11:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809c15:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809c19:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  809c1d:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  809c21:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809c25:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809c29:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809c2d:	48 89 c7             	mov    rdi,rax
  809c30:	ff d2                	call   rdx
		DISK1_FAT32_write_FAT_Entry(fsbi,cluster,0x0ffffff8);
  809c32:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809c36:	89 c1                	mov    ecx,eax
  809c38:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809c3c:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  809c41:	89 ce                	mov    esi,ecx
  809c43:	48 89 c7             	mov    rdi,rax
  809c46:	e8 66 f9 ff ff       	call   8095b1 <DISK1_FAT32_write_FAT_Entry>
	}

	index = count;
  809c4b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  809c52:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax

	do
	{
		if(!flags)
  809c55:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  809c5a:	0f 85 91 00 00 00    	jne    809cf1 <FAT32_write+0x23f>
		{
			memset(buffer,0,fsbi->bytes_per_cluster);
  809c60:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809c64:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809c68:	89 c2                	mov    edx,eax
  809c6a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809c6e:	be 00 00 00 00       	mov    esi,0x0
  809c73:	48 89 c7             	mov    rdi,rax
  809c76:	e8 29 23 00 00       	call   80bfa4 <memset>
			sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  809c7b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809c7f:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  809c83:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809c87:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  809c8b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809c8f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809c93:	48 0f af c2          	imul   rax,rdx
  809c97:	48 01 c8             	add    rax,rcx
  809c9a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  809c9e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809ca2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809ca6:	89 c1                	mov    ecx,eax
  809ca8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809cac:	89 c2                	mov    edx,eax
  809cae:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809cb2:	49 89 c0             	mov    r8,rax
  809cb5:	be 00 00 00 00       	mov    esi,0x0
  809cba:	bf 00 00 00 00       	mov    edi,0x0
  809cbf:	e8 89 eb ff ff       	call   80884d <request>
  809cc4:	89 45 9c             	mov    DWORD PTR [rbp-0x64],eax

			if(!chk_result(r))
  809cc7:	8b 45 9c             	mov    eax,DWORD PTR [rbp-0x64]
  809cca:	89 c7                	mov    edi,eax
  809ccc:	e8 30 f2 ff ff       	call   808f01 <chk_result>
  809cd1:	85 c0                	test   eax,eax
  809cd3:	75 1c                	jne    809cf1 <FAT32_write+0x23f>
			{
				printf("FAT32 FS(write) read disk ERROR!!!!!!!!!!\n");
  809cd5:	bf f8 4a 81 00       	mov    edi,0x814af8
  809cda:	b8 00 00 00 00       	mov    eax,0x0
  809cdf:	e8 43 70 ff ff       	call   800d27 <printf>
				retval = -EIO;
  809ce4:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  809ceb:	ff 
				break;
  809cec:	e9 95 01 00 00       	jmp    809e86 <FAT32_write+0x3d4>
			}
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  809cf1:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  809cf4:	48 63 d0             	movsxd rdx,eax
  809cf7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809cfb:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809cff:	48 2b 45 c8          	sub    rax,QWORD PTR [rbp-0x38]
  809d03:	48 39 c2             	cmp    rdx,rax
  809d06:	48 0f 4e c2          	cmovle rax,rdx
  809d0a:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax

		if((unsigned long)buf < MAX_TASKS)
  809d0d:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  809d11:	48 83 f8 1f          	cmp    rax,0x1f
  809d15:	77 1f                	ja     809d36 <FAT32_write+0x284>
			memcpy(buf,buffer + offset,length);
  809d17:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  809d1a:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  809d1e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809d22:	48 01 c1             	add    rcx,rax
  809d25:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  809d29:	48 89 ce             	mov    rsi,rcx
  809d2c:	48 89 c7             	mov    rdi,rax
  809d2f:	e8 c1 21 00 00       	call   80bef5 <memcpy>
  809d34:	eb 1d                	jmp    809d53 <FAT32_write+0x2a1>
		else
			memcpy(buf,buffer + offset,length);
  809d36:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  809d39:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  809d3d:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809d41:	48 01 c1             	add    rcx,rax
  809d44:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  809d48:	48 89 ce             	mov    rsi,rcx
  809d4b:	48 89 c7             	mov    rdi,rax
  809d4e:	e8 a2 21 00 00       	call   80bef5 <memcpy>

		int r=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  809d53:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809d57:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809d5b:	89 c1                	mov    ecx,eax
  809d5d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809d61:	89 c2                	mov    edx,eax
  809d63:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809d67:	49 89 c0             	mov    r8,rax
  809d6a:	be 01 00 00 00       	mov    esi,0x1
  809d6f:	bf 00 00 00 00       	mov    edi,0x0
  809d74:	e8 d4 ea ff ff       	call   80884d <request>
  809d79:	89 45 98             	mov    DWORD PTR [rbp-0x68],eax
        if(!chk_result(r))
  809d7c:	8b 45 98             	mov    eax,DWORD PTR [rbp-0x68]
  809d7f:	89 c7                	mov    edi,eax
  809d81:	e8 7b f1 ff ff       	call   808f01 <chk_result>
  809d86:	85 c0                	test   eax,eax
  809d88:	75 1c                	jne    809da6 <FAT32_write+0x2f4>
		{
			printf("FAT32 FS(write) write disk ERROR!!!!!!!!!!\n");
  809d8a:	bf 28 4b 81 00       	mov    edi,0x814b28
  809d8f:	b8 00 00 00 00       	mov    eax,0x0
  809d94:	e8 8e 6f ff ff       	call   800d27 <printf>
			retval = -EIO;
  809d99:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  809da0:	ff 
			break;
  809da1:	e9 e0 00 00 00       	jmp    809e86 <FAT32_write+0x3d4>
		}

		index -= length;
  809da6:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  809da9:	29 45 d4             	sub    DWORD PTR [rbp-0x2c],eax
		buf += length;
  809dac:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  809daf:	48 98                	cdqe   
  809db1:	48 01 45 80          	add    QWORD PTR [rbp-0x80],rax
		offset -= offset;
  809db5:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  809dbc:	00 
		*position += length;
  809dbd:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  809dc4:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809dc7:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  809dca:	48 98                	cdqe   
  809dcc:	48 01 c2             	add    rdx,rax
  809dcf:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  809dd6:	48 89 10             	mov    QWORD PTR [rax],rdx

		if(index)
  809dd9:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  809ddd:	0f 84 a2 00 00 00    	je     809e85 <FAT32_write+0x3d3>
			next_cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  809de3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809de7:	89 c2                	mov    edx,eax
  809de9:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809ded:	89 d6                	mov    esi,edx
  809def:	48 89 c7             	mov    rdi,rax
  809df2:	e8 fe f6 ff ff       	call   8094f5 <DISK1_FAT32_read_FAT_Entry>
  809df7:	89 c0                	mov    eax,eax
  809df9:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
		else
			break;

		if(next_cluster >= 0x0ffffff8)
  809dfd:	48 81 7d b0 f7 ff ff 	cmp    QWORD PTR [rbp-0x50],0xffffff7
  809e04:	0f 
  809e05:	76 72                	jbe    809e79 <FAT32_write+0x3c7>
		{
			next_cluster = FAT32_find_available_cluster(fsbi);
  809e07:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809e0b:	48 89 c7             	mov    rdi,rax
  809e0e:	e8 cd fb ff ff       	call   8099e0 <FAT32_find_available_cluster>
  809e13:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
			if(!next_cluster)
  809e17:	48 83 7d b0 00       	cmp    QWORD PTR [rbp-0x50],0x0
  809e1c:	75 18                	jne    809e36 <FAT32_write+0x384>
			{
				vmfree(buffer);
  809e1e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809e22:	48 89 c7             	mov    rdi,rax
  809e25:	e8 62 74 ff ff       	call   80128c <vmfree>
				return -ENOSPC;
  809e2a:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  809e31:	e9 d4 00 00 00       	jmp    809f0a <FAT32_write+0x458>
			}			
				
			DISK1_FAT32_write_FAT_Entry(fsbi,cluster,next_cluster);
  809e36:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  809e3a:	89 c2                	mov    edx,eax
  809e3c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809e40:	89 c1                	mov    ecx,eax
  809e42:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809e46:	89 ce                	mov    esi,ecx
  809e48:	48 89 c7             	mov    rdi,rax
  809e4b:	e8 61 f7 ff ff       	call   8095b1 <DISK1_FAT32_write_FAT_Entry>
			DISK1_FAT32_write_FAT_Entry(fsbi,next_cluster,0x0ffffff8);
  809e50:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  809e54:	89 c1                	mov    ecx,eax
  809e56:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809e5a:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  809e5f:	89 ce                	mov    esi,ecx
  809e61:	48 89 c7             	mov    rdi,rax
  809e64:	e8 48 f7 ff ff       	call   8095b1 <DISK1_FAT32_write_FAT_Entry>
			cluster = next_cluster;
  809e69:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  809e6d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			flags = 1;
  809e71:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  809e78:	00 
		}

	}while(index);
  809e79:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  809e7d:	0f 85 d2 fd ff ff    	jne    809c55 <FAT32_write+0x1a3>
  809e83:	eb 01                	jmp    809e86 <FAT32_write+0x3d4>
			break;
  809e85:	90                   	nop

	if(*position > filp->dentry->dir_inode->file_size)
  809e86:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  809e8d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809e90:	48 89 c2             	mov    rdx,rax
  809e93:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809e97:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809e9b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809e9f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809ea2:	48 39 c2             	cmp    rdx,rax
  809ea5:	76 42                	jbe    809ee9 <FAT32_write+0x437>
	{
		filp->dentry->dir_inode->file_size = *position;
  809ea7:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  809eae:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809eb1:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809eb5:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809eb9:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809ebd:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  809ec0:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809ec4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809ec8:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809ecc:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809ed0:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  809ed4:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  809ed8:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809edc:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809ee0:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809ee4:	48 89 c7             	mov    rdi,rax
  809ee7:	ff d2                	call   rdx
	}

	vmfree(buffer);
  809ee9:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809eed:	48 89 c7             	mov    rdi,rax
  809ef0:	e8 97 73 ff ff       	call   80128c <vmfree>
	if(!index)
  809ef5:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  809ef9:	75 0b                	jne    809f06 <FAT32_write+0x454>
		retval = count;
  809efb:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  809f02:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	return retval;
  809f06:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  809f0a:	c9                   	leave  
  809f0b:	c3                   	ret    

0000000000809f0c <FAT32_lseek>:


long FAT32_lseek(struct file * filp,long offset,long origin)
{
  809f0c:	f3 0f 1e fa          	endbr64 
  809f10:	55                   	push   rbp
  809f11:	48 89 e5             	mov    rbp,rsp
  809f14:	48 83 ec 30          	sub    rsp,0x30
  809f18:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  809f1c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  809f20:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	struct index_node *inode = filp->dentry->dir_inode;
  809f24:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809f28:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809f2c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809f30:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	long pos = 0;
  809f34:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  809f3b:	00 

	switch(origin)
  809f3c:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  809f41:	74 21                	je     809f64 <FAT32_lseek+0x58>
  809f43:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  809f48:	7f 4a                	jg     809f94 <FAT32_lseek+0x88>
  809f4a:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  809f4f:	74 09                	je     809f5a <FAT32_lseek+0x4e>
  809f51:	48 83 7d d8 01       	cmp    QWORD PTR [rbp-0x28],0x1
  809f56:	74 20                	je     809f78 <FAT32_lseek+0x6c>
  809f58:	eb 3a                	jmp    809f94 <FAT32_lseek+0x88>
	{
		case SEEK_SET:
				pos = offset;
  809f5a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809f5e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  809f62:	eb 39                	jmp    809f9d <FAT32_lseek+0x91>

		case SEEK_CUR:
				pos =  filp->position + offset;
  809f64:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809f68:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809f6b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809f6f:	48 01 d0             	add    rax,rdx
  809f72:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  809f76:	eb 25                	jmp    809f9d <FAT32_lseek+0x91>

		case SEEK_END:
				pos = filp->dentry->dir_inode->file_size + offset;
  809f78:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809f7c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809f80:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809f84:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809f87:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809f8b:	48 01 d0             	add    rax,rdx
  809f8e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  809f92:	eb 09                	jmp    809f9d <FAT32_lseek+0x91>

		default:
			return -EINVAL;
  809f94:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  809f9b:	eb 50                	jmp    809fed <FAT32_lseek+0xe1>
			break;
	}

	if(pos < 0 || pos > filp->dentry->dir_inode->file_size)
  809f9d:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  809fa2:	78 18                	js     809fbc <FAT32_lseek+0xb0>
  809fa4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809fa8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809fac:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809fb0:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809fb3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809fb7:	48 39 c2             	cmp    rdx,rax
  809fba:	73 09                	jae    809fc5 <FAT32_lseek+0xb9>
		return -EOVERFLOW;
  809fbc:	48 c7 c0 bf ff ff ff 	mov    rax,0xffffffffffffffbf
  809fc3:	eb 28                	jmp    809fed <FAT32_lseek+0xe1>

	filp->position = pos;
  809fc5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809fc9:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  809fcd:	48 89 10             	mov    QWORD PTR [rax],rdx
	printf("FAT32 FS(lseek) alert position:%d\n",filp->position);
  809fd0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809fd4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809fd7:	48 89 c6             	mov    rsi,rax
  809fda:	bf 58 4b 81 00       	mov    edi,0x814b58
  809fdf:	b8 00 00 00 00       	mov    eax,0x0
  809fe4:	e8 3e 6d ff ff       	call   800d27 <printf>

	return pos;
  809fe9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  809fed:	c9                   	leave  
  809fee:	c3                   	ret    

0000000000809fef <FAT32_ioctl>:


long FAT32_ioctl(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg)
{}
  809fef:	f3 0f 1e fa          	endbr64 
  809ff3:	55                   	push   rbp
  809ff4:	48 89 e5             	mov    rbp,rsp
  809ff7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809ffb:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  809fff:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80a003:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  80a007:	90                   	nop
  80a008:	5d                   	pop    rbp
  80a009:	c3                   	ret    

000000000080a00a <FAT32_readdir>:

long FAT32_readdir(struct file * filp,void * dirent,filldir_t filler)
{
  80a00a:	f3 0f 1e fa          	endbr64 
  80a00e:	55                   	push   rbp
  80a00f:	48 89 e5             	mov    rbp,rsp
  80a012:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  80a016:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  80a01a:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  80a01e:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  80a022:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a026:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a02a:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a02e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a032:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  80a036:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a03a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a03e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a042:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a046:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a04a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned int cluster = 0;
  80a04e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  80a055:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  80a05c:	00 
	unsigned char * buf =NULL; 
  80a05d:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
  80a064:	00 
	char *name = NULL;
  80a065:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80a06c:	00 
	int namelen = 0;
  80a06d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
	int i = 0,j = 0,x = 0,y = 0;
  80a074:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  80a07b:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
  80a082:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  80a089:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  80a090:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  80a097:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  80a098:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  80a09f:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  80a0a0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a0a4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a0a8:	be 00 00 00 00       	mov    esi,0x0
  80a0ad:	48 89 c7             	mov    rdi,rax
  80a0b0:	b8 00 00 00 00       	mov    eax,0x0
  80a0b5:	e8 43 71 ff ff       	call   8011fd <vmalloc>
  80a0ba:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax

	cluster = finode->first_cluster;
  80a0be:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80a0c2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a0c5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

	j = filp->position/fsbi->bytes_per_cluster;
  80a0c8:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a0cc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a0cf:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80a0d3:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  80a0d7:	48 99                	cqo    
  80a0d9:	48 f7 fe             	idiv   rsi
  80a0dc:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	
	for(i = 0;i<j;i++)
  80a0df:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  80a0e6:	eb 3a                	jmp    80a122 <FAT32_readdir+0x118>
	{
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80a0e8:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80a0eb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a0ef:	89 d6                	mov    esi,edx
  80a0f1:	48 89 c7             	mov    rdi,rax
  80a0f4:	e8 fc f3 ff ff       	call   8094f5 <DISK1_FAT32_read_FAT_Entry>
  80a0f9:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
		if(cluster > 0x0ffffff7)
  80a0fc:	81 7d fc f7 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff7
  80a103:	76 19                	jbe    80a11e <FAT32_readdir+0x114>
		{
			printf("FAT32 FS(readdir) cluster didn`t exist\n");
  80a105:	bf 80 4b 81 00       	mov    edi,0x814b80
  80a10a:	b8 00 00 00 00       	mov    eax,0x0
  80a10f:	e8 13 6c ff ff       	call   800d27 <printf>
			return NULL;
  80a114:	b8 00 00 00 00       	mov    eax,0x0
  80a119:	e9 86 05 00 00       	jmp    80a6a4 <FAT32_readdir+0x69a>
	for(i = 0;i<j;i++)
  80a11e:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  80a122:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80a125:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80a128:	7c be                	jl     80a0e8 <FAT32_readdir+0xde>
		}
	}

next_cluster:
  80a12a:	90                   	nop
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  80a12b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a12f:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  80a133:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a136:	83 e8 02             	sub    eax,0x2
  80a139:	89 c1                	mov    ecx,eax
  80a13b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a13f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a143:	48 0f af c1          	imul   rax,rcx
  80a147:	48 01 d0             	add    rax,rdx
  80a14a:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80a14e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a152:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a156:	89 c1                	mov    ecx,eax
  80a158:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80a15c:	89 c2                	mov    edx,eax
  80a15e:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80a162:	49 89 c0             	mov    r8,rax
  80a165:	be 00 00 00 00       	mov    esi,0x0
  80a16a:	bf 00 00 00 00       	mov    edi,0x0
  80a16f:	e8 d9 e6 ff ff       	call   80884d <request>
  80a174:	89 45 a4             	mov    DWORD PTR [rbp-0x5c],eax
    if(!chk_result(r))
  80a177:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  80a17a:	89 c7                	mov    edi,eax
  80a17c:	e8 80 ed ff ff       	call   808f01 <chk_result>
  80a181:	85 c0                	test   eax,eax
  80a183:	75 25                	jne    80a1aa <FAT32_readdir+0x1a0>
	{
		printf("FAT32 FS(readdir) read disk ERROR!!!!!!!!!!\n");
  80a185:	bf a8 4b 81 00       	mov    edi,0x814ba8
  80a18a:	b8 00 00 00 00       	mov    eax,0x0
  80a18f:	e8 93 6b ff ff       	call   800d27 <printf>
		vmfree(buf);
  80a194:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80a198:	48 89 c7             	mov    rdi,rax
  80a19b:	e8 ec 70 ff ff       	call   80128c <vmfree>
		return NULL;
  80a1a0:	b8 00 00 00 00       	mov    eax,0x0
  80a1a5:	e9 fa 04 00 00       	jmp    80a6a4 <FAT32_readdir+0x69a>
	}

	tmpdentry = (struct FAT32_Directory *)(buf + filp->position%fsbi->bytes_per_cluster);
  80a1aa:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a1ae:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a1b1:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80a1b5:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  80a1b9:	48 99                	cqo    
  80a1bb:	48 f7 f9             	idiv   rcx
  80a1be:	48 89 d0             	mov    rax,rdx
  80a1c1:	48 89 c2             	mov    rdx,rax
  80a1c4:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80a1c8:	48 01 d0             	add    rax,rdx
  80a1cb:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  80a1cf:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a1d3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a1d6:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80a1da:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  80a1de:	48 99                	cqo    
  80a1e0:	48 f7 f9             	idiv   rcx
  80a1e3:	48 89 d0             	mov    rax,rdx
  80a1e6:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  80a1e9:	e9 2f 04 00 00       	jmp    80a61d <FAT32_readdir+0x613>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  80a1ee:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a1f2:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80a1f6:	3c 0f                	cmp    al,0xf
  80a1f8:	0f 84 00 04 00 00    	je     80a5fe <FAT32_readdir+0x5f4>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  80a1fe:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a202:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a205:	3c e5                	cmp    al,0xe5
  80a207:	0f 84 f4 03 00 00    	je     80a601 <FAT32_readdir+0x5f7>
  80a20d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a211:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a214:	84 c0                	test   al,al
  80a216:	0f 84 e5 03 00 00    	je     80a601 <FAT32_readdir+0x5f7>
  80a21c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a220:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a223:	3c 05                	cmp    al,0x5
  80a225:	0f 84 d6 03 00 00    	je     80a601 <FAT32_readdir+0x5f7>
			continue;

		namelen = 0;
  80a22b:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  80a232:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a236:	48 83 e8 20          	sub    rax,0x20
  80a23a:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

		if(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  80a23e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a242:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80a246:	3c 0f                	cmp    al,0xf
  80a248:	0f 85 2a 02 00 00    	jne    80a478 <FAT32_readdir+0x46e>
  80a24e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a252:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a255:	3c e5                	cmp    al,0xe5
  80a257:	0f 84 1b 02 00 00    	je     80a478 <FAT32_readdir+0x46e>
  80a25d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a261:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a264:	84 c0                	test   al,al
  80a266:	0f 84 0c 02 00 00    	je     80a478 <FAT32_readdir+0x46e>
  80a26c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a270:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a273:	3c 05                	cmp    al,0x5
  80a275:	0f 84 fd 01 00 00    	je     80a478 <FAT32_readdir+0x46e>
		{
			j = 0;
  80a27b:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
			//long file/dir name read
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  80a282:	eb 1a                	jmp    80a29e <FAT32_readdir+0x294>
			{
				j++;
  80a284:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
				if(tmpldentry->LDIR_Ord & 0x40)
  80a288:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a28c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a28f:	0f b6 c0             	movzx  eax,al
  80a292:	83 e0 40             	and    eax,0x40
  80a295:	85 c0                	test   eax,eax
  80a297:	75 34                	jne    80a2cd <FAT32_readdir+0x2c3>
					break;
				tmpldentry --;
  80a299:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  80a29e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a2a2:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80a2a6:	3c 0f                	cmp    al,0xf
  80a2a8:	75 24                	jne    80a2ce <FAT32_readdir+0x2c4>
  80a2aa:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a2ae:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a2b1:	3c e5                	cmp    al,0xe5
  80a2b3:	74 19                	je     80a2ce <FAT32_readdir+0x2c4>
  80a2b5:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a2b9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a2bc:	84 c0                	test   al,al
  80a2be:	74 0e                	je     80a2ce <FAT32_readdir+0x2c4>
  80a2c0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a2c4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a2c7:	3c 05                	cmp    al,0x5
  80a2c9:	75 b9                	jne    80a284 <FAT32_readdir+0x27a>
  80a2cb:	eb 01                	jmp    80a2ce <FAT32_readdir+0x2c4>
					break;
  80a2cd:	90                   	nop
			}

			name = vmalloc(j*13+1,0);
  80a2ce:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  80a2d1:	89 d0                	mov    eax,edx
  80a2d3:	01 c0                	add    eax,eax
  80a2d5:	01 d0                	add    eax,edx
  80a2d7:	c1 e0 02             	shl    eax,0x2
  80a2da:	01 d0                	add    eax,edx
  80a2dc:	83 c0 01             	add    eax,0x1
  80a2df:	be 00 00 00 00       	mov    esi,0x0
  80a2e4:	89 c7                	mov    edi,eax
  80a2e6:	b8 00 00 00 00       	mov    eax,0x0
  80a2eb:	e8 0d 6f ff ff       	call   8011fd <vmalloc>
  80a2f0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
			memset(name,0,j*13+1);
  80a2f4:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  80a2f7:	89 d0                	mov    eax,edx
  80a2f9:	01 c0                	add    eax,eax
  80a2fb:	01 d0                	add    eax,edx
  80a2fd:	c1 e0 02             	shl    eax,0x2
  80a300:	01 d0                	add    eax,edx
  80a302:	83 c0 01             	add    eax,0x1
  80a305:	89 c2                	mov    edx,eax
  80a307:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a30b:	be 00 00 00 00       	mov    esi,0x0
  80a310:	48 89 c7             	mov    rdi,rax
  80a313:	e8 8c 1c 00 00       	call   80bfa4 <memset>
			tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  80a318:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a31c:	48 83 e8 20          	sub    rax,0x20
  80a320:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

			for(x = 0;x<j;x++,tmpldentry --)
  80a324:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  80a32b:	e9 37 01 00 00       	jmp    80a467 <FAT32_readdir+0x45d>
			{
				for(y = 0;y<5;y++)
  80a330:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  80a337:	eb 53                	jmp    80a38c <FAT32_readdir+0x382>
					if(tmpldentry->LDIR_Name1[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  80a339:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a33d:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80a340:	48 63 d2             	movsxd rdx,edx
  80a343:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80a348:	66 83 f8 ff          	cmp    ax,0xffff
  80a34c:	74 3a                	je     80a388 <FAT32_readdir+0x37e>
  80a34e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a352:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80a355:	48 63 d2             	movsxd rdx,edx
  80a358:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80a35d:	66 85 c0             	test   ax,ax
  80a360:	74 26                	je     80a388 <FAT32_readdir+0x37e>
						name[namelen++] = (char)tmpldentry->LDIR_Name1[y];
  80a362:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a366:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80a369:	48 63 d2             	movsxd rdx,edx
  80a36c:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  80a371:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80a374:	8d 50 01             	lea    edx,[rax+0x1]
  80a377:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80a37a:	48 63 d0             	movsxd rdx,eax
  80a37d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a381:	48 01 d0             	add    rax,rdx
  80a384:	89 ca                	mov    edx,ecx
  80a386:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<5;y++)
  80a388:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  80a38c:	83 7d dc 04          	cmp    DWORD PTR [rbp-0x24],0x4
  80a390:	7e a7                	jle    80a339 <FAT32_readdir+0x32f>

				for(y = 0;y<6;y++)
  80a392:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  80a399:	eb 53                	jmp    80a3ee <FAT32_readdir+0x3e4>
					if(tmpldentry->LDIR_Name2[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  80a39b:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a39f:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80a3a2:	48 63 d2             	movsxd rdx,edx
  80a3a5:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  80a3aa:	66 83 f8 ff          	cmp    ax,0xffff
  80a3ae:	74 3a                	je     80a3ea <FAT32_readdir+0x3e0>
  80a3b0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a3b4:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80a3b7:	48 63 d2             	movsxd rdx,edx
  80a3ba:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80a3bf:	66 85 c0             	test   ax,ax
  80a3c2:	74 26                	je     80a3ea <FAT32_readdir+0x3e0>
						name[namelen++] = (char)tmpldentry->LDIR_Name2[y];
  80a3c4:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a3c8:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80a3cb:	48 63 d2             	movsxd rdx,edx
  80a3ce:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  80a3d3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80a3d6:	8d 50 01             	lea    edx,[rax+0x1]
  80a3d9:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80a3dc:	48 63 d0             	movsxd rdx,eax
  80a3df:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a3e3:	48 01 d0             	add    rax,rdx
  80a3e6:	89 ca                	mov    edx,ecx
  80a3e8:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<6;y++)
  80a3ea:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  80a3ee:	83 7d dc 05          	cmp    DWORD PTR [rbp-0x24],0x5
  80a3f2:	7e a7                	jle    80a39b <FAT32_readdir+0x391>

				for(y = 0;y<2;y++)
  80a3f4:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  80a3fb:	eb 5b                	jmp    80a458 <FAT32_readdir+0x44e>
					if(tmpldentry->LDIR_Name3[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  80a3fd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a401:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80a404:	48 63 d2             	movsxd rdx,edx
  80a407:	48 83 c2 08          	add    rdx,0x8
  80a40b:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  80a410:	66 83 f8 ff          	cmp    ax,0xffff
  80a414:	74 3e                	je     80a454 <FAT32_readdir+0x44a>
  80a416:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a41a:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80a41d:	48 63 d2             	movsxd rdx,edx
  80a420:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80a425:	66 85 c0             	test   ax,ax
  80a428:	74 2a                	je     80a454 <FAT32_readdir+0x44a>
						name[namelen++] = (char)tmpldentry->LDIR_Name3[y];
  80a42a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a42e:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80a431:	48 63 d2             	movsxd rdx,edx
  80a434:	48 83 c2 08          	add    rdx,0x8
  80a438:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  80a43d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80a440:	8d 50 01             	lea    edx,[rax+0x1]
  80a443:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80a446:	48 63 d0             	movsxd rdx,eax
  80a449:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a44d:	48 01 d0             	add    rax,rdx
  80a450:	89 ca                	mov    edx,ecx
  80a452:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<2;y++)
  80a454:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  80a458:	83 7d dc 01          	cmp    DWORD PTR [rbp-0x24],0x1
  80a45c:	7e 9f                	jle    80a3fd <FAT32_readdir+0x3f3>
			for(x = 0;x<j;x++,tmpldentry --)
  80a45e:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  80a462:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
  80a467:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80a46a:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80a46d:	0f 8c bd fe ff ff    	jl     80a330 <FAT32_readdir+0x326>
			}
			goto find_lookup_success;
  80a473:	e9 f5 01 00 00       	jmp    80a66d <FAT32_readdir+0x663>
		}

		name = vmalloc(15,0);
  80a478:	be 00 00 00 00       	mov    esi,0x0
  80a47d:	bf 0f 00 00 00       	mov    edi,0xf
  80a482:	b8 00 00 00 00       	mov    eax,0x0
  80a487:	e8 71 6d ff ff       	call   8011fd <vmalloc>
  80a48c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
		memset(name,0,15);
  80a490:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a494:	ba 0f 00 00 00       	mov    edx,0xf
  80a499:	be 00 00 00 00       	mov    esi,0x0
  80a49e:	48 89 c7             	mov    rdi,rax
  80a4a1:	e8 fe 1a 00 00       	call   80bfa4 <memset>
		//short file/dir base name compare
		for(x=0;x<8;x++)
  80a4a6:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  80a4ad:	eb 74                	jmp    80a523 <FAT32_readdir+0x519>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  80a4af:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80a4b3:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80a4b6:	48 98                	cdqe   
  80a4b8:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a4bc:	3c 20                	cmp    al,0x20
  80a4be:	74 6b                	je     80a52b <FAT32_readdir+0x521>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  80a4c0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a4c4:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80a4c8:	0f b6 c0             	movzx  eax,al
  80a4cb:	83 e0 08             	and    eax,0x8
  80a4ce:	85 c0                	test   eax,eax
  80a4d0:	74 29                	je     80a4fb <FAT32_readdir+0x4f1>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  80a4d2:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80a4d6:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80a4d9:	48 98                	cdqe   
  80a4db:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a4df:	8d 48 20             	lea    ecx,[rax+0x20]
  80a4e2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80a4e5:	8d 50 01             	lea    edx,[rax+0x1]
  80a4e8:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80a4eb:	48 63 d0             	movsxd rdx,eax
  80a4ee:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a4f2:	48 01 d0             	add    rax,rdx
  80a4f5:	89 ca                	mov    edx,ecx
  80a4f7:	88 10                	mov    BYTE PTR [rax],dl
  80a4f9:	eb 24                	jmp    80a51f <FAT32_readdir+0x515>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  80a4fb:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80a4ff:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80a502:	48 98                	cdqe   
  80a504:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  80a508:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80a50b:	8d 50 01             	lea    edx,[rax+0x1]
  80a50e:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80a511:	48 63 d0             	movsxd rdx,eax
  80a514:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a518:	48 01 d0             	add    rax,rdx
  80a51b:	89 ca                	mov    edx,ecx
  80a51d:	88 10                	mov    BYTE PTR [rax],dl
		for(x=0;x<8;x++)
  80a51f:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  80a523:	83 7d e0 07          	cmp    DWORD PTR [rbp-0x20],0x7
  80a527:	7e 86                	jle    80a4af <FAT32_readdir+0x4a5>
  80a529:	eb 01                	jmp    80a52c <FAT32_readdir+0x522>
				break;
  80a52b:	90                   	nop
		}

		if(tmpdentry->DIR_Attr & ATTR_DIRECTORY)
  80a52c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a530:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80a534:	0f b6 c0             	movzx  eax,al
  80a537:	83 e0 10             	and    eax,0x10
  80a53a:	85 c0                	test   eax,eax
  80a53c:	0f 85 27 01 00 00    	jne    80a669 <FAT32_readdir+0x65f>
			goto find_lookup_success;

		name[namelen++] = '.';
  80a542:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80a545:	8d 50 01             	lea    edx,[rax+0x1]
  80a548:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80a54b:	48 63 d0             	movsxd rdx,eax
  80a54e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a552:	48 01 d0             	add    rax,rdx
  80a555:	c6 00 2e             	mov    BYTE PTR [rax],0x2e

		//short file ext name compare
		for(x=8;x<11;x++)
  80a558:	c7 45 e0 08 00 00 00 	mov    DWORD PTR [rbp-0x20],0x8
  80a55f:	eb 74                	jmp    80a5d5 <FAT32_readdir+0x5cb>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  80a561:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80a565:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80a568:	48 98                	cdqe   
  80a56a:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a56e:	3c 20                	cmp    al,0x20
  80a570:	74 6b                	je     80a5dd <FAT32_readdir+0x5d3>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  80a572:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a576:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80a57a:	0f b6 c0             	movzx  eax,al
  80a57d:	83 e0 10             	and    eax,0x10
  80a580:	85 c0                	test   eax,eax
  80a582:	74 29                	je     80a5ad <FAT32_readdir+0x5a3>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  80a584:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80a588:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80a58b:	48 98                	cdqe   
  80a58d:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a591:	8d 48 20             	lea    ecx,[rax+0x20]
  80a594:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80a597:	8d 50 01             	lea    edx,[rax+0x1]
  80a59a:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80a59d:	48 63 d0             	movsxd rdx,eax
  80a5a0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a5a4:	48 01 d0             	add    rax,rdx
  80a5a7:	89 ca                	mov    edx,ecx
  80a5a9:	88 10                	mov    BYTE PTR [rax],dl
  80a5ab:	eb 24                	jmp    80a5d1 <FAT32_readdir+0x5c7>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  80a5ad:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80a5b1:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80a5b4:	48 98                	cdqe   
  80a5b6:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  80a5ba:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80a5bd:	8d 50 01             	lea    edx,[rax+0x1]
  80a5c0:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80a5c3:	48 63 d0             	movsxd rdx,eax
  80a5c6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a5ca:	48 01 d0             	add    rax,rdx
  80a5cd:	89 ca                	mov    edx,ecx
  80a5cf:	88 10                	mov    BYTE PTR [rax],dl
		for(x=8;x<11;x++)
  80a5d1:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  80a5d5:	83 7d e0 0a          	cmp    DWORD PTR [rbp-0x20],0xa
  80a5d9:	7e 86                	jle    80a561 <FAT32_readdir+0x557>
  80a5db:	eb 01                	jmp    80a5de <FAT32_readdir+0x5d4>
				break;
  80a5dd:	90                   	nop
		}
		if(x == 8)
  80a5de:	83 7d e0 08          	cmp    DWORD PTR [rbp-0x20],0x8
  80a5e2:	0f 85 84 00 00 00    	jne    80a66c <FAT32_readdir+0x662>
			name[--namelen] = 0;
  80a5e8:	83 6d ec 01          	sub    DWORD PTR [rbp-0x14],0x1
  80a5ec:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80a5ef:	48 63 d0             	movsxd rdx,eax
  80a5f2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a5f6:	48 01 d0             	add    rax,rdx
  80a5f9:	c6 00 00             	mov    BYTE PTR [rax],0x0
		goto find_lookup_success;
  80a5fc:	eb 6e                	jmp    80a66c <FAT32_readdir+0x662>
			continue;
  80a5fe:	90                   	nop
  80a5ff:	eb 01                	jmp    80a602 <FAT32_readdir+0x5f8>
			continue;
  80a601:	90                   	nop
	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  80a602:	83 45 e8 20          	add    DWORD PTR [rbp-0x18],0x20
  80a606:	48 83 45 d0 20       	add    QWORD PTR [rbp-0x30],0x20
  80a60b:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a60f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a612:	48 8d 50 20          	lea    rdx,[rax+0x20]
  80a616:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a61a:	48 89 10             	mov    QWORD PTR [rax],rdx
  80a61d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80a620:	48 63 d0             	movsxd rdx,eax
  80a623:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a627:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a62b:	48 39 c2             	cmp    rdx,rax
  80a62e:	0f 8c ba fb ff ff    	jl     80a1ee <FAT32_readdir+0x1e4>
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80a634:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80a637:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a63b:	89 d6                	mov    esi,edx
  80a63d:	48 89 c7             	mov    rdi,rax
  80a640:	e8 b0 ee ff ff       	call   8094f5 <DISK1_FAT32_read_FAT_Entry>
  80a645:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  80a648:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  80a64f:	77 05                	ja     80a656 <FAT32_readdir+0x64c>
		goto next_cluster;
  80a651:	e9 d5 fa ff ff       	jmp    80a12b <FAT32_readdir+0x121>

	vmfree(buf);
  80a656:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80a65a:	48 89 c7             	mov    rdi,rax
  80a65d:	e8 2a 6c ff ff       	call   80128c <vmfree>
	return NULL;
  80a662:	b8 00 00 00 00       	mov    eax,0x0
  80a667:	eb 3b                	jmp    80a6a4 <FAT32_readdir+0x69a>
			goto find_lookup_success;
  80a669:	90                   	nop
  80a66a:	eb 01                	jmp    80a66d <FAT32_readdir+0x663>
		goto find_lookup_success;
  80a66c:	90                   	nop

find_lookup_success:

	filp->position += 32;
  80a66d:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a671:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a674:	48 8d 50 20          	lea    rdx,[rax+0x20]
  80a678:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a67c:	48 89 10             	mov    QWORD PTR [rax],rdx
	return filler(dirent,name,namelen,0,0);
  80a67f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80a682:	48 63 d0             	movsxd rdx,eax
  80a685:	48 8b 75 f0          	mov    rsi,QWORD PTR [rbp-0x10]
  80a689:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80a68d:	4c 8b 4d 88          	mov    r9,QWORD PTR [rbp-0x78]
  80a691:	41 b8 00 00 00 00    	mov    r8d,0x0
  80a697:	b9 00 00 00 00       	mov    ecx,0x0
  80a69c:	48 89 c7             	mov    rdi,rax
  80a69f:	41 ff d1             	call   r9
  80a6a2:	48 98                	cdqe   
}
  80a6a4:	c9                   	leave  
  80a6a5:	c3                   	ret    

000000000080a6a6 <FAT32_create>:
	.readdir = FAT32_readdir,
};


long FAT32_create(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  80a6a6:	f3 0f 1e fa          	endbr64 
  80a6aa:	55                   	push   rbp
  80a6ab:	48 89 e5             	mov    rbp,rsp
  80a6ae:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a6b2:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a6b6:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80a6b9:	90                   	nop
  80a6ba:	5d                   	pop    rbp
  80a6bb:	c3                   	ret    

000000000080a6bc <FAT32_lookup>:


struct dir_entry * FAT32_lookup(struct index_node * parent_inode,struct dir_entry * dest_dentry)
{
  80a6bc:	f3 0f 1e fa          	endbr64 
  80a6c0:	55                   	push   rbp
  80a6c1:	48 89 e5             	mov    rbp,rsp
  80a6c4:	48 83 ec 60          	sub    rsp,0x60
  80a6c8:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  80a6cc:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
	struct FAT32_inode_info * finode = parent_inode->private_index_info;
  80a6d0:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80a6d4:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a6d8:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	struct FAT32_sb_info * fsbi = parent_inode->sb->private_sb_info;
  80a6dc:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80a6e0:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a6e4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a6e8:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	unsigned int cluster = 0;
  80a6ec:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  80a6f3:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  80a6fa:	00 
	unsigned char * buf =NULL; 
  80a6fb:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  80a702:	00 
	int i = 0,j = 0,x = 0;
  80a703:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80a70a:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80a711:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  80a718:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80a71f:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  80a720:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80a727:	00 
	struct index_node * p = NULL;
  80a728:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  80a72f:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  80a730:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a734:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a738:	be 00 00 00 00       	mov    esi,0x0
  80a73d:	48 89 c7             	mov    rdi,rax
  80a740:	b8 00 00 00 00       	mov    eax,0x0
  80a745:	e8 b3 6a ff ff       	call   8011fd <vmalloc>
  80a74a:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax

	cluster = finode->first_cluster;
  80a74e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a752:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a755:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

next_cluster:
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  80a758:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a75c:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  80a760:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a763:	83 e8 02             	sub    eax,0x2
  80a766:	89 c1                	mov    ecx,eax
  80a768:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a76c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a770:	48 0f af c1          	imul   rax,rcx
  80a774:	48 01 d0             	add    rax,rdx
  80a777:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
	printf("lookup cluster:0x%x,sector:0x%x\r\n",cluster,sector);
  80a77b:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80a77f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a782:	89 c6                	mov    esi,eax
  80a784:	bf d8 4b 81 00       	mov    edi,0x814bd8
  80a789:	b8 00 00 00 00       	mov    eax,0x0
  80a78e:	e8 94 65 ff ff       	call   800d27 <printf>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80a793:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a797:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a79b:	89 c1                	mov    ecx,eax
  80a79d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a7a1:	89 c2                	mov    edx,eax
  80a7a3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80a7a7:	49 89 c0             	mov    r8,rax
  80a7aa:	be 00 00 00 00       	mov    esi,0x0
  80a7af:	bf 00 00 00 00       	mov    edi,0x0
  80a7b4:	e8 94 e0 ff ff       	call   80884d <request>
  80a7b9:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    if(!chk_result(r))
  80a7bc:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80a7bf:	89 c7                	mov    edi,eax
  80a7c1:	e8 3b e7 ff ff       	call   808f01 <chk_result>
  80a7c6:	85 c0                	test   eax,eax
  80a7c8:	75 25                	jne    80a7ef <FAT32_lookup+0x133>
	{
		printf("FAT32 FS(lookup) read disk ERROR!!!!!!!!!!\n");
  80a7ca:	bf 00 4c 81 00       	mov    edi,0x814c00
  80a7cf:	b8 00 00 00 00       	mov    eax,0x0
  80a7d4:	e8 4e 65 ff ff       	call   800d27 <printf>
		vmfree(buf);
  80a7d9:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80a7dd:	48 89 c7             	mov    rdi,rax
  80a7e0:	e8 a7 6a ff ff       	call   80128c <vmfree>
		return NULL;
  80a7e5:	b8 00 00 00 00       	mov    eax,0x0
  80a7ea:	e9 f0 07 00 00       	jmp    80afdf <FAT32_lookup+0x923>
	}

	tmpdentry = (struct FAT32_Directory *)buf;
  80a7ef:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80a7f3:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax

	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  80a7f7:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80a7fe:	e9 9d 05 00 00       	jmp    80ada0 <FAT32_lookup+0x6e4>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  80a803:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a807:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80a80b:	3c 0f                	cmp    al,0xf
  80a80d:	0f 84 59 05 00 00    	je     80ad6c <FAT32_lookup+0x6b0>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  80a813:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a817:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a81a:	3c e5                	cmp    al,0xe5
  80a81c:	0f 84 4d 05 00 00    	je     80ad6f <FAT32_lookup+0x6b3>
  80a822:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a826:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a829:	84 c0                	test   al,al
  80a82b:	0f 84 3e 05 00 00    	je     80ad6f <FAT32_lookup+0x6b3>
  80a831:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a835:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a838:	3c 05                	cmp    al,0x5
  80a83a:	0f 84 2f 05 00 00    	je     80ad6f <FAT32_lookup+0x6b3>
			continue;

		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  80a840:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a844:	48 83 e8 20          	sub    rax,0x20
  80a848:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
		j = 0;
  80a84c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0

		//long file/dir name compare
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  80a853:	e9 88 01 00 00       	jmp    80a9e0 <FAT32_lookup+0x324>
		{
			for(x=0;x<5;x++)
  80a858:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80a85f:	eb 6a                	jmp    80a8cb <FAT32_lookup+0x20f>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name1[x] == 0xffff)
  80a861:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a865:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a868:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a86b:	7e 15                	jle    80a882 <FAT32_lookup+0x1c6>
  80a86d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a871:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80a874:	48 63 d2             	movsxd rdx,edx
  80a877:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80a87c:	66 83 f8 ff          	cmp    ax,0xffff
  80a880:	74 44                	je     80a8c6 <FAT32_lookup+0x20a>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name1[x] != (unsigned short)(dest_dentry->name[j++]))
  80a882:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a886:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a889:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a88c:	0f 8f e0 04 00 00    	jg     80ad72 <FAT32_lookup+0x6b6>
  80a892:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a896:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80a899:	48 63 d2             	movsxd rdx,edx
  80a89c:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  80a8a1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a8a5:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  80a8a8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a8ab:	8d 50 01             	lea    edx,[rax+0x1]
  80a8ae:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  80a8b1:	48 98                	cdqe   
  80a8b3:	48 01 f0             	add    rax,rsi
  80a8b6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a8b9:	66 98                	cbw    
  80a8bb:	66 39 c1             	cmp    cx,ax
  80a8be:	0f 85 ae 04 00 00    	jne    80ad72 <FAT32_lookup+0x6b6>
  80a8c4:	eb 01                	jmp    80a8c7 <FAT32_lookup+0x20b>
					continue;
  80a8c6:	90                   	nop
			for(x=0;x<5;x++)
  80a8c7:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80a8cb:	83 7d f0 04          	cmp    DWORD PTR [rbp-0x10],0x4
  80a8cf:	7e 90                	jle    80a861 <FAT32_lookup+0x1a5>
					goto continue_cmp_fail;
			}
			for(x=0;x<6;x++)
  80a8d1:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80a8d8:	eb 6a                	jmp    80a944 <FAT32_lookup+0x288>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name2[x] == 0xffff)
  80a8da:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a8de:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a8e1:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a8e4:	7e 15                	jle    80a8fb <FAT32_lookup+0x23f>
  80a8e6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a8ea:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80a8ed:	48 63 d2             	movsxd rdx,edx
  80a8f0:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  80a8f5:	66 83 f8 ff          	cmp    ax,0xffff
  80a8f9:	74 44                	je     80a93f <FAT32_lookup+0x283>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name2[x] != (unsigned short)(dest_dentry->name[j++]))
  80a8fb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a8ff:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a902:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a905:	0f 8f 6a 04 00 00    	jg     80ad75 <FAT32_lookup+0x6b9>
  80a90b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a90f:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80a912:	48 63 d2             	movsxd rdx,edx
  80a915:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  80a91a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a91e:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  80a921:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a924:	8d 50 01             	lea    edx,[rax+0x1]
  80a927:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  80a92a:	48 98                	cdqe   
  80a92c:	48 01 f0             	add    rax,rsi
  80a92f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a932:	66 98                	cbw    
  80a934:	66 39 c1             	cmp    cx,ax
  80a937:	0f 85 38 04 00 00    	jne    80ad75 <FAT32_lookup+0x6b9>
  80a93d:	eb 01                	jmp    80a940 <FAT32_lookup+0x284>
					continue;
  80a93f:	90                   	nop
			for(x=0;x<6;x++)
  80a940:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80a944:	83 7d f0 05          	cmp    DWORD PTR [rbp-0x10],0x5
  80a948:	7e 90                	jle    80a8da <FAT32_lookup+0x21e>
					goto continue_cmp_fail;
			}
			for(x=0;x<2;x++)
  80a94a:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80a951:	eb 72                	jmp    80a9c5 <FAT32_lookup+0x309>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name3[x] == 0xffff)
  80a953:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a957:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a95a:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a95d:	7e 19                	jle    80a978 <FAT32_lookup+0x2bc>
  80a95f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a963:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80a966:	48 63 d2             	movsxd rdx,edx
  80a969:	48 83 c2 08          	add    rdx,0x8
  80a96d:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  80a972:	66 83 f8 ff          	cmp    ax,0xffff
  80a976:	74 48                	je     80a9c0 <FAT32_lookup+0x304>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name3[x] != (unsigned short)(dest_dentry->name[j++]))
  80a978:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a97c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a97f:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a982:	0f 8f f0 03 00 00    	jg     80ad78 <FAT32_lookup+0x6bc>
  80a988:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a98c:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80a98f:	48 63 d2             	movsxd rdx,edx
  80a992:	48 83 c2 08          	add    rdx,0x8
  80a996:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  80a99b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a99f:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  80a9a2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a9a5:	8d 50 01             	lea    edx,[rax+0x1]
  80a9a8:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  80a9ab:	48 98                	cdqe   
  80a9ad:	48 01 f0             	add    rax,rsi
  80a9b0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a9b3:	66 98                	cbw    
  80a9b5:	66 39 c1             	cmp    cx,ax
  80a9b8:	0f 85 ba 03 00 00    	jne    80ad78 <FAT32_lookup+0x6bc>
  80a9be:	eb 01                	jmp    80a9c1 <FAT32_lookup+0x305>
					continue;
  80a9c0:	90                   	nop
			for(x=0;x<2;x++)
  80a9c1:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80a9c5:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  80a9c9:	7e 88                	jle    80a953 <FAT32_lookup+0x297>
					goto continue_cmp_fail;
			}

			if(j >= dest_dentry->name_length)
  80a9cb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a9cf:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a9d2:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a9d5:	0f 8d 14 04 00 00    	jge    80adef <FAT32_lookup+0x733>
			{
				goto find_lookup_success;
			}

			tmpldentry --;
  80a9db:	48 83 6d e0 20       	sub    QWORD PTR [rbp-0x20],0x20
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  80a9e0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a9e4:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80a9e8:	3c 0f                	cmp    al,0xf
  80a9ea:	75 0f                	jne    80a9fb <FAT32_lookup+0x33f>
  80a9ec:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a9f0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a9f3:	3c e5                	cmp    al,0xe5
  80a9f5:	0f 85 5d fe ff ff    	jne    80a858 <FAT32_lookup+0x19c>
		}

		//short file/dir base name compare
		j = 0;
  80a9fb:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
		for(x=0;x<8;x++)
  80aa02:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80aa09:	e9 f4 01 00 00       	jmp    80ac02 <FAT32_lookup+0x546>
		{
			switch(tmpdentry->DIR_Name[x])
  80aa0e:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80aa12:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80aa15:	48 98                	cdqe   
  80aa17:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80aa1b:	0f b6 c0             	movzx  eax,al
  80aa1e:	83 f8 7a             	cmp    eax,0x7a
  80aa21:	0f 8f d0 01 00 00    	jg     80abf7 <FAT32_lookup+0x53b>
  80aa27:	83 f8 61             	cmp    eax,0x61
  80aa2a:	0f 8d e6 00 00 00    	jge    80ab16 <FAT32_lookup+0x45a>
  80aa30:	83 f8 5a             	cmp    eax,0x5a
  80aa33:	0f 8f be 01 00 00    	jg     80abf7 <FAT32_lookup+0x53b>
  80aa39:	83 f8 41             	cmp    eax,0x41
  80aa3c:	0f 8d d4 00 00 00    	jge    80ab16 <FAT32_lookup+0x45a>
  80aa42:	83 f8 20             	cmp    eax,0x20
  80aa45:	74 1a                	je     80aa61 <FAT32_lookup+0x3a5>
  80aa47:	83 f8 20             	cmp    eax,0x20
  80aa4a:	0f 8c a7 01 00 00    	jl     80abf7 <FAT32_lookup+0x53b>
  80aa50:	83 e8 30             	sub    eax,0x30
  80aa53:	83 f8 09             	cmp    eax,0x9
  80aa56:	0f 87 9b 01 00 00    	ja     80abf7 <FAT32_lookup+0x53b>
  80aa5c:	e9 53 01 00 00       	jmp    80abb4 <FAT32_lookup+0x4f8>
			{
				case ' ':
					if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  80aa61:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80aa65:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80aa69:	0f b6 c0             	movzx  eax,al
  80aa6c:	83 e0 10             	and    eax,0x10
  80aa6f:	85 c0                	test   eax,eax
  80aa71:	75 50                	jne    80aac3 <FAT32_lookup+0x407>
					{
						if(dest_dentry->name[j]=='.')
  80aa73:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80aa77:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80aa7a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80aa7d:	48 98                	cdqe   
  80aa7f:	48 01 d0             	add    rax,rdx
  80aa82:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aa85:	3c 2e                	cmp    al,0x2e
  80aa87:	0f 84 70 01 00 00    	je     80abfd <FAT32_lookup+0x541>
							continue;
						else if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80aa8d:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80aa91:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80aa94:	48 98                	cdqe   
  80aa96:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80aa9a:	0f b6 d0             	movzx  edx,al
  80aa9d:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80aaa1:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80aaa4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80aaa7:	48 98                	cdqe   
  80aaa9:	48 01 c8             	add    rax,rcx
  80aaac:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aaaf:	0f be c0             	movsx  eax,al
  80aab2:	39 c2                	cmp    edx,eax
  80aab4:	0f 85 c1 02 00 00    	jne    80ad7b <FAT32_lookup+0x6bf>
						{
							j++;
  80aaba:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80aabe:	e9 3b 01 00 00       	jmp    80abfe <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80aac3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80aac7:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80aaca:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80aacd:	7d 32                	jge    80ab01 <FAT32_lookup+0x445>
  80aacf:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80aad3:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80aad6:	48 98                	cdqe   
  80aad8:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80aadc:	0f b6 d0             	movzx  edx,al
  80aadf:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80aae3:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80aae6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80aae9:	48 98                	cdqe   
  80aaeb:	48 01 c8             	add    rax,rcx
  80aaee:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aaf1:	0f be c0             	movsx  eax,al
  80aaf4:	39 c2                	cmp    edx,eax
  80aaf6:	75 09                	jne    80ab01 <FAT32_lookup+0x445>
						{
							j++;
  80aaf8:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80aafc:	e9 fd 00 00 00       	jmp    80abfe <FAT32_lookup+0x542>
						}
						else if(j == dest_dentry->name_length)
  80ab01:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ab05:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80ab08:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80ab0b:	0f 85 6d 02 00 00    	jne    80ad7e <FAT32_lookup+0x6c2>
							continue;
  80ab11:	e9 e8 00 00 00       	jmp    80abfe <FAT32_lookup+0x542>
							goto continue_cmp_fail;
					}

				case 'A' ... 'Z':
				case 'a' ... 'z':
					if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  80ab16:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ab1a:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80ab1e:	0f b6 c0             	movzx  eax,al
  80ab21:	83 e0 08             	and    eax,0x8
  80ab24:	85 c0                	test   eax,eax
  80ab26:	74 49                	je     80ab71 <FAT32_lookup+0x4b5>
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  80ab28:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ab2c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80ab2f:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80ab32:	0f 8d 49 02 00 00    	jge    80ad81 <FAT32_lookup+0x6c5>
  80ab38:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80ab3c:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80ab3f:	48 98                	cdqe   
  80ab41:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80ab45:	0f b6 c0             	movzx  eax,al
  80ab48:	8d 50 20             	lea    edx,[rax+0x20]
  80ab4b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ab4f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80ab52:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80ab55:	48 98                	cdqe   
  80ab57:	48 01 c8             	add    rax,rcx
  80ab5a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ab5d:	0f be c0             	movsx  eax,al
  80ab60:	39 c2                	cmp    edx,eax
  80ab62:	0f 85 19 02 00 00    	jne    80ad81 <FAT32_lookup+0x6c5>
						{
							j++;
  80ab68:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80ab6c:	e9 8d 00 00 00       	jmp    80abfe <FAT32_lookup+0x542>
						}
						else
							goto continue_cmp_fail;
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80ab71:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ab75:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80ab78:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80ab7b:	0f 8d 03 02 00 00    	jge    80ad84 <FAT32_lookup+0x6c8>
  80ab81:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80ab85:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80ab88:	48 98                	cdqe   
  80ab8a:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80ab8e:	0f b6 d0             	movzx  edx,al
  80ab91:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ab95:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80ab98:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80ab9b:	48 98                	cdqe   
  80ab9d:	48 01 c8             	add    rax,rcx
  80aba0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aba3:	0f be c0             	movsx  eax,al
  80aba6:	39 c2                	cmp    edx,eax
  80aba8:	0f 85 d6 01 00 00    	jne    80ad84 <FAT32_lookup+0x6c8>
						{
							j++;
  80abae:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80abb2:	eb 4a                	jmp    80abfe <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}

				case '0' ... '9':
					if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80abb4:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80abb8:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80abbb:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80abbe:	0f 8d c3 01 00 00    	jge    80ad87 <FAT32_lookup+0x6cb>
  80abc4:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80abc8:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80abcb:	48 98                	cdqe   
  80abcd:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80abd1:	0f b6 d0             	movzx  edx,al
  80abd4:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80abd8:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80abdb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80abde:	48 98                	cdqe   
  80abe0:	48 01 c8             	add    rax,rcx
  80abe3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80abe6:	0f be c0             	movsx  eax,al
  80abe9:	39 c2                	cmp    edx,eax
  80abeb:	0f 85 96 01 00 00    	jne    80ad87 <FAT32_lookup+0x6cb>
					{
						j++;
  80abf1:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
						break;
  80abf5:	eb 07                	jmp    80abfe <FAT32_lookup+0x542>
					}
					else
						goto continue_cmp_fail;

				default :
					j++;
  80abf7:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
					break;
  80abfb:	eb 01                	jmp    80abfe <FAT32_lookup+0x542>
							continue;
  80abfd:	90                   	nop
		for(x=0;x<8;x++)
  80abfe:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80ac02:	83 7d f0 07          	cmp    DWORD PTR [rbp-0x10],0x7
  80ac06:	0f 8e 02 fe ff ff    	jle    80aa0e <FAT32_lookup+0x352>
			}
		}
		//short file ext name compare
		if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  80ac0c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ac10:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80ac14:	0f b6 c0             	movzx  eax,al
  80ac17:	83 e0 10             	and    eax,0x10
  80ac1a:	85 c0                	test   eax,eax
  80ac1c:	0f 85 d0 01 00 00    	jne    80adf2 <FAT32_lookup+0x736>
		{
			j++;
  80ac22:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
			for(x=8;x<11;x++)
  80ac26:	c7 45 f0 08 00 00 00 	mov    DWORD PTR [rbp-0x10],0x8
  80ac2d:	e9 2b 01 00 00       	jmp    80ad5d <FAT32_lookup+0x6a1>
			{
				switch(tmpdentry->DIR_Name[x])
  80ac32:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80ac36:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80ac39:	48 98                	cdqe   
  80ac3b:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80ac3f:	0f b6 c0             	movzx  eax,al
  80ac42:	83 f8 7a             	cmp    eax,0x7a
  80ac45:	0f 8f 3f 01 00 00    	jg     80ad8a <FAT32_lookup+0x6ce>
  80ac4b:	83 f8 61             	cmp    eax,0x61
  80ac4e:	7d 2e                	jge    80ac7e <FAT32_lookup+0x5c2>
  80ac50:	83 f8 5a             	cmp    eax,0x5a
  80ac53:	0f 8f 31 01 00 00    	jg     80ad8a <FAT32_lookup+0x6ce>
  80ac59:	83 f8 41             	cmp    eax,0x41
  80ac5c:	7d 20                	jge    80ac7e <FAT32_lookup+0x5c2>
  80ac5e:	83 f8 20             	cmp    eax,0x20
  80ac61:	0f 84 c4 00 00 00    	je     80ad2b <FAT32_lookup+0x66f>
  80ac67:	83 f8 20             	cmp    eax,0x20
  80ac6a:	0f 8c 1a 01 00 00    	jl     80ad8a <FAT32_lookup+0x6ce>
  80ac70:	83 e8 30             	sub    eax,0x30
  80ac73:	83 f8 09             	cmp    eax,0x9
  80ac76:	0f 87 0e 01 00 00    	ja     80ad8a <FAT32_lookup+0x6ce>
  80ac7c:	eb 7e                	jmp    80acfc <FAT32_lookup+0x640>
				{
					case 'A' ... 'Z':
					case 'a' ... 'z':
						if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  80ac7e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ac82:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80ac86:	0f b6 c0             	movzx  eax,al
  80ac89:	83 e0 10             	and    eax,0x10
  80ac8c:	85 c0                	test   eax,eax
  80ac8e:	74 39                	je     80acc9 <FAT32_lookup+0x60d>
							if(tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  80ac90:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80ac94:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80ac97:	48 98                	cdqe   
  80ac99:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80ac9d:	0f b6 c0             	movzx  eax,al
  80aca0:	8d 50 20             	lea    edx,[rax+0x20]
  80aca3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80aca7:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80acaa:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80acad:	48 98                	cdqe   
  80acaf:	48 01 c8             	add    rax,rcx
  80acb2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80acb5:	0f be c0             	movsx  eax,al
  80acb8:	39 c2                	cmp    edx,eax
  80acba:	0f 85 cd 00 00 00    	jne    80ad8d <FAT32_lookup+0x6d1>
							{
								j++;
  80acc0:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  80acc4:	e9 90 00 00 00       	jmp    80ad59 <FAT32_lookup+0x69d>
							}
							else
								goto continue_cmp_fail;
						else
						{
							if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80acc9:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80accd:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80acd0:	48 98                	cdqe   
  80acd2:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80acd6:	0f b6 d0             	movzx  edx,al
  80acd9:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80acdd:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80ace0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80ace3:	48 98                	cdqe   
  80ace5:	48 01 c8             	add    rax,rcx
  80ace8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aceb:	0f be c0             	movsx  eax,al
  80acee:	39 c2                	cmp    edx,eax
  80acf0:	0f 85 9a 00 00 00    	jne    80ad90 <FAT32_lookup+0x6d4>
							{
								j++;
  80acf6:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  80acfa:	eb 5d                	jmp    80ad59 <FAT32_lookup+0x69d>
							else
								goto continue_cmp_fail;
						}

					case '0' ... '9':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80acfc:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80ad00:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80ad03:	48 98                	cdqe   
  80ad05:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80ad09:	0f b6 d0             	movzx  edx,al
  80ad0c:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ad10:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80ad13:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80ad16:	48 98                	cdqe   
  80ad18:	48 01 c8             	add    rax,rcx
  80ad1b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ad1e:	0f be c0             	movsx  eax,al
  80ad21:	39 c2                	cmp    edx,eax
  80ad23:	75 6e                	jne    80ad93 <FAT32_lookup+0x6d7>
						{
							j++;
  80ad25:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80ad29:	eb 2e                	jmp    80ad59 <FAT32_lookup+0x69d>
						}
						else
							goto continue_cmp_fail;

					case ' ':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80ad2b:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80ad2f:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80ad32:	48 98                	cdqe   
  80ad34:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80ad38:	0f b6 d0             	movzx  edx,al
  80ad3b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ad3f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80ad42:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80ad45:	48 98                	cdqe   
  80ad47:	48 01 c8             	add    rax,rcx
  80ad4a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ad4d:	0f be c0             	movsx  eax,al
  80ad50:	39 c2                	cmp    edx,eax
  80ad52:	75 42                	jne    80ad96 <FAT32_lookup+0x6da>
						{
							j++;
  80ad54:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80ad58:	90                   	nop
			for(x=8;x<11;x++)
  80ad59:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80ad5d:	83 7d f0 0a          	cmp    DWORD PTR [rbp-0x10],0xa
  80ad61:	0f 8e cb fe ff ff    	jle    80ac32 <FAT32_lookup+0x576>
					default :
						goto continue_cmp_fail;
				}
			}
		}
		goto find_lookup_success;
  80ad67:	e9 86 00 00 00       	jmp    80adf2 <FAT32_lookup+0x736>
			continue;
  80ad6c:	90                   	nop
  80ad6d:	eb 28                	jmp    80ad97 <FAT32_lookup+0x6db>
			continue;
  80ad6f:	90                   	nop
  80ad70:	eb 25                	jmp    80ad97 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80ad72:	90                   	nop
  80ad73:	eb 22                	jmp    80ad97 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80ad75:	90                   	nop
  80ad76:	eb 1f                	jmp    80ad97 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80ad78:	90                   	nop
  80ad79:	eb 1c                	jmp    80ad97 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80ad7b:	90                   	nop
  80ad7c:	eb 19                	jmp    80ad97 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80ad7e:	90                   	nop
  80ad7f:	eb 16                	jmp    80ad97 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80ad81:	90                   	nop
  80ad82:	eb 13                	jmp    80ad97 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80ad84:	90                   	nop
  80ad85:	eb 10                	jmp    80ad97 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  80ad87:	90                   	nop
  80ad88:	eb 0d                	jmp    80ad97 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  80ad8a:	90                   	nop
  80ad8b:	eb 0a                	jmp    80ad97 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  80ad8d:	90                   	nop
  80ad8e:	eb 07                	jmp    80ad97 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  80ad90:	90                   	nop
  80ad91:	eb 04                	jmp    80ad97 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80ad93:	90                   	nop
  80ad94:	eb 01                	jmp    80ad97 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80ad96:	90                   	nop
	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  80ad97:	83 45 f8 20          	add    DWORD PTR [rbp-0x8],0x20
  80ad9b:	48 83 45 e8 20       	add    QWORD PTR [rbp-0x18],0x20
  80ada0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80ada3:	48 63 d0             	movsxd rdx,eax
  80ada6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80adaa:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80adae:	48 39 c2             	cmp    rdx,rax
  80adb1:	0f 8c 4c fa ff ff    	jl     80a803 <FAT32_lookup+0x147>

continue_cmp_fail:;
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80adb7:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80adba:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80adbe:	89 d6                	mov    esi,edx
  80adc0:	48 89 c7             	mov    rdi,rax
  80adc3:	e8 2d e7 ff ff       	call   8094f5 <DISK1_FAT32_read_FAT_Entry>
  80adc8:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  80adcb:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  80add2:	77 05                	ja     80add9 <FAT32_lookup+0x71d>
		goto next_cluster;
  80add4:	e9 7f f9 ff ff       	jmp    80a758 <FAT32_lookup+0x9c>

	vmfree(buf);
  80add9:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80addd:	48 89 c7             	mov    rdi,rax
  80ade0:	e8 a7 64 ff ff       	call   80128c <vmfree>
	return NULL;
  80ade5:	b8 00 00 00 00       	mov    eax,0x0
  80adea:	e9 f0 01 00 00       	jmp    80afdf <FAT32_lookup+0x923>
				goto find_lookup_success;
  80adef:	90                   	nop
  80adf0:	eb 01                	jmp    80adf3 <FAT32_lookup+0x737>
		goto find_lookup_success;
  80adf2:	90                   	nop

find_lookup_success:
	p = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  80adf3:	be 00 00 00 00       	mov    esi,0x0
  80adf8:	bf 38 00 00 00       	mov    edi,0x38
  80adfd:	b8 00 00 00 00       	mov    eax,0x0
  80ae02:	e8 f6 63 ff ff       	call   8011fd <vmalloc>
  80ae07:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
	memset(p,0,sizeof(struct index_node));
  80ae0b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ae0f:	ba 38 00 00 00       	mov    edx,0x38
  80ae14:	be 00 00 00 00       	mov    esi,0x0
  80ae19:	48 89 c7             	mov    rdi,rax
  80ae1c:	e8 83 11 00 00       	call   80bfa4 <memset>
	p->file_size = tmpdentry->DIR_FileSize;
  80ae21:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ae25:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  80ae28:	89 c2                	mov    edx,eax
  80ae2a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ae2e:	48 89 10             	mov    QWORD PTR [rax],rdx
	p->blocks = (p->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  80ae31:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ae35:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80ae38:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80ae3c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80ae40:	48 01 d0             	add    rax,rdx
  80ae43:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  80ae47:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80ae4b:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80ae4f:	48 89 c1             	mov    rcx,rax
  80ae52:	48 89 d0             	mov    rax,rdx
  80ae55:	ba 00 00 00 00       	mov    edx,0x0
  80ae5a:	48 f7 f1             	div    rcx
  80ae5d:	48 89 c2             	mov    rdx,rax
  80ae60:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ae64:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	p->attribute = (tmpdentry->DIR_Attr & ATTR_DIRECTORY) ? FS_ATTR_DIR : FS_ATTR_FILE;
  80ae68:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ae6c:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80ae70:	0f b6 c0             	movzx  eax,al
  80ae73:	83 e0 10             	and    eax,0x10
  80ae76:	85 c0                	test   eax,eax
  80ae78:	74 07                	je     80ae81 <FAT32_lookup+0x7c5>
  80ae7a:	ba 02 00 00 00       	mov    edx,0x2
  80ae7f:	eb 05                	jmp    80ae86 <FAT32_lookup+0x7ca>
  80ae81:	ba 01 00 00 00       	mov    edx,0x1
  80ae86:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ae8a:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	p->sb = parent_inode->sb;
  80ae8e:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80ae92:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  80ae96:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ae9a:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	p->f_ops = &FAT32_file_ops;
  80ae9e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80aea2:	48 c7 40 20 a0 cb 80 	mov    QWORD PTR [rax+0x20],0x80cba0
  80aea9:	00 
	p->inode_ops = &FAT32_inode_ops;
  80aeaa:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80aeae:	48 c7 40 28 e0 cb 80 	mov    QWORD PTR [rax+0x28],0x80cbe0
  80aeb5:	00 

	p->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  80aeb6:	be 00 00 00 00       	mov    esi,0x0
  80aebb:	bf 20 00 00 00       	mov    edi,0x20
  80aec0:	b8 00 00 00 00       	mov    eax,0x0
  80aec5:	e8 33 63 ff ff       	call   8011fd <vmalloc>
  80aeca:	48 89 c2             	mov    rdx,rax
  80aecd:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80aed1:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(p->private_index_info,0,sizeof(struct FAT32_inode_info));
  80aed5:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80aed9:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aedd:	ba 20 00 00 00       	mov    edx,0x20
  80aee2:	be 00 00 00 00       	mov    esi,0x0
  80aee7:	48 89 c7             	mov    rdi,rax
  80aeea:	e8 b5 10 00 00       	call   80bfa4 <memset>
	finode = p->private_index_info;
  80aeef:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80aef3:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aef7:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax

	finode->first_cluster = (tmpdentry->DIR_FstClusHI<< 16 | tmpdentry->DIR_FstClusLO) & 0x0fffffff;
  80aefb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80aeff:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80af03:	0f b7 c0             	movzx  eax,ax
  80af06:	c1 e0 10             	shl    eax,0x10
  80af09:	89 c2                	mov    edx,eax
  80af0b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80af0f:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  80af13:	0f b7 c0             	movzx  eax,ax
  80af16:	09 d0                	or     eax,edx
  80af18:	48 98                	cdqe   
  80af1a:	25 ff ff ff 0f       	and    eax,0xfffffff
  80af1f:	48 89 c2             	mov    rdx,rax
  80af22:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80af26:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = cluster;
  80af29:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80af2c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80af30:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	finode->dentry_position = tmpdentry - (struct FAT32_Directory *)buf;
  80af34:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80af38:	48 2b 45 c0          	sub    rax,QWORD PTR [rbp-0x40]
  80af3c:	48 c1 f8 05          	sar    rax,0x5
  80af40:	48 89 c2             	mov    rdx,rax
  80af43:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80af47:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	finode->create_date = tmpdentry->DIR_CrtTime;
  80af4b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80af4f:	0f b7 50 0e          	movzx  edx,WORD PTR [rax+0xe]
  80af53:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80af57:	66 89 50 18          	mov    WORD PTR [rax+0x18],dx
	finode->create_time = tmpdentry->DIR_CrtDate;
  80af5b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80af5f:	0f b7 50 10          	movzx  edx,WORD PTR [rax+0x10]
  80af63:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80af67:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	finode->write_date = tmpdentry->DIR_WrtTime;
  80af6b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80af6f:	0f b7 50 16          	movzx  edx,WORD PTR [rax+0x16]
  80af73:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80af77:	66 89 50 1c          	mov    WORD PTR [rax+0x1c],dx
	finode->write_time = tmpdentry->DIR_WrtDate;
  80af7b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80af7f:	0f b7 50 18          	movzx  edx,WORD PTR [rax+0x18]
  80af83:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80af87:	66 89 50 1e          	mov    WORD PTR [rax+0x1e],dx

	if((tmpdentry->DIR_FstClusHI >> 12) && (p->attribute & FS_ATTR_FILE))
  80af8b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80af8f:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80af93:	66 c1 e8 0c          	shr    ax,0xc
  80af97:	66 85 c0             	test   ax,ax
  80af9a:	74 27                	je     80afc3 <FAT32_lookup+0x907>
  80af9c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80afa0:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80afa4:	83 e0 01             	and    eax,0x1
  80afa7:	48 85 c0             	test   rax,rax
  80afaa:	74 17                	je     80afc3 <FAT32_lookup+0x907>
	{
		p->attribute |= FS_ATTR_DEVICE;
  80afac:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80afb0:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80afb4:	48 83 c8 04          	or     rax,0x4
  80afb8:	48 89 c2             	mov    rdx,rax
  80afbb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80afbf:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	}

	dest_dentry->dir_inode = p;
  80afc3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80afc7:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80afcb:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	vmfree(buf);
  80afcf:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80afd3:	48 89 c7             	mov    rdi,rax
  80afd6:	e8 b1 62 ff ff       	call   80128c <vmfree>
	return dest_dentry;	
  80afdb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
}
  80afdf:	c9                   	leave  
  80afe0:	c3                   	ret    

000000000080afe1 <FAT32_mkdir>:


long FAT32_mkdir(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  80afe1:	f3 0f 1e fa          	endbr64 
  80afe5:	55                   	push   rbp
  80afe6:	48 89 e5             	mov    rbp,rsp
  80afe9:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80afed:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80aff1:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80aff4:	90                   	nop
  80aff5:	5d                   	pop    rbp
  80aff6:	c3                   	ret    

000000000080aff7 <FAT32_rmdir>:


long FAT32_rmdir(struct index_node * inode,struct dir_entry * dentry)
{}
  80aff7:	f3 0f 1e fa          	endbr64 
  80affb:	55                   	push   rbp
  80affc:	48 89 e5             	mov    rbp,rsp
  80afff:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80b003:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80b007:	90                   	nop
  80b008:	5d                   	pop    rbp
  80b009:	c3                   	ret    

000000000080b00a <FAT32_rename>:

long FAT32_rename(struct index_node * old_inode,struct dir_entry * old_dentry,struct index_node * new_inode,struct dir_entry * new_dentry)
{}
  80b00a:	f3 0f 1e fa          	endbr64 
  80b00e:	55                   	push   rbp
  80b00f:	48 89 e5             	mov    rbp,rsp
  80b012:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80b016:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80b01a:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80b01e:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  80b022:	90                   	nop
  80b023:	5d                   	pop    rbp
  80b024:	c3                   	ret    

000000000080b025 <FAT32_getattr>:

long FAT32_getattr(struct dir_entry * dentry,unsigned long * attr)
{}
  80b025:	f3 0f 1e fa          	endbr64 
  80b029:	55                   	push   rbp
  80b02a:	48 89 e5             	mov    rbp,rsp
  80b02d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80b031:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80b035:	90                   	nop
  80b036:	5d                   	pop    rbp
  80b037:	c3                   	ret    

000000000080b038 <FAT32_setattr>:

long FAT32_setattr(struct dir_entry * dentry,unsigned long * attr)
{}
  80b038:	f3 0f 1e fa          	endbr64 
  80b03c:	55                   	push   rbp
  80b03d:	48 89 e5             	mov    rbp,rsp
  80b040:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80b044:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80b048:	90                   	nop
  80b049:	5d                   	pop    rbp
  80b04a:	c3                   	ret    

000000000080b04b <FAT32_compare>:
	.setattr = FAT32_setattr,
};


//// these operation need cache and list
long FAT32_compare(struct dir_entry * parent_dentry,char * source_filename,char * destination_filename){}
  80b04b:	f3 0f 1e fa          	endbr64 
  80b04f:	55                   	push   rbp
  80b050:	48 89 e5             	mov    rbp,rsp
  80b053:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80b057:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80b05b:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80b05f:	90                   	nop
  80b060:	5d                   	pop    rbp
  80b061:	c3                   	ret    

000000000080b062 <FAT32_hash>:
long FAT32_hash(struct dir_entry * dentry,char * filename){}
  80b062:	f3 0f 1e fa          	endbr64 
  80b066:	55                   	push   rbp
  80b067:	48 89 e5             	mov    rbp,rsp
  80b06a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80b06e:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80b072:	90                   	nop
  80b073:	5d                   	pop    rbp
  80b074:	c3                   	ret    

000000000080b075 <FAT32_release>:
long FAT32_release(struct dir_entry * dentry){}
  80b075:	f3 0f 1e fa          	endbr64 
  80b079:	55                   	push   rbp
  80b07a:	48 89 e5             	mov    rbp,rsp
  80b07d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80b081:	90                   	nop
  80b082:	5d                   	pop    rbp
  80b083:	c3                   	ret    

000000000080b084 <FAT32_iput>:
long FAT32_iput(struct dir_entry * dentry,struct index_node * inode){}
  80b084:	f3 0f 1e fa          	endbr64 
  80b088:	55                   	push   rbp
  80b089:	48 89 e5             	mov    rbp,rsp
  80b08c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80b090:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80b094:	90                   	nop
  80b095:	5d                   	pop    rbp
  80b096:	c3                   	ret    

000000000080b097 <fat32_write_superblock>:
	.release = FAT32_release,
	.iput = FAT32_iput,
};


void fat32_write_superblock(struct super_block * sb){}
  80b097:	f3 0f 1e fa          	endbr64 
  80b09b:	55                   	push   rbp
  80b09c:	48 89 e5             	mov    rbp,rsp
  80b09f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80b0a3:	90                   	nop
  80b0a4:	5d                   	pop    rbp
  80b0a5:	c3                   	ret    

000000000080b0a6 <fat32_put_superblock>:

void fat32_put_superblock(struct super_block * sb)
{
  80b0a6:	f3 0f 1e fa          	endbr64 
  80b0aa:	55                   	push   rbp
  80b0ab:	48 89 e5             	mov    rbp,rsp
  80b0ae:	48 83 ec 10          	sub    rsp,0x10
  80b0b2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
	vmfree(sb->private_sb_info);
  80b0b6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b0ba:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80b0be:	48 89 c7             	mov    rdi,rax
  80b0c1:	e8 c6 61 ff ff       	call   80128c <vmfree>
	vmfree(sb->root->dir_inode->private_index_info);
  80b0c6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b0ca:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b0cd:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b0d1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b0d5:	48 89 c7             	mov    rdi,rax
  80b0d8:	e8 af 61 ff ff       	call   80128c <vmfree>
	vmfree(sb->root->dir_inode);
  80b0dd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b0e1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b0e4:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b0e8:	48 89 c7             	mov    rdi,rax
  80b0eb:	e8 9c 61 ff ff       	call   80128c <vmfree>
	vmfree(sb->root);
  80b0f0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b0f4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b0f7:	48 89 c7             	mov    rdi,rax
  80b0fa:	e8 8d 61 ff ff       	call   80128c <vmfree>
	vmfree(sb);
  80b0ff:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b103:	48 89 c7             	mov    rdi,rax
  80b106:	e8 81 61 ff ff       	call   80128c <vmfree>
}
  80b10b:	90                   	nop
  80b10c:	c9                   	leave  
  80b10d:	c3                   	ret    

000000000080b10e <fat32_write_inode>:

void fat32_write_inode(struct index_node * inode)
{
  80b10e:	f3 0f 1e fa          	endbr64 
  80b112:	55                   	push   rbp
  80b113:	48 89 e5             	mov    rbp,rsp
  80b116:	48 83 ec 40          	sub    rsp,0x40
  80b11a:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
	struct FAT32_Directory * fdentry = NULL;
  80b11e:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80b125:	00 
	struct FAT32_Directory * buf = NULL;
  80b126:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80b12d:	00 
	struct FAT32_inode_info * finode = inode->private_index_info;
  80b12e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b132:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b136:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	struct FAT32_sb_info * fsbi = inode->sb->private_sb_info;
  80b13a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b13e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80b142:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80b146:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	unsigned long sector = 0;
  80b14a:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  80b151:	00 

	if(finode->dentry_location == 0)
  80b152:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b156:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80b15a:	48 85 c0             	test   rax,rax
  80b15d:	75 14                	jne    80b173 <fat32_write_inode+0x65>
	{
		printf("FS ERROR:write root inode!\n");	
  80b15f:	bf 2c 4c 81 00       	mov    edi,0x814c2c
  80b164:	b8 00 00 00 00       	mov    eax,0x0
  80b169:	e8 b9 5b ff ff       	call   800d27 <printf>
		return ;
  80b16e:	e9 30 01 00 00       	jmp    80b2a3 <fat32_write_inode+0x195>
	}

	sector = fsbi->Data_firstsector + (finode->dentry_location - 2) * fsbi->sector_per_cluster;
  80b173:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b177:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  80b17b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b17f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80b183:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  80b187:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b18b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80b18f:	48 0f af c2          	imul   rax,rdx
  80b193:	48 01 c8             	add    rax,rcx
  80b196:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	buf = (struct FAT32_Directory *)vmalloc(fsbi->bytes_per_cluster,0);
  80b19a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b19e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80b1a2:	be 00 00 00 00       	mov    esi,0x0
  80b1a7:	48 89 c7             	mov    rdi,rax
  80b1aa:	b8 00 00 00 00       	mov    eax,0x0
  80b1af:	e8 49 60 ff ff       	call   8011fd <vmalloc>
  80b1b4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	memset(buf,0,fsbi->bytes_per_cluster);
  80b1b8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b1bc:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80b1c0:	89 c2                	mov    edx,eax
  80b1c2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b1c6:	be 00 00 00 00       	mov    esi,0x0
  80b1cb:	48 89 c7             	mov    rdi,rax
  80b1ce:	e8 d1 0d 00 00       	call   80bfa4 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80b1d3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b1d7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80b1db:	89 c1                	mov    ecx,eax
  80b1dd:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80b1e1:	89 c2                	mov    edx,eax
  80b1e3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b1e7:	49 89 c0             	mov    r8,rax
  80b1ea:	be 00 00 00 00       	mov    esi,0x0
  80b1ef:	bf 00 00 00 00       	mov    edi,0x0
  80b1f4:	e8 54 d6 ff ff       	call   80884d <request>
  80b1f9:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    chk_result(r);
  80b1fc:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80b1ff:	89 c7                	mov    edi,eax
  80b201:	e8 fb dc ff ff       	call   808f01 <chk_result>
    fdentry = buf+finode->dentry_position;
  80b206:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b20a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80b20e:	48 c1 e0 05          	shl    rax,0x5
  80b212:	48 89 c2             	mov    rdx,rax
  80b215:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b219:	48 01 d0             	add    rax,rdx
  80b21c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

	////alert fat32 dentry data
	fdentry->DIR_FileSize = inode->file_size;
  80b220:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b224:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b227:	89 c2                	mov    edx,eax
  80b229:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b22d:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
	fdentry->DIR_FstClusLO = finode->first_cluster & 0xffff;
  80b230:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b234:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b237:	89 c2                	mov    edx,eax
  80b239:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b23d:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	fdentry->DIR_FstClusHI = (fdentry->DIR_FstClusHI & 0xf000) | (finode->first_cluster >> 16);
  80b241:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b245:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80b249:	66 25 00 f0          	and    ax,0xf000
  80b24d:	89 c2                	mov    edx,eax
  80b24f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b253:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b256:	48 c1 e8 10          	shr    rax,0x10
  80b25a:	09 c2                	or     edx,eax
  80b25c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b260:	66 89 50 14          	mov    WORD PTR [rax+0x14],dx

	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80b264:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b268:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80b26c:	89 c1                	mov    ecx,eax
  80b26e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80b272:	89 c2                	mov    edx,eax
  80b274:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b278:	49 89 c0             	mov    r8,rax
  80b27b:	be 01 00 00 00       	mov    esi,0x1
  80b280:	bf 00 00 00 00       	mov    edi,0x0
  80b285:	e8 c3 d5 ff ff       	call   80884d <request>
  80b28a:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    chk_result(r1);
  80b28d:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
  80b290:	89 c7                	mov    edi,eax
  80b292:	e8 6a dc ff ff       	call   808f01 <chk_result>
	vmfree(buf);
  80b297:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b29b:	48 89 c7             	mov    rdi,rax
  80b29e:	e8 e9 5f ff ff       	call   80128c <vmfree>
}
  80b2a3:	c9                   	leave  
  80b2a4:	c3                   	ret    

000000000080b2a5 <fat32_read_superblock>:

	.write_inode = fat32_write_inode,
};

struct super_block * fat32_read_superblock(struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  80b2a5:	f3 0f 1e fa          	endbr64 
  80b2a9:	55                   	push   rbp
  80b2aa:	48 89 e5             	mov    rbp,rsp
  80b2ad:	48 83 ec 50          	sub    rsp,0x50
  80b2b1:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  80b2b5:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
	struct super_block * sbp = NULL;
  80b2b9:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80b2c0:	00 
	struct FAT32_inode_info * finode = NULL;
  80b2c1:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80b2c8:	00 
	struct FAT32_BootSector * fbs = NULL;
  80b2c9:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80b2d0:	00 
	struct FAT32_sb_info * fsbi = NULL;
  80b2d1:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80b2d8:	00 

	////super block
	sbp = (struct super_block *)vmalloc(sizeof(struct super_block),0);
  80b2d9:	be 00 00 00 00       	mov    esi,0x0
  80b2de:	bf 18 00 00 00       	mov    edi,0x18
  80b2e3:	b8 00 00 00 00       	mov    eax,0x0
  80b2e8:	e8 10 5f ff ff       	call   8011fd <vmalloc>
  80b2ed:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	memset(sbp,0,sizeof(struct super_block));
  80b2f1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b2f5:	ba 18 00 00 00       	mov    edx,0x18
  80b2fa:	be 00 00 00 00       	mov    esi,0x0
  80b2ff:	48 89 c7             	mov    rdi,rax
  80b302:	e8 9d 0c 00 00       	call   80bfa4 <memset>

	sbp->sb_ops = &FAT32_sb_ops;
  80b307:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b30b:	48 c7 40 08 40 cc 80 	mov    QWORD PTR [rax+0x8],0x80cc40
  80b312:	00 
	sbp->private_sb_info = (struct FAT32_sb_info *)vmalloc(sizeof(struct FAT32_sb_info),0);
  80b313:	be 00 00 00 00       	mov    esi,0x0
  80b318:	bf 60 00 00 00       	mov    edi,0x60
  80b31d:	b8 00 00 00 00       	mov    eax,0x0
  80b322:	e8 d6 5e ff ff       	call   8011fd <vmalloc>
  80b327:	48 89 c2             	mov    rdx,rax
  80b32a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b32e:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	memset(sbp->private_sb_info,0,sizeof(struct FAT32_sb_info));
  80b332:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b336:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80b33a:	ba 60 00 00 00       	mov    edx,0x60
  80b33f:	be 00 00 00 00       	mov    esi,0x0
  80b344:	48 89 c7             	mov    rdi,rax
  80b347:	e8 58 0c 00 00       	call   80bfa4 <memset>

	////fat32 boot sector
	fbs = (struct FAT32_BootSector *)buf;
  80b34c:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80b350:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
 	fsbi = sbp->private_sb_info;
  80b354:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b358:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80b35c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	fsbi->start_sector = DPTE->start_LBA;
  80b360:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b364:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b367:	89 c2                	mov    edx,eax
  80b369:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b36d:	48 89 10             	mov    QWORD PTR [rax],rdx
	fsbi->sector_count = DPTE->sectors_limit;
  80b370:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b374:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80b377:	89 c2                	mov    edx,eax
  80b379:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b37d:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	fsbi->sector_per_cluster = fbs->BPB_SecPerClus;
  80b381:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b385:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  80b389:	0f b6 d0             	movzx  edx,al
  80b38c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b390:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	fsbi->bytes_per_cluster = fbs->BPB_SecPerClus * fbs->BPB_BytesPerSec;
  80b394:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b398:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  80b39c:	0f b6 d0             	movzx  edx,al
  80b39f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b3a3:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  80b3a7:	0f b7 c0             	movzx  eax,ax
  80b3aa:	0f af c2             	imul   eax,edx
  80b3ad:	48 63 d0             	movsxd rdx,eax
  80b3b0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b3b4:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	fsbi->bytes_per_sector = fbs->BPB_BytesPerSec;
  80b3b8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b3bc:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  80b3c0:	0f b7 d0             	movzx  edx,ax
  80b3c3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b3c7:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
	fsbi->Data_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt + fbs->BPB_FATSz32 * fbs->BPB_NumFATs;
  80b3cb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b3cf:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80b3d2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b3d6:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  80b3da:	0f b7 c0             	movzx  eax,ax
  80b3dd:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  80b3e0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b3e4:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  80b3e7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b3eb:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  80b3ef:	0f b6 c0             	movzx  eax,al
  80b3f2:	0f af c2             	imul   eax,edx
  80b3f5:	01 c8                	add    eax,ecx
  80b3f7:	89 c2                	mov    edx,eax
  80b3f9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b3fd:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
	fsbi->FAT1_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt;
  80b401:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b405:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80b408:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b40c:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  80b410:	0f b7 c0             	movzx  eax,ax
  80b413:	01 d0                	add    eax,edx
  80b415:	89 c2                	mov    edx,eax
  80b417:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b41b:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	fsbi->sector_per_FAT = fbs->BPB_FATSz32;
  80b41f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b423:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  80b426:	89 c2                	mov    edx,eax
  80b428:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b42c:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
	fsbi->NumFATs = fbs->BPB_NumFATs;
  80b430:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b434:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  80b438:	0f b6 d0             	movzx  edx,al
  80b43b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b43f:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
	fsbi->fsinfo_sector_infat = fbs->BPB_FSInfo;
  80b443:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b447:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80b44b:	0f b7 d0             	movzx  edx,ax
  80b44e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b452:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
	fsbi->bootsector_bk_infat = fbs->BPB_BkBootSec;	
  80b456:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b45a:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  80b45e:	0f b7 d0             	movzx  edx,ax
  80b461:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b465:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
	
	printf("FAT32 Boot Sector\n\tBPB_FSInfo:%x\n\tBPB_BkBootSec:%x\n\tBPB_TotSec32:%x\n",fbs->BPB_FSInfo,fbs->BPB_BkBootSec,fbs->BPB_TotSec32);
  80b469:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b46d:	8b 48 20             	mov    ecx,DWORD PTR [rax+0x20]
  80b470:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b474:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  80b478:	0f b7 d0             	movzx  edx,ax
  80b47b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b47f:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80b483:	0f b7 c0             	movzx  eax,ax
  80b486:	89 c6                	mov    esi,eax
  80b488:	bf 48 4c 81 00       	mov    edi,0x814c48
  80b48d:	b8 00 00 00 00       	mov    eax,0x0
  80b492:	e8 90 58 ff ff       	call   800d27 <printf>
	
	////fat32 fsinfo sector
	fsbi->fat_fsinfo = (struct FAT32_FSInfo *)vmalloc(sizeof(struct FAT32_FSInfo),0);
  80b497:	be 00 00 00 00       	mov    esi,0x0
  80b49c:	bf 00 02 00 00       	mov    edi,0x200
  80b4a1:	b8 00 00 00 00       	mov    eax,0x0
  80b4a6:	e8 52 5d ff ff       	call   8011fd <vmalloc>
  80b4ab:	48 89 c2             	mov    rdx,rax
  80b4ae:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b4b2:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
	memset(fsbi->fat_fsinfo,0,512);
  80b4b6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b4ba:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80b4be:	ba 00 02 00 00       	mov    edx,0x200
  80b4c3:	be 00 00 00 00       	mov    esi,0x0
  80b4c8:	48 89 c7             	mov    rdi,rax
  80b4cb:	e8 d4 0a 00 00       	call   80bfa4 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPTE->start_LBA + fbs->BPB_FSInfo,1,(unsigned char *)fsbi->fat_fsinfo);
  80b4d0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b4d4:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  80b4d8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b4dc:	8b 48 08             	mov    ecx,DWORD PTR [rax+0x8]
  80b4df:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b4e3:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80b4e7:	0f b7 c0             	movzx  eax,ax
  80b4ea:	01 c8                	add    eax,ecx
  80b4ec:	49 89 d0             	mov    r8,rdx
  80b4ef:	b9 01 00 00 00       	mov    ecx,0x1
  80b4f4:	89 c2                	mov    edx,eax
  80b4f6:	be 00 00 00 00       	mov    esi,0x0
  80b4fb:	bf 00 00 00 00       	mov    edi,0x0
  80b500:	e8 48 d3 ff ff       	call   80884d <request>
  80b505:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    chk_result(r);
  80b508:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80b50b:	89 c7                	mov    edi,eax
  80b50d:	e8 ef d9 ff ff       	call   808f01 <chk_result>
	printf("FAT32 FSInfo\n\tFSI_LeadSig:%x\n\tFSI_StrucSig:%x\n\tFSI_Free_Count:%x\n",fsbi->fat_fsinfo->FSI_LeadSig,fsbi->fat_fsinfo->FSI_StrucSig,fsbi->fat_fsinfo->FSI_Free_Count);
  80b512:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b516:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80b51a:	8b 88 e8 01 00 00    	mov    ecx,DWORD PTR [rax+0x1e8]
  80b520:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b524:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80b528:	8b 90 e4 01 00 00    	mov    edx,DWORD PTR [rax+0x1e4]
  80b52e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b532:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80b536:	8b 00                	mov    eax,DWORD PTR [rax]
  80b538:	89 c6                	mov    esi,eax
  80b53a:	bf 90 4c 81 00       	mov    edi,0x814c90
  80b53f:	b8 00 00 00 00       	mov    eax,0x0
  80b544:	e8 de 57 ff ff       	call   800d27 <printf>
	
	////directory entry
	sbp->root = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  80b549:	be 00 00 00 00       	mov    esi,0x0
  80b54e:	bf 48 00 00 00       	mov    edi,0x48
  80b553:	b8 00 00 00 00       	mov    eax,0x0
  80b558:	e8 a0 5c ff ff       	call   8011fd <vmalloc>
  80b55d:	48 89 c2             	mov    rdx,rax
  80b560:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b564:	48 89 10             	mov    QWORD PTR [rax],rdx
	memset(sbp->root,0,sizeof(struct dir_entry));
  80b567:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b56b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b56e:	ba 48 00 00 00       	mov    edx,0x48
  80b573:	be 00 00 00 00       	mov    esi,0x0
  80b578:	48 89 c7             	mov    rdi,rax
  80b57b:	e8 24 0a 00 00       	call   80bfa4 <memset>

	list_init(&sbp->root->child_node);
  80b580:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b584:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b587:	48 83 c0 10          	add    rax,0x10
  80b58b:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    list->prev = list;
  80b58f:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b593:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80b597:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  80b59a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b59e:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80b5a2:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  80b5a6:	90                   	nop
	list_init(&sbp->root->subdirs_list);
  80b5a7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b5ab:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b5ae:	48 83 c0 20          	add    rax,0x20
  80b5b2:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    list->prev = list;
  80b5b6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b5ba:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80b5be:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  80b5c1:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b5c5:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80b5c9:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  80b5cd:	90                   	nop
	sbp->root->parent = sbp->root;
  80b5ce:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b5d2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b5d5:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80b5d9:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  80b5dc:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
	sbp->root->dir_ops = &FAT32_dentry_ops;
  80b5e0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b5e4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b5e7:	48 c7 40 40 20 cc 80 	mov    QWORD PTR [rax+0x40],0x80cc20
  80b5ee:	00 
	sbp->root->name = (char *)vmalloc(2,0);
  80b5ef:	be 00 00 00 00       	mov    esi,0x0
  80b5f4:	bf 02 00 00 00       	mov    edi,0x2
  80b5f9:	b8 00 00 00 00       	mov    eax,0x0
  80b5fe:	e8 fa 5b ff ff       	call   8011fd <vmalloc>
  80b603:	48 89 c2             	mov    rdx,rax
  80b606:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b60a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b60d:	48 89 10             	mov    QWORD PTR [rax],rdx
	sbp->root->name[0] = '/';
  80b610:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b614:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b617:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b61a:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
	sbp->root->name_length = 1;
  80b61d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b621:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b624:	c7 40 08 01 00 00 00 	mov    DWORD PTR [rax+0x8],0x1

	////index node
	sbp->root->dir_inode = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  80b62b:	be 00 00 00 00       	mov    esi,0x0
  80b630:	bf 38 00 00 00       	mov    edi,0x38
  80b635:	b8 00 00 00 00       	mov    eax,0x0
  80b63a:	e8 be 5b ff ff       	call   8011fd <vmalloc>
  80b63f:	48 89 c2             	mov    rdx,rax
  80b642:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b646:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b649:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(sbp->root->dir_inode,0,sizeof(struct index_node));
  80b64d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b651:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b654:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b658:	ba 38 00 00 00       	mov    edx,0x38
  80b65d:	be 00 00 00 00       	mov    esi,0x0
  80b662:	48 89 c7             	mov    rdi,rax
  80b665:	e8 3a 09 00 00       	call   80bfa4 <memset>
	sbp->root->dir_inode->inode_ops = &FAT32_inode_ops;
  80b66a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b66e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b671:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b675:	48 c7 40 28 e0 cb 80 	mov    QWORD PTR [rax+0x28],0x80cbe0
  80b67c:	00 
	sbp->root->dir_inode->f_ops = &FAT32_file_ops;
  80b67d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b681:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b684:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b688:	48 c7 40 20 a0 cb 80 	mov    QWORD PTR [rax+0x20],0x80cba0
  80b68f:	00 
	sbp->root->dir_inode->file_size = 0;
  80b690:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b694:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b697:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b69b:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
	sbp->root->dir_inode->blocks = (sbp->root->dir_inode->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  80b6a2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b6a6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b6a9:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b6ad:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80b6b0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b6b4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80b6b8:	48 01 d0             	add    rax,rdx
  80b6bb:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  80b6bf:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b6c3:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80b6c7:	48 89 c6             	mov    rsi,rax
  80b6ca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b6ce:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b6d1:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  80b6d5:	48 89 d0             	mov    rax,rdx
  80b6d8:	ba 00 00 00 00       	mov    edx,0x0
  80b6dd:	48 f7 f6             	div    rsi
  80b6e0:	48 89 41 08          	mov    QWORD PTR [rcx+0x8],rax
	sbp->root->dir_inode->attribute = FS_ATTR_DIR;
  80b6e4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b6e8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b6eb:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b6ef:	48 c7 40 10 02 00 00 	mov    QWORD PTR [rax+0x10],0x2
  80b6f6:	00 
	sbp->root->dir_inode->sb = sbp;
  80b6f7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b6fb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b6fe:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b702:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80b706:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx

	////fat32 root inode
	sbp->root->dir_inode->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  80b70a:	be 00 00 00 00       	mov    esi,0x0
  80b70f:	bf 20 00 00 00       	mov    edi,0x20
  80b714:	b8 00 00 00 00       	mov    eax,0x0
  80b719:	e8 df 5a ff ff       	call   8011fd <vmalloc>
  80b71e:	48 89 c2             	mov    rdx,rax
  80b721:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b725:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b728:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b72c:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(sbp->root->dir_inode->private_index_info,0,sizeof(struct FAT32_inode_info));
  80b730:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b734:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b737:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b73b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b73f:	ba 20 00 00 00       	mov    edx,0x20
  80b744:	be 00 00 00 00       	mov    esi,0x0
  80b749:	48 89 c7             	mov    rdi,rax
  80b74c:	e8 53 08 00 00       	call   80bfa4 <memset>
	finode = (struct FAT32_inode_info *)sbp->root->dir_inode->private_index_info;
  80b751:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b755:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b758:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b75c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b760:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	finode->first_cluster = fbs->BPB_RootClus;
  80b764:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b768:	8b 40 2c             	mov    eax,DWORD PTR [rax+0x2c]
  80b76b:	89 c2                	mov    edx,eax
  80b76d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b771:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = 0;
  80b774:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b778:	48 c7 40 08 00 00 00 	mov    QWORD PTR [rax+0x8],0x0
  80b77f:	00 
	finode->dentry_position = 0; 
  80b780:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b784:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  80b78b:	00 
	finode->create_date = 0;
  80b78c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b790:	66 c7 40 18 00 00    	mov    WORD PTR [rax+0x18],0x0
	finode->create_time = 0;
  80b796:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b79a:	66 c7 40 1a 00 00    	mov    WORD PTR [rax+0x1a],0x0
	finode->write_date = 0;
  80b7a0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b7a4:	66 c7 40 1c 00 00    	mov    WORD PTR [rax+0x1c],0x0
	finode->write_time = 0;
  80b7aa:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b7ae:	66 c7 40 1e 00 00    	mov    WORD PTR [rax+0x1e],0x0

	return sbp;
  80b7b4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80b7b8:	c9                   	leave  
  80b7b9:	c3                   	ret    

000000000080b7ba <DISK1_FAT32_FS_init>:
	.read_superblock = fat32_read_superblock,
	.next = NULL,
};

void DISK1_FAT32_FS_init()
{
  80b7ba:	f3 0f 1e fa          	endbr64 
  80b7be:	55                   	push   rbp
  80b7bf:	48 89 e5             	mov    rbp,rsp
  80b7c2:	48 81 ec 10 04 00 00 	sub    rsp,0x410
	int i;
	unsigned char buf[512];
	struct dir_entry * dentry = NULL;
  80b7c9:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80b7d0:	00 
	struct Disk_Partition_Table DPT = {0};
  80b7d1:	48 8d 95 f0 fb ff ff 	lea    rdx,[rbp-0x410]
  80b7d8:	b8 00 00 00 00       	mov    eax,0x0
  80b7dd:	b9 40 00 00 00       	mov    ecx,0x40
  80b7e2:	48 89 d7             	mov    rdi,rdx
  80b7e5:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax

	register_filesystem(&FAT32_fs_type);
  80b7e8:	bf 60 cc 80 00       	mov    edi,0x80cc60
  80b7ed:	e8 fd bf ff ff       	call   8077ef <register_filesystem>
	
	memset(buf,0,512);
  80b7f2:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80b7f9:	ba 00 02 00 00       	mov    edx,0x200
  80b7fe:	be 00 00 00 00       	mov    esi,0x0
  80b803:	48 89 c7             	mov    rdi,rax
  80b806:	e8 99 07 00 00       	call   80bfa4 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,0x0,1,(unsigned char *)buf);
  80b80b:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80b812:	49 89 c0             	mov    r8,rax
  80b815:	b9 01 00 00 00       	mov    ecx,0x1
  80b81a:	ba 00 00 00 00       	mov    edx,0x0
  80b81f:	be 00 00 00 00       	mov    esi,0x0
  80b824:	bf 00 00 00 00       	mov    edi,0x0
  80b829:	e8 1f d0 ff ff       	call   80884d <request>
  80b82e:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    chk_result(r);
  80b831:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b834:	89 c7                	mov    edi,eax
  80b836:	e8 c6 d6 ff ff       	call   808f01 <chk_result>
    DPT = *(struct Disk_Partition_Table *)buf;
  80b83b:	48 8d 95 f0 fd ff ff 	lea    rdx,[rbp-0x210]
  80b842:	48 8d 85 f0 fb ff ff 	lea    rax,[rbp-0x410]
  80b849:	48 89 d6             	mov    rsi,rdx
  80b84c:	ba 40 00 00 00       	mov    edx,0x40
  80b851:	48 89 c7             	mov    rdi,rax
  80b854:	48 89 d1             	mov    rcx,rdx
  80b857:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
	printf("DPTE[0] start_LBA:%x\ttype:%x\n",DPT.DPTE[0].start_LBA,DPT.DPTE[0].type);
  80b85a:	0f b6 85 b2 fd ff ff 	movzx  eax,BYTE PTR [rbp-0x24e]
  80b861:	0f b6 d0             	movzx  edx,al
  80b864:	8b 85 b6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x24a]
  80b86a:	89 c6                	mov    esi,eax
  80b86c:	bf d8 4c 81 00       	mov    edi,0x814cd8
  80b871:	b8 00 00 00 00       	mov    eax,0x0
  80b876:	e8 ac 54 ff ff       	call   800d27 <printf>

	memset(buf,0,512);
  80b87b:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80b882:	ba 00 02 00 00       	mov    edx,0x200
  80b887:	be 00 00 00 00       	mov    esi,0x0
  80b88c:	48 89 c7             	mov    rdi,rax
  80b88f:	e8 10 07 00 00       	call   80bfa4 <memset>
	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPT.DPTE[0].start_LBA,1,(unsigned char *)buf);
  80b894:	8b 85 b6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x24a]
  80b89a:	89 c2                	mov    edx,eax
  80b89c:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80b8a3:	49 89 c0             	mov    r8,rax
  80b8a6:	b9 01 00 00 00       	mov    ecx,0x1
  80b8ab:	be 00 00 00 00       	mov    esi,0x0
  80b8b0:	bf 00 00 00 00       	mov    edi,0x0
  80b8b5:	e8 93 cf ff ff       	call   80884d <request>
  80b8ba:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    chk_result(r1);
  80b8bd:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80b8c0:	89 c7                	mov    edi,eax
  80b8c2:	e8 3a d6 ff ff       	call   808f01 <chk_result>

	root_sb = mount_fs("FAT32",&DPT.DPTE[0],buf);	//not dev node
  80b8c7:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80b8ce:	48 8d 95 f0 fb ff ff 	lea    rdx,[rbp-0x410]
  80b8d5:	48 8d 8a be 01 00 00 	lea    rcx,[rdx+0x1be]
  80b8dc:	48 89 c2             	mov    rdx,rax
  80b8df:	48 89 ce             	mov    rsi,rcx
  80b8e2:	bf d2 4c 81 00       	mov    edi,0x814cd2
  80b8e7:	e8 8b be ff ff       	call   807777 <mount_fs>
  80b8ec:	48 89 05 b5 cd c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1cdb5],rax        # 4286a8 <root_sb>
}
  80b8f3:	90                   	nop
  80b8f4:	c9                   	leave  
  80b8f5:	c3                   	ret    

000000000080b8f6 <close_tty>:
int stdd=0;
struct file_operations tty_fops={
        .open=init_tty, .close=close_tty,.write=write_tty,.read=read_tty,.ioctl=tty_do_req
};

long close_tty(struct index_node * inode,struct file * filp){
  80b8f6:	f3 0f 1e fa          	endbr64 
  80b8fa:	55                   	push   rbp
  80b8fb:	48 89 e5             	mov    rbp,rsp
  80b8fe:	48 83 ec 30          	sub    rsp,0x30
  80b902:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80b906:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    stdbuf_t * bi=&((tty_t*)filp->private_data)->stdin_buf;
  80b90a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b90e:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80b912:	48 83 c0 18          	add    rax,0x18
  80b916:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    stdbuf_t * bo=&((tty_t*)filp->private_data)->stdout_buf;
  80b91a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b91e:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80b922:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    stdbuf_t * be=&((tty_t*)filp->private_data)->stderr_buf;
  80b926:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b92a:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80b92e:	48 83 c0 30          	add    rax,0x30
  80b932:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    vmfree((addr_t)bi);
  80b936:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b93a:	48 89 c7             	mov    rdi,rax
  80b93d:	e8 4a 59 ff ff       	call   80128c <vmfree>
    vmfree((addr_t)bo);
  80b942:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b946:	48 89 c7             	mov    rdi,rax
  80b949:	e8 3e 59 ff ff       	call   80128c <vmfree>
    vmfree((addr_t)be);
  80b94e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b952:	48 89 c7             	mov    rdi,rax
  80b955:	e8 32 59 ff ff       	call   80128c <vmfree>
    vmfree((addr_t)filp->private_data);
  80b95a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b95e:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80b962:	48 89 c7             	mov    rdi,rax
  80b965:	e8 22 59 ff ff       	call   80128c <vmfree>
    return 0;
  80b96a:	b8 00 00 00 00       	mov    eax,0x0
}
  80b96f:	c9                   	leave  
  80b970:	c3                   	ret    

000000000080b971 <init_tty>:
//打开文件
long init_tty(struct index_node * inode,struct file * filp)
{
  80b971:	f3 0f 1e fa          	endbr64 
  80b975:	55                   	push   rbp
  80b976:	48 89 e5             	mov    rbp,rsp
  80b979:	48 83 ec 20          	sub    rsp,0x20
  80b97d:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80b981:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    tty_t *ntty=(tty_t*)vmalloc();
  80b985:	b8 00 00 00 00       	mov    eax,0x0
  80b98a:	e8 6e 58 ff ff       	call   8011fd <vmalloc>
  80b98f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //创建三个缓冲区
    ntty->stdin_buf.data= (char*)vmalloc();
  80b993:	b8 00 00 00 00       	mov    eax,0x0
  80b998:	e8 60 58 ff ff       	call   8011fd <vmalloc>
  80b99d:	48 89 c2             	mov    rdx,rax
  80b9a0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b9a4:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    ntty->stdout_buf.data=(char*)vmalloc();
  80b9a8:	b8 00 00 00 00       	mov    eax,0x0
  80b9ad:	e8 4b 58 ff ff       	call   8011fd <vmalloc>
  80b9b2:	48 89 c2             	mov    rdx,rax
  80b9b5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b9b9:	48 89 10             	mov    QWORD PTR [rax],rdx
    ntty->stderr_buf.data=(char*)vmalloc();
  80b9bc:	b8 00 00 00 00       	mov    eax,0x0
  80b9c1:	e8 37 58 ff ff       	call   8011fd <vmalloc>
  80b9c6:	48 89 c2             	mov    rdx,rax
  80b9c9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b9cd:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
    ntty->stdin_buf. wptr= 0;
  80b9d1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b9d5:	c7 40 20 00 00 00 00 	mov    DWORD PTR [rax+0x20],0x0
    ntty->stdout_buf.wptr= 0;
  80b9dc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b9e0:	c7 40 08 00 00 00 00 	mov    DWORD PTR [rax+0x8],0x0
    ntty->stderr_buf.wptr= 0;
  80b9e7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b9eb:	c7 40 38 00 00 00 00 	mov    DWORD PTR [rax+0x38],0x0
    ntty->stdin_buf. rptr= 0;
  80b9f2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b9f6:	c7 40 24 00 00 00 00 	mov    DWORD PTR [rax+0x24],0x0
    ntty->stdout_buf.rptr= 0;
  80b9fd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ba01:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [rax+0xc],0x0
    ntty->stderr_buf.rptr= 0;
  80ba08:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ba0c:	c7 40 3c 00 00 00 00 	mov    DWORD PTR [rax+0x3c],0x0
    ntty->stdin_buf.size= PAGE_4K_SIZE;
  80ba13:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ba17:	c7 40 28 00 10 00 00 	mov    DWORD PTR [rax+0x28],0x1000
    ntty->stdout_buf.size= PAGE_4K_SIZE;
  80ba1e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ba22:	c7 40 10 00 10 00 00 	mov    DWORD PTR [rax+0x10],0x1000
    ntty->stderr_buf.size= PAGE_4K_SIZE;
  80ba29:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ba2d:	c7 40 40 00 10 00 00 	mov    DWORD PTR [rax+0x40],0x1000
    //设置inode文件操作方式为tty方式
    inode->f_ops=&tty_fops;
  80ba34:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ba38:	48 c7 40 20 80 cc 80 	mov    QWORD PTR [rax+0x20],0x80cc80
  80ba3f:	00 
    filp->f_ops=&tty_fops;
  80ba40:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ba44:	48 c7 40 18 80 cc 80 	mov    QWORD PTR [rax+0x18],0x80cc80
  80ba4b:	00 
    filp->private_data=ntty;
  80ba4c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ba50:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80ba54:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
    return 0;
  80ba58:	b8 00 00 00 00       	mov    eax,0x0
}
  80ba5d:	c9                   	leave  
  80ba5e:	c3                   	ret    

000000000080ba5f <read_tty>:

long read_tty(struct file * filp,char * buf,unsigned long count,long * position)
{
  80ba5f:	f3 0f 1e fa          	endbr64 
  80ba63:	55                   	push   rbp
  80ba64:	48 89 e5             	mov    rbp,rsp
  80ba67:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80ba6b:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80ba6f:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  80ba73:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
    stdbuf_t * b=&((tty_t*)filp->private_data)->stdin_buf;
  80ba77:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ba7b:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80ba7f:	48 83 c0 18          	add    rax,0x18
  80ba83:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int i=0;
  80ba87:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while (i<count){
  80ba8e:	eb 5a                	jmp    80baea <read_tty+0x8b>
        if(b->rptr==b->size)
  80ba90:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ba94:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  80ba97:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ba9b:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80ba9e:	39 c2                	cmp    edx,eax
  80baa0:	75 0b                	jne    80baad <read_tty+0x4e>
            b->rptr=0;
  80baa2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80baa6:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [rax+0xc],0x0
        buf[i++]=b->data[b->rptr];
  80baad:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bab1:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80bab4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bab8:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80babb:	48 98                	cdqe   
  80babd:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80bac1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bac4:	8d 50 01             	lea    edx,[rax+0x1]
  80bac7:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80baca:	48 63 d0             	movsxd rdx,eax
  80bacd:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80bad1:	48 01 c2             	add    rdx,rax
  80bad4:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
  80bad7:	88 02                	mov    BYTE PTR [rdx],al
        b->rptr++;
  80bad9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80badd:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80bae0:	8d 50 01             	lea    edx,[rax+0x1]
  80bae3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bae7:	89 50 0c             	mov    DWORD PTR [rax+0xc],edx
    while (i<count){
  80baea:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80baed:	48 98                	cdqe   
  80baef:	48 39 45 d8          	cmp    QWORD PTR [rbp-0x28],rax
  80baf3:	77 9b                	ja     80ba90 <read_tty+0x31>
    }
}
  80baf5:	90                   	nop
  80baf6:	5d                   	pop    rbp
  80baf7:	c3                   	ret    

000000000080baf8 <write_tty>:
long write_tty(struct file * filp,char * buf,unsigned long count,long * position)
{
  80baf8:	f3 0f 1e fa          	endbr64 
  80bafc:	55                   	push   rbp
  80bafd:	48 89 e5             	mov    rbp,rsp
  80bb00:	48 83 ec 40          	sub    rsp,0x40
  80bb04:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80bb08:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  80bb0c:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  80bb10:	48 89 4d c0          	mov    QWORD PTR [rbp-0x40],rcx
    stdbuf_t * b=&((tty_t*)filp->private_data)->stdout_buf;
  80bb14:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80bb18:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80bb1c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int i=0;
  80bb20:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    int saved_wptr=b->wptr;
  80bb27:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bb2b:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80bb2e:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    while (i<count){
  80bb31:	eb 5a                	jmp    80bb8d <write_tty+0x95>
        if(b->wptr==b->size)
  80bb33:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bb37:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80bb3a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bb3e:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80bb41:	39 c2                	cmp    edx,eax
  80bb43:	75 0b                	jne    80bb50 <write_tty+0x58>
            b->wptr=0;
  80bb45:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bb49:	c7 40 08 00 00 00 00 	mov    DWORD PTR [rax+0x8],0x0
        b->data[b->wptr]=buf[i++];
  80bb50:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bb53:	8d 50 01             	lea    edx,[rax+0x1]
  80bb56:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80bb59:	48 63 d0             	movsxd rdx,eax
  80bb5c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80bb60:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80bb64:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bb68:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80bb6b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bb6f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80bb72:	48 98                	cdqe   
  80bb74:	48 01 c2             	add    rdx,rax
  80bb77:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
  80bb7a:	88 02                	mov    BYTE PTR [rdx],al
        b->wptr++;
  80bb7c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bb80:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80bb83:	8d 50 01             	lea    edx,[rax+0x1]
  80bb86:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bb8a:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    while (i<count){
  80bb8d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bb90:	48 98                	cdqe   
  80bb92:	48 39 45 c8          	cmp    QWORD PTR [rbp-0x38],rax
  80bb96:	77 9b                	ja     80bb33 <write_tty+0x3b>
    }
    //刷新到framebuffer
    write_framebuffer(filp,b->data+saved_wptr,count,0);
  80bb98:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bb9c:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80bb9f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80bba2:	48 98                	cdqe   
  80bba4:	48 8d 34 02          	lea    rsi,[rdx+rax*1]
  80bba8:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80bbac:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80bbb0:	b9 00 00 00 00       	mov    ecx,0x0
  80bbb5:	48 89 c7             	mov    rdi,rax
  80bbb8:	e8 36 b8 ff ff       	call   8073f3 <write_framebuffer>
}
  80bbbd:	90                   	nop
  80bbbe:	c9                   	leave  
  80bbbf:	c3                   	ret    

000000000080bbc0 <tty_do_req>:
 * TTY_CONNECT:尝试连接到dev/console,这样会成为controlling terminal,里面的数据才能输出到屏幕上，
 * 因为除了特殊指定的进程都会有一个自己的天tty。
 * 成功返回0。
 * */
long tty_do_req(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg)
{
  80bbc0:	f3 0f 1e fa          	endbr64 
  80bbc4:	55                   	push   rbp
  80bbc5:	48 89 e5             	mov    rbp,rsp
  80bbc8:	48 83 ec 50          	sub    rsp,0x50
  80bbcc:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  80bbd0:	48 89 75 c0          	mov    QWORD PTR [rbp-0x40],rsi
  80bbd4:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  80bbd8:	48 89 4d b0          	mov    QWORD PTR [rbp-0x50],rcx
    stdbuf_t * b=&((tty_t*)filp->private_data)->stderr_buf;
  80bbdc:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80bbe0:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80bbe4:	48 83 c0 30          	add    rax,0x30
  80bbe8:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int i=0;
  80bbec:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* buf=*((char**)arg);
  80bbf3:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80bbf7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80bbfa:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    unsigned long count=*((unsigned long*)(arg+8));
  80bbfe:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80bc02:	48 83 c0 08          	add    rax,0x8
  80bc06:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80bc09:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    int saved_wptr=b->wptr;
  80bc0d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bc11:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80bc14:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    int fd=-1;
  80bc17:	c7 45 d8 ff ff ff ff 	mov    DWORD PTR [rbp-0x28],0xffffffff
    switch (cmd)
  80bc1e:	48 83 7d b8 02       	cmp    QWORD PTR [rbp-0x48],0x2
  80bc23:	0f 84 df 00 00 00    	je     80bd08 <tty_do_req+0x148>
  80bc29:	48 83 7d b8 02       	cmp    QWORD PTR [rbp-0x48],0x2
  80bc2e:	0f 87 fb 00 00 00    	ja     80bd2f <tty_do_req+0x16f>
  80bc34:	48 83 7d b8 00       	cmp    QWORD PTR [rbp-0x48],0x0
  80bc39:	74 6a                	je     80bca5 <tty_do_req+0xe5>
  80bc3b:	48 83 7d b8 01       	cmp    QWORD PTR [rbp-0x48],0x1
  80bc40:	0f 84 91 00 00 00    	je     80bcd7 <tty_do_req+0x117>
  80bc46:	e9 e4 00 00 00       	jmp    80bd2f <tty_do_req+0x16f>
    {
        case TTY_WSTDERR:
            while (i<count){
                if(b->wptr==b->size)
  80bc4b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bc4f:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80bc52:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bc56:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80bc59:	39 c2                	cmp    edx,eax
  80bc5b:	75 0b                	jne    80bc68 <tty_do_req+0xa8>
                    b->wptr=0;
  80bc5d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bc61:	c7 40 08 00 00 00 00 	mov    DWORD PTR [rax+0x8],0x0
                b->data[b->wptr]=buf[i++];
  80bc68:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bc6b:	8d 50 01             	lea    edx,[rax+0x1]
  80bc6e:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80bc71:	48 63 d0             	movsxd rdx,eax
  80bc74:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bc78:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80bc7c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bc80:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80bc83:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bc87:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80bc8a:	48 98                	cdqe   
  80bc8c:	48 01 c2             	add    rdx,rax
  80bc8f:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
  80bc92:	88 02                	mov    BYTE PTR [rdx],al
                b->wptr++;
  80bc94:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bc98:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80bc9b:	8d 50 01             	lea    edx,[rax+0x1]
  80bc9e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bca2:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
            while (i<count){
  80bca5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bca8:	48 98                	cdqe   
  80bcaa:	48 39 45 e0          	cmp    QWORD PTR [rbp-0x20],rax
  80bcae:	77 9b                	ja     80bc4b <tty_do_req+0x8b>
            }
            //刷新到framebuffer
            write_framebuffer(filp,b->data+saved_wptr,count,0);
  80bcb0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bcb4:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80bcb7:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80bcba:	48 98                	cdqe   
  80bcbc:	48 8d 34 02          	lea    rsi,[rdx+rax*1]
  80bcc0:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  80bcc4:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80bcc8:	b9 00 00 00 00       	mov    ecx,0x0
  80bccd:	48 89 c7             	mov    rdi,rax
  80bcd0:	e8 1e b7 ff ff       	call   8073f3 <write_framebuffer>
        break;
  80bcd5:	eb 61                	jmp    80bd38 <tty_do_req+0x178>
        case TTY_CONNECT:
            fd=sys_open("dev/console",O_WRONLY|O_CREAT|O_EXCL);
  80bcd7:	be c1 00 00 00       	mov    esi,0xc1
  80bcdc:	bf f6 4c 81 00       	mov    edi,0x814cf6
  80bce1:	e8 16 bc ff ff       	call   8078fc <sys_open>
  80bce6:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
            if(fd==-1)return -1;
  80bce9:	83 7d d8 ff          	cmp    DWORD PTR [rbp-0x28],0xffffffff
  80bced:	75 09                	jne    80bcf8 <tty_do_req+0x138>
  80bcef:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80bcf6:	eb 45                	jmp    80bd3d <tty_do_req+0x17d>
            ((tty_t*)filp->private_data)->console_fd=fd;
  80bcf8:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80bcfc:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80bd00:	8b 55 d8             	mov    edx,DWORD PTR [rbp-0x28]
  80bd03:	89 50 48             	mov    DWORD PTR [rax+0x48],edx
            break;
  80bd06:	eb 30                	jmp    80bd38 <tty_do_req+0x178>
        case TTY_DISCONNECT:
            fd=((tty_t*)filp->private_data)->console_fd;
  80bd08:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80bd0c:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80bd10:	8b 40 48             	mov    eax,DWORD PTR [rax+0x48]
  80bd13:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
            if(fd==-1)return -1;
  80bd16:	83 7d d8 ff          	cmp    DWORD PTR [rbp-0x28],0xffffffff
  80bd1a:	75 09                	jne    80bd25 <tty_do_req+0x165>
  80bd1c:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80bd23:	eb 18                	jmp    80bd3d <tty_do_req+0x17d>
            sys_close(fd);
  80bd25:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  80bd28:	89 c7                	mov    edi,eax
  80bd2a:	e8 0b c0 ff ff       	call   807d3a <sys_close>
    default:return -1;
  80bd2f:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80bd36:	eb 05                	jmp    80bd3d <tty_do_req+0x17d>
    }
    return 0;
  80bd38:	b8 00 00 00 00       	mov    eax,0x0
}
  80bd3d:	c9                   	leave  
  80bd3e:	c3                   	ret    

000000000080bd3f <init_com>:
#include "int.h"
#include "str.h"
#include "memory.h"


void init_com(int base_port){
  80bd3f:	f3 0f 1e fa          	endbr64 
  80bd43:	55                   	push   rbp
  80bd44:	48 89 e5             	mov    rbp,rsp
  80bd47:	48 83 ec 10          	sub    rsp,0x10
  80bd4b:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    /* disable all interrupts */
    outb(base_port + COM_REG_IER, 0x00);
  80bd4e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bd51:	83 c0 01             	add    eax,0x1
  80bd54:	0f b7 c0             	movzx  eax,ax
  80bd57:	be 00 00 00 00       	mov    esi,0x0
  80bd5c:	89 c7                	mov    edi,eax
  80bd5e:	e8 0d a2 ff ff       	call   805f70 <outb>
    
    /* enable DLAB to set bound rate divisor */
    outb(base_port + COM_REG_LCR, 0x80);
  80bd63:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bd66:	83 c0 03             	add    eax,0x3
  80bd69:	0f b7 c0             	movzx  eax,ax
  80bd6c:	be 80 00 00 00       	mov    esi,0x80
  80bd71:	89 c7                	mov    edi,eax
  80bd73:	e8 f8 a1 ff ff       	call   805f70 <outb>
    
    /* set divisor to 38400 baud */
    outb(base_port + COM_REG_DLL, 0x03);
  80bd78:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bd7b:	0f b7 c0             	movzx  eax,ax
  80bd7e:	be 03 00 00 00       	mov    esi,0x3
  80bd83:	89 c7                	mov    edi,eax
  80bd85:	e8 e6 a1 ff ff       	call   805f70 <outb>
    outb(base_port + COM_REG_DLM, 0x00);
  80bd8a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bd8d:	83 c0 01             	add    eax,0x1
  80bd90:	0f b7 c0             	movzx  eax,ax
  80bd93:	be 00 00 00 00       	mov    esi,0x0
  80bd98:	89 c7                	mov    edi,eax
  80bd9a:	e8 d1 a1 ff ff       	call   805f70 <outb>
    
    /* 8 data bits, parity off, 1 stop bit, DLAB latch off */
    outb(base_port + COM_REG_LCR, 0x03);
  80bd9f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bda2:	83 c0 03             	add    eax,0x3
  80bda5:	0f b7 c0             	movzx  eax,ax
  80bda8:	be 03 00 00 00       	mov    esi,0x3
  80bdad:	89 c7                	mov    edi,eax
  80bdaf:	e8 bc a1 ff ff       	call   805f70 <outb>
    
    /* enable FIFO */
    outb(base_port + COM_REG_FCR, 0x87);//0xc7
  80bdb4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bdb7:	83 c0 02             	add    eax,0x2
  80bdba:	0f b7 c0             	movzx  eax,ax
  80bdbd:	be 87 00 00 00       	mov    esi,0x87
  80bdc2:	89 c7                	mov    edi,eax
  80bdc4:	e8 a7 a1 ff ff       	call   805f70 <outb>

    /* enable IRQs, set RTS/DSR */
    outb(base_port + COM_REG_MCR, 0x0B);
  80bdc9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bdcc:	83 c0 04             	add    eax,0x4
  80bdcf:	0f b7 c0             	movzx  eax,ax
  80bdd2:	be 0b 00 00 00       	mov    esi,0xb
  80bdd7:	89 c7                	mov    edi,eax
  80bdd9:	e8 92 a1 ff ff       	call   805f70 <outb>
//    if (inb(base_port + COM_REG_RX) != 0xae) {
//        return;
//    }
    
    /* set in normal mode */
    outb(base_port + COM_REG_MCR, 0x0F);
  80bdde:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bde1:	83 c0 04             	add    eax,0x4
  80bde4:	0f b7 c0             	movzx  eax,ax
  80bde7:	be 0f 00 00 00       	mov    esi,0xf
  80bdec:	89 c7                	mov    edi,eax
  80bdee:	e8 7d a1 ff ff       	call   805f70 <outb>
}
  80bdf3:	90                   	nop
  80bdf4:	c9                   	leave  
  80bdf5:	c3                   	ret    

000000000080bdf6 <com_putchar>:
void com_putchar(unsigned short ch,int com_base)
{
  80bdf6:	f3 0f 1e fa          	endbr64 
  80bdfa:	55                   	push   rbp
  80bdfb:	48 89 e5             	mov    rbp,rsp
  80bdfe:	48 83 ec 20          	sub    rsp,0x20
  80be02:	89 f8                	mov    eax,edi
  80be04:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80be07:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    unsigned char res;
    /* wait for the port to be ready */
    do {
        res = inb(com_base + COM_REG_LSR);
  80be0b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80be0e:	83 c0 05             	add    eax,0x5
  80be11:	0f b6 c0             	movzx  eax,al
  80be14:	89 c7                	mov    edi,eax
  80be16:	e8 6e a1 ff ff       	call   805f89 <inb>
  80be1b:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        res &= 0x20;
  80be1e:	80 65 ff 20          	and    BYTE PTR [rbp-0x1],0x20
    } while (res == 0);
  80be22:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  80be26:	74 e3                	je     80be0b <com_putchar+0x15>
    outb(com_base, ch);
  80be28:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  80be2c:	0f b6 d0             	movzx  edx,al
  80be2f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80be32:	0f b7 c0             	movzx  eax,ax
  80be35:	89 d6                	mov    esi,edx
  80be37:	89 c7                	mov    edi,eax
  80be39:	e8 32 a1 ff ff       	call   805f70 <outb>
}
  80be3e:	90                   	nop
  80be3f:	c9                   	leave  
  80be40:	c3                   	ret    

000000000080be41 <com_puts>:

void com_puts(char* s,int com_port){
  80be41:	f3 0f 1e fa          	endbr64 
  80be45:	55                   	push   rbp
  80be46:	48 89 e5             	mov    rbp,rsp
  80be49:	48 83 ec 10          	sub    rsp,0x10
  80be4d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80be51:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    for(;*s;s++){
  80be54:	eb 1d                	jmp    80be73 <com_puts+0x32>
        com_putchar(*s,com_port);
  80be56:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80be5a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80be5d:	66 98                	cbw    
  80be5f:	0f b7 c0             	movzx  eax,ax
  80be62:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80be65:	89 d6                	mov    esi,edx
  80be67:	89 c7                	mov    edi,eax
  80be69:	e8 88 ff ff ff       	call   80bdf6 <com_putchar>
    for(;*s;s++){
  80be6e:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  80be73:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80be77:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80be7a:	84 c0                	test   al,al
  80be7c:	75 d8                	jne    80be56 <com_puts+0x15>
    }
}
  80be7e:	90                   	nop
  80be7f:	90                   	nop
  80be80:	c9                   	leave  
  80be81:	c3                   	ret    

000000000080be82 <comprintf>:
void comprintf(char* fmt,va_list args){
  80be82:	f3 0f 1e fa          	endbr64 
  80be86:	55                   	push   rbp
  80be87:	48 89 e5             	mov    rbp,rsp
  80be8a:	48 83 ec 20          	sub    rsp,0x20
  80be8e:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80be92:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    if(strlen(fmt)>=1024)
  80be96:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80be9a:	48 89 c7             	mov    rdi,rax
  80be9d:	e8 70 03 00 00       	call   80c212 <strlen>
  80bea2:	3d ff 03 00 00       	cmp    eax,0x3ff
  80bea7:	7f 49                	jg     80bef2 <comprintf+0x70>
        return;//一次性输出不了太长
    char* tmp=(char*)vmalloc();
  80bea9:	b8 00 00 00 00       	mov    eax,0x0
  80beae:	e8 4a 53 ff ff       	call   8011fd <vmalloc>
  80beb3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    sprintf(tmp,fmt,args);
  80beb7:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  80bebb:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  80bebf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bec3:	48 89 ce             	mov    rsi,rcx
  80bec6:	48 89 c7             	mov    rdi,rax
  80bec9:	b8 00 00 00 00       	mov    eax,0x0
  80bece:	e8 6d 03 00 00       	call   80c240 <sprintf>
    com_puts(tmp,PORT_COM1);
  80bed3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bed7:	be f8 03 00 00       	mov    esi,0x3f8
  80bedc:	48 89 c7             	mov    rdi,rax
  80bedf:	e8 5d ff ff ff       	call   80be41 <com_puts>
    vmfree(tmp);
  80bee4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bee8:	48 89 c7             	mov    rdi,rax
  80beeb:	e8 9c 53 ff ff       	call   80128c <vmfree>
  80bef0:	eb 01                	jmp    80bef3 <comprintf+0x71>
        return;//一次性输出不了太长
  80bef2:	90                   	nop
  80bef3:	c9                   	leave  
  80bef4:	c3                   	ret    

000000000080bef5 <memcpy>:
#include "mem.h"
#include "typename.h"
static u32 mem_end;
static u32 usr_mem_base;
void memcpy(u8* dest, u8 *src,u32 size){
  80bef5:	f3 0f 1e fa          	endbr64 
  80bef9:	55                   	push   rbp
  80befa:	48 89 e5             	mov    rbp,rsp
  80befd:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80bf01:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80bf05:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    *dest=0xff;//如果页内存还没分配，这样就可以先激发缺页异常分配了，之后写数据就会完整不会少开头第一个字节。
  80bf08:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bf0c:	c6 00 ff             	mov    BYTE PTR [rax],0xff
    for(int i=0;i<size;i++){
  80bf0f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80bf16:	eb 1b                	jmp    80bf33 <memcpy+0x3e>
        *(dest)=*(src);
  80bf18:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80bf1c:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80bf1f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bf23:	88 10                	mov    BYTE PTR [rax],dl
        dest++;
  80bf25:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        src++;
  80bf2a:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<size;i++){
  80bf2f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80bf33:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bf36:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
  80bf39:	77 dd                	ja     80bf18 <memcpy+0x23>
    }
}
  80bf3b:	90                   	nop
  80bf3c:	90                   	nop
  80bf3d:	5d                   	pop    rbp
  80bf3e:	c3                   	ret    

000000000080bf3f <memcmp>:
int memcmp(u8 *a,u8* b,int len)
{
  80bf3f:	f3 0f 1e fa          	endbr64 
  80bf43:	55                   	push   rbp
  80bf44:	48 89 e5             	mov    rbp,rsp
  80bf47:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80bf4b:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80bf4f:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    for(int i=0;i<len;i++)
  80bf52:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80bf59:	eb 3a                	jmp    80bf95 <memcmp+0x56>
    {
        if(*a!=*b)
  80bf5b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bf5f:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80bf62:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80bf66:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bf69:	38 c2                	cmp    dl,al
  80bf6b:	74 1a                	je     80bf87 <memcmp+0x48>
            return *a-*b;
  80bf6d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bf71:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bf74:	0f b6 d0             	movzx  edx,al
  80bf77:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80bf7b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bf7e:	0f b6 c8             	movzx  ecx,al
  80bf81:	89 d0                	mov    eax,edx
  80bf83:	29 c8                	sub    eax,ecx
  80bf85:	eb 1b                	jmp    80bfa2 <memcmp+0x63>
        a++;
  80bf87:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        b++;
  80bf8c:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<len;i++)
  80bf91:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80bf95:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bf98:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  80bf9b:	7c be                	jl     80bf5b <memcmp+0x1c>
    }
    return 0;
  80bf9d:	b8 00 00 00 00       	mov    eax,0x0
}
  80bfa2:	5d                   	pop    rbp
  80bfa3:	c3                   	ret    

000000000080bfa4 <memset>:
void memset(u8 *buf,u8 value,u32 size){
  80bfa4:	f3 0f 1e fa          	endbr64 
  80bfa8:	55                   	push   rbp
  80bfa9:	48 89 e5             	mov    rbp,rsp
  80bfac:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80bfb0:	89 f0                	mov    eax,esi
  80bfb2:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
  80bfb5:	88 45 e4             	mov    BYTE PTR [rbp-0x1c],al
    for(u32 i=0;i<size;i++){
  80bfb8:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80bfbf:	eb 16                	jmp    80bfd7 <memset+0x33>
        *(buf++)=value;
  80bfc1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bfc5:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80bfc9:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80bfcd:	0f b6 55 e4          	movzx  edx,BYTE PTR [rbp-0x1c]
  80bfd1:	88 10                	mov    BYTE PTR [rax],dl
    for(u32 i=0;i<size;i++){
  80bfd3:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80bfd7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80bfda:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  80bfdd:	72 e2                	jb     80bfc1 <memset+0x1d>
    }
}
  80bfdf:	90                   	nop
  80bfe0:	90                   	nop
  80bfe1:	5d                   	pop    rbp
  80bfe2:	c3                   	ret    

000000000080bfe3 <get_mem_size>:

u32 get_mem_size(){
  80bfe3:	f3 0f 1e fa          	endbr64 
  80bfe7:	55                   	push   rbp
  80bfe8:	48 89 e5             	mov    rbp,rsp
    return mem_end;
  80bfeb:	8b 05 2b f6 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f62b]        # 42b61c <mem_end>
}
  80bff1:	5d                   	pop    rbp
  80bff2:	c3                   	ret    

000000000080bff3 <strcpy>:
#include "str.h"
#include <stdarg.h>
void strcpy(unsigned char* dest, unsigned char *buf){
  80bff3:	f3 0f 1e fa          	endbr64 
  80bff7:	55                   	push   rbp
  80bff8:	48 89 e5             	mov    rbp,rsp
  80bffb:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bfff:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*buf!='\0'){
  80c003:	eb 1d                	jmp    80c022 <strcpy+0x2f>
        *(dest++)=*(buf++);
  80c005:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80c009:	48 8d 42 01          	lea    rax,[rdx+0x1]
  80c00d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  80c011:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c015:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80c019:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80c01d:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80c020:	88 10                	mov    BYTE PTR [rax],dl
    while(*buf!='\0'){
  80c022:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c026:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c029:	84 c0                	test   al,al
  80c02b:	75 d8                	jne    80c005 <strcpy+0x12>
    }
    *dest='\0';
  80c02d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c031:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80c034:	90                   	nop
  80c035:	5d                   	pop    rbp
  80c036:	c3                   	ret    

000000000080c037 <strtok>:
static char strtokkee[512],*strtokkeeptr=strtokkee;
static int tokptr=0;
static char retbuf[512],*retbptr=retbuf;
char* strtok(char *str,char splitter){
  80c037:	f3 0f 1e fa          	endbr64 
  80c03b:	55                   	push   rbp
  80c03c:	48 89 e5             	mov    rbp,rsp
  80c03f:	48 83 ec 30          	sub    rsp,0x30
  80c043:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80c047:	89 f0                	mov    eax,esi
  80c049:	88 45 d4             	mov    BYTE PTR [rbp-0x2c],al
    //limit: cannot cut string longer than 512
    if(str!=(void*)0){
  80c04c:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80c051:	0f 84 9c 00 00 00    	je     80c0f3 <strtok+0xbc>
        //cut for the first time
        strcpy(strtokkee,str);
  80c057:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80c05b:	48 89 c6             	mov    rsi,rax
  80c05e:	bf 40 b6 42 00       	mov    edi,0x42b640
  80c063:	e8 8b ff ff ff       	call   80bff3 <strcpy>
        char* ptr=strtokkee;
  80c068:	48 c7 45 e8 40 b6 42 	mov    QWORD PTR [rbp-0x18],0x42b640
  80c06f:	00 
        for(tokptr=0;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512);
  80c070:	c7 05 c6 f7 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f7c6],0x0        # 42b840 <tokptr>
  80c077:	00 00 00 
  80c07a:	eb 1c                	jmp    80c098 <strtok+0x61>
  80c07c:	8b 05 be f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f7be]        # 42b840 <tokptr>
  80c082:	83 c0 01             	add    eax,0x1
  80c085:	99                   	cdq    
  80c086:	c1 ea 17             	shr    edx,0x17
  80c089:	01 d0                	add    eax,edx
  80c08b:	25 ff 01 00 00       	and    eax,0x1ff
  80c090:	29 d0                	sub    eax,edx
  80c092:	89 05 a8 f7 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f7a8],eax        # 42b840 <tokptr>
  80c098:	8b 05 a2 f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f7a2]        # 42b840 <tokptr>
  80c09e:	48 98                	cdqe   
  80c0a0:	0f b6 80 40 b6 42 00 	movzx  eax,BYTE PTR [rax+0x42b640]
  80c0a7:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80c0aa:	74 13                	je     80c0bf <strtok+0x88>
  80c0ac:	8b 05 8e f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f78e]        # 42b840 <tokptr>
  80c0b2:	48 98                	cdqe   
  80c0b4:	0f b6 80 40 b6 42 00 	movzx  eax,BYTE PTR [rax+0x42b640]
  80c0bb:	84 c0                	test   al,al
  80c0bd:	75 bd                	jne    80c07c <strtok+0x45>
        strtokkee[tokptr]='\0';
  80c0bf:	8b 05 7b f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f77b]        # 42b840 <tokptr>
  80c0c5:	48 98                	cdqe   
  80c0c7:	c6 80 40 b6 42 00 00 	mov    BYTE PTR [rax+0x42b640],0x0
        tokptr=(tokptr+1)%512;
  80c0ce:	8b 05 6c f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f76c]        # 42b840 <tokptr>
  80c0d4:	83 c0 01             	add    eax,0x1
  80c0d7:	99                   	cdq    
  80c0d8:	c1 ea 17             	shr    edx,0x17
  80c0db:	01 d0                	add    eax,edx
  80c0dd:	25 ff 01 00 00       	and    eax,0x1ff
  80c0e2:	29 d0                	sub    eax,edx
  80c0e4:	89 05 56 f7 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f756],eax        # 42b840 <tokptr>
        return ptr;
  80c0ea:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c0ee:	e9 9e 00 00 00       	jmp    80c191 <strtok+0x15a>
    }
    //go on cutting
    int c=0;
  80c0f3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* ptr=strtokkee+tokptr;
  80c0fa:	8b 05 40 f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f740]        # 42b840 <tokptr>
  80c100:	48 98                	cdqe   
  80c102:	48 05 40 b6 42 00    	add    rax,0x42b640
  80c108:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512,c++);
  80c10c:	eb 20                	jmp    80c12e <strtok+0xf7>
  80c10e:	8b 05 2c f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f72c]        # 42b840 <tokptr>
  80c114:	83 c0 01             	add    eax,0x1
  80c117:	99                   	cdq    
  80c118:	c1 ea 17             	shr    edx,0x17
  80c11b:	01 d0                	add    eax,edx
  80c11d:	25 ff 01 00 00       	and    eax,0x1ff
  80c122:	29 d0                	sub    eax,edx
  80c124:	89 05 16 f7 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f716],eax        # 42b840 <tokptr>
  80c12a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80c12e:	8b 05 0c f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f70c]        # 42b840 <tokptr>
  80c134:	48 98                	cdqe   
  80c136:	0f b6 80 40 b6 42 00 	movzx  eax,BYTE PTR [rax+0x42b640]
  80c13d:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80c140:	74 13                	je     80c155 <strtok+0x11e>
  80c142:	8b 05 f8 f6 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f6f8]        # 42b840 <tokptr>
  80c148:	48 98                	cdqe   
  80c14a:	0f b6 80 40 b6 42 00 	movzx  eax,BYTE PTR [rax+0x42b640]
  80c151:	84 c0                	test   al,al
  80c153:	75 b9                	jne    80c10e <strtok+0xd7>
    strtokkee[tokptr]='\0';
  80c155:	8b 05 e5 f6 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f6e5]        # 42b840 <tokptr>
  80c15b:	48 98                	cdqe   
  80c15d:	c6 80 40 b6 42 00 00 	mov    BYTE PTR [rax+0x42b640],0x0
    tokptr=(tokptr+1)%512;
  80c164:	8b 05 d6 f6 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f6d6]        # 42b840 <tokptr>
  80c16a:	83 c0 01             	add    eax,0x1
  80c16d:	99                   	cdq    
  80c16e:	c1 ea 17             	shr    edx,0x17
  80c171:	01 d0                	add    eax,edx
  80c173:	25 ff 01 00 00       	and    eax,0x1ff
  80c178:	29 d0                	sub    eax,edx
  80c17a:	89 05 c0 f6 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f6c0],eax        # 42b840 <tokptr>
    if(c)
  80c180:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80c184:	74 06                	je     80c18c <strtok+0x155>
        return ptr;
  80c186:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c18a:	eb 05                	jmp    80c191 <strtok+0x15a>
    else
        return (void*)0;
  80c18c:	b8 00 00 00 00       	mov    eax,0x0
}
  80c191:	c9                   	leave  
  80c192:	c3                   	ret    

000000000080c193 <strcmp>:
int strcmp(char *s1,char *s2)
{
  80c193:	f3 0f 1e fa          	endbr64 
  80c197:	55                   	push   rbp
  80c198:	48 89 e5             	mov    rbp,rsp
  80c19b:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80c19f:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	while(*s1!='\0'&&*s2!='\0'){
  80c1a3:	eb 3c                	jmp    80c1e1 <strcmp+0x4e>
		if(*s1>*s2)
  80c1a5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c1a9:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80c1ac:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c1b0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c1b3:	38 c2                	cmp    dl,al
  80c1b5:	7e 07                	jle    80c1be <strcmp+0x2b>
			return 1;
  80c1b7:	b8 01 00 00 00       	mov    eax,0x1
  80c1bc:	eb 52                	jmp    80c210 <strcmp+0x7d>
		else if(*s1<*s2)
  80c1be:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c1c2:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80c1c5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c1c9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c1cc:	38 c2                	cmp    dl,al
  80c1ce:	7d 07                	jge    80c1d7 <strcmp+0x44>
			return -1;
  80c1d0:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80c1d5:	eb 39                	jmp    80c210 <strcmp+0x7d>
		s1++;
  80c1d7:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
		s2++;
  80c1dc:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
	while(*s1!='\0'&&*s2!='\0'){
  80c1e1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c1e5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c1e8:	84 c0                	test   al,al
  80c1ea:	74 0b                	je     80c1f7 <strcmp+0x64>
  80c1ec:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c1f0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c1f3:	84 c0                	test   al,al
  80c1f5:	75 ae                	jne    80c1a5 <strcmp+0x12>
	}
	if(*s1==*s2)
  80c1f7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c1fb:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80c1fe:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c202:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c205:	38 c2                	cmp    dl,al
  80c207:	75 07                	jne    80c210 <strcmp+0x7d>
		return 0;
  80c209:	b8 00 00 00 00       	mov    eax,0x0
  80c20e:	eb 00                	jmp    80c210 <strcmp+0x7d>
}
  80c210:	5d                   	pop    rbp
  80c211:	c3                   	ret    

000000000080c212 <strlen>:

int strlen(char *str)
{
  80c212:	f3 0f 1e fa          	endbr64 
  80c216:	55                   	push   rbp
  80c217:	48 89 e5             	mov    rbp,rsp
  80c21a:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int l=0;
  80c21e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;*str!='\0';str++,l++);
  80c225:	eb 09                	jmp    80c230 <strlen+0x1e>
  80c227:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  80c22c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80c230:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c234:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c237:	84 c0                	test   al,al
  80c239:	75 ec                	jne    80c227 <strlen+0x15>
    return l;
  80c23b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80c23e:	5d                   	pop    rbp
  80c23f:	c3                   	ret    

000000000080c240 <sprintf>:

void sprintf(char *dist, char *str,...)
{
  80c240:	f3 0f 1e fa          	endbr64 
  80c244:	55                   	push   rbp
  80c245:	48 89 e5             	mov    rbp,rsp
  80c248:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  80c24f:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  80c256:	48 89 b5 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rsi
  80c25d:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  80c264:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  80c26b:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  80c272:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  80c279:	84 c0                	test   al,al
  80c27b:	74 20                	je     80c29d <sprintf+0x5d>
  80c27d:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  80c281:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  80c285:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  80c289:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  80c28d:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  80c291:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  80c295:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  80c299:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7

    //count num of args
    char *pstr=str;
  80c29d:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80c2a4:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char *prev=str;
  80c2ab:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80c2b2:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    int argnum=0;
  80c2b9:	c7 85 3c ff ff ff 00 	mov    DWORD PTR [rbp-0xc4],0x0
  80c2c0:	00 00 00 
    while (*pstr!='\n')
  80c2c3:	eb 39                	jmp    80c2fe <sprintf+0xbe>
    {
        if(*pstr=='%'&&*prev!='%')
  80c2c5:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80c2cc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c2cf:	3c 25                	cmp    al,0x25
  80c2d1:	75 15                	jne    80c2e8 <sprintf+0xa8>
  80c2d3:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  80c2da:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c2dd:	3c 25                	cmp    al,0x25
  80c2df:	74 07                	je     80c2e8 <sprintf+0xa8>
            argnum++;
  80c2e1:	83 85 3c ff ff ff 01 	add    DWORD PTR [rbp-0xc4],0x1
        prev=pstr;
  80c2e8:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80c2ef:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
        pstr++;
  80c2f6:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80c2fd:	01 
    while (*pstr!='\n')
  80c2fe:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80c305:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c308:	3c 0a                	cmp    al,0xa
  80c30a:	75 b9                	jne    80c2c5 <sprintf+0x85>
    }

    va_list vargs;
    va_start(vargs,str);
  80c30c:	c7 85 08 ff ff ff 10 	mov    DWORD PTR [rbp-0xf8],0x10
  80c313:	00 00 00 
  80c316:	c7 85 0c ff ff ff 30 	mov    DWORD PTR [rbp-0xf4],0x30
  80c31d:	00 00 00 
  80c320:	48 8d 45 10          	lea    rax,[rbp+0x10]
  80c324:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  80c32b:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  80c332:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
    pstr=str;
  80c339:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80c340:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    for(;*pstr!='\0';pstr++){
  80c347:	e9 e2 01 00 00       	jmp    80c52e <sprintf+0x2ee>
        if(*pstr=='%'&&*(pstr+1)!='\0'){
  80c34c:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80c353:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c356:	3c 25                	cmp    al,0x25
  80c358:	0f 85 aa 01 00 00    	jne    80c508 <sprintf+0x2c8>
  80c35e:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80c365:	48 83 c0 01          	add    rax,0x1
  80c369:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c36c:	84 c0                	test   al,al
  80c36e:	0f 84 94 01 00 00    	je     80c508 <sprintf+0x2c8>
            pstr++;
  80c374:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80c37b:	01 
            if(*pstr=='x'){
  80c37c:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80c383:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c386:	3c 78                	cmp    al,0x78
  80c388:	75 64                	jne    80c3ee <sprintf+0x1ae>
                int v=va_arg(vargs,int);
  80c38a:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80c390:	83 f8 2f             	cmp    eax,0x2f
  80c393:	77 23                	ja     80c3b8 <sprintf+0x178>
  80c395:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80c39c:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80c3a2:	89 d2                	mov    edx,edx
  80c3a4:	48 01 d0             	add    rax,rdx
  80c3a7:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80c3ad:	83 c2 08             	add    edx,0x8
  80c3b0:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80c3b6:	eb 12                	jmp    80c3ca <sprintf+0x18a>
  80c3b8:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80c3bf:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80c3c3:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80c3ca:	8b 00                	mov    eax,DWORD PTR [rax]
  80c3cc:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
                sprint_hex(dist,v);
  80c3d2:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
  80c3d8:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80c3df:	89 d6                	mov    esi,edx
  80c3e1:	48 89 c7             	mov    rdi,rax
  80c3e4:	e8 4e 02 00 00       	call   80c637 <sprint_hex>
            if(*pstr=='x'){
  80c3e9:	e9 38 01 00 00       	jmp    80c526 <sprintf+0x2e6>
            }else if(*pstr=='s'){
  80c3ee:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80c3f5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c3f8:	3c 73                	cmp    al,0x73
  80c3fa:	75 68                	jne    80c464 <sprintf+0x224>
                char* v=va_arg(vargs,char*);
  80c3fc:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80c402:	83 f8 2f             	cmp    eax,0x2f
  80c405:	77 23                	ja     80c42a <sprintf+0x1ea>
  80c407:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80c40e:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80c414:	89 d2                	mov    edx,edx
  80c416:	48 01 d0             	add    rax,rdx
  80c419:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80c41f:	83 c2 08             	add    edx,0x8
  80c422:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80c428:	eb 12                	jmp    80c43c <sprintf+0x1fc>
  80c42a:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80c431:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80c435:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80c43c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c43f:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
                sprintn(dist,v);
  80c446:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
  80c44d:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80c454:	48 89 d6             	mov    rsi,rdx
  80c457:	48 89 c7             	mov    rdi,rax
  80c45a:	e8 5a 02 00 00       	call   80c6b9 <sprintn>
            if(*pstr=='x'){
  80c45f:	e9 c2 00 00 00       	jmp    80c526 <sprintf+0x2e6>
            }else if(*pstr=='d'){
  80c464:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80c46b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c46e:	3c 64                	cmp    al,0x64
  80c470:	75 66                	jne    80c4d8 <sprintf+0x298>
                char* v=va_arg(vargs,char*);
  80c472:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80c478:	83 f8 2f             	cmp    eax,0x2f
  80c47b:	77 23                	ja     80c4a0 <sprintf+0x260>
  80c47d:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80c484:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80c48a:	89 d2                	mov    edx,edx
  80c48c:	48 01 d0             	add    rax,rdx
  80c48f:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80c495:	83 c2 08             	add    edx,0x8
  80c498:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80c49e:	eb 12                	jmp    80c4b2 <sprintf+0x272>
  80c4a0:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80c4a7:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80c4ab:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80c4b2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c4b5:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
                sprint_decimal(dist,v);
  80c4bc:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  80c4c3:	89 c2                	mov    edx,eax
  80c4c5:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80c4cc:	89 d6                	mov    esi,edx
  80c4ce:	48 89 c7             	mov    rdi,rax
  80c4d1:	e8 ad 00 00 00       	call   80c583 <sprint_decimal>
            if(*pstr=='x'){
  80c4d6:	eb 4e                	jmp    80c526 <sprintf+0x2e6>
            }else if(*pstr=='c'){
  80c4d8:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80c4df:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c4e2:	3c 63                	cmp    al,0x63
  80c4e4:	75 02                	jne    80c4e8 <sprintf+0x2a8>
                char v=va_arg(vargs,char);
  80c4e6:	0f 0b                	ud2    
                sprintchar(dist,v);
            }else{
                sprintchar(dist,*pstr);
  80c4e8:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80c4ef:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c4f2:	0f be d0             	movsx  edx,al
  80c4f5:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80c4fc:	89 d6                	mov    esi,edx
  80c4fe:	48 89 c7             	mov    rdi,rax
  80c501:	e8 3e 00 00 00       	call   80c544 <sprintchar>
            if(*pstr=='x'){
  80c506:	eb 1e                	jmp    80c526 <sprintf+0x2e6>
            }
        }else{
            sprintchar(dist,*pstr);
  80c508:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80c50f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c512:	0f be d0             	movsx  edx,al
  80c515:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80c51c:	89 d6                	mov    esi,edx
  80c51e:	48 89 c7             	mov    rdi,rax
  80c521:	e8 1e 00 00 00       	call   80c544 <sprintchar>
    for(;*pstr!='\0';pstr++){
  80c526:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80c52d:	01 
  80c52e:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80c535:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c538:	84 c0                	test   al,al
  80c53a:	0f 85 0c fe ff ff    	jne    80c34c <sprintf+0x10c>
        }
    }
    va_end(vargs);
}
  80c540:	90                   	nop
  80c541:	90                   	nop
  80c542:	c9                   	leave  
  80c543:	c3                   	ret    

000000000080c544 <sprintchar>:
void sprintchar(char *dist,char c)
{
  80c544:	f3 0f 1e fa          	endbr64 
  80c548:	55                   	push   rbp
  80c549:	48 89 e5             	mov    rbp,rsp
  80c54c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80c550:	89 f0                	mov    eax,esi
  80c552:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    while(*dist!='\0')
  80c555:	eb 05                	jmp    80c55c <sprintchar+0x18>
        dist++;
  80c557:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    while(*dist!='\0')
  80c55c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c560:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c563:	84 c0                	test   al,al
  80c565:	75 f0                	jne    80c557 <sprintchar+0x13>
    *dist++=c;
  80c567:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c56b:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80c56f:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80c573:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  80c577:	88 10                	mov    BYTE PTR [rax],dl
    *dist='\0';
  80c579:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c57d:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80c580:	90                   	nop
  80c581:	5d                   	pop    rbp
  80c582:	c3                   	ret    

000000000080c583 <sprint_decimal>:
void sprint_decimal(char *dist,int c)
{
  80c583:	f3 0f 1e fa          	endbr64 
  80c587:	55                   	push   rbp
  80c588:	48 89 e5             	mov    rbp,rsp
  80c58b:	48 83 ec 30          	sub    rsp,0x30
  80c58f:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80c593:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
    unsigned char st[22];
    int p=0;
  80c596:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<sizeof(unsigned long)*2){
  80c59d:	eb 65                	jmp    80c604 <sprint_decimal+0x81>
        unsigned char a=c%10+'0';
  80c59f:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  80c5a2:	48 63 c2             	movsxd rax,edx
  80c5a5:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  80c5ac:	48 c1 e8 20          	shr    rax,0x20
  80c5b0:	c1 f8 02             	sar    eax,0x2
  80c5b3:	89 d6                	mov    esi,edx
  80c5b5:	c1 fe 1f             	sar    esi,0x1f
  80c5b8:	29 f0                	sub    eax,esi
  80c5ba:	89 c1                	mov    ecx,eax
  80c5bc:	89 c8                	mov    eax,ecx
  80c5be:	c1 e0 02             	shl    eax,0x2
  80c5c1:	01 c8                	add    eax,ecx
  80c5c3:	01 c0                	add    eax,eax
  80c5c5:	89 d1                	mov    ecx,edx
  80c5c7:	29 c1                	sub    ecx,eax
  80c5c9:	89 c8                	mov    eax,ecx
  80c5cb:	83 c0 30             	add    eax,0x30
  80c5ce:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        st[p++]=a;
  80c5d1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c5d4:	8d 50 01             	lea    edx,[rax+0x1]
  80c5d7:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80c5da:	48 98                	cdqe   
  80c5dc:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80c5e0:	88 54 05 e0          	mov    BYTE PTR [rbp+rax*1-0x20],dl
        c/=10;
  80c5e4:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80c5e7:	48 63 d0             	movsxd rdx,eax
  80c5ea:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
  80c5f1:	48 c1 ea 20          	shr    rdx,0x20
  80c5f5:	c1 fa 02             	sar    edx,0x2
  80c5f8:	c1 f8 1f             	sar    eax,0x1f
  80c5fb:	89 c1                	mov    ecx,eax
  80c5fd:	89 d0                	mov    eax,edx
  80c5ff:	29 c8                	sub    eax,ecx
  80c601:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    while(p<sizeof(unsigned long)*2){
  80c604:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c607:	83 f8 0f             	cmp    eax,0xf
  80c60a:	76 93                	jbe    80c59f <sprint_decimal+0x1c>
    }
    while(p>0)
  80c60c:	eb 1f                	jmp    80c62d <sprint_decimal+0xaa>
    {
        sprintchar(dist,st[--p]);
  80c60e:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80c612:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c615:	48 98                	cdqe   
  80c617:	0f b6 44 05 e0       	movzx  eax,BYTE PTR [rbp+rax*1-0x20]
  80c61c:	0f be d0             	movsx  edx,al
  80c61f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80c623:	89 d6                	mov    esi,edx
  80c625:	48 89 c7             	mov    rdi,rax
  80c628:	e8 17 ff ff ff       	call   80c544 <sprintchar>
    while(p>0)
  80c62d:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80c631:	7f db                	jg     80c60e <sprint_decimal+0x8b>
    }
}
  80c633:	90                   	nop
  80c634:	90                   	nop
  80c635:	c9                   	leave  
  80c636:	c3                   	ret    

000000000080c637 <sprint_hex>:
void sprint_hex(char *dist,unsigned int c)
{
  80c637:	f3 0f 1e fa          	endbr64 
  80c63b:	55                   	push   rbp
  80c63c:	48 89 e5             	mov    rbp,rsp
  80c63f:	48 83 ec 20          	sub    rsp,0x20
  80c643:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80c647:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    unsigned char st[10];
    int p=0;
  80c64a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<10){
  80c651:	eb 35                	jmp    80c688 <sprint_hex+0x51>
        unsigned char a=c%16;
  80c653:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80c656:	83 e0 0f             	and    eax,0xf
  80c659:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        if(a>9)a+='a'-10;
  80c65c:	80 7d fb 09          	cmp    BYTE PTR [rbp-0x5],0x9
  80c660:	76 06                	jbe    80c668 <sprint_hex+0x31>
  80c662:	80 45 fb 57          	add    BYTE PTR [rbp-0x5],0x57
  80c666:	eb 04                	jmp    80c66c <sprint_hex+0x35>
        else a+='0';
  80c668:	80 45 fb 30          	add    BYTE PTR [rbp-0x5],0x30
        st[p++]=a;
  80c66c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c66f:	8d 50 01             	lea    edx,[rax+0x1]
  80c672:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80c675:	48 98                	cdqe   
  80c677:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80c67b:	88 54 05 f1          	mov    BYTE PTR [rbp+rax*1-0xf],dl
        c/=16;
  80c67f:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80c682:	c1 e8 04             	shr    eax,0x4
  80c685:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    while(p<10){
  80c688:	83 7d fc 09          	cmp    DWORD PTR [rbp-0x4],0x9
  80c68c:	7e c5                	jle    80c653 <sprint_hex+0x1c>
    }
    while(p>0)
  80c68e:	eb 1f                	jmp    80c6af <sprint_hex+0x78>
    {
        sprintchar(dist,st[--p]);
  80c690:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80c694:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c697:	48 98                	cdqe   
  80c699:	0f b6 44 05 f1       	movzx  eax,BYTE PTR [rbp+rax*1-0xf]
  80c69e:	0f be d0             	movsx  edx,al
  80c6a1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c6a5:	89 d6                	mov    esi,edx
  80c6a7:	48 89 c7             	mov    rdi,rax
  80c6aa:	e8 95 fe ff ff       	call   80c544 <sprintchar>
    while(p>0)
  80c6af:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80c6b3:	7f db                	jg     80c690 <sprint_hex+0x59>
    }
}
  80c6b5:	90                   	nop
  80c6b6:	90                   	nop
  80c6b7:	c9                   	leave  
  80c6b8:	c3                   	ret    

000000000080c6b9 <sprintn>:
void sprintn(char *dist,char *str)
{
  80c6b9:	f3 0f 1e fa          	endbr64 
  80c6bd:	55                   	push   rbp
  80c6be:	48 89 e5             	mov    rbp,rsp
  80c6c1:	48 83 ec 10          	sub    rsp,0x10
  80c6c5:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80c6c9:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*str!='\0')
  80c6cd:	eb 20                	jmp    80c6ef <sprintn+0x36>
    {
        sprintchar(dist,*str++);
  80c6cf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c6d3:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80c6d7:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  80c6db:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c6de:	0f be d0             	movsx  edx,al
  80c6e1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c6e5:	89 d6                	mov    esi,edx
  80c6e7:	48 89 c7             	mov    rdi,rax
  80c6ea:	e8 55 fe ff ff       	call   80c544 <sprintchar>
    while(*str!='\0')
  80c6ef:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c6f3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c6f6:	84 c0                	test   al,al
  80c6f8:	75 d5                	jne    80c6cf <sprintn+0x16>
    }
  80c6fa:	90                   	nop
  80c6fb:	90                   	nop
  80c6fc:	c9                   	leave  
  80c6fd:	c3                   	ret    
  80c6fe:	66 90                	xchg   ax,ax

000000000080c700 <create_zero>:
  80c700:	e8 8c 75 ff ff       	call   803c91 <req_proc>
  80c705:	83 f8 ff             	cmp    eax,0xffffffff
  80c708:	74 0c                	je     80c716 <create_zero.retu>
  80c70a:	e8 4e 76 ff ff       	call   803d5d <set_proc>
  80c70f:	67 8b 04 24          	mov    eax,DWORD PTR [esp]
  80c713:	83 c4 40             	add    esp,0x40

000000000080c716 <create_zero.retu>:
  80c716:	c3                   	ret    

000000000080c717 <fill_desc>:
  80c717:	55                   	push   rbp
  80c718:	48 89 e5             	mov    rbp,rsp
  80c71b:	67 8b 45 14          	mov    eax,DWORD PTR [ebp+0x14]
  80c71f:	67 8b 5d 10          	mov    ebx,DWORD PTR [ebp+0x10]
  80c723:	67 8b 4d 0c          	mov    ecx,DWORD PTR [ebp+0xc]
  80c727:	67 8b 55 08          	mov    edx,DWORD PTR [ebp+0x8]
  80c72b:	be 6a c8 80 00       	mov    esi,0x80c86a
  80c730:	c7 04 25 6a c8 80 00 	mov    DWORD PTR ds:0x80c86a,0x0
  80c737:	00 00 00 00 
  80c73b:	c7 04 25 6e c8 80 00 	mov    DWORD PTR ds:0x80c86e,0x0
  80c742:	00 00 00 00 
  80c746:	66 67 89 0e          	mov    WORD PTR [esi],cx
  80c74a:	c1 e9 10             	shr    ecx,0x10
  80c74d:	66 67 89 56 02       	mov    WORD PTR [esi+0x2],dx
  80c752:	c1 ea 10             	shr    edx,0x10
  80c755:	67 88 56 04          	mov    BYTE PTR [esi+0x4],dl
  80c759:	66 c1 ea 08          	shr    dx,0x8
  80c75d:	67 88 56 07          	mov    BYTE PTR [esi+0x7],dl
  80c761:	66 67 89 5e 05       	mov    WORD PTR [esi+0x5],bx
  80c766:	67 8b 7e 04          	mov    edi,DWORD PTR [esi+0x4]
  80c76a:	c1 e1 08             	shl    ecx,0x8
  80c76d:	09 cf                	or     edi,ecx
  80c76f:	67 89 7e 04          	mov    DWORD PTR [esi+0x4],edi
  80c773:	8b 14 25 6a c8 80 00 	mov    edx,DWORD PTR ds:0x80c86a
  80c77a:	67 89 10             	mov    DWORD PTR [eax],edx
  80c77d:	8b 14 25 6e c8 80 00 	mov    edx,DWORD PTR ds:0x80c86e
  80c784:	67 89 50 04          	mov    DWORD PTR [eax+0x4],edx
  80c788:	c9                   	leave  
  80c789:	c3                   	ret    

000000000080c78a <switch_proc_asm>:
  80c78a:	66 67 8b 44 24 04    	mov    ax,WORD PTR [esp+0x4]
  80c790:	66 89 04 25 a8 c7 80 	mov    WORD PTR ds:0x80c7a8,ax
  80c797:	00 
  80c798:	c7 04 25 a4 c7 80 00 	mov    DWORD PTR ds:0x80c7a4,0x0
  80c79f:	00 00 00 00 

000000000080c7a3 <switch_proc_asm.ljmp>:
  80c7a3:	ea                   	(bad)  
  80c7a4:	00 00                	add    BYTE PTR [rax],al
  80c7a6:	00 00                	add    BYTE PTR [rax],al
  80c7a8:	00 00                	add    BYTE PTR [rax],al
  80c7aa:	c3                   	ret    

000000000080c7ab <switch_to_old>:
  80c7ab:	67 8b 74 24 04       	mov    esi,DWORD PTR [esp+0x4]
  80c7b0:	67 8b 5e 20          	mov    ebx,DWORD PTR [esi+0x20]
  80c7b4:	bf 1c c8 80 00       	mov    edi,0x80c81c
  80c7b9:	67 89 5f 01          	mov    DWORD PTR [edi+0x1],ebx
  80c7bd:	67 8b 46 38          	mov    eax,DWORD PTR [esi+0x38]
  80c7c1:	89 c1                	mov    ecx,eax
  80c7c3:	83 e9 04             	sub    ecx,0x4
  80c7c6:	67 89 19             	mov    DWORD PTR [ecx],ebx
  80c7c9:	50                   	push   rax
  80c7ca:	89 f5                	mov    ebp,esi
  80c7cc:	83 c5 28             	add    ebp,0x28
  80c7cf:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c7d3:	50                   	push   rax
  80c7d4:	83 c5 04             	add    ebp,0x4
  80c7d7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c7db:	50                   	push   rax
  80c7dc:	83 c5 04             	add    ebp,0x4
  80c7df:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c7e3:	50                   	push   rax
  80c7e4:	83 c5 04             	add    ebp,0x4
  80c7e7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c7eb:	50                   	push   rax
  80c7ec:	83 c5 04             	add    ebp,0x4
  80c7ef:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c7f3:	50                   	push   rax
  80c7f4:	83 c5 04             	add    ebp,0x4
  80c7f7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c7fb:	50                   	push   rax
  80c7fc:	83 c5 04             	add    ebp,0x4
  80c7ff:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c803:	50                   	push   rax
  80c804:	83 c5 04             	add    ebp,0x4
  80c807:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c80b:	50                   	push   rax
  80c80c:	83 c5 04             	add    ebp,0x4
  80c80f:	67 8b 46 1c          	mov    eax,DWORD PTR [esi+0x1c]
  80c813:	0f 22 d8             	mov    cr3,rax
  80c816:	67 8b 46 24          	mov    eax,DWORD PTR [esi+0x24]
  80c81a:	50                   	push   rax
  80c81b:	5c                   	pop    rsp

000000000080c81c <switch_to_old.leap>:
  80c81c:	ea                   	(bad)  
  80c81d:	00 00                	add    BYTE PTR [rax],al
  80c81f:	00 00                	add    BYTE PTR [rax],al
  80c821:	08 00                	or     BYTE PTR [rax],al

000000000080c823 <save_context>:
  80c823:	67 8b 44 24 24       	mov    eax,DWORD PTR [esp+0x24]
  80c828:	83 c0 44             	add    eax,0x44
  80c82b:	b9 08 00 00 00       	mov    ecx,0x8
  80c830:	89 e7                	mov    edi,esp

000000000080c832 <save_context.loops>:
  80c832:	67 8b 17             	mov    edx,DWORD PTR [edi]
  80c835:	67 89 10             	mov    DWORD PTR [eax],edx
  80c838:	83 c7 04             	add    edi,0x4
  80c83b:	83 e8 04             	sub    eax,0x4
  80c83e:	e2 f2                	loop   80c832 <save_context.loops>
  80c840:	5b                   	pop    rbx
  80c841:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  80c846:	67 89 58 24          	mov    DWORD PTR [eax+0x24],ebx
  80c84a:	67 48 8b 1c 24       	mov    rbx,QWORD PTR [esp]
  80c84f:	67 89 58 20          	mov    DWORD PTR [eax+0x20],ebx
  80c853:	c3                   	ret    

000000000080c854 <move_to_user_mode>:
  80c854:	66 b8 20 00          	mov    ax,0x20
  80c858:	8e d8                	mov    ds,eax
  80c85a:	8e c0                	mov    es,eax
  80c85c:	8e e8                	mov    gs,eax
  80c85e:	6a 20                	push   0x20
  80c860:	54                   	push   rsp
  80c861:	6a 18                	push   0x18
  80c863:	68 69 c8 80 00       	push   0x80c869
  80c868:	cf                   	iret   

000000000080c869 <move_to_user_mode.done>:
  80c869:	c3                   	ret    

000000000080c86a <desc>:
	...

000000000080c872 <ret_sys_call>:
  80c872:	58                   	pop    rax
  80c873:	8e d8                	mov    ds,eax
  80c875:	58                   	pop    rax
  80c876:	8e c0                	mov    es,eax
  80c878:	41 5f                	pop    r15
  80c87a:	41 5e                	pop    r14
  80c87c:	41 5d                	pop    r13
  80c87e:	41 5c                	pop    r12
  80c880:	41 5b                	pop    r11
  80c882:	41 5a                	pop    r10
  80c884:	41 59                	pop    r9
  80c886:	41 58                	pop    r8
  80c888:	5e                   	pop    rsi
  80c889:	5f                   	pop    rdi
  80c88a:	5a                   	pop    rdx
  80c88b:	59                   	pop    rcx
  80c88c:	5b                   	pop    rbx
  80c88d:	58                   	pop    rax

000000000080c88e <tmp>:
  80c88e:	48 0f 07             	sysretq 

000000000080c891 <ret_normal_proc>:
  80c891:	58                   	pop    rax
  80c892:	8e d8                	mov    ds,eax
  80c894:	58                   	pop    rax
  80c895:	8e c0                	mov    es,eax
  80c897:	41 5f                	pop    r15
  80c899:	41 5e                	pop    r14
  80c89b:	41 5d                	pop    r13
  80c89d:	41 5c                	pop    r12
  80c89f:	41 5b                	pop    r11
  80c8a1:	41 5a                	pop    r10
  80c8a3:	41 59                	pop    r9
  80c8a5:	41 58                	pop    r8
  80c8a7:	5e                   	pop    rsi
  80c8a8:	5f                   	pop    rdi
  80c8a9:	5a                   	pop    rdx
  80c8aa:	59                   	pop    rcx
  80c8ab:	5b                   	pop    rbx
  80c8ac:	58                   	pop    rax
  80c8ad:	c3                   	ret    
