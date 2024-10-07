
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
  100093:	b8 11 08 80 00       	mov    eax,0x800811
  100098:	ea                   	(bad)  
  100099:	11 08                	adc    DWORD PTR [rax],ecx
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
  800194:	b8 ea 11 80 00       	mov    eax,0x8011ea
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
  800217:	b8 34 6a 80 00       	mov    eax,0x806a34
  80021c:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800221:	ba 08 00 00 00       	mov    edx,0x8
  800226:	48 89 c6             	mov    rsi,rax
  800229:	bf 21 00 00 00       	mov    edi,0x21
  80022e:	e8 02 01 00 00       	call   800335 <set_gate>
	set_gate(0x20,(addr_t)clock,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800233:	b8 40 4a 80 00       	mov    eax,0x804a40
  800238:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80023d:	ba 08 00 00 00       	mov    edx,0x8
  800242:	48 89 c6             	mov    rsi,rax
  800245:	bf 20 00 00 00       	mov    edi,0x20
  80024a:	e8 e6 00 00 00       	call   800335 <set_gate>
	set_gate(0x2e,(addr_t)disk_int_handler,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80024f:	b8 40 79 80 00       	mov    eax,0x807940
  800254:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800259:	ba 08 00 00 00       	mov    edx,0x8
  80025e:	48 89 c6             	mov    rsi,rax
  800261:	bf 2e 00 00 00       	mov    edi,0x2e
  800266:	e8 ca 00 00 00       	call   800335 <set_gate>
    set_gate(0x80,(addr_t)_syscall,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);//
  80026b:	b8 70 54 80 00       	mov    eax,0x805470
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
  800291:	e8 1a 45 00 00       	call   8047b0 <outb>
	outb(0xA0,0x11);
  800296:	be 11 00 00 00       	mov    esi,0x11
  80029b:	bf a0 00 00 00       	mov    edi,0xa0
  8002a0:	e8 0b 45 00 00       	call   8047b0 <outb>
	//ICW2
	outb(0x21,0x20);//former 0x20,0x20
  8002a5:	be 20 00 00 00       	mov    esi,0x20
  8002aa:	bf 21 00 00 00       	mov    edi,0x21
  8002af:	e8 fc 44 00 00       	call   8047b0 <outb>
	outb(0xA1,0x28);
  8002b4:	be 28 00 00 00       	mov    esi,0x28
  8002b9:	bf a1 00 00 00       	mov    edi,0xa1
  8002be:	e8 ed 44 00 00       	call   8047b0 <outb>
	//ICW3
	outb(0x21,0x04);
  8002c3:	be 04 00 00 00       	mov    esi,0x4
  8002c8:	bf 21 00 00 00       	mov    edi,0x21
  8002cd:	e8 de 44 00 00       	call   8047b0 <outb>
	outb(0xA1,0x02);
  8002d2:	be 02 00 00 00       	mov    esi,0x2
  8002d7:	bf a1 00 00 00       	mov    edi,0xa1
  8002dc:	e8 cf 44 00 00       	call   8047b0 <outb>
	//ICW4
	outb(0x21,0x01);
  8002e1:	be 01 00 00 00       	mov    esi,0x1
  8002e6:	bf 21 00 00 00       	mov    edi,0x21
  8002eb:	e8 c0 44 00 00       	call   8047b0 <outb>
	outb(0xA1,0x01);
  8002f0:	be 01 00 00 00       	mov    esi,0x1
  8002f5:	bf a1 00 00 00       	mov    edi,0xa1
  8002fa:	e8 b1 44 00 00       	call   8047b0 <outb>

    turn_on_int();
  8002ff:	b8 00 00 00 00       	mov    eax,0x0
  800304:	e8 e1 44 00 00       	call   8047ea <turn_on_int>


    //设置IA32_LSTAR,为syscall做设置
    wrmsr(0xc0000082, _syscall);
  800309:	b8 70 54 80 00       	mov    eax,0x805470
  80030e:	48 89 c6             	mov    rsi,rax
  800311:	b8 82 00 00 c0       	mov    eax,0xc0000082
  800316:	48 89 c7             	mov    rdi,rax
  800319:	e8 c9 04 00 00       	call   8007e7 <wrmsr>
    //设置IA32_FMASK,为syscall做设置
    wrmsr(0xc0000084, -1);
  80031e:	48 c7 c6 ff ff ff ff 	mov    rsi,0xffffffffffffffff
  800325:	b8 84 00 00 c0       	mov    eax,0xc0000084
  80032a:	48 89 c7             	mov    rdi,rax
  80032d:	e8 b5 04 00 00       	call   8007e7 <wrmsr>
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
  800350:	48 8b 15 89 ae 00 00 	mov    rdx,QWORD PTR [rip+0xae89]        # 80b1e0 <idt>
  800357:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80035b:	48 c1 e0 04          	shl    rax,0x4
  80035f:	48 01 d0             	add    rax,rdx
  800362:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800366:	66 89 10             	mov    WORD PTR [rax],dx
    idt[index].offset_mid=(offset>>16)&0xffff;
  800369:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80036d:	48 c1 e8 10          	shr    rax,0x10
  800371:	48 89 c2             	mov    rdx,rax
  800374:	48 8b 0d 65 ae 00 00 	mov    rcx,QWORD PTR [rip+0xae65]        # 80b1e0 <idt>
  80037b:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80037f:	48 c1 e0 04          	shl    rax,0x4
  800383:	48 01 c8             	add    rax,rcx
  800386:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
    idt[index].offset_high=(offset>>32)&0x0000ffff;
  80038a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80038e:	48 c1 e8 20          	shr    rax,0x20
  800392:	89 c1                	mov    ecx,eax
  800394:	48 8b 15 45 ae 00 00 	mov    rdx,QWORD PTR [rip+0xae45]        # 80b1e0 <idt>
  80039b:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80039f:	48 c1 e0 04          	shl    rax,0x4
  8003a3:	48 01 c2             	add    rdx,rax
  8003a6:	0f b7 c1             	movzx  eax,cx
  8003a9:	89 42 08             	mov    DWORD PTR [rdx+0x8],eax
    idt[index].attr=attr|1;//1是ist索引
  8003ac:	48 8b 15 2d ae 00 00 	mov    rdx,QWORD PTR [rip+0xae2d]        # 80b1e0 <idt>
  8003b3:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003b7:	48 c1 e0 04          	shl    rax,0x4
  8003bb:	48 01 d0             	add    rax,rdx
  8003be:	0f b7 55 ec          	movzx  edx,WORD PTR [rbp-0x14]
  8003c2:	83 ca 01             	or     edx,0x1
  8003c5:	66 89 50 04          	mov    WORD PTR [rax+0x4],dx
    idt[index].selector=selector;
  8003c9:	48 8b 15 10 ae 00 00 	mov    rdx,QWORD PTR [rip+0xae10]        # 80b1e0 <idt>
  8003d0:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003d4:	48 c1 e0 04          	shl    rax,0x4
  8003d8:	48 01 c2             	add    rdx,rax
  8003db:	0f b7 45 f8          	movzx  eax,WORD PTR [rbp-0x8]
  8003df:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    idt[index].rsvd=0;
  8003e3:	48 8b 15 f6 ad 00 00 	mov    rdx,QWORD PTR [rip+0xadf6]        # 80b1e0 <idt>
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
  80040d:	e8 cc 43 00 00       	call   8047de <eoi>
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
  800427:	e8 b2 43 00 00       	call   8047de <eoi>
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
  800441:	e8 98 43 00 00       	call   8047de <eoi>
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
  80045b:	e8 7e 43 00 00       	call   8047de <eoi>
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
  800475:	e8 64 43 00 00       	call   8047de <eoi>
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
  80048f:	e8 4a 43 00 00       	call   8047de <eoi>
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
  8004a8:	e8 31 43 00 00       	call   8047de <eoi>
    report_back_trace_of_err();
  8004ad:	b8 00 00 00 00       	mov    eax,0x0
  8004b2:	e8 52 43 00 00       	call   804809 <report_back_trace_of_err>
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
  8004cd:	e8 0c 43 00 00       	call   8047de <eoi>
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
  8004e7:	e8 f2 42 00 00       	call   8047de <eoi>
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
  800500:	e8 d9 42 00 00       	call   8047de <eoi>
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
  800519:	e8 c0 42 00 00       	call   8047de <eoi>
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
  800533:	e8 a6 42 00 00       	call   8047de <eoi>
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
  80054d:	e8 8c 42 00 00       	call   8047de <eoi>
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
  800571:	e8 68 42 00 00       	call   8047de <eoi>
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
  80058e:	e8 4b 42 00 00       	call   8047de <eoi>
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
int syscall(int func,int b,int c,int d,int e,int f)
{
  80059a:	f3 0f 1e fa          	endbr64 
  80059e:	55                   	push   rbp
  80059f:	48 89 e5             	mov    rbp,rsp
  8005a2:	48 83 ec 20          	sub    rsp,0x20
  8005a6:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  8005a9:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  8005ac:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  8005af:	89 4d f0             	mov    DWORD PTR [rbp-0x10],ecx
  8005b2:	44 89 45 ec          	mov    DWORD PTR [rbp-0x14],r8d
  8005b6:	44 89 4d e8          	mov    DWORD PTR [rbp-0x18],r9d
    switch (func)
  8005ba:	83 7d fc 64          	cmp    DWORD PTR [rbp-0x4],0x64
  8005be:	0f 87 21 02 00 00    	ja     8007e5 <syscall+0x24b>
  8005c4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8005c7:	48 8b 04 c5 20 29 81 	mov    rax,QWORD PTR [rax*8+0x812920]
  8005ce:	00 
  8005cf:	3e ff e0             	notrack jmp rax
    {
        case 0:return reg_device(b);
  8005d2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005d5:	48 98                	cdqe   
  8005d7:	48 89 c7             	mov    rdi,rax
  8005da:	e8 c2 1d 00 00       	call   8023a1 <reg_device>
  8005df:	e9 01 02 00 00       	jmp    8007e5 <syscall+0x24b>
        case 1:return dispose_device(b);
  8005e4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005e7:	89 c7                	mov    edi,eax
  8005e9:	e8 12 28 00 00       	call   802e00 <dispose_device>
  8005ee:	e9 f2 01 00 00       	jmp    8007e5 <syscall+0x24b>
        case 2:return reg_driver(b);
  8005f3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005f6:	48 98                	cdqe   
  8005f8:	48 89 c7             	mov    rdi,rax
  8005fb:	e8 89 20 00 00       	call   802689 <reg_driver>
  800600:	e9 e0 01 00 00       	jmp    8007e5 <syscall+0x24b>
        case 3:return dispose_driver(b);
  800605:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800608:	48 98                	cdqe   
  80060a:	48 89 c7             	mov    rdi,rax
  80060d:	e8 8c 28 00 00       	call   802e9e <dispose_driver>
  800612:	e9 ce 01 00 00       	jmp    8007e5 <syscall+0x24b>
        case 4:return call_drv_func(b,c,d);
  800617:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80061a:	48 98                	cdqe   
  80061c:	48 89 c2             	mov    rdx,rax
  80061f:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  800622:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800625:	89 ce                	mov    esi,ecx
  800627:	89 c7                	mov    edi,eax
  800629:	e8 7b 25 00 00       	call   802ba9 <call_drv_func>
  80062e:	e9 b2 01 00 00       	jmp    8007e5 <syscall+0x24b>
        case 5:return req_page_at(b,c);
  800633:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800636:	48 98                	cdqe   
  800638:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80063b:	89 d6                	mov    esi,edx
  80063d:	48 89 c7             	mov    rdi,rax
  800640:	e8 00 11 00 00       	call   801745 <req_page_at>
  800645:	e9 9b 01 00 00       	jmp    8007e5 <syscall+0x24b>
        case 6:return free_page(b);
  80064a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80064d:	48 98                	cdqe   
  80064f:	48 89 c7             	mov    rdi,rax
  800652:	e8 02 0f 00 00       	call   801559 <free_page>
  800657:	e9 89 01 00 00       	jmp    8007e5 <syscall+0x24b>
        case 7:return reg_proc(b, c, d);
  80065c:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80065f:	48 98                	cdqe   
  800661:	48 89 c2             	mov    rdx,rax
  800664:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  800667:	48 98                	cdqe   
  800669:	48 89 c1             	mov    rcx,rax
  80066c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80066f:	48 89 ce             	mov    rsi,rcx
  800672:	89 c7                	mov    edi,eax
  800674:	e8 f1 3a 00 00       	call   80416a <reg_proc>
  800679:	e9 67 01 00 00       	jmp    8007e5 <syscall+0x24b>
        case 8:del_proc(b);
  80067e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800681:	89 c7                	mov    edi,eax
  800683:	e8 b4 38 00 00       	call   803f3c <del_proc>
        case 10:chk_vm(b,c);
  800688:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80068b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80068e:	89 d6                	mov    esi,edx
  800690:	89 c7                	mov    edi,eax
  800692:	e8 87 11 00 00       	call   80181e <chk_vm>
        case 11:return sys_open(b,c);
  800697:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80069a:	48 98                	cdqe   
  80069c:	48 89 c2             	mov    rdx,rax
  80069f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8006a2:	89 c6                	mov    esi,eax
  8006a4:	48 89 d7             	mov    rdi,rdx
  8006a7:	e8 59 58 00 00       	call   805f05 <sys_open>
  8006ac:	e9 34 01 00 00       	jmp    8007e5 <syscall+0x24b>
        case 12:return sys_close(b);
  8006b1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006b4:	89 c7                	mov    edi,eax
  8006b6:	e8 61 5b 00 00       	call   80621c <sys_close>
  8006bb:	e9 25 01 00 00       	jmp    8007e5 <syscall+0x24b>
        case 13:return sys_read(b,c,d);
  8006c0:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8006c3:	48 63 d0             	movsxd rdx,eax
  8006c6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8006c9:	48 98                	cdqe   
  8006cb:	48 89 c1             	mov    rcx,rax
  8006ce:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006d1:	48 89 ce             	mov    rsi,rcx
  8006d4:	89 c7                	mov    edi,eax
  8006d6:	e8 f9 5b 00 00       	call   8062d4 <sys_read>
  8006db:	e9 05 01 00 00       	jmp    8007e5 <syscall+0x24b>
        case 14:return sys_write(b,c,d);
  8006e0:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8006e3:	48 63 d0             	movsxd rdx,eax
  8006e6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8006e9:	48 98                	cdqe   
  8006eb:	48 89 c1             	mov    rcx,rax
  8006ee:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006f1:	48 89 ce             	mov    rsi,rcx
  8006f4:	89 c7                	mov    edi,eax
  8006f6:	e8 89 5c 00 00       	call   806384 <sys_write>
  8006fb:	e9 e5 00 00 00       	jmp    8007e5 <syscall+0x24b>
        case 15:return sys_lseek(b,c,d);
  800700:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  800703:	48 63 c8             	movsxd rcx,eax
  800706:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  800709:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80070c:	48 89 ce             	mov    rsi,rcx
  80070f:	89 c7                	mov    edi,eax
  800711:	e8 1e 5d 00 00       	call   806434 <sys_lseek>
  800716:	e9 ca 00 00 00       	jmp    8007e5 <syscall+0x24b>
        case 16:return sys_tell(b);
  80071b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80071e:	89 c7                	mov    edi,eax
  800720:	e8 dd 14 00 00       	call   801c02 <sys_tell>
  800725:	e9 bb 00 00 00       	jmp    8007e5 <syscall+0x24b>
        case 17:return reg_vol(b,c,d);
  80072a:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80072d:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  800730:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800733:	89 ce                	mov    esi,ecx
  800735:	89 c7                	mov    edi,eax
  800737:	b8 00 00 00 00       	mov    eax,0x0
  80073c:	e8 b6 13 00 00       	call   801af7 <reg_vol>
  800741:	e9 9f 00 00 00       	jmp    8007e5 <syscall+0x24b>
        case 18:return free_vol(b);
  800746:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800749:	89 c7                	mov    edi,eax
  80074b:	b8 00 00 00 00       	mov    eax,0x0
  800750:	e8 86 13 00 00       	call   801adb <free_vol>
  800755:	e9 8b 00 00 00       	jmp    8007e5 <syscall+0x24b>
        case 19:return execute(b);
  80075a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80075d:	48 98                	cdqe   
  80075f:	48 89 c7             	mov    rdi,rax
  800762:	e8 28 43 00 00       	call   804a8f <execute>
  800767:	eb 7c                	jmp    8007e5 <syscall+0x24b>
        case SYSCALL_EXIT:return sys_exit(b);
  800769:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80076c:	89 c7                	mov    edi,eax
  80076e:	e8 d6 39 00 00       	call   804149 <sys_exit>
  800773:	eb 70                	jmp    8007e5 <syscall+0x24b>
        case SYSCALL_CALL:return exec_call(b);
  800775:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800778:	48 98                	cdqe   
  80077a:	48 89 c7             	mov    rdi,rax
  80077d:	e8 08 44 00 00       	call   804b8a <exec_call>
  800782:	eb 61                	jmp    8007e5 <syscall+0x24b>
        case SYSCALL_MKFIFO:return sys_mkfifo(b);
  800784:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800787:	89 c7                	mov    edi,eax
  800789:	e8 ee 11 00 00       	call   80197c <sys_mkfifo>
  80078e:	eb 55                	jmp    8007e5 <syscall+0x24b>
        case SYSCALL_MALLOC:return sys_malloc(b);
  800790:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800793:	89 c7                	mov    edi,eax
  800795:	e8 6b 3b 00 00       	call   804305 <sys_malloc>
  80079a:	eb 49                	jmp    8007e5 <syscall+0x24b>
        case SYSCALL_FREE:return sys_free(b);
  80079c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80079f:	89 c7                	mov    edi,eax
  8007a1:	e8 06 3d 00 00       	call   8044ac <sys_free>
  8007a6:	eb 3d                	jmp    8007e5 <syscall+0x24b>
        case SYSCALL_KB_READC:return sys_getkbc();
  8007a8:	b8 00 00 00 00       	mov    eax,0x0
  8007ad:	e8 96 63 00 00       	call   806b48 <sys_getkbc>
  8007b2:	0f be c0             	movsx  eax,al
  8007b5:	eb 2e                	jmp    8007e5 <syscall+0x24b>
        case SYSCALL_FIND_DEV:return sys_find_dev(b);
  8007b7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8007ba:	48 98                	cdqe   
  8007bc:	48 89 c7             	mov    rdi,rax
  8007bf:	e8 15 20 00 00       	call   8027d9 <sys_find_dev>
  8007c4:	eb 1f                	jmp    8007e5 <syscall+0x24b>
        case SYSCALL_OPERATE_DEV:return sys_operate_dev(b,c,d);
  8007c6:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8007c9:	48 98                	cdqe   
  8007cb:	48 89 c2             	mov    rdx,rax
  8007ce:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8007d1:	48 98                	cdqe   
  8007d3:	48 89 c1             	mov    rcx,rax
  8007d6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8007d9:	89 c6                	mov    esi,eax
  8007db:	48 89 cf             	mov    rdi,rcx
  8007de:	e8 88 20 00 00       	call   80286b <sys_operate_dev>
  8007e3:	eb 00                	jmp    8007e5 <syscall+0x24b>
    }
    // __asm__ volatile("mov %0,%%eax\r\n mov %1,%%ebx\r\n mov %2,%%ecx\r\n mov %3,%%edx\r\n mov %4,%%esi\r\n mov %5,%%edi"\
    // ::"m"(func),"m"(a),"m"(b),"m"(c),"m"(d),"m"(e));
    // __asm__ volatile("int $0x80\r\n leave\r\n ret");
}
  8007e5:	c9                   	leave  
  8007e6:	c3                   	ret    

00000000008007e7 <wrmsr>:
void wrmsr(unsigned long address,unsigned long value)
{
  8007e7:	f3 0f 1e fa          	endbr64 
  8007eb:	55                   	push   rbp
  8007ec:	48 89 e5             	mov    rbp,rsp
  8007ef:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8007f3:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    __asm__ __volatile__	("wrmsr	\n\t"::"d"(value >> 32),"a"(value & 0xffffffff),"c"(address):"memory");
  8007f7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8007fb:	48 c1 e8 20          	shr    rax,0x20
  8007ff:	48 89 c2             	mov    rdx,rax
  800802:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800806:	89 c0                	mov    eax,eax
  800808:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  80080c:	0f 30                	wrmsr  
  80080e:	90                   	nop
  80080f:	5d                   	pop    rbp
  800810:	c3                   	ret    

0000000000800811 <main>:
#include <kb.h>
#include "com.h"

int manage_proc_lock=1;
void main(unsigned int magic,void* addr)
{
  800811:	f3 0f 1e fa          	endbr64 
  800815:	55                   	push   rbp
  800816:	48 89 e5             	mov    rbp,rsp
  800819:	48 83 ec 60          	sub    rsp,0x60
  80081d:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  800820:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi

    struct multiboot_header* mbi=0ul;
  800824:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80082b:	00 
    mbi=(struct multiboot_header*)addr;
  80082c:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  800830:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    init_logging();
  800834:	b8 00 00 00 00       	mov    eax,0x0
  800839:	e8 36 03 00 00       	call   800b74 <init_logging>
    }
    //获取tags
    struct multiboot_tag *tag;

	unsigned size;
    size = *(unsigned long*)addr;
  80083e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  800842:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800845:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
//    //printf("Announced mbi size 0x%x\n", size);
	for (tag = (struct multiboot_tag *)(addr + 8);
  800848:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80084c:	48 83 c0 08          	add    rax,0x8
  800850:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  800854:	e9 5b 02 00 00       	jmp    800ab4 <main+0x2a3>
		 tag->type != MULTIBOOT_TAG_TYPE_END;
		 tag = (struct multiboot_tag *)((u8 *)tag + ((tag->size + 7) & ~7)))
	{
		//printf("Tag 0x%x, Size 0x%x\n", tag->type, tag->size);
		switch (tag->type)
  800859:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80085d:	8b 00                	mov    eax,DWORD PTR [rax]
  80085f:	83 f8 08             	cmp    eax,0x8
  800862:	0f 87 39 02 00 00    	ja     800aa1 <main+0x290>
  800868:	89 c0                	mov    eax,eax
  80086a:	48 8b 04 c5 88 2c 81 	mov    rax,QWORD PTR [rax*8+0x812c88]
  800871:	00 
  800872:	3e ff e0             	notrack jmp rax
			break;
		case MULTIBOOT_TAG_TYPE_BASIC_MEMINFO:
			//printf("mem_lower = %uKB, mem_upper = %uKB\n",
//				   ((struct multiboot_tag_basic_meminfo *)tag)->mem_lower,
//				   ((struct multiboot_tag_basic_meminfo *)tag)->mem_upper);
			set_high_mem_base(((struct multiboot_tag_basic_meminfo *)tag)->mem_lower);
  800875:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800879:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80087c:	89 c7                	mov    edi,eax
  80087e:	e8 cf 07 00 00       	call   801052 <set_high_mem_base>
			break;
  800883:	e9 19 02 00 00       	jmp    800aa1 <main+0x290>

			break;
		case MULTIBOOT_TAG_TYPE_MMAP:
		{
			//printf("mmap\n");
            for (multiboot_memory_map_t * mmap = ((struct multiboot_tag_mmap *)tag)->entries;
  800888:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80088c:	48 83 c0 10          	add    rax,0x10
  800890:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  800894:	eb 37                	jmp    8008cd <main+0xbc>
                    (multiboot_uint8_t *)mmap < (multiboot_uint8_t *)tag + tag->size;
                    mmap = (multiboot_memory_map_t *)((unsigned long)mmap + ((struct multiboot_tag_mmap *)tag)->entry_size))
            {
                set_mem_area(mmap->addr,mmap->len,mmap->type);
  800896:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80089a:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80089d:	89 c2                	mov    edx,eax
  80089f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8008a3:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  8008a7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8008ab:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8008ae:	48 89 ce             	mov    rsi,rcx
  8008b1:	48 89 c7             	mov    rdi,rax
  8008b4:	e8 b0 07 00 00       	call   801069 <set_mem_area>
                    mmap = (multiboot_memory_map_t *)((unsigned long)mmap + ((struct multiboot_tag_mmap *)tag)->entry_size))
  8008b9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008bd:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8008c0:	89 c2                	mov    edx,eax
  8008c2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8008c6:	48 01 d0             	add    rax,rdx
  8008c9:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
                    (multiboot_uint8_t *)mmap < (multiboot_uint8_t *)tag + tag->size;
  8008cd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008d1:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8008d4:	89 c2                	mov    edx,eax
  8008d6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008da:	48 01 d0             	add    rax,rdx
  8008dd:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  8008e1:	72 b3                	jb     800896 <main+0x85>
            }

		}
		break;
  8008e3:	e9 b9 01 00 00       	jmp    800aa1 <main+0x290>
		case MULTIBOOT_TAG_TYPE_FRAMEBUFFER:
		{
			multiboot_uint32_t color;
			unsigned i;
			struct multiboot_tag_framebuffer *tagfb = (struct multiboot_tag_framebuffer *)tag;
  8008e8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008ec:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
			void *fb = (void *) FRAMEBUFFER_ADDR;
  8008f0:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x40000000
  8008f7:	40 
			set_framebuffer(*tagfb);
  8008f8:	48 83 ec 08          	sub    rsp,0x8
  8008fc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800900:	ff 70 20             	push   QWORD PTR [rax+0x20]
  800903:	ff 70 18             	push   QWORD PTR [rax+0x18]
  800906:	ff 70 10             	push   QWORD PTR [rax+0x10]
  800909:	ff 70 08             	push   QWORD PTR [rax+0x8]
  80090c:	ff 30                	push   QWORD PTR [rax]
  80090e:	e8 1d 4d 00 00       	call   805630 <set_framebuffer>
  800913:	48 83 c4 30          	add    rsp,0x30

            init_framebuffer();
  800917:	b8 00 00 00 00       	mov    eax,0x0
  80091c:	e8 7a 4b 00 00       	call   80549b <init_framebuffer>
			switch (tagfb->common.framebuffer_type)
  800921:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800925:	0f b6 40 1d          	movzx  eax,BYTE PTR [rax+0x1d]
  800929:	0f b6 c0             	movzx  eax,al
  80092c:	83 f8 02             	cmp    eax,0x2
  80092f:	0f 84 5a 01 00 00    	je     800a8f <main+0x27e>
  800935:	83 f8 02             	cmp    eax,0x2
  800938:	0f 8f 5a 01 00 00    	jg     800a98 <main+0x287>
  80093e:	85 c0                	test   eax,eax
  800940:	74 0e                	je     800950 <main+0x13f>
  800942:	83 f8 01             	cmp    eax,0x1
  800945:	0f 84 15 01 00 00    	je     800a60 <main+0x24f>
  80094b:	e9 48 01 00 00       	jmp    800a98 <main+0x287>
			case MULTIBOOT_FRAMEBUFFER_TYPE_INDEXED:
			{
				unsigned best_distance, distance;
				struct multiboot_color *palette;

				palette = tagfb->framebuffer_palette;
  800950:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800954:	48 83 c0 22          	add    rax,0x22
  800958:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

				color = 0;
  80095c:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
				best_distance = 4 * 256 * 256;
  800963:	c7 45 e8 00 00 04 00 	mov    DWORD PTR [rbp-0x18],0x40000

				for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
  80096a:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  800971:	e9 d4 00 00 00       	jmp    800a4a <main+0x239>
				{
					distance = (0xff - palette[i].blue) * (0xff - palette[i].blue) + palette[i].red * palette[i].red + palette[i].green * palette[i].green;
  800976:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800979:	48 89 d0             	mov    rax,rdx
  80097c:	48 01 c0             	add    rax,rax
  80097f:	48 01 c2             	add    rdx,rax
  800982:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800986:	48 01 d0             	add    rax,rdx
  800989:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  80098d:	0f b6 c0             	movzx  eax,al
  800990:	ba ff 00 00 00       	mov    edx,0xff
  800995:	89 d1                	mov    ecx,edx
  800997:	29 c1                	sub    ecx,eax
  800999:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80099c:	48 89 d0             	mov    rax,rdx
  80099f:	48 01 c0             	add    rax,rax
  8009a2:	48 01 c2             	add    rdx,rax
  8009a5:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009a9:	48 01 d0             	add    rax,rdx
  8009ac:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  8009b0:	0f b6 d0             	movzx  edx,al
  8009b3:	b8 ff 00 00 00       	mov    eax,0xff
  8009b8:	29 d0                	sub    eax,edx
  8009ba:	89 ce                	mov    esi,ecx
  8009bc:	0f af f0             	imul   esi,eax
  8009bf:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009c2:	48 89 d0             	mov    rax,rdx
  8009c5:	48 01 c0             	add    rax,rax
  8009c8:	48 01 c2             	add    rdx,rax
  8009cb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009cf:	48 01 d0             	add    rax,rdx
  8009d2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8009d5:	0f b6 c8             	movzx  ecx,al
  8009d8:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009db:	48 89 d0             	mov    rax,rdx
  8009de:	48 01 c0             	add    rax,rax
  8009e1:	48 01 c2             	add    rdx,rax
  8009e4:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009e8:	48 01 d0             	add    rax,rdx
  8009eb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8009ee:	0f b6 c0             	movzx  eax,al
  8009f1:	0f af c1             	imul   eax,ecx
  8009f4:	01 c6                	add    esi,eax
  8009f6:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009f9:	48 89 d0             	mov    rax,rdx
  8009fc:	48 01 c0             	add    rax,rax
  8009ff:	48 01 c2             	add    rdx,rax
  800a02:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800a06:	48 01 d0             	add    rax,rdx
  800a09:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  800a0d:	0f b6 c8             	movzx  ecx,al
  800a10:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800a13:	48 89 d0             	mov    rax,rdx
  800a16:	48 01 c0             	add    rax,rax
  800a19:	48 01 c2             	add    rdx,rax
  800a1c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800a20:	48 01 d0             	add    rax,rdx
  800a23:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  800a27:	0f b6 c0             	movzx  eax,al
  800a2a:	0f af c1             	imul   eax,ecx
  800a2d:	01 f0                	add    eax,esi
  800a2f:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
					if (distance < best_distance)
  800a32:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  800a35:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  800a38:	73 0c                	jae    800a46 <main+0x235>
					{
						color = i;
  800a3a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800a3d:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
						best_distance = distance;
  800a40:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  800a43:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
				for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
  800a46:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  800a4a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800a4e:	0f b7 40 20          	movzx  eax,WORD PTR [rax+0x20]
  800a52:	0f b7 c0             	movzx  eax,ax
  800a55:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  800a58:	0f 82 18 ff ff ff    	jb     800976 <main+0x165>
					}
				}
			}
			break;
  800a5e:	eb 40                	jmp    800aa0 <main+0x28f>

			case MULTIBOOT_FRAMEBUFFER_TYPE_RGB:
				color = ((1 << tagfb->framebuffer_blue_mask_size) - 1) << tagfb->framebuffer_blue_field_position;
  800a60:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800a64:	0f b6 40 25          	movzx  eax,BYTE PTR [rax+0x25]
  800a68:	0f b6 c0             	movzx  eax,al
  800a6b:	ba 01 00 00 00       	mov    edx,0x1
  800a70:	89 c1                	mov    ecx,eax
  800a72:	d3 e2                	shl    edx,cl
  800a74:	89 d0                	mov    eax,edx
  800a76:	8d 50 ff             	lea    edx,[rax-0x1]
  800a79:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800a7d:	0f b6 40 24          	movzx  eax,BYTE PTR [rax+0x24]
  800a81:	0f b6 c0             	movzx  eax,al
  800a84:	89 c1                	mov    ecx,eax
  800a86:	d3 e2                	shl    edx,cl
  800a88:	89 d0                	mov    eax,edx
  800a8a:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
				break;
  800a8d:	eb 11                	jmp    800aa0 <main+0x28f>

			case MULTIBOOT_FRAMEBUFFER_TYPE_EGA_TEXT:
				color = '\\' | 0x0100;
  800a8f:	c7 45 c4 5c 01 00 00 	mov    DWORD PTR [rbp-0x3c],0x15c
				break;
  800a96:	eb 08                	jmp    800aa0 <main+0x28f>

			default:
				color = 0xffffffff;
  800a98:	c7 45 c4 ff ff ff ff 	mov    DWORD PTR [rbp-0x3c],0xffffffff
				break;
  800a9f:	90                   	nop
			}

			break;
  800aa0:	90                   	nop
		 tag = (struct multiboot_tag *)((u8 *)tag + ((tag->size + 7) & ~7)))
  800aa1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800aa5:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800aa8:	83 c0 07             	add    eax,0x7
  800aab:	89 c0                	mov    eax,eax
  800aad:	83 e0 f8             	and    eax,0xfffffff8
  800ab0:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
		 tag->type != MULTIBOOT_TAG_TYPE_END;
  800ab4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800ab8:	8b 00                	mov    eax,DWORD PTR [rax]
  800aba:	85 c0                	test   eax,eax
  800abc:	0f 85 97 fd ff ff    	jne    800859 <main+0x48>
		}
		}
	}
	tag = (struct multiboot_tag *)((multiboot_uint8_t *)tag + ((tag->size + 7) & ~7));
  800ac2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800ac6:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800ac9:	83 c0 07             	add    eax,0x7
  800acc:	89 c0                	mov    eax,eax
  800ace:	83 e0 f8             	and    eax,0xfffffff8
  800ad1:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
	//printf("Total mbi size 0x%x\n", (unsigned)tag - addr);
	char disk_count=*(char*)0x475;
  800ad5:	b8 75 04 00 00       	mov    eax,0x475
  800ada:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800add:	88 45 db             	mov    BYTE PTR [rbp-0x25],al
	//printf("disk count:%d\n",disk_count);
    init_font();
  800ae0:	b8 00 00 00 00       	mov    eax,0x0
  800ae5:	e8 70 4a 00 00       	call   80555a <init_font>
    //初始化区域
    //fill_rect(0,0,100,100,255);
    print("gamessis os loaded.\nkernel:>");
  800aea:	bf 48 2c 81 00       	mov    edi,0x812c48
  800aef:	e8 ff 4e 00 00       	call   8059f3 <print>
    init_int();
  800af4:	b8 00 00 00 00       	mov    eax,0x0
  800af9:	e8 02 f5 ff ff       	call   800000 <init_int>
    print("int loaded.\n");
  800afe:	bf 65 2c 81 00       	mov    edi,0x812c65
  800b03:	e8 eb 4e 00 00       	call   8059f3 <print>
//    set_tss(0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000);
    init_memory();
  800b08:	b8 00 00 00 00       	mov    eax,0x0
  800b0d:	e8 0e 08 00 00       	call   801320 <init_memory>
    init_com(PORT_COM1);
  800b12:	bf f8 03 00 00       	mov    edi,0x3f8
  800b17:	e8 78 9b 00 00       	call   80a694 <init_com>
    com_puts("gamessis os loaded.",PORT_COM1);
  800b1c:	be f8 03 00 00       	mov    esi,0x3f8
  800b21:	bf 72 2c 81 00       	mov    edi,0x812c72
  800b26:	e8 b5 9c 00 00       	call   80a7e0 <com_puts>
	init_paging();
  800b2b:	b8 00 00 00 00       	mov    eax,0x0
  800b30:	e8 12 05 00 00       	call   801047 <init_paging>
 	init_gdt();
  800b35:	b8 00 00 00 00       	mov    eax,0x0
  800b3a:	e8 ee 3c 00 00       	call   80482d <init_gdt>
    init_drvdev_man();
  800b3f:	b8 00 00 00 00       	mov    eax,0x0
  800b44:	e8 3e 18 00 00       	call   802387 <init_drvdev_man>
    init_proc();
  800b49:	b8 00 00 00 00       	mov    eax,0x0
  800b4e:	e8 1f 27 00 00       	call   803272 <init_proc>
    //自带驱动
    //init_tty();
    init_kb();
  800b53:	b8 00 00 00 00       	mov    eax,0x0
  800b58:	e8 b8 5e 00 00       	call   806a15 <init_kb>
//    init_disk();

    sti();
  800b5d:	fb                   	sti    
    DISK1_FAT32_FS_init();
  800b5e:	b8 00 00 00 00       	mov    eax,0x0
  800b63:	e8 92 91 00 00       	call   809cfa <DISK1_FAT32_FS_init>
    manage_proc_lock=0;
  800b68:	c7 05 76 a6 00 00 00 	mov    DWORD PTR [rip+0xa676],0x0        # 80b1e8 <manage_proc_lock>
  800b6f:	00 00 00 

//    extern device *dev_tree[];
//    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
//    mount_fs("fat16",p->par,vmalloc());

    while (1);
  800b72:	eb fe                	jmp    800b72 <main+0x361>

0000000000800b74 <init_logging>:
static unsigned char* video;
static int xpos,ypos;
/* 将整数 D 转换为字符串并保存在 BUF 中。如果 BASE 为 'd'，则 D 为十进制，如果 BASE 为 'x'，则 D 为十六进制。 */

int init_logging()
{
  800b74:	f3 0f 1e fa          	endbr64 
  800b78:	55                   	push   rbp
  800b79:	48 89 e5             	mov    rbp,rsp
    video=0xb8000;
  800b7c:	48 c7 05 79 f4 bf ff 	mov    QWORD PTR [rip+0xffffffffffbff479],0xb8000        # 400000 <video>
  800b83:	00 80 0b 00 
    xpos=0;
  800b87:	c7 05 77 f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff477],0x0        # 400008 <xpos>
  800b8e:	00 00 00 
    ypos=0;
  800b91:	c7 05 71 f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff471],0x0        # 40000c <ypos>
  800b98:	00 00 00 
}
  800b9b:	90                   	nop
  800b9c:	5d                   	pop    rbp
  800b9d:	c3                   	ret    

0000000000800b9e <itoa>:

static void itoa (char *buf, int base, int d)
{
  800b9e:	f3 0f 1e fa          	endbr64 
  800ba2:	55                   	push   rbp
  800ba3:	48 89 e5             	mov    rbp,rsp
  800ba6:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  800baa:	89 75 c4             	mov    DWORD PTR [rbp-0x3c],esi
  800bad:	89 55 c0             	mov    DWORD PTR [rbp-0x40],edx
    char *p = buf;
  800bb0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800bb4:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char *p1, *p2;
    unsigned long ud = d;
  800bb8:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800bbb:	48 98                	cdqe   
  800bbd:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    int divisor = 10;
  800bc1:	c7 45 dc 0a 00 00 00 	mov    DWORD PTR [rbp-0x24],0xa
 
    /* 如果指定了 %d 并且 D 是负数，在开始添上负号。 */
    if (base == 'd' && d < 0)
  800bc8:	83 7d c4 64          	cmp    DWORD PTR [rbp-0x3c],0x64
  800bcc:	75 27                	jne    800bf5 <itoa+0x57>
  800bce:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
  800bd2:	79 21                	jns    800bf5 <itoa+0x57>
    {
        *p++ = '-';
  800bd4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800bd8:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800bdc:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800be0:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
        buf++;
  800be3:	48 83 45 c8 01       	add    QWORD PTR [rbp-0x38],0x1
        ud = -d;
  800be8:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800beb:	f7 d8                	neg    eax
  800bed:	48 98                	cdqe   
  800bef:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800bf3:	eb 0d                	jmp    800c02 <itoa+0x64>
    }
    else if (base == 'x')
  800bf5:	83 7d c4 78          	cmp    DWORD PTR [rbp-0x3c],0x78
  800bf9:	75 07                	jne    800c02 <itoa+0x64>
        divisor = 16;
  800bfb:	c7 45 dc 10 00 00 00 	mov    DWORD PTR [rbp-0x24],0x10
 
    /* 用 DIVISOR 去除 UD 直到 UD == 0。 */
    do
    {
        int remainder = ud % divisor;
  800c02:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800c05:	48 63 c8             	movsxd rcx,eax
  800c08:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800c0c:	ba 00 00 00 00       	mov    edx,0x0
  800c11:	48 f7 f1             	div    rcx
  800c14:	48 89 d0             	mov    rax,rdx
  800c17:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
 
        *p++ = (remainder < 10) ? remainder + '0' : remainder + 'a' - 10;
  800c1a:	83 7d d8 09          	cmp    DWORD PTR [rbp-0x28],0x9
  800c1e:	7f 0a                	jg     800c2a <itoa+0x8c>
  800c20:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800c23:	83 c0 30             	add    eax,0x30
  800c26:	89 c1                	mov    ecx,eax
  800c28:	eb 08                	jmp    800c32 <itoa+0x94>
  800c2a:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800c2d:	83 c0 57             	add    eax,0x57
  800c30:	89 c1                	mov    ecx,eax
  800c32:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c36:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800c3a:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800c3e:	88 08                	mov    BYTE PTR [rax],cl
    }
    while (ud /= divisor);
  800c40:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800c43:	48 63 f0             	movsxd rsi,eax
  800c46:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800c4a:	ba 00 00 00 00       	mov    edx,0x0
  800c4f:	48 f7 f6             	div    rsi
  800c52:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800c56:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  800c5b:	75 a5                	jne    800c02 <itoa+0x64>
 
    /* 在字符串尾添上终结符。 */
    *p = 0;
  800c5d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c61:	c6 00 00             	mov    BYTE PTR [rax],0x0
 
    /* 反转 BUF。 */
    p1 = buf;
  800c64:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800c68:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    p2 = p - 1;
  800c6c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c70:	48 83 e8 01          	sub    rax,0x1
  800c74:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    while (p1 < p2)
  800c78:	eb 2b                	jmp    800ca5 <itoa+0x107>
    {
        char tmp = *p1;
  800c7a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800c7e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800c81:	88 45 d7             	mov    BYTE PTR [rbp-0x29],al
        *p1 = *p2;
  800c84:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800c88:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  800c8b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800c8f:	88 10                	mov    BYTE PTR [rax],dl
        *p2 = tmp;
  800c91:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800c95:	0f b6 55 d7          	movzx  edx,BYTE PTR [rbp-0x29]
  800c99:	88 10                	mov    BYTE PTR [rax],dl
        p1++;
  800c9b:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        p2--;
  800ca0:	48 83 6d e8 01       	sub    QWORD PTR [rbp-0x18],0x1
    while (p1 < p2)
  800ca5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800ca9:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
  800cad:	72 cb                	jb     800c7a <itoa+0xdc>
    }
}
  800caf:	90                   	nop
  800cb0:	90                   	nop
  800cb1:	5d                   	pop    rbp
  800cb2:	c3                   	ret    

0000000000800cb3 <putchar>:
 
/* 在屏幕上输出字符 C 。 */
static void putchar (char c)
{
  800cb3:	f3 0f 1e fa          	endbr64 
  800cb7:	55                   	push   rbp
  800cb8:	48 89 e5             	mov    rbp,rsp
  800cbb:	48 83 ec 20          	sub    rsp,0x20
  800cbf:	89 f8                	mov    eax,edi
  800cc1:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    char s[2]={c,'\0'};
  800cc4:	0f b6 45 ec          	movzx  eax,BYTE PTR [rbp-0x14]
  800cc8:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
  800ccb:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
    print(s);
  800ccf:	48 8d 45 fe          	lea    rax,[rbp-0x2]
  800cd3:	48 89 c7             	mov    rdi,rax
  800cd6:	e8 18 4d 00 00       	call   8059f3 <print>
    *(video + (xpos + ypos * COLUMNS) * 2 + 1) = ATTRIBUTE;
 
    xpos++;
    if (xpos >= COLUMNS)
        goto newline;
}
  800cdb:	c9                   	leave  
  800cdc:	c3                   	ret    

0000000000800cdd <printf>:
 
/* 格式化字符串并在屏幕上输出，就像 libc 函数 printf 一样。 */
void printf (const char *format, ...)
{
  800cdd:	f3 0f 1e fa          	endbr64 
  800ce1:	55                   	push   rbp
  800ce2:	48 89 e5             	mov    rbp,rsp
  800ce5:	48 81 ec f0 00 00 00 	sub    rsp,0xf0
  800cec:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
  800cf3:	48 89 b5 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rsi
  800cfa:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  800d01:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  800d08:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  800d0f:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  800d16:	84 c0                	test   al,al
  800d18:	74 20                	je     800d3a <printf+0x5d>
  800d1a:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  800d1e:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  800d22:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  800d26:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  800d2a:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  800d2e:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  800d32:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  800d36:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7
    char **arg = (char **) &format;
  800d3a:	48 8d 85 18 ff ff ff 	lea    rax,[rbp-0xe8]
  800d41:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char c;
    char buf[20];
 
    arg++;
  800d48:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x8
  800d4f:	08 
 
    while ((c = *format++) != 0)
  800d50:	e9 29 01 00 00       	jmp    800e7e <printf+0x1a1>
    {
        if (c != '%')
  800d55:	80 bd 3f ff ff ff 25 	cmp    BYTE PTR [rbp-0xc1],0x25
  800d5c:	74 13                	je     800d71 <printf+0x94>
            putchar (c);
  800d5e:	0f be 85 3f ff ff ff 	movsx  eax,BYTE PTR [rbp-0xc1]
  800d65:	89 c7                	mov    edi,eax
  800d67:	e8 47 ff ff ff       	call   800cb3 <putchar>
  800d6c:	e9 0d 01 00 00       	jmp    800e7e <printf+0x1a1>
        else
        {
            char *p;
 
            c = *format++;
  800d71:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800d78:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800d7c:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800d83:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800d86:	88 85 3f ff ff ff    	mov    BYTE PTR [rbp-0xc1],al
            switch (c)
  800d8c:	0f be 85 3f ff ff ff 	movsx  eax,BYTE PTR [rbp-0xc1]
  800d93:	83 f8 78             	cmp    eax,0x78
  800d96:	74 26                	je     800dbe <printf+0xe1>
  800d98:	83 f8 78             	cmp    eax,0x78
  800d9b:	0f 8f be 00 00 00    	jg     800e5f <printf+0x182>
  800da1:	83 f8 75             	cmp    eax,0x75
  800da4:	74 18                	je     800dbe <printf+0xe1>
  800da6:	83 f8 75             	cmp    eax,0x75
  800da9:	0f 8f b0 00 00 00    	jg     800e5f <printf+0x182>
  800daf:	83 f8 64             	cmp    eax,0x64
  800db2:	74 0a                	je     800dbe <printf+0xe1>
  800db4:	83 f8 73             	cmp    eax,0x73
  800db7:	74 41                	je     800dfa <printf+0x11d>
  800db9:	e9 a1 00 00 00       	jmp    800e5f <printf+0x182>
            {
            case 'd':
            case 'u':
            case 'x':
                itoa (buf, c, *((int *) arg++));
  800dbe:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800dc5:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800dc9:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800dd0:	8b 10                	mov    edx,DWORD PTR [rax]
  800dd2:	0f be 8d 3f ff ff ff 	movsx  ecx,BYTE PTR [rbp-0xc1]
  800dd9:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800de0:	89 ce                	mov    esi,ecx
  800de2:	48 89 c7             	mov    rdi,rax
  800de5:	e8 b4 fd ff ff       	call   800b9e <itoa>
                p = buf;
  800dea:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800df1:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                goto string;
  800df8:	eb 34                	jmp    800e2e <printf+0x151>
                break;
 
            case 's':
                p = *arg++;
  800dfa:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e01:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800e05:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800e0c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800e0f:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                if (! p)
  800e16:	48 83 bd 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],0x0
  800e1d:	00 
  800e1e:	75 0d                	jne    800e2d <printf+0x150>
                    p = "(null)";
  800e20:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x812cd0
  800e27:	d0 2c 81 00 
  800e2b:	eb 22                	jmp    800e4f <printf+0x172>
 
string:
  800e2d:	90                   	nop
                while (*p)
  800e2e:	eb 1f                	jmp    800e4f <printf+0x172>
                    putchar (*p++);
  800e30:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800e37:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800e3b:	48 89 95 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rdx
  800e42:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800e45:	0f be c0             	movsx  eax,al
  800e48:	89 c7                	mov    edi,eax
  800e4a:	e8 64 fe ff ff       	call   800cb3 <putchar>
                while (*p)
  800e4f:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800e56:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800e59:	84 c0                	test   al,al
  800e5b:	75 d3                	jne    800e30 <printf+0x153>
                break;
  800e5d:	eb 1f                	jmp    800e7e <printf+0x1a1>
 
            default:
                putchar (*((int *) arg++));
  800e5f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e66:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800e6a:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800e71:	8b 00                	mov    eax,DWORD PTR [rax]
  800e73:	0f be c0             	movsx  eax,al
  800e76:	89 c7                	mov    edi,eax
  800e78:	e8 36 fe ff ff       	call   800cb3 <putchar>
                break;
  800e7d:	90                   	nop
    while ((c = *format++) != 0)
  800e7e:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800e85:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800e89:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800e90:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800e93:	88 85 3f ff ff ff    	mov    BYTE PTR [rbp-0xc1],al
  800e99:	80 bd 3f ff ff ff 00 	cmp    BYTE PTR [rbp-0xc1],0x0
  800ea0:	0f 85 af fe ff ff    	jne    800d55 <printf+0x78>
            }
        }
    }
}
  800ea6:	90                   	nop
  800ea7:	90                   	nop
  800ea8:	c9                   	leave  
  800ea9:	c3                   	ret    

0000000000800eaa <mmap>:
//以kb为单位
int high_mem_base=1024;
int mmap_t_i=0;

stat_t mmap(addr_t pa,addr_t la,u32 attr)
{
  800eaa:	f3 0f 1e fa          	endbr64 
  800eae:	55                   	push   rbp
  800eaf:	48 89 e5             	mov    rbp,rsp
  800eb2:	48 83 ec 40          	sub    rsp,0x40
  800eb6:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  800eba:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  800ebe:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    page_item *pdptp= (page_item *) (pml4[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
  800ec1:	48 8b 15 38 a3 00 00 	mov    rdx,QWORD PTR [rip+0xa338]        # 80b200 <pml4>
  800ec8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800ecc:	48 c1 e8 27          	shr    rax,0x27
  800ed0:	48 c1 e0 03          	shl    rax,0x3
  800ed4:	48 01 d0             	add    rax,rdx
  800ed7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800eda:	b0 00                	mov    al,0x0
  800edc:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
  800ee0:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  800ee7:	00 00 00 
  800eea:	48 23 45 d0          	and    rax,QWORD PTR [rbp-0x30]
  800eee:	48 c1 e8 1e          	shr    rax,0x1e
  800ef2:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
  800ef5:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800ef8:	48 98                	cdqe   
  800efa:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800f01:	00 
  800f02:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800f06:	48 01 d0             	add    rax,rdx
  800f09:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f0c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
  800f10:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f14:	83 e0 01             	and    eax,0x1
  800f17:	48 85 c0             	test   rax,rax
  800f1a:	75 45                	jne    800f61 <mmap+0xb7>
    {
        pdp=(page_item*)vmalloc();
  800f1c:	b8 00 00 00 00       	mov    eax,0x0
  800f21:	e8 cf 01 00 00       	call   8010f5 <vmalloc>
  800f26:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        memset(pdp,0,4096);
  800f2a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f2e:	ba 00 10 00 00       	mov    edx,0x1000
  800f33:	be 00 00 00 00       	mov    esi,0x0
  800f38:	48 89 c7             	mov    rdi,rax
  800f3b:	e8 90 99 00 00       	call   80a8d0 <memset>
        pdptp[pdpti]=(addr_t)pdp|attr;
  800f40:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800f43:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  800f47:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800f4a:	48 98                	cdqe   
  800f4c:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800f53:	00 
  800f54:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800f58:	48 01 f0             	add    rax,rsi
  800f5b:	48 09 ca             	or     rdx,rcx
  800f5e:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pdp=(page_item*)((addr_t)pdp&~0xff);
  800f61:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f65:	b0 00                	mov    al,0x0
  800f67:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
  800f6b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800f6f:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800f74:	48 c1 e8 15          	shr    rax,0x15
  800f78:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800f7f:	00 
  800f80:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f84:	48 01 d0             	add    rax,rdx
  800f87:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f8a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!((unsigned long long)pt & PAGE_PRESENT))
  800f8e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800f92:	83 e0 01             	and    eax,0x1
  800f95:	48 85 c0             	test   rax,rax
  800f98:	75 4d                	jne    800fe7 <mmap+0x13d>
    {
        pt=(page_item*)vmalloc();
  800f9a:	b8 00 00 00 00       	mov    eax,0x0
  800f9f:	e8 51 01 00 00       	call   8010f5 <vmalloc>
  800fa4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        memset(pt,0,4096);
  800fa8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800fac:	ba 00 10 00 00       	mov    edx,0x1000
  800fb1:	be 00 00 00 00       	mov    esi,0x0
  800fb6:	48 89 c7             	mov    rdi,rax
  800fb9:	e8 12 99 00 00       	call   80a8d0 <memset>
        pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
  800fbe:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800fc1:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800fc5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800fc9:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800fce:	48 c1 e8 15          	shr    rax,0x15
  800fd2:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800fd9:	00 
  800fda:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800fde:	48 01 f0             	add    rax,rsi
  800fe1:	48 09 ca             	or     rdx,rcx
  800fe4:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pt=(page_item*)((addr_t)pt & ~0xff);
  800fe7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800feb:	b0 00                	mov    al,0x0
  800fed:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
  800ff1:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  800ff4:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  800ff8:	81 e2 ff ff 1f 00    	and    edx,0x1fffff
  800ffe:	48 c1 ea 0c          	shr    rdx,0xc
  801002:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
  801009:	00 
  80100a:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80100e:	48 01 ca             	add    rdx,rcx
  801011:	48 0b 45 d8          	or     rax,QWORD PTR [rbp-0x28]
  801015:	48 89 02             	mov    QWORD PTR [rdx],rax
    return NORMAL;
  801018:	b8 00 00 00 00       	mov    eax,0x0
}
  80101d:	c9                   	leave  
  80101e:	c3                   	ret    

000000000080101f <mdemap>:

stat_t mdemap(addr_t la)
{
  80101f:	f3 0f 1e fa          	endbr64 
  801023:	55                   	push   rbp
  801024:	48 89 e5             	mov    rbp,rsp
  801027:	48 83 ec 10          	sub    rsp,0x10
  80102b:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return mmap(0l,la,0);
  80102f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801033:	ba 00 00 00 00       	mov    edx,0x0
  801038:	48 89 c6             	mov    rsi,rax
  80103b:	bf 00 00 00 00       	mov    edi,0x0
  801040:	e8 65 fe ff ff       	call   800eaa <mmap>
}
  801045:	c9                   	leave  
  801046:	c3                   	ret    

0000000000801047 <init_paging>:
int init_paging()
{
  801047:	f3 0f 1e fa          	endbr64 
  80104b:	55                   	push   rbp
  80104c:	48 89 e5             	mov    rbp,rsp
    //设置第一项pdpte，也就是内核空间
//    set_1gb_pdpt(pdpt,0,PAGE_RWX);//设置PDPT0x40000000ul
//    set_page_item(pdpt+1,PD_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);

    #endif
}
  80104f:	90                   	nop
  801050:	5d                   	pop    rbp
  801051:	c3                   	ret    

0000000000801052 <set_high_mem_base>:
void set_high_mem_base(int base)
{
  801052:	f3 0f 1e fa          	endbr64 
  801056:	55                   	push   rbp
  801057:	48 89 e5             	mov    rbp,rsp
  80105a:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    high_mem_base=base;
  80105d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801060:	89 05 b2 a1 00 00    	mov    DWORD PTR [rip+0xa1b2],eax        # 80b218 <high_mem_base>
}
  801066:	90                   	nop
  801067:	5d                   	pop    rbp
  801068:	c3                   	ret    

0000000000801069 <set_mem_area>:
void set_mem_area(unsigned long base, unsigned long len, unsigned long type)
{
  801069:	f3 0f 1e fa          	endbr64 
  80106d:	55                   	push   rbp
  80106e:	48 89 e5             	mov    rbp,rsp
  801071:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  801075:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  801079:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
    mmap_struct[mmap_t_i].base=base;
  80107d:	8b 05 9d f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff19d]        # 400220 <mmap_t_i>
  801083:	48 63 d0             	movsxd rdx,eax
  801086:	48 89 d0             	mov    rax,rdx
  801089:	48 01 c0             	add    rax,rax
  80108c:	48 01 d0             	add    rax,rdx
  80108f:	48 c1 e0 03          	shl    rax,0x3
  801093:	48 8d 90 40 00 40 00 	lea    rdx,[rax+0x400040]
  80109a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80109e:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i].len=len;
  8010a1:	8b 05 79 f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff179]        # 400220 <mmap_t_i>
  8010a7:	48 63 d0             	movsxd rdx,eax
  8010aa:	48 89 d0             	mov    rax,rdx
  8010ad:	48 01 c0             	add    rax,rax
  8010b0:	48 01 d0             	add    rax,rdx
  8010b3:	48 c1 e0 03          	shl    rax,0x3
  8010b7:	48 8d 90 48 00 40 00 	lea    rdx,[rax+0x400048]
  8010be:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8010c2:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i++].type=type;
  8010c5:	8b 05 55 f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff155]        # 400220 <mmap_t_i>
  8010cb:	8d 50 01             	lea    edx,[rax+0x1]
  8010ce:	89 15 4c f1 bf ff    	mov    DWORD PTR [rip+0xffffffffffbff14c],edx        # 400220 <mmap_t_i>
  8010d4:	48 63 d0             	movsxd rdx,eax
  8010d7:	48 89 d0             	mov    rax,rdx
  8010da:	48 01 c0             	add    rax,rax
  8010dd:	48 01 d0             	add    rax,rdx
  8010e0:	48 c1 e0 03          	shl    rax,0x3
  8010e4:	48 8d 90 50 00 40 00 	lea    rdx,[rax+0x400050]
  8010eb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8010ef:	48 89 02             	mov    QWORD PTR [rdx],rax
}
  8010f2:	90                   	nop
  8010f3:	5d                   	pop    rbp
  8010f4:	c3                   	ret    

00000000008010f5 <vmalloc>:
addr_t vmalloc()
{
  8010f5:	f3 0f 1e fa          	endbr64 
  8010f9:	55                   	push   rbp
  8010fa:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<VMALLOC_PGN/32;i++)
  8010fd:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801104:	eb 76                	jmp    80117c <vmalloc+0x87>
    {
        for(int j=0;j<32;j++)
  801106:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80110d:	eb 63                	jmp    801172 <vmalloc+0x7d>
        {
            if(!(vmalloc_map[i]&(1<<j)))
  80110f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801112:	48 98                	cdqe   
  801114:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  80111b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80111e:	be 01 00 00 00       	mov    esi,0x1
  801123:	89 c1                	mov    ecx,eax
  801125:	d3 e6                	shl    esi,cl
  801127:	89 f0                	mov    eax,esi
  801129:	21 d0                	and    eax,edx
  80112b:	85 c0                	test   eax,eax
  80112d:	75 3f                	jne    80116e <vmalloc+0x79>
            {
                vmalloc_map[i]|=(1<<j);
  80112f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801132:	48 98                	cdqe   
  801134:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  80113b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80113e:	be 01 00 00 00       	mov    esi,0x1
  801143:	89 c1                	mov    ecx,eax
  801145:	d3 e6                	shl    esi,cl
  801147:	89 f0                	mov    eax,esi
  801149:	09 c2                	or     edx,eax
  80114b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80114e:	48 98                	cdqe   
  801150:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
                return VMALLOC_BASE+(i*32+j)*0x1000;
  801157:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80115a:	c1 e0 05             	shl    eax,0x5
  80115d:	89 c2                	mov    edx,eax
  80115f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801162:	01 d0                	add    eax,edx
  801164:	83 c0 20             	add    eax,0x20
  801167:	c1 e0 0c             	shl    eax,0xc
  80116a:	48 98                	cdqe   
  80116c:	eb 14                	jmp    801182 <vmalloc+0x8d>
        for(int j=0;j<32;j++)
  80116e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801172:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  801176:	7e 97                	jle    80110f <vmalloc+0x1a>
    for(int i=0;i<VMALLOC_PGN/32;i++)
  801178:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80117c:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  801180:	7e 84                	jle    801106 <vmalloc+0x11>
            }
        }
    }
}
  801182:	5d                   	pop    rbp
  801183:	c3                   	ret    

0000000000801184 <vmfree>:

int vmfree(addr_t ptr)
{
  801184:	f3 0f 1e fa          	endbr64 
  801188:	55                   	push   rbp
  801189:	48 89 e5             	mov    rbp,rsp
  80118c:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=ptr/PAGE_SIZE;
  801190:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801194:	48 c1 e8 0c          	shr    rax,0xc
  801198:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  80119b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80119e:	8d 50 1f             	lea    edx,[rax+0x1f]
  8011a1:	85 c0                	test   eax,eax
  8011a3:	0f 48 c2             	cmovs  eax,edx
  8011a6:	c1 f8 05             	sar    eax,0x5
  8011a9:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  8011ac:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8011af:	99                   	cdq    
  8011b0:	c1 ea 1b             	shr    edx,0x1b
  8011b3:	01 d0                	add    eax,edx
  8011b5:	83 e0 1f             	and    eax,0x1f
  8011b8:	29 d0                	sub    eax,edx
  8011ba:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    vmalloc_map[n]=vmalloc_map[n]&~(unsigned int)(1<<r);
  8011bd:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8011c0:	48 98                	cdqe   
  8011c2:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  8011c9:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8011cc:	be 01 00 00 00       	mov    esi,0x1
  8011d1:	89 c1                	mov    ecx,eax
  8011d3:	d3 e6                	shl    esi,cl
  8011d5:	89 f0                	mov    eax,esi
  8011d7:	f7 d0                	not    eax
  8011d9:	21 c2                	and    edx,eax
  8011db:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8011de:	48 98                	cdqe   
  8011e0:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
}
  8011e7:	90                   	nop
  8011e8:	5d                   	pop    rbp
  8011e9:	c3                   	ret    

00000000008011ea <page_err>:
void page_err(){
  8011ea:	f3 0f 1e fa          	endbr64 
  8011ee:	55                   	push   rbp
  8011ef:	48 89 e5             	mov    rbp,rsp
  8011f2:	53                   	push   rbx
  8011f3:	48 83 ec 28          	sub    rsp,0x28
    asm("cli");
  8011f7:	fa                   	cli    
    print("page err\n");
  8011f8:	bf d8 2c 81 00       	mov    edi,0x812cd8
  8011fd:	e8 f1 47 00 00       	call   8059f3 <print>
    unsigned long err_code=0,l_addr=0;
  801202:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  801209:	00 
  80120a:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  801211:	00 
    asm volatile("mov 0(%%rbp),%0":"=r"(err_code));
  801212:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
  801216:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    asm volatile("mov %%cr2,%0":"=r"(l_addr));//试图访问的地址
  80121a:	0f 20 d0             	mov    rax,cr2
  80121d:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    int p=err_code&1;
  801221:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801225:	83 e0 01             	and    eax,0x1
  801228:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

    if(!p)
  80122b:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80122f:	75 27                	jne    801258 <page_err+0x6e>
        //accessing non-existent page
        //检查地址合法性
        if(l_addr>=MEM_END)
            ;
        //在进程的页表中申请新页
        mmap(vmalloc(),l_addr&~0xfff,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  801231:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801235:	48 25 00 f0 ff ff    	and    rax,0xfffffffffffff000
  80123b:	48 89 c3             	mov    rbx,rax
  80123e:	b8 00 00 00 00       	mov    eax,0x0
  801243:	e8 ad fe ff ff       	call   8010f5 <vmalloc>
  801248:	ba 07 00 00 00       	mov    edx,0x7
  80124d:	48 89 de             	mov    rsi,rbx
  801250:	48 89 c7             	mov    rdi,rax
  801253:	e8 52 fc ff ff       	call   800eaa <mmap>
    }
    else
    {
        //page level protection
    }
    p=err_code&2;
  801258:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80125c:	83 e0 02             	and    eax,0x2
  80125f:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("when writing\n");else //puts("when reading");
  801262:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801266:	74 0c                	je     801274 <page_err+0x8a>
  801268:	bf e2 2c 81 00       	mov    edi,0x812ce2
  80126d:	e8 81 47 00 00       	call   8059f3 <print>
  801272:	eb 0a                	jmp    80127e <page_err+0x94>
    p=err_code&4;
  801274:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801278:	83 e0 04             	and    eax,0x4
  80127b:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(!p)print("supervisor mode\n");else //puts("user mode");
  80127e:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801282:	75 0c                	jne    801290 <page_err+0xa6>
  801284:	bf f0 2c 81 00       	mov    edi,0x812cf0
  801289:	e8 65 47 00 00       	call   8059f3 <print>
  80128e:	eb 0a                	jmp    80129a <page_err+0xb0>
    p=err_code&16;
  801290:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801294:	83 e0 10             	and    eax,0x10
  801297:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("an instruction tries to fetch\n");
  80129a:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80129e:	74 0a                	je     8012aa <page_err+0xc0>
  8012a0:	bf 08 2d 81 00       	mov    edi,0x812d08
  8012a5:	e8 49 47 00 00       	call   8059f3 <print>
    unsigned int addr=0;
  8012aa:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
    asm volatile("mov 8(%%ebp),%0":"=r"(addr));
  8012b1:	67 8b 45 08          	mov    eax,DWORD PTR [ebp+0x8]
  8012b5:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    printf("occurred at %x(paddr), %x(laddr)\n",addr,l_addr);
  8012b8:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8012bc:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8012bf:	89 c6                	mov    esi,eax
  8012c1:	bf 28 2d 81 00       	mov    edi,0x812d28
  8012c6:	b8 00 00 00 00       	mov    eax,0x0
  8012cb:	e8 0d fa ff ff       	call   800cdd <printf>
    extern int cur_proc;
    extern struct process *task;
    if(task[cur_proc].pid==1)//系统进程
  8012d0:	48 8b 0d c9 71 c0 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc071c9]        # 4084a0 <task>
  8012d7:	8b 05 4f 32 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1324f]        # 41452c <cur_proc>
  8012dd:	48 63 d0             	movsxd rdx,eax
  8012e0:	48 89 d0             	mov    rax,rdx
  8012e3:	48 01 c0             	add    rax,rax
  8012e6:	48 01 d0             	add    rax,rdx
  8012e9:	48 c1 e0 08          	shl    rax,0x8
  8012ed:	48 01 c8             	add    rax,rcx
  8012f0:	8b 00                	mov    eax,DWORD PTR [rax]
  8012f2:	83 f8 01             	cmp    eax,0x1
  8012f5:	75 11                	jne    801308 <page_err+0x11e>
    {
        printf("sys died. please reboot.\n");
  8012f7:	bf 4a 2d 81 00       	mov    edi,0x812d4a
  8012fc:	b8 00 00 00 00       	mov    eax,0x0
  801301:	e8 d7 f9 ff ff       	call   800cdd <printf>
        asm volatile("jmp .");
  801306:	eb fe                	jmp    801306 <page_err+0x11c>
    }
    //杀死问题进程
//    del_proc(cur_proc);
    // printf("killed the problem process.\n");
    // printf("shell:>");
    eoi();
  801308:	b8 00 00 00 00       	mov    eax,0x0
  80130d:	e8 cc 34 00 00       	call   8047de <eoi>
    //这里对esp的加法是必要的，因为page fault多push了一个错误码，但是iret识别不了
    __asm__ volatile ("sti \r\n  leave\n add $8,%esp \n iretq");
  801312:	fb                   	sti    
  801313:	c9                   	leave  
  801314:	83 c4 08             	add    esp,0x8
  801317:	48 cf                	iretq  
}
  801319:	90                   	nop
  80131a:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80131e:	c9                   	leave  
  80131f:	c3                   	ret    

0000000000801320 <init_memory>:
void init_memory()
{
  801320:	f3 0f 1e fa          	endbr64 
  801324:	55                   	push   rbp
  801325:	48 89 e5             	mov    rbp,rsp
    extern addr_t _knl_end,_knl_start;//lds中声明的内核的结尾地址，放置位图
    //获取内存大小
    size_t mem_size=mmap_struct[mmap_t_i-1].base+mmap_struct[mmap_t_i-1].len;
  801328:	8b 05 f2 ee bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfeef2]        # 400220 <mmap_t_i>
  80132e:	83 e8 01             	sub    eax,0x1
  801331:	48 63 d0             	movsxd rdx,eax
  801334:	48 89 d0             	mov    rax,rdx
  801337:	48 01 c0             	add    rax,rax
  80133a:	48 01 d0             	add    rax,rdx
  80133d:	48 c1 e0 03          	shl    rax,0x3
  801341:	48 05 40 00 40 00    	add    rax,0x400040
  801347:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80134a:	8b 05 d0 ee bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfeed0]        # 400220 <mmap_t_i>
  801350:	83 e8 01             	sub    eax,0x1
  801353:	48 63 d0             	movsxd rdx,eax
  801356:	48 89 d0             	mov    rax,rdx
  801359:	48 01 c0             	add    rax,rax
  80135c:	48 01 d0             	add    rax,rdx
  80135f:	48 c1 e0 03          	shl    rax,0x3
  801363:	48 05 48 00 40 00    	add    rax,0x400048
  801369:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80136c:	48 01 c8             	add    rax,rcx
  80136f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    //计算出所需内存页数量
    int pgc=mem_size/PAGE_SIZE;
  801373:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801377:	48 c1 e8 0c          	shr    rax,0xc
  80137b:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    //计算出位图所需的字节数
    int pg_bytes=pgc/32;
  80137e:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  801381:	8d 50 1f             	lea    edx,[rax+0x1f]
  801384:	85 c0                	test   eax,eax
  801386:	0f 48 c2             	cmovs  eax,edx
  801389:	c1 f8 05             	sar    eax,0x5
  80138c:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    page_map=(unsigned int*)PAGE_4K_ALIGN(0xc00000);
  80138f:	48 c7 05 86 ec bf ff 	mov    QWORD PTR [rip+0xffffffffffbfec86],0xc00000        # 400020 <page_map>
  801396:	00 00 c0 00 
    int* p=page_map;
  80139a:	48 8b 05 7f ec bf ff 	mov    rax,QWORD PTR [rip+0xffffffffffbfec7f]        # 400020 <page_map>
  8013a1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    addr_t curp=0;
  8013a5:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  8013ac:	00 
    for(int i=0;i<mmap_t_i;i++){
  8013ad:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8013b4:	e9 91 00 00 00       	jmp    80144a <init_memory+0x12a>
        int cont=0;
  8013b9:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
        if(mmap_struct[i].type!=MULTIBOOT_MEMORY_AVAILABLE)
  8013c0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8013c3:	48 63 d0             	movsxd rdx,eax
  8013c6:	48 89 d0             	mov    rax,rdx
  8013c9:	48 01 c0             	add    rax,rax
  8013cc:	48 01 d0             	add    rax,rdx
  8013cf:	48 c1 e0 03          	shl    rax,0x3
  8013d3:	48 05 50 00 40 00    	add    rax,0x400050
  8013d9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8013dc:	48 83 f8 01          	cmp    rax,0x1
  8013e0:	74 07                	je     8013e9 <init_memory+0xc9>
            cont=-1;
  8013e2:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [rbp-0x10],0xffffffff
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  8013e9:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8013f0:	eb 15                	jmp    801407 <init_memory+0xe7>
            *(p++)=cont;
  8013f2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8013f6:	48 8d 50 04          	lea    rdx,[rax+0x4]
  8013fa:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  8013fe:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  801401:	89 10                	mov    DWORD PTR [rax],edx
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  801403:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801407:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80140a:	48 63 c8             	movsxd rcx,eax
  80140d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801410:	48 63 d0             	movsxd rdx,eax
  801413:	48 89 d0             	mov    rax,rdx
  801416:	48 01 c0             	add    rax,rax
  801419:	48 01 d0             	add    rax,rdx
  80141c:	48 c1 e0 03          	shl    rax,0x3
  801420:	48 05 48 00 40 00    	add    rax,0x400048
  801426:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801429:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  801430:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  801437:	ff 00 00 
  80143a:	48 21 d0             	and    rax,rdx
  80143d:	48 c1 e8 11          	shr    rax,0x11
  801441:	48 39 c1             	cmp    rcx,rax
  801444:	72 ac                	jb     8013f2 <init_memory+0xd2>
    for(int i=0;i<mmap_t_i;i++){
  801446:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80144a:	8b 05 d0 ed bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfedd0]        # 400220 <mmap_t_i>
  801450:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  801453:	0f 8c 60 ff ff ff    	jl     8013b9 <init_memory+0x99>
        }
    }

    //低16M空间直接被内核占用
    for(int i=0;i<128;i++){
  801459:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  801460:	eb 1d                	jmp    80147f <init_memory+0x15f>
        page_map[i]=0xffffffff;
  801462:	48 8b 15 b7 eb bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfebb7]        # 400020 <page_map>
  801469:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80146c:	48 98                	cdqe   
  80146e:	48 c1 e0 02          	shl    rax,0x2
  801472:	48 01 d0             	add    rax,rdx
  801475:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<128;i++){
  80147b:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  80147f:	83 7d e8 7f          	cmp    DWORD PTR [rbp-0x18],0x7f
  801483:	7e dd                	jle    801462 <init_memory+0x142>
    }
}
  801485:	90                   	nop
  801486:	90                   	nop
  801487:	5d                   	pop    rbp
  801488:	c3                   	ret    

0000000000801489 <req_a_page>:
/*
page_map存储方式:
0x00000000
little end
*/
addr_t req_a_page(){
  801489:	f3 0f 1e fa          	endbr64 
  80148d:	55                   	push   rbp
  80148e:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  801491:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801498:	e9 b0 00 00 00       	jmp    80154d <req_a_page+0xc4>
        for(int j=0;j<32;j++){
  80149d:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8014a4:	e9 96 00 00 00       	jmp    80153f <req_a_page+0xb6>
            unsigned int bit=page_map[i]&(1<<j);
  8014a9:	48 8b 15 70 eb bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfeb70]        # 400020 <page_map>
  8014b0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8014b3:	48 98                	cdqe   
  8014b5:	48 c1 e0 02          	shl    rax,0x2
  8014b9:	48 01 d0             	add    rax,rdx
  8014bc:	8b 10                	mov    edx,DWORD PTR [rax]
  8014be:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8014c1:	be 01 00 00 00       	mov    esi,0x1
  8014c6:	89 c1                	mov    ecx,eax
  8014c8:	d3 e6                	shl    esi,cl
  8014ca:	89 f0                	mov    eax,esi
  8014cc:	21 d0                	and    eax,edx
  8014ce:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            if((i*32+j)*4096>=0x100000&&!bit)
  8014d1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8014d4:	c1 e0 05             	shl    eax,0x5
  8014d7:	89 c2                	mov    edx,eax
  8014d9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8014dc:	01 d0                	add    eax,edx
  8014de:	c1 e0 0c             	shl    eax,0xc
  8014e1:	3d ff ff 0f 00       	cmp    eax,0xfffff
  8014e6:	7e 53                	jle    80153b <req_a_page+0xb2>
  8014e8:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8014ec:	75 4d                	jne    80153b <req_a_page+0xb2>
            {
                page_map[i]=page_map[i]|(1<<j);
  8014ee:	48 8b 15 2b eb bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfeb2b]        # 400020 <page_map>
  8014f5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8014f8:	48 98                	cdqe   
  8014fa:	48 c1 e0 02          	shl    rax,0x2
  8014fe:	48 01 d0             	add    rax,rdx
  801501:	8b 10                	mov    edx,DWORD PTR [rax]
  801503:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801506:	be 01 00 00 00       	mov    esi,0x1
  80150b:	89 c1                	mov    ecx,eax
  80150d:	d3 e6                	shl    esi,cl
  80150f:	89 f0                	mov    eax,esi
  801511:	89 c6                	mov    esi,eax
  801513:	48 8b 0d 06 eb bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfeb06]        # 400020 <page_map>
  80151a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80151d:	48 98                	cdqe   
  80151f:	48 c1 e0 02          	shl    rax,0x2
  801523:	48 01 c8             	add    rax,rcx
  801526:	09 f2                	or     edx,esi
  801528:	89 10                	mov    DWORD PTR [rax],edx
                return i*32+j;//num of page
  80152a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80152d:	c1 e0 05             	shl    eax,0x5
  801530:	89 c2                	mov    edx,eax
  801532:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801535:	01 d0                	add    eax,edx
  801537:	48 98                	cdqe   
  801539:	eb 1c                	jmp    801557 <req_a_page+0xce>
        for(int j=0;j<32;j++){
  80153b:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80153f:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  801543:	0f 8e 60 ff ff ff    	jle    8014a9 <req_a_page+0x20>
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  801549:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80154d:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  801551:	0f 8e 46 ff ff ff    	jle    80149d <req_a_page+0x14>

            }
        }
    }
}
  801557:	5d                   	pop    rbp
  801558:	c3                   	ret    

0000000000801559 <free_page>:

int free_page(char *paddr){
  801559:	f3 0f 1e fa          	endbr64 
  80155d:	55                   	push   rbp
  80155e:	48 89 e5             	mov    rbp,rsp
  801561:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=(int)paddr/4096;
  801565:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801569:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80156f:	85 c0                	test   eax,eax
  801571:	0f 48 c2             	cmovs  eax,edx
  801574:	c1 f8 0c             	sar    eax,0xc
  801577:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  80157a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80157d:	8d 50 1f             	lea    edx,[rax+0x1f]
  801580:	85 c0                	test   eax,eax
  801582:	0f 48 c2             	cmovs  eax,edx
  801585:	c1 f8 05             	sar    eax,0x5
  801588:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  80158b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80158e:	99                   	cdq    
  80158f:	c1 ea 1b             	shr    edx,0x1b
  801592:	01 d0                	add    eax,edx
  801594:	83 e0 1f             	and    eax,0x1f
  801597:	29 d0                	sub    eax,edx
  801599:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    page_map[n]=page_map[n]&~(unsigned int)(1<<r);
  80159c:	48 8b 15 7d ea bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfea7d]        # 400020 <page_map>
  8015a3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8015a6:	48 98                	cdqe   
  8015a8:	48 c1 e0 02          	shl    rax,0x2
  8015ac:	48 01 d0             	add    rax,rdx
  8015af:	8b 10                	mov    edx,DWORD PTR [rax]
  8015b1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8015b4:	be 01 00 00 00       	mov    esi,0x1
  8015b9:	89 c1                	mov    ecx,eax
  8015bb:	d3 e6                	shl    esi,cl
  8015bd:	89 f0                	mov    eax,esi
  8015bf:	f7 d0                	not    eax
  8015c1:	89 c6                	mov    esi,eax
  8015c3:	48 8b 0d 56 ea bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfea56]        # 400020 <page_map>
  8015ca:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8015cd:	48 98                	cdqe   
  8015cf:	48 c1 e0 02          	shl    rax,0x2
  8015d3:	48 01 c8             	add    rax,rcx
  8015d6:	21 f2                	and    edx,esi
  8015d8:	89 10                	mov    DWORD PTR [rax],edx
}
  8015da:	90                   	nop
  8015db:	5d                   	pop    rbp
  8015dc:	c3                   	ret    

00000000008015dd <check_page>:
int check_page(int num){
  8015dd:	f3 0f 1e fa          	endbr64 
  8015e1:	55                   	push   rbp
  8015e2:	48 89 e5             	mov    rbp,rsp
  8015e5:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int n=num/32;
  8015e8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8015eb:	8d 50 1f             	lea    edx,[rax+0x1f]
  8015ee:	85 c0                	test   eax,eax
  8015f0:	0f 48 c2             	cmovs  eax,edx
  8015f3:	c1 f8 05             	sar    eax,0x5
  8015f6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int r=num%32;
  8015f9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8015fc:	99                   	cdq    
  8015fd:	c1 ea 1b             	shr    edx,0x1b
  801600:	01 d0                	add    eax,edx
  801602:	83 e0 1f             	and    eax,0x1f
  801605:	29 d0                	sub    eax,edx
  801607:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int bit=page_map[n]&(1<<r);
  80160a:	48 8b 15 0f ea bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfea0f]        # 400020 <page_map>
  801611:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801614:	48 98                	cdqe   
  801616:	48 c1 e0 02          	shl    rax,0x2
  80161a:	48 01 d0             	add    rax,rdx
  80161d:	8b 10                	mov    edx,DWORD PTR [rax]
  80161f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801622:	be 01 00 00 00       	mov    esi,0x1
  801627:	89 c1                	mov    ecx,eax
  801629:	d3 e6                	shl    esi,cl
  80162b:	89 f0                	mov    eax,esi
  80162d:	21 d0                	and    eax,edx
  80162f:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    return bit;
  801632:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  801635:	5d                   	pop    rbp
  801636:	c3                   	ret    

0000000000801637 <get_phyaddr>:
/*
 * 获得这个页对应的物理内存地址
 * */
int get_phyaddr(int num){
  801637:	f3 0f 1e fa          	endbr64 
  80163b:	55                   	push   rbp
  80163c:	48 89 e5             	mov    rbp,rsp
  80163f:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return num*0x1000;
  801642:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801645:	c1 e0 0c             	shl    eax,0xc
}
  801648:	5d                   	pop    rbp
  801649:	c3                   	ret    

000000000080164a <set_page_item>:

void set_page_item(page_item *item_addr,int phy_addr,int attr)
{
  80164a:	f3 0f 1e fa          	endbr64 
  80164e:	55                   	push   rbp
  80164f:	48 89 e5             	mov    rbp,rsp
  801652:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  801656:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  801659:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    *item_addr=0;
  80165c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801660:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *item_addr|=phy_addr&0xfffff000;
  801667:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80166b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80166e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801671:	89 c0                	mov    eax,eax
  801673:	25 00 f0 ff ff       	and    eax,0xfffff000
  801678:	48 09 c2             	or     rdx,rax
  80167b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80167f:	48 89 10             	mov    QWORD PTR [rax],rdx
    *item_addr|=attr;
  801682:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801686:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801689:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80168c:	48 98                	cdqe   
  80168e:	48 09 c2             	or     rdx,rax
  801691:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801695:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  801698:	90                   	nop
  801699:	5d                   	pop    rbp
  80169a:	c3                   	ret    

000000000080169b <set_1gb_pdpt>:
void set_1gb_pdpt(page_item* ppdpt,int pa,unsigned int extra_attr)
{
  80169b:	f3 0f 1e fa          	endbr64 
  80169f:	55                   	push   rbp
  8016a0:	48 89 e5             	mov    rbp,rsp
  8016a3:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8016a7:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  8016aa:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *ppdpt=0;
  8016ad:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016b1:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *ppdpt|=PAGE_PRESENT|PDPTE_1GB|extra_attr;
  8016b8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016bc:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8016bf:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8016c2:	0c 81                	or     al,0x81
  8016c4:	89 c0                	mov    eax,eax
  8016c6:	48 09 c2             	or     rdx,rax
  8016c9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016cd:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffffc0000000ul;
  8016d0:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8016d3:	25 00 00 00 c0       	and    eax,0xc0000000
  8016d8:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *ppdpt|=hipa;
  8016db:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016df:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8016e2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8016e5:	48 09 c2             	or     rdx,rax
  8016e8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016ec:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  8016ef:	90                   	nop
  8016f0:	5d                   	pop    rbp
  8016f1:	c3                   	ret    

00000000008016f2 <set_2mb_pde>:
void set_2mb_pde(page_item* pde,int pa)
{
  8016f2:	f3 0f 1e fa          	endbr64 
  8016f6:	55                   	push   rbp
  8016f7:	48 89 e5             	mov    rbp,rsp
  8016fa:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8016fe:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    *pde=0;
  801701:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801705:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *pde|=PAGE_PRESENT|PAGE_4MB_PAGE|PDE_4MB_PAT;
  80170c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801710:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801713:	48 0d 81 10 00 00    	or     rax,0x1081
  801719:	48 89 c2             	mov    rdx,rax
  80171c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801720:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffc00000;
  801723:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801726:	25 00 00 c0 ff       	and    eax,0xffc00000
  80172b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *pde|=hipa;
  80172e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801732:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801735:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801738:	48 09 c2             	or     rdx,rax
  80173b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80173f:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  801742:	90                   	nop
  801743:	5d                   	pop    rbp
  801744:	c3                   	ret    

0000000000801745 <req_page_at>:
        page_map[i]&=(u32)(1<<j);
    return ret;
} */
//在bitmap申请指定的页面,base默认0x1000对齐
addr_t req_page_at(addr_t base,int pgn)
{
  801745:	f3 0f 1e fa          	endbr64 
  801749:	55                   	push   rbp
  80174a:	48 89 e5             	mov    rbp,rsp
  80174d:	48 83 ec 20          	sub    rsp,0x20
  801751:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  801755:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    if(base==0)//不指定地址
  801758:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  80175d:	75 18                	jne    801777 <req_page_at+0x32>
    {
        return get_phyaddr(req_a_page());
  80175f:	b8 00 00 00 00       	mov    eax,0x0
  801764:	e8 20 fd ff ff       	call   801489 <req_a_page>
  801769:	89 c7                	mov    edi,eax
  80176b:	e8 c7 fe ff ff       	call   801637 <get_phyaddr>
  801770:	48 98                	cdqe   
  801772:	e9 a5 00 00 00       	jmp    80181c <req_page_at+0xd7>
    }
    if(!is_pgs_ava(base,pgn))return -1;//先检查
  801777:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80177b:	89 c2                	mov    edx,eax
  80177d:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801780:	89 c6                	mov    esi,eax
  801782:	89 d7                	mov    edi,edx
  801784:	e8 52 01 00 00       	call   8018db <is_pgs_ava>
  801789:	85 c0                	test   eax,eax
  80178b:	75 0c                	jne    801799 <req_page_at+0x54>
  80178d:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  801794:	e9 83 00 00 00       	jmp    80181c <req_page_at+0xd7>
    int pgni=base/4096;
  801799:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80179d:	48 c1 e8 0c          	shr    rax,0xc
  8017a1:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int pgi=pgni/32;
  8017a4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8017a7:	8d 50 1f             	lea    edx,[rax+0x1f]
  8017aa:	85 c0                	test   eax,eax
  8017ac:	0f 48 c2             	cmovs  eax,edx
  8017af:	c1 f8 05             	sar    eax,0x5
  8017b2:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    int pgj=pgni%32;
  8017b5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8017b8:	99                   	cdq    
  8017b9:	c1 ea 1b             	shr    edx,0x1b
  8017bc:	01 d0                	add    eax,edx
  8017be:	83 e0 1f             	and    eax,0x1f
  8017c1:	29 d0                	sub    eax,edx
  8017c3:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<pgn;i++)
  8017c6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8017cd:	eb 40                	jmp    80180f <req_page_at+0xca>
    {
        page_map[i]|=(1<<pgj);
  8017cf:	48 8b 15 4a e8 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe84a]        # 400020 <page_map>
  8017d6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8017d9:	48 98                	cdqe   
  8017db:	48 c1 e0 02          	shl    rax,0x2
  8017df:	48 01 d0             	add    rax,rdx
  8017e2:	8b 10                	mov    edx,DWORD PTR [rax]
  8017e4:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8017e7:	be 01 00 00 00       	mov    esi,0x1
  8017ec:	89 c1                	mov    ecx,eax
  8017ee:	d3 e6                	shl    esi,cl
  8017f0:	89 f0                	mov    eax,esi
  8017f2:	89 c6                	mov    esi,eax
  8017f4:	48 8b 0d 25 e8 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe825]        # 400020 <page_map>
  8017fb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8017fe:	48 98                	cdqe   
  801800:	48 c1 e0 02          	shl    rax,0x2
  801804:	48 01 c8             	add    rax,rcx
  801807:	09 f2                	or     edx,esi
  801809:	89 10                	mov    DWORD PTR [rax],edx
    for(int i=0;i<pgn;i++)
  80180b:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80180f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801812:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  801815:	7c b8                	jl     8017cf <req_page_at+0x8a>
    }
    return 0;
  801817:	b8 00 00 00 00       	mov    eax,0x0

}
  80181c:	c9                   	leave  
  80181d:	c3                   	ret    

000000000080181e <chk_vm>:
int chk_vm(int base, int pgn)
{
  80181e:	f3 0f 1e fa          	endbr64 
  801822:	55                   	push   rbp
  801823:	48 89 e5             	mov    rbp,rsp
  801826:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801829:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int *pdet=0;
  80182c:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  801833:	00 
    asm volatile("mov %%cr3,%0":"=r"(pdet));
  801834:	0f 20 d8             	mov    rax,cr3
  801837:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int *pt=pdet[base/PAGE_INDEX_SIZE]&0xfffff000;
  80183b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80183e:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  801844:	85 c0                	test   eax,eax
  801846:	0f 48 c2             	cmovs  eax,edx
  801849:	c1 f8 16             	sar    eax,0x16
  80184c:	48 98                	cdqe   
  80184e:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801855:	00 
  801856:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80185a:	48 01 d0             	add    rax,rdx
  80185d:	8b 00                	mov    eax,DWORD PTR [rax]
  80185f:	89 c0                	mov    eax,eax
  801861:	25 00 f0 ff ff       	and    eax,0xfffff000
  801866:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  80186a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80186d:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  801873:	85 c0                	test   eax,eax
  801875:	0f 48 c2             	cmovs  eax,edx
  801878:	c1 f8 16             	sar    eax,0x16
  80187b:	48 98                	cdqe   
  80187d:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801884:	00 
  801885:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801889:	48 01 d0             	add    rax,rdx
  80188c:	8b 00                	mov    eax,DWORD PTR [rax]
  80188e:	83 e0 01             	and    eax,0x1
  801891:	85 c0                	test   eax,eax
  801893:	74 38                	je     8018cd <chk_vm+0xaf>
    !(pt[base%PAGE_INDEX_SIZE/PAGE_SIZE]&PAGE_PRESENT))
  801895:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801898:	99                   	cdq    
  801899:	c1 ea 0a             	shr    edx,0xa
  80189c:	01 d0                	add    eax,edx
  80189e:	25 ff ff 3f 00       	and    eax,0x3fffff
  8018a3:	29 d0                	sub    eax,edx
  8018a5:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8018ab:	85 c0                	test   eax,eax
  8018ad:	0f 48 c2             	cmovs  eax,edx
  8018b0:	c1 f8 0c             	sar    eax,0xc
  8018b3:	48 98                	cdqe   
  8018b5:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8018bc:	00 
  8018bd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8018c1:	48 01 d0             	add    rax,rdx
  8018c4:	8b 00                	mov    eax,DWORD PTR [rax]
  8018c6:	83 e0 01             	and    eax,0x1
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  8018c9:	85 c0                	test   eax,eax
  8018cb:	75 07                	jne    8018d4 <chk_vm+0xb6>
    {
        return -1;
  8018cd:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8018d2:	eb 05                	jmp    8018d9 <chk_vm+0xbb>
    }
    return 0;
  8018d4:	b8 00 00 00 00       	mov    eax,0x0
}
  8018d9:	5d                   	pop    rbp
  8018da:	c3                   	ret    

00000000008018db <is_pgs_ava>:
//查看指定区域的页内存是否可用
int is_pgs_ava(int base,int pgn)
{
  8018db:	f3 0f 1e fa          	endbr64 
  8018df:	55                   	push   rbp
  8018e0:	48 89 e5             	mov    rbp,rsp
  8018e3:	48 83 ec 18          	sub    rsp,0x18
  8018e7:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8018ea:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int pgi=base/4096;
  8018ed:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8018f0:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8018f6:	85 c0                	test   eax,eax
  8018f8:	0f 48 c2             	cmovs  eax,edx
  8018fb:	c1 f8 0c             	sar    eax,0xc
  8018fe:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    for(int i=0;i<pgn;i++)
  801901:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801908:	eb 1e                	jmp    801928 <is_pgs_ava+0x4d>
    {
        if(check_page(pgi+i)!=0)return 0;
  80190a:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  80190d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801910:	01 d0                	add    eax,edx
  801912:	89 c7                	mov    edi,eax
  801914:	e8 c4 fc ff ff       	call   8015dd <check_page>
  801919:	85 c0                	test   eax,eax
  80191b:	74 07                	je     801924 <is_pgs_ava+0x49>
  80191d:	b8 00 00 00 00       	mov    eax,0x0
  801922:	eb 11                	jmp    801935 <is_pgs_ava+0x5a>
    for(int i=0;i<pgn;i++)
  801924:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801928:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80192b:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  80192e:	7c da                	jl     80190a <is_pgs_ava+0x2f>
    }
    return 1;
  801930:	b8 01 00 00 00       	mov    eax,0x1

}
  801935:	c9                   	leave  
  801936:	c3                   	ret    

0000000000801937 <setup_sys_vol>:
super_block sbs[MAX_SUPERBLOCKS];
fs_operations fs[MAX_FS];

buffer_head buffer_heads[NR_BUFFERHEADS];
int setup_sys_vol(void *disk_drv, void *fs_drv)
{
  801937:	f3 0f 1e fa          	endbr64 
  80193b:	55                   	push   rbp
  80193c:	48 89 e5             	mov    rbp,rsp
  80193f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  801943:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    vols[0].name[0]='C';
  801947:	c6 05 f2 e8 bf ff 43 	mov    BYTE PTR [rip+0xffffffffffbfe8f2],0x43        # 400240 <vols>
    vols[0].name[1]='\0';
  80194e:	c6 05 ec e8 bf ff 00 	mov    BYTE PTR [rip+0xffffffffffbfe8ec],0x0        # 400241 <vols+0x1>
    vols[0].disk_drv=disk_drv;
  801955:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801959:	48 89 05 e8 e8 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe8e8],rax        # 400248 <vols+0x8>
    vols[0].fs_drv=fs_drv;
  801960:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801964:	48 89 05 e5 e8 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe8e5],rax        # 400250 <vols+0x10>
    vols[0].stat=VOLUME_STAT_READY;
  80196b:	c7 05 eb e8 bf ff 01 	mov    DWORD PTR [rip+0xffffffffffbfe8eb],0x1        # 400260 <vols+0x20>
  801972:	00 00 00 
    return 0;
  801975:	b8 00 00 00 00       	mov    eax,0x0
}
  80197a:	5d                   	pop    rbp
  80197b:	c3                   	ret    

000000000080197c <sys_mkfifo>:
//返回管道描述符
int sys_mkfifo(int number)
{
  80197c:	f3 0f 1e fa          	endbr64 
  801980:	55                   	push   rbp
  801981:	48 89 e5             	mov    rbp,rsp
  801984:	48 83 ec 20          	sub    rsp,0x20
  801988:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    //查重
    for(int i=0;i<MAX_FIFOS;i++)
  80198b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801992:	eb 38                	jmp    8019cc <sys_mkfifo+0x50>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801994:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801997:	48 98                	cdqe   
  801999:	48 c1 e0 04          	shl    rax,0x4
  80199d:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  8019a3:	8b 00                	mov    eax,DWORD PTR [rax]
  8019a5:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8019a8:	75 1e                	jne    8019c8 <sys_mkfifo+0x4c>
  8019aa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019ad:	48 98                	cdqe   
  8019af:	48 c1 e0 04          	shl    rax,0x4
  8019b3:	48 05 68 1e 40 00    	add    rax,0x401e68
  8019b9:	8b 00                	mov    eax,DWORD PTR [rax]
  8019bb:	83 f8 01             	cmp    eax,0x1
  8019be:	75 08                	jne    8019c8 <sys_mkfifo+0x4c>
            return i;
  8019c0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019c3:	e9 a6 00 00 00       	jmp    801a6e <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  8019c8:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8019cc:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  8019d0:	7e c2                	jle    801994 <sys_mkfifo+0x18>
        }
    }
    for(int i=0;i<MAX_FIFOS;i++)
  8019d2:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8019d9:	e9 81 00 00 00       	jmp    801a5f <sys_mkfifo+0xe3>
    {
        if(fifos[i].flag==0) {
  8019de:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8019e1:	48 98                	cdqe   
  8019e3:	48 c1 e0 04          	shl    rax,0x4
  8019e7:	48 05 68 1e 40 00    	add    rax,0x401e68
  8019ed:	8b 00                	mov    eax,DWORD PTR [rax]
  8019ef:	85 c0                	test   eax,eax
  8019f1:	75 68                	jne    801a5b <sys_mkfifo+0xdf>
            fifos[i].flag=1;
  8019f3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8019f6:	48 98                	cdqe   
  8019f8:	48 c1 e0 04          	shl    rax,0x4
  8019fc:	48 05 68 1e 40 00    	add    rax,0x401e68
  801a02:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            fifos[i].id=number;
  801a08:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801a0b:	48 98                	cdqe   
  801a0d:	48 c1 e0 04          	shl    rax,0x4
  801a11:	48 8d 90 6c 1e 40 00 	lea    rdx,[rax+0x401e6c]
  801a18:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a1b:	89 02                	mov    DWORD PTR [rdx],eax
            fifos[i].size=CHUNK_SIZE;
  801a1d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801a20:	48 98                	cdqe   
  801a22:	48 c1 e0 04          	shl    rax,0x4
  801a26:	48 05 64 1e 40 00    	add    rax,0x401e64
  801a2c:	c7 00 00 10 00 00    	mov    DWORD PTR [rax],0x1000
            //分配内存
            fifos[i].pa= get_phyaddr(req_a_page());
  801a32:	b8 00 00 00 00       	mov    eax,0x0
  801a37:	e8 4d fa ff ff       	call   801489 <req_a_page>
  801a3c:	89 c7                	mov    edi,eax
  801a3e:	e8 f4 fb ff ff       	call   801637 <get_phyaddr>
  801a43:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801a46:	48 63 d2             	movsxd rdx,edx
  801a49:	48 c1 e2 04          	shl    rdx,0x4
  801a4d:	48 81 c2 60 1e 40 00 	add    rdx,0x401e60
  801a54:	89 02                	mov    DWORD PTR [rdx],eax
            return i;
  801a56:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801a59:	eb 13                	jmp    801a6e <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801a5b:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801a5f:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  801a63:	0f 8e 75 ff ff ff    	jle    8019de <sys_mkfifo+0x62>
        }
    }
    return -1;
  801a69:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801a6e:	c9                   	leave  
  801a6f:	c3                   	ret    

0000000000801a70 <sys_rmfifo>:

int sys_rmfifo(int number)
{
  801a70:	f3 0f 1e fa          	endbr64 
  801a74:	55                   	push   rbp
  801a75:	48 89 e5             	mov    rbp,rsp
  801a78:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_FIFOS;i++)
  801a7b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801a82:	eb 4a                	jmp    801ace <sys_rmfifo+0x5e>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801a84:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a87:	48 98                	cdqe   
  801a89:	48 c1 e0 04          	shl    rax,0x4
  801a8d:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801a93:	8b 00                	mov    eax,DWORD PTR [rax]
  801a95:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801a98:	75 30                	jne    801aca <sys_rmfifo+0x5a>
  801a9a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a9d:	48 98                	cdqe   
  801a9f:	48 c1 e0 04          	shl    rax,0x4
  801aa3:	48 05 68 1e 40 00    	add    rax,0x401e68
  801aa9:	8b 00                	mov    eax,DWORD PTR [rax]
  801aab:	83 f8 01             	cmp    eax,0x1
  801aae:	75 1a                	jne    801aca <sys_rmfifo+0x5a>
            fifos[i].flag=0;
  801ab0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ab3:	48 98                	cdqe   
  801ab5:	48 c1 e0 04          	shl    rax,0x4
  801ab9:	48 05 68 1e 40 00    	add    rax,0x401e68
  801abf:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            return i;
  801ac5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ac8:	eb 0f                	jmp    801ad9 <sys_rmfifo+0x69>
    for(int i=0;i<MAX_FIFOS;i++)
  801aca:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801ace:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801ad2:	7e b0                	jle    801a84 <sys_rmfifo+0x14>
        }
    }
    return -1;
  801ad4:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801ad9:	5d                   	pop    rbp
  801ada:	c3                   	ret    

0000000000801adb <free_vol>:
int free_vol(int voli)
{
  801adb:	f3 0f 1e fa          	endbr64 
  801adf:	55                   	push   rbp
  801ae0:	48 89 e5             	mov    rbp,rsp
  801ae3:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    vols[0].stat=VOLUME_STAT_EMPTY;
  801ae6:	c7 05 70 e7 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbfe770],0x0        # 400260 <vols+0x20>
  801aed:	00 00 00 
    return 0;
  801af0:	b8 00 00 00 00       	mov    eax,0x0
}
  801af5:	5d                   	pop    rbp
  801af6:	c3                   	ret    

0000000000801af7 <reg_vol>:

int reg_vol(int disk_drvi, int fs_drvi, char *name)
{
  801af7:	f3 0f 1e fa          	endbr64 
  801afb:	55                   	push   rbp
  801afc:	48 89 e5             	mov    rbp,rsp
  801aff:	48 83 ec 20          	sub    rsp,0x20
  801b03:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801b06:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  801b09:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
    for(int i=0;i<MAX_VOLUMES;i++)
  801b0d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801b14:	e9 d8 00 00 00       	jmp    801bf1 <reg_vol+0xfa>
    {
        if(vols[i].stat==VOLUME_STAT_EMPTY)
  801b19:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b1c:	48 63 d0             	movsxd rdx,eax
  801b1f:	48 89 d0             	mov    rax,rdx
  801b22:	48 c1 e0 02          	shl    rax,0x2
  801b26:	48 01 d0             	add    rax,rdx
  801b29:	48 c1 e0 03          	shl    rax,0x3
  801b2d:	48 05 60 02 40 00    	add    rax,0x400260
  801b33:	8b 00                	mov    eax,DWORD PTR [rax]
  801b35:	85 c0                	test   eax,eax
  801b37:	0f 85 b0 00 00 00    	jne    801bed <reg_vol+0xf6>
        {
            extern driver *drvs;
            vols[i].stat=VOLUME_STAT_READY;
  801b3d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b40:	48 63 d0             	movsxd rdx,eax
  801b43:	48 89 d0             	mov    rax,rdx
  801b46:	48 c1 e0 02          	shl    rax,0x2
  801b4a:	48 01 d0             	add    rax,rdx
  801b4d:	48 c1 e0 03          	shl    rax,0x3
  801b51:	48 05 60 02 40 00    	add    rax,0x400260
  801b57:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            vols[i].fs= &fs[fs_drvi];
  801b5d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801b60:	48 63 d0             	movsxd rdx,eax
  801b63:	48 89 d0             	mov    rax,rdx
  801b66:	48 01 c0             	add    rax,rax
  801b69:	48 01 d0             	add    rax,rdx
  801b6c:	48 c1 e0 03          	shl    rax,0x3
  801b70:	48 8d 88 80 23 40 00 	lea    rcx,[rax+0x402380]
  801b77:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b7a:	48 63 d0             	movsxd rdx,eax
  801b7d:	48 89 d0             	mov    rax,rdx
  801b80:	48 c1 e0 02          	shl    rax,0x2
  801b84:	48 01 d0             	add    rax,rdx
  801b87:	48 c1 e0 03          	shl    rax,0x3
  801b8b:	48 05 58 02 40 00    	add    rax,0x400258
  801b91:	48 89 08             	mov    QWORD PTR [rax],rcx
            vols[i].disk_drv= get_drv(disk_drvi);
  801b94:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801b97:	89 c7                	mov    edi,eax
  801b99:	e8 3d 13 00 00       	call   802edb <get_drv>
  801b9e:	48 89 c2             	mov    rdx,rax
  801ba1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ba4:	48 63 c8             	movsxd rcx,eax
  801ba7:	48 89 c8             	mov    rax,rcx
  801baa:	48 c1 e0 02          	shl    rax,0x2
  801bae:	48 01 c8             	add    rax,rcx
  801bb1:	48 c1 e0 03          	shl    rax,0x3
  801bb5:	48 05 48 02 40 00    	add    rax,0x400248
  801bbb:	48 89 10             	mov    QWORD PTR [rax],rdx
            strcpy(vols[i].name,name);
  801bbe:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801bc1:	48 63 d0             	movsxd rdx,eax
  801bc4:	48 89 d0             	mov    rax,rdx
  801bc7:	48 c1 e0 02          	shl    rax,0x2
  801bcb:	48 01 d0             	add    rax,rdx
  801bce:	48 c1 e0 03          	shl    rax,0x3
  801bd2:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801bd9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801bdd:	48 89 c6             	mov    rsi,rax
  801be0:	48 89 d7             	mov    rdi,rdx
  801be3:	e8 37 8d 00 00       	call   80a91f <strcpy>
            return i;
  801be8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801beb:	eb 13                	jmp    801c00 <reg_vol+0x109>
    for(int i=0;i<MAX_VOLUMES;i++)
  801bed:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801bf1:	83 7d fc 19          	cmp    DWORD PTR [rbp-0x4],0x19
  801bf5:	0f 8e 1e ff ff ff    	jle    801b19 <reg_vol+0x22>
        }
    }
    return -1;
  801bfb:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801c00:	c9                   	leave  
  801c01:	c3                   	ret    

0000000000801c02 <sys_tell>:
//    if(!f)return -1;
//    f->ptr=offset+origin;
//    return 0;
//}
int sys_tell(int fno)
{
  801c02:	f3 0f 1e fa          	endbr64 
  801c06:	55                   	push   rbp
  801c07:	48 89 e5             	mov    rbp,rsp
  801c0a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    struct file* f=current->openf[fno];
  801c0d:	48 8b 05 8c 28 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1288c]        # 4144a0 <current>
  801c14:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  801c17:	48 63 d2             	movsxd rdx,edx
  801c1a:	48 83 c2 18          	add    rdx,0x18
  801c1e:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  801c23:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return f->position;
  801c27:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801c2b:	48 8b 00             	mov    rax,QWORD PTR [rax]
}
  801c2e:	5d                   	pop    rbp
  801c2f:	c3                   	ret    

0000000000801c30 <get_vfs_entry>:
vfs_dir_entry *get_vfs_entry(int fno)
{
  801c30:	f3 0f 1e fa          	endbr64 
  801c34:	55                   	push   rbp
  801c35:	48 89 e5             	mov    rbp,rsp
  801c38:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801c3b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801c42:	eb 3f                	jmp    801c83 <get_vfs_entry+0x53>
    {
        if(opened[i].fno==fno)
  801c44:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801c47:	48 63 d0             	movsxd rdx,eax
  801c4a:	48 89 d0             	mov    rax,rdx
  801c4d:	48 01 c0             	add    rax,rax
  801c50:	48 01 d0             	add    rax,rdx
  801c53:	48 c1 e0 05          	shl    rax,0x5
  801c57:	48 05 60 06 40 00    	add    rax,0x400660
  801c5d:	8b 00                	mov    eax,DWORD PTR [rax]
  801c5f:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801c62:	75 1b                	jne    801c7f <get_vfs_entry+0x4f>
        {
            return &opened[i];
  801c64:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801c67:	48 63 d0             	movsxd rdx,eax
  801c6a:	48 89 d0             	mov    rax,rdx
  801c6d:	48 01 c0             	add    rax,rax
  801c70:	48 01 d0             	add    rax,rdx
  801c73:	48 c1 e0 05          	shl    rax,0x5
  801c77:	48 05 60 06 40 00    	add    rax,0x400660
  801c7d:	eb 0f                	jmp    801c8e <get_vfs_entry+0x5e>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801c7f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801c83:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  801c87:	7e bb                	jle    801c44 <get_vfs_entry+0x14>
        }
    }
    return NULL;
  801c89:	b8 00 00 00 00       	mov    eax,0x0
}
  801c8e:	5d                   	pop    rbp
  801c8f:	c3                   	ret    

0000000000801c90 <brelse>:

//释放缓冲区（只释放这一块）
int brelse(buffer_head* bh)
{
  801c90:	f3 0f 1e fa          	endbr64 
  801c94:	55                   	push   rbp
  801c95:	48 89 e5             	mov    rbp,rsp
  801c98:	48 83 ec 10          	sub    rsp,0x10
  801c9c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    wait_on_buf(bh);
  801ca0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801ca4:	48 89 c7             	mov    rdi,rax
  801ca7:	e8 a0 04 00 00       	call   80214c <wait_on_buf>
    if(bh->b_count==0)return -1;
  801cac:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801cb0:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801cb4:	84 c0                	test   al,al
  801cb6:	75 07                	jne    801cbf <brelse+0x2f>
  801cb8:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801cbd:	eb 32                	jmp    801cf1 <brelse+0x61>
    bh->b_count--;
  801cbf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801cc3:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801cc7:	8d 50 ff             	lea    edx,[rax-0x1]
  801cca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801cce:	88 50 14             	mov    BYTE PTR [rax+0x14],dl
    if(bh->b_count==0)
  801cd1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801cd5:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  801cd9:	84 c0                	test   al,al
  801cdb:	75 0f                	jne    801cec <brelse+0x5c>
        vmfree(bh->b_data);
  801cdd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801ce1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801ce4:	48 89 c7             	mov    rdi,rax
  801ce7:	e8 98 f4 ff ff       	call   801184 <vmfree>
    return 0;
  801cec:	b8 00 00 00 00       	mov    eax,0x0
}
  801cf1:	c9                   	leave  
  801cf2:	c3                   	ret    

0000000000801cf3 <bread>:
//从设备中读取指定设备的指定块并返回缓冲区
buffer_head* bread(int dev,int blk)
{
  801cf3:	f3 0f 1e fa          	endbr64 
  801cf7:	55                   	push   rbp
  801cf8:	48 89 e5             	mov    rbp,rsp
  801cfb:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  801d02:	89 bd 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],edi
  801d08:	89 b5 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],esi

    buffer_head *bh=get_buf(dev,blk);
  801d0e:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  801d14:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  801d1a:	89 d6                	mov    esi,edx
  801d1c:	89 c7                	mov    edi,eax
  801d1e:	e8 78 02 00 00       	call   801f9b <get_buf>
  801d23:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!bh)return -1;//申请失败
  801d27:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  801d2c:	75 09                	jne    801d37 <bread+0x44>
  801d2e:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  801d35:	eb 75                	jmp    801dac <bread+0xb9>
    if(!bh->b_uptodate)
  801d37:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801d3b:	0f b6 40 12          	movzx  eax,BYTE PTR [rax+0x12]
  801d3f:	84 c0                	test   al,al
  801d41:	75 65                	jne    801da8 <bread+0xb5>
    {
        driver_args arg;
        arg.dev=dev;
  801d43:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  801d49:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
        arg.cmd=DRVF_READ;
  801d4c:	c7 45 d8 02 00 00 00 	mov    DWORD PTR [rbp-0x28],0x2
        arg.dist_addr=bh->b_data;
  801d53:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801d57:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801d5a:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.len=BLOCK_SIZE;
  801d60:	c7 85 48 ff ff ff 00 	mov    DWORD PTR [rbp-0xb8],0x200
  801d67:	02 00 00 
        arg.lba=bh->b_blocknr;
  801d6a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801d6e:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  801d72:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
        arg.sec_c=BLOCK_SIZE/512;//之后会改
  801d78:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  801d7f:	00 00 00 
        //lock_buffer(bh);//锁定缓冲块直到读取完成
        int reqi=make_request(&arg);
  801d82:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  801d89:	48 89 c7             	mov    rdi,rax
  801d8c:	e8 71 11 00 00       	call   802f02 <make_request>
  801d91:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        wait_on_req(reqi);
  801d94:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801d97:	89 c7                	mov    edi,eax
  801d99:	e8 77 14 00 00       	call   803215 <wait_on_req>
        clear_req(reqi);
  801d9e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801da1:	89 c7                	mov    edi,eax
  801da3:	e8 9d 14 00 00       	call   803245 <clear_req>
    }
    return bh;
  801da8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  801dac:	c9                   	leave  
  801dad:	c3                   	ret    

0000000000801dae <vfs_read_file>:


int vfs_read_file(vfs_dir_entry *f,char *buf,int len)
{
  801dae:	f3 0f 1e fa          	endbr64 
  801db2:	55                   	push   rbp
  801db3:	48 89 e5             	mov    rbp,rsp
  801db6:	48 83 ec 40          	sub    rsp,0x40
  801dba:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  801dbe:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  801dc2:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  801dc5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801dc9:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  801dcc:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  801dcf:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801dd3:	48 89 c7             	mov    rdi,rax
  801dd6:	e8 80 01 00 00       	call   801f5b <get_according_bnr>
  801ddb:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=bread(dev,block);
  801dde:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801de1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801de4:	89 d6                	mov    esi,edx
  801de6:	89 c7                	mov    edi,eax
  801de8:	e8 06 ff ff ff       	call   801cf3 <bread>
  801ded:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  801df1:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  801df4:	ba 00 02 00 00       	mov    edx,0x200
  801df9:	39 d0                	cmp    eax,edx
  801dfb:	0f 4f c2             	cmovg  eax,edx
  801dfe:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(buf,bh->b_data,size);
  801e01:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  801e04:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801e08:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  801e0b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  801e0f:	48 89 ce             	mov    rsi,rcx
  801e12:	48 89 c7             	mov    rdi,rax
  801e15:	e8 07 8a 00 00       	call   80a821 <memcpy>
        len-=BLOCK_SIZE;
  801e1a:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  801e21:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801e25:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  801e28:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801e2b:	01 c2                	add    edx,eax
  801e2d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801e31:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        brelse(bh);
  801e34:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801e38:	48 89 c7             	mov    rdi,rax
  801e3b:	e8 50 fe ff ff       	call   801c90 <brelse>
    }while(len>0);
  801e40:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  801e44:	7f 89                	jg     801dcf <vfs_read_file+0x21>
    return 0;
  801e46:	b8 00 00 00 00       	mov    eax,0x0
}
  801e4b:	c9                   	leave  
  801e4c:	c3                   	ret    

0000000000801e4d <vfs_write_file>:
int vfs_write_file(vfs_dir_entry *f,char *buf,int len)
{
  801e4d:	f3 0f 1e fa          	endbr64 
  801e51:	55                   	push   rbp
  801e52:	48 89 e5             	mov    rbp,rsp
  801e55:	48 83 ec 40          	sub    rsp,0x40
  801e59:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  801e5d:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  801e61:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  801e64:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801e68:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  801e6b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  801e6e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801e72:	48 89 c7             	mov    rdi,rax
  801e75:	e8 e1 00 00 00       	call   801f5b <get_according_bnr>
  801e7a:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=get_buf(dev,block);
  801e7d:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801e80:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801e83:	89 d6                	mov    esi,edx
  801e85:	89 c7                	mov    edi,eax
  801e87:	e8 0f 01 00 00       	call   801f9b <get_buf>
  801e8c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  801e90:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  801e93:	ba 00 02 00 00       	mov    edx,0x200
  801e98:	39 d0                	cmp    eax,edx
  801e9a:	0f 4f c2             	cmovg  eax,edx
  801e9d:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(bh->b_data,buf,size);
  801ea0:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  801ea3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801ea7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801eaa:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  801eae:	48 89 ce             	mov    rsi,rcx
  801eb1:	48 89 c7             	mov    rdi,rax
  801eb4:	e8 68 89 00 00       	call   80a821 <memcpy>
        len-=BLOCK_SIZE;
  801eb9:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  801ec0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801ec4:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  801ec7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801eca:	01 c2                	add    edx,eax
  801ecc:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801ed0:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        bh->b_dirt=1;//修改置位
  801ed3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801ed7:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  801edb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801edf:	48 89 c7             	mov    rdi,rax
  801ee2:	e8 a9 fd ff ff       	call   801c90 <brelse>
    }while(len>0);
  801ee7:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  801eeb:	7f 81                	jg     801e6e <vfs_write_file+0x21>
    return 0;
  801eed:	b8 00 00 00 00       	mov    eax,0x0
}
  801ef2:	c9                   	leave  
  801ef3:	c3                   	ret    

0000000000801ef4 <vfs_seek_file>:

int vfs_seek_file(vfs_dir_entry *f,int offset,int origin)
{
  801ef4:	f3 0f 1e fa          	endbr64 
  801ef8:	55                   	push   rbp
  801ef9:	48 89 e5             	mov    rbp,rsp
  801efc:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  801f00:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  801f03:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    switch (origin)
  801f06:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  801f0a:	74 35                	je     801f41 <vfs_seek_file+0x4d>
  801f0c:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  801f10:	7f 3f                	jg     801f51 <vfs_seek_file+0x5d>
  801f12:	83 7d f0 00          	cmp    DWORD PTR [rbp-0x10],0x0
  801f16:	74 08                	je     801f20 <vfs_seek_file+0x2c>
  801f18:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  801f1c:	74 0e                	je     801f2c <vfs_seek_file+0x38>
        break;
    case SEEK_END:
        f->ptr=f->size;
        break;
    default:
        break;
  801f1e:	eb 31                	jmp    801f51 <vfs_seek_file+0x5d>
        f->ptr=offset;
  801f20:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f24:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  801f27:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  801f2a:	eb 26                	jmp    801f52 <vfs_seek_file+0x5e>
        f->ptr+=offset;
  801f2c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f30:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  801f33:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801f36:	01 c2                	add    edx,eax
  801f38:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f3c:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  801f3f:	eb 11                	jmp    801f52 <vfs_seek_file+0x5e>
        f->ptr=f->size;
  801f41:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f45:	8b 50 18             	mov    edx,DWORD PTR [rax+0x18]
  801f48:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f4c:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  801f4f:	eb 01                	jmp    801f52 <vfs_seek_file+0x5e>
        break;
  801f51:	90                   	nop
    }
    return f->ptr;
  801f52:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f56:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  801f59:	5d                   	pop    rbp
  801f5a:	c3                   	ret    

0000000000801f5b <get_according_bnr>:
//返回文件ptr在块设备中的块号
int get_according_bnr(vfs_dir_entry *f)
{
  801f5b:	f3 0f 1e fa          	endbr64 
  801f5f:	55                   	push   rbp
  801f60:	48 89 e5             	mov    rbp,rsp
  801f63:	48 83 ec 10          	sub    rsp,0x10
  801f67:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return vols[f->voln].fs->get_according_bnr(f);
  801f6b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f6f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  801f72:	48 63 d0             	movsxd rdx,eax
  801f75:	48 89 d0             	mov    rax,rdx
  801f78:	48 c1 e0 02          	shl    rax,0x2
  801f7c:	48 01 d0             	add    rax,rdx
  801f7f:	48 c1 e0 03          	shl    rax,0x3
  801f83:	48 05 58 02 40 00    	add    rax,0x400258
  801f89:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801f8c:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  801f90:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f94:	48 89 c7             	mov    rdi,rax
  801f97:	ff d2                	call   rdx

}
  801f99:	c9                   	leave  
  801f9a:	c3                   	ret    

0000000000801f9b <get_buf>:
//获取或者新建一个和dev上block相对应的缓冲区。
buffer_head* get_buf(int dev,int block)
{
  801f9b:	f3 0f 1e fa          	endbr64 
  801f9f:	55                   	push   rbp
  801fa0:	48 89 e5             	mov    rbp,rsp
  801fa3:	48 83 ec 20          	sub    rsp,0x20
  801fa7:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801faa:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<NR_BUFFERHEADS;i++)
  801fad:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801fb4:	e9 b9 00 00 00       	jmp    802072 <get_buf+0xd7>
    {
        if(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block)
  801fb9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801fbc:	48 98                	cdqe   
  801fbe:	48 c1 e0 06          	shl    rax,0x6
  801fc2:	48 05 90 26 40 00    	add    rax,0x402690
  801fc8:	0f b7 00             	movzx  eax,WORD PTR [rax]
  801fcb:	0f b7 c0             	movzx  eax,ax
  801fce:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801fd1:	0f 85 97 00 00 00    	jne    80206e <get_buf+0xd3>
  801fd7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801fda:	48 98                	cdqe   
  801fdc:	48 c1 e0 06          	shl    rax,0x6
  801fe0:	48 05 88 26 40 00    	add    rax,0x402688
  801fe6:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801fe9:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801fec:	48 98                	cdqe   
  801fee:	48 39 c2             	cmp    rdx,rax
  801ff1:	75 7b                	jne    80206e <get_buf+0xd3>
        {
            repeat:
  801ff3:	90                   	nop
            wait_on_buf(&buffer_heads[i]);//等待解锁
  801ff4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ff7:	48 98                	cdqe   
  801ff9:	48 c1 e0 06          	shl    rax,0x6
  801ffd:	48 05 80 26 40 00    	add    rax,0x402680
  802003:	48 89 c7             	mov    rdi,rax
  802006:	e8 41 01 00 00       	call   80214c <wait_on_buf>
            if(buffer_heads[i].b_count>0)//别的进程正在用
  80200b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80200e:	48 98                	cdqe   
  802010:	48 c1 e0 06          	shl    rax,0x6
  802014:	48 05 94 26 40 00    	add    rax,0x402694
  80201a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80201d:	84 c0                	test   al,al
  80201f:	74 02                	je     802023 <get_buf+0x88>
                goto repeat;
  802021:	eb d1                	jmp    801ff4 <get_buf+0x59>
            if(!(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block))//别的进程修改了
  802023:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802026:	48 98                	cdqe   
  802028:	48 c1 e0 06          	shl    rax,0x6
  80202c:	48 05 90 26 40 00    	add    rax,0x402690
  802032:	0f b7 00             	movzx  eax,WORD PTR [rax]
  802035:	0f b7 c0             	movzx  eax,ax
  802038:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80203b:	75 30                	jne    80206d <get_buf+0xd2>
  80203d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802040:	48 98                	cdqe   
  802042:	48 c1 e0 06          	shl    rax,0x6
  802046:	48 05 88 26 40 00    	add    rax,0x402688
  80204c:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80204f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802052:	48 98                	cdqe   
  802054:	48 39 c2             	cmp    rdx,rax
  802057:	75 14                	jne    80206d <get_buf+0xd2>
                continue;
            return &buffer_heads[i];
  802059:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80205c:	48 98                	cdqe   
  80205e:	48 c1 e0 06          	shl    rax,0x6
  802062:	48 05 80 26 40 00    	add    rax,0x402680
  802068:	e9 dd 00 00 00       	jmp    80214a <get_buf+0x1af>
                continue;
  80206d:	90                   	nop
    for(int i=0;i<NR_BUFFERHEADS;i++)
  80206e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802072:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  802076:	0f 8e 3d ff ff ff    	jle    801fb9 <get_buf+0x1e>
        }
    }
    //空头中找
    for(int i=0;i<NR_BUFFERHEADS;i++)
  80207c:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  802083:	e9 b8 00 00 00       	jmp    802140 <get_buf+0x1a5>
    {
        if(buffer_heads[i].b_count==0)
  802088:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80208b:	48 98                	cdqe   
  80208d:	48 c1 e0 06          	shl    rax,0x6
  802091:	48 05 94 26 40 00    	add    rax,0x402694
  802097:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80209a:	84 c0                	test   al,al
  80209c:	0f 85 9a 00 00 00    	jne    80213c <get_buf+0x1a1>
        {
            if(buffer_heads[i].b_dirt)
  8020a2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8020a5:	48 98                	cdqe   
  8020a7:	48 c1 e0 06          	shl    rax,0x6
  8020ab:	48 05 93 26 40 00    	add    rax,0x402693
  8020b1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8020b4:	84 c0                	test   al,al
  8020b6:	74 2e                	je     8020e6 <get_buf+0x14b>
            {
                sync_buf(&buffer_heads[i]);
  8020b8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8020bb:	48 98                	cdqe   
  8020bd:	48 c1 e0 06          	shl    rax,0x6
  8020c1:	48 05 80 26 40 00    	add    rax,0x402680
  8020c7:	48 89 c7             	mov    rdi,rax
  8020ca:	e8 1b 01 00 00       	call   8021ea <sync_buf>
                wait_on_buf(&buffer_heads[i]);
  8020cf:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8020d2:	48 98                	cdqe   
  8020d4:	48 c1 e0 06          	shl    rax,0x6
  8020d8:	48 05 80 26 40 00    	add    rax,0x402680
  8020de:	48 89 c7             	mov    rdi,rax
  8020e1:	e8 66 00 00 00       	call   80214c <wait_on_buf>
            }
            buffer_heads[i].b_count++;
  8020e6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8020e9:	48 98                	cdqe   
  8020eb:	48 c1 e0 06          	shl    rax,0x6
  8020ef:	48 05 94 26 40 00    	add    rax,0x402694
  8020f5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8020f8:	8d 50 01             	lea    edx,[rax+0x1]
  8020fb:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8020fe:	48 98                	cdqe   
  802100:	48 c1 e0 06          	shl    rax,0x6
  802104:	48 05 94 26 40 00    	add    rax,0x402694
  80210a:	88 10                	mov    BYTE PTR [rax],dl
            //给buffer分配一个实际的缓冲区
            buffer_heads[i].b_data=vmalloc();
  80210c:	b8 00 00 00 00       	mov    eax,0x0
  802111:	e8 df ef ff ff       	call   8010f5 <vmalloc>
  802116:	48 89 c2             	mov    rdx,rax
  802119:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80211c:	48 98                	cdqe   
  80211e:	48 c1 e0 06          	shl    rax,0x6
  802122:	48 05 80 26 40 00    	add    rax,0x402680
  802128:	48 89 10             	mov    QWORD PTR [rax],rdx
            return &buffer_heads[i];
  80212b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80212e:	48 98                	cdqe   
  802130:	48 c1 e0 06          	shl    rax,0x6
  802134:	48 05 80 26 40 00    	add    rax,0x402680
  80213a:	eb 0e                	jmp    80214a <get_buf+0x1af>
    for(int i=0;i<NR_BUFFERHEADS;i++)
  80213c:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  802140:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  802144:	0f 8e 3e ff ff ff    	jle    802088 <get_buf+0xed>
        }
    }
}
  80214a:	c9                   	leave  
  80214b:	c3                   	ret    

000000000080214c <wait_on_buf>:

void wait_on_buf(buffer_head* bh)
{
  80214c:	f3 0f 1e fa          	endbr64 
  802150:	55                   	push   rbp
  802151:	48 89 e5             	mov    rbp,rsp
  802154:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    //等待缓冲区解锁
    while (bh->b_lock);
  802158:	90                   	nop
  802159:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80215d:	0f b6 40 15          	movzx  eax,BYTE PTR [rax+0x15]
  802161:	84 c0                	test   al,al
  802163:	75 f4                	jne    802159 <wait_on_buf+0xd>
    
}
  802165:	90                   	nop
  802166:	90                   	nop
  802167:	5d                   	pop    rbp
  802168:	c3                   	ret    

0000000000802169 <scan_dev>:

//扫描块设备，读取分区，识别文件系统
int scan_dev(int dev)
{
  802169:	f3 0f 1e fa          	endbr64 
  80216d:	55                   	push   rbp
  80216e:	48 89 e5             	mov    rbp,rsp
  802171:	48 83 ec 30          	sub    rsp,0x30
  802175:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
//    device *blkdev=get_dev(dev);
//    buffer_head* bh=bread(dev,0);
//    if(!bh)return -1;
    char* buf=vmalloc();
  802178:	b8 00 00 00 00       	mov    eax,0x0
  80217d:	e8 73 ef ff ff       	call   8010f5 <vmalloc>
  802182:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    int r=request(DISK_MAJOR_MAJOR,DISK_CMD_READ,0,1,buf);
  802186:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80218a:	49 89 c0             	mov    r8,rax
  80218d:	b9 01 00 00 00       	mov    ecx,0x1
  802192:	ba 00 00 00 00       	mov    edx,0x0
  802197:	be 20 00 00 00       	mov    esi,0x20
  80219c:	bf 00 00 00 00       	mov    edi,0x0
  8021a1:	e8 fb 4b 00 00       	call   806da1 <request>
  8021a6:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    chk_result(r);
  8021a9:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8021ac:	89 c7                	mov    edi,eax
  8021ae:	e8 a2 52 00 00       	call   807455 <chk_result>

    dpt_t* dpte=buf+0x1be;
  8021b3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8021b7:	48 05 be 01 00 00    	add    rax,0x1be
  8021bd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(int i=0;i<4;i++)
  8021c1:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8021c8:	eb 13                	jmp    8021dd <scan_dev+0x74>
    {
//        blkdev->par[i].type=dpte->type;
        int stlba=dpte->start_lba;
  8021ca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021ce:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8021d1:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
//        {
//            printf("err:unrecognised partition fs.\n");
//        }

//        blkdev->par[i].end_sec=dpte->end_lba;
        dpte++;
  8021d4:	48 83 45 f8 10       	add    QWORD PTR [rbp-0x8],0x10
    for(int i=0;i<4;i++)
  8021d9:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8021dd:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8021e1:	7e e7                	jle    8021ca <scan_dev+0x61>
    }
//    brelse(bh);
    return 0;
  8021e3:	b8 00 00 00 00       	mov    eax,0x0
}
  8021e8:	c9                   	leave  
  8021e9:	c3                   	ret    

00000000008021ea <sync_buf>:

int sync_buf(buffer_head* bh)
{
  8021ea:	f3 0f 1e fa          	endbr64 
  8021ee:	55                   	push   rbp
  8021ef:	48 89 e5             	mov    rbp,rsp
  8021f2:	48 83 ec 20          	sub    rsp,0x20
  8021f6:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int dev=bh->b_dev;
  8021fa:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8021fe:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
  802202:	0f b7 c0             	movzx  eax,ax
  802205:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int block=bh->b_blocknr;
  802208:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80220c:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  802210:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //这里需要调用块设备写函数write_block
    return write_block(dev,block,bh->b_data,BLOCK_SIZE);
  802213:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802217:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80221a:	8b 75 f8             	mov    esi,DWORD PTR [rbp-0x8]
  80221d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802220:	b9 00 02 00 00       	mov    ecx,0x200
  802225:	89 c7                	mov    edi,eax
  802227:	e8 02 00 00 00       	call   80222e <write_block>

}
  80222c:	c9                   	leave  
  80222d:	c3                   	ret    

000000000080222e <write_block>:
//操作块设备函数
int write_block(int dev,int block,char *buf,int len)
{
  80222e:	f3 0f 1e fa          	endbr64 
  802232:	55                   	push   rbp
  802233:	48 89 e5             	mov    rbp,rsp
  802236:	48 83 ec 30          	sub    rsp,0x30
  80223a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80223d:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  802240:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  802244:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=get_buf(dev,block);
  802247:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80224a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80224d:	89 d6                	mov    esi,edx
  80224f:	89 c7                	mov    edi,eax
  802251:	e8 45 fd ff ff       	call   801f9b <get_buf>
  802256:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  80225a:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80225d:	ba 00 02 00 00       	mov    edx,0x200
  802262:	39 d0                	cmp    eax,edx
  802264:	0f 4f c2             	cmovg  eax,edx
  802267:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(bh->b_data,buf,size);
  80226a:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80226d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802271:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802274:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  802278:	48 89 ce             	mov    rsi,rcx
  80227b:	48 89 c7             	mov    rdi,rax
  80227e:	e8 9e 85 00 00       	call   80a821 <memcpy>
        len-=BLOCK_SIZE;
  802283:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        bh->b_dirt=1;//修改置位
  80228a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80228e:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  802292:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802296:	48 89 c7             	mov    rdi,rax
  802299:	e8 f2 f9 ff ff       	call   801c90 <brelse>
    }while(len>0);
  80229e:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  8022a2:	7f a3                	jg     802247 <write_block+0x19>
    return 0;
  8022a4:	b8 00 00 00 00       	mov    eax,0x0
}
  8022a9:	c9                   	leave  
  8022aa:	c3                   	ret    

00000000008022ab <read_block>:
int read_block(int dev,int block,char* buf,int len)
{
  8022ab:	f3 0f 1e fa          	endbr64 
  8022af:	55                   	push   rbp
  8022b0:	48 89 e5             	mov    rbp,rsp
  8022b3:	48 83 ec 30          	sub    rsp,0x30
  8022b7:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8022ba:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8022bd:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  8022c1:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=bread(dev,block);
  8022c4:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8022c7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8022ca:	89 d6                	mov    esi,edx
  8022cc:	89 c7                	mov    edi,eax
  8022ce:	e8 20 fa ff ff       	call   801cf3 <bread>
  8022d3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  8022d7:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8022da:	ba 00 02 00 00       	mov    edx,0x200
  8022df:	39 d0                	cmp    eax,edx
  8022e1:	0f 4f c2             	cmovg  eax,edx
  8022e4:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(buf,bh->b_data,size);
  8022e7:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8022ea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8022ee:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8022f1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8022f5:	48 89 ce             	mov    rsi,rcx
  8022f8:	48 89 c7             	mov    rdi,rax
  8022fb:	e8 21 85 00 00       	call   80a821 <memcpy>
        len-=BLOCK_SIZE;
  802300:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        brelse(bh);
  802307:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80230b:	48 89 c7             	mov    rdi,rax
  80230e:	e8 7d f9 ff ff       	call   801c90 <brelse>
    }while(len>0);
  802313:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  802317:	7f ab                	jg     8022c4 <read_block+0x19>
    return 0;
  802319:	b8 00 00 00 00       	mov    eax,0x0
}
  80231e:	c9                   	leave  
  80231f:	c3                   	ret    

0000000000802320 <init_vfs>:

int init_vfs()
{
  802320:	f3 0f 1e fa          	endbr64 
  802324:	55                   	push   rbp
  802325:	48 89 e5             	mov    rbp,rsp
  802328:	48 83 ec 10          	sub    rsp,0x10
    //扫描块设备
    extern device *dev_tree[];
    extern device devs[];
    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
  80232c:	48 8b 05 4d 61 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0614d]        # 408480 <dev_tree>
  802333:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(;p;p=p->next)
  802337:	eb 40                	jmp    802379 <init_vfs+0x59>
    {
        if(scan_dev(p-devs)!=0)return -1;
  802339:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80233d:	48 2d 80 2e 40 00    	sub    rax,0x402e80
  802343:	48 c1 f8 02          	sar    rax,0x2
  802347:	48 89 c2             	mov    rdx,rax
  80234a:	48 b8 19 9c 8f c1 f9 	movabs rax,0x8f9c18f9c18f9c19
  802351:	18 9c 8f 
  802354:	48 0f af c2          	imul   rax,rdx
  802358:	89 c7                	mov    edi,eax
  80235a:	e8 0a fe ff ff       	call   802169 <scan_dev>
  80235f:	85 c0                	test   eax,eax
  802361:	74 07                	je     80236a <init_vfs+0x4a>
  802363:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802368:	eb 1b                	jmp    802385 <init_vfs+0x65>
    for(;p;p=p->next)
  80236a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80236e:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802375:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  802379:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80237e:	75 b9                	jne    802339 <init_vfs+0x19>
    }

    return 0;
  802380:	b8 00 00 00 00       	mov    eax,0x0
}
  802385:	c9                   	leave  
  802386:	c3                   	ret    

0000000000802387 <init_drvdev_man>:
    [OPERATIONS_KEYBOARD]=NULL,
    [OPERATIONS_MOUSE]=NULL
};
static int rhead=0,rtail=0;
int init_drvdev_man()
{
  802387:	f3 0f 1e fa          	endbr64 
  80238b:	55                   	push   rbp
  80238c:	48 89 e5             	mov    rbp,rsp
}
  80238f:	90                   	nop
  802390:	5d                   	pop    rbp
  802391:	c3                   	ret    

0000000000802392 <load_driver>:
int load_driver(char *path)
{
  802392:	f3 0f 1e fa          	endbr64 
  802396:	55                   	push   rbp
  802397:	48 89 e5             	mov    rbp,rsp
  80239a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    
}
  80239e:	90                   	nop
  80239f:	5d                   	pop    rbp
  8023a0:	c3                   	ret    

00000000008023a1 <reg_device>:

int reg_device(device* dev)
{
  8023a1:	f3 0f 1e fa          	endbr64 
  8023a5:	55                   	push   rbp
  8023a6:	48 89 e5             	mov    rbp,rsp
  8023a9:	53                   	push   rbx
  8023aa:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //TODO:查重

    //放入数组
    int i=0;
  8023ae:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<MAX_DEVICES;i++)
  8023b5:	e9 42 01 00 00       	jmp    8024fc <reg_device+0x15b>
    {
        if(devs[i].flag==DEV_FLAG_EMPTY)
  8023ba:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8023bd:	48 63 d0             	movsxd rdx,eax
  8023c0:	48 89 d0             	mov    rax,rdx
  8023c3:	48 c1 e0 02          	shl    rax,0x2
  8023c7:	48 01 d0             	add    rax,rdx
  8023ca:	48 c1 e0 02          	shl    rax,0x2
  8023ce:	48 01 d0             	add    rax,rdx
  8023d1:	48 c1 e0 03          	shl    rax,0x3
  8023d5:	48 05 90 2e 40 00    	add    rax,0x402e90
  8023db:	8b 00                	mov    eax,DWORD PTR [rax]
  8023dd:	85 c0                	test   eax,eax
  8023df:	0f 85 13 01 00 00    	jne    8024f8 <reg_device+0x157>
        {
            devs[i]=*dev;
  8023e5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8023e8:	48 63 d0             	movsxd rdx,eax
  8023eb:	48 89 d0             	mov    rax,rdx
  8023ee:	48 c1 e0 02          	shl    rax,0x2
  8023f2:	48 01 d0             	add    rax,rdx
  8023f5:	48 c1 e0 02          	shl    rax,0x2
  8023f9:	48 01 d0             	add    rax,rdx
  8023fc:	48 c1 e0 03          	shl    rax,0x3
  802400:	48 8d 90 80 2e 40 00 	lea    rdx,[rax+0x402e80]
  802407:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80240b:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80240e:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802412:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802415:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802419:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  80241d:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802421:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802425:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802429:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  80242d:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802431:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802435:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802439:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  80243d:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802441:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802445:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802449:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  80244d:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802451:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802455:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802459:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  80245d:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802461:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802465:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802469:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  80246d:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802471:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802475:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802479:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  80247d:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802481:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802485:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802489:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802490:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802497:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  80249e:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  8024a5:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  8024ac:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  8024b3:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  8024ba:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  8024c1:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
  8024c8:	48 89 82 a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rax
            devs[i].flag=DEV_FLAG_USED;
  8024cf:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8024d2:	48 63 d0             	movsxd rdx,eax
  8024d5:	48 89 d0             	mov    rax,rdx
  8024d8:	48 c1 e0 02          	shl    rax,0x2
  8024dc:	48 01 d0             	add    rax,rdx
  8024df:	48 c1 e0 02          	shl    rax,0x2
  8024e3:	48 01 d0             	add    rax,rdx
  8024e6:	48 c1 e0 03          	shl    rax,0x3
  8024ea:	48 05 90 2e 40 00    	add    rax,0x402e90
  8024f0:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            break;
  8024f6:	eb 0e                	jmp    802506 <reg_device+0x165>
    for(;i<MAX_DEVICES;i++)
  8024f8:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8024fc:	83 7d f4 3f          	cmp    DWORD PTR [rbp-0xc],0x3f
  802500:	0f 8e b4 fe ff ff    	jle    8023ba <reg_device+0x19>
        }
    }
    if(i==MAX_DEVICES)
  802506:	83 7d f4 40          	cmp    DWORD PTR [rbp-0xc],0x40
  80250a:	75 0a                	jne    802516 <reg_device+0x175>
        return -1;
  80250c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802511:	e9 6d 01 00 00       	jmp    802683 <reg_device+0x2e2>
    //添加到链表
    device* p=NULL,*neo=&devs[i],**pp;
  802516:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80251d:	00 
  80251e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802521:	48 63 d0             	movsxd rdx,eax
  802524:	48 89 d0             	mov    rax,rdx
  802527:	48 c1 e0 02          	shl    rax,0x2
  80252b:	48 01 d0             	add    rax,rdx
  80252e:	48 c1 e0 02          	shl    rax,0x2
  802532:	48 01 d0             	add    rax,rdx
  802535:	48 c1 e0 03          	shl    rax,0x3
  802539:	48 05 80 2e 40 00    	add    rax,0x402e80
  80253f:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    switch (dev->type)
  802543:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802547:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80254a:	83 f8 03             	cmp    eax,0x3
  80254d:	74 3b                	je     80258a <reg_device+0x1e9>
  80254f:	83 f8 03             	cmp    eax,0x3
  802552:	7f 4b                	jg     80259f <reg_device+0x1fe>
  802554:	83 f8 01             	cmp    eax,0x1
  802557:	74 07                	je     802560 <reg_device+0x1bf>
  802559:	83 f8 02             	cmp    eax,0x2
  80255c:	74 17                	je     802575 <reg_device+0x1d4>
  80255e:	eb 3f                	jmp    80259f <reg_device+0x1fe>
    {
    case DEV_TYPE_BLKDEV:
        p=dev_tree[DEVTREE_BLKDEVI];pp=&dev_tree[DEVTREE_BLKDEVI];
  802560:	48 8b 05 19 5f c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05f19]        # 408480 <dev_tree>
  802567:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  80256b:	48 c7 45 e0 80 84 40 	mov    QWORD PTR [rbp-0x20],0x408480
  802572:	00 
        break;
  802573:	eb 34                	jmp    8025a9 <reg_device+0x208>
    
    case DEV_TYPE_CHRDEV:
        p=dev_tree[DEVTREE_CHRDEVI];pp=&dev_tree[DEVTREE_CHRDEVI];
  802575:	48 8b 05 0c 5f c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05f0c]        # 408488 <dev_tree+0x8>
  80257c:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802580:	48 c7 45 e0 88 84 40 	mov    QWORD PTR [rbp-0x20],0x408488
  802587:	00 
        break;
  802588:	eb 1f                	jmp    8025a9 <reg_device+0x208>
        
    case DEV_TYPE_OTHERS:
        p=dev_tree[DEVTREE_OTHERDEVI];pp=&dev_tree[DEVTREE_OTHERDEVI];
  80258a:	48 8b 05 ff 5e c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05eff]        # 408490 <dev_tree+0x10>
  802591:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802595:	48 c7 45 e0 90 84 40 	mov    QWORD PTR [rbp-0x20],0x408490
  80259c:	00 
        break;
  80259d:	eb 0a                	jmp    8025a9 <reg_device+0x208>
    default:return -1;//不可能有其他情况
  80259f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8025a4:	e9 da 00 00 00       	jmp    802683 <reg_device+0x2e2>
    }
    if(!p){
  8025a9:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  8025ae:	75 2b                	jne    8025db <reg_device+0x23a>
        *pp=neo;
  8025b0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8025b4:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8025b8:	48 89 10             	mov    QWORD PTR [rax],rdx
        neo->prev=NULL;
  8025bb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8025bf:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x0
  8025c6:	00 00 00 00 
  8025ca:	eb 3d                	jmp    802609 <reg_device+0x268>
    }
    else{
        for(;p->next;p=p->next);
  8025cc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8025d0:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  8025d7:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  8025db:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8025df:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  8025e6:	48 85 c0             	test   rax,rax
  8025e9:	75 e1                	jne    8025cc <reg_device+0x22b>
        p->next=neo;
  8025eb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8025ef:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8025f3:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
        neo->prev=p;
  8025fa:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8025fe:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  802602:	48 89 90 98 00 00 00 	mov    QWORD PTR [rax+0x98],rdx
    }
    neo->next=NULL;
  802609:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80260d:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x0
  802614:	00 00 00 00 
    //设置相应的请求函数
    switch (neo->stype)
  802618:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80261c:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80261f:	83 f8 04             	cmp    eax,0x4
  802622:	74 3b                	je     80265f <reg_device+0x2be>
  802624:	83 f8 04             	cmp    eax,0x4
  802627:	7f 56                	jg     80267f <reg_device+0x2de>
  802629:	83 f8 03             	cmp    eax,0x3
  80262c:	74 21                	je     80264f <reg_device+0x2ae>
  80262e:	83 f8 03             	cmp    eax,0x3
  802631:	7f 4c                	jg     80267f <reg_device+0x2de>
  802633:	83 f8 01             	cmp    eax,0x1
  802636:	74 07                	je     80263f <reg_device+0x29e>
  802638:	83 f8 02             	cmp    eax,0x2
  80263b:	74 32                	je     80266f <reg_device+0x2ce>
        break;
    case DEV_STYPE_TTY:
        neo->operi=OPERATIONS_TTY;
        break;
    default:
        break;
  80263d:	eb 40                	jmp    80267f <reg_device+0x2de>
        neo->operi=OPERATIONS_HD;
  80263f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802643:	c7 80 a0 00 00 00 00 	mov    DWORD PTR [rax+0xa0],0x0
  80264a:	00 00 00 
        break;
  80264d:	eb 31                	jmp    802680 <reg_device+0x2df>
        neo->operi=OPERATIONS_MOUSE;
  80264f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802653:	c7 80 a0 00 00 00 02 	mov    DWORD PTR [rax+0xa0],0x2
  80265a:	00 00 00 
        break;
  80265d:	eb 21                	jmp    802680 <reg_device+0x2df>
        neo->operi=OPERATIONS_KEYBOARD;
  80265f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802663:	c7 80 a0 00 00 00 03 	mov    DWORD PTR [rax+0xa0],0x3
  80266a:	00 00 00 
        break;
  80266d:	eb 11                	jmp    802680 <reg_device+0x2df>
        neo->operi=OPERATIONS_TTY;
  80266f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802673:	c7 80 a0 00 00 00 01 	mov    DWORD PTR [rax+0xa0],0x1
  80267a:	00 00 00 
        break;
  80267d:	eb 01                	jmp    802680 <reg_device+0x2df>
        break;
  80267f:	90                   	nop
    }
    return i;
  802680:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  802683:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802687:	c9                   	leave  
  802688:	c3                   	ret    

0000000000802689 <reg_driver>:


int reg_driver(driver *drv)
{
  802689:	f3 0f 1e fa          	endbr64 
  80268d:	55                   	push   rbp
  80268e:	48 89 e5             	mov    rbp,rsp
  802691:	53                   	push   rbx
  802692:	48 89 7d e0          	mov    QWORD PTR [rbp-0x20],rdi
    for(int i=0;i<MAX_DRIVERS;i++)
  802696:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80269d:	e9 22 01 00 00       	jmp    8027c4 <reg_driver+0x13b>
    {
        if(drvs[i].flag==DRV_FLAG_EMPTY)
  8026a2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8026a5:	48 63 d0             	movsxd rdx,eax
  8026a8:	48 89 d0             	mov    rax,rdx
  8026ab:	48 c1 e0 02          	shl    rax,0x2
  8026af:	48 01 d0             	add    rax,rdx
  8026b2:	48 c1 e0 05          	shl    rax,0x5
  8026b6:	48 05 80 58 40 00    	add    rax,0x405880
  8026bc:	8b 00                	mov    eax,DWORD PTR [rax]
  8026be:	85 c0                	test   eax,eax
  8026c0:	0f 85 fa 00 00 00    	jne    8027c0 <reg_driver+0x137>
        {
            drvs[i]=*drv;
  8026c6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8026c9:	48 63 d0             	movsxd rdx,eax
  8026cc:	48 89 d0             	mov    rax,rdx
  8026cf:	48 c1 e0 02          	shl    rax,0x2
  8026d3:	48 01 d0             	add    rax,rdx
  8026d6:	48 c1 e0 05          	shl    rax,0x5
  8026da:	48 8d 90 80 58 40 00 	lea    rdx,[rax+0x405880]
  8026e1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8026e5:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8026e8:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  8026ec:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  8026ef:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  8026f3:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  8026f7:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  8026fb:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  8026ff:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802703:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802707:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  80270b:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  80270f:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802713:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802717:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  80271b:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  80271f:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802723:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802727:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  80272b:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  80272f:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802733:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802737:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  80273b:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  80273f:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802743:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802747:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  80274b:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  80274f:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802753:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802757:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  80275b:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  80275f:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802763:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  80276a:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802771:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802778:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  80277f:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802786:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  80278d:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802794:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
            drvs[i].flag=DRV_FLAG_USED;
  80279b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80279e:	48 63 d0             	movsxd rdx,eax
  8027a1:	48 89 d0             	mov    rax,rdx
  8027a4:	48 c1 e0 02          	shl    rax,0x2
  8027a8:	48 01 d0             	add    rax,rdx
  8027ab:	48 c1 e0 05          	shl    rax,0x5
  8027af:	48 05 80 58 40 00    	add    rax,0x405880
  8027b5:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            return i;
  8027bb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8027be:	eb 13                	jmp    8027d3 <reg_driver+0x14a>
    for(int i=0;i<MAX_DRIVERS;i++)
  8027c0:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8027c4:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  8027c8:	0f 8e d4 fe ff ff    	jle    8026a2 <reg_driver+0x19>
        }
    }
    return -1;
  8027ce:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8027d3:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8027d7:	c9                   	leave  
  8027d8:	c3                   	ret    

00000000008027d9 <sys_find_dev>:

int sys_find_dev(char *name)
{
  8027d9:	f3 0f 1e fa          	endbr64 
  8027dd:	55                   	push   rbp
  8027de:	48 89 e5             	mov    rbp,rsp
  8027e1:	48 83 ec 20          	sub    rsp,0x20
  8027e5:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_DEVICES;i++)
  8027e9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8027f0:	eb 6c                	jmp    80285e <sys_find_dev+0x85>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  8027f2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8027f5:	48 63 d0             	movsxd rdx,eax
  8027f8:	48 89 d0             	mov    rax,rdx
  8027fb:	48 c1 e0 02          	shl    rax,0x2
  8027ff:	48 01 d0             	add    rax,rdx
  802802:	48 c1 e0 02          	shl    rax,0x2
  802806:	48 01 d0             	add    rax,rdx
  802809:	48 c1 e0 03          	shl    rax,0x3
  80280d:	48 05 90 2e 40 00    	add    rax,0x402e90
  802813:	8b 00                	mov    eax,DWORD PTR [rax]
  802815:	85 c0                	test   eax,eax
  802817:	74 41                	je     80285a <sys_find_dev+0x81>
  802819:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80281c:	48 63 d0             	movsxd rdx,eax
  80281f:	48 89 d0             	mov    rax,rdx
  802822:	48 c1 e0 02          	shl    rax,0x2
  802826:	48 01 d0             	add    rax,rdx
  802829:	48 c1 e0 02          	shl    rax,0x2
  80282d:	48 01 d0             	add    rax,rdx
  802830:	48 c1 e0 03          	shl    rax,0x3
  802834:	48 83 c0 10          	add    rax,0x10
  802838:	48 05 80 2e 40 00    	add    rax,0x402e80
  80283e:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802842:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802846:	48 89 d6             	mov    rsi,rdx
  802849:	48 89 c7             	mov    rdi,rax
  80284c:	e8 6e 82 00 00       	call   80aabf <strcmp>
  802851:	85 c0                	test   eax,eax
  802853:	75 05                	jne    80285a <sys_find_dev+0x81>
            return i;
  802855:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802858:	eb 0f                	jmp    802869 <sys_find_dev+0x90>
    for(int i=0;i<MAX_DEVICES;i++)
  80285a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80285e:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802862:	7e 8e                	jle    8027f2 <sys_find_dev+0x19>
    }
    return -1;
  802864:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802869:	c9                   	leave  
  80286a:	c3                   	ret    

000000000080286b <sys_operate_dev>:

int sys_operate_dev(char *name,int func,driver_args* args)
{
  80286b:	f3 0f 1e fa          	endbr64 
  80286f:	55                   	push   rbp
  802870:	48 89 e5             	mov    rbp,rsp
  802873:	48 83 ec 30          	sub    rsp,0x30
  802877:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80287b:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  80287e:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    int i=0;
  802882:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;i<MAX_DEVICES;i++)
  802889:	eb 67                	jmp    8028f2 <sys_operate_dev+0x87>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  80288b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80288e:	48 63 d0             	movsxd rdx,eax
  802891:	48 89 d0             	mov    rax,rdx
  802894:	48 c1 e0 02          	shl    rax,0x2
  802898:	48 01 d0             	add    rax,rdx
  80289b:	48 c1 e0 02          	shl    rax,0x2
  80289f:	48 01 d0             	add    rax,rdx
  8028a2:	48 c1 e0 03          	shl    rax,0x3
  8028a6:	48 05 90 2e 40 00    	add    rax,0x402e90
  8028ac:	8b 00                	mov    eax,DWORD PTR [rax]
  8028ae:	85 c0                	test   eax,eax
  8028b0:	74 3c                	je     8028ee <sys_operate_dev+0x83>
  8028b2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8028b5:	48 63 d0             	movsxd rdx,eax
  8028b8:	48 89 d0             	mov    rax,rdx
  8028bb:	48 c1 e0 02          	shl    rax,0x2
  8028bf:	48 01 d0             	add    rax,rdx
  8028c2:	48 c1 e0 02          	shl    rax,0x2
  8028c6:	48 01 d0             	add    rax,rdx
  8028c9:	48 c1 e0 03          	shl    rax,0x3
  8028cd:	48 83 c0 10          	add    rax,0x10
  8028d1:	48 05 80 2e 40 00    	add    rax,0x402e80
  8028d7:	48 8d 50 04          	lea    rdx,[rax+0x4]
  8028db:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8028df:	48 89 d6             	mov    rsi,rdx
  8028e2:	48 89 c7             	mov    rdi,rax
  8028e5:	e8 d5 81 00 00       	call   80aabf <strcmp>
  8028ea:	85 c0                	test   eax,eax
  8028ec:	74 0c                	je     8028fa <sys_operate_dev+0x8f>
    for(;i<MAX_DEVICES;i++)
  8028ee:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8028f2:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8028f6:	7e 93                	jle    80288b <sys_operate_dev+0x20>
  8028f8:	eb 01                	jmp    8028fb <sys_operate_dev+0x90>
            break;
  8028fa:	90                   	nop
    }
    if(i==MAX_DEVICES)return -1;
  8028fb:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  8028ff:	75 0a                	jne    80290b <sys_operate_dev+0xa0>
  802901:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802906:	e9 9c 02 00 00       	jmp    802ba7 <sys_operate_dev+0x33c>
    switch (func) {
  80290b:	83 7d e4 0b          	cmp    DWORD PTR [rbp-0x1c],0xb
  80290f:	0f 87 8d 02 00 00    	ja     802ba2 <sys_operate_dev+0x337>
  802915:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  802918:	48 8b 04 c5 68 2d 81 	mov    rax,QWORD PTR [rax*8+0x812d68]
  80291f:	00 
  802920:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return devs[i].drv->open(args);
  802923:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802926:	48 63 d0             	movsxd rdx,eax
  802929:	48 89 d0             	mov    rax,rdx
  80292c:	48 c1 e0 02          	shl    rax,0x2
  802930:	48 01 d0             	add    rax,rdx
  802933:	48 c1 e0 02          	shl    rax,0x2
  802937:	48 01 d0             	add    rax,rdx
  80293a:	48 c1 e0 03          	shl    rax,0x3
  80293e:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802944:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802947:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  80294b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80294f:	48 89 c7             	mov    rdi,rax
  802952:	ff d2                	call   rdx
  802954:	e9 4e 02 00 00       	jmp    802ba7 <sys_operate_dev+0x33c>
        case DRVF_CLOSE:return devs[i].drv->close(args);
  802959:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80295c:	48 63 d0             	movsxd rdx,eax
  80295f:	48 89 d0             	mov    rax,rdx
  802962:	48 c1 e0 02          	shl    rax,0x2
  802966:	48 01 d0             	add    rax,rdx
  802969:	48 c1 e0 02          	shl    rax,0x2
  80296d:	48 01 d0             	add    rax,rdx
  802970:	48 c1 e0 03          	shl    rax,0x3
  802974:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80297a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80297d:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  802981:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802985:	48 89 c7             	mov    rdi,rax
  802988:	ff d2                	call   rdx
  80298a:	e9 18 02 00 00       	jmp    802ba7 <sys_operate_dev+0x33c>
        case DRVF_READ :return devs[i].drv->read(args);
  80298f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802992:	48 63 d0             	movsxd rdx,eax
  802995:	48 89 d0             	mov    rax,rdx
  802998:	48 c1 e0 02          	shl    rax,0x2
  80299c:	48 01 d0             	add    rax,rdx
  80299f:	48 c1 e0 02          	shl    rax,0x2
  8029a3:	48 01 d0             	add    rax,rdx
  8029a6:	48 c1 e0 03          	shl    rax,0x3
  8029aa:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8029b0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8029b3:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  8029b7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8029bb:	48 89 c7             	mov    rdi,rax
  8029be:	ff d2                	call   rdx
  8029c0:	e9 e2 01 00 00       	jmp    802ba7 <sys_operate_dev+0x33c>
        case DRVF_WRITE:return devs[i].drv->write(args);
  8029c5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8029c8:	48 63 d0             	movsxd rdx,eax
  8029cb:	48 89 d0             	mov    rax,rdx
  8029ce:	48 c1 e0 02          	shl    rax,0x2
  8029d2:	48 01 d0             	add    rax,rdx
  8029d5:	48 c1 e0 02          	shl    rax,0x2
  8029d9:	48 01 d0             	add    rax,rdx
  8029dc:	48 c1 e0 03          	shl    rax,0x3
  8029e0:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8029e6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8029e9:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  8029ed:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8029f1:	48 89 c7             	mov    rdi,rax
  8029f4:	ff d2                	call   rdx
  8029f6:	e9 ac 01 00 00       	jmp    802ba7 <sys_operate_dev+0x33c>
        case DRVF_CHK  :return devs[i].drv->check(args);
  8029fb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8029fe:	48 63 d0             	movsxd rdx,eax
  802a01:	48 89 d0             	mov    rax,rdx
  802a04:	48 c1 e0 02          	shl    rax,0x2
  802a08:	48 01 d0             	add    rax,rdx
  802a0b:	48 c1 e0 02          	shl    rax,0x2
  802a0f:	48 01 d0             	add    rax,rdx
  802a12:	48 c1 e0 03          	shl    rax,0x3
  802a16:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802a1c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802a1f:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  802a23:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802a27:	48 89 c7             	mov    rdi,rax
  802a2a:	ff d2                	call   rdx
  802a2c:	e9 76 01 00 00       	jmp    802ba7 <sys_operate_dev+0x33c>
        case DRVF_RSVD :return devs[i].drv->reserved(args);
  802a31:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802a34:	48 63 d0             	movsxd rdx,eax
  802a37:	48 89 d0             	mov    rax,rdx
  802a3a:	48 c1 e0 02          	shl    rax,0x2
  802a3e:	48 01 d0             	add    rax,rdx
  802a41:	48 c1 e0 02          	shl    rax,0x2
  802a45:	48 01 d0             	add    rax,rdx
  802a48:	48 c1 e0 03          	shl    rax,0x3
  802a4c:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802a52:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802a55:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
  802a59:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802a5d:	48 89 c7             	mov    rdi,rax
  802a60:	ff d2                	call   rdx
  802a62:	e9 40 01 00 00       	jmp    802ba7 <sys_operate_dev+0x33c>
        case DRVF_INT  :return devs[i].drv->inthandler(args);
  802a67:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802a6a:	48 63 d0             	movsxd rdx,eax
  802a6d:	48 89 d0             	mov    rax,rdx
  802a70:	48 c1 e0 02          	shl    rax,0x2
  802a74:	48 01 d0             	add    rax,rdx
  802a77:	48 c1 e0 02          	shl    rax,0x2
  802a7b:	48 01 d0             	add    rax,rdx
  802a7e:	48 c1 e0 03          	shl    rax,0x3
  802a82:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802a88:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802a8b:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
  802a8f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802a93:	48 89 c7             	mov    rdi,rax
  802a96:	ff d2                	call   rdx
  802a98:	e9 0a 01 00 00       	jmp    802ba7 <sys_operate_dev+0x33c>
        case DRVF_FIND :return devs[i].drv->find(args);
  802a9d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802aa0:	48 63 d0             	movsxd rdx,eax
  802aa3:	48 89 d0             	mov    rax,rdx
  802aa6:	48 c1 e0 02          	shl    rax,0x2
  802aaa:	48 01 d0             	add    rax,rdx
  802aad:	48 c1 e0 02          	shl    rax,0x2
  802ab1:	48 01 d0             	add    rax,rdx
  802ab4:	48 c1 e0 03          	shl    rax,0x3
  802ab8:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802abe:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802ac1:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  802ac5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802ac9:	48 89 c7             	mov    rdi,rax
  802acc:	ff d2                	call   rdx
  802ace:	e9 d4 00 00 00       	jmp    802ba7 <sys_operate_dev+0x33c>
        case DRVF_RM   :return devs[i].drv->rm(args);
  802ad3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802ad6:	48 63 d0             	movsxd rdx,eax
  802ad9:	48 89 d0             	mov    rax,rdx
  802adc:	48 c1 e0 02          	shl    rax,0x2
  802ae0:	48 01 d0             	add    rax,rdx
  802ae3:	48 c1 e0 02          	shl    rax,0x2
  802ae7:	48 01 d0             	add    rax,rdx
  802aea:	48 c1 e0 03          	shl    rax,0x3
  802aee:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802af4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802af7:	48 8b 50 48          	mov    rdx,QWORD PTR [rax+0x48]
  802afb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802aff:	48 89 c7             	mov    rdi,rax
  802b02:	ff d2                	call   rdx
  802b04:	e9 9e 00 00 00       	jmp    802ba7 <sys_operate_dev+0x33c>
        case DRVF_TOUCH:return devs[i].drv->touch(args);
  802b09:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802b0c:	48 63 d0             	movsxd rdx,eax
  802b0f:	48 89 d0             	mov    rax,rdx
  802b12:	48 c1 e0 02          	shl    rax,0x2
  802b16:	48 01 d0             	add    rax,rdx
  802b19:	48 c1 e0 02          	shl    rax,0x2
  802b1d:	48 01 d0             	add    rax,rdx
  802b20:	48 c1 e0 03          	shl    rax,0x3
  802b24:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802b2a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802b2d:	48 8b 50 50          	mov    rdx,QWORD PTR [rax+0x50]
  802b31:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802b35:	48 89 c7             	mov    rdi,rax
  802b38:	ff d2                	call   rdx
  802b3a:	eb 6b                	jmp    802ba7 <sys_operate_dev+0x33c>
        case DRVF_MKDIR:return devs[i].drv->mkdir(args);
  802b3c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802b3f:	48 63 d0             	movsxd rdx,eax
  802b42:	48 89 d0             	mov    rax,rdx
  802b45:	48 c1 e0 02          	shl    rax,0x2
  802b49:	48 01 d0             	add    rax,rdx
  802b4c:	48 c1 e0 02          	shl    rax,0x2
  802b50:	48 01 d0             	add    rax,rdx
  802b53:	48 c1 e0 03          	shl    rax,0x3
  802b57:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802b5d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802b60:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  802b64:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802b68:	48 89 c7             	mov    rdi,rax
  802b6b:	ff d2                	call   rdx
  802b6d:	eb 38                	jmp    802ba7 <sys_operate_dev+0x33c>
        case DRVF_LS:return    devs[i].drv->ls(args);
  802b6f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802b72:	48 63 d0             	movsxd rdx,eax
  802b75:	48 89 d0             	mov    rax,rdx
  802b78:	48 c1 e0 02          	shl    rax,0x2
  802b7c:	48 01 d0             	add    rax,rdx
  802b7f:	48 c1 e0 02          	shl    rax,0x2
  802b83:	48 01 d0             	add    rax,rdx
  802b86:	48 c1 e0 03          	shl    rax,0x3
  802b8a:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802b90:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802b93:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
  802b97:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802b9b:	48 89 c7             	mov    rdi,rax
  802b9e:	ff d2                	call   rdx
  802ba0:	eb 05                	jmp    802ba7 <sys_operate_dev+0x33c>
    }
    return -1;
  802ba2:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802ba7:	c9                   	leave  
  802ba8:	c3                   	ret    

0000000000802ba9 <call_drv_func>:
int call_drv_func(int drv_n,int func_n,driver_args *args)
{
  802ba9:	f3 0f 1e fa          	endbr64 
  802bad:	55                   	push   rbp
  802bae:	48 89 e5             	mov    rbp,rsp
  802bb1:	48 83 ec 10          	sub    rsp,0x10
  802bb5:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  802bb8:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  802bbb:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    if(drvs[drv_n].flag==DRV_FLAG_EMPTY)return -1;
  802bbf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802bc2:	48 63 d0             	movsxd rdx,eax
  802bc5:	48 89 d0             	mov    rax,rdx
  802bc8:	48 c1 e0 02          	shl    rax,0x2
  802bcc:	48 01 d0             	add    rax,rdx
  802bcf:	48 c1 e0 05          	shl    rax,0x5
  802bd3:	48 05 80 58 40 00    	add    rax,0x405880
  802bd9:	8b 00                	mov    eax,DWORD PTR [rax]
  802bdb:	85 c0                	test   eax,eax
  802bdd:	75 0a                	jne    802be9 <call_drv_func+0x40>
  802bdf:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802be4:	e9 15 02 00 00       	jmp    802dfe <call_drv_func+0x255>
    /*driverfunc f=drvs[drv_n].func_thunk[func_n];
    return f(args);*/
    switch (func_n) {
  802be9:	83 7d f8 0b          	cmp    DWORD PTR [rbp-0x8],0xb
  802bed:	0f 87 06 02 00 00    	ja     802df9 <call_drv_func+0x250>
  802bf3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802bf6:	48 8b 04 c5 c8 2d 81 	mov    rax,QWORD PTR [rax*8+0x812dc8]
  802bfd:	00 
  802bfe:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return drvs[drv_n].open(args);
  802c01:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802c04:	48 63 d0             	movsxd rdx,eax
  802c07:	48 89 d0             	mov    rax,rdx
  802c0a:	48 c1 e0 02          	shl    rax,0x2
  802c0e:	48 01 d0             	add    rax,rdx
  802c11:	48 c1 e0 05          	shl    rax,0x5
  802c15:	48 05 88 58 40 00    	add    rax,0x405888
  802c1b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802c1e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802c22:	48 89 c7             	mov    rdi,rax
  802c25:	ff d2                	call   rdx
  802c27:	e9 d2 01 00 00       	jmp    802dfe <call_drv_func+0x255>
        case DRVF_CLOSE:return drvs[drv_n].close(args);
  802c2c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802c2f:	48 63 d0             	movsxd rdx,eax
  802c32:	48 89 d0             	mov    rax,rdx
  802c35:	48 c1 e0 02          	shl    rax,0x2
  802c39:	48 01 d0             	add    rax,rdx
  802c3c:	48 c1 e0 05          	shl    rax,0x5
  802c40:	48 05 90 58 40 00    	add    rax,0x405890
  802c46:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802c49:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802c4d:	48 89 c7             	mov    rdi,rax
  802c50:	ff d2                	call   rdx
  802c52:	e9 a7 01 00 00       	jmp    802dfe <call_drv_func+0x255>
        case DRVF_READ :return drvs[drv_n].read(args);
  802c57:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802c5a:	48 63 d0             	movsxd rdx,eax
  802c5d:	48 89 d0             	mov    rax,rdx
  802c60:	48 c1 e0 02          	shl    rax,0x2
  802c64:	48 01 d0             	add    rax,rdx
  802c67:	48 c1 e0 05          	shl    rax,0x5
  802c6b:	48 05 98 58 40 00    	add    rax,0x405898
  802c71:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802c74:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802c78:	48 89 c7             	mov    rdi,rax
  802c7b:	ff d2                	call   rdx
  802c7d:	e9 7c 01 00 00       	jmp    802dfe <call_drv_func+0x255>
        case DRVF_WRITE:return drvs[drv_n].write(args);
  802c82:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802c85:	48 63 d0             	movsxd rdx,eax
  802c88:	48 89 d0             	mov    rax,rdx
  802c8b:	48 c1 e0 02          	shl    rax,0x2
  802c8f:	48 01 d0             	add    rax,rdx
  802c92:	48 c1 e0 05          	shl    rax,0x5
  802c96:	48 05 a0 58 40 00    	add    rax,0x4058a0
  802c9c:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802c9f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802ca3:	48 89 c7             	mov    rdi,rax
  802ca6:	ff d2                	call   rdx
  802ca8:	e9 51 01 00 00       	jmp    802dfe <call_drv_func+0x255>
        case DRVF_CHK  :return drvs[drv_n].check(args);
  802cad:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802cb0:	48 63 d0             	movsxd rdx,eax
  802cb3:	48 89 d0             	mov    rax,rdx
  802cb6:	48 c1 e0 02          	shl    rax,0x2
  802cba:	48 01 d0             	add    rax,rdx
  802cbd:	48 c1 e0 05          	shl    rax,0x5
  802cc1:	48 05 a8 58 40 00    	add    rax,0x4058a8
  802cc7:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802cca:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802cce:	48 89 c7             	mov    rdi,rax
  802cd1:	ff d2                	call   rdx
  802cd3:	e9 26 01 00 00       	jmp    802dfe <call_drv_func+0x255>
        case DRVF_RSVD :return drvs[drv_n].reserved(args);
  802cd8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802cdb:	48 63 d0             	movsxd rdx,eax
  802cde:	48 89 d0             	mov    rax,rdx
  802ce1:	48 c1 e0 02          	shl    rax,0x2
  802ce5:	48 01 d0             	add    rax,rdx
  802ce8:	48 c1 e0 05          	shl    rax,0x5
  802cec:	48 05 b0 58 40 00    	add    rax,0x4058b0
  802cf2:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802cf5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802cf9:	48 89 c7             	mov    rdi,rax
  802cfc:	ff d2                	call   rdx
  802cfe:	e9 fb 00 00 00       	jmp    802dfe <call_drv_func+0x255>
        case DRVF_INT  :return drvs[drv_n].inthandler(args);
  802d03:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802d06:	48 63 d0             	movsxd rdx,eax
  802d09:	48 89 d0             	mov    rax,rdx
  802d0c:	48 c1 e0 02          	shl    rax,0x2
  802d10:	48 01 d0             	add    rax,rdx
  802d13:	48 c1 e0 05          	shl    rax,0x5
  802d17:	48 05 b8 58 40 00    	add    rax,0x4058b8
  802d1d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802d20:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802d24:	48 89 c7             	mov    rdi,rax
  802d27:	ff d2                	call   rdx
  802d29:	e9 d0 00 00 00       	jmp    802dfe <call_drv_func+0x255>
        case DRVF_FIND :return drvs[drv_n].find(args);
  802d2e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802d31:	48 63 d0             	movsxd rdx,eax
  802d34:	48 89 d0             	mov    rax,rdx
  802d37:	48 c1 e0 02          	shl    rax,0x2
  802d3b:	48 01 d0             	add    rax,rdx
  802d3e:	48 c1 e0 05          	shl    rax,0x5
  802d42:	48 05 c0 58 40 00    	add    rax,0x4058c0
  802d48:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802d4b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802d4f:	48 89 c7             	mov    rdi,rax
  802d52:	ff d2                	call   rdx
  802d54:	e9 a5 00 00 00       	jmp    802dfe <call_drv_func+0x255>
        case DRVF_RM   :return drvs[drv_n].rm(args);
  802d59:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802d5c:	48 63 d0             	movsxd rdx,eax
  802d5f:	48 89 d0             	mov    rax,rdx
  802d62:	48 c1 e0 02          	shl    rax,0x2
  802d66:	48 01 d0             	add    rax,rdx
  802d69:	48 c1 e0 05          	shl    rax,0x5
  802d6d:	48 05 c8 58 40 00    	add    rax,0x4058c8
  802d73:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802d76:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802d7a:	48 89 c7             	mov    rdi,rax
  802d7d:	ff d2                	call   rdx
  802d7f:	eb 7d                	jmp    802dfe <call_drv_func+0x255>
        case DRVF_TOUCH:return drvs[drv_n].touch(args);
  802d81:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802d84:	48 63 d0             	movsxd rdx,eax
  802d87:	48 89 d0             	mov    rax,rdx
  802d8a:	48 c1 e0 02          	shl    rax,0x2
  802d8e:	48 01 d0             	add    rax,rdx
  802d91:	48 c1 e0 05          	shl    rax,0x5
  802d95:	48 05 d0 58 40 00    	add    rax,0x4058d0
  802d9b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802d9e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802da2:	48 89 c7             	mov    rdi,rax
  802da5:	ff d2                	call   rdx
  802da7:	eb 55                	jmp    802dfe <call_drv_func+0x255>
        case DRVF_MKDIR:return drvs[drv_n].mkdir(args);
  802da9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802dac:	48 63 d0             	movsxd rdx,eax
  802daf:	48 89 d0             	mov    rax,rdx
  802db2:	48 c1 e0 02          	shl    rax,0x2
  802db6:	48 01 d0             	add    rax,rdx
  802db9:	48 c1 e0 05          	shl    rax,0x5
  802dbd:	48 05 d8 58 40 00    	add    rax,0x4058d8
  802dc3:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802dc6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802dca:	48 89 c7             	mov    rdi,rax
  802dcd:	ff d2                	call   rdx
  802dcf:	eb 2d                	jmp    802dfe <call_drv_func+0x255>
        case DRVF_LS:return drvs[drv_n].ls(args);
  802dd1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802dd4:	48 63 d0             	movsxd rdx,eax
  802dd7:	48 89 d0             	mov    rax,rdx
  802dda:	48 c1 e0 02          	shl    rax,0x2
  802dde:	48 01 d0             	add    rax,rdx
  802de1:	48 c1 e0 05          	shl    rax,0x5
  802de5:	48 05 e0 58 40 00    	add    rax,0x4058e0
  802deb:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802dee:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802df2:	48 89 c7             	mov    rdi,rax
  802df5:	ff d2                	call   rdx
  802df7:	eb 05                	jmp    802dfe <call_drv_func+0x255>
    }
    return -1;
  802df9:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802dfe:	c9                   	leave  
  802dff:	c3                   	ret    

0000000000802e00 <dispose_device>:
int dispose_device(int dev){
  802e00:	f3 0f 1e fa          	endbr64 
  802e04:	55                   	push   rbp
  802e05:	48 89 e5             	mov    rbp,rsp
  802e08:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(devs[dev].flag!=DEV_FLAG_USED)return -1;
  802e0b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802e0e:	48 63 d0             	movsxd rdx,eax
  802e11:	48 89 d0             	mov    rax,rdx
  802e14:	48 c1 e0 02          	shl    rax,0x2
  802e18:	48 01 d0             	add    rax,rdx
  802e1b:	48 c1 e0 02          	shl    rax,0x2
  802e1f:	48 01 d0             	add    rax,rdx
  802e22:	48 c1 e0 03          	shl    rax,0x3
  802e26:	48 05 90 2e 40 00    	add    rax,0x402e90
  802e2c:	8b 00                	mov    eax,DWORD PTR [rax]
  802e2e:	83 f8 01             	cmp    eax,0x1
  802e31:	74 07                	je     802e3a <dispose_device+0x3a>
  802e33:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802e38:	eb 62                	jmp    802e9c <dispose_device+0x9c>
    device* p=&devs[dev];
  802e3a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802e3d:	48 63 d0             	movsxd rdx,eax
  802e40:	48 89 d0             	mov    rax,rdx
  802e43:	48 c1 e0 02          	shl    rax,0x2
  802e47:	48 01 d0             	add    rax,rdx
  802e4a:	48 c1 e0 02          	shl    rax,0x2
  802e4e:	48 01 d0             	add    rax,rdx
  802e51:	48 c1 e0 03          	shl    rax,0x3
  802e55:	48 05 80 2e 40 00    	add    rax,0x402e80
  802e5b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //从链表删除
    if(p->prev)p->prev->next=p->next;
  802e5f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802e63:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  802e6a:	48 85 c0             	test   rax,rax
  802e6d:	74 1d                	je     802e8c <dispose_device+0x8c>
  802e6f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802e73:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  802e7a:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  802e7e:	48 8b 92 90 00 00 00 	mov    rdx,QWORD PTR [rdx+0x90]
  802e85:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
    p->flag=DEV_FLAG_EMPTY;
  802e8c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802e90:	c7 40 10 00 00 00 00 	mov    DWORD PTR [rax+0x10],0x0
    return 0;
  802e97:	b8 00 00 00 00       	mov    eax,0x0
}
  802e9c:	5d                   	pop    rbp
  802e9d:	c3                   	ret    

0000000000802e9e <dispose_driver>:
int dispose_driver(driver *drv){
  802e9e:	f3 0f 1e fa          	endbr64 
  802ea2:	55                   	push   rbp
  802ea3:	48 89 e5             	mov    rbp,rsp
  802ea6:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  802eaa:	90                   	nop
  802eab:	5d                   	pop    rbp
  802eac:	c3                   	ret    

0000000000802ead <get_dev>:

device *get_dev(int devi)
{
  802ead:	f3 0f 1e fa          	endbr64 
  802eb1:	55                   	push   rbp
  802eb2:	48 89 e5             	mov    rbp,rsp
  802eb5:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &devs[devi];
  802eb8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802ebb:	48 63 d0             	movsxd rdx,eax
  802ebe:	48 89 d0             	mov    rax,rdx
  802ec1:	48 c1 e0 02          	shl    rax,0x2
  802ec5:	48 01 d0             	add    rax,rdx
  802ec8:	48 c1 e0 02          	shl    rax,0x2
  802ecc:	48 01 d0             	add    rax,rdx
  802ecf:	48 c1 e0 03          	shl    rax,0x3
  802ed3:	48 05 80 2e 40 00    	add    rax,0x402e80
}
  802ed9:	5d                   	pop    rbp
  802eda:	c3                   	ret    

0000000000802edb <get_drv>:
driver *get_drv(int drvi)
{
  802edb:	f3 0f 1e fa          	endbr64 
  802edf:	55                   	push   rbp
  802ee0:	48 89 e5             	mov    rbp,rsp
  802ee3:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &drvs[drvi];
  802ee6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802ee9:	48 63 d0             	movsxd rdx,eax
  802eec:	48 89 d0             	mov    rax,rdx
  802eef:	48 c1 e0 02          	shl    rax,0x2
  802ef3:	48 01 d0             	add    rax,rdx
  802ef6:	48 c1 e0 05          	shl    rax,0x5
  802efa:	48 05 80 58 40 00    	add    rax,0x405880
}
  802f00:	5d                   	pop    rbp
  802f01:	c3                   	ret    

0000000000802f02 <make_request>:

//发送一个操作设备的申请
int make_request(driver_args* args)
{
  802f02:	f3 0f 1e fa          	endbr64 
  802f06:	55                   	push   rbp
  802f07:	48 89 e5             	mov    rbp,rsp
  802f0a:	53                   	push   rbx
  802f0b:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //在数组中寻找空项
    int i=0;
  802f0f:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<NR_REQS;i++)
  802f16:	eb 23                	jmp    802f3b <make_request+0x39>
    {
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  802f18:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802f1b:	48 63 d0             	movsxd rdx,eax
  802f1e:	48 89 d0             	mov    rax,rdx
  802f21:	48 01 c0             	add    rax,rax
  802f24:	48 01 d0             	add    rax,rdx
  802f27:	48 c1 e0 06          	shl    rax,0x6
  802f2b:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  802f31:	8b 00                	mov    eax,DWORD PTR [rax]
  802f33:	85 c0                	test   eax,eax
  802f35:	74 0c                	je     802f43 <make_request+0x41>
    for(;i<NR_REQS;i++)
  802f37:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802f3b:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  802f3f:	7e d7                	jle    802f18 <make_request+0x16>
  802f41:	eb 01                	jmp    802f44 <make_request+0x42>
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  802f43:	90                   	nop
    }
    if(i==NR_REQS)return -1;//满了
  802f44:	83 7d f4 20          	cmp    DWORD PTR [rbp-0xc],0x20
  802f48:	75 0a                	jne    802f54 <make_request+0x52>
  802f4a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802f4f:	e9 e7 01 00 00       	jmp    80313b <make_request+0x239>
    reqs[i]=*args;//放入数组
  802f54:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802f57:	48 63 d0             	movsxd rdx,eax
  802f5a:	48 89 d0             	mov    rax,rdx
  802f5d:	48 01 c0             	add    rax,rax
  802f60:	48 01 d0             	add    rax,rdx
  802f63:	48 c1 e0 06          	shl    rax,0x6
  802f67:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  802f6e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802f72:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802f75:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802f79:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802f7c:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802f80:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802f84:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802f88:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802f8c:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802f90:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802f94:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802f98:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802f9c:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802fa0:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802fa4:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802fa8:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802fac:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802fb0:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802fb4:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802fb8:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802fbc:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802fc0:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802fc4:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802fc8:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802fcc:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802fd0:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802fd4:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802fd8:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802fdc:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802fe0:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802fe4:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802fe8:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802fec:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802ff0:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802ff7:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802ffe:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  803005:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  80300c:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  803013:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  80301a:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  803021:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  803028:	48 8b 88 a0 00 00 00 	mov    rcx,QWORD PTR [rax+0xa0]
  80302f:	48 8b 98 a8 00 00 00 	mov    rbx,QWORD PTR [rax+0xa8]
  803036:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  80303d:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  803044:	48 8b 88 b0 00 00 00 	mov    rcx,QWORD PTR [rax+0xb0]
  80304b:	48 8b 98 b8 00 00 00 	mov    rbx,QWORD PTR [rax+0xb8]
  803052:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  803059:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
    //插入具体设备的等待链表中
    device* dev=&devs[args->dev];
  803060:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803064:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  80306a:	48 63 d0             	movsxd rdx,eax
  80306d:	48 89 d0             	mov    rax,rdx
  803070:	48 c1 e0 02          	shl    rax,0x2
  803074:	48 01 d0             	add    rax,rdx
  803077:	48 c1 e0 02          	shl    rax,0x2
  80307b:	48 01 d0             	add    rax,rdx
  80307e:	48 c1 e0 03          	shl    rax,0x3
  803082:	48 05 80 2e 40 00    	add    rax,0x402e80
  803088:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!dev->waiting_reqs)//空的等待队列
  80308c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803090:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803097:	48 85 c0             	test   rax,rax
  80309a:	75 27                	jne    8030c3 <make_request+0x1c1>
        dev->waiting_reqs=&reqs[i];
  80309c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80309f:	48 63 d0             	movsxd rdx,eax
  8030a2:	48 89 d0             	mov    rax,rdx
  8030a5:	48 01 c0             	add    rax,rax
  8030a8:	48 01 d0             	add    rax,rdx
  8030ab:	48 c1 e0 06          	shl    rax,0x6
  8030af:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  8030b6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8030ba:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
  8030c1:	eb 75                	jmp    803138 <make_request+0x236>
    else{
        driver_args* p=dev->waiting_reqs;
  8030c3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8030c7:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8030ce:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        for(;p->next;p=p->next);
  8030d2:	eb 0f                	jmp    8030e3 <make_request+0x1e1>
  8030d4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8030d8:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  8030df:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  8030e3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8030e7:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  8030ee:	48 85 c0             	test   rax,rax
  8030f1:	75 e1                	jne    8030d4 <make_request+0x1d2>
        p->next=&reqs[i];
  8030f3:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8030f6:	48 63 d0             	movsxd rdx,eax
  8030f9:	48 89 d0             	mov    rax,rdx
  8030fc:	48 01 c0             	add    rax,rax
  8030ff:	48 01 d0             	add    rax,rdx
  803102:	48 c1 e0 06          	shl    rax,0x6
  803106:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  80310d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803111:	48 89 90 b8 00 00 00 	mov    QWORD PTR [rax+0xb8],rdx
        reqs[i].next=NULL;
  803118:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80311b:	48 63 d0             	movsxd rdx,eax
  80311e:	48 89 d0             	mov    rax,rdx
  803121:	48 01 c0             	add    rax,rax
  803124:	48 01 d0             	add    rax,rdx
  803127:	48 c1 e0 06          	shl    rax,0x6
  80312b:	48 05 38 6d 40 00    	add    rax,0x406d38
  803131:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }

    return i;
  803138:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  80313b:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80313f:	c9                   	leave  
  803140:	c3                   	ret    

0000000000803141 <do_req>:
//取出一个申请并且执行
int do_req()
{
  803141:	f3 0f 1e fa          	endbr64 
  803145:	55                   	push   rbp
  803146:	48 89 e5             	mov    rbp,rsp
  803149:	48 83 ec 10          	sub    rsp,0x10
    //查看每个设备的请求情况
    //块设备
    for(int i=0;i<3;i++)
  80314d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803154:	e9 ab 00 00 00       	jmp    803204 <do_req+0xc3>
    {
        device* p=dev_tree[i];
  803159:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80315c:	48 98                	cdqe   
  80315e:	48 8b 04 c5 80 84 40 	mov    rax,QWORD PTR [rax*8+0x408480]
  803165:	00 
  803166:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(;p;p=p->next)
  80316a:	e9 86 00 00 00       	jmp    8031f5 <do_req+0xb4>
        {
            //如果没有请求运行而且有请求要运行
            if(!p->running_req&&p->waiting_reqs)
  80316f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803173:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  80317a:	48 85 c0             	test   rax,rax
  80317d:	75 67                	jne    8031e6 <do_req+0xa5>
  80317f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803183:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  80318a:	48 85 c0             	test   rax,rax
  80318d:	74 57                	je     8031e6 <do_req+0xa5>
            {
                p->running_req=p->waiting_reqs;
  80318f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803193:	48 8b 90 88 00 00 00 	mov    rdx,QWORD PTR [rax+0x88]
  80319a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80319e:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
                p->waiting_reqs=p->waiting_reqs->next;//取出一个
  8031a5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8031a9:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8031b0:	48 8b 90 b8 00 00 00 	mov    rdx,QWORD PTR [rax+0xb8]
  8031b7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8031bb:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
                dev_funcs[p->operi](p->running_req);
  8031c2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8031c6:	8b 80 a0 00 00 00    	mov    eax,DWORD PTR [rax+0xa0]
  8031cc:	48 98                	cdqe   
  8031ce:	48 8b 14 c5 20 b2 80 	mov    rdx,QWORD PTR [rax*8+0x80b220]
  8031d5:	00 
  8031d6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8031da:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  8031e1:	48 89 c7             	mov    rdi,rax
  8031e4:	ff d2                	call   rdx
        for(;p;p=p->next)
  8031e6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8031ea:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  8031f1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  8031f5:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  8031fa:	0f 85 6f ff ff ff    	jne    80316f <do_req+0x2e>
    for(int i=0;i<3;i++)
  803200:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803204:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  803208:	0f 8e 4b ff ff ff    	jle    803159 <do_req+0x18>
            }
            //如果还在运行（DONE的状态不能直接覆盖，因为里面的运行结果可能还没被拿走）
        }
    }
    
    return 0;
  80320e:	b8 00 00 00 00       	mov    eax,0x0
}
  803213:	c9                   	leave  
  803214:	c3                   	ret    

0000000000803215 <wait_on_req>:


void wait_on_req(int reqi)
{
  803215:	f3 0f 1e fa          	endbr64 
  803219:	55                   	push   rbp
  80321a:	48 89 e5             	mov    rbp,rsp
  80321d:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(reqs[reqi].stat!=REQ_STAT_DONE);
  803220:	90                   	nop
  803221:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803224:	48 63 d0             	movsxd rdx,eax
  803227:	48 89 d0             	mov    rax,rdx
  80322a:	48 01 c0             	add    rax,rax
  80322d:	48 01 d0             	add    rax,rdx
  803230:	48 c1 e0 06          	shl    rax,0x6
  803234:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  80323a:	8b 00                	mov    eax,DWORD PTR [rax]
  80323c:	83 f8 03             	cmp    eax,0x3
  80323f:	75 e0                	jne    803221 <wait_on_req+0xc>
}
  803241:	90                   	nop
  803242:	90                   	nop
  803243:	5d                   	pop    rbp
  803244:	c3                   	ret    

0000000000803245 <clear_req>:
void clear_req(int reqi)
{
  803245:	f3 0f 1e fa          	endbr64 
  803249:	55                   	push   rbp
  80324a:	48 89 e5             	mov    rbp,rsp
  80324d:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    reqs[reqi].stat=REQ_STAT_EMPTY;
  803250:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803253:	48 63 d0             	movsxd rdx,eax
  803256:	48 89 d0             	mov    rax,rdx
  803259:	48 01 c0             	add    rax,rax
  80325c:	48 01 d0             	add    rax,rdx
  80325f:	48 c1 e0 06          	shl    rax,0x6
  803263:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803269:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  80326f:	90                   	nop
  803270:	5d                   	pop    rbp
  803271:	c3                   	ret    

0000000000803272 <init_proc>:
TSS scene_saver;
TSS *tss=0x108000;
int cur_proc=0;
int pidd=0;
int palloc_paddr=0;
void init_proc(){
  803272:	f3 0f 1e fa          	endbr64 
  803276:	55                   	push   rbp
  803277:	48 89 e5             	mov    rbp,rsp
  80327a:	48 83 ec 10          	sub    rsp,0x10
    //task=(struct process*)get_global_var(TASK_PCBS_ADDR);//[MAX_TASKS];;
    for(int i=0;i<MAX_PROC_COUNT;i++){
  80327e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803285:	eb 61                	jmp    8032e8 <init_proc+0x76>
        task[i].pid=-1;
  803287:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80328a:	48 63 d0             	movsxd rdx,eax
  80328d:	48 89 d0             	mov    rax,rdx
  803290:	48 01 c0             	add    rax,rax
  803293:	48 01 d0             	add    rax,rdx
  803296:	48 c1 e0 08          	shl    rax,0x8
  80329a:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8032a0:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
        task[i].stat=ENDED;
  8032a6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032a9:	48 63 d0             	movsxd rdx,eax
  8032ac:	48 89 d0             	mov    rax,rdx
  8032af:	48 01 c0             	add    rax,rax
  8032b2:	48 01 d0             	add    rax,rdx
  8032b5:	48 c1 e0 08          	shl    rax,0x8
  8032b9:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8032bf:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
        task[i].parent_pid=-1;
  8032c5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032c8:	48 63 d0             	movsxd rdx,eax
  8032cb:	48 89 d0             	mov    rax,rdx
  8032ce:	48 01 c0             	add    rax,rax
  8032d1:	48 01 d0             	add    rax,rdx
  8032d4:	48 c1 e0 08          	shl    rax,0x8
  8032d8:	48 05 28 85 40 00    	add    rax,0x408528
  8032de:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<MAX_PROC_COUNT;i++){
  8032e4:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8032e8:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8032ec:	7e 99                	jle    803287 <init_proc+0x15>
    }
    cur_proc=0;//no proc
  8032ee:	c7 05 34 12 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc11234],0x0        # 41452c <cur_proc>
  8032f5:	00 00 00 
    current=task;
  8032f8:	48 c7 05 9d 11 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1119d],0x4084a0        # 4144a0 <current>
  8032ff:	a0 84 40 00 
    pidd=1;
  803303:	c7 05 23 12 c1 ff 01 	mov    DWORD PTR [rip+0xffffffffffc11223],0x1        # 414530 <pidd>
  80330a:	00 00 00 
     //创建0号进程
    int zi=create_proc();
  80330d:	b8 00 00 00 00       	mov    eax,0x0
  803312:	e8 8d 02 00 00       	call   8035a4 <create_proc>
  803317:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    task[zi].stat=READY;
  80331a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80331d:	48 63 d0             	movsxd rdx,eax
  803320:	48 89 d0             	mov    rax,rdx
  803323:	48 01 c0             	add    rax,rax
  803326:	48 01 d0             	add    rax,rdx
  803329:	48 c1 e0 08          	shl    rax,0x8
  80332d:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803333:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int xi= _LDT_IND(zi)*8;
  803339:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80333c:	83 c0 03             	add    eax,0x3
  80333f:	c1 e0 04             	shl    eax,0x4
  803342:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    zi=_TSS_IND(zi)*8;
  803345:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803348:	01 c0                	add    eax,eax
  80334a:	83 c0 05             	add    eax,0x5
  80334d:	c1 e0 03             	shl    eax,0x3
  803350:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //asm volatile("lldt %0"::"m"(xi));
    //asm volatile("ltr %0"::"m"(zi));
    set_tss(0x400000,0x400000,0x400000,0x800000,0x800000,0x800000,0x800000,0x800000,0x800000,0x800000);
  803353:	68 00 00 80 00       	push   0x800000
  803358:	68 00 00 80 00       	push   0x800000
  80335d:	68 00 00 80 00       	push   0x800000
  803362:	68 00 00 80 00       	push   0x800000
  803367:	41 b9 00 00 80 00    	mov    r9d,0x800000
  80336d:	41 b8 00 00 80 00    	mov    r8d,0x800000
  803373:	b9 00 00 80 00       	mov    ecx,0x800000
  803378:	ba 00 00 40 00       	mov    edx,0x400000
  80337d:	be 00 00 40 00       	mov    esi,0x400000
  803382:	bf 00 00 40 00       	mov    edi,0x400000
  803387:	e8 5d 13 00 00       	call   8046e9 <set_tss>
  80338c:	48 83 c4 20          	add    rsp,0x20
    //IA32_INTERRUPT_SSP_TABLE_ADDR，准备IST
    wrmsr(0x6a8,tss->rsvd2);
  803390:	48 8b 05 a9 7e 00 00 	mov    rax,QWORD PTR [rip+0x7ea9]        # 80b240 <tss>
  803397:	48 8b 40 1c          	mov    rax,QWORD PTR [rax+0x1c]
  80339b:	48 89 c6             	mov    rsi,rax
  80339e:	bf a8 06 00 00       	mov    edi,0x6a8
  8033a3:	e8 3f d4 ff ff       	call   8007e7 <wrmsr>
    //把内核代码段选择子写到MSR寄存器中准备用于特权级转换(sysexit，现在没用)
    wrmsr(0x174,0x8);
  8033a8:	be 08 00 00 00       	mov    esi,0x8
  8033ad:	bf 74 01 00 00       	mov    edi,0x174
  8033b2:	e8 30 d4 ff ff       	call   8007e7 <wrmsr>
    //准备用于特权级转换(sysret，正在使用)
    wrmsr(0xc0000081,0x0020000800000000ul);
  8033b7:	48 b8 00 00 00 00 08 	movabs rax,0x20000800000000
  8033be:	00 20 00 
  8033c1:	48 89 c6             	mov    rsi,rax
  8033c4:	b8 81 00 00 c0       	mov    eax,0xc0000081
  8033c9:	48 89 c7             	mov    rdi,rax
  8033cc:	e8 16 d4 ff ff       	call   8007e7 <wrmsr>
    //创建一个测试进程
    create_test_proc();
  8033d1:	b8 00 00 00 00       	mov    eax,0x0
  8033d6:	e8 03 00 00 00       	call   8033de <create_test_proc>
}
  8033db:	90                   	nop
  8033dc:	c9                   	leave  
  8033dd:	c3                   	ret    

00000000008033de <create_test_proc>:
void create_test_proc(){
  8033de:	f3 0f 1e fa          	endbr64 
  8033e2:	55                   	push   rbp
  8033e3:	48 89 e5             	mov    rbp,rsp
  8033e6:	48 83 ec 20          	sub    rsp,0x20

    int index=req_proc();
  8033ea:	b8 00 00 00 00       	mov    eax,0x0
  8033ef:	e8 33 02 00 00       	call   803627 <req_proc>
  8033f4:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    task[index].stat=READY;
  8033f7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8033fa:	48 63 d0             	movsxd rdx,eax
  8033fd:	48 89 d0             	mov    rax,rdx
  803400:	48 01 c0             	add    rax,rax
  803403:	48 01 d0             	add    rax,rdx
  803406:	48 c1 e0 08          	shl    rax,0x8
  80340a:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803410:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int currsp=0x9fc00-1;
  803416:	c7 45 ec ff fb 09 00 	mov    DWORD PTR [rbp-0x14],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  80341d:	48 89 65 ec          	mov    QWORD PTR [rbp-0x14],rsp
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  803421:	ba a2 b1 80 00       	mov    edx,0x80b1a2
  803426:	48 83 ec 08          	sub    rsp,0x8
  80342a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80342d:	50                   	push   rax
  80342e:	6a 00                	push   0x0
  803430:	52                   	push   rdx
  803431:	6a 00                	push   0x0
  803433:	6a 00                	push   0x0
  803435:	6a 00                	push   0x0
  803437:	68 58 7d 00 00       	push   0x7d58
  80343c:	6a 10                	push   0x10
  80343e:	6a 10                	push   0x10
  803440:	6a 10                	push   0x10
  803442:	6a 10                	push   0x10
  803444:	41 b9 08 00 00 00    	mov    r9d,0x8
  80344a:	41 b8 10 00 00 00    	mov    r8d,0x10
  803450:	b9 00 00 00 00       	mov    ecx,0x0
  803455:	ba 00 00 00 00       	mov    edx,0x0
  80345a:	be 00 00 00 00       	mov    esi,0x0
  80345f:	bf 00 00 00 00       	mov    edi,0x0
  803464:	e8 b7 02 00 00       	call   803720 <set_proc>
  803469:	48 83 c4 60          	add    rsp,0x60
             0x7e00- sizeof(stack_store_regs), 0, 0, 0, (long)ret_sys_call, 0, index);
    task[index].tss.rsp0=0x400000;
  80346d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803470:	48 63 d0             	movsxd rdx,eax
  803473:	48 89 d0             	mov    rax,rdx
  803476:	48 01 c0             	add    rax,rax
  803479:	48 01 d0             	add    rax,rdx
  80347c:	48 c1 e0 08          	shl    rax,0x8
  803480:	48 05 68 86 40 00    	add    rax,0x408668
  803486:	48 c7 00 00 00 40 00 	mov    QWORD PTR [rax],0x400000
    //把还原现场时用到的堆栈设置好
    stack_store_regs *str= (stack_store_regs *) (0x7e00 - sizeof(stack_store_regs));
  80348d:	48 c7 45 f0 58 7d 00 	mov    QWORD PTR [rbp-0x10],0x7d58
  803494:	00 
    str->rax=0;
  803495:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803499:	48 c7 40 78 00 00 00 	mov    QWORD PTR [rax+0x78],0x0
  8034a0:	00 
    str->rbx=0;
  8034a1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8034a5:	48 c7 40 70 00 00 00 	mov    QWORD PTR [rax+0x70],0x0
  8034ac:	00 
    str->rcx=proc_zero;//sysret采用的返回地址
  8034ad:	ba 8c 38 80 00       	mov    edx,0x80388c
  8034b2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8034b6:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    str->rdx=0;
  8034ba:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8034be:	48 c7 40 60 00 00 00 	mov    QWORD PTR [rax+0x60],0x0
  8034c5:	00 
    str->rsi=0;
  8034c6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8034ca:	48 c7 40 50 00 00 00 	mov    QWORD PTR [rax+0x50],0x0
  8034d1:	00 
    str->rdi=0;
  8034d2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8034d6:	48 c7 40 58 00 00 00 	mov    QWORD PTR [rax+0x58],0x0
  8034dd:	00 
    str->r15=0;
  8034de:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8034e2:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  8034e9:	00 
    str->r14=0;
  8034ea:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8034ee:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  8034f5:	00 
    str->r13=0;
  8034f6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8034fa:	48 c7 40 20 00 00 00 	mov    QWORD PTR [rax+0x20],0x0
  803501:	00 
    str->r12=0;
  803502:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803506:	48 c7 40 28 00 00 00 	mov    QWORD PTR [rax+0x28],0x0
  80350d:	00 
    str->r11=0;
  80350e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803512:	48 c7 40 30 00 00 00 	mov    QWORD PTR [rax+0x30],0x0
  803519:	00 
    str->r10=0;
  80351a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80351e:	48 c7 40 38 00 00 00 	mov    QWORD PTR [rax+0x38],0x0
  803525:	00 
    str->r9=0;
  803526:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80352a:	48 c7 40 40 00 00 00 	mov    QWORD PTR [rax+0x40],0x0
  803531:	00 
    str->r8=0;
  803532:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803536:	48 c7 40 48 00 00 00 	mov    QWORD PTR [rax+0x48],0x0
  80353d:	00 
    str->rip=proc_zero;
  80353e:	ba 8c 38 80 00       	mov    edx,0x80388c
  803543:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803547:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
    str->cs=0x8;
  80354e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803552:	48 c7 80 88 00 00 00 	mov    QWORD PTR [rax+0x88],0x8
  803559:	08 00 00 00 
    str->rflags=0x00200006;
  80355d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803561:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x200006
  803568:	06 00 20 00 
    str->rsp=0x7e00;
  80356c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803570:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x7e00
  803577:	00 7e 00 00 
    str->ss=0x2b;
  80357b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80357f:	48 c7 80 a0 00 00 00 	mov    QWORD PTR [rax+0xa0],0x2b
  803586:	2b 00 00 00 
    str->ds=0x2b;
  80358a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80358e:	48 c7 00 2b 00 00 00 	mov    QWORD PTR [rax],0x2b
    str->es=0x2b;
  803595:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803599:	48 c7 40 08 2b 00 00 	mov    QWORD PTR [rax+0x8],0x2b
  8035a0:	00 

}
  8035a1:	90                   	nop
  8035a2:	c9                   	leave  
  8035a3:	c3                   	ret    

00000000008035a4 <create_proc>:
int create_proc()
{
  8035a4:	f3 0f 1e fa          	endbr64 
  8035a8:	55                   	push   rbp
  8035a9:	48 89 e5             	mov    rbp,rsp
  8035ac:	48 83 ec 10          	sub    rsp,0x10
    int index=req_proc();
  8035b0:	b8 00 00 00 00       	mov    eax,0x0
  8035b5:	e8 6d 00 00 00       	call   803627 <req_proc>
  8035ba:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(index==-1)return -1;
  8035bd:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  8035c1:	75 07                	jne    8035ca <create_proc+0x26>
  8035c3:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8035c8:	eb 5b                	jmp    803625 <create_proc+0x81>
    int currsp=0x9fc00-1;
  8035ca:	c7 45 f8 ff fb 09 00 	mov    DWORD PTR [rbp-0x8],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  8035d1:	48 89 65 f8          	mov    QWORD PTR [rbp-0x8],rsp
    //默认DPL=3
    //set_proc(0,0,0,0,0x23,0x1b,0x23,0x23,0x23,0x23,curesp,0,0,0,0,index);
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  8035d5:	b9 8c 38 80 00       	mov    ecx,0x80388c
  8035da:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8035dd:	48 98                	cdqe   
  8035df:	48 83 ec 08          	sub    rsp,0x8
  8035e3:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8035e6:	52                   	push   rdx
  8035e7:	6a 00                	push   0x0
  8035e9:	51                   	push   rcx
  8035ea:	6a 00                	push   0x0
  8035ec:	6a 00                	push   0x0
  8035ee:	6a 00                	push   0x0
  8035f0:	50                   	push   rax
  8035f1:	6a 10                	push   0x10
  8035f3:	6a 10                	push   0x10
  8035f5:	6a 10                	push   0x10
  8035f7:	6a 10                	push   0x10
  8035f9:	41 b9 08 00 00 00    	mov    r9d,0x8
  8035ff:	41 b8 10 00 00 00    	mov    r8d,0x10
  803605:	b9 00 00 00 00       	mov    ecx,0x0
  80360a:	ba 00 00 00 00       	mov    edx,0x0
  80360f:	be 00 00 00 00       	mov    esi,0x0
  803614:	bf 00 00 00 00       	mov    edi,0x0
  803619:	e8 02 01 00 00       	call   803720 <set_proc>
  80361e:	48 83 c4 60          	add    rsp,0x60
             currsp, 0, 0, 0, (long)proc_zero, 0, index);
//    task[index].tss.eip=(long)proc_zero;

    return index;
  803622:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803625:	c9                   	leave  
  803626:	c3                   	ret    

0000000000803627 <req_proc>:
int req_proc(){
  803627:	f3 0f 1e fa          	endbr64 
  80362b:	55                   	push   rbp
  80362c:	48 89 e5             	mov    rbp,rsp
    int num=0;
  80362f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803636:	eb 04                	jmp    80363c <req_proc+0x15>
    num<=MAX_PROC_COUNT){
        num++;
  803638:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  80363c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80363f:	48 63 d0             	movsxd rdx,eax
  803642:	48 89 d0             	mov    rax,rdx
  803645:	48 01 c0             	add    rax,rax
  803648:	48 01 d0             	add    rax,rdx
  80364b:	48 c1 e0 08          	shl    rax,0x8
  80364f:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803655:	8b 00                	mov    eax,DWORD PTR [rax]
  803657:	83 f8 ff             	cmp    eax,0xffffffff
  80365a:	74 26                	je     803682 <req_proc+0x5b>
  80365c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80365f:	48 63 d0             	movsxd rdx,eax
  803662:	48 89 d0             	mov    rax,rdx
  803665:	48 01 c0             	add    rax,rax
  803668:	48 01 d0             	add    rax,rdx
  80366b:	48 c1 e0 08          	shl    rax,0x8
  80366f:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803675:	8b 00                	mov    eax,DWORD PTR [rax]
  803677:	83 f8 03             	cmp    eax,0x3
  80367a:	74 06                	je     803682 <req_proc+0x5b>
  80367c:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  803680:	7e b6                	jle    803638 <req_proc+0x11>
    }
    if(num>=MAX_PROC_COUNT)
  803682:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803686:	7e 0a                	jle    803692 <req_proc+0x6b>
        return -1;
  803688:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80368d:	e9 8c 00 00 00       	jmp    80371e <req_proc+0xf7>
    task[num].pid=pidd++;
  803692:	8b 05 98 0e c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10e98]        # 414530 <pidd>
  803698:	8d 50 01             	lea    edx,[rax+0x1]
  80369b:	89 15 8f 0e c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10e8f],edx        # 414530 <pidd>
  8036a1:	89 c1                	mov    ecx,eax
  8036a3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036a6:	48 63 d0             	movsxd rdx,eax
  8036a9:	48 89 d0             	mov    rax,rdx
  8036ac:	48 01 c0             	add    rax,rax
  8036af:	48 01 d0             	add    rax,rdx
  8036b2:	48 c1 e0 08          	shl    rax,0x8
  8036b6:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8036bc:	89 08                	mov    DWORD PTR [rax],ecx
    task[num].stat=ENDED;
  8036be:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036c1:	48 63 d0             	movsxd rdx,eax
  8036c4:	48 89 d0             	mov    rax,rdx
  8036c7:	48 01 c0             	add    rax,rax
  8036ca:	48 01 d0             	add    rax,rdx
  8036cd:	48 c1 e0 08          	shl    rax,0x8
  8036d1:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8036d7:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[num].utime=0;
  8036dd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036e0:	48 63 d0             	movsxd rdx,eax
  8036e3:	48 89 d0             	mov    rax,rdx
  8036e6:	48 01 c0             	add    rax,rax
  8036e9:	48 01 d0             	add    rax,rdx
  8036ec:	48 c1 e0 08          	shl    rax,0x8
  8036f0:	48 05 a8 84 40 00    	add    rax,0x4084a8
  8036f6:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[num].priority=0;
  8036fc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036ff:	48 63 d0             	movsxd rdx,eax
  803702:	48 89 d0             	mov    rax,rdx
  803705:	48 01 c0             	add    rax,rax
  803708:	48 01 d0             	add    rax,rdx
  80370b:	48 c1 e0 08          	shl    rax,0x8
  80370f:	48 05 ac 84 40 00    	add    rax,0x4084ac
  803715:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return num;
  80371b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80371e:	5d                   	pop    rbp
  80371f:	c3                   	ret    

0000000000803720 <set_proc>:
void set_proc(long eax, long ebx, long ecx, long edx, long es, long cs, long ss, long ds, long fs, long gs, long esp,
              long ebp, long esi, long edi, long rip, long eflags, int proc_nr) {
  803720:	f3 0f 1e fa          	endbr64 
  803724:	55                   	push   rbp
  803725:	48 89 e5             	mov    rbp,rsp
  803728:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80372c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  803730:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  803734:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  803738:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
  80373c:	4c 89 4d c0          	mov    QWORD PTR [rbp-0x40],r9
    struct process* proc=&task[proc_nr];
  803740:	8b 45 60             	mov    eax,DWORD PTR [rbp+0x60]
  803743:	48 63 d0             	movsxd rdx,eax
  803746:	48 89 d0             	mov    rax,rdx
  803749:	48 01 c0             	add    rax,rax
  80374c:	48 01 d0             	add    rax,rdx
  80374f:	48 c1 e0 08          	shl    rax,0x8
  803753:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803759:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    proc->regs.rax=eax;
  80375d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803761:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  803765:	48 89 90 48 02 00 00 	mov    QWORD PTR [rax+0x248],rdx
    proc->regs.rbx=ebx;
  80376c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803770:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  803774:	48 89 90 60 02 00 00 	mov    QWORD PTR [rax+0x260],rdx
    proc->regs.rcx=ecx;
  80377b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80377f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  803783:	48 89 90 50 02 00 00 	mov    QWORD PTR [rax+0x250],rdx
    proc->regs.rdx=edx;
  80378a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80378e:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  803792:	48 89 90 58 02 00 00 	mov    QWORD PTR [rax+0x258],rdx
    proc->regs.es=es;
  803799:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80379d:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  8037a1:	48 89 90 88 02 00 00 	mov    QWORD PTR [rax+0x288],rdx
    proc->regs.cs=cs;
  8037a8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8037ac:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  8037b0:	48 89 90 90 02 00 00 	mov    QWORD PTR [rax+0x290],rdx
    proc->regs.ss=ss;
  8037b7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8037bb:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  8037bf:	48 89 90 98 02 00 00 	mov    QWORD PTR [rax+0x298],rdx
    proc->regs.ds=ds;
  8037c6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8037ca:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  8037ce:	48 89 90 a0 02 00 00 	mov    QWORD PTR [rax+0x2a0],rdx
    proc->regs.fs=fs;
  8037d5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8037d9:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  8037dd:	48 89 90 a8 02 00 00 	mov    QWORD PTR [rax+0x2a8],rdx
    proc->regs.gs=gs;
  8037e4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8037e8:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  8037ec:	48 89 90 b0 02 00 00 	mov    QWORD PTR [rax+0x2b0],rdx
    proc->regs.rsp=esp;
  8037f3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8037f7:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  8037fb:	48 89 90 68 02 00 00 	mov    QWORD PTR [rax+0x268],rdx
    proc->regs.rbp=ebp;
  803802:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803806:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
  80380a:	48 89 90 70 02 00 00 	mov    QWORD PTR [rax+0x270],rdx
    proc->regs.rsi=esi;
  803811:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803815:	48 8b 55 40          	mov    rdx,QWORD PTR [rbp+0x40]
  803819:	48 89 90 78 02 00 00 	mov    QWORD PTR [rax+0x278],rdx
    proc->regs.rdi=edi;
  803820:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803824:	48 8b 55 48          	mov    rdx,QWORD PTR [rbp+0x48]
  803828:	48 89 90 80 02 00 00 	mov    QWORD PTR [rax+0x280],rdx
    proc->regs.rflags=0x202;//设置为默认值:0b 0010 0000 0010
  80382f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803833:	48 c7 80 40 02 00 00 	mov    QWORD PTR [rax+0x240],0x202
  80383a:	02 02 00 00 
    //能接受中断
    proc->regs.rip=rip;
  80383e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803842:	48 8b 55 50          	mov    rdx,QWORD PTR [rbp+0x50]
  803846:	48 89 90 38 02 00 00 	mov    QWORD PTR [rax+0x238],rdx

    proc->regs.cs=cs;
  80384d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803851:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803855:	48 89 90 90 02 00 00 	mov    QWORD PTR [rax+0x290],rdx
    proc->regs.ds=ds;
  80385c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803860:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803864:	48 89 90 a0 02 00 00 	mov    QWORD PTR [rax+0x2a0],rdx
    proc->regs.es=es;
  80386b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80386f:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803873:	48 89 90 88 02 00 00 	mov    QWORD PTR [rax+0x288],rdx
    proc->regs.cr3=PML4_ADDR;//get_phyaddr(n1);//暂时先搞成全局
  80387a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80387e:	48 c7 80 30 02 00 00 	mov    QWORD PTR [rax+0x230],0x101000
  803885:	00 10 10 00 


}
  803889:	90                   	nop
  80388a:	5d                   	pop    rbp
  80388b:	c3                   	ret    

000000000080388c <proc_zero>:
void proc_zero()
{
  80388c:	f3 0f 1e fa          	endbr64 
  803890:	55                   	push   rbp
  803891:	48 89 e5             	mov    rbp,rsp
    asm volatile("mov $1,%rax\n"
  803894:	48 c7 c0 01 00 00 00 	mov    rax,0x1
  80389b:	48 0f 05             	rex.W syscall 
                 ".byte 0x48\n"
                 "syscall");
    while(1);
  80389e:	eb fe                	jmp    80389e <proc_zero+0x12>

00000000008038a0 <manage_proc>:
}
void manage_proc(){
  8038a0:	f3 0f 1e fa          	endbr64 
  8038a4:	55                   	push   rbp
  8038a5:	48 89 e5             	mov    rbp,rsp
  8038a8:	48 83 ec 10          	sub    rsp,0x10
    if(cur_proc!=-1)
  8038ac:	8b 05 7a 0c c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10c7a]        # 41452c <cur_proc>
  8038b2:	83 f8 ff             	cmp    eax,0xffffffff
  8038b5:	74 39                	je     8038f0 <manage_proc+0x50>
        task[cur_proc].utime++;
  8038b7:	8b 15 6f 0c c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc10c6f]        # 41452c <cur_proc>
  8038bd:	48 63 ca             	movsxd rcx,edx
  8038c0:	48 89 c8             	mov    rax,rcx
  8038c3:	48 01 c0             	add    rax,rax
  8038c6:	48 01 c8             	add    rax,rcx
  8038c9:	48 c1 e0 08          	shl    rax,0x8
  8038cd:	48 05 a8 84 40 00    	add    rax,0x4084a8
  8038d3:	8b 00                	mov    eax,DWORD PTR [rax]
  8038d5:	8d 48 01             	lea    ecx,[rax+0x1]
  8038d8:	48 63 d2             	movsxd rdx,edx
  8038db:	48 89 d0             	mov    rax,rdx
  8038de:	48 01 c0             	add    rax,rax
  8038e1:	48 01 d0             	add    rax,rdx
  8038e4:	48 c1 e0 08          	shl    rax,0x8
  8038e8:	48 05 a8 84 40 00    	add    rax,0x4084a8
  8038ee:	89 08                	mov    DWORD PTR [rax],ecx
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  8038f0:	8b 05 36 0c c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10c36]        # 41452c <cur_proc>
  8038f6:	83 f8 ff             	cmp    eax,0xffffffff
  8038f9:	74 4a                	je     803945 <manage_proc+0xa5>
  8038fb:	8b 05 2b 0c c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10c2b]        # 41452c <cur_proc>
  803901:	48 63 d0             	movsxd rdx,eax
  803904:	48 89 d0             	mov    rax,rdx
  803907:	48 01 c0             	add    rax,rax
  80390a:	48 01 d0             	add    rax,rdx
  80390d:	48 c1 e0 08          	shl    rax,0x8
  803911:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803917:	8b 00                	mov    eax,DWORD PTR [rax]
  803919:	83 f8 01             	cmp    eax,0x1
  80391c:	77 27                	ja     803945 <manage_proc+0xa5>
    task[cur_proc].stat!=READY){
  80391e:	8b 05 08 0c c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10c08]        # 41452c <cur_proc>
  803924:	48 63 d0             	movsxd rdx,eax
  803927:	48 89 d0             	mov    rax,rdx
  80392a:	48 01 c0             	add    rax,rax
  80392d:	48 01 d0             	add    rax,rdx
  803930:	48 c1 e0 08          	shl    rax,0x8
  803934:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80393a:	8b 00                	mov    eax,DWORD PTR [rax]
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  80393c:	83 f8 01             	cmp    eax,0x1
  80393f:	0f 84 21 01 00 00    	je     803a66 <manage_proc+0x1c6>
        if(cur_proc!=-1)
  803945:	8b 05 e1 0b c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10be1]        # 41452c <cur_proc>
  80394b:	83 f8 ff             	cmp    eax,0xffffffff
  80394e:	74 22                	je     803972 <manage_proc+0xd2>
            task[cur_proc].utime=0;
  803950:	8b 05 d6 0b c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10bd6]        # 41452c <cur_proc>
  803956:	48 63 d0             	movsxd rdx,eax
  803959:	48 89 d0             	mov    rax,rdx
  80395c:	48 01 c0             	add    rax,rax
  80395f:	48 01 d0             	add    rax,rdx
  803962:	48 c1 e0 08          	shl    rax,0x8
  803966:	48 05 a8 84 40 00    	add    rax,0x4084a8
  80396c:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        //find
        int i=0;
  803972:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        for(i=0;i<MAX_PROC_COUNT;i++){
  803979:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803980:	eb 4f                	jmp    8039d1 <manage_proc+0x131>
            if(task[i].pid!=-1&&task[i].stat==READY&&i!=cur_proc){
  803982:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803985:	48 63 d0             	movsxd rdx,eax
  803988:	48 89 d0             	mov    rax,rdx
  80398b:	48 01 c0             	add    rax,rax
  80398e:	48 01 d0             	add    rax,rdx
  803991:	48 c1 e0 08          	shl    rax,0x8
  803995:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80399b:	8b 00                	mov    eax,DWORD PTR [rax]
  80399d:	83 f8 ff             	cmp    eax,0xffffffff
  8039a0:	74 2b                	je     8039cd <manage_proc+0x12d>
  8039a2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039a5:	48 63 d0             	movsxd rdx,eax
  8039a8:	48 89 d0             	mov    rax,rdx
  8039ab:	48 01 c0             	add    rax,rax
  8039ae:	48 01 d0             	add    rax,rdx
  8039b1:	48 c1 e0 08          	shl    rax,0x8
  8039b5:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8039bb:	8b 00                	mov    eax,DWORD PTR [rax]
  8039bd:	83 f8 01             	cmp    eax,0x1
  8039c0:	75 0b                	jne    8039cd <manage_proc+0x12d>
  8039c2:	8b 05 64 0b c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10b64]        # 41452c <cur_proc>
  8039c8:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  8039cb:	75 0c                	jne    8039d9 <manage_proc+0x139>
        for(i=0;i<MAX_PROC_COUNT;i++){
  8039cd:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8039d1:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8039d5:	7e ab                	jle    803982 <manage_proc+0xe2>
  8039d7:	eb 01                	jmp    8039da <manage_proc+0x13a>
                break;
  8039d9:	90                   	nop
            }
        }
        if(i>=MAX_PROC_COUNT)
  8039da:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8039de:	0f 8f 85 00 00 00    	jg     803a69 <manage_proc+0x1c9>
            return;
        //switch
        task[cur_proc].stat=READY;
  8039e4:	8b 05 42 0b c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10b42]        # 41452c <cur_proc>
  8039ea:	48 63 d0             	movsxd rdx,eax
  8039ed:	48 89 d0             	mov    rax,rdx
  8039f0:	48 01 c0             	add    rax,rax
  8039f3:	48 01 d0             	add    rax,rdx
  8039f6:	48 c1 e0 08          	shl    rax,0x8
  8039fa:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803a00:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        task[i].stat=RUNNING;
  803a06:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a09:	48 63 d0             	movsxd rdx,eax
  803a0c:	48 89 d0             	mov    rax,rdx
  803a0f:	48 01 c0             	add    rax,rax
  803a12:	48 01 d0             	add    rax,rdx
  803a15:	48 c1 e0 08          	shl    rax,0x8
  803a19:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803a1f:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        switch_to(&task[cur_proc], &task[i]);
  803a25:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a28:	48 63 d0             	movsxd rdx,eax
  803a2b:	48 89 d0             	mov    rax,rdx
  803a2e:	48 01 c0             	add    rax,rax
  803a31:	48 01 d0             	add    rax,rdx
  803a34:	48 c1 e0 08          	shl    rax,0x8
  803a38:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  803a3f:	8b 05 e7 0a c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10ae7]        # 41452c <cur_proc>
  803a45:	48 63 c8             	movsxd rcx,eax
  803a48:	48 89 c8             	mov    rax,rcx
  803a4b:	48 01 c0             	add    rax,rax
  803a4e:	48 01 c8             	add    rax,rcx
  803a51:	48 c1 e0 08          	shl    rax,0x8
  803a55:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803a5b:	48 89 d6             	mov    rsi,rdx
  803a5e:	48 89 c7             	mov    rdi,rax
  803a61:	e8 fd 0a 00 00       	call   804563 <switch_to>
    }
    return;
  803a66:	90                   	nop
  803a67:	eb 01                	jmp    803a6a <manage_proc+0x1ca>
            return;
  803a69:	90                   	nop
}
  803a6a:	c9                   	leave  
  803a6b:	c3                   	ret    

0000000000803a6c <switch_proc_tss>:

void switch_proc_tss(int pnr)
{
  803a6c:	f3 0f 1e fa          	endbr64 
  803a70:	55                   	push   rbp
  803a71:	48 89 e5             	mov    rbp,rsp
  803a74:	48 83 ec 20          	sub    rsp,0x20
  803a78:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int sel=_TSS_IND(pnr)*8;
  803a7b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803a7e:	01 c0                	add    eax,eax
  803a80:	83 c0 05             	add    eax,0x5
  803a83:	c1 e0 03             	shl    eax,0x3
  803a86:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    cur_proc=pnr;
  803a89:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803a8c:	89 05 9a 0a c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10a9a],eax        # 41452c <cur_proc>
    switch_proc_asm(sel);
  803a92:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a95:	89 c7                	mov    edi,eax
  803a97:	e8 1e 76 00 00       	call   80b0ba <switch_proc_asm>
}
  803a9c:	90                   	nop
  803a9d:	c9                   	leave  
  803a9e:	c3                   	ret    

0000000000803a9f <switch_proc>:
void switch_proc(int pnr){
  803a9f:	f3 0f 1e fa          	endbr64 
  803aa3:	55                   	push   rbp
  803aa4:	48 89 e5             	mov    rbp,rsp
  803aa7:	48 81 ec 20 03 00 00 	sub    rsp,0x320
  803aae:	89 bd ec fc ff ff    	mov    DWORD PTR [rbp-0x314],edi
    //printf("switching proc to %d\n",pnr);
    //printf("eip:%x\n",task[pnr].tss.eip);
    struct process p=task[pnr];
  803ab4:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  803aba:	48 63 d0             	movsxd rdx,eax
  803abd:	48 89 d0             	mov    rax,rdx
  803ac0:	48 01 c0             	add    rax,rax
  803ac3:	48 01 d0             	add    rax,rdx
  803ac6:	48 c1 e0 08          	shl    rax,0x8
  803aca:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  803ad1:	48 8d 85 f0 fc ff ff 	lea    rax,[rbp-0x310]
  803ad8:	48 89 d6             	mov    rsi,rdx
  803adb:	ba 60 00 00 00       	mov    edx,0x60
  803ae0:	48 89 c7             	mov    rdi,rax
  803ae3:	48 89 d1             	mov    rcx,rdx
  803ae6:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
    save_context(&task[cur_proc].tss);
  803ae9:	8b 05 3d 0a c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10a3d]        # 41452c <cur_proc>
  803aef:	48 63 d0             	movsxd rdx,eax
  803af2:	48 89 d0             	mov    rax,rdx
  803af5:	48 01 c0             	add    rax,rax
  803af8:	48 01 d0             	add    rax,rdx
  803afb:	48 c1 e0 08          	shl    rax,0x8
  803aff:	48 05 c0 01 00 00    	add    rax,0x1c0
  803b05:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803b0b:	48 83 c0 04          	add    rax,0x4
  803b0f:	48 89 c7             	mov    rdi,rax
  803b12:	e8 53 00 00 00       	call   803b6a <save_context>
//    //重新设置0号进程
//    task[0].tss.eip=proc_zero;
//    task[0].tss.cr3=PAGE_INDEX_ADDR;
//    task[0].tss.eflags=0x202;
    cur_proc=pnr;
  803b17:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  803b1d:	89 05 09 0a c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10a09],eax        # 41452c <cur_proc>
    int sel=_TSS_IND(pnr)*8;
  803b23:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  803b29:	01 c0                	add    eax,eax
  803b2b:	83 c0 05             	add    eax,0x5
  803b2e:	c1 e0 03             	shl    eax,0x3
  803b31:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    switch_to(NULL, &task[pnr].tss);
  803b34:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  803b3a:	48 63 d0             	movsxd rdx,eax
  803b3d:	48 89 d0             	mov    rax,rdx
  803b40:	48 01 c0             	add    rax,rax
  803b43:	48 01 d0             	add    rax,rdx
  803b46:	48 c1 e0 08          	shl    rax,0x8
  803b4a:	48 05 c0 01 00 00    	add    rax,0x1c0
  803b50:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803b56:	48 83 c0 04          	add    rax,0x4
  803b5a:	48 89 c6             	mov    rsi,rax
  803b5d:	bf 00 00 00 00       	mov    edi,0x0
  803b62:	e8 fc 09 00 00       	call   804563 <switch_to>
    //asm volatile("push %0":"=r"(task[pnr].tss.eip));
    //switch_proc_asm(pnr*8+0x8*3);
}
  803b67:	90                   	nop
  803b68:	c9                   	leave  
  803b69:	c3                   	ret    

0000000000803b6a <save_context>:
void save_context(TSS *tss)
{
  803b6a:	f3 0f 1e fa          	endbr64 
  803b6e:	55                   	push   rbp
  803b6f:	48 89 e5             	mov    rbp,rsp
  803b72:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//    tss->esi=scene_saver.esi;
//    tss->edi=scene_saver.edi;
//    tss->eflags=scene_saver.eflags;
//    tss->esp=scene_saver.esp;
//    tss->ebp=scene_saver.ebp;
}
  803b76:	90                   	nop
  803b77:	5d                   	pop    rbp
  803b78:	c3                   	ret    

0000000000803b79 <palloc>:
    task[index].stat=READY;
    return index;
} */
//为指定进程申请新的内存，并返回这块内存的线性地址。
void* palloc(int proc_index,int size)
{
  803b79:	f3 0f 1e fa          	endbr64 
  803b7d:	55                   	push   rbp
  803b7e:	48 89 e5             	mov    rbp,rsp
  803b81:	48 83 ec 60          	sub    rsp,0x60
  803b85:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  803b88:	89 75 a8             	mov    DWORD PTR [rbp-0x58],esi
    int page_c=size/4096+size%4096?1:0;
  803b8b:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  803b8e:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  803b94:	85 c0                	test   eax,eax
  803b96:	0f 48 c2             	cmovs  eax,edx
  803b99:	c1 f8 0c             	sar    eax,0xc
  803b9c:	89 c1                	mov    ecx,eax
  803b9e:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  803ba1:	99                   	cdq    
  803ba2:	c1 ea 14             	shr    edx,0x14
  803ba5:	01 d0                	add    eax,edx
  803ba7:	25 ff 0f 00 00       	and    eax,0xfff
  803bac:	29 d0                	sub    eax,edx
  803bae:	01 c8                	add    eax,ecx
  803bb0:	85 c0                	test   eax,eax
  803bb2:	0f 95 c0             	setne  al
  803bb5:	0f b6 c0             	movzx  eax,al
  803bb8:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=0;
  803bbb:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    void *ptr=NULL;
  803bc2:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  803bc9:	00 
    page_item *pgind=NULL;//task[proc_index].tss.cr3;
  803bca:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  803bd1:	00 
    pgind++;
  803bd2:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  803bd7:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [rbp-0x14],0x1
  803bde:	e9 76 02 00 00       	jmp    803e59 <palloc+0x2e0>
    {
        page_item* tblp=*pgind&0xfffff000;
  803be3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803be7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803bea:	25 00 f0 ff ff       	and    eax,0xfffff000
  803bef:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for(int j=0;j<1024;j++)
  803bf3:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  803bfa:	e9 44 02 00 00       	jmp    803e43 <palloc+0x2ca>
        {
            int v=*tblp&PAGE_PRESENT;
  803bff:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803c03:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803c06:	83 e0 01             	and    eax,0x1
  803c09:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
            if(!v)
  803c0c:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  803c10:	0f 85 24 02 00 00    	jne    803e3a <palloc+0x2c1>
            {
                int new_pg=req_a_page();
  803c16:	b8 00 00 00 00       	mov    eax,0x0
  803c1b:	e8 69 d8 ff ff       	call   801489 <req_a_page>
  803c20:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
                if(new_pg==-1)
  803c23:	83 7d c8 ff          	cmp    DWORD PTR [rbp-0x38],0xffffffff
  803c27:	0f 85 dc 00 00 00    	jne    803d09 <palloc+0x190>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  803c2d:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803c30:	48 63 d0             	movsxd rdx,eax
  803c33:	48 89 d0             	mov    rax,rdx
  803c36:	48 01 c0             	add    rax,rax
  803c39:	48 01 d0             	add    rax,rdx
  803c3c:	48 c1 e0 08          	shl    rax,0x8
  803c40:	48 05 f4 84 40 00    	add    rax,0x4084f4
  803c46:	0f b7 00             	movzx  eax,WORD PTR [rax]
  803c49:	0f b7 c0             	movzx  eax,ax
  803c4c:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  803c4f:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803c52:	48 63 d0             	movsxd rdx,eax
  803c55:	48 89 d0             	mov    rax,rdx
  803c58:	48 01 c0             	add    rax,rax
  803c5b:	48 01 d0             	add    rax,rdx
  803c5e:	48 c1 e0 08          	shl    rax,0x8
  803c62:	48 05 f0 84 40 00    	add    rax,0x4084f0
  803c68:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  803c6c:	0f b7 c0             	movzx  eax,ax
  803c6f:	c1 e0 10             	shl    eax,0x10
  803c72:	25 00 00 0f 00       	and    eax,0xf0000
  803c77:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    size+=c;
  803c7a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803c7d:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  803c80:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  803c83:	89 c1                	mov    ecx,eax
  803c85:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803c88:	48 63 d0             	movsxd rdx,eax
  803c8b:	48 89 d0             	mov    rax,rdx
  803c8e:	48 01 c0             	add    rax,rax
  803c91:	48 01 d0             	add    rax,rdx
  803c94:	48 c1 e0 08          	shl    rax,0x8
  803c98:	48 05 f4 84 40 00    	add    rax,0x4084f4
  803c9e:	66 89 08             	mov    WORD PTR [rax],cx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  803ca1:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803ca4:	48 63 d0             	movsxd rdx,eax
  803ca7:	48 89 d0             	mov    rax,rdx
  803caa:	48 01 c0             	add    rax,rax
  803cad:	48 01 d0             	add    rax,rdx
  803cb0:	48 c1 e0 08          	shl    rax,0x8
  803cb4:	48 05 f0 84 40 00    	add    rax,0x4084f0
  803cba:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  803cbe:	0f b7 c0             	movzx  eax,ax
  803cc1:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    tmp_attr&=0xfff0;
  803cc4:	81 65 b0 f0 ff 00 00 	and    DWORD PTR [rbp-0x50],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  803ccb:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  803cce:	c1 e8 10             	shr    eax,0x10
  803cd1:	83 e0 0f             	and    eax,0xf
  803cd4:	89 c2                	mov    edx,eax
  803cd6:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  803cd9:	01 d0                	add    eax,edx
  803cdb:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  803cde:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  803ce1:	89 c1                	mov    ecx,eax
  803ce3:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803ce6:	48 63 d0             	movsxd rdx,eax
  803ce9:	48 89 d0             	mov    rax,rdx
  803cec:	48 01 c0             	add    rax,rax
  803cef:	48 01 d0             	add    rax,rdx
  803cf2:	48 c1 e0 08          	shl    rax,0x8
  803cf6:	48 05 f0 84 40 00    	add    rax,0x4084f0
  803cfc:	66 89 48 09          	mov    WORD PTR [rax+0x9],cx
                    return ptr;//失败了，只能申请一部分的内存或者返回NULL
  803d00:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803d04:	e9 62 01 00 00       	jmp    803e6b <palloc+0x2f2>
                }
                int addr=get_phyaddr(new_pg);
  803d09:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  803d0c:	89 c7                	mov    edi,eax
  803d0e:	e8 24 d9 ff ff       	call   801637 <get_phyaddr>
  803d13:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
                set_page_item(tblp,addr,PAGE_PRESENT|\
  803d16:	8b 4d c4             	mov    ecx,DWORD PTR [rbp-0x3c]
  803d19:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803d1d:	ba 07 00 00 00       	mov    edx,0x7
  803d22:	89 ce                	mov    esi,ecx
  803d24:	48 89 c7             	mov    rdi,rax
  803d27:	e8 1e d9 ff ff       	call   80164a <set_page_item>
                PAGE_RWX|PAGE_FOR_ALL);
                int laddr=i*0x400000+j*0x1000;//线性地址
  803d2c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803d2f:	c1 e0 0a             	shl    eax,0xa
  803d32:	89 c2                	mov    edx,eax
  803d34:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  803d37:	01 d0                	add    eax,edx
  803d39:	c1 e0 0c             	shl    eax,0xc
  803d3c:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
                if(ptr==NULL)
  803d3f:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
  803d44:	75 09                	jne    803d4f <palloc+0x1d6>
                {
                   // ptr=laddr;
                    palloc_paddr=addr;
  803d46:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  803d49:	89 05 e5 07 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc107e5],eax        # 414534 <palloc_paddr>
                }
                page_c--;
  803d4f:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
                c++;
  803d53:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                if(page_c==0)
  803d57:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  803d5b:	0f 85 d9 00 00 00    	jne    803e3a <palloc+0x2c1>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  803d61:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803d64:	48 63 d0             	movsxd rdx,eax
  803d67:	48 89 d0             	mov    rax,rdx
  803d6a:	48 01 c0             	add    rax,rax
  803d6d:	48 01 d0             	add    rax,rdx
  803d70:	48 c1 e0 08          	shl    rax,0x8
  803d74:	48 05 f4 84 40 00    	add    rax,0x4084f4
  803d7a:	0f b7 00             	movzx  eax,WORD PTR [rax]
  803d7d:	0f b7 c0             	movzx  eax,ax
  803d80:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  803d83:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803d86:	48 63 d0             	movsxd rdx,eax
  803d89:	48 89 d0             	mov    rax,rdx
  803d8c:	48 01 c0             	add    rax,rax
  803d8f:	48 01 d0             	add    rax,rdx
  803d92:	48 c1 e0 08          	shl    rax,0x8
  803d96:	48 05 f0 84 40 00    	add    rax,0x4084f0
  803d9c:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  803da0:	0f b7 c0             	movzx  eax,ax
  803da3:	c1 e0 10             	shl    eax,0x10
  803da6:	25 00 00 0f 00       	and    eax,0xf0000
  803dab:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    size+=c;
  803dae:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803db1:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  803db4:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  803db7:	89 c1                	mov    ecx,eax
  803db9:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803dbc:	48 63 d0             	movsxd rdx,eax
  803dbf:	48 89 d0             	mov    rax,rdx
  803dc2:	48 01 c0             	add    rax,rax
  803dc5:	48 01 d0             	add    rax,rdx
  803dc8:	48 c1 e0 08          	shl    rax,0x8
  803dcc:	48 05 f4 84 40 00    	add    rax,0x4084f4
  803dd2:	66 89 08             	mov    WORD PTR [rax],cx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  803dd5:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803dd8:	48 63 d0             	movsxd rdx,eax
  803ddb:	48 89 d0             	mov    rax,rdx
  803dde:	48 01 c0             	add    rax,rax
  803de1:	48 01 d0             	add    rax,rdx
  803de4:	48 c1 e0 08          	shl    rax,0x8
  803de8:	48 05 f0 84 40 00    	add    rax,0x4084f0
  803dee:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  803df2:	0f b7 c0             	movzx  eax,ax
  803df5:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    tmp_attr&=0xfff0;
  803df8:	81 65 b8 f0 ff 00 00 	and    DWORD PTR [rbp-0x48],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  803dff:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  803e02:	c1 e8 10             	shr    eax,0x10
  803e05:	83 e0 0f             	and    eax,0xf
  803e08:	89 c2                	mov    edx,eax
  803e0a:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  803e0d:	01 d0                	add    eax,edx
  803e0f:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  803e12:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  803e15:	89 c1                	mov    ecx,eax
  803e17:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803e1a:	48 63 d0             	movsxd rdx,eax
  803e1d:	48 89 d0             	mov    rax,rdx
  803e20:	48 01 c0             	add    rax,rax
  803e23:	48 01 d0             	add    rax,rdx
  803e26:	48 c1 e0 08          	shl    rax,0x8
  803e2a:	48 05 f0 84 40 00    	add    rax,0x4084f0
  803e30:	66 89 48 09          	mov    WORD PTR [rax+0x9],cx
                    return ptr;
  803e34:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803e38:	eb 31                	jmp    803e6b <palloc+0x2f2>
                }
            }
            tblp++;
  803e3a:	48 83 45 e0 08       	add    QWORD PTR [rbp-0x20],0x8
        for(int j=0;j<1024;j++)
  803e3f:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  803e43:	81 7d dc ff 03 00 00 	cmp    DWORD PTR [rbp-0x24],0x3ff
  803e4a:	0f 8e af fd ff ff    	jle    803bff <palloc+0x86>
        }
        pgind++;
  803e50:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  803e55:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  803e59:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  803e60:	0f 8e 7d fd ff ff    	jle    803be3 <palloc+0x6a>
    }
    return NULL;
  803e66:	b8 00 00 00 00       	mov    eax,0x0
}
  803e6b:	c9                   	leave  
  803e6c:	c3                   	ret    

0000000000803e6d <malloc>:
//为当前进程申请新的内存，并返回这块内存的线性地址。
void* malloc(int size)
{
  803e6d:	f3 0f 1e fa          	endbr64 
  803e71:	55                   	push   rbp
  803e72:	48 89 e5             	mov    rbp,rsp
  803e75:	48 83 ec 10          	sub    rsp,0x10
  803e79:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return palloc(cur_proc,size);
  803e7c:	8b 05 aa 06 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc106aa]        # 41452c <cur_proc>
  803e82:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  803e85:	89 d6                	mov    esi,edx
  803e87:	89 c7                	mov    edi,eax
  803e89:	e8 eb fc ff ff       	call   803b79 <palloc>
}
  803e8e:	c9                   	leave  
  803e8f:	c3                   	ret    

0000000000803e90 <proc_end>:
void proc_end()
{
  803e90:	f3 0f 1e fa          	endbr64 
  803e94:	55                   	push   rbp
  803e95:	48 89 e5             	mov    rbp,rsp
  803e98:	48 83 ec 10          	sub    rsp,0x10
    int ret;
    asm volatile("mov %%eax,%0":"=m"(ret));
  803e9c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("proc #%d ended with retv %d.\n",cur_proc,ret);
    //切换堆栈
    //asm volatile("mov %0,%%rsp"::"r"(task[0].tss.esp));
    del_proc(cur_proc);
  803e9f:	8b 05 87 06 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10687]        # 41452c <cur_proc>
  803ea5:	89 c7                	mov    edi,eax
  803ea7:	e8 90 00 00 00       	call   803f3c <del_proc>
    if(task[cur_proc].parent_pid!=-1){
  803eac:	8b 05 7a 06 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1067a]        # 41452c <cur_proc>
  803eb2:	48 63 d0             	movsxd rdx,eax
  803eb5:	48 89 d0             	mov    rax,rdx
  803eb8:	48 01 c0             	add    rax,rax
  803ebb:	48 01 d0             	add    rax,rdx
  803ebe:	48 c1 e0 08          	shl    rax,0x8
  803ec2:	48 05 28 85 40 00    	add    rax,0x408528
  803ec8:	8b 00                	mov    eax,DWORD PTR [rax]
  803eca:	83 f8 ff             	cmp    eax,0xffffffff
  803ecd:	74 60                	je     803f2f <proc_end+0x9f>
        task[task[cur_proc].parent_pid].stat=READY;
  803ecf:	8b 05 57 06 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10657]        # 41452c <cur_proc>
  803ed5:	48 63 d0             	movsxd rdx,eax
  803ed8:	48 89 d0             	mov    rax,rdx
  803edb:	48 01 c0             	add    rax,rax
  803ede:	48 01 d0             	add    rax,rdx
  803ee1:	48 c1 e0 08          	shl    rax,0x8
  803ee5:	48 05 28 85 40 00    	add    rax,0x408528
  803eeb:	8b 00                	mov    eax,DWORD PTR [rax]
  803eed:	89 c2                	mov    edx,eax
  803eef:	48 89 d0             	mov    rax,rdx
  803ef2:	48 01 c0             	add    rax,rax
  803ef5:	48 01 d0             	add    rax,rdx
  803ef8:	48 c1 e0 08          	shl    rax,0x8
  803efc:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803f02:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        switch_proc_tss(task[cur_proc].parent_pid);
  803f08:	8b 05 1e 06 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1061e]        # 41452c <cur_proc>
  803f0e:	48 63 d0             	movsxd rdx,eax
  803f11:	48 89 d0             	mov    rax,rdx
  803f14:	48 01 c0             	add    rax,rax
  803f17:	48 01 d0             	add    rax,rdx
  803f1a:	48 c1 e0 08          	shl    rax,0x8
  803f1e:	48 05 28 85 40 00    	add    rax,0x408528
  803f24:	8b 00                	mov    eax,DWORD PTR [rax]
  803f26:	89 c7                	mov    edi,eax
  803f28:	e8 3f fb ff ff       	call   803a6c <switch_proc_tss>
    }
    else
        switch_proc_tss(0);
    //syscall(SYSCALL_DEL_PROC,cur_proc,0,0,0,0);
}
  803f2d:	eb 0a                	jmp    803f39 <proc_end+0xa9>
        switch_proc_tss(0);
  803f2f:	bf 00 00 00 00       	mov    edi,0x0
  803f34:	e8 33 fb ff ff       	call   803a6c <switch_proc_tss>
}
  803f39:	90                   	nop
  803f3a:	c9                   	leave  
  803f3b:	c3                   	ret    

0000000000803f3c <del_proc>:
void del_proc(int pnr)
{
  803f3c:	f3 0f 1e fa          	endbr64 
  803f40:	55                   	push   rbp
  803f41:	48 89 e5             	mov    rbp,rsp
  803f44:	48 83 ec 30          	sub    rsp,0x30
  803f48:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
    task[pnr].stat=ENDED;
  803f4b:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  803f4e:	48 63 d0             	movsxd rdx,eax
  803f51:	48 89 d0             	mov    rax,rdx
  803f54:	48 01 c0             	add    rax,rax
  803f57:	48 01 d0             	add    rax,rdx
  803f5a:	48 c1 e0 08          	shl    rax,0x8
  803f5e:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803f64:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[pnr].pid=-1;
  803f6a:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  803f6d:	48 63 d0             	movsxd rdx,eax
  803f70:	48 89 d0             	mov    rax,rdx
  803f73:	48 01 c0             	add    rax,rax
  803f76:	48 01 d0             	add    rax,rdx
  803f79:	48 c1 e0 08          	shl    rax,0x8
  803f7d:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803f83:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    //释放申请的页面
    page_item *p;//task[pnr].tss.cr3;
    p++;
  803f89:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
    for(;(*p&PAGE_PRESENT)!=0;p++)
  803f8e:	eb 63                	jmp    803ff3 <del_proc+0xb7>
    {
        page_item *tp=*p&0xfffff000;
  803f90:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f94:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803f97:	25 00 f0 ff ff       	and    eax,0xfffff000
  803f9c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<1024;i++)
  803fa0:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  803fa7:	eb 30                	jmp    803fd9 <del_proc+0x9d>
        {
            unsigned int present=*tp&PAGE_PRESENT;
  803fa9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803fad:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803fb0:	83 e0 01             	and    eax,0x1
  803fb3:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            if(present)
  803fb6:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  803fba:	74 14                	je     803fd0 <del_proc+0x94>
            {
                free_page(*tp&0xfffff000);
  803fbc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803fc0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803fc3:	25 00 f0 ff ff       	and    eax,0xfffff000
  803fc8:	48 89 c7             	mov    rdi,rax
  803fcb:	e8 89 d5 ff ff       	call   801559 <free_page>
                //printf("freed page at %x.\n",*tp&0xfffff000);
            }
            tp++;
  803fd0:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
        for(int i=0;i<1024;i++)
  803fd5:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  803fd9:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  803fe0:	7e c7                	jle    803fa9 <del_proc+0x6d>
        }
        vmfree(tp);
  803fe2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803fe6:	48 89 c7             	mov    rdi,rax
  803fe9:	e8 96 d1 ff ff       	call   801184 <vmfree>
    for(;(*p&PAGE_PRESENT)!=0;p++)
  803fee:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
  803ff3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ff7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803ffa:	83 e0 01             	and    eax,0x1
  803ffd:	48 85 c0             	test   rax,rax
  804000:	75 8e                	jne    803f90 <del_proc+0x54>
    }
    //释放存放页目录的页面
    vmfree(p);
  804002:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804006:	48 89 c7             	mov    rdi,rax
  804009:	e8 76 d1 ff ff       	call   801184 <vmfree>
    //从进程中解除cr3,tss和ldt
    //switch_proc_tss(task[pnr]);
}
  80400e:	90                   	nop
  80400f:	c9                   	leave  
  804010:	c3                   	ret    

0000000000804011 <set_proc_stat>:

int set_proc_stat(int pid,int stat)
{
  804011:	f3 0f 1e fa          	endbr64 
  804015:	55                   	push   rbp
  804016:	48 89 e5             	mov    rbp,rsp
  804019:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80401c:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==-1)return -1;
  80401f:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  804023:	75 0a                	jne    80402f <set_proc_stat+0x1e>
  804025:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80402a:	e9 8c 00 00 00       	jmp    8040bb <set_proc_stat+0xaa>
    int i=0;
  80402f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;task[i].pid!=pid;i++);
  804036:	eb 04                	jmp    80403c <set_proc_stat+0x2b>
  804038:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80403c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80403f:	48 63 d0             	movsxd rdx,eax
  804042:	48 89 d0             	mov    rax,rdx
  804045:	48 01 c0             	add    rax,rax
  804048:	48 01 d0             	add    rax,rdx
  80404b:	48 c1 e0 08          	shl    rax,0x8
  80404f:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804055:	8b 10                	mov    edx,DWORD PTR [rax]
  804057:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80405a:	39 c2                	cmp    edx,eax
  80405c:	75 da                	jne    804038 <set_proc_stat+0x27>
    if(i==MAX_PROC_COUNT)return -1;
  80405e:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  804062:	75 07                	jne    80406b <set_proc_stat+0x5a>
  804064:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804069:	eb 50                	jmp    8040bb <set_proc_stat+0xaa>
    task[i].stat=stat;
  80406b:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80406e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804071:	48 63 c8             	movsxd rcx,eax
  804074:	48 89 c8             	mov    rax,rcx
  804077:	48 01 c0             	add    rax,rax
  80407a:	48 01 c8             	add    rax,rcx
  80407d:	48 c1 e0 08          	shl    rax,0x8
  804081:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804087:	89 10                	mov    DWORD PTR [rax],edx
    //如果这就是正在运行的进程，那么马上停止
    if(cur_proc==i)
  804089:	8b 05 9d 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1049d]        # 41452c <cur_proc>
  80408f:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  804092:	75 22                	jne    8040b6 <set_proc_stat+0xa5>
        task[cur_proc].utime=MAX_UTIME;
  804094:	8b 05 92 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10492]        # 41452c <cur_proc>
  80409a:	48 63 d0             	movsxd rdx,eax
  80409d:	48 89 d0             	mov    rax,rdx
  8040a0:	48 01 c0             	add    rax,rax
  8040a3:	48 01 d0             	add    rax,rdx
  8040a6:	48 c1 e0 08          	shl    rax,0x8
  8040aa:	48 05 a8 84 40 00    	add    rax,0x4084a8
  8040b0:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    return 0;
  8040b6:	b8 00 00 00 00       	mov    eax,0x0
}
  8040bb:	5d                   	pop    rbp
  8040bc:	c3                   	ret    

00000000008040bd <add_proc_openf>:

    return 0;
} */

int add_proc_openf(struct index_node *entry)
{
  8040bd:	f3 0f 1e fa          	endbr64 
  8040c1:	55                   	push   rbp
  8040c2:	48 89 e5             	mov    rbp,rsp
  8040c5:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_PROC_OPENF;i++){
  8040c9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8040d0:	eb 6a                	jmp    80413c <add_proc_openf+0x7f>
        if(task[cur_proc].openf[i]==NULL)
  8040d2:	8b 05 54 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10454]        # 41452c <cur_proc>
  8040d8:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8040db:	48 63 ca             	movsxd rcx,edx
  8040de:	48 63 d0             	movsxd rdx,eax
  8040e1:	48 89 d0             	mov    rax,rdx
  8040e4:	48 01 c0             	add    rax,rax
  8040e7:	48 01 d0             	add    rax,rdx
  8040ea:	48 c1 e0 05          	shl    rax,0x5
  8040ee:	48 01 c8             	add    rax,rcx
  8040f1:	48 83 c0 18          	add    rax,0x18
  8040f5:	48 8b 04 c5 a4 84 40 	mov    rax,QWORD PTR [rax*8+0x4084a4]
  8040fc:	00 
  8040fd:	48 85 c0             	test   rax,rax
  804100:	75 36                	jne    804138 <add_proc_openf+0x7b>
        {
            task[cur_proc].openf[i]=entry;
  804102:	8b 05 24 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10424]        # 41452c <cur_proc>
  804108:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80410b:	48 63 ca             	movsxd rcx,edx
  80410e:	48 63 d0             	movsxd rdx,eax
  804111:	48 89 d0             	mov    rax,rdx
  804114:	48 01 c0             	add    rax,rax
  804117:	48 01 d0             	add    rax,rdx
  80411a:	48 c1 e0 05          	shl    rax,0x5
  80411e:	48 01 c8             	add    rax,rcx
  804121:	48 8d 50 18          	lea    rdx,[rax+0x18]
  804125:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804129:	48 89 04 d5 a4 84 40 	mov    QWORD PTR [rdx*8+0x4084a4],rax
  804130:	00 
            return 0;
  804131:	b8 00 00 00 00       	mov    eax,0x0
  804136:	eb 0f                	jmp    804147 <add_proc_openf+0x8a>
    for(int i=0;i<MAX_PROC_OPENF;i++){
  804138:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80413c:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  804140:	7e 90                	jle    8040d2 <add_proc_openf+0x15>
        }
    }
    return -1;//full
  804142:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  804147:	5d                   	pop    rbp
  804148:	c3                   	ret    

0000000000804149 <sys_exit>:
/*
 * 进程结束。
 * */
int sys_exit(int code)
{
  804149:	f3 0f 1e fa          	endbr64 
  80414d:	55                   	push   rbp
  80414e:	48 89 e5             	mov    rbp,rsp
  804151:	48 83 ec 10          	sub    rsp,0x10
  804155:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    del_proc(cur_proc);
  804158:	8b 05 ce 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc103ce]        # 41452c <cur_proc>
  80415e:	89 c7                	mov    edi,eax
  804160:	e8 d7 fd ff ff       	call   803f3c <del_proc>
    return code;
  804165:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  804168:	c9                   	leave  
  804169:	c3                   	ret    

000000000080416a <reg_proc>:
    dllmain(NULL,0,NULL);
    
}*/

int reg_proc(int entry, struct index_node *cwd, struct index_node *exef)
{
  80416a:	f3 0f 1e fa          	endbr64 
  80416e:	55                   	push   rbp
  80416f:	48 89 e5             	mov    rbp,rsp
  804172:	48 83 ec 40          	sub    rsp,0x40
  804176:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  804179:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  80417d:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
    
    int i=req_proc();
  804181:	b8 00 00 00 00       	mov    eax,0x0
  804186:	e8 9c f4 ff ff       	call   803627 <req_proc>
  80418b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(i==-1)return -1;
  80418e:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  804192:	75 0a                	jne    80419e <reg_proc+0x34>
  804194:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804199:	e9 65 01 00 00       	jmp    804303 <reg_proc+0x199>
    /*set_proc(0,0,0,0,SEL_LDT_DATA,SEL_LDT_CODE,SEL_LDT_STACK,SEL_LDT_DATA\
    ,SEL_LDT_DATA,SEL_LDT_DATA,0x1c00000-4,0,0,0,0,i);*/
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10\
  80419e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8041a1:	50                   	push   rax
  8041a2:	6a 00                	push   0x0
  8041a4:	6a 00                	push   0x0
  8041a6:	6a 00                	push   0x0
  8041a8:	6a 00                	push   0x0
  8041aa:	6a 00                	push   0x0
  8041ac:	68 fc ff bf 01       	push   0x1bffffc
  8041b1:	6a 10                	push   0x10
  8041b3:	6a 10                	push   0x10
  8041b5:	6a 10                	push   0x10
  8041b7:	6a 10                	push   0x10
  8041b9:	41 b9 08 00 00 00    	mov    r9d,0x8
  8041bf:	41 b8 10 00 00 00    	mov    r8d,0x10
  8041c5:	b9 00 00 00 00       	mov    ecx,0x0
  8041ca:	ba 00 00 00 00       	mov    edx,0x0
  8041cf:	be 00 00 00 00       	mov    esi,0x0
  8041d4:	bf 00 00 00 00       	mov    edi,0x0
  8041d9:	e8 42 f5 ff ff       	call   803720 <set_proc>
  8041de:	48 83 c4 58          	add    rsp,0x58
, 0x10, 0x10, 0x1c00000 - 4, 0, 0, 0, 0, 0, i);
    task[i].pml4=vmalloc();
  8041e2:	b8 00 00 00 00       	mov    eax,0x0
  8041e7:	e8 09 cf ff ff       	call   8010f5 <vmalloc>
  8041ec:	48 89 c1             	mov    rcx,rax
  8041ef:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8041f2:	48 63 d0             	movsxd rdx,eax
  8041f5:	48 89 d0             	mov    rax,rdx
  8041f8:	48 01 c0             	add    rax,rax
  8041fb:	48 01 d0             	add    rax,rdx
  8041fe:	48 c1 e0 08          	shl    rax,0x8
  804202:	48 05 40 85 40 00    	add    rax,0x408540
  804208:	48 89 48 0c          	mov    QWORD PTR [rax+0xc],rcx
    int *pt=vmalloc();
  80420c:	b8 00 00 00 00       	mov    eax,0x0
  804211:	e8 df ce ff ff       	call   8010f5 <vmalloc>
  804216:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    task[i].pml4[0]=PAGE_TABLE_ADDR|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;
  80421a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80421d:	48 63 d0             	movsxd rdx,eax
  804220:	48 89 d0             	mov    rax,rdx
  804223:	48 01 c0             	add    rax,rax
  804226:	48 01 d0             	add    rax,rdx
  804229:	48 c1 e0 08          	shl    rax,0x8
  80422d:	48 05 40 85 40 00    	add    rax,0x408540
  804233:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804237:	48 c7 00 07 20 00 00 	mov    QWORD PTR [rax],0x2007
    /*for(int j=0;j<32;j++)
        pt[j]=(PAGE_TABLE_ADDR+j*0x1000)|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;//复制内核页表*/
    //PAGE_TABLE_ADDR|PAGE_PRESENT;//复制内核页表
    //task[i].pml4[7]=PAGE_TABLE_ADDR+7*0x1000|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//sys.dll
    int *stackb=vmalloc();
  80423e:	b8 00 00 00 00       	mov    eax,0x0
  804243:	e8 ad ce ff ff       	call   8010f5 <vmalloc>
  804248:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    task[i].pml4[6]=(int)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  80424c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804250:	83 c8 07             	or     eax,0x7
  804253:	89 c1                	mov    ecx,eax
  804255:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804258:	48 63 d0             	movsxd rdx,eax
  80425b:	48 89 d0             	mov    rax,rdx
  80425e:	48 01 c0             	add    rax,rax
  804261:	48 01 d0             	add    rax,rdx
  804264:	48 c1 e0 08          	shl    rax,0x8
  804268:	48 05 40 85 40 00    	add    rax,0x408540
  80426e:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804272:	48 8d 50 30          	lea    rdx,[rax+0x30]
  804276:	48 63 c1             	movsxd rax,ecx
  804279:	48 89 02             	mov    QWORD PTR [rdx],rax
    stackb[1023]=get_phyaddr(req_a_page())|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  80427c:	b8 00 00 00 00       	mov    eax,0x0
  804281:	e8 03 d2 ff ff       	call   801489 <req_a_page>
  804286:	89 c7                	mov    edi,eax
  804288:	e8 aa d3 ff ff       	call   801637 <get_phyaddr>
  80428d:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804291:	48 81 c2 fc 0f 00 00 	add    rdx,0xffc
  804298:	83 c8 07             	or     eax,0x7
  80429b:	89 02                	mov    DWORD PTR [rdx],eax
//    task[i].tss.cr3=task[i].pml4;

    task[i].stat=READY;
  80429d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8042a0:	48 63 d0             	movsxd rdx,eax
  8042a3:	48 89 d0             	mov    rax,rdx
  8042a6:	48 01 c0             	add    rax,rax
  8042a9:	48 01 d0             	add    rax,rdx
  8042ac:	48 c1 e0 08          	shl    rax,0x8
  8042b0:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8042b6:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[i].cwd=cwd;
  8042bc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8042bf:	48 63 d0             	movsxd rdx,eax
  8042c2:	48 89 d0             	mov    rax,rdx
  8042c5:	48 01 c0             	add    rax,rax
  8042c8:	48 01 d0             	add    rax,rdx
  8042cb:	48 c1 e0 08          	shl    rax,0x8
  8042cf:	48 8d 90 50 85 40 00 	lea    rdx,[rax+0x408550]
  8042d6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8042da:	48 89 42 04          	mov    QWORD PTR [rdx+0x4],rax
    task[i].exef=exef;
  8042de:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8042e1:	48 63 d0             	movsxd rdx,eax
  8042e4:	48 89 d0             	mov    rax,rdx
  8042e7:	48 01 c0             	add    rax,rax
  8042ea:	48 01 d0             	add    rax,rdx
  8042ed:	48 c1 e0 08          	shl    rax,0x8
  8042f1:	48 8d 90 50 85 40 00 	lea    rdx,[rax+0x408550]
  8042f8:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8042fc:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
    task[i].tss.ss=0x10;
    task[i].tss.gs=0x10;
    task[i].tss.fs=0x10;
    task[i].tss.cs=0x8;*/
//    task[i].tss.eip=entry;
    return i;
  804300:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    proc_ret_stack *pstack=stack_paddr+stack_size-12;
    pstack->argc=0;
    pstack->argv=0;
    pstack->proc_end_addr=proc_end;
    int *pptr=pstack;*/
}
  804303:	c9                   	leave  
  804304:	c3                   	ret    

0000000000804305 <sys_malloc>:

void * sys_malloc(int size)
{
  804305:	f3 0f 1e fa          	endbr64 
  804309:	55                   	push   rbp
  80430a:	48 89 e5             	mov    rbp,rsp
  80430d:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    //
    int n=size/CHUNK_SIZE+size%CHUNK_SIZE?1:0;
  804310:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804313:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  804319:	85 c0                	test   eax,eax
  80431b:	0f 48 c2             	cmovs  eax,edx
  80431e:	c1 f8 0c             	sar    eax,0xc
  804321:	89 c1                	mov    ecx,eax
  804323:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804326:	99                   	cdq    
  804327:	c1 ea 14             	shr    edx,0x14
  80432a:	01 d0                	add    eax,edx
  80432c:	25 ff 0f 00 00       	and    eax,0xfff
  804331:	29 d0                	sub    eax,edx
  804333:	01 c8                	add    eax,ecx
  804335:	85 c0                	test   eax,eax
  804337:	0f 95 c0             	setne  al
  80433a:	0f b6 c0             	movzx  eax,al
  80433d:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    chunk_header *hp=(chunk_header*)task[cur_proc].mem_struct.heap_base;
  804340:	8b 05 e6 01 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc101e6]        # 41452c <cur_proc>
  804346:	48 63 d0             	movsxd rdx,eax
  804349:	48 89 d0             	mov    rax,rdx
  80434c:	48 01 c0             	add    rax,rax
  80434f:	48 01 d0             	add    rax,rdx
  804352:	48 c1 e0 08          	shl    rax,0x8
  804356:	48 05 b4 84 40 00    	add    rax,0x4084b4
  80435c:	8b 00                	mov    eax,DWORD PTR [rax]
  80435e:	48 98                	cdqe   
  804360:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804364:	eb 0c                	jmp    804372 <sys_malloc+0x6d>
        hp=hp->next;
  804366:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80436a:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80436e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804372:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804376:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80437a:	48 85 c0             	test   rax,rax
  80437d:	74 16                	je     804395 <sys_malloc+0x90>
  80437f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804383:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804386:	85 c0                	test   eax,eax
  804388:	75 0b                	jne    804395 <sys_malloc+0x90>
  80438a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80438e:	8b 00                	mov    eax,DWORD PTR [rax]
  804390:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804393:	7e d1                	jle    804366 <sys_malloc+0x61>
    if(hp->pgn<n)
  804395:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804399:	8b 00                	mov    eax,DWORD PTR [rax]
  80439b:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  80439e:	0f 8e 8d 00 00 00    	jle    804431 <sys_malloc+0x12c>
    {
        //上抬heap top
        if(task[cur_proc].mem_struct.heap_top+CHUNK_SIZE*n>=HEAP_MAXTOP)
  8043a4:	8b 05 82 01 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10182]        # 41452c <cur_proc>
  8043aa:	48 63 d0             	movsxd rdx,eax
  8043ad:	48 89 d0             	mov    rax,rdx
  8043b0:	48 01 c0             	add    rax,rax
  8043b3:	48 01 d0             	add    rax,rdx
  8043b6:	48 c1 e0 08          	shl    rax,0x8
  8043ba:	48 05 b8 84 40 00    	add    rax,0x4084b8
  8043c0:	8b 10                	mov    edx,DWORD PTR [rax]
  8043c2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8043c5:	c1 e0 0c             	shl    eax,0xc
  8043c8:	01 d0                	add    eax,edx
  8043ca:	3d ff ff ef 01       	cmp    eax,0x1efffff
  8043cf:	7e 0a                	jle    8043db <sys_malloc+0xd6>
        {
            //超过顶部
            return NULL;
  8043d1:	b8 00 00 00 00       	mov    eax,0x0
  8043d6:	e9 cf 00 00 00       	jmp    8044aa <sys_malloc+0x1a5>
        }
        int needed=n-hp->pgn;
  8043db:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8043df:	8b 10                	mov    edx,DWORD PTR [rax]
  8043e1:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8043e4:	29 d0                	sub    eax,edx
  8043e6:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
        char* p=task[cur_proc].mem_struct.heap_top;
  8043e9:	8b 05 3d 01 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1013d]        # 41452c <cur_proc>
  8043ef:	48 63 d0             	movsxd rdx,eax
  8043f2:	48 89 d0             	mov    rax,rdx
  8043f5:	48 01 c0             	add    rax,rax
  8043f8:	48 01 d0             	add    rax,rdx
  8043fb:	48 c1 e0 08          	shl    rax,0x8
  8043ff:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804405:	8b 00                	mov    eax,DWORD PTR [rax]
  804407:	48 98                	cdqe   
  804409:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  80440d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804414:	eb 13                	jmp    804429 <sys_malloc+0x124>
        {
            *p=0;//触发缺页中断
  804416:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80441a:	c6 00 00             	mov    BYTE PTR [rax],0x0
            p+=PAGE_SIZE;
  80441d:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  804424:	00 
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804425:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804429:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80442c:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80442f:	7c e5                	jl     804416 <sys_malloc+0x111>
        }
    }
    if(hp->pgn>n)
  804431:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804435:	8b 00                	mov    eax,DWORD PTR [rax]
  804437:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  80443a:	7d 59                	jge    804495 <sys_malloc+0x190>
    {
        //在后面新建一个头
        char *p=hp;
  80443c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804440:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        p+=(n+1)*CHUNK_SIZE;//算上存储头一个
  804444:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804447:	83 c0 01             	add    eax,0x1
  80444a:	c1 e0 0c             	shl    eax,0xc
  80444d:	48 98                	cdqe   
  80444f:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
        chunk_header *np=p;
  804453:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804457:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
        np->pgn=hp->pgn-n-1;
  80445b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80445f:	8b 00                	mov    eax,DWORD PTR [rax]
  804461:	2b 45 e8             	sub    eax,DWORD PTR [rbp-0x18]
  804464:	8d 50 ff             	lea    edx,[rax-0x1]
  804467:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80446b:	89 10                	mov    DWORD PTR [rax],edx
        np->next=hp->next;
  80446d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804471:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  804475:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804479:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
        np->prev=hp;
  80447d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804481:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804485:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
        hp->next=np;
  804489:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80448d:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804491:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    }
    hp->alloc=1;//分配完毕
  804495:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804499:	c7 40 04 01 00 00 00 	mov    DWORD PTR [rax+0x4],0x1
    return (char*)hp+CHUNK_SIZE;//返回后边的第一个数据块地址
  8044a0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8044a4:	48 05 00 10 00 00    	add    rax,0x1000
}
  8044aa:	5d                   	pop    rbp
  8044ab:	c3                   	ret    

00000000008044ac <sys_free>:
int sys_free(int ptr)
{
  8044ac:	f3 0f 1e fa          	endbr64 
  8044b0:	55                   	push   rbp
  8044b1:	48 89 e5             	mov    rbp,rsp
  8044b4:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    chunk_header *hp=ptr-CHUNK_SIZE;//回退到头
  8044b7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8044ba:	2d 00 10 00 00       	sub    eax,0x1000
  8044bf:	48 98                	cdqe   
  8044c1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    hp->alloc=0;
  8044c5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8044c9:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
    //合并
    //向后合并
    chunk_header *p=hp->next;
  8044d0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8044d4:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8044d8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  8044dc:	eb 2e                	jmp    80450c <sys_free+0x60>
    {
        if(p->alloc==0)
  8044de:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8044e2:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8044e5:	85 c0                	test   eax,eax
  8044e7:	75 2c                	jne    804515 <sys_free+0x69>
        {
            hp->pgn+=p->pgn+1;//把区域合并
  8044e9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8044ed:	8b 10                	mov    edx,DWORD PTR [rax]
  8044ef:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8044f3:	8b 00                	mov    eax,DWORD PTR [rax]
  8044f5:	83 c0 01             	add    eax,0x1
  8044f8:	01 c2                	add    edx,eax
  8044fa:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8044fe:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->next;
  804500:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804504:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804508:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  80450c:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804511:	75 cb                	jne    8044de <sys_free+0x32>
  804513:	eb 01                	jmp    804516 <sys_free+0x6a>
            break;
  804515:	90                   	nop
    }
    //向前合并
    p=hp->prev;
  804516:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80451a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80451e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804522:	eb 2e                	jmp    804552 <sys_free+0xa6>
    {
        if(p->alloc==0)
  804524:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804528:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80452b:	85 c0                	test   eax,eax
  80452d:	75 2c                	jne    80455b <sys_free+0xaf>
        {
            p->pgn+=hp->pgn+1;//把区域合并
  80452f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804533:	8b 10                	mov    edx,DWORD PTR [rax]
  804535:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804539:	8b 00                	mov    eax,DWORD PTR [rax]
  80453b:	83 c0 01             	add    eax,0x1
  80453e:	01 c2                	add    edx,eax
  804540:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804544:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->prev;
  804546:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80454a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80454e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804552:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804557:	75 cb                	jne    804524 <sys_free+0x78>
  804559:	eb 01                	jmp    80455c <sys_free+0xb0>
            break;
  80455b:	90                   	nop
    }
    //合并完成
    return 0;
  80455c:	b8 00 00 00 00       	mov    eax,0x0
}
  804561:	5d                   	pop    rbp
  804562:	c3                   	ret    

0000000000804563 <switch_to>:

void switch_to(struct process *from, struct process *to) {
  804563:	f3 0f 1e fa          	endbr64 
  804567:	55                   	push   rbp
  804568:	48 89 e5             	mov    rbp,rsp
  80456b:	53                   	push   rbx
  80456c:	48 89 7d f0          	mov    QWORD PTR [rbp-0x10],rdi
  804570:	48 89 75 e8          	mov    QWORD PTR [rbp-0x18],rsi
    cur_proc=to-task;
  804574:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804578:	48 2d a0 84 40 00    	sub    rax,0x4084a0
  80457e:	48 c1 f8 08          	sar    rax,0x8
  804582:	48 89 c2             	mov    rdx,rax
  804585:	48 b8 ab aa aa aa aa 	movabs rax,0xaaaaaaaaaaaaaaab
  80458c:	aa aa aa 
  80458f:	48 0f af c2          	imul   rax,rdx
  804593:	89 05 93 ff c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0ff93],eax        # 41452c <cur_proc>
    current=&task[cur_proc];
  804599:	8b 05 8d ff c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ff8d]        # 41452c <cur_proc>
  80459f:	48 63 d0             	movsxd rdx,eax
  8045a2:	48 89 d0             	mov    rax,rdx
  8045a5:	48 01 c0             	add    rax,rax
  8045a8:	48 01 d0             	add    rax,rdx
  8045ab:	48 c1 e0 08          	shl    rax,0x8
  8045af:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8045b5:	48 89 05 e4 fe c0 ff 	mov    QWORD PTR [rip+0xffffffffffc0fee4],rax        # 4144a0 <current>
    asm volatile("mov %%rsp,%0\r\n"
  8045bc:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  8045c0:	4c 8b 55 f0          	mov    r10,QWORD PTR [rbp-0x10]
  8045c4:	4c 8b 5d f0          	mov    r11,QWORD PTR [rbp-0x10]
  8045c8:	48 8b 5d f0          	mov    rbx,QWORD PTR [rbp-0x10]
  8045cc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8045d0:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8045d4:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  8045d8:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  8045dc:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  8045e0:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  8045e4:	49 89 a1 68 02 00 00 	mov    QWORD PTR [r9+0x268],rsp
  8045eb:	48 8d 05 24 00 00 00 	lea    rax,[rip+0x24]        # 804616 <done>
  8045f2:	49 89 82 38 02 00 00 	mov    QWORD PTR [r10+0x238],rax
  8045f9:	41 8c a3 a8 02 00 00 	mov    WORD PTR [r11+0x2a8],fs
  804600:	8c ab b0 02 00 00    	mov    WORD PTR [rbx+0x2b0],gs
  804606:	48 8b a1 68 02 00 00 	mov    rsp,QWORD PTR [rcx+0x268]
  80460d:	41 ff b0 38 02 00 00 	push   QWORD PTR [r8+0x238]
  804614:	eb 08                	jmp    80461e <__switch_to>

0000000000804616 <done>:
  804616:	90                   	nop
                 "nop":"=m"(from->regs.rsp),"=m"(from->regs.rip),
                 "=m"(from->regs.fs),"=m"(from->regs.gs):
                "m"(to->regs.fs),"m"(to->regs.gs),"m"(to->regs.rsp),"m"(to->regs.rip),
                "D"(from),"S"(to));

}
  804617:	90                   	nop
  804618:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80461c:	c9                   	leave  
  80461d:	c3                   	ret    

000000000080461e <__switch_to>:
void __switch_to(struct process *from, struct process *to) {
  80461e:	f3 0f 1e fa          	endbr64 
  804622:	55                   	push   rbp
  804623:	48 89 e5             	mov    rbp,rsp
  804626:	53                   	push   rbx
  804627:	48 83 ec 18          	sub    rsp,0x18
  80462b:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80462f:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804633:	48 8b 05 06 6c 00 00 	mov    rax,QWORD PTR [rip+0x6c06]        # 80b240 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  80463a:	4c 8b 50 54          	mov    r10,QWORD PTR [rax+0x54]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  80463e:	48 8b 05 fb 6b 00 00 	mov    rax,QWORD PTR [rip+0x6bfb]        # 80b240 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804645:	4c 8b 48 4c          	mov    r9,QWORD PTR [rax+0x4c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804649:	48 8b 05 f0 6b 00 00 	mov    rax,QWORD PTR [rip+0x6bf0]        # 80b240 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804650:	4c 8b 40 44          	mov    r8,QWORD PTR [rax+0x44]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804654:	48 8b 05 e5 6b 00 00 	mov    rax,QWORD PTR [rip+0x6be5]        # 80b240 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  80465b:	48 8b 78 3c          	mov    rdi,QWORD PTR [rax+0x3c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  80465f:	48 8b 05 da 6b 00 00 	mov    rax,QWORD PTR [rip+0x6bda]        # 80b240 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804666:	48 8b 58 34          	mov    rbx,QWORD PTR [rax+0x34]
  80466a:	48 8b 05 cf 6b 00 00 	mov    rax,QWORD PTR [rip+0x6bcf]        # 80b240 <tss>
  804671:	4c 8b 58 2c          	mov    r11,QWORD PTR [rax+0x2c]
  804675:	48 8b 05 c4 6b 00 00 	mov    rax,QWORD PTR [rip+0x6bc4]        # 80b240 <tss>
  80467c:	48 8b 48 24          	mov    rcx,QWORD PTR [rax+0x24]
  804680:	48 8b 05 b9 6b 00 00 	mov    rax,QWORD PTR [rip+0x6bb9]        # 80b240 <tss>
  804687:	48 8b 50 14          	mov    rdx,QWORD PTR [rax+0x14]
  80468b:	48 8b 05 ae 6b 00 00 	mov    rax,QWORD PTR [rip+0x6bae]        # 80b240 <tss>
  804692:	48 8b 70 0c          	mov    rsi,QWORD PTR [rax+0xc]
  804696:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80469a:	48 8b 80 c8 01 00 00 	mov    rax,QWORD PTR [rax+0x1c8]
  8046a1:	41 52                	push   r10
  8046a3:	41 51                	push   r9
  8046a5:	41 50                	push   r8
  8046a7:	57                   	push   rdi
  8046a8:	49 89 d9             	mov    r9,rbx
  8046ab:	4d 89 d8             	mov    r8,r11
  8046ae:	48 89 c7             	mov    rdi,rax
  8046b1:	e8 33 00 00 00       	call   8046e9 <set_tss>
  8046b6:	48 83 c4 20          	add    rsp,0x20
    asm volatile("mov %%fs,%0\r\n"
  8046ba:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8046be:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  8046c2:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8046c6:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  8046ca:	8c a0 a8 02 00 00    	mov    WORD PTR [rax+0x2a8],fs
  8046d0:	8c ae b0 02 00 00    	mov    WORD PTR [rsi+0x2b0],gs
  8046d6:	8e a2 a8 02 00 00    	mov    fs,WORD PTR [rdx+0x2a8]
  8046dc:	8e a9 b0 02 00 00    	mov    gs,WORD PTR [rcx+0x2b0]
                 "mov %%gs,%1\r\n"
                 "mov %2,%%fs\r\n"
                 "mov %3,%%gs":"=m"(to->regs.fs),"=m"(to->regs.gs):
                 "m"(from->regs.fs),"m"(from->regs.gs));
}
  8046e2:	90                   	nop
  8046e3:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8046e7:	c9                   	leave  
  8046e8:	c3                   	ret    

00000000008046e9 <set_tss>:

void set_tss(u64 rsp0,u64 rsp1,u64 rsp2,u64 ist0,u64 ist1,u64 ist2,u64 ist3,u64 ist4,u64 ist5,u64 ist6){
  8046e9:	f3 0f 1e fa          	endbr64 
  8046ed:	55                   	push   rbp
  8046ee:	48 89 e5             	mov    rbp,rsp
  8046f1:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8046f5:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8046f9:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  8046fd:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  804701:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
  804705:	4c 89 4d d0          	mov    QWORD PTR [rbp-0x30],r9
    tss->rsp0=rsp0;
  804709:	48 8b 05 30 6b 00 00 	mov    rax,QWORD PTR [rip+0x6b30]        # 80b240 <tss>
  804710:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804714:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx
    tss->rsp1=rsp1;
  804718:	48 8b 05 21 6b 00 00 	mov    rax,QWORD PTR [rip+0x6b21]        # 80b240 <tss>
  80471f:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  804723:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    tss->rsp2=rsp2;
  804727:	48 8b 05 12 6b 00 00 	mov    rax,QWORD PTR [rip+0x6b12]        # 80b240 <tss>
  80472e:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804732:	48 89 50 14          	mov    QWORD PTR [rax+0x14],rdx
    tss->ists[0]=ist0;
  804736:	48 8b 05 03 6b 00 00 	mov    rax,QWORD PTR [rip+0x6b03]        # 80b240 <tss>
  80473d:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  804741:	48 89 50 24          	mov    QWORD PTR [rax+0x24],rdx
    tss->ists[1]=ist1;
  804745:	48 8b 05 f4 6a 00 00 	mov    rax,QWORD PTR [rip+0x6af4]        # 80b240 <tss>
  80474c:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  804750:	48 89 50 2c          	mov    QWORD PTR [rax+0x2c],rdx
    tss->ists[2]=ist2;
  804754:	48 8b 05 e5 6a 00 00 	mov    rax,QWORD PTR [rip+0x6ae5]        # 80b240 <tss>
  80475b:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80475f:	48 89 50 34          	mov    QWORD PTR [rax+0x34],rdx
    tss->ists[3]=ist3;
  804763:	48 8b 05 d6 6a 00 00 	mov    rax,QWORD PTR [rip+0x6ad6]        # 80b240 <tss>
  80476a:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  80476e:	48 89 50 3c          	mov    QWORD PTR [rax+0x3c],rdx
    tss->ists[4]=ist4;
  804772:	48 8b 05 c7 6a 00 00 	mov    rax,QWORD PTR [rip+0x6ac7]        # 80b240 <tss>
  804779:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  80477d:	48 89 50 44          	mov    QWORD PTR [rax+0x44],rdx
    tss->ists[5]=ist5;
  804781:	48 8b 05 b8 6a 00 00 	mov    rax,QWORD PTR [rip+0x6ab8]        # 80b240 <tss>
  804788:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  80478c:	48 89 50 4c          	mov    QWORD PTR [rax+0x4c],rdx
    tss->ists[6]=ist6;
  804790:	48 8b 05 a9 6a 00 00 	mov    rax,QWORD PTR [rip+0x6aa9]        # 80b240 <tss>
  804797:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  80479b:	48 89 50 54          	mov    QWORD PTR [rax+0x54],rdx
}
  80479f:	90                   	nop
  8047a0:	5d                   	pop    rbp
  8047a1:	c3                   	ret    
  8047a2:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  8047a9:	00 00 00 
  8047ac:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

00000000008047b0 <outb>:
  8047b0:	66 89 fa             	mov    dx,di
  8047b3:	66 89 f0             	mov    ax,si
  8047b6:	ee                   	out    dx,al
  8047b7:	e8 29 00 00 00       	call   8047e5 <io_delay>
  8047bc:	c3                   	ret    

00000000008047bd <outw>:
  8047bd:	66 89 fa             	mov    dx,di
  8047c0:	66 89 f0             	mov    ax,si
  8047c3:	66 ef                	out    dx,ax
  8047c5:	90                   	nop
  8047c6:	90                   	nop
  8047c7:	90                   	nop
  8047c8:	c3                   	ret    

00000000008047c9 <inb>:
  8047c9:	31 c0                	xor    eax,eax
  8047cb:	66 89 fa             	mov    dx,di
  8047ce:	ec                   	in     al,dx
  8047cf:	90                   	nop
  8047d0:	90                   	nop
  8047d1:	90                   	nop
  8047d2:	c3                   	ret    

00000000008047d3 <inw>:
  8047d3:	31 c0                	xor    eax,eax
  8047d5:	66 89 fa             	mov    dx,di
  8047d8:	66 ed                	in     ax,dx
  8047da:	90                   	nop
  8047db:	90                   	nop
  8047dc:	90                   	nop
  8047dd:	c3                   	ret    

00000000008047de <eoi>:
  8047de:	b0 20                	mov    al,0x20
  8047e0:	e6 a0                	out    0xa0,al
  8047e2:	e6 20                	out    0x20,al
  8047e4:	c3                   	ret    

00000000008047e5 <io_delay>:
  8047e5:	90                   	nop
  8047e6:	90                   	nop
  8047e7:	90                   	nop
  8047e8:	90                   	nop
  8047e9:	c3                   	ret    

00000000008047ea <turn_on_int>:
  8047ea:	b0 f8                	mov    al,0xf8
  8047ec:	e6 21                	out    0x21,al
  8047ee:	e8 f2 ff ff ff       	call   8047e5 <io_delay>
  8047f3:	b0 af                	mov    al,0xaf
  8047f5:	e6 a1                	out    0xa1,al
  8047f7:	e8 e9 ff ff ff       	call   8047e5 <io_delay>
  8047fc:	b8 00 70 10 00       	mov    eax,0x107000
  804801:	0f 01 18             	lidt   [rax]
  804804:	90                   	nop
  804805:	90                   	nop
  804806:	90                   	nop
  804807:	90                   	nop
  804808:	c3                   	ret    

0000000000804809 <report_back_trace_of_err>:
  804809:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  80480e:	50                   	push   rax
  80480f:	68 18 48 80 00       	push   0x804818
  804814:	83 c4 08             	add    esp,0x8
  804817:	c3                   	ret    

0000000000804818 <bt_msg>:
  804818:	65 72 72             	gs jb  80488d <fill_desc+0x4e>
  80481b:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  80481c:	72 20                	jb     80483e <init_gdt+0x11>
  80481e:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  80481f:	63 63 75             	movsxd esp,DWORD PTR [rbx+0x75]
  804822:	72 73                	jb     804897 <fill_desc+0x58>
  804824:	20 61 74             	and    BYTE PTR [rcx+0x74],ah
  804827:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR [rip+0x6e5c78]        # eea4a5 <_knl_end+0x2ea4a5>

000000000080482d <init_gdt>:
#include "gdt.h"
#include "int.h"
descriptor *gdt=GDT_ADDR;
extern char *gdtptr;
int init_gdt()
{
  80482d:	f3 0f 1e fa          	endbr64 
  804831:	55                   	push   rbp
  804832:	48 89 e5             	mov    rbp,rsp
//    fill_desc(0x108000,108,SEG_SYS_TSS|SEG_PRESENT,4);
    asm volatile("mov $0x48,%ax\r\n"
  804835:	66 b8 48 00          	mov    ax,0x48
  804839:	0f 00 d8             	ltr    ax
                 "ltr %ax");  
}
  80483c:	90                   	nop
  80483d:	5d                   	pop    rbp
  80483e:	c3                   	ret    

000000000080483f <fill_desc>:
void fill_desc(u64 base, u64 limit, u16 attr, u32 index)
{
  80483f:	f3 0f 1e fa          	endbr64 
  804843:	55                   	push   rbp
  804844:	48 89 e5             	mov    rbp,rsp
  804847:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80484b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80484f:	89 d0                	mov    eax,edx
  804851:	89 4d e8             	mov    DWORD PTR [rbp-0x18],ecx
  804854:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    gdt[index].base_12=base&0xffff;
  804858:	48 8b 15 e9 69 00 00 	mov    rdx,QWORD PTR [rip+0x69e9]        # 80b248 <gdt>
  80485f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804862:	48 c1 e0 04          	shl    rax,0x4
  804866:	48 01 d0             	add    rax,rdx
  804869:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80486d:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    gdt[index].base_3=(base>>16)&0xff;
  804871:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804875:	48 c1 e8 10          	shr    rax,0x10
  804879:	48 89 c1             	mov    rcx,rax
  80487c:	48 8b 15 c5 69 00 00 	mov    rdx,QWORD PTR [rip+0x69c5]        # 80b248 <gdt>
  804883:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804886:	48 c1 e0 04          	shl    rax,0x4
  80488a:	48 01 d0             	add    rax,rdx
  80488d:	89 ca                	mov    edx,ecx
  80488f:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    gdt[index].base_4=(base>>24)&0xff;
  804892:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804896:	48 c1 e8 18          	shr    rax,0x18
  80489a:	48 89 c1             	mov    rcx,rax
  80489d:	48 8b 15 a4 69 00 00 	mov    rdx,QWORD PTR [rip+0x69a4]        # 80b248 <gdt>
  8048a4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8048a7:	48 c1 e0 04          	shl    rax,0x4
  8048ab:	48 01 d0             	add    rax,rdx
  8048ae:	89 ca                	mov    edx,ecx
  8048b0:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    gdt[index].base_5678=(base>>32)&0xffffffff;
  8048b3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8048b7:	48 c1 e8 20          	shr    rax,0x20
  8048bb:	48 89 c2             	mov    rdx,rax
  8048be:	48 8b 0d 83 69 00 00 	mov    rcx,QWORD PTR [rip+0x6983]        # 80b248 <gdt>
  8048c5:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8048c8:	48 c1 e0 04          	shl    rax,0x4
  8048cc:	48 01 c8             	add    rax,rcx
  8048cf:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    gdt[index].limit_lo16=limit&0xffff;
  8048d2:	48 8b 15 6f 69 00 00 	mov    rdx,QWORD PTR [rip+0x696f]        # 80b248 <gdt>
  8048d9:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8048dc:	48 c1 e0 04          	shl    rax,0x4
  8048e0:	48 01 d0             	add    rax,rdx
  8048e3:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  8048e7:	66 89 10             	mov    WORD PTR [rax],dx
    gdt[index].attr=attr|((limit>>8)&0xf0);
  8048ea:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8048ee:	48 c1 e8 08          	shr    rax,0x8
  8048f2:	66 25 f0 00          	and    ax,0xf0
  8048f6:	48 8b 0d 4b 69 00 00 	mov    rcx,QWORD PTR [rip+0x694b]        # 80b248 <gdt>
  8048fd:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804900:	48 c1 e2 04          	shl    rdx,0x4
  804904:	48 01 ca             	add    rdx,rcx
  804907:	66 0b 45 ec          	or     ax,WORD PTR [rbp-0x14]
  80490b:	66 89 42 05          	mov    WORD PTR [rdx+0x5],ax

}
  80490f:	90                   	nop
  804910:	5d                   	pop    rbp
  804911:	c3                   	ret    

0000000000804912 <fill_gate>:

void fill_gate(u32 index,u32 offset,u16 selector,u16 attr)
{
  804912:	f3 0f 1e fa          	endbr64 
  804916:	55                   	push   rbp
  804917:	48 89 e5             	mov    rbp,rsp
  80491a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80491d:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  804920:	89 c8                	mov    eax,ecx
  804922:	66 89 55 e4          	mov    WORD PTR [rbp-0x1c],dx
  804926:	66 89 45 e0          	mov    WORD PTR [rbp-0x20],ax
    gate* ptr=gdt;
  80492a:	48 8b 05 17 69 00 00 	mov    rax,QWORD PTR [rip+0x6917]        # 80b248 <gdt>
  804931:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ptr[index].offset_low=offset&0xffff;
  804935:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804938:	48 c1 e0 04          	shl    rax,0x4
  80493c:	48 89 c2             	mov    rdx,rax
  80493f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804943:	48 01 d0             	add    rax,rdx
  804946:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804949:	66 89 10             	mov    WORD PTR [rax],dx
    ptr[index].offset_high=(offset>>16)&0xffff;
  80494c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80494f:	48 c1 e0 04          	shl    rax,0x4
  804953:	48 89 c2             	mov    rdx,rax
  804956:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80495a:	48 01 d0             	add    rax,rdx
  80495d:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804960:	c1 ea 10             	shr    edx,0x10
  804963:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    ptr[index].selector=selector;
  804966:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804969:	48 c1 e0 04          	shl    rax,0x4
  80496d:	48 89 c2             	mov    rdx,rax
  804970:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804974:	48 01 c2             	add    rdx,rax
  804977:	0f b7 45 e4          	movzx  eax,WORD PTR [rbp-0x1c]
  80497b:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    ptr[index].attr=attr;
  80497f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804982:	48 c1 e0 04          	shl    rax,0x4
  804986:	48 89 c2             	mov    rdx,rax
  804989:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80498d:	48 01 c2             	add    rdx,rax
  804990:	0f b7 45 e0          	movzx  eax,WORD PTR [rbp-0x20]
  804994:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
}
  804998:	90                   	nop
  804999:	5d                   	pop    rbp
  80499a:	c3                   	ret    

000000000080499b <fill_ldt_desc>:

void fill_ldt_desc(u32 base, u32 limit,u16 attr,descriptor *desc)
{
  80499b:	f3 0f 1e fa          	endbr64 
  80499f:	55                   	push   rbp
  8049a0:	48 89 e5             	mov    rbp,rsp
  8049a3:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  8049a6:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  8049a9:	89 d0                	mov    eax,edx
  8049ab:	48 89 4d e8          	mov    QWORD PTR [rbp-0x18],rcx
  8049af:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
//    desc->base_lo16=base&0xffff;
//    desc->base_mid8=(base>>16)&0xff;
//    desc->base_hi8=(base>>24)&0xff;
//    desc->limit_lo16=limit&0xffff;
//    desc->attr=attr|(limit>>16&0xf)<<8;
  8049b3:	90                   	nop
  8049b4:	5d                   	pop    rbp
  8049b5:	c3                   	ret    
  8049b6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  8049bd:	00 00 00 

00000000008049c0 <fill_desc>:
  8049c0:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  8049c5:	67 8b 5c 24 08       	mov    ebx,DWORD PTR [esp+0x8]
  8049ca:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  8049cf:	67 8b 54 24 10       	mov    edx,DWORD PTR [esp+0x10]
  8049d4:	be 00 60 00 00       	mov    esi,0x6000
  8049d9:	c1 e2 03             	shl    edx,0x3
  8049dc:	01 d6                	add    esi,edx
  8049de:	66 67 89 1e          	mov    WORD PTR [esi],bx
  8049e2:	66 67 89 46 02       	mov    WORD PTR [esi+0x2],ax
  8049e7:	c1 e8 10             	shr    eax,0x10
  8049ea:	67 88 46 04          	mov    BYTE PTR [esi+0x4],al
  8049ee:	c1 eb 10             	shr    ebx,0x10
  8049f1:	67 88 5e 06          	mov    BYTE PTR [esi+0x6],bl
  8049f5:	67 88 66 07          	mov    BYTE PTR [esi+0x7],ah
  8049f9:	67 09 4e 05          	or     DWORD PTR [esi+0x5],ecx
  8049fd:	c3                   	ret    

00000000008049fe <clock_c>:
#include <devman.h>
#include <disk.h>
extern int manage_proc_lock;
extern int cur_proc;
extern struct process *task;
void clock_c(){
  8049fe:	f3 0f 1e fa          	endbr64 
  804a02:	55                   	push   rbp
  804a03:	48 89 e5             	mov    rbp,rsp
    //refresh_wnds();
    execute_request();
  804a06:	b8 00 00 00 00       	mov    eax,0x0
  804a0b:	e8 f9 24 00 00       	call   806f09 <execute_request>
    do_req();
  804a10:	b8 00 00 00 00       	mov    eax,0x0
  804a15:	e8 27 e7 ff ff       	call   803141 <do_req>
    if(!manage_proc_lock)
  804a1a:	8b 05 c8 67 00 00    	mov    eax,DWORD PTR [rip+0x67c8]        # 80b1e8 <manage_proc_lock>
  804a20:	85 c0                	test   eax,eax
  804a22:	75 0a                	jne    804a2e <clock_c+0x30>
    {
        manage_proc();
  804a24:	b8 00 00 00 00       	mov    eax,0x0
  804a29:	e8 72 ee ff ff       	call   8038a0 <manage_proc>
    }
    //puts("1 disk req executed.");
  804a2e:	90                   	nop
  804a2f:	5d                   	pop    rbp
  804a30:	c3                   	ret    
  804a31:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  804a38:	00 00 00 
  804a3b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000804a40 <clock>:
  804a40:	50                   	push   rax
  804a41:	53                   	push   rbx
  804a42:	51                   	push   rcx
  804a43:	52                   	push   rdx
  804a44:	57                   	push   rdi
  804a45:	56                   	push   rsi
  804a46:	41 50                	push   r8
  804a48:	41 51                	push   r9
  804a4a:	41 52                	push   r10
  804a4c:	41 53                	push   r11
  804a4e:	41 54                	push   r12
  804a50:	41 55                	push   r13
  804a52:	41 56                	push   r14
  804a54:	41 57                	push   r15
  804a56:	66 8c c0             	mov    ax,es
  804a59:	50                   	push   rax
  804a5a:	66 8c d8             	mov    ax,ds
  804a5d:	50                   	push   rax
  804a5e:	66 b8 10 00          	mov    ax,0x10
  804a62:	8e c0                	mov    es,eax
  804a64:	8e d8                	mov    ds,eax

0000000000804a66 <clock.normal_part>:
  804a66:	b0 20                	mov    al,0x20
  804a68:	e6 a0                	out    0xa0,al
  804a6a:	e6 20                	out    0x20,al
  804a6c:	e8 8d ff ff ff       	call   8049fe <clock_c>
  804a71:	58                   	pop    rax
  804a72:	8e d8                	mov    ds,eax
  804a74:	58                   	pop    rax
  804a75:	8e c0                	mov    es,eax
  804a77:	41 5f                	pop    r15
  804a79:	41 5e                	pop    r14
  804a7b:	41 5d                	pop    r13
  804a7d:	41 5c                	pop    r12
  804a7f:	41 5b                	pop    r11
  804a81:	41 5a                	pop    r10
  804a83:	41 59                	pop    r9
  804a85:	41 58                	pop    r8
  804a87:	5e                   	pop    rsi
  804a88:	5f                   	pop    rdi
  804a89:	5a                   	pop    rdx
  804a8a:	59                   	pop    rcx
  804a8b:	5b                   	pop    rbx
  804a8c:	58                   	pop    rax
  804a8d:	48 cf                	iretq  

0000000000804a8f <execute>:
    return ind;
}
*/

int execute(char *path)
{
  804a8f:	f3 0f 1e fa          	endbr64 
  804a93:	55                   	push   rbp
  804a94:	48 89 e5             	mov    rbp,rsp
  804a97:	48 83 ec 30          	sub    rsp,0x30
  804a9b:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    //尚未切换到目标进程
    //syscall(SYSCALL_REG_PROC, load_pe,0,0,0,0);
    int fno=-1,cwd_fno=-1;
  804a9f:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  804aa6:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    if((fno=sys_open(path, 1)) == -1)return -1;
  804aad:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804ab1:	be 01 00 00 00       	mov    esi,0x1
  804ab6:	48 89 c7             	mov    rdi,rax
  804ab9:	e8 47 14 00 00       	call   805f05 <sys_open>
  804abe:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  804ac1:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  804ac5:	75 0a                	jne    804ad1 <execute+0x42>
  804ac7:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804acc:	e9 b7 00 00 00       	jmp    804b88 <execute+0xf9>
    //
    char *p=path;
  804ad1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804ad5:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='\0';p++);
  804ad9:	eb 05                	jmp    804ae0 <execute+0x51>
  804adb:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  804ae0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804ae4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  804ae7:	84 c0                	test   al,al
  804ae9:	75 f0                	jne    804adb <execute+0x4c>
    for(;*p!='/'&&p>path;p--);
  804aeb:	eb 05                	jmp    804af2 <execute+0x63>
  804aed:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  804af2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804af6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  804af9:	3c 2f                	cmp    al,0x2f
  804afb:	74 0a                	je     804b07 <execute+0x78>
  804afd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b01:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  804b05:	77 e6                	ja     804aed <execute+0x5e>
    if(p>path)
  804b07:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b0b:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  804b0f:	76 2f                	jbe    804b40 <execute+0xb1>
    {
        *p='\0';
  804b11:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b15:	c6 00 00             	mov    BYTE PTR [rax],0x0
        if((cwd_fno=sys_open(path, 1)) == -1)return -1;
  804b18:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804b1c:	be 01 00 00 00       	mov    esi,0x1
  804b21:	48 89 c7             	mov    rdi,rax
  804b24:	e8 dc 13 00 00       	call   805f05 <sys_open>
  804b29:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  804b2c:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  804b30:	75 07                	jne    804b39 <execute+0xaa>
  804b32:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804b37:	eb 4f                	jmp    804b88 <execute+0xf9>
        *p='/';
  804b39:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b3d:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
    }
    extern vfs_dir_entry opened[];
    extern struct process task[];
    int pi= reg_proc(proc_start, &opened[cwd_fno], &opened[fno]);
  804b40:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804b43:	48 63 d0             	movsxd rdx,eax
  804b46:	48 89 d0             	mov    rax,rdx
  804b49:	48 01 c0             	add    rax,rax
  804b4c:	48 01 d0             	add    rax,rdx
  804b4f:	48 c1 e0 05          	shl    rax,0x5
  804b53:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  804b5a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804b5d:	48 63 c8             	movsxd rcx,eax
  804b60:	48 89 c8             	mov    rax,rcx
  804b63:	48 01 c0             	add    rax,rax
  804b66:	48 01 c8             	add    rax,rcx
  804b69:	48 c1 e0 05          	shl    rax,0x5
  804b6d:	48 05 60 06 40 00    	add    rax,0x400660
  804b73:	b9 00 4c 80 00       	mov    ecx,0x804c00
  804b78:	48 89 c6             	mov    rsi,rax
  804b7b:	89 cf                	mov    edi,ecx
  804b7d:	e8 e8 f5 ff ff       	call   80416a <reg_proc>
  804b82:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    return pi;
  804b85:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
}
  804b88:	c9                   	leave  
  804b89:	c3                   	ret    

0000000000804b8a <exec_call>:

int exec_call(char *path)
{
  804b8a:	f3 0f 1e fa          	endbr64 
  804b8e:	55                   	push   rbp
  804b8f:	48 89 e5             	mov    rbp,rsp
  804b92:	48 83 ec 20          	sub    rsp,0x20
  804b96:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pi=execute(path);
  804b9a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804b9e:	48 89 c7             	mov    rdi,rax
  804ba1:	e8 e9 fe ff ff       	call   804a8f <execute>
  804ba6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int tss= _TSS_IND(pi)*8;
  804ba9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804bac:	01 c0                	add    eax,eax
  804bae:	83 c0 05             	add    eax,0x5
  804bb1:	c1 e0 03             	shl    eax,0x3
  804bb4:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    extern struct process task[];
    extern int cur_proc;
    switch_proc_tss(pi);
  804bb7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804bba:	89 c7                	mov    edi,eax
  804bbc:	e8 ab ee ff ff       	call   803a6c <switch_proc_tss>
    while(task[pi].stat!=ENDED);
  804bc1:	90                   	nop
  804bc2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804bc5:	48 63 d0             	movsxd rdx,eax
  804bc8:	48 89 d0             	mov    rax,rdx
  804bcb:	48 01 c0             	add    rax,rax
  804bce:	48 01 d0             	add    rax,rdx
  804bd1:	48 c1 e0 08          	shl    rax,0x8
  804bd5:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804bdb:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804bde:	83 f8 03             	cmp    eax,0x3
  804be1:	75 df                	jne    804bc2 <exec_call+0x38>
    return task[pi].exit_code;
  804be3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804be6:	48 63 d0             	movsxd rdx,eax
  804be9:	48 89 d0             	mov    rax,rdx
  804bec:	48 01 c0             	add    rax,rax
  804bef:	48 01 d0             	add    rax,rdx
  804bf2:	48 c1 e0 08          	shl    rax,0x8
  804bf6:	48 05 b0 84 40 00    	add    rax,0x4084b0
  804bfc:	8b 00                	mov    eax,DWORD PTR [rax]
}
  804bfe:	c9                   	leave  
  804bff:	c3                   	ret    

0000000000804c00 <proc_start>:
int proc_start()
{
  804c00:	f3 0f 1e fa          	endbr64 
  804c04:	55                   	push   rbp
  804c05:	48 89 e5             	mov    rbp,rsp
    extern struct process task[];
    extern int cur_proc;
    load_pe(&task[cur_proc]);
  804c08:	8b 05 1e f9 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f91e]        # 41452c <cur_proc>
  804c0e:	48 63 d0             	movsxd rdx,eax
  804c11:	48 89 d0             	mov    rax,rdx
  804c14:	48 01 c0             	add    rax,rax
  804c17:	48 01 d0             	add    rax,rdx
  804c1a:	48 c1 e0 08          	shl    rax,0x8
  804c1e:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804c24:	48 89 c7             	mov    rdi,rax
  804c27:	e8 1a 00 00 00       	call   804c46 <load_pe>
    //释放进程资源
    del_proc(cur_proc);
  804c2c:	8b 05 fa f8 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f8fa]        # 41452c <cur_proc>
  804c32:	89 c7                	mov    edi,eax
  804c34:	e8 03 f3 ff ff       	call   803f3c <del_proc>
    switch_proc_tss(0);
  804c39:	bf 00 00 00 00       	mov    edi,0x0
  804c3e:	e8 29 ee ff ff       	call   803a6c <switch_proc_tss>
}
  804c43:	90                   	nop
  804c44:	5d                   	pop    rbp
  804c45:	c3                   	ret    

0000000000804c46 <load_pe>:
//在cr3切换到目标进程下的加载程序(但进程还没调度到那里)。
int load_pe(struct process *proc)
{
  804c46:	f3 0f 1e fa          	endbr64 
  804c4a:	55                   	push   rbp
  804c4b:	48 89 e5             	mov    rbp,rsp
  804c4e:	48 81 ec c0 02 00 00 	sub    rsp,0x2c0
  804c55:	48 89 bd 48 fd ff ff 	mov    QWORD PTR [rbp-0x2b8],rdi
    // 读取文件头
    vfs_dir_entry *f=proc->exef;
  804c5c:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  804c63:	48 8b 80 bc 00 00 00 	mov    rax,QWORD PTR [rax+0xbc]
  804c6a:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    int exefno=f->fno;
  804c6e:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  804c72:	8b 00                	mov    eax,DWORD PTR [rax]
  804c74:	89 45 94             	mov    DWORD PTR [rbp-0x6c],eax

    IMAGE_DOS_HEADER tdh;
    IMAGE_NT_HEADERS32 tnth;
    sys_read(exefno, &tdh, sizeof(tdh));
  804c77:	48 8d 8d 70 fe ff ff 	lea    rcx,[rbp-0x190]
  804c7e:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804c81:	ba 44 00 00 00       	mov    edx,0x44
  804c86:	48 89 ce             	mov    rsi,rcx
  804c89:	89 c7                	mov    edi,eax
  804c8b:	e8 44 16 00 00       	call   8062d4 <sys_read>
    sys_lseek(exefno,tdh.e_lfanew,SEEK_SET);
  804c90:	48 8b 85 ac fe ff ff 	mov    rax,QWORD PTR [rbp-0x154]
  804c97:	48 89 c1             	mov    rcx,rax
  804c9a:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804c9d:	ba 00 00 00 00       	mov    edx,0x0
  804ca2:	48 89 ce             	mov    rsi,rcx
  804ca5:	89 c7                	mov    edi,eax
  804ca7:	e8 88 17 00 00       	call   806434 <sys_lseek>
    sys_read(exefno, &tnth, sizeof(tnth));
  804cac:	48 8d 8d 70 fd ff ff 	lea    rcx,[rbp-0x290]
  804cb3:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804cb6:	ba f8 00 00 00       	mov    edx,0xf8
  804cbb:	48 89 ce             	mov    rsi,rcx
  804cbe:	89 c7                	mov    edi,eax
  804cc0:	e8 0f 16 00 00       	call   8062d4 <sys_read>

    //是否需要移动base(先不检查)
    unsigned int nbase=tnth.OptionalHeader.ImageBase;
  804cc5:	8b 85 a4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x25c]
  804ccb:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int pgn=tnth.OptionalHeader.SizeOfImage/PAGE_SIZE;
  804cce:	8b 85 c0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x240]
  804cd4:	c1 e8 0c             	shr    eax,0xc
  804cd7:	89 45 90             	mov    DWORD PTR [rbp-0x70],eax
    //use_pgm_ava检查在页表中这个范围是否可用，可用就使用
    while(1)
    {
        cont:
        ;
        int pdei=nbase/PAGE_INDEX_SIZE;
  804cda:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804cdd:	c1 e8 16             	shr    eax,0x16
  804ce0:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
        int ptei=nbase%PAGE_INDEX_SIZE/PAGE_SIZE;
  804ce3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804ce6:	25 ff ff 3f 00       	and    eax,0x3fffff
  804ceb:	c1 e8 0c             	shr    eax,0xc
  804cee:	89 45 88             	mov    DWORD PTR [rbp-0x78],eax
        int *pt=(proc->pml4[pdei]&0xfffff000);
  804cf1:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  804cf8:	48 8b 90 ac 00 00 00 	mov    rdx,QWORD PTR [rax+0xac]
  804cff:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
  804d02:	48 98                	cdqe   
  804d04:	48 c1 e0 03          	shl    rax,0x3
  804d08:	48 01 d0             	add    rax,rdx
  804d0b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804d0e:	25 00 f0 ff ff       	and    eax,0xfffff000
  804d13:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
        for(int i=0;i<pgn;i++)
  804d17:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  804d1e:	eb 48                	jmp    804d68 <load_pe+0x122>
        {
            if(pt[ptei+i%1024]&PAGE_PRESENT&&pt!=NULL)
  804d20:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804d23:	99                   	cdq    
  804d24:	c1 ea 16             	shr    edx,0x16
  804d27:	01 d0                	add    eax,edx
  804d29:	25 ff 03 00 00       	and    eax,0x3ff
  804d2e:	29 d0                	sub    eax,edx
  804d30:	89 c2                	mov    edx,eax
  804d32:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
  804d35:	01 d0                	add    eax,edx
  804d37:	48 98                	cdqe   
  804d39:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  804d40:	00 
  804d41:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  804d45:	48 01 d0             	add    rax,rdx
  804d48:	8b 00                	mov    eax,DWORD PTR [rax]
  804d4a:	83 e0 01             	and    eax,0x1
  804d4d:	85 c0                	test   eax,eax
  804d4f:	74 13                	je     804d64 <load_pe+0x11e>
  804d51:	48 83 7d 80 00       	cmp    QWORD PTR [rbp-0x80],0x0
  804d56:	74 0c                	je     804d64 <load_pe+0x11e>
            {
                //移动base
                nbase+=0x1000;
  804d58:	81 45 fc 00 10 00 00 	add    DWORD PTR [rbp-0x4],0x1000
                goto cont;
  804d5f:	e9 76 ff ff ff       	jmp    804cda <load_pe+0x94>
        for(int i=0;i<pgn;i++)
  804d64:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  804d68:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804d6b:	3b 45 90             	cmp    eax,DWORD PTR [rbp-0x70]
  804d6e:	7c b0                	jl     804d20 <load_pe+0xda>
            }
        }
        break;
  804d70:	90                   	nop
    }

    //proc->tss.eip=tnth.OptionalHeader.AddressOfEntryPoint+nbase;
    //存放文件头
    sys_lseek(exefno,0,SEEK_SET);
  804d71:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804d74:	ba 00 00 00 00       	mov    edx,0x0
  804d79:	be 00 00 00 00       	mov    esi,0x0
  804d7e:	89 c7                	mov    edi,eax
  804d80:	e8 af 16 00 00       	call   806434 <sys_lseek>
    sys_read(exefno, nbase, PAGE_SIZE);
  804d85:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804d88:	48 89 c1             	mov    rcx,rax
  804d8b:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804d8e:	ba 00 10 00 00       	mov    edx,0x1000
  804d93:	48 89 ce             	mov    rsi,rcx
  804d96:	89 c7                	mov    edi,eax
  804d98:	e8 37 15 00 00       	call   8062d4 <sys_read>
    //dos头
    PIMAGE_DOS_HEADER dosh=nbase;
  804d9d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804da0:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    PIMAGE_NT_HEADERS32 nth=nbase+dosh->e_lfanew;
  804da7:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804daa:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  804db1:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  804db5:	48 01 d0             	add    rax,rdx
  804db8:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    PIMAGE_FILE_HEADER fh=&nth->FileHeader;
  804dbf:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804dc6:	48 83 c0 04          	add    rax,0x4
  804dca:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    //为新进程分配内存页
    //计算所需的页
    int prog_size=nth->OptionalHeader.SizeOfImage;
  804dd1:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804dd8:	8b 40 50             	mov    eax,DWORD PTR [rax+0x50]
  804ddb:	89 85 64 ff ff ff    	mov    DWORD PTR [rbp-0x9c],eax
    int page_count=prog_size/4096;
  804de1:	8b 85 64 ff ff ff    	mov    eax,DWORD PTR [rbp-0x9c]
  804de7:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  804ded:	85 c0                	test   eax,eax
  804def:	0f 48 c2             	cmovs  eax,edx
  804df2:	c1 f8 0c             	sar    eax,0xc
  804df5:	89 85 60 ff ff ff    	mov    DWORD PTR [rbp-0xa0],eax

    int shell_addr=nth->OptionalHeader.AddressOfEntryPoint+nbase;
  804dfb:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804e02:	8b 50 28             	mov    edx,DWORD PTR [rax+0x28]
  804e05:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804e08:	01 d0                	add    eax,edx
  804e0a:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
    int page_index_item_count=page_count/1024+page_count%1024==0?0:1;
  804e10:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  804e16:	8d 90 ff 03 00 00    	lea    edx,[rax+0x3ff]
  804e1c:	85 c0                	test   eax,eax
  804e1e:	0f 48 c2             	cmovs  eax,edx
  804e21:	c1 f8 0a             	sar    eax,0xa
  804e24:	89 c1                	mov    ecx,eax
  804e26:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  804e2c:	99                   	cdq    
  804e2d:	c1 ea 16             	shr    edx,0x16
  804e30:	01 d0                	add    eax,edx
  804e32:	25 ff 03 00 00       	and    eax,0x3ff
  804e37:	29 d0                	sub    eax,edx
  804e39:	01 c8                	add    eax,ecx
  804e3b:	85 c0                	test   eax,eax
  804e3d:	0f 95 c0             	setne  al
  804e40:	0f b6 c0             	movzx  eax,al
  804e43:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
    int start_pgind_item=shell_addr/PAGE_INDEX_SIZE;
  804e49:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  804e4f:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  804e55:	85 c0                	test   eax,eax
  804e57:	0f 48 c2             	cmovs  eax,edx
  804e5a:	c1 f8 16             	sar    eax,0x16
  804e5d:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax

    //sys_read sections
    PIMAGE_SECTION_HEADER psec=(u32)nth+sizeof(IMAGE_NT_HEADERS32);
  804e63:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804e6a:	89 c0                	mov    eax,eax
  804e6c:	48 05 f8 00 00 00    	add    rax,0xf8
  804e72:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
    nth->FileHeader.NumberOfSections*sizeof(IMAGE_SECTION_HEADER);
  804e76:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804e7d:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  804e81:	0f b7 d0             	movzx  edx,ax
  804e84:	89 d0                	mov    eax,edx
  804e86:	c1 e0 02             	shl    eax,0x2
  804e89:	01 d0                	add    eax,edx
  804e8b:	c1 e0 03             	shl    eax,0x3
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
  804e8e:	05 3c 01 00 00       	add    eax,0x13c
  804e93:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    int align=nth->OptionalHeader.FileAlignment;
  804e99:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804ea0:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  804ea3:	89 85 4c ff ff ff    	mov    DWORD PTR [rbp-0xb4],eax
    data_start=data_start%align?data_start-data_start%align+align:data_start;
  804ea9:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  804eaf:	99                   	cdq    
  804eb0:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  804eb6:	89 d0                	mov    eax,edx
  804eb8:	85 c0                	test   eax,eax
  804eba:	74 23                	je     804edf <load_pe+0x299>
  804ebc:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  804ec2:	99                   	cdq    
  804ec3:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  804ec9:	89 d1                	mov    ecx,edx
  804ecb:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  804ed1:	29 c8                	sub    eax,ecx
  804ed3:	89 c2                	mov    edx,eax
  804ed5:	8b 85 4c ff ff ff    	mov    eax,DWORD PTR [rbp-0xb4]
  804edb:	01 d0                	add    eax,edx
  804edd:	eb 06                	jmp    804ee5 <load_pe+0x29f>
  804edf:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  804ee5:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  804eeb:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804ef2:	eb 69                	jmp    804f5d <load_pe+0x317>
    {
        int disca=psec->Characteristics&IMAGE_SCN_MEM_DISCARDABLE;
  804ef4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804ef8:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  804efb:	25 00 00 00 02       	and    eax,0x2000000
  804f00:	89 85 bc fe ff ff    	mov    DWORD PTR [rbp-0x144],eax
        if(disca)
  804f06:	83 bd bc fe ff ff 00 	cmp    DWORD PTR [rbp-0x144],0x0
  804f0d:	75 44                	jne    804f53 <load_pe+0x30d>
            continue;
        //直接读，缺页内核解决
        sys_lseek(exefno,psec->PointerToRawData,SEEK_SET);
  804f0f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804f13:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  804f16:	89 c1                	mov    ecx,eax
  804f18:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804f1b:	ba 00 00 00 00       	mov    edx,0x0
  804f20:	48 89 ce             	mov    rsi,rcx
  804f23:	89 c7                	mov    edi,eax
  804f25:	e8 0a 15 00 00       	call   806434 <sys_lseek>
        sys_read(exefno, psec->VirtualAddress + nbase,  psec->SizeOfRawData);
  804f2a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804f2e:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  804f31:	89 c2                	mov    edx,eax
  804f33:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804f37:	8b 48 0c             	mov    ecx,DWORD PTR [rax+0xc]
  804f3a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804f3d:	01 c8                	add    eax,ecx
  804f3f:	89 c0                	mov    eax,eax
  804f41:	48 89 c1             	mov    rcx,rax
  804f44:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804f47:	48 89 ce             	mov    rsi,rcx
  804f4a:	89 c7                	mov    edi,eax
  804f4c:	e8 83 13 00 00       	call   8062d4 <sys_read>
  804f51:	eb 01                	jmp    804f54 <load_pe+0x30e>
            continue;
  804f53:	90                   	nop
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  804f54:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804f58:	48 83 45 f0 28       	add    QWORD PTR [rbp-0x10],0x28
  804f5d:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804f64:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  804f68:	0f b7 c0             	movzx  eax,ax
  804f6b:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  804f6e:	7c 84                	jl     804ef4 <load_pe+0x2ae>

    }

    //通过导入表加载需要的dll
    PIMAGE_DATA_DIRECTORY impd=&nth->OptionalHeader.DataDirectory[1];
  804f70:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804f77:	48 83 e8 80          	sub    rax,0xffffffffffffff80
  804f7b:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    if(impd->Size>0)
  804f82:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  804f89:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804f8c:	85 c0                	test   eax,eax
  804f8e:	0f 84 71 02 00 00    	je     805205 <load_pe+0x5bf>
    {
        int tmpi=impd->VirtualAddress+nbase;
  804f94:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  804f9b:	8b 10                	mov    edx,DWORD PTR [rax]
  804f9d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804fa0:	01 d0                	add    eax,edx
  804fa2:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
        PIMAGE_IMPORT_DESCRIPTOR impdes=tmpi;
  804fa8:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  804fae:	48 98                	cdqe   
  804fb0:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        int dllp;
        while (impdes->Characteristics)
  804fb4:	e9 3e 02 00 00       	jmp    8051f7 <load_pe+0x5b1>
        {
            //加载dll
            char *dllname=impdes->Name+nbase;
  804fb9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804fbd:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  804fc0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804fc3:	01 d0                	add    eax,edx
  804fc5:	89 c0                	mov    eax,eax
  804fc7:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
            //此处应有加载dll代码
            int dlli;
            if(strcmp(dllname,"sys.dll")==0)//加载系统dll的部分由内核已经完成
  804fce:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  804fd5:	be 28 2e 81 00       	mov    esi,0x812e28
  804fda:	48 89 c7             	mov    rdi,rax
  804fdd:	e8 dd 5a 00 00       	call   80aabf <strcmp>
  804fe2:	85 c0                	test   eax,eax
  804fe4:	75 09                	jne    804fef <load_pe+0x3a9>
            {
                dllp=0x1c00000;
  804fe6:	c7 45 dc 00 00 c0 01 	mov    DWORD PTR [rbp-0x24],0x1c00000
  804fed:	eb 25                	jmp    805014 <load_pe+0x3ce>
            }else{
                //load_pe要记录module的加载
                dlli= load_pe(proc);
  804fef:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  804ff6:	48 89 c7             	mov    rdi,rax
  804ff9:	e8 48 fc ff ff       	call   804c46 <load_pe>
  804ffe:	89 85 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],eax
                //dlli=load_library(dllname);
                //这个是线性地址
                dllp=get_module_addr(dlli);
  805004:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  80500a:	89 c7                	mov    edi,eax
  80500c:	e8 e4 03 00 00       	call   8053f5 <get_module_addr>
  805011:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            }
            //从线性地址查页表找到物理地址
            PIMAGE_DOS_HEADER dlldos=dllp;
  805014:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805017:	48 98                	cdqe   
  805019:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
            PIMAGE_NT_HEADERS32 dllnth=dllp+dlldos->e_lfanew;
  805020:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805023:	48 63 d0             	movsxd rdx,eax
  805026:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  80502d:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  805031:	48 01 d0             	add    rax,rdx
  805034:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
            PIMAGE_EXPORT_DIRECTORY dllexp=(dllnth->OptionalHeader.DataDirectory[0].VirtualAddress+dllp);
  80503b:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  805042:	8b 50 78             	mov    edx,DWORD PTR [rax+0x78]
  805045:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805048:	01 d0                	add    eax,edx
  80504a:	89 c0                	mov    eax,eax
  80504c:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
            int funcn=dllexp->NumberOfNames;
  805053:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80505a:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  80505d:	89 85 0c ff ff ff    	mov    DWORD PTR [rbp-0xf4],eax
            char **fnames=dllexp->AddressOfNames+dllp;
  805063:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80506a:	8b 50 20             	mov    edx,DWORD PTR [rax+0x20]
  80506d:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805070:	01 d0                	add    eax,edx
  805072:	89 c0                	mov    eax,eax
  805074:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
            int *funcaddrs=dllexp->AddressOfFunctions+dllp;
  80507b:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  805082:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  805085:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805088:	01 d0                	add    eax,edx
  80508a:	89 c0                	mov    eax,eax
  80508c:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
            short *funcords=dllexp->AddressOfNameOrdinals+dllp;
  805093:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80509a:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  80509d:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8050a0:	01 d0                	add    eax,edx
  8050a2:	89 c0                	mov    eax,eax
  8050a4:	48 89 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rax
            //寻找nameordinal的base（最小值），里面的数据加上base才是真正的序号
            unsigned int ord_base=dllexp->Base;
  8050ab:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8050b2:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8050b5:	89 85 ec fe ff ff    	mov    DWORD PTR [rbp-0x114],eax
            //开始将导入表IAT的内容更新为函数地址
            unsigned int *iataddrs=impdes->FirstThunk+nbase;//IAT和INT内容一样，只用IAT
  8050bb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8050bf:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  8050c2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8050c5:	01 d0                	add    eax,edx
  8050c7:	89 c0                	mov    eax,eax
  8050c9:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            char **siataddrs=impdes->FirstThunk+nbase;
  8050cd:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8050d1:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  8050d4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8050d7:	01 d0                	add    eax,edx
  8050d9:	89 c0                	mov    eax,eax
  8050db:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            while (*iataddrs)
  8050df:	e9 00 01 00 00       	jmp    8051e4 <load_pe+0x59e>
            {
                //判断是序号导入还是名称导入
                if(((unsigned)*iataddrs)&0x80000000)
  8050e4:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8050e8:	8b 00                	mov    eax,DWORD PTR [rax]
  8050ea:	85 c0                	test   eax,eax
  8050ec:	79 43                	jns    805131 <load_pe+0x4eb>
                {
                    //序号导入
                    unsigned int ord=((*iataddrs)&0x7fffffff)-ord_base;
  8050ee:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8050f2:	8b 00                	mov    eax,DWORD PTR [rax]
  8050f4:	25 ff ff ff 7f       	and    eax,0x7fffffff
  8050f9:	2b 85 ec fe ff ff    	sub    eax,DWORD PTR [rbp-0x114]
  8050ff:	89 85 d8 fe ff ff    	mov    DWORD PTR [rbp-0x128],eax
                    *iataddrs=funcaddrs[ord]+dllp;
  805105:	8b 85 d8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x128]
  80510b:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  805112:	00 
  805113:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80511a:	48 01 d0             	add    rax,rdx
  80511d:	8b 10                	mov    edx,DWORD PTR [rax]
  80511f:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805122:	01 d0                	add    eax,edx
  805124:	89 c2                	mov    edx,eax
  805126:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80512a:	89 10                	mov    DWORD PTR [rax],edx
  80512c:	e9 a9 00 00 00       	jmp    8051da <load_pe+0x594>
                }else
                {
                    //名称导入
                    char *import_by_name_p=*iataddrs;//指向IMPORT_BY_NAME
  805131:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805135:	8b 00                	mov    eax,DWORD PTR [rax]
  805137:	89 c0                	mov    eax,eax
  805139:	48 89 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rax
                    import_by_name_p+=2;//跳过开头两字节序号
  805140:	48 83 85 e0 fe ff ff 	add    QWORD PTR [rbp-0x120],0x2
  805147:	02 
                    int i=0;
  805148:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
                    for(;i<funcn;i++)
  80514f:	eb 7a                	jmp    8051cb <load_pe+0x585>
                    {
                        if(strcmp(import_by_name_p,fnames[i])==0)
  805151:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  805154:	48 98                	cdqe   
  805156:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80515d:	00 
  80515e:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  805165:	48 01 d0             	add    rax,rdx
  805168:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80516b:	48 8b 85 e0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x120]
  805172:	48 89 d6             	mov    rsi,rdx
  805175:	48 89 c7             	mov    rdi,rax
  805178:	e8 42 59 00 00       	call   80aabf <strcmp>
  80517d:	85 c0                	test   eax,eax
  80517f:	75 46                	jne    8051c7 <load_pe+0x581>
                        {
                            int ordi=funcords[i];
  805181:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  805184:	48 98                	cdqe   
  805186:	48 8d 14 00          	lea    rdx,[rax+rax*1]
  80518a:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  805191:	48 01 d0             	add    rax,rdx
  805194:	0f b7 00             	movzx  eax,WORD PTR [rax]
  805197:	98                   	cwde   
  805198:	89 85 dc fe ff ff    	mov    DWORD PTR [rbp-0x124],eax
                            *iataddrs=funcaddrs[ordi]+dllp;//导入表中的IAT内容修改成地址
  80519e:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
  8051a4:	48 98                	cdqe   
  8051a6:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8051ad:	00 
  8051ae:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8051b5:	48 01 d0             	add    rax,rdx
  8051b8:	8b 10                	mov    edx,DWORD PTR [rax]
  8051ba:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8051bd:	01 d0                	add    eax,edx
  8051bf:	89 c2                	mov    edx,eax
  8051c1:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8051c5:	89 10                	mov    DWORD PTR [rax],edx
                    for(;i<funcn;i++)
  8051c7:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
  8051cb:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8051ce:	3b 85 0c ff ff ff    	cmp    eax,DWORD PTR [rbp-0xf4]
  8051d4:	0f 8c 77 ff ff ff    	jl     805151 <load_pe+0x50b>
                        }
                    }
                }
                iataddrs++;
  8051da:	48 83 45 d0 04       	add    QWORD PTR [rbp-0x30],0x4
                siataddrs++;
  8051df:	48 83 45 c8 08       	add    QWORD PTR [rbp-0x38],0x8
            while (*iataddrs)
  8051e4:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8051e8:	8b 00                	mov    eax,DWORD PTR [rax]
  8051ea:	85 c0                	test   eax,eax
  8051ec:	0f 85 f2 fe ff ff    	jne    8050e4 <load_pe+0x49e>
            }
            impdes++;
  8051f2:	48 83 45 e0 14       	add    QWORD PTR [rbp-0x20],0x14
        while (impdes->Characteristics)
  8051f7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8051fb:	8b 00                	mov    eax,DWORD PTR [rax]
  8051fd:	85 c0                	test   eax,eax
  8051ff:	0f 85 b4 fd ff ff    	jne    804fb9 <load_pe+0x373>
        }
    }


    //开始重定位
    PIMAGE_BASE_RELOCATION relp=0;
  805205:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  80520c:	00 
    if(nth->OptionalHeader.DataDirectory[5].Size>0)
  80520d:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805214:	8b 80 a4 00 00 00    	mov    eax,DWORD PTR [rax+0xa4]
  80521a:	85 c0                	test   eax,eax
  80521c:	0f 84 e8 00 00 00    	je     80530a <load_pe+0x6c4>
    {
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  805222:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805229:	8b 90 a0 00 00 00    	mov    edx,DWORD PTR [rax+0xa0]
  80522f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805232:	01 d0                	add    eax,edx
  805234:	89 c0                	mov    eax,eax
  805236:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
                                +(u32)nbase);
        u16 *reloc=relp+sizeof(IMAGE_BASE_RELOCATION);
  80523a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80523e:	48 83 c0 40          	add    rax,0x40
  805242:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        u16 *rtype=reloc+1;
  805246:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80524a:	48 83 c0 02          	add    rax,0x2
  80524e:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
        int old_base=nth->OptionalHeader.ImageBase;
  805252:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805259:	8b 40 34             	mov    eax,DWORD PTR [rax+0x34]
  80525c:	89 85 d4 fe ff ff    	mov    DWORD PTR [rbp-0x12c],eax
        while(relp->VirtualAddress){
  805262:	e9 95 00 00 00       	jmp    8052fc <load_pe+0x6b6>
            int pgva=relp->VirtualAddress+nbase;
  805267:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80526b:	8b 10                	mov    edx,DWORD PTR [rax]
  80526d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805270:	01 d0                	add    eax,edx
  805272:	89 85 d0 fe ff ff    	mov    DWORD PTR [rbp-0x130],eax
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  805278:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
  80527f:	eb 59                	jmp    8052da <load_pe+0x694>
            {
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  805281:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  805285:	0f b7 00             	movzx  eax,WORD PTR [rax]
  805288:	66 85 c0             	test   ax,ax
  80528b:	74 48                	je     8052d5 <load_pe+0x68f>
                int *at=*reloc+pgva;//要重定位的数据的地址
  80528d:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805291:	0f b7 00             	movzx  eax,WORD PTR [rax]
  805294:	0f b7 d0             	movzx  edx,ax
  805297:	8b 85 d0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x130]
  80529d:	01 d0                	add    eax,edx
  80529f:	48 98                	cdqe   
  8052a1:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
                *at=*at-old_base+nbase;
  8052a8:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  8052af:	8b 00                	mov    eax,DWORD PTR [rax]
  8052b1:	2b 85 d4 fe ff ff    	sub    eax,DWORD PTR [rbp-0x12c]
  8052b7:	89 c2                	mov    edx,eax
  8052b9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8052bc:	01 d0                	add    eax,edx
  8052be:	89 c2                	mov    edx,eax
  8052c0:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  8052c7:	89 10                	mov    DWORD PTR [rax],edx
                //下一个
                reloc+=2;
  8052c9:	48 83 45 b0 04       	add    QWORD PTR [rbp-0x50],0x4
                rtype+=2;
  8052ce:	48 83 45 a8 04       	add    QWORD PTR [rbp-0x58],0x4
  8052d3:	eb 01                	jmp    8052d6 <load_pe+0x690>
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  8052d5:	90                   	nop
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  8052d6:	83 45 a4 01          	add    DWORD PTR [rbp-0x5c],0x1
  8052da:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8052de:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8052e1:	c1 e8 02             	shr    eax,0x2
  8052e4:	89 c2                	mov    edx,eax
  8052e6:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  8052e9:	39 c2                	cmp    edx,eax
  8052eb:	77 94                	ja     805281 <load_pe+0x63b>
            }
            relp=(int)relp+0x1000;
  8052ed:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8052f1:	05 00 10 00 00       	add    eax,0x1000
  8052f6:	48 98                	cdqe   
  8052f8:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        while(relp->VirtualAddress){
  8052fc:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805300:	8b 00                	mov    eax,DWORD PTR [rax]
  805302:	85 c0                	test   eax,eax
  805304:	0f 85 5d ff ff ff    	jne    805267 <load_pe+0x621>
        }
    }
    extern struct process task[];
    extern int cur_proc;
    //初始化堆
    chunk_header hdrtmp={
  80530a:	c7 85 50 fd ff ff 00 	mov    DWORD PTR [rbp-0x2b0],0x0
  805311:	00 00 00 
  805314:	c7 85 54 fd ff ff 00 	mov    DWORD PTR [rbp-0x2ac],0x0
  80531b:	00 00 00 
  80531e:	48 c7 85 58 fd ff ff 	mov    QWORD PTR [rbp-0x2a8],0x0
  805325:	00 00 00 00 
  805329:	48 c7 85 60 fd ff ff 	mov    QWORD PTR [rbp-0x2a0],0x0
  805330:	00 00 00 00 
            .next=NULL,
            .pgn=0,
            .prev=NULL
    };//空堆
    //拷贝触发页中断然后分配
    memcpy((chunk_header*)HEAP_BASE,&hdrtmp,sizeof(hdrtmp));
  805334:	48 8d 85 50 fd ff ff 	lea    rax,[rbp-0x2b0]
  80533b:	ba 18 00 00 00       	mov    edx,0x18
  805340:	48 89 c6             	mov    rsi,rax
  805343:	bf 00 00 00 01       	mov    edi,0x1000000
  805348:	e8 d4 54 00 00       	call   80a821 <memcpy>
    task[cur_proc].mem_struct.heap_base=HEAP_BASE;
  80534d:	8b 05 d9 f1 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f1d9]        # 41452c <cur_proc>
  805353:	48 63 d0             	movsxd rdx,eax
  805356:	48 89 d0             	mov    rax,rdx
  805359:	48 01 c0             	add    rax,rax
  80535c:	48 01 d0             	add    rax,rdx
  80535f:	48 c1 e0 08          	shl    rax,0x8
  805363:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805369:	c7 40 04 00 00 00 01 	mov    DWORD PTR [rax+0x4],0x1000000
    task[cur_proc].mem_struct.heap_top=HEAP_BASE+CHUNK_SIZE;
  805370:	8b 05 b6 f1 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f1b6]        # 41452c <cur_proc>
  805376:	48 63 d0             	movsxd rdx,eax
  805379:	48 89 d0             	mov    rax,rdx
  80537c:	48 01 c0             	add    rax,rax
  80537f:	48 01 d0             	add    rax,rdx
  805382:	48 c1 e0 08          	shl    rax,0x8
  805386:	48 05 b0 84 40 00    	add    rax,0x4084b0
  80538c:	c7 40 08 00 10 00 01 	mov    DWORD PTR [rax+0x8],0x1001000


    //完毕,调用入口函数
    //重定位完毕，准备调用DllMain
    typedef int (*Main)(int,void*);
    Main main=shell_addr;
  805393:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  805399:	48 98                	cdqe   
  80539b:	48 89 85 c0 fe ff ff 	mov    QWORD PTR [rbp-0x140],rax
    task[cur_proc].exit_code=main(0,NULL);
  8053a2:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
  8053a9:	be 00 00 00 00       	mov    esi,0x0
  8053ae:	bf 00 00 00 00       	mov    edi,0x0
  8053b3:	ff d0                	call   rax
  8053b5:	8b 15 71 f1 c0 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc0f171]        # 41452c <cur_proc>
  8053bb:	89 c1                	mov    ecx,eax
  8053bd:	48 63 d2             	movsxd rdx,edx
  8053c0:	48 89 d0             	mov    rax,rdx
  8053c3:	48 01 c0             	add    rax,rax
  8053c6:	48 01 d0             	add    rax,rdx
  8053c9:	48 c1 e0 08          	shl    rax,0x8
  8053cd:	48 05 b0 84 40 00    	add    rax,0x4084b0
  8053d3:	89 08                	mov    DWORD PTR [rax],ecx
    return task[cur_proc].exit_code;
  8053d5:	8b 05 51 f1 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f151]        # 41452c <cur_proc>
  8053db:	48 63 d0             	movsxd rdx,eax
  8053de:	48 89 d0             	mov    rax,rdx
  8053e1:	48 01 c0             	add    rax,rax
  8053e4:	48 01 d0             	add    rax,rdx
  8053e7:	48 c1 e0 08          	shl    rax,0x8
  8053eb:	48 05 b0 84 40 00    	add    rax,0x4084b0
  8053f1:	8b 00                	mov    eax,DWORD PTR [rax]
}
  8053f3:	c9                   	leave  
  8053f4:	c3                   	ret    

00000000008053f5 <get_module_addr>:

int get_module_addr(int mi)
{
  8053f5:	f3 0f 1e fa          	endbr64 
  8053f9:	55                   	push   rbp
  8053fa:	48 89 e5             	mov    rbp,rsp
  8053fd:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return modules[mi].base;
  805400:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805403:	48 98                	cdqe   
  805405:	8b 04 c5 40 71 42 00 	mov    eax,DWORD PTR [rax*8+0x427140]
}
  80540c:	5d                   	pop    rbp
  80540d:	c3                   	ret    

000000000080540e <dispose_library>:
int dispose_library(int dlln)
{
  80540e:	f3 0f 1e fa          	endbr64 
  805412:	55                   	push   rbp
  805413:	48 89 e5             	mov    rbp,rsp
  805416:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if(dlln<0||dlln>=MAX_DLLS)return -1;
  805419:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80541d:	78 09                	js     805428 <dispose_library+0x1a>
  80541f:	81 7d fc ff 00 00 00 	cmp    DWORD PTR [rbp-0x4],0xff
  805426:	7e 07                	jle    80542f <dispose_library+0x21>
  805428:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80542d:	eb 1d                	jmp    80544c <dispose_library+0x3e>
    //空间不够，释放之前申请的
    // for(int j=0;j<dlls[dlln].page_used;j++)
    //     dispose_page(get_phyaddr(dlls[dlln].page_num[j]));
    //释放dll
    dlls[dlln].flag=DLL_STAT_EMPTY;
  80542f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805432:	48 98                	cdqe   
  805434:	48 69 c0 2c 01 00 00 	imul   rax,rax,0x12c
  80543b:	48 05 48 45 41 00    	add    rax,0x414548
  805441:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return 0;
  805447:	b8 00 00 00 00       	mov    eax,0x0
}
  80544c:	5d                   	pop    rbp
  80544d:	c3                   	ret    

000000000080544e <sys_insmod>:

    return 0;
} */

int sys_insmod(char *path)
{
  80544e:	f3 0f 1e fa          	endbr64 
  805452:	55                   	push   rbp
  805453:	48 89 e5             	mov    rbp,rsp
  805456:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  80545a:	90                   	nop
  80545b:	5d                   	pop    rbp
  80545c:	c3                   	ret    

000000000080545d <sys_rmmod>:
int sys_rmmod(char *name)
{
  80545d:	f3 0f 1e fa          	endbr64 
  805461:	55                   	push   rbp
  805462:	48 89 e5             	mov    rbp,rsp
  805465:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

  805469:	90                   	nop
  80546a:	5d                   	pop    rbp
  80546b:	c3                   	ret    
  80546c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000805470 <_syscall>:
  805470:	55                   	push   rbp
  805471:	bd 00 80 10 00       	mov    ebp,0x108000
  805476:	48 89 65 14          	mov    QWORD PTR [rbp+0x14],rsp
  80547a:	48 8b 65 04          	mov    rsp,QWORD PTR [rbp+0x4]
  80547e:	41 53                	push   r11
  805480:	51                   	push   rcx
  805481:	49 87 ca             	xchg   r10,rcx
  805484:	e8 11 b1 ff ff       	call   80059a <syscall>
  805489:	4c 87 d1             	xchg   rcx,r10
  80548c:	59                   	pop    rcx
  80548d:	41 5b                	pop    r11
  80548f:	48 89 65 04          	mov    QWORD PTR [rbp+0x4],rsp
  805493:	48 8b 65 14          	mov    rsp,QWORD PTR [rbp+0x14]
  805497:	5d                   	pop    rbp
  805498:	48 0f 07             	sysretq 

000000000080549b <init_framebuffer>:
static u32 font_width_bytes;
static u8 *glyph_table;
static u32 bytes_per_glyph, glyph_nr;
int font_size=1;
void init_framebuffer()
{
  80549b:	f3 0f 1e fa          	endbr64 
  80549f:	55                   	push   rbp
  8054a0:	48 89 e5             	mov    rbp,rsp
  8054a3:	48 83 ec 50          	sub    rsp,0x50
    //映射页帧内存
    size_t w=framebuffer.common.framebuffer_width;
  8054a7:	8b 05 a7 20 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc220a7]        # 427554 <framebuffer+0x14>
  8054ad:	89 c0                	mov    eax,eax
  8054af:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    size_t h=framebuffer.common.framebuffer_height;
  8054b3:	8b 05 9f 20 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2209f]        # 427558 <framebuffer+0x18>
  8054b9:	89 c0                	mov    eax,eax
  8054bb:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    size_t bypp=framebuffer.common.framebuffer_bpp/8;
  8054bf:	0f b6 05 96 20 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc22096]        # 42755c <framebuffer+0x1c>
  8054c6:	c0 e8 03             	shr    al,0x3
  8054c9:	0f b6 c0             	movzx  eax,al
  8054cc:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    size_t inter=framebuffer.common.framebuffer_pitch;
  8054d0:	8b 05 7a 20 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2207a]        # 427550 <framebuffer+0x10>
  8054d6:	89 c0                	mov    eax,eax
  8054d8:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    size_t pc=w*h;
  8054dc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8054e0:	48 0f af 45 d8       	imul   rax,QWORD PTR [rbp-0x28]
  8054e5:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    size_t size=h*inter;
  8054e9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8054ed:	48 0f af 45 c8       	imul   rax,QWORD PTR [rbp-0x38]
  8054f2:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    int pgc=size/PAGE_SIZE;
  8054f6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8054fa:	48 c1 e8 0c          	shr    rax,0xc
  8054fe:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    addr_t p=FRAMEBUFFER_ADDR;
  805501:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x40000000
  805508:	40 
    addr_t pp=framebuffer.common.framebuffer_addr;
  805509:	48 8b 05 38 20 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22038]        # 427548 <framebuffer+0x8>
  805510:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for (size_t i = 0; i < pgc; i++)
  805514:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80551b:	00 
  80551c:	eb 2d                	jmp    80554b <init_framebuffer+0xb0>
    {
        mmap(pp,p,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  80551e:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  805522:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805526:	ba 07 00 00 00       	mov    edx,0x7
  80552b:	48 89 ce             	mov    rsi,rcx
  80552e:	48 89 c7             	mov    rdi,rax
  805531:	e8 74 b9 ff ff       	call   800eaa <mmap>
        pp+=PAGE_SIZE;
  805536:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  80553d:	00 
        p+=PAGE_SIZE;
  80553e:	48 81 45 f8 00 10 00 	add    QWORD PTR [rbp-0x8],0x1000
  805545:	00 
    for (size_t i = 0; i < pgc; i++)
  805546:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  80554b:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80554e:	48 98                	cdqe   
  805550:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  805554:	72 c8                	jb     80551e <init_framebuffer+0x83>
    }
    
    
}
  805556:	90                   	nop
  805557:	90                   	nop
  805558:	c9                   	leave  
  805559:	c3                   	ret    

000000000080555a <init_font>:
void init_font(){
  80555a:	f3 0f 1e fa          	endbr64 
  80555e:	55                   	push   rbp
  80555f:	48 89 e5             	mov    rbp,rsp
    boot_font = (struct psf2_header*) _binary_res_font_psf_start;
  805562:	48 c7 05 13 20 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22013],0x80b500        # 427580 <boot_font>
  805569:	00 b5 80 00 

    font_width_bytes = (boot_font->width + 7) / 8;
  80556d:	48 8b 05 0c 20 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2200c]        # 427580 <boot_font>
  805574:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  805577:	83 c0 07             	add    eax,0x7
  80557a:	c1 e8 03             	shr    eax,0x3
  80557d:	89 05 0d 20 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2200d],eax        # 427590 <font_width_bytes>
    font_width = font_width_bytes * 8;
  805583:	8b 05 07 20 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22007]        # 427590 <font_width_bytes>
  805589:	c1 e0 03             	shl    eax,0x3
  80558c:	89 05 f6 1f c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21ff6],eax        # 427588 <font_width>
    font_height = boot_font->height;
  805592:	48 8b 05 e7 1f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21fe7]        # 427580 <boot_font>
  805599:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  80559c:	89 05 ea 1f c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21fea],eax        # 42758c <font_height>

    glyph_table = (u8*)_binary_res_font_psf_start+boot_font->header_size;
  8055a2:	48 8b 05 d7 1f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21fd7]        # 427580 <boot_font>
  8055a9:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8055ac:	89 c0                	mov    eax,eax
  8055ae:	48 05 00 b5 80 00    	add    rax,0x80b500
  8055b4:	48 89 05 dd 1f c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21fdd],rax        # 427598 <glyph_table>
    glyph_nr = boot_font->glyph_nr;
  8055bb:	48 8b 05 be 1f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21fbe]        # 427580 <boot_font>
  8055c2:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8055c5:	89 05 d9 1f c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21fd9],eax        # 4275a4 <glyph_nr>
    bytes_per_glyph = boot_font->bytes_per_glyph;
  8055cb:	48 8b 05 ae 1f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21fae]        # 427580 <boot_font>
  8055d2:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  8055d5:	89 05 c5 1f c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21fc5],eax        # 4275a0 <bytes_per_glyph>

    fb_cursor_x = fb_cursor_y = 0;
  8055db:	c7 05 8b 1f c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc21f8b],0x0        # 427570 <fb_cursor_y>
  8055e2:	00 00 00 
  8055e5:	8b 05 85 1f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21f85]        # 427570 <fb_cursor_y>
  8055eb:	89 05 7b 1f c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21f7b],eax        # 42756c <fb_cursor_x>
    max_ch_nr_x = framebuffer.common.framebuffer_width / font_width;
  8055f1:	8b 05 5d 1f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21f5d]        # 427554 <framebuffer+0x14>
  8055f7:	8b 0d 8b 1f c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc21f8b]        # 427588 <font_width>
  8055fd:	ba 00 00 00 00       	mov    edx,0x0
  805602:	f7 f1                	div    ecx
  805604:	89 05 6a 1f c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21f6a],eax        # 427574 <max_ch_nr_x>
    max_ch_nr_y = framebuffer.common.framebuffer_height / font_height;
  80560a:	8b 05 48 1f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21f48]        # 427558 <framebuffer+0x18>
  805610:	8b 35 76 1f c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc21f76]        # 42758c <font_height>
  805616:	ba 00 00 00 00       	mov    edx,0x0
  80561b:	f7 f6                	div    esi
  80561d:	89 05 55 1f c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21f55],eax        # 427578 <max_ch_nr_y>
    font_size=1;
  805623:	c7 05 23 5c 00 00 01 	mov    DWORD PTR [rip+0x5c23],0x1        # 80b250 <font_size>
  80562a:	00 00 00 
}
  80562d:	90                   	nop
  80562e:	5d                   	pop    rbp
  80562f:	c3                   	ret    

0000000000805630 <set_framebuffer>:
void set_framebuffer(struct multiboot_tag_framebuffer tag)
{
  805630:	f3 0f 1e fa          	endbr64 
  805634:	55                   	push   rbp
  805635:	48 89 e5             	mov    rbp,rsp
    framebuffer=tag;
  805638:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  80563c:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  805640:	48 89 05 f9 1e c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21ef9],rax        # 427540 <framebuffer>
  805647:	48 89 15 fa 1e c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21efa],rdx        # 427548 <framebuffer+0x8>
  80564e:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
  805652:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  805656:	48 89 05 f3 1e c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21ef3],rax        # 427550 <framebuffer+0x10>
  80565d:	48 89 15 f4 1e c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21ef4],rdx        # 427558 <framebuffer+0x18>
  805664:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
  805668:	48 89 05 f1 1e c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21ef1],rax        # 427560 <framebuffer+0x20>
}
  80566f:	90                   	nop
  805670:	5d                   	pop    rbp
  805671:	c3                   	ret    

0000000000805672 <fill_rect>:

void fill_rect(int x,int y,int w,int h,unsigned int color){
  805672:	f3 0f 1e fa          	endbr64 
  805676:	55                   	push   rbp
  805677:	48 89 e5             	mov    rbp,rsp
  80567a:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  80567d:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  805680:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  805683:	89 4d d0             	mov    DWORD PTR [rbp-0x30],ecx
  805686:	44 89 45 cc          	mov    DWORD PTR [rbp-0x34],r8d
    unsigned int* fb= (unsigned int*) FRAMEBUFFER_ADDR;
  80568a:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x40000000
  805691:	40 
    //目前只写32bpp
    for(int py=x;py<h+x;py++){
  805692:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805695:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805698:	eb 64                	jmp    8056fe <fill_rect+0x8c>
        for(int px=y;px<w+y;px++){
  80569a:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  80569d:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  8056a0:	eb 4b                	jmp    8056ed <fill_rect+0x7b>
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  8056a2:	8b 15 a8 1e c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21ea8]        # 427550 <framebuffer+0x10>
  8056a8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8056ab:	0f af c2             	imul   eax,edx
  8056ae:	89 c1                	mov    ecx,eax
                       +px*framebuffer.common.framebuffer_bpp/8;
  8056b0:	0f b6 05 a5 1e c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21ea5]        # 42755c <framebuffer+0x1c>
  8056b7:	0f b6 c0             	movzx  eax,al
  8056ba:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  8056be:	8d 50 07             	lea    edx,[rax+0x7]
  8056c1:	85 c0                	test   eax,eax
  8056c3:	0f 48 c2             	cmovs  eax,edx
  8056c6:	c1 f8 03             	sar    eax,0x3
  8056c9:	48 98                	cdqe   
  8056cb:	48 01 c8             	add    rax,rcx
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  8056ce:	48 05 00 00 00 40    	add    rax,0x40000000
  8056d4:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
            fb=(unsigned int*)ptr;
  8056d8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8056dc:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *fb=color;
  8056e0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8056e4:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  8056e7:	89 10                	mov    DWORD PTR [rax],edx
        for(int px=y;px<w+y;px++){
  8056e9:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8056ed:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  8056f0:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  8056f3:	01 d0                	add    eax,edx
  8056f5:	39 45 f8             	cmp    DWORD PTR [rbp-0x8],eax
  8056f8:	7c a8                	jl     8056a2 <fill_rect+0x30>
    for(int py=x;py<h+x;py++){
  8056fa:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8056fe:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
  805701:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805704:	01 d0                	add    eax,edx
  805706:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  805709:	7c 8f                	jl     80569a <fill_rect+0x28>
        }
    }
}
  80570b:	90                   	nop
  80570c:	90                   	nop
  80570d:	5d                   	pop    rbp
  80570e:	c3                   	ret    

000000000080570f <draw_text>:
unsigned char letters[];
void draw_text(int x, int y, int size, char *str)
{
  80570f:	f3 0f 1e fa          	endbr64 
  805713:	55                   	push   rbp
  805714:	48 89 e5             	mov    rbp,rsp
  805717:	48 83 ec 30          	sub    rsp,0x30
  80571b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80571e:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  805721:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  805724:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    int tx=x;
  805728:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80572b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    while(*str!='\0')
  80572e:	eb 5a                	jmp    80578a <draw_text+0x7b>
    {
        if(*str=='\n')
  805730:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805734:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805737:	3c 0a                	cmp    al,0xa
  805739:	75 1c                	jne    805757 <draw_text+0x48>
        {
            y+=font_height*size;
  80573b:	8b 15 4b 1e c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21e4b]        # 42758c <font_height>
  805741:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  805744:	0f af d0             	imul   edx,eax
  805747:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80574a:	01 d0                	add    eax,edx
  80574c:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            tx=x;
  80574f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805752:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805755:	eb 2e                	jmp    805785 <draw_text+0x76>
        }
        else
        {
            draw_letter(tx,y,size,*str);
  805757:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80575b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80575e:	0f be c8             	movsx  ecx,al
  805761:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  805764:	8b 75 e8             	mov    esi,DWORD PTR [rbp-0x18]
  805767:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80576a:	89 c7                	mov    edi,eax
  80576c:	e8 28 00 00 00       	call   805799 <draw_letter>
            tx+=size*font_width;
  805771:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  805774:	8b 05 0e 1e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21e0e]        # 427588 <font_width>
  80577a:	0f af d0             	imul   edx,eax
  80577d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805780:	01 d0                	add    eax,edx
  805782:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        }
        str++;
  805785:	48 83 45 d8 01       	add    QWORD PTR [rbp-0x28],0x1
    while(*str!='\0')
  80578a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80578e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805791:	84 c0                	test   al,al
  805793:	75 9b                	jne    805730 <draw_text+0x21>
    }
}
  805795:	90                   	nop
  805796:	90                   	nop
  805797:	c9                   	leave  
  805798:	c3                   	ret    

0000000000805799 <draw_letter>:
void draw_letter(int x, volatile int y, int size, char c) {
  805799:	f3 0f 1e fa          	endbr64 
  80579d:	55                   	push   rbp
  80579e:	48 89 e5             	mov    rbp,rsp
  8057a1:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
  8057a4:	89 75 c8             	mov    DWORD PTR [rbp-0x38],esi
  8057a7:	89 55 c4             	mov    DWORD PTR [rbp-0x3c],edx
  8057aa:	89 c8                	mov    eax,ecx
  8057ac:	88 45 c0             	mov    BYTE PTR [rbp-0x40],al
    u8 *glyph = glyph_table;
  8057af:	48 8b 05 e2 1d c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21de2]        # 427598 <glyph_table>
  8057b6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if (c < glyph_nr) {
  8057ba:	0f be 55 c0          	movsx  edx,BYTE PTR [rbp-0x40]
  8057be:	8b 05 e0 1d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21de0]        # 4275a4 <glyph_nr>
  8057c4:	39 c2                	cmp    edx,eax
  8057c6:	73 13                	jae    8057db <draw_letter+0x42>
        glyph += c * bytes_per_glyph;
  8057c8:	0f be 55 c0          	movsx  edx,BYTE PTR [rbp-0x40]
  8057cc:	8b 05 ce 1d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21dce]        # 4275a0 <bytes_per_glyph>
  8057d2:	0f af c2             	imul   eax,edx
  8057d5:	89 c0                	mov    eax,eax
  8057d7:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    }
    /* output the font to frame buffer */
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  8057db:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8057e2:	e9 cb 00 00 00       	jmp    8058b2 <draw_letter+0x119>
        u8 mask = 1 << 7;
  8057e7:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80

        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  8057eb:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8057f2:	e9 9c 00 00 00       	jmp    805893 <draw_letter+0xfa>
            int px=x+ch_x*size;
  8057f7:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8057fa:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  8057fe:	89 c2                	mov    edx,eax
  805800:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805803:	01 d0                	add    eax,edx
  805805:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            int py=y+ch_y*size;
  805808:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80580b:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  80580f:	89 c2                	mov    edx,eax
  805811:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  805814:	01 d0                	add    eax,edx
  805816:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
            int* ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  805819:	8b 15 31 1d c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21d31]        # 427550 <framebuffer+0x10>
  80581f:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  805822:	0f af c2             	imul   eax,edx
  805825:	89 c1                	mov    ecx,eax
                     +px*framebuffer.common.framebuffer_bpp/8;
  805827:	0f b6 05 2e 1d c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21d2e]        # 42755c <framebuffer+0x1c>
  80582e:	0f b6 c0             	movzx  eax,al
  805831:	0f af 45 e8          	imul   eax,DWORD PTR [rbp-0x18]
  805835:	8d 50 07             	lea    edx,[rax+0x7]
  805838:	85 c0                	test   eax,eax
  80583a:	0f 48 c2             	cmovs  eax,edx
  80583d:	c1 f8 03             	sar    eax,0x3
  805840:	48 98                	cdqe   
  805842:	48 01 c8             	add    rax,rcx
  805845:	48 05 00 00 00 40    	add    rax,0x40000000
            int* ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  80584b:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            if ((*(glyph + ch_x / 8) & mask) != 0) {
  80584f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805852:	c1 e8 03             	shr    eax,0x3
  805855:	89 c2                	mov    edx,eax
  805857:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80585b:	48 01 d0             	add    rax,rdx
  80585e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805861:	22 45 f3             	and    al,BYTE PTR [rbp-0xd]
  805864:	84 c0                	test   al,al
  805866:	74 0c                	je     805874 <draw_letter+0xdb>
                *ptr=-1;
  805868:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80586c:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
  805872:	eb 0a                	jmp    80587e <draw_letter+0xe5>
            } else {
                *ptr=0;
  805874:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805878:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            }

            mask >>= 1;
  80587e:	d0 6d f3             	shr    BYTE PTR [rbp-0xd],1
            if (ch_x % 8 == 0) {
  805881:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805884:	83 e0 07             	and    eax,0x7
  805887:	85 c0                	test   eax,eax
  805889:	75 04                	jne    80588f <draw_letter+0xf6>
                mask = 1 << 7;
  80588b:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80
        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  80588f:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  805893:	8b 05 ef 1c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21cef]        # 427588 <font_width>
  805899:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80589c:	0f 82 55 ff ff ff    	jb     8057f7 <draw_letter+0x5e>
            }
        }

        glyph += font_width_bytes;
  8058a2:	8b 05 e8 1c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21ce8]        # 427590 <font_width_bytes>
  8058a8:	89 c0                	mov    eax,eax
  8058aa:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  8058ae:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8058b2:	8b 05 d4 1c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21cd4]        # 42758c <font_height>
  8058b8:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  8058bb:	0f 82 26 ff ff ff    	jb     8057e7 <draw_letter+0x4e>
    }
}
  8058c1:	90                   	nop
  8058c2:	90                   	nop
  8058c3:	5d                   	pop    rbp
  8058c4:	c3                   	ret    

00000000008058c5 <scr_up>:
//向上滚动一个像素
void scr_up(){
  8058c5:	f3 0f 1e fa          	endbr64 
  8058c9:	55                   	push   rbp
  8058ca:	48 89 e5             	mov    rbp,rsp
    for(int dy=0;dy<framebuffer.common.framebuffer_height-1;dy++){
  8058cd:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8058d4:	eb 71                	jmp    805947 <scr_up+0x82>
        for(int dx=0;dx<framebuffer.common.framebuffer_width;dx++){
  8058d6:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8058dd:	eb 57                	jmp    805936 <scr_up+0x71>
            char *p=(char*)(FRAMEBUFFER_ADDR+
                    dy*framebuffer.common.framebuffer_pitch
  8058df:	8b 15 6b 1c c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21c6b]        # 427550 <framebuffer+0x10>
  8058e5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8058e8:	0f af c2             	imul   eax,edx
  8058eb:	89 c1                	mov    ecx,eax
                    +dx*framebuffer.common.framebuffer_bpp/8);
  8058ed:	0f b6 05 68 1c c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21c68]        # 42755c <framebuffer+0x1c>
  8058f4:	0f b6 c0             	movzx  eax,al
  8058f7:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  8058fb:	8d 50 07             	lea    edx,[rax+0x7]
  8058fe:	85 c0                	test   eax,eax
  805900:	0f 48 c2             	cmovs  eax,edx
  805903:	c1 f8 03             	sar    eax,0x3
  805906:	48 98                	cdqe   
  805908:	48 01 c8             	add    rax,rcx
  80590b:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+
  805911:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p+framebuffer.common.framebuffer_pitch);
  805915:	8b 05 35 1c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21c35]        # 427550 <framebuffer+0x10>
  80591b:	89 c2                	mov    edx,eax
  80591d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805921:	48 01 d0             	add    rax,rdx
  805924:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  805927:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80592b:	88 10                	mov    BYTE PTR [rax],dl
            p++;
  80592d:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        for(int dx=0;dx<framebuffer.common.framebuffer_width;dx++){
  805932:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805936:	8b 15 18 1c c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21c18]        # 427554 <framebuffer+0x14>
  80593c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80593f:	39 c2                	cmp    edx,eax
  805941:	77 9c                	ja     8058df <scr_up+0x1a>
    for(int dy=0;dy<framebuffer.common.framebuffer_height-1;dy++){
  805943:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805947:	8b 05 0b 1c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21c0b]        # 427558 <framebuffer+0x18>
  80594d:	8d 50 ff             	lea    edx,[rax-0x1]
  805950:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805953:	39 c2                	cmp    edx,eax
  805955:	0f 87 7b ff ff ff    	ja     8058d6 <scr_up+0x11>
        }

    }
//    for(int i=0;i< framebuffer.common.framebuffer_width*framebuffer.common.framebuffer_bpp/8;i++)
//        *(p++)=0;
}
  80595b:	90                   	nop
  80595c:	90                   	nop
  80595d:	5d                   	pop    rbp
  80595e:	c3                   	ret    

000000000080595f <scr_down>:
void scr_down(){
  80595f:	f3 0f 1e fa          	endbr64 
  805963:	55                   	push   rbp
  805964:	48 89 e5             	mov    rbp,rsp
    for(int dy=1;dy<max_ch_nr_y;dy++){
  805967:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
  80596e:	eb 72                	jmp    8059e2 <scr_down+0x83>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  805970:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805977:	eb 58                	jmp    8059d1 <scr_down+0x72>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  805979:	8b 15 d1 1b c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21bd1]        # 427550 <framebuffer+0x10>
  80597f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805982:	0f af c2             	imul   eax,edx
  805985:	89 c1                	mov    ecx,eax
                            +dx*framebuffer.common.framebuffer_bpp/8);
  805987:	0f b6 05 ce 1b c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21bce]        # 42755c <framebuffer+0x1c>
  80598e:	0f b6 c0             	movzx  eax,al
  805991:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  805995:	8d 50 07             	lea    edx,[rax+0x7]
  805998:	85 c0                	test   eax,eax
  80599a:	0f 48 c2             	cmovs  eax,edx
  80599d:	c1 f8 03             	sar    eax,0x3
  8059a0:	48 98                	cdqe   
  8059a2:	48 01 c8             	add    rax,rcx
  8059a5:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  8059ab:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p-framebuffer.common.framebuffer_pitch);
  8059af:	8b 05 9b 1b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21b9b]        # 427550 <framebuffer+0x10>
  8059b5:	89 c0                	mov    eax,eax
  8059b7:	48 f7 d8             	neg    rax
  8059ba:	48 89 c2             	mov    rdx,rax
  8059bd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8059c1:	48 01 d0             	add    rax,rdx
  8059c4:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  8059c7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8059cb:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  8059cd:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8059d1:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  8059d4:	8b 05 9a 1b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21b9a]        # 427574 <max_ch_nr_x>
  8059da:	39 c2                	cmp    edx,eax
  8059dc:	72 9b                	jb     805979 <scr_down+0x1a>
    for(int dy=1;dy<max_ch_nr_y;dy++){
  8059de:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8059e2:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8059e5:	8b 05 8d 1b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21b8d]        # 427578 <max_ch_nr_y>
  8059eb:	39 c2                	cmp    edx,eax
  8059ed:	72 81                	jb     805970 <scr_down+0x11>
        }

    }
}
  8059ef:	90                   	nop
  8059f0:	90                   	nop
  8059f1:	5d                   	pop    rbp
  8059f2:	c3                   	ret    

00000000008059f3 <print>:
void print(char* s){
  8059f3:	f3 0f 1e fa          	endbr64 
  8059f7:	55                   	push   rbp
  8059f8:	48 89 e5             	mov    rbp,rsp
  8059fb:	48 83 ec 08          	sub    rsp,0x8
  8059ff:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    for(;*s;s++){
  805a03:	e9 c4 00 00 00       	jmp    805acc <print+0xd9>
        if(fb_cursor_x>max_ch_nr_x||*s=='\n')
  805a08:	8b 15 5e 1b c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21b5e]        # 42756c <fb_cursor_x>
  805a0e:	8b 05 60 1b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21b60]        # 427574 <max_ch_nr_x>
  805a14:	39 c2                	cmp    edx,eax
  805a16:	77 0b                	ja     805a23 <print+0x30>
  805a18:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805a1c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805a1f:	3c 0a                	cmp    al,0xa
  805a21:	75 19                	jne    805a3c <print+0x49>
        {
            fb_cursor_y+=1;
  805a23:	8b 05 47 1b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21b47]        # 427570 <fb_cursor_y>
  805a29:	83 c0 01             	add    eax,0x1
  805a2c:	89 05 3e 1b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21b3e],eax        # 427570 <fb_cursor_y>
            fb_cursor_x=0;
  805a32:	c7 05 30 1b c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc21b30],0x0        # 42756c <fb_cursor_x>
  805a39:	00 00 00 
        }
        if(*s=='\n')continue;
  805a3c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805a40:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805a43:	3c 0a                	cmp    al,0xa
  805a45:	74 7f                	je     805ac6 <print+0xd3>
        if(fb_cursor_y>=max_ch_nr_y-1){
  805a47:	8b 05 2b 1b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21b2b]        # 427578 <max_ch_nr_y>
  805a4d:	8d 50 ff             	lea    edx,[rax-0x1]
  805a50:	8b 05 1a 1b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21b1a]        # 427570 <fb_cursor_y>
  805a56:	39 c2                	cmp    edx,eax
  805a58:	77 0a                	ja     805a64 <print+0x71>
//            for(int i=0;i<font_height*font_size;i++)
////                scr_up();
////            fb_cursor_y=max_ch_nr_y-1;
            fb_cursor_y=0;
  805a5a:	c7 05 0c 1b c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc21b0c],0x0        # 427570 <fb_cursor_y>
  805a61:	00 00 00 
        }
        draw_letter(fb_cursor_x*font_width*font_size,fb_cursor_y*font_height*font_size,font_size,*s);
  805a64:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805a68:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805a6b:	0f be d0             	movsx  edx,al
  805a6e:	8b 05 dc 57 00 00    	mov    eax,DWORD PTR [rip+0x57dc]        # 80b250 <font_size>
  805a74:	8b 35 f6 1a c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc21af6]        # 427570 <fb_cursor_y>
  805a7a:	8b 0d 0c 1b c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc21b0c]        # 42758c <font_height>
  805a80:	0f af ce             	imul   ecx,esi
  805a83:	8b 35 c7 57 00 00    	mov    esi,DWORD PTR [rip+0x57c7]        # 80b250 <font_size>
  805a89:	0f af ce             	imul   ecx,esi
  805a8c:	41 89 c8             	mov    r8d,ecx
  805a8f:	8b 35 d7 1a c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc21ad7]        # 42756c <fb_cursor_x>
  805a95:	8b 0d ed 1a c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc21aed]        # 427588 <font_width>
  805a9b:	0f af ce             	imul   ecx,esi
  805a9e:	8b 35 ac 57 00 00    	mov    esi,DWORD PTR [rip+0x57ac]        # 80b250 <font_size>
  805aa4:	0f af ce             	imul   ecx,esi
  805aa7:	89 cf                	mov    edi,ecx
  805aa9:	89 d1                	mov    ecx,edx
  805aab:	89 c2                	mov    edx,eax
  805aad:	44 89 c6             	mov    esi,r8d
  805ab0:	e8 e4 fc ff ff       	call   805799 <draw_letter>
        fb_cursor_x+=1;
  805ab5:	8b 05 b1 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21ab1]        # 42756c <fb_cursor_x>
  805abb:	83 c0 01             	add    eax,0x1
  805abe:	89 05 a8 1a c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21aa8],eax        # 42756c <fb_cursor_x>
  805ac4:	eb 01                	jmp    805ac7 <print+0xd4>
        if(*s=='\n')continue;
  805ac6:	90                   	nop
    for(;*s;s++){
  805ac7:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  805acc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805ad0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805ad3:	84 c0                	test   al,al
  805ad5:	0f 85 2d ff ff ff    	jne    805a08 <print+0x15>
    }
}
  805adb:	90                   	nop
  805adc:	90                   	nop
  805add:	c9                   	leave  
  805ade:	c3                   	ret    

0000000000805adf <path_walk>:
#include "errno.h"
#include "memory.h"
#include "log.h"

struct dir_entry * path_walk(char * name,unsigned long flags)
{
  805adf:	f3 0f 1e fa          	endbr64 
  805ae3:	55                   	push   rbp
  805ae4:	48 89 e5             	mov    rbp,rsp
  805ae7:	48 83 ec 50          	sub    rsp,0x50
  805aeb:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  805aef:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
    char * tmpname = NULL;
  805af3:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  805afa:	00 
    int tmpnamelen = 0;
  805afb:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    struct dir_entry * parent = root_sb->root;
  805b02:	48 8b 05 9f 1a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21a9f]        # 4275a8 <root_sb>
  805b09:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805b0c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    struct dir_entry * path = NULL;
  805b10:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  805b17:	00 

    while(*name == '/')
  805b18:	eb 05                	jmp    805b1f <path_walk+0x40>
        name++;
  805b1a:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
    while(*name == '/')
  805b1f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805b23:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805b26:	3c 2f                	cmp    al,0x2f
  805b28:	74 f0                	je     805b1a <path_walk+0x3b>

    if(!*name)
  805b2a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805b2e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805b31:	84 c0                	test   al,al
  805b33:	75 09                	jne    805b3e <path_walk+0x5f>
    {
        return parent;
  805b35:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805b39:	e9 1b 02 00 00       	jmp    805d59 <path_walk+0x27a>
    }

    for(;;)
    {
        tmpname = name;
  805b3e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805b42:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        while(*name && (*name != '/'))
  805b46:	eb 05                	jmp    805b4d <path_walk+0x6e>
            name++;
  805b48:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
        while(*name && (*name != '/'))
  805b4d:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805b51:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805b54:	84 c0                	test   al,al
  805b56:	74 0b                	je     805b63 <path_walk+0x84>
  805b58:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805b5c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805b5f:	3c 2f                	cmp    al,0x2f
  805b61:	75 e5                	jne    805b48 <path_walk+0x69>
        tmpnamelen = name - tmpname;
  805b63:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805b67:	48 2b 45 f0          	sub    rax,QWORD PTR [rbp-0x10]
  805b6b:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

        path = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  805b6e:	be 00 00 00 00       	mov    esi,0x0
  805b73:	bf 48 00 00 00       	mov    edi,0x48
  805b78:	b8 00 00 00 00       	mov    eax,0x0
  805b7d:	e8 73 b5 ff ff       	call   8010f5 <vmalloc>
  805b82:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        memset(path,0,sizeof(struct dir_entry));
  805b86:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805b8a:	ba 48 00 00 00       	mov    edx,0x48
  805b8f:	be 00 00 00 00       	mov    esi,0x0
  805b94:	48 89 c7             	mov    rdi,rax
  805b97:	e8 34 4d 00 00       	call   80a8d0 <memset>

        path->name = vmalloc(tmpnamelen+1,0);
  805b9c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805b9f:	83 c0 01             	add    eax,0x1
  805ba2:	be 00 00 00 00       	mov    esi,0x0
  805ba7:	89 c7                	mov    edi,eax
  805ba9:	b8 00 00 00 00       	mov    eax,0x0
  805bae:	e8 42 b5 ff ff       	call   8010f5 <vmalloc>
  805bb3:	48 89 c2             	mov    rdx,rax
  805bb6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805bba:	48 89 10             	mov    QWORD PTR [rax],rdx
        memset(path->name,0,tmpnamelen+1);
  805bbd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805bc0:	83 c0 01             	add    eax,0x1
  805bc3:	48 63 d0             	movsxd rdx,eax
  805bc6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805bca:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805bcd:	be 00 00 00 00       	mov    esi,0x0
  805bd2:	48 89 c7             	mov    rdi,rax
  805bd5:	e8 f6 4c 00 00       	call   80a8d0 <memset>
        memcpy(tmpname,path->name,tmpnamelen);
  805bda:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805bdd:	48 63 d0             	movsxd rdx,eax
  805be0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805be4:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  805be7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805beb:	48 89 ce             	mov    rsi,rcx
  805bee:	48 89 c7             	mov    rdi,rax
  805bf1:	e8 2b 4c 00 00       	call   80a821 <memcpy>
        path->name_length = tmpnamelen;
  805bf6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805bfa:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  805bfd:	89 50 08             	mov    DWORD PTR [rax+0x8],edx

        if(parent->dir_inode->inode_ops->lookup(parent->dir_inode,path) == NULL)
  805c00:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805c04:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  805c08:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  805c0c:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  805c10:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805c14:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  805c18:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  805c1c:	48 89 d6             	mov    rsi,rdx
  805c1f:	48 89 c7             	mov    rdi,rax
  805c22:	ff d1                	call   rcx
  805c24:	48 85 c0             	test   rax,rax
  805c27:	75 3e                	jne    805c67 <path_walk+0x188>
        {
            printf("can not find file or dir:%s\n",path->name);
  805c29:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805c2d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805c30:	48 89 c6             	mov    rsi,rax
  805c33:	bf 30 2e 81 00       	mov    edi,0x812e30
  805c38:	b8 00 00 00 00       	mov    eax,0x0
  805c3d:	e8 9b b0 ff ff       	call   800cdd <printf>
            vmfree(path->name);
  805c42:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805c46:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805c49:	48 89 c7             	mov    rdi,rax
  805c4c:	e8 33 b5 ff ff       	call   801184 <vmfree>
            vmfree(path);
  805c51:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805c55:	48 89 c7             	mov    rdi,rax
  805c58:	e8 27 b5 ff ff       	call   801184 <vmfree>
            return NULL;
  805c5d:	b8 00 00 00 00       	mov    eax,0x0
  805c62:	e9 f2 00 00 00       	jmp    805d59 <path_walk+0x27a>
        }

        list_init(&path->child_node);
  805c67:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805c6b:	48 83 c0 10          	add    rax,0x10
  805c6f:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    struct List * next;
};

__attribute__((always_inline)) inline void list_init(struct List * list)
{
    list->prev = list;
  805c73:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805c77:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  805c7b:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  805c7e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805c82:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  805c86:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  805c8a:	90                   	nop
        list_init(&path->subdirs_list);
  805c8b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805c8f:	48 83 c0 20          	add    rax,0x20
  805c93:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    list->prev = list;
  805c97:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  805c9b:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  805c9f:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  805ca2:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  805ca6:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  805caa:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  805cae:	90                   	nop
        path->parent = parent;
  805caf:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805cb3:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  805cb7:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
        list_add_to_behind(&parent->subdirs_list,&path->child_node);
  805cbb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805cbf:	48 83 c0 10          	add    rax,0x10
  805cc3:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  805cc7:	48 83 c2 20          	add    rdx,0x20
  805ccb:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  805ccf:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

__attribute__((always_inline)) inline void list_add_to_behind(struct List * entry,struct List * new)	////add to entry behind
{
    new->next = entry->next;
  805cd3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805cd7:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  805cdb:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805cdf:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    new->prev = entry;
  805ce3:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805ce7:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  805ceb:	48 89 10             	mov    QWORD PTR [rax],rdx
    new->next->prev = new;
  805cee:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805cf2:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  805cf6:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  805cfa:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  805cfd:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805d01:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  805d05:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  805d09:	90                   	nop

        if(!*name)
  805d0a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805d0e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805d11:	84 c0                	test   al,al
  805d13:	74 2a                	je     805d3f <path_walk+0x260>
            goto last_component;
        while(*name == '/')
  805d15:	eb 05                	jmp    805d1c <path_walk+0x23d>
            name++;
  805d17:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
        while(*name == '/')
  805d1c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805d20:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805d23:	3c 2f                	cmp    al,0x2f
  805d25:	74 f0                	je     805d17 <path_walk+0x238>
        if(!*name)
  805d27:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805d2b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805d2e:	84 c0                	test   al,al
  805d30:	74 10                	je     805d42 <path_walk+0x263>
            goto last_slash;

        parent = path;
  805d32:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805d36:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    {
  805d3a:	e9 ff fd ff ff       	jmp    805b3e <path_walk+0x5f>
            goto last_component;
  805d3f:	90                   	nop
  805d40:	eb 01                	jmp    805d43 <path_walk+0x264>
            goto last_slash;
  805d42:	90                   	nop
    }

    last_slash:
    last_component:

    if(flags & 1)
  805d43:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805d47:	83 e0 01             	and    eax,0x1
  805d4a:	48 85 c0             	test   rax,rax
  805d4d:	74 06                	je     805d55 <path_walk+0x276>
    {
        return parent;
  805d4f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805d53:	eb 04                	jmp    805d59 <path_walk+0x27a>
    }

    return path;
  805d55:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  805d59:	c9                   	leave  
  805d5a:	c3                   	ret    

0000000000805d5b <fill_dentry>:

int fill_dentry(void *buf,char *name, long namelen,long type,long offset)
{
  805d5b:	f3 0f 1e fa          	endbr64 
  805d5f:	55                   	push   rbp
  805d60:	48 89 e5             	mov    rbp,rsp
  805d63:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  805d67:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  805d6b:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  805d6f:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  805d73:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
//
//    memcpy(name,dent->d_name,namelen);
//    dent->d_namelen = namelen;
//    dent->d_type = type;
//    dent->d_offset = offset;
    return sizeof(struct dirent) + namelen;
  805d77:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805d7b:	83 c0 18             	add    eax,0x18
}
  805d7e:	5d                   	pop    rbp
  805d7f:	c3                   	ret    

0000000000805d80 <mount_fs>:
//function mount_root
struct super_block * root_sb = NULL;
struct file_system_type filesystem = {"filesystem",0};

struct super_block* mount_fs(char * name,struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  805d80:	f3 0f 1e fa          	endbr64 
  805d84:	55                   	push   rbp
  805d85:	48 89 e5             	mov    rbp,rsp
  805d88:	48 83 ec 30          	sub    rsp,0x30
  805d8c:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  805d90:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  805d94:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file_system_type * p = NULL;
  805d98:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  805d9f:	00 

    for(p = &filesystem;p;p = p->next)
  805da0:	48 c7 45 f8 60 b2 80 	mov    QWORD PTR [rbp-0x8],0x80b260
  805da7:	00 
  805da8:	eb 40                	jmp    805dea <mount_fs+0x6a>
        if(!strcmp(p->name,name))
  805daa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805dae:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805db1:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  805db5:	48 89 d6             	mov    rsi,rdx
  805db8:	48 89 c7             	mov    rdi,rax
  805dbb:	e8 ff 4c 00 00       	call   80aabf <strcmp>
  805dc0:	85 c0                	test   eax,eax
  805dc2:	75 1a                	jne    805dde <mount_fs+0x5e>
        {
            return p->read_superblock(DPTE,buf);
  805dc4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805dc8:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  805dcc:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  805dd0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805dd4:	48 89 d6             	mov    rsi,rdx
  805dd7:	48 89 c7             	mov    rdi,rax
  805dda:	ff d1                	call   rcx
  805ddc:	eb 18                	jmp    805df6 <mount_fs+0x76>
    for(p = &filesystem;p;p = p->next)
  805dde:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805de2:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  805de6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  805dea:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  805def:	75 b9                	jne    805daa <mount_fs+0x2a>
        }
    return 0;
  805df1:	b8 00 00 00 00       	mov    eax,0x0
}
  805df6:	c9                   	leave  
  805df7:	c3                   	ret    

0000000000805df8 <register_filesystem>:

unsigned long register_filesystem(struct file_system_type * fs)
{
  805df8:	f3 0f 1e fa          	endbr64 
  805dfc:	55                   	push   rbp
  805dfd:	48 89 e5             	mov    rbp,rsp
  805e00:	48 83 ec 20          	sub    rsp,0x20
  805e04:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = NULL;
  805e08:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  805e0f:	00 

    for(p = &filesystem;p;p = p->next)
  805e10:	48 c7 45 f8 60 b2 80 	mov    QWORD PTR [rbp-0x8],0x80b260
  805e17:	00 
  805e18:	eb 30                	jmp    805e4a <register_filesystem+0x52>
        if(!strcmp(fs->name,p->name))
  805e1a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805e1e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  805e21:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805e25:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805e28:	48 89 d6             	mov    rsi,rdx
  805e2b:	48 89 c7             	mov    rdi,rax
  805e2e:	e8 8c 4c 00 00       	call   80aabf <strcmp>
  805e33:	85 c0                	test   eax,eax
  805e35:	75 07                	jne    805e3e <register_filesystem+0x46>
            return 0;
  805e37:	b8 00 00 00 00       	mov    eax,0x0
  805e3c:	eb 32                	jmp    805e70 <register_filesystem+0x78>
    for(p = &filesystem;p;p = p->next)
  805e3e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805e42:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  805e46:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  805e4a:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  805e4f:	75 c9                	jne    805e1a <register_filesystem+0x22>

    fs->next = filesystem.next;
  805e51:	48 8b 15 20 54 00 00 	mov    rdx,QWORD PTR [rip+0x5420]        # 80b278 <filesystem+0x18>
  805e58:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805e5c:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    filesystem.next = fs;
  805e60:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805e64:	48 89 05 0d 54 00 00 	mov    QWORD PTR [rip+0x540d],rax        # 80b278 <filesystem+0x18>

    return 1;
  805e6b:	b8 01 00 00 00       	mov    eax,0x1
}
  805e70:	c9                   	leave  
  805e71:	c3                   	ret    

0000000000805e72 <unregister_filesystem>:

unsigned long unregister_filesystem(struct file_system_type * fs)
{
  805e72:	f3 0f 1e fa          	endbr64 
  805e76:	55                   	push   rbp
  805e77:	48 89 e5             	mov    rbp,rsp
  805e7a:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = &filesystem;
  805e7e:	48 c7 45 f8 60 b2 80 	mov    QWORD PTR [rbp-0x8],0x80b260
  805e85:	00 

    while(p->next)
  805e86:	eb 41                	jmp    805ec9 <unregister_filesystem+0x57>
        if(p->next == fs)
  805e88:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805e8c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  805e90:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  805e94:	75 27                	jne    805ebd <unregister_filesystem+0x4b>
        {
            p->next = p->next->next;
  805e96:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805e9a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  805e9e:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  805ea2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805ea6:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
            fs->next = NULL;
  805eaa:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805eae:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  805eb5:	00 
            return 1;
  805eb6:	b8 01 00 00 00       	mov    eax,0x1
  805ebb:	eb 1e                	jmp    805edb <unregister_filesystem+0x69>
        }
        else
            p = p->next;
  805ebd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805ec1:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  805ec5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p->next)
  805ec9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805ecd:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  805ed1:	48 85 c0             	test   rax,rax
  805ed4:	75 b2                	jne    805e88 <unregister_filesystem+0x16>
    return 0;
  805ed6:	b8 00 00 00 00       	mov    eax,0x0
}
  805edb:	5d                   	pop    rbp
  805edc:	c3                   	ret    

0000000000805edd <sys_putstring>:
#include "syscall.h"
#include "int.h"


unsigned long sys_putstring(char *string)
{
  805edd:	f3 0f 1e fa          	endbr64 
  805ee1:	55                   	push   rbp
  805ee2:	48 89 e5             	mov    rbp,rsp
  805ee5:	48 83 ec 10          	sub    rsp,0x10
  805ee9:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    printf(string);
  805eed:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805ef1:	48 89 c7             	mov    rdi,rax
  805ef4:	b8 00 00 00 00       	mov    eax,0x0
  805ef9:	e8 df ad ff ff       	call   800cdd <printf>
    return 0;
  805efe:	b8 00 00 00 00       	mov    eax,0x0
}
  805f03:	c9                   	leave  
  805f04:	c3                   	ret    

0000000000805f05 <sys_open>:

unsigned long sys_open(char *filename,int flags)
{
  805f05:	f3 0f 1e fa          	endbr64 
  805f09:	55                   	push   rbp
  805f0a:	48 89 e5             	mov    rbp,rsp
  805f0d:	48 83 ec 50          	sub    rsp,0x50
  805f11:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  805f15:	89 75 b4             	mov    DWORD PTR [rbp-0x4c],esi
    char * path = NULL;
  805f18:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  805f1f:	00 
    long pathlen = 0;
  805f20:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  805f27:	00 
    long error = 0;
  805f28:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  805f2f:	00 
    struct dir_entry * dentry = NULL;
  805f30:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  805f37:	00 
    struct file * filp = NULL;
  805f38:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  805f3f:	00 
    struct file ** f = NULL;
  805f40:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  805f47:	00 
    int fd = -1;
  805f48:	c7 45 f4 ff ff ff ff 	mov    DWORD PTR [rbp-0xc],0xffffffff
    int i;

//	printf("sys_open\n");
    path = (char *)vmalloc();
  805f4f:	b8 00 00 00 00       	mov    eax,0x0
  805f54:	e8 9c b1 ff ff       	call   8010f5 <vmalloc>
  805f59:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    if(path == NULL)
  805f5d:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  805f62:	75 0c                	jne    805f70 <sys_open+0x6b>
        return -ENOMEM;
  805f64:	48 c7 c0 cf ff ff ff 	mov    rax,0xffffffffffffffcf
  805f6b:	e9 aa 02 00 00       	jmp    80621a <sys_open+0x315>
    memset(path,0,PAGE_4K_SIZE);
  805f70:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805f74:	ba 00 10 00 00       	mov    edx,0x1000
  805f79:	be 00 00 00 00       	mov    esi,0x0
  805f7e:	48 89 c7             	mov    rdi,rax
  805f81:	e8 4a 49 00 00       	call   80a8d0 <memset>
    pathlen = strlen(filename);
  805f86:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805f8a:	48 89 c7             	mov    rdi,rax
  805f8d:	e8 ac 4b 00 00       	call   80ab3e <strlen>
  805f92:	48 98                	cdqe   
  805f94:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(pathlen <= 0)
  805f98:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  805f9d:	7f 18                	jg     805fb7 <sys_open+0xb2>
    {
        vmfree(path);
  805f9f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805fa3:	48 89 c7             	mov    rdi,rax
  805fa6:	e8 d9 b1 ff ff       	call   801184 <vmfree>
        return -EFAULT;
  805fab:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  805fb2:	e9 63 02 00 00       	jmp    80621a <sys_open+0x315>
    }
    else if(pathlen >= PAGE_4K_SIZE)
  805fb7:	48 81 7d e0 ff 0f 00 	cmp    QWORD PTR [rbp-0x20],0xfff
  805fbe:	00 
  805fbf:	7e 18                	jle    805fd9 <sys_open+0xd4>
    {
        vmfree(path);
  805fc1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805fc5:	48 89 c7             	mov    rdi,rax
  805fc8:	e8 b7 b1 ff ff       	call   801184 <vmfree>
        return -ENAMETOOLONG;
  805fcd:	48 c7 c0 db ff ff ff 	mov    rax,0xffffffffffffffdb
  805fd4:	e9 41 02 00 00       	jmp    80621a <sys_open+0x315>
    }
    strcpy(filename,path);
  805fd9:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  805fdd:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805fe1:	48 89 d6             	mov    rsi,rdx
  805fe4:	48 89 c7             	mov    rdi,rax
  805fe7:	e8 33 49 00 00       	call   80a91f <strcpy>

    dentry = path_walk(path,0);
  805fec:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805ff0:	be 00 00 00 00       	mov    esi,0x0
  805ff5:	48 89 c7             	mov    rdi,rax
  805ff8:	e8 e2 fa ff ff       	call   805adf <path_walk>
  805ffd:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    vmfree(path);
  806001:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806005:	48 89 c7             	mov    rdi,rax
  806008:	e8 77 b1 ff ff       	call   801184 <vmfree>

    if(dentry == NULL)
  80600d:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  806012:	75 0c                	jne    806020 <sys_open+0x11b>
        return -ENOENT;
  806014:	48 c7 c0 d3 ff ff ff 	mov    rax,0xffffffffffffffd3
  80601b:	e9 fa 01 00 00       	jmp    80621a <sys_open+0x315>

    if((flags & O_DIRECTORY) && (dentry->dir_inode->attribute != FS_ATTR_DIR))
  806020:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  806023:	25 00 40 00 00       	and    eax,0x4000
  806028:	85 c0                	test   eax,eax
  80602a:	74 1e                	je     80604a <sys_open+0x145>
  80602c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806030:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806034:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806038:	48 83 f8 02          	cmp    rax,0x2
  80603c:	74 0c                	je     80604a <sys_open+0x145>
        return -ENOTDIR;
  80603e:	48 c7 c0 c7 ff ff ff 	mov    rax,0xffffffffffffffc7
  806045:	e9 d0 01 00 00       	jmp    80621a <sys_open+0x315>
    if(!(flags & O_DIRECTORY) && (dentry->dir_inode->attribute == FS_ATTR_DIR))
  80604a:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80604d:	25 00 40 00 00       	and    eax,0x4000
  806052:	85 c0                	test   eax,eax
  806054:	75 1e                	jne    806074 <sys_open+0x16f>
  806056:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80605a:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80605e:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806062:	48 83 f8 02          	cmp    rax,0x2
  806066:	75 0c                	jne    806074 <sys_open+0x16f>
        return -EISDIR;
  806068:	48 c7 c0 e1 ff ff ff 	mov    rax,0xffffffffffffffe1
  80606f:	e9 a6 01 00 00       	jmp    80621a <sys_open+0x315>

    filp = (struct file *)vmalloc();
  806074:	b8 00 00 00 00       	mov    eax,0x0
  806079:	e8 77 b0 ff ff       	call   8010f5 <vmalloc>
  80607e:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    memset(filp,0,sizeof(struct file));
  806082:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806086:	ba 28 00 00 00       	mov    edx,0x28
  80608b:	be 00 00 00 00       	mov    esi,0x0
  806090:	48 89 c7             	mov    rdi,rax
  806093:	e8 38 48 00 00       	call   80a8d0 <memset>
    filp->dentry = dentry;
  806098:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80609c:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8060a0:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    filp->mode = flags;
  8060a4:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8060a7:	48 63 d0             	movsxd rdx,eax
  8060aa:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8060ae:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx

    if(dentry->dir_inode->attribute & FS_ATTR_DEVICE)
  8060b2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8060b6:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8060ba:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8060be:	83 e0 04             	and    eax,0x4
  8060c1:	48 85 c0             	test   rax,rax
  8060c4:	74 0e                	je     8060d4 <sys_open+0x1cf>
        filp->f_ops = NULL;//&keyboard_fops;	//////	find device file operation function
  8060c6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8060ca:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  8060d1:	00 
  8060d2:	eb 14                	jmp    8060e8 <sys_open+0x1e3>
    else
        filp->f_ops = dentry->dir_inode->f_ops;
  8060d4:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8060d8:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8060dc:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  8060e0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8060e4:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    if(filp->f_ops && filp->f_ops->open)
  8060e8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8060ec:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8060f0:	48 85 c0             	test   rax,rax
  8060f3:	74 33                	je     806128 <sys_open+0x223>
  8060f5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8060f9:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8060fd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806100:	48 85 c0             	test   rax,rax
  806103:	74 23                	je     806128 <sys_open+0x223>
        error = filp->f_ops->open(dentry->dir_inode,filp);
  806105:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806109:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80610d:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  806110:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806114:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806118:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80611c:	48 89 d6             	mov    rsi,rdx
  80611f:	48 89 c7             	mov    rdi,rax
  806122:	ff d1                	call   rcx
  806124:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(error != 1)
  806128:	48 83 7d f8 01       	cmp    QWORD PTR [rbp-0x8],0x1
  80612d:	74 18                	je     806147 <sys_open+0x242>
    {
        vmfree(filp);
  80612f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806133:	48 89 c7             	mov    rdi,rax
  806136:	e8 49 b0 ff ff       	call   801184 <vmfree>
        return -EFAULT;
  80613b:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  806142:	e9 d3 00 00 00       	jmp    80621a <sys_open+0x315>
    }

    if(filp->mode & O_TRUNC)
  806147:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80614b:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80614f:	25 00 02 00 00       	and    eax,0x200
  806154:	48 85 c0             	test   rax,rax
  806157:	74 13                	je     80616c <sys_open+0x267>
    {
        filp->dentry->dir_inode->file_size = 0;
  806159:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80615d:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806161:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806165:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }
    if(filp->mode & O_APPEND)
  80616c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806170:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  806174:	25 00 04 00 00       	and    eax,0x400
  806179:	48 85 c0             	test   rax,rax
  80617c:	74 19                	je     806197 <sys_open+0x292>
    {
        filp->position = filp->dentry->dir_inode->file_size;
  80617e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806182:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806186:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80618a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80618d:	48 89 c2             	mov    rdx,rax
  806190:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806194:	48 89 10             	mov    QWORD PTR [rax],rdx
    }

    f = current->openf;
  806197:	48 8b 05 02 e3 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e302]        # 4144a0 <current>
  80619e:	48 05 c4 00 00 00    	add    rax,0xc4
  8061a4:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    for(i = 0;i < MAX_TASKS;i++)
  8061a8:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  8061af:	eb 28                	jmp    8061d9 <sys_open+0x2d4>
        if(f[i] == NULL)
  8061b1:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8061b4:	48 98                	cdqe   
  8061b6:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8061bd:	00 
  8061be:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8061c2:	48 01 d0             	add    rax,rdx
  8061c5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8061c8:	48 85 c0             	test   rax,rax
  8061cb:	75 08                	jne    8061d5 <sys_open+0x2d0>
        {
            fd = i;
  8061cd:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8061d0:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            break;
  8061d3:	eb 0a                	jmp    8061df <sys_open+0x2da>
    for(i = 0;i < MAX_TASKS;i++)
  8061d5:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  8061d9:	83 7d f0 1f          	cmp    DWORD PTR [rbp-0x10],0x1f
  8061dd:	7e d2                	jle    8061b1 <sys_open+0x2ac>
        }
    if(i == MAX_TASKS)
  8061df:	83 7d f0 20          	cmp    DWORD PTR [rbp-0x10],0x20
  8061e3:	75 15                	jne    8061fa <sys_open+0x2f5>
    {
        vmfree(filp);
  8061e5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8061e9:	48 89 c7             	mov    rdi,rax
  8061ec:	e8 93 af ff ff       	call   801184 <vmfree>
        //// reclaim struct index_node & struct dir_entry
        return -EMFILE;
  8061f1:	48 c7 c0 df ff ff ff 	mov    rax,0xffffffffffffffdf
  8061f8:	eb 20                	jmp    80621a <sys_open+0x315>
    }
    f[fd] = filp;
  8061fa:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8061fd:	48 98                	cdqe   
  8061ff:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806206:	00 
  806207:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80620b:	48 01 c2             	add    rdx,rax
  80620e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806212:	48 89 02             	mov    QWORD PTR [rdx],rax

    return fd;
  806215:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806218:	48 98                	cdqe   
}
  80621a:	c9                   	leave  
  80621b:	c3                   	ret    

000000000080621c <sys_close>:

unsigned long sys_close(int fd)
{
  80621c:	f3 0f 1e fa          	endbr64 
  806220:	55                   	push   rbp
  806221:	48 89 e5             	mov    rbp,rsp
  806224:	48 83 ec 20          	sub    rsp,0x20
  806228:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    struct file * filp = NULL;
  80622b:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  806232:	00 

//	printf("sys_close:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  806233:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  806237:	78 06                	js     80623f <sys_close+0x23>
  806239:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  80623d:	7e 0c                	jle    80624b <sys_close+0x2f>
        return -EBADF;
  80623f:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  806246:	e9 87 00 00 00       	jmp    8062d2 <sys_close+0xb6>

    filp = current->openf[fd];
  80624b:	48 8b 05 4e e2 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e24e]        # 4144a0 <current>
  806252:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  806255:	48 63 d2             	movsxd rdx,edx
  806258:	48 83 c2 18          	add    rdx,0x18
  80625c:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  806261:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(filp->f_ops && filp->f_ops->close)
  806265:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806269:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80626d:	48 85 c0             	test   rax,rax
  806270:	74 35                	je     8062a7 <sys_close+0x8b>
  806272:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806276:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80627a:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80627e:	48 85 c0             	test   rax,rax
  806281:	74 24                	je     8062a7 <sys_close+0x8b>
        filp->f_ops->close(filp->dentry->dir_inode,filp);
  806283:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806287:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80628b:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  80628f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806293:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806297:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80629b:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80629f:	48 89 d6             	mov    rsi,rdx
  8062a2:	48 89 c7             	mov    rdi,rax
  8062a5:	ff d1                	call   rcx

    vmfree(filp);
  8062a7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8062ab:	48 89 c7             	mov    rdi,rax
  8062ae:	e8 d1 ae ff ff       	call   801184 <vmfree>
    current->openf[fd] = NULL;
  8062b3:	48 8b 05 e6 e1 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e1e6]        # 4144a0 <current>
  8062ba:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8062bd:	48 63 d2             	movsxd rdx,edx
  8062c0:	48 83 c2 18          	add    rdx,0x18
  8062c4:	48 c7 44 d0 04 00 00 	mov    QWORD PTR [rax+rdx*8+0x4],0x0
  8062cb:	00 00 

    return 0;
  8062cd:	b8 00 00 00 00       	mov    eax,0x0
}
  8062d2:	c9                   	leave  
  8062d3:	c3                   	ret    

00000000008062d4 <sys_read>:

unsigned long sys_read(int fd,void * buf,long count)
{
  8062d4:	f3 0f 1e fa          	endbr64 
  8062d8:	55                   	push   rbp
  8062d9:	48 89 e5             	mov    rbp,rsp
  8062dc:	48 83 ec 30          	sub    rsp,0x30
  8062e0:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8062e3:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8062e7:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  8062eb:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8062f2:	00 
    unsigned long ret = 0;
  8062f3:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8062fa:	00 

//	printf("sys_read:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  8062fb:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8062ff:	78 06                	js     806307 <sys_read+0x33>
  806301:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  806305:	7e 09                	jle    806310 <sys_read+0x3c>
        return -EBADF;
  806307:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  80630e:	eb 72                	jmp    806382 <sys_read+0xae>
    if(count < 0)
  806310:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  806315:	79 09                	jns    806320 <sys_read+0x4c>
        return -EINVAL;
  806317:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  80631e:	eb 62                	jmp    806382 <sys_read+0xae>

    filp = current->openf[fd];
  806320:	48 8b 05 79 e1 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e179]        # 4144a0 <current>
  806327:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80632a:	48 63 d2             	movsxd rdx,edx
  80632d:	48 83 c2 18          	add    rdx,0x18
  806331:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  806336:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->read)
  80633a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80633e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806342:	48 85 c0             	test   rax,rax
  806345:	74 37                	je     80637e <sys_read+0xaa>
  806347:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80634b:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80634f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806353:	48 85 c0             	test   rax,rax
  806356:	74 26                	je     80637e <sys_read+0xaa>
        ret = filp->f_ops->read(filp,buf,count,&filp->position);
  806358:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80635c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806360:	4c 8b 40 10          	mov    r8,QWORD PTR [rax+0x10]
  806364:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  806368:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80636c:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  806370:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806374:	48 89 c7             	mov    rdi,rax
  806377:	41 ff d0             	call   r8
  80637a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  80637e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  806382:	c9                   	leave  
  806383:	c3                   	ret    

0000000000806384 <sys_write>:

unsigned long sys_write(int fd,void * buf,long count)
{
  806384:	f3 0f 1e fa          	endbr64 
  806388:	55                   	push   rbp
  806389:	48 89 e5             	mov    rbp,rsp
  80638c:	48 83 ec 30          	sub    rsp,0x30
  806390:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806393:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  806397:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  80639b:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8063a2:	00 
    unsigned long ret = 0;
  8063a3:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8063aa:	00 

//	printf("sys_write:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  8063ab:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8063af:	78 06                	js     8063b7 <sys_write+0x33>
  8063b1:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  8063b5:	7e 09                	jle    8063c0 <sys_write+0x3c>
        return -EBADF;
  8063b7:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  8063be:	eb 72                	jmp    806432 <sys_write+0xae>
    if(count < 0)
  8063c0:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  8063c5:	79 09                	jns    8063d0 <sys_write+0x4c>
        return -EINVAL;
  8063c7:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  8063ce:	eb 62                	jmp    806432 <sys_write+0xae>

    filp = current->openf[fd];
  8063d0:	48 8b 05 c9 e0 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e0c9]        # 4144a0 <current>
  8063d7:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8063da:	48 63 d2             	movsxd rdx,edx
  8063dd:	48 83 c2 18          	add    rdx,0x18
  8063e1:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  8063e6:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->write)
  8063ea:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8063ee:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8063f2:	48 85 c0             	test   rax,rax
  8063f5:	74 37                	je     80642e <sys_write+0xaa>
  8063f7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8063fb:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8063ff:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806403:	48 85 c0             	test   rax,rax
  806406:	74 26                	je     80642e <sys_write+0xaa>
        ret = filp->f_ops->write(filp,buf,count,&filp->position);
  806408:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80640c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806410:	4c 8b 40 18          	mov    r8,QWORD PTR [rax+0x18]
  806414:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  806418:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80641c:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  806420:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806424:	48 89 c7             	mov    rdi,rax
  806427:	41 ff d0             	call   r8
  80642a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  80642e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  806432:	c9                   	leave  
  806433:	c3                   	ret    

0000000000806434 <sys_lseek>:


unsigned long sys_lseek(int filds,long offset,int whence)
{
  806434:	f3 0f 1e fa          	endbr64 
  806438:	55                   	push   rbp
  806439:	48 89 e5             	mov    rbp,rsp
  80643c:	48 83 ec 20          	sub    rsp,0x20
  806440:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806443:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  806447:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    struct file * filp = NULL;
  80644a:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  806451:	00 
    unsigned long ret = 0;
  806452:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  806459:	00 

//	printf("sys_lseek:%d\n",filds);
    if(filds < 0 || filds >= MAX_TASKS)
  80645a:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80645e:	78 06                	js     806466 <sys_lseek+0x32>
  806460:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  806464:	7e 09                	jle    80646f <sys_lseek+0x3b>
        return -EBADF;
  806466:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  80646d:	eb 78                	jmp    8064e7 <sys_lseek+0xb3>
    if(whence < 0 || whence >= SEEK_MAX)
  80646f:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  806473:	78 06                	js     80647b <sys_lseek+0x47>
  806475:	83 7d e8 02          	cmp    DWORD PTR [rbp-0x18],0x2
  806479:	7e 09                	jle    806484 <sys_lseek+0x50>
        return -EINVAL;
  80647b:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  806482:	eb 63                	jmp    8064e7 <sys_lseek+0xb3>

    filp = current->openf[filds];
  806484:	48 8b 05 15 e0 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0e015]        # 4144a0 <current>
  80648b:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80648e:	48 63 d2             	movsxd rdx,edx
  806491:	48 83 c2 18          	add    rdx,0x18
  806495:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  80649a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->lseek)
  80649e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8064a2:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8064a6:	48 85 c0             	test   rax,rax
  8064a9:	74 38                	je     8064e3 <sys_lseek+0xaf>
  8064ab:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8064af:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8064b3:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  8064b7:	48 85 c0             	test   rax,rax
  8064ba:	74 27                	je     8064e3 <sys_lseek+0xaf>
        ret = filp->f_ops->lseek(filp,offset,whence);
  8064bc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8064c0:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8064c4:	4c 8b 40 20          	mov    r8,QWORD PTR [rax+0x20]
  8064c8:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8064cb:	48 63 d0             	movsxd rdx,eax
  8064ce:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  8064d2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8064d6:	48 89 ce             	mov    rsi,rcx
  8064d9:	48 89 c7             	mov    rdi,rax
  8064dc:	41 ff d0             	call   r8
  8064df:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  8064e3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  8064e7:	c9                   	leave  
  8064e8:	c3                   	ret    

00000000008064e9 <sys_fork>:

unsigned long sys_fork()
{
  8064e9:	f3 0f 1e fa          	endbr64 
  8064ed:	55                   	push   rbp
  8064ee:	48 89 e5             	mov    rbp,rsp
  8064f1:	48 83 ec 10          	sub    rsp,0x10
    TSS *regs = (TSS*)current->tss.rsp0 -1;
  8064f5:	48 8b 05 a4 df c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0dfa4]        # 4144a0 <current>
  8064fc:	48 8b 80 c8 01 00 00 	mov    rax,QWORD PTR [rax+0x1c8]
  806503:	48 83 e8 6c          	sub    rax,0x6c
  806507:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    printf("sys_fork\n");
  80650b:	bf 58 2e 81 00       	mov    edi,0x812e58
  806510:	b8 00 00 00 00       	mov    eax,0x0
  806515:	e8 c3 a7 ff ff       	call   800cdd <printf>
    //return do_fork(regs,0,regs->rsp,0);
}
  80651a:	90                   	nop
  80651b:	c9                   	leave  
  80651c:	c3                   	ret    

000000000080651d <sys_vfork>:

unsigned long sys_vfork()
{
  80651d:	f3 0f 1e fa          	endbr64 
  806521:	55                   	push   rbp
  806522:	48 89 e5             	mov    rbp,rsp
  806525:	48 83 ec 10          	sub    rsp,0x10
    regs_t *regs = (regs_t *)current->tss.rsp0 -1;
  806529:	48 8b 05 70 df c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0df70]        # 4144a0 <current>
  806530:	48 8b 80 c8 01 00 00 	mov    rax,QWORD PTR [rax+0x1c8]
  806537:	48 2d d0 00 00 00    	sub    rax,0xd0
  80653d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    printf("sys_vfork\n");
  806541:	bf 62 2e 81 00       	mov    edi,0x812e62
  806546:	b8 00 00 00 00       	mov    eax,0x0
  80654b:	e8 8d a7 ff ff       	call   800cdd <printf>
    //return do_fork(regs,CLONE_VM | CLONE_FS | CLONE_SIGNAL,regs->rsp,0);
}
  806550:	90                   	nop
  806551:	c9                   	leave  
  806552:	c3                   	ret    

0000000000806553 <sys_execve>:

unsigned long sys_execve()
{
  806553:	f3 0f 1e fa          	endbr64 
  806557:	55                   	push   rbp
  806558:	48 89 e5             	mov    rbp,rsp
  80655b:	48 83 ec 20          	sub    rsp,0x20
    char * pathname = NULL;
  80655f:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  806566:	00 
    long pathlen = 0;
  806567:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80656e:	00 
    long error = 0;
  80656f:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  806576:	00 
    regs_t *regs = (regs_t *)current->tss.rsp0 -1;
  806577:	48 8b 05 22 df c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0df22]        # 4144a0 <current>
  80657e:	48 8b 80 c8 01 00 00 	mov    rax,QWORD PTR [rax+0x1c8]
  806585:	48 2d d0 00 00 00    	sub    rax,0xd0
  80658b:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax

    printf("sys_execve\n");
  80658f:	bf 6d 2e 81 00       	mov    edi,0x812e6d
  806594:	b8 00 00 00 00       	mov    eax,0x0
  806599:	e8 3f a7 ff ff       	call   800cdd <printf>
    pathname = (char *)vmalloc();
  80659e:	b8 00 00 00 00       	mov    eax,0x0
  8065a3:	e8 4d ab ff ff       	call   8010f5 <vmalloc>
  8065a8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(pathname == NULL)
  8065ac:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8065b1:	75 0c                	jne    8065bf <sys_execve+0x6c>
        return -ENOMEM;
  8065b3:	48 c7 c0 cf ff ff ff 	mov    rax,0xffffffffffffffcf
  8065ba:	e9 a3 00 00 00       	jmp    806662 <sys_execve+0x10f>
    memset(pathname,0,PAGE_4K_SIZE);
  8065bf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8065c3:	ba 00 10 00 00       	mov    edx,0x1000
  8065c8:	be 00 00 00 00       	mov    esi,0x0
  8065cd:	48 89 c7             	mov    rdi,rax
  8065d0:	e8 fb 42 00 00       	call   80a8d0 <memset>
    pathlen = strlen((char *)regs->rdi);
  8065d5:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8065d9:	48 8b 40 50          	mov    rax,QWORD PTR [rax+0x50]
  8065dd:	48 89 c7             	mov    rdi,rax
  8065e0:	e8 59 45 00 00       	call   80ab3e <strlen>
  8065e5:	48 98                	cdqe   
  8065e7:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(pathlen <= 0)
  8065eb:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  8065f0:	7f 15                	jg     806607 <sys_execve+0xb4>
    {
        vmfree(pathname);
  8065f2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8065f6:	48 89 c7             	mov    rdi,rax
  8065f9:	e8 86 ab ff ff       	call   801184 <vmfree>
        return -EFAULT;
  8065fe:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  806605:	eb 5b                	jmp    806662 <sys_execve+0x10f>
    }
    else if(pathlen >= PAGE_4K_SIZE)
  806607:	48 81 7d f0 ff 0f 00 	cmp    QWORD PTR [rbp-0x10],0xfff
  80660e:	00 
  80660f:	7e 15                	jle    806626 <sys_execve+0xd3>
    {
        vmfree(pathname);
  806611:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806615:	48 89 c7             	mov    rdi,rax
  806618:	e8 67 ab ff ff       	call   801184 <vmfree>
        return -ENAMETOOLONG;
  80661d:	48 c7 c0 db ff ff ff 	mov    rax,0xffffffffffffffdb
  806624:	eb 3c                	jmp    806662 <sys_execve+0x10f>
    }
    strcpy((char *)regs->rdi,pathname);
  806626:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80662a:	48 8b 40 50          	mov    rax,QWORD PTR [rax+0x50]
  80662e:	48 89 c2             	mov    rdx,rax
  806631:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806635:	48 89 c6             	mov    rsi,rax
  806638:	48 89 d7             	mov    rdi,rdx
  80663b:	e8 df 42 00 00       	call   80a91f <strcpy>

    error = execute(pathname);//regs,pathname,(char **)regs->rsi,NULL
  806640:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806644:	48 89 c7             	mov    rdi,rax
  806647:	e8 43 e4 ff ff       	call   804a8f <execute>
  80664c:	48 98                	cdqe   
  80664e:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax

    vmfree(pathname);
  806652:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806656:	48 89 c7             	mov    rdi,rax
  806659:	e8 26 ab ff ff       	call   801184 <vmfree>
    return error;
  80665e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
}
  806662:	c9                   	leave  
  806663:	c3                   	ret    

0000000000806664 <sys_wait4>:
/*
	rusage reserved
*/

unsigned long sys_wait4(unsigned long pid,int *status,int options,void *rusage)
{
  806664:	f3 0f 1e fa          	endbr64 
  806668:	55                   	push   rbp
  806669:	48 89 e5             	mov    rbp,rsp
  80666c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  806670:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  806674:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  806677:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
//    copy_to_user(&child->exit_code,status,sizeof(long));
//    tsk->next = child->next;
//    exit_mm(child);
//    vmfree(child);
//    return retval;
}
  80667b:	90                   	nop
  80667c:	5d                   	pop    rbp
  80667d:	c3                   	ret    

000000000080667e <sys_brk>:

unsigned long sys_brk(unsigned long brk)
{
  80667e:	f3 0f 1e fa          	endbr64 
  806682:	55                   	push   rbp
  806683:	48 89 e5             	mov    rbp,rsp
  806686:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//
//    new_brk = do_brk(current->mm->end_brk,new_brk - current->mm->end_brk);	//expand brk space
//
//    current->mm->end_brk = new_brk;
//    return new_brk;
}
  80668a:	90                   	nop
  80668b:	5d                   	pop    rbp
  80668c:	c3                   	ret    

000000000080668d <sys_reboot>:

unsigned long sys_reboot(unsigned long cmd,void * arg)
{
  80668d:	f3 0f 1e fa          	endbr64 
  806691:	55                   	push   rbp
  806692:	48 89 e5             	mov    rbp,rsp
  806695:	48 83 ec 10          	sub    rsp,0x10
  806699:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80669d:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    printf("sys_reboot\n");
  8066a1:	bf 79 2e 81 00       	mov    edi,0x812e79
  8066a6:	b8 00 00 00 00       	mov    eax,0x0
  8066ab:	e8 2d a6 ff ff       	call   800cdd <printf>
    switch(cmd)
  8066b0:	48 83 7d f8 01       	cmp    QWORD PTR [rbp-0x8],0x1
  8066b5:	74 09                	je     8066c0 <sys_reboot+0x33>
  8066b7:	48 83 7d f8 02       	cmp    QWORD PTR [rbp-0x8],0x2
  8066bc:	74 13                	je     8066d1 <sys_reboot+0x44>
  8066be:	eb 22                	jmp    8066e2 <sys_reboot+0x55>
    {
        case SYSTEM_REBOOT:
            outb(0x64,0xFE);
  8066c0:	be fe 00 00 00       	mov    esi,0xfe
  8066c5:	bf 64 00 00 00       	mov    edi,0x64
  8066ca:	e8 e1 e0 ff ff       	call   8047b0 <outb>
            break;
  8066cf:	eb 21                	jmp    8066f2 <sys_reboot+0x65>

        case SYSTEM_POWEROFF:
            printf("sys_reboot cmd SYSTEM_POWEROFF\n");
  8066d1:	bf 88 2e 81 00       	mov    edi,0x812e88
  8066d6:	b8 00 00 00 00       	mov    eax,0x0
  8066db:	e8 fd a5 ff ff       	call   800cdd <printf>
            break;
  8066e0:	eb 10                	jmp    8066f2 <sys_reboot+0x65>

        default:
            printf("sys_reboot cmd ERROR!\n");
  8066e2:	bf a8 2e 81 00       	mov    edi,0x812ea8
  8066e7:	b8 00 00 00 00       	mov    eax,0x0
  8066ec:	e8 ec a5 ff ff       	call   800cdd <printf>
            break;
  8066f1:	90                   	nop
    }
    return 0;
  8066f2:	b8 00 00 00 00       	mov    eax,0x0
}
  8066f7:	c9                   	leave  
  8066f8:	c3                   	ret    

00000000008066f9 <sys_chdir>:


unsigned long sys_chdir(char *filename)
{
  8066f9:	f3 0f 1e fa          	endbr64 
  8066fd:	55                   	push   rbp
  8066fe:	48 89 e5             	mov    rbp,rsp
  806701:	48 83 ec 30          	sub    rsp,0x30
  806705:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char * path = NULL;
  806709:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  806710:	00 
    long pathlen = 0;
  806711:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  806718:	00 
    struct dir_entry * dentry = NULL;
  806719:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  806720:	00 

    printf("sys_chdir\n");
  806721:	bf bf 2e 81 00       	mov    edi,0x812ebf
  806726:	b8 00 00 00 00       	mov    eax,0x0
  80672b:	e8 ad a5 ff ff       	call   800cdd <printf>
    path = (char *)vmalloc();
  806730:	b8 00 00 00 00       	mov    eax,0x0
  806735:	e8 bb a9 ff ff       	call   8010f5 <vmalloc>
  80673a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    if(path == NULL)
  80673e:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  806743:	75 0c                	jne    806751 <sys_chdir+0x58>
        return -ENOMEM;
  806745:	48 c7 c0 cf ff ff ff 	mov    rax,0xffffffffffffffcf
  80674c:	e9 ca 00 00 00       	jmp    80681b <sys_chdir+0x122>
    memset(path,0,PAGE_4K_SIZE);
  806751:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806755:	ba 00 10 00 00       	mov    edx,0x1000
  80675a:	be 00 00 00 00       	mov    esi,0x0
  80675f:	48 89 c7             	mov    rdi,rax
  806762:	e8 69 41 00 00       	call   80a8d0 <memset>
    pathlen = strlen(filename);
  806767:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80676b:	48 89 c7             	mov    rdi,rax
  80676e:	e8 cb 43 00 00       	call   80ab3e <strlen>
  806773:	48 98                	cdqe   
  806775:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(pathlen <= 0)
  806779:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  80677e:	7f 18                	jg     806798 <sys_chdir+0x9f>
    {
        vmfree(path);
  806780:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806784:	48 89 c7             	mov    rdi,rax
  806787:	e8 f8 a9 ff ff       	call   801184 <vmfree>
        return -EFAULT;
  80678c:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  806793:	e9 83 00 00 00       	jmp    80681b <sys_chdir+0x122>
    }
    else if(pathlen >= PAGE_4K_SIZE)
  806798:	48 81 7d f0 ff 0f 00 	cmp    QWORD PTR [rbp-0x10],0xfff
  80679f:	00 
  8067a0:	7e 15                	jle    8067b7 <sys_chdir+0xbe>
    {
        vmfree(path);
  8067a2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8067a6:	48 89 c7             	mov    rdi,rax
  8067a9:	e8 d6 a9 ff ff       	call   801184 <vmfree>
        return -ENAMETOOLONG;
  8067ae:	48 c7 c0 db ff ff ff 	mov    rax,0xffffffffffffffdb
  8067b5:	eb 64                	jmp    80681b <sys_chdir+0x122>
    }
    strcpy(filename,path);
  8067b7:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8067bb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8067bf:	48 89 d6             	mov    rsi,rdx
  8067c2:	48 89 c7             	mov    rdi,rax
  8067c5:	e8 55 41 00 00       	call   80a91f <strcpy>

    dentry = path_walk(path,0);
  8067ca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8067ce:	be 00 00 00 00       	mov    esi,0x0
  8067d3:	48 89 c7             	mov    rdi,rax
  8067d6:	e8 04 f3 ff ff       	call   805adf <path_walk>
  8067db:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    vmfree(path);
  8067df:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8067e3:	48 89 c7             	mov    rdi,rax
  8067e6:	e8 99 a9 ff ff       	call   801184 <vmfree>

    if(dentry == NULL)
  8067eb:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  8067f0:	75 09                	jne    8067fb <sys_chdir+0x102>
        return -ENOENT;
  8067f2:	48 c7 c0 d3 ff ff ff 	mov    rax,0xffffffffffffffd3
  8067f9:	eb 20                	jmp    80681b <sys_chdir+0x122>
    if(dentry->dir_inode->attribute != FS_ATTR_DIR)
  8067fb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8067ff:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806803:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806807:	48 83 f8 02          	cmp    rax,0x2
  80680b:	74 09                	je     806816 <sys_chdir+0x11d>
        return -ENOTDIR;
  80680d:	48 c7 c0 c7 ff ff ff 	mov    rax,0xffffffffffffffc7
  806814:	eb 05                	jmp    80681b <sys_chdir+0x122>
    return 0;
  806816:	b8 00 00 00 00       	mov    eax,0x0
}
  80681b:	c9                   	leave  
  80681c:	c3                   	ret    

000000000080681d <sys_getdents>:

unsigned long sys_getdents(int fd, void * dirent, long count)
{
  80681d:	f3 0f 1e fa          	endbr64 
  806821:	55                   	push   rbp
  806822:	48 89 e5             	mov    rbp,rsp
  806825:	48 83 ec 30          	sub    rsp,0x30
  806829:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80682c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  806830:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  806834:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80683b:	00 
    unsigned long ret = 0;
  80683c:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  806843:	00 

//	printf("sys_getdents:%d\n",fd);
    if(fd < 0 || fd > MAX_TASKS)
  806844:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  806848:	78 06                	js     806850 <sys_getdents+0x33>
  80684a:	83 7d ec 20          	cmp    DWORD PTR [rbp-0x14],0x20
  80684e:	7e 09                	jle    806859 <sys_getdents+0x3c>
        return -EBADF;
  806850:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  806857:	eb 72                	jmp    8068cb <sys_getdents+0xae>
    if(count < 0)
  806859:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80685e:	79 09                	jns    806869 <sys_getdents+0x4c>
        return -EINVAL;
  806860:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  806867:	eb 62                	jmp    8068cb <sys_getdents+0xae>

    filp = current->openf[fd];
  806869:	48 8b 05 30 dc c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0dc30]        # 4144a0 <current>
  806870:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  806873:	48 63 d2             	movsxd rdx,edx
  806876:	48 83 c2 18          	add    rdx,0x18
  80687a:	48 8b 44 d0 04       	mov    rax,QWORD PTR [rax+rdx*8+0x4]
  80687f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->readdir)
  806883:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806887:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80688b:	48 85 c0             	test   rax,rax
  80688e:	74 37                	je     8068c7 <sys_getdents+0xaa>
  806890:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806894:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806898:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80689c:	48 85 c0             	test   rax,rax
  80689f:	74 26                	je     8068c7 <sys_getdents+0xaa>
        ret = filp->f_ops->readdir(filp,dirent,&fill_dentry);
  8068a1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8068a5:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8068a9:	4c 8b 40 30          	mov    r8,QWORD PTR [rax+0x30]
  8068ad:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  8068b1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8068b5:	ba 5b 5d 80 00       	mov    edx,0x805d5b
  8068ba:	48 89 ce             	mov    rsi,rcx
  8068bd:	48 89 c7             	mov    rdi,rax
  8068c0:	41 ff d0             	call   r8
  8068c3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  8068c7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  8068cb:	c9                   	leave  
  8068cc:	c3                   	ret    

00000000008068cd <shift>:
/* 0x5D - Apps      */ {  0,        0,       0x5D,      0x5D }
        };
char k_shift=0,k_ctrl=0,k_capslock=0;

void shift()
{
  8068cd:	f3 0f 1e fa          	endbr64 
  8068d1:	55                   	push   rbp
  8068d2:	48 89 e5             	mov    rbp,rsp
    k_shift=!k_shift;
  8068d5:	0f b6 05 f1 0e c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20ef1]        # 4277cd <k_shift>
  8068dc:	84 c0                	test   al,al
  8068de:	0f 94 c0             	sete   al
  8068e1:	88 05 e6 0e c2 ff    	mov    BYTE PTR [rip+0xffffffffffc20ee6],al        # 4277cd <k_shift>
}
  8068e7:	90                   	nop
  8068e8:	5d                   	pop    rbp
  8068e9:	c3                   	ret    

00000000008068ea <ctrl>:
void ctrl()
{
  8068ea:	f3 0f 1e fa          	endbr64 
  8068ee:	55                   	push   rbp
  8068ef:	48 89 e5             	mov    rbp,rsp
    k_ctrl=!k_ctrl;
  8068f2:	0f b6 05 d5 0e c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20ed5]        # 4277ce <k_ctrl>
  8068f9:	84 c0                	test   al,al
  8068fb:	0f 94 c0             	sete   al
  8068fe:	88 05 ca 0e c2 ff    	mov    BYTE PTR [rip+0xffffffffffc20eca],al        # 4277ce <k_ctrl>
}
  806904:	90                   	nop
  806905:	5d                   	pop    rbp
  806906:	c3                   	ret    

0000000000806907 <capslock>:
void capslock()
{
  806907:	f3 0f 1e fa          	endbr64 
  80690b:	55                   	push   rbp
  80690c:	48 89 e5             	mov    rbp,rsp
    k_capslock=k_capslock==0?1:0;
  80690f:	0f b6 05 b9 0e c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20eb9]        # 4277cf <k_capslock>
  806916:	84 c0                	test   al,al
  806918:	0f 94 c0             	sete   al
  80691b:	88 05 ae 0e c2 ff    	mov    BYTE PTR [rip+0xffffffffffc20eae],al        # 4277cf <k_capslock>
}
  806921:	90                   	nop
  806922:	5d                   	pop    rbp
  806923:	c3                   	ret    

0000000000806924 <to_ascii>:
char to_ascii(char scan_code)
{
  806924:	f3 0f 1e fa          	endbr64 
  806928:	55                   	push   rbp
  806929:	48 89 e5             	mov    rbp,rsp
  80692c:	89 f8                	mov    eax,edi
  80692e:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  806931:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  806938:	e9 c7 00 00 00       	jmp    806a04 <to_ascii+0xe0>
        if(key_map[i].scan_code==scan_code)
  80693d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806940:	48 63 d0             	movsxd rdx,eax
  806943:	48 89 d0             	mov    rax,rdx
  806946:	48 c1 e0 02          	shl    rax,0x2
  80694a:	48 01 d0             	add    rax,rdx
  80694d:	48 05 42 30 81 00    	add    rax,0x813042
  806953:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806956:	38 45 ec             	cmp    BYTE PTR [rbp-0x14],al
  806959:	0f 85 a1 00 00 00    	jne    806a00 <to_ascii+0xdc>
        {
            if(k_capslock&&key_map[i].ascii>='a'&&key_map[i].ascii<='z')return key_map[i].ascii_shift;
  80695f:	0f b6 05 69 0e c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20e69]        # 4277cf <k_capslock>
  806966:	84 c0                	test   al,al
  806968:	74 55                	je     8069bf <to_ascii+0x9b>
  80696a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80696d:	48 63 d0             	movsxd rdx,eax
  806970:	48 89 d0             	mov    rax,rdx
  806973:	48 c1 e0 02          	shl    rax,0x2
  806977:	48 01 d0             	add    rax,rdx
  80697a:	48 05 40 30 81 00    	add    rax,0x813040
  806980:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806983:	3c 60                	cmp    al,0x60
  806985:	7e 38                	jle    8069bf <to_ascii+0x9b>
  806987:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80698a:	48 63 d0             	movsxd rdx,eax
  80698d:	48 89 d0             	mov    rax,rdx
  806990:	48 c1 e0 02          	shl    rax,0x2
  806994:	48 01 d0             	add    rax,rdx
  806997:	48 05 40 30 81 00    	add    rax,0x813040
  80699d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8069a0:	3c 7a                	cmp    al,0x7a
  8069a2:	7f 1b                	jg     8069bf <to_ascii+0x9b>
  8069a4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8069a7:	48 63 d0             	movsxd rdx,eax
  8069aa:	48 89 d0             	mov    rax,rdx
  8069ad:	48 c1 e0 02          	shl    rax,0x2
  8069b1:	48 01 d0             	add    rax,rdx
  8069b4:	48 05 41 30 81 00    	add    rax,0x813041
  8069ba:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8069bd:	eb 54                	jmp    806a13 <to_ascii+0xef>
            else if(k_shift)return key_map[i].ascii_shift;
  8069bf:	0f b6 05 07 0e c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20e07]        # 4277cd <k_shift>
  8069c6:	84 c0                	test   al,al
  8069c8:	74 1b                	je     8069e5 <to_ascii+0xc1>
  8069ca:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8069cd:	48 63 d0             	movsxd rdx,eax
  8069d0:	48 89 d0             	mov    rax,rdx
  8069d3:	48 c1 e0 02          	shl    rax,0x2
  8069d7:	48 01 d0             	add    rax,rdx
  8069da:	48 05 41 30 81 00    	add    rax,0x813041
  8069e0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8069e3:	eb 2e                	jmp    806a13 <to_ascii+0xef>
            else return key_map[i].ascii;
  8069e5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8069e8:	48 63 d0             	movsxd rdx,eax
  8069eb:	48 89 d0             	mov    rax,rdx
  8069ee:	48 c1 e0 02          	shl    rax,0x2
  8069f2:	48 01 d0             	add    rax,rdx
  8069f5:	48 05 40 30 81 00    	add    rax,0x813040
  8069fb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8069fe:	eb 13                	jmp    806a13 <to_ascii+0xef>
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  806a00:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806a04:	83 7d fc 5d          	cmp    DWORD PTR [rbp-0x4],0x5d
  806a08:	0f 8e 2f ff ff ff    	jle    80693d <to_ascii+0x19>
        }

    return '\0';
  806a0e:	b8 00 00 00 00       	mov    eax,0x0
}
  806a13:	5d                   	pop    rbp
  806a14:	c3                   	ret    

0000000000806a15 <init_kb>:
int init_kb()
{
  806a15:	f3 0f 1e fa          	endbr64 
  806a19:	55                   	push   rbp
  806a1a:	48 89 e5             	mov    rbp,rsp
    reg_device(&dev_keyboard);
  806a1d:	bf 80 2f 81 00       	mov    edi,0x812f80
  806a22:	e8 7a b9 ff ff       	call   8023a1 <reg_device>
    reg_driver(&drv_keyboard);
  806a27:	bf e0 2e 81 00       	mov    edi,0x812ee0
  806a2c:	e8 58 bc ff ff       	call   802689 <reg_driver>
}
  806a31:	90                   	nop
  806a32:	5d                   	pop    rbp
  806a33:	c3                   	ret    

0000000000806a34 <key_proc>:
int key_proc()
{
  806a34:	f3 0f 1e fa          	endbr64 
  806a38:	55                   	push   rbp
  806a39:	48 89 e5             	mov    rbp,rsp
  806a3c:	48 83 ec 10          	sub    rsp,0x10
    //获取完整的扫描码
    u8 scan1=0,scan2=0,ch=0;
  806a40:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
  806a44:	c6 45 fe 00          	mov    BYTE PTR [rbp-0x2],0x0
  806a48:	c6 45 fd 00          	mov    BYTE PTR [rbp-0x3],0x0
    key_code tmpc;
    scan1=inb(0x60);
  806a4c:	bf 60 00 00 00       	mov    edi,0x60
  806a51:	e8 73 dd ff ff       	call   8047c9 <inb>
  806a56:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
//    tmpc.scan_code2=scan2;
//    tmpc.ascii= ch;


//    ENQUEUE(key_bufq,tmpc)
    if((key_bufq.tail+1)%key_bufq.size!=key_bufq.head)
  806a59:	8b 05 2d 48 00 00    	mov    eax,DWORD PTR [rip+0x482d]        # 80b28c <key_bufq+0xc>
  806a5f:	83 c0 01             	add    eax,0x1
  806a62:	8b 0d 28 48 00 00    	mov    ecx,DWORD PTR [rip+0x4828]        # 80b290 <key_bufq+0x10>
  806a68:	99                   	cdq    
  806a69:	f7 f9                	idiv   ecx
  806a6b:	8b 05 17 48 00 00    	mov    eax,DWORD PTR [rip+0x4817]        # 80b288 <key_bufq+0x8>
  806a71:	39 c2                	cmp    edx,eax
  806a73:	74 32                	je     806aa7 <key_proc+0x73>
    {
        key_bufq.data[key_bufq.tail]=scan1;
  806a75:	48 8b 15 04 48 00 00 	mov    rdx,QWORD PTR [rip+0x4804]        # 80b280 <key_bufq>
  806a7c:	8b 05 0a 48 00 00    	mov    eax,DWORD PTR [rip+0x480a]        # 80b28c <key_bufq+0xc>
  806a82:	48 98                	cdqe   
  806a84:	48 01 c2             	add    rdx,rax
  806a87:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  806a8b:	88 02                	mov    BYTE PTR [rdx],al
        key_bufq.tail=(key_bufq.tail+1)%key_bufq.size;
  806a8d:	8b 05 f9 47 00 00    	mov    eax,DWORD PTR [rip+0x47f9]        # 80b28c <key_bufq+0xc>
  806a93:	83 c0 01             	add    eax,0x1
  806a96:	8b 0d f4 47 00 00    	mov    ecx,DWORD PTR [rip+0x47f4]        # 80b290 <key_bufq+0x10>
  806a9c:	99                   	cdq    
  806a9d:	f7 f9                	idiv   ecx
  806a9f:	89 d0                	mov    eax,edx
  806aa1:	89 05 e5 47 00 00    	mov    DWORD PTR [rip+0x47e5],eax        # 80b28c <key_bufq+0xc>
    }

    if(scan1==0x48)
  806aa7:	80 7d ff 48          	cmp    BYTE PTR [rbp-0x1],0x48
  806aab:	75 0a                	jne    806ab7 <key_proc+0x83>
        scr_up();
  806aad:	b8 00 00 00 00       	mov    eax,0x0
  806ab2:	e8 0e ee ff ff       	call   8058c5 <scr_up>
    if(scan1==0x50)
  806ab7:	80 7d ff 50          	cmp    BYTE PTR [rbp-0x1],0x50
  806abb:	75 0a                	jne    806ac7 <key_proc+0x93>
        scr_down();
  806abd:	b8 00 00 00 00       	mov    eax,0x0
  806ac2:	e8 98 ee ff ff       	call   80595f <scr_down>
    switch (scan1)
  806ac7:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  806acb:	3d b6 00 00 00       	cmp    eax,0xb6
  806ad0:	74 41                	je     806b13 <key_proc+0xdf>
  806ad2:	3d b6 00 00 00       	cmp    eax,0xb6
  806ad7:	7f 5e                	jg     806b37 <key_proc+0x103>
  806ad9:	3d aa 00 00 00       	cmp    eax,0xaa
  806ade:	74 33                	je     806b13 <key_proc+0xdf>
  806ae0:	3d aa 00 00 00       	cmp    eax,0xaa
  806ae5:	7f 50                	jg     806b37 <key_proc+0x103>
  806ae7:	3d 9d 00 00 00       	cmp    eax,0x9d
  806aec:	74 31                	je     806b1f <key_proc+0xeb>
  806aee:	3d 9d 00 00 00       	cmp    eax,0x9d
  806af3:	7f 42                	jg     806b37 <key_proc+0x103>
  806af5:	83 f8 3a             	cmp    eax,0x3a
  806af8:	74 31                	je     806b2b <key_proc+0xf7>
  806afa:	83 f8 3a             	cmp    eax,0x3a
  806afd:	7f 38                	jg     806b37 <key_proc+0x103>
  806aff:	83 f8 36             	cmp    eax,0x36
  806b02:	74 0f                	je     806b13 <key_proc+0xdf>
  806b04:	83 f8 36             	cmp    eax,0x36
  806b07:	7f 2e                	jg     806b37 <key_proc+0x103>
  806b09:	83 f8 1d             	cmp    eax,0x1d
  806b0c:	74 11                	je     806b1f <key_proc+0xeb>
  806b0e:	83 f8 2a             	cmp    eax,0x2a
  806b11:	75 24                	jne    806b37 <key_proc+0x103>
    {
        case 0x36:
        case 0x2a:
        case 0xaa:
        case 0xb6:
            shift();
  806b13:	b8 00 00 00 00       	mov    eax,0x0
  806b18:	e8 b0 fd ff ff       	call   8068cd <shift>
            break;
  806b1d:	eb 19                	jmp    806b38 <key_proc+0x104>
        case 0x1d:
        case 0x9d:
            ctrl();
  806b1f:	b8 00 00 00 00       	mov    eax,0x0
  806b24:	e8 c1 fd ff ff       	call   8068ea <ctrl>
            break;
  806b29:	eb 0d                	jmp    806b38 <key_proc+0x104>
        case 0x3a:
            capslock();
  806b2b:	b8 00 00 00 00       	mov    eax,0x0
  806b30:	e8 d2 fd ff ff       	call   806907 <capslock>
            break;
  806b35:	eb 01                	jmp    806b38 <key_proc+0x104>
        default:
            break;
  806b37:	90                   	nop
//        //logf("%x\n",stdin.w_ptr);
//        //print_stdin();
//        //printchar(ch);
//        //flush_screen(0);*/
//    }
    eoi();
  806b38:	b8 00 00 00 00       	mov    eax,0x0
  806b3d:	e8 9c dc ff ff       	call   8047de <eoi>
    asm volatile("leave \r\n iretq");
  806b42:	c9                   	leave  
  806b43:	48 cf                	iretq  
}
  806b45:	90                   	nop
  806b46:	c9                   	leave  
  806b47:	c3                   	ret    

0000000000806b48 <sys_getkbc>:

char sys_getkbc()
{
  806b48:	f3 0f 1e fa          	endbr64 
  806b4c:	55                   	push   rbp
  806b4d:	48 89 e5             	mov    rbp,rsp
    if(key_bufq.tail==key_bufq.head)return -1;
  806b50:	8b 15 36 47 00 00    	mov    edx,DWORD PTR [rip+0x4736]        # 80b28c <key_bufq+0xc>
  806b56:	8b 05 2c 47 00 00    	mov    eax,DWORD PTR [rip+0x472c]        # 80b288 <key_bufq+0x8>
  806b5c:	39 c2                	cmp    edx,eax
  806b5e:	75 07                	jne    806b67 <sys_getkbc+0x1f>
  806b60:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806b65:	eb 30                	jmp    806b97 <sys_getkbc+0x4f>
    char c=key_buf[key_bufq.tail];
  806b67:	8b 05 1f 47 00 00    	mov    eax,DWORD PTR [rip+0x471f]        # 80b28c <key_bufq+0xc>
  806b6d:	48 98                	cdqe   
  806b6f:	0f b6 80 c0 75 42 00 	movzx  eax,BYTE PTR [rax+0x4275c0]
  806b76:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    QTAIL(key_bufq)=(QTAIL(key_bufq)+1)%QSIZE(key_bufq);
  806b79:	8b 05 0d 47 00 00    	mov    eax,DWORD PTR [rip+0x470d]        # 80b28c <key_bufq+0xc>
  806b7f:	83 c0 01             	add    eax,0x1
  806b82:	8b 0d 08 47 00 00    	mov    ecx,DWORD PTR [rip+0x4708]        # 80b290 <key_bufq+0x10>
  806b88:	99                   	cdq    
  806b89:	f7 f9                	idiv   ecx
  806b8b:	89 d0                	mov    eax,edx
  806b8d:	89 05 f9 46 00 00    	mov    DWORD PTR [rip+0x46f9],eax        # 80b28c <key_bufq+0xc>
    return c;
  806b93:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  806b97:	5d                   	pop    rbp
  806b98:	c3                   	ret    

0000000000806b99 <init_disk>:
        .read=async_read_disk,
        .write=async_write_disk
};
int disks[4];//四块硬盘的dev号
int init_disk()
{
  806b99:	f3 0f 1e fa          	endbr64 
  806b9d:	55                   	push   rbp
  806b9e:	48 89 e5             	mov    rbp,rsp
    //disk_devi= reg_device(&dev_disk);
    //disk_drvi= reg_driver(&drv_disk);
    //dev_disk.drv=&drv_disk;
    hd_iterate();
  806ba1:	b8 00 00 00 00       	mov    eax,0x0
  806ba6:	e8 8d 09 00 00       	call   807538 <hd_iterate>
    return 0;
  806bab:	b8 00 00 00 00       	mov    eax,0x0
}
  806bb0:	5d                   	pop    rbp
  806bb1:	c3                   	ret    

0000000000806bb2 <disk_int_handler_c>:

int disk_int_handler_c()
{
  806bb2:	f3 0f 1e fa          	endbr64 
  806bb6:	55                   	push   rbp
  806bb7:	48 89 e5             	mov    rbp,rsp
  806bba:	48 83 ec 20          	sub    rsp,0x20
    if(running_req==NULL)
  806bbe:	48 8b 05 1b 39 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2391b]        # 42a4e0 <running_req>
  806bc5:	48 85 c0             	test   rax,rax
  806bc8:	75 0a                	jne    806bd4 <disk_int_handler_c+0x22>
    {
        //printf("err:null running dreq\n");
        return 1;//同步读写硬盘
  806bca:	b8 01 00 00 00       	mov    eax,0x1
  806bcf:	e9 a3 01 00 00       	jmp    806d77 <disk_int_handler_c+0x1c5>
    }
    short *p=running_req->buf;
  806bd4:	48 8b 05 05 39 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23905]        # 42a4e0 <running_req>
  806bdb:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806bdf:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int port=PORT_DISK_MAJOR;
  806be3:	c7 45 f4 f0 01 00 00 	mov    DWORD PTR [rbp-0xc],0x1f0
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  806bea:	48 8b 05 ef 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc238ef]        # 42a4e0 <running_req>
  806bf1:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806bf4:	83 f8 02             	cmp    eax,0x2
  806bf7:	74 0f                	je     806c08 <disk_int_handler_c+0x56>
    running_req->disk==DISK_SLAVE_SLAVE)
  806bf9:	48 8b 05 e0 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc238e0]        # 42a4e0 <running_req>
  806c00:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  806c03:	83 f8 03             	cmp    eax,0x3
  806c06:	75 07                	jne    806c0f <disk_int_handler_c+0x5d>
        port=PORT_DISK_SLAVE;
  806c08:	c7 45 f4 70 01 00 00 	mov    DWORD PTR [rbp-0xc],0x170
    if(running_req->func==DISKREQ_READ)
  806c0f:	48 8b 05 ca 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc238ca]        # 42a4e0 <running_req>
  806c16:	8b 00                	mov    eax,DWORD PTR [rax]
  806c18:	85 c0                	test   eax,eax
  806c1a:	75 42                	jne    806c5e <disk_int_handler_c+0xac>
    {
        ////printf("sys_read dist:%x\n",p);
        //读取
        for(int i=0;i<running_req->sec_n*256;i++)
  806c1c:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  806c23:	eb 22                	jmp    806c47 <disk_int_handler_c+0x95>
        {
            *p++=inw(port);
  806c25:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806c28:	0f b7 c0             	movzx  eax,ax
  806c2b:	89 c7                	mov    edi,eax
  806c2d:	e8 a1 db ff ff       	call   8047d3 <inw>
  806c32:	89 c2                	mov    edx,eax
  806c34:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806c38:	48 8d 48 02          	lea    rcx,[rax+0x2]
  806c3c:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  806c40:	66 89 10             	mov    WORD PTR [rax],dx
        for(int i=0;i<running_req->sec_n*256;i++)
  806c43:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  806c47:	48 8b 05 92 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23892]        # 42a4e0 <running_req>
  806c4e:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  806c51:	c1 e0 08             	shl    eax,0x8
  806c54:	39 45 f0             	cmp    DWORD PTR [rbp-0x10],eax
  806c57:	7c cc                	jl     806c25 <disk_int_handler_c+0x73>
  806c59:	e9 ca 00 00 00       	jmp    806d28 <disk_int_handler_c+0x176>
        }
    }else if(running_req->func==DISKREQ_WRITE)
  806c5e:	48 8b 05 7b 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2387b]        # 42a4e0 <running_req>
  806c65:	8b 00                	mov    eax,DWORD PTR [rax]
  806c67:	83 f8 01             	cmp    eax,0x1
  806c6a:	75 42                	jne    806cae <disk_int_handler_c+0xfc>
    {
        for(int i=0;i<running_req->sec_n*256;i++)
  806c6c:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  806c73:	eb 25                	jmp    806c9a <disk_int_handler_c+0xe8>
            outw(port,*p++);
  806c75:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806c79:	48 8d 50 02          	lea    rdx,[rax+0x2]
  806c7d:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  806c81:	0f b7 00             	movzx  eax,WORD PTR [rax]
  806c84:	0f b7 d0             	movzx  edx,ax
  806c87:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806c8a:	0f b7 c0             	movzx  eax,ax
  806c8d:	89 d6                	mov    esi,edx
  806c8f:	89 c7                	mov    edi,eax
  806c91:	e8 27 db ff ff       	call   8047bd <outw>
        for(int i=0;i<running_req->sec_n*256;i++)
  806c96:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  806c9a:	48 8b 05 3f 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2383f]        # 42a4e0 <running_req>
  806ca1:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  806ca4:	c1 e0 08             	shl    eax,0x8
  806ca7:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  806caa:	7c c9                	jl     806c75 <disk_int_handler_c+0xc3>
  806cac:	eb 7a                	jmp    806d28 <disk_int_handler_c+0x176>
    }else if(running_req->func==DISKREQ_CHECK)
  806cae:	48 8b 05 2b 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2382b]        # 42a4e0 <running_req>
  806cb5:	8b 00                	mov    eax,DWORD PTR [rax]
  806cb7:	83 f8 02             	cmp    eax,0x2
  806cba:	75 34                	jne    806cf0 <disk_int_handler_c+0x13e>
    {
        char stat=inb(port+7);
  806cbc:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806cbf:	83 c0 07             	add    eax,0x7
  806cc2:	0f b6 c0             	movzx  eax,al
  806cc5:	89 c7                	mov    edi,eax
  806cc7:	e8 fd da ff ff       	call   8047c9 <inb>
  806ccc:	88 45 e7             	mov    BYTE PTR [rbp-0x19],al
        short dat=inw(port);
  806ccf:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806cd2:	0f b7 c0             	movzx  eax,ax
  806cd5:	89 c7                	mov    edi,eax
  806cd7:	e8 f7 da ff ff       	call   8047d3 <inw>
  806cdc:	66 89 45 e4          	mov    WORD PTR [rbp-0x1c],ax
        if(1)
        {
            running_req->result=DISK_CHK_OK;
  806ce0:	48 8b 05 f9 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc237f9]        # 42a4e0 <running_req>
  806ce7:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  806cee:	eb 38                	jmp    806d28 <disk_int_handler_c+0x176>
            char err=inb(port+1);//错误原因
            printf("checking disk err:%x\nresetting hd\n",err);
            running_req->result=DISK_CHK_ERR;
            request(running_req->disk,DISKREQ_RESET,0,0,0);
        }
    }else if(running_req->func==DISKREQ_RESET)
  806cf0:	48 8b 05 e9 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc237e9]        # 42a4e0 <running_req>
  806cf7:	8b 00                	mov    eax,DWORD PTR [rax]
  806cf9:	83 f8 03             	cmp    eax,0x3
  806cfc:	75 2a                	jne    806d28 <disk_int_handler_c+0x176>
    {
        int stat=inb(port+7);
  806cfe:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806d01:	83 c0 07             	add    eax,0x7
  806d04:	0f b6 c0             	movzx  eax,al
  806d07:	89 c7                	mov    edi,eax
  806d09:	e8 bb da ff ff       	call   8047c9 <inb>
  806d0e:	0f b6 c0             	movzx  eax,al
  806d11:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
        printf("reset disk done.\nstat now:%x\n",stat);
  806d14:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806d17:	89 c6                	mov    esi,eax
  806d19:	bf 16 32 81 00       	mov    edi,0x813216
  806d1e:	b8 00 00 00 00       	mov    eax,0x0
  806d23:	e8 b5 9f ff ff       	call   800cdd <printf>
    }
    running_req->stat=REQ_STAT_DONE;
  806d28:	48 8b 05 b1 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc237b1]        # 42a4e0 <running_req>
  806d2f:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  806d36:	48 8b 05 a3 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc237a3]        # 42a4e0 <running_req>
  806d3d:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  806d41:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  806d48:	00 00 00 
    running_devman_req->stat=REQ_STAT_DONE;
  806d4b:	48 8b 05 96 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23796]        # 42a4e8 <running_devman_req>
  806d52:	c7 80 ac 00 00 00 03 	mov    DWORD PTR [rax+0xac],0x3
  806d59:	00 00 00 
    running_devman_req=NULL;
  806d5c:	48 c7 05 81 37 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23781],0x0        # 42a4e8 <running_devman_req>
  806d63:	00 00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  806d67:	48 c7 05 6e 37 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2376e],0x0        # 42a4e0 <running_req>
  806d6e:	00 00 00 00 
    return 0;
  806d72:	b8 00 00 00 00       	mov    eax,0x0
}
  806d77:	c9                   	leave  
  806d78:	c3                   	ret    

0000000000806d79 <check_dreq_stat>:
int check_dreq_stat(int req_id)
{
  806d79:	f3 0f 1e fa          	endbr64 
  806d7d:	55                   	push   rbp
  806d7e:	48 89 e5             	mov    rbp,rsp
  806d81:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return disk_reqs[req_id].stat;
  806d84:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806d87:	48 63 d0             	movsxd rdx,eax
  806d8a:	48 89 d0             	mov    rax,rdx
  806d8d:	48 01 c0             	add    rax,rax
  806d90:	48 01 d0             	add    rax,rdx
  806d93:	48 c1 e0 04          	shl    rax,0x4
  806d97:	48 05 fc 77 42 00    	add    rax,0x4277fc
  806d9d:	8b 00                	mov    eax,DWORD PTR [rax]
}
  806d9f:	5d                   	pop    rbp
  806da0:	c3                   	ret    

0000000000806da1 <request>:
int request(int disk,int func,int lba,int secn,char *buf){
  806da1:	f3 0f 1e fa          	endbr64 
  806da5:	55                   	push   rbp
  806da6:	48 89 e5             	mov    rbp,rsp
  806da9:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806dac:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806daf:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  806db2:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  806db5:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    if((tail+1)%MAX_DISK_REQUEST_COUNT==head)
  806db9:	8b 05 55 37 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23755]        # 42a514 <tail>
  806dbf:	83 c0 01             	add    eax,0x1
  806dc2:	48 63 d0             	movsxd rdx,eax
  806dc5:	48 69 d2 89 88 88 88 	imul   rdx,rdx,0xffffffff88888889
  806dcc:	48 c1 ea 20          	shr    rdx,0x20
  806dd0:	01 c2                	add    edx,eax
  806dd2:	c1 fa 07             	sar    edx,0x7
  806dd5:	89 c1                	mov    ecx,eax
  806dd7:	c1 f9 1f             	sar    ecx,0x1f
  806dda:	29 ca                	sub    edx,ecx
  806ddc:	69 ca f0 00 00 00    	imul   ecx,edx,0xf0
  806de2:	29 c8                	sub    eax,ecx
  806de4:	89 c2                	mov    edx,eax
  806de6:	8b 05 24 37 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23724]        # 42a510 <head>
  806dec:	39 c2                	cmp    edx,eax
  806dee:	75 0a                	jne    806dfa <request+0x59>
    {
        return -1;
  806df0:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806df5:	e9 0d 01 00 00       	jmp    806f07 <request+0x166>
    }
    disk_reqs[tail].disk=disk;
  806dfa:	8b 05 14 37 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23714]        # 42a514 <tail>
  806e00:	48 63 d0             	movsxd rdx,eax
  806e03:	48 89 d0             	mov    rax,rdx
  806e06:	48 01 c0             	add    rax,rax
  806e09:	48 01 d0             	add    rax,rdx
  806e0c:	48 c1 e0 04          	shl    rax,0x4
  806e10:	48 8d 90 e4 77 42 00 	lea    rdx,[rax+0x4277e4]
  806e17:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806e1a:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].func=func;
  806e1c:	8b 05 f2 36 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc236f2]        # 42a514 <tail>
  806e22:	48 63 d0             	movsxd rdx,eax
  806e25:	48 89 d0             	mov    rax,rdx
  806e28:	48 01 c0             	add    rax,rax
  806e2b:	48 01 d0             	add    rax,rdx
  806e2e:	48 c1 e0 04          	shl    rax,0x4
  806e32:	48 8d 90 e0 77 42 00 	lea    rdx,[rax+0x4277e0]
  806e39:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806e3c:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].lba=lba;
  806e3e:	8b 05 d0 36 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc236d0]        # 42a514 <tail>
  806e44:	48 63 d0             	movsxd rdx,eax
  806e47:	48 89 d0             	mov    rax,rdx
  806e4a:	48 01 c0             	add    rax,rax
  806e4d:	48 01 d0             	add    rax,rdx
  806e50:	48 c1 e0 04          	shl    rax,0x4
  806e54:	48 8d 90 e8 77 42 00 	lea    rdx,[rax+0x4277e8]
  806e5b:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806e5e:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].sec_n=secn;
  806e60:	8b 05 ae 36 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc236ae]        # 42a514 <tail>
  806e66:	48 63 d0             	movsxd rdx,eax
  806e69:	48 89 d0             	mov    rax,rdx
  806e6c:	48 01 c0             	add    rax,rax
  806e6f:	48 01 d0             	add    rax,rdx
  806e72:	48 c1 e0 04          	shl    rax,0x4
  806e76:	48 8d 90 ec 77 42 00 	lea    rdx,[rax+0x4277ec]
  806e7d:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  806e80:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].stat=REQ_STAT_READY;
  806e82:	8b 05 8c 36 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2368c]        # 42a514 <tail>
  806e88:	48 63 d0             	movsxd rdx,eax
  806e8b:	48 89 d0             	mov    rax,rdx
  806e8e:	48 01 c0             	add    rax,rax
  806e91:	48 01 d0             	add    rax,rdx
  806e94:	48 c1 e0 04          	shl    rax,0x4
  806e98:	48 05 fc 77 42 00    	add    rax,0x4277fc
  806e9e:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    disk_reqs[tail].buf=buf;
  806ea4:	8b 05 6a 36 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2366a]        # 42a514 <tail>
  806eaa:	48 63 d0             	movsxd rdx,eax
  806ead:	48 89 d0             	mov    rax,rdx
  806eb0:	48 01 c0             	add    rax,rax
  806eb3:	48 01 d0             	add    rax,rdx
  806eb6:	48 c1 e0 04          	shl    rax,0x4
  806eba:	48 8d 90 f0 77 42 00 	lea    rdx,[rax+0x4277f0]
  806ec1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806ec5:	48 89 02             	mov    QWORD PTR [rdx],rax
    int r=tail;
  806ec8:	8b 05 46 36 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23646]        # 42a514 <tail>
  806ece:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    tail=(tail+1)%MAX_DISK_REQUEST_COUNT;
  806ed1:	8b 05 3d 36 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2363d]        # 42a514 <tail>
  806ed7:	8d 50 01             	lea    edx,[rax+0x1]
  806eda:	48 63 c2             	movsxd rax,edx
  806edd:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  806ee4:	48 c1 e8 20          	shr    rax,0x20
  806ee8:	01 d0                	add    eax,edx
  806eea:	c1 f8 07             	sar    eax,0x7
  806eed:	89 d1                	mov    ecx,edx
  806eef:	c1 f9 1f             	sar    ecx,0x1f
  806ef2:	29 c8                	sub    eax,ecx
  806ef4:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  806efa:	89 d0                	mov    eax,edx
  806efc:	29 c8                	sub    eax,ecx
  806efe:	89 05 10 36 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc23610],eax        # 42a514 <tail>
    return r;
  806f04:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  806f07:	5d                   	pop    rbp
  806f08:	c3                   	ret    

0000000000806f09 <execute_request>:
int execute_request(){
  806f09:	f3 0f 1e fa          	endbr64 
  806f0d:	55                   	push   rbp
  806f0e:	48 89 e5             	mov    rbp,rsp
  806f11:	48 83 ec 10          	sub    rsp,0x10
    //查看是否有已经在运行的请求
    if(running_req!=NULL)
  806f15:	48 8b 05 c4 35 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc235c4]        # 42a4e0 <running_req>
  806f1c:	48 85 c0             	test   rax,rax
  806f1f:	74 6a                	je     806f8b <execute_request+0x82>
    {
        running_req->time++;
  806f21:	48 8b 05 b8 35 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc235b8]        # 42a4e0 <running_req>
  806f28:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  806f2b:	83 c2 01             	add    edx,0x1
  806f2e:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
        if(running_req->func!=DISKREQ_CHECK)
  806f31:	48 8b 05 a8 35 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc235a8]        # 42a4e0 <running_req>
  806f38:	8b 00                	mov    eax,DWORD PTR [rax]
  806f3a:	83 f8 02             	cmp    eax,0x2
  806f3d:	74 0a                	je     806f49 <execute_request+0x40>
            return 2;
  806f3f:	b8 02 00 00 00       	mov    eax,0x2
  806f44:	e9 b4 01 00 00       	jmp    8070fd <execute_request+0x1f4>
        if(running_req->time>MAX_DISK_CHKTIME)
  806f49:	48 8b 05 90 35 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23590]        # 42a4e0 <running_req>
  806f50:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  806f53:	83 f8 0a             	cmp    eax,0xa
  806f56:	7e 29                	jle    806f81 <execute_request+0x78>
        {
            //检测硬盘超时，视为没有硬盘连接
            running_req->result=DISK_CHK_ERR;
  806f58:	48 8b 05 81 35 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23581]        # 42a4e0 <running_req>
  806f5f:	c7 40 20 02 00 00 00 	mov    DWORD PTR [rax+0x20],0x2
            running_req->stat=REQ_STAT_DONE;
  806f66:	48 8b 05 73 35 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23573]        # 42a4e0 <running_req>
  806f6d:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
            running_req=NULL;
  806f74:	48 c7 05 61 35 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23561],0x0        # 42a4e0 <running_req>
  806f7b:	00 00 00 00 
  806f7f:	eb 0a                	jmp    806f8b <execute_request+0x82>
        }else
        {
            //未到时间继续等待
            return 2;
  806f81:	b8 02 00 00 00       	mov    eax,0x2
  806f86:	e9 72 01 00 00       	jmp    8070fd <execute_request+0x1f4>
        }
    }
    if(head==tail)return 1;//检查是否为空
  806f8b:	8b 15 7f 35 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc2357f]        # 42a510 <head>
  806f91:	8b 05 7d 35 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2357d]        # 42a514 <tail>
  806f97:	39 c2                	cmp    edx,eax
  806f99:	75 0a                	jne    806fa5 <execute_request+0x9c>
  806f9b:	b8 01 00 00 00       	mov    eax,0x1
  806fa0:	e9 58 01 00 00       	jmp    8070fd <execute_request+0x1f4>
    running_req=&disk_reqs[head];
  806fa5:	8b 05 65 35 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23565]        # 42a510 <head>
  806fab:	48 63 d0             	movsxd rdx,eax
  806fae:	48 89 d0             	mov    rax,rdx
  806fb1:	48 01 c0             	add    rax,rax
  806fb4:	48 01 d0             	add    rax,rdx
  806fb7:	48 c1 e0 04          	shl    rax,0x4
  806fbb:	48 05 e0 77 42 00    	add    rax,0x4277e0
  806fc1:	48 89 05 18 35 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23518],rax        # 42a4e0 <running_req>
    head=(head+1)%MAX_DISK_REQUEST_COUNT;
  806fc8:	8b 05 42 35 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23542]        # 42a510 <head>
  806fce:	8d 50 01             	lea    edx,[rax+0x1]
  806fd1:	48 63 c2             	movsxd rax,edx
  806fd4:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  806fdb:	48 c1 e8 20          	shr    rax,0x20
  806fdf:	01 d0                	add    eax,edx
  806fe1:	c1 f8 07             	sar    eax,0x7
  806fe4:	89 d1                	mov    ecx,edx
  806fe6:	c1 f9 1f             	sar    ecx,0x1f
  806fe9:	29 c8                	sub    eax,ecx
  806feb:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  806ff1:	89 d0                	mov    eax,edx
  806ff3:	29 c8                	sub    eax,ecx
  806ff5:	89 05 15 35 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc23515],eax        # 42a510 <head>
    running_req->stat=REQ_STAT_WORKING;
  806ffb:	48 8b 05 de 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc234de]        # 42a4e0 <running_req>
  807002:	c7 40 1c 02 00 00 00 	mov    DWORD PTR [rax+0x1c],0x2
    //set_proc_stat(running_req->pid,SUSPENDED);
    int r=0;
  807009:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    switch (running_req->func)
  807010:	48 8b 05 c9 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc234c9]        # 42a4e0 <running_req>
  807017:	8b 00                	mov    eax,DWORD PTR [rax]
  807019:	83 f8 03             	cmp    eax,0x3
  80701c:	0f 84 ad 00 00 00    	je     8070cf <execute_request+0x1c6>
  807022:	83 f8 03             	cmp    eax,0x3
  807025:	0f 8f bf 00 00 00    	jg     8070ea <execute_request+0x1e1>
  80702b:	83 f8 02             	cmp    eax,0x2
  80702e:	0f 84 85 00 00 00    	je     8070b9 <execute_request+0x1b0>
  807034:	83 f8 02             	cmp    eax,0x2
  807037:	0f 8f ad 00 00 00    	jg     8070ea <execute_request+0x1e1>
  80703d:	85 c0                	test   eax,eax
  80703f:	74 0a                	je     80704b <execute_request+0x142>
  807041:	83 f8 01             	cmp    eax,0x1
  807044:	74 3c                	je     807082 <execute_request+0x179>
        break;
    case DISKREQ_RESET:
        r=async_reset_disk(running_req->disk);
        break;
    default:
        break;
  807046:	e9 9f 00 00 00       	jmp    8070ea <execute_request+0x1e1>
        running_req->lba,running_req->sec_n,running_req->buf);
  80704b:	48 8b 05 8e 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2348e]        # 42a4e0 <running_req>
        r=async_read_disk(running_req->disk,\
  807052:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
        running_req->lba,running_req->sec_n,running_req->buf);
  807056:	48 8b 05 83 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23483]        # 42a4e0 <running_req>
        r=async_read_disk(running_req->disk,\
  80705d:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
        running_req->lba,running_req->sec_n,running_req->buf);
  807060:	48 8b 05 79 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23479]        # 42a4e0 <running_req>
  807067:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_read_disk(running_req->disk,\
  80706a:	89 c6                	mov    esi,eax
  80706c:	48 8b 05 6d 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2346d]        # 42a4e0 <running_req>
  807073:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  807076:	89 c7                	mov    edi,eax
  807078:	e8 a7 00 00 00       	call   807124 <async_read_disk>
  80707d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  807080:	eb 69                	jmp    8070eb <execute_request+0x1e2>
         running_req->lba,running_req->sec_n,running_req->buf);
  807082:	48 8b 05 57 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23457]        # 42a4e0 <running_req>
        r=async_write_disk(running_req->disk,\
  807089:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
         running_req->lba,running_req->sec_n,running_req->buf);
  80708d:	48 8b 05 4c 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2344c]        # 42a4e0 <running_req>
        r=async_write_disk(running_req->disk,\
  807094:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
         running_req->lba,running_req->sec_n,running_req->buf);
  807097:	48 8b 05 42 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23442]        # 42a4e0 <running_req>
  80709e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_write_disk(running_req->disk,\
  8070a1:	89 c6                	mov    esi,eax
  8070a3:	48 8b 05 36 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23436]        # 42a4e0 <running_req>
  8070aa:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8070ad:	89 c7                	mov    edi,eax
  8070af:	e8 88 01 00 00       	call   80723c <async_write_disk>
  8070b4:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  8070b7:	eb 32                	jmp    8070eb <execute_request+0x1e2>
        r=async_check_disk(running_req->disk);
  8070b9:	48 8b 05 20 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23420]        # 42a4e0 <running_req>
  8070c0:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8070c3:	89 c7                	mov    edi,eax
  8070c5:	e8 8f 06 00 00       	call   807759 <async_check_disk>
  8070ca:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  8070cd:	eb 1c                	jmp    8070eb <execute_request+0x1e2>
        r=async_reset_disk(running_req->disk);
  8070cf:	48 8b 05 0a 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2340a]        # 42a4e0 <running_req>
  8070d6:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8070d9:	89 c7                	mov    edi,eax
  8070db:	b8 00 00 00 00       	mov    eax,0x0
  8070e0:	e8 1a 00 00 00       	call   8070ff <async_reset_disk>
  8070e5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  8070e8:	eb 01                	jmp    8070eb <execute_request+0x1e2>
        break;
  8070ea:	90                   	nop
    }
    if(r==-1)return -1;
  8070eb:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  8070ef:	75 07                	jne    8070f8 <execute_request+0x1ef>
  8070f1:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8070f6:	eb 05                	jmp    8070fd <execute_request+0x1f4>
    return 0;
  8070f8:	b8 00 00 00 00       	mov    eax,0x0
}
  8070fd:	c9                   	leave  
  8070fe:	c3                   	ret    

00000000008070ff <async_reset_disk>:
int async_reset_disk(int disk)
{
  8070ff:	f3 0f 1e fa          	endbr64 
  807103:	55                   	push   rbp
  807104:	48 89 e5             	mov    rbp,rsp
  807107:	48 83 ec 10          	sub    rsp,0x10
  80710b:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    outb(PORT_DISK_CONTROL,DISK_CMD_RESET);
  80710e:	be 0c 00 00 00       	mov    esi,0xc
  807113:	bf f6 03 00 00       	mov    edi,0x3f6
  807118:	e8 93 d6 ff ff       	call   8047b0 <outb>
    return 0;
  80711d:	b8 00 00 00 00       	mov    eax,0x0
}
  807122:	c9                   	leave  
  807123:	c3                   	ret    

0000000000807124 <async_read_disk>:
int async_read_disk(int disk,unsigned int lba,int sec_n,char* mem_addr)
{
  807124:	f3 0f 1e fa          	endbr64 
  807128:	55                   	push   rbp
  807129:	48 89 e5             	mov    rbp,rsp
  80712c:	48 83 ec 30          	sub    rsp,0x30
  807130:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  807133:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  807136:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  807139:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  80713d:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  807143:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  80714a:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  80714e:	74 06                	je     807156 <async_read_disk+0x32>
  807150:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  807154:	75 06                	jne    80715c <async_read_disk+0x38>
        port=PORT_DISK_SLAVE;
  807156:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  80715c:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  807160:	74 06                	je     807168 <async_read_disk+0x44>
  807162:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  807166:	75 07                	jne    80716f <async_read_disk+0x4b>
        slave_disk=1;
  807168:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    outb(port+2,sec_n);
  80716f:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  807172:	0f b6 d0             	movzx  edx,al
  807175:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807179:	83 c0 02             	add    eax,0x2
  80717c:	0f b7 c0             	movzx  eax,ax
  80717f:	89 d6                	mov    esi,edx
  807181:	89 c7                	mov    edi,eax
  807183:	e8 28 d6 ff ff       	call   8047b0 <outb>
    outb(port+3,lba&0xff);
  807188:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80718b:	0f b6 d0             	movzx  edx,al
  80718e:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807192:	83 c0 03             	add    eax,0x3
  807195:	0f b7 c0             	movzx  eax,ax
  807198:	89 d6                	mov    esi,edx
  80719a:	89 c7                	mov    edi,eax
  80719c:	e8 0f d6 ff ff       	call   8047b0 <outb>
    outb(port+4,(lba>>8)&0xff);
  8071a1:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8071a4:	c1 e8 08             	shr    eax,0x8
  8071a7:	0f b6 d0             	movzx  edx,al
  8071aa:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8071ae:	83 c0 04             	add    eax,0x4
  8071b1:	0f b7 c0             	movzx  eax,ax
  8071b4:	89 d6                	mov    esi,edx
  8071b6:	89 c7                	mov    edi,eax
  8071b8:	e8 f3 d5 ff ff       	call   8047b0 <outb>
    outb(port+5,(lba>>16)&0xff);
  8071bd:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8071c0:	c1 e8 10             	shr    eax,0x10
  8071c3:	0f b6 d0             	movzx  edx,al
  8071c6:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8071ca:	83 c0 05             	add    eax,0x5
  8071cd:	0f b7 c0             	movzx  eax,ax
  8071d0:	89 d6                	mov    esi,edx
  8071d2:	89 c7                	mov    edi,eax
  8071d4:	e8 d7 d5 ff ff       	call   8047b0 <outb>
    char drv=slave_disk?0x10:0;
  8071d9:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  8071dd:	74 07                	je     8071e6 <async_read_disk+0xc2>
  8071df:	b8 10 00 00 00       	mov    eax,0x10
  8071e4:	eb 05                	jmp    8071eb <async_read_disk+0xc7>
  8071e6:	b8 00 00 00 00       	mov    eax,0x0
  8071eb:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
    char lba_hi=(lba>>24)&0xf|drv|0xe0;
  8071ee:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8071f1:	c1 e8 18             	shr    eax,0x18
  8071f4:	83 e0 0f             	and    eax,0xf
  8071f7:	89 c2                	mov    edx,eax
  8071f9:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  8071fd:	09 d0                	or     eax,edx
  8071ff:	83 c8 e0             	or     eax,0xffffffe0
  807202:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
    outb(port+6,lba_hi);
  807205:	0f b6 45 f6          	movzx  eax,BYTE PTR [rbp-0xa]
  807209:	0f b6 d0             	movzx  edx,al
  80720c:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807210:	83 c0 06             	add    eax,0x6
  807213:	0f b7 c0             	movzx  eax,ax
  807216:	89 d6                	mov    esi,edx
  807218:	89 c7                	mov    edi,eax
  80721a:	e8 91 d5 ff ff       	call   8047b0 <outb>
    outb(port+7,DISK_CMD_READ);
  80721f:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807223:	83 c0 07             	add    eax,0x7
  807226:	0f b7 c0             	movzx  eax,ax
  807229:	be 20 00 00 00       	mov    esi,0x20
  80722e:	89 c7                	mov    edi,eax
  807230:	e8 7b d5 ff ff       	call   8047b0 <outb>
    // }
    // for(int i=0;i<running_req->sec_n*256;i++)
    // {
    //     *mem_addr++=inw(port);
    // }
    return 0;
  807235:	b8 00 00 00 00       	mov    eax,0x0
}
  80723a:	c9                   	leave  
  80723b:	c3                   	ret    

000000000080723c <async_write_disk>:
int async_write_disk(int disk,unsigned int lba, int sec_n, char* mem_ptr)
{
  80723c:	f3 0f 1e fa          	endbr64 
  807240:	55                   	push   rbp
  807241:	48 89 e5             	mov    rbp,rsp
  807244:	48 83 ec 30          	sub    rsp,0x30
  807248:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80724b:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80724e:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  807251:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  807255:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  80725b:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  807262:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  807266:	74 06                	je     80726e <async_write_disk+0x32>
  807268:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  80726c:	75 06                	jne    807274 <async_write_disk+0x38>
        port=PORT_DISK_SLAVE;
  80726e:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  807274:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  807278:	74 06                	je     807280 <async_write_disk+0x44>
  80727a:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  80727e:	75 07                	jne    807287 <async_write_disk+0x4b>
        slave_disk=1;
  807280:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    while (1)
    {
        byte t=inb(0x1f7);
  807287:	bf f7 00 00 00       	mov    edi,0xf7
  80728c:	e8 38 d5 ff ff       	call   8047c9 <inb>
  807291:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
        //logf("istat:%x",t);
        byte err=t&1;
  807294:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  807298:	83 e0 01             	and    eax,0x1
  80729b:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
        if(err!=0)
  80729e:	80 7d f6 00          	cmp    BYTE PTR [rbp-0xa],0x0
  8072a2:	74 0a                	je     8072ae <async_write_disk+0x72>
        {
            //printf("ERR iwriting disk\n");
            return -1;
  8072a4:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8072a9:	e9 d5 00 00 00       	jmp    807383 <async_write_disk+0x147>
        }
        t&=0x88;
  8072ae:	80 65 f7 88          	and    BYTE PTR [rbp-0x9],0x88
        if(t==0x8)break;
  8072b2:	80 7d f7 08          	cmp    BYTE PTR [rbp-0x9],0x8
  8072b6:	74 02                	je     8072ba <async_write_disk+0x7e>
    {
  8072b8:	eb cd                	jmp    807287 <async_write_disk+0x4b>
        if(t==0x8)break;
  8072ba:	90                   	nop
    }
    outb(port+2,sec_n);
  8072bb:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8072be:	0f b6 d0             	movzx  edx,al
  8072c1:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8072c5:	83 c0 02             	add    eax,0x2
  8072c8:	0f b7 c0             	movzx  eax,ax
  8072cb:	89 d6                	mov    esi,edx
  8072cd:	89 c7                	mov    edi,eax
  8072cf:	e8 dc d4 ff ff       	call   8047b0 <outb>
    outb(port+3,lba&0xff);
  8072d4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8072d7:	0f b6 d0             	movzx  edx,al
  8072da:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8072de:	83 c0 03             	add    eax,0x3
  8072e1:	0f b7 c0             	movzx  eax,ax
  8072e4:	89 d6                	mov    esi,edx
  8072e6:	89 c7                	mov    edi,eax
  8072e8:	e8 c3 d4 ff ff       	call   8047b0 <outb>
    outb(port+4,(lba>>8)&0xff);
  8072ed:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8072f0:	c1 e8 08             	shr    eax,0x8
  8072f3:	0f b6 d0             	movzx  edx,al
  8072f6:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8072fa:	83 c0 04             	add    eax,0x4
  8072fd:	0f b7 c0             	movzx  eax,ax
  807300:	89 d6                	mov    esi,edx
  807302:	89 c7                	mov    edi,eax
  807304:	e8 a7 d4 ff ff       	call   8047b0 <outb>
    outb(port+5,(lba>>16)&0xff);
  807309:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80730c:	c1 e8 10             	shr    eax,0x10
  80730f:	0f b6 d0             	movzx  edx,al
  807312:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807316:	83 c0 05             	add    eax,0x5
  807319:	0f b7 c0             	movzx  eax,ax
  80731c:	89 d6                	mov    esi,edx
  80731e:	89 c7                	mov    edi,eax
  807320:	e8 8b d4 ff ff       	call   8047b0 <outb>
    char drv=slave_disk?0x10:0;
  807325:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  807329:	74 07                	je     807332 <async_write_disk+0xf6>
  80732b:	b8 10 00 00 00       	mov    eax,0x10
  807330:	eb 05                	jmp    807337 <async_write_disk+0xfb>
  807332:	b8 00 00 00 00       	mov    eax,0x0
  807337:	88 45 f5             	mov    BYTE PTR [rbp-0xb],al
    unsigned char lba_hi=(lba>>24)&0xf|drv|0xe0;
  80733a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80733d:	c1 e8 18             	shr    eax,0x18
  807340:	83 e0 0f             	and    eax,0xf
  807343:	89 c2                	mov    edx,eax
  807345:	0f b6 45 f5          	movzx  eax,BYTE PTR [rbp-0xb]
  807349:	09 d0                	or     eax,edx
  80734b:	83 c8 e0             	or     eax,0xffffffe0
  80734e:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    outb(port+6,lba_hi);
  807351:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  807355:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807359:	83 c0 06             	add    eax,0x6
  80735c:	0f b7 c0             	movzx  eax,ax
  80735f:	89 d6                	mov    esi,edx
  807361:	89 c7                	mov    edi,eax
  807363:	e8 48 d4 ff ff       	call   8047b0 <outb>
    outb(port+7,DISK_CMD_WRITE);
  807368:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80736c:	83 c0 07             	add    eax,0x7
  80736f:	0f b7 c0             	movzx  eax,ax
  807372:	be 30 00 00 00       	mov    esi,0x30
  807377:	89 c7                	mov    edi,eax
  807379:	e8 32 d4 ff ff       	call   8047b0 <outb>
    //     if(t==0x8)break;
    // }
    // short *p=mem_ptr;
    // for(int i=0;i<running_req->sec_n*256;i++)
    //         outw(port,*p++);
    return 0;
  80737e:	b8 00 00 00 00       	mov    eax,0x0
}
  807383:	c9                   	leave  
  807384:	c3                   	ret    

0000000000807385 <read_disk>:
int read_disk(driver_args* args)
{
  807385:	f3 0f 1e fa          	endbr64 
  807389:	55                   	push   rbp
  80738a:	48 89 e5             	mov    rbp,rsp
  80738d:	48 83 ec 20          	sub    rsp,0x20
  807391:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=read_disk_asm(args->lba,args->sec_c,args->dist_addr);
  807395:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807399:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80739c:	48 98                	cdqe   
  80739e:	48 89 c2             	mov    rdx,rax
  8073a1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8073a5:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  8073a8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8073ac:	8b 00                	mov    eax,DWORD PTR [rax]
  8073ae:	89 ce                	mov    esi,ecx
  8073b0:	89 c7                	mov    edi,eax
  8073b2:	e8 95 05 00 00       	call   80794c <read_disk_asm>
  8073b7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  8073ba:	48 8b 05 1f 31 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2311f]        # 42a4e0 <running_req>
  8073c1:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  8073c8:	48 8b 05 11 31 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23111]        # 42a4e0 <running_req>
  8073cf:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  8073d3:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  8073da:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  8073dd:	48 c7 05 f8 30 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc230f8],0x0        # 42a4e0 <running_req>
  8073e4:	00 00 00 00 
    return ret;
  8073e8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8073eb:	c9                   	leave  
  8073ec:	c3                   	ret    

00000000008073ed <write_disk>:
int write_disk(driver_args* args)
{
  8073ed:	f3 0f 1e fa          	endbr64 
  8073f1:	55                   	push   rbp
  8073f2:	48 89 e5             	mov    rbp,rsp
  8073f5:	48 83 ec 20          	sub    rsp,0x20
  8073f9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=write_disk_asm(args->lba,args->sec_c,args->src_addr);
  8073fd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807401:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  807404:	48 98                	cdqe   
  807406:	48 89 c2             	mov    rdx,rax
  807409:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80740d:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  807410:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807414:	8b 00                	mov    eax,DWORD PTR [rax]
  807416:	89 ce                	mov    esi,ecx
  807418:	89 c7                	mov    edi,eax
  80741a:	e8 ad 05 00 00       	call   8079cc <write_disk_asm>
  80741f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  807422:	48 8b 05 b7 30 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc230b7]        # 42a4e0 <running_req>
  807429:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  807430:	48 8b 05 a9 30 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc230a9]        # 42a4e0 <running_req>
  807437:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  80743b:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  807442:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  807445:	48 c7 05 90 30 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23090],0x0        # 42a4e0 <running_req>
  80744c:	00 00 00 00 
    return ret;
  807450:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  807453:	c9                   	leave  
  807454:	c3                   	ret    

0000000000807455 <chk_result>:
int chk_result(int r)
{
  807455:	f3 0f 1e fa          	endbr64 
  807459:	55                   	push   rbp
  80745a:	48 89 e5             	mov    rbp,rsp
  80745d:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(disk_reqs[r].stat!=REQ_STAT_DONE);
  807460:	90                   	nop
  807461:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807464:	48 63 d0             	movsxd rdx,eax
  807467:	48 89 d0             	mov    rax,rdx
  80746a:	48 01 c0             	add    rax,rax
  80746d:	48 01 d0             	add    rax,rdx
  807470:	48 c1 e0 04          	shl    rax,0x4
  807474:	48 05 fc 77 42 00    	add    rax,0x4277fc
  80747a:	8b 00                	mov    eax,DWORD PTR [rax]
  80747c:	83 f8 03             	cmp    eax,0x3
  80747f:	75 e0                	jne    807461 <chk_result+0xc>
    return disk_reqs[r].result==DISK_CHK_OK?1:0;
  807481:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807484:	48 63 d0             	movsxd rdx,eax
  807487:	48 89 d0             	mov    rax,rdx
  80748a:	48 01 c0             	add    rax,rax
  80748d:	48 01 d0             	add    rax,rdx
  807490:	48 c1 e0 04          	shl    rax,0x4
  807494:	48 05 00 78 42 00    	add    rax,0x427800
  80749a:	8b 00                	mov    eax,DWORD PTR [rax]
  80749c:	83 f8 01             	cmp    eax,0x1
  80749f:	0f 94 c0             	sete   al
  8074a2:	0f b6 c0             	movzx  eax,al
}
  8074a5:	5d                   	pop    rbp
  8074a6:	c3                   	ret    

00000000008074a7 <disk_existent>:
int disk_existent(int disk)
{
  8074a7:	f3 0f 1e fa          	endbr64 
  8074ab:	55                   	push   rbp
  8074ac:	48 89 e5             	mov    rbp,rsp
  8074af:	48 83 ec 10          	sub    rsp,0x10
  8074b3:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    switch (disk)
  8074b6:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  8074ba:	74 5f                	je     80751b <disk_existent+0x74>
  8074bc:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  8074c0:	7f 6e                	jg     807530 <disk_existent+0x89>
  8074c2:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  8074c6:	74 3e                	je     807506 <disk_existent+0x5f>
  8074c8:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  8074cc:	7f 62                	jg     807530 <disk_existent+0x89>
  8074ce:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8074d2:	74 08                	je     8074dc <disk_existent+0x35>
  8074d4:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
  8074d8:	74 17                	je     8074f1 <disk_existent+0x4a>
        
    case DISK_SLAVE_SLAVE:
        return sys_find_dev("hd3")!=-1;
        break;
    default:
        break;
  8074da:	eb 54                	jmp    807530 <disk_existent+0x89>
        return sys_find_dev("hd0")!=-1;
  8074dc:	bf 34 32 81 00       	mov    edi,0x813234
  8074e1:	e8 f3 b2 ff ff       	call   8027d9 <sys_find_dev>
  8074e6:	83 f8 ff             	cmp    eax,0xffffffff
  8074e9:	0f 95 c0             	setne  al
  8074ec:	0f b6 c0             	movzx  eax,al
  8074ef:	eb 45                	jmp    807536 <disk_existent+0x8f>
        return sys_find_dev("hd1")!=-1;
  8074f1:	bf 38 32 81 00       	mov    edi,0x813238
  8074f6:	e8 de b2 ff ff       	call   8027d9 <sys_find_dev>
  8074fb:	83 f8 ff             	cmp    eax,0xffffffff
  8074fe:	0f 95 c0             	setne  al
  807501:	0f b6 c0             	movzx  eax,al
  807504:	eb 30                	jmp    807536 <disk_existent+0x8f>
        return sys_find_dev("hd2")!=-1;
  807506:	bf 3c 32 81 00       	mov    edi,0x81323c
  80750b:	e8 c9 b2 ff ff       	call   8027d9 <sys_find_dev>
  807510:	83 f8 ff             	cmp    eax,0xffffffff
  807513:	0f 95 c0             	setne  al
  807516:	0f b6 c0             	movzx  eax,al
  807519:	eb 1b                	jmp    807536 <disk_existent+0x8f>
        return sys_find_dev("hd3")!=-1;
  80751b:	bf 40 32 81 00       	mov    edi,0x813240
  807520:	e8 b4 b2 ff ff       	call   8027d9 <sys_find_dev>
  807525:	83 f8 ff             	cmp    eax,0xffffffff
  807528:	0f 95 c0             	setne  al
  80752b:	0f b6 c0             	movzx  eax,al
  80752e:	eb 06                	jmp    807536 <disk_existent+0x8f>
        break;
  807530:	90                   	nop
    }
    return 0;
  807531:	b8 00 00 00 00       	mov    eax,0x0
}
  807536:	c9                   	leave  
  807537:	c3                   	ret    

0000000000807538 <hd_iterate>:
int hd_iterate()
{
  807538:	f3 0f 1e fa          	endbr64 
  80753c:	55                   	push   rbp
  80753d:	48 89 e5             	mov    rbp,rsp
  807540:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
    char *name;
    
    int r[4];
    r[0]=request(DISK_MAJOR_MAJOR,DISKREQ_CHECK,0,1,0);
  807547:	41 b8 00 00 00 00    	mov    r8d,0x0
  80754d:	b9 01 00 00 00       	mov    ecx,0x1
  807552:	ba 00 00 00 00       	mov    edx,0x0
  807557:	be 02 00 00 00       	mov    esi,0x2
  80755c:	bf 00 00 00 00       	mov    edi,0x0
  807561:	e8 3b f8 ff ff       	call   806da1 <request>
  807566:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    r[1]=request(DISK_MAJOR_SLAVE,DISKREQ_CHECK,0,1,0);
  807569:	41 b8 00 00 00 00    	mov    r8d,0x0
  80756f:	b9 01 00 00 00       	mov    ecx,0x1
  807574:	ba 00 00 00 00       	mov    edx,0x0
  807579:	be 02 00 00 00       	mov    esi,0x2
  80757e:	bf 01 00 00 00       	mov    edi,0x1
  807583:	e8 19 f8 ff ff       	call   806da1 <request>
  807588:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    r[2]=request(DISK_SLAVE_MAJOR,DISKREQ_CHECK,0,1,0);
  80758b:	41 b8 00 00 00 00    	mov    r8d,0x0
  807591:	b9 01 00 00 00       	mov    ecx,0x1
  807596:	ba 00 00 00 00       	mov    edx,0x0
  80759b:	be 02 00 00 00       	mov    esi,0x2
  8075a0:	bf 02 00 00 00       	mov    edi,0x2
  8075a5:	e8 f7 f7 ff ff       	call   806da1 <request>
  8075aa:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    r[3]=request(DISK_SLAVE_SLAVE,DISKREQ_CHECK,0,1,0);
  8075ad:	41 b8 00 00 00 00    	mov    r8d,0x0
  8075b3:	b9 01 00 00 00       	mov    ecx,0x1
  8075b8:	ba 00 00 00 00       	mov    edx,0x0
  8075bd:	be 02 00 00 00       	mov    esi,0x2
  8075c2:	bf 03 00 00 00       	mov    edi,0x3
  8075c7:	e8 d5 f7 ff ff       	call   806da1 <request>
  8075cc:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    for(int i=0;i<1;i++)
  8075cf:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8075d6:	e9 72 01 00 00       	jmp    80774d <hd_iterate+0x215>
    {
        int disk;
        switch (i)
  8075db:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8075df:	74 3b                	je     80761c <hd_iterate+0xe4>
  8075e1:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8075e5:	7f 3e                	jg     807625 <hd_iterate+0xed>
  8075e7:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  8075eb:	74 26                	je     807613 <hd_iterate+0xdb>
  8075ed:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  8075f1:	7f 32                	jg     807625 <hd_iterate+0xed>
  8075f3:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8075f7:	74 08                	je     807601 <hd_iterate+0xc9>
  8075f9:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  8075fd:	74 0b                	je     80760a <hd_iterate+0xd2>
  8075ff:	eb 24                	jmp    807625 <hd_iterate+0xed>
        {
        case 0:disk=DISK_MAJOR_MAJOR;break;
  807601:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  807608:	eb 25                	jmp    80762f <hd_iterate+0xf7>
        case 1:disk=DISK_MAJOR_SLAVE;break;
  80760a:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [rbp-0x10],0x1
  807611:	eb 1c                	jmp    80762f <hd_iterate+0xf7>
        case 2:disk=DISK_SLAVE_MAJOR;break;
  807613:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [rbp-0x10],0x2
  80761a:	eb 13                	jmp    80762f <hd_iterate+0xf7>
        case 3:disk=DISK_SLAVE_SLAVE;break;
  80761c:	c7 45 f0 03 00 00 00 	mov    DWORD PTR [rbp-0x10],0x3
  807623:	eb 0a                	jmp    80762f <hd_iterate+0xf7>
        default:
            return -1;
  807625:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80762a:	e9 28 01 00 00       	jmp    807757 <hd_iterate+0x21f>
            break;
        }
        if(chk_result(r[i]))//&&!disk_existent(disk)
  80762f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807632:	48 98                	cdqe   
  807634:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  807638:	89 c7                	mov    edi,eax
  80763a:	e8 16 fe ff ff       	call   807455 <chk_result>
  80763f:	85 c0                	test   eax,eax
  807641:	0f 84 81 00 00 00    	je     8076c8 <hd_iterate+0x190>
        {
            printf("disk %d checked.\n",i);
  807647:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80764a:	89 c6                	mov    esi,eax
  80764c:	bf 44 32 81 00       	mov    edi,0x813244
  807651:	b8 00 00 00 00       	mov    eax,0x0
  807656:	e8 82 96 ff ff       	call   800cdd <printf>
            //新硬盘
            device hd={
  80765b:	48 8d 95 20 ff ff ff 	lea    rdx,[rbp-0xe0]
  807662:	b8 00 00 00 00       	mov    eax,0x0
  807667:	b9 15 00 00 00       	mov    ecx,0x15
  80766c:	48 89 d7             	mov    rdi,rdx
  80766f:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  807672:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  807675:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  80767b:	c7 85 28 ff ff ff 01 	mov    DWORD PTR [rbp-0xd8],0x1
  807682:	00 00 00 
  807685:	c7 85 2c ff ff ff 01 	mov    DWORD PTR [rbp-0xd4],0x1
  80768c:	00 00 00 
                .type=DEV_TYPE_BLKDEV,
                .stype=DEV_STYPE_HD,
                .slave_dev=disk,
                .start_port=i<2?PORT_DISK_MAJOR:PORT_DISK_SLAVE
  80768f:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  807693:	7f 07                	jg     80769c <hd_iterate+0x164>
  807695:	b8 f0 01 00 00       	mov    eax,0x1f0
  80769a:	eb 05                	jmp    8076a1 <hd_iterate+0x169>
  80769c:	b8 70 01 00 00       	mov    eax,0x170
            device hd={
  8076a1:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            };
            disks[i]=reg_device(&hd);
  8076a7:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  8076ae:	48 89 c7             	mov    rdi,rax
  8076b1:	e8 eb ac ff ff       	call   8023a1 <reg_device>
  8076b6:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8076b9:	48 63 d2             	movsxd rdx,edx
  8076bc:	89 04 95 00 a5 42 00 	mov    DWORD PTR [rdx*4+0x42a500],eax
  8076c3:	e9 81 00 00 00       	jmp    807749 <hd_iterate+0x211>
        }else if(!chk_result(r[i]))//&&disk_existent(disk)
  8076c8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8076cb:	48 98                	cdqe   
  8076cd:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  8076d1:	89 c7                	mov    edi,eax
  8076d3:	e8 7d fd ff ff       	call   807455 <chk_result>
  8076d8:	85 c0                	test   eax,eax
  8076da:	75 6d                	jne    807749 <hd_iterate+0x211>
        {
            switch (i)
  8076dc:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8076e0:	74 3e                	je     807720 <hd_iterate+0x1e8>
  8076e2:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8076e6:	7f 41                	jg     807729 <hd_iterate+0x1f1>
  8076e8:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  8076ec:	74 28                	je     807716 <hd_iterate+0x1de>
  8076ee:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  8076f2:	7f 35                	jg     807729 <hd_iterate+0x1f1>
  8076f4:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8076f8:	74 08                	je     807702 <hd_iterate+0x1ca>
  8076fa:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  8076fe:	74 0c                	je     80770c <hd_iterate+0x1d4>
  807700:	eb 27                	jmp    807729 <hd_iterate+0x1f1>
            {
            case 0:name="hd0";break;
  807702:	48 c7 45 f8 34 32 81 	mov    QWORD PTR [rbp-0x8],0x813234
  807709:	00 
  80770a:	eb 1d                	jmp    807729 <hd_iterate+0x1f1>
            case 1:name="hd1";break;
  80770c:	48 c7 45 f8 38 32 81 	mov    QWORD PTR [rbp-0x8],0x813238
  807713:	00 
  807714:	eb 13                	jmp    807729 <hd_iterate+0x1f1>
            case 2:name="hd2";break;
  807716:	48 c7 45 f8 3c 32 81 	mov    QWORD PTR [rbp-0x8],0x81323c
  80771d:	00 
  80771e:	eb 09                	jmp    807729 <hd_iterate+0x1f1>
            case 3:name="hd3";break;
  807720:	48 c7 45 f8 40 32 81 	mov    QWORD PTR [rbp-0x8],0x813240
  807727:	00 
  807728:	90                   	nop
            }
            //有硬盘被卸载了
            int devi=sys_find_dev(name);
  807729:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80772d:	48 89 c7             	mov    rdi,rax
  807730:	e8 a4 b0 ff ff       	call   8027d9 <sys_find_dev>
  807735:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            dispose_device(get_dev(devi));
  807738:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80773b:	89 c7                	mov    edi,eax
  80773d:	e8 6b b7 ff ff       	call   802ead <get_dev>
  807742:	89 c7                	mov    edi,eax
  807744:	e8 b7 b6 ff ff       	call   802e00 <dispose_device>
    for(int i=0;i<1;i++)
  807749:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80774d:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  807751:	0f 8e 84 fe ff ff    	jle    8075db <hd_iterate+0xa3>
        }

    }
}
  807757:	c9                   	leave  
  807758:	c3                   	ret    

0000000000807759 <async_check_disk>:

int async_check_disk(int disk)
{
  807759:	f3 0f 1e fa          	endbr64 
  80775d:	55                   	push   rbp
  80775e:	48 89 e5             	mov    rbp,rsp
  807761:	48 83 ec 20          	sub    rsp,0x20
  807765:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    unsigned short disknr=PORT_DISK_MAJOR;
  807768:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    unsigned short chkcmd=0xe0;
  80776e:	66 c7 45 fc e0 00    	mov    WORD PTR [rbp-0x4],0xe0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  807774:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  807778:	74 06                	je     807780 <async_check_disk+0x27>
  80777a:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  80777e:	75 06                	jne    807786 <async_check_disk+0x2d>
        disknr=PORT_DISK_SLAVE;
  807780:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_MAJOR_SLAVE||disk==DISK_SLAVE_SLAVE)
  807786:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  80778a:	74 06                	je     807792 <async_check_disk+0x39>
  80778c:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  807790:	75 06                	jne    807798 <async_check_disk+0x3f>
        chkcmd=0xf0;
  807792:	66 c7 45 fc f0 00    	mov    WORD PTR [rbp-0x4],0xf0
    outb(disknr+2,1);
  807798:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80779c:	83 c0 02             	add    eax,0x2
  80779f:	0f b7 c0             	movzx  eax,ax
  8077a2:	be 01 00 00 00       	mov    esi,0x1
  8077a7:	89 c7                	mov    edi,eax
  8077a9:	e8 02 d0 ff ff       	call   8047b0 <outb>
    outb(disknr+3,0);
  8077ae:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8077b2:	83 c0 03             	add    eax,0x3
  8077b5:	0f b7 c0             	movzx  eax,ax
  8077b8:	be 00 00 00 00       	mov    esi,0x0
  8077bd:	89 c7                	mov    edi,eax
  8077bf:	e8 ec cf ff ff       	call   8047b0 <outb>
    outb(disknr+4,0);
  8077c4:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8077c8:	83 c0 04             	add    eax,0x4
  8077cb:	0f b7 c0             	movzx  eax,ax
  8077ce:	be 00 00 00 00       	mov    esi,0x0
  8077d3:	89 c7                	mov    edi,eax
  8077d5:	e8 d6 cf ff ff       	call   8047b0 <outb>
    outb(disknr+5,0);
  8077da:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8077de:	83 c0 05             	add    eax,0x5
  8077e1:	0f b7 c0             	movzx  eax,ax
  8077e4:	be 00 00 00 00       	mov    esi,0x0
  8077e9:	89 c7                	mov    edi,eax
  8077eb:	e8 c0 cf ff ff       	call   8047b0 <outb>
    outb(disknr+6,chkcmd);//主硬盘
  8077f0:	0f b7 45 fc          	movzx  eax,WORD PTR [rbp-0x4]
  8077f4:	0f b6 d0             	movzx  edx,al
  8077f7:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8077fb:	83 c0 06             	add    eax,0x6
  8077fe:	0f b7 c0             	movzx  eax,ax
  807801:	89 d6                	mov    esi,edx
  807803:	89 c7                	mov    edi,eax
  807805:	e8 a6 cf ff ff       	call   8047b0 <outb>
    outb(disknr+7,DISK_CMD_CHECK);
  80780a:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80780e:	83 c0 07             	add    eax,0x7
  807811:	0f b7 c0             	movzx  eax,ax
  807814:	be 90 00 00 00       	mov    esi,0x90
  807819:	89 c7                	mov    edi,eax
  80781b:	e8 90 cf ff ff       	call   8047b0 <outb>
    //     // {
    //     //     printf("DISK ERR\n");
    //     //     return -1;
    //     // }
    // }
    return 0;
  807820:	b8 00 00 00 00       	mov    eax,0x0
}
  807825:	c9                   	leave  
  807826:	c3                   	ret    

0000000000807827 <hd_do_req>:

//接口函数：负责接收VFS的请求然后执行
int hd_do_req(driver_args *args)
{
  807827:	f3 0f 1e fa          	endbr64 
  80782b:	55                   	push   rbp
  80782c:	48 89 e5             	mov    rbp,rsp
  80782f:	48 83 ec 18          	sub    rsp,0x18
  807833:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int diski=0;
  807837:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;disks[diski]!=args->dev;diski++);
  80783e:	eb 04                	jmp    807844 <hd_do_req+0x1d>
  807840:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807844:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807847:	48 98                	cdqe   
  807849:	8b 14 85 00 a5 42 00 	mov    edx,DWORD PTR [rax*4+0x42a500]
  807850:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807854:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  80785a:	39 c2                	cmp    edx,eax
  80785c:	75 e2                	jne    807840 <hd_do_req+0x19>
    switch (args->cmd)
  80785e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807862:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  807868:	83 f8 04             	cmp    eax,0x4
  80786b:	74 72                	je     8078df <hd_do_req+0xb8>
  80786d:	83 f8 04             	cmp    eax,0x4
  807870:	0f 8f 96 00 00 00    	jg     80790c <hd_do_req+0xe5>
  807876:	83 f8 02             	cmp    eax,0x2
  807879:	74 0a                	je     807885 <hd_do_req+0x5e>
  80787b:	83 f8 03             	cmp    eax,0x3
  80787e:	74 32                	je     8078b2 <hd_do_req+0x8b>
  807880:	e9 87 00 00 00       	jmp    80790c <hd_do_req+0xe5>
    {
    case DRVF_READ:
        request(diski,DISKREQ_READ,args->lba,args->sec_c,args->dist_addr);
  807885:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807889:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80788c:	48 98                	cdqe   
  80788e:	48 89 c6             	mov    rsi,rax
  807891:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807895:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  807898:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80789c:	8b 10                	mov    edx,DWORD PTR [rax]
  80789e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8078a1:	49 89 f0             	mov    r8,rsi
  8078a4:	be 00 00 00 00       	mov    esi,0x0
  8078a9:	89 c7                	mov    edi,eax
  8078ab:	e8 f1 f4 ff ff       	call   806da1 <request>
        break;
  8078b0:	eb 61                	jmp    807913 <hd_do_req+0xec>
    case DRVF_WRITE:
        request(diski,DISKREQ_WRITE,args->lba,args->sec_c,args->src_addr);
  8078b2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8078b6:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8078b9:	48 98                	cdqe   
  8078bb:	48 89 c6             	mov    rsi,rax
  8078be:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8078c2:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  8078c5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8078c9:	8b 10                	mov    edx,DWORD PTR [rax]
  8078cb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8078ce:	49 89 f0             	mov    r8,rsi
  8078d1:	be 01 00 00 00       	mov    esi,0x1
  8078d6:	89 c7                	mov    edi,eax
  8078d8:	e8 c4 f4 ff ff       	call   806da1 <request>
        break;
  8078dd:	eb 34                	jmp    807913 <hd_do_req+0xec>
    case DRVF_CHK:
        request(diski,DISKREQ_CHECK,args->lba,args->sec_c,args->dist_addr);
  8078df:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8078e3:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8078e6:	48 98                	cdqe   
  8078e8:	48 89 c6             	mov    rsi,rax
  8078eb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8078ef:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  8078f2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8078f6:	8b 10                	mov    edx,DWORD PTR [rax]
  8078f8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8078fb:	49 89 f0             	mov    r8,rsi
  8078fe:	be 02 00 00 00       	mov    esi,0x2
  807903:	89 c7                	mov    edi,eax
  807905:	e8 97 f4 ff ff       	call   806da1 <request>
        break;
  80790a:	eb 07                	jmp    807913 <hd_do_req+0xec>
    default:return -1;
  80790c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807911:	eb 1e                	jmp    807931 <hd_do_req+0x10a>
    }
    args->stat=REQ_STAT_WORKING;
  807913:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807917:	c7 80 ac 00 00 00 02 	mov    DWORD PTR [rax+0xac],0x2
  80791e:	00 00 00 
    running_devman_req=args;
  807921:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807925:	48 89 05 bc 2b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22bbc],rax        # 42a4e8 <running_devman_req>
    return 0;
  80792c:	b8 00 00 00 00       	mov    eax,0x0
  807931:	c9                   	leave  
  807932:	c3                   	ret    
  807933:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  80793a:	00 00 00 
  80793d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000807940 <disk_int_handler>:
  807940:	e8 99 ce ff ff       	call   8047de <eoi>
  807945:	e8 68 f2 ff ff       	call   806bb2 <disk_int_handler_c>
  80794a:	48 cf                	iretq  

000000000080794c <read_disk_asm>:
  80794c:	55                   	push   rbp
  80794d:	89 e5                	mov    ebp,esp
  80794f:	66 ba f7 01          	mov    dx,0x1f7
  807953:	31 c9                	xor    ecx,ecx
  807955:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  80795a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  80795f:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  807964:	89 c6                	mov    esi,eax
  807966:	66 ba f2 01          	mov    dx,0x1f2
  80796a:	88 c8                	mov    al,cl
  80796c:	ee                   	out    dx,al
  80796d:	66 ba f3 01          	mov    dx,0x1f3
  807971:	89 f0                	mov    eax,esi
  807973:	ee                   	out    dx,al
  807974:	66 ff c2             	inc    dx
  807977:	c1 e8 08             	shr    eax,0x8
  80797a:	ee                   	out    dx,al
  80797b:	66 ff c2             	inc    dx
  80797e:	c1 e8 08             	shr    eax,0x8
  807981:	ee                   	out    dx,al
  807982:	66 ff c2             	inc    dx
  807985:	66 c1 e8 08          	shr    ax,0x8
  807989:	24 0f                	and    al,0xf
  80798b:	0c e0                	or     al,0xe0
  80798d:	ee                   	out    dx,al
  80798e:	66 ff c2             	inc    dx
  807991:	b0 20                	mov    al,0x20
  807993:	ee                   	out    dx,al

0000000000807994 <read_disk_asm.wait>:
  807994:	90                   	nop
  807995:	ec                   	in     al,dx
  807996:	24 88                	and    al,0x88
  807998:	3c 08                	cmp    al,0x8
  80799a:	75 f8                	jne    807994 <read_disk_asm.wait>
  80799c:	66 89 d7             	mov    di,dx
  80799f:	89 c8                	mov    eax,ecx
  8079a1:	66 b9 00 01          	mov    cx,0x100
  8079a5:	66 f7 e1             	mul    cx
  8079a8:	89 c1                	mov    ecx,eax
  8079aa:	66 ba f0 01          	mov    dx,0x1f0

00000000008079ae <read_disk_asm.read>:
  8079ae:	66 ed                	in     ax,dx
  8079b0:	66 67 89 03          	mov    WORD PTR [ebx],ax
  8079b4:	83 c3 02             	add    ebx,0x2
  8079b7:	e2 f5                	loop   8079ae <read_disk_asm.read>
  8079b9:	c9                   	leave  
  8079ba:	b8 00 00 00 00       	mov    eax,0x0
  8079bf:	c3                   	ret    

00000000008079c0 <read_disk_asm.err_disk_reading>:
  8079c0:	66 ba f1 01          	mov    dx,0x1f1
  8079c4:	31 c0                	xor    eax,eax
  8079c6:	66 ed                	in     ax,dx
  8079c8:	89 ec                	mov    esp,ebp
  8079ca:	5d                   	pop    rbp
  8079cb:	c3                   	ret    

00000000008079cc <write_disk_asm>:
  8079cc:	55                   	push   rbp
  8079cd:	89 e5                	mov    ebp,esp
  8079cf:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  8079d4:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  8079d9:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  8079de:	50                   	push   rax
  8079df:	66 ba f2 01          	mov    dx,0x1f2
  8079e3:	88 c8                	mov    al,cl
  8079e5:	ee                   	out    dx,al
  8079e6:	58                   	pop    rax
  8079e7:	66 ba f3 01          	mov    dx,0x1f3
  8079eb:	ee                   	out    dx,al
  8079ec:	c1 e8 08             	shr    eax,0x8
  8079ef:	66 ba f4 01          	mov    dx,0x1f4
  8079f3:	ee                   	out    dx,al
  8079f4:	c1 e8 08             	shr    eax,0x8
  8079f7:	66 ba f5 01          	mov    dx,0x1f5
  8079fb:	ee                   	out    dx,al
  8079fc:	c1 e8 08             	shr    eax,0x8
  8079ff:	24 0f                	and    al,0xf
  807a01:	0c e0                	or     al,0xe0
  807a03:	66 ba f6 01          	mov    dx,0x1f6
  807a07:	ee                   	out    dx,al
  807a08:	66 ba f7 01          	mov    dx,0x1f7
  807a0c:	b0 30                	mov    al,0x30
  807a0e:	ee                   	out    dx,al

0000000000807a0f <write_disk_asm.not_ready2>:
  807a0f:	90                   	nop
  807a10:	ec                   	in     al,dx
  807a11:	24 88                	and    al,0x88
  807a13:	3c 08                	cmp    al,0x8
  807a15:	75 f8                	jne    807a0f <write_disk_asm.not_ready2>
  807a17:	89 c8                	mov    eax,ecx
  807a19:	66 b9 00 01          	mov    cx,0x100
  807a1d:	66 f7 e1             	mul    cx
  807a20:	89 c1                	mov    ecx,eax
  807a22:	66 ba f0 01          	mov    dx,0x1f0

0000000000807a26 <write_disk_asm.go_on_write>:
  807a26:	66 67 8b 03          	mov    ax,WORD PTR [ebx]
  807a2a:	66 ef                	out    dx,ax
  807a2c:	83 c3 02             	add    ebx,0x2
  807a2f:	e2 f5                	loop   807a26 <write_disk_asm.go_on_write>
  807a31:	89 ec                	mov    esp,ebp
  807a33:	5d                   	pop    rbp
  807a34:	c3                   	ret    

0000000000807a35 <DISK1_FAT32_read_FAT_Entry>:
#include "mem.h"
#include "memory.h"
#include "proc.h"

unsigned int DISK1_FAT32_read_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry)
{
  807a35:	f3 0f 1e fa          	endbr64 
  807a39:	55                   	push   rbp
  807a3a:	48 89 e5             	mov    rbp,rsp
  807a3d:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  807a44:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  807a4b:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
	unsigned int buf[128];
	memset(buf,0,512);
  807a51:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  807a58:	ba 00 02 00 00       	mov    edx,0x200
  807a5d:	be 00 00 00 00       	mov    esi,0x0
  807a62:	48 89 c7             	mov    rdi,rax
  807a65:	e8 66 2e 00 00       	call   80a8d0 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  807a6a:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  807a71:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807a75:	89 c2                	mov    edx,eax
  807a77:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  807a7d:	c1 e8 07             	shr    eax,0x7
  807a80:	01 d0                	add    eax,edx
  807a82:	89 c2                	mov    edx,eax
  807a84:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  807a8b:	49 89 c0             	mov    r8,rax
  807a8e:	b9 01 00 00 00       	mov    ecx,0x1
  807a93:	be 00 00 00 00       	mov    esi,0x0
  807a98:	bf 00 00 00 00       	mov    edi,0x0
  807a9d:	e8 ff f2 ff ff       	call   806da1 <request>
  807aa2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    chk_result(r);
  807aa5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807aa8:	89 c7                	mov    edi,eax
  807aaa:	e8 a6 f9 ff ff       	call   807455 <chk_result>
    printf("DISK1_FAT32_read_FAT_Entry fat_entry:%x,%#010x\n",fat_entry,buf[fat_entry & 0x7f]);
  807aaf:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  807ab5:	83 e0 7f             	and    eax,0x7f
  807ab8:	89 c0                	mov    eax,eax
  807aba:	8b 94 85 f0 fd ff ff 	mov    edx,DWORD PTR [rbp+rax*4-0x210]
  807ac1:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  807ac7:	89 c6                	mov    esi,eax
  807ac9:	bf 58 32 81 00       	mov    edi,0x813258
  807ace:	b8 00 00 00 00       	mov    eax,0x0
  807ad3:	e8 05 92 ff ff       	call   800cdd <printf>
	return buf[fat_entry & 0x7f] & 0x0fffffff;
  807ad8:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  807ade:	83 e0 7f             	and    eax,0x7f
  807ae1:	89 c0                	mov    eax,eax
  807ae3:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  807aea:	25 ff ff ff 0f       	and    eax,0xfffffff
}
  807aef:	c9                   	leave  
  807af0:	c3                   	ret    

0000000000807af1 <DISK1_FAT32_write_FAT_Entry>:


unsigned long DISK1_FAT32_write_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry,unsigned int value)
{
  807af1:	f3 0f 1e fa          	endbr64 
  807af5:	55                   	push   rbp
  807af6:	48 89 e5             	mov    rbp,rsp
  807af9:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  807b00:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  807b07:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
  807b0d:	89 95 e0 fd ff ff    	mov    DWORD PTR [rbp-0x220],edx
	unsigned int buf[128];
	int i;

	memset(buf,0,512);
  807b13:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  807b1a:	ba 00 02 00 00       	mov    edx,0x200
  807b1f:	be 00 00 00 00       	mov    esi,0x0
  807b24:	48 89 c7             	mov    rdi,rax
  807b27:	e8 a4 2d 00 00       	call   80a8d0 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  807b2c:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  807b33:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807b37:	89 c2                	mov    edx,eax
  807b39:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  807b3f:	c1 e8 07             	shr    eax,0x7
  807b42:	01 d0                	add    eax,edx
  807b44:	89 c2                	mov    edx,eax
  807b46:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  807b4d:	49 89 c0             	mov    r8,rax
  807b50:	b9 01 00 00 00       	mov    ecx,0x1
  807b55:	be 00 00 00 00       	mov    esi,0x0
  807b5a:	bf 00 00 00 00       	mov    edi,0x0
  807b5f:	e8 3d f2 ff ff       	call   806da1 <request>
  807b64:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    chk_result(r);
  807b67:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807b6a:	89 c7                	mov    edi,eax
  807b6c:	e8 e4 f8 ff ff       	call   807455 <chk_result>
    buf[fat_entry & 0x7f] = (buf[fat_entry & 0x7f] & 0xf0000000) | (value & 0x0fffffff);
  807b71:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  807b77:	83 e0 7f             	and    eax,0x7f
  807b7a:	89 c0                	mov    eax,eax
  807b7c:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  807b83:	25 00 00 00 f0       	and    eax,0xf0000000
  807b88:	89 c6                	mov    esi,eax
  807b8a:	8b 85 e0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x220]
  807b90:	25 ff ff ff 0f       	and    eax,0xfffffff
  807b95:	89 c1                	mov    ecx,eax
  807b97:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  807b9d:	83 e0 7f             	and    eax,0x7f
  807ba0:	89 c2                	mov    edx,eax
  807ba2:	89 f0                	mov    eax,esi
  807ba4:	09 c8                	or     eax,ecx
  807ba6:	89 d2                	mov    edx,edx
  807ba8:	89 84 95 f0 fd ff ff 	mov    DWORD PTR [rbp+rdx*4-0x210],eax

	for(i = 0;i < fsbi->NumFATs;i++){
  807baf:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  807bb6:	eb 61                	jmp    807c19 <DISK1_FAT32_write_FAT_Entry+0x128>
        int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,fsbi->FAT1_firstsector + fsbi->sector_per_FAT * i + (fat_entry >> 7),1,(unsigned char *)buf);
  807bb8:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  807bbf:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807bc3:	89 c1                	mov    ecx,eax
  807bc5:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  807bcc:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  807bd0:	89 c2                	mov    edx,eax
  807bd2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807bd5:	48 98                	cdqe   
  807bd7:	0f af c2             	imul   eax,edx
  807bda:	8d 14 01             	lea    edx,[rcx+rax*1]
  807bdd:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  807be3:	c1 e8 07             	shr    eax,0x7
  807be6:	01 d0                	add    eax,edx
  807be8:	89 c2                	mov    edx,eax
  807bea:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  807bf1:	49 89 c0             	mov    r8,rax
  807bf4:	b9 01 00 00 00       	mov    ecx,0x1
  807bf9:	be 01 00 00 00       	mov    esi,0x1
  807bfe:	bf 00 00 00 00       	mov    edi,0x0
  807c03:	e8 99 f1 ff ff       	call   806da1 <request>
  807c08:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        chk_result(r1);
  807c0b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807c0e:	89 c7                	mov    edi,eax
  807c10:	e8 40 f8 ff ff       	call   807455 <chk_result>
	for(i = 0;i < fsbi->NumFATs;i++){
  807c15:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807c19:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807c1c:	48 63 d0             	movsxd rdx,eax
  807c1f:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  807c26:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  807c2a:	48 39 c2             	cmp    rdx,rax
  807c2d:	72 89                	jb     807bb8 <DISK1_FAT32_write_FAT_Entry+0xc7>
    }
	return 1;
  807c2f:	b8 01 00 00 00       	mov    eax,0x1
}
  807c34:	c9                   	leave  
  807c35:	c3                   	ret    

0000000000807c36 <FAT32_open>:


long FAT32_open(struct index_node * inode,struct file * filp)
{
  807c36:	f3 0f 1e fa          	endbr64 
  807c3a:	55                   	push   rbp
  807c3b:	48 89 e5             	mov    rbp,rsp
  807c3e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  807c42:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  807c46:	b8 01 00 00 00       	mov    eax,0x1
}
  807c4b:	5d                   	pop    rbp
  807c4c:	c3                   	ret    

0000000000807c4d <FAT32_close>:


long FAT32_close(struct index_node * inode,struct file * filp)
{
  807c4d:	f3 0f 1e fa          	endbr64 
  807c51:	55                   	push   rbp
  807c52:	48 89 e5             	mov    rbp,rsp
  807c55:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  807c59:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  807c5d:	b8 01 00 00 00       	mov    eax,0x1
}
  807c62:	5d                   	pop    rbp
  807c63:	c3                   	ret    

0000000000807c64 <FAT32_read>:


long FAT32_read(struct file * filp,char * buf,unsigned long count,long * position)
{
  807c64:	f3 0f 1e fa          	endbr64 
  807c68:	55                   	push   rbp
  807c69:	48 89 e5             	mov    rbp,rsp
  807c6c:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  807c70:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  807c74:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  807c78:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
  807c7c:	48 89 4d 80          	mov    QWORD PTR [rbp-0x80],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  807c80:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807c84:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807c88:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807c8c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807c90:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  807c94:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807c98:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807c9c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807ca0:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807ca4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807ca8:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

	unsigned long cluster = finode->first_cluster;
  807cac:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807cb0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807cb3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long sector = 0;
  807cb7:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  807cbe:	00 
	int i,length = 0;
  807cbf:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
	long retval = 0;
  807cc6:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  807ccd:	00 
	int index = *position / fsbi->bytes_per_cluster;
  807cce:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807cd2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807cd5:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  807cd9:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  807cdd:	48 99                	cqo    
  807cdf:	48 f7 fe             	idiv   rsi
  807ce2:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  807ce5:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807ce9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807cec:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  807cf0:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  807cf4:	48 99                	cqo    
  807cf6:	48 f7 f9             	idiv   rcx
  807cf9:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  807cfd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807d01:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807d05:	be 00 00 00 00       	mov    esi,0x0
  807d0a:	48 89 c7             	mov    rdi,rax
  807d0d:	b8 00 00 00 00       	mov    eax,0x0
  807d12:	e8 de 93 ff ff       	call   8010f5 <vmalloc>
  807d17:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax

	if(!cluster)
  807d1b:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  807d20:	75 0c                	jne    807d2e <FAT32_read+0xca>
		return -EFAULT;
  807d22:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  807d29:	e9 f0 01 00 00       	jmp    807f1e <FAT32_read+0x2ba>
	for(i = 0;i < index;i++)
  807d2e:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  807d35:	eb 1e                	jmp    807d55 <FAT32_read+0xf1>
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  807d37:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807d3b:	89 c2                	mov    edx,eax
  807d3d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807d41:	89 d6                	mov    esi,edx
  807d43:	48 89 c7             	mov    rdi,rax
  807d46:	e8 ea fc ff ff       	call   807a35 <DISK1_FAT32_read_FAT_Entry>
  807d4b:	89 c0                	mov    eax,eax
  807d4d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	for(i = 0;i < index;i++)
  807d51:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  807d55:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807d58:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  807d5b:	7c da                	jl     807d37 <FAT32_read+0xd3>

	if(*position + count > filp->dentry->dir_inode->file_size)
  807d5d:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807d61:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807d64:	48 89 c2             	mov    rdx,rax
  807d67:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807d6b:	48 01 c2             	add    rdx,rax
  807d6e:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807d72:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807d76:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807d7a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807d7d:	48 39 c2             	cmp    rdx,rax
  807d80:	76 2c                	jbe    807dae <FAT32_read+0x14a>
		index = count = filp->dentry->dir_inode->file_size - *position;
  807d82:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807d86:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807d8a:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807d8e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  807d91:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807d95:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807d98:	48 89 c1             	mov    rcx,rax
  807d9b:	48 89 d0             	mov    rax,rdx
  807d9e:	48 29 c8             	sub    rax,rcx
  807da1:	48 89 45 88          	mov    QWORD PTR [rbp-0x78],rax
  807da5:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807da9:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
  807dac:	eb 07                	jmp    807db5 <FAT32_read+0x151>
	else
		index = count;
  807dae:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807db2:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax

//	printf("FAT32_read first_cluster:%d,size:%d,preempt_count:%d\n",finode->first_cluster,filp->dentry->dir_inode->file_size,current->preempt_count);

	do
	{
		memset(buffer,0,fsbi->bytes_per_cluster);
  807db5:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807db9:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807dbd:	89 c2                	mov    edx,eax
  807dbf:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807dc3:	be 00 00 00 00       	mov    esi,0x0
  807dc8:	48 89 c7             	mov    rdi,rax
  807dcb:	e8 00 2b 00 00       	call   80a8d0 <memset>
		sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  807dd0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807dd4:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  807dd8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807ddc:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  807de0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807de4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807de8:	48 0f af c2          	imul   rax,rdx
  807dec:	48 01 c8             	add    rax,rcx
  807def:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  807df3:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807df7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807dfb:	89 c1                	mov    ecx,eax
  807dfd:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807e01:	89 c2                	mov    edx,eax
  807e03:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807e07:	49 89 c0             	mov    r8,rax
  807e0a:	be 00 00 00 00       	mov    esi,0x0
  807e0f:	bf 00 00 00 00       	mov    edi,0x0
  807e14:	e8 88 ef ff ff       	call   806da1 <request>
  807e19:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
		if(!chk_result(r))
  807e1c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807e1f:	89 c7                	mov    edi,eax
  807e21:	e8 2f f6 ff ff       	call   807455 <chk_result>
  807e26:	85 c0                	test   eax,eax
  807e28:	75 1c                	jne    807e46 <FAT32_read+0x1e2>
		{
			printf("FAT32 FS(read) read disk ERROR!!!!!!!!!!\n");
  807e2a:	bf 88 32 81 00       	mov    edi,0x813288
  807e2f:	b8 00 00 00 00       	mov    eax,0x0
  807e34:	e8 a4 8e ff ff       	call   800cdd <printf>
			retval = -EIO;
  807e39:	48 c7 45 e8 e3 ff ff 	mov    QWORD PTR [rbp-0x18],0xffffffffffffffe3
  807e40:	ff 
			break;
  807e41:	e9 ba 00 00 00       	jmp    807f00 <FAT32_read+0x29c>
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  807e46:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  807e49:	48 63 d0             	movsxd rdx,eax
  807e4c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807e50:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807e54:	48 2b 45 d8          	sub    rax,QWORD PTR [rbp-0x28]
  807e58:	48 39 c2             	cmp    rdx,rax
  807e5b:	48 0f 4e c2          	cmovle rax,rdx
  807e5f:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax

		if((unsigned long)buf < MAX_TASKS)
  807e62:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  807e66:	48 83 f8 1f          	cmp    rax,0x1f
  807e6a:	77 1f                	ja     807e8b <FAT32_read+0x227>
			memcpy(buffer + offset,buf,length);
  807e6c:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  807e6f:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  807e73:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807e77:	48 01 c1             	add    rcx,rax
  807e7a:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  807e7e:	48 89 c6             	mov    rsi,rax
  807e81:	48 89 cf             	mov    rdi,rcx
  807e84:	e8 98 29 00 00       	call   80a821 <memcpy>
  807e89:	eb 1d                	jmp    807ea8 <FAT32_read+0x244>
		else
			memcpy(buffer + offset,buf,length);
  807e8b:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  807e8e:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  807e92:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807e96:	48 01 c1             	add    rcx,rax
  807e99:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  807e9d:	48 89 c6             	mov    rsi,rax
  807ea0:	48 89 cf             	mov    rdi,rcx
  807ea3:	e8 79 29 00 00       	call   80a821 <memcpy>

		index -= length;
  807ea8:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  807eab:	29 45 e4             	sub    DWORD PTR [rbp-0x1c],eax
		buf += length;
  807eae:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  807eb1:	48 98                	cdqe   
  807eb3:	48 01 45 90          	add    QWORD PTR [rbp-0x70],rax
		offset -= offset;
  807eb7:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  807ebe:	00 
		*position += length;
  807ebf:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807ec3:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  807ec6:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  807ec9:	48 98                	cdqe   
  807ecb:	48 01 c2             	add    rdx,rax
  807ece:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807ed2:	48 89 10             	mov    QWORD PTR [rax],rdx
	}while(index && (cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster)));
  807ed5:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  807ed9:	74 25                	je     807f00 <FAT32_read+0x29c>
  807edb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807edf:	89 c2                	mov    edx,eax
  807ee1:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807ee5:	89 d6                	mov    esi,edx
  807ee7:	48 89 c7             	mov    rdi,rax
  807eea:	e8 46 fb ff ff       	call   807a35 <DISK1_FAT32_read_FAT_Entry>
  807eef:	89 c0                	mov    eax,eax
  807ef1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  807ef5:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  807efa:	0f 85 b5 fe ff ff    	jne    807db5 <FAT32_read+0x151>

	vmfree(buffer);
  807f00:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807f04:	48 89 c7             	mov    rdi,rax
  807f07:	e8 78 92 ff ff       	call   801184 <vmfree>
	if(!index)
  807f0c:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  807f10:	75 08                	jne    807f1a <FAT32_read+0x2b6>
		retval = count;
  807f12:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807f16:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	return retval;
  807f1a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
}
  807f1e:	c9                   	leave  
  807f1f:	c3                   	ret    

0000000000807f20 <FAT32_find_available_cluster>:


unsigned long FAT32_find_available_cluster(struct FAT32_sb_info * fsbi)
{
  807f20:	f3 0f 1e fa          	endbr64 
  807f24:	55                   	push   rbp
  807f25:	48 89 e5             	mov    rbp,rsp
  807f28:	48 81 ec 30 02 00 00 	sub    rsp,0x230
  807f2f:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
	int i,j;
	int fat_entry;
	unsigned long sector_per_fat = fsbi->sector_per_FAT;
  807f36:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  807f3d:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  807f41:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	unsigned int buf[128];

//	fsbi->fat_fsinfo->FSI_Free_Count & fsbi->fat_fsinfo->FSI_Nxt_Free not exactly,so unuse

	for(i = 0;i < sector_per_fat;i++)
  807f45:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  807f4c:	e9 8b 00 00 00       	jmp    807fdc <FAT32_find_available_cluster+0xbc>
	{
		memset(buf,0,512);
  807f51:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  807f58:	ba 00 02 00 00       	mov    edx,0x200
  807f5d:	be 00 00 00 00       	mov    esi,0x0
  807f62:	48 89 c7             	mov    rdi,rax
  807f65:	e8 66 29 00 00       	call   80a8d0 <memset>
		int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + i,1,(unsigned char *)buf);
  807f6a:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  807f71:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807f75:	89 c2                	mov    edx,eax
  807f77:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807f7a:	01 d0                	add    eax,edx
  807f7c:	89 c2                	mov    edx,eax
  807f7e:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  807f85:	49 89 c0             	mov    r8,rax
  807f88:	b9 01 00 00 00       	mov    ecx,0x1
  807f8d:	be 00 00 00 00       	mov    esi,0x0
  807f92:	bf 00 00 00 00       	mov    edi,0x0
  807f97:	e8 05 ee ff ff       	call   806da1 <request>
  807f9c:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

		for(j = 0;j < 128;j++)
  807f9f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807fa6:	eb 2a                	jmp    807fd2 <FAT32_find_available_cluster+0xb2>
		{
			if((buf[j] & 0x0fffffff) == 0)
  807fa8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807fab:	48 98                	cdqe   
  807fad:	8b 84 85 e0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x220]
  807fb4:	25 ff ff ff 0f       	and    eax,0xfffffff
  807fb9:	85 c0                	test   eax,eax
  807fbb:	75 11                	jne    807fce <FAT32_find_available_cluster+0xae>
				return (i << 7) + j;
  807fbd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807fc0:	c1 e0 07             	shl    eax,0x7
  807fc3:	89 c2                	mov    edx,eax
  807fc5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807fc8:	01 d0                	add    eax,edx
  807fca:	48 98                	cdqe   
  807fcc:	eb 22                	jmp    807ff0 <FAT32_find_available_cluster+0xd0>
		for(j = 0;j < 128;j++)
  807fce:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807fd2:	83 7d f8 7f          	cmp    DWORD PTR [rbp-0x8],0x7f
  807fd6:	7e d0                	jle    807fa8 <FAT32_find_available_cluster+0x88>
	for(i = 0;i < sector_per_fat;i++)
  807fd8:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807fdc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807fdf:	48 98                	cdqe   
  807fe1:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  807fe5:	0f 87 66 ff ff ff    	ja     807f51 <FAT32_find_available_cluster+0x31>
		}
	}
	return 0;
  807feb:	b8 00 00 00 00       	mov    eax,0x0
}
  807ff0:	c9                   	leave  
  807ff1:	c3                   	ret    

0000000000807ff2 <FAT32_write>:


long FAT32_write(struct file * filp,char * buf,unsigned long count,long * position)
{
  807ff2:	f3 0f 1e fa          	endbr64 
  807ff6:	55                   	push   rbp
  807ff7:	48 89 e5             	mov    rbp,rsp
  807ffa:	48 81 ec 90 00 00 00 	sub    rsp,0x90
  808001:	48 89 7d 88          	mov    QWORD PTR [rbp-0x78],rdi
  808005:	48 89 75 80          	mov    QWORD PTR [rbp-0x80],rsi
  808009:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  808010:	48 89 8d 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  808017:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80801b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80801f:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808023:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808027:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  80802b:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80802f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808033:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808037:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80803b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80803f:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned long cluster = finode->first_cluster;
  808043:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808047:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80804a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long next_cluster = 0;
  80804e:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  808055:	00 
	unsigned long sector = 0;
  808056:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80805d:	00 
	int i,length = 0;
  80805e:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
	long retval = 0;
  808065:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80806c:	00 
	long flags = 0;
  80806d:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  808074:	00 
	int index = *position / fsbi->bytes_per_cluster;
  808075:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80807c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80807f:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  808083:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  808087:	48 99                	cqo    
  808089:	48 f7 fe             	idiv   rsi
  80808c:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  80808f:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  808096:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808099:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80809d:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  8080a1:	48 99                	cqo    
  8080a3:	48 f7 f9             	idiv   rcx
  8080a6:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  8080aa:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8080ae:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8080b2:	be 00 00 00 00       	mov    esi,0x0
  8080b7:	48 89 c7             	mov    rdi,rax
  8080ba:	b8 00 00 00 00       	mov    eax,0x0
  8080bf:	e8 31 90 ff ff       	call   8010f5 <vmalloc>
  8080c4:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax

	if(!cluster)
  8080c8:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8080cd:	75 1a                	jne    8080e9 <FAT32_write+0xf7>
	{
		cluster = FAT32_find_available_cluster(fsbi);
  8080cf:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8080d3:	48 89 c7             	mov    rdi,rax
  8080d6:	e8 45 fe ff ff       	call   807f20 <FAT32_find_available_cluster>
  8080db:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		flags = 1;
  8080df:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  8080e6:	00 
  8080e7:	eb 2f                	jmp    808118 <FAT32_write+0x126>
	}
	else
		for(i = 0;i < index;i++)
  8080e9:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8080f0:	eb 1e                	jmp    808110 <FAT32_write+0x11e>
			cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  8080f2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8080f6:	89 c2                	mov    edx,eax
  8080f8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8080fc:	89 d6                	mov    esi,edx
  8080fe:	48 89 c7             	mov    rdi,rax
  808101:	e8 2f f9 ff ff       	call   807a35 <DISK1_FAT32_read_FAT_Entry>
  808106:	89 c0                	mov    eax,eax
  808108:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		for(i = 0;i < index;i++)
  80810c:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  808110:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808113:	3b 45 d4             	cmp    eax,DWORD PTR [rbp-0x2c]
  808116:	7c da                	jl     8080f2 <FAT32_write+0x100>

	if(!cluster)
  808118:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80811d:	75 18                	jne    808137 <FAT32_write+0x145>
	{
		vmfree(buffer);
  80811f:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808123:	48 89 c7             	mov    rdi,rax
  808126:	e8 59 90 ff ff       	call   801184 <vmfree>
		return -ENOSPC;
  80812b:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  808132:	e9 13 03 00 00       	jmp    80844a <FAT32_write+0x458>
	}

	if(flags)
  808137:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80813c:	74 4d                	je     80818b <FAT32_write+0x199>
	{
		finode->first_cluster = cluster;
  80813e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808142:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  808146:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  808149:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80814d:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808151:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808155:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808159:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80815d:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  808161:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808165:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808169:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80816d:	48 89 c7             	mov    rdi,rax
  808170:	ff d2                	call   rdx
		DISK1_FAT32_write_FAT_Entry(fsbi,cluster,0x0ffffff8);
  808172:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808176:	89 c1                	mov    ecx,eax
  808178:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80817c:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  808181:	89 ce                	mov    esi,ecx
  808183:	48 89 c7             	mov    rdi,rax
  808186:	e8 66 f9 ff ff       	call   807af1 <DISK1_FAT32_write_FAT_Entry>
	}

	index = count;
  80818b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  808192:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax

	do
	{
		if(!flags)
  808195:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80819a:	0f 85 91 00 00 00    	jne    808231 <FAT32_write+0x23f>
		{
			memset(buffer,0,fsbi->bytes_per_cluster);
  8081a0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8081a4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8081a8:	89 c2                	mov    edx,eax
  8081aa:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8081ae:	be 00 00 00 00       	mov    esi,0x0
  8081b3:	48 89 c7             	mov    rdi,rax
  8081b6:	e8 15 27 00 00       	call   80a8d0 <memset>
			sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  8081bb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8081bf:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  8081c3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8081c7:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  8081cb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8081cf:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8081d3:	48 0f af c2          	imul   rax,rdx
  8081d7:	48 01 c8             	add    rax,rcx
  8081da:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  8081de:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8081e2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8081e6:	89 c1                	mov    ecx,eax
  8081e8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8081ec:	89 c2                	mov    edx,eax
  8081ee:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8081f2:	49 89 c0             	mov    r8,rax
  8081f5:	be 00 00 00 00       	mov    esi,0x0
  8081fa:	bf 00 00 00 00       	mov    edi,0x0
  8081ff:	e8 9d eb ff ff       	call   806da1 <request>
  808204:	89 45 9c             	mov    DWORD PTR [rbp-0x64],eax

			if(!chk_result(r))
  808207:	8b 45 9c             	mov    eax,DWORD PTR [rbp-0x64]
  80820a:	89 c7                	mov    edi,eax
  80820c:	e8 44 f2 ff ff       	call   807455 <chk_result>
  808211:	85 c0                	test   eax,eax
  808213:	75 1c                	jne    808231 <FAT32_write+0x23f>
			{
				printf("FAT32 FS(write) read disk ERROR!!!!!!!!!!\n");
  808215:	bf b8 32 81 00       	mov    edi,0x8132b8
  80821a:	b8 00 00 00 00       	mov    eax,0x0
  80821f:	e8 b9 8a ff ff       	call   800cdd <printf>
				retval = -EIO;
  808224:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  80822b:	ff 
				break;
  80822c:	e9 95 01 00 00       	jmp    8083c6 <FAT32_write+0x3d4>
			}
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  808231:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  808234:	48 63 d0             	movsxd rdx,eax
  808237:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80823b:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80823f:	48 2b 45 c8          	sub    rax,QWORD PTR [rbp-0x38]
  808243:	48 39 c2             	cmp    rdx,rax
  808246:	48 0f 4e c2          	cmovle rax,rdx
  80824a:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax

		if((unsigned long)buf < MAX_TASKS)
  80824d:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808251:	48 83 f8 1f          	cmp    rax,0x1f
  808255:	77 1f                	ja     808276 <FAT32_write+0x284>
			memcpy(buf,buffer + offset,length);
  808257:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  80825a:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  80825e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808262:	48 01 c1             	add    rcx,rax
  808265:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808269:	48 89 ce             	mov    rsi,rcx
  80826c:	48 89 c7             	mov    rdi,rax
  80826f:	e8 ad 25 00 00       	call   80a821 <memcpy>
  808274:	eb 1d                	jmp    808293 <FAT32_write+0x2a1>
		else
			memcpy(buf,buffer + offset,length);
  808276:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  808279:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  80827d:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808281:	48 01 c1             	add    rcx,rax
  808284:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  808288:	48 89 ce             	mov    rsi,rcx
  80828b:	48 89 c7             	mov    rdi,rax
  80828e:	e8 8e 25 00 00       	call   80a821 <memcpy>

		int r=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  808293:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808297:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80829b:	89 c1                	mov    ecx,eax
  80829d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8082a1:	89 c2                	mov    edx,eax
  8082a3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8082a7:	49 89 c0             	mov    r8,rax
  8082aa:	be 01 00 00 00       	mov    esi,0x1
  8082af:	bf 00 00 00 00       	mov    edi,0x0
  8082b4:	e8 e8 ea ff ff       	call   806da1 <request>
  8082b9:	89 45 98             	mov    DWORD PTR [rbp-0x68],eax
        if(!chk_result(r))
  8082bc:	8b 45 98             	mov    eax,DWORD PTR [rbp-0x68]
  8082bf:	89 c7                	mov    edi,eax
  8082c1:	e8 8f f1 ff ff       	call   807455 <chk_result>
  8082c6:	85 c0                	test   eax,eax
  8082c8:	75 1c                	jne    8082e6 <FAT32_write+0x2f4>
		{
			printf("FAT32 FS(write) write disk ERROR!!!!!!!!!!\n");
  8082ca:	bf e8 32 81 00       	mov    edi,0x8132e8
  8082cf:	b8 00 00 00 00       	mov    eax,0x0
  8082d4:	e8 04 8a ff ff       	call   800cdd <printf>
			retval = -EIO;
  8082d9:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  8082e0:	ff 
			break;
  8082e1:	e9 e0 00 00 00       	jmp    8083c6 <FAT32_write+0x3d4>
		}

		index -= length;
  8082e6:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8082e9:	29 45 d4             	sub    DWORD PTR [rbp-0x2c],eax
		buf += length;
  8082ec:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8082ef:	48 98                	cdqe   
  8082f1:	48 01 45 80          	add    QWORD PTR [rbp-0x80],rax
		offset -= offset;
  8082f5:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  8082fc:	00 
		*position += length;
  8082fd:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  808304:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  808307:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80830a:	48 98                	cdqe   
  80830c:	48 01 c2             	add    rdx,rax
  80830f:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  808316:	48 89 10             	mov    QWORD PTR [rax],rdx

		if(index)
  808319:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  80831d:	0f 84 a2 00 00 00    	je     8083c5 <FAT32_write+0x3d3>
			next_cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  808323:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808327:	89 c2                	mov    edx,eax
  808329:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80832d:	89 d6                	mov    esi,edx
  80832f:	48 89 c7             	mov    rdi,rax
  808332:	e8 fe f6 ff ff       	call   807a35 <DISK1_FAT32_read_FAT_Entry>
  808337:	89 c0                	mov    eax,eax
  808339:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
		else
			break;

		if(next_cluster >= 0x0ffffff8)
  80833d:	48 81 7d b0 f7 ff ff 	cmp    QWORD PTR [rbp-0x50],0xffffff7
  808344:	0f 
  808345:	76 72                	jbe    8083b9 <FAT32_write+0x3c7>
		{
			next_cluster = FAT32_find_available_cluster(fsbi);
  808347:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80834b:	48 89 c7             	mov    rdi,rax
  80834e:	e8 cd fb ff ff       	call   807f20 <FAT32_find_available_cluster>
  808353:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
			if(!next_cluster)
  808357:	48 83 7d b0 00       	cmp    QWORD PTR [rbp-0x50],0x0
  80835c:	75 18                	jne    808376 <FAT32_write+0x384>
			{
				vmfree(buffer);
  80835e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808362:	48 89 c7             	mov    rdi,rax
  808365:	e8 1a 8e ff ff       	call   801184 <vmfree>
				return -ENOSPC;
  80836a:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  808371:	e9 d4 00 00 00       	jmp    80844a <FAT32_write+0x458>
			}			
				
			DISK1_FAT32_write_FAT_Entry(fsbi,cluster,next_cluster);
  808376:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80837a:	89 c2                	mov    edx,eax
  80837c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808380:	89 c1                	mov    ecx,eax
  808382:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808386:	89 ce                	mov    esi,ecx
  808388:	48 89 c7             	mov    rdi,rax
  80838b:	e8 61 f7 ff ff       	call   807af1 <DISK1_FAT32_write_FAT_Entry>
			DISK1_FAT32_write_FAT_Entry(fsbi,next_cluster,0x0ffffff8);
  808390:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808394:	89 c1                	mov    ecx,eax
  808396:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80839a:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  80839f:	89 ce                	mov    esi,ecx
  8083a1:	48 89 c7             	mov    rdi,rax
  8083a4:	e8 48 f7 ff ff       	call   807af1 <DISK1_FAT32_write_FAT_Entry>
			cluster = next_cluster;
  8083a9:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8083ad:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			flags = 1;
  8083b1:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  8083b8:	00 
		}

	}while(index);
  8083b9:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  8083bd:	0f 85 d2 fd ff ff    	jne    808195 <FAT32_write+0x1a3>
  8083c3:	eb 01                	jmp    8083c6 <FAT32_write+0x3d4>
			break;
  8083c5:	90                   	nop

	if(*position > filp->dentry->dir_inode->file_size)
  8083c6:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8083cd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8083d0:	48 89 c2             	mov    rdx,rax
  8083d3:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8083d7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8083db:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8083df:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8083e2:	48 39 c2             	cmp    rdx,rax
  8083e5:	76 42                	jbe    808429 <FAT32_write+0x437>
	{
		filp->dentry->dir_inode->file_size = *position;
  8083e7:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8083ee:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8083f1:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8083f5:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8083f9:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8083fd:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  808400:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808404:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808408:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80840c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808410:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  808414:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  808418:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80841c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808420:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808424:	48 89 c7             	mov    rdi,rax
  808427:	ff d2                	call   rdx
	}

	vmfree(buffer);
  808429:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80842d:	48 89 c7             	mov    rdi,rax
  808430:	e8 4f 8d ff ff       	call   801184 <vmfree>
	if(!index)
  808435:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  808439:	75 0b                	jne    808446 <FAT32_write+0x454>
		retval = count;
  80843b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  808442:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	return retval;
  808446:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  80844a:	c9                   	leave  
  80844b:	c3                   	ret    

000000000080844c <FAT32_lseek>:


long FAT32_lseek(struct file * filp,long offset,long origin)
{
  80844c:	f3 0f 1e fa          	endbr64 
  808450:	55                   	push   rbp
  808451:	48 89 e5             	mov    rbp,rsp
  808454:	48 83 ec 30          	sub    rsp,0x30
  808458:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80845c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  808460:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	struct index_node *inode = filp->dentry->dir_inode;
  808464:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808468:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80846c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808470:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	long pos = 0;
  808474:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80847b:	00 

	switch(origin)
  80847c:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  808481:	74 21                	je     8084a4 <FAT32_lseek+0x58>
  808483:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  808488:	7f 4a                	jg     8084d4 <FAT32_lseek+0x88>
  80848a:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80848f:	74 09                	je     80849a <FAT32_lseek+0x4e>
  808491:	48 83 7d d8 01       	cmp    QWORD PTR [rbp-0x28],0x1
  808496:	74 20                	je     8084b8 <FAT32_lseek+0x6c>
  808498:	eb 3a                	jmp    8084d4 <FAT32_lseek+0x88>
	{
		case SEEK_SET:
				pos = offset;
  80849a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80849e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  8084a2:	eb 39                	jmp    8084dd <FAT32_lseek+0x91>

		case SEEK_CUR:
				pos =  filp->position + offset;
  8084a4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8084a8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8084ab:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8084af:	48 01 d0             	add    rax,rdx
  8084b2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  8084b6:	eb 25                	jmp    8084dd <FAT32_lseek+0x91>

		case SEEK_END:
				pos = filp->dentry->dir_inode->file_size + offset;
  8084b8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8084bc:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8084c0:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8084c4:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8084c7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8084cb:	48 01 d0             	add    rax,rdx
  8084ce:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  8084d2:	eb 09                	jmp    8084dd <FAT32_lseek+0x91>

		default:
			return -EINVAL;
  8084d4:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  8084db:	eb 50                	jmp    80852d <FAT32_lseek+0xe1>
			break;
	}

	if(pos < 0 || pos > filp->dentry->dir_inode->file_size)
  8084dd:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8084e2:	78 18                	js     8084fc <FAT32_lseek+0xb0>
  8084e4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8084e8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8084ec:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8084f0:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8084f3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8084f7:	48 39 c2             	cmp    rdx,rax
  8084fa:	73 09                	jae    808505 <FAT32_lseek+0xb9>
		return -EOVERFLOW;
  8084fc:	48 c7 c0 bf ff ff ff 	mov    rax,0xffffffffffffffbf
  808503:	eb 28                	jmp    80852d <FAT32_lseek+0xe1>

	filp->position = pos;
  808505:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808509:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80850d:	48 89 10             	mov    QWORD PTR [rax],rdx
	printf("FAT32 FS(lseek) alert position:%d\n",filp->position);
  808510:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808514:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808517:	48 89 c6             	mov    rsi,rax
  80851a:	bf 18 33 81 00       	mov    edi,0x813318
  80851f:	b8 00 00 00 00       	mov    eax,0x0
  808524:	e8 b4 87 ff ff       	call   800cdd <printf>

	return pos;
  808529:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80852d:	c9                   	leave  
  80852e:	c3                   	ret    

000000000080852f <FAT32_ioctl>:


long FAT32_ioctl(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg)
{}
  80852f:	f3 0f 1e fa          	endbr64 
  808533:	55                   	push   rbp
  808534:	48 89 e5             	mov    rbp,rsp
  808537:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80853b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80853f:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  808543:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  808547:	90                   	nop
  808548:	5d                   	pop    rbp
  808549:	c3                   	ret    

000000000080854a <FAT32_readdir>:

long FAT32_readdir(struct file * filp,void * dirent,filldir_t filler)
{
  80854a:	f3 0f 1e fa          	endbr64 
  80854e:	55                   	push   rbp
  80854f:	48 89 e5             	mov    rbp,rsp
  808552:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  808556:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  80855a:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  80855e:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  808562:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808566:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80856a:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80856e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808572:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  808576:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80857a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80857e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808582:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808586:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80858a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned int cluster = 0;
  80858e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  808595:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  80859c:	00 
	unsigned char * buf =NULL; 
  80859d:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
  8085a4:	00 
	char *name = NULL;
  8085a5:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8085ac:	00 
	int namelen = 0;
  8085ad:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
	int i = 0,j = 0,x = 0,y = 0;
  8085b4:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  8085bb:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
  8085c2:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  8085c9:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  8085d0:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  8085d7:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  8085d8:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  8085df:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  8085e0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8085e4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8085e8:	be 00 00 00 00       	mov    esi,0x0
  8085ed:	48 89 c7             	mov    rdi,rax
  8085f0:	b8 00 00 00 00       	mov    eax,0x0
  8085f5:	e8 fb 8a ff ff       	call   8010f5 <vmalloc>
  8085fa:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax

	cluster = finode->first_cluster;
  8085fe:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808602:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808605:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

	j = filp->position/fsbi->bytes_per_cluster;
  808608:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80860c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80860f:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  808613:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  808617:	48 99                	cqo    
  808619:	48 f7 fe             	idiv   rsi
  80861c:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	
	for(i = 0;i<j;i++)
  80861f:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  808626:	eb 3a                	jmp    808662 <FAT32_readdir+0x118>
	{
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  808628:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80862b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80862f:	89 d6                	mov    esi,edx
  808631:	48 89 c7             	mov    rdi,rax
  808634:	e8 fc f3 ff ff       	call   807a35 <DISK1_FAT32_read_FAT_Entry>
  808639:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
		if(cluster > 0x0ffffff7)
  80863c:	81 7d fc f7 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff7
  808643:	76 19                	jbe    80865e <FAT32_readdir+0x114>
		{
			printf("FAT32 FS(readdir) cluster didn`t exist\n");
  808645:	bf 40 33 81 00       	mov    edi,0x813340
  80864a:	b8 00 00 00 00       	mov    eax,0x0
  80864f:	e8 89 86 ff ff       	call   800cdd <printf>
			return NULL;
  808654:	b8 00 00 00 00       	mov    eax,0x0
  808659:	e9 86 05 00 00       	jmp    808be4 <FAT32_readdir+0x69a>
	for(i = 0;i<j;i++)
  80865e:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  808662:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808665:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  808668:	7c be                	jl     808628 <FAT32_readdir+0xde>
		}
	}

next_cluster:
  80866a:	90                   	nop
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  80866b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80866f:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  808673:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808676:	83 e8 02             	sub    eax,0x2
  808679:	89 c1                	mov    ecx,eax
  80867b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80867f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808683:	48 0f af c1          	imul   rax,rcx
  808687:	48 01 d0             	add    rax,rdx
  80868a:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80868e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808692:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808696:	89 c1                	mov    ecx,eax
  808698:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80869c:	89 c2                	mov    edx,eax
  80869e:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8086a2:	49 89 c0             	mov    r8,rax
  8086a5:	be 00 00 00 00       	mov    esi,0x0
  8086aa:	bf 00 00 00 00       	mov    edi,0x0
  8086af:	e8 ed e6 ff ff       	call   806da1 <request>
  8086b4:	89 45 a4             	mov    DWORD PTR [rbp-0x5c],eax
    if(!chk_result(r))
  8086b7:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  8086ba:	89 c7                	mov    edi,eax
  8086bc:	e8 94 ed ff ff       	call   807455 <chk_result>
  8086c1:	85 c0                	test   eax,eax
  8086c3:	75 25                	jne    8086ea <FAT32_readdir+0x1a0>
	{
		printf("FAT32 FS(readdir) read disk ERROR!!!!!!!!!!\n");
  8086c5:	bf 68 33 81 00       	mov    edi,0x813368
  8086ca:	b8 00 00 00 00       	mov    eax,0x0
  8086cf:	e8 09 86 ff ff       	call   800cdd <printf>
		vmfree(buf);
  8086d4:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8086d8:	48 89 c7             	mov    rdi,rax
  8086db:	e8 a4 8a ff ff       	call   801184 <vmfree>
		return NULL;
  8086e0:	b8 00 00 00 00       	mov    eax,0x0
  8086e5:	e9 fa 04 00 00       	jmp    808be4 <FAT32_readdir+0x69a>
	}

	tmpdentry = (struct FAT32_Directory *)(buf + filp->position%fsbi->bytes_per_cluster);
  8086ea:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8086ee:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8086f1:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  8086f5:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  8086f9:	48 99                	cqo    
  8086fb:	48 f7 f9             	idiv   rcx
  8086fe:	48 89 d0             	mov    rax,rdx
  808701:	48 89 c2             	mov    rdx,rax
  808704:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808708:	48 01 d0             	add    rax,rdx
  80870b:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  80870f:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808713:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808716:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80871a:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  80871e:	48 99                	cqo    
  808720:	48 f7 f9             	idiv   rcx
  808723:	48 89 d0             	mov    rax,rdx
  808726:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  808729:	e9 2f 04 00 00       	jmp    808b5d <FAT32_readdir+0x613>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  80872e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808732:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  808736:	3c 0f                	cmp    al,0xf
  808738:	0f 84 00 04 00 00    	je     808b3e <FAT32_readdir+0x5f4>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  80873e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808742:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808745:	3c e5                	cmp    al,0xe5
  808747:	0f 84 f4 03 00 00    	je     808b41 <FAT32_readdir+0x5f7>
  80874d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808751:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808754:	84 c0                	test   al,al
  808756:	0f 84 e5 03 00 00    	je     808b41 <FAT32_readdir+0x5f7>
  80875c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808760:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808763:	3c 05                	cmp    al,0x5
  808765:	0f 84 d6 03 00 00    	je     808b41 <FAT32_readdir+0x5f7>
			continue;

		namelen = 0;
  80876b:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  808772:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808776:	48 83 e8 20          	sub    rax,0x20
  80877a:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

		if(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  80877e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808782:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  808786:	3c 0f                	cmp    al,0xf
  808788:	0f 85 2a 02 00 00    	jne    8089b8 <FAT32_readdir+0x46e>
  80878e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808792:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808795:	3c e5                	cmp    al,0xe5
  808797:	0f 84 1b 02 00 00    	je     8089b8 <FAT32_readdir+0x46e>
  80879d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8087a1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8087a4:	84 c0                	test   al,al
  8087a6:	0f 84 0c 02 00 00    	je     8089b8 <FAT32_readdir+0x46e>
  8087ac:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8087b0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8087b3:	3c 05                	cmp    al,0x5
  8087b5:	0f 84 fd 01 00 00    	je     8089b8 <FAT32_readdir+0x46e>
		{
			j = 0;
  8087bb:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
			//long file/dir name read
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  8087c2:	eb 1a                	jmp    8087de <FAT32_readdir+0x294>
			{
				j++;
  8087c4:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
				if(tmpldentry->LDIR_Ord & 0x40)
  8087c8:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8087cc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8087cf:	0f b6 c0             	movzx  eax,al
  8087d2:	83 e0 40             	and    eax,0x40
  8087d5:	85 c0                	test   eax,eax
  8087d7:	75 34                	jne    80880d <FAT32_readdir+0x2c3>
					break;
				tmpldentry --;
  8087d9:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  8087de:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8087e2:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  8087e6:	3c 0f                	cmp    al,0xf
  8087e8:	75 24                	jne    80880e <FAT32_readdir+0x2c4>
  8087ea:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8087ee:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8087f1:	3c e5                	cmp    al,0xe5
  8087f3:	74 19                	je     80880e <FAT32_readdir+0x2c4>
  8087f5:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8087f9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8087fc:	84 c0                	test   al,al
  8087fe:	74 0e                	je     80880e <FAT32_readdir+0x2c4>
  808800:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808804:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808807:	3c 05                	cmp    al,0x5
  808809:	75 b9                	jne    8087c4 <FAT32_readdir+0x27a>
  80880b:	eb 01                	jmp    80880e <FAT32_readdir+0x2c4>
					break;
  80880d:	90                   	nop
			}

			name = vmalloc(j*13+1,0);
  80880e:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  808811:	89 d0                	mov    eax,edx
  808813:	01 c0                	add    eax,eax
  808815:	01 d0                	add    eax,edx
  808817:	c1 e0 02             	shl    eax,0x2
  80881a:	01 d0                	add    eax,edx
  80881c:	83 c0 01             	add    eax,0x1
  80881f:	be 00 00 00 00       	mov    esi,0x0
  808824:	89 c7                	mov    edi,eax
  808826:	b8 00 00 00 00       	mov    eax,0x0
  80882b:	e8 c5 88 ff ff       	call   8010f5 <vmalloc>
  808830:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
			memset(name,0,j*13+1);
  808834:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  808837:	89 d0                	mov    eax,edx
  808839:	01 c0                	add    eax,eax
  80883b:	01 d0                	add    eax,edx
  80883d:	c1 e0 02             	shl    eax,0x2
  808840:	01 d0                	add    eax,edx
  808842:	83 c0 01             	add    eax,0x1
  808845:	89 c2                	mov    edx,eax
  808847:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80884b:	be 00 00 00 00       	mov    esi,0x0
  808850:	48 89 c7             	mov    rdi,rax
  808853:	e8 78 20 00 00       	call   80a8d0 <memset>
			tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  808858:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80885c:	48 83 e8 20          	sub    rax,0x20
  808860:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

			for(x = 0;x<j;x++,tmpldentry --)
  808864:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  80886b:	e9 37 01 00 00       	jmp    8089a7 <FAT32_readdir+0x45d>
			{
				for(y = 0;y<5;y++)
  808870:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  808877:	eb 53                	jmp    8088cc <FAT32_readdir+0x382>
					if(tmpldentry->LDIR_Name1[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  808879:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80887d:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  808880:	48 63 d2             	movsxd rdx,edx
  808883:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  808888:	66 83 f8 ff          	cmp    ax,0xffff
  80888c:	74 3a                	je     8088c8 <FAT32_readdir+0x37e>
  80888e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808892:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  808895:	48 63 d2             	movsxd rdx,edx
  808898:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80889d:	66 85 c0             	test   ax,ax
  8088a0:	74 26                	je     8088c8 <FAT32_readdir+0x37e>
						name[namelen++] = (char)tmpldentry->LDIR_Name1[y];
  8088a2:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8088a6:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8088a9:	48 63 d2             	movsxd rdx,edx
  8088ac:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  8088b1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8088b4:	8d 50 01             	lea    edx,[rax+0x1]
  8088b7:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  8088ba:	48 63 d0             	movsxd rdx,eax
  8088bd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8088c1:	48 01 d0             	add    rax,rdx
  8088c4:	89 ca                	mov    edx,ecx
  8088c6:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<5;y++)
  8088c8:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  8088cc:	83 7d dc 04          	cmp    DWORD PTR [rbp-0x24],0x4
  8088d0:	7e a7                	jle    808879 <FAT32_readdir+0x32f>

				for(y = 0;y<6;y++)
  8088d2:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  8088d9:	eb 53                	jmp    80892e <FAT32_readdir+0x3e4>
					if(tmpldentry->LDIR_Name2[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  8088db:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8088df:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8088e2:	48 63 d2             	movsxd rdx,edx
  8088e5:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  8088ea:	66 83 f8 ff          	cmp    ax,0xffff
  8088ee:	74 3a                	je     80892a <FAT32_readdir+0x3e0>
  8088f0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8088f4:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8088f7:	48 63 d2             	movsxd rdx,edx
  8088fa:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  8088ff:	66 85 c0             	test   ax,ax
  808902:	74 26                	je     80892a <FAT32_readdir+0x3e0>
						name[namelen++] = (char)tmpldentry->LDIR_Name2[y];
  808904:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808908:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80890b:	48 63 d2             	movsxd rdx,edx
  80890e:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  808913:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808916:	8d 50 01             	lea    edx,[rax+0x1]
  808919:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80891c:	48 63 d0             	movsxd rdx,eax
  80891f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808923:	48 01 d0             	add    rax,rdx
  808926:	89 ca                	mov    edx,ecx
  808928:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<6;y++)
  80892a:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  80892e:	83 7d dc 05          	cmp    DWORD PTR [rbp-0x24],0x5
  808932:	7e a7                	jle    8088db <FAT32_readdir+0x391>

				for(y = 0;y<2;y++)
  808934:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  80893b:	eb 5b                	jmp    808998 <FAT32_readdir+0x44e>
					if(tmpldentry->LDIR_Name3[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  80893d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808941:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  808944:	48 63 d2             	movsxd rdx,edx
  808947:	48 83 c2 08          	add    rdx,0x8
  80894b:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  808950:	66 83 f8 ff          	cmp    ax,0xffff
  808954:	74 3e                	je     808994 <FAT32_readdir+0x44a>
  808956:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80895a:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80895d:	48 63 d2             	movsxd rdx,edx
  808960:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  808965:	66 85 c0             	test   ax,ax
  808968:	74 2a                	je     808994 <FAT32_readdir+0x44a>
						name[namelen++] = (char)tmpldentry->LDIR_Name3[y];
  80896a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80896e:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  808971:	48 63 d2             	movsxd rdx,edx
  808974:	48 83 c2 08          	add    rdx,0x8
  808978:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  80897d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808980:	8d 50 01             	lea    edx,[rax+0x1]
  808983:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  808986:	48 63 d0             	movsxd rdx,eax
  808989:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80898d:	48 01 d0             	add    rax,rdx
  808990:	89 ca                	mov    edx,ecx
  808992:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<2;y++)
  808994:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  808998:	83 7d dc 01          	cmp    DWORD PTR [rbp-0x24],0x1
  80899c:	7e 9f                	jle    80893d <FAT32_readdir+0x3f3>
			for(x = 0;x<j;x++,tmpldentry --)
  80899e:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  8089a2:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
  8089a7:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8089aa:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  8089ad:	0f 8c bd fe ff ff    	jl     808870 <FAT32_readdir+0x326>
			}
			goto find_lookup_success;
  8089b3:	e9 f5 01 00 00       	jmp    808bad <FAT32_readdir+0x663>
		}

		name = vmalloc(15,0);
  8089b8:	be 00 00 00 00       	mov    esi,0x0
  8089bd:	bf 0f 00 00 00       	mov    edi,0xf
  8089c2:	b8 00 00 00 00       	mov    eax,0x0
  8089c7:	e8 29 87 ff ff       	call   8010f5 <vmalloc>
  8089cc:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
		memset(name,0,15);
  8089d0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8089d4:	ba 0f 00 00 00       	mov    edx,0xf
  8089d9:	be 00 00 00 00       	mov    esi,0x0
  8089de:	48 89 c7             	mov    rdi,rax
  8089e1:	e8 ea 1e 00 00       	call   80a8d0 <memset>
		//short file/dir base name compare
		for(x=0;x<8;x++)
  8089e6:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  8089ed:	eb 74                	jmp    808a63 <FAT32_readdir+0x519>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  8089ef:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8089f3:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8089f6:	48 98                	cdqe   
  8089f8:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  8089fc:	3c 20                	cmp    al,0x20
  8089fe:	74 6b                	je     808a6b <FAT32_readdir+0x521>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  808a00:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808a04:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  808a08:	0f b6 c0             	movzx  eax,al
  808a0b:	83 e0 08             	and    eax,0x8
  808a0e:	85 c0                	test   eax,eax
  808a10:	74 29                	je     808a3b <FAT32_readdir+0x4f1>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  808a12:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  808a16:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808a19:	48 98                	cdqe   
  808a1b:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808a1f:	8d 48 20             	lea    ecx,[rax+0x20]
  808a22:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808a25:	8d 50 01             	lea    edx,[rax+0x1]
  808a28:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  808a2b:	48 63 d0             	movsxd rdx,eax
  808a2e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808a32:	48 01 d0             	add    rax,rdx
  808a35:	89 ca                	mov    edx,ecx
  808a37:	88 10                	mov    BYTE PTR [rax],dl
  808a39:	eb 24                	jmp    808a5f <FAT32_readdir+0x515>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  808a3b:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  808a3f:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808a42:	48 98                	cdqe   
  808a44:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  808a48:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808a4b:	8d 50 01             	lea    edx,[rax+0x1]
  808a4e:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  808a51:	48 63 d0             	movsxd rdx,eax
  808a54:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808a58:	48 01 d0             	add    rax,rdx
  808a5b:	89 ca                	mov    edx,ecx
  808a5d:	88 10                	mov    BYTE PTR [rax],dl
		for(x=0;x<8;x++)
  808a5f:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  808a63:	83 7d e0 07          	cmp    DWORD PTR [rbp-0x20],0x7
  808a67:	7e 86                	jle    8089ef <FAT32_readdir+0x4a5>
  808a69:	eb 01                	jmp    808a6c <FAT32_readdir+0x522>
				break;
  808a6b:	90                   	nop
		}

		if(tmpdentry->DIR_Attr & ATTR_DIRECTORY)
  808a6c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808a70:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  808a74:	0f b6 c0             	movzx  eax,al
  808a77:	83 e0 10             	and    eax,0x10
  808a7a:	85 c0                	test   eax,eax
  808a7c:	0f 85 27 01 00 00    	jne    808ba9 <FAT32_readdir+0x65f>
			goto find_lookup_success;

		name[namelen++] = '.';
  808a82:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808a85:	8d 50 01             	lea    edx,[rax+0x1]
  808a88:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  808a8b:	48 63 d0             	movsxd rdx,eax
  808a8e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808a92:	48 01 d0             	add    rax,rdx
  808a95:	c6 00 2e             	mov    BYTE PTR [rax],0x2e

		//short file ext name compare
		for(x=8;x<11;x++)
  808a98:	c7 45 e0 08 00 00 00 	mov    DWORD PTR [rbp-0x20],0x8
  808a9f:	eb 74                	jmp    808b15 <FAT32_readdir+0x5cb>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  808aa1:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  808aa5:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808aa8:	48 98                	cdqe   
  808aaa:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808aae:	3c 20                	cmp    al,0x20
  808ab0:	74 6b                	je     808b1d <FAT32_readdir+0x5d3>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  808ab2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808ab6:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  808aba:	0f b6 c0             	movzx  eax,al
  808abd:	83 e0 10             	and    eax,0x10
  808ac0:	85 c0                	test   eax,eax
  808ac2:	74 29                	je     808aed <FAT32_readdir+0x5a3>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  808ac4:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  808ac8:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808acb:	48 98                	cdqe   
  808acd:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808ad1:	8d 48 20             	lea    ecx,[rax+0x20]
  808ad4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808ad7:	8d 50 01             	lea    edx,[rax+0x1]
  808ada:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  808add:	48 63 d0             	movsxd rdx,eax
  808ae0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808ae4:	48 01 d0             	add    rax,rdx
  808ae7:	89 ca                	mov    edx,ecx
  808ae9:	88 10                	mov    BYTE PTR [rax],dl
  808aeb:	eb 24                	jmp    808b11 <FAT32_readdir+0x5c7>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  808aed:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  808af1:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808af4:	48 98                	cdqe   
  808af6:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  808afa:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808afd:	8d 50 01             	lea    edx,[rax+0x1]
  808b00:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  808b03:	48 63 d0             	movsxd rdx,eax
  808b06:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808b0a:	48 01 d0             	add    rax,rdx
  808b0d:	89 ca                	mov    edx,ecx
  808b0f:	88 10                	mov    BYTE PTR [rax],dl
		for(x=8;x<11;x++)
  808b11:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  808b15:	83 7d e0 0a          	cmp    DWORD PTR [rbp-0x20],0xa
  808b19:	7e 86                	jle    808aa1 <FAT32_readdir+0x557>
  808b1b:	eb 01                	jmp    808b1e <FAT32_readdir+0x5d4>
				break;
  808b1d:	90                   	nop
		}
		if(x == 8)
  808b1e:	83 7d e0 08          	cmp    DWORD PTR [rbp-0x20],0x8
  808b22:	0f 85 84 00 00 00    	jne    808bac <FAT32_readdir+0x662>
			name[--namelen] = 0;
  808b28:	83 6d ec 01          	sub    DWORD PTR [rbp-0x14],0x1
  808b2c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808b2f:	48 63 d0             	movsxd rdx,eax
  808b32:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808b36:	48 01 d0             	add    rax,rdx
  808b39:	c6 00 00             	mov    BYTE PTR [rax],0x0
		goto find_lookup_success;
  808b3c:	eb 6e                	jmp    808bac <FAT32_readdir+0x662>
			continue;
  808b3e:	90                   	nop
  808b3f:	eb 01                	jmp    808b42 <FAT32_readdir+0x5f8>
			continue;
  808b41:	90                   	nop
	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  808b42:	83 45 e8 20          	add    DWORD PTR [rbp-0x18],0x20
  808b46:	48 83 45 d0 20       	add    QWORD PTR [rbp-0x30],0x20
  808b4b:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808b4f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808b52:	48 8d 50 20          	lea    rdx,[rax+0x20]
  808b56:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808b5a:	48 89 10             	mov    QWORD PTR [rax],rdx
  808b5d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808b60:	48 63 d0             	movsxd rdx,eax
  808b63:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808b67:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808b6b:	48 39 c2             	cmp    rdx,rax
  808b6e:	0f 8c ba fb ff ff    	jl     80872e <FAT32_readdir+0x1e4>
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  808b74:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  808b77:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808b7b:	89 d6                	mov    esi,edx
  808b7d:	48 89 c7             	mov    rdi,rax
  808b80:	e8 b0 ee ff ff       	call   807a35 <DISK1_FAT32_read_FAT_Entry>
  808b85:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  808b88:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  808b8f:	77 05                	ja     808b96 <FAT32_readdir+0x64c>
		goto next_cluster;
  808b91:	e9 d5 fa ff ff       	jmp    80866b <FAT32_readdir+0x121>

	vmfree(buf);
  808b96:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808b9a:	48 89 c7             	mov    rdi,rax
  808b9d:	e8 e2 85 ff ff       	call   801184 <vmfree>
	return NULL;
  808ba2:	b8 00 00 00 00       	mov    eax,0x0
  808ba7:	eb 3b                	jmp    808be4 <FAT32_readdir+0x69a>
			goto find_lookup_success;
  808ba9:	90                   	nop
  808baa:	eb 01                	jmp    808bad <FAT32_readdir+0x663>
		goto find_lookup_success;
  808bac:	90                   	nop

find_lookup_success:

	filp->position += 32;
  808bad:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808bb1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808bb4:	48 8d 50 20          	lea    rdx,[rax+0x20]
  808bb8:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808bbc:	48 89 10             	mov    QWORD PTR [rax],rdx
	return filler(dirent,name,namelen,0,0);
  808bbf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808bc2:	48 63 d0             	movsxd rdx,eax
  808bc5:	48 8b 75 f0          	mov    rsi,QWORD PTR [rbp-0x10]
  808bc9:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  808bcd:	4c 8b 4d 88          	mov    r9,QWORD PTR [rbp-0x78]
  808bd1:	41 b8 00 00 00 00    	mov    r8d,0x0
  808bd7:	b9 00 00 00 00       	mov    ecx,0x0
  808bdc:	48 89 c7             	mov    rdi,rax
  808bdf:	41 ff d1             	call   r9
  808be2:	48 98                	cdqe   
}
  808be4:	c9                   	leave  
  808be5:	c3                   	ret    

0000000000808be6 <FAT32_create>:
	.readdir = FAT32_readdir,
};


long FAT32_create(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  808be6:	f3 0f 1e fa          	endbr64 
  808bea:	55                   	push   rbp
  808beb:	48 89 e5             	mov    rbp,rsp
  808bee:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  808bf2:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  808bf6:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  808bf9:	90                   	nop
  808bfa:	5d                   	pop    rbp
  808bfb:	c3                   	ret    

0000000000808bfc <FAT32_lookup>:


struct dir_entry * FAT32_lookup(struct index_node * parent_inode,struct dir_entry * dest_dentry)
{
  808bfc:	f3 0f 1e fa          	endbr64 
  808c00:	55                   	push   rbp
  808c01:	48 89 e5             	mov    rbp,rsp
  808c04:	48 83 ec 60          	sub    rsp,0x60
  808c08:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  808c0c:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
	struct FAT32_inode_info * finode = parent_inode->private_index_info;
  808c10:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808c14:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808c18:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	struct FAT32_sb_info * fsbi = parent_inode->sb->private_sb_info;
  808c1c:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808c20:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808c24:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808c28:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	unsigned int cluster = 0;
  808c2c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  808c33:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  808c3a:	00 
	unsigned char * buf =NULL; 
  808c3b:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  808c42:	00 
	int i = 0,j = 0,x = 0;
  808c43:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  808c4a:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  808c51:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  808c58:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  808c5f:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  808c60:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  808c67:	00 
	struct index_node * p = NULL;
  808c68:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  808c6f:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  808c70:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808c74:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808c78:	be 00 00 00 00       	mov    esi,0x0
  808c7d:	48 89 c7             	mov    rdi,rax
  808c80:	b8 00 00 00 00       	mov    eax,0x0
  808c85:	e8 6b 84 ff ff       	call   8010f5 <vmalloc>
  808c8a:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax

	cluster = finode->first_cluster;
  808c8e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808c92:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808c95:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

next_cluster:
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  808c98:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808c9c:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  808ca0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808ca3:	83 e8 02             	sub    eax,0x2
  808ca6:	89 c1                	mov    ecx,eax
  808ca8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808cac:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808cb0:	48 0f af c1          	imul   rax,rcx
  808cb4:	48 01 d0             	add    rax,rdx
  808cb7:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
	printf("lookup cluster:%#010x,sector:%x\n",cluster,sector);
  808cbb:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  808cbf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808cc2:	89 c6                	mov    esi,eax
  808cc4:	bf 98 33 81 00       	mov    edi,0x813398
  808cc9:	b8 00 00 00 00       	mov    eax,0x0
  808cce:	e8 0a 80 ff ff       	call   800cdd <printf>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  808cd3:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808cd7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808cdb:	89 c1                	mov    ecx,eax
  808cdd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808ce1:	89 c2                	mov    edx,eax
  808ce3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808ce7:	49 89 c0             	mov    r8,rax
  808cea:	be 00 00 00 00       	mov    esi,0x0
  808cef:	bf 00 00 00 00       	mov    edi,0x0
  808cf4:	e8 a8 e0 ff ff       	call   806da1 <request>
  808cf9:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    if(!chk_result(r))
  808cfc:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808cff:	89 c7                	mov    edi,eax
  808d01:	e8 4f e7 ff ff       	call   807455 <chk_result>
  808d06:	85 c0                	test   eax,eax
  808d08:	75 25                	jne    808d2f <FAT32_lookup+0x133>
	{
		printf("FAT32 FS(lookup) read disk ERROR!!!!!!!!!!\n");
  808d0a:	bf c0 33 81 00       	mov    edi,0x8133c0
  808d0f:	b8 00 00 00 00       	mov    eax,0x0
  808d14:	e8 c4 7f ff ff       	call   800cdd <printf>
		vmfree(buf);
  808d19:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808d1d:	48 89 c7             	mov    rdi,rax
  808d20:	e8 5f 84 ff ff       	call   801184 <vmfree>
		return NULL;
  808d25:	b8 00 00 00 00       	mov    eax,0x0
  808d2a:	e9 f0 07 00 00       	jmp    80951f <FAT32_lookup+0x923>
	}

	tmpdentry = (struct FAT32_Directory *)buf;
  808d2f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808d33:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax

	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  808d37:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  808d3e:	e9 9d 05 00 00       	jmp    8092e0 <FAT32_lookup+0x6e4>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  808d43:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808d47:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  808d4b:	3c 0f                	cmp    al,0xf
  808d4d:	0f 84 59 05 00 00    	je     8092ac <FAT32_lookup+0x6b0>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  808d53:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808d57:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d5a:	3c e5                	cmp    al,0xe5
  808d5c:	0f 84 4d 05 00 00    	je     8092af <FAT32_lookup+0x6b3>
  808d62:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808d66:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d69:	84 c0                	test   al,al
  808d6b:	0f 84 3e 05 00 00    	je     8092af <FAT32_lookup+0x6b3>
  808d71:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808d75:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d78:	3c 05                	cmp    al,0x5
  808d7a:	0f 84 2f 05 00 00    	je     8092af <FAT32_lookup+0x6b3>
			continue;

		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  808d80:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808d84:	48 83 e8 20          	sub    rax,0x20
  808d88:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
		j = 0;
  808d8c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0

		//long file/dir name compare
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  808d93:	e9 88 01 00 00       	jmp    808f20 <FAT32_lookup+0x324>
		{
			for(x=0;x<5;x++)
  808d98:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  808d9f:	eb 6a                	jmp    808e0b <FAT32_lookup+0x20f>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name1[x] == 0xffff)
  808da1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808da5:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808da8:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808dab:	7e 15                	jle    808dc2 <FAT32_lookup+0x1c6>
  808dad:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808db1:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  808db4:	48 63 d2             	movsxd rdx,edx
  808db7:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  808dbc:	66 83 f8 ff          	cmp    ax,0xffff
  808dc0:	74 44                	je     808e06 <FAT32_lookup+0x20a>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name1[x] != (unsigned short)(dest_dentry->name[j++]))
  808dc2:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808dc6:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808dc9:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808dcc:	0f 8f e0 04 00 00    	jg     8092b2 <FAT32_lookup+0x6b6>
  808dd2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808dd6:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  808dd9:	48 63 d2             	movsxd rdx,edx
  808ddc:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  808de1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808de5:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  808de8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808deb:	8d 50 01             	lea    edx,[rax+0x1]
  808dee:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  808df1:	48 98                	cdqe   
  808df3:	48 01 f0             	add    rax,rsi
  808df6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808df9:	66 98                	cbw    
  808dfb:	66 39 c1             	cmp    cx,ax
  808dfe:	0f 85 ae 04 00 00    	jne    8092b2 <FAT32_lookup+0x6b6>
  808e04:	eb 01                	jmp    808e07 <FAT32_lookup+0x20b>
					continue;
  808e06:	90                   	nop
			for(x=0;x<5;x++)
  808e07:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  808e0b:	83 7d f0 04          	cmp    DWORD PTR [rbp-0x10],0x4
  808e0f:	7e 90                	jle    808da1 <FAT32_lookup+0x1a5>
					goto continue_cmp_fail;
			}
			for(x=0;x<6;x++)
  808e11:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  808e18:	eb 6a                	jmp    808e84 <FAT32_lookup+0x288>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name2[x] == 0xffff)
  808e1a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808e1e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808e21:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808e24:	7e 15                	jle    808e3b <FAT32_lookup+0x23f>
  808e26:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808e2a:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  808e2d:	48 63 d2             	movsxd rdx,edx
  808e30:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  808e35:	66 83 f8 ff          	cmp    ax,0xffff
  808e39:	74 44                	je     808e7f <FAT32_lookup+0x283>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name2[x] != (unsigned short)(dest_dentry->name[j++]))
  808e3b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808e3f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808e42:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808e45:	0f 8f 6a 04 00 00    	jg     8092b5 <FAT32_lookup+0x6b9>
  808e4b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808e4f:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  808e52:	48 63 d2             	movsxd rdx,edx
  808e55:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  808e5a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808e5e:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  808e61:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808e64:	8d 50 01             	lea    edx,[rax+0x1]
  808e67:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  808e6a:	48 98                	cdqe   
  808e6c:	48 01 f0             	add    rax,rsi
  808e6f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808e72:	66 98                	cbw    
  808e74:	66 39 c1             	cmp    cx,ax
  808e77:	0f 85 38 04 00 00    	jne    8092b5 <FAT32_lookup+0x6b9>
  808e7d:	eb 01                	jmp    808e80 <FAT32_lookup+0x284>
					continue;
  808e7f:	90                   	nop
			for(x=0;x<6;x++)
  808e80:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  808e84:	83 7d f0 05          	cmp    DWORD PTR [rbp-0x10],0x5
  808e88:	7e 90                	jle    808e1a <FAT32_lookup+0x21e>
					goto continue_cmp_fail;
			}
			for(x=0;x<2;x++)
  808e8a:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  808e91:	eb 72                	jmp    808f05 <FAT32_lookup+0x309>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name3[x] == 0xffff)
  808e93:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808e97:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808e9a:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808e9d:	7e 19                	jle    808eb8 <FAT32_lookup+0x2bc>
  808e9f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808ea3:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  808ea6:	48 63 d2             	movsxd rdx,edx
  808ea9:	48 83 c2 08          	add    rdx,0x8
  808ead:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  808eb2:	66 83 f8 ff          	cmp    ax,0xffff
  808eb6:	74 48                	je     808f00 <FAT32_lookup+0x304>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name3[x] != (unsigned short)(dest_dentry->name[j++]))
  808eb8:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808ebc:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808ebf:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808ec2:	0f 8f f0 03 00 00    	jg     8092b8 <FAT32_lookup+0x6bc>
  808ec8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808ecc:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  808ecf:	48 63 d2             	movsxd rdx,edx
  808ed2:	48 83 c2 08          	add    rdx,0x8
  808ed6:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  808edb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808edf:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  808ee2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808ee5:	8d 50 01             	lea    edx,[rax+0x1]
  808ee8:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  808eeb:	48 98                	cdqe   
  808eed:	48 01 f0             	add    rax,rsi
  808ef0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808ef3:	66 98                	cbw    
  808ef5:	66 39 c1             	cmp    cx,ax
  808ef8:	0f 85 ba 03 00 00    	jne    8092b8 <FAT32_lookup+0x6bc>
  808efe:	eb 01                	jmp    808f01 <FAT32_lookup+0x305>
					continue;
  808f00:	90                   	nop
			for(x=0;x<2;x++)
  808f01:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  808f05:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  808f09:	7e 88                	jle    808e93 <FAT32_lookup+0x297>
					goto continue_cmp_fail;
			}

			if(j >= dest_dentry->name_length)
  808f0b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808f0f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808f12:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808f15:	0f 8d 14 04 00 00    	jge    80932f <FAT32_lookup+0x733>
			{
				goto find_lookup_success;
			}

			tmpldentry --;
  808f1b:	48 83 6d e0 20       	sub    QWORD PTR [rbp-0x20],0x20
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  808f20:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808f24:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  808f28:	3c 0f                	cmp    al,0xf
  808f2a:	75 0f                	jne    808f3b <FAT32_lookup+0x33f>
  808f2c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808f30:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808f33:	3c e5                	cmp    al,0xe5
  808f35:	0f 85 5d fe ff ff    	jne    808d98 <FAT32_lookup+0x19c>
		}

		//short file/dir base name compare
		j = 0;
  808f3b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
		for(x=0;x<8;x++)
  808f42:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  808f49:	e9 f4 01 00 00       	jmp    809142 <FAT32_lookup+0x546>
		{
			switch(tmpdentry->DIR_Name[x])
  808f4e:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808f52:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808f55:	48 98                	cdqe   
  808f57:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808f5b:	0f b6 c0             	movzx  eax,al
  808f5e:	83 f8 7a             	cmp    eax,0x7a
  808f61:	0f 8f d0 01 00 00    	jg     809137 <FAT32_lookup+0x53b>
  808f67:	83 f8 61             	cmp    eax,0x61
  808f6a:	0f 8d e6 00 00 00    	jge    809056 <FAT32_lookup+0x45a>
  808f70:	83 f8 5a             	cmp    eax,0x5a
  808f73:	0f 8f be 01 00 00    	jg     809137 <FAT32_lookup+0x53b>
  808f79:	83 f8 41             	cmp    eax,0x41
  808f7c:	0f 8d d4 00 00 00    	jge    809056 <FAT32_lookup+0x45a>
  808f82:	83 f8 20             	cmp    eax,0x20
  808f85:	74 1a                	je     808fa1 <FAT32_lookup+0x3a5>
  808f87:	83 f8 20             	cmp    eax,0x20
  808f8a:	0f 8c a7 01 00 00    	jl     809137 <FAT32_lookup+0x53b>
  808f90:	83 e8 30             	sub    eax,0x30
  808f93:	83 f8 09             	cmp    eax,0x9
  808f96:	0f 87 9b 01 00 00    	ja     809137 <FAT32_lookup+0x53b>
  808f9c:	e9 53 01 00 00       	jmp    8090f4 <FAT32_lookup+0x4f8>
			{
				case ' ':
					if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  808fa1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808fa5:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  808fa9:	0f b6 c0             	movzx  eax,al
  808fac:	83 e0 10             	and    eax,0x10
  808faf:	85 c0                	test   eax,eax
  808fb1:	75 50                	jne    809003 <FAT32_lookup+0x407>
					{
						if(dest_dentry->name[j]=='.')
  808fb3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808fb7:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  808fba:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808fbd:	48 98                	cdqe   
  808fbf:	48 01 d0             	add    rax,rdx
  808fc2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808fc5:	3c 2e                	cmp    al,0x2e
  808fc7:	0f 84 70 01 00 00    	je     80913d <FAT32_lookup+0x541>
							continue;
						else if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  808fcd:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808fd1:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808fd4:	48 98                	cdqe   
  808fd6:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808fda:	0f b6 d0             	movzx  edx,al
  808fdd:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808fe1:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808fe4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808fe7:	48 98                	cdqe   
  808fe9:	48 01 c8             	add    rax,rcx
  808fec:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808fef:	0f be c0             	movsx  eax,al
  808ff2:	39 c2                	cmp    edx,eax
  808ff4:	0f 85 c1 02 00 00    	jne    8092bb <FAT32_lookup+0x6bf>
						{
							j++;
  808ffa:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  808ffe:	e9 3b 01 00 00       	jmp    80913e <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  809003:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809007:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80900a:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80900d:	7d 32                	jge    809041 <FAT32_lookup+0x445>
  80900f:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809013:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809016:	48 98                	cdqe   
  809018:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80901c:	0f b6 d0             	movzx  edx,al
  80901f:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809023:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  809026:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809029:	48 98                	cdqe   
  80902b:	48 01 c8             	add    rax,rcx
  80902e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809031:	0f be c0             	movsx  eax,al
  809034:	39 c2                	cmp    edx,eax
  809036:	75 09                	jne    809041 <FAT32_lookup+0x445>
						{
							j++;
  809038:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80903c:	e9 fd 00 00 00       	jmp    80913e <FAT32_lookup+0x542>
						}
						else if(j == dest_dentry->name_length)
  809041:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809045:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809048:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80904b:	0f 85 6d 02 00 00    	jne    8092be <FAT32_lookup+0x6c2>
							continue;
  809051:	e9 e8 00 00 00       	jmp    80913e <FAT32_lookup+0x542>
							goto continue_cmp_fail;
					}

				case 'A' ... 'Z':
				case 'a' ... 'z':
					if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  809056:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80905a:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80905e:	0f b6 c0             	movzx  eax,al
  809061:	83 e0 08             	and    eax,0x8
  809064:	85 c0                	test   eax,eax
  809066:	74 49                	je     8090b1 <FAT32_lookup+0x4b5>
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  809068:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80906c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80906f:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  809072:	0f 8d 49 02 00 00    	jge    8092c1 <FAT32_lookup+0x6c5>
  809078:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80907c:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80907f:	48 98                	cdqe   
  809081:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809085:	0f b6 c0             	movzx  eax,al
  809088:	8d 50 20             	lea    edx,[rax+0x20]
  80908b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80908f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  809092:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809095:	48 98                	cdqe   
  809097:	48 01 c8             	add    rax,rcx
  80909a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80909d:	0f be c0             	movsx  eax,al
  8090a0:	39 c2                	cmp    edx,eax
  8090a2:	0f 85 19 02 00 00    	jne    8092c1 <FAT32_lookup+0x6c5>
						{
							j++;
  8090a8:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  8090ac:	e9 8d 00 00 00       	jmp    80913e <FAT32_lookup+0x542>
						}
						else
							goto continue_cmp_fail;
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  8090b1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8090b5:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8090b8:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  8090bb:	0f 8d 03 02 00 00    	jge    8092c4 <FAT32_lookup+0x6c8>
  8090c1:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8090c5:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8090c8:	48 98                	cdqe   
  8090ca:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  8090ce:	0f b6 d0             	movzx  edx,al
  8090d1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8090d5:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8090d8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8090db:	48 98                	cdqe   
  8090dd:	48 01 c8             	add    rax,rcx
  8090e0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8090e3:	0f be c0             	movsx  eax,al
  8090e6:	39 c2                	cmp    edx,eax
  8090e8:	0f 85 d6 01 00 00    	jne    8092c4 <FAT32_lookup+0x6c8>
						{
							j++;
  8090ee:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  8090f2:	eb 4a                	jmp    80913e <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}

				case '0' ... '9':
					if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  8090f4:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8090f8:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8090fb:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  8090fe:	0f 8d c3 01 00 00    	jge    8092c7 <FAT32_lookup+0x6cb>
  809104:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809108:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80910b:	48 98                	cdqe   
  80910d:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809111:	0f b6 d0             	movzx  edx,al
  809114:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809118:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80911b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80911e:	48 98                	cdqe   
  809120:	48 01 c8             	add    rax,rcx
  809123:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809126:	0f be c0             	movsx  eax,al
  809129:	39 c2                	cmp    edx,eax
  80912b:	0f 85 96 01 00 00    	jne    8092c7 <FAT32_lookup+0x6cb>
					{
						j++;
  809131:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
						break;
  809135:	eb 07                	jmp    80913e <FAT32_lookup+0x542>
					}
					else
						goto continue_cmp_fail;

				default :
					j++;
  809137:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
					break;
  80913b:	eb 01                	jmp    80913e <FAT32_lookup+0x542>
							continue;
  80913d:	90                   	nop
		for(x=0;x<8;x++)
  80913e:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  809142:	83 7d f0 07          	cmp    DWORD PTR [rbp-0x10],0x7
  809146:	0f 8e 02 fe ff ff    	jle    808f4e <FAT32_lookup+0x352>
			}
		}
		//short file ext name compare
		if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  80914c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809150:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809154:	0f b6 c0             	movzx  eax,al
  809157:	83 e0 10             	and    eax,0x10
  80915a:	85 c0                	test   eax,eax
  80915c:	0f 85 d0 01 00 00    	jne    809332 <FAT32_lookup+0x736>
		{
			j++;
  809162:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
			for(x=8;x<11;x++)
  809166:	c7 45 f0 08 00 00 00 	mov    DWORD PTR [rbp-0x10],0x8
  80916d:	e9 2b 01 00 00       	jmp    80929d <FAT32_lookup+0x6a1>
			{
				switch(tmpdentry->DIR_Name[x])
  809172:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809176:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809179:	48 98                	cdqe   
  80917b:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80917f:	0f b6 c0             	movzx  eax,al
  809182:	83 f8 7a             	cmp    eax,0x7a
  809185:	0f 8f 3f 01 00 00    	jg     8092ca <FAT32_lookup+0x6ce>
  80918b:	83 f8 61             	cmp    eax,0x61
  80918e:	7d 2e                	jge    8091be <FAT32_lookup+0x5c2>
  809190:	83 f8 5a             	cmp    eax,0x5a
  809193:	0f 8f 31 01 00 00    	jg     8092ca <FAT32_lookup+0x6ce>
  809199:	83 f8 41             	cmp    eax,0x41
  80919c:	7d 20                	jge    8091be <FAT32_lookup+0x5c2>
  80919e:	83 f8 20             	cmp    eax,0x20
  8091a1:	0f 84 c4 00 00 00    	je     80926b <FAT32_lookup+0x66f>
  8091a7:	83 f8 20             	cmp    eax,0x20
  8091aa:	0f 8c 1a 01 00 00    	jl     8092ca <FAT32_lookup+0x6ce>
  8091b0:	83 e8 30             	sub    eax,0x30
  8091b3:	83 f8 09             	cmp    eax,0x9
  8091b6:	0f 87 0e 01 00 00    	ja     8092ca <FAT32_lookup+0x6ce>
  8091bc:	eb 7e                	jmp    80923c <FAT32_lookup+0x640>
				{
					case 'A' ... 'Z':
					case 'a' ... 'z':
						if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  8091be:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8091c2:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  8091c6:	0f b6 c0             	movzx  eax,al
  8091c9:	83 e0 10             	and    eax,0x10
  8091cc:	85 c0                	test   eax,eax
  8091ce:	74 39                	je     809209 <FAT32_lookup+0x60d>
							if(tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  8091d0:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8091d4:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8091d7:	48 98                	cdqe   
  8091d9:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  8091dd:	0f b6 c0             	movzx  eax,al
  8091e0:	8d 50 20             	lea    edx,[rax+0x20]
  8091e3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8091e7:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8091ea:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8091ed:	48 98                	cdqe   
  8091ef:	48 01 c8             	add    rax,rcx
  8091f2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8091f5:	0f be c0             	movsx  eax,al
  8091f8:	39 c2                	cmp    edx,eax
  8091fa:	0f 85 cd 00 00 00    	jne    8092cd <FAT32_lookup+0x6d1>
							{
								j++;
  809200:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  809204:	e9 90 00 00 00       	jmp    809299 <FAT32_lookup+0x69d>
							}
							else
								goto continue_cmp_fail;
						else
						{
							if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  809209:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80920d:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809210:	48 98                	cdqe   
  809212:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809216:	0f b6 d0             	movzx  edx,al
  809219:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80921d:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  809220:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809223:	48 98                	cdqe   
  809225:	48 01 c8             	add    rax,rcx
  809228:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80922b:	0f be c0             	movsx  eax,al
  80922e:	39 c2                	cmp    edx,eax
  809230:	0f 85 9a 00 00 00    	jne    8092d0 <FAT32_lookup+0x6d4>
							{
								j++;
  809236:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  80923a:	eb 5d                	jmp    809299 <FAT32_lookup+0x69d>
							else
								goto continue_cmp_fail;
						}

					case '0' ... '9':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80923c:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  809240:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809243:	48 98                	cdqe   
  809245:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809249:	0f b6 d0             	movzx  edx,al
  80924c:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809250:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  809253:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809256:	48 98                	cdqe   
  809258:	48 01 c8             	add    rax,rcx
  80925b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80925e:	0f be c0             	movsx  eax,al
  809261:	39 c2                	cmp    edx,eax
  809263:	75 6e                	jne    8092d3 <FAT32_lookup+0x6d7>
						{
							j++;
  809265:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  809269:	eb 2e                	jmp    809299 <FAT32_lookup+0x69d>
						}
						else
							goto continue_cmp_fail;

					case ' ':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80926b:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80926f:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809272:	48 98                	cdqe   
  809274:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809278:	0f b6 d0             	movzx  edx,al
  80927b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80927f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  809282:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809285:	48 98                	cdqe   
  809287:	48 01 c8             	add    rax,rcx
  80928a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80928d:	0f be c0             	movsx  eax,al
  809290:	39 c2                	cmp    edx,eax
  809292:	75 42                	jne    8092d6 <FAT32_lookup+0x6da>
						{
							j++;
  809294:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  809298:	90                   	nop
			for(x=8;x<11;x++)
  809299:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80929d:	83 7d f0 0a          	cmp    DWORD PTR [rbp-0x10],0xa
  8092a1:	0f 8e cb fe ff ff    	jle    809172 <FAT32_lookup+0x576>
					default :
						goto continue_cmp_fail;
				}
			}
		}
		goto find_lookup_success;
  8092a7:	e9 86 00 00 00       	jmp    809332 <FAT32_lookup+0x736>
			continue;
  8092ac:	90                   	nop
  8092ad:	eb 28                	jmp    8092d7 <FAT32_lookup+0x6db>
			continue;
  8092af:	90                   	nop
  8092b0:	eb 25                	jmp    8092d7 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  8092b2:	90                   	nop
  8092b3:	eb 22                	jmp    8092d7 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  8092b5:	90                   	nop
  8092b6:	eb 1f                	jmp    8092d7 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  8092b8:	90                   	nop
  8092b9:	eb 1c                	jmp    8092d7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  8092bb:	90                   	nop
  8092bc:	eb 19                	jmp    8092d7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  8092be:	90                   	nop
  8092bf:	eb 16                	jmp    8092d7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  8092c1:	90                   	nop
  8092c2:	eb 13                	jmp    8092d7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  8092c4:	90                   	nop
  8092c5:	eb 10                	jmp    8092d7 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  8092c7:	90                   	nop
  8092c8:	eb 0d                	jmp    8092d7 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  8092ca:	90                   	nop
  8092cb:	eb 0a                	jmp    8092d7 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  8092cd:	90                   	nop
  8092ce:	eb 07                	jmp    8092d7 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  8092d0:	90                   	nop
  8092d1:	eb 04                	jmp    8092d7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  8092d3:	90                   	nop
  8092d4:	eb 01                	jmp    8092d7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  8092d6:	90                   	nop
	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  8092d7:	83 45 f8 20          	add    DWORD PTR [rbp-0x8],0x20
  8092db:	48 83 45 e8 20       	add    QWORD PTR [rbp-0x18],0x20
  8092e0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8092e3:	48 63 d0             	movsxd rdx,eax
  8092e6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8092ea:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8092ee:	48 39 c2             	cmp    rdx,rax
  8092f1:	0f 8c 4c fa ff ff    	jl     808d43 <FAT32_lookup+0x147>

continue_cmp_fail:;
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  8092f7:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8092fa:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8092fe:	89 d6                	mov    esi,edx
  809300:	48 89 c7             	mov    rdi,rax
  809303:	e8 2d e7 ff ff       	call   807a35 <DISK1_FAT32_read_FAT_Entry>
  809308:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  80930b:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  809312:	77 05                	ja     809319 <FAT32_lookup+0x71d>
		goto next_cluster;
  809314:	e9 7f f9 ff ff       	jmp    808c98 <FAT32_lookup+0x9c>

	vmfree(buf);
  809319:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80931d:	48 89 c7             	mov    rdi,rax
  809320:	e8 5f 7e ff ff       	call   801184 <vmfree>
	return NULL;
  809325:	b8 00 00 00 00       	mov    eax,0x0
  80932a:	e9 f0 01 00 00       	jmp    80951f <FAT32_lookup+0x923>
				goto find_lookup_success;
  80932f:	90                   	nop
  809330:	eb 01                	jmp    809333 <FAT32_lookup+0x737>
		goto find_lookup_success;
  809332:	90                   	nop

find_lookup_success:
	p = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  809333:	be 00 00 00 00       	mov    esi,0x0
  809338:	bf 38 00 00 00       	mov    edi,0x38
  80933d:	b8 00 00 00 00       	mov    eax,0x0
  809342:	e8 ae 7d ff ff       	call   8010f5 <vmalloc>
  809347:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
	memset(p,0,sizeof(struct index_node));
  80934b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80934f:	ba 38 00 00 00       	mov    edx,0x38
  809354:	be 00 00 00 00       	mov    esi,0x0
  809359:	48 89 c7             	mov    rdi,rax
  80935c:	e8 6f 15 00 00       	call   80a8d0 <memset>
	p->file_size = tmpdentry->DIR_FileSize;
  809361:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809365:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  809368:	89 c2                	mov    edx,eax
  80936a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80936e:	48 89 10             	mov    QWORD PTR [rax],rdx
	p->blocks = (p->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  809371:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809375:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809378:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80937c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809380:	48 01 d0             	add    rax,rdx
  809383:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  809387:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80938b:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80938f:	48 89 c1             	mov    rcx,rax
  809392:	48 89 d0             	mov    rax,rdx
  809395:	ba 00 00 00 00       	mov    edx,0x0
  80939a:	48 f7 f1             	div    rcx
  80939d:	48 89 c2             	mov    rdx,rax
  8093a0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8093a4:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	p->attribute = (tmpdentry->DIR_Attr & ATTR_DIRECTORY) ? FS_ATTR_DIR : FS_ATTR_FILE;
  8093a8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8093ac:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  8093b0:	0f b6 c0             	movzx  eax,al
  8093b3:	83 e0 10             	and    eax,0x10
  8093b6:	85 c0                	test   eax,eax
  8093b8:	74 07                	je     8093c1 <FAT32_lookup+0x7c5>
  8093ba:	ba 02 00 00 00       	mov    edx,0x2
  8093bf:	eb 05                	jmp    8093c6 <FAT32_lookup+0x7ca>
  8093c1:	ba 01 00 00 00       	mov    edx,0x1
  8093c6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8093ca:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	p->sb = parent_inode->sb;
  8093ce:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8093d2:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  8093d6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8093da:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	p->f_ops = &FAT32_file_ops;
  8093de:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8093e2:	48 c7 40 20 00 b4 80 	mov    QWORD PTR [rax+0x20],0x80b400
  8093e9:	00 
	p->inode_ops = &FAT32_inode_ops;
  8093ea:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8093ee:	48 c7 40 28 40 b4 80 	mov    QWORD PTR [rax+0x28],0x80b440
  8093f5:	00 

	p->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  8093f6:	be 00 00 00 00       	mov    esi,0x0
  8093fb:	bf 20 00 00 00       	mov    edi,0x20
  809400:	b8 00 00 00 00       	mov    eax,0x0
  809405:	e8 eb 7c ff ff       	call   8010f5 <vmalloc>
  80940a:	48 89 c2             	mov    rdx,rax
  80940d:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809411:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(p->private_index_info,0,sizeof(struct FAT32_inode_info));
  809415:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809419:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80941d:	ba 20 00 00 00       	mov    edx,0x20
  809422:	be 00 00 00 00       	mov    esi,0x0
  809427:	48 89 c7             	mov    rdi,rax
  80942a:	e8 a1 14 00 00       	call   80a8d0 <memset>
	finode = p->private_index_info;
  80942f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809433:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809437:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax

	finode->first_cluster = (tmpdentry->DIR_FstClusHI<< 16 | tmpdentry->DIR_FstClusLO) & 0x0fffffff;
  80943b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80943f:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  809443:	0f b7 c0             	movzx  eax,ax
  809446:	c1 e0 10             	shl    eax,0x10
  809449:	89 c2                	mov    edx,eax
  80944b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80944f:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  809453:	0f b7 c0             	movzx  eax,ax
  809456:	09 d0                	or     eax,edx
  809458:	48 98                	cdqe   
  80945a:	25 ff ff ff 0f       	and    eax,0xfffffff
  80945f:	48 89 c2             	mov    rdx,rax
  809462:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809466:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = cluster;
  809469:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80946c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809470:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	finode->dentry_position = tmpdentry - (struct FAT32_Directory *)buf;
  809474:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809478:	48 2b 45 c0          	sub    rax,QWORD PTR [rbp-0x40]
  80947c:	48 c1 f8 05          	sar    rax,0x5
  809480:	48 89 c2             	mov    rdx,rax
  809483:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809487:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	finode->create_date = tmpdentry->DIR_CrtTime;
  80948b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80948f:	0f b7 50 0e          	movzx  edx,WORD PTR [rax+0xe]
  809493:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809497:	66 89 50 18          	mov    WORD PTR [rax+0x18],dx
	finode->create_time = tmpdentry->DIR_CrtDate;
  80949b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80949f:	0f b7 50 10          	movzx  edx,WORD PTR [rax+0x10]
  8094a3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8094a7:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	finode->write_date = tmpdentry->DIR_WrtTime;
  8094ab:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8094af:	0f b7 50 16          	movzx  edx,WORD PTR [rax+0x16]
  8094b3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8094b7:	66 89 50 1c          	mov    WORD PTR [rax+0x1c],dx
	finode->write_time = tmpdentry->DIR_WrtDate;
  8094bb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8094bf:	0f b7 50 18          	movzx  edx,WORD PTR [rax+0x18]
  8094c3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8094c7:	66 89 50 1e          	mov    WORD PTR [rax+0x1e],dx

	if((tmpdentry->DIR_FstClusHI >> 12) && (p->attribute & FS_ATTR_FILE))
  8094cb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8094cf:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  8094d3:	66 c1 e8 0c          	shr    ax,0xc
  8094d7:	66 85 c0             	test   ax,ax
  8094da:	74 27                	je     809503 <FAT32_lookup+0x907>
  8094dc:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8094e0:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8094e4:	83 e0 01             	and    eax,0x1
  8094e7:	48 85 c0             	test   rax,rax
  8094ea:	74 17                	je     809503 <FAT32_lookup+0x907>
	{
		p->attribute |= FS_ATTR_DEVICE;
  8094ec:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8094f0:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8094f4:	48 83 c8 04          	or     rax,0x4
  8094f8:	48 89 c2             	mov    rdx,rax
  8094fb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8094ff:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	}

	dest_dentry->dir_inode = p;
  809503:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809507:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80950b:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	vmfree(buf);
  80950f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809513:	48 89 c7             	mov    rdi,rax
  809516:	e8 69 7c ff ff       	call   801184 <vmfree>
	return dest_dentry;	
  80951b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
}
  80951f:	c9                   	leave  
  809520:	c3                   	ret    

0000000000809521 <FAT32_mkdir>:


long FAT32_mkdir(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  809521:	f3 0f 1e fa          	endbr64 
  809525:	55                   	push   rbp
  809526:	48 89 e5             	mov    rbp,rsp
  809529:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80952d:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  809531:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809534:	90                   	nop
  809535:	5d                   	pop    rbp
  809536:	c3                   	ret    

0000000000809537 <FAT32_rmdir>:


long FAT32_rmdir(struct index_node * inode,struct dir_entry * dentry)
{}
  809537:	f3 0f 1e fa          	endbr64 
  80953b:	55                   	push   rbp
  80953c:	48 89 e5             	mov    rbp,rsp
  80953f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809543:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  809547:	90                   	nop
  809548:	5d                   	pop    rbp
  809549:	c3                   	ret    

000000000080954a <FAT32_rename>:

long FAT32_rename(struct index_node * old_inode,struct dir_entry * old_dentry,struct index_node * new_inode,struct dir_entry * new_dentry)
{}
  80954a:	f3 0f 1e fa          	endbr64 
  80954e:	55                   	push   rbp
  80954f:	48 89 e5             	mov    rbp,rsp
  809552:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809556:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80955a:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80955e:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  809562:	90                   	nop
  809563:	5d                   	pop    rbp
  809564:	c3                   	ret    

0000000000809565 <FAT32_getattr>:

long FAT32_getattr(struct dir_entry * dentry,unsigned long * attr)
{}
  809565:	f3 0f 1e fa          	endbr64 
  809569:	55                   	push   rbp
  80956a:	48 89 e5             	mov    rbp,rsp
  80956d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809571:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  809575:	90                   	nop
  809576:	5d                   	pop    rbp
  809577:	c3                   	ret    

0000000000809578 <FAT32_setattr>:

long FAT32_setattr(struct dir_entry * dentry,unsigned long * attr)
{}
  809578:	f3 0f 1e fa          	endbr64 
  80957c:	55                   	push   rbp
  80957d:	48 89 e5             	mov    rbp,rsp
  809580:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809584:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  809588:	90                   	nop
  809589:	5d                   	pop    rbp
  80958a:	c3                   	ret    

000000000080958b <FAT32_compare>:
	.setattr = FAT32_setattr,
};


//// these operation need cache and list
long FAT32_compare(struct dir_entry * parent_dentry,char * source_filename,char * destination_filename){}
  80958b:	f3 0f 1e fa          	endbr64 
  80958f:	55                   	push   rbp
  809590:	48 89 e5             	mov    rbp,rsp
  809593:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809597:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80959b:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80959f:	90                   	nop
  8095a0:	5d                   	pop    rbp
  8095a1:	c3                   	ret    

00000000008095a2 <FAT32_hash>:
long FAT32_hash(struct dir_entry * dentry,char * filename){}
  8095a2:	f3 0f 1e fa          	endbr64 
  8095a6:	55                   	push   rbp
  8095a7:	48 89 e5             	mov    rbp,rsp
  8095aa:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8095ae:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8095b2:	90                   	nop
  8095b3:	5d                   	pop    rbp
  8095b4:	c3                   	ret    

00000000008095b5 <FAT32_release>:
long FAT32_release(struct dir_entry * dentry){}
  8095b5:	f3 0f 1e fa          	endbr64 
  8095b9:	55                   	push   rbp
  8095ba:	48 89 e5             	mov    rbp,rsp
  8095bd:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8095c1:	90                   	nop
  8095c2:	5d                   	pop    rbp
  8095c3:	c3                   	ret    

00000000008095c4 <FAT32_iput>:
long FAT32_iput(struct dir_entry * dentry,struct index_node * inode){}
  8095c4:	f3 0f 1e fa          	endbr64 
  8095c8:	55                   	push   rbp
  8095c9:	48 89 e5             	mov    rbp,rsp
  8095cc:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8095d0:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8095d4:	90                   	nop
  8095d5:	5d                   	pop    rbp
  8095d6:	c3                   	ret    

00000000008095d7 <fat32_write_superblock>:
	.release = FAT32_release,
	.iput = FAT32_iput,
};


void fat32_write_superblock(struct super_block * sb){}
  8095d7:	f3 0f 1e fa          	endbr64 
  8095db:	55                   	push   rbp
  8095dc:	48 89 e5             	mov    rbp,rsp
  8095df:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8095e3:	90                   	nop
  8095e4:	5d                   	pop    rbp
  8095e5:	c3                   	ret    

00000000008095e6 <fat32_put_superblock>:

void fat32_put_superblock(struct super_block * sb)
{
  8095e6:	f3 0f 1e fa          	endbr64 
  8095ea:	55                   	push   rbp
  8095eb:	48 89 e5             	mov    rbp,rsp
  8095ee:	48 83 ec 10          	sub    rsp,0x10
  8095f2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
	vmfree(sb->private_sb_info);
  8095f6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8095fa:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8095fe:	48 89 c7             	mov    rdi,rax
  809601:	e8 7e 7b ff ff       	call   801184 <vmfree>
	vmfree(sb->root->dir_inode->private_index_info);
  809606:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80960a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80960d:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809611:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809615:	48 89 c7             	mov    rdi,rax
  809618:	e8 67 7b ff ff       	call   801184 <vmfree>
	vmfree(sb->root->dir_inode);
  80961d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809621:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809624:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809628:	48 89 c7             	mov    rdi,rax
  80962b:	e8 54 7b ff ff       	call   801184 <vmfree>
	vmfree(sb->root);
  809630:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809634:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809637:	48 89 c7             	mov    rdi,rax
  80963a:	e8 45 7b ff ff       	call   801184 <vmfree>
	vmfree(sb);
  80963f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809643:	48 89 c7             	mov    rdi,rax
  809646:	e8 39 7b ff ff       	call   801184 <vmfree>
}
  80964b:	90                   	nop
  80964c:	c9                   	leave  
  80964d:	c3                   	ret    

000000000080964e <fat32_write_inode>:

void fat32_write_inode(struct index_node * inode)
{
  80964e:	f3 0f 1e fa          	endbr64 
  809652:	55                   	push   rbp
  809653:	48 89 e5             	mov    rbp,rsp
  809656:	48 83 ec 40          	sub    rsp,0x40
  80965a:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
	struct FAT32_Directory * fdentry = NULL;
  80965e:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  809665:	00 
	struct FAT32_Directory * buf = NULL;
  809666:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80966d:	00 
	struct FAT32_inode_info * finode = inode->private_index_info;
  80966e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809672:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809676:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	struct FAT32_sb_info * fsbi = inode->sb->private_sb_info;
  80967a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80967e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809682:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809686:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	unsigned long sector = 0;
  80968a:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  809691:	00 

	if(finode->dentry_location == 0)
  809692:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809696:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80969a:	48 85 c0             	test   rax,rax
  80969d:	75 14                	jne    8096b3 <fat32_write_inode+0x65>
	{
		printf("FS ERROR:write root inode!\n");	
  80969f:	bf ec 33 81 00       	mov    edi,0x8133ec
  8096a4:	b8 00 00 00 00       	mov    eax,0x0
  8096a9:	e8 2f 76 ff ff       	call   800cdd <printf>
		return ;
  8096ae:	e9 30 01 00 00       	jmp    8097e3 <fat32_write_inode+0x195>
	}

	sector = fsbi->Data_firstsector + (finode->dentry_location - 2) * fsbi->sector_per_cluster;
  8096b3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8096b7:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  8096bb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8096bf:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8096c3:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  8096c7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8096cb:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8096cf:	48 0f af c2          	imul   rax,rdx
  8096d3:	48 01 c8             	add    rax,rcx
  8096d6:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	buf = (struct FAT32_Directory *)vmalloc(fsbi->bytes_per_cluster,0);
  8096da:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8096de:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8096e2:	be 00 00 00 00       	mov    esi,0x0
  8096e7:	48 89 c7             	mov    rdi,rax
  8096ea:	b8 00 00 00 00       	mov    eax,0x0
  8096ef:	e8 01 7a ff ff       	call   8010f5 <vmalloc>
  8096f4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	memset(buf,0,fsbi->bytes_per_cluster);
  8096f8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8096fc:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809700:	89 c2                	mov    edx,eax
  809702:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809706:	be 00 00 00 00       	mov    esi,0x0
  80970b:	48 89 c7             	mov    rdi,rax
  80970e:	e8 bd 11 00 00       	call   80a8d0 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  809713:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809717:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80971b:	89 c1                	mov    ecx,eax
  80971d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809721:	89 c2                	mov    edx,eax
  809723:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809727:	49 89 c0             	mov    r8,rax
  80972a:	be 00 00 00 00       	mov    esi,0x0
  80972f:	bf 00 00 00 00       	mov    edi,0x0
  809734:	e8 68 d6 ff ff       	call   806da1 <request>
  809739:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    chk_result(r);
  80973c:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80973f:	89 c7                	mov    edi,eax
  809741:	e8 0f dd ff ff       	call   807455 <chk_result>
    fdentry = buf+finode->dentry_position;
  809746:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80974a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80974e:	48 c1 e0 05          	shl    rax,0x5
  809752:	48 89 c2             	mov    rdx,rax
  809755:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809759:	48 01 d0             	add    rax,rdx
  80975c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

	////alert fat32 dentry data
	fdentry->DIR_FileSize = inode->file_size;
  809760:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809764:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809767:	89 c2                	mov    edx,eax
  809769:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80976d:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
	fdentry->DIR_FstClusLO = finode->first_cluster & 0xffff;
  809770:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809774:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809777:	89 c2                	mov    edx,eax
  809779:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80977d:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	fdentry->DIR_FstClusHI = (fdentry->DIR_FstClusHI & 0xf000) | (finode->first_cluster >> 16);
  809781:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809785:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  809789:	66 25 00 f0          	and    ax,0xf000
  80978d:	89 c2                	mov    edx,eax
  80978f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809793:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809796:	48 c1 e8 10          	shr    rax,0x10
  80979a:	09 c2                	or     edx,eax
  80979c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8097a0:	66 89 50 14          	mov    WORD PTR [rax+0x14],dx

	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  8097a4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8097a8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8097ac:	89 c1                	mov    ecx,eax
  8097ae:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8097b2:	89 c2                	mov    edx,eax
  8097b4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8097b8:	49 89 c0             	mov    r8,rax
  8097bb:	be 01 00 00 00       	mov    esi,0x1
  8097c0:	bf 00 00 00 00       	mov    edi,0x0
  8097c5:	e8 d7 d5 ff ff       	call   806da1 <request>
  8097ca:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    chk_result(r1);
  8097cd:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
  8097d0:	89 c7                	mov    edi,eax
  8097d2:	e8 7e dc ff ff       	call   807455 <chk_result>
	vmfree(buf);
  8097d7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8097db:	48 89 c7             	mov    rdi,rax
  8097de:	e8 a1 79 ff ff       	call   801184 <vmfree>
}
  8097e3:	c9                   	leave  
  8097e4:	c3                   	ret    

00000000008097e5 <fat32_read_superblock>:

	.write_inode = fat32_write_inode,
};

struct super_block * fat32_read_superblock(struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  8097e5:	f3 0f 1e fa          	endbr64 
  8097e9:	55                   	push   rbp
  8097ea:	48 89 e5             	mov    rbp,rsp
  8097ed:	48 83 ec 50          	sub    rsp,0x50
  8097f1:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  8097f5:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
	struct super_block * sbp = NULL;
  8097f9:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  809800:	00 
	struct FAT32_inode_info * finode = NULL;
  809801:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  809808:	00 
	struct FAT32_BootSector * fbs = NULL;
  809809:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  809810:	00 
	struct FAT32_sb_info * fsbi = NULL;
  809811:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  809818:	00 

	////super block
	sbp = (struct super_block *)vmalloc(sizeof(struct super_block),0);
  809819:	be 00 00 00 00       	mov    esi,0x0
  80981e:	bf 18 00 00 00       	mov    edi,0x18
  809823:	b8 00 00 00 00       	mov    eax,0x0
  809828:	e8 c8 78 ff ff       	call   8010f5 <vmalloc>
  80982d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	memset(sbp,0,sizeof(struct super_block));
  809831:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809835:	ba 18 00 00 00       	mov    edx,0x18
  80983a:	be 00 00 00 00       	mov    esi,0x0
  80983f:	48 89 c7             	mov    rdi,rax
  809842:	e8 89 10 00 00       	call   80a8d0 <memset>

	sbp->sb_ops = &FAT32_sb_ops;
  809847:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80984b:	48 c7 40 08 a0 b4 80 	mov    QWORD PTR [rax+0x8],0x80b4a0
  809852:	00 
	sbp->private_sb_info = (struct FAT32_sb_info *)vmalloc(sizeof(struct FAT32_sb_info),0);
  809853:	be 00 00 00 00       	mov    esi,0x0
  809858:	bf 60 00 00 00       	mov    edi,0x60
  80985d:	b8 00 00 00 00       	mov    eax,0x0
  809862:	e8 8e 78 ff ff       	call   8010f5 <vmalloc>
  809867:	48 89 c2             	mov    rdx,rax
  80986a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80986e:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	memset(sbp->private_sb_info,0,sizeof(struct FAT32_sb_info));
  809872:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809876:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80987a:	ba 60 00 00 00       	mov    edx,0x60
  80987f:	be 00 00 00 00       	mov    esi,0x0
  809884:	48 89 c7             	mov    rdi,rax
  809887:	e8 44 10 00 00       	call   80a8d0 <memset>

	////fat32 boot sector
	fbs = (struct FAT32_BootSector *)buf;
  80988c:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  809890:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
 	fsbi = sbp->private_sb_info;
  809894:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809898:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80989c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	fsbi->start_sector = DPTE->start_LBA;
  8098a0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8098a4:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8098a7:	89 c2                	mov    edx,eax
  8098a9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8098ad:	48 89 10             	mov    QWORD PTR [rax],rdx
	fsbi->sector_count = DPTE->sectors_limit;
  8098b0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8098b4:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  8098b7:	89 c2                	mov    edx,eax
  8098b9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8098bd:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	fsbi->sector_per_cluster = fbs->BPB_SecPerClus;
  8098c1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8098c5:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  8098c9:	0f b6 d0             	movzx  edx,al
  8098cc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8098d0:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	fsbi->bytes_per_cluster = fbs->BPB_SecPerClus * fbs->BPB_BytesPerSec;
  8098d4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8098d8:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  8098dc:	0f b6 d0             	movzx  edx,al
  8098df:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8098e3:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  8098e7:	0f b7 c0             	movzx  eax,ax
  8098ea:	0f af c2             	imul   eax,edx
  8098ed:	48 63 d0             	movsxd rdx,eax
  8098f0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8098f4:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	fsbi->bytes_per_sector = fbs->BPB_BytesPerSec;
  8098f8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8098fc:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  809900:	0f b7 d0             	movzx  edx,ax
  809903:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809907:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
	fsbi->Data_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt + fbs->BPB_FATSz32 * fbs->BPB_NumFATs;
  80990b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80990f:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  809912:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809916:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  80991a:	0f b7 c0             	movzx  eax,ax
  80991d:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  809920:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809924:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  809927:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80992b:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  80992f:	0f b6 c0             	movzx  eax,al
  809932:	0f af c2             	imul   eax,edx
  809935:	01 c8                	add    eax,ecx
  809937:	89 c2                	mov    edx,eax
  809939:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80993d:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
	fsbi->FAT1_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt;
  809941:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809945:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  809948:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80994c:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  809950:	0f b7 c0             	movzx  eax,ax
  809953:	01 d0                	add    eax,edx
  809955:	89 c2                	mov    edx,eax
  809957:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80995b:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	fsbi->sector_per_FAT = fbs->BPB_FATSz32;
  80995f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809963:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  809966:	89 c2                	mov    edx,eax
  809968:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80996c:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
	fsbi->NumFATs = fbs->BPB_NumFATs;
  809970:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809974:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  809978:	0f b6 d0             	movzx  edx,al
  80997b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80997f:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
	fsbi->fsinfo_sector_infat = fbs->BPB_FSInfo;
  809983:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809987:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80998b:	0f b7 d0             	movzx  edx,ax
  80998e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809992:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
	fsbi->bootsector_bk_infat = fbs->BPB_BkBootSec;	
  809996:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80999a:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  80999e:	0f b7 d0             	movzx  edx,ax
  8099a1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8099a5:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
	
	printf("FAT32 Boot Sector\n\tBPB_FSInfo:%x\n\tBPB_BkBootSec:%x\n\tBPB_TotSec32:%x\n",fbs->BPB_FSInfo,fbs->BPB_BkBootSec,fbs->BPB_TotSec32);
  8099a9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8099ad:	8b 48 20             	mov    ecx,DWORD PTR [rax+0x20]
  8099b0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8099b4:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  8099b8:	0f b7 d0             	movzx  edx,ax
  8099bb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8099bf:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  8099c3:	0f b7 c0             	movzx  eax,ax
  8099c6:	89 c6                	mov    esi,eax
  8099c8:	bf 08 34 81 00       	mov    edi,0x813408
  8099cd:	b8 00 00 00 00       	mov    eax,0x0
  8099d2:	e8 06 73 ff ff       	call   800cdd <printf>
	
	////fat32 fsinfo sector
	fsbi->fat_fsinfo = (struct FAT32_FSInfo *)vmalloc(sizeof(struct FAT32_FSInfo),0);
  8099d7:	be 00 00 00 00       	mov    esi,0x0
  8099dc:	bf 00 02 00 00       	mov    edi,0x200
  8099e1:	b8 00 00 00 00       	mov    eax,0x0
  8099e6:	e8 0a 77 ff ff       	call   8010f5 <vmalloc>
  8099eb:	48 89 c2             	mov    rdx,rax
  8099ee:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8099f2:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
	memset(fsbi->fat_fsinfo,0,512);
  8099f6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8099fa:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  8099fe:	ba 00 02 00 00       	mov    edx,0x200
  809a03:	be 00 00 00 00       	mov    esi,0x0
  809a08:	48 89 c7             	mov    rdi,rax
  809a0b:	e8 c0 0e 00 00       	call   80a8d0 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPTE->start_LBA + fbs->BPB_FSInfo,1,(unsigned char *)fsbi->fat_fsinfo);
  809a10:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809a14:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  809a18:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809a1c:	8b 48 08             	mov    ecx,DWORD PTR [rax+0x8]
  809a1f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809a23:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  809a27:	0f b7 c0             	movzx  eax,ax
  809a2a:	01 c8                	add    eax,ecx
  809a2c:	49 89 d0             	mov    r8,rdx
  809a2f:	b9 01 00 00 00       	mov    ecx,0x1
  809a34:	89 c2                	mov    edx,eax
  809a36:	be 00 00 00 00       	mov    esi,0x0
  809a3b:	bf 00 00 00 00       	mov    edi,0x0
  809a40:	e8 5c d3 ff ff       	call   806da1 <request>
  809a45:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    chk_result(r);
  809a48:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  809a4b:	89 c7                	mov    edi,eax
  809a4d:	e8 03 da ff ff       	call   807455 <chk_result>
	printf("FAT32 FSInfo\n\tFSI_LeadSig:%x\n\tFSI_StrucSig:%x\n\tFSI_Free_Count:%x\n",fsbi->fat_fsinfo->FSI_LeadSig,fsbi->fat_fsinfo->FSI_StrucSig,fsbi->fat_fsinfo->FSI_Free_Count);
  809a52:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809a56:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  809a5a:	8b 88 e8 01 00 00    	mov    ecx,DWORD PTR [rax+0x1e8]
  809a60:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809a64:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  809a68:	8b 90 e4 01 00 00    	mov    edx,DWORD PTR [rax+0x1e4]
  809a6e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809a72:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  809a76:	8b 00                	mov    eax,DWORD PTR [rax]
  809a78:	89 c6                	mov    esi,eax
  809a7a:	bf 50 34 81 00       	mov    edi,0x813450
  809a7f:	b8 00 00 00 00       	mov    eax,0x0
  809a84:	e8 54 72 ff ff       	call   800cdd <printf>
	
	////directory entry
	sbp->root = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  809a89:	be 00 00 00 00       	mov    esi,0x0
  809a8e:	bf 48 00 00 00       	mov    edi,0x48
  809a93:	b8 00 00 00 00       	mov    eax,0x0
  809a98:	e8 58 76 ff ff       	call   8010f5 <vmalloc>
  809a9d:	48 89 c2             	mov    rdx,rax
  809aa0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809aa4:	48 89 10             	mov    QWORD PTR [rax],rdx
	memset(sbp->root,0,sizeof(struct dir_entry));
  809aa7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809aab:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809aae:	ba 48 00 00 00       	mov    edx,0x48
  809ab3:	be 00 00 00 00       	mov    esi,0x0
  809ab8:	48 89 c7             	mov    rdi,rax
  809abb:	e8 10 0e 00 00       	call   80a8d0 <memset>

	list_init(&sbp->root->child_node);
  809ac0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809ac4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809ac7:	48 83 c0 10          	add    rax,0x10
  809acb:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    list->prev = list;
  809acf:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809ad3:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  809ad7:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  809ada:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809ade:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  809ae2:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  809ae6:	90                   	nop
	list_init(&sbp->root->subdirs_list);
  809ae7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809aeb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809aee:	48 83 c0 20          	add    rax,0x20
  809af2:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    list->prev = list;
  809af6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809afa:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809afe:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  809b01:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809b05:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809b09:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  809b0d:	90                   	nop
	sbp->root->parent = sbp->root;
  809b0e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809b12:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809b15:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  809b19:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  809b1c:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
	sbp->root->dir_ops = &FAT32_dentry_ops;
  809b20:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809b24:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809b27:	48 c7 40 40 80 b4 80 	mov    QWORD PTR [rax+0x40],0x80b480
  809b2e:	00 
	sbp->root->name = (char *)vmalloc(2,0);
  809b2f:	be 00 00 00 00       	mov    esi,0x0
  809b34:	bf 02 00 00 00       	mov    edi,0x2
  809b39:	b8 00 00 00 00       	mov    eax,0x0
  809b3e:	e8 b2 75 ff ff       	call   8010f5 <vmalloc>
  809b43:	48 89 c2             	mov    rdx,rax
  809b46:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809b4a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809b4d:	48 89 10             	mov    QWORD PTR [rax],rdx
	sbp->root->name[0] = '/';
  809b50:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809b54:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809b57:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809b5a:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
	sbp->root->name_length = 1;
  809b5d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809b61:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809b64:	c7 40 08 01 00 00 00 	mov    DWORD PTR [rax+0x8],0x1

	////index node
	sbp->root->dir_inode = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  809b6b:	be 00 00 00 00       	mov    esi,0x0
  809b70:	bf 38 00 00 00       	mov    edi,0x38
  809b75:	b8 00 00 00 00       	mov    eax,0x0
  809b7a:	e8 76 75 ff ff       	call   8010f5 <vmalloc>
  809b7f:	48 89 c2             	mov    rdx,rax
  809b82:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809b86:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809b89:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(sbp->root->dir_inode,0,sizeof(struct index_node));
  809b8d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809b91:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809b94:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809b98:	ba 38 00 00 00       	mov    edx,0x38
  809b9d:	be 00 00 00 00       	mov    esi,0x0
  809ba2:	48 89 c7             	mov    rdi,rax
  809ba5:	e8 26 0d 00 00       	call   80a8d0 <memset>
	sbp->root->dir_inode->inode_ops = &FAT32_inode_ops;
  809baa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809bae:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809bb1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809bb5:	48 c7 40 28 40 b4 80 	mov    QWORD PTR [rax+0x28],0x80b440
  809bbc:	00 
	sbp->root->dir_inode->f_ops = &FAT32_file_ops;
  809bbd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809bc1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809bc4:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809bc8:	48 c7 40 20 00 b4 80 	mov    QWORD PTR [rax+0x20],0x80b400
  809bcf:	00 
	sbp->root->dir_inode->file_size = 0;
  809bd0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809bd4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809bd7:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809bdb:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
	sbp->root->dir_inode->blocks = (sbp->root->dir_inode->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  809be2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809be6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809be9:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809bed:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809bf0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809bf4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809bf8:	48 01 d0             	add    rax,rdx
  809bfb:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  809bff:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809c03:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  809c07:	48 89 c6             	mov    rsi,rax
  809c0a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809c0e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809c11:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  809c15:	48 89 d0             	mov    rax,rdx
  809c18:	ba 00 00 00 00       	mov    edx,0x0
  809c1d:	48 f7 f6             	div    rsi
  809c20:	48 89 41 08          	mov    QWORD PTR [rcx+0x8],rax
	sbp->root->dir_inode->attribute = FS_ATTR_DIR;
  809c24:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809c28:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809c2b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809c2f:	48 c7 40 10 02 00 00 	mov    QWORD PTR [rax+0x10],0x2
  809c36:	00 
	sbp->root->dir_inode->sb = sbp;
  809c37:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809c3b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809c3e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809c42:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  809c46:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx

	////fat32 root inode
	sbp->root->dir_inode->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  809c4a:	be 00 00 00 00       	mov    esi,0x0
  809c4f:	bf 20 00 00 00       	mov    edi,0x20
  809c54:	b8 00 00 00 00       	mov    eax,0x0
  809c59:	e8 97 74 ff ff       	call   8010f5 <vmalloc>
  809c5e:	48 89 c2             	mov    rdx,rax
  809c61:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809c65:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809c68:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809c6c:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(sbp->root->dir_inode->private_index_info,0,sizeof(struct FAT32_inode_info));
  809c70:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809c74:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809c77:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809c7b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809c7f:	ba 20 00 00 00       	mov    edx,0x20
  809c84:	be 00 00 00 00       	mov    esi,0x0
  809c89:	48 89 c7             	mov    rdi,rax
  809c8c:	e8 3f 0c 00 00       	call   80a8d0 <memset>
	finode = (struct FAT32_inode_info *)sbp->root->dir_inode->private_index_info;
  809c91:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809c95:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809c98:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809c9c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809ca0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	finode->first_cluster = fbs->BPB_RootClus;
  809ca4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809ca8:	8b 40 2c             	mov    eax,DWORD PTR [rax+0x2c]
  809cab:	89 c2                	mov    edx,eax
  809cad:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809cb1:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = 0;
  809cb4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809cb8:	48 c7 40 08 00 00 00 	mov    QWORD PTR [rax+0x8],0x0
  809cbf:	00 
	finode->dentry_position = 0; 
  809cc0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809cc4:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  809ccb:	00 
	finode->create_date = 0;
  809ccc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809cd0:	66 c7 40 18 00 00    	mov    WORD PTR [rax+0x18],0x0
	finode->create_time = 0;
  809cd6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809cda:	66 c7 40 1a 00 00    	mov    WORD PTR [rax+0x1a],0x0
	finode->write_date = 0;
  809ce0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809ce4:	66 c7 40 1c 00 00    	mov    WORD PTR [rax+0x1c],0x0
	finode->write_time = 0;
  809cea:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809cee:	66 c7 40 1e 00 00    	mov    WORD PTR [rax+0x1e],0x0

	return sbp;
  809cf4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  809cf8:	c9                   	leave  
  809cf9:	c3                   	ret    

0000000000809cfa <DISK1_FAT32_FS_init>:
	.read_superblock = fat32_read_superblock,
	.next = NULL,
};

void DISK1_FAT32_FS_init()
{
  809cfa:	f3 0f 1e fa          	endbr64 
  809cfe:	55                   	push   rbp
  809cff:	48 89 e5             	mov    rbp,rsp
  809d02:	48 81 ec 10 04 00 00 	sub    rsp,0x410
	int i;
	unsigned char buf[512];
	struct dir_entry * dentry = NULL;
  809d09:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  809d10:	00 
	struct Disk_Partition_Table DPT = {0};
  809d11:	48 8d 95 f0 fb ff ff 	lea    rdx,[rbp-0x410]
  809d18:	b8 00 00 00 00       	mov    eax,0x0
  809d1d:	b9 40 00 00 00       	mov    ecx,0x40
  809d22:	48 89 d7             	mov    rdi,rdx
  809d25:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax

	register_filesystem(&FAT32_fs_type);
  809d28:	bf c0 b4 80 00       	mov    edi,0x80b4c0
  809d2d:	e8 c6 c0 ff ff       	call   805df8 <register_filesystem>
	
	memset(buf,0,512);
  809d32:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  809d39:	ba 00 02 00 00       	mov    edx,0x200
  809d3e:	be 00 00 00 00       	mov    esi,0x0
  809d43:	48 89 c7             	mov    rdi,rax
  809d46:	e8 85 0b 00 00       	call   80a8d0 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,0x0,1,(unsigned char *)buf);
  809d4b:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  809d52:	49 89 c0             	mov    r8,rax
  809d55:	b9 01 00 00 00       	mov    ecx,0x1
  809d5a:	ba 00 00 00 00       	mov    edx,0x0
  809d5f:	be 00 00 00 00       	mov    esi,0x0
  809d64:	bf 00 00 00 00       	mov    edi,0x0
  809d69:	e8 33 d0 ff ff       	call   806da1 <request>
  809d6e:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    chk_result(r);
  809d71:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809d74:	89 c7                	mov    edi,eax
  809d76:	e8 da d6 ff ff       	call   807455 <chk_result>
    DPT = *(struct Disk_Partition_Table *)buf;
  809d7b:	48 8d 95 f0 fd ff ff 	lea    rdx,[rbp-0x210]
  809d82:	48 8d 85 f0 fb ff ff 	lea    rax,[rbp-0x410]
  809d89:	48 89 d6             	mov    rsi,rdx
  809d8c:	ba 40 00 00 00       	mov    edx,0x40
  809d91:	48 89 c7             	mov    rdi,rax
  809d94:	48 89 d1             	mov    rcx,rdx
  809d97:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
	printf("DPTE[0] start_LBA:%x\ttype:%x\n",DPT.DPTE[0].start_LBA,DPT.DPTE[0].type);
  809d9a:	0f b6 85 b2 fd ff ff 	movzx  eax,BYTE PTR [rbp-0x24e]
  809da1:	0f b6 d0             	movzx  edx,al
  809da4:	8b 85 b6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x24a]
  809daa:	89 c6                	mov    esi,eax
  809dac:	bf 98 34 81 00       	mov    edi,0x813498
  809db1:	b8 00 00 00 00       	mov    eax,0x0
  809db6:	e8 22 6f ff ff       	call   800cdd <printf>

	memset(buf,0,512);
  809dbb:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  809dc2:	ba 00 02 00 00       	mov    edx,0x200
  809dc7:	be 00 00 00 00       	mov    esi,0x0
  809dcc:	48 89 c7             	mov    rdi,rax
  809dcf:	e8 fc 0a 00 00       	call   80a8d0 <memset>
	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPT.DPTE[0].start_LBA,1,(unsigned char *)buf);
  809dd4:	8b 85 b6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x24a]
  809dda:	89 c2                	mov    edx,eax
  809ddc:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  809de3:	49 89 c0             	mov    r8,rax
  809de6:	b9 01 00 00 00       	mov    ecx,0x1
  809deb:	be 00 00 00 00       	mov    esi,0x0
  809df0:	bf 00 00 00 00       	mov    edi,0x0
  809df5:	e8 a7 cf ff ff       	call   806da1 <request>
  809dfa:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    chk_result(r1);
  809dfd:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809e00:	89 c7                	mov    edi,eax
  809e02:	e8 4e d6 ff ff       	call   807455 <chk_result>

	root_sb = mount_fs("FAT32",&DPT.DPTE[0],buf);	//not dev node
  809e07:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  809e0e:	48 8d 95 f0 fb ff ff 	lea    rdx,[rbp-0x410]
  809e15:	48 8d 8a be 01 00 00 	lea    rcx,[rdx+0x1be]
  809e1c:	48 89 c2             	mov    rdx,rax
  809e1f:	48 89 ce             	mov    rsi,rcx
  809e22:	bf 92 34 81 00       	mov    edi,0x813492
  809e27:	e8 54 bf ff ff       	call   805d80 <mount_fs>
  809e2c:	48 89 05 75 d7 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1d775],rax        # 4275a8 <root_sb>
}
  809e33:	90                   	nop
  809e34:	c9                   	leave  
  809e35:	c3                   	ret    

0000000000809e36 <scrdown>:
//{
//    video_base=addr;
//    m_ptr=addr;
//}
void scrdown(void)
{
  809e36:	f3 0f 1e fa          	endbr64 
  809e3a:	55                   	push   rbp
  809e3b:	48 89 e5             	mov    rbp,rsp
    vpage_base+=SCREEN_W*2;
  809e3e:	48 8b 05 e3 06 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc206e3]        # 42a528 <vpage_base>
  809e45:	48 05 a0 00 00 00    	add    rax,0xa0
  809e4b:	48 89 05 d6 06 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc206d6],rax        # 42a528 <vpage_base>
    page_boffset+=SCREEN_W*2;
  809e52:	8b 05 d8 06 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc206d8]        # 42a530 <page_boffset>
  809e58:	05 a0 00 00 00       	add    eax,0xa0
  809e5d:	89 05 cd 06 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc206cd],eax        # 42a530 <page_boffset>
    if(vpage_base>=video_end)
  809e63:	48 8b 15 be 06 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc206be]        # 42a528 <vpage_base>
  809e6a:	48 8b 05 af 06 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc206af]        # 42a520 <video_end>
  809e71:	48 39 c2             	cmp    rdx,rax
  809e74:	72 0e                	jb     809e84 <scrdown+0x4e>
        vpage_base=video_base;
  809e76:	48 8b 05 9b 06 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2069b]        # 42a518 <video_base>
  809e7d:	48 89 05 a4 06 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc206a4],rax        # 42a528 <vpage_base>
    set_origin();
  809e84:	b8 00 00 00 00       	mov    eax,0x0
  809e89:	e8 6a 00 00 00       	call   809ef8 <set_origin>
}
  809e8e:	90                   	nop
  809e8f:	5d                   	pop    rbp
  809e90:	c3                   	ret    

0000000000809e91 <scrup>:
void scrup()
{
  809e91:	f3 0f 1e fa          	endbr64 
  809e95:	55                   	push   rbp
  809e96:	48 89 e5             	mov    rbp,rsp
    if(page_boffset<=0)
  809e99:	8b 05 91 06 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20691]        # 42a530 <page_boffset>
  809e9f:	85 c0                	test   eax,eax
  809ea1:	75 24                	jne    809ec7 <scrup+0x36>
    {
        page_boffset=0;
  809ea3:	c7 05 83 06 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20683],0x0        # 42a530 <page_boffset>
  809eaa:	00 00 00 
        vpage_base=video_base;
  809ead:	48 8b 05 64 06 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20664]        # 42a518 <video_base>
  809eb4:	48 89 05 6d 06 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2066d],rax        # 42a528 <vpage_base>
        set_origin();
  809ebb:	b8 00 00 00 00       	mov    eax,0x0
  809ec0:	e8 33 00 00 00       	call   809ef8 <set_origin>
        return;
  809ec5:	eb 2f                	jmp    809ef6 <scrup+0x65>
    }
    vpage_base-=SCREEN_W*2;
  809ec7:	48 8b 05 5a 06 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2065a]        # 42a528 <vpage_base>
  809ece:	48 2d a0 00 00 00    	sub    rax,0xa0
  809ed4:	48 89 05 4d 06 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2064d],rax        # 42a528 <vpage_base>
    page_boffset-=SCREEN_W*2;
  809edb:	8b 05 4f 06 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2064f]        # 42a530 <page_boffset>
  809ee1:	2d a0 00 00 00       	sub    eax,0xa0
  809ee6:	89 05 44 06 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20644],eax        # 42a530 <page_boffset>
    set_origin();
  809eec:	b8 00 00 00 00       	mov    eax,0x0
  809ef1:	e8 02 00 00 00       	call   809ef8 <set_origin>
}
  809ef6:	5d                   	pop    rbp
  809ef7:	c3                   	ret    

0000000000809ef8 <set_origin>:
void set_origin(void)
{
  809ef8:	f3 0f 1e fa          	endbr64 
  809efc:	55                   	push   rbp
  809efd:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  809f00:	fa                   	cli    
    outb(port_reg_index,12);
  809f01:	8b 05 39 06 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20639]        # 42a540 <port_reg_index>
  809f07:	0f b7 c0             	movzx  eax,ax
  809f0a:	be 0c 00 00 00       	mov    esi,0xc
  809f0f:	89 c7                	mov    edi,eax
  809f11:	e8 9a a8 ff ff       	call   8047b0 <outb>
    outb(port_reg_v,(page_boffset>>9)&0xff);
  809f16:	8b 05 14 06 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20614]        # 42a530 <page_boffset>
  809f1c:	c1 e8 09             	shr    eax,0x9
  809f1f:	0f b6 d0             	movzx  edx,al
  809f22:	8b 05 1c 06 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2061c]        # 42a544 <port_reg_v>
  809f28:	0f b7 c0             	movzx  eax,ax
  809f2b:	89 d6                	mov    esi,edx
  809f2d:	89 c7                	mov    edi,eax
  809f2f:	e8 7c a8 ff ff       	call   8047b0 <outb>
    outb(port_reg_index,13);
  809f34:	8b 05 06 06 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20606]        # 42a540 <port_reg_index>
  809f3a:	0f b7 c0             	movzx  eax,ax
  809f3d:	be 0d 00 00 00       	mov    esi,0xd
  809f42:	89 c7                	mov    edi,eax
  809f44:	e8 67 a8 ff ff       	call   8047b0 <outb>
    outb(port_reg_v,(page_boffset>>1)&0xff);
  809f49:	8b 05 e1 05 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc205e1]        # 42a530 <page_boffset>
  809f4f:	d1 e8                	shr    eax,1
  809f51:	0f b6 d0             	movzx  edx,al
  809f54:	8b 05 ea 05 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc205ea]        # 42a544 <port_reg_v>
  809f5a:	0f b7 c0             	movzx  eax,ax
  809f5d:	89 d6                	mov    esi,edx
  809f5f:	89 c7                	mov    edi,eax
  809f61:	e8 4a a8 ff ff       	call   8047b0 <outb>
    asm volatile("sti");
  809f66:	fb                   	sti    

}
  809f67:	90                   	nop
  809f68:	5d                   	pop    rbp
  809f69:	c3                   	ret    

0000000000809f6a <init_tty>:
        .type=DEV_TYPE_CHRDEV,
        .flag=DEV_FLAG_USED,
        .drv=&drv_tty
};
void init_tty()
{
  809f6a:	f3 0f 1e fa          	endbr64 
  809f6e:	55                   	push   rbp
  809f6f:	48 89 e5             	mov    rbp,rsp
  809f72:	48 83 ec 10          	sub    rsp,0x10
    strcpy(dev_tty.name,"tty0");
  809f76:	be c8 36 81 00       	mov    esi,0x8136c8
  809f7b:	bf 74 35 81 00       	mov    edi,0x813574
  809f80:	e8 9a 09 00 00       	call   80a91f <strcpy>
    strcpy(dev_stdout.name,"stdout");
  809f85:	be cd 36 81 00       	mov    esi,0x8136cd
  809f8a:	bf 34 36 81 00       	mov    edi,0x813634
  809f8f:	e8 8b 09 00 00       	call   80a91f <strcpy>
    reg_driver(&drv_tty);
  809f94:	bf c0 34 81 00       	mov    edi,0x8134c0
  809f99:	e8 eb 86 ff ff       	call   802689 <reg_driver>
    reg_device(&dev_tty);
  809f9e:	bf 60 35 81 00       	mov    edi,0x813560
  809fa3:	e8 f9 83 ff ff       	call   8023a1 <reg_device>
    reg_device(&dev_stdout);
  809fa8:	bf 20 36 81 00       	mov    edi,0x813620
  809fad:	e8 ef 83 ff ff       	call   8023a1 <reg_device>
    unsigned char *vp=0x20000;
  809fb2:	48 c7 45 f8 00 00 02 	mov    QWORD PTR [rbp-0x8],0x20000
  809fb9:	00 
    if(*vp==0x7)
  809fba:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809fbe:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809fc1:	3c 07                	cmp    al,0x7
  809fc3:	75 36                	jne    809ffb <init_tty+0x91>
    {
        video_mode=VIDEO_MONOTEXT;
  809fc5:	c7 05 65 05 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20565],0x0        # 42a534 <video_mode>
  809fcc:	00 00 00 
        video_base=0xb0000;
  809fcf:	48 c7 05 3e 05 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2053e],0xb0000        # 42a518 <video_base>
  809fd6:	00 00 0b 00 
        video_end=0xb8000-1;
  809fda:	48 c7 05 3b 05 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2053b],0xb7fff        # 42a520 <video_end>
  809fe1:	ff 7f 0b 00 
        port_reg_index=0x3b4;
  809fe5:	c7 05 51 05 c2 ff b4 	mov    DWORD PTR [rip+0xffffffffffc20551],0x3b4        # 42a540 <port_reg_index>
  809fec:	03 00 00 
        port_reg_v=0x3b5;
  809fef:	c7 05 4b 05 c2 ff b5 	mov    DWORD PTR [rip+0xffffffffffc2054b],0x3b5        # 42a544 <port_reg_v>
  809ff6:	03 00 00 
  809ff9:	eb 61                	jmp    80a05c <init_tty+0xf2>
    }else if(*vp<=0x3)
  809ffb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809fff:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a002:	3c 03                	cmp    al,0x3
  80a004:	77 36                	ja     80a03c <init_tty+0xd2>
    {
        video_mode=VIDEO_CHROMATEXT;
  80a006:	c7 05 24 05 c2 ff 01 	mov    DWORD PTR [rip+0xffffffffffc20524],0x1        # 42a534 <video_mode>
  80a00d:	00 00 00 
        video_base=0xb8000;
  80a010:	48 c7 05 fd 04 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc204fd],0xb8000        # 42a518 <video_base>
  80a017:	00 80 0b 00 
        video_end=0xc0000-1;
  80a01b:	48 c7 05 fa 04 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc204fa],0xbffff        # 42a520 <video_end>
  80a022:	ff ff 0b 00 
        port_reg_index=0x3d4;
  80a026:	c7 05 10 05 c2 ff d4 	mov    DWORD PTR [rip+0xffffffffffc20510],0x3d4        # 42a540 <port_reg_index>
  80a02d:	03 00 00 
        port_reg_v=0x3d5;
  80a030:	c7 05 0a 05 c2 ff d5 	mov    DWORD PTR [rip+0xffffffffffc2050a],0x3d5        # 42a544 <port_reg_v>
  80a037:	03 00 00 
  80a03a:	eb 20                	jmp    80a05c <init_tty+0xf2>
    }else{
        video_mode=VIDEO_GRAPHICS;
  80a03c:	c7 05 ee 04 c2 ff 02 	mov    DWORD PTR [rip+0xffffffffffc204ee],0x2        # 42a534 <video_mode>
  80a043:	00 00 00 
        video_base=0xa0000;
  80a046:	48 c7 05 c7 04 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc204c7],0xa0000        # 42a518 <video_base>
  80a04d:	00 00 0a 00 
        video_end=0xb0000-1;
  80a051:	48 c7 05 c4 04 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc204c4],0xaffff        # 42a520 <video_end>
  80a058:	ff ff 0a 00 
    }
    if(*vp<=0x1)line_chs=40;
  80a05c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a060:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a063:	3c 01                	cmp    al,0x1
  80a065:	77 0f                	ja     80a076 <init_tty+0x10c>
  80a067:	c7 05 cb 04 c2 ff 28 	mov    DWORD PTR [rip+0xffffffffffc204cb],0x28        # 42a53c <line_chs>
  80a06e:	00 00 00 
  80a071:	e9 91 00 00 00       	jmp    80a107 <init_tty+0x19d>
    else if(*vp<=0x3||*vp==0x7)line_chs=80;
  80a076:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a07a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a07d:	3c 03                	cmp    al,0x3
  80a07f:	76 0b                	jbe    80a08c <init_tty+0x122>
  80a081:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a085:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a088:	3c 07                	cmp    al,0x7
  80a08a:	75 0c                	jne    80a098 <init_tty+0x12e>
  80a08c:	c7 05 a6 04 c2 ff 50 	mov    DWORD PTR [rip+0xffffffffffc204a6],0x50        # 42a53c <line_chs>
  80a093:	00 00 00 
  80a096:	eb 6f                	jmp    80a107 <init_tty+0x19d>
    else if(*vp<=0x5||*vp==0x9||*vp==0xd)line_chs=320;
  80a098:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a09c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a09f:	3c 05                	cmp    al,0x5
  80a0a1:	76 16                	jbe    80a0b9 <init_tty+0x14f>
  80a0a3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a0a7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a0aa:	3c 09                	cmp    al,0x9
  80a0ac:	74 0b                	je     80a0b9 <init_tty+0x14f>
  80a0ae:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a0b2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a0b5:	3c 0d                	cmp    al,0xd
  80a0b7:	75 0c                	jne    80a0c5 <init_tty+0x15b>
  80a0b9:	c7 05 79 04 c2 ff 40 	mov    DWORD PTR [rip+0xffffffffffc20479],0x140        # 42a53c <line_chs>
  80a0c0:	01 00 00 
  80a0c3:	eb 42                	jmp    80a107 <init_tty+0x19d>
    else if(*vp==0x6||*vp==0xa||*vp>=0xe)line_chs=640;
  80a0c5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a0c9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a0cc:	3c 06                	cmp    al,0x6
  80a0ce:	74 16                	je     80a0e6 <init_tty+0x17c>
  80a0d0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a0d4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a0d7:	3c 0a                	cmp    al,0xa
  80a0d9:	74 0b                	je     80a0e6 <init_tty+0x17c>
  80a0db:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a0df:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a0e2:	3c 0d                	cmp    al,0xd
  80a0e4:	76 0c                	jbe    80a0f2 <init_tty+0x188>
  80a0e6:	c7 05 4c 04 c2 ff 80 	mov    DWORD PTR [rip+0xffffffffffc2044c],0x280        # 42a53c <line_chs>
  80a0ed:	02 00 00 
  80a0f0:	eb 15                	jmp    80a107 <init_tty+0x19d>
    else if(*vp==0x8)line_chs=160;
  80a0f2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a0f6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a0f9:	3c 08                	cmp    al,0x8
  80a0fb:	75 0a                	jne    80a107 <init_tty+0x19d>
  80a0fd:	c7 05 35 04 c2 ff a0 	mov    DWORD PTR [rip+0xffffffffffc20435],0xa0        # 42a53c <line_chs>
  80a104:	00 00 00 
    switch (*vp)
  80a107:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a10b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a10e:	0f b6 c0             	movzx  eax,al
  80a111:	83 f8 14             	cmp    eax,0x14
  80a114:	77 61                	ja     80a177 <init_tty+0x20d>
  80a116:	89 c0                	mov    eax,eax
  80a118:	48 8b 04 c5 d8 36 81 	mov    rax,QWORD PTR [rax*8+0x8136d8]
  80a11f:	00 
  80a120:	3e ff e0             	notrack jmp rax
    {
    case 0x0:case 0x1:vpage_size=40*25;break;
  80a123:	c7 05 1b 04 c2 ff e8 	mov    DWORD PTR [rip+0xffffffffffc2041b],0x3e8        # 42a548 <vpage_size>
  80a12a:	03 00 00 
  80a12d:	eb 49                	jmp    80a178 <init_tty+0x20e>
    case 2:case 3:case 7:vpage_size=80*25;break;
  80a12f:	c7 05 0f 04 c2 ff d0 	mov    DWORD PTR [rip+0xffffffffffc2040f],0x7d0        # 42a548 <vpage_size>
  80a136:	07 00 00 
  80a139:	eb 3d                	jmp    80a178 <init_tty+0x20e>
    case 4:case 5:case 9:case 0xd:vpage_size=320*200;break;
  80a13b:	c7 05 03 04 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20403],0xfa00        # 42a548 <vpage_size>
  80a142:	fa 00 00 
  80a145:	eb 31                	jmp    80a178 <init_tty+0x20e>
    case 6:case 0xa:case 0xe:vpage_size=640*200;break;
  80a147:	c7 05 f7 03 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc203f7],0x1f400        # 42a548 <vpage_size>
  80a14e:	f4 01 00 
  80a151:	eb 25                	jmp    80a178 <init_tty+0x20e>
    case 8:vpage_size=160*200;break;
  80a153:	c7 05 eb 03 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc203eb],0x7d00        # 42a548 <vpage_size>
  80a15a:	7d 00 00 
  80a15d:	eb 19                	jmp    80a178 <init_tty+0x20e>
    case 0xf:case 0x10:case 0x11:vpage_size=640*350;break;
  80a15f:	c7 05 df 03 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc203df],0x36b00        # 42a548 <vpage_size>
  80a166:	6b 03 00 
  80a169:	eb 0d                	jmp    80a178 <init_tty+0x20e>
    case 0x12:case 0x13:case 0x14:vpage_size=640*480;break;
  80a16b:	c7 05 d3 03 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc203d3],0x4b000        # 42a548 <vpage_size>
  80a172:	b0 04 00 
  80a175:	eb 01                	jmp    80a178 <init_tty+0x20e>
    default:
        break;
  80a177:	90                   	nop
    }
    m_ptr=video_base;
  80a178:	48 8b 05 99 03 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20399]        # 42a518 <video_base>
  80a17f:	48 89 05 5a 13 00 00 	mov    QWORD PTR [rip+0x135a],rax        # 80b4e0 <m_ptr>
    page_boffset=0;
  80a186:	c7 05 a0 03 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc203a0],0x0        # 42a530 <page_boffset>
  80a18d:	00 00 00 
    vpage_base=video_base;
  80a190:	48 8b 05 81 03 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20381]        # 42a518 <video_base>
  80a197:	48 89 05 8a 03 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2038a],rax        # 42a528 <vpage_base>
    vp++;
  80a19e:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    vpage=*vp;
  80a1a3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a1a7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a1aa:	0f b6 c0             	movzx  eax,al
  80a1ad:	89 05 85 03 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20385],eax        # 42a538 <vpage>
    vp++;
  80a1b3:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    stline=*vp++;
  80a1b8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a1bc:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80a1c0:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80a1c4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a1c7:	0f b6 c0             	movzx  eax,al
  80a1ca:	89 05 84 03 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20384],eax        # 42a554 <stline>
    endline=*vp++;
  80a1d0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a1d4:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80a1d8:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80a1dc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a1df:	0f b6 c0             	movzx  eax,al
  80a1e2:	89 05 70 03 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20370],eax        # 42a558 <endline>
    videoy=*vp++;
  80a1e8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a1ec:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80a1f0:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80a1f4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a1f7:	0f b6 c0             	movzx  eax,al
  80a1fa:	89 05 50 03 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20350],eax        # 42a550 <videoy>
    videox=*vp;
  80a200:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a204:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a207:	0f b6 c0             	movzx  eax,al
  80a20a:	89 05 3c 03 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2033c],eax        # 42a54c <videox>
    //logf("video:\n mode:0x%x cursor:%d,%d\n",video_mode,\
    videoy,videox);
}
  80a210:	90                   	nop
  80a211:	c9                   	leave  
  80a212:	c3                   	ret    

000000000080a213 <seek_tty>:
char m_color=MONITOR_WHITE;
int seek_tty(driver_args * args)
{
  80a213:	f3 0f 1e fa          	endbr64 
  80a217:	55                   	push   rbp
  80a218:	48 89 e5             	mov    rbp,rsp
  80a21b:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pos=args->pos;
  80a21f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a223:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  80a226:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    m_ptr=0xb8000+pos*2;
  80a229:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a22c:	05 00 c0 05 00       	add    eax,0x5c000
  80a231:	01 c0                	add    eax,eax
  80a233:	48 98                	cdqe   
  80a235:	48 89 05 a4 12 00 00 	mov    QWORD PTR [rip+0x12a4],rax        # 80b4e0 <m_ptr>
}
  80a23c:	90                   	nop
  80a23d:	5d                   	pop    rbp
  80a23e:	c3                   	ret    

000000000080a23f <tell_monitor>:
int tell_monitor()
{
  80a23f:	f3 0f 1e fa          	endbr64 
  80a243:	55                   	push   rbp
  80a244:	48 89 e5             	mov    rbp,rsp
    return (m_ptr-video_base)/2;
  80a247:	48 8b 05 92 12 00 00 	mov    rax,QWORD PTR [rip+0x1292]        # 80b4e0 <m_ptr>
  80a24e:	48 8b 15 c3 02 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc202c3]        # 42a518 <video_base>
  80a255:	48 29 d0             	sub    rax,rdx
  80a258:	48 89 c2             	mov    rdx,rax
  80a25b:	48 c1 ea 3f          	shr    rdx,0x3f
  80a25f:	48 01 d0             	add    rax,rdx
  80a262:	48 d1 f8             	sar    rax,1
}
  80a265:	5d                   	pop    rbp
  80a266:	c3                   	ret    

000000000080a267 <del_ch>:
void del_ch()
{
  80a267:	f3 0f 1e fa          	endbr64 
  80a26b:	55                   	push   rbp
  80a26c:	48 89 e5             	mov    rbp,rsp
  80a26f:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
    char *p=m_ptr-2;
  80a276:	48 8b 05 63 12 00 00 	mov    rax,QWORD PTR [rip+0x1263]        # 80b4e0 <m_ptr>
  80a27d:	48 83 e8 02          	sub    rax,0x2
  80a281:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int pos=tell_monitor()%SCREEN_W;
  80a285:	b8 00 00 00 00       	mov    eax,0x0
  80a28a:	e8 b0 ff ff ff       	call   80a23f <tell_monitor>
  80a28f:	89 c2                	mov    edx,eax
  80a291:	48 63 c2             	movsxd rax,edx
  80a294:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  80a29b:	48 c1 e8 20          	shr    rax,0x20
  80a29f:	c1 f8 05             	sar    eax,0x5
  80a2a2:	89 d1                	mov    ecx,edx
  80a2a4:	c1 f9 1f             	sar    ecx,0x1f
  80a2a7:	29 c8                	sub    eax,ecx
  80a2a9:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  80a2ac:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  80a2af:	89 c8                	mov    eax,ecx
  80a2b1:	c1 e0 02             	shl    eax,0x2
  80a2b4:	01 c8                	add    eax,ecx
  80a2b6:	c1 e0 04             	shl    eax,0x4
  80a2b9:	29 c2                	sub    edx,eax
  80a2bb:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
    for(;pos<SCREEN_W-1;pos++)
  80a2be:	eb 17                	jmp    80a2d7 <del_ch+0x70>
    {
        *p=*(p+2);
  80a2c0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a2c4:	0f b6 50 02          	movzx  edx,BYTE PTR [rax+0x2]
  80a2c8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a2cc:	88 10                	mov    BYTE PTR [rax],dl
        p+=2;
  80a2ce:	48 83 45 f8 02       	add    QWORD PTR [rbp-0x8],0x2
    for(;pos<SCREEN_W-1;pos++)
  80a2d3:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80a2d7:	83 7d f4 4e          	cmp    DWORD PTR [rbp-0xc],0x4e
  80a2db:	7e e3                	jle    80a2c0 <del_ch+0x59>
    }
    driver_args args= {
  80a2dd:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  80a2e4:	b8 00 00 00 00       	mov    eax,0x0
  80a2e9:	b9 18 00 00 00       	mov    ecx,0x18
  80a2ee:	48 89 d7             	mov    rdi,rdx
  80a2f1:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .pos=tell_monitor() - 1
  80a2f4:	b8 00 00 00 00       	mov    eax,0x0
  80a2f9:	e8 41 ff ff ff       	call   80a23f <tell_monitor>
  80a2fe:	83 e8 01             	sub    eax,0x1
    driver_args args= {
  80a301:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    };
    seek_tty(&args);
  80a307:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  80a30e:	48 89 c7             	mov    rdi,rax
  80a311:	e8 fd fe ff ff       	call   80a213 <seek_tty>
    set_cur();
  80a316:	b8 00 00 00 00       	mov    eax,0x0
  80a31b:	e8 03 00 00 00       	call   80a323 <set_cur>
}
  80a320:	90                   	nop
  80a321:	c9                   	leave  
  80a322:	c3                   	ret    

000000000080a323 <set_cur>:
void set_cur()
{
  80a323:	f3 0f 1e fa          	endbr64 
  80a327:	55                   	push   rbp
  80a328:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  80a32b:	fa                   	cli    
    outb(port_reg_index,14);
  80a32c:	8b 05 0e 02 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2020e]        # 42a540 <port_reg_index>
  80a332:	0f b7 c0             	movzx  eax,ax
  80a335:	be 0e 00 00 00       	mov    esi,0xe
  80a33a:	89 c7                	mov    edi,eax
  80a33c:	e8 6f a4 ff ff       	call   8047b0 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>9)&0xff);
  80a341:	48 8b 05 98 11 00 00 	mov    rax,QWORD PTR [rip+0x1198]        # 80b4e0 <m_ptr>
  80a348:	48 8b 15 c9 01 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc201c9]        # 42a518 <video_base>
  80a34f:	48 29 d0             	sub    rax,rdx
  80a352:	48 c1 f8 09          	sar    rax,0x9
  80a356:	0f b6 d0             	movzx  edx,al
  80a359:	8b 05 e5 01 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc201e5]        # 42a544 <port_reg_v>
  80a35f:	0f b7 c0             	movzx  eax,ax
  80a362:	89 d6                	mov    esi,edx
  80a364:	89 c7                	mov    edi,eax
  80a366:	e8 45 a4 ff ff       	call   8047b0 <outb>
    outb(port_reg_index,15);
  80a36b:	8b 05 cf 01 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc201cf]        # 42a540 <port_reg_index>
  80a371:	0f b7 c0             	movzx  eax,ax
  80a374:	be 0f 00 00 00       	mov    esi,0xf
  80a379:	89 c7                	mov    edi,eax
  80a37b:	e8 30 a4 ff ff       	call   8047b0 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>1)&0xff);
  80a380:	48 8b 05 59 11 00 00 	mov    rax,QWORD PTR [rip+0x1159]        # 80b4e0 <m_ptr>
  80a387:	48 8b 15 8a 01 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc2018a]        # 42a518 <video_base>
  80a38e:	48 29 d0             	sub    rax,rdx
  80a391:	48 d1 f8             	sar    rax,1
  80a394:	0f b6 d0             	movzx  edx,al
  80a397:	8b 05 a7 01 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc201a7]        # 42a544 <port_reg_v>
  80a39d:	0f b7 c0             	movzx  eax,ax
  80a3a0:	89 d6                	mov    esi,edx
  80a3a2:	89 c7                	mov    edi,eax
  80a3a4:	e8 07 a4 ff ff       	call   8047b0 <outb>
    asm volatile("sti");
  80a3a9:	fb                   	sti    
}
  80a3aa:	90                   	nop
  80a3ab:	5d                   	pop    rbp
  80a3ac:	c3                   	ret    

000000000080a3ad <read_tty>:

int read_tty(driver_args *args)
{
  80a3ad:	f3 0f 1e fa          	endbr64 
  80a3b1:	55                   	push   rbp
  80a3b2:	48 89 e5             	mov    rbp,rsp
  80a3b5:	48 83 ec 20          	sub    rsp,0x20
  80a3b9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    char* dist=args->dist_addr;
  80a3bd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a3c1:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80a3c4:	48 98                	cdqe   
  80a3c6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  80a3ca:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a3ce:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  80a3d1:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  80a3d4:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80a3db:	eb 4a                	jmp    80a427 <read_tty+0x7a>
    {
        *dist++=*m_ptr;
  80a3dd:	48 8b 15 fc 10 00 00 	mov    rdx,QWORD PTR [rip+0x10fc]        # 80b4e0 <m_ptr>
  80a3e4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a3e8:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80a3ec:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80a3f0:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80a3f3:	88 10                	mov    BYTE PTR [rax],dl
        if(m_ptr==0xbffff&&i>0)
  80a3f5:	48 8b 05 e4 10 00 00 	mov    rax,QWORD PTR [rip+0x10e4]        # 80b4e0 <m_ptr>
  80a3fc:	48 3d ff ff 0b 00    	cmp    rax,0xbffff
  80a402:	75 0d                	jne    80a411 <read_tty+0x64>
  80a404:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80a408:	7e 07                	jle    80a411 <read_tty+0x64>
        {
            return 1;//读到尾了
  80a40a:	b8 01 00 00 00       	mov    eax,0x1
  80a40f:	eb 2d                	jmp    80a43e <read_tty+0x91>
        }
        m_ptr+=2;
  80a411:	48 8b 05 c8 10 00 00 	mov    rax,QWORD PTR [rip+0x10c8]        # 80b4e0 <m_ptr>
  80a418:	48 83 c0 02          	add    rax,0x2
  80a41c:	48 89 05 bd 10 00 00 	mov    QWORD PTR [rip+0x10bd],rax        # 80b4e0 <m_ptr>
    for(int i=0;i<len;i++)
  80a423:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80a427:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a42a:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  80a42d:	7c ae                	jl     80a3dd <read_tty+0x30>
    }
    set_cur();
  80a42f:	b8 00 00 00 00       	mov    eax,0x0
  80a434:	e8 ea fe ff ff       	call   80a323 <set_cur>
    return 0;
  80a439:	b8 00 00 00 00       	mov    eax,0x0
}
  80a43e:	c9                   	leave  
  80a43f:	c3                   	ret    

000000000080a440 <write_tty>:
int write_tty(driver_args *args)
{
  80a440:	f3 0f 1e fa          	endbr64 
  80a444:	55                   	push   rbp
  80a445:	48 89 e5             	mov    rbp,rsp
  80a448:	48 83 ec 30          	sub    rsp,0x30
  80a44c:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char* src=args->src_addr;
  80a450:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a454:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a457:	48 98                	cdqe   
  80a459:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  80a45d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a461:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  80a464:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  80a467:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80a46e:	e9 0b 01 00 00       	jmp    80a57e <write_tty+0x13e>
    {
        if(*src=='\n')
  80a473:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a477:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a47a:	3c 0a                	cmp    al,0xa
  80a47c:	75 50                	jne    80a4ce <write_tty+0x8e>
        {
            unsigned int off=m_ptr-0xb8000;
  80a47e:	48 8b 05 5b 10 00 00 	mov    rax,QWORD PTR [rip+0x105b]        # 80b4e0 <m_ptr>
  80a485:	48 2d 00 80 0b 00    	sub    rax,0xb8000
  80a48b:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            off=(off/160+1)*160;
  80a48e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80a491:	89 c2                	mov    edx,eax
  80a493:	b8 cd cc cc cc       	mov    eax,0xcccccccd
  80a498:	48 0f af c2          	imul   rax,rdx
  80a49c:	48 c1 e8 20          	shr    rax,0x20
  80a4a0:	c1 e8 07             	shr    eax,0x7
  80a4a3:	8d 50 01             	lea    edx,[rax+0x1]
  80a4a6:	89 d0                	mov    eax,edx
  80a4a8:	c1 e0 02             	shl    eax,0x2
  80a4ab:	01 d0                	add    eax,edx
  80a4ad:	c1 e0 05             	shl    eax,0x5
  80a4b0:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            ////logf("%x\n",off);
            m_ptr=0xb8000u+off;
  80a4b3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80a4b6:	05 00 80 0b 00       	add    eax,0xb8000
  80a4bb:	89 c0                	mov    eax,eax
  80a4bd:	48 89 05 1c 10 00 00 	mov    QWORD PTR [rip+0x101c],rax        # 80b4e0 <m_ptr>
            src++;
  80a4c4:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
            continue;
  80a4c9:	e9 ac 00 00 00       	jmp    80a57a <write_tty+0x13a>
        }else if(*src=='\0')
  80a4ce:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a4d2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a4d5:	84 c0                	test   al,al
  80a4d7:	0f 84 af 00 00 00    	je     80a58c <write_tty+0x14c>
            break;
        if(*src=='\b')
  80a4dd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a4e1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a4e4:	3c 08                	cmp    al,0x8
  80a4e6:	75 1e                	jne    80a506 <write_tty+0xc6>
        {
            m_ptr-=2;
  80a4e8:	48 8b 05 f1 0f 00 00 	mov    rax,QWORD PTR [rip+0xff1]        # 80b4e0 <m_ptr>
  80a4ef:	48 83 e8 02          	sub    rax,0x2
  80a4f3:	48 89 05 e6 0f 00 00 	mov    QWORD PTR [rip+0xfe6],rax        # 80b4e0 <m_ptr>
            *m_ptr=0;
  80a4fa:	48 8b 05 df 0f 00 00 	mov    rax,QWORD PTR [rip+0xfdf]        # 80b4e0 <m_ptr>
  80a501:	c6 00 00             	mov    BYTE PTR [rax],0x0
  80a504:	eb 3e                	jmp    80a544 <write_tty+0x104>
        }else
        {
            *m_ptr++=*src++;
  80a506:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80a50a:	48 8d 42 01          	lea    rax,[rdx+0x1]
  80a50e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  80a512:	48 8b 05 c7 0f 00 00 	mov    rax,QWORD PTR [rip+0xfc7]        # 80b4e0 <m_ptr>
  80a519:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80a51d:	48 89 0d bc 0f 00 00 	mov    QWORD PTR [rip+0xfbc],rcx        # 80b4e0 <m_ptr>
  80a524:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80a527:	88 10                	mov    BYTE PTR [rax],dl
            *m_ptr++=m_color;
  80a529:	48 8b 05 b0 0f 00 00 	mov    rax,QWORD PTR [rip+0xfb0]        # 80b4e0 <m_ptr>
  80a530:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80a534:	48 89 15 a5 0f 00 00 	mov    QWORD PTR [rip+0xfa5],rdx        # 80b4e0 <m_ptr>
  80a53b:	0f b6 15 a6 0f 00 00 	movzx  edx,BYTE PTR [rip+0xfa6]        # 80b4e8 <m_color>
  80a542:	88 10                	mov    BYTE PTR [rax],dl
        }
        if(m_ptr-vpage_base>=vpage_size*2-line_chs*2&&i>0)
  80a544:	48 8b 05 95 0f 00 00 	mov    rax,QWORD PTR [rip+0xf95]        # 80b4e0 <m_ptr>
  80a54b:	48 8b 0d d6 ff c1 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc1ffd6]        # 42a528 <vpage_base>
  80a552:	48 29 c8             	sub    rax,rcx
  80a555:	48 89 c2             	mov    rdx,rax
  80a558:	8b 05 ea ff c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ffea]        # 42a548 <vpage_size>
  80a55e:	8b 0d d8 ff c1 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc1ffd8]        # 42a53c <line_chs>
  80a564:	29 c8                	sub    eax,ecx
  80a566:	01 c0                	add    eax,eax
  80a568:	48 98                	cdqe   
  80a56a:	48 39 c2             	cmp    rdx,rax
  80a56d:	7c 0b                	jl     80a57a <write_tty+0x13a>
  80a56f:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80a573:	7e 05                	jle    80a57a <write_tty+0x13a>
        {
            //下滚一行
            scrdown();
  80a575:	e8 bc f8 ff ff       	call   809e36 <scrdown>
    for(int i=0;i<len;i++)
  80a57a:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80a57e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a581:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  80a584:	0f 8c e9 fe ff ff    	jl     80a473 <write_tty+0x33>
  80a58a:	eb 01                	jmp    80a58d <write_tty+0x14d>
            break;
  80a58c:	90                   	nop
        }
    }
    set_cur();
  80a58d:	b8 00 00 00 00       	mov    eax,0x0
  80a592:	e8 8c fd ff ff       	call   80a323 <set_cur>
    return 0;
  80a597:	b8 00 00 00 00       	mov    eax,0x0
}
  80a59c:	c9                   	leave  
  80a59d:	c3                   	ret    

000000000080a59e <cls>:

void cls(driver_args *args)
{
  80a59e:	f3 0f 1e fa          	endbr64 
  80a5a2:	55                   	push   rbp
  80a5a3:	48 89 e5             	mov    rbp,rsp
  80a5a6:	48 83 ec 20          	sub    rsp,0x20
  80a5aa:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<vpage_size*2;i+=2)
  80a5ae:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80a5b5:	eb 16                	jmp    80a5cd <cls+0x2f>
    {
        vpage_base[i]=0;
  80a5b7:	48 8b 15 6a ff c1 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc1ff6a]        # 42a528 <vpage_base>
  80a5be:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a5c1:	48 98                	cdqe   
  80a5c3:	48 01 d0             	add    rax,rdx
  80a5c6:	c6 00 00             	mov    BYTE PTR [rax],0x0
    for(int i=0;i<vpage_size*2;i+=2)
  80a5c9:	83 45 fc 02          	add    DWORD PTR [rbp-0x4],0x2
  80a5cd:	8b 05 75 ff c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ff75]        # 42a548 <vpage_size>
  80a5d3:	01 c0                	add    eax,eax
  80a5d5:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  80a5d8:	7c dd                	jl     80a5b7 <cls+0x19>
    }
    m_ptr=vpage_base;
  80a5da:	48 8b 05 47 ff c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1ff47]        # 42a528 <vpage_base>
  80a5e1:	48 89 05 f8 0e 00 00 	mov    QWORD PTR [rip+0xef8],rax        # 80b4e0 <m_ptr>
    set_cur();
  80a5e8:	b8 00 00 00 00       	mov    eax,0x0
  80a5ed:	e8 31 fd ff ff       	call   80a323 <set_cur>
}
  80a5f2:	90                   	nop
  80a5f3:	c9                   	leave  
  80a5f4:	c3                   	ret    

000000000080a5f5 <set_color>:

void set_color(char color)
{
  80a5f5:	f3 0f 1e fa          	endbr64 
  80a5f9:	55                   	push   rbp
  80a5fa:	48 89 e5             	mov    rbp,rsp
  80a5fd:	89 f8                	mov    eax,edi
  80a5ff:	88 45 fc             	mov    BYTE PTR [rbp-0x4],al
    m_color=color;
  80a602:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80a606:	88 05 dc 0e 00 00    	mov    BYTE PTR [rip+0xedc],al        # 80b4e8 <m_color>
}
  80a60c:	90                   	nop
  80a60d:	5d                   	pop    rbp
  80a60e:	c3                   	ret    

000000000080a60f <tty_do_req>:

int tty_do_req(driver_args *args)
{
  80a60f:	f3 0f 1e fa          	endbr64 
  80a613:	55                   	push   rbp
  80a614:	48 89 e5             	mov    rbp,rsp
  80a617:	48 83 ec 10          	sub    rsp,0x10
  80a61b:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    switch (args->cmd)
  80a61f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a623:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  80a629:	83 f8 0d             	cmp    eax,0xd
  80a62c:	74 45                	je     80a673 <tty_do_req+0x64>
  80a62e:	83 f8 0d             	cmp    eax,0xd
  80a631:	7f 53                	jg     80a686 <tty_do_req+0x77>
  80a633:	83 f8 0c             	cmp    eax,0xc
  80a636:	74 2d                	je     80a665 <tty_do_req+0x56>
  80a638:	83 f8 0c             	cmp    eax,0xc
  80a63b:	7f 49                	jg     80a686 <tty_do_req+0x77>
  80a63d:	83 f8 02             	cmp    eax,0x2
  80a640:	74 07                	je     80a649 <tty_do_req+0x3a>
  80a642:	83 f8 03             	cmp    eax,0x3
  80a645:	74 10                	je     80a657 <tty_do_req+0x48>
  80a647:	eb 3d                	jmp    80a686 <tty_do_req+0x77>
    {
    case DRVF_READ:
        read_tty(args);
  80a649:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a64d:	48 89 c7             	mov    rdi,rax
  80a650:	e8 58 fd ff ff       	call   80a3ad <read_tty>
        break;
  80a655:	eb 36                	jmp    80a68d <tty_do_req+0x7e>
    case DRVF_WRITE:
        write_tty(args);
  80a657:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a65b:	48 89 c7             	mov    rdi,rax
  80a65e:	e8 dd fd ff ff       	call   80a440 <write_tty>
        break;
  80a663:	eb 28                	jmp    80a68d <tty_do_req+0x7e>
    case DRVF_SEEK:
        seek_tty(args);
  80a665:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a669:	48 89 c7             	mov    rdi,rax
  80a66c:	e8 a2 fb ff ff       	call   80a213 <seek_tty>
        break;
  80a671:	eb 1a                	jmp    80a68d <tty_do_req+0x7e>
    case DRVF_TELL:
        tell_monitor(args);
  80a673:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a677:	48 89 c7             	mov    rdi,rax
  80a67a:	b8 00 00 00 00       	mov    eax,0x0
  80a67f:	e8 bb fb ff ff       	call   80a23f <tell_monitor>
        break;
  80a684:	eb 07                	jmp    80a68d <tty_do_req+0x7e>
    default:return -1;
  80a686:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80a68b:	eb 05                	jmp    80a692 <tty_do_req+0x83>
    }
    return 0;
  80a68d:	b8 00 00 00 00       	mov    eax,0x0
}
  80a692:	c9                   	leave  
  80a693:	c3                   	ret    

000000000080a694 <init_com>:
//
#include "com.h"
#include "int.h"


void init_com(int base_port){
  80a694:	f3 0f 1e fa          	endbr64 
  80a698:	55                   	push   rbp
  80a699:	48 89 e5             	mov    rbp,rsp
  80a69c:	48 83 ec 10          	sub    rsp,0x10
  80a6a0:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    /* disable all interrupts */
    outb(base_port + COM_REG_IER, 0x00);
  80a6a3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a6a6:	83 c0 01             	add    eax,0x1
  80a6a9:	0f b7 c0             	movzx  eax,ax
  80a6ac:	be 00 00 00 00       	mov    esi,0x0
  80a6b1:	89 c7                	mov    edi,eax
  80a6b3:	e8 f8 a0 ff ff       	call   8047b0 <outb>
    
    /* enable DLAB to set bound rate divisor */
    outb(base_port + COM_REG_LCR, 0x80);
  80a6b8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a6bb:	83 c0 03             	add    eax,0x3
  80a6be:	0f b7 c0             	movzx  eax,ax
  80a6c1:	be 80 00 00 00       	mov    esi,0x80
  80a6c6:	89 c7                	mov    edi,eax
  80a6c8:	e8 e3 a0 ff ff       	call   8047b0 <outb>
    
    /* set divisor to 38400 baud */
    outb(base_port + COM_REG_DLL, 0x03);
  80a6cd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a6d0:	0f b7 c0             	movzx  eax,ax
  80a6d3:	be 03 00 00 00       	mov    esi,0x3
  80a6d8:	89 c7                	mov    edi,eax
  80a6da:	e8 d1 a0 ff ff       	call   8047b0 <outb>
    outb(base_port + COM_REG_DLM, 0x00);
  80a6df:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a6e2:	83 c0 01             	add    eax,0x1
  80a6e5:	0f b7 c0             	movzx  eax,ax
  80a6e8:	be 00 00 00 00       	mov    esi,0x0
  80a6ed:	89 c7                	mov    edi,eax
  80a6ef:	e8 bc a0 ff ff       	call   8047b0 <outb>
    
    /* 8 data bits, parity off, 1 stop bit, DLAB latch off */
    outb(base_port + COM_REG_LCR, 0x03);
  80a6f4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a6f7:	83 c0 03             	add    eax,0x3
  80a6fa:	0f b7 c0             	movzx  eax,ax
  80a6fd:	be 03 00 00 00       	mov    esi,0x3
  80a702:	89 c7                	mov    edi,eax
  80a704:	e8 a7 a0 ff ff       	call   8047b0 <outb>
    
    /* enable FIFO */
    outb(base_port + COM_REG_FCR, 0xC7);
  80a709:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a70c:	83 c0 02             	add    eax,0x2
  80a70f:	0f b7 c0             	movzx  eax,ax
  80a712:	be c7 00 00 00       	mov    esi,0xc7
  80a717:	89 c7                	mov    edi,eax
  80a719:	e8 92 a0 ff ff       	call   8047b0 <outb>

    /* enable IRQs, set RTS/DSR */
    outb(base_port + COM_REG_MCR, 0x0B);
  80a71e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a721:	83 c0 04             	add    eax,0x4
  80a724:	0f b7 c0             	movzx  eax,ax
  80a727:	be 0b 00 00 00       	mov    esi,0xb
  80a72c:	89 c7                	mov    edi,eax
  80a72e:	e8 7d a0 ff ff       	call   8047b0 <outb>
    
    /* set in loopback mode and test serial chip */
    outb(base_port + COM_REG_MCR, 0x1E);
  80a733:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a736:	83 c0 04             	add    eax,0x4
  80a739:	0f b7 c0             	movzx  eax,ax
  80a73c:	be 1e 00 00 00       	mov    esi,0x1e
  80a741:	89 c7                	mov    edi,eax
  80a743:	e8 68 a0 ff ff       	call   8047b0 <outb>
    
    /* write a byte to test serial chip */
    outb(base_port + COM_REG_TX, "arttnba3"[0]);
  80a748:	b8 61 00 00 00       	mov    eax,0x61
  80a74d:	0f b6 d0             	movzx  edx,al
  80a750:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a753:	0f b7 c0             	movzx  eax,ax
  80a756:	89 d6                	mov    esi,edx
  80a758:	89 c7                	mov    edi,eax
  80a75a:	e8 51 a0 ff ff       	call   8047b0 <outb>
    
    /* check if serial is faulty */
    if (inb(base_port + COM_REG_RX) != "arttnba3"[0]) {
  80a75f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a762:	0f b6 c0             	movzx  eax,al
  80a765:	89 c7                	mov    edi,eax
  80a767:	e8 5d a0 ff ff       	call   8047c9 <inb>
  80a76c:	0f b6 d0             	movzx  edx,al
  80a76f:	b8 61 00 00 00       	mov    eax,0x61
  80a774:	0f be c0             	movsx  eax,al
  80a777:	39 c2                	cmp    edx,eax
  80a779:	75 17                	jne    80a792 <init_com+0xfe>
        return;
    }
    
    /* set in normal mode */
    outb(base_port + COM_REG_MCR, 0x0F);
  80a77b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a77e:	83 c0 04             	add    eax,0x4
  80a781:	0f b7 c0             	movzx  eax,ax
  80a784:	be 0f 00 00 00       	mov    esi,0xf
  80a789:	89 c7                	mov    edi,eax
  80a78b:	e8 20 a0 ff ff       	call   8047b0 <outb>
  80a790:	eb 01                	jmp    80a793 <init_com+0xff>
        return;
  80a792:	90                   	nop
}
  80a793:	c9                   	leave  
  80a794:	c3                   	ret    

000000000080a795 <com_putchar>:
void com_putchar(unsigned short ch,int com_base)
{
  80a795:	f3 0f 1e fa          	endbr64 
  80a799:	55                   	push   rbp
  80a79a:	48 89 e5             	mov    rbp,rsp
  80a79d:	48 83 ec 20          	sub    rsp,0x20
  80a7a1:	89 f8                	mov    eax,edi
  80a7a3:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80a7a6:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    unsigned char res;
    /* wait for the port to be ready */
    do {
        res = inb(com_base + COM_REG_LSR);
  80a7aa:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80a7ad:	83 c0 05             	add    eax,0x5
  80a7b0:	0f b6 c0             	movzx  eax,al
  80a7b3:	89 c7                	mov    edi,eax
  80a7b5:	e8 0f a0 ff ff       	call   8047c9 <inb>
  80a7ba:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        res &= 0x20;
  80a7bd:	80 65 ff 20          	and    BYTE PTR [rbp-0x1],0x20
    } while (res == 0);
  80a7c1:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  80a7c5:	74 e3                	je     80a7aa <com_putchar+0x15>
    outb(com_base, ch);
  80a7c7:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  80a7cb:	0f b6 d0             	movzx  edx,al
  80a7ce:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80a7d1:	0f b7 c0             	movzx  eax,ax
  80a7d4:	89 d6                	mov    esi,edx
  80a7d6:	89 c7                	mov    edi,eax
  80a7d8:	e8 d3 9f ff ff       	call   8047b0 <outb>
}
  80a7dd:	90                   	nop
  80a7de:	c9                   	leave  
  80a7df:	c3                   	ret    

000000000080a7e0 <com_puts>:

void com_puts(char* s,int com_port){
  80a7e0:	f3 0f 1e fa          	endbr64 
  80a7e4:	55                   	push   rbp
  80a7e5:	48 89 e5             	mov    rbp,rsp
  80a7e8:	48 83 ec 10          	sub    rsp,0x10
  80a7ec:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a7f0:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    for(;*s;s++){
  80a7f3:	eb 1d                	jmp    80a812 <com_puts+0x32>
        com_putchar(*s,com_port);
  80a7f5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a7f9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a7fc:	66 98                	cbw    
  80a7fe:	0f b7 c0             	movzx  eax,ax
  80a801:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80a804:	89 d6                	mov    esi,edx
  80a806:	89 c7                	mov    edi,eax
  80a808:	e8 88 ff ff ff       	call   80a795 <com_putchar>
    for(;*s;s++){
  80a80d:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  80a812:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a816:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a819:	84 c0                	test   al,al
  80a81b:	75 d8                	jne    80a7f5 <com_puts+0x15>
    }
  80a81d:	90                   	nop
  80a81e:	90                   	nop
  80a81f:	c9                   	leave  
  80a820:	c3                   	ret    

000000000080a821 <memcpy>:
#include "mem.h"
#include "typename.h"
static u32 mem_end;
static u32 usr_mem_base;
void memcpy(u8* dest, u8 *src,u32 size){
  80a821:	f3 0f 1e fa          	endbr64 
  80a825:	55                   	push   rbp
  80a826:	48 89 e5             	mov    rbp,rsp
  80a829:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80a82d:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80a831:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    *dest=0xff;//如果页内存还没分配，这样就可以先激发缺页异常分配了，之后写数据就会完整不会少开头第一个字节。
  80a834:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a838:	c6 00 ff             	mov    BYTE PTR [rax],0xff
    for(int i=0;i<size;i++){
  80a83b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80a842:	eb 1b                	jmp    80a85f <memcpy+0x3e>
        *(dest)=*(src);
  80a844:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a848:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80a84b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a84f:	88 10                	mov    BYTE PTR [rax],dl
        dest++;
  80a851:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        src++;
  80a856:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<size;i++){
  80a85b:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a85f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a862:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
  80a865:	77 dd                	ja     80a844 <memcpy+0x23>
    }
}
  80a867:	90                   	nop
  80a868:	90                   	nop
  80a869:	5d                   	pop    rbp
  80a86a:	c3                   	ret    

000000000080a86b <memcmp>:
int memcmp(u8 *a,u8* b,int len)
{
  80a86b:	f3 0f 1e fa          	endbr64 
  80a86f:	55                   	push   rbp
  80a870:	48 89 e5             	mov    rbp,rsp
  80a873:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80a877:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80a87b:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    for(int i=0;i<len;i++)
  80a87e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80a885:	eb 3a                	jmp    80a8c1 <memcmp+0x56>
    {
        if(*a!=*b)
  80a887:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a88b:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80a88e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a892:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a895:	38 c2                	cmp    dl,al
  80a897:	74 1a                	je     80a8b3 <memcmp+0x48>
            return *a-*b;
  80a899:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a89d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a8a0:	0f b6 d0             	movzx  edx,al
  80a8a3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a8a7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a8aa:	0f b6 c8             	movzx  ecx,al
  80a8ad:	89 d0                	mov    eax,edx
  80a8af:	29 c8                	sub    eax,ecx
  80a8b1:	eb 1b                	jmp    80a8ce <memcmp+0x63>
        a++;
  80a8b3:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        b++;
  80a8b8:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<len;i++)
  80a8bd:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a8c1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a8c4:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  80a8c7:	7c be                	jl     80a887 <memcmp+0x1c>
    }
    return 0;
  80a8c9:	b8 00 00 00 00       	mov    eax,0x0
}
  80a8ce:	5d                   	pop    rbp
  80a8cf:	c3                   	ret    

000000000080a8d0 <memset>:
void memset(u8 *buf,u8 value,u32 size){
  80a8d0:	f3 0f 1e fa          	endbr64 
  80a8d4:	55                   	push   rbp
  80a8d5:	48 89 e5             	mov    rbp,rsp
  80a8d8:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80a8dc:	89 f0                	mov    eax,esi
  80a8de:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
  80a8e1:	88 45 e4             	mov    BYTE PTR [rbp-0x1c],al
    for(u32 i=0;i<size;i++){
  80a8e4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80a8eb:	eb 16                	jmp    80a903 <memset+0x33>
        *(buf++)=value;
  80a8ed:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a8f1:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80a8f5:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80a8f9:	0f b6 55 e4          	movzx  edx,BYTE PTR [rbp-0x1c]
  80a8fd:	88 10                	mov    BYTE PTR [rax],dl
    for(u32 i=0;i<size;i++){
  80a8ff:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a903:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a906:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  80a909:	72 e2                	jb     80a8ed <memset+0x1d>
    }
}
  80a90b:	90                   	nop
  80a90c:	90                   	nop
  80a90d:	5d                   	pop    rbp
  80a90e:	c3                   	ret    

000000000080a90f <get_mem_size>:

u32 get_mem_size(){
  80a90f:	f3 0f 1e fa          	endbr64 
  80a913:	55                   	push   rbp
  80a914:	48 89 e5             	mov    rbp,rsp
    return mem_end;
  80a917:	8b 05 3f fc c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fc3f]        # 42a55c <mem_end>
}
  80a91d:	5d                   	pop    rbp
  80a91e:	c3                   	ret    

000000000080a91f <strcpy>:
#include "str.h"
#include <stdarg.h>
void strcpy(unsigned char* dest, unsigned char *buf){
  80a91f:	f3 0f 1e fa          	endbr64 
  80a923:	55                   	push   rbp
  80a924:	48 89 e5             	mov    rbp,rsp
  80a927:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a92b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*buf!='\0'){
  80a92f:	eb 1d                	jmp    80a94e <strcpy+0x2f>
        *(dest++)=*(buf++);
  80a931:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80a935:	48 8d 42 01          	lea    rax,[rdx+0x1]
  80a939:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  80a93d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a941:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80a945:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80a949:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80a94c:	88 10                	mov    BYTE PTR [rax],dl
    while(*buf!='\0'){
  80a94e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a952:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a955:	84 c0                	test   al,al
  80a957:	75 d8                	jne    80a931 <strcpy+0x12>
    }
    *dest='\0';
  80a959:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a95d:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80a960:	90                   	nop
  80a961:	5d                   	pop    rbp
  80a962:	c3                   	ret    

000000000080a963 <strtok>:
static char strtokkee[512],*strtokkeeptr=strtokkee;
static int tokptr=0;
static char retbuf[512],*retbptr=retbuf;
char* strtok(char *str,char splitter){
  80a963:	f3 0f 1e fa          	endbr64 
  80a967:	55                   	push   rbp
  80a968:	48 89 e5             	mov    rbp,rsp
  80a96b:	48 83 ec 30          	sub    rsp,0x30
  80a96f:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80a973:	89 f0                	mov    eax,esi
  80a975:	88 45 d4             	mov    BYTE PTR [rbp-0x2c],al
    //limit: cannot cut string longer than 512
    if(str!=(void*)0){
  80a978:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80a97d:	0f 84 9c 00 00 00    	je     80aa1f <strtok+0xbc>
        //cut for the first time
        strcpy(strtokkee,str);
  80a983:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a987:	48 89 c6             	mov    rsi,rax
  80a98a:	bf 80 a5 42 00       	mov    edi,0x42a580
  80a98f:	e8 8b ff ff ff       	call   80a91f <strcpy>
        char* ptr=strtokkee;
  80a994:	48 c7 45 e8 80 a5 42 	mov    QWORD PTR [rbp-0x18],0x42a580
  80a99b:	00 
        for(tokptr=0;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512);
  80a99c:	c7 05 da fd c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1fdda],0x0        # 42a780 <tokptr>
  80a9a3:	00 00 00 
  80a9a6:	eb 1c                	jmp    80a9c4 <strtok+0x61>
  80a9a8:	8b 05 d2 fd c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fdd2]        # 42a780 <tokptr>
  80a9ae:	83 c0 01             	add    eax,0x1
  80a9b1:	99                   	cdq    
  80a9b2:	c1 ea 17             	shr    edx,0x17
  80a9b5:	01 d0                	add    eax,edx
  80a9b7:	25 ff 01 00 00       	and    eax,0x1ff
  80a9bc:	29 d0                	sub    eax,edx
  80a9be:	89 05 bc fd c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1fdbc],eax        # 42a780 <tokptr>
  80a9c4:	8b 05 b6 fd c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fdb6]        # 42a780 <tokptr>
  80a9ca:	48 98                	cdqe   
  80a9cc:	0f b6 80 80 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a580]
  80a9d3:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80a9d6:	74 13                	je     80a9eb <strtok+0x88>
  80a9d8:	8b 05 a2 fd c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fda2]        # 42a780 <tokptr>
  80a9de:	48 98                	cdqe   
  80a9e0:	0f b6 80 80 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a580]
  80a9e7:	84 c0                	test   al,al
  80a9e9:	75 bd                	jne    80a9a8 <strtok+0x45>
        strtokkee[tokptr]='\0';
  80a9eb:	8b 05 8f fd c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fd8f]        # 42a780 <tokptr>
  80a9f1:	48 98                	cdqe   
  80a9f3:	c6 80 80 a5 42 00 00 	mov    BYTE PTR [rax+0x42a580],0x0
        tokptr=(tokptr+1)%512;
  80a9fa:	8b 05 80 fd c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fd80]        # 42a780 <tokptr>
  80aa00:	83 c0 01             	add    eax,0x1
  80aa03:	99                   	cdq    
  80aa04:	c1 ea 17             	shr    edx,0x17
  80aa07:	01 d0                	add    eax,edx
  80aa09:	25 ff 01 00 00       	and    eax,0x1ff
  80aa0e:	29 d0                	sub    eax,edx
  80aa10:	89 05 6a fd c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1fd6a],eax        # 42a780 <tokptr>
        return ptr;
  80aa16:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80aa1a:	e9 9e 00 00 00       	jmp    80aabd <strtok+0x15a>
    }
    //go on cutting
    int c=0;
  80aa1f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* ptr=strtokkee+tokptr;
  80aa26:	8b 05 54 fd c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fd54]        # 42a780 <tokptr>
  80aa2c:	48 98                	cdqe   
  80aa2e:	48 05 80 a5 42 00    	add    rax,0x42a580
  80aa34:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512,c++);
  80aa38:	eb 20                	jmp    80aa5a <strtok+0xf7>
  80aa3a:	8b 05 40 fd c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fd40]        # 42a780 <tokptr>
  80aa40:	83 c0 01             	add    eax,0x1
  80aa43:	99                   	cdq    
  80aa44:	c1 ea 17             	shr    edx,0x17
  80aa47:	01 d0                	add    eax,edx
  80aa49:	25 ff 01 00 00       	and    eax,0x1ff
  80aa4e:	29 d0                	sub    eax,edx
  80aa50:	89 05 2a fd c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1fd2a],eax        # 42a780 <tokptr>
  80aa56:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80aa5a:	8b 05 20 fd c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fd20]        # 42a780 <tokptr>
  80aa60:	48 98                	cdqe   
  80aa62:	0f b6 80 80 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a580]
  80aa69:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80aa6c:	74 13                	je     80aa81 <strtok+0x11e>
  80aa6e:	8b 05 0c fd c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fd0c]        # 42a780 <tokptr>
  80aa74:	48 98                	cdqe   
  80aa76:	0f b6 80 80 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a580]
  80aa7d:	84 c0                	test   al,al
  80aa7f:	75 b9                	jne    80aa3a <strtok+0xd7>
    strtokkee[tokptr]='\0';
  80aa81:	8b 05 f9 fc c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fcf9]        # 42a780 <tokptr>
  80aa87:	48 98                	cdqe   
  80aa89:	c6 80 80 a5 42 00 00 	mov    BYTE PTR [rax+0x42a580],0x0
    tokptr=(tokptr+1)%512;
  80aa90:	8b 05 ea fc c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fcea]        # 42a780 <tokptr>
  80aa96:	83 c0 01             	add    eax,0x1
  80aa99:	99                   	cdq    
  80aa9a:	c1 ea 17             	shr    edx,0x17
  80aa9d:	01 d0                	add    eax,edx
  80aa9f:	25 ff 01 00 00       	and    eax,0x1ff
  80aaa4:	29 d0                	sub    eax,edx
  80aaa6:	89 05 d4 fc c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1fcd4],eax        # 42a780 <tokptr>
    if(c)
  80aaac:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80aab0:	74 06                	je     80aab8 <strtok+0x155>
        return ptr;
  80aab2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aab6:	eb 05                	jmp    80aabd <strtok+0x15a>
    else
        return (void*)0;
  80aab8:	b8 00 00 00 00       	mov    eax,0x0
}
  80aabd:	c9                   	leave  
  80aabe:	c3                   	ret    

000000000080aabf <strcmp>:
int strcmp(char *s1,char *s2)
{
  80aabf:	f3 0f 1e fa          	endbr64 
  80aac3:	55                   	push   rbp
  80aac4:	48 89 e5             	mov    rbp,rsp
  80aac7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80aacb:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	while(*s1!='\0'&&*s2!='\0'){
  80aacf:	eb 3c                	jmp    80ab0d <strcmp+0x4e>
		if(*s1>*s2)
  80aad1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aad5:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80aad8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aadc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aadf:	38 c2                	cmp    dl,al
  80aae1:	7e 07                	jle    80aaea <strcmp+0x2b>
			return 1;
  80aae3:	b8 01 00 00 00       	mov    eax,0x1
  80aae8:	eb 52                	jmp    80ab3c <strcmp+0x7d>
		else if(*s1<*s2)
  80aaea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aaee:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80aaf1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aaf5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aaf8:	38 c2                	cmp    dl,al
  80aafa:	7d 07                	jge    80ab03 <strcmp+0x44>
			return -1;
  80aafc:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80ab01:	eb 39                	jmp    80ab3c <strcmp+0x7d>
		s1++;
  80ab03:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
		s2++;
  80ab08:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
	while(*s1!='\0'&&*s2!='\0'){
  80ab0d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ab11:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ab14:	84 c0                	test   al,al
  80ab16:	74 0b                	je     80ab23 <strcmp+0x64>
  80ab18:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ab1c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ab1f:	84 c0                	test   al,al
  80ab21:	75 ae                	jne    80aad1 <strcmp+0x12>
	}
	if(*s1==*s2)
  80ab23:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ab27:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80ab2a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ab2e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ab31:	38 c2                	cmp    dl,al
  80ab33:	75 07                	jne    80ab3c <strcmp+0x7d>
		return 0;
  80ab35:	b8 00 00 00 00       	mov    eax,0x0
  80ab3a:	eb 00                	jmp    80ab3c <strcmp+0x7d>
}
  80ab3c:	5d                   	pop    rbp
  80ab3d:	c3                   	ret    

000000000080ab3e <strlen>:

int strlen(char *str)
{
  80ab3e:	f3 0f 1e fa          	endbr64 
  80ab42:	55                   	push   rbp
  80ab43:	48 89 e5             	mov    rbp,rsp
  80ab46:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int l=0;
  80ab4a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;*str!='\0';str++,l++);
  80ab51:	eb 09                	jmp    80ab5c <strlen+0x1e>
  80ab53:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  80ab58:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80ab5c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ab60:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ab63:	84 c0                	test   al,al
  80ab65:	75 ec                	jne    80ab53 <strlen+0x15>
    return l;
  80ab67:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80ab6a:	5d                   	pop    rbp
  80ab6b:	c3                   	ret    

000000000080ab6c <sprintf>:

void sprintf(char *dist, char *str,...)
{
  80ab6c:	f3 0f 1e fa          	endbr64 
  80ab70:	55                   	push   rbp
  80ab71:	48 89 e5             	mov    rbp,rsp
  80ab74:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  80ab7b:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  80ab82:	48 89 b5 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rsi
  80ab89:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  80ab90:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  80ab97:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  80ab9e:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  80aba5:	84 c0                	test   al,al
  80aba7:	74 20                	je     80abc9 <sprintf+0x5d>
  80aba9:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  80abad:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  80abb1:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  80abb5:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  80abb9:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  80abbd:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  80abc1:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  80abc5:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7

    //count num of args
    char *pstr=str;
  80abc9:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80abd0:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char *prev=str;
  80abd7:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80abde:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    int argnum=0;
  80abe5:	c7 85 3c ff ff ff 00 	mov    DWORD PTR [rbp-0xc4],0x0
  80abec:	00 00 00 
    while (*pstr!='\n')
  80abef:	eb 39                	jmp    80ac2a <sprintf+0xbe>
    {
        if(*pstr=='%'&&*prev!='%')
  80abf1:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80abf8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80abfb:	3c 25                	cmp    al,0x25
  80abfd:	75 15                	jne    80ac14 <sprintf+0xa8>
  80abff:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  80ac06:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ac09:	3c 25                	cmp    al,0x25
  80ac0b:	74 07                	je     80ac14 <sprintf+0xa8>
            argnum++;
  80ac0d:	83 85 3c ff ff ff 01 	add    DWORD PTR [rbp-0xc4],0x1
        prev=pstr;
  80ac14:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80ac1b:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
        pstr++;
  80ac22:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80ac29:	01 
    while (*pstr!='\n')
  80ac2a:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80ac31:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ac34:	3c 0a                	cmp    al,0xa
  80ac36:	75 b9                	jne    80abf1 <sprintf+0x85>
    }

    va_list vargs;
    va_start(vargs,str);
  80ac38:	c7 85 08 ff ff ff 10 	mov    DWORD PTR [rbp-0xf8],0x10
  80ac3f:	00 00 00 
  80ac42:	c7 85 0c ff ff ff 30 	mov    DWORD PTR [rbp-0xf4],0x30
  80ac49:	00 00 00 
  80ac4c:	48 8d 45 10          	lea    rax,[rbp+0x10]
  80ac50:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  80ac57:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  80ac5e:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
    pstr=str;
  80ac65:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80ac6c:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    for(;*pstr!='\0';pstr++){
  80ac73:	e9 e2 01 00 00       	jmp    80ae5a <sprintf+0x2ee>
        if(*pstr=='%'&&*(pstr+1)!='\0'){
  80ac78:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80ac7f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ac82:	3c 25                	cmp    al,0x25
  80ac84:	0f 85 aa 01 00 00    	jne    80ae34 <sprintf+0x2c8>
  80ac8a:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80ac91:	48 83 c0 01          	add    rax,0x1
  80ac95:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ac98:	84 c0                	test   al,al
  80ac9a:	0f 84 94 01 00 00    	je     80ae34 <sprintf+0x2c8>
            pstr++;
  80aca0:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80aca7:	01 
            if(*pstr=='x'){
  80aca8:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80acaf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80acb2:	3c 78                	cmp    al,0x78
  80acb4:	75 64                	jne    80ad1a <sprintf+0x1ae>
                int v=va_arg(vargs,int);
  80acb6:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80acbc:	83 f8 2f             	cmp    eax,0x2f
  80acbf:	77 23                	ja     80ace4 <sprintf+0x178>
  80acc1:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80acc8:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80acce:	89 d2                	mov    edx,edx
  80acd0:	48 01 d0             	add    rax,rdx
  80acd3:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80acd9:	83 c2 08             	add    edx,0x8
  80acdc:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80ace2:	eb 12                	jmp    80acf6 <sprintf+0x18a>
  80ace4:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80aceb:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80acef:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80acf6:	8b 00                	mov    eax,DWORD PTR [rax]
  80acf8:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
                sprint_hex(dist,v);
  80acfe:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
  80ad04:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80ad0b:	89 d6                	mov    esi,edx
  80ad0d:	48 89 c7             	mov    rdi,rax
  80ad10:	e8 4e 02 00 00       	call   80af63 <sprint_hex>
            if(*pstr=='x'){
  80ad15:	e9 38 01 00 00       	jmp    80ae52 <sprintf+0x2e6>
            }else if(*pstr=='s'){
  80ad1a:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80ad21:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ad24:	3c 73                	cmp    al,0x73
  80ad26:	75 68                	jne    80ad90 <sprintf+0x224>
                char* v=va_arg(vargs,char*);
  80ad28:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80ad2e:	83 f8 2f             	cmp    eax,0x2f
  80ad31:	77 23                	ja     80ad56 <sprintf+0x1ea>
  80ad33:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80ad3a:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80ad40:	89 d2                	mov    edx,edx
  80ad42:	48 01 d0             	add    rax,rdx
  80ad45:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80ad4b:	83 c2 08             	add    edx,0x8
  80ad4e:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80ad54:	eb 12                	jmp    80ad68 <sprintf+0x1fc>
  80ad56:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80ad5d:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80ad61:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80ad68:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ad6b:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
                sprintn(dist,v);
  80ad72:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
  80ad79:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80ad80:	48 89 d6             	mov    rsi,rdx
  80ad83:	48 89 c7             	mov    rdi,rax
  80ad86:	e8 5a 02 00 00       	call   80afe5 <sprintn>
            if(*pstr=='x'){
  80ad8b:	e9 c2 00 00 00       	jmp    80ae52 <sprintf+0x2e6>
            }else if(*pstr=='d'){
  80ad90:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80ad97:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ad9a:	3c 64                	cmp    al,0x64
  80ad9c:	75 66                	jne    80ae04 <sprintf+0x298>
                char* v=va_arg(vargs,char*);
  80ad9e:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80ada4:	83 f8 2f             	cmp    eax,0x2f
  80ada7:	77 23                	ja     80adcc <sprintf+0x260>
  80ada9:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80adb0:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80adb6:	89 d2                	mov    edx,edx
  80adb8:	48 01 d0             	add    rax,rdx
  80adbb:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80adc1:	83 c2 08             	add    edx,0x8
  80adc4:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80adca:	eb 12                	jmp    80adde <sprintf+0x272>
  80adcc:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80add3:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80add7:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80adde:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ade1:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
                sprint_decimal(dist,v);
  80ade8:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  80adef:	89 c2                	mov    edx,eax
  80adf1:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80adf8:	89 d6                	mov    esi,edx
  80adfa:	48 89 c7             	mov    rdi,rax
  80adfd:	e8 ad 00 00 00       	call   80aeaf <sprint_decimal>
            if(*pstr=='x'){
  80ae02:	eb 4e                	jmp    80ae52 <sprintf+0x2e6>
            }else if(*pstr=='c'){
  80ae04:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80ae0b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ae0e:	3c 63                	cmp    al,0x63
  80ae10:	75 02                	jne    80ae14 <sprintf+0x2a8>
                char v=va_arg(vargs,char);
  80ae12:	0f 0b                	ud2    
                sprintchar(dist,v);
            }else{
                sprintchar(dist,*pstr);
  80ae14:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80ae1b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ae1e:	0f be d0             	movsx  edx,al
  80ae21:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80ae28:	89 d6                	mov    esi,edx
  80ae2a:	48 89 c7             	mov    rdi,rax
  80ae2d:	e8 3e 00 00 00       	call   80ae70 <sprintchar>
            if(*pstr=='x'){
  80ae32:	eb 1e                	jmp    80ae52 <sprintf+0x2e6>
            }
        }else{
            sprintchar(dist,*pstr);
  80ae34:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80ae3b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ae3e:	0f be d0             	movsx  edx,al
  80ae41:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80ae48:	89 d6                	mov    esi,edx
  80ae4a:	48 89 c7             	mov    rdi,rax
  80ae4d:	e8 1e 00 00 00       	call   80ae70 <sprintchar>
    for(;*pstr!='\0';pstr++){
  80ae52:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80ae59:	01 
  80ae5a:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80ae61:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ae64:	84 c0                	test   al,al
  80ae66:	0f 85 0c fe ff ff    	jne    80ac78 <sprintf+0x10c>
        }
    }
    va_end(vargs);
}
  80ae6c:	90                   	nop
  80ae6d:	90                   	nop
  80ae6e:	c9                   	leave  
  80ae6f:	c3                   	ret    

000000000080ae70 <sprintchar>:
void sprintchar(char *dist,char c)
{
  80ae70:	f3 0f 1e fa          	endbr64 
  80ae74:	55                   	push   rbp
  80ae75:	48 89 e5             	mov    rbp,rsp
  80ae78:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80ae7c:	89 f0                	mov    eax,esi
  80ae7e:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    while(*dist!='\0')
  80ae81:	eb 05                	jmp    80ae88 <sprintchar+0x18>
        dist++;
  80ae83:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    while(*dist!='\0')
  80ae88:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae8c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ae8f:	84 c0                	test   al,al
  80ae91:	75 f0                	jne    80ae83 <sprintchar+0x13>
    *dist++=c;
  80ae93:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ae97:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80ae9b:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80ae9f:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  80aea3:	88 10                	mov    BYTE PTR [rax],dl
    *dist='\0';
  80aea5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aea9:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80aeac:	90                   	nop
  80aead:	5d                   	pop    rbp
  80aeae:	c3                   	ret    

000000000080aeaf <sprint_decimal>:
void sprint_decimal(char *dist,int c)
{
  80aeaf:	f3 0f 1e fa          	endbr64 
  80aeb3:	55                   	push   rbp
  80aeb4:	48 89 e5             	mov    rbp,rsp
  80aeb7:	48 83 ec 30          	sub    rsp,0x30
  80aebb:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80aebf:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
    unsigned char st[22];
    int p=0;
  80aec2:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<sizeof(unsigned long)*2){
  80aec9:	eb 65                	jmp    80af30 <sprint_decimal+0x81>
        unsigned char a=c%10+'0';
  80aecb:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  80aece:	48 63 c2             	movsxd rax,edx
  80aed1:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  80aed8:	48 c1 e8 20          	shr    rax,0x20
  80aedc:	c1 f8 02             	sar    eax,0x2
  80aedf:	89 d6                	mov    esi,edx
  80aee1:	c1 fe 1f             	sar    esi,0x1f
  80aee4:	29 f0                	sub    eax,esi
  80aee6:	89 c1                	mov    ecx,eax
  80aee8:	89 c8                	mov    eax,ecx
  80aeea:	c1 e0 02             	shl    eax,0x2
  80aeed:	01 c8                	add    eax,ecx
  80aeef:	01 c0                	add    eax,eax
  80aef1:	89 d1                	mov    ecx,edx
  80aef3:	29 c1                	sub    ecx,eax
  80aef5:	89 c8                	mov    eax,ecx
  80aef7:	83 c0 30             	add    eax,0x30
  80aefa:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        st[p++]=a;
  80aefd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80af00:	8d 50 01             	lea    edx,[rax+0x1]
  80af03:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80af06:	48 98                	cdqe   
  80af08:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80af0c:	88 54 05 e0          	mov    BYTE PTR [rbp+rax*1-0x20],dl
        c/=10;
  80af10:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80af13:	48 63 d0             	movsxd rdx,eax
  80af16:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
  80af1d:	48 c1 ea 20          	shr    rdx,0x20
  80af21:	c1 fa 02             	sar    edx,0x2
  80af24:	c1 f8 1f             	sar    eax,0x1f
  80af27:	89 c1                	mov    ecx,eax
  80af29:	89 d0                	mov    eax,edx
  80af2b:	29 c8                	sub    eax,ecx
  80af2d:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    while(p<sizeof(unsigned long)*2){
  80af30:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80af33:	83 f8 0f             	cmp    eax,0xf
  80af36:	76 93                	jbe    80aecb <sprint_decimal+0x1c>
    }
    while(p>0)
  80af38:	eb 1f                	jmp    80af59 <sprint_decimal+0xaa>
    {
        sprintchar(dist,st[--p]);
  80af3a:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80af3e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80af41:	48 98                	cdqe   
  80af43:	0f b6 44 05 e0       	movzx  eax,BYTE PTR [rbp+rax*1-0x20]
  80af48:	0f be d0             	movsx  edx,al
  80af4b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80af4f:	89 d6                	mov    esi,edx
  80af51:	48 89 c7             	mov    rdi,rax
  80af54:	e8 17 ff ff ff       	call   80ae70 <sprintchar>
    while(p>0)
  80af59:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80af5d:	7f db                	jg     80af3a <sprint_decimal+0x8b>
    }
}
  80af5f:	90                   	nop
  80af60:	90                   	nop
  80af61:	c9                   	leave  
  80af62:	c3                   	ret    

000000000080af63 <sprint_hex>:
void sprint_hex(char *dist,unsigned int c)
{
  80af63:	f3 0f 1e fa          	endbr64 
  80af67:	55                   	push   rbp
  80af68:	48 89 e5             	mov    rbp,rsp
  80af6b:	48 83 ec 20          	sub    rsp,0x20
  80af6f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80af73:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    unsigned char st[10];
    int p=0;
  80af76:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<10){
  80af7d:	eb 35                	jmp    80afb4 <sprint_hex+0x51>
        unsigned char a=c%16;
  80af7f:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80af82:	83 e0 0f             	and    eax,0xf
  80af85:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        if(a>9)a+='a'-10;
  80af88:	80 7d fb 09          	cmp    BYTE PTR [rbp-0x5],0x9
  80af8c:	76 06                	jbe    80af94 <sprint_hex+0x31>
  80af8e:	80 45 fb 57          	add    BYTE PTR [rbp-0x5],0x57
  80af92:	eb 04                	jmp    80af98 <sprint_hex+0x35>
        else a+='0';
  80af94:	80 45 fb 30          	add    BYTE PTR [rbp-0x5],0x30
        st[p++]=a;
  80af98:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80af9b:	8d 50 01             	lea    edx,[rax+0x1]
  80af9e:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80afa1:	48 98                	cdqe   
  80afa3:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80afa7:	88 54 05 f1          	mov    BYTE PTR [rbp+rax*1-0xf],dl
        c/=16;
  80afab:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80afae:	c1 e8 04             	shr    eax,0x4
  80afb1:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    while(p<10){
  80afb4:	83 7d fc 09          	cmp    DWORD PTR [rbp-0x4],0x9
  80afb8:	7e c5                	jle    80af7f <sprint_hex+0x1c>
    }
    while(p>0)
  80afba:	eb 1f                	jmp    80afdb <sprint_hex+0x78>
    {
        sprintchar(dist,st[--p]);
  80afbc:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80afc0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80afc3:	48 98                	cdqe   
  80afc5:	0f b6 44 05 f1       	movzx  eax,BYTE PTR [rbp+rax*1-0xf]
  80afca:	0f be d0             	movsx  edx,al
  80afcd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80afd1:	89 d6                	mov    esi,edx
  80afd3:	48 89 c7             	mov    rdi,rax
  80afd6:	e8 95 fe ff ff       	call   80ae70 <sprintchar>
    while(p>0)
  80afdb:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80afdf:	7f db                	jg     80afbc <sprint_hex+0x59>
    }
}
  80afe1:	90                   	nop
  80afe2:	90                   	nop
  80afe3:	c9                   	leave  
  80afe4:	c3                   	ret    

000000000080afe5 <sprintn>:
void sprintn(char *dist,char *str)
{
  80afe5:	f3 0f 1e fa          	endbr64 
  80afe9:	55                   	push   rbp
  80afea:	48 89 e5             	mov    rbp,rsp
  80afed:	48 83 ec 10          	sub    rsp,0x10
  80aff1:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80aff5:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*str!='\0')
  80aff9:	eb 20                	jmp    80b01b <sprintn+0x36>
    {
        sprintchar(dist,*str++);
  80affb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80afff:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80b003:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  80b007:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b00a:	0f be d0             	movsx  edx,al
  80b00d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b011:	89 d6                	mov    esi,edx
  80b013:	48 89 c7             	mov    rdi,rax
  80b016:	e8 55 fe ff ff       	call   80ae70 <sprintchar>
    while(*str!='\0')
  80b01b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b01f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b022:	84 c0                	test   al,al
  80b024:	75 d5                	jne    80affb <sprintn+0x16>
    }
  80b026:	90                   	nop
  80b027:	90                   	nop
  80b028:	c9                   	leave  
  80b029:	c3                   	ret    
  80b02a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

000000000080b030 <create_zero>:
  80b030:	e8 f2 85 ff ff       	call   803627 <req_proc>
  80b035:	83 f8 ff             	cmp    eax,0xffffffff
  80b038:	74 0c                	je     80b046 <create_zero.retu>
  80b03a:	e8 e1 86 ff ff       	call   803720 <set_proc>
  80b03f:	67 8b 04 24          	mov    eax,DWORD PTR [esp]
  80b043:	83 c4 40             	add    esp,0x40

000000000080b046 <create_zero.retu>:
  80b046:	c3                   	ret    

000000000080b047 <fill_desc>:
  80b047:	55                   	push   rbp
  80b048:	48 89 e5             	mov    rbp,rsp
  80b04b:	67 8b 45 14          	mov    eax,DWORD PTR [ebp+0x14]
  80b04f:	67 8b 5d 10          	mov    ebx,DWORD PTR [ebp+0x10]
  80b053:	67 8b 4d 0c          	mov    ecx,DWORD PTR [ebp+0xc]
  80b057:	67 8b 55 08          	mov    edx,DWORD PTR [ebp+0x8]
  80b05b:	be 9a b1 80 00       	mov    esi,0x80b19a
  80b060:	c7 04 25 9a b1 80 00 	mov    DWORD PTR ds:0x80b19a,0x0
  80b067:	00 00 00 00 
  80b06b:	c7 04 25 9e b1 80 00 	mov    DWORD PTR ds:0x80b19e,0x0
  80b072:	00 00 00 00 
  80b076:	66 67 89 0e          	mov    WORD PTR [esi],cx
  80b07a:	c1 e9 10             	shr    ecx,0x10
  80b07d:	66 67 89 56 02       	mov    WORD PTR [esi+0x2],dx
  80b082:	c1 ea 10             	shr    edx,0x10
  80b085:	67 88 56 04          	mov    BYTE PTR [esi+0x4],dl
  80b089:	66 c1 ea 08          	shr    dx,0x8
  80b08d:	67 88 56 07          	mov    BYTE PTR [esi+0x7],dl
  80b091:	66 67 89 5e 05       	mov    WORD PTR [esi+0x5],bx
  80b096:	67 8b 7e 04          	mov    edi,DWORD PTR [esi+0x4]
  80b09a:	c1 e1 08             	shl    ecx,0x8
  80b09d:	09 cf                	or     edi,ecx
  80b09f:	67 89 7e 04          	mov    DWORD PTR [esi+0x4],edi
  80b0a3:	8b 14 25 9a b1 80 00 	mov    edx,DWORD PTR ds:0x80b19a
  80b0aa:	67 89 10             	mov    DWORD PTR [eax],edx
  80b0ad:	8b 14 25 9e b1 80 00 	mov    edx,DWORD PTR ds:0x80b19e
  80b0b4:	67 89 50 04          	mov    DWORD PTR [eax+0x4],edx
  80b0b8:	c9                   	leave  
  80b0b9:	c3                   	ret    

000000000080b0ba <switch_proc_asm>:
  80b0ba:	66 67 8b 44 24 04    	mov    ax,WORD PTR [esp+0x4]
  80b0c0:	66 89 04 25 d8 b0 80 	mov    WORD PTR ds:0x80b0d8,ax
  80b0c7:	00 
  80b0c8:	c7 04 25 d4 b0 80 00 	mov    DWORD PTR ds:0x80b0d4,0x0
  80b0cf:	00 00 00 00 

000000000080b0d3 <switch_proc_asm.ljmp>:
  80b0d3:	ea                   	(bad)  
  80b0d4:	00 00                	add    BYTE PTR [rax],al
  80b0d6:	00 00                	add    BYTE PTR [rax],al
  80b0d8:	00 00                	add    BYTE PTR [rax],al
  80b0da:	c3                   	ret    

000000000080b0db <switch_to_old>:
  80b0db:	67 8b 74 24 04       	mov    esi,DWORD PTR [esp+0x4]
  80b0e0:	67 8b 5e 20          	mov    ebx,DWORD PTR [esi+0x20]
  80b0e4:	bf 4c b1 80 00       	mov    edi,0x80b14c
  80b0e9:	67 89 5f 01          	mov    DWORD PTR [edi+0x1],ebx
  80b0ed:	67 8b 46 38          	mov    eax,DWORD PTR [esi+0x38]
  80b0f1:	89 c1                	mov    ecx,eax
  80b0f3:	83 e9 04             	sub    ecx,0x4
  80b0f6:	67 89 19             	mov    DWORD PTR [ecx],ebx
  80b0f9:	50                   	push   rax
  80b0fa:	89 f5                	mov    ebp,esi
  80b0fc:	83 c5 28             	add    ebp,0x28
  80b0ff:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80b103:	50                   	push   rax
  80b104:	83 c5 04             	add    ebp,0x4
  80b107:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80b10b:	50                   	push   rax
  80b10c:	83 c5 04             	add    ebp,0x4
  80b10f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80b113:	50                   	push   rax
  80b114:	83 c5 04             	add    ebp,0x4
  80b117:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80b11b:	50                   	push   rax
  80b11c:	83 c5 04             	add    ebp,0x4
  80b11f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80b123:	50                   	push   rax
  80b124:	83 c5 04             	add    ebp,0x4
  80b127:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80b12b:	50                   	push   rax
  80b12c:	83 c5 04             	add    ebp,0x4
  80b12f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80b133:	50                   	push   rax
  80b134:	83 c5 04             	add    ebp,0x4
  80b137:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80b13b:	50                   	push   rax
  80b13c:	83 c5 04             	add    ebp,0x4
  80b13f:	67 8b 46 1c          	mov    eax,DWORD PTR [esi+0x1c]
  80b143:	0f 22 d8             	mov    cr3,rax
  80b146:	67 8b 46 24          	mov    eax,DWORD PTR [esi+0x24]
  80b14a:	50                   	push   rax
  80b14b:	5c                   	pop    rsp

000000000080b14c <switch_to_old.leap>:
  80b14c:	ea                   	(bad)  
  80b14d:	00 00                	add    BYTE PTR [rax],al
  80b14f:	00 00                	add    BYTE PTR [rax],al
  80b151:	08 00                	or     BYTE PTR [rax],al

000000000080b153 <save_context>:
  80b153:	67 8b 44 24 24       	mov    eax,DWORD PTR [esp+0x24]
  80b158:	83 c0 44             	add    eax,0x44
  80b15b:	b9 08 00 00 00       	mov    ecx,0x8
  80b160:	89 e7                	mov    edi,esp

000000000080b162 <save_context.loops>:
  80b162:	67 8b 17             	mov    edx,DWORD PTR [edi]
  80b165:	67 89 10             	mov    DWORD PTR [eax],edx
  80b168:	83 c7 04             	add    edi,0x4
  80b16b:	83 e8 04             	sub    eax,0x4
  80b16e:	e2 f2                	loop   80b162 <save_context.loops>
  80b170:	5b                   	pop    rbx
  80b171:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  80b176:	67 89 58 24          	mov    DWORD PTR [eax+0x24],ebx
  80b17a:	67 48 8b 1c 24       	mov    rbx,QWORD PTR [esp]
  80b17f:	67 89 58 20          	mov    DWORD PTR [eax+0x20],ebx
  80b183:	c3                   	ret    

000000000080b184 <move_to_user_mode>:
  80b184:	66 b8 20 00          	mov    ax,0x20
  80b188:	8e d8                	mov    ds,eax
  80b18a:	8e c0                	mov    es,eax
  80b18c:	8e e8                	mov    gs,eax
  80b18e:	6a 20                	push   0x20
  80b190:	54                   	push   rsp
  80b191:	6a 18                	push   0x18
  80b193:	68 99 b1 80 00       	push   0x80b199
  80b198:	cf                   	iret   

000000000080b199 <move_to_user_mode.done>:
  80b199:	c3                   	ret    

000000000080b19a <desc>:
	...

000000000080b1a2 <ret_sys_call>:
  80b1a2:	58                   	pop    rax
  80b1a3:	8e d8                	mov    ds,eax
  80b1a5:	58                   	pop    rax
  80b1a6:	8e c0                	mov    es,eax
  80b1a8:	41 5f                	pop    r15
  80b1aa:	41 5e                	pop    r14
  80b1ac:	41 5d                	pop    r13
  80b1ae:	41 5c                	pop    r12
  80b1b0:	41 5b                	pop    r11
  80b1b2:	41 5a                	pop    r10
  80b1b4:	41 59                	pop    r9
  80b1b6:	41 58                	pop    r8
  80b1b8:	5e                   	pop    rsi
  80b1b9:	5f                   	pop    rdi
  80b1ba:	5a                   	pop    rdx
  80b1bb:	59                   	pop    rcx
  80b1bc:	5b                   	pop    rbx
  80b1bd:	58                   	pop    rax

000000000080b1be <tmp>:
  80b1be:	48 0f 07             	sysretq 
