
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
  800217:	b8 9a 7e 80 00       	mov    eax,0x807e9a
  80021c:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800221:	ba 08 00 00 00       	mov    edx,0x8
  800226:	48 89 c6             	mov    rsi,rax
  800229:	bf 21 00 00 00       	mov    edi,0x21
  80022e:	e8 02 01 00 00       	call   800335 <set_gate>
	set_gate(0x20,(addr_t)clock,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800233:	b8 b0 5d 80 00       	mov    eax,0x805db0
  800238:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80023d:	ba 08 00 00 00       	mov    edx,0x8
  800242:	48 89 c6             	mov    rsi,rax
  800245:	bf 20 00 00 00       	mov    edi,0x20
  80024a:	e8 e6 00 00 00       	call   800335 <set_gate>
	set_gate(0x2e,(addr_t)disk_int_handler,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80024f:	b8 50 8e 80 00       	mov    eax,0x808e50
  800254:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800259:	ba 08 00 00 00       	mov    edx,0x8
  80025e:	48 89 c6             	mov    rsi,rax
  800261:	bf 2e 00 00 00       	mov    edi,0x2e
  800266:	e8 ca 00 00 00       	call   800335 <set_gate>
    set_gate(0x80,(addr_t)_syscall,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);//
  80026b:	b8 80 68 80 00       	mov    eax,0x806880
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
  800291:	e8 8a 58 00 00       	call   805b20 <outb>
	outb(0xA0,0x11);
  800296:	be 11 00 00 00       	mov    esi,0x11
  80029b:	bf a0 00 00 00       	mov    edi,0xa0
  8002a0:	e8 7b 58 00 00       	call   805b20 <outb>
	//ICW2
	outb(0x21,0x20);//former 0x20,0x20
  8002a5:	be 20 00 00 00       	mov    esi,0x20
  8002aa:	bf 21 00 00 00       	mov    edi,0x21
  8002af:	e8 6c 58 00 00       	call   805b20 <outb>
	outb(0xA1,0x28);
  8002b4:	be 28 00 00 00       	mov    esi,0x28
  8002b9:	bf a1 00 00 00       	mov    edi,0xa1
  8002be:	e8 5d 58 00 00       	call   805b20 <outb>
	//ICW3
	outb(0x21,0x04);
  8002c3:	be 04 00 00 00       	mov    esi,0x4
  8002c8:	bf 21 00 00 00       	mov    edi,0x21
  8002cd:	e8 4e 58 00 00       	call   805b20 <outb>
	outb(0xA1,0x02);
  8002d2:	be 02 00 00 00       	mov    esi,0x2
  8002d7:	bf a1 00 00 00       	mov    edi,0xa1
  8002dc:	e8 3f 58 00 00       	call   805b20 <outb>
	//ICW4
	outb(0x21,0x01);
  8002e1:	be 01 00 00 00       	mov    esi,0x1
  8002e6:	bf 21 00 00 00       	mov    edi,0x21
  8002eb:	e8 30 58 00 00       	call   805b20 <outb>
	outb(0xA1,0x01);
  8002f0:	be 01 00 00 00       	mov    esi,0x1
  8002f5:	bf a1 00 00 00       	mov    edi,0xa1
  8002fa:	e8 21 58 00 00       	call   805b20 <outb>

    turn_on_int();
  8002ff:	b8 00 00 00 00       	mov    eax,0x0
  800304:	e8 51 58 00 00       	call   805b5a <turn_on_int>


    //设置IA32_LSTAR,为syscall做设置
    wrmsr(0xc0000082, _syscall);
  800309:	b8 80 68 80 00       	mov    eax,0x806880
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
  800350:	48 8b 15 a9 bf 00 00 	mov    rdx,QWORD PTR [rip+0xbfa9]        # 80c300 <idt>
  800357:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80035b:	48 c1 e0 04          	shl    rax,0x4
  80035f:	48 01 d0             	add    rax,rdx
  800362:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800366:	66 89 10             	mov    WORD PTR [rax],dx
    idt[index].offset_mid=(offset>>16)&0xffff;
  800369:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80036d:	48 c1 e8 10          	shr    rax,0x10
  800371:	48 89 c2             	mov    rdx,rax
  800374:	48 8b 0d 85 bf 00 00 	mov    rcx,QWORD PTR [rip+0xbf85]        # 80c300 <idt>
  80037b:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80037f:	48 c1 e0 04          	shl    rax,0x4
  800383:	48 01 c8             	add    rax,rcx
  800386:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
    idt[index].offset_high=(offset>>32)&0x0000ffff;
  80038a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80038e:	48 c1 e8 20          	shr    rax,0x20
  800392:	89 c1                	mov    ecx,eax
  800394:	48 8b 15 65 bf 00 00 	mov    rdx,QWORD PTR [rip+0xbf65]        # 80c300 <idt>
  80039b:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80039f:	48 c1 e0 04          	shl    rax,0x4
  8003a3:	48 01 c2             	add    rdx,rax
  8003a6:	0f b7 c1             	movzx  eax,cx
  8003a9:	89 42 08             	mov    DWORD PTR [rdx+0x8],eax
    idt[index].attr=attr|1;//1是ist索引
  8003ac:	48 8b 15 4d bf 00 00 	mov    rdx,QWORD PTR [rip+0xbf4d]        # 80c300 <idt>
  8003b3:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003b7:	48 c1 e0 04          	shl    rax,0x4
  8003bb:	48 01 d0             	add    rax,rdx
  8003be:	0f b7 55 ec          	movzx  edx,WORD PTR [rbp-0x14]
  8003c2:	83 ca 01             	or     edx,0x1
  8003c5:	66 89 50 04          	mov    WORD PTR [rax+0x4],dx
    idt[index].selector=selector;
  8003c9:	48 8b 15 30 bf 00 00 	mov    rdx,QWORD PTR [rip+0xbf30]        # 80c300 <idt>
  8003d0:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003d4:	48 c1 e0 04          	shl    rax,0x4
  8003d8:	48 01 c2             	add    rdx,rax
  8003db:	0f b7 45 f8          	movzx  eax,WORD PTR [rbp-0x8]
  8003df:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    idt[index].rsvd=0;
  8003e3:	48 8b 15 16 bf 00 00 	mov    rdx,QWORD PTR [rip+0xbf16]        # 80c300 <idt>
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
  80040d:	e8 3c 57 00 00       	call   805b4e <eoi>
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
  800427:	e8 22 57 00 00       	call   805b4e <eoi>
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
  800441:	e8 08 57 00 00       	call   805b4e <eoi>
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
  80045b:	e8 ee 56 00 00       	call   805b4e <eoi>
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
  800475:	e8 d4 56 00 00       	call   805b4e <eoi>
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
  80048f:	e8 ba 56 00 00       	call   805b4e <eoi>
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
  8004a8:	e8 a1 56 00 00       	call   805b4e <eoi>
    report_back_trace_of_err();
  8004ad:	b8 00 00 00 00       	mov    eax,0x0
  8004b2:	e8 c2 56 00 00       	call   805b79 <report_back_trace_of_err>
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
  8004cd:	e8 7c 56 00 00       	call   805b4e <eoi>
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
  8004e7:	e8 62 56 00 00       	call   805b4e <eoi>
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
  800500:	e8 49 56 00 00       	call   805b4e <eoi>
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
  800519:	e8 30 56 00 00       	call   805b4e <eoi>
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
  800533:	e8 16 56 00 00       	call   805b4e <eoi>
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
  80054d:	e8 fc 55 00 00       	call   805b4e <eoi>
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
  800571:	e8 d8 55 00 00       	call   805b4e <eoi>
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
  80058e:	e8 bb 55 00 00       	call   805b4e <eoi>
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
  8005d1:	48 05 e0 3a 81 00    	add    rax,0x813ae0
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
  800682:	e8 ac 3c 00 00       	call   804333 <reg_proc>
  800687:	e9 96 01 00 00       	jmp    800822 <syscall+0x288>
        case 8:del_proc(a);
  80068c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80068f:	89 c7                	mov    edi,eax
  800691:	e8 8f 3a 00 00       	call   804125 <del_proc>
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
  8006b5:	e8 f6 6d 00 00       	call   8074b0 <sys_open>
  8006ba:	e9 63 01 00 00       	jmp    800822 <syscall+0x288>
        case 12:return sys_close(a);
  8006bf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8006c2:	89 c7                	mov    edi,eax
  8006c4:	e8 fe 70 00 00       	call   8077c7 <sys_close>
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
  8006e4:	e8 96 71 00 00       	call   80787f <sys_read>
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
  800704:	e8 26 72 00 00       	call   80792f <sys_write>
  800709:	e9 14 01 00 00       	jmp    800822 <syscall+0x288>
        case 15:return sys_lseek(a,b,c);
  80070e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  800711:	48 63 c8             	movsxd rcx,eax
  800714:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  800717:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80071a:	48 89 ce             	mov    rsi,rcx
  80071d:	89 c7                	mov    edi,eax
  80071f:	e8 bb 72 00 00       	call   8079df <sys_lseek>
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
  800775:	e8 8a 56 00 00       	call   805e04 <execute>
  80077a:	e9 a3 00 00 00       	jmp    800822 <syscall+0x288>
        case SYSCALL_EXIT:return sys_exit(a);
  80077f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800782:	89 c7                	mov    edi,eax
  800784:	e8 82 3b 00 00       	call   80430b <sys_exit>
  800789:	e9 94 00 00 00       	jmp    800822 <syscall+0x288>
        case SYSCALL_CALL:return exec_call(a);
  80078e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800791:	48 98                	cdqe   
  800793:	48 89 c7             	mov    rdi,rax
  800796:	e8 60 58 00 00       	call   805ffb <exec_call>
  80079b:	e9 82 00 00 00       	jmp    800822 <syscall+0x288>
        case SYSCALL_MKFIFO:return sys_mkfifo(a);
  8007a0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007a3:	89 c7                	mov    edi,eax
  8007a5:	e8 04 14 00 00       	call   801bae <sys_mkfifo>
  8007aa:	eb 76                	jmp    800822 <syscall+0x288>
        case SYSCALL_MALLOC:return sys_malloc(a);
  8007ac:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007af:	89 c7                	mov    edi,eax
  8007b1:	e8 45 3d 00 00       	call   8044fb <sys_malloc>
  8007b6:	eb 6a                	jmp    800822 <syscall+0x288>
        case SYSCALL_FREE:return sys_free(a);
  8007b8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007bb:	89 c7                	mov    edi,eax
  8007bd:	e8 c7 3e 00 00       	call   804689 <sys_free>
  8007c2:	eb 5e                	jmp    800822 <syscall+0x288>
        case SYSCALL_KB_READC:return sys_analyse_key();
  8007c4:	b8 00 00 00 00       	mov    eax,0x0
  8007c9:	e8 e1 77 00 00       	call   807faf <sys_analyse_key>
  8007ce:	0f be c0             	movsx  eax,al
  8007d1:	eb 4f                	jmp    800822 <syscall+0x288>
        case SYSCALL_FIND_DEV:return sys_find_dev(a);
  8007d3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007d6:	48 98                	cdqe   
  8007d8:	48 89 c7             	mov    rdi,rax
  8007db:	e8 2b 22 00 00       	call   802a0b <sys_find_dev>
  8007e0:	eb 40                	jmp    800822 <syscall+0x288>
        case SYSCALL_FORK:return sys_fork();
  8007e2:	e8 af 41 00 00       	call   804996 <sys_fork>
  8007e7:	eb 39                	jmp    800822 <syscall+0x288>
        case SYSCALL_EXECVE:return sys_execve(a,b);
  8007e9:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8007ec:	48 98                	cdqe   
  8007ee:	48 89 c2             	mov    rdx,rax
  8007f1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8007f4:	48 98                	cdqe   
  8007f6:	48 89 d6             	mov    rsi,rdx
  8007f9:	48 89 c7             	mov    rdi,rax
  8007fc:	e8 05 57 00 00       	call   805f06 <sys_execve>
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
  8008a7:	48 8b 04 c5 48 3e 81 	mov    rax,QWORD PTR [rax*8+0x813e48]
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
  80094b:	e8 4b 61 00 00       	call   806a9b <set_framebuffer>
  800950:	48 83 c4 30          	add    rsp,0x30

            init_framebuffer();
  800954:	b8 00 00 00 00       	mov    eax,0x0
  800959:	e8 9a 5f 00 00       	call   8068f8 <init_framebuffer>
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
  800b22:	e8 9e 5e 00 00       	call   8069c5 <init_font>
    //初始化区域
    //fill_rect(0,0,100,100,255);
    print("gamessis os loaded.\nkernel:>");
  800b27:	bf 08 3e 81 00       	mov    edi,0x813e08
  800b2c:	e8 2d 63 00 00       	call   806e5e <print>
    init_int();
  800b31:	b8 00 00 00 00       	mov    eax,0x0
  800b36:	e8 c5 f4 ff ff       	call   800000 <init_int>
    print("int loaded.\n");
  800b3b:	bf 25 3e 81 00       	mov    edi,0x813e25
  800b40:	e8 19 63 00 00       	call   806e5e <print>
//    set_tss(0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000);
    init_memory();
  800b45:	b8 00 00 00 00       	mov    eax,0x0
  800b4a:	e8 ad 09 00 00       	call   8014fc <init_memory>
    init_com(PORT_COM1);
  800b4f:	bf f8 03 00 00       	mov    edi,0x3f8
  800b54:	e8 36 ac 00 00       	call   80b78f <init_com>
    comprintf("gamessis os loaded.\r\n");
  800b59:	bf 32 3e 81 00       	mov    edi,0x813e32
  800b5e:	b8 00 00 00 00       	mov    eax,0x0
  800b63:	e8 6a ad 00 00       	call   80b8d2 <comprintf>
	init_paging();
  800b68:	b8 00 00 00 00       	mov    eax,0x0
  800b6d:	e8 99 06 00 00       	call   80120b <init_paging>
 	init_gdt();
  800b72:	b8 00 00 00 00       	mov    eax,0x0
  800b77:	e8 21 50 00 00       	call   805b9d <init_gdt>
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
  800b95:	e8 e1 72 00 00       	call   807e7b <init_kb>
//    init_disk();

    sti();
  800b9a:	fb                   	sti    
    DISK1_FAT32_FS_init();
  800b9b:	b8 00 00 00 00       	mov    eax,0x0
  800ba0:	e8 65 a6 00 00       	call   80b20a <DISK1_FAT32_FS_init>

    manage_proc_lock=0;
  800ba5:	c7 05 59 b7 00 00 00 	mov    DWORD PTR [rip+0xb759],0x0        # 80c308 <manage_proc_lock>
  800bac:	00 00 00 
//    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
//    mount_fs("fat16",p->par,vmalloc());

    while (1)
    {
        char c= sys_analyse_key();
  800baf:	b8 00 00 00 00       	mov    eax,0x0
  800bb4:	e8 f6 73 00 00       	call   807faf <sys_analyse_key>
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
  800d20:	e8 39 61 00 00       	call   806e5e <print>
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
  800e6a:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x813e90
  800e71:	90 3e 81 00 
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
  800f0b:	48 8b 15 0e b4 00 00 	mov    rdx,QWORD PTR [rip+0xb40e]        # 80c320 <pml4>
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
  800f85:	e8 6a aa 00 00       	call   80b9f4 <memset>
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
  801003:	e8 ec a9 00 00       	call   80b9f4 <memset>
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
  8010ff:	e8 f0 a8 00 00       	call   80b9f4 <memset>
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
  80117d:	e8 72 a8 00 00       	call   80b9f4 <memset>
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
  801224:	89 05 0e b1 00 00    	mov    DWORD PTR [rip+0xb10e],eax        # 80c338 <high_mem_base>
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
  8013be:	bf 98 3e 81 00       	mov    edi,0x813e98
  8013c3:	e8 96 5a 00 00       	call   806e5e <print>
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
  801448:	bf a2 3e 81 00       	mov    edi,0x813ea2
  80144d:	e8 0c 5a 00 00       	call   806e5e <print>
  801452:	eb 0a                	jmp    80145e <page_err+0xb0>
    p=err_code&4;
  801454:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801458:	83 e0 04             	and    eax,0x4
  80145b:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(!p)print("supervisor mode\n");else //puts("user mode");
  80145e:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801462:	75 0c                	jne    801470 <page_err+0xc2>
  801464:	bf b0 3e 81 00       	mov    edi,0x813eb0
  801469:	e8 f0 59 00 00       	call   806e5e <print>
  80146e:	eb 0a                	jmp    80147a <page_err+0xcc>
    p=err_code&16;
  801470:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801474:	83 e0 10             	and    eax,0x10
  801477:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("an instruction tries to fetch\n");
  80147a:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80147e:	74 0a                	je     80148a <page_err+0xdc>
  801480:	bf c8 3e 81 00       	mov    edi,0x813ec8
  801485:	e8 d4 59 00 00       	call   806e5e <print>
    unsigned int addr=0;
  80148a:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
    asm volatile("mov 8(%%rbp),%0":"=r"(addr));
  801491:	8b 45 08             	mov    eax,DWORD PTR [rbp+0x8]
  801494:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    printf("occurred at %x(paddr), %x(laddr)\n",addr,l_addr);
  801497:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80149b:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80149e:	89 c6                	mov    esi,eax
  8014a0:	bf e8 3e 81 00       	mov    edi,0x813ee8
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
  8014cf:	bf 0a 3f 81 00       	mov    edi,0x813f0a
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
  8014e5:	e8 64 46 00 00       	call   805b4e <eoi>
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
  801e15:	e8 29 9c 00 00       	call   80ba43 <strcpy>
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
  802047:	e8 f9 98 00 00       	call   80b945 <memcpy>
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
  8020e6:	e8 5a 98 00 00       	call   80b945 <memcpy>
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
  8023d3:	e8 e6 5e 00 00       	call   8082be <request>
  8023d8:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    chk_result(r);
  8023db:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8023de:	89 c7                	mov    edi,eax
  8023e0:	e8 8d 65 00 00       	call   808972 <chk_result>

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
  8024b0:	e8 90 94 00 00       	call   80b945 <memcpy>
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
  80252d:	e8 13 94 00 00       	call   80b945 <memcpy>
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
  802a7e:	e8 60 91 00 00       	call   80bbe3 <strcmp>
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
  802b17:	e8 c7 90 00 00       	call   80bbe3 <strcmp>
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
  802b4a:	48 8b 04 c5 28 3f 81 	mov    rax,QWORD PTR [rax*8+0x813f28]
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
  802e28:	48 8b 04 c5 88 3f 81 	mov    rax,QWORD PTR [rax*8+0x813f88]
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
  803400:	48 8b 14 c5 40 c3 80 	mov    rdx,QWORD PTR [rax*8+0x80c340]
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
  80352f:	e8 ec 02 00 00       	call   803820 <create_proc>
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
  80359d:	e8 2c 13 00 00       	call   8048ce <set_tss>
  8035a2:	48 83 c4 20          	add    rsp,0x20
    //IA32_INTERRUPT_SSP_TABLE_ADDR，准备IST
    wrmsr(0x6a8,tss->rsvd2);
  8035a6:	48 8b 05 b3 8d 00 00 	mov    rax,QWORD PTR [rip+0x8db3]        # 80c360 <tss>
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
    comprintf("proc init set.\r\ntss.ist=%x\r\n",tss->ists[0]);
  8035e7:	48 8b 05 72 8d 00 00 	mov    rax,QWORD PTR [rip+0x8d72]        # 80c360 <tss>
  8035ee:	48 8b 40 24          	mov    rax,QWORD PTR [rax+0x24]
  8035f2:	48 89 c6             	mov    rsi,rax
  8035f5:	bf e8 3f 81 00       	mov    edi,0x813fe8
  8035fa:	b8 00 00 00 00       	mov    eax,0x0
  8035ff:	e8 ce 82 00 00       	call   80b8d2 <comprintf>
    //创建一个测试进程
//    create_test_proc();
}
  803604:	90                   	nop
  803605:	c9                   	leave  
  803606:	c3                   	ret    

0000000000803607 <create_test_proc>:
void create_test_proc(){
  803607:	f3 0f 1e fa          	endbr64 
  80360b:	55                   	push   rbp
  80360c:	48 89 e5             	mov    rbp,rsp
  80360f:	48 83 ec 20          	sub    rsp,0x20

    int index=req_proc();
  803613:	b8 00 00 00 00       	mov    eax,0x0
  803618:	e8 86 02 00 00       	call   8038a3 <req_proc>
  80361d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    task[index].stat=READY;
  803620:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803623:	48 98                	cdqe   
  803625:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80362c:	48 05 b8 84 40 00    	add    rax,0x4084b8
  803632:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int currsp=0x9fc00-1;
  803638:	c7 45 ec ff fb 09 00 	mov    DWORD PTR [rbp-0x14],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  80363f:	48 89 65 ec          	mov    QWORD PTR [rbp-0x14],rsp
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  803643:	ba c2 c2 80 00       	mov    edx,0x80c2c2
  803648:	48 83 ec 08          	sub    rsp,0x8
  80364c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80364f:	50                   	push   rax
  803650:	6a 00                	push   0x0
  803652:	52                   	push   rdx
  803653:	6a 00                	push   0x0
  803655:	6a 00                	push   0x0
  803657:	6a 00                	push   0x0
  803659:	68 58 7d 00 00       	push   0x7d58
  80365e:	6a 10                	push   0x10
  803660:	6a 10                	push   0x10
  803662:	6a 10                	push   0x10
  803664:	6a 10                	push   0x10
  803666:	41 b9 08 00 00 00    	mov    r9d,0x8
  80366c:	41 b8 10 00 00 00    	mov    r8d,0x10
  803672:	b9 00 00 00 00       	mov    ecx,0x0
  803677:	ba 00 00 00 00       	mov    edx,0x0
  80367c:	be 00 00 00 00       	mov    esi,0x0
  803681:	bf 00 00 00 00       	mov    edi,0x0
  803686:	e8 e4 02 00 00       	call   80396f <set_proc>
  80368b:	48 83 c4 60          	add    rsp,0x60
             0x7e00- sizeof(stack_store_regs), 0, 0, 0, (long)ret_sys_call, 0, index);
    task[index].tss.rsp0=0x400000;
  80368f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803692:	48 98                	cdqe   
  803694:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80369b:	48 05 70 86 40 00    	add    rax,0x408670
  8036a1:	48 c7 40 0c 00 00 40 	mov    QWORD PTR [rax+0xc],0x400000
  8036a8:	00 
    task[index].mem_struct.stack_top=0x7e00;
  8036a9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036ac:	48 98                	cdqe   
  8036ae:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8036b5:	48 05 d4 84 40 00    	add    rax,0x4084d4
  8036bb:	c7 00 00 7e 00 00    	mov    DWORD PTR [rax],0x7e00
    task[index].mem_struct.stack_bottom=0x6e00;
  8036c1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036c4:	48 98                	cdqe   
  8036c6:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8036cd:	48 05 d0 84 40 00    	add    rax,0x4084d0
  8036d3:	c7 00 00 6e 00 00    	mov    DWORD PTR [rax],0x6e00
    task[index].mem_struct.heap_top=0x1101000;
  8036d9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036dc:	48 98                	cdqe   
  8036de:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8036e5:	48 05 cc 84 40 00    	add    rax,0x4084cc
  8036eb:	c7 00 00 10 10 01    	mov    DWORD PTR [rax],0x1101000
    task[index].mem_struct.heap_base=0x1100000;
  8036f1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036f4:	48 98                	cdqe   
  8036f6:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8036fd:	48 05 c8 84 40 00    	add    rax,0x4084c8
  803703:	c7 00 00 00 10 01    	mov    DWORD PTR [rax],0x1100000

    //把还原现场时用到的堆栈设置好
    stack_store_regs *str= (stack_store_regs *) (0x7e00 - sizeof(stack_store_regs));
  803709:	48 c7 45 f0 58 7d 00 	mov    QWORD PTR [rbp-0x10],0x7d58
  803710:	00 
    str->rax=0;
  803711:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803715:	48 c7 40 78 00 00 00 	mov    QWORD PTR [rax+0x78],0x0
  80371c:	00 
    str->rbx=0;
  80371d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803721:	48 c7 40 70 00 00 00 	mov    QWORD PTR [rax+0x70],0x0
  803728:	00 
    str->rcx=proc_zero;//sysret采用的返回地址
  803729:	ba e3 3a 80 00       	mov    edx,0x803ae3
  80372e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803732:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    str->rdx=0;
  803736:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80373a:	48 c7 40 60 00 00 00 	mov    QWORD PTR [rax+0x60],0x0
  803741:	00 
    str->rsi=0;
  803742:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803746:	48 c7 40 50 00 00 00 	mov    QWORD PTR [rax+0x50],0x0
  80374d:	00 
    str->rdi=0;
  80374e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803752:	48 c7 40 58 00 00 00 	mov    QWORD PTR [rax+0x58],0x0
  803759:	00 
    str->r15=0;
  80375a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80375e:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  803765:	00 
    str->r14=0;
  803766:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80376a:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  803771:	00 
    str->r13=0;
  803772:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803776:	48 c7 40 20 00 00 00 	mov    QWORD PTR [rax+0x20],0x0
  80377d:	00 
    str->r12=0;
  80377e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803782:	48 c7 40 28 00 00 00 	mov    QWORD PTR [rax+0x28],0x0
  803789:	00 
    str->r11=0x200;
  80378a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80378e:	48 c7 40 30 00 02 00 	mov    QWORD PTR [rax+0x30],0x200
  803795:	00 
    str->r10=0;
  803796:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80379a:	48 c7 40 38 00 00 00 	mov    QWORD PTR [rax+0x38],0x0
  8037a1:	00 
    str->r9=0;
  8037a2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037a6:	48 c7 40 40 00 00 00 	mov    QWORD PTR [rax+0x40],0x0
  8037ad:	00 
    str->r8=0;
  8037ae:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037b2:	48 c7 40 48 00 00 00 	mov    QWORD PTR [rax+0x48],0x0
  8037b9:	00 
    str->rip=proc_zero;
  8037ba:	ba e3 3a 80 00       	mov    edx,0x803ae3
  8037bf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037c3:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
    str->cs=0x8;
  8037ca:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037ce:	48 c7 80 88 00 00 00 	mov    QWORD PTR [rax+0x88],0x8
  8037d5:	08 00 00 00 
    str->rflags=0x00200206;
  8037d9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037dd:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x200206
  8037e4:	06 02 20 00 
    str->rsp=0x7e00;
  8037e8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037ec:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x7e00
  8037f3:	00 7e 00 00 
    str->ss=0x2b;
  8037f7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037fb:	48 c7 80 a0 00 00 00 	mov    QWORD PTR [rax+0xa0],0x2b
  803802:	2b 00 00 00 
    str->ds=0x2b;
  803806:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80380a:	48 c7 00 2b 00 00 00 	mov    QWORD PTR [rax],0x2b
    str->es=0x2b;
  803811:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803815:	48 c7 40 08 2b 00 00 	mov    QWORD PTR [rax+0x8],0x2b
  80381c:	00 

}
  80381d:	90                   	nop
  80381e:	c9                   	leave  
  80381f:	c3                   	ret    

0000000000803820 <create_proc>:
int create_proc()
{
  803820:	f3 0f 1e fa          	endbr64 
  803824:	55                   	push   rbp
  803825:	48 89 e5             	mov    rbp,rsp
  803828:	48 83 ec 10          	sub    rsp,0x10
    int index=req_proc();
  80382c:	b8 00 00 00 00       	mov    eax,0x0
  803831:	e8 6d 00 00 00       	call   8038a3 <req_proc>
  803836:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(index==-1)return -1;
  803839:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  80383d:	75 07                	jne    803846 <create_proc+0x26>
  80383f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803844:	eb 5b                	jmp    8038a1 <create_proc+0x81>
    int currsp=0x9fc00-1;
  803846:	c7 45 f8 ff fb 09 00 	mov    DWORD PTR [rbp-0x8],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  80384d:	48 89 65 f8          	mov    QWORD PTR [rbp-0x8],rsp
    //默认DPL=3
    //set_proc(0,0,0,0,0x23,0x1b,0x23,0x23,0x23,0x23,curesp,0,0,0,0,index);
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  803851:	b9 e3 3a 80 00       	mov    ecx,0x803ae3
  803856:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803859:	48 98                	cdqe   
  80385b:	48 83 ec 08          	sub    rsp,0x8
  80385f:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  803862:	52                   	push   rdx
  803863:	6a 00                	push   0x0
  803865:	51                   	push   rcx
  803866:	6a 00                	push   0x0
  803868:	6a 00                	push   0x0
  80386a:	6a 00                	push   0x0
  80386c:	50                   	push   rax
  80386d:	6a 10                	push   0x10
  80386f:	6a 10                	push   0x10
  803871:	6a 10                	push   0x10
  803873:	6a 10                	push   0x10
  803875:	41 b9 08 00 00 00    	mov    r9d,0x8
  80387b:	41 b8 10 00 00 00    	mov    r8d,0x10
  803881:	b9 00 00 00 00       	mov    ecx,0x0
  803886:	ba 00 00 00 00       	mov    edx,0x0
  80388b:	be 00 00 00 00       	mov    esi,0x0
  803890:	bf 00 00 00 00       	mov    edi,0x0
  803895:	e8 d5 00 00 00       	call   80396f <set_proc>
  80389a:	48 83 c4 60          	add    rsp,0x60
             currsp, 0, 0, 0, (long)proc_zero, 0, index);
//    task[index].tss.eip=(long)proc_zero;

    return index;
  80389e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8038a1:	c9                   	leave  
  8038a2:	c3                   	ret    

00000000008038a3 <req_proc>:
int req_proc(){
  8038a3:	f3 0f 1e fa          	endbr64 
  8038a7:	55                   	push   rbp
  8038a8:	48 89 e5             	mov    rbp,rsp
    int num=0;
  8038ab:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  8038b2:	eb 04                	jmp    8038b8 <req_proc+0x15>
    num<=MAX_PROC_COUNT){
        num++;
  8038b4:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  8038b8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8038bb:	48 98                	cdqe   
  8038bd:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8038c4:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8038ca:	8b 00                	mov    eax,DWORD PTR [rax]
  8038cc:	83 f8 ff             	cmp    eax,0xffffffff
  8038cf:	74 1f                	je     8038f0 <req_proc+0x4d>
  8038d1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8038d4:	48 98                	cdqe   
  8038d6:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8038dd:	48 05 b8 84 40 00    	add    rax,0x4084b8
  8038e3:	8b 00                	mov    eax,DWORD PTR [rax]
  8038e5:	83 f8 03             	cmp    eax,0x3
  8038e8:	74 06                	je     8038f0 <req_proc+0x4d>
  8038ea:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  8038ee:	7e c4                	jle    8038b4 <req_proc+0x11>
    }
    if(num>=MAX_PROC_COUNT)
  8038f0:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8038f4:	7e 07                	jle    8038fd <req_proc+0x5a>
        return -1;
  8038f6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8038fb:	eb 70                	jmp    80396d <req_proc+0xca>
    task[num].pid=pidd++;
  8038fd:	8b 05 2d 1d c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11d2d]        # 415630 <pidd>
  803903:	8d 50 01             	lea    edx,[rax+0x1]
  803906:	89 15 24 1d c1 ff    	mov    DWORD PTR [rip+0xffffffffffc11d24],edx        # 415630 <pidd>
  80390c:	89 c2                	mov    edx,eax
  80390e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803911:	48 98                	cdqe   
  803913:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80391a:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803920:	89 10                	mov    DWORD PTR [rax],edx
    task[num].stat=ENDED;
  803922:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803925:	48 98                	cdqe   
  803927:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80392e:	48 05 b8 84 40 00    	add    rax,0x4084b8
  803934:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[num].utime=0;
  80393a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80393d:	48 98                	cdqe   
  80393f:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803946:	48 05 bc 84 40 00    	add    rax,0x4084bc
  80394c:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[num].priority=0;
  803952:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803955:	48 98                	cdqe   
  803957:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80395e:	48 05 c0 84 40 00    	add    rax,0x4084c0
  803964:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return num;
  80396a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80396d:	5d                   	pop    rbp
  80396e:	c3                   	ret    

000000000080396f <set_proc>:
void set_proc(long rax, long rbx, long rcx, long rdx, long es, long cs, long ss, long ds, long fs, long gs, long rsp,
              long rbp, long rsi, long rdi, long rip, long rflags, int proc_nr) {
  80396f:	f3 0f 1e fa          	endbr64 
  803973:	55                   	push   rbp
  803974:	48 89 e5             	mov    rbp,rsp
  803977:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80397b:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80397f:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  803983:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  803987:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
  80398b:	4c 89 4d c0          	mov    QWORD PTR [rbp-0x40],r9
    struct process* proc=&task[proc_nr];
  80398f:	8b 45 60             	mov    eax,DWORD PTR [rbp+0x60]
  803992:	48 98                	cdqe   
  803994:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80399b:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8039a1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    proc->regs.rax=rax;
  8039a5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8039a9:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8039ad:	48 89 90 5c 02 00 00 	mov    QWORD PTR [rax+0x25c],rdx
    proc->regs.rbx=rbx;
  8039b4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8039b8:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  8039bc:	48 89 90 74 02 00 00 	mov    QWORD PTR [rax+0x274],rdx
    proc->regs.rcx=rcx;
  8039c3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8039c7:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8039cb:	48 89 90 64 02 00 00 	mov    QWORD PTR [rax+0x264],rdx
    proc->regs.rdx=rdx;
  8039d2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8039d6:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8039da:	48 89 90 6c 02 00 00 	mov    QWORD PTR [rax+0x26c],rdx
    proc->regs.es=es;
  8039e1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8039e5:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  8039e9:	48 89 90 9c 02 00 00 	mov    QWORD PTR [rax+0x29c],rdx
    proc->regs.cs=cs;
  8039f0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8039f4:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  8039f8:	48 89 90 a4 02 00 00 	mov    QWORD PTR [rax+0x2a4],rdx
    proc->regs.ss=ss;
  8039ff:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a03:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803a07:	48 89 90 ac 02 00 00 	mov    QWORD PTR [rax+0x2ac],rdx
    proc->regs.ds=ds;
  803a0e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a12:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803a16:	48 89 90 b4 02 00 00 	mov    QWORD PTR [rax+0x2b4],rdx
    proc->regs.fs=fs;
  803a1d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a21:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  803a25:	48 89 90 bc 02 00 00 	mov    QWORD PTR [rax+0x2bc],rdx
    proc->regs.gs=gs;
  803a2c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a30:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  803a34:	48 89 90 c4 02 00 00 	mov    QWORD PTR [rax+0x2c4],rdx
    proc->regs.rsp=rsp;
  803a3b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a3f:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803a43:	48 89 90 7c 02 00 00 	mov    QWORD PTR [rax+0x27c],rdx
    proc->regs.rbp=rbp;
  803a4a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a4e:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
  803a52:	48 89 90 84 02 00 00 	mov    QWORD PTR [rax+0x284],rdx
    proc->regs.rsi=rsi;
  803a59:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a5d:	48 8b 55 40          	mov    rdx,QWORD PTR [rbp+0x40]
  803a61:	48 89 90 8c 02 00 00 	mov    QWORD PTR [rax+0x28c],rdx
    proc->regs.rdi=rdi;
  803a68:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a6c:	48 8b 55 48          	mov    rdx,QWORD PTR [rbp+0x48]
  803a70:	48 89 90 94 02 00 00 	mov    QWORD PTR [rax+0x294],rdx
    proc->regs.rflags=0x202;//设置为默认值:0b 0010 0000 0010
  803a77:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a7b:	48 c7 80 54 02 00 00 	mov    QWORD PTR [rax+0x254],0x202
  803a82:	02 02 00 00 
    //能接受中断
    proc->regs.rip=rip;
  803a86:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a8a:	48 8b 55 50          	mov    rdx,QWORD PTR [rbp+0x50]
  803a8e:	48 89 90 4c 02 00 00 	mov    QWORD PTR [rax+0x24c],rdx

    proc->regs.cs=cs;
  803a95:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a99:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803a9d:	48 89 90 a4 02 00 00 	mov    QWORD PTR [rax+0x2a4],rdx
    proc->regs.ds=ds;
  803aa4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803aa8:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803aac:	48 89 90 b4 02 00 00 	mov    QWORD PTR [rax+0x2b4],rdx
    proc->regs.es=es;
  803ab3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ab7:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803abb:	48 89 90 9c 02 00 00 	mov    QWORD PTR [rax+0x29c],rdx
    proc->regs.cr3=PML4_ADDR;//get_phyaddr(n1);//暂时先搞成全局
  803ac2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ac6:	48 c7 80 44 02 00 00 	mov    QWORD PTR [rax+0x244],0x101000
  803acd:	00 10 10 00 
    proc->pml4=PML4_ADDR;
  803ad1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ad5:	48 c7 80 c0 00 00 00 	mov    QWORD PTR [rax+0xc0],0x101000
  803adc:	00 10 10 00 


}
  803ae0:	90                   	nop
  803ae1:	5d                   	pop    rbp
  803ae2:	c3                   	ret    

0000000000803ae3 <proc_zero>:
void proc_zero()
{
  803ae3:	f3 0f 1e fa          	endbr64 
  803ae7:	55                   	push   rbp
  803ae8:	48 89 e5             	mov    rbp,rsp
  803aeb:	48 83 ec 10          	sub    rsp,0x10
//    }else{
//        printf("parent proc ret:%d\n",rax);
//    }
    while (1)
    {
        char c= sys_analyse_key();
  803aef:	b8 00 00 00 00       	mov    eax,0x0
  803af4:	e8 b6 44 00 00       	call   807faf <sys_analyse_key>
  803af9:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        putchar(c);
  803afc:	0f be 45 ff          	movsx  eax,BYTE PTR [rbp-0x1]
  803b00:	89 c7                	mov    edi,eax
  803b02:	e8 f6 d1 ff ff       	call   800cfd <putchar>
    {
  803b07:	eb e6                	jmp    803aef <proc_zero+0xc>

0000000000803b09 <save_rsp>:
    }
}
void save_rsp(){
  803b09:	f3 0f 1e fa          	endbr64 
  803b0d:	55                   	push   rbp
  803b0e:	48 89 e5             	mov    rbp,rsp
    //在时钟中断context下
    addr_t * p=INT_STACK_TOP-16;
  803b11:	48 c7 45 f8 f0 ff 7f 	mov    QWORD PTR [rbp-0x8],0x7ffff0
  803b18:	00 
    current->regs.rsp=*p;
  803b19:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b1d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803b20:	48 8b 05 79 1a c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc11a79]        # 4155a0 <current>
  803b27:	48 89 90 7c 02 00 00 	mov    QWORD PTR [rax+0x27c],rdx
}
  803b2e:	90                   	nop
  803b2f:	5d                   	pop    rbp
  803b30:	c3                   	ret    

0000000000803b31 <manage_proc>:
void manage_proc(){
  803b31:	f3 0f 1e fa          	endbr64 
  803b35:	55                   	push   rbp
  803b36:	48 89 e5             	mov    rbp,rsp
  803b39:	48 83 ec 10          	sub    rsp,0x10
    if(cur_proc!=-1)
  803b3d:	8b 05 e9 1a c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11ae9]        # 41562c <cur_proc>
  803b43:	83 f8 ff             	cmp    eax,0xffffffff
  803b46:	74 2d                	je     803b75 <manage_proc+0x44>
        task[cur_proc].utime++;
  803b48:	8b 05 de 1a c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11ade]        # 41562c <cur_proc>
  803b4e:	48 63 d0             	movsxd rdx,eax
  803b51:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  803b58:	48 81 c2 bc 84 40 00 	add    rdx,0x4084bc
  803b5f:	8b 12                	mov    edx,DWORD PTR [rdx]
  803b61:	83 c2 01             	add    edx,0x1
  803b64:	48 98                	cdqe   
  803b66:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803b6d:	48 05 bc 84 40 00    	add    rax,0x4084bc
  803b73:	89 10                	mov    DWORD PTR [rax],edx
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803b75:	8b 05 b1 1a c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11ab1]        # 41562c <cur_proc>
  803b7b:	83 f8 ff             	cmp    eax,0xffffffff
  803b7e:	74 3c                	je     803bbc <manage_proc+0x8b>
  803b80:	8b 05 a6 1a c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11aa6]        # 41562c <cur_proc>
  803b86:	48 98                	cdqe   
  803b88:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803b8f:	48 05 bc 84 40 00    	add    rax,0x4084bc
  803b95:	8b 00                	mov    eax,DWORD PTR [rax]
  803b97:	83 f8 0a             	cmp    eax,0xa
  803b9a:	77 20                	ja     803bbc <manage_proc+0x8b>
    task[cur_proc].stat!=READY){
  803b9c:	8b 05 8a 1a c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11a8a]        # 41562c <cur_proc>
  803ba2:	48 98                	cdqe   
  803ba4:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803bab:	48 05 b8 84 40 00    	add    rax,0x4084b8
  803bb1:	8b 00                	mov    eax,DWORD PTR [rax]
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803bb3:	83 f8 01             	cmp    eax,0x1
  803bb6:	0f 84 02 01 00 00    	je     803cbe <manage_proc+0x18d>
        if(cur_proc!=-1)
  803bbc:	8b 05 6a 1a c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11a6a]        # 41562c <cur_proc>
  803bc2:	83 f8 ff             	cmp    eax,0xffffffff
  803bc5:	74 1b                	je     803be2 <manage_proc+0xb1>
            task[cur_proc].utime=0;
  803bc7:	8b 05 5f 1a c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11a5f]        # 41562c <cur_proc>
  803bcd:	48 98                	cdqe   
  803bcf:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803bd6:	48 05 bc 84 40 00    	add    rax,0x4084bc
  803bdc:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        //find
        int i=cur_proc+1;
  803be2:	8b 05 44 1a c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11a44]        # 41562c <cur_proc>
  803be8:	83 c0 01             	add    eax,0x1
  803beb:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        int times=0;
  803bee:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
        //轮询，直到有一个符合条件
        while(times<10){
  803bf5:	eb 52                	jmp    803c49 <manage_proc+0x118>
            if(task[i].pid!=-1&&task[i].stat==READY&&i!=cur_proc){
  803bf7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803bfa:	48 98                	cdqe   
  803bfc:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803c03:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803c09:	8b 00                	mov    eax,DWORD PTR [rax]
  803c0b:	83 f8 ff             	cmp    eax,0xffffffff
  803c0e:	74 24                	je     803c34 <manage_proc+0x103>
  803c10:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803c13:	48 98                	cdqe   
  803c15:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803c1c:	48 05 b8 84 40 00    	add    rax,0x4084b8
  803c22:	8b 00                	mov    eax,DWORD PTR [rax]
  803c24:	83 f8 01             	cmp    eax,0x1
  803c27:	75 0b                	jne    803c34 <manage_proc+0x103>
  803c29:	8b 05 fd 19 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc119fd]        # 41562c <cur_proc>
  803c2f:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  803c32:	75 1d                	jne    803c51 <manage_proc+0x120>
                break;
            }
            i++;
  803c34:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
            if(i>=MAX_TASKS){
  803c38:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  803c3c:	7e 0b                	jle    803c49 <manage_proc+0x118>
                times++;
  803c3e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                i=0;
  803c42:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        while(times<10){
  803c49:	83 7d f8 09          	cmp    DWORD PTR [rbp-0x8],0x9
  803c4d:	7e a8                	jle    803bf7 <manage_proc+0xc6>
  803c4f:	eb 01                	jmp    803c52 <manage_proc+0x121>
                break;
  803c51:	90                   	nop
            }
        }
        if(times==10)return;//超过十次尝试都没有，暂时不切换
  803c52:	83 7d f8 0a          	cmp    DWORD PTR [rbp-0x8],0xa
  803c56:	74 69                	je     803cc1 <manage_proc+0x190>
        //switch
        task[cur_proc].stat=READY;
  803c58:	8b 05 ce 19 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc119ce]        # 41562c <cur_proc>
  803c5e:	48 98                	cdqe   
  803c60:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803c67:	48 05 b8 84 40 00    	add    rax,0x4084b8
  803c6d:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        task[i].stat=RUNNING;
  803c73:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803c76:	48 98                	cdqe   
  803c78:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803c7f:	48 05 b8 84 40 00    	add    rax,0x4084b8
  803c85:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        switch_to(&task[cur_proc], &task[i]);
  803c8b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803c8e:	48 98                	cdqe   
  803c90:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803c97:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  803c9e:	8b 05 88 19 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11988]        # 41562c <cur_proc>
  803ca4:	48 98                	cdqe   
  803ca6:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803cad:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803cb3:	48 89 d6             	mov    rsi,rdx
  803cb6:	48 89 c7             	mov    rdi,rax
  803cb9:	e8 82 0a 00 00       	call   804740 <switch_to>
    }
    return;
  803cbe:	90                   	nop
  803cbf:	eb 01                	jmp    803cc2 <manage_proc+0x191>
        if(times==10)return;//超过十次尝试都没有，暂时不切换
  803cc1:	90                   	nop
}
  803cc2:	c9                   	leave  
  803cc3:	c3                   	ret    

0000000000803cc4 <switch_proc_tss>:

void switch_proc_tss(int pnr)
{
  803cc4:	f3 0f 1e fa          	endbr64 
  803cc8:	55                   	push   rbp
  803cc9:	48 89 e5             	mov    rbp,rsp
  803ccc:	48 83 ec 20          	sub    rsp,0x20
  803cd0:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int sel=_TSS_IND(pnr)*8;
  803cd3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803cd6:	01 c0                	add    eax,eax
  803cd8:	83 c0 05             	add    eax,0x5
  803cdb:	c1 e0 03             	shl    eax,0x3
  803cde:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    cur_proc=pnr;
  803ce1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803ce4:	89 05 42 19 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc11942],eax        # 41562c <cur_proc>
    switch_proc_asm(sel);
  803cea:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803ced:	89 c7                	mov    edi,eax
  803cef:	e8 e6 84 00 00       	call   80c1da <switch_proc_asm>
}
  803cf4:	90                   	nop
  803cf5:	c9                   	leave  
  803cf6:	c3                   	ret    

0000000000803cf7 <switch_proc>:
void switch_proc(int pnr){
  803cf7:	f3 0f 1e fa          	endbr64 
  803cfb:	55                   	push   rbp
  803cfc:	48 89 e5             	mov    rbp,rsp
  803cff:	48 81 ec 30 03 00 00 	sub    rsp,0x330
  803d06:	89 bd dc fc ff ff    	mov    DWORD PTR [rbp-0x324],edi
    //printf("switching proc to %d\n",pnr);
    //printf("eip:%x\n",task[pnr].tss.eip);
    struct process p=task[pnr];
  803d0c:	8b 85 dc fc ff ff    	mov    eax,DWORD PTR [rbp-0x324]
  803d12:	48 98                	cdqe   
  803d14:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803d1b:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  803d22:	48 8d 85 e0 fc ff ff 	lea    rax,[rbp-0x320]
  803d29:	b9 63 00 00 00       	mov    ecx,0x63
  803d2e:	48 89 c7             	mov    rdi,rax
  803d31:	48 89 d6             	mov    rsi,rdx
  803d34:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
  803d37:	48 89 f2             	mov    rdx,rsi
  803d3a:	48 89 f8             	mov    rax,rdi
  803d3d:	8b 0a                	mov    ecx,DWORD PTR [rdx]
  803d3f:	89 08                	mov    DWORD PTR [rax],ecx
    save_context(&task[cur_proc].tss);
  803d41:	8b 05 e5 18 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc118e5]        # 41562c <cur_proc>
  803d47:	48 98                	cdqe   
  803d49:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803d50:	48 05 d0 01 00 00    	add    rax,0x1d0
  803d56:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803d5c:	48 83 c0 08          	add    rax,0x8
  803d60:	48 89 c7             	mov    rdi,rax
  803d63:	e8 4c 00 00 00       	call   803db4 <save_context>
//    //重新设置0号进程
//    task[0].tss.eip=proc_zero;
//    task[0].tss.cr3=PAGE_INDEX_ADDR;
//    task[0].tss.eflags=0x202;
    cur_proc=pnr;
  803d68:	8b 85 dc fc ff ff    	mov    eax,DWORD PTR [rbp-0x324]
  803d6e:	89 05 b8 18 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc118b8],eax        # 41562c <cur_proc>
    int sel=_TSS_IND(pnr)*8;
  803d74:	8b 85 dc fc ff ff    	mov    eax,DWORD PTR [rbp-0x324]
  803d7a:	01 c0                	add    eax,eax
  803d7c:	83 c0 05             	add    eax,0x5
  803d7f:	c1 e0 03             	shl    eax,0x3
  803d82:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    switch_to(NULL, &task[pnr].tss);
  803d85:	8b 85 dc fc ff ff    	mov    eax,DWORD PTR [rbp-0x324]
  803d8b:	48 98                	cdqe   
  803d8d:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803d94:	48 05 d0 01 00 00    	add    rax,0x1d0
  803d9a:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803da0:	48 83 c0 08          	add    rax,0x8
  803da4:	48 89 c6             	mov    rsi,rax
  803da7:	bf 00 00 00 00       	mov    edi,0x0
  803dac:	e8 8f 09 00 00       	call   804740 <switch_to>
    //asm volatile("push %0":"=r"(task[pnr].tss.eip));
    //switch_proc_asm(pnr*8+0x8*3);
}
  803db1:	90                   	nop
  803db2:	c9                   	leave  
  803db3:	c3                   	ret    

0000000000803db4 <save_context>:
void save_context(TSS *tss)
{
  803db4:	f3 0f 1e fa          	endbr64 
  803db8:	55                   	push   rbp
  803db9:	48 89 e5             	mov    rbp,rsp
  803dbc:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//    tss->esi=scene_saver.esi;
//    tss->edi=scene_saver.edi;
//    tss->eflags=scene_saver.eflags;
//    tss->esp=scene_saver.esp;
//    tss->ebp=scene_saver.ebp;
}
  803dc0:	90                   	nop
  803dc1:	5d                   	pop    rbp
  803dc2:	c3                   	ret    

0000000000803dc3 <palloc>:
    task[index].stat=READY;
    return index;
} */
//为指定进程申请新的内存，并返回这块内存的线性地址。
void* palloc(int proc_index,int size)
{
  803dc3:	f3 0f 1e fa          	endbr64 
  803dc7:	55                   	push   rbp
  803dc8:	48 89 e5             	mov    rbp,rsp
  803dcb:	48 83 ec 60          	sub    rsp,0x60
  803dcf:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  803dd2:	89 75 a8             	mov    DWORD PTR [rbp-0x58],esi
    int page_c=size/4096+size%4096?1:0;
  803dd5:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  803dd8:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  803dde:	85 c0                	test   eax,eax
  803de0:	0f 48 c2             	cmovs  eax,edx
  803de3:	c1 f8 0c             	sar    eax,0xc
  803de6:	89 c1                	mov    ecx,eax
  803de8:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  803deb:	99                   	cdq    
  803dec:	c1 ea 14             	shr    edx,0x14
  803def:	01 d0                	add    eax,edx
  803df1:	25 ff 0f 00 00       	and    eax,0xfff
  803df6:	29 d0                	sub    eax,edx
  803df8:	01 c8                	add    eax,ecx
  803dfa:	85 c0                	test   eax,eax
  803dfc:	0f 95 c0             	setne  al
  803dff:	0f b6 c0             	movzx  eax,al
  803e02:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=0;
  803e05:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    void *ptr=NULL;
  803e0c:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  803e13:	00 
    page_item *pgind=NULL;//task[proc_index].tss.cr3;
  803e14:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  803e1b:	00 
    pgind++;
  803e1c:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  803e21:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [rbp-0x14],0x1
  803e28:	e9 30 02 00 00       	jmp    80405d <palloc+0x29a>
    {
        page_item* tblp=*pgind&0xfffff000;
  803e2d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803e31:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803e34:	25 00 f0 ff ff       	and    eax,0xfffff000
  803e39:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for(int j=0;j<1024;j++)
  803e3d:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  803e44:	e9 fe 01 00 00       	jmp    804047 <palloc+0x284>
        {
            int v=*tblp&PAGE_PRESENT;
  803e49:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803e4d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803e50:	83 e0 01             	and    eax,0x1
  803e53:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
            if(!v)
  803e56:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  803e5a:	0f 85 de 01 00 00    	jne    80403e <palloc+0x27b>
            {
                int new_pg=req_a_page();
  803e60:	b8 00 00 00 00       	mov    eax,0x0
  803e65:	e8 09 d8 ff ff       	call   801673 <req_a_page>
  803e6a:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
                if(new_pg==-1)
  803e6d:	83 7d c8 ff          	cmp    DWORD PTR [rbp-0x38],0xffffffff
  803e71:	0f 85 b9 00 00 00    	jne    803f30 <palloc+0x16d>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  803e77:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803e7a:	48 98                	cdqe   
  803e7c:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803e83:	48 05 08 85 40 00    	add    rax,0x408508
  803e89:	0f b7 00             	movzx  eax,WORD PTR [rax]
  803e8c:	0f b7 c0             	movzx  eax,ax
  803e8f:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  803e92:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803e95:	48 98                	cdqe   
  803e97:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803e9e:	48 05 00 85 40 00    	add    rax,0x408500
  803ea4:	0f b7 40 0d          	movzx  eax,WORD PTR [rax+0xd]
  803ea8:	0f b7 c0             	movzx  eax,ax
  803eab:	c1 e0 10             	shl    eax,0x10
  803eae:	25 00 00 0f 00       	and    eax,0xf0000
  803eb3:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    size+=c;
  803eb6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803eb9:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  803ebc:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  803ebf:	89 c2                	mov    edx,eax
  803ec1:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803ec4:	48 98                	cdqe   
  803ec6:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803ecd:	48 05 08 85 40 00    	add    rax,0x408508
  803ed3:	66 89 10             	mov    WORD PTR [rax],dx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  803ed6:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803ed9:	48 98                	cdqe   
  803edb:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803ee2:	48 05 00 85 40 00    	add    rax,0x408500
  803ee8:	0f b7 40 0d          	movzx  eax,WORD PTR [rax+0xd]
  803eec:	0f b7 c0             	movzx  eax,ax
  803eef:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    tmp_attr&=0xfff0;
  803ef2:	81 65 b0 f0 ff 00 00 	and    DWORD PTR [rbp-0x50],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  803ef9:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  803efc:	c1 e8 10             	shr    eax,0x10
  803eff:	83 e0 0f             	and    eax,0xf
  803f02:	89 c2                	mov    edx,eax
  803f04:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  803f07:	01 d0                	add    eax,edx
  803f09:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  803f0c:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  803f0f:	89 c2                	mov    edx,eax
  803f11:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803f14:	48 98                	cdqe   
  803f16:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803f1d:	48 05 00 85 40 00    	add    rax,0x408500
  803f23:	66 89 50 0d          	mov    WORD PTR [rax+0xd],dx
                    return ptr;//失败了，只能申请一部分的内存或者返回NULL
  803f27:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803f2b:	e9 3f 01 00 00       	jmp    80406f <palloc+0x2ac>
                }
                int addr=get_phyaddr(new_pg);
  803f30:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  803f33:	89 c7                	mov    edi,eax
  803f35:	e8 28 d9 ff ff       	call   801862 <get_phyaddr>
  803f3a:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
                set_page_item(tblp,addr,PAGE_PRESENT|\
  803f3d:	8b 4d c4             	mov    ecx,DWORD PTR [rbp-0x3c]
  803f40:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803f44:	ba 07 00 00 00       	mov    edx,0x7
  803f49:	89 ce                	mov    esi,ecx
  803f4b:	48 89 c7             	mov    rdi,rax
  803f4e:	e8 22 d9 ff ff       	call   801875 <set_page_item>
                PAGE_RWX|PAGE_FOR_ALL);
                int laddr=i*0x400000+j*0x1000;//线性地址
  803f53:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803f56:	c1 e0 0a             	shl    eax,0xa
  803f59:	89 c2                	mov    edx,eax
  803f5b:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  803f5e:	01 d0                	add    eax,edx
  803f60:	c1 e0 0c             	shl    eax,0xc
  803f63:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
                if(ptr==NULL)
  803f66:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
  803f6b:	75 09                	jne    803f76 <palloc+0x1b3>
                {
                   // ptr=laddr;
                    palloc_paddr=addr;
  803f6d:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  803f70:	89 05 be 16 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc116be],eax        # 415634 <palloc_paddr>
                }
                page_c--;
  803f76:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
                c++;
  803f7a:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                if(page_c==0)
  803f7e:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  803f82:	0f 85 b6 00 00 00    	jne    80403e <palloc+0x27b>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  803f88:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803f8b:	48 98                	cdqe   
  803f8d:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803f94:	48 05 08 85 40 00    	add    rax,0x408508
  803f9a:	0f b7 00             	movzx  eax,WORD PTR [rax]
  803f9d:	0f b7 c0             	movzx  eax,ax
  803fa0:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  803fa3:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803fa6:	48 98                	cdqe   
  803fa8:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803faf:	48 05 00 85 40 00    	add    rax,0x408500
  803fb5:	0f b7 40 0d          	movzx  eax,WORD PTR [rax+0xd]
  803fb9:	0f b7 c0             	movzx  eax,ax
  803fbc:	c1 e0 10             	shl    eax,0x10
  803fbf:	25 00 00 0f 00       	and    eax,0xf0000
  803fc4:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    size+=c;
  803fc7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803fca:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  803fcd:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  803fd0:	89 c2                	mov    edx,eax
  803fd2:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803fd5:	48 98                	cdqe   
  803fd7:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803fde:	48 05 08 85 40 00    	add    rax,0x408508
  803fe4:	66 89 10             	mov    WORD PTR [rax],dx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  803fe7:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803fea:	48 98                	cdqe   
  803fec:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  803ff3:	48 05 00 85 40 00    	add    rax,0x408500
  803ff9:	0f b7 40 0d          	movzx  eax,WORD PTR [rax+0xd]
  803ffd:	0f b7 c0             	movzx  eax,ax
  804000:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    tmp_attr&=0xfff0;
  804003:	81 65 b8 f0 ff 00 00 	and    DWORD PTR [rbp-0x48],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  80400a:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  80400d:	c1 e8 10             	shr    eax,0x10
  804010:	83 e0 0f             	and    eax,0xf
  804013:	89 c2                	mov    edx,eax
  804015:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  804018:	01 d0                	add    eax,edx
  80401a:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  80401d:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  804020:	89 c2                	mov    edx,eax
  804022:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804025:	48 98                	cdqe   
  804027:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80402e:	48 05 00 85 40 00    	add    rax,0x408500
  804034:	66 89 50 0d          	mov    WORD PTR [rax+0xd],dx
                    return ptr;
  804038:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80403c:	eb 31                	jmp    80406f <palloc+0x2ac>
                }
            }
            tblp++;
  80403e:	48 83 45 e0 08       	add    QWORD PTR [rbp-0x20],0x8
        for(int j=0;j<1024;j++)
  804043:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  804047:	81 7d dc ff 03 00 00 	cmp    DWORD PTR [rbp-0x24],0x3ff
  80404e:	0f 8e f5 fd ff ff    	jle    803e49 <palloc+0x86>
        }
        pgind++;
  804054:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  804059:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  80405d:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  804064:	0f 8e c3 fd ff ff    	jle    803e2d <palloc+0x6a>
    }
    return NULL;
  80406a:	b8 00 00 00 00       	mov    eax,0x0
}
  80406f:	c9                   	leave  
  804070:	c3                   	ret    

0000000000804071 <malloc>:
//为当前进程申请新的内存，并返回这块内存的线性地址。
void* malloc(int size)
{
  804071:	f3 0f 1e fa          	endbr64 
  804075:	55                   	push   rbp
  804076:	48 89 e5             	mov    rbp,rsp
  804079:	48 83 ec 10          	sub    rsp,0x10
  80407d:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return palloc(cur_proc,size);
  804080:	8b 05 a6 15 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc115a6]        # 41562c <cur_proc>
  804086:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804089:	89 d6                	mov    esi,edx
  80408b:	89 c7                	mov    edi,eax
  80408d:	e8 31 fd ff ff       	call   803dc3 <palloc>
}
  804092:	c9                   	leave  
  804093:	c3                   	ret    

0000000000804094 <proc_end>:
void proc_end()
{
  804094:	f3 0f 1e fa          	endbr64 
  804098:	55                   	push   rbp
  804099:	48 89 e5             	mov    rbp,rsp
  80409c:	48 83 ec 10          	sub    rsp,0x10
    int ret;
    asm volatile("mov %%eax,%0":"=m"(ret));
  8040a0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("proc #%d ended with retv %d.\n",cur_proc,ret);
    //切换堆栈
    //asm volatile("mov %0,%%rsp"::"r"(task[0].tss.esp));
    del_proc(cur_proc);
  8040a3:	8b 05 83 15 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11583]        # 41562c <cur_proc>
  8040a9:	89 c7                	mov    edi,eax
  8040ab:	e8 75 00 00 00       	call   804125 <del_proc>
    if(task[cur_proc].parent_pid!=-1){
  8040b0:	8b 05 76 15 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11576]        # 41562c <cur_proc>
  8040b6:	48 98                	cdqe   
  8040b8:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8040bf:	48 05 3c 85 40 00    	add    rax,0x40853c
  8040c5:	8b 00                	mov    eax,DWORD PTR [rax]
  8040c7:	83 f8 ff             	cmp    eax,0xffffffff
  8040ca:	74 4c                	je     804118 <proc_end+0x84>
        task[task[cur_proc].parent_pid].stat=READY;
  8040cc:	8b 05 5a 15 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1155a]        # 41562c <cur_proc>
  8040d2:	48 98                	cdqe   
  8040d4:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8040db:	48 05 3c 85 40 00    	add    rax,0x40853c
  8040e1:	8b 00                	mov    eax,DWORD PTR [rax]
  8040e3:	89 c0                	mov    eax,eax
  8040e5:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8040ec:	48 05 b8 84 40 00    	add    rax,0x4084b8
  8040f2:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        switch_proc_tss(task[cur_proc].parent_pid);
  8040f8:	8b 05 2e 15 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1152e]        # 41562c <cur_proc>
  8040fe:	48 98                	cdqe   
  804100:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804107:	48 05 3c 85 40 00    	add    rax,0x40853c
  80410d:	8b 00                	mov    eax,DWORD PTR [rax]
  80410f:	89 c7                	mov    edi,eax
  804111:	e8 ae fb ff ff       	call   803cc4 <switch_proc_tss>
    }
    else
        switch_proc_tss(0);
    //syscall(SYSCALL_DEL_PROC,cur_proc,0,0,0,0);
}
  804116:	eb 0a                	jmp    804122 <proc_end+0x8e>
        switch_proc_tss(0);
  804118:	bf 00 00 00 00       	mov    edi,0x0
  80411d:	e8 a2 fb ff ff       	call   803cc4 <switch_proc_tss>
}
  804122:	90                   	nop
  804123:	c9                   	leave  
  804124:	c3                   	ret    

0000000000804125 <del_proc>:
void del_proc(int pnr)
{
  804125:	f3 0f 1e fa          	endbr64 
  804129:	55                   	push   rbp
  80412a:	48 89 e5             	mov    rbp,rsp
  80412d:	48 83 ec 30          	sub    rsp,0x30
  804131:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
    task[pnr].stat=ENDED;
  804134:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804137:	48 98                	cdqe   
  804139:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804140:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804146:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[pnr].pid=-1;
  80414c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80414f:	48 98                	cdqe   
  804151:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804158:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80415e:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    //释放申请的页面
    page_item *p;//task[pnr].tss.cr3;
    p++;
  804164:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
    for(;(*p&PAGE_PRESENT)!=0;p++)
  804169:	eb 63                	jmp    8041ce <del_proc+0xa9>
    {
        page_item *tp=*p&0xfffff000;
  80416b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80416f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804172:	25 00 f0 ff ff       	and    eax,0xfffff000
  804177:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<1024;i++)
  80417b:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804182:	eb 30                	jmp    8041b4 <del_proc+0x8f>
        {
            unsigned int present=*tp&PAGE_PRESENT;
  804184:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804188:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80418b:	83 e0 01             	and    eax,0x1
  80418e:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            if(present)
  804191:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  804195:	74 14                	je     8041ab <del_proc+0x86>
            {
                free_page(*tp&0xfffff000);
  804197:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80419b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80419e:	25 00 f0 ff ff       	and    eax,0xfffff000
  8041a3:	48 89 c7             	mov    rdi,rax
  8041a6:	e8 98 d5 ff ff       	call   801743 <free_page>
                //printf("freed page at %x.\n",*tp&0xfffff000);
            }
            tp++;
  8041ab:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
        for(int i=0;i<1024;i++)
  8041b0:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8041b4:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  8041bb:	7e c7                	jle    804184 <del_proc+0x5f>
        }
        vmfree(tp);
  8041bd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8041c1:	48 89 c7             	mov    rdi,rax
  8041c4:	e8 7f d1 ff ff       	call   801348 <vmfree>
    for(;(*p&PAGE_PRESENT)!=0;p++)
  8041c9:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
  8041ce:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8041d2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8041d5:	83 e0 01             	and    eax,0x1
  8041d8:	48 85 c0             	test   rax,rax
  8041db:	75 8e                	jne    80416b <del_proc+0x46>
    }
    //释放存放页目录的页面
    vmfree(p);
  8041dd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8041e1:	48 89 c7             	mov    rdi,rax
  8041e4:	e8 5f d1 ff ff       	call   801348 <vmfree>
    //从进程中解除cr3,tss和ldt
    //switch_proc_tss(task[pnr]);
}
  8041e9:	90                   	nop
  8041ea:	c9                   	leave  
  8041eb:	c3                   	ret    

00000000008041ec <set_proc_stat>:

int set_proc_stat(int pid,int stat)
{
  8041ec:	f3 0f 1e fa          	endbr64 
  8041f0:	55                   	push   rbp
  8041f1:	48 89 e5             	mov    rbp,rsp
  8041f4:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8041f7:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==-1)return -1;
  8041fa:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  8041fe:	75 07                	jne    804207 <set_proc_stat+0x1b>
  804200:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804205:	eb 79                	jmp    804280 <set_proc_stat+0x94>
    int i=0;
  804207:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;task[i].pid!=pid;i++);
  80420e:	eb 04                	jmp    804214 <set_proc_stat+0x28>
  804210:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  804214:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804217:	48 98                	cdqe   
  804219:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804220:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804226:	8b 10                	mov    edx,DWORD PTR [rax]
  804228:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80422b:	39 c2                	cmp    edx,eax
  80422d:	75 e1                	jne    804210 <set_proc_stat+0x24>
    if(i==MAX_PROC_COUNT)return -1;
  80422f:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  804233:	75 07                	jne    80423c <set_proc_stat+0x50>
  804235:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80423a:	eb 44                	jmp    804280 <set_proc_stat+0x94>
    task[i].stat=stat;
  80423c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80423f:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804242:	48 63 d2             	movsxd rdx,edx
  804245:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  80424c:	48 81 c2 b8 84 40 00 	add    rdx,0x4084b8
  804253:	89 02                	mov    DWORD PTR [rdx],eax
    //如果这就是正在运行的进程，那么马上停止
    if(cur_proc==i)
  804255:	8b 05 d1 13 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc113d1]        # 41562c <cur_proc>
  80425b:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  80425e:	75 1b                	jne    80427b <set_proc_stat+0x8f>
        task[cur_proc].utime=MAX_UTIME;
  804260:	8b 05 c6 13 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc113c6]        # 41562c <cur_proc>
  804266:	48 98                	cdqe   
  804268:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80426f:	48 05 bc 84 40 00    	add    rax,0x4084bc
  804275:	c7 00 0a 00 00 00    	mov    DWORD PTR [rax],0xa
    return 0;
  80427b:	b8 00 00 00 00       	mov    eax,0x0
}
  804280:	5d                   	pop    rbp
  804281:	c3                   	ret    

0000000000804282 <add_proc_openf>:

    return 0;
} */

int add_proc_openf(struct index_node *entry)
{
  804282:	f3 0f 1e fa          	endbr64 
  804286:	55                   	push   rbp
  804287:	48 89 e5             	mov    rbp,rsp
  80428a:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_PROC_OPENF;i++){
  80428e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  804295:	eb 67                	jmp    8042fe <add_proc_openf+0x7c>
        if(task[cur_proc].openf[i]==NULL)
  804297:	8b 05 8f 13 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1138f]        # 41562c <cur_proc>
  80429d:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8042a0:	48 63 d2             	movsxd rdx,edx
  8042a3:	48 83 c2 1a          	add    rdx,0x1a
  8042a7:	48 98                	cdqe   
  8042a9:	48 c1 e2 03          	shl    rdx,0x3
  8042ad:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8042b4:	48 01 d0             	add    rax,rdx
  8042b7:	48 05 a8 84 40 00    	add    rax,0x4084a8
  8042bd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8042c0:	48 85 c0             	test   rax,rax
  8042c3:	75 35                	jne    8042fa <add_proc_openf+0x78>
        {
            task[cur_proc].openf[i]=entry;
  8042c5:	8b 05 61 13 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11361]        # 41562c <cur_proc>
  8042cb:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8042ce:	48 63 d2             	movsxd rdx,edx
  8042d1:	48 83 c2 1a          	add    rdx,0x1a
  8042d5:	48 98                	cdqe   
  8042d7:	48 c1 e2 03          	shl    rdx,0x3
  8042db:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8042e2:	48 01 d0             	add    rax,rdx
  8042e5:	48 8d 90 a8 84 40 00 	lea    rdx,[rax+0x4084a8]
  8042ec:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8042f0:	48 89 02             	mov    QWORD PTR [rdx],rax
            return 0;
  8042f3:	b8 00 00 00 00       	mov    eax,0x0
  8042f8:	eb 0f                	jmp    804309 <add_proc_openf+0x87>
    for(int i=0;i<MAX_PROC_OPENF;i++){
  8042fa:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8042fe:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  804302:	7e 93                	jle    804297 <add_proc_openf+0x15>
        }
    }
    return -1;//full
  804304:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  804309:	5d                   	pop    rbp
  80430a:	c3                   	ret    

000000000080430b <sys_exit>:
/*
 * 进程结束。
 * */
int sys_exit(int code)
{
  80430b:	f3 0f 1e fa          	endbr64 
  80430f:	55                   	push   rbp
  804310:	48 89 e5             	mov    rbp,rsp
  804313:	48 83 ec 10          	sub    rsp,0x10
  804317:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    del_proc(cur_proc);
  80431a:	8b 05 0c 13 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1130c]        # 41562c <cur_proc>
  804320:	89 c7                	mov    edi,eax
  804322:	e8 fe fd ff ff       	call   804125 <del_proc>
    while(1)
        manage_proc();
  804327:	b8 00 00 00 00       	mov    eax,0x0
  80432c:	e8 00 f8 ff ff       	call   803b31 <manage_proc>
  804331:	eb f4                	jmp    804327 <sys_exit+0x1c>

0000000000804333 <reg_proc>:
    dllmain(NULL,0,NULL);
    
}*/

int reg_proc(addr_t entry, struct index_node *cwd, struct index_node *exef)
{
  804333:	f3 0f 1e fa          	endbr64 
  804337:	55                   	push   rbp
  804338:	48 89 e5             	mov    rbp,rsp
  80433b:	53                   	push   rbx
  80433c:	48 83 ec 48          	sub    rsp,0x48
  804340:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  804344:	48 89 75 c0          	mov    QWORD PTR [rbp-0x40],rsi
  804348:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
    
    int i=req_proc();
  80434c:	b8 00 00 00 00       	mov    eax,0x0
  804351:	e8 4d f5 ff ff       	call   8038a3 <req_proc>
  804356:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(i==-1)return -1;
  804359:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  80435d:	75 0a                	jne    804369 <reg_proc+0x36>
  80435f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804364:	e9 8c 01 00 00       	jmp    8044f5 <reg_proc+0x1c2>

    //栈顶设置在了4G处
    set_proc(0, 0, 0, 0, DS_USER, CS_USER, DS_USER, DS_USER\
  804369:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80436d:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  804370:	52                   	push   rdx
  804371:	6a 00                	push   0x0
  804373:	50                   	push   rax
  804374:	6a 00                	push   0x0
  804376:	6a 00                	push   0x0
  804378:	6a 00                	push   0x0
  80437a:	68 00 f0 ff ff       	push   0xfffffffffffff000
  80437f:	c7 44 24 04 ff ff 00 	mov    DWORD PTR [rsp+0x4],0xffff
  804386:	00 
  804387:	6a 28                	push   0x28
  804389:	6a 28                	push   0x28
  80438b:	6a 28                	push   0x28
  80438d:	6a 28                	push   0x28
  80438f:	41 b9 30 00 00 00    	mov    r9d,0x30
  804395:	41 b8 28 00 00 00    	mov    r8d,0x28
  80439b:	b9 00 00 00 00       	mov    ecx,0x0
  8043a0:	ba 00 00 00 00       	mov    edx,0x0
  8043a5:	be 00 00 00 00       	mov    esi,0x0
  8043aa:	bf 00 00 00 00       	mov    edi,0x0
  8043af:	e8 bb f5 ff ff       	call   80396f <set_proc>
  8043b4:	48 83 c4 58          	add    rsp,0x58
, DS_USER, DS_USER, STACK_TOP, 0, 0, 0, entry, 0, i);
    task[i].pml4=vmalloc();
  8043b8:	b8 00 00 00 00       	mov    eax,0x0
  8043bd:	e8 f7 ce ff ff       	call   8012b9 <vmalloc>
  8043c2:	48 89 c2             	mov    rdx,rax
  8043c5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8043c8:	48 98                	cdqe   
  8043ca:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8043d1:	48 05 60 85 40 00    	add    rax,0x408560
  8043d7:	48 89 10             	mov    QWORD PTR [rax],rdx
    task[i].pml4[0]=vmalloc();
  8043da:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8043dd:	48 98                	cdqe   
  8043df:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8043e6:	48 05 60 85 40 00    	add    rax,0x408560
  8043ec:	48 8b 18             	mov    rbx,QWORD PTR [rax]
  8043ef:	b8 00 00 00 00       	mov    eax,0x0
  8043f4:	e8 c0 ce ff ff       	call   8012b9 <vmalloc>
  8043f9:	48 89 03             	mov    QWORD PTR [rbx],rax
    unsigned long *pdpt=task[i].pml4;
  8043fc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8043ff:	48 98                	cdqe   
  804401:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804408:	48 05 60 85 40 00    	add    rax,0x408560
  80440e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804411:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    //pdpt第一项(0-1GB)设置为内核空间，这样才能访问中断
    set_1gb_pdpt(pdpt,0,PAGE_PRESENT|PAGE_RWX);
  804415:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804419:	ba 03 00 00 00       	mov    edx,0x3
  80441e:	be 00 00 00 00       	mov    esi,0x0
  804423:	48 89 c7             	mov    rdi,rax
  804426:	e8 9b d4 ff ff       	call   8018c6 <set_1gb_pdpt>

    //申请一项pd,里面申请一2mb页用于堆栈
    addr_t *stackb=vmalloc();
  80442b:	b8 00 00 00 00       	mov    eax,0x0
  804430:	e8 84 ce ff ff       	call   8012b9 <vmalloc>
  804435:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    pdpt[3]=(unsigned long)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//3-4G分配栈空间
  804439:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80443d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804441:	48 83 c0 18          	add    rax,0x18
  804445:	48 83 ca 07          	or     rdx,0x7
  804449:	48 89 10             	mov    QWORD PTR [rax],rdx
    set_2mb_pde(stackb + 511, get_phyaddr(req_a_page()), PAGE_FOR_ALL|PAGE_RWX);
  80444c:	b8 00 00 00 00       	mov    eax,0x0
  804451:	e8 1d d2 ff ff       	call   801673 <req_a_page>
  804456:	89 c7                	mov    edi,eax
  804458:	e8 05 d4 ff ff       	call   801862 <get_phyaddr>
  80445d:	89 c1                	mov    ecx,eax
  80445f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804463:	48 05 f8 0f 00 00    	add    rax,0xff8
  804469:	ba 06 00 00 00       	mov    edx,0x6
  80446e:	89 ce                	mov    esi,ecx
  804470:	48 89 c7             	mov    rdi,rax
  804473:	e8 a5 d4 ff ff       	call   80191d <set_2mb_pde>
    task[i].regs.cr3=task[i].pml4;
  804478:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80447b:	48 98                	cdqe   
  80447d:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804484:	48 05 60 85 40 00    	add    rax,0x408560
  80448a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80448d:	48 89 c2             	mov    rdx,rax
  804490:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804493:	48 98                	cdqe   
  804495:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80449c:	48 05 e0 86 40 00    	add    rax,0x4086e0
  8044a2:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx

    task[i].stat=READY;
  8044a6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8044a9:	48 98                	cdqe   
  8044ab:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8044b2:	48 05 b8 84 40 00    	add    rax,0x4084b8
  8044b8:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[i].cwd=cwd;
  8044be:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8044c1:	48 98                	cdqe   
  8044c3:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8044ca:	48 8d 90 68 85 40 00 	lea    rdx,[rax+0x408568]
  8044d1:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8044d5:	48 89 02             	mov    QWORD PTR [rdx],rax
    task[i].exef=exef;
  8044d8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8044db:	48 98                	cdqe   
  8044dd:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8044e4:	48 8d 90 70 85 40 00 	lea    rdx,[rax+0x408570]
  8044eb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8044ef:	48 89 02             	mov    QWORD PTR [rdx],rax

    return i;
  8044f2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    proc_ret_stack *pstack=stack_paddr+stack_size-12;
    pstack->argc=0;
    pstack->argv=0;
    pstack->proc_end_addr=proc_end;
    int *pptr=pstack;*/
}
  8044f5:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8044f9:	c9                   	leave  
  8044fa:	c3                   	ret    

00000000008044fb <sys_malloc>:

void * sys_malloc(int size)
{
  8044fb:	f3 0f 1e fa          	endbr64 
  8044ff:	55                   	push   rbp
  804500:	48 89 e5             	mov    rbp,rsp
  804503:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    //
    int n=size/CHUNK_SIZE+size%CHUNK_SIZE?1:0;
  804506:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804509:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80450f:	85 c0                	test   eax,eax
  804511:	0f 48 c2             	cmovs  eax,edx
  804514:	c1 f8 0c             	sar    eax,0xc
  804517:	89 c1                	mov    ecx,eax
  804519:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80451c:	99                   	cdq    
  80451d:	c1 ea 14             	shr    edx,0x14
  804520:	01 d0                	add    eax,edx
  804522:	25 ff 0f 00 00       	and    eax,0xfff
  804527:	29 d0                	sub    eax,edx
  804529:	01 c8                	add    eax,ecx
  80452b:	85 c0                	test   eax,eax
  80452d:	0f 95 c0             	setne  al
  804530:	0f b6 c0             	movzx  eax,al
  804533:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    chunk_header *hp=(chunk_header*)task[cur_proc].mem_struct.heap_base;
  804536:	8b 05 f0 10 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc110f0]        # 41562c <cur_proc>
  80453c:	48 98                	cdqe   
  80453e:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804545:	48 05 c8 84 40 00    	add    rax,0x4084c8
  80454b:	8b 00                	mov    eax,DWORD PTR [rax]
  80454d:	48 98                	cdqe   
  80454f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804553:	eb 0c                	jmp    804561 <sys_malloc+0x66>
        hp=hp->next;
  804555:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804559:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80455d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804561:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804565:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804569:	48 85 c0             	test   rax,rax
  80456c:	74 16                	je     804584 <sys_malloc+0x89>
  80456e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804572:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804575:	85 c0                	test   eax,eax
  804577:	75 0b                	jne    804584 <sys_malloc+0x89>
  804579:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80457d:	8b 00                	mov    eax,DWORD PTR [rax]
  80457f:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804582:	7e d1                	jle    804555 <sys_malloc+0x5a>
    if(hp->pgn<n)
  804584:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804588:	8b 00                	mov    eax,DWORD PTR [rax]
  80458a:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  80458d:	7e 7f                	jle    80460e <sys_malloc+0x113>
    {
        //上抬heap top
        if(task[cur_proc].mem_struct.heap_top+CHUNK_SIZE*n>=HEAP_MAXTOP)
  80458f:	8b 05 97 10 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11097]        # 41562c <cur_proc>
  804595:	48 98                	cdqe   
  804597:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80459e:	48 05 cc 84 40 00    	add    rax,0x4084cc
  8045a4:	8b 10                	mov    edx,DWORD PTR [rax]
  8045a6:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8045a9:	c1 e0 0c             	shl    eax,0xc
  8045ac:	01 d0                	add    eax,edx
  8045ae:	3d ff ff ef 01       	cmp    eax,0x1efffff
  8045b3:	7e 0a                	jle    8045bf <sys_malloc+0xc4>
        {
            //超过顶部
            return NULL;
  8045b5:	b8 00 00 00 00       	mov    eax,0x0
  8045ba:	e9 c8 00 00 00       	jmp    804687 <sys_malloc+0x18c>
        }
        int needed=n-hp->pgn;
  8045bf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8045c3:	8b 10                	mov    edx,DWORD PTR [rax]
  8045c5:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8045c8:	29 d0                	sub    eax,edx
  8045ca:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
        char* p=task[cur_proc].mem_struct.heap_top;
  8045cd:	8b 05 59 10 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc11059]        # 41562c <cur_proc>
  8045d3:	48 98                	cdqe   
  8045d5:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8045dc:	48 05 cc 84 40 00    	add    rax,0x4084cc
  8045e2:	8b 00                	mov    eax,DWORD PTR [rax]
  8045e4:	48 98                	cdqe   
  8045e6:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  8045ea:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8045f1:	eb 13                	jmp    804606 <sys_malloc+0x10b>
        {
            *p=0;//触发缺页中断
  8045f3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8045f7:	c6 00 00             	mov    BYTE PTR [rax],0x0
            p+=PAGE_SIZE;
  8045fa:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  804601:	00 
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804602:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804606:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804609:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80460c:	7c e5                	jl     8045f3 <sys_malloc+0xf8>
        }
    }
    if(hp->pgn>n)
  80460e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804612:	8b 00                	mov    eax,DWORD PTR [rax]
  804614:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804617:	7d 59                	jge    804672 <sys_malloc+0x177>
    {
        //在后面新建一个头
        char *p=hp;
  804619:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80461d:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        p+=(n+1)*CHUNK_SIZE;//算上存储头一个
  804621:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804624:	83 c0 01             	add    eax,0x1
  804627:	c1 e0 0c             	shl    eax,0xc
  80462a:	48 98                	cdqe   
  80462c:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
        chunk_header *np=p;
  804630:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804634:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
        np->pgn=hp->pgn-n-1;
  804638:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80463c:	8b 00                	mov    eax,DWORD PTR [rax]
  80463e:	2b 45 e8             	sub    eax,DWORD PTR [rbp-0x18]
  804641:	8d 50 ff             	lea    edx,[rax-0x1]
  804644:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804648:	89 10                	mov    DWORD PTR [rax],edx
        np->next=hp->next;
  80464a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80464e:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  804652:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804656:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
        np->prev=hp;
  80465a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80465e:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804662:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
        hp->next=np;
  804666:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80466a:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80466e:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    }
    hp->alloc=1;//分配完毕
  804672:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804676:	c7 40 04 01 00 00 00 	mov    DWORD PTR [rax+0x4],0x1
    return (char*)hp+CHUNK_SIZE;//返回后边的第一个数据块地址
  80467d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804681:	48 05 00 10 00 00    	add    rax,0x1000
}
  804687:	5d                   	pop    rbp
  804688:	c3                   	ret    

0000000000804689 <sys_free>:
int sys_free(int ptr)
{
  804689:	f3 0f 1e fa          	endbr64 
  80468d:	55                   	push   rbp
  80468e:	48 89 e5             	mov    rbp,rsp
  804691:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    chunk_header *hp=ptr-CHUNK_SIZE;//回退到头
  804694:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804697:	2d 00 10 00 00       	sub    eax,0x1000
  80469c:	48 98                	cdqe   
  80469e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    hp->alloc=0;    //合并
  8046a2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8046a6:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
    //向后合并
    chunk_header *p=hp->next;
  8046ad:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8046b1:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8046b5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  8046b9:	eb 2e                	jmp    8046e9 <sys_free+0x60>
    {
        if(p->alloc==0)
  8046bb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046bf:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8046c2:	85 c0                	test   eax,eax
  8046c4:	75 2c                	jne    8046f2 <sys_free+0x69>
        {
            hp->pgn+=p->pgn+1;//把区域合并
  8046c6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8046ca:	8b 10                	mov    edx,DWORD PTR [rax]
  8046cc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046d0:	8b 00                	mov    eax,DWORD PTR [rax]
  8046d2:	83 c0 01             	add    eax,0x1
  8046d5:	01 c2                	add    edx,eax
  8046d7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8046db:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->next;
  8046dd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046e1:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8046e5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  8046e9:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8046ee:	75 cb                	jne    8046bb <sys_free+0x32>
  8046f0:	eb 01                	jmp    8046f3 <sys_free+0x6a>
            break;
  8046f2:	90                   	nop
    }
    //向前合并
    p=hp->prev;
  8046f3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8046f7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8046fb:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  8046ff:	eb 2e                	jmp    80472f <sys_free+0xa6>
    {
        if(p->alloc==0)
  804701:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804705:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804708:	85 c0                	test   eax,eax
  80470a:	75 2c                	jne    804738 <sys_free+0xaf>
        {
            p->pgn+=hp->pgn+1;//把区域合并
  80470c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804710:	8b 10                	mov    edx,DWORD PTR [rax]
  804712:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804716:	8b 00                	mov    eax,DWORD PTR [rax]
  804718:	83 c0 01             	add    eax,0x1
  80471b:	01 c2                	add    edx,eax
  80471d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804721:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->prev;
  804723:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804727:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80472b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  80472f:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804734:	75 cb                	jne    804701 <sys_free+0x78>
  804736:	eb 01                	jmp    804739 <sys_free+0xb0>
            break;
  804738:	90                   	nop
    }
    //合并完成
    return 0;
  804739:	b8 00 00 00 00       	mov    eax,0x0
}
  80473e:	5d                   	pop    rbp
  80473f:	c3                   	ret    

0000000000804740 <switch_to>:

void switch_to(struct process *from, struct process *to) {
  804740:	f3 0f 1e fa          	endbr64 
  804744:	55                   	push   rbp
  804745:	48 89 e5             	mov    rbp,rsp
  804748:	53                   	push   rbx
  804749:	48 89 7d f0          	mov    QWORD PTR [rbp-0x10],rdi
  80474d:	48 89 75 e8          	mov    QWORD PTR [rbp-0x18],rsi
    cur_proc=to-task;
  804751:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804755:	48 2d a0 84 40 00    	sub    rax,0x4084a0
  80475b:	48 c1 f8 02          	sar    rax,0x2
  80475f:	48 89 c2             	mov    rdx,rax
  804762:	48 b8 f7 c0 46 ef 8a 	movabs rax,0x2697cc8aef46c0f7
  804769:	cc 97 26 
  80476c:	48 0f af c2          	imul   rax,rdx
  804770:	89 05 b6 0e c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10eb6],eax        # 41562c <cur_proc>
    current=&task[cur_proc];
  804776:	8b 05 b0 0e c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10eb0]        # 41562c <cur_proc>
  80477c:	48 98                	cdqe   
  80477e:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804785:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80478b:	48 89 05 0e 0e c1 ff 	mov    QWORD PTR [rip+0xffffffffffc10e0e],rax        # 4155a0 <current>
    asm volatile("mov %0,%%rax\n"
  804792:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804796:	48 8b 80 c0 00 00 00 	mov    rax,QWORD PTR [rax+0xc0]
  80479d:	0f 22 d8             	mov    cr3,rax
                 "mov %%rax,%%cr3\n":"=m"(to->pml4));
    asm volatile("mov %%rsp,%0\r\n"
  8047a0:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  8047a4:	4c 8b 55 f0          	mov    r10,QWORD PTR [rbp-0x10]
  8047a8:	4c 8b 5d f0          	mov    r11,QWORD PTR [rbp-0x10]
  8047ac:	48 8b 5d f0          	mov    rbx,QWORD PTR [rbp-0x10]
  8047b0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8047b4:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8047b8:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  8047bc:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  8047c0:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  8047c4:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  8047c8:	49 89 a1 7c 02 00 00 	mov    QWORD PTR [r9+0x27c],rsp
  8047cf:	48 8d 05 24 00 00 00 	lea    rax,[rip+0x24]        # 8047fa <done>
  8047d6:	49 89 82 4c 02 00 00 	mov    QWORD PTR [r10+0x24c],rax
  8047dd:	41 8c a3 bc 02 00 00 	mov    WORD PTR [r11+0x2bc],fs
  8047e4:	8c ab c4 02 00 00    	mov    WORD PTR [rbx+0x2c4],gs
  8047ea:	48 8b a1 7c 02 00 00 	mov    rsp,QWORD PTR [rcx+0x27c]
  8047f1:	41 ff b0 4c 02 00 00 	push   QWORD PTR [r8+0x24c]
  8047f8:	eb 08                	jmp    804802 <__switch_to>

00000000008047fa <done>:
  8047fa:	90                   	nop
                 "nop":"=m"(from->regs.rsp),"=m"(from->regs.rip),
                 "=m"(from->regs.fs),"=m"(from->regs.gs):
                "m"(to->regs.fs),"m"(to->regs.gs),"m"(to->regs.rsp),"m"(to->regs.rip),
                "D"(from),"S"(to));

}
  8047fb:	90                   	nop
  8047fc:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804800:	c9                   	leave  
  804801:	c3                   	ret    

0000000000804802 <__switch_to>:
void __switch_to(struct process *from, struct process *to) {
  804802:	f3 0f 1e fa          	endbr64 
  804806:	55                   	push   rbp
  804807:	48 89 e5             	mov    rbp,rsp
  80480a:	53                   	push   rbx
  80480b:	48 83 ec 18          	sub    rsp,0x18
  80480f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  804813:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804817:	48 8b 05 42 7b 00 00 	mov    rax,QWORD PTR [rip+0x7b42]        # 80c360 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  80481e:	4c 8b 50 54          	mov    r10,QWORD PTR [rax+0x54]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804822:	48 8b 05 37 7b 00 00 	mov    rax,QWORD PTR [rip+0x7b37]        # 80c360 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804829:	4c 8b 48 4c          	mov    r9,QWORD PTR [rax+0x4c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  80482d:	48 8b 05 2c 7b 00 00 	mov    rax,QWORD PTR [rip+0x7b2c]        # 80c360 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804834:	4c 8b 40 44          	mov    r8,QWORD PTR [rax+0x44]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804838:	48 8b 05 21 7b 00 00 	mov    rax,QWORD PTR [rip+0x7b21]        # 80c360 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  80483f:	48 8b 78 3c          	mov    rdi,QWORD PTR [rax+0x3c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804843:	48 8b 05 16 7b 00 00 	mov    rax,QWORD PTR [rip+0x7b16]        # 80c360 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  80484a:	48 8b 58 34          	mov    rbx,QWORD PTR [rax+0x34]
  80484e:	48 8b 05 0b 7b 00 00 	mov    rax,QWORD PTR [rip+0x7b0b]        # 80c360 <tss>
  804855:	4c 8b 58 2c          	mov    r11,QWORD PTR [rax+0x2c]
  804859:	48 8b 05 00 7b 00 00 	mov    rax,QWORD PTR [rip+0x7b00]        # 80c360 <tss>
  804860:	48 8b 48 24          	mov    rcx,QWORD PTR [rax+0x24]
  804864:	48 8b 05 f5 7a 00 00 	mov    rax,QWORD PTR [rip+0x7af5]        # 80c360 <tss>
  80486b:	48 8b 50 14          	mov    rdx,QWORD PTR [rax+0x14]
  80486f:	48 8b 05 ea 7a 00 00 	mov    rax,QWORD PTR [rip+0x7aea]        # 80c360 <tss>
  804876:	48 8b 70 0c          	mov    rsi,QWORD PTR [rax+0xc]
  80487a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80487e:	48 8b 80 dc 01 00 00 	mov    rax,QWORD PTR [rax+0x1dc]
  804885:	41 52                	push   r10
  804887:	41 51                	push   r9
  804889:	41 50                	push   r8
  80488b:	57                   	push   rdi
  80488c:	49 89 d9             	mov    r9,rbx
  80488f:	4d 89 d8             	mov    r8,r11
  804892:	48 89 c7             	mov    rdi,rax
  804895:	e8 34 00 00 00       	call   8048ce <set_tss>
  80489a:	48 83 c4 20          	add    rsp,0x20
    asm volatile("mov %%fs,%0\r\n"
  80489e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8048a2:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  8048a6:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8048aa:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  8048ae:	8c a0 bc 02 00 00    	mov    WORD PTR [rax+0x2bc],fs
  8048b4:	8c ae c4 02 00 00    	mov    WORD PTR [rsi+0x2c4],gs
  8048ba:	8e a2 bc 02 00 00    	mov    fs,WORD PTR [rdx+0x2bc]
  8048c0:	8e a9 c4 02 00 00    	mov    gs,WORD PTR [rcx+0x2c4]
  8048c6:	fb                   	sti    
                 "mov %%gs,%1\r\n"
                 "mov %2,%%fs\r\n"
                 "mov %3,%%gs\r\n"
                 "sti":"=m"(to->regs.fs),"=m"(to->regs.gs):
                 "m"(from->regs.fs),"m"(from->regs.gs));
}
  8048c7:	90                   	nop
  8048c8:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8048cc:	c9                   	leave  
  8048cd:	c3                   	ret    

00000000008048ce <set_tss>:

void set_tss(u64 rsp0,u64 rsp1,u64 rsp2,u64 ist0,u64 ist1,u64 ist2,u64 ist3,u64 ist4,u64 ist5,u64 ist6){
  8048ce:	f3 0f 1e fa          	endbr64 
  8048d2:	55                   	push   rbp
  8048d3:	48 89 e5             	mov    rbp,rsp
  8048d6:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8048da:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8048de:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  8048e2:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  8048e6:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
  8048ea:	4c 89 4d d0          	mov    QWORD PTR [rbp-0x30],r9
    tss->rsp0=rsp0;
  8048ee:	48 8b 05 6b 7a 00 00 	mov    rax,QWORD PTR [rip+0x7a6b]        # 80c360 <tss>
  8048f5:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8048f9:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx
    tss->rsp1=rsp1;
  8048fd:	48 8b 05 5c 7a 00 00 	mov    rax,QWORD PTR [rip+0x7a5c]        # 80c360 <tss>
  804904:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  804908:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    tss->rsp2=rsp2;
  80490c:	48 8b 05 4d 7a 00 00 	mov    rax,QWORD PTR [rip+0x7a4d]        # 80c360 <tss>
  804913:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804917:	48 89 50 14          	mov    QWORD PTR [rax+0x14],rdx
    tss->ists[0]=ist0;
  80491b:	48 8b 05 3e 7a 00 00 	mov    rax,QWORD PTR [rip+0x7a3e]        # 80c360 <tss>
  804922:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  804926:	48 89 50 24          	mov    QWORD PTR [rax+0x24],rdx
    tss->ists[1]=ist1;
  80492a:	48 8b 05 2f 7a 00 00 	mov    rax,QWORD PTR [rip+0x7a2f]        # 80c360 <tss>
  804931:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  804935:	48 89 50 2c          	mov    QWORD PTR [rax+0x2c],rdx
    tss->ists[2]=ist2;
  804939:	48 8b 05 20 7a 00 00 	mov    rax,QWORD PTR [rip+0x7a20]        # 80c360 <tss>
  804940:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804944:	48 89 50 34          	mov    QWORD PTR [rax+0x34],rdx
    tss->ists[3]=ist3;
  804948:	48 8b 05 11 7a 00 00 	mov    rax,QWORD PTR [rip+0x7a11]        # 80c360 <tss>
  80494f:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  804953:	48 89 50 3c          	mov    QWORD PTR [rax+0x3c],rdx
    tss->ists[4]=ist4;
  804957:	48 8b 05 02 7a 00 00 	mov    rax,QWORD PTR [rip+0x7a02]        # 80c360 <tss>
  80495e:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  804962:	48 89 50 44          	mov    QWORD PTR [rax+0x44],rdx
    tss->ists[5]=ist5;
  804966:	48 8b 05 f3 79 00 00 	mov    rax,QWORD PTR [rip+0x79f3]        # 80c360 <tss>
  80496d:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  804971:	48 89 50 4c          	mov    QWORD PTR [rax+0x4c],rdx
    tss->ists[6]=ist6;
  804975:	48 8b 05 e4 79 00 00 	mov    rax,QWORD PTR [rip+0x79e4]        # 80c360 <tss>
  80497c:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  804980:	48 89 50 54          	mov    QWORD PTR [rax+0x54],rdx
}
  804984:	90                   	nop
  804985:	5d                   	pop    rbp
  804986:	c3                   	ret    

0000000000804987 <fork_child_ret>:

int fork_child_ret(){
  804987:	f3 0f 1e fa          	endbr64 
  80498b:	55                   	push   rbp
  80498c:	48 89 e5             	mov    rbp,rsp
    return 0;
  80498f:	b8 00 00 00 00       	mov    eax,0x0

}
  804994:	5d                   	pop    rbp
  804995:	c3                   	ret    

0000000000804996 <sys_fork>:

int sys_fork(void){
  804996:	f3 0f 1e fa          	endbr64 
  80499a:	55                   	push   rbp
  80499b:	48 89 e5             	mov    rbp,rsp
  80499e:	53                   	push   rbx
  80499f:	48 83 ec 58          	sub    rsp,0x58
    int pid=req_proc();
  8049a3:	b8 00 00 00 00       	mov    eax,0x0
  8049a8:	e8 f6 ee ff ff       	call   8038a3 <req_proc>
  8049ad:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(pid==-1)return -1;
  8049b0:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  8049b4:	75 0a                	jne    8049c0 <sys_fork+0x2a>
  8049b6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8049bb:	e9 7a 07 00 00       	jmp    80513a <sys_fork+0x7a4>
    task[pid].regs=current->regs;
  8049c0:	48 8b 05 d9 0b c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc10bd9]        # 4155a0 <current>
  8049c7:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  8049ca:	48 63 d2             	movsxd rdx,edx
  8049cd:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  8049d4:	48 81 c2 e0 86 40 00 	add    rdx,0x4086e0
  8049db:	48 8b 88 44 02 00 00 	mov    rcx,QWORD PTR [rax+0x244]
  8049e2:	48 8b 98 4c 02 00 00 	mov    rbx,QWORD PTR [rax+0x24c]
  8049e9:	48 89 4a 04          	mov    QWORD PTR [rdx+0x4],rcx
  8049ed:	48 89 5a 0c          	mov    QWORD PTR [rdx+0xc],rbx
  8049f1:	48 8b 88 54 02 00 00 	mov    rcx,QWORD PTR [rax+0x254]
  8049f8:	48 8b 98 5c 02 00 00 	mov    rbx,QWORD PTR [rax+0x25c]
  8049ff:	48 89 4a 14          	mov    QWORD PTR [rdx+0x14],rcx
  804a03:	48 89 5a 1c          	mov    QWORD PTR [rdx+0x1c],rbx
  804a07:	48 8b 88 64 02 00 00 	mov    rcx,QWORD PTR [rax+0x264]
  804a0e:	48 8b 98 6c 02 00 00 	mov    rbx,QWORD PTR [rax+0x26c]
  804a15:	48 89 4a 24          	mov    QWORD PTR [rdx+0x24],rcx
  804a19:	48 89 5a 2c          	mov    QWORD PTR [rdx+0x2c],rbx
  804a1d:	48 8b 88 74 02 00 00 	mov    rcx,QWORD PTR [rax+0x274]
  804a24:	48 8b 98 7c 02 00 00 	mov    rbx,QWORD PTR [rax+0x27c]
  804a2b:	48 89 4a 34          	mov    QWORD PTR [rdx+0x34],rcx
  804a2f:	48 89 5a 3c          	mov    QWORD PTR [rdx+0x3c],rbx
  804a33:	48 8b 88 84 02 00 00 	mov    rcx,QWORD PTR [rax+0x284]
  804a3a:	48 8b 98 8c 02 00 00 	mov    rbx,QWORD PTR [rax+0x28c]
  804a41:	48 89 4a 44          	mov    QWORD PTR [rdx+0x44],rcx
  804a45:	48 89 5a 4c          	mov    QWORD PTR [rdx+0x4c],rbx
  804a49:	48 8b 88 94 02 00 00 	mov    rcx,QWORD PTR [rax+0x294]
  804a50:	48 8b 98 9c 02 00 00 	mov    rbx,QWORD PTR [rax+0x29c]
  804a57:	48 89 4a 54          	mov    QWORD PTR [rdx+0x54],rcx
  804a5b:	48 89 5a 5c          	mov    QWORD PTR [rdx+0x5c],rbx
  804a5f:	48 8b 88 a4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2a4]
  804a66:	48 8b 98 ac 02 00 00 	mov    rbx,QWORD PTR [rax+0x2ac]
  804a6d:	48 89 4a 64          	mov    QWORD PTR [rdx+0x64],rcx
  804a71:	48 89 5a 6c          	mov    QWORD PTR [rdx+0x6c],rbx
  804a75:	48 8b 88 b4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2b4]
  804a7c:	48 8b 98 bc 02 00 00 	mov    rbx,QWORD PTR [rax+0x2bc]
  804a83:	48 89 4a 74          	mov    QWORD PTR [rdx+0x74],rcx
  804a87:	48 89 5a 7c          	mov    QWORD PTR [rdx+0x7c],rbx
  804a8b:	48 8b 88 c4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2c4]
  804a92:	48 8b 98 cc 02 00 00 	mov    rbx,QWORD PTR [rax+0x2cc]
  804a99:	48 89 8a 84 00 00 00 	mov    QWORD PTR [rdx+0x84],rcx
  804aa0:	48 89 9a 8c 00 00 00 	mov    QWORD PTR [rdx+0x8c],rbx
  804aa7:	48 8b 88 d4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2d4]
  804aae:	48 8b 98 dc 02 00 00 	mov    rbx,QWORD PTR [rax+0x2dc]
  804ab5:	48 89 8a 94 00 00 00 	mov    QWORD PTR [rdx+0x94],rcx
  804abc:	48 89 9a 9c 00 00 00 	mov    QWORD PTR [rdx+0x9c],rbx
  804ac3:	48 8b 88 e4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2e4]
  804aca:	48 8b 98 ec 02 00 00 	mov    rbx,QWORD PTR [rax+0x2ec]
  804ad1:	48 89 8a a4 00 00 00 	mov    QWORD PTR [rdx+0xa4],rcx
  804ad8:	48 89 9a ac 00 00 00 	mov    QWORD PTR [rdx+0xac],rbx
  804adf:	48 8b 88 f4 02 00 00 	mov    rcx,QWORD PTR [rax+0x2f4]
  804ae6:	48 8b 98 fc 02 00 00 	mov    rbx,QWORD PTR [rax+0x2fc]
  804aed:	48 89 8a b4 00 00 00 	mov    QWORD PTR [rdx+0xb4],rcx
  804af4:	48 89 9a bc 00 00 00 	mov    QWORD PTR [rdx+0xbc],rbx
  804afb:	48 8b 88 04 03 00 00 	mov    rcx,QWORD PTR [rax+0x304]
  804b02:	48 8b 98 0c 03 00 00 	mov    rbx,QWORD PTR [rax+0x30c]
  804b09:	48 89 8a c4 00 00 00 	mov    QWORD PTR [rdx+0xc4],rcx
  804b10:	48 89 9a cc 00 00 00 	mov    QWORD PTR [rdx+0xcc],rbx
    //使得子程序处于刚调用完系统调用的状态
    task[pid].regs.rip=ret_normal_proc;
  804b17:	ba e1 c2 80 00       	mov    edx,0x80c2e1
  804b1c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804b1f:	48 98                	cdqe   
  804b21:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804b28:	48 05 e0 86 40 00    	add    rax,0x4086e0
  804b2e:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    task[pid].regs.rsp-=sizeof(stack_store_regs);
  804b32:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804b35:	48 98                	cdqe   
  804b37:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804b3e:	48 05 10 87 40 00    	add    rax,0x408710
  804b44:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804b48:	48 2d a8 00 00 00    	sub    rax,0xa8
  804b4e:	48 89 c2             	mov    rdx,rax
  804b51:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804b54:	48 98                	cdqe   
  804b56:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804b5d:	48 05 10 87 40 00    	add    rax,0x408710
  804b63:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    task[pid].sid=current->sid;
  804b67:	48 8b 05 32 0a c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc10a32]        # 4155a0 <current>
  804b6e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  804b71:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  804b74:	48 63 d2             	movsxd rdx,edx
  804b77:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  804b7e:	48 81 c2 a8 84 40 00 	add    rdx,0x4084a8
  804b85:	89 02                	mov    DWORD PTR [rdx],eax
    task[pid].gpid=current->gpid;
  804b87:	48 8b 05 12 0a c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc10a12]        # 4155a0 <current>
  804b8e:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804b91:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  804b94:	48 63 d2             	movsxd rdx,edx
  804b97:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  804b9e:	48 81 c2 a4 84 40 00 	add    rdx,0x4084a4
  804ba5:	89 02                	mov    DWORD PTR [rdx],eax
    stack_store_regs *r=task[pid].regs.rsp;
  804ba7:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804baa:	48 98                	cdqe   
  804bac:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804bb3:	48 05 10 87 40 00    	add    rax,0x408710
  804bb9:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804bbd:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    r->rax=0;
  804bc1:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804bc5:	48 c7 40 78 00 00 00 	mov    QWORD PTR [rax+0x78],0x0
  804bcc:	00 
    r->ds=DS_USER;
  804bcd:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804bd1:	48 c7 00 28 00 00 00 	mov    QWORD PTR [rax],0x28
    r->ss=DS_USER;
  804bd8:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804bdc:	48 c7 80 a0 00 00 00 	mov    QWORD PTR [rax+0xa0],0x28
  804be3:	28 00 00 00 
    r->es=DS_USER;
  804be7:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804beb:	48 c7 40 08 28 00 00 	mov    QWORD PTR [rax+0x8],0x28
  804bf2:	00 
    r->rax=task[pid].regs.rax;
  804bf3:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804bf6:	48 98                	cdqe   
  804bf8:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804bff:	48 05 f0 86 40 00    	add    rax,0x4086f0
  804c05:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804c09:	48 89 c2             	mov    rdx,rax
  804c0c:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804c10:	48 89 50 78          	mov    QWORD PTR [rax+0x78],rdx
    r->rbx=task[pid].regs.rbx;
  804c14:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804c17:	48 98                	cdqe   
  804c19:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804c20:	48 05 10 87 40 00    	add    rax,0x408710
  804c26:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  804c2a:	48 89 c2             	mov    rdx,rax
  804c2d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804c31:	48 89 50 70          	mov    QWORD PTR [rax+0x70],rdx
    r->rcx=task[pid].regs.rcx;
  804c35:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804c38:	48 98                	cdqe   
  804c3a:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804c41:	48 05 00 87 40 00    	add    rax,0x408700
  804c47:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  804c4b:	48 89 c2             	mov    rdx,rax
  804c4e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804c52:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    r->rdx=task[pid].regs.rdx;
  804c56:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804c59:	48 98                	cdqe   
  804c5b:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804c62:	48 05 00 87 40 00    	add    rax,0x408700
  804c68:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804c6c:	48 89 c2             	mov    rdx,rax
  804c6f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804c73:	48 89 50 60          	mov    QWORD PTR [rax+0x60],rdx
    r->rsi=task[pid].regs.rsi;
  804c77:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804c7a:	48 98                	cdqe   
  804c7c:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804c83:	48 05 20 87 40 00    	add    rax,0x408720
  804c89:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804c8d:	48 89 c2             	mov    rdx,rax
  804c90:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804c94:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
    r->rdi=task[pid].regs.rdi;
  804c98:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804c9b:	48 98                	cdqe   
  804c9d:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804ca4:	48 05 30 87 40 00    	add    rax,0x408730
  804caa:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  804cae:	48 89 c2             	mov    rdx,rax
  804cb1:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804cb5:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx

    r->r8 =task[pid].regs.r8 ;
  804cb9:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804cbc:	48 98                	cdqe   
  804cbe:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804cc5:	48 05 60 87 40 00    	add    rax,0x408760
  804ccb:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804ccf:	48 89 c2             	mov    rdx,rax
  804cd2:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804cd6:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    r->r9 =task[pid].regs.r9 ;
  804cda:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804cdd:	48 98                	cdqe   
  804cdf:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804ce6:	48 05 70 87 40 00    	add    rax,0x408770
  804cec:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  804cf0:	48 89 c2             	mov    rdx,rax
  804cf3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804cf7:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    r->r10=task[pid].regs.r10;
  804cfb:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804cfe:	48 98                	cdqe   
  804d00:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804d07:	48 05 70 87 40 00    	add    rax,0x408770
  804d0d:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804d11:	48 89 c2             	mov    rdx,rax
  804d14:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d18:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
    r->r11=task[pid].regs.r11;
  804d1c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804d1f:	48 98                	cdqe   
  804d21:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804d28:	48 05 80 87 40 00    	add    rax,0x408780
  804d2e:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  804d32:	48 89 c2             	mov    rdx,rax
  804d35:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d39:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
    r->r12=task[pid].regs.r12;
  804d3d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804d40:	48 98                	cdqe   
  804d42:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804d49:	48 05 80 87 40 00    	add    rax,0x408780
  804d4f:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804d53:	48 89 c2             	mov    rdx,rax
  804d56:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d5a:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
    r->r13=task[pid].regs.r13;
  804d5e:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804d61:	48 98                	cdqe   
  804d63:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804d6a:	48 05 90 87 40 00    	add    rax,0x408790
  804d70:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  804d74:	48 89 c2             	mov    rdx,rax
  804d77:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d7b:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
    r->r14=task[pid].regs.r14;
  804d7f:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804d82:	48 98                	cdqe   
  804d84:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804d8b:	48 05 90 87 40 00    	add    rax,0x408790
  804d91:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804d95:	48 89 c2             	mov    rdx,rax
  804d98:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804d9c:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    r->r15=task[pid].regs.r15;
  804da0:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804da3:	48 98                	cdqe   
  804da5:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804dac:	48 05 a0 87 40 00    	add    rax,0x4087a0
  804db2:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  804db6:	48 89 c2             	mov    rdx,rax
  804db9:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804dbd:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx

    asm volatile("mov %%r10,%0"::"m"(r->rip));
  804dc1:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  804dc5:	4c 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],r10

    task[pid].tss=current->tss;
  804dcc:	48 8b 05 cd 07 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc107cd]        # 4155a0 <current>
  804dd3:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  804dd6:	48 63 d2             	movsxd rdx,edx
  804dd9:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  804de0:	48 81 c2 70 86 40 00 	add    rdx,0x408670
  804de7:	48 8b 88 d8 01 00 00 	mov    rcx,QWORD PTR [rax+0x1d8]
  804dee:	48 8b 98 e0 01 00 00 	mov    rbx,QWORD PTR [rax+0x1e0]
  804df5:	48 89 4a 08          	mov    QWORD PTR [rdx+0x8],rcx
  804df9:	48 89 5a 10          	mov    QWORD PTR [rdx+0x10],rbx
  804dfd:	48 8b 88 e8 01 00 00 	mov    rcx,QWORD PTR [rax+0x1e8]
  804e04:	48 8b 98 f0 01 00 00 	mov    rbx,QWORD PTR [rax+0x1f0]
  804e0b:	48 89 4a 18          	mov    QWORD PTR [rdx+0x18],rcx
  804e0f:	48 89 5a 20          	mov    QWORD PTR [rdx+0x20],rbx
  804e13:	48 8b 88 f8 01 00 00 	mov    rcx,QWORD PTR [rax+0x1f8]
  804e1a:	48 8b 98 00 02 00 00 	mov    rbx,QWORD PTR [rax+0x200]
  804e21:	48 89 4a 28          	mov    QWORD PTR [rdx+0x28],rcx
  804e25:	48 89 5a 30          	mov    QWORD PTR [rdx+0x30],rbx
  804e29:	48 8b 88 08 02 00 00 	mov    rcx,QWORD PTR [rax+0x208]
  804e30:	48 8b 98 10 02 00 00 	mov    rbx,QWORD PTR [rax+0x210]
  804e37:	48 89 4a 38          	mov    QWORD PTR [rdx+0x38],rcx
  804e3b:	48 89 5a 40          	mov    QWORD PTR [rdx+0x40],rbx
  804e3f:	48 8b 88 18 02 00 00 	mov    rcx,QWORD PTR [rax+0x218]
  804e46:	48 8b 98 20 02 00 00 	mov    rbx,QWORD PTR [rax+0x220]
  804e4d:	48 89 4a 48          	mov    QWORD PTR [rdx+0x48],rcx
  804e51:	48 89 5a 50          	mov    QWORD PTR [rdx+0x50],rbx
  804e55:	48 8b 88 28 02 00 00 	mov    rcx,QWORD PTR [rax+0x228]
  804e5c:	48 8b 98 30 02 00 00 	mov    rbx,QWORD PTR [rax+0x230]
  804e63:	48 89 4a 58          	mov    QWORD PTR [rdx+0x58],rcx
  804e67:	48 89 5a 60          	mov    QWORD PTR [rdx+0x60],rbx
  804e6b:	48 8b 88 38 02 00 00 	mov    rcx,QWORD PTR [rax+0x238]
  804e72:	48 89 4a 68          	mov    QWORD PTR [rdx+0x68],rcx
  804e76:	8b 80 40 02 00 00    	mov    eax,DWORD PTR [rax+0x240]
  804e7c:	89 42 70             	mov    DWORD PTR [rdx+0x70],eax
    task[pid].stat=READY;
  804e7f:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804e82:	48 98                	cdqe   
  804e84:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804e8b:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804e91:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[pid].parent_pid=cur_proc;
  804e97:	8b 05 8f 07 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1078f]        # 41562c <cur_proc>
  804e9d:	89 c2                	mov    edx,eax
  804e9f:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804ea2:	48 98                	cdqe   
  804ea4:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804eab:	48 05 3c 85 40 00    	add    rax,0x40853c
  804eb1:	89 10                	mov    DWORD PTR [rax],edx
    //复制打开文件
    memcpy(task[pid].openf,current->openf,sizeof(struct file*)*MAX_PROC_OPENF);
  804eb3:	48 8b 05 e6 06 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc106e6]        # 4155a0 <current>
  804eba:	48 8d 88 d8 00 00 00 	lea    rcx,[rax+0xd8]
  804ec1:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804ec4:	48 98                	cdqe   
  804ec6:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804ecd:	48 05 d0 00 00 00    	add    rax,0xd0
  804ed3:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804ed9:	48 83 c0 08          	add    rax,0x8
  804edd:	ba 00 01 00 00       	mov    edx,0x100
  804ee2:	48 89 ce             	mov    rsi,rcx
  804ee5:	48 89 c7             	mov    rdi,rax
  804ee8:	e8 58 6a 00 00       	call   80b945 <memcpy>
    task[pid].utime=0;
  804eed:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804ef0:	48 98                	cdqe   
  804ef2:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804ef9:	48 05 bc 84 40 00    	add    rax,0x4084bc
  804eff:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[pid].mem_struct=current->mem_struct;
  804f05:	48 8b 0d 94 06 c1 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc10694]        # 4155a0 <current>
  804f0c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804f0f:	48 98                	cdqe   
  804f11:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804f18:	48 8d b0 c0 84 40 00 	lea    rsi,[rax+0x4084c0]
  804f1f:	48 8b 41 28          	mov    rax,QWORD PTR [rcx+0x28]
  804f23:	48 8b 51 30          	mov    rdx,QWORD PTR [rcx+0x30]
  804f27:	48 89 46 08          	mov    QWORD PTR [rsi+0x8],rax
  804f2b:	48 89 56 10          	mov    QWORD PTR [rsi+0x10],rdx
  804f2f:	48 8b 41 38          	mov    rax,QWORD PTR [rcx+0x38]
  804f33:	48 8b 51 40          	mov    rdx,QWORD PTR [rcx+0x40]
  804f37:	48 89 46 18          	mov    QWORD PTR [rsi+0x18],rax
  804f3b:	48 89 56 20          	mov    QWORD PTR [rsi+0x20],rdx
    //TODO:根据是子进程还是父进程设置返回值的不同

    //TODO:设置新堆栈
    //复制父进程的内存映射到子进程，然后重新映射并复制子进程的堆栈和数据段
    copy_mmap(current,&task[pid]);
  804f3f:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804f42:	48 98                	cdqe   
  804f44:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804f4b:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  804f52:	48 8b 05 47 06 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc10647]        # 4155a0 <current>
  804f59:	48 89 d6             	mov    rsi,rdx
  804f5c:	48 89 c7             	mov    rdi,rax
  804f5f:	e8 de 04 00 00       	call   805442 <copy_mmap>
    /*
     * 这里使用vmalloc是一个权宜之策。
     * 本来是分配用户空间内存的，但是这样的话当前进程内存空间下就访问不到这个新申请的内存了（除非mmap一下），
     * 方便以前先用vmalloc。
     * */
    addr_t stk=task[pid].mem_struct.stack_top-PAGE_4K_SIZE;
  804f64:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804f67:	48 98                	cdqe   
  804f69:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804f70:	48 05 d4 84 40 00    	add    rax,0x4084d4
  804f76:	8b 00                	mov    eax,DWORD PTR [rax]
  804f78:	2d 00 10 00 00       	sub    eax,0x1000
  804f7d:	48 98                	cdqe   
  804f7f:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    for(;stk>=task[pid].mem_struct.stack_bottom;stk-=PAGE_4K_SIZE){
  804f83:	eb 5b                	jmp    804fe0 <sys_fork+0x64a>
        addr_t new_stkpg=vmalloc();
  804f85:	b8 00 00 00 00       	mov    eax,0x0
  804f8a:	e8 2a c3 ff ff       	call   8012b9 <vmalloc>
  804f8f:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
        memcpy(new_stkpg,stk,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  804f93:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  804f97:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  804f9b:	ba 00 10 00 00       	mov    edx,0x1000
  804fa0:	48 89 ce             	mov    rsi,rcx
  804fa3:	48 89 c7             	mov    rdi,rax
  804fa6:	e8 9a 69 00 00       	call   80b945 <memcpy>
        //把新的页面映射到进程页表里
        smmap(new_stkpg,stk,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  804fab:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804fae:	48 98                	cdqe   
  804fb0:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804fb7:	48 05 60 85 40 00    	add    rax,0x408560
  804fbd:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  804fc0:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  804fc4:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  804fc8:	48 89 d1             	mov    rcx,rdx
  804fcb:	ba 07 00 00 00       	mov    edx,0x7
  804fd0:	48 89 c7             	mov    rdi,rax
  804fd3:	e8 91 c0 ff ff       	call   801069 <smmap>
    for(;stk>=task[pid].mem_struct.stack_bottom;stk-=PAGE_4K_SIZE){
  804fd8:	48 81 6d e8 00 10 00 	sub    QWORD PTR [rbp-0x18],0x1000
  804fdf:	00 
  804fe0:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804fe3:	48 98                	cdqe   
  804fe5:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  804fec:	48 05 d0 84 40 00    	add    rax,0x4084d0
  804ff2:	8b 00                	mov    eax,DWORD PTR [rax]
  804ff4:	48 98                	cdqe   
  804ff6:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  804ffa:	73 89                	jae    804f85 <sys_fork+0x5ef>
    }
    //中断使用的栈空间
    addr_t intstk=INT_STACK_TOP-PAGE_4K_SIZE;
  804ffc:	48 c7 45 e0 00 f0 7f 	mov    QWORD PTR [rbp-0x20],0x7ff000
  805003:	00 
    int f=1;
  805004:	c7 45 dc 01 00 00 00 	mov    DWORD PTR [rbp-0x24],0x1
    for(;intstk>=INT_STACK_BASE;intstk-=PAGE_4K_SIZE){
  80500b:	e9 81 00 00 00       	jmp    805091 <sys_fork+0x6fb>
        addr_t new_stkpg=vmalloc();
  805010:	b8 00 00 00 00       	mov    eax,0x0
  805015:	e8 9f c2 ff ff       	call   8012b9 <vmalloc>
  80501a:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        memcpy(new_stkpg,intstk,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  80501e:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  805022:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805026:	ba 00 10 00 00       	mov    edx,0x1000
  80502b:	48 89 ce             	mov    rsi,rcx
  80502e:	48 89 c7             	mov    rdi,rax
  805031:	e8 0f 69 00 00       	call   80b945 <memcpy>
        if(f){
  805036:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  80503a:	74 20                	je     80505c <sys_fork+0x6c6>
            f=0;
  80503c:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
            addr_t *raxp=new_stkpg+PAGE_4K_SIZE-56;//指向中断堆栈，里面存着rax的值
  805043:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805047:	48 05 c8 0f 00 00    	add    rax,0xfc8
  80504d:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
            *raxp=0;//这样进程切换到子进程的done标签，从时钟中断返回弹出堆栈的时候rax弹出来的就是0，成为返回值。
  805051:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  805055:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
        }
        //把新的页面映射到进程页表里
        smmap(new_stkpg,intstk,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  80505c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80505f:	48 98                	cdqe   
  805061:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805068:	48 05 60 85 40 00    	add    rax,0x408560
  80506e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  805071:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  805075:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805079:	48 89 d1             	mov    rcx,rdx
  80507c:	ba 07 00 00 00       	mov    edx,0x7
  805081:	48 89 c7             	mov    rdi,rax
  805084:	e8 e0 bf ff ff       	call   801069 <smmap>
    for(;intstk>=INT_STACK_BASE;intstk-=PAGE_4K_SIZE){
  805089:	48 81 6d e0 00 10 00 	sub    QWORD PTR [rbp-0x20],0x1000
  805090:	00 
  805091:	48 81 7d e0 ff ef 7f 	cmp    QWORD PTR [rbp-0x20],0x7fefff
  805098:	00 
  805099:	0f 87 71 ff ff ff    	ja     805010 <sys_fork+0x67a>
    }
    //堆
    addr_t hp=task[pid].mem_struct.heap_top-PAGE_4K_SIZE;
  80509f:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8050a2:	48 98                	cdqe   
  8050a4:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8050ab:	48 05 cc 84 40 00    	add    rax,0x4084cc
  8050b1:	8b 00                	mov    eax,DWORD PTR [rax]
  8050b3:	2d 00 10 00 00       	sub    eax,0x1000
  8050b8:	48 98                	cdqe   
  8050ba:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    for(;hp>=task[pid].mem_struct.heap_base;hp-=PAGE_4K_SIZE){
  8050be:	eb 5b                	jmp    80511b <sys_fork+0x785>
        addr_t new_hppg=vmalloc();
  8050c0:	b8 00 00 00 00       	mov    eax,0x0
  8050c5:	e8 ef c1 ff ff       	call   8012b9 <vmalloc>
  8050ca:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        memcpy(new_hppg,hp,PAGE_4K_SIZE);//把当前进程的栈空间复制到新栈里面
  8050ce:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  8050d2:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8050d6:	ba 00 10 00 00       	mov    edx,0x1000
  8050db:	48 89 ce             	mov    rsi,rcx
  8050de:	48 89 c7             	mov    rdi,rax
  8050e1:	e8 5f 68 00 00       	call   80b945 <memcpy>
        //把新的页面映射到进程页表里
        smmap(new_hppg,hp,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL,task[pid].pml4);
  8050e6:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8050e9:	48 98                	cdqe   
  8050eb:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8050f2:	48 05 60 85 40 00    	add    rax,0x408560
  8050f8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8050fb:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  8050ff:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805103:	48 89 d1             	mov    rcx,rdx
  805106:	ba 07 00 00 00       	mov    edx,0x7
  80510b:	48 89 c7             	mov    rdi,rax
  80510e:	e8 56 bf ff ff       	call   801069 <smmap>
    for(;hp>=task[pid].mem_struct.heap_base;hp-=PAGE_4K_SIZE){
  805113:	48 81 6d d0 00 10 00 	sub    QWORD PTR [rbp-0x30],0x1000
  80511a:	00 
  80511b:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80511e:	48 98                	cdqe   
  805120:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805127:	48 05 c8 84 40 00    	add    rax,0x4084c8
  80512d:	8b 00                	mov    eax,DWORD PTR [rax]
  80512f:	48 98                	cdqe   
  805131:	48 39 45 d0          	cmp    QWORD PTR [rbp-0x30],rax
  805135:	73 89                	jae    8050c0 <sys_fork+0x72a>
    }
    //父进程运行到这里
    return pid;
  805137:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
}
  80513a:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80513e:	c9                   	leave  
  80513f:	c3                   	ret    

0000000000805140 <release_mmap>:
//释放进程页表映射的内存，内核空间除外。
void release_mmap(struct process* p){
  805140:	f3 0f 1e fa          	endbr64 
  805144:	55                   	push   rbp
  805145:	48 89 e5             	mov    rbp,rsp
  805148:	48 83 ec 50          	sub    rsp,0x50
  80514c:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    page_item * pml4p=p->pml4;
  805150:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805154:	48 8b 80 c0 00 00 00 	mov    rax,QWORD PTR [rax+0xc0]
  80515b:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //复制pdpt
    page_item *pml4e= pml4p;
  80515f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805163:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    for(int i=0;i<512;i++)
  805167:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80516e:	e9 be 02 00 00       	jmp    805431 <release_mmap+0x2f1>
    {
        if(pml4e[i]&PAGE_PRESENT){
  805173:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805176:	48 98                	cdqe   
  805178:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80517f:	00 
  805180:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805184:	48 01 d0             	add    rax,rdx
  805187:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80518a:	83 e0 01             	and    eax,0x1
  80518d:	48 85 c0             	test   rax,rax
  805190:	0f 84 97 02 00 00    	je     80542d <release_mmap+0x2ed>
            page_item *pdpte=pml4e[i]&PAGE_4K_MASK;
  805196:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805199:	48 98                	cdqe   
  80519b:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8051a2:	00 
  8051a3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8051a7:	48 01 d0             	add    rax,rdx
  8051aa:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8051ad:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  8051b4:	ff 00 00 
  8051b7:	48 21 d0             	and    rax,rdx
  8051ba:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            int j=i==0?1:0;//低1GB的空间不释放（内核空间）
  8051be:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8051c2:	0f 94 c0             	sete   al
  8051c5:	0f b6 c0             	movzx  eax,al
  8051c8:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
            for(;j<512;j++)
  8051cb:	e9 24 02 00 00       	jmp    8053f4 <release_mmap+0x2b4>
            {
                if(pdpte[j]&PAGE_PRESENT&&!(pdpte[j]&PDPTE_1GB)){
  8051d0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8051d3:	48 98                	cdqe   
  8051d5:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8051dc:	00 
  8051dd:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8051e1:	48 01 d0             	add    rax,rdx
  8051e4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8051e7:	83 e0 01             	and    eax,0x1
  8051ea:	48 85 c0             	test   rax,rax
  8051ed:	0f 84 fd 01 00 00    	je     8053f0 <release_mmap+0x2b0>
  8051f3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8051f6:	48 98                	cdqe   
  8051f8:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8051ff:	00 
  805200:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805204:	48 01 d0             	add    rax,rdx
  805207:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80520a:	25 80 00 00 00       	and    eax,0x80
  80520f:	48 85 c0             	test   rax,rax
  805212:	0f 85 d8 01 00 00    	jne    8053f0 <release_mmap+0x2b0>
                    page_item *pde=pdpte[j]&PAGE_4K_MASK;
  805218:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80521b:	48 98                	cdqe   
  80521d:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805224:	00 
  805225:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805229:	48 01 d0             	add    rax,rdx
  80522c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80522f:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805236:	ff 00 00 
  805239:	48 21 d0             	and    rax,rdx
  80523c:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
                    for(int k=0;k<512;k++)
  805240:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  805247:	e9 6b 01 00 00       	jmp    8053b7 <release_mmap+0x277>
                    {
                        if(pde[k]&PAGE_PRESENT&&!(pde[k]&PDE_4MB)){
  80524c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80524f:	48 98                	cdqe   
  805251:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805258:	00 
  805259:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80525d:	48 01 d0             	add    rax,rdx
  805260:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805263:	83 e0 01             	and    eax,0x1
  805266:	48 85 c0             	test   rax,rax
  805269:	0f 84 dc 00 00 00    	je     80534b <release_mmap+0x20b>
  80526f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805272:	48 98                	cdqe   
  805274:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80527b:	00 
  80527c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805280:	48 01 d0             	add    rax,rdx
  805283:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805286:	25 80 00 00 00       	and    eax,0x80
  80528b:	48 85 c0             	test   rax,rax
  80528e:	0f 85 b7 00 00 00    	jne    80534b <release_mmap+0x20b>
                            page_item *pte=pde[k]&PAGE_4K_MASK;
  805294:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805297:	48 98                	cdqe   
  805299:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8052a0:	00 
  8052a1:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8052a5:	48 01 d0             	add    rax,rdx
  8052a8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8052ab:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  8052b2:	ff 00 00 
  8052b5:	48 21 d0             	and    rax,rdx
  8052b8:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
                            for(int l=0;l<512;l++){
  8052bc:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  8052c3:	eb 4f                	jmp    805314 <release_mmap+0x1d4>
                                if(pte[l]&PAGE_PRESENT){
  8052c5:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8052c8:	48 98                	cdqe   
  8052ca:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8052d1:	00 
  8052d2:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8052d6:	48 01 d0             	add    rax,rdx
  8052d9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8052dc:	83 e0 01             	and    eax,0x1
  8052df:	48 85 c0             	test   rax,rax
  8052e2:	74 2c                	je     805310 <release_mmap+0x1d0>
                                    //释放申请的物理内存
                                    free_page(pte[l]&PAGE_4K_MASK);
  8052e4:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8052e7:	48 98                	cdqe   
  8052e9:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8052f0:	00 
  8052f1:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8052f5:	48 01 d0             	add    rax,rdx
  8052f8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8052fb:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805302:	ff 00 00 
  805305:	48 21 d0             	and    rax,rdx
  805308:	48 89 c7             	mov    rdi,rax
  80530b:	e8 33 c4 ff ff       	call   801743 <free_page>
                            for(int l=0;l<512;l++){
  805310:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  805314:	81 7d f0 ff 01 00 00 	cmp    DWORD PTR [rbp-0x10],0x1ff
  80531b:	7e a8                	jle    8052c5 <release_mmap+0x185>
                                }
                            }
                            //里面的项释放完了，这一项指向的vmalloc内存可以释放了
                            vmfree(pde[k]&PAGE_4K_MASK);
  80531d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805320:	48 98                	cdqe   
  805322:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805329:	00 
  80532a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80532e:	48 01 d0             	add    rax,rdx
  805331:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805334:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  80533b:	ff 00 00 
  80533e:	48 21 d0             	and    rax,rdx
  805341:	48 89 c7             	mov    rdi,rax
  805344:	e8 ff bf ff ff       	call   801348 <vmfree>
                        if(pde[k]&PAGE_PRESENT&&!(pde[k]&PDE_4MB)){
  805349:	eb 68                	jmp    8053b3 <release_mmap+0x273>
                        }else if((pde[k]&PAGE_PRESENT)&&(pde[k]&PDE_4MB)){
  80534b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80534e:	48 98                	cdqe   
  805350:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805357:	00 
  805358:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80535c:	48 01 d0             	add    rax,rdx
  80535f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805362:	83 e0 01             	and    eax,0x1
  805365:	48 85 c0             	test   rax,rax
  805368:	74 49                	je     8053b3 <release_mmap+0x273>
  80536a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80536d:	48 98                	cdqe   
  80536f:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805376:	00 
  805377:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80537b:	48 01 d0             	add    rax,rdx
  80537e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805381:	25 80 00 00 00       	and    eax,0x80
  805386:	48 85 c0             	test   rax,rax
  805389:	74 28                	je     8053b3 <release_mmap+0x273>
                            //释放2MB页
                            free_pages_at(pde[k]&PAGE_4K_MASK,512);
  80538b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80538e:	48 98                	cdqe   
  805390:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805397:	00 
  805398:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80539c:	48 01 d0             	add    rax,rdx
  80539f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8053a2:	25 00 f0 ff ff       	and    eax,0xfffff000
  8053a7:	be 00 02 00 00       	mov    esi,0x200
  8053ac:	89 c7                	mov    edi,eax
  8053ae:	e8 14 c4 ff ff       	call   8017c7 <free_pages_at>
                    for(int k=0;k<512;k++)
  8053b3:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8053b7:	81 7d f4 ff 01 00 00 	cmp    DWORD PTR [rbp-0xc],0x1ff
  8053be:	0f 8e 88 fe ff ff    	jle    80524c <release_mmap+0x10c>
                        }
                    }
                    //这一页pde的内容释放完了，这一项指向的vmalloc可以释放了
                    vmfree(pdpte[j]&PAGE_4K_MASK);
  8053c4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8053c7:	48 98                	cdqe   
  8053c9:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8053d0:	00 
  8053d1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8053d5:	48 01 d0             	add    rax,rdx
  8053d8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8053db:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  8053e2:	ff 00 00 
  8053e5:	48 21 d0             	and    rax,rdx
  8053e8:	48 89 c7             	mov    rdi,rax
  8053eb:	e8 58 bf ff ff       	call   801348 <vmfree>
            for(;j<512;j++)
  8053f0:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8053f4:	81 7d f8 ff 01 00 00 	cmp    DWORD PTR [rbp-0x8],0x1ff
  8053fb:	0f 8e cf fd ff ff    	jle    8051d0 <release_mmap+0x90>
                }//1GB先不写，目前还没有初始化之后动态申请1GB页的

            }
            //这一页pdpte的内容释放完了，这一项指向的vmalloc可以释放了
            vmfree(pml4e[i]&PAGE_4K_MASK);
  805401:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805404:	48 98                	cdqe   
  805406:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80540d:	00 
  80540e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805412:	48 01 d0             	add    rax,rdx
  805415:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805418:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  80541f:	ff 00 00 
  805422:	48 21 d0             	and    rax,rdx
  805425:	48 89 c7             	mov    rdi,rax
  805428:	e8 1b bf ff ff       	call   801348 <vmfree>
    for(int i=0;i<512;i++)
  80542d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805431:	81 7d fc ff 01 00 00 	cmp    DWORD PTR [rbp-0x4],0x1ff
  805438:	0f 8e 35 fd ff ff    	jle    805173 <release_mmap+0x33>
        }
    }
}
  80543e:	90                   	nop
  80543f:	90                   	nop
  805440:	c9                   	leave  
  805441:	c3                   	ret    

0000000000805442 <copy_mmap>:
void copy_mmap(struct process* from, struct process *to){
  805442:	f3 0f 1e fa          	endbr64 
  805446:	55                   	push   rbp
  805447:	48 89 e5             	mov    rbp,rsp
  80544a:	48 83 ec 60          	sub    rsp,0x60
  80544e:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  805452:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
    page_item * pml4p=vmalloc();
  805456:	b8 00 00 00 00       	mov    eax,0x0
  80545b:	e8 59 be ff ff       	call   8012b9 <vmalloc>
  805460:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    memcpy(pml4p,from->regs.cr3,PAGE_4K_SIZE);//复制pml4
  805464:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  805468:	48 8b 80 44 02 00 00 	mov    rax,QWORD PTR [rax+0x244]
  80546f:	48 89 c1             	mov    rcx,rax
  805472:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805476:	ba 00 10 00 00       	mov    edx,0x1000
  80547b:	48 89 ce             	mov    rsi,rcx
  80547e:	48 89 c7             	mov    rdi,rax
  805481:	e8 bf 64 00 00       	call   80b945 <memcpy>
    to->regs.cr3=pml4p;
  805486:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80548a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80548e:	48 89 90 44 02 00 00 	mov    QWORD PTR [rax+0x244],rdx
    to->pml4=pml4p;
  805495:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  805499:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80549d:	48 89 90 c0 00 00 00 	mov    QWORD PTR [rax+0xc0],rdx
    //复制pdpt

    page_item *pml4e= pml4p;
  8054a4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8054a8:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    for(int i=0;i<512;i++)
  8054ac:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8054b3:	e9 09 03 00 00       	jmp    8057c1 <copy_mmap+0x37f>
    {
        if(pml4e[i]&PAGE_PRESENT){
  8054b8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8054bb:	48 98                	cdqe   
  8054bd:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8054c4:	00 
  8054c5:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8054c9:	48 01 d0             	add    rax,rdx
  8054cc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8054cf:	83 e0 01             	and    eax,0x1
  8054d2:	48 85 c0             	test   rax,rax
  8054d5:	0f 84 e2 02 00 00    	je     8057bd <copy_mmap+0x37b>
            addr_t old_data=pml4e[i];//旧的数据，里面保存了属性和要拷贝的数据的地址
  8054db:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8054de:	48 98                	cdqe   
  8054e0:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8054e7:	00 
  8054e8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8054ec:	48 01 d0             	add    rax,rdx
  8054ef:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8054f2:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            pml4e[i]=vmalloc()|(old_data&~PAGE_4K_MASK);
  8054f6:	b8 00 00 00 00       	mov    eax,0x0
  8054fb:	e8 b9 bd ff ff       	call   8012b9 <vmalloc>
  805500:	48 89 c2             	mov    rdx,rax
  805503:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  80550a:	00 ff ff 
  80550d:	48 23 45 d8          	and    rax,QWORD PTR [rbp-0x28]
  805511:	48 89 c1             	mov    rcx,rax
  805514:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805517:	48 98                	cdqe   
  805519:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  805520:	00 
  805521:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805525:	48 01 f0             	add    rax,rsi
  805528:	48 09 ca             	or     rdx,rcx
  80552b:	48 89 10             	mov    QWORD PTR [rax],rdx
            memcpy(pml4e[i]&PAGE_4K_MASK,old_data&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  80552e:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  805535:	ff 00 00 
  805538:	48 23 45 d8          	and    rax,QWORD PTR [rbp-0x28]
  80553c:	48 89 c1             	mov    rcx,rax
  80553f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805542:	48 98                	cdqe   
  805544:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80554b:	00 
  80554c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805550:	48 01 d0             	add    rax,rdx
  805553:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805556:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  80555d:	ff 00 00 
  805560:	48 21 d0             	and    rax,rdx
  805563:	ba 00 10 00 00       	mov    edx,0x1000
  805568:	48 89 ce             	mov    rsi,rcx
  80556b:	48 89 c7             	mov    rdi,rax
  80556e:	e8 d2 63 00 00       	call   80b945 <memcpy>
            page_item *pdpte=pml4e[i]&PAGE_4K_MASK;
  805573:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805576:	48 98                	cdqe   
  805578:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80557f:	00 
  805580:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805584:	48 01 d0             	add    rax,rdx
  805587:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80558a:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805591:	ff 00 00 
  805594:	48 21 d0             	and    rax,rdx
  805597:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            for(int j=0;j<512;j++)
  80559b:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8055a2:	e9 09 02 00 00       	jmp    8057b0 <copy_mmap+0x36e>
            {
                if(pdpte[j]&PAGE_PRESENT&&!(pdpte[j]&PDPTE_1GB)){
  8055a7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8055aa:	48 98                	cdqe   
  8055ac:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8055b3:	00 
  8055b4:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8055b8:	48 01 d0             	add    rax,rdx
  8055bb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8055be:	83 e0 01             	and    eax,0x1
  8055c1:	48 85 c0             	test   rax,rax
  8055c4:	0f 84 e2 01 00 00    	je     8057ac <copy_mmap+0x36a>
  8055ca:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8055cd:	48 98                	cdqe   
  8055cf:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8055d6:	00 
  8055d7:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8055db:	48 01 d0             	add    rax,rdx
  8055de:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8055e1:	25 80 00 00 00       	and    eax,0x80
  8055e6:	48 85 c0             	test   rax,rax
  8055e9:	0f 85 bd 01 00 00    	jne    8057ac <copy_mmap+0x36a>
                    addr_t old_data2=pdpte[j];//旧的数据，里面保存了属性和要拷贝的数据的地址
  8055ef:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8055f2:	48 98                	cdqe   
  8055f4:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8055fb:	00 
  8055fc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805600:	48 01 d0             	add    rax,rdx
  805603:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805606:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
                    pdpte[j]=vmalloc()|(old_data2&~PAGE_4K_MASK);
  80560a:	b8 00 00 00 00       	mov    eax,0x0
  80560f:	e8 a5 bc ff ff       	call   8012b9 <vmalloc>
  805614:	48 89 c2             	mov    rdx,rax
  805617:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  80561e:	00 ff ff 
  805621:	48 23 45 c8          	and    rax,QWORD PTR [rbp-0x38]
  805625:	48 89 c1             	mov    rcx,rax
  805628:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80562b:	48 98                	cdqe   
  80562d:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  805634:	00 
  805635:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805639:	48 01 f0             	add    rax,rsi
  80563c:	48 09 ca             	or     rdx,rcx
  80563f:	48 89 10             	mov    QWORD PTR [rax],rdx
                    memcpy(pdpte[j]&PAGE_4K_MASK,old_data2&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  805642:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  805649:	ff 00 00 
  80564c:	48 23 45 c8          	and    rax,QWORD PTR [rbp-0x38]
  805650:	48 89 c1             	mov    rcx,rax
  805653:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805656:	48 98                	cdqe   
  805658:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80565f:	00 
  805660:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805664:	48 01 d0             	add    rax,rdx
  805667:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80566a:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805671:	ff 00 00 
  805674:	48 21 d0             	and    rax,rdx
  805677:	ba 00 10 00 00       	mov    edx,0x1000
  80567c:	48 89 ce             	mov    rsi,rcx
  80567f:	48 89 c7             	mov    rdi,rax
  805682:	e8 be 62 00 00       	call   80b945 <memcpy>
                    page_item *pde=pdpte[j]&PAGE_4K_MASK;
  805687:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80568a:	48 98                	cdqe   
  80568c:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805693:	00 
  805694:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805698:	48 01 d0             	add    rax,rdx
  80569b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80569e:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  8056a5:	ff 00 00 
  8056a8:	48 21 d0             	and    rax,rdx
  8056ab:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
                    for(int k=0;k<512;k++)
  8056af:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8056b6:	e9 e4 00 00 00       	jmp    80579f <copy_mmap+0x35d>
                    {
                        if(pde[k]&PAGE_PRESENT&&!(pde[k]&PDE_4MB)){
  8056bb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8056be:	48 98                	cdqe   
  8056c0:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8056c7:	00 
  8056c8:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8056cc:	48 01 d0             	add    rax,rdx
  8056cf:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8056d2:	83 e0 01             	and    eax,0x1
  8056d5:	48 85 c0             	test   rax,rax
  8056d8:	0f 84 bd 00 00 00    	je     80579b <copy_mmap+0x359>
  8056de:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8056e1:	48 98                	cdqe   
  8056e3:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8056ea:	00 
  8056eb:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8056ef:	48 01 d0             	add    rax,rdx
  8056f2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8056f5:	25 80 00 00 00       	and    eax,0x80
  8056fa:	48 85 c0             	test   rax,rax
  8056fd:	0f 85 98 00 00 00    	jne    80579b <copy_mmap+0x359>
                            addr_t old_data3=pde[k];//旧的数据，里面保存了属性和要拷贝的数据的地址
  805703:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805706:	48 98                	cdqe   
  805708:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80570f:	00 
  805710:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805714:	48 01 d0             	add    rax,rdx
  805717:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80571a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
                            pde[k]=vmalloc()|(old_data3&~PAGE_4K_MASK);
  80571e:	b8 00 00 00 00       	mov    eax,0x0
  805723:	e8 91 bb ff ff       	call   8012b9 <vmalloc>
  805728:	48 89 c2             	mov    rdx,rax
  80572b:	48 b8 ff 0f 00 00 00 	movabs rax,0xffff000000000fff
  805732:	00 ff ff 
  805735:	48 23 45 b8          	and    rax,QWORD PTR [rbp-0x48]
  805739:	48 89 c1             	mov    rcx,rax
  80573c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80573f:	48 98                	cdqe   
  805741:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  805748:	00 
  805749:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80574d:	48 01 f0             	add    rax,rsi
  805750:	48 09 ca             	or     rdx,rcx
  805753:	48 89 10             	mov    QWORD PTR [rax],rdx
                            memcpy(pde[k]&PAGE_4K_MASK,old_data3&PAGE_4K_MASK,PAGE_4K_SIZE);//把老的数据拷贝到新的页面里
  805756:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  80575d:	ff 00 00 
  805760:	48 23 45 b8          	and    rax,QWORD PTR [rbp-0x48]
  805764:	48 89 c1             	mov    rcx,rax
  805767:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80576a:	48 98                	cdqe   
  80576c:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805773:	00 
  805774:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  805778:	48 01 d0             	add    rax,rdx
  80577b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80577e:	48 ba 00 f0 ff ff ff 	movabs rdx,0xfffffffff000
  805785:	ff 00 00 
  805788:	48 21 d0             	and    rax,rdx
  80578b:	ba 00 10 00 00       	mov    edx,0x1000
  805790:	48 89 ce             	mov    rsi,rcx
  805793:	48 89 c7             	mov    rdi,rax
  805796:	e8 aa 61 00 00       	call   80b945 <memcpy>
                    for(int k=0;k<512;k++)
  80579b:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80579f:	81 7d f4 ff 01 00 00 	cmp    DWORD PTR [rbp-0xc],0x1ff
  8057a6:	0f 8e 0f ff ff ff    	jle    8056bb <copy_mmap+0x279>
            for(int j=0;j<512;j++)
  8057ac:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8057b0:	81 7d f8 ff 01 00 00 	cmp    DWORD PTR [rbp-0x8],0x1ff
  8057b7:	0f 8e ea fd ff ff    	jle    8055a7 <copy_mmap+0x165>
    for(int i=0;i<512;i++)
  8057bd:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8057c1:	81 7d fc ff 01 00 00 	cmp    DWORD PTR [rbp-0x4],0x1ff
  8057c8:	0f 8e ea fc ff ff    	jle    8054b8 <copy_mmap+0x76>
                    }
                }
            }
        }
    }
}
  8057ce:	90                   	nop
  8057cf:	90                   	nop
  8057d0:	c9                   	leave  
  8057d1:	c3                   	ret    

00000000008057d2 <getpgrp>:

pid_t getpgrp(void){
  8057d2:	f3 0f 1e fa          	endbr64 
  8057d6:	55                   	push   rbp
  8057d7:	48 89 e5             	mov    rbp,rsp
    return current->gpid;
  8057da:	48 8b 05 bf fd c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fdbf]        # 4155a0 <current>
  8057e1:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
}
  8057e4:	5d                   	pop    rbp
  8057e5:	c3                   	ret    

00000000008057e6 <getpgid>:

int getpgid(pid_t pid,gid_t gid){
  8057e6:	f3 0f 1e fa          	endbr64 
  8057ea:	55                   	push   rbp
  8057eb:	48 89 e5             	mov    rbp,rsp
  8057ee:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8057f1:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==0)
  8057f4:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8057f8:	75 0c                	jne    805806 <getpgid+0x20>
        return current->gpid;
  8057fa:	48 8b 05 9f fd c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fd9f]        # 4155a0 <current>
  805801:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805804:	eb 49                	jmp    80584f <getpgid+0x69>
    for (int i = 0; i <MAX_TASKS; ++i) {
  805806:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80580d:	eb 35                	jmp    805844 <getpgid+0x5e>
        if(task[i].pid==pid)
  80580f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805812:	48 98                	cdqe   
  805814:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80581b:	48 05 a0 84 40 00    	add    rax,0x4084a0
  805821:	8b 10                	mov    edx,DWORD PTR [rax]
  805823:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805826:	39 c2                	cmp    edx,eax
  805828:	75 16                	jne    805840 <getpgid+0x5a>
            return task[i].gpid;
  80582a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80582d:	48 98                	cdqe   
  80582f:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805836:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80583c:	8b 00                	mov    eax,DWORD PTR [rax]
  80583e:	eb 0f                	jmp    80584f <getpgid+0x69>
    for (int i = 0; i <MAX_TASKS; ++i) {
  805840:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805844:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  805848:	7e c5                	jle    80580f <getpgid+0x29>
    }
    return -1;
  80584a:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  80584f:	5d                   	pop    rbp
  805850:	c3                   	ret    

0000000000805851 <setpgid>:
int setpgid(pid_t pid,gid_t gid){
  805851:	f3 0f 1e fa          	endbr64 
  805855:	55                   	push   rbp
  805856:	48 89 e5             	mov    rbp,rsp
  805859:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80585c:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==0)
  80585f:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  805863:	75 38                	jne    80589d <setpgid+0x4c>
    {
        if(current->sid==current->pid)
  805865:	48 8b 05 34 fd c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fd34]        # 4155a0 <current>
  80586c:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80586f:	48 8b 05 2a fd c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fd2a]        # 4155a0 <current>
  805876:	8b 00                	mov    eax,DWORD PTR [rax]
  805878:	39 c2                	cmp    edx,eax
  80587a:	75 0a                	jne    805886 <setpgid+0x35>
            return -1;
  80587c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805881:	e9 9d 00 00 00       	jmp    805923 <setpgid+0xd2>
        current->gpid=gid;
  805886:	48 8b 05 13 fd c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fd13]        # 4155a0 <current>
  80588d:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  805890:	89 50 04             	mov    DWORD PTR [rax+0x4],edx
        return 0;
  805893:	b8 00 00 00 00       	mov    eax,0x0
  805898:	e9 86 00 00 00       	jmp    805923 <setpgid+0xd2>
    }
    for (int i = 0; i <MAX_TASKS; ++i) {
  80589d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8058a4:	eb 72                	jmp    805918 <setpgid+0xc7>
        if(task[i].pid==pid)
  8058a6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8058a9:	48 98                	cdqe   
  8058ab:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8058b2:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8058b8:	8b 10                	mov    edx,DWORD PTR [rax]
  8058ba:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8058bd:	39 c2                	cmp    edx,eax
  8058bf:	75 53                	jne    805914 <setpgid+0xc3>
        {
            if(task[i].sid==task[i].pid)
  8058c1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8058c4:	48 98                	cdqe   
  8058c6:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8058cd:	48 05 a8 84 40 00    	add    rax,0x4084a8
  8058d3:	8b 10                	mov    edx,DWORD PTR [rax]
  8058d5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8058d8:	48 98                	cdqe   
  8058da:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8058e1:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8058e7:	8b 00                	mov    eax,DWORD PTR [rax]
  8058e9:	39 c2                	cmp    edx,eax
  8058eb:	75 07                	jne    8058f4 <setpgid+0xa3>
                return -1;
  8058ed:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8058f2:	eb 2f                	jmp    805923 <setpgid+0xd2>
            task[i].gpid=gid;
  8058f4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8058f7:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8058fa:	48 63 d2             	movsxd rdx,edx
  8058fd:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  805904:	48 81 c2 a4 84 40 00 	add    rdx,0x4084a4
  80590b:	89 02                	mov    DWORD PTR [rdx],eax
            return 0;
  80590d:	b8 00 00 00 00       	mov    eax,0x0
  805912:	eb 0f                	jmp    805923 <setpgid+0xd2>
    for (int i = 0; i <MAX_TASKS; ++i) {
  805914:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805918:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  80591c:	7e 88                	jle    8058a6 <setpgid+0x55>
        }
    }
    return -1;
  80591e:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  805923:	5d                   	pop    rbp
  805924:	c3                   	ret    

0000000000805925 <setsid>:

pid_t setsid(void){
  805925:	f3 0f 1e fa          	endbr64 
  805929:	55                   	push   rbp
  80592a:	48 89 e5             	mov    rbp,rsp
    current->sid=current->pid;
  80592d:	48 8b 15 6c fc c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0fc6c]        # 4155a0 <current>
  805934:	48 8b 05 65 fc c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fc65]        # 4155a0 <current>
  80593b:	8b 12                	mov    edx,DWORD PTR [rdx]
  80593d:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
}
  805940:	90                   	nop
  805941:	5d                   	pop    rbp
  805942:	c3                   	ret    

0000000000805943 <getsid>:
pid_t getsid(pid_t pid){
  805943:	f3 0f 1e fa          	endbr64 
  805947:	55                   	push   rbp
  805948:	48 89 e5             	mov    rbp,rsp
  80594b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(pid==0)
  80594e:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  805952:	75 0c                	jne    805960 <getsid+0x1d>
        return current->sid;
  805954:	48 8b 05 45 fc c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fc45]        # 4155a0 <current>
  80595b:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80595e:	eb 49                	jmp    8059a9 <getsid+0x66>
    for (int i = 0; i <MAX_TASKS; ++i) {
  805960:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805967:	eb 35                	jmp    80599e <getsid+0x5b>
        if(task[i].pid==pid)
  805969:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80596c:	48 98                	cdqe   
  80596e:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805975:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80597b:	8b 10                	mov    edx,DWORD PTR [rax]
  80597d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805980:	39 c2                	cmp    edx,eax
  805982:	75 16                	jne    80599a <getsid+0x57>
            return task[i].sid;
  805984:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805987:	48 98                	cdqe   
  805989:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805990:	48 05 a8 84 40 00    	add    rax,0x4084a8
  805996:	8b 00                	mov    eax,DWORD PTR [rax]
  805998:	eb 0f                	jmp    8059a9 <getsid+0x66>
    for (int i = 0; i <MAX_TASKS; ++i) {
  80599a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80599e:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  8059a2:	7e c5                	jle    805969 <getsid+0x26>
    }
    return -1;
  8059a4:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8059a9:	5d                   	pop    rbp
  8059aa:	c3                   	ret    

00000000008059ab <tcsetpgrp>:
int tcsetpgrp(int fildes,pid_t pgid_id){
  8059ab:	f3 0f 1e fa          	endbr64 
  8059af:	55                   	push   rbp
  8059b0:	48 89 e5             	mov    rbp,rsp
  8059b3:	48 83 ec 20          	sub    rsp,0x20
  8059b7:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8059ba:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    //当前controlling terminal断联
    sys_ioctl(fildes,TTY_DISCONNECT,0);
  8059bd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8059c0:	ba 00 00 00 00       	mov    edx,0x0
  8059c5:	be 02 00 00 00       	mov    esi,0x2
  8059ca:	89 c7                	mov    edi,eax
  8059cc:	e8 ca 00 00 00       	call   805a9b <sys_ioctl>
    int sid= getsid(0);//获取session id
  8059d1:	bf 00 00 00 00       	mov    edi,0x0
  8059d6:	e8 68 ff ff ff       	call   805943 <getsid>
  8059db:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    struct process* new_fgl=NULL;
  8059de:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8059e5:	00 
    for (int i = 0; i <MAX_TASKS; ++i) {
  8059e6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8059ed:	e9 85 00 00 00       	jmp    805a77 <tcsetpgrp+0xcc>
        if(task[i].stat==ENDED)continue;
  8059f2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8059f5:	48 98                	cdqe   
  8059f7:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8059fe:	48 05 b8 84 40 00    	add    rax,0x4084b8
  805a04:	8b 00                	mov    eax,DWORD PTR [rax]
  805a06:	83 f8 03             	cmp    eax,0x3
  805a09:	74 67                	je     805a72 <tcsetpgrp+0xc7>
        if(task[i].sid==sid){
  805a0b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805a0e:	48 98                	cdqe   
  805a10:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805a17:	48 05 a8 84 40 00    	add    rax,0x4084a8
  805a1d:	8b 10                	mov    edx,DWORD PTR [rax]
  805a1f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805a22:	39 c2                	cmp    edx,eax
  805a24:	75 4d                	jne    805a73 <tcsetpgrp+0xc8>
            task[i].fg_pgid=pgid_id;
  805a26:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805a29:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  805a2c:	48 63 d2             	movsxd rdx,edx
  805a2f:	48 69 d2 1c 03 00 00 	imul   rdx,rdx,0x31c
  805a36:	48 81 c2 ac 84 40 00 	add    rdx,0x4084ac
  805a3d:	89 02                	mov    DWORD PTR [rdx],eax
            if(task[i].pid==pgid_id){
  805a3f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805a42:	48 98                	cdqe   
  805a44:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805a4b:	48 05 a0 84 40 00    	add    rax,0x4084a0
  805a51:	8b 10                	mov    edx,DWORD PTR [rax]
  805a53:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805a56:	39 c2                	cmp    edx,eax
  805a58:	75 19                	jne    805a73 <tcsetpgrp+0xc8>
                //这是新前台进程组的leader
                new_fgl=&task[i];
  805a5a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805a5d:	48 98                	cdqe   
  805a5f:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  805a66:	48 05 a0 84 40 00    	add    rax,0x4084a0
  805a6c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  805a70:	eb 01                	jmp    805a73 <tcsetpgrp+0xc8>
        if(task[i].stat==ENDED)continue;
  805a72:	90                   	nop
    for (int i = 0; i <MAX_TASKS; ++i) {
  805a73:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805a77:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  805a7b:	0f 8e 71 ff ff ff    	jle    8059f2 <tcsetpgrp+0x47>
            }
        }
    }
    //TODO:通知新leader把tty连接
}
  805a81:	90                   	nop
  805a82:	c9                   	leave  
  805a83:	c3                   	ret    

0000000000805a84 <tcgetpgrp>:
pid_t tcgetpgrp(int fildes){
  805a84:	f3 0f 1e fa          	endbr64 
  805a88:	55                   	push   rbp
  805a89:	48 89 e5             	mov    rbp,rsp
  805a8c:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return current->fg_pgid;
  805a8f:	48 8b 05 0a fb c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fb0a]        # 4155a0 <current>
  805a96:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
}
  805a99:	5d                   	pop    rbp
  805a9a:	c3                   	ret    

0000000000805a9b <sys_ioctl>:
//===============

int sys_ioctl(int fildes, int request, unsigned long args){
  805a9b:	f3 0f 1e fa          	endbr64 
  805a9f:	55                   	push   rbp
  805aa0:	48 89 e5             	mov    rbp,rsp
  805aa3:	48 83 ec 10          	sub    rsp,0x10
  805aa7:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  805aaa:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  805aad:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    current->openf[fildes]->f_ops->ioctl(current->openf[fildes]->dentry->dir_inode,current->openf[fildes]\
  805ab1:	48 8b 05 e8 fa c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fae8]        # 4155a0 <current>
  805ab8:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  805abb:	48 63 d2             	movsxd rdx,edx
  805abe:	48 83 c2 1a          	add    rdx,0x1a
  805ac2:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  805ac7:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  805acb:	4c 8b 40 28          	mov    r8,QWORD PTR [rax+0x28]
  805acf:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805ad2:	48 63 d0             	movsxd rdx,eax
  805ad5:	48 8b 05 c4 fa c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0fac4]        # 4155a0 <current>
  805adc:	8b 4d fc             	mov    ecx,DWORD PTR [rbp-0x4]
  805adf:	48 63 c9             	movsxd rcx,ecx
  805ae2:	48 83 c1 1a          	add    rcx,0x1a
  805ae6:	48 8b 74 c8 08       	mov    rsi,QWORD PTR [rax+rcx*8+0x8]
  805aeb:	48 8b 05 ae fa c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0faae]        # 4155a0 <current>
  805af2:	8b 4d fc             	mov    ecx,DWORD PTR [rbp-0x4]
  805af5:	48 63 c9             	movsxd rcx,ecx
  805af8:	48 83 c1 1a          	add    rcx,0x1a
  805afc:	48 8b 44 c8 08       	mov    rax,QWORD PTR [rax+rcx*8+0x8]
  805b01:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  805b05:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  805b09:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  805b0d:	48 89 c7             	mov    rdi,rax
  805b10:	41 ff d0             	call   r8
    ,request,args);
  805b13:	90                   	nop
  805b14:	c9                   	leave  
  805b15:	c3                   	ret    
  805b16:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  805b1d:	00 00 00 

0000000000805b20 <outb>:
  805b20:	66 89 fa             	mov    dx,di
  805b23:	66 89 f0             	mov    ax,si
  805b26:	ee                   	out    dx,al
  805b27:	e8 29 00 00 00       	call   805b55 <io_delay>
  805b2c:	c3                   	ret    

0000000000805b2d <outw>:
  805b2d:	66 89 fa             	mov    dx,di
  805b30:	66 89 f0             	mov    ax,si
  805b33:	66 ef                	out    dx,ax
  805b35:	90                   	nop
  805b36:	90                   	nop
  805b37:	90                   	nop
  805b38:	c3                   	ret    

0000000000805b39 <inb>:
  805b39:	31 c0                	xor    eax,eax
  805b3b:	66 89 fa             	mov    dx,di
  805b3e:	ec                   	in     al,dx
  805b3f:	90                   	nop
  805b40:	90                   	nop
  805b41:	90                   	nop
  805b42:	c3                   	ret    

0000000000805b43 <inw>:
  805b43:	31 c0                	xor    eax,eax
  805b45:	66 89 fa             	mov    dx,di
  805b48:	66 ed                	in     ax,dx
  805b4a:	90                   	nop
  805b4b:	90                   	nop
  805b4c:	90                   	nop
  805b4d:	c3                   	ret    

0000000000805b4e <eoi>:
  805b4e:	b0 20                	mov    al,0x20
  805b50:	e6 a0                	out    0xa0,al
  805b52:	e6 20                	out    0x20,al
  805b54:	c3                   	ret    

0000000000805b55 <io_delay>:
  805b55:	90                   	nop
  805b56:	90                   	nop
  805b57:	90                   	nop
  805b58:	90                   	nop
  805b59:	c3                   	ret    

0000000000805b5a <turn_on_int>:
  805b5a:	b0 f8                	mov    al,0xf8
  805b5c:	e6 21                	out    0x21,al
  805b5e:	e8 f2 ff ff ff       	call   805b55 <io_delay>
  805b63:	b0 af                	mov    al,0xaf
  805b65:	e6 a1                	out    0xa1,al
  805b67:	e8 e9 ff ff ff       	call   805b55 <io_delay>
  805b6c:	b8 00 70 10 00       	mov    eax,0x107000
  805b71:	0f 01 18             	lidt   [rax]
  805b74:	90                   	nop
  805b75:	90                   	nop
  805b76:	90                   	nop
  805b77:	90                   	nop
  805b78:	c3                   	ret    

0000000000805b79 <report_back_trace_of_err>:
  805b79:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  805b7e:	50                   	push   rax
  805b7f:	68 88 5b 80 00       	push   0x805b88
  805b84:	83 c4 08             	add    esp,0x8
  805b87:	c3                   	ret    

0000000000805b88 <bt_msg>:
  805b88:	65 72 72             	gs jb  805bfd <fill_desc+0x4e>
  805b8b:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  805b8c:	72 20                	jb     805bae <init_gdt+0x11>
  805b8e:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  805b8f:	63 63 75             	movsxd esp,DWORD PTR [rbx+0x75]
  805b92:	72 73                	jb     805c07 <fill_desc+0x58>
  805b94:	20 61 74             	and    BYTE PTR [rcx+0x74],ah
  805b97:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR [rip+0x6e5c78]        # eeb815 <_knl_end+0x2eb815>

0000000000805b9d <init_gdt>:
#include "gdt.h"
#include "int.h"
descriptor *gdt=GDT_ADDR;
extern char *gdtptr;
int init_gdt()
{
  805b9d:	f3 0f 1e fa          	endbr64 
  805ba1:	55                   	push   rbp
  805ba2:	48 89 e5             	mov    rbp,rsp
//    fill_desc(0x108000,108,SEG_SYS_TSS|SEG_PRESENT,4);
    asm volatile("mov $0x48,%ax\r\n"
  805ba5:	66 b8 48 00          	mov    ax,0x48
  805ba9:	0f 00 d8             	ltr    ax
                 "ltr %ax");  
}
  805bac:	90                   	nop
  805bad:	5d                   	pop    rbp
  805bae:	c3                   	ret    

0000000000805baf <fill_desc>:
void fill_desc(u64 base, u64 limit, u16 attr, u32 index)
{
  805baf:	f3 0f 1e fa          	endbr64 
  805bb3:	55                   	push   rbp
  805bb4:	48 89 e5             	mov    rbp,rsp
  805bb7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  805bbb:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  805bbf:	89 d0                	mov    eax,edx
  805bc1:	89 4d e8             	mov    DWORD PTR [rbp-0x18],ecx
  805bc4:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    gdt[index].base_12=base&0xffff;
  805bc8:	48 8b 15 99 67 00 00 	mov    rdx,QWORD PTR [rip+0x6799]        # 80c368 <gdt>
  805bcf:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805bd2:	48 c1 e0 04          	shl    rax,0x4
  805bd6:	48 01 d0             	add    rax,rdx
  805bd9:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  805bdd:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    gdt[index].base_3=(base>>16)&0xff;
  805be1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805be5:	48 c1 e8 10          	shr    rax,0x10
  805be9:	48 89 c1             	mov    rcx,rax
  805bec:	48 8b 15 75 67 00 00 	mov    rdx,QWORD PTR [rip+0x6775]        # 80c368 <gdt>
  805bf3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805bf6:	48 c1 e0 04          	shl    rax,0x4
  805bfa:	48 01 d0             	add    rax,rdx
  805bfd:	89 ca                	mov    edx,ecx
  805bff:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    gdt[index].base_4=(base>>24)&0xff;
  805c02:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805c06:	48 c1 e8 18          	shr    rax,0x18
  805c0a:	48 89 c1             	mov    rcx,rax
  805c0d:	48 8b 15 54 67 00 00 	mov    rdx,QWORD PTR [rip+0x6754]        # 80c368 <gdt>
  805c14:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805c17:	48 c1 e0 04          	shl    rax,0x4
  805c1b:	48 01 d0             	add    rax,rdx
  805c1e:	89 ca                	mov    edx,ecx
  805c20:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    gdt[index].base_5678=(base>>32)&0xffffffff;
  805c23:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805c27:	48 c1 e8 20          	shr    rax,0x20
  805c2b:	48 89 c2             	mov    rdx,rax
  805c2e:	48 8b 0d 33 67 00 00 	mov    rcx,QWORD PTR [rip+0x6733]        # 80c368 <gdt>
  805c35:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805c38:	48 c1 e0 04          	shl    rax,0x4
  805c3c:	48 01 c8             	add    rax,rcx
  805c3f:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    gdt[index].limit_lo16=limit&0xffff;
  805c42:	48 8b 15 1f 67 00 00 	mov    rdx,QWORD PTR [rip+0x671f]        # 80c368 <gdt>
  805c49:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805c4c:	48 c1 e0 04          	shl    rax,0x4
  805c50:	48 01 d0             	add    rax,rdx
  805c53:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  805c57:	66 89 10             	mov    WORD PTR [rax],dx
    gdt[index].attr=attr|((limit>>8)&0xf0);
  805c5a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805c5e:	48 c1 e8 08          	shr    rax,0x8
  805c62:	66 25 f0 00          	and    ax,0xf0
  805c66:	48 8b 0d fb 66 00 00 	mov    rcx,QWORD PTR [rip+0x66fb]        # 80c368 <gdt>
  805c6d:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  805c70:	48 c1 e2 04          	shl    rdx,0x4
  805c74:	48 01 ca             	add    rdx,rcx
  805c77:	66 0b 45 ec          	or     ax,WORD PTR [rbp-0x14]
  805c7b:	66 89 42 05          	mov    WORD PTR [rdx+0x5],ax

}
  805c7f:	90                   	nop
  805c80:	5d                   	pop    rbp
  805c81:	c3                   	ret    

0000000000805c82 <fill_gate>:

void fill_gate(u32 index,u32 offset,u16 selector,u16 attr)
{
  805c82:	f3 0f 1e fa          	endbr64 
  805c86:	55                   	push   rbp
  805c87:	48 89 e5             	mov    rbp,rsp
  805c8a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  805c8d:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  805c90:	89 c8                	mov    eax,ecx
  805c92:	66 89 55 e4          	mov    WORD PTR [rbp-0x1c],dx
  805c96:	66 89 45 e0          	mov    WORD PTR [rbp-0x20],ax
    gate* ptr=gdt;
  805c9a:	48 8b 05 c7 66 00 00 	mov    rax,QWORD PTR [rip+0x66c7]        # 80c368 <gdt>
  805ca1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ptr[index].offset_low=offset&0xffff;
  805ca5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805ca8:	48 c1 e0 04          	shl    rax,0x4
  805cac:	48 89 c2             	mov    rdx,rax
  805caf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805cb3:	48 01 d0             	add    rax,rdx
  805cb6:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  805cb9:	66 89 10             	mov    WORD PTR [rax],dx
    ptr[index].offset_high=(offset>>16)&0xffff;
  805cbc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805cbf:	48 c1 e0 04          	shl    rax,0x4
  805cc3:	48 89 c2             	mov    rdx,rax
  805cc6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805cca:	48 01 d0             	add    rax,rdx
  805ccd:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  805cd0:	c1 ea 10             	shr    edx,0x10
  805cd3:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    ptr[index].selector=selector;
  805cd6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805cd9:	48 c1 e0 04          	shl    rax,0x4
  805cdd:	48 89 c2             	mov    rdx,rax
  805ce0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805ce4:	48 01 c2             	add    rdx,rax
  805ce7:	0f b7 45 e4          	movzx  eax,WORD PTR [rbp-0x1c]
  805ceb:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    ptr[index].attr=attr;
  805cef:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805cf2:	48 c1 e0 04          	shl    rax,0x4
  805cf6:	48 89 c2             	mov    rdx,rax
  805cf9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805cfd:	48 01 c2             	add    rdx,rax
  805d00:	0f b7 45 e0          	movzx  eax,WORD PTR [rbp-0x20]
  805d04:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
}
  805d08:	90                   	nop
  805d09:	5d                   	pop    rbp
  805d0a:	c3                   	ret    

0000000000805d0b <fill_ldt_desc>:

void fill_ldt_desc(u32 base, u32 limit,u16 attr,descriptor *desc)
{
  805d0b:	f3 0f 1e fa          	endbr64 
  805d0f:	55                   	push   rbp
  805d10:	48 89 e5             	mov    rbp,rsp
  805d13:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  805d16:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  805d19:	89 d0                	mov    eax,edx
  805d1b:	48 89 4d e8          	mov    QWORD PTR [rbp-0x18],rcx
  805d1f:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
//    desc->base_lo16=base&0xffff;
//    desc->base_mid8=(base>>16)&0xff;
//    desc->base_hi8=(base>>24)&0xff;
//    desc->limit_lo16=limit&0xffff;
//    desc->attr=attr|(limit>>16&0xf)<<8;
  805d23:	90                   	nop
  805d24:	5d                   	pop    rbp
  805d25:	c3                   	ret    
  805d26:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  805d2d:	00 00 00 

0000000000805d30 <fill_desc>:
  805d30:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  805d35:	67 8b 5c 24 08       	mov    ebx,DWORD PTR [esp+0x8]
  805d3a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  805d3f:	67 8b 54 24 10       	mov    edx,DWORD PTR [esp+0x10]
  805d44:	be 00 60 00 00       	mov    esi,0x6000
  805d49:	c1 e2 03             	shl    edx,0x3
  805d4c:	01 d6                	add    esi,edx
  805d4e:	66 67 89 1e          	mov    WORD PTR [esi],bx
  805d52:	66 67 89 46 02       	mov    WORD PTR [esi+0x2],ax
  805d57:	c1 e8 10             	shr    eax,0x10
  805d5a:	67 88 46 04          	mov    BYTE PTR [esi+0x4],al
  805d5e:	c1 eb 10             	shr    ebx,0x10
  805d61:	67 88 5e 06          	mov    BYTE PTR [esi+0x6],bl
  805d65:	67 88 66 07          	mov    BYTE PTR [esi+0x7],ah
  805d69:	67 09 4e 05          	or     DWORD PTR [esi+0x5],ecx
  805d6d:	c3                   	ret    

0000000000805d6e <clock_c>:
#include <devman.h>
#include <disk.h>
extern int manage_proc_lock;
extern int cur_proc;
extern struct process *task;
void clock_c(){
  805d6e:	f3 0f 1e fa          	endbr64 
  805d72:	55                   	push   rbp
  805d73:	48 89 e5             	mov    rbp,rsp
    //refresh_wnds();
    execute_request();
  805d76:	b8 00 00 00 00       	mov    eax,0x0
  805d7b:	e8 a6 26 00 00       	call   808426 <execute_request>
    do_req();
  805d80:	b8 00 00 00 00       	mov    eax,0x0
  805d85:	e8 e9 d5 ff ff       	call   803373 <do_req>
    if(!manage_proc_lock)
  805d8a:	8b 05 78 65 00 00    	mov    eax,DWORD PTR [rip+0x6578]        # 80c308 <manage_proc_lock>
  805d90:	85 c0                	test   eax,eax
  805d92:	75 0a                	jne    805d9e <clock_c+0x30>
    {
        manage_proc();
  805d94:	b8 00 00 00 00       	mov    eax,0x0
  805d99:	e8 93 dd ff ff       	call   803b31 <manage_proc>
    }
    //puts("1 disk req executed.");
  805d9e:	90                   	nop
  805d9f:	5d                   	pop    rbp
  805da0:	c3                   	ret    
  805da1:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  805da8:	00 00 00 
  805dab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000805db0 <clock>:
  805db0:	50                   	push   rax
  805db1:	53                   	push   rbx
  805db2:	51                   	push   rcx
  805db3:	52                   	push   rdx
  805db4:	57                   	push   rdi
  805db5:	56                   	push   rsi
  805db6:	41 50                	push   r8
  805db8:	41 51                	push   r9
  805dba:	41 52                	push   r10
  805dbc:	41 53                	push   r11
  805dbe:	41 54                	push   r12
  805dc0:	41 55                	push   r13
  805dc2:	41 56                	push   r14
  805dc4:	41 57                	push   r15
  805dc6:	e8 3e dd ff ff       	call   803b09 <save_rsp>
  805dcb:	66 8c c0             	mov    ax,es
  805dce:	50                   	push   rax
  805dcf:	66 8c d8             	mov    ax,ds
  805dd2:	50                   	push   rax
  805dd3:	66 b8 10 00          	mov    ax,0x10
  805dd7:	8e c0                	mov    es,eax
  805dd9:	8e d8                	mov    ds,eax

0000000000805ddb <clock.normal_part>:
  805ddb:	b0 20                	mov    al,0x20
  805ddd:	e6 a0                	out    0xa0,al
  805ddf:	e6 20                	out    0x20,al
  805de1:	e8 88 ff ff ff       	call   805d6e <clock_c>
  805de6:	58                   	pop    rax
  805de7:	8e d8                	mov    ds,eax
  805de9:	58                   	pop    rax
  805dea:	8e c0                	mov    es,eax
  805dec:	41 5f                	pop    r15
  805dee:	41 5e                	pop    r14
  805df0:	41 5d                	pop    r13
  805df2:	41 5c                	pop    r12
  805df4:	41 5b                	pop    r11
  805df6:	41 5a                	pop    r10
  805df8:	41 59                	pop    r9
  805dfa:	41 58                	pop    r8
  805dfc:	5e                   	pop    rsi
  805dfd:	5f                   	pop    rdi
  805dfe:	5a                   	pop    rdx
  805dff:	59                   	pop    rcx
  805e00:	5b                   	pop    rbx
  805e01:	58                   	pop    rax
  805e02:	48 cf                	iretq  

0000000000805e04 <execute>:
    return ind;
}
*/

int execute(char *path, char **argv)
{
  805e04:	f3 0f 1e fa          	endbr64 
  805e08:	55                   	push   rbp
  805e09:	48 89 e5             	mov    rbp,rsp
  805e0c:	48 83 ec 30          	sub    rsp,0x30
  805e10:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  805e14:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    //尚未切换到目标进程
    //syscall(SYSCALL_REG_PROC, load_pe,0,0,0,0);
    int fno=-1,cwd_fno=-1;
  805e18:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  805e1f:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    if((fno=sys_open(path, O_EXEC)) <0)return -1;
  805e26:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805e2a:	be 00 10 00 00       	mov    esi,0x1000
  805e2f:	48 89 c7             	mov    rdi,rax
  805e32:	e8 79 16 00 00       	call   8074b0 <sys_open>
  805e37:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  805e3a:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  805e3e:	79 0a                	jns    805e4a <execute+0x46>
  805e40:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805e45:	e9 ba 00 00 00       	jmp    805f04 <execute+0x100>
    //
    char *p=path;
  805e4a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805e4e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='\0';p++);
  805e52:	eb 05                	jmp    805e59 <execute+0x55>
  805e54:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  805e59:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805e5d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805e60:	84 c0                	test   al,al
  805e62:	75 f0                	jne    805e54 <execute+0x50>
    for(;*p!='/'&&p>path;p--);
  805e64:	eb 05                	jmp    805e6b <execute+0x67>
  805e66:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  805e6b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805e6f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805e72:	3c 2f                	cmp    al,0x2f
  805e74:	74 0a                	je     805e80 <execute+0x7c>
  805e76:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805e7a:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  805e7e:	77 e6                	ja     805e66 <execute+0x62>
    if(p>path)
  805e80:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805e84:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  805e88:	76 2f                	jbe    805eb9 <execute+0xb5>
    {
        *p='\0';
  805e8a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805e8e:	c6 00 00             	mov    BYTE PTR [rax],0x0
        if((cwd_fno=sys_open(path, O_DIRECTORY)) <0)return -1;
  805e91:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805e95:	be 00 40 00 00       	mov    esi,0x4000
  805e9a:	48 89 c7             	mov    rdi,rax
  805e9d:	e8 0e 16 00 00       	call   8074b0 <sys_open>
  805ea2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805ea5:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  805ea9:	79 07                	jns    805eb2 <execute+0xae>
  805eab:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805eb0:	eb 52                	jmp    805f04 <execute+0x100>
        *p='/';
  805eb2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805eb6:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
    }
    extern struct file opened[];
    extern struct process task[];
    int pi= reg_proc(proc_start, &opened[cwd_fno], &opened[fno]);
  805eb9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805ebc:	48 63 d0             	movsxd rdx,eax
  805ebf:	48 89 d0             	mov    rax,rdx
  805ec2:	48 c1 e0 02          	shl    rax,0x2
  805ec6:	48 01 d0             	add    rax,rdx
  805ec9:	48 c1 e0 03          	shl    rax,0x3
  805ecd:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  805ed4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805ed7:	48 63 c8             	movsxd rcx,eax
  805eda:	48 89 c8             	mov    rax,rcx
  805edd:	48 c1 e0 02          	shl    rax,0x2
  805ee1:	48 01 c8             	add    rax,rcx
  805ee4:	48 c1 e0 03          	shl    rax,0x3
  805ee8:	48 05 60 06 40 00    	add    rax,0x400660
  805eee:	b9 69 60 80 00       	mov    ecx,0x806069
  805ef3:	48 89 c6             	mov    rsi,rax
  805ef6:	48 89 cf             	mov    rdi,rcx
  805ef9:	e8 35 e4 ff ff       	call   804333 <reg_proc>
  805efe:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    return pi;
  805f01:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
}
  805f04:	c9                   	leave  
  805f05:	c3                   	ret    

0000000000805f06 <sys_execve>:

int sys_execve(char *path,char **argv){
  805f06:	f3 0f 1e fa          	endbr64 
  805f0a:	55                   	push   rbp
  805f0b:	48 89 e5             	mov    rbp,rsp
  805f0e:	48 83 ec 30          	sub    rsp,0x30
  805f12:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  805f16:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    int fno=-1,cwd_fno=-1;
  805f1a:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
  805f21:	c7 45 f8 ff ff ff ff 	mov    DWORD PTR [rbp-0x8],0xffffffff
    if((fno=sys_open(path, O_EXEC)) <0)return -ENOENT;
  805f28:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805f2c:	be 00 10 00 00       	mov    esi,0x1000
  805f31:	48 89 c7             	mov    rdi,rax
  805f34:	e8 77 15 00 00       	call   8074b0 <sys_open>
  805f39:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805f3c:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  805f40:	79 0a                	jns    805f4c <sys_execve+0x46>
  805f42:	b8 d3 ff ff ff       	mov    eax,0xffffffd3
  805f47:	e9 ad 00 00 00       	jmp    805ff9 <sys_execve+0xf3>
//        if((cwd_fno=sys_open(path, O_DIRECTORY)) <0)return -1;
//        *p='/';
//    }
    extern struct file opened[];
    extern struct process task[];
    if(sys_close(current->exef-opened)<0)return -1;
  805f4c:	48 8b 05 4d f6 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f64d]        # 4155a0 <current>
  805f53:	48 8b 80 d0 00 00 00 	mov    rax,QWORD PTR [rax+0xd0]
  805f5a:	48 2d 60 06 40 00    	sub    rax,0x400660
  805f60:	48 c1 f8 03          	sar    rax,0x3
  805f64:	48 89 c2             	mov    rdx,rax
  805f67:	48 b8 cd cc cc cc cc 	movabs rax,0xcccccccccccccccd
  805f6e:	cc cc cc 
  805f71:	48 0f af c2          	imul   rax,rdx
  805f75:	89 c7                	mov    edi,eax
  805f77:	e8 4b 18 00 00       	call   8077c7 <sys_close>

    void *retp= load_pe;
  805f7c:	48 c7 45 f0 9b 60 80 	mov    QWORD PTR [rbp-0x10],0x80609b
  805f83:	00 
    current->exef=&opened[fno];//改变执行文件
  805f84:	48 8b 15 15 f6 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0f615]        # 4155a0 <current>
  805f8b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805f8e:	48 63 c8             	movsxd rcx,eax
  805f91:	48 89 c8             	mov    rax,rcx
  805f94:	48 c1 e0 02          	shl    rax,0x2
  805f98:	48 01 c8             	add    rax,rcx
  805f9b:	48 c1 e0 03          	shl    rax,0x3
  805f9f:	48 05 60 06 40 00    	add    rax,0x400660
  805fa5:	48 89 82 d0 00 00 00 	mov    QWORD PTR [rdx+0xd0],rax
    //重新设置进程数据
    //清空原来的页表
    release_mmap(current);
  805fac:	48 8b 05 ed f5 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f5ed]        # 4155a0 <current>
  805fb3:	48 89 c7             	mov    rdi,rax
  805fb6:	e8 85 f1 ff ff       	call   805140 <release_mmap>
    current->regs.rsp=STACK_TOP;//清空栈
  805fbb:	48 8b 05 de f5 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f5de]        # 4155a0 <current>
  805fc2:	48 be 00 f0 ff ff ff 	movabs rsi,0xfffffffff000
  805fc9:	ff 00 00 
  805fcc:	48 89 b0 7c 02 00 00 	mov    QWORD PTR [rax+0x27c],rsi
    extern TSS* tss;
    //sysret直接返回到load_pe加载新程序，然后直接开始运行新程序的main
    stack_store_regs *rs=tss->ists[0]- sizeof(stack_store_regs);
  805fd3:	48 8b 05 86 63 00 00 	mov    rax,QWORD PTR [rip+0x6386]        # 80c360 <tss>
  805fda:	48 8b 40 24          	mov    rax,QWORD PTR [rax+0x24]
  805fde:	48 2d a8 00 00 00    	sub    rax,0xa8
  805fe4:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    rs->rcx=retp;
  805fe8:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  805fec:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805ff0:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    return 0;
  805ff4:	b8 00 00 00 00       	mov    eax,0x0
}
  805ff9:	c9                   	leave  
  805ffa:	c3                   	ret    

0000000000805ffb <exec_call>:
int exec_call(char *path)
{
  805ffb:	f3 0f 1e fa          	endbr64 
  805fff:	55                   	push   rbp
  806000:	48 89 e5             	mov    rbp,rsp
  806003:	48 83 ec 20          	sub    rsp,0x20
  806007:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pi= execute(path, NULL);
  80600b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80600f:	be 00 00 00 00       	mov    esi,0x0
  806014:	48 89 c7             	mov    rdi,rax
  806017:	e8 e8 fd ff ff       	call   805e04 <execute>
  80601c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int tss= _TSS_IND(pi)*8;
  80601f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806022:	01 c0                	add    eax,eax
  806024:	83 c0 05             	add    eax,0x5
  806027:	c1 e0 03             	shl    eax,0x3
  80602a:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    extern struct process task[];
    extern int cur_proc;
    switch_proc_tss(pi);
  80602d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806030:	89 c7                	mov    edi,eax
  806032:	e8 8d dc ff ff       	call   803cc4 <switch_proc_tss>
    while(task[pi].stat!=ENDED);
  806037:	90                   	nop
  806038:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80603b:	48 98                	cdqe   
  80603d:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  806044:	48 05 b0 84 40 00    	add    rax,0x4084b0
  80604a:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80604d:	83 f8 03             	cmp    eax,0x3
  806050:	75 e6                	jne    806038 <exec_call+0x3d>
    return task[pi].exit_code;
  806052:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806055:	48 98                	cdqe   
  806057:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  80605e:	48 05 c0 84 40 00    	add    rax,0x4084c0
  806064:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
}
  806067:	c9                   	leave  
  806068:	c3                   	ret    

0000000000806069 <proc_start>:
int proc_start()
{
  806069:	f3 0f 1e fa          	endbr64 
  80606d:	55                   	push   rbp
  80606e:	48 89 e5             	mov    rbp,rsp
    extern struct process task[];
    extern int cur_proc;
    load_pe(&task[cur_proc]);
  806071:	8b 05 b5 f5 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f5b5]        # 41562c <cur_proc>
  806077:	48 98                	cdqe   
  806079:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  806080:	48 05 a0 84 40 00    	add    rax,0x4084a0
  806086:	48 89 c7             	mov    rdi,rax
  806089:	e8 0d 00 00 00       	call   80609b <load_pe>
    //释放进程资源
    sys_exit(0);
  80608e:	bf 00 00 00 00       	mov    edi,0x0
  806093:	e8 73 e2 ff ff       	call   80430b <sys_exit>
}
  806098:	90                   	nop
  806099:	5d                   	pop    rbp
  80609a:	c3                   	ret    

000000000080609b <load_pe>:
//在cr3切换到目标进程下的加载程序
int load_pe(struct process *proc)
{
  80609b:	f3 0f 1e fa          	endbr64 
  80609f:	55                   	push   rbp
  8060a0:	48 89 e5             	mov    rbp,rsp
  8060a3:	48 81 ec c0 02 00 00 	sub    rsp,0x2c0
  8060aa:	48 89 bd 48 fd ff ff 	mov    QWORD PTR [rbp-0x2b8],rdi
    // 读取文件头
    struct file *f=proc->exef;
  8060b1:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  8060b8:	48 8b 80 d0 00 00 00 	mov    rax,QWORD PTR [rax+0xd0]
  8060bf:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    int exefno=-1;
  8060c3:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    for(int i=0;i<MAX_PROC_OPENF;i++)
  8060ca:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8060d1:	eb 28                	jmp    8060fb <load_pe+0x60>
        if(current->openf[i]==f)
  8060d3:	48 8b 05 c6 f4 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0f4c6]        # 4155a0 <current>
  8060da:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  8060dd:	48 63 d2             	movsxd rdx,edx
  8060e0:	48 83 c2 1a          	add    rdx,0x1a
  8060e4:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  8060e9:	48 39 45 98          	cmp    QWORD PTR [rbp-0x68],rax
  8060ed:	75 08                	jne    8060f7 <load_pe+0x5c>
        {
            exefno=i;
  8060ef:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8060f2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
            break;
  8060f5:	eb 0a                	jmp    806101 <load_pe+0x66>
    for(int i=0;i<MAX_PROC_OPENF;i++)
  8060f7:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8060fb:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  8060ff:	7e d2                	jle    8060d3 <load_pe+0x38>
        }
    if(exefno==-1)return ERR;
  806101:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  806105:	75 0a                	jne    806111 <load_pe+0x76>
  806107:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80610c:	e9 f1 06 00 00       	jmp    806802 <load_pe+0x767>

    IMAGE_DOS_HEADER tdh;
    IMAGE_NT_HEADERS32 tnth;
    sys_read(exefno, &tdh, sizeof(tdh));
  806111:	48 8d 8d 80 fe ff ff 	lea    rcx,[rbp-0x180]
  806118:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80611b:	ba 44 00 00 00       	mov    edx,0x44
  806120:	48 89 ce             	mov    rsi,rcx
  806123:	89 c7                	mov    edi,eax
  806125:	e8 55 17 00 00       	call   80787f <sys_read>
    sys_lseek(exefno,tdh.e_lfanew,SEEK_SET);
  80612a:	48 8b 85 bc fe ff ff 	mov    rax,QWORD PTR [rbp-0x144]
  806131:	48 89 c1             	mov    rcx,rax
  806134:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806137:	ba 00 00 00 00       	mov    edx,0x0
  80613c:	48 89 ce             	mov    rsi,rcx
  80613f:	89 c7                	mov    edi,eax
  806141:	e8 99 18 00 00       	call   8079df <sys_lseek>
    sys_read(exefno, &tnth, sizeof(tnth));
  806146:	48 8d 8d 70 fd ff ff 	lea    rcx,[rbp-0x290]
  80614d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806150:	ba 0c 01 00 00       	mov    edx,0x10c
  806155:	48 89 ce             	mov    rsi,rcx
  806158:	89 c7                	mov    edi,eax
  80615a:	e8 20 17 00 00       	call   80787f <sys_read>

    //是否需要移动base(先不检查)
    addr_t nbase=tnth.OptionalHeader.ImageBase;
  80615f:	48 8b 85 a4 fd ff ff 	mov    rax,QWORD PTR [rbp-0x25c]
  806166:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    int pgn=tnth.OptionalHeader.SizeOfImage/PAGE_SIZE;
  80616a:	8b 85 c4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x23c]
  806170:	c1 e8 0c             	shr    eax,0xc
  806173:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
//        break;
//    }

    //proc->tss.eip=tnth.OptionalHeader.AddressOfEntryPoint+nbase;
    //存放文件头
    sys_lseek(exefno,0,SEEK_SET);
  806176:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806179:	ba 00 00 00 00       	mov    edx,0x0
  80617e:	be 00 00 00 00       	mov    esi,0x0
  806183:	89 c7                	mov    edi,eax
  806185:	e8 55 18 00 00       	call   8079df <sys_lseek>
    sys_read(exefno, nbase, PAGE_SIZE);
  80618a:	48 8b 4d 90          	mov    rcx,QWORD PTR [rbp-0x70]
  80618e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806191:	ba 00 10 00 00       	mov    edx,0x1000
  806196:	48 89 ce             	mov    rsi,rcx
  806199:	89 c7                	mov    edi,eax
  80619b:	e8 df 16 00 00       	call   80787f <sys_read>
    //dos头
    PIMAGE_DOS_HEADER dosh=nbase;
  8061a0:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8061a4:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
    PIMAGE_NT_HEADERS64 nth=nbase+dosh->e_lfanew;
  8061a8:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8061ac:	48 8b 50 3c          	mov    rdx,QWORD PTR [rax+0x3c]
  8061b0:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8061b4:	48 01 d0             	add    rax,rdx
  8061b7:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    PIMAGE_FILE_HEADER fh=&nth->FileHeader;
  8061be:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8061c5:	48 83 c0 04          	add    rax,0x4
  8061c9:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    //为新进程分配内存页
    //计算所需的页
    int prog_size=nth->OptionalHeader.SizeOfImage;
  8061d0:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8061d7:	8b 40 50             	mov    eax,DWORD PTR [rax+0x50]
  8061da:	89 85 6c ff ff ff    	mov    DWORD PTR [rbp-0x94],eax
    int page_count=prog_size/4096;
  8061e0:	8b 85 6c ff ff ff    	mov    eax,DWORD PTR [rbp-0x94]
  8061e6:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8061ec:	85 c0                	test   eax,eax
  8061ee:	0f 48 c2             	cmovs  eax,edx
  8061f1:	c1 f8 0c             	sar    eax,0xc
  8061f4:	89 85 68 ff ff ff    	mov    DWORD PTR [rbp-0x98],eax

    addr_t shell_addr=nth->OptionalHeader.AddressOfEntryPoint+nbase;
  8061fa:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806201:	8b 40 28             	mov    eax,DWORD PTR [rax+0x28]
  806204:	89 c2                	mov    edx,eax
  806206:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80620a:	48 01 d0             	add    rax,rdx
  80620d:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
    int page_index_item_count=page_count/1024+page_count%1024==0?0:1;
  806214:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [rbp-0x98]
  80621a:	8d 90 ff 03 00 00    	lea    edx,[rax+0x3ff]
  806220:	85 c0                	test   eax,eax
  806222:	0f 48 c2             	cmovs  eax,edx
  806225:	c1 f8 0a             	sar    eax,0xa
  806228:	89 c1                	mov    ecx,eax
  80622a:	8b 85 68 ff ff ff    	mov    eax,DWORD PTR [rbp-0x98]
  806230:	99                   	cdq    
  806231:	c1 ea 16             	shr    edx,0x16
  806234:	01 d0                	add    eax,edx
  806236:	25 ff 03 00 00       	and    eax,0x3ff
  80623b:	29 d0                	sub    eax,edx
  80623d:	01 c8                	add    eax,ecx
  80623f:	85 c0                	test   eax,eax
  806241:	0f 95 c0             	setne  al
  806244:	0f b6 c0             	movzx  eax,al
  806247:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
    int start_pgind_item=shell_addr/PAGE_INDEX_SIZE;
  80624d:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  806254:	48 c1 e8 15          	shr    rax,0x15
  806258:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax

    //sys_read sections
    PIMAGE_SECTION_HEADER psec=(u32)nth+sizeof(IMAGE_NT_HEADERS32);
  80625e:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806265:	89 c0                	mov    eax,eax
  806267:	48 05 0c 01 00 00    	add    rax,0x10c
  80626d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
    nth->FileHeader.NumberOfSections*sizeof(IMAGE_SECTION_HEADER);
  806271:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806278:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  80627c:	0f b7 d0             	movzx  edx,ax
  80627f:	89 d0                	mov    eax,edx
  806281:	c1 e0 02             	shl    eax,0x2
  806284:	01 d0                	add    eax,edx
  806286:	c1 e0 03             	shl    eax,0x3
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
  806289:	05 50 01 00 00       	add    eax,0x150
  80628e:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
    int align=nth->OptionalHeader.FileAlignment;
  806294:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  80629b:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  80629e:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    data_start=data_start%align?data_start-data_start%align+align:data_start;
  8062a4:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  8062aa:	99                   	cdq    
  8062ab:	f7 bd 50 ff ff ff    	idiv   DWORD PTR [rbp-0xb0]
  8062b1:	89 d0                	mov    eax,edx
  8062b3:	85 c0                	test   eax,eax
  8062b5:	74 23                	je     8062da <load_pe+0x23f>
  8062b7:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  8062bd:	99                   	cdq    
  8062be:	f7 bd 50 ff ff ff    	idiv   DWORD PTR [rbp-0xb0]
  8062c4:	89 d1                	mov    ecx,edx
  8062c6:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  8062cc:	29 c8                	sub    eax,ecx
  8062ce:	89 c2                	mov    edx,eax
  8062d0:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  8062d6:	01 d0                	add    eax,edx
  8062d8:	eb 06                	jmp    8062e0 <load_pe+0x245>
  8062da:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  8062e0:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  8062e6:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8062ed:	eb 6b                	jmp    80635a <load_pe+0x2bf>
    {
        int disca=psec->Characteristics&IMAGE_SCN_MEM_DISCARDABLE;
  8062ef:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8062f3:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  8062f6:	25 00 00 00 02       	and    eax,0x2000000
  8062fb:	89 85 c4 fe ff ff    	mov    DWORD PTR [rbp-0x13c],eax
        if(disca)
  806301:	83 bd c4 fe ff ff 00 	cmp    DWORD PTR [rbp-0x13c],0x0
  806308:	75 46                	jne    806350 <load_pe+0x2b5>
            continue;
        //直接读，缺页内核解决
        sys_lseek(exefno,psec->PointerToRawData,SEEK_SET);
  80630a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80630e:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  806311:	89 c1                	mov    ecx,eax
  806313:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806316:	ba 00 00 00 00       	mov    edx,0x0
  80631b:	48 89 ce             	mov    rsi,rcx
  80631e:	89 c7                	mov    edi,eax
  806320:	e8 ba 16 00 00       	call   8079df <sys_lseek>
        sys_read(exefno, psec->VirtualAddress + nbase,  psec->SizeOfRawData);
  806325:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806329:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80632c:	89 c2                	mov    edx,eax
  80632e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806332:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  806335:	89 c1                	mov    ecx,eax
  806337:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80633b:	48 01 c8             	add    rax,rcx
  80633e:	48 89 c1             	mov    rcx,rax
  806341:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806344:	48 89 ce             	mov    rsi,rcx
  806347:	89 c7                	mov    edi,eax
  806349:	e8 31 15 00 00       	call   80787f <sys_read>
  80634e:	eb 01                	jmp    806351 <load_pe+0x2b6>
            continue;
  806350:	90                   	nop
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  806351:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  806355:	48 83 45 f0 28       	add    QWORD PTR [rbp-0x10],0x28
  80635a:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806361:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  806365:	0f b7 c0             	movzx  eax,ax
  806368:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80636b:	7c 82                	jl     8062ef <load_pe+0x254>

    }

    //通过导入表加载需要的dll
    PIMAGE_DATA_DIRECTORY impd=&nth->OptionalHeader.DataDirectory[1];
  80636d:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806374:	48 05 90 00 00 00    	add    rax,0x90
  80637a:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    if(impd->Size>0)
  806381:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  806388:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80638b:	85 c0                	test   eax,eax
  80638d:	0f 84 7b 02 00 00    	je     80660e <load_pe+0x573>
    {
        int tmpi=impd->VirtualAddress+nbase;
  806393:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80639a:	8b 10                	mov    edx,DWORD PTR [rax]
  80639c:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8063a0:	01 d0                	add    eax,edx
  8063a2:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
        PIMAGE_IMPORT_DESCRIPTOR impdes=tmpi;
  8063a8:	8b 85 44 ff ff ff    	mov    eax,DWORD PTR [rbp-0xbc]
  8063ae:	48 98                	cdqe   
  8063b0:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        int dllp;
        while (impdes->Characteristics)
  8063b4:	e9 47 02 00 00       	jmp    806600 <load_pe+0x565>
        {
            //加载dll
            char *dllname=impdes->Name+nbase;
  8063b9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8063bd:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  8063c0:	89 c2                	mov    edx,eax
  8063c2:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8063c6:	48 01 d0             	add    rax,rdx
  8063c9:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
            //此处应有加载dll代码
            int dlli;
            if(strcmp(dllname,"sys.dll")==0)//加载系统dll的部分由内核已经完成
  8063d0:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
  8063d7:	be 05 40 81 00       	mov    esi,0x814005
  8063dc:	48 89 c7             	mov    rdi,rax
  8063df:	e8 ff 57 00 00       	call   80bbe3 <strcmp>
  8063e4:	85 c0                	test   eax,eax
  8063e6:	75 09                	jne    8063f1 <load_pe+0x356>
            {
                dllp=0x1c00000;
  8063e8:	c7 45 dc 00 00 c0 01 	mov    DWORD PTR [rbp-0x24],0x1c00000
  8063ef:	eb 25                	jmp    806416 <load_pe+0x37b>
            }else{
                //load_pe要记录module的加载
                dlli= load_pe(proc);
  8063f1:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  8063f8:	48 89 c7             	mov    rdi,rax
  8063fb:	e8 9b fc ff ff       	call   80609b <load_pe>
  806400:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
                //dlli=load_library(dllname);
                //这个是线性地址
                dllp=get_module_addr(dlli);
  806406:	8b 85 34 ff ff ff    	mov    eax,DWORD PTR [rbp-0xcc]
  80640c:	89 c7                	mov    edi,eax
  80640e:	e8 f1 03 00 00       	call   806804 <get_module_addr>
  806413:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            }
            //从线性地址查页表找到物理地址
            PIMAGE_DOS_HEADER dlldos=dllp;
  806416:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806419:	48 98                	cdqe   
  80641b:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
            PIMAGE_NT_HEADERS32 dllnth=dllp+dlldos->e_lfanew;
  806422:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806425:	48 63 d0             	movsxd rdx,eax
  806428:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  80642f:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  806433:	48 01 d0             	add    rax,rdx
  806436:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
            PIMAGE_EXPORT_DIRECTORY dllexp=(dllnth->OptionalHeader.DataDirectory[0].VirtualAddress+dllp);
  80643d:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  806444:	8b 90 8c 00 00 00    	mov    edx,DWORD PTR [rax+0x8c]
  80644a:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80644d:	01 d0                	add    eax,edx
  80644f:	89 c0                	mov    eax,eax
  806451:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
            int funcn=dllexp->NumberOfNames;
  806458:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80645f:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  806462:	89 85 14 ff ff ff    	mov    DWORD PTR [rbp-0xec],eax
            char **fnames=dllexp->AddressOfNames+dllp;
  806468:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80646f:	8b 50 20             	mov    edx,DWORD PTR [rax+0x20]
  806472:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806475:	01 d0                	add    eax,edx
  806477:	89 c0                	mov    eax,eax
  806479:	48 89 85 08 ff ff ff 	mov    QWORD PTR [rbp-0xf8],rax
            int *funcaddrs=dllexp->AddressOfFunctions+dllp;
  806480:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  806487:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  80648a:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80648d:	01 d0                	add    eax,edx
  80648f:	89 c0                	mov    eax,eax
  806491:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
            short *funcords=dllexp->AddressOfNameOrdinals+dllp;
  806498:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80649f:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  8064a2:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8064a5:	01 d0                	add    eax,edx
  8064a7:	89 c0                	mov    eax,eax
  8064a9:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
            //寻找nameordinal的base（最小值），里面的数据加上base才是真正的序号
            unsigned int ord_base=dllexp->Base;
  8064b0:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8064b7:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8064ba:	89 85 f4 fe ff ff    	mov    DWORD PTR [rbp-0x10c],eax
            //开始将导入表IAT的内容更新为函数地址
            unsigned int *iataddrs=impdes->FirstThunk+nbase;//IAT和INT内容一样，只用IAT
  8064c0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8064c4:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8064c7:	89 c2                	mov    edx,eax
  8064c9:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8064cd:	48 01 d0             	add    rax,rdx
  8064d0:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            char **siataddrs=impdes->FirstThunk+nbase;
  8064d4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8064d8:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8064db:	89 c2                	mov    edx,eax
  8064dd:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8064e1:	48 01 d0             	add    rax,rdx
  8064e4:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            while (*iataddrs)
  8064e8:	e9 00 01 00 00       	jmp    8065ed <load_pe+0x552>
            {
                //判断是序号导入还是名称导入
                if(((unsigned)*iataddrs)&0x80000000)
  8064ed:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8064f1:	8b 00                	mov    eax,DWORD PTR [rax]
  8064f3:	85 c0                	test   eax,eax
  8064f5:	79 43                	jns    80653a <load_pe+0x49f>
                {
                    //序号导入
                    unsigned int ord=((*iataddrs)&0x7fffffff)-ord_base;
  8064f7:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8064fb:	8b 00                	mov    eax,DWORD PTR [rax]
  8064fd:	25 ff ff ff 7f       	and    eax,0x7fffffff
  806502:	2b 85 f4 fe ff ff    	sub    eax,DWORD PTR [rbp-0x10c]
  806508:	89 85 e0 fe ff ff    	mov    DWORD PTR [rbp-0x120],eax
                    *iataddrs=funcaddrs[ord]+dllp;
  80650e:	8b 85 e0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x120]
  806514:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  80651b:	00 
  80651c:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  806523:	48 01 d0             	add    rax,rdx
  806526:	8b 10                	mov    edx,DWORD PTR [rax]
  806528:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80652b:	01 d0                	add    eax,edx
  80652d:	89 c2                	mov    edx,eax
  80652f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806533:	89 10                	mov    DWORD PTR [rax],edx
  806535:	e9 a9 00 00 00       	jmp    8065e3 <load_pe+0x548>
                }else
                {
                    //名称导入
                    char *import_by_name_p=*iataddrs;//指向IMPORT_BY_NAME
  80653a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80653e:	8b 00                	mov    eax,DWORD PTR [rax]
  806540:	89 c0                	mov    eax,eax
  806542:	48 89 85 e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],rax
                    import_by_name_p+=2;//跳过开头两字节序号
  806549:	48 83 85 e8 fe ff ff 	add    QWORD PTR [rbp-0x118],0x2
  806550:	02 
                    int i=0;
  806551:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
                    for(;i<funcn;i++)
  806558:	eb 7a                	jmp    8065d4 <load_pe+0x539>
                    {
                        if(strcmp(import_by_name_p,fnames[i])==0)
  80655a:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80655d:	48 98                	cdqe   
  80655f:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  806566:	00 
  806567:	48 8b 85 08 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf8]
  80656e:	48 01 d0             	add    rax,rdx
  806571:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  806574:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
  80657b:	48 89 d6             	mov    rsi,rdx
  80657e:	48 89 c7             	mov    rdi,rax
  806581:	e8 5d 56 00 00       	call   80bbe3 <strcmp>
  806586:	85 c0                	test   eax,eax
  806588:	75 46                	jne    8065d0 <load_pe+0x535>
                        {
                            int ordi=funcords[i];
  80658a:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80658d:	48 98                	cdqe   
  80658f:	48 8d 14 00          	lea    rdx,[rax+rax*1]
  806593:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80659a:	48 01 d0             	add    rax,rdx
  80659d:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8065a0:	98                   	cwde   
  8065a1:	89 85 e4 fe ff ff    	mov    DWORD PTR [rbp-0x11c],eax
                            *iataddrs=funcaddrs[ordi]+dllp;//导入表中的IAT内容修改成地址
  8065a7:	8b 85 e4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x11c]
  8065ad:	48 98                	cdqe   
  8065af:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8065b6:	00 
  8065b7:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  8065be:	48 01 d0             	add    rax,rdx
  8065c1:	8b 10                	mov    edx,DWORD PTR [rax]
  8065c3:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8065c6:	01 d0                	add    eax,edx
  8065c8:	89 c2                	mov    edx,eax
  8065ca:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8065ce:	89 10                	mov    DWORD PTR [rax],edx
                    for(;i<funcn;i++)
  8065d0:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
  8065d4:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8065d7:	3b 85 14 ff ff ff    	cmp    eax,DWORD PTR [rbp-0xec]
  8065dd:	0f 8c 77 ff ff ff    	jl     80655a <load_pe+0x4bf>
                        }
                    }
                }
                iataddrs++;
  8065e3:	48 83 45 d0 04       	add    QWORD PTR [rbp-0x30],0x4
                siataddrs++;
  8065e8:	48 83 45 c8 08       	add    QWORD PTR [rbp-0x38],0x8
            while (*iataddrs)
  8065ed:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8065f1:	8b 00                	mov    eax,DWORD PTR [rax]
  8065f3:	85 c0                	test   eax,eax
  8065f5:	0f 85 f2 fe ff ff    	jne    8064ed <load_pe+0x452>
            }
            impdes++;
  8065fb:	48 83 45 e0 14       	add    QWORD PTR [rbp-0x20],0x14
        while (impdes->Characteristics)
  806600:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806604:	8b 00                	mov    eax,DWORD PTR [rax]
  806606:	85 c0                	test   eax,eax
  806608:	0f 85 ab fd ff ff    	jne    8063b9 <load_pe+0x31e>
        }
    }


    //开始重定位
    PIMAGE_BASE_RELOCATION relp=0;
  80660e:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  806615:	00 
    if(nth->OptionalHeader.DataDirectory[5].Size>0)
  806616:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  80661d:	8b 80 b4 00 00 00    	mov    eax,DWORD PTR [rax+0xb4]
  806623:	85 c0                	test   eax,eax
  806625:	0f 84 ec 00 00 00    	je     806717 <load_pe+0x67c>
    {
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  80662b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806632:	8b 90 b0 00 00 00    	mov    edx,DWORD PTR [rax+0xb0]
                                +(u32)nbase);
  806638:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  80663c:	01 d0                	add    eax,edx
  80663e:	89 c0                	mov    eax,eax
  806640:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        u16 *reloc=relp+sizeof(IMAGE_BASE_RELOCATION);
  806644:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806648:	48 83 c0 40          	add    rax,0x40
  80664c:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        u16 *rtype=reloc+1;
  806650:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  806654:	48 83 c0 02          	add    rax,0x2
  806658:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
        int old_base=nth->OptionalHeader.ImageBase;
  80665c:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  806663:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806667:	89 85 dc fe ff ff    	mov    DWORD PTR [rbp-0x124],eax
        while(relp->VirtualAddress){
  80666d:	e9 97 00 00 00       	jmp    806709 <load_pe+0x66e>
            int pgva=relp->VirtualAddress+nbase;
  806672:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806676:	8b 10                	mov    edx,DWORD PTR [rax]
  806678:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80667c:	01 d0                	add    eax,edx
  80667e:	89 85 d8 fe ff ff    	mov    DWORD PTR [rbp-0x128],eax
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  806684:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
  80668b:	eb 5a                	jmp    8066e7 <load_pe+0x64c>
            {
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  80668d:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  806691:	0f b7 00             	movzx  eax,WORD PTR [rax]
  806694:	66 85 c0             	test   ax,ax
  806697:	74 49                	je     8066e2 <load_pe+0x647>
                int *at=*reloc+pgva;//要重定位的数据的地址
  806699:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80669d:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8066a0:	0f b7 d0             	movzx  edx,ax
  8066a3:	8b 85 d8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x128]
  8066a9:	01 d0                	add    eax,edx
  8066ab:	48 98                	cdqe   
  8066ad:	48 89 85 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],rax
                *at=*at-old_base+nbase;
  8066b4:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
  8066bb:	8b 00                	mov    eax,DWORD PTR [rax]
  8066bd:	2b 85 dc fe ff ff    	sub    eax,DWORD PTR [rbp-0x124]
  8066c3:	89 c2                	mov    edx,eax
  8066c5:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8066c9:	01 d0                	add    eax,edx
  8066cb:	89 c2                	mov    edx,eax
  8066cd:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
  8066d4:	89 10                	mov    DWORD PTR [rax],edx
                //下一个
                reloc+=2;
  8066d6:	48 83 45 b0 04       	add    QWORD PTR [rbp-0x50],0x4
                rtype+=2;
  8066db:	48 83 45 a8 04       	add    QWORD PTR [rbp-0x58],0x4
  8066e0:	eb 01                	jmp    8066e3 <load_pe+0x648>
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  8066e2:	90                   	nop
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  8066e3:	83 45 a4 01          	add    DWORD PTR [rbp-0x5c],0x1
  8066e7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8066eb:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8066ee:	c1 e8 02             	shr    eax,0x2
  8066f1:	89 c2                	mov    edx,eax
  8066f3:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  8066f6:	39 c2                	cmp    edx,eax
  8066f8:	77 93                	ja     80668d <load_pe+0x5f2>
            }
            relp=(int)relp+0x1000;
  8066fa:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8066fe:	05 00 10 00 00       	add    eax,0x1000
  806703:	48 98                	cdqe   
  806705:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        while(relp->VirtualAddress){
  806709:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80670d:	8b 00                	mov    eax,DWORD PTR [rax]
  80670f:	85 c0                	test   eax,eax
  806711:	0f 85 5b ff ff ff    	jne    806672 <load_pe+0x5d7>
        }
    }
    extern struct process task[];
    extern int cur_proc;
    //初始化堆
    chunk_header hdrtmp={
  806717:	c7 85 50 fd ff ff 00 	mov    DWORD PTR [rbp-0x2b0],0x0
  80671e:	00 00 00 
  806721:	c7 85 54 fd ff ff 00 	mov    DWORD PTR [rbp-0x2ac],0x0
  806728:	00 00 00 
  80672b:	48 c7 85 58 fd ff ff 	mov    QWORD PTR [rbp-0x2a8],0x0
  806732:	00 00 00 00 
  806736:	48 c7 85 60 fd ff ff 	mov    QWORD PTR [rbp-0x2a0],0x0
  80673d:	00 00 00 00 
            .next=NULL,
            .pgn=0,
            .prev=NULL
    };//空堆
    //拷贝触发页中断然后分配
    memcpy((chunk_header*)HEAP_BASE,&hdrtmp,sizeof(hdrtmp));
  806741:	48 8d 85 50 fd ff ff 	lea    rax,[rbp-0x2b0]
  806748:	ba 18 00 00 00       	mov    edx,0x18
  80674d:	48 89 c6             	mov    rsi,rax
  806750:	bf 00 00 00 01       	mov    edi,0x1000000
  806755:	e8 eb 51 00 00       	call   80b945 <memcpy>
    task[cur_proc].mem_struct.heap_base=HEAP_BASE;
  80675a:	8b 05 cc ee c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0eecc]        # 41562c <cur_proc>
  806760:	48 98                	cdqe   
  806762:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  806769:	48 05 c0 84 40 00    	add    rax,0x4084c0
  80676f:	c7 40 08 00 00 00 01 	mov    DWORD PTR [rax+0x8],0x1000000
    task[cur_proc].mem_struct.heap_top=HEAP_BASE+CHUNK_SIZE;
  806776:	8b 05 b0 ee c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0eeb0]        # 41562c <cur_proc>
  80677c:	48 98                	cdqe   
  80677e:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  806785:	48 05 c0 84 40 00    	add    rax,0x4084c0
  80678b:	c7 40 0c 00 10 00 01 	mov    DWORD PTR [rax+0xc],0x1001000
    //设置栈
    task[cur_proc].mem_struct.stack_top=STACK_TOP;
  806792:	8b 05 94 ee c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ee94]        # 41562c <cur_proc>
  806798:	48 98                	cdqe   
  80679a:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8067a1:	48 05 c0 84 40 00    	add    rax,0x4084c0
  8067a7:	c7 40 14 00 f0 ff ff 	mov    DWORD PTR [rax+0x14],0xfffff000


    //完毕,调用入口函数
    //重定位完毕，准备调用DllMain
    typedef int (*Main)(int,void*);
    Main main=shell_addr;
  8067ae:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  8067b5:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
    task[cur_proc].exit_code=main(0,NULL);
  8067bc:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  8067c3:	be 00 00 00 00       	mov    esi,0x0
  8067c8:	bf 00 00 00 00       	mov    edi,0x0
  8067cd:	ff d0                	call   rax
  8067cf:	8b 15 57 ee c0 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc0ee57]        # 41562c <cur_proc>
  8067d5:	89 c1                	mov    ecx,eax
  8067d7:	48 63 c2             	movsxd rax,edx
  8067da:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8067e1:	48 05 c0 84 40 00    	add    rax,0x4084c0
  8067e7:	89 48 04             	mov    DWORD PTR [rax+0x4],ecx
    return task[cur_proc].exit_code;
  8067ea:	8b 05 3c ee c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ee3c]        # 41562c <cur_proc>
  8067f0:	48 98                	cdqe   
  8067f2:	48 69 c0 1c 03 00 00 	imul   rax,rax,0x31c
  8067f9:	48 05 c0 84 40 00    	add    rax,0x4084c0
  8067ff:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
}
  806802:	c9                   	leave  
  806803:	c3                   	ret    

0000000000806804 <get_module_addr>:

int get_module_addr(int mi)
{
  806804:	f3 0f 1e fa          	endbr64 
  806808:	55                   	push   rbp
  806809:	48 89 e5             	mov    rbp,rsp
  80680c:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return modules[mi].base;
  80680f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806812:	48 98                	cdqe   
  806814:	8b 04 c5 40 82 42 00 	mov    eax,DWORD PTR [rax*8+0x428240]
}
  80681b:	5d                   	pop    rbp
  80681c:	c3                   	ret    

000000000080681d <dispose_library>:
int dispose_library(int dlln)
{
  80681d:	f3 0f 1e fa          	endbr64 
  806821:	55                   	push   rbp
  806822:	48 89 e5             	mov    rbp,rsp
  806825:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if(dlln<0||dlln>=MAX_DLLS)return -1;
  806828:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80682c:	78 09                	js     806837 <dispose_library+0x1a>
  80682e:	81 7d fc ff 00 00 00 	cmp    DWORD PTR [rbp-0x4],0xff
  806835:	7e 07                	jle    80683e <dispose_library+0x21>
  806837:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80683c:	eb 1d                	jmp    80685b <dispose_library+0x3e>
    //空间不够，释放之前申请的
    // for(int j=0;j<dlls[dlln].page_used;j++)
    //     dispose_page(get_phyaddr(dlls[dlln].page_num[j]));
    //释放dll
    dlls[dlln].flag=DLL_STAT_EMPTY;
  80683e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806841:	48 98                	cdqe   
  806843:	48 69 c0 2c 01 00 00 	imul   rax,rax,0x12c
  80684a:	48 05 48 56 41 00    	add    rax,0x415648
  806850:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return 0;
  806856:	b8 00 00 00 00       	mov    eax,0x0
}
  80685b:	5d                   	pop    rbp
  80685c:	c3                   	ret    

000000000080685d <sys_insmod>:

    return 0;
} */

int sys_insmod(char *path)
{
  80685d:	f3 0f 1e fa          	endbr64 
  806861:	55                   	push   rbp
  806862:	48 89 e5             	mov    rbp,rsp
  806865:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  806869:	90                   	nop
  80686a:	5d                   	pop    rbp
  80686b:	c3                   	ret    

000000000080686c <sys_rmmod>:
int sys_rmmod(char *name)
{
  80686c:	f3 0f 1e fa          	endbr64 
  806870:	55                   	push   rbp
  806871:	48 89 e5             	mov    rbp,rsp
  806874:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

  806878:	90                   	nop
  806879:	5d                   	pop    rbp
  80687a:	c3                   	ret    
  80687b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000806880 <_syscall>:
  806880:	55                   	push   rbp
  806881:	bd 00 80 10 00       	mov    ebp,0x108000
  806886:	48 89 65 14          	mov    QWORD PTR [rbp+0x14],rsp
  80688a:	48 8b 65 04          	mov    rsp,QWORD PTR [rbp+0x4]
  80688e:	50                   	push   rax
  80688f:	53                   	push   rbx
  806890:	51                   	push   rcx
  806891:	52                   	push   rdx
  806892:	57                   	push   rdi
  806893:	56                   	push   rsi
  806894:	41 50                	push   r8
  806896:	41 51                	push   r9
  806898:	41 52                	push   r10
  80689a:	41 53                	push   r11
  80689c:	41 54                	push   r12
  80689e:	41 55                	push   r13
  8068a0:	41 56                	push   r14
  8068a2:	41 57                	push   r15
  8068a4:	66 8c c0             	mov    ax,es
  8068a7:	50                   	push   rax
  8068a8:	66 8c d8             	mov    ax,ds
  8068ab:	50                   	push   rax
  8068ac:	66 b8 10 00          	mov    ax,0x10
  8068b0:	8e c0                	mov    es,eax
  8068b2:	8e d8                	mov    ds,eax
  8068b4:	48 8b 44 24 78       	mov    rax,QWORD PTR [rsp+0x78]
  8068b9:	41 53                	push   r11
  8068bb:	51                   	push   rcx
  8068bc:	49 87 ca             	xchg   r10,rcx
  8068bf:	e8 d6 9c ff ff       	call   80059a <syscall>
  8068c4:	4c 87 d1             	xchg   rcx,r10
  8068c7:	59                   	pop    rcx
  8068c8:	41 5b                	pop    r11
  8068ca:	48 89 44 24 78       	mov    QWORD PTR [rsp+0x78],rax
  8068cf:	58                   	pop    rax
  8068d0:	8e d8                	mov    ds,eax
  8068d2:	58                   	pop    rax
  8068d3:	8e c0                	mov    es,eax
  8068d5:	41 5f                	pop    r15
  8068d7:	41 5e                	pop    r14
  8068d9:	41 5d                	pop    r13
  8068db:	41 5c                	pop    r12
  8068dd:	41 5b                	pop    r11
  8068df:	41 5a                	pop    r10
  8068e1:	41 59                	pop    r9
  8068e3:	41 58                	pop    r8
  8068e5:	5e                   	pop    rsi
  8068e6:	5f                   	pop    rdi
  8068e7:	5a                   	pop    rdx
  8068e8:	59                   	pop    rcx
  8068e9:	5b                   	pop    rbx
  8068ea:	58                   	pop    rax
  8068eb:	48 89 65 04          	mov    QWORD PTR [rbp+0x4],rsp
  8068ef:	48 8b 65 14          	mov    rsp,QWORD PTR [rbp+0x14]
  8068f3:	5d                   	pop    rbp
  8068f4:	fb                   	sti    
  8068f5:	48 0f 07             	sysretq 

00000000008068f8 <init_framebuffer>:
static u32 font_width_bytes;
static u8 *glyph_table;
static u32 bytes_per_glyph, glyph_nr;
int font_size=1;
void init_framebuffer()
{
  8068f8:	f3 0f 1e fa          	endbr64 
  8068fc:	55                   	push   rbp
  8068fd:	48 89 e5             	mov    rbp,rsp
  806900:	48 83 ec 50          	sub    rsp,0x50
    //映射页帧内存
    size_t w=framebuffer.common.framebuffer_width;
  806904:	8b 05 4a 1d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21d4a]        # 428654 <framebuffer+0x14>
  80690a:	89 c0                	mov    eax,eax
  80690c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    size_t h=framebuffer.common.framebuffer_height;
  806910:	8b 05 42 1d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21d42]        # 428658 <framebuffer+0x18>
  806916:	89 c0                	mov    eax,eax
  806918:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    size_t bypp=framebuffer.common.framebuffer_bpp/8;
  80691c:	0f b6 05 39 1d c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21d39]        # 42865c <framebuffer+0x1c>
  806923:	c0 e8 03             	shr    al,0x3
  806926:	0f b6 c0             	movzx  eax,al
  806929:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    size_t inter=framebuffer.common.framebuffer_pitch;
  80692d:	8b 05 1d 1d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21d1d]        # 428650 <framebuffer+0x10>
  806933:	89 c0                	mov    eax,eax
  806935:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    size_t pc=w*h;
  806939:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80693d:	48 0f af 45 d8       	imul   rax,QWORD PTR [rbp-0x28]
  806942:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    size_t size=h*inter;
  806946:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80694a:	48 0f af 45 c8       	imul   rax,QWORD PTR [rbp-0x38]
  80694f:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    int pgc=size/PAGE_SIZE;
  806953:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806957:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  80695e:	48 85 c0             	test   rax,rax
  806961:	48 0f 48 c2          	cmovs  rax,rdx
  806965:	48 c1 f8 0c          	sar    rax,0xc
  806969:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    addr_t p=FRAMEBUFFER_ADDR;
  80696c:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x40000000
  806973:	40 
    addr_t pp=framebuffer.common.framebuffer_addr;
  806974:	48 8b 05 cd 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21ccd]        # 428648 <framebuffer+0x8>
  80697b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for (size_t i = 0; i < pgc; i++)
  80697f:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  806986:	00 
  806987:	eb 2d                	jmp    8069b6 <init_framebuffer+0xbe>
    {
        mmap(pp,p,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  806989:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  80698d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806991:	ba 07 00 00 00       	mov    edx,0x7
  806996:	48 89 ce             	mov    rsi,rcx
  806999:	48 89 c7             	mov    rdi,rax
  80699c:	e8 53 a5 ff ff       	call   800ef4 <mmap>
        pp+=PAGE_SIZE;
  8069a1:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  8069a8:	00 
        p+=PAGE_SIZE;
  8069a9:	48 81 45 f8 00 10 00 	add    QWORD PTR [rbp-0x8],0x1000
  8069b0:	00 
    for (size_t i = 0; i < pgc; i++)
  8069b1:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  8069b6:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8069b9:	48 98                	cdqe   
  8069bb:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  8069bf:	7c c8                	jl     806989 <init_framebuffer+0x91>
    }
    
    
}
  8069c1:	90                   	nop
  8069c2:	90                   	nop
  8069c3:	c9                   	leave  
  8069c4:	c3                   	ret    

00000000008069c5 <init_font>:
void init_font(){
  8069c5:	f3 0f 1e fa          	endbr64 
  8069c9:	55                   	push   rbp
  8069ca:	48 89 e5             	mov    rbp,rsp
    boot_font = (struct psf2_header*) _binary_res_font_psf_start;
  8069cd:	48 c7 05 a8 1c c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21ca8],0x80c6a8        # 428680 <boot_font>
  8069d4:	a8 c6 80 00 

    font_width_bytes = (boot_font->width + 7) / 8;
  8069d8:	48 8b 05 a1 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21ca1]        # 428680 <boot_font>
  8069df:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  8069e2:	83 c0 07             	add    eax,0x7
  8069e5:	c1 e8 03             	shr    eax,0x3
  8069e8:	89 05 a2 1c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21ca2],eax        # 428690 <font_width_bytes>
    font_width = font_width_bytes * 8;
  8069ee:	8b 05 9c 1c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21c9c]        # 428690 <font_width_bytes>
  8069f4:	c1 e0 03             	shl    eax,0x3
  8069f7:	89 05 8b 1c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21c8b],eax        # 428688 <font_width>
    font_height = boot_font->height;
  8069fd:	48 8b 05 7c 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21c7c]        # 428680 <boot_font>
  806a04:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  806a07:	89 05 7f 1c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21c7f],eax        # 42868c <font_height>

    glyph_table = (u8*)_binary_res_font_psf_start+boot_font->header_size;
  806a0d:	48 8b 05 6c 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21c6c]        # 428680 <boot_font>
  806a14:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  806a17:	89 c0                	mov    eax,eax
  806a19:	48 05 a8 c6 80 00    	add    rax,0x80c6a8
  806a1f:	48 89 05 72 1c c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21c72],rax        # 428698 <glyph_table>
    glyph_nr = boot_font->glyph_nr;
  806a26:	48 8b 05 53 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21c53]        # 428680 <boot_font>
  806a2d:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  806a30:	89 05 6e 1c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21c6e],eax        # 4286a4 <glyph_nr>
    bytes_per_glyph = boot_font->bytes_per_glyph;
  806a36:	48 8b 05 43 1c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21c43]        # 428680 <boot_font>
  806a3d:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  806a40:	89 05 5a 1c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21c5a],eax        # 4286a0 <bytes_per_glyph>

    fb_cursor_x = fb_cursor_y = 0;
  806a46:	c7 05 20 1c c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc21c20],0x0        # 428670 <fb_cursor_y>
  806a4d:	00 00 00 
  806a50:	8b 05 1a 1c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21c1a]        # 428670 <fb_cursor_y>
  806a56:	89 05 10 1c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21c10],eax        # 42866c <fb_cursor_x>
    max_ch_nr_x = framebuffer.common.framebuffer_width / font_width;
  806a5c:	8b 05 f2 1b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21bf2]        # 428654 <framebuffer+0x14>
  806a62:	8b 0d 20 1c c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc21c20]        # 428688 <font_width>
  806a68:	ba 00 00 00 00       	mov    edx,0x0
  806a6d:	f7 f1                	div    ecx
  806a6f:	89 05 ff 1b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21bff],eax        # 428674 <max_ch_nr_x>
    max_ch_nr_y = framebuffer.common.framebuffer_height / font_height;
  806a75:	8b 05 dd 1b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21bdd]        # 428658 <framebuffer+0x18>
  806a7b:	8b 35 0b 1c c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc21c0b]        # 42868c <font_height>
  806a81:	ba 00 00 00 00       	mov    edx,0x0
  806a86:	f7 f6                	div    esi
  806a88:	89 05 ea 1b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21bea],eax        # 428678 <max_ch_nr_y>
    font_size=1;
  806a8e:	c7 05 e8 58 00 00 01 	mov    DWORD PTR [rip+0x58e8],0x1        # 80c380 <font_size>
  806a95:	00 00 00 
}
  806a98:	90                   	nop
  806a99:	5d                   	pop    rbp
  806a9a:	c3                   	ret    

0000000000806a9b <set_framebuffer>:
void set_framebuffer(struct multiboot_tag_framebuffer tag)
{
  806a9b:	f3 0f 1e fa          	endbr64 
  806a9f:	55                   	push   rbp
  806aa0:	48 89 e5             	mov    rbp,rsp
    framebuffer=tag;
  806aa3:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  806aa7:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  806aab:	48 89 05 8e 1b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21b8e],rax        # 428640 <framebuffer>
  806ab2:	48 89 15 8f 1b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21b8f],rdx        # 428648 <framebuffer+0x8>
  806ab9:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
  806abd:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  806ac1:	48 89 05 88 1b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21b88],rax        # 428650 <framebuffer+0x10>
  806ac8:	48 89 15 89 1b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21b89],rdx        # 428658 <framebuffer+0x18>
  806acf:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
  806ad3:	48 89 05 86 1b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21b86],rax        # 428660 <framebuffer+0x20>
}
  806ada:	90                   	nop
  806adb:	5d                   	pop    rbp
  806adc:	c3                   	ret    

0000000000806add <fill_rect>:

void fill_rect(int x,int y,int w,int h,unsigned int color){
  806add:	f3 0f 1e fa          	endbr64 
  806ae1:	55                   	push   rbp
  806ae2:	48 89 e5             	mov    rbp,rsp
  806ae5:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  806ae8:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  806aeb:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  806aee:	89 4d d0             	mov    DWORD PTR [rbp-0x30],ecx
  806af1:	44 89 45 cc          	mov    DWORD PTR [rbp-0x34],r8d
    unsigned int* fb= (unsigned int*) FRAMEBUFFER_ADDR;
  806af5:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x40000000
  806afc:	40 
    //目前只写32bpp
    for(int py=x;py<h+x;py++){
  806afd:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806b00:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  806b03:	eb 64                	jmp    806b69 <fill_rect+0x8c>
        for(int px=y;px<w+y;px++){
  806b05:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  806b08:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  806b0b:	eb 4b                	jmp    806b58 <fill_rect+0x7b>
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  806b0d:	8b 15 3d 1b c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21b3d]        # 428650 <framebuffer+0x10>
  806b13:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806b16:	0f af c2             	imul   eax,edx
  806b19:	89 c1                	mov    ecx,eax
                       +px*framebuffer.common.framebuffer_bpp/8;
  806b1b:	0f b6 05 3a 1b c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21b3a]        # 42865c <framebuffer+0x1c>
  806b22:	0f b6 c0             	movzx  eax,al
  806b25:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  806b29:	8d 50 07             	lea    edx,[rax+0x7]
  806b2c:	85 c0                	test   eax,eax
  806b2e:	0f 48 c2             	cmovs  eax,edx
  806b31:	c1 f8 03             	sar    eax,0x3
  806b34:	48 98                	cdqe   
  806b36:	48 01 c8             	add    rax,rcx
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  806b39:	48 05 00 00 00 40    	add    rax,0x40000000
  806b3f:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
            fb=(unsigned int*)ptr;
  806b43:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806b47:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *fb=color;
  806b4b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806b4f:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  806b52:	89 10                	mov    DWORD PTR [rax],edx
        for(int px=y;px<w+y;px++){
  806b54:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806b58:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  806b5b:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  806b5e:	01 d0                	add    eax,edx
  806b60:	39 45 f8             	cmp    DWORD PTR [rbp-0x8],eax
  806b63:	7c a8                	jl     806b0d <fill_rect+0x30>
    for(int py=x;py<h+x;py++){
  806b65:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806b69:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
  806b6c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  806b6f:	01 d0                	add    eax,edx
  806b71:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  806b74:	7c 8f                	jl     806b05 <fill_rect+0x28>
        }
    }
}
  806b76:	90                   	nop
  806b77:	90                   	nop
  806b78:	5d                   	pop    rbp
  806b79:	c3                   	ret    

0000000000806b7a <draw_text>:
unsigned char letters[];
void draw_text(int x, int y, int size, char *str)
{
  806b7a:	f3 0f 1e fa          	endbr64 
  806b7e:	55                   	push   rbp
  806b7f:	48 89 e5             	mov    rbp,rsp
  806b82:	48 83 ec 30          	sub    rsp,0x30
  806b86:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806b89:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806b8c:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  806b8f:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    int tx=x;
  806b93:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806b96:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    while(*str!='\0')
  806b99:	eb 5a                	jmp    806bf5 <draw_text+0x7b>
    {
        if(*str=='\n')
  806b9b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806b9f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806ba2:	3c 0a                	cmp    al,0xa
  806ba4:	75 1c                	jne    806bc2 <draw_text+0x48>
        {
            y+=font_height*size;
  806ba6:	8b 15 e0 1a c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21ae0]        # 42868c <font_height>
  806bac:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806baf:	0f af d0             	imul   edx,eax
  806bb2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806bb5:	01 d0                	add    eax,edx
  806bb7:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            tx=x;
  806bba:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806bbd:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  806bc0:	eb 2e                	jmp    806bf0 <draw_text+0x76>
        }
        else
        {
            draw_letter(tx,y,size,*str);
  806bc2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806bc6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806bc9:	0f be c8             	movsx  ecx,al
  806bcc:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  806bcf:	8b 75 e8             	mov    esi,DWORD PTR [rbp-0x18]
  806bd2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806bd5:	89 c7                	mov    edi,eax
  806bd7:	e8 28 00 00 00       	call   806c04 <draw_letter>
            tx+=size*font_width;
  806bdc:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  806bdf:	8b 05 a3 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21aa3]        # 428688 <font_width>
  806be5:	0f af d0             	imul   edx,eax
  806be8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806beb:	01 d0                	add    eax,edx
  806bed:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        }
        str++;
  806bf0:	48 83 45 d8 01       	add    QWORD PTR [rbp-0x28],0x1
    while(*str!='\0')
  806bf5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806bf9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806bfc:	84 c0                	test   al,al
  806bfe:	75 9b                	jne    806b9b <draw_text+0x21>
    }
}
  806c00:	90                   	nop
  806c01:	90                   	nop
  806c02:	c9                   	leave  
  806c03:	c3                   	ret    

0000000000806c04 <draw_letter>:
void draw_letter(int x, volatile int y, int size, char c) {
  806c04:	f3 0f 1e fa          	endbr64 
  806c08:	55                   	push   rbp
  806c09:	48 89 e5             	mov    rbp,rsp
  806c0c:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
  806c0f:	89 75 c8             	mov    DWORD PTR [rbp-0x38],esi
  806c12:	89 55 c4             	mov    DWORD PTR [rbp-0x3c],edx
  806c15:	89 c8                	mov    eax,ecx
  806c17:	88 45 c0             	mov    BYTE PTR [rbp-0x40],al
    u8 *glyph = glyph_table;
  806c1a:	48 8b 05 77 1a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21a77]        # 428698 <glyph_table>
  806c21:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if (c < glyph_nr) {
  806c25:	0f be 55 c0          	movsx  edx,BYTE PTR [rbp-0x40]
  806c29:	8b 05 75 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21a75]        # 4286a4 <glyph_nr>
  806c2f:	39 c2                	cmp    edx,eax
  806c31:	73 13                	jae    806c46 <draw_letter+0x42>
        glyph += c * bytes_per_glyph;
  806c33:	0f be 55 c0          	movsx  edx,BYTE PTR [rbp-0x40]
  806c37:	8b 05 63 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21a63]        # 4286a0 <bytes_per_glyph>
  806c3d:	0f af c2             	imul   eax,edx
  806c40:	89 c0                	mov    eax,eax
  806c42:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    }
    /* output the font to frame buffer */
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  806c46:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  806c4d:	e9 cb 00 00 00       	jmp    806d1d <draw_letter+0x119>
        u8 mask = 1 << 7;
  806c52:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80

        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  806c56:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  806c5d:	e9 9c 00 00 00       	jmp    806cfe <draw_letter+0xfa>
            int px=x+ch_x*size;
  806c62:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  806c65:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  806c69:	89 c2                	mov    edx,eax
  806c6b:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  806c6e:	01 d0                	add    eax,edx
  806c70:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            int py=y+ch_y*size;
  806c73:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  806c76:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  806c7a:	89 c2                	mov    edx,eax
  806c7c:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  806c7f:	01 d0                	add    eax,edx
  806c81:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
            int* ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  806c84:	8b 15 c6 19 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc219c6]        # 428650 <framebuffer+0x10>
  806c8a:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806c8d:	0f af c2             	imul   eax,edx
  806c90:	89 c1                	mov    ecx,eax
                     +px*framebuffer.common.framebuffer_bpp/8;
  806c92:	0f b6 05 c3 19 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc219c3]        # 42865c <framebuffer+0x1c>
  806c99:	0f b6 c0             	movzx  eax,al
  806c9c:	0f af 45 e8          	imul   eax,DWORD PTR [rbp-0x18]
  806ca0:	8d 50 07             	lea    edx,[rax+0x7]
  806ca3:	85 c0                	test   eax,eax
  806ca5:	0f 48 c2             	cmovs  eax,edx
  806ca8:	c1 f8 03             	sar    eax,0x3
  806cab:	48 98                	cdqe   
  806cad:	48 01 c8             	add    rax,rcx
  806cb0:	48 05 00 00 00 40    	add    rax,0x40000000
            int* ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  806cb6:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
            if ((*(glyph + ch_x / 8) & mask) != 0) {
  806cba:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806cbd:	c1 e8 03             	shr    eax,0x3
  806cc0:	89 c2                	mov    edx,eax
  806cc2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806cc6:	48 01 d0             	add    rax,rdx
  806cc9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806ccc:	22 45 f3             	and    al,BYTE PTR [rbp-0xd]
  806ccf:	84 c0                	test   al,al
  806cd1:	74 0c                	je     806cdf <draw_letter+0xdb>
                *ptr=-1;
  806cd3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806cd7:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
  806cdd:	eb 0a                	jmp    806ce9 <draw_letter+0xe5>
            } else {
                *ptr=0;
  806cdf:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806ce3:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            }

            mask >>= 1;
  806ce9:	d0 6d f3             	shr    BYTE PTR [rbp-0xd],1
            if (ch_x % 8 == 0) {
  806cec:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806cef:	83 e0 07             	and    eax,0x7
  806cf2:	85 c0                	test   eax,eax
  806cf4:	75 04                	jne    806cfa <draw_letter+0xf6>
                mask = 1 << 7;
  806cf6:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80
        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  806cfa:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  806cfe:	8b 05 84 19 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21984]        # 428688 <font_width>
  806d04:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  806d07:	0f 82 55 ff ff ff    	jb     806c62 <draw_letter+0x5e>
            }
        }

        glyph += font_width_bytes;
  806d0d:	8b 05 7d 19 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2197d]        # 428690 <font_width_bytes>
  806d13:	89 c0                	mov    eax,eax
  806d15:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  806d19:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  806d1d:	8b 05 69 19 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21969]        # 42868c <font_height>
  806d23:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  806d26:	0f 82 26 ff ff ff    	jb     806c52 <draw_letter+0x4e>
    }
}
  806d2c:	90                   	nop
  806d2d:	90                   	nop
  806d2e:	5d                   	pop    rbp
  806d2f:	c3                   	ret    

0000000000806d30 <scr_up>:
//向上滚动一个像素
void scr_up(){
  806d30:	f3 0f 1e fa          	endbr64 
  806d34:	55                   	push   rbp
  806d35:	48 89 e5             	mov    rbp,rsp
    for(int dy=0;dy<framebuffer.common.framebuffer_height-1;dy++){
  806d38:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  806d3f:	eb 71                	jmp    806db2 <scr_up+0x82>
        for(int dx=0;dx<framebuffer.common.framebuffer_width;dx++){
  806d41:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  806d48:	eb 57                	jmp    806da1 <scr_up+0x71>
            char *p=(char*)(FRAMEBUFFER_ADDR+
                    dy*framebuffer.common.framebuffer_pitch
  806d4a:	8b 15 00 19 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21900]        # 428650 <framebuffer+0x10>
  806d50:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806d53:	0f af c2             	imul   eax,edx
  806d56:	89 c1                	mov    ecx,eax
                    +dx*framebuffer.common.framebuffer_bpp/8);
  806d58:	0f b6 05 fd 18 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc218fd]        # 42865c <framebuffer+0x1c>
  806d5f:	0f b6 c0             	movzx  eax,al
  806d62:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  806d66:	8d 50 07             	lea    edx,[rax+0x7]
  806d69:	85 c0                	test   eax,eax
  806d6b:	0f 48 c2             	cmovs  eax,edx
  806d6e:	c1 f8 03             	sar    eax,0x3
  806d71:	48 98                	cdqe   
  806d73:	48 01 c8             	add    rax,rcx
  806d76:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+
  806d7c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p+framebuffer.common.framebuffer_pitch);
  806d80:	8b 05 ca 18 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc218ca]        # 428650 <framebuffer+0x10>
  806d86:	89 c2                	mov    edx,eax
  806d88:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806d8c:	48 01 d0             	add    rax,rdx
  806d8f:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  806d92:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806d96:	88 10                	mov    BYTE PTR [rax],dl
            p++;
  806d98:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        for(int dx=0;dx<framebuffer.common.framebuffer_width;dx++){
  806d9d:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806da1:	8b 15 ad 18 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc218ad]        # 428654 <framebuffer+0x14>
  806da7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806daa:	39 c2                	cmp    edx,eax
  806dac:	77 9c                	ja     806d4a <scr_up+0x1a>
    for(int dy=0;dy<framebuffer.common.framebuffer_height-1;dy++){
  806dae:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806db2:	8b 05 a0 18 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc218a0]        # 428658 <framebuffer+0x18>
  806db8:	8d 50 ff             	lea    edx,[rax-0x1]
  806dbb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806dbe:	39 c2                	cmp    edx,eax
  806dc0:	0f 87 7b ff ff ff    	ja     806d41 <scr_up+0x11>
        }

    }
//    for(int i=0;i< framebuffer.common.framebuffer_width*framebuffer.common.framebuffer_bpp/8;i++)
//        *(p++)=0;
}
  806dc6:	90                   	nop
  806dc7:	90                   	nop
  806dc8:	5d                   	pop    rbp
  806dc9:	c3                   	ret    

0000000000806dca <scr_down>:
void scr_down(){
  806dca:	f3 0f 1e fa          	endbr64 
  806dce:	55                   	push   rbp
  806dcf:	48 89 e5             	mov    rbp,rsp
    for(int dy=1;dy<max_ch_nr_y;dy++){
  806dd2:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
  806dd9:	eb 72                	jmp    806e4d <scr_down+0x83>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  806ddb:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  806de2:	eb 58                	jmp    806e3c <scr_down+0x72>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  806de4:	8b 15 66 18 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21866]        # 428650 <framebuffer+0x10>
  806dea:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806ded:	0f af c2             	imul   eax,edx
  806df0:	89 c1                	mov    ecx,eax
                            +dx*framebuffer.common.framebuffer_bpp/8);
  806df2:	0f b6 05 63 18 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21863]        # 42865c <framebuffer+0x1c>
  806df9:	0f b6 c0             	movzx  eax,al
  806dfc:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  806e00:	8d 50 07             	lea    edx,[rax+0x7]
  806e03:	85 c0                	test   eax,eax
  806e05:	0f 48 c2             	cmovs  eax,edx
  806e08:	c1 f8 03             	sar    eax,0x3
  806e0b:	48 98                	cdqe   
  806e0d:	48 01 c8             	add    rax,rcx
  806e10:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  806e16:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p-framebuffer.common.framebuffer_pitch);
  806e1a:	8b 05 30 18 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21830]        # 428650 <framebuffer+0x10>
  806e20:	89 c0                	mov    eax,eax
  806e22:	48 f7 d8             	neg    rax
  806e25:	48 89 c2             	mov    rdx,rax
  806e28:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806e2c:	48 01 d0             	add    rax,rdx
  806e2f:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  806e32:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806e36:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  806e38:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806e3c:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  806e3f:	8b 05 2f 18 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2182f]        # 428674 <max_ch_nr_x>
  806e45:	39 c2                	cmp    edx,eax
  806e47:	72 9b                	jb     806de4 <scr_down+0x1a>
    for(int dy=1;dy<max_ch_nr_y;dy++){
  806e49:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806e4d:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  806e50:	8b 05 22 18 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21822]        # 428678 <max_ch_nr_y>
  806e56:	39 c2                	cmp    edx,eax
  806e58:	72 81                	jb     806ddb <scr_down+0x11>
        }

    }
}
  806e5a:	90                   	nop
  806e5b:	90                   	nop
  806e5c:	5d                   	pop    rbp
  806e5d:	c3                   	ret    

0000000000806e5e <print>:
void print(char* s){
  806e5e:	f3 0f 1e fa          	endbr64 
  806e62:	55                   	push   rbp
  806e63:	48 89 e5             	mov    rbp,rsp
  806e66:	48 83 ec 08          	sub    rsp,0x8
  806e6a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    for(;*s;s++){
  806e6e:	e9 c4 00 00 00       	jmp    806f37 <print+0xd9>
        if(fb_cursor_x>max_ch_nr_x||*s=='\n')
  806e73:	8b 15 f3 17 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc217f3]        # 42866c <fb_cursor_x>
  806e79:	8b 05 f5 17 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc217f5]        # 428674 <max_ch_nr_x>
  806e7f:	39 c2                	cmp    edx,eax
  806e81:	77 0b                	ja     806e8e <print+0x30>
  806e83:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806e87:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806e8a:	3c 0a                	cmp    al,0xa
  806e8c:	75 19                	jne    806ea7 <print+0x49>
        {
            fb_cursor_y+=1;
  806e8e:	8b 05 dc 17 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc217dc]        # 428670 <fb_cursor_y>
  806e94:	83 c0 01             	add    eax,0x1
  806e97:	89 05 d3 17 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc217d3],eax        # 428670 <fb_cursor_y>
            fb_cursor_x=0;
  806e9d:	c7 05 c5 17 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc217c5],0x0        # 42866c <fb_cursor_x>
  806ea4:	00 00 00 
        }
        if(*s=='\n')continue;
  806ea7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806eab:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806eae:	3c 0a                	cmp    al,0xa
  806eb0:	74 7f                	je     806f31 <print+0xd3>
        if(fb_cursor_y>=max_ch_nr_y-1){
  806eb2:	8b 05 c0 17 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc217c0]        # 428678 <max_ch_nr_y>
  806eb8:	8d 50 ff             	lea    edx,[rax-0x1]
  806ebb:	8b 05 af 17 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc217af]        # 428670 <fb_cursor_y>
  806ec1:	39 c2                	cmp    edx,eax
  806ec3:	77 0a                	ja     806ecf <print+0x71>
//            for(int i=0;i<font_height*font_size;i++)
////                scr_up();
////            fb_cursor_y=max_ch_nr_y-1;
            fb_cursor_y=0;
  806ec5:	c7 05 a1 17 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc217a1],0x0        # 428670 <fb_cursor_y>
  806ecc:	00 00 00 
        }
        draw_letter(fb_cursor_x*font_width*font_size,fb_cursor_y*font_height*font_size,font_size,*s);
  806ecf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806ed3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806ed6:	0f be d0             	movsx  edx,al
  806ed9:	8b 05 a1 54 00 00    	mov    eax,DWORD PTR [rip+0x54a1]        # 80c380 <font_size>
  806edf:	8b 35 8b 17 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc2178b]        # 428670 <fb_cursor_y>
  806ee5:	8b 0d a1 17 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc217a1]        # 42868c <font_height>
  806eeb:	0f af ce             	imul   ecx,esi
  806eee:	8b 35 8c 54 00 00    	mov    esi,DWORD PTR [rip+0x548c]        # 80c380 <font_size>
  806ef4:	0f af ce             	imul   ecx,esi
  806ef7:	41 89 c8             	mov    r8d,ecx
  806efa:	8b 35 6c 17 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc2176c]        # 42866c <fb_cursor_x>
  806f00:	8b 0d 82 17 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc21782]        # 428688 <font_width>
  806f06:	0f af ce             	imul   ecx,esi
  806f09:	8b 35 71 54 00 00    	mov    esi,DWORD PTR [rip+0x5471]        # 80c380 <font_size>
  806f0f:	0f af ce             	imul   ecx,esi
  806f12:	89 cf                	mov    edi,ecx
  806f14:	89 d1                	mov    ecx,edx
  806f16:	89 c2                	mov    edx,eax
  806f18:	44 89 c6             	mov    esi,r8d
  806f1b:	e8 e4 fc ff ff       	call   806c04 <draw_letter>
        fb_cursor_x+=1;
  806f20:	8b 05 46 17 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21746]        # 42866c <fb_cursor_x>
  806f26:	83 c0 01             	add    eax,0x1
  806f29:	89 05 3d 17 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2173d],eax        # 42866c <fb_cursor_x>
  806f2f:	eb 01                	jmp    806f32 <print+0xd4>
        if(*s=='\n')continue;
  806f31:	90                   	nop
    for(;*s;s++){
  806f32:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  806f37:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806f3b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806f3e:	84 c0                	test   al,al
  806f40:	0f 85 2d ff ff ff    	jne    806e73 <print+0x15>
    }
}
  806f46:	90                   	nop
  806f47:	90                   	nop
  806f48:	c9                   	leave  
  806f49:	c3                   	ret    

0000000000806f4a <open_framebuffer>:
struct file_operations framebuffer_fops={
        .open=open_framebuffer,.close=close_framebuffer,.read=read_framebuffer,.write=write_framebuffer,
        .ioctl=ioctl_framebuffer
};
long open_framebuffer(struct index_node * inode,struct file * filp){
  806f4a:	f3 0f 1e fa          	endbr64 
  806f4e:	55                   	push   rbp
  806f4f:	48 89 e5             	mov    rbp,rsp
  806f52:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  806f56:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    inode->f_ops=&framebuffer_fops;
  806f5a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806f5e:	48 c7 40 20 a0 c3 80 	mov    QWORD PTR [rax+0x20],0x80c3a0
  806f65:	00 
    filp->f_ops=&framebuffer_fops;
  806f66:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806f6a:	48 c7 40 18 a0 c3 80 	mov    QWORD PTR [rax+0x18],0x80c3a0
  806f71:	00 
}
  806f72:	90                   	nop
  806f73:	5d                   	pop    rbp
  806f74:	c3                   	ret    

0000000000806f75 <close_framebuffer>:
long close_framebuffer(struct index_node * inode,struct file * filp){
  806f75:	f3 0f 1e fa          	endbr64 
  806f79:	55                   	push   rbp
  806f7a:	48 89 e5             	mov    rbp,rsp
  806f7d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  806f81:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi

}
  806f85:	90                   	nop
  806f86:	5d                   	pop    rbp
  806f87:	c3                   	ret    

0000000000806f88 <read_framebuffer>:
long read_framebuffer(struct file * filp,char * buf,unsigned long count,long * position){
  806f88:	f3 0f 1e fa          	endbr64 
  806f8c:	55                   	push   rbp
  806f8d:	48 89 e5             	mov    rbp,rsp
  806f90:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  806f94:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  806f98:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  806f9c:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx

}
  806fa0:	90                   	nop
  806fa1:	5d                   	pop    rbp
  806fa2:	c3                   	ret    

0000000000806fa3 <write_framebuffer>:
long write_framebuffer(struct file * filp,char * buf,unsigned long count,long * position){
  806fa3:	f3 0f 1e fa          	endbr64 
  806fa7:	55                   	push   rbp
  806fa8:	48 89 e5             	mov    rbp,rsp
  806fab:	48 83 ec 40          	sub    rsp,0x40
  806faf:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  806fb3:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  806fb7:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  806fbb:	48 89 4d c0          	mov    QWORD PTR [rbp-0x40],rcx
    char *tmp= (char*)vmalloc();
  806fbf:	b8 00 00 00 00       	mov    eax,0x0
  806fc4:	e8 f0 a2 ff ff       	call   8012b9 <vmalloc>
  806fc9:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int c=count/(PAGE_4K_SIZE-1),p=0;
  806fcd:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  806fd1:	48 ba 11 00 01 10 00 	movabs rdx,0x10010010010011
  806fd8:	01 10 00 
  806fdb:	48 89 c8             	mov    rax,rcx
  806fde:	48 f7 e2             	mul    rdx
  806fe1:	48 89 c8             	mov    rax,rcx
  806fe4:	48 29 d0             	sub    rax,rdx
  806fe7:	48 d1 e8             	shr    rax,1
  806fea:	48 01 d0             	add    rax,rdx
  806fed:	48 c1 e8 0b          	shr    rax,0xb
  806ff1:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  806ff4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    //一块一块输出
    for(int i=0;i<count?count:1;i++){
  806ffb:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807002:	eb 46                	jmp    80704a <write_framebuffer+0xa7>
        memcpy(tmp,buf+p,PAGE_4K_SIZE-1);
  807004:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807007:	48 63 d0             	movsxd rdx,eax
  80700a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80700e:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  807012:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807016:	ba ff 0f 00 00       	mov    edx,0xfff
  80701b:	48 89 ce             	mov    rsi,rcx
  80701e:	48 89 c7             	mov    rdi,rax
  807021:	e8 1f 49 00 00       	call   80b945 <memcpy>
        tmp[PAGE_4K_SIZE-1]=0;
  807026:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80702a:	48 05 ff 0f 00 00    	add    rax,0xfff
  807030:	c6 00 00             	mov    BYTE PTR [rax],0x0
        print(tmp);
  807033:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807037:	48 89 c7             	mov    rdi,rax
  80703a:	e8 1f fe ff ff       	call   806e5e <print>
        p+=PAGE_4K_SIZE-1;
  80703f:	81 45 fc ff 0f 00 00 	add    DWORD PTR [rbp-0x4],0xfff
    for(int i=0;i<count?count:1;i++){
  807046:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80704a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80704d:	48 98                	cdqe   
  80704f:	48 39 45 c8          	cmp    QWORD PTR [rbp-0x38],rax
  807053:	76 af                	jbe    807004 <write_framebuffer+0x61>
  807055:	48 83 7d c8 00       	cmp    QWORD PTR [rbp-0x38],0x0
  80705a:	75 a8                	jne    807004 <write_framebuffer+0x61>
    }
    vmfree(tmp);
  80705c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807060:	48 89 c7             	mov    rdi,rax
  807063:	e8 e0 a2 ff ff       	call   801348 <vmfree>
    return 0;
  807068:	b8 00 00 00 00       	mov    eax,0x0
}
  80706d:	c9                   	leave  
  80706e:	c3                   	ret    

000000000080706f <ioctl_framebuffer>:
long ioctl_framebuffer(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg){
  80706f:	f3 0f 1e fa          	endbr64 
  807073:	55                   	push   rbp
  807074:	48 89 e5             	mov    rbp,rsp
  807077:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80707b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80707f:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  807083:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx

}
  807087:	90                   	nop
  807088:	5d                   	pop    rbp
  807089:	c3                   	ret    

000000000080708a <path_walk>:
#include "errno.h"
#include "memory.h"
#include "log.h"

struct dir_entry * path_walk(char * name,unsigned long flags)
{
  80708a:	f3 0f 1e fa          	endbr64 
  80708e:	55                   	push   rbp
  80708f:	48 89 e5             	mov    rbp,rsp
  807092:	48 83 ec 50          	sub    rsp,0x50
  807096:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  80709a:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
    char * tmpname = NULL;
  80709e:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8070a5:	00 
    int tmpnamelen = 0;
  8070a6:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    struct dir_entry * parent = root_sb->root;
  8070ad:	48 8b 05 f4 15 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc215f4]        # 4286a8 <root_sb>
  8070b4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8070b7:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    struct dir_entry * path = NULL;
  8070bb:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  8070c2:	00 

    while(*name == '/')
  8070c3:	eb 05                	jmp    8070ca <path_walk+0x40>
        name++;
  8070c5:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
    while(*name == '/')
  8070ca:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8070ce:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8070d1:	3c 2f                	cmp    al,0x2f
  8070d3:	74 f0                	je     8070c5 <path_walk+0x3b>

    if(!*name)
  8070d5:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8070d9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8070dc:	84 c0                	test   al,al
  8070de:	75 09                	jne    8070e9 <path_walk+0x5f>
    {
        return parent;
  8070e0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8070e4:	e9 1b 02 00 00       	jmp    807304 <path_walk+0x27a>
    }

    for(;;)
    {
        tmpname = name;
  8070e9:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8070ed:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        while(*name && (*name != '/'))
  8070f1:	eb 05                	jmp    8070f8 <path_walk+0x6e>
            name++;
  8070f3:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
        while(*name && (*name != '/'))
  8070f8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8070fc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8070ff:	84 c0                	test   al,al
  807101:	74 0b                	je     80710e <path_walk+0x84>
  807103:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807107:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80710a:	3c 2f                	cmp    al,0x2f
  80710c:	75 e5                	jne    8070f3 <path_walk+0x69>
        tmpnamelen = name - tmpname;
  80710e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807112:	48 2b 45 f0          	sub    rax,QWORD PTR [rbp-0x10]
  807116:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

        path = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  807119:	be 00 00 00 00       	mov    esi,0x0
  80711e:	bf 48 00 00 00       	mov    edi,0x48
  807123:	b8 00 00 00 00       	mov    eax,0x0
  807128:	e8 8c a1 ff ff       	call   8012b9 <vmalloc>
  80712d:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        memset(path,0,sizeof(struct dir_entry));
  807131:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807135:	ba 48 00 00 00       	mov    edx,0x48
  80713a:	be 00 00 00 00       	mov    esi,0x0
  80713f:	48 89 c7             	mov    rdi,rax
  807142:	e8 ad 48 00 00       	call   80b9f4 <memset>

        path->name = vmalloc(tmpnamelen+1,0);
  807147:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80714a:	83 c0 01             	add    eax,0x1
  80714d:	be 00 00 00 00       	mov    esi,0x0
  807152:	89 c7                	mov    edi,eax
  807154:	b8 00 00 00 00       	mov    eax,0x0
  807159:	e8 5b a1 ff ff       	call   8012b9 <vmalloc>
  80715e:	48 89 c2             	mov    rdx,rax
  807161:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807165:	48 89 10             	mov    QWORD PTR [rax],rdx
        memset(path->name,0,tmpnamelen+1);
  807168:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80716b:	83 c0 01             	add    eax,0x1
  80716e:	48 63 d0             	movsxd rdx,eax
  807171:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807175:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807178:	be 00 00 00 00       	mov    esi,0x0
  80717d:	48 89 c7             	mov    rdi,rax
  807180:	e8 6f 48 00 00       	call   80b9f4 <memset>
        memcpy(tmpname,path->name,tmpnamelen);
  807185:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807188:	48 63 d0             	movsxd rdx,eax
  80718b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80718f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  807192:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807196:	48 89 ce             	mov    rsi,rcx
  807199:	48 89 c7             	mov    rdi,rax
  80719c:	e8 a4 47 00 00       	call   80b945 <memcpy>
        path->name_length = tmpnamelen;
  8071a1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8071a5:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8071a8:	89 50 08             	mov    DWORD PTR [rax+0x8],edx

        if(parent->dir_inode->inode_ops->lookup(parent->dir_inode,path) == NULL)
  8071ab:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8071af:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8071b3:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  8071b7:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  8071bb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8071bf:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8071c3:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  8071c7:	48 89 d6             	mov    rsi,rdx
  8071ca:	48 89 c7             	mov    rdi,rax
  8071cd:	ff d1                	call   rcx
  8071cf:	48 85 c0             	test   rax,rax
  8071d2:	75 3e                	jne    807212 <path_walk+0x188>
        {
            printf("can not find file or dir:%s\n",path->name);
  8071d4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8071d8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8071db:	48 89 c6             	mov    rsi,rax
  8071de:	bf 0d 40 81 00       	mov    edi,0x81400d
  8071e3:	b8 00 00 00 00       	mov    eax,0x0
  8071e8:	e8 3a 9b ff ff       	call   800d27 <printf>
            vmfree(path->name);
  8071ed:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8071f1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8071f4:	48 89 c7             	mov    rdi,rax
  8071f7:	e8 4c a1 ff ff       	call   801348 <vmfree>
            vmfree(path);
  8071fc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807200:	48 89 c7             	mov    rdi,rax
  807203:	e8 40 a1 ff ff       	call   801348 <vmfree>
            return NULL;
  807208:	b8 00 00 00 00       	mov    eax,0x0
  80720d:	e9 f2 00 00 00       	jmp    807304 <path_walk+0x27a>
        }

        list_init(&path->child_node);
  807212:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807216:	48 83 c0 10          	add    rax,0x10
  80721a:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    struct List * next;
};

__attribute__((always_inline)) inline void list_init(struct List * list)
{
    list->prev = list;
  80721e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807222:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  807226:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  807229:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80722d:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  807231:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  807235:	90                   	nop
        list_init(&path->subdirs_list);
  807236:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80723a:	48 83 c0 20          	add    rax,0x20
  80723e:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    list->prev = list;
  807242:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807246:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80724a:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  80724d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807251:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  807255:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  807259:	90                   	nop
        path->parent = parent;
  80725a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80725e:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  807262:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
        list_add_to_behind(&parent->subdirs_list,&path->child_node);
  807266:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80726a:	48 83 c0 10          	add    rax,0x10
  80726e:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  807272:	48 83 c2 20          	add    rdx,0x20
  807276:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  80727a:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

__attribute__((always_inline)) inline void list_add_to_behind(struct List * entry,struct List * new)	////add to entry behind
{
    new->next = entry->next;
  80727e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807282:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  807286:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80728a:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    new->prev = entry;
  80728e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807292:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  807296:	48 89 10             	mov    QWORD PTR [rax],rdx
    new->next->prev = new;
  807299:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80729d:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8072a1:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8072a5:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  8072a8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8072ac:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8072b0:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  8072b4:	90                   	nop

        if(!*name)
  8072b5:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8072b9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8072bc:	84 c0                	test   al,al
  8072be:	74 2a                	je     8072ea <path_walk+0x260>
            goto last_component;
        while(*name == '/')
  8072c0:	eb 05                	jmp    8072c7 <path_walk+0x23d>
            name++;
  8072c2:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
        while(*name == '/')
  8072c7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8072cb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8072ce:	3c 2f                	cmp    al,0x2f
  8072d0:	74 f0                	je     8072c2 <path_walk+0x238>
        if(!*name)
  8072d2:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8072d6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8072d9:	84 c0                	test   al,al
  8072db:	74 10                	je     8072ed <path_walk+0x263>
            goto last_slash;

        parent = path;
  8072dd:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8072e1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    {
  8072e5:	e9 ff fd ff ff       	jmp    8070e9 <path_walk+0x5f>
            goto last_component;
  8072ea:	90                   	nop
  8072eb:	eb 01                	jmp    8072ee <path_walk+0x264>
            goto last_slash;
  8072ed:	90                   	nop
    }

    last_slash:
    last_component:

    if(flags & 1)
  8072ee:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8072f2:	83 e0 01             	and    eax,0x1
  8072f5:	48 85 c0             	test   rax,rax
  8072f8:	74 06                	je     807300 <path_walk+0x276>
    {
        return parent;
  8072fa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8072fe:	eb 04                	jmp    807304 <path_walk+0x27a>
    }

    return path;
  807300:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  807304:	c9                   	leave  
  807305:	c3                   	ret    

0000000000807306 <fill_dentry>:

int fill_dentry(void *buf,char *name, long namelen,long type,long offset)
{
  807306:	f3 0f 1e fa          	endbr64 
  80730a:	55                   	push   rbp
  80730b:	48 89 e5             	mov    rbp,rsp
  80730e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  807312:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  807316:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80731a:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  80731e:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
//
//    memcpy(name,dent->d_name,namelen);
//    dent->d_namelen = namelen;
//    dent->d_type = type;
//    dent->d_offset = offset;
    return sizeof(struct dirent) + namelen;
  807322:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807326:	83 c0 18             	add    eax,0x18
}
  807329:	5d                   	pop    rbp
  80732a:	c3                   	ret    

000000000080732b <mount_fs>:
//function mount_root
struct super_block * root_sb = NULL;
struct file_system_type filesystem = {"filesystem",0};

struct super_block* mount_fs(char * name,struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  80732b:	f3 0f 1e fa          	endbr64 
  80732f:	55                   	push   rbp
  807330:	48 89 e5             	mov    rbp,rsp
  807333:	48 83 ec 30          	sub    rsp,0x30
  807337:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80733b:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80733f:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file_system_type * p = NULL;
  807343:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80734a:	00 

    for(p = &filesystem;p;p = p->next)
  80734b:	48 c7 45 f8 e0 c3 80 	mov    QWORD PTR [rbp-0x8],0x80c3e0
  807352:	00 
  807353:	eb 40                	jmp    807395 <mount_fs+0x6a>
        if(!strcmp(p->name,name))
  807355:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807359:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80735c:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  807360:	48 89 d6             	mov    rsi,rdx
  807363:	48 89 c7             	mov    rdi,rax
  807366:	e8 78 48 00 00       	call   80bbe3 <strcmp>
  80736b:	85 c0                	test   eax,eax
  80736d:	75 1a                	jne    807389 <mount_fs+0x5e>
        {
            return p->read_superblock(DPTE,buf);
  80736f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807373:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  807377:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80737b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80737f:	48 89 d6             	mov    rsi,rdx
  807382:	48 89 c7             	mov    rdi,rax
  807385:	ff d1                	call   rcx
  807387:	eb 18                	jmp    8073a1 <mount_fs+0x76>
    for(p = &filesystem;p;p = p->next)
  807389:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80738d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807391:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  807395:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80739a:	75 b9                	jne    807355 <mount_fs+0x2a>
        }
    return 0;
  80739c:	b8 00 00 00 00       	mov    eax,0x0
}
  8073a1:	c9                   	leave  
  8073a2:	c3                   	ret    

00000000008073a3 <register_filesystem>:

unsigned long register_filesystem(struct file_system_type * fs)
{
  8073a3:	f3 0f 1e fa          	endbr64 
  8073a7:	55                   	push   rbp
  8073a8:	48 89 e5             	mov    rbp,rsp
  8073ab:	48 83 ec 20          	sub    rsp,0x20
  8073af:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = NULL;
  8073b3:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8073ba:	00 

    for(p = &filesystem;p;p = p->next)
  8073bb:	48 c7 45 f8 e0 c3 80 	mov    QWORD PTR [rbp-0x8],0x80c3e0
  8073c2:	00 
  8073c3:	eb 30                	jmp    8073f5 <register_filesystem+0x52>
        if(!strcmp(fs->name,p->name))
  8073c5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8073c9:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8073cc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8073d0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8073d3:	48 89 d6             	mov    rsi,rdx
  8073d6:	48 89 c7             	mov    rdi,rax
  8073d9:	e8 05 48 00 00       	call   80bbe3 <strcmp>
  8073de:	85 c0                	test   eax,eax
  8073e0:	75 07                	jne    8073e9 <register_filesystem+0x46>
            return 0;
  8073e2:	b8 00 00 00 00       	mov    eax,0x0
  8073e7:	eb 32                	jmp    80741b <register_filesystem+0x78>
    for(p = &filesystem;p;p = p->next)
  8073e9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8073ed:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8073f1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  8073f5:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8073fa:	75 c9                	jne    8073c5 <register_filesystem+0x22>

    fs->next = filesystem.next;
  8073fc:	48 8b 15 f5 4f 00 00 	mov    rdx,QWORD PTR [rip+0x4ff5]        # 80c3f8 <filesystem+0x18>
  807403:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807407:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    filesystem.next = fs;
  80740b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80740f:	48 89 05 e2 4f 00 00 	mov    QWORD PTR [rip+0x4fe2],rax        # 80c3f8 <filesystem+0x18>

    return 1;
  807416:	b8 01 00 00 00       	mov    eax,0x1
}
  80741b:	c9                   	leave  
  80741c:	c3                   	ret    

000000000080741d <unregister_filesystem>:

unsigned long unregister_filesystem(struct file_system_type * fs)
{
  80741d:	f3 0f 1e fa          	endbr64 
  807421:	55                   	push   rbp
  807422:	48 89 e5             	mov    rbp,rsp
  807425:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = &filesystem;
  807429:	48 c7 45 f8 e0 c3 80 	mov    QWORD PTR [rbp-0x8],0x80c3e0
  807430:	00 

    while(p->next)
  807431:	eb 41                	jmp    807474 <unregister_filesystem+0x57>
        if(p->next == fs)
  807433:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807437:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80743b:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  80743f:	75 27                	jne    807468 <unregister_filesystem+0x4b>
        {
            p->next = p->next->next;
  807441:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807445:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807449:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  80744d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807451:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
            fs->next = NULL;
  807455:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807459:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  807460:	00 
            return 1;
  807461:	b8 01 00 00 00       	mov    eax,0x1
  807466:	eb 1e                	jmp    807486 <unregister_filesystem+0x69>
        }
        else
            p = p->next;
  807468:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80746c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807470:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p->next)
  807474:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807478:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80747c:	48 85 c0             	test   rax,rax
  80747f:	75 b2                	jne    807433 <unregister_filesystem+0x16>
    return 0;
  807481:	b8 00 00 00 00       	mov    eax,0x0
}
  807486:	5d                   	pop    rbp
  807487:	c3                   	ret    

0000000000807488 <sys_putstring>:
#include "syscall.h"
#include "int.h"


unsigned long sys_putstring(char *string)
{
  807488:	f3 0f 1e fa          	endbr64 
  80748c:	55                   	push   rbp
  80748d:	48 89 e5             	mov    rbp,rsp
  807490:	48 83 ec 10          	sub    rsp,0x10
  807494:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    printf(string);
  807498:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80749c:	48 89 c7             	mov    rdi,rax
  80749f:	b8 00 00 00 00       	mov    eax,0x0
  8074a4:	e8 7e 98 ff ff       	call   800d27 <printf>
    return 0;
  8074a9:	b8 00 00 00 00       	mov    eax,0x0
}
  8074ae:	c9                   	leave  
  8074af:	c3                   	ret    

00000000008074b0 <sys_open>:

unsigned long sys_open(char *filename,int flags)
{
  8074b0:	f3 0f 1e fa          	endbr64 
  8074b4:	55                   	push   rbp
  8074b5:	48 89 e5             	mov    rbp,rsp
  8074b8:	48 83 ec 50          	sub    rsp,0x50
  8074bc:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  8074c0:	89 75 b4             	mov    DWORD PTR [rbp-0x4c],esi
    char * path = NULL;
  8074c3:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  8074ca:	00 
    long pathlen = 0;
  8074cb:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  8074d2:	00 
    long error = 0;
  8074d3:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8074da:	00 
    struct dir_entry * dentry = NULL;
  8074db:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  8074e2:	00 
    struct file * filp = NULL;
  8074e3:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  8074ea:	00 
    struct file ** f = NULL;
  8074eb:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  8074f2:	00 
    int fd = -1;
  8074f3:	c7 45 f4 ff ff ff ff 	mov    DWORD PTR [rbp-0xc],0xffffffff
    int i;

//	printf("sys_open\n");
    path = (char *)vmalloc();
  8074fa:	b8 00 00 00 00       	mov    eax,0x0
  8074ff:	e8 b5 9d ff ff       	call   8012b9 <vmalloc>
  807504:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    if(path == NULL)
  807508:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  80750d:	75 0c                	jne    80751b <sys_open+0x6b>
        return -ENOMEM;
  80750f:	48 c7 c0 cf ff ff ff 	mov    rax,0xffffffffffffffcf
  807516:	e9 aa 02 00 00       	jmp    8077c5 <sys_open+0x315>
    memset(path,0,PAGE_4K_SIZE);
  80751b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80751f:	ba 00 10 00 00       	mov    edx,0x1000
  807524:	be 00 00 00 00       	mov    esi,0x0
  807529:	48 89 c7             	mov    rdi,rax
  80752c:	e8 c3 44 00 00       	call   80b9f4 <memset>
    pathlen = strlen(filename);
  807531:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807535:	48 89 c7             	mov    rdi,rax
  807538:	e8 25 47 00 00       	call   80bc62 <strlen>
  80753d:	48 98                	cdqe   
  80753f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(pathlen <= 0)
  807543:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  807548:	7f 18                	jg     807562 <sys_open+0xb2>
    {
        vmfree(path);
  80754a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80754e:	48 89 c7             	mov    rdi,rax
  807551:	e8 f2 9d ff ff       	call   801348 <vmfree>
        return -EFAULT;
  807556:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  80755d:	e9 63 02 00 00       	jmp    8077c5 <sys_open+0x315>
    }
    else if(pathlen >= PAGE_4K_SIZE)
  807562:	48 81 7d e0 ff 0f 00 	cmp    QWORD PTR [rbp-0x20],0xfff
  807569:	00 
  80756a:	7e 18                	jle    807584 <sys_open+0xd4>
    {
        vmfree(path);
  80756c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807570:	48 89 c7             	mov    rdi,rax
  807573:	e8 d0 9d ff ff       	call   801348 <vmfree>
        return -ENAMETOOLONG;
  807578:	48 c7 c0 db ff ff ff 	mov    rax,0xffffffffffffffdb
  80757f:	e9 41 02 00 00       	jmp    8077c5 <sys_open+0x315>
    }
    strcpy(filename,path);
  807584:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  807588:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80758c:	48 89 d6             	mov    rsi,rdx
  80758f:	48 89 c7             	mov    rdi,rax
  807592:	e8 ac 44 00 00       	call   80ba43 <strcpy>

    dentry = path_walk(path,0);
  807597:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80759b:	be 00 00 00 00       	mov    esi,0x0
  8075a0:	48 89 c7             	mov    rdi,rax
  8075a3:	e8 e2 fa ff ff       	call   80708a <path_walk>
  8075a8:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    vmfree(path);
  8075ac:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8075b0:	48 89 c7             	mov    rdi,rax
  8075b3:	e8 90 9d ff ff       	call   801348 <vmfree>

    if(dentry == NULL)
  8075b8:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  8075bd:	75 0c                	jne    8075cb <sys_open+0x11b>
        return -ENOENT;
  8075bf:	48 c7 c0 d3 ff ff ff 	mov    rax,0xffffffffffffffd3
  8075c6:	e9 fa 01 00 00       	jmp    8077c5 <sys_open+0x315>

    if((flags & O_DIRECTORY) && (dentry->dir_inode->attribute != FS_ATTR_DIR))
  8075cb:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8075ce:	25 00 40 00 00       	and    eax,0x4000
  8075d3:	85 c0                	test   eax,eax
  8075d5:	74 1e                	je     8075f5 <sys_open+0x145>
  8075d7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8075db:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8075df:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8075e3:	48 83 f8 02          	cmp    rax,0x2
  8075e7:	74 0c                	je     8075f5 <sys_open+0x145>
        return -ENOTDIR;
  8075e9:	48 c7 c0 c7 ff ff ff 	mov    rax,0xffffffffffffffc7
  8075f0:	e9 d0 01 00 00       	jmp    8077c5 <sys_open+0x315>
    if(!(flags & O_DIRECTORY) && (dentry->dir_inode->attribute == FS_ATTR_DIR))
  8075f5:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8075f8:	25 00 40 00 00       	and    eax,0x4000
  8075fd:	85 c0                	test   eax,eax
  8075ff:	75 1e                	jne    80761f <sys_open+0x16f>
  807601:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807605:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807609:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80760d:	48 83 f8 02          	cmp    rax,0x2
  807611:	75 0c                	jne    80761f <sys_open+0x16f>
        return -EISDIR;
  807613:	48 c7 c0 e1 ff ff ff 	mov    rax,0xffffffffffffffe1
  80761a:	e9 a6 01 00 00       	jmp    8077c5 <sys_open+0x315>

    filp = (struct file *)vmalloc();
  80761f:	b8 00 00 00 00       	mov    eax,0x0
  807624:	e8 90 9c ff ff       	call   8012b9 <vmalloc>
  807629:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    memset(filp,0,sizeof(struct file));
  80762d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807631:	ba 28 00 00 00       	mov    edx,0x28
  807636:	be 00 00 00 00       	mov    esi,0x0
  80763b:	48 89 c7             	mov    rdi,rax
  80763e:	e8 b1 43 00 00       	call   80b9f4 <memset>
    filp->dentry = dentry;
  807643:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807647:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80764b:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    filp->mode = flags;
  80764f:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  807652:	48 63 d0             	movsxd rdx,eax
  807655:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807659:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx

    if(dentry->dir_inode->attribute & FS_ATTR_DEVICE)
  80765d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807661:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807665:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807669:	83 e0 04             	and    eax,0x4
  80766c:	48 85 c0             	test   rax,rax
  80766f:	74 0e                	je     80767f <sys_open+0x1cf>
        filp->f_ops = NULL;//&keyboard_fops;	//////	find device file operation function
  807671:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807675:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  80767c:	00 
  80767d:	eb 14                	jmp    807693 <sys_open+0x1e3>
    else
        filp->f_ops = dentry->dir_inode->f_ops;
  80767f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807683:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807687:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  80768b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80768f:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    if(filp->f_ops && filp->f_ops->open)
  807693:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807697:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80769b:	48 85 c0             	test   rax,rax
  80769e:	74 33                	je     8076d3 <sys_open+0x223>
  8076a0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8076a4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8076a8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8076ab:	48 85 c0             	test   rax,rax
  8076ae:	74 23                	je     8076d3 <sys_open+0x223>
        error = filp->f_ops->open(dentry->dir_inode,filp);
  8076b0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8076b4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8076b8:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8076bb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8076bf:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8076c3:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8076c7:	48 89 d6             	mov    rsi,rdx
  8076ca:	48 89 c7             	mov    rdi,rax
  8076cd:	ff d1                	call   rcx
  8076cf:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(error != 1)
  8076d3:	48 83 7d f8 01       	cmp    QWORD PTR [rbp-0x8],0x1
  8076d8:	74 18                	je     8076f2 <sys_open+0x242>
    {
        vmfree(filp);
  8076da:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8076de:	48 89 c7             	mov    rdi,rax
  8076e1:	e8 62 9c ff ff       	call   801348 <vmfree>
        return -EFAULT;
  8076e6:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  8076ed:	e9 d3 00 00 00       	jmp    8077c5 <sys_open+0x315>
    }

    if(filp->mode & O_TRUNC)
  8076f2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8076f6:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8076fa:	25 00 02 00 00       	and    eax,0x200
  8076ff:	48 85 c0             	test   rax,rax
  807702:	74 13                	je     807717 <sys_open+0x267>
    {
        filp->dentry->dir_inode->file_size = 0;
  807704:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807708:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80770c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807710:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }
    if(filp->mode & O_APPEND)
  807717:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80771b:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80771f:	25 00 04 00 00       	and    eax,0x400
  807724:	48 85 c0             	test   rax,rax
  807727:	74 19                	je     807742 <sys_open+0x292>
    {
        filp->position = filp->dentry->dir_inode->file_size;
  807729:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80772d:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807731:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807735:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807738:	48 89 c2             	mov    rdx,rax
  80773b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80773f:	48 89 10             	mov    QWORD PTR [rax],rdx
    }

    f = current->openf;
  807742:	48 8b 05 57 de c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0de57]        # 4155a0 <current>
  807749:	48 05 d8 00 00 00    	add    rax,0xd8
  80774f:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    for(i = 0;i < MAX_TASKS;i++)
  807753:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80775a:	eb 28                	jmp    807784 <sys_open+0x2d4>
        if(f[i] == NULL)
  80775c:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80775f:	48 98                	cdqe   
  807761:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  807768:	00 
  807769:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80776d:	48 01 d0             	add    rax,rdx
  807770:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807773:	48 85 c0             	test   rax,rax
  807776:	75 08                	jne    807780 <sys_open+0x2d0>
        {
            fd = i;
  807778:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80777b:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            break;
  80777e:	eb 0a                	jmp    80778a <sys_open+0x2da>
    for(i = 0;i < MAX_TASKS;i++)
  807780:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  807784:	83 7d f0 1f          	cmp    DWORD PTR [rbp-0x10],0x1f
  807788:	7e d2                	jle    80775c <sys_open+0x2ac>
        }
    if(i == MAX_TASKS)
  80778a:	83 7d f0 20          	cmp    DWORD PTR [rbp-0x10],0x20
  80778e:	75 15                	jne    8077a5 <sys_open+0x2f5>
    {
        vmfree(filp);
  807790:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807794:	48 89 c7             	mov    rdi,rax
  807797:	e8 ac 9b ff ff       	call   801348 <vmfree>
        //// reclaim struct index_node & struct dir_entry
        return -EMFILE;
  80779c:	48 c7 c0 df ff ff ff 	mov    rax,0xffffffffffffffdf
  8077a3:	eb 20                	jmp    8077c5 <sys_open+0x315>
    }
    f[fd] = filp;
  8077a5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8077a8:	48 98                	cdqe   
  8077aa:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8077b1:	00 
  8077b2:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8077b6:	48 01 c2             	add    rdx,rax
  8077b9:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8077bd:	48 89 02             	mov    QWORD PTR [rdx],rax

    return fd;
  8077c0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8077c3:	48 98                	cdqe   
}
  8077c5:	c9                   	leave  
  8077c6:	c3                   	ret    

00000000008077c7 <sys_close>:

unsigned long sys_close(int fd)
{
  8077c7:	f3 0f 1e fa          	endbr64 
  8077cb:	55                   	push   rbp
  8077cc:	48 89 e5             	mov    rbp,rsp
  8077cf:	48 83 ec 20          	sub    rsp,0x20
  8077d3:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    struct file * filp = NULL;
  8077d6:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8077dd:	00 

//	printf("sys_close:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  8077de:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8077e2:	78 06                	js     8077ea <sys_close+0x23>
  8077e4:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  8077e8:	7e 0c                	jle    8077f6 <sys_close+0x2f>
        return -EBADF;
  8077ea:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  8077f1:	e9 87 00 00 00       	jmp    80787d <sys_close+0xb6>

    filp = current->openf[fd];
  8077f6:	48 8b 05 a3 dd c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0dda3]        # 4155a0 <current>
  8077fd:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807800:	48 63 d2             	movsxd rdx,edx
  807803:	48 83 c2 1a          	add    rdx,0x1a
  807807:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  80780c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(filp->f_ops && filp->f_ops->close)
  807810:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807814:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807818:	48 85 c0             	test   rax,rax
  80781b:	74 35                	je     807852 <sys_close+0x8b>
  80781d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807821:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807825:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  807829:	48 85 c0             	test   rax,rax
  80782c:	74 24                	je     807852 <sys_close+0x8b>
        filp->f_ops->close(filp->dentry->dir_inode,filp);
  80782e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807832:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807836:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  80783a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80783e:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807842:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807846:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80784a:	48 89 d6             	mov    rsi,rdx
  80784d:	48 89 c7             	mov    rdi,rax
  807850:	ff d1                	call   rcx

    vmfree(filp);
  807852:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807856:	48 89 c7             	mov    rdi,rax
  807859:	e8 ea 9a ff ff       	call   801348 <vmfree>
    current->openf[fd] = NULL;
  80785e:	48 8b 05 3b dd c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0dd3b]        # 4155a0 <current>
  807865:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807868:	48 63 d2             	movsxd rdx,edx
  80786b:	48 83 c2 1a          	add    rdx,0x1a
  80786f:	48 c7 44 d0 08 00 00 	mov    QWORD PTR [rax+rdx*8+0x8],0x0
  807876:	00 00 

    return 0;
  807878:	b8 00 00 00 00       	mov    eax,0x0
}
  80787d:	c9                   	leave  
  80787e:	c3                   	ret    

000000000080787f <sys_read>:

unsigned long sys_read(int fd,void * buf,long count)
{
  80787f:	f3 0f 1e fa          	endbr64 
  807883:	55                   	push   rbp
  807884:	48 89 e5             	mov    rbp,rsp
  807887:	48 83 ec 30          	sub    rsp,0x30
  80788b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80788e:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  807892:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  807896:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80789d:	00 
    unsigned long ret = 0;
  80789e:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8078a5:	00 

//	printf("sys_read:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  8078a6:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8078aa:	78 06                	js     8078b2 <sys_read+0x33>
  8078ac:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  8078b0:	7e 09                	jle    8078bb <sys_read+0x3c>
        return -EBADF;
  8078b2:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  8078b9:	eb 72                	jmp    80792d <sys_read+0xae>
    if(count < 0)
  8078bb:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  8078c0:	79 09                	jns    8078cb <sys_read+0x4c>
        return -EINVAL;
  8078c2:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  8078c9:	eb 62                	jmp    80792d <sys_read+0xae>

    filp = current->openf[fd];
  8078cb:	48 8b 05 ce dc c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0dcce]        # 4155a0 <current>
  8078d2:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8078d5:	48 63 d2             	movsxd rdx,edx
  8078d8:	48 83 c2 1a          	add    rdx,0x1a
  8078dc:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  8078e1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->read)
  8078e5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8078e9:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8078ed:	48 85 c0             	test   rax,rax
  8078f0:	74 37                	je     807929 <sys_read+0xaa>
  8078f2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8078f6:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8078fa:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8078fe:	48 85 c0             	test   rax,rax
  807901:	74 26                	je     807929 <sys_read+0xaa>
        ret = filp->f_ops->read(filp,buf,count,&filp->position);
  807903:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807907:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80790b:	4c 8b 40 10          	mov    r8,QWORD PTR [rax+0x10]
  80790f:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  807913:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  807917:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  80791b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80791f:	48 89 c7             	mov    rdi,rax
  807922:	41 ff d0             	call   r8
  807925:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  807929:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80792d:	c9                   	leave  
  80792e:	c3                   	ret    

000000000080792f <sys_write>:

unsigned long sys_write(int fd,void * buf,long count)
{
  80792f:	f3 0f 1e fa          	endbr64 
  807933:	55                   	push   rbp
  807934:	48 89 e5             	mov    rbp,rsp
  807937:	48 83 ec 30          	sub    rsp,0x30
  80793b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80793e:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  807942:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  807946:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80794d:	00 
    unsigned long ret = 0;
  80794e:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807955:	00 

//	printf("sys_write:%d\n",fd);
    if(fd < 0 || fd >= MAX_TASKS)
  807956:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80795a:	78 06                	js     807962 <sys_write+0x33>
  80795c:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  807960:	7e 09                	jle    80796b <sys_write+0x3c>
        return -EBADF;
  807962:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  807969:	eb 72                	jmp    8079dd <sys_write+0xae>
    if(count < 0)
  80796b:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  807970:	79 09                	jns    80797b <sys_write+0x4c>
        return -EINVAL;
  807972:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  807979:	eb 62                	jmp    8079dd <sys_write+0xae>

    filp = current->openf[fd];
  80797b:	48 8b 05 1e dc c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0dc1e]        # 4155a0 <current>
  807982:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807985:	48 63 d2             	movsxd rdx,edx
  807988:	48 83 c2 1a          	add    rdx,0x1a
  80798c:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  807991:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->write)
  807995:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807999:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80799d:	48 85 c0             	test   rax,rax
  8079a0:	74 37                	je     8079d9 <sys_write+0xaa>
  8079a2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8079a6:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8079aa:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8079ae:	48 85 c0             	test   rax,rax
  8079b1:	74 26                	je     8079d9 <sys_write+0xaa>
        ret = filp->f_ops->write(filp,buf,count,&filp->position);
  8079b3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8079b7:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8079bb:	4c 8b 40 18          	mov    r8,QWORD PTR [rax+0x18]
  8079bf:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  8079c3:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8079c7:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  8079cb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8079cf:	48 89 c7             	mov    rdi,rax
  8079d2:	41 ff d0             	call   r8
  8079d5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  8079d9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  8079dd:	c9                   	leave  
  8079de:	c3                   	ret    

00000000008079df <sys_lseek>:


unsigned long sys_lseek(int filds,long offset,int whence)
{
  8079df:	f3 0f 1e fa          	endbr64 
  8079e3:	55                   	push   rbp
  8079e4:	48 89 e5             	mov    rbp,rsp
  8079e7:	48 83 ec 20          	sub    rsp,0x20
  8079eb:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8079ee:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8079f2:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    struct file * filp = NULL;
  8079f5:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8079fc:	00 
    unsigned long ret = 0;
  8079fd:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807a04:	00 

//	printf("sys_lseek:%d\n",filds);
    if(filds < 0 || filds >= MAX_TASKS)
  807a05:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  807a09:	78 06                	js     807a11 <sys_lseek+0x32>
  807a0b:	83 7d ec 1f          	cmp    DWORD PTR [rbp-0x14],0x1f
  807a0f:	7e 09                	jle    807a1a <sys_lseek+0x3b>
        return -EBADF;
  807a11:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  807a18:	eb 78                	jmp    807a92 <sys_lseek+0xb3>
    if(whence < 0 || whence >= SEEK_MAX)
  807a1a:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  807a1e:	78 06                	js     807a26 <sys_lseek+0x47>
  807a20:	83 7d e8 02          	cmp    DWORD PTR [rbp-0x18],0x2
  807a24:	7e 09                	jle    807a2f <sys_lseek+0x50>
        return -EINVAL;
  807a26:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  807a2d:	eb 63                	jmp    807a92 <sys_lseek+0xb3>

    filp = current->openf[filds];
  807a2f:	48 8b 05 6a db c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0db6a]        # 4155a0 <current>
  807a36:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807a39:	48 63 d2             	movsxd rdx,edx
  807a3c:	48 83 c2 1a          	add    rdx,0x1a
  807a40:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  807a45:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->lseek)
  807a49:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807a4d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807a51:	48 85 c0             	test   rax,rax
  807a54:	74 38                	je     807a8e <sys_lseek+0xaf>
  807a56:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807a5a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807a5e:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  807a62:	48 85 c0             	test   rax,rax
  807a65:	74 27                	je     807a8e <sys_lseek+0xaf>
        ret = filp->f_ops->lseek(filp,offset,whence);
  807a67:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807a6b:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807a6f:	4c 8b 40 20          	mov    r8,QWORD PTR [rax+0x20]
  807a73:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807a76:	48 63 d0             	movsxd rdx,eax
  807a79:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  807a7d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807a81:	48 89 ce             	mov    rsi,rcx
  807a84:	48 89 c7             	mov    rdi,rax
  807a87:	41 ff d0             	call   r8
  807a8a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  807a8e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  807a92:	c9                   	leave  
  807a93:	c3                   	ret    

0000000000807a94 <sys_vfork>:
//    printf("sys_fork\n");
//    //return do_fork(regs,0,regs->rsp,0);
//}

unsigned long sys_vfork()
{
  807a94:	f3 0f 1e fa          	endbr64 
  807a98:	55                   	push   rbp
  807a99:	48 89 e5             	mov    rbp,rsp
  807a9c:	48 83 ec 10          	sub    rsp,0x10
    regs_t *regs = (regs_t *)current->tss.rsp0 -1;
  807aa0:	48 8b 05 f9 da c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0daf9]        # 4155a0 <current>
  807aa7:	48 8b 80 dc 01 00 00 	mov    rax,QWORD PTR [rax+0x1dc]
  807aae:	48 2d d0 00 00 00    	sub    rax,0xd0
  807ab4:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    printf("sys_vfork\n");
  807ab8:	bf 38 40 81 00       	mov    edi,0x814038
  807abd:	b8 00 00 00 00       	mov    eax,0x0
  807ac2:	e8 60 92 ff ff       	call   800d27 <printf>
    //return do_fork(regs,CLONE_VM | CLONE_FS | CLONE_SIGNAL,regs->rsp,0);
}
  807ac7:	90                   	nop
  807ac8:	c9                   	leave  
  807ac9:	c3                   	ret    

0000000000807aca <sys_wait4>:
/*
	rusage reserved
*/

unsigned long sys_wait4(unsigned long pid,int *status,int options,void *rusage)
{
  807aca:	f3 0f 1e fa          	endbr64 
  807ace:	55                   	push   rbp
  807acf:	48 89 e5             	mov    rbp,rsp
  807ad2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  807ad6:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  807ada:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  807add:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
//    copy_to_user(&child->exit_code,status,sizeof(long));
//    tsk->next = child->next;
//    exit_mm(child);
//    vmfree(child);
//    return retval;
}
  807ae1:	90                   	nop
  807ae2:	5d                   	pop    rbp
  807ae3:	c3                   	ret    

0000000000807ae4 <sys_brk>:

unsigned long sys_brk(unsigned long brk)
{
  807ae4:	f3 0f 1e fa          	endbr64 
  807ae8:	55                   	push   rbp
  807ae9:	48 89 e5             	mov    rbp,rsp
  807aec:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//
//    new_brk = do_brk(current->mm->end_brk,new_brk - current->mm->end_brk);	//expand brk space
//
//    current->mm->end_brk = new_brk;
//    return new_brk;
}
  807af0:	90                   	nop
  807af1:	5d                   	pop    rbp
  807af2:	c3                   	ret    

0000000000807af3 <sys_reboot>:

unsigned long sys_reboot(unsigned long cmd,void * arg)
{
  807af3:	f3 0f 1e fa          	endbr64 
  807af7:	55                   	push   rbp
  807af8:	48 89 e5             	mov    rbp,rsp
  807afb:	48 83 ec 10          	sub    rsp,0x10
  807aff:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  807b03:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    printf("sys_reboot\n");
  807b07:	bf 43 40 81 00       	mov    edi,0x814043
  807b0c:	b8 00 00 00 00       	mov    eax,0x0
  807b11:	e8 11 92 ff ff       	call   800d27 <printf>
    switch(cmd)
  807b16:	48 83 7d f8 01       	cmp    QWORD PTR [rbp-0x8],0x1
  807b1b:	74 09                	je     807b26 <sys_reboot+0x33>
  807b1d:	48 83 7d f8 02       	cmp    QWORD PTR [rbp-0x8],0x2
  807b22:	74 13                	je     807b37 <sys_reboot+0x44>
  807b24:	eb 22                	jmp    807b48 <sys_reboot+0x55>
    {
        case SYSTEM_REBOOT:
            outb(0x64,0xFE);
  807b26:	be fe 00 00 00       	mov    esi,0xfe
  807b2b:	bf 64 00 00 00       	mov    edi,0x64
  807b30:	e8 eb df ff ff       	call   805b20 <outb>
            break;
  807b35:	eb 21                	jmp    807b58 <sys_reboot+0x65>

        case SYSTEM_POWEROFF:
            printf("sys_reboot cmd SYSTEM_POWEROFF\n");
  807b37:	bf 50 40 81 00       	mov    edi,0x814050
  807b3c:	b8 00 00 00 00       	mov    eax,0x0
  807b41:	e8 e1 91 ff ff       	call   800d27 <printf>
            break;
  807b46:	eb 10                	jmp    807b58 <sys_reboot+0x65>

        default:
            printf("sys_reboot cmd ERROR!\n");
  807b48:	bf 70 40 81 00       	mov    edi,0x814070
  807b4d:	b8 00 00 00 00       	mov    eax,0x0
  807b52:	e8 d0 91 ff ff       	call   800d27 <printf>
            break;
  807b57:	90                   	nop
    }
    return 0;
  807b58:	b8 00 00 00 00       	mov    eax,0x0
}
  807b5d:	c9                   	leave  
  807b5e:	c3                   	ret    

0000000000807b5f <sys_chdir>:


unsigned long sys_chdir(char *filename)
{
  807b5f:	f3 0f 1e fa          	endbr64 
  807b63:	55                   	push   rbp
  807b64:	48 89 e5             	mov    rbp,rsp
  807b67:	48 83 ec 30          	sub    rsp,0x30
  807b6b:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char * path = NULL;
  807b6f:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807b76:	00 
    long pathlen = 0;
  807b77:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  807b7e:	00 
    struct dir_entry * dentry = NULL;
  807b7f:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  807b86:	00 

    printf("sys_chdir\n");
  807b87:	bf 87 40 81 00       	mov    edi,0x814087
  807b8c:	b8 00 00 00 00       	mov    eax,0x0
  807b91:	e8 91 91 ff ff       	call   800d27 <printf>
    path = (char *)vmalloc();
  807b96:	b8 00 00 00 00       	mov    eax,0x0
  807b9b:	e8 19 97 ff ff       	call   8012b9 <vmalloc>
  807ba0:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    if(path == NULL)
  807ba4:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  807ba9:	75 0c                	jne    807bb7 <sys_chdir+0x58>
        return -ENOMEM;
  807bab:	48 c7 c0 cf ff ff ff 	mov    rax,0xffffffffffffffcf
  807bb2:	e9 ca 00 00 00       	jmp    807c81 <sys_chdir+0x122>
    memset(path,0,PAGE_4K_SIZE);
  807bb7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807bbb:	ba 00 10 00 00       	mov    edx,0x1000
  807bc0:	be 00 00 00 00       	mov    esi,0x0
  807bc5:	48 89 c7             	mov    rdi,rax
  807bc8:	e8 27 3e 00 00       	call   80b9f4 <memset>
    pathlen = strlen(filename);
  807bcd:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807bd1:	48 89 c7             	mov    rdi,rax
  807bd4:	e8 89 40 00 00       	call   80bc62 <strlen>
  807bd9:	48 98                	cdqe   
  807bdb:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(pathlen <= 0)
  807bdf:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  807be4:	7f 18                	jg     807bfe <sys_chdir+0x9f>
    {
        vmfree(path);
  807be6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807bea:	48 89 c7             	mov    rdi,rax
  807bed:	e8 56 97 ff ff       	call   801348 <vmfree>
        return -EFAULT;
  807bf2:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  807bf9:	e9 83 00 00 00       	jmp    807c81 <sys_chdir+0x122>
    }
    else if(pathlen >= PAGE_4K_SIZE)
  807bfe:	48 81 7d f0 ff 0f 00 	cmp    QWORD PTR [rbp-0x10],0xfff
  807c05:	00 
  807c06:	7e 15                	jle    807c1d <sys_chdir+0xbe>
    {
        vmfree(path);
  807c08:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807c0c:	48 89 c7             	mov    rdi,rax
  807c0f:	e8 34 97 ff ff       	call   801348 <vmfree>
        return -ENAMETOOLONG;
  807c14:	48 c7 c0 db ff ff ff 	mov    rax,0xffffffffffffffdb
  807c1b:	eb 64                	jmp    807c81 <sys_chdir+0x122>
    }
    strcpy(filename,path);
  807c1d:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  807c21:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807c25:	48 89 d6             	mov    rsi,rdx
  807c28:	48 89 c7             	mov    rdi,rax
  807c2b:	e8 13 3e 00 00       	call   80ba43 <strcpy>

    dentry = path_walk(path,0);
  807c30:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807c34:	be 00 00 00 00       	mov    esi,0x0
  807c39:	48 89 c7             	mov    rdi,rax
  807c3c:	e8 49 f4 ff ff       	call   80708a <path_walk>
  807c41:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    vmfree(path);
  807c45:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807c49:	48 89 c7             	mov    rdi,rax
  807c4c:	e8 f7 96 ff ff       	call   801348 <vmfree>

    if(dentry == NULL)
  807c51:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  807c56:	75 09                	jne    807c61 <sys_chdir+0x102>
        return -ENOENT;
  807c58:	48 c7 c0 d3 ff ff ff 	mov    rax,0xffffffffffffffd3
  807c5f:	eb 20                	jmp    807c81 <sys_chdir+0x122>
    if(dentry->dir_inode->attribute != FS_ATTR_DIR)
  807c61:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807c65:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807c69:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807c6d:	48 83 f8 02          	cmp    rax,0x2
  807c71:	74 09                	je     807c7c <sys_chdir+0x11d>
        return -ENOTDIR;
  807c73:	48 c7 c0 c7 ff ff ff 	mov    rax,0xffffffffffffffc7
  807c7a:	eb 05                	jmp    807c81 <sys_chdir+0x122>
    return 0;
  807c7c:	b8 00 00 00 00       	mov    eax,0x0
}
  807c81:	c9                   	leave  
  807c82:	c3                   	ret    

0000000000807c83 <sys_getdents>:

unsigned long sys_getdents(int fd, void * dirent, long count)
{
  807c83:	f3 0f 1e fa          	endbr64 
  807c87:	55                   	push   rbp
  807c88:	48 89 e5             	mov    rbp,rsp
  807c8b:	48 83 ec 30          	sub    rsp,0x30
  807c8f:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  807c92:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  807c96:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file * filp = NULL;
  807c9a:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  807ca1:	00 
    unsigned long ret = 0;
  807ca2:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  807ca9:	00 

//	printf("sys_getdents:%d\n",fd);
    if(fd < 0 || fd > MAX_TASKS)
  807caa:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  807cae:	78 06                	js     807cb6 <sys_getdents+0x33>
  807cb0:	83 7d ec 20          	cmp    DWORD PTR [rbp-0x14],0x20
  807cb4:	7e 09                	jle    807cbf <sys_getdents+0x3c>
        return -EBADF;
  807cb6:	48 c7 c0 f8 ff ff ff 	mov    rax,0xfffffffffffffff8
  807cbd:	eb 72                	jmp    807d31 <sys_getdents+0xae>
    if(count < 0)
  807cbf:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  807cc4:	79 09                	jns    807ccf <sys_getdents+0x4c>
        return -EINVAL;
  807cc6:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  807ccd:	eb 62                	jmp    807d31 <sys_getdents+0xae>

    filp = current->openf[fd];
  807ccf:	48 8b 05 ca d8 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0d8ca]        # 4155a0 <current>
  807cd6:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  807cd9:	48 63 d2             	movsxd rdx,edx
  807cdc:	48 83 c2 1a          	add    rdx,0x1a
  807ce0:	48 8b 44 d0 08       	mov    rax,QWORD PTR [rax+rdx*8+0x8]
  807ce5:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(filp->f_ops && filp->f_ops->readdir)
  807ce9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807ced:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807cf1:	48 85 c0             	test   rax,rax
  807cf4:	74 37                	je     807d2d <sys_getdents+0xaa>
  807cf6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807cfa:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807cfe:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807d02:	48 85 c0             	test   rax,rax
  807d05:	74 26                	je     807d2d <sys_getdents+0xaa>
        ret = filp->f_ops->readdir(filp,dirent,&fill_dentry);
  807d07:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807d0b:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807d0f:	4c 8b 40 30          	mov    r8,QWORD PTR [rax+0x30]
  807d13:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  807d17:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807d1b:	ba 06 73 80 00       	mov    edx,0x807306
  807d20:	48 89 ce             	mov    rsi,rcx
  807d23:	48 89 c7             	mov    rdi,rax
  807d26:	41 ff d0             	call   r8
  807d29:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    return ret;
  807d2d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  807d31:	c9                   	leave  
  807d32:	c3                   	ret    

0000000000807d33 <shift>:
/* 0x5D - Apps      */ {  0,        0,       0x5D,      0x5D }
        };
char k_shift=0,k_ctrl=0,k_capslock=0;

void shift()
{
  807d33:	f3 0f 1e fa          	endbr64 
  807d37:	55                   	push   rbp
  807d38:	48 89 e5             	mov    rbp,rsp
    k_shift=!k_shift;
  807d3b:	0f b6 05 8b 0b c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20b8b]        # 4288cd <k_shift>
  807d42:	84 c0                	test   al,al
  807d44:	0f 94 c0             	sete   al
  807d47:	88 05 80 0b c2 ff    	mov    BYTE PTR [rip+0xffffffffffc20b80],al        # 4288cd <k_shift>
}
  807d4d:	90                   	nop
  807d4e:	5d                   	pop    rbp
  807d4f:	c3                   	ret    

0000000000807d50 <ctrl>:
void ctrl()
{
  807d50:	f3 0f 1e fa          	endbr64 
  807d54:	55                   	push   rbp
  807d55:	48 89 e5             	mov    rbp,rsp
    k_ctrl=!k_ctrl;
  807d58:	0f b6 05 6f 0b c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20b6f]        # 4288ce <k_ctrl>
  807d5f:	84 c0                	test   al,al
  807d61:	0f 94 c0             	sete   al
  807d64:	88 05 64 0b c2 ff    	mov    BYTE PTR [rip+0xffffffffffc20b64],al        # 4288ce <k_ctrl>
}
  807d6a:	90                   	nop
  807d6b:	5d                   	pop    rbp
  807d6c:	c3                   	ret    

0000000000807d6d <capslock>:
void capslock()
{
  807d6d:	f3 0f 1e fa          	endbr64 
  807d71:	55                   	push   rbp
  807d72:	48 89 e5             	mov    rbp,rsp
    k_capslock=k_capslock==0?1:0;
  807d75:	0f b6 05 53 0b c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20b53]        # 4288cf <k_capslock>
  807d7c:	84 c0                	test   al,al
  807d7e:	0f 94 c0             	sete   al
  807d81:	88 05 48 0b c2 ff    	mov    BYTE PTR [rip+0xffffffffffc20b48],al        # 4288cf <k_capslock>
}
  807d87:	90                   	nop
  807d88:	5d                   	pop    rbp
  807d89:	c3                   	ret    

0000000000807d8a <to_ascii>:
char to_ascii(char scan_code)
{
  807d8a:	f3 0f 1e fa          	endbr64 
  807d8e:	55                   	push   rbp
  807d8f:	48 89 e5             	mov    rbp,rsp
  807d92:	89 f8                	mov    eax,edi
  807d94:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  807d97:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  807d9e:	e9 c7 00 00 00       	jmp    807e6a <to_ascii+0xe0>
        if(key_map[i].scan_code==scan_code)
  807da3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807da6:	48 63 d0             	movsxd rdx,eax
  807da9:	48 89 d0             	mov    rax,rdx
  807dac:	48 c1 e0 02          	shl    rax,0x2
  807db0:	48 01 d0             	add    rax,rdx
  807db3:	48 05 02 42 81 00    	add    rax,0x814202
  807db9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807dbc:	38 45 ec             	cmp    BYTE PTR [rbp-0x14],al
  807dbf:	0f 85 a1 00 00 00    	jne    807e66 <to_ascii+0xdc>
        {
            if(k_capslock&&key_map[i].ascii>='a'&&key_map[i].ascii<='z')return key_map[i].ascii_shift;
  807dc5:	0f b6 05 03 0b c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20b03]        # 4288cf <k_capslock>
  807dcc:	84 c0                	test   al,al
  807dce:	74 55                	je     807e25 <to_ascii+0x9b>
  807dd0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807dd3:	48 63 d0             	movsxd rdx,eax
  807dd6:	48 89 d0             	mov    rax,rdx
  807dd9:	48 c1 e0 02          	shl    rax,0x2
  807ddd:	48 01 d0             	add    rax,rdx
  807de0:	48 05 00 42 81 00    	add    rax,0x814200
  807de6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807de9:	3c 60                	cmp    al,0x60
  807deb:	7e 38                	jle    807e25 <to_ascii+0x9b>
  807ded:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807df0:	48 63 d0             	movsxd rdx,eax
  807df3:	48 89 d0             	mov    rax,rdx
  807df6:	48 c1 e0 02          	shl    rax,0x2
  807dfa:	48 01 d0             	add    rax,rdx
  807dfd:	48 05 00 42 81 00    	add    rax,0x814200
  807e03:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807e06:	3c 7a                	cmp    al,0x7a
  807e08:	7f 1b                	jg     807e25 <to_ascii+0x9b>
  807e0a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807e0d:	48 63 d0             	movsxd rdx,eax
  807e10:	48 89 d0             	mov    rax,rdx
  807e13:	48 c1 e0 02          	shl    rax,0x2
  807e17:	48 01 d0             	add    rax,rdx
  807e1a:	48 05 01 42 81 00    	add    rax,0x814201
  807e20:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807e23:	eb 54                	jmp    807e79 <to_ascii+0xef>
            else if(k_shift)return key_map[i].ascii_shift;
  807e25:	0f b6 05 a1 0a c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20aa1]        # 4288cd <k_shift>
  807e2c:	84 c0                	test   al,al
  807e2e:	74 1b                	je     807e4b <to_ascii+0xc1>
  807e30:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807e33:	48 63 d0             	movsxd rdx,eax
  807e36:	48 89 d0             	mov    rax,rdx
  807e39:	48 c1 e0 02          	shl    rax,0x2
  807e3d:	48 01 d0             	add    rax,rdx
  807e40:	48 05 01 42 81 00    	add    rax,0x814201
  807e46:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807e49:	eb 2e                	jmp    807e79 <to_ascii+0xef>
            else return key_map[i].ascii;
  807e4b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807e4e:	48 63 d0             	movsxd rdx,eax
  807e51:	48 89 d0             	mov    rax,rdx
  807e54:	48 c1 e0 02          	shl    rax,0x2
  807e58:	48 01 d0             	add    rax,rdx
  807e5b:	48 05 00 42 81 00    	add    rax,0x814200
  807e61:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807e64:	eb 13                	jmp    807e79 <to_ascii+0xef>
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  807e66:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807e6a:	83 7d fc 5d          	cmp    DWORD PTR [rbp-0x4],0x5d
  807e6e:	0f 8e 2f ff ff ff    	jle    807da3 <to_ascii+0x19>
        }

    return '\0';
  807e74:	b8 00 00 00 00       	mov    eax,0x0
}
  807e79:	5d                   	pop    rbp
  807e7a:	c3                   	ret    

0000000000807e7b <init_kb>:
int init_kb()
{
  807e7b:	f3 0f 1e fa          	endbr64 
  807e7f:	55                   	push   rbp
  807e80:	48 89 e5             	mov    rbp,rsp
    reg_device(&dev_keyboard);
  807e83:	bf 40 41 81 00       	mov    edi,0x814140
  807e88:	e8 46 a7 ff ff       	call   8025d3 <reg_device>
    reg_driver(&drv_keyboard);
  807e8d:	bf a0 40 81 00       	mov    edi,0x8140a0
  807e92:	e8 24 aa ff ff       	call   8028bb <reg_driver>
}
  807e97:	90                   	nop
  807e98:	5d                   	pop    rbp
  807e99:	c3                   	ret    

0000000000807e9a <key_proc>:
int key_proc()
{
  807e9a:	f3 0f 1e fa          	endbr64 
  807e9e:	55                   	push   rbp
  807e9f:	48 89 e5             	mov    rbp,rsp
  807ea2:	48 83 ec 10          	sub    rsp,0x10
    asm volatile("cli");
  807ea6:	fa                   	cli    
    //获取完整的扫描码
    u8 scan1=0,scan2=0,ch=0;
  807ea7:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
  807eab:	c6 45 fe 00          	mov    BYTE PTR [rbp-0x2],0x0
  807eaf:	c6 45 fd 00          	mov    BYTE PTR [rbp-0x3],0x0
    key_code tmpc;
    scan1=inb(0x60);
  807eb3:	bf 60 00 00 00       	mov    edi,0x60
  807eb8:	e8 7c dc ff ff       	call   805b39 <inb>
  807ebd:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
//    tmpc.scan_code2=scan2;
//    tmpc.ascii= ch;


//    ENQUEUE(key_bufq,tmpc)
    if((key_bufq.tail+1)%key_bufq.size!=key_bufq.head)
  807ec0:	8b 05 46 45 00 00    	mov    eax,DWORD PTR [rip+0x4546]        # 80c40c <key_bufq+0xc>
  807ec6:	83 c0 01             	add    eax,0x1
  807ec9:	8b 0d 41 45 00 00    	mov    ecx,DWORD PTR [rip+0x4541]        # 80c410 <key_bufq+0x10>
  807ecf:	99                   	cdq    
  807ed0:	f7 f9                	idiv   ecx
  807ed2:	8b 05 30 45 00 00    	mov    eax,DWORD PTR [rip+0x4530]        # 80c408 <key_bufq+0x8>
  807ed8:	39 c2                	cmp    edx,eax
  807eda:	74 32                	je     807f0e <key_proc+0x74>
    {
        key_bufq.data[key_bufq.tail]=scan1;
  807edc:	48 8b 15 1d 45 00 00 	mov    rdx,QWORD PTR [rip+0x451d]        # 80c400 <key_bufq>
  807ee3:	8b 05 23 45 00 00    	mov    eax,DWORD PTR [rip+0x4523]        # 80c40c <key_bufq+0xc>
  807ee9:	48 98                	cdqe   
  807eeb:	48 01 c2             	add    rdx,rax
  807eee:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  807ef2:	88 02                	mov    BYTE PTR [rdx],al
        key_bufq.tail=(key_bufq.tail+1)%key_bufq.size;
  807ef4:	8b 05 12 45 00 00    	mov    eax,DWORD PTR [rip+0x4512]        # 80c40c <key_bufq+0xc>
  807efa:	83 c0 01             	add    eax,0x1
  807efd:	8b 0d 0d 45 00 00    	mov    ecx,DWORD PTR [rip+0x450d]        # 80c410 <key_bufq+0x10>
  807f03:	99                   	cdq    
  807f04:	f7 f9                	idiv   ecx
  807f06:	89 d0                	mov    eax,edx
  807f08:	89 05 fe 44 00 00    	mov    DWORD PTR [rip+0x44fe],eax        # 80c40c <key_bufq+0xc>
    }

    if(scan1==0x48)
  807f0e:	80 7d ff 48          	cmp    BYTE PTR [rbp-0x1],0x48
  807f12:	75 0a                	jne    807f1e <key_proc+0x84>
        scr_up();
  807f14:	b8 00 00 00 00       	mov    eax,0x0
  807f19:	e8 12 ee ff ff       	call   806d30 <scr_up>
    if(scan1==0x50)
  807f1e:	80 7d ff 50          	cmp    BYTE PTR [rbp-0x1],0x50
  807f22:	75 0a                	jne    807f2e <key_proc+0x94>
        scr_down();
  807f24:	b8 00 00 00 00       	mov    eax,0x0
  807f29:	e8 9c ee ff ff       	call   806dca <scr_down>
    switch (scan1)
  807f2e:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  807f32:	3d b6 00 00 00       	cmp    eax,0xb6
  807f37:	74 41                	je     807f7a <key_proc+0xe0>
  807f39:	3d b6 00 00 00       	cmp    eax,0xb6
  807f3e:	7f 5e                	jg     807f9e <key_proc+0x104>
  807f40:	3d aa 00 00 00       	cmp    eax,0xaa
  807f45:	74 33                	je     807f7a <key_proc+0xe0>
  807f47:	3d aa 00 00 00       	cmp    eax,0xaa
  807f4c:	7f 50                	jg     807f9e <key_proc+0x104>
  807f4e:	3d 9d 00 00 00       	cmp    eax,0x9d
  807f53:	74 31                	je     807f86 <key_proc+0xec>
  807f55:	3d 9d 00 00 00       	cmp    eax,0x9d
  807f5a:	7f 42                	jg     807f9e <key_proc+0x104>
  807f5c:	83 f8 3a             	cmp    eax,0x3a
  807f5f:	74 31                	je     807f92 <key_proc+0xf8>
  807f61:	83 f8 3a             	cmp    eax,0x3a
  807f64:	7f 38                	jg     807f9e <key_proc+0x104>
  807f66:	83 f8 36             	cmp    eax,0x36
  807f69:	74 0f                	je     807f7a <key_proc+0xe0>
  807f6b:	83 f8 36             	cmp    eax,0x36
  807f6e:	7f 2e                	jg     807f9e <key_proc+0x104>
  807f70:	83 f8 1d             	cmp    eax,0x1d
  807f73:	74 11                	je     807f86 <key_proc+0xec>
  807f75:	83 f8 2a             	cmp    eax,0x2a
  807f78:	75 24                	jne    807f9e <key_proc+0x104>
    {
        case 0x36:
        case 0x2a:
        case 0xaa:
        case 0xb6:
            shift();
  807f7a:	b8 00 00 00 00       	mov    eax,0x0
  807f7f:	e8 af fd ff ff       	call   807d33 <shift>
            break;
  807f84:	eb 19                	jmp    807f9f <key_proc+0x105>
        case 0x1d:
        case 0x9d:
            ctrl();
  807f86:	b8 00 00 00 00       	mov    eax,0x0
  807f8b:	e8 c0 fd ff ff       	call   807d50 <ctrl>
            break;
  807f90:	eb 0d                	jmp    807f9f <key_proc+0x105>
        case 0x3a:
            capslock();
  807f92:	b8 00 00 00 00       	mov    eax,0x0
  807f97:	e8 d1 fd ff ff       	call   807d6d <capslock>
            break;
  807f9c:	eb 01                	jmp    807f9f <key_proc+0x105>
        default:
            break;
  807f9e:	90                   	nop
//        //logf("%x\n",stdin.w_ptr);
//        //print_stdin();
//        //printchar(ch);
//        //flush_screen(0);*/
//    }
    eoi();
  807f9f:	b8 00 00 00 00       	mov    eax,0x0
  807fa4:	e8 a5 db ff ff       	call   805b4e <eoi>
    asm volatile("leave\r\n iretq");
  807fa9:	c9                   	leave  
  807faa:	48 cf                	iretq  
}
  807fac:	90                   	nop
  807fad:	c9                   	leave  
  807fae:	c3                   	ret    

0000000000807faf <sys_analyse_key>:

char sys_analyse_key()
{
  807faf:	f3 0f 1e fa          	endbr64 
  807fb3:	55                   	push   rbp
  807fb4:	48 89 e5             	mov    rbp,rsp
  807fb7:	48 83 ec 30          	sub    rsp,0x30
    if(key_bufq.tail==key_bufq.head)return -1;
  807fbb:	8b 15 4b 44 00 00    	mov    edx,DWORD PTR [rip+0x444b]        # 80c40c <key_bufq+0xc>
  807fc1:	8b 05 41 44 00 00    	mov    eax,DWORD PTR [rip+0x4441]        # 80c408 <key_bufq+0x8>
  807fc7:	39 c2                	cmp    edx,eax
  807fc9:	75 0a                	jne    807fd5 <sys_analyse_key+0x26>
  807fcb:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807fd0:	e9 df 00 00 00       	jmp    8080b4 <sys_analyse_key+0x105>
    char c=key_buf[key_bufq.head];
  807fd5:	8b 05 2d 44 00 00    	mov    eax,DWORD PTR [rip+0x442d]        # 80c408 <key_bufq+0x8>
  807fdb:	48 98                	cdqe   
  807fdd:	0f b6 80 c0 86 42 00 	movzx  eax,BYTE PTR [rax+0x4286c0]
  807fe4:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    key_bufq.head=(key_bufq.head+1)%key_bufq.size;
  807fe7:	8b 05 1b 44 00 00    	mov    eax,DWORD PTR [rip+0x441b]        # 80c408 <key_bufq+0x8>
  807fed:	83 c0 01             	add    eax,0x1
  807ff0:	8b 0d 1a 44 00 00    	mov    ecx,DWORD PTR [rip+0x441a]        # 80c410 <key_bufq+0x10>
  807ff6:	99                   	cdq    
  807ff7:	f7 f9                	idiv   ecx
  807ff9:	89 d0                	mov    eax,edx
  807ffb:	89 05 07 44 00 00    	mov    DWORD PTR [rip+0x4407],eax        # 80c408 <key_bufq+0x8>
//    QHEAD(key_bufq)=(QHEAD(key_bufq)+1)%QSIZE(key_bufq);
    printf("scan code:");
  808001:	bf d6 43 81 00       	mov    edi,0x8143d6
  808006:	b8 00 00 00 00       	mov    eax,0x0
  80800b:	e8 17 8d ff ff       	call   800d27 <printf>
    char res[33]={0};
  808010:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  808017:	00 
  808018:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  80801f:	00 
  808020:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  808027:	00 
  808028:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80802f:	00 
  808030:	c6 45 f0 00          	mov    BYTE PTR [rbp-0x10],0x0
    itoa(res,16,c);
  808034:	0f be 55 ff          	movsx  edx,BYTE PTR [rbp-0x1]
  808038:	48 8d 45 d0          	lea    rax,[rbp-0x30]
  80803c:	be 10 00 00 00       	mov    esi,0x10
  808041:	48 89 c7             	mov    rdi,rax
  808044:	e8 9f 8b ff ff       	call   800be8 <itoa>
    printf(res);
  808049:	48 8d 45 d0          	lea    rax,[rbp-0x30]
  80804d:	48 89 c7             	mov    rdi,rax
  808050:	b8 00 00 00 00       	mov    eax,0x0
  808055:	e8 cd 8c ff ff       	call   800d27 <printf>
    if(c&FLAG_BREAK){
  80805a:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  80805e:	79 16                	jns    808076 <sys_analyse_key+0xc7>
        printf("\n");
  808060:	bf e1 43 81 00       	mov    edi,0x8143e1
  808065:	b8 00 00 00 00       	mov    eax,0x0
  80806a:	e8 b8 8c ff ff       	call   800d27 <printf>
        return -1;
  80806f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808074:	eb 3e                	jmp    8080b4 <sys_analyse_key+0x105>
    }
    c= to_ascii(c&0x7f);
  808076:	0f be 45 ff          	movsx  eax,BYTE PTR [rbp-0x1]
  80807a:	83 e0 7f             	and    eax,0x7f
  80807d:	89 c7                	mov    edi,eax
  80807f:	e8 06 fd ff ff       	call   807d8a <to_ascii>
  808084:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    printf(" char:");
  808087:	bf e3 43 81 00       	mov    edi,0x8143e3
  80808c:	b8 00 00 00 00       	mov    eax,0x0
  808091:	e8 91 8c ff ff       	call   800d27 <printf>
    putchar(c);
  808096:	0f be 45 ff          	movsx  eax,BYTE PTR [rbp-0x1]
  80809a:	89 c7                	mov    edi,eax
  80809c:	e8 5c 8c ff ff       	call   800cfd <putchar>
    printf("\n");
  8080a1:	bf e1 43 81 00       	mov    edi,0x8143e1
  8080a6:	b8 00 00 00 00       	mov    eax,0x0
  8080ab:	e8 77 8c ff ff       	call   800d27 <printf>
    return c;
  8080b0:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  8080b4:	c9                   	leave  
  8080b5:	c3                   	ret    

00000000008080b6 <init_disk>:
        .read=async_read_disk,
        .write=async_write_disk
};
int disks[4];//四块硬盘的dev号
int init_disk()
{
  8080b6:	f3 0f 1e fa          	endbr64 
  8080ba:	55                   	push   rbp
  8080bb:	48 89 e5             	mov    rbp,rsp
    //disk_devi= reg_device(&dev_disk);
    //disk_drvi= reg_driver(&drv_disk);
    //dev_disk.drv=&drv_disk;
    hd_iterate();
  8080be:	b8 00 00 00 00       	mov    eax,0x0
  8080c3:	e8 8d 09 00 00       	call   808a55 <hd_iterate>
    return 0;
  8080c8:	b8 00 00 00 00       	mov    eax,0x0
}
  8080cd:	5d                   	pop    rbp
  8080ce:	c3                   	ret    

00000000008080cf <disk_int_handler_c>:

int disk_int_handler_c()
{
  8080cf:	f3 0f 1e fa          	endbr64 
  8080d3:	55                   	push   rbp
  8080d4:	48 89 e5             	mov    rbp,rsp
  8080d7:	48 83 ec 20          	sub    rsp,0x20
    if(running_req==NULL)
  8080db:	48 8b 05 fe 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc234fe]        # 42b5e0 <running_req>
  8080e2:	48 85 c0             	test   rax,rax
  8080e5:	75 0a                	jne    8080f1 <disk_int_handler_c+0x22>
    {
        //printf("err:null running dreq\n");
        return 1;//同步读写硬盘
  8080e7:	b8 01 00 00 00       	mov    eax,0x1
  8080ec:	e9 a3 01 00 00       	jmp    808294 <disk_int_handler_c+0x1c5>
    }
    short *p=running_req->buf;
  8080f1:	48 8b 05 e8 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc234e8]        # 42b5e0 <running_req>
  8080f8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8080fc:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int port=PORT_DISK_MAJOR;
  808100:	c7 45 f4 f0 01 00 00 	mov    DWORD PTR [rbp-0xc],0x1f0
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  808107:	48 8b 05 d2 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc234d2]        # 42b5e0 <running_req>
  80810e:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808111:	83 f8 02             	cmp    eax,0x2
  808114:	74 0f                	je     808125 <disk_int_handler_c+0x56>
    running_req->disk==DISK_SLAVE_SLAVE)
  808116:	48 8b 05 c3 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc234c3]        # 42b5e0 <running_req>
  80811d:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  808120:	83 f8 03             	cmp    eax,0x3
  808123:	75 07                	jne    80812c <disk_int_handler_c+0x5d>
        port=PORT_DISK_SLAVE;
  808125:	c7 45 f4 70 01 00 00 	mov    DWORD PTR [rbp-0xc],0x170
    if(running_req->func==DISKREQ_READ)
  80812c:	48 8b 05 ad 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc234ad]        # 42b5e0 <running_req>
  808133:	8b 00                	mov    eax,DWORD PTR [rax]
  808135:	85 c0                	test   eax,eax
  808137:	75 42                	jne    80817b <disk_int_handler_c+0xac>
    {
        ////printf("sys_read dist:%x\n",p);
        //读取
        for(int i=0;i<running_req->sec_n*256;i++)
  808139:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  808140:	eb 22                	jmp    808164 <disk_int_handler_c+0x95>
        {
            *p++=inw(port);
  808142:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808145:	0f b7 c0             	movzx  eax,ax
  808148:	89 c7                	mov    edi,eax
  80814a:	e8 f4 d9 ff ff       	call   805b43 <inw>
  80814f:	89 c2                	mov    edx,eax
  808151:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808155:	48 8d 48 02          	lea    rcx,[rax+0x2]
  808159:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80815d:	66 89 10             	mov    WORD PTR [rax],dx
        for(int i=0;i<running_req->sec_n*256;i++)
  808160:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  808164:	48 8b 05 75 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23475]        # 42b5e0 <running_req>
  80816b:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80816e:	c1 e0 08             	shl    eax,0x8
  808171:	39 45 f0             	cmp    DWORD PTR [rbp-0x10],eax
  808174:	7c cc                	jl     808142 <disk_int_handler_c+0x73>
  808176:	e9 ca 00 00 00       	jmp    808245 <disk_int_handler_c+0x176>
        }
    }else if(running_req->func==DISKREQ_WRITE)
  80817b:	48 8b 05 5e 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2345e]        # 42b5e0 <running_req>
  808182:	8b 00                	mov    eax,DWORD PTR [rax]
  808184:	83 f8 01             	cmp    eax,0x1
  808187:	75 42                	jne    8081cb <disk_int_handler_c+0xfc>
    {
        for(int i=0;i<running_req->sec_n*256;i++)
  808189:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  808190:	eb 25                	jmp    8081b7 <disk_int_handler_c+0xe8>
            outw(port,*p++);
  808192:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808196:	48 8d 50 02          	lea    rdx,[rax+0x2]
  80819a:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80819e:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8081a1:	0f b7 d0             	movzx  edx,ax
  8081a4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8081a7:	0f b7 c0             	movzx  eax,ax
  8081aa:	89 d6                	mov    esi,edx
  8081ac:	89 c7                	mov    edi,eax
  8081ae:	e8 7a d9 ff ff       	call   805b2d <outw>
        for(int i=0;i<running_req->sec_n*256;i++)
  8081b3:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8081b7:	48 8b 05 22 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23422]        # 42b5e0 <running_req>
  8081be:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  8081c1:	c1 e0 08             	shl    eax,0x8
  8081c4:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8081c7:	7c c9                	jl     808192 <disk_int_handler_c+0xc3>
  8081c9:	eb 7a                	jmp    808245 <disk_int_handler_c+0x176>
    }else if(running_req->func==DISKREQ_CHECK)
  8081cb:	48 8b 05 0e 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2340e]        # 42b5e0 <running_req>
  8081d2:	8b 00                	mov    eax,DWORD PTR [rax]
  8081d4:	83 f8 02             	cmp    eax,0x2
  8081d7:	75 34                	jne    80820d <disk_int_handler_c+0x13e>
    {
        char stat=inb(port+7);
  8081d9:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8081dc:	83 c0 07             	add    eax,0x7
  8081df:	0f b6 c0             	movzx  eax,al
  8081e2:	89 c7                	mov    edi,eax
  8081e4:	e8 50 d9 ff ff       	call   805b39 <inb>
  8081e9:	88 45 e7             	mov    BYTE PTR [rbp-0x19],al
        short dat=inw(port);
  8081ec:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8081ef:	0f b7 c0             	movzx  eax,ax
  8081f2:	89 c7                	mov    edi,eax
  8081f4:	e8 4a d9 ff ff       	call   805b43 <inw>
  8081f9:	66 89 45 e4          	mov    WORD PTR [rbp-0x1c],ax
        if(1)
        {
            running_req->result=DISK_CHK_OK;
  8081fd:	48 8b 05 dc 33 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc233dc]        # 42b5e0 <running_req>
  808204:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  80820b:	eb 38                	jmp    808245 <disk_int_handler_c+0x176>
            char err=inb(port+1);//错误原因
            printf("checking disk err:%x\nresetting hd\n",err);
            running_req->result=DISK_CHK_ERR;
            request(running_req->disk,DISKREQ_RESET,0,0,0);
        }
    }else if(running_req->func==DISKREQ_RESET)
  80820d:	48 8b 05 cc 33 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc233cc]        # 42b5e0 <running_req>
  808214:	8b 00                	mov    eax,DWORD PTR [rax]
  808216:	83 f8 03             	cmp    eax,0x3
  808219:	75 2a                	jne    808245 <disk_int_handler_c+0x176>
    {
        int stat=inb(port+7);
  80821b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80821e:	83 c0 07             	add    eax,0x7
  808221:	0f b6 c0             	movzx  eax,al
  808224:	89 c7                	mov    edi,eax
  808226:	e8 0e d9 ff ff       	call   805b39 <inb>
  80822b:	0f b6 c0             	movzx  eax,al
  80822e:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
        printf("reset disk done.\nstat now:%x\n",stat);
  808231:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808234:	89 c6                	mov    esi,eax
  808236:	bf ea 43 81 00       	mov    edi,0x8143ea
  80823b:	b8 00 00 00 00       	mov    eax,0x0
  808240:	e8 e2 8a ff ff       	call   800d27 <printf>
    }
    running_req->stat=REQ_STAT_DONE;
  808245:	48 8b 05 94 33 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23394]        # 42b5e0 <running_req>
  80824c:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  808253:	48 8b 05 86 33 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23386]        # 42b5e0 <running_req>
  80825a:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  80825e:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  808265:	00 00 00 
    running_devman_req->stat=REQ_STAT_DONE;
  808268:	48 8b 05 79 33 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23379]        # 42b5e8 <running_devman_req>
  80826f:	c7 80 ac 00 00 00 03 	mov    DWORD PTR [rax+0xac],0x3
  808276:	00 00 00 
    running_devman_req=NULL;
  808279:	48 c7 05 64 33 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23364],0x0        # 42b5e8 <running_devman_req>
  808280:	00 00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  808284:	48 c7 05 51 33 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23351],0x0        # 42b5e0 <running_req>
  80828b:	00 00 00 00 
    return 0;
  80828f:	b8 00 00 00 00       	mov    eax,0x0
}
  808294:	c9                   	leave  
  808295:	c3                   	ret    

0000000000808296 <check_dreq_stat>:
int check_dreq_stat(int req_id)
{
  808296:	f3 0f 1e fa          	endbr64 
  80829a:	55                   	push   rbp
  80829b:	48 89 e5             	mov    rbp,rsp
  80829e:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return disk_reqs[req_id].stat;
  8082a1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8082a4:	48 63 d0             	movsxd rdx,eax
  8082a7:	48 89 d0             	mov    rax,rdx
  8082aa:	48 01 c0             	add    rax,rax
  8082ad:	48 01 d0             	add    rax,rdx
  8082b0:	48 c1 e0 04          	shl    rax,0x4
  8082b4:	48 05 fc 88 42 00    	add    rax,0x4288fc
  8082ba:	8b 00                	mov    eax,DWORD PTR [rax]
}
  8082bc:	5d                   	pop    rbp
  8082bd:	c3                   	ret    

00000000008082be <request>:
int request(int disk,int func,int lba,int secn,char *buf){
  8082be:	f3 0f 1e fa          	endbr64 
  8082c2:	55                   	push   rbp
  8082c3:	48 89 e5             	mov    rbp,rsp
  8082c6:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8082c9:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8082cc:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  8082cf:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  8082d2:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    if((tail+1)%MAX_DISK_REQUEST_COUNT==head)
  8082d6:	8b 05 38 33 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23338]        # 42b614 <tail>
  8082dc:	83 c0 01             	add    eax,0x1
  8082df:	48 63 d0             	movsxd rdx,eax
  8082e2:	48 69 d2 89 88 88 88 	imul   rdx,rdx,0xffffffff88888889
  8082e9:	48 c1 ea 20          	shr    rdx,0x20
  8082ed:	01 c2                	add    edx,eax
  8082ef:	c1 fa 07             	sar    edx,0x7
  8082f2:	89 c1                	mov    ecx,eax
  8082f4:	c1 f9 1f             	sar    ecx,0x1f
  8082f7:	29 ca                	sub    edx,ecx
  8082f9:	69 ca f0 00 00 00    	imul   ecx,edx,0xf0
  8082ff:	29 c8                	sub    eax,ecx
  808301:	89 c2                	mov    edx,eax
  808303:	8b 05 07 33 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23307]        # 42b610 <head>
  808309:	39 c2                	cmp    edx,eax
  80830b:	75 0a                	jne    808317 <request+0x59>
    {
        return -1;
  80830d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808312:	e9 0d 01 00 00       	jmp    808424 <request+0x166>
    }
    disk_reqs[tail].disk=disk;
  808317:	8b 05 f7 32 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc232f7]        # 42b614 <tail>
  80831d:	48 63 d0             	movsxd rdx,eax
  808320:	48 89 d0             	mov    rax,rdx
  808323:	48 01 c0             	add    rax,rax
  808326:	48 01 d0             	add    rax,rdx
  808329:	48 c1 e0 04          	shl    rax,0x4
  80832d:	48 8d 90 e4 88 42 00 	lea    rdx,[rax+0x4288e4]
  808334:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808337:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].func=func;
  808339:	8b 05 d5 32 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc232d5]        # 42b614 <tail>
  80833f:	48 63 d0             	movsxd rdx,eax
  808342:	48 89 d0             	mov    rax,rdx
  808345:	48 01 c0             	add    rax,rax
  808348:	48 01 d0             	add    rax,rdx
  80834b:	48 c1 e0 04          	shl    rax,0x4
  80834f:	48 8d 90 e0 88 42 00 	lea    rdx,[rax+0x4288e0]
  808356:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808359:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].lba=lba;
  80835b:	8b 05 b3 32 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc232b3]        # 42b614 <tail>
  808361:	48 63 d0             	movsxd rdx,eax
  808364:	48 89 d0             	mov    rax,rdx
  808367:	48 01 c0             	add    rax,rax
  80836a:	48 01 d0             	add    rax,rdx
  80836d:	48 c1 e0 04          	shl    rax,0x4
  808371:	48 8d 90 e8 88 42 00 	lea    rdx,[rax+0x4288e8]
  808378:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80837b:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].sec_n=secn;
  80837d:	8b 05 91 32 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23291]        # 42b614 <tail>
  808383:	48 63 d0             	movsxd rdx,eax
  808386:	48 89 d0             	mov    rax,rdx
  808389:	48 01 c0             	add    rax,rax
  80838c:	48 01 d0             	add    rax,rdx
  80838f:	48 c1 e0 04          	shl    rax,0x4
  808393:	48 8d 90 ec 88 42 00 	lea    rdx,[rax+0x4288ec]
  80839a:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80839d:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].stat=REQ_STAT_READY;
  80839f:	8b 05 6f 32 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2326f]        # 42b614 <tail>
  8083a5:	48 63 d0             	movsxd rdx,eax
  8083a8:	48 89 d0             	mov    rax,rdx
  8083ab:	48 01 c0             	add    rax,rax
  8083ae:	48 01 d0             	add    rax,rdx
  8083b1:	48 c1 e0 04          	shl    rax,0x4
  8083b5:	48 05 fc 88 42 00    	add    rax,0x4288fc
  8083bb:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    disk_reqs[tail].buf=buf;
  8083c1:	8b 05 4d 32 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2324d]        # 42b614 <tail>
  8083c7:	48 63 d0             	movsxd rdx,eax
  8083ca:	48 89 d0             	mov    rax,rdx
  8083cd:	48 01 c0             	add    rax,rax
  8083d0:	48 01 d0             	add    rax,rdx
  8083d3:	48 c1 e0 04          	shl    rax,0x4
  8083d7:	48 8d 90 f0 88 42 00 	lea    rdx,[rax+0x4288f0]
  8083de:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8083e2:	48 89 02             	mov    QWORD PTR [rdx],rax
    int r=tail;
  8083e5:	8b 05 29 32 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23229]        # 42b614 <tail>
  8083eb:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    tail=(tail+1)%MAX_DISK_REQUEST_COUNT;
  8083ee:	8b 05 20 32 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23220]        # 42b614 <tail>
  8083f4:	8d 50 01             	lea    edx,[rax+0x1]
  8083f7:	48 63 c2             	movsxd rax,edx
  8083fa:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  808401:	48 c1 e8 20          	shr    rax,0x20
  808405:	01 d0                	add    eax,edx
  808407:	c1 f8 07             	sar    eax,0x7
  80840a:	89 d1                	mov    ecx,edx
  80840c:	c1 f9 1f             	sar    ecx,0x1f
  80840f:	29 c8                	sub    eax,ecx
  808411:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  808417:	89 d0                	mov    eax,edx
  808419:	29 c8                	sub    eax,ecx
  80841b:	89 05 f3 31 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc231f3],eax        # 42b614 <tail>
    return r;
  808421:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  808424:	5d                   	pop    rbp
  808425:	c3                   	ret    

0000000000808426 <execute_request>:
int execute_request(){
  808426:	f3 0f 1e fa          	endbr64 
  80842a:	55                   	push   rbp
  80842b:	48 89 e5             	mov    rbp,rsp
  80842e:	48 83 ec 10          	sub    rsp,0x10
    //查看是否有已经在运行的请求
    if(running_req!=NULL)
  808432:	48 8b 05 a7 31 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc231a7]        # 42b5e0 <running_req>
  808439:	48 85 c0             	test   rax,rax
  80843c:	74 6a                	je     8084a8 <execute_request+0x82>
    {
        running_req->time++;
  80843e:	48 8b 05 9b 31 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2319b]        # 42b5e0 <running_req>
  808445:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  808448:	83 c2 01             	add    edx,0x1
  80844b:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
        if(running_req->func!=DISKREQ_CHECK)
  80844e:	48 8b 05 8b 31 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2318b]        # 42b5e0 <running_req>
  808455:	8b 00                	mov    eax,DWORD PTR [rax]
  808457:	83 f8 02             	cmp    eax,0x2
  80845a:	74 0a                	je     808466 <execute_request+0x40>
            return 2;
  80845c:	b8 02 00 00 00       	mov    eax,0x2
  808461:	e9 b4 01 00 00       	jmp    80861a <execute_request+0x1f4>
        if(running_req->time>MAX_DISK_CHKTIME)
  808466:	48 8b 05 73 31 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23173]        # 42b5e0 <running_req>
  80846d:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  808470:	83 f8 0a             	cmp    eax,0xa
  808473:	7e 29                	jle    80849e <execute_request+0x78>
        {
            //检测硬盘超时，视为没有硬盘连接
            running_req->result=DISK_CHK_ERR;
  808475:	48 8b 05 64 31 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23164]        # 42b5e0 <running_req>
  80847c:	c7 40 20 02 00 00 00 	mov    DWORD PTR [rax+0x20],0x2
            running_req->stat=REQ_STAT_DONE;
  808483:	48 8b 05 56 31 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23156]        # 42b5e0 <running_req>
  80848a:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
            running_req=NULL;
  808491:	48 c7 05 44 31 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23144],0x0        # 42b5e0 <running_req>
  808498:	00 00 00 00 
  80849c:	eb 0a                	jmp    8084a8 <execute_request+0x82>
        }else
        {
            //未到时间继续等待
            return 2;
  80849e:	b8 02 00 00 00       	mov    eax,0x2
  8084a3:	e9 72 01 00 00       	jmp    80861a <execute_request+0x1f4>
        }
    }
    if(head==tail)return 1;//检查是否为空
  8084a8:	8b 15 62 31 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc23162]        # 42b610 <head>
  8084ae:	8b 05 60 31 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23160]        # 42b614 <tail>
  8084b4:	39 c2                	cmp    edx,eax
  8084b6:	75 0a                	jne    8084c2 <execute_request+0x9c>
  8084b8:	b8 01 00 00 00       	mov    eax,0x1
  8084bd:	e9 58 01 00 00       	jmp    80861a <execute_request+0x1f4>
    running_req=&disk_reqs[head];
  8084c2:	8b 05 48 31 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23148]        # 42b610 <head>
  8084c8:	48 63 d0             	movsxd rdx,eax
  8084cb:	48 89 d0             	mov    rax,rdx
  8084ce:	48 01 c0             	add    rax,rax
  8084d1:	48 01 d0             	add    rax,rdx
  8084d4:	48 c1 e0 04          	shl    rax,0x4
  8084d8:	48 05 e0 88 42 00    	add    rax,0x4288e0
  8084de:	48 89 05 fb 30 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc230fb],rax        # 42b5e0 <running_req>
    head=(head+1)%MAX_DISK_REQUEST_COUNT;
  8084e5:	8b 05 25 31 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23125]        # 42b610 <head>
  8084eb:	8d 50 01             	lea    edx,[rax+0x1]
  8084ee:	48 63 c2             	movsxd rax,edx
  8084f1:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  8084f8:	48 c1 e8 20          	shr    rax,0x20
  8084fc:	01 d0                	add    eax,edx
  8084fe:	c1 f8 07             	sar    eax,0x7
  808501:	89 d1                	mov    ecx,edx
  808503:	c1 f9 1f             	sar    ecx,0x1f
  808506:	29 c8                	sub    eax,ecx
  808508:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  80850e:	89 d0                	mov    eax,edx
  808510:	29 c8                	sub    eax,ecx
  808512:	89 05 f8 30 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc230f8],eax        # 42b610 <head>
    running_req->stat=REQ_STAT_WORKING;
  808518:	48 8b 05 c1 30 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc230c1]        # 42b5e0 <running_req>
  80851f:	c7 40 1c 02 00 00 00 	mov    DWORD PTR [rax+0x1c],0x2
    //set_proc_stat(running_req->pid,SUSPENDED);
    int r=0;
  808526:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    switch (running_req->func)
  80852d:	48 8b 05 ac 30 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc230ac]        # 42b5e0 <running_req>
  808534:	8b 00                	mov    eax,DWORD PTR [rax]
  808536:	83 f8 03             	cmp    eax,0x3
  808539:	0f 84 ad 00 00 00    	je     8085ec <execute_request+0x1c6>
  80853f:	83 f8 03             	cmp    eax,0x3
  808542:	0f 8f bf 00 00 00    	jg     808607 <execute_request+0x1e1>
  808548:	83 f8 02             	cmp    eax,0x2
  80854b:	0f 84 85 00 00 00    	je     8085d6 <execute_request+0x1b0>
  808551:	83 f8 02             	cmp    eax,0x2
  808554:	0f 8f ad 00 00 00    	jg     808607 <execute_request+0x1e1>
  80855a:	85 c0                	test   eax,eax
  80855c:	74 0a                	je     808568 <execute_request+0x142>
  80855e:	83 f8 01             	cmp    eax,0x1
  808561:	74 3c                	je     80859f <execute_request+0x179>
        break;
    case DISKREQ_RESET:
        r=async_reset_disk(running_req->disk);
        break;
    default:
        break;
  808563:	e9 9f 00 00 00       	jmp    808607 <execute_request+0x1e1>
        running_req->lba,running_req->sec_n,running_req->buf);
  808568:	48 8b 05 71 30 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23071]        # 42b5e0 <running_req>
        r=async_read_disk(running_req->disk,\
  80856f:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
        running_req->lba,running_req->sec_n,running_req->buf);
  808573:	48 8b 05 66 30 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23066]        # 42b5e0 <running_req>
        r=async_read_disk(running_req->disk,\
  80857a:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
        running_req->lba,running_req->sec_n,running_req->buf);
  80857d:	48 8b 05 5c 30 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2305c]        # 42b5e0 <running_req>
  808584:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_read_disk(running_req->disk,\
  808587:	89 c6                	mov    esi,eax
  808589:	48 8b 05 50 30 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23050]        # 42b5e0 <running_req>
  808590:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808593:	89 c7                	mov    edi,eax
  808595:	e8 a7 00 00 00       	call   808641 <async_read_disk>
  80859a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  80859d:	eb 69                	jmp    808608 <execute_request+0x1e2>
         running_req->lba,running_req->sec_n,running_req->buf);
  80859f:	48 8b 05 3a 30 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2303a]        # 42b5e0 <running_req>
        r=async_write_disk(running_req->disk,\
  8085a6:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
         running_req->lba,running_req->sec_n,running_req->buf);
  8085aa:	48 8b 05 2f 30 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2302f]        # 42b5e0 <running_req>
        r=async_write_disk(running_req->disk,\
  8085b1:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
         running_req->lba,running_req->sec_n,running_req->buf);
  8085b4:	48 8b 05 25 30 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23025]        # 42b5e0 <running_req>
  8085bb:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_write_disk(running_req->disk,\
  8085be:	89 c6                	mov    esi,eax
  8085c0:	48 8b 05 19 30 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23019]        # 42b5e0 <running_req>
  8085c7:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8085ca:	89 c7                	mov    edi,eax
  8085cc:	e8 88 01 00 00       	call   808759 <async_write_disk>
  8085d1:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  8085d4:	eb 32                	jmp    808608 <execute_request+0x1e2>
        r=async_check_disk(running_req->disk);
  8085d6:	48 8b 05 03 30 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23003]        # 42b5e0 <running_req>
  8085dd:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8085e0:	89 c7                	mov    edi,eax
  8085e2:	e8 8f 06 00 00       	call   808c76 <async_check_disk>
  8085e7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  8085ea:	eb 1c                	jmp    808608 <execute_request+0x1e2>
        r=async_reset_disk(running_req->disk);
  8085ec:	48 8b 05 ed 2f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22fed]        # 42b5e0 <running_req>
  8085f3:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8085f6:	89 c7                	mov    edi,eax
  8085f8:	b8 00 00 00 00       	mov    eax,0x0
  8085fd:	e8 1a 00 00 00       	call   80861c <async_reset_disk>
  808602:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  808605:	eb 01                	jmp    808608 <execute_request+0x1e2>
        break;
  808607:	90                   	nop
    }
    if(r==-1)return -1;
  808608:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  80860c:	75 07                	jne    808615 <execute_request+0x1ef>
  80860e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808613:	eb 05                	jmp    80861a <execute_request+0x1f4>
    return 0;
  808615:	b8 00 00 00 00       	mov    eax,0x0
}
  80861a:	c9                   	leave  
  80861b:	c3                   	ret    

000000000080861c <async_reset_disk>:
int async_reset_disk(int disk)
{
  80861c:	f3 0f 1e fa          	endbr64 
  808620:	55                   	push   rbp
  808621:	48 89 e5             	mov    rbp,rsp
  808624:	48 83 ec 10          	sub    rsp,0x10
  808628:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    outb(PORT_DISK_CONTROL,DISK_CMD_RESET);
  80862b:	be 0c 00 00 00       	mov    esi,0xc
  808630:	bf f6 03 00 00       	mov    edi,0x3f6
  808635:	e8 e6 d4 ff ff       	call   805b20 <outb>
    return 0;
  80863a:	b8 00 00 00 00       	mov    eax,0x0
}
  80863f:	c9                   	leave  
  808640:	c3                   	ret    

0000000000808641 <async_read_disk>:
int async_read_disk(int disk,unsigned int lba,int sec_n,char* mem_addr)
{
  808641:	f3 0f 1e fa          	endbr64 
  808645:	55                   	push   rbp
  808646:	48 89 e5             	mov    rbp,rsp
  808649:	48 83 ec 30          	sub    rsp,0x30
  80864d:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  808650:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  808653:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  808656:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  80865a:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  808660:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  808667:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  80866b:	74 06                	je     808673 <async_read_disk+0x32>
  80866d:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  808671:	75 06                	jne    808679 <async_read_disk+0x38>
        port=PORT_DISK_SLAVE;
  808673:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  808679:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  80867d:	74 06                	je     808685 <async_read_disk+0x44>
  80867f:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  808683:	75 07                	jne    80868c <async_read_disk+0x4b>
        slave_disk=1;
  808685:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    outb(port+2,sec_n);
  80868c:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80868f:	0f b6 d0             	movzx  edx,al
  808692:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808696:	83 c0 02             	add    eax,0x2
  808699:	0f b7 c0             	movzx  eax,ax
  80869c:	89 d6                	mov    esi,edx
  80869e:	89 c7                	mov    edi,eax
  8086a0:	e8 7b d4 ff ff       	call   805b20 <outb>
    outb(port+3,lba&0xff);
  8086a5:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8086a8:	0f b6 d0             	movzx  edx,al
  8086ab:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8086af:	83 c0 03             	add    eax,0x3
  8086b2:	0f b7 c0             	movzx  eax,ax
  8086b5:	89 d6                	mov    esi,edx
  8086b7:	89 c7                	mov    edi,eax
  8086b9:	e8 62 d4 ff ff       	call   805b20 <outb>
    outb(port+4,(lba>>8)&0xff);
  8086be:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8086c1:	c1 e8 08             	shr    eax,0x8
  8086c4:	0f b6 d0             	movzx  edx,al
  8086c7:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8086cb:	83 c0 04             	add    eax,0x4
  8086ce:	0f b7 c0             	movzx  eax,ax
  8086d1:	89 d6                	mov    esi,edx
  8086d3:	89 c7                	mov    edi,eax
  8086d5:	e8 46 d4 ff ff       	call   805b20 <outb>
    outb(port+5,(lba>>16)&0xff);
  8086da:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8086dd:	c1 e8 10             	shr    eax,0x10
  8086e0:	0f b6 d0             	movzx  edx,al
  8086e3:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8086e7:	83 c0 05             	add    eax,0x5
  8086ea:	0f b7 c0             	movzx  eax,ax
  8086ed:	89 d6                	mov    esi,edx
  8086ef:	89 c7                	mov    edi,eax
  8086f1:	e8 2a d4 ff ff       	call   805b20 <outb>
    char drv=slave_disk?0x10:0;
  8086f6:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  8086fa:	74 07                	je     808703 <async_read_disk+0xc2>
  8086fc:	b8 10 00 00 00       	mov    eax,0x10
  808701:	eb 05                	jmp    808708 <async_read_disk+0xc7>
  808703:	b8 00 00 00 00       	mov    eax,0x0
  808708:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
    char lba_hi=(lba>>24)&0xf|drv|0xe0;
  80870b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80870e:	c1 e8 18             	shr    eax,0x18
  808711:	83 e0 0f             	and    eax,0xf
  808714:	89 c2                	mov    edx,eax
  808716:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  80871a:	09 d0                	or     eax,edx
  80871c:	83 c8 e0             	or     eax,0xffffffe0
  80871f:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
    outb(port+6,lba_hi);
  808722:	0f b6 45 f6          	movzx  eax,BYTE PTR [rbp-0xa]
  808726:	0f b6 d0             	movzx  edx,al
  808729:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80872d:	83 c0 06             	add    eax,0x6
  808730:	0f b7 c0             	movzx  eax,ax
  808733:	89 d6                	mov    esi,edx
  808735:	89 c7                	mov    edi,eax
  808737:	e8 e4 d3 ff ff       	call   805b20 <outb>
    outb(port+7,DISK_CMD_READ);
  80873c:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808740:	83 c0 07             	add    eax,0x7
  808743:	0f b7 c0             	movzx  eax,ax
  808746:	be 20 00 00 00       	mov    esi,0x20
  80874b:	89 c7                	mov    edi,eax
  80874d:	e8 ce d3 ff ff       	call   805b20 <outb>
    // }
    // for(int i=0;i<running_req->sec_n*256;i++)
    // {
    //     *mem_addr++=inw(port);
    // }
    return 0;
  808752:	b8 00 00 00 00       	mov    eax,0x0
}
  808757:	c9                   	leave  
  808758:	c3                   	ret    

0000000000808759 <async_write_disk>:
int async_write_disk(int disk,unsigned int lba, int sec_n, char* mem_ptr)
{
  808759:	f3 0f 1e fa          	endbr64 
  80875d:	55                   	push   rbp
  80875e:	48 89 e5             	mov    rbp,rsp
  808761:	48 83 ec 30          	sub    rsp,0x30
  808765:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  808768:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80876b:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  80876e:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  808772:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  808778:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  80877f:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  808783:	74 06                	je     80878b <async_write_disk+0x32>
  808785:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  808789:	75 06                	jne    808791 <async_write_disk+0x38>
        port=PORT_DISK_SLAVE;
  80878b:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  808791:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  808795:	74 06                	je     80879d <async_write_disk+0x44>
  808797:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  80879b:	75 07                	jne    8087a4 <async_write_disk+0x4b>
        slave_disk=1;
  80879d:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    while (1)
    {
        byte t=inb(0x1f7);
  8087a4:	bf f7 00 00 00       	mov    edi,0xf7
  8087a9:	e8 8b d3 ff ff       	call   805b39 <inb>
  8087ae:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
        //logf("istat:%x",t);
        byte err=t&1;
  8087b1:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  8087b5:	83 e0 01             	and    eax,0x1
  8087b8:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
        if(err!=0)
  8087bb:	80 7d f6 00          	cmp    BYTE PTR [rbp-0xa],0x0
  8087bf:	74 0a                	je     8087cb <async_write_disk+0x72>
        {
            //printf("ERR iwriting disk\n");
            return -1;
  8087c1:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8087c6:	e9 d5 00 00 00       	jmp    8088a0 <async_write_disk+0x147>
        }
        t&=0x88;
  8087cb:	80 65 f7 88          	and    BYTE PTR [rbp-0x9],0x88
        if(t==0x8)break;
  8087cf:	80 7d f7 08          	cmp    BYTE PTR [rbp-0x9],0x8
  8087d3:	74 02                	je     8087d7 <async_write_disk+0x7e>
    {
  8087d5:	eb cd                	jmp    8087a4 <async_write_disk+0x4b>
        if(t==0x8)break;
  8087d7:	90                   	nop
    }
    outb(port+2,sec_n);
  8087d8:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8087db:	0f b6 d0             	movzx  edx,al
  8087de:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8087e2:	83 c0 02             	add    eax,0x2
  8087e5:	0f b7 c0             	movzx  eax,ax
  8087e8:	89 d6                	mov    esi,edx
  8087ea:	89 c7                	mov    edi,eax
  8087ec:	e8 2f d3 ff ff       	call   805b20 <outb>
    outb(port+3,lba&0xff);
  8087f1:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8087f4:	0f b6 d0             	movzx  edx,al
  8087f7:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8087fb:	83 c0 03             	add    eax,0x3
  8087fe:	0f b7 c0             	movzx  eax,ax
  808801:	89 d6                	mov    esi,edx
  808803:	89 c7                	mov    edi,eax
  808805:	e8 16 d3 ff ff       	call   805b20 <outb>
    outb(port+4,(lba>>8)&0xff);
  80880a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80880d:	c1 e8 08             	shr    eax,0x8
  808810:	0f b6 d0             	movzx  edx,al
  808813:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808817:	83 c0 04             	add    eax,0x4
  80881a:	0f b7 c0             	movzx  eax,ax
  80881d:	89 d6                	mov    esi,edx
  80881f:	89 c7                	mov    edi,eax
  808821:	e8 fa d2 ff ff       	call   805b20 <outb>
    outb(port+5,(lba>>16)&0xff);
  808826:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808829:	c1 e8 10             	shr    eax,0x10
  80882c:	0f b6 d0             	movzx  edx,al
  80882f:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808833:	83 c0 05             	add    eax,0x5
  808836:	0f b7 c0             	movzx  eax,ax
  808839:	89 d6                	mov    esi,edx
  80883b:	89 c7                	mov    edi,eax
  80883d:	e8 de d2 ff ff       	call   805b20 <outb>
    char drv=slave_disk?0x10:0;
  808842:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  808846:	74 07                	je     80884f <async_write_disk+0xf6>
  808848:	b8 10 00 00 00       	mov    eax,0x10
  80884d:	eb 05                	jmp    808854 <async_write_disk+0xfb>
  80884f:	b8 00 00 00 00       	mov    eax,0x0
  808854:	88 45 f5             	mov    BYTE PTR [rbp-0xb],al
    unsigned char lba_hi=(lba>>24)&0xf|drv|0xe0;
  808857:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80885a:	c1 e8 18             	shr    eax,0x18
  80885d:	83 e0 0f             	and    eax,0xf
  808860:	89 c2                	mov    edx,eax
  808862:	0f b6 45 f5          	movzx  eax,BYTE PTR [rbp-0xb]
  808866:	09 d0                	or     eax,edx
  808868:	83 c8 e0             	or     eax,0xffffffe0
  80886b:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    outb(port+6,lba_hi);
  80886e:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  808872:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808876:	83 c0 06             	add    eax,0x6
  808879:	0f b7 c0             	movzx  eax,ax
  80887c:	89 d6                	mov    esi,edx
  80887e:	89 c7                	mov    edi,eax
  808880:	e8 9b d2 ff ff       	call   805b20 <outb>
    outb(port+7,DISK_CMD_WRITE);
  808885:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808889:	83 c0 07             	add    eax,0x7
  80888c:	0f b7 c0             	movzx  eax,ax
  80888f:	be 30 00 00 00       	mov    esi,0x30
  808894:	89 c7                	mov    edi,eax
  808896:	e8 85 d2 ff ff       	call   805b20 <outb>
    //     if(t==0x8)break;
    // }
    // short *p=mem_ptr;
    // for(int i=0;i<running_req->sec_n*256;i++)
    //         outw(port,*p++);
    return 0;
  80889b:	b8 00 00 00 00       	mov    eax,0x0
}
  8088a0:	c9                   	leave  
  8088a1:	c3                   	ret    

00000000008088a2 <read_disk>:
int read_disk(driver_args* args)
{
  8088a2:	f3 0f 1e fa          	endbr64 
  8088a6:	55                   	push   rbp
  8088a7:	48 89 e5             	mov    rbp,rsp
  8088aa:	48 83 ec 20          	sub    rsp,0x20
  8088ae:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=read_disk_asm(args->lba,args->sec_c,args->dist_addr);
  8088b2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8088b6:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8088b9:	48 98                	cdqe   
  8088bb:	48 89 c2             	mov    rdx,rax
  8088be:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8088c2:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  8088c5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8088c9:	8b 00                	mov    eax,DWORD PTR [rax]
  8088cb:	89 ce                	mov    esi,ecx
  8088cd:	89 c7                	mov    edi,eax
  8088cf:	e8 88 05 00 00       	call   808e5c <read_disk_asm>
  8088d4:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  8088d7:	48 8b 05 02 2d c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22d02]        # 42b5e0 <running_req>
  8088de:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  8088e5:	48 8b 05 f4 2c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22cf4]        # 42b5e0 <running_req>
  8088ec:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  8088f0:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  8088f7:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  8088fa:	48 c7 05 db 2c c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22cdb],0x0        # 42b5e0 <running_req>
  808901:	00 00 00 00 
    return ret;
  808905:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  808908:	c9                   	leave  
  808909:	c3                   	ret    

000000000080890a <write_disk>:
int write_disk(driver_args* args)
{
  80890a:	f3 0f 1e fa          	endbr64 
  80890e:	55                   	push   rbp
  80890f:	48 89 e5             	mov    rbp,rsp
  808912:	48 83 ec 20          	sub    rsp,0x20
  808916:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=write_disk_asm(args->lba,args->sec_c,args->src_addr);
  80891a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80891e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808921:	48 98                	cdqe   
  808923:	48 89 c2             	mov    rdx,rax
  808926:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80892a:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  80892d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808931:	8b 00                	mov    eax,DWORD PTR [rax]
  808933:	89 ce                	mov    esi,ecx
  808935:	89 c7                	mov    edi,eax
  808937:	e8 a0 05 00 00       	call   808edc <write_disk_asm>
  80893c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  80893f:	48 8b 05 9a 2c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22c9a]        # 42b5e0 <running_req>
  808946:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  80894d:	48 8b 05 8c 2c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22c8c]        # 42b5e0 <running_req>
  808954:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  808958:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  80895f:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  808962:	48 c7 05 73 2c c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22c73],0x0        # 42b5e0 <running_req>
  808969:	00 00 00 00 
    return ret;
  80896d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  808970:	c9                   	leave  
  808971:	c3                   	ret    

0000000000808972 <chk_result>:
int chk_result(int r)
{
  808972:	f3 0f 1e fa          	endbr64 
  808976:	55                   	push   rbp
  808977:	48 89 e5             	mov    rbp,rsp
  80897a:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(disk_reqs[r].stat!=REQ_STAT_DONE);
  80897d:	90                   	nop
  80897e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808981:	48 63 d0             	movsxd rdx,eax
  808984:	48 89 d0             	mov    rax,rdx
  808987:	48 01 c0             	add    rax,rax
  80898a:	48 01 d0             	add    rax,rdx
  80898d:	48 c1 e0 04          	shl    rax,0x4
  808991:	48 05 fc 88 42 00    	add    rax,0x4288fc
  808997:	8b 00                	mov    eax,DWORD PTR [rax]
  808999:	83 f8 03             	cmp    eax,0x3
  80899c:	75 e0                	jne    80897e <chk_result+0xc>
    return disk_reqs[r].result==DISK_CHK_OK?1:0;
  80899e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8089a1:	48 63 d0             	movsxd rdx,eax
  8089a4:	48 89 d0             	mov    rax,rdx
  8089a7:	48 01 c0             	add    rax,rax
  8089aa:	48 01 d0             	add    rax,rdx
  8089ad:	48 c1 e0 04          	shl    rax,0x4
  8089b1:	48 05 00 89 42 00    	add    rax,0x428900
  8089b7:	8b 00                	mov    eax,DWORD PTR [rax]
  8089b9:	83 f8 01             	cmp    eax,0x1
  8089bc:	0f 94 c0             	sete   al
  8089bf:	0f b6 c0             	movzx  eax,al
}
  8089c2:	5d                   	pop    rbp
  8089c3:	c3                   	ret    

00000000008089c4 <disk_existent>:
int disk_existent(int disk)
{
  8089c4:	f3 0f 1e fa          	endbr64 
  8089c8:	55                   	push   rbp
  8089c9:	48 89 e5             	mov    rbp,rsp
  8089cc:	48 83 ec 10          	sub    rsp,0x10
  8089d0:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    switch (disk)
  8089d3:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  8089d7:	74 5f                	je     808a38 <disk_existent+0x74>
  8089d9:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  8089dd:	7f 6e                	jg     808a4d <disk_existent+0x89>
  8089df:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  8089e3:	74 3e                	je     808a23 <disk_existent+0x5f>
  8089e5:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  8089e9:	7f 62                	jg     808a4d <disk_existent+0x89>
  8089eb:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8089ef:	74 08                	je     8089f9 <disk_existent+0x35>
  8089f1:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
  8089f5:	74 17                	je     808a0e <disk_existent+0x4a>
        
    case DISK_SLAVE_SLAVE:
        return sys_find_dev("hd3")!=-1;
        break;
    default:
        break;
  8089f7:	eb 54                	jmp    808a4d <disk_existent+0x89>
        return sys_find_dev("hd0")!=-1;
  8089f9:	bf 08 44 81 00       	mov    edi,0x814408
  8089fe:	e8 08 a0 ff ff       	call   802a0b <sys_find_dev>
  808a03:	83 f8 ff             	cmp    eax,0xffffffff
  808a06:	0f 95 c0             	setne  al
  808a09:	0f b6 c0             	movzx  eax,al
  808a0c:	eb 45                	jmp    808a53 <disk_existent+0x8f>
        return sys_find_dev("hd1")!=-1;
  808a0e:	bf 0c 44 81 00       	mov    edi,0x81440c
  808a13:	e8 f3 9f ff ff       	call   802a0b <sys_find_dev>
  808a18:	83 f8 ff             	cmp    eax,0xffffffff
  808a1b:	0f 95 c0             	setne  al
  808a1e:	0f b6 c0             	movzx  eax,al
  808a21:	eb 30                	jmp    808a53 <disk_existent+0x8f>
        return sys_find_dev("hd2")!=-1;
  808a23:	bf 10 44 81 00       	mov    edi,0x814410
  808a28:	e8 de 9f ff ff       	call   802a0b <sys_find_dev>
  808a2d:	83 f8 ff             	cmp    eax,0xffffffff
  808a30:	0f 95 c0             	setne  al
  808a33:	0f b6 c0             	movzx  eax,al
  808a36:	eb 1b                	jmp    808a53 <disk_existent+0x8f>
        return sys_find_dev("hd3")!=-1;
  808a38:	bf 14 44 81 00       	mov    edi,0x814414
  808a3d:	e8 c9 9f ff ff       	call   802a0b <sys_find_dev>
  808a42:	83 f8 ff             	cmp    eax,0xffffffff
  808a45:	0f 95 c0             	setne  al
  808a48:	0f b6 c0             	movzx  eax,al
  808a4b:	eb 06                	jmp    808a53 <disk_existent+0x8f>
        break;
  808a4d:	90                   	nop
    }
    return 0;
  808a4e:	b8 00 00 00 00       	mov    eax,0x0
}
  808a53:	c9                   	leave  
  808a54:	c3                   	ret    

0000000000808a55 <hd_iterate>:
int hd_iterate()
{
  808a55:	f3 0f 1e fa          	endbr64 
  808a59:	55                   	push   rbp
  808a5a:	48 89 e5             	mov    rbp,rsp
  808a5d:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
    char *name;
    
    int r[4];
    r[0]=request(DISK_MAJOR_MAJOR,DISKREQ_CHECK,0,1,0);
  808a64:	41 b8 00 00 00 00    	mov    r8d,0x0
  808a6a:	b9 01 00 00 00       	mov    ecx,0x1
  808a6f:	ba 00 00 00 00       	mov    edx,0x0
  808a74:	be 02 00 00 00       	mov    esi,0x2
  808a79:	bf 00 00 00 00       	mov    edi,0x0
  808a7e:	e8 3b f8 ff ff       	call   8082be <request>
  808a83:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    r[1]=request(DISK_MAJOR_SLAVE,DISKREQ_CHECK,0,1,0);
  808a86:	41 b8 00 00 00 00    	mov    r8d,0x0
  808a8c:	b9 01 00 00 00       	mov    ecx,0x1
  808a91:	ba 00 00 00 00       	mov    edx,0x0
  808a96:	be 02 00 00 00       	mov    esi,0x2
  808a9b:	bf 01 00 00 00       	mov    edi,0x1
  808aa0:	e8 19 f8 ff ff       	call   8082be <request>
  808aa5:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    r[2]=request(DISK_SLAVE_MAJOR,DISKREQ_CHECK,0,1,0);
  808aa8:	41 b8 00 00 00 00    	mov    r8d,0x0
  808aae:	b9 01 00 00 00       	mov    ecx,0x1
  808ab3:	ba 00 00 00 00       	mov    edx,0x0
  808ab8:	be 02 00 00 00       	mov    esi,0x2
  808abd:	bf 02 00 00 00       	mov    edi,0x2
  808ac2:	e8 f7 f7 ff ff       	call   8082be <request>
  808ac7:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    r[3]=request(DISK_SLAVE_SLAVE,DISKREQ_CHECK,0,1,0);
  808aca:	41 b8 00 00 00 00    	mov    r8d,0x0
  808ad0:	b9 01 00 00 00       	mov    ecx,0x1
  808ad5:	ba 00 00 00 00       	mov    edx,0x0
  808ada:	be 02 00 00 00       	mov    esi,0x2
  808adf:	bf 03 00 00 00       	mov    edi,0x3
  808ae4:	e8 d5 f7 ff ff       	call   8082be <request>
  808ae9:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    for(int i=0;i<1;i++)
  808aec:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  808af3:	e9 72 01 00 00       	jmp    808c6a <hd_iterate+0x215>
    {
        int disk;
        switch (i)
  808af8:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  808afc:	74 3b                	je     808b39 <hd_iterate+0xe4>
  808afe:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  808b02:	7f 3e                	jg     808b42 <hd_iterate+0xed>
  808b04:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  808b08:	74 26                	je     808b30 <hd_iterate+0xdb>
  808b0a:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  808b0e:	7f 32                	jg     808b42 <hd_iterate+0xed>
  808b10:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  808b14:	74 08                	je     808b1e <hd_iterate+0xc9>
  808b16:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  808b1a:	74 0b                	je     808b27 <hd_iterate+0xd2>
  808b1c:	eb 24                	jmp    808b42 <hd_iterate+0xed>
        {
        case 0:disk=DISK_MAJOR_MAJOR;break;
  808b1e:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  808b25:	eb 25                	jmp    808b4c <hd_iterate+0xf7>
        case 1:disk=DISK_MAJOR_SLAVE;break;
  808b27:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [rbp-0x10],0x1
  808b2e:	eb 1c                	jmp    808b4c <hd_iterate+0xf7>
        case 2:disk=DISK_SLAVE_MAJOR;break;
  808b30:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [rbp-0x10],0x2
  808b37:	eb 13                	jmp    808b4c <hd_iterate+0xf7>
        case 3:disk=DISK_SLAVE_SLAVE;break;
  808b39:	c7 45 f0 03 00 00 00 	mov    DWORD PTR [rbp-0x10],0x3
  808b40:	eb 0a                	jmp    808b4c <hd_iterate+0xf7>
        default:
            return -1;
  808b42:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808b47:	e9 28 01 00 00       	jmp    808c74 <hd_iterate+0x21f>
            break;
        }
        if(chk_result(r[i]))//&&!disk_existent(disk)
  808b4c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808b4f:	48 98                	cdqe   
  808b51:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  808b55:	89 c7                	mov    edi,eax
  808b57:	e8 16 fe ff ff       	call   808972 <chk_result>
  808b5c:	85 c0                	test   eax,eax
  808b5e:	0f 84 81 00 00 00    	je     808be5 <hd_iterate+0x190>
        {
            printf("disk %d checked.\n",i);
  808b64:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808b67:	89 c6                	mov    esi,eax
  808b69:	bf 18 44 81 00       	mov    edi,0x814418
  808b6e:	b8 00 00 00 00       	mov    eax,0x0
  808b73:	e8 af 81 ff ff       	call   800d27 <printf>
            //新硬盘
            device hd={
  808b78:	48 8d 95 20 ff ff ff 	lea    rdx,[rbp-0xe0]
  808b7f:	b8 00 00 00 00       	mov    eax,0x0
  808b84:	b9 15 00 00 00       	mov    ecx,0x15
  808b89:	48 89 d7             	mov    rdi,rdx
  808b8c:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  808b8f:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808b92:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  808b98:	c7 85 28 ff ff ff 01 	mov    DWORD PTR [rbp-0xd8],0x1
  808b9f:	00 00 00 
  808ba2:	c7 85 2c ff ff ff 01 	mov    DWORD PTR [rbp-0xd4],0x1
  808ba9:	00 00 00 
                .type=DEV_TYPE_BLKDEV,
                .stype=DEV_STYPE_HD,
                .slave_dev=disk,
                .start_port=i<2?PORT_DISK_MAJOR:PORT_DISK_SLAVE
  808bac:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  808bb0:	7f 07                	jg     808bb9 <hd_iterate+0x164>
  808bb2:	b8 f0 01 00 00       	mov    eax,0x1f0
  808bb7:	eb 05                	jmp    808bbe <hd_iterate+0x169>
  808bb9:	b8 70 01 00 00       	mov    eax,0x170
            device hd={
  808bbe:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            };
            disks[i]=reg_device(&hd);
  808bc4:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  808bcb:	48 89 c7             	mov    rdi,rax
  808bce:	e8 00 9a ff ff       	call   8025d3 <reg_device>
  808bd3:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  808bd6:	48 63 d2             	movsxd rdx,edx
  808bd9:	89 04 95 00 b6 42 00 	mov    DWORD PTR [rdx*4+0x42b600],eax
  808be0:	e9 81 00 00 00       	jmp    808c66 <hd_iterate+0x211>
        }else if(!chk_result(r[i]))//&&disk_existent(disk)
  808be5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808be8:	48 98                	cdqe   
  808bea:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  808bee:	89 c7                	mov    edi,eax
  808bf0:	e8 7d fd ff ff       	call   808972 <chk_result>
  808bf5:	85 c0                	test   eax,eax
  808bf7:	75 6d                	jne    808c66 <hd_iterate+0x211>
        {
            switch (i)
  808bf9:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  808bfd:	74 3e                	je     808c3d <hd_iterate+0x1e8>
  808bff:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  808c03:	7f 41                	jg     808c46 <hd_iterate+0x1f1>
  808c05:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  808c09:	74 28                	je     808c33 <hd_iterate+0x1de>
  808c0b:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  808c0f:	7f 35                	jg     808c46 <hd_iterate+0x1f1>
  808c11:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  808c15:	74 08                	je     808c1f <hd_iterate+0x1ca>
  808c17:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  808c1b:	74 0c                	je     808c29 <hd_iterate+0x1d4>
  808c1d:	eb 27                	jmp    808c46 <hd_iterate+0x1f1>
            {
            case 0:name="hd0";break;
  808c1f:	48 c7 45 f8 08 44 81 	mov    QWORD PTR [rbp-0x8],0x814408
  808c26:	00 
  808c27:	eb 1d                	jmp    808c46 <hd_iterate+0x1f1>
            case 1:name="hd1";break;
  808c29:	48 c7 45 f8 0c 44 81 	mov    QWORD PTR [rbp-0x8],0x81440c
  808c30:	00 
  808c31:	eb 13                	jmp    808c46 <hd_iterate+0x1f1>
            case 2:name="hd2";break;
  808c33:	48 c7 45 f8 10 44 81 	mov    QWORD PTR [rbp-0x8],0x814410
  808c3a:	00 
  808c3b:	eb 09                	jmp    808c46 <hd_iterate+0x1f1>
            case 3:name="hd3";break;
  808c3d:	48 c7 45 f8 14 44 81 	mov    QWORD PTR [rbp-0x8],0x814414
  808c44:	00 
  808c45:	90                   	nop
            }
            //有硬盘被卸载了
            int devi=sys_find_dev(name);
  808c46:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808c4a:	48 89 c7             	mov    rdi,rax
  808c4d:	e8 b9 9d ff ff       	call   802a0b <sys_find_dev>
  808c52:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            dispose_device(get_dev(devi));
  808c55:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808c58:	89 c7                	mov    edi,eax
  808c5a:	e8 80 a4 ff ff       	call   8030df <get_dev>
  808c5f:	89 c7                	mov    edi,eax
  808c61:	e8 cc a3 ff ff       	call   803032 <dispose_device>
    for(int i=0;i<1;i++)
  808c66:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  808c6a:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  808c6e:	0f 8e 84 fe ff ff    	jle    808af8 <hd_iterate+0xa3>
        }

    }
}
  808c74:	c9                   	leave  
  808c75:	c3                   	ret    

0000000000808c76 <async_check_disk>:

int async_check_disk(int disk)
{
  808c76:	f3 0f 1e fa          	endbr64 
  808c7a:	55                   	push   rbp
  808c7b:	48 89 e5             	mov    rbp,rsp
  808c7e:	48 83 ec 20          	sub    rsp,0x20
  808c82:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    unsigned short disknr=PORT_DISK_MAJOR;
  808c85:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    unsigned short chkcmd=0xe0;
  808c8b:	66 c7 45 fc e0 00    	mov    WORD PTR [rbp-0x4],0xe0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  808c91:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  808c95:	74 06                	je     808c9d <async_check_disk+0x27>
  808c97:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  808c9b:	75 06                	jne    808ca3 <async_check_disk+0x2d>
        disknr=PORT_DISK_SLAVE;
  808c9d:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_MAJOR_SLAVE||disk==DISK_SLAVE_SLAVE)
  808ca3:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  808ca7:	74 06                	je     808caf <async_check_disk+0x39>
  808ca9:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  808cad:	75 06                	jne    808cb5 <async_check_disk+0x3f>
        chkcmd=0xf0;
  808caf:	66 c7 45 fc f0 00    	mov    WORD PTR [rbp-0x4],0xf0
    outb(disknr+2,1);
  808cb5:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808cb9:	83 c0 02             	add    eax,0x2
  808cbc:	0f b7 c0             	movzx  eax,ax
  808cbf:	be 01 00 00 00       	mov    esi,0x1
  808cc4:	89 c7                	mov    edi,eax
  808cc6:	e8 55 ce ff ff       	call   805b20 <outb>
    outb(disknr+3,0);
  808ccb:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808ccf:	83 c0 03             	add    eax,0x3
  808cd2:	0f b7 c0             	movzx  eax,ax
  808cd5:	be 00 00 00 00       	mov    esi,0x0
  808cda:	89 c7                	mov    edi,eax
  808cdc:	e8 3f ce ff ff       	call   805b20 <outb>
    outb(disknr+4,0);
  808ce1:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808ce5:	83 c0 04             	add    eax,0x4
  808ce8:	0f b7 c0             	movzx  eax,ax
  808ceb:	be 00 00 00 00       	mov    esi,0x0
  808cf0:	89 c7                	mov    edi,eax
  808cf2:	e8 29 ce ff ff       	call   805b20 <outb>
    outb(disknr+5,0);
  808cf7:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808cfb:	83 c0 05             	add    eax,0x5
  808cfe:	0f b7 c0             	movzx  eax,ax
  808d01:	be 00 00 00 00       	mov    esi,0x0
  808d06:	89 c7                	mov    edi,eax
  808d08:	e8 13 ce ff ff       	call   805b20 <outb>
    outb(disknr+6,chkcmd);//主硬盘
  808d0d:	0f b7 45 fc          	movzx  eax,WORD PTR [rbp-0x4]
  808d11:	0f b6 d0             	movzx  edx,al
  808d14:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808d18:	83 c0 06             	add    eax,0x6
  808d1b:	0f b7 c0             	movzx  eax,ax
  808d1e:	89 d6                	mov    esi,edx
  808d20:	89 c7                	mov    edi,eax
  808d22:	e8 f9 cd ff ff       	call   805b20 <outb>
    outb(disknr+7,DISK_CMD_CHECK);
  808d27:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808d2b:	83 c0 07             	add    eax,0x7
  808d2e:	0f b7 c0             	movzx  eax,ax
  808d31:	be 90 00 00 00       	mov    esi,0x90
  808d36:	89 c7                	mov    edi,eax
  808d38:	e8 e3 cd ff ff       	call   805b20 <outb>
    //     // {
    //     //     printf("DISK ERR\n");
    //     //     return -1;
    //     // }
    // }
    return 0;
  808d3d:	b8 00 00 00 00       	mov    eax,0x0
}
  808d42:	c9                   	leave  
  808d43:	c3                   	ret    

0000000000808d44 <hd_do_req>:

//接口函数：负责接收VFS的请求然后执行
int hd_do_req(driver_args *args)
{
  808d44:	f3 0f 1e fa          	endbr64 
  808d48:	55                   	push   rbp
  808d49:	48 89 e5             	mov    rbp,rsp
  808d4c:	48 83 ec 18          	sub    rsp,0x18
  808d50:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int diski=0;
  808d54:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;disks[diski]!=args->dev;diski++);
  808d5b:	eb 04                	jmp    808d61 <hd_do_req+0x1d>
  808d5d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  808d61:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808d64:	48 98                	cdqe   
  808d66:	8b 14 85 00 b6 42 00 	mov    edx,DWORD PTR [rax*4+0x42b600]
  808d6d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808d71:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  808d77:	39 c2                	cmp    edx,eax
  808d79:	75 e2                	jne    808d5d <hd_do_req+0x19>
    switch (args->cmd)
  808d7b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808d7f:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  808d85:	83 f8 04             	cmp    eax,0x4
  808d88:	74 72                	je     808dfc <hd_do_req+0xb8>
  808d8a:	83 f8 04             	cmp    eax,0x4
  808d8d:	0f 8f 96 00 00 00    	jg     808e29 <hd_do_req+0xe5>
  808d93:	83 f8 02             	cmp    eax,0x2
  808d96:	74 0a                	je     808da2 <hd_do_req+0x5e>
  808d98:	83 f8 03             	cmp    eax,0x3
  808d9b:	74 32                	je     808dcf <hd_do_req+0x8b>
  808d9d:	e9 87 00 00 00       	jmp    808e29 <hd_do_req+0xe5>
    {
    case DRVF_READ:
        request(diski,DISKREQ_READ,args->lba,args->sec_c,args->dist_addr);
  808da2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808da6:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808da9:	48 98                	cdqe   
  808dab:	48 89 c6             	mov    rsi,rax
  808dae:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808db2:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  808db5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808db9:	8b 10                	mov    edx,DWORD PTR [rax]
  808dbb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808dbe:	49 89 f0             	mov    r8,rsi
  808dc1:	be 00 00 00 00       	mov    esi,0x0
  808dc6:	89 c7                	mov    edi,eax
  808dc8:	e8 f1 f4 ff ff       	call   8082be <request>
        break;
  808dcd:	eb 61                	jmp    808e30 <hd_do_req+0xec>
    case DRVF_WRITE:
        request(diski,DISKREQ_WRITE,args->lba,args->sec_c,args->src_addr);
  808dcf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808dd3:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808dd6:	48 98                	cdqe   
  808dd8:	48 89 c6             	mov    rsi,rax
  808ddb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808ddf:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  808de2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808de6:	8b 10                	mov    edx,DWORD PTR [rax]
  808de8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808deb:	49 89 f0             	mov    r8,rsi
  808dee:	be 01 00 00 00       	mov    esi,0x1
  808df3:	89 c7                	mov    edi,eax
  808df5:	e8 c4 f4 ff ff       	call   8082be <request>
        break;
  808dfa:	eb 34                	jmp    808e30 <hd_do_req+0xec>
    case DRVF_CHK:
        request(diski,DISKREQ_CHECK,args->lba,args->sec_c,args->dist_addr);
  808dfc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808e00:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808e03:	48 98                	cdqe   
  808e05:	48 89 c6             	mov    rsi,rax
  808e08:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808e0c:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  808e0f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808e13:	8b 10                	mov    edx,DWORD PTR [rax]
  808e15:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808e18:	49 89 f0             	mov    r8,rsi
  808e1b:	be 02 00 00 00       	mov    esi,0x2
  808e20:	89 c7                	mov    edi,eax
  808e22:	e8 97 f4 ff ff       	call   8082be <request>
        break;
  808e27:	eb 07                	jmp    808e30 <hd_do_req+0xec>
    default:return -1;
  808e29:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808e2e:	eb 1e                	jmp    808e4e <hd_do_req+0x10a>
    }
    args->stat=REQ_STAT_WORKING;
  808e30:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808e34:	c7 80 ac 00 00 00 02 	mov    DWORD PTR [rax+0xac],0x2
  808e3b:	00 00 00 
    running_devman_req=args;
  808e3e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808e42:	48 89 05 9f 27 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2279f],rax        # 42b5e8 <running_devman_req>
    return 0;
  808e49:	b8 00 00 00 00       	mov    eax,0x0
  808e4e:	c9                   	leave  
  808e4f:	c3                   	ret    

0000000000808e50 <disk_int_handler>:
  808e50:	e8 f9 cc ff ff       	call   805b4e <eoi>
  808e55:	e8 75 f2 ff ff       	call   8080cf <disk_int_handler_c>
  808e5a:	48 cf                	iretq  

0000000000808e5c <read_disk_asm>:
  808e5c:	55                   	push   rbp
  808e5d:	89 e5                	mov    ebp,esp
  808e5f:	66 ba f7 01          	mov    dx,0x1f7
  808e63:	31 c9                	xor    ecx,ecx
  808e65:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  808e6a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  808e6f:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  808e74:	89 c6                	mov    esi,eax
  808e76:	66 ba f2 01          	mov    dx,0x1f2
  808e7a:	88 c8                	mov    al,cl
  808e7c:	ee                   	out    dx,al
  808e7d:	66 ba f3 01          	mov    dx,0x1f3
  808e81:	89 f0                	mov    eax,esi
  808e83:	ee                   	out    dx,al
  808e84:	66 ff c2             	inc    dx
  808e87:	c1 e8 08             	shr    eax,0x8
  808e8a:	ee                   	out    dx,al
  808e8b:	66 ff c2             	inc    dx
  808e8e:	c1 e8 08             	shr    eax,0x8
  808e91:	ee                   	out    dx,al
  808e92:	66 ff c2             	inc    dx
  808e95:	66 c1 e8 08          	shr    ax,0x8
  808e99:	24 0f                	and    al,0xf
  808e9b:	0c e0                	or     al,0xe0
  808e9d:	ee                   	out    dx,al
  808e9e:	66 ff c2             	inc    dx
  808ea1:	b0 20                	mov    al,0x20
  808ea3:	ee                   	out    dx,al

0000000000808ea4 <read_disk_asm.wait>:
  808ea4:	90                   	nop
  808ea5:	ec                   	in     al,dx
  808ea6:	24 88                	and    al,0x88
  808ea8:	3c 08                	cmp    al,0x8
  808eaa:	75 f8                	jne    808ea4 <read_disk_asm.wait>
  808eac:	66 89 d7             	mov    di,dx
  808eaf:	89 c8                	mov    eax,ecx
  808eb1:	66 b9 00 01          	mov    cx,0x100
  808eb5:	66 f7 e1             	mul    cx
  808eb8:	89 c1                	mov    ecx,eax
  808eba:	66 ba f0 01          	mov    dx,0x1f0

0000000000808ebe <read_disk_asm.read>:
  808ebe:	66 ed                	in     ax,dx
  808ec0:	66 67 89 03          	mov    WORD PTR [ebx],ax
  808ec4:	83 c3 02             	add    ebx,0x2
  808ec7:	e2 f5                	loop   808ebe <read_disk_asm.read>
  808ec9:	c9                   	leave  
  808eca:	b8 00 00 00 00       	mov    eax,0x0
  808ecf:	c3                   	ret    

0000000000808ed0 <read_disk_asm.err_disk_reading>:
  808ed0:	66 ba f1 01          	mov    dx,0x1f1
  808ed4:	31 c0                	xor    eax,eax
  808ed6:	66 ed                	in     ax,dx
  808ed8:	89 ec                	mov    esp,ebp
  808eda:	5d                   	pop    rbp
  808edb:	c3                   	ret    

0000000000808edc <write_disk_asm>:
  808edc:	55                   	push   rbp
  808edd:	89 e5                	mov    ebp,esp
  808edf:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  808ee4:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  808ee9:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  808eee:	50                   	push   rax
  808eef:	66 ba f2 01          	mov    dx,0x1f2
  808ef3:	88 c8                	mov    al,cl
  808ef5:	ee                   	out    dx,al
  808ef6:	58                   	pop    rax
  808ef7:	66 ba f3 01          	mov    dx,0x1f3
  808efb:	ee                   	out    dx,al
  808efc:	c1 e8 08             	shr    eax,0x8
  808eff:	66 ba f4 01          	mov    dx,0x1f4
  808f03:	ee                   	out    dx,al
  808f04:	c1 e8 08             	shr    eax,0x8
  808f07:	66 ba f5 01          	mov    dx,0x1f5
  808f0b:	ee                   	out    dx,al
  808f0c:	c1 e8 08             	shr    eax,0x8
  808f0f:	24 0f                	and    al,0xf
  808f11:	0c e0                	or     al,0xe0
  808f13:	66 ba f6 01          	mov    dx,0x1f6
  808f17:	ee                   	out    dx,al
  808f18:	66 ba f7 01          	mov    dx,0x1f7
  808f1c:	b0 30                	mov    al,0x30
  808f1e:	ee                   	out    dx,al

0000000000808f1f <write_disk_asm.not_ready2>:
  808f1f:	90                   	nop
  808f20:	ec                   	in     al,dx
  808f21:	24 88                	and    al,0x88
  808f23:	3c 08                	cmp    al,0x8
  808f25:	75 f8                	jne    808f1f <write_disk_asm.not_ready2>
  808f27:	89 c8                	mov    eax,ecx
  808f29:	66 b9 00 01          	mov    cx,0x100
  808f2d:	66 f7 e1             	mul    cx
  808f30:	89 c1                	mov    ecx,eax
  808f32:	66 ba f0 01          	mov    dx,0x1f0

0000000000808f36 <write_disk_asm.go_on_write>:
  808f36:	66 67 8b 03          	mov    ax,WORD PTR [ebx]
  808f3a:	66 ef                	out    dx,ax
  808f3c:	83 c3 02             	add    ebx,0x2
  808f3f:	e2 f5                	loop   808f36 <write_disk_asm.go_on_write>
  808f41:	89 ec                	mov    esp,ebp
  808f43:	5d                   	pop    rbp
  808f44:	c3                   	ret    

0000000000808f45 <DISK1_FAT32_read_FAT_Entry>:
#include "mem.h"
#include "memory.h"
#include "proc.h"

unsigned int DISK1_FAT32_read_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry)
{
  808f45:	f3 0f 1e fa          	endbr64 
  808f49:	55                   	push   rbp
  808f4a:	48 89 e5             	mov    rbp,rsp
  808f4d:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  808f54:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  808f5b:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
	unsigned int buf[128];
	memset(buf,0,512);
  808f61:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  808f68:	ba 00 02 00 00       	mov    edx,0x200
  808f6d:	be 00 00 00 00       	mov    esi,0x0
  808f72:	48 89 c7             	mov    rdi,rax
  808f75:	e8 7a 2a 00 00       	call   80b9f4 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  808f7a:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  808f81:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808f85:	89 c2                	mov    edx,eax
  808f87:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  808f8d:	c1 e8 07             	shr    eax,0x7
  808f90:	01 d0                	add    eax,edx
  808f92:	89 c2                	mov    edx,eax
  808f94:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  808f9b:	49 89 c0             	mov    r8,rax
  808f9e:	b9 01 00 00 00       	mov    ecx,0x1
  808fa3:	be 00 00 00 00       	mov    esi,0x0
  808fa8:	bf 00 00 00 00       	mov    edi,0x0
  808fad:	e8 0c f3 ff ff       	call   8082be <request>
  808fb2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    chk_result(r);
  808fb5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808fb8:	89 c7                	mov    edi,eax
  808fba:	e8 b3 f9 ff ff       	call   808972 <chk_result>
    printf("DISK1_FAT32_read_FAT_Entry fat_entry:%x,%#010x\n",fat_entry,buf[fat_entry & 0x7f]);
  808fbf:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  808fc5:	83 e0 7f             	and    eax,0x7f
  808fc8:	89 c0                	mov    eax,eax
  808fca:	8b 94 85 f0 fd ff ff 	mov    edx,DWORD PTR [rbp+rax*4-0x210]
  808fd1:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  808fd7:	89 c6                	mov    esi,eax
  808fd9:	bf 30 44 81 00       	mov    edi,0x814430
  808fde:	b8 00 00 00 00       	mov    eax,0x0
  808fe3:	e8 3f 7d ff ff       	call   800d27 <printf>
	return buf[fat_entry & 0x7f] & 0x0fffffff;
  808fe8:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  808fee:	83 e0 7f             	and    eax,0x7f
  808ff1:	89 c0                	mov    eax,eax
  808ff3:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  808ffa:	25 ff ff ff 0f       	and    eax,0xfffffff
}
  808fff:	c9                   	leave  
  809000:	c3                   	ret    

0000000000809001 <DISK1_FAT32_write_FAT_Entry>:


unsigned long DISK1_FAT32_write_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry,unsigned int value)
{
  809001:	f3 0f 1e fa          	endbr64 
  809005:	55                   	push   rbp
  809006:	48 89 e5             	mov    rbp,rsp
  809009:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  809010:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  809017:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
  80901d:	89 95 e0 fd ff ff    	mov    DWORD PTR [rbp-0x220],edx
	unsigned int buf[128];
	int i;

	memset(buf,0,512);
  809023:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80902a:	ba 00 02 00 00       	mov    edx,0x200
  80902f:	be 00 00 00 00       	mov    esi,0x0
  809034:	48 89 c7             	mov    rdi,rax
  809037:	e8 b8 29 00 00       	call   80b9f4 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  80903c:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  809043:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809047:	89 c2                	mov    edx,eax
  809049:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80904f:	c1 e8 07             	shr    eax,0x7
  809052:	01 d0                	add    eax,edx
  809054:	89 c2                	mov    edx,eax
  809056:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80905d:	49 89 c0             	mov    r8,rax
  809060:	b9 01 00 00 00       	mov    ecx,0x1
  809065:	be 00 00 00 00       	mov    esi,0x0
  80906a:	bf 00 00 00 00       	mov    edi,0x0
  80906f:	e8 4a f2 ff ff       	call   8082be <request>
  809074:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    chk_result(r);
  809077:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80907a:	89 c7                	mov    edi,eax
  80907c:	e8 f1 f8 ff ff       	call   808972 <chk_result>
    buf[fat_entry & 0x7f] = (buf[fat_entry & 0x7f] & 0xf0000000) | (value & 0x0fffffff);
  809081:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  809087:	83 e0 7f             	and    eax,0x7f
  80908a:	89 c0                	mov    eax,eax
  80908c:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  809093:	25 00 00 00 f0       	and    eax,0xf0000000
  809098:	89 c6                	mov    esi,eax
  80909a:	8b 85 e0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x220]
  8090a0:	25 ff ff ff 0f       	and    eax,0xfffffff
  8090a5:	89 c1                	mov    ecx,eax
  8090a7:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  8090ad:	83 e0 7f             	and    eax,0x7f
  8090b0:	89 c2                	mov    edx,eax
  8090b2:	89 f0                	mov    eax,esi
  8090b4:	09 c8                	or     eax,ecx
  8090b6:	89 d2                	mov    edx,edx
  8090b8:	89 84 95 f0 fd ff ff 	mov    DWORD PTR [rbp+rdx*4-0x210],eax

	for(i = 0;i < fsbi->NumFATs;i++){
  8090bf:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8090c6:	eb 61                	jmp    809129 <DISK1_FAT32_write_FAT_Entry+0x128>
        int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,fsbi->FAT1_firstsector + fsbi->sector_per_FAT * i + (fat_entry >> 7),1,(unsigned char *)buf);
  8090c8:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  8090cf:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8090d3:	89 c1                	mov    ecx,eax
  8090d5:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  8090dc:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  8090e0:	89 c2                	mov    edx,eax
  8090e2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8090e5:	48 98                	cdqe   
  8090e7:	0f af c2             	imul   eax,edx
  8090ea:	8d 14 01             	lea    edx,[rcx+rax*1]
  8090ed:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  8090f3:	c1 e8 07             	shr    eax,0x7
  8090f6:	01 d0                	add    eax,edx
  8090f8:	89 c2                	mov    edx,eax
  8090fa:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  809101:	49 89 c0             	mov    r8,rax
  809104:	b9 01 00 00 00       	mov    ecx,0x1
  809109:	be 01 00 00 00       	mov    esi,0x1
  80910e:	bf 00 00 00 00       	mov    edi,0x0
  809113:	e8 a6 f1 ff ff       	call   8082be <request>
  809118:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        chk_result(r1);
  80911b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80911e:	89 c7                	mov    edi,eax
  809120:	e8 4d f8 ff ff       	call   808972 <chk_result>
	for(i = 0;i < fsbi->NumFATs;i++){
  809125:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809129:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80912c:	48 63 d0             	movsxd rdx,eax
  80912f:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  809136:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  80913a:	48 39 c2             	cmp    rdx,rax
  80913d:	72 89                	jb     8090c8 <DISK1_FAT32_write_FAT_Entry+0xc7>
    }
	return 1;
  80913f:	b8 01 00 00 00       	mov    eax,0x1
}
  809144:	c9                   	leave  
  809145:	c3                   	ret    

0000000000809146 <FAT32_open>:


long FAT32_open(struct index_node * inode,struct file * filp)
{
  809146:	f3 0f 1e fa          	endbr64 
  80914a:	55                   	push   rbp
  80914b:	48 89 e5             	mov    rbp,rsp
  80914e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809152:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  809156:	b8 01 00 00 00       	mov    eax,0x1
}
  80915b:	5d                   	pop    rbp
  80915c:	c3                   	ret    

000000000080915d <FAT32_close>:


long FAT32_close(struct index_node * inode,struct file * filp)
{
  80915d:	f3 0f 1e fa          	endbr64 
  809161:	55                   	push   rbp
  809162:	48 89 e5             	mov    rbp,rsp
  809165:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809169:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  80916d:	b8 01 00 00 00       	mov    eax,0x1
}
  809172:	5d                   	pop    rbp
  809173:	c3                   	ret    

0000000000809174 <FAT32_read>:


long FAT32_read(struct file * filp,char * buf,unsigned long count,long * position)
{
  809174:	f3 0f 1e fa          	endbr64 
  809178:	55                   	push   rbp
  809179:	48 89 e5             	mov    rbp,rsp
  80917c:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  809180:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  809184:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  809188:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
  80918c:	48 89 4d 80          	mov    QWORD PTR [rbp-0x80],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  809190:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809194:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809198:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80919c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8091a0:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  8091a4:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8091a8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8091ac:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8091b0:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8091b4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8091b8:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

	unsigned long cluster = finode->first_cluster;
  8091bc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8091c0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8091c3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long sector = 0;
  8091c7:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  8091ce:	00 
	int i,length = 0;
  8091cf:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
	long retval = 0;
  8091d6:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  8091dd:	00 
	int index = *position / fsbi->bytes_per_cluster;
  8091de:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8091e2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8091e5:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  8091e9:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  8091ed:	48 99                	cqo    
  8091ef:	48 f7 fe             	idiv   rsi
  8091f2:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  8091f5:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8091f9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8091fc:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  809200:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  809204:	48 99                	cqo    
  809206:	48 f7 f9             	idiv   rcx
  809209:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  80920d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809211:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809215:	be 00 00 00 00       	mov    esi,0x0
  80921a:	48 89 c7             	mov    rdi,rax
  80921d:	b8 00 00 00 00       	mov    eax,0x0
  809222:	e8 92 80 ff ff       	call   8012b9 <vmalloc>
  809227:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax

	if(!cluster)
  80922b:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  809230:	75 0c                	jne    80923e <FAT32_read+0xca>
		return -EFAULT;
  809232:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  809239:	e9 f0 01 00 00       	jmp    80942e <FAT32_read+0x2ba>
	for(i = 0;i < index;i++)
  80923e:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  809245:	eb 1e                	jmp    809265 <FAT32_read+0xf1>
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  809247:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80924b:	89 c2                	mov    edx,eax
  80924d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809251:	89 d6                	mov    esi,edx
  809253:	48 89 c7             	mov    rdi,rax
  809256:	e8 ea fc ff ff       	call   808f45 <DISK1_FAT32_read_FAT_Entry>
  80925b:	89 c0                	mov    eax,eax
  80925d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	for(i = 0;i < index;i++)
  809261:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  809265:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809268:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80926b:	7c da                	jl     809247 <FAT32_read+0xd3>

	if(*position + count > filp->dentry->dir_inode->file_size)
  80926d:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  809271:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809274:	48 89 c2             	mov    rdx,rax
  809277:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80927b:	48 01 c2             	add    rdx,rax
  80927e:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809282:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809286:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80928a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80928d:	48 39 c2             	cmp    rdx,rax
  809290:	76 2c                	jbe    8092be <FAT32_read+0x14a>
		index = count = filp->dentry->dir_inode->file_size - *position;
  809292:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809296:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80929a:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80929e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8092a1:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8092a5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8092a8:	48 89 c1             	mov    rcx,rax
  8092ab:	48 89 d0             	mov    rax,rdx
  8092ae:	48 29 c8             	sub    rax,rcx
  8092b1:	48 89 45 88          	mov    QWORD PTR [rbp-0x78],rax
  8092b5:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8092b9:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
  8092bc:	eb 07                	jmp    8092c5 <FAT32_read+0x151>
	else
		index = count;
  8092be:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8092c2:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax

//	printf("FAT32_read first_cluster:%d,size:%d,preempt_count:%d\n",finode->first_cluster,filp->dentry->dir_inode->file_size,current->preempt_count);

	do
	{
		memset(buffer,0,fsbi->bytes_per_cluster);
  8092c5:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8092c9:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8092cd:	89 c2                	mov    edx,eax
  8092cf:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8092d3:	be 00 00 00 00       	mov    esi,0x0
  8092d8:	48 89 c7             	mov    rdi,rax
  8092db:	e8 14 27 00 00       	call   80b9f4 <memset>
		sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  8092e0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8092e4:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  8092e8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092ec:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  8092f0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8092f4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8092f8:	48 0f af c2          	imul   rax,rdx
  8092fc:	48 01 c8             	add    rax,rcx
  8092ff:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  809303:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809307:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80930b:	89 c1                	mov    ecx,eax
  80930d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809311:	89 c2                	mov    edx,eax
  809313:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  809317:	49 89 c0             	mov    r8,rax
  80931a:	be 00 00 00 00       	mov    esi,0x0
  80931f:	bf 00 00 00 00       	mov    edi,0x0
  809324:	e8 95 ef ff ff       	call   8082be <request>
  809329:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
		if(!chk_result(r))
  80932c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80932f:	89 c7                	mov    edi,eax
  809331:	e8 3c f6 ff ff       	call   808972 <chk_result>
  809336:	85 c0                	test   eax,eax
  809338:	75 1c                	jne    809356 <FAT32_read+0x1e2>
		{
			printf("FAT32 FS(read) read disk ERROR!!!!!!!!!!\n");
  80933a:	bf 60 44 81 00       	mov    edi,0x814460
  80933f:	b8 00 00 00 00       	mov    eax,0x0
  809344:	e8 de 79 ff ff       	call   800d27 <printf>
			retval = -EIO;
  809349:	48 c7 45 e8 e3 ff ff 	mov    QWORD PTR [rbp-0x18],0xffffffffffffffe3
  809350:	ff 
			break;
  809351:	e9 ba 00 00 00       	jmp    809410 <FAT32_read+0x29c>
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  809356:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  809359:	48 63 d0             	movsxd rdx,eax
  80935c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809360:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809364:	48 2b 45 d8          	sub    rax,QWORD PTR [rbp-0x28]
  809368:	48 39 c2             	cmp    rdx,rax
  80936b:	48 0f 4e c2          	cmovle rax,rdx
  80936f:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax

		if((unsigned long)buf < MAX_TASKS)
  809372:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  809376:	48 83 f8 1f          	cmp    rax,0x1f
  80937a:	77 1f                	ja     80939b <FAT32_read+0x227>
			memcpy(buffer + offset,buf,length);
  80937c:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  80937f:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  809383:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  809387:	48 01 c1             	add    rcx,rax
  80938a:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80938e:	48 89 c6             	mov    rsi,rax
  809391:	48 89 cf             	mov    rdi,rcx
  809394:	e8 ac 25 00 00       	call   80b945 <memcpy>
  809399:	eb 1d                	jmp    8093b8 <FAT32_read+0x244>
		else
			memcpy(buffer + offset,buf,length);
  80939b:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  80939e:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  8093a2:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8093a6:	48 01 c1             	add    rcx,rax
  8093a9:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  8093ad:	48 89 c6             	mov    rsi,rax
  8093b0:	48 89 cf             	mov    rdi,rcx
  8093b3:	e8 8d 25 00 00       	call   80b945 <memcpy>

		index -= length;
  8093b8:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  8093bb:	29 45 e4             	sub    DWORD PTR [rbp-0x1c],eax
		buf += length;
  8093be:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  8093c1:	48 98                	cdqe   
  8093c3:	48 01 45 90          	add    QWORD PTR [rbp-0x70],rax
		offset -= offset;
  8093c7:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  8093ce:	00 
		*position += length;
  8093cf:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8093d3:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8093d6:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  8093d9:	48 98                	cdqe   
  8093db:	48 01 c2             	add    rdx,rax
  8093de:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8093e2:	48 89 10             	mov    QWORD PTR [rax],rdx
	}while(index && (cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster)));
  8093e5:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  8093e9:	74 25                	je     809410 <FAT32_read+0x29c>
  8093eb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8093ef:	89 c2                	mov    edx,eax
  8093f1:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8093f5:	89 d6                	mov    esi,edx
  8093f7:	48 89 c7             	mov    rdi,rax
  8093fa:	e8 46 fb ff ff       	call   808f45 <DISK1_FAT32_read_FAT_Entry>
  8093ff:	89 c0                	mov    eax,eax
  809401:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  809405:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80940a:	0f 85 b5 fe ff ff    	jne    8092c5 <FAT32_read+0x151>

	vmfree(buffer);
  809410:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  809414:	48 89 c7             	mov    rdi,rax
  809417:	e8 2c 7f ff ff       	call   801348 <vmfree>
	if(!index)
  80941c:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  809420:	75 08                	jne    80942a <FAT32_read+0x2b6>
		retval = count;
  809422:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809426:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	return retval;
  80942a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
}
  80942e:	c9                   	leave  
  80942f:	c3                   	ret    

0000000000809430 <FAT32_find_available_cluster>:


unsigned long FAT32_find_available_cluster(struct FAT32_sb_info * fsbi)
{
  809430:	f3 0f 1e fa          	endbr64 
  809434:	55                   	push   rbp
  809435:	48 89 e5             	mov    rbp,rsp
  809438:	48 81 ec 30 02 00 00 	sub    rsp,0x230
  80943f:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
	int i,j;
	int fat_entry;
	unsigned long sector_per_fat = fsbi->sector_per_FAT;
  809446:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  80944d:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  809451:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	unsigned int buf[128];

//	fsbi->fat_fsinfo->FSI_Free_Count & fsbi->fat_fsinfo->FSI_Nxt_Free not exactly,so unuse

	for(i = 0;i < sector_per_fat;i++)
  809455:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80945c:	e9 8b 00 00 00       	jmp    8094ec <FAT32_find_available_cluster+0xbc>
	{
		memset(buf,0,512);
  809461:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  809468:	ba 00 02 00 00       	mov    edx,0x200
  80946d:	be 00 00 00 00       	mov    esi,0x0
  809472:	48 89 c7             	mov    rdi,rax
  809475:	e8 7a 25 00 00       	call   80b9f4 <memset>
		int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + i,1,(unsigned char *)buf);
  80947a:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  809481:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809485:	89 c2                	mov    edx,eax
  809487:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80948a:	01 d0                	add    eax,edx
  80948c:	89 c2                	mov    edx,eax
  80948e:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  809495:	49 89 c0             	mov    r8,rax
  809498:	b9 01 00 00 00       	mov    ecx,0x1
  80949d:	be 00 00 00 00       	mov    esi,0x0
  8094a2:	bf 00 00 00 00       	mov    edi,0x0
  8094a7:	e8 12 ee ff ff       	call   8082be <request>
  8094ac:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

		for(j = 0;j < 128;j++)
  8094af:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8094b6:	eb 2a                	jmp    8094e2 <FAT32_find_available_cluster+0xb2>
		{
			if((buf[j] & 0x0fffffff) == 0)
  8094b8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8094bb:	48 98                	cdqe   
  8094bd:	8b 84 85 e0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x220]
  8094c4:	25 ff ff ff 0f       	and    eax,0xfffffff
  8094c9:	85 c0                	test   eax,eax
  8094cb:	75 11                	jne    8094de <FAT32_find_available_cluster+0xae>
				return (i << 7) + j;
  8094cd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8094d0:	c1 e0 07             	shl    eax,0x7
  8094d3:	89 c2                	mov    edx,eax
  8094d5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8094d8:	01 d0                	add    eax,edx
  8094da:	48 98                	cdqe   
  8094dc:	eb 22                	jmp    809500 <FAT32_find_available_cluster+0xd0>
		for(j = 0;j < 128;j++)
  8094de:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8094e2:	83 7d f8 7f          	cmp    DWORD PTR [rbp-0x8],0x7f
  8094e6:	7e d0                	jle    8094b8 <FAT32_find_available_cluster+0x88>
	for(i = 0;i < sector_per_fat;i++)
  8094e8:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8094ec:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8094ef:	48 98                	cdqe   
  8094f1:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  8094f5:	0f 87 66 ff ff ff    	ja     809461 <FAT32_find_available_cluster+0x31>
		}
	}
	return 0;
  8094fb:	b8 00 00 00 00       	mov    eax,0x0
}
  809500:	c9                   	leave  
  809501:	c3                   	ret    

0000000000809502 <FAT32_write>:


long FAT32_write(struct file * filp,char * buf,unsigned long count,long * position)
{
  809502:	f3 0f 1e fa          	endbr64 
  809506:	55                   	push   rbp
  809507:	48 89 e5             	mov    rbp,rsp
  80950a:	48 81 ec 90 00 00 00 	sub    rsp,0x90
  809511:	48 89 7d 88          	mov    QWORD PTR [rbp-0x78],rdi
  809515:	48 89 75 80          	mov    QWORD PTR [rbp-0x80],rsi
  809519:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  809520:	48 89 8d 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  809527:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80952b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80952f:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809533:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809537:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  80953b:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80953f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809543:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809547:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80954b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80954f:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned long cluster = finode->first_cluster;
  809553:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809557:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80955a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long next_cluster = 0;
  80955e:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  809565:	00 
	unsigned long sector = 0;
  809566:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80956d:	00 
	int i,length = 0;
  80956e:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
	long retval = 0;
  809575:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80957c:	00 
	long flags = 0;
  80957d:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  809584:	00 
	int index = *position / fsbi->bytes_per_cluster;
  809585:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80958c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80958f:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  809593:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  809597:	48 99                	cqo    
  809599:	48 f7 fe             	idiv   rsi
  80959c:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  80959f:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8095a6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8095a9:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  8095ad:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  8095b1:	48 99                	cqo    
  8095b3:	48 f7 f9             	idiv   rcx
  8095b6:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  8095ba:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8095be:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8095c2:	be 00 00 00 00       	mov    esi,0x0
  8095c7:	48 89 c7             	mov    rdi,rax
  8095ca:	b8 00 00 00 00       	mov    eax,0x0
  8095cf:	e8 e5 7c ff ff       	call   8012b9 <vmalloc>
  8095d4:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax

	if(!cluster)
  8095d8:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8095dd:	75 1a                	jne    8095f9 <FAT32_write+0xf7>
	{
		cluster = FAT32_find_available_cluster(fsbi);
  8095df:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8095e3:	48 89 c7             	mov    rdi,rax
  8095e6:	e8 45 fe ff ff       	call   809430 <FAT32_find_available_cluster>
  8095eb:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		flags = 1;
  8095ef:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  8095f6:	00 
  8095f7:	eb 2f                	jmp    809628 <FAT32_write+0x126>
	}
	else
		for(i = 0;i < index;i++)
  8095f9:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  809600:	eb 1e                	jmp    809620 <FAT32_write+0x11e>
			cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  809602:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809606:	89 c2                	mov    edx,eax
  809608:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80960c:	89 d6                	mov    esi,edx
  80960e:	48 89 c7             	mov    rdi,rax
  809611:	e8 2f f9 ff ff       	call   808f45 <DISK1_FAT32_read_FAT_Entry>
  809616:	89 c0                	mov    eax,eax
  809618:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		for(i = 0;i < index;i++)
  80961c:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  809620:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809623:	3b 45 d4             	cmp    eax,DWORD PTR [rbp-0x2c]
  809626:	7c da                	jl     809602 <FAT32_write+0x100>

	if(!cluster)
  809628:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80962d:	75 18                	jne    809647 <FAT32_write+0x145>
	{
		vmfree(buffer);
  80962f:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809633:	48 89 c7             	mov    rdi,rax
  809636:	e8 0d 7d ff ff       	call   801348 <vmfree>
		return -ENOSPC;
  80963b:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  809642:	e9 13 03 00 00       	jmp    80995a <FAT32_write+0x458>
	}

	if(flags)
  809647:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80964c:	74 4d                	je     80969b <FAT32_write+0x199>
	{
		finode->first_cluster = cluster;
  80964e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809652:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  809656:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  809659:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80965d:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809661:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809665:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809669:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80966d:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  809671:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809675:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809679:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80967d:	48 89 c7             	mov    rdi,rax
  809680:	ff d2                	call   rdx
		DISK1_FAT32_write_FAT_Entry(fsbi,cluster,0x0ffffff8);
  809682:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809686:	89 c1                	mov    ecx,eax
  809688:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80968c:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  809691:	89 ce                	mov    esi,ecx
  809693:	48 89 c7             	mov    rdi,rax
  809696:	e8 66 f9 ff ff       	call   809001 <DISK1_FAT32_write_FAT_Entry>
	}

	index = count;
  80969b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8096a2:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax

	do
	{
		if(!flags)
  8096a5:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  8096aa:	0f 85 91 00 00 00    	jne    809741 <FAT32_write+0x23f>
		{
			memset(buffer,0,fsbi->bytes_per_cluster);
  8096b0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8096b4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8096b8:	89 c2                	mov    edx,eax
  8096ba:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8096be:	be 00 00 00 00       	mov    esi,0x0
  8096c3:	48 89 c7             	mov    rdi,rax
  8096c6:	e8 29 23 00 00       	call   80b9f4 <memset>
			sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  8096cb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8096cf:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  8096d3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8096d7:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  8096db:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8096df:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8096e3:	48 0f af c2          	imul   rax,rdx
  8096e7:	48 01 c8             	add    rax,rcx
  8096ea:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  8096ee:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8096f2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8096f6:	89 c1                	mov    ecx,eax
  8096f8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8096fc:	89 c2                	mov    edx,eax
  8096fe:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809702:	49 89 c0             	mov    r8,rax
  809705:	be 00 00 00 00       	mov    esi,0x0
  80970a:	bf 00 00 00 00       	mov    edi,0x0
  80970f:	e8 aa eb ff ff       	call   8082be <request>
  809714:	89 45 9c             	mov    DWORD PTR [rbp-0x64],eax

			if(!chk_result(r))
  809717:	8b 45 9c             	mov    eax,DWORD PTR [rbp-0x64]
  80971a:	89 c7                	mov    edi,eax
  80971c:	e8 51 f2 ff ff       	call   808972 <chk_result>
  809721:	85 c0                	test   eax,eax
  809723:	75 1c                	jne    809741 <FAT32_write+0x23f>
			{
				printf("FAT32 FS(write) read disk ERROR!!!!!!!!!!\n");
  809725:	bf 90 44 81 00       	mov    edi,0x814490
  80972a:	b8 00 00 00 00       	mov    eax,0x0
  80972f:	e8 f3 75 ff ff       	call   800d27 <printf>
				retval = -EIO;
  809734:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  80973b:	ff 
				break;
  80973c:	e9 95 01 00 00       	jmp    8098d6 <FAT32_write+0x3d4>
			}
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  809741:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  809744:	48 63 d0             	movsxd rdx,eax
  809747:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80974b:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80974f:	48 2b 45 c8          	sub    rax,QWORD PTR [rbp-0x38]
  809753:	48 39 c2             	cmp    rdx,rax
  809756:	48 0f 4e c2          	cmovle rax,rdx
  80975a:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax

		if((unsigned long)buf < MAX_TASKS)
  80975d:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  809761:	48 83 f8 1f          	cmp    rax,0x1f
  809765:	77 1f                	ja     809786 <FAT32_write+0x284>
			memcpy(buf,buffer + offset,length);
  809767:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  80976a:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  80976e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809772:	48 01 c1             	add    rcx,rax
  809775:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  809779:	48 89 ce             	mov    rsi,rcx
  80977c:	48 89 c7             	mov    rdi,rax
  80977f:	e8 c1 21 00 00       	call   80b945 <memcpy>
  809784:	eb 1d                	jmp    8097a3 <FAT32_write+0x2a1>
		else
			memcpy(buf,buffer + offset,length);
  809786:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  809789:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  80978d:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809791:	48 01 c1             	add    rcx,rax
  809794:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  809798:	48 89 ce             	mov    rsi,rcx
  80979b:	48 89 c7             	mov    rdi,rax
  80979e:	e8 a2 21 00 00       	call   80b945 <memcpy>

		int r=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  8097a3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8097a7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8097ab:	89 c1                	mov    ecx,eax
  8097ad:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8097b1:	89 c2                	mov    edx,eax
  8097b3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8097b7:	49 89 c0             	mov    r8,rax
  8097ba:	be 01 00 00 00       	mov    esi,0x1
  8097bf:	bf 00 00 00 00       	mov    edi,0x0
  8097c4:	e8 f5 ea ff ff       	call   8082be <request>
  8097c9:	89 45 98             	mov    DWORD PTR [rbp-0x68],eax
        if(!chk_result(r))
  8097cc:	8b 45 98             	mov    eax,DWORD PTR [rbp-0x68]
  8097cf:	89 c7                	mov    edi,eax
  8097d1:	e8 9c f1 ff ff       	call   808972 <chk_result>
  8097d6:	85 c0                	test   eax,eax
  8097d8:	75 1c                	jne    8097f6 <FAT32_write+0x2f4>
		{
			printf("FAT32 FS(write) write disk ERROR!!!!!!!!!!\n");
  8097da:	bf c0 44 81 00       	mov    edi,0x8144c0
  8097df:	b8 00 00 00 00       	mov    eax,0x0
  8097e4:	e8 3e 75 ff ff       	call   800d27 <printf>
			retval = -EIO;
  8097e9:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  8097f0:	ff 
			break;
  8097f1:	e9 e0 00 00 00       	jmp    8098d6 <FAT32_write+0x3d4>
		}

		index -= length;
  8097f6:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8097f9:	29 45 d4             	sub    DWORD PTR [rbp-0x2c],eax
		buf += length;
  8097fc:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8097ff:	48 98                	cdqe   
  809801:	48 01 45 80          	add    QWORD PTR [rbp-0x80],rax
		offset -= offset;
  809805:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  80980c:	00 
		*position += length;
  80980d:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  809814:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809817:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80981a:	48 98                	cdqe   
  80981c:	48 01 c2             	add    rdx,rax
  80981f:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  809826:	48 89 10             	mov    QWORD PTR [rax],rdx

		if(index)
  809829:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  80982d:	0f 84 a2 00 00 00    	je     8098d5 <FAT32_write+0x3d3>
			next_cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  809833:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809837:	89 c2                	mov    edx,eax
  809839:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80983d:	89 d6                	mov    esi,edx
  80983f:	48 89 c7             	mov    rdi,rax
  809842:	e8 fe f6 ff ff       	call   808f45 <DISK1_FAT32_read_FAT_Entry>
  809847:	89 c0                	mov    eax,eax
  809849:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
		else
			break;

		if(next_cluster >= 0x0ffffff8)
  80984d:	48 81 7d b0 f7 ff ff 	cmp    QWORD PTR [rbp-0x50],0xffffff7
  809854:	0f 
  809855:	76 72                	jbe    8098c9 <FAT32_write+0x3c7>
		{
			next_cluster = FAT32_find_available_cluster(fsbi);
  809857:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80985b:	48 89 c7             	mov    rdi,rax
  80985e:	e8 cd fb ff ff       	call   809430 <FAT32_find_available_cluster>
  809863:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
			if(!next_cluster)
  809867:	48 83 7d b0 00       	cmp    QWORD PTR [rbp-0x50],0x0
  80986c:	75 18                	jne    809886 <FAT32_write+0x384>
			{
				vmfree(buffer);
  80986e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  809872:	48 89 c7             	mov    rdi,rax
  809875:	e8 ce 7a ff ff       	call   801348 <vmfree>
				return -ENOSPC;
  80987a:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  809881:	e9 d4 00 00 00       	jmp    80995a <FAT32_write+0x458>
			}			
				
			DISK1_FAT32_write_FAT_Entry(fsbi,cluster,next_cluster);
  809886:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80988a:	89 c2                	mov    edx,eax
  80988c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809890:	89 c1                	mov    ecx,eax
  809892:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809896:	89 ce                	mov    esi,ecx
  809898:	48 89 c7             	mov    rdi,rax
  80989b:	e8 61 f7 ff ff       	call   809001 <DISK1_FAT32_write_FAT_Entry>
			DISK1_FAT32_write_FAT_Entry(fsbi,next_cluster,0x0ffffff8);
  8098a0:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8098a4:	89 c1                	mov    ecx,eax
  8098a6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8098aa:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  8098af:	89 ce                	mov    esi,ecx
  8098b1:	48 89 c7             	mov    rdi,rax
  8098b4:	e8 48 f7 ff ff       	call   809001 <DISK1_FAT32_write_FAT_Entry>
			cluster = next_cluster;
  8098b9:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8098bd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			flags = 1;
  8098c1:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  8098c8:	00 
		}

	}while(index);
  8098c9:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  8098cd:	0f 85 d2 fd ff ff    	jne    8096a5 <FAT32_write+0x1a3>
  8098d3:	eb 01                	jmp    8098d6 <FAT32_write+0x3d4>
			break;
  8098d5:	90                   	nop

	if(*position > filp->dentry->dir_inode->file_size)
  8098d6:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8098dd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8098e0:	48 89 c2             	mov    rdx,rax
  8098e3:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8098e7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8098eb:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8098ef:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8098f2:	48 39 c2             	cmp    rdx,rax
  8098f5:	76 42                	jbe    809939 <FAT32_write+0x437>
	{
		filp->dentry->dir_inode->file_size = *position;
  8098f7:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8098fe:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809901:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809905:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809909:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80990d:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  809910:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  809914:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809918:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80991c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809920:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  809924:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  809928:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  80992c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809930:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809934:	48 89 c7             	mov    rdi,rax
  809937:	ff d2                	call   rdx
	}

	vmfree(buffer);
  809939:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80993d:	48 89 c7             	mov    rdi,rax
  809940:	e8 03 7a ff ff       	call   801348 <vmfree>
	if(!index)
  809945:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  809949:	75 0b                	jne    809956 <FAT32_write+0x454>
		retval = count;
  80994b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  809952:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	return retval;
  809956:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  80995a:	c9                   	leave  
  80995b:	c3                   	ret    

000000000080995c <FAT32_lseek>:


long FAT32_lseek(struct file * filp,long offset,long origin)
{
  80995c:	f3 0f 1e fa          	endbr64 
  809960:	55                   	push   rbp
  809961:	48 89 e5             	mov    rbp,rsp
  809964:	48 83 ec 30          	sub    rsp,0x30
  809968:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80996c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  809970:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	struct index_node *inode = filp->dentry->dir_inode;
  809974:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809978:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80997c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809980:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	long pos = 0;
  809984:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80998b:	00 

	switch(origin)
  80998c:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  809991:	74 21                	je     8099b4 <FAT32_lseek+0x58>
  809993:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  809998:	7f 4a                	jg     8099e4 <FAT32_lseek+0x88>
  80999a:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80999f:	74 09                	je     8099aa <FAT32_lseek+0x4e>
  8099a1:	48 83 7d d8 01       	cmp    QWORD PTR [rbp-0x28],0x1
  8099a6:	74 20                	je     8099c8 <FAT32_lseek+0x6c>
  8099a8:	eb 3a                	jmp    8099e4 <FAT32_lseek+0x88>
	{
		case SEEK_SET:
				pos = offset;
  8099aa:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8099ae:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  8099b2:	eb 39                	jmp    8099ed <FAT32_lseek+0x91>

		case SEEK_CUR:
				pos =  filp->position + offset;
  8099b4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8099b8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8099bb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8099bf:	48 01 d0             	add    rax,rdx
  8099c2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  8099c6:	eb 25                	jmp    8099ed <FAT32_lseek+0x91>

		case SEEK_END:
				pos = filp->dentry->dir_inode->file_size + offset;
  8099c8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8099cc:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8099d0:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8099d4:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8099d7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8099db:	48 01 d0             	add    rax,rdx
  8099de:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  8099e2:	eb 09                	jmp    8099ed <FAT32_lseek+0x91>

		default:
			return -EINVAL;
  8099e4:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  8099eb:	eb 50                	jmp    809a3d <FAT32_lseek+0xe1>
			break;
	}

	if(pos < 0 || pos > filp->dentry->dir_inode->file_size)
  8099ed:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8099f2:	78 18                	js     809a0c <FAT32_lseek+0xb0>
  8099f4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8099f8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8099fc:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809a00:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809a03:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809a07:	48 39 c2             	cmp    rdx,rax
  809a0a:	73 09                	jae    809a15 <FAT32_lseek+0xb9>
		return -EOVERFLOW;
  809a0c:	48 c7 c0 bf ff ff ff 	mov    rax,0xffffffffffffffbf
  809a13:	eb 28                	jmp    809a3d <FAT32_lseek+0xe1>

	filp->position = pos;
  809a15:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809a19:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  809a1d:	48 89 10             	mov    QWORD PTR [rax],rdx
	printf("FAT32 FS(lseek) alert position:%d\n",filp->position);
  809a20:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809a24:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809a27:	48 89 c6             	mov    rsi,rax
  809a2a:	bf f0 44 81 00       	mov    edi,0x8144f0
  809a2f:	b8 00 00 00 00       	mov    eax,0x0
  809a34:	e8 ee 72 ff ff       	call   800d27 <printf>

	return pos;
  809a39:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  809a3d:	c9                   	leave  
  809a3e:	c3                   	ret    

0000000000809a3f <FAT32_ioctl>:


long FAT32_ioctl(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg)
{}
  809a3f:	f3 0f 1e fa          	endbr64 
  809a43:	55                   	push   rbp
  809a44:	48 89 e5             	mov    rbp,rsp
  809a47:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809a4b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  809a4f:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  809a53:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  809a57:	90                   	nop
  809a58:	5d                   	pop    rbp
  809a59:	c3                   	ret    

0000000000809a5a <FAT32_readdir>:

long FAT32_readdir(struct file * filp,void * dirent,filldir_t filler)
{
  809a5a:	f3 0f 1e fa          	endbr64 
  809a5e:	55                   	push   rbp
  809a5f:	48 89 e5             	mov    rbp,rsp
  809a62:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  809a66:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  809a6a:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  809a6e:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  809a72:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809a76:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809a7a:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809a7e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809a82:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  809a86:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809a8a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809a8e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809a92:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809a96:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809a9a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned int cluster = 0;
  809a9e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  809aa5:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  809aac:	00 
	unsigned char * buf =NULL; 
  809aad:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
  809ab4:	00 
	char *name = NULL;
  809ab5:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  809abc:	00 
	int namelen = 0;
  809abd:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
	int i = 0,j = 0,x = 0,y = 0;
  809ac4:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  809acb:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
  809ad2:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  809ad9:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  809ae0:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  809ae7:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  809ae8:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  809aef:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  809af0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809af4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809af8:	be 00 00 00 00       	mov    esi,0x0
  809afd:	48 89 c7             	mov    rdi,rax
  809b00:	b8 00 00 00 00       	mov    eax,0x0
  809b05:	e8 af 77 ff ff       	call   8012b9 <vmalloc>
  809b0a:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax

	cluster = finode->first_cluster;
  809b0e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  809b12:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809b15:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

	j = filp->position/fsbi->bytes_per_cluster;
  809b18:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809b1c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809b1f:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  809b23:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  809b27:	48 99                	cqo    
  809b29:	48 f7 fe             	idiv   rsi
  809b2c:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	
	for(i = 0;i<j;i++)
  809b2f:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  809b36:	eb 3a                	jmp    809b72 <FAT32_readdir+0x118>
	{
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  809b38:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  809b3b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809b3f:	89 d6                	mov    esi,edx
  809b41:	48 89 c7             	mov    rdi,rax
  809b44:	e8 fc f3 ff ff       	call   808f45 <DISK1_FAT32_read_FAT_Entry>
  809b49:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
		if(cluster > 0x0ffffff7)
  809b4c:	81 7d fc f7 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff7
  809b53:	76 19                	jbe    809b6e <FAT32_readdir+0x114>
		{
			printf("FAT32 FS(readdir) cluster didn`t exist\n");
  809b55:	bf 18 45 81 00       	mov    edi,0x814518
  809b5a:	b8 00 00 00 00       	mov    eax,0x0
  809b5f:	e8 c3 71 ff ff       	call   800d27 <printf>
			return NULL;
  809b64:	b8 00 00 00 00       	mov    eax,0x0
  809b69:	e9 86 05 00 00       	jmp    80a0f4 <FAT32_readdir+0x69a>
	for(i = 0;i<j;i++)
  809b6e:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  809b72:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809b75:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  809b78:	7c be                	jl     809b38 <FAT32_readdir+0xde>
		}
	}

next_cluster:
  809b7a:	90                   	nop
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  809b7b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809b7f:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  809b83:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809b86:	83 e8 02             	sub    eax,0x2
  809b89:	89 c1                	mov    ecx,eax
  809b8b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809b8f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809b93:	48 0f af c1          	imul   rax,rcx
  809b97:	48 01 d0             	add    rax,rdx
  809b9a:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  809b9e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809ba2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809ba6:	89 c1                	mov    ecx,eax
  809ba8:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  809bac:	89 c2                	mov    edx,eax
  809bae:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  809bb2:	49 89 c0             	mov    r8,rax
  809bb5:	be 00 00 00 00       	mov    esi,0x0
  809bba:	bf 00 00 00 00       	mov    edi,0x0
  809bbf:	e8 fa e6 ff ff       	call   8082be <request>
  809bc4:	89 45 a4             	mov    DWORD PTR [rbp-0x5c],eax
    if(!chk_result(r))
  809bc7:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  809bca:	89 c7                	mov    edi,eax
  809bcc:	e8 a1 ed ff ff       	call   808972 <chk_result>
  809bd1:	85 c0                	test   eax,eax
  809bd3:	75 25                	jne    809bfa <FAT32_readdir+0x1a0>
	{
		printf("FAT32 FS(readdir) read disk ERROR!!!!!!!!!!\n");
  809bd5:	bf 40 45 81 00       	mov    edi,0x814540
  809bda:	b8 00 00 00 00       	mov    eax,0x0
  809bdf:	e8 43 71 ff ff       	call   800d27 <printf>
		vmfree(buf);
  809be4:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  809be8:	48 89 c7             	mov    rdi,rax
  809beb:	e8 58 77 ff ff       	call   801348 <vmfree>
		return NULL;
  809bf0:	b8 00 00 00 00       	mov    eax,0x0
  809bf5:	e9 fa 04 00 00       	jmp    80a0f4 <FAT32_readdir+0x69a>
	}

	tmpdentry = (struct FAT32_Directory *)(buf + filp->position%fsbi->bytes_per_cluster);
  809bfa:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809bfe:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809c01:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  809c05:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  809c09:	48 99                	cqo    
  809c0b:	48 f7 f9             	idiv   rcx
  809c0e:	48 89 d0             	mov    rax,rdx
  809c11:	48 89 c2             	mov    rdx,rax
  809c14:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  809c18:	48 01 d0             	add    rax,rdx
  809c1b:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  809c1f:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  809c23:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809c26:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  809c2a:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  809c2e:	48 99                	cqo    
  809c30:	48 f7 f9             	idiv   rcx
  809c33:	48 89 d0             	mov    rax,rdx
  809c36:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  809c39:	e9 2f 04 00 00       	jmp    80a06d <FAT32_readdir+0x613>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  809c3e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809c42:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809c46:	3c 0f                	cmp    al,0xf
  809c48:	0f 84 00 04 00 00    	je     80a04e <FAT32_readdir+0x5f4>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  809c4e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809c52:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809c55:	3c e5                	cmp    al,0xe5
  809c57:	0f 84 f4 03 00 00    	je     80a051 <FAT32_readdir+0x5f7>
  809c5d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809c61:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809c64:	84 c0                	test   al,al
  809c66:	0f 84 e5 03 00 00    	je     80a051 <FAT32_readdir+0x5f7>
  809c6c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809c70:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809c73:	3c 05                	cmp    al,0x5
  809c75:	0f 84 d6 03 00 00    	je     80a051 <FAT32_readdir+0x5f7>
			continue;

		namelen = 0;
  809c7b:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  809c82:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809c86:	48 83 e8 20          	sub    rax,0x20
  809c8a:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

		if(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  809c8e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809c92:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809c96:	3c 0f                	cmp    al,0xf
  809c98:	0f 85 2a 02 00 00    	jne    809ec8 <FAT32_readdir+0x46e>
  809c9e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809ca2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809ca5:	3c e5                	cmp    al,0xe5
  809ca7:	0f 84 1b 02 00 00    	je     809ec8 <FAT32_readdir+0x46e>
  809cad:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809cb1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809cb4:	84 c0                	test   al,al
  809cb6:	0f 84 0c 02 00 00    	je     809ec8 <FAT32_readdir+0x46e>
  809cbc:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809cc0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809cc3:	3c 05                	cmp    al,0x5
  809cc5:	0f 84 fd 01 00 00    	je     809ec8 <FAT32_readdir+0x46e>
		{
			j = 0;
  809ccb:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
			//long file/dir name read
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  809cd2:	eb 1a                	jmp    809cee <FAT32_readdir+0x294>
			{
				j++;
  809cd4:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
				if(tmpldentry->LDIR_Ord & 0x40)
  809cd8:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809cdc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809cdf:	0f b6 c0             	movzx  eax,al
  809ce2:	83 e0 40             	and    eax,0x40
  809ce5:	85 c0                	test   eax,eax
  809ce7:	75 34                	jne    809d1d <FAT32_readdir+0x2c3>
					break;
				tmpldentry --;
  809ce9:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  809cee:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809cf2:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809cf6:	3c 0f                	cmp    al,0xf
  809cf8:	75 24                	jne    809d1e <FAT32_readdir+0x2c4>
  809cfa:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809cfe:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d01:	3c e5                	cmp    al,0xe5
  809d03:	74 19                	je     809d1e <FAT32_readdir+0x2c4>
  809d05:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809d09:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d0c:	84 c0                	test   al,al
  809d0e:	74 0e                	je     809d1e <FAT32_readdir+0x2c4>
  809d10:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809d14:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d17:	3c 05                	cmp    al,0x5
  809d19:	75 b9                	jne    809cd4 <FAT32_readdir+0x27a>
  809d1b:	eb 01                	jmp    809d1e <FAT32_readdir+0x2c4>
					break;
  809d1d:	90                   	nop
			}

			name = vmalloc(j*13+1,0);
  809d1e:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  809d21:	89 d0                	mov    eax,edx
  809d23:	01 c0                	add    eax,eax
  809d25:	01 d0                	add    eax,edx
  809d27:	c1 e0 02             	shl    eax,0x2
  809d2a:	01 d0                	add    eax,edx
  809d2c:	83 c0 01             	add    eax,0x1
  809d2f:	be 00 00 00 00       	mov    esi,0x0
  809d34:	89 c7                	mov    edi,eax
  809d36:	b8 00 00 00 00       	mov    eax,0x0
  809d3b:	e8 79 75 ff ff       	call   8012b9 <vmalloc>
  809d40:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
			memset(name,0,j*13+1);
  809d44:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  809d47:	89 d0                	mov    eax,edx
  809d49:	01 c0                	add    eax,eax
  809d4b:	01 d0                	add    eax,edx
  809d4d:	c1 e0 02             	shl    eax,0x2
  809d50:	01 d0                	add    eax,edx
  809d52:	83 c0 01             	add    eax,0x1
  809d55:	89 c2                	mov    edx,eax
  809d57:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809d5b:	be 00 00 00 00       	mov    esi,0x0
  809d60:	48 89 c7             	mov    rdi,rax
  809d63:	e8 8c 1c 00 00       	call   80b9f4 <memset>
			tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  809d68:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809d6c:	48 83 e8 20          	sub    rax,0x20
  809d70:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

			for(x = 0;x<j;x++,tmpldentry --)
  809d74:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  809d7b:	e9 37 01 00 00       	jmp    809eb7 <FAT32_readdir+0x45d>
			{
				for(y = 0;y<5;y++)
  809d80:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  809d87:	eb 53                	jmp    809ddc <FAT32_readdir+0x382>
					if(tmpldentry->LDIR_Name1[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  809d89:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809d8d:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809d90:	48 63 d2             	movsxd rdx,edx
  809d93:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  809d98:	66 83 f8 ff          	cmp    ax,0xffff
  809d9c:	74 3a                	je     809dd8 <FAT32_readdir+0x37e>
  809d9e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809da2:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809da5:	48 63 d2             	movsxd rdx,edx
  809da8:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  809dad:	66 85 c0             	test   ax,ax
  809db0:	74 26                	je     809dd8 <FAT32_readdir+0x37e>
						name[namelen++] = (char)tmpldentry->LDIR_Name1[y];
  809db2:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809db6:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809db9:	48 63 d2             	movsxd rdx,edx
  809dbc:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  809dc1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809dc4:	8d 50 01             	lea    edx,[rax+0x1]
  809dc7:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809dca:	48 63 d0             	movsxd rdx,eax
  809dcd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809dd1:	48 01 d0             	add    rax,rdx
  809dd4:	89 ca                	mov    edx,ecx
  809dd6:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<5;y++)
  809dd8:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  809ddc:	83 7d dc 04          	cmp    DWORD PTR [rbp-0x24],0x4
  809de0:	7e a7                	jle    809d89 <FAT32_readdir+0x32f>

				for(y = 0;y<6;y++)
  809de2:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  809de9:	eb 53                	jmp    809e3e <FAT32_readdir+0x3e4>
					if(tmpldentry->LDIR_Name2[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  809deb:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809def:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809df2:	48 63 d2             	movsxd rdx,edx
  809df5:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  809dfa:	66 83 f8 ff          	cmp    ax,0xffff
  809dfe:	74 3a                	je     809e3a <FAT32_readdir+0x3e0>
  809e00:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809e04:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809e07:	48 63 d2             	movsxd rdx,edx
  809e0a:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  809e0f:	66 85 c0             	test   ax,ax
  809e12:	74 26                	je     809e3a <FAT32_readdir+0x3e0>
						name[namelen++] = (char)tmpldentry->LDIR_Name2[y];
  809e14:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809e18:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809e1b:	48 63 d2             	movsxd rdx,edx
  809e1e:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  809e23:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809e26:	8d 50 01             	lea    edx,[rax+0x1]
  809e29:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809e2c:	48 63 d0             	movsxd rdx,eax
  809e2f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809e33:	48 01 d0             	add    rax,rdx
  809e36:	89 ca                	mov    edx,ecx
  809e38:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<6;y++)
  809e3a:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  809e3e:	83 7d dc 05          	cmp    DWORD PTR [rbp-0x24],0x5
  809e42:	7e a7                	jle    809deb <FAT32_readdir+0x391>

				for(y = 0;y<2;y++)
  809e44:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  809e4b:	eb 5b                	jmp    809ea8 <FAT32_readdir+0x44e>
					if(tmpldentry->LDIR_Name3[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  809e4d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809e51:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809e54:	48 63 d2             	movsxd rdx,edx
  809e57:	48 83 c2 08          	add    rdx,0x8
  809e5b:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  809e60:	66 83 f8 ff          	cmp    ax,0xffff
  809e64:	74 3e                	je     809ea4 <FAT32_readdir+0x44a>
  809e66:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809e6a:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809e6d:	48 63 d2             	movsxd rdx,edx
  809e70:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  809e75:	66 85 c0             	test   ax,ax
  809e78:	74 2a                	je     809ea4 <FAT32_readdir+0x44a>
						name[namelen++] = (char)tmpldentry->LDIR_Name3[y];
  809e7a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809e7e:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  809e81:	48 63 d2             	movsxd rdx,edx
  809e84:	48 83 c2 08          	add    rdx,0x8
  809e88:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  809e8d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809e90:	8d 50 01             	lea    edx,[rax+0x1]
  809e93:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809e96:	48 63 d0             	movsxd rdx,eax
  809e99:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809e9d:	48 01 d0             	add    rax,rdx
  809ea0:	89 ca                	mov    edx,ecx
  809ea2:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<2;y++)
  809ea4:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  809ea8:	83 7d dc 01          	cmp    DWORD PTR [rbp-0x24],0x1
  809eac:	7e 9f                	jle    809e4d <FAT32_readdir+0x3f3>
			for(x = 0;x<j;x++,tmpldentry --)
  809eae:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  809eb2:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
  809eb7:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809eba:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  809ebd:	0f 8c bd fe ff ff    	jl     809d80 <FAT32_readdir+0x326>
			}
			goto find_lookup_success;
  809ec3:	e9 f5 01 00 00       	jmp    80a0bd <FAT32_readdir+0x663>
		}

		name = vmalloc(15,0);
  809ec8:	be 00 00 00 00       	mov    esi,0x0
  809ecd:	bf 0f 00 00 00       	mov    edi,0xf
  809ed2:	b8 00 00 00 00       	mov    eax,0x0
  809ed7:	e8 dd 73 ff ff       	call   8012b9 <vmalloc>
  809edc:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
		memset(name,0,15);
  809ee0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809ee4:	ba 0f 00 00 00       	mov    edx,0xf
  809ee9:	be 00 00 00 00       	mov    esi,0x0
  809eee:	48 89 c7             	mov    rdi,rax
  809ef1:	e8 fe 1a 00 00       	call   80b9f4 <memset>
		//short file/dir base name compare
		for(x=0;x<8;x++)
  809ef6:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  809efd:	eb 74                	jmp    809f73 <FAT32_readdir+0x519>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  809eff:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809f03:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809f06:	48 98                	cdqe   
  809f08:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809f0c:	3c 20                	cmp    al,0x20
  809f0e:	74 6b                	je     809f7b <FAT32_readdir+0x521>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  809f10:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809f14:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  809f18:	0f b6 c0             	movzx  eax,al
  809f1b:	83 e0 08             	and    eax,0x8
  809f1e:	85 c0                	test   eax,eax
  809f20:	74 29                	je     809f4b <FAT32_readdir+0x4f1>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  809f22:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809f26:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809f29:	48 98                	cdqe   
  809f2b:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809f2f:	8d 48 20             	lea    ecx,[rax+0x20]
  809f32:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809f35:	8d 50 01             	lea    edx,[rax+0x1]
  809f38:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809f3b:	48 63 d0             	movsxd rdx,eax
  809f3e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809f42:	48 01 d0             	add    rax,rdx
  809f45:	89 ca                	mov    edx,ecx
  809f47:	88 10                	mov    BYTE PTR [rax],dl
  809f49:	eb 24                	jmp    809f6f <FAT32_readdir+0x515>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  809f4b:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809f4f:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809f52:	48 98                	cdqe   
  809f54:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  809f58:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809f5b:	8d 50 01             	lea    edx,[rax+0x1]
  809f5e:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809f61:	48 63 d0             	movsxd rdx,eax
  809f64:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809f68:	48 01 d0             	add    rax,rdx
  809f6b:	89 ca                	mov    edx,ecx
  809f6d:	88 10                	mov    BYTE PTR [rax],dl
		for(x=0;x<8;x++)
  809f6f:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  809f73:	83 7d e0 07          	cmp    DWORD PTR [rbp-0x20],0x7
  809f77:	7e 86                	jle    809eff <FAT32_readdir+0x4a5>
  809f79:	eb 01                	jmp    809f7c <FAT32_readdir+0x522>
				break;
  809f7b:	90                   	nop
		}

		if(tmpdentry->DIR_Attr & ATTR_DIRECTORY)
  809f7c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809f80:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809f84:	0f b6 c0             	movzx  eax,al
  809f87:	83 e0 10             	and    eax,0x10
  809f8a:	85 c0                	test   eax,eax
  809f8c:	0f 85 27 01 00 00    	jne    80a0b9 <FAT32_readdir+0x65f>
			goto find_lookup_success;

		name[namelen++] = '.';
  809f92:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809f95:	8d 50 01             	lea    edx,[rax+0x1]
  809f98:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809f9b:	48 63 d0             	movsxd rdx,eax
  809f9e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809fa2:	48 01 d0             	add    rax,rdx
  809fa5:	c6 00 2e             	mov    BYTE PTR [rax],0x2e

		//short file ext name compare
		for(x=8;x<11;x++)
  809fa8:	c7 45 e0 08 00 00 00 	mov    DWORD PTR [rbp-0x20],0x8
  809faf:	eb 74                	jmp    80a025 <FAT32_readdir+0x5cb>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  809fb1:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809fb5:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809fb8:	48 98                	cdqe   
  809fba:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809fbe:	3c 20                	cmp    al,0x20
  809fc0:	74 6b                	je     80a02d <FAT32_readdir+0x5d3>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  809fc2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809fc6:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  809fca:	0f b6 c0             	movzx  eax,al
  809fcd:	83 e0 10             	and    eax,0x10
  809fd0:	85 c0                	test   eax,eax
  809fd2:	74 29                	je     809ffd <FAT32_readdir+0x5a3>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  809fd4:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809fd8:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  809fdb:	48 98                	cdqe   
  809fdd:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  809fe1:	8d 48 20             	lea    ecx,[rax+0x20]
  809fe4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809fe7:	8d 50 01             	lea    edx,[rax+0x1]
  809fea:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  809fed:	48 63 d0             	movsxd rdx,eax
  809ff0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809ff4:	48 01 d0             	add    rax,rdx
  809ff7:	89 ca                	mov    edx,ecx
  809ff9:	88 10                	mov    BYTE PTR [rax],dl
  809ffb:	eb 24                	jmp    80a021 <FAT32_readdir+0x5c7>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  809ffd:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80a001:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80a004:	48 98                	cdqe   
  80a006:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  80a00a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80a00d:	8d 50 01             	lea    edx,[rax+0x1]
  80a010:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80a013:	48 63 d0             	movsxd rdx,eax
  80a016:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a01a:	48 01 d0             	add    rax,rdx
  80a01d:	89 ca                	mov    edx,ecx
  80a01f:	88 10                	mov    BYTE PTR [rax],dl
		for(x=8;x<11;x++)
  80a021:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  80a025:	83 7d e0 0a          	cmp    DWORD PTR [rbp-0x20],0xa
  80a029:	7e 86                	jle    809fb1 <FAT32_readdir+0x557>
  80a02b:	eb 01                	jmp    80a02e <FAT32_readdir+0x5d4>
				break;
  80a02d:	90                   	nop
		}
		if(x == 8)
  80a02e:	83 7d e0 08          	cmp    DWORD PTR [rbp-0x20],0x8
  80a032:	0f 85 84 00 00 00    	jne    80a0bc <FAT32_readdir+0x662>
			name[--namelen] = 0;
  80a038:	83 6d ec 01          	sub    DWORD PTR [rbp-0x14],0x1
  80a03c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80a03f:	48 63 d0             	movsxd rdx,eax
  80a042:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a046:	48 01 d0             	add    rax,rdx
  80a049:	c6 00 00             	mov    BYTE PTR [rax],0x0
		goto find_lookup_success;
  80a04c:	eb 6e                	jmp    80a0bc <FAT32_readdir+0x662>
			continue;
  80a04e:	90                   	nop
  80a04f:	eb 01                	jmp    80a052 <FAT32_readdir+0x5f8>
			continue;
  80a051:	90                   	nop
	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  80a052:	83 45 e8 20          	add    DWORD PTR [rbp-0x18],0x20
  80a056:	48 83 45 d0 20       	add    QWORD PTR [rbp-0x30],0x20
  80a05b:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a05f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a062:	48 8d 50 20          	lea    rdx,[rax+0x20]
  80a066:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a06a:	48 89 10             	mov    QWORD PTR [rax],rdx
  80a06d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80a070:	48 63 d0             	movsxd rdx,eax
  80a073:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a077:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a07b:	48 39 c2             	cmp    rdx,rax
  80a07e:	0f 8c ba fb ff ff    	jl     809c3e <FAT32_readdir+0x1e4>
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80a084:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80a087:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a08b:	89 d6                	mov    esi,edx
  80a08d:	48 89 c7             	mov    rdi,rax
  80a090:	e8 b0 ee ff ff       	call   808f45 <DISK1_FAT32_read_FAT_Entry>
  80a095:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  80a098:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  80a09f:	77 05                	ja     80a0a6 <FAT32_readdir+0x64c>
		goto next_cluster;
  80a0a1:	e9 d5 fa ff ff       	jmp    809b7b <FAT32_readdir+0x121>

	vmfree(buf);
  80a0a6:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80a0aa:	48 89 c7             	mov    rdi,rax
  80a0ad:	e8 96 72 ff ff       	call   801348 <vmfree>
	return NULL;
  80a0b2:	b8 00 00 00 00       	mov    eax,0x0
  80a0b7:	eb 3b                	jmp    80a0f4 <FAT32_readdir+0x69a>
			goto find_lookup_success;
  80a0b9:	90                   	nop
  80a0ba:	eb 01                	jmp    80a0bd <FAT32_readdir+0x663>
		goto find_lookup_success;
  80a0bc:	90                   	nop

find_lookup_success:

	filp->position += 32;
  80a0bd:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a0c1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a0c4:	48 8d 50 20          	lea    rdx,[rax+0x20]
  80a0c8:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80a0cc:	48 89 10             	mov    QWORD PTR [rax],rdx
	return filler(dirent,name,namelen,0,0);
  80a0cf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80a0d2:	48 63 d0             	movsxd rdx,eax
  80a0d5:	48 8b 75 f0          	mov    rsi,QWORD PTR [rbp-0x10]
  80a0d9:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80a0dd:	4c 8b 4d 88          	mov    r9,QWORD PTR [rbp-0x78]
  80a0e1:	41 b8 00 00 00 00    	mov    r8d,0x0
  80a0e7:	b9 00 00 00 00       	mov    ecx,0x0
  80a0ec:	48 89 c7             	mov    rdi,rax
  80a0ef:	41 ff d1             	call   r9
  80a0f2:	48 98                	cdqe   
}
  80a0f4:	c9                   	leave  
  80a0f5:	c3                   	ret    

000000000080a0f6 <FAT32_create>:
	.readdir = FAT32_readdir,
};


long FAT32_create(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  80a0f6:	f3 0f 1e fa          	endbr64 
  80a0fa:	55                   	push   rbp
  80a0fb:	48 89 e5             	mov    rbp,rsp
  80a0fe:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a102:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80a106:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80a109:	90                   	nop
  80a10a:	5d                   	pop    rbp
  80a10b:	c3                   	ret    

000000000080a10c <FAT32_lookup>:


struct dir_entry * FAT32_lookup(struct index_node * parent_inode,struct dir_entry * dest_dentry)
{
  80a10c:	f3 0f 1e fa          	endbr64 
  80a110:	55                   	push   rbp
  80a111:	48 89 e5             	mov    rbp,rsp
  80a114:	48 83 ec 60          	sub    rsp,0x60
  80a118:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  80a11c:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
	struct FAT32_inode_info * finode = parent_inode->private_index_info;
  80a120:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80a124:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a128:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	struct FAT32_sb_info * fsbi = parent_inode->sb->private_sb_info;
  80a12c:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80a130:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a134:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a138:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	unsigned int cluster = 0;
  80a13c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  80a143:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  80a14a:	00 
	unsigned char * buf =NULL; 
  80a14b:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  80a152:	00 
	int i = 0,j = 0,x = 0;
  80a153:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80a15a:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80a161:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  80a168:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80a16f:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  80a170:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80a177:	00 
	struct index_node * p = NULL;
  80a178:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  80a17f:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  80a180:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a184:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a188:	be 00 00 00 00       	mov    esi,0x0
  80a18d:	48 89 c7             	mov    rdi,rax
  80a190:	b8 00 00 00 00       	mov    eax,0x0
  80a195:	e8 1f 71 ff ff       	call   8012b9 <vmalloc>
  80a19a:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax

	cluster = finode->first_cluster;
  80a19e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a1a2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80a1a5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

next_cluster:
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  80a1a8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a1ac:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  80a1b0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a1b3:	83 e8 02             	sub    eax,0x2
  80a1b6:	89 c1                	mov    ecx,eax
  80a1b8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a1bc:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a1c0:	48 0f af c1          	imul   rax,rcx
  80a1c4:	48 01 d0             	add    rax,rdx
  80a1c7:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
	printf("lookup cluster:%#010x,sector:%x\n",cluster,sector);
  80a1cb:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80a1cf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a1d2:	89 c6                	mov    esi,eax
  80a1d4:	bf 70 45 81 00       	mov    edi,0x814570
  80a1d9:	b8 00 00 00 00       	mov    eax,0x0
  80a1de:	e8 44 6b ff ff       	call   800d27 <printf>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80a1e3:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a1e7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a1eb:	89 c1                	mov    ecx,eax
  80a1ed:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80a1f1:	89 c2                	mov    edx,eax
  80a1f3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80a1f7:	49 89 c0             	mov    r8,rax
  80a1fa:	be 00 00 00 00       	mov    esi,0x0
  80a1ff:	bf 00 00 00 00       	mov    edi,0x0
  80a204:	e8 b5 e0 ff ff       	call   8082be <request>
  80a209:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    if(!chk_result(r))
  80a20c:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80a20f:	89 c7                	mov    edi,eax
  80a211:	e8 5c e7 ff ff       	call   808972 <chk_result>
  80a216:	85 c0                	test   eax,eax
  80a218:	75 25                	jne    80a23f <FAT32_lookup+0x133>
	{
		printf("FAT32 FS(lookup) read disk ERROR!!!!!!!!!!\n");
  80a21a:	bf 98 45 81 00       	mov    edi,0x814598
  80a21f:	b8 00 00 00 00       	mov    eax,0x0
  80a224:	e8 fe 6a ff ff       	call   800d27 <printf>
		vmfree(buf);
  80a229:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80a22d:	48 89 c7             	mov    rdi,rax
  80a230:	e8 13 71 ff ff       	call   801348 <vmfree>
		return NULL;
  80a235:	b8 00 00 00 00       	mov    eax,0x0
  80a23a:	e9 f0 07 00 00       	jmp    80aa2f <FAT32_lookup+0x923>
	}

	tmpdentry = (struct FAT32_Directory *)buf;
  80a23f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80a243:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax

	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  80a247:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80a24e:	e9 9d 05 00 00       	jmp    80a7f0 <FAT32_lookup+0x6e4>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  80a253:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a257:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80a25b:	3c 0f                	cmp    al,0xf
  80a25d:	0f 84 59 05 00 00    	je     80a7bc <FAT32_lookup+0x6b0>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  80a263:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a267:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a26a:	3c e5                	cmp    al,0xe5
  80a26c:	0f 84 4d 05 00 00    	je     80a7bf <FAT32_lookup+0x6b3>
  80a272:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a276:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a279:	84 c0                	test   al,al
  80a27b:	0f 84 3e 05 00 00    	je     80a7bf <FAT32_lookup+0x6b3>
  80a281:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a285:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a288:	3c 05                	cmp    al,0x5
  80a28a:	0f 84 2f 05 00 00    	je     80a7bf <FAT32_lookup+0x6b3>
			continue;

		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  80a290:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a294:	48 83 e8 20          	sub    rax,0x20
  80a298:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
		j = 0;
  80a29c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0

		//long file/dir name compare
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  80a2a3:	e9 88 01 00 00       	jmp    80a430 <FAT32_lookup+0x324>
		{
			for(x=0;x<5;x++)
  80a2a8:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80a2af:	eb 6a                	jmp    80a31b <FAT32_lookup+0x20f>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name1[x] == 0xffff)
  80a2b1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a2b5:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a2b8:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a2bb:	7e 15                	jle    80a2d2 <FAT32_lookup+0x1c6>
  80a2bd:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a2c1:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80a2c4:	48 63 d2             	movsxd rdx,edx
  80a2c7:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80a2cc:	66 83 f8 ff          	cmp    ax,0xffff
  80a2d0:	74 44                	je     80a316 <FAT32_lookup+0x20a>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name1[x] != (unsigned short)(dest_dentry->name[j++]))
  80a2d2:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a2d6:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a2d9:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a2dc:	0f 8f e0 04 00 00    	jg     80a7c2 <FAT32_lookup+0x6b6>
  80a2e2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a2e6:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80a2e9:	48 63 d2             	movsxd rdx,edx
  80a2ec:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  80a2f1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a2f5:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  80a2f8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a2fb:	8d 50 01             	lea    edx,[rax+0x1]
  80a2fe:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  80a301:	48 98                	cdqe   
  80a303:	48 01 f0             	add    rax,rsi
  80a306:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a309:	66 98                	cbw    
  80a30b:	66 39 c1             	cmp    cx,ax
  80a30e:	0f 85 ae 04 00 00    	jne    80a7c2 <FAT32_lookup+0x6b6>
  80a314:	eb 01                	jmp    80a317 <FAT32_lookup+0x20b>
					continue;
  80a316:	90                   	nop
			for(x=0;x<5;x++)
  80a317:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80a31b:	83 7d f0 04          	cmp    DWORD PTR [rbp-0x10],0x4
  80a31f:	7e 90                	jle    80a2b1 <FAT32_lookup+0x1a5>
					goto continue_cmp_fail;
			}
			for(x=0;x<6;x++)
  80a321:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80a328:	eb 6a                	jmp    80a394 <FAT32_lookup+0x288>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name2[x] == 0xffff)
  80a32a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a32e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a331:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a334:	7e 15                	jle    80a34b <FAT32_lookup+0x23f>
  80a336:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a33a:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80a33d:	48 63 d2             	movsxd rdx,edx
  80a340:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  80a345:	66 83 f8 ff          	cmp    ax,0xffff
  80a349:	74 44                	je     80a38f <FAT32_lookup+0x283>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name2[x] != (unsigned short)(dest_dentry->name[j++]))
  80a34b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a34f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a352:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a355:	0f 8f 6a 04 00 00    	jg     80a7c5 <FAT32_lookup+0x6b9>
  80a35b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a35f:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80a362:	48 63 d2             	movsxd rdx,edx
  80a365:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  80a36a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a36e:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  80a371:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a374:	8d 50 01             	lea    edx,[rax+0x1]
  80a377:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  80a37a:	48 98                	cdqe   
  80a37c:	48 01 f0             	add    rax,rsi
  80a37f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a382:	66 98                	cbw    
  80a384:	66 39 c1             	cmp    cx,ax
  80a387:	0f 85 38 04 00 00    	jne    80a7c5 <FAT32_lookup+0x6b9>
  80a38d:	eb 01                	jmp    80a390 <FAT32_lookup+0x284>
					continue;
  80a38f:	90                   	nop
			for(x=0;x<6;x++)
  80a390:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80a394:	83 7d f0 05          	cmp    DWORD PTR [rbp-0x10],0x5
  80a398:	7e 90                	jle    80a32a <FAT32_lookup+0x21e>
					goto continue_cmp_fail;
			}
			for(x=0;x<2;x++)
  80a39a:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80a3a1:	eb 72                	jmp    80a415 <FAT32_lookup+0x309>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name3[x] == 0xffff)
  80a3a3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a3a7:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a3aa:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a3ad:	7e 19                	jle    80a3c8 <FAT32_lookup+0x2bc>
  80a3af:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a3b3:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80a3b6:	48 63 d2             	movsxd rdx,edx
  80a3b9:	48 83 c2 08          	add    rdx,0x8
  80a3bd:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  80a3c2:	66 83 f8 ff          	cmp    ax,0xffff
  80a3c6:	74 48                	je     80a410 <FAT32_lookup+0x304>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name3[x] != (unsigned short)(dest_dentry->name[j++]))
  80a3c8:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a3cc:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a3cf:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a3d2:	0f 8f f0 03 00 00    	jg     80a7c8 <FAT32_lookup+0x6bc>
  80a3d8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a3dc:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80a3df:	48 63 d2             	movsxd rdx,edx
  80a3e2:	48 83 c2 08          	add    rdx,0x8
  80a3e6:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  80a3eb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a3ef:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  80a3f2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a3f5:	8d 50 01             	lea    edx,[rax+0x1]
  80a3f8:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  80a3fb:	48 98                	cdqe   
  80a3fd:	48 01 f0             	add    rax,rsi
  80a400:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a403:	66 98                	cbw    
  80a405:	66 39 c1             	cmp    cx,ax
  80a408:	0f 85 ba 03 00 00    	jne    80a7c8 <FAT32_lookup+0x6bc>
  80a40e:	eb 01                	jmp    80a411 <FAT32_lookup+0x305>
					continue;
  80a410:	90                   	nop
			for(x=0;x<2;x++)
  80a411:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80a415:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  80a419:	7e 88                	jle    80a3a3 <FAT32_lookup+0x297>
					goto continue_cmp_fail;
			}

			if(j >= dest_dentry->name_length)
  80a41b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a41f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a422:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a425:	0f 8d 14 04 00 00    	jge    80a83f <FAT32_lookup+0x733>
			{
				goto find_lookup_success;
			}

			tmpldentry --;
  80a42b:	48 83 6d e0 20       	sub    QWORD PTR [rbp-0x20],0x20
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  80a430:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a434:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80a438:	3c 0f                	cmp    al,0xf
  80a43a:	75 0f                	jne    80a44b <FAT32_lookup+0x33f>
  80a43c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a440:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a443:	3c e5                	cmp    al,0xe5
  80a445:	0f 85 5d fe ff ff    	jne    80a2a8 <FAT32_lookup+0x19c>
		}

		//short file/dir base name compare
		j = 0;
  80a44b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
		for(x=0;x<8;x++)
  80a452:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80a459:	e9 f4 01 00 00       	jmp    80a652 <FAT32_lookup+0x546>
		{
			switch(tmpdentry->DIR_Name[x])
  80a45e:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a462:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a465:	48 98                	cdqe   
  80a467:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a46b:	0f b6 c0             	movzx  eax,al
  80a46e:	83 f8 7a             	cmp    eax,0x7a
  80a471:	0f 8f d0 01 00 00    	jg     80a647 <FAT32_lookup+0x53b>
  80a477:	83 f8 61             	cmp    eax,0x61
  80a47a:	0f 8d e6 00 00 00    	jge    80a566 <FAT32_lookup+0x45a>
  80a480:	83 f8 5a             	cmp    eax,0x5a
  80a483:	0f 8f be 01 00 00    	jg     80a647 <FAT32_lookup+0x53b>
  80a489:	83 f8 41             	cmp    eax,0x41
  80a48c:	0f 8d d4 00 00 00    	jge    80a566 <FAT32_lookup+0x45a>
  80a492:	83 f8 20             	cmp    eax,0x20
  80a495:	74 1a                	je     80a4b1 <FAT32_lookup+0x3a5>
  80a497:	83 f8 20             	cmp    eax,0x20
  80a49a:	0f 8c a7 01 00 00    	jl     80a647 <FAT32_lookup+0x53b>
  80a4a0:	83 e8 30             	sub    eax,0x30
  80a4a3:	83 f8 09             	cmp    eax,0x9
  80a4a6:	0f 87 9b 01 00 00    	ja     80a647 <FAT32_lookup+0x53b>
  80a4ac:	e9 53 01 00 00       	jmp    80a604 <FAT32_lookup+0x4f8>
			{
				case ' ':
					if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  80a4b1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a4b5:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80a4b9:	0f b6 c0             	movzx  eax,al
  80a4bc:	83 e0 10             	and    eax,0x10
  80a4bf:	85 c0                	test   eax,eax
  80a4c1:	75 50                	jne    80a513 <FAT32_lookup+0x407>
					{
						if(dest_dentry->name[j]=='.')
  80a4c3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a4c7:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80a4ca:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a4cd:	48 98                	cdqe   
  80a4cf:	48 01 d0             	add    rax,rdx
  80a4d2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a4d5:	3c 2e                	cmp    al,0x2e
  80a4d7:	0f 84 70 01 00 00    	je     80a64d <FAT32_lookup+0x541>
							continue;
						else if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a4dd:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a4e1:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a4e4:	48 98                	cdqe   
  80a4e6:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a4ea:	0f b6 d0             	movzx  edx,al
  80a4ed:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a4f1:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a4f4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a4f7:	48 98                	cdqe   
  80a4f9:	48 01 c8             	add    rax,rcx
  80a4fc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a4ff:	0f be c0             	movsx  eax,al
  80a502:	39 c2                	cmp    edx,eax
  80a504:	0f 85 c1 02 00 00    	jne    80a7cb <FAT32_lookup+0x6bf>
						{
							j++;
  80a50a:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80a50e:	e9 3b 01 00 00       	jmp    80a64e <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a513:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a517:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a51a:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a51d:	7d 32                	jge    80a551 <FAT32_lookup+0x445>
  80a51f:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a523:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a526:	48 98                	cdqe   
  80a528:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a52c:	0f b6 d0             	movzx  edx,al
  80a52f:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a533:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a536:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a539:	48 98                	cdqe   
  80a53b:	48 01 c8             	add    rax,rcx
  80a53e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a541:	0f be c0             	movsx  eax,al
  80a544:	39 c2                	cmp    edx,eax
  80a546:	75 09                	jne    80a551 <FAT32_lookup+0x445>
						{
							j++;
  80a548:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80a54c:	e9 fd 00 00 00       	jmp    80a64e <FAT32_lookup+0x542>
						}
						else if(j == dest_dentry->name_length)
  80a551:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a555:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a558:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a55b:	0f 85 6d 02 00 00    	jne    80a7ce <FAT32_lookup+0x6c2>
							continue;
  80a561:	e9 e8 00 00 00       	jmp    80a64e <FAT32_lookup+0x542>
							goto continue_cmp_fail;
					}

				case 'A' ... 'Z':
				case 'a' ... 'z':
					if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  80a566:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a56a:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80a56e:	0f b6 c0             	movzx  eax,al
  80a571:	83 e0 08             	and    eax,0x8
  80a574:	85 c0                	test   eax,eax
  80a576:	74 49                	je     80a5c1 <FAT32_lookup+0x4b5>
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  80a578:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a57c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a57f:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a582:	0f 8d 49 02 00 00    	jge    80a7d1 <FAT32_lookup+0x6c5>
  80a588:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a58c:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a58f:	48 98                	cdqe   
  80a591:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a595:	0f b6 c0             	movzx  eax,al
  80a598:	8d 50 20             	lea    edx,[rax+0x20]
  80a59b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a59f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a5a2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a5a5:	48 98                	cdqe   
  80a5a7:	48 01 c8             	add    rax,rcx
  80a5aa:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a5ad:	0f be c0             	movsx  eax,al
  80a5b0:	39 c2                	cmp    edx,eax
  80a5b2:	0f 85 19 02 00 00    	jne    80a7d1 <FAT32_lookup+0x6c5>
						{
							j++;
  80a5b8:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80a5bc:	e9 8d 00 00 00       	jmp    80a64e <FAT32_lookup+0x542>
						}
						else
							goto continue_cmp_fail;
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a5c1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a5c5:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a5c8:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a5cb:	0f 8d 03 02 00 00    	jge    80a7d4 <FAT32_lookup+0x6c8>
  80a5d1:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a5d5:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a5d8:	48 98                	cdqe   
  80a5da:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a5de:	0f b6 d0             	movzx  edx,al
  80a5e1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a5e5:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a5e8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a5eb:	48 98                	cdqe   
  80a5ed:	48 01 c8             	add    rax,rcx
  80a5f0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a5f3:	0f be c0             	movsx  eax,al
  80a5f6:	39 c2                	cmp    edx,eax
  80a5f8:	0f 85 d6 01 00 00    	jne    80a7d4 <FAT32_lookup+0x6c8>
						{
							j++;
  80a5fe:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80a602:	eb 4a                	jmp    80a64e <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}

				case '0' ... '9':
					if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a604:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a608:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a60b:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  80a60e:	0f 8d c3 01 00 00    	jge    80a7d7 <FAT32_lookup+0x6cb>
  80a614:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a618:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a61b:	48 98                	cdqe   
  80a61d:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a621:	0f b6 d0             	movzx  edx,al
  80a624:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a628:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a62b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a62e:	48 98                	cdqe   
  80a630:	48 01 c8             	add    rax,rcx
  80a633:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a636:	0f be c0             	movsx  eax,al
  80a639:	39 c2                	cmp    edx,eax
  80a63b:	0f 85 96 01 00 00    	jne    80a7d7 <FAT32_lookup+0x6cb>
					{
						j++;
  80a641:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
						break;
  80a645:	eb 07                	jmp    80a64e <FAT32_lookup+0x542>
					}
					else
						goto continue_cmp_fail;

				default :
					j++;
  80a647:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
					break;
  80a64b:	eb 01                	jmp    80a64e <FAT32_lookup+0x542>
							continue;
  80a64d:	90                   	nop
		for(x=0;x<8;x++)
  80a64e:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80a652:	83 7d f0 07          	cmp    DWORD PTR [rbp-0x10],0x7
  80a656:	0f 8e 02 fe ff ff    	jle    80a45e <FAT32_lookup+0x352>
			}
		}
		//short file ext name compare
		if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  80a65c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a660:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80a664:	0f b6 c0             	movzx  eax,al
  80a667:	83 e0 10             	and    eax,0x10
  80a66a:	85 c0                	test   eax,eax
  80a66c:	0f 85 d0 01 00 00    	jne    80a842 <FAT32_lookup+0x736>
		{
			j++;
  80a672:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
			for(x=8;x<11;x++)
  80a676:	c7 45 f0 08 00 00 00 	mov    DWORD PTR [rbp-0x10],0x8
  80a67d:	e9 2b 01 00 00       	jmp    80a7ad <FAT32_lookup+0x6a1>
			{
				switch(tmpdentry->DIR_Name[x])
  80a682:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a686:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a689:	48 98                	cdqe   
  80a68b:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a68f:	0f b6 c0             	movzx  eax,al
  80a692:	83 f8 7a             	cmp    eax,0x7a
  80a695:	0f 8f 3f 01 00 00    	jg     80a7da <FAT32_lookup+0x6ce>
  80a69b:	83 f8 61             	cmp    eax,0x61
  80a69e:	7d 2e                	jge    80a6ce <FAT32_lookup+0x5c2>
  80a6a0:	83 f8 5a             	cmp    eax,0x5a
  80a6a3:	0f 8f 31 01 00 00    	jg     80a7da <FAT32_lookup+0x6ce>
  80a6a9:	83 f8 41             	cmp    eax,0x41
  80a6ac:	7d 20                	jge    80a6ce <FAT32_lookup+0x5c2>
  80a6ae:	83 f8 20             	cmp    eax,0x20
  80a6b1:	0f 84 c4 00 00 00    	je     80a77b <FAT32_lookup+0x66f>
  80a6b7:	83 f8 20             	cmp    eax,0x20
  80a6ba:	0f 8c 1a 01 00 00    	jl     80a7da <FAT32_lookup+0x6ce>
  80a6c0:	83 e8 30             	sub    eax,0x30
  80a6c3:	83 f8 09             	cmp    eax,0x9
  80a6c6:	0f 87 0e 01 00 00    	ja     80a7da <FAT32_lookup+0x6ce>
  80a6cc:	eb 7e                	jmp    80a74c <FAT32_lookup+0x640>
				{
					case 'A' ... 'Z':
					case 'a' ... 'z':
						if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  80a6ce:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a6d2:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80a6d6:	0f b6 c0             	movzx  eax,al
  80a6d9:	83 e0 10             	and    eax,0x10
  80a6dc:	85 c0                	test   eax,eax
  80a6de:	74 39                	je     80a719 <FAT32_lookup+0x60d>
							if(tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  80a6e0:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a6e4:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a6e7:	48 98                	cdqe   
  80a6e9:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a6ed:	0f b6 c0             	movzx  eax,al
  80a6f0:	8d 50 20             	lea    edx,[rax+0x20]
  80a6f3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a6f7:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a6fa:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a6fd:	48 98                	cdqe   
  80a6ff:	48 01 c8             	add    rax,rcx
  80a702:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a705:	0f be c0             	movsx  eax,al
  80a708:	39 c2                	cmp    edx,eax
  80a70a:	0f 85 cd 00 00 00    	jne    80a7dd <FAT32_lookup+0x6d1>
							{
								j++;
  80a710:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  80a714:	e9 90 00 00 00       	jmp    80a7a9 <FAT32_lookup+0x69d>
							}
							else
								goto continue_cmp_fail;
						else
						{
							if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a719:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a71d:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a720:	48 98                	cdqe   
  80a722:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a726:	0f b6 d0             	movzx  edx,al
  80a729:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a72d:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a730:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a733:	48 98                	cdqe   
  80a735:	48 01 c8             	add    rax,rcx
  80a738:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a73b:	0f be c0             	movsx  eax,al
  80a73e:	39 c2                	cmp    edx,eax
  80a740:	0f 85 9a 00 00 00    	jne    80a7e0 <FAT32_lookup+0x6d4>
							{
								j++;
  80a746:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  80a74a:	eb 5d                	jmp    80a7a9 <FAT32_lookup+0x69d>
							else
								goto continue_cmp_fail;
						}

					case '0' ... '9':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a74c:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a750:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a753:	48 98                	cdqe   
  80a755:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a759:	0f b6 d0             	movzx  edx,al
  80a75c:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a760:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a763:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a766:	48 98                	cdqe   
  80a768:	48 01 c8             	add    rax,rcx
  80a76b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a76e:	0f be c0             	movsx  eax,al
  80a771:	39 c2                	cmp    edx,eax
  80a773:	75 6e                	jne    80a7e3 <FAT32_lookup+0x6d7>
						{
							j++;
  80a775:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80a779:	eb 2e                	jmp    80a7a9 <FAT32_lookup+0x69d>
						}
						else
							goto continue_cmp_fail;

					case ' ':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  80a77b:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80a77f:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80a782:	48 98                	cdqe   
  80a784:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80a788:	0f b6 d0             	movzx  edx,al
  80a78b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80a78f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80a792:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a795:	48 98                	cdqe   
  80a797:	48 01 c8             	add    rax,rcx
  80a79a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a79d:	0f be c0             	movsx  eax,al
  80a7a0:	39 c2                	cmp    edx,eax
  80a7a2:	75 42                	jne    80a7e6 <FAT32_lookup+0x6da>
						{
							j++;
  80a7a4:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  80a7a8:	90                   	nop
			for(x=8;x<11;x++)
  80a7a9:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80a7ad:	83 7d f0 0a          	cmp    DWORD PTR [rbp-0x10],0xa
  80a7b1:	0f 8e cb fe ff ff    	jle    80a682 <FAT32_lookup+0x576>
					default :
						goto continue_cmp_fail;
				}
			}
		}
		goto find_lookup_success;
  80a7b7:	e9 86 00 00 00       	jmp    80a842 <FAT32_lookup+0x736>
			continue;
  80a7bc:	90                   	nop
  80a7bd:	eb 28                	jmp    80a7e7 <FAT32_lookup+0x6db>
			continue;
  80a7bf:	90                   	nop
  80a7c0:	eb 25                	jmp    80a7e7 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80a7c2:	90                   	nop
  80a7c3:	eb 22                	jmp    80a7e7 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80a7c5:	90                   	nop
  80a7c6:	eb 1f                	jmp    80a7e7 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  80a7c8:	90                   	nop
  80a7c9:	eb 1c                	jmp    80a7e7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a7cb:	90                   	nop
  80a7cc:	eb 19                	jmp    80a7e7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a7ce:	90                   	nop
  80a7cf:	eb 16                	jmp    80a7e7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a7d1:	90                   	nop
  80a7d2:	eb 13                	jmp    80a7e7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a7d4:	90                   	nop
  80a7d5:	eb 10                	jmp    80a7e7 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  80a7d7:	90                   	nop
  80a7d8:	eb 0d                	jmp    80a7e7 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  80a7da:	90                   	nop
  80a7db:	eb 0a                	jmp    80a7e7 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  80a7dd:	90                   	nop
  80a7de:	eb 07                	jmp    80a7e7 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  80a7e0:	90                   	nop
  80a7e1:	eb 04                	jmp    80a7e7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a7e3:	90                   	nop
  80a7e4:	eb 01                	jmp    80a7e7 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  80a7e6:	90                   	nop
	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  80a7e7:	83 45 f8 20          	add    DWORD PTR [rbp-0x8],0x20
  80a7eb:	48 83 45 e8 20       	add    QWORD PTR [rbp-0x18],0x20
  80a7f0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80a7f3:	48 63 d0             	movsxd rdx,eax
  80a7f6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a7fa:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a7fe:	48 39 c2             	cmp    rdx,rax
  80a801:	0f 8c 4c fa ff ff    	jl     80a253 <FAT32_lookup+0x147>

continue_cmp_fail:;
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  80a807:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80a80a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a80e:	89 d6                	mov    esi,edx
  80a810:	48 89 c7             	mov    rdi,rax
  80a813:	e8 2d e7 ff ff       	call   808f45 <DISK1_FAT32_read_FAT_Entry>
  80a818:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  80a81b:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  80a822:	77 05                	ja     80a829 <FAT32_lookup+0x71d>
		goto next_cluster;
  80a824:	e9 7f f9 ff ff       	jmp    80a1a8 <FAT32_lookup+0x9c>

	vmfree(buf);
  80a829:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80a82d:	48 89 c7             	mov    rdi,rax
  80a830:	e8 13 6b ff ff       	call   801348 <vmfree>
	return NULL;
  80a835:	b8 00 00 00 00       	mov    eax,0x0
  80a83a:	e9 f0 01 00 00       	jmp    80aa2f <FAT32_lookup+0x923>
				goto find_lookup_success;
  80a83f:	90                   	nop
  80a840:	eb 01                	jmp    80a843 <FAT32_lookup+0x737>
		goto find_lookup_success;
  80a842:	90                   	nop

find_lookup_success:
	p = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  80a843:	be 00 00 00 00       	mov    esi,0x0
  80a848:	bf 38 00 00 00       	mov    edi,0x38
  80a84d:	b8 00 00 00 00       	mov    eax,0x0
  80a852:	e8 62 6a ff ff       	call   8012b9 <vmalloc>
  80a857:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
	memset(p,0,sizeof(struct index_node));
  80a85b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a85f:	ba 38 00 00 00       	mov    edx,0x38
  80a864:	be 00 00 00 00       	mov    esi,0x0
  80a869:	48 89 c7             	mov    rdi,rax
  80a86c:	e8 83 11 00 00       	call   80b9f4 <memset>
	p->file_size = tmpdentry->DIR_FileSize;
  80a871:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a875:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  80a878:	89 c2                	mov    edx,eax
  80a87a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a87e:	48 89 10             	mov    QWORD PTR [rax],rdx
	p->blocks = (p->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  80a881:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a885:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80a888:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a88c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80a890:	48 01 d0             	add    rax,rdx
  80a893:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  80a897:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80a89b:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80a89f:	48 89 c1             	mov    rcx,rax
  80a8a2:	48 89 d0             	mov    rax,rdx
  80a8a5:	ba 00 00 00 00       	mov    edx,0x0
  80a8aa:	48 f7 f1             	div    rcx
  80a8ad:	48 89 c2             	mov    rdx,rax
  80a8b0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a8b4:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	p->attribute = (tmpdentry->DIR_Attr & ATTR_DIRECTORY) ? FS_ATTR_DIR : FS_ATTR_FILE;
  80a8b8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a8bc:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80a8c0:	0f b6 c0             	movzx  eax,al
  80a8c3:	83 e0 10             	and    eax,0x10
  80a8c6:	85 c0                	test   eax,eax
  80a8c8:	74 07                	je     80a8d1 <FAT32_lookup+0x7c5>
  80a8ca:	ba 02 00 00 00       	mov    edx,0x2
  80a8cf:	eb 05                	jmp    80a8d6 <FAT32_lookup+0x7ca>
  80a8d1:	ba 01 00 00 00       	mov    edx,0x1
  80a8d6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a8da:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	p->sb = parent_inode->sb;
  80a8de:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80a8e2:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  80a8e6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a8ea:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	p->f_ops = &FAT32_file_ops;
  80a8ee:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a8f2:	48 c7 40 20 80 c5 80 	mov    QWORD PTR [rax+0x20],0x80c580
  80a8f9:	00 
	p->inode_ops = &FAT32_inode_ops;
  80a8fa:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a8fe:	48 c7 40 28 c0 c5 80 	mov    QWORD PTR [rax+0x28],0x80c5c0
  80a905:	00 

	p->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  80a906:	be 00 00 00 00       	mov    esi,0x0
  80a90b:	bf 20 00 00 00       	mov    edi,0x20
  80a910:	b8 00 00 00 00       	mov    eax,0x0
  80a915:	e8 9f 69 ff ff       	call   8012b9 <vmalloc>
  80a91a:	48 89 c2             	mov    rdx,rax
  80a91d:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a921:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(p->private_index_info,0,sizeof(struct FAT32_inode_info));
  80a925:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a929:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a92d:	ba 20 00 00 00       	mov    edx,0x20
  80a932:	be 00 00 00 00       	mov    esi,0x0
  80a937:	48 89 c7             	mov    rdi,rax
  80a93a:	e8 b5 10 00 00       	call   80b9f4 <memset>
	finode = p->private_index_info;
  80a93f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a943:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80a947:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax

	finode->first_cluster = (tmpdentry->DIR_FstClusHI<< 16 | tmpdentry->DIR_FstClusLO) & 0x0fffffff;
  80a94b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a94f:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80a953:	0f b7 c0             	movzx  eax,ax
  80a956:	c1 e0 10             	shl    eax,0x10
  80a959:	89 c2                	mov    edx,eax
  80a95b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a95f:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  80a963:	0f b7 c0             	movzx  eax,ax
  80a966:	09 d0                	or     eax,edx
  80a968:	48 98                	cdqe   
  80a96a:	25 ff ff ff 0f       	and    eax,0xfffffff
  80a96f:	48 89 c2             	mov    rdx,rax
  80a972:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a976:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = cluster;
  80a979:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80a97c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a980:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	finode->dentry_position = tmpdentry - (struct FAT32_Directory *)buf;
  80a984:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a988:	48 2b 45 c0          	sub    rax,QWORD PTR [rbp-0x40]
  80a98c:	48 c1 f8 05          	sar    rax,0x5
  80a990:	48 89 c2             	mov    rdx,rax
  80a993:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a997:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	finode->create_date = tmpdentry->DIR_CrtTime;
  80a99b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a99f:	0f b7 50 0e          	movzx  edx,WORD PTR [rax+0xe]
  80a9a3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a9a7:	66 89 50 18          	mov    WORD PTR [rax+0x18],dx
	finode->create_time = tmpdentry->DIR_CrtDate;
  80a9ab:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a9af:	0f b7 50 10          	movzx  edx,WORD PTR [rax+0x10]
  80a9b3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a9b7:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	finode->write_date = tmpdentry->DIR_WrtTime;
  80a9bb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a9bf:	0f b7 50 16          	movzx  edx,WORD PTR [rax+0x16]
  80a9c3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a9c7:	66 89 50 1c          	mov    WORD PTR [rax+0x1c],dx
	finode->write_time = tmpdentry->DIR_WrtDate;
  80a9cb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a9cf:	0f b7 50 18          	movzx  edx,WORD PTR [rax+0x18]
  80a9d3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a9d7:	66 89 50 1e          	mov    WORD PTR [rax+0x1e],dx

	if((tmpdentry->DIR_FstClusHI >> 12) && (p->attribute & FS_ATTR_FILE))
  80a9db:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a9df:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80a9e3:	66 c1 e8 0c          	shr    ax,0xc
  80a9e7:	66 85 c0             	test   ax,ax
  80a9ea:	74 27                	je     80aa13 <FAT32_lookup+0x907>
  80a9ec:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80a9f0:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80a9f4:	83 e0 01             	and    eax,0x1
  80a9f7:	48 85 c0             	test   rax,rax
  80a9fa:	74 17                	je     80aa13 <FAT32_lookup+0x907>
	{
		p->attribute |= FS_ATTR_DEVICE;
  80a9fc:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80aa00:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80aa04:	48 83 c8 04          	or     rax,0x4
  80aa08:	48 89 c2             	mov    rdx,rax
  80aa0b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80aa0f:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	}

	dest_dentry->dir_inode = p;
  80aa13:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80aa17:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80aa1b:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	vmfree(buf);
  80aa1f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80aa23:	48 89 c7             	mov    rdi,rax
  80aa26:	e8 1d 69 ff ff       	call   801348 <vmfree>
	return dest_dentry;	
  80aa2b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
}
  80aa2f:	c9                   	leave  
  80aa30:	c3                   	ret    

000000000080aa31 <FAT32_mkdir>:


long FAT32_mkdir(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  80aa31:	f3 0f 1e fa          	endbr64 
  80aa35:	55                   	push   rbp
  80aa36:	48 89 e5             	mov    rbp,rsp
  80aa39:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80aa3d:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80aa41:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80aa44:	90                   	nop
  80aa45:	5d                   	pop    rbp
  80aa46:	c3                   	ret    

000000000080aa47 <FAT32_rmdir>:


long FAT32_rmdir(struct index_node * inode,struct dir_entry * dentry)
{}
  80aa47:	f3 0f 1e fa          	endbr64 
  80aa4b:	55                   	push   rbp
  80aa4c:	48 89 e5             	mov    rbp,rsp
  80aa4f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80aa53:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80aa57:	90                   	nop
  80aa58:	5d                   	pop    rbp
  80aa59:	c3                   	ret    

000000000080aa5a <FAT32_rename>:

long FAT32_rename(struct index_node * old_inode,struct dir_entry * old_dentry,struct index_node * new_inode,struct dir_entry * new_dentry)
{}
  80aa5a:	f3 0f 1e fa          	endbr64 
  80aa5e:	55                   	push   rbp
  80aa5f:	48 89 e5             	mov    rbp,rsp
  80aa62:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80aa66:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80aa6a:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80aa6e:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  80aa72:	90                   	nop
  80aa73:	5d                   	pop    rbp
  80aa74:	c3                   	ret    

000000000080aa75 <FAT32_getattr>:

long FAT32_getattr(struct dir_entry * dentry,unsigned long * attr)
{}
  80aa75:	f3 0f 1e fa          	endbr64 
  80aa79:	55                   	push   rbp
  80aa7a:	48 89 e5             	mov    rbp,rsp
  80aa7d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80aa81:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80aa85:	90                   	nop
  80aa86:	5d                   	pop    rbp
  80aa87:	c3                   	ret    

000000000080aa88 <FAT32_setattr>:

long FAT32_setattr(struct dir_entry * dentry,unsigned long * attr)
{}
  80aa88:	f3 0f 1e fa          	endbr64 
  80aa8c:	55                   	push   rbp
  80aa8d:	48 89 e5             	mov    rbp,rsp
  80aa90:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80aa94:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80aa98:	90                   	nop
  80aa99:	5d                   	pop    rbp
  80aa9a:	c3                   	ret    

000000000080aa9b <FAT32_compare>:
	.setattr = FAT32_setattr,
};


//// these operation need cache and list
long FAT32_compare(struct dir_entry * parent_dentry,char * source_filename,char * destination_filename){}
  80aa9b:	f3 0f 1e fa          	endbr64 
  80aa9f:	55                   	push   rbp
  80aaa0:	48 89 e5             	mov    rbp,rsp
  80aaa3:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80aaa7:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80aaab:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80aaaf:	90                   	nop
  80aab0:	5d                   	pop    rbp
  80aab1:	c3                   	ret    

000000000080aab2 <FAT32_hash>:
long FAT32_hash(struct dir_entry * dentry,char * filename){}
  80aab2:	f3 0f 1e fa          	endbr64 
  80aab6:	55                   	push   rbp
  80aab7:	48 89 e5             	mov    rbp,rsp
  80aaba:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80aabe:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80aac2:	90                   	nop
  80aac3:	5d                   	pop    rbp
  80aac4:	c3                   	ret    

000000000080aac5 <FAT32_release>:
long FAT32_release(struct dir_entry * dentry){}
  80aac5:	f3 0f 1e fa          	endbr64 
  80aac9:	55                   	push   rbp
  80aaca:	48 89 e5             	mov    rbp,rsp
  80aacd:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80aad1:	90                   	nop
  80aad2:	5d                   	pop    rbp
  80aad3:	c3                   	ret    

000000000080aad4 <FAT32_iput>:
long FAT32_iput(struct dir_entry * dentry,struct index_node * inode){}
  80aad4:	f3 0f 1e fa          	endbr64 
  80aad8:	55                   	push   rbp
  80aad9:	48 89 e5             	mov    rbp,rsp
  80aadc:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80aae0:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80aae4:	90                   	nop
  80aae5:	5d                   	pop    rbp
  80aae6:	c3                   	ret    

000000000080aae7 <fat32_write_superblock>:
	.release = FAT32_release,
	.iput = FAT32_iput,
};


void fat32_write_superblock(struct super_block * sb){}
  80aae7:	f3 0f 1e fa          	endbr64 
  80aaeb:	55                   	push   rbp
  80aaec:	48 89 e5             	mov    rbp,rsp
  80aaef:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80aaf3:	90                   	nop
  80aaf4:	5d                   	pop    rbp
  80aaf5:	c3                   	ret    

000000000080aaf6 <fat32_put_superblock>:

void fat32_put_superblock(struct super_block * sb)
{
  80aaf6:	f3 0f 1e fa          	endbr64 
  80aafa:	55                   	push   rbp
  80aafb:	48 89 e5             	mov    rbp,rsp
  80aafe:	48 83 ec 10          	sub    rsp,0x10
  80ab02:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
	vmfree(sb->private_sb_info);
  80ab06:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ab0a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ab0e:	48 89 c7             	mov    rdi,rax
  80ab11:	e8 32 68 ff ff       	call   801348 <vmfree>
	vmfree(sb->root->dir_inode->private_index_info);
  80ab16:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ab1a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ab1d:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80ab21:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80ab25:	48 89 c7             	mov    rdi,rax
  80ab28:	e8 1b 68 ff ff       	call   801348 <vmfree>
	vmfree(sb->root->dir_inode);
  80ab2d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ab31:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ab34:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80ab38:	48 89 c7             	mov    rdi,rax
  80ab3b:	e8 08 68 ff ff       	call   801348 <vmfree>
	vmfree(sb->root);
  80ab40:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ab44:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ab47:	48 89 c7             	mov    rdi,rax
  80ab4a:	e8 f9 67 ff ff       	call   801348 <vmfree>
	vmfree(sb);
  80ab4f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ab53:	48 89 c7             	mov    rdi,rax
  80ab56:	e8 ed 67 ff ff       	call   801348 <vmfree>
}
  80ab5b:	90                   	nop
  80ab5c:	c9                   	leave  
  80ab5d:	c3                   	ret    

000000000080ab5e <fat32_write_inode>:

void fat32_write_inode(struct index_node * inode)
{
  80ab5e:	f3 0f 1e fa          	endbr64 
  80ab62:	55                   	push   rbp
  80ab63:	48 89 e5             	mov    rbp,rsp
  80ab66:	48 83 ec 40          	sub    rsp,0x40
  80ab6a:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
	struct FAT32_Directory * fdentry = NULL;
  80ab6e:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80ab75:	00 
	struct FAT32_Directory * buf = NULL;
  80ab76:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80ab7d:	00 
	struct FAT32_inode_info * finode = inode->private_index_info;
  80ab7e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80ab82:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80ab86:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	struct FAT32_sb_info * fsbi = inode->sb->private_sb_info;
  80ab8a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80ab8e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80ab92:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ab96:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	unsigned long sector = 0;
  80ab9a:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  80aba1:	00 

	if(finode->dentry_location == 0)
  80aba2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80aba6:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80abaa:	48 85 c0             	test   rax,rax
  80abad:	75 14                	jne    80abc3 <fat32_write_inode+0x65>
	{
		printf("FS ERROR:write root inode!\n");	
  80abaf:	bf c4 45 81 00       	mov    edi,0x8145c4
  80abb4:	b8 00 00 00 00       	mov    eax,0x0
  80abb9:	e8 69 61 ff ff       	call   800d27 <printf>
		return ;
  80abbe:	e9 30 01 00 00       	jmp    80acf3 <fat32_write_inode+0x195>
	}

	sector = fsbi->Data_firstsector + (finode->dentry_location - 2) * fsbi->sector_per_cluster;
  80abc3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80abc7:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  80abcb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80abcf:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80abd3:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  80abd7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80abdb:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80abdf:	48 0f af c2          	imul   rax,rdx
  80abe3:	48 01 c8             	add    rax,rcx
  80abe6:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	buf = (struct FAT32_Directory *)vmalloc(fsbi->bytes_per_cluster,0);
  80abea:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80abee:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80abf2:	be 00 00 00 00       	mov    esi,0x0
  80abf7:	48 89 c7             	mov    rdi,rax
  80abfa:	b8 00 00 00 00       	mov    eax,0x0
  80abff:	e8 b5 66 ff ff       	call   8012b9 <vmalloc>
  80ac04:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	memset(buf,0,fsbi->bytes_per_cluster);
  80ac08:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ac0c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80ac10:	89 c2                	mov    edx,eax
  80ac12:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ac16:	be 00 00 00 00       	mov    esi,0x0
  80ac1b:	48 89 c7             	mov    rdi,rax
  80ac1e:	e8 d1 0d 00 00       	call   80b9f4 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80ac23:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ac27:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ac2b:	89 c1                	mov    ecx,eax
  80ac2d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80ac31:	89 c2                	mov    edx,eax
  80ac33:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ac37:	49 89 c0             	mov    r8,rax
  80ac3a:	be 00 00 00 00       	mov    esi,0x0
  80ac3f:	bf 00 00 00 00       	mov    edi,0x0
  80ac44:	e8 75 d6 ff ff       	call   8082be <request>
  80ac49:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    chk_result(r);
  80ac4c:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80ac4f:	89 c7                	mov    edi,eax
  80ac51:	e8 1c dd ff ff       	call   808972 <chk_result>
    fdentry = buf+finode->dentry_position;
  80ac56:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ac5a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ac5e:	48 c1 e0 05          	shl    rax,0x5
  80ac62:	48 89 c2             	mov    rdx,rax
  80ac65:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ac69:	48 01 d0             	add    rax,rdx
  80ac6c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

	////alert fat32 dentry data
	fdentry->DIR_FileSize = inode->file_size;
  80ac70:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80ac74:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ac77:	89 c2                	mov    edx,eax
  80ac79:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ac7d:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
	fdentry->DIR_FstClusLO = finode->first_cluster & 0xffff;
  80ac80:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ac84:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80ac87:	89 c2                	mov    edx,eax
  80ac89:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ac8d:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	fdentry->DIR_FstClusHI = (fdentry->DIR_FstClusHI & 0xf000) | (finode->first_cluster >> 16);
  80ac91:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ac95:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  80ac99:	66 25 00 f0          	and    ax,0xf000
  80ac9d:	89 c2                	mov    edx,eax
  80ac9f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80aca3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aca6:	48 c1 e8 10          	shr    rax,0x10
  80acaa:	09 c2                	or     edx,eax
  80acac:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80acb0:	66 89 50 14          	mov    WORD PTR [rax+0x14],dx

	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80acb4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80acb8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80acbc:	89 c1                	mov    ecx,eax
  80acbe:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80acc2:	89 c2                	mov    edx,eax
  80acc4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80acc8:	49 89 c0             	mov    r8,rax
  80accb:	be 01 00 00 00       	mov    esi,0x1
  80acd0:	bf 00 00 00 00       	mov    edi,0x0
  80acd5:	e8 e4 d5 ff ff       	call   8082be <request>
  80acda:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    chk_result(r1);
  80acdd:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
  80ace0:	89 c7                	mov    edi,eax
  80ace2:	e8 8b dc ff ff       	call   808972 <chk_result>
	vmfree(buf);
  80ace7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80aceb:	48 89 c7             	mov    rdi,rax
  80acee:	e8 55 66 ff ff       	call   801348 <vmfree>
}
  80acf3:	c9                   	leave  
  80acf4:	c3                   	ret    

000000000080acf5 <fat32_read_superblock>:

	.write_inode = fat32_write_inode,
};

struct super_block * fat32_read_superblock(struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  80acf5:	f3 0f 1e fa          	endbr64 
  80acf9:	55                   	push   rbp
  80acfa:	48 89 e5             	mov    rbp,rsp
  80acfd:	48 83 ec 50          	sub    rsp,0x50
  80ad01:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  80ad05:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
	struct super_block * sbp = NULL;
  80ad09:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80ad10:	00 
	struct FAT32_inode_info * finode = NULL;
  80ad11:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80ad18:	00 
	struct FAT32_BootSector * fbs = NULL;
  80ad19:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80ad20:	00 
	struct FAT32_sb_info * fsbi = NULL;
  80ad21:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80ad28:	00 

	////super block
	sbp = (struct super_block *)vmalloc(sizeof(struct super_block),0);
  80ad29:	be 00 00 00 00       	mov    esi,0x0
  80ad2e:	bf 18 00 00 00       	mov    edi,0x18
  80ad33:	b8 00 00 00 00       	mov    eax,0x0
  80ad38:	e8 7c 65 ff ff       	call   8012b9 <vmalloc>
  80ad3d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	memset(sbp,0,sizeof(struct super_block));
  80ad41:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ad45:	ba 18 00 00 00       	mov    edx,0x18
  80ad4a:	be 00 00 00 00       	mov    esi,0x0
  80ad4f:	48 89 c7             	mov    rdi,rax
  80ad52:	e8 9d 0c 00 00       	call   80b9f4 <memset>

	sbp->sb_ops = &FAT32_sb_ops;
  80ad57:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ad5b:	48 c7 40 08 20 c6 80 	mov    QWORD PTR [rax+0x8],0x80c620
  80ad62:	00 
	sbp->private_sb_info = (struct FAT32_sb_info *)vmalloc(sizeof(struct FAT32_sb_info),0);
  80ad63:	be 00 00 00 00       	mov    esi,0x0
  80ad68:	bf 60 00 00 00       	mov    edi,0x60
  80ad6d:	b8 00 00 00 00       	mov    eax,0x0
  80ad72:	e8 42 65 ff ff       	call   8012b9 <vmalloc>
  80ad77:	48 89 c2             	mov    rdx,rax
  80ad7a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ad7e:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	memset(sbp->private_sb_info,0,sizeof(struct FAT32_sb_info));
  80ad82:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ad86:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80ad8a:	ba 60 00 00 00       	mov    edx,0x60
  80ad8f:	be 00 00 00 00       	mov    esi,0x0
  80ad94:	48 89 c7             	mov    rdi,rax
  80ad97:	e8 58 0c 00 00       	call   80b9f4 <memset>

	////fat32 boot sector
	fbs = (struct FAT32_BootSector *)buf;
  80ad9c:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80ada0:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
 	fsbi = sbp->private_sb_info;
  80ada4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ada8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80adac:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	fsbi->start_sector = DPTE->start_LBA;
  80adb0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80adb4:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80adb7:	89 c2                	mov    edx,eax
  80adb9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80adbd:	48 89 10             	mov    QWORD PTR [rax],rdx
	fsbi->sector_count = DPTE->sectors_limit;
  80adc0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80adc4:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80adc7:	89 c2                	mov    edx,eax
  80adc9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80adcd:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	fsbi->sector_per_cluster = fbs->BPB_SecPerClus;
  80add1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80add5:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  80add9:	0f b6 d0             	movzx  edx,al
  80addc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ade0:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	fsbi->bytes_per_cluster = fbs->BPB_SecPerClus * fbs->BPB_BytesPerSec;
  80ade4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ade8:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  80adec:	0f b6 d0             	movzx  edx,al
  80adef:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80adf3:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  80adf7:	0f b7 c0             	movzx  eax,ax
  80adfa:	0f af c2             	imul   eax,edx
  80adfd:	48 63 d0             	movsxd rdx,eax
  80ae00:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ae04:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	fsbi->bytes_per_sector = fbs->BPB_BytesPerSec;
  80ae08:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ae0c:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  80ae10:	0f b7 d0             	movzx  edx,ax
  80ae13:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ae17:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
	fsbi->Data_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt + fbs->BPB_FATSz32 * fbs->BPB_NumFATs;
  80ae1b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ae1f:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80ae22:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ae26:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  80ae2a:	0f b7 c0             	movzx  eax,ax
  80ae2d:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  80ae30:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ae34:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  80ae37:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ae3b:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  80ae3f:	0f b6 c0             	movzx  eax,al
  80ae42:	0f af c2             	imul   eax,edx
  80ae45:	01 c8                	add    eax,ecx
  80ae47:	89 c2                	mov    edx,eax
  80ae49:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ae4d:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
	fsbi->FAT1_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt;
  80ae51:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80ae55:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80ae58:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ae5c:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  80ae60:	0f b7 c0             	movzx  eax,ax
  80ae63:	01 d0                	add    eax,edx
  80ae65:	89 c2                	mov    edx,eax
  80ae67:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ae6b:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	fsbi->sector_per_FAT = fbs->BPB_FATSz32;
  80ae6f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ae73:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  80ae76:	89 c2                	mov    edx,eax
  80ae78:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ae7c:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
	fsbi->NumFATs = fbs->BPB_NumFATs;
  80ae80:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ae84:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  80ae88:	0f b6 d0             	movzx  edx,al
  80ae8b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80ae8f:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
	fsbi->fsinfo_sector_infat = fbs->BPB_FSInfo;
  80ae93:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ae97:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80ae9b:	0f b7 d0             	movzx  edx,ax
  80ae9e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80aea2:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
	fsbi->bootsector_bk_infat = fbs->BPB_BkBootSec;	
  80aea6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80aeaa:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  80aeae:	0f b7 d0             	movzx  edx,ax
  80aeb1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80aeb5:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
	
	printf("FAT32 Boot Sector\n\tBPB_FSInfo:%x\n\tBPB_BkBootSec:%x\n\tBPB_TotSec32:%x\n",fbs->BPB_FSInfo,fbs->BPB_BkBootSec,fbs->BPB_TotSec32);
  80aeb9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80aebd:	8b 48 20             	mov    ecx,DWORD PTR [rax+0x20]
  80aec0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80aec4:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  80aec8:	0f b7 d0             	movzx  edx,ax
  80aecb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80aecf:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80aed3:	0f b7 c0             	movzx  eax,ax
  80aed6:	89 c6                	mov    esi,eax
  80aed8:	bf e0 45 81 00       	mov    edi,0x8145e0
  80aedd:	b8 00 00 00 00       	mov    eax,0x0
  80aee2:	e8 40 5e ff ff       	call   800d27 <printf>
	
	////fat32 fsinfo sector
	fsbi->fat_fsinfo = (struct FAT32_FSInfo *)vmalloc(sizeof(struct FAT32_FSInfo),0);
  80aee7:	be 00 00 00 00       	mov    esi,0x0
  80aeec:	bf 00 02 00 00       	mov    edi,0x200
  80aef1:	b8 00 00 00 00       	mov    eax,0x0
  80aef6:	e8 be 63 ff ff       	call   8012b9 <vmalloc>
  80aefb:	48 89 c2             	mov    rdx,rax
  80aefe:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80af02:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
	memset(fsbi->fat_fsinfo,0,512);
  80af06:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80af0a:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80af0e:	ba 00 02 00 00       	mov    edx,0x200
  80af13:	be 00 00 00 00       	mov    esi,0x0
  80af18:	48 89 c7             	mov    rdi,rax
  80af1b:	e8 d4 0a 00 00       	call   80b9f4 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPTE->start_LBA + fbs->BPB_FSInfo,1,(unsigned char *)fsbi->fat_fsinfo);
  80af20:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80af24:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  80af28:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80af2c:	8b 48 08             	mov    ecx,DWORD PTR [rax+0x8]
  80af2f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80af33:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80af37:	0f b7 c0             	movzx  eax,ax
  80af3a:	01 c8                	add    eax,ecx
  80af3c:	49 89 d0             	mov    r8,rdx
  80af3f:	b9 01 00 00 00       	mov    ecx,0x1
  80af44:	89 c2                	mov    edx,eax
  80af46:	be 00 00 00 00       	mov    esi,0x0
  80af4b:	bf 00 00 00 00       	mov    edi,0x0
  80af50:	e8 69 d3 ff ff       	call   8082be <request>
  80af55:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    chk_result(r);
  80af58:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80af5b:	89 c7                	mov    edi,eax
  80af5d:	e8 10 da ff ff       	call   808972 <chk_result>
	printf("FAT32 FSInfo\n\tFSI_LeadSig:%x\n\tFSI_StrucSig:%x\n\tFSI_Free_Count:%x\n",fsbi->fat_fsinfo->FSI_LeadSig,fsbi->fat_fsinfo->FSI_StrucSig,fsbi->fat_fsinfo->FSI_Free_Count);
  80af62:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80af66:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80af6a:	8b 88 e8 01 00 00    	mov    ecx,DWORD PTR [rax+0x1e8]
  80af70:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80af74:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80af78:	8b 90 e4 01 00 00    	mov    edx,DWORD PTR [rax+0x1e4]
  80af7e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80af82:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80af86:	8b 00                	mov    eax,DWORD PTR [rax]
  80af88:	89 c6                	mov    esi,eax
  80af8a:	bf 28 46 81 00       	mov    edi,0x814628
  80af8f:	b8 00 00 00 00       	mov    eax,0x0
  80af94:	e8 8e 5d ff ff       	call   800d27 <printf>
	
	////directory entry
	sbp->root = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  80af99:	be 00 00 00 00       	mov    esi,0x0
  80af9e:	bf 48 00 00 00       	mov    edi,0x48
  80afa3:	b8 00 00 00 00       	mov    eax,0x0
  80afa8:	e8 0c 63 ff ff       	call   8012b9 <vmalloc>
  80afad:	48 89 c2             	mov    rdx,rax
  80afb0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80afb4:	48 89 10             	mov    QWORD PTR [rax],rdx
	memset(sbp->root,0,sizeof(struct dir_entry));
  80afb7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80afbb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80afbe:	ba 48 00 00 00       	mov    edx,0x48
  80afc3:	be 00 00 00 00       	mov    esi,0x0
  80afc8:	48 89 c7             	mov    rdi,rax
  80afcb:	e8 24 0a 00 00       	call   80b9f4 <memset>

	list_init(&sbp->root->child_node);
  80afd0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80afd4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80afd7:	48 83 c0 10          	add    rax,0x10
  80afdb:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    list->prev = list;
  80afdf:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80afe3:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80afe7:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  80afea:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80afee:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80aff2:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  80aff6:	90                   	nop
	list_init(&sbp->root->subdirs_list);
  80aff7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80affb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80affe:	48 83 c0 20          	add    rax,0x20
  80b002:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    list->prev = list;
  80b006:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b00a:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80b00e:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  80b011:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b015:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80b019:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  80b01d:	90                   	nop
	sbp->root->parent = sbp->root;
  80b01e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b022:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b025:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80b029:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  80b02c:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
	sbp->root->dir_ops = &FAT32_dentry_ops;
  80b030:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b034:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b037:	48 c7 40 40 00 c6 80 	mov    QWORD PTR [rax+0x40],0x80c600
  80b03e:	00 
	sbp->root->name = (char *)vmalloc(2,0);
  80b03f:	be 00 00 00 00       	mov    esi,0x0
  80b044:	bf 02 00 00 00       	mov    edi,0x2
  80b049:	b8 00 00 00 00       	mov    eax,0x0
  80b04e:	e8 66 62 ff ff       	call   8012b9 <vmalloc>
  80b053:	48 89 c2             	mov    rdx,rax
  80b056:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b05a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b05d:	48 89 10             	mov    QWORD PTR [rax],rdx
	sbp->root->name[0] = '/';
  80b060:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b064:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b067:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b06a:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
	sbp->root->name_length = 1;
  80b06d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b071:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b074:	c7 40 08 01 00 00 00 	mov    DWORD PTR [rax+0x8],0x1

	////index node
	sbp->root->dir_inode = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  80b07b:	be 00 00 00 00       	mov    esi,0x0
  80b080:	bf 38 00 00 00       	mov    edi,0x38
  80b085:	b8 00 00 00 00       	mov    eax,0x0
  80b08a:	e8 2a 62 ff ff       	call   8012b9 <vmalloc>
  80b08f:	48 89 c2             	mov    rdx,rax
  80b092:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b096:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b099:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(sbp->root->dir_inode,0,sizeof(struct index_node));
  80b09d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b0a1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b0a4:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b0a8:	ba 38 00 00 00       	mov    edx,0x38
  80b0ad:	be 00 00 00 00       	mov    esi,0x0
  80b0b2:	48 89 c7             	mov    rdi,rax
  80b0b5:	e8 3a 09 00 00       	call   80b9f4 <memset>
	sbp->root->dir_inode->inode_ops = &FAT32_inode_ops;
  80b0ba:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b0be:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b0c1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b0c5:	48 c7 40 28 c0 c5 80 	mov    QWORD PTR [rax+0x28],0x80c5c0
  80b0cc:	00 
	sbp->root->dir_inode->f_ops = &FAT32_file_ops;
  80b0cd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b0d1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b0d4:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b0d8:	48 c7 40 20 80 c5 80 	mov    QWORD PTR [rax+0x20],0x80c580
  80b0df:	00 
	sbp->root->dir_inode->file_size = 0;
  80b0e0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b0e4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b0e7:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b0eb:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
	sbp->root->dir_inode->blocks = (sbp->root->dir_inode->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  80b0f2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b0f6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b0f9:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b0fd:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80b100:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b104:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80b108:	48 01 d0             	add    rax,rdx
  80b10b:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  80b10f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b113:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80b117:	48 89 c6             	mov    rsi,rax
  80b11a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b11e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b121:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  80b125:	48 89 d0             	mov    rax,rdx
  80b128:	ba 00 00 00 00       	mov    edx,0x0
  80b12d:	48 f7 f6             	div    rsi
  80b130:	48 89 41 08          	mov    QWORD PTR [rcx+0x8],rax
	sbp->root->dir_inode->attribute = FS_ATTR_DIR;
  80b134:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b138:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b13b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b13f:	48 c7 40 10 02 00 00 	mov    QWORD PTR [rax+0x10],0x2
  80b146:	00 
	sbp->root->dir_inode->sb = sbp;
  80b147:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b14b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b14e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b152:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80b156:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx

	////fat32 root inode
	sbp->root->dir_inode->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  80b15a:	be 00 00 00 00       	mov    esi,0x0
  80b15f:	bf 20 00 00 00       	mov    edi,0x20
  80b164:	b8 00 00 00 00       	mov    eax,0x0
  80b169:	e8 4b 61 ff ff       	call   8012b9 <vmalloc>
  80b16e:	48 89 c2             	mov    rdx,rax
  80b171:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b175:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b178:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b17c:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(sbp->root->dir_inode->private_index_info,0,sizeof(struct FAT32_inode_info));
  80b180:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b184:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b187:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b18b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b18f:	ba 20 00 00 00       	mov    edx,0x20
  80b194:	be 00 00 00 00       	mov    esi,0x0
  80b199:	48 89 c7             	mov    rdi,rax
  80b19c:	e8 53 08 00 00       	call   80b9f4 <memset>
	finode = (struct FAT32_inode_info *)sbp->root->dir_inode->private_index_info;
  80b1a1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b1a5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b1a8:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b1ac:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80b1b0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	finode->first_cluster = fbs->BPB_RootClus;
  80b1b4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b1b8:	8b 40 2c             	mov    eax,DWORD PTR [rax+0x2c]
  80b1bb:	89 c2                	mov    edx,eax
  80b1bd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b1c1:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = 0;
  80b1c4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b1c8:	48 c7 40 08 00 00 00 	mov    QWORD PTR [rax+0x8],0x0
  80b1cf:	00 
	finode->dentry_position = 0; 
  80b1d0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b1d4:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  80b1db:	00 
	finode->create_date = 0;
  80b1dc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b1e0:	66 c7 40 18 00 00    	mov    WORD PTR [rax+0x18],0x0
	finode->create_time = 0;
  80b1e6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b1ea:	66 c7 40 1a 00 00    	mov    WORD PTR [rax+0x1a],0x0
	finode->write_date = 0;
  80b1f0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b1f4:	66 c7 40 1c 00 00    	mov    WORD PTR [rax+0x1c],0x0
	finode->write_time = 0;
  80b1fa:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b1fe:	66 c7 40 1e 00 00    	mov    WORD PTR [rax+0x1e],0x0

	return sbp;
  80b204:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80b208:	c9                   	leave  
  80b209:	c3                   	ret    

000000000080b20a <DISK1_FAT32_FS_init>:
	.read_superblock = fat32_read_superblock,
	.next = NULL,
};

void DISK1_FAT32_FS_init()
{
  80b20a:	f3 0f 1e fa          	endbr64 
  80b20e:	55                   	push   rbp
  80b20f:	48 89 e5             	mov    rbp,rsp
  80b212:	48 81 ec 10 04 00 00 	sub    rsp,0x410
	int i;
	unsigned char buf[512];
	struct dir_entry * dentry = NULL;
  80b219:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80b220:	00 
	struct Disk_Partition_Table DPT = {0};
  80b221:	48 8d 95 f0 fb ff ff 	lea    rdx,[rbp-0x410]
  80b228:	b8 00 00 00 00       	mov    eax,0x0
  80b22d:	b9 40 00 00 00       	mov    ecx,0x40
  80b232:	48 89 d7             	mov    rdi,rdx
  80b235:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax

	register_filesystem(&FAT32_fs_type);
  80b238:	bf 40 c6 80 00       	mov    edi,0x80c640
  80b23d:	e8 61 c1 ff ff       	call   8073a3 <register_filesystem>
	
	memset(buf,0,512);
  80b242:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80b249:	ba 00 02 00 00       	mov    edx,0x200
  80b24e:	be 00 00 00 00       	mov    esi,0x0
  80b253:	48 89 c7             	mov    rdi,rax
  80b256:	e8 99 07 00 00       	call   80b9f4 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,0x0,1,(unsigned char *)buf);
  80b25b:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80b262:	49 89 c0             	mov    r8,rax
  80b265:	b9 01 00 00 00       	mov    ecx,0x1
  80b26a:	ba 00 00 00 00       	mov    edx,0x0
  80b26f:	be 00 00 00 00       	mov    esi,0x0
  80b274:	bf 00 00 00 00       	mov    edi,0x0
  80b279:	e8 40 d0 ff ff       	call   8082be <request>
  80b27e:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    chk_result(r);
  80b281:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80b284:	89 c7                	mov    edi,eax
  80b286:	e8 e7 d6 ff ff       	call   808972 <chk_result>
    DPT = *(struct Disk_Partition_Table *)buf;
  80b28b:	48 8d 95 f0 fd ff ff 	lea    rdx,[rbp-0x210]
  80b292:	48 8d 85 f0 fb ff ff 	lea    rax,[rbp-0x410]
  80b299:	48 89 d6             	mov    rsi,rdx
  80b29c:	ba 40 00 00 00       	mov    edx,0x40
  80b2a1:	48 89 c7             	mov    rdi,rax
  80b2a4:	48 89 d1             	mov    rcx,rdx
  80b2a7:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
	printf("DPTE[0] start_LBA:%x\ttype:%x\n",DPT.DPTE[0].start_LBA,DPT.DPTE[0].type);
  80b2aa:	0f b6 85 b2 fd ff ff 	movzx  eax,BYTE PTR [rbp-0x24e]
  80b2b1:	0f b6 d0             	movzx  edx,al
  80b2b4:	8b 85 b6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x24a]
  80b2ba:	89 c6                	mov    esi,eax
  80b2bc:	bf 70 46 81 00       	mov    edi,0x814670
  80b2c1:	b8 00 00 00 00       	mov    eax,0x0
  80b2c6:	e8 5c 5a ff ff       	call   800d27 <printf>

	memset(buf,0,512);
  80b2cb:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80b2d2:	ba 00 02 00 00       	mov    edx,0x200
  80b2d7:	be 00 00 00 00       	mov    esi,0x0
  80b2dc:	48 89 c7             	mov    rdi,rax
  80b2df:	e8 10 07 00 00       	call   80b9f4 <memset>
	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPT.DPTE[0].start_LBA,1,(unsigned char *)buf);
  80b2e4:	8b 85 b6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x24a]
  80b2ea:	89 c2                	mov    edx,eax
  80b2ec:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80b2f3:	49 89 c0             	mov    r8,rax
  80b2f6:	b9 01 00 00 00       	mov    ecx,0x1
  80b2fb:	be 00 00 00 00       	mov    esi,0x0
  80b300:	bf 00 00 00 00       	mov    edi,0x0
  80b305:	e8 b4 cf ff ff       	call   8082be <request>
  80b30a:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    chk_result(r1);
  80b30d:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80b310:	89 c7                	mov    edi,eax
  80b312:	e8 5b d6 ff ff       	call   808972 <chk_result>

	root_sb = mount_fs("FAT32",&DPT.DPTE[0],buf);	//not dev node
  80b317:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80b31e:	48 8d 95 f0 fb ff ff 	lea    rdx,[rbp-0x410]
  80b325:	48 8d 8a be 01 00 00 	lea    rcx,[rdx+0x1be]
  80b32c:	48 89 c2             	mov    rdx,rax
  80b32f:	48 89 ce             	mov    rsi,rcx
  80b332:	bf 6a 46 81 00       	mov    edi,0x81466a
  80b337:	e8 ef bf ff ff       	call   80732b <mount_fs>
  80b33c:	48 89 05 65 d3 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1d365],rax        # 4286a8 <root_sb>
}
  80b343:	90                   	nop
  80b344:	c9                   	leave  
  80b345:	c3                   	ret    

000000000080b346 <close_tty>:
int stdd=0;
struct file_operations tty_fops={
        .open=init_tty, .close=close_tty,.write=write_tty,.read=read_tty,.ioctl=tty_do_req
};

long close_tty(struct index_node * inode,struct file * filp){
  80b346:	f3 0f 1e fa          	endbr64 
  80b34a:	55                   	push   rbp
  80b34b:	48 89 e5             	mov    rbp,rsp
  80b34e:	48 83 ec 30          	sub    rsp,0x30
  80b352:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80b356:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    stdbuf_t * bi=&((tty_t*)filp->private_data)->stdin_buf;
  80b35a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b35e:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80b362:	48 83 c0 18          	add    rax,0x18
  80b366:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    stdbuf_t * bo=&((tty_t*)filp->private_data)->stdout_buf;
  80b36a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b36e:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80b372:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    stdbuf_t * be=&((tty_t*)filp->private_data)->stderr_buf;
  80b376:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b37a:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80b37e:	48 83 c0 30          	add    rax,0x30
  80b382:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    vmfree((addr_t)bi);
  80b386:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b38a:	48 89 c7             	mov    rdi,rax
  80b38d:	e8 b6 5f ff ff       	call   801348 <vmfree>
    vmfree((addr_t)bo);
  80b392:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b396:	48 89 c7             	mov    rdi,rax
  80b399:	e8 aa 5f ff ff       	call   801348 <vmfree>
    vmfree((addr_t)be);
  80b39e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b3a2:	48 89 c7             	mov    rdi,rax
  80b3a5:	e8 9e 5f ff ff       	call   801348 <vmfree>
    vmfree((addr_t)filp->private_data);
  80b3aa:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b3ae:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80b3b2:	48 89 c7             	mov    rdi,rax
  80b3b5:	e8 8e 5f ff ff       	call   801348 <vmfree>
    return 0;
  80b3ba:	b8 00 00 00 00       	mov    eax,0x0
}
  80b3bf:	c9                   	leave  
  80b3c0:	c3                   	ret    

000000000080b3c1 <init_tty>:
//打开文件
long init_tty(struct index_node * inode,struct file * filp)
{
  80b3c1:	f3 0f 1e fa          	endbr64 
  80b3c5:	55                   	push   rbp
  80b3c6:	48 89 e5             	mov    rbp,rsp
  80b3c9:	48 83 ec 20          	sub    rsp,0x20
  80b3cd:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80b3d1:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    tty_t *ntty=(tty_t*)vmalloc();
  80b3d5:	b8 00 00 00 00       	mov    eax,0x0
  80b3da:	e8 da 5e ff ff       	call   8012b9 <vmalloc>
  80b3df:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //创建三个缓冲区
    ntty->stdin_buf.data= (char*)vmalloc();
  80b3e3:	b8 00 00 00 00       	mov    eax,0x0
  80b3e8:	e8 cc 5e ff ff       	call   8012b9 <vmalloc>
  80b3ed:	48 89 c2             	mov    rdx,rax
  80b3f0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b3f4:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    ntty->stdout_buf.data=(char*)vmalloc();
  80b3f8:	b8 00 00 00 00       	mov    eax,0x0
  80b3fd:	e8 b7 5e ff ff       	call   8012b9 <vmalloc>
  80b402:	48 89 c2             	mov    rdx,rax
  80b405:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b409:	48 89 10             	mov    QWORD PTR [rax],rdx
    ntty->stderr_buf.data=(char*)vmalloc();
  80b40c:	b8 00 00 00 00       	mov    eax,0x0
  80b411:	e8 a3 5e ff ff       	call   8012b9 <vmalloc>
  80b416:	48 89 c2             	mov    rdx,rax
  80b419:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b41d:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
    ntty->stdin_buf. wptr= 0;
  80b421:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b425:	c7 40 20 00 00 00 00 	mov    DWORD PTR [rax+0x20],0x0
    ntty->stdout_buf.wptr= 0;
  80b42c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b430:	c7 40 08 00 00 00 00 	mov    DWORD PTR [rax+0x8],0x0
    ntty->stderr_buf.wptr= 0;
  80b437:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b43b:	c7 40 38 00 00 00 00 	mov    DWORD PTR [rax+0x38],0x0
    ntty->stdin_buf. rptr= 0;
  80b442:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b446:	c7 40 24 00 00 00 00 	mov    DWORD PTR [rax+0x24],0x0
    ntty->stdout_buf.rptr= 0;
  80b44d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b451:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [rax+0xc],0x0
    ntty->stderr_buf.rptr= 0;
  80b458:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b45c:	c7 40 3c 00 00 00 00 	mov    DWORD PTR [rax+0x3c],0x0
    ntty->stdin_buf.size= PAGE_4K_SIZE;
  80b463:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b467:	c7 40 28 00 10 00 00 	mov    DWORD PTR [rax+0x28],0x1000
    ntty->stdout_buf.size= PAGE_4K_SIZE;
  80b46e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b472:	c7 40 10 00 10 00 00 	mov    DWORD PTR [rax+0x10],0x1000
    ntty->stderr_buf.size= PAGE_4K_SIZE;
  80b479:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b47d:	c7 40 40 00 10 00 00 	mov    DWORD PTR [rax+0x40],0x1000
    //设置inode文件操作方式为tty方式
    inode->f_ops=&tty_fops;
  80b484:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b488:	48 c7 40 20 60 c6 80 	mov    QWORD PTR [rax+0x20],0x80c660
  80b48f:	00 
    filp->f_ops=&tty_fops;
  80b490:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b494:	48 c7 40 18 60 c6 80 	mov    QWORD PTR [rax+0x18],0x80c660
  80b49b:	00 
    filp->private_data=ntty;
  80b49c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b4a0:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80b4a4:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
    return 0;
  80b4a8:	b8 00 00 00 00       	mov    eax,0x0
}
  80b4ad:	c9                   	leave  
  80b4ae:	c3                   	ret    

000000000080b4af <read_tty>:

long read_tty(struct file * filp,char * buf,unsigned long count,long * position)
{
  80b4af:	f3 0f 1e fa          	endbr64 
  80b4b3:	55                   	push   rbp
  80b4b4:	48 89 e5             	mov    rbp,rsp
  80b4b7:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80b4bb:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80b4bf:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  80b4c3:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
    stdbuf_t * b=&((tty_t*)filp->private_data)->stdin_buf;
  80b4c7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b4cb:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80b4cf:	48 83 c0 18          	add    rax,0x18
  80b4d3:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int i=0;
  80b4d7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while (i<count){
  80b4de:	eb 5a                	jmp    80b53a <read_tty+0x8b>
        if(b->rptr==b->size)
  80b4e0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b4e4:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  80b4e7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b4eb:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80b4ee:	39 c2                	cmp    edx,eax
  80b4f0:	75 0b                	jne    80b4fd <read_tty+0x4e>
            b->rptr=0;
  80b4f2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b4f6:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [rax+0xc],0x0
        buf[i++]=b->data[b->rptr];
  80b4fd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b501:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80b504:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b508:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80b50b:	48 98                	cdqe   
  80b50d:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80b511:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b514:	8d 50 01             	lea    edx,[rax+0x1]
  80b517:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80b51a:	48 63 d0             	movsxd rdx,eax
  80b51d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b521:	48 01 c2             	add    rdx,rax
  80b524:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
  80b527:	88 02                	mov    BYTE PTR [rdx],al
        b->rptr++;
  80b529:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b52d:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80b530:	8d 50 01             	lea    edx,[rax+0x1]
  80b533:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b537:	89 50 0c             	mov    DWORD PTR [rax+0xc],edx
    while (i<count){
  80b53a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b53d:	48 98                	cdqe   
  80b53f:	48 39 45 d8          	cmp    QWORD PTR [rbp-0x28],rax
  80b543:	77 9b                	ja     80b4e0 <read_tty+0x31>
    }
}
  80b545:	90                   	nop
  80b546:	5d                   	pop    rbp
  80b547:	c3                   	ret    

000000000080b548 <write_tty>:
long write_tty(struct file * filp,char * buf,unsigned long count,long * position)
{
  80b548:	f3 0f 1e fa          	endbr64 
  80b54c:	55                   	push   rbp
  80b54d:	48 89 e5             	mov    rbp,rsp
  80b550:	48 83 ec 40          	sub    rsp,0x40
  80b554:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80b558:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  80b55c:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  80b560:	48 89 4d c0          	mov    QWORD PTR [rbp-0x40],rcx
    stdbuf_t * b=&((tty_t*)filp->private_data)->stdout_buf;
  80b564:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80b568:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80b56c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int i=0;
  80b570:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    int saved_wptr=b->wptr;
  80b577:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b57b:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b57e:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    while (i<count){
  80b581:	eb 5a                	jmp    80b5dd <write_tty+0x95>
        if(b->wptr==b->size)
  80b583:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b587:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80b58a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b58e:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80b591:	39 c2                	cmp    edx,eax
  80b593:	75 0b                	jne    80b5a0 <write_tty+0x58>
            b->wptr=0;
  80b595:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b599:	c7 40 08 00 00 00 00 	mov    DWORD PTR [rax+0x8],0x0
        b->data[b->wptr]=buf[i++];
  80b5a0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b5a3:	8d 50 01             	lea    edx,[rax+0x1]
  80b5a6:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80b5a9:	48 63 d0             	movsxd rdx,eax
  80b5ac:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80b5b0:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80b5b4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b5b8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80b5bb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b5bf:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b5c2:	48 98                	cdqe   
  80b5c4:	48 01 c2             	add    rdx,rax
  80b5c7:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
  80b5ca:	88 02                	mov    BYTE PTR [rdx],al
        b->wptr++;
  80b5cc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b5d0:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b5d3:	8d 50 01             	lea    edx,[rax+0x1]
  80b5d6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b5da:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    while (i<count){
  80b5dd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b5e0:	48 98                	cdqe   
  80b5e2:	48 39 45 c8          	cmp    QWORD PTR [rbp-0x38],rax
  80b5e6:	77 9b                	ja     80b583 <write_tty+0x3b>
    }
    //刷新到framebuffer
    write_framebuffer(filp,b->data+saved_wptr,count,0);
  80b5e8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b5ec:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80b5ef:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80b5f2:	48 98                	cdqe   
  80b5f4:	48 8d 34 02          	lea    rsi,[rdx+rax*1]
  80b5f8:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80b5fc:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80b600:	b9 00 00 00 00       	mov    ecx,0x0
  80b605:	48 89 c7             	mov    rdi,rax
  80b608:	e8 96 b9 ff ff       	call   806fa3 <write_framebuffer>
}
  80b60d:	90                   	nop
  80b60e:	c9                   	leave  
  80b60f:	c3                   	ret    

000000000080b610 <tty_do_req>:
 * TTY_CONNECT:尝试连接到dev/console,这样会成为controlling terminal,里面的数据才能输出到屏幕上，
 * 因为除了特殊指定的进程都会有一个自己的天tty。
 * 成功返回0。
 * */
long tty_do_req(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg)
{
  80b610:	f3 0f 1e fa          	endbr64 
  80b614:	55                   	push   rbp
  80b615:	48 89 e5             	mov    rbp,rsp
  80b618:	48 83 ec 50          	sub    rsp,0x50
  80b61c:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  80b620:	48 89 75 c0          	mov    QWORD PTR [rbp-0x40],rsi
  80b624:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  80b628:	48 89 4d b0          	mov    QWORD PTR [rbp-0x50],rcx
    stdbuf_t * b=&((tty_t*)filp->private_data)->stderr_buf;
  80b62c:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80b630:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80b634:	48 83 c0 30          	add    rax,0x30
  80b638:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int i=0;
  80b63c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* buf=*((char**)arg);
  80b643:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80b647:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b64a:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    unsigned long count=*((unsigned long*)(arg+8));
  80b64e:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80b652:	48 83 c0 08          	add    rax,0x8
  80b656:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80b659:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    int saved_wptr=b->wptr;
  80b65d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b661:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b664:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    int fd=-1;
  80b667:	c7 45 d8 ff ff ff ff 	mov    DWORD PTR [rbp-0x28],0xffffffff
    switch (cmd)
  80b66e:	48 83 7d b8 02       	cmp    QWORD PTR [rbp-0x48],0x2
  80b673:	0f 84 df 00 00 00    	je     80b758 <tty_do_req+0x148>
  80b679:	48 83 7d b8 02       	cmp    QWORD PTR [rbp-0x48],0x2
  80b67e:	0f 87 fb 00 00 00    	ja     80b77f <tty_do_req+0x16f>
  80b684:	48 83 7d b8 00       	cmp    QWORD PTR [rbp-0x48],0x0
  80b689:	74 6a                	je     80b6f5 <tty_do_req+0xe5>
  80b68b:	48 83 7d b8 01       	cmp    QWORD PTR [rbp-0x48],0x1
  80b690:	0f 84 91 00 00 00    	je     80b727 <tty_do_req+0x117>
  80b696:	e9 e4 00 00 00       	jmp    80b77f <tty_do_req+0x16f>
    {
        case TTY_WSTDERR:
            while (i<count){
                if(b->wptr==b->size)
  80b69b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b69f:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  80b6a2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b6a6:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80b6a9:	39 c2                	cmp    edx,eax
  80b6ab:	75 0b                	jne    80b6b8 <tty_do_req+0xa8>
                    b->wptr=0;
  80b6ad:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b6b1:	c7 40 08 00 00 00 00 	mov    DWORD PTR [rax+0x8],0x0
                b->data[b->wptr]=buf[i++];
  80b6b8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b6bb:	8d 50 01             	lea    edx,[rax+0x1]
  80b6be:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80b6c1:	48 63 d0             	movsxd rdx,eax
  80b6c4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b6c8:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80b6cc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b6d0:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80b6d3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b6d7:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b6da:	48 98                	cdqe   
  80b6dc:	48 01 c2             	add    rdx,rax
  80b6df:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
  80b6e2:	88 02                	mov    BYTE PTR [rdx],al
                b->wptr++;
  80b6e4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b6e8:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80b6eb:	8d 50 01             	lea    edx,[rax+0x1]
  80b6ee:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b6f2:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
            while (i<count){
  80b6f5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b6f8:	48 98                	cdqe   
  80b6fa:	48 39 45 e0          	cmp    QWORD PTR [rbp-0x20],rax
  80b6fe:	77 9b                	ja     80b69b <tty_do_req+0x8b>
            }
            //刷新到framebuffer
            write_framebuffer(filp,b->data+saved_wptr,count,0);
  80b700:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80b704:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80b707:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80b70a:	48 98                	cdqe   
  80b70c:	48 8d 34 02          	lea    rsi,[rdx+rax*1]
  80b710:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  80b714:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80b718:	b9 00 00 00 00       	mov    ecx,0x0
  80b71d:	48 89 c7             	mov    rdi,rax
  80b720:	e8 7e b8 ff ff       	call   806fa3 <write_framebuffer>
        break;
  80b725:	eb 61                	jmp    80b788 <tty_do_req+0x178>
        case TTY_CONNECT:
            fd=sys_open("sys/console",O_WRONLY|O_CREAT|O_EXCL);
  80b727:	be c1 00 00 00       	mov    esi,0xc1
  80b72c:	bf 8e 46 81 00       	mov    edi,0x81468e
  80b731:	e8 7a bd ff ff       	call   8074b0 <sys_open>
  80b736:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
            if(fd==-1)return -1;
  80b739:	83 7d d8 ff          	cmp    DWORD PTR [rbp-0x28],0xffffffff
  80b73d:	75 09                	jne    80b748 <tty_do_req+0x138>
  80b73f:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80b746:	eb 45                	jmp    80b78d <tty_do_req+0x17d>
            ((tty_t*)filp->private_data)->console_fd=fd;
  80b748:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80b74c:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80b750:	8b 55 d8             	mov    edx,DWORD PTR [rbp-0x28]
  80b753:	89 50 48             	mov    DWORD PTR [rax+0x48],edx
            break;
  80b756:	eb 30                	jmp    80b788 <tty_do_req+0x178>
        case TTY_DISCONNECT:
            fd=((tty_t*)filp->private_data)->console_fd;
  80b758:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80b75c:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80b760:	8b 40 48             	mov    eax,DWORD PTR [rax+0x48]
  80b763:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
            if(fd==-1)return -1;
  80b766:	83 7d d8 ff          	cmp    DWORD PTR [rbp-0x28],0xffffffff
  80b76a:	75 09                	jne    80b775 <tty_do_req+0x165>
  80b76c:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80b773:	eb 18                	jmp    80b78d <tty_do_req+0x17d>
            sys_close(fd);
  80b775:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  80b778:	89 c7                	mov    edi,eax
  80b77a:	e8 48 c0 ff ff       	call   8077c7 <sys_close>
    default:return -1;
  80b77f:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80b786:	eb 05                	jmp    80b78d <tty_do_req+0x17d>
    }
    return 0;
  80b788:	b8 00 00 00 00       	mov    eax,0x0
}
  80b78d:	c9                   	leave  
  80b78e:	c3                   	ret    

000000000080b78f <init_com>:
#include "int.h"
#include "str.h"
#include "memory.h"


void init_com(int base_port){
  80b78f:	f3 0f 1e fa          	endbr64 
  80b793:	55                   	push   rbp
  80b794:	48 89 e5             	mov    rbp,rsp
  80b797:	48 83 ec 10          	sub    rsp,0x10
  80b79b:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    /* disable all interrupts */
    outb(base_port + COM_REG_IER, 0x00);
  80b79e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b7a1:	83 c0 01             	add    eax,0x1
  80b7a4:	0f b7 c0             	movzx  eax,ax
  80b7a7:	be 00 00 00 00       	mov    esi,0x0
  80b7ac:	89 c7                	mov    edi,eax
  80b7ae:	e8 6d a3 ff ff       	call   805b20 <outb>
    
    /* enable DLAB to set bound rate divisor */
    outb(base_port + COM_REG_LCR, 0x80);
  80b7b3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b7b6:	83 c0 03             	add    eax,0x3
  80b7b9:	0f b7 c0             	movzx  eax,ax
  80b7bc:	be 80 00 00 00       	mov    esi,0x80
  80b7c1:	89 c7                	mov    edi,eax
  80b7c3:	e8 58 a3 ff ff       	call   805b20 <outb>
    
    /* set divisor to 38400 baud */
    outb(base_port + COM_REG_DLL, 0x03);
  80b7c8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b7cb:	0f b7 c0             	movzx  eax,ax
  80b7ce:	be 03 00 00 00       	mov    esi,0x3
  80b7d3:	89 c7                	mov    edi,eax
  80b7d5:	e8 46 a3 ff ff       	call   805b20 <outb>
    outb(base_port + COM_REG_DLM, 0x00);
  80b7da:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b7dd:	83 c0 01             	add    eax,0x1
  80b7e0:	0f b7 c0             	movzx  eax,ax
  80b7e3:	be 00 00 00 00       	mov    esi,0x0
  80b7e8:	89 c7                	mov    edi,eax
  80b7ea:	e8 31 a3 ff ff       	call   805b20 <outb>
    
    /* 8 data bits, parity off, 1 stop bit, DLAB latch off */
    outb(base_port + COM_REG_LCR, 0x03);
  80b7ef:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b7f2:	83 c0 03             	add    eax,0x3
  80b7f5:	0f b7 c0             	movzx  eax,ax
  80b7f8:	be 03 00 00 00       	mov    esi,0x3
  80b7fd:	89 c7                	mov    edi,eax
  80b7ff:	e8 1c a3 ff ff       	call   805b20 <outb>
    
    /* enable FIFO */
    outb(base_port + COM_REG_FCR, 0x87);//0xc7
  80b804:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b807:	83 c0 02             	add    eax,0x2
  80b80a:	0f b7 c0             	movzx  eax,ax
  80b80d:	be 87 00 00 00       	mov    esi,0x87
  80b812:	89 c7                	mov    edi,eax
  80b814:	e8 07 a3 ff ff       	call   805b20 <outb>

    /* enable IRQs, set RTS/DSR */
    outb(base_port + COM_REG_MCR, 0x0B);
  80b819:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b81c:	83 c0 04             	add    eax,0x4
  80b81f:	0f b7 c0             	movzx  eax,ax
  80b822:	be 0b 00 00 00       	mov    esi,0xb
  80b827:	89 c7                	mov    edi,eax
  80b829:	e8 f2 a2 ff ff       	call   805b20 <outb>
//    if (inb(base_port + COM_REG_RX) != 0xae) {
//        return;
//    }
    
    /* set in normal mode */
    outb(base_port + COM_REG_MCR, 0x0F);
  80b82e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b831:	83 c0 04             	add    eax,0x4
  80b834:	0f b7 c0             	movzx  eax,ax
  80b837:	be 0f 00 00 00       	mov    esi,0xf
  80b83c:	89 c7                	mov    edi,eax
  80b83e:	e8 dd a2 ff ff       	call   805b20 <outb>
}
  80b843:	90                   	nop
  80b844:	c9                   	leave  
  80b845:	c3                   	ret    

000000000080b846 <com_putchar>:
void com_putchar(unsigned short ch,int com_base)
{
  80b846:	f3 0f 1e fa          	endbr64 
  80b84a:	55                   	push   rbp
  80b84b:	48 89 e5             	mov    rbp,rsp
  80b84e:	48 83 ec 20          	sub    rsp,0x20
  80b852:	89 f8                	mov    eax,edi
  80b854:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80b857:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    unsigned char res;
    /* wait for the port to be ready */
    do {
        res = inb(com_base + COM_REG_LSR);
  80b85b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80b85e:	83 c0 05             	add    eax,0x5
  80b861:	0f b6 c0             	movzx  eax,al
  80b864:	89 c7                	mov    edi,eax
  80b866:	e8 ce a2 ff ff       	call   805b39 <inb>
  80b86b:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        res &= 0x20;
  80b86e:	80 65 ff 20          	and    BYTE PTR [rbp-0x1],0x20
    } while (res == 0);
  80b872:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  80b876:	74 e3                	je     80b85b <com_putchar+0x15>
    outb(com_base, ch);
  80b878:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  80b87c:	0f b6 d0             	movzx  edx,al
  80b87f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80b882:	0f b7 c0             	movzx  eax,ax
  80b885:	89 d6                	mov    esi,edx
  80b887:	89 c7                	mov    edi,eax
  80b889:	e8 92 a2 ff ff       	call   805b20 <outb>
}
  80b88e:	90                   	nop
  80b88f:	c9                   	leave  
  80b890:	c3                   	ret    

000000000080b891 <com_puts>:

void com_puts(char* s,int com_port){
  80b891:	f3 0f 1e fa          	endbr64 
  80b895:	55                   	push   rbp
  80b896:	48 89 e5             	mov    rbp,rsp
  80b899:	48 83 ec 10          	sub    rsp,0x10
  80b89d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80b8a1:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    for(;*s;s++){
  80b8a4:	eb 1d                	jmp    80b8c3 <com_puts+0x32>
        com_putchar(*s,com_port);
  80b8a6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b8aa:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b8ad:	66 98                	cbw    
  80b8af:	0f b7 c0             	movzx  eax,ax
  80b8b2:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80b8b5:	89 d6                	mov    esi,edx
  80b8b7:	89 c7                	mov    edi,eax
  80b8b9:	e8 88 ff ff ff       	call   80b846 <com_putchar>
    for(;*s;s++){
  80b8be:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  80b8c3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b8c7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b8ca:	84 c0                	test   al,al
  80b8cc:	75 d8                	jne    80b8a6 <com_puts+0x15>
    }
}
  80b8ce:	90                   	nop
  80b8cf:	90                   	nop
  80b8d0:	c9                   	leave  
  80b8d1:	c3                   	ret    

000000000080b8d2 <comprintf>:
void comprintf(char* fmt,va_list args){
  80b8d2:	f3 0f 1e fa          	endbr64 
  80b8d6:	55                   	push   rbp
  80b8d7:	48 89 e5             	mov    rbp,rsp
  80b8da:	48 83 ec 20          	sub    rsp,0x20
  80b8de:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80b8e2:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    if(strlen(fmt)>=1024)
  80b8e6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b8ea:	48 89 c7             	mov    rdi,rax
  80b8ed:	e8 70 03 00 00       	call   80bc62 <strlen>
  80b8f2:	3d ff 03 00 00       	cmp    eax,0x3ff
  80b8f7:	7f 49                	jg     80b942 <comprintf+0x70>
        return;//一次性输出不了太长
    char* tmp=(char*)vmalloc();
  80b8f9:	b8 00 00 00 00       	mov    eax,0x0
  80b8fe:	e8 b6 59 ff ff       	call   8012b9 <vmalloc>
  80b903:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    sprintf(tmp,fmt,args);
  80b907:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  80b90b:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  80b90f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b913:	48 89 ce             	mov    rsi,rcx
  80b916:	48 89 c7             	mov    rdi,rax
  80b919:	b8 00 00 00 00       	mov    eax,0x0
  80b91e:	e8 6d 03 00 00       	call   80bc90 <sprintf>
    com_puts(tmp,PORT_COM1);
  80b923:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b927:	be f8 03 00 00       	mov    esi,0x3f8
  80b92c:	48 89 c7             	mov    rdi,rax
  80b92f:	e8 5d ff ff ff       	call   80b891 <com_puts>
    vmfree(tmp);
  80b934:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80b938:	48 89 c7             	mov    rdi,rax
  80b93b:	e8 08 5a ff ff       	call   801348 <vmfree>
  80b940:	eb 01                	jmp    80b943 <comprintf+0x71>
        return;//一次性输出不了太长
  80b942:	90                   	nop
  80b943:	c9                   	leave  
  80b944:	c3                   	ret    

000000000080b945 <memcpy>:
#include "mem.h"
#include "typename.h"
static u32 mem_end;
static u32 usr_mem_base;
void memcpy(u8* dest, u8 *src,u32 size){
  80b945:	f3 0f 1e fa          	endbr64 
  80b949:	55                   	push   rbp
  80b94a:	48 89 e5             	mov    rbp,rsp
  80b94d:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80b951:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80b955:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    *dest=0xff;//如果页内存还没分配，这样就可以先激发缺页异常分配了，之后写数据就会完整不会少开头第一个字节。
  80b958:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b95c:	c6 00 ff             	mov    BYTE PTR [rax],0xff
    for(int i=0;i<size;i++){
  80b95f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80b966:	eb 1b                	jmp    80b983 <memcpy+0x3e>
        *(dest)=*(src);
  80b968:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b96c:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80b96f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b973:	88 10                	mov    BYTE PTR [rax],dl
        dest++;
  80b975:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        src++;
  80b97a:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<size;i++){
  80b97f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80b983:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b986:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
  80b989:	77 dd                	ja     80b968 <memcpy+0x23>
    }
}
  80b98b:	90                   	nop
  80b98c:	90                   	nop
  80b98d:	5d                   	pop    rbp
  80b98e:	c3                   	ret    

000000000080b98f <memcmp>:
int memcmp(u8 *a,u8* b,int len)
{
  80b98f:	f3 0f 1e fa          	endbr64 
  80b993:	55                   	push   rbp
  80b994:	48 89 e5             	mov    rbp,rsp
  80b997:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80b99b:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80b99f:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    for(int i=0;i<len;i++)
  80b9a2:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80b9a9:	eb 3a                	jmp    80b9e5 <memcmp+0x56>
    {
        if(*a!=*b)
  80b9ab:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b9af:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80b9b2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b9b6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b9b9:	38 c2                	cmp    dl,al
  80b9bb:	74 1a                	je     80b9d7 <memcmp+0x48>
            return *a-*b;
  80b9bd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80b9c1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b9c4:	0f b6 d0             	movzx  edx,al
  80b9c7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80b9cb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80b9ce:	0f b6 c8             	movzx  ecx,al
  80b9d1:	89 d0                	mov    eax,edx
  80b9d3:	29 c8                	sub    eax,ecx
  80b9d5:	eb 1b                	jmp    80b9f2 <memcmp+0x63>
        a++;
  80b9d7:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        b++;
  80b9dc:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<len;i++)
  80b9e1:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80b9e5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80b9e8:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  80b9eb:	7c be                	jl     80b9ab <memcmp+0x1c>
    }
    return 0;
  80b9ed:	b8 00 00 00 00       	mov    eax,0x0
}
  80b9f2:	5d                   	pop    rbp
  80b9f3:	c3                   	ret    

000000000080b9f4 <memset>:
void memset(u8 *buf,u8 value,u32 size){
  80b9f4:	f3 0f 1e fa          	endbr64 
  80b9f8:	55                   	push   rbp
  80b9f9:	48 89 e5             	mov    rbp,rsp
  80b9fc:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80ba00:	89 f0                	mov    eax,esi
  80ba02:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
  80ba05:	88 45 e4             	mov    BYTE PTR [rbp-0x1c],al
    for(u32 i=0;i<size;i++){
  80ba08:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80ba0f:	eb 16                	jmp    80ba27 <memset+0x33>
        *(buf++)=value;
  80ba11:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ba15:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80ba19:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80ba1d:	0f b6 55 e4          	movzx  edx,BYTE PTR [rbp-0x1c]
  80ba21:	88 10                	mov    BYTE PTR [rax],dl
    for(u32 i=0;i<size;i++){
  80ba23:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80ba27:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ba2a:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  80ba2d:	72 e2                	jb     80ba11 <memset+0x1d>
    }
}
  80ba2f:	90                   	nop
  80ba30:	90                   	nop
  80ba31:	5d                   	pop    rbp
  80ba32:	c3                   	ret    

000000000080ba33 <get_mem_size>:

u32 get_mem_size(){
  80ba33:	f3 0f 1e fa          	endbr64 
  80ba37:	55                   	push   rbp
  80ba38:	48 89 e5             	mov    rbp,rsp
    return mem_end;
  80ba3b:	8b 05 db fb c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fbdb]        # 42b61c <mem_end>
}
  80ba41:	5d                   	pop    rbp
  80ba42:	c3                   	ret    

000000000080ba43 <strcpy>:
#include "str.h"
#include <stdarg.h>
void strcpy(unsigned char* dest, unsigned char *buf){
  80ba43:	f3 0f 1e fa          	endbr64 
  80ba47:	55                   	push   rbp
  80ba48:	48 89 e5             	mov    rbp,rsp
  80ba4b:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80ba4f:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*buf!='\0'){
  80ba53:	eb 1d                	jmp    80ba72 <strcpy+0x2f>
        *(dest++)=*(buf++);
  80ba55:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80ba59:	48 8d 42 01          	lea    rax,[rdx+0x1]
  80ba5d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  80ba61:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ba65:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80ba69:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80ba6d:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80ba70:	88 10                	mov    BYTE PTR [rax],dl
    while(*buf!='\0'){
  80ba72:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ba76:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ba79:	84 c0                	test   al,al
  80ba7b:	75 d8                	jne    80ba55 <strcpy+0x12>
    }
    *dest='\0';
  80ba7d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ba81:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80ba84:	90                   	nop
  80ba85:	5d                   	pop    rbp
  80ba86:	c3                   	ret    

000000000080ba87 <strtok>:
static char strtokkee[512],*strtokkeeptr=strtokkee;
static int tokptr=0;
static char retbuf[512],*retbptr=retbuf;
char* strtok(char *str,char splitter){
  80ba87:	f3 0f 1e fa          	endbr64 
  80ba8b:	55                   	push   rbp
  80ba8c:	48 89 e5             	mov    rbp,rsp
  80ba8f:	48 83 ec 30          	sub    rsp,0x30
  80ba93:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80ba97:	89 f0                	mov    eax,esi
  80ba99:	88 45 d4             	mov    BYTE PTR [rbp-0x2c],al
    //limit: cannot cut string longer than 512
    if(str!=(void*)0){
  80ba9c:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80baa1:	0f 84 9c 00 00 00    	je     80bb43 <strtok+0xbc>
        //cut for the first time
        strcpy(strtokkee,str);
  80baa7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80baab:	48 89 c6             	mov    rsi,rax
  80baae:	bf 40 b6 42 00       	mov    edi,0x42b640
  80bab3:	e8 8b ff ff ff       	call   80ba43 <strcpy>
        char* ptr=strtokkee;
  80bab8:	48 c7 45 e8 40 b6 42 	mov    QWORD PTR [rbp-0x18],0x42b640
  80babf:	00 
        for(tokptr=0;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512);
  80bac0:	c7 05 76 fd c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1fd76],0x0        # 42b840 <tokptr>
  80bac7:	00 00 00 
  80baca:	eb 1c                	jmp    80bae8 <strtok+0x61>
  80bacc:	8b 05 6e fd c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fd6e]        # 42b840 <tokptr>
  80bad2:	83 c0 01             	add    eax,0x1
  80bad5:	99                   	cdq    
  80bad6:	c1 ea 17             	shr    edx,0x17
  80bad9:	01 d0                	add    eax,edx
  80badb:	25 ff 01 00 00       	and    eax,0x1ff
  80bae0:	29 d0                	sub    eax,edx
  80bae2:	89 05 58 fd c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1fd58],eax        # 42b840 <tokptr>
  80bae8:	8b 05 52 fd c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fd52]        # 42b840 <tokptr>
  80baee:	48 98                	cdqe   
  80baf0:	0f b6 80 40 b6 42 00 	movzx  eax,BYTE PTR [rax+0x42b640]
  80baf7:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80bafa:	74 13                	je     80bb0f <strtok+0x88>
  80bafc:	8b 05 3e fd c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fd3e]        # 42b840 <tokptr>
  80bb02:	48 98                	cdqe   
  80bb04:	0f b6 80 40 b6 42 00 	movzx  eax,BYTE PTR [rax+0x42b640]
  80bb0b:	84 c0                	test   al,al
  80bb0d:	75 bd                	jne    80bacc <strtok+0x45>
        strtokkee[tokptr]='\0';
  80bb0f:	8b 05 2b fd c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fd2b]        # 42b840 <tokptr>
  80bb15:	48 98                	cdqe   
  80bb17:	c6 80 40 b6 42 00 00 	mov    BYTE PTR [rax+0x42b640],0x0
        tokptr=(tokptr+1)%512;
  80bb1e:	8b 05 1c fd c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fd1c]        # 42b840 <tokptr>
  80bb24:	83 c0 01             	add    eax,0x1
  80bb27:	99                   	cdq    
  80bb28:	c1 ea 17             	shr    edx,0x17
  80bb2b:	01 d0                	add    eax,edx
  80bb2d:	25 ff 01 00 00       	and    eax,0x1ff
  80bb32:	29 d0                	sub    eax,edx
  80bb34:	89 05 06 fd c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1fd06],eax        # 42b840 <tokptr>
        return ptr;
  80bb3a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bb3e:	e9 9e 00 00 00       	jmp    80bbe1 <strtok+0x15a>
    }
    //go on cutting
    int c=0;
  80bb43:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* ptr=strtokkee+tokptr;
  80bb4a:	8b 05 f0 fc c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fcf0]        # 42b840 <tokptr>
  80bb50:	48 98                	cdqe   
  80bb52:	48 05 40 b6 42 00    	add    rax,0x42b640
  80bb58:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512,c++);
  80bb5c:	eb 20                	jmp    80bb7e <strtok+0xf7>
  80bb5e:	8b 05 dc fc c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fcdc]        # 42b840 <tokptr>
  80bb64:	83 c0 01             	add    eax,0x1
  80bb67:	99                   	cdq    
  80bb68:	c1 ea 17             	shr    edx,0x17
  80bb6b:	01 d0                	add    eax,edx
  80bb6d:	25 ff 01 00 00       	and    eax,0x1ff
  80bb72:	29 d0                	sub    eax,edx
  80bb74:	89 05 c6 fc c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1fcc6],eax        # 42b840 <tokptr>
  80bb7a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80bb7e:	8b 05 bc fc c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fcbc]        # 42b840 <tokptr>
  80bb84:	48 98                	cdqe   
  80bb86:	0f b6 80 40 b6 42 00 	movzx  eax,BYTE PTR [rax+0x42b640]
  80bb8d:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80bb90:	74 13                	je     80bba5 <strtok+0x11e>
  80bb92:	8b 05 a8 fc c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fca8]        # 42b840 <tokptr>
  80bb98:	48 98                	cdqe   
  80bb9a:	0f b6 80 40 b6 42 00 	movzx  eax,BYTE PTR [rax+0x42b640]
  80bba1:	84 c0                	test   al,al
  80bba3:	75 b9                	jne    80bb5e <strtok+0xd7>
    strtokkee[tokptr]='\0';
  80bba5:	8b 05 95 fc c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fc95]        # 42b840 <tokptr>
  80bbab:	48 98                	cdqe   
  80bbad:	c6 80 40 b6 42 00 00 	mov    BYTE PTR [rax+0x42b640],0x0
    tokptr=(tokptr+1)%512;
  80bbb4:	8b 05 86 fc c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fc86]        # 42b840 <tokptr>
  80bbba:	83 c0 01             	add    eax,0x1
  80bbbd:	99                   	cdq    
  80bbbe:	c1 ea 17             	shr    edx,0x17
  80bbc1:	01 d0                	add    eax,edx
  80bbc3:	25 ff 01 00 00       	and    eax,0x1ff
  80bbc8:	29 d0                	sub    eax,edx
  80bbca:	89 05 70 fc c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1fc70],eax        # 42b840 <tokptr>
    if(c)
  80bbd0:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80bbd4:	74 06                	je     80bbdc <strtok+0x155>
        return ptr;
  80bbd6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bbda:	eb 05                	jmp    80bbe1 <strtok+0x15a>
    else
        return (void*)0;
  80bbdc:	b8 00 00 00 00       	mov    eax,0x0
}
  80bbe1:	c9                   	leave  
  80bbe2:	c3                   	ret    

000000000080bbe3 <strcmp>:
int strcmp(char *s1,char *s2)
{
  80bbe3:	f3 0f 1e fa          	endbr64 
  80bbe7:	55                   	push   rbp
  80bbe8:	48 89 e5             	mov    rbp,rsp
  80bbeb:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bbef:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	while(*s1!='\0'&&*s2!='\0'){
  80bbf3:	eb 3c                	jmp    80bc31 <strcmp+0x4e>
		if(*s1>*s2)
  80bbf5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bbf9:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80bbfc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bc00:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bc03:	38 c2                	cmp    dl,al
  80bc05:	7e 07                	jle    80bc0e <strcmp+0x2b>
			return 1;
  80bc07:	b8 01 00 00 00       	mov    eax,0x1
  80bc0c:	eb 52                	jmp    80bc60 <strcmp+0x7d>
		else if(*s1<*s2)
  80bc0e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bc12:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80bc15:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bc19:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bc1c:	38 c2                	cmp    dl,al
  80bc1e:	7d 07                	jge    80bc27 <strcmp+0x44>
			return -1;
  80bc20:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80bc25:	eb 39                	jmp    80bc60 <strcmp+0x7d>
		s1++;
  80bc27:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
		s2++;
  80bc2c:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
	while(*s1!='\0'&&*s2!='\0'){
  80bc31:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bc35:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bc38:	84 c0                	test   al,al
  80bc3a:	74 0b                	je     80bc47 <strcmp+0x64>
  80bc3c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bc40:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bc43:	84 c0                	test   al,al
  80bc45:	75 ae                	jne    80bbf5 <strcmp+0x12>
	}
	if(*s1==*s2)
  80bc47:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bc4b:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80bc4e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80bc52:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bc55:	38 c2                	cmp    dl,al
  80bc57:	75 07                	jne    80bc60 <strcmp+0x7d>
		return 0;
  80bc59:	b8 00 00 00 00       	mov    eax,0x0
  80bc5e:	eb 00                	jmp    80bc60 <strcmp+0x7d>
}
  80bc60:	5d                   	pop    rbp
  80bc61:	c3                   	ret    

000000000080bc62 <strlen>:

int strlen(char *str)
{
  80bc62:	f3 0f 1e fa          	endbr64 
  80bc66:	55                   	push   rbp
  80bc67:	48 89 e5             	mov    rbp,rsp
  80bc6a:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int l=0;
  80bc6e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;*str!='\0';str++,l++);
  80bc75:	eb 09                	jmp    80bc80 <strlen+0x1e>
  80bc77:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  80bc7c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80bc80:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80bc84:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bc87:	84 c0                	test   al,al
  80bc89:	75 ec                	jne    80bc77 <strlen+0x15>
    return l;
  80bc8b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80bc8e:	5d                   	pop    rbp
  80bc8f:	c3                   	ret    

000000000080bc90 <sprintf>:

void sprintf(char *dist, char *str,...)
{
  80bc90:	f3 0f 1e fa          	endbr64 
  80bc94:	55                   	push   rbp
  80bc95:	48 89 e5             	mov    rbp,rsp
  80bc98:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  80bc9f:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  80bca6:	48 89 b5 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rsi
  80bcad:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  80bcb4:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  80bcbb:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  80bcc2:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  80bcc9:	84 c0                	test   al,al
  80bccb:	74 20                	je     80bced <sprintf+0x5d>
  80bccd:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  80bcd1:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  80bcd5:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  80bcd9:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  80bcdd:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  80bce1:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  80bce5:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  80bce9:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7

    //count num of args
    char *pstr=str;
  80bced:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80bcf4:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char *prev=str;
  80bcfb:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80bd02:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    int argnum=0;
  80bd09:	c7 85 3c ff ff ff 00 	mov    DWORD PTR [rbp-0xc4],0x0
  80bd10:	00 00 00 
    while (*pstr!='\n')
  80bd13:	eb 39                	jmp    80bd4e <sprintf+0xbe>
    {
        if(*pstr=='%'&&*prev!='%')
  80bd15:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bd1c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bd1f:	3c 25                	cmp    al,0x25
  80bd21:	75 15                	jne    80bd38 <sprintf+0xa8>
  80bd23:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  80bd2a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bd2d:	3c 25                	cmp    al,0x25
  80bd2f:	74 07                	je     80bd38 <sprintf+0xa8>
            argnum++;
  80bd31:	83 85 3c ff ff ff 01 	add    DWORD PTR [rbp-0xc4],0x1
        prev=pstr;
  80bd38:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bd3f:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
        pstr++;
  80bd46:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80bd4d:	01 
    while (*pstr!='\n')
  80bd4e:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bd55:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bd58:	3c 0a                	cmp    al,0xa
  80bd5a:	75 b9                	jne    80bd15 <sprintf+0x85>
    }

    va_list vargs;
    va_start(vargs,str);
  80bd5c:	c7 85 08 ff ff ff 10 	mov    DWORD PTR [rbp-0xf8],0x10
  80bd63:	00 00 00 
  80bd66:	c7 85 0c ff ff ff 30 	mov    DWORD PTR [rbp-0xf4],0x30
  80bd6d:	00 00 00 
  80bd70:	48 8d 45 10          	lea    rax,[rbp+0x10]
  80bd74:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  80bd7b:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  80bd82:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
    pstr=str;
  80bd89:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80bd90:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    for(;*pstr!='\0';pstr++){
  80bd97:	e9 e2 01 00 00       	jmp    80bf7e <sprintf+0x2ee>
        if(*pstr=='%'&&*(pstr+1)!='\0'){
  80bd9c:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bda3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bda6:	3c 25                	cmp    al,0x25
  80bda8:	0f 85 aa 01 00 00    	jne    80bf58 <sprintf+0x2c8>
  80bdae:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bdb5:	48 83 c0 01          	add    rax,0x1
  80bdb9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bdbc:	84 c0                	test   al,al
  80bdbe:	0f 84 94 01 00 00    	je     80bf58 <sprintf+0x2c8>
            pstr++;
  80bdc4:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80bdcb:	01 
            if(*pstr=='x'){
  80bdcc:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bdd3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bdd6:	3c 78                	cmp    al,0x78
  80bdd8:	75 64                	jne    80be3e <sprintf+0x1ae>
                int v=va_arg(vargs,int);
  80bdda:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80bde0:	83 f8 2f             	cmp    eax,0x2f
  80bde3:	77 23                	ja     80be08 <sprintf+0x178>
  80bde5:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80bdec:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80bdf2:	89 d2                	mov    edx,edx
  80bdf4:	48 01 d0             	add    rax,rdx
  80bdf7:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80bdfd:	83 c2 08             	add    edx,0x8
  80be00:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80be06:	eb 12                	jmp    80be1a <sprintf+0x18a>
  80be08:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80be0f:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80be13:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80be1a:	8b 00                	mov    eax,DWORD PTR [rax]
  80be1c:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
                sprint_hex(dist,v);
  80be22:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
  80be28:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80be2f:	89 d6                	mov    esi,edx
  80be31:	48 89 c7             	mov    rdi,rax
  80be34:	e8 4e 02 00 00       	call   80c087 <sprint_hex>
            if(*pstr=='x'){
  80be39:	e9 38 01 00 00       	jmp    80bf76 <sprintf+0x2e6>
            }else if(*pstr=='s'){
  80be3e:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80be45:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80be48:	3c 73                	cmp    al,0x73
  80be4a:	75 68                	jne    80beb4 <sprintf+0x224>
                char* v=va_arg(vargs,char*);
  80be4c:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80be52:	83 f8 2f             	cmp    eax,0x2f
  80be55:	77 23                	ja     80be7a <sprintf+0x1ea>
  80be57:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80be5e:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80be64:	89 d2                	mov    edx,edx
  80be66:	48 01 d0             	add    rax,rdx
  80be69:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80be6f:	83 c2 08             	add    edx,0x8
  80be72:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80be78:	eb 12                	jmp    80be8c <sprintf+0x1fc>
  80be7a:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80be81:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80be85:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80be8c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80be8f:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
                sprintn(dist,v);
  80be96:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
  80be9d:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80bea4:	48 89 d6             	mov    rsi,rdx
  80bea7:	48 89 c7             	mov    rdi,rax
  80beaa:	e8 5a 02 00 00       	call   80c109 <sprintn>
            if(*pstr=='x'){
  80beaf:	e9 c2 00 00 00       	jmp    80bf76 <sprintf+0x2e6>
            }else if(*pstr=='d'){
  80beb4:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bebb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bebe:	3c 64                	cmp    al,0x64
  80bec0:	75 66                	jne    80bf28 <sprintf+0x298>
                char* v=va_arg(vargs,char*);
  80bec2:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80bec8:	83 f8 2f             	cmp    eax,0x2f
  80becb:	77 23                	ja     80bef0 <sprintf+0x260>
  80becd:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80bed4:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80beda:	89 d2                	mov    edx,edx
  80bedc:	48 01 d0             	add    rax,rdx
  80bedf:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80bee5:	83 c2 08             	add    edx,0x8
  80bee8:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80beee:	eb 12                	jmp    80bf02 <sprintf+0x272>
  80bef0:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80bef7:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80befb:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80bf02:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80bf05:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
                sprint_decimal(dist,v);
  80bf0c:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  80bf13:	89 c2                	mov    edx,eax
  80bf15:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80bf1c:	89 d6                	mov    esi,edx
  80bf1e:	48 89 c7             	mov    rdi,rax
  80bf21:	e8 ad 00 00 00       	call   80bfd3 <sprint_decimal>
            if(*pstr=='x'){
  80bf26:	eb 4e                	jmp    80bf76 <sprintf+0x2e6>
            }else if(*pstr=='c'){
  80bf28:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bf2f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bf32:	3c 63                	cmp    al,0x63
  80bf34:	75 02                	jne    80bf38 <sprintf+0x2a8>
                char v=va_arg(vargs,char);
  80bf36:	0f 0b                	ud2    
                sprintchar(dist,v);
            }else{
                sprintchar(dist,*pstr);
  80bf38:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bf3f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bf42:	0f be d0             	movsx  edx,al
  80bf45:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80bf4c:	89 d6                	mov    esi,edx
  80bf4e:	48 89 c7             	mov    rdi,rax
  80bf51:	e8 3e 00 00 00       	call   80bf94 <sprintchar>
            if(*pstr=='x'){
  80bf56:	eb 1e                	jmp    80bf76 <sprintf+0x2e6>
            }
        }else{
            sprintchar(dist,*pstr);
  80bf58:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bf5f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bf62:	0f be d0             	movsx  edx,al
  80bf65:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80bf6c:	89 d6                	mov    esi,edx
  80bf6e:	48 89 c7             	mov    rdi,rax
  80bf71:	e8 1e 00 00 00       	call   80bf94 <sprintchar>
    for(;*pstr!='\0';pstr++){
  80bf76:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80bf7d:	01 
  80bf7e:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80bf85:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bf88:	84 c0                	test   al,al
  80bf8a:	0f 85 0c fe ff ff    	jne    80bd9c <sprintf+0x10c>
        }
    }
    va_end(vargs);
}
  80bf90:	90                   	nop
  80bf91:	90                   	nop
  80bf92:	c9                   	leave  
  80bf93:	c3                   	ret    

000000000080bf94 <sprintchar>:
void sprintchar(char *dist,char c)
{
  80bf94:	f3 0f 1e fa          	endbr64 
  80bf98:	55                   	push   rbp
  80bf99:	48 89 e5             	mov    rbp,rsp
  80bf9c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80bfa0:	89 f0                	mov    eax,esi
  80bfa2:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    while(*dist!='\0')
  80bfa5:	eb 05                	jmp    80bfac <sprintchar+0x18>
        dist++;
  80bfa7:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    while(*dist!='\0')
  80bfac:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bfb0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80bfb3:	84 c0                	test   al,al
  80bfb5:	75 f0                	jne    80bfa7 <sprintchar+0x13>
    *dist++=c;
  80bfb7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bfbb:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80bfbf:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80bfc3:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  80bfc7:	88 10                	mov    BYTE PTR [rax],dl
    *dist='\0';
  80bfc9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80bfcd:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80bfd0:	90                   	nop
  80bfd1:	5d                   	pop    rbp
  80bfd2:	c3                   	ret    

000000000080bfd3 <sprint_decimal>:
void sprint_decimal(char *dist,int c)
{
  80bfd3:	f3 0f 1e fa          	endbr64 
  80bfd7:	55                   	push   rbp
  80bfd8:	48 89 e5             	mov    rbp,rsp
  80bfdb:	48 83 ec 30          	sub    rsp,0x30
  80bfdf:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80bfe3:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
    unsigned char st[22];
    int p=0;
  80bfe6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<sizeof(unsigned long)*2){
  80bfed:	eb 65                	jmp    80c054 <sprint_decimal+0x81>
        unsigned char a=c%10+'0';
  80bfef:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  80bff2:	48 63 c2             	movsxd rax,edx
  80bff5:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  80bffc:	48 c1 e8 20          	shr    rax,0x20
  80c000:	c1 f8 02             	sar    eax,0x2
  80c003:	89 d6                	mov    esi,edx
  80c005:	c1 fe 1f             	sar    esi,0x1f
  80c008:	29 f0                	sub    eax,esi
  80c00a:	89 c1                	mov    ecx,eax
  80c00c:	89 c8                	mov    eax,ecx
  80c00e:	c1 e0 02             	shl    eax,0x2
  80c011:	01 c8                	add    eax,ecx
  80c013:	01 c0                	add    eax,eax
  80c015:	89 d1                	mov    ecx,edx
  80c017:	29 c1                	sub    ecx,eax
  80c019:	89 c8                	mov    eax,ecx
  80c01b:	83 c0 30             	add    eax,0x30
  80c01e:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        st[p++]=a;
  80c021:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c024:	8d 50 01             	lea    edx,[rax+0x1]
  80c027:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80c02a:	48 98                	cdqe   
  80c02c:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80c030:	88 54 05 e0          	mov    BYTE PTR [rbp+rax*1-0x20],dl
        c/=10;
  80c034:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80c037:	48 63 d0             	movsxd rdx,eax
  80c03a:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
  80c041:	48 c1 ea 20          	shr    rdx,0x20
  80c045:	c1 fa 02             	sar    edx,0x2
  80c048:	c1 f8 1f             	sar    eax,0x1f
  80c04b:	89 c1                	mov    ecx,eax
  80c04d:	89 d0                	mov    eax,edx
  80c04f:	29 c8                	sub    eax,ecx
  80c051:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    while(p<sizeof(unsigned long)*2){
  80c054:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c057:	83 f8 0f             	cmp    eax,0xf
  80c05a:	76 93                	jbe    80bfef <sprint_decimal+0x1c>
    }
    while(p>0)
  80c05c:	eb 1f                	jmp    80c07d <sprint_decimal+0xaa>
    {
        sprintchar(dist,st[--p]);
  80c05e:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80c062:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c065:	48 98                	cdqe   
  80c067:	0f b6 44 05 e0       	movzx  eax,BYTE PTR [rbp+rax*1-0x20]
  80c06c:	0f be d0             	movsx  edx,al
  80c06f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80c073:	89 d6                	mov    esi,edx
  80c075:	48 89 c7             	mov    rdi,rax
  80c078:	e8 17 ff ff ff       	call   80bf94 <sprintchar>
    while(p>0)
  80c07d:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80c081:	7f db                	jg     80c05e <sprint_decimal+0x8b>
    }
}
  80c083:	90                   	nop
  80c084:	90                   	nop
  80c085:	c9                   	leave  
  80c086:	c3                   	ret    

000000000080c087 <sprint_hex>:
void sprint_hex(char *dist,unsigned int c)
{
  80c087:	f3 0f 1e fa          	endbr64 
  80c08b:	55                   	push   rbp
  80c08c:	48 89 e5             	mov    rbp,rsp
  80c08f:	48 83 ec 20          	sub    rsp,0x20
  80c093:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80c097:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    unsigned char st[10];
    int p=0;
  80c09a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<10){
  80c0a1:	eb 35                	jmp    80c0d8 <sprint_hex+0x51>
        unsigned char a=c%16;
  80c0a3:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80c0a6:	83 e0 0f             	and    eax,0xf
  80c0a9:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        if(a>9)a+='a'-10;
  80c0ac:	80 7d fb 09          	cmp    BYTE PTR [rbp-0x5],0x9
  80c0b0:	76 06                	jbe    80c0b8 <sprint_hex+0x31>
  80c0b2:	80 45 fb 57          	add    BYTE PTR [rbp-0x5],0x57
  80c0b6:	eb 04                	jmp    80c0bc <sprint_hex+0x35>
        else a+='0';
  80c0b8:	80 45 fb 30          	add    BYTE PTR [rbp-0x5],0x30
        st[p++]=a;
  80c0bc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c0bf:	8d 50 01             	lea    edx,[rax+0x1]
  80c0c2:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80c0c5:	48 98                	cdqe   
  80c0c7:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80c0cb:	88 54 05 f1          	mov    BYTE PTR [rbp+rax*1-0xf],dl
        c/=16;
  80c0cf:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80c0d2:	c1 e8 04             	shr    eax,0x4
  80c0d5:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    while(p<10){
  80c0d8:	83 7d fc 09          	cmp    DWORD PTR [rbp-0x4],0x9
  80c0dc:	7e c5                	jle    80c0a3 <sprint_hex+0x1c>
    }
    while(p>0)
  80c0de:	eb 1f                	jmp    80c0ff <sprint_hex+0x78>
    {
        sprintchar(dist,st[--p]);
  80c0e0:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80c0e4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80c0e7:	48 98                	cdqe   
  80c0e9:	0f b6 44 05 f1       	movzx  eax,BYTE PTR [rbp+rax*1-0xf]
  80c0ee:	0f be d0             	movsx  edx,al
  80c0f1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80c0f5:	89 d6                	mov    esi,edx
  80c0f7:	48 89 c7             	mov    rdi,rax
  80c0fa:	e8 95 fe ff ff       	call   80bf94 <sprintchar>
    while(p>0)
  80c0ff:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80c103:	7f db                	jg     80c0e0 <sprint_hex+0x59>
    }
}
  80c105:	90                   	nop
  80c106:	90                   	nop
  80c107:	c9                   	leave  
  80c108:	c3                   	ret    

000000000080c109 <sprintn>:
void sprintn(char *dist,char *str)
{
  80c109:	f3 0f 1e fa          	endbr64 
  80c10d:	55                   	push   rbp
  80c10e:	48 89 e5             	mov    rbp,rsp
  80c111:	48 83 ec 10          	sub    rsp,0x10
  80c115:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80c119:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*str!='\0')
  80c11d:	eb 20                	jmp    80c13f <sprintn+0x36>
    {
        sprintchar(dist,*str++);
  80c11f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c123:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80c127:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  80c12b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c12e:	0f be d0             	movsx  edx,al
  80c131:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80c135:	89 d6                	mov    esi,edx
  80c137:	48 89 c7             	mov    rdi,rax
  80c13a:	e8 55 fe ff ff       	call   80bf94 <sprintchar>
    while(*str!='\0')
  80c13f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80c143:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80c146:	84 c0                	test   al,al
  80c148:	75 d5                	jne    80c11f <sprintn+0x16>
    }
  80c14a:	90                   	nop
  80c14b:	90                   	nop
  80c14c:	c9                   	leave  
  80c14d:	c3                   	ret    
  80c14e:	66 90                	xchg   ax,ax

000000000080c150 <create_zero>:
  80c150:	e8 4e 77 ff ff       	call   8038a3 <req_proc>
  80c155:	83 f8 ff             	cmp    eax,0xffffffff
  80c158:	74 0c                	je     80c166 <create_zero.retu>
  80c15a:	e8 10 78 ff ff       	call   80396f <set_proc>
  80c15f:	67 8b 04 24          	mov    eax,DWORD PTR [esp]
  80c163:	83 c4 40             	add    esp,0x40

000000000080c166 <create_zero.retu>:
  80c166:	c3                   	ret    

000000000080c167 <fill_desc>:
  80c167:	55                   	push   rbp
  80c168:	48 89 e5             	mov    rbp,rsp
  80c16b:	67 8b 45 14          	mov    eax,DWORD PTR [ebp+0x14]
  80c16f:	67 8b 5d 10          	mov    ebx,DWORD PTR [ebp+0x10]
  80c173:	67 8b 4d 0c          	mov    ecx,DWORD PTR [ebp+0xc]
  80c177:	67 8b 55 08          	mov    edx,DWORD PTR [ebp+0x8]
  80c17b:	be ba c2 80 00       	mov    esi,0x80c2ba
  80c180:	c7 04 25 ba c2 80 00 	mov    DWORD PTR ds:0x80c2ba,0x0
  80c187:	00 00 00 00 
  80c18b:	c7 04 25 be c2 80 00 	mov    DWORD PTR ds:0x80c2be,0x0
  80c192:	00 00 00 00 
  80c196:	66 67 89 0e          	mov    WORD PTR [esi],cx
  80c19a:	c1 e9 10             	shr    ecx,0x10
  80c19d:	66 67 89 56 02       	mov    WORD PTR [esi+0x2],dx
  80c1a2:	c1 ea 10             	shr    edx,0x10
  80c1a5:	67 88 56 04          	mov    BYTE PTR [esi+0x4],dl
  80c1a9:	66 c1 ea 08          	shr    dx,0x8
  80c1ad:	67 88 56 07          	mov    BYTE PTR [esi+0x7],dl
  80c1b1:	66 67 89 5e 05       	mov    WORD PTR [esi+0x5],bx
  80c1b6:	67 8b 7e 04          	mov    edi,DWORD PTR [esi+0x4]
  80c1ba:	c1 e1 08             	shl    ecx,0x8
  80c1bd:	09 cf                	or     edi,ecx
  80c1bf:	67 89 7e 04          	mov    DWORD PTR [esi+0x4],edi
  80c1c3:	8b 14 25 ba c2 80 00 	mov    edx,DWORD PTR ds:0x80c2ba
  80c1ca:	67 89 10             	mov    DWORD PTR [eax],edx
  80c1cd:	8b 14 25 be c2 80 00 	mov    edx,DWORD PTR ds:0x80c2be
  80c1d4:	67 89 50 04          	mov    DWORD PTR [eax+0x4],edx
  80c1d8:	c9                   	leave  
  80c1d9:	c3                   	ret    

000000000080c1da <switch_proc_asm>:
  80c1da:	66 67 8b 44 24 04    	mov    ax,WORD PTR [esp+0x4]
  80c1e0:	66 89 04 25 f8 c1 80 	mov    WORD PTR ds:0x80c1f8,ax
  80c1e7:	00 
  80c1e8:	c7 04 25 f4 c1 80 00 	mov    DWORD PTR ds:0x80c1f4,0x0
  80c1ef:	00 00 00 00 

000000000080c1f3 <switch_proc_asm.ljmp>:
  80c1f3:	ea                   	(bad)  
  80c1f4:	00 00                	add    BYTE PTR [rax],al
  80c1f6:	00 00                	add    BYTE PTR [rax],al
  80c1f8:	00 00                	add    BYTE PTR [rax],al
  80c1fa:	c3                   	ret    

000000000080c1fb <switch_to_old>:
  80c1fb:	67 8b 74 24 04       	mov    esi,DWORD PTR [esp+0x4]
  80c200:	67 8b 5e 20          	mov    ebx,DWORD PTR [esi+0x20]
  80c204:	bf 6c c2 80 00       	mov    edi,0x80c26c
  80c209:	67 89 5f 01          	mov    DWORD PTR [edi+0x1],ebx
  80c20d:	67 8b 46 38          	mov    eax,DWORD PTR [esi+0x38]
  80c211:	89 c1                	mov    ecx,eax
  80c213:	83 e9 04             	sub    ecx,0x4
  80c216:	67 89 19             	mov    DWORD PTR [ecx],ebx
  80c219:	50                   	push   rax
  80c21a:	89 f5                	mov    ebp,esi
  80c21c:	83 c5 28             	add    ebp,0x28
  80c21f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c223:	50                   	push   rax
  80c224:	83 c5 04             	add    ebp,0x4
  80c227:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c22b:	50                   	push   rax
  80c22c:	83 c5 04             	add    ebp,0x4
  80c22f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c233:	50                   	push   rax
  80c234:	83 c5 04             	add    ebp,0x4
  80c237:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c23b:	50                   	push   rax
  80c23c:	83 c5 04             	add    ebp,0x4
  80c23f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c243:	50                   	push   rax
  80c244:	83 c5 04             	add    ebp,0x4
  80c247:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c24b:	50                   	push   rax
  80c24c:	83 c5 04             	add    ebp,0x4
  80c24f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c253:	50                   	push   rax
  80c254:	83 c5 04             	add    ebp,0x4
  80c257:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80c25b:	50                   	push   rax
  80c25c:	83 c5 04             	add    ebp,0x4
  80c25f:	67 8b 46 1c          	mov    eax,DWORD PTR [esi+0x1c]
  80c263:	0f 22 d8             	mov    cr3,rax
  80c266:	67 8b 46 24          	mov    eax,DWORD PTR [esi+0x24]
  80c26a:	50                   	push   rax
  80c26b:	5c                   	pop    rsp

000000000080c26c <switch_to_old.leap>:
  80c26c:	ea                   	(bad)  
  80c26d:	00 00                	add    BYTE PTR [rax],al
  80c26f:	00 00                	add    BYTE PTR [rax],al
  80c271:	08 00                	or     BYTE PTR [rax],al

000000000080c273 <save_context>:
  80c273:	67 8b 44 24 24       	mov    eax,DWORD PTR [esp+0x24]
  80c278:	83 c0 44             	add    eax,0x44
  80c27b:	b9 08 00 00 00       	mov    ecx,0x8
  80c280:	89 e7                	mov    edi,esp

000000000080c282 <save_context.loops>:
  80c282:	67 8b 17             	mov    edx,DWORD PTR [edi]
  80c285:	67 89 10             	mov    DWORD PTR [eax],edx
  80c288:	83 c7 04             	add    edi,0x4
  80c28b:	83 e8 04             	sub    eax,0x4
  80c28e:	e2 f2                	loop   80c282 <save_context.loops>
  80c290:	5b                   	pop    rbx
  80c291:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  80c296:	67 89 58 24          	mov    DWORD PTR [eax+0x24],ebx
  80c29a:	67 48 8b 1c 24       	mov    rbx,QWORD PTR [esp]
  80c29f:	67 89 58 20          	mov    DWORD PTR [eax+0x20],ebx
  80c2a3:	c3                   	ret    

000000000080c2a4 <move_to_user_mode>:
  80c2a4:	66 b8 20 00          	mov    ax,0x20
  80c2a8:	8e d8                	mov    ds,eax
  80c2aa:	8e c0                	mov    es,eax
  80c2ac:	8e e8                	mov    gs,eax
  80c2ae:	6a 20                	push   0x20
  80c2b0:	54                   	push   rsp
  80c2b1:	6a 18                	push   0x18
  80c2b3:	68 b9 c2 80 00       	push   0x80c2b9
  80c2b8:	cf                   	iret   

000000000080c2b9 <move_to_user_mode.done>:
  80c2b9:	c3                   	ret    

000000000080c2ba <desc>:
	...

000000000080c2c2 <ret_sys_call>:
  80c2c2:	58                   	pop    rax
  80c2c3:	8e d8                	mov    ds,eax
  80c2c5:	58                   	pop    rax
  80c2c6:	8e c0                	mov    es,eax
  80c2c8:	41 5f                	pop    r15
  80c2ca:	41 5e                	pop    r14
  80c2cc:	41 5d                	pop    r13
  80c2ce:	41 5c                	pop    r12
  80c2d0:	41 5b                	pop    r11
  80c2d2:	41 5a                	pop    r10
  80c2d4:	41 59                	pop    r9
  80c2d6:	41 58                	pop    r8
  80c2d8:	5e                   	pop    rsi
  80c2d9:	5f                   	pop    rdi
  80c2da:	5a                   	pop    rdx
  80c2db:	59                   	pop    rcx
  80c2dc:	5b                   	pop    rbx
  80c2dd:	58                   	pop    rax

000000000080c2de <tmp>:
  80c2de:	48 0f 07             	sysretq 

000000000080c2e1 <ret_normal_proc>:
  80c2e1:	58                   	pop    rax
  80c2e2:	8e d8                	mov    ds,eax
  80c2e4:	58                   	pop    rax
  80c2e5:	8e c0                	mov    es,eax
  80c2e7:	41 5f                	pop    r15
  80c2e9:	41 5e                	pop    r14
  80c2eb:	41 5d                	pop    r13
  80c2ed:	41 5c                	pop    r12
  80c2ef:	41 5b                	pop    r11
  80c2f1:	41 5a                	pop    r10
  80c2f3:	41 59                	pop    r9
  80c2f5:	41 58                	pop    r8
  80c2f7:	5e                   	pop    rsi
  80c2f8:	5f                   	pop    rdi
  80c2f9:	5a                   	pop    rdx
  80c2fa:	59                   	pop    rcx
  80c2fb:	5b                   	pop    rbx
  80c2fc:	58                   	pop    rax
  80c2fd:	c3                   	ret    
