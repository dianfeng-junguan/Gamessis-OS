
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
  100093:	b8 b0 91 80 00       	mov    eax,0x8091b0
  100098:	ea                   	(bad)  
  100099:	b0 91                	mov    al,0x91
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
  800194:	b8 37 13 80 00       	mov    eax,0x801337
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
  800217:	b8 28 93 80 00       	mov    eax,0x809328
  80021c:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800221:	ba 08 00 00 00       	mov    edx,0x8
  800226:	48 89 c6             	mov    rsi,rax
  800229:	bf 21 00 00 00       	mov    edi,0x21
  80022e:	e8 02 01 00 00       	call   800335 <set_gate>
	set_gate(0x20,(addr_t)clock,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800233:	b8 a0 6a 80 00       	mov    eax,0x806aa0
  800238:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80023d:	ba 08 00 00 00       	mov    edx,0x8
  800242:	48 89 c6             	mov    rsi,rax
  800245:	bf 20 00 00 00       	mov    edi,0x20
  80024a:	e8 e6 00 00 00       	call   800335 <set_gate>
	set_gate(0x2e,(addr_t)disk_int_handler,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80024f:	b8 60 a3 80 00       	mov    eax,0x80a360
  800254:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800259:	ba 08 00 00 00       	mov    edx,0x8
  80025e:	48 89 c6             	mov    rsi,rax
  800261:	bf 2e 00 00 00       	mov    edi,0x2e
  800266:	e8 ca 00 00 00       	call   800335 <set_gate>
    set_gate(0x80,(addr_t)_syscall,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);//
  80026b:	b8 c0 75 80 00       	mov    eax,0x8075c0
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
  800291:	e8 7a 65 00 00       	call   806810 <outb>
	outb(0xA0,0x11);
  800296:	be 11 00 00 00       	mov    esi,0x11
  80029b:	bf a0 00 00 00       	mov    edi,0xa0
  8002a0:	e8 6b 65 00 00       	call   806810 <outb>
	//ICW2
	outb(0x21,0x20);//former 0x20,0x20
  8002a5:	be 20 00 00 00       	mov    esi,0x20
  8002aa:	bf 21 00 00 00       	mov    edi,0x21
  8002af:	e8 5c 65 00 00       	call   806810 <outb>
	outb(0xA1,0x28);
  8002b4:	be 28 00 00 00       	mov    esi,0x28
  8002b9:	bf a1 00 00 00       	mov    edi,0xa1
  8002be:	e8 4d 65 00 00       	call   806810 <outb>
	//ICW3
	outb(0x21,0x04);
  8002c3:	be 04 00 00 00       	mov    esi,0x4
  8002c8:	bf 21 00 00 00       	mov    edi,0x21
  8002cd:	e8 3e 65 00 00       	call   806810 <outb>
	outb(0xA1,0x02);
  8002d2:	be 02 00 00 00       	mov    esi,0x2
  8002d7:	bf a1 00 00 00       	mov    edi,0xa1
  8002dc:	e8 2f 65 00 00       	call   806810 <outb>
	//ICW4
	outb(0x21,0x01);
  8002e1:	be 01 00 00 00       	mov    esi,0x1
  8002e6:	bf 21 00 00 00       	mov    edi,0x21
  8002eb:	e8 20 65 00 00       	call   806810 <outb>
	outb(0xA1,0x01);
  8002f0:	be 01 00 00 00       	mov    esi,0x1
  8002f5:	bf a1 00 00 00       	mov    edi,0xa1
  8002fa:	e8 11 65 00 00       	call   806810 <outb>

    turn_on_int();
  8002ff:	b8 00 00 00 00       	mov    eax,0x0
  800304:	e8 41 65 00 00       	call   80684a <turn_on_int>


    //设置IA32_LSTAR,为syscall做设置
    wrmsr(0xc0000082, _syscall);
  800309:	b8 c0 75 80 00       	mov    eax,0x8075c0
  80030e:	48 89 c6             	mov    rsi,rax
  800311:	b8 82 00 00 c0       	mov    eax,0xc0000082
  800316:	48 89 c7             	mov    rdi,rax
  800319:	e8 26 05 00 00       	call   800844 <wrmsr>
    //设置IA32_FMASK,为syscall做设置
    wrmsr(0xc0000084, -1);
  80031e:	48 c7 c6 ff ff ff ff 	mov    rsi,0xffffffffffffffff
  800325:	b8 84 00 00 c0       	mov    eax,0xc0000084
  80032a:	48 89 c7             	mov    rdi,rax
  80032d:	e8 12 05 00 00       	call   800844 <wrmsr>
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
  800350:	48 8b 15 89 d5 00 00 	mov    rdx,QWORD PTR [rip+0xd589]        # 80d8e0 <idt>
  800357:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80035b:	48 c1 e0 04          	shl    rax,0x4
  80035f:	48 01 d0             	add    rax,rdx
  800362:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800366:	66 89 10             	mov    WORD PTR [rax],dx
    idt[index].offset_mid=(offset>>16)&0xffff;
  800369:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80036d:	48 c1 e8 10          	shr    rax,0x10
  800371:	48 89 c2             	mov    rdx,rax
  800374:	48 8b 0d 65 d5 00 00 	mov    rcx,QWORD PTR [rip+0xd565]        # 80d8e0 <idt>
  80037b:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80037f:	48 c1 e0 04          	shl    rax,0x4
  800383:	48 01 c8             	add    rax,rcx
  800386:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
    idt[index].offset_high=(offset>>32)&0x0000ffff;
  80038a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80038e:	48 c1 e8 20          	shr    rax,0x20
  800392:	89 c1                	mov    ecx,eax
  800394:	48 8b 15 45 d5 00 00 	mov    rdx,QWORD PTR [rip+0xd545]        # 80d8e0 <idt>
  80039b:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80039f:	48 c1 e0 04          	shl    rax,0x4
  8003a3:	48 01 c2             	add    rdx,rax
  8003a6:	0f b7 c1             	movzx  eax,cx
  8003a9:	89 42 08             	mov    DWORD PTR [rdx+0x8],eax
    idt[index].attr=attr|1;//1是ist索引
  8003ac:	48 8b 15 2d d5 00 00 	mov    rdx,QWORD PTR [rip+0xd52d]        # 80d8e0 <idt>
  8003b3:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003b7:	48 c1 e0 04          	shl    rax,0x4
  8003bb:	48 01 d0             	add    rax,rdx
  8003be:	0f b7 55 ec          	movzx  edx,WORD PTR [rbp-0x14]
  8003c2:	83 ca 01             	or     edx,0x1
  8003c5:	66 89 50 04          	mov    WORD PTR [rax+0x4],dx
    idt[index].selector=selector;
  8003c9:	48 8b 15 10 d5 00 00 	mov    rdx,QWORD PTR [rip+0xd510]        # 80d8e0 <idt>
  8003d0:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003d4:	48 c1 e0 04          	shl    rax,0x4
  8003d8:	48 01 c2             	add    rdx,rax
  8003db:	0f b7 45 f8          	movzx  eax,WORD PTR [rbp-0x8]
  8003df:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    idt[index].rsvd=0;
  8003e3:	48 8b 15 f6 d4 00 00 	mov    rdx,QWORD PTR [rip+0xd4f6]        # 80d8e0 <idt>
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
  80040d:	e8 2c 64 00 00       	call   80683e <eoi>
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
  800427:	e8 12 64 00 00       	call   80683e <eoi>
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
  800441:	e8 f8 63 00 00       	call   80683e <eoi>
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
  80045b:	e8 de 63 00 00       	call   80683e <eoi>
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
  800475:	e8 c4 63 00 00       	call   80683e <eoi>
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
  80048f:	e8 aa 63 00 00       	call   80683e <eoi>
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
  8004a8:	e8 91 63 00 00       	call   80683e <eoi>
    report_back_trace_of_err();
  8004ad:	b8 00 00 00 00       	mov    eax,0x0
  8004b2:	e8 b2 63 00 00       	call   806869 <report_back_trace_of_err>
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
  8004cd:	e8 6c 63 00 00       	call   80683e <eoi>
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
  8004e7:	e8 52 63 00 00       	call   80683e <eoi>
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
  800500:	e8 39 63 00 00       	call   80683e <eoi>
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
  800519:	e8 20 63 00 00       	call   80683e <eoi>
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
  800533:	e8 06 63 00 00       	call   80683e <eoi>
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
  80054d:	e8 ec 62 00 00       	call   80683e <eoi>
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
  800571:	e8 c8 62 00 00       	call   80683e <eoi>
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
  80058e:	e8 ab 62 00 00       	call   80683e <eoi>
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
  8005c3:	0f 87 79 02 00 00    	ja     800842 <syscall+0x2a8>
  8005c9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8005cd:	48 c1 e0 03          	shl    rax,0x3
  8005d1:	48 05 60 51 81 00    	add    rax,0x815160
  8005d7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8005da:	3e ff e0             	notrack jmp rax
    {
        case 0:return reg_device(a);
  8005dd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8005e0:	48 98                	cdqe   
  8005e2:	48 89 c7             	mov    rdi,rax
  8005e5:	e8 5d 2a 00 00       	call   803047 <reg_device>
  8005ea:	e9 53 02 00 00       	jmp    800842 <syscall+0x2a8>
        case 1:return dispose_device(a);
  8005ef:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8005f2:	89 c7                	mov    edi,eax
  8005f4:	e8 ad 34 00 00       	call   803aa6 <dispose_device>
  8005f9:	e9 44 02 00 00       	jmp    800842 <syscall+0x2a8>
        case 2:return reg_driver(a);
  8005fe:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800601:	48 98                	cdqe   
  800603:	48 89 c7             	mov    rdi,rax
  800606:	e8 24 2d 00 00       	call   80332f <reg_driver>
  80060b:	e9 32 02 00 00       	jmp    800842 <syscall+0x2a8>
        case 3:return dispose_driver(a);
  800610:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800613:	48 98                	cdqe   
  800615:	48 89 c7             	mov    rdi,rax
  800618:	e8 27 35 00 00       	call   803b44 <dispose_driver>
  80061d:	e9 20 02 00 00       	jmp    800842 <syscall+0x2a8>
        case 4:return call_drv_func(a,b,c);
  800622:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800625:	48 98                	cdqe   
  800627:	48 89 c2             	mov    rdx,rax
  80062a:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  80062d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800630:	89 ce                	mov    esi,ecx
  800632:	89 c7                	mov    edi,eax
  800634:	e8 16 32 00 00       	call   80384f <call_drv_func>
  800639:	e9 04 02 00 00       	jmp    800842 <syscall+0x2a8>
        case 5:return req_page_at(a,b);
  80063e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800641:	48 98                	cdqe   
  800643:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  800646:	89 d6                	mov    esi,edx
  800648:	48 89 c7             	mov    rdi,rax
  80064b:	e8 c4 12 00 00       	call   801914 <req_page_at>
  800650:	e9 ed 01 00 00       	jmp    800842 <syscall+0x2a8>
        case 6:return free_page(a);
  800655:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800658:	48 98                	cdqe   
  80065a:	48 89 c7             	mov    rdi,rax
  80065d:	e8 7e 10 00 00       	call   8016e0 <free_page>
  800662:	e9 db 01 00 00       	jmp    800842 <syscall+0x2a8>
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
  800682:	e8 2f 47 00 00       	call   804db6 <reg_proc>
  800687:	e9 b6 01 00 00       	jmp    800842 <syscall+0x2a8>
        case 8:del_proc(a);
  80068c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80068f:	89 c7                	mov    edi,eax
  800691:	e8 3c 45 00 00       	call   804bd2 <del_proc>
        case 10:chk_vm(a,b);
  800696:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  800699:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80069c:	89 d6                	mov    esi,edx
  80069e:	89 c7                	mov    edi,eax
  8006a0:	e8 48 13 00 00       	call   8019ed <chk_vm>
        case 11:return sys_open(a,b);
  8006a5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006a8:	48 98                	cdqe   
  8006aa:	48 89 c2             	mov    rdx,rax
  8006ad:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8006b0:	89 c6                	mov    esi,eax
  8006b2:	48 89 d7             	mov    rdi,rdx
  8006b5:	e8 06 7e 00 00       	call   8084c0 <sys_open>
  8006ba:	e9 83 01 00 00       	jmp    800842 <syscall+0x2a8>
        case 12:return sys_close(a);
  8006bf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006c2:	89 c7                	mov    edi,eax
  8006c4:	e8 8e 83 00 00       	call   808a57 <sys_close>
  8006c9:	e9 74 01 00 00       	jmp    800842 <syscall+0x2a8>
        case 13:return sys_read(a,b,c);
  8006ce:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8006d1:	48 63 d0             	movsxd rdx,eax
  8006d4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8006d7:	48 98                	cdqe   
  8006d9:	48 89 c1             	mov    rcx,rax
  8006dc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006df:	48 89 ce             	mov    rsi,rcx
  8006e2:	89 c7                	mov    edi,eax
  8006e4:	e8 26 84 00 00       	call   808b0f <sys_read>
  8006e9:	e9 54 01 00 00       	jmp    800842 <syscall+0x2a8>
        case 14:return sys_write(a,b,c);
  8006ee:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8006f1:	48 63 d0             	movsxd rdx,eax
  8006f4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8006f7:	48 98                	cdqe   
  8006f9:	48 89 c1             	mov    rcx,rax
  8006fc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006ff:	48 89 ce             	mov    rsi,rcx
  800702:	89 c7                	mov    edi,eax
  800704:	e8 b6 84 00 00       	call   808bbf <sys_write>
  800709:	e9 34 01 00 00       	jmp    800842 <syscall+0x2a8>
        case 15:return sys_lseek(a,b,c);
  80070e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  800711:	48 63 c8             	movsxd rcx,eax
  800714:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  800717:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80071a:	48 89 ce             	mov    rsi,rcx
  80071d:	89 c7                	mov    edi,eax
  80071f:	e8 4b 85 00 00       	call   808c6f <sys_lseek>
  800724:	e9 19 01 00 00       	jmp    800842 <syscall+0x2a8>
        case 16:return sys_tell(a);
  800729:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80072c:	89 c7                	mov    edi,eax
  80072e:	e8 9e 16 00 00       	call   801dd1 <sys_tell>
  800733:	e9 0a 01 00 00       	jmp    800842 <syscall+0x2a8>
        case 17:return reg_vol(a,b,c);
  800738:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  80073b:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  80073e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800741:	89 ce                	mov    esi,ecx
  800743:	89 c7                	mov    edi,eax
  800745:	b8 00 00 00 00       	mov    eax,0x0
  80074a:	e8 77 15 00 00       	call   801cc6 <reg_vol>
  80074f:	e9 ee 00 00 00       	jmp    800842 <syscall+0x2a8>
        case 18:return free_vol(a);
  800754:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800757:	89 c7                	mov    edi,eax
  800759:	b8 00 00 00 00       	mov    eax,0x0
  80075e:	e8 47 15 00 00       	call   801caa <free_vol>
  800763:	e9 da 00 00 00       	jmp    800842 <syscall+0x2a8>
        case 19:return execute(a, NULL);
  800768:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80076b:	48 98                	cdqe   
  80076d:	be 00 00 00 00       	mov    esi,0x0
  800772:	48 89 c7             	mov    rdi,rax
  800775:	e8 7a 63 00 00       	call   806af4 <execute>
  80077a:	e9 c3 00 00 00       	jmp    800842 <syscall+0x2a8>
        case SYSCALL_EXIT:return sys_exit(a);
  80077f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800782:	89 c7                	mov    edi,eax
  800784:	e8 f8 45 00 00       	call   804d81 <sys_exit>
  800789:	e9 b4 00 00 00       	jmp    800842 <syscall+0x2a8>
        case SYSCALL_CALL:return exec_call(a);
  80078e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800791:	48 98                	cdqe   
  800793:	48 89 c7             	mov    rdi,rax
  800796:	e8 50 65 00 00       	call   806ceb <exec_call>
  80079b:	e9 a2 00 00 00       	jmp    800842 <syscall+0x2a8>
        case SYSCALL_MKFIFO:return sys_mkfifo(a);
  8007a0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007a3:	89 c7                	mov    edi,eax
  8007a5:	e8 a1 13 00 00       	call   801b4b <sys_mkfifo>
  8007aa:	e9 93 00 00 00       	jmp    800842 <syscall+0x2a8>
        case SYSCALL_MALLOC:return sys_malloc(a);
  8007af:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007b2:	89 c7                	mov    edi,eax
  8007b4:	e8 c5 47 00 00       	call   804f7e <sys_malloc>
  8007b9:	e9 84 00 00 00       	jmp    800842 <syscall+0x2a8>
        case SYSCALL_FREE:return sys_free(a);
  8007be:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007c1:	89 c7                	mov    edi,eax
  8007c3:	e8 44 49 00 00       	call   80510c <sys_free>
  8007c8:	eb 78                	jmp    800842 <syscall+0x2a8>
        case SYSCALL_KB_READC:return sys_analyse_key();
  8007ca:	b8 00 00 00 00       	mov    eax,0x0
  8007cf:	e8 a8 8c 00 00       	call   80947c <sys_analyse_key>
  8007d4:	0f be c0             	movsx  eax,al
  8007d7:	eb 69                	jmp    800842 <syscall+0x2a8>
        case SYSCALL_FIND_DEV:return sys_find_dev(a);
  8007d9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007dc:	48 98                	cdqe   
  8007de:	48 89 c7             	mov    rdi,rax
  8007e1:	e8 99 2c 00 00       	call   80347f <sys_find_dev>
  8007e6:	eb 5a                	jmp    800842 <syscall+0x2a8>
        case SYSCALL_FORK:return sys_fork();
  8007e8:	e8 2c 4c 00 00       	call   805419 <sys_fork>
  8007ed:	eb 53                	jmp    800842 <syscall+0x2a8>
        case SYSCALL_EXECVE:return sys_execve(a,b);
  8007ef:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8007f2:	48 98                	cdqe   
  8007f4:	48 89 c2             	mov    rdx,rax
  8007f7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007fa:	48 98                	cdqe   
  8007fc:	48 89 d6             	mov    rsi,rdx
  8007ff:	48 89 c7             	mov    rdi,rax
  800802:	e8 ef 63 00 00       	call   806bf6 <sys_execve>
  800807:	eb 39                	jmp    800842 <syscall+0x2a8>
        case SYSCALL_OPERATE_DEV:return sys_operate_dev(a,b,c);
  800809:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80080c:	48 98                	cdqe   
  80080e:	48 89 c2             	mov    rdx,rax
  800811:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800814:	48 98                	cdqe   
  800816:	48 89 c1             	mov    rcx,rax
  800819:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80081c:	89 c6                	mov    esi,eax
  80081e:	48 89 cf             	mov    rdi,rcx
  800821:	e8 eb 2c 00 00       	call   803511 <sys_operate_dev>
  800826:	eb 1a                	jmp    800842 <syscall+0x2a8>
        case SYSCALL_WAIT:return sys_wait(a,b,c);
  800828:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80082b:	48 98                	cdqe   
  80082d:	48 89 c1             	mov    rcx,rax
  800830:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  800833:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800836:	48 89 ce             	mov    rsi,rcx
  800839:	89 c7                	mov    edi,eax
  80083b:	e8 1a 85 00 00       	call   808d5a <sys_wait>
  800840:	eb 00                	jmp    800842 <syscall+0x2a8>
    }
    // __asm__ volatile("mov %0,%%eax\r\n mov %1,%%ebx\r\n mov %2,%%ecx\r\n mov %3,%%edx\r\n mov %4,%%esi\r\n mov %5,%%edi"\
    // ::"m"(func),"m"(a),"m"(b),"m"(c),"m"(d),"m"(e));
    // __asm__ volatile("int $0x80\r\n leave\r\n ret");

}
  800842:	c9                   	leave  
  800843:	c3                   	ret    

0000000000800844 <wrmsr>:
void wrmsr(unsigned long address,unsigned long value)
{
  800844:	f3 0f 1e fa          	endbr64 
  800848:	55                   	push   rbp
  800849:	48 89 e5             	mov    rbp,rsp
  80084c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  800850:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    __asm__ __volatile__	("wrmsr	\n\t"::"d"(value >> 32),"a"(value & 0xffffffff),"c"(address):"memory");
  800854:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800858:	48 c1 e8 20          	shr    rax,0x20
  80085c:	48 89 c2             	mov    rdx,rax
  80085f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800863:	89 c0                	mov    eax,eax
  800865:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  800869:	0f 30                	wrmsr  
  80086b:	90                   	nop
  80086c:	5d                   	pop    rbp
  80086d:	c3                   	ret    

000000000080086e <main>:
#include "syscall.h"
#include "fcntl.h"

int manage_proc_lock=1;
void main(unsigned int magic,void* addr)
{
  80086e:	f3 0f 1e fa          	endbr64 
  800872:	55                   	push   rbp
  800873:	48 89 e5             	mov    rbp,rsp
  800876:	48 83 ec 60          	sub    rsp,0x60
  80087a:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  80087d:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi

    struct multiboot_header* mbi=0ul;
  800881:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  800888:	00 
    mbi=(struct multiboot_header*)addr;
  800889:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80088d:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    init_logging();
  800891:	b8 00 00 00 00       	mov    eax,0x0
  800896:	e8 68 03 00 00       	call   800c03 <init_logging>
    }
    //获取tags
    struct multiboot_tag *tag;

	unsigned size;
    size = *(unsigned long*)addr;
  80089b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80089f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8008a2:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
//    //printf("Announced mbi size 0x%x\n", size);
	for (tag = (struct multiboot_tag *)(addr + 8);
  8008a5:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8008a9:	48 83 c0 08          	add    rax,0x8
  8008ad:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  8008b1:	e9 5b 02 00 00       	jmp    800b11 <main+0x2a3>
		 tag->type != MULTIBOOT_TAG_TYPE_END;
		 tag = (struct multiboot_tag *)((u8 *)tag + ((tag->size + 7) & ~7)))
	{
		//printf("Tag 0x%x, Size 0x%x\n", tag->type, tag->size);
		switch (tag->type)
  8008b6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008ba:	8b 00                	mov    eax,DWORD PTR [rax]
  8008bc:	83 f8 08             	cmp    eax,0x8
  8008bf:	0f 87 39 02 00 00    	ja     800afe <main+0x290>
  8008c5:	89 c0                	mov    eax,eax
  8008c7:	48 8b 04 c5 d0 54 81 	mov    rax,QWORD PTR [rax*8+0x8154d0]
  8008ce:	00 
  8008cf:	3e ff e0             	notrack jmp rax
			break;
		case MULTIBOOT_TAG_TYPE_BASIC_MEMINFO:
			//printf("mem_lower = %uKB, mem_upper = %uKB\n",
//				   ((struct multiboot_tag_basic_meminfo *)tag)->mem_lower,
//				   ((struct multiboot_tag_basic_meminfo *)tag)->mem_upper);
			set_high_mem_base(((struct multiboot_tag_basic_meminfo *)tag)->mem_lower);
  8008d2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008d6:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8008d9:	89 c7                	mov    edi,eax
  8008db:	e8 bf 08 00 00       	call   80119f <set_high_mem_base>
			break;
  8008e0:	e9 19 02 00 00       	jmp    800afe <main+0x290>

			break;
		case MULTIBOOT_TAG_TYPE_MMAP:
		{
			//printf("mmap\n");
            for (multiboot_memory_map_t * mmap = ((struct multiboot_tag_mmap *)tag)->entries;
  8008e5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008e9:	48 83 c0 10          	add    rax,0x10
  8008ed:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  8008f1:	eb 37                	jmp    80092a <main+0xbc>
                    (multiboot_uint8_t *)mmap < (multiboot_uint8_t *)tag + tag->size;
                    mmap = (multiboot_memory_map_t *)((unsigned long)mmap + ((struct multiboot_tag_mmap *)tag)->entry_size))
            {
                set_mem_area(mmap->addr,mmap->len,mmap->type);
  8008f3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8008f7:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8008fa:	89 c2                	mov    edx,eax
  8008fc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800900:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  800904:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800908:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80090b:	48 89 ce             	mov    rsi,rcx
  80090e:	48 89 c7             	mov    rdi,rax
  800911:	e8 a0 08 00 00       	call   8011b6 <set_mem_area>
                    mmap = (multiboot_memory_map_t *)((unsigned long)mmap + ((struct multiboot_tag_mmap *)tag)->entry_size))
  800916:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80091a:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80091d:	89 c2                	mov    edx,eax
  80091f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800923:	48 01 d0             	add    rax,rdx
  800926:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
                    (multiboot_uint8_t *)mmap < (multiboot_uint8_t *)tag + tag->size;
  80092a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80092e:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800931:	89 c2                	mov    edx,eax
  800933:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800937:	48 01 d0             	add    rax,rdx
  80093a:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  80093e:	72 b3                	jb     8008f3 <main+0x85>
            }

		}
		break;
  800940:	e9 b9 01 00 00       	jmp    800afe <main+0x290>
		case MULTIBOOT_TAG_TYPE_FRAMEBUFFER:
		{
			multiboot_uint32_t color;
			unsigned i;
			struct multiboot_tag_framebuffer *tagfb = (struct multiboot_tag_framebuffer *)tag;
  800945:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800949:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
			void *fb = (void *) FRAMEBUFFER_ADDR;
  80094d:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x40000000
  800954:	40 
			set_framebuffer(*tagfb);
  800955:	48 83 ec 08          	sub    rsp,0x8
  800959:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80095d:	ff 70 20             	push   QWORD PTR [rax+0x20]
  800960:	ff 70 18             	push   QWORD PTR [rax+0x18]
  800963:	ff 70 10             	push   QWORD PTR [rax+0x10]
  800966:	ff 70 08             	push   QWORD PTR [rax+0x8]
  800969:	ff 30                	push   QWORD PTR [rax]
  80096b:	e8 6b 6e 00 00       	call   8077db <set_framebuffer>
  800970:	48 83 c4 30          	add    rsp,0x30

            init_framebuffer();
  800974:	b8 00 00 00 00       	mov    eax,0x0
  800979:	e8 ba 6c 00 00       	call   807638 <init_framebuffer>
			switch (tagfb->common.framebuffer_type)
  80097e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800982:	0f b6 40 1d          	movzx  eax,BYTE PTR [rax+0x1d]
  800986:	0f b6 c0             	movzx  eax,al
  800989:	83 f8 02             	cmp    eax,0x2
  80098c:	0f 84 5a 01 00 00    	je     800aec <main+0x27e>
  800992:	83 f8 02             	cmp    eax,0x2
  800995:	0f 8f 5a 01 00 00    	jg     800af5 <main+0x287>
  80099b:	85 c0                	test   eax,eax
  80099d:	74 0e                	je     8009ad <main+0x13f>
  80099f:	83 f8 01             	cmp    eax,0x1
  8009a2:	0f 84 15 01 00 00    	je     800abd <main+0x24f>
  8009a8:	e9 48 01 00 00       	jmp    800af5 <main+0x287>
			case MULTIBOOT_FRAMEBUFFER_TYPE_INDEXED:
			{
				unsigned best_distance, distance;
				struct multiboot_color *palette;

				palette = tagfb->framebuffer_palette;
  8009ad:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8009b1:	48 83 c0 22          	add    rax,0x22
  8009b5:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

				color = 0;
  8009b9:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
				best_distance = 4 * 256 * 256;
  8009c0:	c7 45 e8 00 00 04 00 	mov    DWORD PTR [rbp-0x18],0x40000

				for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
  8009c7:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8009ce:	e9 d4 00 00 00       	jmp    800aa7 <main+0x239>
				{
					distance = (0xff - palette[i].blue) * (0xff - palette[i].blue) + palette[i].red * palette[i].red + palette[i].green * palette[i].green;
  8009d3:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009d6:	48 89 d0             	mov    rax,rdx
  8009d9:	48 01 c0             	add    rax,rax
  8009dc:	48 01 c2             	add    rdx,rax
  8009df:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009e3:	48 01 d0             	add    rax,rdx
  8009e6:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  8009ea:	0f b6 c0             	movzx  eax,al
  8009ed:	ba ff 00 00 00       	mov    edx,0xff
  8009f2:	89 d1                	mov    ecx,edx
  8009f4:	29 c1                	sub    ecx,eax
  8009f6:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009f9:	48 89 d0             	mov    rax,rdx
  8009fc:	48 01 c0             	add    rax,rax
  8009ff:	48 01 c2             	add    rdx,rax
  800a02:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800a06:	48 01 d0             	add    rax,rdx
  800a09:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  800a0d:	0f b6 d0             	movzx  edx,al
  800a10:	b8 ff 00 00 00       	mov    eax,0xff
  800a15:	29 d0                	sub    eax,edx
  800a17:	89 ce                	mov    esi,ecx
  800a19:	0f af f0             	imul   esi,eax
  800a1c:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800a1f:	48 89 d0             	mov    rax,rdx
  800a22:	48 01 c0             	add    rax,rax
  800a25:	48 01 c2             	add    rdx,rax
  800a28:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800a2c:	48 01 d0             	add    rax,rdx
  800a2f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800a32:	0f b6 c8             	movzx  ecx,al
  800a35:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800a38:	48 89 d0             	mov    rax,rdx
  800a3b:	48 01 c0             	add    rax,rax
  800a3e:	48 01 c2             	add    rdx,rax
  800a41:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800a45:	48 01 d0             	add    rax,rdx
  800a48:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800a4b:	0f b6 c0             	movzx  eax,al
  800a4e:	0f af c1             	imul   eax,ecx
  800a51:	01 c6                	add    esi,eax
  800a53:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800a56:	48 89 d0             	mov    rax,rdx
  800a59:	48 01 c0             	add    rax,rax
  800a5c:	48 01 c2             	add    rdx,rax
  800a5f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800a63:	48 01 d0             	add    rax,rdx
  800a66:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  800a6a:	0f b6 c8             	movzx  ecx,al
  800a6d:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800a70:	48 89 d0             	mov    rax,rdx
  800a73:	48 01 c0             	add    rax,rax
  800a76:	48 01 c2             	add    rdx,rax
  800a79:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800a7d:	48 01 d0             	add    rax,rdx
  800a80:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  800a84:	0f b6 c0             	movzx  eax,al
  800a87:	0f af c1             	imul   eax,ecx
  800a8a:	01 f0                	add    eax,esi
  800a8c:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
					if (distance < best_distance)
  800a8f:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  800a92:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  800a95:	73 0c                	jae    800aa3 <main+0x235>
					{
						color = i;
  800a97:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800a9a:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
						best_distance = distance;
  800a9d:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  800aa0:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
				for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
  800aa3:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  800aa7:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800aab:	0f b7 40 20          	movzx  eax,WORD PTR [rax+0x20]
  800aaf:	0f b7 c0             	movzx  eax,ax
  800ab2:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  800ab5:	0f 82 18 ff ff ff    	jb     8009d3 <main+0x165>
					}
				}
			}
			break;
  800abb:	eb 40                	jmp    800afd <main+0x28f>

			case MULTIBOOT_FRAMEBUFFER_TYPE_RGB:
				color = ((1 << tagfb->framebuffer_blue_mask_size) - 1) << tagfb->framebuffer_blue_field_position;
  800abd:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800ac1:	0f b6 40 25          	movzx  eax,BYTE PTR [rax+0x25]
  800ac5:	0f b6 c0             	movzx  eax,al
  800ac8:	ba 01 00 00 00       	mov    edx,0x1
  800acd:	89 c1                	mov    ecx,eax
  800acf:	d3 e2                	shl    edx,cl
  800ad1:	89 d0                	mov    eax,edx
  800ad3:	8d 50 ff             	lea    edx,[rax-0x1]
  800ad6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800ada:	0f b6 40 24          	movzx  eax,BYTE PTR [rax+0x24]
  800ade:	0f b6 c0             	movzx  eax,al
  800ae1:	89 c1                	mov    ecx,eax
  800ae3:	d3 e2                	shl    edx,cl
  800ae5:	89 d0                	mov    eax,edx
  800ae7:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
				break;
  800aea:	eb 11                	jmp    800afd <main+0x28f>

			case MULTIBOOT_FRAMEBUFFER_TYPE_EGA_TEXT:
				color = '\\' | 0x0100;
  800aec:	c7 45 c4 5c 01 00 00 	mov    DWORD PTR [rbp-0x3c],0x15c
				break;
  800af3:	eb 08                	jmp    800afd <main+0x28f>

			default:
				color = 0xffffffff;
  800af5:	c7 45 c4 ff ff ff ff 	mov    DWORD PTR [rbp-0x3c],0xffffffff
				break;
  800afc:	90                   	nop
			}

			break;
  800afd:	90                   	nop
		 tag = (struct multiboot_tag *)((u8 *)tag + ((tag->size + 7) & ~7)))
  800afe:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800b02:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800b05:	83 c0 07             	add    eax,0x7
  800b08:	89 c0                	mov    eax,eax
  800b0a:	83 e0 f8             	and    eax,0xfffffff8
  800b0d:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
		 tag->type != MULTIBOOT_TAG_TYPE_END;
  800b11:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800b15:	8b 00                	mov    eax,DWORD PTR [rax]
  800b17:	85 c0                	test   eax,eax
  800b19:	0f 85 97 fd ff ff    	jne    8008b6 <main+0x48>
		}
		}
	}
	tag = (struct multiboot_tag *)((multiboot_uint8_t *)tag + ((tag->size + 7) & ~7));
  800b1f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800b23:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800b26:	83 c0 07             	add    eax,0x7
  800b29:	89 c0                	mov    eax,eax
  800b2b:	83 e0 f8             	and    eax,0xfffffff8
  800b2e:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
	//printf("Total mbi size 0x%x\n", (unsigned)tag - addr);
	char disk_count=*(char*)0x475;
  800b32:	b8 75 04 00 00       	mov    eax,0x475
  800b37:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800b3a:	88 45 db             	mov    BYTE PTR [rbp-0x25],al
	//printf("disk count:%d\n",disk_count);
    init_font();
  800b3d:	b8 00 00 00 00       	mov    eax,0x0
  800b42:	e8 be 6b 00 00       	call   807705 <init_font>
    //初始化区域
    //fill_rect(0,0,100,100,255);
    print("gamessis os loaded.\nkernel:>");
  800b47:	bf 88 54 81 00       	mov    edi,0x815488
  800b4c:	e8 4d 70 00 00       	call   807b9e <print>
    init_int();
  800b51:	b8 00 00 00 00       	mov    eax,0x0
  800b56:	e8 a5 f4 ff ff       	call   800000 <init_int>
    print("int loaded.\n");
  800b5b:	bf a5 54 81 00       	mov    edi,0x8154a5
  800b60:	e8 39 70 00 00       	call   807b9e <print>
//    set_tss(0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000);
    init_memory();
  800b65:	b8 00 00 00 00       	mov    eax,0x0
  800b6a:	e8 2a 09 00 00       	call   801499 <init_memory>
    init_com(PORT_COM1);
  800b6f:	bf f8 03 00 00       	mov    edi,0x3f8
  800b74:	e8 db c1 00 00       	call   80cd54 <init_com>
    comprintf("\rgamessis os loaded.\r\n");
  800b79:	bf b2 54 81 00       	mov    edi,0x8154b2
  800b7e:	b8 00 00 00 00       	mov    eax,0x0
  800b83:	e8 0f c3 00 00       	call   80ce97 <comprintf>
	init_paging();
  800b88:	b8 00 00 00 00       	mov    eax,0x0
  800b8d:	e8 02 06 00 00       	call   801194 <init_paging>
 	init_gdt();
  800b92:	b8 00 00 00 00       	mov    eax,0x0
  800b97:	e8 f1 5c 00 00       	call   80688d <init_gdt>
    mount_rootfs();
  800b9c:	b8 00 00 00 00       	mov    eax,0x0
  800ba1:	e8 8e 77 00 00       	call   808334 <mount_rootfs>
    init_devman();
  800ba6:	b8 00 00 00 00       	mov    eax,0x0
  800bab:	e8 70 1d 00 00       	call   802920 <init_devman>
    init_proc();
  800bb0:	b8 00 00 00 00       	mov    eax,0x0
  800bb5:	e8 5e 33 00 00       	call   803f18 <init_proc>
    sti();
  800bba:	fb                   	sti    
    DISK1_FAT32_FS_init();
  800bbb:	b8 00 00 00 00       	mov    eax,0x0
  800bc0:	e8 55 bb 00 00       	call   80c71a <DISK1_FAT32_FS_init>

    //自带驱动
    //init_tty();
    init_kb();
  800bc5:	b8 00 00 00 00       	mov    eax,0x0
  800bca:	e8 3a 87 00 00       	call   809309 <init_kb>
//    init_disk();


    manage_proc_lock=0;
  800bcf:	c7 05 0f cd 00 00 00 	mov    DWORD PTR [rip+0xcd0f],0x0        # 80d8e8 <manage_proc_lock>
  800bd6:	00 00 00 
//    extern device *dev_tree[];
//    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
//    mount_fs("fat16",p->par,vmalloc());
    while (1)
    {
        char c=-1;
  800bd9:	c6 45 b3 ff          	mov    BYTE PTR [rbp-0x4d],0xff
        sys_read(0,&c,1);
  800bdd:	48 8d 45 b3          	lea    rax,[rbp-0x4d]
  800be1:	ba 01 00 00 00       	mov    edx,0x1
  800be6:	48 89 c6             	mov    rsi,rax
  800be9:	bf 00 00 00 00       	mov    edi,0x0
  800bee:	e8 1c 7f 00 00       	call   808b0f <sys_read>
        putchar(c);
  800bf3:	0f b6 45 b3          	movzx  eax,BYTE PTR [rbp-0x4d]
  800bf7:	0f be c0             	movsx  eax,al
  800bfa:	89 c7                	mov    edi,eax
  800bfc:	e8 41 01 00 00       	call   800d42 <putchar>
    {
  800c01:	eb d6                	jmp    800bd9 <main+0x36b>

0000000000800c03 <init_logging>:
static unsigned char* video;
static int xpos,ypos;
/* 将整数 D 转换为字符串并保存在 BUF 中。如果 BASE 为 'd'，则 D 为十进制，如果 BASE 为 'x'，则 D 为十六进制。 */

int init_logging()
{
  800c03:	f3 0f 1e fa          	endbr64 
  800c07:	55                   	push   rbp
  800c08:	48 89 e5             	mov    rbp,rsp
    video=0xb8000;
  800c0b:	48 c7 05 ea f3 bf ff 	mov    QWORD PTR [rip+0xffffffffffbff3ea],0xb8000        # 400000 <video>
  800c12:	00 80 0b 00 
    xpos=0;
  800c16:	c7 05 e8 f3 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff3e8],0x0        # 400008 <xpos>
  800c1d:	00 00 00 
    ypos=0;
  800c20:	c7 05 e2 f3 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff3e2],0x0        # 40000c <ypos>
  800c27:	00 00 00 
}
  800c2a:	90                   	nop
  800c2b:	5d                   	pop    rbp
  800c2c:	c3                   	ret    

0000000000800c2d <itoa>:

void itoa (char *buf, int base, int d)
{
  800c2d:	f3 0f 1e fa          	endbr64 
  800c31:	55                   	push   rbp
  800c32:	48 89 e5             	mov    rbp,rsp
  800c35:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  800c39:	89 75 c4             	mov    DWORD PTR [rbp-0x3c],esi
  800c3c:	89 55 c0             	mov    DWORD PTR [rbp-0x40],edx
    char *p = buf;
  800c3f:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800c43:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char *p1, *p2;
    unsigned long ud = d;
  800c47:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800c4a:	48 98                	cdqe   
  800c4c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    int divisor = 10;
  800c50:	c7 45 dc 0a 00 00 00 	mov    DWORD PTR [rbp-0x24],0xa
 
    /* 如果指定了 %d 并且 D 是负数，在开始添上负号。 */
    if (base == 'd' && d < 0)
  800c57:	83 7d c4 64          	cmp    DWORD PTR [rbp-0x3c],0x64
  800c5b:	75 27                	jne    800c84 <itoa+0x57>
  800c5d:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
  800c61:	79 21                	jns    800c84 <itoa+0x57>
    {
        *p++ = '-';
  800c63:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c67:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800c6b:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800c6f:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
        buf++;
  800c72:	48 83 45 c8 01       	add    QWORD PTR [rbp-0x38],0x1
        ud = -d;
  800c77:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800c7a:	f7 d8                	neg    eax
  800c7c:	48 98                	cdqe   
  800c7e:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800c82:	eb 0d                	jmp    800c91 <itoa+0x64>
    }
    else if (base == 'x')
  800c84:	83 7d c4 78          	cmp    DWORD PTR [rbp-0x3c],0x78
  800c88:	75 07                	jne    800c91 <itoa+0x64>
        divisor = 16;
  800c8a:	c7 45 dc 10 00 00 00 	mov    DWORD PTR [rbp-0x24],0x10
 
    /* 用 DIVISOR 去除 UD 直到 UD == 0。 */
    do
    {
        int remainder = ud % divisor;
  800c91:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800c94:	48 63 c8             	movsxd rcx,eax
  800c97:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800c9b:	ba 00 00 00 00       	mov    edx,0x0
  800ca0:	48 f7 f1             	div    rcx
  800ca3:	48 89 d0             	mov    rax,rdx
  800ca6:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
 
        *p++ = (remainder < 10) ? remainder + '0' : remainder + 'a' - 10;
  800ca9:	83 7d d8 09          	cmp    DWORD PTR [rbp-0x28],0x9
  800cad:	7f 0a                	jg     800cb9 <itoa+0x8c>
  800caf:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800cb2:	83 c0 30             	add    eax,0x30
  800cb5:	89 c1                	mov    ecx,eax
  800cb7:	eb 08                	jmp    800cc1 <itoa+0x94>
  800cb9:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800cbc:	83 c0 57             	add    eax,0x57
  800cbf:	89 c1                	mov    ecx,eax
  800cc1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800cc5:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800cc9:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800ccd:	88 08                	mov    BYTE PTR [rax],cl
    }
    while (ud /= divisor);
  800ccf:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800cd2:	48 63 f0             	movsxd rsi,eax
  800cd5:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800cd9:	ba 00 00 00 00       	mov    edx,0x0
  800cde:	48 f7 f6             	div    rsi
  800ce1:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800ce5:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  800cea:	75 a5                	jne    800c91 <itoa+0x64>
 
    /* 在字符串尾添上终结符。 */
    *p = 0;
  800cec:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800cf0:	c6 00 00             	mov    BYTE PTR [rax],0x0
 
    /* 反转 BUF。 */
    p1 = buf;
  800cf3:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800cf7:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    p2 = p - 1;
  800cfb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800cff:	48 83 e8 01          	sub    rax,0x1
  800d03:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    while (p1 < p2)
  800d07:	eb 2b                	jmp    800d34 <itoa+0x107>
    {
        char tmp = *p1;
  800d09:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800d0d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800d10:	88 45 d7             	mov    BYTE PTR [rbp-0x29],al
        *p1 = *p2;
  800d13:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800d17:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  800d1a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800d1e:	88 10                	mov    BYTE PTR [rax],dl
        *p2 = tmp;
  800d20:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800d24:	0f b6 55 d7          	movzx  edx,BYTE PTR [rbp-0x29]
  800d28:	88 10                	mov    BYTE PTR [rax],dl
        p1++;
  800d2a:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        p2--;
  800d2f:	48 83 6d e8 01       	sub    QWORD PTR [rbp-0x18],0x1
    while (p1 < p2)
  800d34:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800d38:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
  800d3c:	72 cb                	jb     800d09 <itoa+0xdc>
    }
}
  800d3e:	90                   	nop
  800d3f:	90                   	nop
  800d40:	5d                   	pop    rbp
  800d41:	c3                   	ret    

0000000000800d42 <putchar>:
 
/* 在屏幕上输出字符 C 。 */
void putchar (char c)
{
  800d42:	f3 0f 1e fa          	endbr64 
  800d46:	55                   	push   rbp
  800d47:	48 89 e5             	mov    rbp,rsp
  800d4a:	48 83 ec 20          	sub    rsp,0x20
  800d4e:	89 f8                	mov    eax,edi
  800d50:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    char s[2]={c,'\0'};
  800d53:	0f b6 45 ec          	movzx  eax,BYTE PTR [rbp-0x14]
  800d57:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
  800d5a:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
    print(s);
  800d5e:	48 8d 45 fe          	lea    rax,[rbp-0x2]
  800d62:	48 89 c7             	mov    rdi,rax
  800d65:	e8 34 6e 00 00       	call   807b9e <print>
    *(video + (xpos + ypos * COLUMNS) * 2 + 1) = ATTRIBUTE;
 
    xpos++;
    if (xpos >= COLUMNS)
        goto newline;
}
  800d6a:	c9                   	leave  
  800d6b:	c3                   	ret    

0000000000800d6c <printf>:
 
/* 格式化字符串并在屏幕上输出，就像 libc 函数 printf 一样。 */
void printf (const char *format,...)
{
  800d6c:	f3 0f 1e fa          	endbr64 
  800d70:	55                   	push   rbp
  800d71:	48 89 e5             	mov    rbp,rsp
  800d74:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  800d7b:	48 89 bd 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rdi
  800d82:	48 89 b5 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rsi
  800d89:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  800d90:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  800d97:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  800d9e:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  800da5:	84 c0                	test   al,al
  800da7:	74 20                	je     800dc9 <printf+0x5d>
  800da9:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  800dad:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  800db1:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  800db5:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  800db9:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  800dbd:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  800dc1:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  800dc5:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7
    if(strlen(format)>=1024)
  800dc9:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  800dd0:	48 89 c7             	mov    rdi,rax
  800dd3:	e8 4f c4 00 00       	call   80d227 <strlen>
  800dd8:	3d ff 03 00 00       	cmp    eax,0x3ff
  800ddd:	0f 8f 97 00 00 00    	jg     800e7a <printf+0x10e>
        return;//一次性输出不了太长
    char* tmp=(char*)vmalloc();
  800de3:	b8 00 00 00 00       	mov    eax,0x0
  800de8:	e8 55 04 00 00       	call   801242 <vmalloc>
  800ded:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    va_list vargs;
    va_start(vargs,format);
  800df4:	c7 85 30 ff ff ff 08 	mov    DWORD PTR [rbp-0xd0],0x8
  800dfb:	00 00 00 
  800dfe:	c7 85 34 ff ff ff 30 	mov    DWORD PTR [rbp-0xcc],0x30
  800e05:	00 00 00 
  800e08:	48 8d 45 10          	lea    rax,[rbp+0x10]
  800e0c:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
  800e13:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  800e1a:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    sprintf(tmp,format,vargs);
  800e21:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  800e28:	48 8b 8d 28 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xd8]
  800e2f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e36:	48 89 ce             	mov    rsi,rcx
  800e39:	48 89 c7             	mov    rdi,rax
  800e3c:	b8 00 00 00 00       	mov    eax,0x0
  800e41:	e8 0f c4 00 00       	call   80d255 <sprintf>
    va_end(vargs);
    print(tmp);
  800e46:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e4d:	48 89 c7             	mov    rdi,rax
  800e50:	e8 49 6d 00 00       	call   807b9e <print>
    comprintf(tmp);
  800e55:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e5c:	48 89 c7             	mov    rdi,rax
  800e5f:	b8 00 00 00 00       	mov    eax,0x0
  800e64:	e8 2e c0 00 00       	call   80ce97 <comprintf>
    vmfree(tmp);
  800e69:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e70:	48 89 c7             	mov    rdi,rax
  800e73:	e8 59 04 00 00       	call   8012d1 <vmfree>
  800e78:	eb 01                	jmp    800e7b <printf+0x10f>
        return;//一次性输出不了太长
  800e7a:	90                   	nop
//                putchar (*((int *) arg++));
//                break;
//            }
//        }
//    }
}
  800e7b:	c9                   	leave  
  800e7c:	c3                   	ret    

0000000000800e7d <mmap>:
//以kb为单位
int high_mem_base=1024;
int mmap_t_i=0;

stat_t mmap(addr_t pa,addr_t la,u32 attr)
{
  800e7d:	f3 0f 1e fa          	endbr64 
  800e81:	55                   	push   rbp
  800e82:	48 89 e5             	mov    rbp,rsp
  800e85:	48 83 ec 40          	sub    rsp,0x40
  800e89:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  800e8d:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  800e91:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    page_item *pdptp= (page_item *) (pml4[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
  800e94:	48 8b 15 65 ca 00 00 	mov    rdx,QWORD PTR [rip+0xca65]        # 80d900 <pml4>
  800e9b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800e9f:	48 c1 e8 27          	shr    rax,0x27
  800ea3:	48 c1 e0 03          	shl    rax,0x3
  800ea7:	48 01 d0             	add    rax,rdx
  800eaa:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800ead:	b0 00                	mov    al,0x0
  800eaf:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
  800eb3:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  800eba:	00 00 00 
  800ebd:	48 23 45 d0          	and    rax,QWORD PTR [rbp-0x30]
  800ec1:	48 c1 e8 1e          	shr    rax,0x1e
  800ec5:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
  800ec8:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800ecb:	48 98                	cdqe   
  800ecd:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800ed4:	00 
  800ed5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800ed9:	48 01 d0             	add    rax,rdx
  800edc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800edf:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
  800ee3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800ee7:	83 e0 01             	and    eax,0x1
  800eea:	48 85 c0             	test   rax,rax
  800eed:	75 45                	jne    800f34 <mmap+0xb7>
    {
        pdp=(page_item*)vmalloc();
  800eef:	b8 00 00 00 00       	mov    eax,0x0
  800ef4:	e8 49 03 00 00       	call   801242 <vmalloc>
  800ef9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        memset(pdp,0,4096);
  800efd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f01:	ba 00 10 00 00       	mov    edx,0x1000
  800f06:	be 00 00 00 00       	mov    esi,0x0
  800f0b:	48 89 c7             	mov    rdi,rax
  800f0e:	e8 a6 c0 00 00       	call   80cfb9 <memset>
        pdptp[pdpti]=(addr_t)pdp|attr;
  800f13:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800f16:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  800f1a:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800f1d:	48 98                	cdqe   
  800f1f:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800f26:	00 
  800f27:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800f2b:	48 01 f0             	add    rax,rsi
  800f2e:	48 09 ca             	or     rdx,rcx
  800f31:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pdp=(page_item*)((addr_t)pdp&~0xff);
  800f34:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f38:	b0 00                	mov    al,0x0
  800f3a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
  800f3e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800f42:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800f47:	48 c1 e8 15          	shr    rax,0x15
  800f4b:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800f52:	00 
  800f53:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f57:	48 01 d0             	add    rax,rdx
  800f5a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f5d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!((unsigned long long)pt & PAGE_PRESENT))
  800f61:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800f65:	83 e0 01             	and    eax,0x1
  800f68:	48 85 c0             	test   rax,rax
  800f6b:	75 4d                	jne    800fba <mmap+0x13d>
    {
        pt=(page_item*)vmalloc();
  800f6d:	b8 00 00 00 00       	mov    eax,0x0
  800f72:	e8 cb 02 00 00       	call   801242 <vmalloc>
  800f77:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        memset(pt,0,4096);
  800f7b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800f7f:	ba 00 10 00 00       	mov    edx,0x1000
  800f84:	be 00 00 00 00       	mov    esi,0x0
  800f89:	48 89 c7             	mov    rdi,rax
  800f8c:	e8 28 c0 00 00       	call   80cfb9 <memset>
        pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
  800f91:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800f94:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800f98:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800f9c:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800fa1:	48 c1 e8 15          	shr    rax,0x15
  800fa5:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800fac:	00 
  800fad:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800fb1:	48 01 f0             	add    rax,rsi
  800fb4:	48 09 ca             	or     rdx,rcx
  800fb7:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pt=(page_item*)((addr_t)pt & ~0xff);
  800fba:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800fbe:	b0 00                	mov    al,0x0
  800fc0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
  800fc4:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  800fc7:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  800fcb:	81 e2 ff ff 1f 00    	and    edx,0x1fffff
  800fd1:	48 c1 ea 0c          	shr    rdx,0xc
  800fd5:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
  800fdc:	00 
  800fdd:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800fe1:	48 01 ca             	add    rdx,rcx
  800fe4:	48 0b 45 d8          	or     rax,QWORD PTR [rbp-0x28]
  800fe8:	48 89 02             	mov    QWORD PTR [rdx],rax
    return NORMAL;
  800feb:	b8 00 00 00 00       	mov    eax,0x0
}
  800ff0:	c9                   	leave  
  800ff1:	c3                   	ret    

0000000000800ff2 <smmap>:

stat_t smmap(addr_t pa,addr_t la,u32 attr,page_item* pml4p)
{
  800ff2:	f3 0f 1e fa          	endbr64 
  800ff6:	55                   	push   rbp
  800ff7:	48 89 e5             	mov    rbp,rsp
  800ffa:	48 83 ec 40          	sub    rsp,0x40
  800ffe:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  801002:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  801006:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
  801009:	48 89 4d c0          	mov    QWORD PTR [rbp-0x40],rcx
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    page_item *pdptp= (page_item *) (pml4p[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
  80100d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  801011:	48 c1 e8 27          	shr    rax,0x27
  801015:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80101c:	00 
  80101d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  801021:	48 01 d0             	add    rax,rdx
  801024:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801027:	b0 00                	mov    al,0x0
  801029:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
  80102d:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  801034:	00 00 00 
  801037:	48 23 45 d0          	and    rax,QWORD PTR [rbp-0x30]
  80103b:	48 c1 e8 1e          	shr    rax,0x1e
  80103f:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
  801042:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801045:	48 98                	cdqe   
  801047:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80104e:	00 
  80104f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801053:	48 01 d0             	add    rax,rdx
  801056:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801059:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
  80105d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801061:	83 e0 01             	and    eax,0x1
  801064:	48 85 c0             	test   rax,rax
  801067:	75 45                	jne    8010ae <smmap+0xbc>
    {
        pdp=(page_item*)vmalloc();
  801069:	b8 00 00 00 00       	mov    eax,0x0
  80106e:	e8 cf 01 00 00       	call   801242 <vmalloc>
  801073:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        memset(pdp,0,4096);
  801077:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80107b:	ba 00 10 00 00       	mov    edx,0x1000
  801080:	be 00 00 00 00       	mov    esi,0x0
  801085:	48 89 c7             	mov    rdi,rax
  801088:	e8 2c bf 00 00       	call   80cfb9 <memset>
        pdptp[pdpti]=(addr_t)pdp|attr;
  80108d:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  801090:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  801094:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801097:	48 98                	cdqe   
  801099:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  8010a0:	00 
  8010a1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8010a5:	48 01 f0             	add    rax,rsi
  8010a8:	48 09 ca             	or     rdx,rcx
  8010ab:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pdp=(page_item*)((addr_t)pdp&~0xff);
  8010ae:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8010b2:	b0 00                	mov    al,0x0
  8010b4:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
  8010b8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8010bc:	25 ff ff ff 3f       	and    eax,0x3fffffff
  8010c1:	48 c1 e8 15          	shr    rax,0x15
  8010c5:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8010cc:	00 
  8010cd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8010d1:	48 01 d0             	add    rax,rdx
  8010d4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8010d7:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!((unsigned long long)pt & PAGE_PRESENT))
  8010db:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8010df:	83 e0 01             	and    eax,0x1
  8010e2:	48 85 c0             	test   rax,rax
  8010e5:	75 4d                	jne    801134 <smmap+0x142>
    {
        pt=(page_item*)vmalloc();
  8010e7:	b8 00 00 00 00       	mov    eax,0x0
  8010ec:	e8 51 01 00 00       	call   801242 <vmalloc>
  8010f1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        memset(pt,0,4096);
  8010f5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8010f9:	ba 00 10 00 00       	mov    edx,0x1000
  8010fe:	be 00 00 00 00       	mov    esi,0x0
  801103:	48 89 c7             	mov    rdi,rax
  801106:	e8 ae be 00 00       	call   80cfb9 <memset>
        pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
  80110b:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  80110e:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  801112:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  801116:	25 ff ff ff 3f       	and    eax,0x3fffffff
  80111b:	48 c1 e8 15          	shr    rax,0x15
  80111f:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  801126:	00 
  801127:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80112b:	48 01 f0             	add    rax,rsi
  80112e:	48 09 ca             	or     rdx,rcx
  801131:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pt=(page_item*)((addr_t)pt & ~0xff);
  801134:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801138:	b0 00                	mov    al,0x0
  80113a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
  80113e:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  801141:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  801145:	81 e2 ff ff 1f 00    	and    edx,0x1fffff
  80114b:	48 c1 ea 0c          	shr    rdx,0xc
  80114f:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
  801156:	00 
  801157:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80115b:	48 01 ca             	add    rdx,rcx
  80115e:	48 0b 45 d8          	or     rax,QWORD PTR [rbp-0x28]
  801162:	48 89 02             	mov    QWORD PTR [rdx],rax
    return NORMAL;
  801165:	b8 00 00 00 00       	mov    eax,0x0
}
  80116a:	c9                   	leave  
  80116b:	c3                   	ret    

000000000080116c <mdemap>:

stat_t mdemap(addr_t la)
{
  80116c:	f3 0f 1e fa          	endbr64 
  801170:	55                   	push   rbp
  801171:	48 89 e5             	mov    rbp,rsp
  801174:	48 83 ec 10          	sub    rsp,0x10
  801178:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return mmap(0l,la,0);
  80117c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801180:	ba 00 00 00 00       	mov    edx,0x0
  801185:	48 89 c6             	mov    rsi,rax
  801188:	bf 00 00 00 00       	mov    edi,0x0
  80118d:	e8 eb fc ff ff       	call   800e7d <mmap>
}
  801192:	c9                   	leave  
  801193:	c3                   	ret    

0000000000801194 <init_paging>:
int init_paging()
{
  801194:	f3 0f 1e fa          	endbr64 
  801198:	55                   	push   rbp
  801199:	48 89 e5             	mov    rbp,rsp
    //设置第一项pdpte，也就是内核空间
//    set_1gb_pdpt(pdpt,0,PAGE_RWX);//设置PDPT0x40000000ul
//    set_page_item(pdpt+1,PD_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);

    #endif
}
  80119c:	90                   	nop
  80119d:	5d                   	pop    rbp
  80119e:	c3                   	ret    

000000000080119f <set_high_mem_base>:
void set_high_mem_base(int base)
{
  80119f:	f3 0f 1e fa          	endbr64 
  8011a3:	55                   	push   rbp
  8011a4:	48 89 e5             	mov    rbp,rsp
  8011a7:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    high_mem_base=base;
  8011aa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8011ad:	89 05 65 c7 00 00    	mov    DWORD PTR [rip+0xc765],eax        # 80d918 <high_mem_base>
}
  8011b3:	90                   	nop
  8011b4:	5d                   	pop    rbp
  8011b5:	c3                   	ret    

00000000008011b6 <set_mem_area>:
void set_mem_area(unsigned long base, unsigned long len, unsigned long type)
{
  8011b6:	f3 0f 1e fa          	endbr64 
  8011ba:	55                   	push   rbp
  8011bb:	48 89 e5             	mov    rbp,rsp
  8011be:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8011c2:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8011c6:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
    mmap_struct[mmap_t_i].base=base;
  8011ca:	8b 05 50 f0 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff050]        # 400220 <mmap_t_i>
  8011d0:	48 63 d0             	movsxd rdx,eax
  8011d3:	48 89 d0             	mov    rax,rdx
  8011d6:	48 01 c0             	add    rax,rax
  8011d9:	48 01 d0             	add    rax,rdx
  8011dc:	48 c1 e0 03          	shl    rax,0x3
  8011e0:	48 8d 90 40 00 40 00 	lea    rdx,[rax+0x400040]
  8011e7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8011eb:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i].len=len;
  8011ee:	8b 05 2c f0 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff02c]        # 400220 <mmap_t_i>
  8011f4:	48 63 d0             	movsxd rdx,eax
  8011f7:	48 89 d0             	mov    rax,rdx
  8011fa:	48 01 c0             	add    rax,rax
  8011fd:	48 01 d0             	add    rax,rdx
  801200:	48 c1 e0 03          	shl    rax,0x3
  801204:	48 8d 90 48 00 40 00 	lea    rdx,[rax+0x400048]
  80120b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80120f:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i++].type=type;
  801212:	8b 05 08 f0 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff008]        # 400220 <mmap_t_i>
  801218:	8d 50 01             	lea    edx,[rax+0x1]
  80121b:	89 15 ff ef bf ff    	mov    DWORD PTR [rip+0xffffffffffbfefff],edx        # 400220 <mmap_t_i>
  801221:	48 63 d0             	movsxd rdx,eax
  801224:	48 89 d0             	mov    rax,rdx
  801227:	48 01 c0             	add    rax,rax
  80122a:	48 01 d0             	add    rax,rdx
  80122d:	48 c1 e0 03          	shl    rax,0x3
  801231:	48 8d 90 50 00 40 00 	lea    rdx,[rax+0x400050]
  801238:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80123c:	48 89 02             	mov    QWORD PTR [rdx],rax
}
  80123f:	90                   	nop
  801240:	5d                   	pop    rbp
  801241:	c3                   	ret    

0000000000801242 <vmalloc>:
addr_t vmalloc()
{
  801242:	f3 0f 1e fa          	endbr64 
  801246:	55                   	push   rbp
  801247:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<VMALLOC_PGN/32;i++)
  80124a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801251:	eb 76                	jmp    8012c9 <vmalloc+0x87>
    {
        for(int j=0;j<32;j++)
  801253:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80125a:	eb 63                	jmp    8012bf <vmalloc+0x7d>
        {
            if(!(vmalloc_map[i]&(1<<j)))
  80125c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80125f:	48 98                	cdqe   
  801261:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  801268:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80126b:	be 01 00 00 00       	mov    esi,0x1
  801270:	89 c1                	mov    ecx,eax
  801272:	d3 e6                	shl    esi,cl
  801274:	89 f0                	mov    eax,esi
  801276:	21 d0                	and    eax,edx
  801278:	85 c0                	test   eax,eax
  80127a:	75 3f                	jne    8012bb <vmalloc+0x79>
            {
                vmalloc_map[i]|=(1<<j);
  80127c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80127f:	48 98                	cdqe   
  801281:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  801288:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80128b:	be 01 00 00 00       	mov    esi,0x1
  801290:	89 c1                	mov    ecx,eax
  801292:	d3 e6                	shl    esi,cl
  801294:	89 f0                	mov    eax,esi
  801296:	09 c2                	or     edx,eax
  801298:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80129b:	48 98                	cdqe   
  80129d:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
                return VMALLOC_BASE+(i*32+j)*0x1000;
  8012a4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8012a7:	c1 e0 05             	shl    eax,0x5
  8012aa:	89 c2                	mov    edx,eax
  8012ac:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8012af:	01 d0                	add    eax,edx
  8012b1:	83 c0 20             	add    eax,0x20
  8012b4:	c1 e0 0c             	shl    eax,0xc
  8012b7:	48 98                	cdqe   
  8012b9:	eb 14                	jmp    8012cf <vmalloc+0x8d>
        for(int j=0;j<32;j++)
  8012bb:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8012bf:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  8012c3:	7e 97                	jle    80125c <vmalloc+0x1a>
    for(int i=0;i<VMALLOC_PGN/32;i++)
  8012c5:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8012c9:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  8012cd:	7e 84                	jle    801253 <vmalloc+0x11>
            }
        }
    }
}
  8012cf:	5d                   	pop    rbp
  8012d0:	c3                   	ret    

00000000008012d1 <vmfree>:

int vmfree(addr_t ptr)
{
  8012d1:	f3 0f 1e fa          	endbr64 
  8012d5:	55                   	push   rbp
  8012d6:	48 89 e5             	mov    rbp,rsp
  8012d9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=ptr/PAGE_SIZE;
  8012dd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8012e1:	48 c1 e8 0c          	shr    rax,0xc
  8012e5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  8012e8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8012eb:	8d 50 1f             	lea    edx,[rax+0x1f]
  8012ee:	85 c0                	test   eax,eax
  8012f0:	0f 48 c2             	cmovs  eax,edx
  8012f3:	c1 f8 05             	sar    eax,0x5
  8012f6:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  8012f9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8012fc:	99                   	cdq    
  8012fd:	c1 ea 1b             	shr    edx,0x1b
  801300:	01 d0                	add    eax,edx
  801302:	83 e0 1f             	and    eax,0x1f
  801305:	29 d0                	sub    eax,edx
  801307:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    vmalloc_map[n]=vmalloc_map[n]&~(unsigned int)(1<<r);
  80130a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80130d:	48 98                	cdqe   
  80130f:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  801316:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801319:	be 01 00 00 00       	mov    esi,0x1
  80131e:	89 c1                	mov    ecx,eax
  801320:	d3 e6                	shl    esi,cl
  801322:	89 f0                	mov    eax,esi
  801324:	f7 d0                	not    eax
  801326:	21 c2                	and    edx,eax
  801328:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80132b:	48 98                	cdqe   
  80132d:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
}
  801334:	90                   	nop
  801335:	5d                   	pop    rbp
  801336:	c3                   	ret    

0000000000801337 <page_err>:
void page_err(){
  801337:	f3 0f 1e fa          	endbr64 
  80133b:	55                   	push   rbp
  80133c:	48 89 e5             	mov    rbp,rsp
  80133f:	41 54                	push   r12
  801341:	53                   	push   rbx
  801342:	48 83 ec 20          	sub    rsp,0x20
    asm("cli");
  801346:	fa                   	cli    
    printf("page err\n");
  801347:	bf 18 55 81 00       	mov    edi,0x815518
  80134c:	b8 00 00 00 00       	mov    eax,0x0
  801351:	e8 16 fa ff ff       	call   800d6c <printf>
    unsigned long err_code=0,l_addr=0;
  801356:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80135d:	00 
  80135e:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  801365:	00 
    asm volatile("mov 0(%%rbp),%0":"=r"(err_code));
  801366:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
  80136a:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    asm volatile("mov %%cr2,%0":"=r"(l_addr));//试图访问的地址
  80136e:	0f 20 d0             	mov    rax,cr2
  801371:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    int p=err_code&1;
  801375:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801379:	83 e0 01             	and    eax,0x1
  80137c:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

    if(!p)
  80137f:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801383:	75 41                	jne    8013c6 <page_err+0x8f>
        //accessing non-existent page
        //检查地址合法性
        if(l_addr>=MEM_END)
            ;
        //在进程的页表中申请新页
        smmap(get_phyaddr(req_a_page()),l_addr&~0xfff,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,current->pml4);
  801385:	48 8b 05 b4 3e c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc13eb4]        # 415240 <current>
  80138c:	48 8b 98 c0 00 00 00 	mov    rbx,QWORD PTR [rax+0xc0]
  801393:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801397:	48 25 00 f0 ff ff    	and    rax,0xfffffffffffff000
  80139d:	49 89 c4             	mov    r12,rax
  8013a0:	b8 00 00 00 00       	mov    eax,0x0
  8013a5:	e8 66 02 00 00       	call   801610 <req_a_page>
  8013aa:	89 c7                	mov    edi,eax
  8013ac:	e8 4e 04 00 00       	call   8017ff <get_phyaddr>
  8013b1:	48 98                	cdqe   
  8013b3:	48 89 d9             	mov    rcx,rbx
  8013b6:	ba 07 00 00 00       	mov    edx,0x7
  8013bb:	4c 89 e6             	mov    rsi,r12
  8013be:	48 89 c7             	mov    rdi,rax
  8013c1:	e8 2c fc ff ff       	call   800ff2 <smmap>
    }
    else
    {
        //page level protection
    }
    p=err_code&2;
  8013c6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8013ca:	83 e0 02             	and    eax,0x2
  8013cd:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)printf("when writing\n");else //puts("when reading");
  8013d0:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8013d4:	74 11                	je     8013e7 <page_err+0xb0>
  8013d6:	bf 22 55 81 00       	mov    edi,0x815522
  8013db:	b8 00 00 00 00       	mov    eax,0x0
  8013e0:	e8 87 f9 ff ff       	call   800d6c <printf>
  8013e5:	eb 0a                	jmp    8013f1 <page_err+0xba>
    p=err_code&4;
  8013e7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8013eb:	83 e0 04             	and    eax,0x4
  8013ee:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(!p)printf("supervisor mode\n");else //puts("user mode");
  8013f1:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8013f5:	75 11                	jne    801408 <page_err+0xd1>
  8013f7:	bf 30 55 81 00       	mov    edi,0x815530
  8013fc:	b8 00 00 00 00       	mov    eax,0x0
  801401:	e8 66 f9 ff ff       	call   800d6c <printf>
  801406:	eb 0a                	jmp    801412 <page_err+0xdb>
    p=err_code&16;
  801408:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80140c:	83 e0 10             	and    eax,0x10
  80140f:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)printf("an instruction tries to fetch\n");
  801412:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801416:	74 0f                	je     801427 <page_err+0xf0>
  801418:	bf 48 55 81 00       	mov    edi,0x815548
  80141d:	b8 00 00 00 00       	mov    eax,0x0
  801422:	e8 45 f9 ff ff       	call   800d6c <printf>
    unsigned int addr=0;
  801427:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
    asm volatile("mov 8(%%rbp),%0":"=r"(addr));
  80142e:	8b 45 08             	mov    eax,DWORD PTR [rbp+0x8]
  801431:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    printf("occurred at %x(paddr), %x(laddr)\n",addr,l_addr);
  801434:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  801438:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80143b:	89 c6                	mov    esi,eax
  80143d:	bf 68 55 81 00       	mov    edi,0x815568
  801442:	b8 00 00 00 00       	mov    eax,0x0
  801447:	e8 20 f9 ff ff       	call   800d6c <printf>
    extern int cur_proc;
    extern struct process *task;
    if(task[cur_proc].pid==1)//系统进程
  80144c:	48 8b 15 ed 70 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc070ed]        # 408540 <task>
  801453:	8b 05 73 3e c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc13e73]        # 4152cc <cur_proc>
  801459:	48 98                	cdqe   
  80145b:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  801462:	48 01 d0             	add    rax,rdx
  801465:	8b 00                	mov    eax,DWORD PTR [rax]
  801467:	83 f8 01             	cmp    eax,0x1
  80146a:	75 11                	jne    80147d <page_err+0x146>
    {
        printf("sys died. please reboot.\n");
  80146c:	bf 8a 55 81 00       	mov    edi,0x81558a
  801471:	b8 00 00 00 00       	mov    eax,0x0
  801476:	e8 f1 f8 ff ff       	call   800d6c <printf>
        asm volatile("jmp .");
  80147b:	eb fe                	jmp    80147b <page_err+0x144>
    }
    //杀死问题进程
//    del_proc(cur_proc);
    // printf("killed the problem process.\n");
    // printf("shell:>");
    eoi();
  80147d:	b8 00 00 00 00       	mov    eax,0x0
  801482:	e8 b7 53 00 00       	call   80683e <eoi>
    //这里对esp的加法是必要的，因为page fault多push了一个错误码，但是iret识别不了
    __asm__ volatile ("sti \r\n  leave\n add $8,%rsp \n iretq");
  801487:	fb                   	sti    
  801488:	c9                   	leave  
  801489:	48 83 c4 08          	add    rsp,0x8
  80148d:	48 cf                	iretq  
}
  80148f:	90                   	nop
  801490:	48 83 c4 20          	add    rsp,0x20
  801494:	5b                   	pop    rbx
  801495:	41 5c                	pop    r12
  801497:	5d                   	pop    rbp
  801498:	c3                   	ret    

0000000000801499 <init_memory>:
void init_memory()
{
  801499:	f3 0f 1e fa          	endbr64 
  80149d:	55                   	push   rbp
  80149e:	48 89 e5             	mov    rbp,rsp
    extern addr_t _knl_end,_knl_start;//lds中声明的内核的结尾地址，放置位图
    //获取内存大小
    size_t mem_size=mmap_struct[mmap_t_i-1].base+mmap_struct[mmap_t_i-1].len;
  8014a1:	8b 05 79 ed bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfed79]        # 400220 <mmap_t_i>
  8014a7:	83 e8 01             	sub    eax,0x1
  8014aa:	48 63 d0             	movsxd rdx,eax
  8014ad:	48 89 d0             	mov    rax,rdx
  8014b0:	48 01 c0             	add    rax,rax
  8014b3:	48 01 d0             	add    rax,rdx
  8014b6:	48 c1 e0 03          	shl    rax,0x3
  8014ba:	48 05 40 00 40 00    	add    rax,0x400040
  8014c0:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8014c3:	8b 05 57 ed bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfed57]        # 400220 <mmap_t_i>
  8014c9:	83 e8 01             	sub    eax,0x1
  8014cc:	48 63 d0             	movsxd rdx,eax
  8014cf:	48 89 d0             	mov    rax,rdx
  8014d2:	48 01 c0             	add    rax,rax
  8014d5:	48 01 d0             	add    rax,rdx
  8014d8:	48 c1 e0 03          	shl    rax,0x3
  8014dc:	48 05 48 00 40 00    	add    rax,0x400048
  8014e2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8014e5:	48 01 c8             	add    rax,rcx
  8014e8:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    //计算出所需内存页数量
    int pgc=mem_size/PAGE_SIZE;
  8014ec:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8014f0:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  8014f7:	48 85 c0             	test   rax,rax
  8014fa:	48 0f 48 c2          	cmovs  rax,rdx
  8014fe:	48 c1 f8 0c          	sar    rax,0xc
  801502:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    //计算出位图所需的字节数
    int pg_bytes=pgc/32;
  801505:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  801508:	8d 50 1f             	lea    edx,[rax+0x1f]
  80150b:	85 c0                	test   eax,eax
  80150d:	0f 48 c2             	cmovs  eax,edx
  801510:	c1 f8 05             	sar    eax,0x5
  801513:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    page_map=(unsigned int*)PAGE_4K_ALIGN(0xc00000);
  801516:	48 c7 05 ff ea bf ff 	mov    QWORD PTR [rip+0xffffffffffbfeaff],0xc00000        # 400020 <page_map>
  80151d:	00 00 c0 00 
    int* p=page_map;
  801521:	48 8b 05 f8 ea bf ff 	mov    rax,QWORD PTR [rip+0xffffffffffbfeaf8]        # 400020 <page_map>
  801528:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    addr_t curp=0;
  80152c:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  801533:	00 
    for(int i=0;i<mmap_t_i;i++){
  801534:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80153b:	e9 91 00 00 00       	jmp    8015d1 <init_memory+0x138>
        int cont=0;
  801540:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
        if(mmap_struct[i].type!=MULTIBOOT_MEMORY_AVAILABLE)
  801547:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80154a:	48 63 d0             	movsxd rdx,eax
  80154d:	48 89 d0             	mov    rax,rdx
  801550:	48 01 c0             	add    rax,rax
  801553:	48 01 d0             	add    rax,rdx
  801556:	48 c1 e0 03          	shl    rax,0x3
  80155a:	48 05 50 00 40 00    	add    rax,0x400050
  801560:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801563:	48 83 f8 01          	cmp    rax,0x1
  801567:	74 07                	je     801570 <init_memory+0xd7>
            cont=-1;
  801569:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [rbp-0x10],0xffffffff
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  801570:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801577:	eb 15                	jmp    80158e <init_memory+0xf5>
            *(p++)=cont;
  801579:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80157d:	48 8d 50 04          	lea    rdx,[rax+0x4]
  801581:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  801585:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  801588:	89 10                	mov    DWORD PTR [rax],edx
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  80158a:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  80158e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801591:	48 63 c8             	movsxd rcx,eax
  801594:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801597:	48 63 d0             	movsxd rdx,eax
  80159a:	48 89 d0             	mov    rax,rdx
  80159d:	48 01 c0             	add    rax,rax
  8015a0:	48 01 d0             	add    rax,rdx
  8015a3:	48 c1 e0 03          	shl    rax,0x3
  8015a7:	48 05 48 00 40 00    	add    rax,0x400048
  8015ad:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8015b0:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  8015b7:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  8015be:	ff 00 00 
  8015c1:	48 21 d0             	and    rax,rdx
  8015c4:	48 c1 e8 11          	shr    rax,0x11
  8015c8:	48 39 c1             	cmp    rcx,rax
  8015cb:	72 ac                	jb     801579 <init_memory+0xe0>
    for(int i=0;i<mmap_t_i;i++){
  8015cd:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8015d1:	8b 05 49 ec bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfec49]        # 400220 <mmap_t_i>
  8015d7:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  8015da:	0f 8c 60 ff ff ff    	jl     801540 <init_memory+0xa7>
        }
    }

    //低16M空间直接被内核占用
    for(int i=0;i<128;i++){
  8015e0:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  8015e7:	eb 1d                	jmp    801606 <init_memory+0x16d>
        page_map[i]=0xffffffff;
  8015e9:	48 8b 15 30 ea bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfea30]        # 400020 <page_map>
  8015f0:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8015f3:	48 98                	cdqe   
  8015f5:	48 c1 e0 02          	shl    rax,0x2
  8015f9:	48 01 d0             	add    rax,rdx
  8015fc:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<128;i++){
  801602:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  801606:	83 7d e8 7f          	cmp    DWORD PTR [rbp-0x18],0x7f
  80160a:	7e dd                	jle    8015e9 <init_memory+0x150>
    }
}
  80160c:	90                   	nop
  80160d:	90                   	nop
  80160e:	5d                   	pop    rbp
  80160f:	c3                   	ret    

0000000000801610 <req_a_page>:
/*
page_map存储方式:
0x00000000
little end
*/
addr_t req_a_page(){
  801610:	f3 0f 1e fa          	endbr64 
  801614:	55                   	push   rbp
  801615:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  801618:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80161f:	e9 b0 00 00 00       	jmp    8016d4 <req_a_page+0xc4>
        for(int j=0;j<32;j++){
  801624:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80162b:	e9 96 00 00 00       	jmp    8016c6 <req_a_page+0xb6>
            unsigned int bit=page_map[i]&(1<<j);
  801630:	48 8b 15 e9 e9 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe9e9]        # 400020 <page_map>
  801637:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80163a:	48 98                	cdqe   
  80163c:	48 c1 e0 02          	shl    rax,0x2
  801640:	48 01 d0             	add    rax,rdx
  801643:	8b 10                	mov    edx,DWORD PTR [rax]
  801645:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801648:	be 01 00 00 00       	mov    esi,0x1
  80164d:	89 c1                	mov    ecx,eax
  80164f:	d3 e6                	shl    esi,cl
  801651:	89 f0                	mov    eax,esi
  801653:	21 d0                	and    eax,edx
  801655:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            if((i*32+j)*4096>=0x100000&&!bit)
  801658:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80165b:	c1 e0 05             	shl    eax,0x5
  80165e:	89 c2                	mov    edx,eax
  801660:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801663:	01 d0                	add    eax,edx
  801665:	c1 e0 0c             	shl    eax,0xc
  801668:	3d ff ff 0f 00       	cmp    eax,0xfffff
  80166d:	7e 53                	jle    8016c2 <req_a_page+0xb2>
  80166f:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  801673:	75 4d                	jne    8016c2 <req_a_page+0xb2>
            {
                page_map[i]=page_map[i]|(1<<j);
  801675:	48 8b 15 a4 e9 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe9a4]        # 400020 <page_map>
  80167c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80167f:	48 98                	cdqe   
  801681:	48 c1 e0 02          	shl    rax,0x2
  801685:	48 01 d0             	add    rax,rdx
  801688:	8b 10                	mov    edx,DWORD PTR [rax]
  80168a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80168d:	be 01 00 00 00       	mov    esi,0x1
  801692:	89 c1                	mov    ecx,eax
  801694:	d3 e6                	shl    esi,cl
  801696:	89 f0                	mov    eax,esi
  801698:	89 c6                	mov    esi,eax
  80169a:	48 8b 0d 7f e9 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe97f]        # 400020 <page_map>
  8016a1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8016a4:	48 98                	cdqe   
  8016a6:	48 c1 e0 02          	shl    rax,0x2
  8016aa:	48 01 c8             	add    rax,rcx
  8016ad:	09 f2                	or     edx,esi
  8016af:	89 10                	mov    DWORD PTR [rax],edx
                return i*32+j;//num of page
  8016b1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8016b4:	c1 e0 05             	shl    eax,0x5
  8016b7:	89 c2                	mov    edx,eax
  8016b9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8016bc:	01 d0                	add    eax,edx
  8016be:	48 98                	cdqe   
  8016c0:	eb 1c                	jmp    8016de <req_a_page+0xce>
        for(int j=0;j<32;j++){
  8016c2:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8016c6:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  8016ca:	0f 8e 60 ff ff ff    	jle    801630 <req_a_page+0x20>
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  8016d0:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8016d4:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8016d8:	0f 8e 46 ff ff ff    	jle    801624 <req_a_page+0x14>

            }
        }
    }
}
  8016de:	5d                   	pop    rbp
  8016df:	c3                   	ret    

00000000008016e0 <free_page>:

int free_page(char *paddr){
  8016e0:	f3 0f 1e fa          	endbr64 
  8016e4:	55                   	push   rbp
  8016e5:	48 89 e5             	mov    rbp,rsp
  8016e8:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=(int)paddr/4096;
  8016ec:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016f0:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8016f6:	85 c0                	test   eax,eax
  8016f8:	0f 48 c2             	cmovs  eax,edx
  8016fb:	c1 f8 0c             	sar    eax,0xc
  8016fe:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  801701:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801704:	8d 50 1f             	lea    edx,[rax+0x1f]
  801707:	85 c0                	test   eax,eax
  801709:	0f 48 c2             	cmovs  eax,edx
  80170c:	c1 f8 05             	sar    eax,0x5
  80170f:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  801712:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801715:	99                   	cdq    
  801716:	c1 ea 1b             	shr    edx,0x1b
  801719:	01 d0                	add    eax,edx
  80171b:	83 e0 1f             	and    eax,0x1f
  80171e:	29 d0                	sub    eax,edx
  801720:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    page_map[n]=page_map[n]&~(unsigned int)(1<<r);
  801723:	48 8b 15 f6 e8 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe8f6]        # 400020 <page_map>
  80172a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80172d:	48 98                	cdqe   
  80172f:	48 c1 e0 02          	shl    rax,0x2
  801733:	48 01 d0             	add    rax,rdx
  801736:	8b 10                	mov    edx,DWORD PTR [rax]
  801738:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80173b:	be 01 00 00 00       	mov    esi,0x1
  801740:	89 c1                	mov    ecx,eax
  801742:	d3 e6                	shl    esi,cl
  801744:	89 f0                	mov    eax,esi
  801746:	f7 d0                	not    eax
  801748:	89 c6                	mov    esi,eax
  80174a:	48 8b 0d cf e8 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe8cf]        # 400020 <page_map>
  801751:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801754:	48 98                	cdqe   
  801756:	48 c1 e0 02          	shl    rax,0x2
  80175a:	48 01 c8             	add    rax,rcx
  80175d:	21 f2                	and    edx,esi
  80175f:	89 10                	mov    DWORD PTR [rax],edx
}
  801761:	90                   	nop
  801762:	5d                   	pop    rbp
  801763:	c3                   	ret    

0000000000801764 <free_pages_at>:

int free_pages_at(int base,int pgn){
  801764:	f3 0f 1e fa          	endbr64 
  801768:	55                   	push   rbp
  801769:	48 89 e5             	mov    rbp,rsp
  80176c:	48 83 ec 18          	sub    rsp,0x18
  801770:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801773:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<pgn;i++){
  801776:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80177d:	eb 1b                	jmp    80179a <free_pages_at+0x36>
        free_page(base+i*PAGE_4K_SIZE);
  80177f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801782:	c1 e0 0c             	shl    eax,0xc
  801785:	89 c2                	mov    edx,eax
  801787:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80178a:	01 d0                	add    eax,edx
  80178c:	48 98                	cdqe   
  80178e:	48 89 c7             	mov    rdi,rax
  801791:	e8 4a ff ff ff       	call   8016e0 <free_page>
    for(int i=0;i<pgn;i++){
  801796:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80179a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80179d:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  8017a0:	7c dd                	jl     80177f <free_pages_at+0x1b>
    }
}
  8017a2:	90                   	nop
  8017a3:	c9                   	leave  
  8017a4:	c3                   	ret    

00000000008017a5 <check_page>:
int check_page(int num){
  8017a5:	f3 0f 1e fa          	endbr64 
  8017a9:	55                   	push   rbp
  8017aa:	48 89 e5             	mov    rbp,rsp
  8017ad:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int n=num/32;
  8017b0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8017b3:	8d 50 1f             	lea    edx,[rax+0x1f]
  8017b6:	85 c0                	test   eax,eax
  8017b8:	0f 48 c2             	cmovs  eax,edx
  8017bb:	c1 f8 05             	sar    eax,0x5
  8017be:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int r=num%32;
  8017c1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8017c4:	99                   	cdq    
  8017c5:	c1 ea 1b             	shr    edx,0x1b
  8017c8:	01 d0                	add    eax,edx
  8017ca:	83 e0 1f             	and    eax,0x1f
  8017cd:	29 d0                	sub    eax,edx
  8017cf:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int bit=page_map[n]&(1<<r);
  8017d2:	48 8b 15 47 e8 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe847]        # 400020 <page_map>
  8017d9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8017dc:	48 98                	cdqe   
  8017de:	48 c1 e0 02          	shl    rax,0x2
  8017e2:	48 01 d0             	add    rax,rdx
  8017e5:	8b 10                	mov    edx,DWORD PTR [rax]
  8017e7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8017ea:	be 01 00 00 00       	mov    esi,0x1
  8017ef:	89 c1                	mov    ecx,eax
  8017f1:	d3 e6                	shl    esi,cl
  8017f3:	89 f0                	mov    eax,esi
  8017f5:	21 d0                	and    eax,edx
  8017f7:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    return bit;
  8017fa:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  8017fd:	5d                   	pop    rbp
  8017fe:	c3                   	ret    

00000000008017ff <get_phyaddr>:
/*
 * 获得这个页对应的物理内存地址
 * */
int get_phyaddr(int num){
  8017ff:	f3 0f 1e fa          	endbr64 
  801803:	55                   	push   rbp
  801804:	48 89 e5             	mov    rbp,rsp
  801807:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return num*0x1000;
  80180a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80180d:	c1 e0 0c             	shl    eax,0xc
}
  801810:	5d                   	pop    rbp
  801811:	c3                   	ret    

0000000000801812 <set_page_item>:

void set_page_item(page_item *item_addr,int phy_addr,int attr)
{
  801812:	f3 0f 1e fa          	endbr64 
  801816:	55                   	push   rbp
  801817:	48 89 e5             	mov    rbp,rsp
  80181a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80181e:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  801821:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    *item_addr=0;
  801824:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801828:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *item_addr|=phy_addr&0xfffff000;
  80182f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801833:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801836:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801839:	89 c0                	mov    eax,eax
  80183b:	25 00 f0 ff ff       	and    eax,0xfffff000
  801840:	48 09 c2             	or     rdx,rax
  801843:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801847:	48 89 10             	mov    QWORD PTR [rax],rdx
    *item_addr|=attr;
  80184a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80184e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801851:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  801854:	48 98                	cdqe   
  801856:	48 09 c2             	or     rdx,rax
  801859:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80185d:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  801860:	90                   	nop
  801861:	5d                   	pop    rbp
  801862:	c3                   	ret    

0000000000801863 <set_1gb_pdpt>:
void set_1gb_pdpt(page_item* ppdpt,int pa,unsigned int extra_attr)
{
  801863:	f3 0f 1e fa          	endbr64 
  801867:	55                   	push   rbp
  801868:	48 89 e5             	mov    rbp,rsp
  80186b:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80186f:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  801872:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *ppdpt=0;
  801875:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801879:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *ppdpt|=PAGE_PRESENT|PDPTE_1GB|extra_attr;
  801880:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801884:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801887:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80188a:	0c 81                	or     al,0x81
  80188c:	89 c0                	mov    eax,eax
  80188e:	48 09 c2             	or     rdx,rax
  801891:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801895:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffffc0000000ul;
  801898:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80189b:	25 00 00 00 c0       	and    eax,0xc0000000
  8018a0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *ppdpt|=hipa;
  8018a3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018a7:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8018aa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8018ad:	48 09 c2             	or     rdx,rax
  8018b0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018b4:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  8018b7:	90                   	nop
  8018b8:	5d                   	pop    rbp
  8018b9:	c3                   	ret    

00000000008018ba <set_2mb_pde>:
void set_2mb_pde(page_item *pde, int pa, int extra_attr)
{
  8018ba:	f3 0f 1e fa          	endbr64 
  8018be:	55                   	push   rbp
  8018bf:	48 89 e5             	mov    rbp,rsp
  8018c2:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8018c6:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  8018c9:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *pde=0;
  8018cc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018d0:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *pde|=PAGE_PRESENT|PAGE_4MB_PAGE|PDE_4MB_PAT|extra_attr;
  8018d7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018db:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8018de:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8018e1:	0d 81 10 00 00       	or     eax,0x1081
  8018e6:	48 98                	cdqe   
  8018e8:	48 09 c2             	or     rdx,rax
  8018eb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8018ef:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffc00000;
  8018f2:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8018f5:	25 00 00 c0 ff       	and    eax,0xffc00000
  8018fa:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *pde|=hipa;
  8018fd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801901:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801904:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801907:	48 09 c2             	or     rdx,rax
  80190a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80190e:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  801911:	90                   	nop
  801912:	5d                   	pop    rbp
  801913:	c3                   	ret    

0000000000801914 <req_page_at>:
        page_map[i]&=(u32)(1<<j);
    return ret;
} */
//在bitmap申请指定的页面,base默认0x1000对齐
addr_t req_page_at(addr_t base,int pgn)
{
  801914:	f3 0f 1e fa          	endbr64 
  801918:	55                   	push   rbp
  801919:	48 89 e5             	mov    rbp,rsp
  80191c:	48 83 ec 20          	sub    rsp,0x20
  801920:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  801924:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    if(base==0)//不指定地址
  801927:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  80192c:	75 18                	jne    801946 <req_page_at+0x32>
    {
        return get_phyaddr(req_a_page());
  80192e:	b8 00 00 00 00       	mov    eax,0x0
  801933:	e8 d8 fc ff ff       	call   801610 <req_a_page>
  801938:	89 c7                	mov    edi,eax
  80193a:	e8 c0 fe ff ff       	call   8017ff <get_phyaddr>
  80193f:	48 98                	cdqe   
  801941:	e9 a5 00 00 00       	jmp    8019eb <req_page_at+0xd7>
    }
    if(!is_pgs_ava(base,pgn))return -1;//先检查
  801946:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80194a:	89 c2                	mov    edx,eax
  80194c:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80194f:	89 c6                	mov    esi,eax
  801951:	89 d7                	mov    edi,edx
  801953:	e8 52 01 00 00       	call   801aaa <is_pgs_ava>
  801958:	85 c0                	test   eax,eax
  80195a:	75 0c                	jne    801968 <req_page_at+0x54>
  80195c:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  801963:	e9 83 00 00 00       	jmp    8019eb <req_page_at+0xd7>
    int pgni=base/4096;
  801968:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80196c:	48 c1 e8 0c          	shr    rax,0xc
  801970:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int pgi=pgni/32;
  801973:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801976:	8d 50 1f             	lea    edx,[rax+0x1f]
  801979:	85 c0                	test   eax,eax
  80197b:	0f 48 c2             	cmovs  eax,edx
  80197e:	c1 f8 05             	sar    eax,0x5
  801981:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    int pgj=pgni%32;
  801984:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801987:	99                   	cdq    
  801988:	c1 ea 1b             	shr    edx,0x1b
  80198b:	01 d0                	add    eax,edx
  80198d:	83 e0 1f             	and    eax,0x1f
  801990:	29 d0                	sub    eax,edx
  801992:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<pgn;i++)
  801995:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80199c:	eb 40                	jmp    8019de <req_page_at+0xca>
    {
        page_map[i]|=(1<<pgj);
  80199e:	48 8b 15 7b e6 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe67b]        # 400020 <page_map>
  8019a5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019a8:	48 98                	cdqe   
  8019aa:	48 c1 e0 02          	shl    rax,0x2
  8019ae:	48 01 d0             	add    rax,rdx
  8019b1:	8b 10                	mov    edx,DWORD PTR [rax]
  8019b3:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8019b6:	be 01 00 00 00       	mov    esi,0x1
  8019bb:	89 c1                	mov    ecx,eax
  8019bd:	d3 e6                	shl    esi,cl
  8019bf:	89 f0                	mov    eax,esi
  8019c1:	89 c6                	mov    esi,eax
  8019c3:	48 8b 0d 56 e6 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe656]        # 400020 <page_map>
  8019ca:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019cd:	48 98                	cdqe   
  8019cf:	48 c1 e0 02          	shl    rax,0x2
  8019d3:	48 01 c8             	add    rax,rcx
  8019d6:	09 f2                	or     edx,esi
  8019d8:	89 10                	mov    DWORD PTR [rax],edx
    for(int i=0;i<pgn;i++)
  8019da:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8019de:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019e1:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  8019e4:	7c b8                	jl     80199e <req_page_at+0x8a>
    }
    return 0;
  8019e6:	b8 00 00 00 00       	mov    eax,0x0

}
  8019eb:	c9                   	leave  
  8019ec:	c3                   	ret    

00000000008019ed <chk_vm>:
int chk_vm(int base, int pgn)
{
  8019ed:	f3 0f 1e fa          	endbr64 
  8019f1:	55                   	push   rbp
  8019f2:	48 89 e5             	mov    rbp,rsp
  8019f5:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8019f8:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int *pdet=0;
  8019fb:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  801a02:	00 
    asm volatile("mov %%cr3,%0":"=r"(pdet));
  801a03:	0f 20 d8             	mov    rax,cr3
  801a06:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int *pt=pdet[base/PAGE_INDEX_SIZE]&0xfffff000;
  801a0a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a0d:	8d 90 ff ff 1f 00    	lea    edx,[rax+0x1fffff]
  801a13:	85 c0                	test   eax,eax
  801a15:	0f 48 c2             	cmovs  eax,edx
  801a18:	c1 f8 15             	sar    eax,0x15
  801a1b:	48 98                	cdqe   
  801a1d:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801a24:	00 
  801a25:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801a29:	48 01 d0             	add    rax,rdx
  801a2c:	8b 00                	mov    eax,DWORD PTR [rax]
  801a2e:	89 c0                	mov    eax,eax
  801a30:	25 00 f0 ff ff       	and    eax,0xfffff000
  801a35:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  801a39:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a3c:	8d 90 ff ff 1f 00    	lea    edx,[rax+0x1fffff]
  801a42:	85 c0                	test   eax,eax
  801a44:	0f 48 c2             	cmovs  eax,edx
  801a47:	c1 f8 15             	sar    eax,0x15
  801a4a:	48 98                	cdqe   
  801a4c:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801a53:	00 
  801a54:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801a58:	48 01 d0             	add    rax,rdx
  801a5b:	8b 00                	mov    eax,DWORD PTR [rax]
  801a5d:	83 e0 01             	and    eax,0x1
  801a60:	85 c0                	test   eax,eax
  801a62:	74 38                	je     801a9c <chk_vm+0xaf>
    !(pt[base%PAGE_INDEX_SIZE/PAGE_SIZE]&PAGE_PRESENT))
  801a64:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a67:	99                   	cdq    
  801a68:	c1 ea 0b             	shr    edx,0xb
  801a6b:	01 d0                	add    eax,edx
  801a6d:	25 ff ff 1f 00       	and    eax,0x1fffff
  801a72:	29 d0                	sub    eax,edx
  801a74:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801a7a:	85 c0                	test   eax,eax
  801a7c:	0f 48 c2             	cmovs  eax,edx
  801a7f:	c1 f8 0c             	sar    eax,0xc
  801a82:	48 98                	cdqe   
  801a84:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801a8b:	00 
  801a8c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801a90:	48 01 d0             	add    rax,rdx
  801a93:	8b 00                	mov    eax,DWORD PTR [rax]
  801a95:	83 e0 01             	and    eax,0x1
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  801a98:	85 c0                	test   eax,eax
  801a9a:	75 07                	jne    801aa3 <chk_vm+0xb6>
    {
        return -1;
  801a9c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801aa1:	eb 05                	jmp    801aa8 <chk_vm+0xbb>
    }
    return 0;
  801aa3:	b8 00 00 00 00       	mov    eax,0x0
}
  801aa8:	5d                   	pop    rbp
  801aa9:	c3                   	ret    

0000000000801aaa <is_pgs_ava>:
//查看指定区域的页内存是否可用
int is_pgs_ava(int base,int pgn)
{
  801aaa:	f3 0f 1e fa          	endbr64 
  801aae:	55                   	push   rbp
  801aaf:	48 89 e5             	mov    rbp,rsp
  801ab2:	48 83 ec 18          	sub    rsp,0x18
  801ab6:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801ab9:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int pgi=base/4096;
  801abc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801abf:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801ac5:	85 c0                	test   eax,eax
  801ac7:	0f 48 c2             	cmovs  eax,edx
  801aca:	c1 f8 0c             	sar    eax,0xc
  801acd:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    for(int i=0;i<pgn;i++)
  801ad0:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801ad7:	eb 1e                	jmp    801af7 <is_pgs_ava+0x4d>
    {
        if(check_page(pgi+i)!=0)return 0;
  801ad9:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801adc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801adf:	01 d0                	add    eax,edx
  801ae1:	89 c7                	mov    edi,eax
  801ae3:	e8 bd fc ff ff       	call   8017a5 <check_page>
  801ae8:	85 c0                	test   eax,eax
  801aea:	74 07                	je     801af3 <is_pgs_ava+0x49>
  801aec:	b8 00 00 00 00       	mov    eax,0x0
  801af1:	eb 11                	jmp    801b04 <is_pgs_ava+0x5a>
    for(int i=0;i<pgn;i++)
  801af3:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801af7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801afa:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  801afd:	7c da                	jl     801ad9 <is_pgs_ava+0x2f>
    }
    return 1;
  801aff:	b8 01 00 00 00       	mov    eax,0x1

}
  801b04:	c9                   	leave  
  801b05:	c3                   	ret    

0000000000801b06 <setup_sys_vol>:
super_block sbs[MAX_SUPERBLOCKS];
fs_operations fs[MAX_FS];

buffer_head buffer_heads[NR_BUFFERHEADS];
int setup_sys_vol(void *disk_drv, void *fs_drv)
{
  801b06:	f3 0f 1e fa          	endbr64 
  801b0a:	55                   	push   rbp
  801b0b:	48 89 e5             	mov    rbp,rsp
  801b0e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  801b12:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    vols[0].name[0]='C';
  801b16:	c6 05 23 e7 bf ff 43 	mov    BYTE PTR [rip+0xffffffffffbfe723],0x43        # 400240 <vols>
    vols[0].name[1]='\0';
  801b1d:	c6 05 1d e7 bf ff 00 	mov    BYTE PTR [rip+0xffffffffffbfe71d],0x0        # 400241 <vols+0x1>
    vols[0].disk_drv=disk_drv;
  801b24:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801b28:	48 89 05 19 e7 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe719],rax        # 400248 <vols+0x8>
    vols[0].fs_drv=fs_drv;
  801b2f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801b33:	48 89 05 16 e7 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe716],rax        # 400250 <vols+0x10>
    vols[0].stat=VOLUME_STAT_READY;
  801b3a:	c7 05 1c e7 bf ff 01 	mov    DWORD PTR [rip+0xffffffffffbfe71c],0x1        # 400260 <vols+0x20>
  801b41:	00 00 00 
    return 0;
  801b44:	b8 00 00 00 00       	mov    eax,0x0
}
  801b49:	5d                   	pop    rbp
  801b4a:	c3                   	ret    

0000000000801b4b <sys_mkfifo>:
//返回管道描述符
int sys_mkfifo(int number)
{
  801b4b:	f3 0f 1e fa          	endbr64 
  801b4f:	55                   	push   rbp
  801b50:	48 89 e5             	mov    rbp,rsp
  801b53:	48 83 ec 20          	sub    rsp,0x20
  801b57:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    //查重
    for(int i=0;i<MAX_FIFOS;i++)
  801b5a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801b61:	eb 38                	jmp    801b9b <sys_mkfifo+0x50>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801b63:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b66:	48 98                	cdqe   
  801b68:	48 c1 e0 04          	shl    rax,0x4
  801b6c:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801b72:	8b 00                	mov    eax,DWORD PTR [rax]
  801b74:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801b77:	75 1e                	jne    801b97 <sys_mkfifo+0x4c>
  801b79:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b7c:	48 98                	cdqe   
  801b7e:	48 c1 e0 04          	shl    rax,0x4
  801b82:	48 05 68 1e 40 00    	add    rax,0x401e68
  801b88:	8b 00                	mov    eax,DWORD PTR [rax]
  801b8a:	83 f8 01             	cmp    eax,0x1
  801b8d:	75 08                	jne    801b97 <sys_mkfifo+0x4c>
            return i;
  801b8f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b92:	e9 a6 00 00 00       	jmp    801c3d <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801b97:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801b9b:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801b9f:	7e c2                	jle    801b63 <sys_mkfifo+0x18>
        }
    }
    for(int i=0;i<MAX_FIFOS;i++)
  801ba1:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801ba8:	e9 81 00 00 00       	jmp    801c2e <sys_mkfifo+0xe3>
    {
        if(fifos[i].flag==0) {
  801bad:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801bb0:	48 98                	cdqe   
  801bb2:	48 c1 e0 04          	shl    rax,0x4
  801bb6:	48 05 68 1e 40 00    	add    rax,0x401e68
  801bbc:	8b 00                	mov    eax,DWORD PTR [rax]
  801bbe:	85 c0                	test   eax,eax
  801bc0:	75 68                	jne    801c2a <sys_mkfifo+0xdf>
            fifos[i].flag=1;
  801bc2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801bc5:	48 98                	cdqe   
  801bc7:	48 c1 e0 04          	shl    rax,0x4
  801bcb:	48 05 68 1e 40 00    	add    rax,0x401e68
  801bd1:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            fifos[i].id=number;
  801bd7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801bda:	48 98                	cdqe   
  801bdc:	48 c1 e0 04          	shl    rax,0x4
  801be0:	48 8d 90 6c 1e 40 00 	lea    rdx,[rax+0x401e6c]
  801be7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801bea:	89 02                	mov    DWORD PTR [rdx],eax
            fifos[i].size=CHUNK_SIZE;
  801bec:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801bef:	48 98                	cdqe   
  801bf1:	48 c1 e0 04          	shl    rax,0x4
  801bf5:	48 05 64 1e 40 00    	add    rax,0x401e64
  801bfb:	c7 00 00 10 00 00    	mov    DWORD PTR [rax],0x1000
            //分配内存
            fifos[i].pa= get_phyaddr(req_a_page());
  801c01:	b8 00 00 00 00       	mov    eax,0x0
  801c06:	e8 05 fa ff ff       	call   801610 <req_a_page>
  801c0b:	89 c7                	mov    edi,eax
  801c0d:	e8 ed fb ff ff       	call   8017ff <get_phyaddr>
  801c12:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801c15:	48 63 d2             	movsxd rdx,edx
  801c18:	48 c1 e2 04          	shl    rdx,0x4
  801c1c:	48 81 c2 60 1e 40 00 	add    rdx,0x401e60
  801c23:	89 02                	mov    DWORD PTR [rdx],eax
            return i;
  801c25:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801c28:	eb 13                	jmp    801c3d <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801c2a:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801c2e:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  801c32:	0f 8e 75 ff ff ff    	jle    801bad <sys_mkfifo+0x62>
        }
    }
    return -1;
  801c38:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801c3d:	c9                   	leave  
  801c3e:	c3                   	ret    

0000000000801c3f <sys_rmfifo>:

int sys_rmfifo(int number)
{
  801c3f:	f3 0f 1e fa          	endbr64 
  801c43:	55                   	push   rbp
  801c44:	48 89 e5             	mov    rbp,rsp
  801c47:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_FIFOS;i++)
  801c4a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801c51:	eb 4a                	jmp    801c9d <sys_rmfifo+0x5e>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801c53:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801c56:	48 98                	cdqe   
  801c58:	48 c1 e0 04          	shl    rax,0x4
  801c5c:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801c62:	8b 00                	mov    eax,DWORD PTR [rax]
  801c64:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801c67:	75 30                	jne    801c99 <sys_rmfifo+0x5a>
  801c69:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801c6c:	48 98                	cdqe   
  801c6e:	48 c1 e0 04          	shl    rax,0x4
  801c72:	48 05 68 1e 40 00    	add    rax,0x401e68
  801c78:	8b 00                	mov    eax,DWORD PTR [rax]
  801c7a:	83 f8 01             	cmp    eax,0x1
  801c7d:	75 1a                	jne    801c99 <sys_rmfifo+0x5a>
            fifos[i].flag=0;
  801c7f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801c82:	48 98                	cdqe   
  801c84:	48 c1 e0 04          	shl    rax,0x4
  801c88:	48 05 68 1e 40 00    	add    rax,0x401e68
  801c8e:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            return i;
  801c94:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801c97:	eb 0f                	jmp    801ca8 <sys_rmfifo+0x69>
    for(int i=0;i<MAX_FIFOS;i++)
  801c99:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801c9d:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801ca1:	7e b0                	jle    801c53 <sys_rmfifo+0x14>
        }
    }
    return -1;
  801ca3:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801ca8:	5d                   	pop    rbp
  801ca9:	c3                   	ret    

0000000000801caa <free_vol>:
int free_vol(int voli)
{
  801caa:	f3 0f 1e fa          	endbr64 
  801cae:	55                   	push   rbp
  801caf:	48 89 e5             	mov    rbp,rsp
  801cb2:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    vols[0].stat=VOLUME_STAT_EMPTY;
  801cb5:	c7 05 a1 e5 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbfe5a1],0x0        # 400260 <vols+0x20>
  801cbc:	00 00 00 
    return 0;
  801cbf:	b8 00 00 00 00       	mov    eax,0x0
}
  801cc4:	5d                   	pop    rbp
  801cc5:	c3                   	ret    

0000000000801cc6 <reg_vol>:

int reg_vol(int disk_drvi, int fs_drvi, char *name)
{
  801cc6:	f3 0f 1e fa          	endbr64 
  801cca:	55                   	push   rbp
  801ccb:	48 89 e5             	mov    rbp,rsp
  801cce:	48 83 ec 20          	sub    rsp,0x20
  801cd2:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801cd5:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  801cd8:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
    for(int i=0;i<MAX_VOLUMES;i++)
  801cdc:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801ce3:	e9 d8 00 00 00       	jmp    801dc0 <reg_vol+0xfa>
    {
        if(vols[i].stat==VOLUME_STAT_EMPTY)
  801ce8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ceb:	48 63 d0             	movsxd rdx,eax
  801cee:	48 89 d0             	mov    rax,rdx
  801cf1:	48 c1 e0 02          	shl    rax,0x2
  801cf5:	48 01 d0             	add    rax,rdx
  801cf8:	48 c1 e0 03          	shl    rax,0x3
  801cfc:	48 05 60 02 40 00    	add    rax,0x400260
  801d02:	8b 00                	mov    eax,DWORD PTR [rax]
  801d04:	85 c0                	test   eax,eax
  801d06:	0f 85 b0 00 00 00    	jne    801dbc <reg_vol+0xf6>
        {
            extern driver *drvs;
            vols[i].stat=VOLUME_STAT_READY;
  801d0c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801d0f:	48 63 d0             	movsxd rdx,eax
  801d12:	48 89 d0             	mov    rax,rdx
  801d15:	48 c1 e0 02          	shl    rax,0x2
  801d19:	48 01 d0             	add    rax,rdx
  801d1c:	48 c1 e0 03          	shl    rax,0x3
  801d20:	48 05 60 02 40 00    	add    rax,0x400260
  801d26:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            vols[i].fs= &fs[fs_drvi];
  801d2c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801d2f:	48 63 d0             	movsxd rdx,eax
  801d32:	48 89 d0             	mov    rax,rdx
  801d35:	48 01 c0             	add    rax,rax
  801d38:	48 01 d0             	add    rax,rdx
  801d3b:	48 c1 e0 03          	shl    rax,0x3
  801d3f:	48 8d 88 80 23 40 00 	lea    rcx,[rax+0x402380]
  801d46:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801d49:	48 63 d0             	movsxd rdx,eax
  801d4c:	48 89 d0             	mov    rax,rdx
  801d4f:	48 c1 e0 02          	shl    rax,0x2
  801d53:	48 01 d0             	add    rax,rdx
  801d56:	48 c1 e0 03          	shl    rax,0x3
  801d5a:	48 05 58 02 40 00    	add    rax,0x400258
  801d60:	48 89 08             	mov    QWORD PTR [rax],rcx
            vols[i].disk_drv= get_drv(disk_drvi);
  801d63:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801d66:	89 c7                	mov    edi,eax
  801d68:	e8 14 1e 00 00       	call   803b81 <get_drv>
  801d6d:	48 89 c2             	mov    rdx,rax
  801d70:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801d73:	48 63 c8             	movsxd rcx,eax
  801d76:	48 89 c8             	mov    rax,rcx
  801d79:	48 c1 e0 02          	shl    rax,0x2
  801d7d:	48 01 c8             	add    rax,rcx
  801d80:	48 c1 e0 03          	shl    rax,0x3
  801d84:	48 05 48 02 40 00    	add    rax,0x400248
  801d8a:	48 89 10             	mov    QWORD PTR [rax],rdx
            strcpy(vols[i].name,name);
  801d8d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801d90:	48 63 d0             	movsxd rdx,eax
  801d93:	48 89 d0             	mov    rax,rdx
  801d96:	48 c1 e0 02          	shl    rax,0x2
  801d9a:	48 01 d0             	add    rax,rdx
  801d9d:	48 c1 e0 03          	shl    rax,0x3
  801da1:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801da8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801dac:	48 89 c6             	mov    rsi,rax
  801daf:	48 89 d7             	mov    rdi,rdx
  801db2:	e8 51 b2 00 00       	call   80d008 <strcpy>
            return i;
  801db7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801dba:	eb 13                	jmp    801dcf <reg_vol+0x109>
    for(int i=0;i<MAX_VOLUMES;i++)
  801dbc:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801dc0:	83 7d fc 19          	cmp    DWORD PTR [rbp-0x4],0x19
  801dc4:	0f 8e 1e ff ff ff    	jle    801ce8 <reg_vol+0x22>
        }
    }
    return -1;
  801dca:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801dcf:	c9                   	leave  
  801dd0:	c3                   	ret    

0000000000801dd1 <sys_tell>:
//    if(!f)return -1;
//    f->ptr=offset+origin;
//    return 0;
//}
int sys_tell(int fno)
{
  801dd1:	f3 0f 1e fa          	endbr64 
  801dd5:	55                   	push   rbp
  801dd6:	48 89 e5             	mov    rbp,rsp
  801dd9:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    struct file* f=current->openf[fno];
  801ddc:	48 8b 05 5d 34 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1345d]        # 415240 <current>
  801de3:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  801de6:	48 63 d2             	movsxd rdx,edx
  801de9:	48 83 c2 1a          	add    rdx,0x1a
  801ded:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  801df2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return f->position;
  801df6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801dfa:	48 8b 00             	mov    rax,QWORD PTR [rax]
}
  801dfd:	5d                   	pop    rbp
  801dfe:	c3                   	ret    

0000000000801dff <get_vfs_entry>:
vfs_dir_entry *get_vfs_entry(int fno)
{
  801dff:	f3 0f 1e fa          	endbr64 
  801e03:	55                   	push   rbp
  801e04:	48 89 e5             	mov    rbp,rsp
  801e07:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801e0a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801e11:	eb 3f                	jmp    801e52 <get_vfs_entry+0x53>
    {
        if(opened[i].fno==fno)
  801e13:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801e16:	48 63 d0             	movsxd rdx,eax
  801e19:	48 89 d0             	mov    rax,rdx
  801e1c:	48 01 c0             	add    rax,rax
  801e1f:	48 01 d0             	add    rax,rdx
  801e22:	48 c1 e0 05          	shl    rax,0x5
  801e26:	48 05 60 06 40 00    	add    rax,0x400660
  801e2c:	8b 00                	mov    eax,DWORD PTR [rax]
  801e2e:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801e31:	75 1b                	jne    801e4e <get_vfs_entry+0x4f>
        {
            return &opened[i];
  801e33:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801e36:	48 63 d0             	movsxd rdx,eax
  801e39:	48 89 d0             	mov    rax,rdx
  801e3c:	48 01 c0             	add    rax,rax
  801e3f:	48 01 d0             	add    rax,rdx
  801e42:	48 c1 e0 05          	shl    rax,0x5
  801e46:	48 05 60 06 40 00    	add    rax,0x400660
  801e4c:	eb 0f                	jmp    801e5d <get_vfs_entry+0x5e>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801e4e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801e52:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  801e56:	7e bb                	jle    801e13 <get_vfs_entry+0x14>
        }
    }
    return NULL;
  801e58:	b8 00 00 00 00       	mov    eax,0x0
}
  801e5d:	5d                   	pop    rbp
  801e5e:	c3                   	ret    

0000000000801e5f <brelse>:

//释放缓冲区（只释放这一块）
int brelse(buffer_head* bh)
{
  801e5f:	f3 0f 1e fa          	endbr64 
  801e63:	55                   	push   rbp
  801e64:	48 89 e5             	mov    rbp,rsp
  801e67:	48 83 ec 10          	sub    rsp,0x10
  801e6b:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    wait_on_buf(bh);
  801e6f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801e73:	48 89 c7             	mov    rdi,rax
  801e76:	e8 a0 04 00 00       	call   80231b <wait_on_buf>
    if(bh->b_count==0)return -1;
  801e7b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801e7f:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801e83:	84 c0                	test   al,al
  801e85:	75 07                	jne    801e8e <brelse+0x2f>
  801e87:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801e8c:	eb 32                	jmp    801ec0 <brelse+0x61>
    bh->b_count--;
  801e8e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801e92:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801e96:	8d 50 ff             	lea    edx,[rax-0x1]
  801e99:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801e9d:	88 50 14             	mov    BYTE PTR [rax+0x14],dl
    if(bh->b_count==0)
  801ea0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801ea4:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801ea8:	84 c0                	test   al,al
  801eaa:	75 0f                	jne    801ebb <brelse+0x5c>
        vmfree(bh->b_data);
  801eac:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801eb0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801eb3:	48 89 c7             	mov    rdi,rax
  801eb6:	e8 16 f4 ff ff       	call   8012d1 <vmfree>
    return 0;
  801ebb:	b8 00 00 00 00       	mov    eax,0x0
}
  801ec0:	c9                   	leave  
  801ec1:	c3                   	ret    

0000000000801ec2 <bread>:
//从设备中读取指定设备的指定块并返回缓冲区
buffer_head* bread(int dev,int blk)
{
  801ec2:	f3 0f 1e fa          	endbr64 
  801ec6:	55                   	push   rbp
  801ec7:	48 89 e5             	mov    rbp,rsp
  801eca:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  801ed1:	89 bd 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],edi
  801ed7:	89 b5 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],esi

    buffer_head *bh=get_buf(dev,blk);
  801edd:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  801ee3:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  801ee9:	89 d6                	mov    esi,edx
  801eeb:	89 c7                	mov    edi,eax
  801eed:	e8 78 02 00 00       	call   80216a <get_buf>
  801ef2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!bh)return -1;//申请失败
  801ef6:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  801efb:	75 09                	jne    801f06 <bread+0x44>
  801efd:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  801f04:	eb 75                	jmp    801f7b <bread+0xb9>
    if(!bh->b_uptodate)
  801f06:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f0a:	0f b6 40 12          	movzx  eax,BYTE PTR [rax+0x12]
  801f0e:	84 c0                	test   al,al
  801f10:	75 65                	jne    801f77 <bread+0xb5>
    {
        driver_args arg;
        arg.dev=dev;
  801f12:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  801f18:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
        arg.cmd=DRVF_READ;
  801f1b:	c7 45 d8 02 00 00 00 	mov    DWORD PTR [rbp-0x28],0x2
        arg.dist_addr=bh->b_data;
  801f22:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f26:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801f29:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.len=BLOCK_SIZE;
  801f2f:	c7 85 48 ff ff ff 00 	mov    DWORD PTR [rbp-0xb8],0x200
  801f36:	02 00 00 
        arg.lba=bh->b_blocknr;
  801f39:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f3d:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  801f41:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
        arg.sec_c=BLOCK_SIZE/512;//之后会改
  801f47:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  801f4e:	00 00 00 
        //lock_buffer(bh);//锁定缓冲块直到读取完成
        int reqi=make_request(&arg);
  801f51:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  801f58:	48 89 c7             	mov    rdi,rax
  801f5b:	e8 48 1c 00 00       	call   803ba8 <make_request>
  801f60:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        wait_on_req(reqi);
  801f63:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801f66:	89 c7                	mov    edi,eax
  801f68:	e8 4e 1f 00 00       	call   803ebb <wait_on_req>
        clear_req(reqi);
  801f6d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801f70:	89 c7                	mov    edi,eax
  801f72:	e8 74 1f 00 00       	call   803eeb <clear_req>
    }
    return bh;
  801f77:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  801f7b:	c9                   	leave  
  801f7c:	c3                   	ret    

0000000000801f7d <vfs_read_file>:


int vfs_read_file(vfs_dir_entry *f,char *buf,int len)
{
  801f7d:	f3 0f 1e fa          	endbr64 
  801f81:	55                   	push   rbp
  801f82:	48 89 e5             	mov    rbp,rsp
  801f85:	48 83 ec 40          	sub    rsp,0x40
  801f89:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  801f8d:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  801f91:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  801f94:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801f98:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  801f9b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  801f9e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801fa2:	48 89 c7             	mov    rdi,rax
  801fa5:	e8 80 01 00 00       	call   80212a <get_according_bnr>
  801faa:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=bread(dev,block);
  801fad:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801fb0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801fb3:	89 d6                	mov    esi,edx
  801fb5:	89 c7                	mov    edi,eax
  801fb7:	e8 06 ff ff ff       	call   801ec2 <bread>
  801fbc:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  801fc0:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  801fc3:	ba 00 02 00 00       	mov    edx,0x200
  801fc8:	39 d0                	cmp    eax,edx
  801fca:	0f 4f c2             	cmovg  eax,edx
  801fcd:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(buf,bh->b_data,size);
  801fd0:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  801fd3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801fd7:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  801fda:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  801fde:	48 89 ce             	mov    rsi,rcx
  801fe1:	48 89 c7             	mov    rdi,rax
  801fe4:	e8 21 af 00 00       	call   80cf0a <memcpy>
        len-=BLOCK_SIZE;
  801fe9:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  801ff0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801ff4:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  801ff7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801ffa:	01 c2                	add    edx,eax
  801ffc:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802000:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        brelse(bh);
  802003:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802007:	48 89 c7             	mov    rdi,rax
  80200a:	e8 50 fe ff ff       	call   801e5f <brelse>
    }while(len>0);
  80200f:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  802013:	7f 89                	jg     801f9e <vfs_read_file+0x21>
    return 0;
  802015:	b8 00 00 00 00       	mov    eax,0x0
}
  80201a:	c9                   	leave  
  80201b:	c3                   	ret    

000000000080201c <vfs_write_file>:
int vfs_write_file(vfs_dir_entry *f,char *buf,int len)
{
  80201c:	f3 0f 1e fa          	endbr64 
  802020:	55                   	push   rbp
  802021:	48 89 e5             	mov    rbp,rsp
  802024:	48 83 ec 40          	sub    rsp,0x40
  802028:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80202c:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  802030:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  802033:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802037:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  80203a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  80203d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802041:	48 89 c7             	mov    rdi,rax
  802044:	e8 e1 00 00 00       	call   80212a <get_according_bnr>
  802049:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=get_buf(dev,block);
  80204c:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  80204f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802052:	89 d6                	mov    esi,edx
  802054:	89 c7                	mov    edi,eax
  802056:	e8 0f 01 00 00       	call   80216a <get_buf>
  80205b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  80205f:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  802062:	ba 00 02 00 00       	mov    edx,0x200
  802067:	39 d0                	cmp    eax,edx
  802069:	0f 4f c2             	cmovg  eax,edx
  80206c:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(bh->b_data,buf,size);
  80206f:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  802072:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802076:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802079:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  80207d:	48 89 ce             	mov    rsi,rcx
  802080:	48 89 c7             	mov    rdi,rax
  802083:	e8 82 ae 00 00       	call   80cf0a <memcpy>
        len-=BLOCK_SIZE;
  802088:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  80208f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802093:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  802096:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802099:	01 c2                	add    edx,eax
  80209b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80209f:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        bh->b_dirt=1;//修改置位
  8020a2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8020a6:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  8020aa:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8020ae:	48 89 c7             	mov    rdi,rax
  8020b1:	e8 a9 fd ff ff       	call   801e5f <brelse>
    }while(len>0);
  8020b6:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  8020ba:	7f 81                	jg     80203d <vfs_write_file+0x21>
    return 0;
  8020bc:	b8 00 00 00 00       	mov    eax,0x0
}
  8020c1:	c9                   	leave  
  8020c2:	c3                   	ret    

00000000008020c3 <vfs_seek_file>:

int vfs_seek_file(vfs_dir_entry *f,int offset,int origin)
{
  8020c3:	f3 0f 1e fa          	endbr64 
  8020c7:	55                   	push   rbp
  8020c8:	48 89 e5             	mov    rbp,rsp
  8020cb:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8020cf:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  8020d2:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    switch (origin)
  8020d5:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  8020d9:	74 35                	je     802110 <vfs_seek_file+0x4d>
  8020db:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  8020df:	7f 3f                	jg     802120 <vfs_seek_file+0x5d>
  8020e1:	83 7d f0 00          	cmp    DWORD PTR [rbp-0x10],0x0
  8020e5:	74 08                	je     8020ef <vfs_seek_file+0x2c>
  8020e7:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  8020eb:	74 0e                	je     8020fb <vfs_seek_file+0x38>
        break;
    case SEEK_END:
        f->ptr=f->size;
        break;
    default:
        break;
  8020ed:	eb 31                	jmp    802120 <vfs_seek_file+0x5d>
        f->ptr=offset;
  8020ef:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8020f3:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8020f6:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  8020f9:	eb 26                	jmp    802121 <vfs_seek_file+0x5e>
        f->ptr+=offset;
  8020fb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8020ff:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  802102:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802105:	01 c2                	add    edx,eax
  802107:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80210b:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  80210e:	eb 11                	jmp    802121 <vfs_seek_file+0x5e>
        f->ptr=f->size;
  802110:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802114:	8b 50 18             	mov    edx,DWORD PTR [rax+0x18]
  802117:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80211b:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  80211e:	eb 01                	jmp    802121 <vfs_seek_file+0x5e>
        break;
  802120:	90                   	nop
    }
    return f->ptr;
  802121:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802125:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  802128:	5d                   	pop    rbp
  802129:	c3                   	ret    

000000000080212a <get_according_bnr>:
//返回文件ptr在块设备中的块号
int get_according_bnr(vfs_dir_entry *f)
{
  80212a:	f3 0f 1e fa          	endbr64 
  80212e:	55                   	push   rbp
  80212f:	48 89 e5             	mov    rbp,rsp
  802132:	48 83 ec 10          	sub    rsp,0x10
  802136:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return vols[f->voln].fs->get_according_bnr(f);
  80213a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80213e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802141:	48 63 d0             	movsxd rdx,eax
  802144:	48 89 d0             	mov    rax,rdx
  802147:	48 c1 e0 02          	shl    rax,0x2
  80214b:	48 01 d0             	add    rax,rdx
  80214e:	48 c1 e0 03          	shl    rax,0x3
  802152:	48 05 58 02 40 00    	add    rax,0x400258
  802158:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80215b:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  80215f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802163:	48 89 c7             	mov    rdi,rax
  802166:	ff d2                	call   rdx

}
  802168:	c9                   	leave  
  802169:	c3                   	ret    

000000000080216a <get_buf>:
//获取或者新建一个和dev上block相对应的缓冲区。
buffer_head* get_buf(int dev,int block)
{
  80216a:	f3 0f 1e fa          	endbr64 
  80216e:	55                   	push   rbp
  80216f:	48 89 e5             	mov    rbp,rsp
  802172:	48 83 ec 20          	sub    rsp,0x20
  802176:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802179:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<NR_BUFFERHEADS;i++)
  80217c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802183:	e9 b9 00 00 00       	jmp    802241 <get_buf+0xd7>
    {
        if(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block)
  802188:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80218b:	48 98                	cdqe   
  80218d:	48 c1 e0 06          	shl    rax,0x6
  802191:	48 05 90 26 40 00    	add    rax,0x402690
  802197:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80219a:	0f b7 c0             	movzx  eax,ax
  80219d:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8021a0:	0f 85 97 00 00 00    	jne    80223d <get_buf+0xd3>
  8021a6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8021a9:	48 98                	cdqe   
  8021ab:	48 c1 e0 06          	shl    rax,0x6
  8021af:	48 05 88 26 40 00    	add    rax,0x402688
  8021b5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8021b8:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8021bb:	48 98                	cdqe   
  8021bd:	48 39 c2             	cmp    rdx,rax
  8021c0:	75 7b                	jne    80223d <get_buf+0xd3>
        {
            repeat:
  8021c2:	90                   	nop
            wait_on_buf(&buffer_heads[i]);//等待解锁
  8021c3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8021c6:	48 98                	cdqe   
  8021c8:	48 c1 e0 06          	shl    rax,0x6
  8021cc:	48 05 80 26 40 00    	add    rax,0x402680
  8021d2:	48 89 c7             	mov    rdi,rax
  8021d5:	e8 41 01 00 00       	call   80231b <wait_on_buf>
            if(buffer_heads[i].b_count>0)//别的进程正在用
  8021da:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8021dd:	48 98                	cdqe   
  8021df:	48 c1 e0 06          	shl    rax,0x6
  8021e3:	48 05 94 26 40 00    	add    rax,0x402694
  8021e9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8021ec:	84 c0                	test   al,al
  8021ee:	74 02                	je     8021f2 <get_buf+0x88>
                goto repeat;
  8021f0:	eb d1                	jmp    8021c3 <get_buf+0x59>
            if(!(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block))//别的进程修改了
  8021f2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8021f5:	48 98                	cdqe   
  8021f7:	48 c1 e0 06          	shl    rax,0x6
  8021fb:	48 05 90 26 40 00    	add    rax,0x402690
  802201:	0f b7 00             	movzx  eax,WORD PTR [rax]
  802204:	0f b7 c0             	movzx  eax,ax
  802207:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80220a:	75 30                	jne    80223c <get_buf+0xd2>
  80220c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80220f:	48 98                	cdqe   
  802211:	48 c1 e0 06          	shl    rax,0x6
  802215:	48 05 88 26 40 00    	add    rax,0x402688
  80221b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80221e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802221:	48 98                	cdqe   
  802223:	48 39 c2             	cmp    rdx,rax
  802226:	75 14                	jne    80223c <get_buf+0xd2>
                continue;
            return &buffer_heads[i];
  802228:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80222b:	48 98                	cdqe   
  80222d:	48 c1 e0 06          	shl    rax,0x6
  802231:	48 05 80 26 40 00    	add    rax,0x402680
  802237:	e9 dd 00 00 00       	jmp    802319 <get_buf+0x1af>
                continue;
  80223c:	90                   	nop
    for(int i=0;i<NR_BUFFERHEADS;i++)
  80223d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802241:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  802245:	0f 8e 3d ff ff ff    	jle    802188 <get_buf+0x1e>
        }
    }
    //空头中找
    for(int i=0;i<NR_BUFFERHEADS;i++)
  80224b:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  802252:	e9 b8 00 00 00       	jmp    80230f <get_buf+0x1a5>
    {
        if(buffer_heads[i].b_count==0)
  802257:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80225a:	48 98                	cdqe   
  80225c:	48 c1 e0 06          	shl    rax,0x6
  802260:	48 05 94 26 40 00    	add    rax,0x402694
  802266:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802269:	84 c0                	test   al,al
  80226b:	0f 85 9a 00 00 00    	jne    80230b <get_buf+0x1a1>
        {
            if(buffer_heads[i].b_dirt)
  802271:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802274:	48 98                	cdqe   
  802276:	48 c1 e0 06          	shl    rax,0x6
  80227a:	48 05 93 26 40 00    	add    rax,0x402693
  802280:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802283:	84 c0                	test   al,al
  802285:	74 2e                	je     8022b5 <get_buf+0x14b>
            {
                sync_buf(&buffer_heads[i]);
  802287:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80228a:	48 98                	cdqe   
  80228c:	48 c1 e0 06          	shl    rax,0x6
  802290:	48 05 80 26 40 00    	add    rax,0x402680
  802296:	48 89 c7             	mov    rdi,rax
  802299:	e8 1b 01 00 00       	call   8023b9 <sync_buf>
                wait_on_buf(&buffer_heads[i]);
  80229e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8022a1:	48 98                	cdqe   
  8022a3:	48 c1 e0 06          	shl    rax,0x6
  8022a7:	48 05 80 26 40 00    	add    rax,0x402680
  8022ad:	48 89 c7             	mov    rdi,rax
  8022b0:	e8 66 00 00 00       	call   80231b <wait_on_buf>
            }
            buffer_heads[i].b_count++;
  8022b5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8022b8:	48 98                	cdqe   
  8022ba:	48 c1 e0 06          	shl    rax,0x6
  8022be:	48 05 94 26 40 00    	add    rax,0x402694
  8022c4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8022c7:	8d 50 01             	lea    edx,[rax+0x1]
  8022ca:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8022cd:	48 98                	cdqe   
  8022cf:	48 c1 e0 06          	shl    rax,0x6
  8022d3:	48 05 94 26 40 00    	add    rax,0x402694
  8022d9:	88 10                	mov    BYTE PTR [rax],dl
            //给buffer分配一个实际的缓冲区
            buffer_heads[i].b_data=vmalloc();
  8022db:	b8 00 00 00 00       	mov    eax,0x0
  8022e0:	e8 5d ef ff ff       	call   801242 <vmalloc>
  8022e5:	48 89 c2             	mov    rdx,rax
  8022e8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8022eb:	48 98                	cdqe   
  8022ed:	48 c1 e0 06          	shl    rax,0x6
  8022f1:	48 05 80 26 40 00    	add    rax,0x402680
  8022f7:	48 89 10             	mov    QWORD PTR [rax],rdx
            return &buffer_heads[i];
  8022fa:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8022fd:	48 98                	cdqe   
  8022ff:	48 c1 e0 06          	shl    rax,0x6
  802303:	48 05 80 26 40 00    	add    rax,0x402680
  802309:	eb 0e                	jmp    802319 <get_buf+0x1af>
    for(int i=0;i<NR_BUFFERHEADS;i++)
  80230b:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80230f:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  802313:	0f 8e 3e ff ff ff    	jle    802257 <get_buf+0xed>
        }
    }
}
  802319:	c9                   	leave  
  80231a:	c3                   	ret    

000000000080231b <wait_on_buf>:

void wait_on_buf(buffer_head* bh)
{
  80231b:	f3 0f 1e fa          	endbr64 
  80231f:	55                   	push   rbp
  802320:	48 89 e5             	mov    rbp,rsp
  802323:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    //等待缓冲区解锁
    while (bh->b_lock);
  802327:	90                   	nop
  802328:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80232c:	0f b6 40 15          	movzx  eax,BYTE PTR [rax+0x15]
  802330:	84 c0                	test   al,al
  802332:	75 f4                	jne    802328 <wait_on_buf+0xd>
    
}
  802334:	90                   	nop
  802335:	90                   	nop
  802336:	5d                   	pop    rbp
  802337:	c3                   	ret    

0000000000802338 <scan_dev>:

//扫描块设备，读取分区，识别文件系统
int scan_dev(int dev)
{
  802338:	f3 0f 1e fa          	endbr64 
  80233c:	55                   	push   rbp
  80233d:	48 89 e5             	mov    rbp,rsp
  802340:	48 83 ec 30          	sub    rsp,0x30
  802344:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
//    device *blkdev=get_dev(dev);
//    buffer_head* bh=bread(dev,0);
//    if(!bh)return -1;
    char* buf=vmalloc();
  802347:	b8 00 00 00 00       	mov    eax,0x0
  80234c:	e8 f1 ee ff ff       	call   801242 <vmalloc>
  802351:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    int r=request(DISK_MAJOR_MAJOR,DISK_CMD_READ,0,1,buf);
  802355:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802359:	49 89 c0             	mov    r8,rax
  80235c:	b9 01 00 00 00       	mov    ecx,0x1
  802361:	ba 00 00 00 00       	mov    edx,0x0
  802366:	be 20 00 00 00       	mov    esi,0x20
  80236b:	bf 00 00 00 00       	mov    edi,0x0
  802370:	e8 32 74 00 00       	call   8097a7 <request>
  802375:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    chk_result(r);
  802378:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80237b:	89 c7                	mov    edi,eax
  80237d:	e8 d9 7a 00 00       	call   809e5b <chk_result>

    dpt_t* dpte=buf+0x1be;
  802382:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802386:	48 05 be 01 00 00    	add    rax,0x1be
  80238c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(int i=0;i<4;i++)
  802390:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  802397:	eb 13                	jmp    8023ac <scan_dev+0x74>
    {
//        blkdev->par[i].type=dpte->type;
        int stlba=dpte->start_lba;
  802399:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80239d:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8023a0:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
//        {
//            printf("err:unrecognised partition fs.\n");
//        }

//        blkdev->par[i].end_sec=dpte->end_lba;
        dpte++;
  8023a3:	48 83 45 f8 10       	add    QWORD PTR [rbp-0x8],0x10
    for(int i=0;i<4;i++)
  8023a8:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8023ac:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8023b0:	7e e7                	jle    802399 <scan_dev+0x61>
    }
//    brelse(bh);
    return 0;
  8023b2:	b8 00 00 00 00       	mov    eax,0x0
}
  8023b7:	c9                   	leave  
  8023b8:	c3                   	ret    

00000000008023b9 <sync_buf>:

int sync_buf(buffer_head* bh)
{
  8023b9:	f3 0f 1e fa          	endbr64 
  8023bd:	55                   	push   rbp
  8023be:	48 89 e5             	mov    rbp,rsp
  8023c1:	48 83 ec 20          	sub    rsp,0x20
  8023c5:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int dev=bh->b_dev;
  8023c9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8023cd:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
  8023d1:	0f b7 c0             	movzx  eax,ax
  8023d4:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int block=bh->b_blocknr;
  8023d7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8023db:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8023df:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //这里需要调用块设备写函数write_block
    return write_block(dev,block,bh->b_data,BLOCK_SIZE);
  8023e2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8023e6:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8023e9:	8b 75 f8             	mov    esi,DWORD PTR [rbp-0x8]
  8023ec:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8023ef:	b9 00 02 00 00       	mov    ecx,0x200
  8023f4:	89 c7                	mov    edi,eax
  8023f6:	e8 02 00 00 00       	call   8023fd <write_block>

}
  8023fb:	c9                   	leave  
  8023fc:	c3                   	ret    

00000000008023fd <write_block>:
//操作块设备函数
int write_block(int dev,int block,char *buf,int len)
{
  8023fd:	f3 0f 1e fa          	endbr64 
  802401:	55                   	push   rbp
  802402:	48 89 e5             	mov    rbp,rsp
  802405:	48 83 ec 30          	sub    rsp,0x30
  802409:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80240c:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80240f:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  802413:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=get_buf(dev,block);
  802416:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802419:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80241c:	89 d6                	mov    esi,edx
  80241e:	89 c7                	mov    edi,eax
  802420:	e8 45 fd ff ff       	call   80216a <get_buf>
  802425:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802429:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80242c:	ba 00 02 00 00       	mov    edx,0x200
  802431:	39 d0                	cmp    eax,edx
  802433:	0f 4f c2             	cmovg  eax,edx
  802436:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(bh->b_data,buf,size);
  802439:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80243c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802440:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802443:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  802447:	48 89 ce             	mov    rsi,rcx
  80244a:	48 89 c7             	mov    rdi,rax
  80244d:	e8 b8 aa 00 00       	call   80cf0a <memcpy>
        len-=BLOCK_SIZE;
  802452:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        bh->b_dirt=1;//修改置位
  802459:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80245d:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  802461:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802465:	48 89 c7             	mov    rdi,rax
  802468:	e8 f2 f9 ff ff       	call   801e5f <brelse>
    }while(len>0);
  80246d:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  802471:	7f a3                	jg     802416 <write_block+0x19>
    return 0;
  802473:	b8 00 00 00 00       	mov    eax,0x0
}
  802478:	c9                   	leave  
  802479:	c3                   	ret    

000000000080247a <read_block>:
int read_block(int dev,int block,char* buf,int len)
{
  80247a:	f3 0f 1e fa          	endbr64 
  80247e:	55                   	push   rbp
  80247f:	48 89 e5             	mov    rbp,rsp
  802482:	48 83 ec 30          	sub    rsp,0x30
  802486:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802489:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80248c:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  802490:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=bread(dev,block);
  802493:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802496:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802499:	89 d6                	mov    esi,edx
  80249b:	89 c7                	mov    edi,eax
  80249d:	e8 20 fa ff ff       	call   801ec2 <bread>
  8024a2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  8024a6:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8024a9:	ba 00 02 00 00       	mov    edx,0x200
  8024ae:	39 d0                	cmp    eax,edx
  8024b0:	0f 4f c2             	cmovg  eax,edx
  8024b3:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(buf,bh->b_data,size);
  8024b6:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8024b9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8024bd:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8024c0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8024c4:	48 89 ce             	mov    rsi,rcx
  8024c7:	48 89 c7             	mov    rdi,rax
  8024ca:	e8 3b aa 00 00       	call   80cf0a <memcpy>
        len-=BLOCK_SIZE;
  8024cf:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        brelse(bh);
  8024d6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8024da:	48 89 c7             	mov    rdi,rax
  8024dd:	e8 7d f9 ff ff       	call   801e5f <brelse>
    }while(len>0);
  8024e2:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  8024e6:	7f ab                	jg     802493 <read_block+0x19>
    return 0;
  8024e8:	b8 00 00 00 00       	mov    eax,0x0
}
  8024ed:	c9                   	leave  
  8024ee:	c3                   	ret    

00000000008024ef <init_vfs>:

int init_vfs()
{
  8024ef:	f3 0f 1e fa          	endbr64 
  8024f3:	55                   	push   rbp
  8024f4:	48 89 e5             	mov    rbp,rsp
  8024f7:	48 83 ec 10          	sub    rsp,0x10
    //扫描块设备
    extern device *dev_tree[];
    extern device devs[];
    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
  8024fb:	48 8b 05 7e 5f c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05f7e]        # 408480 <dev_tree>
  802502:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(;p;p=p->next)
  802506:	eb 40                	jmp    802548 <init_vfs+0x59>
    {
        if(scan_dev(p-devs)!=0)return -1;
  802508:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80250c:	48 2d 80 2e 40 00    	sub    rax,0x402e80
  802512:	48 c1 f8 02          	sar    rax,0x2
  802516:	48 89 c2             	mov    rdx,rax
  802519:	48 b8 19 9c 8f c1 f9 	movabs rax,0x8f9c18f9c18f9c19
  802520:	18 9c 8f 
  802523:	48 0f af c2          	imul   rax,rdx
  802527:	89 c7                	mov    edi,eax
  802529:	e8 0a fe ff ff       	call   802338 <scan_dev>
  80252e:	85 c0                	test   eax,eax
  802530:	74 07                	je     802539 <init_vfs+0x4a>
  802532:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802537:	eb 1b                	jmp    802554 <init_vfs+0x65>
    for(;p;p=p->next)
  802539:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80253d:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802544:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  802548:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80254d:	75 b9                	jne    802508 <init_vfs+0x19>
    }

    return 0;
  80254f:	b8 00 00 00 00       	mov    eax,0x0
}
  802554:	c9                   	leave  
  802555:	c3                   	ret    

0000000000802556 <make_dentry>:
};
struct dir_entry_operations dev_dir_dops={

};
static int devd_fd=-1;
void make_dentry(struct dir_entry* d,char* name,int namelen,struct dir_entry* parent,struct dir_entry_operations* dops){
  802556:	f3 0f 1e fa          	endbr64 
  80255a:	55                   	push   rbp
  80255b:	48 89 e5             	mov    rbp,rsp
  80255e:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  802562:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  802566:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  80256a:	89 55 9c             	mov    DWORD PTR [rbp-0x64],edx
  80256d:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  802571:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
    strcpy(d->name,name);
  802575:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  802579:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80257c:	48 8b 55 a0          	mov    rdx,QWORD PTR [rbp-0x60]
  802580:	48 89 d6             	mov    rsi,rdx
  802583:	48 89 c7             	mov    rdi,rax
  802586:	e8 7d aa 00 00       	call   80d008 <strcpy>
    d->name_length=namelen;
  80258b:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80258f:	8b 55 9c             	mov    edx,DWORD PTR [rbp-0x64]
  802592:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    //添加dentry的操作方法，这样能够查找设备
    d->dir_ops=dops;
  802595:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  802599:	48 8b 55 88          	mov    rdx,QWORD PTR [rbp-0x78]
  80259d:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
    list_init(&d->subdirs_list);
  8025a1:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8025a5:	48 83 c0 28          	add    rax,0x28
  8025a9:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    struct List * next;
};

__attribute__((always_inline)) inline void list_init(struct List * list)
{
    list->prev = NULL;
  8025ad:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8025b1:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  8025b8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8025bc:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  8025c3:	00 
}
  8025c4:	90                   	nop
    list_init(&d->child_node);
  8025c5:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8025c9:	48 83 c0 10          	add    rax,0x10
  8025cd:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    list->prev = NULL;
  8025d1:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8025d5:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  8025dc:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8025e0:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  8025e7:	00 
}
  8025e8:	90                   	nop
    d->child_node.data=d;
  8025e9:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8025ed:	48 8b 55 a8          	mov    rdx,QWORD PTR [rbp-0x58]
  8025f1:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    d->parent=parent;
  8025f5:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8025f9:	48 8b 55 90          	mov    rdx,QWORD PTR [rbp-0x70]
  8025fd:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    list_add(&parent->subdirs_list,&d->child_node);
  802601:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  802605:	48 83 c0 10          	add    rax,0x10
  802609:	48 8b 55 90          	mov    rdx,QWORD PTR [rbp-0x70]
  80260d:	48 83 c2 28          	add    rdx,0x28
  802611:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  802615:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        new->next->prev = new;
    entry->next = new;
}
__attribute__((always_inline)) inline void list_add(struct List * entry,struct List * new)	////add to the tail of the link
{
    if(entry->next==NULL)
  802619:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80261d:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802621:	48 85 c0             	test   rax,rax
  802624:	75 58                	jne    80267e <make_dentry+0x128>
  802626:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80262a:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  80262e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802632:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    new->next = entry->next;
  802636:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80263a:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  80263e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802642:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  802646:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80264a:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80264e:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  802651:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802655:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802659:	48 85 c0             	test   rax,rax
  80265c:	74 0f                	je     80266d <make_dentry+0x117>
        new->next->prev = new;
  80265e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802662:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802666:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  80266a:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  80266d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802671:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802675:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  802679:	e9 9c 00 00 00       	jmp    80271a <make_dentry+0x1c4>
        list_add_to_behind(entry,new);
    else{
        struct List* p=entry;
  80267e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802682:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        for(;p->next&&p->next!=p;p=p->next){
  802686:	eb 21                	jmp    8026a9 <make_dentry+0x153>
            if(p->data==new->data)
  802688:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80268c:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  802690:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802694:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  802698:	48 39 c2             	cmp    rdx,rax
  80269b:	74 7c                	je     802719 <make_dentry+0x1c3>
        for(;p->next&&p->next!=p;p=p->next){
  80269d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8026a1:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8026a5:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  8026a9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8026ad:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8026b1:	48 85 c0             	test   rax,rax
  8026b4:	74 0e                	je     8026c4 <make_dentry+0x16e>
  8026b6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8026ba:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8026be:	48 39 45 d8          	cmp    QWORD PTR [rbp-0x28],rax
  8026c2:	75 c4                	jne    802688 <make_dentry+0x132>
  8026c4:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8026c8:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  8026cc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8026d0:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    new->next = entry->next;
  8026d4:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8026d8:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  8026dc:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8026e0:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  8026e4:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8026e8:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8026ec:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  8026ef:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8026f3:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8026f7:	48 85 c0             	test   rax,rax
  8026fa:	74 0f                	je     80270b <make_dentry+0x1b5>
        new->next->prev = new;
  8026fc:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  802700:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802704:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  802708:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  80270b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80270f:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  802713:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  802717:	eb 01                	jmp    80271a <make_dentry+0x1c4>
                return;
  802719:	90                   	nop
}
  80271a:	90                   	nop
  80271b:	c9                   	leave  
  80271c:	c3                   	ret    

000000000080271d <make_inode>:
void make_inode(struct index_node* i,struct index_node_operations* iops,struct file_operations* fops,unsigned long attr,super_block* sb){
  80271d:	f3 0f 1e fa          	endbr64 
  802721:	55                   	push   rbp
  802722:	48 89 e5             	mov    rbp,rsp
  802725:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  802729:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80272d:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  802731:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  802735:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    i->f_ops=fops;
  802739:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80273d:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  802741:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
    i->attribute=attr;
  802745:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802749:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  80274d:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    i->sb=sb;
  802751:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802755:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802759:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    i->file_size=0;
  80275d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802761:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    i->inode_ops=iops;
  802768:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80276c:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  802770:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
}
  802774:	90                   	nop
  802775:	5d                   	pop    rbp
  802776:	c3                   	ret    

0000000000802777 <make_devf>:
void make_devf(struct dir_entry* d,struct index_node* i,char* name,struct dir_entry* ddev,struct file_operations* fops){
  802777:	f3 0f 1e fa          	endbr64 
  80277b:	55                   	push   rbp
  80277c:	48 89 e5             	mov    rbp,rsp
  80277f:	53                   	push   rbx
  802780:	48 83 ec 78          	sub    rsp,0x78
  802784:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  802788:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  80278c:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  802790:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  802794:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
    make_dentry(d,name, strlen(name),root_sb->root,&dev_dir_dops);
  802798:	48 8b 05 a9 5b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc25ba9]        # 428348 <root_sb>
  80279f:	48 8b 18             	mov    rbx,QWORD PTR [rax]
  8027a2:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8027a6:	48 89 c7             	mov    rdi,rax
  8027a9:	e8 79 aa 00 00       	call   80d227 <strlen>
  8027ae:	89 c2                	mov    edx,eax
  8027b0:	48 8b 75 98          	mov    rsi,QWORD PTR [rbp-0x68]
  8027b4:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8027b8:	41 b8 a0 84 40 00    	mov    r8d,0x4084a0
  8027be:	48 89 d9             	mov    rcx,rbx
  8027c1:	48 89 c7             	mov    rdi,rax
  8027c4:	e8 8d fd ff ff       	call   802556 <make_dentry>
    d->dir_inode=i;
  8027c9:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8027cd:	48 8b 55 a0          	mov    rdx,QWORD PTR [rbp-0x60]
  8027d1:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    make_inode(i,ddev->dir_inode->inode_ops,fops,FS_ATTR_DEVICE,root_sb);
  8027d5:	48 8b 0d 6c 5b c2 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc25b6c]        # 428348 <root_sb>
  8027dc:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8027e0:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8027e4:	48 8b 70 28          	mov    rsi,QWORD PTR [rax+0x28]
  8027e8:	48 8b 55 88          	mov    rdx,QWORD PTR [rbp-0x78]
  8027ec:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8027f0:	49 89 c8             	mov    r8,rcx
  8027f3:	b9 04 00 00 00       	mov    ecx,0x4
  8027f8:	48 89 c7             	mov    rdi,rax
  8027fb:	e8 1d ff ff ff       	call   80271d <make_inode>
    list_add(&ddev->subdirs_list,&d->child_node);//添加到/dev下
  802800:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  802804:	48 83 c0 10          	add    rax,0x10
  802808:	48 8b 55 90          	mov    rdx,QWORD PTR [rbp-0x70]
  80280c:	48 83 c2 28          	add    rdx,0x28
  802810:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  802814:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(entry->next==NULL)
  802818:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80281c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802820:	48 85 c0             	test   rax,rax
  802823:	75 58                	jne    80287d <make_devf+0x106>
  802825:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802829:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  80282d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802831:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    new->next = entry->next;
  802835:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802839:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  80283d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802841:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  802845:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802849:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80284d:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  802850:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802854:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802858:	48 85 c0             	test   rax,rax
  80285b:	74 0f                	je     80286c <make_devf+0xf5>
        new->next->prev = new;
  80285d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802861:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802865:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  802869:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  80286c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802870:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  802874:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  802878:	e9 9c 00 00 00       	jmp    802919 <make_devf+0x1a2>
        struct List* p=entry;
  80287d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802881:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
        for(;p->next&&p->next!=p;p=p->next){
  802885:	eb 21                	jmp    8028a8 <make_devf+0x131>
            if(p->data==new->data)
  802887:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80288b:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  80288f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802893:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  802897:	48 39 c2             	cmp    rdx,rax
  80289a:	74 7c                	je     802918 <make_devf+0x1a1>
        for(;p->next&&p->next!=p;p=p->next){
  80289c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8028a0:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8028a4:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  8028a8:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8028ac:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8028b0:	48 85 c0             	test   rax,rax
  8028b3:	74 0e                	je     8028c3 <make_devf+0x14c>
  8028b5:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8028b9:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8028bd:	48 39 45 c8          	cmp    QWORD PTR [rbp-0x38],rax
  8028c1:	75 c4                	jne    802887 <make_devf+0x110>
  8028c3:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8028c7:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  8028cb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8028cf:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    new->next = entry->next;
  8028d3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8028d7:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  8028db:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8028df:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  8028e3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8028e7:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  8028eb:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  8028ee:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8028f2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8028f6:	48 85 c0             	test   rax,rax
  8028f9:	74 0f                	je     80290a <make_devf+0x193>
        new->next->prev = new;
  8028fb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8028ff:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802903:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  802907:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  80290a:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80290e:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  802912:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  802916:	eb 01                	jmp    802919 <make_devf+0x1a2>
                return;
  802918:	90                   	nop
}
  802919:	90                   	nop
  80291a:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80291e:	c9                   	leave  
  80291f:	c3                   	ret    

0000000000802920 <init_devman>:
 * 这个/dev文件夹的dentry和inode等数据由devman管理，根文件系统切换时，这个文件夹会跟着挂载到新文件系统的根目录下。
 * */
struct dir_entry* ddev=NULL,*dmnt,*dconsole,*dhd0,*dtty;
struct file ftty;
int init_devman()
{
  802920:	f3 0f 1e fa          	endbr64 
  802924:	55                   	push   rbp
  802925:	48 89 e5             	mov    rbp,rsp
  802928:	48 83 ec 30          	sub    rsp,0x30
    //创建dev文件夹
    ddev=(struct dir_entry*)vmalloc();
  80292c:	b8 00 00 00 00       	mov    eax,0x0
  802931:	e8 0c e9 ff ff       	call   801242 <vmalloc>
  802936:	48 89 05 83 5b c0 ff 	mov    QWORD PTR [rip+0xffffffffffc05b83],rax        # 4084c0 <ddev>
    struct index_node* idev=ddev+1;
  80293d:	48 8b 05 7c 5b c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05b7c]        # 4084c0 <ddev>
  802944:	48 83 c0 58          	add    rax,0x58
  802948:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ddev->name=idev+1;
  80294c:	48 8b 05 6d 5b c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05b6d]        # 4084c0 <ddev>
  802953:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  802957:	48 83 c2 38          	add    rdx,0x38
  80295b:	48 89 10             	mov    QWORD PTR [rax],rdx
    make_dentry(ddev,"dev",3,root_sb->root,root_sb->root->dir_ops);
  80295e:	48 8b 05 e3 59 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc259e3]        # 428348 <root_sb>
  802965:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802968:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  80296c:	48 8b 05 d5 59 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc259d5]        # 428348 <root_sb>
  802973:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802976:	48 8b 05 43 5b c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05b43]        # 4084c0 <ddev>
  80297d:	49 89 c8             	mov    r8,rcx
  802980:	48 89 d1             	mov    rcx,rdx
  802983:	ba 03 00 00 00       	mov    edx,0x3
  802988:	be a8 55 81 00       	mov    esi,0x8155a8
  80298d:	48 89 c7             	mov    rdi,rax
  802990:	e8 c1 fb ff ff       	call   802556 <make_dentry>
    ddev->dir_inode=idev;
  802995:	48 8b 05 24 5b c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05b24]        # 4084c0 <ddev>
  80299c:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8029a0:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    make_inode(idev,root_sb->root->dir_inode->inode_ops,root_sb->root->dir_inode->f_ops,FS_ATTR_DIR,root_sb);
  8029a4:	48 8b 0d 9d 59 c2 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc2599d]        # 428348 <root_sb>
  8029ab:	48 8b 05 96 59 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc25996]        # 428348 <root_sb>
  8029b2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8029b5:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8029b9:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  8029bd:	48 8b 05 84 59 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc25984]        # 428348 <root_sb>
  8029c4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8029c7:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8029cb:	48 8b 70 28          	mov    rsi,QWORD PTR [rax+0x28]
  8029cf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8029d3:	49 89 c8             	mov    r8,rcx
  8029d6:	b9 02 00 00 00       	mov    ecx,0x2
  8029db:	48 89 c7             	mov    rdi,rax
  8029de:	e8 3a fd ff ff       	call   80271d <make_inode>
    idev->private_index_info=ddev;
  8029e3:	48 8b 15 d6 5a c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc05ad6]        # 4084c0 <ddev>
  8029ea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8029ee:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx

    //创建mnt文件夹
    dmnt=(struct dir_entry*)vmalloc();
  8029f2:	b8 00 00 00 00       	mov    eax,0x0
  8029f7:	e8 46 e8 ff ff       	call   801242 <vmalloc>
  8029fc:	48 89 05 c5 5a c0 ff 	mov    QWORD PTR [rip+0xffffffffffc05ac5],rax        # 4084c8 <dmnt>
    struct index_node* imnt=dmnt+1;
  802a03:	48 8b 05 be 5a c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05abe]        # 4084c8 <dmnt>
  802a0a:	48 83 c0 58          	add    rax,0x58
  802a0e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    dmnt->name=imnt+1;
  802a12:	48 8b 05 af 5a c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05aaf]        # 4084c8 <dmnt>
  802a19:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  802a1d:	48 83 c2 38          	add    rdx,0x38
  802a21:	48 89 10             	mov    QWORD PTR [rax],rdx
    make_dentry(dmnt,"mnt",3,root_sb->root,root_sb->root->dir_ops);
  802a24:	48 8b 05 1d 59 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2591d]        # 428348 <root_sb>
  802a2b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802a2e:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802a32:	48 8b 05 0f 59 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2590f]        # 428348 <root_sb>
  802a39:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802a3c:	48 8b 05 85 5a c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05a85]        # 4084c8 <dmnt>
  802a43:	49 89 c8             	mov    r8,rcx
  802a46:	48 89 d1             	mov    rcx,rdx
  802a49:	ba 03 00 00 00       	mov    edx,0x3
  802a4e:	be ac 55 81 00       	mov    esi,0x8155ac
  802a53:	48 89 c7             	mov    rdi,rax
  802a56:	e8 fb fa ff ff       	call   802556 <make_dentry>
    dmnt->dir_inode=imnt;
  802a5b:	48 8b 05 66 5a c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05a66]        # 4084c8 <dmnt>
  802a62:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  802a66:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    make_inode(imnt,root_sb->root->dir_inode->inode_ops,root_sb->root->dir_inode->f_ops,FS_ATTR_DIR,root_sb);
  802a6a:	48 8b 0d d7 58 c2 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc258d7]        # 428348 <root_sb>
  802a71:	48 8b 05 d0 58 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc258d0]        # 428348 <root_sb>
  802a78:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802a7b:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  802a7f:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  802a83:	48 8b 05 be 58 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc258be]        # 428348 <root_sb>
  802a8a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802a8d:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  802a91:	48 8b 70 28          	mov    rsi,QWORD PTR [rax+0x28]
  802a95:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802a99:	49 89 c8             	mov    r8,rcx
  802a9c:	b9 02 00 00 00       	mov    ecx,0x2
  802aa1:	48 89 c7             	mov    rdi,rax
  802aa4:	e8 74 fc ff ff       	call   80271d <make_inode>
    imnt->private_index_info=dmnt;
  802aa9:	48 8b 15 18 5a c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc05a18]        # 4084c8 <dmnt>
  802ab0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802ab4:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx


    //创建几个设备文件
    //console-framebuffer.c
    dconsole= (struct dir_entry *) vmalloc();
  802ab8:	b8 00 00 00 00       	mov    eax,0x0
  802abd:	e8 80 e7 ff ff       	call   801242 <vmalloc>
  802ac2:	48 89 05 07 5a c0 ff 	mov    QWORD PTR [rip+0xffffffffffc05a07],rax        # 4084d0 <dconsole>
    struct index_node* iconsole=dconsole+1;
  802ac9:	48 8b 05 00 5a c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05a00]        # 4084d0 <dconsole>
  802ad0:	48 83 c0 58          	add    rax,0x58
  802ad4:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    dconsole->name=iconsole+1;
  802ad8:	48 8b 05 f1 59 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc059f1]        # 4084d0 <dconsole>
  802adf:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  802ae3:	48 83 c2 38          	add    rdx,0x38
  802ae7:	48 89 10             	mov    QWORD PTR [rax],rdx
    make_devf(dconsole,iconsole,"console",ddev,&framebuffer_fops);
  802aea:	48 8b 15 cf 59 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc059cf]        # 4084c0 <ddev>
  802af1:	48 8b 05 d8 59 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc059d8]        # 4084d0 <dconsole>
  802af8:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  802afc:	41 b8 e0 d9 80 00    	mov    r8d,0x80d9e0
  802b02:	48 89 d1             	mov    rcx,rdx
  802b05:	ba b0 55 81 00       	mov    edx,0x8155b0
  802b0a:	48 89 c7             	mov    rdi,rax
  802b0d:	e8 65 fc ff ff       	call   802777 <make_devf>
    //hd0-disk.c
    dhd0= (struct dir_entry *) vmalloc();
  802b12:	b8 00 00 00 00       	mov    eax,0x0
  802b17:	e8 26 e7 ff ff       	call   801242 <vmalloc>
  802b1c:	48 89 05 b5 59 c0 ff 	mov    QWORD PTR [rip+0xffffffffffc059b5],rax        # 4084d8 <dhd0>
    struct index_node* ihd0=dhd0+1;
  802b23:	48 8b 05 ae 59 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc059ae]        # 4084d8 <dhd0>
  802b2a:	48 83 c0 58          	add    rax,0x58
  802b2e:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    dhd0->name=ihd0+1;
  802b32:	48 8b 05 9f 59 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0599f]        # 4084d8 <dhd0>
  802b39:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802b3d:	48 83 c2 38          	add    rdx,0x38
  802b41:	48 89 10             	mov    QWORD PTR [rax],rdx
    make_devf(dhd0,ihd0,"hd0",ddev,&hd_fops);
  802b44:	48 8b 15 75 59 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc05975]        # 4084c0 <ddev>
  802b4b:	48 8b 05 86 59 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05986]        # 4084d8 <dhd0>
  802b52:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  802b56:	41 b8 80 85 42 00    	mov    r8d,0x428580
  802b5c:	48 89 d1             	mov    rcx,rdx
  802b5f:	ba b8 55 81 00       	mov    edx,0x8155b8
  802b64:	48 89 c7             	mov    rdi,rax
  802b67:	e8 0b fc ff ff       	call   802777 <make_devf>
    //tty-tty.c
    dtty= (struct dir_entry *) vmalloc();
  802b6c:	b8 00 00 00 00       	mov    eax,0x0
  802b71:	e8 cc e6 ff ff       	call   801242 <vmalloc>
  802b76:	48 89 05 63 59 c0 ff 	mov    QWORD PTR [rip+0xffffffffffc05963],rax        # 4084e0 <dtty>
    struct index_node* itty=dtty+1;
  802b7d:	48 8b 05 5c 59 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0595c]        # 4084e0 <dtty>
  802b84:	48 83 c0 58          	add    rax,0x58
  802b88:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    dtty->name=itty+1;
  802b8c:	48 8b 05 4d 59 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0594d]        # 4084e0 <dtty>
  802b93:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802b97:	48 83 c2 38          	add    rdx,0x38
  802b9b:	48 89 10             	mov    QWORD PTR [rax],rdx
    make_devf(dtty,itty,"tty",ddev,&tty_fops);
  802b9e:	48 8b 15 1b 59 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0591b]        # 4084c0 <ddev>
  802ba5:	48 8b 05 34 59 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05934]        # 4084e0 <dtty>
  802bac:	48 8b 75 d8          	mov    rsi,QWORD PTR [rbp-0x28]
  802bb0:	41 b8 e0 dc 80 00    	mov    r8d,0x80dce0
  802bb6:	48 89 d1             	mov    rcx,rdx
  802bb9:	ba bc 55 81 00       	mov    edx,0x8155bc
  802bbe:	48 89 c7             	mov    rdi,rax
  802bc1:	e8 b1 fb ff ff       	call   802777 <make_devf>
    //初始化一下
    tty_fops.open(itty,&ftty);
  802bc6:	48 8b 15 13 b1 00 00 	mov    rdx,QWORD PTR [rip+0xb113]        # 80dce0 <tty_fops>
  802bcd:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802bd1:	be 00 85 40 00       	mov    esi,0x408500
  802bd6:	48 89 c7             	mov    rdi,rax
  802bd9:	ff d2                	call   rdx

}
  802bdb:	90                   	nop
  802bdc:	c9                   	leave  
  802bdd:	c3                   	ret    

0000000000802bde <open_dev>:
//
long open_dev(struct index_node * inode,struct file * filp){
  802bde:	f3 0f 1e fa          	endbr64 
  802be2:	55                   	push   rbp
  802be3:	48 89 e5             	mov    rbp,rsp
  802be6:	48 83 ec 20          	sub    rsp,0x20
  802bea:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802bee:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    //查看文件名
    char* name=filp->dentry->name;
  802bf2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802bf6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802bfa:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802bfd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char* p=name+ strlen(name)-1;
  802c01:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802c05:	48 89 c7             	mov    rdi,rax
  802c08:	e8 1a a6 00 00       	call   80d227 <strlen>
  802c0d:	48 98                	cdqe   
  802c0f:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  802c13:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802c17:	48 01 d0             	add    rax,rdx
  802c1a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='/'&&p>=name;p--);
  802c1e:	eb 05                	jmp    802c25 <open_dev+0x47>
  802c20:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  802c25:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802c29:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802c2c:	3c 2f                	cmp    al,0x2f
  802c2e:	74 0a                	je     802c3a <open_dev+0x5c>
  802c30:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802c34:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802c38:	73 e6                	jae    802c20 <open_dev+0x42>
    if(p>=name)
  802c3a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802c3e:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802c42:	72 0c                	jb     802c50 <open_dev+0x72>
        name=p+1;
  802c44:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802c48:	48 83 c0 01          	add    rax,0x1
  802c4c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(memcmp(name,"tty",3)==0){
  802c50:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802c54:	ba 03 00 00 00       	mov    edx,0x3
  802c59:	be bc 55 81 00       	mov    esi,0x8155bc
  802c5e:	48 89 c7             	mov    rdi,rax
  802c61:	e8 ee a2 00 00       	call   80cf54 <memcmp>
  802c66:	85 c0                	test   eax,eax
  802c68:	75 15                	jne    802c7f <open_dev+0xa1>
        return init_tty(inode,filp);
  802c6a:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802c6e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802c72:	48 89 d6             	mov    rsi,rdx
  802c75:	48 89 c7             	mov    rdi,rax
  802c78:	e8 5f 9c 00 00       	call   80c8dc <init_tty>
  802c7d:	eb 31                	jmp    802cb0 <open_dev+0xd2>
    }else if(strcmp(name,"console")==0){
  802c7f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802c83:	be b0 55 81 00       	mov    esi,0x8155b0
  802c88:	48 89 c7             	mov    rdi,rax
  802c8b:	e8 18 a5 00 00       	call   80d1a8 <strcmp>
  802c90:	85 c0                	test   eax,eax
  802c92:	75 15                	jne    802ca9 <open_dev+0xcb>
        return open_framebuffer(inode,filp);
  802c94:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802c98:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802c9c:	48 89 d6             	mov    rsi,rdx
  802c9f:	48 89 c7             	mov    rdi,rax
  802ca2:	e8 e3 4f 00 00       	call   807c8a <open_framebuffer>
  802ca7:	eb 07                	jmp    802cb0 <open_dev+0xd2>
    }
    return -1;
  802ca9:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
}
  802cb0:	c9                   	leave  
  802cb1:	c3                   	ret    

0000000000802cb2 <close_dev>:
long close_dev(struct index_node * inode,struct file * filp){
  802cb2:	f3 0f 1e fa          	endbr64 
  802cb6:	55                   	push   rbp
  802cb7:	48 89 e5             	mov    rbp,rsp
  802cba:	48 83 ec 20          	sub    rsp,0x20
  802cbe:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802cc2:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    //查看文件名
    char* name=filp->dentry->name;
  802cc6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802cca:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802cce:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802cd1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char* p=name+ strlen(name)-1;
  802cd5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802cd9:	48 89 c7             	mov    rdi,rax
  802cdc:	e8 46 a5 00 00       	call   80d227 <strlen>
  802ce1:	48 98                	cdqe   
  802ce3:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  802ce7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802ceb:	48 01 d0             	add    rax,rdx
  802cee:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='/'&&p>=name;p--);
  802cf2:	eb 05                	jmp    802cf9 <close_dev+0x47>
  802cf4:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  802cf9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802cfd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802d00:	3c 2f                	cmp    al,0x2f
  802d02:	74 0a                	je     802d0e <close_dev+0x5c>
  802d04:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802d08:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802d0c:	73 e6                	jae    802cf4 <close_dev+0x42>
    if(p>=name)
  802d0e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802d12:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802d16:	72 0c                	jb     802d24 <close_dev+0x72>
        name=p+1;
  802d18:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802d1c:	48 83 c0 01          	add    rax,0x1
  802d20:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(memcmp(name,"tty",3)==0){
  802d24:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802d28:	ba 03 00 00 00       	mov    edx,0x3
  802d2d:	be bc 55 81 00       	mov    esi,0x8155bc
  802d32:	48 89 c7             	mov    rdi,rax
  802d35:	e8 1a a2 00 00       	call   80cf54 <memcmp>
  802d3a:	85 c0                	test   eax,eax
  802d3c:	75 15                	jne    802d53 <close_dev+0xa1>
        return close_tty(inode,filp);
  802d3e:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802d42:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802d46:	48 89 d6             	mov    rsi,rdx
  802d49:	48 89 c7             	mov    rdi,rax
  802d4c:	e8 10 9b 00 00       	call   80c861 <close_tty>
  802d51:	eb 31                	jmp    802d84 <close_dev+0xd2>
    }else if(strcmp(name,"console")==0){
  802d53:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802d57:	be b0 55 81 00       	mov    esi,0x8155b0
  802d5c:	48 89 c7             	mov    rdi,rax
  802d5f:	e8 44 a4 00 00       	call   80d1a8 <strcmp>
  802d64:	85 c0                	test   eax,eax
  802d66:	75 15                	jne    802d7d <close_dev+0xcb>
        return close_framebuffer(inode,filp);
  802d68:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802d6c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802d70:	48 89 d6             	mov    rsi,rdx
  802d73:	48 89 c7             	mov    rdi,rax
  802d76:	e8 3e 4f 00 00       	call   807cb9 <close_framebuffer>
  802d7b:	eb 07                	jmp    802d84 <close_dev+0xd2>
    }
    return -1;
  802d7d:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff

}
  802d84:	c9                   	leave  
  802d85:	c3                   	ret    

0000000000802d86 <read_dev>:
long read_dev(struct file * filp,char * buf,unsigned long count,long * position){
  802d86:	f3 0f 1e fa          	endbr64 
  802d8a:	55                   	push   rbp
  802d8b:	48 89 e5             	mov    rbp,rsp
  802d8e:	48 83 ec 30          	sub    rsp,0x30
  802d92:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802d96:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  802d9a:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  802d9e:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
    //查看文件名
    char* name=filp->dentry->name;
  802da2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802da6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802daa:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802dad:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char* p=name+ strlen(name)-1;
  802db1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802db5:	48 89 c7             	mov    rdi,rax
  802db8:	e8 6a a4 00 00       	call   80d227 <strlen>
  802dbd:	48 98                	cdqe   
  802dbf:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  802dc3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802dc7:	48 01 d0             	add    rax,rdx
  802dca:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='/'&&p>=name;p--);
  802dce:	eb 05                	jmp    802dd5 <read_dev+0x4f>
  802dd0:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  802dd5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802dd9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802ddc:	3c 2f                	cmp    al,0x2f
  802dde:	74 0a                	je     802dea <read_dev+0x64>
  802de0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802de4:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802de8:	73 e6                	jae    802dd0 <read_dev+0x4a>
    if(p>=name)
  802dea:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802dee:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802df2:	72 0c                	jb     802e00 <read_dev+0x7a>
        name=p+1;
  802df4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802df8:	48 83 c0 01          	add    rax,0x1
  802dfc:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(memcmp(name,"tty",3)==0){
  802e00:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802e04:	ba 03 00 00 00       	mov    edx,0x3
  802e09:	be bc 55 81 00       	mov    esi,0x8155bc
  802e0e:	48 89 c7             	mov    rdi,rax
  802e11:	e8 3e a1 00 00       	call   80cf54 <memcmp>
  802e16:	85 c0                	test   eax,eax
  802e18:	75 1a                	jne    802e34 <read_dev+0xae>
        return read_tty(filp,buf,count,position);
  802e1a:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802e1e:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802e22:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  802e26:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802e2a:	48 89 c7             	mov    rdi,rax
  802e2d:	e8 98 9b 00 00       	call   80c9ca <read_tty>
  802e32:	eb 36                	jmp    802e6a <read_dev+0xe4>
    }else if(strcmp(name,"console")==0){
  802e34:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802e38:	be b0 55 81 00       	mov    esi,0x8155b0
  802e3d:	48 89 c7             	mov    rdi,rax
  802e40:	e8 63 a3 00 00       	call   80d1a8 <strcmp>
  802e45:	85 c0                	test   eax,eax
  802e47:	75 1a                	jne    802e63 <read_dev+0xdd>
        return read_framebuffer(filp,buf,count,position);
  802e49:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802e4d:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802e51:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  802e55:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802e59:	48 89 c7             	mov    rdi,rax
  802e5c:	e8 6b 4e 00 00       	call   807ccc <read_framebuffer>
  802e61:	eb 07                	jmp    802e6a <read_dev+0xe4>
    }
    return -1;
  802e63:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff

}
  802e6a:	c9                   	leave  
  802e6b:	c3                   	ret    

0000000000802e6c <write_dev>:
long write_dev(struct file * filp,char * buf,unsigned long count,long * position){
  802e6c:	f3 0f 1e fa          	endbr64 
  802e70:	55                   	push   rbp
  802e71:	48 89 e5             	mov    rbp,rsp
  802e74:	48 83 ec 30          	sub    rsp,0x30
  802e78:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802e7c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  802e80:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  802e84:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
    //查看文件名
    char* name=filp->dentry->name;
  802e88:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802e8c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802e90:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802e93:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char* p=name+ strlen(name)-1;
  802e97:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802e9b:	48 89 c7             	mov    rdi,rax
  802e9e:	e8 84 a3 00 00       	call   80d227 <strlen>
  802ea3:	48 98                	cdqe   
  802ea5:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  802ea9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802ead:	48 01 d0             	add    rax,rdx
  802eb0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='/'&&p>=name;p--);
  802eb4:	eb 05                	jmp    802ebb <write_dev+0x4f>
  802eb6:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  802ebb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802ebf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802ec2:	3c 2f                	cmp    al,0x2f
  802ec4:	74 0a                	je     802ed0 <write_dev+0x64>
  802ec6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802eca:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802ece:	73 e6                	jae    802eb6 <write_dev+0x4a>
    if(p>=name)
  802ed0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802ed4:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802ed8:	72 0c                	jb     802ee6 <write_dev+0x7a>
        name=p+1;
  802eda:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802ede:	48 83 c0 01          	add    rax,0x1
  802ee2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(memcmp(name,"tty",3)==0){
  802ee6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802eea:	ba 03 00 00 00       	mov    edx,0x3
  802eef:	be bc 55 81 00       	mov    esi,0x8155bc
  802ef4:	48 89 c7             	mov    rdi,rax
  802ef7:	e8 58 a0 00 00       	call   80cf54 <memcmp>
  802efc:	85 c0                	test   eax,eax
  802efe:	75 1a                	jne    802f1a <write_dev+0xae>
        return write_tty(filp,buf,count,position);
  802f00:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802f04:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802f08:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  802f0c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802f10:	48 89 c7             	mov    rdi,rax
  802f13:	e8 5f 9b 00 00       	call   80ca77 <write_tty>
  802f18:	eb 36                	jmp    802f50 <write_dev+0xe4>
    }else if(strcmp(name,"console")==0){
  802f1a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802f1e:	be b0 55 81 00       	mov    esi,0x8155b0
  802f23:	48 89 c7             	mov    rdi,rax
  802f26:	e8 7d a2 00 00       	call   80d1a8 <strcmp>
  802f2b:	85 c0                	test   eax,eax
  802f2d:	75 1a                	jne    802f49 <write_dev+0xdd>
        return write_framebuffer(filp,buf,count,position);
  802f2f:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802f33:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802f37:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  802f3b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802f3f:	48 89 c7             	mov    rdi,rax
  802f42:	e8 a0 4d 00 00       	call   807ce7 <write_framebuffer>
  802f47:	eb 07                	jmp    802f50 <write_dev+0xe4>
    }
    return -1;
  802f49:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff

}
  802f50:	c9                   	leave  
  802f51:	c3                   	ret    

0000000000802f52 <ioctl_dev>:
long ioctl_dev(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg){
  802f52:	f3 0f 1e fa          	endbr64 
  802f56:	55                   	push   rbp
  802f57:	48 89 e5             	mov    rbp,rsp
  802f5a:	48 83 ec 30          	sub    rsp,0x30
  802f5e:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802f62:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  802f66:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  802f6a:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
    //查看文件名
    char* name=filp->dentry->name;
  802f6e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802f72:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  802f76:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802f79:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char* p=name+ strlen(name)-1;
  802f7d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802f81:	48 89 c7             	mov    rdi,rax
  802f84:	e8 9e a2 00 00       	call   80d227 <strlen>
  802f89:	48 98                	cdqe   
  802f8b:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  802f8f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802f93:	48 01 d0             	add    rax,rdx
  802f96:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='/'&&p>=name;p--);
  802f9a:	eb 05                	jmp    802fa1 <ioctl_dev+0x4f>
  802f9c:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  802fa1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802fa5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802fa8:	3c 2f                	cmp    al,0x2f
  802faa:	74 0a                	je     802fb6 <ioctl_dev+0x64>
  802fac:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802fb0:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802fb4:	73 e6                	jae    802f9c <ioctl_dev+0x4a>
    if(p>=name)
  802fb6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802fba:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
  802fbe:	72 0c                	jb     802fcc <ioctl_dev+0x7a>
        name=p+1;
  802fc0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802fc4:	48 83 c0 01          	add    rax,0x1
  802fc8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(memcmp(name,"tty",3)==0){
  802fcc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802fd0:	ba 03 00 00 00       	mov    edx,0x3
  802fd5:	be bc 55 81 00       	mov    esi,0x8155bc
  802fda:	48 89 c7             	mov    rdi,rax
  802fdd:	e8 72 9f 00 00       	call   80cf54 <memcmp>
  802fe2:	85 c0                	test   eax,eax
  802fe4:	75 1a                	jne    803000 <ioctl_dev+0xae>
        return ioctl_tty(inode, filp, cmd, arg);
  802fe6:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802fea:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802fee:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  802ff2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802ff6:	48 89 c7             	mov    rdi,rax
  802ff9:	e8 41 9b 00 00       	call   80cb3f <ioctl_tty>
  802ffe:	eb 36                	jmp    803036 <ioctl_dev+0xe4>
    }else if(strcmp(name,"console")==0){
  803000:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803004:	be b0 55 81 00       	mov    esi,0x8155b0
  803009:	48 89 c7             	mov    rdi,rax
  80300c:	e8 97 a1 00 00       	call   80d1a8 <strcmp>
  803011:	85 c0                	test   eax,eax
  803013:	75 1a                	jne    80302f <ioctl_dev+0xdd>
        return ioctl_framebuffer(inode,filp,cmd,arg);
  803015:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  803019:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80301d:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  803021:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803025:	48 89 c7             	mov    rdi,rax
  803028:	e8 89 4d 00 00       	call   807db6 <ioctl_framebuffer>
  80302d:	eb 07                	jmp    803036 <ioctl_dev+0xe4>
    }
    return -1;
  80302f:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff

}
  803036:	c9                   	leave  
  803037:	c3                   	ret    

0000000000803038 <load_driver>:
int load_driver(char *path)
{
  803038:	f3 0f 1e fa          	endbr64 
  80303c:	55                   	push   rbp
  80303d:	48 89 e5             	mov    rbp,rsp
  803040:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    
}
  803044:	90                   	nop
  803045:	5d                   	pop    rbp
  803046:	c3                   	ret    

0000000000803047 <reg_device>:

int reg_device(device* dev)
{
  803047:	f3 0f 1e fa          	endbr64 
  80304b:	55                   	push   rbp
  80304c:	48 89 e5             	mov    rbp,rsp
  80304f:	53                   	push   rbx
  803050:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //TODO:查重

    //放入数组
    int i=0;
  803054:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<MAX_DEVICES;i++)
  80305b:	e9 42 01 00 00       	jmp    8031a2 <reg_device+0x15b>
    {
        if(devs[i].flag==DEV_FLAG_EMPTY)
  803060:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803063:	48 63 d0             	movsxd rdx,eax
  803066:	48 89 d0             	mov    rax,rdx
  803069:	48 c1 e0 02          	shl    rax,0x2
  80306d:	48 01 d0             	add    rax,rdx
  803070:	48 c1 e0 02          	shl    rax,0x2
  803074:	48 01 d0             	add    rax,rdx
  803077:	48 c1 e0 03          	shl    rax,0x3
  80307b:	48 05 90 2e 40 00    	add    rax,0x402e90
  803081:	8b 00                	mov    eax,DWORD PTR [rax]
  803083:	85 c0                	test   eax,eax
  803085:	0f 85 13 01 00 00    	jne    80319e <reg_device+0x157>
        {
            devs[i]=*dev;
  80308b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80308e:	48 63 d0             	movsxd rdx,eax
  803091:	48 89 d0             	mov    rax,rdx
  803094:	48 c1 e0 02          	shl    rax,0x2
  803098:	48 01 d0             	add    rax,rdx
  80309b:	48 c1 e0 02          	shl    rax,0x2
  80309f:	48 01 d0             	add    rax,rdx
  8030a2:	48 c1 e0 03          	shl    rax,0x3
  8030a6:	48 8d 90 80 2e 40 00 	lea    rdx,[rax+0x402e80]
  8030ad:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8030b1:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8030b4:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  8030b8:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  8030bb:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  8030bf:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  8030c3:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  8030c7:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  8030cb:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  8030cf:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  8030d3:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  8030d7:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  8030db:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  8030df:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  8030e3:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  8030e7:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  8030eb:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  8030ef:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  8030f3:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  8030f7:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  8030fb:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  8030ff:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  803103:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  803107:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  80310b:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  80310f:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  803113:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  803117:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  80311b:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  80311f:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  803123:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  803127:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  80312b:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  80312f:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  803136:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  80313d:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  803144:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  80314b:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  803152:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  803159:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  803160:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  803167:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
  80316e:	48 89 82 a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rax
            devs[i].flag=DEV_FLAG_USED;
  803175:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803178:	48 63 d0             	movsxd rdx,eax
  80317b:	48 89 d0             	mov    rax,rdx
  80317e:	48 c1 e0 02          	shl    rax,0x2
  803182:	48 01 d0             	add    rax,rdx
  803185:	48 c1 e0 02          	shl    rax,0x2
  803189:	48 01 d0             	add    rax,rdx
  80318c:	48 c1 e0 03          	shl    rax,0x3
  803190:	48 05 90 2e 40 00    	add    rax,0x402e90
  803196:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            break;
  80319c:	eb 0e                	jmp    8031ac <reg_device+0x165>
    for(;i<MAX_DEVICES;i++)
  80319e:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8031a2:	83 7d f4 3f          	cmp    DWORD PTR [rbp-0xc],0x3f
  8031a6:	0f 8e b4 fe ff ff    	jle    803060 <reg_device+0x19>
        }
    }
    if(i==MAX_DEVICES)
  8031ac:	83 7d f4 40          	cmp    DWORD PTR [rbp-0xc],0x40
  8031b0:	75 0a                	jne    8031bc <reg_device+0x175>
        return -1;
  8031b2:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8031b7:	e9 6d 01 00 00       	jmp    803329 <reg_device+0x2e2>
    //添加到链表
    device* p=NULL,*neo=&devs[i],**pp;
  8031bc:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  8031c3:	00 
  8031c4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8031c7:	48 63 d0             	movsxd rdx,eax
  8031ca:	48 89 d0             	mov    rax,rdx
  8031cd:	48 c1 e0 02          	shl    rax,0x2
  8031d1:	48 01 d0             	add    rax,rdx
  8031d4:	48 c1 e0 02          	shl    rax,0x2
  8031d8:	48 01 d0             	add    rax,rdx
  8031db:	48 c1 e0 03          	shl    rax,0x3
  8031df:	48 05 80 2e 40 00    	add    rax,0x402e80
  8031e5:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    switch (dev->type)
  8031e9:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8031ed:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8031f0:	83 f8 03             	cmp    eax,0x3
  8031f3:	74 3b                	je     803230 <reg_device+0x1e9>
  8031f5:	83 f8 03             	cmp    eax,0x3
  8031f8:	7f 4b                	jg     803245 <reg_device+0x1fe>
  8031fa:	83 f8 01             	cmp    eax,0x1
  8031fd:	74 07                	je     803206 <reg_device+0x1bf>
  8031ff:	83 f8 02             	cmp    eax,0x2
  803202:	74 17                	je     80321b <reg_device+0x1d4>
  803204:	eb 3f                	jmp    803245 <reg_device+0x1fe>
    {
    case DEV_TYPE_BLKDEV:
        p=dev_tree[DEVTREE_BLKDEVI];pp=&dev_tree[DEVTREE_BLKDEVI];
  803206:	48 8b 05 73 52 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05273]        # 408480 <dev_tree>
  80320d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  803211:	48 c7 45 e0 80 84 40 	mov    QWORD PTR [rbp-0x20],0x408480
  803218:	00 
        break;
  803219:	eb 34                	jmp    80324f <reg_device+0x208>
    
    case DEV_TYPE_CHRDEV:
        p=dev_tree[DEVTREE_CHRDEVI];pp=&dev_tree[DEVTREE_CHRDEVI];
  80321b:	48 8b 05 66 52 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05266]        # 408488 <dev_tree+0x8>
  803222:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  803226:	48 c7 45 e0 88 84 40 	mov    QWORD PTR [rbp-0x20],0x408488
  80322d:	00 
        break;
  80322e:	eb 1f                	jmp    80324f <reg_device+0x208>
        
    case DEV_TYPE_OTHERS:
        p=dev_tree[DEVTREE_OTHERDEVI];pp=&dev_tree[DEVTREE_OTHERDEVI];
  803230:	48 8b 05 59 52 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05259]        # 408490 <dev_tree+0x10>
  803237:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  80323b:	48 c7 45 e0 90 84 40 	mov    QWORD PTR [rbp-0x20],0x408490
  803242:	00 
        break;
  803243:	eb 0a                	jmp    80324f <reg_device+0x208>
    default:return -1;//不可能有其他情况
  803245:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80324a:	e9 da 00 00 00       	jmp    803329 <reg_device+0x2e2>
    }
    if(!p){
  80324f:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  803254:	75 2b                	jne    803281 <reg_device+0x23a>
        *pp=neo;
  803256:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80325a:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80325e:	48 89 10             	mov    QWORD PTR [rax],rdx
        neo->prev=NULL;
  803261:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803265:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x0
  80326c:	00 00 00 00 
  803270:	eb 3d                	jmp    8032af <reg_device+0x268>
    }
    else{
        for(;p->next;p=p->next);
  803272:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803276:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  80327d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  803281:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803285:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  80328c:	48 85 c0             	test   rax,rax
  80328f:	75 e1                	jne    803272 <reg_device+0x22b>
        p->next=neo;
  803291:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803295:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  803299:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
        neo->prev=p;
  8032a0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8032a4:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8032a8:	48 89 90 98 00 00 00 	mov    QWORD PTR [rax+0x98],rdx
    }
    neo->next=NULL;
  8032af:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8032b3:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x0
  8032ba:	00 00 00 00 
    //设置相应的请求函数
    switch (neo->stype)
  8032be:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8032c2:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  8032c5:	83 f8 04             	cmp    eax,0x4
  8032c8:	74 3b                	je     803305 <reg_device+0x2be>
  8032ca:	83 f8 04             	cmp    eax,0x4
  8032cd:	7f 56                	jg     803325 <reg_device+0x2de>
  8032cf:	83 f8 03             	cmp    eax,0x3
  8032d2:	74 21                	je     8032f5 <reg_device+0x2ae>
  8032d4:	83 f8 03             	cmp    eax,0x3
  8032d7:	7f 4c                	jg     803325 <reg_device+0x2de>
  8032d9:	83 f8 01             	cmp    eax,0x1
  8032dc:	74 07                	je     8032e5 <reg_device+0x29e>
  8032de:	83 f8 02             	cmp    eax,0x2
  8032e1:	74 32                	je     803315 <reg_device+0x2ce>
        break;
    case DEV_STYPE_TTY:
        neo->operi=OPERATIONS_TTY;
        break;
    default:
        break;
  8032e3:	eb 40                	jmp    803325 <reg_device+0x2de>
        neo->operi=OPERATIONS_HD;
  8032e5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8032e9:	c7 80 a0 00 00 00 00 	mov    DWORD PTR [rax+0xa0],0x0
  8032f0:	00 00 00 
        break;
  8032f3:	eb 31                	jmp    803326 <reg_device+0x2df>
        neo->operi=OPERATIONS_MOUSE;
  8032f5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8032f9:	c7 80 a0 00 00 00 02 	mov    DWORD PTR [rax+0xa0],0x2
  803300:	00 00 00 
        break;
  803303:	eb 21                	jmp    803326 <reg_device+0x2df>
        neo->operi=OPERATIONS_KEYBOARD;
  803305:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803309:	c7 80 a0 00 00 00 03 	mov    DWORD PTR [rax+0xa0],0x3
  803310:	00 00 00 
        break;
  803313:	eb 11                	jmp    803326 <reg_device+0x2df>
        neo->operi=OPERATIONS_TTY;
  803315:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803319:	c7 80 a0 00 00 00 01 	mov    DWORD PTR [rax+0xa0],0x1
  803320:	00 00 00 
        break;
  803323:	eb 01                	jmp    803326 <reg_device+0x2df>
        break;
  803325:	90                   	nop
    }
    return i;
  803326:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  803329:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80332d:	c9                   	leave  
  80332e:	c3                   	ret    

000000000080332f <reg_driver>:


int reg_driver(driver *drv)
{
  80332f:	f3 0f 1e fa          	endbr64 
  803333:	55                   	push   rbp
  803334:	48 89 e5             	mov    rbp,rsp
  803337:	53                   	push   rbx
  803338:	48 89 7d e0          	mov    QWORD PTR [rbp-0x20],rdi
    for(int i=0;i<MAX_DRIVERS;i++)
  80333c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  803343:	e9 22 01 00 00       	jmp    80346a <reg_driver+0x13b>
    {
        if(drvs[i].flag==DRV_FLAG_EMPTY)
  803348:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80334b:	48 63 d0             	movsxd rdx,eax
  80334e:	48 89 d0             	mov    rax,rdx
  803351:	48 c1 e0 02          	shl    rax,0x2
  803355:	48 01 d0             	add    rax,rdx
  803358:	48 c1 e0 05          	shl    rax,0x5
  80335c:	48 05 80 58 40 00    	add    rax,0x405880
  803362:	8b 00                	mov    eax,DWORD PTR [rax]
  803364:	85 c0                	test   eax,eax
  803366:	0f 85 fa 00 00 00    	jne    803466 <reg_driver+0x137>
        {
            drvs[i]=*drv;
  80336c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80336f:	48 63 d0             	movsxd rdx,eax
  803372:	48 89 d0             	mov    rax,rdx
  803375:	48 c1 e0 02          	shl    rax,0x2
  803379:	48 01 d0             	add    rax,rdx
  80337c:	48 c1 e0 05          	shl    rax,0x5
  803380:	48 8d 90 80 58 40 00 	lea    rdx,[rax+0x405880]
  803387:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80338b:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80338e:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  803392:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  803395:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  803399:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  80339d:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  8033a1:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  8033a5:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  8033a9:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  8033ad:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  8033b1:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  8033b5:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  8033b9:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  8033bd:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  8033c1:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  8033c5:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  8033c9:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  8033cd:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  8033d1:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  8033d5:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  8033d9:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  8033dd:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  8033e1:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  8033e5:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  8033e9:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  8033ed:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  8033f1:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  8033f5:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  8033f9:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  8033fd:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  803401:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  803405:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  803409:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  803410:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  803417:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  80341e:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  803425:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  80342c:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  803433:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  80343a:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
            drvs[i].flag=DRV_FLAG_USED;
  803441:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803444:	48 63 d0             	movsxd rdx,eax
  803447:	48 89 d0             	mov    rax,rdx
  80344a:	48 c1 e0 02          	shl    rax,0x2
  80344e:	48 01 d0             	add    rax,rdx
  803451:	48 c1 e0 05          	shl    rax,0x5
  803455:	48 05 80 58 40 00    	add    rax,0x405880
  80345b:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            return i;
  803461:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803464:	eb 13                	jmp    803479 <reg_driver+0x14a>
    for(int i=0;i<MAX_DRIVERS;i++)
  803466:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80346a:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  80346e:	0f 8e d4 fe ff ff    	jle    803348 <reg_driver+0x19>
        }
    }
    return -1;
  803474:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  803479:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80347d:	c9                   	leave  
  80347e:	c3                   	ret    

000000000080347f <sys_find_dev>:

int sys_find_dev(char *name)
{
  80347f:	f3 0f 1e fa          	endbr64 
  803483:	55                   	push   rbp
  803484:	48 89 e5             	mov    rbp,rsp
  803487:	48 83 ec 20          	sub    rsp,0x20
  80348b:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_DEVICES;i++)
  80348f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803496:	eb 6c                	jmp    803504 <sys_find_dev+0x85>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  803498:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80349b:	48 63 d0             	movsxd rdx,eax
  80349e:	48 89 d0             	mov    rax,rdx
  8034a1:	48 c1 e0 02          	shl    rax,0x2
  8034a5:	48 01 d0             	add    rax,rdx
  8034a8:	48 c1 e0 02          	shl    rax,0x2
  8034ac:	48 01 d0             	add    rax,rdx
  8034af:	48 c1 e0 03          	shl    rax,0x3
  8034b3:	48 05 90 2e 40 00    	add    rax,0x402e90
  8034b9:	8b 00                	mov    eax,DWORD PTR [rax]
  8034bb:	85 c0                	test   eax,eax
  8034bd:	74 41                	je     803500 <sys_find_dev+0x81>
  8034bf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034c2:	48 63 d0             	movsxd rdx,eax
  8034c5:	48 89 d0             	mov    rax,rdx
  8034c8:	48 c1 e0 02          	shl    rax,0x2
  8034cc:	48 01 d0             	add    rax,rdx
  8034cf:	48 c1 e0 02          	shl    rax,0x2
  8034d3:	48 01 d0             	add    rax,rdx
  8034d6:	48 c1 e0 03          	shl    rax,0x3
  8034da:	48 83 c0 10          	add    rax,0x10
  8034de:	48 05 80 2e 40 00    	add    rax,0x402e80
  8034e4:	48 8d 50 04          	lea    rdx,[rax+0x4]
  8034e8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8034ec:	48 89 d6             	mov    rsi,rdx
  8034ef:	48 89 c7             	mov    rdi,rax
  8034f2:	e8 b1 9c 00 00       	call   80d1a8 <strcmp>
  8034f7:	85 c0                	test   eax,eax
  8034f9:	75 05                	jne    803500 <sys_find_dev+0x81>
            return i;
  8034fb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034fe:	eb 0f                	jmp    80350f <sys_find_dev+0x90>
    for(int i=0;i<MAX_DEVICES;i++)
  803500:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803504:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803508:	7e 8e                	jle    803498 <sys_find_dev+0x19>
    }
    return -1;
  80350a:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  80350f:	c9                   	leave  
  803510:	c3                   	ret    

0000000000803511 <sys_operate_dev>:

int sys_operate_dev(char *name,int func,driver_args* args)
{
  803511:	f3 0f 1e fa          	endbr64 
  803515:	55                   	push   rbp
  803516:	48 89 e5             	mov    rbp,rsp
  803519:	48 83 ec 30          	sub    rsp,0x30
  80351d:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  803521:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  803524:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    int i=0;
  803528:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;i<MAX_DEVICES;i++)
  80352f:	eb 67                	jmp    803598 <sys_operate_dev+0x87>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  803531:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803534:	48 63 d0             	movsxd rdx,eax
  803537:	48 89 d0             	mov    rax,rdx
  80353a:	48 c1 e0 02          	shl    rax,0x2
  80353e:	48 01 d0             	add    rax,rdx
  803541:	48 c1 e0 02          	shl    rax,0x2
  803545:	48 01 d0             	add    rax,rdx
  803548:	48 c1 e0 03          	shl    rax,0x3
  80354c:	48 05 90 2e 40 00    	add    rax,0x402e90
  803552:	8b 00                	mov    eax,DWORD PTR [rax]
  803554:	85 c0                	test   eax,eax
  803556:	74 3c                	je     803594 <sys_operate_dev+0x83>
  803558:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80355b:	48 63 d0             	movsxd rdx,eax
  80355e:	48 89 d0             	mov    rax,rdx
  803561:	48 c1 e0 02          	shl    rax,0x2
  803565:	48 01 d0             	add    rax,rdx
  803568:	48 c1 e0 02          	shl    rax,0x2
  80356c:	48 01 d0             	add    rax,rdx
  80356f:	48 c1 e0 03          	shl    rax,0x3
  803573:	48 83 c0 10          	add    rax,0x10
  803577:	48 05 80 2e 40 00    	add    rax,0x402e80
  80357d:	48 8d 50 04          	lea    rdx,[rax+0x4]
  803581:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803585:	48 89 d6             	mov    rsi,rdx
  803588:	48 89 c7             	mov    rdi,rax
  80358b:	e8 18 9c 00 00       	call   80d1a8 <strcmp>
  803590:	85 c0                	test   eax,eax
  803592:	74 0c                	je     8035a0 <sys_operate_dev+0x8f>
    for(;i<MAX_DEVICES;i++)
  803594:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803598:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  80359c:	7e 93                	jle    803531 <sys_operate_dev+0x20>
  80359e:	eb 01                	jmp    8035a1 <sys_operate_dev+0x90>
            break;
  8035a0:	90                   	nop
    }
    if(i==MAX_DEVICES)return -1;
  8035a1:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  8035a5:	75 0a                	jne    8035b1 <sys_operate_dev+0xa0>
  8035a7:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8035ac:	e9 9c 02 00 00       	jmp    80384d <sys_operate_dev+0x33c>
    switch (func) {
  8035b1:	83 7d e4 0b          	cmp    DWORD PTR [rbp-0x1c],0xb
  8035b5:	0f 87 8d 02 00 00    	ja     803848 <sys_operate_dev+0x337>
  8035bb:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8035be:	48 8b 04 c5 c0 55 81 	mov    rax,QWORD PTR [rax*8+0x8155c0]
  8035c5:	00 
  8035c6:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return devs[i].drv->open(args);
  8035c9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8035cc:	48 63 d0             	movsxd rdx,eax
  8035cf:	48 89 d0             	mov    rax,rdx
  8035d2:	48 c1 e0 02          	shl    rax,0x2
  8035d6:	48 01 d0             	add    rax,rdx
  8035d9:	48 c1 e0 02          	shl    rax,0x2
  8035dd:	48 01 d0             	add    rax,rdx
  8035e0:	48 c1 e0 03          	shl    rax,0x3
  8035e4:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8035ea:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8035ed:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  8035f1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8035f5:	48 89 c7             	mov    rdi,rax
  8035f8:	ff d2                	call   rdx
  8035fa:	e9 4e 02 00 00       	jmp    80384d <sys_operate_dev+0x33c>
        case DRVF_CLOSE:return devs[i].drv->close(args);
  8035ff:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803602:	48 63 d0             	movsxd rdx,eax
  803605:	48 89 d0             	mov    rax,rdx
  803608:	48 c1 e0 02          	shl    rax,0x2
  80360c:	48 01 d0             	add    rax,rdx
  80360f:	48 c1 e0 02          	shl    rax,0x2
  803613:	48 01 d0             	add    rax,rdx
  803616:	48 c1 e0 03          	shl    rax,0x3
  80361a:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803620:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803623:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  803627:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80362b:	48 89 c7             	mov    rdi,rax
  80362e:	ff d2                	call   rdx
  803630:	e9 18 02 00 00       	jmp    80384d <sys_operate_dev+0x33c>
        case DRVF_READ :return devs[i].drv->read(args);
  803635:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803638:	48 63 d0             	movsxd rdx,eax
  80363b:	48 89 d0             	mov    rax,rdx
  80363e:	48 c1 e0 02          	shl    rax,0x2
  803642:	48 01 d0             	add    rax,rdx
  803645:	48 c1 e0 02          	shl    rax,0x2
  803649:	48 01 d0             	add    rax,rdx
  80364c:	48 c1 e0 03          	shl    rax,0x3
  803650:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803656:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803659:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  80365d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803661:	48 89 c7             	mov    rdi,rax
  803664:	ff d2                	call   rdx
  803666:	e9 e2 01 00 00       	jmp    80384d <sys_operate_dev+0x33c>
        case DRVF_WRITE:return devs[i].drv->write(args);
  80366b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80366e:	48 63 d0             	movsxd rdx,eax
  803671:	48 89 d0             	mov    rax,rdx
  803674:	48 c1 e0 02          	shl    rax,0x2
  803678:	48 01 d0             	add    rax,rdx
  80367b:	48 c1 e0 02          	shl    rax,0x2
  80367f:	48 01 d0             	add    rax,rdx
  803682:	48 c1 e0 03          	shl    rax,0x3
  803686:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80368c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80368f:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  803693:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803697:	48 89 c7             	mov    rdi,rax
  80369a:	ff d2                	call   rdx
  80369c:	e9 ac 01 00 00       	jmp    80384d <sys_operate_dev+0x33c>
        case DRVF_CHK  :return devs[i].drv->check(args);
  8036a1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036a4:	48 63 d0             	movsxd rdx,eax
  8036a7:	48 89 d0             	mov    rax,rdx
  8036aa:	48 c1 e0 02          	shl    rax,0x2
  8036ae:	48 01 d0             	add    rax,rdx
  8036b1:	48 c1 e0 02          	shl    rax,0x2
  8036b5:	48 01 d0             	add    rax,rdx
  8036b8:	48 c1 e0 03          	shl    rax,0x3
  8036bc:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8036c2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8036c5:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  8036c9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8036cd:	48 89 c7             	mov    rdi,rax
  8036d0:	ff d2                	call   rdx
  8036d2:	e9 76 01 00 00       	jmp    80384d <sys_operate_dev+0x33c>
        case DRVF_RSVD :return devs[i].drv->reserved(args);
  8036d7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036da:	48 63 d0             	movsxd rdx,eax
  8036dd:	48 89 d0             	mov    rax,rdx
  8036e0:	48 c1 e0 02          	shl    rax,0x2
  8036e4:	48 01 d0             	add    rax,rdx
  8036e7:	48 c1 e0 02          	shl    rax,0x2
  8036eb:	48 01 d0             	add    rax,rdx
  8036ee:	48 c1 e0 03          	shl    rax,0x3
  8036f2:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8036f8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8036fb:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
  8036ff:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803703:	48 89 c7             	mov    rdi,rax
  803706:	ff d2                	call   rdx
  803708:	e9 40 01 00 00       	jmp    80384d <sys_operate_dev+0x33c>
        case DRVF_INT  :return devs[i].drv->inthandler(args);
  80370d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803710:	48 63 d0             	movsxd rdx,eax
  803713:	48 89 d0             	mov    rax,rdx
  803716:	48 c1 e0 02          	shl    rax,0x2
  80371a:	48 01 d0             	add    rax,rdx
  80371d:	48 c1 e0 02          	shl    rax,0x2
  803721:	48 01 d0             	add    rax,rdx
  803724:	48 c1 e0 03          	shl    rax,0x3
  803728:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80372e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803731:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
  803735:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803739:	48 89 c7             	mov    rdi,rax
  80373c:	ff d2                	call   rdx
  80373e:	e9 0a 01 00 00       	jmp    80384d <sys_operate_dev+0x33c>
        case DRVF_FIND :return devs[i].drv->find(args);
  803743:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803746:	48 63 d0             	movsxd rdx,eax
  803749:	48 89 d0             	mov    rax,rdx
  80374c:	48 c1 e0 02          	shl    rax,0x2
  803750:	48 01 d0             	add    rax,rdx
  803753:	48 c1 e0 02          	shl    rax,0x2
  803757:	48 01 d0             	add    rax,rdx
  80375a:	48 c1 e0 03          	shl    rax,0x3
  80375e:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803764:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803767:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  80376b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80376f:	48 89 c7             	mov    rdi,rax
  803772:	ff d2                	call   rdx
  803774:	e9 d4 00 00 00       	jmp    80384d <sys_operate_dev+0x33c>
        case DRVF_RM   :return devs[i].drv->rm(args);
  803779:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80377c:	48 63 d0             	movsxd rdx,eax
  80377f:	48 89 d0             	mov    rax,rdx
  803782:	48 c1 e0 02          	shl    rax,0x2
  803786:	48 01 d0             	add    rax,rdx
  803789:	48 c1 e0 02          	shl    rax,0x2
  80378d:	48 01 d0             	add    rax,rdx
  803790:	48 c1 e0 03          	shl    rax,0x3
  803794:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80379a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80379d:	48 8b 50 48          	mov    rdx,QWORD PTR [rax+0x48]
  8037a1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8037a5:	48 89 c7             	mov    rdi,rax
  8037a8:	ff d2                	call   rdx
  8037aa:	e9 9e 00 00 00       	jmp    80384d <sys_operate_dev+0x33c>
        case DRVF_TOUCH:return devs[i].drv->touch(args);
  8037af:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8037b2:	48 63 d0             	movsxd rdx,eax
  8037b5:	48 89 d0             	mov    rax,rdx
  8037b8:	48 c1 e0 02          	shl    rax,0x2
  8037bc:	48 01 d0             	add    rax,rdx
  8037bf:	48 c1 e0 02          	shl    rax,0x2
  8037c3:	48 01 d0             	add    rax,rdx
  8037c6:	48 c1 e0 03          	shl    rax,0x3
  8037ca:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8037d0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8037d3:	48 8b 50 50          	mov    rdx,QWORD PTR [rax+0x50]
  8037d7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8037db:	48 89 c7             	mov    rdi,rax
  8037de:	ff d2                	call   rdx
  8037e0:	eb 6b                	jmp    80384d <sys_operate_dev+0x33c>
        case DRVF_MKDIR:return devs[i].drv->mkdir(args);
  8037e2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8037e5:	48 63 d0             	movsxd rdx,eax
  8037e8:	48 89 d0             	mov    rax,rdx
  8037eb:	48 c1 e0 02          	shl    rax,0x2
  8037ef:	48 01 d0             	add    rax,rdx
  8037f2:	48 c1 e0 02          	shl    rax,0x2
  8037f6:	48 01 d0             	add    rax,rdx
  8037f9:	48 c1 e0 03          	shl    rax,0x3
  8037fd:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803803:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803806:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  80380a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80380e:	48 89 c7             	mov    rdi,rax
  803811:	ff d2                	call   rdx
  803813:	eb 38                	jmp    80384d <sys_operate_dev+0x33c>
        case DRVF_LS:return    devs[i].drv->ls(args);
  803815:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803818:	48 63 d0             	movsxd rdx,eax
  80381b:	48 89 d0             	mov    rax,rdx
  80381e:	48 c1 e0 02          	shl    rax,0x2
  803822:	48 01 d0             	add    rax,rdx
  803825:	48 c1 e0 02          	shl    rax,0x2
  803829:	48 01 d0             	add    rax,rdx
  80382c:	48 c1 e0 03          	shl    rax,0x3
  803830:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803836:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803839:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
  80383d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803841:	48 89 c7             	mov    rdi,rax
  803844:	ff d2                	call   rdx
  803846:	eb 05                	jmp    80384d <sys_operate_dev+0x33c>
    }
    return -1;
  803848:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  80384d:	c9                   	leave  
  80384e:	c3                   	ret    

000000000080384f <call_drv_func>:
int call_drv_func(int drv_n,int func_n,driver_args *args)
{
  80384f:	f3 0f 1e fa          	endbr64 
  803853:	55                   	push   rbp
  803854:	48 89 e5             	mov    rbp,rsp
  803857:	48 83 ec 10          	sub    rsp,0x10
  80385b:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  80385e:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  803861:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    if(drvs[drv_n].flag==DRV_FLAG_EMPTY)return -1;
  803865:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803868:	48 63 d0             	movsxd rdx,eax
  80386b:	48 89 d0             	mov    rax,rdx
  80386e:	48 c1 e0 02          	shl    rax,0x2
  803872:	48 01 d0             	add    rax,rdx
  803875:	48 c1 e0 05          	shl    rax,0x5
  803879:	48 05 80 58 40 00    	add    rax,0x405880
  80387f:	8b 00                	mov    eax,DWORD PTR [rax]
  803881:	85 c0                	test   eax,eax
  803883:	75 0a                	jne    80388f <call_drv_func+0x40>
  803885:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80388a:	e9 15 02 00 00       	jmp    803aa4 <call_drv_func+0x255>
    /*driverfunc f=drvs[drv_n].func_thunk[func_n];
    return f(args);*/
    switch (func_n) {
  80388f:	83 7d f8 0b          	cmp    DWORD PTR [rbp-0x8],0xb
  803893:	0f 87 06 02 00 00    	ja     803a9f <call_drv_func+0x250>
  803899:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80389c:	48 8b 04 c5 20 56 81 	mov    rax,QWORD PTR [rax*8+0x815620]
  8038a3:	00 
  8038a4:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return drvs[drv_n].open(args);
  8038a7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8038aa:	48 63 d0             	movsxd rdx,eax
  8038ad:	48 89 d0             	mov    rax,rdx
  8038b0:	48 c1 e0 02          	shl    rax,0x2
  8038b4:	48 01 d0             	add    rax,rdx
  8038b7:	48 c1 e0 05          	shl    rax,0x5
  8038bb:	48 05 88 58 40 00    	add    rax,0x405888
  8038c1:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8038c4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038c8:	48 89 c7             	mov    rdi,rax
  8038cb:	ff d2                	call   rdx
  8038cd:	e9 d2 01 00 00       	jmp    803aa4 <call_drv_func+0x255>
        case DRVF_CLOSE:return drvs[drv_n].close(args);
  8038d2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8038d5:	48 63 d0             	movsxd rdx,eax
  8038d8:	48 89 d0             	mov    rax,rdx
  8038db:	48 c1 e0 02          	shl    rax,0x2
  8038df:	48 01 d0             	add    rax,rdx
  8038e2:	48 c1 e0 05          	shl    rax,0x5
  8038e6:	48 05 90 58 40 00    	add    rax,0x405890
  8038ec:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8038ef:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038f3:	48 89 c7             	mov    rdi,rax
  8038f6:	ff d2                	call   rdx
  8038f8:	e9 a7 01 00 00       	jmp    803aa4 <call_drv_func+0x255>
        case DRVF_READ :return drvs[drv_n].read(args);
  8038fd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803900:	48 63 d0             	movsxd rdx,eax
  803903:	48 89 d0             	mov    rax,rdx
  803906:	48 c1 e0 02          	shl    rax,0x2
  80390a:	48 01 d0             	add    rax,rdx
  80390d:	48 c1 e0 05          	shl    rax,0x5
  803911:	48 05 98 58 40 00    	add    rax,0x405898
  803917:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80391a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80391e:	48 89 c7             	mov    rdi,rax
  803921:	ff d2                	call   rdx
  803923:	e9 7c 01 00 00       	jmp    803aa4 <call_drv_func+0x255>
        case DRVF_WRITE:return drvs[drv_n].write(args);
  803928:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80392b:	48 63 d0             	movsxd rdx,eax
  80392e:	48 89 d0             	mov    rax,rdx
  803931:	48 c1 e0 02          	shl    rax,0x2
  803935:	48 01 d0             	add    rax,rdx
  803938:	48 c1 e0 05          	shl    rax,0x5
  80393c:	48 05 a0 58 40 00    	add    rax,0x4058a0
  803942:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803945:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803949:	48 89 c7             	mov    rdi,rax
  80394c:	ff d2                	call   rdx
  80394e:	e9 51 01 00 00       	jmp    803aa4 <call_drv_func+0x255>
        case DRVF_CHK  :return drvs[drv_n].check(args);
  803953:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803956:	48 63 d0             	movsxd rdx,eax
  803959:	48 89 d0             	mov    rax,rdx
  80395c:	48 c1 e0 02          	shl    rax,0x2
  803960:	48 01 d0             	add    rax,rdx
  803963:	48 c1 e0 05          	shl    rax,0x5
  803967:	48 05 a8 58 40 00    	add    rax,0x4058a8
  80396d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803970:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803974:	48 89 c7             	mov    rdi,rax
  803977:	ff d2                	call   rdx
  803979:	e9 26 01 00 00       	jmp    803aa4 <call_drv_func+0x255>
        case DRVF_RSVD :return drvs[drv_n].reserved(args);
  80397e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803981:	48 63 d0             	movsxd rdx,eax
  803984:	48 89 d0             	mov    rax,rdx
  803987:	48 c1 e0 02          	shl    rax,0x2
  80398b:	48 01 d0             	add    rax,rdx
  80398e:	48 c1 e0 05          	shl    rax,0x5
  803992:	48 05 b0 58 40 00    	add    rax,0x4058b0
  803998:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80399b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80399f:	48 89 c7             	mov    rdi,rax
  8039a2:	ff d2                	call   rdx
  8039a4:	e9 fb 00 00 00       	jmp    803aa4 <call_drv_func+0x255>
        case DRVF_INT  :return drvs[drv_n].inthandler(args);
  8039a9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039ac:	48 63 d0             	movsxd rdx,eax
  8039af:	48 89 d0             	mov    rax,rdx
  8039b2:	48 c1 e0 02          	shl    rax,0x2
  8039b6:	48 01 d0             	add    rax,rdx
  8039b9:	48 c1 e0 05          	shl    rax,0x5
  8039bd:	48 05 b8 58 40 00    	add    rax,0x4058b8
  8039c3:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8039c6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8039ca:	48 89 c7             	mov    rdi,rax
  8039cd:	ff d2                	call   rdx
  8039cf:	e9 d0 00 00 00       	jmp    803aa4 <call_drv_func+0x255>
        case DRVF_FIND :return drvs[drv_n].find(args);
  8039d4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039d7:	48 63 d0             	movsxd rdx,eax
  8039da:	48 89 d0             	mov    rax,rdx
  8039dd:	48 c1 e0 02          	shl    rax,0x2
  8039e1:	48 01 d0             	add    rax,rdx
  8039e4:	48 c1 e0 05          	shl    rax,0x5
  8039e8:	48 05 c0 58 40 00    	add    rax,0x4058c0
  8039ee:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8039f1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8039f5:	48 89 c7             	mov    rdi,rax
  8039f8:	ff d2                	call   rdx
  8039fa:	e9 a5 00 00 00       	jmp    803aa4 <call_drv_func+0x255>
        case DRVF_RM   :return drvs[drv_n].rm(args);
  8039ff:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a02:	48 63 d0             	movsxd rdx,eax
  803a05:	48 89 d0             	mov    rax,rdx
  803a08:	48 c1 e0 02          	shl    rax,0x2
  803a0c:	48 01 d0             	add    rax,rdx
  803a0f:	48 c1 e0 05          	shl    rax,0x5
  803a13:	48 05 c8 58 40 00    	add    rax,0x4058c8
  803a19:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803a1c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803a20:	48 89 c7             	mov    rdi,rax
  803a23:	ff d2                	call   rdx
  803a25:	eb 7d                	jmp    803aa4 <call_drv_func+0x255>
        case DRVF_TOUCH:return drvs[drv_n].touch(args);
  803a27:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a2a:	48 63 d0             	movsxd rdx,eax
  803a2d:	48 89 d0             	mov    rax,rdx
  803a30:	48 c1 e0 02          	shl    rax,0x2
  803a34:	48 01 d0             	add    rax,rdx
  803a37:	48 c1 e0 05          	shl    rax,0x5
  803a3b:	48 05 d0 58 40 00    	add    rax,0x4058d0
  803a41:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803a44:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803a48:	48 89 c7             	mov    rdi,rax
  803a4b:	ff d2                	call   rdx
  803a4d:	eb 55                	jmp    803aa4 <call_drv_func+0x255>
        case DRVF_MKDIR:return drvs[drv_n].mkdir(args);
  803a4f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a52:	48 63 d0             	movsxd rdx,eax
  803a55:	48 89 d0             	mov    rax,rdx
  803a58:	48 c1 e0 02          	shl    rax,0x2
  803a5c:	48 01 d0             	add    rax,rdx
  803a5f:	48 c1 e0 05          	shl    rax,0x5
  803a63:	48 05 d8 58 40 00    	add    rax,0x4058d8
  803a69:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803a6c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803a70:	48 89 c7             	mov    rdi,rax
  803a73:	ff d2                	call   rdx
  803a75:	eb 2d                	jmp    803aa4 <call_drv_func+0x255>
        case DRVF_LS:return drvs[drv_n].ls(args);
  803a77:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a7a:	48 63 d0             	movsxd rdx,eax
  803a7d:	48 89 d0             	mov    rax,rdx
  803a80:	48 c1 e0 02          	shl    rax,0x2
  803a84:	48 01 d0             	add    rax,rdx
  803a87:	48 c1 e0 05          	shl    rax,0x5
  803a8b:	48 05 e0 58 40 00    	add    rax,0x4058e0
  803a91:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803a94:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803a98:	48 89 c7             	mov    rdi,rax
  803a9b:	ff d2                	call   rdx
  803a9d:	eb 05                	jmp    803aa4 <call_drv_func+0x255>
    }
    return -1;
  803a9f:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  803aa4:	c9                   	leave  
  803aa5:	c3                   	ret    

0000000000803aa6 <dispose_device>:
int dispose_device(int dev){
  803aa6:	f3 0f 1e fa          	endbr64 
  803aaa:	55                   	push   rbp
  803aab:	48 89 e5             	mov    rbp,rsp
  803aae:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(devs[dev].flag!=DEV_FLAG_USED)return -1;
  803ab1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803ab4:	48 63 d0             	movsxd rdx,eax
  803ab7:	48 89 d0             	mov    rax,rdx
  803aba:	48 c1 e0 02          	shl    rax,0x2
  803abe:	48 01 d0             	add    rax,rdx
  803ac1:	48 c1 e0 02          	shl    rax,0x2
  803ac5:	48 01 d0             	add    rax,rdx
  803ac8:	48 c1 e0 03          	shl    rax,0x3
  803acc:	48 05 90 2e 40 00    	add    rax,0x402e90
  803ad2:	8b 00                	mov    eax,DWORD PTR [rax]
  803ad4:	83 f8 01             	cmp    eax,0x1
  803ad7:	74 07                	je     803ae0 <dispose_device+0x3a>
  803ad9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803ade:	eb 62                	jmp    803b42 <dispose_device+0x9c>
    device* p=&devs[dev];
  803ae0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803ae3:	48 63 d0             	movsxd rdx,eax
  803ae6:	48 89 d0             	mov    rax,rdx
  803ae9:	48 c1 e0 02          	shl    rax,0x2
  803aed:	48 01 d0             	add    rax,rdx
  803af0:	48 c1 e0 02          	shl    rax,0x2
  803af4:	48 01 d0             	add    rax,rdx
  803af7:	48 c1 e0 03          	shl    rax,0x3
  803afb:	48 05 80 2e 40 00    	add    rax,0x402e80
  803b01:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //从链表删除
    if(p->prev)p->prev->next=p->next;
  803b05:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b09:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  803b10:	48 85 c0             	test   rax,rax
  803b13:	74 1d                	je     803b32 <dispose_device+0x8c>
  803b15:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b19:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  803b20:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  803b24:	48 8b 92 90 00 00 00 	mov    rdx,QWORD PTR [rdx+0x90]
  803b2b:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
    p->flag=DEV_FLAG_EMPTY;
  803b32:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b36:	c7 40 10 00 00 00 00 	mov    DWORD PTR [rax+0x10],0x0
    return 0;
  803b3d:	b8 00 00 00 00       	mov    eax,0x0
}
  803b42:	5d                   	pop    rbp
  803b43:	c3                   	ret    

0000000000803b44 <dispose_driver>:
int dispose_driver(driver *drv){
  803b44:	f3 0f 1e fa          	endbr64 
  803b48:	55                   	push   rbp
  803b49:	48 89 e5             	mov    rbp,rsp
  803b4c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  803b50:	90                   	nop
  803b51:	5d                   	pop    rbp
  803b52:	c3                   	ret    

0000000000803b53 <get_dev>:

device *get_dev(int devi)
{
  803b53:	f3 0f 1e fa          	endbr64 
  803b57:	55                   	push   rbp
  803b58:	48 89 e5             	mov    rbp,rsp
  803b5b:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &devs[devi];
  803b5e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803b61:	48 63 d0             	movsxd rdx,eax
  803b64:	48 89 d0             	mov    rax,rdx
  803b67:	48 c1 e0 02          	shl    rax,0x2
  803b6b:	48 01 d0             	add    rax,rdx
  803b6e:	48 c1 e0 02          	shl    rax,0x2
  803b72:	48 01 d0             	add    rax,rdx
  803b75:	48 c1 e0 03          	shl    rax,0x3
  803b79:	48 05 80 2e 40 00    	add    rax,0x402e80
}
  803b7f:	5d                   	pop    rbp
  803b80:	c3                   	ret    

0000000000803b81 <get_drv>:
driver *get_drv(int drvi)
{
  803b81:	f3 0f 1e fa          	endbr64 
  803b85:	55                   	push   rbp
  803b86:	48 89 e5             	mov    rbp,rsp
  803b89:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &drvs[drvi];
  803b8c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803b8f:	48 63 d0             	movsxd rdx,eax
  803b92:	48 89 d0             	mov    rax,rdx
  803b95:	48 c1 e0 02          	shl    rax,0x2
  803b99:	48 01 d0             	add    rax,rdx
  803b9c:	48 c1 e0 05          	shl    rax,0x5
  803ba0:	48 05 80 58 40 00    	add    rax,0x405880
}
  803ba6:	5d                   	pop    rbp
  803ba7:	c3                   	ret    

0000000000803ba8 <make_request>:

//发送一个操作设备的申请
int make_request(driver_args* args)
{
  803ba8:	f3 0f 1e fa          	endbr64 
  803bac:	55                   	push   rbp
  803bad:	48 89 e5             	mov    rbp,rsp
  803bb0:	53                   	push   rbx
  803bb1:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //在数组中寻找空项
    int i=0;
  803bb5:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<NR_REQS;i++)
  803bbc:	eb 23                	jmp    803be1 <make_request+0x39>
    {
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  803bbe:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803bc1:	48 63 d0             	movsxd rdx,eax
  803bc4:	48 89 d0             	mov    rax,rdx
  803bc7:	48 01 c0             	add    rax,rax
  803bca:	48 01 d0             	add    rax,rdx
  803bcd:	48 c1 e0 06          	shl    rax,0x6
  803bd1:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803bd7:	8b 00                	mov    eax,DWORD PTR [rax]
  803bd9:	85 c0                	test   eax,eax
  803bdb:	74 0c                	je     803be9 <make_request+0x41>
    for(;i<NR_REQS;i++)
  803bdd:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  803be1:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  803be5:	7e d7                	jle    803bbe <make_request+0x16>
  803be7:	eb 01                	jmp    803bea <make_request+0x42>
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  803be9:	90                   	nop
    }
    if(i==NR_REQS)return -1;//满了
  803bea:	83 7d f4 20          	cmp    DWORD PTR [rbp-0xc],0x20
  803bee:	75 0a                	jne    803bfa <make_request+0x52>
  803bf0:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803bf5:	e9 e7 01 00 00       	jmp    803de1 <make_request+0x239>
    reqs[i]=*args;//放入数组
  803bfa:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803bfd:	48 63 d0             	movsxd rdx,eax
  803c00:	48 89 d0             	mov    rax,rdx
  803c03:	48 01 c0             	add    rax,rax
  803c06:	48 01 d0             	add    rax,rdx
  803c09:	48 c1 e0 06          	shl    rax,0x6
  803c0d:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803c14:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803c18:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  803c1b:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  803c1f:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  803c22:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  803c26:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  803c2a:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  803c2e:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  803c32:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  803c36:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  803c3a:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  803c3e:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  803c42:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  803c46:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  803c4a:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  803c4e:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  803c52:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  803c56:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  803c5a:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  803c5e:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  803c62:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  803c66:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  803c6a:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  803c6e:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  803c72:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  803c76:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  803c7a:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  803c7e:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  803c82:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  803c86:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  803c8a:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  803c8e:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  803c92:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  803c96:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  803c9d:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  803ca4:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  803cab:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  803cb2:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  803cb9:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  803cc0:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  803cc7:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  803cce:	48 8b 88 a0 00 00 00 	mov    rcx,QWORD PTR [rax+0xa0]
  803cd5:	48 8b 98 a8 00 00 00 	mov    rbx,QWORD PTR [rax+0xa8]
  803cdc:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  803ce3:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  803cea:	48 8b 88 b0 00 00 00 	mov    rcx,QWORD PTR [rax+0xb0]
  803cf1:	48 8b 98 b8 00 00 00 	mov    rbx,QWORD PTR [rax+0xb8]
  803cf8:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  803cff:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
    //插入具体设备的等待链表中
    device* dev=&devs[args->dev];
  803d06:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803d0a:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  803d10:	48 63 d0             	movsxd rdx,eax
  803d13:	48 89 d0             	mov    rax,rdx
  803d16:	48 c1 e0 02          	shl    rax,0x2
  803d1a:	48 01 d0             	add    rax,rdx
  803d1d:	48 c1 e0 02          	shl    rax,0x2
  803d21:	48 01 d0             	add    rax,rdx
  803d24:	48 c1 e0 03          	shl    rax,0x3
  803d28:	48 05 80 2e 40 00    	add    rax,0x402e80
  803d2e:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!dev->waiting_reqs)//空的等待队列
  803d32:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803d36:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803d3d:	48 85 c0             	test   rax,rax
  803d40:	75 27                	jne    803d69 <make_request+0x1c1>
        dev->waiting_reqs=&reqs[i];
  803d42:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803d45:	48 63 d0             	movsxd rdx,eax
  803d48:	48 89 d0             	mov    rax,rdx
  803d4b:	48 01 c0             	add    rax,rax
  803d4e:	48 01 d0             	add    rax,rdx
  803d51:	48 c1 e0 06          	shl    rax,0x6
  803d55:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803d5c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803d60:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
  803d67:	eb 75                	jmp    803dde <make_request+0x236>
    else{
        driver_args* p=dev->waiting_reqs;
  803d69:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803d6d:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803d74:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        for(;p->next;p=p->next);
  803d78:	eb 0f                	jmp    803d89 <make_request+0x1e1>
  803d7a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803d7e:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  803d85:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  803d89:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803d8d:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  803d94:	48 85 c0             	test   rax,rax
  803d97:	75 e1                	jne    803d7a <make_request+0x1d2>
        p->next=&reqs[i];
  803d99:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803d9c:	48 63 d0             	movsxd rdx,eax
  803d9f:	48 89 d0             	mov    rax,rdx
  803da2:	48 01 c0             	add    rax,rax
  803da5:	48 01 d0             	add    rax,rdx
  803da8:	48 c1 e0 06          	shl    rax,0x6
  803dac:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803db3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803db7:	48 89 90 b8 00 00 00 	mov    QWORD PTR [rax+0xb8],rdx
        reqs[i].next=NULL;
  803dbe:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803dc1:	48 63 d0             	movsxd rdx,eax
  803dc4:	48 89 d0             	mov    rax,rdx
  803dc7:	48 01 c0             	add    rax,rax
  803dca:	48 01 d0             	add    rax,rdx
  803dcd:	48 c1 e0 06          	shl    rax,0x6
  803dd1:	48 05 38 6d 40 00    	add    rax,0x406d38
  803dd7:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }

    return i;
  803dde:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  803de1:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  803de5:	c9                   	leave  
  803de6:	c3                   	ret    

0000000000803de7 <do_req>:
//取出一个申请并且执行
int do_req()
{
  803de7:	f3 0f 1e fa          	endbr64 
  803deb:	55                   	push   rbp
  803dec:	48 89 e5             	mov    rbp,rsp
  803def:	48 83 ec 10          	sub    rsp,0x10
    //查看每个设备的请求情况
    //块设备
    for(int i=0;i<3;i++)
  803df3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803dfa:	e9 ab 00 00 00       	jmp    803eaa <do_req+0xc3>
    {
        device* p=dev_tree[i];
  803dff:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803e02:	48 98                	cdqe   
  803e04:	48 8b 04 c5 80 84 40 	mov    rax,QWORD PTR [rax*8+0x408480]
  803e0b:	00 
  803e0c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(;p;p=p->next)
  803e10:	e9 86 00 00 00       	jmp    803e9b <do_req+0xb4>
        {
            //如果没有请求运行而且有请求要运行
            if(!p->running_req&&p->waiting_reqs)
  803e15:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803e19:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  803e20:	48 85 c0             	test   rax,rax
  803e23:	75 67                	jne    803e8c <do_req+0xa5>
  803e25:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803e29:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803e30:	48 85 c0             	test   rax,rax
  803e33:	74 57                	je     803e8c <do_req+0xa5>
            {
                p->running_req=p->waiting_reqs;
  803e35:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803e39:	48 8b 90 88 00 00 00 	mov    rdx,QWORD PTR [rax+0x88]
  803e40:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803e44:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
                p->waiting_reqs=p->waiting_reqs->next;//取出一个
  803e4b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803e4f:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803e56:	48 8b 90 b8 00 00 00 	mov    rdx,QWORD PTR [rax+0xb8]
  803e5d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803e61:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
                dev_funcs[p->operi](p->running_req);
  803e68:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803e6c:	8b 80 a0 00 00 00    	mov    eax,DWORD PTR [rax+0xa0]
  803e72:	48 98                	cdqe   
  803e74:	48 8b 14 c5 20 d9 80 	mov    rdx,QWORD PTR [rax*8+0x80d920]
  803e7b:	00 
  803e7c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803e80:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  803e87:	48 89 c7             	mov    rdi,rax
  803e8a:	ff d2                	call   rdx
        for(;p;p=p->next)
  803e8c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803e90:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  803e97:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  803e9b:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  803ea0:	0f 85 6f ff ff ff    	jne    803e15 <do_req+0x2e>
    for(int i=0;i<3;i++)
  803ea6:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803eaa:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  803eae:	0f 8e 4b ff ff ff    	jle    803dff <do_req+0x18>
            }
            //如果还在运行（DONE的状态不能直接覆盖，因为里面的运行结果可能还没被拿走）
        }
    }
    
    return 0;
  803eb4:	b8 00 00 00 00       	mov    eax,0x0
}
  803eb9:	c9                   	leave  
  803eba:	c3                   	ret    

0000000000803ebb <wait_on_req>:


void wait_on_req(int reqi)
{
  803ebb:	f3 0f 1e fa          	endbr64 
  803ebf:	55                   	push   rbp
  803ec0:	48 89 e5             	mov    rbp,rsp
  803ec3:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(reqs[reqi].stat!=REQ_STAT_DONE);
  803ec6:	90                   	nop
  803ec7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803eca:	48 63 d0             	movsxd rdx,eax
  803ecd:	48 89 d0             	mov    rax,rdx
  803ed0:	48 01 c0             	add    rax,rax
  803ed3:	48 01 d0             	add    rax,rdx
  803ed6:	48 c1 e0 06          	shl    rax,0x6
  803eda:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803ee0:	8b 00                	mov    eax,DWORD PTR [rax]
  803ee2:	83 f8 03             	cmp    eax,0x3
  803ee5:	75 e0                	jne    803ec7 <wait_on_req+0xc>
}
  803ee7:	90                   	nop
  803ee8:	90                   	nop
  803ee9:	5d                   	pop    rbp
  803eea:	c3                   	ret    

0000000000803eeb <clear_req>:
void clear_req(int reqi)
{
  803eeb:	f3 0f 1e fa          	endbr64 
  803eef:	55                   	push   rbp
  803ef0:	48 89 e5             	mov    rbp,rsp
  803ef3:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    reqs[reqi].stat=REQ_STAT_EMPTY;
  803ef6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803ef9:	48 63 d0             	movsxd rdx,eax
  803efc:	48 89 d0             	mov    rax,rdx
  803eff:	48 01 c0             	add    rax,rax
  803f02:	48 01 d0             	add    rax,rdx
  803f05:	48 c1 e0 06          	shl    rax,0x6
  803f09:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803f0f:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  803f15:	90                   	nop
  803f16:	5d                   	pop    rbp
  803f17:	c3                   	ret    

0000000000803f18 <init_proc>:
TSS *tss=0x108000;
int cur_proc=0;
int pidd=0;
int palloc_paddr=0;
static pid_t sidd=0;
void init_proc(){
  803f18:	f3 0f 1e fa          	endbr64 
  803f1c:	55                   	push   rbp
  803f1d:	48 89 e5             	mov    rbp,rsp
  803f20:	48 83 ec 10          	sub    rsp,0x10
    //task=(struct process*)get_global_var(TASK_PCBS_ADDR);//[MAX_TASKS];;
    for(int i=0;i<MAX_PROC_COUNT;i++){
  803f24:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803f2b:	eb 4c                	jmp    803f79 <init_proc+0x61>
        task[i].pid=-1;
  803f2d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803f30:	48 98                	cdqe   
  803f32:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  803f39:	48 05 40 85 40 00    	add    rax,0x408540
  803f3f:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
        task[i].stat=TASK_EMPTY;
  803f45:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803f48:	48 98                	cdqe   
  803f4a:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  803f51:	48 05 58 85 40 00    	add    rax,0x408558
  803f57:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        task[i].parent_pid=-1;
  803f5d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803f60:	48 98                	cdqe   
  803f62:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  803f69:	48 05 dc 85 40 00    	add    rax,0x4085dc
  803f6f:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<MAX_PROC_COUNT;i++){
  803f75:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803f79:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803f7d:	7e ae                	jle    803f2d <init_proc+0x15>
    }
    cur_proc=0;//proc zero
  803f7f:	c7 05 43 13 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc11343],0x0        # 4152cc <cur_proc>
  803f86:	00 00 00 
    current=task;
  803f89:	48 c7 05 ac 12 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc112ac],0x408540        # 415240 <current>
  803f90:	40 85 40 00 
    pidd=1;
  803f94:	c7 05 32 13 c1 ff 01 	mov    DWORD PTR [rip+0xffffffffffc11332],0x1        # 4152d0 <pidd>
  803f9b:	00 00 00 
     //===============创建0号进程======================
    int zi=create_proc();
  803f9e:	b8 00 00 00 00       	mov    eax,0x0
  803fa3:	e8 d2 02 00 00       	call   80427a <create_proc>
  803fa8:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    task[zi].stat=TASK_READY;
  803fab:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803fae:	48 98                	cdqe   
  803fb0:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  803fb7:	48 05 58 85 40 00    	add    rax,0x408558
  803fbd:	c7 00 02 00 00 00    	mov    DWORD PTR [rax],0x2


    //asm volatile("lldt %0"::"m"(xi));
    //asm volatile("ltr %0"::"m"(zi));
    set_tss(0x400000,0x400000,0x400000,0x800000,0x800000,0x800000,0x800000,0x800000,0x800000,0x800000);
  803fc3:	68 00 00 80 00       	push   0x800000
  803fc8:	68 00 00 80 00       	push   0x800000
  803fcd:	68 00 00 80 00       	push   0x800000
  803fd2:	68 00 00 80 00       	push   0x800000
  803fd7:	41 b9 00 00 80 00    	mov    r9d,0x800000
  803fdd:	41 b8 00 00 80 00    	mov    r8d,0x800000
  803fe3:	b9 00 00 80 00       	mov    ecx,0x800000
  803fe8:	ba 00 00 40 00       	mov    edx,0x400000
  803fed:	be 00 00 40 00       	mov    esi,0x400000
  803ff2:	bf 00 00 40 00       	mov    edi,0x400000
  803ff7:	e8 55 13 00 00       	call   805351 <set_tss>
  803ffc:	48 83 c4 20          	add    rsp,0x20
    //IA32_INTERRUPT_SSP_TABLE_ADDR，准备IST
    wrmsr(0x6a8,tss->rsvd2);
  804000:	48 8b 05 99 99 00 00 	mov    rax,QWORD PTR [rip+0x9999]        # 80d9a0 <tss>
  804007:	48 8b 40 1c          	mov    rax,QWORD PTR [rax+0x1c]
  80400b:	48 89 c6             	mov    rsi,rax
  80400e:	bf a8 06 00 00       	mov    edi,0x6a8
  804013:	e8 2c c8 ff ff       	call   800844 <wrmsr>
    //把内核代码段选择子写到MSR寄存器中准备用于特权级转换(sysexit，现在没用)
    wrmsr(0x174,0x8);
  804018:	be 08 00 00 00       	mov    esi,0x8
  80401d:	bf 74 01 00 00       	mov    edi,0x174
  804022:	e8 1d c8 ff ff       	call   800844 <wrmsr>
    //准备用于特权级转换(sysret，正在使用)
    wrmsr(0xc0000081,0x0020000800000000ul);
  804027:	48 b8 00 00 00 00 08 	movabs rax,0x20000800000000
  80402e:	00 20 00 
  804031:	48 89 c6             	mov    rsi,rax
  804034:	b8 81 00 00 c0       	mov    eax,0xc0000081
  804039:	48 89 c7             	mov    rdi,rax
  80403c:	e8 03 c8 ff ff       	call   800844 <wrmsr>

    comprintf("proc init set.\r\ntss.ist=0x%x\r\n",tss->ists[0]);
  804041:	48 8b 05 58 99 00 00 	mov    rax,QWORD PTR [rip+0x9958]        # 80d9a0 <tss>
  804048:	48 8b 40 24          	mov    rax,QWORD PTR [rax+0x24]
  80404c:	48 89 c6             	mov    rsi,rax
  80404f:	bf 80 56 81 00       	mov    edi,0x815680
  804054:	b8 00 00 00 00       	mov    eax,0x0
  804059:	e8 39 8e 00 00       	call   80ce97 <comprintf>
    //创建一个测试进程
//    create_test_proc();
}
  80405e:	90                   	nop
  80405f:	c9                   	leave  
  804060:	c3                   	ret    

0000000000804061 <create_test_proc>:
void create_test_proc(){
  804061:	f3 0f 1e fa          	endbr64 
  804065:	55                   	push   rbp
  804066:	48 89 e5             	mov    rbp,rsp
  804069:	48 83 ec 20          	sub    rsp,0x20

    int index=req_proc();
  80406d:	b8 00 00 00 00       	mov    eax,0x0
  804072:	e8 da 02 00 00       	call   804351 <req_proc>
  804077:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    task[index].stat=TASK_READY;
  80407a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80407d:	48 98                	cdqe   
  80407f:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804086:	48 05 58 85 40 00    	add    rax,0x408558
  80408c:	c7 00 02 00 00 00    	mov    DWORD PTR [rax],0x2
    int currsp=0x9fc00-1;
  804092:	c7 45 ec ff fb 09 00 	mov    DWORD PTR [rbp-0x14],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  804099:	48 89 65 ec          	mov    QWORD PTR [rbp-0x14],rsp
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  80409d:	ba 92 d8 80 00       	mov    edx,0x80d892
  8040a2:	48 83 ec 08          	sub    rsp,0x8
  8040a6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8040a9:	50                   	push   rax
  8040aa:	6a 00                	push   0x0
  8040ac:	52                   	push   rdx
  8040ad:	6a 00                	push   0x0
  8040af:	6a 00                	push   0x0
  8040b1:	6a 00                	push   0x0
  8040b3:	68 58 7d 00 00       	push   0x7d58
  8040b8:	6a 10                	push   0x10
  8040ba:	6a 10                	push   0x10
  8040bc:	6a 10                	push   0x10
  8040be:	6a 10                	push   0x10
  8040c0:	41 b9 08 00 00 00    	mov    r9d,0x8
  8040c6:	41 b8 10 00 00 00    	mov    r8d,0x10
  8040cc:	b9 00 00 00 00       	mov    ecx,0x0
  8040d1:	ba 00 00 00 00       	mov    edx,0x0
  8040d6:	be 00 00 00 00       	mov    esi,0x0
  8040db:	bf 00 00 00 00       	mov    edi,0x0
  8040e0:	e8 37 03 00 00       	call   80441c <set_proc>
  8040e5:	48 83 c4 60          	add    rsp,0x60
             0x7e00- sizeof(stack_store_regs), 0, 0, 0, (long)ret_sys_call, 0, index);
    task[index].tss.rsp0=0x400000;
  8040e9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8040ec:	48 98                	cdqe   
  8040ee:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8040f5:	48 05 10 87 40 00    	add    rax,0x408710
  8040fb:	48 c7 40 0c 00 00 40 	mov    QWORD PTR [rax+0xc],0x400000
  804102:	00 
    task[index].mem_struct.stack_top=0x7e00;
  804103:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804106:	48 98                	cdqe   
  804108:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80410f:	48 05 74 85 40 00    	add    rax,0x408574
  804115:	c7 00 00 7e 00 00    	mov    DWORD PTR [rax],0x7e00
    task[index].mem_struct.stack_bottom=0x6e00;
  80411b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80411e:	48 98                	cdqe   
  804120:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804127:	48 05 70 85 40 00    	add    rax,0x408570
  80412d:	c7 00 00 6e 00 00    	mov    DWORD PTR [rax],0x6e00
    task[index].mem_struct.heap_top=0x1101000;
  804133:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804136:	48 98                	cdqe   
  804138:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80413f:	48 05 6c 85 40 00    	add    rax,0x40856c
  804145:	c7 00 00 10 10 01    	mov    DWORD PTR [rax],0x1101000
    task[index].mem_struct.heap_base=0x1100000;
  80414b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80414e:	48 98                	cdqe   
  804150:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804157:	48 05 68 85 40 00    	add    rax,0x408568
  80415d:	c7 00 00 00 10 01    	mov    DWORD PTR [rax],0x1100000

    //把还原现场时用到的堆栈设置好
    stack_store_regs *str= (stack_store_regs *) (0x7e00 - sizeof(stack_store_regs));
  804163:	48 c7 45 f0 58 7d 00 	mov    QWORD PTR [rbp-0x10],0x7d58
  80416a:	00 
    str->rax=0;
  80416b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80416f:	48 c7 40 78 00 00 00 	mov    QWORD PTR [rax+0x78],0x0
  804176:	00 
    str->rbx=0;
  804177:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80417b:	48 c7 40 70 00 00 00 	mov    QWORD PTR [rax+0x70],0x0
  804182:	00 
    str->rcx=proc_zero;//sysret采用的返回地址
  804183:	ba 90 45 80 00       	mov    edx,0x804590
  804188:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80418c:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    str->rdx=0;
  804190:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804194:	48 c7 40 60 00 00 00 	mov    QWORD PTR [rax+0x60],0x0
  80419b:	00 
    str->rsi=0;
  80419c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8041a0:	48 c7 40 50 00 00 00 	mov    QWORD PTR [rax+0x50],0x0
  8041a7:	00 
    str->rdi=0;
  8041a8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8041ac:	48 c7 40 58 00 00 00 	mov    QWORD PTR [rax+0x58],0x0
  8041b3:	00 
    str->r15=0;
  8041b4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8041b8:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  8041bf:	00 
    str->r14=0;
  8041c0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8041c4:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  8041cb:	00 
    str->r13=0;
  8041cc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8041d0:	48 c7 40 20 00 00 00 	mov    QWORD PTR [rax+0x20],0x0
  8041d7:	00 
    str->r12=0;
  8041d8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8041dc:	48 c7 40 28 00 00 00 	mov    QWORD PTR [rax+0x28],0x0
  8041e3:	00 
    str->r11=0x200;
  8041e4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8041e8:	48 c7 40 30 00 02 00 	mov    QWORD PTR [rax+0x30],0x200
  8041ef:	00 
    str->r10=0;
  8041f0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8041f4:	48 c7 40 38 00 00 00 	mov    QWORD PTR [rax+0x38],0x0
  8041fb:	00 
    str->r9=0;
  8041fc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804200:	48 c7 40 40 00 00 00 	mov    QWORD PTR [rax+0x40],0x0
  804207:	00 
    str->r8=0;
  804208:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80420c:	48 c7 40 48 00 00 00 	mov    QWORD PTR [rax+0x48],0x0
  804213:	00 
    str->rip=proc_zero;
  804214:	ba 90 45 80 00       	mov    edx,0x804590
  804219:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80421d:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
    str->cs=0x8;
  804224:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804228:	48 c7 80 88 00 00 00 	mov    QWORD PTR [rax+0x88],0x8
  80422f:	08 00 00 00 
    str->rflags=0x00200206;
  804233:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804237:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x200206
  80423e:	06 02 20 00 
    str->rsp=0x7e00;
  804242:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804246:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x7e00
  80424d:	00 7e 00 00 
    str->ss=0x2b;
  804251:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804255:	48 c7 80 a0 00 00 00 	mov    QWORD PTR [rax+0xa0],0x2b
  80425c:	2b 00 00 00 
    str->ds=0x2b;
  804260:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804264:	48 c7 00 2b 00 00 00 	mov    QWORD PTR [rax],0x2b
    str->es=0x2b;
  80426b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80426f:	48 c7 40 08 2b 00 00 	mov    QWORD PTR [rax+0x8],0x2b
  804276:	00 

}
  804277:	90                   	nop
  804278:	c9                   	leave  
  804279:	c3                   	ret    

000000000080427a <create_proc>:
int create_proc()
{
  80427a:	f3 0f 1e fa          	endbr64 
  80427e:	55                   	push   rbp
  80427f:	48 89 e5             	mov    rbp,rsp
  804282:	48 83 ec 20          	sub    rsp,0x20
    int index=req_proc();
  804286:	b8 00 00 00 00       	mov    eax,0x0
  80428b:	e8 c1 00 00 00       	call   804351 <req_proc>
  804290:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    struct process *pz=&task[index];
  804293:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804296:	48 98                	cdqe   
  804298:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80429f:	48 05 40 85 40 00    	add    rax,0x408540
  8042a5:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(index==-1)return -1;
  8042a9:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  8042ad:	75 0a                	jne    8042b9 <create_proc+0x3f>
  8042af:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8042b4:	e9 96 00 00 00       	jmp    80434f <create_proc+0xd5>
    int currsp=0x9fc00-1;
  8042b9:	c7 45 e4 ff fb 09 00 	mov    DWORD PTR [rbp-0x1c],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  8042c0:	48 89 65 e4          	mov    QWORD PTR [rbp-0x1c],rsp
    //默认DPL=3
    //set_proc(0,0,0,0,0x23,0x1b,0x23,0x23,0x23,0x23,curesp,0,0,0,0,index);
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  8042c4:	b9 90 45 80 00       	mov    ecx,0x804590
  8042c9:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8042cc:	48 98                	cdqe   
  8042ce:	48 83 ec 08          	sub    rsp,0x8
  8042d2:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8042d5:	52                   	push   rdx
  8042d6:	6a 00                	push   0x0
  8042d8:	51                   	push   rcx
  8042d9:	6a 00                	push   0x0
  8042db:	6a 00                	push   0x0
  8042dd:	6a 00                	push   0x0
  8042df:	50                   	push   rax
  8042e0:	6a 10                	push   0x10
  8042e2:	6a 10                	push   0x10
  8042e4:	6a 10                	push   0x10
  8042e6:	6a 10                	push   0x10
  8042e8:	41 b9 08 00 00 00    	mov    r9d,0x8
  8042ee:	41 b8 10 00 00 00    	mov    r8d,0x10
  8042f4:	b9 00 00 00 00       	mov    ecx,0x0
  8042f9:	ba 00 00 00 00       	mov    edx,0x0
  8042fe:	be 00 00 00 00       	mov    esi,0x0
  804303:	bf 00 00 00 00       	mov    edi,0x0
  804308:	e8 0f 01 00 00       	call   80441c <set_proc>
  80430d:	48 83 c4 60          	add    rsp,0x60
//    task[index].tss.eip=(long)proc_zero;
    extern struct dir_entry* dtty;
    //stdin stdout stderr
    //这里绕开了sys open，这样是为了尽量快
    extern struct file ftty;
    addr_t filplate=vmalloc();
  804311:	b8 00 00 00 00       	mov    eax,0x0
  804316:	e8 27 cf ff ff       	call   801242 <vmalloc>
  80431b:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    pz->openf[0]=&ftty;
  80431f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804323:	48 c7 80 d8 00 00 00 	mov    QWORD PTR [rax+0xd8],0x408500
  80432a:	00 85 40 00 
    pz->openf[1]=&ftty;
  80432e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804332:	48 c7 80 e0 00 00 00 	mov    QWORD PTR [rax+0xe0],0x408500
  804339:	00 85 40 00 
    pz->openf[2]=&ftty;
  80433d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804341:	48 c7 80 e8 00 00 00 	mov    QWORD PTR [rax+0xe8],0x408500
  804348:	00 85 40 00 

    return index;
  80434c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80434f:	c9                   	leave  
  804350:	c3                   	ret    

0000000000804351 <req_proc>:
int req_proc(){
  804351:	f3 0f 1e fa          	endbr64 
  804355:	55                   	push   rbp
  804356:	48 89 e5             	mov    rbp,rsp
    int num=0;
  804359:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(task[num].pid!=-1 && task[num].stat != TASK_EMPTY && \
  804360:	eb 04                	jmp    804366 <req_proc+0x15>
    num<=MAX_PROC_COUNT){
        num++;
  804362:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    while(task[num].pid!=-1 && task[num].stat != TASK_EMPTY && \
  804366:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804369:	48 98                	cdqe   
  80436b:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804372:	48 05 40 85 40 00    	add    rax,0x408540
  804378:	8b 00                	mov    eax,DWORD PTR [rax]
  80437a:	83 f8 ff             	cmp    eax,0xffffffff
  80437d:	74 1e                	je     80439d <req_proc+0x4c>
  80437f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804382:	48 98                	cdqe   
  804384:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80438b:	48 05 58 85 40 00    	add    rax,0x408558
  804391:	8b 00                	mov    eax,DWORD PTR [rax]
  804393:	85 c0                	test   eax,eax
  804395:	74 06                	je     80439d <req_proc+0x4c>
  804397:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  80439b:	7e c5                	jle    804362 <req_proc+0x11>
    }
    if(num>=MAX_PROC_COUNT)
  80439d:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8043a1:	7e 07                	jle    8043aa <req_proc+0x59>
        return -1;
  8043a3:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8043a8:	eb 70                	jmp    80441a <req_proc+0xc9>
    task[num].pid=pidd++;
  8043aa:	8b 05 20 0f c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10f20]        # 4152d0 <pidd>
  8043b0:	8d 50 01             	lea    edx,[rax+0x1]
  8043b3:	89 15 17 0f c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10f17],edx        # 4152d0 <pidd>
  8043b9:	89 c2                	mov    edx,eax
  8043bb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8043be:	48 98                	cdqe   
  8043c0:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8043c7:	48 05 40 85 40 00    	add    rax,0x408540
  8043cd:	89 10                	mov    DWORD PTR [rax],edx
    task[num].stat=TASK_ZOMBIE;
  8043cf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8043d2:	48 98                	cdqe   
  8043d4:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8043db:	48 05 58 85 40 00    	add    rax,0x408558
  8043e1:	c7 00 04 00 00 00    	mov    DWORD PTR [rax],0x4
    task[num].utime=0;
  8043e7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8043ea:	48 98                	cdqe   
  8043ec:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8043f3:	48 05 5c 85 40 00    	add    rax,0x40855c
  8043f9:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[num].priority=0;
  8043ff:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804402:	48 98                	cdqe   
  804404:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80440b:	48 05 60 85 40 00    	add    rax,0x408560
  804411:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return num;
  804417:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80441a:	5d                   	pop    rbp
  80441b:	c3                   	ret    

000000000080441c <set_proc>:
void set_proc(long rax, long rbx, long rcx, long rdx, long es, long cs, long ss, long ds, long fs, long gs, long rsp,
              long rbp, long rsi, long rdi, long rip, long rflags, int proc_nr) {
  80441c:	f3 0f 1e fa          	endbr64 
  804420:	55                   	push   rbp
  804421:	48 89 e5             	mov    rbp,rsp
  804424:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  804428:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80442c:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  804430:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  804434:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
  804438:	4c 89 4d c0          	mov    QWORD PTR [rbp-0x40],r9
    struct process* proc=&task[proc_nr];
  80443c:	8b 45 60             	mov    eax,DWORD PTR [rbp+0x60]
  80443f:	48 98                	cdqe   
  804441:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804448:	48 05 40 85 40 00    	add    rax,0x408540
  80444e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    proc->regs.rax=rax;
  804452:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804456:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80445a:	48 89 90 5c 02 00 00 	mov    QWORD PTR [rax+0x25c],rdx
    proc->regs.rbx=rbx;
  804461:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804465:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  804469:	48 89 90 74 02 00 00 	mov    QWORD PTR [rax+0x274],rdx
    proc->regs.rcx=rcx;
  804470:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804474:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  804478:	48 89 90 64 02 00 00 	mov    QWORD PTR [rax+0x264],rdx
    proc->regs.rdx=rdx;
  80447f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804483:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804487:	48 89 90 6c 02 00 00 	mov    QWORD PTR [rax+0x26c],rdx
    proc->regs.es=es;
  80448e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804492:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  804496:	48 89 90 9c 02 00 00 	mov    QWORD PTR [rax+0x29c],rdx
    proc->regs.cs=cs;
  80449d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8044a1:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  8044a5:	48 89 90 a4 02 00 00 	mov    QWORD PTR [rax+0x2a4],rdx
    proc->regs.ss=ss;
  8044ac:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8044b0:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  8044b4:	48 89 90 ac 02 00 00 	mov    QWORD PTR [rax+0x2ac],rdx
    proc->regs.ds=ds;
  8044bb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8044bf:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  8044c3:	48 89 90 b4 02 00 00 	mov    QWORD PTR [rax+0x2b4],rdx
    proc->regs.fs=fs;
  8044ca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8044ce:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  8044d2:	48 89 90 bc 02 00 00 	mov    QWORD PTR [rax+0x2bc],rdx
    proc->regs.gs=gs;
  8044d9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8044dd:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  8044e1:	48 89 90 c4 02 00 00 	mov    QWORD PTR [rax+0x2c4],rdx
    proc->regs.rsp=rsp;
  8044e8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8044ec:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  8044f0:	48 89 90 7c 02 00 00 	mov    QWORD PTR [rax+0x27c],rdx
    proc->regs.rbp=rbp;
  8044f7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8044fb:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
  8044ff:	48 89 90 84 02 00 00 	mov    QWORD PTR [rax+0x284],rdx
    proc->regs.rsi=rsi;
  804506:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80450a:	48 8b 55 40          	mov    rdx,QWORD PTR [rbp+0x40]
  80450e:	48 89 90 8c 02 00 00 	mov    QWORD PTR [rax+0x28c],rdx
    proc->regs.rdi=rdi;
  804515:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804519:	48 8b 55 48          	mov    rdx,QWORD PTR [rbp+0x48]
  80451d:	48 89 90 94 02 00 00 	mov    QWORD PTR [rax+0x294],rdx
    proc->regs.rflags=0x202;//设置为默认值:0b 0010 0000 0010
  804524:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804528:	48 c7 80 54 02 00 00 	mov    QWORD PTR [rax+0x254],0x202
  80452f:	02 02 00 00 
    //能接受中断
    proc->regs.rip=rip;
  804533:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804537:	48 8b 55 50          	mov    rdx,QWORD PTR [rbp+0x50]
  80453b:	48 89 90 4c 02 00 00 	mov    QWORD PTR [rax+0x24c],rdx

    proc->regs.cs=cs;
  804542:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804546:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  80454a:	48 89 90 a4 02 00 00 	mov    QWORD PTR [rax+0x2a4],rdx
    proc->regs.ds=ds;
  804551:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804555:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  804559:	48 89 90 b4 02 00 00 	mov    QWORD PTR [rax+0x2b4],rdx
    proc->regs.es=es;
  804560:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804564:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  804568:	48 89 90 9c 02 00 00 	mov    QWORD PTR [rax+0x29c],rdx
    proc->regs.cr3=PML4_ADDR;//get_phyaddr(n1);//暂时先搞成全局
  80456f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804573:	48 c7 80 44 02 00 00 	mov    QWORD PTR [rax+0x244],0x101000
  80457a:	00 10 10 00 
    proc->pml4=PML4_ADDR;
  80457e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804582:	48 c7 80 c0 00 00 00 	mov    QWORD PTR [rax+0xc0],0x101000
  804589:	00 10 10 00 


}
  80458d:	90                   	nop
  80458e:	5d                   	pop    rbp
  80458f:	c3                   	ret    

0000000000804590 <proc_zero>:
void proc_zero()
{
  804590:	f3 0f 1e fa          	endbr64 
  804594:	55                   	push   rbp
  804595:	48 89 e5             	mov    rbp,rsp
  804598:	48 83 ec 10          	sub    rsp,0x10
//    }else{
//        printf("parent proc ret:%d\n",rax);
//    }
    while (1)
    {
        char c= sys_analyse_key();
  80459c:	b8 00 00 00 00       	mov    eax,0x0
  8045a1:	e8 d6 4e 00 00       	call   80947c <sys_analyse_key>
  8045a6:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        putchar(c);
  8045a9:	0f be 45 ff          	movsx  eax,BYTE PTR [rbp-0x1]
  8045ad:	89 c7                	mov    edi,eax
  8045af:	e8 8e c7 ff ff       	call   800d42 <putchar>
    {
  8045b4:	eb e6                	jmp    80459c <proc_zero+0xc>

00000000008045b6 <save_rsp>:
    }
}
void save_rsp(){
  8045b6:	f3 0f 1e fa          	endbr64 
  8045ba:	55                   	push   rbp
  8045bb:	48 89 e5             	mov    rbp,rsp
    //在时钟中断context下
    addr_t * p=INT_STACK_TOP-16;
  8045be:	48 c7 45 f8 f0 ff 7f 	mov    QWORD PTR [rbp-0x8],0x7ffff0
  8045c5:	00 
    current->regs.rsp=*p;
  8045c6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8045ca:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8045cd:	48 8b 05 6c 0c c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc10c6c]        # 415240 <current>
  8045d4:	48 89 90 7c 02 00 00 	mov    QWORD PTR [rax+0x27c],rdx
}
  8045db:	90                   	nop
  8045dc:	5d                   	pop    rbp
  8045dd:	c3                   	ret    

00000000008045de <manage_proc>:
void manage_proc(){
  8045de:	f3 0f 1e fa          	endbr64 
  8045e2:	55                   	push   rbp
  8045e3:	48 89 e5             	mov    rbp,rsp
  8045e6:	48 83 ec 10          	sub    rsp,0x10
    if(cur_proc!=-1)
  8045ea:	8b 05 dc 0c c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10cdc]        # 4152cc <cur_proc>
  8045f0:	83 f8 ff             	cmp    eax,0xffffffff
  8045f3:	74 2d                	je     804622 <manage_proc+0x44>
        task[cur_proc].utime++;
  8045f5:	8b 05 d1 0c c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10cd1]        # 4152cc <cur_proc>
  8045fb:	48 63 d0             	movsxd rdx,eax
  8045fe:	48 69 d2 34 03 00 00 	imul   rdx,rdx,0x334
  804605:	48 81 c2 5c 85 40 00 	add    rdx,0x40855c
  80460c:	8b 12                	mov    edx,DWORD PTR [rdx]
  80460e:	83 c2 01             	add    edx,0x1
  804611:	48 98                	cdqe   
  804613:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80461a:	48 05 5c 85 40 00    	add    rax,0x40855c
  804620:	89 10                	mov    DWORD PTR [rax],edx
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  804622:	8b 05 a4 0c c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10ca4]        # 4152cc <cur_proc>
  804628:	83 f8 ff             	cmp    eax,0xffffffff
  80462b:	74 3c                	je     804669 <manage_proc+0x8b>
  80462d:	8b 05 99 0c c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10c99]        # 4152cc <cur_proc>
  804633:	48 98                	cdqe   
  804635:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80463c:	48 05 5c 85 40 00    	add    rax,0x40855c
  804642:	8b 00                	mov    eax,DWORD PTR [rax]
  804644:	83 f8 0a             	cmp    eax,0xa
  804647:	77 20                	ja     804669 <manage_proc+0x8b>
    task[cur_proc].stat != TASK_READY){
  804649:	8b 05 7d 0c c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10c7d]        # 4152cc <cur_proc>
  80464f:	48 98                	cdqe   
  804651:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804658:	48 05 58 85 40 00    	add    rax,0x408558
  80465e:	8b 00                	mov    eax,DWORD PTR [rax]
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  804660:	83 f8 02             	cmp    eax,0x2
  804663:	0f 84 02 01 00 00    	je     80476b <manage_proc+0x18d>
        if(cur_proc!=-1)
  804669:	8b 05 5d 0c c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10c5d]        # 4152cc <cur_proc>
  80466f:	83 f8 ff             	cmp    eax,0xffffffff
  804672:	74 1b                	je     80468f <manage_proc+0xb1>
            task[cur_proc].utime=0;
  804674:	8b 05 52 0c c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10c52]        # 4152cc <cur_proc>
  80467a:	48 98                	cdqe   
  80467c:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804683:	48 05 5c 85 40 00    	add    rax,0x40855c
  804689:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        //find
        int i=cur_proc+1;
  80468f:	8b 05 37 0c c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10c37]        # 4152cc <cur_proc>
  804695:	83 c0 01             	add    eax,0x1
  804698:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        int times=0;
  80469b:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
        //轮询，直到有一个符合条件
        while(times<10){
  8046a2:	eb 52                	jmp    8046f6 <manage_proc+0x118>
            if(task[i].pid!=-1 && task[i].stat == TASK_READY && i != cur_proc){
  8046a4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8046a7:	48 98                	cdqe   
  8046a9:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8046b0:	48 05 40 85 40 00    	add    rax,0x408540
  8046b6:	8b 00                	mov    eax,DWORD PTR [rax]
  8046b8:	83 f8 ff             	cmp    eax,0xffffffff
  8046bb:	74 24                	je     8046e1 <manage_proc+0x103>
  8046bd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8046c0:	48 98                	cdqe   
  8046c2:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8046c9:	48 05 58 85 40 00    	add    rax,0x408558
  8046cf:	8b 00                	mov    eax,DWORD PTR [rax]
  8046d1:	83 f8 02             	cmp    eax,0x2
  8046d4:	75 0b                	jne    8046e1 <manage_proc+0x103>
  8046d6:	8b 05 f0 0b c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10bf0]        # 4152cc <cur_proc>
  8046dc:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  8046df:	75 1d                	jne    8046fe <manage_proc+0x120>
                break;
            }
            i++;
  8046e1:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
            if(i>=MAX_TASKS){
  8046e5:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  8046e9:	7e 0b                	jle    8046f6 <manage_proc+0x118>
                times++;
  8046eb:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                i=0;
  8046ef:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        while(times<10){
  8046f6:	83 7d f8 09          	cmp    DWORD PTR [rbp-0x8],0x9
  8046fa:	7e a8                	jle    8046a4 <manage_proc+0xc6>
  8046fc:	eb 01                	jmp    8046ff <manage_proc+0x121>
                break;
  8046fe:	90                   	nop
            }
        }
        if(times==10)return;//超过十次尝试都没有，暂时不切换
  8046ff:	83 7d f8 0a          	cmp    DWORD PTR [rbp-0x8],0xa
  804703:	74 69                	je     80476e <manage_proc+0x190>
        //switch
        task[cur_proc].stat=TASK_READY;
  804705:	8b 05 c1 0b c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10bc1]        # 4152cc <cur_proc>
  80470b:	48 98                	cdqe   
  80470d:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804714:	48 05 58 85 40 00    	add    rax,0x408558
  80471a:	c7 00 02 00 00 00    	mov    DWORD PTR [rax],0x2
        task[i].stat=TASK_RUNNING;
  804720:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804723:	48 98                	cdqe   
  804725:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80472c:	48 05 58 85 40 00    	add    rax,0x408558
  804732:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        switch_to(&task[cur_proc], &task[i]);
  804738:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80473b:	48 98                	cdqe   
  80473d:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804744:	48 8d 90 40 85 40 00 	lea    rdx,[rax+0x408540]
  80474b:	8b 05 7b 0b c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10b7b]        # 4152cc <cur_proc>
  804751:	48 98                	cdqe   
  804753:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80475a:	48 05 40 85 40 00    	add    rax,0x408540
  804760:	48 89 d6             	mov    rsi,rdx
  804763:	48 89 c7             	mov    rdi,rax
  804766:	e8 58 0a 00 00       	call   8051c3 <switch_to>
    }
    return;
  80476b:	90                   	nop
  80476c:	eb 01                	jmp    80476f <manage_proc+0x191>
        if(times==10)return;//超过十次尝试都没有，暂时不切换
  80476e:	90                   	nop
}
  80476f:	c9                   	leave  
  804770:	c3                   	ret    

0000000000804771 <switch_proc_tss>:

void switch_proc_tss(int pnr)
{
  804771:	f3 0f 1e fa          	endbr64 
  804775:	55                   	push   rbp
  804776:	48 89 e5             	mov    rbp,rsp
  804779:	48 83 ec 20          	sub    rsp,0x20
  80477d:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int sel=_TSS_IND(pnr)*8;
  804780:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804783:	01 c0                	add    eax,eax
  804785:	83 c0 05             	add    eax,0x5
  804788:	c1 e0 03             	shl    eax,0x3
  80478b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    cur_proc=pnr;
  80478e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804791:	89 05 35 0b c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10b35],eax        # 4152cc <cur_proc>
    switch_proc_asm(sel);
  804797:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80479a:	89 c7                	mov    edi,eax
  80479c:	e8 09 90 00 00       	call   80d7aa <switch_proc_asm>
}
  8047a1:	90                   	nop
  8047a2:	c9                   	leave  
  8047a3:	c3                   	ret    

00000000008047a4 <switch_proc>:
void switch_proc(int pnr){
  8047a4:	f3 0f 1e fa          	endbr64 
  8047a8:	55                   	push   rbp
  8047a9:	48 89 e5             	mov    rbp,rsp
  8047ac:	48 81 ec 50 03 00 00 	sub    rsp,0x350
  8047b3:	89 bd bc fc ff ff    	mov    DWORD PTR [rbp-0x344],edi
    //printf("switching proc to %d\n",pnr);
    //printf("eip:%x\n",task[pnr].tss.eip);
    struct process p=task[pnr];
  8047b9:	8b 85 bc fc ff ff    	mov    eax,DWORD PTR [rbp-0x344]
  8047bf:	48 98                	cdqe   
  8047c1:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8047c8:	48 8d 90 40 85 40 00 	lea    rdx,[rax+0x408540]
  8047cf:	48 8d 85 c0 fc ff ff 	lea    rax,[rbp-0x340]
  8047d6:	b9 66 00 00 00       	mov    ecx,0x66
  8047db:	48 89 c7             	mov    rdi,rax
  8047de:	48 89 d6             	mov    rsi,rdx
  8047e1:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
  8047e4:	48 89 f2             	mov    rdx,rsi
  8047e7:	48 89 f8             	mov    rax,rdi
  8047ea:	8b 0a                	mov    ecx,DWORD PTR [rdx]
  8047ec:	89 08                	mov    DWORD PTR [rax],ecx
    save_context(&task[cur_proc].tss);
  8047ee:	8b 05 d8 0a c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10ad8]        # 4152cc <cur_proc>
  8047f4:	48 98                	cdqe   
  8047f6:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8047fd:	48 05 d0 01 00 00    	add    rax,0x1d0
  804803:	48 05 40 85 40 00    	add    rax,0x408540
  804809:	48 83 c0 08          	add    rax,0x8
  80480d:	48 89 c7             	mov    rdi,rax
  804810:	e8 4c 00 00 00       	call   804861 <save_context>
//    //重新设置0号进程
//    task[0].tss.eip=proc_zero;
//    task[0].tss.cr3=PAGE_INDEX_ADDR;
//    task[0].tss.eflags=0x202;
    cur_proc=pnr;
  804815:	8b 85 bc fc ff ff    	mov    eax,DWORD PTR [rbp-0x344]
  80481b:	89 05 ab 0a c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10aab],eax        # 4152cc <cur_proc>
    int sel=_TSS_IND(pnr)*8;
  804821:	8b 85 bc fc ff ff    	mov    eax,DWORD PTR [rbp-0x344]
  804827:	01 c0                	add    eax,eax
  804829:	83 c0 05             	add    eax,0x5
  80482c:	c1 e0 03             	shl    eax,0x3
  80482f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    switch_to(NULL, &task[pnr].tss);
  804832:	8b 85 bc fc ff ff    	mov    eax,DWORD PTR [rbp-0x344]
  804838:	48 98                	cdqe   
  80483a:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804841:	48 05 d0 01 00 00    	add    rax,0x1d0
  804847:	48 05 40 85 40 00    	add    rax,0x408540
  80484d:	48 83 c0 08          	add    rax,0x8
  804851:	48 89 c6             	mov    rsi,rax
  804854:	bf 00 00 00 00       	mov    edi,0x0
  804859:	e8 65 09 00 00       	call   8051c3 <switch_to>
    //asm volatile("push %0":"=r"(task[pnr].tss.eip));
    //switch_proc_asm(pnr*8+0x8*3);
}
  80485e:	90                   	nop
  80485f:	c9                   	leave  
  804860:	c3                   	ret    

0000000000804861 <save_context>:
void save_context(TSS *tss)
{
  804861:	f3 0f 1e fa          	endbr64 
  804865:	55                   	push   rbp
  804866:	48 89 e5             	mov    rbp,rsp
  804869:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//    tss->esi=scene_saver.esi;
//    tss->edi=scene_saver.edi;
//    tss->eflags=scene_saver.eflags;
//    tss->esp=scene_saver.esp;
//    tss->ebp=scene_saver.ebp;
}
  80486d:	90                   	nop
  80486e:	5d                   	pop    rbp
  80486f:	c3                   	ret    

0000000000804870 <palloc>:
    task[index].stat=TASK_READY;
    return index;
} */
//为指定进程申请新的内存，并返回这块内存的线性地址。
void* palloc(int proc_index,int size)
{
  804870:	f3 0f 1e fa          	endbr64 
  804874:	55                   	push   rbp
  804875:	48 89 e5             	mov    rbp,rsp
  804878:	48 83 ec 60          	sub    rsp,0x60
  80487c:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  80487f:	89 75 a8             	mov    DWORD PTR [rbp-0x58],esi
    int page_c=size/4096+size%4096?1:0;
  804882:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  804885:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80488b:	85 c0                	test   eax,eax
  80488d:	0f 48 c2             	cmovs  eax,edx
  804890:	c1 f8 0c             	sar    eax,0xc
  804893:	89 c1                	mov    ecx,eax
  804895:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  804898:	99                   	cdq    
  804899:	c1 ea 14             	shr    edx,0x14
  80489c:	01 d0                	add    eax,edx
  80489e:	25 ff 0f 00 00       	and    eax,0xfff
  8048a3:	29 d0                	sub    eax,edx
  8048a5:	01 c8                	add    eax,ecx
  8048a7:	85 c0                	test   eax,eax
  8048a9:	0f 95 c0             	setne  al
  8048ac:	0f b6 c0             	movzx  eax,al
  8048af:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=0;
  8048b2:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    void *ptr=NULL;
  8048b9:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  8048c0:	00 
    page_item *pgind=NULL;//task[proc_index].tss.cr3;
  8048c1:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8048c8:	00 
    pgind++;
  8048c9:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  8048ce:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [rbp-0x14],0x1
  8048d5:	e9 30 02 00 00       	jmp    804b0a <palloc+0x29a>
    {
        page_item* tblp=*pgind&0xfffff000;
  8048da:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8048de:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8048e1:	25 00 f0 ff ff       	and    eax,0xfffff000
  8048e6:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for(int j=0;j<1024;j++)
  8048ea:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  8048f1:	e9 fe 01 00 00       	jmp    804af4 <palloc+0x284>
        {
            int v=*tblp&PAGE_PRESENT;
  8048f6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8048fa:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8048fd:	83 e0 01             	and    eax,0x1
  804900:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
            if(!v)
  804903:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  804907:	0f 85 de 01 00 00    	jne    804aeb <palloc+0x27b>
            {
                int new_pg=req_a_page();
  80490d:	b8 00 00 00 00       	mov    eax,0x0
  804912:	e8 f9 cc ff ff       	call   801610 <req_a_page>
  804917:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
                if(new_pg==-1)
  80491a:	83 7d c8 ff          	cmp    DWORD PTR [rbp-0x38],0xffffffff
  80491e:	0f 85 b9 00 00 00    	jne    8049dd <palloc+0x16d>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  804924:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804927:	48 98                	cdqe   
  804929:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804930:	48 05 a8 85 40 00    	add    rax,0x4085a8
  804936:	0f b7 00             	movzx  eax,WORD PTR [rax]
  804939:	0f b7 c0             	movzx  eax,ax
  80493c:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  80493f:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804942:	48 98                	cdqe   
  804944:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80494b:	48 05 a0 85 40 00    	add    rax,0x4085a0
  804951:	0f b7 40 0d          	movzx  eax,WORD PTR [rax+0xd]
  804955:	0f b7 c0             	movzx  eax,ax
  804958:	c1 e0 10             	shl    eax,0x10
  80495b:	25 00 00 0f 00       	and    eax,0xf0000
  804960:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    size+=c;
  804963:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804966:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  804969:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80496c:	89 c2                	mov    edx,eax
  80496e:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804971:	48 98                	cdqe   
  804973:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80497a:	48 05 a8 85 40 00    	add    rax,0x4085a8
  804980:	66 89 10             	mov    WORD PTR [rax],dx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  804983:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804986:	48 98                	cdqe   
  804988:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80498f:	48 05 a0 85 40 00    	add    rax,0x4085a0
  804995:	0f b7 40 0d          	movzx  eax,WORD PTR [rax+0xd]
  804999:	0f b7 c0             	movzx  eax,ax
  80499c:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    tmp_attr&=0xfff0;
  80499f:	81 65 b0 f0 ff 00 00 	and    DWORD PTR [rbp-0x50],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  8049a6:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8049a9:	c1 e8 10             	shr    eax,0x10
  8049ac:	83 e0 0f             	and    eax,0xf
  8049af:	89 c2                	mov    edx,eax
  8049b1:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  8049b4:	01 d0                	add    eax,edx
  8049b6:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  8049b9:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  8049bc:	89 c2                	mov    edx,eax
  8049be:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8049c1:	48 98                	cdqe   
  8049c3:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8049ca:	48 05 a0 85 40 00    	add    rax,0x4085a0
  8049d0:	66 89 50 0d          	mov    WORD PTR [rax+0xd],dx
                    return ptr;//失败了，只能申请一部分的内存或者返回NULL
  8049d4:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8049d8:	e9 3f 01 00 00       	jmp    804b1c <palloc+0x2ac>
                }
                int addr=get_phyaddr(new_pg);
  8049dd:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  8049e0:	89 c7                	mov    edi,eax
  8049e2:	e8 18 ce ff ff       	call   8017ff <get_phyaddr>
  8049e7:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
                set_page_item(tblp,addr,PAGE_PRESENT|\
  8049ea:	8b 4d c4             	mov    ecx,DWORD PTR [rbp-0x3c]
  8049ed:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8049f1:	ba 07 00 00 00       	mov    edx,0x7
  8049f6:	89 ce                	mov    esi,ecx
  8049f8:	48 89 c7             	mov    rdi,rax
  8049fb:	e8 12 ce ff ff       	call   801812 <set_page_item>
                PAGE_RWX|PAGE_FOR_ALL);
                int laddr=i*0x400000+j*0x1000;//线性地址
  804a00:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804a03:	c1 e0 0a             	shl    eax,0xa
  804a06:	89 c2                	mov    edx,eax
  804a08:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804a0b:	01 d0                	add    eax,edx
  804a0d:	c1 e0 0c             	shl    eax,0xc
  804a10:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
                if(ptr==NULL)
  804a13:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
  804a18:	75 09                	jne    804a23 <palloc+0x1b3>
                {
                   // ptr=laddr;
                    palloc_paddr=addr;
  804a1a:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  804a1d:	89 05 b1 08 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc108b1],eax        # 4152d4 <palloc_paddr>
                }
                page_c--;
  804a23:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
                c++;
  804a27:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                if(page_c==0)
  804a2b:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  804a2f:	0f 85 b6 00 00 00    	jne    804aeb <palloc+0x27b>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  804a35:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804a38:	48 98                	cdqe   
  804a3a:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804a41:	48 05 a8 85 40 00    	add    rax,0x4085a8
  804a47:	0f b7 00             	movzx  eax,WORD PTR [rax]
  804a4a:	0f b7 c0             	movzx  eax,ax
  804a4d:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  804a50:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804a53:	48 98                	cdqe   
  804a55:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804a5c:	48 05 a0 85 40 00    	add    rax,0x4085a0
  804a62:	0f b7 40 0d          	movzx  eax,WORD PTR [rax+0xd]
  804a66:	0f b7 c0             	movzx  eax,ax
  804a69:	c1 e0 10             	shl    eax,0x10
  804a6c:	25 00 00 0f 00       	and    eax,0xf0000
  804a71:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    size+=c;
  804a74:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804a77:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  804a7a:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  804a7d:	89 c2                	mov    edx,eax
  804a7f:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804a82:	48 98                	cdqe   
  804a84:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804a8b:	48 05 a8 85 40 00    	add    rax,0x4085a8
  804a91:	66 89 10             	mov    WORD PTR [rax],dx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  804a94:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804a97:	48 98                	cdqe   
  804a99:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804aa0:	48 05 a0 85 40 00    	add    rax,0x4085a0
  804aa6:	0f b7 40 0d          	movzx  eax,WORD PTR [rax+0xd]
  804aaa:	0f b7 c0             	movzx  eax,ax
  804aad:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    tmp_attr&=0xfff0;
  804ab0:	81 65 b8 f0 ff 00 00 	and    DWORD PTR [rbp-0x48],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  804ab7:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  804aba:	c1 e8 10             	shr    eax,0x10
  804abd:	83 e0 0f             	and    eax,0xf
  804ac0:	89 c2                	mov    edx,eax
  804ac2:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  804ac5:	01 d0                	add    eax,edx
  804ac7:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  804aca:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  804acd:	89 c2                	mov    edx,eax
  804acf:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804ad2:	48 98                	cdqe   
  804ad4:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804adb:	48 05 a0 85 40 00    	add    rax,0x4085a0
  804ae1:	66 89 50 0d          	mov    WORD PTR [rax+0xd],dx
                    return ptr;
  804ae5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804ae9:	eb 31                	jmp    804b1c <palloc+0x2ac>
                }
            }
            tblp++;
  804aeb:	48 83 45 e0 08       	add    QWORD PTR [rbp-0x20],0x8
        for(int j=0;j<1024;j++)
  804af0:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  804af4:	81 7d dc ff 03 00 00 	cmp    DWORD PTR [rbp-0x24],0x3ff
  804afb:	0f 8e f5 fd ff ff    	jle    8048f6 <palloc+0x86>
        }
        pgind++;
  804b01:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  804b06:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804b0a:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  804b11:	0f 8e c3 fd ff ff    	jle    8048da <palloc+0x6a>
    }
    return NULL;
  804b17:	b8 00 00 00 00       	mov    eax,0x0
}
  804b1c:	c9                   	leave  
  804b1d:	c3                   	ret    

0000000000804b1e <malloc>:
//为当前进程申请新的内存，并返回这块内存的线性地址。
void* malloc(int size)
{
  804b1e:	f3 0f 1e fa          	endbr64 
  804b22:	55                   	push   rbp
  804b23:	48 89 e5             	mov    rbp,rsp
  804b26:	48 83 ec 10          	sub    rsp,0x10
  804b2a:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return palloc(cur_proc,size);
  804b2d:	8b 05 99 07 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10799]        # 4152cc <cur_proc>
  804b33:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804b36:	89 d6                	mov    esi,edx
  804b38:	89 c7                	mov    edi,eax
  804b3a:	e8 31 fd ff ff       	call   804870 <palloc>
}
  804b3f:	c9                   	leave  
  804b40:	c3                   	ret    

0000000000804b41 <proc_end>:
void proc_end()
{
  804b41:	f3 0f 1e fa          	endbr64 
  804b45:	55                   	push   rbp
  804b46:	48 89 e5             	mov    rbp,rsp
  804b49:	48 83 ec 10          	sub    rsp,0x10
    int ret;
    asm volatile("mov %%eax,%0":"=m"(ret));
  804b4d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("proc #%d ended with retv %d.\n",cur_proc,ret);
    //切换堆栈
    //asm volatile("mov %0,%%rsp"::"r"(task[0].tss.esp));
    del_proc(cur_proc);
  804b50:	8b 05 76 07 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10776]        # 4152cc <cur_proc>
  804b56:	89 c7                	mov    edi,eax
  804b58:	e8 75 00 00 00       	call   804bd2 <del_proc>
    if(task[cur_proc].parent_pid!=-1){
  804b5d:	8b 05 69 07 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10769]        # 4152cc <cur_proc>
  804b63:	48 98                	cdqe   
  804b65:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804b6c:	48 05 dc 85 40 00    	add    rax,0x4085dc
  804b72:	8b 00                	mov    eax,DWORD PTR [rax]
  804b74:	83 f8 ff             	cmp    eax,0xffffffff
  804b77:	74 4c                	je     804bc5 <proc_end+0x84>
        task[task[cur_proc].parent_pid].stat=TASK_READY;
  804b79:	8b 05 4d 07 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1074d]        # 4152cc <cur_proc>
  804b7f:	48 98                	cdqe   
  804b81:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804b88:	48 05 dc 85 40 00    	add    rax,0x4085dc
  804b8e:	8b 00                	mov    eax,DWORD PTR [rax]
  804b90:	89 c0                	mov    eax,eax
  804b92:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804b99:	48 05 58 85 40 00    	add    rax,0x408558
  804b9f:	c7 00 02 00 00 00    	mov    DWORD PTR [rax],0x2
        switch_proc_tss(task[cur_proc].parent_pid);
  804ba5:	8b 05 21 07 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10721]        # 4152cc <cur_proc>
  804bab:	48 98                	cdqe   
  804bad:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804bb4:	48 05 dc 85 40 00    	add    rax,0x4085dc
  804bba:	8b 00                	mov    eax,DWORD PTR [rax]
  804bbc:	89 c7                	mov    edi,eax
  804bbe:	e8 ae fb ff ff       	call   804771 <switch_proc_tss>
    }
    else
        switch_proc_tss(0);
    //syscall(SYSCALL_DEL_PROC,cur_proc,0,0,0,0);
}
  804bc3:	eb 0a                	jmp    804bcf <proc_end+0x8e>
        switch_proc_tss(0);
  804bc5:	bf 00 00 00 00       	mov    edi,0x0
  804bca:	e8 a2 fb ff ff       	call   804771 <switch_proc_tss>
}
  804bcf:	90                   	nop
  804bd0:	c9                   	leave  
  804bd1:	c3                   	ret    

0000000000804bd2 <del_proc>:
void del_proc(int pnr)
{
  804bd2:	f3 0f 1e fa          	endbr64 
  804bd6:	55                   	push   rbp
  804bd7:	48 89 e5             	mov    rbp,rsp
  804bda:	48 83 ec 20          	sub    rsp,0x20
  804bde:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    task[pnr].stat=TASK_ZOMBIE;
  804be1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804be4:	48 98                	cdqe   
  804be6:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804bed:	48 05 58 85 40 00    	add    rax,0x408558
  804bf3:	c7 00 04 00 00 00    	mov    DWORD PTR [rax],0x4
//    task[pnr].pid=-1;
    //释放申请的页面
    release_mmap(&task[pnr]);
  804bf9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804bfc:	48 98                	cdqe   
  804bfe:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804c05:	48 05 40 85 40 00    	add    rax,0x408540
  804c0b:	48 89 c7             	mov    rdi,rax
  804c0e:	e8 a7 11 00 00       	call   805dba <release_mmap>
    //释放存放页目录的页面
    vmfree(task[pnr].pml4);
  804c13:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804c16:	48 98                	cdqe   
  804c18:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804c1f:	48 05 00 86 40 00    	add    rax,0x408600
  804c25:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804c28:	48 89 c7             	mov    rdi,rax
  804c2b:	e8 a1 c6 ff ff       	call   8012d1 <vmfree>
    //关闭打开的文件
    for(int i=3;i<MAX_PROC_OPENF;i++){
  804c30:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [rbp-0x4],0x3
  804c37:	eb 38                	jmp    804c71 <del_proc+0x9f>
        if(task[pnr].openf[i]){
  804c39:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804c3c:	48 98                	cdqe   
  804c3e:	48 8d 50 1a          	lea    rdx,[rax+0x1a]
  804c42:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804c45:	48 98                	cdqe   
  804c47:	48 c1 e2 03          	shl    rdx,0x3
  804c4b:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804c52:	48 01 d0             	add    rax,rdx
  804c55:	48 05 48 85 40 00    	add    rax,0x408548
  804c5b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804c5e:	48 85 c0             	test   rax,rax
  804c61:	74 0a                	je     804c6d <del_proc+0x9b>
            sys_close(i);
  804c63:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804c66:	89 c7                	mov    edi,eax
  804c68:	e8 ea 3d 00 00       	call   808a57 <sys_close>
    for(int i=3;i<MAX_PROC_OPENF;i++){
  804c6d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  804c71:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  804c75:	7e c2                	jle    804c39 <del_proc+0x67>
        }
    }
    //三个std判断一下是否是会话leader，是的话再关闭
    if(task[pnr].sid==task[pnr].pid){
  804c77:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804c7a:	48 98                	cdqe   
  804c7c:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804c83:	48 05 48 85 40 00    	add    rax,0x408548
  804c89:	8b 10                	mov    edx,DWORD PTR [rax]
  804c8b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804c8e:	48 98                	cdqe   
  804c90:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804c97:	48 05 40 85 40 00    	add    rax,0x408540
  804c9d:	8b 00                	mov    eax,DWORD PTR [rax]
  804c9f:	39 c2                	cmp    edx,eax
  804ca1:	75 45                	jne    804ce8 <del_proc+0x116>
        //tty和console断联
        sys_ioctl(0,TTY_DISCONNECT,0);
  804ca3:	ba 00 00 00 00       	mov    edx,0x0
  804ca8:	be 02 00 00 00       	mov    esi,0x2
  804cad:	bf 00 00 00 00       	mov    edi,0x0
  804cb2:	e8 d3 1a 00 00       	call   80678a <sys_ioctl>
        sys_close(0);
  804cb7:	bf 00 00 00 00       	mov    edi,0x0
  804cbc:	e8 96 3d 00 00       	call   808a57 <sys_close>
        sys_close(1);
  804cc1:	bf 01 00 00 00       	mov    edi,0x1
  804cc6:	e8 8c 3d 00 00       	call   808a57 <sys_close>
        sys_close(2);
  804ccb:	bf 02 00 00 00       	mov    edi,0x2
  804cd0:	e8 82 3d 00 00       	call   808a57 <sys_close>
        //然后,关闭所有前台进程组的进程
        for(int i=0;i<MAX_TASKS;i++){
  804cd5:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  804cdc:	eb 04                	jmp    804ce2 <del_proc+0x110>
  804cde:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  804ce2:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  804ce6:	7e f6                	jle    804cde <del_proc+0x10c>
    }
    //TODO 给子进程发送SIGHUP信号结束他们
    //
    //从进程中解除cr3,tss和ldt
    //switch_proc_tss(task[pnr]);
}
  804ce8:	90                   	nop
  804ce9:	c9                   	leave  
  804cea:	c3                   	ret    

0000000000804ceb <set_proc_stat>:

int set_proc_stat(int pid,int stat)
{
  804ceb:	f3 0f 1e fa          	endbr64 
  804cef:	55                   	push   rbp
  804cf0:	48 89 e5             	mov    rbp,rsp
  804cf3:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  804cf6:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==-1)return -1;
  804cf9:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  804cfd:	75 07                	jne    804d06 <set_proc_stat+0x1b>
  804cff:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804d04:	eb 79                	jmp    804d7f <set_proc_stat+0x94>
    int i=0;
  804d06:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;task[i].pid!=pid;i++);
  804d0d:	eb 04                	jmp    804d13 <set_proc_stat+0x28>
  804d0f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  804d13:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804d16:	48 98                	cdqe   
  804d18:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804d1f:	48 05 40 85 40 00    	add    rax,0x408540
  804d25:	8b 10                	mov    edx,DWORD PTR [rax]
  804d27:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804d2a:	39 c2                	cmp    edx,eax
  804d2c:	75 e1                	jne    804d0f <set_proc_stat+0x24>
    if(i==MAX_PROC_COUNT)return -1;
  804d2e:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  804d32:	75 07                	jne    804d3b <set_proc_stat+0x50>
  804d34:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804d39:	eb 44                	jmp    804d7f <set_proc_stat+0x94>
    task[i].stat=stat;
  804d3b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804d3e:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804d41:	48 63 d2             	movsxd rdx,edx
  804d44:	48 69 d2 34 03 00 00 	imul   rdx,rdx,0x334
  804d4b:	48 81 c2 58 85 40 00 	add    rdx,0x408558
  804d52:	89 02                	mov    DWORD PTR [rdx],eax
    //如果这就是正在运行的进程，那么马上停止
    if(cur_proc==i)
  804d54:	8b 05 72 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10572]        # 4152cc <cur_proc>
  804d5a:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  804d5d:	75 1b                	jne    804d7a <set_proc_stat+0x8f>
        task[cur_proc].utime=MAX_UTIME;
  804d5f:	8b 05 67 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10567]        # 4152cc <cur_proc>
  804d65:	48 98                	cdqe   
  804d67:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804d6e:	48 05 5c 85 40 00    	add    rax,0x40855c
  804d74:	c7 00 0a 00 00 00    	mov    DWORD PTR [rax],0xa
    return 0;
  804d7a:	b8 00 00 00 00       	mov    eax,0x0
}
  804d7f:	5d                   	pop    rbp
  804d80:	c3                   	ret    

0000000000804d81 <sys_exit>:
//}
/*
 * 进程结束。
 * */
int sys_exit(int code)
{
  804d81:	f3 0f 1e fa          	endbr64 
  804d85:	55                   	push   rbp
  804d86:	48 89 e5             	mov    rbp,rsp
  804d89:	48 83 ec 10          	sub    rsp,0x10
  804d8d:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    current->exit_code=code;
  804d90:	48 8b 05 a9 04 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc104a9]        # 415240 <current>
  804d97:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804d9a:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
    del_proc(cur_proc);
  804d9d:	8b 05 29 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10529]        # 4152cc <cur_proc>
  804da3:	89 c7                	mov    edi,eax
  804da5:	e8 28 fe ff ff       	call   804bd2 <del_proc>
    while(1)
        manage_proc();
  804daa:	b8 00 00 00 00       	mov    eax,0x0
  804daf:	e8 2a f8 ff ff       	call   8045de <manage_proc>
  804db4:	eb f4                	jmp    804daa <sys_exit+0x29>

0000000000804db6 <reg_proc>:
    dllmain(NULL,0,NULL);
    
}*/

int reg_proc(addr_t entry, struct index_node *cwd, struct index_node *exef)
{
  804db6:	f3 0f 1e fa          	endbr64 
  804dba:	55                   	push   rbp
  804dbb:	48 89 e5             	mov    rbp,rsp
  804dbe:	53                   	push   rbx
  804dbf:	48 83 ec 48          	sub    rsp,0x48
  804dc3:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  804dc7:	48 89 75 c0          	mov    QWORD PTR [rbp-0x40],rsi
  804dcb:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
    
    int i=req_proc();
  804dcf:	b8 00 00 00 00       	mov    eax,0x0
  804dd4:	e8 78 f5 ff ff       	call   804351 <req_proc>
  804dd9:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(i==-1)return -1;
  804ddc:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  804de0:	75 0a                	jne    804dec <reg_proc+0x36>
  804de2:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804de7:	e9 8c 01 00 00       	jmp    804f78 <reg_proc+0x1c2>

    //栈顶设置在了4G处
    set_proc(0, 0, 0, 0, DS_USER, CS_USER, DS_USER, DS_USER\
  804dec:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  804df0:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  804df3:	52                   	push   rdx
  804df4:	6a 00                	push   0x0
  804df6:	50                   	push   rax
  804df7:	6a 00                	push   0x0
  804df9:	6a 00                	push   0x0
  804dfb:	6a 00                	push   0x0
  804dfd:	68 00 f0 ff ff       	push   0xfffffffffffff000
  804e02:	c7 44 24 04 ff ff 00 	mov    DWORD PTR [rsp+0x4],0xffff
  804e09:	00 
  804e0a:	6a 28                	push   0x28
  804e0c:	6a 28                	push   0x28
  804e0e:	6a 28                	push   0x28
  804e10:	6a 28                	push   0x28
  804e12:	41 b9 30 00 00 00    	mov    r9d,0x30
  804e18:	41 b8 28 00 00 00    	mov    r8d,0x28
  804e1e:	b9 00 00 00 00       	mov    ecx,0x0
  804e23:	ba 00 00 00 00       	mov    edx,0x0
  804e28:	be 00 00 00 00       	mov    esi,0x0
  804e2d:	bf 00 00 00 00       	mov    edi,0x0
  804e32:	e8 e5 f5 ff ff       	call   80441c <set_proc>
  804e37:	48 83 c4 58          	add    rsp,0x58
, DS_USER, DS_USER, STACK_TOP, 0, 0, 0, entry, 0, i);
    task[i].pml4=vmalloc();
  804e3b:	b8 00 00 00 00       	mov    eax,0x0
  804e40:	e8 fd c3 ff ff       	call   801242 <vmalloc>
  804e45:	48 89 c2             	mov    rdx,rax
  804e48:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804e4b:	48 98                	cdqe   
  804e4d:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804e54:	48 05 00 86 40 00    	add    rax,0x408600
  804e5a:	48 89 10             	mov    QWORD PTR [rax],rdx
    task[i].pml4[0]=vmalloc();
  804e5d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804e60:	48 98                	cdqe   
  804e62:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804e69:	48 05 00 86 40 00    	add    rax,0x408600
  804e6f:	48 8b 18             	mov    rbx,QWORD PTR [rax]
  804e72:	b8 00 00 00 00       	mov    eax,0x0
  804e77:	e8 c6 c3 ff ff       	call   801242 <vmalloc>
  804e7c:	48 89 03             	mov    QWORD PTR [rbx],rax
    unsigned long *pdpt=task[i].pml4;
  804e7f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804e82:	48 98                	cdqe   
  804e84:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804e8b:	48 05 00 86 40 00    	add    rax,0x408600
  804e91:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804e94:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    //pdpt第一项(0-1GB)设置为内核空间，这样才能访问中断
    set_1gb_pdpt(pdpt,0,PAGE_PRESENT|PAGE_RWX);
  804e98:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804e9c:	ba 03 00 00 00       	mov    edx,0x3
  804ea1:	be 00 00 00 00       	mov    esi,0x0
  804ea6:	48 89 c7             	mov    rdi,rax
  804ea9:	e8 b5 c9 ff ff       	call   801863 <set_1gb_pdpt>

    //申请一项pd,里面申请一2mb页用于堆栈
    addr_t *stackb=vmalloc();
  804eae:	b8 00 00 00 00       	mov    eax,0x0
  804eb3:	e8 8a c3 ff ff       	call   801242 <vmalloc>
  804eb8:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    pdpt[3]=(unsigned long)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//3-4G分配栈空间
  804ebc:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  804ec0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804ec4:	48 83 c0 18          	add    rax,0x18
  804ec8:	48 83 ca 07          	or     rdx,0x7
  804ecc:	48 89 10             	mov    QWORD PTR [rax],rdx
    set_2mb_pde(stackb + 511, get_phyaddr(req_a_page()), PAGE_FOR_ALL|PAGE_RWX);
  804ecf:	b8 00 00 00 00       	mov    eax,0x0
  804ed4:	e8 37 c7 ff ff       	call   801610 <req_a_page>
  804ed9:	89 c7                	mov    edi,eax
  804edb:	e8 1f c9 ff ff       	call   8017ff <get_phyaddr>
  804ee0:	89 c1                	mov    ecx,eax
  804ee2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804ee6:	48 05 f8 0f 00 00    	add    rax,0xff8
  804eec:	ba 06 00 00 00       	mov    edx,0x6
  804ef1:	89 ce                	mov    esi,ecx
  804ef3:	48 89 c7             	mov    rdi,rax
  804ef6:	e8 bf c9 ff ff       	call   8018ba <set_2mb_pde>
    task[i].regs.cr3=task[i].pml4;
  804efb:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804efe:	48 98                	cdqe   
  804f00:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804f07:	48 05 00 86 40 00    	add    rax,0x408600
  804f0d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804f10:	48 89 c2             	mov    rdx,rax
  804f13:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804f16:	48 98                	cdqe   
  804f18:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804f1f:	48 05 80 87 40 00    	add    rax,0x408780
  804f25:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx

    task[i].stat=TASK_READY;
  804f29:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804f2c:	48 98                	cdqe   
  804f2e:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804f35:	48 05 58 85 40 00    	add    rax,0x408558
  804f3b:	c7 00 02 00 00 00    	mov    DWORD PTR [rax],0x2
    task[i].cwd=cwd;
  804f41:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804f44:	48 98                	cdqe   
  804f46:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804f4d:	48 8d 90 08 86 40 00 	lea    rdx,[rax+0x408608]
  804f54:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804f58:	48 89 02             	mov    QWORD PTR [rdx],rax
    task[i].exef=exef;
  804f5b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804f5e:	48 98                	cdqe   
  804f60:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804f67:	48 8d 90 10 86 40 00 	lea    rdx,[rax+0x408610]
  804f6e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  804f72:	48 89 02             	mov    QWORD PTR [rdx],rax

    return i;
  804f75:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    proc_ret_stack *pstack=stack_paddr+stack_size-12;
    pstack->argc=0;
    pstack->argv=0;
    pstack->proc_end_addr=proc_end;
    int *pptr=pstack;*/
}
  804f78:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804f7c:	c9                   	leave  
  804f7d:	c3                   	ret    

0000000000804f7e <sys_malloc>:

void * sys_malloc(int size)
{
  804f7e:	f3 0f 1e fa          	endbr64 
  804f82:	55                   	push   rbp
  804f83:	48 89 e5             	mov    rbp,rsp
  804f86:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    //
    int n=size/CHUNK_SIZE+size%CHUNK_SIZE?1:0;
  804f89:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804f8c:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  804f92:	85 c0                	test   eax,eax
  804f94:	0f 48 c2             	cmovs  eax,edx
  804f97:	c1 f8 0c             	sar    eax,0xc
  804f9a:	89 c1                	mov    ecx,eax
  804f9c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804f9f:	99                   	cdq    
  804fa0:	c1 ea 14             	shr    edx,0x14
  804fa3:	01 d0                	add    eax,edx
  804fa5:	25 ff 0f 00 00       	and    eax,0xfff
  804faa:	29 d0                	sub    eax,edx
  804fac:	01 c8                	add    eax,ecx
  804fae:	85 c0                	test   eax,eax
  804fb0:	0f 95 c0             	setne  al
  804fb3:	0f b6 c0             	movzx  eax,al
  804fb6:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    chunk_header *hp=(chunk_header*)task[cur_proc].mem_struct.heap_base;
  804fb9:	8b 05 0d 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1030d]        # 4152cc <cur_proc>
  804fbf:	48 98                	cdqe   
  804fc1:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  804fc8:	48 05 68 85 40 00    	add    rax,0x408568
  804fce:	8b 00                	mov    eax,DWORD PTR [rax]
  804fd0:	48 98                	cdqe   
  804fd2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804fd6:	eb 0c                	jmp    804fe4 <sys_malloc+0x66>
        hp=hp->next;
  804fd8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804fdc:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804fe0:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804fe4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804fe8:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804fec:	48 85 c0             	test   rax,rax
  804fef:	74 16                	je     805007 <sys_malloc+0x89>
  804ff1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804ff5:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804ff8:	85 c0                	test   eax,eax
  804ffa:	75 0b                	jne    805007 <sys_malloc+0x89>
  804ffc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805000:	8b 00                	mov    eax,DWORD PTR [rax]
  805002:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  805005:	7e d1                	jle    804fd8 <sys_malloc+0x5a>
    if(hp->pgn<n)
  805007:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80500b:	8b 00                	mov    eax,DWORD PTR [rax]
  80500d:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  805010:	7e 7f                	jle    805091 <sys_malloc+0x113>
    {
        //上抬heap top
        if(task[cur_proc].mem_struct.heap_top+CHUNK_SIZE*n>=HEAP_MAXTOP)
  805012:	8b 05 b4 02 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc102b4]        # 4152cc <cur_proc>
  805018:	48 98                	cdqe   
  80501a:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805021:	48 05 6c 85 40 00    	add    rax,0x40856c
  805027:	8b 10                	mov    edx,DWORD PTR [rax]
  805029:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80502c:	c1 e0 0c             	shl    eax,0xc
  80502f:	01 d0                	add    eax,edx
  805031:	3d ff ff ef 01       	cmp    eax,0x1efffff
  805036:	7e 0a                	jle    805042 <sys_malloc+0xc4>
        {
            //超过顶部
            return NULL;
  805038:	b8 00 00 00 00       	mov    eax,0x0
  80503d:	e9 c8 00 00 00       	jmp    80510a <sys_malloc+0x18c>
        }
        int needed=n-hp->pgn;
  805042:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805046:	8b 10                	mov    edx,DWORD PTR [rax]
  805048:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80504b:	29 d0                	sub    eax,edx
  80504d:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
        char* p=task[cur_proc].mem_struct.heap_top;
  805050:	8b 05 76 02 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10276]        # 4152cc <cur_proc>
  805056:	48 98                	cdqe   
  805058:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80505f:	48 05 6c 85 40 00    	add    rax,0x40856c
  805065:	8b 00                	mov    eax,DWORD PTR [rax]
  805067:	48 98                	cdqe   
  805069:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  80506d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  805074:	eb 13                	jmp    805089 <sys_malloc+0x10b>
        {
            *p=0;//触发缺页中断
  805076:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80507a:	c6 00 00             	mov    BYTE PTR [rax],0x0
            p+=PAGE_SIZE;
  80507d:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  805084:	00 
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  805085:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  805089:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80508c:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80508f:	7c e5                	jl     805076 <sys_malloc+0xf8>
        }
    }
    if(hp->pgn>n)
  805091:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805095:	8b 00                	mov    eax,DWORD PTR [rax]
  805097:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  80509a:	7d 59                	jge    8050f5 <sys_malloc+0x177>
    {
        //在后面新建一个头
        char *p=hp;
  80509c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8050a0:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        p+=(n+1)*CHUNK_SIZE;//算上存储头一个
  8050a4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8050a7:	83 c0 01             	add    eax,0x1
  8050aa:	c1 e0 0c             	shl    eax,0xc
  8050ad:	48 98                	cdqe   
  8050af:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
        chunk_header *np=p;
  8050b3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8050b7:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
        np->pgn=hp->pgn-n-1;
  8050bb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8050bf:	8b 00                	mov    eax,DWORD PTR [rax]
  8050c1:	2b 45 e8             	sub    eax,DWORD PTR [rbp-0x18]
  8050c4:	8d 50 ff             	lea    edx,[rax-0x1]
  8050c7:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8050cb:	89 10                	mov    DWORD PTR [rax],edx
        np->next=hp->next;
  8050cd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8050d1:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  8050d5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8050d9:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
        np->prev=hp;
  8050dd:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8050e1:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8050e5:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
        hp->next=np;
  8050e9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8050ed:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8050f1:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    }
    hp->alloc=1;//分配完毕
  8050f5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8050f9:	c7 40 04 01 00 00 00 	mov    DWORD PTR [rax+0x4],0x1
    return (char*)hp+CHUNK_SIZE;//返回后边的第一个数据块地址
  805100:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805104:	48 05 00 10 00 00    	add    rax,0x1000
}
  80510a:	5d                   	pop    rbp
  80510b:	c3                   	ret    

000000000080510c <sys_free>:
int sys_free(int ptr)
{
  80510c:	f3 0f 1e fa          	endbr64 
  805110:	55                   	push   rbp
  805111:	48 89 e5             	mov    rbp,rsp
  805114:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    chunk_header *hp=ptr-CHUNK_SIZE;//回退到头
  805117:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80511a:	2d 00 10 00 00       	sub    eax,0x1000
  80511f:	48 98                	cdqe   
  805121:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    hp->alloc=0;    //合并
  805125:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805129:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
    //向后合并
    chunk_header *p=hp->next;
  805130:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805134:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  805138:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  80513c:	eb 2e                	jmp    80516c <sys_free+0x60>
    {
        if(p->alloc==0)
  80513e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805142:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805145:	85 c0                	test   eax,eax
  805147:	75 2c                	jne    805175 <sys_free+0x69>
        {
            hp->pgn+=p->pgn+1;//把区域合并
  805149:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80514d:	8b 10                	mov    edx,DWORD PTR [rax]
  80514f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805153:	8b 00                	mov    eax,DWORD PTR [rax]
  805155:	83 c0 01             	add    eax,0x1
  805158:	01 c2                	add    edx,eax
  80515a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80515e:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->next;
  805160:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805164:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  805168:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  80516c:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  805171:	75 cb                	jne    80513e <sys_free+0x32>
  805173:	eb 01                	jmp    805176 <sys_free+0x6a>
            break;
  805175:	90                   	nop
    }
    //向前合并
    p=hp->prev;
  805176:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80517a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80517e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  805182:	eb 2e                	jmp    8051b2 <sys_free+0xa6>
    {
        if(p->alloc==0)
  805184:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805188:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80518b:	85 c0                	test   eax,eax
  80518d:	75 2c                	jne    8051bb <sys_free+0xaf>
        {
            p->pgn+=hp->pgn+1;//把区域合并
  80518f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805193:	8b 10                	mov    edx,DWORD PTR [rax]
  805195:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805199:	8b 00                	mov    eax,DWORD PTR [rax]
  80519b:	83 c0 01             	add    eax,0x1
  80519e:	01 c2                	add    edx,eax
  8051a0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8051a4:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->prev;
  8051a6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8051aa:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8051ae:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  8051b2:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8051b7:	75 cb                	jne    805184 <sys_free+0x78>
  8051b9:	eb 01                	jmp    8051bc <sys_free+0xb0>
            break;
  8051bb:	90                   	nop
    }
    //合并完成
    return 0;
  8051bc:	b8 00 00 00 00       	mov    eax,0x0
}
  8051c1:	5d                   	pop    rbp
  8051c2:	c3                   	ret    

00000000008051c3 <switch_to>:

void switch_to(struct process *from, struct process *to) {
  8051c3:	f3 0f 1e fa          	endbr64 
  8051c7:	55                   	push   rbp
  8051c8:	48 89 e5             	mov    rbp,rsp
  8051cb:	53                   	push   rbx
  8051cc:	48 89 7d f0          	mov    QWORD PTR [rbp-0x10],rdi
  8051d0:	48 89 75 e8          	mov    QWORD PTR [rbp-0x18],rsi
    cur_proc=to-task;
  8051d4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8051d8:	48 2d 40 85 40 00    	sub    rax,0x408540
  8051de:	48 c1 f8 02          	sar    rax,0x2
  8051e2:	48 89 c2             	mov    rdx,rax
  8051e5:	48 b8 05 ec 4f c0 fe 	movabs rax,0x4fec04fec04fec05
  8051ec:	04 ec 4f 
  8051ef:	48 0f af c2          	imul   rax,rdx
  8051f3:	89 05 d3 00 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc100d3],eax        # 4152cc <cur_proc>
    current=&task[cur_proc];
  8051f9:	8b 05 cd 00 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc100cd]        # 4152cc <cur_proc>
  8051ff:	48 98                	cdqe   
  805201:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805208:	48 05 40 85 40 00    	add    rax,0x408540
  80520e:	48 89 05 2b 00 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1002b],rax        # 415240 <current>
    asm volatile("mov %0,%%rax\n"
  805215:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805219:	48 8b 80 c0 00 00 00 	mov    rax,QWORD PTR [rax+0xc0]
  805220:	0f 22 d8             	mov    cr3,rax
                 "mov %%rax,%%cr3\n":"=m"(to->pml4));
    asm volatile("mov %%rsp,%0\r\n"
  805223:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  805227:	4c 8b 55 f0          	mov    r10,QWORD PTR [rbp-0x10]
  80522b:	4c 8b 5d f0          	mov    r11,QWORD PTR [rbp-0x10]
  80522f:	48 8b 5d f0          	mov    rbx,QWORD PTR [rbp-0x10]
  805233:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805237:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80523b:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  80523f:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  805243:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  805247:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  80524b:	49 89 a1 7c 02 00 00 	mov    QWORD PTR [r9+0x27c],rsp
  805252:	48 8d 05 24 00 00 00 	lea    rax,[rip+0x24]        # 80527d <done>
  805259:	49 89 82 4c 02 00 00 	mov    QWORD PTR [r10+0x24c],rax
  805260:	41 8c a3 bc 02 00 00 	mov    WORD PTR [r11+0x2bc],fs
  805267:	8c ab c4 02 00 00    	mov    WORD PTR [rbx+0x2c4],gs
  80526d:	48 8b a1 7c 02 00 00 	mov    rsp,QWORD PTR [rcx+0x27c]
  805274:	41 ff b0 4c 02 00 00 	push   QWORD PTR [r8+0x24c]
  80527b:	eb 08                	jmp    805285 <__switch_to>

000000000080527d <done>:
  80527d:	90                   	nop
                 "nop":"=m"(from->regs.rsp),"=m"(from->regs.rip),
                 "=m"(from->regs.fs),"=m"(from->regs.gs):
                "m"(to->regs.fs),"m"(to->regs.gs),"m"(to->regs.rsp),"m"(to->regs.rip),
                "D"(from),"S"(to));

}
  80527e:	90                   	nop
  80527f:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  805283:	c9                   	leave  
  805284:	c3                   	ret    

0000000000805285 <__switch_to>:
void __switch_to(struct process *from, struct process *to) {
  805285:	f3 0f 1e fa          	endbr64 
  805289:	55                   	push   rbp
  80528a:	48 89 e5             	mov    rbp,rsp
  80528d:	53                   	push   rbx
  80528e:	48 83 ec 18          	sub    rsp,0x18
  805292:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  805296:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  80529a:	48 8b 05 ff 86 00 00 	mov    rax,QWORD PTR [rip+0x86ff]        # 80d9a0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  8052a1:	4c 8b 50 54          	mov    r10,QWORD PTR [rax+0x54]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  8052a5:	48 8b 05 f4 86 00 00 	mov    rax,QWORD PTR [rip+0x86f4]        # 80d9a0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  8052ac:	4c 8b 48 4c          	mov    r9,QWORD PTR [rax+0x4c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  8052b0:	48 8b 05 e9 86 00 00 	mov    rax,QWORD PTR [rip+0x86e9]        # 80d9a0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  8052b7:	4c 8b 40 44          	mov    r8,QWORD PTR [rax+0x44]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  8052bb:	48 8b 05 de 86 00 00 	mov    rax,QWORD PTR [rip+0x86de]        # 80d9a0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  8052c2:	48 8b 78 3c          	mov    rdi,QWORD PTR [rax+0x3c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  8052c6:	48 8b 05 d3 86 00 00 	mov    rax,QWORD PTR [rip+0x86d3]        # 80d9a0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  8052cd:	48 8b 58 34          	mov    rbx,QWORD PTR [rax+0x34]
  8052d1:	48 8b 05 c8 86 00 00 	mov    rax,QWORD PTR [rip+0x86c8]        # 80d9a0 <tss>
  8052d8:	4c 8b 58 2c          	mov    r11,QWORD PTR [rax+0x2c]
  8052dc:	48 8b 05 bd 86 00 00 	mov    rax,QWORD PTR [rip+0x86bd]        # 80d9a0 <tss>
  8052e3:	48 8b 48 24          	mov    rcx,QWORD PTR [rax+0x24]
  8052e7:	48 8b 05 b2 86 00 00 	mov    rax,QWORD PTR [rip+0x86b2]        # 80d9a0 <tss>
  8052ee:	48 8b 50 14          	mov    rdx,QWORD PTR [rax+0x14]
  8052f2:	48 8b 05 a7 86 00 00 	mov    rax,QWORD PTR [rip+0x86a7]        # 80d9a0 <tss>
  8052f9:	48 8b 70 0c          	mov    rsi,QWORD PTR [rax+0xc]
  8052fd:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805301:	48 8b 80 dc 01 00 00 	mov    rax,QWORD PTR [rax+0x1dc]
  805308:	41 52                	push   r10
  80530a:	41 51                	push   r9
  80530c:	41 50                	push   r8
  80530e:	57                   	push   rdi
  80530f:	49 89 d9             	mov    r9,rbx
  805312:	4d 89 d8             	mov    r8,r11
  805315:	48 89 c7             	mov    rdi,rax
  805318:	e8 34 00 00 00       	call   805351 <set_tss>
  80531d:	48 83 c4 20          	add    rsp,0x20
    asm volatile("mov %%fs,%0\r\n"
  805321:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805325:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  805329:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80532d:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  805331:	8c a0 bc 02 00 00    	mov    WORD PTR [rax+0x2bc],fs
  805337:	8c ae c4 02 00 00    	mov    WORD PTR [rsi+0x2c4],gs
  80533d:	8e a2 bc 02 00 00    	mov    fs,WORD PTR [rdx+0x2bc]
  805343:	8e a9 c4 02 00 00    	mov    gs,WORD PTR [rcx+0x2c4]
  805349:	fb                   	sti    
                 "mov %%gs,%1\r\n"
                 "mov %2,%%fs\r\n"
                 "mov %3,%%gs\r\n"
                 "sti":"=m"(to->regs.fs),"=m"(to->regs.gs):
                 "m"(from->regs.fs),"m"(from->regs.gs));
}
  80534a:	90                   	nop
  80534b:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80534f:	c9                   	leave  
  805350:	c3                   	ret    

0000000000805351 <set_tss>:

void set_tss(u64 rsp0,u64 rsp1,u64 rsp2,u64 ist0,u64 ist1,u64 ist2,u64 ist3,u64 ist4,u64 ist5,u64 ist6){
  805351:	f3 0f 1e fa          	endbr64 
  805355:	55                   	push   rbp
  805356:	48 89 e5             	mov    rbp,rsp
  805359:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80535d:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  805361:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  805365:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  805369:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
  80536d:	4c 89 4d d0          	mov    QWORD PTR [rbp-0x30],r9
    tss->rsp0=rsp0;
  805371:	48 8b 05 28 86 00 00 	mov    rax,QWORD PTR [rip+0x8628]        # 80d9a0 <tss>
  805378:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80537c:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx
    tss->rsp1=rsp1;
  805380:	48 8b 05 19 86 00 00 	mov    rax,QWORD PTR [rip+0x8619]        # 80d9a0 <tss>
  805387:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80538b:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    tss->rsp2=rsp2;
  80538f:	48 8b 05 0a 86 00 00 	mov    rax,QWORD PTR [rip+0x860a]        # 80d9a0 <tss>
  805396:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80539a:	48 89 50 14          	mov    QWORD PTR [rax+0x14],rdx
    tss->ists[0]=ist0;
  80539e:	48 8b 05 fb 85 00 00 	mov    rax,QWORD PTR [rip+0x85fb]        # 80d9a0 <tss>
  8053a5:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  8053a9:	48 89 50 24          	mov    QWORD PTR [rax+0x24],rdx
    tss->ists[1]=ist1;
  8053ad:	48 8b 05 ec 85 00 00 	mov    rax,QWORD PTR [rip+0x85ec]        # 80d9a0 <tss>
  8053b4:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8053b8:	48 89 50 2c          	mov    QWORD PTR [rax+0x2c],rdx
    tss->ists[2]=ist2;
  8053bc:	48 8b 05 dd 85 00 00 	mov    rax,QWORD PTR [rip+0x85dd]        # 80d9a0 <tss>
  8053c3:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8053c7:	48 89 50 34          	mov    QWORD PTR [rax+0x34],rdx
    tss->ists[3]=ist3;
  8053cb:	48 8b 05 ce 85 00 00 	mov    rax,QWORD PTR [rip+0x85ce]        # 80d9a0 <tss>
  8053d2:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  8053d6:	48 89 50 3c          	mov    QWORD PTR [rax+0x3c],rdx
    tss->ists[4]=ist4;
  8053da:	48 8b 05 bf 85 00 00 	mov    rax,QWORD PTR [rip+0x85bf]        # 80d9a0 <tss>
  8053e1:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  8053e5:	48 89 50 44          	mov    QWORD PTR [rax+0x44],rdx
    tss->ists[5]=ist5;
  8053e9:	48 8b 05 b0 85 00 00 	mov    rax,QWORD PTR [rip+0x85b0]        # 80d9a0 <tss>
  8053f0:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  8053f4:	48 89 50 4c          	mov    QWORD PTR [rax+0x4c],rdx
    tss->ists[6]=ist6;
  8053f8:	48 8b 05 a1 85 00 00 	mov    rax,QWORD PTR [rip+0x85a1]        # 80d9a0 <tss>
  8053ff:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  805403:	48 89 50 54          	mov    QWORD PTR [rax+0x54],rdx
}
  805407:	90                   	nop
  805408:	5d                   	pop    rbp
  805409:	c3                   	ret    

000000000080540a <fork_child_ret>:

int fork_child_ret(){
  80540a:	f3 0f 1e fa          	endbr64 
  80540e:	55                   	push   rbp
  80540f:	48 89 e5             	mov    rbp,rsp
    return 0;
  805412:	b8 00 00 00 00       	mov    eax,0x0

}
  805417:	5d                   	pop    rbp
  805418:	c3                   	ret    

0000000000805419 <sys_fork>:

int sys_fork(void){
  805419:	f3 0f 1e fa          	endbr64 
  80541d:	55                   	push   rbp
  80541e:	48 89 e5             	mov    rbp,rsp
  805421:	53                   	push   rbx
  805422:	48 81 ec 98 00 00 00 	sub    rsp,0x98
    int pid=req_proc();
  805429:	b8 00 00 00 00       	mov    eax,0x0
  80542e:	e8 1e ef ff ff       	call   804351 <req_proc>
  805433:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(pid==-1)return -1;
  805436:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  80543a:	75 0a                	jne    805446 <sys_fork+0x2d>
  80543c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805441:	e9 6e 09 00 00       	jmp    805db4 <sys_fork+0x99b>
    task[pid].regs=current->regs;
  805446:	48 8b 05 f3 fd c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fdf3]        # 415240 <current>
  80544d:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  805450:	48 63 d2             	movsxd rdx,edx
  805453:	48 69 d2 34 03 00 00 	imul   rdx,rdx,0x334
  80545a:	48 81 c2 80 87 40 00 	add    rdx,0x408780
  805461:	48 8b 88 44 02 00 00 	mov    rcx,QWORD PTR [rax+0x244]
  805468:	48 8b 98 4c 02 00 00 	mov    rbx,QWORD PTR [rax+0x24c]
  80546f:	48 89 4a 04          	mov    QWORD PTR [rdx+0x4],rcx
  805473:	48 89 5a 0c          	mov    QWORD PTR [rdx+0xc],rbx
  805477:	48 8b 88 54 02 00 00 	mov    rcx,QWORD PTR [rax+0x254]
  80547e:	48 8b 98 5c 02 00 00 	mov    rbx,QWORD PTR [rax+0x25c]
  805485:	48 89 4a 14          	mov    QWORD PTR [rdx+0x14],rcx
  805489:	48 89 5a 1c          	mov    QWORD PTR [rdx+0x1c],rbx
  80548d:	48 8b 88 64 02 00 00 	mov    rcx,QWORD PTR [rax+0x264]
  805494:	48 8b 98 6c 02 00 00 	mov    rbx,QWORD PTR [rax+0x26c]
  80549b:	48 89 4a 24          	mov    QWORD PTR [rdx+0x24],rcx
  80549f:	48 89 5a 2c          	mov    QWORD PTR [rdx+0x2c],rbx
  8054a3:	48 8b 88 74 02 00 00 	mov    rcx,QWORD PTR [rax+0x274]
  8054aa:	48 8b 98 7c 02 00 00 	mov    rbx,QWORD PTR [rax+0x27c]
  8054b1:	48 89 4a 34          	mov    QWORD PTR [rdx+0x34],rcx
  8054b5:	48 89 5a 3c          	mov    QWORD PTR [rdx+0x3c],rbx
  8054b9:	48 8b 88 84 02 00 00 	mov    rcx,QWORD PTR [rax+0x284]
  8054c0:	48 8b 98 8c 02 00 00 	mov    rbx,QWORD PTR [rax+0x28c]
  8054c7:	48 89 4a 44          	mov    QWORD PTR [rdx+0x44],rcx
  8054cb:	48 89 5a 4c          	mov    QWORD PTR [rdx+0x4c],rbx
  8054cf:	48 8b 88 94 02 00 00 	mov    rcx,QWORD PTR [rax+0x294]
  8054d6:	48 8b 98 9c 02 00 00 	mov    rbx,QWORD PTR [rax+0x29c]
  8054dd:	48 89 4a 54          	mov    QWORD PTR [rdx+0x54],rcx
  8054e1:	48 89 5a 5c          	mov    QWORD PTR [rdx+0x5c],rbx
  8054e5:	48 8b 88 a4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2a4]
  8054ec:	48 8b 98 ac 02 00 00 	mov    rbx,QWORD PTR [rax+0x2ac]
  8054f3:	48 89 4a 64          	mov    QWORD PTR [rdx+0x64],rcx
  8054f7:	48 89 5a 6c          	mov    QWORD PTR [rdx+0x6c],rbx
  8054fb:	48 8b 88 b4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2b4]
  805502:	48 8b 98 bc 02 00 00 	mov    rbx,QWORD PTR [rax+0x2bc]
  805509:	48 89 4a 74          	mov    QWORD PTR [rdx+0x74],rcx
  80550d:	48 89 5a 7c          	mov    QWORD PTR [rdx+0x7c],rbx
  805511:	48 8b 88 c4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2c4]
  805518:	48 8b 98 cc 02 00 00 	mov    rbx,QWORD PTR [rax+0x2cc]
  80551f:	48 89 8a 84 00 00 00 	mov    QWORD PTR [rdx+0x84],rcx
  805526:	48 89 9a 8c 00 00 00 	mov    QWORD PTR [rdx+0x8c],rbx
  80552d:	48 8b 88 d4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2d4]
  805534:	48 8b 98 dc 02 00 00 	mov    rbx,QWORD PTR [rax+0x2dc]
  80553b:	48 89 8a 94 00 00 00 	mov    QWORD PTR [rdx+0x94],rcx
  805542:	48 89 9a 9c 00 00 00 	mov    QWORD PTR [rdx+0x9c],rbx
  805549:	48 8b 88 e4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2e4]
  805550:	48 8b 98 ec 02 00 00 	mov    rbx,QWORD PTR [rax+0x2ec]
  805557:	48 89 8a a4 00 00 00 	mov    QWORD PTR [rdx+0xa4],rcx
  80555e:	48 89 9a ac 00 00 00 	mov    QWORD PTR [rdx+0xac],rbx
  805565:	48 8b 88 f4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2f4]
  80556c:	48 8b 98 fc 02 00 00 	mov    rbx,QWORD PTR [rax+0x2fc]
  805573:	48 89 8a b4 00 00 00 	mov    QWORD PTR [rdx+0xb4],rcx
  80557a:	48 89 9a bc 00 00 00 	mov    QWORD PTR [rdx+0xbc],rbx
  805581:	48 8b 88 04 03 00 00 	mov    rcx,QWORD PTR [rax+0x304]
  805588:	48 8b 98 0c 03 00 00 	mov    rbx,QWORD PTR [rax+0x30c]
  80558f:	48 89 8a c4 00 00 00 	mov    QWORD PTR [rdx+0xc4],rcx
  805596:	48 89 9a cc 00 00 00 	mov    QWORD PTR [rdx+0xcc],rbx
    //使得子程序处于刚调用完系统调用的状态
    task[pid].regs.rip=ret_normal_proc;
  80559d:	ba b1 d8 80 00       	mov    edx,0x80d8b1
  8055a2:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8055a5:	48 98                	cdqe   
  8055a7:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8055ae:	48 05 80 87 40 00    	add    rax,0x408780
  8055b4:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    task[pid].regs.rsp-=sizeof(stack_store_regs);
  8055b8:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8055bb:	48 98                	cdqe   
  8055bd:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8055c4:	48 05 b0 87 40 00    	add    rax,0x4087b0
  8055ca:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8055ce:	48 2d a8 00 00 00    	sub    rax,0xa8
  8055d4:	48 89 c2             	mov    rdx,rax
  8055d7:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8055da:	48 98                	cdqe   
  8055dc:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8055e3:	48 05 b0 87 40 00    	add    rax,0x4087b0
  8055e9:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    task[pid].sid=current->sid;
  8055ed:	48 8b 05 4c fc c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fc4c]        # 415240 <current>
  8055f4:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8055f7:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  8055fa:	48 63 d2             	movsxd rdx,edx
  8055fd:	48 69 d2 34 03 00 00 	imul   rdx,rdx,0x334
  805604:	48 81 c2 48 85 40 00 	add    rdx,0x408548
  80560b:	89 02                	mov    DWORD PTR [rdx],eax
    task[pid].gpid=current->gpid;
  80560d:	48 8b 05 2c fc c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fc2c]        # 415240 <current>
  805614:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805617:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  80561a:	48 63 d2             	movsxd rdx,edx
  80561d:	48 69 d2 34 03 00 00 	imul   rdx,rdx,0x334
  805624:	48 81 c2 44 85 40 00 	add    rdx,0x408544
  80562b:	89 02                	mov    DWORD PTR [rdx],eax
    stack_store_regs *r=task[pid].regs.rsp;
  80562d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805630:	48 98                	cdqe   
  805632:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805639:	48 05 b0 87 40 00    	add    rax,0x4087b0
  80563f:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  805643:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    r->rax=0;
  805647:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80564b:	48 c7 40 78 00 00 00 	mov    QWORD PTR [rax+0x78],0x0
  805652:	00 
    r->ds=DS_USER;
  805653:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805657:	48 c7 00 28 00 00 00 	mov    QWORD PTR [rax],0x28
    r->ss=DS_USER;
  80565e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805662:	48 c7 80 a0 00 00 00 	mov    QWORD PTR [rax+0xa0],0x28
  805669:	28 00 00 00 
    r->es=DS_USER;
  80566d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805671:	48 c7 40 08 28 00 00 	mov    QWORD PTR [rax+0x8],0x28
  805678:	00 
    r->rax=task[pid].regs.rax;
  805679:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80567c:	48 98                	cdqe   
  80567e:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805685:	48 05 90 87 40 00    	add    rax,0x408790
  80568b:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  80568f:	48 89 c2             	mov    rdx,rax
  805692:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805696:	48 89 50 78          	mov    QWORD PTR [rax+0x78],rdx
    r->rbx=task[pid].regs.rbx;
  80569a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80569d:	48 98                	cdqe   
  80569f:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8056a6:	48 05 b0 87 40 00    	add    rax,0x4087b0
  8056ac:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  8056b0:	48 89 c2             	mov    rdx,rax
  8056b3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8056b7:	48 89 50 70          	mov    QWORD PTR [rax+0x70],rdx
    r->rcx=task[pid].regs.rcx;
  8056bb:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8056be:	48 98                	cdqe   
  8056c0:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8056c7:	48 05 a0 87 40 00    	add    rax,0x4087a0
  8056cd:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  8056d1:	48 89 c2             	mov    rdx,rax
  8056d4:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8056d8:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    r->rdx=task[pid].regs.rdx;
  8056dc:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8056df:	48 98                	cdqe   
  8056e1:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8056e8:	48 05 a0 87 40 00    	add    rax,0x4087a0
  8056ee:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8056f2:	48 89 c2             	mov    rdx,rax
  8056f5:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8056f9:	48 89 50 60          	mov    QWORD PTR [rax+0x60],rdx
    r->rsi=task[pid].regs.rsi;
  8056fd:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805700:	48 98                	cdqe   
  805702:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805709:	48 05 c0 87 40 00    	add    rax,0x4087c0
  80570f:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  805713:	48 89 c2             	mov    rdx,rax
  805716:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80571a:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
    r->rdi=task[pid].regs.rdi;
  80571e:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805721:	48 98                	cdqe   
  805723:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80572a:	48 05 d0 87 40 00    	add    rax,0x4087d0
  805730:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  805734:	48 89 c2             	mov    rdx,rax
  805737:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80573b:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx

    r->r8 =task[pid].regs.r8 ;
  80573f:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805742:	48 98                	cdqe   
  805744:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80574b:	48 05 00 88 40 00    	add    rax,0x408800
  805751:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  805755:	48 89 c2             	mov    rdx,rax
  805758:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80575c:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    r->r9 =task[pid].regs.r9 ;
  805760:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805763:	48 98                	cdqe   
  805765:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80576c:	48 05 10 88 40 00    	add    rax,0x408810
  805772:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  805776:	48 89 c2             	mov    rdx,rax
  805779:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80577d:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    r->r10=task[pid].regs.r10;
  805781:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805784:	48 98                	cdqe   
  805786:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80578d:	48 05 10 88 40 00    	add    rax,0x408810
  805793:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  805797:	48 89 c2             	mov    rdx,rax
  80579a:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80579e:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
    r->r11=task[pid].regs.r11;
  8057a2:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8057a5:	48 98                	cdqe   
  8057a7:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8057ae:	48 05 20 88 40 00    	add    rax,0x408820
  8057b4:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  8057b8:	48 89 c2             	mov    rdx,rax
  8057bb:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8057bf:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
    r->r12=task[pid].regs.r12;
  8057c3:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8057c6:	48 98                	cdqe   
  8057c8:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8057cf:	48 05 20 88 40 00    	add    rax,0x408820
  8057d5:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8057d9:	48 89 c2             	mov    rdx,rax
  8057dc:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8057e0:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
    r->r13=task[pid].regs.r13;
  8057e4:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8057e7:	48 98                	cdqe   
  8057e9:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8057f0:	48 05 30 88 40 00    	add    rax,0x408830
  8057f6:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  8057fa:	48 89 c2             	mov    rdx,rax
  8057fd:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805801:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
    r->r14=task[pid].regs.r14;
  805805:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805808:	48 98                	cdqe   
  80580a:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805811:	48 05 30 88 40 00    	add    rax,0x408830
  805817:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  80581b:	48 89 c2             	mov    rdx,rax
  80581e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805822:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    r->r15=task[pid].regs.r15;
  805826:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805829:	48 98                	cdqe   
  80582b:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805832:	48 05 40 88 40 00    	add    rax,0x408840
  805838:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  80583c:	48 89 c2             	mov    rdx,rax
  80583f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805843:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx

    asm volatile("mov %%r10,%0"::"m"(r->rip));
  805847:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80584b:	4c 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],r10

    task[pid].tss=current->tss;
  805852:	48 8b 05 e7 f9 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f9e7]        # 415240 <current>
  805859:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  80585c:	48 63 d2             	movsxd rdx,edx
  80585f:	48 69 d2 34 03 00 00 	imul   rdx,rdx,0x334
  805866:	48 81 c2 10 87 40 00 	add    rdx,0x408710
  80586d:	48 8b 88 d8 01 00 00 	mov    rcx,QWORD PTR [rax+0x1d8]
  805874:	48 8b 98 e0 01 00 00 	mov    rbx,QWORD PTR [rax+0x1e0]
  80587b:	48 89 4a 08          	mov    QWORD PTR [rdx+0x8],rcx
  80587f:	48 89 5a 10          	mov    QWORD PTR [rdx+0x10],rbx
  805883:	48 8b 88 e8 01 00 00 	mov    rcx,QWORD PTR [rax+0x1e8]
  80588a:	48 8b 98 f0 01 00 00 	mov    rbx,QWORD PTR [rax+0x1f0]
  805891:	48 89 4a 18          	mov    QWORD PTR [rdx+0x18],rcx
  805895:	48 89 5a 20          	mov    QWORD PTR [rdx+0x20],rbx
  805899:	48 8b 88 f8 01 00 00 	mov    rcx,QWORD PTR [rax+0x1f8]
  8058a0:	48 8b 98 00 02 00 00 	mov    rbx,QWORD PTR [rax+0x200]
  8058a7:	48 89 4a 28          	mov    QWORD PTR [rdx+0x28],rcx
  8058ab:	48 89 5a 30          	mov    QWORD PTR [rdx+0x30],rbx
  8058af:	48 8b 88 08 02 00 00 	mov    rcx,QWORD PTR [rax+0x208]
  8058b6:	48 8b 98 10 02 00 00 	mov    rbx,QWORD PTR [rax+0x210]
  8058bd:	48 89 4a 38          	mov    QWORD PTR [rdx+0x38],rcx
  8058c1:	48 89 5a 40          	mov    QWORD PTR [rdx+0x40],rbx
  8058c5:	48 8b 88 18 02 00 00 	mov    rcx,QWORD PTR [rax+0x218]
  8058cc:	48 8b 98 20 02 00 00 	mov    rbx,QWORD PTR [rax+0x220]
  8058d3:	48 89 4a 48          	mov    QWORD PTR [rdx+0x48],rcx
  8058d7:	48 89 5a 50          	mov    QWORD PTR [rdx+0x50],rbx
  8058db:	48 8b 88 28 02 00 00 	mov    rcx,QWORD PTR [rax+0x228]
  8058e2:	48 8b 98 30 02 00 00 	mov    rbx,QWORD PTR [rax+0x230]
  8058e9:	48 89 4a 58          	mov    QWORD PTR [rdx+0x58],rcx
  8058ed:	48 89 5a 60          	mov    QWORD PTR [rdx+0x60],rbx
  8058f1:	48 8b 88 38 02 00 00 	mov    rcx,QWORD PTR [rax+0x238]
  8058f8:	48 89 4a 68          	mov    QWORD PTR [rdx+0x68],rcx
  8058fc:	8b 80 40 02 00 00    	mov    eax,DWORD PTR [rax+0x240]
  805902:	89 42 70             	mov    DWORD PTR [rdx+0x70],eax
    task[pid].stat=TASK_READY;
  805905:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805908:	48 98                	cdqe   
  80590a:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805911:	48 05 58 85 40 00    	add    rax,0x408558
  805917:	c7 00 02 00 00 00    	mov    DWORD PTR [rax],0x2
    task[pid].parent_pid=cur_proc;
  80591d:	8b 05 a9 f9 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f9a9]        # 4152cc <cur_proc>
  805923:	89 c2                	mov    edx,eax
  805925:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805928:	48 98                	cdqe   
  80592a:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805931:	48 05 dc 85 40 00    	add    rax,0x4085dc
  805937:	89 10                	mov    DWORD PTR [rax],edx
    //设置父子关系以及初始化子进程的的list节点
    list_init(&task[pid].node);
  805939:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80593c:	48 98                	cdqe   
  80593e:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805945:	48 05 10 03 00 00    	add    rax,0x310
  80594b:	48 05 40 85 40 00    	add    rax,0x408540
  805951:	48 83 c0 04          	add    rax,0x4
  805955:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
    list->prev = NULL;
  80595c:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  805963:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  80596a:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  805971:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  805978:	00 
}
  805979:	90                   	nop
    task[pid].child_procs=NULL;
  80597a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80597d:	48 98                	cdqe   
  80597f:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805986:	48 05 60 88 40 00    	add    rax,0x408860
  80598c:	48 c7 40 0c 00 00 00 	mov    QWORD PTR [rax+0xc],0x0
  805993:	00 
    task[pid].node.data=&task[pid];
  805994:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805997:	48 98                	cdqe   
  805999:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8059a0:	48 8d 90 40 85 40 00 	lea    rdx,[rax+0x408540]
  8059a7:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8059aa:	48 98                	cdqe   
  8059ac:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8059b3:	48 05 50 88 40 00    	add    rax,0x408850
  8059b9:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    list_add(current->child_procs,&task[pid].node);
  8059bd:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8059c0:	48 98                	cdqe   
  8059c2:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8059c9:	48 05 10 03 00 00    	add    rax,0x310
  8059cf:	48 05 40 85 40 00    	add    rax,0x408540
  8059d5:	48 8d 50 04          	lea    rdx,[rax+0x4]
  8059d9:	48 8b 05 60 f8 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f860]        # 415240 <current>
  8059e0:	48 8b 80 2c 03 00 00 	mov    rax,QWORD PTR [rax+0x32c]
  8059e7:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
  8059eb:	48 89 55 90          	mov    QWORD PTR [rbp-0x70],rdx
    if(entry->next==NULL)
  8059ef:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8059f3:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8059f7:	48 85 c0             	test   rax,rax
  8059fa:	75 58                	jne    805a54 <sys_fork+0x63b>
  8059fc:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  805a00:	48 89 45 88          	mov    QWORD PTR [rbp-0x78],rax
  805a04:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805a08:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
    new->next = entry->next;
  805a0c:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  805a10:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  805a14:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  805a18:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  805a1c:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  805a20:	48 8b 55 88          	mov    rdx,QWORD PTR [rbp-0x78]
  805a24:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  805a27:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  805a2b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  805a2f:	48 85 c0             	test   rax,rax
  805a32:	74 0f                	je     805a43 <sys_fork+0x62a>
        new->next->prev = new;
  805a34:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  805a38:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  805a3c:	48 8b 55 80          	mov    rdx,QWORD PTR [rbp-0x80]
  805a40:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  805a43:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  805a47:	48 8b 55 80          	mov    rdx,QWORD PTR [rbp-0x80]
  805a4b:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  805a4f:	e9 d9 00 00 00       	jmp    805b2d <sys_fork+0x714>
        struct List* p=entry;
  805a54:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  805a58:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
        for(;p->next&&p->next!=p;p=p->next){
  805a5f:	eb 2e                	jmp    805a8f <sys_fork+0x676>
            if(p->data==new->data)
  805a61:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805a68:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  805a6c:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805a70:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  805a74:	48 39 c2             	cmp    rdx,rax
  805a77:	0f 84 af 00 00 00    	je     805b2c <sys_fork+0x713>
        for(;p->next&&p->next!=p;p=p->next){
  805a7d:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805a84:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  805a88:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
  805a8f:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805a96:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  805a9a:	48 85 c0             	test   rax,rax
  805a9d:	74 14                	je     805ab3 <sys_fork+0x69a>
  805a9f:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805aa6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  805aaa:	48 39 85 78 ff ff ff 	cmp    QWORD PTR [rbp-0x88],rax
  805ab1:	75 ae                	jne    805a61 <sys_fork+0x648>
  805ab3:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805aba:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  805ac1:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  805ac5:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    new->next = entry->next;
  805acc:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805ad3:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  805ad7:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
  805ade:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  805ae2:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
  805ae9:	48 8b 95 70 ff ff ff 	mov    rdx,QWORD PTR [rbp-0x90]
  805af0:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  805af3:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
  805afa:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  805afe:	48 85 c0             	test   rax,rax
  805b01:	74 15                	je     805b18 <sys_fork+0x6ff>
        new->next->prev = new;
  805b03:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
  805b0a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  805b0e:	48 8b 95 68 ff ff ff 	mov    rdx,QWORD PTR [rbp-0x98]
  805b15:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  805b18:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805b1f:	48 8b 95 68 ff ff ff 	mov    rdx,QWORD PTR [rbp-0x98]
  805b26:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  805b2a:	eb 01                	jmp    805b2d <sys_fork+0x714>
                return;
  805b2c:	90                   	nop
    //复制打开文件
    memcpy(task[pid].openf,current->openf,sizeof(struct file*)*MAX_PROC_OPENF);
  805b2d:	48 8b 05 0c f7 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f70c]        # 415240 <current>
  805b34:	48 8d 88 d8 00 00 00 	lea    rcx,[rax+0xd8]
  805b3b:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805b3e:	48 98                	cdqe   
  805b40:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805b47:	48 05 d0 00 00 00    	add    rax,0xd0
  805b4d:	48 05 40 85 40 00    	add    rax,0x408540
  805b53:	48 83 c0 08          	add    rax,0x8
  805b57:	ba 00 01 00 00       	mov    edx,0x100
  805b5c:	48 89 ce             	mov    rsi,rcx
  805b5f:	48 89 c7             	mov    rdi,rax
  805b62:	e8 a3 73 00 00       	call   80cf0a <memcpy>
    task[pid].utime=0;
  805b67:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805b6a:	48 98                	cdqe   
  805b6c:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805b73:	48 05 5c 85 40 00    	add    rax,0x40855c
  805b79:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[pid].mem_struct=current->mem_struct;
  805b7f:	48 8b 0d ba f6 c0 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc0f6ba]        # 415240 <current>
  805b86:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805b89:	48 98                	cdqe   
  805b8b:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805b92:	48 8d b0 60 85 40 00 	lea    rsi,[rax+0x408560]
  805b99:	48 8b 41 28          	mov    rax,QWORD PTR [rcx+0x28]
  805b9d:	48 8b 51 30          	mov    rdx,QWORD PTR [rcx+0x30]
  805ba1:	48 89 46 08          	mov    QWORD PTR [rsi+0x8],rax
  805ba5:	48 89 56 10          	mov    QWORD PTR [rsi+0x10],rdx
  805ba9:	48 8b 41 38          	mov    rax,QWORD PTR [rcx+0x38]
  805bad:	48 8b 51 40          	mov    rdx,QWORD PTR [rcx+0x40]
  805bb1:	48 89 46 18          	mov    QWORD PTR [rsi+0x18],rax
  805bb5:	48 89 56 20          	mov    QWORD PTR [rsi+0x20],rdx
    //根据是子进程还是父进程设置返回值的不同

    //TODO:设置新堆栈
    //复制父进程的内存映射到子进程，然后重新映射并复制子进程的堆栈和数据段
    copy_mmap(current,&task[pid]);
  805bb9:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805bbc:	48 98                	cdqe   
  805bbe:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805bc5:	48 8d 90 40 85 40 00 	lea    rdx,[rax+0x408540]
  805bcc:	48 8b 05 6d f6 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f66d]        # 415240 <current>
  805bd3:	48 89 d6             	mov    rsi,rdx
  805bd6:	48 89 c7             	mov    rdi,rax
  805bd9:	e8 de 04 00 00       	call   8060bc <copy_mmap>
    /*
     * 这里使用vmalloc是一个权宜之策。
     * 本来是分配用户空间内存的，但是这样的话当前进程内存空间下就访问不到这个新申请的内存了（除非mmap一下），
     * 方便以前先用vmalloc。
     * */
    addr_t stk=task[pid].mem_struct.stack_top-PAGE_4K_SIZE;
  805bde:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805be1:	48 98                	cdqe   
  805be3:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805bea:	48 05 74 85 40 00    	add    rax,0x408574
  805bf0:	8b 00                	mov    eax,DWORD PTR [rax]
  805bf2:	2d 00 10 00 00       	sub    eax,0x1000
  805bf7:	48 98                	cdqe   
  805bf9:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    for(;stk>=task[pid].mem_struct.stack_bottom;stk-=PAGE_4K_SIZE){
  805bfd:	eb 5b                	jmp    805c5a <sys_fork+0x841>
        addr_t new_stkpg=vmalloc();
  805bff:	b8 00 00 00 00       	mov    eax,0x0
  805c04:	e8 39 b6 ff ff       	call   801242 <vmalloc>
  805c09:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
        memcpy(new_stkpg,stk,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  805c0d:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  805c11:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  805c15:	ba 00 10 00 00       	mov    edx,0x1000
  805c1a:	48 89 ce             	mov    rsi,rcx
  805c1d:	48 89 c7             	mov    rdi,rax
  805c20:	e8 e5 72 00 00       	call   80cf0a <memcpy>
        //把新的页面映射到进程页表里
        smmap(new_stkpg,stk,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  805c25:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805c28:	48 98                	cdqe   
  805c2a:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805c31:	48 05 00 86 40 00    	add    rax,0x408600
  805c37:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  805c3a:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  805c3e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  805c42:	48 89 d1             	mov    rcx,rdx
  805c45:	ba 07 00 00 00       	mov    edx,0x7
  805c4a:	48 89 c7             	mov    rdi,rax
  805c4d:	e8 a0 b3 ff ff       	call   800ff2 <smmap>
    for(;stk>=task[pid].mem_struct.stack_bottom;stk-=PAGE_4K_SIZE){
  805c52:	48 81 6d e8 00 10 00 	sub    QWORD PTR [rbp-0x18],0x1000
  805c59:	00 
  805c5a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805c5d:	48 98                	cdqe   
  805c5f:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805c66:	48 05 70 85 40 00    	add    rax,0x408570
  805c6c:	8b 00                	mov    eax,DWORD PTR [rax]
  805c6e:	48 98                	cdqe   
  805c70:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  805c74:	73 89                	jae    805bff <sys_fork+0x7e6>
    }
    //中断使用的栈空间
    addr_t intstk=INT_STACK_TOP-PAGE_4K_SIZE;
  805c76:	48 c7 45 e0 00 f0 7f 	mov    QWORD PTR [rbp-0x20],0x7ff000
  805c7d:	00 
    int f=1;
  805c7e:	c7 45 dc 01 00 00 00 	mov    DWORD PTR [rbp-0x24],0x1
    for(;intstk>=INT_STACK_BASE;intstk-=PAGE_4K_SIZE){
  805c85:	e9 81 00 00 00       	jmp    805d0b <sys_fork+0x8f2>
        addr_t new_stkpg=vmalloc();
  805c8a:	b8 00 00 00 00       	mov    eax,0x0
  805c8f:	e8 ae b5 ff ff       	call   801242 <vmalloc>
  805c94:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        memcpy(new_stkpg,intstk,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  805c98:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  805c9c:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805ca0:	ba 00 10 00 00       	mov    edx,0x1000
  805ca5:	48 89 ce             	mov    rsi,rcx
  805ca8:	48 89 c7             	mov    rdi,rax
  805cab:	e8 5a 72 00 00       	call   80cf0a <memcpy>
        if(f){
  805cb0:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  805cb4:	74 20                	je     805cd6 <sys_fork+0x8bd>
            f=0;
  805cb6:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
            addr_t *raxp=new_stkpg+PAGE_4K_SIZE-56;//指向中断堆栈，里面存着rax的值
  805cbd:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805cc1:	48 05 c8 0f 00 00    	add    rax,0xfc8
  805cc7:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
            *raxp=0;//这样进程切换到子进程的done标签，从时钟中断返回弹出堆栈的时候rax弹出来的就是0，成为返回值。
  805ccb:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  805ccf:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
        }
        //把新的页面映射到进程页表里
        smmap(new_stkpg,intstk,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  805cd6:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805cd9:	48 98                	cdqe   
  805cdb:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805ce2:	48 05 00 86 40 00    	add    rax,0x408600
  805ce8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  805ceb:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  805cef:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805cf3:	48 89 d1             	mov    rcx,rdx
  805cf6:	ba 07 00 00 00       	mov    edx,0x7
  805cfb:	48 89 c7             	mov    rdi,rax
  805cfe:	e8 ef b2 ff ff       	call   800ff2 <smmap>
    for(;intstk>=INT_STACK_BASE;intstk-=PAGE_4K_SIZE){
  805d03:	48 81 6d e0 00 10 00 	sub    QWORD PTR [rbp-0x20],0x1000
  805d0a:	00 
  805d0b:	48 81 7d e0 ff ef 7f 	cmp    QWORD PTR [rbp-0x20],0x7fefff
  805d12:	00 
  805d13:	0f 87 71 ff ff ff    	ja     805c8a <sys_fork+0x871>
    }
    //堆
    addr_t hp=task[pid].mem_struct.heap_top-PAGE_4K_SIZE;
  805d19:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805d1c:	48 98                	cdqe   
  805d1e:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805d25:	48 05 6c 85 40 00    	add    rax,0x40856c
  805d2b:	8b 00                	mov    eax,DWORD PTR [rax]
  805d2d:	2d 00 10 00 00       	sub    eax,0x1000
  805d32:	48 98                	cdqe   
  805d34:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    for(;hp>=task[pid].mem_struct.heap_base;hp-=PAGE_4K_SIZE){
  805d38:	eb 5b                	jmp    805d95 <sys_fork+0x97c>
        addr_t new_hppg=vmalloc();
  805d3a:	b8 00 00 00 00       	mov    eax,0x0
  805d3f:	e8 fe b4 ff ff       	call   801242 <vmalloc>
  805d44:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        memcpy(new_hppg,hp,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  805d48:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  805d4c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805d50:	ba 00 10 00 00       	mov    edx,0x1000
  805d55:	48 89 ce             	mov    rsi,rcx
  805d58:	48 89 c7             	mov    rdi,rax
  805d5b:	e8 aa 71 00 00       	call   80cf0a <memcpy>
        //把新的页面映射到进程页表里
        smmap(new_hppg,hp,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  805d60:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805d63:	48 98                	cdqe   
  805d65:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805d6c:	48 05 00 86 40 00    	add    rax,0x408600
  805d72:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  805d75:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  805d79:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805d7d:	48 89 d1             	mov    rcx,rdx
  805d80:	ba 07 00 00 00       	mov    edx,0x7
  805d85:	48 89 c7             	mov    rdi,rax
  805d88:	e8 65 b2 ff ff       	call   800ff2 <smmap>
    for(;hp>=task[pid].mem_struct.heap_base;hp-=PAGE_4K_SIZE){
  805d8d:	48 81 6d d0 00 10 00 	sub    QWORD PTR [rbp-0x30],0x1000
  805d94:	00 
  805d95:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805d98:	48 98                	cdqe   
  805d9a:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  805da1:	48 05 68 85 40 00    	add    rax,0x408568
  805da7:	8b 00                	mov    eax,DWORD PTR [rax]
  805da9:	48 98                	cdqe   
  805dab:	48 39 45 d0          	cmp    QWORD PTR [rbp-0x30],rax
  805daf:	73 89                	jae    805d3a <sys_fork+0x921>
    }
    //父进程运行到这里
    return pid;
  805db1:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
}
  805db4:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  805db8:	c9                   	leave  
  805db9:	c3                   	ret    

0000000000805dba <release_mmap>:
//释放进程页表映射的内存，内核空间除外。
void release_mmap(struct process* p){
  805dba:	f3 0f 1e fa          	endbr64 
  805dbe:	55                   	push   rbp
  805dbf:	48 89 e5             	mov    rbp,rsp
  805dc2:	48 83 ec 50          	sub    rsp,0x50
  805dc6:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    page_item * pml4p=p->pml4;
  805dca:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805dce:	48 8b 80 c0 00 00 00 	mov    rax,QWORD PTR [rax+0xc0]
  805dd5:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //复制pdpt
    page_item *pml4e= pml4p;
  805dd9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805ddd:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    for(int i=0;i<512;i++)
  805de1:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805de8:	e9 be 02 00 00       	jmp    8060ab <release_mmap+0x2f1>
    {
        if(pml4e[i]&PAGE_PRESENT){
  805ded:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805df0:	48 98                	cdqe   
  805df2:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805df9:	00 
  805dfa:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805dfe:	48 01 d0             	add    rax,rdx
  805e01:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805e04:	83 e0 01             	and    eax,0x1
  805e07:	48 85 c0             	test   rax,rax
  805e0a:	0f 84 97 02 00 00    	je     8060a7 <release_mmap+0x2ed>
            page_item *pdpte=pml4e[i]&PAGE_4K_MASK;
  805e10:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805e13:	48 98                	cdqe   
  805e15:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805e1c:	00 
  805e1d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805e21:	48 01 d0             	add    rax,rdx
  805e24:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805e27:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805e2e:	ff 00 00 
  805e31:	48 21 d0             	and    rax,rdx
  805e34:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            int j=i==0?1:0;//低1GB的空间不释放（内核空间）
  805e38:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  805e3c:	0f 94 c0             	sete   al
  805e3f:	0f b6 c0             	movzx  eax,al
  805e42:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
            for(;j<512;j++)
  805e45:	e9 24 02 00 00       	jmp    80606e <release_mmap+0x2b4>
            {
                if(pdpte[j]&PAGE_PRESENT&&!(pdpte[j]&PDPTE_1GB)){
  805e4a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805e4d:	48 98                	cdqe   
  805e4f:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805e56:	00 
  805e57:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805e5b:	48 01 d0             	add    rax,rdx
  805e5e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805e61:	83 e0 01             	and    eax,0x1
  805e64:	48 85 c0             	test   rax,rax
  805e67:	0f 84 fd 01 00 00    	je     80606a <release_mmap+0x2b0>
  805e6d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805e70:	48 98                	cdqe   
  805e72:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805e79:	00 
  805e7a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805e7e:	48 01 d0             	add    rax,rdx
  805e81:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805e84:	25 80 00 00 00       	and    eax,0x80
  805e89:	48 85 c0             	test   rax,rax
  805e8c:	0f 85 d8 01 00 00    	jne    80606a <release_mmap+0x2b0>
                    page_item *pde=pdpte[j]&PAGE_4K_MASK;
  805e92:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805e95:	48 98                	cdqe   
  805e97:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805e9e:	00 
  805e9f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805ea3:	48 01 d0             	add    rax,rdx
  805ea6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805ea9:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805eb0:	ff 00 00 
  805eb3:	48 21 d0             	and    rax,rdx
  805eb6:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
                    for(int k=0;k<512;k++)
  805eba:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  805ec1:	e9 6b 01 00 00       	jmp    806031 <release_mmap+0x277>
                    {
                        if(pde[k]&PAGE_PRESENT&&!(pde[k]&PDE_4MB)){
  805ec6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805ec9:	48 98                	cdqe   
  805ecb:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805ed2:	00 
  805ed3:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805ed7:	48 01 d0             	add    rax,rdx
  805eda:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805edd:	83 e0 01             	and    eax,0x1
  805ee0:	48 85 c0             	test   rax,rax
  805ee3:	0f 84 dc 00 00 00    	je     805fc5 <release_mmap+0x20b>
  805ee9:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805eec:	48 98                	cdqe   
  805eee:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805ef5:	00 
  805ef6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805efa:	48 01 d0             	add    rax,rdx
  805efd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805f00:	25 80 00 00 00       	and    eax,0x80
  805f05:	48 85 c0             	test   rax,rax
  805f08:	0f 85 b7 00 00 00    	jne    805fc5 <release_mmap+0x20b>
                            page_item *pte=pde[k]&PAGE_4K_MASK;
  805f0e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805f11:	48 98                	cdqe   
  805f13:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805f1a:	00 
  805f1b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805f1f:	48 01 d0             	add    rax,rdx
  805f22:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805f25:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805f2c:	ff 00 00 
  805f2f:	48 21 d0             	and    rax,rdx
  805f32:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
                            for(int l=0;l<512;l++){
  805f36:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  805f3d:	eb 4f                	jmp    805f8e <release_mmap+0x1d4>
                                if(pte[l]&PAGE_PRESENT){
  805f3f:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  805f42:	48 98                	cdqe   
  805f44:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805f4b:	00 
  805f4c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  805f50:	48 01 d0             	add    rax,rdx
  805f53:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805f56:	83 e0 01             	and    eax,0x1
  805f59:	48 85 c0             	test   rax,rax
  805f5c:	74 2c                	je     805f8a <release_mmap+0x1d0>
                                    //释放申请的物理内存
                                    //TODO:这里有一个问题：目前fork时候堆栈空间使用的是vmalloc内存，这样的话free_page是释放不了的。
                                    free_page(pte[l]&PAGE_4K_MASK);
  805f5e:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  805f61:	48 98                	cdqe   
  805f63:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805f6a:	00 
  805f6b:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  805f6f:	48 01 d0             	add    rax,rdx
  805f72:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805f75:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805f7c:	ff 00 00 
  805f7f:	48 21 d0             	and    rax,rdx
  805f82:	48 89 c7             	mov    rdi,rax
  805f85:	e8 56 b7 ff ff       	call   8016e0 <free_page>
                            for(int l=0;l<512;l++){
  805f8a:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  805f8e:	81 7d f0 ff 01 00 00 	cmp    DWORD PTR [rbp-0x10],0x1ff
  805f95:	7e a8                	jle    805f3f <release_mmap+0x185>
                                }
                            }
                            //里面的项释放完了，这一项指向的vmalloc内存可以释放了
                            vmfree(pde[k]&PAGE_4K_MASK);
  805f97:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805f9a:	48 98                	cdqe   
  805f9c:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805fa3:	00 
  805fa4:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805fa8:	48 01 d0             	add    rax,rdx
  805fab:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805fae:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805fb5:	ff 00 00 
  805fb8:	48 21 d0             	and    rax,rdx
  805fbb:	48 89 c7             	mov    rdi,rax
  805fbe:	e8 0e b3 ff ff       	call   8012d1 <vmfree>
                        if(pde[k]&PAGE_PRESENT&&!(pde[k]&PDE_4MB)){
  805fc3:	eb 68                	jmp    80602d <release_mmap+0x273>
                        }else if((pde[k]&PAGE_PRESENT)&&(pde[k]&PDE_4MB)){
  805fc5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805fc8:	48 98                	cdqe   
  805fca:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805fd1:	00 
  805fd2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805fd6:	48 01 d0             	add    rax,rdx
  805fd9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805fdc:	83 e0 01             	and    eax,0x1
  805fdf:	48 85 c0             	test   rax,rax
  805fe2:	74 49                	je     80602d <release_mmap+0x273>
  805fe4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805fe7:	48 98                	cdqe   
  805fe9:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805ff0:	00 
  805ff1:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805ff5:	48 01 d0             	add    rax,rdx
  805ff8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805ffb:	25 80 00 00 00       	and    eax,0x80
  806000:	48 85 c0             	test   rax,rax
  806003:	74 28                	je     80602d <release_mmap+0x273>
                            //释放2MB页
                            free_pages_at(pde[k]&PAGE_4K_MASK,512);
  806005:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806008:	48 98                	cdqe   
  80600a:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806011:	00 
  806012:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806016:	48 01 d0             	add    rax,rdx
  806019:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80601c:	25 00 f0 ff ff       	and    eax,0xfffff000
  806021:	be 00 02 00 00       	mov    esi,0x200
  806026:	89 c7                	mov    edi,eax
  806028:	e8 37 b7 ff ff       	call   801764 <free_pages_at>
                    for(int k=0;k<512;k++)
  80602d:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  806031:	81 7d f4 ff 01 00 00 	cmp    DWORD PTR [rbp-0xc],0x1ff
  806038:	0f 8e 88 fe ff ff    	jle    805ec6 <release_mmap+0x10c>
                        }
                    }
                    //这一页pde的内容释放完了，这一项指向的vmalloc可以释放了
                    vmfree(pdpte[j]&PAGE_4K_MASK);
  80603e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806041:	48 98                	cdqe   
  806043:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80604a:	00 
  80604b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80604f:	48 01 d0             	add    rax,rdx
  806052:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806055:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  80605c:	ff 00 00 
  80605f:	48 21 d0             	and    rax,rdx
  806062:	48 89 c7             	mov    rdi,rax
  806065:	e8 67 b2 ff ff       	call   8012d1 <vmfree>
            for(;j<512;j++)
  80606a:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80606e:	81 7d f8 ff 01 00 00 	cmp    DWORD PTR [rbp-0x8],0x1ff
  806075:	0f 8e cf fd ff ff    	jle    805e4a <release_mmap+0x90>
                }//1GB先不写，目前还没有初始化之后动态申请1GB页的

            }
            //这一页pdpte的内容释放完了，这一项指向的vmalloc可以释放了
            vmfree(pml4e[i]&PAGE_4K_MASK);
  80607b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80607e:	48 98                	cdqe   
  806080:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806087:	00 
  806088:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80608c:	48 01 d0             	add    rax,rdx
  80608f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806092:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  806099:	ff 00 00 
  80609c:	48 21 d0             	and    rax,rdx
  80609f:	48 89 c7             	mov    rdi,rax
  8060a2:	e8 2a b2 ff ff       	call   8012d1 <vmfree>
    for(int i=0;i<512;i++)
  8060a7:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8060ab:	81 7d fc ff 01 00 00 	cmp    DWORD PTR [rbp-0x4],0x1ff
  8060b2:	0f 8e 35 fd ff ff    	jle    805ded <release_mmap+0x33>
        }
    }
}
  8060b8:	90                   	nop
  8060b9:	90                   	nop
  8060ba:	c9                   	leave  
  8060bb:	c3                   	ret    

00000000008060bc <copy_mmap>:
void copy_mmap(struct process* from, struct process *to){
  8060bc:	f3 0f 1e fa          	endbr64 
  8060c0:	55                   	push   rbp
  8060c1:	48 89 e5             	mov    rbp,rsp
  8060c4:	48 83 ec 60          	sub    rsp,0x60
  8060c8:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  8060cc:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
    page_item * pml4p=vmalloc();
  8060d0:	b8 00 00 00 00       	mov    eax,0x0
  8060d5:	e8 68 b1 ff ff       	call   801242 <vmalloc>
  8060da:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    memcpy(pml4p,from->regs.cr3,PAGE_4K_SIZE);//复制pml4
  8060de:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8060e2:	48 8b 80 44 02 00 00 	mov    rax,QWORD PTR [rax+0x244]
  8060e9:	48 89 c1             	mov    rcx,rax
  8060ec:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8060f0:	ba 00 10 00 00       	mov    edx,0x1000
  8060f5:	48 89 ce             	mov    rsi,rcx
  8060f8:	48 89 c7             	mov    rdi,rax
  8060fb:	e8 0a 6e 00 00       	call   80cf0a <memcpy>
    to->regs.cr3=pml4p;
  806100:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  806104:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  806108:	48 89 90 44 02 00 00 	mov    QWORD PTR [rax+0x244],rdx
    to->pml4=pml4p;
  80610f:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  806113:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  806117:	48 89 90 c0 00 00 00 	mov    QWORD PTR [rax+0xc0],rdx
    //复制pdpt

    page_item *pml4e= pml4p;
  80611e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806122:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    for(int i=0;i<512;i++)
  806126:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80612d:	e9 09 03 00 00       	jmp    80643b <copy_mmap+0x37f>
    {
        if(pml4e[i]&PAGE_PRESENT){
  806132:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806135:	48 98                	cdqe   
  806137:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80613e:	00 
  80613f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806143:	48 01 d0             	add    rax,rdx
  806146:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806149:	83 e0 01             	and    eax,0x1
  80614c:	48 85 c0             	test   rax,rax
  80614f:	0f 84 e2 02 00 00    	je     806437 <copy_mmap+0x37b>
            addr_t old_data=pml4e[i];//旧的数据，里面保存了属性和要拷贝的数据的地址
  806155:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806158:	48 98                	cdqe   
  80615a:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806161:	00 
  806162:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806166:	48 01 d0             	add    rax,rdx
  806169:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80616c:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            pml4e[i]=vmalloc()|(old_data&~PAGE_4K_MASK);
  806170:	b8 00 00 00 00       	mov    eax,0x0
  806175:	e8 c8 b0 ff ff       	call   801242 <vmalloc>
  80617a:	48 89 c2             	mov    rdx,rax
  80617d:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  806184:	00 ff ff 
  806187:	48 23 45 d8          	and    rax,QWORD PTR [rbp-0x28]
  80618b:	48 89 c1             	mov    rcx,rax
  80618e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806191:	48 98                	cdqe   
  806193:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  80619a:	00 
  80619b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80619f:	48 01 f0             	add    rax,rsi
  8061a2:	48 09 ca             	or     rdx,rcx
  8061a5:	48 89 10             	mov    QWORD PTR [rax],rdx
            memcpy(pml4e[i]&PAGE_4K_MASK,old_data&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  8061a8:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  8061af:	ff 00 00 
  8061b2:	48 23 45 d8          	and    rax,QWORD PTR [rbp-0x28]
  8061b6:	48 89 c1             	mov    rcx,rax
  8061b9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8061bc:	48 98                	cdqe   
  8061be:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8061c5:	00 
  8061c6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8061ca:	48 01 d0             	add    rax,rdx
  8061cd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8061d0:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  8061d7:	ff 00 00 
  8061da:	48 21 d0             	and    rax,rdx
  8061dd:	ba 00 10 00 00       	mov    edx,0x1000
  8061e2:	48 89 ce             	mov    rsi,rcx
  8061e5:	48 89 c7             	mov    rdi,rax
  8061e8:	e8 1d 6d 00 00       	call   80cf0a <memcpy>
            page_item *pdpte=pml4e[i]&PAGE_4K_MASK;
  8061ed:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8061f0:	48 98                	cdqe   
  8061f2:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8061f9:	00 
  8061fa:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8061fe:	48 01 d0             	add    rax,rdx
  806201:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806204:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  80620b:	ff 00 00 
  80620e:	48 21 d0             	and    rax,rdx
  806211:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            for(int j=0;j<512;j++)
  806215:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80621c:	e9 09 02 00 00       	jmp    80642a <copy_mmap+0x36e>
            {
                if(pdpte[j]&PAGE_PRESENT&&!(pdpte[j]&PDPTE_1GB)){
  806221:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806224:	48 98                	cdqe   
  806226:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80622d:	00 
  80622e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806232:	48 01 d0             	add    rax,rdx
  806235:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806238:	83 e0 01             	and    eax,0x1
  80623b:	48 85 c0             	test   rax,rax
  80623e:	0f 84 e2 01 00 00    	je     806426 <copy_mmap+0x36a>
  806244:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806247:	48 98                	cdqe   
  806249:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806250:	00 
  806251:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806255:	48 01 d0             	add    rax,rdx
  806258:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80625b:	25 80 00 00 00       	and    eax,0x80
  806260:	48 85 c0             	test   rax,rax
  806263:	0f 85 bd 01 00 00    	jne    806426 <copy_mmap+0x36a>
                    addr_t old_data2=pdpte[j];//旧的数据，里面保存了属性和要拷贝的数据的地址
  806269:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80626c:	48 98                	cdqe   
  80626e:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806275:	00 
  806276:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80627a:	48 01 d0             	add    rax,rdx
  80627d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806280:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
                    pdpte[j]=vmalloc()|(old_data2&~PAGE_4K_MASK);
  806284:	b8 00 00 00 00       	mov    eax,0x0
  806289:	e8 b4 af ff ff       	call   801242 <vmalloc>
  80628e:	48 89 c2             	mov    rdx,rax
  806291:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  806298:	00 ff ff 
  80629b:	48 23 45 c8          	and    rax,QWORD PTR [rbp-0x38]
  80629f:	48 89 c1             	mov    rcx,rax
  8062a2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8062a5:	48 98                	cdqe   
  8062a7:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  8062ae:	00 
  8062af:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8062b3:	48 01 f0             	add    rax,rsi
  8062b6:	48 09 ca             	or     rdx,rcx
  8062b9:	48 89 10             	mov    QWORD PTR [rax],rdx
                    memcpy(pdpte[j]&PAGE_4K_MASK,old_data2&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  8062bc:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  8062c3:	ff 00 00 
  8062c6:	48 23 45 c8          	and    rax,QWORD PTR [rbp-0x38]
  8062ca:	48 89 c1             	mov    rcx,rax
  8062cd:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8062d0:	48 98                	cdqe   
  8062d2:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8062d9:	00 
  8062da:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8062de:	48 01 d0             	add    rax,rdx
  8062e1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8062e4:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  8062eb:	ff 00 00 
  8062ee:	48 21 d0             	and    rax,rdx
  8062f1:	ba 00 10 00 00       	mov    edx,0x1000
  8062f6:	48 89 ce             	mov    rsi,rcx
  8062f9:	48 89 c7             	mov    rdi,rax
  8062fc:	e8 09 6c 00 00       	call   80cf0a <memcpy>
                    page_item *pde=pdpte[j]&PAGE_4K_MASK;
  806301:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806304:	48 98                	cdqe   
  806306:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80630d:	00 
  80630e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806312:	48 01 d0             	add    rax,rdx
  806315:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806318:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  80631f:	ff 00 00 
  806322:	48 21 d0             	and    rax,rdx
  806325:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
                    for(int k=0;k<512;k++)
  806329:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  806330:	e9 e4 00 00 00       	jmp    806419 <copy_mmap+0x35d>
                    {
                        if(pde[k]&PAGE_PRESENT&&!(pde[k]&PDE_4MB)){
  806335:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806338:	48 98                	cdqe   
  80633a:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806341:	00 
  806342:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  806346:	48 01 d0             	add    rax,rdx
  806349:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80634c:	83 e0 01             	and    eax,0x1
  80634f:	48 85 c0             	test   rax,rax
  806352:	0f 84 bd 00 00 00    	je     806415 <copy_mmap+0x359>
  806358:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80635b:	48 98                	cdqe   
  80635d:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806364:	00 
  806365:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  806369:	48 01 d0             	add    rax,rdx
  80636c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80636f:	25 80 00 00 00       	and    eax,0x80
  806374:	48 85 c0             	test   rax,rax
  806377:	0f 85 98 00 00 00    	jne    806415 <copy_mmap+0x359>
                            addr_t old_data3=pde[k];//旧的数据，里面保存了属性和要拷贝的数据的地址
  80637d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806380:	48 98                	cdqe   
  806382:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806389:	00 
  80638a:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80638e:	48 01 d0             	add    rax,rdx
  806391:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806394:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
                            pde[k]=vmalloc()|(old_data3&~PAGE_4K_MASK);
  806398:	b8 00 00 00 00       	mov    eax,0x0
  80639d:	e8 a0 ae ff ff       	call   801242 <vmalloc>
  8063a2:	48 89 c2             	mov    rdx,rax
  8063a5:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  8063ac:	00 ff ff 
  8063af:	48 23 45 b8          	and    rax,QWORD PTR [rbp-0x48]
  8063b3:	48 89 c1             	mov    rcx,rax
  8063b6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8063b9:	48 98                	cdqe   
  8063bb:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  8063c2:	00 
  8063c3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8063c7:	48 01 f0             	add    rax,rsi
  8063ca:	48 09 ca             	or     rdx,rcx
  8063cd:	48 89 10             	mov    QWORD PTR [rax],rdx
                            memcpy(pde[k]&PAGE_4K_MASK,old_data3&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  8063d0:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  8063d7:	ff 00 00 
  8063da:	48 23 45 b8          	and    rax,QWORD PTR [rbp-0x48]
  8063de:	48 89 c1             	mov    rcx,rax
  8063e1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8063e4:	48 98                	cdqe   
  8063e6:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8063ed:	00 
  8063ee:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8063f2:	48 01 d0             	add    rax,rdx
  8063f5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8063f8:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  8063ff:	ff 00 00 
  806402:	48 21 d0             	and    rax,rdx
  806405:	ba 00 10 00 00       	mov    edx,0x1000
  80640a:	48 89 ce             	mov    rsi,rcx
  80640d:	48 89 c7             	mov    rdi,rax
  806410:	e8 f5 6a 00 00       	call   80cf0a <memcpy>
                    for(int k=0;k<512;k++)
  806415:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  806419:	81 7d f4 ff 01 00 00 	cmp    DWORD PTR [rbp-0xc],0x1ff
  806420:	0f 8e 0f ff ff ff    	jle    806335 <copy_mmap+0x279>
            for(int j=0;j<512;j++)
  806426:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80642a:	81 7d f8 ff 01 00 00 	cmp    DWORD PTR [rbp-0x8],0x1ff
  806431:	0f 8e ea fd ff ff    	jle    806221 <copy_mmap+0x165>
    for(int i=0;i<512;i++)
  806437:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80643b:	81 7d fc ff 01 00 00 	cmp    DWORD PTR [rbp-0x4],0x1ff
  806442:	0f 8e ea fc ff ff    	jle    806132 <copy_mmap+0x76>
                    }
                }
            }
        }
    }
}
  806448:	90                   	nop
  806449:	90                   	nop
  80644a:	c9                   	leave  
  80644b:	c3                   	ret    

000000000080644c <getpgrp>:

pid_t getpgrp(void){
  80644c:	f3 0f 1e fa          	endbr64 
  806450:	55                   	push   rbp
  806451:	48 89 e5             	mov    rbp,rsp
    return current->gpid;
  806454:	48 8b 05 e5 ed c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ede5]        # 415240 <current>
  80645b:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
}
  80645e:	5d                   	pop    rbp
  80645f:	c3                   	ret    

0000000000806460 <getpgid>:

int getpgid(pid_t pid,gid_t gid){
  806460:	f3 0f 1e fa          	endbr64 
  806464:	55                   	push   rbp
  806465:	48 89 e5             	mov    rbp,rsp
  806468:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80646b:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==0)
  80646e:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  806472:	75 0c                	jne    806480 <getpgid+0x20>
        return current->gpid;
  806474:	48 8b 05 c5 ed c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0edc5]        # 415240 <current>
  80647b:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80647e:	eb 49                	jmp    8064c9 <getpgid+0x69>
    for (int i = 0; i <MAX_TASKS; ++i) {
  806480:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  806487:	eb 35                	jmp    8064be <getpgid+0x5e>
        if(task[i].pid==pid)
  806489:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80648c:	48 98                	cdqe   
  80648e:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  806495:	48 05 40 85 40 00    	add    rax,0x408540
  80649b:	8b 10                	mov    edx,DWORD PTR [rax]
  80649d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8064a0:	39 c2                	cmp    edx,eax
  8064a2:	75 16                	jne    8064ba <getpgid+0x5a>
            return task[i].gpid;
  8064a4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8064a7:	48 98                	cdqe   
  8064a9:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8064b0:	48 05 44 85 40 00    	add    rax,0x408544
  8064b6:	8b 00                	mov    eax,DWORD PTR [rax]
  8064b8:	eb 0f                	jmp    8064c9 <getpgid+0x69>
    for (int i = 0; i <MAX_TASKS; ++i) {
  8064ba:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8064be:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  8064c2:	7e c5                	jle    806489 <getpgid+0x29>
    }
    return -1;
  8064c4:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8064c9:	5d                   	pop    rbp
  8064ca:	c3                   	ret    

00000000008064cb <setpgid>:
int setpgid(pid_t pid,gid_t gid){
  8064cb:	f3 0f 1e fa          	endbr64 
  8064cf:	55                   	push   rbp
  8064d0:	48 89 e5             	mov    rbp,rsp
  8064d3:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8064d6:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==0)
  8064d9:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8064dd:	75 38                	jne    806517 <setpgid+0x4c>
    {
        if(current->sid==current->pid)
  8064df:	48 8b 05 5a ed c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ed5a]        # 415240 <current>
  8064e6:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  8064e9:	48 8b 05 50 ed c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ed50]        # 415240 <current>
  8064f0:	8b 00                	mov    eax,DWORD PTR [rax]
  8064f2:	39 c2                	cmp    edx,eax
  8064f4:	75 0a                	jne    806500 <setpgid+0x35>
            return -1;
  8064f6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8064fb:	e9 9d 00 00 00       	jmp    80659d <setpgid+0xd2>
        current->gpid=gid;
  806500:	48 8b 05 39 ed c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ed39]        # 415240 <current>
  806507:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80650a:	89 50 04             	mov    DWORD PTR [rax+0x4],edx
        return 0;
  80650d:	b8 00 00 00 00       	mov    eax,0x0
  806512:	e9 86 00 00 00       	jmp    80659d <setpgid+0xd2>
    }
    for (int i = 0; i <MAX_TASKS; ++i) {
  806517:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80651e:	eb 72                	jmp    806592 <setpgid+0xc7>
        if(task[i].pid==pid)
  806520:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806523:	48 98                	cdqe   
  806525:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80652c:	48 05 40 85 40 00    	add    rax,0x408540
  806532:	8b 10                	mov    edx,DWORD PTR [rax]
  806534:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806537:	39 c2                	cmp    edx,eax
  806539:	75 53                	jne    80658e <setpgid+0xc3>
        {
            if(task[i].sid==task[i].pid)
  80653b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80653e:	48 98                	cdqe   
  806540:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  806547:	48 05 48 85 40 00    	add    rax,0x408548
  80654d:	8b 10                	mov    edx,DWORD PTR [rax]
  80654f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806552:	48 98                	cdqe   
  806554:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80655b:	48 05 40 85 40 00    	add    rax,0x408540
  806561:	8b 00                	mov    eax,DWORD PTR [rax]
  806563:	39 c2                	cmp    edx,eax
  806565:	75 07                	jne    80656e <setpgid+0xa3>
                return -1;
  806567:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80656c:	eb 2f                	jmp    80659d <setpgid+0xd2>
            task[i].gpid=gid;
  80656e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806571:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  806574:	48 63 d2             	movsxd rdx,edx
  806577:	48 69 d2 34 03 00 00 	imul   rdx,rdx,0x334
  80657e:	48 81 c2 44 85 40 00 	add    rdx,0x408544
  806585:	89 02                	mov    DWORD PTR [rdx],eax
            return 0;
  806587:	b8 00 00 00 00       	mov    eax,0x0
  80658c:	eb 0f                	jmp    80659d <setpgid+0xd2>
    for (int i = 0; i <MAX_TASKS; ++i) {
  80658e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806592:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  806596:	7e 88                	jle    806520 <setpgid+0x55>
        }
    }
    return -1;
  806598:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  80659d:	5d                   	pop    rbp
  80659e:	c3                   	ret    

000000000080659f <setsid>:

pid_t setsid(void){
  80659f:	f3 0f 1e fa          	endbr64 
  8065a3:	55                   	push   rbp
  8065a4:	48 89 e5             	mov    rbp,rsp
    current->sid=current->pid;
  8065a7:	48 8b 15 92 ec c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0ec92]        # 415240 <current>
  8065ae:	48 8b 05 8b ec c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ec8b]        # 415240 <current>
  8065b5:	8b 12                	mov    edx,DWORD PTR [rdx]
  8065b7:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
}
  8065ba:	90                   	nop
  8065bb:	5d                   	pop    rbp
  8065bc:	c3                   	ret    

00000000008065bd <getsid>:
pid_t getsid(pid_t pid){
  8065bd:	f3 0f 1e fa          	endbr64 
  8065c1:	55                   	push   rbp
  8065c2:	48 89 e5             	mov    rbp,rsp
  8065c5:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(pid==0)
  8065c8:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8065cc:	75 0c                	jne    8065da <getsid+0x1d>
        return current->sid;
  8065ce:	48 8b 05 6b ec c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ec6b]        # 415240 <current>
  8065d5:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8065d8:	eb 49                	jmp    806623 <getsid+0x66>
    for (int i = 0; i <MAX_TASKS; ++i) {
  8065da:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8065e1:	eb 35                	jmp    806618 <getsid+0x5b>
        if(task[i].pid==pid)
  8065e3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8065e6:	48 98                	cdqe   
  8065e8:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8065ef:	48 05 40 85 40 00    	add    rax,0x408540
  8065f5:	8b 10                	mov    edx,DWORD PTR [rax]
  8065f7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8065fa:	39 c2                	cmp    edx,eax
  8065fc:	75 16                	jne    806614 <getsid+0x57>
            return task[i].sid;
  8065fe:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806601:	48 98                	cdqe   
  806603:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  80660a:	48 05 48 85 40 00    	add    rax,0x408548
  806610:	8b 00                	mov    eax,DWORD PTR [rax]
  806612:	eb 0f                	jmp    806623 <getsid+0x66>
    for (int i = 0; i <MAX_TASKS; ++i) {
  806614:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806618:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  80661c:	7e c5                	jle    8065e3 <getsid+0x26>
    }
    return -1;
  80661e:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  806623:	5d                   	pop    rbp
  806624:	c3                   	ret    

0000000000806625 <tcsetpgrp>:
int tcsetpgrp(int fildes,pid_t pgid_id){
  806625:	f3 0f 1e fa          	endbr64 
  806629:	55                   	push   rbp
  80662a:	48 89 e5             	mov    rbp,rsp
  80662d:	48 83 ec 20          	sub    rsp,0x20
  806631:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806634:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    //当前controlling terminal断联
    sys_ioctl(fildes,TTY_DISCONNECT,0);
  806637:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80663a:	ba 00 00 00 00       	mov    edx,0x0
  80663f:	be 02 00 00 00       	mov    esi,0x2
  806644:	89 c7                	mov    edi,eax
  806646:	e8 3f 01 00 00       	call   80678a <sys_ioctl>
    int sid= getsid(0);//获取session id
  80664b:	bf 00 00 00 00       	mov    edi,0x0
  806650:	e8 68 ff ff ff       	call   8065bd <getsid>
  806655:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    struct process* new_fgl=NULL;
  806658:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80665f:	00 
    for (int i = 0; i <MAX_TASKS; ++i) {
  806660:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  806667:	e9 9d 00 00 00       	jmp    806709 <tcsetpgrp+0xe4>
        if(task[i].stat == TASK_ZOMBIE||task[i].stat == TASK_EMPTY)continue;
  80666c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80666f:	48 98                	cdqe   
  806671:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  806678:	48 05 58 85 40 00    	add    rax,0x408558
  80667e:	8b 00                	mov    eax,DWORD PTR [rax]
  806680:	83 f8 04             	cmp    eax,0x4
  806683:	74 7f                	je     806704 <tcsetpgrp+0xdf>
  806685:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806688:	48 98                	cdqe   
  80668a:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  806691:	48 05 58 85 40 00    	add    rax,0x408558
  806697:	8b 00                	mov    eax,DWORD PTR [rax]
  806699:	85 c0                	test   eax,eax
  80669b:	74 67                	je     806704 <tcsetpgrp+0xdf>
        if(task[i].sid==sid){
  80669d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8066a0:	48 98                	cdqe   
  8066a2:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8066a9:	48 05 48 85 40 00    	add    rax,0x408548
  8066af:	8b 10                	mov    edx,DWORD PTR [rax]
  8066b1:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8066b4:	39 c2                	cmp    edx,eax
  8066b6:	75 4d                	jne    806705 <tcsetpgrp+0xe0>
            task[i].fg_pgid=pgid_id;
  8066b8:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8066bb:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8066be:	48 63 d2             	movsxd rdx,edx
  8066c1:	48 69 d2 34 03 00 00 	imul   rdx,rdx,0x334
  8066c8:	48 81 c2 4c 85 40 00 	add    rdx,0x40854c
  8066cf:	89 02                	mov    DWORD PTR [rdx],eax
            if(task[i].pid==pgid_id){
  8066d1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8066d4:	48 98                	cdqe   
  8066d6:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8066dd:	48 05 40 85 40 00    	add    rax,0x408540
  8066e3:	8b 10                	mov    edx,DWORD PTR [rax]
  8066e5:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8066e8:	39 c2                	cmp    edx,eax
  8066ea:	75 19                	jne    806705 <tcsetpgrp+0xe0>
                //这是新前台进程组的leader
                new_fgl=&task[i];
  8066ec:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8066ef:	48 98                	cdqe   
  8066f1:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  8066f8:	48 05 40 85 40 00    	add    rax,0x408540
  8066fe:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  806702:	eb 01                	jmp    806705 <tcsetpgrp+0xe0>
        if(task[i].stat == TASK_ZOMBIE||task[i].stat == TASK_EMPTY)continue;
  806704:	90                   	nop
    for (int i = 0; i <MAX_TASKS; ++i) {
  806705:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  806709:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  80670d:	0f 8e 59 ff ff ff    	jle    80666c <tcsetpgrp+0x47>
            }
        }
    }
    //新leader把tty连接
    new_fgl->openf[new_fgl->tty_fd]->f_ops->ioctl(new_fgl->openf[fildes]->dentry->dir_inode,new_fgl->openf[fildes]\
  806713:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806717:	8b 50 14             	mov    edx,DWORD PTR [rax+0x14]
  80671a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80671e:	48 63 d2             	movsxd rdx,edx
  806721:	48 83 c2 1a          	add    rdx,0x1a
  806725:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  80672a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80672e:	4c 8b 40 28          	mov    r8,QWORD PTR [rax+0x28]
  806732:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806736:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  806739:	48 63 d2             	movsxd rdx,edx
  80673c:	48 83 c2 1a          	add    rdx,0x1a
  806740:	48 8b 74 d0 08       	mov    rsi,QWORD PTR [rax+rdx*8+0x8]
  806745:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806749:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80674c:	48 63 d2             	movsxd rdx,edx
  80674f:	48 83 c2 1a          	add    rdx,0x1a
  806753:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  806758:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80675c:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  806760:	b9 00 00 00 00       	mov    ecx,0x0
  806765:	ba 01 00 00 00       	mov    edx,0x1
  80676a:	48 89 c7             	mov    rdi,rax
  80676d:	41 ff d0             	call   r8
    ,TTY_CONNECT,0);
}
  806770:	90                   	nop
  806771:	c9                   	leave  
  806772:	c3                   	ret    

0000000000806773 <tcgetpgrp>:
pid_t tcgetpgrp(int fildes){
  806773:	f3 0f 1e fa          	endbr64 
  806777:	55                   	push   rbp
  806778:	48 89 e5             	mov    rbp,rsp
  80677b:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return current->fg_pgid;
  80677e:	48 8b 05 bb ea c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0eabb]        # 415240 <current>
  806785:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
}
  806788:	5d                   	pop    rbp
  806789:	c3                   	ret    

000000000080678a <sys_ioctl>:
//===============

int sys_ioctl(int fildes, int request, unsigned long args){
  80678a:	f3 0f 1e fa          	endbr64 
  80678e:	55                   	push   rbp
  80678f:	48 89 e5             	mov    rbp,rsp
  806792:	48 83 ec 10          	sub    rsp,0x10
  806796:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  806799:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  80679c:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    current->openf[fildes]->f_ops->ioctl(current->openf[fildes]->dentry->dir_inode,current->openf[fildes]\
  8067a0:	48 8b 05 99 ea c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ea99]        # 415240 <current>
  8067a7:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8067aa:	48 63 d2             	movsxd rdx,edx
  8067ad:	48 83 c2 1a          	add    rdx,0x1a
  8067b1:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  8067b6:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8067ba:	4c 8b 40 28          	mov    r8,QWORD PTR [rax+0x28]
  8067be:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8067c1:	48 63 d0             	movsxd rdx,eax
  8067c4:	48 8b 05 75 ea c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ea75]        # 415240 <current>
  8067cb:	8b 4d fc             	mov    ecx,DWORD PTR [rbp-0x4]
  8067ce:	48 63 c9             	movsxd rcx,ecx
  8067d1:	48 83 c1 1a          	add    rcx,0x1a
  8067d5:	48 8b 74 c8 08       	mov    rsi,QWORD PTR [rax+rcx*8+0x8]
  8067da:	48 8b 05 5f ea c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0ea5f]        # 415240 <current>
  8067e1:	8b 4d fc             	mov    ecx,DWORD PTR [rbp-0x4]
  8067e4:	48 63 c9             	movsxd rcx,ecx
  8067e7:	48 83 c1 1a          	add    rcx,0x1a
  8067eb:	48 8b 44 c8 08       	mov    rax,QWORD PTR [rax+rcx*8+0x8]
  8067f0:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8067f4:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8067f8:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  8067fc:	48 89 c7             	mov    rdi,rax
  8067ff:	41 ff d0             	call   r8
    ,request,args);
  806802:	90                   	nop
  806803:	c9                   	leave  
  806804:	c3                   	ret    
  806805:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  80680c:	00 00 00 
  80680f:	90                   	nop

0000000000806810 <outb>:
  806810:	66 89 fa             	mov    dx,di
  806813:	66 89 f0             	mov    ax,si
  806816:	ee                   	out    dx,al
  806817:	e8 29 00 00 00       	call   806845 <io_delay>
  80681c:	c3                   	ret    

000000000080681d <outw>:
  80681d:	66 89 fa             	mov    dx,di
  806820:	66 89 f0             	mov    ax,si
  806823:	66 ef                	out    dx,ax
  806825:	90                   	nop
  806826:	90                   	nop
  806827:	90                   	nop
  806828:	c3                   	ret    

0000000000806829 <inb>:
  806829:	31 c0                	xor    eax,eax
  80682b:	66 89 fa             	mov    dx,di
  80682e:	ec                   	in     al,dx
  80682f:	90                   	nop
  806830:	90                   	nop
  806831:	90                   	nop
  806832:	c3                   	ret    

0000000000806833 <inw>:
  806833:	31 c0                	xor    eax,eax
  806835:	66 89 fa             	mov    dx,di
  806838:	66 ed                	in     ax,dx
  80683a:	90                   	nop
  80683b:	90                   	nop
  80683c:	90                   	nop
  80683d:	c3                   	ret    

000000000080683e <eoi>:
  80683e:	b0 20                	mov    al,0x20
  806840:	e6 a0                	out    0xa0,al
  806842:	e6 20                	out    0x20,al
  806844:	c3                   	ret    

0000000000806845 <io_delay>:
  806845:	90                   	nop
  806846:	90                   	nop
  806847:	90                   	nop
  806848:	90                   	nop
  806849:	c3                   	ret    

000000000080684a <turn_on_int>:
  80684a:	b0 f8                	mov    al,0xf8
  80684c:	e6 21                	out    0x21,al
  80684e:	e8 f2 ff ff ff       	call   806845 <io_delay>
  806853:	b0 af                	mov    al,0xaf
  806855:	e6 a1                	out    0xa1,al
  806857:	e8 e9 ff ff ff       	call   806845 <io_delay>
  80685c:	b8 00 70 10 00       	mov    eax,0x107000
  806861:	0f 01 18             	lidt   [rax]
  806864:	90                   	nop
  806865:	90                   	nop
  806866:	90                   	nop
  806867:	90                   	nop
  806868:	c3                   	ret    

0000000000806869 <report_back_trace_of_err>:
  806869:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  80686e:	50                   	push   rax
  80686f:	68 78 68 80 00       	push   0x806878
  806874:	83 c4 08             	add    esp,0x8
  806877:	c3                   	ret    

0000000000806878 <bt_msg>:
  806878:	65 72 72             	gs jb  8068ed <fill_desc+0x4e>
  80687b:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  80687c:	72 20                	jb     80689e <init_gdt+0x11>
  80687e:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  80687f:	63 63 75             	movsxd esp,DWORD PTR [rbx+0x75]
  806882:	72 73                	jb     8068f7 <fill_desc+0x58>
  806884:	20 61 74             	and    BYTE PTR [rcx+0x74],ah
  806887:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR [rip+0x6e5c78]        # eec505 <_knl_end+0x2ec505>

000000000080688d <init_gdt>:
#include "gdt.h"
#include "int.h"
descriptor *gdt=GDT_ADDR;
extern char *gdtptr;
int init_gdt()
{
  80688d:	f3 0f 1e fa          	endbr64 
  806891:	55                   	push   rbp
  806892:	48 89 e5             	mov    rbp,rsp
//    fill_desc(0x108000,108,SEG_SYS_TSS|SEG_PRESENT,4);
    asm volatile("mov $0x48,%ax\r\n"
  806895:	66 b8 48 00          	mov    ax,0x48
  806899:	0f 00 d8             	ltr    ax
                 "ltr %ax");  
}
  80689c:	90                   	nop
  80689d:	5d                   	pop    rbp
  80689e:	c3                   	ret    

000000000080689f <fill_desc>:
void fill_desc(u64 base, u64 limit, u16 attr, u32 index)
{
  80689f:	f3 0f 1e fa          	endbr64 
  8068a3:	55                   	push   rbp
  8068a4:	48 89 e5             	mov    rbp,rsp
  8068a7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8068ab:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8068af:	89 d0                	mov    eax,edx
  8068b1:	89 4d e8             	mov    DWORD PTR [rbp-0x18],ecx
  8068b4:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    gdt[index].base_12=base&0xffff;
  8068b8:	48 8b 15 e9 70 00 00 	mov    rdx,QWORD PTR [rip+0x70e9]        # 80d9a8 <gdt>
  8068bf:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8068c2:	48 c1 e0 04          	shl    rax,0x4
  8068c6:	48 01 d0             	add    rax,rdx
  8068c9:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8068cd:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    gdt[index].base_3=(base>>16)&0xff;
  8068d1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8068d5:	48 c1 e8 10          	shr    rax,0x10
  8068d9:	48 89 c1             	mov    rcx,rax
  8068dc:	48 8b 15 c5 70 00 00 	mov    rdx,QWORD PTR [rip+0x70c5]        # 80d9a8 <gdt>
  8068e3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8068e6:	48 c1 e0 04          	shl    rax,0x4
  8068ea:	48 01 d0             	add    rax,rdx
  8068ed:	89 ca                	mov    edx,ecx
  8068ef:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    gdt[index].base_4=(base>>24)&0xff;
  8068f2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8068f6:	48 c1 e8 18          	shr    rax,0x18
  8068fa:	48 89 c1             	mov    rcx,rax
  8068fd:	48 8b 15 a4 70 00 00 	mov    rdx,QWORD PTR [rip+0x70a4]        # 80d9a8 <gdt>
  806904:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806907:	48 c1 e0 04          	shl    rax,0x4
  80690b:	48 01 d0             	add    rax,rdx
  80690e:	89 ca                	mov    edx,ecx
  806910:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    gdt[index].base_5678=(base>>32)&0xffffffff;
  806913:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806917:	48 c1 e8 20          	shr    rax,0x20
  80691b:	48 89 c2             	mov    rdx,rax
  80691e:	48 8b 0d 83 70 00 00 	mov    rcx,QWORD PTR [rip+0x7083]        # 80d9a8 <gdt>
  806925:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806928:	48 c1 e0 04          	shl    rax,0x4
  80692c:	48 01 c8             	add    rax,rcx
  80692f:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    gdt[index].limit_lo16=limit&0xffff;
  806932:	48 8b 15 6f 70 00 00 	mov    rdx,QWORD PTR [rip+0x706f]        # 80d9a8 <gdt>
  806939:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80693c:	48 c1 e0 04          	shl    rax,0x4
  806940:	48 01 d0             	add    rax,rdx
  806943:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  806947:	66 89 10             	mov    WORD PTR [rax],dx
    gdt[index].attr=attr|((limit>>8)&0xf0);
  80694a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80694e:	48 c1 e8 08          	shr    rax,0x8
  806952:	66 25 f0 00          	and    ax,0xf0
  806956:	48 8b 0d 4b 70 00 00 	mov    rcx,QWORD PTR [rip+0x704b]        # 80d9a8 <gdt>
  80695d:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  806960:	48 c1 e2 04          	shl    rdx,0x4
  806964:	48 01 ca             	add    rdx,rcx
  806967:	66 0b 45 ec          	or     ax,WORD PTR [rbp-0x14]
  80696b:	66 89 42 05          	mov    WORD PTR [rdx+0x5],ax

}
  80696f:	90                   	nop
  806970:	5d                   	pop    rbp
  806971:	c3                   	ret    

0000000000806972 <fill_gate>:

void fill_gate(u32 index,u32 offset,u16 selector,u16 attr)
{
  806972:	f3 0f 1e fa          	endbr64 
  806976:	55                   	push   rbp
  806977:	48 89 e5             	mov    rbp,rsp
  80697a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80697d:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806980:	89 c8                	mov    eax,ecx
  806982:	66 89 55 e4          	mov    WORD PTR [rbp-0x1c],dx
  806986:	66 89 45 e0          	mov    WORD PTR [rbp-0x20],ax
    gate* ptr=gdt;
  80698a:	48 8b 05 17 70 00 00 	mov    rax,QWORD PTR [rip+0x7017]        # 80d9a8 <gdt>
  806991:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ptr[index].offset_low=offset&0xffff;
  806995:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806998:	48 c1 e0 04          	shl    rax,0x4
  80699c:	48 89 c2             	mov    rdx,rax
  80699f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8069a3:	48 01 d0             	add    rax,rdx
  8069a6:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8069a9:	66 89 10             	mov    WORD PTR [rax],dx
    ptr[index].offset_high=(offset>>16)&0xffff;
  8069ac:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8069af:	48 c1 e0 04          	shl    rax,0x4
  8069b3:	48 89 c2             	mov    rdx,rax
  8069b6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8069ba:	48 01 d0             	add    rax,rdx
  8069bd:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8069c0:	c1 ea 10             	shr    edx,0x10
  8069c3:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    ptr[index].selector=selector;
  8069c6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8069c9:	48 c1 e0 04          	shl    rax,0x4
  8069cd:	48 89 c2             	mov    rdx,rax
  8069d0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8069d4:	48 01 c2             	add    rdx,rax
  8069d7:	0f b7 45 e4          	movzx  eax,WORD PTR [rbp-0x1c]
  8069db:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    ptr[index].attr=attr;
  8069df:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8069e2:	48 c1 e0 04          	shl    rax,0x4
  8069e6:	48 89 c2             	mov    rdx,rax
  8069e9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8069ed:	48 01 c2             	add    rdx,rax
  8069f0:	0f b7 45 e0          	movzx  eax,WORD PTR [rbp-0x20]
  8069f4:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
}
  8069f8:	90                   	nop
  8069f9:	5d                   	pop    rbp
  8069fa:	c3                   	ret    

00000000008069fb <fill_ldt_desc>:

void fill_ldt_desc(u32 base, u32 limit,u16 attr,descriptor *desc)
{
  8069fb:	f3 0f 1e fa          	endbr64 
  8069ff:	55                   	push   rbp
  806a00:	48 89 e5             	mov    rbp,rsp
  806a03:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  806a06:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  806a09:	89 d0                	mov    eax,edx
  806a0b:	48 89 4d e8          	mov    QWORD PTR [rbp-0x18],rcx
  806a0f:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
//    desc->base_lo16=base&0xffff;
//    desc->base_mid8=(base>>16)&0xff;
//    desc->base_hi8=(base>>24)&0xff;
//    desc->limit_lo16=limit&0xffff;
//    desc->attr=attr|(limit>>16&0xf)<<8;
  806a13:	90                   	nop
  806a14:	5d                   	pop    rbp
  806a15:	c3                   	ret    
  806a16:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  806a1d:	00 00 00 

0000000000806a20 <fill_desc>:
  806a20:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  806a25:	67 8b 5c 24 08       	mov    ebx,DWORD PTR [esp+0x8]
  806a2a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  806a2f:	67 8b 54 24 10       	mov    edx,DWORD PTR [esp+0x10]
  806a34:	be 00 60 00 00       	mov    esi,0x6000
  806a39:	c1 e2 03             	shl    edx,0x3
  806a3c:	01 d6                	add    esi,edx
  806a3e:	66 67 89 1e          	mov    WORD PTR [esi],bx
  806a42:	66 67 89 46 02       	mov    WORD PTR [esi+0x2],ax
  806a47:	c1 e8 10             	shr    eax,0x10
  806a4a:	67 88 46 04          	mov    BYTE PTR [esi+0x4],al
  806a4e:	c1 eb 10             	shr    ebx,0x10
  806a51:	67 88 5e 06          	mov    BYTE PTR [esi+0x6],bl
  806a55:	67 88 66 07          	mov    BYTE PTR [esi+0x7],ah
  806a59:	67 09 4e 05          	or     DWORD PTR [esi+0x5],ecx
  806a5d:	c3                   	ret    

0000000000806a5e <clock_c>:
#include <devman.h>
#include <disk.h>
extern int manage_proc_lock;
extern int cur_proc;
extern struct process *task;
void clock_c(){
  806a5e:	f3 0f 1e fa          	endbr64 
  806a62:	55                   	push   rbp
  806a63:	48 89 e5             	mov    rbp,rsp
    //refresh_wnds();
    execute_request();
  806a66:	b8 00 00 00 00       	mov    eax,0x0
  806a6b:	e8 9f 2e 00 00       	call   80990f <execute_request>
    do_req();
  806a70:	b8 00 00 00 00       	mov    eax,0x0
  806a75:	e8 6d d3 ff ff       	call   803de7 <do_req>
    if(!manage_proc_lock)
  806a7a:	8b 05 68 6e 00 00    	mov    eax,DWORD PTR [rip+0x6e68]        # 80d8e8 <manage_proc_lock>
  806a80:	85 c0                	test   eax,eax
  806a82:	75 0a                	jne    806a8e <clock_c+0x30>
    {
        manage_proc();
  806a84:	b8 00 00 00 00       	mov    eax,0x0
  806a89:	e8 50 db ff ff       	call   8045de <manage_proc>
    }
    //puts("1 disk req executed.");
  806a8e:	90                   	nop
  806a8f:	5d                   	pop    rbp
  806a90:	c3                   	ret    
  806a91:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  806a98:	00 00 00 
  806a9b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000806aa0 <clock>:
  806aa0:	50                   	push   rax
  806aa1:	53                   	push   rbx
  806aa2:	51                   	push   rcx
  806aa3:	52                   	push   rdx
  806aa4:	57                   	push   rdi
  806aa5:	56                   	push   rsi
  806aa6:	41 50                	push   r8
  806aa8:	41 51                	push   r9
  806aaa:	41 52                	push   r10
  806aac:	41 53                	push   r11
  806aae:	41 54                	push   r12
  806ab0:	41 55                	push   r13
  806ab2:	41 56                	push   r14
  806ab4:	41 57                	push   r15
  806ab6:	e8 fb da ff ff       	call   8045b6 <save_rsp>
  806abb:	66 8c c0             	mov    ax,es
  806abe:	50                   	push   rax
  806abf:	66 8c d8             	mov    ax,ds
  806ac2:	50                   	push   rax
  806ac3:	66 b8 10 00          	mov    ax,0x10
  806ac7:	8e c0                	mov    es,eax
  806ac9:	8e d8                	mov    ds,eax

0000000000806acb <clock.normal_part>:
  806acb:	b0 20                	mov    al,0x20
  806acd:	e6 a0                	out    0xa0,al
  806acf:	e6 20                	out    0x20,al
  806ad1:	e8 88 ff ff ff       	call   806a5e <clock_c>
  806ad6:	58                   	pop    rax
  806ad7:	8e d8                	mov    ds,eax
  806ad9:	58                   	pop    rax
  806ada:	8e c0                	mov    es,eax
  806adc:	41 5f                	pop    r15
  806ade:	41 5e                	pop    r14
  806ae0:	41 5d                	pop    r13
  806ae2:	41 5c                	pop    r12
  806ae4:	41 5b                	pop    r11
  806ae6:	41 5a                	pop    r10
  806ae8:	41 59                	pop    r9
  806aea:	41 58                	pop    r8
  806aec:	5e                   	pop    rsi
  806aed:	5f                   	pop    rdi
  806aee:	5a                   	pop    rdx
  806aef:	59                   	pop    rcx
  806af0:	5b                   	pop    rbx
  806af1:	58                   	pop    rax
  806af2:	48 cf                	iretq  

0000000000806af4 <execute>:
    return ind;
}
*/

int execute(char *path, char **argv)
{
  806af4:	f3 0f 1e fa          	endbr64 
  806af8:	55                   	push   rbp
  806af9:	48 89 e5             	mov    rbp,rsp
  806afc:	48 83 ec 30          	sub    rsp,0x30
  806b00:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  806b04:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    //尚未切换到目标进程
    //syscall(SYSCALL_REG_PROC, load_pe,0,0,0,0);
    int fno=-1,cwd_fno=-1;
  806b08:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  806b0f:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    if((fno=sys_open(path, O_EXEC)) <0)return -1;
  806b16:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806b1a:	be 00 10 00 00       	mov    esi,0x1000
  806b1f:	48 89 c7             	mov    rdi,rax
  806b22:	e8 99 19 00 00       	call   8084c0 <sys_open>
  806b27:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  806b2a:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  806b2e:	79 0a                	jns    806b3a <execute+0x46>
  806b30:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806b35:	e9 ba 00 00 00       	jmp    806bf4 <execute+0x100>
    //
    char *p=path;
  806b3a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806b3e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='\0';p++);
  806b42:	eb 05                	jmp    806b49 <execute+0x55>
  806b44:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  806b49:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806b4d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806b50:	84 c0                	test   al,al
  806b52:	75 f0                	jne    806b44 <execute+0x50>
    for(;*p!='/'&&p>path;p--);
  806b54:	eb 05                	jmp    806b5b <execute+0x67>
  806b56:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  806b5b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806b5f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806b62:	3c 2f                	cmp    al,0x2f
  806b64:	74 0a                	je     806b70 <execute+0x7c>
  806b66:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806b6a:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  806b6e:	77 e6                	ja     806b56 <execute+0x62>
    if(p>path)
  806b70:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806b74:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  806b78:	76 2f                	jbe    806ba9 <execute+0xb5>
    {
        *p='\0';
  806b7a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806b7e:	c6 00 00             	mov    BYTE PTR [rax],0x0
        if((cwd_fno=sys_open(path, O_DIRECTORY)) <0)return -1;
  806b81:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806b85:	be 00 40 00 00       	mov    esi,0x4000
  806b8a:	48 89 c7             	mov    rdi,rax
  806b8d:	e8 2e 19 00 00       	call   8084c0 <sys_open>
  806b92:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  806b95:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  806b99:	79 07                	jns    806ba2 <execute+0xae>
  806b9b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806ba0:	eb 52                	jmp    806bf4 <execute+0x100>
        *p='/';
  806ba2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806ba6:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
    }
    extern struct file opened[];
    extern struct process task[];
    int pi= reg_proc(proc_start, &opened[cwd_fno], &opened[fno]);
  806ba9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806bac:	48 63 d0             	movsxd rdx,eax
  806baf:	48 89 d0             	mov    rax,rdx
  806bb2:	48 c1 e0 02          	shl    rax,0x2
  806bb6:	48 01 d0             	add    rax,rdx
  806bb9:	48 c1 e0 03          	shl    rax,0x3
  806bbd:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  806bc4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806bc7:	48 63 c8             	movsxd rcx,eax
  806bca:	48 89 c8             	mov    rax,rcx
  806bcd:	48 c1 e0 02          	shl    rax,0x2
  806bd1:	48 01 c8             	add    rax,rcx
  806bd4:	48 c1 e0 03          	shl    rax,0x3
  806bd8:	48 05 60 06 40 00    	add    rax,0x400660
  806bde:	b9 59 6d 80 00       	mov    ecx,0x806d59
  806be3:	48 89 c6             	mov    rsi,rax
  806be6:	48 89 cf             	mov    rdi,rcx
  806be9:	e8 c8 e1 ff ff       	call   804db6 <reg_proc>
  806bee:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    return pi;
  806bf1:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
}
  806bf4:	c9                   	leave  
  806bf5:	c3                   	ret    

0000000000806bf6 <sys_execve>:

int sys_execve(char *path,char **argv){
  806bf6:	f3 0f 1e fa          	endbr64 
  806bfa:	55                   	push   rbp
  806bfb:	48 89 e5             	mov    rbp,rsp
  806bfe:	48 83 ec 30          	sub    rsp,0x30
  806c02:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  806c06:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    int fno=-1,cwd_fno=-1;
  806c0a:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
  806c11:	c7 45 f8 ff ff ff ff 	mov    DWORD PTR [rbp-0x8],0xffffffff
    if((fno=sys_open(path, O_EXEC)) <0)return -ENOENT;
  806c18:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806c1c:	be 00 10 00 00       	mov    esi,0x1000
  806c21:	48 89 c7             	mov    rdi,rax
  806c24:	e8 97 18 00 00       	call   8084c0 <sys_open>
  806c29:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  806c2c:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  806c30:	79 0a                	jns    806c3c <sys_execve+0x46>
  806c32:	b8 d3 ff ff ff       	mov    eax,0xffffffd3
  806c37:	e9 ad 00 00 00       	jmp    806ce9 <sys_execve+0xf3>
//        if((cwd_fno=sys_open(path, O_DIRECTORY)) <0)return -1;
//        *p='/';
//    }
    extern struct file opened[];
    extern struct process task[];
    if(sys_close(current->exef-opened)<0)return -1;
  806c3c:	48 8b 05 fd e5 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e5fd]        # 415240 <current>
  806c43:	48 8b 80 d0 00 00 00 	mov    rax,QWORD PTR [rax+0xd0]
  806c4a:	48 2d 60 06 40 00    	sub    rax,0x400660
  806c50:	48 c1 f8 03          	sar    rax,0x3
  806c54:	48 89 c2             	mov    rdx,rax
  806c57:	48 b8 cd cc cc cc cc 	movabs rax,0xcccccccccccccccd
  806c5e:	cc cc cc 
  806c61:	48 0f af c2          	imul   rax,rdx
  806c65:	89 c7                	mov    edi,eax
  806c67:	e8 eb 1d 00 00       	call   808a57 <sys_close>

    void *retp= load_pe;
  806c6c:	48 c7 45 f0 8b 6d 80 	mov    QWORD PTR [rbp-0x10],0x806d8b
  806c73:	00 
    current->exef=&opened[fno];//改变执行文件
  806c74:	48 8b 15 c5 e5 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e5c5]        # 415240 <current>
  806c7b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806c7e:	48 63 c8             	movsxd rcx,eax
  806c81:	48 89 c8             	mov    rax,rcx
  806c84:	48 c1 e0 02          	shl    rax,0x2
  806c88:	48 01 c8             	add    rax,rcx
  806c8b:	48 c1 e0 03          	shl    rax,0x3
  806c8f:	48 05 60 06 40 00    	add    rax,0x400660
  806c95:	48 89 82 d0 00 00 00 	mov    QWORD PTR [rdx+0xd0],rax
    //重新设置进程数据
    //清空原来的页表
    release_mmap(current);
  806c9c:	48 8b 05 9d e5 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e59d]        # 415240 <current>
  806ca3:	48 89 c7             	mov    rdi,rax
  806ca6:	e8 0f f1 ff ff       	call   805dba <release_mmap>
    current->regs.rsp=STACK_TOP;//清空栈
  806cab:	48 8b 05 8e e5 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e58e]        # 415240 <current>
  806cb2:	48 be 00 f0 ff ff ff 	movabs rsi,0xfffffffff000
  806cb9:	ff 00 00 
  806cbc:	48 89 b0 7c 02 00 00 	mov    QWORD PTR [rax+0x27c],rsi
    extern TSS* tss;
    //sysret直接返回到load_pe加载新程序，然后直接开始运行新程序的main
    stack_store_regs *rs=tss->ists[0]- sizeof(stack_store_regs);
  806cc3:	48 8b 05 d6 6c 00 00 	mov    rax,QWORD PTR [rip+0x6cd6]        # 80d9a0 <tss>
  806cca:	48 8b 40 24          	mov    rax,QWORD PTR [rax+0x24]
  806cce:	48 2d a8 00 00 00    	sub    rax,0xa8
  806cd4:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    rs->rcx=retp;
  806cd8:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  806cdc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806ce0:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    return 0;
  806ce4:	b8 00 00 00 00       	mov    eax,0x0
}
  806ce9:	c9                   	leave  
  806cea:	c3                   	ret    

0000000000806ceb <exec_call>:
int exec_call(char *path)
{
  806ceb:	f3 0f 1e fa          	endbr64 
  806cef:	55                   	push   rbp
  806cf0:	48 89 e5             	mov    rbp,rsp
  806cf3:	48 83 ec 20          	sub    rsp,0x20
  806cf7:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pi= execute(path, NULL);
  806cfb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806cff:	be 00 00 00 00       	mov    esi,0x0
  806d04:	48 89 c7             	mov    rdi,rax
  806d07:	e8 e8 fd ff ff       	call   806af4 <execute>
  806d0c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int tss= _TSS_IND(pi)*8;
  806d0f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806d12:	01 c0                	add    eax,eax
  806d14:	83 c0 05             	add    eax,0x5
  806d17:	c1 e0 03             	shl    eax,0x3
  806d1a:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    extern struct process task[];
    extern int cur_proc;
    switch_proc_tss(pi);
  806d1d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806d20:	89 c7                	mov    edi,eax
  806d22:	e8 4a da ff ff       	call   804771 <switch_proc_tss>
    while(task[pi].stat != TASK_ZOMBIE);
  806d27:	90                   	nop
  806d28:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806d2b:	48 98                	cdqe   
  806d2d:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  806d34:	48 05 50 85 40 00    	add    rax,0x408550
  806d3a:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  806d3d:	83 f8 04             	cmp    eax,0x4
  806d40:	75 e6                	jne    806d28 <exec_call+0x3d>
    return task[pi].exit_code;
  806d42:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806d45:	48 98                	cdqe   
  806d47:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  806d4e:	48 05 60 85 40 00    	add    rax,0x408560
  806d54:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
}
  806d57:	c9                   	leave  
  806d58:	c3                   	ret    

0000000000806d59 <proc_start>:
int proc_start()
{
  806d59:	f3 0f 1e fa          	endbr64 
  806d5d:	55                   	push   rbp
  806d5e:	48 89 e5             	mov    rbp,rsp
    extern struct process task[];
    extern int cur_proc;
    load_pe(&task[cur_proc]);
  806d61:	8b 05 65 e5 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e565]        # 4152cc <cur_proc>
  806d67:	48 98                	cdqe   
  806d69:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  806d70:	48 05 40 85 40 00    	add    rax,0x408540
  806d76:	48 89 c7             	mov    rdi,rax
  806d79:	e8 0d 00 00 00       	call   806d8b <load_pe>
    //释放进程资源
    sys_exit(0);
  806d7e:	bf 00 00 00 00       	mov    edi,0x0
  806d83:	e8 f9 df ff ff       	call   804d81 <sys_exit>
}
  806d88:	90                   	nop
  806d89:	5d                   	pop    rbp
  806d8a:	c3                   	ret    

0000000000806d8b <load_pe>:
//在cr3切换到目标进程下的加载程序
int load_pe(struct process *proc)
{
  806d8b:	f3 0f 1e fa          	endbr64 
  806d8f:	55                   	push   rbp
  806d90:	48 89 e5             	mov    rbp,rsp
  806d93:	48 81 ec e0 02 00 00 	sub    rsp,0x2e0
  806d9a:	48 89 bd 28 fd ff ff 	mov    QWORD PTR [rbp-0x2d8],rdi
    // 读取文件头
    struct file *f=proc->exef;
  806da1:	48 8b 85 28 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2d8]
  806da8:	48 8b 80 d0 00 00 00 	mov    rax,QWORD PTR [rax+0xd0]
  806daf:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    int exefno=-1;
  806db3:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    for(int i=0;i<MAX_PROC_OPENF;i++)
  806dba:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  806dc1:	eb 28                	jmp    806deb <load_pe+0x60>
        if(current->openf[i]==f)
  806dc3:	48 8b 05 76 e4 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e476]        # 415240 <current>
  806dca:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  806dcd:	48 63 d2             	movsxd rdx,edx
  806dd0:	48 83 c2 1a          	add    rdx,0x1a
  806dd4:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  806dd9:	48 39 45 98          	cmp    QWORD PTR [rbp-0x68],rax
  806ddd:	75 08                	jne    806de7 <load_pe+0x5c>
        {
            exefno=i;
  806ddf:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806de2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
            break;
  806de5:	eb 0a                	jmp    806df1 <load_pe+0x66>
    for(int i=0;i<MAX_PROC_OPENF;i++)
  806de7:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806deb:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  806def:	7e d2                	jle    806dc3 <load_pe+0x38>
        }
    if(exefno==-1)return ERR;
  806df1:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  806df5:	75 0a                	jne    806e01 <load_pe+0x76>
  806df7:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806dfc:	e9 3e 07 00 00       	jmp    80753f <load_pe+0x7b4>

    IMAGE_DOS_HEADER tdh;
    IMAGE_NT_HEADERS32 tnth;
    sys_read(exefno, &tdh, sizeof(tdh));
  806e01:	48 8d 8d 60 fe ff ff 	lea    rcx,[rbp-0x1a0]
  806e08:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806e0b:	ba 44 00 00 00       	mov    edx,0x44
  806e10:	48 89 ce             	mov    rsi,rcx
  806e13:	89 c7                	mov    edi,eax
  806e15:	e8 f5 1c 00 00       	call   808b0f <sys_read>
    sys_lseek(exefno,tdh.e_lfanew,SEEK_SET);
  806e1a:	48 8b 85 9c fe ff ff 	mov    rax,QWORD PTR [rbp-0x164]
  806e21:	48 89 c1             	mov    rcx,rax
  806e24:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806e27:	ba 00 00 00 00       	mov    edx,0x0
  806e2c:	48 89 ce             	mov    rsi,rcx
  806e2f:	89 c7                	mov    edi,eax
  806e31:	e8 39 1e 00 00       	call   808c6f <sys_lseek>
    sys_read(exefno, &tnth, sizeof(tnth));
  806e36:	48 8d 8d 50 fd ff ff 	lea    rcx,[rbp-0x2b0]
  806e3d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806e40:	ba 0c 01 00 00       	mov    edx,0x10c
  806e45:	48 89 ce             	mov    rsi,rcx
  806e48:	89 c7                	mov    edi,eax
  806e4a:	e8 c0 1c 00 00       	call   808b0f <sys_read>

    //是否需要移动base(先不检查)
    addr_t nbase=tnth.OptionalHeader.ImageBase;
  806e4f:	48 8b 85 84 fd ff ff 	mov    rax,QWORD PTR [rbp-0x27c]
  806e56:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    int pgn=tnth.OptionalHeader.SizeOfImage/PAGE_SIZE;
  806e5a:	8b 85 a4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x25c]
  806e60:	c1 e8 0c             	shr    eax,0xc
  806e63:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
//        break;
//    }

    //proc->tss.eip=tnth.OptionalHeader.AddressOfEntryPoint+nbase;
    //存放文件头
    sys_lseek(exefno,0,SEEK_SET);
  806e66:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806e69:	ba 00 00 00 00       	mov    edx,0x0
  806e6e:	be 00 00 00 00       	mov    esi,0x0
  806e73:	89 c7                	mov    edi,eax
  806e75:	e8 f5 1d 00 00       	call   808c6f <sys_lseek>
    sys_read(exefno, nbase, PAGE_SIZE);
  806e7a:	48 8b 4d 90          	mov    rcx,QWORD PTR [rbp-0x70]
  806e7e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806e81:	ba 00 10 00 00       	mov    edx,0x1000
  806e86:	48 89 ce             	mov    rsi,rcx
  806e89:	89 c7                	mov    edi,eax
  806e8b:	e8 7f 1c 00 00       	call   808b0f <sys_read>
    //dos头
    PIMAGE_DOS_HEADER dosh=nbase;
  806e90:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806e94:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
    PIMAGE_NT_HEADERS64 nth=nbase+dosh->e_lfanew;
  806e98:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  806e9c:	48 8b 50 3c          	mov    rdx,QWORD PTR [rax+0x3c]
  806ea0:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806ea4:	48 01 d0             	add    rax,rdx
  806ea7:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    PIMAGE_FILE_HEADER fh=&nth->FileHeader;
  806eae:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806eb5:	48 83 c0 04          	add    rax,0x4
  806eb9:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    //为新进程分配内存页
    //计算所需的页
    int prog_size=nth->OptionalHeader.SizeOfImage;
  806ec0:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806ec7:	8b 40 50             	mov    eax,DWORD PTR [rax+0x50]
  806eca:	89 85 6c ff ff ff    	mov    DWORD PTR [rbp-0x94],eax
    int page_count=prog_size/4096;
  806ed0:	8b 85 6c ff ff ff    	mov    eax,DWORD PTR [rbp-0x94]
  806ed6:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  806edc:	85 c0                	test   eax,eax
  806ede:	0f 48 c2             	cmovs  eax,edx
  806ee1:	c1 f8 0c             	sar    eax,0xc
  806ee4:	89 85 68 ff ff ff    	mov    DWORD PTR [rbp-0x98],eax

    addr_t shell_addr=nth->OptionalHeader.AddressOfEntryPoint+nbase;
  806eea:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806ef1:	8b 40 28             	mov    eax,DWORD PTR [rax+0x28]
  806ef4:	89 c2                	mov    edx,eax
  806ef6:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  806efa:	48 01 d0             	add    rax,rdx
  806efd:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
    int page_index_item_count=page_count/1024+page_count%1024==0?0:1;
  806f04:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [rbp-0x98]
  806f0a:	8d 90 ff 03 00 00    	lea    edx,[rax+0x3ff]
  806f10:	85 c0                	test   eax,eax
  806f12:	0f 48 c2             	cmovs  eax,edx
  806f15:	c1 f8 0a             	sar    eax,0xa
  806f18:	89 c1                	mov    ecx,eax
  806f1a:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [rbp-0x98]
  806f20:	99                   	cdq    
  806f21:	c1 ea 16             	shr    edx,0x16
  806f24:	01 d0                	add    eax,edx
  806f26:	25 ff 03 00 00       	and    eax,0x3ff
  806f2b:	29 d0                	sub    eax,edx
  806f2d:	01 c8                	add    eax,ecx
  806f2f:	85 c0                	test   eax,eax
  806f31:	0f 95 c0             	setne  al
  806f34:	0f b6 c0             	movzx  eax,al
  806f37:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
    int start_pgind_item=shell_addr/PAGE_INDEX_SIZE;
  806f3d:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  806f44:	48 c1 e8 15          	shr    rax,0x15
  806f48:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax

    //sys_read sections
    PIMAGE_SECTION_HEADER psec=(u32)nth+sizeof(IMAGE_NT_HEADERS32);
  806f4e:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806f55:	89 c0                	mov    eax,eax
  806f57:	48 05 0c 01 00 00    	add    rax,0x10c
  806f5d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
    nth->FileHeader.NumberOfSections*sizeof(IMAGE_SECTION_HEADER);
  806f61:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806f68:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  806f6c:	0f b7 d0             	movzx  edx,ax
  806f6f:	89 d0                	mov    eax,edx
  806f71:	c1 e0 02             	shl    eax,0x2
  806f74:	01 d0                	add    eax,edx
  806f76:	c1 e0 03             	shl    eax,0x3
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
  806f79:	05 50 01 00 00       	add    eax,0x150
  806f7e:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
    int align=nth->OptionalHeader.FileAlignment;
  806f84:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806f8b:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  806f8e:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    data_start=data_start%align?data_start-data_start%align+align:data_start;
  806f94:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  806f9a:	99                   	cdq    
  806f9b:	f7 bd 50 ff ff ff    	idiv   DWORD PTR [rbp-0xb0]
  806fa1:	89 d0                	mov    eax,edx
  806fa3:	85 c0                	test   eax,eax
  806fa5:	74 23                	je     806fca <load_pe+0x23f>
  806fa7:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  806fad:	99                   	cdq    
  806fae:	f7 bd 50 ff ff ff    	idiv   DWORD PTR [rbp-0xb0]
  806fb4:	89 d1                	mov    ecx,edx
  806fb6:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  806fbc:	29 c8                	sub    eax,ecx
  806fbe:	89 c2                	mov    edx,eax
  806fc0:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  806fc6:	01 d0                	add    eax,edx
  806fc8:	eb 06                	jmp    806fd0 <load_pe+0x245>
  806fca:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  806fd0:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  806fd6:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  806fdd:	eb 6b                	jmp    80704a <load_pe+0x2bf>
    {
        int disca=psec->Characteristics&IMAGE_SCN_MEM_DISCARDABLE;
  806fdf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806fe3:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  806fe6:	25 00 00 00 02       	and    eax,0x2000000
  806feb:	89 85 c0 fe ff ff    	mov    DWORD PTR [rbp-0x140],eax
        if(disca)
  806ff1:	83 bd c0 fe ff ff 00 	cmp    DWORD PTR [rbp-0x140],0x0
  806ff8:	75 46                	jne    807040 <load_pe+0x2b5>
            continue;
        //直接读，缺页内核解决
        sys_lseek(exefno,psec->PointerToRawData,SEEK_SET);
  806ffa:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806ffe:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  807001:	89 c1                	mov    ecx,eax
  807003:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807006:	ba 00 00 00 00       	mov    edx,0x0
  80700b:	48 89 ce             	mov    rsi,rcx
  80700e:	89 c7                	mov    edi,eax
  807010:	e8 5a 1c 00 00       	call   808c6f <sys_lseek>
        sys_read(exefno, psec->VirtualAddress + nbase,  psec->SizeOfRawData);
  807015:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807019:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80701c:	89 c2                	mov    edx,eax
  80701e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807022:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  807025:	89 c1                	mov    ecx,eax
  807027:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80702b:	48 01 c8             	add    rax,rcx
  80702e:	48 89 c1             	mov    rcx,rax
  807031:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807034:	48 89 ce             	mov    rsi,rcx
  807037:	89 c7                	mov    edi,eax
  807039:	e8 d1 1a 00 00       	call   808b0f <sys_read>
  80703e:	eb 01                	jmp    807041 <load_pe+0x2b6>
            continue;
  807040:	90                   	nop
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  807041:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  807045:	48 83 45 f0 28       	add    QWORD PTR [rbp-0x10],0x28
  80704a:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  807051:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  807055:	0f b7 c0             	movzx  eax,ax
  807058:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80705b:	7c 82                	jl     806fdf <load_pe+0x254>

    }

    //通过导入表加载需要的dll
    PIMAGE_DATA_DIRECTORY impd=&nth->OptionalHeader.DataDirectory[1];
  80705d:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  807064:	48 05 90 00 00 00    	add    rax,0x90
  80706a:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    if(impd->Size>0)
  807071:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  807078:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80707b:	85 c0                	test   eax,eax
  80707d:	0f 84 7b 02 00 00    	je     8072fe <load_pe+0x573>
    {
        int tmpi=impd->VirtualAddress+nbase;
  807083:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80708a:	8b 10                	mov    edx,DWORD PTR [rax]
  80708c:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  807090:	01 d0                	add    eax,edx
  807092:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
        PIMAGE_IMPORT_DESCRIPTOR impdes=tmpi;
  807098:	8b 85 44 ff ff ff    	mov    eax,DWORD PTR [rbp-0xbc]
  80709e:	48 98                	cdqe   
  8070a0:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        int dllp;
        while (impdes->Characteristics)
  8070a4:	e9 47 02 00 00       	jmp    8072f0 <load_pe+0x565>
        {
            //加载dll
            char *dllname=impdes->Name+nbase;
  8070a9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8070ad:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  8070b0:	89 c2                	mov    edx,eax
  8070b2:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8070b6:	48 01 d0             	add    rax,rdx
  8070b9:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
            //此处应有加载dll代码
            int dlli;
            if(strcmp(dllname,"sys.dll")==0)//加载系统dll的部分由内核已经完成
  8070c0:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
  8070c7:	be 9f 56 81 00       	mov    esi,0x81569f
  8070cc:	48 89 c7             	mov    rdi,rax
  8070cf:	e8 d4 60 00 00       	call   80d1a8 <strcmp>
  8070d4:	85 c0                	test   eax,eax
  8070d6:	75 09                	jne    8070e1 <load_pe+0x356>
            {
                dllp=0x1c00000;
  8070d8:	c7 45 dc 00 00 c0 01 	mov    DWORD PTR [rbp-0x24],0x1c00000
  8070df:	eb 25                	jmp    807106 <load_pe+0x37b>
            }else{
                //load_pe要记录module的加载
                dlli= load_pe(proc);
  8070e1:	48 8b 85 28 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2d8]
  8070e8:	48 89 c7             	mov    rdi,rax
  8070eb:	e8 9b fc ff ff       	call   806d8b <load_pe>
  8070f0:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
                //dlli=load_library(dllname);
                //这个是线性地址
                dllp=get_module_addr(dlli);
  8070f6:	8b 85 34 ff ff ff    	mov    eax,DWORD PTR [rbp-0xcc]
  8070fc:	89 c7                	mov    edi,eax
  8070fe:	e8 3e 04 00 00       	call   807541 <get_module_addr>
  807103:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            }
            //从线性地址查页表找到物理地址
            PIMAGE_DOS_HEADER dlldos=dllp;
  807106:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  807109:	48 98                	cdqe   
  80710b:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
            PIMAGE_NT_HEADERS32 dllnth=dllp+dlldos->e_lfanew;
  807112:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  807115:	48 63 d0             	movsxd rdx,eax
  807118:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  80711f:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  807123:	48 01 d0             	add    rax,rdx
  807126:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
            PIMAGE_EXPORT_DIRECTORY dllexp=(dllnth->OptionalHeader.DataDirectory[0].VirtualAddress+dllp);
  80712d:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  807134:	8b 90 8c 00 00 00    	mov    edx,DWORD PTR [rax+0x8c]
  80713a:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80713d:	01 d0                	add    eax,edx
  80713f:	89 c0                	mov    eax,eax
  807141:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
            int funcn=dllexp->NumberOfNames;
  807148:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80714f:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  807152:	89 85 14 ff ff ff    	mov    DWORD PTR [rbp-0xec],eax
            char **fnames=dllexp->AddressOfNames+dllp;
  807158:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80715f:	8b 50 20             	mov    edx,DWORD PTR [rax+0x20]
  807162:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  807165:	01 d0                	add    eax,edx
  807167:	89 c0                	mov    eax,eax
  807169:	48 89 85 08 ff ff ff 	mov    QWORD PTR [rbp-0xf8],rax
            int *funcaddrs=dllexp->AddressOfFunctions+dllp;
  807170:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  807177:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  80717a:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80717d:	01 d0                	add    eax,edx
  80717f:	89 c0                	mov    eax,eax
  807181:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
            short *funcords=dllexp->AddressOfNameOrdinals+dllp;
  807188:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80718f:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  807192:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  807195:	01 d0                	add    eax,edx
  807197:	89 c0                	mov    eax,eax
  807199:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
            //寻找nameordinal的base（最小值），里面的数据加上base才是真正的序号
            unsigned int ord_base=dllexp->Base;
  8071a0:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8071a7:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8071aa:	89 85 f4 fe ff ff    	mov    DWORD PTR [rbp-0x10c],eax
            //开始将导入表IAT的内容更新为函数地址
            unsigned int *iataddrs=impdes->FirstThunk+nbase;//IAT和INT内容一样，只用IAT
  8071b0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8071b4:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8071b7:	89 c2                	mov    edx,eax
  8071b9:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8071bd:	48 01 d0             	add    rax,rdx
  8071c0:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            char **siataddrs=impdes->FirstThunk+nbase;
  8071c4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8071c8:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8071cb:	89 c2                	mov    edx,eax
  8071cd:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8071d1:	48 01 d0             	add    rax,rdx
  8071d4:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            while (*iataddrs)
  8071d8:	e9 00 01 00 00       	jmp    8072dd <load_pe+0x552>
            {
                //判断是序号导入还是名称导入
                if(((unsigned)*iataddrs)&0x80000000)
  8071dd:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8071e1:	8b 00                	mov    eax,DWORD PTR [rax]
  8071e3:	85 c0                	test   eax,eax
  8071e5:	79 43                	jns    80722a <load_pe+0x49f>
                {
                    //序号导入
                    unsigned int ord=((*iataddrs)&0x7fffffff)-ord_base;
  8071e7:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8071eb:	8b 00                	mov    eax,DWORD PTR [rax]
  8071ed:	25 ff ff ff 7f       	and    eax,0x7fffffff
  8071f2:	2b 85 f4 fe ff ff    	sub    eax,DWORD PTR [rbp-0x10c]
  8071f8:	89 85 e0 fe ff ff    	mov    DWORD PTR [rbp-0x120],eax
                    *iataddrs=funcaddrs[ord]+dllp;
  8071fe:	8b 85 e0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x120]
  807204:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  80720b:	00 
  80720c:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  807213:	48 01 d0             	add    rax,rdx
  807216:	8b 10                	mov    edx,DWORD PTR [rax]
  807218:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80721b:	01 d0                	add    eax,edx
  80721d:	89 c2                	mov    edx,eax
  80721f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807223:	89 10                	mov    DWORD PTR [rax],edx
  807225:	e9 a9 00 00 00       	jmp    8072d3 <load_pe+0x548>
                }else
                {
                    //名称导入
                    char *import_by_name_p=*iataddrs;//指向IMPORT_BY_NAME
  80722a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80722e:	8b 00                	mov    eax,DWORD PTR [rax]
  807230:	89 c0                	mov    eax,eax
  807232:	48 89 85 e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],rax
                    import_by_name_p+=2;//跳过开头两字节序号
  807239:	48 83 85 e8 fe ff ff 	add    QWORD PTR [rbp-0x118],0x2
  807240:	02 
                    int i=0;
  807241:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
                    for(;i<funcn;i++)
  807248:	eb 7a                	jmp    8072c4 <load_pe+0x539>
                    {
                        if(strcmp(import_by_name_p,fnames[i])==0)
  80724a:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80724d:	48 98                	cdqe   
  80724f:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  807256:	00 
  807257:	48 8b 85 08 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf8]
  80725e:	48 01 d0             	add    rax,rdx
  807261:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  807264:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
  80726b:	48 89 d6             	mov    rsi,rdx
  80726e:	48 89 c7             	mov    rdi,rax
  807271:	e8 32 5f 00 00       	call   80d1a8 <strcmp>
  807276:	85 c0                	test   eax,eax
  807278:	75 46                	jne    8072c0 <load_pe+0x535>
                        {
                            int ordi=funcords[i];
  80727a:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80727d:	48 98                	cdqe   
  80727f:	48 8d 14 00          	lea    rdx,[rax+rax*1]
  807283:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80728a:	48 01 d0             	add    rax,rdx
  80728d:	0f b7 00             	movzx  eax,WORD PTR [rax]
  807290:	98                   	cwde   
  807291:	89 85 e4 fe ff ff    	mov    DWORD PTR [rbp-0x11c],eax
                            *iataddrs=funcaddrs[ordi]+dllp;//导入表中的IAT内容修改成地址
  807297:	8b 85 e4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x11c]
  80729d:	48 98                	cdqe   
  80729f:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8072a6:	00 
  8072a7:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  8072ae:	48 01 d0             	add    rax,rdx
  8072b1:	8b 10                	mov    edx,DWORD PTR [rax]
  8072b3:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8072b6:	01 d0                	add    eax,edx
  8072b8:	89 c2                	mov    edx,eax
  8072ba:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8072be:	89 10                	mov    DWORD PTR [rax],edx
                    for(;i<funcn;i++)
  8072c0:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
  8072c4:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8072c7:	3b 85 14 ff ff ff    	cmp    eax,DWORD PTR [rbp-0xec]
  8072cd:	0f 8c 77 ff ff ff    	jl     80724a <load_pe+0x4bf>
                        }
                    }
                }
                iataddrs++;
  8072d3:	48 83 45 d0 04       	add    QWORD PTR [rbp-0x30],0x4
                siataddrs++;
  8072d8:	48 83 45 c8 08       	add    QWORD PTR [rbp-0x38],0x8
            while (*iataddrs)
  8072dd:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8072e1:	8b 00                	mov    eax,DWORD PTR [rax]
  8072e3:	85 c0                	test   eax,eax
  8072e5:	0f 85 f2 fe ff ff    	jne    8071dd <load_pe+0x452>
            }
            impdes++;
  8072eb:	48 83 45 e0 14       	add    QWORD PTR [rbp-0x20],0x14
        while (impdes->Characteristics)
  8072f0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8072f4:	8b 00                	mov    eax,DWORD PTR [rax]
  8072f6:	85 c0                	test   eax,eax
  8072f8:	0f 85 ab fd ff ff    	jne    8070a9 <load_pe+0x31e>
        }
    }


    //开始重定位
    PIMAGE_BASE_RELOCATION relp=0;
  8072fe:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  807305:	00 
    if(nth->OptionalHeader.DataDirectory[5].Size>0)
  807306:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  80730d:	8b 80 b4 00 00 00    	mov    eax,DWORD PTR [rax+0xb4]
  807313:	85 c0                	test   eax,eax
  807315:	0f 84 ec 00 00 00    	je     807407 <load_pe+0x67c>
    {
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  80731b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  807322:	8b 90 b0 00 00 00    	mov    edx,DWORD PTR [rax+0xb0]
                                +(u32)nbase);
  807328:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  80732c:	01 d0                	add    eax,edx
  80732e:	89 c0                	mov    eax,eax
  807330:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        u16 *reloc=relp+sizeof(IMAGE_BASE_RELOCATION);
  807334:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807338:	48 83 c0 40          	add    rax,0x40
  80733c:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        u16 *rtype=reloc+1;
  807340:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807344:	48 83 c0 02          	add    rax,0x2
  807348:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
        int old_base=nth->OptionalHeader.ImageBase;
  80734c:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  807353:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807357:	89 85 dc fe ff ff    	mov    DWORD PTR [rbp-0x124],eax
        while(relp->VirtualAddress){
  80735d:	e9 97 00 00 00       	jmp    8073f9 <load_pe+0x66e>
            int pgva=relp->VirtualAddress+nbase;
  807362:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807366:	8b 10                	mov    edx,DWORD PTR [rax]
  807368:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80736c:	01 d0                	add    eax,edx
  80736e:	89 85 d8 fe ff ff    	mov    DWORD PTR [rbp-0x128],eax
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  807374:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
  80737b:	eb 5a                	jmp    8073d7 <load_pe+0x64c>
            {
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  80737d:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  807381:	0f b7 00             	movzx  eax,WORD PTR [rax]
  807384:	66 85 c0             	test   ax,ax
  807387:	74 49                	je     8073d2 <load_pe+0x647>
                int *at=*reloc+pgva;//要重定位的数据的地址
  807389:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80738d:	0f b7 00             	movzx  eax,WORD PTR [rax]
  807390:	0f b7 d0             	movzx  edx,ax
  807393:	8b 85 d8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x128]
  807399:	01 d0                	add    eax,edx
  80739b:	48 98                	cdqe   
  80739d:	48 89 85 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],rax
                *at=*at-old_base+nbase;
  8073a4:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
  8073ab:	8b 00                	mov    eax,DWORD PTR [rax]
  8073ad:	2b 85 dc fe ff ff    	sub    eax,DWORD PTR [rbp-0x124]
  8073b3:	89 c2                	mov    edx,eax
  8073b5:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8073b9:	01 d0                	add    eax,edx
  8073bb:	89 c2                	mov    edx,eax
  8073bd:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
  8073c4:	89 10                	mov    DWORD PTR [rax],edx
                //下一个
                reloc+=2;
  8073c6:	48 83 45 b0 04       	add    QWORD PTR [rbp-0x50],0x4
                rtype+=2;
  8073cb:	48 83 45 a8 04       	add    QWORD PTR [rbp-0x58],0x4
  8073d0:	eb 01                	jmp    8073d3 <load_pe+0x648>
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  8073d2:	90                   	nop
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  8073d3:	83 45 a4 01          	add    DWORD PTR [rbp-0x5c],0x1
  8073d7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8073db:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8073de:	c1 e8 02             	shr    eax,0x2
  8073e1:	89 c2                	mov    edx,eax
  8073e3:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  8073e6:	39 c2                	cmp    edx,eax
  8073e8:	77 93                	ja     80737d <load_pe+0x5f2>
            }
            relp=(int)relp+0x1000;
  8073ea:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8073ee:	05 00 10 00 00       	add    eax,0x1000
  8073f3:	48 98                	cdqe   
  8073f5:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        while(relp->VirtualAddress){
  8073f9:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8073fd:	8b 00                	mov    eax,DWORD PTR [rax]
  8073ff:	85 c0                	test   eax,eax
  807401:	0f 85 5b ff ff ff    	jne    807362 <load_pe+0x5d7>
        }
    }
    extern struct process task[];
    extern int cur_proc;
    //初始化堆
    chunk_header hdrtmp={
  807407:	c7 85 30 fd ff ff 00 	mov    DWORD PTR [rbp-0x2d0],0x0
  80740e:	00 00 00 
  807411:	c7 85 34 fd ff ff 00 	mov    DWORD PTR [rbp-0x2cc],0x0
  807418:	00 00 00 
  80741b:	48 c7 85 38 fd ff ff 	mov    QWORD PTR [rbp-0x2c8],0x0
  807422:	00 00 00 00 
  807426:	48 c7 85 40 fd ff ff 	mov    QWORD PTR [rbp-0x2c0],0x0
  80742d:	00 00 00 00 
            .next=NULL,
            .pgn=0,
            .prev=NULL
    };//空堆
    //拷贝触发页中断然后分配
    memcpy((chunk_header*)HEAP_BASE,&hdrtmp,sizeof(hdrtmp));
  807431:	48 8d 85 30 fd ff ff 	lea    rax,[rbp-0x2d0]
  807438:	ba 18 00 00 00       	mov    edx,0x18
  80743d:	48 89 c6             	mov    rsi,rax
  807440:	bf 00 00 00 01       	mov    edi,0x1000000
  807445:	e8 c0 5a 00 00       	call   80cf0a <memcpy>
    task[cur_proc].mem_struct.heap_base=HEAP_BASE;
  80744a:	8b 05 7c de c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0de7c]        # 4152cc <cur_proc>
  807450:	48 98                	cdqe   
  807452:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  807459:	48 05 60 85 40 00    	add    rax,0x408560
  80745f:	c7 40 08 00 00 00 01 	mov    DWORD PTR [rax+0x8],0x1000000
    task[cur_proc].mem_struct.heap_top=HEAP_BASE+CHUNK_SIZE;
  807466:	8b 05 60 de c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0de60]        # 4152cc <cur_proc>
  80746c:	48 98                	cdqe   
  80746e:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  807475:	48 05 60 85 40 00    	add    rax,0x408560
  80747b:	c7 40 0c 00 10 00 01 	mov    DWORD PTR [rax+0xc],0x1001000
    //设置栈
    task[cur_proc].mem_struct.stack_top=STACK_TOP;
  807482:	8b 05 44 de c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0de44]        # 4152cc <cur_proc>
  807488:	48 98                	cdqe   
  80748a:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  807491:	48 05 60 85 40 00    	add    rax,0x408560
  807497:	c7 40 14 00 f0 ff ff 	mov    DWORD PTR [rax+0x14],0xfffff000


    //完毕,调用入口函数
    //重定位完毕，准备调用DllMain
    typedef int (*Main)(int,void*);
    Main main=shell_addr;
  80749e:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  8074a5:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
    int ecode=main(0,NULL);
  8074ac:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  8074b3:	be 00 00 00 00       	mov    esi,0x0
  8074b8:	bf 00 00 00 00       	mov    edi,0x0
  8074bd:	ff d0                	call   rax
  8074bf:	89 85 c4 fe ff ff    	mov    DWORD PTR [rbp-0x13c],eax
  8074c5:	c7 85 bc fe ff ff 14 	mov    DWORD PTR [rbp-0x144],0x14
  8074cc:	00 00 00 
  8074cf:	8b 85 c4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x13c]
  8074d5:	89 85 b8 fe ff ff    	mov    DWORD PTR [rbp-0x148],eax
  8074db:	c7 85 b4 fe ff ff 00 	mov    DWORD PTR [rbp-0x14c],0x0
  8074e2:	00 00 00 
  8074e5:	c7 85 b0 fe ff ff 00 	mov    DWORD PTR [rbp-0x150],0x0
  8074ec:	00 00 00 
  8074ef:	c7 85 ac fe ff ff 00 	mov    DWORD PTR [rbp-0x154],0x0
  8074f6:	00 00 00 
  8074f9:	c7 85 a8 fe ff ff 00 	mov    DWORD PTR [rbp-0x158],0x0
  807500:	00 00 00 
  807503:	c7 85 a4 fe ff ff 00 	mov    DWORD PTR [rbp-0x15c],0x0
  80750a:	00 00 00 
    unsigned int argv;
    unsigned int argc;
}proc_ret_stack;

__attribute__((__always_inline__))inline int do_syscall(int func,int a1,int a2,int a3,int a4,int a5,int a6){
        asm volatile(".byte 0x48\n"
  80750d:	8b 85 bc fe ff ff    	mov    eax,DWORD PTR [rbp-0x144]
  807513:	8b bd b8 fe ff ff    	mov    edi,DWORD PTR [rbp-0x148]
  807519:	8b b5 b4 fe ff ff    	mov    esi,DWORD PTR [rbp-0x14c]
  80751f:	8b 95 b0 fe ff ff    	mov    edx,DWORD PTR [rbp-0x150]
  807525:	8b 8d ac fe ff ff    	mov    ecx,DWORD PTR [rbp-0x154]
  80752b:	44 8b 85 a8 fe ff ff 	mov    r8d,DWORD PTR [rbp-0x158]
  807532:	44 8b 8d a4 fe ff ff 	mov    r9d,DWORD PTR [rbp-0x15c]
  807539:	48 0f 05             	rex.W syscall 
                 "syscall"::"a"(func),"D"(a1),"S"(a2),"d"(a3),"c"(a4),"r"(a5),"r"(a6));
}
  80753c:	90                   	nop
    do_syscall(SYSCALL_EXIT,ecode,0,0,0,0,0);
    //
    //不应该执行到这
    while(1);
  80753d:	eb fe                	jmp    80753d <load_pe+0x7b2>
    return task[cur_proc].exit_code;
}
  80753f:	c9                   	leave  
  807540:	c3                   	ret    

0000000000807541 <get_module_addr>:

int get_module_addr(int mi)
{
  807541:	f3 0f 1e fa          	endbr64 
  807545:	55                   	push   rbp
  807546:	48 89 e5             	mov    rbp,rsp
  807549:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return modules[mi].base;
  80754c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80754f:	48 98                	cdqe   
  807551:	8b 04 c5 e0 7e 42 00 	mov    eax,DWORD PTR [rax*8+0x427ee0]
}
  807558:	5d                   	pop    rbp
  807559:	c3                   	ret    

000000000080755a <dispose_library>:
int dispose_library(int dlln)
{
  80755a:	f3 0f 1e fa          	endbr64 
  80755e:	55                   	push   rbp
  80755f:	48 89 e5             	mov    rbp,rsp
  807562:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if(dlln<0||dlln>=MAX_DLLS)return -1;
  807565:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807569:	78 09                	js     807574 <dispose_library+0x1a>
  80756b:	81 7d fc ff 00 00 00 	cmp    DWORD PTR [rbp-0x4],0xff
  807572:	7e 07                	jle    80757b <dispose_library+0x21>
  807574:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807579:	eb 1d                	jmp    807598 <dispose_library+0x3e>
    //空间不够，释放之前申请的
    // for(int j=0;j<dlls[dlln].page_used;j++)
    //     dispose_page(get_phyaddr(dlls[dlln].page_num[j]));
    //释放dll
    dlls[dlln].flag=DLL_STAT_EMPTY;
  80757b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80757e:	48 98                	cdqe   
  807580:	48 69 c0 2c 01 00 00 	imul   rax,rax,0x12c
  807587:	48 05 e8 52 41 00    	add    rax,0x4152e8
  80758d:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return 0;
  807593:	b8 00 00 00 00       	mov    eax,0x0
}
  807598:	5d                   	pop    rbp
  807599:	c3                   	ret    

000000000080759a <sys_insmod>:

    return 0;
} */

int sys_insmod(char *path)
{
  80759a:	f3 0f 1e fa          	endbr64 
  80759e:	55                   	push   rbp
  80759f:	48 89 e5             	mov    rbp,rsp
  8075a2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  8075a6:	90                   	nop
  8075a7:	5d                   	pop    rbp
  8075a8:	c3                   	ret    

00000000008075a9 <sys_rmmod>:
int sys_rmmod(char *name)
{
  8075a9:	f3 0f 1e fa          	endbr64 
  8075ad:	55                   	push   rbp
  8075ae:	48 89 e5             	mov    rbp,rsp
  8075b1:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

  8075b5:	90                   	nop
  8075b6:	5d                   	pop    rbp
  8075b7:	c3                   	ret    
  8075b8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  8075bf:	00 

00000000008075c0 <_syscall>:
  8075c0:	55                   	push   rbp
  8075c1:	bd 00 80 10 00       	mov    ebp,0x108000
  8075c6:	48 89 65 14          	mov    QWORD PTR [rbp+0x14],rsp
  8075ca:	48 8b 65 04          	mov    rsp,QWORD PTR [rbp+0x4]
  8075ce:	50                   	push   rax
  8075cf:	53                   	push   rbx
  8075d0:	51                   	push   rcx
  8075d1:	52                   	push   rdx
  8075d2:	57                   	push   rdi
  8075d3:	56                   	push   rsi
  8075d4:	41 50                	push   r8
  8075d6:	41 51                	push   r9
  8075d8:	41 52                	push   r10
  8075da:	41 53                	push   r11
  8075dc:	41 54                	push   r12
  8075de:	41 55                	push   r13
  8075e0:	41 56                	push   r14
  8075e2:	41 57                	push   r15
  8075e4:	66 8c c0             	mov    ax,es
  8075e7:	50                   	push   rax
  8075e8:	66 8c d8             	mov    ax,ds
  8075eb:	50                   	push   rax
  8075ec:	66 b8 10 00          	mov    ax,0x10
  8075f0:	8e c0                	mov    es,eax
  8075f2:	8e d8                	mov    ds,eax
  8075f4:	48 8b 44 24 78       	mov    rax,QWORD PTR [rsp+0x78]
  8075f9:	41 53                	push   r11
  8075fb:	51                   	push   rcx
  8075fc:	49 87 ca             	xchg   r10,rcx
  8075ff:	e8 96 8f ff ff       	call   80059a <syscall>
  807604:	4c 87 d1             	xchg   rcx,r10
  807607:	59                   	pop    rcx
  807608:	41 5b                	pop    r11
  80760a:	48 89 44 24 78       	mov    QWORD PTR [rsp+0x78],rax
  80760f:	58                   	pop    rax
  807610:	8e d8                	mov    ds,eax
  807612:	58                   	pop    rax
  807613:	8e c0                	mov    es,eax
  807615:	41 5f                	pop    r15
  807617:	41 5e                	pop    r14
  807619:	41 5d                	pop    r13
  80761b:	41 5c                	pop    r12
  80761d:	41 5b                	pop    r11
  80761f:	41 5a                	pop    r10
  807621:	41 59                	pop    r9
  807623:	41 58                	pop    r8
  807625:	5e                   	pop    rsi
  807626:	5f                   	pop    rdi
  807627:	5a                   	pop    rdx
  807628:	59                   	pop    rcx
  807629:	5b                   	pop    rbx
  80762a:	58                   	pop    rax
  80762b:	48 89 65 04          	mov    QWORD PTR [rbp+0x4],rsp
  80762f:	48 8b 65 14          	mov    rsp,QWORD PTR [rbp+0x14]
  807633:	5d                   	pop    rbp
  807634:	fb                   	sti    
  807635:	48 0f 07             	sysretq 

0000000000807638 <init_framebuffer>:
static u32 font_width_bytes;
static u8 *glyph_table;
static u32 bytes_per_glyph, glyph_nr;
int font_size=1;
void init_framebuffer()
{
  807638:	f3 0f 1e fa          	endbr64 
  80763c:	55                   	push   rbp
  80763d:	48 89 e5             	mov    rbp,rsp
  807640:	48 83 ec 50          	sub    rsp,0x50
    //映射页帧内存
    size_t w=framebuffer.common.framebuffer_width;
  807644:	8b 05 aa 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20caa]        # 4282f4 <framebuffer+0x14>
  80764a:	89 c0                	mov    eax,eax
  80764c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    size_t h=framebuffer.common.framebuffer_height;
  807650:	8b 05 a2 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20ca2]        # 4282f8 <framebuffer+0x18>
  807656:	89 c0                	mov    eax,eax
  807658:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    size_t bypp=framebuffer.common.framebuffer_bpp/8;
  80765c:	0f b6 05 99 0c c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20c99]        # 4282fc <framebuffer+0x1c>
  807663:	c0 e8 03             	shr    al,0x3
  807666:	0f b6 c0             	movzx  eax,al
  807669:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    size_t inter=framebuffer.common.framebuffer_pitch;
  80766d:	8b 05 7d 0c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20c7d]        # 4282f0 <framebuffer+0x10>
  807673:	89 c0                	mov    eax,eax
  807675:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    size_t pc=w*h;
  807679:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80767d:	48 0f af 45 d8       	imul   rax,QWORD PTR [rbp-0x28]
  807682:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    size_t size=h*inter;
  807686:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80768a:	48 0f af 45 c8       	imul   rax,QWORD PTR [rbp-0x38]
  80768f:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    int pgc=size/PAGE_SIZE;
  807693:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807697:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  80769e:	48 85 c0             	test   rax,rax
  8076a1:	48 0f 48 c2          	cmovs  rax,rdx
  8076a5:	48 c1 f8 0c          	sar    rax,0xc
  8076a9:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    addr_t p=FRAMEBUFFER_ADDR;
  8076ac:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x40000000
  8076b3:	40 
    addr_t pp=framebuffer.common.framebuffer_addr;
  8076b4:	48 8b 05 2d 0c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20c2d]        # 4282e8 <framebuffer+0x8>
  8076bb:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for (size_t i = 0; i < pgc; i++)
  8076bf:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  8076c6:	00 
  8076c7:	eb 2d                	jmp    8076f6 <init_framebuffer+0xbe>
    {
        mmap(pp,p,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  8076c9:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  8076cd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8076d1:	ba 07 00 00 00       	mov    edx,0x7
  8076d6:	48 89 ce             	mov    rsi,rcx
  8076d9:	48 89 c7             	mov    rdi,rax
  8076dc:	e8 9c 97 ff ff       	call   800e7d <mmap>
        pp+=PAGE_SIZE;
  8076e1:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  8076e8:	00 
        p+=PAGE_SIZE;
  8076e9:	48 81 45 f8 00 10 00 	add    QWORD PTR [rbp-0x8],0x1000
  8076f0:	00 
    for (size_t i = 0; i < pgc; i++)
  8076f1:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  8076f6:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8076f9:	48 98                	cdqe   
  8076fb:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  8076ff:	7c c8                	jl     8076c9 <init_framebuffer+0x91>
    }
    
    
}
  807701:	90                   	nop
  807702:	90                   	nop
  807703:	c9                   	leave  
  807704:	c3                   	ret    

0000000000807705 <init_font>:
void init_font(){
  807705:	f3 0f 1e fa          	endbr64 
  807709:	55                   	push   rbp
  80770a:	48 89 e5             	mov    rbp,rsp
    boot_font = (struct psf2_header*) _binary_res_font_psf_start;
  80770d:	48 c7 05 08 0c c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20c08],0x80dd28        # 428320 <boot_font>
  807714:	28 dd 80 00 

    font_width_bytes = (boot_font->width + 7) / 8;
  807718:	48 8b 05 01 0c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20c01]        # 428320 <boot_font>
  80771f:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  807722:	83 c0 07             	add    eax,0x7
  807725:	c1 e8 03             	shr    eax,0x3
  807728:	89 05 02 0c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20c02],eax        # 428330 <font_width_bytes>
    font_width = font_width_bytes * 8;
  80772e:	8b 05 fc 0b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20bfc]        # 428330 <font_width_bytes>
  807734:	c1 e0 03             	shl    eax,0x3
  807737:	89 05 eb 0b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20beb],eax        # 428328 <font_width>
    font_height = boot_font->height;
  80773d:	48 8b 05 dc 0b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20bdc]        # 428320 <boot_font>
  807744:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  807747:	89 05 df 0b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20bdf],eax        # 42832c <font_height>

    glyph_table = (u8*)_binary_res_font_psf_start+boot_font->header_size;
  80774d:	48 8b 05 cc 0b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20bcc]        # 428320 <boot_font>
  807754:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  807757:	89 c0                	mov    eax,eax
  807759:	48 05 28 dd 80 00    	add    rax,0x80dd28
  80775f:	48 89 05 d2 0b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20bd2],rax        # 428338 <glyph_table>
    glyph_nr = boot_font->glyph_nr;
  807766:	48 8b 05 b3 0b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20bb3]        # 428320 <boot_font>
  80776d:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  807770:	89 05 ce 0b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20bce],eax        # 428344 <glyph_nr>
    bytes_per_glyph = boot_font->bytes_per_glyph;
  807776:	48 8b 05 a3 0b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20ba3]        # 428320 <boot_font>
  80777d:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  807780:	89 05 ba 0b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20bba],eax        # 428340 <bytes_per_glyph>

    fb_cursor_x = fb_cursor_y = 0;
  807786:	c7 05 80 0b c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20b80],0x0        # 428310 <fb_cursor_y>
  80778d:	00 00 00 
  807790:	8b 05 7a 0b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20b7a]        # 428310 <fb_cursor_y>
  807796:	89 05 70 0b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20b70],eax        # 42830c <fb_cursor_x>
    max_ch_nr_x = framebuffer.common.framebuffer_width / font_width;
  80779c:	8b 05 52 0b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20b52]        # 4282f4 <framebuffer+0x14>
  8077a2:	8b 0d 80 0b c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc20b80]        # 428328 <font_width>
  8077a8:	ba 00 00 00 00       	mov    edx,0x0
  8077ad:	f7 f1                	div    ecx
  8077af:	89 05 5f 0b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20b5f],eax        # 428314 <max_ch_nr_x>
    max_ch_nr_y = framebuffer.common.framebuffer_height / font_height;
  8077b5:	8b 05 3d 0b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20b3d]        # 4282f8 <framebuffer+0x18>
  8077bb:	8b 35 6b 0b c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc20b6b]        # 42832c <font_height>
  8077c1:	ba 00 00 00 00       	mov    edx,0x0
  8077c6:	f7 f6                	div    esi
  8077c8:	89 05 4a 0b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20b4a],eax        # 428318 <max_ch_nr_y>
    font_size=1;
  8077ce:	c7 05 e8 61 00 00 01 	mov    DWORD PTR [rip+0x61e8],0x1        # 80d9c0 <font_size>
  8077d5:	00 00 00 
}
  8077d8:	90                   	nop
  8077d9:	5d                   	pop    rbp
  8077da:	c3                   	ret    

00000000008077db <set_framebuffer>:
void set_framebuffer(struct multiboot_tag_framebuffer tag)
{
  8077db:	f3 0f 1e fa          	endbr64 
  8077df:	55                   	push   rbp
  8077e0:	48 89 e5             	mov    rbp,rsp
    framebuffer=tag;
  8077e3:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  8077e7:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  8077eb:	48 89 05 ee 0a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20aee],rax        # 4282e0 <framebuffer>
  8077f2:	48 89 15 ef 0a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20aef],rdx        # 4282e8 <framebuffer+0x8>
  8077f9:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
  8077fd:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  807801:	48 89 05 e8 0a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20ae8],rax        # 4282f0 <framebuffer+0x10>
  807808:	48 89 15 e9 0a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20ae9],rdx        # 4282f8 <framebuffer+0x18>
  80780f:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
  807813:	48 89 05 e6 0a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20ae6],rax        # 428300 <framebuffer+0x20>
}
  80781a:	90                   	nop
  80781b:	5d                   	pop    rbp
  80781c:	c3                   	ret    

000000000080781d <fill_rect>:

void fill_rect(int x,int y,int w,int h,unsigned int color){
  80781d:	f3 0f 1e fa          	endbr64 
  807821:	55                   	push   rbp
  807822:	48 89 e5             	mov    rbp,rsp
  807825:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  807828:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  80782b:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  80782e:	89 4d d0             	mov    DWORD PTR [rbp-0x30],ecx
  807831:	44 89 45 cc          	mov    DWORD PTR [rbp-0x34],r8d
    unsigned int* fb= (unsigned int*) FRAMEBUFFER_ADDR;
  807835:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x40000000
  80783c:	40 
    //目前只写32bpp
    for(int py=x;py<h+x;py++){
  80783d:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  807840:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  807843:	eb 64                	jmp    8078a9 <fill_rect+0x8c>
        for(int px=y;px<w+y;px++){
  807845:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  807848:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  80784b:	eb 4b                	jmp    807898 <fill_rect+0x7b>
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  80784d:	8b 15 9d 0a c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20a9d]        # 4282f0 <framebuffer+0x10>
  807853:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807856:	0f af c2             	imul   eax,edx
  807859:	89 c1                	mov    ecx,eax
                       +px*framebuffer.common.framebuffer_bpp/8;
  80785b:	0f b6 05 9a 0a c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20a9a]        # 4282fc <framebuffer+0x1c>
  807862:	0f b6 c0             	movzx  eax,al
  807865:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  807869:	8d 50 07             	lea    edx,[rax+0x7]
  80786c:	85 c0                	test   eax,eax
  80786e:	0f 48 c2             	cmovs  eax,edx
  807871:	c1 f8 03             	sar    eax,0x3
  807874:	48 98                	cdqe   
  807876:	48 01 c8             	add    rax,rcx
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  807879:	48 05 00 00 00 40    	add    rax,0x40000000
  80787f:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
            fb=(unsigned int*)ptr;
  807883:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807887:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *fb=color;
  80788b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80788f:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  807892:	89 10                	mov    DWORD PTR [rax],edx
        for(int px=y;px<w+y;px++){
  807894:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807898:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  80789b:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  80789e:	01 d0                	add    eax,edx
  8078a0:	39 45 f8             	cmp    DWORD PTR [rbp-0x8],eax
  8078a3:	7c a8                	jl     80784d <fill_rect+0x30>
    for(int py=x;py<h+x;py++){
  8078a5:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8078a9:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
  8078ac:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8078af:	01 d0                	add    eax,edx
  8078b1:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  8078b4:	7c 8f                	jl     807845 <fill_rect+0x28>
        }
    }
}
  8078b6:	90                   	nop
  8078b7:	90                   	nop
  8078b8:	5d                   	pop    rbp
  8078b9:	c3                   	ret    

00000000008078ba <draw_text>:
unsigned char letters[];
void draw_text(int x, int y, int size, char *str)
{
  8078ba:	f3 0f 1e fa          	endbr64 
  8078be:	55                   	push   rbp
  8078bf:	48 89 e5             	mov    rbp,rsp
  8078c2:	48 83 ec 30          	sub    rsp,0x30
  8078c6:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8078c9:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8078cc:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  8078cf:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    int tx=x;
  8078d3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8078d6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    while(*str!='\0')
  8078d9:	eb 5a                	jmp    807935 <draw_text+0x7b>
    {
        if(*str=='\n')
  8078db:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8078df:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8078e2:	3c 0a                	cmp    al,0xa
  8078e4:	75 1c                	jne    807902 <draw_text+0x48>
        {
            y+=font_height*size;
  8078e6:	8b 15 40 0a c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20a40]        # 42832c <font_height>
  8078ec:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8078ef:	0f af d0             	imul   edx,eax
  8078f2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8078f5:	01 d0                	add    eax,edx
  8078f7:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            tx=x;
  8078fa:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8078fd:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  807900:	eb 2e                	jmp    807930 <draw_text+0x76>
        }
        else
        {
            draw_letter(tx,y,size,*str);
  807902:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807906:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807909:	0f be c8             	movsx  ecx,al
  80790c:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  80790f:	8b 75 e8             	mov    esi,DWORD PTR [rbp-0x18]
  807912:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807915:	89 c7                	mov    edi,eax
  807917:	e8 28 00 00 00       	call   807944 <draw_letter>
            tx+=size*font_width;
  80791c:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  80791f:	8b 05 03 0a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20a03]        # 428328 <font_width>
  807925:	0f af d0             	imul   edx,eax
  807928:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80792b:	01 d0                	add    eax,edx
  80792d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        }
        str++;
  807930:	48 83 45 d8 01       	add    QWORD PTR [rbp-0x28],0x1
    while(*str!='\0')
  807935:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807939:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80793c:	84 c0                	test   al,al
  80793e:	75 9b                	jne    8078db <draw_text+0x21>
    }
}
  807940:	90                   	nop
  807941:	90                   	nop
  807942:	c9                   	leave  
  807943:	c3                   	ret    

0000000000807944 <draw_letter>:
void draw_letter(int x, volatile int y, int size, char c) {
  807944:	f3 0f 1e fa          	endbr64 
  807948:	55                   	push   rbp
  807949:	48 89 e5             	mov    rbp,rsp
  80794c:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
  80794f:	89 75 c8             	mov    DWORD PTR [rbp-0x38],esi
  807952:	89 55 c4             	mov    DWORD PTR [rbp-0x3c],edx
  807955:	89 c8                	mov    eax,ecx
  807957:	88 45 c0             	mov    BYTE PTR [rbp-0x40],al
    u8 *glyph = glyph_table;
  80795a:	48 8b 05 d7 09 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc209d7]        # 428338 <glyph_table>
  807961:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if (c < glyph_nr) {
  807965:	0f be 55 c0          	movsx  edx,BYTE PTR [rbp-0x40]
  807969:	8b 05 d5 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc209d5]        # 428344 <glyph_nr>
  80796f:	39 c2                	cmp    edx,eax
  807971:	73 13                	jae    807986 <draw_letter+0x42>
        glyph += c * bytes_per_glyph;
  807973:	0f be 55 c0          	movsx  edx,BYTE PTR [rbp-0x40]
  807977:	8b 05 c3 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc209c3]        # 428340 <bytes_per_glyph>
  80797d:	0f af c2             	imul   eax,edx
  807980:	89 c0                	mov    eax,eax
  807982:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    }
    /* output the font to frame buffer */
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  807986:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80798d:	e9 cb 00 00 00       	jmp    807a5d <draw_letter+0x119>
        u8 mask = 1 << 7;
  807992:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80

        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  807996:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80799d:	e9 9c 00 00 00       	jmp    807a3e <draw_letter+0xfa>
            int px=x+ch_x*size;
  8079a2:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8079a5:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  8079a9:	89 c2                	mov    edx,eax
  8079ab:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8079ae:	01 d0                	add    eax,edx
  8079b0:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            int py=y+ch_y*size;
  8079b3:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8079b6:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  8079ba:	89 c2                	mov    edx,eax
  8079bc:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  8079bf:	01 d0                	add    eax,edx
  8079c1:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
            int* ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  8079c4:	8b 15 26 09 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20926]        # 4282f0 <framebuffer+0x10>
  8079ca:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8079cd:	0f af c2             	imul   eax,edx
  8079d0:	89 c1                	mov    ecx,eax
                     +px*framebuffer.common.framebuffer_bpp/8;
  8079d2:	0f b6 05 23 09 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20923]        # 4282fc <framebuffer+0x1c>
  8079d9:	0f b6 c0             	movzx  eax,al
  8079dc:	0f af 45 e8          	imul   eax,DWORD PTR [rbp-0x18]
  8079e0:	8d 50 07             	lea    edx,[rax+0x7]
  8079e3:	85 c0                	test   eax,eax
  8079e5:	0f 48 c2             	cmovs  eax,edx
  8079e8:	c1 f8 03             	sar    eax,0x3
  8079eb:	48 98                	cdqe   
  8079ed:	48 01 c8             	add    rax,rcx
  8079f0:	48 05 00 00 00 40    	add    rax,0x40000000
            int* ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  8079f6:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            if ((*(glyph + ch_x / 8) & mask) != 0) {
  8079fa:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8079fd:	c1 e8 03             	shr    eax,0x3
  807a00:	89 c2                	mov    edx,eax
  807a02:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807a06:	48 01 d0             	add    rax,rdx
  807a09:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807a0c:	22 45 f3             	and    al,BYTE PTR [rbp-0xd]
  807a0f:	84 c0                	test   al,al
  807a11:	74 0c                	je     807a1f <draw_letter+0xdb>
                *ptr=-1;
  807a13:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807a17:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
  807a1d:	eb 0a                	jmp    807a29 <draw_letter+0xe5>
            } else {
                *ptr=0;
  807a1f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807a23:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            }

            mask >>= 1;
  807a29:	d0 6d f3             	shr    BYTE PTR [rbp-0xd],1
            if (ch_x % 8 == 0) {
  807a2c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807a2f:	83 e0 07             	and    eax,0x7
  807a32:	85 c0                	test   eax,eax
  807a34:	75 04                	jne    807a3a <draw_letter+0xf6>
                mask = 1 << 7;
  807a36:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80
        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  807a3a:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  807a3e:	8b 05 e4 08 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc208e4]        # 428328 <font_width>
  807a44:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  807a47:	0f 82 55 ff ff ff    	jb     8079a2 <draw_letter+0x5e>
            }
        }

        glyph += font_width_bytes;
  807a4d:	8b 05 dd 08 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc208dd]        # 428330 <font_width_bytes>
  807a53:	89 c0                	mov    eax,eax
  807a55:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  807a59:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  807a5d:	8b 05 c9 08 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc208c9]        # 42832c <font_height>
  807a63:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  807a66:	0f 82 26 ff ff ff    	jb     807992 <draw_letter+0x4e>
    }
}
  807a6c:	90                   	nop
  807a6d:	90                   	nop
  807a6e:	5d                   	pop    rbp
  807a6f:	c3                   	ret    

0000000000807a70 <scr_up>:
//向上滚动一个像素
void scr_up(){
  807a70:	f3 0f 1e fa          	endbr64 
  807a74:	55                   	push   rbp
  807a75:	48 89 e5             	mov    rbp,rsp
    for(int dy=0;dy<framebuffer.common.framebuffer_height-1;dy++){
  807a78:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  807a7f:	eb 71                	jmp    807af2 <scr_up+0x82>
        for(int dx=0;dx<framebuffer.common.framebuffer_width;dx++){
  807a81:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807a88:	eb 57                	jmp    807ae1 <scr_up+0x71>
            char *p=(char*)(FRAMEBUFFER_ADDR+
                    dy*framebuffer.common.framebuffer_pitch
  807a8a:	8b 15 60 08 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20860]        # 4282f0 <framebuffer+0x10>
  807a90:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807a93:	0f af c2             	imul   eax,edx
  807a96:	89 c1                	mov    ecx,eax
                    +dx*framebuffer.common.framebuffer_bpp/8);
  807a98:	0f b6 05 5d 08 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2085d]        # 4282fc <framebuffer+0x1c>
  807a9f:	0f b6 c0             	movzx  eax,al
  807aa2:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  807aa6:	8d 50 07             	lea    edx,[rax+0x7]
  807aa9:	85 c0                	test   eax,eax
  807aab:	0f 48 c2             	cmovs  eax,edx
  807aae:	c1 f8 03             	sar    eax,0x3
  807ab1:	48 98                	cdqe   
  807ab3:	48 01 c8             	add    rax,rcx
  807ab6:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+
  807abc:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p+framebuffer.common.framebuffer_pitch);
  807ac0:	8b 05 2a 08 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2082a]        # 4282f0 <framebuffer+0x10>
  807ac6:	89 c2                	mov    edx,eax
  807ac8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807acc:	48 01 d0             	add    rax,rdx
  807acf:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  807ad2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807ad6:	88 10                	mov    BYTE PTR [rax],dl
            p++;
  807ad8:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        for(int dx=0;dx<framebuffer.common.framebuffer_width;dx++){
  807add:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807ae1:	8b 15 0d 08 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc2080d]        # 4282f4 <framebuffer+0x14>
  807ae7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807aea:	39 c2                	cmp    edx,eax
  807aec:	77 9c                	ja     807a8a <scr_up+0x1a>
    for(int dy=0;dy<framebuffer.common.framebuffer_height-1;dy++){
  807aee:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807af2:	8b 05 00 08 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20800]        # 4282f8 <framebuffer+0x18>
  807af8:	8d 50 ff             	lea    edx,[rax-0x1]
  807afb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807afe:	39 c2                	cmp    edx,eax
  807b00:	0f 87 7b ff ff ff    	ja     807a81 <scr_up+0x11>
        }

    }
//    for(int i=0;i< framebuffer.common.framebuffer_width*framebuffer.common.framebuffer_bpp/8;i++)
//        *(p++)=0;
}
  807b06:	90                   	nop
  807b07:	90                   	nop
  807b08:	5d                   	pop    rbp
  807b09:	c3                   	ret    

0000000000807b0a <scr_down>:
void scr_down(){
  807b0a:	f3 0f 1e fa          	endbr64 
  807b0e:	55                   	push   rbp
  807b0f:	48 89 e5             	mov    rbp,rsp
    for(int dy=1;dy<max_ch_nr_y;dy++){
  807b12:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
  807b19:	eb 72                	jmp    807b8d <scr_down+0x83>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  807b1b:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807b22:	eb 58                	jmp    807b7c <scr_down+0x72>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  807b24:	8b 15 c6 07 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc207c6]        # 4282f0 <framebuffer+0x10>
  807b2a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807b2d:	0f af c2             	imul   eax,edx
  807b30:	89 c1                	mov    ecx,eax
                            +dx*framebuffer.common.framebuffer_bpp/8);
  807b32:	0f b6 05 c3 07 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc207c3]        # 4282fc <framebuffer+0x1c>
  807b39:	0f b6 c0             	movzx  eax,al
  807b3c:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  807b40:	8d 50 07             	lea    edx,[rax+0x7]
  807b43:	85 c0                	test   eax,eax
  807b45:	0f 48 c2             	cmovs  eax,edx
  807b48:	c1 f8 03             	sar    eax,0x3
  807b4b:	48 98                	cdqe   
  807b4d:	48 01 c8             	add    rax,rcx
  807b50:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  807b56:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p-framebuffer.common.framebuffer_pitch);
  807b5a:	8b 05 90 07 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20790]        # 4282f0 <framebuffer+0x10>
  807b60:	89 c0                	mov    eax,eax
  807b62:	48 f7 d8             	neg    rax
  807b65:	48 89 c2             	mov    rdx,rax
  807b68:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807b6c:	48 01 d0             	add    rax,rdx
  807b6f:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  807b72:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807b76:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  807b78:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807b7c:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  807b7f:	8b 05 8f 07 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2078f]        # 428314 <max_ch_nr_x>
  807b85:	39 c2                	cmp    edx,eax
  807b87:	72 9b                	jb     807b24 <scr_down+0x1a>
    for(int dy=1;dy<max_ch_nr_y;dy++){
  807b89:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807b8d:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  807b90:	8b 05 82 07 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20782]        # 428318 <max_ch_nr_y>
  807b96:	39 c2                	cmp    edx,eax
  807b98:	72 81                	jb     807b1b <scr_down+0x11>
        }

    }
}
  807b9a:	90                   	nop
  807b9b:	90                   	nop
  807b9c:	5d                   	pop    rbp
  807b9d:	c3                   	ret    

0000000000807b9e <print>:
void print(char* s){
  807b9e:	f3 0f 1e fa          	endbr64 
  807ba2:	55                   	push   rbp
  807ba3:	48 89 e5             	mov    rbp,rsp
  807ba6:	48 83 ec 08          	sub    rsp,0x8
  807baa:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    for(;*s;s++){
  807bae:	e9 c4 00 00 00       	jmp    807c77 <print+0xd9>
        if(fb_cursor_x>max_ch_nr_x||*s=='\n')
  807bb3:	8b 15 53 07 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20753]        # 42830c <fb_cursor_x>
  807bb9:	8b 05 55 07 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20755]        # 428314 <max_ch_nr_x>
  807bbf:	39 c2                	cmp    edx,eax
  807bc1:	77 0b                	ja     807bce <print+0x30>
  807bc3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807bc7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807bca:	3c 0a                	cmp    al,0xa
  807bcc:	75 19                	jne    807be7 <print+0x49>
        {
            fb_cursor_y+=1;
  807bce:	8b 05 3c 07 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2073c]        # 428310 <fb_cursor_y>
  807bd4:	83 c0 01             	add    eax,0x1
  807bd7:	89 05 33 07 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20733],eax        # 428310 <fb_cursor_y>
            fb_cursor_x=0;
  807bdd:	c7 05 25 07 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20725],0x0        # 42830c <fb_cursor_x>
  807be4:	00 00 00 
        }
        if(*s=='\n')continue;
  807be7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807beb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807bee:	3c 0a                	cmp    al,0xa
  807bf0:	74 7f                	je     807c71 <print+0xd3>
        if(fb_cursor_y>=max_ch_nr_y-1){
  807bf2:	8b 05 20 07 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20720]        # 428318 <max_ch_nr_y>
  807bf8:	8d 50 ff             	lea    edx,[rax-0x1]
  807bfb:	8b 05 0f 07 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2070f]        # 428310 <fb_cursor_y>
  807c01:	39 c2                	cmp    edx,eax
  807c03:	77 0a                	ja     807c0f <print+0x71>
//            for(int i=0;i<font_height*font_size;i++)
////                scr_up();
////            fb_cursor_y=max_ch_nr_y-1;
            fb_cursor_y=0;
  807c05:	c7 05 01 07 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20701],0x0        # 428310 <fb_cursor_y>
  807c0c:	00 00 00 
        }
        draw_letter(fb_cursor_x*font_width*font_size,fb_cursor_y*font_height*font_size,font_size,*s);
  807c0f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807c13:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807c16:	0f be d0             	movsx  edx,al
  807c19:	8b 05 a1 5d 00 00    	mov    eax,DWORD PTR [rip+0x5da1]        # 80d9c0 <font_size>
  807c1f:	8b 35 eb 06 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc206eb]        # 428310 <fb_cursor_y>
  807c25:	8b 0d 01 07 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc20701]        # 42832c <font_height>
  807c2b:	0f af ce             	imul   ecx,esi
  807c2e:	8b 35 8c 5d 00 00    	mov    esi,DWORD PTR [rip+0x5d8c]        # 80d9c0 <font_size>
  807c34:	0f af ce             	imul   ecx,esi
  807c37:	41 89 c8             	mov    r8d,ecx
  807c3a:	8b 35 cc 06 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc206cc]        # 42830c <fb_cursor_x>
  807c40:	8b 0d e2 06 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc206e2]        # 428328 <font_width>
  807c46:	0f af ce             	imul   ecx,esi
  807c49:	8b 35 71 5d 00 00    	mov    esi,DWORD PTR [rip+0x5d71]        # 80d9c0 <font_size>
  807c4f:	0f af ce             	imul   ecx,esi
  807c52:	89 cf                	mov    edi,ecx
  807c54:	89 d1                	mov    ecx,edx
  807c56:	89 c2                	mov    edx,eax
  807c58:	44 89 c6             	mov    esi,r8d
  807c5b:	e8 e4 fc ff ff       	call   807944 <draw_letter>
        fb_cursor_x+=1;
  807c60:	8b 05 a6 06 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc206a6]        # 42830c <fb_cursor_x>
  807c66:	83 c0 01             	add    eax,0x1
  807c69:	89 05 9d 06 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2069d],eax        # 42830c <fb_cursor_x>
  807c6f:	eb 01                	jmp    807c72 <print+0xd4>
        if(*s=='\n')continue;
  807c71:	90                   	nop
    for(;*s;s++){
  807c72:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  807c77:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807c7b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807c7e:	84 c0                	test   al,al
  807c80:	0f 85 2d ff ff ff    	jne    807bb3 <print+0x15>
    }
}
  807c86:	90                   	nop
  807c87:	90                   	nop
  807c88:	c9                   	leave  
  807c89:	c3                   	ret    

0000000000807c8a <open_framebuffer>:
struct file_operations framebuffer_fops={
        .open=open_framebuffer,.close=close_framebuffer,.read=read_framebuffer,.write=write_framebuffer,
        .ioctl=ioctl_framebuffer
};
long open_framebuffer(struct index_node * inode,struct file * filp){
  807c8a:	f3 0f 1e fa          	endbr64 
  807c8e:	55                   	push   rbp
  807c8f:	48 89 e5             	mov    rbp,rsp
  807c92:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  807c96:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    inode->f_ops=&framebuffer_fops;
  807c9a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807c9e:	48 c7 40 20 e0 d9 80 	mov    QWORD PTR [rax+0x20],0x80d9e0
  807ca5:	00 
    filp->f_ops=&framebuffer_fops;
  807ca6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807caa:	48 c7 40 18 e0 d9 80 	mov    QWORD PTR [rax+0x18],0x80d9e0
  807cb1:	00 
    return 1;
  807cb2:	b8 01 00 00 00       	mov    eax,0x1
}
  807cb7:	5d                   	pop    rbp
  807cb8:	c3                   	ret    

0000000000807cb9 <close_framebuffer>:
long close_framebuffer(struct index_node * inode,struct file * filp){
  807cb9:	f3 0f 1e fa          	endbr64 
  807cbd:	55                   	push   rbp
  807cbe:	48 89 e5             	mov    rbp,rsp
  807cc1:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  807cc5:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi

}
  807cc9:	90                   	nop
  807cca:	5d                   	pop    rbp
  807ccb:	c3                   	ret    

0000000000807ccc <read_framebuffer>:
long read_framebuffer(struct file * filp,char * buf,unsigned long count,long * position){
  807ccc:	f3 0f 1e fa          	endbr64 
  807cd0:	55                   	push   rbp
  807cd1:	48 89 e5             	mov    rbp,rsp
  807cd4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  807cd8:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  807cdc:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  807ce0:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx

}
  807ce4:	90                   	nop
  807ce5:	5d                   	pop    rbp
  807ce6:	c3                   	ret    

0000000000807ce7 <write_framebuffer>:
long write_framebuffer(struct file * filp,char * buf,unsigned long count,long * position){
  807ce7:	f3 0f 1e fa          	endbr64 
  807ceb:	55                   	push   rbp
  807cec:	48 89 e5             	mov    rbp,rsp
  807cef:	48 83 ec 40          	sub    rsp,0x40
  807cf3:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  807cf7:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  807cfb:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  807cff:	48 89 4d c0          	mov    QWORD PTR [rbp-0x40],rcx
    char *tmp= (char*)vmalloc();
  807d03:	b8 00 00 00 00       	mov    eax,0x0
  807d08:	e8 35 95 ff ff       	call   801242 <vmalloc>
  807d0d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int c=count/(PAGE_4K_SIZE-1),p=0;
  807d11:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  807d15:	48 ba 11 00 01 10 00 	movabs rdx,0x10010010010011
  807d1c:	01 10 00 
  807d1f:	48 89 c8             	mov    rax,rcx
  807d22:	48 f7 e2             	mul    rdx
  807d25:	48 89 c8             	mov    rax,rcx
  807d28:	48 29 d0             	sub    rax,rdx
  807d2b:	48 d1 e8             	shr    rax,1
  807d2e:	48 01 d0             	add    rax,rdx
  807d31:	48 c1 e8 0b          	shr    rax,0xb
  807d35:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  807d38:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    //一块一块输出
    for(int i=0;i<(c?c:1);i++){
  807d3f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807d46:	eb 46                	jmp    807d8e <write_framebuffer+0xa7>
        memcpy(tmp,buf+p,PAGE_4K_SIZE-1);
  807d48:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807d4b:	48 63 d0             	movsxd rdx,eax
  807d4e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807d52:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  807d56:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807d5a:	ba ff 0f 00 00       	mov    edx,0xfff
  807d5f:	48 89 ce             	mov    rsi,rcx
  807d62:	48 89 c7             	mov    rdi,rax
  807d65:	e8 a0 51 00 00       	call   80cf0a <memcpy>
        tmp[PAGE_4K_SIZE-1]=0;
  807d6a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807d6e:	48 05 ff 0f 00 00    	add    rax,0xfff
  807d74:	c6 00 00             	mov    BYTE PTR [rax],0x0
        print(tmp);
  807d77:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807d7b:	48 89 c7             	mov    rdi,rax
  807d7e:	e8 1b fe ff ff       	call   807b9e <print>
        p+=PAGE_4K_SIZE-1;
  807d83:	81 45 fc ff 0f 00 00 	add    DWORD PTR [rbp-0x4],0xfff
    for(int i=0;i<(c?c:1);i++){
  807d8a:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807d8e:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  807d92:	74 05                	je     807d99 <write_framebuffer+0xb2>
  807d94:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807d97:	eb 05                	jmp    807d9e <write_framebuffer+0xb7>
  807d99:	b8 01 00 00 00       	mov    eax,0x1
  807d9e:	3b 45 f8             	cmp    eax,DWORD PTR [rbp-0x8]
  807da1:	7f a5                	jg     807d48 <write_framebuffer+0x61>
    }
    vmfree(tmp);
  807da3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807da7:	48 89 c7             	mov    rdi,rax
  807daa:	e8 22 95 ff ff       	call   8012d1 <vmfree>
    return 0;
  807daf:	b8 00 00 00 00       	mov    eax,0x0
}
  807db4:	c9                   	leave  
  807db5:	c3                   	ret    

0000000000807db6 <ioctl_framebuffer>:
long ioctl_framebuffer(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg){
  807db6:	f3 0f 1e fa          	endbr64 
  807dba:	55                   	push   rbp
  807dbb:	48 89 e5             	mov    rbp,rsp
  807dbe:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  807dc2:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  807dc6:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  807dca:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx

}
  807dce:	90                   	nop
  807dcf:	5d                   	pop    rbp
  807dd0:	c3                   	ret    

0000000000807dd1 <path_walk>:
#include "log.h"
#include "mem.h"
#include "str.h"

struct dir_entry * path_walk(char * name,unsigned long flags)
{
  807dd1:	f3 0f 1e fa          	endbr64 
  807dd5:	55                   	push   rbp
  807dd6:	48 89 e5             	mov    rbp,rsp
  807dd9:	48 83 ec 70          	sub    rsp,0x70
  807ddd:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  807de1:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
    char * tmpname = NULL;
  807de5:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  807dec:	00 
    int tmpnamelen = 0;
  807ded:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    struct dir_entry * parent = root_sb->root;
  807df4:	48 8b 05 4d 05 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2054d]        # 428348 <root_sb>
  807dfb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807dfe:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    struct dir_entry * path = NULL;
  807e02:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  807e09:	00 

    while(*name == '/')
  807e0a:	eb 05                	jmp    807e11 <path_walk+0x40>
        name++;
  807e0c:	48 83 45 98 01       	add    QWORD PTR [rbp-0x68],0x1
    while(*name == '/')
  807e11:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807e15:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807e18:	3c 2f                	cmp    al,0x2f
  807e1a:	74 f0                	je     807e0c <path_walk+0x3b>

    if(!*name)
  807e1c:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807e20:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807e23:	84 c0                	test   al,al
  807e25:	75 09                	jne    807e30 <path_walk+0x5f>
    {
        return parent;
  807e27:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807e2b:	e9 92 02 00 00       	jmp    8080c2 <path_walk+0x2f1>
    }

    for(;;)
    {
        tmpname = name;
  807e30:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807e34:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        while(*name && (*name != '/'))
  807e38:	eb 05                	jmp    807e3f <path_walk+0x6e>
            name++;
  807e3a:	48 83 45 98 01       	add    QWORD PTR [rbp-0x68],0x1
        while(*name && (*name != '/'))
  807e3f:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807e43:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807e46:	84 c0                	test   al,al
  807e48:	74 0b                	je     807e55 <path_walk+0x84>
  807e4a:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807e4e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807e51:	3c 2f                	cmp    al,0x2f
  807e53:	75 e5                	jne    807e3a <path_walk+0x69>
        tmpnamelen = name - tmpname;
  807e55:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807e59:	48 2b 45 f0          	sub    rax,QWORD PTR [rbp-0x10]
  807e5d:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

        path = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  807e60:	be 00 00 00 00       	mov    esi,0x0
  807e65:	bf 58 00 00 00       	mov    edi,0x58
  807e6a:	b8 00 00 00 00       	mov    eax,0x0
  807e6f:	e8 ce 93 ff ff       	call   801242 <vmalloc>
  807e74:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        memset(path,0,sizeof(struct dir_entry));
  807e78:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807e7c:	ba 58 00 00 00       	mov    edx,0x58
  807e81:	be 00 00 00 00       	mov    esi,0x0
  807e86:	48 89 c7             	mov    rdi,rax
  807e89:	e8 2b 51 00 00       	call   80cfb9 <memset>

        path->name = vmalloc();
  807e8e:	b8 00 00 00 00       	mov    eax,0x0
  807e93:	e8 aa 93 ff ff       	call   801242 <vmalloc>
  807e98:	48 89 c2             	mov    rdx,rax
  807e9b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807e9f:	48 89 10             	mov    QWORD PTR [rax],rdx
        memset(path->name,0,tmpnamelen+1);
  807ea2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807ea5:	83 c0 01             	add    eax,0x1
  807ea8:	89 c2                	mov    edx,eax
  807eaa:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807eae:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807eb1:	be 00 00 00 00       	mov    esi,0x0
  807eb6:	48 89 c7             	mov    rdi,rax
  807eb9:	e8 fb 50 00 00       	call   80cfb9 <memset>
        memcpy(path->name,tmpname,tmpnamelen);
  807ebe:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807ec1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807ec5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807ec8:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  807ecc:	48 89 ce             	mov    rsi,rcx
  807ecf:	48 89 c7             	mov    rdi,rax
  807ed2:	e8 33 50 00 00       	call   80cf0a <memcpy>
        path->name_length = tmpnamelen;
  807ed7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807edb:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807ede:	89 50 08             	mov    DWORD PTR [rax+0x8],edx

        path=parent->dir_inode->inode_ops->lookup(parent->dir_inode,path);
  807ee1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807ee5:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  807ee9:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  807eed:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  807ef1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807ef5:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  807ef9:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  807efd:	48 89 d6             	mov    rsi,rdx
  807f00:	48 89 c7             	mov    rdi,rax
  807f03:	ff d1                	call   rcx
  807f05:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        if(path == NULL)
  807f09:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  807f0e:	75 3e                	jne    807f4e <path_walk+0x17d>
        {
            printf("can not find file or dir:%s\n",path->name);
  807f10:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807f14:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807f17:	48 89 c6             	mov    rsi,rax
  807f1a:	bf a7 56 81 00       	mov    edi,0x8156a7
  807f1f:	b8 00 00 00 00       	mov    eax,0x0
  807f24:	e8 43 8e ff ff       	call   800d6c <printf>
            vmfree(path->name);
  807f29:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807f2d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807f30:	48 89 c7             	mov    rdi,rax
  807f33:	e8 99 93 ff ff       	call   8012d1 <vmfree>
            vmfree(path);
  807f38:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807f3c:	48 89 c7             	mov    rdi,rax
  807f3f:	e8 8d 93 ff ff       	call   8012d1 <vmfree>
            return NULL;
  807f44:	b8 00 00 00 00       	mov    eax,0x0
  807f49:	e9 74 01 00 00       	jmp    8080c2 <path_walk+0x2f1>
        }

//        list_init(&path->child_node);
//        list_init(&path->subdirs_list);
        path->parent = parent;
  807f4e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807f52:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  807f56:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
        //list_add会查重，如果链表里面已经有了data指针值相同的项，就不添加。
        //对于/dev这样的文件夹，lookup返回的就是链表里的dentry，data会一样
        list_add(&parent->subdirs_list,&path->child_node);
  807f5a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807f5e:	48 83 c0 10          	add    rax,0x10
  807f62:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  807f66:	48 83 c2 28          	add    rdx,0x28
  807f6a:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  807f6e:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    if(entry->next==NULL)
  807f72:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807f76:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807f7a:	48 85 c0             	test   rax,rax
  807f7d:	75 58                	jne    807fd7 <path_walk+0x206>
  807f7f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807f83:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  807f87:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807f8b:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    new->next = entry->next;
  807f8f:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807f93:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  807f97:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807f9b:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  807f9f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807fa3:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  807fa7:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  807faa:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807fae:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807fb2:	48 85 c0             	test   rax,rax
  807fb5:	74 0f                	je     807fc6 <path_walk+0x1f5>
        new->next->prev = new;
  807fb7:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807fbb:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807fbf:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  807fc3:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  807fc6:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807fca:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  807fce:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  807fd2:	e9 9c 00 00 00       	jmp    808073 <path_walk+0x2a2>
        struct List* p=entry;
  807fd7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807fdb:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        for(;p->next&&p->next!=p;p=p->next){
  807fdf:	eb 21                	jmp    808002 <path_walk+0x231>
            if(p->data==new->data)
  807fe1:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807fe5:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  807fe9:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807fed:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  807ff1:	48 39 c2             	cmp    rdx,rax
  807ff4:	74 7c                	je     808072 <path_walk+0x2a1>
        for(;p->next&&p->next!=p;p=p->next){
  807ff6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807ffa:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807ffe:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  808002:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808006:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80800a:	48 85 c0             	test   rax,rax
  80800d:	74 0e                	je     80801d <path_walk+0x24c>
  80800f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808013:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808017:	48 39 45 b8          	cmp    QWORD PTR [rbp-0x48],rax
  80801b:	75 c4                	jne    807fe1 <path_walk+0x210>
  80801d:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808021:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  808025:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808029:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
    new->next = entry->next;
  80802d:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808031:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  808035:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808039:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  80803d:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808041:	48 8b 55 b0          	mov    rdx,QWORD PTR [rbp-0x50]
  808045:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  808048:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80804c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808050:	48 85 c0             	test   rax,rax
  808053:	74 0f                	je     808064 <path_walk+0x293>
        new->next->prev = new;
  808055:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808059:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80805d:	48 8b 55 a8          	mov    rdx,QWORD PTR [rbp-0x58]
  808061:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  808064:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808068:	48 8b 55 a8          	mov    rdx,QWORD PTR [rbp-0x58]
  80806c:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  808070:	eb 01                	jmp    808073 <path_walk+0x2a2>
                return;
  808072:	90                   	nop

        if(!*name)
  808073:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808077:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80807a:	84 c0                	test   al,al
  80807c:	74 2a                	je     8080a8 <path_walk+0x2d7>
            goto last_component;
        while(*name == '/')
  80807e:	eb 05                	jmp    808085 <path_walk+0x2b4>
            name++;
  808080:	48 83 45 98 01       	add    QWORD PTR [rbp-0x68],0x1
        while(*name == '/')
  808085:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808089:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80808c:	3c 2f                	cmp    al,0x2f
  80808e:	74 f0                	je     808080 <path_walk+0x2af>
        if(!*name)
  808090:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808094:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808097:	84 c0                	test   al,al
  808099:	74 10                	je     8080ab <path_walk+0x2da>
            goto last_slash;

        parent = path;
  80809b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80809f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        tmpname = name;
  8080a3:	e9 88 fd ff ff       	jmp    807e30 <path_walk+0x5f>
            goto last_component;
  8080a8:	90                   	nop
  8080a9:	eb 01                	jmp    8080ac <path_walk+0x2db>
            goto last_slash;
  8080ab:	90                   	nop
    }

    last_slash:
    last_component:

    if(flags & 1)
  8080ac:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8080b0:	83 e0 01             	and    eax,0x1
  8080b3:	48 85 c0             	test   rax,rax
  8080b6:	74 06                	je     8080be <path_walk+0x2ed>
    {
        return parent;
  8080b8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8080bc:	eb 04                	jmp    8080c2 <path_walk+0x2f1>
    }

    return path;
  8080be:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  8080c2:	c9                   	leave  
  8080c3:	c3                   	ret    

00000000008080c4 <fill_dentry>:


int fill_dentry(void *buf,char *name, long namelen,long type,long offset)
{
  8080c4:	f3 0f 1e fa          	endbr64 
  8080c8:	55                   	push   rbp
  8080c9:	48 89 e5             	mov    rbp,rsp
  8080cc:	48 83 ec 40          	sub    rsp,0x40
  8080d0:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8080d4:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8080d8:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  8080dc:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  8080e0:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
    struct dirent* dent = (struct dirent*)buf;
  8080e4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8080e8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    if((unsigned long)buf < PAGE_4K_SIZE)
  8080ec:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8080f0:	48 3d ff 0f 00 00    	cmp    rax,0xfff
  8080f6:	77 07                	ja     8080ff <fill_dentry+0x3b>
        return -EFAULT;
  8080f8:	b8 eb ff ff ff       	mov    eax,0xffffffeb
  8080fd:	eb 47                	jmp    808146 <fill_dentry+0x82>

    memcpy(name,dent->d_name,namelen);
  8080ff:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808103:	89 c2                	mov    edx,eax
  808105:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808109:	48 8d 48 18          	lea    rcx,[rax+0x18]
  80810d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808111:	48 89 ce             	mov    rsi,rcx
  808114:	48 89 c7             	mov    rdi,rax
  808117:	e8 ee 4d 00 00       	call   80cf0a <memcpy>
    dent->d_namelen = namelen;
  80811c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808120:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  808124:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    dent->d_type = type;
  808128:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80812c:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  808130:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    dent->d_offset = offset;
  808134:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808138:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80813c:	48 89 10             	mov    QWORD PTR [rax],rdx
    return sizeof(struct dirent) + namelen;
  80813f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808143:	83 c0 18             	add    eax,0x18
}
  808146:	c9                   	leave  
  808147:	c3                   	ret    

0000000000808148 <mount_fs>:
//function mount_root
struct super_block * root_sb = NULL;
struct file_system_type filesystem = {"filesystem",0};

struct super_block* mount_fs(char * name,struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  808148:	f3 0f 1e fa          	endbr64 
  80814c:	55                   	push   rbp
  80814d:	48 89 e5             	mov    rbp,rsp
  808150:	48 83 ec 30          	sub    rsp,0x30
  808154:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  808158:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80815c:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file_system_type * p = NULL;
  808160:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  808167:	00 

    for(p = &filesystem;p;p = p->next)
  808168:	48 c7 45 f8 20 da 80 	mov    QWORD PTR [rbp-0x8],0x80da20
  80816f:	00 
  808170:	eb 40                	jmp    8081b2 <mount_fs+0x6a>
        if(!strcmp(p->name,name))
  808172:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808176:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808179:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80817d:	48 89 d6             	mov    rsi,rdx
  808180:	48 89 c7             	mov    rdi,rax
  808183:	e8 20 50 00 00       	call   80d1a8 <strcmp>
  808188:	85 c0                	test   eax,eax
  80818a:	75 1a                	jne    8081a6 <mount_fs+0x5e>
        {
            return p->read_superblock(DPTE,buf);
  80818c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808190:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  808194:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  808198:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80819c:	48 89 d6             	mov    rsi,rdx
  80819f:	48 89 c7             	mov    rdi,rax
  8081a2:	ff d1                	call   rcx
  8081a4:	eb 18                	jmp    8081be <mount_fs+0x76>
    for(p = &filesystem;p;p = p->next)
  8081a6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8081aa:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8081ae:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  8081b2:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8081b7:	75 b9                	jne    808172 <mount_fs+0x2a>
        }
    return 0;
  8081b9:	b8 00 00 00 00       	mov    eax,0x0
}
  8081be:	c9                   	leave  
  8081bf:	c3                   	ret    

00000000008081c0 <register_filesystem>:

unsigned long register_filesystem(struct file_system_type * fs)
{
  8081c0:	f3 0f 1e fa          	endbr64 
  8081c4:	55                   	push   rbp
  8081c5:	48 89 e5             	mov    rbp,rsp
  8081c8:	48 83 ec 20          	sub    rsp,0x20
  8081cc:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = NULL;
  8081d0:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8081d7:	00 

    for(p = &filesystem;p;p = p->next)
  8081d8:	48 c7 45 f8 20 da 80 	mov    QWORD PTR [rbp-0x8],0x80da20
  8081df:	00 
  8081e0:	eb 30                	jmp    808212 <register_filesystem+0x52>
        if(!strcmp(fs->name,p->name))
  8081e2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8081e6:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8081e9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8081ed:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8081f0:	48 89 d6             	mov    rsi,rdx
  8081f3:	48 89 c7             	mov    rdi,rax
  8081f6:	e8 ad 4f 00 00       	call   80d1a8 <strcmp>
  8081fb:	85 c0                	test   eax,eax
  8081fd:	75 07                	jne    808206 <register_filesystem+0x46>
            return 0;
  8081ff:	b8 00 00 00 00       	mov    eax,0x0
  808204:	eb 32                	jmp    808238 <register_filesystem+0x78>
    for(p = &filesystem;p;p = p->next)
  808206:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80820a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80820e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  808212:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  808217:	75 c9                	jne    8081e2 <register_filesystem+0x22>

    fs->next = filesystem.next;
  808219:	48 8b 15 18 58 00 00 	mov    rdx,QWORD PTR [rip+0x5818]        # 80da38 <filesystem+0x18>
  808220:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808224:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    filesystem.next = fs;
  808228:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80822c:	48 89 05 05 58 00 00 	mov    QWORD PTR [rip+0x5805],rax        # 80da38 <filesystem+0x18>

    return 1;
  808233:	b8 01 00 00 00       	mov    eax,0x1
}
  808238:	c9                   	leave  
  808239:	c3                   	ret    

000000000080823a <unregister_filesystem>:

unsigned long unregister_filesystem(struct file_system_type * fs)
{
  80823a:	f3 0f 1e fa          	endbr64 
  80823e:	55                   	push   rbp
  80823f:	48 89 e5             	mov    rbp,rsp
  808242:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = &filesystem;
  808246:	48 c7 45 f8 20 da 80 	mov    QWORD PTR [rbp-0x8],0x80da20
  80824d:	00 

    while(p->next)
  80824e:	eb 41                	jmp    808291 <unregister_filesystem+0x57>
        if(p->next == fs)
  808250:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808254:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808258:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  80825c:	75 27                	jne    808285 <unregister_filesystem+0x4b>
        {
            p->next = p->next->next;
  80825e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808262:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808266:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  80826a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80826e:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
            fs->next = NULL;
  808272:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808276:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  80827d:	00 
            return 1;
  80827e:	b8 01 00 00 00       	mov    eax,0x1
  808283:	eb 1e                	jmp    8082a3 <unregister_filesystem+0x69>
        }
        else
            p = p->next;
  808285:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808289:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80828d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p->next)
  808291:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808295:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808299:	48 85 c0             	test   rax,rax
  80829c:	75 b2                	jne    808250 <unregister_filesystem+0x16>
    return 0;
  80829e:	b8 00 00 00 00       	mov    eax,0x0
}
  8082a3:	5d                   	pop    rbp
  8082a4:	c3                   	ret    

00000000008082a5 <root_lookup>:
//在parent inode下查找dest dentry
struct dir_entry* root_lookup(struct index_node * parent_inode,struct dir_entry * dest_dentry){
  8082a5:	f3 0f 1e fa          	endbr64 
  8082a9:	55                   	push   rbp
  8082aa:	48 89 e5             	mov    rbp,rsp
  8082ad:	48 83 ec 30          	sub    rsp,0x30
  8082b1:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  8082b5:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    struct dir_entry* tmp= (struct dir_entry *) parent_inode->private_index_info;
  8082b9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8082bd:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8082c1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    struct List* p= tmp->subdirs_list.next;
  8082c5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8082c9:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  8082cd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (p){
  8082d1:	eb 47                	jmp    80831a <root_lookup+0x75>
        struct dir_entry* dp=p->data;
  8082d3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8082d7:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8082db:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        if(strcmp(dp->name,dest_dentry->name)==0){
  8082df:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8082e3:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8082e6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8082ea:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8082ed:	48 89 d6             	mov    rsi,rdx
  8082f0:	48 89 c7             	mov    rdi,rax
  8082f3:	e8 b0 4e 00 00       	call   80d1a8 <strcmp>
  8082f8:	85 c0                	test   eax,eax
  8082fa:	75 12                	jne    80830e <root_lookup+0x69>
            vmfree(dest_dentry);
  8082fc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808300:	48 89 c7             	mov    rdi,rax
  808303:	e8 c9 8f ff ff       	call   8012d1 <vmfree>
            return dp;
  808308:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80830c:	eb 24                	jmp    808332 <root_lookup+0x8d>
        }
        p=p->next;
  80830e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808312:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808316:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (p){
  80831a:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80831f:	75 b2                	jne    8082d3 <root_lookup+0x2e>
    }
    vmfree(dest_dentry);
  808321:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808325:	48 89 c7             	mov    rdi,rax
  808328:	e8 a4 8f ff ff       	call   8012d1 <vmfree>
    return NULL;
  80832d:	b8 00 00 00 00       	mov    eax,0x0
}
  808332:	c9                   	leave  
  808333:	c3                   	ret    

0000000000808334 <mount_rootfs>:
struct index_node_operations root_iops={
    .lookup=root_lookup
};
void mount_rootfs(){
  808334:	f3 0f 1e fa          	endbr64 
  808338:	55                   	push   rbp
  808339:	48 89 e5             	mov    rbp,rsp
  80833c:	48 83 ec 20          	sub    rsp,0x20
    root_sb=(struct super_block*)vmalloc();
  808340:	b8 00 00 00 00       	mov    eax,0x0
  808345:	e8 f8 8e ff ff       	call   801242 <vmalloc>
  80834a:	48 89 05 f7 ff c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1fff7],rax        # 428348 <root_sb>
    root_sb->root=root_sb+1;//紧凑跟在后面
  808351:	48 8b 15 f0 ff c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1fff0]        # 428348 <root_sb>
  808358:	48 8b 05 e9 ff c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1ffe9]        # 428348 <root_sb>
  80835f:	48 83 c2 18          	add    rdx,0x18
  808363:	48 89 10             	mov    QWORD PTR [rax],rdx
    root_sb->sb_ops=NULL;
  808366:	48 8b 05 db ff c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1ffdb]        # 428348 <root_sb>
  80836d:	48 c7 40 08 00 00 00 	mov    QWORD PTR [rax+0x8],0x0
  808374:	00 
    struct index_node* ir=root_sb->root+1;
  808375:	48 8b 05 cc ff c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1ffcc]        # 428348 <root_sb>
  80837c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80837f:	48 83 c0 58          	add    rax,0x58
  808383:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    root_sb->root->dir_inode=ir;
  808387:	48 8b 05 ba ff c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1ffba]        # 428348 <root_sb>
  80838e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808391:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  808395:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    ir->sb=root_sb;
  808399:	48 8b 15 a8 ff c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1ffa8]        # 428348 <root_sb>
  8083a0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8083a4:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    ir->attribute=FS_ATTR_DIR;
  8083a8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8083ac:	48 c7 40 10 02 00 00 	mov    QWORD PTR [rax+0x10],0x2
  8083b3:	00 
    ir->file_size=0;
  8083b4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8083b8:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    ir->inode_ops=&root_iops;//lookup函数是必要的
  8083bf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8083c3:	48 c7 40 28 40 da 80 	mov    QWORD PTR [rax+0x28],0x80da40
  8083ca:	00 
    ir->f_ops=NULL;
  8083cb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8083cf:	48 c7 40 20 00 00 00 	mov    QWORD PTR [rax+0x20],0x0
  8083d6:	00 
    ir->private_index_info=root_sb->root;
  8083d7:	48 8b 05 6a ff c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1ff6a]        # 428348 <root_sb>
  8083de:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8083e1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8083e5:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx

    root_sb->root->name=ir+1;//紧凑跟在后面
  8083e9:	48 8b 05 58 ff c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1ff58]        # 428348 <root_sb>
  8083f0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8083f3:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8083f7:	48 83 c2 38          	add    rdx,0x38
  8083fb:	48 89 10             	mov    QWORD PTR [rax],rdx
    strcpy(root_sb->root->name,"/");
  8083fe:	48 8b 05 43 ff c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1ff43]        # 428348 <root_sb>
  808405:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808408:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80840b:	be cf 56 81 00       	mov    esi,0x8156cf
  808410:	48 89 c7             	mov    rdi,rax
  808413:	e8 f0 4b 00 00       	call   80d008 <strcpy>
    root_sb->root->name_length=1;
  808418:	48 8b 05 29 ff c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1ff29]        # 428348 <root_sb>
  80841f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808422:	c7 40 08 01 00 00 00 	mov    DWORD PTR [rax+0x8],0x1
    root_sb->root->parent=root_sb->root;
  808429:	48 8b 15 18 ff c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1ff18]        # 428348 <root_sb>
  808430:	48 8b 05 11 ff c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1ff11]        # 428348 <root_sb>
  808437:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80843a:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  80843d:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    list_init(&root_sb->root->subdirs_list);
  808441:	48 8b 05 00 ff c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1ff00]        # 428348 <root_sb>
  808448:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80844b:	48 83 c0 28          	add    rax,0x28
  80844f:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    list->prev = NULL;
  808453:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808457:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  80845e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808462:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  808469:	00 
}
  80846a:	90                   	nop
    list_init(&root_sb->root->child_node);
  80846b:	48 8b 05 d6 fe c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1fed6]        # 428348 <root_sb>
  808472:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808475:	48 83 c0 10          	add    rax,0x10
  808479:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    list->prev = NULL;
  80847d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808481:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  808488:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80848c:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  808493:	00 
}
  808494:	90                   	nop

}
  808495:	90                   	nop
  808496:	c9                   	leave  
  808497:	c3                   	ret    

0000000000808498 <sys_putstring>:
#include "syscall.h"
#include "int.h"


unsigned long sys_putstring(char *string)
{
  808498:	f3 0f 1e fa          	endbr64 
  80849c:	55                   	push   rbp
  80849d:	48 89 e5             	mov    rbp,rsp
  8084a0:	48 83 ec 10          	sub    rsp,0x10
  8084a4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    printf(string);
  8084a8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8084ac:	48 89 c7             	mov    rdi,rax
  8084af:	b8 00 00 00 00       	mov    eax,0x0
  8084b4:	e8 b3 88 ff ff       	call   800d6c <printf>
    return 0;
  8084b9:	b8 00 00 00 00       	mov    eax,0x0
}
  8084be:	c9                   	leave  
  8084bf:	c3                   	ret    

00000000008084c0 <sys_open>:

unsigned long sys_open(char *filename,int flags)
{
  8084c0:	f3 0f 1e fa          	endbr64 
  8084c4:	55                   	push   rbp
  8084c5:	48 89 e5             	mov    rbp,rsp
  8084c8:	48 81 ec a0 00 00 00 	sub    rsp,0xa0
  8084cf:	48 89 bd 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdi
  8084d6:	89 b5 64 ff ff ff    	mov    DWORD PTR [rbp-0x9c],esi
    char * path = NULL;
  8084dc:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  8084e3:	00 
    long pathlen = 0;
  8084e4:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  8084eb:	00 
    long error = 0;
  8084ec:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8084f3:	00 
    struct dir_entry * dentry = NULL;
  8084f4:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8084fb:	00 
    struct file * filp = NULL;
  8084fc:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  808503:	00 
    struct file ** f = NULL;
  808504:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  80850b:	00 
    int fd = -1;
  80850c:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
    int i;

//	printf("sys_open\n");
    path = (char *)vmalloc();
  808513:	b8 00 00 00 00       	mov    eax,0x0
  808518:	e8 25 8d ff ff       	call   801242 <vmalloc>
  80851d:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    if(path == NULL)
  808521:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  808526:	75 0c                	jne    808534 <sys_open+0x74>
        return -ENOMEM;
  808528:	48 c7 c0 cf ff ff ff 	mov    rax,0xffffffffffffffcf
  80852f:	e9 21 05 00 00       	jmp    808a55 <sys_open+0x595>
    memset(path,0,PAGE_4K_SIZE);
  808534:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808538:	ba 00 10 00 00       	mov    edx,0x1000
  80853d:	be 00 00 00 00       	mov    esi,0x0
  808542:	48 89 c7             	mov    rdi,rax
  808545:	e8 6f 4a 00 00       	call   80cfb9 <memset>
    pathlen = strlen(filename);
  80854a:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
  808551:	48 89 c7             	mov    rdi,rax
  808554:	e8 ce 4c 00 00       	call   80d227 <strlen>
  808559:	48 98                	cdqe   
  80855b:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    if(pathlen <= 0)
  80855f:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
  808564:	7f 18                	jg     80857e <sys_open+0xbe>
    {
        vmfree(path);
  808566:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80856a:	48 89 c7             	mov    rdi,rax
  80856d:	e8 5f 8d ff ff       	call   8012d1 <vmfree>
        return -EFAULT;
  808572:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  808579:	e9 d7 04 00 00       	jmp    808a55 <sys_open+0x595>
    }
    else if(pathlen >= PAGE_4K_SIZE)
  80857e:	48 81 7d d0 ff 0f 00 	cmp    QWORD PTR [rbp-0x30],0xfff
  808585:	00 
  808586:	7e 18                	jle    8085a0 <sys_open+0xe0>
    {
        vmfree(path);
  808588:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80858c:	48 89 c7             	mov    rdi,rax
  80858f:	e8 3d 8d ff ff       	call   8012d1 <vmfree>
        return -ENAMETOOLONG;
  808594:	48 c7 c0 db ff ff ff 	mov    rax,0xffffffffffffffdb
  80859b:	e9 b5 04 00 00       	jmp    808a55 <sys_open+0x595>
    }
    strcpy(path,filename);
  8085a0:	48 8b 95 68 ff ff ff 	mov    rdx,QWORD PTR [rbp-0x98]
  8085a7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8085ab:	48 89 d6             	mov    rsi,rdx
  8085ae:	48 89 c7             	mov    rdi,rax
  8085b1:	e8 52 4a 00 00       	call   80d008 <strcpy>

    dentry = path_walk(path,0);
  8085b6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8085ba:	be 00 00 00 00       	mov    esi,0x0
  8085bf:	48 89 c7             	mov    rdi,rax
  8085c2:	e8 0a f8 ff ff       	call   807dd1 <path_walk>
  8085c7:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    if(dentry == NULL){
  8085cb:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  8085d0:	0f 85 70 02 00 00    	jne    808846 <sys_open+0x386>
        if(!flags&O_CREAT)
            return -ENOENT;
        //创建文件
        //找到上一级目录
        char* p=path+strlen(path)-1;
  8085d6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8085da:	48 89 c7             	mov    rdi,rax
  8085dd:	e8 45 4c 00 00       	call   80d227 <strlen>
  8085e2:	48 98                	cdqe   
  8085e4:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  8085e8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8085ec:	48 01 d0             	add    rax,rdx
  8085ef:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for(;*p!='/'&&p>path;p--);
  8085f3:	eb 05                	jmp    8085fa <sys_open+0x13a>
  8085f5:	48 83 6d e0 01       	sub    QWORD PTR [rbp-0x20],0x1
  8085fa:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8085fe:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808601:	3c 2f                	cmp    al,0x2f
  808603:	74 0a                	je     80860f <sys_open+0x14f>
  808605:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808609:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  80860d:	77 e6                	ja     8085f5 <sys_open+0x135>
        *p='\0';
  80860f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808613:	c6 00 00             	mov    BYTE PTR [rax],0x0
        struct dir_entry *parent= path_walk(path,O_DIRECTORY);
  808616:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80861a:	be 00 40 00 00       	mov    esi,0x4000
  80861f:	48 89 c7             	mov    rdi,rax
  808622:	e8 aa f7 ff ff       	call   807dd1 <path_walk>
  808627:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        if(parent==NULL)
  80862b:	48 83 7d b8 00       	cmp    QWORD PTR [rbp-0x48],0x0
  808630:	75 0c                	jne    80863e <sys_open+0x17e>
            return -ENOENT;//上级目录也不在
  808632:	48 c7 c0 d3 ff ff ff 	mov    rax,0xffffffffffffffd3
  808639:	e9 17 04 00 00       	jmp    808a55 <sys_open+0x595>
        //创建新的文件
        dentry=(struct dir_entry*)vmalloc();
  80863e:	b8 00 00 00 00       	mov    eax,0x0
  808643:	e8 fa 8b ff ff       	call   801242 <vmalloc>
  808648:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        list_init(&dentry->subdirs_list);
  80864c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808650:	48 83 c0 28          	add    rax,0x28
  808654:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    list->prev = NULL;
  80865b:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  808662:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  808669:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  808670:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  808677:	00 
}
  808678:	90                   	nop
        list_init(&dentry->child_node);
  808679:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80867d:	48 83 c0 10          	add    rax,0x10
  808681:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    list->prev = NULL;
  808688:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  80868f:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  808696:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  80869d:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  8086a4:	00 
}
  8086a5:	90                   	nop
        dentry->child_node.data=dentry;
  8086a6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8086aa:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  8086ae:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
        list_add(&parent->subdirs_list,&dentry->child_node);
  8086b2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8086b6:	48 83 c0 10          	add    rax,0x10
  8086ba:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  8086be:	48 83 c2 28          	add    rdx,0x28
  8086c2:	48 89 55 b0          	mov    QWORD PTR [rbp-0x50],rdx
  8086c6:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
    if(entry->next==NULL)
  8086ca:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8086ce:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8086d2:	48 85 c0             	test   rax,rax
  8086d5:	75 58                	jne    80872f <sys_open+0x26f>
  8086d7:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8086db:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  8086df:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8086e3:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    new->next = entry->next;
  8086e7:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8086eb:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  8086ef:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8086f3:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  8086f7:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8086fb:	48 8b 55 a0          	mov    rdx,QWORD PTR [rbp-0x60]
  8086ff:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  808702:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808706:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80870a:	48 85 c0             	test   rax,rax
  80870d:	74 0f                	je     80871e <sys_open+0x25e>
        new->next->prev = new;
  80870f:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808713:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808717:	48 8b 55 98          	mov    rdx,QWORD PTR [rbp-0x68]
  80871b:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  80871e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808722:	48 8b 55 98          	mov    rdx,QWORD PTR [rbp-0x68]
  808726:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  80872a:	e9 9c 00 00 00       	jmp    8087cb <sys_open+0x30b>
        struct List* p=entry;
  80872f:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808733:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
        for(;p->next&&p->next!=p;p=p->next){
  808737:	eb 21                	jmp    80875a <sys_open+0x29a>
            if(p->data==new->data)
  808739:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80873d:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  808741:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808745:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  808749:	48 39 c2             	cmp    rdx,rax
  80874c:	74 7c                	je     8087ca <sys_open+0x30a>
        for(;p->next&&p->next!=p;p=p->next){
  80874e:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  808752:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808756:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  80875a:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80875e:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808762:	48 85 c0             	test   rax,rax
  808765:	74 0e                	je     808775 <sys_open+0x2b5>
  808767:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80876b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80876f:	48 39 45 90          	cmp    QWORD PTR [rbp-0x70],rax
  808773:	75 c4                	jne    808739 <sys_open+0x279>
  808775:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  808779:	48 89 45 88          	mov    QWORD PTR [rbp-0x78],rax
  80877d:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808781:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
    new->next = entry->next;
  808785:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808789:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  80878d:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808791:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    new->prev = entry;
  808795:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808799:	48 8b 55 88          	mov    rdx,QWORD PTR [rbp-0x78]
  80879d:	48 89 10             	mov    QWORD PTR [rax],rdx
    if(new->next)
  8087a0:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8087a4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8087a8:	48 85 c0             	test   rax,rax
  8087ab:	74 0f                	je     8087bc <sys_open+0x2fc>
        new->next->prev = new;
  8087ad:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8087b1:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8087b5:	48 8b 55 80          	mov    rdx,QWORD PTR [rbp-0x80]
  8087b9:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  8087bc:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8087c0:	48 8b 55 80          	mov    rdx,QWORD PTR [rbp-0x80]
  8087c4:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
}
  8087c8:	eb 01                	jmp    8087cb <sys_open+0x30b>
                return;
  8087ca:	90                   	nop
        dentry->parent=parent;
  8087cb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8087cf:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  8087d3:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
        dentry->dir_inode=dentry+1;//放在后面
  8087d7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8087db:	48 8d 50 58          	lea    rdx,[rax+0x58]
  8087df:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8087e3:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
        dentry->dir_inode->file_size=0;
  8087e7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8087eb:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8087ef:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
        //继承操作方法
        dentry->dir_inode->f_ops=parent->dir_inode->f_ops;
  8087f6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8087fa:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  8087fe:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808802:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  808806:	48 8b 52 20          	mov    rdx,QWORD PTR [rdx+0x20]
  80880a:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
        dentry->dir_inode->inode_ops=parent->dir_inode->inode_ops;
  80880e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808812:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  808816:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80881a:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80881e:	48 8b 52 28          	mov    rdx,QWORD PTR [rdx+0x28]
  808822:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
        dentry->dir_ops=parent->dir_ops;
  808826:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80882a:	48 8b 50 50          	mov    rdx,QWORD PTR [rax+0x50]
  80882e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808832:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
        //这样的创建文件只能创建普通文件，设备文件要通过devman创建
        dentry->dir_inode->attribute=FS_ATTR_FILE;
  808836:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80883a:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80883e:	48 c7 40 10 01 00 00 	mov    QWORD PTR [rax+0x10],0x1
  808845:	00 
    }
    vmfree(path);
  808846:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80884a:	48 89 c7             	mov    rdi,rax
  80884d:	e8 7f 8a ff ff       	call   8012d1 <vmfree>

    if((flags & O_DIRECTORY) && (dentry->dir_inode->attribute != FS_ATTR_DIR))
  808852:	8b 85 64 ff ff ff    	mov    eax,DWORD PTR [rbp-0x9c]
  808858:	25 00 40 00 00       	and    eax,0x4000
  80885d:	85 c0                	test   eax,eax
  80885f:	74 1e                	je     80887f <sys_open+0x3bf>
  808861:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808865:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  808869:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80886d:	48 83 f8 02          	cmp    rax,0x2
  808871:	74 0c                	je     80887f <sys_open+0x3bf>
        return -ENOTDIR;
  808873:	48 c7 c0 c7 ff ff ff 	mov    rax,0xffffffffffffffc7
  80887a:	e9 d6 01 00 00       	jmp    808a55 <sys_open+0x595>
    if(!(flags & O_DIRECTORY) && (dentry->dir_inode->attribute == FS_ATTR_DIR))
  80887f:	8b 85 64 ff ff ff    	mov    eax,DWORD PTR [rbp-0x9c]
  808885:	25 00 40 00 00       	and    eax,0x4000
  80888a:	85 c0                	test   eax,eax
  80888c:	75 1e                	jne    8088ac <sys_open+0x3ec>
  80888e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808892:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  808896:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80889a:	48 83 f8 02          	cmp    rax,0x2
  80889e:	75 0c                	jne    8088ac <sys_open+0x3ec>
        return -EISDIR;
  8088a0:	48 c7 c0 e1 ff ff ff 	mov    rax,0xffffffffffffffe1
  8088a7:	e9 a9 01 00 00       	jmp    808a55 <sys_open+0x595>

    filp = (struct file *)vmalloc();
  8088ac:	b8 00 00 00 00       	mov    eax,0x0
  8088b1:	e8 8c 89 ff ff       	call   801242 <vmalloc>
  8088b6:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    memset(filp,0,sizeof(struct file));
  8088ba:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8088be:	ba 28 00 00 00       	mov    edx,0x28
  8088c3:	be 00 00 00 00       	mov    esi,0x0
  8088c8:	48 89 c7             	mov    rdi,rax
  8088cb:	e8 e9 46 00 00       	call   80cfb9 <memset>
    filp->dentry = dentry;
  8088d0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8088d4:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  8088d8:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    filp->mode = flags;
  8088dc:	8b 85 64 ff ff ff    	mov    eax,DWORD PTR [rbp-0x9c]
  8088e2:	48 63 d0             	movsxd rdx,eax
  8088e5:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8088e9:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx

    if(dentry->dir_inode->attribute & FS_ATTR_DEVICE){
  8088ed:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8088f1:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8088f5:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8088f9:	83 e0 04             	and    eax,0x4
  8088fc:	48 85 c0             	test   rax,rax
  8088ff:	74 0e                	je     80890f <sys_open+0x44f>
        extern struct file_operations dev_dir_fops;
        filp->f_ops = &dev_dir_fops;	//////	find device file operation function
  808901:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808905:	48 c7 40 18 60 d9 80 	mov    QWORD PTR [rax+0x18],0x80d960
  80890c:	00 
  80890d:	eb 14                	jmp    808923 <sys_open+0x463>
    }
    else
        filp->f_ops = dentry->dir_inode->f_ops;
  80890f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808913:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  808917:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  80891b:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80891f:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    if(filp->f_ops && filp->f_ops->open)
  808923:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808927:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80892b:	48 85 c0             	test   rax,rax
  80892e:	74 33                	je     808963 <sys_open+0x4a3>
  808930:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808934:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808938:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80893b:	48 85 c0             	test   rax,rax
  80893e:	74 23                	je     808963 <sys_open+0x4a3>
        error = filp->f_ops->open(dentry->dir_inode,filp);
  808940:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808944:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808948:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80894b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80894f:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  808953:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  808957:	48 89 d6             	mov    rsi,rdx
  80895a:	48 89 c7             	mov    rdi,rax
  80895d:	ff d1                	call   rcx
  80895f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(error != 1)
  808963:	48 83 7d f8 01       	cmp    QWORD PTR [rbp-0x8],0x1
  808968:	74 18                	je     808982 <sys_open+0x4c2>
    {
        vmfree(filp);
  80896a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80896e:	48 89 c7             	mov    rdi,rax
  808971:	e8 5b 89 ff ff       	call   8012d1 <vmfree>
        return -EFAULT;
  808976:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  80897d:	e9 d3 00 00 00       	jmp    808a55 <sys_open+0x595>
    }

    if(filp->mode & O_TRUNC)
  808982:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808986:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80898a:	25 00 02 00 00       	and    eax,0x200
  80898f:	48 85 c0             	test   rax,rax
  808992:	74 13                	je     8089a7 <sys_open+0x4e7>
    {
        filp->dentry->dir_inode->file_size = 0;
  808994:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808998:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80899c:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8089a0:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }
    if(filp->mode & O_APPEND)
  8089a7:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8089ab:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8089af:	25 00 04 00 00       	and    eax,0x400
  8089b4:	48 85 c0             	test   rax,rax
  8089b7:	74 19                	je     8089d2 <sys_open+0x512>
    {
        filp->position = filp->dentry->dir_inode->file_size;
  8089b9:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8089bd:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8089c1:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8089c5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8089c8:	48 89 c2             	mov    rdx,rax
  8089cb:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8089cf:	48 89 10             	mov    QWORD PTR [rax],rdx
    }

    f = current->openf;
  8089d2:	48 8b 05 67 c8 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c867]        # 415240 <current>
  8089d9:	48 05 d8 00 00 00    	add    rax,0xd8
  8089df:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    for(i = 0;i < MAX_TASKS;i++)
  8089e3:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  8089ea:	eb 28                	jmp    808a14 <sys_open+0x554>
        if(f[i] == NULL)
  8089ec:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8089ef:	48 98                	cdqe   
  8089f1:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8089f8:	00 
  8089f9:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8089fd:	48 01 d0             	add    rax,rdx
  808a00:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808a03:	48 85 c0             	test   rax,rax
  808a06:	75 08                	jne    808a10 <sys_open+0x550>
        {
            fd = i;
  808a08:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808a0b:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            break;
  808a0e:	eb 0a                	jmp    808a1a <sys_open+0x55a>
    for(i = 0;i < MAX_TASKS;i++)
  808a10:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  808a14:	83 7d e8 1f          	cmp    DWORD PTR [rbp-0x18],0x1f
  808a18:	7e d2                	jle    8089ec <sys_open+0x52c>
        }
    if(i == MAX_TASKS)
  808a1a:	83 7d e8 20          	cmp    DWORD PTR [rbp-0x18],0x20
  808a1e:	75 15                	jne    808a35 <sys_open+0x575>
    {
        vmfree(filp);
  808a20:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808a24:	48 89 c7             	mov    rdi,rax
  808a27:	e8 a5 88 ff ff       	call   8012d1 <vmfree>
        //// reclaim struct index_node & struct dir_entry
        return -EMFILE;
  808a2c:	48 c7 c0 df ff ff ff 	mov    rax,0xffffffffffffffdf
  808a33:	eb 20                	jmp    808a55 <sys_open+0x595>
    }
    f[fd] = filp;
  808a35:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808a38:	48 98                	cdqe   
  808a3a:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  808a41:	00 
  808a42:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808a46:	48 01 c2             	add    rdx,rax
  808a49:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808a4d:	48 89 02             	mov    QWORD PTR [rdx],rax

    return fd;
  808a50:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808a53:	48 98                	cdqe   
}
  808a55:	c9                   	leave  
  808a56:	c3                   	ret    

0000000000808a57 <sys_close>:

unsigned long sys_close(int fd)
{
  808a57:	f3 0f 1e fa          	endbr64 
  808a5b:	55                   	push   rbp
  808a5c:	48 89 e5             	mov    rbp,rsp
  808a5f:	48 83 ec 20          	sub    rsp,0x20
  808a63:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    struct file * filp = NULL;
  808a66:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  808a6d:	00 

//	printf("sys_close:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  808a6e:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  808a72:	78 06                	js     808a7a <sys_close+0x23>
  808a74:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  808a78:	7e 0c                	jle    808a86 <sys_close+0x2f>
        return -EBADF;
  808a7a:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  808a81:	e9 87 00 00 00       	jmp    808b0d <sys_close+0xb6>

    filp = current->openf[fd];
  808a86:	48 8b 05 b3 c7 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c7b3]        # 415240 <current>
  808a8d:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  808a90:	48 63 d2             	movsxd rdx,edx
  808a93:	48 83 c2 1a          	add    rdx,0x1a
  808a97:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  808a9c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(filp->f_ops && filp->f_ops->close)
  808aa0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808aa4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808aa8:	48 85 c0             	test   rax,rax
  808aab:	74 35                	je     808ae2 <sys_close+0x8b>
  808aad:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808ab1:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808ab5:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  808ab9:	48 85 c0             	test   rax,rax
  808abc:	74 24                	je     808ae2 <sys_close+0x8b>
        filp->f_ops->close(filp->dentry->dir_inode,filp);
  808abe:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808ac2:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808ac6:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  808aca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808ace:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808ad2:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  808ad6:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  808ada:	48 89 d6             	mov    rsi,rdx
  808add:	48 89 c7             	mov    rdi,rax
  808ae0:	ff d1                	call   rcx

    vmfree(filp);
  808ae2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808ae6:	48 89 c7             	mov    rdi,rax
  808ae9:	e8 e3 87 ff ff       	call   8012d1 <vmfree>
    current->openf[fd] = NULL;
  808aee:	48 8b 05 4b c7 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c74b]        # 415240 <current>
  808af5:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  808af8:	48 63 d2             	movsxd rdx,edx
  808afb:	48 83 c2 1a          	add    rdx,0x1a
  808aff:	48 c7 44 d0 08 00 00 	mov    QWORD PTR [rax+rdx*8+0x8],0x0
  808b06:	00 00 

    return 0;
  808b08:	b8 00 00 00 00       	mov    eax,0x0
}
  808b0d:	c9                   	leave  
  808b0e:	c3                   	ret    

0000000000808b0f <sys_read>:

unsigned long sys_read(int fd,void * buf,long count)
{
  808b0f:	f3 0f 1e fa          	endbr64 
  808b13:	55                   	push   rbp
  808b14:	48 89 e5             	mov    rbp,rsp
  808b17:	48 83 ec 30          	sub    rsp,0x30
  808b1b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  808b1e:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  808b22:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  808b26:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  808b2d:	00 
    unsigned long ret = 0;
  808b2e:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  808b35:	00 

//	printf("sys_read:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  808b36:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  808b3a:	78 06                	js     808b42 <sys_read+0x33>
  808b3c:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  808b40:	7e 09                	jle    808b4b <sys_read+0x3c>
        return -EBADF;
  808b42:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  808b49:	eb 72                	jmp    808bbd <sys_read+0xae>
    if(count < 0)
  808b4b:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  808b50:	79 09                	jns    808b5b <sys_read+0x4c>
        return -EINVAL;
  808b52:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  808b59:	eb 62                	jmp    808bbd <sys_read+0xae>

    filp = current->openf[fd];
  808b5b:	48 8b 05 de c6 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c6de]        # 415240 <current>
  808b62:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  808b65:	48 63 d2             	movsxd rdx,edx
  808b68:	48 83 c2 1a          	add    rdx,0x1a
  808b6c:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  808b71:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->read)
  808b75:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808b79:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808b7d:	48 85 c0             	test   rax,rax
  808b80:	74 37                	je     808bb9 <sys_read+0xaa>
  808b82:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808b86:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808b8a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808b8e:	48 85 c0             	test   rax,rax
  808b91:	74 26                	je     808bb9 <sys_read+0xaa>
        ret = filp->f_ops->read(filp,buf,count,&filp->position);
  808b93:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808b97:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808b9b:	4c 8b 40 10          	mov    r8,QWORD PTR [rax+0x10]
  808b9f:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  808ba3:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  808ba7:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  808bab:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808baf:	48 89 c7             	mov    rdi,rax
  808bb2:	41 ff d0             	call   r8
  808bb5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  808bb9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  808bbd:	c9                   	leave  
  808bbe:	c3                   	ret    

0000000000808bbf <sys_write>:

unsigned long sys_write(int fd,void * buf,long count)
{
  808bbf:	f3 0f 1e fa          	endbr64 
  808bc3:	55                   	push   rbp
  808bc4:	48 89 e5             	mov    rbp,rsp
  808bc7:	48 83 ec 30          	sub    rsp,0x30
  808bcb:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  808bce:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  808bd2:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  808bd6:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  808bdd:	00 
    unsigned long ret = 0;
  808bde:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  808be5:	00 

//	printf("sys_write:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  808be6:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  808bea:	78 06                	js     808bf2 <sys_write+0x33>
  808bec:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  808bf0:	7e 09                	jle    808bfb <sys_write+0x3c>
        return -EBADF;
  808bf2:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  808bf9:	eb 72                	jmp    808c6d <sys_write+0xae>
    if(count < 0)
  808bfb:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  808c00:	79 09                	jns    808c0b <sys_write+0x4c>
        return -EINVAL;
  808c02:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  808c09:	eb 62                	jmp    808c6d <sys_write+0xae>

    filp = current->openf[fd];
  808c0b:	48 8b 05 2e c6 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c62e]        # 415240 <current>
  808c12:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  808c15:	48 63 d2             	movsxd rdx,edx
  808c18:	48 83 c2 1a          	add    rdx,0x1a
  808c1c:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  808c21:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->write)
  808c25:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808c29:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808c2d:	48 85 c0             	test   rax,rax
  808c30:	74 37                	je     808c69 <sys_write+0xaa>
  808c32:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808c36:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808c3a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808c3e:	48 85 c0             	test   rax,rax
  808c41:	74 26                	je     808c69 <sys_write+0xaa>
        ret = filp->f_ops->write(filp,buf,count,&filp->position);
  808c43:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808c47:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808c4b:	4c 8b 40 18          	mov    r8,QWORD PTR [rax+0x18]
  808c4f:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  808c53:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  808c57:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  808c5b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808c5f:	48 89 c7             	mov    rdi,rax
  808c62:	41 ff d0             	call   r8
  808c65:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  808c69:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  808c6d:	c9                   	leave  
  808c6e:	c3                   	ret    

0000000000808c6f <sys_lseek>:


unsigned long sys_lseek(int filds,long offset,int whence)
{
  808c6f:	f3 0f 1e fa          	endbr64 
  808c73:	55                   	push   rbp
  808c74:	48 89 e5             	mov    rbp,rsp
  808c77:	48 83 ec 20          	sub    rsp,0x20
  808c7b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  808c7e:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  808c82:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    struct file * filp = NULL;
  808c85:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  808c8c:	00 
    unsigned long ret = 0;
  808c8d:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  808c94:	00 

//	printf("sys_lseek:%d\n",filds);
    if(filds < 0 || filds >= MAX_TASKS)
  808c95:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  808c99:	78 06                	js     808ca1 <sys_lseek+0x32>
  808c9b:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  808c9f:	7e 09                	jle    808caa <sys_lseek+0x3b>
        return -EBADF;
  808ca1:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  808ca8:	eb 78                	jmp    808d22 <sys_lseek+0xb3>
    if(whence < 0 || whence >= SEEK_MAX)
  808caa:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  808cae:	78 06                	js     808cb6 <sys_lseek+0x47>
  808cb0:	83 7d e8 02          	cmp    DWORD PTR [rbp-0x18],0x2
  808cb4:	7e 09                	jle    808cbf <sys_lseek+0x50>
        return -EINVAL;
  808cb6:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  808cbd:	eb 63                	jmp    808d22 <sys_lseek+0xb3>

    filp = current->openf[filds];
  808cbf:	48 8b 05 7a c5 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c57a]        # 415240 <current>
  808cc6:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  808cc9:	48 63 d2             	movsxd rdx,edx
  808ccc:	48 83 c2 1a          	add    rdx,0x1a
  808cd0:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  808cd5:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->lseek)
  808cd9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808cdd:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808ce1:	48 85 c0             	test   rax,rax
  808ce4:	74 38                	je     808d1e <sys_lseek+0xaf>
  808ce6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808cea:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808cee:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  808cf2:	48 85 c0             	test   rax,rax
  808cf5:	74 27                	je     808d1e <sys_lseek+0xaf>
        ret = filp->f_ops->lseek(filp,offset,whence);
  808cf7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808cfb:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808cff:	4c 8b 40 20          	mov    r8,QWORD PTR [rax+0x20]
  808d03:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808d06:	48 63 d0             	movsxd rdx,eax
  808d09:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  808d0d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808d11:	48 89 ce             	mov    rsi,rcx
  808d14:	48 89 c7             	mov    rdi,rax
  808d17:	41 ff d0             	call   r8
  808d1a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  808d1e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  808d22:	c9                   	leave  
  808d23:	c3                   	ret    

0000000000808d24 <sys_vfork>:
//    printf("sys_fork\n");
//    //return do_fork(regs,0,regs->rsp,0);
//}

unsigned long sys_vfork()
{
  808d24:	f3 0f 1e fa          	endbr64 
  808d28:	55                   	push   rbp
  808d29:	48 89 e5             	mov    rbp,rsp
  808d2c:	48 83 ec 10          	sub    rsp,0x10
    regs_t *regs = (regs_t *)current->tss.rsp0 -1;
  808d30:	48 8b 05 09 c5 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c509]        # 415240 <current>
  808d37:	48 8b 80 dc 01 00 00 	mov    rax,QWORD PTR [rax+0x1dc]
  808d3e:	48 2d d0 00 00 00    	sub    rax,0xd0
  808d44:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    printf("sys_vfork\n");
  808d48:	bf d8 56 81 00       	mov    edi,0x8156d8
  808d4d:	b8 00 00 00 00       	mov    eax,0x0
  808d52:	e8 15 80 ff ff       	call   800d6c <printf>
    //return do_fork(regs,CLONE_VM | CLONE_FS | CLONE_SIGNAL,regs->rsp,0);
}
  808d57:	90                   	nop
  808d58:	c9                   	leave  
  808d59:	c3                   	ret    

0000000000808d5a <sys_wait>:

/*
	rusage reserved
*/

unsigned long sys_wait(pid_t pid, int *stat_loc, int options){
  808d5a:	f3 0f 1e fa          	endbr64 
  808d5e:	55                   	push   rbp
  808d5f:	48 89 e5             	mov    rbp,rsp
  808d62:	89 7d bc             	mov    DWORD PTR [rbp-0x44],edi
  808d65:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
  808d69:	89 55 b8             	mov    DWORD PTR [rbp-0x48],edx
    struct process* waitee=NULL;
  808d6c:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  808d73:	00 
    extern struct process task[];
    if(!current->child_procs)
  808d74:	48 8b 05 c5 c4 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c4c5]        # 415240 <current>
  808d7b:	48 8b 80 2c 03 00 00 	mov    rax,QWORD PTR [rax+0x32c]
  808d82:	48 85 c0             	test   rax,rax
  808d85:	75 0c                	jne    808d93 <sys_wait+0x39>
        return -ECHILD;//没有子进程可以等
  808d87:	48 c7 c0 f4 ff ff ff 	mov    rax,0xfffffffffffffff4
  808d8e:	e9 af 01 00 00       	jmp    808f42 <sys_wait+0x1e8>
    if(pid==-1){
  808d93:	83 7d bc ff          	cmp    DWORD PTR [rbp-0x44],0xffffffff
  808d97:	75 4e                	jne    808de7 <sys_wait+0x8d>
        //任意一个子进程
        while (1) {
            for(struct List* l=current->child_procs;l;l=l->next) {
  808d99:	48 8b 05 a0 c4 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c4a0]        # 415240 <current>
  808da0:	48 8b 80 2c 03 00 00 	mov    rax,QWORD PTR [rax+0x32c]
  808da7:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  808dab:	eb 31                	jmp    808dde <sys_wait+0x84>
                struct process* p=l->data;
  808dad:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808db1:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  808db5:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
                if(p->stat == TASK_ZOMBIE) {
  808db9:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808dbd:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  808dc0:	83 f8 04             	cmp    eax,0x4
  808dc3:	75 0d                	jne    808dd2 <sys_wait+0x78>
                    waitee=p;
  808dc5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808dc9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
                    goto done;
  808dcd:	e9 10 01 00 00       	jmp    808ee2 <sys_wait+0x188>
            for(struct List* l=current->child_procs;l;l=l->next) {
  808dd2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808dd6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808dda:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  808dde:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  808de3:	75 c8                	jne    808dad <sys_wait+0x53>
  808de5:	eb b2                	jmp    808d99 <sys_wait+0x3f>
                }
            }
        }

    }else if(pid==0) {
  808de7:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  808deb:	75 63                	jne    808e50 <sys_wait+0xf6>
        //等待任意一个和父进程同一个进程组的子进程
        while (1) {
            for(struct List* l=current->child_procs;l;l=l->next) {
  808ded:	48 8b 05 4c c4 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c44c]        # 415240 <current>
  808df4:	48 8b 80 2c 03 00 00 	mov    rax,QWORD PTR [rax+0x32c]
  808dfb:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  808dff:	eb 46                	jmp    808e47 <sys_wait+0xed>
                struct process* p=l->data;
  808e01:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808e05:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  808e09:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
                if(p->gpid==current->gpid&& p->stat == TASK_ZOMBIE) {
  808e0d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808e11:	8b 50 04             	mov    edx,DWORD PTR [rax+0x4]
  808e14:	48 8b 05 25 c4 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c425]        # 415240 <current>
  808e1b:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808e1e:	39 c2                	cmp    edx,eax
  808e20:	75 19                	jne    808e3b <sys_wait+0xe1>
  808e22:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808e26:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  808e29:	83 f8 04             	cmp    eax,0x4
  808e2c:	75 0d                	jne    808e3b <sys_wait+0xe1>
                    waitee=p;
  808e2e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808e32:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
                    goto done;
  808e36:	e9 a7 00 00 00       	jmp    808ee2 <sys_wait+0x188>
            for(struct List* l=current->child_procs;l;l=l->next) {
  808e3b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808e3f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808e43:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  808e47:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  808e4c:	75 b3                	jne    808e01 <sys_wait+0xa7>
  808e4e:	eb 9d                	jmp    808ded <sys_wait+0x93>
                }
            }
        }
    }else{
        if(pid<0)pid=-pid;
  808e50:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  808e54:	79 03                	jns    808e59 <sys_wait+0xff>
  808e56:	f7 5d bc             	neg    DWORD PTR [rbp-0x44]
        //检查是不是本进程的子进程
        for(int i=0;i<MAX_TASKS;i++){
  808e59:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
  808e60:	eb 37                	jmp    808e99 <sys_wait+0x13f>
            if(task[i].pid==pid){
  808e62:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808e65:	48 98                	cdqe   
  808e67:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  808e6e:	48 05 40 85 40 00    	add    rax,0x408540
  808e74:	8b 10                	mov    edx,DWORD PTR [rax]
  808e76:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  808e79:	39 c2                	cmp    edx,eax
  808e7b:	75 18                	jne    808e95 <sys_wait+0x13b>
                waitee=&task[i];
  808e7d:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808e80:	48 98                	cdqe   
  808e82:	48 69 c0 34 03 00 00 	imul   rax,rax,0x334
  808e89:	48 05 40 85 40 00    	add    rax,0x408540
  808e8f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
                break;
  808e93:	eb 0a                	jmp    808e9f <sys_wait+0x145>
        for(int i=0;i<MAX_TASKS;i++){
  808e95:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
  808e99:	83 7d e4 1f          	cmp    DWORD PTR [rbp-0x1c],0x1f
  808e9d:	7e c3                	jle    808e62 <sys_wait+0x108>
            }
        }
        if(waitee==NULL||waitee->parent_pid!=current->pid)
  808e9f:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  808ea4:	74 17                	je     808ebd <sys_wait+0x163>
  808ea6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808eaa:	8b 90 9c 00 00 00    	mov    edx,DWORD PTR [rax+0x9c]
  808eb0:	48 8b 05 89 c3 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c389]        # 415240 <current>
  808eb7:	8b 00                	mov    eax,DWORD PTR [rax]
  808eb9:	39 c2                	cmp    edx,eax
  808ebb:	74 09                	je     808ec6 <sys_wait+0x16c>
            return -ECHILD;//没有这个进程或者不是子进程
  808ebd:	48 c7 c0 f4 ff ff ff 	mov    rax,0xfffffffffffffff4
  808ec4:	eb 7c                	jmp    808f42 <sys_wait+0x1e8>
        //TODO 等待结束以及等待信号
        while (waitee->stat != TASK_ZOMBIE);
  808ec6:	90                   	nop
  808ec7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808ecb:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  808ece:	83 f8 04             	cmp    eax,0x4
  808ed1:	75 f4                	jne    808ec7 <sys_wait+0x16d>
        *stat_loc=waitee->exit_code;
  808ed3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808ed7:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  808eda:	89 c2                	mov    edx,eax
  808edc:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808ee0:	89 10                	mov    DWORD PTR [rax],edx
    }
    done:
    //清除子进程
    waitee->stat=TASK_EMPTY;
  808ee2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808ee6:	c7 40 18 00 00 00 00 	mov    DWORD PTR [rax+0x18],0x0
    //从链表中删除，不再是子进程
    list_drop(&waitee->node);
  808eed:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808ef1:	48 05 14 03 00 00    	add    rax,0x314
  808ef7:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    }
}
__attribute__((always_inline)) inline void list_drop(struct List * entry)
{
    //从链表中删除
    if(entry->prev)
  808efb:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808eff:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808f02:	48 85 c0             	test   rax,rax
  808f05:	74 13                	je     808f1a <sys_wait+0x1c0>
        entry->prev->next=entry->next;
  808f07:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808f0b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808f0e:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  808f12:	48 8b 52 10          	mov    rdx,QWORD PTR [rdx+0x10]
  808f16:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    if(entry->next)
  808f1a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808f1e:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808f22:	48 85 c0             	test   rax,rax
  808f25:	74 12                	je     808f39 <sys_wait+0x1df>
        entry->next->prev=entry->prev;
  808f27:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808f2b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808f2f:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  808f33:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  808f36:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  808f39:	90                   	nop
    //TODO 被信号中断时返回-1
    return waitee->pid;
  808f3a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f3e:	8b 00                	mov    eax,DWORD PTR [rax]
  808f40:	89 c0                	mov    eax,eax
}
  808f42:	5d                   	pop    rbp
  808f43:	c3                   	ret    

0000000000808f44 <sys_wait4>:
unsigned long sys_wait4(unsigned long pid,int *status,int options,void *rusage)
{
  808f44:	f3 0f 1e fa          	endbr64 
  808f48:	55                   	push   rbp
  808f49:	48 89 e5             	mov    rbp,rsp
  808f4c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  808f50:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  808f54:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  808f57:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
//    copy_to_user(&child->exit_code,status,sizeof(long));
//    tsk->next = child->next;
//    exit_mm(child);
//    vmfree(child);
//    return retval;
}
  808f5b:	90                   	nop
  808f5c:	5d                   	pop    rbp
  808f5d:	c3                   	ret    

0000000000808f5e <sys_brk>:

unsigned long sys_brk(unsigned long brk)
{
  808f5e:	f3 0f 1e fa          	endbr64 
  808f62:	55                   	push   rbp
  808f63:	48 89 e5             	mov    rbp,rsp
  808f66:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//
//    new_brk = do_brk(current->mm->end_brk,new_brk - current->mm->end_brk);	//expand brk space
//
//    current->mm->end_brk = new_brk;
//    return new_brk;
}
  808f6a:	90                   	nop
  808f6b:	5d                   	pop    rbp
  808f6c:	c3                   	ret    

0000000000808f6d <sys_reboot>:

unsigned long sys_reboot(unsigned long cmd,void * arg)
{
  808f6d:	f3 0f 1e fa          	endbr64 
  808f71:	55                   	push   rbp
  808f72:	48 89 e5             	mov    rbp,rsp
  808f75:	48 83 ec 10          	sub    rsp,0x10
  808f79:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  808f7d:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    printf("sys_reboot\n");
  808f81:	bf e3 56 81 00       	mov    edi,0x8156e3
  808f86:	b8 00 00 00 00       	mov    eax,0x0
  808f8b:	e8 dc 7d ff ff       	call   800d6c <printf>
    switch(cmd)
  808f90:	48 83 7d f8 01       	cmp    QWORD PTR [rbp-0x8],0x1
  808f95:	74 09                	je     808fa0 <sys_reboot+0x33>
  808f97:	48 83 7d f8 02       	cmp    QWORD PTR [rbp-0x8],0x2
  808f9c:	74 13                	je     808fb1 <sys_reboot+0x44>
  808f9e:	eb 22                	jmp    808fc2 <sys_reboot+0x55>
    {
        case SYSTEM_REBOOT:
            outb(0x64,0xFE);
  808fa0:	be fe 00 00 00       	mov    esi,0xfe
  808fa5:	bf 64 00 00 00       	mov    edi,0x64
  808faa:	e8 61 d8 ff ff       	call   806810 <outb>
            break;
  808faf:	eb 21                	jmp    808fd2 <sys_reboot+0x65>

        case SYSTEM_POWEROFF:
            printf("sys_reboot cmd SYSTEM_POWEROFF\n");
  808fb1:	bf f0 56 81 00       	mov    edi,0x8156f0
  808fb6:	b8 00 00 00 00       	mov    eax,0x0
  808fbb:	e8 ac 7d ff ff       	call   800d6c <printf>
            break;
  808fc0:	eb 10                	jmp    808fd2 <sys_reboot+0x65>

        default:
            printf("sys_reboot cmd ERROR!\n");
  808fc2:	bf 10 57 81 00       	mov    edi,0x815710
  808fc7:	b8 00 00 00 00       	mov    eax,0x0
  808fcc:	e8 9b 7d ff ff       	call   800d6c <printf>
            break;
  808fd1:	90                   	nop
    }
    return 0;
  808fd2:	b8 00 00 00 00       	mov    eax,0x0
}
  808fd7:	c9                   	leave  
  808fd8:	c3                   	ret    

0000000000808fd9 <sys_chdir>:


unsigned long sys_chdir(char *filename)
{
  808fd9:	f3 0f 1e fa          	endbr64 
  808fdd:	55                   	push   rbp
  808fde:	48 89 e5             	mov    rbp,rsp
  808fe1:	48 83 ec 30          	sub    rsp,0x30
  808fe5:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char * path = NULL;
  808fe9:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  808ff0:	00 
    long pathlen = 0;
  808ff1:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  808ff8:	00 
    struct dir_entry * dentry = NULL;
  808ff9:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  809000:	00 

    printf("sys_chdir\n");
  809001:	bf 27 57 81 00       	mov    edi,0x815727
  809006:	b8 00 00 00 00       	mov    eax,0x0
  80900b:	e8 5c 7d ff ff       	call   800d6c <printf>
    path = (char *)vmalloc();
  809010:	b8 00 00 00 00       	mov    eax,0x0
  809015:	e8 28 82 ff ff       	call   801242 <vmalloc>
  80901a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    if(path == NULL)
  80901e:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  809023:	75 0c                	jne    809031 <sys_chdir+0x58>
        return -ENOMEM;
  809025:	48 c7 c0 cf ff ff ff 	mov    rax,0xffffffffffffffcf
  80902c:	e9 ca 00 00 00       	jmp    8090fb <sys_chdir+0x122>
    memset(path,0,PAGE_4K_SIZE);
  809031:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809035:	ba 00 10 00 00       	mov    edx,0x1000
  80903a:	be 00 00 00 00       	mov    esi,0x0
  80903f:	48 89 c7             	mov    rdi,rax
  809042:	e8 72 3f 00 00       	call   80cfb9 <memset>
    pathlen = strlen(filename);
  809047:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80904b:	48 89 c7             	mov    rdi,rax
  80904e:	e8 d4 41 00 00       	call   80d227 <strlen>
  809053:	48 98                	cdqe   
  809055:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(pathlen <= 0)
  809059:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  80905e:	7f 18                	jg     809078 <sys_chdir+0x9f>
    {
        vmfree(path);
  809060:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809064:	48 89 c7             	mov    rdi,rax
  809067:	e8 65 82 ff ff       	call   8012d1 <vmfree>
        return -EFAULT;
  80906c:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  809073:	e9 83 00 00 00       	jmp    8090fb <sys_chdir+0x122>
    }
    else if(pathlen >= PAGE_4K_SIZE)
  809078:	48 81 7d f0 ff 0f 00 	cmp    QWORD PTR [rbp-0x10],0xfff
  80907f:	00 
  809080:	7e 15                	jle    809097 <sys_chdir+0xbe>
    {
        vmfree(path);
  809082:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809086:	48 89 c7             	mov    rdi,rax
  809089:	e8 43 82 ff ff       	call   8012d1 <vmfree>
        return -ENAMETOOLONG;
  80908e:	48 c7 c0 db ff ff ff 	mov    rax,0xffffffffffffffdb
  809095:	eb 64                	jmp    8090fb <sys_chdir+0x122>
    }
    strcpy(filename,path);
  809097:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80909b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80909f:	48 89 d6             	mov    rsi,rdx
  8090a2:	48 89 c7             	mov    rdi,rax
  8090a5:	e8 5e 3f 00 00       	call   80d008 <strcpy>

    dentry = path_walk(path,0);
  8090aa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8090ae:	be 00 00 00 00       	mov    esi,0x0
  8090b3:	48 89 c7             	mov    rdi,rax
  8090b6:	e8 16 ed ff ff       	call   807dd1 <path_walk>
  8090bb:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    vmfree(path);
  8090bf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8090c3:	48 89 c7             	mov    rdi,rax
  8090c6:	e8 06 82 ff ff       	call   8012d1 <vmfree>

    if(dentry == NULL)
  8090cb:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  8090d0:	75 09                	jne    8090db <sys_chdir+0x102>
        return -ENOENT;
  8090d2:	48 c7 c0 d3 ff ff ff 	mov    rax,0xffffffffffffffd3
  8090d9:	eb 20                	jmp    8090fb <sys_chdir+0x122>
    if(dentry->dir_inode->attribute != FS_ATTR_DIR)
  8090db:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8090df:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8090e3:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8090e7:	48 83 f8 02          	cmp    rax,0x2
  8090eb:	74 09                	je     8090f6 <sys_chdir+0x11d>
        return -ENOTDIR;
  8090ed:	48 c7 c0 c7 ff ff ff 	mov    rax,0xffffffffffffffc7
  8090f4:	eb 05                	jmp    8090fb <sys_chdir+0x122>
    return 0;
  8090f6:	b8 00 00 00 00       	mov    eax,0x0
}
  8090fb:	c9                   	leave  
  8090fc:	c3                   	ret    

00000000008090fd <sys_getdents>:

unsigned long sys_getdents(int fd, void * dirent, long count)
{
  8090fd:	f3 0f 1e fa          	endbr64 
  809101:	55                   	push   rbp
  809102:	48 89 e5             	mov    rbp,rsp
  809105:	48 83 ec 30          	sub    rsp,0x30
  809109:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80910c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  809110:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  809114:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80911b:	00 
    unsigned long ret = 0;
  80911c:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  809123:	00 

//	printf("sys_getdents:%d\n",fd);
    if(fd < 0 || fd > MAX_TASKS)
  809124:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  809128:	78 06                	js     809130 <sys_getdents+0x33>
  80912a:	83 7d ec 20          	cmp    DWORD PTR [rbp-0x14],0x20
  80912e:	7e 09                	jle    809139 <sys_getdents+0x3c>
        return -EBADF;
  809130:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  809137:	eb 72                	jmp    8091ab <sys_getdents+0xae>
    if(count < 0)
  809139:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80913e:	79 09                	jns    809149 <sys_getdents+0x4c>
        return -EINVAL;
  809140:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  809147:	eb 62                	jmp    8091ab <sys_getdents+0xae>

    filp = current->openf[fd];
  809149:	48 8b 05 f0 c0 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0c0f0]        # 415240 <current>
  809150:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  809153:	48 63 d2             	movsxd rdx,edx
  809156:	48 83 c2 1a          	add    rdx,0x1a
  80915a:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  80915f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->readdir)
  809163:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809167:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80916b:	48 85 c0             	test   rax,rax
  80916e:	74 37                	je     8091a7 <sys_getdents+0xaa>
  809170:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809174:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809178:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80917c:	48 85 c0             	test   rax,rax
  80917f:	74 26                	je     8091a7 <sys_getdents+0xaa>
        ret = filp->f_ops->readdir(filp,dirent,&fill_dentry);
  809181:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809185:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809189:	4c 8b 40 30          	mov    r8,QWORD PTR [rax+0x30]
  80918d:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  809191:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809195:	ba c4 80 80 00       	mov    edx,0x8080c4
  80919a:	48 89 ce             	mov    rsi,rcx
  80919d:	48 89 c7             	mov    rdi,rax
  8091a0:	41 ff d0             	call   r8
  8091a3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  8091a7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  8091ab:	c9                   	leave  
  8091ac:	c3                   	ret    
  8091ad:	0f 1f 00             	nop    DWORD PTR [rax]

00000000008091b0 <init64>:
  8091b0:	b8 00 80 ff ff       	mov    eax,0xffff8000
  8091b5:	48 c1 e0 20          	shl    rax,0x20
  8091b9:	48 05 6e 08 80 00    	add    rax,0x80086e
  8091bf:	50                   	push   rax
  8091c0:	c3                   	ret    

00000000008091c1 <shift>:
/* 0x5D - Apps      */ {  0,        0,       0x5D,      0x5D }
        };
char k_shift=0,k_ctrl=0,k_capslock=0;

void shift()
{
  8091c1:	f3 0f 1e fa          	endbr64 
  8091c5:	55                   	push   rbp
  8091c6:	48 89 e5             	mov    rbp,rsp
    k_shift=!k_shift;
  8091c9:	0f b6 05 9d f3 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f39d]        # 42856d <k_shift>
  8091d0:	84 c0                	test   al,al
  8091d2:	0f 94 c0             	sete   al
  8091d5:	88 05 92 f3 c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1f392],al        # 42856d <k_shift>
}
  8091db:	90                   	nop
  8091dc:	5d                   	pop    rbp
  8091dd:	c3                   	ret    

00000000008091de <ctrl>:
void ctrl()
{
  8091de:	f3 0f 1e fa          	endbr64 
  8091e2:	55                   	push   rbp
  8091e3:	48 89 e5             	mov    rbp,rsp
    k_ctrl=!k_ctrl;
  8091e6:	0f b6 05 81 f3 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f381]        # 42856e <k_ctrl>
  8091ed:	84 c0                	test   al,al
  8091ef:	0f 94 c0             	sete   al
  8091f2:	88 05 76 f3 c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1f376],al        # 42856e <k_ctrl>
}
  8091f8:	90                   	nop
  8091f9:	5d                   	pop    rbp
  8091fa:	c3                   	ret    

00000000008091fb <capslock>:
void capslock()
{
  8091fb:	f3 0f 1e fa          	endbr64 
  8091ff:	55                   	push   rbp
  809200:	48 89 e5             	mov    rbp,rsp
    k_capslock=k_capslock==0?1:0;
  809203:	0f b6 05 65 f3 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f365]        # 42856f <k_capslock>
  80920a:	84 c0                	test   al,al
  80920c:	0f 94 c0             	sete   al
  80920f:	88 05 5a f3 c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1f35a],al        # 42856f <k_capslock>
}
  809215:	90                   	nop
  809216:	5d                   	pop    rbp
  809217:	c3                   	ret    

0000000000809218 <to_ascii>:
char to_ascii(char scan_code)
{
  809218:	f3 0f 1e fa          	endbr64 
  80921c:	55                   	push   rbp
  80921d:	48 89 e5             	mov    rbp,rsp
  809220:	89 f8                	mov    eax,edi
  809222:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  809225:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80922c:	e9 c7 00 00 00       	jmp    8092f8 <to_ascii+0xe0>
        if(key_map[i].scan_code==scan_code)
  809231:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809234:	48 63 d0             	movsxd rdx,eax
  809237:	48 89 d0             	mov    rax,rdx
  80923a:	48 c1 e0 02          	shl    rax,0x2
  80923e:	48 01 d0             	add    rax,rdx
  809241:	48 05 a2 58 81 00    	add    rax,0x8158a2
  809247:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80924a:	38 45 ec             	cmp    BYTE PTR [rbp-0x14],al
  80924d:	0f 85 a1 00 00 00    	jne    8092f4 <to_ascii+0xdc>
        {
            if(k_capslock&&key_map[i].ascii>='a'&&key_map[i].ascii<='z')return key_map[i].ascii_shift;
  809253:	0f b6 05 15 f3 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f315]        # 42856f <k_capslock>
  80925a:	84 c0                	test   al,al
  80925c:	74 55                	je     8092b3 <to_ascii+0x9b>
  80925e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809261:	48 63 d0             	movsxd rdx,eax
  809264:	48 89 d0             	mov    rax,rdx
  809267:	48 c1 e0 02          	shl    rax,0x2
  80926b:	48 01 d0             	add    rax,rdx
  80926e:	48 05 a0 58 81 00    	add    rax,0x8158a0
  809274:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809277:	3c 60                	cmp    al,0x60
  809279:	7e 38                	jle    8092b3 <to_ascii+0x9b>
  80927b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80927e:	48 63 d0             	movsxd rdx,eax
  809281:	48 89 d0             	mov    rax,rdx
  809284:	48 c1 e0 02          	shl    rax,0x2
  809288:	48 01 d0             	add    rax,rdx
  80928b:	48 05 a0 58 81 00    	add    rax,0x8158a0
  809291:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809294:	3c 7a                	cmp    al,0x7a
  809296:	7f 1b                	jg     8092b3 <to_ascii+0x9b>
  809298:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80929b:	48 63 d0             	movsxd rdx,eax
  80929e:	48 89 d0             	mov    rax,rdx
  8092a1:	48 c1 e0 02          	shl    rax,0x2
  8092a5:	48 01 d0             	add    rax,rdx
  8092a8:	48 05 a1 58 81 00    	add    rax,0x8158a1
  8092ae:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8092b1:	eb 54                	jmp    809307 <to_ascii+0xef>
            else if(k_shift)return key_map[i].ascii_shift;
  8092b3:	0f b6 05 b3 f2 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f2b3]        # 42856d <k_shift>
  8092ba:	84 c0                	test   al,al
  8092bc:	74 1b                	je     8092d9 <to_ascii+0xc1>
  8092be:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8092c1:	48 63 d0             	movsxd rdx,eax
  8092c4:	48 89 d0             	mov    rax,rdx
  8092c7:	48 c1 e0 02          	shl    rax,0x2
  8092cb:	48 01 d0             	add    rax,rdx
  8092ce:	48 05 a1 58 81 00    	add    rax,0x8158a1
  8092d4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8092d7:	eb 2e                	jmp    809307 <to_ascii+0xef>
            else return key_map[i].ascii;
  8092d9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8092dc:	48 63 d0             	movsxd rdx,eax
  8092df:	48 89 d0             	mov    rax,rdx
  8092e2:	48 c1 e0 02          	shl    rax,0x2
  8092e6:	48 01 d0             	add    rax,rdx
  8092e9:	48 05 a0 58 81 00    	add    rax,0x8158a0
  8092ef:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8092f2:	eb 13                	jmp    809307 <to_ascii+0xef>
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  8092f4:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8092f8:	83 7d fc 5d          	cmp    DWORD PTR [rbp-0x4],0x5d
  8092fc:	0f 8e 2f ff ff ff    	jle    809231 <to_ascii+0x19>
        }

    return '\0';
  809302:	b8 00 00 00 00       	mov    eax,0x0
}
  809307:	5d                   	pop    rbp
  809308:	c3                   	ret    

0000000000809309 <init_kb>:
int init_kb()
{
  809309:	f3 0f 1e fa          	endbr64 
  80930d:	55                   	push   rbp
  80930e:	48 89 e5             	mov    rbp,rsp
    reg_device(&dev_keyboard);
  809311:	bf e0 57 81 00       	mov    edi,0x8157e0
  809316:	e8 2c 9d ff ff       	call   803047 <reg_device>
    reg_driver(&drv_keyboard);
  80931b:	bf 40 57 81 00       	mov    edi,0x815740
  809320:	e8 0a a0 ff ff       	call   80332f <reg_driver>
}
  809325:	90                   	nop
  809326:	5d                   	pop    rbp
  809327:	c3                   	ret    

0000000000809328 <key_proc>:
int key_proc()
{
  809328:	f3 0f 1e fa          	endbr64 
  80932c:	55                   	push   rbp
  80932d:	48 89 e5             	mov    rbp,rsp
  809330:	48 83 ec 20          	sub    rsp,0x20
    asm volatile("cli");
  809334:	fa                   	cli    
    //获取完整的扫描码
    u8 scan1=0,scan2=0,ch=0;
  809335:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
  809339:	c6 45 fe 00          	mov    BYTE PTR [rbp-0x2],0x0
  80933d:	c6 45 fd 00          	mov    BYTE PTR [rbp-0x3],0x0
    key_code tmpc;
    scan1=inb(0x60);
  809341:	bf 60 00 00 00       	mov    edi,0x60
  809346:	e8 de d4 ff ff       	call   806829 <inb>
  80934b:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
//    tmpc.scan_code2=scan2;
//    tmpc.ascii= ch;


//    ENQUEUE(key_bufq,tmpc)
    if((key_bufq.tail+1)%key_bufq.size!=key_bufq.head)
  80934e:	8b 05 38 47 00 00    	mov    eax,DWORD PTR [rip+0x4738]        # 80da8c <key_bufq+0xc>
  809354:	83 c0 01             	add    eax,0x1
  809357:	8b 0d 33 47 00 00    	mov    ecx,DWORD PTR [rip+0x4733]        # 80da90 <key_bufq+0x10>
  80935d:	99                   	cdq    
  80935e:	f7 f9                	idiv   ecx
  809360:	8b 05 22 47 00 00    	mov    eax,DWORD PTR [rip+0x4722]        # 80da88 <key_bufq+0x8>
  809366:	39 c2                	cmp    edx,eax
  809368:	74 32                	je     80939c <key_proc+0x74>
    {
        key_bufq.data[key_bufq.tail]=scan1;
  80936a:	48 8b 15 0f 47 00 00 	mov    rdx,QWORD PTR [rip+0x470f]        # 80da80 <key_bufq>
  809371:	8b 05 15 47 00 00    	mov    eax,DWORD PTR [rip+0x4715]        # 80da8c <key_bufq+0xc>
  809377:	48 98                	cdqe   
  809379:	48 01 c2             	add    rdx,rax
  80937c:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  809380:	88 02                	mov    BYTE PTR [rdx],al
        key_bufq.tail=(key_bufq.tail+1)%key_bufq.size;
  809382:	8b 05 04 47 00 00    	mov    eax,DWORD PTR [rip+0x4704]        # 80da8c <key_bufq+0xc>
  809388:	83 c0 01             	add    eax,0x1
  80938b:	8b 0d ff 46 00 00    	mov    ecx,DWORD PTR [rip+0x46ff]        # 80da90 <key_bufq+0x10>
  809391:	99                   	cdq    
  809392:	f7 f9                	idiv   ecx
  809394:	89 d0                	mov    eax,edx
  809396:	89 05 f0 46 00 00    	mov    DWORD PTR [rip+0x46f0],eax        # 80da8c <key_bufq+0xc>
    }

    if(scan1==0x48)
  80939c:	80 7d ff 48          	cmp    BYTE PTR [rbp-0x1],0x48
  8093a0:	75 0a                	jne    8093ac <key_proc+0x84>
        scr_up();
  8093a2:	b8 00 00 00 00       	mov    eax,0x0
  8093a7:	e8 c4 e6 ff ff       	call   807a70 <scr_up>
    if(scan1==0x50)
  8093ac:	80 7d ff 50          	cmp    BYTE PTR [rbp-0x1],0x50
  8093b0:	75 0a                	jne    8093bc <key_proc+0x94>
        scr_down();
  8093b2:	b8 00 00 00 00       	mov    eax,0x0
  8093b7:	e8 4e e7 ff ff       	call   807b0a <scr_down>
    switch (scan1)
  8093bc:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  8093c0:	3d b6 00 00 00       	cmp    eax,0xb6
  8093c5:	74 41                	je     809408 <key_proc+0xe0>
  8093c7:	3d b6 00 00 00       	cmp    eax,0xb6
  8093cc:	7f 5e                	jg     80942c <key_proc+0x104>
  8093ce:	3d aa 00 00 00       	cmp    eax,0xaa
  8093d3:	74 33                	je     809408 <key_proc+0xe0>
  8093d5:	3d aa 00 00 00       	cmp    eax,0xaa
  8093da:	7f 50                	jg     80942c <key_proc+0x104>
  8093dc:	3d 9d 00 00 00       	cmp    eax,0x9d
  8093e1:	74 31                	je     809414 <key_proc+0xec>
  8093e3:	3d 9d 00 00 00       	cmp    eax,0x9d
  8093e8:	7f 42                	jg     80942c <key_proc+0x104>
  8093ea:	83 f8 3a             	cmp    eax,0x3a
  8093ed:	74 31                	je     809420 <key_proc+0xf8>
  8093ef:	83 f8 3a             	cmp    eax,0x3a
  8093f2:	7f 38                	jg     80942c <key_proc+0x104>
  8093f4:	83 f8 36             	cmp    eax,0x36
  8093f7:	74 0f                	je     809408 <key_proc+0xe0>
  8093f9:	83 f8 36             	cmp    eax,0x36
  8093fc:	7f 2e                	jg     80942c <key_proc+0x104>
  8093fe:	83 f8 1d             	cmp    eax,0x1d
  809401:	74 11                	je     809414 <key_proc+0xec>
  809403:	83 f8 2a             	cmp    eax,0x2a
  809406:	75 24                	jne    80942c <key_proc+0x104>
    {
        case 0x36:
        case 0x2a:
        case 0xaa:
        case 0xb6:
            shift();
  809408:	b8 00 00 00 00       	mov    eax,0x0
  80940d:	e8 af fd ff ff       	call   8091c1 <shift>
            break;
  809412:	eb 19                	jmp    80942d <key_proc+0x105>
        case 0x1d:
        case 0x9d:
            ctrl();
  809414:	b8 00 00 00 00       	mov    eax,0x0
  809419:	e8 c0 fd ff ff       	call   8091de <ctrl>
            break;
  80941e:	eb 0d                	jmp    80942d <key_proc+0x105>
        case 0x3a:
            capslock();
  809420:	b8 00 00 00 00       	mov    eax,0x0
  809425:	e8 d1 fd ff ff       	call   8091fb <capslock>
            break;
  80942a:	eb 01                	jmp    80942d <key_proc+0x105>
        default:
            break;
  80942c:	90                   	nop
    }
    //发送到std
    if(!(scan1&FLAG_BREAK)){
  80942d:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  809431:	84 c0                	test   al,al
  809433:	78 37                	js     80946c <key_proc+0x144>
        char ch= to_ascii(scan1);
  809435:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  809439:	0f be c0             	movsx  eax,al
  80943c:	89 c7                	mov    edi,eax
  80943e:	e8 d5 fd ff ff       	call   809218 <to_ascii>
  809443:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
        unsigned long args[]={(unsigned long) &ch, 1};
  809446:	48 8d 45 f7          	lea    rax,[rbp-0x9]
  80944a:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  80944e:	48 c7 45 e8 01 00 00 	mov    QWORD PTR [rbp-0x18],0x1
  809455:	00 
        //写入stdin
        sys_ioctl(0,TTY_WSTDIN,(unsigned long)args);
  809456:	48 8d 45 e0          	lea    rax,[rbp-0x20]
  80945a:	48 89 c2             	mov    rdx,rax
  80945d:	be 03 00 00 00       	mov    esi,0x3
  809462:	bf 00 00 00 00       	mov    edi,0x0
  809467:	e8 1e d3 ff ff       	call   80678a <sys_ioctl>
//        //logf("%x\n",stdin.w_ptr);
//        //print_stdin();
//        //printchar(ch);
//        //flush_screen(0);*/
//    }
    eoi();
  80946c:	b8 00 00 00 00       	mov    eax,0x0
  809471:	e8 c8 d3 ff ff       	call   80683e <eoi>
    asm volatile("leave\r\n iretq");
  809476:	c9                   	leave  
  809477:	48 cf                	iretq  
}
  809479:	90                   	nop
  80947a:	c9                   	leave  
  80947b:	c3                   	ret    

000000000080947c <sys_analyse_key>:

char sys_analyse_key()
{
  80947c:	f3 0f 1e fa          	endbr64 
  809480:	55                   	push   rbp
  809481:	48 89 e5             	mov    rbp,rsp
  809484:	48 83 ec 30          	sub    rsp,0x30
    if(key_bufq.tail==key_bufq.head)return -1;
  809488:	8b 15 fe 45 00 00    	mov    edx,DWORD PTR [rip+0x45fe]        # 80da8c <key_bufq+0xc>
  80948e:	8b 05 f4 45 00 00    	mov    eax,DWORD PTR [rip+0x45f4]        # 80da88 <key_bufq+0x8>
  809494:	39 c2                	cmp    edx,eax
  809496:	75 0a                	jne    8094a2 <sys_analyse_key+0x26>
  809498:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80949d:	e9 df 00 00 00       	jmp    809581 <sys_analyse_key+0x105>
    char c=key_buf[key_bufq.head];
  8094a2:	8b 05 e0 45 00 00    	mov    eax,DWORD PTR [rip+0x45e0]        # 80da88 <key_bufq+0x8>
  8094a8:	48 98                	cdqe   
  8094aa:	0f b6 80 60 83 42 00 	movzx  eax,BYTE PTR [rax+0x428360]
  8094b1:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    key_bufq.head=(key_bufq.head+1)%key_bufq.size;
  8094b4:	8b 05 ce 45 00 00    	mov    eax,DWORD PTR [rip+0x45ce]        # 80da88 <key_bufq+0x8>
  8094ba:	83 c0 01             	add    eax,0x1
  8094bd:	8b 0d cd 45 00 00    	mov    ecx,DWORD PTR [rip+0x45cd]        # 80da90 <key_bufq+0x10>
  8094c3:	99                   	cdq    
  8094c4:	f7 f9                	idiv   ecx
  8094c6:	89 d0                	mov    eax,edx
  8094c8:	89 05 ba 45 00 00    	mov    DWORD PTR [rip+0x45ba],eax        # 80da88 <key_bufq+0x8>
//    QHEAD(key_bufq)=(QHEAD(key_bufq)+1)%QSIZE(key_bufq);
    printf("scan code:");
  8094ce:	bf 76 5a 81 00       	mov    edi,0x815a76
  8094d3:	b8 00 00 00 00       	mov    eax,0x0
  8094d8:	e8 8f 78 ff ff       	call   800d6c <printf>
    char res[33]={0};
  8094dd:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  8094e4:	00 
  8094e5:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  8094ec:	00 
  8094ed:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  8094f4:	00 
  8094f5:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  8094fc:	00 
  8094fd:	c6 45 f0 00          	mov    BYTE PTR [rbp-0x10],0x0
    itoa(res,16,c);
  809501:	0f be 55 ff          	movsx  edx,BYTE PTR [rbp-0x1]
  809505:	48 8d 45 d0          	lea    rax,[rbp-0x30]
  809509:	be 10 00 00 00       	mov    esi,0x10
  80950e:	48 89 c7             	mov    rdi,rax
  809511:	e8 17 77 ff ff       	call   800c2d <itoa>
    printf(res);
  809516:	48 8d 45 d0          	lea    rax,[rbp-0x30]
  80951a:	48 89 c7             	mov    rdi,rax
  80951d:	b8 00 00 00 00       	mov    eax,0x0
  809522:	e8 45 78 ff ff       	call   800d6c <printf>
    if(c&FLAG_BREAK){
  809527:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  80952b:	79 16                	jns    809543 <sys_analyse_key+0xc7>
        printf("\n");
  80952d:	bf 81 5a 81 00       	mov    edi,0x815a81
  809532:	b8 00 00 00 00       	mov    eax,0x0
  809537:	e8 30 78 ff ff       	call   800d6c <printf>
        return -1;
  80953c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  809541:	eb 3e                	jmp    809581 <sys_analyse_key+0x105>
    }
    c= to_ascii(c&0x7f);
  809543:	0f be 45 ff          	movsx  eax,BYTE PTR [rbp-0x1]
  809547:	83 e0 7f             	and    eax,0x7f
  80954a:	89 c7                	mov    edi,eax
  80954c:	e8 c7 fc ff ff       	call   809218 <to_ascii>
  809551:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    printf(" char:");
  809554:	bf 83 5a 81 00       	mov    edi,0x815a83
  809559:	b8 00 00 00 00       	mov    eax,0x0
  80955e:	e8 09 78 ff ff       	call   800d6c <printf>
    putchar(c);
  809563:	0f be 45 ff          	movsx  eax,BYTE PTR [rbp-0x1]
  809567:	89 c7                	mov    edi,eax
  809569:	e8 d4 77 ff ff       	call   800d42 <putchar>
    printf("\n");
  80956e:	bf 81 5a 81 00       	mov    edi,0x815a81
  809573:	b8 00 00 00 00       	mov    eax,0x0
  809578:	e8 ef 77 ff ff       	call   800d6c <printf>
    return c;
  80957d:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  809581:	c9                   	leave  
  809582:	c3                   	ret    

0000000000809583 <init_disk>:
        .read=async_read_disk,
        .write=async_write_disk
};
int disks[4];//四块硬盘的dev号
int init_disk()
{
  809583:	f3 0f 1e fa          	endbr64 
  809587:	55                   	push   rbp
  809588:	48 89 e5             	mov    rbp,rsp
    //disk_devi= reg_device(&dev_disk);
    //disk_drvi= reg_driver(&drv_disk);
    //dev_disk.drv=&drv_disk;
    hd_iterate();
  80958b:	b8 00 00 00 00       	mov    eax,0x0
  809590:	e8 c4 09 00 00       	call   809f59 <hd_iterate>
    return 0;
  809595:	b8 00 00 00 00       	mov    eax,0x0
}
  80959a:	5d                   	pop    rbp
  80959b:	c3                   	ret    

000000000080959c <disk_int_handler_c>:

int disk_int_handler_c()
{
  80959c:	f3 0f 1e fa          	endbr64 
  8095a0:	55                   	push   rbp
  8095a1:	48 89 e5             	mov    rbp,rsp
  8095a4:	48 83 ec 20          	sub    rsp,0x20
    if(running_req==NULL)
  8095a8:	48 8b 05 11 1d c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21d11]        # 42b2c0 <running_req>
  8095af:	48 85 c0             	test   rax,rax
  8095b2:	75 0a                	jne    8095be <disk_int_handler_c+0x22>
    {
        //printf("err:null running dreq\n");
        return 1;//同步读写硬盘
  8095b4:	b8 01 00 00 00       	mov    eax,0x1
  8095b9:	e9 bf 01 00 00       	jmp    80977d <disk_int_handler_c+0x1e1>
    }
    short *p=running_req->buf;
  8095be:	48 8b 05 fb 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21cfb]        # 42b2c0 <running_req>
  8095c5:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8095c9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int port=PORT_DISK_MAJOR;
  8095cd:	c7 45 f4 f0 01 00 00 	mov    DWORD PTR [rbp-0xc],0x1f0
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  8095d4:	48 8b 05 e5 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21ce5]        # 42b2c0 <running_req>
  8095db:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8095de:	83 f8 02             	cmp    eax,0x2
  8095e1:	74 0f                	je     8095f2 <disk_int_handler_c+0x56>
    running_req->disk==DISK_SLAVE_SLAVE)
  8095e3:	48 8b 05 d6 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21cd6]        # 42b2c0 <running_req>
  8095ea:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  8095ed:	83 f8 03             	cmp    eax,0x3
  8095f0:	75 07                	jne    8095f9 <disk_int_handler_c+0x5d>
        port=PORT_DISK_SLAVE;
  8095f2:	c7 45 f4 70 01 00 00 	mov    DWORD PTR [rbp-0xc],0x170
    if(running_req->func==DISKREQ_READ)
  8095f9:	48 8b 05 c0 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21cc0]        # 42b2c0 <running_req>
  809600:	8b 00                	mov    eax,DWORD PTR [rax]
  809602:	85 c0                	test   eax,eax
  809604:	75 50                	jne    809656 <disk_int_handler_c+0xba>
    {
        ////printf("sys_read dist:%x\n",p);
        //读取
        for(int i=0;i<running_req->sec_n*256;i++)
  809606:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80960d:	eb 22                	jmp    809631 <disk_int_handler_c+0x95>
        {
            *p++=inw(port);
  80960f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809612:	0f b7 c0             	movzx  eax,ax
  809615:	89 c7                	mov    edi,eax
  809617:	e8 17 d2 ff ff       	call   806833 <inw>
  80961c:	89 c2                	mov    edx,eax
  80961e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809622:	48 8d 48 02          	lea    rcx,[rax+0x2]
  809626:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80962a:	66 89 10             	mov    WORD PTR [rax],dx
        for(int i=0;i<running_req->sec_n*256;i++)
  80962d:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  809631:	48 8b 05 88 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21c88]        # 42b2c0 <running_req>
  809638:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80963b:	c1 e0 08             	shl    eax,0x8
  80963e:	39 45 f0             	cmp    DWORD PTR [rbp-0x10],eax
  809641:	7c cc                	jl     80960f <disk_int_handler_c+0x73>
        }
        running_req->result=DISK_CHK_OK;
  809643:	48 8b 05 76 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21c76]        # 42b2c0 <running_req>
  80964a:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  809651:	e9 d8 00 00 00       	jmp    80972e <disk_int_handler_c+0x192>
    }else if(running_req->func==DISKREQ_WRITE)
  809656:	48 8b 05 63 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21c63]        # 42b2c0 <running_req>
  80965d:	8b 00                	mov    eax,DWORD PTR [rax]
  80965f:	83 f8 01             	cmp    eax,0x1
  809662:	75 50                	jne    8096b4 <disk_int_handler_c+0x118>
    {
        for(int i=0;i<running_req->sec_n*256;i++)
  809664:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80966b:	eb 25                	jmp    809692 <disk_int_handler_c+0xf6>
            outw(port,*p++);
  80966d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809671:	48 8d 50 02          	lea    rdx,[rax+0x2]
  809675:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  809679:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80967c:	0f b7 d0             	movzx  edx,ax
  80967f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809682:	0f b7 c0             	movzx  eax,ax
  809685:	89 d6                	mov    esi,edx
  809687:	89 c7                	mov    edi,eax
  809689:	e8 8f d1 ff ff       	call   80681d <outw>
        for(int i=0;i<running_req->sec_n*256;i++)
  80968e:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  809692:	48 8b 05 27 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21c27]        # 42b2c0 <running_req>
  809699:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80969c:	c1 e0 08             	shl    eax,0x8
  80969f:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8096a2:	7c c9                	jl     80966d <disk_int_handler_c+0xd1>
        running_req->result=DISK_CHK_OK;
  8096a4:	48 8b 05 15 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21c15]        # 42b2c0 <running_req>
  8096ab:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  8096b2:	eb 7a                	jmp    80972e <disk_int_handler_c+0x192>
    }else if(running_req->func==DISKREQ_CHECK)
  8096b4:	48 8b 05 05 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21c05]        # 42b2c0 <running_req>
  8096bb:	8b 00                	mov    eax,DWORD PTR [rax]
  8096bd:	83 f8 02             	cmp    eax,0x2
  8096c0:	75 34                	jne    8096f6 <disk_int_handler_c+0x15a>
    {
        char stat=inb(port+7);
  8096c2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8096c5:	83 c0 07             	add    eax,0x7
  8096c8:	0f b6 c0             	movzx  eax,al
  8096cb:	89 c7                	mov    edi,eax
  8096cd:	e8 57 d1 ff ff       	call   806829 <inb>
  8096d2:	88 45 e7             	mov    BYTE PTR [rbp-0x19],al
        short dat=inw(port);
  8096d5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8096d8:	0f b7 c0             	movzx  eax,ax
  8096db:	89 c7                	mov    edi,eax
  8096dd:	e8 51 d1 ff ff       	call   806833 <inw>
  8096e2:	66 89 45 e4          	mov    WORD PTR [rbp-0x1c],ax
        if(1)
        {
            running_req->result=DISK_CHK_OK;
  8096e6:	48 8b 05 d3 1b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21bd3]        # 42b2c0 <running_req>
  8096ed:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  8096f4:	eb 38                	jmp    80972e <disk_int_handler_c+0x192>
            char err=inb(port+1);//错误原因
            printf("checking disk err:%x\nresetting hd\n",err);
            running_req->result=DISK_CHK_ERR;
            request(running_req->disk,DISKREQ_RESET,0,0,0);
        }
    }else if(running_req->func==DISKREQ_RESET)
  8096f6:	48 8b 05 c3 1b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21bc3]        # 42b2c0 <running_req>
  8096fd:	8b 00                	mov    eax,DWORD PTR [rax]
  8096ff:	83 f8 03             	cmp    eax,0x3
  809702:	75 2a                	jne    80972e <disk_int_handler_c+0x192>
    {
        int stat=inb(port+7);
  809704:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809707:	83 c0 07             	add    eax,0x7
  80970a:	0f b6 c0             	movzx  eax,al
  80970d:	89 c7                	mov    edi,eax
  80970f:	e8 15 d1 ff ff       	call   806829 <inb>
  809714:	0f b6 c0             	movzx  eax,al
  809717:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
        printf("reset disk done.\nstat now:%x\n",stat);
  80971a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80971d:	89 c6                	mov    esi,eax
  80971f:	bf 8a 5a 81 00       	mov    edi,0x815a8a
  809724:	b8 00 00 00 00       	mov    eax,0x0
  809729:	e8 3e 76 ff ff       	call   800d6c <printf>
    }
    running_req->stat=REQ_STAT_DONE;
  80972e:	48 8b 05 8b 1b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21b8b]        # 42b2c0 <running_req>
  809735:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  80973c:	48 8b 05 7d 1b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21b7d]        # 42b2c0 <running_req>
  809743:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  809747:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  80974e:	00 00 00 
    running_devman_req->stat=REQ_STAT_DONE;
  809751:	48 8b 05 70 1b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21b70]        # 42b2c8 <running_devman_req>
  809758:	c7 80 ac 00 00 00 03 	mov    DWORD PTR [rax+0xac],0x3
  80975f:	00 00 00 
    running_devman_req=NULL;
  809762:	48 c7 05 5b 1b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21b5b],0x0        # 42b2c8 <running_devman_req>
  809769:	00 00 00 00 
    //set_proc_stat(running_req->pid,TASK_READY);
    running_req=NULL;
  80976d:	48 c7 05 48 1b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21b48],0x0        # 42b2c0 <running_req>
  809774:	00 00 00 00 
    return 0;
  809778:	b8 00 00 00 00       	mov    eax,0x0
}
  80977d:	c9                   	leave  
  80977e:	c3                   	ret    

000000000080977f <check_dreq_stat>:
int check_dreq_stat(int req_id)
{
  80977f:	f3 0f 1e fa          	endbr64 
  809783:	55                   	push   rbp
  809784:	48 89 e5             	mov    rbp,rsp
  809787:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return disk_reqs[req_id].stat;
  80978a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80978d:	48 63 d0             	movsxd rdx,eax
  809790:	48 89 d0             	mov    rax,rdx
  809793:	48 01 c0             	add    rax,rax
  809796:	48 01 d0             	add    rax,rdx
  809799:	48 c1 e0 04          	shl    rax,0x4
  80979d:	48 05 dc 85 42 00    	add    rax,0x4285dc
  8097a3:	8b 00                	mov    eax,DWORD PTR [rax]
}
  8097a5:	5d                   	pop    rbp
  8097a6:	c3                   	ret    

00000000008097a7 <request>:
int request(int disk,int func,int lba,int secn,char *buf){
  8097a7:	f3 0f 1e fa          	endbr64 
  8097ab:	55                   	push   rbp
  8097ac:	48 89 e5             	mov    rbp,rsp
  8097af:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8097b2:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8097b5:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  8097b8:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  8097bb:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    if((tail+1)%MAX_DISK_REQUEST_COUNT==head)
  8097bf:	8b 05 2f 1b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21b2f]        # 42b2f4 <tail>
  8097c5:	83 c0 01             	add    eax,0x1
  8097c8:	48 63 d0             	movsxd rdx,eax
  8097cb:	48 69 d2 89 88 88 88 	imul   rdx,rdx,0xffffffff88888889
  8097d2:	48 c1 ea 20          	shr    rdx,0x20
  8097d6:	01 c2                	add    edx,eax
  8097d8:	c1 fa 07             	sar    edx,0x7
  8097db:	89 c1                	mov    ecx,eax
  8097dd:	c1 f9 1f             	sar    ecx,0x1f
  8097e0:	29 ca                	sub    edx,ecx
  8097e2:	69 ca f0 00 00 00    	imul   ecx,edx,0xf0
  8097e8:	29 c8                	sub    eax,ecx
  8097ea:	89 c2                	mov    edx,eax
  8097ec:	8b 05 fe 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21afe]        # 42b2f0 <head>
  8097f2:	39 c2                	cmp    edx,eax
  8097f4:	75 0a                	jne    809800 <request+0x59>
    {
        return -1;
  8097f6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8097fb:	e9 0d 01 00 00       	jmp    80990d <request+0x166>
    }
    disk_reqs[tail].disk=disk;
  809800:	8b 05 ee 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21aee]        # 42b2f4 <tail>
  809806:	48 63 d0             	movsxd rdx,eax
  809809:	48 89 d0             	mov    rax,rdx
  80980c:	48 01 c0             	add    rax,rax
  80980f:	48 01 d0             	add    rax,rdx
  809812:	48 c1 e0 04          	shl    rax,0x4
  809816:	48 8d 90 c4 85 42 00 	lea    rdx,[rax+0x4285c4]
  80981d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809820:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].func=func;
  809822:	8b 05 cc 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21acc]        # 42b2f4 <tail>
  809828:	48 63 d0             	movsxd rdx,eax
  80982b:	48 89 d0             	mov    rax,rdx
  80982e:	48 01 c0             	add    rax,rax
  809831:	48 01 d0             	add    rax,rdx
  809834:	48 c1 e0 04          	shl    rax,0x4
  809838:	48 8d 90 c0 85 42 00 	lea    rdx,[rax+0x4285c0]
  80983f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809842:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].lba=lba;
  809844:	8b 05 aa 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21aaa]        # 42b2f4 <tail>
  80984a:	48 63 d0             	movsxd rdx,eax
  80984d:	48 89 d0             	mov    rax,rdx
  809850:	48 01 c0             	add    rax,rax
  809853:	48 01 d0             	add    rax,rdx
  809856:	48 c1 e0 04          	shl    rax,0x4
  80985a:	48 8d 90 c8 85 42 00 	lea    rdx,[rax+0x4285c8]
  809861:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  809864:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].sec_n=secn;
  809866:	8b 05 88 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21a88]        # 42b2f4 <tail>
  80986c:	48 63 d0             	movsxd rdx,eax
  80986f:	48 89 d0             	mov    rax,rdx
  809872:	48 01 c0             	add    rax,rax
  809875:	48 01 d0             	add    rax,rdx
  809878:	48 c1 e0 04          	shl    rax,0x4
  80987c:	48 8d 90 cc 85 42 00 	lea    rdx,[rax+0x4285cc]
  809883:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809886:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].stat=REQ_STAT_READY;
  809888:	8b 05 66 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21a66]        # 42b2f4 <tail>
  80988e:	48 63 d0             	movsxd rdx,eax
  809891:	48 89 d0             	mov    rax,rdx
  809894:	48 01 c0             	add    rax,rax
  809897:	48 01 d0             	add    rax,rdx
  80989a:	48 c1 e0 04          	shl    rax,0x4
  80989e:	48 05 dc 85 42 00    	add    rax,0x4285dc
  8098a4:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    disk_reqs[tail].buf=buf;
  8098aa:	8b 05 44 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21a44]        # 42b2f4 <tail>
  8098b0:	48 63 d0             	movsxd rdx,eax
  8098b3:	48 89 d0             	mov    rax,rdx
  8098b6:	48 01 c0             	add    rax,rax
  8098b9:	48 01 d0             	add    rax,rdx
  8098bc:	48 c1 e0 04          	shl    rax,0x4
  8098c0:	48 8d 90 d0 85 42 00 	lea    rdx,[rax+0x4285d0]
  8098c7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8098cb:	48 89 02             	mov    QWORD PTR [rdx],rax
    int r=tail;
  8098ce:	8b 05 20 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21a20]        # 42b2f4 <tail>
  8098d4:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    tail=(tail+1)%MAX_DISK_REQUEST_COUNT;
  8098d7:	8b 05 17 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21a17]        # 42b2f4 <tail>
  8098dd:	8d 50 01             	lea    edx,[rax+0x1]
  8098e0:	48 63 c2             	movsxd rax,edx
  8098e3:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  8098ea:	48 c1 e8 20          	shr    rax,0x20
  8098ee:	01 d0                	add    eax,edx
  8098f0:	c1 f8 07             	sar    eax,0x7
  8098f3:	89 d1                	mov    ecx,edx
  8098f5:	c1 f9 1f             	sar    ecx,0x1f
  8098f8:	29 c8                	sub    eax,ecx
  8098fa:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  809900:	89 d0                	mov    eax,edx
  809902:	29 c8                	sub    eax,ecx
  809904:	89 05 ea 19 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc219ea],eax        # 42b2f4 <tail>
    return r;
  80990a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80990d:	5d                   	pop    rbp
  80990e:	c3                   	ret    

000000000080990f <execute_request>:
int execute_request(){
  80990f:	f3 0f 1e fa          	endbr64 
  809913:	55                   	push   rbp
  809914:	48 89 e5             	mov    rbp,rsp
  809917:	48 83 ec 10          	sub    rsp,0x10
    //查看是否有已经在运行的请求
    if(running_req!=NULL)
  80991b:	48 8b 05 9e 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2199e]        # 42b2c0 <running_req>
  809922:	48 85 c0             	test   rax,rax
  809925:	74 6a                	je     809991 <execute_request+0x82>
    {
        running_req->time++;
  809927:	48 8b 05 92 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21992]        # 42b2c0 <running_req>
  80992e:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  809931:	83 c2 01             	add    edx,0x1
  809934:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
        if(running_req->func!=DISKREQ_CHECK)
  809937:	48 8b 05 82 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21982]        # 42b2c0 <running_req>
  80993e:	8b 00                	mov    eax,DWORD PTR [rax]
  809940:	83 f8 02             	cmp    eax,0x2
  809943:	74 0a                	je     80994f <execute_request+0x40>
            return 2;
  809945:	b8 02 00 00 00       	mov    eax,0x2
  80994a:	e9 b4 01 00 00       	jmp    809b03 <execute_request+0x1f4>
        if(running_req->time>MAX_DISK_CHKTIME)
  80994f:	48 8b 05 6a 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2196a]        # 42b2c0 <running_req>
  809956:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  809959:	83 f8 0a             	cmp    eax,0xa
  80995c:	7e 29                	jle    809987 <execute_request+0x78>
        {
            //检测硬盘超时，视为没有硬盘连接
            running_req->result=DISK_CHK_ERR;
  80995e:	48 8b 05 5b 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2195b]        # 42b2c0 <running_req>
  809965:	c7 40 20 02 00 00 00 	mov    DWORD PTR [rax+0x20],0x2
            running_req->stat=REQ_STAT_DONE;
  80996c:	48 8b 05 4d 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2194d]        # 42b2c0 <running_req>
  809973:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
            running_req=NULL;
  80997a:	48 c7 05 3b 19 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2193b],0x0        # 42b2c0 <running_req>
  809981:	00 00 00 00 
  809985:	eb 0a                	jmp    809991 <execute_request+0x82>
        }else
        {
            //未到时间继续等待
            return 2;
  809987:	b8 02 00 00 00       	mov    eax,0x2
  80998c:	e9 72 01 00 00       	jmp    809b03 <execute_request+0x1f4>
        }
    }
    if(head==tail)return 1;//检查是否为空
  809991:	8b 15 59 19 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21959]        # 42b2f0 <head>
  809997:	8b 05 57 19 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21957]        # 42b2f4 <tail>
  80999d:	39 c2                	cmp    edx,eax
  80999f:	75 0a                	jne    8099ab <execute_request+0x9c>
  8099a1:	b8 01 00 00 00       	mov    eax,0x1
  8099a6:	e9 58 01 00 00       	jmp    809b03 <execute_request+0x1f4>
    running_req=&disk_reqs[head];
  8099ab:	8b 05 3f 19 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2193f]        # 42b2f0 <head>
  8099b1:	48 63 d0             	movsxd rdx,eax
  8099b4:	48 89 d0             	mov    rax,rdx
  8099b7:	48 01 c0             	add    rax,rax
  8099ba:	48 01 d0             	add    rax,rdx
  8099bd:	48 c1 e0 04          	shl    rax,0x4
  8099c1:	48 05 c0 85 42 00    	add    rax,0x4285c0
  8099c7:	48 89 05 f2 18 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc218f2],rax        # 42b2c0 <running_req>
    head=(head+1)%MAX_DISK_REQUEST_COUNT;
  8099ce:	8b 05 1c 19 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2191c]        # 42b2f0 <head>
  8099d4:	8d 50 01             	lea    edx,[rax+0x1]
  8099d7:	48 63 c2             	movsxd rax,edx
  8099da:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  8099e1:	48 c1 e8 20          	shr    rax,0x20
  8099e5:	01 d0                	add    eax,edx
  8099e7:	c1 f8 07             	sar    eax,0x7
  8099ea:	89 d1                	mov    ecx,edx
  8099ec:	c1 f9 1f             	sar    ecx,0x1f
  8099ef:	29 c8                	sub    eax,ecx
  8099f1:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  8099f7:	89 d0                	mov    eax,edx
  8099f9:	29 c8                	sub    eax,ecx
  8099fb:	89 05 ef 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc218ef],eax        # 42b2f0 <head>
    running_req->stat=REQ_STAT_WORKING;
  809a01:	48 8b 05 b8 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc218b8]        # 42b2c0 <running_req>
  809a08:	c7 40 1c 02 00 00 00 	mov    DWORD PTR [rax+0x1c],0x2
    //set_proc_stat(running_req->pid,TASK_SUSPENDED);
    int r=0;
  809a0f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    switch (running_req->func)
  809a16:	48 8b 05 a3 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc218a3]        # 42b2c0 <running_req>
  809a1d:	8b 00                	mov    eax,DWORD PTR [rax]
  809a1f:	83 f8 03             	cmp    eax,0x3
  809a22:	0f 84 ad 00 00 00    	je     809ad5 <execute_request+0x1c6>
  809a28:	83 f8 03             	cmp    eax,0x3
  809a2b:	0f 8f bf 00 00 00    	jg     809af0 <execute_request+0x1e1>
  809a31:	83 f8 02             	cmp    eax,0x2
  809a34:	0f 84 85 00 00 00    	je     809abf <execute_request+0x1b0>
  809a3a:	83 f8 02             	cmp    eax,0x2
  809a3d:	0f 8f ad 00 00 00    	jg     809af0 <execute_request+0x1e1>
  809a43:	85 c0                	test   eax,eax
  809a45:	74 0a                	je     809a51 <execute_request+0x142>
  809a47:	83 f8 01             	cmp    eax,0x1
  809a4a:	74 3c                	je     809a88 <execute_request+0x179>
        break;
    case DISKREQ_RESET:
        r=async_reset_disk(running_req->disk);
        break;
    default:
        break;
  809a4c:	e9 9f 00 00 00       	jmp    809af0 <execute_request+0x1e1>
        running_req->lba,running_req->sec_n,running_req->buf);
  809a51:	48 8b 05 68 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21868]        # 42b2c0 <running_req>
        r=async_read_disk(running_req->disk,\
  809a58:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
        running_req->lba,running_req->sec_n,running_req->buf);
  809a5c:	48 8b 05 5d 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2185d]        # 42b2c0 <running_req>
        r=async_read_disk(running_req->disk,\
  809a63:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
        running_req->lba,running_req->sec_n,running_req->buf);
  809a66:	48 8b 05 53 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21853]        # 42b2c0 <running_req>
  809a6d:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_read_disk(running_req->disk,\
  809a70:	89 c6                	mov    esi,eax
  809a72:	48 8b 05 47 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21847]        # 42b2c0 <running_req>
  809a79:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  809a7c:	89 c7                	mov    edi,eax
  809a7e:	e8 a7 00 00 00       	call   809b2a <async_read_disk>
  809a83:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  809a86:	eb 69                	jmp    809af1 <execute_request+0x1e2>
         running_req->lba,running_req->sec_n,running_req->buf);
  809a88:	48 8b 05 31 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21831]        # 42b2c0 <running_req>
        r=async_write_disk(running_req->disk,\
  809a8f:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
         running_req->lba,running_req->sec_n,running_req->buf);
  809a93:	48 8b 05 26 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21826]        # 42b2c0 <running_req>
        r=async_write_disk(running_req->disk,\
  809a9a:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
         running_req->lba,running_req->sec_n,running_req->buf);
  809a9d:	48 8b 05 1c 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2181c]        # 42b2c0 <running_req>
  809aa4:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_write_disk(running_req->disk,\
  809aa7:	89 c6                	mov    esi,eax
  809aa9:	48 8b 05 10 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21810]        # 42b2c0 <running_req>
  809ab0:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  809ab3:	89 c7                	mov    edi,eax
  809ab5:	e8 88 01 00 00       	call   809c42 <async_write_disk>
  809aba:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  809abd:	eb 32                	jmp    809af1 <execute_request+0x1e2>
        r=async_check_disk(running_req->disk);
  809abf:	48 8b 05 fa 17 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc217fa]        # 42b2c0 <running_req>
  809ac6:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  809ac9:	89 c7                	mov    edi,eax
  809acb:	e8 aa 06 00 00       	call   80a17a <async_check_disk>
  809ad0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  809ad3:	eb 1c                	jmp    809af1 <execute_request+0x1e2>
        r=async_reset_disk(running_req->disk);
  809ad5:	48 8b 05 e4 17 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc217e4]        # 42b2c0 <running_req>
  809adc:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  809adf:	89 c7                	mov    edi,eax
  809ae1:	b8 00 00 00 00       	mov    eax,0x0
  809ae6:	e8 1a 00 00 00       	call   809b05 <async_reset_disk>
  809aeb:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  809aee:	eb 01                	jmp    809af1 <execute_request+0x1e2>
        break;
  809af0:	90                   	nop
    }
    if(r==-1)return -1;
  809af1:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  809af5:	75 07                	jne    809afe <execute_request+0x1ef>
  809af7:	b8 ff ff ff ff       	mov    eax,0xffffffff
  809afc:	eb 05                	jmp    809b03 <execute_request+0x1f4>
    return 0;
  809afe:	b8 00 00 00 00       	mov    eax,0x0
}
  809b03:	c9                   	leave  
  809b04:	c3                   	ret    

0000000000809b05 <async_reset_disk>:
int async_reset_disk(int disk)
{
  809b05:	f3 0f 1e fa          	endbr64 
  809b09:	55                   	push   rbp
  809b0a:	48 89 e5             	mov    rbp,rsp
  809b0d:	48 83 ec 10          	sub    rsp,0x10
  809b11:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    outb(PORT_DISK_CONTROL,DISK_CMD_RESET);
  809b14:	be 0c 00 00 00       	mov    esi,0xc
  809b19:	bf f6 03 00 00       	mov    edi,0x3f6
  809b1e:	e8 ed cc ff ff       	call   806810 <outb>
    return 0;
  809b23:	b8 00 00 00 00       	mov    eax,0x0
}
  809b28:	c9                   	leave  
  809b29:	c3                   	ret    

0000000000809b2a <async_read_disk>:
int async_read_disk(int disk,unsigned int lba,int sec_n,char* mem_addr)
{
  809b2a:	f3 0f 1e fa          	endbr64 
  809b2e:	55                   	push   rbp
  809b2f:	48 89 e5             	mov    rbp,rsp
  809b32:	48 83 ec 30          	sub    rsp,0x30
  809b36:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  809b39:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  809b3c:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  809b3f:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  809b43:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  809b49:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  809b50:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  809b54:	74 06                	je     809b5c <async_read_disk+0x32>
  809b56:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  809b5a:	75 06                	jne    809b62 <async_read_disk+0x38>
        port=PORT_DISK_SLAVE;
  809b5c:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  809b62:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  809b66:	74 06                	je     809b6e <async_read_disk+0x44>
  809b68:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  809b6c:	75 07                	jne    809b75 <async_read_disk+0x4b>
        slave_disk=1;
  809b6e:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    outb(port+2,sec_n);
  809b75:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  809b78:	0f b6 d0             	movzx  edx,al
  809b7b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809b7f:	83 c0 02             	add    eax,0x2
  809b82:	0f b7 c0             	movzx  eax,ax
  809b85:	89 d6                	mov    esi,edx
  809b87:	89 c7                	mov    edi,eax
  809b89:	e8 82 cc ff ff       	call   806810 <outb>
    outb(port+3,lba&0xff);
  809b8e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809b91:	0f b6 d0             	movzx  edx,al
  809b94:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809b98:	83 c0 03             	add    eax,0x3
  809b9b:	0f b7 c0             	movzx  eax,ax
  809b9e:	89 d6                	mov    esi,edx
  809ba0:	89 c7                	mov    edi,eax
  809ba2:	e8 69 cc ff ff       	call   806810 <outb>
    outb(port+4,(lba>>8)&0xff);
  809ba7:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809baa:	c1 e8 08             	shr    eax,0x8
  809bad:	0f b6 d0             	movzx  edx,al
  809bb0:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809bb4:	83 c0 04             	add    eax,0x4
  809bb7:	0f b7 c0             	movzx  eax,ax
  809bba:	89 d6                	mov    esi,edx
  809bbc:	89 c7                	mov    edi,eax
  809bbe:	e8 4d cc ff ff       	call   806810 <outb>
    outb(port+5,(lba>>16)&0xff);
  809bc3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809bc6:	c1 e8 10             	shr    eax,0x10
  809bc9:	0f b6 d0             	movzx  edx,al
  809bcc:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809bd0:	83 c0 05             	add    eax,0x5
  809bd3:	0f b7 c0             	movzx  eax,ax
  809bd6:	89 d6                	mov    esi,edx
  809bd8:	89 c7                	mov    edi,eax
  809bda:	e8 31 cc ff ff       	call   806810 <outb>
    char drv=slave_disk?0x10:0;
  809bdf:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  809be3:	74 07                	je     809bec <async_read_disk+0xc2>
  809be5:	b8 10 00 00 00       	mov    eax,0x10
  809bea:	eb 05                	jmp    809bf1 <async_read_disk+0xc7>
  809bec:	b8 00 00 00 00       	mov    eax,0x0
  809bf1:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
    char lba_hi=(lba>>24)&0xf|drv|0xe0;
  809bf4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809bf7:	c1 e8 18             	shr    eax,0x18
  809bfa:	83 e0 0f             	and    eax,0xf
  809bfd:	89 c2                	mov    edx,eax
  809bff:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  809c03:	09 d0                	or     eax,edx
  809c05:	83 c8 e0             	or     eax,0xffffffe0
  809c08:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
    outb(port+6,lba_hi);
  809c0b:	0f b6 45 f6          	movzx  eax,BYTE PTR [rbp-0xa]
  809c0f:	0f b6 d0             	movzx  edx,al
  809c12:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809c16:	83 c0 06             	add    eax,0x6
  809c19:	0f b7 c0             	movzx  eax,ax
  809c1c:	89 d6                	mov    esi,edx
  809c1e:	89 c7                	mov    edi,eax
  809c20:	e8 eb cb ff ff       	call   806810 <outb>
    outb(port+7,DISK_CMD_READ);
  809c25:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809c29:	83 c0 07             	add    eax,0x7
  809c2c:	0f b7 c0             	movzx  eax,ax
  809c2f:	be 20 00 00 00       	mov    esi,0x20
  809c34:	89 c7                	mov    edi,eax
  809c36:	e8 d5 cb ff ff       	call   806810 <outb>
    // }
    // for(int i=0;i<running_req->sec_n*256;i++)
    // {
    //     *mem_addr++=inw(port);
    // }
    return 0;
  809c3b:	b8 00 00 00 00       	mov    eax,0x0
}
  809c40:	c9                   	leave  
  809c41:	c3                   	ret    

0000000000809c42 <async_write_disk>:
int async_write_disk(int disk,unsigned int lba, int sec_n, char* mem_ptr)
{
  809c42:	f3 0f 1e fa          	endbr64 
  809c46:	55                   	push   rbp
  809c47:	48 89 e5             	mov    rbp,rsp
  809c4a:	48 83 ec 30          	sub    rsp,0x30
  809c4e:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  809c51:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  809c54:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  809c57:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  809c5b:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  809c61:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  809c68:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  809c6c:	74 06                	je     809c74 <async_write_disk+0x32>
  809c6e:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  809c72:	75 06                	jne    809c7a <async_write_disk+0x38>
        port=PORT_DISK_SLAVE;
  809c74:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  809c7a:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  809c7e:	74 06                	je     809c86 <async_write_disk+0x44>
  809c80:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  809c84:	75 07                	jne    809c8d <async_write_disk+0x4b>
        slave_disk=1;
  809c86:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    while (1)
    {
        byte t=inb(0x1f7);
  809c8d:	bf f7 00 00 00       	mov    edi,0xf7
  809c92:	e8 92 cb ff ff       	call   806829 <inb>
  809c97:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
        //logf("istat:%x",t);
        byte err=t&1;
  809c9a:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  809c9e:	83 e0 01             	and    eax,0x1
  809ca1:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
        if(err!=0)
  809ca4:	80 7d f6 00          	cmp    BYTE PTR [rbp-0xa],0x0
  809ca8:	74 0a                	je     809cb4 <async_write_disk+0x72>
        {
            //printf("ERR iwriting disk\n");
            return -1;
  809caa:	b8 ff ff ff ff       	mov    eax,0xffffffff
  809caf:	e9 d5 00 00 00       	jmp    809d89 <async_write_disk+0x147>
        }
        t&=0x88;
  809cb4:	80 65 f7 88          	and    BYTE PTR [rbp-0x9],0x88
        if(t==0x8)break;
  809cb8:	80 7d f7 08          	cmp    BYTE PTR [rbp-0x9],0x8
  809cbc:	74 02                	je     809cc0 <async_write_disk+0x7e>
    {
  809cbe:	eb cd                	jmp    809c8d <async_write_disk+0x4b>
        if(t==0x8)break;
  809cc0:	90                   	nop
    }
    outb(port+2,sec_n);
  809cc1:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  809cc4:	0f b6 d0             	movzx  edx,al
  809cc7:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809ccb:	83 c0 02             	add    eax,0x2
  809cce:	0f b7 c0             	movzx  eax,ax
  809cd1:	89 d6                	mov    esi,edx
  809cd3:	89 c7                	mov    edi,eax
  809cd5:	e8 36 cb ff ff       	call   806810 <outb>
    outb(port+3,lba&0xff);
  809cda:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809cdd:	0f b6 d0             	movzx  edx,al
  809ce0:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809ce4:	83 c0 03             	add    eax,0x3
  809ce7:	0f b7 c0             	movzx  eax,ax
  809cea:	89 d6                	mov    esi,edx
  809cec:	89 c7                	mov    edi,eax
  809cee:	e8 1d cb ff ff       	call   806810 <outb>
    outb(port+4,(lba>>8)&0xff);
  809cf3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809cf6:	c1 e8 08             	shr    eax,0x8
  809cf9:	0f b6 d0             	movzx  edx,al
  809cfc:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809d00:	83 c0 04             	add    eax,0x4
  809d03:	0f b7 c0             	movzx  eax,ax
  809d06:	89 d6                	mov    esi,edx
  809d08:	89 c7                	mov    edi,eax
  809d0a:	e8 01 cb ff ff       	call   806810 <outb>
    outb(port+5,(lba>>16)&0xff);
  809d0f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809d12:	c1 e8 10             	shr    eax,0x10
  809d15:	0f b6 d0             	movzx  edx,al
  809d18:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809d1c:	83 c0 05             	add    eax,0x5
  809d1f:	0f b7 c0             	movzx  eax,ax
  809d22:	89 d6                	mov    esi,edx
  809d24:	89 c7                	mov    edi,eax
  809d26:	e8 e5 ca ff ff       	call   806810 <outb>
    char drv=slave_disk?0x10:0;
  809d2b:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  809d2f:	74 07                	je     809d38 <async_write_disk+0xf6>
  809d31:	b8 10 00 00 00       	mov    eax,0x10
  809d36:	eb 05                	jmp    809d3d <async_write_disk+0xfb>
  809d38:	b8 00 00 00 00       	mov    eax,0x0
  809d3d:	88 45 f5             	mov    BYTE PTR [rbp-0xb],al
    unsigned char lba_hi=(lba>>24)&0xf|drv|0xe0;
  809d40:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809d43:	c1 e8 18             	shr    eax,0x18
  809d46:	83 e0 0f             	and    eax,0xf
  809d49:	89 c2                	mov    edx,eax
  809d4b:	0f b6 45 f5          	movzx  eax,BYTE PTR [rbp-0xb]
  809d4f:	09 d0                	or     eax,edx
  809d51:	83 c8 e0             	or     eax,0xffffffe0
  809d54:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    outb(port+6,lba_hi);
  809d57:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  809d5b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809d5f:	83 c0 06             	add    eax,0x6
  809d62:	0f b7 c0             	movzx  eax,ax
  809d65:	89 d6                	mov    esi,edx
  809d67:	89 c7                	mov    edi,eax
  809d69:	e8 a2 ca ff ff       	call   806810 <outb>
    outb(port+7,DISK_CMD_WRITE);
  809d6e:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  809d72:	83 c0 07             	add    eax,0x7
  809d75:	0f b7 c0             	movzx  eax,ax
  809d78:	be 30 00 00 00       	mov    esi,0x30
  809d7d:	89 c7                	mov    edi,eax
  809d7f:	e8 8c ca ff ff       	call   806810 <outb>
    //     if(t==0x8)break;
    // }
    // short *p=mem_ptr;
    // for(int i=0;i<running_req->sec_n*256;i++)
    //         outw(port,*p++);
    return 0;
  809d84:	b8 00 00 00 00       	mov    eax,0x0
}
  809d89:	c9                   	leave  
  809d8a:	c3                   	ret    

0000000000809d8b <read_disk>:
int read_disk(driver_args* args)
{
  809d8b:	f3 0f 1e fa          	endbr64 
  809d8f:	55                   	push   rbp
  809d90:	48 89 e5             	mov    rbp,rsp
  809d93:	48 83 ec 20          	sub    rsp,0x20
  809d97:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=read_disk_asm(args->lba,args->sec_c,args->dist_addr);
  809d9b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809d9f:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  809da2:	48 98                	cdqe   
  809da4:	48 89 c2             	mov    rdx,rax
  809da7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809dab:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  809dae:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809db2:	8b 00                	mov    eax,DWORD PTR [rax]
  809db4:	89 ce                	mov    esi,ecx
  809db6:	89 c7                	mov    edi,eax
  809db8:	e8 af 05 00 00       	call   80a36c <read_disk_asm>
  809dbd:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  809dc0:	48 8b 05 f9 14 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc214f9]        # 42b2c0 <running_req>
  809dc7:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  809dce:	48 8b 05 eb 14 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc214eb]        # 42b2c0 <running_req>
  809dd5:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  809dd9:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  809de0:	00 00 00 
    //set_proc_stat(running_req->pid,TASK_READY);
    running_req=NULL;
  809de3:	48 c7 05 d2 14 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc214d2],0x0        # 42b2c0 <running_req>
  809dea:	00 00 00 00 
    return ret;
  809dee:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  809df1:	c9                   	leave  
  809df2:	c3                   	ret    

0000000000809df3 <write_disk>:
int write_disk(driver_args* args)
{
  809df3:	f3 0f 1e fa          	endbr64 
  809df7:	55                   	push   rbp
  809df8:	48 89 e5             	mov    rbp,rsp
  809dfb:	48 83 ec 20          	sub    rsp,0x20
  809dff:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=write_disk_asm(args->lba,args->sec_c,args->src_addr);
  809e03:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809e07:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809e0a:	48 98                	cdqe   
  809e0c:	48 89 c2             	mov    rdx,rax
  809e0f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809e13:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  809e16:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809e1a:	8b 00                	mov    eax,DWORD PTR [rax]
  809e1c:	89 ce                	mov    esi,ecx
  809e1e:	89 c7                	mov    edi,eax
  809e20:	e8 c7 05 00 00       	call   80a3ec <write_disk_asm>
  809e25:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  809e28:	48 8b 05 91 14 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21491]        # 42b2c0 <running_req>
  809e2f:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  809e36:	48 8b 05 83 14 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21483]        # 42b2c0 <running_req>
  809e3d:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  809e41:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  809e48:	00 00 00 
    //set_proc_stat(running_req->pid,TASK_READY);
    running_req=NULL;
  809e4b:	48 c7 05 6a 14 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2146a],0x0        # 42b2c0 <running_req>
  809e52:	00 00 00 00 
    return ret;
  809e56:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  809e59:	c9                   	leave  
  809e5a:	c3                   	ret    

0000000000809e5b <chk_result>:
int chk_result(int r)
{
  809e5b:	f3 0f 1e fa          	endbr64 
  809e5f:	55                   	push   rbp
  809e60:	48 89 e5             	mov    rbp,rsp
  809e63:	48 83 ec 10          	sub    rsp,0x10
  809e67:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(disk_reqs[r].stat!=REQ_STAT_DONE);
  809e6a:	90                   	nop
  809e6b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809e6e:	48 63 d0             	movsxd rdx,eax
  809e71:	48 89 d0             	mov    rax,rdx
  809e74:	48 01 c0             	add    rax,rax
  809e77:	48 01 d0             	add    rax,rdx
  809e7a:	48 c1 e0 04          	shl    rax,0x4
  809e7e:	48 05 dc 85 42 00    	add    rax,0x4285dc
  809e84:	8b 00                	mov    eax,DWORD PTR [rax]
  809e86:	83 f8 03             	cmp    eax,0x3
  809e89:	75 e0                	jne    809e6b <chk_result+0x10>
    if(disk_reqs[r].result==DISK_CHK_OK)
  809e8b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809e8e:	48 63 d0             	movsxd rdx,eax
  809e91:	48 89 d0             	mov    rax,rdx
  809e94:	48 01 c0             	add    rax,rax
  809e97:	48 01 d0             	add    rax,rdx
  809e9a:	48 c1 e0 04          	shl    rax,0x4
  809e9e:	48 05 e0 85 42 00    	add    rax,0x4285e0
  809ea4:	8b 00                	mov    eax,DWORD PTR [rax]
  809ea6:	83 f8 01             	cmp    eax,0x1
  809ea9:	75 07                	jne    809eb2 <chk_result+0x57>
        return 1;
  809eab:	b8 01 00 00 00       	mov    eax,0x1
  809eb0:	eb 14                	jmp    809ec6 <chk_result+0x6b>
    comprintf("disk err\n");
  809eb2:	bf a8 5a 81 00       	mov    edi,0x815aa8
  809eb7:	b8 00 00 00 00       	mov    eax,0x0
  809ebc:	e8 d6 2f 00 00       	call   80ce97 <comprintf>
    return 0;
  809ec1:	b8 00 00 00 00       	mov    eax,0x0
}
  809ec6:	c9                   	leave  
  809ec7:	c3                   	ret    

0000000000809ec8 <disk_existent>:
int disk_existent(int disk)
{
  809ec8:	f3 0f 1e fa          	endbr64 
  809ecc:	55                   	push   rbp
  809ecd:	48 89 e5             	mov    rbp,rsp
  809ed0:	48 83 ec 10          	sub    rsp,0x10
  809ed4:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    switch (disk)
  809ed7:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  809edb:	74 5f                	je     809f3c <disk_existent+0x74>
  809edd:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  809ee1:	7f 6e                	jg     809f51 <disk_existent+0x89>
  809ee3:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  809ee7:	74 3e                	je     809f27 <disk_existent+0x5f>
  809ee9:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  809eed:	7f 62                	jg     809f51 <disk_existent+0x89>
  809eef:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  809ef3:	74 08                	je     809efd <disk_existent+0x35>
  809ef5:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
  809ef9:	74 17                	je     809f12 <disk_existent+0x4a>
        
    case DISK_SLAVE_SLAVE:
        return sys_find_dev("hd3")!=-1;
        break;
    default:
        break;
  809efb:	eb 54                	jmp    809f51 <disk_existent+0x89>
        return sys_find_dev("hd0")!=-1;
  809efd:	bf b2 5a 81 00       	mov    edi,0x815ab2
  809f02:	e8 78 95 ff ff       	call   80347f <sys_find_dev>
  809f07:	83 f8 ff             	cmp    eax,0xffffffff
  809f0a:	0f 95 c0             	setne  al
  809f0d:	0f b6 c0             	movzx  eax,al
  809f10:	eb 45                	jmp    809f57 <disk_existent+0x8f>
        return sys_find_dev("hd1")!=-1;
  809f12:	bf b6 5a 81 00       	mov    edi,0x815ab6
  809f17:	e8 63 95 ff ff       	call   80347f <sys_find_dev>
  809f1c:	83 f8 ff             	cmp    eax,0xffffffff
  809f1f:	0f 95 c0             	setne  al
  809f22:	0f b6 c0             	movzx  eax,al
  809f25:	eb 30                	jmp    809f57 <disk_existent+0x8f>
        return sys_find_dev("hd2")!=-1;
  809f27:	bf ba 5a 81 00       	mov    edi,0x815aba
  809f2c:	e8 4e 95 ff ff       	call   80347f <sys_find_dev>
  809f31:	83 f8 ff             	cmp    eax,0xffffffff
  809f34:	0f 95 c0             	setne  al
  809f37:	0f b6 c0             	movzx  eax,al
  809f3a:	eb 1b                	jmp    809f57 <disk_existent+0x8f>
        return sys_find_dev("hd3")!=-1;
  809f3c:	bf be 5a 81 00       	mov    edi,0x815abe
  809f41:	e8 39 95 ff ff       	call   80347f <sys_find_dev>
  809f46:	83 f8 ff             	cmp    eax,0xffffffff
  809f49:	0f 95 c0             	setne  al
  809f4c:	0f b6 c0             	movzx  eax,al
  809f4f:	eb 06                	jmp    809f57 <disk_existent+0x8f>
        break;
  809f51:	90                   	nop
    }
    return 0;
  809f52:	b8 00 00 00 00       	mov    eax,0x0
}
  809f57:	c9                   	leave  
  809f58:	c3                   	ret    

0000000000809f59 <hd_iterate>:
int hd_iterate()
{
  809f59:	f3 0f 1e fa          	endbr64 
  809f5d:	55                   	push   rbp
  809f5e:	48 89 e5             	mov    rbp,rsp
  809f61:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
    char *name;
    
    int r[4];
    r[0]=request(DISK_MAJOR_MAJOR,DISKREQ_CHECK,0,1,0);
  809f68:	41 b8 00 00 00 00    	mov    r8d,0x0
  809f6e:	b9 01 00 00 00       	mov    ecx,0x1
  809f73:	ba 00 00 00 00       	mov    edx,0x0
  809f78:	be 02 00 00 00       	mov    esi,0x2
  809f7d:	bf 00 00 00 00       	mov    edi,0x0
  809f82:	e8 20 f8 ff ff       	call   8097a7 <request>
  809f87:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    r[1]=request(DISK_MAJOR_SLAVE,DISKREQ_CHECK,0,1,0);
  809f8a:	41 b8 00 00 00 00    	mov    r8d,0x0
  809f90:	b9 01 00 00 00       	mov    ecx,0x1
  809f95:	ba 00 00 00 00       	mov    edx,0x0
  809f9a:	be 02 00 00 00       	mov    esi,0x2
  809f9f:	bf 01 00 00 00       	mov    edi,0x1
  809fa4:	e8 fe f7 ff ff       	call   8097a7 <request>
  809fa9:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    r[2]=request(DISK_SLAVE_MAJOR,DISKREQ_CHECK,0,1,0);
  809fac:	41 b8 00 00 00 00    	mov    r8d,0x0
  809fb2:	b9 01 00 00 00       	mov    ecx,0x1
  809fb7:	ba 00 00 00 00       	mov    edx,0x0
  809fbc:	be 02 00 00 00       	mov    esi,0x2
  809fc1:	bf 02 00 00 00       	mov    edi,0x2
  809fc6:	e8 dc f7 ff ff       	call   8097a7 <request>
  809fcb:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    r[3]=request(DISK_SLAVE_SLAVE,DISKREQ_CHECK,0,1,0);
  809fce:	41 b8 00 00 00 00    	mov    r8d,0x0
  809fd4:	b9 01 00 00 00       	mov    ecx,0x1
  809fd9:	ba 00 00 00 00       	mov    edx,0x0
  809fde:	be 02 00 00 00       	mov    esi,0x2
  809fe3:	bf 03 00 00 00       	mov    edi,0x3
  809fe8:	e8 ba f7 ff ff       	call   8097a7 <request>
  809fed:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    for(int i=0;i<1;i++)
  809ff0:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  809ff7:	e9 72 01 00 00       	jmp    80a16e <hd_iterate+0x215>
    {
        int disk;
        switch (i)
  809ffc:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  80a000:	74 3b                	je     80a03d <hd_iterate+0xe4>
  80a002:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  80a006:	7f 3e                	jg     80a046 <hd_iterate+0xed>
  80a008:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  80a00c:	74 26                	je     80a034 <hd_iterate+0xdb>
  80a00e:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  80a012:	7f 32                	jg     80a046 <hd_iterate+0xed>
  80a014:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80a018:	74 08                	je     80a022 <hd_iterate+0xc9>
  80a01a:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  80a01e:	74 0b                	je     80a02b <hd_iterate+0xd2>
  80a020:	eb 24                	jmp    80a046 <hd_iterate+0xed>
        {
        case 0:disk=DISK_MAJOR_MAJOR;break;
  80a022:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80a029:	eb 25                	jmp    80a050 <hd_iterate+0xf7>
        case 1:disk=DISK_MAJOR_SLAVE;break;
  80a02b:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [rbp-0x10],0x1
  80a032:	eb 1c                	jmp    80a050 <hd_iterate+0xf7>
        case 2:disk=DISK_SLAVE_MAJOR;break;
  80a034:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [rbp-0x10],0x2
  80a03b:	eb 13                	jmp    80a050 <hd_iterate+0xf7>
        case 3:disk=DISK_SLAVE_SLAVE;break;
  80a03d:	c7 45 f0 03 00 00 00 	mov    DWORD PTR [rbp-0x10],0x3
  80a044:	eb 0a                	jmp    80a050 <hd_iterate+0xf7>
        default:
            return -1;
  80a046:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80a04b:	e9 28 01 00 00       	jmp    80a178 <hd_iterate+0x21f>
            break;
        }
        if(chk_result(r[i]))//&&!disk_existent(disk)
  80a050:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a053:	48 98                	cdqe   
  80a055:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  80a059:	89 c7                	mov    edi,eax
  80a05b:	e8 fb fd ff ff       	call   809e5b <chk_result>
  80a060:	85 c0                	test   eax,eax
  80a062:	0f 84 81 00 00 00    	je     80a0e9 <hd_iterate+0x190>
        {
            printf("disk %d checked.\n",i);
  80a068:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a06b:	89 c6                	mov    esi,eax
  80a06d:	bf c2 5a 81 00       	mov    edi,0x815ac2
  80a072:	b8 00 00 00 00       	mov    eax,0x0
  80a077:	e8 f0 6c ff ff       	call   800d6c <printf>
            //新硬盘
            device hd={
  80a07c:	48 8d 95 20 ff ff ff 	lea    rdx,[rbp-0xe0]
  80a083:	b8 00 00 00 00       	mov    eax,0x0
  80a088:	b9 15 00 00 00       	mov    ecx,0x15
  80a08d:	48 89 d7             	mov    rdi,rdx
  80a090:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  80a093:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a096:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  80a09c:	c7 85 28 ff ff ff 01 	mov    DWORD PTR [rbp-0xd8],0x1
  80a0a3:	00 00 00 
  80a0a6:	c7 85 2c ff ff ff 01 	mov    DWORD PTR [rbp-0xd4],0x1
  80a0ad:	00 00 00 
                .type=DEV_TYPE_BLKDEV,
                .stype=DEV_STYPE_HD,
                .slave_dev=disk,
                .start_port=i<2?PORT_DISK_MAJOR:PORT_DISK_SLAVE
  80a0b0:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  80a0b4:	7f 07                	jg     80a0bd <hd_iterate+0x164>
  80a0b6:	b8 f0 01 00 00       	mov    eax,0x1f0
  80a0bb:	eb 05                	jmp    80a0c2 <hd_iterate+0x169>
  80a0bd:	b8 70 01 00 00       	mov    eax,0x170
            device hd={
  80a0c2:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            };
            disks[i]=reg_device(&hd);
  80a0c8:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  80a0cf:	48 89 c7             	mov    rdi,rax
  80a0d2:	e8 70 8f ff ff       	call   803047 <reg_device>
  80a0d7:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80a0da:	48 63 d2             	movsxd rdx,edx
  80a0dd:	89 04 95 e0 b2 42 00 	mov    DWORD PTR [rdx*4+0x42b2e0],eax
  80a0e4:	e9 81 00 00 00       	jmp    80a16a <hd_iterate+0x211>
        }else if(!chk_result(r[i]))//&&disk_existent(disk)
  80a0e9:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a0ec:	48 98                	cdqe   
  80a0ee:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  80a0f2:	89 c7                	mov    edi,eax
  80a0f4:	e8 62 fd ff ff       	call   809e5b <chk_result>
  80a0f9:	85 c0                	test   eax,eax
  80a0fb:	75 6d                	jne    80a16a <hd_iterate+0x211>
        {
            switch (i)
  80a0fd:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  80a101:	74 3e                	je     80a141 <hd_iterate+0x1e8>
  80a103:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  80a107:	7f 41                	jg     80a14a <hd_iterate+0x1f1>
  80a109:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  80a10d:	74 28                	je     80a137 <hd_iterate+0x1de>
  80a10f:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  80a113:	7f 35                	jg     80a14a <hd_iterate+0x1f1>
  80a115:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80a119:	74 08                	je     80a123 <hd_iterate+0x1ca>
  80a11b:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  80a11f:	74 0c                	je     80a12d <hd_iterate+0x1d4>
  80a121:	eb 27                	jmp    80a14a <hd_iterate+0x1f1>
            {
            case 0:name="hd0";break;
  80a123:	48 c7 45 f8 b2 5a 81 	mov    QWORD PTR [rbp-0x8],0x815ab2
  80a12a:	00 
  80a12b:	eb 1d                	jmp    80a14a <hd_iterate+0x1f1>
            case 1:name="hd1";break;
  80a12d:	48 c7 45 f8 b6 5a 81 	mov    QWORD PTR [rbp-0x8],0x815ab6
  80a134:	00 
  80a135:	eb 13                	jmp    80a14a <hd_iterate+0x1f1>
            case 2:name="hd2";break;
  80a137:	48 c7 45 f8 ba 5a 81 	mov    QWORD PTR [rbp-0x8],0x815aba
  80a13e:	00 
  80a13f:	eb 09                	jmp    80a14a <hd_iterate+0x1f1>
            case 3:name="hd3";break;
  80a141:	48 c7 45 f8 be 5a 81 	mov    QWORD PTR [rbp-0x8],0x815abe
  80a148:	00 
  80a149:	90                   	nop
            }
            //有硬盘被卸载了
            int devi=sys_find_dev(name);
  80a14a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a14e:	48 89 c7             	mov    rdi,rax
  80a151:	e8 29 93 ff ff       	call   80347f <sys_find_dev>
  80a156:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            dispose_device(get_dev(devi));
  80a159:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80a15c:	89 c7                	mov    edi,eax
  80a15e:	e8 f0 99 ff ff       	call   803b53 <get_dev>
  80a163:	89 c7                	mov    edi,eax
  80a165:	e8 3c 99 ff ff       	call   803aa6 <dispose_device>
    for(int i=0;i<1;i++)
  80a16a:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80a16e:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80a172:	0f 8e 84 fe ff ff    	jle    809ffc <hd_iterate+0xa3>
        }

    }
}
  80a178:	c9                   	leave  
  80a179:	c3                   	ret    

000000000080a17a <async_check_disk>:

int async_check_disk(int disk)
{
  80a17a:	f3 0f 1e fa          	endbr64 
  80a17e:	55                   	push   rbp
  80a17f:	48 89 e5             	mov    rbp,rsp
  80a182:	48 83 ec 20          	sub    rsp,0x20
  80a186:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    unsigned short disknr=PORT_DISK_MAJOR;
  80a189:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    unsigned short chkcmd=0xe0;
  80a18f:	66 c7 45 fc e0 00    	mov    WORD PTR [rbp-0x4],0xe0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  80a195:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  80a199:	74 06                	je     80a1a1 <async_check_disk+0x27>
  80a19b:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  80a19f:	75 06                	jne    80a1a7 <async_check_disk+0x2d>
        disknr=PORT_DISK_SLAVE;
  80a1a1:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_MAJOR_SLAVE||disk==DISK_SLAVE_SLAVE)
  80a1a7:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  80a1ab:	74 06                	je     80a1b3 <async_check_disk+0x39>
  80a1ad:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  80a1b1:	75 06                	jne    80a1b9 <async_check_disk+0x3f>
        chkcmd=0xf0;
  80a1b3:	66 c7 45 fc f0 00    	mov    WORD PTR [rbp-0x4],0xf0
    outb(disknr+2,1);
  80a1b9:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80a1bd:	83 c0 02             	add    eax,0x2
  80a1c0:	0f b7 c0             	movzx  eax,ax
  80a1c3:	be 01 00 00 00       	mov    esi,0x1
  80a1c8:	89 c7                	mov    edi,eax
  80a1ca:	e8 41 c6 ff ff       	call   806810 <outb>
    outb(disknr+3,0);
  80a1cf:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80a1d3:	83 c0 03             	add    eax,0x3
  80a1d6:	0f b7 c0             	movzx  eax,ax
  80a1d9:	be 00 00 00 00       	mov    esi,0x0
  80a1de:	89 c7                	mov    edi,eax
  80a1e0:	e8 2b c6 ff ff       	call   806810 <outb>
    outb(disknr+4,0);
  80a1e5:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80a1e9:	83 c0 04             	add    eax,0x4
  80a1ec:	0f b7 c0             	movzx  eax,ax
  80a1ef:	be 00 00 00 00       	mov    esi,0x0
  80a1f4:	89 c7                	mov    edi,eax
  80a1f6:	e8 15 c6 ff ff       	call   806810 <outb>
    outb(disknr+5,0);
  80a1fb:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80a1ff:	83 c0 05             	add    eax,0x5
  80a202:	0f b7 c0             	movzx  eax,ax
  80a205:	be 00 00 00 00       	mov    esi,0x0
  80a20a:	89 c7                	mov    edi,eax
  80a20c:	e8 ff c5 ff ff       	call   806810 <outb>
    outb(disknr+6,chkcmd);//主硬盘
  80a211:	0f b7 45 fc          	movzx  eax,WORD PTR [rbp-0x4]
  80a215:	0f b6 d0             	movzx  edx,al
  80a218:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80a21c:	83 c0 06             	add    eax,0x6
  80a21f:	0f b7 c0             	movzx  eax,ax
  80a222:	89 d6                	mov    esi,edx
  80a224:	89 c7                	mov    edi,eax
  80a226:	e8 e5 c5 ff ff       	call   806810 <outb>
    outb(disknr+7,DISK_CMD_CHECK);
  80a22b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80a22f:	83 c0 07             	add    eax,0x7
  80a232:	0f b7 c0             	movzx  eax,ax
  80a235:	be 90 00 00 00       	mov    esi,0x90
  80a23a:	89 c7                	mov    edi,eax
  80a23c:	e8 cf c5 ff ff       	call   806810 <outb>
    //     // {
    //     //     printf("DISK ERR\n");
    //     //     return -1;
    //     // }
    // }
    return 0;
  80a241:	b8 00 00 00 00       	mov    eax,0x0
}
  80a246:	c9                   	leave  
  80a247:	c3                   	ret    

000000000080a248 <hd_do_req>:

//接口函数：负责接收VFS的请求然后执行
int hd_do_req(driver_args *args)
{
  80a248:	f3 0f 1e fa          	endbr64 
  80a24c:	55                   	push   rbp
  80a24d:	48 89 e5             	mov    rbp,rsp
  80a250:	48 83 ec 18          	sub    rsp,0x18
  80a254:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int diski=0;
  80a258:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;disks[diski]!=args->dev;diski++);
  80a25f:	eb 04                	jmp    80a265 <hd_do_req+0x1d>
  80a261:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a265:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a268:	48 98                	cdqe   
  80a26a:	8b 14 85 e0 b2 42 00 	mov    edx,DWORD PTR [rax*4+0x42b2e0]
  80a271:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a275:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  80a27b:	39 c2                	cmp    edx,eax
  80a27d:	75 e2                	jne    80a261 <hd_do_req+0x19>
    switch (args->cmd)
  80a27f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a283:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  80a289:	83 f8 04             	cmp    eax,0x4
  80a28c:	74 72                	je     80a300 <hd_do_req+0xb8>
  80a28e:	83 f8 04             	cmp    eax,0x4
  80a291:	0f 8f 96 00 00 00    	jg     80a32d <hd_do_req+0xe5>
  80a297:	83 f8 02             	cmp    eax,0x2
  80a29a:	74 0a                	je     80a2a6 <hd_do_req+0x5e>
  80a29c:	83 f8 03             	cmp    eax,0x3
  80a29f:	74 32                	je     80a2d3 <hd_do_req+0x8b>
  80a2a1:	e9 87 00 00 00       	jmp    80a32d <hd_do_req+0xe5>
    {
    case DRVF_READ:
        request(diski,DISKREQ_READ,args->lba,args->sec_c,args->dist_addr);
  80a2a6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a2aa:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80a2ad:	48 98                	cdqe   
  80a2af:	48 89 c6             	mov    rsi,rax
  80a2b2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a2b6:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  80a2b9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a2bd:	8b 10                	mov    edx,DWORD PTR [rax]
  80a2bf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a2c2:	49 89 f0             	mov    r8,rsi
  80a2c5:	be 00 00 00 00       	mov    esi,0x0
  80a2ca:	89 c7                	mov    edi,eax
  80a2cc:	e8 d6 f4 ff ff       	call   8097a7 <request>
        break;
  80a2d1:	eb 61                	jmp    80a334 <hd_do_req+0xec>
    case DRVF_WRITE:
        request(diski,DISKREQ_WRITE,args->lba,args->sec_c,args->src_addr);
  80a2d3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a2d7:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a2da:	48 98                	cdqe   
  80a2dc:	48 89 c6             	mov    rsi,rax
  80a2df:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a2e3:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  80a2e6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a2ea:	8b 10                	mov    edx,DWORD PTR [rax]
  80a2ec:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a2ef:	49 89 f0             	mov    r8,rsi
  80a2f2:	be 01 00 00 00       	mov    esi,0x1
  80a2f7:	89 c7                	mov    edi,eax
  80a2f9:	e8 a9 f4 ff ff       	call   8097a7 <request>
        break;
  80a2fe:	eb 34                	jmp    80a334 <hd_do_req+0xec>
    case DRVF_CHK:
        request(diski,DISKREQ_CHECK,args->lba,args->sec_c,args->dist_addr);
  80a300:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a304:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80a307:	48 98                	cdqe   
  80a309:	48 89 c6             	mov    rsi,rax
  80a30c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a310:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  80a313:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a317:	8b 10                	mov    edx,DWORD PTR [rax]
  80a319:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a31c:	49 89 f0             	mov    r8,rsi
  80a31f:	be 02 00 00 00       	mov    esi,0x2
  80a324:	89 c7                	mov    edi,eax
  80a326:	e8 7c f4 ff ff       	call   8097a7 <request>
        break;
  80a32b:	eb 07                	jmp    80a334 <hd_do_req+0xec>
    default:return -1;
  80a32d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80a332:	eb 1e                	jmp    80a352 <hd_do_req+0x10a>
    }
    args->stat=REQ_STAT_WORKING;
  80a334:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a338:	c7 80 ac 00 00 00 02 	mov    DWORD PTR [rax+0xac],0x2
  80a33f:	00 00 00 
    running_devman_req=args;
  80a342:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a346:	48 89 05 7b 0f c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20f7b],rax        # 42b2c8 <running_devman_req>
    return 0;
  80a34d:	b8 00 00 00 00       	mov    eax,0x0
  80a352:	c9                   	leave  
  80a353:	c3                   	ret    
  80a354:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  80a35b:	00 00 00 
  80a35e:	66 90                	xchg   ax,ax

000000000080a360 <disk_int_handler>:
  80a360:	e8 d9 c4 ff ff       	call   80683e <eoi>
  80a365:	e8 32 f2 ff ff       	call   80959c <disk_int_handler_c>
  80a36a:	48 cf                	iretq  

000000000080a36c <read_disk_asm>:
  80a36c:	55                   	push   rbp
  80a36d:	89 e5                	mov    ebp,esp
  80a36f:	66 ba f7 01          	mov    dx,0x1f7
  80a373:	31 c9                	xor    ecx,ecx
  80a375:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  80a37a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  80a37f:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  80a384:	89 c6                	mov    esi,eax
  80a386:	66 ba f2 01          	mov    dx,0x1f2
  80a38a:	88 c8                	mov    al,cl
  80a38c:	ee                   	out    dx,al
  80a38d:	66 ba f3 01          	mov    dx,0x1f3
  80a391:	89 f0                	mov    eax,esi
  80a393:	ee                   	out    dx,al
  80a394:	66 ff c2             	inc    dx
  80a397:	c1 e8 08             	shr    eax,0x8
  80a39a:	ee                   	out    dx,al
  80a39b:	66 ff c2             	inc    dx
  80a39e:	c1 e8 08             	shr    eax,0x8
  80a3a1:	ee                   	out    dx,al
  80a3a2:	66 ff c2             	inc    dx
  80a3a5:	66 c1 e8 08          	shr    ax,0x8
  80a3a9:	24 0f                	and    al,0xf
  80a3ab:	0c e0                	or     al,0xe0
  80a3ad:	ee                   	out    dx,al
  80a3ae:	66 ff c2             	inc    dx
  80a3b1:	b0 20                	mov    al,0x20
  80a3b3:	ee                   	out    dx,al

000000000080a3b4 <read_disk_asm.wait>:
  80a3b4:	90                   	nop
  80a3b5:	ec                   	in     al,dx
  80a3b6:	24 88                	and    al,0x88
  80a3b8:	3c 08                	cmp    al,0x8
  80a3ba:	75 f8                	jne    80a3b4 <read_disk_asm.wait>
  80a3bc:	66 89 d7             	mov    di,dx
  80a3bf:	89 c8                	mov    eax,ecx
  80a3c1:	66 b9 00 01          	mov    cx,0x100
  80a3c5:	66 f7 e1             	mul    cx
  80a3c8:	89 c1                	mov    ecx,eax
  80a3ca:	66 ba f0 01          	mov    dx,0x1f0

000000000080a3ce <read_disk_asm.read>:
  80a3ce:	66 ed                	in     ax,dx
  80a3d0:	66 67 89 03          	mov    WORD PTR [ebx],ax
  80a3d4:	83 c3 02             	add    ebx,0x2
  80a3d7:	e2 f5                	loop   80a3ce <read_disk_asm.read>
  80a3d9:	c9                   	leave  
  80a3da:	b8 00 00 00 00       	mov    eax,0x0
  80a3df:	c3                   	ret    

000000000080a3e0 <read_disk_asm.err_disk_reading>:
  80a3e0:	66 ba f1 01          	mov    dx,0x1f1
  80a3e4:	31 c0                	xor    eax,eax
  80a3e6:	66 ed                	in     ax,dx
  80a3e8:	89 ec                	mov    esp,ebp
  80a3ea:	5d                   	pop    rbp
  80a3eb:	c3                   	ret    

000000000080a3ec <write_disk_asm>:
  80a3ec:	55                   	push   rbp
  80a3ed:	89 e5                	mov    ebp,esp
  80a3ef:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  80a3f4:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  80a3f9:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  80a3fe:	50                   	push   rax
  80a3ff:	66 ba f2 01          	mov    dx,0x1f2
  80a403:	88 c8                	mov    al,cl
  80a405:	ee                   	out    dx,al
  80a406:	58                   	pop    rax
  80a407:	66 ba f3 01          	mov    dx,0x1f3
  80a40b:	ee                   	out    dx,al
  80a40c:	c1 e8 08             	shr    eax,0x8
  80a40f:	66 ba f4 01          	mov    dx,0x1f4
  80a413:	ee                   	out    dx,al
  80a414:	c1 e8 08             	shr    eax,0x8
  80a417:	66 ba f5 01          	mov    dx,0x1f5
  80a41b:	ee                   	out    dx,al
  80a41c:	c1 e8 08             	shr    eax,0x8
  80a41f:	24 0f                	and    al,0xf
  80a421:	0c e0                	or     al,0xe0
  80a423:	66 ba f6 01          	mov    dx,0x1f6
  80a427:	ee                   	out    dx,al
  80a428:	66 ba f7 01          	mov    dx,0x1f7
  80a42c:	b0 30                	mov    al,0x30
  80a42e:	ee                   	out    dx,al

000000000080a42f <write_disk_asm.not_ready2>:
  80a42f:	90                   	nop
  80a430:	ec                   	in     al,dx
  80a431:	24 88                	and    al,0x88
  80a433:	3c 08                	cmp    al,0x8
  80a435:	75 f8                	jne    80a42f <write_disk_asm.not_ready2>
  80a437:	89 c8                	mov    eax,ecx
  80a439:	66 b9 00 01          	mov    cx,0x100
  80a43d:	66 f7 e1             	mul    cx
  80a440:	89 c1                	mov    ecx,eax
  80a442:	66 ba f0 01          	mov    dx,0x1f0

000000000080a446 <write_disk_asm.go_on_write>:
  80a446:	66 67 8b 03          	mov    ax,WORD PTR [ebx]
  80a44a:	66 ef                	out    dx,ax
  80a44c:	83 c3 02             	add    ebx,0x2
  80a44f:	e2 f5                	loop   80a446 <write_disk_asm.go_on_write>
  80a451:	89 ec                	mov    esp,ebp
  80a453:	5d                   	pop    rbp
  80a454:	c3                   	ret    

000000000080a455 <DISK1_FAT32_read_FAT_Entry>:
#include "memory.h"
#include "proc.h"
#include "devman.h"

unsigned int DISK1_FAT32_read_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry)
{
  80a455:	f3 0f 1e fa          	endbr64 
  80a459:	55                   	push   rbp
  80a45a:	48 89 e5             	mov    rbp,rsp
  80a45d:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  80a464:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  80a46b:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
	unsigned int buf[128];
	memset(buf,0,512);
  80a471:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80a478:	ba 00 02 00 00       	mov    edx,0x200
  80a47d:	be 00 00 00 00       	mov    esi,0x0
  80a482:	48 89 c7             	mov    rdi,rax
  80a485:	e8 2f 2b 00 00       	call   80cfb9 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  80a48a:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  80a491:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a495:	89 c2                	mov    edx,eax
  80a497:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80a49d:	c1 e8 07             	shr    eax,0x7
  80a4a0:	01 d0                	add    eax,edx
  80a4a2:	89 c2                	mov    edx,eax
  80a4a4:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80a4ab:	49 89 c0             	mov    r8,rax
  80a4ae:	b9 01 00 00 00       	mov    ecx,0x1
  80a4b3:	be 00 00 00 00       	mov    esi,0x0
  80a4b8:	bf 00 00 00 00       	mov    edi,0x0
  80a4bd:	e8 e5 f2 ff ff       	call   8097a7 <request>
  80a4c2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    chk_result(r);
  80a4c5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a4c8:	89 c7                	mov    edi,eax
  80a4ca:	e8 8c f9 ff ff       	call   809e5b <chk_result>
    printf("DISK1_FAT32_read_FAT_Entry fat_entry:%x,%#010x\n",fat_entry,buf[fat_entry & 0x7f]);
  80a4cf:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80a4d5:	83 e0 7f             	and    eax,0x7f
  80a4d8:	89 c0                	mov    eax,eax
  80a4da:	8b 94 85 f0 fd ff ff 	mov    edx,DWORD PTR [rbp+rax*4-0x210]
  80a4e1:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80a4e7:	89 c6                	mov    esi,eax
  80a4e9:	bf d8 5a 81 00       	mov    edi,0x815ad8
  80a4ee:	b8 00 00 00 00       	mov    eax,0x0
  80a4f3:	e8 74 68 ff ff       	call   800d6c <printf>
	return buf[fat_entry & 0x7f] & 0x0fffffff;
  80a4f8:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80a4fe:	83 e0 7f             	and    eax,0x7f
  80a501:	89 c0                	mov    eax,eax
  80a503:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  80a50a:	25 ff ff ff 0f       	and    eax,0xfffffff
}
  80a50f:	c9                   	leave  
  80a510:	c3                   	ret    

000000000080a511 <DISK1_FAT32_write_FAT_Entry>:


unsigned long DISK1_FAT32_write_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry,unsigned int value)
{
  80a511:	f3 0f 1e fa          	endbr64 
  80a515:	55                   	push   rbp
  80a516:	48 89 e5             	mov    rbp,rsp
  80a519:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  80a520:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  80a527:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
  80a52d:	89 95 e0 fd ff ff    	mov    DWORD PTR [rbp-0x220],edx
	unsigned int buf[128];
	int i;

	memset(buf,0,512);
  80a533:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80a53a:	ba 00 02 00 00       	mov    edx,0x200
  80a53f:	be 00 00 00 00       	mov    esi,0x0
  80a544:	48 89 c7             	mov    rdi,rax
  80a547:	e8 6d 2a 00 00       	call   80cfb9 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  80a54c:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  80a553:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a557:	89 c2                	mov    edx,eax
  80a559:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80a55f:	c1 e8 07             	shr    eax,0x7
  80a562:	01 d0                	add    eax,edx
  80a564:	89 c2                	mov    edx,eax
  80a566:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80a56d:	49 89 c0             	mov    r8,rax
  80a570:	b9 01 00 00 00       	mov    ecx,0x1
  80a575:	be 00 00 00 00       	mov    esi,0x0
  80a57a:	bf 00 00 00 00       	mov    edi,0x0
  80a57f:	e8 23 f2 ff ff       	call   8097a7 <request>
  80a584:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    chk_result(r);
  80a587:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80a58a:	89 c7                	mov    edi,eax
  80a58c:	e8 ca f8 ff ff       	call   809e5b <chk_result>
    buf[fat_entry & 0x7f] = (buf[fat_entry & 0x7f] & 0xf0000000) | (value & 0x0fffffff);
  80a591:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80a597:	83 e0 7f             	and    eax,0x7f
  80a59a:	89 c0                	mov    eax,eax
  80a59c:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  80a5a3:	25 00 00 00 f0       	and    eax,0xf0000000
  80a5a8:	89 c6                	mov    esi,eax
  80a5aa:	8b 85 e0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x220]
  80a5b0:	25 ff ff ff 0f       	and    eax,0xfffffff
  80a5b5:	89 c1                	mov    ecx,eax
  80a5b7:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80a5bd:	83 e0 7f             	and    eax,0x7f
  80a5c0:	89 c2                	mov    edx,eax
  80a5c2:	89 f0                	mov    eax,esi
  80a5c4:	09 c8                	or     eax,ecx
  80a5c6:	89 d2                	mov    edx,edx
  80a5c8:	89 84 95 f0 fd ff ff 	mov    DWORD PTR [rbp+rdx*4-0x210],eax

	for(i = 0;i < fsbi->NumFATs;i++){
  80a5cf:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80a5d6:	eb 61                	jmp    80a639 <DISK1_FAT32_write_FAT_Entry+0x128>
        int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,fsbi->FAT1_firstsector + fsbi->sector_per_FAT * i + (fat_entry >> 7),1,(unsigned char *)buf);
  80a5d8:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  80a5df:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a5e3:	89 c1                	mov    ecx,eax
  80a5e5:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  80a5ec:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  80a5f0:	89 c2                	mov    edx,eax
  80a5f2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a5f5:	48 98                	cdqe   
  80a5f7:	0f af c2             	imul   eax,edx
  80a5fa:	8d 14 01             	lea    edx,[rcx+rax*1]
  80a5fd:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80a603:	c1 e8 07             	shr    eax,0x7
  80a606:	01 d0                	add    eax,edx
  80a608:	89 c2                	mov    edx,eax
  80a60a:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80a611:	49 89 c0             	mov    r8,rax
  80a614:	b9 01 00 00 00       	mov    ecx,0x1
  80a619:	be 01 00 00 00       	mov    esi,0x1
  80a61e:	bf 00 00 00 00       	mov    edi,0x0
  80a623:	e8 7f f1 ff ff       	call   8097a7 <request>
  80a628:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        chk_result(r1);
  80a62b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a62e:	89 c7                	mov    edi,eax
  80a630:	e8 26 f8 ff ff       	call   809e5b <chk_result>
	for(i = 0;i < fsbi->NumFATs;i++){
  80a635:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a639:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a63c:	48 63 d0             	movsxd rdx,eax
  80a63f:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  80a646:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a64a:	48 39 c2             	cmp    rdx,rax
  80a64d:	72 89                	jb     80a5d8 <DISK1_FAT32_write_FAT_Entry+0xc7>
    }
	return 1;
  80a64f:	b8 01 00 00 00       	mov    eax,0x1
}
  80a654:	c9                   	leave  
  80a655:	c3                   	ret    

000000000080a656 <FAT32_open>:


long FAT32_open(struct index_node * inode,struct file * filp)
{
  80a656:	f3 0f 1e fa          	endbr64 
  80a65a:	55                   	push   rbp
  80a65b:	48 89 e5             	mov    rbp,rsp
  80a65e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a662:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  80a666:	b8 01 00 00 00       	mov    eax,0x1
}
  80a66b:	5d                   	pop    rbp
  80a66c:	c3                   	ret    

000000000080a66d <FAT32_close>:


long FAT32_close(struct index_node * inode,struct file * filp)
{
  80a66d:	f3 0f 1e fa          	endbr64 
  80a671:	55                   	push   rbp
  80a672:	48 89 e5             	mov    rbp,rsp
  80a675:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a679:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  80a67d:	b8 01 00 00 00       	mov    eax,0x1
}
  80a682:	5d                   	pop    rbp
  80a683:	c3                   	ret    

000000000080a684 <FAT32_read>:


long FAT32_read(struct file * filp,char * buf,unsigned long count,long * position)
{
  80a684:	f3 0f 1e fa          	endbr64 
  80a688:	55                   	push   rbp
  80a689:	48 89 e5             	mov    rbp,rsp
  80a68c:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  80a690:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  80a694:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  80a698:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
  80a69c:	48 89 4d 80          	mov    QWORD PTR [rbp-0x80],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  80a6a0:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a6a4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a6a8:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a6ac:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a6b0:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  80a6b4:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a6b8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a6bc:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a6c0:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a6c4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a6c8:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

	unsigned long cluster = finode->first_cluster;
  80a6cc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a6d0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a6d3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long sector = 0;
  80a6d7:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  80a6de:	00 
	int i,length = 0;
  80a6df:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
	long retval = 0;
  80a6e6:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80a6ed:	00 
	int index = *position / fsbi->bytes_per_cluster;
  80a6ee:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80a6f2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a6f5:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80a6f9:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  80a6fd:	48 99                	cqo    
  80a6ff:	48 f7 fe             	idiv   rsi
  80a702:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  80a705:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80a709:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a70c:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80a710:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  80a714:	48 99                	cqo    
  80a716:	48 f7 f9             	idiv   rcx
  80a719:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  80a71d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a721:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a725:	be 00 00 00 00       	mov    esi,0x0
  80a72a:	48 89 c7             	mov    rdi,rax
  80a72d:	b8 00 00 00 00       	mov    eax,0x0
  80a732:	e8 0b 6b ff ff       	call   801242 <vmalloc>
  80a737:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax

	if(!cluster)
  80a73b:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80a740:	75 0c                	jne    80a74e <FAT32_read+0xca>
		return -EFAULT;
  80a742:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  80a749:	e9 f0 01 00 00       	jmp    80a93e <FAT32_read+0x2ba>
	for(i = 0;i < index;i++)
  80a74e:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80a755:	eb 1e                	jmp    80a775 <FAT32_read+0xf1>
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80a757:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a75b:	89 c2                	mov    edx,eax
  80a75d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a761:	89 d6                	mov    esi,edx
  80a763:	48 89 c7             	mov    rdi,rax
  80a766:	e8 ea fc ff ff       	call   80a455 <DISK1_FAT32_read_FAT_Entry>
  80a76b:	89 c0                	mov    eax,eax
  80a76d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	for(i = 0;i < index;i++)
  80a771:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80a775:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a778:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80a77b:	7c da                	jl     80a757 <FAT32_read+0xd3>

	if(*position + count > filp->dentry->dir_inode->file_size)
  80a77d:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80a781:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a784:	48 89 c2             	mov    rdx,rax
  80a787:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80a78b:	48 01 c2             	add    rdx,rax
  80a78e:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a792:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a796:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a79a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a79d:	48 39 c2             	cmp    rdx,rax
  80a7a0:	76 2c                	jbe    80a7ce <FAT32_read+0x14a>
		index = count = filp->dentry->dir_inode->file_size - *position;
  80a7a2:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a7a6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a7aa:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80a7ae:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80a7b1:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80a7b5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a7b8:	48 89 c1             	mov    rcx,rax
  80a7bb:	48 89 d0             	mov    rax,rdx
  80a7be:	48 29 c8             	sub    rax,rcx
  80a7c1:	48 89 45 88          	mov    QWORD PTR [rbp-0x78],rax
  80a7c5:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80a7c9:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
  80a7cc:	eb 07                	jmp    80a7d5 <FAT32_read+0x151>
	else
		index = count;
  80a7ce:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80a7d2:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax

//	printf("FAT32_read first_cluster:%d,size:%d,preempt_count:%d\n",finode->first_cluster,filp->dentry->dir_inode->file_size,current->preempt_count);

	do
	{
		memset(buffer,0,fsbi->bytes_per_cluster);
  80a7d5:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a7d9:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a7dd:	89 c2                	mov    edx,eax
  80a7df:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80a7e3:	be 00 00 00 00       	mov    esi,0x0
  80a7e8:	48 89 c7             	mov    rdi,rax
  80a7eb:	e8 c9 27 00 00       	call   80cfb9 <memset>
		sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  80a7f0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a7f4:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  80a7f8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a7fc:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  80a800:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a804:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a808:	48 0f af c2          	imul   rax,rdx
  80a80c:	48 01 c8             	add    rax,rcx
  80a80f:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  80a813:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a817:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a81b:	89 c1                	mov    ecx,eax
  80a81d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80a821:	89 c2                	mov    edx,eax
  80a823:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80a827:	49 89 c0             	mov    r8,rax
  80a82a:	be 00 00 00 00       	mov    esi,0x0
  80a82f:	bf 00 00 00 00       	mov    edi,0x0
  80a834:	e8 6e ef ff ff       	call   8097a7 <request>
  80a839:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
		if(!chk_result(r))
  80a83c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80a83f:	89 c7                	mov    edi,eax
  80a841:	e8 15 f6 ff ff       	call   809e5b <chk_result>
  80a846:	85 c0                	test   eax,eax
  80a848:	75 1c                	jne    80a866 <FAT32_read+0x1e2>
		{
			printf("FAT32 FS(read) read disk ERROR!!!!!!!!!!\n");
  80a84a:	bf 08 5b 81 00       	mov    edi,0x815b08
  80a84f:	b8 00 00 00 00       	mov    eax,0x0
  80a854:	e8 13 65 ff ff       	call   800d6c <printf>
			retval = -EIO;
  80a859:	48 c7 45 e8 e3 ff ff 	mov    QWORD PTR [rbp-0x18],0xffffffffffffffe3
  80a860:	ff 
			break;
  80a861:	e9 ba 00 00 00       	jmp    80a920 <FAT32_read+0x29c>
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  80a866:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80a869:	48 63 d0             	movsxd rdx,eax
  80a86c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a870:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a874:	48 2b 45 d8          	sub    rax,QWORD PTR [rbp-0x28]
  80a878:	48 39 c2             	cmp    rdx,rax
  80a87b:	48 0f 4e c2          	cmovle rax,rdx
  80a87f:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax

		if((unsigned long)buf < MAX_TASKS)
  80a882:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80a886:	48 83 f8 1f          	cmp    rax,0x1f
  80a88a:	77 1f                	ja     80a8ab <FAT32_read+0x227>
			memcpy(buffer + offset,buf,length);
  80a88c:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  80a88f:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  80a893:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80a897:	48 01 c1             	add    rcx,rax
  80a89a:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80a89e:	48 89 c6             	mov    rsi,rax
  80a8a1:	48 89 cf             	mov    rdi,rcx
  80a8a4:	e8 61 26 00 00       	call   80cf0a <memcpy>
  80a8a9:	eb 1d                	jmp    80a8c8 <FAT32_read+0x244>
		else
			memcpy(buffer + offset,buf,length);
  80a8ab:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  80a8ae:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  80a8b2:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80a8b6:	48 01 c1             	add    rcx,rax
  80a8b9:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80a8bd:	48 89 c6             	mov    rsi,rax
  80a8c0:	48 89 cf             	mov    rdi,rcx
  80a8c3:	e8 42 26 00 00       	call   80cf0a <memcpy>

		index -= length;
  80a8c8:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  80a8cb:	29 45 e4             	sub    DWORD PTR [rbp-0x1c],eax
		buf += length;
  80a8ce:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  80a8d1:	48 98                	cdqe   
  80a8d3:	48 01 45 90          	add    QWORD PTR [rbp-0x70],rax
		offset -= offset;
  80a8d7:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  80a8de:	00 
		*position += length;
  80a8df:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80a8e3:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80a8e6:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  80a8e9:	48 98                	cdqe   
  80a8eb:	48 01 c2             	add    rdx,rax
  80a8ee:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80a8f2:	48 89 10             	mov    QWORD PTR [rax],rdx
	}while(index && (cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster)));
  80a8f5:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  80a8f9:	74 25                	je     80a920 <FAT32_read+0x29c>
  80a8fb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a8ff:	89 c2                	mov    edx,eax
  80a901:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a905:	89 d6                	mov    esi,edx
  80a907:	48 89 c7             	mov    rdi,rax
  80a90a:	e8 46 fb ff ff       	call   80a455 <DISK1_FAT32_read_FAT_Entry>
  80a90f:	89 c0                	mov    eax,eax
  80a911:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  80a915:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80a91a:	0f 85 b5 fe ff ff    	jne    80a7d5 <FAT32_read+0x151>

	vmfree(buffer);
  80a920:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80a924:	48 89 c7             	mov    rdi,rax
  80a927:	e8 a5 69 ff ff       	call   8012d1 <vmfree>
	if(!index)
  80a92c:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  80a930:	75 08                	jne    80a93a <FAT32_read+0x2b6>
		retval = count;
  80a932:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80a936:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	return retval;
  80a93a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
}
  80a93e:	c9                   	leave  
  80a93f:	c3                   	ret    

000000000080a940 <FAT32_find_available_cluster>:


unsigned long FAT32_find_available_cluster(struct FAT32_sb_info * fsbi)
{
  80a940:	f3 0f 1e fa          	endbr64 
  80a944:	55                   	push   rbp
  80a945:	48 89 e5             	mov    rbp,rsp
  80a948:	48 81 ec 30 02 00 00 	sub    rsp,0x230
  80a94f:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
	int i,j;
	int fat_entry;
	unsigned long sector_per_fat = fsbi->sector_per_FAT;
  80a956:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  80a95d:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  80a961:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	unsigned int buf[128];

//	fsbi->fat_fsinfo->FSI_Free_Count & fsbi->fat_fsinfo->FSI_Nxt_Free not exactly,so unuse

	for(i = 0;i < sector_per_fat;i++)
  80a965:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80a96c:	e9 8b 00 00 00       	jmp    80a9fc <FAT32_find_available_cluster+0xbc>
	{
		memset(buf,0,512);
  80a971:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  80a978:	ba 00 02 00 00       	mov    edx,0x200
  80a97d:	be 00 00 00 00       	mov    esi,0x0
  80a982:	48 89 c7             	mov    rdi,rax
  80a985:	e8 2f 26 00 00       	call   80cfb9 <memset>
		int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + i,1,(unsigned char *)buf);
  80a98a:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  80a991:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a995:	89 c2                	mov    edx,eax
  80a997:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a99a:	01 d0                	add    eax,edx
  80a99c:	89 c2                	mov    edx,eax
  80a99e:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  80a9a5:	49 89 c0             	mov    r8,rax
  80a9a8:	b9 01 00 00 00       	mov    ecx,0x1
  80a9ad:	be 00 00 00 00       	mov    esi,0x0
  80a9b2:	bf 00 00 00 00       	mov    edi,0x0
  80a9b7:	e8 eb ed ff ff       	call   8097a7 <request>
  80a9bc:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

		for(j = 0;j < 128;j++)
  80a9bf:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80a9c6:	eb 2a                	jmp    80a9f2 <FAT32_find_available_cluster+0xb2>
		{
			if((buf[j] & 0x0fffffff) == 0)
  80a9c8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80a9cb:	48 98                	cdqe   
  80a9cd:	8b 84 85 e0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x220]
  80a9d4:	25 ff ff ff 0f       	and    eax,0xfffffff
  80a9d9:	85 c0                	test   eax,eax
  80a9db:	75 11                	jne    80a9ee <FAT32_find_available_cluster+0xae>
				return (i << 7) + j;
  80a9dd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a9e0:	c1 e0 07             	shl    eax,0x7
  80a9e3:	89 c2                	mov    edx,eax
  80a9e5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80a9e8:	01 d0                	add    eax,edx
  80a9ea:	48 98                	cdqe   
  80a9ec:	eb 22                	jmp    80aa10 <FAT32_find_available_cluster+0xd0>
		for(j = 0;j < 128;j++)
  80a9ee:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80a9f2:	83 7d f8 7f          	cmp    DWORD PTR [rbp-0x8],0x7f
  80a9f6:	7e d0                	jle    80a9c8 <FAT32_find_available_cluster+0x88>
	for(i = 0;i < sector_per_fat;i++)
  80a9f8:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a9fc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a9ff:	48 98                	cdqe   
  80aa01:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  80aa05:	0f 87 66 ff ff ff    	ja     80a971 <FAT32_find_available_cluster+0x31>
		}
	}
	return 0;
  80aa0b:	b8 00 00 00 00       	mov    eax,0x0
}
  80aa10:	c9                   	leave  
  80aa11:	c3                   	ret    

000000000080aa12 <FAT32_write>:


long FAT32_write(struct file * filp,char * buf,unsigned long count,long * position)
{
  80aa12:	f3 0f 1e fa          	endbr64 
  80aa16:	55                   	push   rbp
  80aa17:	48 89 e5             	mov    rbp,rsp
  80aa1a:	48 81 ec 90 00 00 00 	sub    rsp,0x90
  80aa21:	48 89 7d 88          	mov    QWORD PTR [rbp-0x78],rdi
  80aa25:	48 89 75 80          	mov    QWORD PTR [rbp-0x80],rsi
  80aa29:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  80aa30:	48 89 8d 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  80aa37:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80aa3b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80aa3f:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80aa43:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80aa47:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  80aa4b:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80aa4f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80aa53:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80aa57:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80aa5b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80aa5f:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned long cluster = finode->first_cluster;
  80aa63:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80aa67:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aa6a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long next_cluster = 0;
  80aa6e:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  80aa75:	00 
	unsigned long sector = 0;
  80aa76:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80aa7d:	00 
	int i,length = 0;
  80aa7e:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
	long retval = 0;
  80aa85:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80aa8c:	00 
	long flags = 0;
  80aa8d:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  80aa94:	00 
	int index = *position / fsbi->bytes_per_cluster;
  80aa95:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80aa9c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aa9f:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80aaa3:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  80aaa7:	48 99                	cqo    
  80aaa9:	48 f7 fe             	idiv   rsi
  80aaac:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  80aaaf:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80aab6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aab9:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80aabd:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  80aac1:	48 99                	cqo    
  80aac3:	48 f7 f9             	idiv   rcx
  80aac6:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  80aaca:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80aace:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80aad2:	be 00 00 00 00       	mov    esi,0x0
  80aad7:	48 89 c7             	mov    rdi,rax
  80aada:	b8 00 00 00 00       	mov    eax,0x0
  80aadf:	e8 5e 67 ff ff       	call   801242 <vmalloc>
  80aae4:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax

	if(!cluster)
  80aae8:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80aaed:	75 1a                	jne    80ab09 <FAT32_write+0xf7>
	{
		cluster = FAT32_find_available_cluster(fsbi);
  80aaef:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80aaf3:	48 89 c7             	mov    rdi,rax
  80aaf6:	e8 45 fe ff ff       	call   80a940 <FAT32_find_available_cluster>
  80aafb:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		flags = 1;
  80aaff:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  80ab06:	00 
  80ab07:	eb 2f                	jmp    80ab38 <FAT32_write+0x126>
	}
	else
		for(i = 0;i < index;i++)
  80ab09:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80ab10:	eb 1e                	jmp    80ab30 <FAT32_write+0x11e>
			cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80ab12:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ab16:	89 c2                	mov    edx,eax
  80ab18:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ab1c:	89 d6                	mov    esi,edx
  80ab1e:	48 89 c7             	mov    rdi,rax
  80ab21:	e8 2f f9 ff ff       	call   80a455 <DISK1_FAT32_read_FAT_Entry>
  80ab26:	89 c0                	mov    eax,eax
  80ab28:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		for(i = 0;i < index;i++)
  80ab2c:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  80ab30:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80ab33:	3b 45 d4             	cmp    eax,DWORD PTR [rbp-0x2c]
  80ab36:	7c da                	jl     80ab12 <FAT32_write+0x100>

	if(!cluster)
  80ab38:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80ab3d:	75 18                	jne    80ab57 <FAT32_write+0x145>
	{
		vmfree(buffer);
  80ab3f:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ab43:	48 89 c7             	mov    rdi,rax
  80ab46:	e8 86 67 ff ff       	call   8012d1 <vmfree>
		return -ENOSPC;
  80ab4b:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  80ab52:	e9 13 03 00 00       	jmp    80ae6a <FAT32_write+0x458>
	}

	if(flags)
  80ab57:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80ab5c:	74 4d                	je     80abab <FAT32_write+0x199>
	{
		finode->first_cluster = cluster;
  80ab5e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80ab62:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80ab66:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  80ab69:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80ab6d:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ab71:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80ab75:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80ab79:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80ab7d:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  80ab81:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80ab85:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ab89:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80ab8d:	48 89 c7             	mov    rdi,rax
  80ab90:	ff d2                	call   rdx
		DISK1_FAT32_write_FAT_Entry(fsbi,cluster,0x0ffffff8);
  80ab92:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ab96:	89 c1                	mov    ecx,eax
  80ab98:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ab9c:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  80aba1:	89 ce                	mov    esi,ecx
  80aba3:	48 89 c7             	mov    rdi,rax
  80aba6:	e8 66 f9 ff ff       	call   80a511 <DISK1_FAT32_write_FAT_Entry>
	}

	index = count;
  80abab:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  80abb2:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax

	do
	{
		if(!flags)
  80abb5:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80abba:	0f 85 91 00 00 00    	jne    80ac51 <FAT32_write+0x23f>
		{
			memset(buffer,0,fsbi->bytes_per_cluster);
  80abc0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80abc4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80abc8:	89 c2                	mov    edx,eax
  80abca:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80abce:	be 00 00 00 00       	mov    esi,0x0
  80abd3:	48 89 c7             	mov    rdi,rax
  80abd6:	e8 de 23 00 00       	call   80cfb9 <memset>
			sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  80abdb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80abdf:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  80abe3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80abe7:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  80abeb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80abef:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80abf3:	48 0f af c2          	imul   rax,rdx
  80abf7:	48 01 c8             	add    rax,rcx
  80abfa:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  80abfe:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ac02:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ac06:	89 c1                	mov    ecx,eax
  80ac08:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ac0c:	89 c2                	mov    edx,eax
  80ac0e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ac12:	49 89 c0             	mov    r8,rax
  80ac15:	be 00 00 00 00       	mov    esi,0x0
  80ac1a:	bf 00 00 00 00       	mov    edi,0x0
  80ac1f:	e8 83 eb ff ff       	call   8097a7 <request>
  80ac24:	89 45 9c             	mov    DWORD PTR [rbp-0x64],eax

			if(!chk_result(r))
  80ac27:	8b 45 9c             	mov    eax,DWORD PTR [rbp-0x64]
  80ac2a:	89 c7                	mov    edi,eax
  80ac2c:	e8 2a f2 ff ff       	call   809e5b <chk_result>
  80ac31:	85 c0                	test   eax,eax
  80ac33:	75 1c                	jne    80ac51 <FAT32_write+0x23f>
			{
				printf("FAT32 FS(write) read disk ERROR!!!!!!!!!!\n");
  80ac35:	bf 38 5b 81 00       	mov    edi,0x815b38
  80ac3a:	b8 00 00 00 00       	mov    eax,0x0
  80ac3f:	e8 28 61 ff ff       	call   800d6c <printf>
				retval = -EIO;
  80ac44:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  80ac4b:	ff 
				break;
  80ac4c:	e9 95 01 00 00       	jmp    80ade6 <FAT32_write+0x3d4>
			}
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  80ac51:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80ac54:	48 63 d0             	movsxd rdx,eax
  80ac57:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ac5b:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80ac5f:	48 2b 45 c8          	sub    rax,QWORD PTR [rbp-0x38]
  80ac63:	48 39 c2             	cmp    rdx,rax
  80ac66:	48 0f 4e c2          	cmovle rax,rdx
  80ac6a:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax

		if((unsigned long)buf < MAX_TASKS)
  80ac6d:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80ac71:	48 83 f8 1f          	cmp    rax,0x1f
  80ac75:	77 1f                	ja     80ac96 <FAT32_write+0x284>
			memcpy(buf,buffer + offset,length);
  80ac77:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  80ac7a:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  80ac7e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ac82:	48 01 c1             	add    rcx,rax
  80ac85:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80ac89:	48 89 ce             	mov    rsi,rcx
  80ac8c:	48 89 c7             	mov    rdi,rax
  80ac8f:	e8 76 22 00 00       	call   80cf0a <memcpy>
  80ac94:	eb 1d                	jmp    80acb3 <FAT32_write+0x2a1>
		else
			memcpy(buf,buffer + offset,length);
  80ac96:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  80ac99:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  80ac9d:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80aca1:	48 01 c1             	add    rcx,rax
  80aca4:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80aca8:	48 89 ce             	mov    rsi,rcx
  80acab:	48 89 c7             	mov    rdi,rax
  80acae:	e8 57 22 00 00       	call   80cf0a <memcpy>

		int r=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  80acb3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80acb7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80acbb:	89 c1                	mov    ecx,eax
  80acbd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80acc1:	89 c2                	mov    edx,eax
  80acc3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80acc7:	49 89 c0             	mov    r8,rax
  80acca:	be 01 00 00 00       	mov    esi,0x1
  80accf:	bf 00 00 00 00       	mov    edi,0x0
  80acd4:	e8 ce ea ff ff       	call   8097a7 <request>
  80acd9:	89 45 98             	mov    DWORD PTR [rbp-0x68],eax
        if(!chk_result(r))
  80acdc:	8b 45 98             	mov    eax,DWORD PTR [rbp-0x68]
  80acdf:	89 c7                	mov    edi,eax
  80ace1:	e8 75 f1 ff ff       	call   809e5b <chk_result>
  80ace6:	85 c0                	test   eax,eax
  80ace8:	75 1c                	jne    80ad06 <FAT32_write+0x2f4>
		{
			printf("FAT32 FS(write) write disk ERROR!!!!!!!!!!\n");
  80acea:	bf 68 5b 81 00       	mov    edi,0x815b68
  80acef:	b8 00 00 00 00       	mov    eax,0x0
  80acf4:	e8 73 60 ff ff       	call   800d6c <printf>
			retval = -EIO;
  80acf9:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  80ad00:	ff 
			break;
  80ad01:	e9 e0 00 00 00       	jmp    80ade6 <FAT32_write+0x3d4>
		}

		index -= length;
  80ad06:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80ad09:	29 45 d4             	sub    DWORD PTR [rbp-0x2c],eax
		buf += length;
  80ad0c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80ad0f:	48 98                	cdqe   
  80ad11:	48 01 45 80          	add    QWORD PTR [rbp-0x80],rax
		offset -= offset;
  80ad15:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  80ad1c:	00 
		*position += length;
  80ad1d:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80ad24:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80ad27:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80ad2a:	48 98                	cdqe   
  80ad2c:	48 01 c2             	add    rdx,rax
  80ad2f:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80ad36:	48 89 10             	mov    QWORD PTR [rax],rdx

		if(index)
  80ad39:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  80ad3d:	0f 84 a2 00 00 00    	je     80ade5 <FAT32_write+0x3d3>
			next_cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80ad43:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ad47:	89 c2                	mov    edx,eax
  80ad49:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ad4d:	89 d6                	mov    esi,edx
  80ad4f:	48 89 c7             	mov    rdi,rax
  80ad52:	e8 fe f6 ff ff       	call   80a455 <DISK1_FAT32_read_FAT_Entry>
  80ad57:	89 c0                	mov    eax,eax
  80ad59:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
		else
			break;

		if(next_cluster >= 0x0ffffff8)
  80ad5d:	48 81 7d b0 f7 ff ff 	cmp    QWORD PTR [rbp-0x50],0xffffff7
  80ad64:	0f 
  80ad65:	76 72                	jbe    80add9 <FAT32_write+0x3c7>
		{
			next_cluster = FAT32_find_available_cluster(fsbi);
  80ad67:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ad6b:	48 89 c7             	mov    rdi,rax
  80ad6e:	e8 cd fb ff ff       	call   80a940 <FAT32_find_available_cluster>
  80ad73:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
			if(!next_cluster)
  80ad77:	48 83 7d b0 00       	cmp    QWORD PTR [rbp-0x50],0x0
  80ad7c:	75 18                	jne    80ad96 <FAT32_write+0x384>
			{
				vmfree(buffer);
  80ad7e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ad82:	48 89 c7             	mov    rdi,rax
  80ad85:	e8 47 65 ff ff       	call   8012d1 <vmfree>
				return -ENOSPC;
  80ad8a:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  80ad91:	e9 d4 00 00 00       	jmp    80ae6a <FAT32_write+0x458>
			}			
				
			DISK1_FAT32_write_FAT_Entry(fsbi,cluster,next_cluster);
  80ad96:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80ad9a:	89 c2                	mov    edx,eax
  80ad9c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ada0:	89 c1                	mov    ecx,eax
  80ada2:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ada6:	89 ce                	mov    esi,ecx
  80ada8:	48 89 c7             	mov    rdi,rax
  80adab:	e8 61 f7 ff ff       	call   80a511 <DISK1_FAT32_write_FAT_Entry>
			DISK1_FAT32_write_FAT_Entry(fsbi,next_cluster,0x0ffffff8);
  80adb0:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80adb4:	89 c1                	mov    ecx,eax
  80adb6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80adba:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  80adbf:	89 ce                	mov    esi,ecx
  80adc1:	48 89 c7             	mov    rdi,rax
  80adc4:	e8 48 f7 ff ff       	call   80a511 <DISK1_FAT32_write_FAT_Entry>
			cluster = next_cluster;
  80adc9:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80adcd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			flags = 1;
  80add1:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  80add8:	00 
		}

	}while(index);
  80add9:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  80addd:	0f 85 d2 fd ff ff    	jne    80abb5 <FAT32_write+0x1a3>
  80ade3:	eb 01                	jmp    80ade6 <FAT32_write+0x3d4>
			break;
  80ade5:	90                   	nop

	if(*position > filp->dentry->dir_inode->file_size)
  80ade6:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80aded:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80adf0:	48 89 c2             	mov    rdx,rax
  80adf3:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80adf7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80adfb:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80adff:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ae02:	48 39 c2             	cmp    rdx,rax
  80ae05:	76 42                	jbe    80ae49 <FAT32_write+0x437>
	{
		filp->dentry->dir_inode->file_size = *position;
  80ae07:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80ae0e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80ae11:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80ae15:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ae19:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80ae1d:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  80ae20:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80ae24:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ae28:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80ae2c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80ae30:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80ae34:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  80ae38:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80ae3c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ae40:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80ae44:	48 89 c7             	mov    rdi,rax
  80ae47:	ff d2                	call   rdx
	}

	vmfree(buffer);
  80ae49:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ae4d:	48 89 c7             	mov    rdi,rax
  80ae50:	e8 7c 64 ff ff       	call   8012d1 <vmfree>
	if(!index)
  80ae55:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  80ae59:	75 0b                	jne    80ae66 <FAT32_write+0x454>
		retval = count;
  80ae5b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  80ae62:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	return retval;
  80ae66:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  80ae6a:	c9                   	leave  
  80ae6b:	c3                   	ret    

000000000080ae6c <FAT32_lseek>:


long FAT32_lseek(struct file * filp,long offset,long origin)
{
  80ae6c:	f3 0f 1e fa          	endbr64 
  80ae70:	55                   	push   rbp
  80ae71:	48 89 e5             	mov    rbp,rsp
  80ae74:	48 83 ec 30          	sub    rsp,0x30
  80ae78:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80ae7c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80ae80:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	struct index_node *inode = filp->dentry->dir_inode;
  80ae84:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ae88:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ae8c:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80ae90:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	long pos = 0;
  80ae94:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80ae9b:	00 

	switch(origin)
  80ae9c:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  80aea1:	74 21                	je     80aec4 <FAT32_lseek+0x58>
  80aea3:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  80aea8:	7f 4a                	jg     80aef4 <FAT32_lseek+0x88>
  80aeaa:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80aeaf:	74 09                	je     80aeba <FAT32_lseek+0x4e>
  80aeb1:	48 83 7d d8 01       	cmp    QWORD PTR [rbp-0x28],0x1
  80aeb6:	74 20                	je     80aed8 <FAT32_lseek+0x6c>
  80aeb8:	eb 3a                	jmp    80aef4 <FAT32_lseek+0x88>
	{
		case SEEK_SET:
				pos = offset;
  80aeba:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80aebe:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  80aec2:	eb 39                	jmp    80aefd <FAT32_lseek+0x91>

		case SEEK_CUR:
				pos =  filp->position + offset;
  80aec4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80aec8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80aecb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80aecf:	48 01 d0             	add    rax,rdx
  80aed2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  80aed6:	eb 25                	jmp    80aefd <FAT32_lseek+0x91>

		case SEEK_END:
				pos = filp->dentry->dir_inode->file_size + offset;
  80aed8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80aedc:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80aee0:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80aee4:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80aee7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80aeeb:	48 01 d0             	add    rax,rdx
  80aeee:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  80aef2:	eb 09                	jmp    80aefd <FAT32_lseek+0x91>

		default:
			return -EINVAL;
  80aef4:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  80aefb:	eb 50                	jmp    80af4d <FAT32_lseek+0xe1>
			break;
	}

	if(pos < 0 || pos > filp->dentry->dir_inode->file_size)
  80aefd:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80af02:	78 18                	js     80af1c <FAT32_lseek+0xb0>
  80af04:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80af08:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80af0c:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80af10:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80af13:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80af17:	48 39 c2             	cmp    rdx,rax
  80af1a:	73 09                	jae    80af25 <FAT32_lseek+0xb9>
		return -EOVERFLOW;
  80af1c:	48 c7 c0 bf ff ff ff 	mov    rax,0xffffffffffffffbf
  80af23:	eb 28                	jmp    80af4d <FAT32_lseek+0xe1>

	filp->position = pos;
  80af25:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80af29:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80af2d:	48 89 10             	mov    QWORD PTR [rax],rdx
	printf("FAT32 FS(lseek) alert position:%d\n",filp->position);
  80af30:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80af34:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80af37:	48 89 c6             	mov    rsi,rax
  80af3a:	bf 98 5b 81 00       	mov    edi,0x815b98
  80af3f:	b8 00 00 00 00       	mov    eax,0x0
  80af44:	e8 23 5e ff ff       	call   800d6c <printf>

	return pos;
  80af49:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80af4d:	c9                   	leave  
  80af4e:	c3                   	ret    

000000000080af4f <FAT32_ioctl>:


long FAT32_ioctl(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg)
{}
  80af4f:	f3 0f 1e fa          	endbr64 
  80af53:	55                   	push   rbp
  80af54:	48 89 e5             	mov    rbp,rsp
  80af57:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80af5b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80af5f:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80af63:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  80af67:	90                   	nop
  80af68:	5d                   	pop    rbp
  80af69:	c3                   	ret    

000000000080af6a <FAT32_readdir>:

long FAT32_readdir(struct file * filp,void * dirent,filldir_t filler)
{
  80af6a:	f3 0f 1e fa          	endbr64 
  80af6e:	55                   	push   rbp
  80af6f:	48 89 e5             	mov    rbp,rsp
  80af72:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  80af76:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  80af7a:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  80af7e:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  80af82:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80af86:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80af8a:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80af8e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80af92:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  80af96:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80af9a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80af9e:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80afa2:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80afa6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80afaa:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned int cluster = 0;
  80afae:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  80afb5:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  80afbc:	00 
	unsigned char * buf =NULL; 
  80afbd:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
  80afc4:	00 
	char *name = NULL;
  80afc5:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80afcc:	00 
	int namelen = 0;
  80afcd:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
	int i = 0,j = 0,x = 0,y = 0;
  80afd4:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  80afdb:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
  80afe2:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  80afe9:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  80aff0:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  80aff7:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  80aff8:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  80afff:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  80b000:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b004:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80b008:	be 00 00 00 00       	mov    esi,0x0
  80b00d:	48 89 c7             	mov    rdi,rax
  80b010:	b8 00 00 00 00       	mov    eax,0x0
  80b015:	e8 28 62 ff ff       	call   801242 <vmalloc>
  80b01a:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax

	cluster = finode->first_cluster;
  80b01e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80b022:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b025:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

	j = filp->position/fsbi->bytes_per_cluster;
  80b028:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80b02c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b02f:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80b033:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  80b037:	48 99                	cqo    
  80b039:	48 f7 fe             	idiv   rsi
  80b03c:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	
	for(i = 0;i<j;i++)
  80b03f:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  80b046:	eb 3a                	jmp    80b082 <FAT32_readdir+0x118>
	{
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80b048:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80b04b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b04f:	89 d6                	mov    esi,edx
  80b051:	48 89 c7             	mov    rdi,rax
  80b054:	e8 fc f3 ff ff       	call   80a455 <DISK1_FAT32_read_FAT_Entry>
  80b059:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
		if(cluster > 0x0ffffff7)
  80b05c:	81 7d fc f7 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff7
  80b063:	76 19                	jbe    80b07e <FAT32_readdir+0x114>
		{
			printf("FAT32 FS(readdir) cluster didn`t exist\n");
  80b065:	bf c0 5b 81 00       	mov    edi,0x815bc0
  80b06a:	b8 00 00 00 00       	mov    eax,0x0
  80b06f:	e8 f8 5c ff ff       	call   800d6c <printf>
			return NULL;
  80b074:	b8 00 00 00 00       	mov    eax,0x0
  80b079:	e9 86 05 00 00       	jmp    80b604 <FAT32_readdir+0x69a>
	for(i = 0;i<j;i++)
  80b07e:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  80b082:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80b085:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80b088:	7c be                	jl     80b048 <FAT32_readdir+0xde>
		}
	}

next_cluster:
  80b08a:	90                   	nop
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  80b08b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b08f:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  80b093:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b096:	83 e8 02             	sub    eax,0x2
  80b099:	89 c1                	mov    ecx,eax
  80b09b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b09f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80b0a3:	48 0f af c1          	imul   rax,rcx
  80b0a7:	48 01 d0             	add    rax,rdx
  80b0aa:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80b0ae:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b0b2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80b0b6:	89 c1                	mov    ecx,eax
  80b0b8:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80b0bc:	89 c2                	mov    edx,eax
  80b0be:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80b0c2:	49 89 c0             	mov    r8,rax
  80b0c5:	be 00 00 00 00       	mov    esi,0x0
  80b0ca:	bf 00 00 00 00       	mov    edi,0x0
  80b0cf:	e8 d3 e6 ff ff       	call   8097a7 <request>
  80b0d4:	89 45 a4             	mov    DWORD PTR [rbp-0x5c],eax
    if(!chk_result(r))
  80b0d7:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  80b0da:	89 c7                	mov    edi,eax
  80b0dc:	e8 7a ed ff ff       	call   809e5b <chk_result>
  80b0e1:	85 c0                	test   eax,eax
  80b0e3:	75 25                	jne    80b10a <FAT32_readdir+0x1a0>
	{
		printf("FAT32 FS(readdir) read disk ERROR!!!!!!!!!!\n");
  80b0e5:	bf e8 5b 81 00       	mov    edi,0x815be8
  80b0ea:	b8 00 00 00 00       	mov    eax,0x0
  80b0ef:	e8 78 5c ff ff       	call   800d6c <printf>
		vmfree(buf);
  80b0f4:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80b0f8:	48 89 c7             	mov    rdi,rax
  80b0fb:	e8 d1 61 ff ff       	call   8012d1 <vmfree>
		return NULL;
  80b100:	b8 00 00 00 00       	mov    eax,0x0
  80b105:	e9 fa 04 00 00       	jmp    80b604 <FAT32_readdir+0x69a>
	}

	tmpdentry = (struct FAT32_Directory *)(buf + filp->position%fsbi->bytes_per_cluster);
  80b10a:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80b10e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b111:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80b115:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  80b119:	48 99                	cqo    
  80b11b:	48 f7 f9             	idiv   rcx
  80b11e:	48 89 d0             	mov    rax,rdx
  80b121:	48 89 c2             	mov    rdx,rax
  80b124:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80b128:	48 01 d0             	add    rax,rdx
  80b12b:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  80b12f:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80b133:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b136:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80b13a:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  80b13e:	48 99                	cqo    
  80b140:	48 f7 f9             	idiv   rcx
  80b143:	48 89 d0             	mov    rax,rdx
  80b146:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  80b149:	e9 2f 04 00 00       	jmp    80b57d <FAT32_readdir+0x613>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  80b14e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b152:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80b156:	3c 0f                	cmp    al,0xf
  80b158:	0f 84 00 04 00 00    	je     80b55e <FAT32_readdir+0x5f4>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  80b15e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b162:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b165:	3c e5                	cmp    al,0xe5
  80b167:	0f 84 f4 03 00 00    	je     80b561 <FAT32_readdir+0x5f7>
  80b16d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b171:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b174:	84 c0                	test   al,al
  80b176:	0f 84 e5 03 00 00    	je     80b561 <FAT32_readdir+0x5f7>
  80b17c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b180:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b183:	3c 05                	cmp    al,0x5
  80b185:	0f 84 d6 03 00 00    	je     80b561 <FAT32_readdir+0x5f7>
			continue;

		namelen = 0;
  80b18b:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  80b192:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b196:	48 83 e8 20          	sub    rax,0x20
  80b19a:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

		if(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  80b19e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b1a2:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80b1a6:	3c 0f                	cmp    al,0xf
  80b1a8:	0f 85 2a 02 00 00    	jne    80b3d8 <FAT32_readdir+0x46e>
  80b1ae:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b1b2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b1b5:	3c e5                	cmp    al,0xe5
  80b1b7:	0f 84 1b 02 00 00    	je     80b3d8 <FAT32_readdir+0x46e>
  80b1bd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b1c1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b1c4:	84 c0                	test   al,al
  80b1c6:	0f 84 0c 02 00 00    	je     80b3d8 <FAT32_readdir+0x46e>
  80b1cc:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b1d0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b1d3:	3c 05                	cmp    al,0x5
  80b1d5:	0f 84 fd 01 00 00    	je     80b3d8 <FAT32_readdir+0x46e>
		{
			j = 0;
  80b1db:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
			//long file/dir name read
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  80b1e2:	eb 1a                	jmp    80b1fe <FAT32_readdir+0x294>
			{
				j++;
  80b1e4:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
				if(tmpldentry->LDIR_Ord & 0x40)
  80b1e8:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b1ec:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b1ef:	0f b6 c0             	movzx  eax,al
  80b1f2:	83 e0 40             	and    eax,0x40
  80b1f5:	85 c0                	test   eax,eax
  80b1f7:	75 34                	jne    80b22d <FAT32_readdir+0x2c3>
					break;
				tmpldentry --;
  80b1f9:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  80b1fe:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b202:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80b206:	3c 0f                	cmp    al,0xf
  80b208:	75 24                	jne    80b22e <FAT32_readdir+0x2c4>
  80b20a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b20e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b211:	3c e5                	cmp    al,0xe5
  80b213:	74 19                	je     80b22e <FAT32_readdir+0x2c4>
  80b215:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b219:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b21c:	84 c0                	test   al,al
  80b21e:	74 0e                	je     80b22e <FAT32_readdir+0x2c4>
  80b220:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b224:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b227:	3c 05                	cmp    al,0x5
  80b229:	75 b9                	jne    80b1e4 <FAT32_readdir+0x27a>
  80b22b:	eb 01                	jmp    80b22e <FAT32_readdir+0x2c4>
					break;
  80b22d:	90                   	nop
			}

			name = vmalloc(j*13+1,0);
  80b22e:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  80b231:	89 d0                	mov    eax,edx
  80b233:	01 c0                	add    eax,eax
  80b235:	01 d0                	add    eax,edx
  80b237:	c1 e0 02             	shl    eax,0x2
  80b23a:	01 d0                	add    eax,edx
  80b23c:	83 c0 01             	add    eax,0x1
  80b23f:	be 00 00 00 00       	mov    esi,0x0
  80b244:	89 c7                	mov    edi,eax
  80b246:	b8 00 00 00 00       	mov    eax,0x0
  80b24b:	e8 f2 5f ff ff       	call   801242 <vmalloc>
  80b250:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
			memset(name,0,j*13+1);
  80b254:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  80b257:	89 d0                	mov    eax,edx
  80b259:	01 c0                	add    eax,eax
  80b25b:	01 d0                	add    eax,edx
  80b25d:	c1 e0 02             	shl    eax,0x2
  80b260:	01 d0                	add    eax,edx
  80b262:	83 c0 01             	add    eax,0x1
  80b265:	89 c2                	mov    edx,eax
  80b267:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b26b:	be 00 00 00 00       	mov    esi,0x0
  80b270:	48 89 c7             	mov    rdi,rax
  80b273:	e8 41 1d 00 00       	call   80cfb9 <memset>
			tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  80b278:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b27c:	48 83 e8 20          	sub    rax,0x20
  80b280:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

			for(x = 0;x<j;x++,tmpldentry --)
  80b284:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  80b28b:	e9 37 01 00 00       	jmp    80b3c7 <FAT32_readdir+0x45d>
			{
				for(y = 0;y<5;y++)
  80b290:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  80b297:	eb 53                	jmp    80b2ec <FAT32_readdir+0x382>
					if(tmpldentry->LDIR_Name1[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  80b299:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b29d:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80b2a0:	48 63 d2             	movsxd rdx,edx
  80b2a3:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80b2a8:	66 83 f8 ff          	cmp    ax,0xffff
  80b2ac:	74 3a                	je     80b2e8 <FAT32_readdir+0x37e>
  80b2ae:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b2b2:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80b2b5:	48 63 d2             	movsxd rdx,edx
  80b2b8:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80b2bd:	66 85 c0             	test   ax,ax
  80b2c0:	74 26                	je     80b2e8 <FAT32_readdir+0x37e>
						name[namelen++] = (char)tmpldentry->LDIR_Name1[y];
  80b2c2:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b2c6:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80b2c9:	48 63 d2             	movsxd rdx,edx
  80b2cc:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  80b2d1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b2d4:	8d 50 01             	lea    edx,[rax+0x1]
  80b2d7:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80b2da:	48 63 d0             	movsxd rdx,eax
  80b2dd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b2e1:	48 01 d0             	add    rax,rdx
  80b2e4:	89 ca                	mov    edx,ecx
  80b2e6:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<5;y++)
  80b2e8:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  80b2ec:	83 7d dc 04          	cmp    DWORD PTR [rbp-0x24],0x4
  80b2f0:	7e a7                	jle    80b299 <FAT32_readdir+0x32f>

				for(y = 0;y<6;y++)
  80b2f2:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  80b2f9:	eb 53                	jmp    80b34e <FAT32_readdir+0x3e4>
					if(tmpldentry->LDIR_Name2[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  80b2fb:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b2ff:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80b302:	48 63 d2             	movsxd rdx,edx
  80b305:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  80b30a:	66 83 f8 ff          	cmp    ax,0xffff
  80b30e:	74 3a                	je     80b34a <FAT32_readdir+0x3e0>
  80b310:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b314:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80b317:	48 63 d2             	movsxd rdx,edx
  80b31a:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80b31f:	66 85 c0             	test   ax,ax
  80b322:	74 26                	je     80b34a <FAT32_readdir+0x3e0>
						name[namelen++] = (char)tmpldentry->LDIR_Name2[y];
  80b324:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b328:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80b32b:	48 63 d2             	movsxd rdx,edx
  80b32e:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  80b333:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b336:	8d 50 01             	lea    edx,[rax+0x1]
  80b339:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80b33c:	48 63 d0             	movsxd rdx,eax
  80b33f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b343:	48 01 d0             	add    rax,rdx
  80b346:	89 ca                	mov    edx,ecx
  80b348:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<6;y++)
  80b34a:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  80b34e:	83 7d dc 05          	cmp    DWORD PTR [rbp-0x24],0x5
  80b352:	7e a7                	jle    80b2fb <FAT32_readdir+0x391>

				for(y = 0;y<2;y++)
  80b354:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  80b35b:	eb 5b                	jmp    80b3b8 <FAT32_readdir+0x44e>
					if(tmpldentry->LDIR_Name3[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  80b35d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b361:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80b364:	48 63 d2             	movsxd rdx,edx
  80b367:	48 83 c2 08          	add    rdx,0x8
  80b36b:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  80b370:	66 83 f8 ff          	cmp    ax,0xffff
  80b374:	74 3e                	je     80b3b4 <FAT32_readdir+0x44a>
  80b376:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b37a:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80b37d:	48 63 d2             	movsxd rdx,edx
  80b380:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80b385:	66 85 c0             	test   ax,ax
  80b388:	74 2a                	je     80b3b4 <FAT32_readdir+0x44a>
						name[namelen++] = (char)tmpldentry->LDIR_Name3[y];
  80b38a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b38e:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80b391:	48 63 d2             	movsxd rdx,edx
  80b394:	48 83 c2 08          	add    rdx,0x8
  80b398:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  80b39d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b3a0:	8d 50 01             	lea    edx,[rax+0x1]
  80b3a3:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80b3a6:	48 63 d0             	movsxd rdx,eax
  80b3a9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b3ad:	48 01 d0             	add    rax,rdx
  80b3b0:	89 ca                	mov    edx,ecx
  80b3b2:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<2;y++)
  80b3b4:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  80b3b8:	83 7d dc 01          	cmp    DWORD PTR [rbp-0x24],0x1
  80b3bc:	7e 9f                	jle    80b35d <FAT32_readdir+0x3f3>
			for(x = 0;x<j;x++,tmpldentry --)
  80b3be:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  80b3c2:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
  80b3c7:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80b3ca:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80b3cd:	0f 8c bd fe ff ff    	jl     80b290 <FAT32_readdir+0x326>
			}
			goto find_lookup_success;
  80b3d3:	e9 f5 01 00 00       	jmp    80b5cd <FAT32_readdir+0x663>
		}

		name = vmalloc(15,0);
  80b3d8:	be 00 00 00 00       	mov    esi,0x0
  80b3dd:	bf 0f 00 00 00       	mov    edi,0xf
  80b3e2:	b8 00 00 00 00       	mov    eax,0x0
  80b3e7:	e8 56 5e ff ff       	call   801242 <vmalloc>
  80b3ec:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
		memset(name,0,15);
  80b3f0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b3f4:	ba 0f 00 00 00       	mov    edx,0xf
  80b3f9:	be 00 00 00 00       	mov    esi,0x0
  80b3fe:	48 89 c7             	mov    rdi,rax
  80b401:	e8 b3 1b 00 00       	call   80cfb9 <memset>
		//short file/dir base name compare
		for(x=0;x<8;x++)
  80b406:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  80b40d:	eb 74                	jmp    80b483 <FAT32_readdir+0x519>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  80b40f:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80b413:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80b416:	48 98                	cdqe   
  80b418:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80b41c:	3c 20                	cmp    al,0x20
  80b41e:	74 6b                	je     80b48b <FAT32_readdir+0x521>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  80b420:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b424:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80b428:	0f b6 c0             	movzx  eax,al
  80b42b:	83 e0 08             	and    eax,0x8
  80b42e:	85 c0                	test   eax,eax
  80b430:	74 29                	je     80b45b <FAT32_readdir+0x4f1>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  80b432:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80b436:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80b439:	48 98                	cdqe   
  80b43b:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80b43f:	8d 48 20             	lea    ecx,[rax+0x20]
  80b442:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b445:	8d 50 01             	lea    edx,[rax+0x1]
  80b448:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80b44b:	48 63 d0             	movsxd rdx,eax
  80b44e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b452:	48 01 d0             	add    rax,rdx
  80b455:	89 ca                	mov    edx,ecx
  80b457:	88 10                	mov    BYTE PTR [rax],dl
  80b459:	eb 24                	jmp    80b47f <FAT32_readdir+0x515>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  80b45b:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80b45f:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80b462:	48 98                	cdqe   
  80b464:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  80b468:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b46b:	8d 50 01             	lea    edx,[rax+0x1]
  80b46e:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80b471:	48 63 d0             	movsxd rdx,eax
  80b474:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b478:	48 01 d0             	add    rax,rdx
  80b47b:	89 ca                	mov    edx,ecx
  80b47d:	88 10                	mov    BYTE PTR [rax],dl
		for(x=0;x<8;x++)
  80b47f:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  80b483:	83 7d e0 07          	cmp    DWORD PTR [rbp-0x20],0x7
  80b487:	7e 86                	jle    80b40f <FAT32_readdir+0x4a5>
  80b489:	eb 01                	jmp    80b48c <FAT32_readdir+0x522>
				break;
  80b48b:	90                   	nop
		}

		if(tmpdentry->DIR_Attr & ATTR_DIRECTORY)
  80b48c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b490:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80b494:	0f b6 c0             	movzx  eax,al
  80b497:	83 e0 10             	and    eax,0x10
  80b49a:	85 c0                	test   eax,eax
  80b49c:	0f 85 27 01 00 00    	jne    80b5c9 <FAT32_readdir+0x65f>
			goto find_lookup_success;

		name[namelen++] = '.';
  80b4a2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b4a5:	8d 50 01             	lea    edx,[rax+0x1]
  80b4a8:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80b4ab:	48 63 d0             	movsxd rdx,eax
  80b4ae:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b4b2:	48 01 d0             	add    rax,rdx
  80b4b5:	c6 00 2e             	mov    BYTE PTR [rax],0x2e

		//short file ext name compare
		for(x=8;x<11;x++)
  80b4b8:	c7 45 e0 08 00 00 00 	mov    DWORD PTR [rbp-0x20],0x8
  80b4bf:	eb 74                	jmp    80b535 <FAT32_readdir+0x5cb>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  80b4c1:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80b4c5:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80b4c8:	48 98                	cdqe   
  80b4ca:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80b4ce:	3c 20                	cmp    al,0x20
  80b4d0:	74 6b                	je     80b53d <FAT32_readdir+0x5d3>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  80b4d2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b4d6:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80b4da:	0f b6 c0             	movzx  eax,al
  80b4dd:	83 e0 10             	and    eax,0x10
  80b4e0:	85 c0                	test   eax,eax
  80b4e2:	74 29                	je     80b50d <FAT32_readdir+0x5a3>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  80b4e4:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80b4e8:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80b4eb:	48 98                	cdqe   
  80b4ed:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80b4f1:	8d 48 20             	lea    ecx,[rax+0x20]
  80b4f4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b4f7:	8d 50 01             	lea    edx,[rax+0x1]
  80b4fa:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80b4fd:	48 63 d0             	movsxd rdx,eax
  80b500:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b504:	48 01 d0             	add    rax,rdx
  80b507:	89 ca                	mov    edx,ecx
  80b509:	88 10                	mov    BYTE PTR [rax],dl
  80b50b:	eb 24                	jmp    80b531 <FAT32_readdir+0x5c7>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  80b50d:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80b511:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80b514:	48 98                	cdqe   
  80b516:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  80b51a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b51d:	8d 50 01             	lea    edx,[rax+0x1]
  80b520:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80b523:	48 63 d0             	movsxd rdx,eax
  80b526:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b52a:	48 01 d0             	add    rax,rdx
  80b52d:	89 ca                	mov    edx,ecx
  80b52f:	88 10                	mov    BYTE PTR [rax],dl
		for(x=8;x<11;x++)
  80b531:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  80b535:	83 7d e0 0a          	cmp    DWORD PTR [rbp-0x20],0xa
  80b539:	7e 86                	jle    80b4c1 <FAT32_readdir+0x557>
  80b53b:	eb 01                	jmp    80b53e <FAT32_readdir+0x5d4>
				break;
  80b53d:	90                   	nop
		}
		if(x == 8)
  80b53e:	83 7d e0 08          	cmp    DWORD PTR [rbp-0x20],0x8
  80b542:	0f 85 84 00 00 00    	jne    80b5cc <FAT32_readdir+0x662>
			name[--namelen] = 0;
  80b548:	83 6d ec 01          	sub    DWORD PTR [rbp-0x14],0x1
  80b54c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b54f:	48 63 d0             	movsxd rdx,eax
  80b552:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b556:	48 01 d0             	add    rax,rdx
  80b559:	c6 00 00             	mov    BYTE PTR [rax],0x0
		goto find_lookup_success;
  80b55c:	eb 6e                	jmp    80b5cc <FAT32_readdir+0x662>
			continue;
  80b55e:	90                   	nop
  80b55f:	eb 01                	jmp    80b562 <FAT32_readdir+0x5f8>
			continue;
  80b561:	90                   	nop
	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  80b562:	83 45 e8 20          	add    DWORD PTR [rbp-0x18],0x20
  80b566:	48 83 45 d0 20       	add    QWORD PTR [rbp-0x30],0x20
  80b56b:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80b56f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b572:	48 8d 50 20          	lea    rdx,[rax+0x20]
  80b576:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80b57a:	48 89 10             	mov    QWORD PTR [rax],rdx
  80b57d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80b580:	48 63 d0             	movsxd rdx,eax
  80b583:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b587:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80b58b:	48 39 c2             	cmp    rdx,rax
  80b58e:	0f 8c ba fb ff ff    	jl     80b14e <FAT32_readdir+0x1e4>
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80b594:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80b597:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80b59b:	89 d6                	mov    esi,edx
  80b59d:	48 89 c7             	mov    rdi,rax
  80b5a0:	e8 b0 ee ff ff       	call   80a455 <DISK1_FAT32_read_FAT_Entry>
  80b5a5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  80b5a8:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  80b5af:	77 05                	ja     80b5b6 <FAT32_readdir+0x64c>
		goto next_cluster;
  80b5b1:	e9 d5 fa ff ff       	jmp    80b08b <FAT32_readdir+0x121>

	vmfree(buf);
  80b5b6:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80b5ba:	48 89 c7             	mov    rdi,rax
  80b5bd:	e8 0f 5d ff ff       	call   8012d1 <vmfree>
	return NULL;
  80b5c2:	b8 00 00 00 00       	mov    eax,0x0
  80b5c7:	eb 3b                	jmp    80b604 <FAT32_readdir+0x69a>
			goto find_lookup_success;
  80b5c9:	90                   	nop
  80b5ca:	eb 01                	jmp    80b5cd <FAT32_readdir+0x663>
		goto find_lookup_success;
  80b5cc:	90                   	nop

find_lookup_success:

	filp->position += 32;
  80b5cd:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80b5d1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b5d4:	48 8d 50 20          	lea    rdx,[rax+0x20]
  80b5d8:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80b5dc:	48 89 10             	mov    QWORD PTR [rax],rdx
	return filler(dirent,name,namelen,0,0);
  80b5df:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b5e2:	48 63 d0             	movsxd rdx,eax
  80b5e5:	48 8b 75 f0          	mov    rsi,QWORD PTR [rbp-0x10]
  80b5e9:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80b5ed:	4c 8b 4d 88          	mov    r9,QWORD PTR [rbp-0x78]
  80b5f1:	41 b8 00 00 00 00    	mov    r8d,0x0
  80b5f7:	b9 00 00 00 00       	mov    ecx,0x0
  80b5fc:	48 89 c7             	mov    rdi,rax
  80b5ff:	41 ff d1             	call   r9
  80b602:	48 98                	cdqe   
}
  80b604:	c9                   	leave  
  80b605:	c3                   	ret    

000000000080b606 <FAT32_create>:
	.readdir = FAT32_readdir,
};


long FAT32_create(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  80b606:	f3 0f 1e fa          	endbr64 
  80b60a:	55                   	push   rbp
  80b60b:	48 89 e5             	mov    rbp,rsp
  80b60e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80b612:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80b616:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80b619:	90                   	nop
  80b61a:	5d                   	pop    rbp
  80b61b:	c3                   	ret    

000000000080b61c <FAT32_lookup>:


struct dir_entry * FAT32_lookup(struct index_node * parent_inode,struct dir_entry * dest_dentry)
{
  80b61c:	f3 0f 1e fa          	endbr64 
  80b620:	55                   	push   rbp
  80b621:	48 89 e5             	mov    rbp,rsp
  80b624:	48 83 ec 60          	sub    rsp,0x60
  80b628:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  80b62c:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
	struct FAT32_inode_info * finode = parent_inode->private_index_info;
  80b630:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80b634:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b638:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	struct FAT32_sb_info * fsbi = parent_inode->sb->private_sb_info;
  80b63c:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80b640:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80b644:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80b648:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	unsigned int cluster = 0;
  80b64c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  80b653:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  80b65a:	00 
	unsigned char * buf =NULL; 
  80b65b:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  80b662:	00 
	int i = 0,j = 0,x = 0;
  80b663:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80b66a:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80b671:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  80b678:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80b67f:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  80b680:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80b687:	00 
	struct index_node * p = NULL;
  80b688:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  80b68f:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  80b690:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b694:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80b698:	be 00 00 00 00       	mov    esi,0x0
  80b69d:	48 89 c7             	mov    rdi,rax
  80b6a0:	b8 00 00 00 00       	mov    eax,0x0
  80b6a5:	e8 98 5b ff ff       	call   801242 <vmalloc>
  80b6aa:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax

	cluster = finode->first_cluster;
  80b6ae:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80b6b2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b6b5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

next_cluster:
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  80b6b8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b6bc:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  80b6c0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b6c3:	83 e8 02             	sub    eax,0x2
  80b6c6:	89 c1                	mov    ecx,eax
  80b6c8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b6cc:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80b6d0:	48 0f af c1          	imul   rax,rcx
  80b6d4:	48 01 d0             	add    rax,rdx
  80b6d7:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
	printf("lookup cluster:0x%x,sector:0x%x\r\n",cluster,sector);
  80b6db:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80b6df:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b6e2:	89 c6                	mov    esi,eax
  80b6e4:	bf 18 5c 81 00       	mov    edi,0x815c18
  80b6e9:	b8 00 00 00 00       	mov    eax,0x0
  80b6ee:	e8 79 56 ff ff       	call   800d6c <printf>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80b6f3:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b6f7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80b6fb:	89 c1                	mov    ecx,eax
  80b6fd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80b701:	89 c2                	mov    edx,eax
  80b703:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80b707:	49 89 c0             	mov    r8,rax
  80b70a:	be 00 00 00 00       	mov    esi,0x0
  80b70f:	bf 00 00 00 00       	mov    edi,0x0
  80b714:	e8 8e e0 ff ff       	call   8097a7 <request>
  80b719:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    if(!chk_result(r))
  80b71c:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80b71f:	89 c7                	mov    edi,eax
  80b721:	e8 35 e7 ff ff       	call   809e5b <chk_result>
  80b726:	85 c0                	test   eax,eax
  80b728:	75 25                	jne    80b74f <FAT32_lookup+0x133>
	{
		printf("FAT32 FS(lookup) read disk ERROR!!!!!!!!!!\n");
  80b72a:	bf 40 5c 81 00       	mov    edi,0x815c40
  80b72f:	b8 00 00 00 00       	mov    eax,0x0
  80b734:	e8 33 56 ff ff       	call   800d6c <printf>
		vmfree(buf);
  80b739:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80b73d:	48 89 c7             	mov    rdi,rax
  80b740:	e8 8c 5b ff ff       	call   8012d1 <vmfree>
		return NULL;
  80b745:	b8 00 00 00 00       	mov    eax,0x0
  80b74a:	e9 f0 07 00 00       	jmp    80bf3f <FAT32_lookup+0x923>
	}

	tmpdentry = (struct FAT32_Directory *)buf;
  80b74f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80b753:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax

	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  80b757:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80b75e:	e9 9d 05 00 00       	jmp    80bd00 <FAT32_lookup+0x6e4>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  80b763:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b767:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80b76b:	3c 0f                	cmp    al,0xf
  80b76d:	0f 84 59 05 00 00    	je     80bccc <FAT32_lookup+0x6b0>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  80b773:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b777:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b77a:	3c e5                	cmp    al,0xe5
  80b77c:	0f 84 4d 05 00 00    	je     80bccf <FAT32_lookup+0x6b3>
  80b782:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b786:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b789:	84 c0                	test   al,al
  80b78b:	0f 84 3e 05 00 00    	je     80bccf <FAT32_lookup+0x6b3>
  80b791:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b795:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b798:	3c 05                	cmp    al,0x5
  80b79a:	0f 84 2f 05 00 00    	je     80bccf <FAT32_lookup+0x6b3>
			continue;

		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  80b7a0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b7a4:	48 83 e8 20          	sub    rax,0x20
  80b7a8:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
		j = 0;
  80b7ac:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0

		//long file/dir name compare
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  80b7b3:	e9 88 01 00 00       	jmp    80b940 <FAT32_lookup+0x324>
		{
			for(x=0;x<5;x++)
  80b7b8:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80b7bf:	eb 6a                	jmp    80b82b <FAT32_lookup+0x20f>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name1[x] == 0xffff)
  80b7c1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b7c5:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b7c8:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b7cb:	7e 15                	jle    80b7e2 <FAT32_lookup+0x1c6>
  80b7cd:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b7d1:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80b7d4:	48 63 d2             	movsxd rdx,edx
  80b7d7:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80b7dc:	66 83 f8 ff          	cmp    ax,0xffff
  80b7e0:	74 44                	je     80b826 <FAT32_lookup+0x20a>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name1[x] != (unsigned short)(dest_dentry->name[j++]))
  80b7e2:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b7e6:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b7e9:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b7ec:	0f 8f e0 04 00 00    	jg     80bcd2 <FAT32_lookup+0x6b6>
  80b7f2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b7f6:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80b7f9:	48 63 d2             	movsxd rdx,edx
  80b7fc:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  80b801:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b805:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  80b808:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b80b:	8d 50 01             	lea    edx,[rax+0x1]
  80b80e:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  80b811:	48 98                	cdqe   
  80b813:	48 01 f0             	add    rax,rsi
  80b816:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b819:	66 98                	cbw    
  80b81b:	66 39 c1             	cmp    cx,ax
  80b81e:	0f 85 ae 04 00 00    	jne    80bcd2 <FAT32_lookup+0x6b6>
  80b824:	eb 01                	jmp    80b827 <FAT32_lookup+0x20b>
					continue;
  80b826:	90                   	nop
			for(x=0;x<5;x++)
  80b827:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80b82b:	83 7d f0 04          	cmp    DWORD PTR [rbp-0x10],0x4
  80b82f:	7e 90                	jle    80b7c1 <FAT32_lookup+0x1a5>
					goto continue_cmp_fail;
			}
			for(x=0;x<6;x++)
  80b831:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80b838:	eb 6a                	jmp    80b8a4 <FAT32_lookup+0x288>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name2[x] == 0xffff)
  80b83a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b83e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b841:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b844:	7e 15                	jle    80b85b <FAT32_lookup+0x23f>
  80b846:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b84a:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80b84d:	48 63 d2             	movsxd rdx,edx
  80b850:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  80b855:	66 83 f8 ff          	cmp    ax,0xffff
  80b859:	74 44                	je     80b89f <FAT32_lookup+0x283>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name2[x] != (unsigned short)(dest_dentry->name[j++]))
  80b85b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b85f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b862:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b865:	0f 8f 6a 04 00 00    	jg     80bcd5 <FAT32_lookup+0x6b9>
  80b86b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b86f:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80b872:	48 63 d2             	movsxd rdx,edx
  80b875:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  80b87a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b87e:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  80b881:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b884:	8d 50 01             	lea    edx,[rax+0x1]
  80b887:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  80b88a:	48 98                	cdqe   
  80b88c:	48 01 f0             	add    rax,rsi
  80b88f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b892:	66 98                	cbw    
  80b894:	66 39 c1             	cmp    cx,ax
  80b897:	0f 85 38 04 00 00    	jne    80bcd5 <FAT32_lookup+0x6b9>
  80b89d:	eb 01                	jmp    80b8a0 <FAT32_lookup+0x284>
					continue;
  80b89f:	90                   	nop
			for(x=0;x<6;x++)
  80b8a0:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80b8a4:	83 7d f0 05          	cmp    DWORD PTR [rbp-0x10],0x5
  80b8a8:	7e 90                	jle    80b83a <FAT32_lookup+0x21e>
					goto continue_cmp_fail;
			}
			for(x=0;x<2;x++)
  80b8aa:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80b8b1:	eb 72                	jmp    80b925 <FAT32_lookup+0x309>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name3[x] == 0xffff)
  80b8b3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b8b7:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b8ba:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b8bd:	7e 19                	jle    80b8d8 <FAT32_lookup+0x2bc>
  80b8bf:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b8c3:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80b8c6:	48 63 d2             	movsxd rdx,edx
  80b8c9:	48 83 c2 08          	add    rdx,0x8
  80b8cd:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  80b8d2:	66 83 f8 ff          	cmp    ax,0xffff
  80b8d6:	74 48                	je     80b920 <FAT32_lookup+0x304>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name3[x] != (unsigned short)(dest_dentry->name[j++]))
  80b8d8:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b8dc:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b8df:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b8e2:	0f 8f f0 03 00 00    	jg     80bcd8 <FAT32_lookup+0x6bc>
  80b8e8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b8ec:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80b8ef:	48 63 d2             	movsxd rdx,edx
  80b8f2:	48 83 c2 08          	add    rdx,0x8
  80b8f6:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  80b8fb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b8ff:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  80b902:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b905:	8d 50 01             	lea    edx,[rax+0x1]
  80b908:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  80b90b:	48 98                	cdqe   
  80b90d:	48 01 f0             	add    rax,rsi
  80b910:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b913:	66 98                	cbw    
  80b915:	66 39 c1             	cmp    cx,ax
  80b918:	0f 85 ba 03 00 00    	jne    80bcd8 <FAT32_lookup+0x6bc>
  80b91e:	eb 01                	jmp    80b921 <FAT32_lookup+0x305>
					continue;
  80b920:	90                   	nop
			for(x=0;x<2;x++)
  80b921:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80b925:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  80b929:	7e 88                	jle    80b8b3 <FAT32_lookup+0x297>
					goto continue_cmp_fail;
			}

			if(j >= dest_dentry->name_length)
  80b92b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b92f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b932:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80b935:	0f 8d 14 04 00 00    	jge    80bd4f <FAT32_lookup+0x733>
			{
				goto find_lookup_success;
			}

			tmpldentry --;
  80b93b:	48 83 6d e0 20       	sub    QWORD PTR [rbp-0x20],0x20
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  80b940:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b944:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80b948:	3c 0f                	cmp    al,0xf
  80b94a:	75 0f                	jne    80b95b <FAT32_lookup+0x33f>
  80b94c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b950:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b953:	3c e5                	cmp    al,0xe5
  80b955:	0f 85 5d fe ff ff    	jne    80b7b8 <FAT32_lookup+0x19c>
		}

		//short file/dir base name compare
		j = 0;
  80b95b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
		for(x=0;x<8;x++)
  80b962:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80b969:	e9 f4 01 00 00       	jmp    80bb62 <FAT32_lookup+0x546>
		{
			switch(tmpdentry->DIR_Name[x])
  80b96e:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80b972:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80b975:	48 98                	cdqe   
  80b977:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80b97b:	0f b6 c0             	movzx  eax,al
  80b97e:	83 f8 7a             	cmp    eax,0x7a
  80b981:	0f 8f d0 01 00 00    	jg     80bb57 <FAT32_lookup+0x53b>
  80b987:	83 f8 61             	cmp    eax,0x61
  80b98a:	0f 8d e6 00 00 00    	jge    80ba76 <FAT32_lookup+0x45a>
  80b990:	83 f8 5a             	cmp    eax,0x5a
  80b993:	0f 8f be 01 00 00    	jg     80bb57 <FAT32_lookup+0x53b>
  80b999:	83 f8 41             	cmp    eax,0x41
  80b99c:	0f 8d d4 00 00 00    	jge    80ba76 <FAT32_lookup+0x45a>
  80b9a2:	83 f8 20             	cmp    eax,0x20
  80b9a5:	74 1a                	je     80b9c1 <FAT32_lookup+0x3a5>
  80b9a7:	83 f8 20             	cmp    eax,0x20
  80b9aa:	0f 8c a7 01 00 00    	jl     80bb57 <FAT32_lookup+0x53b>
  80b9b0:	83 e8 30             	sub    eax,0x30
  80b9b3:	83 f8 09             	cmp    eax,0x9
  80b9b6:	0f 87 9b 01 00 00    	ja     80bb57 <FAT32_lookup+0x53b>
  80b9bc:	e9 53 01 00 00       	jmp    80bb14 <FAT32_lookup+0x4f8>
			{
				case ' ':
					if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  80b9c1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b9c5:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80b9c9:	0f b6 c0             	movzx  eax,al
  80b9cc:	83 e0 10             	and    eax,0x10
  80b9cf:	85 c0                	test   eax,eax
  80b9d1:	75 50                	jne    80ba23 <FAT32_lookup+0x407>
					{
						if(dest_dentry->name[j]=='.')
  80b9d3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80b9d7:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80b9da:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b9dd:	48 98                	cdqe   
  80b9df:	48 01 d0             	add    rax,rdx
  80b9e2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b9e5:	3c 2e                	cmp    al,0x2e
  80b9e7:	0f 84 70 01 00 00    	je     80bb5d <FAT32_lookup+0x541>
							continue;
						else if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80b9ed:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80b9f1:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80b9f4:	48 98                	cdqe   
  80b9f6:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80b9fa:	0f b6 d0             	movzx  edx,al
  80b9fd:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ba01:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80ba04:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80ba07:	48 98                	cdqe   
  80ba09:	48 01 c8             	add    rax,rcx
  80ba0c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ba0f:	0f be c0             	movsx  eax,al
  80ba12:	39 c2                	cmp    edx,eax
  80ba14:	0f 85 c1 02 00 00    	jne    80bcdb <FAT32_lookup+0x6bf>
						{
							j++;
  80ba1a:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80ba1e:	e9 3b 01 00 00       	jmp    80bb5e <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80ba23:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ba27:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80ba2a:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80ba2d:	7d 32                	jge    80ba61 <FAT32_lookup+0x445>
  80ba2f:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80ba33:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80ba36:	48 98                	cdqe   
  80ba38:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80ba3c:	0f b6 d0             	movzx  edx,al
  80ba3f:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ba43:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80ba46:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80ba49:	48 98                	cdqe   
  80ba4b:	48 01 c8             	add    rax,rcx
  80ba4e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ba51:	0f be c0             	movsx  eax,al
  80ba54:	39 c2                	cmp    edx,eax
  80ba56:	75 09                	jne    80ba61 <FAT32_lookup+0x445>
						{
							j++;
  80ba58:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80ba5c:	e9 fd 00 00 00       	jmp    80bb5e <FAT32_lookup+0x542>
						}
						else if(j == dest_dentry->name_length)
  80ba61:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ba65:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80ba68:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80ba6b:	0f 85 6d 02 00 00    	jne    80bcde <FAT32_lookup+0x6c2>
							continue;
  80ba71:	e9 e8 00 00 00       	jmp    80bb5e <FAT32_lookup+0x542>
							goto continue_cmp_fail;
					}

				case 'A' ... 'Z':
				case 'a' ... 'z':
					if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  80ba76:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ba7a:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80ba7e:	0f b6 c0             	movzx  eax,al
  80ba81:	83 e0 08             	and    eax,0x8
  80ba84:	85 c0                	test   eax,eax
  80ba86:	74 49                	je     80bad1 <FAT32_lookup+0x4b5>
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  80ba88:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80ba8c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80ba8f:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80ba92:	0f 8d 49 02 00 00    	jge    80bce1 <FAT32_lookup+0x6c5>
  80ba98:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80ba9c:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80ba9f:	48 98                	cdqe   
  80baa1:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80baa5:	0f b6 c0             	movzx  eax,al
  80baa8:	8d 50 20             	lea    edx,[rax+0x20]
  80baab:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80baaf:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80bab2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80bab5:	48 98                	cdqe   
  80bab7:	48 01 c8             	add    rax,rcx
  80baba:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80babd:	0f be c0             	movsx  eax,al
  80bac0:	39 c2                	cmp    edx,eax
  80bac2:	0f 85 19 02 00 00    	jne    80bce1 <FAT32_lookup+0x6c5>
						{
							j++;
  80bac8:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80bacc:	e9 8d 00 00 00       	jmp    80bb5e <FAT32_lookup+0x542>
						}
						else
							goto continue_cmp_fail;
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80bad1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80bad5:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80bad8:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80badb:	0f 8d 03 02 00 00    	jge    80bce4 <FAT32_lookup+0x6c8>
  80bae1:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80bae5:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80bae8:	48 98                	cdqe   
  80baea:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80baee:	0f b6 d0             	movzx  edx,al
  80baf1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80baf5:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80baf8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80bafb:	48 98                	cdqe   
  80bafd:	48 01 c8             	add    rax,rcx
  80bb00:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bb03:	0f be c0             	movsx  eax,al
  80bb06:	39 c2                	cmp    edx,eax
  80bb08:	0f 85 d6 01 00 00    	jne    80bce4 <FAT32_lookup+0x6c8>
						{
							j++;
  80bb0e:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80bb12:	eb 4a                	jmp    80bb5e <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}

				case '0' ... '9':
					if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80bb14:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80bb18:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80bb1b:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80bb1e:	0f 8d c3 01 00 00    	jge    80bce7 <FAT32_lookup+0x6cb>
  80bb24:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80bb28:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80bb2b:	48 98                	cdqe   
  80bb2d:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80bb31:	0f b6 d0             	movzx  edx,al
  80bb34:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80bb38:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80bb3b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80bb3e:	48 98                	cdqe   
  80bb40:	48 01 c8             	add    rax,rcx
  80bb43:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bb46:	0f be c0             	movsx  eax,al
  80bb49:	39 c2                	cmp    edx,eax
  80bb4b:	0f 85 96 01 00 00    	jne    80bce7 <FAT32_lookup+0x6cb>
					{
						j++;
  80bb51:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
						break;
  80bb55:	eb 07                	jmp    80bb5e <FAT32_lookup+0x542>
					}
					else
						goto continue_cmp_fail;

				default :
					j++;
  80bb57:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
					break;
  80bb5b:	eb 01                	jmp    80bb5e <FAT32_lookup+0x542>
							continue;
  80bb5d:	90                   	nop
		for(x=0;x<8;x++)
  80bb5e:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80bb62:	83 7d f0 07          	cmp    DWORD PTR [rbp-0x10],0x7
  80bb66:	0f 8e 02 fe ff ff    	jle    80b96e <FAT32_lookup+0x352>
			}
		}
		//short file ext name compare
		if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  80bb6c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bb70:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80bb74:	0f b6 c0             	movzx  eax,al
  80bb77:	83 e0 10             	and    eax,0x10
  80bb7a:	85 c0                	test   eax,eax
  80bb7c:	0f 85 d0 01 00 00    	jne    80bd52 <FAT32_lookup+0x736>
		{
			j++;
  80bb82:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
			for(x=8;x<11;x++)
  80bb86:	c7 45 f0 08 00 00 00 	mov    DWORD PTR [rbp-0x10],0x8
  80bb8d:	e9 2b 01 00 00       	jmp    80bcbd <FAT32_lookup+0x6a1>
			{
				switch(tmpdentry->DIR_Name[x])
  80bb92:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80bb96:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80bb99:	48 98                	cdqe   
  80bb9b:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80bb9f:	0f b6 c0             	movzx  eax,al
  80bba2:	83 f8 7a             	cmp    eax,0x7a
  80bba5:	0f 8f 3f 01 00 00    	jg     80bcea <FAT32_lookup+0x6ce>
  80bbab:	83 f8 61             	cmp    eax,0x61
  80bbae:	7d 2e                	jge    80bbde <FAT32_lookup+0x5c2>
  80bbb0:	83 f8 5a             	cmp    eax,0x5a
  80bbb3:	0f 8f 31 01 00 00    	jg     80bcea <FAT32_lookup+0x6ce>
  80bbb9:	83 f8 41             	cmp    eax,0x41
  80bbbc:	7d 20                	jge    80bbde <FAT32_lookup+0x5c2>
  80bbbe:	83 f8 20             	cmp    eax,0x20
  80bbc1:	0f 84 c4 00 00 00    	je     80bc8b <FAT32_lookup+0x66f>
  80bbc7:	83 f8 20             	cmp    eax,0x20
  80bbca:	0f 8c 1a 01 00 00    	jl     80bcea <FAT32_lookup+0x6ce>
  80bbd0:	83 e8 30             	sub    eax,0x30
  80bbd3:	83 f8 09             	cmp    eax,0x9
  80bbd6:	0f 87 0e 01 00 00    	ja     80bcea <FAT32_lookup+0x6ce>
  80bbdc:	eb 7e                	jmp    80bc5c <FAT32_lookup+0x640>
				{
					case 'A' ... 'Z':
					case 'a' ... 'z':
						if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  80bbde:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bbe2:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80bbe6:	0f b6 c0             	movzx  eax,al
  80bbe9:	83 e0 10             	and    eax,0x10
  80bbec:	85 c0                	test   eax,eax
  80bbee:	74 39                	je     80bc29 <FAT32_lookup+0x60d>
							if(tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  80bbf0:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80bbf4:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80bbf7:	48 98                	cdqe   
  80bbf9:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80bbfd:	0f b6 c0             	movzx  eax,al
  80bc00:	8d 50 20             	lea    edx,[rax+0x20]
  80bc03:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80bc07:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80bc0a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80bc0d:	48 98                	cdqe   
  80bc0f:	48 01 c8             	add    rax,rcx
  80bc12:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bc15:	0f be c0             	movsx  eax,al
  80bc18:	39 c2                	cmp    edx,eax
  80bc1a:	0f 85 cd 00 00 00    	jne    80bced <FAT32_lookup+0x6d1>
							{
								j++;
  80bc20:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  80bc24:	e9 90 00 00 00       	jmp    80bcb9 <FAT32_lookup+0x69d>
							}
							else
								goto continue_cmp_fail;
						else
						{
							if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80bc29:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80bc2d:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80bc30:	48 98                	cdqe   
  80bc32:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80bc36:	0f b6 d0             	movzx  edx,al
  80bc39:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80bc3d:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80bc40:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80bc43:	48 98                	cdqe   
  80bc45:	48 01 c8             	add    rax,rcx
  80bc48:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bc4b:	0f be c0             	movsx  eax,al
  80bc4e:	39 c2                	cmp    edx,eax
  80bc50:	0f 85 9a 00 00 00    	jne    80bcf0 <FAT32_lookup+0x6d4>
							{
								j++;
  80bc56:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  80bc5a:	eb 5d                	jmp    80bcb9 <FAT32_lookup+0x69d>
							else
								goto continue_cmp_fail;
						}

					case '0' ... '9':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80bc5c:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80bc60:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80bc63:	48 98                	cdqe   
  80bc65:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80bc69:	0f b6 d0             	movzx  edx,al
  80bc6c:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80bc70:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80bc73:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80bc76:	48 98                	cdqe   
  80bc78:	48 01 c8             	add    rax,rcx
  80bc7b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bc7e:	0f be c0             	movsx  eax,al
  80bc81:	39 c2                	cmp    edx,eax
  80bc83:	75 6e                	jne    80bcf3 <FAT32_lookup+0x6d7>
						{
							j++;
  80bc85:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80bc89:	eb 2e                	jmp    80bcb9 <FAT32_lookup+0x69d>
						}
						else
							goto continue_cmp_fail;

					case ' ':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80bc8b:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80bc8f:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80bc92:	48 98                	cdqe   
  80bc94:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80bc98:	0f b6 d0             	movzx  edx,al
  80bc9b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80bc9f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80bca2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80bca5:	48 98                	cdqe   
  80bca7:	48 01 c8             	add    rax,rcx
  80bcaa:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bcad:	0f be c0             	movsx  eax,al
  80bcb0:	39 c2                	cmp    edx,eax
  80bcb2:	75 42                	jne    80bcf6 <FAT32_lookup+0x6da>
						{
							j++;
  80bcb4:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80bcb8:	90                   	nop
			for(x=8;x<11;x++)
  80bcb9:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80bcbd:	83 7d f0 0a          	cmp    DWORD PTR [rbp-0x10],0xa
  80bcc1:	0f 8e cb fe ff ff    	jle    80bb92 <FAT32_lookup+0x576>
					default :
						goto continue_cmp_fail;
				}
			}
		}
		goto find_lookup_success;
  80bcc7:	e9 86 00 00 00       	jmp    80bd52 <FAT32_lookup+0x736>
			continue;
  80bccc:	90                   	nop
  80bccd:	eb 28                	jmp    80bcf7 <FAT32_lookup+0x6db>
			continue;
  80bccf:	90                   	nop
  80bcd0:	eb 25                	jmp    80bcf7 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80bcd2:	90                   	nop
  80bcd3:	eb 22                	jmp    80bcf7 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80bcd5:	90                   	nop
  80bcd6:	eb 1f                	jmp    80bcf7 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80bcd8:	90                   	nop
  80bcd9:	eb 1c                	jmp    80bcf7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80bcdb:	90                   	nop
  80bcdc:	eb 19                	jmp    80bcf7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80bcde:	90                   	nop
  80bcdf:	eb 16                	jmp    80bcf7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80bce1:	90                   	nop
  80bce2:	eb 13                	jmp    80bcf7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80bce4:	90                   	nop
  80bce5:	eb 10                	jmp    80bcf7 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  80bce7:	90                   	nop
  80bce8:	eb 0d                	jmp    80bcf7 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  80bcea:	90                   	nop
  80bceb:	eb 0a                	jmp    80bcf7 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  80bced:	90                   	nop
  80bcee:	eb 07                	jmp    80bcf7 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  80bcf0:	90                   	nop
  80bcf1:	eb 04                	jmp    80bcf7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80bcf3:	90                   	nop
  80bcf4:	eb 01                	jmp    80bcf7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80bcf6:	90                   	nop
	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  80bcf7:	83 45 f8 20          	add    DWORD PTR [rbp-0x8],0x20
  80bcfb:	48 83 45 e8 20       	add    QWORD PTR [rbp-0x18],0x20
  80bd00:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80bd03:	48 63 d0             	movsxd rdx,eax
  80bd06:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80bd0a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80bd0e:	48 39 c2             	cmp    rdx,rax
  80bd11:	0f 8c 4c fa ff ff    	jl     80b763 <FAT32_lookup+0x147>

continue_cmp_fail:;
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80bd17:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80bd1a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80bd1e:	89 d6                	mov    esi,edx
  80bd20:	48 89 c7             	mov    rdi,rax
  80bd23:	e8 2d e7 ff ff       	call   80a455 <DISK1_FAT32_read_FAT_Entry>
  80bd28:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  80bd2b:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  80bd32:	77 05                	ja     80bd39 <FAT32_lookup+0x71d>
		goto next_cluster;
  80bd34:	e9 7f f9 ff ff       	jmp    80b6b8 <FAT32_lookup+0x9c>

	vmfree(buf);
  80bd39:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80bd3d:	48 89 c7             	mov    rdi,rax
  80bd40:	e8 8c 55 ff ff       	call   8012d1 <vmfree>
	return NULL;
  80bd45:	b8 00 00 00 00       	mov    eax,0x0
  80bd4a:	e9 f0 01 00 00       	jmp    80bf3f <FAT32_lookup+0x923>
				goto find_lookup_success;
  80bd4f:	90                   	nop
  80bd50:	eb 01                	jmp    80bd53 <FAT32_lookup+0x737>
		goto find_lookup_success;
  80bd52:	90                   	nop

find_lookup_success:
	p = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  80bd53:	be 00 00 00 00       	mov    esi,0x0
  80bd58:	bf 38 00 00 00       	mov    edi,0x38
  80bd5d:	b8 00 00 00 00       	mov    eax,0x0
  80bd62:	e8 db 54 ff ff       	call   801242 <vmalloc>
  80bd67:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
	memset(p,0,sizeof(struct index_node));
  80bd6b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80bd6f:	ba 38 00 00 00       	mov    edx,0x38
  80bd74:	be 00 00 00 00       	mov    esi,0x0
  80bd79:	48 89 c7             	mov    rdi,rax
  80bd7c:	e8 38 12 00 00       	call   80cfb9 <memset>
	p->file_size = tmpdentry->DIR_FileSize;
  80bd81:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bd85:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  80bd88:	89 c2                	mov    edx,eax
  80bd8a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80bd8e:	48 89 10             	mov    QWORD PTR [rax],rdx
	p->blocks = (p->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  80bd91:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80bd95:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80bd98:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80bd9c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80bda0:	48 01 d0             	add    rax,rdx
  80bda3:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  80bda7:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80bdab:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80bdaf:	48 89 c1             	mov    rcx,rax
  80bdb2:	48 89 d0             	mov    rax,rdx
  80bdb5:	ba 00 00 00 00       	mov    edx,0x0
  80bdba:	48 f7 f1             	div    rcx
  80bdbd:	48 89 c2             	mov    rdx,rax
  80bdc0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80bdc4:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	p->attribute = (tmpdentry->DIR_Attr & ATTR_DIRECTORY) ? FS_ATTR_DIR : FS_ATTR_FILE;
  80bdc8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bdcc:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80bdd0:	0f b6 c0             	movzx  eax,al
  80bdd3:	83 e0 10             	and    eax,0x10
  80bdd6:	85 c0                	test   eax,eax
  80bdd8:	74 07                	je     80bde1 <FAT32_lookup+0x7c5>
  80bdda:	ba 02 00 00 00       	mov    edx,0x2
  80bddf:	eb 05                	jmp    80bde6 <FAT32_lookup+0x7ca>
  80bde1:	ba 01 00 00 00       	mov    edx,0x1
  80bde6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80bdea:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	p->sb = parent_inode->sb;
  80bdee:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80bdf2:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  80bdf6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80bdfa:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	p->f_ops = &FAT32_file_ops;
  80bdfe:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80be02:	48 c7 40 20 00 dc 80 	mov    QWORD PTR [rax+0x20],0x80dc00
  80be09:	00 
	p->inode_ops = &FAT32_inode_ops;
  80be0a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80be0e:	48 c7 40 28 40 dc 80 	mov    QWORD PTR [rax+0x28],0x80dc40
  80be15:	00 

	p->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  80be16:	be 00 00 00 00       	mov    esi,0x0
  80be1b:	bf 20 00 00 00       	mov    edi,0x20
  80be20:	b8 00 00 00 00       	mov    eax,0x0
  80be25:	e8 18 54 ff ff       	call   801242 <vmalloc>
  80be2a:	48 89 c2             	mov    rdx,rax
  80be2d:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80be31:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(p->private_index_info,0,sizeof(struct FAT32_inode_info));
  80be35:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80be39:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80be3d:	ba 20 00 00 00       	mov    edx,0x20
  80be42:	be 00 00 00 00       	mov    esi,0x0
  80be47:	48 89 c7             	mov    rdi,rax
  80be4a:	e8 6a 11 00 00       	call   80cfb9 <memset>
	finode = p->private_index_info;
  80be4f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80be53:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80be57:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax

	finode->first_cluster = (tmpdentry->DIR_FstClusHI<< 16 | tmpdentry->DIR_FstClusLO) & 0x0fffffff;
  80be5b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80be5f:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80be63:	0f b7 c0             	movzx  eax,ax
  80be66:	c1 e0 10             	shl    eax,0x10
  80be69:	89 c2                	mov    edx,eax
  80be6b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80be6f:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  80be73:	0f b7 c0             	movzx  eax,ax
  80be76:	09 d0                	or     eax,edx
  80be78:	48 98                	cdqe   
  80be7a:	25 ff ff ff 0f       	and    eax,0xfffffff
  80be7f:	48 89 c2             	mov    rdx,rax
  80be82:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80be86:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = cluster;
  80be89:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80be8c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80be90:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	finode->dentry_position = tmpdentry - (struct FAT32_Directory *)buf;
  80be94:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80be98:	48 2b 45 c0          	sub    rax,QWORD PTR [rbp-0x40]
  80be9c:	48 c1 f8 05          	sar    rax,0x5
  80bea0:	48 89 c2             	mov    rdx,rax
  80bea3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80bea7:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	finode->create_date = tmpdentry->DIR_CrtTime;
  80beab:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80beaf:	0f b7 50 0e          	movzx  edx,WORD PTR [rax+0xe]
  80beb3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80beb7:	66 89 50 18          	mov    WORD PTR [rax+0x18],dx
	finode->create_time = tmpdentry->DIR_CrtDate;
  80bebb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bebf:	0f b7 50 10          	movzx  edx,WORD PTR [rax+0x10]
  80bec3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80bec7:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	finode->write_date = tmpdentry->DIR_WrtTime;
  80becb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80becf:	0f b7 50 16          	movzx  edx,WORD PTR [rax+0x16]
  80bed3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80bed7:	66 89 50 1c          	mov    WORD PTR [rax+0x1c],dx
	finode->write_time = tmpdentry->DIR_WrtDate;
  80bedb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bedf:	0f b7 50 18          	movzx  edx,WORD PTR [rax+0x18]
  80bee3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80bee7:	66 89 50 1e          	mov    WORD PTR [rax+0x1e],dx

	if((tmpdentry->DIR_FstClusHI >> 12) && (p->attribute & FS_ATTR_FILE))
  80beeb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80beef:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80bef3:	66 c1 e8 0c          	shr    ax,0xc
  80bef7:	66 85 c0             	test   ax,ax
  80befa:	74 27                	je     80bf23 <FAT32_lookup+0x907>
  80befc:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80bf00:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80bf04:	83 e0 01             	and    eax,0x1
  80bf07:	48 85 c0             	test   rax,rax
  80bf0a:	74 17                	je     80bf23 <FAT32_lookup+0x907>
	{
		p->attribute |= FS_ATTR_DEVICE;
  80bf0c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80bf10:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80bf14:	48 83 c8 04          	or     rax,0x4
  80bf18:	48 89 c2             	mov    rdx,rax
  80bf1b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80bf1f:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	}

	dest_dentry->dir_inode = p;
  80bf23:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80bf27:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80bf2b:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
	vmfree(buf);
  80bf2f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80bf33:	48 89 c7             	mov    rdi,rax
  80bf36:	e8 96 53 ff ff       	call   8012d1 <vmfree>
	return dest_dentry;	
  80bf3b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
}
  80bf3f:	c9                   	leave  
  80bf40:	c3                   	ret    

000000000080bf41 <FAT32_mkdir>:


long FAT32_mkdir(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  80bf41:	f3 0f 1e fa          	endbr64 
  80bf45:	55                   	push   rbp
  80bf46:	48 89 e5             	mov    rbp,rsp
  80bf49:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bf4d:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80bf51:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80bf54:	90                   	nop
  80bf55:	5d                   	pop    rbp
  80bf56:	c3                   	ret    

000000000080bf57 <FAT32_rmdir>:


long FAT32_rmdir(struct index_node * inode,struct dir_entry * dentry)
{}
  80bf57:	f3 0f 1e fa          	endbr64 
  80bf5b:	55                   	push   rbp
  80bf5c:	48 89 e5             	mov    rbp,rsp
  80bf5f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bf63:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80bf67:	90                   	nop
  80bf68:	5d                   	pop    rbp
  80bf69:	c3                   	ret    

000000000080bf6a <FAT32_rename>:

long FAT32_rename(struct index_node * old_inode,struct dir_entry * old_dentry,struct index_node * new_inode,struct dir_entry * new_dentry)
{}
  80bf6a:	f3 0f 1e fa          	endbr64 
  80bf6e:	55                   	push   rbp
  80bf6f:	48 89 e5             	mov    rbp,rsp
  80bf72:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bf76:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80bf7a:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80bf7e:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  80bf82:	90                   	nop
  80bf83:	5d                   	pop    rbp
  80bf84:	c3                   	ret    

000000000080bf85 <FAT32_getattr>:

long FAT32_getattr(struct dir_entry * dentry,unsigned long * attr)
{}
  80bf85:	f3 0f 1e fa          	endbr64 
  80bf89:	55                   	push   rbp
  80bf8a:	48 89 e5             	mov    rbp,rsp
  80bf8d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bf91:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80bf95:	90                   	nop
  80bf96:	5d                   	pop    rbp
  80bf97:	c3                   	ret    

000000000080bf98 <FAT32_setattr>:

long FAT32_setattr(struct dir_entry * dentry,unsigned long * attr)
{}
  80bf98:	f3 0f 1e fa          	endbr64 
  80bf9c:	55                   	push   rbp
  80bf9d:	48 89 e5             	mov    rbp,rsp
  80bfa0:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bfa4:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80bfa8:	90                   	nop
  80bfa9:	5d                   	pop    rbp
  80bfaa:	c3                   	ret    

000000000080bfab <FAT32_compare>:
	.setattr = FAT32_setattr,
};


//// these operation need cache and list
long FAT32_compare(struct dir_entry * parent_dentry,char * source_filename,char * destination_filename){}
  80bfab:	f3 0f 1e fa          	endbr64 
  80bfaf:	55                   	push   rbp
  80bfb0:	48 89 e5             	mov    rbp,rsp
  80bfb3:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bfb7:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80bfbb:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80bfbf:	90                   	nop
  80bfc0:	5d                   	pop    rbp
  80bfc1:	c3                   	ret    

000000000080bfc2 <FAT32_hash>:
long FAT32_hash(struct dir_entry * dentry,char * filename){}
  80bfc2:	f3 0f 1e fa          	endbr64 
  80bfc6:	55                   	push   rbp
  80bfc7:	48 89 e5             	mov    rbp,rsp
  80bfca:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bfce:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80bfd2:	90                   	nop
  80bfd3:	5d                   	pop    rbp
  80bfd4:	c3                   	ret    

000000000080bfd5 <FAT32_release>:
long FAT32_release(struct dir_entry * dentry){}
  80bfd5:	f3 0f 1e fa          	endbr64 
  80bfd9:	55                   	push   rbp
  80bfda:	48 89 e5             	mov    rbp,rsp
  80bfdd:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bfe1:	90                   	nop
  80bfe2:	5d                   	pop    rbp
  80bfe3:	c3                   	ret    

000000000080bfe4 <FAT32_iput>:
long FAT32_iput(struct dir_entry * dentry,struct index_node * inode){}
  80bfe4:	f3 0f 1e fa          	endbr64 
  80bfe8:	55                   	push   rbp
  80bfe9:	48 89 e5             	mov    rbp,rsp
  80bfec:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bff0:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80bff4:	90                   	nop
  80bff5:	5d                   	pop    rbp
  80bff6:	c3                   	ret    

000000000080bff7 <fat32_write_superblock>:
	.release = FAT32_release,
	.iput = FAT32_iput,
};


void fat32_write_superblock(struct super_block * sb){}
  80bff7:	f3 0f 1e fa          	endbr64 
  80bffb:	55                   	push   rbp
  80bffc:	48 89 e5             	mov    rbp,rsp
  80bfff:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80c003:	90                   	nop
  80c004:	5d                   	pop    rbp
  80c005:	c3                   	ret    

000000000080c006 <fat32_put_superblock>:

void fat32_put_superblock(struct super_block * sb)
{
  80c006:	f3 0f 1e fa          	endbr64 
  80c00a:	55                   	push   rbp
  80c00b:	48 89 e5             	mov    rbp,rsp
  80c00e:	48 83 ec 10          	sub    rsp,0x10
  80c012:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
	vmfree(sb->private_sb_info);
  80c016:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c01a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80c01e:	48 89 c7             	mov    rdi,rax
  80c021:	e8 ab 52 ff ff       	call   8012d1 <vmfree>
	vmfree(sb->root->dir_inode->private_index_info);
  80c026:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c02a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c02d:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c031:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80c035:	48 89 c7             	mov    rdi,rax
  80c038:	e8 94 52 ff ff       	call   8012d1 <vmfree>
	vmfree(sb->root->dir_inode);
  80c03d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c041:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c044:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c048:	48 89 c7             	mov    rdi,rax
  80c04b:	e8 81 52 ff ff       	call   8012d1 <vmfree>
	vmfree(sb->root);
  80c050:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c054:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c057:	48 89 c7             	mov    rdi,rax
  80c05a:	e8 72 52 ff ff       	call   8012d1 <vmfree>
	vmfree(sb);
  80c05f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c063:	48 89 c7             	mov    rdi,rax
  80c066:	e8 66 52 ff ff       	call   8012d1 <vmfree>
}
  80c06b:	90                   	nop
  80c06c:	c9                   	leave  
  80c06d:	c3                   	ret    

000000000080c06e <fat32_write_inode>:

void fat32_write_inode(struct index_node * inode)
{
  80c06e:	f3 0f 1e fa          	endbr64 
  80c072:	55                   	push   rbp
  80c073:	48 89 e5             	mov    rbp,rsp
  80c076:	48 83 ec 40          	sub    rsp,0x40
  80c07a:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
	struct FAT32_Directory * fdentry = NULL;
  80c07e:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80c085:	00 
	struct FAT32_Directory * buf = NULL;
  80c086:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80c08d:	00 
	struct FAT32_inode_info * finode = inode->private_index_info;
  80c08e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80c092:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80c096:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	struct FAT32_sb_info * fsbi = inode->sb->private_sb_info;
  80c09a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80c09e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80c0a2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80c0a6:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	unsigned long sector = 0;
  80c0aa:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  80c0b1:	00 

	if(finode->dentry_location == 0)
  80c0b2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c0b6:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80c0ba:	48 85 c0             	test   rax,rax
  80c0bd:	75 14                	jne    80c0d3 <fat32_write_inode+0x65>
	{
		printf("FS ERROR:write root inode!\n");	
  80c0bf:	bf 6c 5c 81 00       	mov    edi,0x815c6c
  80c0c4:	b8 00 00 00 00       	mov    eax,0x0
  80c0c9:	e8 9e 4c ff ff       	call   800d6c <printf>
		return ;
  80c0ce:	e9 30 01 00 00       	jmp    80c203 <fat32_write_inode+0x195>
	}

	sector = fsbi->Data_firstsector + (finode->dentry_location - 2) * fsbi->sector_per_cluster;
  80c0d3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c0d7:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  80c0db:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c0df:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80c0e3:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  80c0e7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c0eb:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80c0ef:	48 0f af c2          	imul   rax,rdx
  80c0f3:	48 01 c8             	add    rax,rcx
  80c0f6:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	buf = (struct FAT32_Directory *)vmalloc(fsbi->bytes_per_cluster,0);
  80c0fa:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c0fe:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80c102:	be 00 00 00 00       	mov    esi,0x0
  80c107:	48 89 c7             	mov    rdi,rax
  80c10a:	b8 00 00 00 00       	mov    eax,0x0
  80c10f:	e8 2e 51 ff ff       	call   801242 <vmalloc>
  80c114:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	memset(buf,0,fsbi->bytes_per_cluster);
  80c118:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c11c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80c120:	89 c2                	mov    edx,eax
  80c122:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c126:	be 00 00 00 00       	mov    esi,0x0
  80c12b:	48 89 c7             	mov    rdi,rax
  80c12e:	e8 86 0e 00 00       	call   80cfb9 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80c133:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c137:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80c13b:	89 c1                	mov    ecx,eax
  80c13d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80c141:	89 c2                	mov    edx,eax
  80c143:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c147:	49 89 c0             	mov    r8,rax
  80c14a:	be 00 00 00 00       	mov    esi,0x0
  80c14f:	bf 00 00 00 00       	mov    edi,0x0
  80c154:	e8 4e d6 ff ff       	call   8097a7 <request>
  80c159:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    chk_result(r);
  80c15c:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80c15f:	89 c7                	mov    edi,eax
  80c161:	e8 f5 dc ff ff       	call   809e5b <chk_result>
    fdentry = buf+finode->dentry_position;
  80c166:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c16a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80c16e:	48 c1 e0 05          	shl    rax,0x5
  80c172:	48 89 c2             	mov    rdx,rax
  80c175:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c179:	48 01 d0             	add    rax,rdx
  80c17c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

	////alert fat32 dentry data
	fdentry->DIR_FileSize = inode->file_size;
  80c180:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80c184:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c187:	89 c2                	mov    edx,eax
  80c189:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c18d:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
	fdentry->DIR_FstClusLO = finode->first_cluster & 0xffff;
  80c190:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c194:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c197:	89 c2                	mov    edx,eax
  80c199:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c19d:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	fdentry->DIR_FstClusHI = (fdentry->DIR_FstClusHI & 0xf000) | (finode->first_cluster >> 16);
  80c1a1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c1a5:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80c1a9:	66 25 00 f0          	and    ax,0xf000
  80c1ad:	89 c2                	mov    edx,eax
  80c1af:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c1b3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c1b6:	48 c1 e8 10          	shr    rax,0x10
  80c1ba:	09 c2                	or     edx,eax
  80c1bc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c1c0:	66 89 50 14          	mov    WORD PTR [rax+0x14],dx

	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80c1c4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c1c8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80c1cc:	89 c1                	mov    ecx,eax
  80c1ce:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80c1d2:	89 c2                	mov    edx,eax
  80c1d4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c1d8:	49 89 c0             	mov    r8,rax
  80c1db:	be 01 00 00 00       	mov    esi,0x1
  80c1e0:	bf 00 00 00 00       	mov    edi,0x0
  80c1e5:	e8 bd d5 ff ff       	call   8097a7 <request>
  80c1ea:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    chk_result(r1);
  80c1ed:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
  80c1f0:	89 c7                	mov    edi,eax
  80c1f2:	e8 64 dc ff ff       	call   809e5b <chk_result>
	vmfree(buf);
  80c1f7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c1fb:	48 89 c7             	mov    rdi,rax
  80c1fe:	e8 ce 50 ff ff       	call   8012d1 <vmfree>
}
  80c203:	c9                   	leave  
  80c204:	c3                   	ret    

000000000080c205 <fat32_read_superblock>:

	.write_inode = fat32_write_inode,
};

struct super_block * fat32_read_superblock(struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  80c205:	f3 0f 1e fa          	endbr64 
  80c209:	55                   	push   rbp
  80c20a:	48 89 e5             	mov    rbp,rsp
  80c20d:	48 83 ec 50          	sub    rsp,0x50
  80c211:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  80c215:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
	struct super_block * sbp = NULL;
  80c219:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80c220:	00 
	struct FAT32_inode_info * finode = NULL;
  80c221:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80c228:	00 
	struct FAT32_BootSector * fbs = NULL;
  80c229:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80c230:	00 
	struct FAT32_sb_info * fsbi = NULL;
  80c231:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80c238:	00 

	////super block
	sbp = (struct super_block *)vmalloc(sizeof(struct super_block),0);
  80c239:	be 00 00 00 00       	mov    esi,0x0
  80c23e:	bf 18 00 00 00       	mov    edi,0x18
  80c243:	b8 00 00 00 00       	mov    eax,0x0
  80c248:	e8 f5 4f ff ff       	call   801242 <vmalloc>
  80c24d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	memset(sbp,0,sizeof(struct super_block));
  80c251:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c255:	ba 18 00 00 00       	mov    edx,0x18
  80c25a:	be 00 00 00 00       	mov    esi,0x0
  80c25f:	48 89 c7             	mov    rdi,rax
  80c262:	e8 52 0d 00 00       	call   80cfb9 <memset>

	sbp->sb_ops = &FAT32_sb_ops;
  80c267:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c26b:	48 c7 40 08 a0 dc 80 	mov    QWORD PTR [rax+0x8],0x80dca0
  80c272:	00 
	sbp->private_sb_info = (struct FAT32_sb_info *)vmalloc(sizeof(struct FAT32_sb_info),0);
  80c273:	be 00 00 00 00       	mov    esi,0x0
  80c278:	bf 60 00 00 00       	mov    edi,0x60
  80c27d:	b8 00 00 00 00       	mov    eax,0x0
  80c282:	e8 bb 4f ff ff       	call   801242 <vmalloc>
  80c287:	48 89 c2             	mov    rdx,rax
  80c28a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c28e:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	memset(sbp->private_sb_info,0,sizeof(struct FAT32_sb_info));
  80c292:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c296:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80c29a:	ba 60 00 00 00       	mov    edx,0x60
  80c29f:	be 00 00 00 00       	mov    esi,0x0
  80c2a4:	48 89 c7             	mov    rdi,rax
  80c2a7:	e8 0d 0d 00 00       	call   80cfb9 <memset>

	////fat32 boot sector
	fbs = (struct FAT32_BootSector *)buf;
  80c2ac:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80c2b0:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
 	fsbi = sbp->private_sb_info;
  80c2b4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c2b8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80c2bc:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	fsbi->start_sector = DPTE->start_LBA;
  80c2c0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80c2c4:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80c2c7:	89 c2                	mov    edx,eax
  80c2c9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c2cd:	48 89 10             	mov    QWORD PTR [rax],rdx
	fsbi->sector_count = DPTE->sectors_limit;
  80c2d0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80c2d4:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80c2d7:	89 c2                	mov    edx,eax
  80c2d9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c2dd:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	fsbi->sector_per_cluster = fbs->BPB_SecPerClus;
  80c2e1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c2e5:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  80c2e9:	0f b6 d0             	movzx  edx,al
  80c2ec:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c2f0:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	fsbi->bytes_per_cluster = fbs->BPB_SecPerClus * fbs->BPB_BytesPerSec;
  80c2f4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c2f8:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  80c2fc:	0f b6 d0             	movzx  edx,al
  80c2ff:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c303:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  80c307:	0f b7 c0             	movzx  eax,ax
  80c30a:	0f af c2             	imul   eax,edx
  80c30d:	48 63 d0             	movsxd rdx,eax
  80c310:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c314:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	fsbi->bytes_per_sector = fbs->BPB_BytesPerSec;
  80c318:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c31c:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  80c320:	0f b7 d0             	movzx  edx,ax
  80c323:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c327:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
	fsbi->Data_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt + fbs->BPB_FATSz32 * fbs->BPB_NumFATs;
  80c32b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80c32f:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80c332:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c336:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  80c33a:	0f b7 c0             	movzx  eax,ax
  80c33d:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  80c340:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c344:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  80c347:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c34b:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  80c34f:	0f b6 c0             	movzx  eax,al
  80c352:	0f af c2             	imul   eax,edx
  80c355:	01 c8                	add    eax,ecx
  80c357:	89 c2                	mov    edx,eax
  80c359:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c35d:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
	fsbi->FAT1_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt;
  80c361:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80c365:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80c368:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c36c:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  80c370:	0f b7 c0             	movzx  eax,ax
  80c373:	01 d0                	add    eax,edx
  80c375:	89 c2                	mov    edx,eax
  80c377:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c37b:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	fsbi->sector_per_FAT = fbs->BPB_FATSz32;
  80c37f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c383:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  80c386:	89 c2                	mov    edx,eax
  80c388:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c38c:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
	fsbi->NumFATs = fbs->BPB_NumFATs;
  80c390:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c394:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  80c398:	0f b6 d0             	movzx  edx,al
  80c39b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c39f:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
	fsbi->fsinfo_sector_infat = fbs->BPB_FSInfo;
  80c3a3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c3a7:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80c3ab:	0f b7 d0             	movzx  edx,ax
  80c3ae:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c3b2:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
	fsbi->bootsector_bk_infat = fbs->BPB_BkBootSec;	
  80c3b6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c3ba:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  80c3be:	0f b7 d0             	movzx  edx,ax
  80c3c1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c3c5:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
	
	printf("FAT32 Boot Sector\n\tBPB_FSInfo:%x\n\tBPB_BkBootSec:%x\n\tBPB_TotSec32:%x\n",fbs->BPB_FSInfo,fbs->BPB_BkBootSec,fbs->BPB_TotSec32);
  80c3c9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c3cd:	8b 48 20             	mov    ecx,DWORD PTR [rax+0x20]
  80c3d0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c3d4:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  80c3d8:	0f b7 d0             	movzx  edx,ax
  80c3db:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c3df:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80c3e3:	0f b7 c0             	movzx  eax,ax
  80c3e6:	89 c6                	mov    esi,eax
  80c3e8:	bf 88 5c 81 00       	mov    edi,0x815c88
  80c3ed:	b8 00 00 00 00       	mov    eax,0x0
  80c3f2:	e8 75 49 ff ff       	call   800d6c <printf>
	
	////fat32 fsinfo sector
	fsbi->fat_fsinfo = (struct FAT32_FSInfo *)vmalloc(sizeof(struct FAT32_FSInfo),0);
  80c3f7:	be 00 00 00 00       	mov    esi,0x0
  80c3fc:	bf 00 02 00 00       	mov    edi,0x200
  80c401:	b8 00 00 00 00       	mov    eax,0x0
  80c406:	e8 37 4e ff ff       	call   801242 <vmalloc>
  80c40b:	48 89 c2             	mov    rdx,rax
  80c40e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c412:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
	memset(fsbi->fat_fsinfo,0,512);
  80c416:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c41a:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80c41e:	ba 00 02 00 00       	mov    edx,0x200
  80c423:	be 00 00 00 00       	mov    esi,0x0
  80c428:	48 89 c7             	mov    rdi,rax
  80c42b:	e8 89 0b 00 00       	call   80cfb9 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPTE->start_LBA + fbs->BPB_FSInfo,1,(unsigned char *)fsbi->fat_fsinfo);
  80c430:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c434:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  80c438:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80c43c:	8b 48 08             	mov    ecx,DWORD PTR [rax+0x8]
  80c43f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c443:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80c447:	0f b7 c0             	movzx  eax,ax
  80c44a:	01 c8                	add    eax,ecx
  80c44c:	49 89 d0             	mov    r8,rdx
  80c44f:	b9 01 00 00 00       	mov    ecx,0x1
  80c454:	89 c2                	mov    edx,eax
  80c456:	be 00 00 00 00       	mov    esi,0x0
  80c45b:	bf 00 00 00 00       	mov    edi,0x0
  80c460:	e8 42 d3 ff ff       	call   8097a7 <request>
  80c465:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    chk_result(r);
  80c468:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80c46b:	89 c7                	mov    edi,eax
  80c46d:	e8 e9 d9 ff ff       	call   809e5b <chk_result>
	printf("FAT32 FSInfo\n\tFSI_LeadSig:%x\n\tFSI_StrucSig:%x\n\tFSI_Free_Count:%x\n",fsbi->fat_fsinfo->FSI_LeadSig,fsbi->fat_fsinfo->FSI_StrucSig,fsbi->fat_fsinfo->FSI_Free_Count);
  80c472:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c476:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80c47a:	8b 88 e8 01 00 00    	mov    ecx,DWORD PTR [rax+0x1e8]
  80c480:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c484:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80c488:	8b 90 e4 01 00 00    	mov    edx,DWORD PTR [rax+0x1e4]
  80c48e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c492:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80c496:	8b 00                	mov    eax,DWORD PTR [rax]
  80c498:	89 c6                	mov    esi,eax
  80c49a:	bf d0 5c 81 00       	mov    edi,0x815cd0
  80c49f:	b8 00 00 00 00       	mov    eax,0x0
  80c4a4:	e8 c3 48 ff ff       	call   800d6c <printf>
	
	////directory entry
	sbp->root = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  80c4a9:	be 00 00 00 00       	mov    esi,0x0
  80c4ae:	bf 58 00 00 00       	mov    edi,0x58
  80c4b3:	b8 00 00 00 00       	mov    eax,0x0
  80c4b8:	e8 85 4d ff ff       	call   801242 <vmalloc>
  80c4bd:	48 89 c2             	mov    rdx,rax
  80c4c0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c4c4:	48 89 10             	mov    QWORD PTR [rax],rdx
	memset(sbp->root,0,sizeof(struct dir_entry));
  80c4c7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c4cb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c4ce:	ba 58 00 00 00       	mov    edx,0x58
  80c4d3:	be 00 00 00 00       	mov    esi,0x0
  80c4d8:	48 89 c7             	mov    rdi,rax
  80c4db:	e8 d9 0a 00 00       	call   80cfb9 <memset>

	list_init(&sbp->root->child_node);
  80c4e0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c4e4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c4e7:	48 83 c0 10          	add    rax,0x10
  80c4eb:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    list->prev = NULL;
  80c4ef:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80c4f3:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  80c4fa:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80c4fe:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  80c505:	00 
}
  80c506:	90                   	nop
	list_init(&sbp->root->subdirs_list);
  80c507:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c50b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c50e:	48 83 c0 28          	add    rax,0x28
  80c512:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    list->prev = NULL;
  80c516:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80c51a:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    list->next = NULL;
  80c521:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80c525:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  80c52c:	00 
}
  80c52d:	90                   	nop
	sbp->root->parent = sbp->root;
  80c52e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c532:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c535:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80c539:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  80c53c:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
	sbp->root->dir_ops = &FAT32_dentry_ops;
  80c540:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c544:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c547:	48 c7 40 50 80 dc 80 	mov    QWORD PTR [rax+0x50],0x80dc80
  80c54e:	00 
	sbp->root->name = (char *)vmalloc(2,0);
  80c54f:	be 00 00 00 00       	mov    esi,0x0
  80c554:	bf 02 00 00 00       	mov    edi,0x2
  80c559:	b8 00 00 00 00       	mov    eax,0x0
  80c55e:	e8 df 4c ff ff       	call   801242 <vmalloc>
  80c563:	48 89 c2             	mov    rdx,rax
  80c566:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c56a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c56d:	48 89 10             	mov    QWORD PTR [rax],rdx
	sbp->root->name[0] = '/';
  80c570:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c574:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c577:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c57a:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
	sbp->root->name_length = 1;
  80c57d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c581:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c584:	c7 40 08 01 00 00 00 	mov    DWORD PTR [rax+0x8],0x1

	////index node
	sbp->root->dir_inode = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  80c58b:	be 00 00 00 00       	mov    esi,0x0
  80c590:	bf 38 00 00 00       	mov    edi,0x38
  80c595:	b8 00 00 00 00       	mov    eax,0x0
  80c59a:	e8 a3 4c ff ff       	call   801242 <vmalloc>
  80c59f:	48 89 c2             	mov    rdx,rax
  80c5a2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c5a6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c5a9:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
	memset(sbp->root->dir_inode,0,sizeof(struct index_node));
  80c5ad:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c5b1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c5b4:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c5b8:	ba 38 00 00 00       	mov    edx,0x38
  80c5bd:	be 00 00 00 00       	mov    esi,0x0
  80c5c2:	48 89 c7             	mov    rdi,rax
  80c5c5:	e8 ef 09 00 00       	call   80cfb9 <memset>
	sbp->root->dir_inode->inode_ops = &FAT32_inode_ops;
  80c5ca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c5ce:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c5d1:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c5d5:	48 c7 40 28 40 dc 80 	mov    QWORD PTR [rax+0x28],0x80dc40
  80c5dc:	00 
	sbp->root->dir_inode->f_ops = &FAT32_file_ops;
  80c5dd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c5e1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c5e4:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c5e8:	48 c7 40 20 00 dc 80 	mov    QWORD PTR [rax+0x20],0x80dc00
  80c5ef:	00 
	sbp->root->dir_inode->file_size = 0;
  80c5f0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c5f4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c5f7:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c5fb:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
	sbp->root->dir_inode->blocks = (sbp->root->dir_inode->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  80c602:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c606:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c609:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c60d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80c610:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c614:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80c618:	48 01 d0             	add    rax,rdx
  80c61b:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  80c61f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c623:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80c627:	48 89 c6             	mov    rsi,rax
  80c62a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c62e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c631:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  80c635:	48 89 d0             	mov    rax,rdx
  80c638:	ba 00 00 00 00       	mov    edx,0x0
  80c63d:	48 f7 f6             	div    rsi
  80c640:	48 89 41 08          	mov    QWORD PTR [rcx+0x8],rax
	sbp->root->dir_inode->attribute = FS_ATTR_DIR;
  80c644:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c648:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c64b:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c64f:	48 c7 40 10 02 00 00 	mov    QWORD PTR [rax+0x10],0x2
  80c656:	00 
	sbp->root->dir_inode->sb = sbp;
  80c657:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c65b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c65e:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c662:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80c666:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx

	////fat32 root inode
	sbp->root->dir_inode->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  80c66a:	be 00 00 00 00       	mov    esi,0x0
  80c66f:	bf 20 00 00 00       	mov    edi,0x20
  80c674:	b8 00 00 00 00       	mov    eax,0x0
  80c679:	e8 c4 4b ff ff       	call   801242 <vmalloc>
  80c67e:	48 89 c2             	mov    rdx,rax
  80c681:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c685:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c688:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c68c:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(sbp->root->dir_inode->private_index_info,0,sizeof(struct FAT32_inode_info));
  80c690:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c694:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c697:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c69b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80c69f:	ba 20 00 00 00       	mov    edx,0x20
  80c6a4:	be 00 00 00 00       	mov    esi,0x0
  80c6a9:	48 89 c7             	mov    rdi,rax
  80c6ac:	e8 08 09 00 00       	call   80cfb9 <memset>
	finode = (struct FAT32_inode_info *)sbp->root->dir_inode->private_index_info;
  80c6b1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c6b5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80c6b8:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80c6bc:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80c6c0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	finode->first_cluster = fbs->BPB_RootClus;
  80c6c4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c6c8:	8b 40 2c             	mov    eax,DWORD PTR [rax+0x2c]
  80c6cb:	89 c2                	mov    edx,eax
  80c6cd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c6d1:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = 0;
  80c6d4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c6d8:	48 c7 40 08 00 00 00 	mov    QWORD PTR [rax+0x8],0x0
  80c6df:	00 
	finode->dentry_position = 0; 
  80c6e0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c6e4:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  80c6eb:	00 
	finode->create_date = 0;
  80c6ec:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c6f0:	66 c7 40 18 00 00    	mov    WORD PTR [rax+0x18],0x0
	finode->create_time = 0;
  80c6f6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c6fa:	66 c7 40 1a 00 00    	mov    WORD PTR [rax+0x1a],0x0
	finode->write_date = 0;
  80c700:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c704:	66 c7 40 1c 00 00    	mov    WORD PTR [rax+0x1c],0x0
	finode->write_time = 0;
  80c70a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c70e:	66 c7 40 1e 00 00    	mov    WORD PTR [rax+0x1e],0x0

	return sbp;
  80c714:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80c718:	c9                   	leave  
  80c719:	c3                   	ret    

000000000080c71a <DISK1_FAT32_FS_init>:
	.read_superblock = fat32_read_superblock,
	.next = NULL,
};

void DISK1_FAT32_FS_init()
{
  80c71a:	f3 0f 1e fa          	endbr64 
  80c71e:	55                   	push   rbp
  80c71f:	48 89 e5             	mov    rbp,rsp
  80c722:	48 81 ec 20 04 00 00 	sub    rsp,0x420
	int i;
	unsigned char buf[512];
	struct dir_entry * dentry = NULL;
  80c729:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80c730:	00 
	struct Disk_Partition_Table DPT = {0};
  80c731:	48 8d 95 e0 fb ff ff 	lea    rdx,[rbp-0x420]
  80c738:	b8 00 00 00 00       	mov    eax,0x0
  80c73d:	b9 40 00 00 00       	mov    ecx,0x40
  80c742:	48 89 d7             	mov    rdi,rdx
  80c745:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax

	register_filesystem(&FAT32_fs_type);
  80c748:	bf c0 dc 80 00       	mov    edi,0x80dcc0
  80c74d:	e8 6e ba ff ff       	call   8081c0 <register_filesystem>
	
	memset(buf,0,512);
  80c752:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  80c759:	ba 00 02 00 00       	mov    edx,0x200
  80c75e:	be 00 00 00 00       	mov    esi,0x0
  80c763:	48 89 c7             	mov    rdi,rax
  80c766:	e8 4e 08 00 00       	call   80cfb9 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,0x0,1,(unsigned char *)buf);
  80c76b:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  80c772:	49 89 c0             	mov    r8,rax
  80c775:	b9 01 00 00 00       	mov    ecx,0x1
  80c77a:	ba 00 00 00 00       	mov    edx,0x0
  80c77f:	be 00 00 00 00       	mov    esi,0x0
  80c784:	bf 00 00 00 00       	mov    edi,0x0
  80c789:	e8 19 d0 ff ff       	call   8097a7 <request>
  80c78e:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    chk_result(r);
  80c791:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80c794:	89 c7                	mov    edi,eax
  80c796:	e8 c0 d6 ff ff       	call   809e5b <chk_result>
    DPT = *(struct Disk_Partition_Table *)buf;
  80c79b:	48 8d 95 e0 fd ff ff 	lea    rdx,[rbp-0x220]
  80c7a2:	48 8d 85 e0 fb ff ff 	lea    rax,[rbp-0x420]
  80c7a9:	48 89 d6             	mov    rsi,rdx
  80c7ac:	ba 40 00 00 00       	mov    edx,0x40
  80c7b1:	48 89 c7             	mov    rdi,rax
  80c7b4:	48 89 d1             	mov    rcx,rdx
  80c7b7:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
	printf("DPTE[0] start_LBA:%x\ttype:%x\n",DPT.DPTE[0].start_LBA,DPT.DPTE[0].type);
  80c7ba:	0f b6 85 a2 fd ff ff 	movzx  eax,BYTE PTR [rbp-0x25e]
  80c7c1:	0f b6 d0             	movzx  edx,al
  80c7c4:	8b 85 a6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x25a]
  80c7ca:	89 c6                	mov    esi,eax
  80c7cc:	bf 18 5d 81 00       	mov    edi,0x815d18
  80c7d1:	b8 00 00 00 00       	mov    eax,0x0
  80c7d6:	e8 91 45 ff ff       	call   800d6c <printf>

	memset(buf,0,512);
  80c7db:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  80c7e2:	ba 00 02 00 00       	mov    edx,0x200
  80c7e7:	be 00 00 00 00       	mov    esi,0x0
  80c7ec:	48 89 c7             	mov    rdi,rax
  80c7ef:	e8 c5 07 00 00       	call   80cfb9 <memset>
	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPT.DPTE[0].start_LBA,1,(unsigned char *)buf);
  80c7f4:	8b 85 a6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x25a]
  80c7fa:	89 c2                	mov    edx,eax
  80c7fc:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  80c803:	49 89 c0             	mov    r8,rax
  80c806:	b9 01 00 00 00       	mov    ecx,0x1
  80c80b:	be 00 00 00 00       	mov    esi,0x0
  80c810:	bf 00 00 00 00       	mov    edi,0x0
  80c815:	e8 8d cf ff ff       	call   8097a7 <request>
  80c81a:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    chk_result(r1);
  80c81d:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80c820:	89 c7                	mov    edi,eax
  80c822:	e8 34 d6 ff ff       	call   809e5b <chk_result>

    //挂载新文件系统到/mnt
	struct super_block *fat32_sb= mount_fs("FAT32",&DPT.DPTE[0],buf);	//not dev node
  80c827:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  80c82e:	48 8d 95 e0 fb ff ff 	lea    rdx,[rbp-0x420]
  80c835:	48 8d 8a be 01 00 00 	lea    rcx,[rdx+0x1be]
  80c83c:	48 89 c2             	mov    rdx,rax
  80c83f:	48 89 ce             	mov    rsi,rcx
  80c842:	bf 12 5d 81 00       	mov    edi,0x815d12
  80c847:	e8 fc b8 ff ff       	call   808148 <mount_fs>
  80c84c:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    fat32_sb->root=dmnt;
  80c850:	48 8b 15 71 bc bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfbc71]        # 4084c8 <dmnt>
  80c857:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c85b:	48 89 10             	mov    QWORD PTR [rax],rdx
//    list_add_to_behind(&root_sb->root->subdirs_list,ddev);//把dev文件夹挂到新的rfs下
}
  80c85e:	90                   	nop
  80c85f:	c9                   	leave  
  80c860:	c3                   	ret    

000000000080c861 <close_tty>:
int stdd=0;
struct file_operations tty_fops={
        .open=init_tty, .close=close_tty,.write=write_tty,.read=read_tty,.ioctl=ioctl_tty
};

long close_tty(struct index_node * inode,struct file * filp){
  80c861:	f3 0f 1e fa          	endbr64 
  80c865:	55                   	push   rbp
  80c866:	48 89 e5             	mov    rbp,rsp
  80c869:	48 83 ec 30          	sub    rsp,0x30
  80c86d:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80c871:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    stdbuf_t * bi=&((tty_t*)filp->private_data)->stdin_buf;
  80c875:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80c879:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80c87d:	48 83 c0 18          	add    rax,0x18
  80c881:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    stdbuf_t * bo=&((tty_t*)filp->private_data)->stdout_buf;
  80c885:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80c889:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80c88d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    stdbuf_t * be=&((tty_t*)filp->private_data)->stderr_buf;
  80c891:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80c895:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80c899:	48 83 c0 30          	add    rax,0x30
  80c89d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    vmfree((addr_t)bi);
  80c8a1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c8a5:	48 89 c7             	mov    rdi,rax
  80c8a8:	e8 24 4a ff ff       	call   8012d1 <vmfree>
    vmfree((addr_t)bo);
  80c8ad:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c8b1:	48 89 c7             	mov    rdi,rax
  80c8b4:	e8 18 4a ff ff       	call   8012d1 <vmfree>
    vmfree((addr_t)be);
  80c8b9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c8bd:	48 89 c7             	mov    rdi,rax
  80c8c0:	e8 0c 4a ff ff       	call   8012d1 <vmfree>
    vmfree((addr_t)filp->private_data);
  80c8c5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80c8c9:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80c8cd:	48 89 c7             	mov    rdi,rax
  80c8d0:	e8 fc 49 ff ff       	call   8012d1 <vmfree>
    return 0;
  80c8d5:	b8 00 00 00 00       	mov    eax,0x0
}
  80c8da:	c9                   	leave  
  80c8db:	c3                   	ret    

000000000080c8dc <init_tty>:
//打开文件
long init_tty(struct index_node * inode,struct file * filp)
{
  80c8dc:	f3 0f 1e fa          	endbr64 
  80c8e0:	55                   	push   rbp
  80c8e1:	48 89 e5             	mov    rbp,rsp
  80c8e4:	48 83 ec 20          	sub    rsp,0x20
  80c8e8:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80c8ec:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    tty_t *ntty=(tty_t*)vmalloc();
  80c8f0:	b8 00 00 00 00       	mov    eax,0x0
  80c8f5:	e8 48 49 ff ff       	call   801242 <vmalloc>
  80c8fa:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //创建三个缓冲区
    ntty->stdin_buf.data= (char*)vmalloc();
  80c8fe:	b8 00 00 00 00       	mov    eax,0x0
  80c903:	e8 3a 49 ff ff       	call   801242 <vmalloc>
  80c908:	48 89 c2             	mov    rdx,rax
  80c90b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c90f:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    ntty->stdout_buf.data=(char*)vmalloc();
  80c913:	b8 00 00 00 00       	mov    eax,0x0
  80c918:	e8 25 49 ff ff       	call   801242 <vmalloc>
  80c91d:	48 89 c2             	mov    rdx,rax
  80c920:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c924:	48 89 10             	mov    QWORD PTR [rax],rdx
    ntty->stderr_buf.data=(char*)vmalloc();
  80c927:	b8 00 00 00 00       	mov    eax,0x0
  80c92c:	e8 11 49 ff ff       	call   801242 <vmalloc>
  80c931:	48 89 c2             	mov    rdx,rax
  80c934:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c938:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
    ntty->stdin_buf. wptr= 0;
  80c93c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c940:	c7 40 20 00 00 00 00 	mov    DWORD PTR [rax+0x20],0x0
    ntty->stdout_buf.wptr= 0;
  80c947:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c94b:	c7 40 08 00 00 00 00 	mov    DWORD PTR [rax+0x8],0x0
    ntty->stderr_buf.wptr= 0;
  80c952:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c956:	c7 40 38 00 00 00 00 	mov    DWORD PTR [rax+0x38],0x0
    ntty->stdin_buf. rptr= 0;
  80c95d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c961:	c7 40 24 00 00 00 00 	mov    DWORD PTR [rax+0x24],0x0
    ntty->stdout_buf.rptr= 0;
  80c968:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c96c:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [rax+0xc],0x0
    ntty->stderr_buf.rptr= 0;
  80c973:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c977:	c7 40 3c 00 00 00 00 	mov    DWORD PTR [rax+0x3c],0x0
    ntty->stdin_buf.size= PAGE_4K_SIZE;
  80c97e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c982:	c7 40 28 00 10 00 00 	mov    DWORD PTR [rax+0x28],0x1000
    ntty->stdout_buf.size= PAGE_4K_SIZE;
  80c989:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c98d:	c7 40 10 00 10 00 00 	mov    DWORD PTR [rax+0x10],0x1000
    ntty->stderr_buf.size= PAGE_4K_SIZE;
  80c994:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c998:	c7 40 40 00 10 00 00 	mov    DWORD PTR [rax+0x40],0x1000
    //设置inode文件操作方式为tty方式
    inode->f_ops=&tty_fops;
  80c99f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c9a3:	48 c7 40 20 e0 dc 80 	mov    QWORD PTR [rax+0x20],0x80dce0
  80c9aa:	00 
    filp->f_ops=&tty_fops;
  80c9ab:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c9af:	48 c7 40 18 e0 dc 80 	mov    QWORD PTR [rax+0x18],0x80dce0
  80c9b6:	00 
    filp->private_data=ntty;
  80c9b7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80c9bb:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80c9bf:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
    return 0;
  80c9c3:	b8 00 00 00 00       	mov    eax,0x0
}
  80c9c8:	c9                   	leave  
  80c9c9:	c3                   	ret    

000000000080c9ca <read_tty>:

long read_tty(struct file * filp,char * buf,unsigned long count,long * position)
{
  80c9ca:	f3 0f 1e fa          	endbr64 
  80c9ce:	55                   	push   rbp
  80c9cf:	48 89 e5             	mov    rbp,rsp
  80c9d2:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80c9d6:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80c9da:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  80c9de:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
    stdbuf_t * b=&((tty_t*)filp->private_data)->stdin_buf;
  80c9e2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c9e6:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80c9ea:	48 83 c0 18          	add    rax,0x18
  80c9ee:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int i=0;
  80c9f2:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while (i<count){
  80c9f9:	eb 6e                	jmp    80ca69 <read_tty+0x9f>
        if(b->rptr==b->size)
  80c9fb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c9ff:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  80ca02:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ca06:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80ca09:	39 c2                	cmp    edx,eax
  80ca0b:	75 0b                	jne    80ca18 <read_tty+0x4e>
            b->rptr=0;
  80ca0d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ca11:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [rax+0xc],0x0
        if(b->rptr==b->wptr)continue;
  80ca18:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ca1c:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  80ca1f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ca23:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80ca26:	39 c2                	cmp    edx,eax
  80ca28:	75 02                	jne    80ca2c <read_tty+0x62>
  80ca2a:	eb 3d                	jmp    80ca69 <read_tty+0x9f>
        buf[i++]=b->data[b->rptr];
  80ca2c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ca30:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80ca33:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ca37:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80ca3a:	48 98                	cdqe   
  80ca3c:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80ca40:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ca43:	8d 50 01             	lea    edx,[rax+0x1]
  80ca46:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80ca49:	48 63 d0             	movsxd rdx,eax
  80ca4c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ca50:	48 01 c2             	add    rdx,rax
  80ca53:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
  80ca56:	88 02                	mov    BYTE PTR [rdx],al
        b->rptr++;
  80ca58:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ca5c:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80ca5f:	8d 50 01             	lea    edx,[rax+0x1]
  80ca62:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ca66:	89 50 0c             	mov    DWORD PTR [rax+0xc],edx
    while (i<count){
  80ca69:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ca6c:	48 98                	cdqe   
  80ca6e:	48 39 45 d8          	cmp    QWORD PTR [rbp-0x28],rax
  80ca72:	77 87                	ja     80c9fb <read_tty+0x31>
    }
}
  80ca74:	90                   	nop
  80ca75:	5d                   	pop    rbp
  80ca76:	c3                   	ret    

000000000080ca77 <write_tty>:
long write_tty(struct file * filp,char * buf,unsigned long count,long * position)
{
  80ca77:	f3 0f 1e fa          	endbr64 
  80ca7b:	55                   	push   rbp
  80ca7c:	48 89 e5             	mov    rbp,rsp
  80ca7f:	48 83 ec 40          	sub    rsp,0x40
  80ca83:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80ca87:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  80ca8b:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  80ca8f:	48 89 4d c0          	mov    QWORD PTR [rbp-0x40],rcx
    stdbuf_t * b=&((tty_t*)filp->private_data)->stdout_buf;
  80ca93:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80ca97:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80ca9b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int i=0;
  80ca9f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    int saved_wptr=b->wptr;
  80caa6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80caaa:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80caad:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    while (i<count){
  80cab0:	eb 5a                	jmp    80cb0c <write_tty+0x95>
        if(b->wptr==b->size)
  80cab2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cab6:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80cab9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cabd:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80cac0:	39 c2                	cmp    edx,eax
  80cac2:	75 0b                	jne    80cacf <write_tty+0x58>
            b->wptr=0;
  80cac4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cac8:	c7 40 08 00 00 00 00 	mov    DWORD PTR [rax+0x8],0x0
        b->data[b->wptr]=buf[i++];
  80cacf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cad2:	8d 50 01             	lea    edx,[rax+0x1]
  80cad5:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80cad8:	48 63 d0             	movsxd rdx,eax
  80cadb:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80cadf:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80cae3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cae7:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80caea:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80caee:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80caf1:	48 98                	cdqe   
  80caf3:	48 01 c2             	add    rdx,rax
  80caf6:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
  80caf9:	88 02                	mov    BYTE PTR [rdx],al
        b->wptr++;
  80cafb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80caff:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80cb02:	8d 50 01             	lea    edx,[rax+0x1]
  80cb05:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cb09:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    while (i<count){
  80cb0c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cb0f:	48 98                	cdqe   
  80cb11:	48 39 45 c8          	cmp    QWORD PTR [rbp-0x38],rax
  80cb15:	77 9b                	ja     80cab2 <write_tty+0x3b>
    }
    //刷新到framebuffer
    write_framebuffer(filp,b->data+saved_wptr,count,0);
  80cb17:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cb1b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80cb1e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80cb21:	48 98                	cdqe   
  80cb23:	48 8d 34 02          	lea    rsi,[rdx+rax*1]
  80cb27:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80cb2b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80cb2f:	b9 00 00 00 00       	mov    ecx,0x0
  80cb34:	48 89 c7             	mov    rdi,rax
  80cb37:	e8 ab b1 ff ff       	call   807ce7 <write_framebuffer>
}
  80cb3c:	90                   	nop
  80cb3d:	c9                   	leave  
  80cb3e:	c3                   	ret    

000000000080cb3f <ioctl_tty>:
 * TTY_CONNECT:尝试连接到dev/console,这样会成为controlling terminal,里面的数据才能输出到屏幕上，
 * 因为除了特殊指定的进程都会有一个自己的天tty。
 * 成功返回0。
 * */
long ioctl_tty(struct index_node * inode, struct file * filp, unsigned long cmd, unsigned long arg)
{
  80cb3f:	f3 0f 1e fa          	endbr64 
  80cb43:	55                   	push   rbp
  80cb44:	48 89 e5             	mov    rbp,rsp
  80cb47:	48 83 ec 50          	sub    rsp,0x50
  80cb4b:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  80cb4f:	48 89 75 c0          	mov    QWORD PTR [rbp-0x40],rsi
  80cb53:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  80cb57:	48 89 4d b0          	mov    QWORD PTR [rbp-0x50],rcx
    stdbuf_t * b=&((tty_t*)filp->private_data)->stderr_buf;
  80cb5b:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80cb5f:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80cb63:	48 83 c0 30          	add    rax,0x30
  80cb67:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    stdbuf_t * ib=&((tty_t*)filp->private_data)->stdin_buf;
  80cb6b:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80cb6f:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80cb73:	48 83 c0 18          	add    rax,0x18
  80cb77:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    int i=0;
  80cb7b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* buf=*((char**)arg);
  80cb82:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80cb86:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80cb89:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    unsigned long count=*((unsigned long*)(arg+8));
  80cb8d:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80cb91:	48 83 c0 08          	add    rax,0x8
  80cb95:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80cb98:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    int saved_wptr=b->wptr;
  80cb9c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cba0:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80cba3:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    int fd=-1;
  80cba6:	c7 45 d0 ff ff ff ff 	mov    DWORD PTR [rbp-0x30],0xffffffff
    switch (cmd)
  80cbad:	48 83 7d b8 03       	cmp    QWORD PTR [rbp-0x48],0x3
  80cbb2:	0f 84 81 01 00 00    	je     80cd39 <ioctl_tty+0x1fa>
  80cbb8:	48 83 7d b8 03       	cmp    QWORD PTR [rbp-0x48],0x3
  80cbbd:	0f 87 81 01 00 00    	ja     80cd44 <ioctl_tty+0x205>
  80cbc3:	48 83 7d b8 02       	cmp    QWORD PTR [rbp-0x48],0x2
  80cbc8:	0f 84 e8 00 00 00    	je     80ccb6 <ioctl_tty+0x177>
  80cbce:	48 83 7d b8 02       	cmp    QWORD PTR [rbp-0x48],0x2
  80cbd3:	0f 87 6b 01 00 00    	ja     80cd44 <ioctl_tty+0x205>
  80cbd9:	48 83 7d b8 00       	cmp    QWORD PTR [rbp-0x48],0x0
  80cbde:	74 6a                	je     80cc4a <ioctl_tty+0x10b>
  80cbe0:	48 83 7d b8 01       	cmp    QWORD PTR [rbp-0x48],0x1
  80cbe5:	0f 84 94 00 00 00    	je     80cc7f <ioctl_tty+0x140>
  80cbeb:	e9 54 01 00 00       	jmp    80cd44 <ioctl_tty+0x205>
    {
        case TTY_WSTDERR:
            while (i<count){
                if(b->wptr==b->size)
  80cbf0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cbf4:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80cbf7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cbfb:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80cbfe:	39 c2                	cmp    edx,eax
  80cc00:	75 0b                	jne    80cc0d <ioctl_tty+0xce>
                    b->wptr=0;
  80cc02:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cc06:	c7 40 08 00 00 00 00 	mov    DWORD PTR [rax+0x8],0x0
                b->data[b->wptr]=buf[i++];
  80cc0d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cc10:	8d 50 01             	lea    edx,[rax+0x1]
  80cc13:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80cc16:	48 63 d0             	movsxd rdx,eax
  80cc19:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80cc1d:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80cc21:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cc25:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80cc28:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cc2c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80cc2f:	48 98                	cdqe   
  80cc31:	48 01 c2             	add    rdx,rax
  80cc34:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
  80cc37:	88 02                	mov    BYTE PTR [rdx],al
                b->wptr++;
  80cc39:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cc3d:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80cc40:	8d 50 01             	lea    edx,[rax+0x1]
  80cc43:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cc47:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
            while (i<count){
  80cc4a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cc4d:	48 98                	cdqe   
  80cc4f:	48 39 45 d8          	cmp    QWORD PTR [rbp-0x28],rax
  80cc53:	77 9b                	ja     80cbf0 <ioctl_tty+0xb1>
            }
            //刷新到framebuffer
            write_framebuffer(filp,b->data+saved_wptr,count,0);
  80cc55:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80cc59:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80cc5c:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80cc5f:	48 98                	cdqe   
  80cc61:	48 8d 34 02          	lea    rsi,[rdx+rax*1]
  80cc65:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80cc69:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80cc6d:	b9 00 00 00 00       	mov    ecx,0x0
  80cc72:	48 89 c7             	mov    rdi,rax
  80cc75:	e8 6d b0 ff ff       	call   807ce7 <write_framebuffer>
        break;
  80cc7a:	e9 ce 00 00 00       	jmp    80cd4d <ioctl_tty+0x20e>
        case TTY_CONNECT:
            fd=sys_open("dev/console",O_WRONLY|O_CREAT|O_EXCL);
  80cc7f:	be c1 00 00 00       	mov    esi,0xc1
  80cc84:	bf 36 5d 81 00       	mov    edi,0x815d36
  80cc89:	e8 32 b8 ff ff       	call   8084c0 <sys_open>
  80cc8e:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
            if(fd==-1)return -1;
  80cc91:	83 7d d0 ff          	cmp    DWORD PTR [rbp-0x30],0xffffffff
  80cc95:	75 0c                	jne    80cca3 <ioctl_tty+0x164>
  80cc97:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80cc9e:	e9 af 00 00 00       	jmp    80cd52 <ioctl_tty+0x213>
            ((tty_t*)filp->private_data)->console_fd=fd;
  80cca3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80cca7:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80ccab:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
  80ccae:	89 50 48             	mov    DWORD PTR [rax+0x48],edx
            break;
  80ccb1:	e9 97 00 00 00       	jmp    80cd4d <ioctl_tty+0x20e>
        case TTY_DISCONNECT:
            fd=((tty_t*)filp->private_data)->console_fd;
  80ccb6:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80ccba:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80ccbe:	8b 40 48             	mov    eax,DWORD PTR [rax+0x48]
  80ccc1:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
            if(fd==-1)return -1;
  80ccc4:	83 7d d0 ff          	cmp    DWORD PTR [rbp-0x30],0xffffffff
  80ccc8:	75 09                	jne    80ccd3 <ioctl_tty+0x194>
  80ccca:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80ccd1:	eb 7f                	jmp    80cd52 <ioctl_tty+0x213>
            sys_close(fd);
  80ccd3:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
  80ccd6:	89 c7                	mov    edi,eax
  80ccd8:	e8 7a bd ff ff       	call   808a57 <sys_close>
        case TTY_WSTDIN:
            while (i<count){
  80ccdd:	eb 5a                	jmp    80cd39 <ioctl_tty+0x1fa>
                if(ib->wptr==ib->size)
  80ccdf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cce3:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80cce6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ccea:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80cced:	39 c2                	cmp    edx,eax
  80ccef:	75 0b                	jne    80ccfc <ioctl_tty+0x1bd>
                    ib->wptr=0;
  80ccf1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ccf5:	c7 40 08 00 00 00 00 	mov    DWORD PTR [rax+0x8],0x0
                ib->data[ib->wptr]=buf[i++];
  80ccfc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ccff:	8d 50 01             	lea    edx,[rax+0x1]
  80cd02:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80cd05:	48 63 d0             	movsxd rdx,eax
  80cd08:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80cd0c:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80cd10:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cd14:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80cd17:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cd1b:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80cd1e:	48 98                	cdqe   
  80cd20:	48 01 c2             	add    rdx,rax
  80cd23:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
  80cd26:	88 02                	mov    BYTE PTR [rdx],al
                ib->wptr++;
  80cd28:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cd2c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80cd2f:	8d 50 01             	lea    edx,[rax+0x1]
  80cd32:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cd36:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
            while (i<count){
  80cd39:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cd3c:	48 98                	cdqe   
  80cd3e:	48 39 45 d8          	cmp    QWORD PTR [rbp-0x28],rax
  80cd42:	77 9b                	ja     80ccdf <ioctl_tty+0x1a0>
            }
    default:return -1;
  80cd44:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80cd4b:	eb 05                	jmp    80cd52 <ioctl_tty+0x213>
    }
    return 0;
  80cd4d:	b8 00 00 00 00       	mov    eax,0x0
}
  80cd52:	c9                   	leave  
  80cd53:	c3                   	ret    

000000000080cd54 <init_com>:
#include "int.h"
#include "str.h"
#include "memory.h"


void init_com(int base_port){
  80cd54:	f3 0f 1e fa          	endbr64 
  80cd58:	55                   	push   rbp
  80cd59:	48 89 e5             	mov    rbp,rsp
  80cd5c:	48 83 ec 10          	sub    rsp,0x10
  80cd60:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    /* disable all interrupts */
    outb(base_port + COM_REG_IER, 0x00);
  80cd63:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cd66:	83 c0 01             	add    eax,0x1
  80cd69:	0f b7 c0             	movzx  eax,ax
  80cd6c:	be 00 00 00 00       	mov    esi,0x0
  80cd71:	89 c7                	mov    edi,eax
  80cd73:	e8 98 9a ff ff       	call   806810 <outb>
    
    /* enable DLAB to set bound rate divisor */
    outb(base_port + COM_REG_LCR, 0x80);
  80cd78:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cd7b:	83 c0 03             	add    eax,0x3
  80cd7e:	0f b7 c0             	movzx  eax,ax
  80cd81:	be 80 00 00 00       	mov    esi,0x80
  80cd86:	89 c7                	mov    edi,eax
  80cd88:	e8 83 9a ff ff       	call   806810 <outb>
    
    /* set divisor to 38400 baud */
    outb(base_port + COM_REG_DLL, 0x03);
  80cd8d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cd90:	0f b7 c0             	movzx  eax,ax
  80cd93:	be 03 00 00 00       	mov    esi,0x3
  80cd98:	89 c7                	mov    edi,eax
  80cd9a:	e8 71 9a ff ff       	call   806810 <outb>
    outb(base_port + COM_REG_DLM, 0x00);
  80cd9f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cda2:	83 c0 01             	add    eax,0x1
  80cda5:	0f b7 c0             	movzx  eax,ax
  80cda8:	be 00 00 00 00       	mov    esi,0x0
  80cdad:	89 c7                	mov    edi,eax
  80cdaf:	e8 5c 9a ff ff       	call   806810 <outb>
    
    /* 8 data bits, parity off, 1 stop bit, DLAB latch off */
    outb(base_port + COM_REG_LCR, 0x03);
  80cdb4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cdb7:	83 c0 03             	add    eax,0x3
  80cdba:	0f b7 c0             	movzx  eax,ax
  80cdbd:	be 03 00 00 00       	mov    esi,0x3
  80cdc2:	89 c7                	mov    edi,eax
  80cdc4:	e8 47 9a ff ff       	call   806810 <outb>
    
    /* enable FIFO */
    outb(base_port + COM_REG_FCR, 0x87);//0xc7
  80cdc9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cdcc:	83 c0 02             	add    eax,0x2
  80cdcf:	0f b7 c0             	movzx  eax,ax
  80cdd2:	be 87 00 00 00       	mov    esi,0x87
  80cdd7:	89 c7                	mov    edi,eax
  80cdd9:	e8 32 9a ff ff       	call   806810 <outb>

    /* enable IRQs, set RTS/DSR */
    outb(base_port + COM_REG_MCR, 0x0B);
  80cdde:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cde1:	83 c0 04             	add    eax,0x4
  80cde4:	0f b7 c0             	movzx  eax,ax
  80cde7:	be 0b 00 00 00       	mov    esi,0xb
  80cdec:	89 c7                	mov    edi,eax
  80cdee:	e8 1d 9a ff ff       	call   806810 <outb>
//    if (inb(base_port + COM_REG_RX) != 0xae) {
//        return;
//    }
    
    /* set in normal mode */
    outb(base_port + COM_REG_MCR, 0x0F);
  80cdf3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cdf6:	83 c0 04             	add    eax,0x4
  80cdf9:	0f b7 c0             	movzx  eax,ax
  80cdfc:	be 0f 00 00 00       	mov    esi,0xf
  80ce01:	89 c7                	mov    edi,eax
  80ce03:	e8 08 9a ff ff       	call   806810 <outb>
}
  80ce08:	90                   	nop
  80ce09:	c9                   	leave  
  80ce0a:	c3                   	ret    

000000000080ce0b <com_putchar>:
void com_putchar(unsigned short ch,int com_base)
{
  80ce0b:	f3 0f 1e fa          	endbr64 
  80ce0f:	55                   	push   rbp
  80ce10:	48 89 e5             	mov    rbp,rsp
  80ce13:	48 83 ec 20          	sub    rsp,0x20
  80ce17:	89 f8                	mov    eax,edi
  80ce19:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80ce1c:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    unsigned char res;
    /* wait for the port to be ready */
    do {
        res = inb(com_base + COM_REG_LSR);
  80ce20:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80ce23:	83 c0 05             	add    eax,0x5
  80ce26:	0f b6 c0             	movzx  eax,al
  80ce29:	89 c7                	mov    edi,eax
  80ce2b:	e8 f9 99 ff ff       	call   806829 <inb>
  80ce30:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        res &= 0x20;
  80ce33:	80 65 ff 20          	and    BYTE PTR [rbp-0x1],0x20
    } while (res == 0);
  80ce37:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  80ce3b:	74 e3                	je     80ce20 <com_putchar+0x15>
    outb(com_base, ch);
  80ce3d:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  80ce41:	0f b6 d0             	movzx  edx,al
  80ce44:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80ce47:	0f b7 c0             	movzx  eax,ax
  80ce4a:	89 d6                	mov    esi,edx
  80ce4c:	89 c7                	mov    edi,eax
  80ce4e:	e8 bd 99 ff ff       	call   806810 <outb>
}
  80ce53:	90                   	nop
  80ce54:	c9                   	leave  
  80ce55:	c3                   	ret    

000000000080ce56 <com_puts>:

void com_puts(char* s,int com_port){
  80ce56:	f3 0f 1e fa          	endbr64 
  80ce5a:	55                   	push   rbp
  80ce5b:	48 89 e5             	mov    rbp,rsp
  80ce5e:	48 83 ec 10          	sub    rsp,0x10
  80ce62:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80ce66:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    for(;*s;s++){
  80ce69:	eb 1d                	jmp    80ce88 <com_puts+0x32>
        com_putchar(*s,com_port);
  80ce6b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ce6f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ce72:	66 98                	cbw    
  80ce74:	0f b7 c0             	movzx  eax,ax
  80ce77:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80ce7a:	89 d6                	mov    esi,edx
  80ce7c:	89 c7                	mov    edi,eax
  80ce7e:	e8 88 ff ff ff       	call   80ce0b <com_putchar>
    for(;*s;s++){
  80ce83:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  80ce88:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ce8c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ce8f:	84 c0                	test   al,al
  80ce91:	75 d8                	jne    80ce6b <com_puts+0x15>
    }
}
  80ce93:	90                   	nop
  80ce94:	90                   	nop
  80ce95:	c9                   	leave  
  80ce96:	c3                   	ret    

000000000080ce97 <comprintf>:
void comprintf(char* fmt,va_list args){
  80ce97:	f3 0f 1e fa          	endbr64 
  80ce9b:	55                   	push   rbp
  80ce9c:	48 89 e5             	mov    rbp,rsp
  80ce9f:	48 83 ec 20          	sub    rsp,0x20
  80cea3:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80cea7:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    if(strlen(fmt)>=1024)
  80ceab:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ceaf:	48 89 c7             	mov    rdi,rax
  80ceb2:	e8 70 03 00 00       	call   80d227 <strlen>
  80ceb7:	3d ff 03 00 00       	cmp    eax,0x3ff
  80cebc:	7f 49                	jg     80cf07 <comprintf+0x70>
        return;//一次性输出不了太长
    char* tmp=(char*)vmalloc();
  80cebe:	b8 00 00 00 00       	mov    eax,0x0
  80cec3:	e8 7a 43 ff ff       	call   801242 <vmalloc>
  80cec8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    sprintf(tmp,fmt,args);
  80cecc:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  80ced0:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  80ced4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ced8:	48 89 ce             	mov    rsi,rcx
  80cedb:	48 89 c7             	mov    rdi,rax
  80cede:	b8 00 00 00 00       	mov    eax,0x0
  80cee3:	e8 6d 03 00 00       	call   80d255 <sprintf>
    com_puts(tmp,PORT_COM1);
  80cee8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ceec:	be f8 03 00 00       	mov    esi,0x3f8
  80cef1:	48 89 c7             	mov    rdi,rax
  80cef4:	e8 5d ff ff ff       	call   80ce56 <com_puts>
    vmfree(tmp);
  80cef9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80cefd:	48 89 c7             	mov    rdi,rax
  80cf00:	e8 cc 43 ff ff       	call   8012d1 <vmfree>
  80cf05:	eb 01                	jmp    80cf08 <comprintf+0x71>
        return;//一次性输出不了太长
  80cf07:	90                   	nop
  80cf08:	c9                   	leave  
  80cf09:	c3                   	ret    

000000000080cf0a <memcpy>:
#include "mem.h"
#include "typename.h"
static u32 mem_end;
static u32 usr_mem_base;
void memcpy(u8* dest, u8 *src,u32 size){
  80cf0a:	f3 0f 1e fa          	endbr64 
  80cf0e:	55                   	push   rbp
  80cf0f:	48 89 e5             	mov    rbp,rsp
  80cf12:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80cf16:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80cf1a:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    *dest=0xff;//如果页内存还没分配，这样就可以先激发缺页异常分配了，之后写数据就会完整不会少开头第一个字节。
  80cf1d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cf21:	c6 00 ff             	mov    BYTE PTR [rax],0xff
    for(int i=0;i<size;i++){
  80cf24:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80cf2b:	eb 1b                	jmp    80cf48 <memcpy+0x3e>
        *(dest)=*(src);
  80cf2d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80cf31:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80cf34:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cf38:	88 10                	mov    BYTE PTR [rax],dl
        dest++;
  80cf3a:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        src++;
  80cf3f:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<size;i++){
  80cf44:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80cf48:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cf4b:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
  80cf4e:	77 dd                	ja     80cf2d <memcpy+0x23>
    }
}
  80cf50:	90                   	nop
  80cf51:	90                   	nop
  80cf52:	5d                   	pop    rbp
  80cf53:	c3                   	ret    

000000000080cf54 <memcmp>:
int memcmp(u8 *a,u8* b,int len)
{
  80cf54:	f3 0f 1e fa          	endbr64 
  80cf58:	55                   	push   rbp
  80cf59:	48 89 e5             	mov    rbp,rsp
  80cf5c:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80cf60:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80cf64:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    for(int i=0;i<len;i++)
  80cf67:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80cf6e:	eb 3a                	jmp    80cfaa <memcmp+0x56>
    {
        if(*a!=*b)
  80cf70:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cf74:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80cf77:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80cf7b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80cf7e:	38 c2                	cmp    dl,al
  80cf80:	74 1a                	je     80cf9c <memcmp+0x48>
            return *a-*b;
  80cf82:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cf86:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80cf89:	0f b6 d0             	movzx  edx,al
  80cf8c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80cf90:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80cf93:	0f b6 c8             	movzx  ecx,al
  80cf96:	89 d0                	mov    eax,edx
  80cf98:	29 c8                	sub    eax,ecx
  80cf9a:	eb 1b                	jmp    80cfb7 <memcmp+0x63>
        a++;
  80cf9c:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        b++;
  80cfa1:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<len;i++)
  80cfa6:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80cfaa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cfad:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  80cfb0:	7c be                	jl     80cf70 <memcmp+0x1c>
    }
    return 0;
  80cfb2:	b8 00 00 00 00       	mov    eax,0x0
}
  80cfb7:	5d                   	pop    rbp
  80cfb8:	c3                   	ret    

000000000080cfb9 <memset>:
void memset(u8 *buf,u8 value,u32 size){
  80cfb9:	f3 0f 1e fa          	endbr64 
  80cfbd:	55                   	push   rbp
  80cfbe:	48 89 e5             	mov    rbp,rsp
  80cfc1:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80cfc5:	89 f0                	mov    eax,esi
  80cfc7:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
  80cfca:	88 45 e4             	mov    BYTE PTR [rbp-0x1c],al
    for(u32 i=0;i<size;i++){
  80cfcd:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80cfd4:	eb 16                	jmp    80cfec <memset+0x33>
        *(buf++)=value;
  80cfd6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80cfda:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80cfde:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80cfe2:	0f b6 55 e4          	movzx  edx,BYTE PTR [rbp-0x1c]
  80cfe6:	88 10                	mov    BYTE PTR [rax],dl
    for(u32 i=0;i<size;i++){
  80cfe8:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80cfec:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80cfef:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  80cff2:	72 e2                	jb     80cfd6 <memset+0x1d>
    }
}
  80cff4:	90                   	nop
  80cff5:	90                   	nop
  80cff6:	5d                   	pop    rbp
  80cff7:	c3                   	ret    

000000000080cff8 <get_mem_size>:

u32 get_mem_size(){
  80cff8:	f3 0f 1e fa          	endbr64 
  80cffc:	55                   	push   rbp
  80cffd:	48 89 e5             	mov    rbp,rsp
    return mem_end;
  80d000:	8b 05 f6 e2 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e2f6]        # 42b2fc <mem_end>
}
  80d006:	5d                   	pop    rbp
  80d007:	c3                   	ret    

000000000080d008 <strcpy>:
#include "str.h"
#include <stdarg.h>
void strcpy(unsigned char* dest, unsigned char *buf){
  80d008:	f3 0f 1e fa          	endbr64 
  80d00c:	55                   	push   rbp
  80d00d:	48 89 e5             	mov    rbp,rsp
  80d010:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80d014:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*buf!='\0'){
  80d018:	eb 1d                	jmp    80d037 <strcpy+0x2f>
        *(dest++)=*(buf++);
  80d01a:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80d01e:	48 8d 42 01          	lea    rax,[rdx+0x1]
  80d022:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  80d026:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80d02a:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80d02e:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80d032:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80d035:	88 10                	mov    BYTE PTR [rax],dl
    while(*buf!='\0'){
  80d037:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80d03b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d03e:	84 c0                	test   al,al
  80d040:	75 d8                	jne    80d01a <strcpy+0x12>
    }
    *dest='\0';
  80d042:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80d046:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80d049:	90                   	nop
  80d04a:	5d                   	pop    rbp
  80d04b:	c3                   	ret    

000000000080d04c <strtok>:
static char strtokkee[512],*strtokkeeptr=strtokkee;
static int tokptr=0;
static char retbuf[512],*retbptr=retbuf;
char* strtok(char *str,char splitter){
  80d04c:	f3 0f 1e fa          	endbr64 
  80d050:	55                   	push   rbp
  80d051:	48 89 e5             	mov    rbp,rsp
  80d054:	48 83 ec 30          	sub    rsp,0x30
  80d058:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80d05c:	89 f0                	mov    eax,esi
  80d05e:	88 45 d4             	mov    BYTE PTR [rbp-0x2c],al
    //limit: cannot cut string longer than 512
    if(str!=(void*)0){
  80d061:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80d066:	0f 84 9c 00 00 00    	je     80d108 <strtok+0xbc>
        //cut for the first time
        strcpy(strtokkee,str);
  80d06c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80d070:	48 89 c6             	mov    rsi,rax
  80d073:	bf 20 b3 42 00       	mov    edi,0x42b320
  80d078:	e8 8b ff ff ff       	call   80d008 <strcpy>
        char* ptr=strtokkee;
  80d07d:	48 c7 45 e8 20 b3 42 	mov    QWORD PTR [rbp-0x18],0x42b320
  80d084:	00 
        for(tokptr=0;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512);
  80d085:	c7 05 91 e4 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1e491],0x0        # 42b520 <tokptr>
  80d08c:	00 00 00 
  80d08f:	eb 1c                	jmp    80d0ad <strtok+0x61>
  80d091:	8b 05 89 e4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e489]        # 42b520 <tokptr>
  80d097:	83 c0 01             	add    eax,0x1
  80d09a:	99                   	cdq    
  80d09b:	c1 ea 17             	shr    edx,0x17
  80d09e:	01 d0                	add    eax,edx
  80d0a0:	25 ff 01 00 00       	and    eax,0x1ff
  80d0a5:	29 d0                	sub    eax,edx
  80d0a7:	89 05 73 e4 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1e473],eax        # 42b520 <tokptr>
  80d0ad:	8b 05 6d e4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e46d]        # 42b520 <tokptr>
  80d0b3:	48 98                	cdqe   
  80d0b5:	0f b6 80 20 b3 42 00 	movzx  eax,BYTE PTR [rax+0x42b320]
  80d0bc:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80d0bf:	74 13                	je     80d0d4 <strtok+0x88>
  80d0c1:	8b 05 59 e4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e459]        # 42b520 <tokptr>
  80d0c7:	48 98                	cdqe   
  80d0c9:	0f b6 80 20 b3 42 00 	movzx  eax,BYTE PTR [rax+0x42b320]
  80d0d0:	84 c0                	test   al,al
  80d0d2:	75 bd                	jne    80d091 <strtok+0x45>
        strtokkee[tokptr]='\0';
  80d0d4:	8b 05 46 e4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e446]        # 42b520 <tokptr>
  80d0da:	48 98                	cdqe   
  80d0dc:	c6 80 20 b3 42 00 00 	mov    BYTE PTR [rax+0x42b320],0x0
        tokptr=(tokptr+1)%512;
  80d0e3:	8b 05 37 e4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e437]        # 42b520 <tokptr>
  80d0e9:	83 c0 01             	add    eax,0x1
  80d0ec:	99                   	cdq    
  80d0ed:	c1 ea 17             	shr    edx,0x17
  80d0f0:	01 d0                	add    eax,edx
  80d0f2:	25 ff 01 00 00       	and    eax,0x1ff
  80d0f7:	29 d0                	sub    eax,edx
  80d0f9:	89 05 21 e4 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1e421],eax        # 42b520 <tokptr>
        return ptr;
  80d0ff:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80d103:	e9 9e 00 00 00       	jmp    80d1a6 <strtok+0x15a>
    }
    //go on cutting
    int c=0;
  80d108:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* ptr=strtokkee+tokptr;
  80d10f:	8b 05 0b e4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e40b]        # 42b520 <tokptr>
  80d115:	48 98                	cdqe   
  80d117:	48 05 20 b3 42 00    	add    rax,0x42b320
  80d11d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512,c++);
  80d121:	eb 20                	jmp    80d143 <strtok+0xf7>
  80d123:	8b 05 f7 e3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e3f7]        # 42b520 <tokptr>
  80d129:	83 c0 01             	add    eax,0x1
  80d12c:	99                   	cdq    
  80d12d:	c1 ea 17             	shr    edx,0x17
  80d130:	01 d0                	add    eax,edx
  80d132:	25 ff 01 00 00       	and    eax,0x1ff
  80d137:	29 d0                	sub    eax,edx
  80d139:	89 05 e1 e3 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1e3e1],eax        # 42b520 <tokptr>
  80d13f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80d143:	8b 05 d7 e3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e3d7]        # 42b520 <tokptr>
  80d149:	48 98                	cdqe   
  80d14b:	0f b6 80 20 b3 42 00 	movzx  eax,BYTE PTR [rax+0x42b320]
  80d152:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80d155:	74 13                	je     80d16a <strtok+0x11e>
  80d157:	8b 05 c3 e3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e3c3]        # 42b520 <tokptr>
  80d15d:	48 98                	cdqe   
  80d15f:	0f b6 80 20 b3 42 00 	movzx  eax,BYTE PTR [rax+0x42b320]
  80d166:	84 c0                	test   al,al
  80d168:	75 b9                	jne    80d123 <strtok+0xd7>
    strtokkee[tokptr]='\0';
  80d16a:	8b 05 b0 e3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e3b0]        # 42b520 <tokptr>
  80d170:	48 98                	cdqe   
  80d172:	c6 80 20 b3 42 00 00 	mov    BYTE PTR [rax+0x42b320],0x0
    tokptr=(tokptr+1)%512;
  80d179:	8b 05 a1 e3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e3a1]        # 42b520 <tokptr>
  80d17f:	83 c0 01             	add    eax,0x1
  80d182:	99                   	cdq    
  80d183:	c1 ea 17             	shr    edx,0x17
  80d186:	01 d0                	add    eax,edx
  80d188:	25 ff 01 00 00       	and    eax,0x1ff
  80d18d:	29 d0                	sub    eax,edx
  80d18f:	89 05 8b e3 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1e38b],eax        # 42b520 <tokptr>
    if(c)
  80d195:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80d199:	74 06                	je     80d1a1 <strtok+0x155>
        return ptr;
  80d19b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80d19f:	eb 05                	jmp    80d1a6 <strtok+0x15a>
    else
        return (void*)0;
  80d1a1:	b8 00 00 00 00       	mov    eax,0x0
}
  80d1a6:	c9                   	leave  
  80d1a7:	c3                   	ret    

000000000080d1a8 <strcmp>:
int strcmp(char *s1,char *s2)
{
  80d1a8:	f3 0f 1e fa          	endbr64 
  80d1ac:	55                   	push   rbp
  80d1ad:	48 89 e5             	mov    rbp,rsp
  80d1b0:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80d1b4:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	while(*s1!='\0'&&*s2!='\0'){
  80d1b8:	eb 3c                	jmp    80d1f6 <strcmp+0x4e>
		if(*s1>*s2)
  80d1ba:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80d1be:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80d1c1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80d1c5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d1c8:	38 c2                	cmp    dl,al
  80d1ca:	7e 07                	jle    80d1d3 <strcmp+0x2b>
			return 1;
  80d1cc:	b8 01 00 00 00       	mov    eax,0x1
  80d1d1:	eb 52                	jmp    80d225 <strcmp+0x7d>
		else if(*s1<*s2)
  80d1d3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80d1d7:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80d1da:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80d1de:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d1e1:	38 c2                	cmp    dl,al
  80d1e3:	7d 07                	jge    80d1ec <strcmp+0x44>
			return -1;
  80d1e5:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80d1ea:	eb 39                	jmp    80d225 <strcmp+0x7d>
		s1++;
  80d1ec:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
		s2++;
  80d1f1:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
	while(*s1!='\0'&&*s2!='\0'){
  80d1f6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80d1fa:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d1fd:	84 c0                	test   al,al
  80d1ff:	74 0b                	je     80d20c <strcmp+0x64>
  80d201:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80d205:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d208:	84 c0                	test   al,al
  80d20a:	75 ae                	jne    80d1ba <strcmp+0x12>
	}
	if(*s1==*s2)
  80d20c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80d210:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80d213:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80d217:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d21a:	38 c2                	cmp    dl,al
  80d21c:	75 07                	jne    80d225 <strcmp+0x7d>
		return 0;
  80d21e:	b8 00 00 00 00       	mov    eax,0x0
  80d223:	eb 00                	jmp    80d225 <strcmp+0x7d>
}
  80d225:	5d                   	pop    rbp
  80d226:	c3                   	ret    

000000000080d227 <strlen>:

int strlen(char *str)
{
  80d227:	f3 0f 1e fa          	endbr64 
  80d22b:	55                   	push   rbp
  80d22c:	48 89 e5             	mov    rbp,rsp
  80d22f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int l=0;
  80d233:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;*str!='\0';str++,l++);
  80d23a:	eb 09                	jmp    80d245 <strlen+0x1e>
  80d23c:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  80d241:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80d245:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80d249:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d24c:	84 c0                	test   al,al
  80d24e:	75 ec                	jne    80d23c <strlen+0x15>
    return l;
  80d250:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80d253:	5d                   	pop    rbp
  80d254:	c3                   	ret    

000000000080d255 <sprintf>:

void sprintf(char *dist, char *str,...)
{
  80d255:	f3 0f 1e fa          	endbr64 
  80d259:	55                   	push   rbp
  80d25a:	48 89 e5             	mov    rbp,rsp
  80d25d:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  80d264:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  80d26b:	48 89 b5 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rsi
  80d272:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  80d279:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  80d280:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  80d287:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  80d28e:	84 c0                	test   al,al
  80d290:	74 20                	je     80d2b2 <sprintf+0x5d>
  80d292:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  80d296:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  80d29a:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  80d29e:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  80d2a2:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  80d2a6:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  80d2aa:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  80d2ae:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7

    //count num of args
    char *pstr=str;
  80d2b2:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80d2b9:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char *prev=str;
  80d2c0:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80d2c7:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    int argnum=0;
  80d2ce:	c7 85 3c ff ff ff 00 	mov    DWORD PTR [rbp-0xc4],0x0
  80d2d5:	00 00 00 
    while (*pstr!='\n')
  80d2d8:	eb 39                	jmp    80d313 <sprintf+0xbe>
    {
        if(*pstr=='%'&&*prev!='%')
  80d2da:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d2e1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d2e4:	3c 25                	cmp    al,0x25
  80d2e6:	75 15                	jne    80d2fd <sprintf+0xa8>
  80d2e8:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  80d2ef:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d2f2:	3c 25                	cmp    al,0x25
  80d2f4:	74 07                	je     80d2fd <sprintf+0xa8>
            argnum++;
  80d2f6:	83 85 3c ff ff ff 01 	add    DWORD PTR [rbp-0xc4],0x1
        prev=pstr;
  80d2fd:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d304:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
        pstr++;
  80d30b:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80d312:	01 
    while (*pstr!='\n')
  80d313:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d31a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d31d:	3c 0a                	cmp    al,0xa
  80d31f:	75 b9                	jne    80d2da <sprintf+0x85>
    }

    va_list vargs;
    va_start(vargs,str);
  80d321:	c7 85 08 ff ff ff 10 	mov    DWORD PTR [rbp-0xf8],0x10
  80d328:	00 00 00 
  80d32b:	c7 85 0c ff ff ff 30 	mov    DWORD PTR [rbp-0xf4],0x30
  80d332:	00 00 00 
  80d335:	48 8d 45 10          	lea    rax,[rbp+0x10]
  80d339:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  80d340:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  80d347:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
    pstr=str;
  80d34e:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80d355:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    for(;*pstr!='\0';pstr++){
  80d35c:	e9 e2 01 00 00       	jmp    80d543 <sprintf+0x2ee>
        if(*pstr=='%'&&*(pstr+1)!='\0'){
  80d361:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d368:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d36b:	3c 25                	cmp    al,0x25
  80d36d:	0f 85 aa 01 00 00    	jne    80d51d <sprintf+0x2c8>
  80d373:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d37a:	48 83 c0 01          	add    rax,0x1
  80d37e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d381:	84 c0                	test   al,al
  80d383:	0f 84 94 01 00 00    	je     80d51d <sprintf+0x2c8>
            pstr++;
  80d389:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80d390:	01 
            if(*pstr=='x'){
  80d391:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d398:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d39b:	3c 78                	cmp    al,0x78
  80d39d:	75 64                	jne    80d403 <sprintf+0x1ae>
                int v=va_arg(vargs,int);
  80d39f:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80d3a5:	83 f8 2f             	cmp    eax,0x2f
  80d3a8:	77 23                	ja     80d3cd <sprintf+0x178>
  80d3aa:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80d3b1:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80d3b7:	89 d2                	mov    edx,edx
  80d3b9:	48 01 d0             	add    rax,rdx
  80d3bc:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80d3c2:	83 c2 08             	add    edx,0x8
  80d3c5:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80d3cb:	eb 12                	jmp    80d3df <sprintf+0x18a>
  80d3cd:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80d3d4:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80d3d8:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80d3df:	8b 00                	mov    eax,DWORD PTR [rax]
  80d3e1:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
                sprint_hex(dist,v);
  80d3e7:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
  80d3ed:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80d3f4:	89 d6                	mov    esi,edx
  80d3f6:	48 89 c7             	mov    rdi,rax
  80d3f9:	e8 4e 02 00 00       	call   80d64c <sprint_hex>
            if(*pstr=='x'){
  80d3fe:	e9 38 01 00 00       	jmp    80d53b <sprintf+0x2e6>
            }else if(*pstr=='s'){
  80d403:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d40a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d40d:	3c 73                	cmp    al,0x73
  80d40f:	75 68                	jne    80d479 <sprintf+0x224>
                char* v=va_arg(vargs,char*);
  80d411:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80d417:	83 f8 2f             	cmp    eax,0x2f
  80d41a:	77 23                	ja     80d43f <sprintf+0x1ea>
  80d41c:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80d423:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80d429:	89 d2                	mov    edx,edx
  80d42b:	48 01 d0             	add    rax,rdx
  80d42e:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80d434:	83 c2 08             	add    edx,0x8
  80d437:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80d43d:	eb 12                	jmp    80d451 <sprintf+0x1fc>
  80d43f:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80d446:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80d44a:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80d451:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80d454:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
                sprintn(dist,v);
  80d45b:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
  80d462:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80d469:	48 89 d6             	mov    rsi,rdx
  80d46c:	48 89 c7             	mov    rdi,rax
  80d46f:	e8 5a 02 00 00       	call   80d6ce <sprintn>
            if(*pstr=='x'){
  80d474:	e9 c2 00 00 00       	jmp    80d53b <sprintf+0x2e6>
            }else if(*pstr=='d'){
  80d479:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d480:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d483:	3c 64                	cmp    al,0x64
  80d485:	75 66                	jne    80d4ed <sprintf+0x298>
                char* v=va_arg(vargs,char*);
  80d487:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80d48d:	83 f8 2f             	cmp    eax,0x2f
  80d490:	77 23                	ja     80d4b5 <sprintf+0x260>
  80d492:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80d499:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80d49f:	89 d2                	mov    edx,edx
  80d4a1:	48 01 d0             	add    rax,rdx
  80d4a4:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80d4aa:	83 c2 08             	add    edx,0x8
  80d4ad:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80d4b3:	eb 12                	jmp    80d4c7 <sprintf+0x272>
  80d4b5:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80d4bc:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80d4c0:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80d4c7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80d4ca:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
                sprint_decimal(dist,v);
  80d4d1:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  80d4d8:	89 c2                	mov    edx,eax
  80d4da:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80d4e1:	89 d6                	mov    esi,edx
  80d4e3:	48 89 c7             	mov    rdi,rax
  80d4e6:	e8 ad 00 00 00       	call   80d598 <sprint_decimal>
            if(*pstr=='x'){
  80d4eb:	eb 4e                	jmp    80d53b <sprintf+0x2e6>
            }else if(*pstr=='c'){
  80d4ed:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d4f4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d4f7:	3c 63                	cmp    al,0x63
  80d4f9:	75 02                	jne    80d4fd <sprintf+0x2a8>
                char v=va_arg(vargs,char);
  80d4fb:	0f 0b                	ud2    
                sprintchar(dist,v);
            }else{
                sprintchar(dist,*pstr);
  80d4fd:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d504:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d507:	0f be d0             	movsx  edx,al
  80d50a:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80d511:	89 d6                	mov    esi,edx
  80d513:	48 89 c7             	mov    rdi,rax
  80d516:	e8 3e 00 00 00       	call   80d559 <sprintchar>
            if(*pstr=='x'){
  80d51b:	eb 1e                	jmp    80d53b <sprintf+0x2e6>
            }
        }else{
            sprintchar(dist,*pstr);
  80d51d:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d524:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d527:	0f be d0             	movsx  edx,al
  80d52a:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80d531:	89 d6                	mov    esi,edx
  80d533:	48 89 c7             	mov    rdi,rax
  80d536:	e8 1e 00 00 00       	call   80d559 <sprintchar>
    for(;*pstr!='\0';pstr++){
  80d53b:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80d542:	01 
  80d543:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80d54a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d54d:	84 c0                	test   al,al
  80d54f:	0f 85 0c fe ff ff    	jne    80d361 <sprintf+0x10c>
        }
    }
    va_end(vargs);
}
  80d555:	90                   	nop
  80d556:	90                   	nop
  80d557:	c9                   	leave  
  80d558:	c3                   	ret    

000000000080d559 <sprintchar>:
void sprintchar(char *dist,char c)
{
  80d559:	f3 0f 1e fa          	endbr64 
  80d55d:	55                   	push   rbp
  80d55e:	48 89 e5             	mov    rbp,rsp
  80d561:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80d565:	89 f0                	mov    eax,esi
  80d567:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    while(*dist!='\0')
  80d56a:	eb 05                	jmp    80d571 <sprintchar+0x18>
        dist++;
  80d56c:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    while(*dist!='\0')
  80d571:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80d575:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d578:	84 c0                	test   al,al
  80d57a:	75 f0                	jne    80d56c <sprintchar+0x13>
    *dist++=c;
  80d57c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80d580:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80d584:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80d588:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  80d58c:	88 10                	mov    BYTE PTR [rax],dl
    *dist='\0';
  80d58e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80d592:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80d595:	90                   	nop
  80d596:	5d                   	pop    rbp
  80d597:	c3                   	ret    

000000000080d598 <sprint_decimal>:
void sprint_decimal(char *dist,int c)
{
  80d598:	f3 0f 1e fa          	endbr64 
  80d59c:	55                   	push   rbp
  80d59d:	48 89 e5             	mov    rbp,rsp
  80d5a0:	48 83 ec 30          	sub    rsp,0x30
  80d5a4:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80d5a8:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
    unsigned char st[22];
    int p=0;
  80d5ab:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<sizeof(unsigned long)*2){
  80d5b2:	eb 65                	jmp    80d619 <sprint_decimal+0x81>
        unsigned char a=c%10+'0';
  80d5b4:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  80d5b7:	48 63 c2             	movsxd rax,edx
  80d5ba:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  80d5c1:	48 c1 e8 20          	shr    rax,0x20
  80d5c5:	c1 f8 02             	sar    eax,0x2
  80d5c8:	89 d6                	mov    esi,edx
  80d5ca:	c1 fe 1f             	sar    esi,0x1f
  80d5cd:	29 f0                	sub    eax,esi
  80d5cf:	89 c1                	mov    ecx,eax
  80d5d1:	89 c8                	mov    eax,ecx
  80d5d3:	c1 e0 02             	shl    eax,0x2
  80d5d6:	01 c8                	add    eax,ecx
  80d5d8:	01 c0                	add    eax,eax
  80d5da:	89 d1                	mov    ecx,edx
  80d5dc:	29 c1                	sub    ecx,eax
  80d5de:	89 c8                	mov    eax,ecx
  80d5e0:	83 c0 30             	add    eax,0x30
  80d5e3:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        st[p++]=a;
  80d5e6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80d5e9:	8d 50 01             	lea    edx,[rax+0x1]
  80d5ec:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80d5ef:	48 98                	cdqe   
  80d5f1:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80d5f5:	88 54 05 e0          	mov    BYTE PTR [rbp+rax*1-0x20],dl
        c/=10;
  80d5f9:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80d5fc:	48 63 d0             	movsxd rdx,eax
  80d5ff:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
  80d606:	48 c1 ea 20          	shr    rdx,0x20
  80d60a:	c1 fa 02             	sar    edx,0x2
  80d60d:	c1 f8 1f             	sar    eax,0x1f
  80d610:	89 c1                	mov    ecx,eax
  80d612:	89 d0                	mov    eax,edx
  80d614:	29 c8                	sub    eax,ecx
  80d616:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    while(p<sizeof(unsigned long)*2){
  80d619:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80d61c:	83 f8 0f             	cmp    eax,0xf
  80d61f:	76 93                	jbe    80d5b4 <sprint_decimal+0x1c>
    }
    while(p>0)
  80d621:	eb 1f                	jmp    80d642 <sprint_decimal+0xaa>
    {
        sprintchar(dist,st[--p]);
  80d623:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80d627:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80d62a:	48 98                	cdqe   
  80d62c:	0f b6 44 05 e0       	movzx  eax,BYTE PTR [rbp+rax*1-0x20]
  80d631:	0f be d0             	movsx  edx,al
  80d634:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80d638:	89 d6                	mov    esi,edx
  80d63a:	48 89 c7             	mov    rdi,rax
  80d63d:	e8 17 ff ff ff       	call   80d559 <sprintchar>
    while(p>0)
  80d642:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80d646:	7f db                	jg     80d623 <sprint_decimal+0x8b>
    }
}
  80d648:	90                   	nop
  80d649:	90                   	nop
  80d64a:	c9                   	leave  
  80d64b:	c3                   	ret    

000000000080d64c <sprint_hex>:
void sprint_hex(char *dist,unsigned int c)
{
  80d64c:	f3 0f 1e fa          	endbr64 
  80d650:	55                   	push   rbp
  80d651:	48 89 e5             	mov    rbp,rsp
  80d654:	48 83 ec 20          	sub    rsp,0x20
  80d658:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80d65c:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    unsigned char st[10];
    int p=0;
  80d65f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<10){
  80d666:	eb 35                	jmp    80d69d <sprint_hex+0x51>
        unsigned char a=c%16;
  80d668:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80d66b:	83 e0 0f             	and    eax,0xf
  80d66e:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        if(a>9)a+='a'-10;
  80d671:	80 7d fb 09          	cmp    BYTE PTR [rbp-0x5],0x9
  80d675:	76 06                	jbe    80d67d <sprint_hex+0x31>
  80d677:	80 45 fb 57          	add    BYTE PTR [rbp-0x5],0x57
  80d67b:	eb 04                	jmp    80d681 <sprint_hex+0x35>
        else a+='0';
  80d67d:	80 45 fb 30          	add    BYTE PTR [rbp-0x5],0x30
        st[p++]=a;
  80d681:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80d684:	8d 50 01             	lea    edx,[rax+0x1]
  80d687:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80d68a:	48 98                	cdqe   
  80d68c:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80d690:	88 54 05 f1          	mov    BYTE PTR [rbp+rax*1-0xf],dl
        c/=16;
  80d694:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80d697:	c1 e8 04             	shr    eax,0x4
  80d69a:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    while(p<10){
  80d69d:	83 7d fc 09          	cmp    DWORD PTR [rbp-0x4],0x9
  80d6a1:	7e c5                	jle    80d668 <sprint_hex+0x1c>
    }
    while(p>0)
  80d6a3:	eb 1f                	jmp    80d6c4 <sprint_hex+0x78>
    {
        sprintchar(dist,st[--p]);
  80d6a5:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80d6a9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80d6ac:	48 98                	cdqe   
  80d6ae:	0f b6 44 05 f1       	movzx  eax,BYTE PTR [rbp+rax*1-0xf]
  80d6b3:	0f be d0             	movsx  edx,al
  80d6b6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80d6ba:	89 d6                	mov    esi,edx
  80d6bc:	48 89 c7             	mov    rdi,rax
  80d6bf:	e8 95 fe ff ff       	call   80d559 <sprintchar>
    while(p>0)
  80d6c4:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80d6c8:	7f db                	jg     80d6a5 <sprint_hex+0x59>
    }
}
  80d6ca:	90                   	nop
  80d6cb:	90                   	nop
  80d6cc:	c9                   	leave  
  80d6cd:	c3                   	ret    

000000000080d6ce <sprintn>:
void sprintn(char *dist,char *str)
{
  80d6ce:	f3 0f 1e fa          	endbr64 
  80d6d2:	55                   	push   rbp
  80d6d3:	48 89 e5             	mov    rbp,rsp
  80d6d6:	48 83 ec 10          	sub    rsp,0x10
  80d6da:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80d6de:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*str!='\0')
  80d6e2:	eb 20                	jmp    80d704 <sprintn+0x36>
    {
        sprintchar(dist,*str++);
  80d6e4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80d6e8:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80d6ec:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  80d6f0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d6f3:	0f be d0             	movsx  edx,al
  80d6f6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80d6fa:	89 d6                	mov    esi,edx
  80d6fc:	48 89 c7             	mov    rdi,rax
  80d6ff:	e8 55 fe ff ff       	call   80d559 <sprintchar>
    while(*str!='\0')
  80d704:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80d708:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80d70b:	84 c0                	test   al,al
  80d70d:	75 d5                	jne    80d6e4 <sprintn+0x16>
    }
  80d70f:	90                   	nop
  80d710:	90                   	nop
  80d711:	c9                   	leave  
  80d712:	c3                   	ret    
  80d713:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  80d71a:	00 00 00 
  80d71d:	0f 1f 00             	nop    DWORD PTR [rax]

000000000080d720 <create_zero>:
  80d720:	e8 2c 6c ff ff       	call   804351 <req_proc>
  80d725:	83 f8 ff             	cmp    eax,0xffffffff
  80d728:	74 0c                	je     80d736 <create_zero.retu>
  80d72a:	e8 ed 6c ff ff       	call   80441c <set_proc>
  80d72f:	67 8b 04 24          	mov    eax,DWORD PTR [esp]
  80d733:	83 c4 40             	add    esp,0x40

000000000080d736 <create_zero.retu>:
  80d736:	c3                   	ret    

000000000080d737 <fill_desc>:
  80d737:	55                   	push   rbp
  80d738:	48 89 e5             	mov    rbp,rsp
  80d73b:	67 8b 45 14          	mov    eax,DWORD PTR [ebp+0x14]
  80d73f:	67 8b 5d 10          	mov    ebx,DWORD PTR [ebp+0x10]
  80d743:	67 8b 4d 0c          	mov    ecx,DWORD PTR [ebp+0xc]
  80d747:	67 8b 55 08          	mov    edx,DWORD PTR [ebp+0x8]
  80d74b:	be 8a d8 80 00       	mov    esi,0x80d88a
  80d750:	c7 04 25 8a d8 80 00 	mov    DWORD PTR ds:0x80d88a,0x0
  80d757:	00 00 00 00 
  80d75b:	c7 04 25 8e d8 80 00 	mov    DWORD PTR ds:0x80d88e,0x0
  80d762:	00 00 00 00 
  80d766:	66 67 89 0e          	mov    WORD PTR [esi],cx
  80d76a:	c1 e9 10             	shr    ecx,0x10
  80d76d:	66 67 89 56 02       	mov    WORD PTR [esi+0x2],dx
  80d772:	c1 ea 10             	shr    edx,0x10
  80d775:	67 88 56 04          	mov    BYTE PTR [esi+0x4],dl
  80d779:	66 c1 ea 08          	shr    dx,0x8
  80d77d:	67 88 56 07          	mov    BYTE PTR [esi+0x7],dl
  80d781:	66 67 89 5e 05       	mov    WORD PTR [esi+0x5],bx
  80d786:	67 8b 7e 04          	mov    edi,DWORD PTR [esi+0x4]
  80d78a:	c1 e1 08             	shl    ecx,0x8
  80d78d:	09 cf                	or     edi,ecx
  80d78f:	67 89 7e 04          	mov    DWORD PTR [esi+0x4],edi
  80d793:	8b 14 25 8a d8 80 00 	mov    edx,DWORD PTR ds:0x80d88a
  80d79a:	67 89 10             	mov    DWORD PTR [eax],edx
  80d79d:	8b 14 25 8e d8 80 00 	mov    edx,DWORD PTR ds:0x80d88e
  80d7a4:	67 89 50 04          	mov    DWORD PTR [eax+0x4],edx
  80d7a8:	c9                   	leave  
  80d7a9:	c3                   	ret    

000000000080d7aa <switch_proc_asm>:
  80d7aa:	66 67 8b 44 24 04    	mov    ax,WORD PTR [esp+0x4]
  80d7b0:	66 89 04 25 c8 d7 80 	mov    WORD PTR ds:0x80d7c8,ax
  80d7b7:	00 
  80d7b8:	c7 04 25 c4 d7 80 00 	mov    DWORD PTR ds:0x80d7c4,0x0
  80d7bf:	00 00 00 00 

000000000080d7c3 <switch_proc_asm.ljmp>:
  80d7c3:	ea                   	(bad)  
  80d7c4:	00 00                	add    BYTE PTR [rax],al
  80d7c6:	00 00                	add    BYTE PTR [rax],al
  80d7c8:	00 00                	add    BYTE PTR [rax],al
  80d7ca:	c3                   	ret    

000000000080d7cb <switch_to_old>:
  80d7cb:	67 8b 74 24 04       	mov    esi,DWORD PTR [esp+0x4]
  80d7d0:	67 8b 5e 20          	mov    ebx,DWORD PTR [esi+0x20]
  80d7d4:	bf 3c d8 80 00       	mov    edi,0x80d83c
  80d7d9:	67 89 5f 01          	mov    DWORD PTR [edi+0x1],ebx
  80d7dd:	67 8b 46 38          	mov    eax,DWORD PTR [esi+0x38]
  80d7e1:	89 c1                	mov    ecx,eax
  80d7e3:	83 e9 04             	sub    ecx,0x4
  80d7e6:	67 89 19             	mov    DWORD PTR [ecx],ebx
  80d7e9:	50                   	push   rax
  80d7ea:	89 f5                	mov    ebp,esi
  80d7ec:	83 c5 28             	add    ebp,0x28
  80d7ef:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d7f3:	50                   	push   rax
  80d7f4:	83 c5 04             	add    ebp,0x4
  80d7f7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d7fb:	50                   	push   rax
  80d7fc:	83 c5 04             	add    ebp,0x4
  80d7ff:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d803:	50                   	push   rax
  80d804:	83 c5 04             	add    ebp,0x4
  80d807:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d80b:	50                   	push   rax
  80d80c:	83 c5 04             	add    ebp,0x4
  80d80f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d813:	50                   	push   rax
  80d814:	83 c5 04             	add    ebp,0x4
  80d817:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d81b:	50                   	push   rax
  80d81c:	83 c5 04             	add    ebp,0x4
  80d81f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d823:	50                   	push   rax
  80d824:	83 c5 04             	add    ebp,0x4
  80d827:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80d82b:	50                   	push   rax
  80d82c:	83 c5 04             	add    ebp,0x4
  80d82f:	67 8b 46 1c          	mov    eax,DWORD PTR [esi+0x1c]
  80d833:	0f 22 d8             	mov    cr3,rax
  80d836:	67 8b 46 24          	mov    eax,DWORD PTR [esi+0x24]
  80d83a:	50                   	push   rax
  80d83b:	5c                   	pop    rsp

000000000080d83c <switch_to_old.leap>:
  80d83c:	ea                   	(bad)  
  80d83d:	00 00                	add    BYTE PTR [rax],al
  80d83f:	00 00                	add    BYTE PTR [rax],al
  80d841:	08 00                	or     BYTE PTR [rax],al

000000000080d843 <save_context>:
  80d843:	67 8b 44 24 24       	mov    eax,DWORD PTR [esp+0x24]
  80d848:	83 c0 44             	add    eax,0x44
  80d84b:	b9 08 00 00 00       	mov    ecx,0x8
  80d850:	89 e7                	mov    edi,esp

000000000080d852 <save_context.loops>:
  80d852:	67 8b 17             	mov    edx,DWORD PTR [edi]
  80d855:	67 89 10             	mov    DWORD PTR [eax],edx
  80d858:	83 c7 04             	add    edi,0x4
  80d85b:	83 e8 04             	sub    eax,0x4
  80d85e:	e2 f2                	loop   80d852 <save_context.loops>
  80d860:	5b                   	pop    rbx
  80d861:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  80d866:	67 89 58 24          	mov    DWORD PTR [eax+0x24],ebx
  80d86a:	67 48 8b 1c 24       	mov    rbx,QWORD PTR [esp]
  80d86f:	67 89 58 20          	mov    DWORD PTR [eax+0x20],ebx
  80d873:	c3                   	ret    

000000000080d874 <move_to_user_mode>:
  80d874:	66 b8 20 00          	mov    ax,0x20
  80d878:	8e d8                	mov    ds,eax
  80d87a:	8e c0                	mov    es,eax
  80d87c:	8e e8                	mov    gs,eax
  80d87e:	6a 20                	push   0x20
  80d880:	54                   	push   rsp
  80d881:	6a 18                	push   0x18
  80d883:	68 89 d8 80 00       	push   0x80d889
  80d888:	cf                   	iret   

000000000080d889 <move_to_user_mode.done>:
  80d889:	c3                   	ret    

000000000080d88a <desc>:
	...

000000000080d892 <ret_sys_call>:
  80d892:	58                   	pop    rax
  80d893:	8e d8                	mov    ds,eax
  80d895:	58                   	pop    rax
  80d896:	8e c0                	mov    es,eax
  80d898:	41 5f                	pop    r15
  80d89a:	41 5e                	pop    r14
  80d89c:	41 5d                	pop    r13
  80d89e:	41 5c                	pop    r12
  80d8a0:	41 5b                	pop    r11
  80d8a2:	41 5a                	pop    r10
  80d8a4:	41 59                	pop    r9
  80d8a6:	41 58                	pop    r8
  80d8a8:	5e                   	pop    rsi
  80d8a9:	5f                   	pop    rdi
  80d8aa:	5a                   	pop    rdx
  80d8ab:	59                   	pop    rcx
  80d8ac:	5b                   	pop    rbx
  80d8ad:	58                   	pop    rax

000000000080d8ae <tmp>:
  80d8ae:	48 0f 07             	sysretq 

000000000080d8b1 <ret_normal_proc>:
  80d8b1:	58                   	pop    rax
  80d8b2:	8e d8                	mov    ds,eax
  80d8b4:	58                   	pop    rax
  80d8b5:	8e c0                	mov    es,eax
  80d8b7:	41 5f                	pop    r15
  80d8b9:	41 5e                	pop    r14
  80d8bb:	41 5d                	pop    r13
  80d8bd:	41 5c                	pop    r12
  80d8bf:	41 5b                	pop    r11
  80d8c1:	41 5a                	pop    r10
  80d8c3:	41 59                	pop    r9
  80d8c5:	41 58                	pop    r8
  80d8c7:	5e                   	pop    rsi
  80d8c8:	5f                   	pop    rdi
  80d8c9:	5a                   	pop    rdx
  80d8ca:	59                   	pop    rcx
  80d8cb:	5b                   	pop    rbx
  80d8cc:	58                   	pop    rax
  80d8cd:	c3                   	ret    
