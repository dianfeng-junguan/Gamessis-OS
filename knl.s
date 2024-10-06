
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
  100093:	b8 07 08 80 00       	mov    eax,0x800807
  100098:	ea                   	(bad)  
  100099:	07                   	(bad)  
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
  800194:	b8 e0 11 80 00       	mov    eax,0x8011e0
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
  800217:	b8 be 66 80 00       	mov    eax,0x8066be
  80021c:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800221:	ba 08 00 00 00       	mov    edx,0x8
  800226:	48 89 c6             	mov    rsi,rax
  800229:	bf 21 00 00 00       	mov    edi,0x21
  80022e:	e8 02 01 00 00       	call   800335 <set_gate>
	set_gate(0x20,(addr_t)clock,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800233:	b8 c0 50 80 00       	mov    eax,0x8050c0
  800238:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80023d:	ba 08 00 00 00       	mov    edx,0x8
  800242:	48 89 c6             	mov    rsi,rax
  800245:	bf 20 00 00 00       	mov    edi,0x20
  80024a:	e8 e6 00 00 00       	call   800335 <set_gate>
	set_gate(0x2e,(addr_t)disk_int_handler,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80024f:	b8 c0 75 80 00       	mov    eax,0x8075c0
  800254:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800259:	ba 08 00 00 00       	mov    edx,0x8
  80025e:	48 89 c6             	mov    rsi,rax
  800261:	bf 2e 00 00 00       	mov    edi,0x2e
  800266:	e8 ca 00 00 00       	call   800335 <set_gate>
    set_gate(0x80,(addr_t)_syscall,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);//
  80026b:	b8 f0 5a 80 00       	mov    eax,0x805af0
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
  800291:	e8 9a 4b 00 00       	call   804e30 <outb>
	outb(0xA0,0x11);
  800296:	be 11 00 00 00       	mov    esi,0x11
  80029b:	bf a0 00 00 00       	mov    edi,0xa0
  8002a0:	e8 8b 4b 00 00       	call   804e30 <outb>
	//ICW2
	outb(0x21,0x20);//former 0x20,0x20
  8002a5:	be 20 00 00 00       	mov    esi,0x20
  8002aa:	bf 21 00 00 00       	mov    edi,0x21
  8002af:	e8 7c 4b 00 00       	call   804e30 <outb>
	outb(0xA1,0x28);
  8002b4:	be 28 00 00 00       	mov    esi,0x28
  8002b9:	bf a1 00 00 00       	mov    edi,0xa1
  8002be:	e8 6d 4b 00 00       	call   804e30 <outb>
	//ICW3
	outb(0x21,0x04);
  8002c3:	be 04 00 00 00       	mov    esi,0x4
  8002c8:	bf 21 00 00 00       	mov    edi,0x21
  8002cd:	e8 5e 4b 00 00       	call   804e30 <outb>
	outb(0xA1,0x02);
  8002d2:	be 02 00 00 00       	mov    esi,0x2
  8002d7:	bf a1 00 00 00       	mov    edi,0xa1
  8002dc:	e8 4f 4b 00 00       	call   804e30 <outb>
	//ICW4
	outb(0x21,0x01);
  8002e1:	be 01 00 00 00       	mov    esi,0x1
  8002e6:	bf 21 00 00 00       	mov    edi,0x21
  8002eb:	e8 40 4b 00 00       	call   804e30 <outb>
	outb(0xA1,0x01);
  8002f0:	be 01 00 00 00       	mov    esi,0x1
  8002f5:	bf a1 00 00 00       	mov    edi,0xa1
  8002fa:	e8 31 4b 00 00       	call   804e30 <outb>

    turn_on_int();
  8002ff:	b8 00 00 00 00       	mov    eax,0x0
  800304:	e8 61 4b 00 00       	call   804e6a <turn_on_int>


    //设置IA32_LSTAR,为syscall做设置
    wrmsr(0xc0000082, _syscall);
  800309:	b8 f0 5a 80 00       	mov    eax,0x805af0
  80030e:	48 89 c6             	mov    rsi,rax
  800311:	b8 82 00 00 c0       	mov    eax,0xc0000082
  800316:	48 89 c7             	mov    rdi,rax
  800319:	e8 bf 04 00 00       	call   8007dd <wrmsr>
    //设置IA32_FMASK,为syscall做设置
    wrmsr(0xc0000084, -1);
  80031e:	48 c7 c6 ff ff ff ff 	mov    rsi,0xffffffffffffffff
  800325:	b8 84 00 00 c0       	mov    eax,0xc0000084
  80032a:	48 89 c7             	mov    rdi,rax
  80032d:	e8 ab 04 00 00       	call   8007dd <wrmsr>
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
  800350:	48 8b 15 09 ab 00 00 	mov    rdx,QWORD PTR [rip+0xab09]        # 80ae60 <idt>
  800357:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80035b:	48 c1 e0 04          	shl    rax,0x4
  80035f:	48 01 d0             	add    rax,rdx
  800362:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800366:	66 89 10             	mov    WORD PTR [rax],dx
    idt[index].offset_mid=(offset>>16)&0xffff;
  800369:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80036d:	48 c1 e8 10          	shr    rax,0x10
  800371:	48 89 c2             	mov    rdx,rax
  800374:	48 8b 0d e5 aa 00 00 	mov    rcx,QWORD PTR [rip+0xaae5]        # 80ae60 <idt>
  80037b:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80037f:	48 c1 e0 04          	shl    rax,0x4
  800383:	48 01 c8             	add    rax,rcx
  800386:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
    idt[index].offset_high=(offset>>32)&0x0000ffff;
  80038a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80038e:	48 c1 e8 20          	shr    rax,0x20
  800392:	89 c1                	mov    ecx,eax
  800394:	48 8b 15 c5 aa 00 00 	mov    rdx,QWORD PTR [rip+0xaac5]        # 80ae60 <idt>
  80039b:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80039f:	48 c1 e0 04          	shl    rax,0x4
  8003a3:	48 01 c2             	add    rdx,rax
  8003a6:	0f b7 c1             	movzx  eax,cx
  8003a9:	89 42 08             	mov    DWORD PTR [rdx+0x8],eax
    idt[index].attr=attr|1;//1是ist索引
  8003ac:	48 8b 15 ad aa 00 00 	mov    rdx,QWORD PTR [rip+0xaaad]        # 80ae60 <idt>
  8003b3:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003b7:	48 c1 e0 04          	shl    rax,0x4
  8003bb:	48 01 d0             	add    rax,rdx
  8003be:	0f b7 55 ec          	movzx  edx,WORD PTR [rbp-0x14]
  8003c2:	83 ca 01             	or     edx,0x1
  8003c5:	66 89 50 04          	mov    WORD PTR [rax+0x4],dx
    idt[index].selector=selector;
  8003c9:	48 8b 15 90 aa 00 00 	mov    rdx,QWORD PTR [rip+0xaa90]        # 80ae60 <idt>
  8003d0:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003d4:	48 c1 e0 04          	shl    rax,0x4
  8003d8:	48 01 c2             	add    rdx,rax
  8003db:	0f b7 45 f8          	movzx  eax,WORD PTR [rbp-0x8]
  8003df:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    idt[index].rsvd=0;
  8003e3:	48 8b 15 76 aa 00 00 	mov    rdx,QWORD PTR [rip+0xaa76]        # 80ae60 <idt>
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
  80040d:	e8 4c 4a 00 00       	call   804e5e <eoi>
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
  800427:	e8 32 4a 00 00       	call   804e5e <eoi>
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
  800441:	e8 18 4a 00 00       	call   804e5e <eoi>
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
  80045b:	e8 fe 49 00 00       	call   804e5e <eoi>
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
  800475:	e8 e4 49 00 00       	call   804e5e <eoi>
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
  80048f:	e8 ca 49 00 00       	call   804e5e <eoi>
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
  8004a8:	e8 b1 49 00 00       	call   804e5e <eoi>
    report_back_trace_of_err();
  8004ad:	b8 00 00 00 00       	mov    eax,0x0
  8004b2:	e8 d2 49 00 00       	call   804e89 <report_back_trace_of_err>
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
  8004cd:	e8 8c 49 00 00       	call   804e5e <eoi>
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
  8004e7:	e8 72 49 00 00       	call   804e5e <eoi>
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
  800500:	e8 59 49 00 00       	call   804e5e <eoi>
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
  800519:	e8 40 49 00 00       	call   804e5e <eoi>
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
  800533:	e8 26 49 00 00       	call   804e5e <eoi>
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
  80054d:	e8 0c 49 00 00       	call   804e5e <eoi>
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
  800571:	e8 e8 48 00 00       	call   804e5e <eoi>
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
  80058e:	e8 cb 48 00 00       	call   804e5e <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  800593:	fb                   	sti    
  800594:	c9                   	leave  
  800595:	48 cf                	iretq  
}
  800597:	90                   	nop
  800598:	5d                   	pop    rbp
  800599:	c3                   	ret    

000000000080059a <syscall>:
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
  8005be:	0f 87 17 02 00 00    	ja     8007db <syscall+0x241>
  8005c4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8005c7:	48 8b 04 c5 a0 25 81 	mov    rax,QWORD PTR [rax*8+0x8125a0]
  8005ce:	00 
  8005cf:	3e ff e0             	notrack jmp rax
    {
        case 0:return reg_device(b);
  8005d2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005d5:	48 98                	cdqe   
  8005d7:	48 89 c7             	mov    rdi,rax
  8005da:	e8 75 24 00 00       	call   802a54 <reg_device>
  8005df:	e9 f7 01 00 00       	jmp    8007db <syscall+0x241>
        case 1:return dispose_device(b);
  8005e4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005e7:	89 c7                	mov    edi,eax
  8005e9:	e8 c5 2e 00 00       	call   8034b3 <dispose_device>
  8005ee:	e9 e8 01 00 00       	jmp    8007db <syscall+0x241>
        case 2:return reg_driver(b);
  8005f3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005f6:	48 98                	cdqe   
  8005f8:	48 89 c7             	mov    rdi,rax
  8005fb:	e8 3c 27 00 00       	call   802d3c <reg_driver>
  800600:	e9 d6 01 00 00       	jmp    8007db <syscall+0x241>
        case 3:return dispose_driver(b);
  800605:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800608:	48 98                	cdqe   
  80060a:	48 89 c7             	mov    rdi,rax
  80060d:	e8 3f 2f 00 00       	call   803551 <dispose_driver>
  800612:	e9 c4 01 00 00       	jmp    8007db <syscall+0x241>
        case 4:return call_drv_func(b,c,d);
  800617:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80061a:	48 98                	cdqe   
  80061c:	48 89 c2             	mov    rdx,rax
  80061f:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  800622:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800625:	89 ce                	mov    esi,ecx
  800627:	89 c7                	mov    edi,eax
  800629:	e8 2e 2c 00 00       	call   80325c <call_drv_func>
  80062e:	e9 a8 01 00 00       	jmp    8007db <syscall+0x241>
        case 5:return req_page_at(b,c);
  800633:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800636:	48 98                	cdqe   
  800638:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80063b:	89 d6                	mov    esi,edx
  80063d:	48 89 c7             	mov    rdi,rax
  800640:	e8 f6 10 00 00       	call   80173b <req_page_at>
  800645:	e9 91 01 00 00       	jmp    8007db <syscall+0x241>
        case 6:return free_page(b);
  80064a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80064d:	48 98                	cdqe   
  80064f:	48 89 c7             	mov    rdi,rax
  800652:	e8 f8 0e 00 00       	call   80154f <free_page>
  800657:	e9 7f 01 00 00       	jmp    8007db <syscall+0x241>
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
  800674:	e8 99 41 00 00       	call   804812 <reg_proc>
  800679:	e9 5d 01 00 00       	jmp    8007db <syscall+0x241>
        case 8:del_proc(b);
  80067e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800681:	89 c7                	mov    edi,eax
  800683:	e8 5c 3f 00 00       	call   8045e4 <del_proc>
        case 10:chk_vm(b,c);
  800688:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80068b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80068e:	89 d6                	mov    esi,edx
  800690:	89 c7                	mov    edi,eax
  800692:	e8 7d 11 00 00       	call   801814 <chk_vm>
        case 11:return sys_open(b,c);
  800697:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80069a:	48 98                	cdqe   
  80069c:	48 89 c2             	mov    rdx,rax
  80069f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8006a2:	89 c6                	mov    esi,eax
  8006a4:	48 89 d7             	mov    rdi,rdx
  8006a7:	e8 4c 15 00 00       	call   801bf8 <sys_open>
  8006ac:	e9 2a 01 00 00       	jmp    8007db <syscall+0x241>
        case 12:return sys_close(b);
  8006b1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006b4:	89 c7                	mov    edi,eax
  8006b6:	e8 06 1a 00 00       	call   8020c1 <sys_close>
  8006bb:	e9 1b 01 00 00       	jmp    8007db <syscall+0x241>
        case 13:return sys_read(b,c,d);
  8006c0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8006c3:	48 98                	cdqe   
  8006c5:	48 89 c1             	mov    rcx,rax
  8006c8:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006cb:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006ce:	48 89 ce             	mov    rsi,rcx
  8006d1:	89 c7                	mov    edi,eax
  8006d3:	e8 ff 1a 00 00       	call   8021d7 <sys_read>
  8006d8:	e9 fe 00 00 00       	jmp    8007db <syscall+0x241>
        case 14:return sys_write(b,c,d);
  8006dd:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8006e0:	48 98                	cdqe   
  8006e2:	48 89 c1             	mov    rcx,rax
  8006e5:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006e8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006eb:	48 89 ce             	mov    rsi,rcx
  8006ee:	89 c7                	mov    edi,eax
  8006f0:	e8 51 1a 00 00       	call   802146 <sys_write>
  8006f5:	e9 e1 00 00 00       	jmp    8007db <syscall+0x241>
        case 15:return sys_seek(b,c,d);
  8006fa:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006fd:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  800700:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800703:	89 ce                	mov    esi,ecx
  800705:	89 c7                	mov    edi,eax
  800707:	e8 5c 1b 00 00       	call   802268 <sys_seek>
  80070c:	e9 ca 00 00 00       	jmp    8007db <syscall+0x241>
        case 16:return sys_tell(b);
  800711:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800714:	89 c7                	mov    edi,eax
  800716:	e8 94 1b 00 00       	call   8022af <sys_tell>
  80071b:	e9 bb 00 00 00       	jmp    8007db <syscall+0x241>
        case 17:return reg_vol(b,c,d);
  800720:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  800723:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  800726:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800729:	89 ce                	mov    esi,ecx
  80072b:	89 c7                	mov    edi,eax
  80072d:	b8 00 00 00 00       	mov    eax,0x0
  800732:	e8 b6 13 00 00       	call   801aed <reg_vol>
  800737:	e9 9f 00 00 00       	jmp    8007db <syscall+0x241>
        case 18:return free_vol(b);
  80073c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80073f:	89 c7                	mov    edi,eax
  800741:	b8 00 00 00 00       	mov    eax,0x0
  800746:	e8 86 13 00 00       	call   801ad1 <free_vol>
  80074b:	e9 8b 00 00 00       	jmp    8007db <syscall+0x241>
        case 19:return execute(b);
  800750:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800753:	48 98                	cdqe   
  800755:	48 89 c7             	mov    rdi,rax
  800758:	e8 b2 49 00 00       	call   80510f <execute>
  80075d:	eb 7c                	jmp    8007db <syscall+0x241>
        case SYSCALL_EXIT:return sys_exit(b);
  80075f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800762:	89 c7                	mov    edi,eax
  800764:	e8 88 40 00 00       	call   8047f1 <sys_exit>
  800769:	eb 70                	jmp    8007db <syscall+0x241>
        case SYSCALL_CALL:return exec_call(b);
  80076b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80076e:	48 98                	cdqe   
  800770:	48 89 c7             	mov    rdi,rax
  800773:	e8 92 4a 00 00       	call   80520a <exec_call>
  800778:	eb 61                	jmp    8007db <syscall+0x241>
        case SYSCALL_MKFIFO:return sys_mkfifo(b);
  80077a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80077d:	89 c7                	mov    edi,eax
  80077f:	e8 ee 11 00 00       	call   801972 <sys_mkfifo>
  800784:	eb 55                	jmp    8007db <syscall+0x241>
        case SYSCALL_MALLOC:return sys_malloc(b);
  800786:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800789:	89 c7                	mov    edi,eax
  80078b:	e8 1d 42 00 00       	call   8049ad <sys_malloc>
  800790:	eb 49                	jmp    8007db <syscall+0x241>
        case SYSCALL_FREE:return sys_free(b);
  800792:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800795:	89 c7                	mov    edi,eax
  800797:	e8 b8 43 00 00       	call   804b54 <sys_free>
  80079c:	eb 3d                	jmp    8007db <syscall+0x241>
        case SYSCALL_KB_READC:return sys_getkbc();
  80079e:	b8 00 00 00 00       	mov    eax,0x0
  8007a3:	e8 2a 60 00 00       	call   8067d2 <sys_getkbc>
  8007a8:	0f be c0             	movsx  eax,al
  8007ab:	eb 2e                	jmp    8007db <syscall+0x241>
        case SYSCALL_FIND_DEV:return sys_find_dev(b);
  8007ad:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8007b0:	48 98                	cdqe   
  8007b2:	48 89 c7             	mov    rdi,rax
  8007b5:	e8 d2 26 00 00       	call   802e8c <sys_find_dev>
  8007ba:	eb 1f                	jmp    8007db <syscall+0x241>
        case SYSCALL_OPERATE_DEV:return sys_operate_dev(b,c,d);
  8007bc:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8007bf:	48 98                	cdqe   
  8007c1:	48 89 c2             	mov    rdx,rax
  8007c4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8007c7:	48 98                	cdqe   
  8007c9:	48 89 c1             	mov    rcx,rax
  8007cc:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8007cf:	89 c6                	mov    esi,eax
  8007d1:	48 89 cf             	mov    rdi,rcx
  8007d4:	e8 45 27 00 00       	call   802f1e <sys_operate_dev>
  8007d9:	eb 00                	jmp    8007db <syscall+0x241>
    }
    // __asm__ volatile("mov %0,%%eax\r\n mov %1,%%ebx\r\n mov %2,%%ecx\r\n mov %3,%%edx\r\n mov %4,%%esi\r\n mov %5,%%edi"\
    // ::"m"(func),"m"(a),"m"(b),"m"(c),"m"(d),"m"(e));
    // __asm__ volatile("int $0x80\r\n leave\r\n ret");
}
  8007db:	c9                   	leave  
  8007dc:	c3                   	ret    

00000000008007dd <wrmsr>:
void wrmsr(unsigned long address,unsigned long value)
{
  8007dd:	f3 0f 1e fa          	endbr64 
  8007e1:	55                   	push   rbp
  8007e2:	48 89 e5             	mov    rbp,rsp
  8007e5:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8007e9:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    __asm__ __volatile__	("wrmsr	\n\t"::"d"(value >> 32),"a"(value & 0xffffffff),"c"(address):"memory");
  8007ed:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8007f1:	48 c1 e8 20          	shr    rax,0x20
  8007f5:	48 89 c2             	mov    rdx,rax
  8007f8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8007fc:	89 c0                	mov    eax,eax
  8007fe:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  800802:	0f 30                	wrmsr  
  800804:	90                   	nop
  800805:	5d                   	pop    rbp
  800806:	c3                   	ret    

0000000000800807 <main>:
#include <kb.h>
#include "com.h"

int manage_proc_lock=1;
void main(unsigned int magic,void* addr)
{
  800807:	f3 0f 1e fa          	endbr64 
  80080b:	55                   	push   rbp
  80080c:	48 89 e5             	mov    rbp,rsp
  80080f:	48 83 ec 60          	sub    rsp,0x60
  800813:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  800816:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi

    struct multiboot_header* mbi=0ul;
  80081a:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  800821:	00 
    mbi=(struct multiboot_header*)addr;
  800822:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  800826:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    init_logging();
  80082a:	b8 00 00 00 00       	mov    eax,0x0
  80082f:	e8 36 03 00 00       	call   800b6a <init_logging>
    }
    //获取tags
    struct multiboot_tag *tag;

	unsigned size;
    size = *(unsigned long*)addr;
  800834:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  800838:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80083b:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
//    //printf("Announced mbi size 0x%x\n", size);
	for (tag = (struct multiboot_tag *)(addr + 8);
  80083e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  800842:	48 83 c0 08          	add    rax,0x8
  800846:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  80084a:	e9 5b 02 00 00       	jmp    800aaa <main+0x2a3>
		 tag->type != MULTIBOOT_TAG_TYPE_END;
		 tag = (struct multiboot_tag *)((u8 *)tag + ((tag->size + 7) & ~7)))
	{
		//printf("Tag 0x%x, Size 0x%x\n", tag->type, tag->size);
		switch (tag->type)
  80084f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800853:	8b 00                	mov    eax,DWORD PTR [rax]
  800855:	83 f8 08             	cmp    eax,0x8
  800858:	0f 87 39 02 00 00    	ja     800a97 <main+0x290>
  80085e:	89 c0                	mov    eax,eax
  800860:	48 8b 04 c5 08 29 81 	mov    rax,QWORD PTR [rax*8+0x812908]
  800867:	00 
  800868:	3e ff e0             	notrack jmp rax
			break;
		case MULTIBOOT_TAG_TYPE_BASIC_MEMINFO:
			//printf("mem_lower = %uKB, mem_upper = %uKB\n",
//				   ((struct multiboot_tag_basic_meminfo *)tag)->mem_lower,
//				   ((struct multiboot_tag_basic_meminfo *)tag)->mem_upper);
			set_high_mem_base(((struct multiboot_tag_basic_meminfo *)tag)->mem_lower);
  80086b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80086f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  800872:	89 c7                	mov    edi,eax
  800874:	e8 cf 07 00 00       	call   801048 <set_high_mem_base>
			break;
  800879:	e9 19 02 00 00       	jmp    800a97 <main+0x290>

			break;
		case MULTIBOOT_TAG_TYPE_MMAP:
		{
			//printf("mmap\n");
            for (multiboot_memory_map_t * mmap = ((struct multiboot_tag_mmap *)tag)->entries;
  80087e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800882:	48 83 c0 10          	add    rax,0x10
  800886:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  80088a:	eb 37                	jmp    8008c3 <main+0xbc>
                    (multiboot_uint8_t *)mmap < (multiboot_uint8_t *)tag + tag->size;
                    mmap = (multiboot_memory_map_t *)((unsigned long)mmap + ((struct multiboot_tag_mmap *)tag)->entry_size))
            {
                set_mem_area(mmap->addr,mmap->len,mmap->type);
  80088c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800890:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  800893:	89 c2                	mov    edx,eax
  800895:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800899:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  80089d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8008a1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8008a4:	48 89 ce             	mov    rsi,rcx
  8008a7:	48 89 c7             	mov    rdi,rax
  8008aa:	e8 b0 07 00 00       	call   80105f <set_mem_area>
                    mmap = (multiboot_memory_map_t *)((unsigned long)mmap + ((struct multiboot_tag_mmap *)tag)->entry_size))
  8008af:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008b3:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8008b6:	89 c2                	mov    edx,eax
  8008b8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8008bc:	48 01 d0             	add    rax,rdx
  8008bf:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
                    (multiboot_uint8_t *)mmap < (multiboot_uint8_t *)tag + tag->size;
  8008c3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008c7:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8008ca:	89 c2                	mov    edx,eax
  8008cc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008d0:	48 01 d0             	add    rax,rdx
  8008d3:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  8008d7:	72 b3                	jb     80088c <main+0x85>
            }

		}
		break;
  8008d9:	e9 b9 01 00 00       	jmp    800a97 <main+0x290>
		case MULTIBOOT_TAG_TYPE_FRAMEBUFFER:
		{
			multiboot_uint32_t color;
			unsigned i;
			struct multiboot_tag_framebuffer *tagfb = (struct multiboot_tag_framebuffer *)tag;
  8008de:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008e2:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
			void *fb = (void *) FRAMEBUFFER_ADDR;
  8008e6:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x40000000
  8008ed:	40 
			set_framebuffer(*tagfb);
  8008ee:	48 83 ec 08          	sub    rsp,0x8
  8008f2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8008f6:	ff 70 20             	push   QWORD PTR [rax+0x20]
  8008f9:	ff 70 18             	push   QWORD PTR [rax+0x18]
  8008fc:	ff 70 10             	push   QWORD PTR [rax+0x10]
  8008ff:	ff 70 08             	push   QWORD PTR [rax+0x8]
  800902:	ff 30                	push   QWORD PTR [rax]
  800904:	e8 a1 53 00 00       	call   805caa <set_framebuffer>
  800909:	48 83 c4 30          	add    rsp,0x30

            init_framebuffer();
  80090d:	b8 00 00 00 00       	mov    eax,0x0
  800912:	e8 fe 51 00 00       	call   805b15 <init_framebuffer>
			switch (tagfb->common.framebuffer_type)
  800917:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80091b:	0f b6 40 1d          	movzx  eax,BYTE PTR [rax+0x1d]
  80091f:	0f b6 c0             	movzx  eax,al
  800922:	83 f8 02             	cmp    eax,0x2
  800925:	0f 84 5a 01 00 00    	je     800a85 <main+0x27e>
  80092b:	83 f8 02             	cmp    eax,0x2
  80092e:	0f 8f 5a 01 00 00    	jg     800a8e <main+0x287>
  800934:	85 c0                	test   eax,eax
  800936:	74 0e                	je     800946 <main+0x13f>
  800938:	83 f8 01             	cmp    eax,0x1
  80093b:	0f 84 15 01 00 00    	je     800a56 <main+0x24f>
  800941:	e9 48 01 00 00       	jmp    800a8e <main+0x287>
			case MULTIBOOT_FRAMEBUFFER_TYPE_INDEXED:
			{
				unsigned best_distance, distance;
				struct multiboot_color *palette;

				palette = tagfb->framebuffer_palette;
  800946:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80094a:	48 83 c0 22          	add    rax,0x22
  80094e:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

				color = 0;
  800952:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
				best_distance = 4 * 256 * 256;
  800959:	c7 45 e8 00 00 04 00 	mov    DWORD PTR [rbp-0x18],0x40000

				for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
  800960:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  800967:	e9 d4 00 00 00       	jmp    800a40 <main+0x239>
				{
					distance = (0xff - palette[i].blue) * (0xff - palette[i].blue) + palette[i].red * palette[i].red + palette[i].green * palette[i].green;
  80096c:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80096f:	48 89 d0             	mov    rax,rdx
  800972:	48 01 c0             	add    rax,rax
  800975:	48 01 c2             	add    rdx,rax
  800978:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80097c:	48 01 d0             	add    rax,rdx
  80097f:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  800983:	0f b6 c0             	movzx  eax,al
  800986:	ba ff 00 00 00       	mov    edx,0xff
  80098b:	89 d1                	mov    ecx,edx
  80098d:	29 c1                	sub    ecx,eax
  80098f:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800992:	48 89 d0             	mov    rax,rdx
  800995:	48 01 c0             	add    rax,rax
  800998:	48 01 c2             	add    rdx,rax
  80099b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80099f:	48 01 d0             	add    rax,rdx
  8009a2:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  8009a6:	0f b6 d0             	movzx  edx,al
  8009a9:	b8 ff 00 00 00       	mov    eax,0xff
  8009ae:	29 d0                	sub    eax,edx
  8009b0:	89 ce                	mov    esi,ecx
  8009b2:	0f af f0             	imul   esi,eax
  8009b5:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009b8:	48 89 d0             	mov    rax,rdx
  8009bb:	48 01 c0             	add    rax,rax
  8009be:	48 01 c2             	add    rdx,rax
  8009c1:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009c5:	48 01 d0             	add    rax,rdx
  8009c8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8009cb:	0f b6 c8             	movzx  ecx,al
  8009ce:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009d1:	48 89 d0             	mov    rax,rdx
  8009d4:	48 01 c0             	add    rax,rax
  8009d7:	48 01 c2             	add    rdx,rax
  8009da:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009de:	48 01 d0             	add    rax,rdx
  8009e1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8009e4:	0f b6 c0             	movzx  eax,al
  8009e7:	0f af c1             	imul   eax,ecx
  8009ea:	01 c6                	add    esi,eax
  8009ec:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009ef:	48 89 d0             	mov    rax,rdx
  8009f2:	48 01 c0             	add    rax,rax
  8009f5:	48 01 c2             	add    rdx,rax
  8009f8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009fc:	48 01 d0             	add    rax,rdx
  8009ff:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  800a03:	0f b6 c8             	movzx  ecx,al
  800a06:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800a09:	48 89 d0             	mov    rax,rdx
  800a0c:	48 01 c0             	add    rax,rax
  800a0f:	48 01 c2             	add    rdx,rax
  800a12:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800a16:	48 01 d0             	add    rax,rdx
  800a19:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  800a1d:	0f b6 c0             	movzx  eax,al
  800a20:	0f af c1             	imul   eax,ecx
  800a23:	01 f0                	add    eax,esi
  800a25:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
					if (distance < best_distance)
  800a28:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  800a2b:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  800a2e:	73 0c                	jae    800a3c <main+0x235>
					{
						color = i;
  800a30:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800a33:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
						best_distance = distance;
  800a36:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  800a39:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
				for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
  800a3c:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  800a40:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800a44:	0f b7 40 20          	movzx  eax,WORD PTR [rax+0x20]
  800a48:	0f b7 c0             	movzx  eax,ax
  800a4b:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  800a4e:	0f 82 18 ff ff ff    	jb     80096c <main+0x165>
					}
				}
			}
			break;
  800a54:	eb 40                	jmp    800a96 <main+0x28f>

			case MULTIBOOT_FRAMEBUFFER_TYPE_RGB:
				color = ((1 << tagfb->framebuffer_blue_mask_size) - 1) << tagfb->framebuffer_blue_field_position;
  800a56:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800a5a:	0f b6 40 25          	movzx  eax,BYTE PTR [rax+0x25]
  800a5e:	0f b6 c0             	movzx  eax,al
  800a61:	ba 01 00 00 00       	mov    edx,0x1
  800a66:	89 c1                	mov    ecx,eax
  800a68:	d3 e2                	shl    edx,cl
  800a6a:	89 d0                	mov    eax,edx
  800a6c:	8d 50 ff             	lea    edx,[rax-0x1]
  800a6f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800a73:	0f b6 40 24          	movzx  eax,BYTE PTR [rax+0x24]
  800a77:	0f b6 c0             	movzx  eax,al
  800a7a:	89 c1                	mov    ecx,eax
  800a7c:	d3 e2                	shl    edx,cl
  800a7e:	89 d0                	mov    eax,edx
  800a80:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
				break;
  800a83:	eb 11                	jmp    800a96 <main+0x28f>

			case MULTIBOOT_FRAMEBUFFER_TYPE_EGA_TEXT:
				color = '\\' | 0x0100;
  800a85:	c7 45 c4 5c 01 00 00 	mov    DWORD PTR [rbp-0x3c],0x15c
				break;
  800a8c:	eb 08                	jmp    800a96 <main+0x28f>

			default:
				color = 0xffffffff;
  800a8e:	c7 45 c4 ff ff ff ff 	mov    DWORD PTR [rbp-0x3c],0xffffffff
				break;
  800a95:	90                   	nop
			}

			break;
  800a96:	90                   	nop
		 tag = (struct multiboot_tag *)((u8 *)tag + ((tag->size + 7) & ~7)))
  800a97:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800a9b:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800a9e:	83 c0 07             	add    eax,0x7
  800aa1:	89 c0                	mov    eax,eax
  800aa3:	83 e0 f8             	and    eax,0xfffffff8
  800aa6:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
		 tag->type != MULTIBOOT_TAG_TYPE_END;
  800aaa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800aae:	8b 00                	mov    eax,DWORD PTR [rax]
  800ab0:	85 c0                	test   eax,eax
  800ab2:	0f 85 97 fd ff ff    	jne    80084f <main+0x48>
		}
		}
	}
	tag = (struct multiboot_tag *)((multiboot_uint8_t *)tag + ((tag->size + 7) & ~7));
  800ab8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800abc:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800abf:	83 c0 07             	add    eax,0x7
  800ac2:	89 c0                	mov    eax,eax
  800ac4:	83 e0 f8             	and    eax,0xfffffff8
  800ac7:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
	//printf("Total mbi size 0x%x\n", (unsigned)tag - addr);
	char disk_count=*(char*)0x475;
  800acb:	b8 75 04 00 00       	mov    eax,0x475
  800ad0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800ad3:	88 45 db             	mov    BYTE PTR [rbp-0x25],al
	//printf("disk count:%d\n",disk_count);
    init_font();
  800ad6:	b8 00 00 00 00       	mov    eax,0x0
  800adb:	e8 f4 50 00 00       	call   805bd4 <init_font>
    //初始化区域
    //fill_rect(0,0,100,100,255);
    print("gamessis os loaded.\nkernel:>");
  800ae0:	bf c8 28 81 00       	mov    edi,0x8128c8
  800ae5:	e8 83 55 00 00       	call   80606d <print>
    init_int();
  800aea:	b8 00 00 00 00       	mov    eax,0x0
  800aef:	e8 0c f5 ff ff       	call   800000 <init_int>
    print("int loaded.\n");
  800af4:	bf e5 28 81 00       	mov    edi,0x8128e5
  800af9:	e8 6f 55 00 00       	call   80606d <print>
//    set_tss(0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000);
    init_memory();
  800afe:	b8 00 00 00 00       	mov    eax,0x0
  800b03:	e8 0e 08 00 00       	call   801316 <init_memory>
    init_com(PORT_COM1);
  800b08:	bf f8 03 00 00       	mov    edi,0x3f8
  800b0d:	e8 02 98 00 00       	call   80a314 <init_com>
    com_puts("gamessis os loaded.",PORT_COM1);
  800b12:	be f8 03 00 00       	mov    esi,0x3f8
  800b17:	bf f2 28 81 00       	mov    edi,0x8128f2
  800b1c:	e8 3f 99 00 00       	call   80a460 <com_puts>
	init_paging();
  800b21:	b8 00 00 00 00       	mov    eax,0x0
  800b26:	e8 12 05 00 00       	call   80103d <init_paging>
 	init_gdt();
  800b2b:	b8 00 00 00 00       	mov    eax,0x0
  800b30:	e8 78 43 00 00       	call   804ead <init_gdt>
    init_drvdev_man();
  800b35:	b8 00 00 00 00       	mov    eax,0x0
  800b3a:	e8 fb 1e 00 00       	call   802a3a <init_drvdev_man>
    init_proc();
  800b3f:	b8 00 00 00 00       	mov    eax,0x0
  800b44:	e8 dc 2d 00 00       	call   803925 <init_proc>
    //自带驱动
    //init_tty();
    init_kb();
  800b49:	b8 00 00 00 00       	mov    eax,0x0
  800b4e:	e8 4c 5b 00 00       	call   80669f <init_kb>
//    init_disk();

    sti();
  800b53:	fb                   	sti    
    DISK1_FAT32_FS_init();
  800b54:	b8 00 00 00 00       	mov    eax,0x0
  800b59:	e8 1c 8e 00 00       	call   80997a <DISK1_FAT32_FS_init>
    manage_proc_lock=0;
  800b5e:	c7 05 00 a3 00 00 00 	mov    DWORD PTR [rip+0xa300],0x0        # 80ae68 <manage_proc_lock>
  800b65:	00 00 00 

//    extern device *dev_tree[];
//    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
//    mount_fs("fat16",p->par,vmalloc());

    while (1);
  800b68:	eb fe                	jmp    800b68 <main+0x361>

0000000000800b6a <init_logging>:
static unsigned char* video;
static int xpos,ypos;
/* 将整数 D 转换为字符串并保存在 BUF 中。如果 BASE 为 'd'，则 D 为十进制，如果 BASE 为 'x'，则 D 为十六进制。 */

int init_logging()
{
  800b6a:	f3 0f 1e fa          	endbr64 
  800b6e:	55                   	push   rbp
  800b6f:	48 89 e5             	mov    rbp,rsp
    video=0xb8000;
  800b72:	48 c7 05 83 f4 bf ff 	mov    QWORD PTR [rip+0xffffffffffbff483],0xb8000        # 400000 <video>
  800b79:	00 80 0b 00 
    xpos=0;
  800b7d:	c7 05 81 f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff481],0x0        # 400008 <xpos>
  800b84:	00 00 00 
    ypos=0;
  800b87:	c7 05 7b f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff47b],0x0        # 40000c <ypos>
  800b8e:	00 00 00 
}
  800b91:	90                   	nop
  800b92:	5d                   	pop    rbp
  800b93:	c3                   	ret    

0000000000800b94 <itoa>:

static void itoa (char *buf, int base, int d)
{
  800b94:	f3 0f 1e fa          	endbr64 
  800b98:	55                   	push   rbp
  800b99:	48 89 e5             	mov    rbp,rsp
  800b9c:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  800ba0:	89 75 c4             	mov    DWORD PTR [rbp-0x3c],esi
  800ba3:	89 55 c0             	mov    DWORD PTR [rbp-0x40],edx
    char *p = buf;
  800ba6:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800baa:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char *p1, *p2;
    unsigned long ud = d;
  800bae:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800bb1:	48 98                	cdqe   
  800bb3:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    int divisor = 10;
  800bb7:	c7 45 dc 0a 00 00 00 	mov    DWORD PTR [rbp-0x24],0xa
 
    /* 如果指定了 %d 并且 D 是负数，在开始添上负号。 */
    if (base == 'd' && d < 0)
  800bbe:	83 7d c4 64          	cmp    DWORD PTR [rbp-0x3c],0x64
  800bc2:	75 27                	jne    800beb <itoa+0x57>
  800bc4:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
  800bc8:	79 21                	jns    800beb <itoa+0x57>
    {
        *p++ = '-';
  800bca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800bce:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800bd2:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800bd6:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
        buf++;
  800bd9:	48 83 45 c8 01       	add    QWORD PTR [rbp-0x38],0x1
        ud = -d;
  800bde:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800be1:	f7 d8                	neg    eax
  800be3:	48 98                	cdqe   
  800be5:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800be9:	eb 0d                	jmp    800bf8 <itoa+0x64>
    }
    else if (base == 'x')
  800beb:	83 7d c4 78          	cmp    DWORD PTR [rbp-0x3c],0x78
  800bef:	75 07                	jne    800bf8 <itoa+0x64>
        divisor = 16;
  800bf1:	c7 45 dc 10 00 00 00 	mov    DWORD PTR [rbp-0x24],0x10
 
    /* 用 DIVISOR 去除 UD 直到 UD == 0。 */
    do
    {
        int remainder = ud % divisor;
  800bf8:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800bfb:	48 63 c8             	movsxd rcx,eax
  800bfe:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800c02:	ba 00 00 00 00       	mov    edx,0x0
  800c07:	48 f7 f1             	div    rcx
  800c0a:	48 89 d0             	mov    rax,rdx
  800c0d:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
 
        *p++ = (remainder < 10) ? remainder + '0' : remainder + 'a' - 10;
  800c10:	83 7d d8 09          	cmp    DWORD PTR [rbp-0x28],0x9
  800c14:	7f 0a                	jg     800c20 <itoa+0x8c>
  800c16:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800c19:	83 c0 30             	add    eax,0x30
  800c1c:	89 c1                	mov    ecx,eax
  800c1e:	eb 08                	jmp    800c28 <itoa+0x94>
  800c20:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800c23:	83 c0 57             	add    eax,0x57
  800c26:	89 c1                	mov    ecx,eax
  800c28:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c2c:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800c30:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800c34:	88 08                	mov    BYTE PTR [rax],cl
    }
    while (ud /= divisor);
  800c36:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800c39:	48 63 f0             	movsxd rsi,eax
  800c3c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800c40:	ba 00 00 00 00       	mov    edx,0x0
  800c45:	48 f7 f6             	div    rsi
  800c48:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800c4c:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  800c51:	75 a5                	jne    800bf8 <itoa+0x64>
 
    /* 在字符串尾添上终结符。 */
    *p = 0;
  800c53:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c57:	c6 00 00             	mov    BYTE PTR [rax],0x0
 
    /* 反转 BUF。 */
    p1 = buf;
  800c5a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800c5e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    p2 = p - 1;
  800c62:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c66:	48 83 e8 01          	sub    rax,0x1
  800c6a:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    while (p1 < p2)
  800c6e:	eb 2b                	jmp    800c9b <itoa+0x107>
    {
        char tmp = *p1;
  800c70:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800c74:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800c77:	88 45 d7             	mov    BYTE PTR [rbp-0x29],al
        *p1 = *p2;
  800c7a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800c7e:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  800c81:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800c85:	88 10                	mov    BYTE PTR [rax],dl
        *p2 = tmp;
  800c87:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800c8b:	0f b6 55 d7          	movzx  edx,BYTE PTR [rbp-0x29]
  800c8f:	88 10                	mov    BYTE PTR [rax],dl
        p1++;
  800c91:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        p2--;
  800c96:	48 83 6d e8 01       	sub    QWORD PTR [rbp-0x18],0x1
    while (p1 < p2)
  800c9b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800c9f:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
  800ca3:	72 cb                	jb     800c70 <itoa+0xdc>
    }
}
  800ca5:	90                   	nop
  800ca6:	90                   	nop
  800ca7:	5d                   	pop    rbp
  800ca8:	c3                   	ret    

0000000000800ca9 <putchar>:
 
/* 在屏幕上输出字符 C 。 */
static void putchar (char c)
{
  800ca9:	f3 0f 1e fa          	endbr64 
  800cad:	55                   	push   rbp
  800cae:	48 89 e5             	mov    rbp,rsp
  800cb1:	48 83 ec 20          	sub    rsp,0x20
  800cb5:	89 f8                	mov    eax,edi
  800cb7:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    char s[2]={c,'\0'};
  800cba:	0f b6 45 ec          	movzx  eax,BYTE PTR [rbp-0x14]
  800cbe:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
  800cc1:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
    print(s);
  800cc5:	48 8d 45 fe          	lea    rax,[rbp-0x2]
  800cc9:	48 89 c7             	mov    rdi,rax
  800ccc:	e8 9c 53 00 00       	call   80606d <print>
    *(video + (xpos + ypos * COLUMNS) * 2 + 1) = ATTRIBUTE;
 
    xpos++;
    if (xpos >= COLUMNS)
        goto newline;
}
  800cd1:	c9                   	leave  
  800cd2:	c3                   	ret    

0000000000800cd3 <printf>:
 
/* 格式化字符串并在屏幕上输出，就像 libc 函数 printf 一样。 */
void printf (const char *format, ...)
{
  800cd3:	f3 0f 1e fa          	endbr64 
  800cd7:	55                   	push   rbp
  800cd8:	48 89 e5             	mov    rbp,rsp
  800cdb:	48 81 ec f0 00 00 00 	sub    rsp,0xf0
  800ce2:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
  800ce9:	48 89 b5 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rsi
  800cf0:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  800cf7:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  800cfe:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  800d05:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  800d0c:	84 c0                	test   al,al
  800d0e:	74 20                	je     800d30 <printf+0x5d>
  800d10:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  800d14:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  800d18:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  800d1c:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  800d20:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  800d24:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  800d28:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  800d2c:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7
    char **arg = (char **) &format;
  800d30:	48 8d 85 18 ff ff ff 	lea    rax,[rbp-0xe8]
  800d37:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char c;
    char buf[20];
 
    arg++;
  800d3e:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x8
  800d45:	08 
 
    while ((c = *format++) != 0)
  800d46:	e9 29 01 00 00       	jmp    800e74 <printf+0x1a1>
    {
        if (c != '%')
  800d4b:	80 bd 3f ff ff ff 25 	cmp    BYTE PTR [rbp-0xc1],0x25
  800d52:	74 13                	je     800d67 <printf+0x94>
            putchar (c);
  800d54:	0f be 85 3f ff ff ff 	movsx  eax,BYTE PTR [rbp-0xc1]
  800d5b:	89 c7                	mov    edi,eax
  800d5d:	e8 47 ff ff ff       	call   800ca9 <putchar>
  800d62:	e9 0d 01 00 00       	jmp    800e74 <printf+0x1a1>
        else
        {
            char *p;
 
            c = *format++;
  800d67:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800d6e:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800d72:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800d79:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800d7c:	88 85 3f ff ff ff    	mov    BYTE PTR [rbp-0xc1],al
            switch (c)
  800d82:	0f be 85 3f ff ff ff 	movsx  eax,BYTE PTR [rbp-0xc1]
  800d89:	83 f8 78             	cmp    eax,0x78
  800d8c:	74 26                	je     800db4 <printf+0xe1>
  800d8e:	83 f8 78             	cmp    eax,0x78
  800d91:	0f 8f be 00 00 00    	jg     800e55 <printf+0x182>
  800d97:	83 f8 75             	cmp    eax,0x75
  800d9a:	74 18                	je     800db4 <printf+0xe1>
  800d9c:	83 f8 75             	cmp    eax,0x75
  800d9f:	0f 8f b0 00 00 00    	jg     800e55 <printf+0x182>
  800da5:	83 f8 64             	cmp    eax,0x64
  800da8:	74 0a                	je     800db4 <printf+0xe1>
  800daa:	83 f8 73             	cmp    eax,0x73
  800dad:	74 41                	je     800df0 <printf+0x11d>
  800daf:	e9 a1 00 00 00       	jmp    800e55 <printf+0x182>
            {
            case 'd':
            case 'u':
            case 'x':
                itoa (buf, c, *((int *) arg++));
  800db4:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800dbb:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800dbf:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800dc6:	8b 10                	mov    edx,DWORD PTR [rax]
  800dc8:	0f be 8d 3f ff ff ff 	movsx  ecx,BYTE PTR [rbp-0xc1]
  800dcf:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800dd6:	89 ce                	mov    esi,ecx
  800dd8:	48 89 c7             	mov    rdi,rax
  800ddb:	e8 b4 fd ff ff       	call   800b94 <itoa>
                p = buf;
  800de0:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800de7:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                goto string;
  800dee:	eb 34                	jmp    800e24 <printf+0x151>
                break;
 
            case 's':
                p = *arg++;
  800df0:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800df7:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800dfb:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800e02:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800e05:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                if (! p)
  800e0c:	48 83 bd 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],0x0
  800e13:	00 
  800e14:	75 0d                	jne    800e23 <printf+0x150>
                    p = "(null)";
  800e16:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x812950
  800e1d:	50 29 81 00 
  800e21:	eb 22                	jmp    800e45 <printf+0x172>
 
string:
  800e23:	90                   	nop
                while (*p)
  800e24:	eb 1f                	jmp    800e45 <printf+0x172>
                    putchar (*p++);
  800e26:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800e2d:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800e31:	48 89 95 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rdx
  800e38:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800e3b:	0f be c0             	movsx  eax,al
  800e3e:	89 c7                	mov    edi,eax
  800e40:	e8 64 fe ff ff       	call   800ca9 <putchar>
                while (*p)
  800e45:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800e4c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800e4f:	84 c0                	test   al,al
  800e51:	75 d3                	jne    800e26 <printf+0x153>
                break;
  800e53:	eb 1f                	jmp    800e74 <printf+0x1a1>
 
            default:
                putchar (*((int *) arg++));
  800e55:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e5c:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800e60:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800e67:	8b 00                	mov    eax,DWORD PTR [rax]
  800e69:	0f be c0             	movsx  eax,al
  800e6c:	89 c7                	mov    edi,eax
  800e6e:	e8 36 fe ff ff       	call   800ca9 <putchar>
                break;
  800e73:	90                   	nop
    while ((c = *format++) != 0)
  800e74:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800e7b:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800e7f:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800e86:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800e89:	88 85 3f ff ff ff    	mov    BYTE PTR [rbp-0xc1],al
  800e8f:	80 bd 3f ff ff ff 00 	cmp    BYTE PTR [rbp-0xc1],0x0
  800e96:	0f 85 af fe ff ff    	jne    800d4b <printf+0x78>
            }
        }
    }
}
  800e9c:	90                   	nop
  800e9d:	90                   	nop
  800e9e:	c9                   	leave  
  800e9f:	c3                   	ret    

0000000000800ea0 <mmap>:
//以kb为单位
int high_mem_base=1024;
int mmap_t_i=0;

stat_t mmap(addr_t pa,addr_t la,u32 attr)
{
  800ea0:	f3 0f 1e fa          	endbr64 
  800ea4:	55                   	push   rbp
  800ea5:	48 89 e5             	mov    rbp,rsp
  800ea8:	48 83 ec 40          	sub    rsp,0x40
  800eac:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  800eb0:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  800eb4:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    page_item *pdptp= (page_item *) (pml4[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
  800eb7:	48 8b 15 c2 9f 00 00 	mov    rdx,QWORD PTR [rip+0x9fc2]        # 80ae80 <pml4>
  800ebe:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800ec2:	48 c1 e8 27          	shr    rax,0x27
  800ec6:	48 c1 e0 03          	shl    rax,0x3
  800eca:	48 01 d0             	add    rax,rdx
  800ecd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800ed0:	b0 00                	mov    al,0x0
  800ed2:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
  800ed6:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  800edd:	00 00 00 
  800ee0:	48 23 45 d0          	and    rax,QWORD PTR [rbp-0x30]
  800ee4:	48 c1 e8 1e          	shr    rax,0x1e
  800ee8:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
  800eeb:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800eee:	48 98                	cdqe   
  800ef0:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800ef7:	00 
  800ef8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800efc:	48 01 d0             	add    rax,rdx
  800eff:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f02:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
  800f06:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f0a:	83 e0 01             	and    eax,0x1
  800f0d:	48 85 c0             	test   rax,rax
  800f10:	75 45                	jne    800f57 <mmap+0xb7>
    {
        pdp=(page_item*)vmalloc();
  800f12:	b8 00 00 00 00       	mov    eax,0x0
  800f17:	e8 cf 01 00 00       	call   8010eb <vmalloc>
  800f1c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        memset(pdp,0,4096);
  800f20:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f24:	ba 00 10 00 00       	mov    edx,0x1000
  800f29:	be 00 00 00 00       	mov    esi,0x0
  800f2e:	48 89 c7             	mov    rdi,rax
  800f31:	e8 1a 96 00 00       	call   80a550 <memset>
        pdptp[pdpti]=(addr_t)pdp|attr;
  800f36:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800f39:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  800f3d:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800f40:	48 98                	cdqe   
  800f42:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800f49:	00 
  800f4a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800f4e:	48 01 f0             	add    rax,rsi
  800f51:	48 09 ca             	or     rdx,rcx
  800f54:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pdp=(page_item*)((addr_t)pdp&~0xff);
  800f57:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f5b:	b0 00                	mov    al,0x0
  800f5d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
  800f61:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800f65:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800f6a:	48 c1 e8 15          	shr    rax,0x15
  800f6e:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800f75:	00 
  800f76:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f7a:	48 01 d0             	add    rax,rdx
  800f7d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f80:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!((unsigned long long)pt & PAGE_PRESENT))
  800f84:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800f88:	83 e0 01             	and    eax,0x1
  800f8b:	48 85 c0             	test   rax,rax
  800f8e:	75 4d                	jne    800fdd <mmap+0x13d>
    {
        pt=(page_item*)vmalloc();
  800f90:	b8 00 00 00 00       	mov    eax,0x0
  800f95:	e8 51 01 00 00       	call   8010eb <vmalloc>
  800f9a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        memset(pt,0,4096);
  800f9e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800fa2:	ba 00 10 00 00       	mov    edx,0x1000
  800fa7:	be 00 00 00 00       	mov    esi,0x0
  800fac:	48 89 c7             	mov    rdi,rax
  800faf:	e8 9c 95 00 00       	call   80a550 <memset>
        pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
  800fb4:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800fb7:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800fbb:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800fbf:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800fc4:	48 c1 e8 15          	shr    rax,0x15
  800fc8:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800fcf:	00 
  800fd0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800fd4:	48 01 f0             	add    rax,rsi
  800fd7:	48 09 ca             	or     rdx,rcx
  800fda:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pt=(page_item*)((addr_t)pt & ~0xff);
  800fdd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800fe1:	b0 00                	mov    al,0x0
  800fe3:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
  800fe7:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  800fea:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  800fee:	81 e2 ff ff 1f 00    	and    edx,0x1fffff
  800ff4:	48 c1 ea 0c          	shr    rdx,0xc
  800ff8:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
  800fff:	00 
  801000:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  801004:	48 01 ca             	add    rdx,rcx
  801007:	48 0b 45 d8          	or     rax,QWORD PTR [rbp-0x28]
  80100b:	48 89 02             	mov    QWORD PTR [rdx],rax
    return NORMAL;
  80100e:	b8 00 00 00 00       	mov    eax,0x0
}
  801013:	c9                   	leave  
  801014:	c3                   	ret    

0000000000801015 <mdemap>:

stat_t mdemap(addr_t la)
{
  801015:	f3 0f 1e fa          	endbr64 
  801019:	55                   	push   rbp
  80101a:	48 89 e5             	mov    rbp,rsp
  80101d:	48 83 ec 10          	sub    rsp,0x10
  801021:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return mmap(0l,la,0);
  801025:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801029:	ba 00 00 00 00       	mov    edx,0x0
  80102e:	48 89 c6             	mov    rsi,rax
  801031:	bf 00 00 00 00       	mov    edi,0x0
  801036:	e8 65 fe ff ff       	call   800ea0 <mmap>
}
  80103b:	c9                   	leave  
  80103c:	c3                   	ret    

000000000080103d <init_paging>:
int init_paging()
{
  80103d:	f3 0f 1e fa          	endbr64 
  801041:	55                   	push   rbp
  801042:	48 89 e5             	mov    rbp,rsp
    //设置第一项pdpte，也就是内核空间
//    set_1gb_pdpt(pdpt,0,PAGE_RWX);//设置PDPT0x40000000ul
//    set_page_item(pdpt+1,PD_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);

    #endif
}
  801045:	90                   	nop
  801046:	5d                   	pop    rbp
  801047:	c3                   	ret    

0000000000801048 <set_high_mem_base>:
void set_high_mem_base(int base)
{
  801048:	f3 0f 1e fa          	endbr64 
  80104c:	55                   	push   rbp
  80104d:	48 89 e5             	mov    rbp,rsp
  801050:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    high_mem_base=base;
  801053:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801056:	89 05 3c 9e 00 00    	mov    DWORD PTR [rip+0x9e3c],eax        # 80ae98 <high_mem_base>
}
  80105c:	90                   	nop
  80105d:	5d                   	pop    rbp
  80105e:	c3                   	ret    

000000000080105f <set_mem_area>:
void set_mem_area(unsigned long base, unsigned long len, unsigned long type)
{
  80105f:	f3 0f 1e fa          	endbr64 
  801063:	55                   	push   rbp
  801064:	48 89 e5             	mov    rbp,rsp
  801067:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80106b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80106f:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
    mmap_struct[mmap_t_i].base=base;
  801073:	8b 05 a7 f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff1a7]        # 400220 <mmap_t_i>
  801079:	48 63 d0             	movsxd rdx,eax
  80107c:	48 89 d0             	mov    rax,rdx
  80107f:	48 01 c0             	add    rax,rax
  801082:	48 01 d0             	add    rax,rdx
  801085:	48 c1 e0 03          	shl    rax,0x3
  801089:	48 8d 90 40 00 40 00 	lea    rdx,[rax+0x400040]
  801090:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801094:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i].len=len;
  801097:	8b 05 83 f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff183]        # 400220 <mmap_t_i>
  80109d:	48 63 d0             	movsxd rdx,eax
  8010a0:	48 89 d0             	mov    rax,rdx
  8010a3:	48 01 c0             	add    rax,rax
  8010a6:	48 01 d0             	add    rax,rdx
  8010a9:	48 c1 e0 03          	shl    rax,0x3
  8010ad:	48 8d 90 48 00 40 00 	lea    rdx,[rax+0x400048]
  8010b4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8010b8:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i++].type=type;
  8010bb:	8b 05 5f f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff15f]        # 400220 <mmap_t_i>
  8010c1:	8d 50 01             	lea    edx,[rax+0x1]
  8010c4:	89 15 56 f1 bf ff    	mov    DWORD PTR [rip+0xffffffffffbff156],edx        # 400220 <mmap_t_i>
  8010ca:	48 63 d0             	movsxd rdx,eax
  8010cd:	48 89 d0             	mov    rax,rdx
  8010d0:	48 01 c0             	add    rax,rax
  8010d3:	48 01 d0             	add    rax,rdx
  8010d6:	48 c1 e0 03          	shl    rax,0x3
  8010da:	48 8d 90 50 00 40 00 	lea    rdx,[rax+0x400050]
  8010e1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8010e5:	48 89 02             	mov    QWORD PTR [rdx],rax
}
  8010e8:	90                   	nop
  8010e9:	5d                   	pop    rbp
  8010ea:	c3                   	ret    

00000000008010eb <vmalloc>:
addr_t vmalloc()
{
  8010eb:	f3 0f 1e fa          	endbr64 
  8010ef:	55                   	push   rbp
  8010f0:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<VMALLOC_PGN/32;i++)
  8010f3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8010fa:	eb 76                	jmp    801172 <vmalloc+0x87>
    {
        for(int j=0;j<32;j++)
  8010fc:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801103:	eb 63                	jmp    801168 <vmalloc+0x7d>
        {
            if(!(vmalloc_map[i]&(1<<j)))
  801105:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801108:	48 98                	cdqe   
  80110a:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  801111:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801114:	be 01 00 00 00       	mov    esi,0x1
  801119:	89 c1                	mov    ecx,eax
  80111b:	d3 e6                	shl    esi,cl
  80111d:	89 f0                	mov    eax,esi
  80111f:	21 d0                	and    eax,edx
  801121:	85 c0                	test   eax,eax
  801123:	75 3f                	jne    801164 <vmalloc+0x79>
            {
                vmalloc_map[i]|=(1<<j);
  801125:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801128:	48 98                	cdqe   
  80112a:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  801131:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801134:	be 01 00 00 00       	mov    esi,0x1
  801139:	89 c1                	mov    ecx,eax
  80113b:	d3 e6                	shl    esi,cl
  80113d:	89 f0                	mov    eax,esi
  80113f:	09 c2                	or     edx,eax
  801141:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801144:	48 98                	cdqe   
  801146:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
                return VMALLOC_BASE+(i*32+j)*0x1000;
  80114d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801150:	c1 e0 05             	shl    eax,0x5
  801153:	89 c2                	mov    edx,eax
  801155:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801158:	01 d0                	add    eax,edx
  80115a:	83 c0 20             	add    eax,0x20
  80115d:	c1 e0 0c             	shl    eax,0xc
  801160:	48 98                	cdqe   
  801162:	eb 14                	jmp    801178 <vmalloc+0x8d>
        for(int j=0;j<32;j++)
  801164:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801168:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  80116c:	7e 97                	jle    801105 <vmalloc+0x1a>
    for(int i=0;i<VMALLOC_PGN/32;i++)
  80116e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801172:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  801176:	7e 84                	jle    8010fc <vmalloc+0x11>
            }
        }
    }
}
  801178:	5d                   	pop    rbp
  801179:	c3                   	ret    

000000000080117a <vmfree>:

int vmfree(addr_t ptr)
{
  80117a:	f3 0f 1e fa          	endbr64 
  80117e:	55                   	push   rbp
  80117f:	48 89 e5             	mov    rbp,rsp
  801182:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=ptr/PAGE_SIZE;
  801186:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80118a:	48 c1 e8 0c          	shr    rax,0xc
  80118e:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  801191:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801194:	8d 50 1f             	lea    edx,[rax+0x1f]
  801197:	85 c0                	test   eax,eax
  801199:	0f 48 c2             	cmovs  eax,edx
  80119c:	c1 f8 05             	sar    eax,0x5
  80119f:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  8011a2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8011a5:	99                   	cdq    
  8011a6:	c1 ea 1b             	shr    edx,0x1b
  8011a9:	01 d0                	add    eax,edx
  8011ab:	83 e0 1f             	and    eax,0x1f
  8011ae:	29 d0                	sub    eax,edx
  8011b0:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    vmalloc_map[n]=vmalloc_map[n]&~(unsigned int)(1<<r);
  8011b3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8011b6:	48 98                	cdqe   
  8011b8:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  8011bf:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8011c2:	be 01 00 00 00       	mov    esi,0x1
  8011c7:	89 c1                	mov    ecx,eax
  8011c9:	d3 e6                	shl    esi,cl
  8011cb:	89 f0                	mov    eax,esi
  8011cd:	f7 d0                	not    eax
  8011cf:	21 c2                	and    edx,eax
  8011d1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8011d4:	48 98                	cdqe   
  8011d6:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
}
  8011dd:	90                   	nop
  8011de:	5d                   	pop    rbp
  8011df:	c3                   	ret    

00000000008011e0 <page_err>:
void page_err(){
  8011e0:	f3 0f 1e fa          	endbr64 
  8011e4:	55                   	push   rbp
  8011e5:	48 89 e5             	mov    rbp,rsp
  8011e8:	53                   	push   rbx
  8011e9:	48 83 ec 28          	sub    rsp,0x28
    asm("cli");
  8011ed:	fa                   	cli    
    print("page err\n");
  8011ee:	bf 58 29 81 00       	mov    edi,0x812958
  8011f3:	e8 75 4e 00 00       	call   80606d <print>
    unsigned long err_code=0,l_addr=0;
  8011f8:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  8011ff:	00 
  801200:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  801207:	00 
    asm volatile("mov 0(%%rbp),%0":"=r"(err_code));
  801208:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
  80120c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    asm volatile("mov %%cr2,%0":"=r"(l_addr));//试图访问的地址
  801210:	0f 20 d0             	mov    rax,cr2
  801213:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    int p=err_code&1;
  801217:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80121b:	83 e0 01             	and    eax,0x1
  80121e:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

    if(!p)
  801221:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801225:	75 27                	jne    80124e <page_err+0x6e>
        //accessing non-existent page
        //检查地址合法性
        if(l_addr>=MEM_END)
            ;
        //在进程的页表中申请新页
        mmap(vmalloc(),l_addr&~0xfff,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  801227:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80122b:	48 25 00 f0 ff ff    	and    rax,0xfffffffffffff000
  801231:	48 89 c3             	mov    rbx,rax
  801234:	b8 00 00 00 00       	mov    eax,0x0
  801239:	e8 ad fe ff ff       	call   8010eb <vmalloc>
  80123e:	ba 07 00 00 00       	mov    edx,0x7
  801243:	48 89 de             	mov    rsi,rbx
  801246:	48 89 c7             	mov    rdi,rax
  801249:	e8 52 fc ff ff       	call   800ea0 <mmap>
    }
    else
    {
        //page level protection
    }
    p=err_code&2;
  80124e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801252:	83 e0 02             	and    eax,0x2
  801255:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("when writing\n");else //puts("when reading");
  801258:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80125c:	74 0c                	je     80126a <page_err+0x8a>
  80125e:	bf 62 29 81 00       	mov    edi,0x812962
  801263:	e8 05 4e 00 00       	call   80606d <print>
  801268:	eb 0a                	jmp    801274 <page_err+0x94>
    p=err_code&4;
  80126a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80126e:	83 e0 04             	and    eax,0x4
  801271:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(!p)print("supervisor mode\n");else //puts("user mode");
  801274:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801278:	75 0c                	jne    801286 <page_err+0xa6>
  80127a:	bf 70 29 81 00       	mov    edi,0x812970
  80127f:	e8 e9 4d 00 00       	call   80606d <print>
  801284:	eb 0a                	jmp    801290 <page_err+0xb0>
    p=err_code&16;
  801286:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80128a:	83 e0 10             	and    eax,0x10
  80128d:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("an instruction tries to fetch\n");
  801290:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801294:	74 0a                	je     8012a0 <page_err+0xc0>
  801296:	bf 88 29 81 00       	mov    edi,0x812988
  80129b:	e8 cd 4d 00 00       	call   80606d <print>
    unsigned int addr=0;
  8012a0:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
    asm volatile("mov 8(%%ebp),%0":"=r"(addr));
  8012a7:	67 8b 45 08          	mov    eax,DWORD PTR [ebp+0x8]
  8012ab:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    printf("occurred at %x(paddr), %x(laddr)\n",addr,l_addr);
  8012ae:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8012b2:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8012b5:	89 c6                	mov    esi,eax
  8012b7:	bf a8 29 81 00       	mov    edi,0x8129a8
  8012bc:	b8 00 00 00 00       	mov    eax,0x0
  8012c1:	e8 0d fa ff ff       	call   800cd3 <printf>
    extern int cur_proc;
    extern struct process *task;
    if(task[cur_proc].pid==1)//系统进程
  8012c6:	48 8b 0d d3 71 c0 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc071d3]        # 4084a0 <task>
  8012cd:	8b 05 39 32 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc13239]        # 41450c <cur_proc>
  8012d3:	48 63 d0             	movsxd rdx,eax
  8012d6:	48 89 d0             	mov    rax,rdx
  8012d9:	48 01 c0             	add    rax,rax
  8012dc:	48 01 d0             	add    rax,rdx
  8012df:	48 c1 e0 08          	shl    rax,0x8
  8012e3:	48 01 c8             	add    rax,rcx
  8012e6:	8b 00                	mov    eax,DWORD PTR [rax]
  8012e8:	83 f8 01             	cmp    eax,0x1
  8012eb:	75 11                	jne    8012fe <page_err+0x11e>
    {
        printf("sys died. please reboot.\n");
  8012ed:	bf ca 29 81 00       	mov    edi,0x8129ca
  8012f2:	b8 00 00 00 00       	mov    eax,0x0
  8012f7:	e8 d7 f9 ff ff       	call   800cd3 <printf>
        asm volatile("jmp .");
  8012fc:	eb fe                	jmp    8012fc <page_err+0x11c>
    }
    //杀死问题进程
//    del_proc(cur_proc);
    // printf("killed the problem process.\n");
    // printf("shell:>");
    eoi();
  8012fe:	b8 00 00 00 00       	mov    eax,0x0
  801303:	e8 56 3b 00 00       	call   804e5e <eoi>
    //这里对esp的加法是必要的，因为page fault多push了一个错误码，但是iret识别不了
    __asm__ volatile ("sti \r\n  leave\n add $8,%esp \n iretq");
  801308:	fb                   	sti    
  801309:	c9                   	leave  
  80130a:	83 c4 08             	add    esp,0x8
  80130d:	48 cf                	iretq  
}
  80130f:	90                   	nop
  801310:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  801314:	c9                   	leave  
  801315:	c3                   	ret    

0000000000801316 <init_memory>:
void init_memory()
{
  801316:	f3 0f 1e fa          	endbr64 
  80131a:	55                   	push   rbp
  80131b:	48 89 e5             	mov    rbp,rsp
    extern addr_t _knl_end,_knl_start;//lds中声明的内核的结尾地址，放置位图
    //获取内存大小
    size_t mem_size=mmap_struct[mmap_t_i-1].base+mmap_struct[mmap_t_i-1].len;
  80131e:	8b 05 fc ee bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfeefc]        # 400220 <mmap_t_i>
  801324:	83 e8 01             	sub    eax,0x1
  801327:	48 63 d0             	movsxd rdx,eax
  80132a:	48 89 d0             	mov    rax,rdx
  80132d:	48 01 c0             	add    rax,rax
  801330:	48 01 d0             	add    rax,rdx
  801333:	48 c1 e0 03          	shl    rax,0x3
  801337:	48 05 40 00 40 00    	add    rax,0x400040
  80133d:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  801340:	8b 05 da ee bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfeeda]        # 400220 <mmap_t_i>
  801346:	83 e8 01             	sub    eax,0x1
  801349:	48 63 d0             	movsxd rdx,eax
  80134c:	48 89 d0             	mov    rax,rdx
  80134f:	48 01 c0             	add    rax,rax
  801352:	48 01 d0             	add    rax,rdx
  801355:	48 c1 e0 03          	shl    rax,0x3
  801359:	48 05 48 00 40 00    	add    rax,0x400048
  80135f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801362:	48 01 c8             	add    rax,rcx
  801365:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    //计算出所需内存页数量
    int pgc=mem_size/PAGE_SIZE;
  801369:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80136d:	48 c1 e8 0c          	shr    rax,0xc
  801371:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    //计算出位图所需的字节数
    int pg_bytes=pgc/32;
  801374:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  801377:	8d 50 1f             	lea    edx,[rax+0x1f]
  80137a:	85 c0                	test   eax,eax
  80137c:	0f 48 c2             	cmovs  eax,edx
  80137f:	c1 f8 05             	sar    eax,0x5
  801382:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    page_map=(unsigned int*)PAGE_4K_ALIGN(0xc00000);
  801385:	48 c7 05 90 ec bf ff 	mov    QWORD PTR [rip+0xffffffffffbfec90],0xc00000        # 400020 <page_map>
  80138c:	00 00 c0 00 
    int* p=page_map;
  801390:	48 8b 05 89 ec bf ff 	mov    rax,QWORD PTR [rip+0xffffffffffbfec89]        # 400020 <page_map>
  801397:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    addr_t curp=0;
  80139b:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  8013a2:	00 
    for(int i=0;i<mmap_t_i;i++){
  8013a3:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8013aa:	e9 91 00 00 00       	jmp    801440 <init_memory+0x12a>
        int cont=0;
  8013af:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
        if(mmap_struct[i].type!=MULTIBOOT_MEMORY_AVAILABLE)
  8013b6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8013b9:	48 63 d0             	movsxd rdx,eax
  8013bc:	48 89 d0             	mov    rax,rdx
  8013bf:	48 01 c0             	add    rax,rax
  8013c2:	48 01 d0             	add    rax,rdx
  8013c5:	48 c1 e0 03          	shl    rax,0x3
  8013c9:	48 05 50 00 40 00    	add    rax,0x400050
  8013cf:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8013d2:	48 83 f8 01          	cmp    rax,0x1
  8013d6:	74 07                	je     8013df <init_memory+0xc9>
            cont=-1;
  8013d8:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [rbp-0x10],0xffffffff
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  8013df:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8013e6:	eb 15                	jmp    8013fd <init_memory+0xe7>
            *(p++)=cont;
  8013e8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8013ec:	48 8d 50 04          	lea    rdx,[rax+0x4]
  8013f0:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  8013f4:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8013f7:	89 10                	mov    DWORD PTR [rax],edx
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  8013f9:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8013fd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801400:	48 63 c8             	movsxd rcx,eax
  801403:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801406:	48 63 d0             	movsxd rdx,eax
  801409:	48 89 d0             	mov    rax,rdx
  80140c:	48 01 c0             	add    rax,rax
  80140f:	48 01 d0             	add    rax,rdx
  801412:	48 c1 e0 03          	shl    rax,0x3
  801416:	48 05 48 00 40 00    	add    rax,0x400048
  80141c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80141f:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  801426:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  80142d:	ff 00 00 
  801430:	48 21 d0             	and    rax,rdx
  801433:	48 c1 e8 11          	shr    rax,0x11
  801437:	48 39 c1             	cmp    rcx,rax
  80143a:	72 ac                	jb     8013e8 <init_memory+0xd2>
    for(int i=0;i<mmap_t_i;i++){
  80143c:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  801440:	8b 05 da ed bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfedda]        # 400220 <mmap_t_i>
  801446:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  801449:	0f 8c 60 ff ff ff    	jl     8013af <init_memory+0x99>
        }
    }

    //低16M空间直接被内核占用
    for(int i=0;i<128;i++){
  80144f:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  801456:	eb 1d                	jmp    801475 <init_memory+0x15f>
        page_map[i]=0xffffffff;
  801458:	48 8b 15 c1 eb bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfebc1]        # 400020 <page_map>
  80145f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801462:	48 98                	cdqe   
  801464:	48 c1 e0 02          	shl    rax,0x2
  801468:	48 01 d0             	add    rax,rdx
  80146b:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<128;i++){
  801471:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  801475:	83 7d e8 7f          	cmp    DWORD PTR [rbp-0x18],0x7f
  801479:	7e dd                	jle    801458 <init_memory+0x142>
    }
}
  80147b:	90                   	nop
  80147c:	90                   	nop
  80147d:	5d                   	pop    rbp
  80147e:	c3                   	ret    

000000000080147f <req_a_page>:
/*
page_map存储方式:
0x00000000
little end
*/
addr_t req_a_page(){
  80147f:	f3 0f 1e fa          	endbr64 
  801483:	55                   	push   rbp
  801484:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  801487:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80148e:	e9 b0 00 00 00       	jmp    801543 <req_a_page+0xc4>
        for(int j=0;j<32;j++){
  801493:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80149a:	e9 96 00 00 00       	jmp    801535 <req_a_page+0xb6>
            unsigned int bit=page_map[i]&(1<<j);
  80149f:	48 8b 15 7a eb bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfeb7a]        # 400020 <page_map>
  8014a6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8014a9:	48 98                	cdqe   
  8014ab:	48 c1 e0 02          	shl    rax,0x2
  8014af:	48 01 d0             	add    rax,rdx
  8014b2:	8b 10                	mov    edx,DWORD PTR [rax]
  8014b4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8014b7:	be 01 00 00 00       	mov    esi,0x1
  8014bc:	89 c1                	mov    ecx,eax
  8014be:	d3 e6                	shl    esi,cl
  8014c0:	89 f0                	mov    eax,esi
  8014c2:	21 d0                	and    eax,edx
  8014c4:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            if((i*32+j)*4096>=0x100000&&!bit)
  8014c7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8014ca:	c1 e0 05             	shl    eax,0x5
  8014cd:	89 c2                	mov    edx,eax
  8014cf:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8014d2:	01 d0                	add    eax,edx
  8014d4:	c1 e0 0c             	shl    eax,0xc
  8014d7:	3d ff ff 0f 00       	cmp    eax,0xfffff
  8014dc:	7e 53                	jle    801531 <req_a_page+0xb2>
  8014de:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8014e2:	75 4d                	jne    801531 <req_a_page+0xb2>
            {
                page_map[i]=page_map[i]|(1<<j);
  8014e4:	48 8b 15 35 eb bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfeb35]        # 400020 <page_map>
  8014eb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8014ee:	48 98                	cdqe   
  8014f0:	48 c1 e0 02          	shl    rax,0x2
  8014f4:	48 01 d0             	add    rax,rdx
  8014f7:	8b 10                	mov    edx,DWORD PTR [rax]
  8014f9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8014fc:	be 01 00 00 00       	mov    esi,0x1
  801501:	89 c1                	mov    ecx,eax
  801503:	d3 e6                	shl    esi,cl
  801505:	89 f0                	mov    eax,esi
  801507:	89 c6                	mov    esi,eax
  801509:	48 8b 0d 10 eb bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfeb10]        # 400020 <page_map>
  801510:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801513:	48 98                	cdqe   
  801515:	48 c1 e0 02          	shl    rax,0x2
  801519:	48 01 c8             	add    rax,rcx
  80151c:	09 f2                	or     edx,esi
  80151e:	89 10                	mov    DWORD PTR [rax],edx
                return i*32+j;//num of page
  801520:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801523:	c1 e0 05             	shl    eax,0x5
  801526:	89 c2                	mov    edx,eax
  801528:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80152b:	01 d0                	add    eax,edx
  80152d:	48 98                	cdqe   
  80152f:	eb 1c                	jmp    80154d <req_a_page+0xce>
        for(int j=0;j<32;j++){
  801531:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801535:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  801539:	0f 8e 60 ff ff ff    	jle    80149f <req_a_page+0x20>
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  80153f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801543:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  801547:	0f 8e 46 ff ff ff    	jle    801493 <req_a_page+0x14>

            }
        }
    }
}
  80154d:	5d                   	pop    rbp
  80154e:	c3                   	ret    

000000000080154f <free_page>:

int free_page(char *paddr){
  80154f:	f3 0f 1e fa          	endbr64 
  801553:	55                   	push   rbp
  801554:	48 89 e5             	mov    rbp,rsp
  801557:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=(int)paddr/4096;
  80155b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80155f:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801565:	85 c0                	test   eax,eax
  801567:	0f 48 c2             	cmovs  eax,edx
  80156a:	c1 f8 0c             	sar    eax,0xc
  80156d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  801570:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801573:	8d 50 1f             	lea    edx,[rax+0x1f]
  801576:	85 c0                	test   eax,eax
  801578:	0f 48 c2             	cmovs  eax,edx
  80157b:	c1 f8 05             	sar    eax,0x5
  80157e:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  801581:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801584:	99                   	cdq    
  801585:	c1 ea 1b             	shr    edx,0x1b
  801588:	01 d0                	add    eax,edx
  80158a:	83 e0 1f             	and    eax,0x1f
  80158d:	29 d0                	sub    eax,edx
  80158f:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    page_map[n]=page_map[n]&~(unsigned int)(1<<r);
  801592:	48 8b 15 87 ea bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfea87]        # 400020 <page_map>
  801599:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80159c:	48 98                	cdqe   
  80159e:	48 c1 e0 02          	shl    rax,0x2
  8015a2:	48 01 d0             	add    rax,rdx
  8015a5:	8b 10                	mov    edx,DWORD PTR [rax]
  8015a7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8015aa:	be 01 00 00 00       	mov    esi,0x1
  8015af:	89 c1                	mov    ecx,eax
  8015b1:	d3 e6                	shl    esi,cl
  8015b3:	89 f0                	mov    eax,esi
  8015b5:	f7 d0                	not    eax
  8015b7:	89 c6                	mov    esi,eax
  8015b9:	48 8b 0d 60 ea bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfea60]        # 400020 <page_map>
  8015c0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8015c3:	48 98                	cdqe   
  8015c5:	48 c1 e0 02          	shl    rax,0x2
  8015c9:	48 01 c8             	add    rax,rcx
  8015cc:	21 f2                	and    edx,esi
  8015ce:	89 10                	mov    DWORD PTR [rax],edx
}
  8015d0:	90                   	nop
  8015d1:	5d                   	pop    rbp
  8015d2:	c3                   	ret    

00000000008015d3 <check_page>:
int check_page(int num){
  8015d3:	f3 0f 1e fa          	endbr64 
  8015d7:	55                   	push   rbp
  8015d8:	48 89 e5             	mov    rbp,rsp
  8015db:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int n=num/32;
  8015de:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8015e1:	8d 50 1f             	lea    edx,[rax+0x1f]
  8015e4:	85 c0                	test   eax,eax
  8015e6:	0f 48 c2             	cmovs  eax,edx
  8015e9:	c1 f8 05             	sar    eax,0x5
  8015ec:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int r=num%32;
  8015ef:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8015f2:	99                   	cdq    
  8015f3:	c1 ea 1b             	shr    edx,0x1b
  8015f6:	01 d0                	add    eax,edx
  8015f8:	83 e0 1f             	and    eax,0x1f
  8015fb:	29 d0                	sub    eax,edx
  8015fd:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int bit=page_map[n]&(1<<r);
  801600:	48 8b 15 19 ea bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfea19]        # 400020 <page_map>
  801607:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80160a:	48 98                	cdqe   
  80160c:	48 c1 e0 02          	shl    rax,0x2
  801610:	48 01 d0             	add    rax,rdx
  801613:	8b 10                	mov    edx,DWORD PTR [rax]
  801615:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801618:	be 01 00 00 00       	mov    esi,0x1
  80161d:	89 c1                	mov    ecx,eax
  80161f:	d3 e6                	shl    esi,cl
  801621:	89 f0                	mov    eax,esi
  801623:	21 d0                	and    eax,edx
  801625:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    return bit;
  801628:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  80162b:	5d                   	pop    rbp
  80162c:	c3                   	ret    

000000000080162d <get_phyaddr>:
/*
 * 获得这个页对应的物理内存地址
 * */
int get_phyaddr(int num){
  80162d:	f3 0f 1e fa          	endbr64 
  801631:	55                   	push   rbp
  801632:	48 89 e5             	mov    rbp,rsp
  801635:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return num*0x1000;
  801638:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80163b:	c1 e0 0c             	shl    eax,0xc
}
  80163e:	5d                   	pop    rbp
  80163f:	c3                   	ret    

0000000000801640 <set_page_item>:

void set_page_item(page_item *item_addr,int phy_addr,int attr)
{
  801640:	f3 0f 1e fa          	endbr64 
  801644:	55                   	push   rbp
  801645:	48 89 e5             	mov    rbp,rsp
  801648:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80164c:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  80164f:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    *item_addr=0;
  801652:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801656:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *item_addr|=phy_addr&0xfffff000;
  80165d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801661:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801664:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801667:	89 c0                	mov    eax,eax
  801669:	25 00 f0 ff ff       	and    eax,0xfffff000
  80166e:	48 09 c2             	or     rdx,rax
  801671:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801675:	48 89 10             	mov    QWORD PTR [rax],rdx
    *item_addr|=attr;
  801678:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80167c:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80167f:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  801682:	48 98                	cdqe   
  801684:	48 09 c2             	or     rdx,rax
  801687:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80168b:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  80168e:	90                   	nop
  80168f:	5d                   	pop    rbp
  801690:	c3                   	ret    

0000000000801691 <set_1gb_pdpt>:
void set_1gb_pdpt(page_item* ppdpt,int pa,unsigned int extra_attr)
{
  801691:	f3 0f 1e fa          	endbr64 
  801695:	55                   	push   rbp
  801696:	48 89 e5             	mov    rbp,rsp
  801699:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80169d:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  8016a0:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *ppdpt=0;
  8016a3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016a7:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *ppdpt|=PAGE_PRESENT|PDPTE_1GB|extra_attr;
  8016ae:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016b2:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8016b5:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8016b8:	0c 81                	or     al,0x81
  8016ba:	89 c0                	mov    eax,eax
  8016bc:	48 09 c2             	or     rdx,rax
  8016bf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016c3:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffffc0000000ul;
  8016c6:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8016c9:	25 00 00 00 c0       	and    eax,0xc0000000
  8016ce:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *ppdpt|=hipa;
  8016d1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016d5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8016d8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8016db:	48 09 c2             	or     rdx,rax
  8016de:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016e2:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  8016e5:	90                   	nop
  8016e6:	5d                   	pop    rbp
  8016e7:	c3                   	ret    

00000000008016e8 <set_2mb_pde>:
void set_2mb_pde(page_item* pde,int pa)
{
  8016e8:	f3 0f 1e fa          	endbr64 
  8016ec:	55                   	push   rbp
  8016ed:	48 89 e5             	mov    rbp,rsp
  8016f0:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8016f4:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    *pde=0;
  8016f7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016fb:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *pde|=PAGE_PRESENT|PAGE_4MB_PAGE|PDE_4MB_PAT;
  801702:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801706:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801709:	48 0d 81 10 00 00    	or     rax,0x1081
  80170f:	48 89 c2             	mov    rdx,rax
  801712:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801716:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffc00000;
  801719:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80171c:	25 00 00 c0 ff       	and    eax,0xffc00000
  801721:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *pde|=hipa;
  801724:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801728:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80172b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80172e:	48 09 c2             	or     rdx,rax
  801731:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801735:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  801738:	90                   	nop
  801739:	5d                   	pop    rbp
  80173a:	c3                   	ret    

000000000080173b <req_page_at>:
        page_map[i]&=(u32)(1<<j);
    return ret;
} */
//在bitmap申请指定的页面,base默认0x1000对齐
addr_t req_page_at(addr_t base,int pgn)
{
  80173b:	f3 0f 1e fa          	endbr64 
  80173f:	55                   	push   rbp
  801740:	48 89 e5             	mov    rbp,rsp
  801743:	48 83 ec 20          	sub    rsp,0x20
  801747:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80174b:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    if(base==0)//不指定地址
  80174e:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  801753:	75 18                	jne    80176d <req_page_at+0x32>
    {
        return get_phyaddr(req_a_page());
  801755:	b8 00 00 00 00       	mov    eax,0x0
  80175a:	e8 20 fd ff ff       	call   80147f <req_a_page>
  80175f:	89 c7                	mov    edi,eax
  801761:	e8 c7 fe ff ff       	call   80162d <get_phyaddr>
  801766:	48 98                	cdqe   
  801768:	e9 a5 00 00 00       	jmp    801812 <req_page_at+0xd7>
    }
    if(!is_pgs_ava(base,pgn))return -1;//先检查
  80176d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801771:	89 c2                	mov    edx,eax
  801773:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801776:	89 c6                	mov    esi,eax
  801778:	89 d7                	mov    edi,edx
  80177a:	e8 52 01 00 00       	call   8018d1 <is_pgs_ava>
  80177f:	85 c0                	test   eax,eax
  801781:	75 0c                	jne    80178f <req_page_at+0x54>
  801783:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80178a:	e9 83 00 00 00       	jmp    801812 <req_page_at+0xd7>
    int pgni=base/4096;
  80178f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801793:	48 c1 e8 0c          	shr    rax,0xc
  801797:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int pgi=pgni/32;
  80179a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80179d:	8d 50 1f             	lea    edx,[rax+0x1f]
  8017a0:	85 c0                	test   eax,eax
  8017a2:	0f 48 c2             	cmovs  eax,edx
  8017a5:	c1 f8 05             	sar    eax,0x5
  8017a8:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    int pgj=pgni%32;
  8017ab:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8017ae:	99                   	cdq    
  8017af:	c1 ea 1b             	shr    edx,0x1b
  8017b2:	01 d0                	add    eax,edx
  8017b4:	83 e0 1f             	and    eax,0x1f
  8017b7:	29 d0                	sub    eax,edx
  8017b9:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<pgn;i++)
  8017bc:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8017c3:	eb 40                	jmp    801805 <req_page_at+0xca>
    {
        page_map[i]|=(1<<pgj);
  8017c5:	48 8b 15 54 e8 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe854]        # 400020 <page_map>
  8017cc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8017cf:	48 98                	cdqe   
  8017d1:	48 c1 e0 02          	shl    rax,0x2
  8017d5:	48 01 d0             	add    rax,rdx
  8017d8:	8b 10                	mov    edx,DWORD PTR [rax]
  8017da:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8017dd:	be 01 00 00 00       	mov    esi,0x1
  8017e2:	89 c1                	mov    ecx,eax
  8017e4:	d3 e6                	shl    esi,cl
  8017e6:	89 f0                	mov    eax,esi
  8017e8:	89 c6                	mov    esi,eax
  8017ea:	48 8b 0d 2f e8 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe82f]        # 400020 <page_map>
  8017f1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8017f4:	48 98                	cdqe   
  8017f6:	48 c1 e0 02          	shl    rax,0x2
  8017fa:	48 01 c8             	add    rax,rcx
  8017fd:	09 f2                	or     edx,esi
  8017ff:	89 10                	mov    DWORD PTR [rax],edx
    for(int i=0;i<pgn;i++)
  801801:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801805:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801808:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80180b:	7c b8                	jl     8017c5 <req_page_at+0x8a>
    }
    return 0;
  80180d:	b8 00 00 00 00       	mov    eax,0x0

}
  801812:	c9                   	leave  
  801813:	c3                   	ret    

0000000000801814 <chk_vm>:
int chk_vm(int base, int pgn)
{
  801814:	f3 0f 1e fa          	endbr64 
  801818:	55                   	push   rbp
  801819:	48 89 e5             	mov    rbp,rsp
  80181c:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80181f:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int *pdet=0;
  801822:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  801829:	00 
    asm volatile("mov %%cr3,%0":"=r"(pdet));
  80182a:	0f 20 d8             	mov    rax,cr3
  80182d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int *pt=pdet[base/PAGE_INDEX_SIZE]&0xfffff000;
  801831:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801834:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  80183a:	85 c0                	test   eax,eax
  80183c:	0f 48 c2             	cmovs  eax,edx
  80183f:	c1 f8 16             	sar    eax,0x16
  801842:	48 98                	cdqe   
  801844:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  80184b:	00 
  80184c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801850:	48 01 d0             	add    rax,rdx
  801853:	8b 00                	mov    eax,DWORD PTR [rax]
  801855:	89 c0                	mov    eax,eax
  801857:	25 00 f0 ff ff       	and    eax,0xfffff000
  80185c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  801860:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801863:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  801869:	85 c0                	test   eax,eax
  80186b:	0f 48 c2             	cmovs  eax,edx
  80186e:	c1 f8 16             	sar    eax,0x16
  801871:	48 98                	cdqe   
  801873:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  80187a:	00 
  80187b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80187f:	48 01 d0             	add    rax,rdx
  801882:	8b 00                	mov    eax,DWORD PTR [rax]
  801884:	83 e0 01             	and    eax,0x1
  801887:	85 c0                	test   eax,eax
  801889:	74 38                	je     8018c3 <chk_vm+0xaf>
    !(pt[base%PAGE_INDEX_SIZE/PAGE_SIZE]&PAGE_PRESENT))
  80188b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80188e:	99                   	cdq    
  80188f:	c1 ea 0a             	shr    edx,0xa
  801892:	01 d0                	add    eax,edx
  801894:	25 ff ff 3f 00       	and    eax,0x3fffff
  801899:	29 d0                	sub    eax,edx
  80189b:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8018a1:	85 c0                	test   eax,eax
  8018a3:	0f 48 c2             	cmovs  eax,edx
  8018a6:	c1 f8 0c             	sar    eax,0xc
  8018a9:	48 98                	cdqe   
  8018ab:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8018b2:	00 
  8018b3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8018b7:	48 01 d0             	add    rax,rdx
  8018ba:	8b 00                	mov    eax,DWORD PTR [rax]
  8018bc:	83 e0 01             	and    eax,0x1
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  8018bf:	85 c0                	test   eax,eax
  8018c1:	75 07                	jne    8018ca <chk_vm+0xb6>
    {
        return -1;
  8018c3:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8018c8:	eb 05                	jmp    8018cf <chk_vm+0xbb>
    }
    return 0;
  8018ca:	b8 00 00 00 00       	mov    eax,0x0
}
  8018cf:	5d                   	pop    rbp
  8018d0:	c3                   	ret    

00000000008018d1 <is_pgs_ava>:
//查看指定区域的页内存是否可用
int is_pgs_ava(int base,int pgn)
{
  8018d1:	f3 0f 1e fa          	endbr64 
  8018d5:	55                   	push   rbp
  8018d6:	48 89 e5             	mov    rbp,rsp
  8018d9:	48 83 ec 18          	sub    rsp,0x18
  8018dd:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8018e0:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int pgi=base/4096;
  8018e3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8018e6:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8018ec:	85 c0                	test   eax,eax
  8018ee:	0f 48 c2             	cmovs  eax,edx
  8018f1:	c1 f8 0c             	sar    eax,0xc
  8018f4:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    for(int i=0;i<pgn;i++)
  8018f7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8018fe:	eb 1e                	jmp    80191e <is_pgs_ava+0x4d>
    {
        if(check_page(pgi+i)!=0)return 0;
  801900:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801903:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801906:	01 d0                	add    eax,edx
  801908:	89 c7                	mov    edi,eax
  80190a:	e8 c4 fc ff ff       	call   8015d3 <check_page>
  80190f:	85 c0                	test   eax,eax
  801911:	74 07                	je     80191a <is_pgs_ava+0x49>
  801913:	b8 00 00 00 00       	mov    eax,0x0
  801918:	eb 11                	jmp    80192b <is_pgs_ava+0x5a>
    for(int i=0;i<pgn;i++)
  80191a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80191e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801921:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  801924:	7c da                	jl     801900 <is_pgs_ava+0x2f>
    }
    return 1;
  801926:	b8 01 00 00 00       	mov    eax,0x1

}
  80192b:	c9                   	leave  
  80192c:	c3                   	ret    

000000000080192d <setup_sys_vol>:
super_block sbs[MAX_SUPERBLOCKS];
fs_operations fs[MAX_FS];

buffer_head buffer_heads[NR_BUFFERHEADS];
int setup_sys_vol(void *disk_drv, void *fs_drv)
{
  80192d:	f3 0f 1e fa          	endbr64 
  801931:	55                   	push   rbp
  801932:	48 89 e5             	mov    rbp,rsp
  801935:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  801939:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    vols[0].name[0]='C';
  80193d:	c6 05 fc e8 bf ff 43 	mov    BYTE PTR [rip+0xffffffffffbfe8fc],0x43        # 400240 <vols>
    vols[0].name[1]='\0';
  801944:	c6 05 f6 e8 bf ff 00 	mov    BYTE PTR [rip+0xffffffffffbfe8f6],0x0        # 400241 <vols+0x1>
    vols[0].disk_drv=disk_drv;
  80194b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80194f:	48 89 05 f2 e8 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe8f2],rax        # 400248 <vols+0x8>
    vols[0].fs_drv=fs_drv;
  801956:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80195a:	48 89 05 ef e8 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe8ef],rax        # 400250 <vols+0x10>
    vols[0].stat=VOLUME_STAT_READY;
  801961:	c7 05 f5 e8 bf ff 01 	mov    DWORD PTR [rip+0xffffffffffbfe8f5],0x1        # 400260 <vols+0x20>
  801968:	00 00 00 
    return 0;
  80196b:	b8 00 00 00 00       	mov    eax,0x0
}
  801970:	5d                   	pop    rbp
  801971:	c3                   	ret    

0000000000801972 <sys_mkfifo>:
//返回管道描述符
int sys_mkfifo(int number)
{
  801972:	f3 0f 1e fa          	endbr64 
  801976:	55                   	push   rbp
  801977:	48 89 e5             	mov    rbp,rsp
  80197a:	48 83 ec 20          	sub    rsp,0x20
  80197e:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    //查重
    for(int i=0;i<MAX_FIFOS;i++)
  801981:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801988:	eb 38                	jmp    8019c2 <sys_mkfifo+0x50>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  80198a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80198d:	48 98                	cdqe   
  80198f:	48 c1 e0 04          	shl    rax,0x4
  801993:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801999:	8b 00                	mov    eax,DWORD PTR [rax]
  80199b:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80199e:	75 1e                	jne    8019be <sys_mkfifo+0x4c>
  8019a0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019a3:	48 98                	cdqe   
  8019a5:	48 c1 e0 04          	shl    rax,0x4
  8019a9:	48 05 68 1e 40 00    	add    rax,0x401e68
  8019af:	8b 00                	mov    eax,DWORD PTR [rax]
  8019b1:	83 f8 01             	cmp    eax,0x1
  8019b4:	75 08                	jne    8019be <sys_mkfifo+0x4c>
            return i;
  8019b6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019b9:	e9 a6 00 00 00       	jmp    801a64 <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  8019be:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8019c2:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  8019c6:	7e c2                	jle    80198a <sys_mkfifo+0x18>
        }
    }
    for(int i=0;i<MAX_FIFOS;i++)
  8019c8:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8019cf:	e9 81 00 00 00       	jmp    801a55 <sys_mkfifo+0xe3>
    {
        if(fifos[i].flag==0) {
  8019d4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8019d7:	48 98                	cdqe   
  8019d9:	48 c1 e0 04          	shl    rax,0x4
  8019dd:	48 05 68 1e 40 00    	add    rax,0x401e68
  8019e3:	8b 00                	mov    eax,DWORD PTR [rax]
  8019e5:	85 c0                	test   eax,eax
  8019e7:	75 68                	jne    801a51 <sys_mkfifo+0xdf>
            fifos[i].flag=1;
  8019e9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8019ec:	48 98                	cdqe   
  8019ee:	48 c1 e0 04          	shl    rax,0x4
  8019f2:	48 05 68 1e 40 00    	add    rax,0x401e68
  8019f8:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            fifos[i].id=number;
  8019fe:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801a01:	48 98                	cdqe   
  801a03:	48 c1 e0 04          	shl    rax,0x4
  801a07:	48 8d 90 6c 1e 40 00 	lea    rdx,[rax+0x401e6c]
  801a0e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a11:	89 02                	mov    DWORD PTR [rdx],eax
            fifos[i].size=CHUNK_SIZE;
  801a13:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801a16:	48 98                	cdqe   
  801a18:	48 c1 e0 04          	shl    rax,0x4
  801a1c:	48 05 64 1e 40 00    	add    rax,0x401e64
  801a22:	c7 00 00 10 00 00    	mov    DWORD PTR [rax],0x1000
            //分配内存
            fifos[i].pa= get_phyaddr(req_a_page());
  801a28:	b8 00 00 00 00       	mov    eax,0x0
  801a2d:	e8 4d fa ff ff       	call   80147f <req_a_page>
  801a32:	89 c7                	mov    edi,eax
  801a34:	e8 f4 fb ff ff       	call   80162d <get_phyaddr>
  801a39:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801a3c:	48 63 d2             	movsxd rdx,edx
  801a3f:	48 c1 e2 04          	shl    rdx,0x4
  801a43:	48 81 c2 60 1e 40 00 	add    rdx,0x401e60
  801a4a:	89 02                	mov    DWORD PTR [rdx],eax
            return i;
  801a4c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801a4f:	eb 13                	jmp    801a64 <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801a51:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801a55:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  801a59:	0f 8e 75 ff ff ff    	jle    8019d4 <sys_mkfifo+0x62>
        }
    }
    return -1;
  801a5f:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801a64:	c9                   	leave  
  801a65:	c3                   	ret    

0000000000801a66 <sys_rmfifo>:

int sys_rmfifo(int number)
{
  801a66:	f3 0f 1e fa          	endbr64 
  801a6a:	55                   	push   rbp
  801a6b:	48 89 e5             	mov    rbp,rsp
  801a6e:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_FIFOS;i++)
  801a71:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801a78:	eb 4a                	jmp    801ac4 <sys_rmfifo+0x5e>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801a7a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a7d:	48 98                	cdqe   
  801a7f:	48 c1 e0 04          	shl    rax,0x4
  801a83:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801a89:	8b 00                	mov    eax,DWORD PTR [rax]
  801a8b:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801a8e:	75 30                	jne    801ac0 <sys_rmfifo+0x5a>
  801a90:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a93:	48 98                	cdqe   
  801a95:	48 c1 e0 04          	shl    rax,0x4
  801a99:	48 05 68 1e 40 00    	add    rax,0x401e68
  801a9f:	8b 00                	mov    eax,DWORD PTR [rax]
  801aa1:	83 f8 01             	cmp    eax,0x1
  801aa4:	75 1a                	jne    801ac0 <sys_rmfifo+0x5a>
            fifos[i].flag=0;
  801aa6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801aa9:	48 98                	cdqe   
  801aab:	48 c1 e0 04          	shl    rax,0x4
  801aaf:	48 05 68 1e 40 00    	add    rax,0x401e68
  801ab5:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            return i;
  801abb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801abe:	eb 0f                	jmp    801acf <sys_rmfifo+0x69>
    for(int i=0;i<MAX_FIFOS;i++)
  801ac0:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801ac4:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801ac8:	7e b0                	jle    801a7a <sys_rmfifo+0x14>
        }
    }
    return -1;
  801aca:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801acf:	5d                   	pop    rbp
  801ad0:	c3                   	ret    

0000000000801ad1 <free_vol>:
int free_vol(int voli)
{
  801ad1:	f3 0f 1e fa          	endbr64 
  801ad5:	55                   	push   rbp
  801ad6:	48 89 e5             	mov    rbp,rsp
  801ad9:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    vols[0].stat=VOLUME_STAT_EMPTY;
  801adc:	c7 05 7a e7 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbfe77a],0x0        # 400260 <vols+0x20>
  801ae3:	00 00 00 
    return 0;
  801ae6:	b8 00 00 00 00       	mov    eax,0x0
}
  801aeb:	5d                   	pop    rbp
  801aec:	c3                   	ret    

0000000000801aed <reg_vol>:

int reg_vol(int disk_drvi, int fs_drvi, char *name)
{
  801aed:	f3 0f 1e fa          	endbr64 
  801af1:	55                   	push   rbp
  801af2:	48 89 e5             	mov    rbp,rsp
  801af5:	48 83 ec 20          	sub    rsp,0x20
  801af9:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801afc:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  801aff:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
    for(int i=0;i<MAX_VOLUMES;i++)
  801b03:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801b0a:	e9 d8 00 00 00       	jmp    801be7 <reg_vol+0xfa>
    {
        if(vols[i].stat==VOLUME_STAT_EMPTY)
  801b0f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b12:	48 63 d0             	movsxd rdx,eax
  801b15:	48 89 d0             	mov    rax,rdx
  801b18:	48 c1 e0 02          	shl    rax,0x2
  801b1c:	48 01 d0             	add    rax,rdx
  801b1f:	48 c1 e0 03          	shl    rax,0x3
  801b23:	48 05 60 02 40 00    	add    rax,0x400260
  801b29:	8b 00                	mov    eax,DWORD PTR [rax]
  801b2b:	85 c0                	test   eax,eax
  801b2d:	0f 85 b0 00 00 00    	jne    801be3 <reg_vol+0xf6>
        {
            extern driver *drvs;
            vols[i].stat=VOLUME_STAT_READY;
  801b33:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b36:	48 63 d0             	movsxd rdx,eax
  801b39:	48 89 d0             	mov    rax,rdx
  801b3c:	48 c1 e0 02          	shl    rax,0x2
  801b40:	48 01 d0             	add    rax,rdx
  801b43:	48 c1 e0 03          	shl    rax,0x3
  801b47:	48 05 60 02 40 00    	add    rax,0x400260
  801b4d:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            vols[i].fs= &fs[fs_drvi];
  801b53:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801b56:	48 63 d0             	movsxd rdx,eax
  801b59:	48 89 d0             	mov    rax,rdx
  801b5c:	48 01 c0             	add    rax,rax
  801b5f:	48 01 d0             	add    rax,rdx
  801b62:	48 c1 e0 03          	shl    rax,0x3
  801b66:	48 8d 88 80 23 40 00 	lea    rcx,[rax+0x402380]
  801b6d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b70:	48 63 d0             	movsxd rdx,eax
  801b73:	48 89 d0             	mov    rax,rdx
  801b76:	48 c1 e0 02          	shl    rax,0x2
  801b7a:	48 01 d0             	add    rax,rdx
  801b7d:	48 c1 e0 03          	shl    rax,0x3
  801b81:	48 05 58 02 40 00    	add    rax,0x400258
  801b87:	48 89 08             	mov    QWORD PTR [rax],rcx
            vols[i].disk_drv= get_drv(disk_drvi);
  801b8a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801b8d:	89 c7                	mov    edi,eax
  801b8f:	e8 fa 19 00 00       	call   80358e <get_drv>
  801b94:	48 89 c2             	mov    rdx,rax
  801b97:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b9a:	48 63 c8             	movsxd rcx,eax
  801b9d:	48 89 c8             	mov    rax,rcx
  801ba0:	48 c1 e0 02          	shl    rax,0x2
  801ba4:	48 01 c8             	add    rax,rcx
  801ba7:	48 c1 e0 03          	shl    rax,0x3
  801bab:	48 05 48 02 40 00    	add    rax,0x400248
  801bb1:	48 89 10             	mov    QWORD PTR [rax],rdx
            strcpy(vols[i].name,name);
  801bb4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801bb7:	48 63 d0             	movsxd rdx,eax
  801bba:	48 89 d0             	mov    rax,rdx
  801bbd:	48 c1 e0 02          	shl    rax,0x2
  801bc1:	48 01 d0             	add    rax,rdx
  801bc4:	48 c1 e0 03          	shl    rax,0x3
  801bc8:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801bcf:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801bd3:	48 89 c6             	mov    rsi,rax
  801bd6:	48 89 d7             	mov    rdi,rdx
  801bd9:	e8 c1 89 00 00       	call   80a59f <strcpy>
            return i;
  801bde:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801be1:	eb 13                	jmp    801bf6 <reg_vol+0x109>
    for(int i=0;i<MAX_VOLUMES;i++)
  801be3:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801be7:	83 7d fc 19          	cmp    DWORD PTR [rbp-0x4],0x19
  801beb:	0f 8e 1e ff ff ff    	jle    801b0f <reg_vol+0x22>
        }
    }
    return -1;
  801bf1:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801bf6:	c9                   	leave  
  801bf7:	c3                   	ret    

0000000000801bf8 <sys_open>:
int sys_open(char *path, int mode)
{
  801bf8:	f3 0f 1e fa          	endbr64 
  801bfc:	55                   	push   rbp
  801bfd:	48 89 e5             	mov    rbp,rsp
  801c00:	53                   	push   rbx
  801c01:	48 81 ec 28 02 00 00 	sub    rsp,0x228
  801c08:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
  801c0f:	89 b5 d4 fd ff ff    	mov    DWORD PTR [rbp-0x22c],esi
    {

    }
    //根据文件路径找到相应的卷
    char volname[26];
    int i=0,rec=0;
  801c15:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801c1c:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
    for(;path[i]!='/'&&i<26;i++)
  801c23:	eb 20                	jmp    801c45 <sys_open+0x4d>
        volname[i]=path[i];
  801c25:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c28:	48 63 d0             	movsxd rdx,eax
  801c2b:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801c32:	48 01 d0             	add    rax,rdx
  801c35:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  801c38:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c3b:	48 98                	cdqe   
  801c3d:	88 54 05 c0          	mov    BYTE PTR [rbp+rax*1-0x40],dl
    for(;path[i]!='/'&&i<26;i++)
  801c41:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801c45:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c48:	48 63 d0             	movsxd rdx,eax
  801c4b:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801c52:	48 01 d0             	add    rax,rdx
  801c55:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  801c58:	3c 2f                	cmp    al,0x2f
  801c5a:	74 06                	je     801c62 <sys_open+0x6a>
  801c5c:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  801c60:	7e c3                	jle    801c25 <sys_open+0x2d>
    volname[i]='\0';
  801c62:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c65:	48 98                	cdqe   
  801c67:	c6 44 05 c0 00       	mov    BYTE PTR [rbp+rax*1-0x40],0x0
    if(!path[i+1])
  801c6c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c6f:	48 98                	cdqe   
  801c71:	48 8d 50 01          	lea    rdx,[rax+0x1]
  801c75:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801c7c:	48 01 d0             	add    rax,rdx
  801c7f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  801c82:	84 c0                	test   al,al
  801c84:	75 0a                	jne    801c90 <sys_open+0x98>
        return -2;//是根目录
  801c86:	b8 fe ff ff ff       	mov    eax,0xfffffffe
  801c8b:	e9 2b 04 00 00       	jmp    8020bb <sys_open+0x4c3>
    rec=i;
  801c90:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c93:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    for(i=0;i<MAX_VOLUMES;i++)
  801c96:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801c9d:	eb 52                	jmp    801cf1 <sys_open+0xf9>
        if(vols[i].stat!=VOLUME_STAT_EMPTY&& \
  801c9f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801ca2:	48 63 d0             	movsxd rdx,eax
  801ca5:	48 89 d0             	mov    rax,rdx
  801ca8:	48 c1 e0 02          	shl    rax,0x2
  801cac:	48 01 d0             	add    rax,rdx
  801caf:	48 c1 e0 03          	shl    rax,0x3
  801cb3:	48 05 60 02 40 00    	add    rax,0x400260
  801cb9:	8b 00                	mov    eax,DWORD PTR [rax]
  801cbb:	85 c0                	test   eax,eax
  801cbd:	74 2e                	je     801ced <sys_open+0xf5>
        (strcmp(vols[i].name,volname)==0))
  801cbf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801cc2:	48 63 d0             	movsxd rdx,eax
  801cc5:	48 89 d0             	mov    rax,rdx
  801cc8:	48 c1 e0 02          	shl    rax,0x2
  801ccc:	48 01 d0             	add    rax,rdx
  801ccf:	48 c1 e0 03          	shl    rax,0x3
  801cd3:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801cda:	48 8d 45 c0          	lea    rax,[rbp-0x40]
  801cde:	48 89 c6             	mov    rsi,rax
  801ce1:	48 89 d7             	mov    rdi,rdx
  801ce4:	e8 56 8a 00 00       	call   80a73f <strcmp>
        if(vols[i].stat!=VOLUME_STAT_EMPTY&& \
  801ce9:	85 c0                	test   eax,eax
  801ceb:	74 0c                	je     801cf9 <sys_open+0x101>
    for(i=0;i<MAX_VOLUMES;i++)
  801ced:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801cf1:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  801cf5:	7e a8                	jle    801c9f <sys_open+0xa7>
  801cf7:	eb 01                	jmp    801cfa <sys_open+0x102>
            break;
  801cf9:	90                   	nop
    if(i==MAX_VOLUMES)return -1;
  801cfa:	83 7d ec 1a          	cmp    DWORD PTR [rbp-0x14],0x1a
  801cfe:	75 0a                	jne    801d0a <sys_open+0x112>
  801d00:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801d05:	e9 b1 03 00 00       	jmp    8020bb <sys_open+0x4c3>
    driver_args arg={
  801d0a:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
  801d11:	b8 00 00 00 00       	mov    eax,0x0
  801d16:	b9 17 00 00 00       	mov    ecx,0x17
  801d1b:	48 89 d7             	mov    rdi,rdx
  801d1e:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  801d21:	48 89 fa             	mov    rdx,rdi
  801d24:	89 02                	mov    DWORD PTR [rdx],eax
  801d26:	48 83 c2 04          	add    rdx,0x4
            .path=path+rec+1
  801d2a:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801d2d:	48 98                	cdqe   
  801d2f:	48 8d 50 01          	lea    rdx,[rax+0x1]
  801d33:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801d3a:	48 01 d0             	add    rax,rdx
    driver_args arg={
  801d3d:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
    };
    vfs_dir_entry dir;
    vfs_dir_entry res;
    int voln=i;
  801d44:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801d47:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    if(vols[i].fs->find(path+rec+1,dir,&res)==-1)//找不到文件 ((driver*)vols[i].fs_drv)->find(&arg)==-1
  801d4a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801d4d:	48 63 d0             	movsxd rdx,eax
  801d50:	48 89 d0             	mov    rax,rdx
  801d53:	48 c1 e0 02          	shl    rax,0x2
  801d57:	48 01 d0             	add    rax,rdx
  801d5a:	48 c1 e0 03          	shl    rax,0x3
  801d5e:	48 05 58 02 40 00    	add    rax,0x400258
  801d64:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801d67:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  801d6b:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801d6e:	48 98                	cdqe   
  801d70:	48 8d 48 01          	lea    rcx,[rax+0x1]
  801d74:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801d7b:	48 01 c1             	add    rcx,rax
  801d7e:	48 8d 85 40 fe ff ff 	lea    rax,[rbp-0x1c0]
  801d85:	ff b5 f8 fe ff ff    	push   QWORD PTR [rbp-0x108]
  801d8b:	ff b5 f0 fe ff ff    	push   QWORD PTR [rbp-0x110]
  801d91:	ff b5 e8 fe ff ff    	push   QWORD PTR [rbp-0x118]
  801d97:	ff b5 e0 fe ff ff    	push   QWORD PTR [rbp-0x120]
  801d9d:	ff b5 d8 fe ff ff    	push   QWORD PTR [rbp-0x128]
  801da3:	ff b5 d0 fe ff ff    	push   QWORD PTR [rbp-0x130]
  801da9:	ff b5 c8 fe ff ff    	push   QWORD PTR [rbp-0x138]
  801daf:	ff b5 c0 fe ff ff    	push   QWORD PTR [rbp-0x140]
  801db5:	ff b5 b8 fe ff ff    	push   QWORD PTR [rbp-0x148]
  801dbb:	ff b5 b0 fe ff ff    	push   QWORD PTR [rbp-0x150]
  801dc1:	ff b5 a8 fe ff ff    	push   QWORD PTR [rbp-0x158]
  801dc7:	ff b5 a0 fe ff ff    	push   QWORD PTR [rbp-0x160]
  801dcd:	48 89 c6             	mov    rsi,rax
  801dd0:	48 89 cf             	mov    rdi,rcx
  801dd3:	ff d2                	call   rdx
  801dd5:	48 83 c4 60          	add    rsp,0x60
  801dd9:	83 f8 ff             	cmp    eax,0xffffffff
  801ddc:	75 49                	jne    801e27 <sys_open+0x22f>
    {
        if(mode&FILE_MODE_WRITE) {
  801dde:	8b 85 d4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x22c]
  801de4:	83 e0 02             	and    eax,0x2
  801de7:	85 c0                	test   eax,eax
  801de9:	74 32                	je     801e1d <sys_open+0x225>
            return ((driver *) vols[i].fs_drv)->touch(&arg);//这里之后要改
  801deb:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801dee:	48 63 d0             	movsxd rdx,eax
  801df1:	48 89 d0             	mov    rax,rdx
  801df4:	48 c1 e0 02          	shl    rax,0x2
  801df8:	48 01 d0             	add    rax,rdx
  801dfb:	48 c1 e0 03          	shl    rax,0x3
  801dff:	48 05 50 02 40 00    	add    rax,0x400250
  801e05:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801e08:	48 8b 50 4c          	mov    rdx,QWORD PTR [rax+0x4c]
  801e0c:	48 8d 85 00 ff ff ff 	lea    rax,[rbp-0x100]
  801e13:	48 89 c7             	mov    rdi,rax
  801e16:	ff d2                	call   rdx
  801e18:	e9 9e 02 00 00       	jmp    8020bb <sys_open+0x4c3>
        }else
            return -1;
  801e1d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801e22:	e9 94 02 00 00       	jmp    8020bb <sys_open+0x4c3>
    }
    vfs_dir_entry entry=res;//=arg.entry;
  801e27:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
  801e2e:	48 8b 95 48 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b8]
  801e35:	48 89 85 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],rax
  801e3c:	48 89 95 e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdx
  801e43:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
  801e4a:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
  801e51:	48 89 85 f0 fd ff ff 	mov    QWORD PTR [rbp-0x210],rax
  801e58:	48 89 95 f8 fd ff ff 	mov    QWORD PTR [rbp-0x208],rdx
  801e5f:	48 8b 85 60 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1a0]
  801e66:	48 8b 95 68 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x198]
  801e6d:	48 89 85 00 fe ff ff 	mov    QWORD PTR [rbp-0x200],rax
  801e74:	48 89 95 08 fe ff ff 	mov    QWORD PTR [rbp-0x1f8],rdx
  801e7b:	48 8b 85 70 fe ff ff 	mov    rax,QWORD PTR [rbp-0x190]
  801e82:	48 8b 95 78 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x188]
  801e89:	48 89 85 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rax
  801e90:	48 89 95 18 fe ff ff 	mov    QWORD PTR [rbp-0x1e8],rdx
  801e97:	48 8b 85 80 fe ff ff 	mov    rax,QWORD PTR [rbp-0x180]
  801e9e:	48 8b 95 88 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x178]
  801ea5:	48 89 85 20 fe ff ff 	mov    QWORD PTR [rbp-0x1e0],rax
  801eac:	48 89 95 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rdx
  801eb3:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
  801eba:	48 8b 95 98 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x168]
  801ec1:	48 89 85 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],rax
  801ec8:	48 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdx
    int j=-1;
  801ecf:	c7 45 e8 ff ff ff ff 	mov    DWORD PTR [rbp-0x18],0xffffffff
    for(i=0;i<MAX_OPEN_FILES;i++)
  801ed6:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801edd:	eb 5c                	jmp    801f3b <sys_open+0x343>
    {
        if(opened[i].voln==voln&&opened[i].id==entry.id)
  801edf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801ee2:	48 63 d0             	movsxd rdx,eax
  801ee5:	48 89 d0             	mov    rax,rdx
  801ee8:	48 01 c0             	add    rax,rax
  801eeb:	48 01 d0             	add    rax,rdx
  801eee:	48 c1 e0 05          	shl    rax,0x5
  801ef2:	48 05 68 06 40 00    	add    rax,0x400668
  801ef8:	8b 00                	mov    eax,DWORD PTR [rax]
  801efa:	39 45 e0             	cmp    DWORD PTR [rbp-0x20],eax
  801efd:	75 38                	jne    801f37 <sys_open+0x33f>
  801eff:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801f02:	48 63 d0             	movsxd rdx,eax
  801f05:	48 89 d0             	mov    rax,rdx
  801f08:	48 01 c0             	add    rax,rax
  801f0b:	48 01 d0             	add    rax,rdx
  801f0e:	48 c1 e0 05          	shl    rax,0x5
  801f12:	48 05 74 06 40 00    	add    rax,0x400674
  801f18:	8b 10                	mov    edx,DWORD PTR [rax]
  801f1a:	8b 85 f4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x20c]
  801f20:	39 c2                	cmp    edx,eax
  801f22:	75 13                	jne    801f37 <sys_open+0x33f>
        {
            if(mode==FILE_MODE_WRITE)
  801f24:	83 bd d4 fd ff ff 02 	cmp    DWORD PTR [rbp-0x22c],0x2
  801f2b:	75 0a                	jne    801f37 <sys_open+0x33f>
            {
                return -1;//读模式会重新给一个fno但是指向同一个文件
  801f2d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801f32:	e9 84 01 00 00       	jmp    8020bb <sys_open+0x4c3>
    for(i=0;i<MAX_OPEN_FILES;i++)
  801f37:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801f3b:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  801f3f:	7e 9e                	jle    801edf <sys_open+0x2e7>
            }
        }
    }
    for(i=0;i<MAX_OPEN_FILES;i++)
  801f41:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801f48:	eb 2b                	jmp    801f75 <sys_open+0x37d>
    {
        if(!opened[i].mode) {
  801f4a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801f4d:	48 63 d0             	movsxd rdx,eax
  801f50:	48 89 d0             	mov    rax,rdx
  801f53:	48 01 c0             	add    rax,rax
  801f56:	48 01 d0             	add    rax,rdx
  801f59:	48 c1 e0 05          	shl    rax,0x5
  801f5d:	48 05 64 06 40 00    	add    rax,0x400664
  801f63:	8b 00                	mov    eax,DWORD PTR [rax]
  801f65:	85 c0                	test   eax,eax
  801f67:	75 08                	jne    801f71 <sys_open+0x379>
            j = i;
  801f69:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801f6c:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            break;
  801f6f:	eb 0a                	jmp    801f7b <sys_open+0x383>
    for(i=0;i<MAX_OPEN_FILES;i++)
  801f71:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801f75:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  801f79:	7e cf                	jle    801f4a <sys_open+0x352>
        }
    }
    if(j==-1)return -1;
  801f7b:	83 7d e8 ff          	cmp    DWORD PTR [rbp-0x18],0xffffffff
  801f7f:	75 0a                	jne    801f8b <sys_open+0x393>
  801f81:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801f86:	e9 30 01 00 00       	jmp    8020bb <sys_open+0x4c3>
    opened[j]=entry;
  801f8b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801f8e:	48 63 d0             	movsxd rdx,eax
  801f91:	48 89 d0             	mov    rax,rdx
  801f94:	48 01 c0             	add    rax,rax
  801f97:	48 01 d0             	add    rax,rdx
  801f9a:	48 c1 e0 05          	shl    rax,0x5
  801f9e:	48 05 60 06 40 00    	add    rax,0x400660
  801fa4:	48 8b 8d e0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x220]
  801fab:	48 8b 9d e8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x218]
  801fb2:	48 89 08             	mov    QWORD PTR [rax],rcx
  801fb5:	48 89 58 08          	mov    QWORD PTR [rax+0x8],rbx
  801fb9:	48 8b 8d f0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x210]
  801fc0:	48 8b 9d f8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x208]
  801fc7:	48 89 48 10          	mov    QWORD PTR [rax+0x10],rcx
  801fcb:	48 89 58 18          	mov    QWORD PTR [rax+0x18],rbx
  801fcf:	48 8b 8d 00 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x200]
  801fd6:	48 8b 9d 08 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1f8]
  801fdd:	48 89 48 20          	mov    QWORD PTR [rax+0x20],rcx
  801fe1:	48 89 58 28          	mov    QWORD PTR [rax+0x28],rbx
  801fe5:	48 8b 8d 10 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1f0]
  801fec:	48 8b 9d 18 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1e8]
  801ff3:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
  801ff7:	48 89 58 38          	mov    QWORD PTR [rax+0x38],rbx
  801ffb:	48 8b 8d 20 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1e0]
  802002:	48 8b 9d 28 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1d8]
  802009:	48 89 48 40          	mov    QWORD PTR [rax+0x40],rcx
  80200d:	48 89 58 48          	mov    QWORD PTR [rax+0x48],rbx
  802011:	48 8b 8d 30 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1d0]
  802018:	48 8b 9d 38 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1c8]
  80201f:	48 89 48 50          	mov    QWORD PTR [rax+0x50],rcx
  802023:	48 89 58 58          	mov    QWORD PTR [rax+0x58],rbx
    opened[j].fno=i;
  802027:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80202a:	48 63 d0             	movsxd rdx,eax
  80202d:	48 89 d0             	mov    rax,rdx
  802030:	48 01 c0             	add    rax,rax
  802033:	48 01 d0             	add    rax,rdx
  802036:	48 c1 e0 05          	shl    rax,0x5
  80203a:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  802041:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802044:	89 02                	mov    DWORD PTR [rdx],eax
    opened[j].link_c++;
  802046:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802049:	48 63 d0             	movsxd rdx,eax
  80204c:	48 89 d0             	mov    rax,rdx
  80204f:	48 01 c0             	add    rax,rax
  802052:	48 01 d0             	add    rax,rdx
  802055:	48 c1 e0 05          	shl    rax,0x5
  802059:	48 05 6c 06 40 00    	add    rax,0x40066c
  80205f:	8b 00                	mov    eax,DWORD PTR [rax]
  802061:	8d 48 01             	lea    ecx,[rax+0x1]
  802064:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802067:	48 63 d0             	movsxd rdx,eax
  80206a:	48 89 d0             	mov    rax,rdx
  80206d:	48 01 c0             	add    rax,rax
  802070:	48 01 d0             	add    rax,rdx
  802073:	48 c1 e0 05          	shl    rax,0x5
  802077:	48 05 6c 06 40 00    	add    rax,0x40066c
  80207d:	89 08                	mov    DWORD PTR [rax],ecx
    add_proc_openf(&opened[j]);
  80207f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802082:	48 63 d0             	movsxd rdx,eax
  802085:	48 89 d0             	mov    rax,rdx
  802088:	48 01 c0             	add    rax,rax
  80208b:	48 01 d0             	add    rax,rdx
  80208e:	48 c1 e0 05          	shl    rax,0x5
  802092:	48 05 60 06 40 00    	add    rax,0x400660
  802098:	48 89 c7             	mov    rdi,rax
  80209b:	e8 c5 26 00 00       	call   804765 <add_proc_openf>
    return opened[j].fno;
  8020a0:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8020a3:	48 63 d0             	movsxd rdx,eax
  8020a6:	48 89 d0             	mov    rax,rdx
  8020a9:	48 01 c0             	add    rax,rax
  8020ac:	48 01 d0             	add    rax,rdx
  8020af:	48 c1 e0 05          	shl    rax,0x5
  8020b3:	48 05 60 06 40 00    	add    rax,0x400660
  8020b9:	8b 00                	mov    eax,DWORD PTR [rax]
}
  8020bb:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8020bf:	c9                   	leave  
  8020c0:	c3                   	ret    

00000000008020c1 <sys_close>:
int sys_close(int fno)
{
  8020c1:	f3 0f 1e fa          	endbr64 
  8020c5:	55                   	push   rbp
  8020c6:	48 89 e5             	mov    rbp,rsp
  8020c9:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  8020cc:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8020d3:	eb 64                	jmp    802139 <sys_close+0x78>
    {
        if(opened[i].fno==fno)
  8020d5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8020d8:	48 63 d0             	movsxd rdx,eax
  8020db:	48 89 d0             	mov    rax,rdx
  8020de:	48 01 c0             	add    rax,rax
  8020e1:	48 01 d0             	add    rax,rdx
  8020e4:	48 c1 e0 05          	shl    rax,0x5
  8020e8:	48 05 60 06 40 00    	add    rax,0x400660
  8020ee:	8b 00                	mov    eax,DWORD PTR [rax]
  8020f0:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8020f3:	75 40                	jne    802135 <sys_close+0x74>
        {
            opened[i].link_c--;
  8020f5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8020f8:	48 63 d0             	movsxd rdx,eax
  8020fb:	48 89 d0             	mov    rax,rdx
  8020fe:	48 01 c0             	add    rax,rax
  802101:	48 01 d0             	add    rax,rdx
  802104:	48 c1 e0 05          	shl    rax,0x5
  802108:	48 05 6c 06 40 00    	add    rax,0x40066c
  80210e:	8b 00                	mov    eax,DWORD PTR [rax]
  802110:	8d 48 ff             	lea    ecx,[rax-0x1]
  802113:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802116:	48 63 d0             	movsxd rdx,eax
  802119:	48 89 d0             	mov    rax,rdx
  80211c:	48 01 c0             	add    rax,rax
  80211f:	48 01 d0             	add    rax,rdx
  802122:	48 c1 e0 05          	shl    rax,0x5
  802126:	48 05 6c 06 40 00    	add    rax,0x40066c
  80212c:	89 08                	mov    DWORD PTR [rax],ecx
            return 0;
  80212e:	b8 00 00 00 00       	mov    eax,0x0
  802133:	eb 0f                	jmp    802144 <sys_close+0x83>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  802135:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802139:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  80213d:	7e 96                	jle    8020d5 <sys_close+0x14>
        }
    }
    return -1;
  80213f:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802144:	5d                   	pop    rbp
  802145:	c3                   	ret    

0000000000802146 <sys_write>:
int sys_write(int fno, char *src, int len)
{
  802146:	f3 0f 1e fa          	endbr64 
  80214a:	55                   	push   rbp
  80214b:	48 89 e5             	mov    rbp,rsp
  80214e:	48 83 ec 20          	sub    rsp,0x20
  802152:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802155:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  802159:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  80215c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80215f:	89 c7                	mov    edi,eax
  802161:	e8 7d 01 00 00       	call   8022e3 <get_vfs_entry>
  802166:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  80216a:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80216f:	75 07                	jne    802178 <sys_write+0x32>
  802171:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802176:	eb 5d                	jmp    8021d5 <sys_write+0x8f>
    if(f->type==FTYPE_REG)
  802178:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80217c:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80217f:	85 c0                	test   eax,eax
  802181:	75 18                	jne    80219b <sys_write+0x55>
    {
        return vfs_write_file(f,src,len);
  802183:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802186:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  80218a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80218e:	48 89 ce             	mov    rsi,rcx
  802191:	48 89 c7             	mov    rdi,rax
  802194:	e8 67 03 00 00       	call   802500 <vfs_write_file>
  802199:	eb 3a                	jmp    8021d5 <sys_write+0x8f>
    }else if(f->type==FTYPE_BLKDEV)
  80219b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80219f:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8021a2:	83 f8 01             	cmp    eax,0x1
  8021a5:	75 29                	jne    8021d0 <sys_write+0x8a>
    {
        int block=get_according_bnr(f);
  8021a7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021ab:	48 89 c7             	mov    rdi,rax
  8021ae:	e8 5b 04 00 00       	call   80260e <get_according_bnr>
  8021b3:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        return write_block(f->dev,block,src,len);
  8021b6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021ba:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  8021bd:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  8021c0:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  8021c4:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  8021c7:	89 c7                	mov    edi,eax
  8021c9:	e8 13 07 00 00       	call   8028e1 <write_block>
  8021ce:	eb 05                	jmp    8021d5 <sys_write+0x8f>
    }
    return -1;
  8021d0:	b8 ff ff ff ff       	mov    eax,0xffffffff
            .src_addr=src,
            .len=len,
            .pos=pos
    };
    return ((driver*)vols[f->voln].fs_drv)->write(&args); */
}
  8021d5:	c9                   	leave  
  8021d6:	c3                   	ret    

00000000008021d7 <sys_read>:
int sys_read(int fno, char *dist,  int len)
{
  8021d7:	f3 0f 1e fa          	endbr64 
  8021db:	55                   	push   rbp
  8021dc:	48 89 e5             	mov    rbp,rsp
  8021df:	48 83 ec 20          	sub    rsp,0x20
  8021e3:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8021e6:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8021ea:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  8021ed:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8021f0:	89 c7                	mov    edi,eax
  8021f2:	e8 ec 00 00 00       	call   8022e3 <get_vfs_entry>
  8021f7:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  8021fb:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802200:	75 07                	jne    802209 <sys_read+0x32>
  802202:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802207:	eb 5d                	jmp    802266 <sys_read+0x8f>
    if(f->type==FTYPE_REG)
  802209:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80220d:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  802210:	85 c0                	test   eax,eax
  802212:	75 18                	jne    80222c <sys_read+0x55>
    {
        return vfs_read_file(f,dist,len);
  802214:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802217:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  80221b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80221f:	48 89 ce             	mov    rsi,rcx
  802222:	48 89 c7             	mov    rdi,rax
  802225:	e8 37 02 00 00       	call   802461 <vfs_read_file>
  80222a:	eb 3a                	jmp    802266 <sys_read+0x8f>
    }else if(f->type==FTYPE_BLKDEV)
  80222c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802230:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  802233:	83 f8 01             	cmp    eax,0x1
  802236:	75 29                	jne    802261 <sys_read+0x8a>
    {
        int block=get_according_bnr(f);
  802238:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80223c:	48 89 c7             	mov    rdi,rax
  80223f:	e8 ca 03 00 00       	call   80260e <get_according_bnr>
  802244:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        return read_block(f->dev,block,dist,len);
  802247:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80224b:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  80224e:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  802251:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802255:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  802258:	89 c7                	mov    edi,eax
  80225a:	e8 ff 06 00 00       	call   80295e <read_block>
  80225f:	eb 05                	jmp    802266 <sys_read+0x8f>
    }
    return -1;
  802261:	b8 ff ff ff ff       	mov    eax,0xffffffff
    //         .len=len,
    //         .pos=pos,
    //         .entry=*f
    // };
    // return ((driver*)vols[f->voln].fs_drv)->read(&args);
}
  802266:	c9                   	leave  
  802267:	c3                   	ret    

0000000000802268 <sys_seek>:
int sys_seek(int fno, int offset, int origin)
{
  802268:	f3 0f 1e fa          	endbr64 
  80226c:	55                   	push   rbp
  80226d:	48 89 e5             	mov    rbp,rsp
  802270:	48 83 ec 20          	sub    rsp,0x20
  802274:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802277:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80227a:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  80227d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802280:	89 c7                	mov    edi,eax
  802282:	e8 5c 00 00 00       	call   8022e3 <get_vfs_entry>
  802287:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  80228b:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802290:	75 07                	jne    802299 <sys_seek+0x31>
  802292:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802297:	eb 14                	jmp    8022ad <sys_seek+0x45>
    f->ptr=offset+origin;
  802299:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80229c:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80229f:	01 c2                	add    edx,eax
  8022a1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8022a5:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
    return 0;
  8022a8:	b8 00 00 00 00       	mov    eax,0x0
}
  8022ad:	c9                   	leave  
  8022ae:	c3                   	ret    

00000000008022af <sys_tell>:
int sys_tell(int fno)
{
  8022af:	f3 0f 1e fa          	endbr64 
  8022b3:	55                   	push   rbp
  8022b4:	48 89 e5             	mov    rbp,rsp
  8022b7:	48 83 ec 20          	sub    rsp,0x20
  8022bb:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    vfs_dir_entry *f= get_vfs_entry(fno);
  8022be:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8022c1:	89 c7                	mov    edi,eax
  8022c3:	e8 1b 00 00 00       	call   8022e3 <get_vfs_entry>
  8022c8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  8022cc:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8022d1:	75 07                	jne    8022da <sys_tell+0x2b>
  8022d3:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8022d8:	eb 07                	jmp    8022e1 <sys_tell+0x32>
    return f->ptr;
  8022da:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8022de:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  8022e1:	c9                   	leave  
  8022e2:	c3                   	ret    

00000000008022e3 <get_vfs_entry>:
vfs_dir_entry *get_vfs_entry(int fno)
{
  8022e3:	f3 0f 1e fa          	endbr64 
  8022e7:	55                   	push   rbp
  8022e8:	48 89 e5             	mov    rbp,rsp
  8022eb:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  8022ee:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8022f5:	eb 3f                	jmp    802336 <get_vfs_entry+0x53>
    {
        if(opened[i].fno==fno)
  8022f7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8022fa:	48 63 d0             	movsxd rdx,eax
  8022fd:	48 89 d0             	mov    rax,rdx
  802300:	48 01 c0             	add    rax,rax
  802303:	48 01 d0             	add    rax,rdx
  802306:	48 c1 e0 05          	shl    rax,0x5
  80230a:	48 05 60 06 40 00    	add    rax,0x400660
  802310:	8b 00                	mov    eax,DWORD PTR [rax]
  802312:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  802315:	75 1b                	jne    802332 <get_vfs_entry+0x4f>
        {
            return &opened[i];
  802317:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80231a:	48 63 d0             	movsxd rdx,eax
  80231d:	48 89 d0             	mov    rax,rdx
  802320:	48 01 c0             	add    rax,rax
  802323:	48 01 d0             	add    rax,rdx
  802326:	48 c1 e0 05          	shl    rax,0x5
  80232a:	48 05 60 06 40 00    	add    rax,0x400660
  802330:	eb 0f                	jmp    802341 <get_vfs_entry+0x5e>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  802332:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802336:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  80233a:	7e bb                	jle    8022f7 <get_vfs_entry+0x14>
        }
    }
    return NULL;
  80233c:	b8 00 00 00 00       	mov    eax,0x0
}
  802341:	5d                   	pop    rbp
  802342:	c3                   	ret    

0000000000802343 <brelse>:

//释放缓冲区（只释放这一块）
int brelse(buffer_head* bh)
{
  802343:	f3 0f 1e fa          	endbr64 
  802347:	55                   	push   rbp
  802348:	48 89 e5             	mov    rbp,rsp
  80234b:	48 83 ec 10          	sub    rsp,0x10
  80234f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    wait_on_buf(bh);
  802353:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802357:	48 89 c7             	mov    rdi,rax
  80235a:	e8 a0 04 00 00       	call   8027ff <wait_on_buf>
    if(bh->b_count==0)return -1;
  80235f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802363:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  802367:	84 c0                	test   al,al
  802369:	75 07                	jne    802372 <brelse+0x2f>
  80236b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802370:	eb 32                	jmp    8023a4 <brelse+0x61>
    bh->b_count--;
  802372:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802376:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  80237a:	8d 50 ff             	lea    edx,[rax-0x1]
  80237d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802381:	88 50 14             	mov    BYTE PTR [rax+0x14],dl
    if(bh->b_count==0)
  802384:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802388:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  80238c:	84 c0                	test   al,al
  80238e:	75 0f                	jne    80239f <brelse+0x5c>
        vmfree(bh->b_data);
  802390:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802394:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802397:	48 89 c7             	mov    rdi,rax
  80239a:	e8 db ed ff ff       	call   80117a <vmfree>
    return 0;
  80239f:	b8 00 00 00 00       	mov    eax,0x0
}
  8023a4:	c9                   	leave  
  8023a5:	c3                   	ret    

00000000008023a6 <bread>:
//从设备中读取指定设备的指定块并返回缓冲区
buffer_head* bread(int dev,int blk)
{
  8023a6:	f3 0f 1e fa          	endbr64 
  8023aa:	55                   	push   rbp
  8023ab:	48 89 e5             	mov    rbp,rsp
  8023ae:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  8023b5:	89 bd 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],edi
  8023bb:	89 b5 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],esi

    buffer_head *bh=get_buf(dev,blk);
  8023c1:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  8023c7:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  8023cd:	89 d6                	mov    esi,edx
  8023cf:	89 c7                	mov    edi,eax
  8023d1:	e8 78 02 00 00       	call   80264e <get_buf>
  8023d6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!bh)return -1;//申请失败
  8023da:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8023df:	75 09                	jne    8023ea <bread+0x44>
  8023e1:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  8023e8:	eb 75                	jmp    80245f <bread+0xb9>
    if(!bh->b_uptodate)
  8023ea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023ee:	0f b6 40 12          	movzx  eax,BYTE PTR [rax+0x12]
  8023f2:	84 c0                	test   al,al
  8023f4:	75 65                	jne    80245b <bread+0xb5>
    {
        driver_args arg;
        arg.dev=dev;
  8023f6:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  8023fc:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
        arg.cmd=DRVF_READ;
  8023ff:	c7 45 d8 02 00 00 00 	mov    DWORD PTR [rbp-0x28],0x2
        arg.dist_addr=bh->b_data;
  802406:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80240a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80240d:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.len=BLOCK_SIZE;
  802413:	c7 85 48 ff ff ff 00 	mov    DWORD PTR [rbp-0xb8],0x200
  80241a:	02 00 00 
        arg.lba=bh->b_blocknr;
  80241d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802421:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  802425:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
        arg.sec_c=BLOCK_SIZE/512;//之后会改
  80242b:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  802432:	00 00 00 
        //lock_buffer(bh);//锁定缓冲块直到读取完成
        int reqi=make_request(&arg);
  802435:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  80243c:	48 89 c7             	mov    rdi,rax
  80243f:	e8 71 11 00 00       	call   8035b5 <make_request>
  802444:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        wait_on_req(reqi);
  802447:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80244a:	89 c7                	mov    edi,eax
  80244c:	e8 77 14 00 00       	call   8038c8 <wait_on_req>
        clear_req(reqi);
  802451:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802454:	89 c7                	mov    edi,eax
  802456:	e8 9d 14 00 00       	call   8038f8 <clear_req>
    }
    return bh;
  80245b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80245f:	c9                   	leave  
  802460:	c3                   	ret    

0000000000802461 <vfs_read_file>:


int vfs_read_file(vfs_dir_entry *f,char *buf,int len)
{
  802461:	f3 0f 1e fa          	endbr64 
  802465:	55                   	push   rbp
  802466:	48 89 e5             	mov    rbp,rsp
  802469:	48 83 ec 40          	sub    rsp,0x40
  80246d:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  802471:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  802475:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  802478:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80247c:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  80247f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  802482:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802486:	48 89 c7             	mov    rdi,rax
  802489:	e8 80 01 00 00       	call   80260e <get_according_bnr>
  80248e:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=bread(dev,block);
  802491:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  802494:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802497:	89 d6                	mov    esi,edx
  802499:	89 c7                	mov    edi,eax
  80249b:	e8 06 ff ff ff       	call   8023a6 <bread>
  8024a0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  8024a4:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8024a7:	ba 00 02 00 00       	mov    edx,0x200
  8024ac:	39 d0                	cmp    eax,edx
  8024ae:	0f 4f c2             	cmovg  eax,edx
  8024b1:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(buf,bh->b_data,size);
  8024b4:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8024b7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8024bb:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8024be:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8024c2:	48 89 ce             	mov    rsi,rcx
  8024c5:	48 89 c7             	mov    rdi,rax
  8024c8:	e8 d4 7f 00 00       	call   80a4a1 <memcpy>
        len-=BLOCK_SIZE;
  8024cd:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  8024d4:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8024d8:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8024db:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8024de:	01 c2                	add    edx,eax
  8024e0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8024e4:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        brelse(bh);
  8024e7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8024eb:	48 89 c7             	mov    rdi,rax
  8024ee:	e8 50 fe ff ff       	call   802343 <brelse>
    }while(len>0);
  8024f3:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  8024f7:	7f 89                	jg     802482 <vfs_read_file+0x21>
    return 0;
  8024f9:	b8 00 00 00 00       	mov    eax,0x0
}
  8024fe:	c9                   	leave  
  8024ff:	c3                   	ret    

0000000000802500 <vfs_write_file>:
int vfs_write_file(vfs_dir_entry *f,char *buf,int len)
{
  802500:	f3 0f 1e fa          	endbr64 
  802504:	55                   	push   rbp
  802505:	48 89 e5             	mov    rbp,rsp
  802508:	48 83 ec 40          	sub    rsp,0x40
  80250c:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  802510:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  802514:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  802517:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80251b:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  80251e:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  802521:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802525:	48 89 c7             	mov    rdi,rax
  802528:	e8 e1 00 00 00       	call   80260e <get_according_bnr>
  80252d:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=get_buf(dev,block);
  802530:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  802533:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802536:	89 d6                	mov    esi,edx
  802538:	89 c7                	mov    edi,eax
  80253a:	e8 0f 01 00 00       	call   80264e <get_buf>
  80253f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802543:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  802546:	ba 00 02 00 00       	mov    edx,0x200
  80254b:	39 d0                	cmp    eax,edx
  80254d:	0f 4f c2             	cmovg  eax,edx
  802550:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(bh->b_data,buf,size);
  802553:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  802556:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80255a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80255d:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802561:	48 89 ce             	mov    rsi,rcx
  802564:	48 89 c7             	mov    rdi,rax
  802567:	e8 35 7f 00 00       	call   80a4a1 <memcpy>
        len-=BLOCK_SIZE;
  80256c:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  802573:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802577:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  80257a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80257d:	01 c2                	add    edx,eax
  80257f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802583:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        bh->b_dirt=1;//修改置位
  802586:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80258a:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  80258e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802592:	48 89 c7             	mov    rdi,rax
  802595:	e8 a9 fd ff ff       	call   802343 <brelse>
    }while(len>0);
  80259a:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  80259e:	7f 81                	jg     802521 <vfs_write_file+0x21>
    return 0;
  8025a0:	b8 00 00 00 00       	mov    eax,0x0
}
  8025a5:	c9                   	leave  
  8025a6:	c3                   	ret    

00000000008025a7 <vfs_seek_file>:

int vfs_seek_file(vfs_dir_entry *f,int offset,int origin)
{
  8025a7:	f3 0f 1e fa          	endbr64 
  8025ab:	55                   	push   rbp
  8025ac:	48 89 e5             	mov    rbp,rsp
  8025af:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8025b3:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  8025b6:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    switch (origin)
  8025b9:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  8025bd:	74 20                	je     8025df <vfs_seek_file+0x38>
  8025bf:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  8025c3:	7f 3f                	jg     802604 <vfs_seek_file+0x5d>
  8025c5:	83 7d f0 00          	cmp    DWORD PTR [rbp-0x10],0x0
  8025c9:	74 08                	je     8025d3 <vfs_seek_file+0x2c>
  8025cb:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  8025cf:	74 23                	je     8025f4 <vfs_seek_file+0x4d>
        break;
    case SEEK_END:
        f->ptr=f->size;
        break;
    default:
        break;
  8025d1:	eb 31                	jmp    802604 <vfs_seek_file+0x5d>
        f->ptr=offset;
  8025d3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8025d7:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8025da:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  8025dd:	eb 26                	jmp    802605 <vfs_seek_file+0x5e>
        f->ptr+=offset;
  8025df:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8025e3:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8025e6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8025e9:	01 c2                	add    edx,eax
  8025eb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8025ef:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  8025f2:	eb 11                	jmp    802605 <vfs_seek_file+0x5e>
        f->ptr=f->size;
  8025f4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8025f8:	8b 50 18             	mov    edx,DWORD PTR [rax+0x18]
  8025fb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8025ff:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  802602:	eb 01                	jmp    802605 <vfs_seek_file+0x5e>
        break;
  802604:	90                   	nop
    }
    return f->ptr;
  802605:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802609:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  80260c:	5d                   	pop    rbp
  80260d:	c3                   	ret    

000000000080260e <get_according_bnr>:
//返回文件ptr在块设备中的块号
int get_according_bnr(vfs_dir_entry *f)
{
  80260e:	f3 0f 1e fa          	endbr64 
  802612:	55                   	push   rbp
  802613:	48 89 e5             	mov    rbp,rsp
  802616:	48 83 ec 10          	sub    rsp,0x10
  80261a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return vols[f->voln].fs->get_according_bnr(f);
  80261e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802622:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802625:	48 63 d0             	movsxd rdx,eax
  802628:	48 89 d0             	mov    rax,rdx
  80262b:	48 c1 e0 02          	shl    rax,0x2
  80262f:	48 01 d0             	add    rax,rdx
  802632:	48 c1 e0 03          	shl    rax,0x3
  802636:	48 05 58 02 40 00    	add    rax,0x400258
  80263c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80263f:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  802643:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802647:	48 89 c7             	mov    rdi,rax
  80264a:	ff d2                	call   rdx

}
  80264c:	c9                   	leave  
  80264d:	c3                   	ret    

000000000080264e <get_buf>:
//获取或者新建一个和dev上block相对应的缓冲区。
buffer_head* get_buf(int dev,int block)
{
  80264e:	f3 0f 1e fa          	endbr64 
  802652:	55                   	push   rbp
  802653:	48 89 e5             	mov    rbp,rsp
  802656:	48 83 ec 20          	sub    rsp,0x20
  80265a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80265d:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802660:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802667:	e9 b9 00 00 00       	jmp    802725 <get_buf+0xd7>
    {
        if(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block)
  80266c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80266f:	48 98                	cdqe   
  802671:	48 c1 e0 06          	shl    rax,0x6
  802675:	48 05 90 26 40 00    	add    rax,0x402690
  80267b:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80267e:	0f b7 c0             	movzx  eax,ax
  802681:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  802684:	0f 85 97 00 00 00    	jne    802721 <get_buf+0xd3>
  80268a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80268d:	48 98                	cdqe   
  80268f:	48 c1 e0 06          	shl    rax,0x6
  802693:	48 05 88 26 40 00    	add    rax,0x402688
  802699:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80269c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80269f:	48 98                	cdqe   
  8026a1:	48 39 c2             	cmp    rdx,rax
  8026a4:	75 7b                	jne    802721 <get_buf+0xd3>
        {
            repeat:
  8026a6:	90                   	nop
            wait_on_buf(&buffer_heads[i]);//等待解锁
  8026a7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8026aa:	48 98                	cdqe   
  8026ac:	48 c1 e0 06          	shl    rax,0x6
  8026b0:	48 05 80 26 40 00    	add    rax,0x402680
  8026b6:	48 89 c7             	mov    rdi,rax
  8026b9:	e8 41 01 00 00       	call   8027ff <wait_on_buf>
            if(buffer_heads[i].b_count>0)//别的进程正在用
  8026be:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8026c1:	48 98                	cdqe   
  8026c3:	48 c1 e0 06          	shl    rax,0x6
  8026c7:	48 05 94 26 40 00    	add    rax,0x402694
  8026cd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8026d0:	84 c0                	test   al,al
  8026d2:	74 02                	je     8026d6 <get_buf+0x88>
                goto repeat;
  8026d4:	eb d1                	jmp    8026a7 <get_buf+0x59>
            if(!(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block))//别的进程修改了
  8026d6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8026d9:	48 98                	cdqe   
  8026db:	48 c1 e0 06          	shl    rax,0x6
  8026df:	48 05 90 26 40 00    	add    rax,0x402690
  8026e5:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8026e8:	0f b7 c0             	movzx  eax,ax
  8026eb:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8026ee:	75 30                	jne    802720 <get_buf+0xd2>
  8026f0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8026f3:	48 98                	cdqe   
  8026f5:	48 c1 e0 06          	shl    rax,0x6
  8026f9:	48 05 88 26 40 00    	add    rax,0x402688
  8026ff:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802702:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802705:	48 98                	cdqe   
  802707:	48 39 c2             	cmp    rdx,rax
  80270a:	75 14                	jne    802720 <get_buf+0xd2>
                continue;
            return &buffer_heads[i];
  80270c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80270f:	48 98                	cdqe   
  802711:	48 c1 e0 06          	shl    rax,0x6
  802715:	48 05 80 26 40 00    	add    rax,0x402680
  80271b:	e9 dd 00 00 00       	jmp    8027fd <get_buf+0x1af>
                continue;
  802720:	90                   	nop
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802721:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802725:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  802729:	0f 8e 3d ff ff ff    	jle    80266c <get_buf+0x1e>
        }
    }
    //空头中找
    for(int i=0;i<NR_BUFFERHEADS;i++)
  80272f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  802736:	e9 b8 00 00 00       	jmp    8027f3 <get_buf+0x1a5>
    {
        if(buffer_heads[i].b_count==0)
  80273b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80273e:	48 98                	cdqe   
  802740:	48 c1 e0 06          	shl    rax,0x6
  802744:	48 05 94 26 40 00    	add    rax,0x402694
  80274a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80274d:	84 c0                	test   al,al
  80274f:	0f 85 9a 00 00 00    	jne    8027ef <get_buf+0x1a1>
        {
            if(buffer_heads[i].b_dirt)
  802755:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802758:	48 98                	cdqe   
  80275a:	48 c1 e0 06          	shl    rax,0x6
  80275e:	48 05 93 26 40 00    	add    rax,0x402693
  802764:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802767:	84 c0                	test   al,al
  802769:	74 2e                	je     802799 <get_buf+0x14b>
            {
                sync_buf(&buffer_heads[i]);
  80276b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80276e:	48 98                	cdqe   
  802770:	48 c1 e0 06          	shl    rax,0x6
  802774:	48 05 80 26 40 00    	add    rax,0x402680
  80277a:	48 89 c7             	mov    rdi,rax
  80277d:	e8 1b 01 00 00       	call   80289d <sync_buf>
                wait_on_buf(&buffer_heads[i]);
  802782:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802785:	48 98                	cdqe   
  802787:	48 c1 e0 06          	shl    rax,0x6
  80278b:	48 05 80 26 40 00    	add    rax,0x402680
  802791:	48 89 c7             	mov    rdi,rax
  802794:	e8 66 00 00 00       	call   8027ff <wait_on_buf>
            }
            buffer_heads[i].b_count++;
  802799:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80279c:	48 98                	cdqe   
  80279e:	48 c1 e0 06          	shl    rax,0x6
  8027a2:	48 05 94 26 40 00    	add    rax,0x402694
  8027a8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8027ab:	8d 50 01             	lea    edx,[rax+0x1]
  8027ae:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8027b1:	48 98                	cdqe   
  8027b3:	48 c1 e0 06          	shl    rax,0x6
  8027b7:	48 05 94 26 40 00    	add    rax,0x402694
  8027bd:	88 10                	mov    BYTE PTR [rax],dl
            //给buffer分配一个实际的缓冲区
            buffer_heads[i].b_data=vmalloc();
  8027bf:	b8 00 00 00 00       	mov    eax,0x0
  8027c4:	e8 22 e9 ff ff       	call   8010eb <vmalloc>
  8027c9:	48 89 c2             	mov    rdx,rax
  8027cc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8027cf:	48 98                	cdqe   
  8027d1:	48 c1 e0 06          	shl    rax,0x6
  8027d5:	48 05 80 26 40 00    	add    rax,0x402680
  8027db:	48 89 10             	mov    QWORD PTR [rax],rdx
            return &buffer_heads[i];
  8027de:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8027e1:	48 98                	cdqe   
  8027e3:	48 c1 e0 06          	shl    rax,0x6
  8027e7:	48 05 80 26 40 00    	add    rax,0x402680
  8027ed:	eb 0e                	jmp    8027fd <get_buf+0x1af>
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8027ef:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8027f3:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  8027f7:	0f 8e 3e ff ff ff    	jle    80273b <get_buf+0xed>
        }
    }
}
  8027fd:	c9                   	leave  
  8027fe:	c3                   	ret    

00000000008027ff <wait_on_buf>:

void wait_on_buf(buffer_head* bh)
{
  8027ff:	f3 0f 1e fa          	endbr64 
  802803:	55                   	push   rbp
  802804:	48 89 e5             	mov    rbp,rsp
  802807:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    //等待缓冲区解锁
    while (bh->b_lock);
  80280b:	90                   	nop
  80280c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802810:	0f b6 40 15          	movzx  eax,BYTE PTR [rax+0x15]
  802814:	84 c0                	test   al,al
  802816:	75 f4                	jne    80280c <wait_on_buf+0xd>
    
}
  802818:	90                   	nop
  802819:	90                   	nop
  80281a:	5d                   	pop    rbp
  80281b:	c3                   	ret    

000000000080281c <scan_dev>:

//扫描块设备，读取分区，识别文件系统
int scan_dev(int dev)
{
  80281c:	f3 0f 1e fa          	endbr64 
  802820:	55                   	push   rbp
  802821:	48 89 e5             	mov    rbp,rsp
  802824:	48 83 ec 30          	sub    rsp,0x30
  802828:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
//    device *blkdev=get_dev(dev);
//    buffer_head* bh=bread(dev,0);
//    if(!bh)return -1;
    char* buf=vmalloc();
  80282b:	b8 00 00 00 00       	mov    eax,0x0
  802830:	e8 b6 e8 ff ff       	call   8010eb <vmalloc>
  802835:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    int r=request(DISK_MAJOR_MAJOR,DISK_CMD_READ,0,1,buf);
  802839:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80283d:	49 89 c0             	mov    r8,rax
  802840:	b9 01 00 00 00       	mov    ecx,0x1
  802845:	ba 00 00 00 00       	mov    edx,0x0
  80284a:	be 20 00 00 00       	mov    esi,0x20
  80284f:	bf 00 00 00 00       	mov    edi,0x0
  802854:	e8 d2 41 00 00       	call   806a2b <request>
  802859:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    chk_result(r);
  80285c:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80285f:	89 c7                	mov    edi,eax
  802861:	e8 79 48 00 00       	call   8070df <chk_result>

    dpt_t* dpte=buf+0x1be;
  802866:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80286a:	48 05 be 01 00 00    	add    rax,0x1be
  802870:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(int i=0;i<4;i++)
  802874:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80287b:	eb 13                	jmp    802890 <scan_dev+0x74>
    {
//        blkdev->par[i].type=dpte->type;
        int stlba=dpte->start_lba;
  80287d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802881:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802884:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
//        {
//            printf("err:unrecognised partition fs.\n");
//        }

//        blkdev->par[i].end_sec=dpte->end_lba;
        dpte++;
  802887:	48 83 45 f8 10       	add    QWORD PTR [rbp-0x8],0x10
    for(int i=0;i<4;i++)
  80288c:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802890:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  802894:	7e e7                	jle    80287d <scan_dev+0x61>
    }
//    brelse(bh);
    return 0;
  802896:	b8 00 00 00 00       	mov    eax,0x0
}
  80289b:	c9                   	leave  
  80289c:	c3                   	ret    

000000000080289d <sync_buf>:

int sync_buf(buffer_head* bh)
{
  80289d:	f3 0f 1e fa          	endbr64 
  8028a1:	55                   	push   rbp
  8028a2:	48 89 e5             	mov    rbp,rsp
  8028a5:	48 83 ec 20          	sub    rsp,0x20
  8028a9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int dev=bh->b_dev;
  8028ad:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8028b1:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
  8028b5:	0f b7 c0             	movzx  eax,ax
  8028b8:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int block=bh->b_blocknr;
  8028bb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8028bf:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8028c3:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //这里需要调用块设备写函数write_block
    return write_block(dev,block,bh->b_data,BLOCK_SIZE);
  8028c6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8028ca:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8028cd:	8b 75 f8             	mov    esi,DWORD PTR [rbp-0x8]
  8028d0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8028d3:	b9 00 02 00 00       	mov    ecx,0x200
  8028d8:	89 c7                	mov    edi,eax
  8028da:	e8 02 00 00 00       	call   8028e1 <write_block>

}
  8028df:	c9                   	leave  
  8028e0:	c3                   	ret    

00000000008028e1 <write_block>:
//操作块设备函数
int write_block(int dev,int block,char *buf,int len)
{
  8028e1:	f3 0f 1e fa          	endbr64 
  8028e5:	55                   	push   rbp
  8028e6:	48 89 e5             	mov    rbp,rsp
  8028e9:	48 83 ec 30          	sub    rsp,0x30
  8028ed:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8028f0:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8028f3:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  8028f7:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=get_buf(dev,block);
  8028fa:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8028fd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802900:	89 d6                	mov    esi,edx
  802902:	89 c7                	mov    edi,eax
  802904:	e8 45 fd ff ff       	call   80264e <get_buf>
  802909:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  80290d:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  802910:	ba 00 02 00 00       	mov    edx,0x200
  802915:	39 d0                	cmp    eax,edx
  802917:	0f 4f c2             	cmovg  eax,edx
  80291a:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(bh->b_data,buf,size);
  80291d:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802920:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802924:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802927:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  80292b:	48 89 ce             	mov    rsi,rcx
  80292e:	48 89 c7             	mov    rdi,rax
  802931:	e8 6b 7b 00 00       	call   80a4a1 <memcpy>
        len-=BLOCK_SIZE;
  802936:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        bh->b_dirt=1;//修改置位
  80293d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802941:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  802945:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802949:	48 89 c7             	mov    rdi,rax
  80294c:	e8 f2 f9 ff ff       	call   802343 <brelse>
    }while(len>0);
  802951:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  802955:	7f a3                	jg     8028fa <write_block+0x19>
    return 0;
  802957:	b8 00 00 00 00       	mov    eax,0x0
}
  80295c:	c9                   	leave  
  80295d:	c3                   	ret    

000000000080295e <read_block>:
int read_block(int dev,int block,char* buf,int len)
{
  80295e:	f3 0f 1e fa          	endbr64 
  802962:	55                   	push   rbp
  802963:	48 89 e5             	mov    rbp,rsp
  802966:	48 83 ec 30          	sub    rsp,0x30
  80296a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80296d:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  802970:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  802974:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=bread(dev,block);
  802977:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80297a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80297d:	89 d6                	mov    esi,edx
  80297f:	89 c7                	mov    edi,eax
  802981:	e8 20 fa ff ff       	call   8023a6 <bread>
  802986:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  80298a:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80298d:	ba 00 02 00 00       	mov    edx,0x200
  802992:	39 d0                	cmp    eax,edx
  802994:	0f 4f c2             	cmovg  eax,edx
  802997:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(buf,bh->b_data,size);
  80299a:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80299d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8029a1:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8029a4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8029a8:	48 89 ce             	mov    rsi,rcx
  8029ab:	48 89 c7             	mov    rdi,rax
  8029ae:	e8 ee 7a 00 00       	call   80a4a1 <memcpy>
        len-=BLOCK_SIZE;
  8029b3:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        brelse(bh);
  8029ba:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8029be:	48 89 c7             	mov    rdi,rax
  8029c1:	e8 7d f9 ff ff       	call   802343 <brelse>
    }while(len>0);
  8029c6:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  8029ca:	7f ab                	jg     802977 <read_block+0x19>
    return 0;
  8029cc:	b8 00 00 00 00       	mov    eax,0x0
}
  8029d1:	c9                   	leave  
  8029d2:	c3                   	ret    

00000000008029d3 <init_vfs>:

int init_vfs()
{
  8029d3:	f3 0f 1e fa          	endbr64 
  8029d7:	55                   	push   rbp
  8029d8:	48 89 e5             	mov    rbp,rsp
  8029db:	48 83 ec 10          	sub    rsp,0x10
    //扫描块设备
    extern device *dev_tree[];
    extern device devs[];
    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
  8029df:	48 8b 05 9a 5a c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05a9a]        # 408480 <dev_tree>
  8029e6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(;p;p=p->next)
  8029ea:	eb 40                	jmp    802a2c <init_vfs+0x59>
    {
        if(scan_dev(p-devs)!=0)return -1;
  8029ec:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8029f0:	48 2d 80 2e 40 00    	sub    rax,0x402e80
  8029f6:	48 c1 f8 02          	sar    rax,0x2
  8029fa:	48 89 c2             	mov    rdx,rax
  8029fd:	48 b8 19 9c 8f c1 f9 	movabs rax,0x8f9c18f9c18f9c19
  802a04:	18 9c 8f 
  802a07:	48 0f af c2          	imul   rax,rdx
  802a0b:	89 c7                	mov    edi,eax
  802a0d:	e8 0a fe ff ff       	call   80281c <scan_dev>
  802a12:	85 c0                	test   eax,eax
  802a14:	74 07                	je     802a1d <init_vfs+0x4a>
  802a16:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802a1b:	eb 1b                	jmp    802a38 <init_vfs+0x65>
    for(;p;p=p->next)
  802a1d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802a21:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802a28:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  802a2c:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802a31:	75 b9                	jne    8029ec <init_vfs+0x19>
    }

    return 0;
  802a33:	b8 00 00 00 00       	mov    eax,0x0
}
  802a38:	c9                   	leave  
  802a39:	c3                   	ret    

0000000000802a3a <init_drvdev_man>:
    [OPERATIONS_KEYBOARD]=NULL,
    [OPERATIONS_MOUSE]=NULL
};
static int rhead=0,rtail=0;
int init_drvdev_man()
{
  802a3a:	f3 0f 1e fa          	endbr64 
  802a3e:	55                   	push   rbp
  802a3f:	48 89 e5             	mov    rbp,rsp
}
  802a42:	90                   	nop
  802a43:	5d                   	pop    rbp
  802a44:	c3                   	ret    

0000000000802a45 <load_driver>:
int load_driver(char *path)
{
  802a45:	f3 0f 1e fa          	endbr64 
  802a49:	55                   	push   rbp
  802a4a:	48 89 e5             	mov    rbp,rsp
  802a4d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    
}
  802a51:	90                   	nop
  802a52:	5d                   	pop    rbp
  802a53:	c3                   	ret    

0000000000802a54 <reg_device>:

int reg_device(device* dev)
{
  802a54:	f3 0f 1e fa          	endbr64 
  802a58:	55                   	push   rbp
  802a59:	48 89 e5             	mov    rbp,rsp
  802a5c:	53                   	push   rbx
  802a5d:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //TODO:查重

    //放入数组
    int i=0;
  802a61:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<MAX_DEVICES;i++)
  802a68:	e9 42 01 00 00       	jmp    802baf <reg_device+0x15b>
    {
        if(devs[i].flag==DEV_FLAG_EMPTY)
  802a6d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802a70:	48 63 d0             	movsxd rdx,eax
  802a73:	48 89 d0             	mov    rax,rdx
  802a76:	48 c1 e0 02          	shl    rax,0x2
  802a7a:	48 01 d0             	add    rax,rdx
  802a7d:	48 c1 e0 02          	shl    rax,0x2
  802a81:	48 01 d0             	add    rax,rdx
  802a84:	48 c1 e0 03          	shl    rax,0x3
  802a88:	48 05 90 2e 40 00    	add    rax,0x402e90
  802a8e:	8b 00                	mov    eax,DWORD PTR [rax]
  802a90:	85 c0                	test   eax,eax
  802a92:	0f 85 13 01 00 00    	jne    802bab <reg_device+0x157>
        {
            devs[i]=*dev;
  802a98:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802a9b:	48 63 d0             	movsxd rdx,eax
  802a9e:	48 89 d0             	mov    rax,rdx
  802aa1:	48 c1 e0 02          	shl    rax,0x2
  802aa5:	48 01 d0             	add    rax,rdx
  802aa8:	48 c1 e0 02          	shl    rax,0x2
  802aac:	48 01 d0             	add    rax,rdx
  802aaf:	48 c1 e0 03          	shl    rax,0x3
  802ab3:	48 8d 90 80 2e 40 00 	lea    rdx,[rax+0x402e80]
  802aba:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802abe:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802ac1:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802ac5:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802ac8:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802acc:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802ad0:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802ad4:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802ad8:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802adc:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802ae0:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802ae4:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802ae8:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802aec:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802af0:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802af4:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802af8:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802afc:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802b00:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802b04:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802b08:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802b0c:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802b10:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802b14:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802b18:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802b1c:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802b20:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802b24:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802b28:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802b2c:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802b30:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802b34:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802b38:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802b3c:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802b43:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802b4a:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802b51:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  802b58:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802b5f:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  802b66:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802b6d:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  802b74:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
  802b7b:	48 89 82 a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rax
            devs[i].flag=DEV_FLAG_USED;
  802b82:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802b85:	48 63 d0             	movsxd rdx,eax
  802b88:	48 89 d0             	mov    rax,rdx
  802b8b:	48 c1 e0 02          	shl    rax,0x2
  802b8f:	48 01 d0             	add    rax,rdx
  802b92:	48 c1 e0 02          	shl    rax,0x2
  802b96:	48 01 d0             	add    rax,rdx
  802b99:	48 c1 e0 03          	shl    rax,0x3
  802b9d:	48 05 90 2e 40 00    	add    rax,0x402e90
  802ba3:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            break;
  802ba9:	eb 0e                	jmp    802bb9 <reg_device+0x165>
    for(;i<MAX_DEVICES;i++)
  802bab:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802baf:	83 7d f4 3f          	cmp    DWORD PTR [rbp-0xc],0x3f
  802bb3:	0f 8e b4 fe ff ff    	jle    802a6d <reg_device+0x19>
        }
    }
    if(i==MAX_DEVICES)
  802bb9:	83 7d f4 40          	cmp    DWORD PTR [rbp-0xc],0x40
  802bbd:	75 0a                	jne    802bc9 <reg_device+0x175>
        return -1;
  802bbf:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802bc4:	e9 6d 01 00 00       	jmp    802d36 <reg_device+0x2e2>
    //添加到链表
    device* p=NULL,*neo=&devs[i],**pp;
  802bc9:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  802bd0:	00 
  802bd1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802bd4:	48 63 d0             	movsxd rdx,eax
  802bd7:	48 89 d0             	mov    rax,rdx
  802bda:	48 c1 e0 02          	shl    rax,0x2
  802bde:	48 01 d0             	add    rax,rdx
  802be1:	48 c1 e0 02          	shl    rax,0x2
  802be5:	48 01 d0             	add    rax,rdx
  802be8:	48 c1 e0 03          	shl    rax,0x3
  802bec:	48 05 80 2e 40 00    	add    rax,0x402e80
  802bf2:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    switch (dev->type)
  802bf6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802bfa:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802bfd:	83 f8 03             	cmp    eax,0x3
  802c00:	74 3b                	je     802c3d <reg_device+0x1e9>
  802c02:	83 f8 03             	cmp    eax,0x3
  802c05:	7f 4b                	jg     802c52 <reg_device+0x1fe>
  802c07:	83 f8 01             	cmp    eax,0x1
  802c0a:	74 07                	je     802c13 <reg_device+0x1bf>
  802c0c:	83 f8 02             	cmp    eax,0x2
  802c0f:	74 17                	je     802c28 <reg_device+0x1d4>
  802c11:	eb 3f                	jmp    802c52 <reg_device+0x1fe>
    {
    case DEV_TYPE_BLKDEV:
        p=dev_tree[DEVTREE_BLKDEVI];pp=&dev_tree[DEVTREE_BLKDEVI];
  802c13:	48 8b 05 66 58 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05866]        # 408480 <dev_tree>
  802c1a:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802c1e:	48 c7 45 e0 80 84 40 	mov    QWORD PTR [rbp-0x20],0x408480
  802c25:	00 
        break;
  802c26:	eb 34                	jmp    802c5c <reg_device+0x208>
    
    case DEV_TYPE_CHRDEV:
        p=dev_tree[DEVTREE_CHRDEVI];pp=&dev_tree[DEVTREE_CHRDEVI];
  802c28:	48 8b 05 59 58 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05859]        # 408488 <dev_tree+0x8>
  802c2f:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802c33:	48 c7 45 e0 88 84 40 	mov    QWORD PTR [rbp-0x20],0x408488
  802c3a:	00 
        break;
  802c3b:	eb 1f                	jmp    802c5c <reg_device+0x208>
        
    case DEV_TYPE_OTHERS:
        p=dev_tree[DEVTREE_OTHERDEVI];pp=&dev_tree[DEVTREE_OTHERDEVI];
  802c3d:	48 8b 05 4c 58 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0584c]        # 408490 <dev_tree+0x10>
  802c44:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802c48:	48 c7 45 e0 90 84 40 	mov    QWORD PTR [rbp-0x20],0x408490
  802c4f:	00 
        break;
  802c50:	eb 0a                	jmp    802c5c <reg_device+0x208>
    default:return -1;//不可能有其他情况
  802c52:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802c57:	e9 da 00 00 00       	jmp    802d36 <reg_device+0x2e2>
    }
    if(!p){
  802c5c:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  802c61:	75 2b                	jne    802c8e <reg_device+0x23a>
        *pp=neo;
  802c63:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802c67:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802c6b:	48 89 10             	mov    QWORD PTR [rax],rdx
        neo->prev=NULL;
  802c6e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c72:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x0
  802c79:	00 00 00 00 
  802c7d:	eb 3d                	jmp    802cbc <reg_device+0x268>
    }
    else{
        for(;p->next;p=p->next);
  802c7f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802c83:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802c8a:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802c8e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802c92:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802c99:	48 85 c0             	test   rax,rax
  802c9c:	75 e1                	jne    802c7f <reg_device+0x22b>
        p->next=neo;
  802c9e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802ca2:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802ca6:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
        neo->prev=p;
  802cad:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802cb1:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  802cb5:	48 89 90 98 00 00 00 	mov    QWORD PTR [rax+0x98],rdx
    }
    neo->next=NULL;
  802cbc:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802cc0:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x0
  802cc7:	00 00 00 00 
    //设置相应的请求函数
    switch (neo->stype)
  802ccb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802ccf:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  802cd2:	83 f8 04             	cmp    eax,0x4
  802cd5:	74 3b                	je     802d12 <reg_device+0x2be>
  802cd7:	83 f8 04             	cmp    eax,0x4
  802cda:	7f 56                	jg     802d32 <reg_device+0x2de>
  802cdc:	83 f8 03             	cmp    eax,0x3
  802cdf:	74 21                	je     802d02 <reg_device+0x2ae>
  802ce1:	83 f8 03             	cmp    eax,0x3
  802ce4:	7f 4c                	jg     802d32 <reg_device+0x2de>
  802ce6:	83 f8 01             	cmp    eax,0x1
  802ce9:	74 07                	je     802cf2 <reg_device+0x29e>
  802ceb:	83 f8 02             	cmp    eax,0x2
  802cee:	74 32                	je     802d22 <reg_device+0x2ce>
        break;
    case DEV_STYPE_TTY:
        neo->operi=OPERATIONS_TTY;
        break;
    default:
        break;
  802cf0:	eb 40                	jmp    802d32 <reg_device+0x2de>
        neo->operi=OPERATIONS_HD;
  802cf2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802cf6:	c7 80 a0 00 00 00 00 	mov    DWORD PTR [rax+0xa0],0x0
  802cfd:	00 00 00 
        break;
  802d00:	eb 31                	jmp    802d33 <reg_device+0x2df>
        neo->operi=OPERATIONS_MOUSE;
  802d02:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d06:	c7 80 a0 00 00 00 02 	mov    DWORD PTR [rax+0xa0],0x2
  802d0d:	00 00 00 
        break;
  802d10:	eb 21                	jmp    802d33 <reg_device+0x2df>
        neo->operi=OPERATIONS_KEYBOARD;
  802d12:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d16:	c7 80 a0 00 00 00 03 	mov    DWORD PTR [rax+0xa0],0x3
  802d1d:	00 00 00 
        break;
  802d20:	eb 11                	jmp    802d33 <reg_device+0x2df>
        neo->operi=OPERATIONS_TTY;
  802d22:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d26:	c7 80 a0 00 00 00 01 	mov    DWORD PTR [rax+0xa0],0x1
  802d2d:	00 00 00 
        break;
  802d30:	eb 01                	jmp    802d33 <reg_device+0x2df>
        break;
  802d32:	90                   	nop
    }
    return i;
  802d33:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  802d36:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802d3a:	c9                   	leave  
  802d3b:	c3                   	ret    

0000000000802d3c <reg_driver>:


int reg_driver(driver *drv)
{
  802d3c:	f3 0f 1e fa          	endbr64 
  802d40:	55                   	push   rbp
  802d41:	48 89 e5             	mov    rbp,rsp
  802d44:	53                   	push   rbx
  802d45:	48 89 7d e0          	mov    QWORD PTR [rbp-0x20],rdi
    for(int i=0;i<MAX_DRIVERS;i++)
  802d49:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  802d50:	e9 22 01 00 00       	jmp    802e77 <reg_driver+0x13b>
    {
        if(drvs[i].flag==DRV_FLAG_EMPTY)
  802d55:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802d58:	48 63 d0             	movsxd rdx,eax
  802d5b:	48 89 d0             	mov    rax,rdx
  802d5e:	48 c1 e0 02          	shl    rax,0x2
  802d62:	48 01 d0             	add    rax,rdx
  802d65:	48 c1 e0 05          	shl    rax,0x5
  802d69:	48 05 80 58 40 00    	add    rax,0x405880
  802d6f:	8b 00                	mov    eax,DWORD PTR [rax]
  802d71:	85 c0                	test   eax,eax
  802d73:	0f 85 fa 00 00 00    	jne    802e73 <reg_driver+0x137>
        {
            drvs[i]=*drv;
  802d79:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802d7c:	48 63 d0             	movsxd rdx,eax
  802d7f:	48 89 d0             	mov    rax,rdx
  802d82:	48 c1 e0 02          	shl    rax,0x2
  802d86:	48 01 d0             	add    rax,rdx
  802d89:	48 c1 e0 05          	shl    rax,0x5
  802d8d:	48 8d 90 80 58 40 00 	lea    rdx,[rax+0x405880]
  802d94:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802d98:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802d9b:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802d9f:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802da2:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802da6:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802daa:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802dae:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802db2:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802db6:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802dba:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802dbe:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802dc2:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802dc6:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802dca:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802dce:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802dd2:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802dd6:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802dda:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802dde:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802de2:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802de6:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802dea:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802dee:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802df2:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802df6:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802dfa:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802dfe:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802e02:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802e06:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802e0a:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802e0e:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802e12:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802e16:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802e1d:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802e24:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802e2b:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  802e32:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802e39:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  802e40:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802e47:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
            drvs[i].flag=DRV_FLAG_USED;
  802e4e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802e51:	48 63 d0             	movsxd rdx,eax
  802e54:	48 89 d0             	mov    rax,rdx
  802e57:	48 c1 e0 02          	shl    rax,0x2
  802e5b:	48 01 d0             	add    rax,rdx
  802e5e:	48 c1 e0 05          	shl    rax,0x5
  802e62:	48 05 80 58 40 00    	add    rax,0x405880
  802e68:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            return i;
  802e6e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802e71:	eb 13                	jmp    802e86 <reg_driver+0x14a>
    for(int i=0;i<MAX_DRIVERS;i++)
  802e73:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802e77:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  802e7b:	0f 8e d4 fe ff ff    	jle    802d55 <reg_driver+0x19>
        }
    }
    return -1;
  802e81:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802e86:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802e8a:	c9                   	leave  
  802e8b:	c3                   	ret    

0000000000802e8c <sys_find_dev>:

int sys_find_dev(char *name)
{
  802e8c:	f3 0f 1e fa          	endbr64 
  802e90:	55                   	push   rbp
  802e91:	48 89 e5             	mov    rbp,rsp
  802e94:	48 83 ec 20          	sub    rsp,0x20
  802e98:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_DEVICES;i++)
  802e9c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802ea3:	eb 6c                	jmp    802f11 <sys_find_dev+0x85>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802ea5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802ea8:	48 63 d0             	movsxd rdx,eax
  802eab:	48 89 d0             	mov    rax,rdx
  802eae:	48 c1 e0 02          	shl    rax,0x2
  802eb2:	48 01 d0             	add    rax,rdx
  802eb5:	48 c1 e0 02          	shl    rax,0x2
  802eb9:	48 01 d0             	add    rax,rdx
  802ebc:	48 c1 e0 03          	shl    rax,0x3
  802ec0:	48 05 90 2e 40 00    	add    rax,0x402e90
  802ec6:	8b 00                	mov    eax,DWORD PTR [rax]
  802ec8:	85 c0                	test   eax,eax
  802eca:	74 41                	je     802f0d <sys_find_dev+0x81>
  802ecc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802ecf:	48 63 d0             	movsxd rdx,eax
  802ed2:	48 89 d0             	mov    rax,rdx
  802ed5:	48 c1 e0 02          	shl    rax,0x2
  802ed9:	48 01 d0             	add    rax,rdx
  802edc:	48 c1 e0 02          	shl    rax,0x2
  802ee0:	48 01 d0             	add    rax,rdx
  802ee3:	48 c1 e0 03          	shl    rax,0x3
  802ee7:	48 83 c0 10          	add    rax,0x10
  802eeb:	48 05 80 2e 40 00    	add    rax,0x402e80
  802ef1:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802ef5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802ef9:	48 89 d6             	mov    rsi,rdx
  802efc:	48 89 c7             	mov    rdi,rax
  802eff:	e8 3b 78 00 00       	call   80a73f <strcmp>
  802f04:	85 c0                	test   eax,eax
  802f06:	75 05                	jne    802f0d <sys_find_dev+0x81>
            return i;
  802f08:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f0b:	eb 0f                	jmp    802f1c <sys_find_dev+0x90>
    for(int i=0;i<MAX_DEVICES;i++)
  802f0d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802f11:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802f15:	7e 8e                	jle    802ea5 <sys_find_dev+0x19>
    }
    return -1;
  802f17:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802f1c:	c9                   	leave  
  802f1d:	c3                   	ret    

0000000000802f1e <sys_operate_dev>:

int sys_operate_dev(char *name,int func,driver_args* args)
{
  802f1e:	f3 0f 1e fa          	endbr64 
  802f22:	55                   	push   rbp
  802f23:	48 89 e5             	mov    rbp,rsp
  802f26:	48 83 ec 30          	sub    rsp,0x30
  802f2a:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802f2e:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  802f31:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    int i=0;
  802f35:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;i<MAX_DEVICES;i++)
  802f3c:	eb 67                	jmp    802fa5 <sys_operate_dev+0x87>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802f3e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f41:	48 63 d0             	movsxd rdx,eax
  802f44:	48 89 d0             	mov    rax,rdx
  802f47:	48 c1 e0 02          	shl    rax,0x2
  802f4b:	48 01 d0             	add    rax,rdx
  802f4e:	48 c1 e0 02          	shl    rax,0x2
  802f52:	48 01 d0             	add    rax,rdx
  802f55:	48 c1 e0 03          	shl    rax,0x3
  802f59:	48 05 90 2e 40 00    	add    rax,0x402e90
  802f5f:	8b 00                	mov    eax,DWORD PTR [rax]
  802f61:	85 c0                	test   eax,eax
  802f63:	74 3c                	je     802fa1 <sys_operate_dev+0x83>
  802f65:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f68:	48 63 d0             	movsxd rdx,eax
  802f6b:	48 89 d0             	mov    rax,rdx
  802f6e:	48 c1 e0 02          	shl    rax,0x2
  802f72:	48 01 d0             	add    rax,rdx
  802f75:	48 c1 e0 02          	shl    rax,0x2
  802f79:	48 01 d0             	add    rax,rdx
  802f7c:	48 c1 e0 03          	shl    rax,0x3
  802f80:	48 83 c0 10          	add    rax,0x10
  802f84:	48 05 80 2e 40 00    	add    rax,0x402e80
  802f8a:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802f8e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802f92:	48 89 d6             	mov    rsi,rdx
  802f95:	48 89 c7             	mov    rdi,rax
  802f98:	e8 a2 77 00 00       	call   80a73f <strcmp>
  802f9d:	85 c0                	test   eax,eax
  802f9f:	74 0c                	je     802fad <sys_operate_dev+0x8f>
    for(;i<MAX_DEVICES;i++)
  802fa1:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802fa5:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802fa9:	7e 93                	jle    802f3e <sys_operate_dev+0x20>
  802fab:	eb 01                	jmp    802fae <sys_operate_dev+0x90>
            break;
  802fad:	90                   	nop
    }
    if(i==MAX_DEVICES)return -1;
  802fae:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  802fb2:	75 0a                	jne    802fbe <sys_operate_dev+0xa0>
  802fb4:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802fb9:	e9 9c 02 00 00       	jmp    80325a <sys_operate_dev+0x33c>
    switch (func) {
  802fbe:	83 7d e4 0b          	cmp    DWORD PTR [rbp-0x1c],0xb
  802fc2:	0f 87 8d 02 00 00    	ja     803255 <sys_operate_dev+0x337>
  802fc8:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  802fcb:	48 8b 04 c5 e8 29 81 	mov    rax,QWORD PTR [rax*8+0x8129e8]
  802fd2:	00 
  802fd3:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return devs[i].drv->open(args);
  802fd6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802fd9:	48 63 d0             	movsxd rdx,eax
  802fdc:	48 89 d0             	mov    rax,rdx
  802fdf:	48 c1 e0 02          	shl    rax,0x2
  802fe3:	48 01 d0             	add    rax,rdx
  802fe6:	48 c1 e0 02          	shl    rax,0x2
  802fea:	48 01 d0             	add    rax,rdx
  802fed:	48 c1 e0 03          	shl    rax,0x3
  802ff1:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802ff7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802ffa:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  802ffe:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803002:	48 89 c7             	mov    rdi,rax
  803005:	ff d2                	call   rdx
  803007:	e9 4e 02 00 00       	jmp    80325a <sys_operate_dev+0x33c>
        case DRVF_CLOSE:return devs[i].drv->close(args);
  80300c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80300f:	48 63 d0             	movsxd rdx,eax
  803012:	48 89 d0             	mov    rax,rdx
  803015:	48 c1 e0 02          	shl    rax,0x2
  803019:	48 01 d0             	add    rax,rdx
  80301c:	48 c1 e0 02          	shl    rax,0x2
  803020:	48 01 d0             	add    rax,rdx
  803023:	48 c1 e0 03          	shl    rax,0x3
  803027:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80302d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803030:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  803034:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803038:	48 89 c7             	mov    rdi,rax
  80303b:	ff d2                	call   rdx
  80303d:	e9 18 02 00 00       	jmp    80325a <sys_operate_dev+0x33c>
        case DRVF_READ :return devs[i].drv->read(args);
  803042:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803045:	48 63 d0             	movsxd rdx,eax
  803048:	48 89 d0             	mov    rax,rdx
  80304b:	48 c1 e0 02          	shl    rax,0x2
  80304f:	48 01 d0             	add    rax,rdx
  803052:	48 c1 e0 02          	shl    rax,0x2
  803056:	48 01 d0             	add    rax,rdx
  803059:	48 c1 e0 03          	shl    rax,0x3
  80305d:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803063:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803066:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  80306a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80306e:	48 89 c7             	mov    rdi,rax
  803071:	ff d2                	call   rdx
  803073:	e9 e2 01 00 00       	jmp    80325a <sys_operate_dev+0x33c>
        case DRVF_WRITE:return devs[i].drv->write(args);
  803078:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80307b:	48 63 d0             	movsxd rdx,eax
  80307e:	48 89 d0             	mov    rax,rdx
  803081:	48 c1 e0 02          	shl    rax,0x2
  803085:	48 01 d0             	add    rax,rdx
  803088:	48 c1 e0 02          	shl    rax,0x2
  80308c:	48 01 d0             	add    rax,rdx
  80308f:	48 c1 e0 03          	shl    rax,0x3
  803093:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803099:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80309c:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  8030a0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8030a4:	48 89 c7             	mov    rdi,rax
  8030a7:	ff d2                	call   rdx
  8030a9:	e9 ac 01 00 00       	jmp    80325a <sys_operate_dev+0x33c>
        case DRVF_CHK  :return devs[i].drv->check(args);
  8030ae:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8030b1:	48 63 d0             	movsxd rdx,eax
  8030b4:	48 89 d0             	mov    rax,rdx
  8030b7:	48 c1 e0 02          	shl    rax,0x2
  8030bb:	48 01 d0             	add    rax,rdx
  8030be:	48 c1 e0 02          	shl    rax,0x2
  8030c2:	48 01 d0             	add    rax,rdx
  8030c5:	48 c1 e0 03          	shl    rax,0x3
  8030c9:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8030cf:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8030d2:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  8030d6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8030da:	48 89 c7             	mov    rdi,rax
  8030dd:	ff d2                	call   rdx
  8030df:	e9 76 01 00 00       	jmp    80325a <sys_operate_dev+0x33c>
        case DRVF_RSVD :return devs[i].drv->reserved(args);
  8030e4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8030e7:	48 63 d0             	movsxd rdx,eax
  8030ea:	48 89 d0             	mov    rax,rdx
  8030ed:	48 c1 e0 02          	shl    rax,0x2
  8030f1:	48 01 d0             	add    rax,rdx
  8030f4:	48 c1 e0 02          	shl    rax,0x2
  8030f8:	48 01 d0             	add    rax,rdx
  8030fb:	48 c1 e0 03          	shl    rax,0x3
  8030ff:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803105:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803108:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
  80310c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803110:	48 89 c7             	mov    rdi,rax
  803113:	ff d2                	call   rdx
  803115:	e9 40 01 00 00       	jmp    80325a <sys_operate_dev+0x33c>
        case DRVF_INT  :return devs[i].drv->inthandler(args);
  80311a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80311d:	48 63 d0             	movsxd rdx,eax
  803120:	48 89 d0             	mov    rax,rdx
  803123:	48 c1 e0 02          	shl    rax,0x2
  803127:	48 01 d0             	add    rax,rdx
  80312a:	48 c1 e0 02          	shl    rax,0x2
  80312e:	48 01 d0             	add    rax,rdx
  803131:	48 c1 e0 03          	shl    rax,0x3
  803135:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80313b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80313e:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
  803142:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803146:	48 89 c7             	mov    rdi,rax
  803149:	ff d2                	call   rdx
  80314b:	e9 0a 01 00 00       	jmp    80325a <sys_operate_dev+0x33c>
        case DRVF_FIND :return devs[i].drv->find(args);
  803150:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803153:	48 63 d0             	movsxd rdx,eax
  803156:	48 89 d0             	mov    rax,rdx
  803159:	48 c1 e0 02          	shl    rax,0x2
  80315d:	48 01 d0             	add    rax,rdx
  803160:	48 c1 e0 02          	shl    rax,0x2
  803164:	48 01 d0             	add    rax,rdx
  803167:	48 c1 e0 03          	shl    rax,0x3
  80316b:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803171:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803174:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  803178:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80317c:	48 89 c7             	mov    rdi,rax
  80317f:	ff d2                	call   rdx
  803181:	e9 d4 00 00 00       	jmp    80325a <sys_operate_dev+0x33c>
        case DRVF_RM   :return devs[i].drv->rm(args);
  803186:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803189:	48 63 d0             	movsxd rdx,eax
  80318c:	48 89 d0             	mov    rax,rdx
  80318f:	48 c1 e0 02          	shl    rax,0x2
  803193:	48 01 d0             	add    rax,rdx
  803196:	48 c1 e0 02          	shl    rax,0x2
  80319a:	48 01 d0             	add    rax,rdx
  80319d:	48 c1 e0 03          	shl    rax,0x3
  8031a1:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8031a7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8031aa:	48 8b 50 48          	mov    rdx,QWORD PTR [rax+0x48]
  8031ae:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8031b2:	48 89 c7             	mov    rdi,rax
  8031b5:	ff d2                	call   rdx
  8031b7:	e9 9e 00 00 00       	jmp    80325a <sys_operate_dev+0x33c>
        case DRVF_TOUCH:return devs[i].drv->touch(args);
  8031bc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8031bf:	48 63 d0             	movsxd rdx,eax
  8031c2:	48 89 d0             	mov    rax,rdx
  8031c5:	48 c1 e0 02          	shl    rax,0x2
  8031c9:	48 01 d0             	add    rax,rdx
  8031cc:	48 c1 e0 02          	shl    rax,0x2
  8031d0:	48 01 d0             	add    rax,rdx
  8031d3:	48 c1 e0 03          	shl    rax,0x3
  8031d7:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8031dd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8031e0:	48 8b 50 50          	mov    rdx,QWORD PTR [rax+0x50]
  8031e4:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8031e8:	48 89 c7             	mov    rdi,rax
  8031eb:	ff d2                	call   rdx
  8031ed:	eb 6b                	jmp    80325a <sys_operate_dev+0x33c>
        case DRVF_MKDIR:return devs[i].drv->mkdir(args);
  8031ef:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8031f2:	48 63 d0             	movsxd rdx,eax
  8031f5:	48 89 d0             	mov    rax,rdx
  8031f8:	48 c1 e0 02          	shl    rax,0x2
  8031fc:	48 01 d0             	add    rax,rdx
  8031ff:	48 c1 e0 02          	shl    rax,0x2
  803203:	48 01 d0             	add    rax,rdx
  803206:	48 c1 e0 03          	shl    rax,0x3
  80320a:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803210:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803213:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  803217:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80321b:	48 89 c7             	mov    rdi,rax
  80321e:	ff d2                	call   rdx
  803220:	eb 38                	jmp    80325a <sys_operate_dev+0x33c>
        case DRVF_LS:return    devs[i].drv->ls(args);
  803222:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803225:	48 63 d0             	movsxd rdx,eax
  803228:	48 89 d0             	mov    rax,rdx
  80322b:	48 c1 e0 02          	shl    rax,0x2
  80322f:	48 01 d0             	add    rax,rdx
  803232:	48 c1 e0 02          	shl    rax,0x2
  803236:	48 01 d0             	add    rax,rdx
  803239:	48 c1 e0 03          	shl    rax,0x3
  80323d:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803243:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803246:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
  80324a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80324e:	48 89 c7             	mov    rdi,rax
  803251:	ff d2                	call   rdx
  803253:	eb 05                	jmp    80325a <sys_operate_dev+0x33c>
    }
    return -1;
  803255:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  80325a:	c9                   	leave  
  80325b:	c3                   	ret    

000000000080325c <call_drv_func>:
int call_drv_func(int drv_n,int func_n,driver_args *args)
{
  80325c:	f3 0f 1e fa          	endbr64 
  803260:	55                   	push   rbp
  803261:	48 89 e5             	mov    rbp,rsp
  803264:	48 83 ec 10          	sub    rsp,0x10
  803268:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  80326b:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  80326e:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    if(drvs[drv_n].flag==DRV_FLAG_EMPTY)return -1;
  803272:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803275:	48 63 d0             	movsxd rdx,eax
  803278:	48 89 d0             	mov    rax,rdx
  80327b:	48 c1 e0 02          	shl    rax,0x2
  80327f:	48 01 d0             	add    rax,rdx
  803282:	48 c1 e0 05          	shl    rax,0x5
  803286:	48 05 80 58 40 00    	add    rax,0x405880
  80328c:	8b 00                	mov    eax,DWORD PTR [rax]
  80328e:	85 c0                	test   eax,eax
  803290:	75 0a                	jne    80329c <call_drv_func+0x40>
  803292:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803297:	e9 15 02 00 00       	jmp    8034b1 <call_drv_func+0x255>
    /*driverfunc f=drvs[drv_n].func_thunk[func_n];
    return f(args);*/
    switch (func_n) {
  80329c:	83 7d f8 0b          	cmp    DWORD PTR [rbp-0x8],0xb
  8032a0:	0f 87 06 02 00 00    	ja     8034ac <call_drv_func+0x250>
  8032a6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8032a9:	48 8b 04 c5 48 2a 81 	mov    rax,QWORD PTR [rax*8+0x812a48]
  8032b0:	00 
  8032b1:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return drvs[drv_n].open(args);
  8032b4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032b7:	48 63 d0             	movsxd rdx,eax
  8032ba:	48 89 d0             	mov    rax,rdx
  8032bd:	48 c1 e0 02          	shl    rax,0x2
  8032c1:	48 01 d0             	add    rax,rdx
  8032c4:	48 c1 e0 05          	shl    rax,0x5
  8032c8:	48 05 88 58 40 00    	add    rax,0x405888
  8032ce:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8032d1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8032d5:	48 89 c7             	mov    rdi,rax
  8032d8:	ff d2                	call   rdx
  8032da:	e9 d2 01 00 00       	jmp    8034b1 <call_drv_func+0x255>
        case DRVF_CLOSE:return drvs[drv_n].close(args);
  8032df:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032e2:	48 63 d0             	movsxd rdx,eax
  8032e5:	48 89 d0             	mov    rax,rdx
  8032e8:	48 c1 e0 02          	shl    rax,0x2
  8032ec:	48 01 d0             	add    rax,rdx
  8032ef:	48 c1 e0 05          	shl    rax,0x5
  8032f3:	48 05 90 58 40 00    	add    rax,0x405890
  8032f9:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8032fc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803300:	48 89 c7             	mov    rdi,rax
  803303:	ff d2                	call   rdx
  803305:	e9 a7 01 00 00       	jmp    8034b1 <call_drv_func+0x255>
        case DRVF_READ :return drvs[drv_n].read(args);
  80330a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80330d:	48 63 d0             	movsxd rdx,eax
  803310:	48 89 d0             	mov    rax,rdx
  803313:	48 c1 e0 02          	shl    rax,0x2
  803317:	48 01 d0             	add    rax,rdx
  80331a:	48 c1 e0 05          	shl    rax,0x5
  80331e:	48 05 98 58 40 00    	add    rax,0x405898
  803324:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803327:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80332b:	48 89 c7             	mov    rdi,rax
  80332e:	ff d2                	call   rdx
  803330:	e9 7c 01 00 00       	jmp    8034b1 <call_drv_func+0x255>
        case DRVF_WRITE:return drvs[drv_n].write(args);
  803335:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803338:	48 63 d0             	movsxd rdx,eax
  80333b:	48 89 d0             	mov    rax,rdx
  80333e:	48 c1 e0 02          	shl    rax,0x2
  803342:	48 01 d0             	add    rax,rdx
  803345:	48 c1 e0 05          	shl    rax,0x5
  803349:	48 05 a0 58 40 00    	add    rax,0x4058a0
  80334f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803352:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803356:	48 89 c7             	mov    rdi,rax
  803359:	ff d2                	call   rdx
  80335b:	e9 51 01 00 00       	jmp    8034b1 <call_drv_func+0x255>
        case DRVF_CHK  :return drvs[drv_n].check(args);
  803360:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803363:	48 63 d0             	movsxd rdx,eax
  803366:	48 89 d0             	mov    rax,rdx
  803369:	48 c1 e0 02          	shl    rax,0x2
  80336d:	48 01 d0             	add    rax,rdx
  803370:	48 c1 e0 05          	shl    rax,0x5
  803374:	48 05 a8 58 40 00    	add    rax,0x4058a8
  80337a:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80337d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803381:	48 89 c7             	mov    rdi,rax
  803384:	ff d2                	call   rdx
  803386:	e9 26 01 00 00       	jmp    8034b1 <call_drv_func+0x255>
        case DRVF_RSVD :return drvs[drv_n].reserved(args);
  80338b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80338e:	48 63 d0             	movsxd rdx,eax
  803391:	48 89 d0             	mov    rax,rdx
  803394:	48 c1 e0 02          	shl    rax,0x2
  803398:	48 01 d0             	add    rax,rdx
  80339b:	48 c1 e0 05          	shl    rax,0x5
  80339f:	48 05 b0 58 40 00    	add    rax,0x4058b0
  8033a5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8033a8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033ac:	48 89 c7             	mov    rdi,rax
  8033af:	ff d2                	call   rdx
  8033b1:	e9 fb 00 00 00       	jmp    8034b1 <call_drv_func+0x255>
        case DRVF_INT  :return drvs[drv_n].inthandler(args);
  8033b6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8033b9:	48 63 d0             	movsxd rdx,eax
  8033bc:	48 89 d0             	mov    rax,rdx
  8033bf:	48 c1 e0 02          	shl    rax,0x2
  8033c3:	48 01 d0             	add    rax,rdx
  8033c6:	48 c1 e0 05          	shl    rax,0x5
  8033ca:	48 05 b8 58 40 00    	add    rax,0x4058b8
  8033d0:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8033d3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033d7:	48 89 c7             	mov    rdi,rax
  8033da:	ff d2                	call   rdx
  8033dc:	e9 d0 00 00 00       	jmp    8034b1 <call_drv_func+0x255>
        case DRVF_FIND :return drvs[drv_n].find(args);
  8033e1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8033e4:	48 63 d0             	movsxd rdx,eax
  8033e7:	48 89 d0             	mov    rax,rdx
  8033ea:	48 c1 e0 02          	shl    rax,0x2
  8033ee:	48 01 d0             	add    rax,rdx
  8033f1:	48 c1 e0 05          	shl    rax,0x5
  8033f5:	48 05 c0 58 40 00    	add    rax,0x4058c0
  8033fb:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8033fe:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803402:	48 89 c7             	mov    rdi,rax
  803405:	ff d2                	call   rdx
  803407:	e9 a5 00 00 00       	jmp    8034b1 <call_drv_func+0x255>
        case DRVF_RM   :return drvs[drv_n].rm(args);
  80340c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80340f:	48 63 d0             	movsxd rdx,eax
  803412:	48 89 d0             	mov    rax,rdx
  803415:	48 c1 e0 02          	shl    rax,0x2
  803419:	48 01 d0             	add    rax,rdx
  80341c:	48 c1 e0 05          	shl    rax,0x5
  803420:	48 05 c8 58 40 00    	add    rax,0x4058c8
  803426:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803429:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80342d:	48 89 c7             	mov    rdi,rax
  803430:	ff d2                	call   rdx
  803432:	eb 7d                	jmp    8034b1 <call_drv_func+0x255>
        case DRVF_TOUCH:return drvs[drv_n].touch(args);
  803434:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803437:	48 63 d0             	movsxd rdx,eax
  80343a:	48 89 d0             	mov    rax,rdx
  80343d:	48 c1 e0 02          	shl    rax,0x2
  803441:	48 01 d0             	add    rax,rdx
  803444:	48 c1 e0 05          	shl    rax,0x5
  803448:	48 05 d0 58 40 00    	add    rax,0x4058d0
  80344e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803451:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803455:	48 89 c7             	mov    rdi,rax
  803458:	ff d2                	call   rdx
  80345a:	eb 55                	jmp    8034b1 <call_drv_func+0x255>
        case DRVF_MKDIR:return drvs[drv_n].mkdir(args);
  80345c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80345f:	48 63 d0             	movsxd rdx,eax
  803462:	48 89 d0             	mov    rax,rdx
  803465:	48 c1 e0 02          	shl    rax,0x2
  803469:	48 01 d0             	add    rax,rdx
  80346c:	48 c1 e0 05          	shl    rax,0x5
  803470:	48 05 d8 58 40 00    	add    rax,0x4058d8
  803476:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803479:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80347d:	48 89 c7             	mov    rdi,rax
  803480:	ff d2                	call   rdx
  803482:	eb 2d                	jmp    8034b1 <call_drv_func+0x255>
        case DRVF_LS:return drvs[drv_n].ls(args);
  803484:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803487:	48 63 d0             	movsxd rdx,eax
  80348a:	48 89 d0             	mov    rax,rdx
  80348d:	48 c1 e0 02          	shl    rax,0x2
  803491:	48 01 d0             	add    rax,rdx
  803494:	48 c1 e0 05          	shl    rax,0x5
  803498:	48 05 e0 58 40 00    	add    rax,0x4058e0
  80349e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8034a1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8034a5:	48 89 c7             	mov    rdi,rax
  8034a8:	ff d2                	call   rdx
  8034aa:	eb 05                	jmp    8034b1 <call_drv_func+0x255>
    }
    return -1;
  8034ac:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8034b1:	c9                   	leave  
  8034b2:	c3                   	ret    

00000000008034b3 <dispose_device>:
int dispose_device(int dev){
  8034b3:	f3 0f 1e fa          	endbr64 
  8034b7:	55                   	push   rbp
  8034b8:	48 89 e5             	mov    rbp,rsp
  8034bb:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(devs[dev].flag!=DEV_FLAG_USED)return -1;
  8034be:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8034c1:	48 63 d0             	movsxd rdx,eax
  8034c4:	48 89 d0             	mov    rax,rdx
  8034c7:	48 c1 e0 02          	shl    rax,0x2
  8034cb:	48 01 d0             	add    rax,rdx
  8034ce:	48 c1 e0 02          	shl    rax,0x2
  8034d2:	48 01 d0             	add    rax,rdx
  8034d5:	48 c1 e0 03          	shl    rax,0x3
  8034d9:	48 05 90 2e 40 00    	add    rax,0x402e90
  8034df:	8b 00                	mov    eax,DWORD PTR [rax]
  8034e1:	83 f8 01             	cmp    eax,0x1
  8034e4:	74 07                	je     8034ed <dispose_device+0x3a>
  8034e6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8034eb:	eb 62                	jmp    80354f <dispose_device+0x9c>
    device* p=&devs[dev];
  8034ed:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8034f0:	48 63 d0             	movsxd rdx,eax
  8034f3:	48 89 d0             	mov    rax,rdx
  8034f6:	48 c1 e0 02          	shl    rax,0x2
  8034fa:	48 01 d0             	add    rax,rdx
  8034fd:	48 c1 e0 02          	shl    rax,0x2
  803501:	48 01 d0             	add    rax,rdx
  803504:	48 c1 e0 03          	shl    rax,0x3
  803508:	48 05 80 2e 40 00    	add    rax,0x402e80
  80350e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //从链表删除
    if(p->prev)p->prev->next=p->next;
  803512:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803516:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  80351d:	48 85 c0             	test   rax,rax
  803520:	74 1d                	je     80353f <dispose_device+0x8c>
  803522:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803526:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  80352d:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  803531:	48 8b 92 90 00 00 00 	mov    rdx,QWORD PTR [rdx+0x90]
  803538:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
    p->flag=DEV_FLAG_EMPTY;
  80353f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803543:	c7 40 10 00 00 00 00 	mov    DWORD PTR [rax+0x10],0x0
    return 0;
  80354a:	b8 00 00 00 00       	mov    eax,0x0
}
  80354f:	5d                   	pop    rbp
  803550:	c3                   	ret    

0000000000803551 <dispose_driver>:
int dispose_driver(driver *drv){
  803551:	f3 0f 1e fa          	endbr64 
  803555:	55                   	push   rbp
  803556:	48 89 e5             	mov    rbp,rsp
  803559:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  80355d:	90                   	nop
  80355e:	5d                   	pop    rbp
  80355f:	c3                   	ret    

0000000000803560 <get_dev>:

device *get_dev(int devi)
{
  803560:	f3 0f 1e fa          	endbr64 
  803564:	55                   	push   rbp
  803565:	48 89 e5             	mov    rbp,rsp
  803568:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &devs[devi];
  80356b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80356e:	48 63 d0             	movsxd rdx,eax
  803571:	48 89 d0             	mov    rax,rdx
  803574:	48 c1 e0 02          	shl    rax,0x2
  803578:	48 01 d0             	add    rax,rdx
  80357b:	48 c1 e0 02          	shl    rax,0x2
  80357f:	48 01 d0             	add    rax,rdx
  803582:	48 c1 e0 03          	shl    rax,0x3
  803586:	48 05 80 2e 40 00    	add    rax,0x402e80
}
  80358c:	5d                   	pop    rbp
  80358d:	c3                   	ret    

000000000080358e <get_drv>:
driver *get_drv(int drvi)
{
  80358e:	f3 0f 1e fa          	endbr64 
  803592:	55                   	push   rbp
  803593:	48 89 e5             	mov    rbp,rsp
  803596:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &drvs[drvi];
  803599:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80359c:	48 63 d0             	movsxd rdx,eax
  80359f:	48 89 d0             	mov    rax,rdx
  8035a2:	48 c1 e0 02          	shl    rax,0x2
  8035a6:	48 01 d0             	add    rax,rdx
  8035a9:	48 c1 e0 05          	shl    rax,0x5
  8035ad:	48 05 80 58 40 00    	add    rax,0x405880
}
  8035b3:	5d                   	pop    rbp
  8035b4:	c3                   	ret    

00000000008035b5 <make_request>:

//发送一个操作设备的申请
int make_request(driver_args* args)
{
  8035b5:	f3 0f 1e fa          	endbr64 
  8035b9:	55                   	push   rbp
  8035ba:	48 89 e5             	mov    rbp,rsp
  8035bd:	53                   	push   rbx
  8035be:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //在数组中寻找空项
    int i=0;
  8035c2:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<NR_REQS;i++)
  8035c9:	eb 23                	jmp    8035ee <make_request+0x39>
    {
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  8035cb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8035ce:	48 63 d0             	movsxd rdx,eax
  8035d1:	48 89 d0             	mov    rax,rdx
  8035d4:	48 01 c0             	add    rax,rax
  8035d7:	48 01 d0             	add    rax,rdx
  8035da:	48 c1 e0 06          	shl    rax,0x6
  8035de:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  8035e4:	8b 00                	mov    eax,DWORD PTR [rax]
  8035e6:	85 c0                	test   eax,eax
  8035e8:	74 0c                	je     8035f6 <make_request+0x41>
    for(;i<NR_REQS;i++)
  8035ea:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8035ee:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  8035f2:	7e d7                	jle    8035cb <make_request+0x16>
  8035f4:	eb 01                	jmp    8035f7 <make_request+0x42>
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  8035f6:	90                   	nop
    }
    if(i==NR_REQS)return -1;//满了
  8035f7:	83 7d f4 20          	cmp    DWORD PTR [rbp-0xc],0x20
  8035fb:	75 0a                	jne    803607 <make_request+0x52>
  8035fd:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803602:	e9 e7 01 00 00       	jmp    8037ee <make_request+0x239>
    reqs[i]=*args;//放入数组
  803607:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80360a:	48 63 d0             	movsxd rdx,eax
  80360d:	48 89 d0             	mov    rax,rdx
  803610:	48 01 c0             	add    rax,rax
  803613:	48 01 d0             	add    rax,rdx
  803616:	48 c1 e0 06          	shl    rax,0x6
  80361a:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803621:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803625:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  803628:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  80362c:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  80362f:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  803633:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  803637:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  80363b:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  80363f:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  803643:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  803647:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  80364b:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  80364f:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  803653:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  803657:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  80365b:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  80365f:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  803663:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  803667:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  80366b:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  80366f:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  803673:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  803677:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  80367b:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  80367f:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  803683:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  803687:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  80368b:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  80368f:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  803693:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  803697:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  80369b:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  80369f:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  8036a3:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  8036aa:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  8036b1:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  8036b8:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  8036bf:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  8036c6:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  8036cd:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  8036d4:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  8036db:	48 8b 88 a0 00 00 00 	mov    rcx,QWORD PTR [rax+0xa0]
  8036e2:	48 8b 98 a8 00 00 00 	mov    rbx,QWORD PTR [rax+0xa8]
  8036e9:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  8036f0:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  8036f7:	48 8b 88 b0 00 00 00 	mov    rcx,QWORD PTR [rax+0xb0]
  8036fe:	48 8b 98 b8 00 00 00 	mov    rbx,QWORD PTR [rax+0xb8]
  803705:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  80370c:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
    //插入具体设备的等待链表中
    device* dev=&devs[args->dev];
  803713:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803717:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  80371d:	48 63 d0             	movsxd rdx,eax
  803720:	48 89 d0             	mov    rax,rdx
  803723:	48 c1 e0 02          	shl    rax,0x2
  803727:	48 01 d0             	add    rax,rdx
  80372a:	48 c1 e0 02          	shl    rax,0x2
  80372e:	48 01 d0             	add    rax,rdx
  803731:	48 c1 e0 03          	shl    rax,0x3
  803735:	48 05 80 2e 40 00    	add    rax,0x402e80
  80373b:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!dev->waiting_reqs)//空的等待队列
  80373f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803743:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  80374a:	48 85 c0             	test   rax,rax
  80374d:	75 27                	jne    803776 <make_request+0x1c1>
        dev->waiting_reqs=&reqs[i];
  80374f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803752:	48 63 d0             	movsxd rdx,eax
  803755:	48 89 d0             	mov    rax,rdx
  803758:	48 01 c0             	add    rax,rax
  80375b:	48 01 d0             	add    rax,rdx
  80375e:	48 c1 e0 06          	shl    rax,0x6
  803762:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803769:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80376d:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
  803774:	eb 75                	jmp    8037eb <make_request+0x236>
    else{
        driver_args* p=dev->waiting_reqs;
  803776:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80377a:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803781:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        for(;p->next;p=p->next);
  803785:	eb 0f                	jmp    803796 <make_request+0x1e1>
  803787:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80378b:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  803792:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  803796:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80379a:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  8037a1:	48 85 c0             	test   rax,rax
  8037a4:	75 e1                	jne    803787 <make_request+0x1d2>
        p->next=&reqs[i];
  8037a6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8037a9:	48 63 d0             	movsxd rdx,eax
  8037ac:	48 89 d0             	mov    rax,rdx
  8037af:	48 01 c0             	add    rax,rax
  8037b2:	48 01 d0             	add    rax,rdx
  8037b5:	48 c1 e0 06          	shl    rax,0x6
  8037b9:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  8037c0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8037c4:	48 89 90 b8 00 00 00 	mov    QWORD PTR [rax+0xb8],rdx
        reqs[i].next=NULL;
  8037cb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8037ce:	48 63 d0             	movsxd rdx,eax
  8037d1:	48 89 d0             	mov    rax,rdx
  8037d4:	48 01 c0             	add    rax,rax
  8037d7:	48 01 d0             	add    rax,rdx
  8037da:	48 c1 e0 06          	shl    rax,0x6
  8037de:	48 05 38 6d 40 00    	add    rax,0x406d38
  8037e4:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }

    return i;
  8037eb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  8037ee:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8037f2:	c9                   	leave  
  8037f3:	c3                   	ret    

00000000008037f4 <do_req>:
//取出一个申请并且执行
int do_req()
{
  8037f4:	f3 0f 1e fa          	endbr64 
  8037f8:	55                   	push   rbp
  8037f9:	48 89 e5             	mov    rbp,rsp
  8037fc:	48 83 ec 10          	sub    rsp,0x10
    //查看每个设备的请求情况
    //块设备
    for(int i=0;i<3;i++)
  803800:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803807:	e9 ab 00 00 00       	jmp    8038b7 <do_req+0xc3>
    {
        device* p=dev_tree[i];
  80380c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80380f:	48 98                	cdqe   
  803811:	48 8b 04 c5 80 84 40 	mov    rax,QWORD PTR [rax*8+0x408480]
  803818:	00 
  803819:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(;p;p=p->next)
  80381d:	e9 86 00 00 00       	jmp    8038a8 <do_req+0xb4>
        {
            //如果没有请求运行而且有请求要运行
            if(!p->running_req&&p->waiting_reqs)
  803822:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803826:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  80382d:	48 85 c0             	test   rax,rax
  803830:	75 67                	jne    803899 <do_req+0xa5>
  803832:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803836:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  80383d:	48 85 c0             	test   rax,rax
  803840:	74 57                	je     803899 <do_req+0xa5>
            {
                p->running_req=p->waiting_reqs;
  803842:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803846:	48 8b 90 88 00 00 00 	mov    rdx,QWORD PTR [rax+0x88]
  80384d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803851:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
                p->waiting_reqs=p->waiting_reqs->next;//取出一个
  803858:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80385c:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803863:	48 8b 90 b8 00 00 00 	mov    rdx,QWORD PTR [rax+0xb8]
  80386a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80386e:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
                dev_funcs[p->operi](p->running_req);
  803875:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803879:	8b 80 a0 00 00 00    	mov    eax,DWORD PTR [rax+0xa0]
  80387f:	48 98                	cdqe   
  803881:	48 8b 14 c5 a0 ae 80 	mov    rdx,QWORD PTR [rax*8+0x80aea0]
  803888:	00 
  803889:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80388d:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  803894:	48 89 c7             	mov    rdi,rax
  803897:	ff d2                	call   rdx
        for(;p;p=p->next)
  803899:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80389d:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  8038a4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  8038a8:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  8038ad:	0f 85 6f ff ff ff    	jne    803822 <do_req+0x2e>
    for(int i=0;i<3;i++)
  8038b3:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8038b7:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  8038bb:	0f 8e 4b ff ff ff    	jle    80380c <do_req+0x18>
            }
            //如果还在运行（DONE的状态不能直接覆盖，因为里面的运行结果可能还没被拿走）
        }
    }
    
    return 0;
  8038c1:	b8 00 00 00 00       	mov    eax,0x0
}
  8038c6:	c9                   	leave  
  8038c7:	c3                   	ret    

00000000008038c8 <wait_on_req>:


void wait_on_req(int reqi)
{
  8038c8:	f3 0f 1e fa          	endbr64 
  8038cc:	55                   	push   rbp
  8038cd:	48 89 e5             	mov    rbp,rsp
  8038d0:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(reqs[reqi].stat!=REQ_STAT_DONE);
  8038d3:	90                   	nop
  8038d4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8038d7:	48 63 d0             	movsxd rdx,eax
  8038da:	48 89 d0             	mov    rax,rdx
  8038dd:	48 01 c0             	add    rax,rax
  8038e0:	48 01 d0             	add    rax,rdx
  8038e3:	48 c1 e0 06          	shl    rax,0x6
  8038e7:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  8038ed:	8b 00                	mov    eax,DWORD PTR [rax]
  8038ef:	83 f8 03             	cmp    eax,0x3
  8038f2:	75 e0                	jne    8038d4 <wait_on_req+0xc>
}
  8038f4:	90                   	nop
  8038f5:	90                   	nop
  8038f6:	5d                   	pop    rbp
  8038f7:	c3                   	ret    

00000000008038f8 <clear_req>:
void clear_req(int reqi)
{
  8038f8:	f3 0f 1e fa          	endbr64 
  8038fc:	55                   	push   rbp
  8038fd:	48 89 e5             	mov    rbp,rsp
  803900:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    reqs[reqi].stat=REQ_STAT_EMPTY;
  803903:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803906:	48 63 d0             	movsxd rdx,eax
  803909:	48 89 d0             	mov    rax,rdx
  80390c:	48 01 c0             	add    rax,rax
  80390f:	48 01 d0             	add    rax,rdx
  803912:	48 c1 e0 06          	shl    rax,0x6
  803916:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  80391c:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  803922:	90                   	nop
  803923:	5d                   	pop    rbp
  803924:	c3                   	ret    

0000000000803925 <init_proc>:
TSS scene_saver;
TSS *tss=0x108000;
int cur_proc=0;
int pidd=0;
int palloc_paddr=0;
void init_proc(){
  803925:	f3 0f 1e fa          	endbr64 
  803929:	55                   	push   rbp
  80392a:	48 89 e5             	mov    rbp,rsp
  80392d:	48 83 ec 10          	sub    rsp,0x10
    //task=(struct process*)get_global_var(TASK_PCBS_ADDR);//[MAX_TASKS];;
    for(int i=0;i<MAX_PROC_COUNT;i++){
  803931:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803938:	eb 61                	jmp    80399b <init_proc+0x76>
        task[i].pid=-1;
  80393a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80393d:	48 63 d0             	movsxd rdx,eax
  803940:	48 89 d0             	mov    rax,rdx
  803943:	48 01 c0             	add    rax,rax
  803946:	48 01 d0             	add    rax,rdx
  803949:	48 c1 e0 08          	shl    rax,0x8
  80394d:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803953:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
        task[i].stat=ENDED;
  803959:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80395c:	48 63 d0             	movsxd rdx,eax
  80395f:	48 89 d0             	mov    rax,rdx
  803962:	48 01 c0             	add    rax,rax
  803965:	48 01 d0             	add    rax,rdx
  803968:	48 c1 e0 08          	shl    rax,0x8
  80396c:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803972:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
        task[i].parent_pid=-1;
  803978:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80397b:	48 63 d0             	movsxd rdx,eax
  80397e:	48 89 d0             	mov    rax,rdx
  803981:	48 01 c0             	add    rax,rax
  803984:	48 01 d0             	add    rax,rdx
  803987:	48 c1 e0 08          	shl    rax,0x8
  80398b:	48 05 28 85 40 00    	add    rax,0x408528
  803991:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<MAX_PROC_COUNT;i++){
  803997:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80399b:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  80399f:	7e 99                	jle    80393a <init_proc+0x15>
    }
    cur_proc=0;//no proc
  8039a1:	c7 05 61 0b c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc10b61],0x0        # 41450c <cur_proc>
  8039a8:	00 00 00 
    pidd=1;
  8039ab:	c7 05 5b 0b c1 ff 01 	mov    DWORD PTR [rip+0xffffffffffc10b5b],0x1        # 414510 <pidd>
  8039b2:	00 00 00 
     //创建0号进程
    int zi=create_proc();
  8039b5:	b8 00 00 00 00       	mov    eax,0x0
  8039ba:	e8 8d 02 00 00       	call   803c4c <create_proc>
  8039bf:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    task[zi].stat=READY;
  8039c2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8039c5:	48 63 d0             	movsxd rdx,eax
  8039c8:	48 89 d0             	mov    rax,rdx
  8039cb:	48 01 c0             	add    rax,rax
  8039ce:	48 01 d0             	add    rax,rdx
  8039d1:	48 c1 e0 08          	shl    rax,0x8
  8039d5:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8039db:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int xi= _LDT_IND(zi)*8;
  8039e1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8039e4:	83 c0 03             	add    eax,0x3
  8039e7:	c1 e0 04             	shl    eax,0x4
  8039ea:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    zi=_TSS_IND(zi)*8;
  8039ed:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8039f0:	01 c0                	add    eax,eax
  8039f2:	83 c0 05             	add    eax,0x5
  8039f5:	c1 e0 03             	shl    eax,0x3
  8039f8:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //asm volatile("lldt %0"::"m"(xi));
    //asm volatile("ltr %0"::"m"(zi));
    set_tss(0x400000,0x400000,0x400000,0x800000,0x800000,0x800000,0x800000,0x800000,0x800000,0x800000);
  8039fb:	68 00 00 80 00       	push   0x800000
  803a00:	68 00 00 80 00       	push   0x800000
  803a05:	68 00 00 80 00       	push   0x800000
  803a0a:	68 00 00 80 00       	push   0x800000
  803a0f:	41 b9 00 00 80 00    	mov    r9d,0x800000
  803a15:	41 b8 00 00 80 00    	mov    r8d,0x800000
  803a1b:	b9 00 00 80 00       	mov    ecx,0x800000
  803a20:	ba 00 00 40 00       	mov    edx,0x400000
  803a25:	be 00 00 40 00       	mov    esi,0x400000
  803a2a:	bf 00 00 40 00       	mov    edi,0x400000
  803a2f:	e8 3a 13 00 00       	call   804d6e <set_tss>
  803a34:	48 83 c4 20          	add    rsp,0x20
    //IA32_INTERRUPT_SSP_TABLE_ADDR，准备IST
    wrmsr(0x6a8,tss->rsvd2);
  803a38:	48 8b 05 81 74 00 00 	mov    rax,QWORD PTR [rip+0x7481]        # 80aec0 <tss>
  803a3f:	48 8b 40 1c          	mov    rax,QWORD PTR [rax+0x1c]
  803a43:	48 89 c6             	mov    rsi,rax
  803a46:	bf a8 06 00 00       	mov    edi,0x6a8
  803a4b:	e8 8d cd ff ff       	call   8007dd <wrmsr>
    //把内核代码段选择子写到MSR寄存器中准备用于特权级转换(sysexit，现在没用)
    wrmsr(0x174,0x8);
  803a50:	be 08 00 00 00       	mov    esi,0x8
  803a55:	bf 74 01 00 00       	mov    edi,0x174
  803a5a:	e8 7e cd ff ff       	call   8007dd <wrmsr>
    //准备用于特权级转换(sysret，正在使用)
    wrmsr(0xc0000081,0x0020000800000000ul);
  803a5f:	48 b8 00 00 00 00 08 	movabs rax,0x20000800000000
  803a66:	00 20 00 
  803a69:	48 89 c6             	mov    rsi,rax
  803a6c:	b8 81 00 00 c0       	mov    eax,0xc0000081
  803a71:	48 89 c7             	mov    rdi,rax
  803a74:	e8 64 cd ff ff       	call   8007dd <wrmsr>
    //创建一个测试进程
    create_test_proc();
  803a79:	b8 00 00 00 00       	mov    eax,0x0
  803a7e:	e8 03 00 00 00       	call   803a86 <create_test_proc>
}
  803a83:	90                   	nop
  803a84:	c9                   	leave  
  803a85:	c3                   	ret    

0000000000803a86 <create_test_proc>:
void create_test_proc(){
  803a86:	f3 0f 1e fa          	endbr64 
  803a8a:	55                   	push   rbp
  803a8b:	48 89 e5             	mov    rbp,rsp
  803a8e:	48 83 ec 20          	sub    rsp,0x20

    int index=req_proc();
  803a92:	b8 00 00 00 00       	mov    eax,0x0
  803a97:	e8 33 02 00 00       	call   803ccf <req_proc>
  803a9c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    task[index].stat=READY;
  803a9f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803aa2:	48 63 d0             	movsxd rdx,eax
  803aa5:	48 89 d0             	mov    rax,rdx
  803aa8:	48 01 c0             	add    rax,rax
  803aab:	48 01 d0             	add    rax,rdx
  803aae:	48 c1 e0 08          	shl    rax,0x8
  803ab2:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803ab8:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int currsp=0x9fc00-1;
  803abe:	c7 45 ec ff fb 09 00 	mov    DWORD PTR [rbp-0x14],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  803ac5:	48 89 65 ec          	mov    QWORD PTR [rbp-0x14],rsp
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  803ac9:	ba 22 ae 80 00       	mov    edx,0x80ae22
  803ace:	48 83 ec 08          	sub    rsp,0x8
  803ad2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803ad5:	50                   	push   rax
  803ad6:	6a 00                	push   0x0
  803ad8:	52                   	push   rdx
  803ad9:	6a 00                	push   0x0
  803adb:	6a 00                	push   0x0
  803add:	6a 00                	push   0x0
  803adf:	68 58 7d 00 00       	push   0x7d58
  803ae4:	6a 10                	push   0x10
  803ae6:	6a 10                	push   0x10
  803ae8:	6a 10                	push   0x10
  803aea:	6a 10                	push   0x10
  803aec:	41 b9 08 00 00 00    	mov    r9d,0x8
  803af2:	41 b8 10 00 00 00    	mov    r8d,0x10
  803af8:	b9 00 00 00 00       	mov    ecx,0x0
  803afd:	ba 00 00 00 00       	mov    edx,0x0
  803b02:	be 00 00 00 00       	mov    esi,0x0
  803b07:	bf 00 00 00 00       	mov    edi,0x0
  803b0c:	e8 b7 02 00 00       	call   803dc8 <set_proc>
  803b11:	48 83 c4 60          	add    rsp,0x60
             0x7e00- sizeof(stack_store_regs), 0, 0, 0, (long)ret_sys_call, 0, index);
    task[index].tss.rsp0=0x400000;
  803b15:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803b18:	48 63 d0             	movsxd rdx,eax
  803b1b:	48 89 d0             	mov    rax,rdx
  803b1e:	48 01 c0             	add    rax,rax
  803b21:	48 01 d0             	add    rax,rdx
  803b24:	48 c1 e0 08          	shl    rax,0x8
  803b28:	48 05 68 86 40 00    	add    rax,0x408668
  803b2e:	48 c7 00 00 00 40 00 	mov    QWORD PTR [rax],0x400000
    //把还原现场时用到的堆栈设置好
    stack_store_regs *str= (stack_store_regs *) (0x7e00 - sizeof(stack_store_regs));
  803b35:	48 c7 45 f0 58 7d 00 	mov    QWORD PTR [rbp-0x10],0x7d58
  803b3c:	00 
    str->rax=0;
  803b3d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b41:	48 c7 40 78 00 00 00 	mov    QWORD PTR [rax+0x78],0x0
  803b48:	00 
    str->rbx=0;
  803b49:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b4d:	48 c7 40 70 00 00 00 	mov    QWORD PTR [rax+0x70],0x0
  803b54:	00 
    str->rcx=proc_zero;//sysret采用的返回地址
  803b55:	ba 34 3f 80 00       	mov    edx,0x803f34
  803b5a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b5e:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    str->rdx=0;
  803b62:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b66:	48 c7 40 60 00 00 00 	mov    QWORD PTR [rax+0x60],0x0
  803b6d:	00 
    str->rsi=0;
  803b6e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b72:	48 c7 40 50 00 00 00 	mov    QWORD PTR [rax+0x50],0x0
  803b79:	00 
    str->rdi=0;
  803b7a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b7e:	48 c7 40 58 00 00 00 	mov    QWORD PTR [rax+0x58],0x0
  803b85:	00 
    str->r15=0;
  803b86:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b8a:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  803b91:	00 
    str->r14=0;
  803b92:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b96:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  803b9d:	00 
    str->r13=0;
  803b9e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803ba2:	48 c7 40 20 00 00 00 	mov    QWORD PTR [rax+0x20],0x0
  803ba9:	00 
    str->r12=0;
  803baa:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bae:	48 c7 40 28 00 00 00 	mov    QWORD PTR [rax+0x28],0x0
  803bb5:	00 
    str->r11=0;
  803bb6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bba:	48 c7 40 30 00 00 00 	mov    QWORD PTR [rax+0x30],0x0
  803bc1:	00 
    str->r10=0;
  803bc2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bc6:	48 c7 40 38 00 00 00 	mov    QWORD PTR [rax+0x38],0x0
  803bcd:	00 
    str->r9=0;
  803bce:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bd2:	48 c7 40 40 00 00 00 	mov    QWORD PTR [rax+0x40],0x0
  803bd9:	00 
    str->r8=0;
  803bda:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bde:	48 c7 40 48 00 00 00 	mov    QWORD PTR [rax+0x48],0x0
  803be5:	00 
    str->rip=proc_zero;
  803be6:	ba 34 3f 80 00       	mov    edx,0x803f34
  803beb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bef:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
    str->cs=0x8;
  803bf6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bfa:	48 c7 80 88 00 00 00 	mov    QWORD PTR [rax+0x88],0x8
  803c01:	08 00 00 00 
    str->rflags=0x00200006;
  803c05:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c09:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x200006
  803c10:	06 00 20 00 
    str->rsp=0x7e00;
  803c14:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c18:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x7e00
  803c1f:	00 7e 00 00 
    str->ss=0x2b;
  803c23:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c27:	48 c7 80 a0 00 00 00 	mov    QWORD PTR [rax+0xa0],0x2b
  803c2e:	2b 00 00 00 
    str->ds=0x2b;
  803c32:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c36:	48 c7 00 2b 00 00 00 	mov    QWORD PTR [rax],0x2b
    str->es=0x2b;
  803c3d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c41:	48 c7 40 08 2b 00 00 	mov    QWORD PTR [rax+0x8],0x2b
  803c48:	00 

}
  803c49:	90                   	nop
  803c4a:	c9                   	leave  
  803c4b:	c3                   	ret    

0000000000803c4c <create_proc>:
int create_proc()
{
  803c4c:	f3 0f 1e fa          	endbr64 
  803c50:	55                   	push   rbp
  803c51:	48 89 e5             	mov    rbp,rsp
  803c54:	48 83 ec 10          	sub    rsp,0x10
    int index=req_proc();
  803c58:	b8 00 00 00 00       	mov    eax,0x0
  803c5d:	e8 6d 00 00 00       	call   803ccf <req_proc>
  803c62:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(index==-1)return -1;
  803c65:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  803c69:	75 07                	jne    803c72 <create_proc+0x26>
  803c6b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803c70:	eb 5b                	jmp    803ccd <create_proc+0x81>
    int currsp=0x9fc00-1;
  803c72:	c7 45 f8 ff fb 09 00 	mov    DWORD PTR [rbp-0x8],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  803c79:	48 89 65 f8          	mov    QWORD PTR [rbp-0x8],rsp
    //默认DPL=3
    //set_proc(0,0,0,0,0x23,0x1b,0x23,0x23,0x23,0x23,curesp,0,0,0,0,index);
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  803c7d:	b9 34 3f 80 00       	mov    ecx,0x803f34
  803c82:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803c85:	48 98                	cdqe   
  803c87:	48 83 ec 08          	sub    rsp,0x8
  803c8b:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  803c8e:	52                   	push   rdx
  803c8f:	6a 00                	push   0x0
  803c91:	51                   	push   rcx
  803c92:	6a 00                	push   0x0
  803c94:	6a 00                	push   0x0
  803c96:	6a 00                	push   0x0
  803c98:	50                   	push   rax
  803c99:	6a 10                	push   0x10
  803c9b:	6a 10                	push   0x10
  803c9d:	6a 10                	push   0x10
  803c9f:	6a 10                	push   0x10
  803ca1:	41 b9 08 00 00 00    	mov    r9d,0x8
  803ca7:	41 b8 10 00 00 00    	mov    r8d,0x10
  803cad:	b9 00 00 00 00       	mov    ecx,0x0
  803cb2:	ba 00 00 00 00       	mov    edx,0x0
  803cb7:	be 00 00 00 00       	mov    esi,0x0
  803cbc:	bf 00 00 00 00       	mov    edi,0x0
  803cc1:	e8 02 01 00 00       	call   803dc8 <set_proc>
  803cc6:	48 83 c4 60          	add    rsp,0x60
             currsp, 0, 0, 0, (long)proc_zero, 0, index);
//    task[index].tss.eip=(long)proc_zero;

    return index;
  803cca:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803ccd:	c9                   	leave  
  803cce:	c3                   	ret    

0000000000803ccf <req_proc>:
int req_proc(){
  803ccf:	f3 0f 1e fa          	endbr64 
  803cd3:	55                   	push   rbp
  803cd4:	48 89 e5             	mov    rbp,rsp
    int num=0;
  803cd7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803cde:	eb 04                	jmp    803ce4 <req_proc+0x15>
    num<=MAX_PROC_COUNT){
        num++;
  803ce0:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803ce4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803ce7:	48 63 d0             	movsxd rdx,eax
  803cea:	48 89 d0             	mov    rax,rdx
  803ced:	48 01 c0             	add    rax,rax
  803cf0:	48 01 d0             	add    rax,rdx
  803cf3:	48 c1 e0 08          	shl    rax,0x8
  803cf7:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803cfd:	8b 00                	mov    eax,DWORD PTR [rax]
  803cff:	83 f8 ff             	cmp    eax,0xffffffff
  803d02:	74 26                	je     803d2a <req_proc+0x5b>
  803d04:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d07:	48 63 d0             	movsxd rdx,eax
  803d0a:	48 89 d0             	mov    rax,rdx
  803d0d:	48 01 c0             	add    rax,rax
  803d10:	48 01 d0             	add    rax,rdx
  803d13:	48 c1 e0 08          	shl    rax,0x8
  803d17:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803d1d:	8b 00                	mov    eax,DWORD PTR [rax]
  803d1f:	83 f8 03             	cmp    eax,0x3
  803d22:	74 06                	je     803d2a <req_proc+0x5b>
  803d24:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  803d28:	7e b6                	jle    803ce0 <req_proc+0x11>
    }
    if(num>=MAX_PROC_COUNT)
  803d2a:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803d2e:	7e 0a                	jle    803d3a <req_proc+0x6b>
        return -1;
  803d30:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803d35:	e9 8c 00 00 00       	jmp    803dc6 <req_proc+0xf7>
    task[num].pid=pidd++;
  803d3a:	8b 05 d0 07 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc107d0]        # 414510 <pidd>
  803d40:	8d 50 01             	lea    edx,[rax+0x1]
  803d43:	89 15 c7 07 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc107c7],edx        # 414510 <pidd>
  803d49:	89 c1                	mov    ecx,eax
  803d4b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d4e:	48 63 d0             	movsxd rdx,eax
  803d51:	48 89 d0             	mov    rax,rdx
  803d54:	48 01 c0             	add    rax,rax
  803d57:	48 01 d0             	add    rax,rdx
  803d5a:	48 c1 e0 08          	shl    rax,0x8
  803d5e:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803d64:	89 08                	mov    DWORD PTR [rax],ecx
    task[num].stat=ENDED;
  803d66:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d69:	48 63 d0             	movsxd rdx,eax
  803d6c:	48 89 d0             	mov    rax,rdx
  803d6f:	48 01 c0             	add    rax,rax
  803d72:	48 01 d0             	add    rax,rdx
  803d75:	48 c1 e0 08          	shl    rax,0x8
  803d79:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803d7f:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[num].utime=0;
  803d85:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d88:	48 63 d0             	movsxd rdx,eax
  803d8b:	48 89 d0             	mov    rax,rdx
  803d8e:	48 01 c0             	add    rax,rax
  803d91:	48 01 d0             	add    rax,rdx
  803d94:	48 c1 e0 08          	shl    rax,0x8
  803d98:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803d9e:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[num].priority=0;
  803da4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803da7:	48 63 d0             	movsxd rdx,eax
  803daa:	48 89 d0             	mov    rax,rdx
  803dad:	48 01 c0             	add    rax,rax
  803db0:	48 01 d0             	add    rax,rdx
  803db3:	48 c1 e0 08          	shl    rax,0x8
  803db7:	48 05 ac 84 40 00    	add    rax,0x4084ac
  803dbd:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return num;
  803dc3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803dc6:	5d                   	pop    rbp
  803dc7:	c3                   	ret    

0000000000803dc8 <set_proc>:
void set_proc(long eax, long ebx, long ecx, long edx, long es, long cs, long ss, long ds, long fs, long gs, long esp,
              long ebp, long esi, long edi, long rip, long eflags, int proc_nr) {
  803dc8:	f3 0f 1e fa          	endbr64 
  803dcc:	55                   	push   rbp
  803dcd:	48 89 e5             	mov    rbp,rsp
  803dd0:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  803dd4:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  803dd8:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  803ddc:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  803de0:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
  803de4:	4c 89 4d c0          	mov    QWORD PTR [rbp-0x40],r9
    struct process* proc=&task[proc_nr];
  803de8:	8b 45 60             	mov    eax,DWORD PTR [rbp+0x60]
  803deb:	48 63 d0             	movsxd rdx,eax
  803dee:	48 89 d0             	mov    rax,rdx
  803df1:	48 01 c0             	add    rax,rax
  803df4:	48 01 d0             	add    rax,rdx
  803df7:	48 c1 e0 08          	shl    rax,0x8
  803dfb:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803e01:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    proc->regs.rax=eax;
  803e05:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e09:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  803e0d:	48 89 90 48 02 00 00 	mov    QWORD PTR [rax+0x248],rdx
    proc->regs.rbx=ebx;
  803e14:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e18:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  803e1c:	48 89 90 60 02 00 00 	mov    QWORD PTR [rax+0x260],rdx
    proc->regs.rcx=ecx;
  803e23:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e27:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  803e2b:	48 89 90 50 02 00 00 	mov    QWORD PTR [rax+0x250],rdx
    proc->regs.rdx=edx;
  803e32:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e36:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  803e3a:	48 89 90 58 02 00 00 	mov    QWORD PTR [rax+0x258],rdx
    proc->regs.es=es;
  803e41:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e45:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803e49:	48 89 90 88 02 00 00 	mov    QWORD PTR [rax+0x288],rdx
    proc->regs.cs=cs;
  803e50:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e54:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803e58:	48 89 90 90 02 00 00 	mov    QWORD PTR [rax+0x290],rdx
    proc->regs.ss=ss;
  803e5f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e63:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803e67:	48 89 90 98 02 00 00 	mov    QWORD PTR [rax+0x298],rdx
    proc->regs.ds=ds;
  803e6e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e72:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803e76:	48 89 90 a0 02 00 00 	mov    QWORD PTR [rax+0x2a0],rdx
    proc->regs.fs=fs;
  803e7d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e81:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  803e85:	48 89 90 a8 02 00 00 	mov    QWORD PTR [rax+0x2a8],rdx
    proc->regs.gs=gs;
  803e8c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e90:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  803e94:	48 89 90 b0 02 00 00 	mov    QWORD PTR [rax+0x2b0],rdx
    proc->regs.rsp=esp;
  803e9b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e9f:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803ea3:	48 89 90 68 02 00 00 	mov    QWORD PTR [rax+0x268],rdx
    proc->regs.rbp=ebp;
  803eaa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803eae:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
  803eb2:	48 89 90 70 02 00 00 	mov    QWORD PTR [rax+0x270],rdx
    proc->regs.rsi=esi;
  803eb9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ebd:	48 8b 55 40          	mov    rdx,QWORD PTR [rbp+0x40]
  803ec1:	48 89 90 78 02 00 00 	mov    QWORD PTR [rax+0x278],rdx
    proc->regs.rdi=edi;
  803ec8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ecc:	48 8b 55 48          	mov    rdx,QWORD PTR [rbp+0x48]
  803ed0:	48 89 90 80 02 00 00 	mov    QWORD PTR [rax+0x280],rdx
    proc->regs.rflags=0x202;//设置为默认值:0b 0010 0000 0010
  803ed7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803edb:	48 c7 80 40 02 00 00 	mov    QWORD PTR [rax+0x240],0x202
  803ee2:	02 02 00 00 
    //能接受中断
    proc->regs.rip=rip;
  803ee6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803eea:	48 8b 55 50          	mov    rdx,QWORD PTR [rbp+0x50]
  803eee:	48 89 90 38 02 00 00 	mov    QWORD PTR [rax+0x238],rdx

    proc->regs.cs=cs;
  803ef5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ef9:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803efd:	48 89 90 90 02 00 00 	mov    QWORD PTR [rax+0x290],rdx
    proc->regs.ds=ds;
  803f04:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f08:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803f0c:	48 89 90 a0 02 00 00 	mov    QWORD PTR [rax+0x2a0],rdx
    proc->regs.es=es;
  803f13:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f17:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803f1b:	48 89 90 88 02 00 00 	mov    QWORD PTR [rax+0x288],rdx
    proc->regs.cr3=PML4_ADDR;//get_phyaddr(n1);//暂时先搞成全局
  803f22:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f26:	48 c7 80 30 02 00 00 	mov    QWORD PTR [rax+0x230],0x101000
  803f2d:	00 10 10 00 


}
  803f31:	90                   	nop
  803f32:	5d                   	pop    rbp
  803f33:	c3                   	ret    

0000000000803f34 <proc_zero>:
void proc_zero()
{
  803f34:	f3 0f 1e fa          	endbr64 
  803f38:	55                   	push   rbp
  803f39:	48 89 e5             	mov    rbp,rsp
    asm volatile("mov $1,%rax\n"
  803f3c:	48 c7 c0 01 00 00 00 	mov    rax,0x1
  803f43:	48 0f 05             	rex.W syscall 
                 ".byte 0x48\n"
                 "syscall");
    while(1);
  803f46:	eb fe                	jmp    803f46 <proc_zero+0x12>

0000000000803f48 <manage_proc>:
}
void manage_proc(){
  803f48:	f3 0f 1e fa          	endbr64 
  803f4c:	55                   	push   rbp
  803f4d:	48 89 e5             	mov    rbp,rsp
  803f50:	48 83 ec 10          	sub    rsp,0x10
    if(cur_proc!=-1)
  803f54:	8b 05 b2 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc105b2]        # 41450c <cur_proc>
  803f5a:	83 f8 ff             	cmp    eax,0xffffffff
  803f5d:	74 39                	je     803f98 <manage_proc+0x50>
        task[cur_proc].utime++;
  803f5f:	8b 15 a7 05 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc105a7]        # 41450c <cur_proc>
  803f65:	48 63 ca             	movsxd rcx,edx
  803f68:	48 89 c8             	mov    rax,rcx
  803f6b:	48 01 c0             	add    rax,rax
  803f6e:	48 01 c8             	add    rax,rcx
  803f71:	48 c1 e0 08          	shl    rax,0x8
  803f75:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803f7b:	8b 00                	mov    eax,DWORD PTR [rax]
  803f7d:	8d 48 01             	lea    ecx,[rax+0x1]
  803f80:	48 63 d2             	movsxd rdx,edx
  803f83:	48 89 d0             	mov    rax,rdx
  803f86:	48 01 c0             	add    rax,rax
  803f89:	48 01 d0             	add    rax,rdx
  803f8c:	48 c1 e0 08          	shl    rax,0x8
  803f90:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803f96:	89 08                	mov    DWORD PTR [rax],ecx
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803f98:	8b 05 6e 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1056e]        # 41450c <cur_proc>
  803f9e:	83 f8 ff             	cmp    eax,0xffffffff
  803fa1:	74 4a                	je     803fed <manage_proc+0xa5>
  803fa3:	8b 05 63 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10563]        # 41450c <cur_proc>
  803fa9:	48 63 d0             	movsxd rdx,eax
  803fac:	48 89 d0             	mov    rax,rdx
  803faf:	48 01 c0             	add    rax,rax
  803fb2:	48 01 d0             	add    rax,rdx
  803fb5:	48 c1 e0 08          	shl    rax,0x8
  803fb9:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803fbf:	8b 00                	mov    eax,DWORD PTR [rax]
  803fc1:	83 f8 01             	cmp    eax,0x1
  803fc4:	77 27                	ja     803fed <manage_proc+0xa5>
    task[cur_proc].stat!=READY){
  803fc6:	8b 05 40 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10540]        # 41450c <cur_proc>
  803fcc:	48 63 d0             	movsxd rdx,eax
  803fcf:	48 89 d0             	mov    rax,rdx
  803fd2:	48 01 c0             	add    rax,rax
  803fd5:	48 01 d0             	add    rax,rdx
  803fd8:	48 c1 e0 08          	shl    rax,0x8
  803fdc:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803fe2:	8b 00                	mov    eax,DWORD PTR [rax]
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803fe4:	83 f8 01             	cmp    eax,0x1
  803fe7:	0f 84 21 01 00 00    	je     80410e <manage_proc+0x1c6>
        if(cur_proc!=-1)
  803fed:	8b 05 19 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10519]        # 41450c <cur_proc>
  803ff3:	83 f8 ff             	cmp    eax,0xffffffff
  803ff6:	74 22                	je     80401a <manage_proc+0xd2>
            task[cur_proc].utime=0;
  803ff8:	8b 05 0e 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1050e]        # 41450c <cur_proc>
  803ffe:	48 63 d0             	movsxd rdx,eax
  804001:	48 89 d0             	mov    rax,rdx
  804004:	48 01 c0             	add    rax,rax
  804007:	48 01 d0             	add    rax,rdx
  80400a:	48 c1 e0 08          	shl    rax,0x8
  80400e:	48 05 a8 84 40 00    	add    rax,0x4084a8
  804014:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        //find
        int i=0;
  80401a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        for(i=0;i<MAX_PROC_COUNT;i++){
  804021:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  804028:	eb 4f                	jmp    804079 <manage_proc+0x131>
            if(task[i].pid!=-1&&task[i].stat==READY&&i!=cur_proc){
  80402a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80402d:	48 63 d0             	movsxd rdx,eax
  804030:	48 89 d0             	mov    rax,rdx
  804033:	48 01 c0             	add    rax,rax
  804036:	48 01 d0             	add    rax,rdx
  804039:	48 c1 e0 08          	shl    rax,0x8
  80403d:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804043:	8b 00                	mov    eax,DWORD PTR [rax]
  804045:	83 f8 ff             	cmp    eax,0xffffffff
  804048:	74 2b                	je     804075 <manage_proc+0x12d>
  80404a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80404d:	48 63 d0             	movsxd rdx,eax
  804050:	48 89 d0             	mov    rax,rdx
  804053:	48 01 c0             	add    rax,rax
  804056:	48 01 d0             	add    rax,rdx
  804059:	48 c1 e0 08          	shl    rax,0x8
  80405d:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804063:	8b 00                	mov    eax,DWORD PTR [rax]
  804065:	83 f8 01             	cmp    eax,0x1
  804068:	75 0b                	jne    804075 <manage_proc+0x12d>
  80406a:	8b 05 9c 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1049c]        # 41450c <cur_proc>
  804070:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  804073:	75 0c                	jne    804081 <manage_proc+0x139>
        for(i=0;i<MAX_PROC_COUNT;i++){
  804075:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  804079:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  80407d:	7e ab                	jle    80402a <manage_proc+0xe2>
  80407f:	eb 01                	jmp    804082 <manage_proc+0x13a>
                break;
  804081:	90                   	nop
            }
        }
        if(i>=MAX_PROC_COUNT)
  804082:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  804086:	0f 8f 85 00 00 00    	jg     804111 <manage_proc+0x1c9>
            return;
        //switch
        task[cur_proc].stat=READY;
  80408c:	8b 05 7a 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1047a]        # 41450c <cur_proc>
  804092:	48 63 d0             	movsxd rdx,eax
  804095:	48 89 d0             	mov    rax,rdx
  804098:	48 01 c0             	add    rax,rax
  80409b:	48 01 d0             	add    rax,rdx
  80409e:	48 c1 e0 08          	shl    rax,0x8
  8040a2:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8040a8:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        task[i].stat=RUNNING;
  8040ae:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8040b1:	48 63 d0             	movsxd rdx,eax
  8040b4:	48 89 d0             	mov    rax,rdx
  8040b7:	48 01 c0             	add    rax,rax
  8040ba:	48 01 d0             	add    rax,rdx
  8040bd:	48 c1 e0 08          	shl    rax,0x8
  8040c1:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8040c7:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        switch_to(&task[cur_proc], &task[i]);
  8040cd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8040d0:	48 63 d0             	movsxd rdx,eax
  8040d3:	48 89 d0             	mov    rax,rdx
  8040d6:	48 01 c0             	add    rax,rax
  8040d9:	48 01 d0             	add    rax,rdx
  8040dc:	48 c1 e0 08          	shl    rax,0x8
  8040e0:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  8040e7:	8b 05 1f 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1041f]        # 41450c <cur_proc>
  8040ed:	48 63 c8             	movsxd rcx,eax
  8040f0:	48 89 c8             	mov    rax,rcx
  8040f3:	48 01 c0             	add    rax,rax
  8040f6:	48 01 c8             	add    rax,rcx
  8040f9:	48 c1 e0 08          	shl    rax,0x8
  8040fd:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804103:	48 89 d6             	mov    rsi,rdx
  804106:	48 89 c7             	mov    rdi,rax
  804109:	e8 fd 0a 00 00       	call   804c0b <switch_to>
    }
    return;
  80410e:	90                   	nop
  80410f:	eb 01                	jmp    804112 <manage_proc+0x1ca>
            return;
  804111:	90                   	nop
}
  804112:	c9                   	leave  
  804113:	c3                   	ret    

0000000000804114 <switch_proc_tss>:

void switch_proc_tss(int pnr)
{
  804114:	f3 0f 1e fa          	endbr64 
  804118:	55                   	push   rbp
  804119:	48 89 e5             	mov    rbp,rsp
  80411c:	48 83 ec 20          	sub    rsp,0x20
  804120:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int sel=_TSS_IND(pnr)*8;
  804123:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804126:	01 c0                	add    eax,eax
  804128:	83 c0 05             	add    eax,0x5
  80412b:	c1 e0 03             	shl    eax,0x3
  80412e:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    cur_proc=pnr;
  804131:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804134:	89 05 d2 03 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc103d2],eax        # 41450c <cur_proc>
    switch_proc_asm(sel);
  80413a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80413d:	89 c7                	mov    edi,eax
  80413f:	e8 f6 6b 00 00       	call   80ad3a <switch_proc_asm>
}
  804144:	90                   	nop
  804145:	c9                   	leave  
  804146:	c3                   	ret    

0000000000804147 <switch_proc>:
void switch_proc(int pnr){
  804147:	f3 0f 1e fa          	endbr64 
  80414b:	55                   	push   rbp
  80414c:	48 89 e5             	mov    rbp,rsp
  80414f:	48 81 ec 20 03 00 00 	sub    rsp,0x320
  804156:	89 bd ec fc ff ff    	mov    DWORD PTR [rbp-0x314],edi
    //printf("switching proc to %d\n",pnr);
    //printf("eip:%x\n",task[pnr].tss.eip);
    struct process p=task[pnr];
  80415c:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  804162:	48 63 d0             	movsxd rdx,eax
  804165:	48 89 d0             	mov    rax,rdx
  804168:	48 01 c0             	add    rax,rax
  80416b:	48 01 d0             	add    rax,rdx
  80416e:	48 c1 e0 08          	shl    rax,0x8
  804172:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  804179:	48 8d 85 f0 fc ff ff 	lea    rax,[rbp-0x310]
  804180:	48 89 d6             	mov    rsi,rdx
  804183:	ba 60 00 00 00       	mov    edx,0x60
  804188:	48 89 c7             	mov    rdi,rax
  80418b:	48 89 d1             	mov    rcx,rdx
  80418e:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
    save_context(&task[cur_proc].tss);
  804191:	8b 05 75 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10375]        # 41450c <cur_proc>
  804197:	48 63 d0             	movsxd rdx,eax
  80419a:	48 89 d0             	mov    rax,rdx
  80419d:	48 01 c0             	add    rax,rax
  8041a0:	48 01 d0             	add    rax,rdx
  8041a3:	48 c1 e0 08          	shl    rax,0x8
  8041a7:	48 05 c0 01 00 00    	add    rax,0x1c0
  8041ad:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8041b3:	48 83 c0 04          	add    rax,0x4
  8041b7:	48 89 c7             	mov    rdi,rax
  8041ba:	e8 53 00 00 00       	call   804212 <save_context>
//    //重新设置0号进程
//    task[0].tss.eip=proc_zero;
//    task[0].tss.cr3=PAGE_INDEX_ADDR;
//    task[0].tss.eflags=0x202;
    cur_proc=pnr;
  8041bf:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  8041c5:	89 05 41 03 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10341],eax        # 41450c <cur_proc>
    int sel=_TSS_IND(pnr)*8;
  8041cb:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  8041d1:	01 c0                	add    eax,eax
  8041d3:	83 c0 05             	add    eax,0x5
  8041d6:	c1 e0 03             	shl    eax,0x3
  8041d9:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    switch_to(NULL, &task[pnr].tss);
  8041dc:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  8041e2:	48 63 d0             	movsxd rdx,eax
  8041e5:	48 89 d0             	mov    rax,rdx
  8041e8:	48 01 c0             	add    rax,rax
  8041eb:	48 01 d0             	add    rax,rdx
  8041ee:	48 c1 e0 08          	shl    rax,0x8
  8041f2:	48 05 c0 01 00 00    	add    rax,0x1c0
  8041f8:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8041fe:	48 83 c0 04          	add    rax,0x4
  804202:	48 89 c6             	mov    rsi,rax
  804205:	bf 00 00 00 00       	mov    edi,0x0
  80420a:	e8 fc 09 00 00       	call   804c0b <switch_to>
    //asm volatile("push %0":"=r"(task[pnr].tss.eip));
    //switch_proc_asm(pnr*8+0x8*3);
}
  80420f:	90                   	nop
  804210:	c9                   	leave  
  804211:	c3                   	ret    

0000000000804212 <save_context>:
void save_context(TSS *tss)
{
  804212:	f3 0f 1e fa          	endbr64 
  804216:	55                   	push   rbp
  804217:	48 89 e5             	mov    rbp,rsp
  80421a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//    tss->esi=scene_saver.esi;
//    tss->edi=scene_saver.edi;
//    tss->eflags=scene_saver.eflags;
//    tss->esp=scene_saver.esp;
//    tss->ebp=scene_saver.ebp;
}
  80421e:	90                   	nop
  80421f:	5d                   	pop    rbp
  804220:	c3                   	ret    

0000000000804221 <palloc>:
    task[index].stat=READY;
    return index;
} */
//为指定进程申请新的内存，并返回这块内存的线性地址。
void* palloc(int proc_index,int size)
{
  804221:	f3 0f 1e fa          	endbr64 
  804225:	55                   	push   rbp
  804226:	48 89 e5             	mov    rbp,rsp
  804229:	48 83 ec 60          	sub    rsp,0x60
  80422d:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  804230:	89 75 a8             	mov    DWORD PTR [rbp-0x58],esi
    int page_c=size/4096+size%4096?1:0;
  804233:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  804236:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80423c:	85 c0                	test   eax,eax
  80423e:	0f 48 c2             	cmovs  eax,edx
  804241:	c1 f8 0c             	sar    eax,0xc
  804244:	89 c1                	mov    ecx,eax
  804246:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  804249:	99                   	cdq    
  80424a:	c1 ea 14             	shr    edx,0x14
  80424d:	01 d0                	add    eax,edx
  80424f:	25 ff 0f 00 00       	and    eax,0xfff
  804254:	29 d0                	sub    eax,edx
  804256:	01 c8                	add    eax,ecx
  804258:	85 c0                	test   eax,eax
  80425a:	0f 95 c0             	setne  al
  80425d:	0f b6 c0             	movzx  eax,al
  804260:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=0;
  804263:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    void *ptr=NULL;
  80426a:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  804271:	00 
    page_item *pgind=NULL;//task[proc_index].tss.cr3;
  804272:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  804279:	00 
    pgind++;
  80427a:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  80427f:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [rbp-0x14],0x1
  804286:	e9 76 02 00 00       	jmp    804501 <palloc+0x2e0>
    {
        page_item* tblp=*pgind&0xfffff000;
  80428b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80428f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804292:	25 00 f0 ff ff       	and    eax,0xfffff000
  804297:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for(int j=0;j<1024;j++)
  80429b:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  8042a2:	e9 44 02 00 00       	jmp    8044eb <palloc+0x2ca>
        {
            int v=*tblp&PAGE_PRESENT;
  8042a7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8042ab:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8042ae:	83 e0 01             	and    eax,0x1
  8042b1:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
            if(!v)
  8042b4:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  8042b8:	0f 85 24 02 00 00    	jne    8044e2 <palloc+0x2c1>
            {
                int new_pg=req_a_page();
  8042be:	b8 00 00 00 00       	mov    eax,0x0
  8042c3:	e8 b7 d1 ff ff       	call   80147f <req_a_page>
  8042c8:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
                if(new_pg==-1)
  8042cb:	83 7d c8 ff          	cmp    DWORD PTR [rbp-0x38],0xffffffff
  8042cf:	0f 85 dc 00 00 00    	jne    8043b1 <palloc+0x190>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  8042d5:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8042d8:	48 63 d0             	movsxd rdx,eax
  8042db:	48 89 d0             	mov    rax,rdx
  8042de:	48 01 c0             	add    rax,rax
  8042e1:	48 01 d0             	add    rax,rdx
  8042e4:	48 c1 e0 08          	shl    rax,0x8
  8042e8:	48 05 f4 84 40 00    	add    rax,0x4084f4
  8042ee:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8042f1:	0f b7 c0             	movzx  eax,ax
  8042f4:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  8042f7:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8042fa:	48 63 d0             	movsxd rdx,eax
  8042fd:	48 89 d0             	mov    rax,rdx
  804300:	48 01 c0             	add    rax,rax
  804303:	48 01 d0             	add    rax,rdx
  804306:	48 c1 e0 08          	shl    rax,0x8
  80430a:	48 05 f0 84 40 00    	add    rax,0x4084f0
  804310:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  804314:	0f b7 c0             	movzx  eax,ax
  804317:	c1 e0 10             	shl    eax,0x10
  80431a:	25 00 00 0f 00       	and    eax,0xf0000
  80431f:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    size+=c;
  804322:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804325:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  804328:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80432b:	89 c1                	mov    ecx,eax
  80432d:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804330:	48 63 d0             	movsxd rdx,eax
  804333:	48 89 d0             	mov    rax,rdx
  804336:	48 01 c0             	add    rax,rax
  804339:	48 01 d0             	add    rax,rdx
  80433c:	48 c1 e0 08          	shl    rax,0x8
  804340:	48 05 f4 84 40 00    	add    rax,0x4084f4
  804346:	66 89 08             	mov    WORD PTR [rax],cx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  804349:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80434c:	48 63 d0             	movsxd rdx,eax
  80434f:	48 89 d0             	mov    rax,rdx
  804352:	48 01 c0             	add    rax,rax
  804355:	48 01 d0             	add    rax,rdx
  804358:	48 c1 e0 08          	shl    rax,0x8
  80435c:	48 05 f0 84 40 00    	add    rax,0x4084f0
  804362:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  804366:	0f b7 c0             	movzx  eax,ax
  804369:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    tmp_attr&=0xfff0;
  80436c:	81 65 b0 f0 ff 00 00 	and    DWORD PTR [rbp-0x50],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  804373:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  804376:	c1 e8 10             	shr    eax,0x10
  804379:	83 e0 0f             	and    eax,0xf
  80437c:	89 c2                	mov    edx,eax
  80437e:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  804381:	01 d0                	add    eax,edx
  804383:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  804386:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  804389:	89 c1                	mov    ecx,eax
  80438b:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80438e:	48 63 d0             	movsxd rdx,eax
  804391:	48 89 d0             	mov    rax,rdx
  804394:	48 01 c0             	add    rax,rax
  804397:	48 01 d0             	add    rax,rdx
  80439a:	48 c1 e0 08          	shl    rax,0x8
  80439e:	48 05 f0 84 40 00    	add    rax,0x4084f0
  8043a4:	66 89 48 09          	mov    WORD PTR [rax+0x9],cx
                    return ptr;//失败了，只能申请一部分的内存或者返回NULL
  8043a8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8043ac:	e9 62 01 00 00       	jmp    804513 <palloc+0x2f2>
                }
                int addr=get_phyaddr(new_pg);
  8043b1:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  8043b4:	89 c7                	mov    edi,eax
  8043b6:	e8 72 d2 ff ff       	call   80162d <get_phyaddr>
  8043bb:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
                set_page_item(tblp,addr,PAGE_PRESENT|\
  8043be:	8b 4d c4             	mov    ecx,DWORD PTR [rbp-0x3c]
  8043c1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8043c5:	ba 07 00 00 00       	mov    edx,0x7
  8043ca:	89 ce                	mov    esi,ecx
  8043cc:	48 89 c7             	mov    rdi,rax
  8043cf:	e8 6c d2 ff ff       	call   801640 <set_page_item>
                PAGE_RWX|PAGE_FOR_ALL);
                int laddr=i*0x400000+j*0x1000;//线性地址
  8043d4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8043d7:	c1 e0 0a             	shl    eax,0xa
  8043da:	89 c2                	mov    edx,eax
  8043dc:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8043df:	01 d0                	add    eax,edx
  8043e1:	c1 e0 0c             	shl    eax,0xc
  8043e4:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
                if(ptr==NULL)
  8043e7:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
  8043ec:	75 09                	jne    8043f7 <palloc+0x1d6>
                {
                   // ptr=laddr;
                    palloc_paddr=addr;
  8043ee:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8043f1:	89 05 1d 01 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1011d],eax        # 414514 <palloc_paddr>
                }
                page_c--;
  8043f7:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
                c++;
  8043fb:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                if(page_c==0)
  8043ff:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  804403:	0f 85 d9 00 00 00    	jne    8044e2 <palloc+0x2c1>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  804409:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80440c:	48 63 d0             	movsxd rdx,eax
  80440f:	48 89 d0             	mov    rax,rdx
  804412:	48 01 c0             	add    rax,rax
  804415:	48 01 d0             	add    rax,rdx
  804418:	48 c1 e0 08          	shl    rax,0x8
  80441c:	48 05 f4 84 40 00    	add    rax,0x4084f4
  804422:	0f b7 00             	movzx  eax,WORD PTR [rax]
  804425:	0f b7 c0             	movzx  eax,ax
  804428:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  80442b:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80442e:	48 63 d0             	movsxd rdx,eax
  804431:	48 89 d0             	mov    rax,rdx
  804434:	48 01 c0             	add    rax,rax
  804437:	48 01 d0             	add    rax,rdx
  80443a:	48 c1 e0 08          	shl    rax,0x8
  80443e:	48 05 f0 84 40 00    	add    rax,0x4084f0
  804444:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  804448:	0f b7 c0             	movzx  eax,ax
  80444b:	c1 e0 10             	shl    eax,0x10
  80444e:	25 00 00 0f 00       	and    eax,0xf0000
  804453:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    size+=c;
  804456:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804459:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  80445c:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  80445f:	89 c1                	mov    ecx,eax
  804461:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804464:	48 63 d0             	movsxd rdx,eax
  804467:	48 89 d0             	mov    rax,rdx
  80446a:	48 01 c0             	add    rax,rax
  80446d:	48 01 d0             	add    rax,rdx
  804470:	48 c1 e0 08          	shl    rax,0x8
  804474:	48 05 f4 84 40 00    	add    rax,0x4084f4
  80447a:	66 89 08             	mov    WORD PTR [rax],cx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  80447d:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804480:	48 63 d0             	movsxd rdx,eax
  804483:	48 89 d0             	mov    rax,rdx
  804486:	48 01 c0             	add    rax,rax
  804489:	48 01 d0             	add    rax,rdx
  80448c:	48 c1 e0 08          	shl    rax,0x8
  804490:	48 05 f0 84 40 00    	add    rax,0x4084f0
  804496:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  80449a:	0f b7 c0             	movzx  eax,ax
  80449d:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    tmp_attr&=0xfff0;
  8044a0:	81 65 b8 f0 ff 00 00 	and    DWORD PTR [rbp-0x48],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  8044a7:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  8044aa:	c1 e8 10             	shr    eax,0x10
  8044ad:	83 e0 0f             	and    eax,0xf
  8044b0:	89 c2                	mov    edx,eax
  8044b2:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  8044b5:	01 d0                	add    eax,edx
  8044b7:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  8044ba:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  8044bd:	89 c1                	mov    ecx,eax
  8044bf:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8044c2:	48 63 d0             	movsxd rdx,eax
  8044c5:	48 89 d0             	mov    rax,rdx
  8044c8:	48 01 c0             	add    rax,rax
  8044cb:	48 01 d0             	add    rax,rdx
  8044ce:	48 c1 e0 08          	shl    rax,0x8
  8044d2:	48 05 f0 84 40 00    	add    rax,0x4084f0
  8044d8:	66 89 48 09          	mov    WORD PTR [rax+0x9],cx
                    return ptr;
  8044dc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8044e0:	eb 31                	jmp    804513 <palloc+0x2f2>
                }
            }
            tblp++;
  8044e2:	48 83 45 e0 08       	add    QWORD PTR [rbp-0x20],0x8
        for(int j=0;j<1024;j++)
  8044e7:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  8044eb:	81 7d dc ff 03 00 00 	cmp    DWORD PTR [rbp-0x24],0x3ff
  8044f2:	0f 8e af fd ff ff    	jle    8042a7 <palloc+0x86>
        }
        pgind++;
  8044f8:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  8044fd:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804501:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  804508:	0f 8e 7d fd ff ff    	jle    80428b <palloc+0x6a>
    }
    return NULL;
  80450e:	b8 00 00 00 00       	mov    eax,0x0
}
  804513:	c9                   	leave  
  804514:	c3                   	ret    

0000000000804515 <malloc>:
//为当前进程申请新的内存，并返回这块内存的线性地址。
void* malloc(int size)
{
  804515:	f3 0f 1e fa          	endbr64 
  804519:	55                   	push   rbp
  80451a:	48 89 e5             	mov    rbp,rsp
  80451d:	48 83 ec 10          	sub    rsp,0x10
  804521:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return palloc(cur_proc,size);
  804524:	8b 05 e2 ff c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ffe2]        # 41450c <cur_proc>
  80452a:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80452d:	89 d6                	mov    esi,edx
  80452f:	89 c7                	mov    edi,eax
  804531:	e8 eb fc ff ff       	call   804221 <palloc>
}
  804536:	c9                   	leave  
  804537:	c3                   	ret    

0000000000804538 <proc_end>:
void proc_end()
{
  804538:	f3 0f 1e fa          	endbr64 
  80453c:	55                   	push   rbp
  80453d:	48 89 e5             	mov    rbp,rsp
  804540:	48 83 ec 10          	sub    rsp,0x10
    int ret;
    asm volatile("mov %%eax,%0":"=m"(ret));
  804544:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("proc #%d ended with retv %d.\n",cur_proc,ret);
    //切换堆栈
    //asm volatile("mov %0,%%rsp"::"r"(task[0].tss.esp));
    del_proc(cur_proc);
  804547:	8b 05 bf ff c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ffbf]        # 41450c <cur_proc>
  80454d:	89 c7                	mov    edi,eax
  80454f:	e8 90 00 00 00       	call   8045e4 <del_proc>
    if(task[cur_proc].parent_pid!=-1){
  804554:	8b 05 b2 ff c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ffb2]        # 41450c <cur_proc>
  80455a:	48 63 d0             	movsxd rdx,eax
  80455d:	48 89 d0             	mov    rax,rdx
  804560:	48 01 c0             	add    rax,rax
  804563:	48 01 d0             	add    rax,rdx
  804566:	48 c1 e0 08          	shl    rax,0x8
  80456a:	48 05 28 85 40 00    	add    rax,0x408528
  804570:	8b 00                	mov    eax,DWORD PTR [rax]
  804572:	83 f8 ff             	cmp    eax,0xffffffff
  804575:	74 60                	je     8045d7 <proc_end+0x9f>
        task[task[cur_proc].parent_pid].stat=READY;
  804577:	8b 05 8f ff c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ff8f]        # 41450c <cur_proc>
  80457d:	48 63 d0             	movsxd rdx,eax
  804580:	48 89 d0             	mov    rax,rdx
  804583:	48 01 c0             	add    rax,rax
  804586:	48 01 d0             	add    rax,rdx
  804589:	48 c1 e0 08          	shl    rax,0x8
  80458d:	48 05 28 85 40 00    	add    rax,0x408528
  804593:	8b 00                	mov    eax,DWORD PTR [rax]
  804595:	89 c2                	mov    edx,eax
  804597:	48 89 d0             	mov    rax,rdx
  80459a:	48 01 c0             	add    rax,rax
  80459d:	48 01 d0             	add    rax,rdx
  8045a0:	48 c1 e0 08          	shl    rax,0x8
  8045a4:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8045aa:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        switch_proc_tss(task[cur_proc].parent_pid);
  8045b0:	8b 05 56 ff c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ff56]        # 41450c <cur_proc>
  8045b6:	48 63 d0             	movsxd rdx,eax
  8045b9:	48 89 d0             	mov    rax,rdx
  8045bc:	48 01 c0             	add    rax,rax
  8045bf:	48 01 d0             	add    rax,rdx
  8045c2:	48 c1 e0 08          	shl    rax,0x8
  8045c6:	48 05 28 85 40 00    	add    rax,0x408528
  8045cc:	8b 00                	mov    eax,DWORD PTR [rax]
  8045ce:	89 c7                	mov    edi,eax
  8045d0:	e8 3f fb ff ff       	call   804114 <switch_proc_tss>
    }
    else
        switch_proc_tss(0);
    //syscall(SYSCALL_DEL_PROC,cur_proc,0,0,0,0);
}
  8045d5:	eb 0a                	jmp    8045e1 <proc_end+0xa9>
        switch_proc_tss(0);
  8045d7:	bf 00 00 00 00       	mov    edi,0x0
  8045dc:	e8 33 fb ff ff       	call   804114 <switch_proc_tss>
}
  8045e1:	90                   	nop
  8045e2:	c9                   	leave  
  8045e3:	c3                   	ret    

00000000008045e4 <del_proc>:
void del_proc(int pnr)
{
  8045e4:	f3 0f 1e fa          	endbr64 
  8045e8:	55                   	push   rbp
  8045e9:	48 89 e5             	mov    rbp,rsp
  8045ec:	48 83 ec 30          	sub    rsp,0x30
  8045f0:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
    task[pnr].stat=ENDED;
  8045f3:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8045f6:	48 63 d0             	movsxd rdx,eax
  8045f9:	48 89 d0             	mov    rax,rdx
  8045fc:	48 01 c0             	add    rax,rax
  8045ff:	48 01 d0             	add    rax,rdx
  804602:	48 c1 e0 08          	shl    rax,0x8
  804606:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80460c:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[pnr].pid=-1;
  804612:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804615:	48 63 d0             	movsxd rdx,eax
  804618:	48 89 d0             	mov    rax,rdx
  80461b:	48 01 c0             	add    rax,rax
  80461e:	48 01 d0             	add    rax,rdx
  804621:	48 c1 e0 08          	shl    rax,0x8
  804625:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80462b:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    //释放申请的页面
    page_item *p;//task[pnr].tss.cr3;
    p++;
  804631:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
    for(;(*p&PAGE_PRESENT)!=0;p++)
  804636:	eb 63                	jmp    80469b <del_proc+0xb7>
    {
        page_item *tp=*p&0xfffff000;
  804638:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80463c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80463f:	25 00 f0 ff ff       	and    eax,0xfffff000
  804644:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<1024;i++)
  804648:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80464f:	eb 30                	jmp    804681 <del_proc+0x9d>
        {
            unsigned int present=*tp&PAGE_PRESENT;
  804651:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804655:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804658:	83 e0 01             	and    eax,0x1
  80465b:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            if(present)
  80465e:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  804662:	74 14                	je     804678 <del_proc+0x94>
            {
                free_page(*tp&0xfffff000);
  804664:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804668:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80466b:	25 00 f0 ff ff       	and    eax,0xfffff000
  804670:	48 89 c7             	mov    rdi,rax
  804673:	e8 d7 ce ff ff       	call   80154f <free_page>
                //printf("freed page at %x.\n",*tp&0xfffff000);
            }
            tp++;
  804678:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
        for(int i=0;i<1024;i++)
  80467d:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804681:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  804688:	7e c7                	jle    804651 <del_proc+0x6d>
        }
        vmfree(tp);
  80468a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80468e:	48 89 c7             	mov    rdi,rax
  804691:	e8 e4 ca ff ff       	call   80117a <vmfree>
    for(;(*p&PAGE_PRESENT)!=0;p++)
  804696:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
  80469b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80469f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8046a2:	83 e0 01             	and    eax,0x1
  8046a5:	48 85 c0             	test   rax,rax
  8046a8:	75 8e                	jne    804638 <del_proc+0x54>
    }
    //释放存放页目录的页面
    vmfree(p);
  8046aa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046ae:	48 89 c7             	mov    rdi,rax
  8046b1:	e8 c4 ca ff ff       	call   80117a <vmfree>
    //从进程中解除cr3,tss和ldt
    //switch_proc_tss(task[pnr]);
}
  8046b6:	90                   	nop
  8046b7:	c9                   	leave  
  8046b8:	c3                   	ret    

00000000008046b9 <set_proc_stat>:

int set_proc_stat(int pid,int stat)
{
  8046b9:	f3 0f 1e fa          	endbr64 
  8046bd:	55                   	push   rbp
  8046be:	48 89 e5             	mov    rbp,rsp
  8046c1:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8046c4:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==-1)return -1;
  8046c7:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  8046cb:	75 0a                	jne    8046d7 <set_proc_stat+0x1e>
  8046cd:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8046d2:	e9 8c 00 00 00       	jmp    804763 <set_proc_stat+0xaa>
    int i=0;
  8046d7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;task[i].pid!=pid;i++);
  8046de:	eb 04                	jmp    8046e4 <set_proc_stat+0x2b>
  8046e0:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8046e4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8046e7:	48 63 d0             	movsxd rdx,eax
  8046ea:	48 89 d0             	mov    rax,rdx
  8046ed:	48 01 c0             	add    rax,rax
  8046f0:	48 01 d0             	add    rax,rdx
  8046f3:	48 c1 e0 08          	shl    rax,0x8
  8046f7:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8046fd:	8b 10                	mov    edx,DWORD PTR [rax]
  8046ff:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804702:	39 c2                	cmp    edx,eax
  804704:	75 da                	jne    8046e0 <set_proc_stat+0x27>
    if(i==MAX_PROC_COUNT)return -1;
  804706:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  80470a:	75 07                	jne    804713 <set_proc_stat+0x5a>
  80470c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804711:	eb 50                	jmp    804763 <set_proc_stat+0xaa>
    task[i].stat=stat;
  804713:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804716:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804719:	48 63 c8             	movsxd rcx,eax
  80471c:	48 89 c8             	mov    rax,rcx
  80471f:	48 01 c0             	add    rax,rax
  804722:	48 01 c8             	add    rax,rcx
  804725:	48 c1 e0 08          	shl    rax,0x8
  804729:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80472f:	89 10                	mov    DWORD PTR [rax],edx
    //如果这就是正在运行的进程，那么马上停止
    if(cur_proc==i)
  804731:	8b 05 d5 fd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fdd5]        # 41450c <cur_proc>
  804737:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  80473a:	75 22                	jne    80475e <set_proc_stat+0xa5>
        task[cur_proc].utime=MAX_UTIME;
  80473c:	8b 05 ca fd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fdca]        # 41450c <cur_proc>
  804742:	48 63 d0             	movsxd rdx,eax
  804745:	48 89 d0             	mov    rax,rdx
  804748:	48 01 c0             	add    rax,rax
  80474b:	48 01 d0             	add    rax,rdx
  80474e:	48 c1 e0 08          	shl    rax,0x8
  804752:	48 05 a8 84 40 00    	add    rax,0x4084a8
  804758:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    return 0;
  80475e:	b8 00 00 00 00       	mov    eax,0x0
}
  804763:	5d                   	pop    rbp
  804764:	c3                   	ret    

0000000000804765 <add_proc_openf>:

    return 0;
} */

int add_proc_openf(vfs_dir_entry *entry)
{
  804765:	f3 0f 1e fa          	endbr64 
  804769:	55                   	push   rbp
  80476a:	48 89 e5             	mov    rbp,rsp
  80476d:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_PROC_OPENF;i++){
  804771:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  804778:	eb 6a                	jmp    8047e4 <add_proc_openf+0x7f>
        if(task[cur_proc].openf[i]==NULL)
  80477a:	8b 05 8c fd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fd8c]        # 41450c <cur_proc>
  804780:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804783:	48 63 ca             	movsxd rcx,edx
  804786:	48 63 d0             	movsxd rdx,eax
  804789:	48 89 d0             	mov    rax,rdx
  80478c:	48 01 c0             	add    rax,rax
  80478f:	48 01 d0             	add    rax,rdx
  804792:	48 c1 e0 05          	shl    rax,0x5
  804796:	48 01 c8             	add    rax,rcx
  804799:	48 83 c0 18          	add    rax,0x18
  80479d:	48 8b 04 c5 a4 84 40 	mov    rax,QWORD PTR [rax*8+0x4084a4]
  8047a4:	00 
  8047a5:	48 85 c0             	test   rax,rax
  8047a8:	75 36                	jne    8047e0 <add_proc_openf+0x7b>
        {
            task[cur_proc].openf[i]=entry;
  8047aa:	8b 05 5c fd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fd5c]        # 41450c <cur_proc>
  8047b0:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8047b3:	48 63 ca             	movsxd rcx,edx
  8047b6:	48 63 d0             	movsxd rdx,eax
  8047b9:	48 89 d0             	mov    rax,rdx
  8047bc:	48 01 c0             	add    rax,rax
  8047bf:	48 01 d0             	add    rax,rdx
  8047c2:	48 c1 e0 05          	shl    rax,0x5
  8047c6:	48 01 c8             	add    rax,rcx
  8047c9:	48 8d 50 18          	lea    rdx,[rax+0x18]
  8047cd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8047d1:	48 89 04 d5 a4 84 40 	mov    QWORD PTR [rdx*8+0x4084a4],rax
  8047d8:	00 
            return 0;
  8047d9:	b8 00 00 00 00       	mov    eax,0x0
  8047de:	eb 0f                	jmp    8047ef <add_proc_openf+0x8a>
    for(int i=0;i<MAX_PROC_OPENF;i++){
  8047e0:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8047e4:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  8047e8:	7e 90                	jle    80477a <add_proc_openf+0x15>
        }
    }
    return -1;//full
  8047ea:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8047ef:	5d                   	pop    rbp
  8047f0:	c3                   	ret    

00000000008047f1 <sys_exit>:
/*
 * 进程结束。
 * */
int sys_exit(int code)
{
  8047f1:	f3 0f 1e fa          	endbr64 
  8047f5:	55                   	push   rbp
  8047f6:	48 89 e5             	mov    rbp,rsp
  8047f9:	48 83 ec 10          	sub    rsp,0x10
  8047fd:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    del_proc(cur_proc);
  804800:	8b 05 06 fd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fd06]        # 41450c <cur_proc>
  804806:	89 c7                	mov    edi,eax
  804808:	e8 d7 fd ff ff       	call   8045e4 <del_proc>
    return code;
  80480d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  804810:	c9                   	leave  
  804811:	c3                   	ret    

0000000000804812 <reg_proc>:
    dllmain(NULL,0,NULL);
    
}*/

int reg_proc(int entry, vfs_dir_entry *cwd, vfs_dir_entry *exef)
{
  804812:	f3 0f 1e fa          	endbr64 
  804816:	55                   	push   rbp
  804817:	48 89 e5             	mov    rbp,rsp
  80481a:	48 83 ec 40          	sub    rsp,0x40
  80481e:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  804821:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  804825:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
    
    int i=req_proc();
  804829:	b8 00 00 00 00       	mov    eax,0x0
  80482e:	e8 9c f4 ff ff       	call   803ccf <req_proc>
  804833:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(i==-1)return -1;
  804836:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  80483a:	75 0a                	jne    804846 <reg_proc+0x34>
  80483c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804841:	e9 65 01 00 00       	jmp    8049ab <reg_proc+0x199>
    /*set_proc(0,0,0,0,SEL_LDT_DATA,SEL_LDT_CODE,SEL_LDT_STACK,SEL_LDT_DATA\
    ,SEL_LDT_DATA,SEL_LDT_DATA,0x1c00000-4,0,0,0,0,i);*/
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10\
  804846:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804849:	50                   	push   rax
  80484a:	6a 00                	push   0x0
  80484c:	6a 00                	push   0x0
  80484e:	6a 00                	push   0x0
  804850:	6a 00                	push   0x0
  804852:	6a 00                	push   0x0
  804854:	68 fc ff bf 01       	push   0x1bffffc
  804859:	6a 10                	push   0x10
  80485b:	6a 10                	push   0x10
  80485d:	6a 10                	push   0x10
  80485f:	6a 10                	push   0x10
  804861:	41 b9 08 00 00 00    	mov    r9d,0x8
  804867:	41 b8 10 00 00 00    	mov    r8d,0x10
  80486d:	b9 00 00 00 00       	mov    ecx,0x0
  804872:	ba 00 00 00 00       	mov    edx,0x0
  804877:	be 00 00 00 00       	mov    esi,0x0
  80487c:	bf 00 00 00 00       	mov    edi,0x0
  804881:	e8 42 f5 ff ff       	call   803dc8 <set_proc>
  804886:	48 83 c4 58          	add    rsp,0x58
, 0x10, 0x10, 0x1c00000 - 4, 0, 0, 0, 0, 0, i);
    task[i].pml4=vmalloc();
  80488a:	b8 00 00 00 00       	mov    eax,0x0
  80488f:	e8 57 c8 ff ff       	call   8010eb <vmalloc>
  804894:	48 89 c1             	mov    rcx,rax
  804897:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80489a:	48 63 d0             	movsxd rdx,eax
  80489d:	48 89 d0             	mov    rax,rdx
  8048a0:	48 01 c0             	add    rax,rax
  8048a3:	48 01 d0             	add    rax,rdx
  8048a6:	48 c1 e0 08          	shl    rax,0x8
  8048aa:	48 05 40 85 40 00    	add    rax,0x408540
  8048b0:	48 89 48 0c          	mov    QWORD PTR [rax+0xc],rcx
    int *pt=vmalloc();
  8048b4:	b8 00 00 00 00       	mov    eax,0x0
  8048b9:	e8 2d c8 ff ff       	call   8010eb <vmalloc>
  8048be:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    task[i].pml4[0]=PAGE_TABLE_ADDR|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;
  8048c2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8048c5:	48 63 d0             	movsxd rdx,eax
  8048c8:	48 89 d0             	mov    rax,rdx
  8048cb:	48 01 c0             	add    rax,rax
  8048ce:	48 01 d0             	add    rax,rdx
  8048d1:	48 c1 e0 08          	shl    rax,0x8
  8048d5:	48 05 40 85 40 00    	add    rax,0x408540
  8048db:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8048df:	48 c7 00 07 20 00 00 	mov    QWORD PTR [rax],0x2007
    /*for(int j=0;j<32;j++)
        pt[j]=(PAGE_TABLE_ADDR+j*0x1000)|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;//复制内核页表*/
    //PAGE_TABLE_ADDR|PAGE_PRESENT;//复制内核页表
    //task[i].pml4[7]=PAGE_TABLE_ADDR+7*0x1000|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//sys.dll
    int *stackb=vmalloc();
  8048e6:	b8 00 00 00 00       	mov    eax,0x0
  8048eb:	e8 fb c7 ff ff       	call   8010eb <vmalloc>
  8048f0:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    task[i].pml4[6]=(int)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  8048f4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8048f8:	83 c8 07             	or     eax,0x7
  8048fb:	89 c1                	mov    ecx,eax
  8048fd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804900:	48 63 d0             	movsxd rdx,eax
  804903:	48 89 d0             	mov    rax,rdx
  804906:	48 01 c0             	add    rax,rax
  804909:	48 01 d0             	add    rax,rdx
  80490c:	48 c1 e0 08          	shl    rax,0x8
  804910:	48 05 40 85 40 00    	add    rax,0x408540
  804916:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  80491a:	48 8d 50 30          	lea    rdx,[rax+0x30]
  80491e:	48 63 c1             	movsxd rax,ecx
  804921:	48 89 02             	mov    QWORD PTR [rdx],rax
    stackb[1023]=get_phyaddr(req_a_page())|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  804924:	b8 00 00 00 00       	mov    eax,0x0
  804929:	e8 51 cb ff ff       	call   80147f <req_a_page>
  80492e:	89 c7                	mov    edi,eax
  804930:	e8 f8 cc ff ff       	call   80162d <get_phyaddr>
  804935:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804939:	48 81 c2 fc 0f 00 00 	add    rdx,0xffc
  804940:	83 c8 07             	or     eax,0x7
  804943:	89 02                	mov    DWORD PTR [rdx],eax
//    task[i].tss.cr3=task[i].pml4;

    task[i].stat=READY;
  804945:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804948:	48 63 d0             	movsxd rdx,eax
  80494b:	48 89 d0             	mov    rax,rdx
  80494e:	48 01 c0             	add    rax,rax
  804951:	48 01 d0             	add    rax,rdx
  804954:	48 c1 e0 08          	shl    rax,0x8
  804958:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80495e:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[i].cwd=cwd;
  804964:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804967:	48 63 d0             	movsxd rdx,eax
  80496a:	48 89 d0             	mov    rax,rdx
  80496d:	48 01 c0             	add    rax,rax
  804970:	48 01 d0             	add    rax,rdx
  804973:	48 c1 e0 08          	shl    rax,0x8
  804977:	48 8d 90 50 85 40 00 	lea    rdx,[rax+0x408550]
  80497e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804982:	48 89 42 04          	mov    QWORD PTR [rdx+0x4],rax
    task[i].exef=exef;
  804986:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804989:	48 63 d0             	movsxd rdx,eax
  80498c:	48 89 d0             	mov    rax,rdx
  80498f:	48 01 c0             	add    rax,rax
  804992:	48 01 d0             	add    rax,rdx
  804995:	48 c1 e0 08          	shl    rax,0x8
  804999:	48 8d 90 50 85 40 00 	lea    rdx,[rax+0x408550]
  8049a0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8049a4:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
    task[i].tss.ss=0x10;
    task[i].tss.gs=0x10;
    task[i].tss.fs=0x10;
    task[i].tss.cs=0x8;*/
//    task[i].tss.eip=entry;
    return i;
  8049a8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    proc_ret_stack *pstack=stack_paddr+stack_size-12;
    pstack->argc=0;
    pstack->argv=0;
    pstack->proc_end_addr=proc_end;
    int *pptr=pstack;*/
}
  8049ab:	c9                   	leave  
  8049ac:	c3                   	ret    

00000000008049ad <sys_malloc>:

void * sys_malloc(int size)
{
  8049ad:	f3 0f 1e fa          	endbr64 
  8049b1:	55                   	push   rbp
  8049b2:	48 89 e5             	mov    rbp,rsp
  8049b5:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    //
    int n=size/CHUNK_SIZE+size%CHUNK_SIZE?1:0;
  8049b8:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8049bb:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8049c1:	85 c0                	test   eax,eax
  8049c3:	0f 48 c2             	cmovs  eax,edx
  8049c6:	c1 f8 0c             	sar    eax,0xc
  8049c9:	89 c1                	mov    ecx,eax
  8049cb:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8049ce:	99                   	cdq    
  8049cf:	c1 ea 14             	shr    edx,0x14
  8049d2:	01 d0                	add    eax,edx
  8049d4:	25 ff 0f 00 00       	and    eax,0xfff
  8049d9:	29 d0                	sub    eax,edx
  8049db:	01 c8                	add    eax,ecx
  8049dd:	85 c0                	test   eax,eax
  8049df:	0f 95 c0             	setne  al
  8049e2:	0f b6 c0             	movzx  eax,al
  8049e5:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    chunk_header *hp=(chunk_header*)task[cur_proc].mem_struct.heap_base;
  8049e8:	8b 05 1e fb c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fb1e]        # 41450c <cur_proc>
  8049ee:	48 63 d0             	movsxd rdx,eax
  8049f1:	48 89 d0             	mov    rax,rdx
  8049f4:	48 01 c0             	add    rax,rax
  8049f7:	48 01 d0             	add    rax,rdx
  8049fa:	48 c1 e0 08          	shl    rax,0x8
  8049fe:	48 05 b4 84 40 00    	add    rax,0x4084b4
  804a04:	8b 00                	mov    eax,DWORD PTR [rax]
  804a06:	48 98                	cdqe   
  804a08:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804a0c:	eb 0c                	jmp    804a1a <sys_malloc+0x6d>
        hp=hp->next;
  804a0e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a12:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804a16:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804a1a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a1e:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804a22:	48 85 c0             	test   rax,rax
  804a25:	74 16                	je     804a3d <sys_malloc+0x90>
  804a27:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a2b:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804a2e:	85 c0                	test   eax,eax
  804a30:	75 0b                	jne    804a3d <sys_malloc+0x90>
  804a32:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a36:	8b 00                	mov    eax,DWORD PTR [rax]
  804a38:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804a3b:	7e d1                	jle    804a0e <sys_malloc+0x61>
    if(hp->pgn<n)
  804a3d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a41:	8b 00                	mov    eax,DWORD PTR [rax]
  804a43:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804a46:	0f 8e 8d 00 00 00    	jle    804ad9 <sys_malloc+0x12c>
    {
        //上抬heap top
        if(task[cur_proc].mem_struct.heap_top+CHUNK_SIZE*n>=HEAP_MAXTOP)
  804a4c:	8b 05 ba fa c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0faba]        # 41450c <cur_proc>
  804a52:	48 63 d0             	movsxd rdx,eax
  804a55:	48 89 d0             	mov    rax,rdx
  804a58:	48 01 c0             	add    rax,rax
  804a5b:	48 01 d0             	add    rax,rdx
  804a5e:	48 c1 e0 08          	shl    rax,0x8
  804a62:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804a68:	8b 10                	mov    edx,DWORD PTR [rax]
  804a6a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804a6d:	c1 e0 0c             	shl    eax,0xc
  804a70:	01 d0                	add    eax,edx
  804a72:	3d ff ff ef 01       	cmp    eax,0x1efffff
  804a77:	7e 0a                	jle    804a83 <sys_malloc+0xd6>
        {
            //超过顶部
            return NULL;
  804a79:	b8 00 00 00 00       	mov    eax,0x0
  804a7e:	e9 cf 00 00 00       	jmp    804b52 <sys_malloc+0x1a5>
        }
        int needed=n-hp->pgn;
  804a83:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a87:	8b 10                	mov    edx,DWORD PTR [rax]
  804a89:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804a8c:	29 d0                	sub    eax,edx
  804a8e:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
        char* p=task[cur_proc].mem_struct.heap_top;
  804a91:	8b 05 75 fa c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fa75]        # 41450c <cur_proc>
  804a97:	48 63 d0             	movsxd rdx,eax
  804a9a:	48 89 d0             	mov    rax,rdx
  804a9d:	48 01 c0             	add    rax,rax
  804aa0:	48 01 d0             	add    rax,rdx
  804aa3:	48 c1 e0 08          	shl    rax,0x8
  804aa7:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804aad:	8b 00                	mov    eax,DWORD PTR [rax]
  804aaf:	48 98                	cdqe   
  804ab1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804ab5:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804abc:	eb 13                	jmp    804ad1 <sys_malloc+0x124>
        {
            *p=0;//触发缺页中断
  804abe:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804ac2:	c6 00 00             	mov    BYTE PTR [rax],0x0
            p+=PAGE_SIZE;
  804ac5:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  804acc:	00 
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804acd:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804ad1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804ad4:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  804ad7:	7c e5                	jl     804abe <sys_malloc+0x111>
        }
    }
    if(hp->pgn>n)
  804ad9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804add:	8b 00                	mov    eax,DWORD PTR [rax]
  804adf:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804ae2:	7d 59                	jge    804b3d <sys_malloc+0x190>
    {
        //在后面新建一个头
        char *p=hp;
  804ae4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804ae8:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        p+=(n+1)*CHUNK_SIZE;//算上存储头一个
  804aec:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804aef:	83 c0 01             	add    eax,0x1
  804af2:	c1 e0 0c             	shl    eax,0xc
  804af5:	48 98                	cdqe   
  804af7:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
        chunk_header *np=p;
  804afb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804aff:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
        np->pgn=hp->pgn-n-1;
  804b03:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b07:	8b 00                	mov    eax,DWORD PTR [rax]
  804b09:	2b 45 e8             	sub    eax,DWORD PTR [rbp-0x18]
  804b0c:	8d 50 ff             	lea    edx,[rax-0x1]
  804b0f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804b13:	89 10                	mov    DWORD PTR [rax],edx
        np->next=hp->next;
  804b15:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b19:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  804b1d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804b21:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
        np->prev=hp;
  804b25:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804b29:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804b2d:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
        hp->next=np;
  804b31:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b35:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804b39:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    }
    hp->alloc=1;//分配完毕
  804b3d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b41:	c7 40 04 01 00 00 00 	mov    DWORD PTR [rax+0x4],0x1
    return (char*)hp+CHUNK_SIZE;//返回后边的第一个数据块地址
  804b48:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b4c:	48 05 00 10 00 00    	add    rax,0x1000
}
  804b52:	5d                   	pop    rbp
  804b53:	c3                   	ret    

0000000000804b54 <sys_free>:
int sys_free(int ptr)
{
  804b54:	f3 0f 1e fa          	endbr64 
  804b58:	55                   	push   rbp
  804b59:	48 89 e5             	mov    rbp,rsp
  804b5c:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    chunk_header *hp=ptr-CHUNK_SIZE;//回退到头
  804b5f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804b62:	2d 00 10 00 00       	sub    eax,0x1000
  804b67:	48 98                	cdqe   
  804b69:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    hp->alloc=0;
  804b6d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b71:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
    //合并
    //向后合并
    chunk_header *p=hp->next;
  804b78:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b7c:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804b80:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804b84:	eb 2e                	jmp    804bb4 <sys_free+0x60>
    {
        if(p->alloc==0)
  804b86:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b8a:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804b8d:	85 c0                	test   eax,eax
  804b8f:	75 2c                	jne    804bbd <sys_free+0x69>
        {
            hp->pgn+=p->pgn+1;//把区域合并
  804b91:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b95:	8b 10                	mov    edx,DWORD PTR [rax]
  804b97:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b9b:	8b 00                	mov    eax,DWORD PTR [rax]
  804b9d:	83 c0 01             	add    eax,0x1
  804ba0:	01 c2                	add    edx,eax
  804ba2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804ba6:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->next;
  804ba8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804bac:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804bb0:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804bb4:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804bb9:	75 cb                	jne    804b86 <sys_free+0x32>
  804bbb:	eb 01                	jmp    804bbe <sys_free+0x6a>
            break;
  804bbd:	90                   	nop
    }
    //向前合并
    p=hp->prev;
  804bbe:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804bc2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  804bc6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804bca:	eb 2e                	jmp    804bfa <sys_free+0xa6>
    {
        if(p->alloc==0)
  804bcc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804bd0:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804bd3:	85 c0                	test   eax,eax
  804bd5:	75 2c                	jne    804c03 <sys_free+0xaf>
        {
            p->pgn+=hp->pgn+1;//把区域合并
  804bd7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804bdb:	8b 10                	mov    edx,DWORD PTR [rax]
  804bdd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804be1:	8b 00                	mov    eax,DWORD PTR [rax]
  804be3:	83 c0 01             	add    eax,0x1
  804be6:	01 c2                	add    edx,eax
  804be8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804bec:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->prev;
  804bee:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804bf2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  804bf6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804bfa:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804bff:	75 cb                	jne    804bcc <sys_free+0x78>
  804c01:	eb 01                	jmp    804c04 <sys_free+0xb0>
            break;
  804c03:	90                   	nop
    }
    //合并完成
    return 0;
  804c04:	b8 00 00 00 00       	mov    eax,0x0
}
  804c09:	5d                   	pop    rbp
  804c0a:	c3                   	ret    

0000000000804c0b <switch_to>:

void switch_to(struct process *from, struct process *to) {
  804c0b:	f3 0f 1e fa          	endbr64 
  804c0f:	55                   	push   rbp
  804c10:	48 89 e5             	mov    rbp,rsp
  804c13:	53                   	push   rbx
  804c14:	48 89 7d f0          	mov    QWORD PTR [rbp-0x10],rdi
  804c18:	48 89 75 e8          	mov    QWORD PTR [rbp-0x18],rsi
    cur_proc=to-task;
  804c1c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804c20:	48 2d a0 84 40 00    	sub    rax,0x4084a0
  804c26:	48 c1 f8 08          	sar    rax,0x8
  804c2a:	48 89 c2             	mov    rdx,rax
  804c2d:	48 b8 ab aa aa aa aa 	movabs rax,0xaaaaaaaaaaaaaaab
  804c34:	aa aa aa 
  804c37:	48 0f af c2          	imul   rax,rdx
  804c3b:	89 05 cb f8 c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0f8cb],eax        # 41450c <cur_proc>
    asm volatile("mov %%rsp,%0\r\n"
  804c41:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  804c45:	4c 8b 55 f0          	mov    r10,QWORD PTR [rbp-0x10]
  804c49:	4c 8b 5d f0          	mov    r11,QWORD PTR [rbp-0x10]
  804c4d:	48 8b 5d f0          	mov    rbx,QWORD PTR [rbp-0x10]
  804c51:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804c55:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804c59:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  804c5d:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  804c61:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  804c65:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  804c69:	49 89 a1 68 02 00 00 	mov    QWORD PTR [r9+0x268],rsp
  804c70:	48 8d 05 24 00 00 00 	lea    rax,[rip+0x24]        # 804c9b <done>
  804c77:	49 89 82 38 02 00 00 	mov    QWORD PTR [r10+0x238],rax
  804c7e:	41 8c a3 a8 02 00 00 	mov    WORD PTR [r11+0x2a8],fs
  804c85:	8c ab b0 02 00 00    	mov    WORD PTR [rbx+0x2b0],gs
  804c8b:	48 8b a1 68 02 00 00 	mov    rsp,QWORD PTR [rcx+0x268]
  804c92:	41 ff b0 38 02 00 00 	push   QWORD PTR [r8+0x238]
  804c99:	eb 08                	jmp    804ca3 <__switch_to>

0000000000804c9b <done>:
  804c9b:	90                   	nop
                 "nop":"=m"(from->regs.rsp),"=m"(from->regs.rip),
                 "=m"(from->regs.fs),"=m"(from->regs.gs):
                "m"(to->regs.fs),"m"(to->regs.gs),"m"(to->regs.rsp),"m"(to->regs.rip),
                "D"(from),"S"(to));

}
  804c9c:	90                   	nop
  804c9d:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804ca1:	c9                   	leave  
  804ca2:	c3                   	ret    

0000000000804ca3 <__switch_to>:
void __switch_to(struct process *from, struct process *to) {
  804ca3:	f3 0f 1e fa          	endbr64 
  804ca7:	55                   	push   rbp
  804ca8:	48 89 e5             	mov    rbp,rsp
  804cab:	53                   	push   rbx
  804cac:	48 83 ec 18          	sub    rsp,0x18
  804cb0:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  804cb4:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804cb8:	48 8b 05 01 62 00 00 	mov    rax,QWORD PTR [rip+0x6201]        # 80aec0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804cbf:	4c 8b 50 54          	mov    r10,QWORD PTR [rax+0x54]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804cc3:	48 8b 05 f6 61 00 00 	mov    rax,QWORD PTR [rip+0x61f6]        # 80aec0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804cca:	4c 8b 48 4c          	mov    r9,QWORD PTR [rax+0x4c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804cce:	48 8b 05 eb 61 00 00 	mov    rax,QWORD PTR [rip+0x61eb]        # 80aec0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804cd5:	4c 8b 40 44          	mov    r8,QWORD PTR [rax+0x44]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804cd9:	48 8b 05 e0 61 00 00 	mov    rax,QWORD PTR [rip+0x61e0]        # 80aec0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804ce0:	48 8b 78 3c          	mov    rdi,QWORD PTR [rax+0x3c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804ce4:	48 8b 05 d5 61 00 00 	mov    rax,QWORD PTR [rip+0x61d5]        # 80aec0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804ceb:	48 8b 58 34          	mov    rbx,QWORD PTR [rax+0x34]
  804cef:	48 8b 05 ca 61 00 00 	mov    rax,QWORD PTR [rip+0x61ca]        # 80aec0 <tss>
  804cf6:	4c 8b 58 2c          	mov    r11,QWORD PTR [rax+0x2c]
  804cfa:	48 8b 05 bf 61 00 00 	mov    rax,QWORD PTR [rip+0x61bf]        # 80aec0 <tss>
  804d01:	48 8b 48 24          	mov    rcx,QWORD PTR [rax+0x24]
  804d05:	48 8b 05 b4 61 00 00 	mov    rax,QWORD PTR [rip+0x61b4]        # 80aec0 <tss>
  804d0c:	48 8b 50 14          	mov    rdx,QWORD PTR [rax+0x14]
  804d10:	48 8b 05 a9 61 00 00 	mov    rax,QWORD PTR [rip+0x61a9]        # 80aec0 <tss>
  804d17:	48 8b 70 0c          	mov    rsi,QWORD PTR [rax+0xc]
  804d1b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804d1f:	48 8b 80 c8 01 00 00 	mov    rax,QWORD PTR [rax+0x1c8]
  804d26:	41 52                	push   r10
  804d28:	41 51                	push   r9
  804d2a:	41 50                	push   r8
  804d2c:	57                   	push   rdi
  804d2d:	49 89 d9             	mov    r9,rbx
  804d30:	4d 89 d8             	mov    r8,r11
  804d33:	48 89 c7             	mov    rdi,rax
  804d36:	e8 33 00 00 00       	call   804d6e <set_tss>
  804d3b:	48 83 c4 20          	add    rsp,0x20
    asm volatile("mov %%fs,%0\r\n"
  804d3f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804d43:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  804d47:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804d4b:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  804d4f:	8c a0 a8 02 00 00    	mov    WORD PTR [rax+0x2a8],fs
  804d55:	8c ae b0 02 00 00    	mov    WORD PTR [rsi+0x2b0],gs
  804d5b:	8e a2 a8 02 00 00    	mov    fs,WORD PTR [rdx+0x2a8]
  804d61:	8e a9 b0 02 00 00    	mov    gs,WORD PTR [rcx+0x2b0]
                 "mov %%gs,%1\r\n"
                 "mov %2,%%fs\r\n"
                 "mov %3,%%gs":"=m"(to->regs.fs),"=m"(to->regs.gs):
                 "m"(from->regs.fs),"m"(from->regs.gs));
}
  804d67:	90                   	nop
  804d68:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804d6c:	c9                   	leave  
  804d6d:	c3                   	ret    

0000000000804d6e <set_tss>:

void set_tss(u64 rsp0,u64 rsp1,u64 rsp2,u64 ist0,u64 ist1,u64 ist2,u64 ist3,u64 ist4,u64 ist5,u64 ist6){
  804d6e:	f3 0f 1e fa          	endbr64 
  804d72:	55                   	push   rbp
  804d73:	48 89 e5             	mov    rbp,rsp
  804d76:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  804d7a:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  804d7e:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  804d82:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  804d86:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
  804d8a:	4c 89 4d d0          	mov    QWORD PTR [rbp-0x30],r9
    tss->rsp0=rsp0;
  804d8e:	48 8b 05 2b 61 00 00 	mov    rax,QWORD PTR [rip+0x612b]        # 80aec0 <tss>
  804d95:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804d99:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx
    tss->rsp1=rsp1;
  804d9d:	48 8b 05 1c 61 00 00 	mov    rax,QWORD PTR [rip+0x611c]        # 80aec0 <tss>
  804da4:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  804da8:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    tss->rsp2=rsp2;
  804dac:	48 8b 05 0d 61 00 00 	mov    rax,QWORD PTR [rip+0x610d]        # 80aec0 <tss>
  804db3:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804db7:	48 89 50 14          	mov    QWORD PTR [rax+0x14],rdx
    tss->ists[0]=ist0;
  804dbb:	48 8b 05 fe 60 00 00 	mov    rax,QWORD PTR [rip+0x60fe]        # 80aec0 <tss>
  804dc2:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  804dc6:	48 89 50 24          	mov    QWORD PTR [rax+0x24],rdx
    tss->ists[1]=ist1;
  804dca:	48 8b 05 ef 60 00 00 	mov    rax,QWORD PTR [rip+0x60ef]        # 80aec0 <tss>
  804dd1:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  804dd5:	48 89 50 2c          	mov    QWORD PTR [rax+0x2c],rdx
    tss->ists[2]=ist2;
  804dd9:	48 8b 05 e0 60 00 00 	mov    rax,QWORD PTR [rip+0x60e0]        # 80aec0 <tss>
  804de0:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804de4:	48 89 50 34          	mov    QWORD PTR [rax+0x34],rdx
    tss->ists[3]=ist3;
  804de8:	48 8b 05 d1 60 00 00 	mov    rax,QWORD PTR [rip+0x60d1]        # 80aec0 <tss>
  804def:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  804df3:	48 89 50 3c          	mov    QWORD PTR [rax+0x3c],rdx
    tss->ists[4]=ist4;
  804df7:	48 8b 05 c2 60 00 00 	mov    rax,QWORD PTR [rip+0x60c2]        # 80aec0 <tss>
  804dfe:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  804e02:	48 89 50 44          	mov    QWORD PTR [rax+0x44],rdx
    tss->ists[5]=ist5;
  804e06:	48 8b 05 b3 60 00 00 	mov    rax,QWORD PTR [rip+0x60b3]        # 80aec0 <tss>
  804e0d:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  804e11:	48 89 50 4c          	mov    QWORD PTR [rax+0x4c],rdx
    tss->ists[6]=ist6;
  804e15:	48 8b 05 a4 60 00 00 	mov    rax,QWORD PTR [rip+0x60a4]        # 80aec0 <tss>
  804e1c:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  804e20:	48 89 50 54          	mov    QWORD PTR [rax+0x54],rdx
}
  804e24:	90                   	nop
  804e25:	5d                   	pop    rbp
  804e26:	c3                   	ret    
  804e27:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  804e2e:	00 00 

0000000000804e30 <outb>:
  804e30:	66 89 fa             	mov    dx,di
  804e33:	66 89 f0             	mov    ax,si
  804e36:	ee                   	out    dx,al
  804e37:	e8 29 00 00 00       	call   804e65 <io_delay>
  804e3c:	c3                   	ret    

0000000000804e3d <outw>:
  804e3d:	66 89 fa             	mov    dx,di
  804e40:	66 89 f0             	mov    ax,si
  804e43:	66 ef                	out    dx,ax
  804e45:	90                   	nop
  804e46:	90                   	nop
  804e47:	90                   	nop
  804e48:	c3                   	ret    

0000000000804e49 <inb>:
  804e49:	31 c0                	xor    eax,eax
  804e4b:	66 89 fa             	mov    dx,di
  804e4e:	ec                   	in     al,dx
  804e4f:	90                   	nop
  804e50:	90                   	nop
  804e51:	90                   	nop
  804e52:	c3                   	ret    

0000000000804e53 <inw>:
  804e53:	31 c0                	xor    eax,eax
  804e55:	66 89 fa             	mov    dx,di
  804e58:	66 ed                	in     ax,dx
  804e5a:	90                   	nop
  804e5b:	90                   	nop
  804e5c:	90                   	nop
  804e5d:	c3                   	ret    

0000000000804e5e <eoi>:
  804e5e:	b0 20                	mov    al,0x20
  804e60:	e6 a0                	out    0xa0,al
  804e62:	e6 20                	out    0x20,al
  804e64:	c3                   	ret    

0000000000804e65 <io_delay>:
  804e65:	90                   	nop
  804e66:	90                   	nop
  804e67:	90                   	nop
  804e68:	90                   	nop
  804e69:	c3                   	ret    

0000000000804e6a <turn_on_int>:
  804e6a:	b0 f8                	mov    al,0xf8
  804e6c:	e6 21                	out    0x21,al
  804e6e:	e8 f2 ff ff ff       	call   804e65 <io_delay>
  804e73:	b0 af                	mov    al,0xaf
  804e75:	e6 a1                	out    0xa1,al
  804e77:	e8 e9 ff ff ff       	call   804e65 <io_delay>
  804e7c:	b8 00 70 10 00       	mov    eax,0x107000
  804e81:	0f 01 18             	lidt   [rax]
  804e84:	90                   	nop
  804e85:	90                   	nop
  804e86:	90                   	nop
  804e87:	90                   	nop
  804e88:	c3                   	ret    

0000000000804e89 <report_back_trace_of_err>:
  804e89:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  804e8e:	50                   	push   rax
  804e8f:	68 98 4e 80 00       	push   0x804e98
  804e94:	83 c4 08             	add    esp,0x8
  804e97:	c3                   	ret    

0000000000804e98 <bt_msg>:
  804e98:	65 72 72             	gs jb  804f0d <fill_desc+0x4e>
  804e9b:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  804e9c:	72 20                	jb     804ebe <init_gdt+0x11>
  804e9e:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  804e9f:	63 63 75             	movsxd esp,DWORD PTR [rbx+0x75]
  804ea2:	72 73                	jb     804f17 <fill_desc+0x58>
  804ea4:	20 61 74             	and    BYTE PTR [rcx+0x74],ah
  804ea7:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR [rip+0x6e5c78]        # eeab25 <_knl_end+0x2eab25>

0000000000804ead <init_gdt>:
#include "gdt.h"
#include "int.h"
descriptor *gdt=GDT_ADDR;
extern char *gdtptr;
int init_gdt()
{
  804ead:	f3 0f 1e fa          	endbr64 
  804eb1:	55                   	push   rbp
  804eb2:	48 89 e5             	mov    rbp,rsp
//    fill_desc(0x108000,108,SEG_SYS_TSS|SEG_PRESENT,4);
    asm volatile("mov $0x48,%ax\r\n"
  804eb5:	66 b8 48 00          	mov    ax,0x48
  804eb9:	0f 00 d8             	ltr    ax
                 "ltr %ax");  
}
  804ebc:	90                   	nop
  804ebd:	5d                   	pop    rbp
  804ebe:	c3                   	ret    

0000000000804ebf <fill_desc>:
void fill_desc(u64 base, u64 limit, u16 attr, u32 index)
{
  804ebf:	f3 0f 1e fa          	endbr64 
  804ec3:	55                   	push   rbp
  804ec4:	48 89 e5             	mov    rbp,rsp
  804ec7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  804ecb:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  804ecf:	89 d0                	mov    eax,edx
  804ed1:	89 4d e8             	mov    DWORD PTR [rbp-0x18],ecx
  804ed4:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    gdt[index].base_12=base&0xffff;
  804ed8:	48 8b 15 e9 5f 00 00 	mov    rdx,QWORD PTR [rip+0x5fe9]        # 80aec8 <gdt>
  804edf:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804ee2:	48 c1 e0 04          	shl    rax,0x4
  804ee6:	48 01 d0             	add    rax,rdx
  804ee9:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804eed:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    gdt[index].base_3=(base>>16)&0xff;
  804ef1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804ef5:	48 c1 e8 10          	shr    rax,0x10
  804ef9:	48 89 c1             	mov    rcx,rax
  804efc:	48 8b 15 c5 5f 00 00 	mov    rdx,QWORD PTR [rip+0x5fc5]        # 80aec8 <gdt>
  804f03:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804f06:	48 c1 e0 04          	shl    rax,0x4
  804f0a:	48 01 d0             	add    rax,rdx
  804f0d:	89 ca                	mov    edx,ecx
  804f0f:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    gdt[index].base_4=(base>>24)&0xff;
  804f12:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804f16:	48 c1 e8 18          	shr    rax,0x18
  804f1a:	48 89 c1             	mov    rcx,rax
  804f1d:	48 8b 15 a4 5f 00 00 	mov    rdx,QWORD PTR [rip+0x5fa4]        # 80aec8 <gdt>
  804f24:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804f27:	48 c1 e0 04          	shl    rax,0x4
  804f2b:	48 01 d0             	add    rax,rdx
  804f2e:	89 ca                	mov    edx,ecx
  804f30:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    gdt[index].base_5678=(base>>32)&0xffffffff;
  804f33:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804f37:	48 c1 e8 20          	shr    rax,0x20
  804f3b:	48 89 c2             	mov    rdx,rax
  804f3e:	48 8b 0d 83 5f 00 00 	mov    rcx,QWORD PTR [rip+0x5f83]        # 80aec8 <gdt>
  804f45:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804f48:	48 c1 e0 04          	shl    rax,0x4
  804f4c:	48 01 c8             	add    rax,rcx
  804f4f:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    gdt[index].limit_lo16=limit&0xffff;
  804f52:	48 8b 15 6f 5f 00 00 	mov    rdx,QWORD PTR [rip+0x5f6f]        # 80aec8 <gdt>
  804f59:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804f5c:	48 c1 e0 04          	shl    rax,0x4
  804f60:	48 01 d0             	add    rax,rdx
  804f63:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  804f67:	66 89 10             	mov    WORD PTR [rax],dx
    gdt[index].attr=attr|((limit>>8)&0xf0);
  804f6a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804f6e:	48 c1 e8 08          	shr    rax,0x8
  804f72:	66 25 f0 00          	and    ax,0xf0
  804f76:	48 8b 0d 4b 5f 00 00 	mov    rcx,QWORD PTR [rip+0x5f4b]        # 80aec8 <gdt>
  804f7d:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804f80:	48 c1 e2 04          	shl    rdx,0x4
  804f84:	48 01 ca             	add    rdx,rcx
  804f87:	66 0b 45 ec          	or     ax,WORD PTR [rbp-0x14]
  804f8b:	66 89 42 05          	mov    WORD PTR [rdx+0x5],ax

}
  804f8f:	90                   	nop
  804f90:	5d                   	pop    rbp
  804f91:	c3                   	ret    

0000000000804f92 <fill_gate>:

void fill_gate(u32 index,u32 offset,u16 selector,u16 attr)
{
  804f92:	f3 0f 1e fa          	endbr64 
  804f96:	55                   	push   rbp
  804f97:	48 89 e5             	mov    rbp,rsp
  804f9a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  804f9d:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  804fa0:	89 c8                	mov    eax,ecx
  804fa2:	66 89 55 e4          	mov    WORD PTR [rbp-0x1c],dx
  804fa6:	66 89 45 e0          	mov    WORD PTR [rbp-0x20],ax
    gate* ptr=gdt;
  804faa:	48 8b 05 17 5f 00 00 	mov    rax,QWORD PTR [rip+0x5f17]        # 80aec8 <gdt>
  804fb1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ptr[index].offset_low=offset&0xffff;
  804fb5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804fb8:	48 c1 e0 04          	shl    rax,0x4
  804fbc:	48 89 c2             	mov    rdx,rax
  804fbf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804fc3:	48 01 d0             	add    rax,rdx
  804fc6:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804fc9:	66 89 10             	mov    WORD PTR [rax],dx
    ptr[index].offset_high=(offset>>16)&0xffff;
  804fcc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804fcf:	48 c1 e0 04          	shl    rax,0x4
  804fd3:	48 89 c2             	mov    rdx,rax
  804fd6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804fda:	48 01 d0             	add    rax,rdx
  804fdd:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804fe0:	c1 ea 10             	shr    edx,0x10
  804fe3:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    ptr[index].selector=selector;
  804fe6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804fe9:	48 c1 e0 04          	shl    rax,0x4
  804fed:	48 89 c2             	mov    rdx,rax
  804ff0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804ff4:	48 01 c2             	add    rdx,rax
  804ff7:	0f b7 45 e4          	movzx  eax,WORD PTR [rbp-0x1c]
  804ffb:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    ptr[index].attr=attr;
  804fff:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805002:	48 c1 e0 04          	shl    rax,0x4
  805006:	48 89 c2             	mov    rdx,rax
  805009:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80500d:	48 01 c2             	add    rdx,rax
  805010:	0f b7 45 e0          	movzx  eax,WORD PTR [rbp-0x20]
  805014:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
}
  805018:	90                   	nop
  805019:	5d                   	pop    rbp
  80501a:	c3                   	ret    

000000000080501b <fill_ldt_desc>:

void fill_ldt_desc(u32 base, u32 limit,u16 attr,descriptor *desc)
{
  80501b:	f3 0f 1e fa          	endbr64 
  80501f:	55                   	push   rbp
  805020:	48 89 e5             	mov    rbp,rsp
  805023:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  805026:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  805029:	89 d0                	mov    eax,edx
  80502b:	48 89 4d e8          	mov    QWORD PTR [rbp-0x18],rcx
  80502f:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
//    desc->base_lo16=base&0xffff;
//    desc->base_mid8=(base>>16)&0xff;
//    desc->base_hi8=(base>>24)&0xff;
//    desc->limit_lo16=limit&0xffff;
//    desc->attr=attr|(limit>>16&0xf)<<8;
  805033:	90                   	nop
  805034:	5d                   	pop    rbp
  805035:	c3                   	ret    
  805036:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  80503d:	00 00 00 

0000000000805040 <fill_desc>:
  805040:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  805045:	67 8b 5c 24 08       	mov    ebx,DWORD PTR [esp+0x8]
  80504a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  80504f:	67 8b 54 24 10       	mov    edx,DWORD PTR [esp+0x10]
  805054:	be 00 60 00 00       	mov    esi,0x6000
  805059:	c1 e2 03             	shl    edx,0x3
  80505c:	01 d6                	add    esi,edx
  80505e:	66 67 89 1e          	mov    WORD PTR [esi],bx
  805062:	66 67 89 46 02       	mov    WORD PTR [esi+0x2],ax
  805067:	c1 e8 10             	shr    eax,0x10
  80506a:	67 88 46 04          	mov    BYTE PTR [esi+0x4],al
  80506e:	c1 eb 10             	shr    ebx,0x10
  805071:	67 88 5e 06          	mov    BYTE PTR [esi+0x6],bl
  805075:	67 88 66 07          	mov    BYTE PTR [esi+0x7],ah
  805079:	67 09 4e 05          	or     DWORD PTR [esi+0x5],ecx
  80507d:	c3                   	ret    

000000000080507e <clock_c>:
#include <devman.h>
#include <disk.h>
extern int manage_proc_lock;
extern int cur_proc;
extern struct process *task;
void clock_c(){
  80507e:	f3 0f 1e fa          	endbr64 
  805082:	55                   	push   rbp
  805083:	48 89 e5             	mov    rbp,rsp
    //refresh_wnds();
    execute_request();
  805086:	b8 00 00 00 00       	mov    eax,0x0
  80508b:	e8 03 1b 00 00       	call   806b93 <execute_request>
    do_req();
  805090:	b8 00 00 00 00       	mov    eax,0x0
  805095:	e8 5a e7 ff ff       	call   8037f4 <do_req>
    if(!manage_proc_lock)
  80509a:	8b 05 c8 5d 00 00    	mov    eax,DWORD PTR [rip+0x5dc8]        # 80ae68 <manage_proc_lock>
  8050a0:	85 c0                	test   eax,eax
  8050a2:	75 0a                	jne    8050ae <clock_c+0x30>
    {
        manage_proc();
  8050a4:	b8 00 00 00 00       	mov    eax,0x0
  8050a9:	e8 9a ee ff ff       	call   803f48 <manage_proc>
    }
    //puts("1 disk req executed.");
  8050ae:	90                   	nop
  8050af:	5d                   	pop    rbp
  8050b0:	c3                   	ret    
  8050b1:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  8050b8:	00 00 00 
  8050bb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000008050c0 <clock>:
  8050c0:	50                   	push   rax
  8050c1:	53                   	push   rbx
  8050c2:	51                   	push   rcx
  8050c3:	52                   	push   rdx
  8050c4:	57                   	push   rdi
  8050c5:	56                   	push   rsi
  8050c6:	41 50                	push   r8
  8050c8:	41 51                	push   r9
  8050ca:	41 52                	push   r10
  8050cc:	41 53                	push   r11
  8050ce:	41 54                	push   r12
  8050d0:	41 55                	push   r13
  8050d2:	41 56                	push   r14
  8050d4:	41 57                	push   r15
  8050d6:	66 8c c0             	mov    ax,es
  8050d9:	50                   	push   rax
  8050da:	66 8c d8             	mov    ax,ds
  8050dd:	50                   	push   rax
  8050de:	66 b8 10 00          	mov    ax,0x10
  8050e2:	8e c0                	mov    es,eax
  8050e4:	8e d8                	mov    ds,eax

00000000008050e6 <clock.normal_part>:
  8050e6:	b0 20                	mov    al,0x20
  8050e8:	e6 a0                	out    0xa0,al
  8050ea:	e6 20                	out    0x20,al
  8050ec:	e8 8d ff ff ff       	call   80507e <clock_c>
  8050f1:	58                   	pop    rax
  8050f2:	8e d8                	mov    ds,eax
  8050f4:	58                   	pop    rax
  8050f5:	8e c0                	mov    es,eax
  8050f7:	41 5f                	pop    r15
  8050f9:	41 5e                	pop    r14
  8050fb:	41 5d                	pop    r13
  8050fd:	41 5c                	pop    r12
  8050ff:	41 5b                	pop    r11
  805101:	41 5a                	pop    r10
  805103:	41 59                	pop    r9
  805105:	41 58                	pop    r8
  805107:	5e                   	pop    rsi
  805108:	5f                   	pop    rdi
  805109:	5a                   	pop    rdx
  80510a:	59                   	pop    rcx
  80510b:	5b                   	pop    rbx
  80510c:	58                   	pop    rax
  80510d:	48 cf                	iretq  

000000000080510f <execute>:
    return ind;
}
*/

int execute(char *path)
{
  80510f:	f3 0f 1e fa          	endbr64 
  805113:	55                   	push   rbp
  805114:	48 89 e5             	mov    rbp,rsp
  805117:	48 83 ec 30          	sub    rsp,0x30
  80511b:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    //尚未切换到目标进程
    //syscall(SYSCALL_REG_PROC, load_pe,0,0,0,0);
    int fno=-1,cwd_fno=-1;
  80511f:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  805126:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    if((fno=sys_open(path, 1)) == -1)return -1;
  80512d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805131:	be 01 00 00 00       	mov    esi,0x1
  805136:	48 89 c7             	mov    rdi,rax
  805139:	e8 ba ca ff ff       	call   801bf8 <sys_open>
  80513e:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  805141:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  805145:	75 0a                	jne    805151 <execute+0x42>
  805147:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80514c:	e9 b7 00 00 00       	jmp    805208 <execute+0xf9>
    //
    char *p=path;
  805151:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805155:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='\0';p++);
  805159:	eb 05                	jmp    805160 <execute+0x51>
  80515b:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  805160:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805164:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805167:	84 c0                	test   al,al
  805169:	75 f0                	jne    80515b <execute+0x4c>
    for(;*p!='/'&&p>path;p--);
  80516b:	eb 05                	jmp    805172 <execute+0x63>
  80516d:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  805172:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805176:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805179:	3c 2f                	cmp    al,0x2f
  80517b:	74 0a                	je     805187 <execute+0x78>
  80517d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805181:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  805185:	77 e6                	ja     80516d <execute+0x5e>
    if(p>path)
  805187:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80518b:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  80518f:	76 2f                	jbe    8051c0 <execute+0xb1>
    {
        *p='\0';
  805191:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805195:	c6 00 00             	mov    BYTE PTR [rax],0x0
        if((cwd_fno=sys_open(path, 1)) == -1)return -1;
  805198:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80519c:	be 01 00 00 00       	mov    esi,0x1
  8051a1:	48 89 c7             	mov    rdi,rax
  8051a4:	e8 4f ca ff ff       	call   801bf8 <sys_open>
  8051a9:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  8051ac:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  8051b0:	75 07                	jne    8051b9 <execute+0xaa>
  8051b2:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8051b7:	eb 4f                	jmp    805208 <execute+0xf9>
        *p='/';
  8051b9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8051bd:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
    }
    extern vfs_dir_entry opened[];
    extern struct process task[];
    int pi= reg_proc(proc_start, &opened[cwd_fno], &opened[fno]);
  8051c0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8051c3:	48 63 d0             	movsxd rdx,eax
  8051c6:	48 89 d0             	mov    rax,rdx
  8051c9:	48 01 c0             	add    rax,rax
  8051cc:	48 01 d0             	add    rax,rdx
  8051cf:	48 c1 e0 05          	shl    rax,0x5
  8051d3:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  8051da:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8051dd:	48 63 c8             	movsxd rcx,eax
  8051e0:	48 89 c8             	mov    rax,rcx
  8051e3:	48 01 c0             	add    rax,rax
  8051e6:	48 01 c8             	add    rax,rcx
  8051e9:	48 c1 e0 05          	shl    rax,0x5
  8051ed:	48 05 60 06 40 00    	add    rax,0x400660
  8051f3:	b9 80 52 80 00       	mov    ecx,0x805280
  8051f8:	48 89 c6             	mov    rsi,rax
  8051fb:	89 cf                	mov    edi,ecx
  8051fd:	e8 10 f6 ff ff       	call   804812 <reg_proc>
  805202:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    return pi;
  805205:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
}
  805208:	c9                   	leave  
  805209:	c3                   	ret    

000000000080520a <exec_call>:

int exec_call(char *path)
{
  80520a:	f3 0f 1e fa          	endbr64 
  80520e:	55                   	push   rbp
  80520f:	48 89 e5             	mov    rbp,rsp
  805212:	48 83 ec 20          	sub    rsp,0x20
  805216:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pi=execute(path);
  80521a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80521e:	48 89 c7             	mov    rdi,rax
  805221:	e8 e9 fe ff ff       	call   80510f <execute>
  805226:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int tss= _TSS_IND(pi)*8;
  805229:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80522c:	01 c0                	add    eax,eax
  80522e:	83 c0 05             	add    eax,0x5
  805231:	c1 e0 03             	shl    eax,0x3
  805234:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    extern struct process task[];
    extern int cur_proc;
    switch_proc_tss(pi);
  805237:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80523a:	89 c7                	mov    edi,eax
  80523c:	e8 d3 ee ff ff       	call   804114 <switch_proc_tss>
    while(task[pi].stat!=ENDED);
  805241:	90                   	nop
  805242:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805245:	48 63 d0             	movsxd rdx,eax
  805248:	48 89 d0             	mov    rax,rdx
  80524b:	48 01 c0             	add    rax,rax
  80524e:	48 01 d0             	add    rax,rdx
  805251:	48 c1 e0 08          	shl    rax,0x8
  805255:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80525b:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80525e:	83 f8 03             	cmp    eax,0x3
  805261:	75 df                	jne    805242 <exec_call+0x38>
    return task[pi].exit_code;
  805263:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805266:	48 63 d0             	movsxd rdx,eax
  805269:	48 89 d0             	mov    rax,rdx
  80526c:	48 01 c0             	add    rax,rax
  80526f:	48 01 d0             	add    rax,rdx
  805272:	48 c1 e0 08          	shl    rax,0x8
  805276:	48 05 b0 84 40 00    	add    rax,0x4084b0
  80527c:	8b 00                	mov    eax,DWORD PTR [rax]
}
  80527e:	c9                   	leave  
  80527f:	c3                   	ret    

0000000000805280 <proc_start>:
int proc_start()
{
  805280:	f3 0f 1e fa          	endbr64 
  805284:	55                   	push   rbp
  805285:	48 89 e5             	mov    rbp,rsp
    extern struct process task[];
    extern int cur_proc;
    load_pe(&task[cur_proc]);
  805288:	8b 05 7e f2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f27e]        # 41450c <cur_proc>
  80528e:	48 63 d0             	movsxd rdx,eax
  805291:	48 89 d0             	mov    rax,rdx
  805294:	48 01 c0             	add    rax,rax
  805297:	48 01 d0             	add    rax,rdx
  80529a:	48 c1 e0 08          	shl    rax,0x8
  80529e:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8052a4:	48 89 c7             	mov    rdi,rax
  8052a7:	e8 1a 00 00 00       	call   8052c6 <load_pe>
    //释放进程资源
    del_proc(cur_proc);
  8052ac:	8b 05 5a f2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f25a]        # 41450c <cur_proc>
  8052b2:	89 c7                	mov    edi,eax
  8052b4:	e8 2b f3 ff ff       	call   8045e4 <del_proc>
    switch_proc_tss(0);
  8052b9:	bf 00 00 00 00       	mov    edi,0x0
  8052be:	e8 51 ee ff ff       	call   804114 <switch_proc_tss>
}
  8052c3:	90                   	nop
  8052c4:	5d                   	pop    rbp
  8052c5:	c3                   	ret    

00000000008052c6 <load_pe>:
//在cr3切换到目标进程下的加载程序(但进程还没调度到那里)。
int load_pe(struct process *proc)
{
  8052c6:	f3 0f 1e fa          	endbr64 
  8052ca:	55                   	push   rbp
  8052cb:	48 89 e5             	mov    rbp,rsp
  8052ce:	48 81 ec c0 02 00 00 	sub    rsp,0x2c0
  8052d5:	48 89 bd 48 fd ff ff 	mov    QWORD PTR [rbp-0x2b8],rdi
    // 读取文件头
    vfs_dir_entry *f=proc->exef;
  8052dc:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  8052e3:	48 8b 80 bc 00 00 00 	mov    rax,QWORD PTR [rax+0xbc]
  8052ea:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    int exefno=f->fno;
  8052ee:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8052f2:	8b 00                	mov    eax,DWORD PTR [rax]
  8052f4:	89 45 94             	mov    DWORD PTR [rbp-0x6c],eax

    IMAGE_DOS_HEADER tdh;
    IMAGE_NT_HEADERS32 tnth;
    sys_read(exefno, &tdh, sizeof(tdh));
  8052f7:	48 8d 8d 70 fe ff ff 	lea    rcx,[rbp-0x190]
  8052fe:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  805301:	ba 44 00 00 00       	mov    edx,0x44
  805306:	48 89 ce             	mov    rsi,rcx
  805309:	89 c7                	mov    edi,eax
  80530b:	e8 c7 ce ff ff       	call   8021d7 <sys_read>
    sys_seek(exefno,tdh.e_lfanew,SEEK_SET);
  805310:	48 8b 85 ac fe ff ff 	mov    rax,QWORD PTR [rbp-0x154]
  805317:	89 c1                	mov    ecx,eax
  805319:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  80531c:	ba 00 00 00 00       	mov    edx,0x0
  805321:	89 ce                	mov    esi,ecx
  805323:	89 c7                	mov    edi,eax
  805325:	e8 3e cf ff ff       	call   802268 <sys_seek>
    sys_read(exefno, &tnth, sizeof(tnth));
  80532a:	48 8d 8d 70 fd ff ff 	lea    rcx,[rbp-0x290]
  805331:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  805334:	ba f8 00 00 00       	mov    edx,0xf8
  805339:	48 89 ce             	mov    rsi,rcx
  80533c:	89 c7                	mov    edi,eax
  80533e:	e8 94 ce ff ff       	call   8021d7 <sys_read>

    //是否需要移动base(先不检查)
    unsigned int nbase=tnth.OptionalHeader.ImageBase;
  805343:	8b 85 a4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x25c]
  805349:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int pgn=tnth.OptionalHeader.SizeOfImage/PAGE_SIZE;
  80534c:	8b 85 c0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x240]
  805352:	c1 e8 0c             	shr    eax,0xc
  805355:	89 45 90             	mov    DWORD PTR [rbp-0x70],eax
    //use_pgm_ava检查在页表中这个范围是否可用，可用就使用
    while(1)
    {
        cont:
        ;
        int pdei=nbase/PAGE_INDEX_SIZE;
  805358:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80535b:	c1 e8 16             	shr    eax,0x16
  80535e:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
        int ptei=nbase%PAGE_INDEX_SIZE/PAGE_SIZE;
  805361:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805364:	25 ff ff 3f 00       	and    eax,0x3fffff
  805369:	c1 e8 0c             	shr    eax,0xc
  80536c:	89 45 88             	mov    DWORD PTR [rbp-0x78],eax
        int *pt=(proc->pml4[pdei]&0xfffff000);
  80536f:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  805376:	48 8b 90 ac 00 00 00 	mov    rdx,QWORD PTR [rax+0xac]
  80537d:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
  805380:	48 98                	cdqe   
  805382:	48 c1 e0 03          	shl    rax,0x3
  805386:	48 01 d0             	add    rax,rdx
  805389:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80538c:	25 00 f0 ff ff       	and    eax,0xfffff000
  805391:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
        for(int i=0;i<pgn;i++)
  805395:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80539c:	eb 48                	jmp    8053e6 <load_pe+0x120>
        {
            if(pt[ptei+i%1024]&PAGE_PRESENT&&pt!=NULL)
  80539e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8053a1:	99                   	cdq    
  8053a2:	c1 ea 16             	shr    edx,0x16
  8053a5:	01 d0                	add    eax,edx
  8053a7:	25 ff 03 00 00       	and    eax,0x3ff
  8053ac:	29 d0                	sub    eax,edx
  8053ae:	89 c2                	mov    edx,eax
  8053b0:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
  8053b3:	01 d0                	add    eax,edx
  8053b5:	48 98                	cdqe   
  8053b7:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8053be:	00 
  8053bf:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8053c3:	48 01 d0             	add    rax,rdx
  8053c6:	8b 00                	mov    eax,DWORD PTR [rax]
  8053c8:	83 e0 01             	and    eax,0x1
  8053cb:	85 c0                	test   eax,eax
  8053cd:	74 13                	je     8053e2 <load_pe+0x11c>
  8053cf:	48 83 7d 80 00       	cmp    QWORD PTR [rbp-0x80],0x0
  8053d4:	74 0c                	je     8053e2 <load_pe+0x11c>
            {
                //移动base
                nbase+=0x1000;
  8053d6:	81 45 fc 00 10 00 00 	add    DWORD PTR [rbp-0x4],0x1000
                goto cont;
  8053dd:	e9 76 ff ff ff       	jmp    805358 <load_pe+0x92>
        for(int i=0;i<pgn;i++)
  8053e2:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8053e6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8053e9:	3b 45 90             	cmp    eax,DWORD PTR [rbp-0x70]
  8053ec:	7c b0                	jl     80539e <load_pe+0xd8>
            }
        }
        break;
  8053ee:	90                   	nop
    }

    //proc->tss.eip=tnth.OptionalHeader.AddressOfEntryPoint+nbase;
    //存放文件头
    sys_seek(exefno,0,SEEK_SET);
  8053ef:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8053f2:	ba 00 00 00 00       	mov    edx,0x0
  8053f7:	be 00 00 00 00       	mov    esi,0x0
  8053fc:	89 c7                	mov    edi,eax
  8053fe:	e8 65 ce ff ff       	call   802268 <sys_seek>
    sys_read(exefno, nbase, PAGE_SIZE);
  805403:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805406:	48 89 c1             	mov    rcx,rax
  805409:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  80540c:	ba 00 10 00 00       	mov    edx,0x1000
  805411:	48 89 ce             	mov    rsi,rcx
  805414:	89 c7                	mov    edi,eax
  805416:	e8 bc cd ff ff       	call   8021d7 <sys_read>
    //dos头
    PIMAGE_DOS_HEADER dosh=nbase;
  80541b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80541e:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    PIMAGE_NT_HEADERS32 nth=nbase+dosh->e_lfanew;
  805425:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  805428:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  80542f:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  805433:	48 01 d0             	add    rax,rdx
  805436:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    PIMAGE_FILE_HEADER fh=&nth->FileHeader;
  80543d:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805444:	48 83 c0 04          	add    rax,0x4
  805448:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    //为新进程分配内存页
    //计算所需的页
    int prog_size=nth->OptionalHeader.SizeOfImage;
  80544f:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805456:	8b 40 50             	mov    eax,DWORD PTR [rax+0x50]
  805459:	89 85 64 ff ff ff    	mov    DWORD PTR [rbp-0x9c],eax
    int page_count=prog_size/4096;
  80545f:	8b 85 64 ff ff ff    	mov    eax,DWORD PTR [rbp-0x9c]
  805465:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80546b:	85 c0                	test   eax,eax
  80546d:	0f 48 c2             	cmovs  eax,edx
  805470:	c1 f8 0c             	sar    eax,0xc
  805473:	89 85 60 ff ff ff    	mov    DWORD PTR [rbp-0xa0],eax

    int shell_addr=nth->OptionalHeader.AddressOfEntryPoint+nbase;
  805479:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805480:	8b 50 28             	mov    edx,DWORD PTR [rax+0x28]
  805483:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805486:	01 d0                	add    eax,edx
  805488:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
    int page_index_item_count=page_count/1024+page_count%1024==0?0:1;
  80548e:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  805494:	8d 90 ff 03 00 00    	lea    edx,[rax+0x3ff]
  80549a:	85 c0                	test   eax,eax
  80549c:	0f 48 c2             	cmovs  eax,edx
  80549f:	c1 f8 0a             	sar    eax,0xa
  8054a2:	89 c1                	mov    ecx,eax
  8054a4:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  8054aa:	99                   	cdq    
  8054ab:	c1 ea 16             	shr    edx,0x16
  8054ae:	01 d0                	add    eax,edx
  8054b0:	25 ff 03 00 00       	and    eax,0x3ff
  8054b5:	29 d0                	sub    eax,edx
  8054b7:	01 c8                	add    eax,ecx
  8054b9:	85 c0                	test   eax,eax
  8054bb:	0f 95 c0             	setne  al
  8054be:	0f b6 c0             	movzx  eax,al
  8054c1:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
    int start_pgind_item=shell_addr/PAGE_INDEX_SIZE;
  8054c7:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8054cd:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  8054d3:	85 c0                	test   eax,eax
  8054d5:	0f 48 c2             	cmovs  eax,edx
  8054d8:	c1 f8 16             	sar    eax,0x16
  8054db:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax

    //sys_read sections
    PIMAGE_SECTION_HEADER psec=(u32)nth+sizeof(IMAGE_NT_HEADERS32);
  8054e1:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8054e8:	89 c0                	mov    eax,eax
  8054ea:	48 05 f8 00 00 00    	add    rax,0xf8
  8054f0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
    nth->FileHeader.NumberOfSections*sizeof(IMAGE_SECTION_HEADER);
  8054f4:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8054fb:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  8054ff:	0f b7 d0             	movzx  edx,ax
  805502:	89 d0                	mov    eax,edx
  805504:	c1 e0 02             	shl    eax,0x2
  805507:	01 d0                	add    eax,edx
  805509:	c1 e0 03             	shl    eax,0x3
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
  80550c:	05 3c 01 00 00       	add    eax,0x13c
  805511:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    int align=nth->OptionalHeader.FileAlignment;
  805517:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80551e:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  805521:	89 85 4c ff ff ff    	mov    DWORD PTR [rbp-0xb4],eax
    data_start=data_start%align?data_start-data_start%align+align:data_start;
  805527:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  80552d:	99                   	cdq    
  80552e:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  805534:	89 d0                	mov    eax,edx
  805536:	85 c0                	test   eax,eax
  805538:	74 23                	je     80555d <load_pe+0x297>
  80553a:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805540:	99                   	cdq    
  805541:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  805547:	89 d1                	mov    ecx,edx
  805549:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  80554f:	29 c8                	sub    eax,ecx
  805551:	89 c2                	mov    edx,eax
  805553:	8b 85 4c ff ff ff    	mov    eax,DWORD PTR [rbp-0xb4]
  805559:	01 d0                	add    eax,edx
  80555b:	eb 06                	jmp    805563 <load_pe+0x29d>
  80555d:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805563:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  805569:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  805570:	eb 68                	jmp    8055da <load_pe+0x314>
    {
        int disca=psec->Characteristics&IMAGE_SCN_MEM_DISCARDABLE;
  805572:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805576:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  805579:	25 00 00 00 02       	and    eax,0x2000000
  80557e:	89 85 bc fe ff ff    	mov    DWORD PTR [rbp-0x144],eax
        if(disca)
  805584:	83 bd bc fe ff ff 00 	cmp    DWORD PTR [rbp-0x144],0x0
  80558b:	75 43                	jne    8055d0 <load_pe+0x30a>
            continue;
        //直接读，缺页内核解决
        sys_seek(exefno,psec->PointerToRawData,SEEK_SET);
  80558d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805591:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  805594:	89 c1                	mov    ecx,eax
  805596:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  805599:	ba 00 00 00 00       	mov    edx,0x0
  80559e:	89 ce                	mov    esi,ecx
  8055a0:	89 c7                	mov    edi,eax
  8055a2:	e8 c1 cc ff ff       	call   802268 <sys_seek>
        sys_read(exefno, psec->VirtualAddress + nbase,  psec->SizeOfRawData);
  8055a7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8055ab:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8055ae:	89 c2                	mov    edx,eax
  8055b0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8055b4:	8b 48 0c             	mov    ecx,DWORD PTR [rax+0xc]
  8055b7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8055ba:	01 c8                	add    eax,ecx
  8055bc:	89 c0                	mov    eax,eax
  8055be:	48 89 c1             	mov    rcx,rax
  8055c1:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8055c4:	48 89 ce             	mov    rsi,rcx
  8055c7:	89 c7                	mov    edi,eax
  8055c9:	e8 09 cc ff ff       	call   8021d7 <sys_read>
  8055ce:	eb 01                	jmp    8055d1 <load_pe+0x30b>
            continue;
  8055d0:	90                   	nop
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  8055d1:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8055d5:	48 83 45 f0 28       	add    QWORD PTR [rbp-0x10],0x28
  8055da:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8055e1:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  8055e5:	0f b7 c0             	movzx  eax,ax
  8055e8:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8055eb:	7c 85                	jl     805572 <load_pe+0x2ac>

    }

    //通过导入表加载需要的dll
    PIMAGE_DATA_DIRECTORY impd=&nth->OptionalHeader.DataDirectory[1];
  8055ed:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8055f4:	48 83 e8 80          	sub    rax,0xffffffffffffff80
  8055f8:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    if(impd->Size>0)
  8055ff:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  805606:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805609:	85 c0                	test   eax,eax
  80560b:	0f 84 71 02 00 00    	je     805882 <load_pe+0x5bc>
    {
        int tmpi=impd->VirtualAddress+nbase;
  805611:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  805618:	8b 10                	mov    edx,DWORD PTR [rax]
  80561a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80561d:	01 d0                	add    eax,edx
  80561f:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
        PIMAGE_IMPORT_DESCRIPTOR impdes=tmpi;
  805625:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  80562b:	48 98                	cdqe   
  80562d:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        int dllp;
        while (impdes->Characteristics)
  805631:	e9 3e 02 00 00       	jmp    805874 <load_pe+0x5ae>
        {
            //加载dll
            char *dllname=impdes->Name+nbase;
  805636:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80563a:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  80563d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805640:	01 d0                	add    eax,edx
  805642:	89 c0                	mov    eax,eax
  805644:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
            //此处应有加载dll代码
            int dlli;
            if(strcmp(dllname,"sys.dll")==0)//加载系统dll的部分由内核已经完成
  80564b:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  805652:	be a8 2a 81 00       	mov    esi,0x812aa8
  805657:	48 89 c7             	mov    rdi,rax
  80565a:	e8 e0 50 00 00       	call   80a73f <strcmp>
  80565f:	85 c0                	test   eax,eax
  805661:	75 09                	jne    80566c <load_pe+0x3a6>
            {
                dllp=0x1c00000;
  805663:	c7 45 dc 00 00 c0 01 	mov    DWORD PTR [rbp-0x24],0x1c00000
  80566a:	eb 25                	jmp    805691 <load_pe+0x3cb>
            }else{
                //load_pe要记录module的加载
                dlli= load_pe(proc);
  80566c:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  805673:	48 89 c7             	mov    rdi,rax
  805676:	e8 4b fc ff ff       	call   8052c6 <load_pe>
  80567b:	89 85 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],eax
                //dlli=load_library(dllname);
                //这个是线性地址
                dllp=get_module_addr(dlli);
  805681:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  805687:	89 c7                	mov    edi,eax
  805689:	e8 e4 03 00 00       	call   805a72 <get_module_addr>
  80568e:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            }
            //从线性地址查页表找到物理地址
            PIMAGE_DOS_HEADER dlldos=dllp;
  805691:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805694:	48 98                	cdqe   
  805696:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
            PIMAGE_NT_HEADERS32 dllnth=dllp+dlldos->e_lfanew;
  80569d:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8056a0:	48 63 d0             	movsxd rdx,eax
  8056a3:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  8056aa:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  8056ae:	48 01 d0             	add    rax,rdx
  8056b1:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
            PIMAGE_EXPORT_DIRECTORY dllexp=(dllnth->OptionalHeader.DataDirectory[0].VirtualAddress+dllp);
  8056b8:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8056bf:	8b 50 78             	mov    edx,DWORD PTR [rax+0x78]
  8056c2:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8056c5:	01 d0                	add    eax,edx
  8056c7:	89 c0                	mov    eax,eax
  8056c9:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
            int funcn=dllexp->NumberOfNames;
  8056d0:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8056d7:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  8056da:	89 85 0c ff ff ff    	mov    DWORD PTR [rbp-0xf4],eax
            char **fnames=dllexp->AddressOfNames+dllp;
  8056e0:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8056e7:	8b 50 20             	mov    edx,DWORD PTR [rax+0x20]
  8056ea:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8056ed:	01 d0                	add    eax,edx
  8056ef:	89 c0                	mov    eax,eax
  8056f1:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
            int *funcaddrs=dllexp->AddressOfFunctions+dllp;
  8056f8:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8056ff:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  805702:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805705:	01 d0                	add    eax,edx
  805707:	89 c0                	mov    eax,eax
  805709:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
            short *funcords=dllexp->AddressOfNameOrdinals+dllp;
  805710:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  805717:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  80571a:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80571d:	01 d0                	add    eax,edx
  80571f:	89 c0                	mov    eax,eax
  805721:	48 89 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rax
            //寻找nameordinal的base（最小值），里面的数据加上base才是真正的序号
            unsigned int ord_base=dllexp->Base;
  805728:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80572f:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805732:	89 85 ec fe ff ff    	mov    DWORD PTR [rbp-0x114],eax
            //开始将导入表IAT的内容更新为函数地址
            unsigned int *iataddrs=impdes->FirstThunk+nbase;//IAT和INT内容一样，只用IAT
  805738:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80573c:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  80573f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805742:	01 d0                	add    eax,edx
  805744:	89 c0                	mov    eax,eax
  805746:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            char **siataddrs=impdes->FirstThunk+nbase;
  80574a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80574e:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  805751:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805754:	01 d0                	add    eax,edx
  805756:	89 c0                	mov    eax,eax
  805758:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            while (*iataddrs)
  80575c:	e9 00 01 00 00       	jmp    805861 <load_pe+0x59b>
            {
                //判断是序号导入还是名称导入
                if(((unsigned)*iataddrs)&0x80000000)
  805761:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805765:	8b 00                	mov    eax,DWORD PTR [rax]
  805767:	85 c0                	test   eax,eax
  805769:	79 43                	jns    8057ae <load_pe+0x4e8>
                {
                    //序号导入
                    unsigned int ord=((*iataddrs)&0x7fffffff)-ord_base;
  80576b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80576f:	8b 00                	mov    eax,DWORD PTR [rax]
  805771:	25 ff ff ff 7f       	and    eax,0x7fffffff
  805776:	2b 85 ec fe ff ff    	sub    eax,DWORD PTR [rbp-0x114]
  80577c:	89 85 d8 fe ff ff    	mov    DWORD PTR [rbp-0x128],eax
                    *iataddrs=funcaddrs[ord]+dllp;
  805782:	8b 85 d8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x128]
  805788:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  80578f:	00 
  805790:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  805797:	48 01 d0             	add    rax,rdx
  80579a:	8b 10                	mov    edx,DWORD PTR [rax]
  80579c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80579f:	01 d0                	add    eax,edx
  8057a1:	89 c2                	mov    edx,eax
  8057a3:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8057a7:	89 10                	mov    DWORD PTR [rax],edx
  8057a9:	e9 a9 00 00 00       	jmp    805857 <load_pe+0x591>
                }else
                {
                    //名称导入
                    char *import_by_name_p=*iataddrs;//指向IMPORT_BY_NAME
  8057ae:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8057b2:	8b 00                	mov    eax,DWORD PTR [rax]
  8057b4:	89 c0                	mov    eax,eax
  8057b6:	48 89 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rax
                    import_by_name_p+=2;//跳过开头两字节序号
  8057bd:	48 83 85 e0 fe ff ff 	add    QWORD PTR [rbp-0x120],0x2
  8057c4:	02 
                    int i=0;
  8057c5:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
                    for(;i<funcn;i++)
  8057cc:	eb 7a                	jmp    805848 <load_pe+0x582>
                    {
                        if(strcmp(import_by_name_p,fnames[i])==0)
  8057ce:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8057d1:	48 98                	cdqe   
  8057d3:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8057da:	00 
  8057db:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  8057e2:	48 01 d0             	add    rax,rdx
  8057e5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8057e8:	48 8b 85 e0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x120]
  8057ef:	48 89 d6             	mov    rsi,rdx
  8057f2:	48 89 c7             	mov    rdi,rax
  8057f5:	e8 45 4f 00 00       	call   80a73f <strcmp>
  8057fa:	85 c0                	test   eax,eax
  8057fc:	75 46                	jne    805844 <load_pe+0x57e>
                        {
                            int ordi=funcords[i];
  8057fe:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  805801:	48 98                	cdqe   
  805803:	48 8d 14 00          	lea    rdx,[rax+rax*1]
  805807:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80580e:	48 01 d0             	add    rax,rdx
  805811:	0f b7 00             	movzx  eax,WORD PTR [rax]
  805814:	98                   	cwde   
  805815:	89 85 dc fe ff ff    	mov    DWORD PTR [rbp-0x124],eax
                            *iataddrs=funcaddrs[ordi]+dllp;//导入表中的IAT内容修改成地址
  80581b:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
  805821:	48 98                	cdqe   
  805823:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  80582a:	00 
  80582b:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  805832:	48 01 d0             	add    rax,rdx
  805835:	8b 10                	mov    edx,DWORD PTR [rax]
  805837:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80583a:	01 d0                	add    eax,edx
  80583c:	89 c2                	mov    edx,eax
  80583e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805842:	89 10                	mov    DWORD PTR [rax],edx
                    for(;i<funcn;i++)
  805844:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
  805848:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80584b:	3b 85 0c ff ff ff    	cmp    eax,DWORD PTR [rbp-0xf4]
  805851:	0f 8c 77 ff ff ff    	jl     8057ce <load_pe+0x508>
                        }
                    }
                }
                iataddrs++;
  805857:	48 83 45 d0 04       	add    QWORD PTR [rbp-0x30],0x4
                siataddrs++;
  80585c:	48 83 45 c8 08       	add    QWORD PTR [rbp-0x38],0x8
            while (*iataddrs)
  805861:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805865:	8b 00                	mov    eax,DWORD PTR [rax]
  805867:	85 c0                	test   eax,eax
  805869:	0f 85 f2 fe ff ff    	jne    805761 <load_pe+0x49b>
            }
            impdes++;
  80586f:	48 83 45 e0 14       	add    QWORD PTR [rbp-0x20],0x14
        while (impdes->Characteristics)
  805874:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805878:	8b 00                	mov    eax,DWORD PTR [rax]
  80587a:	85 c0                	test   eax,eax
  80587c:	0f 85 b4 fd ff ff    	jne    805636 <load_pe+0x370>
        }
    }


    //开始重定位
    PIMAGE_BASE_RELOCATION relp=0;
  805882:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  805889:	00 
    if(nth->OptionalHeader.DataDirectory[5].Size>0)
  80588a:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805891:	8b 80 a4 00 00 00    	mov    eax,DWORD PTR [rax+0xa4]
  805897:	85 c0                	test   eax,eax
  805899:	0f 84 e8 00 00 00    	je     805987 <load_pe+0x6c1>
    {
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  80589f:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8058a6:	8b 90 a0 00 00 00    	mov    edx,DWORD PTR [rax+0xa0]
  8058ac:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8058af:	01 d0                	add    eax,edx
  8058b1:	89 c0                	mov    eax,eax
  8058b3:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
                                +(u32)nbase);
        u16 *reloc=relp+sizeof(IMAGE_BASE_RELOCATION);
  8058b7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8058bb:	48 83 c0 40          	add    rax,0x40
  8058bf:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        u16 *rtype=reloc+1;
  8058c3:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8058c7:	48 83 c0 02          	add    rax,0x2
  8058cb:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
        int old_base=nth->OptionalHeader.ImageBase;
  8058cf:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8058d6:	8b 40 34             	mov    eax,DWORD PTR [rax+0x34]
  8058d9:	89 85 d4 fe ff ff    	mov    DWORD PTR [rbp-0x12c],eax
        while(relp->VirtualAddress){
  8058df:	e9 95 00 00 00       	jmp    805979 <load_pe+0x6b3>
            int pgva=relp->VirtualAddress+nbase;
  8058e4:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8058e8:	8b 10                	mov    edx,DWORD PTR [rax]
  8058ea:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8058ed:	01 d0                	add    eax,edx
  8058ef:	89 85 d0 fe ff ff    	mov    DWORD PTR [rbp-0x130],eax
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  8058f5:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
  8058fc:	eb 59                	jmp    805957 <load_pe+0x691>
            {
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  8058fe:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  805902:	0f b7 00             	movzx  eax,WORD PTR [rax]
  805905:	66 85 c0             	test   ax,ax
  805908:	74 48                	je     805952 <load_pe+0x68c>
                int *at=*reloc+pgva;//要重定位的数据的地址
  80590a:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80590e:	0f b7 00             	movzx  eax,WORD PTR [rax]
  805911:	0f b7 d0             	movzx  edx,ax
  805914:	8b 85 d0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x130]
  80591a:	01 d0                	add    eax,edx
  80591c:	48 98                	cdqe   
  80591e:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
                *at=*at-old_base+nbase;
  805925:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  80592c:	8b 00                	mov    eax,DWORD PTR [rax]
  80592e:	2b 85 d4 fe ff ff    	sub    eax,DWORD PTR [rbp-0x12c]
  805934:	89 c2                	mov    edx,eax
  805936:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805939:	01 d0                	add    eax,edx
  80593b:	89 c2                	mov    edx,eax
  80593d:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  805944:	89 10                	mov    DWORD PTR [rax],edx
                //下一个
                reloc+=2;
  805946:	48 83 45 b0 04       	add    QWORD PTR [rbp-0x50],0x4
                rtype+=2;
  80594b:	48 83 45 a8 04       	add    QWORD PTR [rbp-0x58],0x4
  805950:	eb 01                	jmp    805953 <load_pe+0x68d>
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  805952:	90                   	nop
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  805953:	83 45 a4 01          	add    DWORD PTR [rbp-0x5c],0x1
  805957:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80595b:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80595e:	c1 e8 02             	shr    eax,0x2
  805961:	89 c2                	mov    edx,eax
  805963:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  805966:	39 c2                	cmp    edx,eax
  805968:	77 94                	ja     8058fe <load_pe+0x638>
            }
            relp=(int)relp+0x1000;
  80596a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80596e:	05 00 10 00 00       	add    eax,0x1000
  805973:	48 98                	cdqe   
  805975:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        while(relp->VirtualAddress){
  805979:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80597d:	8b 00                	mov    eax,DWORD PTR [rax]
  80597f:	85 c0                	test   eax,eax
  805981:	0f 85 5d ff ff ff    	jne    8058e4 <load_pe+0x61e>
        }
    }
    extern struct process task[];
    extern int cur_proc;
    //初始化堆
    chunk_header hdrtmp={
  805987:	c7 85 50 fd ff ff 00 	mov    DWORD PTR [rbp-0x2b0],0x0
  80598e:	00 00 00 
  805991:	c7 85 54 fd ff ff 00 	mov    DWORD PTR [rbp-0x2ac],0x0
  805998:	00 00 00 
  80599b:	48 c7 85 58 fd ff ff 	mov    QWORD PTR [rbp-0x2a8],0x0
  8059a2:	00 00 00 00 
  8059a6:	48 c7 85 60 fd ff ff 	mov    QWORD PTR [rbp-0x2a0],0x0
  8059ad:	00 00 00 00 
            .next=NULL,
            .pgn=0,
            .prev=NULL
    };//空堆
    //拷贝触发页中断然后分配
    memcpy((chunk_header*)HEAP_BASE,&hdrtmp,sizeof(hdrtmp));
  8059b1:	48 8d 85 50 fd ff ff 	lea    rax,[rbp-0x2b0]
  8059b8:	ba 18 00 00 00       	mov    edx,0x18
  8059bd:	48 89 c6             	mov    rsi,rax
  8059c0:	bf 00 00 00 01       	mov    edi,0x1000000
  8059c5:	e8 d7 4a 00 00       	call   80a4a1 <memcpy>
    task[cur_proc].mem_struct.heap_base=HEAP_BASE;
  8059ca:	8b 05 3c eb c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0eb3c]        # 41450c <cur_proc>
  8059d0:	48 63 d0             	movsxd rdx,eax
  8059d3:	48 89 d0             	mov    rax,rdx
  8059d6:	48 01 c0             	add    rax,rax
  8059d9:	48 01 d0             	add    rax,rdx
  8059dc:	48 c1 e0 08          	shl    rax,0x8
  8059e0:	48 05 b0 84 40 00    	add    rax,0x4084b0
  8059e6:	c7 40 04 00 00 00 01 	mov    DWORD PTR [rax+0x4],0x1000000
    task[cur_proc].mem_struct.heap_top=HEAP_BASE+CHUNK_SIZE;
  8059ed:	8b 05 19 eb c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0eb19]        # 41450c <cur_proc>
  8059f3:	48 63 d0             	movsxd rdx,eax
  8059f6:	48 89 d0             	mov    rax,rdx
  8059f9:	48 01 c0             	add    rax,rax
  8059fc:	48 01 d0             	add    rax,rdx
  8059ff:	48 c1 e0 08          	shl    rax,0x8
  805a03:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805a09:	c7 40 08 00 10 00 01 	mov    DWORD PTR [rax+0x8],0x1001000


    //完毕,调用入口函数
    //重定位完毕，准备调用DllMain
    typedef int (*Main)(int,void*);
    Main main=shell_addr;
  805a10:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  805a16:	48 98                	cdqe   
  805a18:	48 89 85 c0 fe ff ff 	mov    QWORD PTR [rbp-0x140],rax
    task[cur_proc].exit_code=main(0,NULL);
  805a1f:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
  805a26:	be 00 00 00 00       	mov    esi,0x0
  805a2b:	bf 00 00 00 00       	mov    edi,0x0
  805a30:	ff d0                	call   rax
  805a32:	8b 15 d4 ea c0 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc0ead4]        # 41450c <cur_proc>
  805a38:	89 c1                	mov    ecx,eax
  805a3a:	48 63 d2             	movsxd rdx,edx
  805a3d:	48 89 d0             	mov    rax,rdx
  805a40:	48 01 c0             	add    rax,rax
  805a43:	48 01 d0             	add    rax,rdx
  805a46:	48 c1 e0 08          	shl    rax,0x8
  805a4a:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805a50:	89 08                	mov    DWORD PTR [rax],ecx
    return task[cur_proc].exit_code;
  805a52:	8b 05 b4 ea c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0eab4]        # 41450c <cur_proc>
  805a58:	48 63 d0             	movsxd rdx,eax
  805a5b:	48 89 d0             	mov    rax,rdx
  805a5e:	48 01 c0             	add    rax,rax
  805a61:	48 01 d0             	add    rax,rdx
  805a64:	48 c1 e0 08          	shl    rax,0x8
  805a68:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805a6e:	8b 00                	mov    eax,DWORD PTR [rax]
}
  805a70:	c9                   	leave  
  805a71:	c3                   	ret    

0000000000805a72 <get_module_addr>:

int get_module_addr(int mi)
{
  805a72:	f3 0f 1e fa          	endbr64 
  805a76:	55                   	push   rbp
  805a77:	48 89 e5             	mov    rbp,rsp
  805a7a:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return modules[mi].base;
  805a7d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805a80:	48 98                	cdqe   
  805a82:	8b 04 c5 20 71 42 00 	mov    eax,DWORD PTR [rax*8+0x427120]
}
  805a89:	5d                   	pop    rbp
  805a8a:	c3                   	ret    

0000000000805a8b <dispose_library>:
int dispose_library(int dlln)
{
  805a8b:	f3 0f 1e fa          	endbr64 
  805a8f:	55                   	push   rbp
  805a90:	48 89 e5             	mov    rbp,rsp
  805a93:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if(dlln<0||dlln>=MAX_DLLS)return -1;
  805a96:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  805a9a:	78 09                	js     805aa5 <dispose_library+0x1a>
  805a9c:	81 7d fc ff 00 00 00 	cmp    DWORD PTR [rbp-0x4],0xff
  805aa3:	7e 07                	jle    805aac <dispose_library+0x21>
  805aa5:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805aaa:	eb 1d                	jmp    805ac9 <dispose_library+0x3e>
    //空间不够，释放之前申请的
    // for(int j=0;j<dlls[dlln].page_used;j++)
    //     dispose_page(get_phyaddr(dlls[dlln].page_num[j]));
    //释放dll
    dlls[dlln].flag=DLL_STAT_EMPTY;
  805aac:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805aaf:	48 98                	cdqe   
  805ab1:	48 69 c0 2c 01 00 00 	imul   rax,rax,0x12c
  805ab8:	48 05 28 45 41 00    	add    rax,0x414528
  805abe:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return 0;
  805ac4:	b8 00 00 00 00       	mov    eax,0x0
}
  805ac9:	5d                   	pop    rbp
  805aca:	c3                   	ret    

0000000000805acb <sys_insmod>:

    return 0;
} */

int sys_insmod(char *path)
{
  805acb:	f3 0f 1e fa          	endbr64 
  805acf:	55                   	push   rbp
  805ad0:	48 89 e5             	mov    rbp,rsp
  805ad3:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  805ad7:	90                   	nop
  805ad8:	5d                   	pop    rbp
  805ad9:	c3                   	ret    

0000000000805ada <sys_rmmod>:
int sys_rmmod(char *name)
{
  805ada:	f3 0f 1e fa          	endbr64 
  805ade:	55                   	push   rbp
  805adf:	48 89 e5             	mov    rbp,rsp
  805ae2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

  805ae6:	90                   	nop
  805ae7:	5d                   	pop    rbp
  805ae8:	c3                   	ret    
  805ae9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000805af0 <_syscall>:
  805af0:	55                   	push   rbp
  805af1:	bd 00 80 10 00       	mov    ebp,0x108000
  805af6:	48 89 65 14          	mov    QWORD PTR [rbp+0x14],rsp
  805afa:	48 8b 65 04          	mov    rsp,QWORD PTR [rbp+0x4]
  805afe:	41 53                	push   r11
  805b00:	51                   	push   rcx
  805b01:	e8 94 aa ff ff       	call   80059a <syscall>
  805b06:	59                   	pop    rcx
  805b07:	41 5b                	pop    r11
  805b09:	48 89 65 04          	mov    QWORD PTR [rbp+0x4],rsp
  805b0d:	48 8b 65 14          	mov    rsp,QWORD PTR [rbp+0x14]
  805b11:	5d                   	pop    rbp
  805b12:	48 0f 07             	sysretq 

0000000000805b15 <init_framebuffer>:
static u32 font_width_bytes;
static u8 *glyph_table;
static u32 bytes_per_glyph, glyph_nr;
int font_size=1;
void init_framebuffer()
{
  805b15:	f3 0f 1e fa          	endbr64 
  805b19:	55                   	push   rbp
  805b1a:	48 89 e5             	mov    rbp,rsp
  805b1d:	48 83 ec 50          	sub    rsp,0x50
    //映射页帧内存
    size_t w=framebuffer.common.framebuffer_width;
  805b21:	8b 05 0d 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21a0d]        # 427534 <framebuffer+0x14>
  805b27:	89 c0                	mov    eax,eax
  805b29:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    size_t h=framebuffer.common.framebuffer_height;
  805b2d:	8b 05 05 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21a05]        # 427538 <framebuffer+0x18>
  805b33:	89 c0                	mov    eax,eax
  805b35:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    size_t bypp=framebuffer.common.framebuffer_bpp/8;
  805b39:	0f b6 05 fc 19 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc219fc]        # 42753c <framebuffer+0x1c>
  805b40:	c0 e8 03             	shr    al,0x3
  805b43:	0f b6 c0             	movzx  eax,al
  805b46:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    size_t inter=framebuffer.common.framebuffer_pitch;
  805b4a:	8b 05 e0 19 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc219e0]        # 427530 <framebuffer+0x10>
  805b50:	89 c0                	mov    eax,eax
  805b52:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    size_t pc=w*h;
  805b56:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805b5a:	48 0f af 45 d8       	imul   rax,QWORD PTR [rbp-0x28]
  805b5f:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    size_t size=h*inter;
  805b63:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805b67:	48 0f af 45 c8       	imul   rax,QWORD PTR [rbp-0x38]
  805b6c:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    int pgc=size/PAGE_SIZE;
  805b70:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805b74:	48 c1 e8 0c          	shr    rax,0xc
  805b78:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    addr_t p=FRAMEBUFFER_ADDR;
  805b7b:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x40000000
  805b82:	40 
    addr_t pp=framebuffer.common.framebuffer_addr;
  805b83:	48 8b 05 9e 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2199e]        # 427528 <framebuffer+0x8>
  805b8a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for (size_t i = 0; i < pgc; i++)
  805b8e:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  805b95:	00 
  805b96:	eb 2d                	jmp    805bc5 <init_framebuffer+0xb0>
    {
        mmap(pp,p,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  805b98:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  805b9c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805ba0:	ba 07 00 00 00       	mov    edx,0x7
  805ba5:	48 89 ce             	mov    rsi,rcx
  805ba8:	48 89 c7             	mov    rdi,rax
  805bab:	e8 f0 b2 ff ff       	call   800ea0 <mmap>
        pp+=PAGE_SIZE;
  805bb0:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  805bb7:	00 
        p+=PAGE_SIZE;
  805bb8:	48 81 45 f8 00 10 00 	add    QWORD PTR [rbp-0x8],0x1000
  805bbf:	00 
    for (size_t i = 0; i < pgc; i++)
  805bc0:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  805bc5:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  805bc8:	48 98                	cdqe   
  805bca:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  805bce:	72 c8                	jb     805b98 <init_framebuffer+0x83>
    }
    
    
}
  805bd0:	90                   	nop
  805bd1:	90                   	nop
  805bd2:	c9                   	leave  
  805bd3:	c3                   	ret    

0000000000805bd4 <init_font>:
void init_font(){
  805bd4:	f3 0f 1e fa          	endbr64 
  805bd8:	55                   	push   rbp
  805bd9:	48 89 e5             	mov    rbp,rsp
    boot_font = (struct psf2_header*) _binary_res_font_psf_start;
  805bdc:	48 c7 05 79 19 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21979],0x80b180        # 427560 <boot_font>
  805be3:	80 b1 80 00 

    font_width_bytes = (boot_font->width + 7) / 8;
  805be7:	48 8b 05 72 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21972]        # 427560 <boot_font>
  805bee:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  805bf1:	83 c0 07             	add    eax,0x7
  805bf4:	c1 e8 03             	shr    eax,0x3
  805bf7:	89 05 73 19 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21973],eax        # 427570 <font_width_bytes>
    font_width = font_width_bytes * 8;
  805bfd:	8b 05 6d 19 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2196d]        # 427570 <font_width_bytes>
  805c03:	c1 e0 03             	shl    eax,0x3
  805c06:	89 05 5c 19 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2195c],eax        # 427568 <font_width>
    font_height = boot_font->height;
  805c0c:	48 8b 05 4d 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2194d]        # 427560 <boot_font>
  805c13:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  805c16:	89 05 50 19 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21950],eax        # 42756c <font_height>

    glyph_table = (u8*)_binary_res_font_psf_start+boot_font->header_size;
  805c1c:	48 8b 05 3d 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2193d]        # 427560 <boot_font>
  805c23:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  805c26:	89 c0                	mov    eax,eax
  805c28:	48 05 80 b1 80 00    	add    rax,0x80b180
  805c2e:	48 89 05 43 19 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21943],rax        # 427578 <glyph_table>
    glyph_nr = boot_font->glyph_nr;
  805c35:	48 8b 05 24 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21924]        # 427560 <boot_font>
  805c3c:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805c3f:	89 05 3f 19 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2193f],eax        # 427584 <glyph_nr>
    bytes_per_glyph = boot_font->bytes_per_glyph;
  805c45:	48 8b 05 14 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21914]        # 427560 <boot_font>
  805c4c:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  805c4f:	89 05 2b 19 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2192b],eax        # 427580 <bytes_per_glyph>

    fb_cursor_x = fb_cursor_y = 0;
  805c55:	c7 05 f1 18 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc218f1],0x0        # 427550 <fb_cursor_y>
  805c5c:	00 00 00 
  805c5f:	8b 05 eb 18 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc218eb]        # 427550 <fb_cursor_y>
  805c65:	89 05 e1 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc218e1],eax        # 42754c <fb_cursor_x>
    max_ch_nr_x = framebuffer.common.framebuffer_width / font_width;
  805c6b:	8b 05 c3 18 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc218c3]        # 427534 <framebuffer+0x14>
  805c71:	8b 0d f1 18 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc218f1]        # 427568 <font_width>
  805c77:	ba 00 00 00 00       	mov    edx,0x0
  805c7c:	f7 f1                	div    ecx
  805c7e:	89 05 d0 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc218d0],eax        # 427554 <max_ch_nr_x>
    max_ch_nr_y = framebuffer.common.framebuffer_height / font_height;
  805c84:	8b 05 ae 18 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc218ae]        # 427538 <framebuffer+0x18>
  805c8a:	8b 35 dc 18 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc218dc]        # 42756c <font_height>
  805c90:	ba 00 00 00 00       	mov    edx,0x0
  805c95:	f7 f6                	div    esi
  805c97:	89 05 bb 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc218bb],eax        # 427558 <max_ch_nr_y>
    font_size=1;
  805c9d:	c7 05 29 52 00 00 01 	mov    DWORD PTR [rip+0x5229],0x1        # 80aed0 <font_size>
  805ca4:	00 00 00 
}
  805ca7:	90                   	nop
  805ca8:	5d                   	pop    rbp
  805ca9:	c3                   	ret    

0000000000805caa <set_framebuffer>:
void set_framebuffer(struct multiboot_tag_framebuffer tag)
{
  805caa:	f3 0f 1e fa          	endbr64 
  805cae:	55                   	push   rbp
  805caf:	48 89 e5             	mov    rbp,rsp
    framebuffer=tag;
  805cb2:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  805cb6:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  805cba:	48 89 05 5f 18 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2185f],rax        # 427520 <framebuffer>
  805cc1:	48 89 15 60 18 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21860],rdx        # 427528 <framebuffer+0x8>
  805cc8:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
  805ccc:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  805cd0:	48 89 05 59 18 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21859],rax        # 427530 <framebuffer+0x10>
  805cd7:	48 89 15 5a 18 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2185a],rdx        # 427538 <framebuffer+0x18>
  805cde:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
  805ce2:	48 89 05 57 18 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21857],rax        # 427540 <framebuffer+0x20>
}
  805ce9:	90                   	nop
  805cea:	5d                   	pop    rbp
  805ceb:	c3                   	ret    

0000000000805cec <fill_rect>:

void fill_rect(int x,int y,int w,int h,unsigned int color){
  805cec:	f3 0f 1e fa          	endbr64 
  805cf0:	55                   	push   rbp
  805cf1:	48 89 e5             	mov    rbp,rsp
  805cf4:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  805cf7:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  805cfa:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  805cfd:	89 4d d0             	mov    DWORD PTR [rbp-0x30],ecx
  805d00:	44 89 45 cc          	mov    DWORD PTR [rbp-0x34],r8d
    unsigned int* fb= (unsigned int*) FRAMEBUFFER_ADDR;
  805d04:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x40000000
  805d0b:	40 
    //目前只写32bpp
    for(int py=x;py<h+x;py++){
  805d0c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805d0f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805d12:	eb 64                	jmp    805d78 <fill_rect+0x8c>
        for(int px=y;px<w+y;px++){
  805d14:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805d17:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  805d1a:	eb 4b                	jmp    805d67 <fill_rect+0x7b>
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  805d1c:	8b 15 0e 18 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc2180e]        # 427530 <framebuffer+0x10>
  805d22:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805d25:	0f af c2             	imul   eax,edx
  805d28:	89 c1                	mov    ecx,eax
                       +px*framebuffer.common.framebuffer_bpp/8;
  805d2a:	0f b6 05 0b 18 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2180b]        # 42753c <framebuffer+0x1c>
  805d31:	0f b6 c0             	movzx  eax,al
  805d34:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  805d38:	8d 50 07             	lea    edx,[rax+0x7]
  805d3b:	85 c0                	test   eax,eax
  805d3d:	0f 48 c2             	cmovs  eax,edx
  805d40:	c1 f8 03             	sar    eax,0x3
  805d43:	48 98                	cdqe   
  805d45:	48 01 c8             	add    rax,rcx
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  805d48:	48 05 00 00 00 40    	add    rax,0x40000000
  805d4e:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
            fb=(unsigned int*)ptr;
  805d52:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805d56:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *fb=color;
  805d5a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805d5e:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  805d61:	89 10                	mov    DWORD PTR [rax],edx
        for(int px=y;px<w+y;px++){
  805d63:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805d67:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  805d6a:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805d6d:	01 d0                	add    eax,edx
  805d6f:	39 45 f8             	cmp    DWORD PTR [rbp-0x8],eax
  805d72:	7c a8                	jl     805d1c <fill_rect+0x30>
    for(int py=x;py<h+x;py++){
  805d74:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805d78:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
  805d7b:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805d7e:	01 d0                	add    eax,edx
  805d80:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  805d83:	7c 8f                	jl     805d14 <fill_rect+0x28>
        }
    }
}
  805d85:	90                   	nop
  805d86:	90                   	nop
  805d87:	5d                   	pop    rbp
  805d88:	c3                   	ret    

0000000000805d89 <draw_text>:
unsigned char letters[];
void draw_text(int x, int y, int size, char *str)
{
  805d89:	f3 0f 1e fa          	endbr64 
  805d8d:	55                   	push   rbp
  805d8e:	48 89 e5             	mov    rbp,rsp
  805d91:	48 83 ec 30          	sub    rsp,0x30
  805d95:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  805d98:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  805d9b:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  805d9e:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    int tx=x;
  805da2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805da5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    while(*str!='\0')
  805da8:	eb 5a                	jmp    805e04 <draw_text+0x7b>
    {
        if(*str=='\n')
  805daa:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805dae:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805db1:	3c 0a                	cmp    al,0xa
  805db3:	75 1c                	jne    805dd1 <draw_text+0x48>
        {
            y+=font_height*size;
  805db5:	8b 15 b1 17 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc217b1]        # 42756c <font_height>
  805dbb:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  805dbe:	0f af d0             	imul   edx,eax
  805dc1:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805dc4:	01 d0                	add    eax,edx
  805dc6:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            tx=x;
  805dc9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805dcc:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805dcf:	eb 2e                	jmp    805dff <draw_text+0x76>
        }
        else
        {
            draw_letter(tx,y,size,*str);
  805dd1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805dd5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805dd8:	0f be c8             	movsx  ecx,al
  805ddb:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  805dde:	8b 75 e8             	mov    esi,DWORD PTR [rbp-0x18]
  805de1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805de4:	89 c7                	mov    edi,eax
  805de6:	e8 28 00 00 00       	call   805e13 <draw_letter>
            tx+=size*font_width;
  805deb:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  805dee:	8b 05 74 17 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21774]        # 427568 <font_width>
  805df4:	0f af d0             	imul   edx,eax
  805df7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805dfa:	01 d0                	add    eax,edx
  805dfc:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        }
        str++;
  805dff:	48 83 45 d8 01       	add    QWORD PTR [rbp-0x28],0x1
    while(*str!='\0')
  805e04:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805e08:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805e0b:	84 c0                	test   al,al
  805e0d:	75 9b                	jne    805daa <draw_text+0x21>
    }
}
  805e0f:	90                   	nop
  805e10:	90                   	nop
  805e11:	c9                   	leave  
  805e12:	c3                   	ret    

0000000000805e13 <draw_letter>:
void draw_letter(int x, volatile int y, int size, char c) {
  805e13:	f3 0f 1e fa          	endbr64 
  805e17:	55                   	push   rbp
  805e18:	48 89 e5             	mov    rbp,rsp
  805e1b:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
  805e1e:	89 75 c8             	mov    DWORD PTR [rbp-0x38],esi
  805e21:	89 55 c4             	mov    DWORD PTR [rbp-0x3c],edx
  805e24:	89 c8                	mov    eax,ecx
  805e26:	88 45 c0             	mov    BYTE PTR [rbp-0x40],al
    u8 *glyph = glyph_table;
  805e29:	48 8b 05 48 17 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21748]        # 427578 <glyph_table>
  805e30:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if (c < glyph_nr) {
  805e34:	0f be 55 c0          	movsx  edx,BYTE PTR [rbp-0x40]
  805e38:	8b 05 46 17 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21746]        # 427584 <glyph_nr>
  805e3e:	39 c2                	cmp    edx,eax
  805e40:	73 13                	jae    805e55 <draw_letter+0x42>
        glyph += c * bytes_per_glyph;
  805e42:	0f be 55 c0          	movsx  edx,BYTE PTR [rbp-0x40]
  805e46:	8b 05 34 17 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21734]        # 427580 <bytes_per_glyph>
  805e4c:	0f af c2             	imul   eax,edx
  805e4f:	89 c0                	mov    eax,eax
  805e51:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    }
    /* output the font to frame buffer */
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  805e55:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  805e5c:	e9 cb 00 00 00       	jmp    805f2c <draw_letter+0x119>
        u8 mask = 1 << 7;
  805e61:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80

        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  805e65:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  805e6c:	e9 9c 00 00 00       	jmp    805f0d <draw_letter+0xfa>
            int px=x+ch_x*size;
  805e71:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  805e74:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  805e78:	89 c2                	mov    edx,eax
  805e7a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  805e7d:	01 d0                	add    eax,edx
  805e7f:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            int py=y+ch_y*size;
  805e82:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  805e85:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  805e89:	89 c2                	mov    edx,eax
  805e8b:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  805e8e:	01 d0                	add    eax,edx
  805e90:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
            int* ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  805e93:	8b 15 97 16 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21697]        # 427530 <framebuffer+0x10>
  805e99:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  805e9c:	0f af c2             	imul   eax,edx
  805e9f:	89 c1                	mov    ecx,eax
                     +px*framebuffer.common.framebuffer_bpp/8;
  805ea1:	0f b6 05 94 16 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21694]        # 42753c <framebuffer+0x1c>
  805ea8:	0f b6 c0             	movzx  eax,al
  805eab:	0f af 45 e8          	imul   eax,DWORD PTR [rbp-0x18]
  805eaf:	8d 50 07             	lea    edx,[rax+0x7]
  805eb2:	85 c0                	test   eax,eax
  805eb4:	0f 48 c2             	cmovs  eax,edx
  805eb7:	c1 f8 03             	sar    eax,0x3
  805eba:	48 98                	cdqe   
  805ebc:	48 01 c8             	add    rax,rcx
  805ebf:	48 05 00 00 00 40    	add    rax,0x40000000
            int* ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  805ec5:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            if ((*(glyph + ch_x / 8) & mask) != 0) {
  805ec9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805ecc:	c1 e8 03             	shr    eax,0x3
  805ecf:	89 c2                	mov    edx,eax
  805ed1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805ed5:	48 01 d0             	add    rax,rdx
  805ed8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805edb:	22 45 f3             	and    al,BYTE PTR [rbp-0xd]
  805ede:	84 c0                	test   al,al
  805ee0:	74 0c                	je     805eee <draw_letter+0xdb>
                *ptr=-1;
  805ee2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805ee6:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
  805eec:	eb 0a                	jmp    805ef8 <draw_letter+0xe5>
            } else {
                *ptr=0;
  805eee:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805ef2:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            }

            mask >>= 1;
  805ef8:	d0 6d f3             	shr    BYTE PTR [rbp-0xd],1
            if (ch_x % 8 == 0) {
  805efb:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805efe:	83 e0 07             	and    eax,0x7
  805f01:	85 c0                	test   eax,eax
  805f03:	75 04                	jne    805f09 <draw_letter+0xf6>
                mask = 1 << 7;
  805f05:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80
        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  805f09:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  805f0d:	8b 05 55 16 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21655]        # 427568 <font_width>
  805f13:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  805f16:	0f 82 55 ff ff ff    	jb     805e71 <draw_letter+0x5e>
            }
        }

        glyph += font_width_bytes;
  805f1c:	8b 05 4e 16 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2164e]        # 427570 <font_width_bytes>
  805f22:	89 c0                	mov    eax,eax
  805f24:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  805f28:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  805f2c:	8b 05 3a 16 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2163a]        # 42756c <font_height>
  805f32:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  805f35:	0f 82 26 ff ff ff    	jb     805e61 <draw_letter+0x4e>
    }
}
  805f3b:	90                   	nop
  805f3c:	90                   	nop
  805f3d:	5d                   	pop    rbp
  805f3e:	c3                   	ret    

0000000000805f3f <scr_up>:
//向上滚动一个像素
void scr_up(){
  805f3f:	f3 0f 1e fa          	endbr64 
  805f43:	55                   	push   rbp
  805f44:	48 89 e5             	mov    rbp,rsp
    for(int dy=0;dy<framebuffer.common.framebuffer_height-1;dy++){
  805f47:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805f4e:	eb 71                	jmp    805fc1 <scr_up+0x82>
        for(int dx=0;dx<framebuffer.common.framebuffer_width;dx++){
  805f50:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805f57:	eb 57                	jmp    805fb0 <scr_up+0x71>
            char *p=(char*)(FRAMEBUFFER_ADDR+
                    dy*framebuffer.common.framebuffer_pitch
  805f59:	8b 15 d1 15 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc215d1]        # 427530 <framebuffer+0x10>
  805f5f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805f62:	0f af c2             	imul   eax,edx
  805f65:	89 c1                	mov    ecx,eax
                    +dx*framebuffer.common.framebuffer_bpp/8);
  805f67:	0f b6 05 ce 15 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc215ce]        # 42753c <framebuffer+0x1c>
  805f6e:	0f b6 c0             	movzx  eax,al
  805f71:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  805f75:	8d 50 07             	lea    edx,[rax+0x7]
  805f78:	85 c0                	test   eax,eax
  805f7a:	0f 48 c2             	cmovs  eax,edx
  805f7d:	c1 f8 03             	sar    eax,0x3
  805f80:	48 98                	cdqe   
  805f82:	48 01 c8             	add    rax,rcx
  805f85:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+
  805f8b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p+framebuffer.common.framebuffer_pitch);
  805f8f:	8b 05 9b 15 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2159b]        # 427530 <framebuffer+0x10>
  805f95:	89 c2                	mov    edx,eax
  805f97:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805f9b:	48 01 d0             	add    rax,rdx
  805f9e:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  805fa1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805fa5:	88 10                	mov    BYTE PTR [rax],dl
            p++;
  805fa7:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        for(int dx=0;dx<framebuffer.common.framebuffer_width;dx++){
  805fac:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805fb0:	8b 15 7e 15 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc2157e]        # 427534 <framebuffer+0x14>
  805fb6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805fb9:	39 c2                	cmp    edx,eax
  805fbb:	77 9c                	ja     805f59 <scr_up+0x1a>
    for(int dy=0;dy<framebuffer.common.framebuffer_height-1;dy++){
  805fbd:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805fc1:	8b 05 71 15 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21571]        # 427538 <framebuffer+0x18>
  805fc7:	8d 50 ff             	lea    edx,[rax-0x1]
  805fca:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805fcd:	39 c2                	cmp    edx,eax
  805fcf:	0f 87 7b ff ff ff    	ja     805f50 <scr_up+0x11>
        }

    }
//    for(int i=0;i< framebuffer.common.framebuffer_width*framebuffer.common.framebuffer_bpp/8;i++)
//        *(p++)=0;
}
  805fd5:	90                   	nop
  805fd6:	90                   	nop
  805fd7:	5d                   	pop    rbp
  805fd8:	c3                   	ret    

0000000000805fd9 <scr_down>:
void scr_down(){
  805fd9:	f3 0f 1e fa          	endbr64 
  805fdd:	55                   	push   rbp
  805fde:	48 89 e5             	mov    rbp,rsp
    for(int dy=1;dy<max_ch_nr_y;dy++){
  805fe1:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
  805fe8:	eb 72                	jmp    80605c <scr_down+0x83>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  805fea:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805ff1:	eb 58                	jmp    80604b <scr_down+0x72>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  805ff3:	8b 15 37 15 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21537]        # 427530 <framebuffer+0x10>
  805ff9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805ffc:	0f af c2             	imul   eax,edx
  805fff:	89 c1                	mov    ecx,eax
                            +dx*framebuffer.common.framebuffer_bpp/8);
  806001:	0f b6 05 34 15 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21534]        # 42753c <framebuffer+0x1c>
  806008:	0f b6 c0             	movzx  eax,al
  80600b:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  80600f:	8d 50 07             	lea    edx,[rax+0x7]
  806012:	85 c0                	test   eax,eax
  806014:	0f 48 c2             	cmovs  eax,edx
  806017:	c1 f8 03             	sar    eax,0x3
  80601a:	48 98                	cdqe   
  80601c:	48 01 c8             	add    rax,rcx
  80601f:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  806025:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p-framebuffer.common.framebuffer_pitch);
  806029:	8b 05 01 15 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21501]        # 427530 <framebuffer+0x10>
  80602f:	89 c0                	mov    eax,eax
  806031:	48 f7 d8             	neg    rax
  806034:	48 89 c2             	mov    rdx,rax
  806037:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80603b:	48 01 d0             	add    rax,rdx
  80603e:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  806041:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806045:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  806047:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80604b:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  80604e:	8b 05 00 15 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21500]        # 427554 <max_ch_nr_x>
  806054:	39 c2                	cmp    edx,eax
  806056:	72 9b                	jb     805ff3 <scr_down+0x1a>
    for(int dy=1;dy<max_ch_nr_y;dy++){
  806058:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80605c:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80605f:	8b 05 f3 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc214f3]        # 427558 <max_ch_nr_y>
  806065:	39 c2                	cmp    edx,eax
  806067:	72 81                	jb     805fea <scr_down+0x11>
        }

    }
}
  806069:	90                   	nop
  80606a:	90                   	nop
  80606b:	5d                   	pop    rbp
  80606c:	c3                   	ret    

000000000080606d <print>:
void print(char* s){
  80606d:	f3 0f 1e fa          	endbr64 
  806071:	55                   	push   rbp
  806072:	48 89 e5             	mov    rbp,rsp
  806075:	48 83 ec 08          	sub    rsp,0x8
  806079:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    for(;*s;s++){
  80607d:	e9 c4 00 00 00       	jmp    806146 <print+0xd9>
        if(fb_cursor_x>max_ch_nr_x||*s=='\n')
  806082:	8b 15 c4 14 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc214c4]        # 42754c <fb_cursor_x>
  806088:	8b 05 c6 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc214c6]        # 427554 <max_ch_nr_x>
  80608e:	39 c2                	cmp    edx,eax
  806090:	77 0b                	ja     80609d <print+0x30>
  806092:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806096:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806099:	3c 0a                	cmp    al,0xa
  80609b:	75 19                	jne    8060b6 <print+0x49>
        {
            fb_cursor_y+=1;
  80609d:	8b 05 ad 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc214ad]        # 427550 <fb_cursor_y>
  8060a3:	83 c0 01             	add    eax,0x1
  8060a6:	89 05 a4 14 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc214a4],eax        # 427550 <fb_cursor_y>
            fb_cursor_x=0;
  8060ac:	c7 05 96 14 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc21496],0x0        # 42754c <fb_cursor_x>
  8060b3:	00 00 00 
        }
        if(*s=='\n')continue;
  8060b6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8060ba:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8060bd:	3c 0a                	cmp    al,0xa
  8060bf:	74 7f                	je     806140 <print+0xd3>
        if(fb_cursor_y>=max_ch_nr_y-1){
  8060c1:	8b 05 91 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21491]        # 427558 <max_ch_nr_y>
  8060c7:	8d 50 ff             	lea    edx,[rax-0x1]
  8060ca:	8b 05 80 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21480]        # 427550 <fb_cursor_y>
  8060d0:	39 c2                	cmp    edx,eax
  8060d2:	77 0a                	ja     8060de <print+0x71>
//            for(int i=0;i<font_height*font_size;i++)
////                scr_up();
////            fb_cursor_y=max_ch_nr_y-1;
            fb_cursor_y=0;
  8060d4:	c7 05 72 14 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc21472],0x0        # 427550 <fb_cursor_y>
  8060db:	00 00 00 
        }
        draw_letter(fb_cursor_x*font_width*font_size,fb_cursor_y*font_height*font_size,font_size,*s);
  8060de:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8060e2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8060e5:	0f be d0             	movsx  edx,al
  8060e8:	8b 05 e2 4d 00 00    	mov    eax,DWORD PTR [rip+0x4de2]        # 80aed0 <font_size>
  8060ee:	8b 35 5c 14 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc2145c]        # 427550 <fb_cursor_y>
  8060f4:	8b 0d 72 14 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc21472]        # 42756c <font_height>
  8060fa:	0f af ce             	imul   ecx,esi
  8060fd:	8b 35 cd 4d 00 00    	mov    esi,DWORD PTR [rip+0x4dcd]        # 80aed0 <font_size>
  806103:	0f af ce             	imul   ecx,esi
  806106:	41 89 c8             	mov    r8d,ecx
  806109:	8b 35 3d 14 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc2143d]        # 42754c <fb_cursor_x>
  80610f:	8b 0d 53 14 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc21453]        # 427568 <font_width>
  806115:	0f af ce             	imul   ecx,esi
  806118:	8b 35 b2 4d 00 00    	mov    esi,DWORD PTR [rip+0x4db2]        # 80aed0 <font_size>
  80611e:	0f af ce             	imul   ecx,esi
  806121:	89 cf                	mov    edi,ecx
  806123:	89 d1                	mov    ecx,edx
  806125:	89 c2                	mov    edx,eax
  806127:	44 89 c6             	mov    esi,r8d
  80612a:	e8 e4 fc ff ff       	call   805e13 <draw_letter>
        fb_cursor_x+=1;
  80612f:	8b 05 17 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21417]        # 42754c <fb_cursor_x>
  806135:	83 c0 01             	add    eax,0x1
  806138:	89 05 0e 14 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2140e],eax        # 42754c <fb_cursor_x>
  80613e:	eb 01                	jmp    806141 <print+0xd4>
        if(*s=='\n')continue;
  806140:	90                   	nop
    for(;*s;s++){
  806141:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  806146:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80614a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80614d:	84 c0                	test   al,al
  80614f:	0f 85 2d ff ff ff    	jne    806082 <print+0x15>
    }
}
  806155:	90                   	nop
  806156:	90                   	nop
  806157:	c9                   	leave  
  806158:	c3                   	ret    

0000000000806159 <path_walk>:
#include "errno.h"
#include "memory.h"
#include "log.h"

struct dir_entry * path_walk(char * name,unsigned long flags)
{
  806159:	f3 0f 1e fa          	endbr64 
  80615d:	55                   	push   rbp
  80615e:	48 89 e5             	mov    rbp,rsp
  806161:	48 83 ec 50          	sub    rsp,0x50
  806165:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  806169:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
    char * tmpname = NULL;
  80616d:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  806174:	00 
    int tmpnamelen = 0;
  806175:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    struct dir_entry * parent = root_sb->root;
  80617c:	48 8b 05 05 14 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21405]        # 427588 <root_sb>
  806183:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806186:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    struct dir_entry * path = NULL;
  80618a:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  806191:	00 

    while(*name == '/')
  806192:	eb 05                	jmp    806199 <path_walk+0x40>
        name++;
  806194:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
    while(*name == '/')
  806199:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80619d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8061a0:	3c 2f                	cmp    al,0x2f
  8061a2:	74 f0                	je     806194 <path_walk+0x3b>

    if(!*name)
  8061a4:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8061a8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8061ab:	84 c0                	test   al,al
  8061ad:	75 09                	jne    8061b8 <path_walk+0x5f>
    {
        return parent;
  8061af:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8061b3:	e9 1b 02 00 00       	jmp    8063d3 <path_walk+0x27a>
    }

    for(;;)
    {
        tmpname = name;
  8061b8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8061bc:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        while(*name && (*name != '/'))
  8061c0:	eb 05                	jmp    8061c7 <path_walk+0x6e>
            name++;
  8061c2:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
        while(*name && (*name != '/'))
  8061c7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8061cb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8061ce:	84 c0                	test   al,al
  8061d0:	74 0b                	je     8061dd <path_walk+0x84>
  8061d2:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8061d6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8061d9:	3c 2f                	cmp    al,0x2f
  8061db:	75 e5                	jne    8061c2 <path_walk+0x69>
        tmpnamelen = name - tmpname;
  8061dd:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8061e1:	48 2b 45 f0          	sub    rax,QWORD PTR [rbp-0x10]
  8061e5:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

        path = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  8061e8:	be 00 00 00 00       	mov    esi,0x0
  8061ed:	bf 48 00 00 00       	mov    edi,0x48
  8061f2:	b8 00 00 00 00       	mov    eax,0x0
  8061f7:	e8 ef ae ff ff       	call   8010eb <vmalloc>
  8061fc:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        memset(path,0,sizeof(struct dir_entry));
  806200:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806204:	ba 48 00 00 00       	mov    edx,0x48
  806209:	be 00 00 00 00       	mov    esi,0x0
  80620e:	48 89 c7             	mov    rdi,rax
  806211:	e8 3a 43 00 00       	call   80a550 <memset>

        path->name = vmalloc(tmpnamelen+1,0);
  806216:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806219:	83 c0 01             	add    eax,0x1
  80621c:	be 00 00 00 00       	mov    esi,0x0
  806221:	89 c7                	mov    edi,eax
  806223:	b8 00 00 00 00       	mov    eax,0x0
  806228:	e8 be ae ff ff       	call   8010eb <vmalloc>
  80622d:	48 89 c2             	mov    rdx,rax
  806230:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806234:	48 89 10             	mov    QWORD PTR [rax],rdx
        memset(path->name,0,tmpnamelen+1);
  806237:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80623a:	83 c0 01             	add    eax,0x1
  80623d:	48 63 d0             	movsxd rdx,eax
  806240:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806244:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806247:	be 00 00 00 00       	mov    esi,0x0
  80624c:	48 89 c7             	mov    rdi,rax
  80624f:	e8 fc 42 00 00       	call   80a550 <memset>
        memcpy(tmpname,path->name,tmpnamelen);
  806254:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806257:	48 63 d0             	movsxd rdx,eax
  80625a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80625e:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  806261:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806265:	48 89 ce             	mov    rsi,rcx
  806268:	48 89 c7             	mov    rdi,rax
  80626b:	e8 31 42 00 00       	call   80a4a1 <memcpy>
        path->name_length = tmpnamelen;
  806270:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806274:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  806277:	89 50 08             	mov    DWORD PTR [rax+0x8],edx

        if(parent->dir_inode->inode_ops->lookup(parent->dir_inode,path) == NULL)
  80627a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80627e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806282:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  806286:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  80628a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80628e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806292:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  806296:	48 89 d6             	mov    rsi,rdx
  806299:	48 89 c7             	mov    rdi,rax
  80629c:	ff d1                	call   rcx
  80629e:	48 85 c0             	test   rax,rax
  8062a1:	75 3e                	jne    8062e1 <path_walk+0x188>
        {
            printf("can not find file or dir:%s\n",path->name);
  8062a3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8062a7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8062aa:	48 89 c6             	mov    rsi,rax
  8062ad:	bf b0 2a 81 00       	mov    edi,0x812ab0
  8062b2:	b8 00 00 00 00       	mov    eax,0x0
  8062b7:	e8 17 aa ff ff       	call   800cd3 <printf>
            vmfree(path->name);
  8062bc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8062c0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8062c3:	48 89 c7             	mov    rdi,rax
  8062c6:	e8 af ae ff ff       	call   80117a <vmfree>
            vmfree(path);
  8062cb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8062cf:	48 89 c7             	mov    rdi,rax
  8062d2:	e8 a3 ae ff ff       	call   80117a <vmfree>
            return NULL;
  8062d7:	b8 00 00 00 00       	mov    eax,0x0
  8062dc:	e9 f2 00 00 00       	jmp    8063d3 <path_walk+0x27a>
        }

        list_init(&path->child_node);
  8062e1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8062e5:	48 83 c0 10          	add    rax,0x10
  8062e9:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    struct List * next;
};

__attribute__((always_inline)) inline void list_init(struct List * list)
{
    list->prev = list;
  8062ed:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8062f1:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  8062f5:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  8062f8:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8062fc:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  806300:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  806304:	90                   	nop
        list_init(&path->subdirs_list);
  806305:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806309:	48 83 c0 20          	add    rax,0x20
  80630d:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    list->prev = list;
  806311:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  806315:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  806319:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  80631c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  806320:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  806324:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  806328:	90                   	nop
        path->parent = parent;
  806329:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80632d:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  806331:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
        list_add_to_behind(&parent->subdirs_list,&path->child_node);
  806335:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806339:	48 83 c0 10          	add    rax,0x10
  80633d:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  806341:	48 83 c2 20          	add    rdx,0x20
  806345:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  806349:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

__attribute__((always_inline)) inline void list_add_to_behind(struct List * entry,struct List * new)	////add to entry behind
{
    new->next = entry->next;
  80634d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806351:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  806355:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806359:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    new->prev = entry;
  80635d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806361:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  806365:	48 89 10             	mov    QWORD PTR [rax],rdx
    new->next->prev = new;
  806368:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80636c:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  806370:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  806374:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  806377:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80637b:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80637f:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  806383:	90                   	nop

        if(!*name)
  806384:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806388:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80638b:	84 c0                	test   al,al
  80638d:	74 2a                	je     8063b9 <path_walk+0x260>
            goto last_component;
        while(*name == '/')
  80638f:	eb 05                	jmp    806396 <path_walk+0x23d>
            name++;
  806391:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
        while(*name == '/')
  806396:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80639a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80639d:	3c 2f                	cmp    al,0x2f
  80639f:	74 f0                	je     806391 <path_walk+0x238>
        if(!*name)
  8063a1:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8063a5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8063a8:	84 c0                	test   al,al
  8063aa:	74 10                	je     8063bc <path_walk+0x263>
            goto last_slash;

        parent = path;
  8063ac:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8063b0:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    {
  8063b4:	e9 ff fd ff ff       	jmp    8061b8 <path_walk+0x5f>
            goto last_component;
  8063b9:	90                   	nop
  8063ba:	eb 01                	jmp    8063bd <path_walk+0x264>
            goto last_slash;
  8063bc:	90                   	nop
    }

    last_slash:
    last_component:

    if(flags & 1)
  8063bd:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8063c1:	83 e0 01             	and    eax,0x1
  8063c4:	48 85 c0             	test   rax,rax
  8063c7:	74 06                	je     8063cf <path_walk+0x276>
    {
        return parent;
  8063c9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8063cd:	eb 04                	jmp    8063d3 <path_walk+0x27a>
    }

    return path;
  8063cf:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  8063d3:	c9                   	leave  
  8063d4:	c3                   	ret    

00000000008063d5 <fill_dentry>:

int fill_dentry(void *buf,char *name, long namelen,long type,long offset)
{
  8063d5:	f3 0f 1e fa          	endbr64 
  8063d9:	55                   	push   rbp
  8063da:	48 89 e5             	mov    rbp,rsp
  8063dd:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8063e1:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8063e5:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  8063e9:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  8063ed:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
//
//    memcpy(name,dent->d_name,namelen);
//    dent->d_namelen = namelen;
//    dent->d_type = type;
//    dent->d_offset = offset;
    return sizeof(struct dirent) + namelen;
  8063f1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8063f5:	83 c0 18             	add    eax,0x18
}
  8063f8:	5d                   	pop    rbp
  8063f9:	c3                   	ret    

00000000008063fa <mount_fs>:
//function mount_root
struct super_block * root_sb = NULL;
struct file_system_type filesystem = {"filesystem",0};

struct super_block* mount_fs(char * name,struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  8063fa:	f3 0f 1e fa          	endbr64 
  8063fe:	55                   	push   rbp
  8063ff:	48 89 e5             	mov    rbp,rsp
  806402:	48 83 ec 30          	sub    rsp,0x30
  806406:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80640a:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80640e:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file_system_type * p = NULL;
  806412:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  806419:	00 

    for(p = &filesystem;p;p = p->next)
  80641a:	48 c7 45 f8 e0 ae 80 	mov    QWORD PTR [rbp-0x8],0x80aee0
  806421:	00 
  806422:	eb 40                	jmp    806464 <mount_fs+0x6a>
        if(!strcmp(p->name,name))
  806424:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806428:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80642b:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80642f:	48 89 d6             	mov    rsi,rdx
  806432:	48 89 c7             	mov    rdi,rax
  806435:	e8 05 43 00 00       	call   80a73f <strcmp>
  80643a:	85 c0                	test   eax,eax
  80643c:	75 1a                	jne    806458 <mount_fs+0x5e>
        {
            return p->read_superblock(DPTE,buf);
  80643e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806442:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  806446:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80644a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80644e:	48 89 d6             	mov    rsi,rdx
  806451:	48 89 c7             	mov    rdi,rax
  806454:	ff d1                	call   rcx
  806456:	eb 18                	jmp    806470 <mount_fs+0x76>
    for(p = &filesystem;p;p = p->next)
  806458:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80645c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806460:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  806464:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  806469:	75 b9                	jne    806424 <mount_fs+0x2a>
        }
    return 0;
  80646b:	b8 00 00 00 00       	mov    eax,0x0
}
  806470:	c9                   	leave  
  806471:	c3                   	ret    

0000000000806472 <register_filesystem>:

unsigned long register_filesystem(struct file_system_type * fs)
{
  806472:	f3 0f 1e fa          	endbr64 
  806476:	55                   	push   rbp
  806477:	48 89 e5             	mov    rbp,rsp
  80647a:	48 83 ec 20          	sub    rsp,0x20
  80647e:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = NULL;
  806482:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  806489:	00 

    for(p = &filesystem;p;p = p->next)
  80648a:	48 c7 45 f8 e0 ae 80 	mov    QWORD PTR [rbp-0x8],0x80aee0
  806491:	00 
  806492:	eb 30                	jmp    8064c4 <register_filesystem+0x52>
        if(!strcmp(fs->name,p->name))
  806494:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806498:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80649b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80649f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8064a2:	48 89 d6             	mov    rsi,rdx
  8064a5:	48 89 c7             	mov    rdi,rax
  8064a8:	e8 92 42 00 00       	call   80a73f <strcmp>
  8064ad:	85 c0                	test   eax,eax
  8064af:	75 07                	jne    8064b8 <register_filesystem+0x46>
            return 0;
  8064b1:	b8 00 00 00 00       	mov    eax,0x0
  8064b6:	eb 32                	jmp    8064ea <register_filesystem+0x78>
    for(p = &filesystem;p;p = p->next)
  8064b8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8064bc:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8064c0:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  8064c4:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8064c9:	75 c9                	jne    806494 <register_filesystem+0x22>

    fs->next = filesystem.next;
  8064cb:	48 8b 15 26 4a 00 00 	mov    rdx,QWORD PTR [rip+0x4a26]        # 80aef8 <filesystem+0x18>
  8064d2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8064d6:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    filesystem.next = fs;
  8064da:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8064de:	48 89 05 13 4a 00 00 	mov    QWORD PTR [rip+0x4a13],rax        # 80aef8 <filesystem+0x18>

    return 1;
  8064e5:	b8 01 00 00 00       	mov    eax,0x1
}
  8064ea:	c9                   	leave  
  8064eb:	c3                   	ret    

00000000008064ec <unregister_filesystem>:

unsigned long unregister_filesystem(struct file_system_type * fs)
{
  8064ec:	f3 0f 1e fa          	endbr64 
  8064f0:	55                   	push   rbp
  8064f1:	48 89 e5             	mov    rbp,rsp
  8064f4:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = &filesystem;
  8064f8:	48 c7 45 f8 e0 ae 80 	mov    QWORD PTR [rbp-0x8],0x80aee0
  8064ff:	00 

    while(p->next)
  806500:	eb 41                	jmp    806543 <unregister_filesystem+0x57>
        if(p->next == fs)
  806502:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806506:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80650a:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  80650e:	75 27                	jne    806537 <unregister_filesystem+0x4b>
        {
            p->next = p->next->next;
  806510:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806514:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806518:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  80651c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806520:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
            fs->next = NULL;
  806524:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806528:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  80652f:	00 
            return 1;
  806530:	b8 01 00 00 00       	mov    eax,0x1
  806535:	eb 1e                	jmp    806555 <unregister_filesystem+0x69>
        }
        else
            p = p->next;
  806537:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80653b:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80653f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p->next)
  806543:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806547:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80654b:	48 85 c0             	test   rax,rax
  80654e:	75 b2                	jne    806502 <unregister_filesystem+0x16>
    return 0;
  806550:	b8 00 00 00 00       	mov    eax,0x0
}
  806555:	5d                   	pop    rbp
  806556:	c3                   	ret    

0000000000806557 <shift>:
/* 0x5D - Apps      */ {  0,        0,       0x5D,      0x5D }
        };
char k_shift=0,k_ctrl=0,k_capslock=0;

void shift()
{
  806557:	f3 0f 1e fa          	endbr64 
  80655b:	55                   	push   rbp
  80655c:	48 89 e5             	mov    rbp,rsp
    k_shift=!k_shift;
  80655f:	0f b6 05 47 12 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21247]        # 4277ad <k_shift>
  806566:	84 c0                	test   al,al
  806568:	0f 94 c0             	sete   al
  80656b:	88 05 3c 12 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc2123c],al        # 4277ad <k_shift>
}
  806571:	90                   	nop
  806572:	5d                   	pop    rbp
  806573:	c3                   	ret    

0000000000806574 <ctrl>:
void ctrl()
{
  806574:	f3 0f 1e fa          	endbr64 
  806578:	55                   	push   rbp
  806579:	48 89 e5             	mov    rbp,rsp
    k_ctrl=!k_ctrl;
  80657c:	0f b6 05 2b 12 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2122b]        # 4277ae <k_ctrl>
  806583:	84 c0                	test   al,al
  806585:	0f 94 c0             	sete   al
  806588:	88 05 20 12 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc21220],al        # 4277ae <k_ctrl>
}
  80658e:	90                   	nop
  80658f:	5d                   	pop    rbp
  806590:	c3                   	ret    

0000000000806591 <capslock>:
void capslock()
{
  806591:	f3 0f 1e fa          	endbr64 
  806595:	55                   	push   rbp
  806596:	48 89 e5             	mov    rbp,rsp
    k_capslock=k_capslock==0?1:0;
  806599:	0f b6 05 0f 12 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2120f]        # 4277af <k_capslock>
  8065a0:	84 c0                	test   al,al
  8065a2:	0f 94 c0             	sete   al
  8065a5:	88 05 04 12 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc21204],al        # 4277af <k_capslock>
}
  8065ab:	90                   	nop
  8065ac:	5d                   	pop    rbp
  8065ad:	c3                   	ret    

00000000008065ae <to_ascii>:
char to_ascii(char scan_code)
{
  8065ae:	f3 0f 1e fa          	endbr64 
  8065b2:	55                   	push   rbp
  8065b3:	48 89 e5             	mov    rbp,rsp
  8065b6:	89 f8                	mov    eax,edi
  8065b8:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  8065bb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8065c2:	e9 c7 00 00 00       	jmp    80668e <to_ascii+0xe0>
        if(key_map[i].scan_code==scan_code)
  8065c7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8065ca:	48 63 d0             	movsxd rdx,eax
  8065cd:	48 89 d0             	mov    rax,rdx
  8065d0:	48 c1 e0 02          	shl    rax,0x2
  8065d4:	48 01 d0             	add    rax,rdx
  8065d7:	48 05 42 2c 81 00    	add    rax,0x812c42
  8065dd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8065e0:	38 45 ec             	cmp    BYTE PTR [rbp-0x14],al
  8065e3:	0f 85 a1 00 00 00    	jne    80668a <to_ascii+0xdc>
        {
            if(k_capslock&&key_map[i].ascii>='a'&&key_map[i].ascii<='z')return key_map[i].ascii_shift;
  8065e9:	0f b6 05 bf 11 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc211bf]        # 4277af <k_capslock>
  8065f0:	84 c0                	test   al,al
  8065f2:	74 55                	je     806649 <to_ascii+0x9b>
  8065f4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8065f7:	48 63 d0             	movsxd rdx,eax
  8065fa:	48 89 d0             	mov    rax,rdx
  8065fd:	48 c1 e0 02          	shl    rax,0x2
  806601:	48 01 d0             	add    rax,rdx
  806604:	48 05 40 2c 81 00    	add    rax,0x812c40
  80660a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80660d:	3c 60                	cmp    al,0x60
  80660f:	7e 38                	jle    806649 <to_ascii+0x9b>
  806611:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806614:	48 63 d0             	movsxd rdx,eax
  806617:	48 89 d0             	mov    rax,rdx
  80661a:	48 c1 e0 02          	shl    rax,0x2
  80661e:	48 01 d0             	add    rax,rdx
  806621:	48 05 40 2c 81 00    	add    rax,0x812c40
  806627:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80662a:	3c 7a                	cmp    al,0x7a
  80662c:	7f 1b                	jg     806649 <to_ascii+0x9b>
  80662e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806631:	48 63 d0             	movsxd rdx,eax
  806634:	48 89 d0             	mov    rax,rdx
  806637:	48 c1 e0 02          	shl    rax,0x2
  80663b:	48 01 d0             	add    rax,rdx
  80663e:	48 05 41 2c 81 00    	add    rax,0x812c41
  806644:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806647:	eb 54                	jmp    80669d <to_ascii+0xef>
            else if(k_shift)return key_map[i].ascii_shift;
  806649:	0f b6 05 5d 11 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2115d]        # 4277ad <k_shift>
  806650:	84 c0                	test   al,al
  806652:	74 1b                	je     80666f <to_ascii+0xc1>
  806654:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806657:	48 63 d0             	movsxd rdx,eax
  80665a:	48 89 d0             	mov    rax,rdx
  80665d:	48 c1 e0 02          	shl    rax,0x2
  806661:	48 01 d0             	add    rax,rdx
  806664:	48 05 41 2c 81 00    	add    rax,0x812c41
  80666a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80666d:	eb 2e                	jmp    80669d <to_ascii+0xef>
            else return key_map[i].ascii;
  80666f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806672:	48 63 d0             	movsxd rdx,eax
  806675:	48 89 d0             	mov    rax,rdx
  806678:	48 c1 e0 02          	shl    rax,0x2
  80667c:	48 01 d0             	add    rax,rdx
  80667f:	48 05 40 2c 81 00    	add    rax,0x812c40
  806685:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806688:	eb 13                	jmp    80669d <to_ascii+0xef>
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  80668a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80668e:	83 7d fc 5d          	cmp    DWORD PTR [rbp-0x4],0x5d
  806692:	0f 8e 2f ff ff ff    	jle    8065c7 <to_ascii+0x19>
        }

    return '\0';
  806698:	b8 00 00 00 00       	mov    eax,0x0
}
  80669d:	5d                   	pop    rbp
  80669e:	c3                   	ret    

000000000080669f <init_kb>:
int init_kb()
{
  80669f:	f3 0f 1e fa          	endbr64 
  8066a3:	55                   	push   rbp
  8066a4:	48 89 e5             	mov    rbp,rsp
    reg_device(&dev_keyboard);
  8066a7:	bf 80 2b 81 00       	mov    edi,0x812b80
  8066ac:	e8 a3 c3 ff ff       	call   802a54 <reg_device>
    reg_driver(&drv_keyboard);
  8066b1:	bf e0 2a 81 00       	mov    edi,0x812ae0
  8066b6:	e8 81 c6 ff ff       	call   802d3c <reg_driver>
}
  8066bb:	90                   	nop
  8066bc:	5d                   	pop    rbp
  8066bd:	c3                   	ret    

00000000008066be <key_proc>:
int key_proc()
{
  8066be:	f3 0f 1e fa          	endbr64 
  8066c2:	55                   	push   rbp
  8066c3:	48 89 e5             	mov    rbp,rsp
  8066c6:	48 83 ec 10          	sub    rsp,0x10
    //获取完整的扫描码
    u8 scan1=0,scan2=0,ch=0;
  8066ca:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
  8066ce:	c6 45 fe 00          	mov    BYTE PTR [rbp-0x2],0x0
  8066d2:	c6 45 fd 00          	mov    BYTE PTR [rbp-0x3],0x0
    key_code tmpc;
    scan1=inb(0x60);
  8066d6:	bf 60 00 00 00       	mov    edi,0x60
  8066db:	e8 69 e7 ff ff       	call   804e49 <inb>
  8066e0:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
//    tmpc.scan_code2=scan2;
//    tmpc.ascii= ch;


//    ENQUEUE(key_bufq,tmpc)
    if((key_bufq.tail+1)%key_bufq.size!=key_bufq.head)
  8066e3:	8b 05 23 48 00 00    	mov    eax,DWORD PTR [rip+0x4823]        # 80af0c <key_bufq+0xc>
  8066e9:	83 c0 01             	add    eax,0x1
  8066ec:	8b 0d 1e 48 00 00    	mov    ecx,DWORD PTR [rip+0x481e]        # 80af10 <key_bufq+0x10>
  8066f2:	99                   	cdq    
  8066f3:	f7 f9                	idiv   ecx
  8066f5:	8b 05 0d 48 00 00    	mov    eax,DWORD PTR [rip+0x480d]        # 80af08 <key_bufq+0x8>
  8066fb:	39 c2                	cmp    edx,eax
  8066fd:	74 32                	je     806731 <key_proc+0x73>
    {
        key_bufq.data[key_bufq.tail]=scan1;
  8066ff:	48 8b 15 fa 47 00 00 	mov    rdx,QWORD PTR [rip+0x47fa]        # 80af00 <key_bufq>
  806706:	8b 05 00 48 00 00    	mov    eax,DWORD PTR [rip+0x4800]        # 80af0c <key_bufq+0xc>
  80670c:	48 98                	cdqe   
  80670e:	48 01 c2             	add    rdx,rax
  806711:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  806715:	88 02                	mov    BYTE PTR [rdx],al
        key_bufq.tail=(key_bufq.tail+1)%key_bufq.size;
  806717:	8b 05 ef 47 00 00    	mov    eax,DWORD PTR [rip+0x47ef]        # 80af0c <key_bufq+0xc>
  80671d:	83 c0 01             	add    eax,0x1
  806720:	8b 0d ea 47 00 00    	mov    ecx,DWORD PTR [rip+0x47ea]        # 80af10 <key_bufq+0x10>
  806726:	99                   	cdq    
  806727:	f7 f9                	idiv   ecx
  806729:	89 d0                	mov    eax,edx
  80672b:	89 05 db 47 00 00    	mov    DWORD PTR [rip+0x47db],eax        # 80af0c <key_bufq+0xc>
    }

    if(scan1==0x48)
  806731:	80 7d ff 48          	cmp    BYTE PTR [rbp-0x1],0x48
  806735:	75 0a                	jne    806741 <key_proc+0x83>
        scr_up();
  806737:	b8 00 00 00 00       	mov    eax,0x0
  80673c:	e8 fe f7 ff ff       	call   805f3f <scr_up>
    if(scan1==0x50)
  806741:	80 7d ff 50          	cmp    BYTE PTR [rbp-0x1],0x50
  806745:	75 0a                	jne    806751 <key_proc+0x93>
        scr_down();
  806747:	b8 00 00 00 00       	mov    eax,0x0
  80674c:	e8 88 f8 ff ff       	call   805fd9 <scr_down>
    switch (scan1)
  806751:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  806755:	3d b6 00 00 00       	cmp    eax,0xb6
  80675a:	74 41                	je     80679d <key_proc+0xdf>
  80675c:	3d b6 00 00 00       	cmp    eax,0xb6
  806761:	7f 5e                	jg     8067c1 <key_proc+0x103>
  806763:	3d aa 00 00 00       	cmp    eax,0xaa
  806768:	74 33                	je     80679d <key_proc+0xdf>
  80676a:	3d aa 00 00 00       	cmp    eax,0xaa
  80676f:	7f 50                	jg     8067c1 <key_proc+0x103>
  806771:	3d 9d 00 00 00       	cmp    eax,0x9d
  806776:	74 31                	je     8067a9 <key_proc+0xeb>
  806778:	3d 9d 00 00 00       	cmp    eax,0x9d
  80677d:	7f 42                	jg     8067c1 <key_proc+0x103>
  80677f:	83 f8 3a             	cmp    eax,0x3a
  806782:	74 31                	je     8067b5 <key_proc+0xf7>
  806784:	83 f8 3a             	cmp    eax,0x3a
  806787:	7f 38                	jg     8067c1 <key_proc+0x103>
  806789:	83 f8 36             	cmp    eax,0x36
  80678c:	74 0f                	je     80679d <key_proc+0xdf>
  80678e:	83 f8 36             	cmp    eax,0x36
  806791:	7f 2e                	jg     8067c1 <key_proc+0x103>
  806793:	83 f8 1d             	cmp    eax,0x1d
  806796:	74 11                	je     8067a9 <key_proc+0xeb>
  806798:	83 f8 2a             	cmp    eax,0x2a
  80679b:	75 24                	jne    8067c1 <key_proc+0x103>
    {
        case 0x36:
        case 0x2a:
        case 0xaa:
        case 0xb6:
            shift();
  80679d:	b8 00 00 00 00       	mov    eax,0x0
  8067a2:	e8 b0 fd ff ff       	call   806557 <shift>
            break;
  8067a7:	eb 19                	jmp    8067c2 <key_proc+0x104>
        case 0x1d:
        case 0x9d:
            ctrl();
  8067a9:	b8 00 00 00 00       	mov    eax,0x0
  8067ae:	e8 c1 fd ff ff       	call   806574 <ctrl>
            break;
  8067b3:	eb 0d                	jmp    8067c2 <key_proc+0x104>
        case 0x3a:
            capslock();
  8067b5:	b8 00 00 00 00       	mov    eax,0x0
  8067ba:	e8 d2 fd ff ff       	call   806591 <capslock>
            break;
  8067bf:	eb 01                	jmp    8067c2 <key_proc+0x104>
        default:
            break;
  8067c1:	90                   	nop
//        //logf("%x\n",stdin.w_ptr);
//        //print_stdin();
//        //printchar(ch);
//        //flush_screen(0);*/
//    }
    eoi();
  8067c2:	b8 00 00 00 00       	mov    eax,0x0
  8067c7:	e8 92 e6 ff ff       	call   804e5e <eoi>
    asm volatile("leave \r\n iretq");
  8067cc:	c9                   	leave  
  8067cd:	48 cf                	iretq  
}
  8067cf:	90                   	nop
  8067d0:	c9                   	leave  
  8067d1:	c3                   	ret    

00000000008067d2 <sys_getkbc>:

char sys_getkbc()
{
  8067d2:	f3 0f 1e fa          	endbr64 
  8067d6:	55                   	push   rbp
  8067d7:	48 89 e5             	mov    rbp,rsp
    if(key_bufq.tail==key_bufq.head)return -1;
  8067da:	8b 15 2c 47 00 00    	mov    edx,DWORD PTR [rip+0x472c]        # 80af0c <key_bufq+0xc>
  8067e0:	8b 05 22 47 00 00    	mov    eax,DWORD PTR [rip+0x4722]        # 80af08 <key_bufq+0x8>
  8067e6:	39 c2                	cmp    edx,eax
  8067e8:	75 07                	jne    8067f1 <sys_getkbc+0x1f>
  8067ea:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8067ef:	eb 30                	jmp    806821 <sys_getkbc+0x4f>
    char c=key_buf[key_bufq.tail];
  8067f1:	8b 05 15 47 00 00    	mov    eax,DWORD PTR [rip+0x4715]        # 80af0c <key_bufq+0xc>
  8067f7:	48 98                	cdqe   
  8067f9:	0f b6 80 a0 75 42 00 	movzx  eax,BYTE PTR [rax+0x4275a0]
  806800:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    QTAIL(key_bufq)=(QTAIL(key_bufq)+1)%QSIZE(key_bufq);
  806803:	8b 05 03 47 00 00    	mov    eax,DWORD PTR [rip+0x4703]        # 80af0c <key_bufq+0xc>
  806809:	83 c0 01             	add    eax,0x1
  80680c:	8b 0d fe 46 00 00    	mov    ecx,DWORD PTR [rip+0x46fe]        # 80af10 <key_bufq+0x10>
  806812:	99                   	cdq    
  806813:	f7 f9                	idiv   ecx
  806815:	89 d0                	mov    eax,edx
  806817:	89 05 ef 46 00 00    	mov    DWORD PTR [rip+0x46ef],eax        # 80af0c <key_bufq+0xc>
    return c;
  80681d:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  806821:	5d                   	pop    rbp
  806822:	c3                   	ret    

0000000000806823 <init_disk>:
        .read=async_read_disk,
        .write=async_write_disk
};
int disks[4];//四块硬盘的dev号
int init_disk()
{
  806823:	f3 0f 1e fa          	endbr64 
  806827:	55                   	push   rbp
  806828:	48 89 e5             	mov    rbp,rsp
    //disk_devi= reg_device(&dev_disk);
    //disk_drvi= reg_driver(&drv_disk);
    //dev_disk.drv=&drv_disk;
    hd_iterate();
  80682b:	b8 00 00 00 00       	mov    eax,0x0
  806830:	e8 8d 09 00 00       	call   8071c2 <hd_iterate>
    return 0;
  806835:	b8 00 00 00 00       	mov    eax,0x0
}
  80683a:	5d                   	pop    rbp
  80683b:	c3                   	ret    

000000000080683c <disk_int_handler_c>:

int disk_int_handler_c()
{
  80683c:	f3 0f 1e fa          	endbr64 
  806840:	55                   	push   rbp
  806841:	48 89 e5             	mov    rbp,rsp
  806844:	48 83 ec 20          	sub    rsp,0x20
    if(running_req==NULL)
  806848:	48 8b 05 71 3c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23c71]        # 42a4c0 <running_req>
  80684f:	48 85 c0             	test   rax,rax
  806852:	75 0a                	jne    80685e <disk_int_handler_c+0x22>
    {
        //printf("err:null running dreq\n");
        return 1;//同步读写硬盘
  806854:	b8 01 00 00 00       	mov    eax,0x1
  806859:	e9 a3 01 00 00       	jmp    806a01 <disk_int_handler_c+0x1c5>
    }
    short *p=running_req->buf;
  80685e:	48 8b 05 5b 3c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23c5b]        # 42a4c0 <running_req>
  806865:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806869:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int port=PORT_DISK_MAJOR;
  80686d:	c7 45 f4 f0 01 00 00 	mov    DWORD PTR [rbp-0xc],0x1f0
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  806874:	48 8b 05 45 3c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23c45]        # 42a4c0 <running_req>
  80687b:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80687e:	83 f8 02             	cmp    eax,0x2
  806881:	74 0f                	je     806892 <disk_int_handler_c+0x56>
    running_req->disk==DISK_SLAVE_SLAVE)
  806883:	48 8b 05 36 3c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23c36]        # 42a4c0 <running_req>
  80688a:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  80688d:	83 f8 03             	cmp    eax,0x3
  806890:	75 07                	jne    806899 <disk_int_handler_c+0x5d>
        port=PORT_DISK_SLAVE;
  806892:	c7 45 f4 70 01 00 00 	mov    DWORD PTR [rbp-0xc],0x170
    if(running_req->func==DISKREQ_READ)
  806899:	48 8b 05 20 3c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23c20]        # 42a4c0 <running_req>
  8068a0:	8b 00                	mov    eax,DWORD PTR [rax]
  8068a2:	85 c0                	test   eax,eax
  8068a4:	75 42                	jne    8068e8 <disk_int_handler_c+0xac>
    {
        ////printf("sys_read dist:%x\n",p);
        //读取
        for(int i=0;i<running_req->sec_n*256;i++)
  8068a6:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  8068ad:	eb 22                	jmp    8068d1 <disk_int_handler_c+0x95>
        {
            *p++=inw(port);
  8068af:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8068b2:	0f b7 c0             	movzx  eax,ax
  8068b5:	89 c7                	mov    edi,eax
  8068b7:	e8 97 e5 ff ff       	call   804e53 <inw>
  8068bc:	89 c2                	mov    edx,eax
  8068be:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8068c2:	48 8d 48 02          	lea    rcx,[rax+0x2]
  8068c6:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  8068ca:	66 89 10             	mov    WORD PTR [rax],dx
        for(int i=0;i<running_req->sec_n*256;i++)
  8068cd:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  8068d1:	48 8b 05 e8 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23be8]        # 42a4c0 <running_req>
  8068d8:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  8068db:	c1 e0 08             	shl    eax,0x8
  8068de:	39 45 f0             	cmp    DWORD PTR [rbp-0x10],eax
  8068e1:	7c cc                	jl     8068af <disk_int_handler_c+0x73>
  8068e3:	e9 ca 00 00 00       	jmp    8069b2 <disk_int_handler_c+0x176>
        }
    }else if(running_req->func==DISKREQ_WRITE)
  8068e8:	48 8b 05 d1 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23bd1]        # 42a4c0 <running_req>
  8068ef:	8b 00                	mov    eax,DWORD PTR [rax]
  8068f1:	83 f8 01             	cmp    eax,0x1
  8068f4:	75 42                	jne    806938 <disk_int_handler_c+0xfc>
    {
        for(int i=0;i<running_req->sec_n*256;i++)
  8068f6:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8068fd:	eb 25                	jmp    806924 <disk_int_handler_c+0xe8>
            outw(port,*p++);
  8068ff:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806903:	48 8d 50 02          	lea    rdx,[rax+0x2]
  806907:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80690b:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80690e:	0f b7 d0             	movzx  edx,ax
  806911:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806914:	0f b7 c0             	movzx  eax,ax
  806917:	89 d6                	mov    esi,edx
  806919:	89 c7                	mov    edi,eax
  80691b:	e8 1d e5 ff ff       	call   804e3d <outw>
        for(int i=0;i<running_req->sec_n*256;i++)
  806920:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  806924:	48 8b 05 95 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23b95]        # 42a4c0 <running_req>
  80692b:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80692e:	c1 e0 08             	shl    eax,0x8
  806931:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  806934:	7c c9                	jl     8068ff <disk_int_handler_c+0xc3>
  806936:	eb 7a                	jmp    8069b2 <disk_int_handler_c+0x176>
    }else if(running_req->func==DISKREQ_CHECK)
  806938:	48 8b 05 81 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23b81]        # 42a4c0 <running_req>
  80693f:	8b 00                	mov    eax,DWORD PTR [rax]
  806941:	83 f8 02             	cmp    eax,0x2
  806944:	75 34                	jne    80697a <disk_int_handler_c+0x13e>
    {
        char stat=inb(port+7);
  806946:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806949:	83 c0 07             	add    eax,0x7
  80694c:	0f b6 c0             	movzx  eax,al
  80694f:	89 c7                	mov    edi,eax
  806951:	e8 f3 e4 ff ff       	call   804e49 <inb>
  806956:	88 45 e7             	mov    BYTE PTR [rbp-0x19],al
        short dat=inw(port);
  806959:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80695c:	0f b7 c0             	movzx  eax,ax
  80695f:	89 c7                	mov    edi,eax
  806961:	e8 ed e4 ff ff       	call   804e53 <inw>
  806966:	66 89 45 e4          	mov    WORD PTR [rbp-0x1c],ax
        if(1)
        {
            running_req->result=DISK_CHK_OK;
  80696a:	48 8b 05 4f 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23b4f]        # 42a4c0 <running_req>
  806971:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  806978:	eb 38                	jmp    8069b2 <disk_int_handler_c+0x176>
            char err=inb(port+1);//错误原因
            printf("checking disk err:%x\nresetting hd\n",err);
            running_req->result=DISK_CHK_ERR;
            request(running_req->disk,DISKREQ_RESET,0,0,0);
        }
    }else if(running_req->func==DISKREQ_RESET)
  80697a:	48 8b 05 3f 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23b3f]        # 42a4c0 <running_req>
  806981:	8b 00                	mov    eax,DWORD PTR [rax]
  806983:	83 f8 03             	cmp    eax,0x3
  806986:	75 2a                	jne    8069b2 <disk_int_handler_c+0x176>
    {
        int stat=inb(port+7);
  806988:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80698b:	83 c0 07             	add    eax,0x7
  80698e:	0f b6 c0             	movzx  eax,al
  806991:	89 c7                	mov    edi,eax
  806993:	e8 b1 e4 ff ff       	call   804e49 <inb>
  806998:	0f b6 c0             	movzx  eax,al
  80699b:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
        printf("reset disk done.\nstat now:%x\n",stat);
  80699e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8069a1:	89 c6                	mov    esi,eax
  8069a3:	bf 16 2e 81 00       	mov    edi,0x812e16
  8069a8:	b8 00 00 00 00       	mov    eax,0x0
  8069ad:	e8 21 a3 ff ff       	call   800cd3 <printf>
    }
    running_req->stat=REQ_STAT_DONE;
  8069b2:	48 8b 05 07 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23b07]        # 42a4c0 <running_req>
  8069b9:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  8069c0:	48 8b 05 f9 3a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23af9]        # 42a4c0 <running_req>
  8069c7:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  8069cb:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  8069d2:	00 00 00 
    running_devman_req->stat=REQ_STAT_DONE;
  8069d5:	48 8b 05 ec 3a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23aec]        # 42a4c8 <running_devman_req>
  8069dc:	c7 80 ac 00 00 00 03 	mov    DWORD PTR [rax+0xac],0x3
  8069e3:	00 00 00 
    running_devman_req=NULL;
  8069e6:	48 c7 05 d7 3a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23ad7],0x0        # 42a4c8 <running_devman_req>
  8069ed:	00 00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  8069f1:	48 c7 05 c4 3a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23ac4],0x0        # 42a4c0 <running_req>
  8069f8:	00 00 00 00 
    return 0;
  8069fc:	b8 00 00 00 00       	mov    eax,0x0
}
  806a01:	c9                   	leave  
  806a02:	c3                   	ret    

0000000000806a03 <check_dreq_stat>:
int check_dreq_stat(int req_id)
{
  806a03:	f3 0f 1e fa          	endbr64 
  806a07:	55                   	push   rbp
  806a08:	48 89 e5             	mov    rbp,rsp
  806a0b:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return disk_reqs[req_id].stat;
  806a0e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806a11:	48 63 d0             	movsxd rdx,eax
  806a14:	48 89 d0             	mov    rax,rdx
  806a17:	48 01 c0             	add    rax,rax
  806a1a:	48 01 d0             	add    rax,rdx
  806a1d:	48 c1 e0 04          	shl    rax,0x4
  806a21:	48 05 dc 77 42 00    	add    rax,0x4277dc
  806a27:	8b 00                	mov    eax,DWORD PTR [rax]
}
  806a29:	5d                   	pop    rbp
  806a2a:	c3                   	ret    

0000000000806a2b <request>:
int request(int disk,int func,int lba,int secn,char *buf){
  806a2b:	f3 0f 1e fa          	endbr64 
  806a2f:	55                   	push   rbp
  806a30:	48 89 e5             	mov    rbp,rsp
  806a33:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806a36:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806a39:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  806a3c:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  806a3f:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    if((tail+1)%MAX_DISK_REQUEST_COUNT==head)
  806a43:	8b 05 ab 3a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23aab]        # 42a4f4 <tail>
  806a49:	83 c0 01             	add    eax,0x1
  806a4c:	48 63 d0             	movsxd rdx,eax
  806a4f:	48 69 d2 89 88 88 88 	imul   rdx,rdx,0xffffffff88888889
  806a56:	48 c1 ea 20          	shr    rdx,0x20
  806a5a:	01 c2                	add    edx,eax
  806a5c:	c1 fa 07             	sar    edx,0x7
  806a5f:	89 c1                	mov    ecx,eax
  806a61:	c1 f9 1f             	sar    ecx,0x1f
  806a64:	29 ca                	sub    edx,ecx
  806a66:	69 ca f0 00 00 00    	imul   ecx,edx,0xf0
  806a6c:	29 c8                	sub    eax,ecx
  806a6e:	89 c2                	mov    edx,eax
  806a70:	8b 05 7a 3a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23a7a]        # 42a4f0 <head>
  806a76:	39 c2                	cmp    edx,eax
  806a78:	75 0a                	jne    806a84 <request+0x59>
    {
        return -1;
  806a7a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806a7f:	e9 0d 01 00 00       	jmp    806b91 <request+0x166>
    }
    disk_reqs[tail].disk=disk;
  806a84:	8b 05 6a 3a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23a6a]        # 42a4f4 <tail>
  806a8a:	48 63 d0             	movsxd rdx,eax
  806a8d:	48 89 d0             	mov    rax,rdx
  806a90:	48 01 c0             	add    rax,rax
  806a93:	48 01 d0             	add    rax,rdx
  806a96:	48 c1 e0 04          	shl    rax,0x4
  806a9a:	48 8d 90 c4 77 42 00 	lea    rdx,[rax+0x4277c4]
  806aa1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806aa4:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].func=func;
  806aa6:	8b 05 48 3a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23a48]        # 42a4f4 <tail>
  806aac:	48 63 d0             	movsxd rdx,eax
  806aaf:	48 89 d0             	mov    rax,rdx
  806ab2:	48 01 c0             	add    rax,rax
  806ab5:	48 01 d0             	add    rax,rdx
  806ab8:	48 c1 e0 04          	shl    rax,0x4
  806abc:	48 8d 90 c0 77 42 00 	lea    rdx,[rax+0x4277c0]
  806ac3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806ac6:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].lba=lba;
  806ac8:	8b 05 26 3a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23a26]        # 42a4f4 <tail>
  806ace:	48 63 d0             	movsxd rdx,eax
  806ad1:	48 89 d0             	mov    rax,rdx
  806ad4:	48 01 c0             	add    rax,rax
  806ad7:	48 01 d0             	add    rax,rdx
  806ada:	48 c1 e0 04          	shl    rax,0x4
  806ade:	48 8d 90 c8 77 42 00 	lea    rdx,[rax+0x4277c8]
  806ae5:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806ae8:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].sec_n=secn;
  806aea:	8b 05 04 3a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23a04]        # 42a4f4 <tail>
  806af0:	48 63 d0             	movsxd rdx,eax
  806af3:	48 89 d0             	mov    rax,rdx
  806af6:	48 01 c0             	add    rax,rax
  806af9:	48 01 d0             	add    rax,rdx
  806afc:	48 c1 e0 04          	shl    rax,0x4
  806b00:	48 8d 90 cc 77 42 00 	lea    rdx,[rax+0x4277cc]
  806b07:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  806b0a:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].stat=REQ_STAT_READY;
  806b0c:	8b 05 e2 39 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc239e2]        # 42a4f4 <tail>
  806b12:	48 63 d0             	movsxd rdx,eax
  806b15:	48 89 d0             	mov    rax,rdx
  806b18:	48 01 c0             	add    rax,rax
  806b1b:	48 01 d0             	add    rax,rdx
  806b1e:	48 c1 e0 04          	shl    rax,0x4
  806b22:	48 05 dc 77 42 00    	add    rax,0x4277dc
  806b28:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    disk_reqs[tail].buf=buf;
  806b2e:	8b 05 c0 39 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc239c0]        # 42a4f4 <tail>
  806b34:	48 63 d0             	movsxd rdx,eax
  806b37:	48 89 d0             	mov    rax,rdx
  806b3a:	48 01 c0             	add    rax,rax
  806b3d:	48 01 d0             	add    rax,rdx
  806b40:	48 c1 e0 04          	shl    rax,0x4
  806b44:	48 8d 90 d0 77 42 00 	lea    rdx,[rax+0x4277d0]
  806b4b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806b4f:	48 89 02             	mov    QWORD PTR [rdx],rax
    int r=tail;
  806b52:	8b 05 9c 39 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2399c]        # 42a4f4 <tail>
  806b58:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    tail=(tail+1)%MAX_DISK_REQUEST_COUNT;
  806b5b:	8b 05 93 39 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23993]        # 42a4f4 <tail>
  806b61:	8d 50 01             	lea    edx,[rax+0x1]
  806b64:	48 63 c2             	movsxd rax,edx
  806b67:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  806b6e:	48 c1 e8 20          	shr    rax,0x20
  806b72:	01 d0                	add    eax,edx
  806b74:	c1 f8 07             	sar    eax,0x7
  806b77:	89 d1                	mov    ecx,edx
  806b79:	c1 f9 1f             	sar    ecx,0x1f
  806b7c:	29 c8                	sub    eax,ecx
  806b7e:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  806b84:	89 d0                	mov    eax,edx
  806b86:	29 c8                	sub    eax,ecx
  806b88:	89 05 66 39 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc23966],eax        # 42a4f4 <tail>
    return r;
  806b8e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  806b91:	5d                   	pop    rbp
  806b92:	c3                   	ret    

0000000000806b93 <execute_request>:
int execute_request(){
  806b93:	f3 0f 1e fa          	endbr64 
  806b97:	55                   	push   rbp
  806b98:	48 89 e5             	mov    rbp,rsp
  806b9b:	48 83 ec 10          	sub    rsp,0x10
    //查看是否有已经在运行的请求
    if(running_req!=NULL)
  806b9f:	48 8b 05 1a 39 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2391a]        # 42a4c0 <running_req>
  806ba6:	48 85 c0             	test   rax,rax
  806ba9:	74 6a                	je     806c15 <execute_request+0x82>
    {
        running_req->time++;
  806bab:	48 8b 05 0e 39 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2390e]        # 42a4c0 <running_req>
  806bb2:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  806bb5:	83 c2 01             	add    edx,0x1
  806bb8:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
        if(running_req->func!=DISKREQ_CHECK)
  806bbb:	48 8b 05 fe 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc238fe]        # 42a4c0 <running_req>
  806bc2:	8b 00                	mov    eax,DWORD PTR [rax]
  806bc4:	83 f8 02             	cmp    eax,0x2
  806bc7:	74 0a                	je     806bd3 <execute_request+0x40>
            return 2;
  806bc9:	b8 02 00 00 00       	mov    eax,0x2
  806bce:	e9 b4 01 00 00       	jmp    806d87 <execute_request+0x1f4>
        if(running_req->time>MAX_DISK_CHKTIME)
  806bd3:	48 8b 05 e6 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc238e6]        # 42a4c0 <running_req>
  806bda:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  806bdd:	83 f8 0a             	cmp    eax,0xa
  806be0:	7e 29                	jle    806c0b <execute_request+0x78>
        {
            //检测硬盘超时，视为没有硬盘连接
            running_req->result=DISK_CHK_ERR;
  806be2:	48 8b 05 d7 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc238d7]        # 42a4c0 <running_req>
  806be9:	c7 40 20 02 00 00 00 	mov    DWORD PTR [rax+0x20],0x2
            running_req->stat=REQ_STAT_DONE;
  806bf0:	48 8b 05 c9 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc238c9]        # 42a4c0 <running_req>
  806bf7:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
            running_req=NULL;
  806bfe:	48 c7 05 b7 38 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc238b7],0x0        # 42a4c0 <running_req>
  806c05:	00 00 00 00 
  806c09:	eb 0a                	jmp    806c15 <execute_request+0x82>
        }else
        {
            //未到时间继续等待
            return 2;
  806c0b:	b8 02 00 00 00       	mov    eax,0x2
  806c10:	e9 72 01 00 00       	jmp    806d87 <execute_request+0x1f4>
        }
    }
    if(head==tail)return 1;//检查是否为空
  806c15:	8b 15 d5 38 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc238d5]        # 42a4f0 <head>
  806c1b:	8b 05 d3 38 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc238d3]        # 42a4f4 <tail>
  806c21:	39 c2                	cmp    edx,eax
  806c23:	75 0a                	jne    806c2f <execute_request+0x9c>
  806c25:	b8 01 00 00 00       	mov    eax,0x1
  806c2a:	e9 58 01 00 00       	jmp    806d87 <execute_request+0x1f4>
    running_req=&disk_reqs[head];
  806c2f:	8b 05 bb 38 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc238bb]        # 42a4f0 <head>
  806c35:	48 63 d0             	movsxd rdx,eax
  806c38:	48 89 d0             	mov    rax,rdx
  806c3b:	48 01 c0             	add    rax,rax
  806c3e:	48 01 d0             	add    rax,rdx
  806c41:	48 c1 e0 04          	shl    rax,0x4
  806c45:	48 05 c0 77 42 00    	add    rax,0x4277c0
  806c4b:	48 89 05 6e 38 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2386e],rax        # 42a4c0 <running_req>
    head=(head+1)%MAX_DISK_REQUEST_COUNT;
  806c52:	8b 05 98 38 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23898]        # 42a4f0 <head>
  806c58:	8d 50 01             	lea    edx,[rax+0x1]
  806c5b:	48 63 c2             	movsxd rax,edx
  806c5e:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  806c65:	48 c1 e8 20          	shr    rax,0x20
  806c69:	01 d0                	add    eax,edx
  806c6b:	c1 f8 07             	sar    eax,0x7
  806c6e:	89 d1                	mov    ecx,edx
  806c70:	c1 f9 1f             	sar    ecx,0x1f
  806c73:	29 c8                	sub    eax,ecx
  806c75:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  806c7b:	89 d0                	mov    eax,edx
  806c7d:	29 c8                	sub    eax,ecx
  806c7f:	89 05 6b 38 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2386b],eax        # 42a4f0 <head>
    running_req->stat=REQ_STAT_WORKING;
  806c85:	48 8b 05 34 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23834]        # 42a4c0 <running_req>
  806c8c:	c7 40 1c 02 00 00 00 	mov    DWORD PTR [rax+0x1c],0x2
    //set_proc_stat(running_req->pid,SUSPENDED);
    int r=0;
  806c93:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    switch (running_req->func)
  806c9a:	48 8b 05 1f 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2381f]        # 42a4c0 <running_req>
  806ca1:	8b 00                	mov    eax,DWORD PTR [rax]
  806ca3:	83 f8 03             	cmp    eax,0x3
  806ca6:	0f 84 ad 00 00 00    	je     806d59 <execute_request+0x1c6>
  806cac:	83 f8 03             	cmp    eax,0x3
  806caf:	0f 8f bf 00 00 00    	jg     806d74 <execute_request+0x1e1>
  806cb5:	83 f8 02             	cmp    eax,0x2
  806cb8:	0f 84 85 00 00 00    	je     806d43 <execute_request+0x1b0>
  806cbe:	83 f8 02             	cmp    eax,0x2
  806cc1:	0f 8f ad 00 00 00    	jg     806d74 <execute_request+0x1e1>
  806cc7:	85 c0                	test   eax,eax
  806cc9:	74 0a                	je     806cd5 <execute_request+0x142>
  806ccb:	83 f8 01             	cmp    eax,0x1
  806cce:	74 3c                	je     806d0c <execute_request+0x179>
        break;
    case DISKREQ_RESET:
        r=async_reset_disk(running_req->disk);
        break;
    default:
        break;
  806cd0:	e9 9f 00 00 00       	jmp    806d74 <execute_request+0x1e1>
        running_req->lba,running_req->sec_n,running_req->buf);
  806cd5:	48 8b 05 e4 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc237e4]        # 42a4c0 <running_req>
        r=async_read_disk(running_req->disk,\
  806cdc:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
        running_req->lba,running_req->sec_n,running_req->buf);
  806ce0:	48 8b 05 d9 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc237d9]        # 42a4c0 <running_req>
        r=async_read_disk(running_req->disk,\
  806ce7:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
        running_req->lba,running_req->sec_n,running_req->buf);
  806cea:	48 8b 05 cf 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc237cf]        # 42a4c0 <running_req>
  806cf1:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_read_disk(running_req->disk,\
  806cf4:	89 c6                	mov    esi,eax
  806cf6:	48 8b 05 c3 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc237c3]        # 42a4c0 <running_req>
  806cfd:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806d00:	89 c7                	mov    edi,eax
  806d02:	e8 a7 00 00 00       	call   806dae <async_read_disk>
  806d07:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806d0a:	eb 69                	jmp    806d75 <execute_request+0x1e2>
         running_req->lba,running_req->sec_n,running_req->buf);
  806d0c:	48 8b 05 ad 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc237ad]        # 42a4c0 <running_req>
        r=async_write_disk(running_req->disk,\
  806d13:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
         running_req->lba,running_req->sec_n,running_req->buf);
  806d17:	48 8b 05 a2 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc237a2]        # 42a4c0 <running_req>
        r=async_write_disk(running_req->disk,\
  806d1e:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
         running_req->lba,running_req->sec_n,running_req->buf);
  806d21:	48 8b 05 98 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23798]        # 42a4c0 <running_req>
  806d28:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_write_disk(running_req->disk,\
  806d2b:	89 c6                	mov    esi,eax
  806d2d:	48 8b 05 8c 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2378c]        # 42a4c0 <running_req>
  806d34:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806d37:	89 c7                	mov    edi,eax
  806d39:	e8 88 01 00 00       	call   806ec6 <async_write_disk>
  806d3e:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806d41:	eb 32                	jmp    806d75 <execute_request+0x1e2>
        r=async_check_disk(running_req->disk);
  806d43:	48 8b 05 76 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23776]        # 42a4c0 <running_req>
  806d4a:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806d4d:	89 c7                	mov    edi,eax
  806d4f:	e8 8f 06 00 00       	call   8073e3 <async_check_disk>
  806d54:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806d57:	eb 1c                	jmp    806d75 <execute_request+0x1e2>
        r=async_reset_disk(running_req->disk);
  806d59:	48 8b 05 60 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23760]        # 42a4c0 <running_req>
  806d60:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806d63:	89 c7                	mov    edi,eax
  806d65:	b8 00 00 00 00       	mov    eax,0x0
  806d6a:	e8 1a 00 00 00       	call   806d89 <async_reset_disk>
  806d6f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806d72:	eb 01                	jmp    806d75 <execute_request+0x1e2>
        break;
  806d74:	90                   	nop
    }
    if(r==-1)return -1;
  806d75:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  806d79:	75 07                	jne    806d82 <execute_request+0x1ef>
  806d7b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806d80:	eb 05                	jmp    806d87 <execute_request+0x1f4>
    return 0;
  806d82:	b8 00 00 00 00       	mov    eax,0x0
}
  806d87:	c9                   	leave  
  806d88:	c3                   	ret    

0000000000806d89 <async_reset_disk>:
int async_reset_disk(int disk)
{
  806d89:	f3 0f 1e fa          	endbr64 
  806d8d:	55                   	push   rbp
  806d8e:	48 89 e5             	mov    rbp,rsp
  806d91:	48 83 ec 10          	sub    rsp,0x10
  806d95:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    outb(PORT_DISK_CONTROL,DISK_CMD_RESET);
  806d98:	be 0c 00 00 00       	mov    esi,0xc
  806d9d:	bf f6 03 00 00       	mov    edi,0x3f6
  806da2:	e8 89 e0 ff ff       	call   804e30 <outb>
    return 0;
  806da7:	b8 00 00 00 00       	mov    eax,0x0
}
  806dac:	c9                   	leave  
  806dad:	c3                   	ret    

0000000000806dae <async_read_disk>:
int async_read_disk(int disk,unsigned int lba,int sec_n,char* mem_addr)
{
  806dae:	f3 0f 1e fa          	endbr64 
  806db2:	55                   	push   rbp
  806db3:	48 89 e5             	mov    rbp,rsp
  806db6:	48 83 ec 30          	sub    rsp,0x30
  806dba:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806dbd:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806dc0:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  806dc3:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  806dc7:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  806dcd:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  806dd4:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  806dd8:	74 06                	je     806de0 <async_read_disk+0x32>
  806dda:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806dde:	75 06                	jne    806de6 <async_read_disk+0x38>
        port=PORT_DISK_SLAVE;
  806de0:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  806de6:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806dea:	74 06                	je     806df2 <async_read_disk+0x44>
  806dec:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  806df0:	75 07                	jne    806df9 <async_read_disk+0x4b>
        slave_disk=1;
  806df2:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    outb(port+2,sec_n);
  806df9:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806dfc:	0f b6 d0             	movzx  edx,al
  806dff:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806e03:	83 c0 02             	add    eax,0x2
  806e06:	0f b7 c0             	movzx  eax,ax
  806e09:	89 d6                	mov    esi,edx
  806e0b:	89 c7                	mov    edi,eax
  806e0d:	e8 1e e0 ff ff       	call   804e30 <outb>
    outb(port+3,lba&0xff);
  806e12:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806e15:	0f b6 d0             	movzx  edx,al
  806e18:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806e1c:	83 c0 03             	add    eax,0x3
  806e1f:	0f b7 c0             	movzx  eax,ax
  806e22:	89 d6                	mov    esi,edx
  806e24:	89 c7                	mov    edi,eax
  806e26:	e8 05 e0 ff ff       	call   804e30 <outb>
    outb(port+4,(lba>>8)&0xff);
  806e2b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806e2e:	c1 e8 08             	shr    eax,0x8
  806e31:	0f b6 d0             	movzx  edx,al
  806e34:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806e38:	83 c0 04             	add    eax,0x4
  806e3b:	0f b7 c0             	movzx  eax,ax
  806e3e:	89 d6                	mov    esi,edx
  806e40:	89 c7                	mov    edi,eax
  806e42:	e8 e9 df ff ff       	call   804e30 <outb>
    outb(port+5,(lba>>16)&0xff);
  806e47:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806e4a:	c1 e8 10             	shr    eax,0x10
  806e4d:	0f b6 d0             	movzx  edx,al
  806e50:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806e54:	83 c0 05             	add    eax,0x5
  806e57:	0f b7 c0             	movzx  eax,ax
  806e5a:	89 d6                	mov    esi,edx
  806e5c:	89 c7                	mov    edi,eax
  806e5e:	e8 cd df ff ff       	call   804e30 <outb>
    char drv=slave_disk?0x10:0;
  806e63:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  806e67:	74 07                	je     806e70 <async_read_disk+0xc2>
  806e69:	b8 10 00 00 00       	mov    eax,0x10
  806e6e:	eb 05                	jmp    806e75 <async_read_disk+0xc7>
  806e70:	b8 00 00 00 00       	mov    eax,0x0
  806e75:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
    char lba_hi=(lba>>24)&0xf|drv|0xe0;
  806e78:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806e7b:	c1 e8 18             	shr    eax,0x18
  806e7e:	83 e0 0f             	and    eax,0xf
  806e81:	89 c2                	mov    edx,eax
  806e83:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  806e87:	09 d0                	or     eax,edx
  806e89:	83 c8 e0             	or     eax,0xffffffe0
  806e8c:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
    outb(port+6,lba_hi);
  806e8f:	0f b6 45 f6          	movzx  eax,BYTE PTR [rbp-0xa]
  806e93:	0f b6 d0             	movzx  edx,al
  806e96:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806e9a:	83 c0 06             	add    eax,0x6
  806e9d:	0f b7 c0             	movzx  eax,ax
  806ea0:	89 d6                	mov    esi,edx
  806ea2:	89 c7                	mov    edi,eax
  806ea4:	e8 87 df ff ff       	call   804e30 <outb>
    outb(port+7,DISK_CMD_READ);
  806ea9:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806ead:	83 c0 07             	add    eax,0x7
  806eb0:	0f b7 c0             	movzx  eax,ax
  806eb3:	be 20 00 00 00       	mov    esi,0x20
  806eb8:	89 c7                	mov    edi,eax
  806eba:	e8 71 df ff ff       	call   804e30 <outb>
    // }
    // for(int i=0;i<running_req->sec_n*256;i++)
    // {
    //     *mem_addr++=inw(port);
    // }
    return 0;
  806ebf:	b8 00 00 00 00       	mov    eax,0x0
}
  806ec4:	c9                   	leave  
  806ec5:	c3                   	ret    

0000000000806ec6 <async_write_disk>:
int async_write_disk(int disk,unsigned int lba, int sec_n, char* mem_ptr)
{
  806ec6:	f3 0f 1e fa          	endbr64 
  806eca:	55                   	push   rbp
  806ecb:	48 89 e5             	mov    rbp,rsp
  806ece:	48 83 ec 30          	sub    rsp,0x30
  806ed2:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806ed5:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806ed8:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  806edb:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  806edf:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  806ee5:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  806eec:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  806ef0:	74 06                	je     806ef8 <async_write_disk+0x32>
  806ef2:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806ef6:	75 06                	jne    806efe <async_write_disk+0x38>
        port=PORT_DISK_SLAVE;
  806ef8:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  806efe:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806f02:	74 06                	je     806f0a <async_write_disk+0x44>
  806f04:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  806f08:	75 07                	jne    806f11 <async_write_disk+0x4b>
        slave_disk=1;
  806f0a:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    while (1)
    {
        byte t=inb(0x1f7);
  806f11:	bf f7 00 00 00       	mov    edi,0xf7
  806f16:	e8 2e df ff ff       	call   804e49 <inb>
  806f1b:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
        //logf("istat:%x",t);
        byte err=t&1;
  806f1e:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  806f22:	83 e0 01             	and    eax,0x1
  806f25:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
        if(err!=0)
  806f28:	80 7d f6 00          	cmp    BYTE PTR [rbp-0xa],0x0
  806f2c:	74 0a                	je     806f38 <async_write_disk+0x72>
        {
            //printf("ERR iwriting disk\n");
            return -1;
  806f2e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806f33:	e9 d5 00 00 00       	jmp    80700d <async_write_disk+0x147>
        }
        t&=0x88;
  806f38:	80 65 f7 88          	and    BYTE PTR [rbp-0x9],0x88
        if(t==0x8)break;
  806f3c:	80 7d f7 08          	cmp    BYTE PTR [rbp-0x9],0x8
  806f40:	74 02                	je     806f44 <async_write_disk+0x7e>
    {
  806f42:	eb cd                	jmp    806f11 <async_write_disk+0x4b>
        if(t==0x8)break;
  806f44:	90                   	nop
    }
    outb(port+2,sec_n);
  806f45:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806f48:	0f b6 d0             	movzx  edx,al
  806f4b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806f4f:	83 c0 02             	add    eax,0x2
  806f52:	0f b7 c0             	movzx  eax,ax
  806f55:	89 d6                	mov    esi,edx
  806f57:	89 c7                	mov    edi,eax
  806f59:	e8 d2 de ff ff       	call   804e30 <outb>
    outb(port+3,lba&0xff);
  806f5e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806f61:	0f b6 d0             	movzx  edx,al
  806f64:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806f68:	83 c0 03             	add    eax,0x3
  806f6b:	0f b7 c0             	movzx  eax,ax
  806f6e:	89 d6                	mov    esi,edx
  806f70:	89 c7                	mov    edi,eax
  806f72:	e8 b9 de ff ff       	call   804e30 <outb>
    outb(port+4,(lba>>8)&0xff);
  806f77:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806f7a:	c1 e8 08             	shr    eax,0x8
  806f7d:	0f b6 d0             	movzx  edx,al
  806f80:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806f84:	83 c0 04             	add    eax,0x4
  806f87:	0f b7 c0             	movzx  eax,ax
  806f8a:	89 d6                	mov    esi,edx
  806f8c:	89 c7                	mov    edi,eax
  806f8e:	e8 9d de ff ff       	call   804e30 <outb>
    outb(port+5,(lba>>16)&0xff);
  806f93:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806f96:	c1 e8 10             	shr    eax,0x10
  806f99:	0f b6 d0             	movzx  edx,al
  806f9c:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806fa0:	83 c0 05             	add    eax,0x5
  806fa3:	0f b7 c0             	movzx  eax,ax
  806fa6:	89 d6                	mov    esi,edx
  806fa8:	89 c7                	mov    edi,eax
  806faa:	e8 81 de ff ff       	call   804e30 <outb>
    char drv=slave_disk?0x10:0;
  806faf:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  806fb3:	74 07                	je     806fbc <async_write_disk+0xf6>
  806fb5:	b8 10 00 00 00       	mov    eax,0x10
  806fba:	eb 05                	jmp    806fc1 <async_write_disk+0xfb>
  806fbc:	b8 00 00 00 00       	mov    eax,0x0
  806fc1:	88 45 f5             	mov    BYTE PTR [rbp-0xb],al
    unsigned char lba_hi=(lba>>24)&0xf|drv|0xe0;
  806fc4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806fc7:	c1 e8 18             	shr    eax,0x18
  806fca:	83 e0 0f             	and    eax,0xf
  806fcd:	89 c2                	mov    edx,eax
  806fcf:	0f b6 45 f5          	movzx  eax,BYTE PTR [rbp-0xb]
  806fd3:	09 d0                	or     eax,edx
  806fd5:	83 c8 e0             	or     eax,0xffffffe0
  806fd8:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    outb(port+6,lba_hi);
  806fdb:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  806fdf:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806fe3:	83 c0 06             	add    eax,0x6
  806fe6:	0f b7 c0             	movzx  eax,ax
  806fe9:	89 d6                	mov    esi,edx
  806feb:	89 c7                	mov    edi,eax
  806fed:	e8 3e de ff ff       	call   804e30 <outb>
    outb(port+7,DISK_CMD_WRITE);
  806ff2:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806ff6:	83 c0 07             	add    eax,0x7
  806ff9:	0f b7 c0             	movzx  eax,ax
  806ffc:	be 30 00 00 00       	mov    esi,0x30
  807001:	89 c7                	mov    edi,eax
  807003:	e8 28 de ff ff       	call   804e30 <outb>
    //     if(t==0x8)break;
    // }
    // short *p=mem_ptr;
    // for(int i=0;i<running_req->sec_n*256;i++)
    //         outw(port,*p++);
    return 0;
  807008:	b8 00 00 00 00       	mov    eax,0x0
}
  80700d:	c9                   	leave  
  80700e:	c3                   	ret    

000000000080700f <read_disk>:
int read_disk(driver_args* args)
{
  80700f:	f3 0f 1e fa          	endbr64 
  807013:	55                   	push   rbp
  807014:	48 89 e5             	mov    rbp,rsp
  807017:	48 83 ec 20          	sub    rsp,0x20
  80701b:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=read_disk_asm(args->lba,args->sec_c,args->dist_addr);
  80701f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807023:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  807026:	48 98                	cdqe   
  807028:	48 89 c2             	mov    rdx,rax
  80702b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80702f:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  807032:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807036:	8b 00                	mov    eax,DWORD PTR [rax]
  807038:	89 ce                	mov    esi,ecx
  80703a:	89 c7                	mov    edi,eax
  80703c:	e8 8b 05 00 00       	call   8075cc <read_disk_asm>
  807041:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  807044:	48 8b 05 75 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23475]        # 42a4c0 <running_req>
  80704b:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  807052:	48 8b 05 67 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23467]        # 42a4c0 <running_req>
  807059:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  80705d:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  807064:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  807067:	48 c7 05 4e 34 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2344e],0x0        # 42a4c0 <running_req>
  80706e:	00 00 00 00 
    return ret;
  807072:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  807075:	c9                   	leave  
  807076:	c3                   	ret    

0000000000807077 <write_disk>:
int write_disk(driver_args* args)
{
  807077:	f3 0f 1e fa          	endbr64 
  80707b:	55                   	push   rbp
  80707c:	48 89 e5             	mov    rbp,rsp
  80707f:	48 83 ec 20          	sub    rsp,0x20
  807083:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=write_disk_asm(args->lba,args->sec_c,args->src_addr);
  807087:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80708b:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80708e:	48 98                	cdqe   
  807090:	48 89 c2             	mov    rdx,rax
  807093:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807097:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  80709a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80709e:	8b 00                	mov    eax,DWORD PTR [rax]
  8070a0:	89 ce                	mov    esi,ecx
  8070a2:	89 c7                	mov    edi,eax
  8070a4:	e8 a3 05 00 00       	call   80764c <write_disk_asm>
  8070a9:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  8070ac:	48 8b 05 0d 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2340d]        # 42a4c0 <running_req>
  8070b3:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  8070ba:	48 8b 05 ff 33 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc233ff]        # 42a4c0 <running_req>
  8070c1:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  8070c5:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  8070cc:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  8070cf:	48 c7 05 e6 33 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc233e6],0x0        # 42a4c0 <running_req>
  8070d6:	00 00 00 00 
    return ret;
  8070da:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8070dd:	c9                   	leave  
  8070de:	c3                   	ret    

00000000008070df <chk_result>:
int chk_result(int r)
{
  8070df:	f3 0f 1e fa          	endbr64 
  8070e3:	55                   	push   rbp
  8070e4:	48 89 e5             	mov    rbp,rsp
  8070e7:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(disk_reqs[r].stat!=REQ_STAT_DONE);
  8070ea:	90                   	nop
  8070eb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8070ee:	48 63 d0             	movsxd rdx,eax
  8070f1:	48 89 d0             	mov    rax,rdx
  8070f4:	48 01 c0             	add    rax,rax
  8070f7:	48 01 d0             	add    rax,rdx
  8070fa:	48 c1 e0 04          	shl    rax,0x4
  8070fe:	48 05 dc 77 42 00    	add    rax,0x4277dc
  807104:	8b 00                	mov    eax,DWORD PTR [rax]
  807106:	83 f8 03             	cmp    eax,0x3
  807109:	75 e0                	jne    8070eb <chk_result+0xc>
    return disk_reqs[r].result==DISK_CHK_OK?1:0;
  80710b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80710e:	48 63 d0             	movsxd rdx,eax
  807111:	48 89 d0             	mov    rax,rdx
  807114:	48 01 c0             	add    rax,rax
  807117:	48 01 d0             	add    rax,rdx
  80711a:	48 c1 e0 04          	shl    rax,0x4
  80711e:	48 05 e0 77 42 00    	add    rax,0x4277e0
  807124:	8b 00                	mov    eax,DWORD PTR [rax]
  807126:	83 f8 01             	cmp    eax,0x1
  807129:	0f 94 c0             	sete   al
  80712c:	0f b6 c0             	movzx  eax,al
}
  80712f:	5d                   	pop    rbp
  807130:	c3                   	ret    

0000000000807131 <disk_existent>:
int disk_existent(int disk)
{
  807131:	f3 0f 1e fa          	endbr64 
  807135:	55                   	push   rbp
  807136:	48 89 e5             	mov    rbp,rsp
  807139:	48 83 ec 10          	sub    rsp,0x10
  80713d:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    switch (disk)
  807140:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  807144:	74 5f                	je     8071a5 <disk_existent+0x74>
  807146:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  80714a:	7f 6e                	jg     8071ba <disk_existent+0x89>
  80714c:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  807150:	74 3e                	je     807190 <disk_existent+0x5f>
  807152:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  807156:	7f 62                	jg     8071ba <disk_existent+0x89>
  807158:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80715c:	74 08                	je     807166 <disk_existent+0x35>
  80715e:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
  807162:	74 17                	je     80717b <disk_existent+0x4a>
        
    case DISK_SLAVE_SLAVE:
        return sys_find_dev("hd3")!=-1;
        break;
    default:
        break;
  807164:	eb 54                	jmp    8071ba <disk_existent+0x89>
        return sys_find_dev("hd0")!=-1;
  807166:	bf 34 2e 81 00       	mov    edi,0x812e34
  80716b:	e8 1c bd ff ff       	call   802e8c <sys_find_dev>
  807170:	83 f8 ff             	cmp    eax,0xffffffff
  807173:	0f 95 c0             	setne  al
  807176:	0f b6 c0             	movzx  eax,al
  807179:	eb 45                	jmp    8071c0 <disk_existent+0x8f>
        return sys_find_dev("hd1")!=-1;
  80717b:	bf 38 2e 81 00       	mov    edi,0x812e38
  807180:	e8 07 bd ff ff       	call   802e8c <sys_find_dev>
  807185:	83 f8 ff             	cmp    eax,0xffffffff
  807188:	0f 95 c0             	setne  al
  80718b:	0f b6 c0             	movzx  eax,al
  80718e:	eb 30                	jmp    8071c0 <disk_existent+0x8f>
        return sys_find_dev("hd2")!=-1;
  807190:	bf 3c 2e 81 00       	mov    edi,0x812e3c
  807195:	e8 f2 bc ff ff       	call   802e8c <sys_find_dev>
  80719a:	83 f8 ff             	cmp    eax,0xffffffff
  80719d:	0f 95 c0             	setne  al
  8071a0:	0f b6 c0             	movzx  eax,al
  8071a3:	eb 1b                	jmp    8071c0 <disk_existent+0x8f>
        return sys_find_dev("hd3")!=-1;
  8071a5:	bf 40 2e 81 00       	mov    edi,0x812e40
  8071aa:	e8 dd bc ff ff       	call   802e8c <sys_find_dev>
  8071af:	83 f8 ff             	cmp    eax,0xffffffff
  8071b2:	0f 95 c0             	setne  al
  8071b5:	0f b6 c0             	movzx  eax,al
  8071b8:	eb 06                	jmp    8071c0 <disk_existent+0x8f>
        break;
  8071ba:	90                   	nop
    }
    return 0;
  8071bb:	b8 00 00 00 00       	mov    eax,0x0
}
  8071c0:	c9                   	leave  
  8071c1:	c3                   	ret    

00000000008071c2 <hd_iterate>:
int hd_iterate()
{
  8071c2:	f3 0f 1e fa          	endbr64 
  8071c6:	55                   	push   rbp
  8071c7:	48 89 e5             	mov    rbp,rsp
  8071ca:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
    char *name;
    
    int r[4];
    r[0]=request(DISK_MAJOR_MAJOR,DISKREQ_CHECK,0,1,0);
  8071d1:	41 b8 00 00 00 00    	mov    r8d,0x0
  8071d7:	b9 01 00 00 00       	mov    ecx,0x1
  8071dc:	ba 00 00 00 00       	mov    edx,0x0
  8071e1:	be 02 00 00 00       	mov    esi,0x2
  8071e6:	bf 00 00 00 00       	mov    edi,0x0
  8071eb:	e8 3b f8 ff ff       	call   806a2b <request>
  8071f0:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    r[1]=request(DISK_MAJOR_SLAVE,DISKREQ_CHECK,0,1,0);
  8071f3:	41 b8 00 00 00 00    	mov    r8d,0x0
  8071f9:	b9 01 00 00 00       	mov    ecx,0x1
  8071fe:	ba 00 00 00 00       	mov    edx,0x0
  807203:	be 02 00 00 00       	mov    esi,0x2
  807208:	bf 01 00 00 00       	mov    edi,0x1
  80720d:	e8 19 f8 ff ff       	call   806a2b <request>
  807212:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    r[2]=request(DISK_SLAVE_MAJOR,DISKREQ_CHECK,0,1,0);
  807215:	41 b8 00 00 00 00    	mov    r8d,0x0
  80721b:	b9 01 00 00 00       	mov    ecx,0x1
  807220:	ba 00 00 00 00       	mov    edx,0x0
  807225:	be 02 00 00 00       	mov    esi,0x2
  80722a:	bf 02 00 00 00       	mov    edi,0x2
  80722f:	e8 f7 f7 ff ff       	call   806a2b <request>
  807234:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    r[3]=request(DISK_SLAVE_SLAVE,DISKREQ_CHECK,0,1,0);
  807237:	41 b8 00 00 00 00    	mov    r8d,0x0
  80723d:	b9 01 00 00 00       	mov    ecx,0x1
  807242:	ba 00 00 00 00       	mov    edx,0x0
  807247:	be 02 00 00 00       	mov    esi,0x2
  80724c:	bf 03 00 00 00       	mov    edi,0x3
  807251:	e8 d5 f7 ff ff       	call   806a2b <request>
  807256:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    for(int i=0;i<1;i++)
  807259:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  807260:	e9 72 01 00 00       	jmp    8073d7 <hd_iterate+0x215>
    {
        int disk;
        switch (i)
  807265:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  807269:	74 3b                	je     8072a6 <hd_iterate+0xe4>
  80726b:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  80726f:	7f 3e                	jg     8072af <hd_iterate+0xed>
  807271:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  807275:	74 26                	je     80729d <hd_iterate+0xdb>
  807277:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  80727b:	7f 32                	jg     8072af <hd_iterate+0xed>
  80727d:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  807281:	74 08                	je     80728b <hd_iterate+0xc9>
  807283:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  807287:	74 0b                	je     807294 <hd_iterate+0xd2>
  807289:	eb 24                	jmp    8072af <hd_iterate+0xed>
        {
        case 0:disk=DISK_MAJOR_MAJOR;break;
  80728b:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  807292:	eb 25                	jmp    8072b9 <hd_iterate+0xf7>
        case 1:disk=DISK_MAJOR_SLAVE;break;
  807294:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [rbp-0x10],0x1
  80729b:	eb 1c                	jmp    8072b9 <hd_iterate+0xf7>
        case 2:disk=DISK_SLAVE_MAJOR;break;
  80729d:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [rbp-0x10],0x2
  8072a4:	eb 13                	jmp    8072b9 <hd_iterate+0xf7>
        case 3:disk=DISK_SLAVE_SLAVE;break;
  8072a6:	c7 45 f0 03 00 00 00 	mov    DWORD PTR [rbp-0x10],0x3
  8072ad:	eb 0a                	jmp    8072b9 <hd_iterate+0xf7>
        default:
            return -1;
  8072af:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8072b4:	e9 28 01 00 00       	jmp    8073e1 <hd_iterate+0x21f>
            break;
        }
        if(chk_result(r[i]))//&&!disk_existent(disk)
  8072b9:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8072bc:	48 98                	cdqe   
  8072be:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  8072c2:	89 c7                	mov    edi,eax
  8072c4:	e8 16 fe ff ff       	call   8070df <chk_result>
  8072c9:	85 c0                	test   eax,eax
  8072cb:	0f 84 81 00 00 00    	je     807352 <hd_iterate+0x190>
        {
            printf("disk %d checked.\n",i);
  8072d1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8072d4:	89 c6                	mov    esi,eax
  8072d6:	bf 44 2e 81 00       	mov    edi,0x812e44
  8072db:	b8 00 00 00 00       	mov    eax,0x0
  8072e0:	e8 ee 99 ff ff       	call   800cd3 <printf>
            //新硬盘
            device hd={
  8072e5:	48 8d 95 20 ff ff ff 	lea    rdx,[rbp-0xe0]
  8072ec:	b8 00 00 00 00       	mov    eax,0x0
  8072f1:	b9 15 00 00 00       	mov    ecx,0x15
  8072f6:	48 89 d7             	mov    rdi,rdx
  8072f9:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  8072fc:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8072ff:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  807305:	c7 85 28 ff ff ff 01 	mov    DWORD PTR [rbp-0xd8],0x1
  80730c:	00 00 00 
  80730f:	c7 85 2c ff ff ff 01 	mov    DWORD PTR [rbp-0xd4],0x1
  807316:	00 00 00 
                .type=DEV_TYPE_BLKDEV,
                .stype=DEV_STYPE_HD,
                .slave_dev=disk,
                .start_port=i<2?PORT_DISK_MAJOR:PORT_DISK_SLAVE
  807319:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  80731d:	7f 07                	jg     807326 <hd_iterate+0x164>
  80731f:	b8 f0 01 00 00       	mov    eax,0x1f0
  807324:	eb 05                	jmp    80732b <hd_iterate+0x169>
  807326:	b8 70 01 00 00       	mov    eax,0x170
            device hd={
  80732b:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            };
            disks[i]=reg_device(&hd);
  807331:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  807338:	48 89 c7             	mov    rdi,rax
  80733b:	e8 14 b7 ff ff       	call   802a54 <reg_device>
  807340:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  807343:	48 63 d2             	movsxd rdx,edx
  807346:	89 04 95 e0 a4 42 00 	mov    DWORD PTR [rdx*4+0x42a4e0],eax
  80734d:	e9 81 00 00 00       	jmp    8073d3 <hd_iterate+0x211>
        }else if(!chk_result(r[i]))//&&disk_existent(disk)
  807352:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807355:	48 98                	cdqe   
  807357:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  80735b:	89 c7                	mov    edi,eax
  80735d:	e8 7d fd ff ff       	call   8070df <chk_result>
  807362:	85 c0                	test   eax,eax
  807364:	75 6d                	jne    8073d3 <hd_iterate+0x211>
        {
            switch (i)
  807366:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  80736a:	74 3e                	je     8073aa <hd_iterate+0x1e8>
  80736c:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  807370:	7f 41                	jg     8073b3 <hd_iterate+0x1f1>
  807372:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  807376:	74 28                	je     8073a0 <hd_iterate+0x1de>
  807378:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  80737c:	7f 35                	jg     8073b3 <hd_iterate+0x1f1>
  80737e:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  807382:	74 08                	je     80738c <hd_iterate+0x1ca>
  807384:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  807388:	74 0c                	je     807396 <hd_iterate+0x1d4>
  80738a:	eb 27                	jmp    8073b3 <hd_iterate+0x1f1>
            {
            case 0:name="hd0";break;
  80738c:	48 c7 45 f8 34 2e 81 	mov    QWORD PTR [rbp-0x8],0x812e34
  807393:	00 
  807394:	eb 1d                	jmp    8073b3 <hd_iterate+0x1f1>
            case 1:name="hd1";break;
  807396:	48 c7 45 f8 38 2e 81 	mov    QWORD PTR [rbp-0x8],0x812e38
  80739d:	00 
  80739e:	eb 13                	jmp    8073b3 <hd_iterate+0x1f1>
            case 2:name="hd2";break;
  8073a0:	48 c7 45 f8 3c 2e 81 	mov    QWORD PTR [rbp-0x8],0x812e3c
  8073a7:	00 
  8073a8:	eb 09                	jmp    8073b3 <hd_iterate+0x1f1>
            case 3:name="hd3";break;
  8073aa:	48 c7 45 f8 40 2e 81 	mov    QWORD PTR [rbp-0x8],0x812e40
  8073b1:	00 
  8073b2:	90                   	nop
            }
            //有硬盘被卸载了
            int devi=sys_find_dev(name);
  8073b3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8073b7:	48 89 c7             	mov    rdi,rax
  8073ba:	e8 cd ba ff ff       	call   802e8c <sys_find_dev>
  8073bf:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            dispose_device(get_dev(devi));
  8073c2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8073c5:	89 c7                	mov    edi,eax
  8073c7:	e8 94 c1 ff ff       	call   803560 <get_dev>
  8073cc:	89 c7                	mov    edi,eax
  8073ce:	e8 e0 c0 ff ff       	call   8034b3 <dispose_device>
    for(int i=0;i<1;i++)
  8073d3:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8073d7:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8073db:	0f 8e 84 fe ff ff    	jle    807265 <hd_iterate+0xa3>
        }

    }
}
  8073e1:	c9                   	leave  
  8073e2:	c3                   	ret    

00000000008073e3 <async_check_disk>:

int async_check_disk(int disk)
{
  8073e3:	f3 0f 1e fa          	endbr64 
  8073e7:	55                   	push   rbp
  8073e8:	48 89 e5             	mov    rbp,rsp
  8073eb:	48 83 ec 20          	sub    rsp,0x20
  8073ef:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    unsigned short disknr=PORT_DISK_MAJOR;
  8073f2:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    unsigned short chkcmd=0xe0;
  8073f8:	66 c7 45 fc e0 00    	mov    WORD PTR [rbp-0x4],0xe0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  8073fe:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  807402:	74 06                	je     80740a <async_check_disk+0x27>
  807404:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  807408:	75 06                	jne    807410 <async_check_disk+0x2d>
        disknr=PORT_DISK_SLAVE;
  80740a:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_MAJOR_SLAVE||disk==DISK_SLAVE_SLAVE)
  807410:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  807414:	74 06                	je     80741c <async_check_disk+0x39>
  807416:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  80741a:	75 06                	jne    807422 <async_check_disk+0x3f>
        chkcmd=0xf0;
  80741c:	66 c7 45 fc f0 00    	mov    WORD PTR [rbp-0x4],0xf0
    outb(disknr+2,1);
  807422:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807426:	83 c0 02             	add    eax,0x2
  807429:	0f b7 c0             	movzx  eax,ax
  80742c:	be 01 00 00 00       	mov    esi,0x1
  807431:	89 c7                	mov    edi,eax
  807433:	e8 f8 d9 ff ff       	call   804e30 <outb>
    outb(disknr+3,0);
  807438:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80743c:	83 c0 03             	add    eax,0x3
  80743f:	0f b7 c0             	movzx  eax,ax
  807442:	be 00 00 00 00       	mov    esi,0x0
  807447:	89 c7                	mov    edi,eax
  807449:	e8 e2 d9 ff ff       	call   804e30 <outb>
    outb(disknr+4,0);
  80744e:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807452:	83 c0 04             	add    eax,0x4
  807455:	0f b7 c0             	movzx  eax,ax
  807458:	be 00 00 00 00       	mov    esi,0x0
  80745d:	89 c7                	mov    edi,eax
  80745f:	e8 cc d9 ff ff       	call   804e30 <outb>
    outb(disknr+5,0);
  807464:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807468:	83 c0 05             	add    eax,0x5
  80746b:	0f b7 c0             	movzx  eax,ax
  80746e:	be 00 00 00 00       	mov    esi,0x0
  807473:	89 c7                	mov    edi,eax
  807475:	e8 b6 d9 ff ff       	call   804e30 <outb>
    outb(disknr+6,chkcmd);//主硬盘
  80747a:	0f b7 45 fc          	movzx  eax,WORD PTR [rbp-0x4]
  80747e:	0f b6 d0             	movzx  edx,al
  807481:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807485:	83 c0 06             	add    eax,0x6
  807488:	0f b7 c0             	movzx  eax,ax
  80748b:	89 d6                	mov    esi,edx
  80748d:	89 c7                	mov    edi,eax
  80748f:	e8 9c d9 ff ff       	call   804e30 <outb>
    outb(disknr+7,DISK_CMD_CHECK);
  807494:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807498:	83 c0 07             	add    eax,0x7
  80749b:	0f b7 c0             	movzx  eax,ax
  80749e:	be 90 00 00 00       	mov    esi,0x90
  8074a3:	89 c7                	mov    edi,eax
  8074a5:	e8 86 d9 ff ff       	call   804e30 <outb>
    //     // {
    //     //     printf("DISK ERR\n");
    //     //     return -1;
    //     // }
    // }
    return 0;
  8074aa:	b8 00 00 00 00       	mov    eax,0x0
}
  8074af:	c9                   	leave  
  8074b0:	c3                   	ret    

00000000008074b1 <hd_do_req>:

//接口函数：负责接收VFS的请求然后执行
int hd_do_req(driver_args *args)
{
  8074b1:	f3 0f 1e fa          	endbr64 
  8074b5:	55                   	push   rbp
  8074b6:	48 89 e5             	mov    rbp,rsp
  8074b9:	48 83 ec 18          	sub    rsp,0x18
  8074bd:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int diski=0;
  8074c1:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;disks[diski]!=args->dev;diski++);
  8074c8:	eb 04                	jmp    8074ce <hd_do_req+0x1d>
  8074ca:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8074ce:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8074d1:	48 98                	cdqe   
  8074d3:	8b 14 85 e0 a4 42 00 	mov    edx,DWORD PTR [rax*4+0x42a4e0]
  8074da:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8074de:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  8074e4:	39 c2                	cmp    edx,eax
  8074e6:	75 e2                	jne    8074ca <hd_do_req+0x19>
    switch (args->cmd)
  8074e8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8074ec:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  8074f2:	83 f8 04             	cmp    eax,0x4
  8074f5:	74 72                	je     807569 <hd_do_req+0xb8>
  8074f7:	83 f8 04             	cmp    eax,0x4
  8074fa:	0f 8f 96 00 00 00    	jg     807596 <hd_do_req+0xe5>
  807500:	83 f8 02             	cmp    eax,0x2
  807503:	74 0a                	je     80750f <hd_do_req+0x5e>
  807505:	83 f8 03             	cmp    eax,0x3
  807508:	74 32                	je     80753c <hd_do_req+0x8b>
  80750a:	e9 87 00 00 00       	jmp    807596 <hd_do_req+0xe5>
    {
    case DRVF_READ:
        request(diski,DISKREQ_READ,args->lba,args->sec_c,args->dist_addr);
  80750f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807513:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  807516:	48 98                	cdqe   
  807518:	48 89 c6             	mov    rsi,rax
  80751b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80751f:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  807522:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807526:	8b 10                	mov    edx,DWORD PTR [rax]
  807528:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80752b:	49 89 f0             	mov    r8,rsi
  80752e:	be 00 00 00 00       	mov    esi,0x0
  807533:	89 c7                	mov    edi,eax
  807535:	e8 f1 f4 ff ff       	call   806a2b <request>
        break;
  80753a:	eb 61                	jmp    80759d <hd_do_req+0xec>
    case DRVF_WRITE:
        request(diski,DISKREQ_WRITE,args->lba,args->sec_c,args->src_addr);
  80753c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807540:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  807543:	48 98                	cdqe   
  807545:	48 89 c6             	mov    rsi,rax
  807548:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80754c:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  80754f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807553:	8b 10                	mov    edx,DWORD PTR [rax]
  807555:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807558:	49 89 f0             	mov    r8,rsi
  80755b:	be 01 00 00 00       	mov    esi,0x1
  807560:	89 c7                	mov    edi,eax
  807562:	e8 c4 f4 ff ff       	call   806a2b <request>
        break;
  807567:	eb 34                	jmp    80759d <hd_do_req+0xec>
    case DRVF_CHK:
        request(diski,DISKREQ_CHECK,args->lba,args->sec_c,args->dist_addr);
  807569:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80756d:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  807570:	48 98                	cdqe   
  807572:	48 89 c6             	mov    rsi,rax
  807575:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807579:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  80757c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807580:	8b 10                	mov    edx,DWORD PTR [rax]
  807582:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807585:	49 89 f0             	mov    r8,rsi
  807588:	be 02 00 00 00       	mov    esi,0x2
  80758d:	89 c7                	mov    edi,eax
  80758f:	e8 97 f4 ff ff       	call   806a2b <request>
        break;
  807594:	eb 07                	jmp    80759d <hd_do_req+0xec>
    default:return -1;
  807596:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80759b:	eb 1e                	jmp    8075bb <hd_do_req+0x10a>
    }
    args->stat=REQ_STAT_WORKING;
  80759d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8075a1:	c7 80 ac 00 00 00 02 	mov    DWORD PTR [rax+0xac],0x2
  8075a8:	00 00 00 
    running_devman_req=args;
  8075ab:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8075af:	48 89 05 12 2f c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22f12],rax        # 42a4c8 <running_devman_req>
    return 0;
  8075b6:	b8 00 00 00 00       	mov    eax,0x0
  8075bb:	c9                   	leave  
  8075bc:	c3                   	ret    
  8075bd:	0f 1f 00             	nop    DWORD PTR [rax]

00000000008075c0 <disk_int_handler>:
  8075c0:	e8 99 d8 ff ff       	call   804e5e <eoi>
  8075c5:	e8 72 f2 ff ff       	call   80683c <disk_int_handler_c>
  8075ca:	48 cf                	iretq  

00000000008075cc <read_disk_asm>:
  8075cc:	55                   	push   rbp
  8075cd:	89 e5                	mov    ebp,esp
  8075cf:	66 ba f7 01          	mov    dx,0x1f7
  8075d3:	31 c9                	xor    ecx,ecx
  8075d5:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  8075da:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  8075df:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  8075e4:	89 c6                	mov    esi,eax
  8075e6:	66 ba f2 01          	mov    dx,0x1f2
  8075ea:	88 c8                	mov    al,cl
  8075ec:	ee                   	out    dx,al
  8075ed:	66 ba f3 01          	mov    dx,0x1f3
  8075f1:	89 f0                	mov    eax,esi
  8075f3:	ee                   	out    dx,al
  8075f4:	66 ff c2             	inc    dx
  8075f7:	c1 e8 08             	shr    eax,0x8
  8075fa:	ee                   	out    dx,al
  8075fb:	66 ff c2             	inc    dx
  8075fe:	c1 e8 08             	shr    eax,0x8
  807601:	ee                   	out    dx,al
  807602:	66 ff c2             	inc    dx
  807605:	66 c1 e8 08          	shr    ax,0x8
  807609:	24 0f                	and    al,0xf
  80760b:	0c e0                	or     al,0xe0
  80760d:	ee                   	out    dx,al
  80760e:	66 ff c2             	inc    dx
  807611:	b0 20                	mov    al,0x20
  807613:	ee                   	out    dx,al

0000000000807614 <read_disk_asm.wait>:
  807614:	90                   	nop
  807615:	ec                   	in     al,dx
  807616:	24 88                	and    al,0x88
  807618:	3c 08                	cmp    al,0x8
  80761a:	75 f8                	jne    807614 <read_disk_asm.wait>
  80761c:	66 89 d7             	mov    di,dx
  80761f:	89 c8                	mov    eax,ecx
  807621:	66 b9 00 01          	mov    cx,0x100
  807625:	66 f7 e1             	mul    cx
  807628:	89 c1                	mov    ecx,eax
  80762a:	66 ba f0 01          	mov    dx,0x1f0

000000000080762e <read_disk_asm.read>:
  80762e:	66 ed                	in     ax,dx
  807630:	66 67 89 03          	mov    WORD PTR [ebx],ax
  807634:	83 c3 02             	add    ebx,0x2
  807637:	e2 f5                	loop   80762e <read_disk_asm.read>
  807639:	c9                   	leave  
  80763a:	b8 00 00 00 00       	mov    eax,0x0
  80763f:	c3                   	ret    

0000000000807640 <read_disk_asm.err_disk_reading>:
  807640:	66 ba f1 01          	mov    dx,0x1f1
  807644:	31 c0                	xor    eax,eax
  807646:	66 ed                	in     ax,dx
  807648:	89 ec                	mov    esp,ebp
  80764a:	5d                   	pop    rbp
  80764b:	c3                   	ret    

000000000080764c <write_disk_asm>:
  80764c:	55                   	push   rbp
  80764d:	89 e5                	mov    ebp,esp
  80764f:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  807654:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  807659:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  80765e:	50                   	push   rax
  80765f:	66 ba f2 01          	mov    dx,0x1f2
  807663:	88 c8                	mov    al,cl
  807665:	ee                   	out    dx,al
  807666:	58                   	pop    rax
  807667:	66 ba f3 01          	mov    dx,0x1f3
  80766b:	ee                   	out    dx,al
  80766c:	c1 e8 08             	shr    eax,0x8
  80766f:	66 ba f4 01          	mov    dx,0x1f4
  807673:	ee                   	out    dx,al
  807674:	c1 e8 08             	shr    eax,0x8
  807677:	66 ba f5 01          	mov    dx,0x1f5
  80767b:	ee                   	out    dx,al
  80767c:	c1 e8 08             	shr    eax,0x8
  80767f:	24 0f                	and    al,0xf
  807681:	0c e0                	or     al,0xe0
  807683:	66 ba f6 01          	mov    dx,0x1f6
  807687:	ee                   	out    dx,al
  807688:	66 ba f7 01          	mov    dx,0x1f7
  80768c:	b0 30                	mov    al,0x30
  80768e:	ee                   	out    dx,al

000000000080768f <write_disk_asm.not_ready2>:
  80768f:	90                   	nop
  807690:	ec                   	in     al,dx
  807691:	24 88                	and    al,0x88
  807693:	3c 08                	cmp    al,0x8
  807695:	75 f8                	jne    80768f <write_disk_asm.not_ready2>
  807697:	89 c8                	mov    eax,ecx
  807699:	66 b9 00 01          	mov    cx,0x100
  80769d:	66 f7 e1             	mul    cx
  8076a0:	89 c1                	mov    ecx,eax
  8076a2:	66 ba f0 01          	mov    dx,0x1f0

00000000008076a6 <write_disk_asm.go_on_write>:
  8076a6:	66 67 8b 03          	mov    ax,WORD PTR [ebx]
  8076aa:	66 ef                	out    dx,ax
  8076ac:	83 c3 02             	add    ebx,0x2
  8076af:	e2 f5                	loop   8076a6 <write_disk_asm.go_on_write>
  8076b1:	89 ec                	mov    esp,ebp
  8076b3:	5d                   	pop    rbp
  8076b4:	c3                   	ret    

00000000008076b5 <DISK1_FAT32_read_FAT_Entry>:
#include "mem.h"
#include "memory.h"
#include "proc.h"

unsigned int DISK1_FAT32_read_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry)
{
  8076b5:	f3 0f 1e fa          	endbr64 
  8076b9:	55                   	push   rbp
  8076ba:	48 89 e5             	mov    rbp,rsp
  8076bd:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  8076c4:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  8076cb:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
	unsigned int buf[128];
	memset(buf,0,512);
  8076d1:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  8076d8:	ba 00 02 00 00       	mov    edx,0x200
  8076dd:	be 00 00 00 00       	mov    esi,0x0
  8076e2:	48 89 c7             	mov    rdi,rax
  8076e5:	e8 66 2e 00 00       	call   80a550 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  8076ea:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  8076f1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8076f5:	89 c2                	mov    edx,eax
  8076f7:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  8076fd:	c1 e8 07             	shr    eax,0x7
  807700:	01 d0                	add    eax,edx
  807702:	89 c2                	mov    edx,eax
  807704:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80770b:	49 89 c0             	mov    r8,rax
  80770e:	b9 01 00 00 00       	mov    ecx,0x1
  807713:	be 00 00 00 00       	mov    esi,0x0
  807718:	bf 00 00 00 00       	mov    edi,0x0
  80771d:	e8 09 f3 ff ff       	call   806a2b <request>
  807722:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    chk_result(r);
  807725:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807728:	89 c7                	mov    edi,eax
  80772a:	e8 b0 f9 ff ff       	call   8070df <chk_result>
    printf("DISK1_FAT32_read_FAT_Entry fat_entry:%x,%#010x\n",fat_entry,buf[fat_entry & 0x7f]);
  80772f:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  807735:	83 e0 7f             	and    eax,0x7f
  807738:	89 c0                	mov    eax,eax
  80773a:	8b 94 85 f0 fd ff ff 	mov    edx,DWORD PTR [rbp+rax*4-0x210]
  807741:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  807747:	89 c6                	mov    esi,eax
  807749:	bf 58 2e 81 00       	mov    edi,0x812e58
  80774e:	b8 00 00 00 00       	mov    eax,0x0
  807753:	e8 7b 95 ff ff       	call   800cd3 <printf>
	return buf[fat_entry & 0x7f] & 0x0fffffff;
  807758:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80775e:	83 e0 7f             	and    eax,0x7f
  807761:	89 c0                	mov    eax,eax
  807763:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  80776a:	25 ff ff ff 0f       	and    eax,0xfffffff
}
  80776f:	c9                   	leave  
  807770:	c3                   	ret    

0000000000807771 <DISK1_FAT32_write_FAT_Entry>:


unsigned long DISK1_FAT32_write_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry,unsigned int value)
{
  807771:	f3 0f 1e fa          	endbr64 
  807775:	55                   	push   rbp
  807776:	48 89 e5             	mov    rbp,rsp
  807779:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  807780:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  807787:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
  80778d:	89 95 e0 fd ff ff    	mov    DWORD PTR [rbp-0x220],edx
	unsigned int buf[128];
	int i;

	memset(buf,0,512);
  807793:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80779a:	ba 00 02 00 00       	mov    edx,0x200
  80779f:	be 00 00 00 00       	mov    esi,0x0
  8077a4:	48 89 c7             	mov    rdi,rax
  8077a7:	e8 a4 2d 00 00       	call   80a550 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  8077ac:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  8077b3:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8077b7:	89 c2                	mov    edx,eax
  8077b9:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  8077bf:	c1 e8 07             	shr    eax,0x7
  8077c2:	01 d0                	add    eax,edx
  8077c4:	89 c2                	mov    edx,eax
  8077c6:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  8077cd:	49 89 c0             	mov    r8,rax
  8077d0:	b9 01 00 00 00       	mov    ecx,0x1
  8077d5:	be 00 00 00 00       	mov    esi,0x0
  8077da:	bf 00 00 00 00       	mov    edi,0x0
  8077df:	e8 47 f2 ff ff       	call   806a2b <request>
  8077e4:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    chk_result(r);
  8077e7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8077ea:	89 c7                	mov    edi,eax
  8077ec:	e8 ee f8 ff ff       	call   8070df <chk_result>
    buf[fat_entry & 0x7f] = (buf[fat_entry & 0x7f] & 0xf0000000) | (value & 0x0fffffff);
  8077f1:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  8077f7:	83 e0 7f             	and    eax,0x7f
  8077fa:	89 c0                	mov    eax,eax
  8077fc:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  807803:	25 00 00 00 f0       	and    eax,0xf0000000
  807808:	89 c6                	mov    esi,eax
  80780a:	8b 85 e0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x220]
  807810:	25 ff ff ff 0f       	and    eax,0xfffffff
  807815:	89 c1                	mov    ecx,eax
  807817:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80781d:	83 e0 7f             	and    eax,0x7f
  807820:	89 c2                	mov    edx,eax
  807822:	89 f0                	mov    eax,esi
  807824:	09 c8                	or     eax,ecx
  807826:	89 d2                	mov    edx,edx
  807828:	89 84 95 f0 fd ff ff 	mov    DWORD PTR [rbp+rdx*4-0x210],eax

	for(i = 0;i < fsbi->NumFATs;i++){
  80782f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  807836:	eb 61                	jmp    807899 <DISK1_FAT32_write_FAT_Entry+0x128>
        int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,fsbi->FAT1_firstsector + fsbi->sector_per_FAT * i + (fat_entry >> 7),1,(unsigned char *)buf);
  807838:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  80783f:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807843:	89 c1                	mov    ecx,eax
  807845:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  80784c:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  807850:	89 c2                	mov    edx,eax
  807852:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807855:	48 98                	cdqe   
  807857:	0f af c2             	imul   eax,edx
  80785a:	8d 14 01             	lea    edx,[rcx+rax*1]
  80785d:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  807863:	c1 e8 07             	shr    eax,0x7
  807866:	01 d0                	add    eax,edx
  807868:	89 c2                	mov    edx,eax
  80786a:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  807871:	49 89 c0             	mov    r8,rax
  807874:	b9 01 00 00 00       	mov    ecx,0x1
  807879:	be 01 00 00 00       	mov    esi,0x1
  80787e:	bf 00 00 00 00       	mov    edi,0x0
  807883:	e8 a3 f1 ff ff       	call   806a2b <request>
  807888:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        chk_result(r1);
  80788b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80788e:	89 c7                	mov    edi,eax
  807890:	e8 4a f8 ff ff       	call   8070df <chk_result>
	for(i = 0;i < fsbi->NumFATs;i++){
  807895:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807899:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80789c:	48 63 d0             	movsxd rdx,eax
  80789f:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  8078a6:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8078aa:	48 39 c2             	cmp    rdx,rax
  8078ad:	72 89                	jb     807838 <DISK1_FAT32_write_FAT_Entry+0xc7>
    }
	return 1;
  8078af:	b8 01 00 00 00       	mov    eax,0x1
}
  8078b4:	c9                   	leave  
  8078b5:	c3                   	ret    

00000000008078b6 <FAT32_open>:


long FAT32_open(struct index_node * inode,struct file * filp)
{
  8078b6:	f3 0f 1e fa          	endbr64 
  8078ba:	55                   	push   rbp
  8078bb:	48 89 e5             	mov    rbp,rsp
  8078be:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8078c2:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  8078c6:	b8 01 00 00 00       	mov    eax,0x1
}
  8078cb:	5d                   	pop    rbp
  8078cc:	c3                   	ret    

00000000008078cd <FAT32_close>:


long FAT32_close(struct index_node * inode,struct file * filp)
{
  8078cd:	f3 0f 1e fa          	endbr64 
  8078d1:	55                   	push   rbp
  8078d2:	48 89 e5             	mov    rbp,rsp
  8078d5:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8078d9:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  8078dd:	b8 01 00 00 00       	mov    eax,0x1
}
  8078e2:	5d                   	pop    rbp
  8078e3:	c3                   	ret    

00000000008078e4 <FAT32_read>:


long FAT32_read(struct file * filp,char * buf,unsigned long count,long * position)
{
  8078e4:	f3 0f 1e fa          	endbr64 
  8078e8:	55                   	push   rbp
  8078e9:	48 89 e5             	mov    rbp,rsp
  8078ec:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  8078f0:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  8078f4:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  8078f8:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
  8078fc:	48 89 4d 80          	mov    QWORD PTR [rbp-0x80],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  807900:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807904:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807908:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80790c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807910:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  807914:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807918:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80791c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807920:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807924:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807928:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

	unsigned long cluster = finode->first_cluster;
  80792c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807930:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807933:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long sector = 0;
  807937:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  80793e:	00 
	int i,length = 0;
  80793f:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
	long retval = 0;
  807946:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80794d:	00 
	int index = *position / fsbi->bytes_per_cluster;
  80794e:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807952:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807955:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  807959:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  80795d:	48 99                	cqo    
  80795f:	48 f7 fe             	idiv   rsi
  807962:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  807965:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807969:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80796c:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  807970:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  807974:	48 99                	cqo    
  807976:	48 f7 f9             	idiv   rcx
  807979:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  80797d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807981:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807985:	be 00 00 00 00       	mov    esi,0x0
  80798a:	48 89 c7             	mov    rdi,rax
  80798d:	b8 00 00 00 00       	mov    eax,0x0
  807992:	e8 54 97 ff ff       	call   8010eb <vmalloc>
  807997:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax

	if(!cluster)
  80799b:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8079a0:	75 0c                	jne    8079ae <FAT32_read+0xca>
		return -EFAULT;
  8079a2:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  8079a9:	e9 f0 01 00 00       	jmp    807b9e <FAT32_read+0x2ba>
	for(i = 0;i < index;i++)
  8079ae:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8079b5:	eb 1e                	jmp    8079d5 <FAT32_read+0xf1>
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  8079b7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8079bb:	89 c2                	mov    edx,eax
  8079bd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8079c1:	89 d6                	mov    esi,edx
  8079c3:	48 89 c7             	mov    rdi,rax
  8079c6:	e8 ea fc ff ff       	call   8076b5 <DISK1_FAT32_read_FAT_Entry>
  8079cb:	89 c0                	mov    eax,eax
  8079cd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	for(i = 0;i < index;i++)
  8079d1:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8079d5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8079d8:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  8079db:	7c da                	jl     8079b7 <FAT32_read+0xd3>

	if(*position + count > filp->dentry->dir_inode->file_size)
  8079dd:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8079e1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8079e4:	48 89 c2             	mov    rdx,rax
  8079e7:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8079eb:	48 01 c2             	add    rdx,rax
  8079ee:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8079f2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8079f6:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8079fa:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8079fd:	48 39 c2             	cmp    rdx,rax
  807a00:	76 2c                	jbe    807a2e <FAT32_read+0x14a>
		index = count = filp->dentry->dir_inode->file_size - *position;
  807a02:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807a06:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807a0a:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807a0e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  807a11:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807a15:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807a18:	48 89 c1             	mov    rcx,rax
  807a1b:	48 89 d0             	mov    rax,rdx
  807a1e:	48 29 c8             	sub    rax,rcx
  807a21:	48 89 45 88          	mov    QWORD PTR [rbp-0x78],rax
  807a25:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807a29:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
  807a2c:	eb 07                	jmp    807a35 <FAT32_read+0x151>
	else
		index = count;
  807a2e:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807a32:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax

//	printf("FAT32_read first_cluster:%d,size:%d,preempt_count:%d\n",finode->first_cluster,filp->dentry->dir_inode->file_size,current->preempt_count);

	do
	{
		memset(buffer,0,fsbi->bytes_per_cluster);
  807a35:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807a39:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807a3d:	89 c2                	mov    edx,eax
  807a3f:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807a43:	be 00 00 00 00       	mov    esi,0x0
  807a48:	48 89 c7             	mov    rdi,rax
  807a4b:	e8 00 2b 00 00       	call   80a550 <memset>
		sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  807a50:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807a54:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  807a58:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807a5c:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  807a60:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807a64:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807a68:	48 0f af c2          	imul   rax,rdx
  807a6c:	48 01 c8             	add    rax,rcx
  807a6f:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  807a73:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807a77:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807a7b:	89 c1                	mov    ecx,eax
  807a7d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807a81:	89 c2                	mov    edx,eax
  807a83:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807a87:	49 89 c0             	mov    r8,rax
  807a8a:	be 00 00 00 00       	mov    esi,0x0
  807a8f:	bf 00 00 00 00       	mov    edi,0x0
  807a94:	e8 92 ef ff ff       	call   806a2b <request>
  807a99:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
		if(!chk_result(r))
  807a9c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807a9f:	89 c7                	mov    edi,eax
  807aa1:	e8 39 f6 ff ff       	call   8070df <chk_result>
  807aa6:	85 c0                	test   eax,eax
  807aa8:	75 1c                	jne    807ac6 <FAT32_read+0x1e2>
		{
			printf("FAT32 FS(read) read disk ERROR!!!!!!!!!!\n");
  807aaa:	bf 88 2e 81 00       	mov    edi,0x812e88
  807aaf:	b8 00 00 00 00       	mov    eax,0x0
  807ab4:	e8 1a 92 ff ff       	call   800cd3 <printf>
			retval = -EIO;
  807ab9:	48 c7 45 e8 e3 ff ff 	mov    QWORD PTR [rbp-0x18],0xffffffffffffffe3
  807ac0:	ff 
			break;
  807ac1:	e9 ba 00 00 00       	jmp    807b80 <FAT32_read+0x29c>
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  807ac6:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  807ac9:	48 63 d0             	movsxd rdx,eax
  807acc:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807ad0:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807ad4:	48 2b 45 d8          	sub    rax,QWORD PTR [rbp-0x28]
  807ad8:	48 39 c2             	cmp    rdx,rax
  807adb:	48 0f 4e c2          	cmovle rax,rdx
  807adf:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax

		if((unsigned long)buf < MAX_TASKS)
  807ae2:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  807ae6:	48 83 f8 1f          	cmp    rax,0x1f
  807aea:	77 1f                	ja     807b0b <FAT32_read+0x227>
			memcpy(buffer + offset,buf,length);
  807aec:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  807aef:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  807af3:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807af7:	48 01 c1             	add    rcx,rax
  807afa:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  807afe:	48 89 c6             	mov    rsi,rax
  807b01:	48 89 cf             	mov    rdi,rcx
  807b04:	e8 98 29 00 00       	call   80a4a1 <memcpy>
  807b09:	eb 1d                	jmp    807b28 <FAT32_read+0x244>
		else
			memcpy(buffer + offset,buf,length);
  807b0b:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  807b0e:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  807b12:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807b16:	48 01 c1             	add    rcx,rax
  807b19:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  807b1d:	48 89 c6             	mov    rsi,rax
  807b20:	48 89 cf             	mov    rdi,rcx
  807b23:	e8 79 29 00 00       	call   80a4a1 <memcpy>

		index -= length;
  807b28:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  807b2b:	29 45 e4             	sub    DWORD PTR [rbp-0x1c],eax
		buf += length;
  807b2e:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  807b31:	48 98                	cdqe   
  807b33:	48 01 45 90          	add    QWORD PTR [rbp-0x70],rax
		offset -= offset;
  807b37:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  807b3e:	00 
		*position += length;
  807b3f:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807b43:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  807b46:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  807b49:	48 98                	cdqe   
  807b4b:	48 01 c2             	add    rdx,rax
  807b4e:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807b52:	48 89 10             	mov    QWORD PTR [rax],rdx
	}while(index && (cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster)));
  807b55:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  807b59:	74 25                	je     807b80 <FAT32_read+0x29c>
  807b5b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807b5f:	89 c2                	mov    edx,eax
  807b61:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807b65:	89 d6                	mov    esi,edx
  807b67:	48 89 c7             	mov    rdi,rax
  807b6a:	e8 46 fb ff ff       	call   8076b5 <DISK1_FAT32_read_FAT_Entry>
  807b6f:	89 c0                	mov    eax,eax
  807b71:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  807b75:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  807b7a:	0f 85 b5 fe ff ff    	jne    807a35 <FAT32_read+0x151>

	vmfree(buffer);
  807b80:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807b84:	48 89 c7             	mov    rdi,rax
  807b87:	e8 ee 95 ff ff       	call   80117a <vmfree>
	if(!index)
  807b8c:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  807b90:	75 08                	jne    807b9a <FAT32_read+0x2b6>
		retval = count;
  807b92:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807b96:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	return retval;
  807b9a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
}
  807b9e:	c9                   	leave  
  807b9f:	c3                   	ret    

0000000000807ba0 <FAT32_find_available_cluster>:


unsigned long FAT32_find_available_cluster(struct FAT32_sb_info * fsbi)
{
  807ba0:	f3 0f 1e fa          	endbr64 
  807ba4:	55                   	push   rbp
  807ba5:	48 89 e5             	mov    rbp,rsp
  807ba8:	48 81 ec 30 02 00 00 	sub    rsp,0x230
  807baf:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
	int i,j;
	int fat_entry;
	unsigned long sector_per_fat = fsbi->sector_per_FAT;
  807bb6:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  807bbd:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  807bc1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	unsigned int buf[128];

//	fsbi->fat_fsinfo->FSI_Free_Count & fsbi->fat_fsinfo->FSI_Nxt_Free not exactly,so unuse

	for(i = 0;i < sector_per_fat;i++)
  807bc5:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  807bcc:	e9 8b 00 00 00       	jmp    807c5c <FAT32_find_available_cluster+0xbc>
	{
		memset(buf,0,512);
  807bd1:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  807bd8:	ba 00 02 00 00       	mov    edx,0x200
  807bdd:	be 00 00 00 00       	mov    esi,0x0
  807be2:	48 89 c7             	mov    rdi,rax
  807be5:	e8 66 29 00 00       	call   80a550 <memset>
		int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + i,1,(unsigned char *)buf);
  807bea:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  807bf1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807bf5:	89 c2                	mov    edx,eax
  807bf7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807bfa:	01 d0                	add    eax,edx
  807bfc:	89 c2                	mov    edx,eax
  807bfe:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  807c05:	49 89 c0             	mov    r8,rax
  807c08:	b9 01 00 00 00       	mov    ecx,0x1
  807c0d:	be 00 00 00 00       	mov    esi,0x0
  807c12:	bf 00 00 00 00       	mov    edi,0x0
  807c17:	e8 0f ee ff ff       	call   806a2b <request>
  807c1c:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

		for(j = 0;j < 128;j++)
  807c1f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807c26:	eb 2a                	jmp    807c52 <FAT32_find_available_cluster+0xb2>
		{
			if((buf[j] & 0x0fffffff) == 0)
  807c28:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807c2b:	48 98                	cdqe   
  807c2d:	8b 84 85 e0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x220]
  807c34:	25 ff ff ff 0f       	and    eax,0xfffffff
  807c39:	85 c0                	test   eax,eax
  807c3b:	75 11                	jne    807c4e <FAT32_find_available_cluster+0xae>
				return (i << 7) + j;
  807c3d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807c40:	c1 e0 07             	shl    eax,0x7
  807c43:	89 c2                	mov    edx,eax
  807c45:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807c48:	01 d0                	add    eax,edx
  807c4a:	48 98                	cdqe   
  807c4c:	eb 22                	jmp    807c70 <FAT32_find_available_cluster+0xd0>
		for(j = 0;j < 128;j++)
  807c4e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807c52:	83 7d f8 7f          	cmp    DWORD PTR [rbp-0x8],0x7f
  807c56:	7e d0                	jle    807c28 <FAT32_find_available_cluster+0x88>
	for(i = 0;i < sector_per_fat;i++)
  807c58:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807c5c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807c5f:	48 98                	cdqe   
  807c61:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  807c65:	0f 87 66 ff ff ff    	ja     807bd1 <FAT32_find_available_cluster+0x31>
		}
	}
	return 0;
  807c6b:	b8 00 00 00 00       	mov    eax,0x0
}
  807c70:	c9                   	leave  
  807c71:	c3                   	ret    

0000000000807c72 <FAT32_write>:


long FAT32_write(struct file * filp,char * buf,unsigned long count,long * position)
{
  807c72:	f3 0f 1e fa          	endbr64 
  807c76:	55                   	push   rbp
  807c77:	48 89 e5             	mov    rbp,rsp
  807c7a:	48 81 ec 90 00 00 00 	sub    rsp,0x90
  807c81:	48 89 7d 88          	mov    QWORD PTR [rbp-0x78],rdi
  807c85:	48 89 75 80          	mov    QWORD PTR [rbp-0x80],rsi
  807c89:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  807c90:	48 89 8d 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  807c97:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807c9b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807c9f:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807ca3:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807ca7:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  807cab:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807caf:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807cb3:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807cb7:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807cbb:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807cbf:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned long cluster = finode->first_cluster;
  807cc3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807cc7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807cca:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long next_cluster = 0;
  807cce:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  807cd5:	00 
	unsigned long sector = 0;
  807cd6:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  807cdd:	00 
	int i,length = 0;
  807cde:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
	long retval = 0;
  807ce5:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  807cec:	00 
	long flags = 0;
  807ced:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  807cf4:	00 
	int index = *position / fsbi->bytes_per_cluster;
  807cf5:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  807cfc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807cff:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  807d03:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  807d07:	48 99                	cqo    
  807d09:	48 f7 fe             	idiv   rsi
  807d0c:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  807d0f:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  807d16:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807d19:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  807d1d:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  807d21:	48 99                	cqo    
  807d23:	48 f7 f9             	idiv   rcx
  807d26:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  807d2a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807d2e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807d32:	be 00 00 00 00       	mov    esi,0x0
  807d37:	48 89 c7             	mov    rdi,rax
  807d3a:	b8 00 00 00 00       	mov    eax,0x0
  807d3f:	e8 a7 93 ff ff       	call   8010eb <vmalloc>
  807d44:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax

	if(!cluster)
  807d48:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  807d4d:	75 1a                	jne    807d69 <FAT32_write+0xf7>
	{
		cluster = FAT32_find_available_cluster(fsbi);
  807d4f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807d53:	48 89 c7             	mov    rdi,rax
  807d56:	e8 45 fe ff ff       	call   807ba0 <FAT32_find_available_cluster>
  807d5b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		flags = 1;
  807d5f:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  807d66:	00 
  807d67:	eb 2f                	jmp    807d98 <FAT32_write+0x126>
	}
	else
		for(i = 0;i < index;i++)
  807d69:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  807d70:	eb 1e                	jmp    807d90 <FAT32_write+0x11e>
			cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  807d72:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807d76:	89 c2                	mov    edx,eax
  807d78:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807d7c:	89 d6                	mov    esi,edx
  807d7e:	48 89 c7             	mov    rdi,rax
  807d81:	e8 2f f9 ff ff       	call   8076b5 <DISK1_FAT32_read_FAT_Entry>
  807d86:	89 c0                	mov    eax,eax
  807d88:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		for(i = 0;i < index;i++)
  807d8c:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  807d90:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807d93:	3b 45 d4             	cmp    eax,DWORD PTR [rbp-0x2c]
  807d96:	7c da                	jl     807d72 <FAT32_write+0x100>

	if(!cluster)
  807d98:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  807d9d:	75 18                	jne    807db7 <FAT32_write+0x145>
	{
		vmfree(buffer);
  807d9f:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  807da3:	48 89 c7             	mov    rdi,rax
  807da6:	e8 cf 93 ff ff       	call   80117a <vmfree>
		return -ENOSPC;
  807dab:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  807db2:	e9 13 03 00 00       	jmp    8080ca <FAT32_write+0x458>
	}

	if(flags)
  807db7:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  807dbc:	74 4d                	je     807e0b <FAT32_write+0x199>
	{
		finode->first_cluster = cluster;
  807dbe:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807dc2:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  807dc6:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  807dc9:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807dcd:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807dd1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807dd5:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807dd9:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  807ddd:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  807de1:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807de5:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807de9:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807ded:	48 89 c7             	mov    rdi,rax
  807df0:	ff d2                	call   rdx
		DISK1_FAT32_write_FAT_Entry(fsbi,cluster,0x0ffffff8);
  807df2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807df6:	89 c1                	mov    ecx,eax
  807df8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807dfc:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  807e01:	89 ce                	mov    esi,ecx
  807e03:	48 89 c7             	mov    rdi,rax
  807e06:	e8 66 f9 ff ff       	call   807771 <DISK1_FAT32_write_FAT_Entry>
	}

	index = count;
  807e0b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  807e12:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax

	do
	{
		if(!flags)
  807e15:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  807e1a:	0f 85 91 00 00 00    	jne    807eb1 <FAT32_write+0x23f>
		{
			memset(buffer,0,fsbi->bytes_per_cluster);
  807e20:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807e24:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807e28:	89 c2                	mov    edx,eax
  807e2a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  807e2e:	be 00 00 00 00       	mov    esi,0x0
  807e33:	48 89 c7             	mov    rdi,rax
  807e36:	e8 15 27 00 00       	call   80a550 <memset>
			sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  807e3b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807e3f:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  807e43:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807e47:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  807e4b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807e4f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807e53:	48 0f af c2          	imul   rax,rdx
  807e57:	48 01 c8             	add    rax,rcx
  807e5a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  807e5e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807e62:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807e66:	89 c1                	mov    ecx,eax
  807e68:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807e6c:	89 c2                	mov    edx,eax
  807e6e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  807e72:	49 89 c0             	mov    r8,rax
  807e75:	be 00 00 00 00       	mov    esi,0x0
  807e7a:	bf 00 00 00 00       	mov    edi,0x0
  807e7f:	e8 a7 eb ff ff       	call   806a2b <request>
  807e84:	89 45 9c             	mov    DWORD PTR [rbp-0x64],eax

			if(!chk_result(r))
  807e87:	8b 45 9c             	mov    eax,DWORD PTR [rbp-0x64]
  807e8a:	89 c7                	mov    edi,eax
  807e8c:	e8 4e f2 ff ff       	call   8070df <chk_result>
  807e91:	85 c0                	test   eax,eax
  807e93:	75 1c                	jne    807eb1 <FAT32_write+0x23f>
			{
				printf("FAT32 FS(write) read disk ERROR!!!!!!!!!!\n");
  807e95:	bf b8 2e 81 00       	mov    edi,0x812eb8
  807e9a:	b8 00 00 00 00       	mov    eax,0x0
  807e9f:	e8 2f 8e ff ff       	call   800cd3 <printf>
				retval = -EIO;
  807ea4:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  807eab:	ff 
				break;
  807eac:	e9 95 01 00 00       	jmp    808046 <FAT32_write+0x3d4>
			}
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  807eb1:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  807eb4:	48 63 d0             	movsxd rdx,eax
  807eb7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807ebb:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807ebf:	48 2b 45 c8          	sub    rax,QWORD PTR [rbp-0x38]
  807ec3:	48 39 c2             	cmp    rdx,rax
  807ec6:	48 0f 4e c2          	cmovle rax,rdx
  807eca:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax

		if((unsigned long)buf < MAX_TASKS)
  807ecd:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807ed1:	48 83 f8 1f          	cmp    rax,0x1f
  807ed5:	77 1f                	ja     807ef6 <FAT32_write+0x284>
			memcpy(buf,buffer + offset,length);
  807ed7:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  807eda:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  807ede:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  807ee2:	48 01 c1             	add    rcx,rax
  807ee5:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807ee9:	48 89 ce             	mov    rsi,rcx
  807eec:	48 89 c7             	mov    rdi,rax
  807eef:	e8 ad 25 00 00       	call   80a4a1 <memcpy>
  807ef4:	eb 1d                	jmp    807f13 <FAT32_write+0x2a1>
		else
			memcpy(buf,buffer + offset,length);
  807ef6:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  807ef9:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  807efd:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  807f01:	48 01 c1             	add    rcx,rax
  807f04:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807f08:	48 89 ce             	mov    rsi,rcx
  807f0b:	48 89 c7             	mov    rdi,rax
  807f0e:	e8 8e 25 00 00       	call   80a4a1 <memcpy>

		int r=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  807f13:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807f17:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807f1b:	89 c1                	mov    ecx,eax
  807f1d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807f21:	89 c2                	mov    edx,eax
  807f23:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  807f27:	49 89 c0             	mov    r8,rax
  807f2a:	be 01 00 00 00       	mov    esi,0x1
  807f2f:	bf 00 00 00 00       	mov    edi,0x0
  807f34:	e8 f2 ea ff ff       	call   806a2b <request>
  807f39:	89 45 98             	mov    DWORD PTR [rbp-0x68],eax
        if(!chk_result(r))
  807f3c:	8b 45 98             	mov    eax,DWORD PTR [rbp-0x68]
  807f3f:	89 c7                	mov    edi,eax
  807f41:	e8 99 f1 ff ff       	call   8070df <chk_result>
  807f46:	85 c0                	test   eax,eax
  807f48:	75 1c                	jne    807f66 <FAT32_write+0x2f4>
		{
			printf("FAT32 FS(write) write disk ERROR!!!!!!!!!!\n");
  807f4a:	bf e8 2e 81 00       	mov    edi,0x812ee8
  807f4f:	b8 00 00 00 00       	mov    eax,0x0
  807f54:	e8 7a 8d ff ff       	call   800cd3 <printf>
			retval = -EIO;
  807f59:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  807f60:	ff 
			break;
  807f61:	e9 e0 00 00 00       	jmp    808046 <FAT32_write+0x3d4>
		}

		index -= length;
  807f66:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807f69:	29 45 d4             	sub    DWORD PTR [rbp-0x2c],eax
		buf += length;
  807f6c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807f6f:	48 98                	cdqe   
  807f71:	48 01 45 80          	add    QWORD PTR [rbp-0x80],rax
		offset -= offset;
  807f75:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  807f7c:	00 
		*position += length;
  807f7d:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  807f84:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  807f87:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807f8a:	48 98                	cdqe   
  807f8c:	48 01 c2             	add    rdx,rax
  807f8f:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  807f96:	48 89 10             	mov    QWORD PTR [rax],rdx

		if(index)
  807f99:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  807f9d:	0f 84 a2 00 00 00    	je     808045 <FAT32_write+0x3d3>
			next_cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  807fa3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807fa7:	89 c2                	mov    edx,eax
  807fa9:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807fad:	89 d6                	mov    esi,edx
  807faf:	48 89 c7             	mov    rdi,rax
  807fb2:	e8 fe f6 ff ff       	call   8076b5 <DISK1_FAT32_read_FAT_Entry>
  807fb7:	89 c0                	mov    eax,eax
  807fb9:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
		else
			break;

		if(next_cluster >= 0x0ffffff8)
  807fbd:	48 81 7d b0 f7 ff ff 	cmp    QWORD PTR [rbp-0x50],0xffffff7
  807fc4:	0f 
  807fc5:	76 72                	jbe    808039 <FAT32_write+0x3c7>
		{
			next_cluster = FAT32_find_available_cluster(fsbi);
  807fc7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807fcb:	48 89 c7             	mov    rdi,rax
  807fce:	e8 cd fb ff ff       	call   807ba0 <FAT32_find_available_cluster>
  807fd3:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
			if(!next_cluster)
  807fd7:	48 83 7d b0 00       	cmp    QWORD PTR [rbp-0x50],0x0
  807fdc:	75 18                	jne    807ff6 <FAT32_write+0x384>
			{
				vmfree(buffer);
  807fde:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  807fe2:	48 89 c7             	mov    rdi,rax
  807fe5:	e8 90 91 ff ff       	call   80117a <vmfree>
				return -ENOSPC;
  807fea:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  807ff1:	e9 d4 00 00 00       	jmp    8080ca <FAT32_write+0x458>
			}			
				
			DISK1_FAT32_write_FAT_Entry(fsbi,cluster,next_cluster);
  807ff6:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807ffa:	89 c2                	mov    edx,eax
  807ffc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808000:	89 c1                	mov    ecx,eax
  808002:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808006:	89 ce                	mov    esi,ecx
  808008:	48 89 c7             	mov    rdi,rax
  80800b:	e8 61 f7 ff ff       	call   807771 <DISK1_FAT32_write_FAT_Entry>
			DISK1_FAT32_write_FAT_Entry(fsbi,next_cluster,0x0ffffff8);
  808010:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808014:	89 c1                	mov    ecx,eax
  808016:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80801a:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  80801f:	89 ce                	mov    esi,ecx
  808021:	48 89 c7             	mov    rdi,rax
  808024:	e8 48 f7 ff ff       	call   807771 <DISK1_FAT32_write_FAT_Entry>
			cluster = next_cluster;
  808029:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80802d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			flags = 1;
  808031:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  808038:	00 
		}

	}while(index);
  808039:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  80803d:	0f 85 d2 fd ff ff    	jne    807e15 <FAT32_write+0x1a3>
  808043:	eb 01                	jmp    808046 <FAT32_write+0x3d4>
			break;
  808045:	90                   	nop

	if(*position > filp->dentry->dir_inode->file_size)
  808046:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80804d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808050:	48 89 c2             	mov    rdx,rax
  808053:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808057:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80805b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80805f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808062:	48 39 c2             	cmp    rdx,rax
  808065:	76 42                	jbe    8080a9 <FAT32_write+0x437>
	{
		filp->dentry->dir_inode->file_size = *position;
  808067:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80806e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  808071:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808075:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808079:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80807d:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  808080:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808084:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808088:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80808c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808090:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  808094:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  808098:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80809c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8080a0:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8080a4:	48 89 c7             	mov    rdi,rax
  8080a7:	ff d2                	call   rdx
	}

	vmfree(buffer);
  8080a9:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8080ad:	48 89 c7             	mov    rdi,rax
  8080b0:	e8 c5 90 ff ff       	call   80117a <vmfree>
	if(!index)
  8080b5:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  8080b9:	75 0b                	jne    8080c6 <FAT32_write+0x454>
		retval = count;
  8080bb:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8080c2:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	return retval;
  8080c6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  8080ca:	c9                   	leave  
  8080cb:	c3                   	ret    

00000000008080cc <FAT32_lseek>:


long FAT32_lseek(struct file * filp,long offset,long origin)
{
  8080cc:	f3 0f 1e fa          	endbr64 
  8080d0:	55                   	push   rbp
  8080d1:	48 89 e5             	mov    rbp,rsp
  8080d4:	48 83 ec 30          	sub    rsp,0x30
  8080d8:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8080dc:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8080e0:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	struct index_node *inode = filp->dentry->dir_inode;
  8080e4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8080e8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8080ec:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8080f0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	long pos = 0;
  8080f4:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8080fb:	00 

	switch(origin)
  8080fc:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  808101:	74 21                	je     808124 <FAT32_lseek+0x58>
  808103:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  808108:	7f 4a                	jg     808154 <FAT32_lseek+0x88>
  80810a:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80810f:	74 09                	je     80811a <FAT32_lseek+0x4e>
  808111:	48 83 7d d8 01       	cmp    QWORD PTR [rbp-0x28],0x1
  808116:	74 20                	je     808138 <FAT32_lseek+0x6c>
  808118:	eb 3a                	jmp    808154 <FAT32_lseek+0x88>
	{
		case SEEK_SET:
				pos = offset;
  80811a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80811e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  808122:	eb 39                	jmp    80815d <FAT32_lseek+0x91>

		case SEEK_CUR:
				pos =  filp->position + offset;
  808124:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808128:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80812b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80812f:	48 01 d0             	add    rax,rdx
  808132:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  808136:	eb 25                	jmp    80815d <FAT32_lseek+0x91>

		case SEEK_END:
				pos = filp->dentry->dir_inode->file_size + offset;
  808138:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80813c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808140:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808144:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  808147:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80814b:	48 01 d0             	add    rax,rdx
  80814e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  808152:	eb 09                	jmp    80815d <FAT32_lseek+0x91>

		default:
			return -EINVAL;
  808154:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  80815b:	eb 50                	jmp    8081ad <FAT32_lseek+0xe1>
			break;
	}

	if(pos < 0 || pos > filp->dentry->dir_inode->file_size)
  80815d:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  808162:	78 18                	js     80817c <FAT32_lseek+0xb0>
  808164:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808168:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80816c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808170:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  808173:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808177:	48 39 c2             	cmp    rdx,rax
  80817a:	73 09                	jae    808185 <FAT32_lseek+0xb9>
		return -EOVERFLOW;
  80817c:	48 c7 c0 bf ff ff ff 	mov    rax,0xffffffffffffffbf
  808183:	eb 28                	jmp    8081ad <FAT32_lseek+0xe1>

	filp->position = pos;
  808185:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808189:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80818d:	48 89 10             	mov    QWORD PTR [rax],rdx
	printf("FAT32 FS(lseek) alert position:%d\n",filp->position);
  808190:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808194:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808197:	48 89 c6             	mov    rsi,rax
  80819a:	bf 18 2f 81 00       	mov    edi,0x812f18
  80819f:	b8 00 00 00 00       	mov    eax,0x0
  8081a4:	e8 2a 8b ff ff       	call   800cd3 <printf>

	return pos;
  8081a9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  8081ad:	c9                   	leave  
  8081ae:	c3                   	ret    

00000000008081af <FAT32_ioctl>:


long FAT32_ioctl(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg)
{}
  8081af:	f3 0f 1e fa          	endbr64 
  8081b3:	55                   	push   rbp
  8081b4:	48 89 e5             	mov    rbp,rsp
  8081b7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8081bb:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8081bf:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  8081c3:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  8081c7:	90                   	nop
  8081c8:	5d                   	pop    rbp
  8081c9:	c3                   	ret    

00000000008081ca <FAT32_readdir>:

long FAT32_readdir(struct file * filp,void * dirent,filldir_t filler)
{
  8081ca:	f3 0f 1e fa          	endbr64 
  8081ce:	55                   	push   rbp
  8081cf:	48 89 e5             	mov    rbp,rsp
  8081d2:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  8081d6:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  8081da:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  8081de:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  8081e2:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8081e6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8081ea:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8081ee:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8081f2:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  8081f6:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8081fa:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8081fe:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808202:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808206:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80820a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned int cluster = 0;
  80820e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  808215:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  80821c:	00 
	unsigned char * buf =NULL; 
  80821d:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
  808224:	00 
	char *name = NULL;
  808225:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80822c:	00 
	int namelen = 0;
  80822d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
	int i = 0,j = 0,x = 0,y = 0;
  808234:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  80823b:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
  808242:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  808249:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  808250:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  808257:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  808258:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  80825f:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  808260:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808264:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808268:	be 00 00 00 00       	mov    esi,0x0
  80826d:	48 89 c7             	mov    rdi,rax
  808270:	b8 00 00 00 00       	mov    eax,0x0
  808275:	e8 71 8e ff ff       	call   8010eb <vmalloc>
  80827a:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax

	cluster = finode->first_cluster;
  80827e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808282:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808285:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

	j = filp->position/fsbi->bytes_per_cluster;
  808288:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80828c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80828f:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  808293:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  808297:	48 99                	cqo    
  808299:	48 f7 fe             	idiv   rsi
  80829c:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	
	for(i = 0;i<j;i++)
  80829f:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  8082a6:	eb 3a                	jmp    8082e2 <FAT32_readdir+0x118>
	{
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  8082a8:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8082ab:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8082af:	89 d6                	mov    esi,edx
  8082b1:	48 89 c7             	mov    rdi,rax
  8082b4:	e8 fc f3 ff ff       	call   8076b5 <DISK1_FAT32_read_FAT_Entry>
  8082b9:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
		if(cluster > 0x0ffffff7)
  8082bc:	81 7d fc f7 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff7
  8082c3:	76 19                	jbe    8082de <FAT32_readdir+0x114>
		{
			printf("FAT32 FS(readdir) cluster didn`t exist\n");
  8082c5:	bf 40 2f 81 00       	mov    edi,0x812f40
  8082ca:	b8 00 00 00 00       	mov    eax,0x0
  8082cf:	e8 ff 89 ff ff       	call   800cd3 <printf>
			return NULL;
  8082d4:	b8 00 00 00 00       	mov    eax,0x0
  8082d9:	e9 86 05 00 00       	jmp    808864 <FAT32_readdir+0x69a>
	for(i = 0;i<j;i++)
  8082de:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  8082e2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8082e5:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  8082e8:	7c be                	jl     8082a8 <FAT32_readdir+0xde>
		}
	}

next_cluster:
  8082ea:	90                   	nop
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  8082eb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8082ef:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  8082f3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8082f6:	83 e8 02             	sub    eax,0x2
  8082f9:	89 c1                	mov    ecx,eax
  8082fb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8082ff:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808303:	48 0f af c1          	imul   rax,rcx
  808307:	48 01 d0             	add    rax,rdx
  80830a:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80830e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808312:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808316:	89 c1                	mov    ecx,eax
  808318:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80831c:	89 c2                	mov    edx,eax
  80831e:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808322:	49 89 c0             	mov    r8,rax
  808325:	be 00 00 00 00       	mov    esi,0x0
  80832a:	bf 00 00 00 00       	mov    edi,0x0
  80832f:	e8 f7 e6 ff ff       	call   806a2b <request>
  808334:	89 45 a4             	mov    DWORD PTR [rbp-0x5c],eax
    if(!chk_result(r))
  808337:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  80833a:	89 c7                	mov    edi,eax
  80833c:	e8 9e ed ff ff       	call   8070df <chk_result>
  808341:	85 c0                	test   eax,eax
  808343:	75 25                	jne    80836a <FAT32_readdir+0x1a0>
	{
		printf("FAT32 FS(readdir) read disk ERROR!!!!!!!!!!\n");
  808345:	bf 68 2f 81 00       	mov    edi,0x812f68
  80834a:	b8 00 00 00 00       	mov    eax,0x0
  80834f:	e8 7f 89 ff ff       	call   800cd3 <printf>
		vmfree(buf);
  808354:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808358:	48 89 c7             	mov    rdi,rax
  80835b:	e8 1a 8e ff ff       	call   80117a <vmfree>
		return NULL;
  808360:	b8 00 00 00 00       	mov    eax,0x0
  808365:	e9 fa 04 00 00       	jmp    808864 <FAT32_readdir+0x69a>
	}

	tmpdentry = (struct FAT32_Directory *)(buf + filp->position%fsbi->bytes_per_cluster);
  80836a:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80836e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808371:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  808375:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  808379:	48 99                	cqo    
  80837b:	48 f7 f9             	idiv   rcx
  80837e:	48 89 d0             	mov    rax,rdx
  808381:	48 89 c2             	mov    rdx,rax
  808384:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808388:	48 01 d0             	add    rax,rdx
  80838b:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  80838f:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808393:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808396:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80839a:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  80839e:	48 99                	cqo    
  8083a0:	48 f7 f9             	idiv   rcx
  8083a3:	48 89 d0             	mov    rax,rdx
  8083a6:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  8083a9:	e9 2f 04 00 00       	jmp    8087dd <FAT32_readdir+0x613>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  8083ae:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8083b2:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  8083b6:	3c 0f                	cmp    al,0xf
  8083b8:	0f 84 00 04 00 00    	je     8087be <FAT32_readdir+0x5f4>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  8083be:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8083c2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8083c5:	3c e5                	cmp    al,0xe5
  8083c7:	0f 84 f4 03 00 00    	je     8087c1 <FAT32_readdir+0x5f7>
  8083cd:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8083d1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8083d4:	84 c0                	test   al,al
  8083d6:	0f 84 e5 03 00 00    	je     8087c1 <FAT32_readdir+0x5f7>
  8083dc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8083e0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8083e3:	3c 05                	cmp    al,0x5
  8083e5:	0f 84 d6 03 00 00    	je     8087c1 <FAT32_readdir+0x5f7>
			continue;

		namelen = 0;
  8083eb:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  8083f2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8083f6:	48 83 e8 20          	sub    rax,0x20
  8083fa:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

		if(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  8083fe:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808402:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  808406:	3c 0f                	cmp    al,0xf
  808408:	0f 85 2a 02 00 00    	jne    808638 <FAT32_readdir+0x46e>
  80840e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808412:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808415:	3c e5                	cmp    al,0xe5
  808417:	0f 84 1b 02 00 00    	je     808638 <FAT32_readdir+0x46e>
  80841d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808421:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808424:	84 c0                	test   al,al
  808426:	0f 84 0c 02 00 00    	je     808638 <FAT32_readdir+0x46e>
  80842c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808430:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808433:	3c 05                	cmp    al,0x5
  808435:	0f 84 fd 01 00 00    	je     808638 <FAT32_readdir+0x46e>
		{
			j = 0;
  80843b:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
			//long file/dir name read
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  808442:	eb 1a                	jmp    80845e <FAT32_readdir+0x294>
			{
				j++;
  808444:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
				if(tmpldentry->LDIR_Ord & 0x40)
  808448:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80844c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80844f:	0f b6 c0             	movzx  eax,al
  808452:	83 e0 40             	and    eax,0x40
  808455:	85 c0                	test   eax,eax
  808457:	75 34                	jne    80848d <FAT32_readdir+0x2c3>
					break;
				tmpldentry --;
  808459:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  80845e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808462:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  808466:	3c 0f                	cmp    al,0xf
  808468:	75 24                	jne    80848e <FAT32_readdir+0x2c4>
  80846a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80846e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808471:	3c e5                	cmp    al,0xe5
  808473:	74 19                	je     80848e <FAT32_readdir+0x2c4>
  808475:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808479:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80847c:	84 c0                	test   al,al
  80847e:	74 0e                	je     80848e <FAT32_readdir+0x2c4>
  808480:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808484:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808487:	3c 05                	cmp    al,0x5
  808489:	75 b9                	jne    808444 <FAT32_readdir+0x27a>
  80848b:	eb 01                	jmp    80848e <FAT32_readdir+0x2c4>
					break;
  80848d:	90                   	nop
			}

			name = vmalloc(j*13+1,0);
  80848e:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  808491:	89 d0                	mov    eax,edx
  808493:	01 c0                	add    eax,eax
  808495:	01 d0                	add    eax,edx
  808497:	c1 e0 02             	shl    eax,0x2
  80849a:	01 d0                	add    eax,edx
  80849c:	83 c0 01             	add    eax,0x1
  80849f:	be 00 00 00 00       	mov    esi,0x0
  8084a4:	89 c7                	mov    edi,eax
  8084a6:	b8 00 00 00 00       	mov    eax,0x0
  8084ab:	e8 3b 8c ff ff       	call   8010eb <vmalloc>
  8084b0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
			memset(name,0,j*13+1);
  8084b4:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  8084b7:	89 d0                	mov    eax,edx
  8084b9:	01 c0                	add    eax,eax
  8084bb:	01 d0                	add    eax,edx
  8084bd:	c1 e0 02             	shl    eax,0x2
  8084c0:	01 d0                	add    eax,edx
  8084c2:	83 c0 01             	add    eax,0x1
  8084c5:	89 c2                	mov    edx,eax
  8084c7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8084cb:	be 00 00 00 00       	mov    esi,0x0
  8084d0:	48 89 c7             	mov    rdi,rax
  8084d3:	e8 78 20 00 00       	call   80a550 <memset>
			tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  8084d8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8084dc:	48 83 e8 20          	sub    rax,0x20
  8084e0:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

			for(x = 0;x<j;x++,tmpldentry --)
  8084e4:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  8084eb:	e9 37 01 00 00       	jmp    808627 <FAT32_readdir+0x45d>
			{
				for(y = 0;y<5;y++)
  8084f0:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  8084f7:	eb 53                	jmp    80854c <FAT32_readdir+0x382>
					if(tmpldentry->LDIR_Name1[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  8084f9:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8084fd:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  808500:	48 63 d2             	movsxd rdx,edx
  808503:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  808508:	66 83 f8 ff          	cmp    ax,0xffff
  80850c:	74 3a                	je     808548 <FAT32_readdir+0x37e>
  80850e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808512:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  808515:	48 63 d2             	movsxd rdx,edx
  808518:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80851d:	66 85 c0             	test   ax,ax
  808520:	74 26                	je     808548 <FAT32_readdir+0x37e>
						name[namelen++] = (char)tmpldentry->LDIR_Name1[y];
  808522:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808526:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  808529:	48 63 d2             	movsxd rdx,edx
  80852c:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  808531:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808534:	8d 50 01             	lea    edx,[rax+0x1]
  808537:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80853a:	48 63 d0             	movsxd rdx,eax
  80853d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808541:	48 01 d0             	add    rax,rdx
  808544:	89 ca                	mov    edx,ecx
  808546:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<5;y++)
  808548:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  80854c:	83 7d dc 04          	cmp    DWORD PTR [rbp-0x24],0x4
  808550:	7e a7                	jle    8084f9 <FAT32_readdir+0x32f>

				for(y = 0;y<6;y++)
  808552:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  808559:	eb 53                	jmp    8085ae <FAT32_readdir+0x3e4>
					if(tmpldentry->LDIR_Name2[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  80855b:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80855f:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  808562:	48 63 d2             	movsxd rdx,edx
  808565:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  80856a:	66 83 f8 ff          	cmp    ax,0xffff
  80856e:	74 3a                	je     8085aa <FAT32_readdir+0x3e0>
  808570:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808574:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  808577:	48 63 d2             	movsxd rdx,edx
  80857a:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80857f:	66 85 c0             	test   ax,ax
  808582:	74 26                	je     8085aa <FAT32_readdir+0x3e0>
						name[namelen++] = (char)tmpldentry->LDIR_Name2[y];
  808584:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808588:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80858b:	48 63 d2             	movsxd rdx,edx
  80858e:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  808593:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808596:	8d 50 01             	lea    edx,[rax+0x1]
  808599:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80859c:	48 63 d0             	movsxd rdx,eax
  80859f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8085a3:	48 01 d0             	add    rax,rdx
  8085a6:	89 ca                	mov    edx,ecx
  8085a8:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<6;y++)
  8085aa:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  8085ae:	83 7d dc 05          	cmp    DWORD PTR [rbp-0x24],0x5
  8085b2:	7e a7                	jle    80855b <FAT32_readdir+0x391>

				for(y = 0;y<2;y++)
  8085b4:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  8085bb:	eb 5b                	jmp    808618 <FAT32_readdir+0x44e>
					if(tmpldentry->LDIR_Name3[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  8085bd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8085c1:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8085c4:	48 63 d2             	movsxd rdx,edx
  8085c7:	48 83 c2 08          	add    rdx,0x8
  8085cb:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  8085d0:	66 83 f8 ff          	cmp    ax,0xffff
  8085d4:	74 3e                	je     808614 <FAT32_readdir+0x44a>
  8085d6:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8085da:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8085dd:	48 63 d2             	movsxd rdx,edx
  8085e0:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  8085e5:	66 85 c0             	test   ax,ax
  8085e8:	74 2a                	je     808614 <FAT32_readdir+0x44a>
						name[namelen++] = (char)tmpldentry->LDIR_Name3[y];
  8085ea:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8085ee:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8085f1:	48 63 d2             	movsxd rdx,edx
  8085f4:	48 83 c2 08          	add    rdx,0x8
  8085f8:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  8085fd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808600:	8d 50 01             	lea    edx,[rax+0x1]
  808603:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  808606:	48 63 d0             	movsxd rdx,eax
  808609:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80860d:	48 01 d0             	add    rax,rdx
  808610:	89 ca                	mov    edx,ecx
  808612:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<2;y++)
  808614:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  808618:	83 7d dc 01          	cmp    DWORD PTR [rbp-0x24],0x1
  80861c:	7e 9f                	jle    8085bd <FAT32_readdir+0x3f3>
			for(x = 0;x<j;x++,tmpldentry --)
  80861e:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  808622:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
  808627:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80862a:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80862d:	0f 8c bd fe ff ff    	jl     8084f0 <FAT32_readdir+0x326>
			}
			goto find_lookup_success;
  808633:	e9 f5 01 00 00       	jmp    80882d <FAT32_readdir+0x663>
		}

		name = vmalloc(15,0);
  808638:	be 00 00 00 00       	mov    esi,0x0
  80863d:	bf 0f 00 00 00       	mov    edi,0xf
  808642:	b8 00 00 00 00       	mov    eax,0x0
  808647:	e8 9f 8a ff ff       	call   8010eb <vmalloc>
  80864c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
		memset(name,0,15);
  808650:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808654:	ba 0f 00 00 00       	mov    edx,0xf
  808659:	be 00 00 00 00       	mov    esi,0x0
  80865e:	48 89 c7             	mov    rdi,rax
  808661:	e8 ea 1e 00 00       	call   80a550 <memset>
		//short file/dir base name compare
		for(x=0;x<8;x++)
  808666:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  80866d:	eb 74                	jmp    8086e3 <FAT32_readdir+0x519>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  80866f:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  808673:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808676:	48 98                	cdqe   
  808678:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80867c:	3c 20                	cmp    al,0x20
  80867e:	74 6b                	je     8086eb <FAT32_readdir+0x521>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  808680:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808684:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  808688:	0f b6 c0             	movzx  eax,al
  80868b:	83 e0 08             	and    eax,0x8
  80868e:	85 c0                	test   eax,eax
  808690:	74 29                	je     8086bb <FAT32_readdir+0x4f1>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  808692:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  808696:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808699:	48 98                	cdqe   
  80869b:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80869f:	8d 48 20             	lea    ecx,[rax+0x20]
  8086a2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8086a5:	8d 50 01             	lea    edx,[rax+0x1]
  8086a8:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  8086ab:	48 63 d0             	movsxd rdx,eax
  8086ae:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8086b2:	48 01 d0             	add    rax,rdx
  8086b5:	89 ca                	mov    edx,ecx
  8086b7:	88 10                	mov    BYTE PTR [rax],dl
  8086b9:	eb 24                	jmp    8086df <FAT32_readdir+0x515>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  8086bb:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8086bf:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8086c2:	48 98                	cdqe   
  8086c4:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  8086c8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8086cb:	8d 50 01             	lea    edx,[rax+0x1]
  8086ce:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  8086d1:	48 63 d0             	movsxd rdx,eax
  8086d4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8086d8:	48 01 d0             	add    rax,rdx
  8086db:	89 ca                	mov    edx,ecx
  8086dd:	88 10                	mov    BYTE PTR [rax],dl
		for(x=0;x<8;x++)
  8086df:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  8086e3:	83 7d e0 07          	cmp    DWORD PTR [rbp-0x20],0x7
  8086e7:	7e 86                	jle    80866f <FAT32_readdir+0x4a5>
  8086e9:	eb 01                	jmp    8086ec <FAT32_readdir+0x522>
				break;
  8086eb:	90                   	nop
		}

		if(tmpdentry->DIR_Attr & ATTR_DIRECTORY)
  8086ec:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8086f0:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  8086f4:	0f b6 c0             	movzx  eax,al
  8086f7:	83 e0 10             	and    eax,0x10
  8086fa:	85 c0                	test   eax,eax
  8086fc:	0f 85 27 01 00 00    	jne    808829 <FAT32_readdir+0x65f>
			goto find_lookup_success;

		name[namelen++] = '.';
  808702:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808705:	8d 50 01             	lea    edx,[rax+0x1]
  808708:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80870b:	48 63 d0             	movsxd rdx,eax
  80870e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808712:	48 01 d0             	add    rax,rdx
  808715:	c6 00 2e             	mov    BYTE PTR [rax],0x2e

		//short file ext name compare
		for(x=8;x<11;x++)
  808718:	c7 45 e0 08 00 00 00 	mov    DWORD PTR [rbp-0x20],0x8
  80871f:	eb 74                	jmp    808795 <FAT32_readdir+0x5cb>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  808721:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  808725:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808728:	48 98                	cdqe   
  80872a:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80872e:	3c 20                	cmp    al,0x20
  808730:	74 6b                	je     80879d <FAT32_readdir+0x5d3>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  808732:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808736:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80873a:	0f b6 c0             	movzx  eax,al
  80873d:	83 e0 10             	and    eax,0x10
  808740:	85 c0                	test   eax,eax
  808742:	74 29                	je     80876d <FAT32_readdir+0x5a3>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  808744:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  808748:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80874b:	48 98                	cdqe   
  80874d:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808751:	8d 48 20             	lea    ecx,[rax+0x20]
  808754:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808757:	8d 50 01             	lea    edx,[rax+0x1]
  80875a:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80875d:	48 63 d0             	movsxd rdx,eax
  808760:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808764:	48 01 d0             	add    rax,rdx
  808767:	89 ca                	mov    edx,ecx
  808769:	88 10                	mov    BYTE PTR [rax],dl
  80876b:	eb 24                	jmp    808791 <FAT32_readdir+0x5c7>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  80876d:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  808771:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808774:	48 98                	cdqe   
  808776:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  80877a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80877d:	8d 50 01             	lea    edx,[rax+0x1]
  808780:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  808783:	48 63 d0             	movsxd rdx,eax
  808786:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80878a:	48 01 d0             	add    rax,rdx
  80878d:	89 ca                	mov    edx,ecx
  80878f:	88 10                	mov    BYTE PTR [rax],dl
		for(x=8;x<11;x++)
  808791:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  808795:	83 7d e0 0a          	cmp    DWORD PTR [rbp-0x20],0xa
  808799:	7e 86                	jle    808721 <FAT32_readdir+0x557>
  80879b:	eb 01                	jmp    80879e <FAT32_readdir+0x5d4>
				break;
  80879d:	90                   	nop
		}
		if(x == 8)
  80879e:	83 7d e0 08          	cmp    DWORD PTR [rbp-0x20],0x8
  8087a2:	0f 85 84 00 00 00    	jne    80882c <FAT32_readdir+0x662>
			name[--namelen] = 0;
  8087a8:	83 6d ec 01          	sub    DWORD PTR [rbp-0x14],0x1
  8087ac:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8087af:	48 63 d0             	movsxd rdx,eax
  8087b2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8087b6:	48 01 d0             	add    rax,rdx
  8087b9:	c6 00 00             	mov    BYTE PTR [rax],0x0
		goto find_lookup_success;
  8087bc:	eb 6e                	jmp    80882c <FAT32_readdir+0x662>
			continue;
  8087be:	90                   	nop
  8087bf:	eb 01                	jmp    8087c2 <FAT32_readdir+0x5f8>
			continue;
  8087c1:	90                   	nop
	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  8087c2:	83 45 e8 20          	add    DWORD PTR [rbp-0x18],0x20
  8087c6:	48 83 45 d0 20       	add    QWORD PTR [rbp-0x30],0x20
  8087cb:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8087cf:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8087d2:	48 8d 50 20          	lea    rdx,[rax+0x20]
  8087d6:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8087da:	48 89 10             	mov    QWORD PTR [rax],rdx
  8087dd:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8087e0:	48 63 d0             	movsxd rdx,eax
  8087e3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8087e7:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8087eb:	48 39 c2             	cmp    rdx,rax
  8087ee:	0f 8c ba fb ff ff    	jl     8083ae <FAT32_readdir+0x1e4>
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  8087f4:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8087f7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8087fb:	89 d6                	mov    esi,edx
  8087fd:	48 89 c7             	mov    rdi,rax
  808800:	e8 b0 ee ff ff       	call   8076b5 <DISK1_FAT32_read_FAT_Entry>
  808805:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  808808:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  80880f:	77 05                	ja     808816 <FAT32_readdir+0x64c>
		goto next_cluster;
  808811:	e9 d5 fa ff ff       	jmp    8082eb <FAT32_readdir+0x121>

	vmfree(buf);
  808816:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80881a:	48 89 c7             	mov    rdi,rax
  80881d:	e8 58 89 ff ff       	call   80117a <vmfree>
	return NULL;
  808822:	b8 00 00 00 00       	mov    eax,0x0
  808827:	eb 3b                	jmp    808864 <FAT32_readdir+0x69a>
			goto find_lookup_success;
  808829:	90                   	nop
  80882a:	eb 01                	jmp    80882d <FAT32_readdir+0x663>
		goto find_lookup_success;
  80882c:	90                   	nop

find_lookup_success:

	filp->position += 32;
  80882d:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808831:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808834:	48 8d 50 20          	lea    rdx,[rax+0x20]
  808838:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80883c:	48 89 10             	mov    QWORD PTR [rax],rdx
	return filler(dirent,name,namelen,0,0);
  80883f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808842:	48 63 d0             	movsxd rdx,eax
  808845:	48 8b 75 f0          	mov    rsi,QWORD PTR [rbp-0x10]
  808849:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80884d:	4c 8b 4d 88          	mov    r9,QWORD PTR [rbp-0x78]
  808851:	41 b8 00 00 00 00    	mov    r8d,0x0
  808857:	b9 00 00 00 00       	mov    ecx,0x0
  80885c:	48 89 c7             	mov    rdi,rax
  80885f:	41 ff d1             	call   r9
  808862:	48 98                	cdqe   
}
  808864:	c9                   	leave  
  808865:	c3                   	ret    

0000000000808866 <FAT32_create>:
	.readdir = FAT32_readdir,
};


long FAT32_create(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  808866:	f3 0f 1e fa          	endbr64 
  80886a:	55                   	push   rbp
  80886b:	48 89 e5             	mov    rbp,rsp
  80886e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  808872:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  808876:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  808879:	90                   	nop
  80887a:	5d                   	pop    rbp
  80887b:	c3                   	ret    

000000000080887c <FAT32_lookup>:


struct dir_entry * FAT32_lookup(struct index_node * parent_inode,struct dir_entry * dest_dentry)
{
  80887c:	f3 0f 1e fa          	endbr64 
  808880:	55                   	push   rbp
  808881:	48 89 e5             	mov    rbp,rsp
  808884:	48 83 ec 60          	sub    rsp,0x60
  808888:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  80888c:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
	struct FAT32_inode_info * finode = parent_inode->private_index_info;
  808890:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808894:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808898:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	struct FAT32_sb_info * fsbi = parent_inode->sb->private_sb_info;
  80889c:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8088a0:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8088a4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8088a8:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	unsigned int cluster = 0;
  8088ac:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  8088b3:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  8088ba:	00 
	unsigned char * buf =NULL; 
  8088bb:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  8088c2:	00 
	int i = 0,j = 0,x = 0;
  8088c3:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8088ca:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8088d1:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  8088d8:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  8088df:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  8088e0:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  8088e7:	00 
	struct index_node * p = NULL;
  8088e8:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  8088ef:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  8088f0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8088f4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8088f8:	be 00 00 00 00       	mov    esi,0x0
  8088fd:	48 89 c7             	mov    rdi,rax
  808900:	b8 00 00 00 00       	mov    eax,0x0
  808905:	e8 e1 87 ff ff       	call   8010eb <vmalloc>
  80890a:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax

	cluster = finode->first_cluster;
  80890e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808912:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808915:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

next_cluster:
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  808918:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80891c:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  808920:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808923:	83 e8 02             	sub    eax,0x2
  808926:	89 c1                	mov    ecx,eax
  808928:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80892c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808930:	48 0f af c1          	imul   rax,rcx
  808934:	48 01 d0             	add    rax,rdx
  808937:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
	printf("lookup cluster:%#010x,sector:%x\n",cluster,sector);
  80893b:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80893f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808942:	89 c6                	mov    esi,eax
  808944:	bf 98 2f 81 00       	mov    edi,0x812f98
  808949:	b8 00 00 00 00       	mov    eax,0x0
  80894e:	e8 80 83 ff ff       	call   800cd3 <printf>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  808953:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808957:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80895b:	89 c1                	mov    ecx,eax
  80895d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808961:	89 c2                	mov    edx,eax
  808963:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808967:	49 89 c0             	mov    r8,rax
  80896a:	be 00 00 00 00       	mov    esi,0x0
  80896f:	bf 00 00 00 00       	mov    edi,0x0
  808974:	e8 b2 e0 ff ff       	call   806a2b <request>
  808979:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    if(!chk_result(r))
  80897c:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80897f:	89 c7                	mov    edi,eax
  808981:	e8 59 e7 ff ff       	call   8070df <chk_result>
  808986:	85 c0                	test   eax,eax
  808988:	75 25                	jne    8089af <FAT32_lookup+0x133>
	{
		printf("FAT32 FS(lookup) read disk ERROR!!!!!!!!!!\n");
  80898a:	bf c0 2f 81 00       	mov    edi,0x812fc0
  80898f:	b8 00 00 00 00       	mov    eax,0x0
  808994:	e8 3a 83 ff ff       	call   800cd3 <printf>
		vmfree(buf);
  808999:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80899d:	48 89 c7             	mov    rdi,rax
  8089a0:	e8 d5 87 ff ff       	call   80117a <vmfree>
		return NULL;
  8089a5:	b8 00 00 00 00       	mov    eax,0x0
  8089aa:	e9 f0 07 00 00       	jmp    80919f <FAT32_lookup+0x923>
	}

	tmpdentry = (struct FAT32_Directory *)buf;
  8089af:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8089b3:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax

	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  8089b7:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8089be:	e9 9d 05 00 00       	jmp    808f60 <FAT32_lookup+0x6e4>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  8089c3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8089c7:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  8089cb:	3c 0f                	cmp    al,0xf
  8089cd:	0f 84 59 05 00 00    	je     808f2c <FAT32_lookup+0x6b0>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  8089d3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8089d7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8089da:	3c e5                	cmp    al,0xe5
  8089dc:	0f 84 4d 05 00 00    	je     808f2f <FAT32_lookup+0x6b3>
  8089e2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8089e6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8089e9:	84 c0                	test   al,al
  8089eb:	0f 84 3e 05 00 00    	je     808f2f <FAT32_lookup+0x6b3>
  8089f1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8089f5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8089f8:	3c 05                	cmp    al,0x5
  8089fa:	0f 84 2f 05 00 00    	je     808f2f <FAT32_lookup+0x6b3>
			continue;

		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  808a00:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808a04:	48 83 e8 20          	sub    rax,0x20
  808a08:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
		j = 0;
  808a0c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0

		//long file/dir name compare
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  808a13:	e9 88 01 00 00       	jmp    808ba0 <FAT32_lookup+0x324>
		{
			for(x=0;x<5;x++)
  808a18:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  808a1f:	eb 6a                	jmp    808a8b <FAT32_lookup+0x20f>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name1[x] == 0xffff)
  808a21:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808a25:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808a28:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808a2b:	7e 15                	jle    808a42 <FAT32_lookup+0x1c6>
  808a2d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808a31:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  808a34:	48 63 d2             	movsxd rdx,edx
  808a37:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  808a3c:	66 83 f8 ff          	cmp    ax,0xffff
  808a40:	74 44                	je     808a86 <FAT32_lookup+0x20a>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name1[x] != (unsigned short)(dest_dentry->name[j++]))
  808a42:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808a46:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808a49:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808a4c:	0f 8f e0 04 00 00    	jg     808f32 <FAT32_lookup+0x6b6>
  808a52:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808a56:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  808a59:	48 63 d2             	movsxd rdx,edx
  808a5c:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  808a61:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808a65:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  808a68:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808a6b:	8d 50 01             	lea    edx,[rax+0x1]
  808a6e:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  808a71:	48 98                	cdqe   
  808a73:	48 01 f0             	add    rax,rsi
  808a76:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808a79:	66 98                	cbw    
  808a7b:	66 39 c1             	cmp    cx,ax
  808a7e:	0f 85 ae 04 00 00    	jne    808f32 <FAT32_lookup+0x6b6>
  808a84:	eb 01                	jmp    808a87 <FAT32_lookup+0x20b>
					continue;
  808a86:	90                   	nop
			for(x=0;x<5;x++)
  808a87:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  808a8b:	83 7d f0 04          	cmp    DWORD PTR [rbp-0x10],0x4
  808a8f:	7e 90                	jle    808a21 <FAT32_lookup+0x1a5>
					goto continue_cmp_fail;
			}
			for(x=0;x<6;x++)
  808a91:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  808a98:	eb 6a                	jmp    808b04 <FAT32_lookup+0x288>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name2[x] == 0xffff)
  808a9a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808a9e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808aa1:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808aa4:	7e 15                	jle    808abb <FAT32_lookup+0x23f>
  808aa6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808aaa:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  808aad:	48 63 d2             	movsxd rdx,edx
  808ab0:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  808ab5:	66 83 f8 ff          	cmp    ax,0xffff
  808ab9:	74 44                	je     808aff <FAT32_lookup+0x283>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name2[x] != (unsigned short)(dest_dentry->name[j++]))
  808abb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808abf:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808ac2:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808ac5:	0f 8f 6a 04 00 00    	jg     808f35 <FAT32_lookup+0x6b9>
  808acb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808acf:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  808ad2:	48 63 d2             	movsxd rdx,edx
  808ad5:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  808ada:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808ade:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  808ae1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808ae4:	8d 50 01             	lea    edx,[rax+0x1]
  808ae7:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  808aea:	48 98                	cdqe   
  808aec:	48 01 f0             	add    rax,rsi
  808aef:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808af2:	66 98                	cbw    
  808af4:	66 39 c1             	cmp    cx,ax
  808af7:	0f 85 38 04 00 00    	jne    808f35 <FAT32_lookup+0x6b9>
  808afd:	eb 01                	jmp    808b00 <FAT32_lookup+0x284>
					continue;
  808aff:	90                   	nop
			for(x=0;x<6;x++)
  808b00:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  808b04:	83 7d f0 05          	cmp    DWORD PTR [rbp-0x10],0x5
  808b08:	7e 90                	jle    808a9a <FAT32_lookup+0x21e>
					goto continue_cmp_fail;
			}
			for(x=0;x<2;x++)
  808b0a:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  808b11:	eb 72                	jmp    808b85 <FAT32_lookup+0x309>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name3[x] == 0xffff)
  808b13:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808b17:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808b1a:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808b1d:	7e 19                	jle    808b38 <FAT32_lookup+0x2bc>
  808b1f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808b23:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  808b26:	48 63 d2             	movsxd rdx,edx
  808b29:	48 83 c2 08          	add    rdx,0x8
  808b2d:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  808b32:	66 83 f8 ff          	cmp    ax,0xffff
  808b36:	74 48                	je     808b80 <FAT32_lookup+0x304>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name3[x] != (unsigned short)(dest_dentry->name[j++]))
  808b38:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808b3c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808b3f:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808b42:	0f 8f f0 03 00 00    	jg     808f38 <FAT32_lookup+0x6bc>
  808b48:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808b4c:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  808b4f:	48 63 d2             	movsxd rdx,edx
  808b52:	48 83 c2 08          	add    rdx,0x8
  808b56:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  808b5b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808b5f:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  808b62:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808b65:	8d 50 01             	lea    edx,[rax+0x1]
  808b68:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  808b6b:	48 98                	cdqe   
  808b6d:	48 01 f0             	add    rax,rsi
  808b70:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808b73:	66 98                	cbw    
  808b75:	66 39 c1             	cmp    cx,ax
  808b78:	0f 85 ba 03 00 00    	jne    808f38 <FAT32_lookup+0x6bc>
  808b7e:	eb 01                	jmp    808b81 <FAT32_lookup+0x305>
					continue;
  808b80:	90                   	nop
			for(x=0;x<2;x++)
  808b81:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  808b85:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  808b89:	7e 88                	jle    808b13 <FAT32_lookup+0x297>
					goto continue_cmp_fail;
			}

			if(j >= dest_dentry->name_length)
  808b8b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808b8f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808b92:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808b95:	0f 8d 14 04 00 00    	jge    808faf <FAT32_lookup+0x733>
			{
				goto find_lookup_success;
			}

			tmpldentry --;
  808b9b:	48 83 6d e0 20       	sub    QWORD PTR [rbp-0x20],0x20
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  808ba0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808ba4:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  808ba8:	3c 0f                	cmp    al,0xf
  808baa:	75 0f                	jne    808bbb <FAT32_lookup+0x33f>
  808bac:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808bb0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808bb3:	3c e5                	cmp    al,0xe5
  808bb5:	0f 85 5d fe ff ff    	jne    808a18 <FAT32_lookup+0x19c>
		}

		//short file/dir base name compare
		j = 0;
  808bbb:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
		for(x=0;x<8;x++)
  808bc2:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  808bc9:	e9 f4 01 00 00       	jmp    808dc2 <FAT32_lookup+0x546>
		{
			switch(tmpdentry->DIR_Name[x])
  808bce:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808bd2:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808bd5:	48 98                	cdqe   
  808bd7:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808bdb:	0f b6 c0             	movzx  eax,al
  808bde:	83 f8 7a             	cmp    eax,0x7a
  808be1:	0f 8f d0 01 00 00    	jg     808db7 <FAT32_lookup+0x53b>
  808be7:	83 f8 61             	cmp    eax,0x61
  808bea:	0f 8d e6 00 00 00    	jge    808cd6 <FAT32_lookup+0x45a>
  808bf0:	83 f8 5a             	cmp    eax,0x5a
  808bf3:	0f 8f be 01 00 00    	jg     808db7 <FAT32_lookup+0x53b>
  808bf9:	83 f8 41             	cmp    eax,0x41
  808bfc:	0f 8d d4 00 00 00    	jge    808cd6 <FAT32_lookup+0x45a>
  808c02:	83 f8 20             	cmp    eax,0x20
  808c05:	74 1a                	je     808c21 <FAT32_lookup+0x3a5>
  808c07:	83 f8 20             	cmp    eax,0x20
  808c0a:	0f 8c a7 01 00 00    	jl     808db7 <FAT32_lookup+0x53b>
  808c10:	83 e8 30             	sub    eax,0x30
  808c13:	83 f8 09             	cmp    eax,0x9
  808c16:	0f 87 9b 01 00 00    	ja     808db7 <FAT32_lookup+0x53b>
  808c1c:	e9 53 01 00 00       	jmp    808d74 <FAT32_lookup+0x4f8>
			{
				case ' ':
					if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  808c21:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808c25:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  808c29:	0f b6 c0             	movzx  eax,al
  808c2c:	83 e0 10             	and    eax,0x10
  808c2f:	85 c0                	test   eax,eax
  808c31:	75 50                	jne    808c83 <FAT32_lookup+0x407>
					{
						if(dest_dentry->name[j]=='.')
  808c33:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808c37:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  808c3a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808c3d:	48 98                	cdqe   
  808c3f:	48 01 d0             	add    rax,rdx
  808c42:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c45:	3c 2e                	cmp    al,0x2e
  808c47:	0f 84 70 01 00 00    	je     808dbd <FAT32_lookup+0x541>
							continue;
						else if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  808c4d:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808c51:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808c54:	48 98                	cdqe   
  808c56:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808c5a:	0f b6 d0             	movzx  edx,al
  808c5d:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808c61:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808c64:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808c67:	48 98                	cdqe   
  808c69:	48 01 c8             	add    rax,rcx
  808c6c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c6f:	0f be c0             	movsx  eax,al
  808c72:	39 c2                	cmp    edx,eax
  808c74:	0f 85 c1 02 00 00    	jne    808f3b <FAT32_lookup+0x6bf>
						{
							j++;
  808c7a:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  808c7e:	e9 3b 01 00 00       	jmp    808dbe <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  808c83:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808c87:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808c8a:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808c8d:	7d 32                	jge    808cc1 <FAT32_lookup+0x445>
  808c8f:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808c93:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808c96:	48 98                	cdqe   
  808c98:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808c9c:	0f b6 d0             	movzx  edx,al
  808c9f:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808ca3:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808ca6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808ca9:	48 98                	cdqe   
  808cab:	48 01 c8             	add    rax,rcx
  808cae:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808cb1:	0f be c0             	movsx  eax,al
  808cb4:	39 c2                	cmp    edx,eax
  808cb6:	75 09                	jne    808cc1 <FAT32_lookup+0x445>
						{
							j++;
  808cb8:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  808cbc:	e9 fd 00 00 00       	jmp    808dbe <FAT32_lookup+0x542>
						}
						else if(j == dest_dentry->name_length)
  808cc1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808cc5:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808cc8:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808ccb:	0f 85 6d 02 00 00    	jne    808f3e <FAT32_lookup+0x6c2>
							continue;
  808cd1:	e9 e8 00 00 00       	jmp    808dbe <FAT32_lookup+0x542>
							goto continue_cmp_fail;
					}

				case 'A' ... 'Z':
				case 'a' ... 'z':
					if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  808cd6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808cda:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  808cde:	0f b6 c0             	movzx  eax,al
  808ce1:	83 e0 08             	and    eax,0x8
  808ce4:	85 c0                	test   eax,eax
  808ce6:	74 49                	je     808d31 <FAT32_lookup+0x4b5>
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  808ce8:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808cec:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808cef:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808cf2:	0f 8d 49 02 00 00    	jge    808f41 <FAT32_lookup+0x6c5>
  808cf8:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808cfc:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808cff:	48 98                	cdqe   
  808d01:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808d05:	0f b6 c0             	movzx  eax,al
  808d08:	8d 50 20             	lea    edx,[rax+0x20]
  808d0b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808d0f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808d12:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808d15:	48 98                	cdqe   
  808d17:	48 01 c8             	add    rax,rcx
  808d1a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d1d:	0f be c0             	movsx  eax,al
  808d20:	39 c2                	cmp    edx,eax
  808d22:	0f 85 19 02 00 00    	jne    808f41 <FAT32_lookup+0x6c5>
						{
							j++;
  808d28:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  808d2c:	e9 8d 00 00 00       	jmp    808dbe <FAT32_lookup+0x542>
						}
						else
							goto continue_cmp_fail;
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  808d31:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808d35:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808d38:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808d3b:	0f 8d 03 02 00 00    	jge    808f44 <FAT32_lookup+0x6c8>
  808d41:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808d45:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808d48:	48 98                	cdqe   
  808d4a:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808d4e:	0f b6 d0             	movzx  edx,al
  808d51:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808d55:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808d58:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808d5b:	48 98                	cdqe   
  808d5d:	48 01 c8             	add    rax,rcx
  808d60:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d63:	0f be c0             	movsx  eax,al
  808d66:	39 c2                	cmp    edx,eax
  808d68:	0f 85 d6 01 00 00    	jne    808f44 <FAT32_lookup+0x6c8>
						{
							j++;
  808d6e:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  808d72:	eb 4a                	jmp    808dbe <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}

				case '0' ... '9':
					if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  808d74:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808d78:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808d7b:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808d7e:	0f 8d c3 01 00 00    	jge    808f47 <FAT32_lookup+0x6cb>
  808d84:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808d88:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808d8b:	48 98                	cdqe   
  808d8d:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808d91:	0f b6 d0             	movzx  edx,al
  808d94:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808d98:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808d9b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808d9e:	48 98                	cdqe   
  808da0:	48 01 c8             	add    rax,rcx
  808da3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808da6:	0f be c0             	movsx  eax,al
  808da9:	39 c2                	cmp    edx,eax
  808dab:	0f 85 96 01 00 00    	jne    808f47 <FAT32_lookup+0x6cb>
					{
						j++;
  808db1:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
						break;
  808db5:	eb 07                	jmp    808dbe <FAT32_lookup+0x542>
					}
					else
						goto continue_cmp_fail;

				default :
					j++;
  808db7:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
					break;
  808dbb:	eb 01                	jmp    808dbe <FAT32_lookup+0x542>
							continue;
  808dbd:	90                   	nop
		for(x=0;x<8;x++)
  808dbe:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  808dc2:	83 7d f0 07          	cmp    DWORD PTR [rbp-0x10],0x7
  808dc6:	0f 8e 02 fe ff ff    	jle    808bce <FAT32_lookup+0x352>
			}
		}
		//short file ext name compare
		if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  808dcc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808dd0:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  808dd4:	0f b6 c0             	movzx  eax,al
  808dd7:	83 e0 10             	and    eax,0x10
  808dda:	85 c0                	test   eax,eax
  808ddc:	0f 85 d0 01 00 00    	jne    808fb2 <FAT32_lookup+0x736>
		{
			j++;
  808de2:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
			for(x=8;x<11;x++)
  808de6:	c7 45 f0 08 00 00 00 	mov    DWORD PTR [rbp-0x10],0x8
  808ded:	e9 2b 01 00 00       	jmp    808f1d <FAT32_lookup+0x6a1>
			{
				switch(tmpdentry->DIR_Name[x])
  808df2:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808df6:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808df9:	48 98                	cdqe   
  808dfb:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808dff:	0f b6 c0             	movzx  eax,al
  808e02:	83 f8 7a             	cmp    eax,0x7a
  808e05:	0f 8f 3f 01 00 00    	jg     808f4a <FAT32_lookup+0x6ce>
  808e0b:	83 f8 61             	cmp    eax,0x61
  808e0e:	7d 2e                	jge    808e3e <FAT32_lookup+0x5c2>
  808e10:	83 f8 5a             	cmp    eax,0x5a
  808e13:	0f 8f 31 01 00 00    	jg     808f4a <FAT32_lookup+0x6ce>
  808e19:	83 f8 41             	cmp    eax,0x41
  808e1c:	7d 20                	jge    808e3e <FAT32_lookup+0x5c2>
  808e1e:	83 f8 20             	cmp    eax,0x20
  808e21:	0f 84 c4 00 00 00    	je     808eeb <FAT32_lookup+0x66f>
  808e27:	83 f8 20             	cmp    eax,0x20
  808e2a:	0f 8c 1a 01 00 00    	jl     808f4a <FAT32_lookup+0x6ce>
  808e30:	83 e8 30             	sub    eax,0x30
  808e33:	83 f8 09             	cmp    eax,0x9
  808e36:	0f 87 0e 01 00 00    	ja     808f4a <FAT32_lookup+0x6ce>
  808e3c:	eb 7e                	jmp    808ebc <FAT32_lookup+0x640>
				{
					case 'A' ... 'Z':
					case 'a' ... 'z':
						if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  808e3e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808e42:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  808e46:	0f b6 c0             	movzx  eax,al
  808e49:	83 e0 10             	and    eax,0x10
  808e4c:	85 c0                	test   eax,eax
  808e4e:	74 39                	je     808e89 <FAT32_lookup+0x60d>
							if(tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  808e50:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808e54:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808e57:	48 98                	cdqe   
  808e59:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808e5d:	0f b6 c0             	movzx  eax,al
  808e60:	8d 50 20             	lea    edx,[rax+0x20]
  808e63:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808e67:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808e6a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808e6d:	48 98                	cdqe   
  808e6f:	48 01 c8             	add    rax,rcx
  808e72:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808e75:	0f be c0             	movsx  eax,al
  808e78:	39 c2                	cmp    edx,eax
  808e7a:	0f 85 cd 00 00 00    	jne    808f4d <FAT32_lookup+0x6d1>
							{
								j++;
  808e80:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  808e84:	e9 90 00 00 00       	jmp    808f19 <FAT32_lookup+0x69d>
							}
							else
								goto continue_cmp_fail;
						else
						{
							if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  808e89:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808e8d:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808e90:	48 98                	cdqe   
  808e92:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808e96:	0f b6 d0             	movzx  edx,al
  808e99:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808e9d:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808ea0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808ea3:	48 98                	cdqe   
  808ea5:	48 01 c8             	add    rax,rcx
  808ea8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808eab:	0f be c0             	movsx  eax,al
  808eae:	39 c2                	cmp    edx,eax
  808eb0:	0f 85 9a 00 00 00    	jne    808f50 <FAT32_lookup+0x6d4>
							{
								j++;
  808eb6:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  808eba:	eb 5d                	jmp    808f19 <FAT32_lookup+0x69d>
							else
								goto continue_cmp_fail;
						}

					case '0' ... '9':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  808ebc:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808ec0:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808ec3:	48 98                	cdqe   
  808ec5:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808ec9:	0f b6 d0             	movzx  edx,al
  808ecc:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808ed0:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808ed3:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808ed6:	48 98                	cdqe   
  808ed8:	48 01 c8             	add    rax,rcx
  808edb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808ede:	0f be c0             	movsx  eax,al
  808ee1:	39 c2                	cmp    edx,eax
  808ee3:	75 6e                	jne    808f53 <FAT32_lookup+0x6d7>
						{
							j++;
  808ee5:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  808ee9:	eb 2e                	jmp    808f19 <FAT32_lookup+0x69d>
						}
						else
							goto continue_cmp_fail;

					case ' ':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  808eeb:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808eef:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808ef2:	48 98                	cdqe   
  808ef4:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808ef8:	0f b6 d0             	movzx  edx,al
  808efb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808eff:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808f02:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808f05:	48 98                	cdqe   
  808f07:	48 01 c8             	add    rax,rcx
  808f0a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808f0d:	0f be c0             	movsx  eax,al
  808f10:	39 c2                	cmp    edx,eax
  808f12:	75 42                	jne    808f56 <FAT32_lookup+0x6da>
						{
							j++;
  808f14:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  808f18:	90                   	nop
			for(x=8;x<11;x++)
  808f19:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  808f1d:	83 7d f0 0a          	cmp    DWORD PTR [rbp-0x10],0xa
  808f21:	0f 8e cb fe ff ff    	jle    808df2 <FAT32_lookup+0x576>
					default :
						goto continue_cmp_fail;
				}
			}
		}
		goto find_lookup_success;
  808f27:	e9 86 00 00 00       	jmp    808fb2 <FAT32_lookup+0x736>
			continue;
  808f2c:	90                   	nop
  808f2d:	eb 28                	jmp    808f57 <FAT32_lookup+0x6db>
			continue;
  808f2f:	90                   	nop
  808f30:	eb 25                	jmp    808f57 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  808f32:	90                   	nop
  808f33:	eb 22                	jmp    808f57 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  808f35:	90                   	nop
  808f36:	eb 1f                	jmp    808f57 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  808f38:	90                   	nop
  808f39:	eb 1c                	jmp    808f57 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  808f3b:	90                   	nop
  808f3c:	eb 19                	jmp    808f57 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  808f3e:	90                   	nop
  808f3f:	eb 16                	jmp    808f57 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  808f41:	90                   	nop
  808f42:	eb 13                	jmp    808f57 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  808f44:	90                   	nop
  808f45:	eb 10                	jmp    808f57 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  808f47:	90                   	nop
  808f48:	eb 0d                	jmp    808f57 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  808f4a:	90                   	nop
  808f4b:	eb 0a                	jmp    808f57 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  808f4d:	90                   	nop
  808f4e:	eb 07                	jmp    808f57 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  808f50:	90                   	nop
  808f51:	eb 04                	jmp    808f57 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  808f53:	90                   	nop
  808f54:	eb 01                	jmp    808f57 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  808f56:	90                   	nop
	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  808f57:	83 45 f8 20          	add    DWORD PTR [rbp-0x8],0x20
  808f5b:	48 83 45 e8 20       	add    QWORD PTR [rbp-0x18],0x20
  808f60:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  808f63:	48 63 d0             	movsxd rdx,eax
  808f66:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808f6a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808f6e:	48 39 c2             	cmp    rdx,rax
  808f71:	0f 8c 4c fa ff ff    	jl     8089c3 <FAT32_lookup+0x147>

continue_cmp_fail:;
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  808f77:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  808f7a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808f7e:	89 d6                	mov    esi,edx
  808f80:	48 89 c7             	mov    rdi,rax
  808f83:	e8 2d e7 ff ff       	call   8076b5 <DISK1_FAT32_read_FAT_Entry>
  808f88:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  808f8b:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  808f92:	77 05                	ja     808f99 <FAT32_lookup+0x71d>
		goto next_cluster;
  808f94:	e9 7f f9 ff ff       	jmp    808918 <FAT32_lookup+0x9c>

	vmfree(buf);
  808f99:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808f9d:	48 89 c7             	mov    rdi,rax
  808fa0:	e8 d5 81 ff ff       	call   80117a <vmfree>
	return NULL;
  808fa5:	b8 00 00 00 00       	mov    eax,0x0
  808faa:	e9 f0 01 00 00       	jmp    80919f <FAT32_lookup+0x923>
				goto find_lookup_success;
  808faf:	90                   	nop
  808fb0:	eb 01                	jmp    808fb3 <FAT32_lookup+0x737>
		goto find_lookup_success;
  808fb2:	90                   	nop

find_lookup_success:
	p = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  808fb3:	be 00 00 00 00       	mov    esi,0x0
  808fb8:	bf 38 00 00 00       	mov    edi,0x38
  808fbd:	b8 00 00 00 00       	mov    eax,0x0
  808fc2:	e8 24 81 ff ff       	call   8010eb <vmalloc>
  808fc7:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
	memset(p,0,sizeof(struct index_node));
  808fcb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808fcf:	ba 38 00 00 00       	mov    edx,0x38
  808fd4:	be 00 00 00 00       	mov    esi,0x0
  808fd9:	48 89 c7             	mov    rdi,rax
  808fdc:	e8 6f 15 00 00       	call   80a550 <memset>
	p->file_size = tmpdentry->DIR_FileSize;
  808fe1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808fe5:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  808fe8:	89 c2                	mov    edx,eax
  808fea:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808fee:	48 89 10             	mov    QWORD PTR [rax],rdx
	p->blocks = (p->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  808ff1:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808ff5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  808ff8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808ffc:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809000:	48 01 d0             	add    rax,rdx
  809003:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  809007:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80900b:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80900f:	48 89 c1             	mov    rcx,rax
  809012:	48 89 d0             	mov    rax,rdx
  809015:	ba 00 00 00 00       	mov    edx,0x0
  80901a:	48 f7 f1             	div    rcx
  80901d:	48 89 c2             	mov    rdx,rax
  809020:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809024:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	p->attribute = (tmpdentry->DIR_Attr & ATTR_DIRECTORY) ? FS_ATTR_DIR : FS_ATTR_FILE;
  809028:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80902c:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809030:	0f b6 c0             	movzx  eax,al
  809033:	83 e0 10             	and    eax,0x10
  809036:	85 c0                	test   eax,eax
  809038:	74 07                	je     809041 <FAT32_lookup+0x7c5>
  80903a:	ba 02 00 00 00       	mov    edx,0x2
  80903f:	eb 05                	jmp    809046 <FAT32_lookup+0x7ca>
  809041:	ba 01 00 00 00       	mov    edx,0x1
  809046:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80904a:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	p->sb = parent_inode->sb;
  80904e:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  809052:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  809056:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80905a:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	p->f_ops = &FAT32_file_ops;
  80905e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809062:	48 c7 40 20 80 b0 80 	mov    QWORD PTR [rax+0x20],0x80b080
  809069:	00 
	p->inode_ops = &FAT32_inode_ops;
  80906a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80906e:	48 c7 40 28 c0 b0 80 	mov    QWORD PTR [rax+0x28],0x80b0c0
  809075:	00 

	p->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  809076:	be 00 00 00 00       	mov    esi,0x0
  80907b:	bf 20 00 00 00       	mov    edi,0x20
  809080:	b8 00 00 00 00       	mov    eax,0x0
  809085:	e8 61 80 ff ff       	call   8010eb <vmalloc>
  80908a:	48 89 c2             	mov    rdx,rax
  80908d:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809091:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(p->private_index_info,0,sizeof(struct FAT32_inode_info));
  809095:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809099:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80909d:	ba 20 00 00 00       	mov    edx,0x20
  8090a2:	be 00 00 00 00       	mov    esi,0x0
  8090a7:	48 89 c7             	mov    rdi,rax
  8090aa:	e8 a1 14 00 00       	call   80a550 <memset>
	finode = p->private_index_info;
  8090af:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8090b3:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8090b7:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax

	finode->first_cluster = (tmpdentry->DIR_FstClusHI<< 16 | tmpdentry->DIR_FstClusLO) & 0x0fffffff;
  8090bb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8090bf:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  8090c3:	0f b7 c0             	movzx  eax,ax
  8090c6:	c1 e0 10             	shl    eax,0x10
  8090c9:	89 c2                	mov    edx,eax
  8090cb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8090cf:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  8090d3:	0f b7 c0             	movzx  eax,ax
  8090d6:	09 d0                	or     eax,edx
  8090d8:	48 98                	cdqe   
  8090da:	25 ff ff ff 0f       	and    eax,0xfffffff
  8090df:	48 89 c2             	mov    rdx,rax
  8090e2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8090e6:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = cluster;
  8090e9:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8090ec:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8090f0:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	finode->dentry_position = tmpdentry - (struct FAT32_Directory *)buf;
  8090f4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8090f8:	48 2b 45 c0          	sub    rax,QWORD PTR [rbp-0x40]
  8090fc:	48 c1 f8 05          	sar    rax,0x5
  809100:	48 89 c2             	mov    rdx,rax
  809103:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809107:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	finode->create_date = tmpdentry->DIR_CrtTime;
  80910b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80910f:	0f b7 50 0e          	movzx  edx,WORD PTR [rax+0xe]
  809113:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809117:	66 89 50 18          	mov    WORD PTR [rax+0x18],dx
	finode->create_time = tmpdentry->DIR_CrtDate;
  80911b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80911f:	0f b7 50 10          	movzx  edx,WORD PTR [rax+0x10]
  809123:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809127:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	finode->write_date = tmpdentry->DIR_WrtTime;
  80912b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80912f:	0f b7 50 16          	movzx  edx,WORD PTR [rax+0x16]
  809133:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809137:	66 89 50 1c          	mov    WORD PTR [rax+0x1c],dx
	finode->write_time = tmpdentry->DIR_WrtDate;
  80913b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80913f:	0f b7 50 18          	movzx  edx,WORD PTR [rax+0x18]
  809143:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809147:	66 89 50 1e          	mov    WORD PTR [rax+0x1e],dx

	if((tmpdentry->DIR_FstClusHI >> 12) && (p->attribute & FS_ATTR_FILE))
  80914b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80914f:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  809153:	66 c1 e8 0c          	shr    ax,0xc
  809157:	66 85 c0             	test   ax,ax
  80915a:	74 27                	je     809183 <FAT32_lookup+0x907>
  80915c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809160:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809164:	83 e0 01             	and    eax,0x1
  809167:	48 85 c0             	test   rax,rax
  80916a:	74 17                	je     809183 <FAT32_lookup+0x907>
	{
		p->attribute |= FS_ATTR_DEVICE;
  80916c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809170:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809174:	48 83 c8 04          	or     rax,0x4
  809178:	48 89 c2             	mov    rdx,rax
  80917b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80917f:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	}

	dest_dentry->dir_inode = p;
  809183:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809187:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80918b:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	vmfree(buf);
  80918f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809193:	48 89 c7             	mov    rdi,rax
  809196:	e8 df 7f ff ff       	call   80117a <vmfree>
	return dest_dentry;	
  80919b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
}
  80919f:	c9                   	leave  
  8091a0:	c3                   	ret    

00000000008091a1 <FAT32_mkdir>:


long FAT32_mkdir(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  8091a1:	f3 0f 1e fa          	endbr64 
  8091a5:	55                   	push   rbp
  8091a6:	48 89 e5             	mov    rbp,rsp
  8091a9:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8091ad:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8091b1:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  8091b4:	90                   	nop
  8091b5:	5d                   	pop    rbp
  8091b6:	c3                   	ret    

00000000008091b7 <FAT32_rmdir>:


long FAT32_rmdir(struct index_node * inode,struct dir_entry * dentry)
{}
  8091b7:	f3 0f 1e fa          	endbr64 
  8091bb:	55                   	push   rbp
  8091bc:	48 89 e5             	mov    rbp,rsp
  8091bf:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8091c3:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8091c7:	90                   	nop
  8091c8:	5d                   	pop    rbp
  8091c9:	c3                   	ret    

00000000008091ca <FAT32_rename>:

long FAT32_rename(struct index_node * old_inode,struct dir_entry * old_dentry,struct index_node * new_inode,struct dir_entry * new_dentry)
{}
  8091ca:	f3 0f 1e fa          	endbr64 
  8091ce:	55                   	push   rbp
  8091cf:	48 89 e5             	mov    rbp,rsp
  8091d2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8091d6:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8091da:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  8091de:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  8091e2:	90                   	nop
  8091e3:	5d                   	pop    rbp
  8091e4:	c3                   	ret    

00000000008091e5 <FAT32_getattr>:

long FAT32_getattr(struct dir_entry * dentry,unsigned long * attr)
{}
  8091e5:	f3 0f 1e fa          	endbr64 
  8091e9:	55                   	push   rbp
  8091ea:	48 89 e5             	mov    rbp,rsp
  8091ed:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8091f1:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8091f5:	90                   	nop
  8091f6:	5d                   	pop    rbp
  8091f7:	c3                   	ret    

00000000008091f8 <FAT32_setattr>:

long FAT32_setattr(struct dir_entry * dentry,unsigned long * attr)
{}
  8091f8:	f3 0f 1e fa          	endbr64 
  8091fc:	55                   	push   rbp
  8091fd:	48 89 e5             	mov    rbp,rsp
  809200:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809204:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  809208:	90                   	nop
  809209:	5d                   	pop    rbp
  80920a:	c3                   	ret    

000000000080920b <FAT32_compare>:
	.setattr = FAT32_setattr,
};


//// these operation need cache and list
long FAT32_compare(struct dir_entry * parent_dentry,char * source_filename,char * destination_filename){}
  80920b:	f3 0f 1e fa          	endbr64 
  80920f:	55                   	push   rbp
  809210:	48 89 e5             	mov    rbp,rsp
  809213:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809217:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80921b:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80921f:	90                   	nop
  809220:	5d                   	pop    rbp
  809221:	c3                   	ret    

0000000000809222 <FAT32_hash>:
long FAT32_hash(struct dir_entry * dentry,char * filename){}
  809222:	f3 0f 1e fa          	endbr64 
  809226:	55                   	push   rbp
  809227:	48 89 e5             	mov    rbp,rsp
  80922a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80922e:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  809232:	90                   	nop
  809233:	5d                   	pop    rbp
  809234:	c3                   	ret    

0000000000809235 <FAT32_release>:
long FAT32_release(struct dir_entry * dentry){}
  809235:	f3 0f 1e fa          	endbr64 
  809239:	55                   	push   rbp
  80923a:	48 89 e5             	mov    rbp,rsp
  80923d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809241:	90                   	nop
  809242:	5d                   	pop    rbp
  809243:	c3                   	ret    

0000000000809244 <FAT32_iput>:
long FAT32_iput(struct dir_entry * dentry,struct index_node * inode){}
  809244:	f3 0f 1e fa          	endbr64 
  809248:	55                   	push   rbp
  809249:	48 89 e5             	mov    rbp,rsp
  80924c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809250:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  809254:	90                   	nop
  809255:	5d                   	pop    rbp
  809256:	c3                   	ret    

0000000000809257 <fat32_write_superblock>:
	.release = FAT32_release,
	.iput = FAT32_iput,
};


void fat32_write_superblock(struct super_block * sb){}
  809257:	f3 0f 1e fa          	endbr64 
  80925b:	55                   	push   rbp
  80925c:	48 89 e5             	mov    rbp,rsp
  80925f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809263:	90                   	nop
  809264:	5d                   	pop    rbp
  809265:	c3                   	ret    

0000000000809266 <fat32_put_superblock>:

void fat32_put_superblock(struct super_block * sb)
{
  809266:	f3 0f 1e fa          	endbr64 
  80926a:	55                   	push   rbp
  80926b:	48 89 e5             	mov    rbp,rsp
  80926e:	48 83 ec 10          	sub    rsp,0x10
  809272:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
	vmfree(sb->private_sb_info);
  809276:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80927a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80927e:	48 89 c7             	mov    rdi,rax
  809281:	e8 f4 7e ff ff       	call   80117a <vmfree>
	vmfree(sb->root->dir_inode->private_index_info);
  809286:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80928a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80928d:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809291:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809295:	48 89 c7             	mov    rdi,rax
  809298:	e8 dd 7e ff ff       	call   80117a <vmfree>
	vmfree(sb->root->dir_inode);
  80929d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092a1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8092a4:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8092a8:	48 89 c7             	mov    rdi,rax
  8092ab:	e8 ca 7e ff ff       	call   80117a <vmfree>
	vmfree(sb->root);
  8092b0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092b4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8092b7:	48 89 c7             	mov    rdi,rax
  8092ba:	e8 bb 7e ff ff       	call   80117a <vmfree>
	vmfree(sb);
  8092bf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092c3:	48 89 c7             	mov    rdi,rax
  8092c6:	e8 af 7e ff ff       	call   80117a <vmfree>
}
  8092cb:	90                   	nop
  8092cc:	c9                   	leave  
  8092cd:	c3                   	ret    

00000000008092ce <fat32_write_inode>:

void fat32_write_inode(struct index_node * inode)
{
  8092ce:	f3 0f 1e fa          	endbr64 
  8092d2:	55                   	push   rbp
  8092d3:	48 89 e5             	mov    rbp,rsp
  8092d6:	48 83 ec 40          	sub    rsp,0x40
  8092da:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
	struct FAT32_Directory * fdentry = NULL;
  8092de:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8092e5:	00 
	struct FAT32_Directory * buf = NULL;
  8092e6:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8092ed:	00 
	struct FAT32_inode_info * finode = inode->private_index_info;
  8092ee:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8092f2:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8092f6:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	struct FAT32_sb_info * fsbi = inode->sb->private_sb_info;
  8092fa:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8092fe:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809302:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809306:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	unsigned long sector = 0;
  80930a:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  809311:	00 

	if(finode->dentry_location == 0)
  809312:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809316:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80931a:	48 85 c0             	test   rax,rax
  80931d:	75 14                	jne    809333 <fat32_write_inode+0x65>
	{
		printf("FS ERROR:write root inode!\n");	
  80931f:	bf ec 2f 81 00       	mov    edi,0x812fec
  809324:	b8 00 00 00 00       	mov    eax,0x0
  809329:	e8 a5 79 ff ff       	call   800cd3 <printf>
		return ;
  80932e:	e9 30 01 00 00       	jmp    809463 <fat32_write_inode+0x195>
	}

	sector = fsbi->Data_firstsector + (finode->dentry_location - 2) * fsbi->sector_per_cluster;
  809333:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809337:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  80933b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80933f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  809343:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  809347:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80934b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80934f:	48 0f af c2          	imul   rax,rdx
  809353:	48 01 c8             	add    rax,rcx
  809356:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	buf = (struct FAT32_Directory *)vmalloc(fsbi->bytes_per_cluster,0);
  80935a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80935e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809362:	be 00 00 00 00       	mov    esi,0x0
  809367:	48 89 c7             	mov    rdi,rax
  80936a:	b8 00 00 00 00       	mov    eax,0x0
  80936f:	e8 77 7d ff ff       	call   8010eb <vmalloc>
  809374:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	memset(buf,0,fsbi->bytes_per_cluster);
  809378:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80937c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809380:	89 c2                	mov    edx,eax
  809382:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809386:	be 00 00 00 00       	mov    esi,0x0
  80938b:	48 89 c7             	mov    rdi,rax
  80938e:	e8 bd 11 00 00       	call   80a550 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  809393:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809397:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80939b:	89 c1                	mov    ecx,eax
  80939d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8093a1:	89 c2                	mov    edx,eax
  8093a3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8093a7:	49 89 c0             	mov    r8,rax
  8093aa:	be 00 00 00 00       	mov    esi,0x0
  8093af:	bf 00 00 00 00       	mov    edi,0x0
  8093b4:	e8 72 d6 ff ff       	call   806a2b <request>
  8093b9:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    chk_result(r);
  8093bc:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8093bf:	89 c7                	mov    edi,eax
  8093c1:	e8 19 dd ff ff       	call   8070df <chk_result>
    fdentry = buf+finode->dentry_position;
  8093c6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8093ca:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8093ce:	48 c1 e0 05          	shl    rax,0x5
  8093d2:	48 89 c2             	mov    rdx,rax
  8093d5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8093d9:	48 01 d0             	add    rax,rdx
  8093dc:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

	////alert fat32 dentry data
	fdentry->DIR_FileSize = inode->file_size;
  8093e0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8093e4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8093e7:	89 c2                	mov    edx,eax
  8093e9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8093ed:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
	fdentry->DIR_FstClusLO = finode->first_cluster & 0xffff;
  8093f0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8093f4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8093f7:	89 c2                	mov    edx,eax
  8093f9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8093fd:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	fdentry->DIR_FstClusHI = (fdentry->DIR_FstClusHI & 0xf000) | (finode->first_cluster >> 16);
  809401:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809405:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  809409:	66 25 00 f0          	and    ax,0xf000
  80940d:	89 c2                	mov    edx,eax
  80940f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809413:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809416:	48 c1 e8 10          	shr    rax,0x10
  80941a:	09 c2                	or     edx,eax
  80941c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809420:	66 89 50 14          	mov    WORD PTR [rax+0x14],dx

	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  809424:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809428:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80942c:	89 c1                	mov    ecx,eax
  80942e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809432:	89 c2                	mov    edx,eax
  809434:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809438:	49 89 c0             	mov    r8,rax
  80943b:	be 01 00 00 00       	mov    esi,0x1
  809440:	bf 00 00 00 00       	mov    edi,0x0
  809445:	e8 e1 d5 ff ff       	call   806a2b <request>
  80944a:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    chk_result(r1);
  80944d:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
  809450:	89 c7                	mov    edi,eax
  809452:	e8 88 dc ff ff       	call   8070df <chk_result>
	vmfree(buf);
  809457:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80945b:	48 89 c7             	mov    rdi,rax
  80945e:	e8 17 7d ff ff       	call   80117a <vmfree>
}
  809463:	c9                   	leave  
  809464:	c3                   	ret    

0000000000809465 <fat32_read_superblock>:

	.write_inode = fat32_write_inode,
};

struct super_block * fat32_read_superblock(struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  809465:	f3 0f 1e fa          	endbr64 
  809469:	55                   	push   rbp
  80946a:	48 89 e5             	mov    rbp,rsp
  80946d:	48 83 ec 50          	sub    rsp,0x50
  809471:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  809475:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
	struct super_block * sbp = NULL;
  809479:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  809480:	00 
	struct FAT32_inode_info * finode = NULL;
  809481:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  809488:	00 
	struct FAT32_BootSector * fbs = NULL;
  809489:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  809490:	00 
	struct FAT32_sb_info * fsbi = NULL;
  809491:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  809498:	00 

	////super block
	sbp = (struct super_block *)vmalloc(sizeof(struct super_block),0);
  809499:	be 00 00 00 00       	mov    esi,0x0
  80949e:	bf 18 00 00 00       	mov    edi,0x18
  8094a3:	b8 00 00 00 00       	mov    eax,0x0
  8094a8:	e8 3e 7c ff ff       	call   8010eb <vmalloc>
  8094ad:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	memset(sbp,0,sizeof(struct super_block));
  8094b1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8094b5:	ba 18 00 00 00       	mov    edx,0x18
  8094ba:	be 00 00 00 00       	mov    esi,0x0
  8094bf:	48 89 c7             	mov    rdi,rax
  8094c2:	e8 89 10 00 00       	call   80a550 <memset>

	sbp->sb_ops = &FAT32_sb_ops;
  8094c7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8094cb:	48 c7 40 08 20 b1 80 	mov    QWORD PTR [rax+0x8],0x80b120
  8094d2:	00 
	sbp->private_sb_info = (struct FAT32_sb_info *)vmalloc(sizeof(struct FAT32_sb_info),0);
  8094d3:	be 00 00 00 00       	mov    esi,0x0
  8094d8:	bf 60 00 00 00       	mov    edi,0x60
  8094dd:	b8 00 00 00 00       	mov    eax,0x0
  8094e2:	e8 04 7c ff ff       	call   8010eb <vmalloc>
  8094e7:	48 89 c2             	mov    rdx,rax
  8094ea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8094ee:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	memset(sbp->private_sb_info,0,sizeof(struct FAT32_sb_info));
  8094f2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8094f6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8094fa:	ba 60 00 00 00       	mov    edx,0x60
  8094ff:	be 00 00 00 00       	mov    esi,0x0
  809504:	48 89 c7             	mov    rdi,rax
  809507:	e8 44 10 00 00       	call   80a550 <memset>

	////fat32 boot sector
	fbs = (struct FAT32_BootSector *)buf;
  80950c:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  809510:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
 	fsbi = sbp->private_sb_info;
  809514:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809518:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80951c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	fsbi->start_sector = DPTE->start_LBA;
  809520:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809524:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809527:	89 c2                	mov    edx,eax
  809529:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80952d:	48 89 10             	mov    QWORD PTR [rax],rdx
	fsbi->sector_count = DPTE->sectors_limit;
  809530:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809534:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  809537:	89 c2                	mov    edx,eax
  809539:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80953d:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	fsbi->sector_per_cluster = fbs->BPB_SecPerClus;
  809541:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809545:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  809549:	0f b6 d0             	movzx  edx,al
  80954c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809550:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	fsbi->bytes_per_cluster = fbs->BPB_SecPerClus * fbs->BPB_BytesPerSec;
  809554:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809558:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  80955c:	0f b6 d0             	movzx  edx,al
  80955f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809563:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  809567:	0f b7 c0             	movzx  eax,ax
  80956a:	0f af c2             	imul   eax,edx
  80956d:	48 63 d0             	movsxd rdx,eax
  809570:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809574:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	fsbi->bytes_per_sector = fbs->BPB_BytesPerSec;
  809578:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80957c:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  809580:	0f b7 d0             	movzx  edx,ax
  809583:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809587:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
	fsbi->Data_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt + fbs->BPB_FATSz32 * fbs->BPB_NumFATs;
  80958b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80958f:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  809592:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809596:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  80959a:	0f b7 c0             	movzx  eax,ax
  80959d:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  8095a0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8095a4:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  8095a7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8095ab:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  8095af:	0f b6 c0             	movzx  eax,al
  8095b2:	0f af c2             	imul   eax,edx
  8095b5:	01 c8                	add    eax,ecx
  8095b7:	89 c2                	mov    edx,eax
  8095b9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8095bd:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
	fsbi->FAT1_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt;
  8095c1:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8095c5:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  8095c8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8095cc:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  8095d0:	0f b7 c0             	movzx  eax,ax
  8095d3:	01 d0                	add    eax,edx
  8095d5:	89 c2                	mov    edx,eax
  8095d7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8095db:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	fsbi->sector_per_FAT = fbs->BPB_FATSz32;
  8095df:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8095e3:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  8095e6:	89 c2                	mov    edx,eax
  8095e8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8095ec:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
	fsbi->NumFATs = fbs->BPB_NumFATs;
  8095f0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8095f4:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  8095f8:	0f b6 d0             	movzx  edx,al
  8095fb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8095ff:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
	fsbi->fsinfo_sector_infat = fbs->BPB_FSInfo;
  809603:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809607:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80960b:	0f b7 d0             	movzx  edx,ax
  80960e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809612:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
	fsbi->bootsector_bk_infat = fbs->BPB_BkBootSec;	
  809616:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80961a:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  80961e:	0f b7 d0             	movzx  edx,ax
  809621:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809625:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
	
	printf("FAT32 Boot Sector\n\tBPB_FSInfo:%x\n\tBPB_BkBootSec:%x\n\tBPB_TotSec32:%x\n",fbs->BPB_FSInfo,fbs->BPB_BkBootSec,fbs->BPB_TotSec32);
  809629:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80962d:	8b 48 20             	mov    ecx,DWORD PTR [rax+0x20]
  809630:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809634:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  809638:	0f b7 d0             	movzx  edx,ax
  80963b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80963f:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  809643:	0f b7 c0             	movzx  eax,ax
  809646:	89 c6                	mov    esi,eax
  809648:	bf 08 30 81 00       	mov    edi,0x813008
  80964d:	b8 00 00 00 00       	mov    eax,0x0
  809652:	e8 7c 76 ff ff       	call   800cd3 <printf>
	
	////fat32 fsinfo sector
	fsbi->fat_fsinfo = (struct FAT32_FSInfo *)vmalloc(sizeof(struct FAT32_FSInfo),0);
  809657:	be 00 00 00 00       	mov    esi,0x0
  80965c:	bf 00 02 00 00       	mov    edi,0x200
  809661:	b8 00 00 00 00       	mov    eax,0x0
  809666:	e8 80 7a ff ff       	call   8010eb <vmalloc>
  80966b:	48 89 c2             	mov    rdx,rax
  80966e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809672:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
	memset(fsbi->fat_fsinfo,0,512);
  809676:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80967a:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80967e:	ba 00 02 00 00       	mov    edx,0x200
  809683:	be 00 00 00 00       	mov    esi,0x0
  809688:	48 89 c7             	mov    rdi,rax
  80968b:	e8 c0 0e 00 00       	call   80a550 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPTE->start_LBA + fbs->BPB_FSInfo,1,(unsigned char *)fsbi->fat_fsinfo);
  809690:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809694:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  809698:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80969c:	8b 48 08             	mov    ecx,DWORD PTR [rax+0x8]
  80969f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8096a3:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  8096a7:	0f b7 c0             	movzx  eax,ax
  8096aa:	01 c8                	add    eax,ecx
  8096ac:	49 89 d0             	mov    r8,rdx
  8096af:	b9 01 00 00 00       	mov    ecx,0x1
  8096b4:	89 c2                	mov    edx,eax
  8096b6:	be 00 00 00 00       	mov    esi,0x0
  8096bb:	bf 00 00 00 00       	mov    edi,0x0
  8096c0:	e8 66 d3 ff ff       	call   806a2b <request>
  8096c5:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    chk_result(r);
  8096c8:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8096cb:	89 c7                	mov    edi,eax
  8096cd:	e8 0d da ff ff       	call   8070df <chk_result>
	printf("FAT32 FSInfo\n\tFSI_LeadSig:%x\n\tFSI_StrucSig:%x\n\tFSI_Free_Count:%x\n",fsbi->fat_fsinfo->FSI_LeadSig,fsbi->fat_fsinfo->FSI_StrucSig,fsbi->fat_fsinfo->FSI_Free_Count);
  8096d2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8096d6:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  8096da:	8b 88 e8 01 00 00    	mov    ecx,DWORD PTR [rax+0x1e8]
  8096e0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8096e4:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  8096e8:	8b 90 e4 01 00 00    	mov    edx,DWORD PTR [rax+0x1e4]
  8096ee:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8096f2:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  8096f6:	8b 00                	mov    eax,DWORD PTR [rax]
  8096f8:	89 c6                	mov    esi,eax
  8096fa:	bf 50 30 81 00       	mov    edi,0x813050
  8096ff:	b8 00 00 00 00       	mov    eax,0x0
  809704:	e8 ca 75 ff ff       	call   800cd3 <printf>
	
	////directory entry
	sbp->root = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  809709:	be 00 00 00 00       	mov    esi,0x0
  80970e:	bf 48 00 00 00       	mov    edi,0x48
  809713:	b8 00 00 00 00       	mov    eax,0x0
  809718:	e8 ce 79 ff ff       	call   8010eb <vmalloc>
  80971d:	48 89 c2             	mov    rdx,rax
  809720:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809724:	48 89 10             	mov    QWORD PTR [rax],rdx
	memset(sbp->root,0,sizeof(struct dir_entry));
  809727:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80972b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80972e:	ba 48 00 00 00       	mov    edx,0x48
  809733:	be 00 00 00 00       	mov    esi,0x0
  809738:	48 89 c7             	mov    rdi,rax
  80973b:	e8 10 0e 00 00       	call   80a550 <memset>

	list_init(&sbp->root->child_node);
  809740:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809744:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809747:	48 83 c0 10          	add    rax,0x10
  80974b:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    list->prev = list;
  80974f:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809753:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  809757:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  80975a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80975e:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  809762:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  809766:	90                   	nop
	list_init(&sbp->root->subdirs_list);
  809767:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80976b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80976e:	48 83 c0 20          	add    rax,0x20
  809772:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    list->prev = list;
  809776:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80977a:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80977e:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  809781:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809785:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809789:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  80978d:	90                   	nop
	sbp->root->parent = sbp->root;
  80978e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809792:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809795:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  809799:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  80979c:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
	sbp->root->dir_ops = &FAT32_dentry_ops;
  8097a0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8097a4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8097a7:	48 c7 40 40 00 b1 80 	mov    QWORD PTR [rax+0x40],0x80b100
  8097ae:	00 
	sbp->root->name = (char *)vmalloc(2,0);
  8097af:	be 00 00 00 00       	mov    esi,0x0
  8097b4:	bf 02 00 00 00       	mov    edi,0x2
  8097b9:	b8 00 00 00 00       	mov    eax,0x0
  8097be:	e8 28 79 ff ff       	call   8010eb <vmalloc>
  8097c3:	48 89 c2             	mov    rdx,rax
  8097c6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8097ca:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8097cd:	48 89 10             	mov    QWORD PTR [rax],rdx
	sbp->root->name[0] = '/';
  8097d0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8097d4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8097d7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8097da:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
	sbp->root->name_length = 1;
  8097dd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8097e1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8097e4:	c7 40 08 01 00 00 00 	mov    DWORD PTR [rax+0x8],0x1

	////index node
	sbp->root->dir_inode = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  8097eb:	be 00 00 00 00       	mov    esi,0x0
  8097f0:	bf 38 00 00 00       	mov    edi,0x38
  8097f5:	b8 00 00 00 00       	mov    eax,0x0
  8097fa:	e8 ec 78 ff ff       	call   8010eb <vmalloc>
  8097ff:	48 89 c2             	mov    rdx,rax
  809802:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809806:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809809:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(sbp->root->dir_inode,0,sizeof(struct index_node));
  80980d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809811:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809814:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809818:	ba 38 00 00 00       	mov    edx,0x38
  80981d:	be 00 00 00 00       	mov    esi,0x0
  809822:	48 89 c7             	mov    rdi,rax
  809825:	e8 26 0d 00 00       	call   80a550 <memset>
	sbp->root->dir_inode->inode_ops = &FAT32_inode_ops;
  80982a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80982e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809831:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809835:	48 c7 40 28 c0 b0 80 	mov    QWORD PTR [rax+0x28],0x80b0c0
  80983c:	00 
	sbp->root->dir_inode->f_ops = &FAT32_file_ops;
  80983d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809841:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809844:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809848:	48 c7 40 20 80 b0 80 	mov    QWORD PTR [rax+0x20],0x80b080
  80984f:	00 
	sbp->root->dir_inode->file_size = 0;
  809850:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809854:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809857:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80985b:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
	sbp->root->dir_inode->blocks = (sbp->root->dir_inode->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  809862:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809866:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809869:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80986d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809870:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809874:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809878:	48 01 d0             	add    rax,rdx
  80987b:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  80987f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809883:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  809887:	48 89 c6             	mov    rsi,rax
  80988a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80988e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809891:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  809895:	48 89 d0             	mov    rax,rdx
  809898:	ba 00 00 00 00       	mov    edx,0x0
  80989d:	48 f7 f6             	div    rsi
  8098a0:	48 89 41 08          	mov    QWORD PTR [rcx+0x8],rax
	sbp->root->dir_inode->attribute = FS_ATTR_DIR;
  8098a4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8098a8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8098ab:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8098af:	48 c7 40 10 02 00 00 	mov    QWORD PTR [rax+0x10],0x2
  8098b6:	00 
	sbp->root->dir_inode->sb = sbp;
  8098b7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8098bb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8098be:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8098c2:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8098c6:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx

	////fat32 root inode
	sbp->root->dir_inode->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  8098ca:	be 00 00 00 00       	mov    esi,0x0
  8098cf:	bf 20 00 00 00       	mov    edi,0x20
  8098d4:	b8 00 00 00 00       	mov    eax,0x0
  8098d9:	e8 0d 78 ff ff       	call   8010eb <vmalloc>
  8098de:	48 89 c2             	mov    rdx,rax
  8098e1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8098e5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8098e8:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8098ec:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(sbp->root->dir_inode->private_index_info,0,sizeof(struct FAT32_inode_info));
  8098f0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8098f4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8098f7:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8098fb:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8098ff:	ba 20 00 00 00       	mov    edx,0x20
  809904:	be 00 00 00 00       	mov    esi,0x0
  809909:	48 89 c7             	mov    rdi,rax
  80990c:	e8 3f 0c 00 00       	call   80a550 <memset>
	finode = (struct FAT32_inode_info *)sbp->root->dir_inode->private_index_info;
  809911:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809915:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809918:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80991c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809920:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	finode->first_cluster = fbs->BPB_RootClus;
  809924:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809928:	8b 40 2c             	mov    eax,DWORD PTR [rax+0x2c]
  80992b:	89 c2                	mov    edx,eax
  80992d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809931:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = 0;
  809934:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809938:	48 c7 40 08 00 00 00 	mov    QWORD PTR [rax+0x8],0x0
  80993f:	00 
	finode->dentry_position = 0; 
  809940:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809944:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  80994b:	00 
	finode->create_date = 0;
  80994c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809950:	66 c7 40 18 00 00    	mov    WORD PTR [rax+0x18],0x0
	finode->create_time = 0;
  809956:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80995a:	66 c7 40 1a 00 00    	mov    WORD PTR [rax+0x1a],0x0
	finode->write_date = 0;
  809960:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809964:	66 c7 40 1c 00 00    	mov    WORD PTR [rax+0x1c],0x0
	finode->write_time = 0;
  80996a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80996e:	66 c7 40 1e 00 00    	mov    WORD PTR [rax+0x1e],0x0

	return sbp;
  809974:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  809978:	c9                   	leave  
  809979:	c3                   	ret    

000000000080997a <DISK1_FAT32_FS_init>:
	.read_superblock = fat32_read_superblock,
	.next = NULL,
};

void DISK1_FAT32_FS_init()
{
  80997a:	f3 0f 1e fa          	endbr64 
  80997e:	55                   	push   rbp
  80997f:	48 89 e5             	mov    rbp,rsp
  809982:	48 81 ec 10 04 00 00 	sub    rsp,0x410
	int i;
	unsigned char buf[512];
	struct dir_entry * dentry = NULL;
  809989:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  809990:	00 
	struct Disk_Partition_Table DPT = {0};
  809991:	48 8d 95 f0 fb ff ff 	lea    rdx,[rbp-0x410]
  809998:	b8 00 00 00 00       	mov    eax,0x0
  80999d:	b9 40 00 00 00       	mov    ecx,0x40
  8099a2:	48 89 d7             	mov    rdi,rdx
  8099a5:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax

	register_filesystem(&FAT32_fs_type);
  8099a8:	bf 40 b1 80 00       	mov    edi,0x80b140
  8099ad:	e8 c0 ca ff ff       	call   806472 <register_filesystem>
	
	memset(buf,0,512);
  8099b2:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  8099b9:	ba 00 02 00 00       	mov    edx,0x200
  8099be:	be 00 00 00 00       	mov    esi,0x0
  8099c3:	48 89 c7             	mov    rdi,rax
  8099c6:	e8 85 0b 00 00       	call   80a550 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,0x0,1,(unsigned char *)buf);
  8099cb:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  8099d2:	49 89 c0             	mov    r8,rax
  8099d5:	b9 01 00 00 00       	mov    ecx,0x1
  8099da:	ba 00 00 00 00       	mov    edx,0x0
  8099df:	be 00 00 00 00       	mov    esi,0x0
  8099e4:	bf 00 00 00 00       	mov    edi,0x0
  8099e9:	e8 3d d0 ff ff       	call   806a2b <request>
  8099ee:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    chk_result(r);
  8099f1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8099f4:	89 c7                	mov    edi,eax
  8099f6:	e8 e4 d6 ff ff       	call   8070df <chk_result>
    DPT = *(struct Disk_Partition_Table *)buf;
  8099fb:	48 8d 95 f0 fd ff ff 	lea    rdx,[rbp-0x210]
  809a02:	48 8d 85 f0 fb ff ff 	lea    rax,[rbp-0x410]
  809a09:	48 89 d6             	mov    rsi,rdx
  809a0c:	ba 40 00 00 00       	mov    edx,0x40
  809a11:	48 89 c7             	mov    rdi,rax
  809a14:	48 89 d1             	mov    rcx,rdx
  809a17:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
	printf("DPTE[0] start_LBA:%x\ttype:%x\n",DPT.DPTE[0].start_LBA,DPT.DPTE[0].type);
  809a1a:	0f b6 85 b2 fd ff ff 	movzx  eax,BYTE PTR [rbp-0x24e]
  809a21:	0f b6 d0             	movzx  edx,al
  809a24:	8b 85 b6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x24a]
  809a2a:	89 c6                	mov    esi,eax
  809a2c:	bf 98 30 81 00       	mov    edi,0x813098
  809a31:	b8 00 00 00 00       	mov    eax,0x0
  809a36:	e8 98 72 ff ff       	call   800cd3 <printf>

	memset(buf,0,512);
  809a3b:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  809a42:	ba 00 02 00 00       	mov    edx,0x200
  809a47:	be 00 00 00 00       	mov    esi,0x0
  809a4c:	48 89 c7             	mov    rdi,rax
  809a4f:	e8 fc 0a 00 00       	call   80a550 <memset>
	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPT.DPTE[0].start_LBA,1,(unsigned char *)buf);
  809a54:	8b 85 b6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x24a]
  809a5a:	89 c2                	mov    edx,eax
  809a5c:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  809a63:	49 89 c0             	mov    r8,rax
  809a66:	b9 01 00 00 00       	mov    ecx,0x1
  809a6b:	be 00 00 00 00       	mov    esi,0x0
  809a70:	bf 00 00 00 00       	mov    edi,0x0
  809a75:	e8 b1 cf ff ff       	call   806a2b <request>
  809a7a:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    chk_result(r1);
  809a7d:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809a80:	89 c7                	mov    edi,eax
  809a82:	e8 58 d6 ff ff       	call   8070df <chk_result>

	root_sb = mount_fs("FAT32",&DPT.DPTE[0],buf);	//not dev node
  809a87:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  809a8e:	48 8d 95 f0 fb ff ff 	lea    rdx,[rbp-0x410]
  809a95:	48 8d 8a be 01 00 00 	lea    rcx,[rdx+0x1be]
  809a9c:	48 89 c2             	mov    rdx,rax
  809a9f:	48 89 ce             	mov    rsi,rcx
  809aa2:	bf 92 30 81 00       	mov    edi,0x813092
  809aa7:	e8 4e c9 ff ff       	call   8063fa <mount_fs>
  809aac:	48 89 05 d5 da c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1dad5],rax        # 427588 <root_sb>
}
  809ab3:	90                   	nop
  809ab4:	c9                   	leave  
  809ab5:	c3                   	ret    

0000000000809ab6 <scrdown>:
//{
//    video_base=addr;
//    m_ptr=addr;
//}
void scrdown(void)
{
  809ab6:	f3 0f 1e fa          	endbr64 
  809aba:	55                   	push   rbp
  809abb:	48 89 e5             	mov    rbp,rsp
    vpage_base+=SCREEN_W*2;
  809abe:	48 8b 05 43 0a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20a43]        # 42a508 <vpage_base>
  809ac5:	48 05 a0 00 00 00    	add    rax,0xa0
  809acb:	48 89 05 36 0a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20a36],rax        # 42a508 <vpage_base>
    page_boffset+=SCREEN_W*2;
  809ad2:	8b 05 38 0a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20a38]        # 42a510 <page_boffset>
  809ad8:	05 a0 00 00 00       	add    eax,0xa0
  809add:	89 05 2d 0a c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20a2d],eax        # 42a510 <page_boffset>
    if(vpage_base>=video_end)
  809ae3:	48 8b 15 1e 0a c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc20a1e]        # 42a508 <vpage_base>
  809aea:	48 8b 05 0f 0a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20a0f]        # 42a500 <video_end>
  809af1:	48 39 c2             	cmp    rdx,rax
  809af4:	72 0e                	jb     809b04 <scrdown+0x4e>
        vpage_base=video_base;
  809af6:	48 8b 05 fb 09 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc209fb]        # 42a4f8 <video_base>
  809afd:	48 89 05 04 0a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20a04],rax        # 42a508 <vpage_base>
    set_origin();
  809b04:	b8 00 00 00 00       	mov    eax,0x0
  809b09:	e8 6a 00 00 00       	call   809b78 <set_origin>
}
  809b0e:	90                   	nop
  809b0f:	5d                   	pop    rbp
  809b10:	c3                   	ret    

0000000000809b11 <scrup>:
void scrup()
{
  809b11:	f3 0f 1e fa          	endbr64 
  809b15:	55                   	push   rbp
  809b16:	48 89 e5             	mov    rbp,rsp
    if(page_boffset<=0)
  809b19:	8b 05 f1 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc209f1]        # 42a510 <page_boffset>
  809b1f:	85 c0                	test   eax,eax
  809b21:	75 24                	jne    809b47 <scrup+0x36>
    {
        page_boffset=0;
  809b23:	c7 05 e3 09 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc209e3],0x0        # 42a510 <page_boffset>
  809b2a:	00 00 00 
        vpage_base=video_base;
  809b2d:	48 8b 05 c4 09 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc209c4]        # 42a4f8 <video_base>
  809b34:	48 89 05 cd 09 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc209cd],rax        # 42a508 <vpage_base>
        set_origin();
  809b3b:	b8 00 00 00 00       	mov    eax,0x0
  809b40:	e8 33 00 00 00       	call   809b78 <set_origin>
        return;
  809b45:	eb 2f                	jmp    809b76 <scrup+0x65>
    }
    vpage_base-=SCREEN_W*2;
  809b47:	48 8b 05 ba 09 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc209ba]        # 42a508 <vpage_base>
  809b4e:	48 2d a0 00 00 00    	sub    rax,0xa0
  809b54:	48 89 05 ad 09 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc209ad],rax        # 42a508 <vpage_base>
    page_boffset-=SCREEN_W*2;
  809b5b:	8b 05 af 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc209af]        # 42a510 <page_boffset>
  809b61:	2d a0 00 00 00       	sub    eax,0xa0
  809b66:	89 05 a4 09 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc209a4],eax        # 42a510 <page_boffset>
    set_origin();
  809b6c:	b8 00 00 00 00       	mov    eax,0x0
  809b71:	e8 02 00 00 00       	call   809b78 <set_origin>
}
  809b76:	5d                   	pop    rbp
  809b77:	c3                   	ret    

0000000000809b78 <set_origin>:
void set_origin(void)
{
  809b78:	f3 0f 1e fa          	endbr64 
  809b7c:	55                   	push   rbp
  809b7d:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  809b80:	fa                   	cli    
    outb(port_reg_index,12);
  809b81:	8b 05 99 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20999]        # 42a520 <port_reg_index>
  809b87:	0f b7 c0             	movzx  eax,ax
  809b8a:	be 0c 00 00 00       	mov    esi,0xc
  809b8f:	89 c7                	mov    edi,eax
  809b91:	e8 9a b2 ff ff       	call   804e30 <outb>
    outb(port_reg_v,(page_boffset>>9)&0xff);
  809b96:	8b 05 74 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20974]        # 42a510 <page_boffset>
  809b9c:	c1 e8 09             	shr    eax,0x9
  809b9f:	0f b6 d0             	movzx  edx,al
  809ba2:	8b 05 7c 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2097c]        # 42a524 <port_reg_v>
  809ba8:	0f b7 c0             	movzx  eax,ax
  809bab:	89 d6                	mov    esi,edx
  809bad:	89 c7                	mov    edi,eax
  809baf:	e8 7c b2 ff ff       	call   804e30 <outb>
    outb(port_reg_index,13);
  809bb4:	8b 05 66 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20966]        # 42a520 <port_reg_index>
  809bba:	0f b7 c0             	movzx  eax,ax
  809bbd:	be 0d 00 00 00       	mov    esi,0xd
  809bc2:	89 c7                	mov    edi,eax
  809bc4:	e8 67 b2 ff ff       	call   804e30 <outb>
    outb(port_reg_v,(page_boffset>>1)&0xff);
  809bc9:	8b 05 41 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20941]        # 42a510 <page_boffset>
  809bcf:	d1 e8                	shr    eax,1
  809bd1:	0f b6 d0             	movzx  edx,al
  809bd4:	8b 05 4a 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2094a]        # 42a524 <port_reg_v>
  809bda:	0f b7 c0             	movzx  eax,ax
  809bdd:	89 d6                	mov    esi,edx
  809bdf:	89 c7                	mov    edi,eax
  809be1:	e8 4a b2 ff ff       	call   804e30 <outb>
    asm volatile("sti");
  809be6:	fb                   	sti    

}
  809be7:	90                   	nop
  809be8:	5d                   	pop    rbp
  809be9:	c3                   	ret    

0000000000809bea <init_tty>:
        .type=DEV_TYPE_CHRDEV,
        .flag=DEV_FLAG_USED,
        .drv=&drv_tty
};
void init_tty()
{
  809bea:	f3 0f 1e fa          	endbr64 
  809bee:	55                   	push   rbp
  809bef:	48 89 e5             	mov    rbp,rsp
  809bf2:	48 83 ec 10          	sub    rsp,0x10
    strcpy(dev_tty.name,"tty0");
  809bf6:	be c8 32 81 00       	mov    esi,0x8132c8
  809bfb:	bf 74 31 81 00       	mov    edi,0x813174
  809c00:	e8 9a 09 00 00       	call   80a59f <strcpy>
    strcpy(dev_stdout.name,"stdout");
  809c05:	be cd 32 81 00       	mov    esi,0x8132cd
  809c0a:	bf 34 32 81 00       	mov    edi,0x813234
  809c0f:	e8 8b 09 00 00       	call   80a59f <strcpy>
    reg_driver(&drv_tty);
  809c14:	bf c0 30 81 00       	mov    edi,0x8130c0
  809c19:	e8 1e 91 ff ff       	call   802d3c <reg_driver>
    reg_device(&dev_tty);
  809c1e:	bf 60 31 81 00       	mov    edi,0x813160
  809c23:	e8 2c 8e ff ff       	call   802a54 <reg_device>
    reg_device(&dev_stdout);
  809c28:	bf 20 32 81 00       	mov    edi,0x813220
  809c2d:	e8 22 8e ff ff       	call   802a54 <reg_device>
    unsigned char *vp=0x20000;
  809c32:	48 c7 45 f8 00 00 02 	mov    QWORD PTR [rbp-0x8],0x20000
  809c39:	00 
    if(*vp==0x7)
  809c3a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809c3e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809c41:	3c 07                	cmp    al,0x7
  809c43:	75 36                	jne    809c7b <init_tty+0x91>
    {
        video_mode=VIDEO_MONOTEXT;
  809c45:	c7 05 c5 08 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc208c5],0x0        # 42a514 <video_mode>
  809c4c:	00 00 00 
        video_base=0xb0000;
  809c4f:	48 c7 05 9e 08 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2089e],0xb0000        # 42a4f8 <video_base>
  809c56:	00 00 0b 00 
        video_end=0xb8000-1;
  809c5a:	48 c7 05 9b 08 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2089b],0xb7fff        # 42a500 <video_end>
  809c61:	ff 7f 0b 00 
        port_reg_index=0x3b4;
  809c65:	c7 05 b1 08 c2 ff b4 	mov    DWORD PTR [rip+0xffffffffffc208b1],0x3b4        # 42a520 <port_reg_index>
  809c6c:	03 00 00 
        port_reg_v=0x3b5;
  809c6f:	c7 05 ab 08 c2 ff b5 	mov    DWORD PTR [rip+0xffffffffffc208ab],0x3b5        # 42a524 <port_reg_v>
  809c76:	03 00 00 
  809c79:	eb 61                	jmp    809cdc <init_tty+0xf2>
    }else if(*vp<=0x3)
  809c7b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809c7f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809c82:	3c 03                	cmp    al,0x3
  809c84:	77 36                	ja     809cbc <init_tty+0xd2>
    {
        video_mode=VIDEO_CHROMATEXT;
  809c86:	c7 05 84 08 c2 ff 01 	mov    DWORD PTR [rip+0xffffffffffc20884],0x1        # 42a514 <video_mode>
  809c8d:	00 00 00 
        video_base=0xb8000;
  809c90:	48 c7 05 5d 08 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2085d],0xb8000        # 42a4f8 <video_base>
  809c97:	00 80 0b 00 
        video_end=0xc0000-1;
  809c9b:	48 c7 05 5a 08 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2085a],0xbffff        # 42a500 <video_end>
  809ca2:	ff ff 0b 00 
        port_reg_index=0x3d4;
  809ca6:	c7 05 70 08 c2 ff d4 	mov    DWORD PTR [rip+0xffffffffffc20870],0x3d4        # 42a520 <port_reg_index>
  809cad:	03 00 00 
        port_reg_v=0x3d5;
  809cb0:	c7 05 6a 08 c2 ff d5 	mov    DWORD PTR [rip+0xffffffffffc2086a],0x3d5        # 42a524 <port_reg_v>
  809cb7:	03 00 00 
  809cba:	eb 20                	jmp    809cdc <init_tty+0xf2>
    }else{
        video_mode=VIDEO_GRAPHICS;
  809cbc:	c7 05 4e 08 c2 ff 02 	mov    DWORD PTR [rip+0xffffffffffc2084e],0x2        # 42a514 <video_mode>
  809cc3:	00 00 00 
        video_base=0xa0000;
  809cc6:	48 c7 05 27 08 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20827],0xa0000        # 42a4f8 <video_base>
  809ccd:	00 00 0a 00 
        video_end=0xb0000-1;
  809cd1:	48 c7 05 24 08 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20824],0xaffff        # 42a500 <video_end>
  809cd8:	ff ff 0a 00 
    }
    if(*vp<=0x1)line_chs=40;
  809cdc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809ce0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809ce3:	3c 01                	cmp    al,0x1
  809ce5:	77 0f                	ja     809cf6 <init_tty+0x10c>
  809ce7:	c7 05 2b 08 c2 ff 28 	mov    DWORD PTR [rip+0xffffffffffc2082b],0x28        # 42a51c <line_chs>
  809cee:	00 00 00 
  809cf1:	e9 91 00 00 00       	jmp    809d87 <init_tty+0x19d>
    else if(*vp<=0x3||*vp==0x7)line_chs=80;
  809cf6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809cfa:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809cfd:	3c 03                	cmp    al,0x3
  809cff:	76 0b                	jbe    809d0c <init_tty+0x122>
  809d01:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d05:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d08:	3c 07                	cmp    al,0x7
  809d0a:	75 0c                	jne    809d18 <init_tty+0x12e>
  809d0c:	c7 05 06 08 c2 ff 50 	mov    DWORD PTR [rip+0xffffffffffc20806],0x50        # 42a51c <line_chs>
  809d13:	00 00 00 
  809d16:	eb 6f                	jmp    809d87 <init_tty+0x19d>
    else if(*vp<=0x5||*vp==0x9||*vp==0xd)line_chs=320;
  809d18:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d1c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d1f:	3c 05                	cmp    al,0x5
  809d21:	76 16                	jbe    809d39 <init_tty+0x14f>
  809d23:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d27:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d2a:	3c 09                	cmp    al,0x9
  809d2c:	74 0b                	je     809d39 <init_tty+0x14f>
  809d2e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d32:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d35:	3c 0d                	cmp    al,0xd
  809d37:	75 0c                	jne    809d45 <init_tty+0x15b>
  809d39:	c7 05 d9 07 c2 ff 40 	mov    DWORD PTR [rip+0xffffffffffc207d9],0x140        # 42a51c <line_chs>
  809d40:	01 00 00 
  809d43:	eb 42                	jmp    809d87 <init_tty+0x19d>
    else if(*vp==0x6||*vp==0xa||*vp>=0xe)line_chs=640;
  809d45:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d49:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d4c:	3c 06                	cmp    al,0x6
  809d4e:	74 16                	je     809d66 <init_tty+0x17c>
  809d50:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d54:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d57:	3c 0a                	cmp    al,0xa
  809d59:	74 0b                	je     809d66 <init_tty+0x17c>
  809d5b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d5f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d62:	3c 0d                	cmp    al,0xd
  809d64:	76 0c                	jbe    809d72 <init_tty+0x188>
  809d66:	c7 05 ac 07 c2 ff 80 	mov    DWORD PTR [rip+0xffffffffffc207ac],0x280        # 42a51c <line_chs>
  809d6d:	02 00 00 
  809d70:	eb 15                	jmp    809d87 <init_tty+0x19d>
    else if(*vp==0x8)line_chs=160;
  809d72:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d76:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d79:	3c 08                	cmp    al,0x8
  809d7b:	75 0a                	jne    809d87 <init_tty+0x19d>
  809d7d:	c7 05 95 07 c2 ff a0 	mov    DWORD PTR [rip+0xffffffffffc20795],0xa0        # 42a51c <line_chs>
  809d84:	00 00 00 
    switch (*vp)
  809d87:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d8b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d8e:	0f b6 c0             	movzx  eax,al
  809d91:	83 f8 14             	cmp    eax,0x14
  809d94:	77 61                	ja     809df7 <init_tty+0x20d>
  809d96:	89 c0                	mov    eax,eax
  809d98:	48 8b 04 c5 d8 32 81 	mov    rax,QWORD PTR [rax*8+0x8132d8]
  809d9f:	00 
  809da0:	3e ff e0             	notrack jmp rax
    {
    case 0x0:case 0x1:vpage_size=40*25;break;
  809da3:	c7 05 7b 07 c2 ff e8 	mov    DWORD PTR [rip+0xffffffffffc2077b],0x3e8        # 42a528 <vpage_size>
  809daa:	03 00 00 
  809dad:	eb 49                	jmp    809df8 <init_tty+0x20e>
    case 2:case 3:case 7:vpage_size=80*25;break;
  809daf:	c7 05 6f 07 c2 ff d0 	mov    DWORD PTR [rip+0xffffffffffc2076f],0x7d0        # 42a528 <vpage_size>
  809db6:	07 00 00 
  809db9:	eb 3d                	jmp    809df8 <init_tty+0x20e>
    case 4:case 5:case 9:case 0xd:vpage_size=320*200;break;
  809dbb:	c7 05 63 07 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20763],0xfa00        # 42a528 <vpage_size>
  809dc2:	fa 00 00 
  809dc5:	eb 31                	jmp    809df8 <init_tty+0x20e>
    case 6:case 0xa:case 0xe:vpage_size=640*200;break;
  809dc7:	c7 05 57 07 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20757],0x1f400        # 42a528 <vpage_size>
  809dce:	f4 01 00 
  809dd1:	eb 25                	jmp    809df8 <init_tty+0x20e>
    case 8:vpage_size=160*200;break;
  809dd3:	c7 05 4b 07 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc2074b],0x7d00        # 42a528 <vpage_size>
  809dda:	7d 00 00 
  809ddd:	eb 19                	jmp    809df8 <init_tty+0x20e>
    case 0xf:case 0x10:case 0x11:vpage_size=640*350;break;
  809ddf:	c7 05 3f 07 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc2073f],0x36b00        # 42a528 <vpage_size>
  809de6:	6b 03 00 
  809de9:	eb 0d                	jmp    809df8 <init_tty+0x20e>
    case 0x12:case 0x13:case 0x14:vpage_size=640*480;break;
  809deb:	c7 05 33 07 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20733],0x4b000        # 42a528 <vpage_size>
  809df2:	b0 04 00 
  809df5:	eb 01                	jmp    809df8 <init_tty+0x20e>
    default:
        break;
  809df7:	90                   	nop
    }
    m_ptr=video_base;
  809df8:	48 8b 05 f9 06 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc206f9]        # 42a4f8 <video_base>
  809dff:	48 89 05 5a 13 00 00 	mov    QWORD PTR [rip+0x135a],rax        # 80b160 <m_ptr>
    page_boffset=0;
  809e06:	c7 05 00 07 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20700],0x0        # 42a510 <page_boffset>
  809e0d:	00 00 00 
    vpage_base=video_base;
  809e10:	48 8b 05 e1 06 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc206e1]        # 42a4f8 <video_base>
  809e17:	48 89 05 ea 06 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc206ea],rax        # 42a508 <vpage_base>
    vp++;
  809e1e:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    vpage=*vp;
  809e23:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809e27:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809e2a:	0f b6 c0             	movzx  eax,al
  809e2d:	89 05 e5 06 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc206e5],eax        # 42a518 <vpage>
    vp++;
  809e33:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    stline=*vp++;
  809e38:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809e3c:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809e40:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  809e44:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809e47:	0f b6 c0             	movzx  eax,al
  809e4a:	89 05 e4 06 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc206e4],eax        # 42a534 <stline>
    endline=*vp++;
  809e50:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809e54:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809e58:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  809e5c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809e5f:	0f b6 c0             	movzx  eax,al
  809e62:	89 05 d0 06 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc206d0],eax        # 42a538 <endline>
    videoy=*vp++;
  809e68:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809e6c:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809e70:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  809e74:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809e77:	0f b6 c0             	movzx  eax,al
  809e7a:	89 05 b0 06 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc206b0],eax        # 42a530 <videoy>
    videox=*vp;
  809e80:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809e84:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809e87:	0f b6 c0             	movzx  eax,al
  809e8a:	89 05 9c 06 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2069c],eax        # 42a52c <videox>
    //logf("video:\n mode:0x%x cursor:%d,%d\n",video_mode,\
    videoy,videox);
}
  809e90:	90                   	nop
  809e91:	c9                   	leave  
  809e92:	c3                   	ret    

0000000000809e93 <seek_tty>:
char m_color=MONITOR_WHITE;
int seek_tty(driver_args * args)
{
  809e93:	f3 0f 1e fa          	endbr64 
  809e97:	55                   	push   rbp
  809e98:	48 89 e5             	mov    rbp,rsp
  809e9b:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pos=args->pos;
  809e9f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809ea3:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  809ea6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    m_ptr=0xb8000+pos*2;
  809ea9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809eac:	05 00 c0 05 00       	add    eax,0x5c000
  809eb1:	01 c0                	add    eax,eax
  809eb3:	48 98                	cdqe   
  809eb5:	48 89 05 a4 12 00 00 	mov    QWORD PTR [rip+0x12a4],rax        # 80b160 <m_ptr>
}
  809ebc:	90                   	nop
  809ebd:	5d                   	pop    rbp
  809ebe:	c3                   	ret    

0000000000809ebf <tell_monitor>:
int tell_monitor()
{
  809ebf:	f3 0f 1e fa          	endbr64 
  809ec3:	55                   	push   rbp
  809ec4:	48 89 e5             	mov    rbp,rsp
    return (m_ptr-video_base)/2;
  809ec7:	48 8b 05 92 12 00 00 	mov    rax,QWORD PTR [rip+0x1292]        # 80b160 <m_ptr>
  809ece:	48 8b 15 23 06 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc20623]        # 42a4f8 <video_base>
  809ed5:	48 29 d0             	sub    rax,rdx
  809ed8:	48 89 c2             	mov    rdx,rax
  809edb:	48 c1 ea 3f          	shr    rdx,0x3f
  809edf:	48 01 d0             	add    rax,rdx
  809ee2:	48 d1 f8             	sar    rax,1
}
  809ee5:	5d                   	pop    rbp
  809ee6:	c3                   	ret    

0000000000809ee7 <del_ch>:
void del_ch()
{
  809ee7:	f3 0f 1e fa          	endbr64 
  809eeb:	55                   	push   rbp
  809eec:	48 89 e5             	mov    rbp,rsp
  809eef:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
    char *p=m_ptr-2;
  809ef6:	48 8b 05 63 12 00 00 	mov    rax,QWORD PTR [rip+0x1263]        # 80b160 <m_ptr>
  809efd:	48 83 e8 02          	sub    rax,0x2
  809f01:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int pos=tell_monitor()%SCREEN_W;
  809f05:	b8 00 00 00 00       	mov    eax,0x0
  809f0a:	e8 b0 ff ff ff       	call   809ebf <tell_monitor>
  809f0f:	89 c2                	mov    edx,eax
  809f11:	48 63 c2             	movsxd rax,edx
  809f14:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  809f1b:	48 c1 e8 20          	shr    rax,0x20
  809f1f:	c1 f8 05             	sar    eax,0x5
  809f22:	89 d1                	mov    ecx,edx
  809f24:	c1 f9 1f             	sar    ecx,0x1f
  809f27:	29 c8                	sub    eax,ecx
  809f29:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  809f2c:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  809f2f:	89 c8                	mov    eax,ecx
  809f31:	c1 e0 02             	shl    eax,0x2
  809f34:	01 c8                	add    eax,ecx
  809f36:	c1 e0 04             	shl    eax,0x4
  809f39:	29 c2                	sub    edx,eax
  809f3b:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
    for(;pos<SCREEN_W-1;pos++)
  809f3e:	eb 17                	jmp    809f57 <del_ch+0x70>
    {
        *p=*(p+2);
  809f40:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809f44:	0f b6 50 02          	movzx  edx,BYTE PTR [rax+0x2]
  809f48:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809f4c:	88 10                	mov    BYTE PTR [rax],dl
        p+=2;
  809f4e:	48 83 45 f8 02       	add    QWORD PTR [rbp-0x8],0x2
    for(;pos<SCREEN_W-1;pos++)
  809f53:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  809f57:	83 7d f4 4e          	cmp    DWORD PTR [rbp-0xc],0x4e
  809f5b:	7e e3                	jle    809f40 <del_ch+0x59>
    }
    driver_args args= {
  809f5d:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  809f64:	b8 00 00 00 00       	mov    eax,0x0
  809f69:	b9 18 00 00 00       	mov    ecx,0x18
  809f6e:	48 89 d7             	mov    rdi,rdx
  809f71:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .pos=tell_monitor() - 1
  809f74:	b8 00 00 00 00       	mov    eax,0x0
  809f79:	e8 41 ff ff ff       	call   809ebf <tell_monitor>
  809f7e:	83 e8 01             	sub    eax,0x1
    driver_args args= {
  809f81:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    };
    seek_tty(&args);
  809f87:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  809f8e:	48 89 c7             	mov    rdi,rax
  809f91:	e8 fd fe ff ff       	call   809e93 <seek_tty>
    set_cur();
  809f96:	b8 00 00 00 00       	mov    eax,0x0
  809f9b:	e8 03 00 00 00       	call   809fa3 <set_cur>
}
  809fa0:	90                   	nop
  809fa1:	c9                   	leave  
  809fa2:	c3                   	ret    

0000000000809fa3 <set_cur>:
void set_cur()
{
  809fa3:	f3 0f 1e fa          	endbr64 
  809fa7:	55                   	push   rbp
  809fa8:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  809fab:	fa                   	cli    
    outb(port_reg_index,14);
  809fac:	8b 05 6e 05 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2056e]        # 42a520 <port_reg_index>
  809fb2:	0f b7 c0             	movzx  eax,ax
  809fb5:	be 0e 00 00 00       	mov    esi,0xe
  809fba:	89 c7                	mov    edi,eax
  809fbc:	e8 6f ae ff ff       	call   804e30 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>9)&0xff);
  809fc1:	48 8b 05 98 11 00 00 	mov    rax,QWORD PTR [rip+0x1198]        # 80b160 <m_ptr>
  809fc8:	48 8b 15 29 05 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc20529]        # 42a4f8 <video_base>
  809fcf:	48 29 d0             	sub    rax,rdx
  809fd2:	48 c1 f8 09          	sar    rax,0x9
  809fd6:	0f b6 d0             	movzx  edx,al
  809fd9:	8b 05 45 05 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20545]        # 42a524 <port_reg_v>
  809fdf:	0f b7 c0             	movzx  eax,ax
  809fe2:	89 d6                	mov    esi,edx
  809fe4:	89 c7                	mov    edi,eax
  809fe6:	e8 45 ae ff ff       	call   804e30 <outb>
    outb(port_reg_index,15);
  809feb:	8b 05 2f 05 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2052f]        # 42a520 <port_reg_index>
  809ff1:	0f b7 c0             	movzx  eax,ax
  809ff4:	be 0f 00 00 00       	mov    esi,0xf
  809ff9:	89 c7                	mov    edi,eax
  809ffb:	e8 30 ae ff ff       	call   804e30 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>1)&0xff);
  80a000:	48 8b 05 59 11 00 00 	mov    rax,QWORD PTR [rip+0x1159]        # 80b160 <m_ptr>
  80a007:	48 8b 15 ea 04 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc204ea]        # 42a4f8 <video_base>
  80a00e:	48 29 d0             	sub    rax,rdx
  80a011:	48 d1 f8             	sar    rax,1
  80a014:	0f b6 d0             	movzx  edx,al
  80a017:	8b 05 07 05 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20507]        # 42a524 <port_reg_v>
  80a01d:	0f b7 c0             	movzx  eax,ax
  80a020:	89 d6                	mov    esi,edx
  80a022:	89 c7                	mov    edi,eax
  80a024:	e8 07 ae ff ff       	call   804e30 <outb>
    asm volatile("sti");
  80a029:	fb                   	sti    
}
  80a02a:	90                   	nop
  80a02b:	5d                   	pop    rbp
  80a02c:	c3                   	ret    

000000000080a02d <read_tty>:

int read_tty(driver_args *args)
{
  80a02d:	f3 0f 1e fa          	endbr64 
  80a031:	55                   	push   rbp
  80a032:	48 89 e5             	mov    rbp,rsp
  80a035:	48 83 ec 20          	sub    rsp,0x20
  80a039:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    char* dist=args->dist_addr;
  80a03d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a041:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80a044:	48 98                	cdqe   
  80a046:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  80a04a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a04e:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  80a051:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  80a054:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80a05b:	eb 4a                	jmp    80a0a7 <read_tty+0x7a>
    {
        *dist++=*m_ptr;
  80a05d:	48 8b 15 fc 10 00 00 	mov    rdx,QWORD PTR [rip+0x10fc]        # 80b160 <m_ptr>
  80a064:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a068:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80a06c:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80a070:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80a073:	88 10                	mov    BYTE PTR [rax],dl
        if(m_ptr==0xbffff&&i>0)
  80a075:	48 8b 05 e4 10 00 00 	mov    rax,QWORD PTR [rip+0x10e4]        # 80b160 <m_ptr>
  80a07c:	48 3d ff ff 0b 00    	cmp    rax,0xbffff
  80a082:	75 0d                	jne    80a091 <read_tty+0x64>
  80a084:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80a088:	7e 07                	jle    80a091 <read_tty+0x64>
        {
            return 1;//读到尾了
  80a08a:	b8 01 00 00 00       	mov    eax,0x1
  80a08f:	eb 2d                	jmp    80a0be <read_tty+0x91>
        }
        m_ptr+=2;
  80a091:	48 8b 05 c8 10 00 00 	mov    rax,QWORD PTR [rip+0x10c8]        # 80b160 <m_ptr>
  80a098:	48 83 c0 02          	add    rax,0x2
  80a09c:	48 89 05 bd 10 00 00 	mov    QWORD PTR [rip+0x10bd],rax        # 80b160 <m_ptr>
    for(int i=0;i<len;i++)
  80a0a3:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80a0a7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a0aa:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  80a0ad:	7c ae                	jl     80a05d <read_tty+0x30>
    }
    set_cur();
  80a0af:	b8 00 00 00 00       	mov    eax,0x0
  80a0b4:	e8 ea fe ff ff       	call   809fa3 <set_cur>
    return 0;
  80a0b9:	b8 00 00 00 00       	mov    eax,0x0
}
  80a0be:	c9                   	leave  
  80a0bf:	c3                   	ret    

000000000080a0c0 <write_tty>:
int write_tty(driver_args *args)
{
  80a0c0:	f3 0f 1e fa          	endbr64 
  80a0c4:	55                   	push   rbp
  80a0c5:	48 89 e5             	mov    rbp,rsp
  80a0c8:	48 83 ec 30          	sub    rsp,0x30
  80a0cc:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char* src=args->src_addr;
  80a0d0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a0d4:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a0d7:	48 98                	cdqe   
  80a0d9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  80a0dd:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a0e1:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  80a0e4:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  80a0e7:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80a0ee:	e9 0b 01 00 00       	jmp    80a1fe <write_tty+0x13e>
    {
        if(*src=='\n')
  80a0f3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a0f7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a0fa:	3c 0a                	cmp    al,0xa
  80a0fc:	75 50                	jne    80a14e <write_tty+0x8e>
        {
            unsigned int off=m_ptr-0xb8000;
  80a0fe:	48 8b 05 5b 10 00 00 	mov    rax,QWORD PTR [rip+0x105b]        # 80b160 <m_ptr>
  80a105:	48 2d 00 80 0b 00    	sub    rax,0xb8000
  80a10b:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            off=(off/160+1)*160;
  80a10e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80a111:	89 c2                	mov    edx,eax
  80a113:	b8 cd cc cc cc       	mov    eax,0xcccccccd
  80a118:	48 0f af c2          	imul   rax,rdx
  80a11c:	48 c1 e8 20          	shr    rax,0x20
  80a120:	c1 e8 07             	shr    eax,0x7
  80a123:	8d 50 01             	lea    edx,[rax+0x1]
  80a126:	89 d0                	mov    eax,edx
  80a128:	c1 e0 02             	shl    eax,0x2
  80a12b:	01 d0                	add    eax,edx
  80a12d:	c1 e0 05             	shl    eax,0x5
  80a130:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            ////logf("%x\n",off);
            m_ptr=0xb8000u+off;
  80a133:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80a136:	05 00 80 0b 00       	add    eax,0xb8000
  80a13b:	89 c0                	mov    eax,eax
  80a13d:	48 89 05 1c 10 00 00 	mov    QWORD PTR [rip+0x101c],rax        # 80b160 <m_ptr>
            src++;
  80a144:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
            continue;
  80a149:	e9 ac 00 00 00       	jmp    80a1fa <write_tty+0x13a>
        }else if(*src=='\0')
  80a14e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a152:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a155:	84 c0                	test   al,al
  80a157:	0f 84 af 00 00 00    	je     80a20c <write_tty+0x14c>
            break;
        if(*src=='\b')
  80a15d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a161:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a164:	3c 08                	cmp    al,0x8
  80a166:	75 1e                	jne    80a186 <write_tty+0xc6>
        {
            m_ptr-=2;
  80a168:	48 8b 05 f1 0f 00 00 	mov    rax,QWORD PTR [rip+0xff1]        # 80b160 <m_ptr>
  80a16f:	48 83 e8 02          	sub    rax,0x2
  80a173:	48 89 05 e6 0f 00 00 	mov    QWORD PTR [rip+0xfe6],rax        # 80b160 <m_ptr>
            *m_ptr=0;
  80a17a:	48 8b 05 df 0f 00 00 	mov    rax,QWORD PTR [rip+0xfdf]        # 80b160 <m_ptr>
  80a181:	c6 00 00             	mov    BYTE PTR [rax],0x0
  80a184:	eb 3e                	jmp    80a1c4 <write_tty+0x104>
        }else
        {
            *m_ptr++=*src++;
  80a186:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80a18a:	48 8d 42 01          	lea    rax,[rdx+0x1]
  80a18e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  80a192:	48 8b 05 c7 0f 00 00 	mov    rax,QWORD PTR [rip+0xfc7]        # 80b160 <m_ptr>
  80a199:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80a19d:	48 89 0d bc 0f 00 00 	mov    QWORD PTR [rip+0xfbc],rcx        # 80b160 <m_ptr>
  80a1a4:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80a1a7:	88 10                	mov    BYTE PTR [rax],dl
            *m_ptr++=m_color;
  80a1a9:	48 8b 05 b0 0f 00 00 	mov    rax,QWORD PTR [rip+0xfb0]        # 80b160 <m_ptr>
  80a1b0:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80a1b4:	48 89 15 a5 0f 00 00 	mov    QWORD PTR [rip+0xfa5],rdx        # 80b160 <m_ptr>
  80a1bb:	0f b6 15 a6 0f 00 00 	movzx  edx,BYTE PTR [rip+0xfa6]        # 80b168 <m_color>
  80a1c2:	88 10                	mov    BYTE PTR [rax],dl
        }
        if(m_ptr-vpage_base>=vpage_size*2-line_chs*2&&i>0)
  80a1c4:	48 8b 05 95 0f 00 00 	mov    rax,QWORD PTR [rip+0xf95]        # 80b160 <m_ptr>
  80a1cb:	48 8b 0d 36 03 c2 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc20336]        # 42a508 <vpage_base>
  80a1d2:	48 29 c8             	sub    rax,rcx
  80a1d5:	48 89 c2             	mov    rdx,rax
  80a1d8:	8b 05 4a 03 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2034a]        # 42a528 <vpage_size>
  80a1de:	8b 0d 38 03 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc20338]        # 42a51c <line_chs>
  80a1e4:	29 c8                	sub    eax,ecx
  80a1e6:	01 c0                	add    eax,eax
  80a1e8:	48 98                	cdqe   
  80a1ea:	48 39 c2             	cmp    rdx,rax
  80a1ed:	7c 0b                	jl     80a1fa <write_tty+0x13a>
  80a1ef:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80a1f3:	7e 05                	jle    80a1fa <write_tty+0x13a>
        {
            //下滚一行
            scrdown();
  80a1f5:	e8 bc f8 ff ff       	call   809ab6 <scrdown>
    for(int i=0;i<len;i++)
  80a1fa:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80a1fe:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a201:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  80a204:	0f 8c e9 fe ff ff    	jl     80a0f3 <write_tty+0x33>
  80a20a:	eb 01                	jmp    80a20d <write_tty+0x14d>
            break;
  80a20c:	90                   	nop
        }
    }
    set_cur();
  80a20d:	b8 00 00 00 00       	mov    eax,0x0
  80a212:	e8 8c fd ff ff       	call   809fa3 <set_cur>
    return 0;
  80a217:	b8 00 00 00 00       	mov    eax,0x0
}
  80a21c:	c9                   	leave  
  80a21d:	c3                   	ret    

000000000080a21e <cls>:

void cls(driver_args *args)
{
  80a21e:	f3 0f 1e fa          	endbr64 
  80a222:	55                   	push   rbp
  80a223:	48 89 e5             	mov    rbp,rsp
  80a226:	48 83 ec 20          	sub    rsp,0x20
  80a22a:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<vpage_size*2;i+=2)
  80a22e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80a235:	eb 16                	jmp    80a24d <cls+0x2f>
    {
        vpage_base[i]=0;
  80a237:	48 8b 15 ca 02 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc202ca]        # 42a508 <vpage_base>
  80a23e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a241:	48 98                	cdqe   
  80a243:	48 01 d0             	add    rax,rdx
  80a246:	c6 00 00             	mov    BYTE PTR [rax],0x0
    for(int i=0;i<vpage_size*2;i+=2)
  80a249:	83 45 fc 02          	add    DWORD PTR [rbp-0x4],0x2
  80a24d:	8b 05 d5 02 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc202d5]        # 42a528 <vpage_size>
  80a253:	01 c0                	add    eax,eax
  80a255:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  80a258:	7c dd                	jl     80a237 <cls+0x19>
    }
    m_ptr=vpage_base;
  80a25a:	48 8b 05 a7 02 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc202a7]        # 42a508 <vpage_base>
  80a261:	48 89 05 f8 0e 00 00 	mov    QWORD PTR [rip+0xef8],rax        # 80b160 <m_ptr>
    set_cur();
  80a268:	b8 00 00 00 00       	mov    eax,0x0
  80a26d:	e8 31 fd ff ff       	call   809fa3 <set_cur>
}
  80a272:	90                   	nop
  80a273:	c9                   	leave  
  80a274:	c3                   	ret    

000000000080a275 <set_color>:

void set_color(char color)
{
  80a275:	f3 0f 1e fa          	endbr64 
  80a279:	55                   	push   rbp
  80a27a:	48 89 e5             	mov    rbp,rsp
  80a27d:	89 f8                	mov    eax,edi
  80a27f:	88 45 fc             	mov    BYTE PTR [rbp-0x4],al
    m_color=color;
  80a282:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80a286:	88 05 dc 0e 00 00    	mov    BYTE PTR [rip+0xedc],al        # 80b168 <m_color>
}
  80a28c:	90                   	nop
  80a28d:	5d                   	pop    rbp
  80a28e:	c3                   	ret    

000000000080a28f <tty_do_req>:

int tty_do_req(driver_args *args)
{
  80a28f:	f3 0f 1e fa          	endbr64 
  80a293:	55                   	push   rbp
  80a294:	48 89 e5             	mov    rbp,rsp
  80a297:	48 83 ec 10          	sub    rsp,0x10
  80a29b:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    switch (args->cmd)
  80a29f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a2a3:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  80a2a9:	83 f8 0d             	cmp    eax,0xd
  80a2ac:	74 45                	je     80a2f3 <tty_do_req+0x64>
  80a2ae:	83 f8 0d             	cmp    eax,0xd
  80a2b1:	7f 53                	jg     80a306 <tty_do_req+0x77>
  80a2b3:	83 f8 0c             	cmp    eax,0xc
  80a2b6:	74 2d                	je     80a2e5 <tty_do_req+0x56>
  80a2b8:	83 f8 0c             	cmp    eax,0xc
  80a2bb:	7f 49                	jg     80a306 <tty_do_req+0x77>
  80a2bd:	83 f8 02             	cmp    eax,0x2
  80a2c0:	74 07                	je     80a2c9 <tty_do_req+0x3a>
  80a2c2:	83 f8 03             	cmp    eax,0x3
  80a2c5:	74 10                	je     80a2d7 <tty_do_req+0x48>
  80a2c7:	eb 3d                	jmp    80a306 <tty_do_req+0x77>
    {
    case DRVF_READ:
        read_tty(args);
  80a2c9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a2cd:	48 89 c7             	mov    rdi,rax
  80a2d0:	e8 58 fd ff ff       	call   80a02d <read_tty>
        break;
  80a2d5:	eb 36                	jmp    80a30d <tty_do_req+0x7e>
    case DRVF_WRITE:
        write_tty(args);
  80a2d7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a2db:	48 89 c7             	mov    rdi,rax
  80a2de:	e8 dd fd ff ff       	call   80a0c0 <write_tty>
        break;
  80a2e3:	eb 28                	jmp    80a30d <tty_do_req+0x7e>
    case DRVF_SEEK:
        seek_tty(args);
  80a2e5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a2e9:	48 89 c7             	mov    rdi,rax
  80a2ec:	e8 a2 fb ff ff       	call   809e93 <seek_tty>
        break;
  80a2f1:	eb 1a                	jmp    80a30d <tty_do_req+0x7e>
    case DRVF_TELL:
        tell_monitor(args);
  80a2f3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a2f7:	48 89 c7             	mov    rdi,rax
  80a2fa:	b8 00 00 00 00       	mov    eax,0x0
  80a2ff:	e8 bb fb ff ff       	call   809ebf <tell_monitor>
        break;
  80a304:	eb 07                	jmp    80a30d <tty_do_req+0x7e>
    default:return -1;
  80a306:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80a30b:	eb 05                	jmp    80a312 <tty_do_req+0x83>
    }
    return 0;
  80a30d:	b8 00 00 00 00       	mov    eax,0x0
}
  80a312:	c9                   	leave  
  80a313:	c3                   	ret    

000000000080a314 <init_com>:
//
#include "com.h"
#include "int.h"


void init_com(int base_port){
  80a314:	f3 0f 1e fa          	endbr64 
  80a318:	55                   	push   rbp
  80a319:	48 89 e5             	mov    rbp,rsp
  80a31c:	48 83 ec 10          	sub    rsp,0x10
  80a320:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    /* disable all interrupts */
    outb(base_port + COM_REG_IER, 0x00);
  80a323:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a326:	83 c0 01             	add    eax,0x1
  80a329:	0f b7 c0             	movzx  eax,ax
  80a32c:	be 00 00 00 00       	mov    esi,0x0
  80a331:	89 c7                	mov    edi,eax
  80a333:	e8 f8 aa ff ff       	call   804e30 <outb>
    
    /* enable DLAB to set bound rate divisor */
    outb(base_port + COM_REG_LCR, 0x80);
  80a338:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a33b:	83 c0 03             	add    eax,0x3
  80a33e:	0f b7 c0             	movzx  eax,ax
  80a341:	be 80 00 00 00       	mov    esi,0x80
  80a346:	89 c7                	mov    edi,eax
  80a348:	e8 e3 aa ff ff       	call   804e30 <outb>
    
    /* set divisor to 38400 baud */
    outb(base_port + COM_REG_DLL, 0x03);
  80a34d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a350:	0f b7 c0             	movzx  eax,ax
  80a353:	be 03 00 00 00       	mov    esi,0x3
  80a358:	89 c7                	mov    edi,eax
  80a35a:	e8 d1 aa ff ff       	call   804e30 <outb>
    outb(base_port + COM_REG_DLM, 0x00);
  80a35f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a362:	83 c0 01             	add    eax,0x1
  80a365:	0f b7 c0             	movzx  eax,ax
  80a368:	be 00 00 00 00       	mov    esi,0x0
  80a36d:	89 c7                	mov    edi,eax
  80a36f:	e8 bc aa ff ff       	call   804e30 <outb>
    
    /* 8 data bits, parity off, 1 stop bit, DLAB latch off */
    outb(base_port + COM_REG_LCR, 0x03);
  80a374:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a377:	83 c0 03             	add    eax,0x3
  80a37a:	0f b7 c0             	movzx  eax,ax
  80a37d:	be 03 00 00 00       	mov    esi,0x3
  80a382:	89 c7                	mov    edi,eax
  80a384:	e8 a7 aa ff ff       	call   804e30 <outb>
    
    /* enable FIFO */
    outb(base_port + COM_REG_FCR, 0xC7);
  80a389:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a38c:	83 c0 02             	add    eax,0x2
  80a38f:	0f b7 c0             	movzx  eax,ax
  80a392:	be c7 00 00 00       	mov    esi,0xc7
  80a397:	89 c7                	mov    edi,eax
  80a399:	e8 92 aa ff ff       	call   804e30 <outb>

    /* enable IRQs, set RTS/DSR */
    outb(base_port + COM_REG_MCR, 0x0B);
  80a39e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a3a1:	83 c0 04             	add    eax,0x4
  80a3a4:	0f b7 c0             	movzx  eax,ax
  80a3a7:	be 0b 00 00 00       	mov    esi,0xb
  80a3ac:	89 c7                	mov    edi,eax
  80a3ae:	e8 7d aa ff ff       	call   804e30 <outb>
    
    /* set in loopback mode and test serial chip */
    outb(base_port + COM_REG_MCR, 0x1E);
  80a3b3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a3b6:	83 c0 04             	add    eax,0x4
  80a3b9:	0f b7 c0             	movzx  eax,ax
  80a3bc:	be 1e 00 00 00       	mov    esi,0x1e
  80a3c1:	89 c7                	mov    edi,eax
  80a3c3:	e8 68 aa ff ff       	call   804e30 <outb>
    
    /* write a byte to test serial chip */
    outb(base_port + COM_REG_TX, "arttnba3"[0]);
  80a3c8:	b8 61 00 00 00       	mov    eax,0x61
  80a3cd:	0f b6 d0             	movzx  edx,al
  80a3d0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a3d3:	0f b7 c0             	movzx  eax,ax
  80a3d6:	89 d6                	mov    esi,edx
  80a3d8:	89 c7                	mov    edi,eax
  80a3da:	e8 51 aa ff ff       	call   804e30 <outb>
    
    /* check if serial is faulty */
    if (inb(base_port + COM_REG_RX) != "arttnba3"[0]) {
  80a3df:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a3e2:	0f b6 c0             	movzx  eax,al
  80a3e5:	89 c7                	mov    edi,eax
  80a3e7:	e8 5d aa ff ff       	call   804e49 <inb>
  80a3ec:	0f b6 d0             	movzx  edx,al
  80a3ef:	b8 61 00 00 00       	mov    eax,0x61
  80a3f4:	0f be c0             	movsx  eax,al
  80a3f7:	39 c2                	cmp    edx,eax
  80a3f9:	75 17                	jne    80a412 <init_com+0xfe>
        return;
    }
    
    /* set in normal mode */
    outb(base_port + COM_REG_MCR, 0x0F);
  80a3fb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a3fe:	83 c0 04             	add    eax,0x4
  80a401:	0f b7 c0             	movzx  eax,ax
  80a404:	be 0f 00 00 00       	mov    esi,0xf
  80a409:	89 c7                	mov    edi,eax
  80a40b:	e8 20 aa ff ff       	call   804e30 <outb>
  80a410:	eb 01                	jmp    80a413 <init_com+0xff>
        return;
  80a412:	90                   	nop
}
  80a413:	c9                   	leave  
  80a414:	c3                   	ret    

000000000080a415 <com_putchar>:
void com_putchar(unsigned short ch,int com_base)
{
  80a415:	f3 0f 1e fa          	endbr64 
  80a419:	55                   	push   rbp
  80a41a:	48 89 e5             	mov    rbp,rsp
  80a41d:	48 83 ec 20          	sub    rsp,0x20
  80a421:	89 f8                	mov    eax,edi
  80a423:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80a426:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    unsigned char res;
    /* wait for the port to be ready */
    do {
        res = inb(com_base + COM_REG_LSR);
  80a42a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80a42d:	83 c0 05             	add    eax,0x5
  80a430:	0f b6 c0             	movzx  eax,al
  80a433:	89 c7                	mov    edi,eax
  80a435:	e8 0f aa ff ff       	call   804e49 <inb>
  80a43a:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        res &= 0x20;
  80a43d:	80 65 ff 20          	and    BYTE PTR [rbp-0x1],0x20
    } while (res == 0);
  80a441:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  80a445:	74 e3                	je     80a42a <com_putchar+0x15>
    outb(com_base, ch);
  80a447:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  80a44b:	0f b6 d0             	movzx  edx,al
  80a44e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80a451:	0f b7 c0             	movzx  eax,ax
  80a454:	89 d6                	mov    esi,edx
  80a456:	89 c7                	mov    edi,eax
  80a458:	e8 d3 a9 ff ff       	call   804e30 <outb>
}
  80a45d:	90                   	nop
  80a45e:	c9                   	leave  
  80a45f:	c3                   	ret    

000000000080a460 <com_puts>:

void com_puts(char* s,int com_port){
  80a460:	f3 0f 1e fa          	endbr64 
  80a464:	55                   	push   rbp
  80a465:	48 89 e5             	mov    rbp,rsp
  80a468:	48 83 ec 10          	sub    rsp,0x10
  80a46c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a470:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    for(;*s;s++){
  80a473:	eb 1d                	jmp    80a492 <com_puts+0x32>
        com_putchar(*s,com_port);
  80a475:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a479:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a47c:	66 98                	cbw    
  80a47e:	0f b7 c0             	movzx  eax,ax
  80a481:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80a484:	89 d6                	mov    esi,edx
  80a486:	89 c7                	mov    edi,eax
  80a488:	e8 88 ff ff ff       	call   80a415 <com_putchar>
    for(;*s;s++){
  80a48d:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  80a492:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a496:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a499:	84 c0                	test   al,al
  80a49b:	75 d8                	jne    80a475 <com_puts+0x15>
    }
  80a49d:	90                   	nop
  80a49e:	90                   	nop
  80a49f:	c9                   	leave  
  80a4a0:	c3                   	ret    

000000000080a4a1 <memcpy>:
#include "mem.h"
#include "typename.h"
static u32 mem_end;
static u32 usr_mem_base;
void memcpy(u8* dest, u8 *src,u32 size){
  80a4a1:	f3 0f 1e fa          	endbr64 
  80a4a5:	55                   	push   rbp
  80a4a6:	48 89 e5             	mov    rbp,rsp
  80a4a9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80a4ad:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80a4b1:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    *dest=0xff;//如果页内存还没分配，这样就可以先激发缺页异常分配了，之后写数据就会完整不会少开头第一个字节。
  80a4b4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a4b8:	c6 00 ff             	mov    BYTE PTR [rax],0xff
    for(int i=0;i<size;i++){
  80a4bb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80a4c2:	eb 1b                	jmp    80a4df <memcpy+0x3e>
        *(dest)=*(src);
  80a4c4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a4c8:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80a4cb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a4cf:	88 10                	mov    BYTE PTR [rax],dl
        dest++;
  80a4d1:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        src++;
  80a4d6:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<size;i++){
  80a4db:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a4df:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a4e2:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
  80a4e5:	77 dd                	ja     80a4c4 <memcpy+0x23>
    }
}
  80a4e7:	90                   	nop
  80a4e8:	90                   	nop
  80a4e9:	5d                   	pop    rbp
  80a4ea:	c3                   	ret    

000000000080a4eb <memcmp>:
int memcmp(u8 *a,u8* b,int len)
{
  80a4eb:	f3 0f 1e fa          	endbr64 
  80a4ef:	55                   	push   rbp
  80a4f0:	48 89 e5             	mov    rbp,rsp
  80a4f3:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80a4f7:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80a4fb:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    for(int i=0;i<len;i++)
  80a4fe:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80a505:	eb 3a                	jmp    80a541 <memcmp+0x56>
    {
        if(*a!=*b)
  80a507:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a50b:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80a50e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a512:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a515:	38 c2                	cmp    dl,al
  80a517:	74 1a                	je     80a533 <memcmp+0x48>
            return *a-*b;
  80a519:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a51d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a520:	0f b6 d0             	movzx  edx,al
  80a523:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a527:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a52a:	0f b6 c8             	movzx  ecx,al
  80a52d:	89 d0                	mov    eax,edx
  80a52f:	29 c8                	sub    eax,ecx
  80a531:	eb 1b                	jmp    80a54e <memcmp+0x63>
        a++;
  80a533:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        b++;
  80a538:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<len;i++)
  80a53d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a541:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a544:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  80a547:	7c be                	jl     80a507 <memcmp+0x1c>
    }
    return 0;
  80a549:	b8 00 00 00 00       	mov    eax,0x0
}
  80a54e:	5d                   	pop    rbp
  80a54f:	c3                   	ret    

000000000080a550 <memset>:
void memset(u8 *buf,u8 value,u32 size){
  80a550:	f3 0f 1e fa          	endbr64 
  80a554:	55                   	push   rbp
  80a555:	48 89 e5             	mov    rbp,rsp
  80a558:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80a55c:	89 f0                	mov    eax,esi
  80a55e:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
  80a561:	88 45 e4             	mov    BYTE PTR [rbp-0x1c],al
    for(u32 i=0;i<size;i++){
  80a564:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80a56b:	eb 16                	jmp    80a583 <memset+0x33>
        *(buf++)=value;
  80a56d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a571:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80a575:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80a579:	0f b6 55 e4          	movzx  edx,BYTE PTR [rbp-0x1c]
  80a57d:	88 10                	mov    BYTE PTR [rax],dl
    for(u32 i=0;i<size;i++){
  80a57f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a583:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a586:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  80a589:	72 e2                	jb     80a56d <memset+0x1d>
    }
}
  80a58b:	90                   	nop
  80a58c:	90                   	nop
  80a58d:	5d                   	pop    rbp
  80a58e:	c3                   	ret    

000000000080a58f <get_mem_size>:

u32 get_mem_size(){
  80a58f:	f3 0f 1e fa          	endbr64 
  80a593:	55                   	push   rbp
  80a594:	48 89 e5             	mov    rbp,rsp
    return mem_end;
  80a597:	8b 05 9f ff c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ff9f]        # 42a53c <mem_end>
}
  80a59d:	5d                   	pop    rbp
  80a59e:	c3                   	ret    

000000000080a59f <strcpy>:
#include "str.h"
#include <stdarg.h>
void strcpy(unsigned char* dest, unsigned char *buf){
  80a59f:	f3 0f 1e fa          	endbr64 
  80a5a3:	55                   	push   rbp
  80a5a4:	48 89 e5             	mov    rbp,rsp
  80a5a7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a5ab:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*buf!='\0'){
  80a5af:	eb 1d                	jmp    80a5ce <strcpy+0x2f>
        *(dest++)=*(buf++);
  80a5b1:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80a5b5:	48 8d 42 01          	lea    rax,[rdx+0x1]
  80a5b9:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  80a5bd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a5c1:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80a5c5:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80a5c9:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80a5cc:	88 10                	mov    BYTE PTR [rax],dl
    while(*buf!='\0'){
  80a5ce:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a5d2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a5d5:	84 c0                	test   al,al
  80a5d7:	75 d8                	jne    80a5b1 <strcpy+0x12>
    }
    *dest='\0';
  80a5d9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a5dd:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80a5e0:	90                   	nop
  80a5e1:	5d                   	pop    rbp
  80a5e2:	c3                   	ret    

000000000080a5e3 <strtok>:
static char strtokkee[512],*strtokkeeptr=strtokkee;
static int tokptr=0;
static char retbuf[512],*retbptr=retbuf;
char* strtok(char *str,char splitter){
  80a5e3:	f3 0f 1e fa          	endbr64 
  80a5e7:	55                   	push   rbp
  80a5e8:	48 89 e5             	mov    rbp,rsp
  80a5eb:	48 83 ec 30          	sub    rsp,0x30
  80a5ef:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80a5f3:	89 f0                	mov    eax,esi
  80a5f5:	88 45 d4             	mov    BYTE PTR [rbp-0x2c],al
    //limit: cannot cut string longer than 512
    if(str!=(void*)0){
  80a5f8:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80a5fd:	0f 84 9c 00 00 00    	je     80a69f <strtok+0xbc>
        //cut for the first time
        strcpy(strtokkee,str);
  80a603:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a607:	48 89 c6             	mov    rsi,rax
  80a60a:	bf 60 a5 42 00       	mov    edi,0x42a560
  80a60f:	e8 8b ff ff ff       	call   80a59f <strcpy>
        char* ptr=strtokkee;
  80a614:	48 c7 45 e8 60 a5 42 	mov    QWORD PTR [rbp-0x18],0x42a560
  80a61b:	00 
        for(tokptr=0;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512);
  80a61c:	c7 05 3a 01 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc2013a],0x0        # 42a760 <tokptr>
  80a623:	00 00 00 
  80a626:	eb 1c                	jmp    80a644 <strtok+0x61>
  80a628:	8b 05 32 01 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20132]        # 42a760 <tokptr>
  80a62e:	83 c0 01             	add    eax,0x1
  80a631:	99                   	cdq    
  80a632:	c1 ea 17             	shr    edx,0x17
  80a635:	01 d0                	add    eax,edx
  80a637:	25 ff 01 00 00       	and    eax,0x1ff
  80a63c:	29 d0                	sub    eax,edx
  80a63e:	89 05 1c 01 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2011c],eax        # 42a760 <tokptr>
  80a644:	8b 05 16 01 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20116]        # 42a760 <tokptr>
  80a64a:	48 98                	cdqe   
  80a64c:	0f b6 80 60 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a560]
  80a653:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80a656:	74 13                	je     80a66b <strtok+0x88>
  80a658:	8b 05 02 01 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20102]        # 42a760 <tokptr>
  80a65e:	48 98                	cdqe   
  80a660:	0f b6 80 60 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a560]
  80a667:	84 c0                	test   al,al
  80a669:	75 bd                	jne    80a628 <strtok+0x45>
        strtokkee[tokptr]='\0';
  80a66b:	8b 05 ef 00 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc200ef]        # 42a760 <tokptr>
  80a671:	48 98                	cdqe   
  80a673:	c6 80 60 a5 42 00 00 	mov    BYTE PTR [rax+0x42a560],0x0
        tokptr=(tokptr+1)%512;
  80a67a:	8b 05 e0 00 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc200e0]        # 42a760 <tokptr>
  80a680:	83 c0 01             	add    eax,0x1
  80a683:	99                   	cdq    
  80a684:	c1 ea 17             	shr    edx,0x17
  80a687:	01 d0                	add    eax,edx
  80a689:	25 ff 01 00 00       	and    eax,0x1ff
  80a68e:	29 d0                	sub    eax,edx
  80a690:	89 05 ca 00 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc200ca],eax        # 42a760 <tokptr>
        return ptr;
  80a696:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a69a:	e9 9e 00 00 00       	jmp    80a73d <strtok+0x15a>
    }
    //go on cutting
    int c=0;
  80a69f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* ptr=strtokkee+tokptr;
  80a6a6:	8b 05 b4 00 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc200b4]        # 42a760 <tokptr>
  80a6ac:	48 98                	cdqe   
  80a6ae:	48 05 60 a5 42 00    	add    rax,0x42a560
  80a6b4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512,c++);
  80a6b8:	eb 20                	jmp    80a6da <strtok+0xf7>
  80a6ba:	8b 05 a0 00 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc200a0]        # 42a760 <tokptr>
  80a6c0:	83 c0 01             	add    eax,0x1
  80a6c3:	99                   	cdq    
  80a6c4:	c1 ea 17             	shr    edx,0x17
  80a6c7:	01 d0                	add    eax,edx
  80a6c9:	25 ff 01 00 00       	and    eax,0x1ff
  80a6ce:	29 d0                	sub    eax,edx
  80a6d0:	89 05 8a 00 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2008a],eax        # 42a760 <tokptr>
  80a6d6:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a6da:	8b 05 80 00 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20080]        # 42a760 <tokptr>
  80a6e0:	48 98                	cdqe   
  80a6e2:	0f b6 80 60 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a560]
  80a6e9:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80a6ec:	74 13                	je     80a701 <strtok+0x11e>
  80a6ee:	8b 05 6c 00 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2006c]        # 42a760 <tokptr>
  80a6f4:	48 98                	cdqe   
  80a6f6:	0f b6 80 60 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a560]
  80a6fd:	84 c0                	test   al,al
  80a6ff:	75 b9                	jne    80a6ba <strtok+0xd7>
    strtokkee[tokptr]='\0';
  80a701:	8b 05 59 00 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20059]        # 42a760 <tokptr>
  80a707:	48 98                	cdqe   
  80a709:	c6 80 60 a5 42 00 00 	mov    BYTE PTR [rax+0x42a560],0x0
    tokptr=(tokptr+1)%512;
  80a710:	8b 05 4a 00 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2004a]        # 42a760 <tokptr>
  80a716:	83 c0 01             	add    eax,0x1
  80a719:	99                   	cdq    
  80a71a:	c1 ea 17             	shr    edx,0x17
  80a71d:	01 d0                	add    eax,edx
  80a71f:	25 ff 01 00 00       	and    eax,0x1ff
  80a724:	29 d0                	sub    eax,edx
  80a726:	89 05 34 00 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20034],eax        # 42a760 <tokptr>
    if(c)
  80a72c:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80a730:	74 06                	je     80a738 <strtok+0x155>
        return ptr;
  80a732:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a736:	eb 05                	jmp    80a73d <strtok+0x15a>
    else
        return (void*)0;
  80a738:	b8 00 00 00 00       	mov    eax,0x0
}
  80a73d:	c9                   	leave  
  80a73e:	c3                   	ret    

000000000080a73f <strcmp>:
int strcmp(char *s1,char *s2)
{
  80a73f:	f3 0f 1e fa          	endbr64 
  80a743:	55                   	push   rbp
  80a744:	48 89 e5             	mov    rbp,rsp
  80a747:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a74b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	while(*s1!='\0'&&*s2!='\0'){
  80a74f:	eb 3c                	jmp    80a78d <strcmp+0x4e>
		if(*s1>*s2)
  80a751:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a755:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80a758:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a75c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a75f:	38 c2                	cmp    dl,al
  80a761:	7e 07                	jle    80a76a <strcmp+0x2b>
			return 1;
  80a763:	b8 01 00 00 00       	mov    eax,0x1
  80a768:	eb 52                	jmp    80a7bc <strcmp+0x7d>
		else if(*s1<*s2)
  80a76a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a76e:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80a771:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a775:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a778:	38 c2                	cmp    dl,al
  80a77a:	7d 07                	jge    80a783 <strcmp+0x44>
			return -1;
  80a77c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80a781:	eb 39                	jmp    80a7bc <strcmp+0x7d>
		s1++;
  80a783:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
		s2++;
  80a788:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
	while(*s1!='\0'&&*s2!='\0'){
  80a78d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a791:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a794:	84 c0                	test   al,al
  80a796:	74 0b                	je     80a7a3 <strcmp+0x64>
  80a798:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a79c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a79f:	84 c0                	test   al,al
  80a7a1:	75 ae                	jne    80a751 <strcmp+0x12>
	}
	if(*s1==*s2)
  80a7a3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a7a7:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80a7aa:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a7ae:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a7b1:	38 c2                	cmp    dl,al
  80a7b3:	75 07                	jne    80a7bc <strcmp+0x7d>
		return 0;
  80a7b5:	b8 00 00 00 00       	mov    eax,0x0
  80a7ba:	eb 00                	jmp    80a7bc <strcmp+0x7d>
}
  80a7bc:	5d                   	pop    rbp
  80a7bd:	c3                   	ret    

000000000080a7be <strlen>:

int strlen(char *str)
{
  80a7be:	f3 0f 1e fa          	endbr64 
  80a7c2:	55                   	push   rbp
  80a7c3:	48 89 e5             	mov    rbp,rsp
  80a7c6:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int l=0;
  80a7ca:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;*str!='\0';str++,l++);
  80a7d1:	eb 09                	jmp    80a7dc <strlen+0x1e>
  80a7d3:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  80a7d8:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a7dc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a7e0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a7e3:	84 c0                	test   al,al
  80a7e5:	75 ec                	jne    80a7d3 <strlen+0x15>
    return l;
  80a7e7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80a7ea:	5d                   	pop    rbp
  80a7eb:	c3                   	ret    

000000000080a7ec <sprintf>:

void sprintf(char *dist, char *str,...)
{
  80a7ec:	f3 0f 1e fa          	endbr64 
  80a7f0:	55                   	push   rbp
  80a7f1:	48 89 e5             	mov    rbp,rsp
  80a7f4:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  80a7fb:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  80a802:	48 89 b5 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rsi
  80a809:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  80a810:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  80a817:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  80a81e:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  80a825:	84 c0                	test   al,al
  80a827:	74 20                	je     80a849 <sprintf+0x5d>
  80a829:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  80a82d:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  80a831:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  80a835:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  80a839:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  80a83d:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  80a841:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  80a845:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7

    //count num of args
    char *pstr=str;
  80a849:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80a850:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char *prev=str;
  80a857:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80a85e:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    int argnum=0;
  80a865:	c7 85 3c ff ff ff 00 	mov    DWORD PTR [rbp-0xc4],0x0
  80a86c:	00 00 00 
    while (*pstr!='\n')
  80a86f:	eb 39                	jmp    80a8aa <sprintf+0xbe>
    {
        if(*pstr=='%'&&*prev!='%')
  80a871:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a878:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a87b:	3c 25                	cmp    al,0x25
  80a87d:	75 15                	jne    80a894 <sprintf+0xa8>
  80a87f:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  80a886:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a889:	3c 25                	cmp    al,0x25
  80a88b:	74 07                	je     80a894 <sprintf+0xa8>
            argnum++;
  80a88d:	83 85 3c ff ff ff 01 	add    DWORD PTR [rbp-0xc4],0x1
        prev=pstr;
  80a894:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a89b:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
        pstr++;
  80a8a2:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80a8a9:	01 
    while (*pstr!='\n')
  80a8aa:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a8b1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a8b4:	3c 0a                	cmp    al,0xa
  80a8b6:	75 b9                	jne    80a871 <sprintf+0x85>
    }

    va_list vargs;
    va_start(vargs,str);
  80a8b8:	c7 85 08 ff ff ff 10 	mov    DWORD PTR [rbp-0xf8],0x10
  80a8bf:	00 00 00 
  80a8c2:	c7 85 0c ff ff ff 30 	mov    DWORD PTR [rbp-0xf4],0x30
  80a8c9:	00 00 00 
  80a8cc:	48 8d 45 10          	lea    rax,[rbp+0x10]
  80a8d0:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  80a8d7:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  80a8de:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
    pstr=str;
  80a8e5:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80a8ec:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    for(;*pstr!='\0';pstr++){
  80a8f3:	e9 e2 01 00 00       	jmp    80aada <sprintf+0x2ee>
        if(*pstr=='%'&&*(pstr+1)!='\0'){
  80a8f8:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a8ff:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a902:	3c 25                	cmp    al,0x25
  80a904:	0f 85 aa 01 00 00    	jne    80aab4 <sprintf+0x2c8>
  80a90a:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a911:	48 83 c0 01          	add    rax,0x1
  80a915:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a918:	84 c0                	test   al,al
  80a91a:	0f 84 94 01 00 00    	je     80aab4 <sprintf+0x2c8>
            pstr++;
  80a920:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80a927:	01 
            if(*pstr=='x'){
  80a928:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a92f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a932:	3c 78                	cmp    al,0x78
  80a934:	75 64                	jne    80a99a <sprintf+0x1ae>
                int v=va_arg(vargs,int);
  80a936:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80a93c:	83 f8 2f             	cmp    eax,0x2f
  80a93f:	77 23                	ja     80a964 <sprintf+0x178>
  80a941:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80a948:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80a94e:	89 d2                	mov    edx,edx
  80a950:	48 01 d0             	add    rax,rdx
  80a953:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80a959:	83 c2 08             	add    edx,0x8
  80a95c:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80a962:	eb 12                	jmp    80a976 <sprintf+0x18a>
  80a964:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80a96b:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80a96f:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80a976:	8b 00                	mov    eax,DWORD PTR [rax]
  80a978:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
                sprint_hex(dist,v);
  80a97e:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
  80a984:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80a98b:	89 d6                	mov    esi,edx
  80a98d:	48 89 c7             	mov    rdi,rax
  80a990:	e8 4e 02 00 00       	call   80abe3 <sprint_hex>
            if(*pstr=='x'){
  80a995:	e9 38 01 00 00       	jmp    80aad2 <sprintf+0x2e6>
            }else if(*pstr=='s'){
  80a99a:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a9a1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a9a4:	3c 73                	cmp    al,0x73
  80a9a6:	75 68                	jne    80aa10 <sprintf+0x224>
                char* v=va_arg(vargs,char*);
  80a9a8:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80a9ae:	83 f8 2f             	cmp    eax,0x2f
  80a9b1:	77 23                	ja     80a9d6 <sprintf+0x1ea>
  80a9b3:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80a9ba:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80a9c0:	89 d2                	mov    edx,edx
  80a9c2:	48 01 d0             	add    rax,rdx
  80a9c5:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80a9cb:	83 c2 08             	add    edx,0x8
  80a9ce:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80a9d4:	eb 12                	jmp    80a9e8 <sprintf+0x1fc>
  80a9d6:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80a9dd:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80a9e1:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80a9e8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a9eb:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
                sprintn(dist,v);
  80a9f2:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
  80a9f9:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80aa00:	48 89 d6             	mov    rsi,rdx
  80aa03:	48 89 c7             	mov    rdi,rax
  80aa06:	e8 5a 02 00 00       	call   80ac65 <sprintn>
            if(*pstr=='x'){
  80aa0b:	e9 c2 00 00 00       	jmp    80aad2 <sprintf+0x2e6>
            }else if(*pstr=='d'){
  80aa10:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80aa17:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aa1a:	3c 64                	cmp    al,0x64
  80aa1c:	75 66                	jne    80aa84 <sprintf+0x298>
                char* v=va_arg(vargs,char*);
  80aa1e:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80aa24:	83 f8 2f             	cmp    eax,0x2f
  80aa27:	77 23                	ja     80aa4c <sprintf+0x260>
  80aa29:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80aa30:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80aa36:	89 d2                	mov    edx,edx
  80aa38:	48 01 d0             	add    rax,rdx
  80aa3b:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80aa41:	83 c2 08             	add    edx,0x8
  80aa44:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80aa4a:	eb 12                	jmp    80aa5e <sprintf+0x272>
  80aa4c:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80aa53:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80aa57:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80aa5e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aa61:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
                sprint_decimal(dist,v);
  80aa68:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  80aa6f:	89 c2                	mov    edx,eax
  80aa71:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80aa78:	89 d6                	mov    esi,edx
  80aa7a:	48 89 c7             	mov    rdi,rax
  80aa7d:	e8 ad 00 00 00       	call   80ab2f <sprint_decimal>
            if(*pstr=='x'){
  80aa82:	eb 4e                	jmp    80aad2 <sprintf+0x2e6>
            }else if(*pstr=='c'){
  80aa84:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80aa8b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aa8e:	3c 63                	cmp    al,0x63
  80aa90:	75 02                	jne    80aa94 <sprintf+0x2a8>
                char v=va_arg(vargs,char);
  80aa92:	0f 0b                	ud2    
                sprintchar(dist,v);
            }else{
                sprintchar(dist,*pstr);
  80aa94:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80aa9b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aa9e:	0f be d0             	movsx  edx,al
  80aaa1:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80aaa8:	89 d6                	mov    esi,edx
  80aaaa:	48 89 c7             	mov    rdi,rax
  80aaad:	e8 3e 00 00 00       	call   80aaf0 <sprintchar>
            if(*pstr=='x'){
  80aab2:	eb 1e                	jmp    80aad2 <sprintf+0x2e6>
            }
        }else{
            sprintchar(dist,*pstr);
  80aab4:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80aabb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aabe:	0f be d0             	movsx  edx,al
  80aac1:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80aac8:	89 d6                	mov    esi,edx
  80aaca:	48 89 c7             	mov    rdi,rax
  80aacd:	e8 1e 00 00 00       	call   80aaf0 <sprintchar>
    for(;*pstr!='\0';pstr++){
  80aad2:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80aad9:	01 
  80aada:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80aae1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aae4:	84 c0                	test   al,al
  80aae6:	0f 85 0c fe ff ff    	jne    80a8f8 <sprintf+0x10c>
        }
    }
    va_end(vargs);
}
  80aaec:	90                   	nop
  80aaed:	90                   	nop
  80aaee:	c9                   	leave  
  80aaef:	c3                   	ret    

000000000080aaf0 <sprintchar>:
void sprintchar(char *dist,char c)
{
  80aaf0:	f3 0f 1e fa          	endbr64 
  80aaf4:	55                   	push   rbp
  80aaf5:	48 89 e5             	mov    rbp,rsp
  80aaf8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80aafc:	89 f0                	mov    eax,esi
  80aafe:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    while(*dist!='\0')
  80ab01:	eb 05                	jmp    80ab08 <sprintchar+0x18>
        dist++;
  80ab03:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    while(*dist!='\0')
  80ab08:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ab0c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ab0f:	84 c0                	test   al,al
  80ab11:	75 f0                	jne    80ab03 <sprintchar+0x13>
    *dist++=c;
  80ab13:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ab17:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80ab1b:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80ab1f:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  80ab23:	88 10                	mov    BYTE PTR [rax],dl
    *dist='\0';
  80ab25:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ab29:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80ab2c:	90                   	nop
  80ab2d:	5d                   	pop    rbp
  80ab2e:	c3                   	ret    

000000000080ab2f <sprint_decimal>:
void sprint_decimal(char *dist,int c)
{
  80ab2f:	f3 0f 1e fa          	endbr64 
  80ab33:	55                   	push   rbp
  80ab34:	48 89 e5             	mov    rbp,rsp
  80ab37:	48 83 ec 30          	sub    rsp,0x30
  80ab3b:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80ab3f:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
    unsigned char st[22];
    int p=0;
  80ab42:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<sizeof(unsigned long)*2){
  80ab49:	eb 65                	jmp    80abb0 <sprint_decimal+0x81>
        unsigned char a=c%10+'0';
  80ab4b:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  80ab4e:	48 63 c2             	movsxd rax,edx
  80ab51:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  80ab58:	48 c1 e8 20          	shr    rax,0x20
  80ab5c:	c1 f8 02             	sar    eax,0x2
  80ab5f:	89 d6                	mov    esi,edx
  80ab61:	c1 fe 1f             	sar    esi,0x1f
  80ab64:	29 f0                	sub    eax,esi
  80ab66:	89 c1                	mov    ecx,eax
  80ab68:	89 c8                	mov    eax,ecx
  80ab6a:	c1 e0 02             	shl    eax,0x2
  80ab6d:	01 c8                	add    eax,ecx
  80ab6f:	01 c0                	add    eax,eax
  80ab71:	89 d1                	mov    ecx,edx
  80ab73:	29 c1                	sub    ecx,eax
  80ab75:	89 c8                	mov    eax,ecx
  80ab77:	83 c0 30             	add    eax,0x30
  80ab7a:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        st[p++]=a;
  80ab7d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ab80:	8d 50 01             	lea    edx,[rax+0x1]
  80ab83:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80ab86:	48 98                	cdqe   
  80ab88:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80ab8c:	88 54 05 e0          	mov    BYTE PTR [rbp+rax*1-0x20],dl
        c/=10;
  80ab90:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80ab93:	48 63 d0             	movsxd rdx,eax
  80ab96:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
  80ab9d:	48 c1 ea 20          	shr    rdx,0x20
  80aba1:	c1 fa 02             	sar    edx,0x2
  80aba4:	c1 f8 1f             	sar    eax,0x1f
  80aba7:	89 c1                	mov    ecx,eax
  80aba9:	89 d0                	mov    eax,edx
  80abab:	29 c8                	sub    eax,ecx
  80abad:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    while(p<sizeof(unsigned long)*2){
  80abb0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80abb3:	83 f8 0f             	cmp    eax,0xf
  80abb6:	76 93                	jbe    80ab4b <sprint_decimal+0x1c>
    }
    while(p>0)
  80abb8:	eb 1f                	jmp    80abd9 <sprint_decimal+0xaa>
    {
        sprintchar(dist,st[--p]);
  80abba:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80abbe:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80abc1:	48 98                	cdqe   
  80abc3:	0f b6 44 05 e0       	movzx  eax,BYTE PTR [rbp+rax*1-0x20]
  80abc8:	0f be d0             	movsx  edx,al
  80abcb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80abcf:	89 d6                	mov    esi,edx
  80abd1:	48 89 c7             	mov    rdi,rax
  80abd4:	e8 17 ff ff ff       	call   80aaf0 <sprintchar>
    while(p>0)
  80abd9:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80abdd:	7f db                	jg     80abba <sprint_decimal+0x8b>
    }
}
  80abdf:	90                   	nop
  80abe0:	90                   	nop
  80abe1:	c9                   	leave  
  80abe2:	c3                   	ret    

000000000080abe3 <sprint_hex>:
void sprint_hex(char *dist,unsigned int c)
{
  80abe3:	f3 0f 1e fa          	endbr64 
  80abe7:	55                   	push   rbp
  80abe8:	48 89 e5             	mov    rbp,rsp
  80abeb:	48 83 ec 20          	sub    rsp,0x20
  80abef:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80abf3:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    unsigned char st[10];
    int p=0;
  80abf6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<10){
  80abfd:	eb 35                	jmp    80ac34 <sprint_hex+0x51>
        unsigned char a=c%16;
  80abff:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80ac02:	83 e0 0f             	and    eax,0xf
  80ac05:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        if(a>9)a+='a'-10;
  80ac08:	80 7d fb 09          	cmp    BYTE PTR [rbp-0x5],0x9
  80ac0c:	76 06                	jbe    80ac14 <sprint_hex+0x31>
  80ac0e:	80 45 fb 57          	add    BYTE PTR [rbp-0x5],0x57
  80ac12:	eb 04                	jmp    80ac18 <sprint_hex+0x35>
        else a+='0';
  80ac14:	80 45 fb 30          	add    BYTE PTR [rbp-0x5],0x30
        st[p++]=a;
  80ac18:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ac1b:	8d 50 01             	lea    edx,[rax+0x1]
  80ac1e:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80ac21:	48 98                	cdqe   
  80ac23:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80ac27:	88 54 05 f1          	mov    BYTE PTR [rbp+rax*1-0xf],dl
        c/=16;
  80ac2b:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80ac2e:	c1 e8 04             	shr    eax,0x4
  80ac31:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    while(p<10){
  80ac34:	83 7d fc 09          	cmp    DWORD PTR [rbp-0x4],0x9
  80ac38:	7e c5                	jle    80abff <sprint_hex+0x1c>
    }
    while(p>0)
  80ac3a:	eb 1f                	jmp    80ac5b <sprint_hex+0x78>
    {
        sprintchar(dist,st[--p]);
  80ac3c:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80ac40:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ac43:	48 98                	cdqe   
  80ac45:	0f b6 44 05 f1       	movzx  eax,BYTE PTR [rbp+rax*1-0xf]
  80ac4a:	0f be d0             	movsx  edx,al
  80ac4d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ac51:	89 d6                	mov    esi,edx
  80ac53:	48 89 c7             	mov    rdi,rax
  80ac56:	e8 95 fe ff ff       	call   80aaf0 <sprintchar>
    while(p>0)
  80ac5b:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80ac5f:	7f db                	jg     80ac3c <sprint_hex+0x59>
    }
}
  80ac61:	90                   	nop
  80ac62:	90                   	nop
  80ac63:	c9                   	leave  
  80ac64:	c3                   	ret    

000000000080ac65 <sprintn>:
void sprintn(char *dist,char *str)
{
  80ac65:	f3 0f 1e fa          	endbr64 
  80ac69:	55                   	push   rbp
  80ac6a:	48 89 e5             	mov    rbp,rsp
  80ac6d:	48 83 ec 10          	sub    rsp,0x10
  80ac71:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80ac75:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*str!='\0')
  80ac79:	eb 20                	jmp    80ac9b <sprintn+0x36>
    {
        sprintchar(dist,*str++);
  80ac7b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ac7f:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80ac83:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  80ac87:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ac8a:	0f be d0             	movsx  edx,al
  80ac8d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ac91:	89 d6                	mov    esi,edx
  80ac93:	48 89 c7             	mov    rdi,rax
  80ac96:	e8 55 fe ff ff       	call   80aaf0 <sprintchar>
    while(*str!='\0')
  80ac9b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ac9f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aca2:	84 c0                	test   al,al
  80aca4:	75 d5                	jne    80ac7b <sprintn+0x16>
    }
  80aca6:	90                   	nop
  80aca7:	90                   	nop
  80aca8:	c9                   	leave  
  80aca9:	c3                   	ret    
  80acaa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

000000000080acb0 <create_zero>:
  80acb0:	e8 1a 90 ff ff       	call   803ccf <req_proc>
  80acb5:	83 f8 ff             	cmp    eax,0xffffffff
  80acb8:	74 0c                	je     80acc6 <create_zero.retu>
  80acba:	e8 09 91 ff ff       	call   803dc8 <set_proc>
  80acbf:	67 8b 04 24          	mov    eax,DWORD PTR [esp]
  80acc3:	83 c4 40             	add    esp,0x40

000000000080acc6 <create_zero.retu>:
  80acc6:	c3                   	ret    

000000000080acc7 <fill_desc>:
  80acc7:	55                   	push   rbp
  80acc8:	48 89 e5             	mov    rbp,rsp
  80accb:	67 8b 45 14          	mov    eax,DWORD PTR [ebp+0x14]
  80accf:	67 8b 5d 10          	mov    ebx,DWORD PTR [ebp+0x10]
  80acd3:	67 8b 4d 0c          	mov    ecx,DWORD PTR [ebp+0xc]
  80acd7:	67 8b 55 08          	mov    edx,DWORD PTR [ebp+0x8]
  80acdb:	be 1a ae 80 00       	mov    esi,0x80ae1a
  80ace0:	c7 04 25 1a ae 80 00 	mov    DWORD PTR ds:0x80ae1a,0x0
  80ace7:	00 00 00 00 
  80aceb:	c7 04 25 1e ae 80 00 	mov    DWORD PTR ds:0x80ae1e,0x0
  80acf2:	00 00 00 00 
  80acf6:	66 67 89 0e          	mov    WORD PTR [esi],cx
  80acfa:	c1 e9 10             	shr    ecx,0x10
  80acfd:	66 67 89 56 02       	mov    WORD PTR [esi+0x2],dx
  80ad02:	c1 ea 10             	shr    edx,0x10
  80ad05:	67 88 56 04          	mov    BYTE PTR [esi+0x4],dl
  80ad09:	66 c1 ea 08          	shr    dx,0x8
  80ad0d:	67 88 56 07          	mov    BYTE PTR [esi+0x7],dl
  80ad11:	66 67 89 5e 05       	mov    WORD PTR [esi+0x5],bx
  80ad16:	67 8b 7e 04          	mov    edi,DWORD PTR [esi+0x4]
  80ad1a:	c1 e1 08             	shl    ecx,0x8
  80ad1d:	09 cf                	or     edi,ecx
  80ad1f:	67 89 7e 04          	mov    DWORD PTR [esi+0x4],edi
  80ad23:	8b 14 25 1a ae 80 00 	mov    edx,DWORD PTR ds:0x80ae1a
  80ad2a:	67 89 10             	mov    DWORD PTR [eax],edx
  80ad2d:	8b 14 25 1e ae 80 00 	mov    edx,DWORD PTR ds:0x80ae1e
  80ad34:	67 89 50 04          	mov    DWORD PTR [eax+0x4],edx
  80ad38:	c9                   	leave  
  80ad39:	c3                   	ret    

000000000080ad3a <switch_proc_asm>:
  80ad3a:	66 67 8b 44 24 04    	mov    ax,WORD PTR [esp+0x4]
  80ad40:	66 89 04 25 58 ad 80 	mov    WORD PTR ds:0x80ad58,ax
  80ad47:	00 
  80ad48:	c7 04 25 54 ad 80 00 	mov    DWORD PTR ds:0x80ad54,0x0
  80ad4f:	00 00 00 00 

000000000080ad53 <switch_proc_asm.ljmp>:
  80ad53:	ea                   	(bad)  
  80ad54:	00 00                	add    BYTE PTR [rax],al
  80ad56:	00 00                	add    BYTE PTR [rax],al
  80ad58:	00 00                	add    BYTE PTR [rax],al
  80ad5a:	c3                   	ret    

000000000080ad5b <switch_to_old>:
  80ad5b:	67 8b 74 24 04       	mov    esi,DWORD PTR [esp+0x4]
  80ad60:	67 8b 5e 20          	mov    ebx,DWORD PTR [esi+0x20]
  80ad64:	bf cc ad 80 00       	mov    edi,0x80adcc
  80ad69:	67 89 5f 01          	mov    DWORD PTR [edi+0x1],ebx
  80ad6d:	67 8b 46 38          	mov    eax,DWORD PTR [esi+0x38]
  80ad71:	89 c1                	mov    ecx,eax
  80ad73:	83 e9 04             	sub    ecx,0x4
  80ad76:	67 89 19             	mov    DWORD PTR [ecx],ebx
  80ad79:	50                   	push   rax
  80ad7a:	89 f5                	mov    ebp,esi
  80ad7c:	83 c5 28             	add    ebp,0x28
  80ad7f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80ad83:	50                   	push   rax
  80ad84:	83 c5 04             	add    ebp,0x4
  80ad87:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80ad8b:	50                   	push   rax
  80ad8c:	83 c5 04             	add    ebp,0x4
  80ad8f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80ad93:	50                   	push   rax
  80ad94:	83 c5 04             	add    ebp,0x4
  80ad97:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80ad9b:	50                   	push   rax
  80ad9c:	83 c5 04             	add    ebp,0x4
  80ad9f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80ada3:	50                   	push   rax
  80ada4:	83 c5 04             	add    ebp,0x4
  80ada7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80adab:	50                   	push   rax
  80adac:	83 c5 04             	add    ebp,0x4
  80adaf:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80adb3:	50                   	push   rax
  80adb4:	83 c5 04             	add    ebp,0x4
  80adb7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80adbb:	50                   	push   rax
  80adbc:	83 c5 04             	add    ebp,0x4
  80adbf:	67 8b 46 1c          	mov    eax,DWORD PTR [esi+0x1c]
  80adc3:	0f 22 d8             	mov    cr3,rax
  80adc6:	67 8b 46 24          	mov    eax,DWORD PTR [esi+0x24]
  80adca:	50                   	push   rax
  80adcb:	5c                   	pop    rsp

000000000080adcc <switch_to_old.leap>:
  80adcc:	ea                   	(bad)  
  80adcd:	00 00                	add    BYTE PTR [rax],al
  80adcf:	00 00                	add    BYTE PTR [rax],al
  80add1:	08 00                	or     BYTE PTR [rax],al

000000000080add3 <save_context>:
  80add3:	67 8b 44 24 24       	mov    eax,DWORD PTR [esp+0x24]
  80add8:	83 c0 44             	add    eax,0x44
  80addb:	b9 08 00 00 00       	mov    ecx,0x8
  80ade0:	89 e7                	mov    edi,esp

000000000080ade2 <save_context.loops>:
  80ade2:	67 8b 17             	mov    edx,DWORD PTR [edi]
  80ade5:	67 89 10             	mov    DWORD PTR [eax],edx
  80ade8:	83 c7 04             	add    edi,0x4
  80adeb:	83 e8 04             	sub    eax,0x4
  80adee:	e2 f2                	loop   80ade2 <save_context.loops>
  80adf0:	5b                   	pop    rbx
  80adf1:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  80adf6:	67 89 58 24          	mov    DWORD PTR [eax+0x24],ebx
  80adfa:	67 48 8b 1c 24       	mov    rbx,QWORD PTR [esp]
  80adff:	67 89 58 20          	mov    DWORD PTR [eax+0x20],ebx
  80ae03:	c3                   	ret    

000000000080ae04 <move_to_user_mode>:
  80ae04:	66 b8 20 00          	mov    ax,0x20
  80ae08:	8e d8                	mov    ds,eax
  80ae0a:	8e c0                	mov    es,eax
  80ae0c:	8e e8                	mov    gs,eax
  80ae0e:	6a 20                	push   0x20
  80ae10:	54                   	push   rsp
  80ae11:	6a 18                	push   0x18
  80ae13:	68 19 ae 80 00       	push   0x80ae19
  80ae18:	cf                   	iret   

000000000080ae19 <move_to_user_mode.done>:
  80ae19:	c3                   	ret    

000000000080ae1a <desc>:
	...

000000000080ae22 <ret_sys_call>:
  80ae22:	58                   	pop    rax
  80ae23:	8e d8                	mov    ds,eax
  80ae25:	58                   	pop    rax
  80ae26:	8e c0                	mov    es,eax
  80ae28:	41 5f                	pop    r15
  80ae2a:	41 5e                	pop    r14
  80ae2c:	41 5d                	pop    r13
  80ae2e:	41 5c                	pop    r12
  80ae30:	41 5b                	pop    r11
  80ae32:	41 5a                	pop    r10
  80ae34:	41 59                	pop    r9
  80ae36:	41 58                	pop    r8
  80ae38:	5e                   	pop    rsi
  80ae39:	5f                   	pop    rdi
  80ae3a:	5a                   	pop    rdx
  80ae3b:	59                   	pop    rcx
  80ae3c:	5b                   	pop    rbx
  80ae3d:	58                   	pop    rax

000000000080ae3e <tmp>:
  80ae3e:	48 0f 07             	sysretq 
