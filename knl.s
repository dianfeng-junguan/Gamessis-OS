
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
  100093:	b8 04 08 80 00       	mov    eax,0x800804
  100098:	ea                   	(bad)  
  100099:	04 08                	add    al,0x8
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
  80000c:	b8 fc 03 80 00       	mov    eax,0x8003fc
  800011:	b9 00 8f 00 00       	mov    ecx,0x8f00
  800016:	ba 08 00 00 00       	mov    edx,0x8
  80001b:	48 89 c6             	mov    rsi,rax
  80001e:	bf 00 00 00 00       	mov    edi,0x0
  800023:	e8 0d 03 00 00       	call   800335 <set_gate>
    set_gate(1,(addr_t)debug,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800028:	b8 16 04 80 00       	mov    eax,0x800416
  80002d:	b9 00 8f 00 00       	mov    ecx,0x8f00
  800032:	ba 08 00 00 00       	mov    edx,0x8
  800037:	48 89 c6             	mov    rsi,rax
  80003a:	bf 01 00 00 00       	mov    edi,0x1
  80003f:	e8 f1 02 00 00       	call   800335 <set_gate>
    set_gate(2,(addr_t)default_int_proc,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800044:	b8 30 04 80 00       	mov    eax,0x800430
  800049:	b9 00 8f 00 00       	mov    ecx,0x8f00
  80004e:	ba 08 00 00 00       	mov    edx,0x8
  800053:	48 89 c6             	mov    rsi,rax
  800056:	bf 02 00 00 00       	mov    edi,0x2
  80005b:	e8 d5 02 00 00       	call   800335 <set_gate>
    set_gate(3,(addr_t)breakpoint,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800060:	b8 4a 04 80 00       	mov    eax,0x80044a
  800065:	b9 00 8f 00 00       	mov    ecx,0x8f00
  80006a:	ba 08 00 00 00       	mov    edx,0x8
  80006f:	48 89 c6             	mov    rsi,rax
  800072:	bf 03 00 00 00       	mov    edi,0x3
  800077:	e8 b9 02 00 00       	call   800335 <set_gate>
    set_gate(4,(addr_t)overflow,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  80007c:	b8 64 04 80 00       	mov    eax,0x800464
  800081:	b9 00 8f 00 00       	mov    ecx,0x8f00
  800086:	ba 08 00 00 00       	mov    edx,0x8
  80008b:	48 89 c6             	mov    rsi,rax
  80008e:	bf 04 00 00 00       	mov    edi,0x4
  800093:	e8 9d 02 00 00       	call   800335 <set_gate>
    set_gate(5,(addr_t)bounds,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800098:	b8 7e 04 80 00       	mov    eax,0x80047e
  80009d:	b9 00 8f 00 00       	mov    ecx,0x8f00
  8000a2:	ba 08 00 00 00       	mov    edx,0x8
  8000a7:	48 89 c6             	mov    rsi,rax
  8000aa:	bf 05 00 00 00       	mov    edi,0x5
  8000af:	e8 81 02 00 00       	call   800335 <set_gate>
    set_gate(6,(addr_t)undefined_operator,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  8000b4:	b8 98 04 80 00       	mov    eax,0x800498
  8000b9:	b9 00 8f 00 00       	mov    ecx,0x8f00
  8000be:	ba 08 00 00 00       	mov    edx,0x8
  8000c3:	48 89 c6             	mov    rsi,rax
  8000c6:	bf 06 00 00 00       	mov    edi,0x6
  8000cb:	e8 65 02 00 00       	call   800335 <set_gate>
    set_gate(7,(addr_t)coprocessor_notexist,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  8000d0:	b8 bc 04 80 00       	mov    eax,0x8004bc
  8000d5:	b9 00 8f 00 00       	mov    ecx,0x8f00
  8000da:	ba 08 00 00 00       	mov    edx,0x8
  8000df:	48 89 c6             	mov    rsi,rax
  8000e2:	bf 07 00 00 00       	mov    edi,0x7
  8000e7:	e8 49 02 00 00       	call   800335 <set_gate>
    set_gate(8,(addr_t)double_ints,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);//double_ints
  8000ec:	b8 d6 04 80 00       	mov    eax,0x8004d6
  8000f1:	b9 00 8f 00 00       	mov    ecx,0x8f00
  8000f6:	ba 08 00 00 00       	mov    edx,0x8
  8000fb:	48 89 c6             	mov    rsi,rax
  8000fe:	bf 08 00 00 00       	mov    edi,0x8
  800103:	e8 2d 02 00 00       	call   800335 <set_gate>
    set_gate(9,(addr_t)coprocessor_seg_overbound,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800108:	b8 f0 04 80 00       	mov    eax,0x8004f0
  80010d:	b9 00 8f 00 00       	mov    ecx,0x8f00
  800112:	ba 08 00 00 00       	mov    edx,0x8
  800117:	48 89 c6             	mov    rsi,rax
  80011a:	bf 09 00 00 00       	mov    edi,0x9
  80011f:	e8 11 02 00 00       	call   800335 <set_gate>
    set_gate(10,(addr_t)invalid_tss,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800124:	b8 08 05 80 00       	mov    eax,0x800508
  800129:	b9 00 8f 00 00       	mov    ecx,0x8f00
  80012e:	ba 08 00 00 00       	mov    edx,0x8
  800133:	48 89 c6             	mov    rsi,rax
  800136:	bf 0a 00 00 00       	mov    edi,0xa
  80013b:	e8 f5 01 00 00       	call   800335 <set_gate>
    set_gate(11,(addr_t)segment_notexist,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800140:	b8 22 05 80 00       	mov    eax,0x800522
  800145:	b9 00 8f 00 00       	mov    ecx,0x8f00
  80014a:	ba 08 00 00 00       	mov    edx,0x8
  80014f:	48 89 c6             	mov    rsi,rax
  800152:	bf 0b 00 00 00       	mov    edi,0xb
  800157:	e8 d9 01 00 00       	call   800335 <set_gate>
    set_gate(12,(addr_t)stackseg_overbound,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);//
  80015c:	b8 3c 05 80 00       	mov    eax,0x80053c
  800161:	b9 00 8f 00 00       	mov    ecx,0x8f00
  800166:	ba 08 00 00 00       	mov    edx,0x8
  80016b:	48 89 c6             	mov    rsi,rax
  80016e:	bf 0c 00 00 00       	mov    edi,0xc
  800173:	e8 bd 01 00 00       	call   800335 <set_gate>
    set_gate(13,(addr_t)general_protect,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800178:	b8 56 05 80 00       	mov    eax,0x800556
  80017d:	b9 00 8f 00 00       	mov    ecx,0x8f00
  800182:	ba 08 00 00 00       	mov    edx,0x8
  800187:	48 89 c6             	mov    rsi,rax
  80018a:	bf 0d 00 00 00       	mov    edi,0xd
  80018f:	e8 a1 01 00 00       	call   800335 <set_gate>
    set_gate(14,(addr_t)page_err,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800194:	b8 19 12 80 00       	mov    eax,0x801219
  800199:	b9 00 8f 00 00       	mov    ecx,0x8f00
  80019e:	ba 08 00 00 00       	mov    edx,0x8
  8001a3:	48 89 c6             	mov    rsi,rax
  8001a6:	bf 0e 00 00 00       	mov    edi,0xe
  8001ab:	e8 85 01 00 00       	call   800335 <set_gate>
    set_gate(15,(addr_t)default_int_proc,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  8001b0:	b8 30 04 80 00       	mov    eax,0x800430
  8001b5:	b9 00 8f 00 00       	mov    ecx,0x8f00
  8001ba:	ba 08 00 00 00       	mov    edx,0x8
  8001bf:	48 89 c6             	mov    rsi,rax
  8001c2:	bf 0f 00 00 00       	mov    edi,0xf
  8001c7:	e8 69 01 00 00       	call   800335 <set_gate>
    set_gate(16,(addr_t)coprocessor_err,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  8001cc:	b8 7d 05 80 00       	mov    eax,0x80057d
  8001d1:	b9 00 8f 00 00       	mov    ecx,0x8f00
  8001d6:	ba 08 00 00 00       	mov    edx,0x8
  8001db:	48 89 c6             	mov    rsi,rax
  8001de:	bf 10 00 00 00       	mov    edi,0x10
  8001e3:	e8 4d 01 00 00       	call   800335 <set_gate>
    for (int i=17;i<48;i++)
  8001e8:	c7 45 fc 11 00 00 00 	mov    DWORD PTR [rbp-0x4],0x11
  8001ef:	eb 20                	jmp    800211 <init_int+0x211>
        set_gate(i,(addr_t)default_int_proc,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  8001f1:	be 30 04 80 00       	mov    esi,0x800430
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
  800217:	b8 ea 66 80 00       	mov    eax,0x8066ea
  80021c:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800221:	ba 08 00 00 00       	mov    edx,0x8
  800226:	48 89 c6             	mov    rsi,rax
  800229:	bf 21 00 00 00       	mov    edi,0x21
  80022e:	e8 02 01 00 00       	call   800335 <set_gate>
	set_gate(0x20,(addr_t)clock,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800233:	b8 a0 50 80 00       	mov    eax,0x8050a0
  800238:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80023d:	ba 08 00 00 00       	mov    edx,0x8
  800242:	48 89 c6             	mov    rsi,rax
  800245:	bf 20 00 00 00       	mov    edi,0x20
  80024a:	e8 e6 00 00 00       	call   800335 <set_gate>
	set_gate(0x2e,(addr_t)disk_int_handler,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80024f:	b8 f0 75 80 00       	mov    eax,0x8075f0
  800254:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800259:	ba 08 00 00 00       	mov    edx,0x8
  80025e:	48 89 c6             	mov    rsi,rax
  800261:	bf 2e 00 00 00       	mov    edi,0x2e
  800266:	e8 ca 00 00 00       	call   800335 <set_gate>
    set_gate(0x80,(addr_t)_syscall,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);//
  80026b:	b8 d0 5a 80 00       	mov    eax,0x805ad0
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
  800291:	e8 7a 4b 00 00       	call   804e10 <outb>
	outb(0xA0,0x11);
  800296:	be 11 00 00 00       	mov    esi,0x11
  80029b:	bf a0 00 00 00       	mov    edi,0xa0
  8002a0:	e8 6b 4b 00 00       	call   804e10 <outb>
	//ICW2
	outb(0x21,0x20);//former 0x20,0x20
  8002a5:	be 20 00 00 00       	mov    esi,0x20
  8002aa:	bf 21 00 00 00       	mov    edi,0x21
  8002af:	e8 5c 4b 00 00       	call   804e10 <outb>
	outb(0xA1,0x28);
  8002b4:	be 28 00 00 00       	mov    esi,0x28
  8002b9:	bf a1 00 00 00       	mov    edi,0xa1
  8002be:	e8 4d 4b 00 00       	call   804e10 <outb>
	//ICW3
	outb(0x21,0x04);
  8002c3:	be 04 00 00 00       	mov    esi,0x4
  8002c8:	bf 21 00 00 00       	mov    edi,0x21
  8002cd:	e8 3e 4b 00 00       	call   804e10 <outb>
	outb(0xA1,0x02);
  8002d2:	be 02 00 00 00       	mov    esi,0x2
  8002d7:	bf a1 00 00 00       	mov    edi,0xa1
  8002dc:	e8 2f 4b 00 00       	call   804e10 <outb>
	//ICW4
	outb(0x21,0x01);
  8002e1:	be 01 00 00 00       	mov    esi,0x1
  8002e6:	bf 21 00 00 00       	mov    edi,0x21
  8002eb:	e8 20 4b 00 00       	call   804e10 <outb>
	outb(0xA1,0x01);
  8002f0:	be 01 00 00 00       	mov    esi,0x1
  8002f5:	bf a1 00 00 00       	mov    edi,0xa1
  8002fa:	e8 11 4b 00 00       	call   804e10 <outb>

    turn_on_int();
  8002ff:	b8 00 00 00 00       	mov    eax,0x0
  800304:	e8 41 4b 00 00       	call   804e4a <turn_on_int>

    //设置IA32_LSTAR,为syscall做设置
    wrmsr(0xc0000082, _syscall);
  800309:	b8 d0 5a 80 00       	mov    eax,0x805ad0
  80030e:	48 89 c6             	mov    rsi,rax
  800311:	b8 82 00 00 c0       	mov    eax,0xc0000082
  800316:	48 89 c7             	mov    rdi,rax
  800319:	e8 bc 04 00 00       	call   8007da <wrmsr>
    //设置IA32_FMASK,为syscall做设置
    wrmsr(0xc0000084, -1);
  80031e:	48 c7 c6 ff ff ff ff 	mov    rsi,0xffffffffffffffff
  800325:	b8 84 00 00 c0       	mov    eax,0xc0000084
  80032a:	48 89 c7             	mov    rdi,rax
  80032d:	e8 a8 04 00 00       	call   8007da <wrmsr>
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
  800350:	48 8b 15 29 ab 00 00 	mov    rdx,QWORD PTR [rip+0xab29]        # 80ae80 <idt>
  800357:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80035b:	48 c1 e0 04          	shl    rax,0x4
  80035f:	48 01 d0             	add    rax,rdx
  800362:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800366:	66 89 10             	mov    WORD PTR [rax],dx
    idt[index].offset_mid=(offset>>16)&0xffff;
  800369:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80036d:	48 c1 e8 10          	shr    rax,0x10
  800371:	48 89 c2             	mov    rdx,rax
  800374:	48 8b 0d 05 ab 00 00 	mov    rcx,QWORD PTR [rip+0xab05]        # 80ae80 <idt>
  80037b:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80037f:	48 c1 e0 04          	shl    rax,0x4
  800383:	48 01 c8             	add    rax,rcx
  800386:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
    idt[index].offset_high=(offset>>32)&0x0000ffff;
  80038a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80038e:	48 c1 e8 20          	shr    rax,0x20
  800392:	89 c1                	mov    ecx,eax
  800394:	48 8b 15 e5 aa 00 00 	mov    rdx,QWORD PTR [rip+0xaae5]        # 80ae80 <idt>
  80039b:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80039f:	48 c1 e0 04          	shl    rax,0x4
  8003a3:	48 01 c2             	add    rdx,rax
  8003a6:	0f b7 c1             	movzx  eax,cx
  8003a9:	89 42 08             	mov    DWORD PTR [rdx+0x8],eax
    idt[index].attr=attr;
  8003ac:	48 8b 15 cd aa 00 00 	mov    rdx,QWORD PTR [rip+0xaacd]        # 80ae80 <idt>
  8003b3:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003b7:	48 c1 e0 04          	shl    rax,0x4
  8003bb:	48 01 c2             	add    rdx,rax
  8003be:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  8003c2:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
    idt[index].selector=selector;
  8003c6:	48 8b 15 b3 aa 00 00 	mov    rdx,QWORD PTR [rip+0xaab3]        # 80ae80 <idt>
  8003cd:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003d1:	48 c1 e0 04          	shl    rax,0x4
  8003d5:	48 01 c2             	add    rdx,rax
  8003d8:	0f b7 45 f8          	movzx  eax,WORD PTR [rbp-0x8]
  8003dc:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    idt[index].rsvd=0;
  8003e0:	48 8b 15 99 aa 00 00 	mov    rdx,QWORD PTR [rip+0xaa99]        # 80ae80 <idt>
  8003e7:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003eb:	48 c1 e0 04          	shl    rax,0x4
  8003ef:	48 01 d0             	add    rax,rdx
  8003f2:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [rax+0xc],0x0
#endif
}
  8003f9:	90                   	nop
  8003fa:	5d                   	pop    rbp
  8003fb:	c3                   	ret    

00000000008003fc <divide_err>:

void divide_err(){
  8003fc:	f3 0f 1e fa          	endbr64 
  800400:	55                   	push   rbp
  800401:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  800404:	fa                   	cli    
    //puts("divide err");
    eoi();
  800405:	b8 00 00 00 00       	mov    eax,0x0
  80040a:	e8 2f 4a 00 00       	call   804e3e <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  80040f:	fb                   	sti    
  800410:	c9                   	leave  
  800411:	48 cf                	iretq  
}
  800413:	90                   	nop
  800414:	5d                   	pop    rbp
  800415:	c3                   	ret    

0000000000800416 <debug>:

void debug(){
  800416:	f3 0f 1e fa          	endbr64 
  80041a:	55                   	push   rbp
  80041b:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  80041e:	fa                   	cli    
    //puts("debug");
    eoi();
  80041f:	b8 00 00 00 00       	mov    eax,0x0
  800424:	e8 15 4a 00 00       	call   804e3e <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  800429:	fb                   	sti    
  80042a:	c9                   	leave  
  80042b:	48 cf                	iretq  
}
  80042d:	90                   	nop
  80042e:	5d                   	pop    rbp
  80042f:	c3                   	ret    

0000000000800430 <default_int_proc>:
void default_int_proc(){
  800430:	f3 0f 1e fa          	endbr64 
  800434:	55                   	push   rbp
  800435:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  800438:	fa                   	cli    
    //puts("default_int_proc");
    eoi();
  800439:	b8 00 00 00 00       	mov    eax,0x0
  80043e:	e8 fb 49 00 00       	call   804e3e <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  800443:	fb                   	sti    
  800444:	c9                   	leave  
  800445:	48 cf                	iretq  
}
  800447:	90                   	nop
  800448:	5d                   	pop    rbp
  800449:	c3                   	ret    

000000000080044a <breakpoint>:
void breakpoint(){
  80044a:	f3 0f 1e fa          	endbr64 
  80044e:	55                   	push   rbp
  80044f:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  800452:	fa                   	cli    
    //puts("breakpoint");
    eoi();
  800453:	b8 00 00 00 00       	mov    eax,0x0
  800458:	e8 e1 49 00 00       	call   804e3e <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  80045d:	fb                   	sti    
  80045e:	c9                   	leave  
  80045f:	48 cf                	iretq  
}
  800461:	90                   	nop
  800462:	5d                   	pop    rbp
  800463:	c3                   	ret    

0000000000800464 <overflow>:
void overflow(){
  800464:	f3 0f 1e fa          	endbr64 
  800468:	55                   	push   rbp
  800469:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  80046c:	fa                   	cli    
    //puts("overflow");
    eoi();
  80046d:	b8 00 00 00 00       	mov    eax,0x0
  800472:	e8 c7 49 00 00       	call   804e3e <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  800477:	fb                   	sti    
  800478:	c9                   	leave  
  800479:	48 cf                	iretq  
}
  80047b:	90                   	nop
  80047c:	5d                   	pop    rbp
  80047d:	c3                   	ret    

000000000080047e <bounds>:
void bounds(){
  80047e:	f3 0f 1e fa          	endbr64 
  800482:	55                   	push   rbp
  800483:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  800486:	fa                   	cli    
    //puts("bounds");
    eoi();
  800487:	b8 00 00 00 00       	mov    eax,0x0
  80048c:	e8 ad 49 00 00       	call   804e3e <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  800491:	fb                   	sti    
  800492:	c9                   	leave  
  800493:	48 cf                	iretq  
}
  800495:	90                   	nop
  800496:	5d                   	pop    rbp
  800497:	c3                   	ret    

0000000000800498 <undefined_operator>:
void undefined_operator(){
  800498:	f3 0f 1e fa          	endbr64 
  80049c:	55                   	push   rbp
  80049d:	48 89 e5             	mov    rbp,rsp
    //puts("undef operator");
    eoi();
  8004a0:	b8 00 00 00 00       	mov    eax,0x0
  8004a5:	e8 94 49 00 00       	call   804e3e <eoi>
    report_back_trace_of_err();
  8004aa:	b8 00 00 00 00       	mov    eax,0x0
  8004af:	e8 b6 49 00 00       	call   804e6a <report_back_trace_of_err>
    __asm__ volatile ("jmp .\r\n leave \r\n iretq");
  8004b4:	eb fe                	jmp    8004b4 <undefined_operator+0x1c>
  8004b6:	c9                   	leave  
  8004b7:	48 cf                	iretq  
}
  8004b9:	90                   	nop
  8004ba:	5d                   	pop    rbp
  8004bb:	c3                   	ret    

00000000008004bc <coprocessor_notexist>:
void coprocessor_notexist(){
  8004bc:	f3 0f 1e fa          	endbr64 
  8004c0:	55                   	push   rbp
  8004c1:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  8004c4:	fa                   	cli    
    //puts("coprocessor doesnt exist");
    eoi();
  8004c5:	b8 00 00 00 00       	mov    eax,0x0
  8004ca:	e8 6f 49 00 00       	call   804e3e <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  8004cf:	fb                   	sti    
  8004d0:	c9                   	leave  
  8004d1:	48 cf                	iretq  
}
  8004d3:	90                   	nop
  8004d4:	5d                   	pop    rbp
  8004d5:	c3                   	ret    

00000000008004d6 <double_ints>:
void double_ints(){
  8004d6:	f3 0f 1e fa          	endbr64 
  8004da:	55                   	push   rbp
  8004db:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  8004de:	fa                   	cli    
    //puts("double interrupts");
    eoi();
  8004df:	b8 00 00 00 00       	mov    eax,0x0
  8004e4:	e8 55 49 00 00       	call   804e3e <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  8004e9:	fb                   	sti    
  8004ea:	c9                   	leave  
  8004eb:	48 cf                	iretq  
}
  8004ed:	90                   	nop
  8004ee:	5d                   	pop    rbp
  8004ef:	c3                   	ret    

00000000008004f0 <coprocessor_seg_overbound>:
void coprocessor_seg_overbound(){
  8004f0:	f3 0f 1e fa          	endbr64 
  8004f4:	55                   	push   rbp
  8004f5:	48 89 e5             	mov    rbp,rsp
    //puts("coprocessfor seg overdound");
    eoi();
  8004f8:	b8 00 00 00 00       	mov    eax,0x0
  8004fd:	e8 3c 49 00 00       	call   804e3e <eoi>
    __asm__ volatile ("leave \r\n iretq");
  800502:	c9                   	leave  
  800503:	48 cf                	iretq  
}
  800505:	90                   	nop
  800506:	5d                   	pop    rbp
  800507:	c3                   	ret    

0000000000800508 <invalid_tss>:
void invalid_tss(){
  800508:	f3 0f 1e fa          	endbr64 
  80050c:	55                   	push   rbp
  80050d:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  800510:	fa                   	cli    
    //puts("invalid tss");
    eoi();
  800511:	b8 00 00 00 00       	mov    eax,0x0
  800516:	e8 23 49 00 00       	call   804e3e <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  80051b:	fb                   	sti    
  80051c:	c9                   	leave  
  80051d:	48 cf                	iretq  
}
  80051f:	90                   	nop
  800520:	5d                   	pop    rbp
  800521:	c3                   	ret    

0000000000800522 <segment_notexist>:
void segment_notexist(){
  800522:	f3 0f 1e fa          	endbr64 
  800526:	55                   	push   rbp
  800527:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  80052a:	fa                   	cli    
    //puts("seg nonexistent");
    eoi();
  80052b:	b8 00 00 00 00       	mov    eax,0x0
  800530:	e8 09 49 00 00       	call   804e3e <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  800535:	fb                   	sti    
  800536:	c9                   	leave  
  800537:	48 cf                	iretq  
}
  800539:	90                   	nop
  80053a:	5d                   	pop    rbp
  80053b:	c3                   	ret    

000000000080053c <stackseg_overbound>:
void stackseg_overbound(){
  80053c:	f3 0f 1e fa          	endbr64 
  800540:	55                   	push   rbp
  800541:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  800544:	fa                   	cli    
    //puts("stack seg overbound");
    eoi();
  800545:	b8 00 00 00 00       	mov    eax,0x0
  80054a:	e8 ef 48 00 00       	call   804e3e <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  80054f:	fb                   	sti    
  800550:	c9                   	leave  
  800551:	48 cf                	iretq  
}
  800553:	90                   	nop
  800554:	5d                   	pop    rbp
  800555:	c3                   	ret    

0000000000800556 <general_protect>:
void general_protect(){
  800556:	f3 0f 1e fa          	endbr64 
  80055a:	55                   	push   rbp
  80055b:	48 89 e5             	mov    rbp,rsp
  80055e:	48 83 ec 10          	sub    rsp,0x10
    //print("general protect.");
    int err_code=0;
  800562:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    //杀死问题进程
    del_proc(cur_proc);
    printf("killed the problem process.\n");
	printf("shell:>");
    switch_proc_tss(0); */
    eoi();
  800569:	b8 00 00 00 00       	mov    eax,0x0
  80056e:	e8 cb 48 00 00       	call   804e3e <eoi>
    __asm__ volatile ("leave\r\n add $8,%rsp \r\n iretq");
  800573:	c9                   	leave  
  800574:	48 83 c4 08          	add    rsp,0x8
  800578:	48 cf                	iretq  
}
  80057a:	90                   	nop
  80057b:	c9                   	leave  
  80057c:	c3                   	ret    

000000000080057d <coprocessor_err>:

void coprocessor_err(){
  80057d:	f3 0f 1e fa          	endbr64 
  800581:	55                   	push   rbp
  800582:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  800585:	fa                   	cli    
    //puts("coprocessor err");
    eoi();
  800586:	b8 00 00 00 00       	mov    eax,0x0
  80058b:	e8 ae 48 00 00       	call   804e3e <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  800590:	fb                   	sti    
  800591:	c9                   	leave  
  800592:	48 cf                	iretq  
}
  800594:	90                   	nop
  800595:	5d                   	pop    rbp
  800596:	c3                   	ret    

0000000000800597 <syscall>:
int syscall(int func,int b,int c,int d,int e,int f)
{
  800597:	f3 0f 1e fa          	endbr64 
  80059b:	55                   	push   rbp
  80059c:	48 89 e5             	mov    rbp,rsp
  80059f:	48 83 ec 20          	sub    rsp,0x20
  8005a3:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  8005a6:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  8005a9:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  8005ac:	89 4d f0             	mov    DWORD PTR [rbp-0x10],ecx
  8005af:	44 89 45 ec          	mov    DWORD PTR [rbp-0x14],r8d
  8005b3:	44 89 4d e8          	mov    DWORD PTR [rbp-0x18],r9d
    switch (func)
  8005b7:	83 7d fc 64          	cmp    DWORD PTR [rbp-0x4],0x64
  8005bb:	0f 87 17 02 00 00    	ja     8007d8 <syscall+0x241>
  8005c1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8005c4:	48 8b 04 c5 c0 25 81 	mov    rax,QWORD PTR [rax*8+0x8125c0]
  8005cb:	00 
  8005cc:	3e ff e0             	notrack jmp rax
    {
        case 0:return reg_device(b);
  8005cf:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005d2:	48 98                	cdqe   
  8005d4:	48 89 c7             	mov    rdi,rax
  8005d7:	e8 b1 24 00 00       	call   802a8d <reg_device>
  8005dc:	e9 f7 01 00 00       	jmp    8007d8 <syscall+0x241>
        case 1:return dispose_device(b);
  8005e1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005e4:	89 c7                	mov    edi,eax
  8005e6:	e8 01 2f 00 00       	call   8034ec <dispose_device>
  8005eb:	e9 e8 01 00 00       	jmp    8007d8 <syscall+0x241>
        case 2:return reg_driver(b);
  8005f0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005f3:	48 98                	cdqe   
  8005f5:	48 89 c7             	mov    rdi,rax
  8005f8:	e8 78 27 00 00       	call   802d75 <reg_driver>
  8005fd:	e9 d6 01 00 00       	jmp    8007d8 <syscall+0x241>
        case 3:return dispose_driver(b);
  800602:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800605:	48 98                	cdqe   
  800607:	48 89 c7             	mov    rdi,rax
  80060a:	e8 7b 2f 00 00       	call   80358a <dispose_driver>
  80060f:	e9 c4 01 00 00       	jmp    8007d8 <syscall+0x241>
        case 4:return call_drv_func(b,c,d);
  800614:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  800617:	48 98                	cdqe   
  800619:	48 89 c2             	mov    rdx,rax
  80061c:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  80061f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800622:	89 ce                	mov    esi,ecx
  800624:	89 c7                	mov    edi,eax
  800626:	e8 6a 2c 00 00       	call   803295 <call_drv_func>
  80062b:	e9 a8 01 00 00       	jmp    8007d8 <syscall+0x241>
        case 5:return req_page_at(b,c);
  800630:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800633:	48 98                	cdqe   
  800635:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  800638:	89 d6                	mov    esi,edx
  80063a:	48 89 c7             	mov    rdi,rax
  80063d:	e8 32 11 00 00       	call   801774 <req_page_at>
  800642:	e9 91 01 00 00       	jmp    8007d8 <syscall+0x241>
        case 6:return free_page(b);
  800647:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80064a:	48 98                	cdqe   
  80064c:	48 89 c7             	mov    rdi,rax
  80064f:	e8 34 0f 00 00       	call   801588 <free_page>
  800654:	e9 7f 01 00 00       	jmp    8007d8 <syscall+0x241>
        case 7:return reg_proc(b, c, d);
  800659:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80065c:	48 98                	cdqe   
  80065e:	48 89 c2             	mov    rdx,rax
  800661:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  800664:	48 98                	cdqe   
  800666:	48 89 c1             	mov    rcx,rax
  800669:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80066c:	48 89 ce             	mov    rsi,rcx
  80066f:	89 c7                	mov    edi,eax
  800671:	e8 80 41 00 00       	call   8047f6 <reg_proc>
  800676:	e9 5d 01 00 00       	jmp    8007d8 <syscall+0x241>
        case 8:del_proc(b);
  80067b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80067e:	89 c7                	mov    edi,eax
  800680:	e8 43 3f 00 00       	call   8045c8 <del_proc>
        case 10:chk_vm(b,c);
  800685:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  800688:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80068b:	89 d6                	mov    esi,edx
  80068d:	89 c7                	mov    edi,eax
  80068f:	e8 b9 11 00 00       	call   80184d <chk_vm>
        case 11:return sys_open(b,c);
  800694:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800697:	48 98                	cdqe   
  800699:	48 89 c2             	mov    rdx,rax
  80069c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80069f:	89 c6                	mov    esi,eax
  8006a1:	48 89 d7             	mov    rdi,rdx
  8006a4:	e8 88 15 00 00       	call   801c31 <sys_open>
  8006a9:	e9 2a 01 00 00       	jmp    8007d8 <syscall+0x241>
        case 12:return sys_close(b);
  8006ae:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006b1:	89 c7                	mov    edi,eax
  8006b3:	e8 42 1a 00 00       	call   8020fa <sys_close>
  8006b8:	e9 1b 01 00 00       	jmp    8007d8 <syscall+0x241>
        case 13:return sys_read(b,c,d);
  8006bd:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8006c0:	48 98                	cdqe   
  8006c2:	48 89 c1             	mov    rcx,rax
  8006c5:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006c8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006cb:	48 89 ce             	mov    rsi,rcx
  8006ce:	89 c7                	mov    edi,eax
  8006d0:	e8 3b 1b 00 00       	call   802210 <sys_read>
  8006d5:	e9 fe 00 00 00       	jmp    8007d8 <syscall+0x241>
        case 14:return sys_write(b,c,d);
  8006da:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8006dd:	48 98                	cdqe   
  8006df:	48 89 c1             	mov    rcx,rax
  8006e2:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006e5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006e8:	48 89 ce             	mov    rsi,rcx
  8006eb:	89 c7                	mov    edi,eax
  8006ed:	e8 8d 1a 00 00       	call   80217f <sys_write>
  8006f2:	e9 e1 00 00 00       	jmp    8007d8 <syscall+0x241>
        case 15:return sys_seek(b,c,d);
  8006f7:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006fa:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8006fd:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800700:	89 ce                	mov    esi,ecx
  800702:	89 c7                	mov    edi,eax
  800704:	e8 98 1b 00 00       	call   8022a1 <sys_seek>
  800709:	e9 ca 00 00 00       	jmp    8007d8 <syscall+0x241>
        case 16:return sys_tell(b);
  80070e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800711:	89 c7                	mov    edi,eax
  800713:	e8 d0 1b 00 00       	call   8022e8 <sys_tell>
  800718:	e9 bb 00 00 00       	jmp    8007d8 <syscall+0x241>
        case 17:return reg_vol(b,c,d);
  80071d:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  800720:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  800723:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800726:	89 ce                	mov    esi,ecx
  800728:	89 c7                	mov    edi,eax
  80072a:	b8 00 00 00 00       	mov    eax,0x0
  80072f:	e8 f2 13 00 00       	call   801b26 <reg_vol>
  800734:	e9 9f 00 00 00       	jmp    8007d8 <syscall+0x241>
        case 18:return free_vol(b);
  800739:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80073c:	89 c7                	mov    edi,eax
  80073e:	b8 00 00 00 00       	mov    eax,0x0
  800743:	e8 c2 13 00 00       	call   801b0a <free_vol>
  800748:	e9 8b 00 00 00       	jmp    8007d8 <syscall+0x241>
        case 19:return execute(b);
  80074d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800750:	48 98                	cdqe   
  800752:	48 89 c7             	mov    rdi,rax
  800755:	e8 99 49 00 00       	call   8050f3 <execute>
  80075a:	eb 7c                	jmp    8007d8 <syscall+0x241>
        case SYSCALL_EXIT:return sys_exit(b);
  80075c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80075f:	89 c7                	mov    edi,eax
  800761:	e8 6f 40 00 00       	call   8047d5 <sys_exit>
  800766:	eb 70                	jmp    8007d8 <syscall+0x241>
        case SYSCALL_CALL:return exec_call(b);
  800768:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80076b:	48 98                	cdqe   
  80076d:	48 89 c7             	mov    rdi,rax
  800770:	e8 79 4a 00 00       	call   8051ee <exec_call>
  800775:	eb 61                	jmp    8007d8 <syscall+0x241>
        case SYSCALL_MKFIFO:return sys_mkfifo(b);
  800777:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80077a:	89 c7                	mov    edi,eax
  80077c:	e8 2a 12 00 00       	call   8019ab <sys_mkfifo>
  800781:	eb 55                	jmp    8007d8 <syscall+0x241>
        case SYSCALL_MALLOC:return sys_malloc(b);
  800783:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800786:	89 c7                	mov    edi,eax
  800788:	e8 04 42 00 00       	call   804991 <sys_malloc>
  80078d:	eb 49                	jmp    8007d8 <syscall+0x241>
        case SYSCALL_FREE:return sys_free(b);
  80078f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800792:	89 c7                	mov    edi,eax
  800794:	e8 9f 43 00 00       	call   804b38 <sys_free>
  800799:	eb 3d                	jmp    8007d8 <syscall+0x241>
        case SYSCALL_KB_READC:return sys_getkbc();
  80079b:	b8 00 00 00 00       	mov    eax,0x0
  8007a0:	e8 59 60 00 00       	call   8067fe <sys_getkbc>
  8007a5:	0f be c0             	movsx  eax,al
  8007a8:	eb 2e                	jmp    8007d8 <syscall+0x241>
        case SYSCALL_FIND_DEV:return sys_find_dev(b);
  8007aa:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8007ad:	48 98                	cdqe   
  8007af:	48 89 c7             	mov    rdi,rax
  8007b2:	e8 0e 27 00 00       	call   802ec5 <sys_find_dev>
  8007b7:	eb 1f                	jmp    8007d8 <syscall+0x241>
        case SYSCALL_OPERATE_DEV:return sys_operate_dev(b,c,d);
  8007b9:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8007bc:	48 98                	cdqe   
  8007be:	48 89 c2             	mov    rdx,rax
  8007c1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8007c4:	48 98                	cdqe   
  8007c6:	48 89 c1             	mov    rcx,rax
  8007c9:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8007cc:	89 c6                	mov    esi,eax
  8007ce:	48 89 cf             	mov    rdi,rcx
  8007d1:	e8 81 27 00 00       	call   802f57 <sys_operate_dev>
  8007d6:	eb 00                	jmp    8007d8 <syscall+0x241>
    }
    // __asm__ volatile("mov %0,%%eax\r\n mov %1,%%ebx\r\n mov %2,%%ecx\r\n mov %3,%%edx\r\n mov %4,%%esi\r\n mov %5,%%edi"\
    // ::"m"(func),"m"(a),"m"(b),"m"(c),"m"(d),"m"(e));
    // __asm__ volatile("int $0x80\r\n leave\r\n ret");
}
  8007d8:	c9                   	leave  
  8007d9:	c3                   	ret    

00000000008007da <wrmsr>:
void wrmsr(unsigned long address,unsigned long value)
{
  8007da:	f3 0f 1e fa          	endbr64 
  8007de:	55                   	push   rbp
  8007df:	48 89 e5             	mov    rbp,rsp
  8007e2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8007e6:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    __asm__ __volatile__	("wrmsr	\n\t"::"d"(value >> 32),"a"(value & 0xffffffff),"c"(address):"memory");
  8007ea:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8007ee:	48 c1 e8 20          	shr    rax,0x20
  8007f2:	48 89 c2             	mov    rdx,rax
  8007f5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8007f9:	89 c0                	mov    eax,eax
  8007fb:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  8007ff:	0f 30                	wrmsr  
  800801:	90                   	nop
  800802:	5d                   	pop    rbp
  800803:	c3                   	ret    

0000000000800804 <main>:
#include <kb.h>
#include "com.h"

int manage_proc_lock=1;
void main(unsigned int magic,void* addr)
{
  800804:	f3 0f 1e fa          	endbr64 
  800808:	55                   	push   rbp
  800809:	48 89 e5             	mov    rbp,rsp
  80080c:	48 83 ec 60          	sub    rsp,0x60
  800810:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  800813:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi

    struct multiboot_header* mbi=0ul;
  800817:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80081e:	00 
    mbi=(struct multiboot_header*)addr;
  80081f:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  800823:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    init_logging();
  800827:	b8 00 00 00 00       	mov    eax,0x0
  80082c:	e8 72 03 00 00       	call   800ba3 <init_logging>
    }
    //获取tags
    struct multiboot_tag *tag;

	unsigned size;
    size = *(unsigned long*)addr;
  800831:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  800835:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800838:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
//    //printf("Announced mbi size 0x%x\n", size);
	for (tag = (struct multiboot_tag *)(addr + 8);
  80083b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80083f:	48 83 c0 08          	add    rax,0x8
  800843:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  800847:	e9 5b 02 00 00       	jmp    800aa7 <main+0x2a3>
		 tag->type != MULTIBOOT_TAG_TYPE_END;
		 tag = (struct multiboot_tag *)((u8 *)tag + ((tag->size + 7) & ~7)))
	{
		//printf("Tag 0x%x, Size 0x%x\n", tag->type, tag->size);
		switch (tag->type)
  80084c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800850:	8b 00                	mov    eax,DWORD PTR [rax]
  800852:	83 f8 08             	cmp    eax,0x8
  800855:	0f 87 39 02 00 00    	ja     800a94 <main+0x290>
  80085b:	89 c0                	mov    eax,eax
  80085d:	48 8b 04 c5 28 29 81 	mov    rax,QWORD PTR [rax*8+0x812928]
  800864:	00 
  800865:	3e ff e0             	notrack jmp rax
			break;
		case MULTIBOOT_TAG_TYPE_BASIC_MEMINFO:
			//printf("mem_lower = %uKB, mem_upper = %uKB\n",
//				   ((struct multiboot_tag_basic_meminfo *)tag)->mem_lower,
//				   ((struct multiboot_tag_basic_meminfo *)tag)->mem_upper);
			set_high_mem_base(((struct multiboot_tag_basic_meminfo *)tag)->mem_lower);
  800868:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80086c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80086f:	89 c7                	mov    edi,eax
  800871:	e8 0b 08 00 00       	call   801081 <set_high_mem_base>
			break;
  800876:	e9 19 02 00 00       	jmp    800a94 <main+0x290>

			break;
		case MULTIBOOT_TAG_TYPE_MMAP:
		{
			//printf("mmap\n");
            for (multiboot_memory_map_t * mmap = ((struct multiboot_tag_mmap *)tag)->entries;
  80087b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80087f:	48 83 c0 10          	add    rax,0x10
  800883:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  800887:	eb 37                	jmp    8008c0 <main+0xbc>
                    (multiboot_uint8_t *)mmap < (multiboot_uint8_t *)tag + tag->size;
                    mmap = (multiboot_memory_map_t *)((unsigned long)mmap + ((struct multiboot_tag_mmap *)tag)->entry_size))
            {
                set_mem_area(mmap->addr,mmap->len,mmap->type);
  800889:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80088d:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  800890:	89 c2                	mov    edx,eax
  800892:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800896:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  80089a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80089e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8008a1:	48 89 ce             	mov    rsi,rcx
  8008a4:	48 89 c7             	mov    rdi,rax
  8008a7:	e8 ec 07 00 00       	call   801098 <set_mem_area>
                    mmap = (multiboot_memory_map_t *)((unsigned long)mmap + ((struct multiboot_tag_mmap *)tag)->entry_size))
  8008ac:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008b0:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8008b3:	89 c2                	mov    edx,eax
  8008b5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8008b9:	48 01 d0             	add    rax,rdx
  8008bc:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
                    (multiboot_uint8_t *)mmap < (multiboot_uint8_t *)tag + tag->size;
  8008c0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008c4:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8008c7:	89 c2                	mov    edx,eax
  8008c9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008cd:	48 01 d0             	add    rax,rdx
  8008d0:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  8008d4:	72 b3                	jb     800889 <main+0x85>
            }

		}
		break;
  8008d6:	e9 b9 01 00 00       	jmp    800a94 <main+0x290>
		case MULTIBOOT_TAG_TYPE_FRAMEBUFFER:
		{
			multiboot_uint32_t color;
			unsigned i;
			struct multiboot_tag_framebuffer *tagfb = (struct multiboot_tag_framebuffer *)tag;
  8008db:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008df:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
			void *fb = (void *) FRAMEBUFFER_ADDR;
  8008e3:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x40000000
  8008ea:	40 
			set_framebuffer(*tagfb);
  8008eb:	48 83 ec 08          	sub    rsp,0x8
  8008ef:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8008f3:	ff 70 20             	push   QWORD PTR [rax+0x20]
  8008f6:	ff 70 18             	push   QWORD PTR [rax+0x18]
  8008f9:	ff 70 10             	push   QWORD PTR [rax+0x10]
  8008fc:	ff 70 08             	push   QWORD PTR [rax+0x8]
  8008ff:	ff 30                	push   QWORD PTR [rax]
  800901:	e8 a4 53 00 00       	call   805caa <set_framebuffer>
  800906:	48 83 c4 30          	add    rsp,0x30

            init_framebuffer();
  80090a:	b8 00 00 00 00       	mov    eax,0x0
  80090f:	e8 e1 51 00 00       	call   805af5 <init_framebuffer>
			switch (tagfb->common.framebuffer_type)
  800914:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800918:	0f b6 40 1d          	movzx  eax,BYTE PTR [rax+0x1d]
  80091c:	0f b6 c0             	movzx  eax,al
  80091f:	83 f8 02             	cmp    eax,0x2
  800922:	0f 84 5a 01 00 00    	je     800a82 <main+0x27e>
  800928:	83 f8 02             	cmp    eax,0x2
  80092b:	0f 8f 5a 01 00 00    	jg     800a8b <main+0x287>
  800931:	85 c0                	test   eax,eax
  800933:	74 0e                	je     800943 <main+0x13f>
  800935:	83 f8 01             	cmp    eax,0x1
  800938:	0f 84 15 01 00 00    	je     800a53 <main+0x24f>
  80093e:	e9 48 01 00 00       	jmp    800a8b <main+0x287>
			case MULTIBOOT_FRAMEBUFFER_TYPE_INDEXED:
			{
				unsigned best_distance, distance;
				struct multiboot_color *palette;

				palette = tagfb->framebuffer_palette;
  800943:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800947:	48 83 c0 22          	add    rax,0x22
  80094b:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

				color = 0;
  80094f:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
				best_distance = 4 * 256 * 256;
  800956:	c7 45 e8 00 00 04 00 	mov    DWORD PTR [rbp-0x18],0x40000

				for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
  80095d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  800964:	e9 d4 00 00 00       	jmp    800a3d <main+0x239>
				{
					distance = (0xff - palette[i].blue) * (0xff - palette[i].blue) + palette[i].red * palette[i].red + palette[i].green * palette[i].green;
  800969:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80096c:	48 89 d0             	mov    rax,rdx
  80096f:	48 01 c0             	add    rax,rax
  800972:	48 01 c2             	add    rdx,rax
  800975:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800979:	48 01 d0             	add    rax,rdx
  80097c:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  800980:	0f b6 c0             	movzx  eax,al
  800983:	ba ff 00 00 00       	mov    edx,0xff
  800988:	89 d1                	mov    ecx,edx
  80098a:	29 c1                	sub    ecx,eax
  80098c:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80098f:	48 89 d0             	mov    rax,rdx
  800992:	48 01 c0             	add    rax,rax
  800995:	48 01 c2             	add    rdx,rax
  800998:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80099c:	48 01 d0             	add    rax,rdx
  80099f:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  8009a3:	0f b6 d0             	movzx  edx,al
  8009a6:	b8 ff 00 00 00       	mov    eax,0xff
  8009ab:	29 d0                	sub    eax,edx
  8009ad:	89 ce                	mov    esi,ecx
  8009af:	0f af f0             	imul   esi,eax
  8009b2:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009b5:	48 89 d0             	mov    rax,rdx
  8009b8:	48 01 c0             	add    rax,rax
  8009bb:	48 01 c2             	add    rdx,rax
  8009be:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009c2:	48 01 d0             	add    rax,rdx
  8009c5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8009c8:	0f b6 c8             	movzx  ecx,al
  8009cb:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009ce:	48 89 d0             	mov    rax,rdx
  8009d1:	48 01 c0             	add    rax,rax
  8009d4:	48 01 c2             	add    rdx,rax
  8009d7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009db:	48 01 d0             	add    rax,rdx
  8009de:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8009e1:	0f b6 c0             	movzx  eax,al
  8009e4:	0f af c1             	imul   eax,ecx
  8009e7:	01 c6                	add    esi,eax
  8009e9:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009ec:	48 89 d0             	mov    rax,rdx
  8009ef:	48 01 c0             	add    rax,rax
  8009f2:	48 01 c2             	add    rdx,rax
  8009f5:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009f9:	48 01 d0             	add    rax,rdx
  8009fc:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  800a00:	0f b6 c8             	movzx  ecx,al
  800a03:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800a06:	48 89 d0             	mov    rax,rdx
  800a09:	48 01 c0             	add    rax,rax
  800a0c:	48 01 c2             	add    rdx,rax
  800a0f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800a13:	48 01 d0             	add    rax,rdx
  800a16:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  800a1a:	0f b6 c0             	movzx  eax,al
  800a1d:	0f af c1             	imul   eax,ecx
  800a20:	01 f0                	add    eax,esi
  800a22:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
					if (distance < best_distance)
  800a25:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  800a28:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  800a2b:	73 0c                	jae    800a39 <main+0x235>
					{
						color = i;
  800a2d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800a30:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
						best_distance = distance;
  800a33:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  800a36:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
				for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
  800a39:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  800a3d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800a41:	0f b7 40 20          	movzx  eax,WORD PTR [rax+0x20]
  800a45:	0f b7 c0             	movzx  eax,ax
  800a48:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  800a4b:	0f 82 18 ff ff ff    	jb     800969 <main+0x165>
					}
				}
			}
			break;
  800a51:	eb 40                	jmp    800a93 <main+0x28f>

			case MULTIBOOT_FRAMEBUFFER_TYPE_RGB:
				color = ((1 << tagfb->framebuffer_blue_mask_size) - 1) << tagfb->framebuffer_blue_field_position;
  800a53:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800a57:	0f b6 40 25          	movzx  eax,BYTE PTR [rax+0x25]
  800a5b:	0f b6 c0             	movzx  eax,al
  800a5e:	ba 01 00 00 00       	mov    edx,0x1
  800a63:	89 c1                	mov    ecx,eax
  800a65:	d3 e2                	shl    edx,cl
  800a67:	89 d0                	mov    eax,edx
  800a69:	8d 50 ff             	lea    edx,[rax-0x1]
  800a6c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800a70:	0f b6 40 24          	movzx  eax,BYTE PTR [rax+0x24]
  800a74:	0f b6 c0             	movzx  eax,al
  800a77:	89 c1                	mov    ecx,eax
  800a79:	d3 e2                	shl    edx,cl
  800a7b:	89 d0                	mov    eax,edx
  800a7d:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
				break;
  800a80:	eb 11                	jmp    800a93 <main+0x28f>

			case MULTIBOOT_FRAMEBUFFER_TYPE_EGA_TEXT:
				color = '\\' | 0x0100;
  800a82:	c7 45 c4 5c 01 00 00 	mov    DWORD PTR [rbp-0x3c],0x15c
				break;
  800a89:	eb 08                	jmp    800a93 <main+0x28f>

			default:
				color = 0xffffffff;
  800a8b:	c7 45 c4 ff ff ff ff 	mov    DWORD PTR [rbp-0x3c],0xffffffff
				break;
  800a92:	90                   	nop
			}

			break;
  800a93:	90                   	nop
		 tag = (struct multiboot_tag *)((u8 *)tag + ((tag->size + 7) & ~7)))
  800a94:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800a98:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800a9b:	83 c0 07             	add    eax,0x7
  800a9e:	89 c0                	mov    eax,eax
  800aa0:	83 e0 f8             	and    eax,0xfffffff8
  800aa3:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
		 tag->type != MULTIBOOT_TAG_TYPE_END;
  800aa7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800aab:	8b 00                	mov    eax,DWORD PTR [rax]
  800aad:	85 c0                	test   eax,eax
  800aaf:	0f 85 97 fd ff ff    	jne    80084c <main+0x48>
		}
		}
	}
	tag = (struct multiboot_tag *)((multiboot_uint8_t *)tag + ((tag->size + 7) & ~7));
  800ab5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800ab9:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800abc:	83 c0 07             	add    eax,0x7
  800abf:	89 c0                	mov    eax,eax
  800ac1:	83 e0 f8             	and    eax,0xfffffff8
  800ac4:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
	//printf("Total mbi size 0x%x\n", (unsigned)tag - addr);
	char disk_count=*(char*)0x475;
  800ac8:	b8 75 04 00 00       	mov    eax,0x475
  800acd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800ad0:	88 45 db             	mov    BYTE PTR [rbp-0x25],al
	//printf("disk count:%d\n",disk_count);
    init_font();
  800ad3:	b8 00 00 00 00       	mov    eax,0x0
  800ad8:	e8 d7 50 00 00       	call   805bb4 <init_font>
    //初始化区域
    //fill_rect(0,0,100,100,255);
    print("gamessis os loaded.\nkernel:>");
  800add:	bf e8 28 81 00       	mov    edi,0x8128e8
  800ae2:	e8 7f 55 00 00       	call   806066 <print>
    init_int();
  800ae7:	b8 00 00 00 00       	mov    eax,0x0
  800aec:	e8 0f f5 ff ff       	call   800000 <init_int>
    print("int loaded.\n");
  800af1:	bf 05 29 81 00       	mov    edi,0x812905
  800af6:	e8 6b 55 00 00       	call   806066 <print>
    set_tss(0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000);
  800afb:	68 00 00 40 00       	push   0x400000
  800b00:	68 00 00 40 00       	push   0x400000
  800b05:	68 00 00 40 00       	push   0x400000
  800b0a:	68 00 00 40 00       	push   0x400000
  800b0f:	41 b9 00 00 40 00    	mov    r9d,0x400000
  800b15:	41 b8 00 00 40 00    	mov    r8d,0x400000
  800b1b:	b9 00 00 40 00       	mov    ecx,0x400000
  800b20:	ba 00 00 40 00       	mov    edx,0x400000
  800b25:	be 00 00 40 00       	mov    esi,0x400000
  800b2a:	bf 00 00 40 00       	mov    edi,0x400000
  800b2f:	e8 1e 42 00 00       	call   804d52 <set_tss>
  800b34:	48 83 c4 20          	add    rsp,0x20
    init_memory();
  800b38:	b8 00 00 00 00       	mov    eax,0x0
  800b3d:	e8 0d 08 00 00       	call   80134f <init_memory>
    init_com(PORT_COM1);
  800b42:	bf f8 03 00 00       	mov    edi,0x3f8
  800b47:	e8 f8 97 00 00       	call   80a344 <init_com>
    com_puts("gamessis os loaded.",PORT_COM1);
  800b4c:	be f8 03 00 00       	mov    esi,0x3f8
  800b51:	bf 12 29 81 00       	mov    edi,0x812912
  800b56:	e8 35 99 00 00       	call   80a490 <com_puts>
	init_paging();
  800b5b:	b8 00 00 00 00       	mov    eax,0x0
  800b60:	e8 11 05 00 00       	call   801076 <init_paging>
 	init_gdt();
  800b65:	b8 00 00 00 00       	mov    eax,0x0
  800b6a:	e8 1f 43 00 00       	call   804e8e <init_gdt>
    init_drvdev_man();
  800b6f:	b8 00 00 00 00       	mov    eax,0x0
  800b74:	e8 fa 1e 00 00       	call   802a73 <init_drvdev_man>
    init_proc();
  800b79:	b8 00 00 00 00       	mov    eax,0x0
  800b7e:	e8 db 2d 00 00       	call   80395e <init_proc>
    //自带驱动
    //init_tty();
    init_kb();
  800b83:	b8 00 00 00 00       	mov    eax,0x0
  800b88:	e8 3e 5b 00 00       	call   8066cb <init_kb>
//    init_disk();

    DISK1_FAT32_FS_init();
  800b8d:	b8 00 00 00 00       	mov    eax,0x0
  800b92:	e8 13 8e 00 00       	call   8099aa <DISK1_FAT32_FS_init>

    manage_proc_lock=0;
  800b97:	c7 05 e7 a2 00 00 00 	mov    DWORD PTR [rip+0xa2e7],0x0        # 80ae88 <manage_proc_lock>
  800b9e:	00 00 00 

//    extern device *dev_tree[];
//    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
//    mount_fs("fat16",p->par,vmalloc());

    while (1);
  800ba1:	eb fe                	jmp    800ba1 <main+0x39d>

0000000000800ba3 <init_logging>:
static unsigned char* video;
static int xpos,ypos;
/* 将整数 D 转换为字符串并保存在 BUF 中。如果 BASE 为 'd'，则 D 为十进制，如果 BASE 为 'x'，则 D 为十六进制。 */

int init_logging()
{
  800ba3:	f3 0f 1e fa          	endbr64 
  800ba7:	55                   	push   rbp
  800ba8:	48 89 e5             	mov    rbp,rsp
    video=0xb8000;
  800bab:	48 c7 05 4a f4 bf ff 	mov    QWORD PTR [rip+0xffffffffffbff44a],0xb8000        # 400000 <video>
  800bb2:	00 80 0b 00 
    xpos=0;
  800bb6:	c7 05 48 f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff448],0x0        # 400008 <xpos>
  800bbd:	00 00 00 
    ypos=0;
  800bc0:	c7 05 42 f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff442],0x0        # 40000c <ypos>
  800bc7:	00 00 00 
}
  800bca:	90                   	nop
  800bcb:	5d                   	pop    rbp
  800bcc:	c3                   	ret    

0000000000800bcd <itoa>:

static void itoa (char *buf, int base, int d)
{
  800bcd:	f3 0f 1e fa          	endbr64 
  800bd1:	55                   	push   rbp
  800bd2:	48 89 e5             	mov    rbp,rsp
  800bd5:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  800bd9:	89 75 c4             	mov    DWORD PTR [rbp-0x3c],esi
  800bdc:	89 55 c0             	mov    DWORD PTR [rbp-0x40],edx
    char *p = buf;
  800bdf:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800be3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char *p1, *p2;
    unsigned long ud = d;
  800be7:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800bea:	48 98                	cdqe   
  800bec:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    int divisor = 10;
  800bf0:	c7 45 dc 0a 00 00 00 	mov    DWORD PTR [rbp-0x24],0xa
 
    /* 如果指定了 %d 并且 D 是负数，在开始添上负号。 */
    if (base == 'd' && d < 0)
  800bf7:	83 7d c4 64          	cmp    DWORD PTR [rbp-0x3c],0x64
  800bfb:	75 27                	jne    800c24 <itoa+0x57>
  800bfd:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
  800c01:	79 21                	jns    800c24 <itoa+0x57>
    {
        *p++ = '-';
  800c03:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c07:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800c0b:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800c0f:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
        buf++;
  800c12:	48 83 45 c8 01       	add    QWORD PTR [rbp-0x38],0x1
        ud = -d;
  800c17:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800c1a:	f7 d8                	neg    eax
  800c1c:	48 98                	cdqe   
  800c1e:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800c22:	eb 0d                	jmp    800c31 <itoa+0x64>
    }
    else if (base == 'x')
  800c24:	83 7d c4 78          	cmp    DWORD PTR [rbp-0x3c],0x78
  800c28:	75 07                	jne    800c31 <itoa+0x64>
        divisor = 16;
  800c2a:	c7 45 dc 10 00 00 00 	mov    DWORD PTR [rbp-0x24],0x10
 
    /* 用 DIVISOR 去除 UD 直到 UD == 0。 */
    do
    {
        int remainder = ud % divisor;
  800c31:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800c34:	48 63 c8             	movsxd rcx,eax
  800c37:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800c3b:	ba 00 00 00 00       	mov    edx,0x0
  800c40:	48 f7 f1             	div    rcx
  800c43:	48 89 d0             	mov    rax,rdx
  800c46:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
 
        *p++ = (remainder < 10) ? remainder + '0' : remainder + 'a' - 10;
  800c49:	83 7d d8 09          	cmp    DWORD PTR [rbp-0x28],0x9
  800c4d:	7f 0a                	jg     800c59 <itoa+0x8c>
  800c4f:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800c52:	83 c0 30             	add    eax,0x30
  800c55:	89 c1                	mov    ecx,eax
  800c57:	eb 08                	jmp    800c61 <itoa+0x94>
  800c59:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800c5c:	83 c0 57             	add    eax,0x57
  800c5f:	89 c1                	mov    ecx,eax
  800c61:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c65:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800c69:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800c6d:	88 08                	mov    BYTE PTR [rax],cl
    }
    while (ud /= divisor);
  800c6f:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800c72:	48 63 f0             	movsxd rsi,eax
  800c75:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800c79:	ba 00 00 00 00       	mov    edx,0x0
  800c7e:	48 f7 f6             	div    rsi
  800c81:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800c85:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  800c8a:	75 a5                	jne    800c31 <itoa+0x64>
 
    /* 在字符串尾添上终结符。 */
    *p = 0;
  800c8c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c90:	c6 00 00             	mov    BYTE PTR [rax],0x0
 
    /* 反转 BUF。 */
    p1 = buf;
  800c93:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800c97:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    p2 = p - 1;
  800c9b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c9f:	48 83 e8 01          	sub    rax,0x1
  800ca3:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    while (p1 < p2)
  800ca7:	eb 2b                	jmp    800cd4 <itoa+0x107>
    {
        char tmp = *p1;
  800ca9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800cad:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800cb0:	88 45 d7             	mov    BYTE PTR [rbp-0x29],al
        *p1 = *p2;
  800cb3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800cb7:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  800cba:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800cbe:	88 10                	mov    BYTE PTR [rax],dl
        *p2 = tmp;
  800cc0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800cc4:	0f b6 55 d7          	movzx  edx,BYTE PTR [rbp-0x29]
  800cc8:	88 10                	mov    BYTE PTR [rax],dl
        p1++;
  800cca:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        p2--;
  800ccf:	48 83 6d e8 01       	sub    QWORD PTR [rbp-0x18],0x1
    while (p1 < p2)
  800cd4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800cd8:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
  800cdc:	72 cb                	jb     800ca9 <itoa+0xdc>
    }
}
  800cde:	90                   	nop
  800cdf:	90                   	nop
  800ce0:	5d                   	pop    rbp
  800ce1:	c3                   	ret    

0000000000800ce2 <putchar>:
 
/* 在屏幕上输出字符 C 。 */
static void putchar (char c)
{
  800ce2:	f3 0f 1e fa          	endbr64 
  800ce6:	55                   	push   rbp
  800ce7:	48 89 e5             	mov    rbp,rsp
  800cea:	48 83 ec 20          	sub    rsp,0x20
  800cee:	89 f8                	mov    eax,edi
  800cf0:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    char s[2]={c,'\0'};
  800cf3:	0f b6 45 ec          	movzx  eax,BYTE PTR [rbp-0x14]
  800cf7:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
  800cfa:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
    print(s);
  800cfe:	48 8d 45 fe          	lea    rax,[rbp-0x2]
  800d02:	48 89 c7             	mov    rdi,rax
  800d05:	e8 5c 53 00 00       	call   806066 <print>
    *(video + (xpos + ypos * COLUMNS) * 2 + 1) = ATTRIBUTE;
 
    xpos++;
    if (xpos >= COLUMNS)
        goto newline;
}
  800d0a:	c9                   	leave  
  800d0b:	c3                   	ret    

0000000000800d0c <printf>:
 
/* 格式化字符串并在屏幕上输出，就像 libc 函数 printf 一样。 */
void printf (const char *format, ...)
{
  800d0c:	f3 0f 1e fa          	endbr64 
  800d10:	55                   	push   rbp
  800d11:	48 89 e5             	mov    rbp,rsp
  800d14:	48 81 ec f0 00 00 00 	sub    rsp,0xf0
  800d1b:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
  800d22:	48 89 b5 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rsi
  800d29:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  800d30:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  800d37:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  800d3e:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  800d45:	84 c0                	test   al,al
  800d47:	74 20                	je     800d69 <printf+0x5d>
  800d49:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  800d4d:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  800d51:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  800d55:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  800d59:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  800d5d:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  800d61:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  800d65:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7
    char **arg = (char **) &format;
  800d69:	48 8d 85 18 ff ff ff 	lea    rax,[rbp-0xe8]
  800d70:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char c;
    char buf[20];
 
    arg++;
  800d77:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x8
  800d7e:	08 
 
    while ((c = *format++) != 0)
  800d7f:	e9 29 01 00 00       	jmp    800ead <printf+0x1a1>
    {
        if (c != '%')
  800d84:	80 bd 3f ff ff ff 25 	cmp    BYTE PTR [rbp-0xc1],0x25
  800d8b:	74 13                	je     800da0 <printf+0x94>
            putchar (c);
  800d8d:	0f be 85 3f ff ff ff 	movsx  eax,BYTE PTR [rbp-0xc1]
  800d94:	89 c7                	mov    edi,eax
  800d96:	e8 47 ff ff ff       	call   800ce2 <putchar>
  800d9b:	e9 0d 01 00 00       	jmp    800ead <printf+0x1a1>
        else
        {
            char *p;
 
            c = *format++;
  800da0:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800da7:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800dab:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800db2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800db5:	88 85 3f ff ff ff    	mov    BYTE PTR [rbp-0xc1],al
            switch (c)
  800dbb:	0f be 85 3f ff ff ff 	movsx  eax,BYTE PTR [rbp-0xc1]
  800dc2:	83 f8 78             	cmp    eax,0x78
  800dc5:	74 26                	je     800ded <printf+0xe1>
  800dc7:	83 f8 78             	cmp    eax,0x78
  800dca:	0f 8f be 00 00 00    	jg     800e8e <printf+0x182>
  800dd0:	83 f8 75             	cmp    eax,0x75
  800dd3:	74 18                	je     800ded <printf+0xe1>
  800dd5:	83 f8 75             	cmp    eax,0x75
  800dd8:	0f 8f b0 00 00 00    	jg     800e8e <printf+0x182>
  800dde:	83 f8 64             	cmp    eax,0x64
  800de1:	74 0a                	je     800ded <printf+0xe1>
  800de3:	83 f8 73             	cmp    eax,0x73
  800de6:	74 41                	je     800e29 <printf+0x11d>
  800de8:	e9 a1 00 00 00       	jmp    800e8e <printf+0x182>
            {
            case 'd':
            case 'u':
            case 'x':
                itoa (buf, c, *((int *) arg++));
  800ded:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800df4:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800df8:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800dff:	8b 10                	mov    edx,DWORD PTR [rax]
  800e01:	0f be 8d 3f ff ff ff 	movsx  ecx,BYTE PTR [rbp-0xc1]
  800e08:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800e0f:	89 ce                	mov    esi,ecx
  800e11:	48 89 c7             	mov    rdi,rax
  800e14:	e8 b4 fd ff ff       	call   800bcd <itoa>
                p = buf;
  800e19:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800e20:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                goto string;
  800e27:	eb 34                	jmp    800e5d <printf+0x151>
                break;
 
            case 's':
                p = *arg++;
  800e29:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e30:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800e34:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800e3b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800e3e:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                if (! p)
  800e45:	48 83 bd 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],0x0
  800e4c:	00 
  800e4d:	75 0d                	jne    800e5c <printf+0x150>
                    p = "(null)";
  800e4f:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x812970
  800e56:	70 29 81 00 
  800e5a:	eb 22                	jmp    800e7e <printf+0x172>
 
string:
  800e5c:	90                   	nop
                while (*p)
  800e5d:	eb 1f                	jmp    800e7e <printf+0x172>
                    putchar (*p++);
  800e5f:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800e66:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800e6a:	48 89 95 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rdx
  800e71:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800e74:	0f be c0             	movsx  eax,al
  800e77:	89 c7                	mov    edi,eax
  800e79:	e8 64 fe ff ff       	call   800ce2 <putchar>
                while (*p)
  800e7e:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800e85:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800e88:	84 c0                	test   al,al
  800e8a:	75 d3                	jne    800e5f <printf+0x153>
                break;
  800e8c:	eb 1f                	jmp    800ead <printf+0x1a1>
 
            default:
                putchar (*((int *) arg++));
  800e8e:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e95:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800e99:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800ea0:	8b 00                	mov    eax,DWORD PTR [rax]
  800ea2:	0f be c0             	movsx  eax,al
  800ea5:	89 c7                	mov    edi,eax
  800ea7:	e8 36 fe ff ff       	call   800ce2 <putchar>
                break;
  800eac:	90                   	nop
    while ((c = *format++) != 0)
  800ead:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800eb4:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800eb8:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800ebf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800ec2:	88 85 3f ff ff ff    	mov    BYTE PTR [rbp-0xc1],al
  800ec8:	80 bd 3f ff ff ff 00 	cmp    BYTE PTR [rbp-0xc1],0x0
  800ecf:	0f 85 af fe ff ff    	jne    800d84 <printf+0x78>
            }
        }
    }
}
  800ed5:	90                   	nop
  800ed6:	90                   	nop
  800ed7:	c9                   	leave  
  800ed8:	c3                   	ret    

0000000000800ed9 <mmap>:
//以kb为单位
int high_mem_base=1024;
int mmap_t_i=0;

stat_t mmap(addr_t pa,addr_t la,u32 attr)
{
  800ed9:	f3 0f 1e fa          	endbr64 
  800edd:	55                   	push   rbp
  800ede:	48 89 e5             	mov    rbp,rsp
  800ee1:	48 83 ec 40          	sub    rsp,0x40
  800ee5:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  800ee9:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  800eed:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    page_item *pdptp= (page_item *) (pml4[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
  800ef0:	48 8b 15 a9 9f 00 00 	mov    rdx,QWORD PTR [rip+0x9fa9]        # 80aea0 <pml4>
  800ef7:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800efb:	48 c1 e8 27          	shr    rax,0x27
  800eff:	48 c1 e0 03          	shl    rax,0x3
  800f03:	48 01 d0             	add    rax,rdx
  800f06:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f09:	b0 00                	mov    al,0x0
  800f0b:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
  800f0f:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  800f16:	00 00 00 
  800f19:	48 23 45 d0          	and    rax,QWORD PTR [rbp-0x30]
  800f1d:	48 c1 e8 1e          	shr    rax,0x1e
  800f21:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
  800f24:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800f27:	48 98                	cdqe   
  800f29:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800f30:	00 
  800f31:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800f35:	48 01 d0             	add    rax,rdx
  800f38:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f3b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
  800f3f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f43:	83 e0 01             	and    eax,0x1
  800f46:	48 85 c0             	test   rax,rax
  800f49:	75 45                	jne    800f90 <mmap+0xb7>
    {
        pdp=(page_item*)vmalloc();
  800f4b:	b8 00 00 00 00       	mov    eax,0x0
  800f50:	e8 cf 01 00 00       	call   801124 <vmalloc>
  800f55:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        memset(pdp,0,4096);
  800f59:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f5d:	ba 00 10 00 00       	mov    edx,0x1000
  800f62:	be 00 00 00 00       	mov    esi,0x0
  800f67:	48 89 c7             	mov    rdi,rax
  800f6a:	e8 11 96 00 00       	call   80a580 <memset>
        pdptp[pdpti]=(addr_t)pdp|attr;
  800f6f:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800f72:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  800f76:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800f79:	48 98                	cdqe   
  800f7b:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800f82:	00 
  800f83:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800f87:	48 01 f0             	add    rax,rsi
  800f8a:	48 09 ca             	or     rdx,rcx
  800f8d:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pdp=(page_item*)((addr_t)pdp&~0xff);
  800f90:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f94:	b0 00                	mov    al,0x0
  800f96:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
  800f9a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800f9e:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800fa3:	48 c1 e8 15          	shr    rax,0x15
  800fa7:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800fae:	00 
  800faf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800fb3:	48 01 d0             	add    rax,rdx
  800fb6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800fb9:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!((unsigned long long)pt & PAGE_PRESENT))
  800fbd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800fc1:	83 e0 01             	and    eax,0x1
  800fc4:	48 85 c0             	test   rax,rax
  800fc7:	75 4d                	jne    801016 <mmap+0x13d>
    {
        pt=(page_item*)vmalloc();
  800fc9:	b8 00 00 00 00       	mov    eax,0x0
  800fce:	e8 51 01 00 00       	call   801124 <vmalloc>
  800fd3:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        memset(pt,0,4096);
  800fd7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800fdb:	ba 00 10 00 00       	mov    edx,0x1000
  800fe0:	be 00 00 00 00       	mov    esi,0x0
  800fe5:	48 89 c7             	mov    rdi,rax
  800fe8:	e8 93 95 00 00       	call   80a580 <memset>
        pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
  800fed:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800ff0:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800ff4:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800ff8:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800ffd:	48 c1 e8 15          	shr    rax,0x15
  801001:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  801008:	00 
  801009:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80100d:	48 01 f0             	add    rax,rsi
  801010:	48 09 ca             	or     rdx,rcx
  801013:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pt=(page_item*)((addr_t)pt & ~0xff);
  801016:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80101a:	b0 00                	mov    al,0x0
  80101c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
  801020:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  801023:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  801027:	81 e2 ff ff 1f 00    	and    edx,0x1fffff
  80102d:	48 c1 ea 0c          	shr    rdx,0xc
  801031:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
  801038:	00 
  801039:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80103d:	48 01 ca             	add    rdx,rcx
  801040:	48 0b 45 d8          	or     rax,QWORD PTR [rbp-0x28]
  801044:	48 89 02             	mov    QWORD PTR [rdx],rax
    return NORMAL;
  801047:	b8 00 00 00 00       	mov    eax,0x0
}
  80104c:	c9                   	leave  
  80104d:	c3                   	ret    

000000000080104e <mdemap>:

stat_t mdemap(addr_t la)
{
  80104e:	f3 0f 1e fa          	endbr64 
  801052:	55                   	push   rbp
  801053:	48 89 e5             	mov    rbp,rsp
  801056:	48 83 ec 10          	sub    rsp,0x10
  80105a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return mmap(0l,la,0);
  80105e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801062:	ba 00 00 00 00       	mov    edx,0x0
  801067:	48 89 c6             	mov    rsi,rax
  80106a:	bf 00 00 00 00       	mov    edi,0x0
  80106f:	e8 65 fe ff ff       	call   800ed9 <mmap>
}
  801074:	c9                   	leave  
  801075:	c3                   	ret    

0000000000801076 <init_paging>:
int init_paging()
{
  801076:	f3 0f 1e fa          	endbr64 
  80107a:	55                   	push   rbp
  80107b:	48 89 e5             	mov    rbp,rsp
    //设置第一项pdpte，也就是内核空间
//    set_1gb_pdpt(pdpt,0,PAGE_RWX);//设置PDPT0x40000000ul
//    set_page_item(pdpt+1,PD_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);

    #endif
}
  80107e:	90                   	nop
  80107f:	5d                   	pop    rbp
  801080:	c3                   	ret    

0000000000801081 <set_high_mem_base>:
void set_high_mem_base(int base)
{
  801081:	f3 0f 1e fa          	endbr64 
  801085:	55                   	push   rbp
  801086:	48 89 e5             	mov    rbp,rsp
  801089:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    high_mem_base=base;
  80108c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80108f:	89 05 23 9e 00 00    	mov    DWORD PTR [rip+0x9e23],eax        # 80aeb8 <high_mem_base>
}
  801095:	90                   	nop
  801096:	5d                   	pop    rbp
  801097:	c3                   	ret    

0000000000801098 <set_mem_area>:
void set_mem_area(unsigned long base, unsigned long len, unsigned long type)
{
  801098:	f3 0f 1e fa          	endbr64 
  80109c:	55                   	push   rbp
  80109d:	48 89 e5             	mov    rbp,rsp
  8010a0:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8010a4:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8010a8:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
    mmap_struct[mmap_t_i].base=base;
  8010ac:	8b 05 6e f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff16e]        # 400220 <mmap_t_i>
  8010b2:	48 63 d0             	movsxd rdx,eax
  8010b5:	48 89 d0             	mov    rax,rdx
  8010b8:	48 01 c0             	add    rax,rax
  8010bb:	48 01 d0             	add    rax,rdx
  8010be:	48 c1 e0 03          	shl    rax,0x3
  8010c2:	48 8d 90 40 00 40 00 	lea    rdx,[rax+0x400040]
  8010c9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8010cd:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i].len=len;
  8010d0:	8b 05 4a f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff14a]        # 400220 <mmap_t_i>
  8010d6:	48 63 d0             	movsxd rdx,eax
  8010d9:	48 89 d0             	mov    rax,rdx
  8010dc:	48 01 c0             	add    rax,rax
  8010df:	48 01 d0             	add    rax,rdx
  8010e2:	48 c1 e0 03          	shl    rax,0x3
  8010e6:	48 8d 90 48 00 40 00 	lea    rdx,[rax+0x400048]
  8010ed:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8010f1:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i++].type=type;
  8010f4:	8b 05 26 f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff126]        # 400220 <mmap_t_i>
  8010fa:	8d 50 01             	lea    edx,[rax+0x1]
  8010fd:	89 15 1d f1 bf ff    	mov    DWORD PTR [rip+0xffffffffffbff11d],edx        # 400220 <mmap_t_i>
  801103:	48 63 d0             	movsxd rdx,eax
  801106:	48 89 d0             	mov    rax,rdx
  801109:	48 01 c0             	add    rax,rax
  80110c:	48 01 d0             	add    rax,rdx
  80110f:	48 c1 e0 03          	shl    rax,0x3
  801113:	48 8d 90 50 00 40 00 	lea    rdx,[rax+0x400050]
  80111a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80111e:	48 89 02             	mov    QWORD PTR [rdx],rax
}
  801121:	90                   	nop
  801122:	5d                   	pop    rbp
  801123:	c3                   	ret    

0000000000801124 <vmalloc>:
addr_t vmalloc()
{
  801124:	f3 0f 1e fa          	endbr64 
  801128:	55                   	push   rbp
  801129:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<VMALLOC_PGN/32;i++)
  80112c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801133:	eb 76                	jmp    8011ab <vmalloc+0x87>
    {
        for(int j=0;j<32;j++)
  801135:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80113c:	eb 63                	jmp    8011a1 <vmalloc+0x7d>
        {
            if(!(vmalloc_map[i]&(1<<j)))
  80113e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801141:	48 98                	cdqe   
  801143:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  80114a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80114d:	be 01 00 00 00       	mov    esi,0x1
  801152:	89 c1                	mov    ecx,eax
  801154:	d3 e6                	shl    esi,cl
  801156:	89 f0                	mov    eax,esi
  801158:	21 d0                	and    eax,edx
  80115a:	85 c0                	test   eax,eax
  80115c:	75 3f                	jne    80119d <vmalloc+0x79>
            {
                vmalloc_map[i]|=(1<<j);
  80115e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801161:	48 98                	cdqe   
  801163:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  80116a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80116d:	be 01 00 00 00       	mov    esi,0x1
  801172:	89 c1                	mov    ecx,eax
  801174:	d3 e6                	shl    esi,cl
  801176:	89 f0                	mov    eax,esi
  801178:	09 c2                	or     edx,eax
  80117a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80117d:	48 98                	cdqe   
  80117f:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
                return VMALLOC_BASE+(i*32+j)*0x1000;
  801186:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801189:	c1 e0 05             	shl    eax,0x5
  80118c:	89 c2                	mov    edx,eax
  80118e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801191:	01 d0                	add    eax,edx
  801193:	83 c0 20             	add    eax,0x20
  801196:	c1 e0 0c             	shl    eax,0xc
  801199:	48 98                	cdqe   
  80119b:	eb 14                	jmp    8011b1 <vmalloc+0x8d>
        for(int j=0;j<32;j++)
  80119d:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8011a1:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  8011a5:	7e 97                	jle    80113e <vmalloc+0x1a>
    for(int i=0;i<VMALLOC_PGN/32;i++)
  8011a7:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8011ab:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  8011af:	7e 84                	jle    801135 <vmalloc+0x11>
            }
        }
    }
}
  8011b1:	5d                   	pop    rbp
  8011b2:	c3                   	ret    

00000000008011b3 <vmfree>:

int vmfree(addr_t ptr)
{
  8011b3:	f3 0f 1e fa          	endbr64 
  8011b7:	55                   	push   rbp
  8011b8:	48 89 e5             	mov    rbp,rsp
  8011bb:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=ptr/PAGE_SIZE;
  8011bf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8011c3:	48 c1 e8 0c          	shr    rax,0xc
  8011c7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  8011ca:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8011cd:	8d 50 1f             	lea    edx,[rax+0x1f]
  8011d0:	85 c0                	test   eax,eax
  8011d2:	0f 48 c2             	cmovs  eax,edx
  8011d5:	c1 f8 05             	sar    eax,0x5
  8011d8:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  8011db:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8011de:	99                   	cdq    
  8011df:	c1 ea 1b             	shr    edx,0x1b
  8011e2:	01 d0                	add    eax,edx
  8011e4:	83 e0 1f             	and    eax,0x1f
  8011e7:	29 d0                	sub    eax,edx
  8011e9:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    vmalloc_map[n]=vmalloc_map[n]&~(unsigned int)(1<<r);
  8011ec:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8011ef:	48 98                	cdqe   
  8011f1:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  8011f8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8011fb:	be 01 00 00 00       	mov    esi,0x1
  801200:	89 c1                	mov    ecx,eax
  801202:	d3 e6                	shl    esi,cl
  801204:	89 f0                	mov    eax,esi
  801206:	f7 d0                	not    eax
  801208:	21 c2                	and    edx,eax
  80120a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80120d:	48 98                	cdqe   
  80120f:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
}
  801216:	90                   	nop
  801217:	5d                   	pop    rbp
  801218:	c3                   	ret    

0000000000801219 <page_err>:
void page_err(){
  801219:	f3 0f 1e fa          	endbr64 
  80121d:	55                   	push   rbp
  80121e:	48 89 e5             	mov    rbp,rsp
  801221:	53                   	push   rbx
  801222:	48 83 ec 28          	sub    rsp,0x28
    asm("cli");
  801226:	fa                   	cli    
    print("page err\n");
  801227:	bf 78 29 81 00       	mov    edi,0x812978
  80122c:	e8 35 4e 00 00       	call   806066 <print>
    unsigned long err_code=0,l_addr=0;
  801231:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  801238:	00 
  801239:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  801240:	00 
    asm volatile("mov 0(%%rbp),%0":"=r"(err_code));
  801241:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
  801245:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    asm volatile("mov %%cr2,%0":"=r"(l_addr));//试图访问的地址
  801249:	0f 20 d0             	mov    rax,cr2
  80124c:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    int p=err_code&1;
  801250:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801254:	83 e0 01             	and    eax,0x1
  801257:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

    if(!p)
  80125a:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80125e:	75 27                	jne    801287 <page_err+0x6e>
        //accessing non-existent page
        //检查地址合法性
        if(l_addr>=MEM_END)
            ;
        //在进程的页表中申请新页
        mmap(vmalloc(),l_addr&~0xfff,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  801260:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801264:	48 25 00 f0 ff ff    	and    rax,0xfffffffffffff000
  80126a:	48 89 c3             	mov    rbx,rax
  80126d:	b8 00 00 00 00       	mov    eax,0x0
  801272:	e8 ad fe ff ff       	call   801124 <vmalloc>
  801277:	ba 07 00 00 00       	mov    edx,0x7
  80127c:	48 89 de             	mov    rsi,rbx
  80127f:	48 89 c7             	mov    rdi,rax
  801282:	e8 52 fc ff ff       	call   800ed9 <mmap>
    }
    else
    {
        //page level protection
    }
    p=err_code&2;
  801287:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80128b:	83 e0 02             	and    eax,0x2
  80128e:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("when writing\n");else //puts("when reading");
  801291:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801295:	74 0c                	je     8012a3 <page_err+0x8a>
  801297:	bf 82 29 81 00       	mov    edi,0x812982
  80129c:	e8 c5 4d 00 00       	call   806066 <print>
  8012a1:	eb 0a                	jmp    8012ad <page_err+0x94>
    p=err_code&4;
  8012a3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8012a7:	83 e0 04             	and    eax,0x4
  8012aa:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(!p)print("supervisor mode\n");else //puts("user mode");
  8012ad:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8012b1:	75 0c                	jne    8012bf <page_err+0xa6>
  8012b3:	bf 90 29 81 00       	mov    edi,0x812990
  8012b8:	e8 a9 4d 00 00       	call   806066 <print>
  8012bd:	eb 0a                	jmp    8012c9 <page_err+0xb0>
    p=err_code&16;
  8012bf:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8012c3:	83 e0 10             	and    eax,0x10
  8012c6:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("an instruction tries to fetch\n");
  8012c9:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8012cd:	74 0a                	je     8012d9 <page_err+0xc0>
  8012cf:	bf a8 29 81 00       	mov    edi,0x8129a8
  8012d4:	e8 8d 4d 00 00       	call   806066 <print>
    unsigned int addr=0;
  8012d9:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
    asm volatile("mov 8(%%ebp),%0":"=r"(addr));
  8012e0:	67 8b 45 08          	mov    eax,DWORD PTR [ebp+0x8]
  8012e4:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    printf("occurred at %x(paddr), %x(laddr)\n",addr,l_addr);
  8012e7:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8012eb:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8012ee:	89 c6                	mov    esi,eax
  8012f0:	bf c8 29 81 00       	mov    edi,0x8129c8
  8012f5:	b8 00 00 00 00       	mov    eax,0x0
  8012fa:	e8 0d fa ff ff       	call   800d0c <printf>
    extern int cur_proc;
    extern struct process *task;
    if(task[cur_proc].pid==1)//系统进程
  8012ff:	48 8b 0d 9a 71 c0 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc0719a]        # 4084a0 <task>
  801306:	8b 05 00 32 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc13200]        # 41450c <cur_proc>
  80130c:	48 63 d0             	movsxd rdx,eax
  80130f:	48 89 d0             	mov    rax,rdx
  801312:	48 01 c0             	add    rax,rax
  801315:	48 01 d0             	add    rax,rdx
  801318:	48 c1 e0 08          	shl    rax,0x8
  80131c:	48 01 c8             	add    rax,rcx
  80131f:	8b 00                	mov    eax,DWORD PTR [rax]
  801321:	83 f8 01             	cmp    eax,0x1
  801324:	75 11                	jne    801337 <page_err+0x11e>
    {
        printf("sys died. please reboot.\n");
  801326:	bf ea 29 81 00       	mov    edi,0x8129ea
  80132b:	b8 00 00 00 00       	mov    eax,0x0
  801330:	e8 d7 f9 ff ff       	call   800d0c <printf>
        asm volatile("jmp .");
  801335:	eb fe                	jmp    801335 <page_err+0x11c>
    }
    //杀死问题进程
//    del_proc(cur_proc);
    // printf("killed the problem process.\n");
    // printf("shell:>");
    eoi();
  801337:	b8 00 00 00 00       	mov    eax,0x0
  80133c:	e8 fd 3a 00 00       	call   804e3e <eoi>
    //这里对esp的加法是必要的，因为page fault多push了一个错误码，但是iret识别不了
    __asm__ volatile ("sti \r\n leave\r\n add $8,%esp \r\n iretq");
  801341:	fb                   	sti    
  801342:	c9                   	leave  
  801343:	83 c4 08             	add    esp,0x8
  801346:	48 cf                	iretq  
}
  801348:	90                   	nop
  801349:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80134d:	c9                   	leave  
  80134e:	c3                   	ret    

000000000080134f <init_memory>:
void init_memory()
{
  80134f:	f3 0f 1e fa          	endbr64 
  801353:	55                   	push   rbp
  801354:	48 89 e5             	mov    rbp,rsp
    extern addr_t _knl_end,_knl_start;//lds中声明的内核的结尾地址，放置位图
    //获取内存大小
    size_t mem_size=mmap_struct[mmap_t_i-1].base+mmap_struct[mmap_t_i-1].len;
  801357:	8b 05 c3 ee bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfeec3]        # 400220 <mmap_t_i>
  80135d:	83 e8 01             	sub    eax,0x1
  801360:	48 63 d0             	movsxd rdx,eax
  801363:	48 89 d0             	mov    rax,rdx
  801366:	48 01 c0             	add    rax,rax
  801369:	48 01 d0             	add    rax,rdx
  80136c:	48 c1 e0 03          	shl    rax,0x3
  801370:	48 05 40 00 40 00    	add    rax,0x400040
  801376:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  801379:	8b 05 a1 ee bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfeea1]        # 400220 <mmap_t_i>
  80137f:	83 e8 01             	sub    eax,0x1
  801382:	48 63 d0             	movsxd rdx,eax
  801385:	48 89 d0             	mov    rax,rdx
  801388:	48 01 c0             	add    rax,rax
  80138b:	48 01 d0             	add    rax,rdx
  80138e:	48 c1 e0 03          	shl    rax,0x3
  801392:	48 05 48 00 40 00    	add    rax,0x400048
  801398:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80139b:	48 01 c8             	add    rax,rcx
  80139e:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    //计算出所需内存页数量
    int pgc=mem_size/PAGE_SIZE;
  8013a2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8013a6:	48 c1 e8 0c          	shr    rax,0xc
  8013aa:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    //计算出位图所需的字节数
    int pg_bytes=pgc/32;
  8013ad:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8013b0:	8d 50 1f             	lea    edx,[rax+0x1f]
  8013b3:	85 c0                	test   eax,eax
  8013b5:	0f 48 c2             	cmovs  eax,edx
  8013b8:	c1 f8 05             	sar    eax,0x5
  8013bb:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    page_map=(unsigned int*)PAGE_4K_ALIGN(0xc00000);
  8013be:	48 c7 05 57 ec bf ff 	mov    QWORD PTR [rip+0xffffffffffbfec57],0xc00000        # 400020 <page_map>
  8013c5:	00 00 c0 00 
    int* p=page_map;
  8013c9:	48 8b 05 50 ec bf ff 	mov    rax,QWORD PTR [rip+0xffffffffffbfec50]        # 400020 <page_map>
  8013d0:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    addr_t curp=0;
  8013d4:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  8013db:	00 
    for(int i=0;i<mmap_t_i;i++){
  8013dc:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8013e3:	e9 91 00 00 00       	jmp    801479 <init_memory+0x12a>
        int cont=0;
  8013e8:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
        if(mmap_struct[i].type!=MULTIBOOT_MEMORY_AVAILABLE)
  8013ef:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8013f2:	48 63 d0             	movsxd rdx,eax
  8013f5:	48 89 d0             	mov    rax,rdx
  8013f8:	48 01 c0             	add    rax,rax
  8013fb:	48 01 d0             	add    rax,rdx
  8013fe:	48 c1 e0 03          	shl    rax,0x3
  801402:	48 05 50 00 40 00    	add    rax,0x400050
  801408:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80140b:	48 83 f8 01          	cmp    rax,0x1
  80140f:	74 07                	je     801418 <init_memory+0xc9>
            cont=-1;
  801411:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [rbp-0x10],0xffffffff
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  801418:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80141f:	eb 15                	jmp    801436 <init_memory+0xe7>
            *(p++)=cont;
  801421:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801425:	48 8d 50 04          	lea    rdx,[rax+0x4]
  801429:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80142d:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  801430:	89 10                	mov    DWORD PTR [rax],edx
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  801432:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801436:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801439:	48 63 c8             	movsxd rcx,eax
  80143c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80143f:	48 63 d0             	movsxd rdx,eax
  801442:	48 89 d0             	mov    rax,rdx
  801445:	48 01 c0             	add    rax,rax
  801448:	48 01 d0             	add    rax,rdx
  80144b:	48 c1 e0 03          	shl    rax,0x3
  80144f:	48 05 48 00 40 00    	add    rax,0x400048
  801455:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801458:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  80145f:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  801466:	ff 00 00 
  801469:	48 21 d0             	and    rax,rdx
  80146c:	48 c1 e8 11          	shr    rax,0x11
  801470:	48 39 c1             	cmp    rcx,rax
  801473:	72 ac                	jb     801421 <init_memory+0xd2>
    for(int i=0;i<mmap_t_i;i++){
  801475:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  801479:	8b 05 a1 ed bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfeda1]        # 400220 <mmap_t_i>
  80147f:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  801482:	0f 8c 60 ff ff ff    	jl     8013e8 <init_memory+0x99>
        }
    }

    //低16M空间直接被内核占用
    for(int i=0;i<128;i++){
  801488:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  80148f:	eb 1d                	jmp    8014ae <init_memory+0x15f>
        page_map[i]=0xffffffff;
  801491:	48 8b 15 88 eb bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfeb88]        # 400020 <page_map>
  801498:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80149b:	48 98                	cdqe   
  80149d:	48 c1 e0 02          	shl    rax,0x2
  8014a1:	48 01 d0             	add    rax,rdx
  8014a4:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<128;i++){
  8014aa:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  8014ae:	83 7d e8 7f          	cmp    DWORD PTR [rbp-0x18],0x7f
  8014b2:	7e dd                	jle    801491 <init_memory+0x142>
    }
}
  8014b4:	90                   	nop
  8014b5:	90                   	nop
  8014b6:	5d                   	pop    rbp
  8014b7:	c3                   	ret    

00000000008014b8 <req_a_page>:
/*
page_map存储方式:
0x00000000
little end
*/
addr_t req_a_page(){
  8014b8:	f3 0f 1e fa          	endbr64 
  8014bc:	55                   	push   rbp
  8014bd:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  8014c0:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8014c7:	e9 b0 00 00 00       	jmp    80157c <req_a_page+0xc4>
        for(int j=0;j<32;j++){
  8014cc:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8014d3:	e9 96 00 00 00       	jmp    80156e <req_a_page+0xb6>
            unsigned int bit=page_map[i]&(1<<j);
  8014d8:	48 8b 15 41 eb bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfeb41]        # 400020 <page_map>
  8014df:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8014e2:	48 98                	cdqe   
  8014e4:	48 c1 e0 02          	shl    rax,0x2
  8014e8:	48 01 d0             	add    rax,rdx
  8014eb:	8b 10                	mov    edx,DWORD PTR [rax]
  8014ed:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8014f0:	be 01 00 00 00       	mov    esi,0x1
  8014f5:	89 c1                	mov    ecx,eax
  8014f7:	d3 e6                	shl    esi,cl
  8014f9:	89 f0                	mov    eax,esi
  8014fb:	21 d0                	and    eax,edx
  8014fd:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            if((i*32+j)*4096>=0x100000&&!bit)
  801500:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801503:	c1 e0 05             	shl    eax,0x5
  801506:	89 c2                	mov    edx,eax
  801508:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80150b:	01 d0                	add    eax,edx
  80150d:	c1 e0 0c             	shl    eax,0xc
  801510:	3d ff ff 0f 00       	cmp    eax,0xfffff
  801515:	7e 53                	jle    80156a <req_a_page+0xb2>
  801517:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80151b:	75 4d                	jne    80156a <req_a_page+0xb2>
            {
                page_map[i]=page_map[i]|(1<<j);
  80151d:	48 8b 15 fc ea bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfeafc]        # 400020 <page_map>
  801524:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801527:	48 98                	cdqe   
  801529:	48 c1 e0 02          	shl    rax,0x2
  80152d:	48 01 d0             	add    rax,rdx
  801530:	8b 10                	mov    edx,DWORD PTR [rax]
  801532:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801535:	be 01 00 00 00       	mov    esi,0x1
  80153a:	89 c1                	mov    ecx,eax
  80153c:	d3 e6                	shl    esi,cl
  80153e:	89 f0                	mov    eax,esi
  801540:	89 c6                	mov    esi,eax
  801542:	48 8b 0d d7 ea bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfead7]        # 400020 <page_map>
  801549:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80154c:	48 98                	cdqe   
  80154e:	48 c1 e0 02          	shl    rax,0x2
  801552:	48 01 c8             	add    rax,rcx
  801555:	09 f2                	or     edx,esi
  801557:	89 10                	mov    DWORD PTR [rax],edx
                return i*32+j;//num of page
  801559:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80155c:	c1 e0 05             	shl    eax,0x5
  80155f:	89 c2                	mov    edx,eax
  801561:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801564:	01 d0                	add    eax,edx
  801566:	48 98                	cdqe   
  801568:	eb 1c                	jmp    801586 <req_a_page+0xce>
        for(int j=0;j<32;j++){
  80156a:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80156e:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  801572:	0f 8e 60 ff ff ff    	jle    8014d8 <req_a_page+0x20>
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  801578:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80157c:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  801580:	0f 8e 46 ff ff ff    	jle    8014cc <req_a_page+0x14>

            }
        }
    }
}
  801586:	5d                   	pop    rbp
  801587:	c3                   	ret    

0000000000801588 <free_page>:

int free_page(char *paddr){
  801588:	f3 0f 1e fa          	endbr64 
  80158c:	55                   	push   rbp
  80158d:	48 89 e5             	mov    rbp,rsp
  801590:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=(int)paddr/4096;
  801594:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801598:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80159e:	85 c0                	test   eax,eax
  8015a0:	0f 48 c2             	cmovs  eax,edx
  8015a3:	c1 f8 0c             	sar    eax,0xc
  8015a6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  8015a9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8015ac:	8d 50 1f             	lea    edx,[rax+0x1f]
  8015af:	85 c0                	test   eax,eax
  8015b1:	0f 48 c2             	cmovs  eax,edx
  8015b4:	c1 f8 05             	sar    eax,0x5
  8015b7:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  8015ba:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8015bd:	99                   	cdq    
  8015be:	c1 ea 1b             	shr    edx,0x1b
  8015c1:	01 d0                	add    eax,edx
  8015c3:	83 e0 1f             	and    eax,0x1f
  8015c6:	29 d0                	sub    eax,edx
  8015c8:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    page_map[n]=page_map[n]&~(unsigned int)(1<<r);
  8015cb:	48 8b 15 4e ea bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfea4e]        # 400020 <page_map>
  8015d2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8015d5:	48 98                	cdqe   
  8015d7:	48 c1 e0 02          	shl    rax,0x2
  8015db:	48 01 d0             	add    rax,rdx
  8015de:	8b 10                	mov    edx,DWORD PTR [rax]
  8015e0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8015e3:	be 01 00 00 00       	mov    esi,0x1
  8015e8:	89 c1                	mov    ecx,eax
  8015ea:	d3 e6                	shl    esi,cl
  8015ec:	89 f0                	mov    eax,esi
  8015ee:	f7 d0                	not    eax
  8015f0:	89 c6                	mov    esi,eax
  8015f2:	48 8b 0d 27 ea bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfea27]        # 400020 <page_map>
  8015f9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8015fc:	48 98                	cdqe   
  8015fe:	48 c1 e0 02          	shl    rax,0x2
  801602:	48 01 c8             	add    rax,rcx
  801605:	21 f2                	and    edx,esi
  801607:	89 10                	mov    DWORD PTR [rax],edx
}
  801609:	90                   	nop
  80160a:	5d                   	pop    rbp
  80160b:	c3                   	ret    

000000000080160c <check_page>:
int check_page(int num){
  80160c:	f3 0f 1e fa          	endbr64 
  801610:	55                   	push   rbp
  801611:	48 89 e5             	mov    rbp,rsp
  801614:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int n=num/32;
  801617:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80161a:	8d 50 1f             	lea    edx,[rax+0x1f]
  80161d:	85 c0                	test   eax,eax
  80161f:	0f 48 c2             	cmovs  eax,edx
  801622:	c1 f8 05             	sar    eax,0x5
  801625:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int r=num%32;
  801628:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80162b:	99                   	cdq    
  80162c:	c1 ea 1b             	shr    edx,0x1b
  80162f:	01 d0                	add    eax,edx
  801631:	83 e0 1f             	and    eax,0x1f
  801634:	29 d0                	sub    eax,edx
  801636:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int bit=page_map[n]&(1<<r);
  801639:	48 8b 15 e0 e9 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe9e0]        # 400020 <page_map>
  801640:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801643:	48 98                	cdqe   
  801645:	48 c1 e0 02          	shl    rax,0x2
  801649:	48 01 d0             	add    rax,rdx
  80164c:	8b 10                	mov    edx,DWORD PTR [rax]
  80164e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801651:	be 01 00 00 00       	mov    esi,0x1
  801656:	89 c1                	mov    ecx,eax
  801658:	d3 e6                	shl    esi,cl
  80165a:	89 f0                	mov    eax,esi
  80165c:	21 d0                	and    eax,edx
  80165e:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    return bit;
  801661:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  801664:	5d                   	pop    rbp
  801665:	c3                   	ret    

0000000000801666 <get_phyaddr>:
/*
 * 获得这个页对应的物理内存地址
 * */
int get_phyaddr(int num){
  801666:	f3 0f 1e fa          	endbr64 
  80166a:	55                   	push   rbp
  80166b:	48 89 e5             	mov    rbp,rsp
  80166e:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return num*0x1000;
  801671:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801674:	c1 e0 0c             	shl    eax,0xc
}
  801677:	5d                   	pop    rbp
  801678:	c3                   	ret    

0000000000801679 <set_page_item>:

void set_page_item(page_item *item_addr,int phy_addr,int attr)
{
  801679:	f3 0f 1e fa          	endbr64 
  80167d:	55                   	push   rbp
  80167e:	48 89 e5             	mov    rbp,rsp
  801681:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  801685:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  801688:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    *item_addr=0;
  80168b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80168f:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *item_addr|=phy_addr&0xfffff000;
  801696:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80169a:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80169d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8016a0:	89 c0                	mov    eax,eax
  8016a2:	25 00 f0 ff ff       	and    eax,0xfffff000
  8016a7:	48 09 c2             	or     rdx,rax
  8016aa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8016ae:	48 89 10             	mov    QWORD PTR [rax],rdx
    *item_addr|=attr;
  8016b1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8016b5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8016b8:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8016bb:	48 98                	cdqe   
  8016bd:	48 09 c2             	or     rdx,rax
  8016c0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8016c4:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  8016c7:	90                   	nop
  8016c8:	5d                   	pop    rbp
  8016c9:	c3                   	ret    

00000000008016ca <set_1gb_pdpt>:
void set_1gb_pdpt(page_item* ppdpt,int pa,unsigned int extra_attr)
{
  8016ca:	f3 0f 1e fa          	endbr64 
  8016ce:	55                   	push   rbp
  8016cf:	48 89 e5             	mov    rbp,rsp
  8016d2:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8016d6:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  8016d9:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *ppdpt=0;
  8016dc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016e0:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *ppdpt|=PAGE_PRESENT|PDPTE_1GB|extra_attr;
  8016e7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016eb:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8016ee:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8016f1:	0c 81                	or     al,0x81
  8016f3:	89 c0                	mov    eax,eax
  8016f5:	48 09 c2             	or     rdx,rax
  8016f8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016fc:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffffc0000000ul;
  8016ff:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801702:	25 00 00 00 c0       	and    eax,0xc0000000
  801707:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *ppdpt|=hipa;
  80170a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80170e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801711:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801714:	48 09 c2             	or     rdx,rax
  801717:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80171b:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  80171e:	90                   	nop
  80171f:	5d                   	pop    rbp
  801720:	c3                   	ret    

0000000000801721 <set_2mb_pde>:
void set_2mb_pde(page_item* pde,int pa)
{
  801721:	f3 0f 1e fa          	endbr64 
  801725:	55                   	push   rbp
  801726:	48 89 e5             	mov    rbp,rsp
  801729:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80172d:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    *pde=0;
  801730:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801734:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *pde|=PAGE_PRESENT|PAGE_4MB_PAGE|PDE_4MB_PAT;
  80173b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80173f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801742:	48 0d 81 10 00 00    	or     rax,0x1081
  801748:	48 89 c2             	mov    rdx,rax
  80174b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80174f:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffc00000;
  801752:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801755:	25 00 00 c0 ff       	and    eax,0xffc00000
  80175a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *pde|=hipa;
  80175d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801761:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801764:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801767:	48 09 c2             	or     rdx,rax
  80176a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80176e:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  801771:	90                   	nop
  801772:	5d                   	pop    rbp
  801773:	c3                   	ret    

0000000000801774 <req_page_at>:
        page_map[i]&=(u32)(1<<j);
    return ret;
} */
//在bitmap申请指定的页面,base默认0x1000对齐
addr_t req_page_at(addr_t base,int pgn)
{
  801774:	f3 0f 1e fa          	endbr64 
  801778:	55                   	push   rbp
  801779:	48 89 e5             	mov    rbp,rsp
  80177c:	48 83 ec 20          	sub    rsp,0x20
  801780:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  801784:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    if(base==0)//不指定地址
  801787:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  80178c:	75 18                	jne    8017a6 <req_page_at+0x32>
    {
        return get_phyaddr(req_a_page());
  80178e:	b8 00 00 00 00       	mov    eax,0x0
  801793:	e8 20 fd ff ff       	call   8014b8 <req_a_page>
  801798:	89 c7                	mov    edi,eax
  80179a:	e8 c7 fe ff ff       	call   801666 <get_phyaddr>
  80179f:	48 98                	cdqe   
  8017a1:	e9 a5 00 00 00       	jmp    80184b <req_page_at+0xd7>
    }
    if(!is_pgs_ava(base,pgn))return -1;//先检查
  8017a6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8017aa:	89 c2                	mov    edx,eax
  8017ac:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8017af:	89 c6                	mov    esi,eax
  8017b1:	89 d7                	mov    edi,edx
  8017b3:	e8 52 01 00 00       	call   80190a <is_pgs_ava>
  8017b8:	85 c0                	test   eax,eax
  8017ba:	75 0c                	jne    8017c8 <req_page_at+0x54>
  8017bc:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  8017c3:	e9 83 00 00 00       	jmp    80184b <req_page_at+0xd7>
    int pgni=base/4096;
  8017c8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8017cc:	48 c1 e8 0c          	shr    rax,0xc
  8017d0:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int pgi=pgni/32;
  8017d3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8017d6:	8d 50 1f             	lea    edx,[rax+0x1f]
  8017d9:	85 c0                	test   eax,eax
  8017db:	0f 48 c2             	cmovs  eax,edx
  8017de:	c1 f8 05             	sar    eax,0x5
  8017e1:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    int pgj=pgni%32;
  8017e4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8017e7:	99                   	cdq    
  8017e8:	c1 ea 1b             	shr    edx,0x1b
  8017eb:	01 d0                	add    eax,edx
  8017ed:	83 e0 1f             	and    eax,0x1f
  8017f0:	29 d0                	sub    eax,edx
  8017f2:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<pgn;i++)
  8017f5:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8017fc:	eb 40                	jmp    80183e <req_page_at+0xca>
    {
        page_map[i]|=(1<<pgj);
  8017fe:	48 8b 15 1b e8 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe81b]        # 400020 <page_map>
  801805:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801808:	48 98                	cdqe   
  80180a:	48 c1 e0 02          	shl    rax,0x2
  80180e:	48 01 d0             	add    rax,rdx
  801811:	8b 10                	mov    edx,DWORD PTR [rax]
  801813:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  801816:	be 01 00 00 00       	mov    esi,0x1
  80181b:	89 c1                	mov    ecx,eax
  80181d:	d3 e6                	shl    esi,cl
  80181f:	89 f0                	mov    eax,esi
  801821:	89 c6                	mov    esi,eax
  801823:	48 8b 0d f6 e7 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe7f6]        # 400020 <page_map>
  80182a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80182d:	48 98                	cdqe   
  80182f:	48 c1 e0 02          	shl    rax,0x2
  801833:	48 01 c8             	add    rax,rcx
  801836:	09 f2                	or     edx,esi
  801838:	89 10                	mov    DWORD PTR [rax],edx
    for(int i=0;i<pgn;i++)
  80183a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80183e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801841:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  801844:	7c b8                	jl     8017fe <req_page_at+0x8a>
    }
    return 0;
  801846:	b8 00 00 00 00       	mov    eax,0x0

}
  80184b:	c9                   	leave  
  80184c:	c3                   	ret    

000000000080184d <chk_vm>:
int chk_vm(int base, int pgn)
{
  80184d:	f3 0f 1e fa          	endbr64 
  801851:	55                   	push   rbp
  801852:	48 89 e5             	mov    rbp,rsp
  801855:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801858:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int *pdet=0;
  80185b:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  801862:	00 
    asm volatile("mov %%cr3,%0":"=r"(pdet));
  801863:	0f 20 d8             	mov    rax,cr3
  801866:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int *pt=pdet[base/PAGE_INDEX_SIZE]&0xfffff000;
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
  80188e:	89 c0                	mov    eax,eax
  801890:	25 00 f0 ff ff       	and    eax,0xfffff000
  801895:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  801899:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80189c:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  8018a2:	85 c0                	test   eax,eax
  8018a4:	0f 48 c2             	cmovs  eax,edx
  8018a7:	c1 f8 16             	sar    eax,0x16
  8018aa:	48 98                	cdqe   
  8018ac:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8018b3:	00 
  8018b4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8018b8:	48 01 d0             	add    rax,rdx
  8018bb:	8b 00                	mov    eax,DWORD PTR [rax]
  8018bd:	83 e0 01             	and    eax,0x1
  8018c0:	85 c0                	test   eax,eax
  8018c2:	74 38                	je     8018fc <chk_vm+0xaf>
    !(pt[base%PAGE_INDEX_SIZE/PAGE_SIZE]&PAGE_PRESENT))
  8018c4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8018c7:	99                   	cdq    
  8018c8:	c1 ea 0a             	shr    edx,0xa
  8018cb:	01 d0                	add    eax,edx
  8018cd:	25 ff ff 3f 00       	and    eax,0x3fffff
  8018d2:	29 d0                	sub    eax,edx
  8018d4:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8018da:	85 c0                	test   eax,eax
  8018dc:	0f 48 c2             	cmovs  eax,edx
  8018df:	c1 f8 0c             	sar    eax,0xc
  8018e2:	48 98                	cdqe   
  8018e4:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8018eb:	00 
  8018ec:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8018f0:	48 01 d0             	add    rax,rdx
  8018f3:	8b 00                	mov    eax,DWORD PTR [rax]
  8018f5:	83 e0 01             	and    eax,0x1
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  8018f8:	85 c0                	test   eax,eax
  8018fa:	75 07                	jne    801903 <chk_vm+0xb6>
    {
        return -1;
  8018fc:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801901:	eb 05                	jmp    801908 <chk_vm+0xbb>
    }
    return 0;
  801903:	b8 00 00 00 00       	mov    eax,0x0
}
  801908:	5d                   	pop    rbp
  801909:	c3                   	ret    

000000000080190a <is_pgs_ava>:
//查看指定区域的页内存是否可用
int is_pgs_ava(int base,int pgn)
{
  80190a:	f3 0f 1e fa          	endbr64 
  80190e:	55                   	push   rbp
  80190f:	48 89 e5             	mov    rbp,rsp
  801912:	48 83 ec 18          	sub    rsp,0x18
  801916:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801919:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int pgi=base/4096;
  80191c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80191f:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801925:	85 c0                	test   eax,eax
  801927:	0f 48 c2             	cmovs  eax,edx
  80192a:	c1 f8 0c             	sar    eax,0xc
  80192d:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    for(int i=0;i<pgn;i++)
  801930:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801937:	eb 1e                	jmp    801957 <is_pgs_ava+0x4d>
    {
        if(check_page(pgi+i)!=0)return 0;
  801939:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  80193c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80193f:	01 d0                	add    eax,edx
  801941:	89 c7                	mov    edi,eax
  801943:	e8 c4 fc ff ff       	call   80160c <check_page>
  801948:	85 c0                	test   eax,eax
  80194a:	74 07                	je     801953 <is_pgs_ava+0x49>
  80194c:	b8 00 00 00 00       	mov    eax,0x0
  801951:	eb 11                	jmp    801964 <is_pgs_ava+0x5a>
    for(int i=0;i<pgn;i++)
  801953:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801957:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80195a:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  80195d:	7c da                	jl     801939 <is_pgs_ava+0x2f>
    }
    return 1;
  80195f:	b8 01 00 00 00       	mov    eax,0x1

}
  801964:	c9                   	leave  
  801965:	c3                   	ret    

0000000000801966 <setup_sys_vol>:
super_block sbs[MAX_SUPERBLOCKS];
fs_operations fs[MAX_FS];

buffer_head buffer_heads[NR_BUFFERHEADS];
int setup_sys_vol(void *disk_drv, void *fs_drv)
{
  801966:	f3 0f 1e fa          	endbr64 
  80196a:	55                   	push   rbp
  80196b:	48 89 e5             	mov    rbp,rsp
  80196e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  801972:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    vols[0].name[0]='C';
  801976:	c6 05 c3 e8 bf ff 43 	mov    BYTE PTR [rip+0xffffffffffbfe8c3],0x43        # 400240 <vols>
    vols[0].name[1]='\0';
  80197d:	c6 05 bd e8 bf ff 00 	mov    BYTE PTR [rip+0xffffffffffbfe8bd],0x0        # 400241 <vols+0x1>
    vols[0].disk_drv=disk_drv;
  801984:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801988:	48 89 05 b9 e8 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe8b9],rax        # 400248 <vols+0x8>
    vols[0].fs_drv=fs_drv;
  80198f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801993:	48 89 05 b6 e8 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe8b6],rax        # 400250 <vols+0x10>
    vols[0].stat=VOLUME_STAT_READY;
  80199a:	c7 05 bc e8 bf ff 01 	mov    DWORD PTR [rip+0xffffffffffbfe8bc],0x1        # 400260 <vols+0x20>
  8019a1:	00 00 00 
    return 0;
  8019a4:	b8 00 00 00 00       	mov    eax,0x0
}
  8019a9:	5d                   	pop    rbp
  8019aa:	c3                   	ret    

00000000008019ab <sys_mkfifo>:
//返回管道描述符
int sys_mkfifo(int number)
{
  8019ab:	f3 0f 1e fa          	endbr64 
  8019af:	55                   	push   rbp
  8019b0:	48 89 e5             	mov    rbp,rsp
  8019b3:	48 83 ec 20          	sub    rsp,0x20
  8019b7:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    //查重
    for(int i=0;i<MAX_FIFOS;i++)
  8019ba:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8019c1:	eb 38                	jmp    8019fb <sys_mkfifo+0x50>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  8019c3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019c6:	48 98                	cdqe   
  8019c8:	48 c1 e0 04          	shl    rax,0x4
  8019cc:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  8019d2:	8b 00                	mov    eax,DWORD PTR [rax]
  8019d4:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8019d7:	75 1e                	jne    8019f7 <sys_mkfifo+0x4c>
  8019d9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019dc:	48 98                	cdqe   
  8019de:	48 c1 e0 04          	shl    rax,0x4
  8019e2:	48 05 68 1e 40 00    	add    rax,0x401e68
  8019e8:	8b 00                	mov    eax,DWORD PTR [rax]
  8019ea:	83 f8 01             	cmp    eax,0x1
  8019ed:	75 08                	jne    8019f7 <sys_mkfifo+0x4c>
            return i;
  8019ef:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019f2:	e9 a6 00 00 00       	jmp    801a9d <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  8019f7:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8019fb:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  8019ff:	7e c2                	jle    8019c3 <sys_mkfifo+0x18>
        }
    }
    for(int i=0;i<MAX_FIFOS;i++)
  801a01:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801a08:	e9 81 00 00 00       	jmp    801a8e <sys_mkfifo+0xe3>
    {
        if(fifos[i].flag==0) {
  801a0d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801a10:	48 98                	cdqe   
  801a12:	48 c1 e0 04          	shl    rax,0x4
  801a16:	48 05 68 1e 40 00    	add    rax,0x401e68
  801a1c:	8b 00                	mov    eax,DWORD PTR [rax]
  801a1e:	85 c0                	test   eax,eax
  801a20:	75 68                	jne    801a8a <sys_mkfifo+0xdf>
            fifos[i].flag=1;
  801a22:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801a25:	48 98                	cdqe   
  801a27:	48 c1 e0 04          	shl    rax,0x4
  801a2b:	48 05 68 1e 40 00    	add    rax,0x401e68
  801a31:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            fifos[i].id=number;
  801a37:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801a3a:	48 98                	cdqe   
  801a3c:	48 c1 e0 04          	shl    rax,0x4
  801a40:	48 8d 90 6c 1e 40 00 	lea    rdx,[rax+0x401e6c]
  801a47:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a4a:	89 02                	mov    DWORD PTR [rdx],eax
            fifos[i].size=CHUNK_SIZE;
  801a4c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801a4f:	48 98                	cdqe   
  801a51:	48 c1 e0 04          	shl    rax,0x4
  801a55:	48 05 64 1e 40 00    	add    rax,0x401e64
  801a5b:	c7 00 00 10 00 00    	mov    DWORD PTR [rax],0x1000
            //分配内存
            fifos[i].pa= get_phyaddr(req_a_page());
  801a61:	b8 00 00 00 00       	mov    eax,0x0
  801a66:	e8 4d fa ff ff       	call   8014b8 <req_a_page>
  801a6b:	89 c7                	mov    edi,eax
  801a6d:	e8 f4 fb ff ff       	call   801666 <get_phyaddr>
  801a72:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801a75:	48 63 d2             	movsxd rdx,edx
  801a78:	48 c1 e2 04          	shl    rdx,0x4
  801a7c:	48 81 c2 60 1e 40 00 	add    rdx,0x401e60
  801a83:	89 02                	mov    DWORD PTR [rdx],eax
            return i;
  801a85:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801a88:	eb 13                	jmp    801a9d <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801a8a:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801a8e:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  801a92:	0f 8e 75 ff ff ff    	jle    801a0d <sys_mkfifo+0x62>
        }
    }
    return -1;
  801a98:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801a9d:	c9                   	leave  
  801a9e:	c3                   	ret    

0000000000801a9f <sys_rmfifo>:

int sys_rmfifo(int number)
{
  801a9f:	f3 0f 1e fa          	endbr64 
  801aa3:	55                   	push   rbp
  801aa4:	48 89 e5             	mov    rbp,rsp
  801aa7:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_FIFOS;i++)
  801aaa:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801ab1:	eb 4a                	jmp    801afd <sys_rmfifo+0x5e>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801ab3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ab6:	48 98                	cdqe   
  801ab8:	48 c1 e0 04          	shl    rax,0x4
  801abc:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801ac2:	8b 00                	mov    eax,DWORD PTR [rax]
  801ac4:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801ac7:	75 30                	jne    801af9 <sys_rmfifo+0x5a>
  801ac9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801acc:	48 98                	cdqe   
  801ace:	48 c1 e0 04          	shl    rax,0x4
  801ad2:	48 05 68 1e 40 00    	add    rax,0x401e68
  801ad8:	8b 00                	mov    eax,DWORD PTR [rax]
  801ada:	83 f8 01             	cmp    eax,0x1
  801add:	75 1a                	jne    801af9 <sys_rmfifo+0x5a>
            fifos[i].flag=0;
  801adf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ae2:	48 98                	cdqe   
  801ae4:	48 c1 e0 04          	shl    rax,0x4
  801ae8:	48 05 68 1e 40 00    	add    rax,0x401e68
  801aee:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            return i;
  801af4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801af7:	eb 0f                	jmp    801b08 <sys_rmfifo+0x69>
    for(int i=0;i<MAX_FIFOS;i++)
  801af9:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801afd:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801b01:	7e b0                	jle    801ab3 <sys_rmfifo+0x14>
        }
    }
    return -1;
  801b03:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801b08:	5d                   	pop    rbp
  801b09:	c3                   	ret    

0000000000801b0a <free_vol>:
int free_vol(int voli)
{
  801b0a:	f3 0f 1e fa          	endbr64 
  801b0e:	55                   	push   rbp
  801b0f:	48 89 e5             	mov    rbp,rsp
  801b12:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    vols[0].stat=VOLUME_STAT_EMPTY;
  801b15:	c7 05 41 e7 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbfe741],0x0        # 400260 <vols+0x20>
  801b1c:	00 00 00 
    return 0;
  801b1f:	b8 00 00 00 00       	mov    eax,0x0
}
  801b24:	5d                   	pop    rbp
  801b25:	c3                   	ret    

0000000000801b26 <reg_vol>:

int reg_vol(int disk_drvi, int fs_drvi, char *name)
{
  801b26:	f3 0f 1e fa          	endbr64 
  801b2a:	55                   	push   rbp
  801b2b:	48 89 e5             	mov    rbp,rsp
  801b2e:	48 83 ec 20          	sub    rsp,0x20
  801b32:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801b35:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  801b38:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
    for(int i=0;i<MAX_VOLUMES;i++)
  801b3c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801b43:	e9 d8 00 00 00       	jmp    801c20 <reg_vol+0xfa>
    {
        if(vols[i].stat==VOLUME_STAT_EMPTY)
  801b48:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b4b:	48 63 d0             	movsxd rdx,eax
  801b4e:	48 89 d0             	mov    rax,rdx
  801b51:	48 c1 e0 02          	shl    rax,0x2
  801b55:	48 01 d0             	add    rax,rdx
  801b58:	48 c1 e0 03          	shl    rax,0x3
  801b5c:	48 05 60 02 40 00    	add    rax,0x400260
  801b62:	8b 00                	mov    eax,DWORD PTR [rax]
  801b64:	85 c0                	test   eax,eax
  801b66:	0f 85 b0 00 00 00    	jne    801c1c <reg_vol+0xf6>
        {
            extern driver *drvs;
            vols[i].stat=VOLUME_STAT_READY;
  801b6c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b6f:	48 63 d0             	movsxd rdx,eax
  801b72:	48 89 d0             	mov    rax,rdx
  801b75:	48 c1 e0 02          	shl    rax,0x2
  801b79:	48 01 d0             	add    rax,rdx
  801b7c:	48 c1 e0 03          	shl    rax,0x3
  801b80:	48 05 60 02 40 00    	add    rax,0x400260
  801b86:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            vols[i].fs= &fs[fs_drvi];
  801b8c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801b8f:	48 63 d0             	movsxd rdx,eax
  801b92:	48 89 d0             	mov    rax,rdx
  801b95:	48 01 c0             	add    rax,rax
  801b98:	48 01 d0             	add    rax,rdx
  801b9b:	48 c1 e0 03          	shl    rax,0x3
  801b9f:	48 8d 88 80 23 40 00 	lea    rcx,[rax+0x402380]
  801ba6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ba9:	48 63 d0             	movsxd rdx,eax
  801bac:	48 89 d0             	mov    rax,rdx
  801baf:	48 c1 e0 02          	shl    rax,0x2
  801bb3:	48 01 d0             	add    rax,rdx
  801bb6:	48 c1 e0 03          	shl    rax,0x3
  801bba:	48 05 58 02 40 00    	add    rax,0x400258
  801bc0:	48 89 08             	mov    QWORD PTR [rax],rcx
            vols[i].disk_drv= get_drv(disk_drvi);
  801bc3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801bc6:	89 c7                	mov    edi,eax
  801bc8:	e8 fa 19 00 00       	call   8035c7 <get_drv>
  801bcd:	48 89 c2             	mov    rdx,rax
  801bd0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801bd3:	48 63 c8             	movsxd rcx,eax
  801bd6:	48 89 c8             	mov    rax,rcx
  801bd9:	48 c1 e0 02          	shl    rax,0x2
  801bdd:	48 01 c8             	add    rax,rcx
  801be0:	48 c1 e0 03          	shl    rax,0x3
  801be4:	48 05 48 02 40 00    	add    rax,0x400248
  801bea:	48 89 10             	mov    QWORD PTR [rax],rdx
            strcpy(vols[i].name,name);
  801bed:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801bf0:	48 63 d0             	movsxd rdx,eax
  801bf3:	48 89 d0             	mov    rax,rdx
  801bf6:	48 c1 e0 02          	shl    rax,0x2
  801bfa:	48 01 d0             	add    rax,rdx
  801bfd:	48 c1 e0 03          	shl    rax,0x3
  801c01:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801c08:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801c0c:	48 89 c6             	mov    rsi,rax
  801c0f:	48 89 d7             	mov    rdi,rdx
  801c12:	e8 b8 89 00 00       	call   80a5cf <strcpy>
            return i;
  801c17:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801c1a:	eb 13                	jmp    801c2f <reg_vol+0x109>
    for(int i=0;i<MAX_VOLUMES;i++)
  801c1c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801c20:	83 7d fc 19          	cmp    DWORD PTR [rbp-0x4],0x19
  801c24:	0f 8e 1e ff ff ff    	jle    801b48 <reg_vol+0x22>
        }
    }
    return -1;
  801c2a:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801c2f:	c9                   	leave  
  801c30:	c3                   	ret    

0000000000801c31 <sys_open>:
int sys_open(char *path, int mode)
{
  801c31:	f3 0f 1e fa          	endbr64 
  801c35:	55                   	push   rbp
  801c36:	48 89 e5             	mov    rbp,rsp
  801c39:	53                   	push   rbx
  801c3a:	48 81 ec 28 02 00 00 	sub    rsp,0x228
  801c41:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
  801c48:	89 b5 d4 fd ff ff    	mov    DWORD PTR [rbp-0x22c],esi
    {

    }
    //根据文件路径找到相应的卷
    char volname[26];
    int i=0,rec=0;
  801c4e:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801c55:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
    for(;path[i]!='/'&&i<26;i++)
  801c5c:	eb 20                	jmp    801c7e <sys_open+0x4d>
        volname[i]=path[i];
  801c5e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c61:	48 63 d0             	movsxd rdx,eax
  801c64:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801c6b:	48 01 d0             	add    rax,rdx
  801c6e:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  801c71:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c74:	48 98                	cdqe   
  801c76:	88 54 05 c0          	mov    BYTE PTR [rbp+rax*1-0x40],dl
    for(;path[i]!='/'&&i<26;i++)
  801c7a:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801c7e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c81:	48 63 d0             	movsxd rdx,eax
  801c84:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801c8b:	48 01 d0             	add    rax,rdx
  801c8e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  801c91:	3c 2f                	cmp    al,0x2f
  801c93:	74 06                	je     801c9b <sys_open+0x6a>
  801c95:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  801c99:	7e c3                	jle    801c5e <sys_open+0x2d>
    volname[i]='\0';
  801c9b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c9e:	48 98                	cdqe   
  801ca0:	c6 44 05 c0 00       	mov    BYTE PTR [rbp+rax*1-0x40],0x0
    if(!path[i+1])
  801ca5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801ca8:	48 98                	cdqe   
  801caa:	48 8d 50 01          	lea    rdx,[rax+0x1]
  801cae:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801cb5:	48 01 d0             	add    rax,rdx
  801cb8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  801cbb:	84 c0                	test   al,al
  801cbd:	75 0a                	jne    801cc9 <sys_open+0x98>
        return -2;//是根目录
  801cbf:	b8 fe ff ff ff       	mov    eax,0xfffffffe
  801cc4:	e9 2b 04 00 00       	jmp    8020f4 <sys_open+0x4c3>
    rec=i;
  801cc9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801ccc:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    for(i=0;i<MAX_VOLUMES;i++)
  801ccf:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801cd6:	eb 52                	jmp    801d2a <sys_open+0xf9>
        if(vols[i].stat!=VOLUME_STAT_EMPTY&& \
  801cd8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801cdb:	48 63 d0             	movsxd rdx,eax
  801cde:	48 89 d0             	mov    rax,rdx
  801ce1:	48 c1 e0 02          	shl    rax,0x2
  801ce5:	48 01 d0             	add    rax,rdx
  801ce8:	48 c1 e0 03          	shl    rax,0x3
  801cec:	48 05 60 02 40 00    	add    rax,0x400260
  801cf2:	8b 00                	mov    eax,DWORD PTR [rax]
  801cf4:	85 c0                	test   eax,eax
  801cf6:	74 2e                	je     801d26 <sys_open+0xf5>
        (strcmp(vols[i].name,volname)==0))
  801cf8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801cfb:	48 63 d0             	movsxd rdx,eax
  801cfe:	48 89 d0             	mov    rax,rdx
  801d01:	48 c1 e0 02          	shl    rax,0x2
  801d05:	48 01 d0             	add    rax,rdx
  801d08:	48 c1 e0 03          	shl    rax,0x3
  801d0c:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801d13:	48 8d 45 c0          	lea    rax,[rbp-0x40]
  801d17:	48 89 c6             	mov    rsi,rax
  801d1a:	48 89 d7             	mov    rdi,rdx
  801d1d:	e8 4d 8a 00 00       	call   80a76f <strcmp>
        if(vols[i].stat!=VOLUME_STAT_EMPTY&& \
  801d22:	85 c0                	test   eax,eax
  801d24:	74 0c                	je     801d32 <sys_open+0x101>
    for(i=0;i<MAX_VOLUMES;i++)
  801d26:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801d2a:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  801d2e:	7e a8                	jle    801cd8 <sys_open+0xa7>
  801d30:	eb 01                	jmp    801d33 <sys_open+0x102>
            break;
  801d32:	90                   	nop
    if(i==MAX_VOLUMES)return -1;
  801d33:	83 7d ec 1a          	cmp    DWORD PTR [rbp-0x14],0x1a
  801d37:	75 0a                	jne    801d43 <sys_open+0x112>
  801d39:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801d3e:	e9 b1 03 00 00       	jmp    8020f4 <sys_open+0x4c3>
    driver_args arg={
  801d43:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
  801d4a:	b8 00 00 00 00       	mov    eax,0x0
  801d4f:	b9 17 00 00 00       	mov    ecx,0x17
  801d54:	48 89 d7             	mov    rdi,rdx
  801d57:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  801d5a:	48 89 fa             	mov    rdx,rdi
  801d5d:	89 02                	mov    DWORD PTR [rdx],eax
  801d5f:	48 83 c2 04          	add    rdx,0x4
            .path=path+rec+1
  801d63:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801d66:	48 98                	cdqe   
  801d68:	48 8d 50 01          	lea    rdx,[rax+0x1]
  801d6c:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801d73:	48 01 d0             	add    rax,rdx
    driver_args arg={
  801d76:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
    };
    vfs_dir_entry dir;
    vfs_dir_entry res;
    int voln=i;
  801d7d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801d80:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    if(vols[i].fs->find(path+rec+1,dir,&res)==-1)//找不到文件 ((driver*)vols[i].fs_drv)->find(&arg)==-1
  801d83:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801d86:	48 63 d0             	movsxd rdx,eax
  801d89:	48 89 d0             	mov    rax,rdx
  801d8c:	48 c1 e0 02          	shl    rax,0x2
  801d90:	48 01 d0             	add    rax,rdx
  801d93:	48 c1 e0 03          	shl    rax,0x3
  801d97:	48 05 58 02 40 00    	add    rax,0x400258
  801d9d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801da0:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  801da4:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801da7:	48 98                	cdqe   
  801da9:	48 8d 48 01          	lea    rcx,[rax+0x1]
  801dad:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801db4:	48 01 c1             	add    rcx,rax
  801db7:	48 8d 85 40 fe ff ff 	lea    rax,[rbp-0x1c0]
  801dbe:	ff b5 f8 fe ff ff    	push   QWORD PTR [rbp-0x108]
  801dc4:	ff b5 f0 fe ff ff    	push   QWORD PTR [rbp-0x110]
  801dca:	ff b5 e8 fe ff ff    	push   QWORD PTR [rbp-0x118]
  801dd0:	ff b5 e0 fe ff ff    	push   QWORD PTR [rbp-0x120]
  801dd6:	ff b5 d8 fe ff ff    	push   QWORD PTR [rbp-0x128]
  801ddc:	ff b5 d0 fe ff ff    	push   QWORD PTR [rbp-0x130]
  801de2:	ff b5 c8 fe ff ff    	push   QWORD PTR [rbp-0x138]
  801de8:	ff b5 c0 fe ff ff    	push   QWORD PTR [rbp-0x140]
  801dee:	ff b5 b8 fe ff ff    	push   QWORD PTR [rbp-0x148]
  801df4:	ff b5 b0 fe ff ff    	push   QWORD PTR [rbp-0x150]
  801dfa:	ff b5 a8 fe ff ff    	push   QWORD PTR [rbp-0x158]
  801e00:	ff b5 a0 fe ff ff    	push   QWORD PTR [rbp-0x160]
  801e06:	48 89 c6             	mov    rsi,rax
  801e09:	48 89 cf             	mov    rdi,rcx
  801e0c:	ff d2                	call   rdx
  801e0e:	48 83 c4 60          	add    rsp,0x60
  801e12:	83 f8 ff             	cmp    eax,0xffffffff
  801e15:	75 49                	jne    801e60 <sys_open+0x22f>
    {
        if(mode&FILE_MODE_WRITE) {
  801e17:	8b 85 d4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x22c]
  801e1d:	83 e0 02             	and    eax,0x2
  801e20:	85 c0                	test   eax,eax
  801e22:	74 32                	je     801e56 <sys_open+0x225>
            return ((driver *) vols[i].fs_drv)->touch(&arg);//这里之后要改
  801e24:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801e27:	48 63 d0             	movsxd rdx,eax
  801e2a:	48 89 d0             	mov    rax,rdx
  801e2d:	48 c1 e0 02          	shl    rax,0x2
  801e31:	48 01 d0             	add    rax,rdx
  801e34:	48 c1 e0 03          	shl    rax,0x3
  801e38:	48 05 50 02 40 00    	add    rax,0x400250
  801e3e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801e41:	48 8b 50 4c          	mov    rdx,QWORD PTR [rax+0x4c]
  801e45:	48 8d 85 00 ff ff ff 	lea    rax,[rbp-0x100]
  801e4c:	48 89 c7             	mov    rdi,rax
  801e4f:	ff d2                	call   rdx
  801e51:	e9 9e 02 00 00       	jmp    8020f4 <sys_open+0x4c3>
        }else
            return -1;
  801e56:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801e5b:	e9 94 02 00 00       	jmp    8020f4 <sys_open+0x4c3>
    }
    vfs_dir_entry entry=res;//=arg.entry;
  801e60:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
  801e67:	48 8b 95 48 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b8]
  801e6e:	48 89 85 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],rax
  801e75:	48 89 95 e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdx
  801e7c:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
  801e83:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
  801e8a:	48 89 85 f0 fd ff ff 	mov    QWORD PTR [rbp-0x210],rax
  801e91:	48 89 95 f8 fd ff ff 	mov    QWORD PTR [rbp-0x208],rdx
  801e98:	48 8b 85 60 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1a0]
  801e9f:	48 8b 95 68 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x198]
  801ea6:	48 89 85 00 fe ff ff 	mov    QWORD PTR [rbp-0x200],rax
  801ead:	48 89 95 08 fe ff ff 	mov    QWORD PTR [rbp-0x1f8],rdx
  801eb4:	48 8b 85 70 fe ff ff 	mov    rax,QWORD PTR [rbp-0x190]
  801ebb:	48 8b 95 78 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x188]
  801ec2:	48 89 85 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rax
  801ec9:	48 89 95 18 fe ff ff 	mov    QWORD PTR [rbp-0x1e8],rdx
  801ed0:	48 8b 85 80 fe ff ff 	mov    rax,QWORD PTR [rbp-0x180]
  801ed7:	48 8b 95 88 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x178]
  801ede:	48 89 85 20 fe ff ff 	mov    QWORD PTR [rbp-0x1e0],rax
  801ee5:	48 89 95 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rdx
  801eec:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
  801ef3:	48 8b 95 98 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x168]
  801efa:	48 89 85 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],rax
  801f01:	48 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdx
    int j=-1;
  801f08:	c7 45 e8 ff ff ff ff 	mov    DWORD PTR [rbp-0x18],0xffffffff
    for(i=0;i<MAX_OPEN_FILES;i++)
  801f0f:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801f16:	eb 5c                	jmp    801f74 <sys_open+0x343>
    {
        if(opened[i].voln==voln&&opened[i].id==entry.id)
  801f18:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801f1b:	48 63 d0             	movsxd rdx,eax
  801f1e:	48 89 d0             	mov    rax,rdx
  801f21:	48 01 c0             	add    rax,rax
  801f24:	48 01 d0             	add    rax,rdx
  801f27:	48 c1 e0 05          	shl    rax,0x5
  801f2b:	48 05 68 06 40 00    	add    rax,0x400668
  801f31:	8b 00                	mov    eax,DWORD PTR [rax]
  801f33:	39 45 e0             	cmp    DWORD PTR [rbp-0x20],eax
  801f36:	75 38                	jne    801f70 <sys_open+0x33f>
  801f38:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801f3b:	48 63 d0             	movsxd rdx,eax
  801f3e:	48 89 d0             	mov    rax,rdx
  801f41:	48 01 c0             	add    rax,rax
  801f44:	48 01 d0             	add    rax,rdx
  801f47:	48 c1 e0 05          	shl    rax,0x5
  801f4b:	48 05 74 06 40 00    	add    rax,0x400674
  801f51:	8b 10                	mov    edx,DWORD PTR [rax]
  801f53:	8b 85 f4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x20c]
  801f59:	39 c2                	cmp    edx,eax
  801f5b:	75 13                	jne    801f70 <sys_open+0x33f>
        {
            if(mode==FILE_MODE_WRITE)
  801f5d:	83 bd d4 fd ff ff 02 	cmp    DWORD PTR [rbp-0x22c],0x2
  801f64:	75 0a                	jne    801f70 <sys_open+0x33f>
            {
                return -1;//读模式会重新给一个fno但是指向同一个文件
  801f66:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801f6b:	e9 84 01 00 00       	jmp    8020f4 <sys_open+0x4c3>
    for(i=0;i<MAX_OPEN_FILES;i++)
  801f70:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801f74:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  801f78:	7e 9e                	jle    801f18 <sys_open+0x2e7>
            }
        }
    }
    for(i=0;i<MAX_OPEN_FILES;i++)
  801f7a:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801f81:	eb 2b                	jmp    801fae <sys_open+0x37d>
    {
        if(!opened[i].mode) {
  801f83:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801f86:	48 63 d0             	movsxd rdx,eax
  801f89:	48 89 d0             	mov    rax,rdx
  801f8c:	48 01 c0             	add    rax,rax
  801f8f:	48 01 d0             	add    rax,rdx
  801f92:	48 c1 e0 05          	shl    rax,0x5
  801f96:	48 05 64 06 40 00    	add    rax,0x400664
  801f9c:	8b 00                	mov    eax,DWORD PTR [rax]
  801f9e:	85 c0                	test   eax,eax
  801fa0:	75 08                	jne    801faa <sys_open+0x379>
            j = i;
  801fa2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801fa5:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            break;
  801fa8:	eb 0a                	jmp    801fb4 <sys_open+0x383>
    for(i=0;i<MAX_OPEN_FILES;i++)
  801faa:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801fae:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  801fb2:	7e cf                	jle    801f83 <sys_open+0x352>
        }
    }
    if(j==-1)return -1;
  801fb4:	83 7d e8 ff          	cmp    DWORD PTR [rbp-0x18],0xffffffff
  801fb8:	75 0a                	jne    801fc4 <sys_open+0x393>
  801fba:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801fbf:	e9 30 01 00 00       	jmp    8020f4 <sys_open+0x4c3>
    opened[j]=entry;
  801fc4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801fc7:	48 63 d0             	movsxd rdx,eax
  801fca:	48 89 d0             	mov    rax,rdx
  801fcd:	48 01 c0             	add    rax,rax
  801fd0:	48 01 d0             	add    rax,rdx
  801fd3:	48 c1 e0 05          	shl    rax,0x5
  801fd7:	48 05 60 06 40 00    	add    rax,0x400660
  801fdd:	48 8b 8d e0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x220]
  801fe4:	48 8b 9d e8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x218]
  801feb:	48 89 08             	mov    QWORD PTR [rax],rcx
  801fee:	48 89 58 08          	mov    QWORD PTR [rax+0x8],rbx
  801ff2:	48 8b 8d f0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x210]
  801ff9:	48 8b 9d f8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x208]
  802000:	48 89 48 10          	mov    QWORD PTR [rax+0x10],rcx
  802004:	48 89 58 18          	mov    QWORD PTR [rax+0x18],rbx
  802008:	48 8b 8d 00 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x200]
  80200f:	48 8b 9d 08 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1f8]
  802016:	48 89 48 20          	mov    QWORD PTR [rax+0x20],rcx
  80201a:	48 89 58 28          	mov    QWORD PTR [rax+0x28],rbx
  80201e:	48 8b 8d 10 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1f0]
  802025:	48 8b 9d 18 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1e8]
  80202c:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
  802030:	48 89 58 38          	mov    QWORD PTR [rax+0x38],rbx
  802034:	48 8b 8d 20 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1e0]
  80203b:	48 8b 9d 28 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1d8]
  802042:	48 89 48 40          	mov    QWORD PTR [rax+0x40],rcx
  802046:	48 89 58 48          	mov    QWORD PTR [rax+0x48],rbx
  80204a:	48 8b 8d 30 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1d0]
  802051:	48 8b 9d 38 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1c8]
  802058:	48 89 48 50          	mov    QWORD PTR [rax+0x50],rcx
  80205c:	48 89 58 58          	mov    QWORD PTR [rax+0x58],rbx
    opened[j].fno=i;
  802060:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802063:	48 63 d0             	movsxd rdx,eax
  802066:	48 89 d0             	mov    rax,rdx
  802069:	48 01 c0             	add    rax,rax
  80206c:	48 01 d0             	add    rax,rdx
  80206f:	48 c1 e0 05          	shl    rax,0x5
  802073:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  80207a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80207d:	89 02                	mov    DWORD PTR [rdx],eax
    opened[j].link_c++;
  80207f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802082:	48 63 d0             	movsxd rdx,eax
  802085:	48 89 d0             	mov    rax,rdx
  802088:	48 01 c0             	add    rax,rax
  80208b:	48 01 d0             	add    rax,rdx
  80208e:	48 c1 e0 05          	shl    rax,0x5
  802092:	48 05 6c 06 40 00    	add    rax,0x40066c
  802098:	8b 00                	mov    eax,DWORD PTR [rax]
  80209a:	8d 48 01             	lea    ecx,[rax+0x1]
  80209d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8020a0:	48 63 d0             	movsxd rdx,eax
  8020a3:	48 89 d0             	mov    rax,rdx
  8020a6:	48 01 c0             	add    rax,rax
  8020a9:	48 01 d0             	add    rax,rdx
  8020ac:	48 c1 e0 05          	shl    rax,0x5
  8020b0:	48 05 6c 06 40 00    	add    rax,0x40066c
  8020b6:	89 08                	mov    DWORD PTR [rax],ecx
    add_proc_openf(&opened[j]);
  8020b8:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8020bb:	48 63 d0             	movsxd rdx,eax
  8020be:	48 89 d0             	mov    rax,rdx
  8020c1:	48 01 c0             	add    rax,rax
  8020c4:	48 01 d0             	add    rax,rdx
  8020c7:	48 c1 e0 05          	shl    rax,0x5
  8020cb:	48 05 60 06 40 00    	add    rax,0x400660
  8020d1:	48 89 c7             	mov    rdi,rax
  8020d4:	e8 70 26 00 00       	call   804749 <add_proc_openf>
    return opened[j].fno;
  8020d9:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8020dc:	48 63 d0             	movsxd rdx,eax
  8020df:	48 89 d0             	mov    rax,rdx
  8020e2:	48 01 c0             	add    rax,rax
  8020e5:	48 01 d0             	add    rax,rdx
  8020e8:	48 c1 e0 05          	shl    rax,0x5
  8020ec:	48 05 60 06 40 00    	add    rax,0x400660
  8020f2:	8b 00                	mov    eax,DWORD PTR [rax]
}
  8020f4:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8020f8:	c9                   	leave  
  8020f9:	c3                   	ret    

00000000008020fa <sys_close>:
int sys_close(int fno)
{
  8020fa:	f3 0f 1e fa          	endbr64 
  8020fe:	55                   	push   rbp
  8020ff:	48 89 e5             	mov    rbp,rsp
  802102:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  802105:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80210c:	eb 64                	jmp    802172 <sys_close+0x78>
    {
        if(opened[i].fno==fno)
  80210e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802111:	48 63 d0             	movsxd rdx,eax
  802114:	48 89 d0             	mov    rax,rdx
  802117:	48 01 c0             	add    rax,rax
  80211a:	48 01 d0             	add    rax,rdx
  80211d:	48 c1 e0 05          	shl    rax,0x5
  802121:	48 05 60 06 40 00    	add    rax,0x400660
  802127:	8b 00                	mov    eax,DWORD PTR [rax]
  802129:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80212c:	75 40                	jne    80216e <sys_close+0x74>
        {
            opened[i].link_c--;
  80212e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802131:	48 63 d0             	movsxd rdx,eax
  802134:	48 89 d0             	mov    rax,rdx
  802137:	48 01 c0             	add    rax,rax
  80213a:	48 01 d0             	add    rax,rdx
  80213d:	48 c1 e0 05          	shl    rax,0x5
  802141:	48 05 6c 06 40 00    	add    rax,0x40066c
  802147:	8b 00                	mov    eax,DWORD PTR [rax]
  802149:	8d 48 ff             	lea    ecx,[rax-0x1]
  80214c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80214f:	48 63 d0             	movsxd rdx,eax
  802152:	48 89 d0             	mov    rax,rdx
  802155:	48 01 c0             	add    rax,rax
  802158:	48 01 d0             	add    rax,rdx
  80215b:	48 c1 e0 05          	shl    rax,0x5
  80215f:	48 05 6c 06 40 00    	add    rax,0x40066c
  802165:	89 08                	mov    DWORD PTR [rax],ecx
            return 0;
  802167:	b8 00 00 00 00       	mov    eax,0x0
  80216c:	eb 0f                	jmp    80217d <sys_close+0x83>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  80216e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802172:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802176:	7e 96                	jle    80210e <sys_close+0x14>
        }
    }
    return -1;
  802178:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  80217d:	5d                   	pop    rbp
  80217e:	c3                   	ret    

000000000080217f <sys_write>:
int sys_write(int fno, char *src, int len)
{
  80217f:	f3 0f 1e fa          	endbr64 
  802183:	55                   	push   rbp
  802184:	48 89 e5             	mov    rbp,rsp
  802187:	48 83 ec 20          	sub    rsp,0x20
  80218b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80218e:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  802192:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  802195:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802198:	89 c7                	mov    edi,eax
  80219a:	e8 7d 01 00 00       	call   80231c <get_vfs_entry>
  80219f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  8021a3:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8021a8:	75 07                	jne    8021b1 <sys_write+0x32>
  8021aa:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8021af:	eb 5d                	jmp    80220e <sys_write+0x8f>
    if(f->type==FTYPE_REG)
  8021b1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021b5:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8021b8:	85 c0                	test   eax,eax
  8021ba:	75 18                	jne    8021d4 <sys_write+0x55>
    {
        return vfs_write_file(f,src,len);
  8021bc:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8021bf:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  8021c3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021c7:	48 89 ce             	mov    rsi,rcx
  8021ca:	48 89 c7             	mov    rdi,rax
  8021cd:	e8 67 03 00 00       	call   802539 <vfs_write_file>
  8021d2:	eb 3a                	jmp    80220e <sys_write+0x8f>
    }else if(f->type==FTYPE_BLKDEV)
  8021d4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021d8:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8021db:	83 f8 01             	cmp    eax,0x1
  8021de:	75 29                	jne    802209 <sys_write+0x8a>
    {
        int block=get_according_bnr(f);
  8021e0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021e4:	48 89 c7             	mov    rdi,rax
  8021e7:	e8 5b 04 00 00       	call   802647 <get_according_bnr>
  8021ec:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        return write_block(f->dev,block,src,len);
  8021ef:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021f3:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  8021f6:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  8021f9:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  8021fd:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  802200:	89 c7                	mov    edi,eax
  802202:	e8 13 07 00 00       	call   80291a <write_block>
  802207:	eb 05                	jmp    80220e <sys_write+0x8f>
    }
    return -1;
  802209:	b8 ff ff ff ff       	mov    eax,0xffffffff
            .src_addr=src,
            .len=len,
            .pos=pos
    };
    return ((driver*)vols[f->voln].fs_drv)->write(&args); */
}
  80220e:	c9                   	leave  
  80220f:	c3                   	ret    

0000000000802210 <sys_read>:
int sys_read(int fno, char *dist,  int len)
{
  802210:	f3 0f 1e fa          	endbr64 
  802214:	55                   	push   rbp
  802215:	48 89 e5             	mov    rbp,rsp
  802218:	48 83 ec 20          	sub    rsp,0x20
  80221c:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80221f:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  802223:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  802226:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802229:	89 c7                	mov    edi,eax
  80222b:	e8 ec 00 00 00       	call   80231c <get_vfs_entry>
  802230:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  802234:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802239:	75 07                	jne    802242 <sys_read+0x32>
  80223b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802240:	eb 5d                	jmp    80229f <sys_read+0x8f>
    if(f->type==FTYPE_REG)
  802242:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802246:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  802249:	85 c0                	test   eax,eax
  80224b:	75 18                	jne    802265 <sys_read+0x55>
    {
        return vfs_read_file(f,dist,len);
  80224d:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802250:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  802254:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802258:	48 89 ce             	mov    rsi,rcx
  80225b:	48 89 c7             	mov    rdi,rax
  80225e:	e8 37 02 00 00       	call   80249a <vfs_read_file>
  802263:	eb 3a                	jmp    80229f <sys_read+0x8f>
    }else if(f->type==FTYPE_BLKDEV)
  802265:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802269:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80226c:	83 f8 01             	cmp    eax,0x1
  80226f:	75 29                	jne    80229a <sys_read+0x8a>
    {
        int block=get_according_bnr(f);
  802271:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802275:	48 89 c7             	mov    rdi,rax
  802278:	e8 ca 03 00 00       	call   802647 <get_according_bnr>
  80227d:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        return read_block(f->dev,block,dist,len);
  802280:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802284:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  802287:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  80228a:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  80228e:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  802291:	89 c7                	mov    edi,eax
  802293:	e8 ff 06 00 00       	call   802997 <read_block>
  802298:	eb 05                	jmp    80229f <sys_read+0x8f>
    }
    return -1;
  80229a:	b8 ff ff ff ff       	mov    eax,0xffffffff
    //         .len=len,
    //         .pos=pos,
    //         .entry=*f
    // };
    // return ((driver*)vols[f->voln].fs_drv)->read(&args);
}
  80229f:	c9                   	leave  
  8022a0:	c3                   	ret    

00000000008022a1 <sys_seek>:
int sys_seek(int fno, int offset, int origin)
{
  8022a1:	f3 0f 1e fa          	endbr64 
  8022a5:	55                   	push   rbp
  8022a6:	48 89 e5             	mov    rbp,rsp
  8022a9:	48 83 ec 20          	sub    rsp,0x20
  8022ad:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8022b0:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8022b3:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  8022b6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8022b9:	89 c7                	mov    edi,eax
  8022bb:	e8 5c 00 00 00       	call   80231c <get_vfs_entry>
  8022c0:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  8022c4:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8022c9:	75 07                	jne    8022d2 <sys_seek+0x31>
  8022cb:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8022d0:	eb 14                	jmp    8022e6 <sys_seek+0x45>
    f->ptr=offset+origin;
  8022d2:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8022d5:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8022d8:	01 c2                	add    edx,eax
  8022da:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8022de:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
    return 0;
  8022e1:	b8 00 00 00 00       	mov    eax,0x0
}
  8022e6:	c9                   	leave  
  8022e7:	c3                   	ret    

00000000008022e8 <sys_tell>:
int sys_tell(int fno)
{
  8022e8:	f3 0f 1e fa          	endbr64 
  8022ec:	55                   	push   rbp
  8022ed:	48 89 e5             	mov    rbp,rsp
  8022f0:	48 83 ec 20          	sub    rsp,0x20
  8022f4:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    vfs_dir_entry *f= get_vfs_entry(fno);
  8022f7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8022fa:	89 c7                	mov    edi,eax
  8022fc:	e8 1b 00 00 00       	call   80231c <get_vfs_entry>
  802301:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  802305:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80230a:	75 07                	jne    802313 <sys_tell+0x2b>
  80230c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802311:	eb 07                	jmp    80231a <sys_tell+0x32>
    return f->ptr;
  802313:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802317:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  80231a:	c9                   	leave  
  80231b:	c3                   	ret    

000000000080231c <get_vfs_entry>:
vfs_dir_entry *get_vfs_entry(int fno)
{
  80231c:	f3 0f 1e fa          	endbr64 
  802320:	55                   	push   rbp
  802321:	48 89 e5             	mov    rbp,rsp
  802324:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  802327:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80232e:	eb 3f                	jmp    80236f <get_vfs_entry+0x53>
    {
        if(opened[i].fno==fno)
  802330:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802333:	48 63 d0             	movsxd rdx,eax
  802336:	48 89 d0             	mov    rax,rdx
  802339:	48 01 c0             	add    rax,rax
  80233c:	48 01 d0             	add    rax,rdx
  80233f:	48 c1 e0 05          	shl    rax,0x5
  802343:	48 05 60 06 40 00    	add    rax,0x400660
  802349:	8b 00                	mov    eax,DWORD PTR [rax]
  80234b:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80234e:	75 1b                	jne    80236b <get_vfs_entry+0x4f>
        {
            return &opened[i];
  802350:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802353:	48 63 d0             	movsxd rdx,eax
  802356:	48 89 d0             	mov    rax,rdx
  802359:	48 01 c0             	add    rax,rax
  80235c:	48 01 d0             	add    rax,rdx
  80235f:	48 c1 e0 05          	shl    rax,0x5
  802363:	48 05 60 06 40 00    	add    rax,0x400660
  802369:	eb 0f                	jmp    80237a <get_vfs_entry+0x5e>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  80236b:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80236f:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802373:	7e bb                	jle    802330 <get_vfs_entry+0x14>
        }
    }
    return NULL;
  802375:	b8 00 00 00 00       	mov    eax,0x0
}
  80237a:	5d                   	pop    rbp
  80237b:	c3                   	ret    

000000000080237c <brelse>:

//释放缓冲区（只释放这一块）
int brelse(buffer_head* bh)
{
  80237c:	f3 0f 1e fa          	endbr64 
  802380:	55                   	push   rbp
  802381:	48 89 e5             	mov    rbp,rsp
  802384:	48 83 ec 10          	sub    rsp,0x10
  802388:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    wait_on_buf(bh);
  80238c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802390:	48 89 c7             	mov    rdi,rax
  802393:	e8 a0 04 00 00       	call   802838 <wait_on_buf>
    if(bh->b_count==0)return -1;
  802398:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80239c:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  8023a0:	84 c0                	test   al,al
  8023a2:	75 07                	jne    8023ab <brelse+0x2f>
  8023a4:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8023a9:	eb 32                	jmp    8023dd <brelse+0x61>
    bh->b_count--;
  8023ab:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023af:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  8023b3:	8d 50 ff             	lea    edx,[rax-0x1]
  8023b6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023ba:	88 50 14             	mov    BYTE PTR [rax+0x14],dl
    if(bh->b_count==0)
  8023bd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023c1:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  8023c5:	84 c0                	test   al,al
  8023c7:	75 0f                	jne    8023d8 <brelse+0x5c>
        vmfree(bh->b_data);
  8023c9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023cd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8023d0:	48 89 c7             	mov    rdi,rax
  8023d3:	e8 db ed ff ff       	call   8011b3 <vmfree>
    return 0;
  8023d8:	b8 00 00 00 00       	mov    eax,0x0
}
  8023dd:	c9                   	leave  
  8023de:	c3                   	ret    

00000000008023df <bread>:
//从设备中读取指定设备的指定块并返回缓冲区
buffer_head* bread(int dev,int blk)
{
  8023df:	f3 0f 1e fa          	endbr64 
  8023e3:	55                   	push   rbp
  8023e4:	48 89 e5             	mov    rbp,rsp
  8023e7:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  8023ee:	89 bd 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],edi
  8023f4:	89 b5 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],esi

    buffer_head *bh=get_buf(dev,blk);
  8023fa:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  802400:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  802406:	89 d6                	mov    esi,edx
  802408:	89 c7                	mov    edi,eax
  80240a:	e8 78 02 00 00       	call   802687 <get_buf>
  80240f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!bh)return -1;//申请失败
  802413:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802418:	75 09                	jne    802423 <bread+0x44>
  80241a:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  802421:	eb 75                	jmp    802498 <bread+0xb9>
    if(!bh->b_uptodate)
  802423:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802427:	0f b6 40 12          	movzx  eax,BYTE PTR [rax+0x12]
  80242b:	84 c0                	test   al,al
  80242d:	75 65                	jne    802494 <bread+0xb5>
    {
        driver_args arg;
        arg.dev=dev;
  80242f:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  802435:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
        arg.cmd=DRVF_READ;
  802438:	c7 45 d8 02 00 00 00 	mov    DWORD PTR [rbp-0x28],0x2
        arg.dist_addr=bh->b_data;
  80243f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802443:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802446:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.len=BLOCK_SIZE;
  80244c:	c7 85 48 ff ff ff 00 	mov    DWORD PTR [rbp-0xb8],0x200
  802453:	02 00 00 
        arg.lba=bh->b_blocknr;
  802456:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80245a:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80245e:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
        arg.sec_c=BLOCK_SIZE/512;//之后会改
  802464:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  80246b:	00 00 00 
        //lock_buffer(bh);//锁定缓冲块直到读取完成
        int reqi=make_request(&arg);
  80246e:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  802475:	48 89 c7             	mov    rdi,rax
  802478:	e8 71 11 00 00       	call   8035ee <make_request>
  80247d:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        wait_on_req(reqi);
  802480:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802483:	89 c7                	mov    edi,eax
  802485:	e8 77 14 00 00       	call   803901 <wait_on_req>
        clear_req(reqi);
  80248a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80248d:	89 c7                	mov    edi,eax
  80248f:	e8 9d 14 00 00       	call   803931 <clear_req>
    }
    return bh;
  802494:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  802498:	c9                   	leave  
  802499:	c3                   	ret    

000000000080249a <vfs_read_file>:


int vfs_read_file(vfs_dir_entry *f,char *buf,int len)
{
  80249a:	f3 0f 1e fa          	endbr64 
  80249e:	55                   	push   rbp
  80249f:	48 89 e5             	mov    rbp,rsp
  8024a2:	48 83 ec 40          	sub    rsp,0x40
  8024a6:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  8024aa:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  8024ae:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  8024b1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8024b5:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  8024b8:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  8024bb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8024bf:	48 89 c7             	mov    rdi,rax
  8024c2:	e8 80 01 00 00       	call   802647 <get_according_bnr>
  8024c7:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=bread(dev,block);
  8024ca:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  8024cd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8024d0:	89 d6                	mov    esi,edx
  8024d2:	89 c7                	mov    edi,eax
  8024d4:	e8 06 ff ff ff       	call   8023df <bread>
  8024d9:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  8024dd:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8024e0:	ba 00 02 00 00       	mov    edx,0x200
  8024e5:	39 d0                	cmp    eax,edx
  8024e7:	0f 4f c2             	cmovg  eax,edx
  8024ea:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(buf,bh->b_data,size);
  8024ed:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8024f0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8024f4:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8024f7:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8024fb:	48 89 ce             	mov    rsi,rcx
  8024fe:	48 89 c7             	mov    rdi,rax
  802501:	e8 cb 7f 00 00       	call   80a4d1 <memcpy>
        len-=BLOCK_SIZE;
  802506:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  80250d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802511:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  802514:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802517:	01 c2                	add    edx,eax
  802519:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80251d:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        brelse(bh);
  802520:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802524:	48 89 c7             	mov    rdi,rax
  802527:	e8 50 fe ff ff       	call   80237c <brelse>
    }while(len>0);
  80252c:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  802530:	7f 89                	jg     8024bb <vfs_read_file+0x21>
    return 0;
  802532:	b8 00 00 00 00       	mov    eax,0x0
}
  802537:	c9                   	leave  
  802538:	c3                   	ret    

0000000000802539 <vfs_write_file>:
int vfs_write_file(vfs_dir_entry *f,char *buf,int len)
{
  802539:	f3 0f 1e fa          	endbr64 
  80253d:	55                   	push   rbp
  80253e:	48 89 e5             	mov    rbp,rsp
  802541:	48 83 ec 40          	sub    rsp,0x40
  802545:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  802549:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  80254d:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  802550:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802554:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  802557:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  80255a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80255e:	48 89 c7             	mov    rdi,rax
  802561:	e8 e1 00 00 00       	call   802647 <get_according_bnr>
  802566:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=get_buf(dev,block);
  802569:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  80256c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80256f:	89 d6                	mov    esi,edx
  802571:	89 c7                	mov    edi,eax
  802573:	e8 0f 01 00 00       	call   802687 <get_buf>
  802578:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  80257c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80257f:	ba 00 02 00 00       	mov    edx,0x200
  802584:	39 d0                	cmp    eax,edx
  802586:	0f 4f c2             	cmovg  eax,edx
  802589:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(bh->b_data,buf,size);
  80258c:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80258f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802593:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802596:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  80259a:	48 89 ce             	mov    rsi,rcx
  80259d:	48 89 c7             	mov    rdi,rax
  8025a0:	e8 2c 7f 00 00       	call   80a4d1 <memcpy>
        len-=BLOCK_SIZE;
  8025a5:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  8025ac:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8025b0:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8025b3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8025b6:	01 c2                	add    edx,eax
  8025b8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8025bc:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        bh->b_dirt=1;//修改置位
  8025bf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8025c3:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  8025c7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8025cb:	48 89 c7             	mov    rdi,rax
  8025ce:	e8 a9 fd ff ff       	call   80237c <brelse>
    }while(len>0);
  8025d3:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  8025d7:	7f 81                	jg     80255a <vfs_write_file+0x21>
    return 0;
  8025d9:	b8 00 00 00 00       	mov    eax,0x0
}
  8025de:	c9                   	leave  
  8025df:	c3                   	ret    

00000000008025e0 <vfs_seek_file>:

int vfs_seek_file(vfs_dir_entry *f,int offset,int origin)
{
  8025e0:	f3 0f 1e fa          	endbr64 
  8025e4:	55                   	push   rbp
  8025e5:	48 89 e5             	mov    rbp,rsp
  8025e8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8025ec:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  8025ef:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    switch (origin)
  8025f2:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  8025f6:	74 20                	je     802618 <vfs_seek_file+0x38>
  8025f8:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  8025fc:	7f 3f                	jg     80263d <vfs_seek_file+0x5d>
  8025fe:	83 7d f0 00          	cmp    DWORD PTR [rbp-0x10],0x0
  802602:	74 08                	je     80260c <vfs_seek_file+0x2c>
  802604:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  802608:	74 23                	je     80262d <vfs_seek_file+0x4d>
        break;
    case SEEK_END:
        f->ptr=f->size;
        break;
    default:
        break;
  80260a:	eb 31                	jmp    80263d <vfs_seek_file+0x5d>
        f->ptr=offset;
  80260c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802610:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802613:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  802616:	eb 26                	jmp    80263e <vfs_seek_file+0x5e>
        f->ptr+=offset;
  802618:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80261c:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  80261f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802622:	01 c2                	add    edx,eax
  802624:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802628:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  80262b:	eb 11                	jmp    80263e <vfs_seek_file+0x5e>
        f->ptr=f->size;
  80262d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802631:	8b 50 18             	mov    edx,DWORD PTR [rax+0x18]
  802634:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802638:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  80263b:	eb 01                	jmp    80263e <vfs_seek_file+0x5e>
        break;
  80263d:	90                   	nop
    }
    return f->ptr;
  80263e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802642:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  802645:	5d                   	pop    rbp
  802646:	c3                   	ret    

0000000000802647 <get_according_bnr>:
//返回文件ptr在块设备中的块号
int get_according_bnr(vfs_dir_entry *f)
{
  802647:	f3 0f 1e fa          	endbr64 
  80264b:	55                   	push   rbp
  80264c:	48 89 e5             	mov    rbp,rsp
  80264f:	48 83 ec 10          	sub    rsp,0x10
  802653:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return vols[f->voln].fs->get_according_bnr(f);
  802657:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80265b:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80265e:	48 63 d0             	movsxd rdx,eax
  802661:	48 89 d0             	mov    rax,rdx
  802664:	48 c1 e0 02          	shl    rax,0x2
  802668:	48 01 d0             	add    rax,rdx
  80266b:	48 c1 e0 03          	shl    rax,0x3
  80266f:	48 05 58 02 40 00    	add    rax,0x400258
  802675:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802678:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  80267c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802680:	48 89 c7             	mov    rdi,rax
  802683:	ff d2                	call   rdx

}
  802685:	c9                   	leave  
  802686:	c3                   	ret    

0000000000802687 <get_buf>:
//获取或者新建一个和dev上block相对应的缓冲区。
buffer_head* get_buf(int dev,int block)
{
  802687:	f3 0f 1e fa          	endbr64 
  80268b:	55                   	push   rbp
  80268c:	48 89 e5             	mov    rbp,rsp
  80268f:	48 83 ec 20          	sub    rsp,0x20
  802693:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802696:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802699:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8026a0:	e9 b9 00 00 00       	jmp    80275e <get_buf+0xd7>
    {
        if(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block)
  8026a5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8026a8:	48 98                	cdqe   
  8026aa:	48 c1 e0 06          	shl    rax,0x6
  8026ae:	48 05 90 26 40 00    	add    rax,0x402690
  8026b4:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8026b7:	0f b7 c0             	movzx  eax,ax
  8026ba:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8026bd:	0f 85 97 00 00 00    	jne    80275a <get_buf+0xd3>
  8026c3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8026c6:	48 98                	cdqe   
  8026c8:	48 c1 e0 06          	shl    rax,0x6
  8026cc:	48 05 88 26 40 00    	add    rax,0x402688
  8026d2:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8026d5:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8026d8:	48 98                	cdqe   
  8026da:	48 39 c2             	cmp    rdx,rax
  8026dd:	75 7b                	jne    80275a <get_buf+0xd3>
        {
            repeat:
  8026df:	90                   	nop
            wait_on_buf(&buffer_heads[i]);//等待解锁
  8026e0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8026e3:	48 98                	cdqe   
  8026e5:	48 c1 e0 06          	shl    rax,0x6
  8026e9:	48 05 80 26 40 00    	add    rax,0x402680
  8026ef:	48 89 c7             	mov    rdi,rax
  8026f2:	e8 41 01 00 00       	call   802838 <wait_on_buf>
            if(buffer_heads[i].b_count>0)//别的进程正在用
  8026f7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8026fa:	48 98                	cdqe   
  8026fc:	48 c1 e0 06          	shl    rax,0x6
  802700:	48 05 94 26 40 00    	add    rax,0x402694
  802706:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802709:	84 c0                	test   al,al
  80270b:	74 02                	je     80270f <get_buf+0x88>
                goto repeat;
  80270d:	eb d1                	jmp    8026e0 <get_buf+0x59>
            if(!(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block))//别的进程修改了
  80270f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802712:	48 98                	cdqe   
  802714:	48 c1 e0 06          	shl    rax,0x6
  802718:	48 05 90 26 40 00    	add    rax,0x402690
  80271e:	0f b7 00             	movzx  eax,WORD PTR [rax]
  802721:	0f b7 c0             	movzx  eax,ax
  802724:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  802727:	75 30                	jne    802759 <get_buf+0xd2>
  802729:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80272c:	48 98                	cdqe   
  80272e:	48 c1 e0 06          	shl    rax,0x6
  802732:	48 05 88 26 40 00    	add    rax,0x402688
  802738:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80273b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80273e:	48 98                	cdqe   
  802740:	48 39 c2             	cmp    rdx,rax
  802743:	75 14                	jne    802759 <get_buf+0xd2>
                continue;
            return &buffer_heads[i];
  802745:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802748:	48 98                	cdqe   
  80274a:	48 c1 e0 06          	shl    rax,0x6
  80274e:	48 05 80 26 40 00    	add    rax,0x402680
  802754:	e9 dd 00 00 00       	jmp    802836 <get_buf+0x1af>
                continue;
  802759:	90                   	nop
    for(int i=0;i<NR_BUFFERHEADS;i++)
  80275a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80275e:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  802762:	0f 8e 3d ff ff ff    	jle    8026a5 <get_buf+0x1e>
        }
    }
    //空头中找
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802768:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80276f:	e9 b8 00 00 00       	jmp    80282c <get_buf+0x1a5>
    {
        if(buffer_heads[i].b_count==0)
  802774:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802777:	48 98                	cdqe   
  802779:	48 c1 e0 06          	shl    rax,0x6
  80277d:	48 05 94 26 40 00    	add    rax,0x402694
  802783:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802786:	84 c0                	test   al,al
  802788:	0f 85 9a 00 00 00    	jne    802828 <get_buf+0x1a1>
        {
            if(buffer_heads[i].b_dirt)
  80278e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802791:	48 98                	cdqe   
  802793:	48 c1 e0 06          	shl    rax,0x6
  802797:	48 05 93 26 40 00    	add    rax,0x402693
  80279d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8027a0:	84 c0                	test   al,al
  8027a2:	74 2e                	je     8027d2 <get_buf+0x14b>
            {
                sync_buf(&buffer_heads[i]);
  8027a4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8027a7:	48 98                	cdqe   
  8027a9:	48 c1 e0 06          	shl    rax,0x6
  8027ad:	48 05 80 26 40 00    	add    rax,0x402680
  8027b3:	48 89 c7             	mov    rdi,rax
  8027b6:	e8 1b 01 00 00       	call   8028d6 <sync_buf>
                wait_on_buf(&buffer_heads[i]);
  8027bb:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8027be:	48 98                	cdqe   
  8027c0:	48 c1 e0 06          	shl    rax,0x6
  8027c4:	48 05 80 26 40 00    	add    rax,0x402680
  8027ca:	48 89 c7             	mov    rdi,rax
  8027cd:	e8 66 00 00 00       	call   802838 <wait_on_buf>
            }
            buffer_heads[i].b_count++;
  8027d2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8027d5:	48 98                	cdqe   
  8027d7:	48 c1 e0 06          	shl    rax,0x6
  8027db:	48 05 94 26 40 00    	add    rax,0x402694
  8027e1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8027e4:	8d 50 01             	lea    edx,[rax+0x1]
  8027e7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8027ea:	48 98                	cdqe   
  8027ec:	48 c1 e0 06          	shl    rax,0x6
  8027f0:	48 05 94 26 40 00    	add    rax,0x402694
  8027f6:	88 10                	mov    BYTE PTR [rax],dl
            //给buffer分配一个实际的缓冲区
            buffer_heads[i].b_data=vmalloc();
  8027f8:	b8 00 00 00 00       	mov    eax,0x0
  8027fd:	e8 22 e9 ff ff       	call   801124 <vmalloc>
  802802:	48 89 c2             	mov    rdx,rax
  802805:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802808:	48 98                	cdqe   
  80280a:	48 c1 e0 06          	shl    rax,0x6
  80280e:	48 05 80 26 40 00    	add    rax,0x402680
  802814:	48 89 10             	mov    QWORD PTR [rax],rdx
            return &buffer_heads[i];
  802817:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80281a:	48 98                	cdqe   
  80281c:	48 c1 e0 06          	shl    rax,0x6
  802820:	48 05 80 26 40 00    	add    rax,0x402680
  802826:	eb 0e                	jmp    802836 <get_buf+0x1af>
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802828:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80282c:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  802830:	0f 8e 3e ff ff ff    	jle    802774 <get_buf+0xed>
        }
    }
}
  802836:	c9                   	leave  
  802837:	c3                   	ret    

0000000000802838 <wait_on_buf>:

void wait_on_buf(buffer_head* bh)
{
  802838:	f3 0f 1e fa          	endbr64 
  80283c:	55                   	push   rbp
  80283d:	48 89 e5             	mov    rbp,rsp
  802840:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    //等待缓冲区解锁
    while (bh->b_lock);
  802844:	90                   	nop
  802845:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802849:	0f b6 40 15          	movzx  eax,BYTE PTR [rax+0x15]
  80284d:	84 c0                	test   al,al
  80284f:	75 f4                	jne    802845 <wait_on_buf+0xd>
    
}
  802851:	90                   	nop
  802852:	90                   	nop
  802853:	5d                   	pop    rbp
  802854:	c3                   	ret    

0000000000802855 <scan_dev>:

//扫描块设备，读取分区，识别文件系统
int scan_dev(int dev)
{
  802855:	f3 0f 1e fa          	endbr64 
  802859:	55                   	push   rbp
  80285a:	48 89 e5             	mov    rbp,rsp
  80285d:	48 83 ec 30          	sub    rsp,0x30
  802861:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
//    device *blkdev=get_dev(dev);
//    buffer_head* bh=bread(dev,0);
//    if(!bh)return -1;
    char* buf=vmalloc();
  802864:	b8 00 00 00 00       	mov    eax,0x0
  802869:	e8 b6 e8 ff ff       	call   801124 <vmalloc>
  80286e:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    int r=request(DISK_MAJOR_MAJOR,DISK_CMD_READ,0,1,buf);
  802872:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802876:	49 89 c0             	mov    r8,rax
  802879:	b9 01 00 00 00       	mov    ecx,0x1
  80287e:	ba 00 00 00 00       	mov    edx,0x0
  802883:	be 20 00 00 00       	mov    esi,0x20
  802888:	bf 00 00 00 00       	mov    edi,0x0
  80288d:	e8 c5 41 00 00       	call   806a57 <request>
  802892:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    chk_result(r);
  802895:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  802898:	89 c7                	mov    edi,eax
  80289a:	e8 6c 48 00 00       	call   80710b <chk_result>

    dpt_t* dpte=buf+0x1be;
  80289f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8028a3:	48 05 be 01 00 00    	add    rax,0x1be
  8028a9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(int i=0;i<4;i++)
  8028ad:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8028b4:	eb 13                	jmp    8028c9 <scan_dev+0x74>
    {
//        blkdev->par[i].type=dpte->type;
        int stlba=dpte->start_lba;
  8028b6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8028ba:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8028bd:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
//        {
//            printf("err:unrecognised partition fs.\n");
//        }

//        blkdev->par[i].end_sec=dpte->end_lba;
        dpte++;
  8028c0:	48 83 45 f8 10       	add    QWORD PTR [rbp-0x8],0x10
    for(int i=0;i<4;i++)
  8028c5:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8028c9:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8028cd:	7e e7                	jle    8028b6 <scan_dev+0x61>
    }
//    brelse(bh);
    return 0;
  8028cf:	b8 00 00 00 00       	mov    eax,0x0
}
  8028d4:	c9                   	leave  
  8028d5:	c3                   	ret    

00000000008028d6 <sync_buf>:

int sync_buf(buffer_head* bh)
{
  8028d6:	f3 0f 1e fa          	endbr64 
  8028da:	55                   	push   rbp
  8028db:	48 89 e5             	mov    rbp,rsp
  8028de:	48 83 ec 20          	sub    rsp,0x20
  8028e2:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int dev=bh->b_dev;
  8028e6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8028ea:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
  8028ee:	0f b7 c0             	movzx  eax,ax
  8028f1:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int block=bh->b_blocknr;
  8028f4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8028f8:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8028fc:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //这里需要调用块设备写函数write_block
    return write_block(dev,block,bh->b_data,BLOCK_SIZE);
  8028ff:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802903:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802906:	8b 75 f8             	mov    esi,DWORD PTR [rbp-0x8]
  802909:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80290c:	b9 00 02 00 00       	mov    ecx,0x200
  802911:	89 c7                	mov    edi,eax
  802913:	e8 02 00 00 00       	call   80291a <write_block>

}
  802918:	c9                   	leave  
  802919:	c3                   	ret    

000000000080291a <write_block>:
//操作块设备函数
int write_block(int dev,int block,char *buf,int len)
{
  80291a:	f3 0f 1e fa          	endbr64 
  80291e:	55                   	push   rbp
  80291f:	48 89 e5             	mov    rbp,rsp
  802922:	48 83 ec 30          	sub    rsp,0x30
  802926:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802929:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80292c:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  802930:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=get_buf(dev,block);
  802933:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802936:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802939:	89 d6                	mov    esi,edx
  80293b:	89 c7                	mov    edi,eax
  80293d:	e8 45 fd ff ff       	call   802687 <get_buf>
  802942:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802946:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  802949:	ba 00 02 00 00       	mov    edx,0x200
  80294e:	39 d0                	cmp    eax,edx
  802950:	0f 4f c2             	cmovg  eax,edx
  802953:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(bh->b_data,buf,size);
  802956:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802959:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80295d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802960:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  802964:	48 89 ce             	mov    rsi,rcx
  802967:	48 89 c7             	mov    rdi,rax
  80296a:	e8 62 7b 00 00       	call   80a4d1 <memcpy>
        len-=BLOCK_SIZE;
  80296f:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        bh->b_dirt=1;//修改置位
  802976:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80297a:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  80297e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802982:	48 89 c7             	mov    rdi,rax
  802985:	e8 f2 f9 ff ff       	call   80237c <brelse>
    }while(len>0);
  80298a:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  80298e:	7f a3                	jg     802933 <write_block+0x19>
    return 0;
  802990:	b8 00 00 00 00       	mov    eax,0x0
}
  802995:	c9                   	leave  
  802996:	c3                   	ret    

0000000000802997 <read_block>:
int read_block(int dev,int block,char* buf,int len)
{
  802997:	f3 0f 1e fa          	endbr64 
  80299b:	55                   	push   rbp
  80299c:	48 89 e5             	mov    rbp,rsp
  80299f:	48 83 ec 30          	sub    rsp,0x30
  8029a3:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8029a6:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8029a9:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  8029ad:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=bread(dev,block);
  8029b0:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8029b3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8029b6:	89 d6                	mov    esi,edx
  8029b8:	89 c7                	mov    edi,eax
  8029ba:	e8 20 fa ff ff       	call   8023df <bread>
  8029bf:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  8029c3:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8029c6:	ba 00 02 00 00       	mov    edx,0x200
  8029cb:	39 d0                	cmp    eax,edx
  8029cd:	0f 4f c2             	cmovg  eax,edx
  8029d0:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(buf,bh->b_data,size);
  8029d3:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8029d6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8029da:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8029dd:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8029e1:	48 89 ce             	mov    rsi,rcx
  8029e4:	48 89 c7             	mov    rdi,rax
  8029e7:	e8 e5 7a 00 00       	call   80a4d1 <memcpy>
        len-=BLOCK_SIZE;
  8029ec:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        brelse(bh);
  8029f3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8029f7:	48 89 c7             	mov    rdi,rax
  8029fa:	e8 7d f9 ff ff       	call   80237c <brelse>
    }while(len>0);
  8029ff:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  802a03:	7f ab                	jg     8029b0 <read_block+0x19>
    return 0;
  802a05:	b8 00 00 00 00       	mov    eax,0x0
}
  802a0a:	c9                   	leave  
  802a0b:	c3                   	ret    

0000000000802a0c <init_vfs>:

int init_vfs()
{
  802a0c:	f3 0f 1e fa          	endbr64 
  802a10:	55                   	push   rbp
  802a11:	48 89 e5             	mov    rbp,rsp
  802a14:	48 83 ec 10          	sub    rsp,0x10
    //扫描块设备
    extern device *dev_tree[];
    extern device devs[];
    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
  802a18:	48 8b 05 61 5a c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05a61]        # 408480 <dev_tree>
  802a1f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(;p;p=p->next)
  802a23:	eb 40                	jmp    802a65 <init_vfs+0x59>
    {
        if(scan_dev(p-devs)!=0)return -1;
  802a25:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802a29:	48 2d 80 2e 40 00    	sub    rax,0x402e80
  802a2f:	48 c1 f8 02          	sar    rax,0x2
  802a33:	48 89 c2             	mov    rdx,rax
  802a36:	48 b8 19 9c 8f c1 f9 	movabs rax,0x8f9c18f9c18f9c19
  802a3d:	18 9c 8f 
  802a40:	48 0f af c2          	imul   rax,rdx
  802a44:	89 c7                	mov    edi,eax
  802a46:	e8 0a fe ff ff       	call   802855 <scan_dev>
  802a4b:	85 c0                	test   eax,eax
  802a4d:	74 07                	je     802a56 <init_vfs+0x4a>
  802a4f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802a54:	eb 1b                	jmp    802a71 <init_vfs+0x65>
    for(;p;p=p->next)
  802a56:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802a5a:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802a61:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  802a65:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802a6a:	75 b9                	jne    802a25 <init_vfs+0x19>
    }

    return 0;
  802a6c:	b8 00 00 00 00       	mov    eax,0x0
}
  802a71:	c9                   	leave  
  802a72:	c3                   	ret    

0000000000802a73 <init_drvdev_man>:
    [OPERATIONS_KEYBOARD]=NULL,
    [OPERATIONS_MOUSE]=NULL
};
static int rhead=0,rtail=0;
int init_drvdev_man()
{
  802a73:	f3 0f 1e fa          	endbr64 
  802a77:	55                   	push   rbp
  802a78:	48 89 e5             	mov    rbp,rsp
}
  802a7b:	90                   	nop
  802a7c:	5d                   	pop    rbp
  802a7d:	c3                   	ret    

0000000000802a7e <load_driver>:
int load_driver(char *path)
{
  802a7e:	f3 0f 1e fa          	endbr64 
  802a82:	55                   	push   rbp
  802a83:	48 89 e5             	mov    rbp,rsp
  802a86:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    
}
  802a8a:	90                   	nop
  802a8b:	5d                   	pop    rbp
  802a8c:	c3                   	ret    

0000000000802a8d <reg_device>:

int reg_device(device* dev)
{
  802a8d:	f3 0f 1e fa          	endbr64 
  802a91:	55                   	push   rbp
  802a92:	48 89 e5             	mov    rbp,rsp
  802a95:	53                   	push   rbx
  802a96:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //TODO:查重

    //放入数组
    int i=0;
  802a9a:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<MAX_DEVICES;i++)
  802aa1:	e9 42 01 00 00       	jmp    802be8 <reg_device+0x15b>
    {
        if(devs[i].flag==DEV_FLAG_EMPTY)
  802aa6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802aa9:	48 63 d0             	movsxd rdx,eax
  802aac:	48 89 d0             	mov    rax,rdx
  802aaf:	48 c1 e0 02          	shl    rax,0x2
  802ab3:	48 01 d0             	add    rax,rdx
  802ab6:	48 c1 e0 02          	shl    rax,0x2
  802aba:	48 01 d0             	add    rax,rdx
  802abd:	48 c1 e0 03          	shl    rax,0x3
  802ac1:	48 05 90 2e 40 00    	add    rax,0x402e90
  802ac7:	8b 00                	mov    eax,DWORD PTR [rax]
  802ac9:	85 c0                	test   eax,eax
  802acb:	0f 85 13 01 00 00    	jne    802be4 <reg_device+0x157>
        {
            devs[i]=*dev;
  802ad1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802ad4:	48 63 d0             	movsxd rdx,eax
  802ad7:	48 89 d0             	mov    rax,rdx
  802ada:	48 c1 e0 02          	shl    rax,0x2
  802ade:	48 01 d0             	add    rax,rdx
  802ae1:	48 c1 e0 02          	shl    rax,0x2
  802ae5:	48 01 d0             	add    rax,rdx
  802ae8:	48 c1 e0 03          	shl    rax,0x3
  802aec:	48 8d 90 80 2e 40 00 	lea    rdx,[rax+0x402e80]
  802af3:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802af7:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802afa:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802afe:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802b01:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802b05:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802b09:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802b0d:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802b11:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802b15:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802b19:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802b1d:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802b21:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802b25:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802b29:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802b2d:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802b31:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802b35:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802b39:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802b3d:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802b41:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802b45:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802b49:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802b4d:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802b51:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802b55:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802b59:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802b5d:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802b61:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802b65:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802b69:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802b6d:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802b71:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802b75:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802b7c:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802b83:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802b8a:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  802b91:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802b98:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  802b9f:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802ba6:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  802bad:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
  802bb4:	48 89 82 a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rax
            devs[i].flag=DEV_FLAG_USED;
  802bbb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802bbe:	48 63 d0             	movsxd rdx,eax
  802bc1:	48 89 d0             	mov    rax,rdx
  802bc4:	48 c1 e0 02          	shl    rax,0x2
  802bc8:	48 01 d0             	add    rax,rdx
  802bcb:	48 c1 e0 02          	shl    rax,0x2
  802bcf:	48 01 d0             	add    rax,rdx
  802bd2:	48 c1 e0 03          	shl    rax,0x3
  802bd6:	48 05 90 2e 40 00    	add    rax,0x402e90
  802bdc:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            break;
  802be2:	eb 0e                	jmp    802bf2 <reg_device+0x165>
    for(;i<MAX_DEVICES;i++)
  802be4:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802be8:	83 7d f4 3f          	cmp    DWORD PTR [rbp-0xc],0x3f
  802bec:	0f 8e b4 fe ff ff    	jle    802aa6 <reg_device+0x19>
        }
    }
    if(i==MAX_DEVICES)
  802bf2:	83 7d f4 40          	cmp    DWORD PTR [rbp-0xc],0x40
  802bf6:	75 0a                	jne    802c02 <reg_device+0x175>
        return -1;
  802bf8:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802bfd:	e9 6d 01 00 00       	jmp    802d6f <reg_device+0x2e2>
    //添加到链表
    device* p=NULL,*neo=&devs[i],**pp;
  802c02:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  802c09:	00 
  802c0a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802c0d:	48 63 d0             	movsxd rdx,eax
  802c10:	48 89 d0             	mov    rax,rdx
  802c13:	48 c1 e0 02          	shl    rax,0x2
  802c17:	48 01 d0             	add    rax,rdx
  802c1a:	48 c1 e0 02          	shl    rax,0x2
  802c1e:	48 01 d0             	add    rax,rdx
  802c21:	48 c1 e0 03          	shl    rax,0x3
  802c25:	48 05 80 2e 40 00    	add    rax,0x402e80
  802c2b:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    switch (dev->type)
  802c2f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802c33:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802c36:	83 f8 03             	cmp    eax,0x3
  802c39:	74 3b                	je     802c76 <reg_device+0x1e9>
  802c3b:	83 f8 03             	cmp    eax,0x3
  802c3e:	7f 4b                	jg     802c8b <reg_device+0x1fe>
  802c40:	83 f8 01             	cmp    eax,0x1
  802c43:	74 07                	je     802c4c <reg_device+0x1bf>
  802c45:	83 f8 02             	cmp    eax,0x2
  802c48:	74 17                	je     802c61 <reg_device+0x1d4>
  802c4a:	eb 3f                	jmp    802c8b <reg_device+0x1fe>
    {
    case DEV_TYPE_BLKDEV:
        p=dev_tree[DEVTREE_BLKDEVI];pp=&dev_tree[DEVTREE_BLKDEVI];
  802c4c:	48 8b 05 2d 58 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0582d]        # 408480 <dev_tree>
  802c53:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802c57:	48 c7 45 e0 80 84 40 	mov    QWORD PTR [rbp-0x20],0x408480
  802c5e:	00 
        break;
  802c5f:	eb 34                	jmp    802c95 <reg_device+0x208>
    
    case DEV_TYPE_CHRDEV:
        p=dev_tree[DEVTREE_CHRDEVI];pp=&dev_tree[DEVTREE_CHRDEVI];
  802c61:	48 8b 05 20 58 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05820]        # 408488 <dev_tree+0x8>
  802c68:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802c6c:	48 c7 45 e0 88 84 40 	mov    QWORD PTR [rbp-0x20],0x408488
  802c73:	00 
        break;
  802c74:	eb 1f                	jmp    802c95 <reg_device+0x208>
        
    case DEV_TYPE_OTHERS:
        p=dev_tree[DEVTREE_OTHERDEVI];pp=&dev_tree[DEVTREE_OTHERDEVI];
  802c76:	48 8b 05 13 58 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05813]        # 408490 <dev_tree+0x10>
  802c7d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802c81:	48 c7 45 e0 90 84 40 	mov    QWORD PTR [rbp-0x20],0x408490
  802c88:	00 
        break;
  802c89:	eb 0a                	jmp    802c95 <reg_device+0x208>
    default:return -1;//不可能有其他情况
  802c8b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802c90:	e9 da 00 00 00       	jmp    802d6f <reg_device+0x2e2>
    }
    if(!p){
  802c95:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  802c9a:	75 2b                	jne    802cc7 <reg_device+0x23a>
        *pp=neo;
  802c9c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802ca0:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802ca4:	48 89 10             	mov    QWORD PTR [rax],rdx
        neo->prev=NULL;
  802ca7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802cab:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x0
  802cb2:	00 00 00 00 
  802cb6:	eb 3d                	jmp    802cf5 <reg_device+0x268>
    }
    else{
        for(;p->next;p=p->next);
  802cb8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802cbc:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802cc3:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802cc7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802ccb:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802cd2:	48 85 c0             	test   rax,rax
  802cd5:	75 e1                	jne    802cb8 <reg_device+0x22b>
        p->next=neo;
  802cd7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802cdb:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802cdf:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
        neo->prev=p;
  802ce6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802cea:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  802cee:	48 89 90 98 00 00 00 	mov    QWORD PTR [rax+0x98],rdx
    }
    neo->next=NULL;
  802cf5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802cf9:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x0
  802d00:	00 00 00 00 
    //设置相应的请求函数
    switch (neo->stype)
  802d04:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d08:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  802d0b:	83 f8 04             	cmp    eax,0x4
  802d0e:	74 3b                	je     802d4b <reg_device+0x2be>
  802d10:	83 f8 04             	cmp    eax,0x4
  802d13:	7f 56                	jg     802d6b <reg_device+0x2de>
  802d15:	83 f8 03             	cmp    eax,0x3
  802d18:	74 21                	je     802d3b <reg_device+0x2ae>
  802d1a:	83 f8 03             	cmp    eax,0x3
  802d1d:	7f 4c                	jg     802d6b <reg_device+0x2de>
  802d1f:	83 f8 01             	cmp    eax,0x1
  802d22:	74 07                	je     802d2b <reg_device+0x29e>
  802d24:	83 f8 02             	cmp    eax,0x2
  802d27:	74 32                	je     802d5b <reg_device+0x2ce>
        break;
    case DEV_STYPE_TTY:
        neo->operi=OPERATIONS_TTY;
        break;
    default:
        break;
  802d29:	eb 40                	jmp    802d6b <reg_device+0x2de>
        neo->operi=OPERATIONS_HD;
  802d2b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d2f:	c7 80 a0 00 00 00 00 	mov    DWORD PTR [rax+0xa0],0x0
  802d36:	00 00 00 
        break;
  802d39:	eb 31                	jmp    802d6c <reg_device+0x2df>
        neo->operi=OPERATIONS_MOUSE;
  802d3b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d3f:	c7 80 a0 00 00 00 02 	mov    DWORD PTR [rax+0xa0],0x2
  802d46:	00 00 00 
        break;
  802d49:	eb 21                	jmp    802d6c <reg_device+0x2df>
        neo->operi=OPERATIONS_KEYBOARD;
  802d4b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d4f:	c7 80 a0 00 00 00 03 	mov    DWORD PTR [rax+0xa0],0x3
  802d56:	00 00 00 
        break;
  802d59:	eb 11                	jmp    802d6c <reg_device+0x2df>
        neo->operi=OPERATIONS_TTY;
  802d5b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d5f:	c7 80 a0 00 00 00 01 	mov    DWORD PTR [rax+0xa0],0x1
  802d66:	00 00 00 
        break;
  802d69:	eb 01                	jmp    802d6c <reg_device+0x2df>
        break;
  802d6b:	90                   	nop
    }
    return i;
  802d6c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  802d6f:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802d73:	c9                   	leave  
  802d74:	c3                   	ret    

0000000000802d75 <reg_driver>:


int reg_driver(driver *drv)
{
  802d75:	f3 0f 1e fa          	endbr64 
  802d79:	55                   	push   rbp
  802d7a:	48 89 e5             	mov    rbp,rsp
  802d7d:	53                   	push   rbx
  802d7e:	48 89 7d e0          	mov    QWORD PTR [rbp-0x20],rdi
    for(int i=0;i<MAX_DRIVERS;i++)
  802d82:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  802d89:	e9 22 01 00 00       	jmp    802eb0 <reg_driver+0x13b>
    {
        if(drvs[i].flag==DRV_FLAG_EMPTY)
  802d8e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802d91:	48 63 d0             	movsxd rdx,eax
  802d94:	48 89 d0             	mov    rax,rdx
  802d97:	48 c1 e0 02          	shl    rax,0x2
  802d9b:	48 01 d0             	add    rax,rdx
  802d9e:	48 c1 e0 05          	shl    rax,0x5
  802da2:	48 05 80 58 40 00    	add    rax,0x405880
  802da8:	8b 00                	mov    eax,DWORD PTR [rax]
  802daa:	85 c0                	test   eax,eax
  802dac:	0f 85 fa 00 00 00    	jne    802eac <reg_driver+0x137>
        {
            drvs[i]=*drv;
  802db2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802db5:	48 63 d0             	movsxd rdx,eax
  802db8:	48 89 d0             	mov    rax,rdx
  802dbb:	48 c1 e0 02          	shl    rax,0x2
  802dbf:	48 01 d0             	add    rax,rdx
  802dc2:	48 c1 e0 05          	shl    rax,0x5
  802dc6:	48 8d 90 80 58 40 00 	lea    rdx,[rax+0x405880]
  802dcd:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802dd1:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802dd4:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802dd8:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802ddb:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802ddf:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802de3:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802de7:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802deb:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802def:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802df3:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802df7:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802dfb:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802dff:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802e03:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802e07:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802e0b:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802e0f:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802e13:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802e17:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802e1b:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802e1f:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802e23:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802e27:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802e2b:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802e2f:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802e33:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802e37:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802e3b:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802e3f:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802e43:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802e47:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802e4b:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802e4f:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802e56:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802e5d:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802e64:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  802e6b:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802e72:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  802e79:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802e80:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
            drvs[i].flag=DRV_FLAG_USED;
  802e87:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802e8a:	48 63 d0             	movsxd rdx,eax
  802e8d:	48 89 d0             	mov    rax,rdx
  802e90:	48 c1 e0 02          	shl    rax,0x2
  802e94:	48 01 d0             	add    rax,rdx
  802e97:	48 c1 e0 05          	shl    rax,0x5
  802e9b:	48 05 80 58 40 00    	add    rax,0x405880
  802ea1:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            return i;
  802ea7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802eaa:	eb 13                	jmp    802ebf <reg_driver+0x14a>
    for(int i=0;i<MAX_DRIVERS;i++)
  802eac:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802eb0:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  802eb4:	0f 8e d4 fe ff ff    	jle    802d8e <reg_driver+0x19>
        }
    }
    return -1;
  802eba:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802ebf:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802ec3:	c9                   	leave  
  802ec4:	c3                   	ret    

0000000000802ec5 <sys_find_dev>:

int sys_find_dev(char *name)
{
  802ec5:	f3 0f 1e fa          	endbr64 
  802ec9:	55                   	push   rbp
  802eca:	48 89 e5             	mov    rbp,rsp
  802ecd:	48 83 ec 20          	sub    rsp,0x20
  802ed1:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_DEVICES;i++)
  802ed5:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802edc:	eb 6c                	jmp    802f4a <sys_find_dev+0x85>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802ede:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802ee1:	48 63 d0             	movsxd rdx,eax
  802ee4:	48 89 d0             	mov    rax,rdx
  802ee7:	48 c1 e0 02          	shl    rax,0x2
  802eeb:	48 01 d0             	add    rax,rdx
  802eee:	48 c1 e0 02          	shl    rax,0x2
  802ef2:	48 01 d0             	add    rax,rdx
  802ef5:	48 c1 e0 03          	shl    rax,0x3
  802ef9:	48 05 90 2e 40 00    	add    rax,0x402e90
  802eff:	8b 00                	mov    eax,DWORD PTR [rax]
  802f01:	85 c0                	test   eax,eax
  802f03:	74 41                	je     802f46 <sys_find_dev+0x81>
  802f05:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f08:	48 63 d0             	movsxd rdx,eax
  802f0b:	48 89 d0             	mov    rax,rdx
  802f0e:	48 c1 e0 02          	shl    rax,0x2
  802f12:	48 01 d0             	add    rax,rdx
  802f15:	48 c1 e0 02          	shl    rax,0x2
  802f19:	48 01 d0             	add    rax,rdx
  802f1c:	48 c1 e0 03          	shl    rax,0x3
  802f20:	48 83 c0 10          	add    rax,0x10
  802f24:	48 05 80 2e 40 00    	add    rax,0x402e80
  802f2a:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802f2e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802f32:	48 89 d6             	mov    rsi,rdx
  802f35:	48 89 c7             	mov    rdi,rax
  802f38:	e8 32 78 00 00       	call   80a76f <strcmp>
  802f3d:	85 c0                	test   eax,eax
  802f3f:	75 05                	jne    802f46 <sys_find_dev+0x81>
            return i;
  802f41:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f44:	eb 0f                	jmp    802f55 <sys_find_dev+0x90>
    for(int i=0;i<MAX_DEVICES;i++)
  802f46:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802f4a:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802f4e:	7e 8e                	jle    802ede <sys_find_dev+0x19>
    }
    return -1;
  802f50:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802f55:	c9                   	leave  
  802f56:	c3                   	ret    

0000000000802f57 <sys_operate_dev>:

int sys_operate_dev(char *name,int func,driver_args* args)
{
  802f57:	f3 0f 1e fa          	endbr64 
  802f5b:	55                   	push   rbp
  802f5c:	48 89 e5             	mov    rbp,rsp
  802f5f:	48 83 ec 30          	sub    rsp,0x30
  802f63:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802f67:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  802f6a:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    int i=0;
  802f6e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;i<MAX_DEVICES;i++)
  802f75:	eb 67                	jmp    802fde <sys_operate_dev+0x87>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802f77:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f7a:	48 63 d0             	movsxd rdx,eax
  802f7d:	48 89 d0             	mov    rax,rdx
  802f80:	48 c1 e0 02          	shl    rax,0x2
  802f84:	48 01 d0             	add    rax,rdx
  802f87:	48 c1 e0 02          	shl    rax,0x2
  802f8b:	48 01 d0             	add    rax,rdx
  802f8e:	48 c1 e0 03          	shl    rax,0x3
  802f92:	48 05 90 2e 40 00    	add    rax,0x402e90
  802f98:	8b 00                	mov    eax,DWORD PTR [rax]
  802f9a:	85 c0                	test   eax,eax
  802f9c:	74 3c                	je     802fda <sys_operate_dev+0x83>
  802f9e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802fa1:	48 63 d0             	movsxd rdx,eax
  802fa4:	48 89 d0             	mov    rax,rdx
  802fa7:	48 c1 e0 02          	shl    rax,0x2
  802fab:	48 01 d0             	add    rax,rdx
  802fae:	48 c1 e0 02          	shl    rax,0x2
  802fb2:	48 01 d0             	add    rax,rdx
  802fb5:	48 c1 e0 03          	shl    rax,0x3
  802fb9:	48 83 c0 10          	add    rax,0x10
  802fbd:	48 05 80 2e 40 00    	add    rax,0x402e80
  802fc3:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802fc7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802fcb:	48 89 d6             	mov    rsi,rdx
  802fce:	48 89 c7             	mov    rdi,rax
  802fd1:	e8 99 77 00 00       	call   80a76f <strcmp>
  802fd6:	85 c0                	test   eax,eax
  802fd8:	74 0c                	je     802fe6 <sys_operate_dev+0x8f>
    for(;i<MAX_DEVICES;i++)
  802fda:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802fde:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802fe2:	7e 93                	jle    802f77 <sys_operate_dev+0x20>
  802fe4:	eb 01                	jmp    802fe7 <sys_operate_dev+0x90>
            break;
  802fe6:	90                   	nop
    }
    if(i==MAX_DEVICES)return -1;
  802fe7:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  802feb:	75 0a                	jne    802ff7 <sys_operate_dev+0xa0>
  802fed:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802ff2:	e9 9c 02 00 00       	jmp    803293 <sys_operate_dev+0x33c>
    switch (func) {
  802ff7:	83 7d e4 0b          	cmp    DWORD PTR [rbp-0x1c],0xb
  802ffb:	0f 87 8d 02 00 00    	ja     80328e <sys_operate_dev+0x337>
  803001:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  803004:	48 8b 04 c5 08 2a 81 	mov    rax,QWORD PTR [rax*8+0x812a08]
  80300b:	00 
  80300c:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return devs[i].drv->open(args);
  80300f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803012:	48 63 d0             	movsxd rdx,eax
  803015:	48 89 d0             	mov    rax,rdx
  803018:	48 c1 e0 02          	shl    rax,0x2
  80301c:	48 01 d0             	add    rax,rdx
  80301f:	48 c1 e0 02          	shl    rax,0x2
  803023:	48 01 d0             	add    rax,rdx
  803026:	48 c1 e0 03          	shl    rax,0x3
  80302a:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803030:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803033:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  803037:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80303b:	48 89 c7             	mov    rdi,rax
  80303e:	ff d2                	call   rdx
  803040:	e9 4e 02 00 00       	jmp    803293 <sys_operate_dev+0x33c>
        case DRVF_CLOSE:return devs[i].drv->close(args);
  803045:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803048:	48 63 d0             	movsxd rdx,eax
  80304b:	48 89 d0             	mov    rax,rdx
  80304e:	48 c1 e0 02          	shl    rax,0x2
  803052:	48 01 d0             	add    rax,rdx
  803055:	48 c1 e0 02          	shl    rax,0x2
  803059:	48 01 d0             	add    rax,rdx
  80305c:	48 c1 e0 03          	shl    rax,0x3
  803060:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803066:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803069:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  80306d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803071:	48 89 c7             	mov    rdi,rax
  803074:	ff d2                	call   rdx
  803076:	e9 18 02 00 00       	jmp    803293 <sys_operate_dev+0x33c>
        case DRVF_READ :return devs[i].drv->read(args);
  80307b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80307e:	48 63 d0             	movsxd rdx,eax
  803081:	48 89 d0             	mov    rax,rdx
  803084:	48 c1 e0 02          	shl    rax,0x2
  803088:	48 01 d0             	add    rax,rdx
  80308b:	48 c1 e0 02          	shl    rax,0x2
  80308f:	48 01 d0             	add    rax,rdx
  803092:	48 c1 e0 03          	shl    rax,0x3
  803096:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80309c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80309f:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  8030a3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8030a7:	48 89 c7             	mov    rdi,rax
  8030aa:	ff d2                	call   rdx
  8030ac:	e9 e2 01 00 00       	jmp    803293 <sys_operate_dev+0x33c>
        case DRVF_WRITE:return devs[i].drv->write(args);
  8030b1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8030b4:	48 63 d0             	movsxd rdx,eax
  8030b7:	48 89 d0             	mov    rax,rdx
  8030ba:	48 c1 e0 02          	shl    rax,0x2
  8030be:	48 01 d0             	add    rax,rdx
  8030c1:	48 c1 e0 02          	shl    rax,0x2
  8030c5:	48 01 d0             	add    rax,rdx
  8030c8:	48 c1 e0 03          	shl    rax,0x3
  8030cc:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8030d2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8030d5:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  8030d9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8030dd:	48 89 c7             	mov    rdi,rax
  8030e0:	ff d2                	call   rdx
  8030e2:	e9 ac 01 00 00       	jmp    803293 <sys_operate_dev+0x33c>
        case DRVF_CHK  :return devs[i].drv->check(args);
  8030e7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8030ea:	48 63 d0             	movsxd rdx,eax
  8030ed:	48 89 d0             	mov    rax,rdx
  8030f0:	48 c1 e0 02          	shl    rax,0x2
  8030f4:	48 01 d0             	add    rax,rdx
  8030f7:	48 c1 e0 02          	shl    rax,0x2
  8030fb:	48 01 d0             	add    rax,rdx
  8030fe:	48 c1 e0 03          	shl    rax,0x3
  803102:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803108:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80310b:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  80310f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803113:	48 89 c7             	mov    rdi,rax
  803116:	ff d2                	call   rdx
  803118:	e9 76 01 00 00       	jmp    803293 <sys_operate_dev+0x33c>
        case DRVF_RSVD :return devs[i].drv->reserved(args);
  80311d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803120:	48 63 d0             	movsxd rdx,eax
  803123:	48 89 d0             	mov    rax,rdx
  803126:	48 c1 e0 02          	shl    rax,0x2
  80312a:	48 01 d0             	add    rax,rdx
  80312d:	48 c1 e0 02          	shl    rax,0x2
  803131:	48 01 d0             	add    rax,rdx
  803134:	48 c1 e0 03          	shl    rax,0x3
  803138:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80313e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803141:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
  803145:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803149:	48 89 c7             	mov    rdi,rax
  80314c:	ff d2                	call   rdx
  80314e:	e9 40 01 00 00       	jmp    803293 <sys_operate_dev+0x33c>
        case DRVF_INT  :return devs[i].drv->inthandler(args);
  803153:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803156:	48 63 d0             	movsxd rdx,eax
  803159:	48 89 d0             	mov    rax,rdx
  80315c:	48 c1 e0 02          	shl    rax,0x2
  803160:	48 01 d0             	add    rax,rdx
  803163:	48 c1 e0 02          	shl    rax,0x2
  803167:	48 01 d0             	add    rax,rdx
  80316a:	48 c1 e0 03          	shl    rax,0x3
  80316e:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803174:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803177:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
  80317b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80317f:	48 89 c7             	mov    rdi,rax
  803182:	ff d2                	call   rdx
  803184:	e9 0a 01 00 00       	jmp    803293 <sys_operate_dev+0x33c>
        case DRVF_FIND :return devs[i].drv->find(args);
  803189:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80318c:	48 63 d0             	movsxd rdx,eax
  80318f:	48 89 d0             	mov    rax,rdx
  803192:	48 c1 e0 02          	shl    rax,0x2
  803196:	48 01 d0             	add    rax,rdx
  803199:	48 c1 e0 02          	shl    rax,0x2
  80319d:	48 01 d0             	add    rax,rdx
  8031a0:	48 c1 e0 03          	shl    rax,0x3
  8031a4:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8031aa:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8031ad:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  8031b1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8031b5:	48 89 c7             	mov    rdi,rax
  8031b8:	ff d2                	call   rdx
  8031ba:	e9 d4 00 00 00       	jmp    803293 <sys_operate_dev+0x33c>
        case DRVF_RM   :return devs[i].drv->rm(args);
  8031bf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8031c2:	48 63 d0             	movsxd rdx,eax
  8031c5:	48 89 d0             	mov    rax,rdx
  8031c8:	48 c1 e0 02          	shl    rax,0x2
  8031cc:	48 01 d0             	add    rax,rdx
  8031cf:	48 c1 e0 02          	shl    rax,0x2
  8031d3:	48 01 d0             	add    rax,rdx
  8031d6:	48 c1 e0 03          	shl    rax,0x3
  8031da:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8031e0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8031e3:	48 8b 50 48          	mov    rdx,QWORD PTR [rax+0x48]
  8031e7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8031eb:	48 89 c7             	mov    rdi,rax
  8031ee:	ff d2                	call   rdx
  8031f0:	e9 9e 00 00 00       	jmp    803293 <sys_operate_dev+0x33c>
        case DRVF_TOUCH:return devs[i].drv->touch(args);
  8031f5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8031f8:	48 63 d0             	movsxd rdx,eax
  8031fb:	48 89 d0             	mov    rax,rdx
  8031fe:	48 c1 e0 02          	shl    rax,0x2
  803202:	48 01 d0             	add    rax,rdx
  803205:	48 c1 e0 02          	shl    rax,0x2
  803209:	48 01 d0             	add    rax,rdx
  80320c:	48 c1 e0 03          	shl    rax,0x3
  803210:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803216:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803219:	48 8b 50 50          	mov    rdx,QWORD PTR [rax+0x50]
  80321d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803221:	48 89 c7             	mov    rdi,rax
  803224:	ff d2                	call   rdx
  803226:	eb 6b                	jmp    803293 <sys_operate_dev+0x33c>
        case DRVF_MKDIR:return devs[i].drv->mkdir(args);
  803228:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80322b:	48 63 d0             	movsxd rdx,eax
  80322e:	48 89 d0             	mov    rax,rdx
  803231:	48 c1 e0 02          	shl    rax,0x2
  803235:	48 01 d0             	add    rax,rdx
  803238:	48 c1 e0 02          	shl    rax,0x2
  80323c:	48 01 d0             	add    rax,rdx
  80323f:	48 c1 e0 03          	shl    rax,0x3
  803243:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803249:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80324c:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  803250:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803254:	48 89 c7             	mov    rdi,rax
  803257:	ff d2                	call   rdx
  803259:	eb 38                	jmp    803293 <sys_operate_dev+0x33c>
        case DRVF_LS:return    devs[i].drv->ls(args);
  80325b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80325e:	48 63 d0             	movsxd rdx,eax
  803261:	48 89 d0             	mov    rax,rdx
  803264:	48 c1 e0 02          	shl    rax,0x2
  803268:	48 01 d0             	add    rax,rdx
  80326b:	48 c1 e0 02          	shl    rax,0x2
  80326f:	48 01 d0             	add    rax,rdx
  803272:	48 c1 e0 03          	shl    rax,0x3
  803276:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80327c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80327f:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
  803283:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803287:	48 89 c7             	mov    rdi,rax
  80328a:	ff d2                	call   rdx
  80328c:	eb 05                	jmp    803293 <sys_operate_dev+0x33c>
    }
    return -1;
  80328e:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  803293:	c9                   	leave  
  803294:	c3                   	ret    

0000000000803295 <call_drv_func>:
int call_drv_func(int drv_n,int func_n,driver_args *args)
{
  803295:	f3 0f 1e fa          	endbr64 
  803299:	55                   	push   rbp
  80329a:	48 89 e5             	mov    rbp,rsp
  80329d:	48 83 ec 10          	sub    rsp,0x10
  8032a1:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  8032a4:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  8032a7:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    if(drvs[drv_n].flag==DRV_FLAG_EMPTY)return -1;
  8032ab:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032ae:	48 63 d0             	movsxd rdx,eax
  8032b1:	48 89 d0             	mov    rax,rdx
  8032b4:	48 c1 e0 02          	shl    rax,0x2
  8032b8:	48 01 d0             	add    rax,rdx
  8032bb:	48 c1 e0 05          	shl    rax,0x5
  8032bf:	48 05 80 58 40 00    	add    rax,0x405880
  8032c5:	8b 00                	mov    eax,DWORD PTR [rax]
  8032c7:	85 c0                	test   eax,eax
  8032c9:	75 0a                	jne    8032d5 <call_drv_func+0x40>
  8032cb:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8032d0:	e9 15 02 00 00       	jmp    8034ea <call_drv_func+0x255>
    /*driverfunc f=drvs[drv_n].func_thunk[func_n];
    return f(args);*/
    switch (func_n) {
  8032d5:	83 7d f8 0b          	cmp    DWORD PTR [rbp-0x8],0xb
  8032d9:	0f 87 06 02 00 00    	ja     8034e5 <call_drv_func+0x250>
  8032df:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8032e2:	48 8b 04 c5 68 2a 81 	mov    rax,QWORD PTR [rax*8+0x812a68]
  8032e9:	00 
  8032ea:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return drvs[drv_n].open(args);
  8032ed:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032f0:	48 63 d0             	movsxd rdx,eax
  8032f3:	48 89 d0             	mov    rax,rdx
  8032f6:	48 c1 e0 02          	shl    rax,0x2
  8032fa:	48 01 d0             	add    rax,rdx
  8032fd:	48 c1 e0 05          	shl    rax,0x5
  803301:	48 05 88 58 40 00    	add    rax,0x405888
  803307:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80330a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80330e:	48 89 c7             	mov    rdi,rax
  803311:	ff d2                	call   rdx
  803313:	e9 d2 01 00 00       	jmp    8034ea <call_drv_func+0x255>
        case DRVF_CLOSE:return drvs[drv_n].close(args);
  803318:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80331b:	48 63 d0             	movsxd rdx,eax
  80331e:	48 89 d0             	mov    rax,rdx
  803321:	48 c1 e0 02          	shl    rax,0x2
  803325:	48 01 d0             	add    rax,rdx
  803328:	48 c1 e0 05          	shl    rax,0x5
  80332c:	48 05 90 58 40 00    	add    rax,0x405890
  803332:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803335:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803339:	48 89 c7             	mov    rdi,rax
  80333c:	ff d2                	call   rdx
  80333e:	e9 a7 01 00 00       	jmp    8034ea <call_drv_func+0x255>
        case DRVF_READ :return drvs[drv_n].read(args);
  803343:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803346:	48 63 d0             	movsxd rdx,eax
  803349:	48 89 d0             	mov    rax,rdx
  80334c:	48 c1 e0 02          	shl    rax,0x2
  803350:	48 01 d0             	add    rax,rdx
  803353:	48 c1 e0 05          	shl    rax,0x5
  803357:	48 05 98 58 40 00    	add    rax,0x405898
  80335d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803360:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803364:	48 89 c7             	mov    rdi,rax
  803367:	ff d2                	call   rdx
  803369:	e9 7c 01 00 00       	jmp    8034ea <call_drv_func+0x255>
        case DRVF_WRITE:return drvs[drv_n].write(args);
  80336e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803371:	48 63 d0             	movsxd rdx,eax
  803374:	48 89 d0             	mov    rax,rdx
  803377:	48 c1 e0 02          	shl    rax,0x2
  80337b:	48 01 d0             	add    rax,rdx
  80337e:	48 c1 e0 05          	shl    rax,0x5
  803382:	48 05 a0 58 40 00    	add    rax,0x4058a0
  803388:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80338b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80338f:	48 89 c7             	mov    rdi,rax
  803392:	ff d2                	call   rdx
  803394:	e9 51 01 00 00       	jmp    8034ea <call_drv_func+0x255>
        case DRVF_CHK  :return drvs[drv_n].check(args);
  803399:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80339c:	48 63 d0             	movsxd rdx,eax
  80339f:	48 89 d0             	mov    rax,rdx
  8033a2:	48 c1 e0 02          	shl    rax,0x2
  8033a6:	48 01 d0             	add    rax,rdx
  8033a9:	48 c1 e0 05          	shl    rax,0x5
  8033ad:	48 05 a8 58 40 00    	add    rax,0x4058a8
  8033b3:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8033b6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033ba:	48 89 c7             	mov    rdi,rax
  8033bd:	ff d2                	call   rdx
  8033bf:	e9 26 01 00 00       	jmp    8034ea <call_drv_func+0x255>
        case DRVF_RSVD :return drvs[drv_n].reserved(args);
  8033c4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8033c7:	48 63 d0             	movsxd rdx,eax
  8033ca:	48 89 d0             	mov    rax,rdx
  8033cd:	48 c1 e0 02          	shl    rax,0x2
  8033d1:	48 01 d0             	add    rax,rdx
  8033d4:	48 c1 e0 05          	shl    rax,0x5
  8033d8:	48 05 b0 58 40 00    	add    rax,0x4058b0
  8033de:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8033e1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033e5:	48 89 c7             	mov    rdi,rax
  8033e8:	ff d2                	call   rdx
  8033ea:	e9 fb 00 00 00       	jmp    8034ea <call_drv_func+0x255>
        case DRVF_INT  :return drvs[drv_n].inthandler(args);
  8033ef:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8033f2:	48 63 d0             	movsxd rdx,eax
  8033f5:	48 89 d0             	mov    rax,rdx
  8033f8:	48 c1 e0 02          	shl    rax,0x2
  8033fc:	48 01 d0             	add    rax,rdx
  8033ff:	48 c1 e0 05          	shl    rax,0x5
  803403:	48 05 b8 58 40 00    	add    rax,0x4058b8
  803409:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80340c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803410:	48 89 c7             	mov    rdi,rax
  803413:	ff d2                	call   rdx
  803415:	e9 d0 00 00 00       	jmp    8034ea <call_drv_func+0x255>
        case DRVF_FIND :return drvs[drv_n].find(args);
  80341a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80341d:	48 63 d0             	movsxd rdx,eax
  803420:	48 89 d0             	mov    rax,rdx
  803423:	48 c1 e0 02          	shl    rax,0x2
  803427:	48 01 d0             	add    rax,rdx
  80342a:	48 c1 e0 05          	shl    rax,0x5
  80342e:	48 05 c0 58 40 00    	add    rax,0x4058c0
  803434:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803437:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80343b:	48 89 c7             	mov    rdi,rax
  80343e:	ff d2                	call   rdx
  803440:	e9 a5 00 00 00       	jmp    8034ea <call_drv_func+0x255>
        case DRVF_RM   :return drvs[drv_n].rm(args);
  803445:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803448:	48 63 d0             	movsxd rdx,eax
  80344b:	48 89 d0             	mov    rax,rdx
  80344e:	48 c1 e0 02          	shl    rax,0x2
  803452:	48 01 d0             	add    rax,rdx
  803455:	48 c1 e0 05          	shl    rax,0x5
  803459:	48 05 c8 58 40 00    	add    rax,0x4058c8
  80345f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803462:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803466:	48 89 c7             	mov    rdi,rax
  803469:	ff d2                	call   rdx
  80346b:	eb 7d                	jmp    8034ea <call_drv_func+0x255>
        case DRVF_TOUCH:return drvs[drv_n].touch(args);
  80346d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803470:	48 63 d0             	movsxd rdx,eax
  803473:	48 89 d0             	mov    rax,rdx
  803476:	48 c1 e0 02          	shl    rax,0x2
  80347a:	48 01 d0             	add    rax,rdx
  80347d:	48 c1 e0 05          	shl    rax,0x5
  803481:	48 05 d0 58 40 00    	add    rax,0x4058d0
  803487:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80348a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80348e:	48 89 c7             	mov    rdi,rax
  803491:	ff d2                	call   rdx
  803493:	eb 55                	jmp    8034ea <call_drv_func+0x255>
        case DRVF_MKDIR:return drvs[drv_n].mkdir(args);
  803495:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803498:	48 63 d0             	movsxd rdx,eax
  80349b:	48 89 d0             	mov    rax,rdx
  80349e:	48 c1 e0 02          	shl    rax,0x2
  8034a2:	48 01 d0             	add    rax,rdx
  8034a5:	48 c1 e0 05          	shl    rax,0x5
  8034a9:	48 05 d8 58 40 00    	add    rax,0x4058d8
  8034af:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8034b2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8034b6:	48 89 c7             	mov    rdi,rax
  8034b9:	ff d2                	call   rdx
  8034bb:	eb 2d                	jmp    8034ea <call_drv_func+0x255>
        case DRVF_LS:return drvs[drv_n].ls(args);
  8034bd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034c0:	48 63 d0             	movsxd rdx,eax
  8034c3:	48 89 d0             	mov    rax,rdx
  8034c6:	48 c1 e0 02          	shl    rax,0x2
  8034ca:	48 01 d0             	add    rax,rdx
  8034cd:	48 c1 e0 05          	shl    rax,0x5
  8034d1:	48 05 e0 58 40 00    	add    rax,0x4058e0
  8034d7:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8034da:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8034de:	48 89 c7             	mov    rdi,rax
  8034e1:	ff d2                	call   rdx
  8034e3:	eb 05                	jmp    8034ea <call_drv_func+0x255>
    }
    return -1;
  8034e5:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8034ea:	c9                   	leave  
  8034eb:	c3                   	ret    

00000000008034ec <dispose_device>:
int dispose_device(int dev){
  8034ec:	f3 0f 1e fa          	endbr64 
  8034f0:	55                   	push   rbp
  8034f1:	48 89 e5             	mov    rbp,rsp
  8034f4:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(devs[dev].flag!=DEV_FLAG_USED)return -1;
  8034f7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8034fa:	48 63 d0             	movsxd rdx,eax
  8034fd:	48 89 d0             	mov    rax,rdx
  803500:	48 c1 e0 02          	shl    rax,0x2
  803504:	48 01 d0             	add    rax,rdx
  803507:	48 c1 e0 02          	shl    rax,0x2
  80350b:	48 01 d0             	add    rax,rdx
  80350e:	48 c1 e0 03          	shl    rax,0x3
  803512:	48 05 90 2e 40 00    	add    rax,0x402e90
  803518:	8b 00                	mov    eax,DWORD PTR [rax]
  80351a:	83 f8 01             	cmp    eax,0x1
  80351d:	74 07                	je     803526 <dispose_device+0x3a>
  80351f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803524:	eb 62                	jmp    803588 <dispose_device+0x9c>
    device* p=&devs[dev];
  803526:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803529:	48 63 d0             	movsxd rdx,eax
  80352c:	48 89 d0             	mov    rax,rdx
  80352f:	48 c1 e0 02          	shl    rax,0x2
  803533:	48 01 d0             	add    rax,rdx
  803536:	48 c1 e0 02          	shl    rax,0x2
  80353a:	48 01 d0             	add    rax,rdx
  80353d:	48 c1 e0 03          	shl    rax,0x3
  803541:	48 05 80 2e 40 00    	add    rax,0x402e80
  803547:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //从链表删除
    if(p->prev)p->prev->next=p->next;
  80354b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80354f:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  803556:	48 85 c0             	test   rax,rax
  803559:	74 1d                	je     803578 <dispose_device+0x8c>
  80355b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80355f:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  803566:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80356a:	48 8b 92 90 00 00 00 	mov    rdx,QWORD PTR [rdx+0x90]
  803571:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
    p->flag=DEV_FLAG_EMPTY;
  803578:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80357c:	c7 40 10 00 00 00 00 	mov    DWORD PTR [rax+0x10],0x0
    return 0;
  803583:	b8 00 00 00 00       	mov    eax,0x0
}
  803588:	5d                   	pop    rbp
  803589:	c3                   	ret    

000000000080358a <dispose_driver>:
int dispose_driver(driver *drv){
  80358a:	f3 0f 1e fa          	endbr64 
  80358e:	55                   	push   rbp
  80358f:	48 89 e5             	mov    rbp,rsp
  803592:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  803596:	90                   	nop
  803597:	5d                   	pop    rbp
  803598:	c3                   	ret    

0000000000803599 <get_dev>:

device *get_dev(int devi)
{
  803599:	f3 0f 1e fa          	endbr64 
  80359d:	55                   	push   rbp
  80359e:	48 89 e5             	mov    rbp,rsp
  8035a1:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &devs[devi];
  8035a4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8035a7:	48 63 d0             	movsxd rdx,eax
  8035aa:	48 89 d0             	mov    rax,rdx
  8035ad:	48 c1 e0 02          	shl    rax,0x2
  8035b1:	48 01 d0             	add    rax,rdx
  8035b4:	48 c1 e0 02          	shl    rax,0x2
  8035b8:	48 01 d0             	add    rax,rdx
  8035bb:	48 c1 e0 03          	shl    rax,0x3
  8035bf:	48 05 80 2e 40 00    	add    rax,0x402e80
}
  8035c5:	5d                   	pop    rbp
  8035c6:	c3                   	ret    

00000000008035c7 <get_drv>:
driver *get_drv(int drvi)
{
  8035c7:	f3 0f 1e fa          	endbr64 
  8035cb:	55                   	push   rbp
  8035cc:	48 89 e5             	mov    rbp,rsp
  8035cf:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &drvs[drvi];
  8035d2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8035d5:	48 63 d0             	movsxd rdx,eax
  8035d8:	48 89 d0             	mov    rax,rdx
  8035db:	48 c1 e0 02          	shl    rax,0x2
  8035df:	48 01 d0             	add    rax,rdx
  8035e2:	48 c1 e0 05          	shl    rax,0x5
  8035e6:	48 05 80 58 40 00    	add    rax,0x405880
}
  8035ec:	5d                   	pop    rbp
  8035ed:	c3                   	ret    

00000000008035ee <make_request>:

//发送一个操作设备的申请
int make_request(driver_args* args)
{
  8035ee:	f3 0f 1e fa          	endbr64 
  8035f2:	55                   	push   rbp
  8035f3:	48 89 e5             	mov    rbp,rsp
  8035f6:	53                   	push   rbx
  8035f7:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //在数组中寻找空项
    int i=0;
  8035fb:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<NR_REQS;i++)
  803602:	eb 23                	jmp    803627 <make_request+0x39>
    {
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  803604:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803607:	48 63 d0             	movsxd rdx,eax
  80360a:	48 89 d0             	mov    rax,rdx
  80360d:	48 01 c0             	add    rax,rax
  803610:	48 01 d0             	add    rax,rdx
  803613:	48 c1 e0 06          	shl    rax,0x6
  803617:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  80361d:	8b 00                	mov    eax,DWORD PTR [rax]
  80361f:	85 c0                	test   eax,eax
  803621:	74 0c                	je     80362f <make_request+0x41>
    for(;i<NR_REQS;i++)
  803623:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  803627:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  80362b:	7e d7                	jle    803604 <make_request+0x16>
  80362d:	eb 01                	jmp    803630 <make_request+0x42>
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  80362f:	90                   	nop
    }
    if(i==NR_REQS)return -1;//满了
  803630:	83 7d f4 20          	cmp    DWORD PTR [rbp-0xc],0x20
  803634:	75 0a                	jne    803640 <make_request+0x52>
  803636:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80363b:	e9 e7 01 00 00       	jmp    803827 <make_request+0x239>
    reqs[i]=*args;//放入数组
  803640:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803643:	48 63 d0             	movsxd rdx,eax
  803646:	48 89 d0             	mov    rax,rdx
  803649:	48 01 c0             	add    rax,rax
  80364c:	48 01 d0             	add    rax,rdx
  80364f:	48 c1 e0 06          	shl    rax,0x6
  803653:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  80365a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80365e:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  803661:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  803665:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  803668:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  80366c:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  803670:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  803674:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  803678:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  80367c:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  803680:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  803684:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  803688:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  80368c:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  803690:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  803694:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  803698:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  80369c:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  8036a0:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  8036a4:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  8036a8:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  8036ac:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  8036b0:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  8036b4:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  8036b8:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  8036bc:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  8036c0:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  8036c4:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  8036c8:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  8036cc:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  8036d0:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  8036d4:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  8036d8:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  8036dc:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  8036e3:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  8036ea:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  8036f1:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  8036f8:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  8036ff:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  803706:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  80370d:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  803714:	48 8b 88 a0 00 00 00 	mov    rcx,QWORD PTR [rax+0xa0]
  80371b:	48 8b 98 a8 00 00 00 	mov    rbx,QWORD PTR [rax+0xa8]
  803722:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  803729:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  803730:	48 8b 88 b0 00 00 00 	mov    rcx,QWORD PTR [rax+0xb0]
  803737:	48 8b 98 b8 00 00 00 	mov    rbx,QWORD PTR [rax+0xb8]
  80373e:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  803745:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
    //插入具体设备的等待链表中
    device* dev=&devs[args->dev];
  80374c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803750:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  803756:	48 63 d0             	movsxd rdx,eax
  803759:	48 89 d0             	mov    rax,rdx
  80375c:	48 c1 e0 02          	shl    rax,0x2
  803760:	48 01 d0             	add    rax,rdx
  803763:	48 c1 e0 02          	shl    rax,0x2
  803767:	48 01 d0             	add    rax,rdx
  80376a:	48 c1 e0 03          	shl    rax,0x3
  80376e:	48 05 80 2e 40 00    	add    rax,0x402e80
  803774:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!dev->waiting_reqs)//空的等待队列
  803778:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80377c:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803783:	48 85 c0             	test   rax,rax
  803786:	75 27                	jne    8037af <make_request+0x1c1>
        dev->waiting_reqs=&reqs[i];
  803788:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80378b:	48 63 d0             	movsxd rdx,eax
  80378e:	48 89 d0             	mov    rax,rdx
  803791:	48 01 c0             	add    rax,rax
  803794:	48 01 d0             	add    rax,rdx
  803797:	48 c1 e0 06          	shl    rax,0x6
  80379b:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  8037a2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8037a6:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
  8037ad:	eb 75                	jmp    803824 <make_request+0x236>
    else{
        driver_args* p=dev->waiting_reqs;
  8037af:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8037b3:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8037ba:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        for(;p->next;p=p->next);
  8037be:	eb 0f                	jmp    8037cf <make_request+0x1e1>
  8037c0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8037c4:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  8037cb:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  8037cf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8037d3:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  8037da:	48 85 c0             	test   rax,rax
  8037dd:	75 e1                	jne    8037c0 <make_request+0x1d2>
        p->next=&reqs[i];
  8037df:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8037e2:	48 63 d0             	movsxd rdx,eax
  8037e5:	48 89 d0             	mov    rax,rdx
  8037e8:	48 01 c0             	add    rax,rax
  8037eb:	48 01 d0             	add    rax,rdx
  8037ee:	48 c1 e0 06          	shl    rax,0x6
  8037f2:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  8037f9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8037fd:	48 89 90 b8 00 00 00 	mov    QWORD PTR [rax+0xb8],rdx
        reqs[i].next=NULL;
  803804:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803807:	48 63 d0             	movsxd rdx,eax
  80380a:	48 89 d0             	mov    rax,rdx
  80380d:	48 01 c0             	add    rax,rax
  803810:	48 01 d0             	add    rax,rdx
  803813:	48 c1 e0 06          	shl    rax,0x6
  803817:	48 05 38 6d 40 00    	add    rax,0x406d38
  80381d:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }

    return i;
  803824:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  803827:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80382b:	c9                   	leave  
  80382c:	c3                   	ret    

000000000080382d <do_req>:
//取出一个申请并且执行
int do_req()
{
  80382d:	f3 0f 1e fa          	endbr64 
  803831:	55                   	push   rbp
  803832:	48 89 e5             	mov    rbp,rsp
  803835:	48 83 ec 10          	sub    rsp,0x10
    //查看每个设备的请求情况
    //块设备
    for(int i=0;i<3;i++)
  803839:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803840:	e9 ab 00 00 00       	jmp    8038f0 <do_req+0xc3>
    {
        device* p=dev_tree[i];
  803845:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803848:	48 98                	cdqe   
  80384a:	48 8b 04 c5 80 84 40 	mov    rax,QWORD PTR [rax*8+0x408480]
  803851:	00 
  803852:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(;p;p=p->next)
  803856:	e9 86 00 00 00       	jmp    8038e1 <do_req+0xb4>
        {
            //如果没有请求运行而且有请求要运行
            if(!p->running_req&&p->waiting_reqs)
  80385b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80385f:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  803866:	48 85 c0             	test   rax,rax
  803869:	75 67                	jne    8038d2 <do_req+0xa5>
  80386b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80386f:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803876:	48 85 c0             	test   rax,rax
  803879:	74 57                	je     8038d2 <do_req+0xa5>
            {
                p->running_req=p->waiting_reqs;
  80387b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80387f:	48 8b 90 88 00 00 00 	mov    rdx,QWORD PTR [rax+0x88]
  803886:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80388a:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
                p->waiting_reqs=p->waiting_reqs->next;//取出一个
  803891:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803895:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  80389c:	48 8b 90 b8 00 00 00 	mov    rdx,QWORD PTR [rax+0xb8]
  8038a3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038a7:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
                dev_funcs[p->operi](p->running_req);
  8038ae:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038b2:	8b 80 a0 00 00 00    	mov    eax,DWORD PTR [rax+0xa0]
  8038b8:	48 98                	cdqe   
  8038ba:	48 8b 14 c5 c0 ae 80 	mov    rdx,QWORD PTR [rax*8+0x80aec0]
  8038c1:	00 
  8038c2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038c6:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  8038cd:	48 89 c7             	mov    rdi,rax
  8038d0:	ff d2                	call   rdx
        for(;p;p=p->next)
  8038d2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038d6:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  8038dd:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  8038e1:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  8038e6:	0f 85 6f ff ff ff    	jne    80385b <do_req+0x2e>
    for(int i=0;i<3;i++)
  8038ec:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8038f0:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  8038f4:	0f 8e 4b ff ff ff    	jle    803845 <do_req+0x18>
            }
            //如果还在运行（DONE的状态不能直接覆盖，因为里面的运行结果可能还没被拿走）
        }
    }
    
    return 0;
  8038fa:	b8 00 00 00 00       	mov    eax,0x0
}
  8038ff:	c9                   	leave  
  803900:	c3                   	ret    

0000000000803901 <wait_on_req>:


void wait_on_req(int reqi)
{
  803901:	f3 0f 1e fa          	endbr64 
  803905:	55                   	push   rbp
  803906:	48 89 e5             	mov    rbp,rsp
  803909:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(reqs[reqi].stat!=REQ_STAT_DONE);
  80390c:	90                   	nop
  80390d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803910:	48 63 d0             	movsxd rdx,eax
  803913:	48 89 d0             	mov    rax,rdx
  803916:	48 01 c0             	add    rax,rax
  803919:	48 01 d0             	add    rax,rdx
  80391c:	48 c1 e0 06          	shl    rax,0x6
  803920:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803926:	8b 00                	mov    eax,DWORD PTR [rax]
  803928:	83 f8 03             	cmp    eax,0x3
  80392b:	75 e0                	jne    80390d <wait_on_req+0xc>
}
  80392d:	90                   	nop
  80392e:	90                   	nop
  80392f:	5d                   	pop    rbp
  803930:	c3                   	ret    

0000000000803931 <clear_req>:
void clear_req(int reqi)
{
  803931:	f3 0f 1e fa          	endbr64 
  803935:	55                   	push   rbp
  803936:	48 89 e5             	mov    rbp,rsp
  803939:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    reqs[reqi].stat=REQ_STAT_EMPTY;
  80393c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80393f:	48 63 d0             	movsxd rdx,eax
  803942:	48 89 d0             	mov    rax,rdx
  803945:	48 01 c0             	add    rax,rax
  803948:	48 01 d0             	add    rax,rdx
  80394b:	48 c1 e0 06          	shl    rax,0x6
  80394f:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803955:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  80395b:	90                   	nop
  80395c:	5d                   	pop    rbp
  80395d:	c3                   	ret    

000000000080395e <init_proc>:
TSS scene_saver;
TSS *tss=0x108000;
int cur_proc=0;
int pidd=0;
int palloc_paddr=0;
void init_proc(){
  80395e:	f3 0f 1e fa          	endbr64 
  803962:	55                   	push   rbp
  803963:	48 89 e5             	mov    rbp,rsp
  803966:	48 83 ec 10          	sub    rsp,0x10
    //task=(struct process*)get_global_var(TASK_PCBS_ADDR);//[MAX_TASKS];;
    for(int i=0;i<MAX_PROC_COUNT;i++){
  80396a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803971:	eb 61                	jmp    8039d4 <init_proc+0x76>
        task[i].pid=-1;
  803973:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803976:	48 63 d0             	movsxd rdx,eax
  803979:	48 89 d0             	mov    rax,rdx
  80397c:	48 01 c0             	add    rax,rax
  80397f:	48 01 d0             	add    rax,rdx
  803982:	48 c1 e0 08          	shl    rax,0x8
  803986:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80398c:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
        task[i].stat=ENDED;
  803992:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803995:	48 63 d0             	movsxd rdx,eax
  803998:	48 89 d0             	mov    rax,rdx
  80399b:	48 01 c0             	add    rax,rax
  80399e:	48 01 d0             	add    rax,rdx
  8039a1:	48 c1 e0 08          	shl    rax,0x8
  8039a5:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8039ab:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
        task[i].parent_pid=-1;
  8039b1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039b4:	48 63 d0             	movsxd rdx,eax
  8039b7:	48 89 d0             	mov    rax,rdx
  8039ba:	48 01 c0             	add    rax,rax
  8039bd:	48 01 d0             	add    rax,rdx
  8039c0:	48 c1 e0 08          	shl    rax,0x8
  8039c4:	48 05 28 85 40 00    	add    rax,0x408528
  8039ca:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<MAX_PROC_COUNT;i++){
  8039d0:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8039d4:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8039d8:	7e 99                	jle    803973 <init_proc+0x15>
    }
    cur_proc=0;//no proc
  8039da:	c7 05 28 0b c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc10b28],0x0        # 41450c <cur_proc>
  8039e1:	00 00 00 
    pidd=1;
  8039e4:	c7 05 22 0b c1 ff 01 	mov    DWORD PTR [rip+0xffffffffffc10b22],0x1        # 414510 <pidd>
  8039eb:	00 00 00 
     //创建0号进程
    int zi=create_proc();
  8039ee:	b8 00 00 00 00       	mov    eax,0x0
  8039f3:	e8 38 02 00 00       	call   803c30 <create_proc>
  8039f8:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    task[zi].stat=READY;
  8039fb:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8039fe:	48 63 d0             	movsxd rdx,eax
  803a01:	48 89 d0             	mov    rax,rdx
  803a04:	48 01 c0             	add    rax,rax
  803a07:	48 01 d0             	add    rax,rdx
  803a0a:	48 c1 e0 08          	shl    rax,0x8
  803a0e:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803a14:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int xi= _LDT_IND(zi)*8;
  803a1a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803a1d:	83 c0 03             	add    eax,0x3
  803a20:	c1 e0 04             	shl    eax,0x4
  803a23:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    zi=_TSS_IND(zi)*8;
  803a26:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803a29:	01 c0                	add    eax,eax
  803a2b:	83 c0 05             	add    eax,0x5
  803a2e:	c1 e0 03             	shl    eax,0x3
  803a31:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //asm volatile("lldt %0"::"m"(xi));
    //asm volatile("ltr %0"::"m"(zi));
    //把内核代码段选择子写到MSR寄存器中准备用于特权级转换(sysexit，现在没用)
    wrmsr(0x174,0x8);
  803a34:	be 08 00 00 00       	mov    esi,0x8
  803a39:	bf 74 01 00 00       	mov    edi,0x174
  803a3e:	e8 97 cd ff ff       	call   8007da <wrmsr>
    //准备用于特权级转换(sysret，正在使用)
    wrmsr(0xc0000081,0x0020000800000000ul);
  803a43:	48 b8 00 00 00 00 08 	movabs rax,0x20000800000000
  803a4a:	00 20 00 
  803a4d:	48 89 c6             	mov    rsi,rax
  803a50:	b8 81 00 00 c0       	mov    eax,0xc0000081
  803a55:	48 89 c7             	mov    rdi,rax
  803a58:	e8 7d cd ff ff       	call   8007da <wrmsr>
    //创建一个测试进程
    create_test_proc();
  803a5d:	b8 00 00 00 00       	mov    eax,0x0
  803a62:	e8 03 00 00 00       	call   803a6a <create_test_proc>
}
  803a67:	90                   	nop
  803a68:	c9                   	leave  
  803a69:	c3                   	ret    

0000000000803a6a <create_test_proc>:
void create_test_proc(){
  803a6a:	f3 0f 1e fa          	endbr64 
  803a6e:	55                   	push   rbp
  803a6f:	48 89 e5             	mov    rbp,rsp
  803a72:	48 83 ec 20          	sub    rsp,0x20

    int index=req_proc();
  803a76:	b8 00 00 00 00       	mov    eax,0x0
  803a7b:	e8 33 02 00 00       	call   803cb3 <req_proc>
  803a80:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    task[index].stat=READY;
  803a83:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a86:	48 63 d0             	movsxd rdx,eax
  803a89:	48 89 d0             	mov    rax,rdx
  803a8c:	48 01 c0             	add    rax,rax
  803a8f:	48 01 d0             	add    rax,rdx
  803a92:	48 c1 e0 08          	shl    rax,0x8
  803a96:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803a9c:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int currsp=0x9fc00-1;
  803aa2:	c7 45 ec ff fb 09 00 	mov    DWORD PTR [rbp-0x14],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  803aa9:	48 89 65 ec          	mov    QWORD PTR [rbp-0x14],rsp
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  803aad:	ba 52 ae 80 00       	mov    edx,0x80ae52
  803ab2:	48 83 ec 08          	sub    rsp,0x8
  803ab6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803ab9:	50                   	push   rax
  803aba:	6a 00                	push   0x0
  803abc:	52                   	push   rdx
  803abd:	6a 00                	push   0x0
  803abf:	6a 00                	push   0x0
  803ac1:	6a 00                	push   0x0
  803ac3:	68 58 7d 00 00       	push   0x7d58
  803ac8:	6a 10                	push   0x10
  803aca:	6a 10                	push   0x10
  803acc:	6a 10                	push   0x10
  803ace:	6a 10                	push   0x10
  803ad0:	41 b9 08 00 00 00    	mov    r9d,0x8
  803ad6:	41 b8 10 00 00 00    	mov    r8d,0x10
  803adc:	b9 00 00 00 00       	mov    ecx,0x0
  803ae1:	ba 00 00 00 00       	mov    edx,0x0
  803ae6:	be 00 00 00 00       	mov    esi,0x0
  803aeb:	bf 00 00 00 00       	mov    edi,0x0
  803af0:	e8 b7 02 00 00       	call   803dac <set_proc>
  803af5:	48 83 c4 60          	add    rsp,0x60
             0x7e00- sizeof(stack_store_regs), 0, 0, 0, (long)ret_sys_call, 0, index);
    task[index].tss.rsp0=0x400000;
  803af9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803afc:	48 63 d0             	movsxd rdx,eax
  803aff:	48 89 d0             	mov    rax,rdx
  803b02:	48 01 c0             	add    rax,rax
  803b05:	48 01 d0             	add    rax,rdx
  803b08:	48 c1 e0 08          	shl    rax,0x8
  803b0c:	48 05 68 86 40 00    	add    rax,0x408668
  803b12:	48 c7 00 00 00 40 00 	mov    QWORD PTR [rax],0x400000
    //把还原现场时用到的堆栈设置好
    stack_store_regs *str= (stack_store_regs *) (0x7e00 - sizeof(stack_store_regs));
  803b19:	48 c7 45 f0 58 7d 00 	mov    QWORD PTR [rbp-0x10],0x7d58
  803b20:	00 
    str->rax=0;
  803b21:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b25:	48 c7 40 78 00 00 00 	mov    QWORD PTR [rax+0x78],0x0
  803b2c:	00 
    str->rbx=0;
  803b2d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b31:	48 c7 40 70 00 00 00 	mov    QWORD PTR [rax+0x70],0x0
  803b38:	00 
    str->rcx=proc_zero;//sysret采用的返回地址
  803b39:	ba 18 3f 80 00       	mov    edx,0x803f18
  803b3e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b42:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    str->rdx=0;
  803b46:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b4a:	48 c7 40 60 00 00 00 	mov    QWORD PTR [rax+0x60],0x0
  803b51:	00 
    str->rsi=0;
  803b52:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b56:	48 c7 40 50 00 00 00 	mov    QWORD PTR [rax+0x50],0x0
  803b5d:	00 
    str->rdi=0;
  803b5e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b62:	48 c7 40 58 00 00 00 	mov    QWORD PTR [rax+0x58],0x0
  803b69:	00 
    str->r15=0;
  803b6a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b6e:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  803b75:	00 
    str->r14=0;
  803b76:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b7a:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  803b81:	00 
    str->r13=0;
  803b82:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b86:	48 c7 40 20 00 00 00 	mov    QWORD PTR [rax+0x20],0x0
  803b8d:	00 
    str->r12=0;
  803b8e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b92:	48 c7 40 28 00 00 00 	mov    QWORD PTR [rax+0x28],0x0
  803b99:	00 
    str->r11=0;
  803b9a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b9e:	48 c7 40 30 00 00 00 	mov    QWORD PTR [rax+0x30],0x0
  803ba5:	00 
    str->r10=0;
  803ba6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803baa:	48 c7 40 38 00 00 00 	mov    QWORD PTR [rax+0x38],0x0
  803bb1:	00 
    str->r9=0;
  803bb2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bb6:	48 c7 40 40 00 00 00 	mov    QWORD PTR [rax+0x40],0x0
  803bbd:	00 
    str->r8=0;
  803bbe:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bc2:	48 c7 40 48 00 00 00 	mov    QWORD PTR [rax+0x48],0x0
  803bc9:	00 
    str->rip=proc_zero;
  803bca:	ba 18 3f 80 00       	mov    edx,0x803f18
  803bcf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bd3:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
    str->cs=0x8;
  803bda:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bde:	48 c7 80 88 00 00 00 	mov    QWORD PTR [rax+0x88],0x8
  803be5:	08 00 00 00 
    str->rflags=0x00200006;
  803be9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bed:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x200006
  803bf4:	06 00 20 00 
    str->rsp=0x7e00;
  803bf8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bfc:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x7e00
  803c03:	00 7e 00 00 
    str->ss=0x2b;
  803c07:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c0b:	48 c7 80 a0 00 00 00 	mov    QWORD PTR [rax+0xa0],0x2b
  803c12:	2b 00 00 00 
    str->ds=0x2b;
  803c16:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c1a:	48 c7 00 2b 00 00 00 	mov    QWORD PTR [rax],0x2b
    str->es=0x2b;
  803c21:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c25:	48 c7 40 08 2b 00 00 	mov    QWORD PTR [rax+0x8],0x2b
  803c2c:	00 

}
  803c2d:	90                   	nop
  803c2e:	c9                   	leave  
  803c2f:	c3                   	ret    

0000000000803c30 <create_proc>:
int create_proc()
{
  803c30:	f3 0f 1e fa          	endbr64 
  803c34:	55                   	push   rbp
  803c35:	48 89 e5             	mov    rbp,rsp
  803c38:	48 83 ec 10          	sub    rsp,0x10
    int index=req_proc();
  803c3c:	b8 00 00 00 00       	mov    eax,0x0
  803c41:	e8 6d 00 00 00       	call   803cb3 <req_proc>
  803c46:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(index==-1)return -1;
  803c49:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  803c4d:	75 07                	jne    803c56 <create_proc+0x26>
  803c4f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803c54:	eb 5b                	jmp    803cb1 <create_proc+0x81>
    int currsp=0x9fc00-1;
  803c56:	c7 45 f8 ff fb 09 00 	mov    DWORD PTR [rbp-0x8],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  803c5d:	48 89 65 f8          	mov    QWORD PTR [rbp-0x8],rsp
    //默认DPL=3
    //set_proc(0,0,0,0,0x23,0x1b,0x23,0x23,0x23,0x23,curesp,0,0,0,0,index);
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  803c61:	b9 18 3f 80 00       	mov    ecx,0x803f18
  803c66:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803c69:	48 98                	cdqe   
  803c6b:	48 83 ec 08          	sub    rsp,0x8
  803c6f:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  803c72:	52                   	push   rdx
  803c73:	6a 00                	push   0x0
  803c75:	51                   	push   rcx
  803c76:	6a 00                	push   0x0
  803c78:	6a 00                	push   0x0
  803c7a:	6a 00                	push   0x0
  803c7c:	50                   	push   rax
  803c7d:	6a 10                	push   0x10
  803c7f:	6a 10                	push   0x10
  803c81:	6a 10                	push   0x10
  803c83:	6a 10                	push   0x10
  803c85:	41 b9 08 00 00 00    	mov    r9d,0x8
  803c8b:	41 b8 10 00 00 00    	mov    r8d,0x10
  803c91:	b9 00 00 00 00       	mov    ecx,0x0
  803c96:	ba 00 00 00 00       	mov    edx,0x0
  803c9b:	be 00 00 00 00       	mov    esi,0x0
  803ca0:	bf 00 00 00 00       	mov    edi,0x0
  803ca5:	e8 02 01 00 00       	call   803dac <set_proc>
  803caa:	48 83 c4 60          	add    rsp,0x60
             currsp, 0, 0, 0, (long)proc_zero, 0, index);
//    task[index].tss.eip=(long)proc_zero;

    return index;
  803cae:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803cb1:	c9                   	leave  
  803cb2:	c3                   	ret    

0000000000803cb3 <req_proc>:
int req_proc(){
  803cb3:	f3 0f 1e fa          	endbr64 
  803cb7:	55                   	push   rbp
  803cb8:	48 89 e5             	mov    rbp,rsp
    int num=0;
  803cbb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803cc2:	eb 04                	jmp    803cc8 <req_proc+0x15>
    num<=MAX_PROC_COUNT){
        num++;
  803cc4:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803cc8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803ccb:	48 63 d0             	movsxd rdx,eax
  803cce:	48 89 d0             	mov    rax,rdx
  803cd1:	48 01 c0             	add    rax,rax
  803cd4:	48 01 d0             	add    rax,rdx
  803cd7:	48 c1 e0 08          	shl    rax,0x8
  803cdb:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803ce1:	8b 00                	mov    eax,DWORD PTR [rax]
  803ce3:	83 f8 ff             	cmp    eax,0xffffffff
  803ce6:	74 26                	je     803d0e <req_proc+0x5b>
  803ce8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803ceb:	48 63 d0             	movsxd rdx,eax
  803cee:	48 89 d0             	mov    rax,rdx
  803cf1:	48 01 c0             	add    rax,rax
  803cf4:	48 01 d0             	add    rax,rdx
  803cf7:	48 c1 e0 08          	shl    rax,0x8
  803cfb:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803d01:	8b 00                	mov    eax,DWORD PTR [rax]
  803d03:	83 f8 03             	cmp    eax,0x3
  803d06:	74 06                	je     803d0e <req_proc+0x5b>
  803d08:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  803d0c:	7e b6                	jle    803cc4 <req_proc+0x11>
    }
    if(num>=MAX_PROC_COUNT)
  803d0e:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803d12:	7e 0a                	jle    803d1e <req_proc+0x6b>
        return -1;
  803d14:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803d19:	e9 8c 00 00 00       	jmp    803daa <req_proc+0xf7>
    task[num].pid=pidd++;
  803d1e:	8b 05 ec 07 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc107ec]        # 414510 <pidd>
  803d24:	8d 50 01             	lea    edx,[rax+0x1]
  803d27:	89 15 e3 07 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc107e3],edx        # 414510 <pidd>
  803d2d:	89 c1                	mov    ecx,eax
  803d2f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d32:	48 63 d0             	movsxd rdx,eax
  803d35:	48 89 d0             	mov    rax,rdx
  803d38:	48 01 c0             	add    rax,rax
  803d3b:	48 01 d0             	add    rax,rdx
  803d3e:	48 c1 e0 08          	shl    rax,0x8
  803d42:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803d48:	89 08                	mov    DWORD PTR [rax],ecx
    task[num].stat=ENDED;
  803d4a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d4d:	48 63 d0             	movsxd rdx,eax
  803d50:	48 89 d0             	mov    rax,rdx
  803d53:	48 01 c0             	add    rax,rax
  803d56:	48 01 d0             	add    rax,rdx
  803d59:	48 c1 e0 08          	shl    rax,0x8
  803d5d:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803d63:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[num].utime=0;
  803d69:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d6c:	48 63 d0             	movsxd rdx,eax
  803d6f:	48 89 d0             	mov    rax,rdx
  803d72:	48 01 c0             	add    rax,rax
  803d75:	48 01 d0             	add    rax,rdx
  803d78:	48 c1 e0 08          	shl    rax,0x8
  803d7c:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803d82:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[num].priority=0;
  803d88:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d8b:	48 63 d0             	movsxd rdx,eax
  803d8e:	48 89 d0             	mov    rax,rdx
  803d91:	48 01 c0             	add    rax,rax
  803d94:	48 01 d0             	add    rax,rdx
  803d97:	48 c1 e0 08          	shl    rax,0x8
  803d9b:	48 05 ac 84 40 00    	add    rax,0x4084ac
  803da1:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return num;
  803da7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803daa:	5d                   	pop    rbp
  803dab:	c3                   	ret    

0000000000803dac <set_proc>:
void set_proc(long eax, long ebx, long ecx, long edx, long es, long cs, long ss, long ds, long fs, long gs, long esp,
              long ebp, long esi, long edi, long rip, long eflags, int proc_nr) {
  803dac:	f3 0f 1e fa          	endbr64 
  803db0:	55                   	push   rbp
  803db1:	48 89 e5             	mov    rbp,rsp
  803db4:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  803db8:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  803dbc:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  803dc0:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  803dc4:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
  803dc8:	4c 89 4d c0          	mov    QWORD PTR [rbp-0x40],r9
    struct process* proc=&task[proc_nr];
  803dcc:	8b 45 60             	mov    eax,DWORD PTR [rbp+0x60]
  803dcf:	48 63 d0             	movsxd rdx,eax
  803dd2:	48 89 d0             	mov    rax,rdx
  803dd5:	48 01 c0             	add    rax,rax
  803dd8:	48 01 d0             	add    rax,rdx
  803ddb:	48 c1 e0 08          	shl    rax,0x8
  803ddf:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803de5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    proc->regs.rax=eax;
  803de9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ded:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  803df1:	48 89 90 48 02 00 00 	mov    QWORD PTR [rax+0x248],rdx
    proc->regs.rbx=ebx;
  803df8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803dfc:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  803e00:	48 89 90 60 02 00 00 	mov    QWORD PTR [rax+0x260],rdx
    proc->regs.rcx=ecx;
  803e07:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e0b:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  803e0f:	48 89 90 50 02 00 00 	mov    QWORD PTR [rax+0x250],rdx
    proc->regs.rdx=edx;
  803e16:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e1a:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  803e1e:	48 89 90 58 02 00 00 	mov    QWORD PTR [rax+0x258],rdx
    proc->regs.es=es;
  803e25:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e29:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803e2d:	48 89 90 88 02 00 00 	mov    QWORD PTR [rax+0x288],rdx
    proc->regs.cs=cs;
  803e34:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e38:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803e3c:	48 89 90 90 02 00 00 	mov    QWORD PTR [rax+0x290],rdx
    proc->regs.ss=ss;
  803e43:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e47:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803e4b:	48 89 90 98 02 00 00 	mov    QWORD PTR [rax+0x298],rdx
    proc->regs.ds=ds;
  803e52:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e56:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803e5a:	48 89 90 a0 02 00 00 	mov    QWORD PTR [rax+0x2a0],rdx
    proc->regs.fs=fs;
  803e61:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e65:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  803e69:	48 89 90 a8 02 00 00 	mov    QWORD PTR [rax+0x2a8],rdx
    proc->regs.gs=gs;
  803e70:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e74:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  803e78:	48 89 90 b0 02 00 00 	mov    QWORD PTR [rax+0x2b0],rdx
    proc->regs.rsp=esp;
  803e7f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e83:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803e87:	48 89 90 68 02 00 00 	mov    QWORD PTR [rax+0x268],rdx
    proc->regs.rbp=ebp;
  803e8e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e92:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
  803e96:	48 89 90 70 02 00 00 	mov    QWORD PTR [rax+0x270],rdx
    proc->regs.rsi=esi;
  803e9d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ea1:	48 8b 55 40          	mov    rdx,QWORD PTR [rbp+0x40]
  803ea5:	48 89 90 78 02 00 00 	mov    QWORD PTR [rax+0x278],rdx
    proc->regs.rdi=edi;
  803eac:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803eb0:	48 8b 55 48          	mov    rdx,QWORD PTR [rbp+0x48]
  803eb4:	48 89 90 80 02 00 00 	mov    QWORD PTR [rax+0x280],rdx
    proc->regs.rflags=0x202;//设置为默认值:0b 0010 0000 0010
  803ebb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ebf:	48 c7 80 40 02 00 00 	mov    QWORD PTR [rax+0x240],0x202
  803ec6:	02 02 00 00 
    //能接受中断
    proc->regs.rip=rip;
  803eca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ece:	48 8b 55 50          	mov    rdx,QWORD PTR [rbp+0x50]
  803ed2:	48 89 90 38 02 00 00 	mov    QWORD PTR [rax+0x238],rdx

    proc->regs.cs=cs;
  803ed9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803edd:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803ee1:	48 89 90 90 02 00 00 	mov    QWORD PTR [rax+0x290],rdx
    proc->regs.ds=ds;
  803ee8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803eec:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803ef0:	48 89 90 a0 02 00 00 	mov    QWORD PTR [rax+0x2a0],rdx
    proc->regs.es=es;
  803ef7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803efb:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803eff:	48 89 90 88 02 00 00 	mov    QWORD PTR [rax+0x288],rdx
    proc->regs.cr3=PML4_ADDR;//get_phyaddr(n1);//暂时先搞成全局
  803f06:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f0a:	48 c7 80 30 02 00 00 	mov    QWORD PTR [rax+0x230],0x101000
  803f11:	00 10 10 00 


}
  803f15:	90                   	nop
  803f16:	5d                   	pop    rbp
  803f17:	c3                   	ret    

0000000000803f18 <proc_zero>:
void proc_zero()
{
  803f18:	f3 0f 1e fa          	endbr64 
  803f1c:	55                   	push   rbp
  803f1d:	48 89 e5             	mov    rbp,rsp
    asm volatile("mov $1,%rax\n"
  803f20:	48 c7 c0 01 00 00 00 	mov    rax,0x1
  803f27:	48 0f 05             	rex.W syscall 
                 ".byte 0x48\n"
                 "syscall");
    while(1);
  803f2a:	eb fe                	jmp    803f2a <proc_zero+0x12>

0000000000803f2c <manage_proc>:
}
void manage_proc(){
  803f2c:	f3 0f 1e fa          	endbr64 
  803f30:	55                   	push   rbp
  803f31:	48 89 e5             	mov    rbp,rsp
  803f34:	48 83 ec 10          	sub    rsp,0x10
    if(cur_proc!=-1)
  803f38:	8b 05 ce 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc105ce]        # 41450c <cur_proc>
  803f3e:	83 f8 ff             	cmp    eax,0xffffffff
  803f41:	74 39                	je     803f7c <manage_proc+0x50>
        task[cur_proc].utime++;
  803f43:	8b 15 c3 05 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc105c3]        # 41450c <cur_proc>
  803f49:	48 63 ca             	movsxd rcx,edx
  803f4c:	48 89 c8             	mov    rax,rcx
  803f4f:	48 01 c0             	add    rax,rax
  803f52:	48 01 c8             	add    rax,rcx
  803f55:	48 c1 e0 08          	shl    rax,0x8
  803f59:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803f5f:	8b 00                	mov    eax,DWORD PTR [rax]
  803f61:	8d 48 01             	lea    ecx,[rax+0x1]
  803f64:	48 63 d2             	movsxd rdx,edx
  803f67:	48 89 d0             	mov    rax,rdx
  803f6a:	48 01 c0             	add    rax,rax
  803f6d:	48 01 d0             	add    rax,rdx
  803f70:	48 c1 e0 08          	shl    rax,0x8
  803f74:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803f7a:	89 08                	mov    DWORD PTR [rax],ecx
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803f7c:	8b 05 8a 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1058a]        # 41450c <cur_proc>
  803f82:	83 f8 ff             	cmp    eax,0xffffffff
  803f85:	74 4a                	je     803fd1 <manage_proc+0xa5>
  803f87:	8b 05 7f 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1057f]        # 41450c <cur_proc>
  803f8d:	48 63 d0             	movsxd rdx,eax
  803f90:	48 89 d0             	mov    rax,rdx
  803f93:	48 01 c0             	add    rax,rax
  803f96:	48 01 d0             	add    rax,rdx
  803f99:	48 c1 e0 08          	shl    rax,0x8
  803f9d:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803fa3:	8b 00                	mov    eax,DWORD PTR [rax]
  803fa5:	83 f8 01             	cmp    eax,0x1
  803fa8:	77 27                	ja     803fd1 <manage_proc+0xa5>
    task[cur_proc].stat!=READY){
  803faa:	8b 05 5c 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1055c]        # 41450c <cur_proc>
  803fb0:	48 63 d0             	movsxd rdx,eax
  803fb3:	48 89 d0             	mov    rax,rdx
  803fb6:	48 01 c0             	add    rax,rax
  803fb9:	48 01 d0             	add    rax,rdx
  803fbc:	48 c1 e0 08          	shl    rax,0x8
  803fc0:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803fc6:	8b 00                	mov    eax,DWORD PTR [rax]
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803fc8:	83 f8 01             	cmp    eax,0x1
  803fcb:	0f 84 21 01 00 00    	je     8040f2 <manage_proc+0x1c6>
        if(cur_proc!=-1)
  803fd1:	8b 05 35 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10535]        # 41450c <cur_proc>
  803fd7:	83 f8 ff             	cmp    eax,0xffffffff
  803fda:	74 22                	je     803ffe <manage_proc+0xd2>
            task[cur_proc].utime=0;
  803fdc:	8b 05 2a 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1052a]        # 41450c <cur_proc>
  803fe2:	48 63 d0             	movsxd rdx,eax
  803fe5:	48 89 d0             	mov    rax,rdx
  803fe8:	48 01 c0             	add    rax,rax
  803feb:	48 01 d0             	add    rax,rdx
  803fee:	48 c1 e0 08          	shl    rax,0x8
  803ff2:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803ff8:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        //find
        int i=0;
  803ffe:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        for(i=0;i<MAX_PROC_COUNT;i++){
  804005:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80400c:	eb 4f                	jmp    80405d <manage_proc+0x131>
            if(task[i].pid!=-1&&task[i].stat==READY&&i!=cur_proc){
  80400e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804011:	48 63 d0             	movsxd rdx,eax
  804014:	48 89 d0             	mov    rax,rdx
  804017:	48 01 c0             	add    rax,rax
  80401a:	48 01 d0             	add    rax,rdx
  80401d:	48 c1 e0 08          	shl    rax,0x8
  804021:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804027:	8b 00                	mov    eax,DWORD PTR [rax]
  804029:	83 f8 ff             	cmp    eax,0xffffffff
  80402c:	74 2b                	je     804059 <manage_proc+0x12d>
  80402e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804031:	48 63 d0             	movsxd rdx,eax
  804034:	48 89 d0             	mov    rax,rdx
  804037:	48 01 c0             	add    rax,rax
  80403a:	48 01 d0             	add    rax,rdx
  80403d:	48 c1 e0 08          	shl    rax,0x8
  804041:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804047:	8b 00                	mov    eax,DWORD PTR [rax]
  804049:	83 f8 01             	cmp    eax,0x1
  80404c:	75 0b                	jne    804059 <manage_proc+0x12d>
  80404e:	8b 05 b8 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc104b8]        # 41450c <cur_proc>
  804054:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  804057:	75 0c                	jne    804065 <manage_proc+0x139>
        for(i=0;i<MAX_PROC_COUNT;i++){
  804059:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80405d:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  804061:	7e ab                	jle    80400e <manage_proc+0xe2>
  804063:	eb 01                	jmp    804066 <manage_proc+0x13a>
                break;
  804065:	90                   	nop
            }
        }
        if(i>=MAX_PROC_COUNT)
  804066:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  80406a:	0f 8f 85 00 00 00    	jg     8040f5 <manage_proc+0x1c9>
            return;
        //switch
        task[cur_proc].stat=READY;
  804070:	8b 05 96 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10496]        # 41450c <cur_proc>
  804076:	48 63 d0             	movsxd rdx,eax
  804079:	48 89 d0             	mov    rax,rdx
  80407c:	48 01 c0             	add    rax,rax
  80407f:	48 01 d0             	add    rax,rdx
  804082:	48 c1 e0 08          	shl    rax,0x8
  804086:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80408c:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        task[i].stat=RUNNING;
  804092:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804095:	48 63 d0             	movsxd rdx,eax
  804098:	48 89 d0             	mov    rax,rdx
  80409b:	48 01 c0             	add    rax,rax
  80409e:	48 01 d0             	add    rax,rdx
  8040a1:	48 c1 e0 08          	shl    rax,0x8
  8040a5:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8040ab:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        switch_to(&task[cur_proc], &task[i]);
  8040b1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8040b4:	48 63 d0             	movsxd rdx,eax
  8040b7:	48 89 d0             	mov    rax,rdx
  8040ba:	48 01 c0             	add    rax,rax
  8040bd:	48 01 d0             	add    rax,rdx
  8040c0:	48 c1 e0 08          	shl    rax,0x8
  8040c4:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  8040cb:	8b 05 3b 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1043b]        # 41450c <cur_proc>
  8040d1:	48 63 c8             	movsxd rcx,eax
  8040d4:	48 89 c8             	mov    rax,rcx
  8040d7:	48 01 c0             	add    rax,rax
  8040da:	48 01 c8             	add    rax,rcx
  8040dd:	48 c1 e0 08          	shl    rax,0x8
  8040e1:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8040e7:	48 89 d6             	mov    rsi,rdx
  8040ea:	48 89 c7             	mov    rdi,rax
  8040ed:	e8 fd 0a 00 00       	call   804bef <switch_to>
    }
    return;
  8040f2:	90                   	nop
  8040f3:	eb 01                	jmp    8040f6 <manage_proc+0x1ca>
            return;
  8040f5:	90                   	nop
}
  8040f6:	c9                   	leave  
  8040f7:	c3                   	ret    

00000000008040f8 <switch_proc_tss>:

void switch_proc_tss(int pnr)
{
  8040f8:	f3 0f 1e fa          	endbr64 
  8040fc:	55                   	push   rbp
  8040fd:	48 89 e5             	mov    rbp,rsp
  804100:	48 83 ec 20          	sub    rsp,0x20
  804104:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int sel=_TSS_IND(pnr)*8;
  804107:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80410a:	01 c0                	add    eax,eax
  80410c:	83 c0 05             	add    eax,0x5
  80410f:	c1 e0 03             	shl    eax,0x3
  804112:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    cur_proc=pnr;
  804115:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804118:	89 05 ee 03 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc103ee],eax        # 41450c <cur_proc>
    switch_proc_asm(sel);
  80411e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804121:	89 c7                	mov    edi,eax
  804123:	e8 42 6c 00 00       	call   80ad6a <switch_proc_asm>
}
  804128:	90                   	nop
  804129:	c9                   	leave  
  80412a:	c3                   	ret    

000000000080412b <switch_proc>:
void switch_proc(int pnr){
  80412b:	f3 0f 1e fa          	endbr64 
  80412f:	55                   	push   rbp
  804130:	48 89 e5             	mov    rbp,rsp
  804133:	48 81 ec 20 03 00 00 	sub    rsp,0x320
  80413a:	89 bd ec fc ff ff    	mov    DWORD PTR [rbp-0x314],edi
    //printf("switching proc to %d\n",pnr);
    //printf("eip:%x\n",task[pnr].tss.eip);
    struct process p=task[pnr];
  804140:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  804146:	48 63 d0             	movsxd rdx,eax
  804149:	48 89 d0             	mov    rax,rdx
  80414c:	48 01 c0             	add    rax,rax
  80414f:	48 01 d0             	add    rax,rdx
  804152:	48 c1 e0 08          	shl    rax,0x8
  804156:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  80415d:	48 8d 85 f0 fc ff ff 	lea    rax,[rbp-0x310]
  804164:	48 89 d6             	mov    rsi,rdx
  804167:	ba 60 00 00 00       	mov    edx,0x60
  80416c:	48 89 c7             	mov    rdi,rax
  80416f:	48 89 d1             	mov    rcx,rdx
  804172:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
    save_context(&task[cur_proc].tss);
  804175:	8b 05 91 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10391]        # 41450c <cur_proc>
  80417b:	48 63 d0             	movsxd rdx,eax
  80417e:	48 89 d0             	mov    rax,rdx
  804181:	48 01 c0             	add    rax,rax
  804184:	48 01 d0             	add    rax,rdx
  804187:	48 c1 e0 08          	shl    rax,0x8
  80418b:	48 05 c0 01 00 00    	add    rax,0x1c0
  804191:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804197:	48 83 c0 04          	add    rax,0x4
  80419b:	48 89 c7             	mov    rdi,rax
  80419e:	e8 53 00 00 00       	call   8041f6 <save_context>
//    //重新设置0号进程
//    task[0].tss.eip=proc_zero;
//    task[0].tss.cr3=PAGE_INDEX_ADDR;
//    task[0].tss.eflags=0x202;
    cur_proc=pnr;
  8041a3:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  8041a9:	89 05 5d 03 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1035d],eax        # 41450c <cur_proc>
    int sel=_TSS_IND(pnr)*8;
  8041af:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  8041b5:	01 c0                	add    eax,eax
  8041b7:	83 c0 05             	add    eax,0x5
  8041ba:	c1 e0 03             	shl    eax,0x3
  8041bd:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    switch_to(NULL, &task[pnr].tss);
  8041c0:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  8041c6:	48 63 d0             	movsxd rdx,eax
  8041c9:	48 89 d0             	mov    rax,rdx
  8041cc:	48 01 c0             	add    rax,rax
  8041cf:	48 01 d0             	add    rax,rdx
  8041d2:	48 c1 e0 08          	shl    rax,0x8
  8041d6:	48 05 c0 01 00 00    	add    rax,0x1c0
  8041dc:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8041e2:	48 83 c0 04          	add    rax,0x4
  8041e6:	48 89 c6             	mov    rsi,rax
  8041e9:	bf 00 00 00 00       	mov    edi,0x0
  8041ee:	e8 fc 09 00 00       	call   804bef <switch_to>
    //asm volatile("push %0":"=r"(task[pnr].tss.eip));
    //switch_proc_asm(pnr*8+0x8*3);
}
  8041f3:	90                   	nop
  8041f4:	c9                   	leave  
  8041f5:	c3                   	ret    

00000000008041f6 <save_context>:
void save_context(TSS *tss)
{
  8041f6:	f3 0f 1e fa          	endbr64 
  8041fa:	55                   	push   rbp
  8041fb:	48 89 e5             	mov    rbp,rsp
  8041fe:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//    tss->esi=scene_saver.esi;
//    tss->edi=scene_saver.edi;
//    tss->eflags=scene_saver.eflags;
//    tss->esp=scene_saver.esp;
//    tss->ebp=scene_saver.ebp;
}
  804202:	90                   	nop
  804203:	5d                   	pop    rbp
  804204:	c3                   	ret    

0000000000804205 <palloc>:
    task[index].stat=READY;
    return index;
} */
//为指定进程申请新的内存，并返回这块内存的线性地址。
void* palloc(int proc_index,int size)
{
  804205:	f3 0f 1e fa          	endbr64 
  804209:	55                   	push   rbp
  80420a:	48 89 e5             	mov    rbp,rsp
  80420d:	48 83 ec 60          	sub    rsp,0x60
  804211:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  804214:	89 75 a8             	mov    DWORD PTR [rbp-0x58],esi
    int page_c=size/4096+size%4096?1:0;
  804217:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  80421a:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  804220:	85 c0                	test   eax,eax
  804222:	0f 48 c2             	cmovs  eax,edx
  804225:	c1 f8 0c             	sar    eax,0xc
  804228:	89 c1                	mov    ecx,eax
  80422a:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  80422d:	99                   	cdq    
  80422e:	c1 ea 14             	shr    edx,0x14
  804231:	01 d0                	add    eax,edx
  804233:	25 ff 0f 00 00       	and    eax,0xfff
  804238:	29 d0                	sub    eax,edx
  80423a:	01 c8                	add    eax,ecx
  80423c:	85 c0                	test   eax,eax
  80423e:	0f 95 c0             	setne  al
  804241:	0f b6 c0             	movzx  eax,al
  804244:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=0;
  804247:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    void *ptr=NULL;
  80424e:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  804255:	00 
    page_item *pgind=NULL;//task[proc_index].tss.cr3;
  804256:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80425d:	00 
    pgind++;
  80425e:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  804263:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [rbp-0x14],0x1
  80426a:	e9 76 02 00 00       	jmp    8044e5 <palloc+0x2e0>
    {
        page_item* tblp=*pgind&0xfffff000;
  80426f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804273:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804276:	25 00 f0 ff ff       	and    eax,0xfffff000
  80427b:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for(int j=0;j<1024;j++)
  80427f:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  804286:	e9 44 02 00 00       	jmp    8044cf <palloc+0x2ca>
        {
            int v=*tblp&PAGE_PRESENT;
  80428b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80428f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804292:	83 e0 01             	and    eax,0x1
  804295:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
            if(!v)
  804298:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  80429c:	0f 85 24 02 00 00    	jne    8044c6 <palloc+0x2c1>
            {
                int new_pg=req_a_page();
  8042a2:	b8 00 00 00 00       	mov    eax,0x0
  8042a7:	e8 0c d2 ff ff       	call   8014b8 <req_a_page>
  8042ac:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
                if(new_pg==-1)
  8042af:	83 7d c8 ff          	cmp    DWORD PTR [rbp-0x38],0xffffffff
  8042b3:	0f 85 dc 00 00 00    	jne    804395 <palloc+0x190>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  8042b9:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8042bc:	48 63 d0             	movsxd rdx,eax
  8042bf:	48 89 d0             	mov    rax,rdx
  8042c2:	48 01 c0             	add    rax,rax
  8042c5:	48 01 d0             	add    rax,rdx
  8042c8:	48 c1 e0 08          	shl    rax,0x8
  8042cc:	48 05 f4 84 40 00    	add    rax,0x4084f4
  8042d2:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8042d5:	0f b7 c0             	movzx  eax,ax
  8042d8:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  8042db:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8042de:	48 63 d0             	movsxd rdx,eax
  8042e1:	48 89 d0             	mov    rax,rdx
  8042e4:	48 01 c0             	add    rax,rax
  8042e7:	48 01 d0             	add    rax,rdx
  8042ea:	48 c1 e0 08          	shl    rax,0x8
  8042ee:	48 05 f0 84 40 00    	add    rax,0x4084f0
  8042f4:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  8042f8:	0f b7 c0             	movzx  eax,ax
  8042fb:	c1 e0 10             	shl    eax,0x10
  8042fe:	25 00 00 0f 00       	and    eax,0xf0000
  804303:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    size+=c;
  804306:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804309:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  80430c:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80430f:	89 c1                	mov    ecx,eax
  804311:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804314:	48 63 d0             	movsxd rdx,eax
  804317:	48 89 d0             	mov    rax,rdx
  80431a:	48 01 c0             	add    rax,rax
  80431d:	48 01 d0             	add    rax,rdx
  804320:	48 c1 e0 08          	shl    rax,0x8
  804324:	48 05 f4 84 40 00    	add    rax,0x4084f4
  80432a:	66 89 08             	mov    WORD PTR [rax],cx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  80432d:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804330:	48 63 d0             	movsxd rdx,eax
  804333:	48 89 d0             	mov    rax,rdx
  804336:	48 01 c0             	add    rax,rax
  804339:	48 01 d0             	add    rax,rdx
  80433c:	48 c1 e0 08          	shl    rax,0x8
  804340:	48 05 f0 84 40 00    	add    rax,0x4084f0
  804346:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  80434a:	0f b7 c0             	movzx  eax,ax
  80434d:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    tmp_attr&=0xfff0;
  804350:	81 65 b0 f0 ff 00 00 	and    DWORD PTR [rbp-0x50],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  804357:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80435a:	c1 e8 10             	shr    eax,0x10
  80435d:	83 e0 0f             	and    eax,0xf
  804360:	89 c2                	mov    edx,eax
  804362:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  804365:	01 d0                	add    eax,edx
  804367:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  80436a:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  80436d:	89 c1                	mov    ecx,eax
  80436f:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804372:	48 63 d0             	movsxd rdx,eax
  804375:	48 89 d0             	mov    rax,rdx
  804378:	48 01 c0             	add    rax,rax
  80437b:	48 01 d0             	add    rax,rdx
  80437e:	48 c1 e0 08          	shl    rax,0x8
  804382:	48 05 f0 84 40 00    	add    rax,0x4084f0
  804388:	66 89 48 09          	mov    WORD PTR [rax+0x9],cx
                    return ptr;//失败了，只能申请一部分的内存或者返回NULL
  80438c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804390:	e9 62 01 00 00       	jmp    8044f7 <palloc+0x2f2>
                }
                int addr=get_phyaddr(new_pg);
  804395:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  804398:	89 c7                	mov    edi,eax
  80439a:	e8 c7 d2 ff ff       	call   801666 <get_phyaddr>
  80439f:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
                set_page_item(tblp,addr,PAGE_PRESENT|\
  8043a2:	8b 4d c4             	mov    ecx,DWORD PTR [rbp-0x3c]
  8043a5:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8043a9:	ba 07 00 00 00       	mov    edx,0x7
  8043ae:	89 ce                	mov    esi,ecx
  8043b0:	48 89 c7             	mov    rdi,rax
  8043b3:	e8 c1 d2 ff ff       	call   801679 <set_page_item>
                PAGE_RWX|PAGE_FOR_ALL);
                int laddr=i*0x400000+j*0x1000;//线性地址
  8043b8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8043bb:	c1 e0 0a             	shl    eax,0xa
  8043be:	89 c2                	mov    edx,eax
  8043c0:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8043c3:	01 d0                	add    eax,edx
  8043c5:	c1 e0 0c             	shl    eax,0xc
  8043c8:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
                if(ptr==NULL)
  8043cb:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
  8043d0:	75 09                	jne    8043db <palloc+0x1d6>
                {
                   // ptr=laddr;
                    palloc_paddr=addr;
  8043d2:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8043d5:	89 05 39 01 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10139],eax        # 414514 <palloc_paddr>
                }
                page_c--;
  8043db:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
                c++;
  8043df:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                if(page_c==0)
  8043e3:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8043e7:	0f 85 d9 00 00 00    	jne    8044c6 <palloc+0x2c1>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  8043ed:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8043f0:	48 63 d0             	movsxd rdx,eax
  8043f3:	48 89 d0             	mov    rax,rdx
  8043f6:	48 01 c0             	add    rax,rax
  8043f9:	48 01 d0             	add    rax,rdx
  8043fc:	48 c1 e0 08          	shl    rax,0x8
  804400:	48 05 f4 84 40 00    	add    rax,0x4084f4
  804406:	0f b7 00             	movzx  eax,WORD PTR [rax]
  804409:	0f b7 c0             	movzx  eax,ax
  80440c:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  80440f:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804412:	48 63 d0             	movsxd rdx,eax
  804415:	48 89 d0             	mov    rax,rdx
  804418:	48 01 c0             	add    rax,rax
  80441b:	48 01 d0             	add    rax,rdx
  80441e:	48 c1 e0 08          	shl    rax,0x8
  804422:	48 05 f0 84 40 00    	add    rax,0x4084f0
  804428:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  80442c:	0f b7 c0             	movzx  eax,ax
  80442f:	c1 e0 10             	shl    eax,0x10
  804432:	25 00 00 0f 00       	and    eax,0xf0000
  804437:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    size+=c;
  80443a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80443d:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  804440:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  804443:	89 c1                	mov    ecx,eax
  804445:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804448:	48 63 d0             	movsxd rdx,eax
  80444b:	48 89 d0             	mov    rax,rdx
  80444e:	48 01 c0             	add    rax,rax
  804451:	48 01 d0             	add    rax,rdx
  804454:	48 c1 e0 08          	shl    rax,0x8
  804458:	48 05 f4 84 40 00    	add    rax,0x4084f4
  80445e:	66 89 08             	mov    WORD PTR [rax],cx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  804461:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804464:	48 63 d0             	movsxd rdx,eax
  804467:	48 89 d0             	mov    rax,rdx
  80446a:	48 01 c0             	add    rax,rax
  80446d:	48 01 d0             	add    rax,rdx
  804470:	48 c1 e0 08          	shl    rax,0x8
  804474:	48 05 f0 84 40 00    	add    rax,0x4084f0
  80447a:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  80447e:	0f b7 c0             	movzx  eax,ax
  804481:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    tmp_attr&=0xfff0;
  804484:	81 65 b8 f0 ff 00 00 	and    DWORD PTR [rbp-0x48],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  80448b:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  80448e:	c1 e8 10             	shr    eax,0x10
  804491:	83 e0 0f             	and    eax,0xf
  804494:	89 c2                	mov    edx,eax
  804496:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  804499:	01 d0                	add    eax,edx
  80449b:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  80449e:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  8044a1:	89 c1                	mov    ecx,eax
  8044a3:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8044a6:	48 63 d0             	movsxd rdx,eax
  8044a9:	48 89 d0             	mov    rax,rdx
  8044ac:	48 01 c0             	add    rax,rax
  8044af:	48 01 d0             	add    rax,rdx
  8044b2:	48 c1 e0 08          	shl    rax,0x8
  8044b6:	48 05 f0 84 40 00    	add    rax,0x4084f0
  8044bc:	66 89 48 09          	mov    WORD PTR [rax+0x9],cx
                    return ptr;
  8044c0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8044c4:	eb 31                	jmp    8044f7 <palloc+0x2f2>
                }
            }
            tblp++;
  8044c6:	48 83 45 e0 08       	add    QWORD PTR [rbp-0x20],0x8
        for(int j=0;j<1024;j++)
  8044cb:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  8044cf:	81 7d dc ff 03 00 00 	cmp    DWORD PTR [rbp-0x24],0x3ff
  8044d6:	0f 8e af fd ff ff    	jle    80428b <palloc+0x86>
        }
        pgind++;
  8044dc:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  8044e1:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8044e5:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  8044ec:	0f 8e 7d fd ff ff    	jle    80426f <palloc+0x6a>
    }
    return NULL;
  8044f2:	b8 00 00 00 00       	mov    eax,0x0
}
  8044f7:	c9                   	leave  
  8044f8:	c3                   	ret    

00000000008044f9 <malloc>:
//为当前进程申请新的内存，并返回这块内存的线性地址。
void* malloc(int size)
{
  8044f9:	f3 0f 1e fa          	endbr64 
  8044fd:	55                   	push   rbp
  8044fe:	48 89 e5             	mov    rbp,rsp
  804501:	48 83 ec 10          	sub    rsp,0x10
  804505:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return palloc(cur_proc,size);
  804508:	8b 05 fe ff c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fffe]        # 41450c <cur_proc>
  80450e:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804511:	89 d6                	mov    esi,edx
  804513:	89 c7                	mov    edi,eax
  804515:	e8 eb fc ff ff       	call   804205 <palloc>
}
  80451a:	c9                   	leave  
  80451b:	c3                   	ret    

000000000080451c <proc_end>:
void proc_end()
{
  80451c:	f3 0f 1e fa          	endbr64 
  804520:	55                   	push   rbp
  804521:	48 89 e5             	mov    rbp,rsp
  804524:	48 83 ec 10          	sub    rsp,0x10
    int ret;
    asm volatile("mov %%eax,%0":"=m"(ret));
  804528:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("proc #%d ended with retv %d.\n",cur_proc,ret);
    //切换堆栈
    //asm volatile("mov %0,%%rsp"::"r"(task[0].tss.esp));
    del_proc(cur_proc);
  80452b:	8b 05 db ff c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ffdb]        # 41450c <cur_proc>
  804531:	89 c7                	mov    edi,eax
  804533:	e8 90 00 00 00       	call   8045c8 <del_proc>
    if(task[cur_proc].parent_pid!=-1){
  804538:	8b 05 ce ff c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ffce]        # 41450c <cur_proc>
  80453e:	48 63 d0             	movsxd rdx,eax
  804541:	48 89 d0             	mov    rax,rdx
  804544:	48 01 c0             	add    rax,rax
  804547:	48 01 d0             	add    rax,rdx
  80454a:	48 c1 e0 08          	shl    rax,0x8
  80454e:	48 05 28 85 40 00    	add    rax,0x408528
  804554:	8b 00                	mov    eax,DWORD PTR [rax]
  804556:	83 f8 ff             	cmp    eax,0xffffffff
  804559:	74 60                	je     8045bb <proc_end+0x9f>
        task[task[cur_proc].parent_pid].stat=READY;
  80455b:	8b 05 ab ff c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ffab]        # 41450c <cur_proc>
  804561:	48 63 d0             	movsxd rdx,eax
  804564:	48 89 d0             	mov    rax,rdx
  804567:	48 01 c0             	add    rax,rax
  80456a:	48 01 d0             	add    rax,rdx
  80456d:	48 c1 e0 08          	shl    rax,0x8
  804571:	48 05 28 85 40 00    	add    rax,0x408528
  804577:	8b 00                	mov    eax,DWORD PTR [rax]
  804579:	89 c2                	mov    edx,eax
  80457b:	48 89 d0             	mov    rax,rdx
  80457e:	48 01 c0             	add    rax,rax
  804581:	48 01 d0             	add    rax,rdx
  804584:	48 c1 e0 08          	shl    rax,0x8
  804588:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80458e:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        switch_proc_tss(task[cur_proc].parent_pid);
  804594:	8b 05 72 ff c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ff72]        # 41450c <cur_proc>
  80459a:	48 63 d0             	movsxd rdx,eax
  80459d:	48 89 d0             	mov    rax,rdx
  8045a0:	48 01 c0             	add    rax,rax
  8045a3:	48 01 d0             	add    rax,rdx
  8045a6:	48 c1 e0 08          	shl    rax,0x8
  8045aa:	48 05 28 85 40 00    	add    rax,0x408528
  8045b0:	8b 00                	mov    eax,DWORD PTR [rax]
  8045b2:	89 c7                	mov    edi,eax
  8045b4:	e8 3f fb ff ff       	call   8040f8 <switch_proc_tss>
    }
    else
        switch_proc_tss(0);
    //syscall(SYSCALL_DEL_PROC,cur_proc,0,0,0,0);
}
  8045b9:	eb 0a                	jmp    8045c5 <proc_end+0xa9>
        switch_proc_tss(0);
  8045bb:	bf 00 00 00 00       	mov    edi,0x0
  8045c0:	e8 33 fb ff ff       	call   8040f8 <switch_proc_tss>
}
  8045c5:	90                   	nop
  8045c6:	c9                   	leave  
  8045c7:	c3                   	ret    

00000000008045c8 <del_proc>:
void del_proc(int pnr)
{
  8045c8:	f3 0f 1e fa          	endbr64 
  8045cc:	55                   	push   rbp
  8045cd:	48 89 e5             	mov    rbp,rsp
  8045d0:	48 83 ec 30          	sub    rsp,0x30
  8045d4:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
    task[pnr].stat=ENDED;
  8045d7:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8045da:	48 63 d0             	movsxd rdx,eax
  8045dd:	48 89 d0             	mov    rax,rdx
  8045e0:	48 01 c0             	add    rax,rax
  8045e3:	48 01 d0             	add    rax,rdx
  8045e6:	48 c1 e0 08          	shl    rax,0x8
  8045ea:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8045f0:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[pnr].pid=-1;
  8045f6:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8045f9:	48 63 d0             	movsxd rdx,eax
  8045fc:	48 89 d0             	mov    rax,rdx
  8045ff:	48 01 c0             	add    rax,rax
  804602:	48 01 d0             	add    rax,rdx
  804605:	48 c1 e0 08          	shl    rax,0x8
  804609:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80460f:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    //释放申请的页面
    page_item *p;//task[pnr].tss.cr3;
    p++;
  804615:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
    for(;(*p&PAGE_PRESENT)!=0;p++)
  80461a:	eb 63                	jmp    80467f <del_proc+0xb7>
    {
        page_item *tp=*p&0xfffff000;
  80461c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804620:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804623:	25 00 f0 ff ff       	and    eax,0xfffff000
  804628:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<1024;i++)
  80462c:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804633:	eb 30                	jmp    804665 <del_proc+0x9d>
        {
            unsigned int present=*tp&PAGE_PRESENT;
  804635:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804639:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80463c:	83 e0 01             	and    eax,0x1
  80463f:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            if(present)
  804642:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  804646:	74 14                	je     80465c <del_proc+0x94>
            {
                free_page(*tp&0xfffff000);
  804648:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80464c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80464f:	25 00 f0 ff ff       	and    eax,0xfffff000
  804654:	48 89 c7             	mov    rdi,rax
  804657:	e8 2c cf ff ff       	call   801588 <free_page>
                //printf("freed page at %x.\n",*tp&0xfffff000);
            }
            tp++;
  80465c:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
        for(int i=0;i<1024;i++)
  804661:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804665:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  80466c:	7e c7                	jle    804635 <del_proc+0x6d>
        }
        vmfree(tp);
  80466e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804672:	48 89 c7             	mov    rdi,rax
  804675:	e8 39 cb ff ff       	call   8011b3 <vmfree>
    for(;(*p&PAGE_PRESENT)!=0;p++)
  80467a:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
  80467f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804683:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804686:	83 e0 01             	and    eax,0x1
  804689:	48 85 c0             	test   rax,rax
  80468c:	75 8e                	jne    80461c <del_proc+0x54>
    }
    //释放存放页目录的页面
    vmfree(p);
  80468e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804692:	48 89 c7             	mov    rdi,rax
  804695:	e8 19 cb ff ff       	call   8011b3 <vmfree>
    //从进程中解除cr3,tss和ldt
    //switch_proc_tss(task[pnr]);
}
  80469a:	90                   	nop
  80469b:	c9                   	leave  
  80469c:	c3                   	ret    

000000000080469d <set_proc_stat>:

int set_proc_stat(int pid,int stat)
{
  80469d:	f3 0f 1e fa          	endbr64 
  8046a1:	55                   	push   rbp
  8046a2:	48 89 e5             	mov    rbp,rsp
  8046a5:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8046a8:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==-1)return -1;
  8046ab:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  8046af:	75 0a                	jne    8046bb <set_proc_stat+0x1e>
  8046b1:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8046b6:	e9 8c 00 00 00       	jmp    804747 <set_proc_stat+0xaa>
    int i=0;
  8046bb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;task[i].pid!=pid;i++);
  8046c2:	eb 04                	jmp    8046c8 <set_proc_stat+0x2b>
  8046c4:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8046c8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8046cb:	48 63 d0             	movsxd rdx,eax
  8046ce:	48 89 d0             	mov    rax,rdx
  8046d1:	48 01 c0             	add    rax,rax
  8046d4:	48 01 d0             	add    rax,rdx
  8046d7:	48 c1 e0 08          	shl    rax,0x8
  8046db:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8046e1:	8b 10                	mov    edx,DWORD PTR [rax]
  8046e3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8046e6:	39 c2                	cmp    edx,eax
  8046e8:	75 da                	jne    8046c4 <set_proc_stat+0x27>
    if(i==MAX_PROC_COUNT)return -1;
  8046ea:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  8046ee:	75 07                	jne    8046f7 <set_proc_stat+0x5a>
  8046f0:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8046f5:	eb 50                	jmp    804747 <set_proc_stat+0xaa>
    task[i].stat=stat;
  8046f7:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8046fa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8046fd:	48 63 c8             	movsxd rcx,eax
  804700:	48 89 c8             	mov    rax,rcx
  804703:	48 01 c0             	add    rax,rax
  804706:	48 01 c8             	add    rax,rcx
  804709:	48 c1 e0 08          	shl    rax,0x8
  80470d:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804713:	89 10                	mov    DWORD PTR [rax],edx
    //如果这就是正在运行的进程，那么马上停止
    if(cur_proc==i)
  804715:	8b 05 f1 fd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fdf1]        # 41450c <cur_proc>
  80471b:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  80471e:	75 22                	jne    804742 <set_proc_stat+0xa5>
        task[cur_proc].utime=MAX_UTIME;
  804720:	8b 05 e6 fd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fde6]        # 41450c <cur_proc>
  804726:	48 63 d0             	movsxd rdx,eax
  804729:	48 89 d0             	mov    rax,rdx
  80472c:	48 01 c0             	add    rax,rax
  80472f:	48 01 d0             	add    rax,rdx
  804732:	48 c1 e0 08          	shl    rax,0x8
  804736:	48 05 a8 84 40 00    	add    rax,0x4084a8
  80473c:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    return 0;
  804742:	b8 00 00 00 00       	mov    eax,0x0
}
  804747:	5d                   	pop    rbp
  804748:	c3                   	ret    

0000000000804749 <add_proc_openf>:

    return 0;
} */

int add_proc_openf(vfs_dir_entry *entry)
{
  804749:	f3 0f 1e fa          	endbr64 
  80474d:	55                   	push   rbp
  80474e:	48 89 e5             	mov    rbp,rsp
  804751:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_PROC_OPENF;i++){
  804755:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80475c:	eb 6a                	jmp    8047c8 <add_proc_openf+0x7f>
        if(task[cur_proc].openf[i]==NULL)
  80475e:	8b 05 a8 fd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fda8]        # 41450c <cur_proc>
  804764:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804767:	48 63 ca             	movsxd rcx,edx
  80476a:	48 63 d0             	movsxd rdx,eax
  80476d:	48 89 d0             	mov    rax,rdx
  804770:	48 01 c0             	add    rax,rax
  804773:	48 01 d0             	add    rax,rdx
  804776:	48 c1 e0 05          	shl    rax,0x5
  80477a:	48 01 c8             	add    rax,rcx
  80477d:	48 83 c0 18          	add    rax,0x18
  804781:	48 8b 04 c5 a4 84 40 	mov    rax,QWORD PTR [rax*8+0x4084a4]
  804788:	00 
  804789:	48 85 c0             	test   rax,rax
  80478c:	75 36                	jne    8047c4 <add_proc_openf+0x7b>
        {
            task[cur_proc].openf[i]=entry;
  80478e:	8b 05 78 fd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fd78]        # 41450c <cur_proc>
  804794:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804797:	48 63 ca             	movsxd rcx,edx
  80479a:	48 63 d0             	movsxd rdx,eax
  80479d:	48 89 d0             	mov    rax,rdx
  8047a0:	48 01 c0             	add    rax,rax
  8047a3:	48 01 d0             	add    rax,rdx
  8047a6:	48 c1 e0 05          	shl    rax,0x5
  8047aa:	48 01 c8             	add    rax,rcx
  8047ad:	48 8d 50 18          	lea    rdx,[rax+0x18]
  8047b1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8047b5:	48 89 04 d5 a4 84 40 	mov    QWORD PTR [rdx*8+0x4084a4],rax
  8047bc:	00 
            return 0;
  8047bd:	b8 00 00 00 00       	mov    eax,0x0
  8047c2:	eb 0f                	jmp    8047d3 <add_proc_openf+0x8a>
    for(int i=0;i<MAX_PROC_OPENF;i++){
  8047c4:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8047c8:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  8047cc:	7e 90                	jle    80475e <add_proc_openf+0x15>
        }
    }
    return -1;//full
  8047ce:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8047d3:	5d                   	pop    rbp
  8047d4:	c3                   	ret    

00000000008047d5 <sys_exit>:
/*
 * 进程结束。
 * */
int sys_exit(int code)
{
  8047d5:	f3 0f 1e fa          	endbr64 
  8047d9:	55                   	push   rbp
  8047da:	48 89 e5             	mov    rbp,rsp
  8047dd:	48 83 ec 10          	sub    rsp,0x10
  8047e1:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    del_proc(cur_proc);
  8047e4:	8b 05 22 fd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fd22]        # 41450c <cur_proc>
  8047ea:	89 c7                	mov    edi,eax
  8047ec:	e8 d7 fd ff ff       	call   8045c8 <del_proc>
    return code;
  8047f1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8047f4:	c9                   	leave  
  8047f5:	c3                   	ret    

00000000008047f6 <reg_proc>:
    dllmain(NULL,0,NULL);
    
}*/

int reg_proc(int entry, vfs_dir_entry *cwd, vfs_dir_entry *exef)
{
  8047f6:	f3 0f 1e fa          	endbr64 
  8047fa:	55                   	push   rbp
  8047fb:	48 89 e5             	mov    rbp,rsp
  8047fe:	48 83 ec 40          	sub    rsp,0x40
  804802:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  804805:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  804809:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
    
    int i=req_proc();
  80480d:	b8 00 00 00 00       	mov    eax,0x0
  804812:	e8 9c f4 ff ff       	call   803cb3 <req_proc>
  804817:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(i==-1)return -1;
  80481a:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  80481e:	75 0a                	jne    80482a <reg_proc+0x34>
  804820:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804825:	e9 65 01 00 00       	jmp    80498f <reg_proc+0x199>
    /*set_proc(0,0,0,0,SEL_LDT_DATA,SEL_LDT_CODE,SEL_LDT_STACK,SEL_LDT_DATA\
    ,SEL_LDT_DATA,SEL_LDT_DATA,0x1c00000-4,0,0,0,0,i);*/
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10\
  80482a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80482d:	50                   	push   rax
  80482e:	6a 00                	push   0x0
  804830:	6a 00                	push   0x0
  804832:	6a 00                	push   0x0
  804834:	6a 00                	push   0x0
  804836:	6a 00                	push   0x0
  804838:	68 fc ff bf 01       	push   0x1bffffc
  80483d:	6a 10                	push   0x10
  80483f:	6a 10                	push   0x10
  804841:	6a 10                	push   0x10
  804843:	6a 10                	push   0x10
  804845:	41 b9 08 00 00 00    	mov    r9d,0x8
  80484b:	41 b8 10 00 00 00    	mov    r8d,0x10
  804851:	b9 00 00 00 00       	mov    ecx,0x0
  804856:	ba 00 00 00 00       	mov    edx,0x0
  80485b:	be 00 00 00 00       	mov    esi,0x0
  804860:	bf 00 00 00 00       	mov    edi,0x0
  804865:	e8 42 f5 ff ff       	call   803dac <set_proc>
  80486a:	48 83 c4 58          	add    rsp,0x58
, 0x10, 0x10, 0x1c00000 - 4, 0, 0, 0, 0, 0, i);
    task[i].pml4=vmalloc();
  80486e:	b8 00 00 00 00       	mov    eax,0x0
  804873:	e8 ac c8 ff ff       	call   801124 <vmalloc>
  804878:	48 89 c1             	mov    rcx,rax
  80487b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80487e:	48 63 d0             	movsxd rdx,eax
  804881:	48 89 d0             	mov    rax,rdx
  804884:	48 01 c0             	add    rax,rax
  804887:	48 01 d0             	add    rax,rdx
  80488a:	48 c1 e0 08          	shl    rax,0x8
  80488e:	48 05 40 85 40 00    	add    rax,0x408540
  804894:	48 89 48 0c          	mov    QWORD PTR [rax+0xc],rcx
    int *pt=vmalloc();
  804898:	b8 00 00 00 00       	mov    eax,0x0
  80489d:	e8 82 c8 ff ff       	call   801124 <vmalloc>
  8048a2:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    task[i].pml4[0]=PAGE_TABLE_ADDR|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;
  8048a6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8048a9:	48 63 d0             	movsxd rdx,eax
  8048ac:	48 89 d0             	mov    rax,rdx
  8048af:	48 01 c0             	add    rax,rax
  8048b2:	48 01 d0             	add    rax,rdx
  8048b5:	48 c1 e0 08          	shl    rax,0x8
  8048b9:	48 05 40 85 40 00    	add    rax,0x408540
  8048bf:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8048c3:	48 c7 00 07 20 00 00 	mov    QWORD PTR [rax],0x2007
    /*for(int j=0;j<32;j++)
        pt[j]=(PAGE_TABLE_ADDR+j*0x1000)|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;//复制内核页表*/
    //PAGE_TABLE_ADDR|PAGE_PRESENT;//复制内核页表
    //task[i].pml4[7]=PAGE_TABLE_ADDR+7*0x1000|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//sys.dll
    int *stackb=vmalloc();
  8048ca:	b8 00 00 00 00       	mov    eax,0x0
  8048cf:	e8 50 c8 ff ff       	call   801124 <vmalloc>
  8048d4:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    task[i].pml4[6]=(int)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  8048d8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8048dc:	83 c8 07             	or     eax,0x7
  8048df:	89 c1                	mov    ecx,eax
  8048e1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8048e4:	48 63 d0             	movsxd rdx,eax
  8048e7:	48 89 d0             	mov    rax,rdx
  8048ea:	48 01 c0             	add    rax,rax
  8048ed:	48 01 d0             	add    rax,rdx
  8048f0:	48 c1 e0 08          	shl    rax,0x8
  8048f4:	48 05 40 85 40 00    	add    rax,0x408540
  8048fa:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8048fe:	48 8d 50 30          	lea    rdx,[rax+0x30]
  804902:	48 63 c1             	movsxd rax,ecx
  804905:	48 89 02             	mov    QWORD PTR [rdx],rax
    stackb[1023]=get_phyaddr(req_a_page())|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  804908:	b8 00 00 00 00       	mov    eax,0x0
  80490d:	e8 a6 cb ff ff       	call   8014b8 <req_a_page>
  804912:	89 c7                	mov    edi,eax
  804914:	e8 4d cd ff ff       	call   801666 <get_phyaddr>
  804919:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80491d:	48 81 c2 fc 0f 00 00 	add    rdx,0xffc
  804924:	83 c8 07             	or     eax,0x7
  804927:	89 02                	mov    DWORD PTR [rdx],eax
//    task[i].tss.cr3=task[i].pml4;

    task[i].stat=READY;
  804929:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80492c:	48 63 d0             	movsxd rdx,eax
  80492f:	48 89 d0             	mov    rax,rdx
  804932:	48 01 c0             	add    rax,rax
  804935:	48 01 d0             	add    rax,rdx
  804938:	48 c1 e0 08          	shl    rax,0x8
  80493c:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804942:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[i].cwd=cwd;
  804948:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80494b:	48 63 d0             	movsxd rdx,eax
  80494e:	48 89 d0             	mov    rax,rdx
  804951:	48 01 c0             	add    rax,rax
  804954:	48 01 d0             	add    rax,rdx
  804957:	48 c1 e0 08          	shl    rax,0x8
  80495b:	48 8d 90 50 85 40 00 	lea    rdx,[rax+0x408550]
  804962:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804966:	48 89 42 04          	mov    QWORD PTR [rdx+0x4],rax
    task[i].exef=exef;
  80496a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80496d:	48 63 d0             	movsxd rdx,eax
  804970:	48 89 d0             	mov    rax,rdx
  804973:	48 01 c0             	add    rax,rax
  804976:	48 01 d0             	add    rax,rdx
  804979:	48 c1 e0 08          	shl    rax,0x8
  80497d:	48 8d 90 50 85 40 00 	lea    rdx,[rax+0x408550]
  804984:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  804988:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
    task[i].tss.ss=0x10;
    task[i].tss.gs=0x10;
    task[i].tss.fs=0x10;
    task[i].tss.cs=0x8;*/
//    task[i].tss.eip=entry;
    return i;
  80498c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    proc_ret_stack *pstack=stack_paddr+stack_size-12;
    pstack->argc=0;
    pstack->argv=0;
    pstack->proc_end_addr=proc_end;
    int *pptr=pstack;*/
}
  80498f:	c9                   	leave  
  804990:	c3                   	ret    

0000000000804991 <sys_malloc>:

void * sys_malloc(int size)
{
  804991:	f3 0f 1e fa          	endbr64 
  804995:	55                   	push   rbp
  804996:	48 89 e5             	mov    rbp,rsp
  804999:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    //
    int n=size/CHUNK_SIZE+size%CHUNK_SIZE?1:0;
  80499c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80499f:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8049a5:	85 c0                	test   eax,eax
  8049a7:	0f 48 c2             	cmovs  eax,edx
  8049aa:	c1 f8 0c             	sar    eax,0xc
  8049ad:	89 c1                	mov    ecx,eax
  8049af:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8049b2:	99                   	cdq    
  8049b3:	c1 ea 14             	shr    edx,0x14
  8049b6:	01 d0                	add    eax,edx
  8049b8:	25 ff 0f 00 00       	and    eax,0xfff
  8049bd:	29 d0                	sub    eax,edx
  8049bf:	01 c8                	add    eax,ecx
  8049c1:	85 c0                	test   eax,eax
  8049c3:	0f 95 c0             	setne  al
  8049c6:	0f b6 c0             	movzx  eax,al
  8049c9:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    chunk_header *hp=(chunk_header*)task[cur_proc].mem_struct.heap_base;
  8049cc:	8b 05 3a fb c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fb3a]        # 41450c <cur_proc>
  8049d2:	48 63 d0             	movsxd rdx,eax
  8049d5:	48 89 d0             	mov    rax,rdx
  8049d8:	48 01 c0             	add    rax,rax
  8049db:	48 01 d0             	add    rax,rdx
  8049de:	48 c1 e0 08          	shl    rax,0x8
  8049e2:	48 05 b4 84 40 00    	add    rax,0x4084b4
  8049e8:	8b 00                	mov    eax,DWORD PTR [rax]
  8049ea:	48 98                	cdqe   
  8049ec:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  8049f0:	eb 0c                	jmp    8049fe <sys_malloc+0x6d>
        hp=hp->next;
  8049f2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8049f6:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8049fa:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  8049fe:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a02:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804a06:	48 85 c0             	test   rax,rax
  804a09:	74 16                	je     804a21 <sys_malloc+0x90>
  804a0b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a0f:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804a12:	85 c0                	test   eax,eax
  804a14:	75 0b                	jne    804a21 <sys_malloc+0x90>
  804a16:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a1a:	8b 00                	mov    eax,DWORD PTR [rax]
  804a1c:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804a1f:	7e d1                	jle    8049f2 <sys_malloc+0x61>
    if(hp->pgn<n)
  804a21:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a25:	8b 00                	mov    eax,DWORD PTR [rax]
  804a27:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804a2a:	0f 8e 8d 00 00 00    	jle    804abd <sys_malloc+0x12c>
    {
        //上抬heap top
        if(task[cur_proc].mem_struct.heap_top+CHUNK_SIZE*n>=HEAP_MAXTOP)
  804a30:	8b 05 d6 fa c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fad6]        # 41450c <cur_proc>
  804a36:	48 63 d0             	movsxd rdx,eax
  804a39:	48 89 d0             	mov    rax,rdx
  804a3c:	48 01 c0             	add    rax,rax
  804a3f:	48 01 d0             	add    rax,rdx
  804a42:	48 c1 e0 08          	shl    rax,0x8
  804a46:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804a4c:	8b 10                	mov    edx,DWORD PTR [rax]
  804a4e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804a51:	c1 e0 0c             	shl    eax,0xc
  804a54:	01 d0                	add    eax,edx
  804a56:	3d ff ff ef 01       	cmp    eax,0x1efffff
  804a5b:	7e 0a                	jle    804a67 <sys_malloc+0xd6>
        {
            //超过顶部
            return NULL;
  804a5d:	b8 00 00 00 00       	mov    eax,0x0
  804a62:	e9 cf 00 00 00       	jmp    804b36 <sys_malloc+0x1a5>
        }
        int needed=n-hp->pgn;
  804a67:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a6b:	8b 10                	mov    edx,DWORD PTR [rax]
  804a6d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804a70:	29 d0                	sub    eax,edx
  804a72:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
        char* p=task[cur_proc].mem_struct.heap_top;
  804a75:	8b 05 91 fa c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fa91]        # 41450c <cur_proc>
  804a7b:	48 63 d0             	movsxd rdx,eax
  804a7e:	48 89 d0             	mov    rax,rdx
  804a81:	48 01 c0             	add    rax,rax
  804a84:	48 01 d0             	add    rax,rdx
  804a87:	48 c1 e0 08          	shl    rax,0x8
  804a8b:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804a91:	8b 00                	mov    eax,DWORD PTR [rax]
  804a93:	48 98                	cdqe   
  804a95:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804a99:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804aa0:	eb 13                	jmp    804ab5 <sys_malloc+0x124>
        {
            *p=0;//触发缺页中断
  804aa2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804aa6:	c6 00 00             	mov    BYTE PTR [rax],0x0
            p+=PAGE_SIZE;
  804aa9:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  804ab0:	00 
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804ab1:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804ab5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804ab8:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  804abb:	7c e5                	jl     804aa2 <sys_malloc+0x111>
        }
    }
    if(hp->pgn>n)
  804abd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804ac1:	8b 00                	mov    eax,DWORD PTR [rax]
  804ac3:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804ac6:	7d 59                	jge    804b21 <sys_malloc+0x190>
    {
        //在后面新建一个头
        char *p=hp;
  804ac8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804acc:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        p+=(n+1)*CHUNK_SIZE;//算上存储头一个
  804ad0:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804ad3:	83 c0 01             	add    eax,0x1
  804ad6:	c1 e0 0c             	shl    eax,0xc
  804ad9:	48 98                	cdqe   
  804adb:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
        chunk_header *np=p;
  804adf:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804ae3:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
        np->pgn=hp->pgn-n-1;
  804ae7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804aeb:	8b 00                	mov    eax,DWORD PTR [rax]
  804aed:	2b 45 e8             	sub    eax,DWORD PTR [rbp-0x18]
  804af0:	8d 50 ff             	lea    edx,[rax-0x1]
  804af3:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804af7:	89 10                	mov    DWORD PTR [rax],edx
        np->next=hp->next;
  804af9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804afd:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  804b01:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804b05:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
        np->prev=hp;
  804b09:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804b0d:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804b11:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
        hp->next=np;
  804b15:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b19:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804b1d:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    }
    hp->alloc=1;//分配完毕
  804b21:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b25:	c7 40 04 01 00 00 00 	mov    DWORD PTR [rax+0x4],0x1
    return (char*)hp+CHUNK_SIZE;//返回后边的第一个数据块地址
  804b2c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b30:	48 05 00 10 00 00    	add    rax,0x1000
}
  804b36:	5d                   	pop    rbp
  804b37:	c3                   	ret    

0000000000804b38 <sys_free>:
int sys_free(int ptr)
{
  804b38:	f3 0f 1e fa          	endbr64 
  804b3c:	55                   	push   rbp
  804b3d:	48 89 e5             	mov    rbp,rsp
  804b40:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    chunk_header *hp=ptr-CHUNK_SIZE;//回退到头
  804b43:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804b46:	2d 00 10 00 00       	sub    eax,0x1000
  804b4b:	48 98                	cdqe   
  804b4d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    hp->alloc=0;
  804b51:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b55:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
    //合并
    //向后合并
    chunk_header *p=hp->next;
  804b5c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b60:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804b64:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804b68:	eb 2e                	jmp    804b98 <sys_free+0x60>
    {
        if(p->alloc==0)
  804b6a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b6e:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804b71:	85 c0                	test   eax,eax
  804b73:	75 2c                	jne    804ba1 <sys_free+0x69>
        {
            hp->pgn+=p->pgn+1;//把区域合并
  804b75:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b79:	8b 10                	mov    edx,DWORD PTR [rax]
  804b7b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b7f:	8b 00                	mov    eax,DWORD PTR [rax]
  804b81:	83 c0 01             	add    eax,0x1
  804b84:	01 c2                	add    edx,eax
  804b86:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b8a:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->next;
  804b8c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b90:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804b94:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804b98:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804b9d:	75 cb                	jne    804b6a <sys_free+0x32>
  804b9f:	eb 01                	jmp    804ba2 <sys_free+0x6a>
            break;
  804ba1:	90                   	nop
    }
    //向前合并
    p=hp->prev;
  804ba2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804ba6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  804baa:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804bae:	eb 2e                	jmp    804bde <sys_free+0xa6>
    {
        if(p->alloc==0)
  804bb0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804bb4:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804bb7:	85 c0                	test   eax,eax
  804bb9:	75 2c                	jne    804be7 <sys_free+0xaf>
        {
            p->pgn+=hp->pgn+1;//把区域合并
  804bbb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804bbf:	8b 10                	mov    edx,DWORD PTR [rax]
  804bc1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804bc5:	8b 00                	mov    eax,DWORD PTR [rax]
  804bc7:	83 c0 01             	add    eax,0x1
  804bca:	01 c2                	add    edx,eax
  804bcc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804bd0:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->prev;
  804bd2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804bd6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  804bda:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804bde:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804be3:	75 cb                	jne    804bb0 <sys_free+0x78>
  804be5:	eb 01                	jmp    804be8 <sys_free+0xb0>
            break;
  804be7:	90                   	nop
    }
    //合并完成
    return 0;
  804be8:	b8 00 00 00 00       	mov    eax,0x0
}
  804bed:	5d                   	pop    rbp
  804bee:	c3                   	ret    

0000000000804bef <switch_to>:

void switch_to(struct process *from, struct process *to) {
  804bef:	f3 0f 1e fa          	endbr64 
  804bf3:	55                   	push   rbp
  804bf4:	48 89 e5             	mov    rbp,rsp
  804bf7:	53                   	push   rbx
  804bf8:	48 89 7d f0          	mov    QWORD PTR [rbp-0x10],rdi
  804bfc:	48 89 75 e8          	mov    QWORD PTR [rbp-0x18],rsi
    cur_proc=to-task;
  804c00:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804c04:	48 2d a0 84 40 00    	sub    rax,0x4084a0
  804c0a:	48 c1 f8 08          	sar    rax,0x8
  804c0e:	48 89 c2             	mov    rdx,rax
  804c11:	48 b8 ab aa aa aa aa 	movabs rax,0xaaaaaaaaaaaaaaab
  804c18:	aa aa aa 
  804c1b:	48 0f af c2          	imul   rax,rdx
  804c1f:	89 05 e7 f8 c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0f8e7],eax        # 41450c <cur_proc>
    asm volatile("mov %%rsp,%0\r\n"
  804c25:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  804c29:	4c 8b 55 f0          	mov    r10,QWORD PTR [rbp-0x10]
  804c2d:	4c 8b 5d f0          	mov    r11,QWORD PTR [rbp-0x10]
  804c31:	48 8b 5d f0          	mov    rbx,QWORD PTR [rbp-0x10]
  804c35:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804c39:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804c3d:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  804c41:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  804c45:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  804c49:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  804c4d:	49 89 a1 68 02 00 00 	mov    QWORD PTR [r9+0x268],rsp
  804c54:	48 8d 05 24 00 00 00 	lea    rax,[rip+0x24]        # 804c7f <done>
  804c5b:	49 89 82 38 02 00 00 	mov    QWORD PTR [r10+0x238],rax
  804c62:	41 8c a3 a8 02 00 00 	mov    WORD PTR [r11+0x2a8],fs
  804c69:	8c ab b0 02 00 00    	mov    WORD PTR [rbx+0x2b0],gs
  804c6f:	48 8b a1 68 02 00 00 	mov    rsp,QWORD PTR [rcx+0x268]
  804c76:	41 ff b0 38 02 00 00 	push   QWORD PTR [r8+0x238]
  804c7d:	eb 08                	jmp    804c87 <__switch_to>

0000000000804c7f <done>:
  804c7f:	90                   	nop
                 "nop":"=m"(from->regs.rsp),"=m"(from->regs.rip),
                 "=m"(from->regs.fs),"=m"(from->regs.gs):
                "m"(to->regs.fs),"m"(to->regs.gs),"m"(to->regs.rsp),"m"(to->regs.rip),
                "D"(from),"S"(to));

}
  804c80:	90                   	nop
  804c81:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804c85:	c9                   	leave  
  804c86:	c3                   	ret    

0000000000804c87 <__switch_to>:
void __switch_to(struct process *from, struct process *to) {
  804c87:	f3 0f 1e fa          	endbr64 
  804c8b:	55                   	push   rbp
  804c8c:	48 89 e5             	mov    rbp,rsp
  804c8f:	53                   	push   rbx
  804c90:	48 83 ec 18          	sub    rsp,0x18
  804c94:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  804c98:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804c9c:	48 8b 05 3d 62 00 00 	mov    rax,QWORD PTR [rip+0x623d]        # 80aee0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804ca3:	4c 8b 50 54          	mov    r10,QWORD PTR [rax+0x54]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804ca7:	48 8b 05 32 62 00 00 	mov    rax,QWORD PTR [rip+0x6232]        # 80aee0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804cae:	4c 8b 48 4c          	mov    r9,QWORD PTR [rax+0x4c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804cb2:	48 8b 05 27 62 00 00 	mov    rax,QWORD PTR [rip+0x6227]        # 80aee0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804cb9:	4c 8b 40 44          	mov    r8,QWORD PTR [rax+0x44]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804cbd:	48 8b 05 1c 62 00 00 	mov    rax,QWORD PTR [rip+0x621c]        # 80aee0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804cc4:	48 8b 78 3c          	mov    rdi,QWORD PTR [rax+0x3c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804cc8:	48 8b 05 11 62 00 00 	mov    rax,QWORD PTR [rip+0x6211]        # 80aee0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804ccf:	48 8b 58 34          	mov    rbx,QWORD PTR [rax+0x34]
  804cd3:	48 8b 05 06 62 00 00 	mov    rax,QWORD PTR [rip+0x6206]        # 80aee0 <tss>
  804cda:	4c 8b 58 2c          	mov    r11,QWORD PTR [rax+0x2c]
  804cde:	48 8b 05 fb 61 00 00 	mov    rax,QWORD PTR [rip+0x61fb]        # 80aee0 <tss>
  804ce5:	48 8b 48 24          	mov    rcx,QWORD PTR [rax+0x24]
  804ce9:	48 8b 05 f0 61 00 00 	mov    rax,QWORD PTR [rip+0x61f0]        # 80aee0 <tss>
  804cf0:	48 8b 50 14          	mov    rdx,QWORD PTR [rax+0x14]
  804cf4:	48 8b 05 e5 61 00 00 	mov    rax,QWORD PTR [rip+0x61e5]        # 80aee0 <tss>
  804cfb:	48 8b 70 0c          	mov    rsi,QWORD PTR [rax+0xc]
  804cff:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804d03:	48 8b 80 c8 01 00 00 	mov    rax,QWORD PTR [rax+0x1c8]
  804d0a:	41 52                	push   r10
  804d0c:	41 51                	push   r9
  804d0e:	41 50                	push   r8
  804d10:	57                   	push   rdi
  804d11:	49 89 d9             	mov    r9,rbx
  804d14:	4d 89 d8             	mov    r8,r11
  804d17:	48 89 c7             	mov    rdi,rax
  804d1a:	e8 33 00 00 00       	call   804d52 <set_tss>
  804d1f:	48 83 c4 20          	add    rsp,0x20
    asm volatile("mov %%fs,%0\r\n"
  804d23:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804d27:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  804d2b:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804d2f:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  804d33:	8c a0 a8 02 00 00    	mov    WORD PTR [rax+0x2a8],fs
  804d39:	8c ae b0 02 00 00    	mov    WORD PTR [rsi+0x2b0],gs
  804d3f:	8e a2 a8 02 00 00    	mov    fs,WORD PTR [rdx+0x2a8]
  804d45:	8e a9 b0 02 00 00    	mov    gs,WORD PTR [rcx+0x2b0]
                 "mov %%gs,%1\r\n"
                 "mov %2,%%fs\r\n"
                 "mov %3,%%gs":"=m"(to->regs.fs),"=m"(to->regs.gs):
                 "m"(from->regs.fs),"m"(from->regs.gs));
}
  804d4b:	90                   	nop
  804d4c:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804d50:	c9                   	leave  
  804d51:	c3                   	ret    

0000000000804d52 <set_tss>:

void set_tss(u64 rsp0,u64 rsp1,u64 rsp2,u64 ist0,u64 ist1,u64 ist2,u64 ist3,u64 ist4,u64 ist5,u64 ist6){
  804d52:	f3 0f 1e fa          	endbr64 
  804d56:	55                   	push   rbp
  804d57:	48 89 e5             	mov    rbp,rsp
  804d5a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  804d5e:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  804d62:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  804d66:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  804d6a:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
  804d6e:	4c 89 4d d0          	mov    QWORD PTR [rbp-0x30],r9
    tss->rsp0=rsp0;
  804d72:	48 8b 05 67 61 00 00 	mov    rax,QWORD PTR [rip+0x6167]        # 80aee0 <tss>
  804d79:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804d7d:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx
    tss->rsp1=rsp1;
  804d81:	48 8b 05 58 61 00 00 	mov    rax,QWORD PTR [rip+0x6158]        # 80aee0 <tss>
  804d88:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  804d8c:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    tss->rsp2=rsp2;
  804d90:	48 8b 05 49 61 00 00 	mov    rax,QWORD PTR [rip+0x6149]        # 80aee0 <tss>
  804d97:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804d9b:	48 89 50 14          	mov    QWORD PTR [rax+0x14],rdx
    tss->ists[0]=ist0;
  804d9f:	48 8b 05 3a 61 00 00 	mov    rax,QWORD PTR [rip+0x613a]        # 80aee0 <tss>
  804da6:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  804daa:	48 89 50 24          	mov    QWORD PTR [rax+0x24],rdx
    tss->ists[1]=ist1;
  804dae:	48 8b 05 2b 61 00 00 	mov    rax,QWORD PTR [rip+0x612b]        # 80aee0 <tss>
  804db5:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  804db9:	48 89 50 2c          	mov    QWORD PTR [rax+0x2c],rdx
    tss->ists[2]=ist2;
  804dbd:	48 8b 05 1c 61 00 00 	mov    rax,QWORD PTR [rip+0x611c]        # 80aee0 <tss>
  804dc4:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804dc8:	48 89 50 34          	mov    QWORD PTR [rax+0x34],rdx
    tss->ists[3]=ist3;
  804dcc:	48 8b 05 0d 61 00 00 	mov    rax,QWORD PTR [rip+0x610d]        # 80aee0 <tss>
  804dd3:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  804dd7:	48 89 50 3c          	mov    QWORD PTR [rax+0x3c],rdx
    tss->ists[4]=ist4;
  804ddb:	48 8b 05 fe 60 00 00 	mov    rax,QWORD PTR [rip+0x60fe]        # 80aee0 <tss>
  804de2:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  804de6:	48 89 50 44          	mov    QWORD PTR [rax+0x44],rdx
    tss->ists[5]=ist5;
  804dea:	48 8b 05 ef 60 00 00 	mov    rax,QWORD PTR [rip+0x60ef]        # 80aee0 <tss>
  804df1:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  804df5:	48 89 50 4c          	mov    QWORD PTR [rax+0x4c],rdx
    tss->ists[6]=ist6;
  804df9:	48 8b 05 e0 60 00 00 	mov    rax,QWORD PTR [rip+0x60e0]        # 80aee0 <tss>
  804e00:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  804e04:	48 89 50 54          	mov    QWORD PTR [rax+0x54],rdx
}
  804e08:	90                   	nop
  804e09:	5d                   	pop    rbp
  804e0a:	c3                   	ret    
  804e0b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000804e10 <outb>:
  804e10:	66 89 fa             	mov    dx,di
  804e13:	66 89 f0             	mov    ax,si
  804e16:	ee                   	out    dx,al
  804e17:	e8 29 00 00 00       	call   804e45 <io_delay>
  804e1c:	c3                   	ret    

0000000000804e1d <outw>:
  804e1d:	66 89 fa             	mov    dx,di
  804e20:	66 89 f0             	mov    ax,si
  804e23:	66 ef                	out    dx,ax
  804e25:	90                   	nop
  804e26:	90                   	nop
  804e27:	90                   	nop
  804e28:	c3                   	ret    

0000000000804e29 <inb>:
  804e29:	31 c0                	xor    eax,eax
  804e2b:	66 89 fa             	mov    dx,di
  804e2e:	ec                   	in     al,dx
  804e2f:	90                   	nop
  804e30:	90                   	nop
  804e31:	90                   	nop
  804e32:	c3                   	ret    

0000000000804e33 <inw>:
  804e33:	31 c0                	xor    eax,eax
  804e35:	66 89 fa             	mov    dx,di
  804e38:	66 ed                	in     ax,dx
  804e3a:	90                   	nop
  804e3b:	90                   	nop
  804e3c:	90                   	nop
  804e3d:	c3                   	ret    

0000000000804e3e <eoi>:
  804e3e:	b0 20                	mov    al,0x20
  804e40:	e6 a0                	out    0xa0,al
  804e42:	e6 20                	out    0x20,al
  804e44:	c3                   	ret    

0000000000804e45 <io_delay>:
  804e45:	90                   	nop
  804e46:	90                   	nop
  804e47:	90                   	nop
  804e48:	90                   	nop
  804e49:	c3                   	ret    

0000000000804e4a <turn_on_int>:
  804e4a:	b0 f8                	mov    al,0xf8
  804e4c:	e6 21                	out    0x21,al
  804e4e:	e8 f2 ff ff ff       	call   804e45 <io_delay>
  804e53:	b0 af                	mov    al,0xaf
  804e55:	e6 a1                	out    0xa1,al
  804e57:	e8 e9 ff ff ff       	call   804e45 <io_delay>
  804e5c:	b8 00 70 10 00       	mov    eax,0x107000
  804e61:	0f 01 18             	lidt   [rax]
  804e64:	90                   	nop
  804e65:	90                   	nop
  804e66:	90                   	nop
  804e67:	90                   	nop
  804e68:	fb                   	sti    
  804e69:	c3                   	ret    

0000000000804e6a <report_back_trace_of_err>:
  804e6a:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  804e6f:	50                   	push   rax
  804e70:	68 79 4e 80 00       	push   0x804e79
  804e75:	83 c4 08             	add    esp,0x8
  804e78:	c3                   	ret    

0000000000804e79 <bt_msg>:
  804e79:	65 72 72             	gs jb  804eee <fill_desc+0x4e>
  804e7c:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  804e7d:	72 20                	jb     804e9f <init_gdt+0x11>
  804e7f:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  804e80:	63 63 75             	movsxd esp,DWORD PTR [rbx+0x75]
  804e83:	72 73                	jb     804ef8 <fill_desc+0x58>
  804e85:	20 61 74             	and    BYTE PTR [rcx+0x74],ah
  804e88:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR [rip+0x6e5c78]        # eeab06 <_knl_end+0x2eab06>

0000000000804e8e <init_gdt>:
#include "gdt.h"
#include "int.h"
descriptor *gdt=GDT_ADDR;
extern char *gdtptr;
int init_gdt()
{
  804e8e:	f3 0f 1e fa          	endbr64 
  804e92:	55                   	push   rbp
  804e93:	48 89 e5             	mov    rbp,rsp
//    fill_desc(0x108000,108,SEG_SYS_TSS|SEG_PRESENT,4);
    asm volatile("mov $0x48,%ax\r\n"
  804e96:	66 b8 48 00          	mov    ax,0x48
  804e9a:	0f 00 d8             	ltr    ax
                 "ltr %ax");  
}
  804e9d:	90                   	nop
  804e9e:	5d                   	pop    rbp
  804e9f:	c3                   	ret    

0000000000804ea0 <fill_desc>:
void fill_desc(u64 base, u64 limit, u16 attr, u32 index)
{
  804ea0:	f3 0f 1e fa          	endbr64 
  804ea4:	55                   	push   rbp
  804ea5:	48 89 e5             	mov    rbp,rsp
  804ea8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  804eac:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  804eb0:	89 d0                	mov    eax,edx
  804eb2:	89 4d e8             	mov    DWORD PTR [rbp-0x18],ecx
  804eb5:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    gdt[index].base_12=base&0xffff;
  804eb9:	48 8b 15 28 60 00 00 	mov    rdx,QWORD PTR [rip+0x6028]        # 80aee8 <gdt>
  804ec0:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804ec3:	48 c1 e0 04          	shl    rax,0x4
  804ec7:	48 01 d0             	add    rax,rdx
  804eca:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804ece:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    gdt[index].base_3=(base>>16)&0xff;
  804ed2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804ed6:	48 c1 e8 10          	shr    rax,0x10
  804eda:	48 89 c1             	mov    rcx,rax
  804edd:	48 8b 15 04 60 00 00 	mov    rdx,QWORD PTR [rip+0x6004]        # 80aee8 <gdt>
  804ee4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804ee7:	48 c1 e0 04          	shl    rax,0x4
  804eeb:	48 01 d0             	add    rax,rdx
  804eee:	89 ca                	mov    edx,ecx
  804ef0:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    gdt[index].base_4=(base>>24)&0xff;
  804ef3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804ef7:	48 c1 e8 18          	shr    rax,0x18
  804efb:	48 89 c1             	mov    rcx,rax
  804efe:	48 8b 15 e3 5f 00 00 	mov    rdx,QWORD PTR [rip+0x5fe3]        # 80aee8 <gdt>
  804f05:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804f08:	48 c1 e0 04          	shl    rax,0x4
  804f0c:	48 01 d0             	add    rax,rdx
  804f0f:	89 ca                	mov    edx,ecx
  804f11:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    gdt[index].base_5678=(base>>32)&0xffffffff;
  804f14:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804f18:	48 c1 e8 20          	shr    rax,0x20
  804f1c:	48 89 c2             	mov    rdx,rax
  804f1f:	48 8b 0d c2 5f 00 00 	mov    rcx,QWORD PTR [rip+0x5fc2]        # 80aee8 <gdt>
  804f26:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804f29:	48 c1 e0 04          	shl    rax,0x4
  804f2d:	48 01 c8             	add    rax,rcx
  804f30:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    gdt[index].limit_lo16=limit&0xffff;
  804f33:	48 8b 15 ae 5f 00 00 	mov    rdx,QWORD PTR [rip+0x5fae]        # 80aee8 <gdt>
  804f3a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804f3d:	48 c1 e0 04          	shl    rax,0x4
  804f41:	48 01 d0             	add    rax,rdx
  804f44:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  804f48:	66 89 10             	mov    WORD PTR [rax],dx
    gdt[index].attr=attr|((limit>>8)&0xf0);
  804f4b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804f4f:	48 c1 e8 08          	shr    rax,0x8
  804f53:	66 25 f0 00          	and    ax,0xf0
  804f57:	48 8b 0d 8a 5f 00 00 	mov    rcx,QWORD PTR [rip+0x5f8a]        # 80aee8 <gdt>
  804f5e:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804f61:	48 c1 e2 04          	shl    rdx,0x4
  804f65:	48 01 ca             	add    rdx,rcx
  804f68:	66 0b 45 ec          	or     ax,WORD PTR [rbp-0x14]
  804f6c:	66 89 42 05          	mov    WORD PTR [rdx+0x5],ax

}
  804f70:	90                   	nop
  804f71:	5d                   	pop    rbp
  804f72:	c3                   	ret    

0000000000804f73 <fill_gate>:

void fill_gate(u32 index,u32 offset,u16 selector,u16 attr)
{
  804f73:	f3 0f 1e fa          	endbr64 
  804f77:	55                   	push   rbp
  804f78:	48 89 e5             	mov    rbp,rsp
  804f7b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  804f7e:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  804f81:	89 c8                	mov    eax,ecx
  804f83:	66 89 55 e4          	mov    WORD PTR [rbp-0x1c],dx
  804f87:	66 89 45 e0          	mov    WORD PTR [rbp-0x20],ax
    gate* ptr=gdt;
  804f8b:	48 8b 05 56 5f 00 00 	mov    rax,QWORD PTR [rip+0x5f56]        # 80aee8 <gdt>
  804f92:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ptr[index].offset_low=offset&0xffff;
  804f96:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804f99:	48 c1 e0 04          	shl    rax,0x4
  804f9d:	48 89 c2             	mov    rdx,rax
  804fa0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804fa4:	48 01 d0             	add    rax,rdx
  804fa7:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804faa:	66 89 10             	mov    WORD PTR [rax],dx
    ptr[index].offset_high=(offset>>16)&0xffff;
  804fad:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804fb0:	48 c1 e0 04          	shl    rax,0x4
  804fb4:	48 89 c2             	mov    rdx,rax
  804fb7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804fbb:	48 01 d0             	add    rax,rdx
  804fbe:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804fc1:	c1 ea 10             	shr    edx,0x10
  804fc4:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    ptr[index].selector=selector;
  804fc7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804fca:	48 c1 e0 04          	shl    rax,0x4
  804fce:	48 89 c2             	mov    rdx,rax
  804fd1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804fd5:	48 01 c2             	add    rdx,rax
  804fd8:	0f b7 45 e4          	movzx  eax,WORD PTR [rbp-0x1c]
  804fdc:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    ptr[index].attr=attr;
  804fe0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804fe3:	48 c1 e0 04          	shl    rax,0x4
  804fe7:	48 89 c2             	mov    rdx,rax
  804fea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804fee:	48 01 c2             	add    rdx,rax
  804ff1:	0f b7 45 e0          	movzx  eax,WORD PTR [rbp-0x20]
  804ff5:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
}
  804ff9:	90                   	nop
  804ffa:	5d                   	pop    rbp
  804ffb:	c3                   	ret    

0000000000804ffc <fill_ldt_desc>:

void fill_ldt_desc(u32 base, u32 limit,u16 attr,descriptor *desc)
{
  804ffc:	f3 0f 1e fa          	endbr64 
  805000:	55                   	push   rbp
  805001:	48 89 e5             	mov    rbp,rsp
  805004:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  805007:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  80500a:	89 d0                	mov    eax,edx
  80500c:	48 89 4d e8          	mov    QWORD PTR [rbp-0x18],rcx
  805010:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
//    desc->base_lo16=base&0xffff;
//    desc->base_mid8=(base>>16)&0xff;
//    desc->base_hi8=(base>>24)&0xff;
//    desc->limit_lo16=limit&0xffff;
//    desc->attr=attr|(limit>>16&0xf)<<8;
  805014:	90                   	nop
  805015:	5d                   	pop    rbp
  805016:	c3                   	ret    
  805017:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  80501e:	00 00 

0000000000805020 <fill_desc>:
  805020:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  805025:	67 8b 5c 24 08       	mov    ebx,DWORD PTR [esp+0x8]
  80502a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  80502f:	67 8b 54 24 10       	mov    edx,DWORD PTR [esp+0x10]
  805034:	be 00 60 00 00       	mov    esi,0x6000
  805039:	c1 e2 03             	shl    edx,0x3
  80503c:	01 d6                	add    esi,edx
  80503e:	66 67 89 1e          	mov    WORD PTR [esi],bx
  805042:	66 67 89 46 02       	mov    WORD PTR [esi+0x2],ax
  805047:	c1 e8 10             	shr    eax,0x10
  80504a:	67 88 46 04          	mov    BYTE PTR [esi+0x4],al
  80504e:	c1 eb 10             	shr    ebx,0x10
  805051:	67 88 5e 06          	mov    BYTE PTR [esi+0x6],bl
  805055:	67 88 66 07          	mov    BYTE PTR [esi+0x7],ah
  805059:	67 09 4e 05          	or     DWORD PTR [esi+0x5],ecx
  80505d:	c3                   	ret    

000000000080505e <clock_c>:
#include <devman.h>
#include <disk.h>
extern int manage_proc_lock;
extern int cur_proc;
extern struct process *task;
void clock_c(){
  80505e:	f3 0f 1e fa          	endbr64 
  805062:	55                   	push   rbp
  805063:	48 89 e5             	mov    rbp,rsp
    //refresh_wnds();
    execute_request();
  805066:	b8 00 00 00 00       	mov    eax,0x0
  80506b:	e8 4f 1b 00 00       	call   806bbf <execute_request>
    do_req();
  805070:	b8 00 00 00 00       	mov    eax,0x0
  805075:	e8 b3 e7 ff ff       	call   80382d <do_req>
    if(!manage_proc_lock)
  80507a:	8b 05 08 5e 00 00    	mov    eax,DWORD PTR [rip+0x5e08]        # 80ae88 <manage_proc_lock>
  805080:	85 c0                	test   eax,eax
  805082:	75 0a                	jne    80508e <clock_c+0x30>
    {
        manage_proc();
  805084:	b8 00 00 00 00       	mov    eax,0x0
  805089:	e8 9e ee ff ff       	call   803f2c <manage_proc>
    }
    //puts("1 disk req executed.");
  80508e:	90                   	nop
  80508f:	5d                   	pop    rbp
  805090:	c3                   	ret    
  805091:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  805098:	00 00 00 
  80509b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000008050a0 <clock>:
  8050a0:	50                   	push   rax
  8050a1:	53                   	push   rbx
  8050a2:	51                   	push   rcx
  8050a3:	52                   	push   rdx
  8050a4:	57                   	push   rdi
  8050a5:	56                   	push   rsi
  8050a6:	41 50                	push   r8
  8050a8:	41 51                	push   r9
  8050aa:	41 52                	push   r10
  8050ac:	41 53                	push   r11
  8050ae:	41 54                	push   r12
  8050b0:	41 55                	push   r13
  8050b2:	41 56                	push   r14
  8050b4:	41 57                	push   r15
  8050b6:	66 8c c0             	mov    ax,es
  8050b9:	66 50                	push   ax
  8050bb:	66 8c d8             	mov    ax,ds
  8050be:	66 50                	push   ax
  8050c0:	66 b8 10 00          	mov    ax,0x10
  8050c4:	8e c0                	mov    es,eax
  8050c6:	8e d8                	mov    ds,eax

00000000008050c8 <clock.normal_part>:
  8050c8:	b0 20                	mov    al,0x20
  8050ca:	e6 a0                	out    0xa0,al
  8050cc:	e6 20                	out    0x20,al
  8050ce:	e8 8b ff ff ff       	call   80505e <clock_c>
  8050d3:	66 58                	pop    ax
  8050d5:	8e d8                	mov    ds,eax
  8050d7:	66 58                	pop    ax
  8050d9:	8e c0                	mov    es,eax
  8050db:	41 5f                	pop    r15
  8050dd:	41 5e                	pop    r14
  8050df:	41 5d                	pop    r13
  8050e1:	41 5c                	pop    r12
  8050e3:	41 5b                	pop    r11
  8050e5:	41 5a                	pop    r10
  8050e7:	41 59                	pop    r9
  8050e9:	41 58                	pop    r8
  8050eb:	5e                   	pop    rsi
  8050ec:	5f                   	pop    rdi
  8050ed:	5a                   	pop    rdx
  8050ee:	59                   	pop    rcx
  8050ef:	5b                   	pop    rbx
  8050f0:	58                   	pop    rax
  8050f1:	48 cf                	iretq  

00000000008050f3 <execute>:
    return ind;
}
*/

int execute(char *path)
{
  8050f3:	f3 0f 1e fa          	endbr64 
  8050f7:	55                   	push   rbp
  8050f8:	48 89 e5             	mov    rbp,rsp
  8050fb:	48 83 ec 30          	sub    rsp,0x30
  8050ff:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    //尚未切换到目标进程
    //syscall(SYSCALL_REG_PROC, load_pe,0,0,0,0);
    int fno=-1,cwd_fno=-1;
  805103:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  80510a:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    if((fno=sys_open(path, 1)) == -1)return -1;
  805111:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805115:	be 01 00 00 00       	mov    esi,0x1
  80511a:	48 89 c7             	mov    rdi,rax
  80511d:	e8 0f cb ff ff       	call   801c31 <sys_open>
  805122:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  805125:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  805129:	75 0a                	jne    805135 <execute+0x42>
  80512b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805130:	e9 b7 00 00 00       	jmp    8051ec <execute+0xf9>
    //
    char *p=path;
  805135:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805139:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='\0';p++);
  80513d:	eb 05                	jmp    805144 <execute+0x51>
  80513f:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  805144:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805148:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80514b:	84 c0                	test   al,al
  80514d:	75 f0                	jne    80513f <execute+0x4c>
    for(;*p!='/'&&p>path;p--);
  80514f:	eb 05                	jmp    805156 <execute+0x63>
  805151:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  805156:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80515a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80515d:	3c 2f                	cmp    al,0x2f
  80515f:	74 0a                	je     80516b <execute+0x78>
  805161:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805165:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  805169:	77 e6                	ja     805151 <execute+0x5e>
    if(p>path)
  80516b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80516f:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  805173:	76 2f                	jbe    8051a4 <execute+0xb1>
    {
        *p='\0';
  805175:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805179:	c6 00 00             	mov    BYTE PTR [rax],0x0
        if((cwd_fno=sys_open(path, 1)) == -1)return -1;
  80517c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805180:	be 01 00 00 00       	mov    esi,0x1
  805185:	48 89 c7             	mov    rdi,rax
  805188:	e8 a4 ca ff ff       	call   801c31 <sys_open>
  80518d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805190:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  805194:	75 07                	jne    80519d <execute+0xaa>
  805196:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80519b:	eb 4f                	jmp    8051ec <execute+0xf9>
        *p='/';
  80519d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8051a1:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
    }
    extern vfs_dir_entry opened[];
    extern struct process task[];
    int pi= reg_proc(proc_start, &opened[cwd_fno], &opened[fno]);
  8051a4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8051a7:	48 63 d0             	movsxd rdx,eax
  8051aa:	48 89 d0             	mov    rax,rdx
  8051ad:	48 01 c0             	add    rax,rax
  8051b0:	48 01 d0             	add    rax,rdx
  8051b3:	48 c1 e0 05          	shl    rax,0x5
  8051b7:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  8051be:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8051c1:	48 63 c8             	movsxd rcx,eax
  8051c4:	48 89 c8             	mov    rax,rcx
  8051c7:	48 01 c0             	add    rax,rax
  8051ca:	48 01 c8             	add    rax,rcx
  8051cd:	48 c1 e0 05          	shl    rax,0x5
  8051d1:	48 05 60 06 40 00    	add    rax,0x400660
  8051d7:	b9 64 52 80 00       	mov    ecx,0x805264
  8051dc:	48 89 c6             	mov    rsi,rax
  8051df:	89 cf                	mov    edi,ecx
  8051e1:	e8 10 f6 ff ff       	call   8047f6 <reg_proc>
  8051e6:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    return pi;
  8051e9:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
}
  8051ec:	c9                   	leave  
  8051ed:	c3                   	ret    

00000000008051ee <exec_call>:

int exec_call(char *path)
{
  8051ee:	f3 0f 1e fa          	endbr64 
  8051f2:	55                   	push   rbp
  8051f3:	48 89 e5             	mov    rbp,rsp
  8051f6:	48 83 ec 20          	sub    rsp,0x20
  8051fa:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pi=execute(path);
  8051fe:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805202:	48 89 c7             	mov    rdi,rax
  805205:	e8 e9 fe ff ff       	call   8050f3 <execute>
  80520a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int tss= _TSS_IND(pi)*8;
  80520d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805210:	01 c0                	add    eax,eax
  805212:	83 c0 05             	add    eax,0x5
  805215:	c1 e0 03             	shl    eax,0x3
  805218:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    extern struct process task[];
    extern int cur_proc;
    switch_proc_tss(pi);
  80521b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80521e:	89 c7                	mov    edi,eax
  805220:	e8 d3 ee ff ff       	call   8040f8 <switch_proc_tss>
    while(task[pi].stat!=ENDED);
  805225:	90                   	nop
  805226:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805229:	48 63 d0             	movsxd rdx,eax
  80522c:	48 89 d0             	mov    rax,rdx
  80522f:	48 01 c0             	add    rax,rax
  805232:	48 01 d0             	add    rax,rdx
  805235:	48 c1 e0 08          	shl    rax,0x8
  805239:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80523f:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805242:	83 f8 03             	cmp    eax,0x3
  805245:	75 df                	jne    805226 <exec_call+0x38>
    return task[pi].exit_code;
  805247:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80524a:	48 63 d0             	movsxd rdx,eax
  80524d:	48 89 d0             	mov    rax,rdx
  805250:	48 01 c0             	add    rax,rax
  805253:	48 01 d0             	add    rax,rdx
  805256:	48 c1 e0 08          	shl    rax,0x8
  80525a:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805260:	8b 00                	mov    eax,DWORD PTR [rax]
}
  805262:	c9                   	leave  
  805263:	c3                   	ret    

0000000000805264 <proc_start>:
int proc_start()
{
  805264:	f3 0f 1e fa          	endbr64 
  805268:	55                   	push   rbp
  805269:	48 89 e5             	mov    rbp,rsp
    extern struct process task[];
    extern int cur_proc;
    load_pe(&task[cur_proc]);
  80526c:	8b 05 9a f2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f29a]        # 41450c <cur_proc>
  805272:	48 63 d0             	movsxd rdx,eax
  805275:	48 89 d0             	mov    rax,rdx
  805278:	48 01 c0             	add    rax,rax
  80527b:	48 01 d0             	add    rax,rdx
  80527e:	48 c1 e0 08          	shl    rax,0x8
  805282:	48 05 a0 84 40 00    	add    rax,0x4084a0
  805288:	48 89 c7             	mov    rdi,rax
  80528b:	e8 1a 00 00 00       	call   8052aa <load_pe>
    //释放进程资源
    del_proc(cur_proc);
  805290:	8b 05 76 f2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f276]        # 41450c <cur_proc>
  805296:	89 c7                	mov    edi,eax
  805298:	e8 2b f3 ff ff       	call   8045c8 <del_proc>
    switch_proc_tss(0);
  80529d:	bf 00 00 00 00       	mov    edi,0x0
  8052a2:	e8 51 ee ff ff       	call   8040f8 <switch_proc_tss>
}
  8052a7:	90                   	nop
  8052a8:	5d                   	pop    rbp
  8052a9:	c3                   	ret    

00000000008052aa <load_pe>:
//在cr3切换到目标进程下的加载程序(但进程还没调度到那里)。
int load_pe(struct process *proc)
{
  8052aa:	f3 0f 1e fa          	endbr64 
  8052ae:	55                   	push   rbp
  8052af:	48 89 e5             	mov    rbp,rsp
  8052b2:	48 81 ec c0 02 00 00 	sub    rsp,0x2c0
  8052b9:	48 89 bd 48 fd ff ff 	mov    QWORD PTR [rbp-0x2b8],rdi
    // 读取文件头
    vfs_dir_entry *f=proc->exef;
  8052c0:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  8052c7:	48 8b 80 bc 00 00 00 	mov    rax,QWORD PTR [rax+0xbc]
  8052ce:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    int exefno=f->fno;
  8052d2:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8052d6:	8b 00                	mov    eax,DWORD PTR [rax]
  8052d8:	89 45 94             	mov    DWORD PTR [rbp-0x6c],eax

    IMAGE_DOS_HEADER tdh;
    IMAGE_NT_HEADERS32 tnth;
    sys_read(exefno, &tdh, sizeof(tdh));
  8052db:	48 8d 8d 70 fe ff ff 	lea    rcx,[rbp-0x190]
  8052e2:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8052e5:	ba 44 00 00 00       	mov    edx,0x44
  8052ea:	48 89 ce             	mov    rsi,rcx
  8052ed:	89 c7                	mov    edi,eax
  8052ef:	e8 1c cf ff ff       	call   802210 <sys_read>
    sys_seek(exefno,tdh.e_lfanew,SEEK_SET);
  8052f4:	48 8b 85 ac fe ff ff 	mov    rax,QWORD PTR [rbp-0x154]
  8052fb:	89 c1                	mov    ecx,eax
  8052fd:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  805300:	ba 00 00 00 00       	mov    edx,0x0
  805305:	89 ce                	mov    esi,ecx
  805307:	89 c7                	mov    edi,eax
  805309:	e8 93 cf ff ff       	call   8022a1 <sys_seek>
    sys_read(exefno, &tnth, sizeof(tnth));
  80530e:	48 8d 8d 70 fd ff ff 	lea    rcx,[rbp-0x290]
  805315:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  805318:	ba f8 00 00 00       	mov    edx,0xf8
  80531d:	48 89 ce             	mov    rsi,rcx
  805320:	89 c7                	mov    edi,eax
  805322:	e8 e9 ce ff ff       	call   802210 <sys_read>

    //是否需要移动base(先不检查)
    unsigned int nbase=tnth.OptionalHeader.ImageBase;
  805327:	8b 85 a4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x25c]
  80532d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int pgn=tnth.OptionalHeader.SizeOfImage/PAGE_SIZE;
  805330:	8b 85 c0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x240]
  805336:	c1 e8 0c             	shr    eax,0xc
  805339:	89 45 90             	mov    DWORD PTR [rbp-0x70],eax
    //use_pgm_ava检查在页表中这个范围是否可用，可用就使用
    while(1)
    {
        cont:
        ;
        int pdei=nbase/PAGE_INDEX_SIZE;
  80533c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80533f:	c1 e8 16             	shr    eax,0x16
  805342:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
        int ptei=nbase%PAGE_INDEX_SIZE/PAGE_SIZE;
  805345:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805348:	25 ff ff 3f 00       	and    eax,0x3fffff
  80534d:	c1 e8 0c             	shr    eax,0xc
  805350:	89 45 88             	mov    DWORD PTR [rbp-0x78],eax
        int *pt=(proc->pml4[pdei]&0xfffff000);
  805353:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  80535a:	48 8b 90 ac 00 00 00 	mov    rdx,QWORD PTR [rax+0xac]
  805361:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
  805364:	48 98                	cdqe   
  805366:	48 c1 e0 03          	shl    rax,0x3
  80536a:	48 01 d0             	add    rax,rdx
  80536d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805370:	25 00 f0 ff ff       	and    eax,0xfffff000
  805375:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
        for(int i=0;i<pgn;i++)
  805379:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805380:	eb 48                	jmp    8053ca <load_pe+0x120>
        {
            if(pt[ptei+i%1024]&PAGE_PRESENT&&pt!=NULL)
  805382:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805385:	99                   	cdq    
  805386:	c1 ea 16             	shr    edx,0x16
  805389:	01 d0                	add    eax,edx
  80538b:	25 ff 03 00 00       	and    eax,0x3ff
  805390:	29 d0                	sub    eax,edx
  805392:	89 c2                	mov    edx,eax
  805394:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
  805397:	01 d0                	add    eax,edx
  805399:	48 98                	cdqe   
  80539b:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8053a2:	00 
  8053a3:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8053a7:	48 01 d0             	add    rax,rdx
  8053aa:	8b 00                	mov    eax,DWORD PTR [rax]
  8053ac:	83 e0 01             	and    eax,0x1
  8053af:	85 c0                	test   eax,eax
  8053b1:	74 13                	je     8053c6 <load_pe+0x11c>
  8053b3:	48 83 7d 80 00       	cmp    QWORD PTR [rbp-0x80],0x0
  8053b8:	74 0c                	je     8053c6 <load_pe+0x11c>
            {
                //移动base
                nbase+=0x1000;
  8053ba:	81 45 fc 00 10 00 00 	add    DWORD PTR [rbp-0x4],0x1000
                goto cont;
  8053c1:	e9 76 ff ff ff       	jmp    80533c <load_pe+0x92>
        for(int i=0;i<pgn;i++)
  8053c6:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8053ca:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8053cd:	3b 45 90             	cmp    eax,DWORD PTR [rbp-0x70]
  8053d0:	7c b0                	jl     805382 <load_pe+0xd8>
            }
        }
        break;
  8053d2:	90                   	nop
    }

    //proc->tss.eip=tnth.OptionalHeader.AddressOfEntryPoint+nbase;
    //存放文件头
    sys_seek(exefno,0,SEEK_SET);
  8053d3:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8053d6:	ba 00 00 00 00       	mov    edx,0x0
  8053db:	be 00 00 00 00       	mov    esi,0x0
  8053e0:	89 c7                	mov    edi,eax
  8053e2:	e8 ba ce ff ff       	call   8022a1 <sys_seek>
    sys_read(exefno, nbase, PAGE_SIZE);
  8053e7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8053ea:	48 89 c1             	mov    rcx,rax
  8053ed:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8053f0:	ba 00 10 00 00       	mov    edx,0x1000
  8053f5:	48 89 ce             	mov    rsi,rcx
  8053f8:	89 c7                	mov    edi,eax
  8053fa:	e8 11 ce ff ff       	call   802210 <sys_read>
    //dos头
    PIMAGE_DOS_HEADER dosh=nbase;
  8053ff:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805402:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    PIMAGE_NT_HEADERS32 nth=nbase+dosh->e_lfanew;
  805409:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80540c:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805413:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  805417:	48 01 d0             	add    rax,rdx
  80541a:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    PIMAGE_FILE_HEADER fh=&nth->FileHeader;
  805421:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805428:	48 83 c0 04          	add    rax,0x4
  80542c:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    //为新进程分配内存页
    //计算所需的页
    int prog_size=nth->OptionalHeader.SizeOfImage;
  805433:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80543a:	8b 40 50             	mov    eax,DWORD PTR [rax+0x50]
  80543d:	89 85 64 ff ff ff    	mov    DWORD PTR [rbp-0x9c],eax
    int page_count=prog_size/4096;
  805443:	8b 85 64 ff ff ff    	mov    eax,DWORD PTR [rbp-0x9c]
  805449:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80544f:	85 c0                	test   eax,eax
  805451:	0f 48 c2             	cmovs  eax,edx
  805454:	c1 f8 0c             	sar    eax,0xc
  805457:	89 85 60 ff ff ff    	mov    DWORD PTR [rbp-0xa0],eax

    int shell_addr=nth->OptionalHeader.AddressOfEntryPoint+nbase;
  80545d:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805464:	8b 50 28             	mov    edx,DWORD PTR [rax+0x28]
  805467:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80546a:	01 d0                	add    eax,edx
  80546c:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
    int page_index_item_count=page_count/1024+page_count%1024==0?0:1;
  805472:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  805478:	8d 90 ff 03 00 00    	lea    edx,[rax+0x3ff]
  80547e:	85 c0                	test   eax,eax
  805480:	0f 48 c2             	cmovs  eax,edx
  805483:	c1 f8 0a             	sar    eax,0xa
  805486:	89 c1                	mov    ecx,eax
  805488:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  80548e:	99                   	cdq    
  80548f:	c1 ea 16             	shr    edx,0x16
  805492:	01 d0                	add    eax,edx
  805494:	25 ff 03 00 00       	and    eax,0x3ff
  805499:	29 d0                	sub    eax,edx
  80549b:	01 c8                	add    eax,ecx
  80549d:	85 c0                	test   eax,eax
  80549f:	0f 95 c0             	setne  al
  8054a2:	0f b6 c0             	movzx  eax,al
  8054a5:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
    int start_pgind_item=shell_addr/PAGE_INDEX_SIZE;
  8054ab:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8054b1:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  8054b7:	85 c0                	test   eax,eax
  8054b9:	0f 48 c2             	cmovs  eax,edx
  8054bc:	c1 f8 16             	sar    eax,0x16
  8054bf:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax

    //sys_read sections
    PIMAGE_SECTION_HEADER psec=(u32)nth+sizeof(IMAGE_NT_HEADERS32);
  8054c5:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8054cc:	89 c0                	mov    eax,eax
  8054ce:	48 05 f8 00 00 00    	add    rax,0xf8
  8054d4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
    nth->FileHeader.NumberOfSections*sizeof(IMAGE_SECTION_HEADER);
  8054d8:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8054df:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  8054e3:	0f b7 d0             	movzx  edx,ax
  8054e6:	89 d0                	mov    eax,edx
  8054e8:	c1 e0 02             	shl    eax,0x2
  8054eb:	01 d0                	add    eax,edx
  8054ed:	c1 e0 03             	shl    eax,0x3
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
  8054f0:	05 3c 01 00 00       	add    eax,0x13c
  8054f5:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    int align=nth->OptionalHeader.FileAlignment;
  8054fb:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805502:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  805505:	89 85 4c ff ff ff    	mov    DWORD PTR [rbp-0xb4],eax
    data_start=data_start%align?data_start-data_start%align+align:data_start;
  80550b:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805511:	99                   	cdq    
  805512:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  805518:	89 d0                	mov    eax,edx
  80551a:	85 c0                	test   eax,eax
  80551c:	74 23                	je     805541 <load_pe+0x297>
  80551e:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805524:	99                   	cdq    
  805525:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  80552b:	89 d1                	mov    ecx,edx
  80552d:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805533:	29 c8                	sub    eax,ecx
  805535:	89 c2                	mov    edx,eax
  805537:	8b 85 4c ff ff ff    	mov    eax,DWORD PTR [rbp-0xb4]
  80553d:	01 d0                	add    eax,edx
  80553f:	eb 06                	jmp    805547 <load_pe+0x29d>
  805541:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805547:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  80554d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  805554:	eb 68                	jmp    8055be <load_pe+0x314>
    {
        int disca=psec->Characteristics&IMAGE_SCN_MEM_DISCARDABLE;
  805556:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80555a:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  80555d:	25 00 00 00 02       	and    eax,0x2000000
  805562:	89 85 bc fe ff ff    	mov    DWORD PTR [rbp-0x144],eax
        if(disca)
  805568:	83 bd bc fe ff ff 00 	cmp    DWORD PTR [rbp-0x144],0x0
  80556f:	75 43                	jne    8055b4 <load_pe+0x30a>
            continue;
        //直接读，缺页内核解决
        sys_seek(exefno,psec->PointerToRawData,SEEK_SET);
  805571:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805575:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  805578:	89 c1                	mov    ecx,eax
  80557a:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  80557d:	ba 00 00 00 00       	mov    edx,0x0
  805582:	89 ce                	mov    esi,ecx
  805584:	89 c7                	mov    edi,eax
  805586:	e8 16 cd ff ff       	call   8022a1 <sys_seek>
        sys_read(exefno, psec->VirtualAddress + nbase,  psec->SizeOfRawData);
  80558b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80558f:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805592:	89 c2                	mov    edx,eax
  805594:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805598:	8b 48 0c             	mov    ecx,DWORD PTR [rax+0xc]
  80559b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80559e:	01 c8                	add    eax,ecx
  8055a0:	89 c0                	mov    eax,eax
  8055a2:	48 89 c1             	mov    rcx,rax
  8055a5:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8055a8:	48 89 ce             	mov    rsi,rcx
  8055ab:	89 c7                	mov    edi,eax
  8055ad:	e8 5e cc ff ff       	call   802210 <sys_read>
  8055b2:	eb 01                	jmp    8055b5 <load_pe+0x30b>
            continue;
  8055b4:	90                   	nop
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  8055b5:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8055b9:	48 83 45 f0 28       	add    QWORD PTR [rbp-0x10],0x28
  8055be:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8055c5:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  8055c9:	0f b7 c0             	movzx  eax,ax
  8055cc:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8055cf:	7c 85                	jl     805556 <load_pe+0x2ac>

    }

    //通过导入表加载需要的dll
    PIMAGE_DATA_DIRECTORY impd=&nth->OptionalHeader.DataDirectory[1];
  8055d1:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8055d8:	48 83 e8 80          	sub    rax,0xffffffffffffff80
  8055dc:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    if(impd->Size>0)
  8055e3:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  8055ea:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8055ed:	85 c0                	test   eax,eax
  8055ef:	0f 84 71 02 00 00    	je     805866 <load_pe+0x5bc>
    {
        int tmpi=impd->VirtualAddress+nbase;
  8055f5:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  8055fc:	8b 10                	mov    edx,DWORD PTR [rax]
  8055fe:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805601:	01 d0                	add    eax,edx
  805603:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
        PIMAGE_IMPORT_DESCRIPTOR impdes=tmpi;
  805609:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  80560f:	48 98                	cdqe   
  805611:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        int dllp;
        while (impdes->Characteristics)
  805615:	e9 3e 02 00 00       	jmp    805858 <load_pe+0x5ae>
        {
            //加载dll
            char *dllname=impdes->Name+nbase;
  80561a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80561e:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  805621:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805624:	01 d0                	add    eax,edx
  805626:	89 c0                	mov    eax,eax
  805628:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
            //此处应有加载dll代码
            int dlli;
            if(strcmp(dllname,"sys.dll")==0)//加载系统dll的部分由内核已经完成
  80562f:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  805636:	be c8 2a 81 00       	mov    esi,0x812ac8
  80563b:	48 89 c7             	mov    rdi,rax
  80563e:	e8 2c 51 00 00       	call   80a76f <strcmp>
  805643:	85 c0                	test   eax,eax
  805645:	75 09                	jne    805650 <load_pe+0x3a6>
            {
                dllp=0x1c00000;
  805647:	c7 45 dc 00 00 c0 01 	mov    DWORD PTR [rbp-0x24],0x1c00000
  80564e:	eb 25                	jmp    805675 <load_pe+0x3cb>
            }else{
                //load_pe要记录module的加载
                dlli= load_pe(proc);
  805650:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  805657:	48 89 c7             	mov    rdi,rax
  80565a:	e8 4b fc ff ff       	call   8052aa <load_pe>
  80565f:	89 85 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],eax
                //dlli=load_library(dllname);
                //这个是线性地址
                dllp=get_module_addr(dlli);
  805665:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  80566b:	89 c7                	mov    edi,eax
  80566d:	e8 e4 03 00 00       	call   805a56 <get_module_addr>
  805672:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            }
            //从线性地址查页表找到物理地址
            PIMAGE_DOS_HEADER dlldos=dllp;
  805675:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805678:	48 98                	cdqe   
  80567a:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
            PIMAGE_NT_HEADERS32 dllnth=dllp+dlldos->e_lfanew;
  805681:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805684:	48 63 d0             	movsxd rdx,eax
  805687:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  80568e:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  805692:	48 01 d0             	add    rax,rdx
  805695:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
            PIMAGE_EXPORT_DIRECTORY dllexp=(dllnth->OptionalHeader.DataDirectory[0].VirtualAddress+dllp);
  80569c:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8056a3:	8b 50 78             	mov    edx,DWORD PTR [rax+0x78]
  8056a6:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8056a9:	01 d0                	add    eax,edx
  8056ab:	89 c0                	mov    eax,eax
  8056ad:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
            int funcn=dllexp->NumberOfNames;
  8056b4:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8056bb:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  8056be:	89 85 0c ff ff ff    	mov    DWORD PTR [rbp-0xf4],eax
            char **fnames=dllexp->AddressOfNames+dllp;
  8056c4:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8056cb:	8b 50 20             	mov    edx,DWORD PTR [rax+0x20]
  8056ce:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8056d1:	01 d0                	add    eax,edx
  8056d3:	89 c0                	mov    eax,eax
  8056d5:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
            int *funcaddrs=dllexp->AddressOfFunctions+dllp;
  8056dc:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8056e3:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8056e6:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8056e9:	01 d0                	add    eax,edx
  8056eb:	89 c0                	mov    eax,eax
  8056ed:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
            short *funcords=dllexp->AddressOfNameOrdinals+dllp;
  8056f4:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8056fb:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  8056fe:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805701:	01 d0                	add    eax,edx
  805703:	89 c0                	mov    eax,eax
  805705:	48 89 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rax
            //寻找nameordinal的base（最小值），里面的数据加上base才是真正的序号
            unsigned int ord_base=dllexp->Base;
  80570c:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  805713:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805716:	89 85 ec fe ff ff    	mov    DWORD PTR [rbp-0x114],eax
            //开始将导入表IAT的内容更新为函数地址
            unsigned int *iataddrs=impdes->FirstThunk+nbase;//IAT和INT内容一样，只用IAT
  80571c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805720:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  805723:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805726:	01 d0                	add    eax,edx
  805728:	89 c0                	mov    eax,eax
  80572a:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            char **siataddrs=impdes->FirstThunk+nbase;
  80572e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805732:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  805735:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805738:	01 d0                	add    eax,edx
  80573a:	89 c0                	mov    eax,eax
  80573c:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            while (*iataddrs)
  805740:	e9 00 01 00 00       	jmp    805845 <load_pe+0x59b>
            {
                //判断是序号导入还是名称导入
                if(((unsigned)*iataddrs)&0x80000000)
  805745:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805749:	8b 00                	mov    eax,DWORD PTR [rax]
  80574b:	85 c0                	test   eax,eax
  80574d:	79 43                	jns    805792 <load_pe+0x4e8>
                {
                    //序号导入
                    unsigned int ord=((*iataddrs)&0x7fffffff)-ord_base;
  80574f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805753:	8b 00                	mov    eax,DWORD PTR [rax]
  805755:	25 ff ff ff 7f       	and    eax,0x7fffffff
  80575a:	2b 85 ec fe ff ff    	sub    eax,DWORD PTR [rbp-0x114]
  805760:	89 85 d8 fe ff ff    	mov    DWORD PTR [rbp-0x128],eax
                    *iataddrs=funcaddrs[ord]+dllp;
  805766:	8b 85 d8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x128]
  80576c:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  805773:	00 
  805774:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80577b:	48 01 d0             	add    rax,rdx
  80577e:	8b 10                	mov    edx,DWORD PTR [rax]
  805780:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805783:	01 d0                	add    eax,edx
  805785:	89 c2                	mov    edx,eax
  805787:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80578b:	89 10                	mov    DWORD PTR [rax],edx
  80578d:	e9 a9 00 00 00       	jmp    80583b <load_pe+0x591>
                }else
                {
                    //名称导入
                    char *import_by_name_p=*iataddrs;//指向IMPORT_BY_NAME
  805792:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805796:	8b 00                	mov    eax,DWORD PTR [rax]
  805798:	89 c0                	mov    eax,eax
  80579a:	48 89 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rax
                    import_by_name_p+=2;//跳过开头两字节序号
  8057a1:	48 83 85 e0 fe ff ff 	add    QWORD PTR [rbp-0x120],0x2
  8057a8:	02 
                    int i=0;
  8057a9:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
                    for(;i<funcn;i++)
  8057b0:	eb 7a                	jmp    80582c <load_pe+0x582>
                    {
                        if(strcmp(import_by_name_p,fnames[i])==0)
  8057b2:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8057b5:	48 98                	cdqe   
  8057b7:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8057be:	00 
  8057bf:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  8057c6:	48 01 d0             	add    rax,rdx
  8057c9:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8057cc:	48 8b 85 e0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x120]
  8057d3:	48 89 d6             	mov    rsi,rdx
  8057d6:	48 89 c7             	mov    rdi,rax
  8057d9:	e8 91 4f 00 00       	call   80a76f <strcmp>
  8057de:	85 c0                	test   eax,eax
  8057e0:	75 46                	jne    805828 <load_pe+0x57e>
                        {
                            int ordi=funcords[i];
  8057e2:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8057e5:	48 98                	cdqe   
  8057e7:	48 8d 14 00          	lea    rdx,[rax+rax*1]
  8057eb:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  8057f2:	48 01 d0             	add    rax,rdx
  8057f5:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8057f8:	98                   	cwde   
  8057f9:	89 85 dc fe ff ff    	mov    DWORD PTR [rbp-0x124],eax
                            *iataddrs=funcaddrs[ordi]+dllp;//导入表中的IAT内容修改成地址
  8057ff:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
  805805:	48 98                	cdqe   
  805807:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  80580e:	00 
  80580f:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  805816:	48 01 d0             	add    rax,rdx
  805819:	8b 10                	mov    edx,DWORD PTR [rax]
  80581b:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80581e:	01 d0                	add    eax,edx
  805820:	89 c2                	mov    edx,eax
  805822:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805826:	89 10                	mov    DWORD PTR [rax],edx
                    for(;i<funcn;i++)
  805828:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
  80582c:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80582f:	3b 85 0c ff ff ff    	cmp    eax,DWORD PTR [rbp-0xf4]
  805835:	0f 8c 77 ff ff ff    	jl     8057b2 <load_pe+0x508>
                        }
                    }
                }
                iataddrs++;
  80583b:	48 83 45 d0 04       	add    QWORD PTR [rbp-0x30],0x4
                siataddrs++;
  805840:	48 83 45 c8 08       	add    QWORD PTR [rbp-0x38],0x8
            while (*iataddrs)
  805845:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805849:	8b 00                	mov    eax,DWORD PTR [rax]
  80584b:	85 c0                	test   eax,eax
  80584d:	0f 85 f2 fe ff ff    	jne    805745 <load_pe+0x49b>
            }
            impdes++;
  805853:	48 83 45 e0 14       	add    QWORD PTR [rbp-0x20],0x14
        while (impdes->Characteristics)
  805858:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80585c:	8b 00                	mov    eax,DWORD PTR [rax]
  80585e:	85 c0                	test   eax,eax
  805860:	0f 85 b4 fd ff ff    	jne    80561a <load_pe+0x370>
        }
    }


    //开始重定位
    PIMAGE_BASE_RELOCATION relp=0;
  805866:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  80586d:	00 
    if(nth->OptionalHeader.DataDirectory[5].Size>0)
  80586e:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805875:	8b 80 a4 00 00 00    	mov    eax,DWORD PTR [rax+0xa4]
  80587b:	85 c0                	test   eax,eax
  80587d:	0f 84 e8 00 00 00    	je     80596b <load_pe+0x6c1>
    {
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  805883:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80588a:	8b 90 a0 00 00 00    	mov    edx,DWORD PTR [rax+0xa0]
  805890:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805893:	01 d0                	add    eax,edx
  805895:	89 c0                	mov    eax,eax
  805897:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
                                +(u32)nbase);
        u16 *reloc=relp+sizeof(IMAGE_BASE_RELOCATION);
  80589b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80589f:	48 83 c0 40          	add    rax,0x40
  8058a3:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        u16 *rtype=reloc+1;
  8058a7:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8058ab:	48 83 c0 02          	add    rax,0x2
  8058af:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
        int old_base=nth->OptionalHeader.ImageBase;
  8058b3:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8058ba:	8b 40 34             	mov    eax,DWORD PTR [rax+0x34]
  8058bd:	89 85 d4 fe ff ff    	mov    DWORD PTR [rbp-0x12c],eax
        while(relp->VirtualAddress){
  8058c3:	e9 95 00 00 00       	jmp    80595d <load_pe+0x6b3>
            int pgva=relp->VirtualAddress+nbase;
  8058c8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8058cc:	8b 10                	mov    edx,DWORD PTR [rax]
  8058ce:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8058d1:	01 d0                	add    eax,edx
  8058d3:	89 85 d0 fe ff ff    	mov    DWORD PTR [rbp-0x130],eax
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  8058d9:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
  8058e0:	eb 59                	jmp    80593b <load_pe+0x691>
            {
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  8058e2:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8058e6:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8058e9:	66 85 c0             	test   ax,ax
  8058ec:	74 48                	je     805936 <load_pe+0x68c>
                int *at=*reloc+pgva;//要重定位的数据的地址
  8058ee:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8058f2:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8058f5:	0f b7 d0             	movzx  edx,ax
  8058f8:	8b 85 d0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x130]
  8058fe:	01 d0                	add    eax,edx
  805900:	48 98                	cdqe   
  805902:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
                *at=*at-old_base+nbase;
  805909:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  805910:	8b 00                	mov    eax,DWORD PTR [rax]
  805912:	2b 85 d4 fe ff ff    	sub    eax,DWORD PTR [rbp-0x12c]
  805918:	89 c2                	mov    edx,eax
  80591a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80591d:	01 d0                	add    eax,edx
  80591f:	89 c2                	mov    edx,eax
  805921:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  805928:	89 10                	mov    DWORD PTR [rax],edx
                //下一个
                reloc+=2;
  80592a:	48 83 45 b0 04       	add    QWORD PTR [rbp-0x50],0x4
                rtype+=2;
  80592f:	48 83 45 a8 04       	add    QWORD PTR [rbp-0x58],0x4
  805934:	eb 01                	jmp    805937 <load_pe+0x68d>
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  805936:	90                   	nop
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  805937:	83 45 a4 01          	add    DWORD PTR [rbp-0x5c],0x1
  80593b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80593f:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805942:	c1 e8 02             	shr    eax,0x2
  805945:	89 c2                	mov    edx,eax
  805947:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  80594a:	39 c2                	cmp    edx,eax
  80594c:	77 94                	ja     8058e2 <load_pe+0x638>
            }
            relp=(int)relp+0x1000;
  80594e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805952:	05 00 10 00 00       	add    eax,0x1000
  805957:	48 98                	cdqe   
  805959:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        while(relp->VirtualAddress){
  80595d:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805961:	8b 00                	mov    eax,DWORD PTR [rax]
  805963:	85 c0                	test   eax,eax
  805965:	0f 85 5d ff ff ff    	jne    8058c8 <load_pe+0x61e>
        }
    }
    extern struct process task[];
    extern int cur_proc;
    //初始化堆
    chunk_header hdrtmp={
  80596b:	c7 85 50 fd ff ff 00 	mov    DWORD PTR [rbp-0x2b0],0x0
  805972:	00 00 00 
  805975:	c7 85 54 fd ff ff 00 	mov    DWORD PTR [rbp-0x2ac],0x0
  80597c:	00 00 00 
  80597f:	48 c7 85 58 fd ff ff 	mov    QWORD PTR [rbp-0x2a8],0x0
  805986:	00 00 00 00 
  80598a:	48 c7 85 60 fd ff ff 	mov    QWORD PTR [rbp-0x2a0],0x0
  805991:	00 00 00 00 
            .next=NULL,
            .pgn=0,
            .prev=NULL
    };//空堆
    //拷贝触发页中断然后分配
    memcpy((chunk_header*)HEAP_BASE,&hdrtmp,sizeof(hdrtmp));
  805995:	48 8d 85 50 fd ff ff 	lea    rax,[rbp-0x2b0]
  80599c:	ba 18 00 00 00       	mov    edx,0x18
  8059a1:	48 89 c6             	mov    rsi,rax
  8059a4:	bf 00 00 00 01       	mov    edi,0x1000000
  8059a9:	e8 23 4b 00 00       	call   80a4d1 <memcpy>
    task[cur_proc].mem_struct.heap_base=HEAP_BASE;
  8059ae:	8b 05 58 eb c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0eb58]        # 41450c <cur_proc>
  8059b4:	48 63 d0             	movsxd rdx,eax
  8059b7:	48 89 d0             	mov    rax,rdx
  8059ba:	48 01 c0             	add    rax,rax
  8059bd:	48 01 d0             	add    rax,rdx
  8059c0:	48 c1 e0 08          	shl    rax,0x8
  8059c4:	48 05 b0 84 40 00    	add    rax,0x4084b0
  8059ca:	c7 40 04 00 00 00 01 	mov    DWORD PTR [rax+0x4],0x1000000
    task[cur_proc].mem_struct.heap_top=HEAP_BASE+CHUNK_SIZE;
  8059d1:	8b 05 35 eb c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0eb35]        # 41450c <cur_proc>
  8059d7:	48 63 d0             	movsxd rdx,eax
  8059da:	48 89 d0             	mov    rax,rdx
  8059dd:	48 01 c0             	add    rax,rax
  8059e0:	48 01 d0             	add    rax,rdx
  8059e3:	48 c1 e0 08          	shl    rax,0x8
  8059e7:	48 05 b0 84 40 00    	add    rax,0x4084b0
  8059ed:	c7 40 08 00 10 00 01 	mov    DWORD PTR [rax+0x8],0x1001000


    //完毕,调用入口函数
    //重定位完毕，准备调用DllMain
    typedef int (*Main)(int,void*);
    Main main=shell_addr;
  8059f4:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8059fa:	48 98                	cdqe   
  8059fc:	48 89 85 c0 fe ff ff 	mov    QWORD PTR [rbp-0x140],rax
    task[cur_proc].exit_code=main(0,NULL);
  805a03:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
  805a0a:	be 00 00 00 00       	mov    esi,0x0
  805a0f:	bf 00 00 00 00       	mov    edi,0x0
  805a14:	ff d0                	call   rax
  805a16:	8b 15 f0 ea c0 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc0eaf0]        # 41450c <cur_proc>
  805a1c:	89 c1                	mov    ecx,eax
  805a1e:	48 63 d2             	movsxd rdx,edx
  805a21:	48 89 d0             	mov    rax,rdx
  805a24:	48 01 c0             	add    rax,rax
  805a27:	48 01 d0             	add    rax,rdx
  805a2a:	48 c1 e0 08          	shl    rax,0x8
  805a2e:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805a34:	89 08                	mov    DWORD PTR [rax],ecx
    return task[cur_proc].exit_code;
  805a36:	8b 05 d0 ea c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ead0]        # 41450c <cur_proc>
  805a3c:	48 63 d0             	movsxd rdx,eax
  805a3f:	48 89 d0             	mov    rax,rdx
  805a42:	48 01 c0             	add    rax,rax
  805a45:	48 01 d0             	add    rax,rdx
  805a48:	48 c1 e0 08          	shl    rax,0x8
  805a4c:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805a52:	8b 00                	mov    eax,DWORD PTR [rax]
}
  805a54:	c9                   	leave  
  805a55:	c3                   	ret    

0000000000805a56 <get_module_addr>:

int get_module_addr(int mi)
{
  805a56:	f3 0f 1e fa          	endbr64 
  805a5a:	55                   	push   rbp
  805a5b:	48 89 e5             	mov    rbp,rsp
  805a5e:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return modules[mi].base;
  805a61:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805a64:	48 98                	cdqe   
  805a66:	8b 04 c5 20 71 42 00 	mov    eax,DWORD PTR [rax*8+0x427120]
}
  805a6d:	5d                   	pop    rbp
  805a6e:	c3                   	ret    

0000000000805a6f <dispose_library>:
int dispose_library(int dlln)
{
  805a6f:	f3 0f 1e fa          	endbr64 
  805a73:	55                   	push   rbp
  805a74:	48 89 e5             	mov    rbp,rsp
  805a77:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if(dlln<0||dlln>=MAX_DLLS)return -1;
  805a7a:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  805a7e:	78 09                	js     805a89 <dispose_library+0x1a>
  805a80:	81 7d fc ff 00 00 00 	cmp    DWORD PTR [rbp-0x4],0xff
  805a87:	7e 07                	jle    805a90 <dispose_library+0x21>
  805a89:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805a8e:	eb 1d                	jmp    805aad <dispose_library+0x3e>
    //空间不够，释放之前申请的
    // for(int j=0;j<dlls[dlln].page_used;j++)
    //     dispose_page(get_phyaddr(dlls[dlln].page_num[j]));
    //释放dll
    dlls[dlln].flag=DLL_STAT_EMPTY;
  805a90:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805a93:	48 98                	cdqe   
  805a95:	48 69 c0 2c 01 00 00 	imul   rax,rax,0x12c
  805a9c:	48 05 28 45 41 00    	add    rax,0x414528
  805aa2:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return 0;
  805aa8:	b8 00 00 00 00       	mov    eax,0x0
}
  805aad:	5d                   	pop    rbp
  805aae:	c3                   	ret    

0000000000805aaf <sys_insmod>:

    return 0;
} */

int sys_insmod(char *path)
{
  805aaf:	f3 0f 1e fa          	endbr64 
  805ab3:	55                   	push   rbp
  805ab4:	48 89 e5             	mov    rbp,rsp
  805ab7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  805abb:	90                   	nop
  805abc:	5d                   	pop    rbp
  805abd:	c3                   	ret    

0000000000805abe <sys_rmmod>:
int sys_rmmod(char *name)
{
  805abe:	f3 0f 1e fa          	endbr64 
  805ac2:	55                   	push   rbp
  805ac3:	48 89 e5             	mov    rbp,rsp
  805ac6:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

  805aca:	90                   	nop
  805acb:	5d                   	pop    rbp
  805acc:	c3                   	ret    
  805acd:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000805ad0 <_syscall>:
  805ad0:	55                   	push   rbp
  805ad1:	bd 00 80 10 00       	mov    ebp,0x108000
  805ad6:	48 89 65 14          	mov    QWORD PTR [rbp+0x14],rsp
  805ada:	48 8b 65 04          	mov    rsp,QWORD PTR [rbp+0x4]
  805ade:	41 53                	push   r11
  805ae0:	51                   	push   rcx
  805ae1:	e8 b1 aa ff ff       	call   800597 <syscall>
  805ae6:	59                   	pop    rcx
  805ae7:	41 5b                	pop    r11
  805ae9:	48 89 65 04          	mov    QWORD PTR [rbp+0x4],rsp
  805aed:	48 8b 65 14          	mov    rsp,QWORD PTR [rbp+0x14]
  805af1:	5d                   	pop    rbp
  805af2:	48 0f 07             	sysretq 

0000000000805af5 <init_framebuffer>:
static u32 font_width_bytes;
static u8 *glyph_table;
static u32 bytes_per_glyph, glyph_nr;
int font_size=1;
void init_framebuffer()
{
  805af5:	f3 0f 1e fa          	endbr64 
  805af9:	55                   	push   rbp
  805afa:	48 89 e5             	mov    rbp,rsp
  805afd:	48 83 ec 50          	sub    rsp,0x50
    //映射页帧内存
    size_t w=framebuffer.common.framebuffer_width;
  805b01:	8b 05 2d 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21a2d]        # 427534 <framebuffer+0x14>
  805b07:	89 c0                	mov    eax,eax
  805b09:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    size_t h=framebuffer.common.framebuffer_height;
  805b0d:	8b 05 25 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21a25]        # 427538 <framebuffer+0x18>
  805b13:	89 c0                	mov    eax,eax
  805b15:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    size_t bypp=framebuffer.common.framebuffer_bpp/8;
  805b19:	0f b6 05 1c 1a c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21a1c]        # 42753c <framebuffer+0x1c>
  805b20:	c0 e8 03             	shr    al,0x3
  805b23:	0f b6 c0             	movzx  eax,al
  805b26:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    size_t inter=framebuffer.common.framebuffer_pitch;
  805b2a:	8b 05 00 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21a00]        # 427530 <framebuffer+0x10>
  805b30:	89 c0                	mov    eax,eax
  805b32:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    size_t pc=w*h;
  805b36:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805b3a:	48 0f af 45 d8       	imul   rax,QWORD PTR [rbp-0x28]
  805b3f:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    size_t size=h*inter;
  805b43:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805b47:	48 0f af 45 c8       	imul   rax,QWORD PTR [rbp-0x38]
  805b4c:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    int pgc=size/PAGE_SIZE;
  805b50:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805b54:	48 c1 e8 0c          	shr    rax,0xc
  805b58:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    addr_t p=FRAMEBUFFER_ADDR;
  805b5b:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x40000000
  805b62:	40 
    addr_t pp=framebuffer.common.framebuffer_addr;
  805b63:	48 8b 05 be 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc219be]        # 427528 <framebuffer+0x8>
  805b6a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for (size_t i = 0; i < pgc; i++)
  805b6e:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  805b75:	00 
  805b76:	eb 2d                	jmp    805ba5 <init_framebuffer+0xb0>
    {
        mmap(pp,p,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  805b78:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  805b7c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805b80:	ba 07 00 00 00       	mov    edx,0x7
  805b85:	48 89 ce             	mov    rsi,rcx
  805b88:	48 89 c7             	mov    rdi,rax
  805b8b:	e8 49 b3 ff ff       	call   800ed9 <mmap>
        pp+=PAGE_SIZE;
  805b90:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  805b97:	00 
        p+=PAGE_SIZE;
  805b98:	48 81 45 f8 00 10 00 	add    QWORD PTR [rbp-0x8],0x1000
  805b9f:	00 
    for (size_t i = 0; i < pgc; i++)
  805ba0:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  805ba5:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  805ba8:	48 98                	cdqe   
  805baa:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  805bae:	72 c8                	jb     805b78 <init_framebuffer+0x83>
    }
    
    
}
  805bb0:	90                   	nop
  805bb1:	90                   	nop
  805bb2:	c9                   	leave  
  805bb3:	c3                   	ret    

0000000000805bb4 <init_font>:
void init_font(){
  805bb4:	f3 0f 1e fa          	endbr64 
  805bb8:	55                   	push   rbp
  805bb9:	48 89 e5             	mov    rbp,rsp
    boot_font = (struct psf2_header*) _binary_res_font_psf_start;
  805bbc:	48 c7 05 99 19 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21999],0x80b1a0        # 427560 <boot_font>
  805bc3:	a0 b1 80 00 

    font_width_bytes = (boot_font->width + 7) / 8;
  805bc7:	48 8b 05 92 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21992]        # 427560 <boot_font>
  805bce:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  805bd1:	83 c0 07             	add    eax,0x7
  805bd4:	c1 e8 03             	shr    eax,0x3
  805bd7:	89 05 93 19 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21993],eax        # 427570 <font_width_bytes>
    font_width = font_width_bytes * 8;
  805bdd:	8b 05 8d 19 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2198d]        # 427570 <font_width_bytes>
  805be3:	c1 e0 03             	shl    eax,0x3
  805be6:	89 05 7c 19 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2197c],eax        # 427568 <font_width>
    font_height = boot_font->height;
  805bec:	48 8b 05 6d 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2196d]        # 427560 <boot_font>
  805bf3:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  805bf6:	89 05 70 19 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21970],eax        # 42756c <font_height>

    glyph_table = (u8*)_binary_res_font_psf_start+boot_font->header_size;
  805bfc:	48 8b 05 5d 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2195d]        # 427560 <boot_font>
  805c03:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  805c06:	89 c0                	mov    eax,eax
  805c08:	48 05 a0 b1 80 00    	add    rax,0x80b1a0
  805c0e:	48 89 05 63 19 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21963],rax        # 427578 <glyph_table>
    glyph_nr = boot_font->glyph_nr;
  805c15:	48 8b 05 44 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21944]        # 427560 <boot_font>
  805c1c:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805c1f:	89 05 5f 19 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2195f],eax        # 427584 <glyph_nr>
    bytes_per_glyph = boot_font->bytes_per_glyph;
  805c25:	48 8b 05 34 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21934]        # 427560 <boot_font>
  805c2c:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  805c2f:	89 05 4b 19 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2194b],eax        # 427580 <bytes_per_glyph>

    fb_cursor_x = fb_cursor_y = 0;
  805c35:	c7 05 11 19 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc21911],0x0        # 427550 <fb_cursor_y>
  805c3c:	00 00 00 
  805c3f:	8b 05 0b 19 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2190b]        # 427550 <fb_cursor_y>
  805c45:	89 05 01 19 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21901],eax        # 42754c <fb_cursor_x>
    max_ch_nr_x = framebuffer.common.framebuffer_width *framebuffer.common.framebuffer_bpp/8 / font_width;
  805c4b:	8b 15 e3 18 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc218e3]        # 427534 <framebuffer+0x14>
  805c51:	0f b6 05 e4 18 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc218e4]        # 42753c <framebuffer+0x1c>
  805c58:	0f b6 c0             	movzx  eax,al
  805c5b:	0f af c2             	imul   eax,edx
  805c5e:	c1 e8 03             	shr    eax,0x3
  805c61:	8b 0d 01 19 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc21901]        # 427568 <font_width>
  805c67:	ba 00 00 00 00       	mov    edx,0x0
  805c6c:	f7 f1                	div    ecx
  805c6e:	89 05 e0 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc218e0],eax        # 427554 <max_ch_nr_x>
    max_ch_nr_y = framebuffer.common.framebuffer_height *framebuffer.common.framebuffer_bpp/8 / font_height;
  805c74:	8b 15 be 18 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc218be]        # 427538 <framebuffer+0x18>
  805c7a:	0f b6 05 bb 18 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc218bb]        # 42753c <framebuffer+0x1c>
  805c81:	0f b6 c0             	movzx  eax,al
  805c84:	0f af c2             	imul   eax,edx
  805c87:	c1 e8 03             	shr    eax,0x3
  805c8a:	8b 35 dc 18 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc218dc]        # 42756c <font_height>
  805c90:	ba 00 00 00 00       	mov    edx,0x0
  805c95:	f7 f6                	div    esi
  805c97:	89 05 bb 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc218bb],eax        # 427558 <max_ch_nr_y>
    font_size=1;
  805c9d:	c7 05 49 52 00 00 01 	mov    DWORD PTR [rip+0x5249],0x1        # 80aef0 <font_size>
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
void draw_letter(int x, int y, int size, char c) {
  805e13:	f3 0f 1e fa          	endbr64 
  805e17:	55                   	push   rbp
  805e18:	48 89 e5             	mov    rbp,rsp
  805e1b:	48 83 ec 30          	sub    rsp,0x30
  805e1f:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  805e22:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  805e25:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  805e28:	89 c8                	mov    eax,ecx
  805e2a:	88 45 d0             	mov    BYTE PTR [rbp-0x30],al
    u8 *glyph = glyph_table;
  805e2d:	48 8b 05 44 17 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21744]        # 427578 <glyph_table>
  805e34:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if (c < glyph_nr) {
  805e38:	0f be 55 d0          	movsx  edx,BYTE PTR [rbp-0x30]
  805e3c:	8b 05 42 17 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21742]        # 427584 <glyph_nr>
  805e42:	39 c2                	cmp    edx,eax
  805e44:	73 13                	jae    805e59 <draw_letter+0x46>
        glyph += c * bytes_per_glyph;
  805e46:	0f be 55 d0          	movsx  edx,BYTE PTR [rbp-0x30]
  805e4a:	8b 05 30 17 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21730]        # 427580 <bytes_per_glyph>
  805e50:	0f af c2             	imul   eax,edx
  805e53:	89 c0                	mov    eax,eax
  805e55:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    }
    /* output the font to frame buffer */
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  805e59:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  805e60:	e9 c9 00 00 00       	jmp    805f2e <draw_letter+0x11b>
        u8 mask = 1 << 7;
  805e65:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80

        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  805e69:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  805e70:	e9 9a 00 00 00       	jmp    805f0f <draw_letter+0xfc>
            if ((*(glyph + ch_x / 8) & mask) != 0) {
  805e75:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805e78:	c1 e8 03             	shr    eax,0x3
  805e7b:	89 c2                	mov    edx,eax
  805e7d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805e81:	48 01 d0             	add    rax,rdx
  805e84:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805e87:	22 45 f3             	and    al,BYTE PTR [rbp-0xd]
  805e8a:	84 c0                	test   al,al
  805e8c:	74 37                	je     805ec5 <draw_letter+0xb2>
                fill_rect(y+ch_y*size,x+ch_x*size,size,size,-1);
  805e8e:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805e91:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  805e95:	89 c2                	mov    edx,eax
  805e97:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805e9a:	01 d0                	add    eax,edx
  805e9c:	89 c6                	mov    esi,eax
  805e9e:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805ea1:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  805ea5:	89 c2                	mov    edx,eax
  805ea7:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805eaa:	01 d0                	add    eax,edx
  805eac:	89 c7                	mov    edi,eax
  805eae:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  805eb1:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805eb4:	41 b8 ff ff ff ff    	mov    r8d,0xffffffff
  805eba:	89 d1                	mov    ecx,edx
  805ebc:	89 c2                	mov    edx,eax
  805ebe:	e8 29 fe ff ff       	call   805cec <fill_rect>
  805ec3:	eb 35                	jmp    805efa <draw_letter+0xe7>
            } else {
                fill_rect(y+ch_y*size,x+ch_x*size,size,size,0);
  805ec5:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805ec8:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  805ecc:	89 c2                	mov    edx,eax
  805ece:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805ed1:	01 d0                	add    eax,edx
  805ed3:	89 c6                	mov    esi,eax
  805ed5:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805ed8:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  805edc:	89 c2                	mov    edx,eax
  805ede:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805ee1:	01 d0                	add    eax,edx
  805ee3:	89 c7                	mov    edi,eax
  805ee5:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  805ee8:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805eeb:	41 b8 00 00 00 00    	mov    r8d,0x0
  805ef1:	89 d1                	mov    ecx,edx
  805ef3:	89 c2                	mov    edx,eax
  805ef5:	e8 f2 fd ff ff       	call   805cec <fill_rect>
            }

            mask >>= 1;
  805efa:	d0 6d f3             	shr    BYTE PTR [rbp-0xd],1
            if (ch_x % 8 == 0) {
  805efd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805f00:	83 e0 07             	and    eax,0x7
  805f03:	85 c0                	test   eax,eax
  805f05:	75 04                	jne    805f0b <draw_letter+0xf8>
                mask = 1 << 7;
  805f07:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80
        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  805f0b:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  805f0f:	8b 05 53 16 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21653]        # 427568 <font_width>
  805f15:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  805f18:	0f 82 57 ff ff ff    	jb     805e75 <draw_letter+0x62>
            }
        }

        glyph += font_width_bytes;
  805f1e:	8b 05 4c 16 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2164c]        # 427570 <font_width_bytes>
  805f24:	89 c0                	mov    eax,eax
  805f26:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  805f2a:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  805f2e:	8b 05 38 16 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21638]        # 42756c <font_height>
  805f34:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  805f37:	0f 82 28 ff ff ff    	jb     805e65 <draw_letter+0x52>
    }
}
  805f3d:	90                   	nop
  805f3e:	90                   	nop
  805f3f:	c9                   	leave  
  805f40:	c3                   	ret    

0000000000805f41 <scr_up>:
//向上滚动一个像素
void scr_up(){
  805f41:	f3 0f 1e fa          	endbr64 
  805f45:	55                   	push   rbp
  805f46:	48 89 e5             	mov    rbp,rsp
    for(int dy=0;dy<max_ch_nr_y-1;dy++){
  805f49:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805f50:	eb 6c                	jmp    805fbe <scr_up+0x7d>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  805f52:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805f59:	eb 52                	jmp    805fad <scr_up+0x6c>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  805f5b:	8b 15 cf 15 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc215cf]        # 427530 <framebuffer+0x10>
  805f61:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805f64:	0f af c2             	imul   eax,edx
  805f67:	89 c1                	mov    ecx,eax
                    +dx*framebuffer.common.framebuffer_bpp/8);
  805f69:	0f b6 05 cc 15 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc215cc]        # 42753c <framebuffer+0x1c>
  805f70:	0f b6 c0             	movzx  eax,al
  805f73:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  805f77:	8d 50 07             	lea    edx,[rax+0x7]
  805f7a:	85 c0                	test   eax,eax
  805f7c:	0f 48 c2             	cmovs  eax,edx
  805f7f:	c1 f8 03             	sar    eax,0x3
  805f82:	48 98                	cdqe   
  805f84:	48 01 c8             	add    rax,rcx
  805f87:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  805f8d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p+framebuffer.common.framebuffer_pitch);
  805f91:	8b 05 99 15 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21599]        # 427530 <framebuffer+0x10>
  805f97:	89 c2                	mov    edx,eax
  805f99:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805f9d:	48 01 d0             	add    rax,rdx
  805fa0:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  805fa3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805fa7:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  805fa9:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805fad:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  805fb0:	8b 05 9e 15 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2159e]        # 427554 <max_ch_nr_x>
  805fb6:	39 c2                	cmp    edx,eax
  805fb8:	72 a1                	jb     805f5b <scr_up+0x1a>
    for(int dy=0;dy<max_ch_nr_y-1;dy++){
  805fba:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805fbe:	8b 05 94 15 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21594]        # 427558 <max_ch_nr_y>
  805fc4:	8d 50 ff             	lea    edx,[rax-0x1]
  805fc7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805fca:	39 c2                	cmp    edx,eax
  805fcc:	77 84                	ja     805f52 <scr_up+0x11>
        }

    }
}
  805fce:	90                   	nop
  805fcf:	90                   	nop
  805fd0:	5d                   	pop    rbp
  805fd1:	c3                   	ret    

0000000000805fd2 <scr_down>:
void scr_down(){
  805fd2:	f3 0f 1e fa          	endbr64 
  805fd6:	55                   	push   rbp
  805fd7:	48 89 e5             	mov    rbp,rsp
    for(int dy=1;dy<max_ch_nr_y;dy++){
  805fda:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
  805fe1:	eb 72                	jmp    806055 <scr_down+0x83>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  805fe3:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805fea:	eb 58                	jmp    806044 <scr_down+0x72>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  805fec:	8b 15 3e 15 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc2153e]        # 427530 <framebuffer+0x10>
  805ff2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805ff5:	0f af c2             	imul   eax,edx
  805ff8:	89 c1                	mov    ecx,eax
                            +dx*framebuffer.common.framebuffer_bpp/8);
  805ffa:	0f b6 05 3b 15 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2153b]        # 42753c <framebuffer+0x1c>
  806001:	0f b6 c0             	movzx  eax,al
  806004:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  806008:	8d 50 07             	lea    edx,[rax+0x7]
  80600b:	85 c0                	test   eax,eax
  80600d:	0f 48 c2             	cmovs  eax,edx
  806010:	c1 f8 03             	sar    eax,0x3
  806013:	48 98                	cdqe   
  806015:	48 01 c8             	add    rax,rcx
  806018:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  80601e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p-framebuffer.common.framebuffer_pitch);
  806022:	8b 05 08 15 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21508]        # 427530 <framebuffer+0x10>
  806028:	89 c0                	mov    eax,eax
  80602a:	48 f7 d8             	neg    rax
  80602d:	48 89 c2             	mov    rdx,rax
  806030:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806034:	48 01 d0             	add    rax,rdx
  806037:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80603a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80603e:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  806040:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806044:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  806047:	8b 05 07 15 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21507]        # 427554 <max_ch_nr_x>
  80604d:	39 c2                	cmp    edx,eax
  80604f:	72 9b                	jb     805fec <scr_down+0x1a>
    for(int dy=1;dy<max_ch_nr_y;dy++){
  806051:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806055:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  806058:	8b 05 fa 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc214fa]        # 427558 <max_ch_nr_y>
  80605e:	39 c2                	cmp    edx,eax
  806060:	72 81                	jb     805fe3 <scr_down+0x11>
        }

    }
}
  806062:	90                   	nop
  806063:	90                   	nop
  806064:	5d                   	pop    rbp
  806065:	c3                   	ret    

0000000000806066 <print>:
void print(char* s){
  806066:	f3 0f 1e fa          	endbr64 
  80606a:	55                   	push   rbp
  80606b:	48 89 e5             	mov    rbp,rsp
  80606e:	48 83 ec 18          	sub    rsp,0x18
  806072:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(;*s;s++){
  806076:	e9 f7 00 00 00       	jmp    806172 <print+0x10c>
        if(fb_cursor_x>max_ch_nr_x||*s=='\n')
  80607b:	8b 15 cb 14 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc214cb]        # 42754c <fb_cursor_x>
  806081:	8b 05 cd 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc214cd]        # 427554 <max_ch_nr_x>
  806087:	39 c2                	cmp    edx,eax
  806089:	77 0b                	ja     806096 <print+0x30>
  80608b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80608f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806092:	3c 0a                	cmp    al,0xa
  806094:	75 19                	jne    8060af <print+0x49>
        {
            fb_cursor_y+=1;
  806096:	8b 05 b4 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc214b4]        # 427550 <fb_cursor_y>
  80609c:	83 c0 01             	add    eax,0x1
  80609f:	89 05 ab 14 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc214ab],eax        # 427550 <fb_cursor_y>
            fb_cursor_x=0;
  8060a5:	c7 05 9d 14 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc2149d],0x0        # 42754c <fb_cursor_x>
  8060ac:	00 00 00 
        }
        if(*s=='\n')continue;
  8060af:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8060b3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8060b6:	3c 0a                	cmp    al,0xa
  8060b8:	0f 84 ae 00 00 00    	je     80616c <print+0x106>
        if(fb_cursor_y>=max_ch_nr_y){
  8060be:	8b 15 8c 14 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc2148c]        # 427550 <fb_cursor_y>
  8060c4:	8b 05 8e 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2148e]        # 427558 <max_ch_nr_y>
  8060ca:	39 c2                	cmp    edx,eax
  8060cc:	72 3c                	jb     80610a <print+0xa4>
            for(int i=0;i<font_height*font_size;i++)
  8060ce:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8060d5:	eb 0e                	jmp    8060e5 <print+0x7f>
                scr_up();
  8060d7:	b8 00 00 00 00       	mov    eax,0x0
  8060dc:	e8 60 fe ff ff       	call   805f41 <scr_up>
            for(int i=0;i<font_height*font_size;i++)
  8060e1:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8060e5:	8b 05 81 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21481]        # 42756c <font_height>
  8060eb:	8b 15 ff 4d 00 00    	mov    edx,DWORD PTR [rip+0x4dff]        # 80aef0 <font_size>
  8060f1:	0f af d0             	imul   edx,eax
  8060f4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8060f7:	39 c2                	cmp    edx,eax
  8060f9:	77 dc                	ja     8060d7 <print+0x71>
            fb_cursor_y=max_ch_nr_y-1;
  8060fb:	8b 05 57 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21457]        # 427558 <max_ch_nr_y>
  806101:	83 e8 01             	sub    eax,0x1
  806104:	89 05 46 14 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21446],eax        # 427550 <fb_cursor_y>
        }
        draw_letter(fb_cursor_x*font_width*font_size,fb_cursor_y*font_height*font_size,font_size,*s);
  80610a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80610e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806111:	0f be d0             	movsx  edx,al
  806114:	8b 05 d6 4d 00 00    	mov    eax,DWORD PTR [rip+0x4dd6]        # 80aef0 <font_size>
  80611a:	8b 35 30 14 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc21430]        # 427550 <fb_cursor_y>
  806120:	8b 0d 46 14 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc21446]        # 42756c <font_height>
  806126:	0f af ce             	imul   ecx,esi
  806129:	8b 35 c1 4d 00 00    	mov    esi,DWORD PTR [rip+0x4dc1]        # 80aef0 <font_size>
  80612f:	0f af ce             	imul   ecx,esi
  806132:	41 89 c8             	mov    r8d,ecx
  806135:	8b 35 11 14 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc21411]        # 42754c <fb_cursor_x>
  80613b:	8b 0d 27 14 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc21427]        # 427568 <font_width>
  806141:	0f af ce             	imul   ecx,esi
  806144:	8b 35 a6 4d 00 00    	mov    esi,DWORD PTR [rip+0x4da6]        # 80aef0 <font_size>
  80614a:	0f af ce             	imul   ecx,esi
  80614d:	89 cf                	mov    edi,ecx
  80614f:	89 d1                	mov    ecx,edx
  806151:	89 c2                	mov    edx,eax
  806153:	44 89 c6             	mov    esi,r8d
  806156:	e8 b8 fc ff ff       	call   805e13 <draw_letter>
        fb_cursor_x+=1;
  80615b:	8b 05 eb 13 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc213eb]        # 42754c <fb_cursor_x>
  806161:	83 c0 01             	add    eax,0x1
  806164:	89 05 e2 13 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc213e2],eax        # 42754c <fb_cursor_x>
  80616a:	eb 01                	jmp    80616d <print+0x107>
        if(*s=='\n')continue;
  80616c:	90                   	nop
    for(;*s;s++){
  80616d:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  806172:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806176:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806179:	84 c0                	test   al,al
  80617b:	0f 85 fa fe ff ff    	jne    80607b <print+0x15>
    }
}
  806181:	90                   	nop
  806182:	90                   	nop
  806183:	c9                   	leave  
  806184:	c3                   	ret    

0000000000806185 <path_walk>:
#include "errno.h"
#include "memory.h"
#include "log.h"

struct dir_entry * path_walk(char * name,unsigned long flags)
{
  806185:	f3 0f 1e fa          	endbr64 
  806189:	55                   	push   rbp
  80618a:	48 89 e5             	mov    rbp,rsp
  80618d:	48 83 ec 50          	sub    rsp,0x50
  806191:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  806195:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
    char * tmpname = NULL;
  806199:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8061a0:	00 
    int tmpnamelen = 0;
  8061a1:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    struct dir_entry * parent = root_sb->root;
  8061a8:	48 8b 05 d9 13 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc213d9]        # 427588 <root_sb>
  8061af:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8061b2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    struct dir_entry * path = NULL;
  8061b6:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  8061bd:	00 

    while(*name == '/')
  8061be:	eb 05                	jmp    8061c5 <path_walk+0x40>
        name++;
  8061c0:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
    while(*name == '/')
  8061c5:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8061c9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8061cc:	3c 2f                	cmp    al,0x2f
  8061ce:	74 f0                	je     8061c0 <path_walk+0x3b>

    if(!*name)
  8061d0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8061d4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8061d7:	84 c0                	test   al,al
  8061d9:	75 09                	jne    8061e4 <path_walk+0x5f>
    {
        return parent;
  8061db:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8061df:	e9 1b 02 00 00       	jmp    8063ff <path_walk+0x27a>
    }

    for(;;)
    {
        tmpname = name;
  8061e4:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8061e8:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        while(*name && (*name != '/'))
  8061ec:	eb 05                	jmp    8061f3 <path_walk+0x6e>
            name++;
  8061ee:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
        while(*name && (*name != '/'))
  8061f3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8061f7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8061fa:	84 c0                	test   al,al
  8061fc:	74 0b                	je     806209 <path_walk+0x84>
  8061fe:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  806202:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806205:	3c 2f                	cmp    al,0x2f
  806207:	75 e5                	jne    8061ee <path_walk+0x69>
        tmpnamelen = name - tmpname;
  806209:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80620d:	48 2b 45 f0          	sub    rax,QWORD PTR [rbp-0x10]
  806211:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

        path = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  806214:	be 00 00 00 00       	mov    esi,0x0
  806219:	bf 48 00 00 00       	mov    edi,0x48
  80621e:	b8 00 00 00 00       	mov    eax,0x0
  806223:	e8 fc ae ff ff       	call   801124 <vmalloc>
  806228:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        memset(path,0,sizeof(struct dir_entry));
  80622c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806230:	ba 48 00 00 00       	mov    edx,0x48
  806235:	be 00 00 00 00       	mov    esi,0x0
  80623a:	48 89 c7             	mov    rdi,rax
  80623d:	e8 3e 43 00 00       	call   80a580 <memset>

        path->name = vmalloc(tmpnamelen+1,0);
  806242:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806245:	83 c0 01             	add    eax,0x1
  806248:	be 00 00 00 00       	mov    esi,0x0
  80624d:	89 c7                	mov    edi,eax
  80624f:	b8 00 00 00 00       	mov    eax,0x0
  806254:	e8 cb ae ff ff       	call   801124 <vmalloc>
  806259:	48 89 c2             	mov    rdx,rax
  80625c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806260:	48 89 10             	mov    QWORD PTR [rax],rdx
        memset(path->name,0,tmpnamelen+1);
  806263:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806266:	83 c0 01             	add    eax,0x1
  806269:	48 63 d0             	movsxd rdx,eax
  80626c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806270:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806273:	be 00 00 00 00       	mov    esi,0x0
  806278:	48 89 c7             	mov    rdi,rax
  80627b:	e8 00 43 00 00       	call   80a580 <memset>
        memcpy(tmpname,path->name,tmpnamelen);
  806280:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806283:	48 63 d0             	movsxd rdx,eax
  806286:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80628a:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80628d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806291:	48 89 ce             	mov    rsi,rcx
  806294:	48 89 c7             	mov    rdi,rax
  806297:	e8 35 42 00 00       	call   80a4d1 <memcpy>
        path->name_length = tmpnamelen;
  80629c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8062a0:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8062a3:	89 50 08             	mov    DWORD PTR [rax+0x8],edx

        if(parent->dir_inode->inode_ops->lookup(parent->dir_inode,path) == NULL)
  8062a6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8062aa:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8062ae:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  8062b2:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  8062b6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8062ba:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8062be:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  8062c2:	48 89 d6             	mov    rsi,rdx
  8062c5:	48 89 c7             	mov    rdi,rax
  8062c8:	ff d1                	call   rcx
  8062ca:	48 85 c0             	test   rax,rax
  8062cd:	75 3e                	jne    80630d <path_walk+0x188>
        {
            printf("can not find file or dir:%s\n",path->name);
  8062cf:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8062d3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8062d6:	48 89 c6             	mov    rsi,rax
  8062d9:	bf d0 2a 81 00       	mov    edi,0x812ad0
  8062de:	b8 00 00 00 00       	mov    eax,0x0
  8062e3:	e8 24 aa ff ff       	call   800d0c <printf>
            vmfree(path->name);
  8062e8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8062ec:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8062ef:	48 89 c7             	mov    rdi,rax
  8062f2:	e8 bc ae ff ff       	call   8011b3 <vmfree>
            vmfree(path);
  8062f7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8062fb:	48 89 c7             	mov    rdi,rax
  8062fe:	e8 b0 ae ff ff       	call   8011b3 <vmfree>
            return NULL;
  806303:	b8 00 00 00 00       	mov    eax,0x0
  806308:	e9 f2 00 00 00       	jmp    8063ff <path_walk+0x27a>
        }

        list_init(&path->child_node);
  80630d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806311:	48 83 c0 10          	add    rax,0x10
  806315:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    struct List * next;
};

__attribute__((always_inline)) inline void list_init(struct List * list)
{
    list->prev = list;
  806319:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80631d:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  806321:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  806324:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  806328:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  80632c:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  806330:	90                   	nop
        list_init(&path->subdirs_list);
  806331:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806335:	48 83 c0 20          	add    rax,0x20
  806339:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    list->prev = list;
  80633d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  806341:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  806345:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  806348:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80634c:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  806350:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  806354:	90                   	nop
        path->parent = parent;
  806355:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806359:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80635d:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
        list_add_to_behind(&parent->subdirs_list,&path->child_node);
  806361:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806365:	48 83 c0 10          	add    rax,0x10
  806369:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80636d:	48 83 c2 20          	add    rdx,0x20
  806371:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  806375:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

__attribute__((always_inline)) inline void list_add_to_behind(struct List * entry,struct List * new)	////add to entry behind
{
    new->next = entry->next;
  806379:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80637d:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  806381:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806385:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    new->prev = entry;
  806389:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80638d:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  806391:	48 89 10             	mov    QWORD PTR [rax],rdx
    new->next->prev = new;
  806394:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806398:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80639c:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8063a0:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  8063a3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8063a7:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8063ab:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  8063af:	90                   	nop

        if(!*name)
  8063b0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8063b4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8063b7:	84 c0                	test   al,al
  8063b9:	74 2a                	je     8063e5 <path_walk+0x260>
            goto last_component;
        while(*name == '/')
  8063bb:	eb 05                	jmp    8063c2 <path_walk+0x23d>
            name++;
  8063bd:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
        while(*name == '/')
  8063c2:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8063c6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8063c9:	3c 2f                	cmp    al,0x2f
  8063cb:	74 f0                	je     8063bd <path_walk+0x238>
        if(!*name)
  8063cd:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8063d1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8063d4:	84 c0                	test   al,al
  8063d6:	74 10                	je     8063e8 <path_walk+0x263>
            goto last_slash;

        parent = path;
  8063d8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8063dc:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    {
  8063e0:	e9 ff fd ff ff       	jmp    8061e4 <path_walk+0x5f>
            goto last_component;
  8063e5:	90                   	nop
  8063e6:	eb 01                	jmp    8063e9 <path_walk+0x264>
            goto last_slash;
  8063e8:	90                   	nop
    }

    last_slash:
    last_component:

    if(flags & 1)
  8063e9:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8063ed:	83 e0 01             	and    eax,0x1
  8063f0:	48 85 c0             	test   rax,rax
  8063f3:	74 06                	je     8063fb <path_walk+0x276>
    {
        return parent;
  8063f5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8063f9:	eb 04                	jmp    8063ff <path_walk+0x27a>
    }

    return path;
  8063fb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  8063ff:	c9                   	leave  
  806400:	c3                   	ret    

0000000000806401 <fill_dentry>:

int fill_dentry(void *buf,char *name, long namelen,long type,long offset)
{
  806401:	f3 0f 1e fa          	endbr64 
  806405:	55                   	push   rbp
  806406:	48 89 e5             	mov    rbp,rsp
  806409:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80640d:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  806411:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  806415:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  806419:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
//
//    memcpy(name,dent->d_name,namelen);
//    dent->d_namelen = namelen;
//    dent->d_type = type;
//    dent->d_offset = offset;
    return sizeof(struct dirent) + namelen;
  80641d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806421:	83 c0 18             	add    eax,0x18
}
  806424:	5d                   	pop    rbp
  806425:	c3                   	ret    

0000000000806426 <mount_fs>:
//function mount_root
struct super_block * root_sb = NULL;
struct file_system_type filesystem = {"filesystem",0};

struct super_block* mount_fs(char * name,struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  806426:	f3 0f 1e fa          	endbr64 
  80642a:	55                   	push   rbp
  80642b:	48 89 e5             	mov    rbp,rsp
  80642e:	48 83 ec 30          	sub    rsp,0x30
  806432:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  806436:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80643a:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file_system_type * p = NULL;
  80643e:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  806445:	00 

    for(p = &filesystem;p;p = p->next)
  806446:	48 c7 45 f8 00 af 80 	mov    QWORD PTR [rbp-0x8],0x80af00
  80644d:	00 
  80644e:	eb 40                	jmp    806490 <mount_fs+0x6a>
        if(!strcmp(p->name,name))
  806450:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806454:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806457:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80645b:	48 89 d6             	mov    rsi,rdx
  80645e:	48 89 c7             	mov    rdi,rax
  806461:	e8 09 43 00 00       	call   80a76f <strcmp>
  806466:	85 c0                	test   eax,eax
  806468:	75 1a                	jne    806484 <mount_fs+0x5e>
        {
            return p->read_superblock(DPTE,buf);
  80646a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80646e:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  806472:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  806476:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80647a:	48 89 d6             	mov    rsi,rdx
  80647d:	48 89 c7             	mov    rdi,rax
  806480:	ff d1                	call   rcx
  806482:	eb 18                	jmp    80649c <mount_fs+0x76>
    for(p = &filesystem;p;p = p->next)
  806484:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806488:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80648c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  806490:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  806495:	75 b9                	jne    806450 <mount_fs+0x2a>
        }
    return 0;
  806497:	b8 00 00 00 00       	mov    eax,0x0
}
  80649c:	c9                   	leave  
  80649d:	c3                   	ret    

000000000080649e <register_filesystem>:

unsigned long register_filesystem(struct file_system_type * fs)
{
  80649e:	f3 0f 1e fa          	endbr64 
  8064a2:	55                   	push   rbp
  8064a3:	48 89 e5             	mov    rbp,rsp
  8064a6:	48 83 ec 20          	sub    rsp,0x20
  8064aa:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = NULL;
  8064ae:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8064b5:	00 

    for(p = &filesystem;p;p = p->next)
  8064b6:	48 c7 45 f8 00 af 80 	mov    QWORD PTR [rbp-0x8],0x80af00
  8064bd:	00 
  8064be:	eb 30                	jmp    8064f0 <register_filesystem+0x52>
        if(!strcmp(fs->name,p->name))
  8064c0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8064c4:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8064c7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8064cb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8064ce:	48 89 d6             	mov    rsi,rdx
  8064d1:	48 89 c7             	mov    rdi,rax
  8064d4:	e8 96 42 00 00       	call   80a76f <strcmp>
  8064d9:	85 c0                	test   eax,eax
  8064db:	75 07                	jne    8064e4 <register_filesystem+0x46>
            return 0;
  8064dd:	b8 00 00 00 00       	mov    eax,0x0
  8064e2:	eb 32                	jmp    806516 <register_filesystem+0x78>
    for(p = &filesystem;p;p = p->next)
  8064e4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8064e8:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8064ec:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  8064f0:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8064f5:	75 c9                	jne    8064c0 <register_filesystem+0x22>

    fs->next = filesystem.next;
  8064f7:	48 8b 15 1a 4a 00 00 	mov    rdx,QWORD PTR [rip+0x4a1a]        # 80af18 <filesystem+0x18>
  8064fe:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806502:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    filesystem.next = fs;
  806506:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80650a:	48 89 05 07 4a 00 00 	mov    QWORD PTR [rip+0x4a07],rax        # 80af18 <filesystem+0x18>

    return 1;
  806511:	b8 01 00 00 00       	mov    eax,0x1
}
  806516:	c9                   	leave  
  806517:	c3                   	ret    

0000000000806518 <unregister_filesystem>:

unsigned long unregister_filesystem(struct file_system_type * fs)
{
  806518:	f3 0f 1e fa          	endbr64 
  80651c:	55                   	push   rbp
  80651d:	48 89 e5             	mov    rbp,rsp
  806520:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = &filesystem;
  806524:	48 c7 45 f8 00 af 80 	mov    QWORD PTR [rbp-0x8],0x80af00
  80652b:	00 

    while(p->next)
  80652c:	eb 41                	jmp    80656f <unregister_filesystem+0x57>
        if(p->next == fs)
  80652e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806532:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806536:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  80653a:	75 27                	jne    806563 <unregister_filesystem+0x4b>
        {
            p->next = p->next->next;
  80653c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806540:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806544:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  806548:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80654c:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
            fs->next = NULL;
  806550:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806554:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  80655b:	00 
            return 1;
  80655c:	b8 01 00 00 00       	mov    eax,0x1
  806561:	eb 1e                	jmp    806581 <unregister_filesystem+0x69>
        }
        else
            p = p->next;
  806563:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806567:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80656b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p->next)
  80656f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806573:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806577:	48 85 c0             	test   rax,rax
  80657a:	75 b2                	jne    80652e <unregister_filesystem+0x16>
    return 0;
  80657c:	b8 00 00 00 00       	mov    eax,0x0
}
  806581:	5d                   	pop    rbp
  806582:	c3                   	ret    

0000000000806583 <shift>:
/* 0x5D - Apps      */ {  0,        0,       0x5D,      0x5D }
        };
char k_shift=0,k_ctrl=0,k_capslock=0;

void shift()
{
  806583:	f3 0f 1e fa          	endbr64 
  806587:	55                   	push   rbp
  806588:	48 89 e5             	mov    rbp,rsp
    k_shift=!k_shift;
  80658b:	0f b6 05 1b 12 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2121b]        # 4277ad <k_shift>
  806592:	84 c0                	test   al,al
  806594:	0f 94 c0             	sete   al
  806597:	88 05 10 12 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc21210],al        # 4277ad <k_shift>
}
  80659d:	90                   	nop
  80659e:	5d                   	pop    rbp
  80659f:	c3                   	ret    

00000000008065a0 <ctrl>:
void ctrl()
{
  8065a0:	f3 0f 1e fa          	endbr64 
  8065a4:	55                   	push   rbp
  8065a5:	48 89 e5             	mov    rbp,rsp
    k_ctrl=!k_ctrl;
  8065a8:	0f b6 05 ff 11 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc211ff]        # 4277ae <k_ctrl>
  8065af:	84 c0                	test   al,al
  8065b1:	0f 94 c0             	sete   al
  8065b4:	88 05 f4 11 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc211f4],al        # 4277ae <k_ctrl>
}
  8065ba:	90                   	nop
  8065bb:	5d                   	pop    rbp
  8065bc:	c3                   	ret    

00000000008065bd <capslock>:
void capslock()
{
  8065bd:	f3 0f 1e fa          	endbr64 
  8065c1:	55                   	push   rbp
  8065c2:	48 89 e5             	mov    rbp,rsp
    k_capslock=k_capslock==0?1:0;
  8065c5:	0f b6 05 e3 11 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc211e3]        # 4277af <k_capslock>
  8065cc:	84 c0                	test   al,al
  8065ce:	0f 94 c0             	sete   al
  8065d1:	88 05 d8 11 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc211d8],al        # 4277af <k_capslock>
}
  8065d7:	90                   	nop
  8065d8:	5d                   	pop    rbp
  8065d9:	c3                   	ret    

00000000008065da <to_ascii>:
char to_ascii(char scan_code)
{
  8065da:	f3 0f 1e fa          	endbr64 
  8065de:	55                   	push   rbp
  8065df:	48 89 e5             	mov    rbp,rsp
  8065e2:	89 f8                	mov    eax,edi
  8065e4:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  8065e7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8065ee:	e9 c7 00 00 00       	jmp    8066ba <to_ascii+0xe0>
        if(key_map[i].scan_code==scan_code)
  8065f3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8065f6:	48 63 d0             	movsxd rdx,eax
  8065f9:	48 89 d0             	mov    rax,rdx
  8065fc:	48 c1 e0 02          	shl    rax,0x2
  806600:	48 01 d0             	add    rax,rdx
  806603:	48 05 62 2c 81 00    	add    rax,0x812c62
  806609:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80660c:	38 45 ec             	cmp    BYTE PTR [rbp-0x14],al
  80660f:	0f 85 a1 00 00 00    	jne    8066b6 <to_ascii+0xdc>
        {
            if(k_capslock&&key_map[i].ascii>='a'&&key_map[i].ascii<='z')return key_map[i].ascii_shift;
  806615:	0f b6 05 93 11 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21193]        # 4277af <k_capslock>
  80661c:	84 c0                	test   al,al
  80661e:	74 55                	je     806675 <to_ascii+0x9b>
  806620:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806623:	48 63 d0             	movsxd rdx,eax
  806626:	48 89 d0             	mov    rax,rdx
  806629:	48 c1 e0 02          	shl    rax,0x2
  80662d:	48 01 d0             	add    rax,rdx
  806630:	48 05 60 2c 81 00    	add    rax,0x812c60
  806636:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806639:	3c 60                	cmp    al,0x60
  80663b:	7e 38                	jle    806675 <to_ascii+0x9b>
  80663d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806640:	48 63 d0             	movsxd rdx,eax
  806643:	48 89 d0             	mov    rax,rdx
  806646:	48 c1 e0 02          	shl    rax,0x2
  80664a:	48 01 d0             	add    rax,rdx
  80664d:	48 05 60 2c 81 00    	add    rax,0x812c60
  806653:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806656:	3c 7a                	cmp    al,0x7a
  806658:	7f 1b                	jg     806675 <to_ascii+0x9b>
  80665a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80665d:	48 63 d0             	movsxd rdx,eax
  806660:	48 89 d0             	mov    rax,rdx
  806663:	48 c1 e0 02          	shl    rax,0x2
  806667:	48 01 d0             	add    rax,rdx
  80666a:	48 05 61 2c 81 00    	add    rax,0x812c61
  806670:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806673:	eb 54                	jmp    8066c9 <to_ascii+0xef>
            else if(k_shift)return key_map[i].ascii_shift;
  806675:	0f b6 05 31 11 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21131]        # 4277ad <k_shift>
  80667c:	84 c0                	test   al,al
  80667e:	74 1b                	je     80669b <to_ascii+0xc1>
  806680:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806683:	48 63 d0             	movsxd rdx,eax
  806686:	48 89 d0             	mov    rax,rdx
  806689:	48 c1 e0 02          	shl    rax,0x2
  80668d:	48 01 d0             	add    rax,rdx
  806690:	48 05 61 2c 81 00    	add    rax,0x812c61
  806696:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806699:	eb 2e                	jmp    8066c9 <to_ascii+0xef>
            else return key_map[i].ascii;
  80669b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80669e:	48 63 d0             	movsxd rdx,eax
  8066a1:	48 89 d0             	mov    rax,rdx
  8066a4:	48 c1 e0 02          	shl    rax,0x2
  8066a8:	48 01 d0             	add    rax,rdx
  8066ab:	48 05 60 2c 81 00    	add    rax,0x812c60
  8066b1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8066b4:	eb 13                	jmp    8066c9 <to_ascii+0xef>
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  8066b6:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8066ba:	83 7d fc 5d          	cmp    DWORD PTR [rbp-0x4],0x5d
  8066be:	0f 8e 2f ff ff ff    	jle    8065f3 <to_ascii+0x19>
        }

    return '\0';
  8066c4:	b8 00 00 00 00       	mov    eax,0x0
}
  8066c9:	5d                   	pop    rbp
  8066ca:	c3                   	ret    

00000000008066cb <init_kb>:
int init_kb()
{
  8066cb:	f3 0f 1e fa          	endbr64 
  8066cf:	55                   	push   rbp
  8066d0:	48 89 e5             	mov    rbp,rsp
    reg_device(&dev_keyboard);
  8066d3:	bf a0 2b 81 00       	mov    edi,0x812ba0
  8066d8:	e8 b0 c3 ff ff       	call   802a8d <reg_device>
    reg_driver(&drv_keyboard);
  8066dd:	bf 00 2b 81 00       	mov    edi,0x812b00
  8066e2:	e8 8e c6 ff ff       	call   802d75 <reg_driver>
}
  8066e7:	90                   	nop
  8066e8:	5d                   	pop    rbp
  8066e9:	c3                   	ret    

00000000008066ea <key_proc>:
int key_proc()
{
  8066ea:	f3 0f 1e fa          	endbr64 
  8066ee:	55                   	push   rbp
  8066ef:	48 89 e5             	mov    rbp,rsp
  8066f2:	48 83 ec 10          	sub    rsp,0x10
    //获取完整的扫描码
    u8 scan1=0,scan2=0,ch=0;
  8066f6:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
  8066fa:	c6 45 fe 00          	mov    BYTE PTR [rbp-0x2],0x0
  8066fe:	c6 45 fd 00          	mov    BYTE PTR [rbp-0x3],0x0
    key_code tmpc;
    scan1=inb(0x60);
  806702:	bf 60 00 00 00       	mov    edi,0x60
  806707:	e8 1d e7 ff ff       	call   804e29 <inb>
  80670c:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
//    tmpc.scan_code2=scan2;
//    tmpc.ascii= ch;


//    ENQUEUE(key_bufq,tmpc)
    if((key_bufq.tail+1)%key_bufq.size!=key_bufq.head)
  80670f:	8b 05 17 48 00 00    	mov    eax,DWORD PTR [rip+0x4817]        # 80af2c <key_bufq+0xc>
  806715:	83 c0 01             	add    eax,0x1
  806718:	8b 0d 12 48 00 00    	mov    ecx,DWORD PTR [rip+0x4812]        # 80af30 <key_bufq+0x10>
  80671e:	99                   	cdq    
  80671f:	f7 f9                	idiv   ecx
  806721:	8b 05 01 48 00 00    	mov    eax,DWORD PTR [rip+0x4801]        # 80af28 <key_bufq+0x8>
  806727:	39 c2                	cmp    edx,eax
  806729:	74 32                	je     80675d <key_proc+0x73>
    {
        key_bufq.data[key_bufq.tail]=scan1;
  80672b:	48 8b 15 ee 47 00 00 	mov    rdx,QWORD PTR [rip+0x47ee]        # 80af20 <key_bufq>
  806732:	8b 05 f4 47 00 00    	mov    eax,DWORD PTR [rip+0x47f4]        # 80af2c <key_bufq+0xc>
  806738:	48 98                	cdqe   
  80673a:	48 01 c2             	add    rdx,rax
  80673d:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  806741:	88 02                	mov    BYTE PTR [rdx],al
        key_bufq.tail=(key_bufq.tail+1)%key_bufq.size;
  806743:	8b 05 e3 47 00 00    	mov    eax,DWORD PTR [rip+0x47e3]        # 80af2c <key_bufq+0xc>
  806749:	83 c0 01             	add    eax,0x1
  80674c:	8b 0d de 47 00 00    	mov    ecx,DWORD PTR [rip+0x47de]        # 80af30 <key_bufq+0x10>
  806752:	99                   	cdq    
  806753:	f7 f9                	idiv   ecx
  806755:	89 d0                	mov    eax,edx
  806757:	89 05 cf 47 00 00    	mov    DWORD PTR [rip+0x47cf],eax        # 80af2c <key_bufq+0xc>
    }

    if(scan1==0x48)
  80675d:	80 7d ff 48          	cmp    BYTE PTR [rbp-0x1],0x48
  806761:	75 0a                	jne    80676d <key_proc+0x83>
        scr_up();
  806763:	b8 00 00 00 00       	mov    eax,0x0
  806768:	e8 d4 f7 ff ff       	call   805f41 <scr_up>
    if(scan1==0x50)
  80676d:	80 7d ff 50          	cmp    BYTE PTR [rbp-0x1],0x50
  806771:	75 0a                	jne    80677d <key_proc+0x93>
        scr_down();
  806773:	b8 00 00 00 00       	mov    eax,0x0
  806778:	e8 55 f8 ff ff       	call   805fd2 <scr_down>
    switch (scan1)
  80677d:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  806781:	3d b6 00 00 00       	cmp    eax,0xb6
  806786:	74 41                	je     8067c9 <key_proc+0xdf>
  806788:	3d b6 00 00 00       	cmp    eax,0xb6
  80678d:	7f 5e                	jg     8067ed <key_proc+0x103>
  80678f:	3d aa 00 00 00       	cmp    eax,0xaa
  806794:	74 33                	je     8067c9 <key_proc+0xdf>
  806796:	3d aa 00 00 00       	cmp    eax,0xaa
  80679b:	7f 50                	jg     8067ed <key_proc+0x103>
  80679d:	3d 9d 00 00 00       	cmp    eax,0x9d
  8067a2:	74 31                	je     8067d5 <key_proc+0xeb>
  8067a4:	3d 9d 00 00 00       	cmp    eax,0x9d
  8067a9:	7f 42                	jg     8067ed <key_proc+0x103>
  8067ab:	83 f8 3a             	cmp    eax,0x3a
  8067ae:	74 31                	je     8067e1 <key_proc+0xf7>
  8067b0:	83 f8 3a             	cmp    eax,0x3a
  8067b3:	7f 38                	jg     8067ed <key_proc+0x103>
  8067b5:	83 f8 36             	cmp    eax,0x36
  8067b8:	74 0f                	je     8067c9 <key_proc+0xdf>
  8067ba:	83 f8 36             	cmp    eax,0x36
  8067bd:	7f 2e                	jg     8067ed <key_proc+0x103>
  8067bf:	83 f8 1d             	cmp    eax,0x1d
  8067c2:	74 11                	je     8067d5 <key_proc+0xeb>
  8067c4:	83 f8 2a             	cmp    eax,0x2a
  8067c7:	75 24                	jne    8067ed <key_proc+0x103>
    {
        case 0x36:
        case 0x2a:
        case 0xaa:
        case 0xb6:
            shift();
  8067c9:	b8 00 00 00 00       	mov    eax,0x0
  8067ce:	e8 b0 fd ff ff       	call   806583 <shift>
            break;
  8067d3:	eb 19                	jmp    8067ee <key_proc+0x104>
        case 0x1d:
        case 0x9d:
            ctrl();
  8067d5:	b8 00 00 00 00       	mov    eax,0x0
  8067da:	e8 c1 fd ff ff       	call   8065a0 <ctrl>
            break;
  8067df:	eb 0d                	jmp    8067ee <key_proc+0x104>
        case 0x3a:
            capslock();
  8067e1:	b8 00 00 00 00       	mov    eax,0x0
  8067e6:	e8 d2 fd ff ff       	call   8065bd <capslock>
            break;
  8067eb:	eb 01                	jmp    8067ee <key_proc+0x104>
        default:
            break;
  8067ed:	90                   	nop
//        //logf("%x\n",stdin.w_ptr);
//        //print_stdin();
//        //printchar(ch);
//        //flush_screen(0);*/
//    }
    eoi();
  8067ee:	b8 00 00 00 00       	mov    eax,0x0
  8067f3:	e8 46 e6 ff ff       	call   804e3e <eoi>
    asm volatile("leave \r\n iretq");
  8067f8:	c9                   	leave  
  8067f9:	48 cf                	iretq  
}
  8067fb:	90                   	nop
  8067fc:	c9                   	leave  
  8067fd:	c3                   	ret    

00000000008067fe <sys_getkbc>:

char sys_getkbc()
{
  8067fe:	f3 0f 1e fa          	endbr64 
  806802:	55                   	push   rbp
  806803:	48 89 e5             	mov    rbp,rsp
    if(key_bufq.tail==key_bufq.head)return -1;
  806806:	8b 15 20 47 00 00    	mov    edx,DWORD PTR [rip+0x4720]        # 80af2c <key_bufq+0xc>
  80680c:	8b 05 16 47 00 00    	mov    eax,DWORD PTR [rip+0x4716]        # 80af28 <key_bufq+0x8>
  806812:	39 c2                	cmp    edx,eax
  806814:	75 07                	jne    80681d <sys_getkbc+0x1f>
  806816:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80681b:	eb 30                	jmp    80684d <sys_getkbc+0x4f>
    char c=key_buf[key_bufq.tail];
  80681d:	8b 05 09 47 00 00    	mov    eax,DWORD PTR [rip+0x4709]        # 80af2c <key_bufq+0xc>
  806823:	48 98                	cdqe   
  806825:	0f b6 80 a0 75 42 00 	movzx  eax,BYTE PTR [rax+0x4275a0]
  80682c:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    QTAIL(key_bufq)=(QTAIL(key_bufq)+1)%QSIZE(key_bufq);
  80682f:	8b 05 f7 46 00 00    	mov    eax,DWORD PTR [rip+0x46f7]        # 80af2c <key_bufq+0xc>
  806835:	83 c0 01             	add    eax,0x1
  806838:	8b 0d f2 46 00 00    	mov    ecx,DWORD PTR [rip+0x46f2]        # 80af30 <key_bufq+0x10>
  80683e:	99                   	cdq    
  80683f:	f7 f9                	idiv   ecx
  806841:	89 d0                	mov    eax,edx
  806843:	89 05 e3 46 00 00    	mov    DWORD PTR [rip+0x46e3],eax        # 80af2c <key_bufq+0xc>
    return c;
  806849:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  80684d:	5d                   	pop    rbp
  80684e:	c3                   	ret    

000000000080684f <init_disk>:
        .read=async_read_disk,
        .write=async_write_disk
};
int disks[4];//四块硬盘的dev号
int init_disk()
{
  80684f:	f3 0f 1e fa          	endbr64 
  806853:	55                   	push   rbp
  806854:	48 89 e5             	mov    rbp,rsp
    //disk_devi= reg_device(&dev_disk);
    //disk_drvi= reg_driver(&drv_disk);
    //dev_disk.drv=&drv_disk;
    hd_iterate();
  806857:	b8 00 00 00 00       	mov    eax,0x0
  80685c:	e8 8d 09 00 00       	call   8071ee <hd_iterate>
    return 0;
  806861:	b8 00 00 00 00       	mov    eax,0x0
}
  806866:	5d                   	pop    rbp
  806867:	c3                   	ret    

0000000000806868 <disk_int_handler_c>:

int disk_int_handler_c()
{
  806868:	f3 0f 1e fa          	endbr64 
  80686c:	55                   	push   rbp
  80686d:	48 89 e5             	mov    rbp,rsp
  806870:	48 83 ec 20          	sub    rsp,0x20
    if(running_req==NULL)
  806874:	48 8b 05 45 3c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23c45]        # 42a4c0 <running_req>
  80687b:	48 85 c0             	test   rax,rax
  80687e:	75 0a                	jne    80688a <disk_int_handler_c+0x22>
    {
        //printf("err:null running dreq\n");
        return 1;//同步读写硬盘
  806880:	b8 01 00 00 00       	mov    eax,0x1
  806885:	e9 a3 01 00 00       	jmp    806a2d <disk_int_handler_c+0x1c5>
    }
    short *p=running_req->buf;
  80688a:	48 8b 05 2f 3c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23c2f]        # 42a4c0 <running_req>
  806891:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806895:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int port=PORT_DISK_MAJOR;
  806899:	c7 45 f4 f0 01 00 00 	mov    DWORD PTR [rbp-0xc],0x1f0
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  8068a0:	48 8b 05 19 3c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23c19]        # 42a4c0 <running_req>
  8068a7:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8068aa:	83 f8 02             	cmp    eax,0x2
  8068ad:	74 0f                	je     8068be <disk_int_handler_c+0x56>
    running_req->disk==DISK_SLAVE_SLAVE)
  8068af:	48 8b 05 0a 3c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23c0a]        # 42a4c0 <running_req>
  8068b6:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  8068b9:	83 f8 03             	cmp    eax,0x3
  8068bc:	75 07                	jne    8068c5 <disk_int_handler_c+0x5d>
        port=PORT_DISK_SLAVE;
  8068be:	c7 45 f4 70 01 00 00 	mov    DWORD PTR [rbp-0xc],0x170
    if(running_req->func==DISKREQ_READ)
  8068c5:	48 8b 05 f4 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23bf4]        # 42a4c0 <running_req>
  8068cc:	8b 00                	mov    eax,DWORD PTR [rax]
  8068ce:	85 c0                	test   eax,eax
  8068d0:	75 42                	jne    806914 <disk_int_handler_c+0xac>
    {
        ////printf("sys_read dist:%x\n",p);
        //读取
        for(int i=0;i<running_req->sec_n*256;i++)
  8068d2:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  8068d9:	eb 22                	jmp    8068fd <disk_int_handler_c+0x95>
        {
            *p++=inw(port);
  8068db:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8068de:	0f b7 c0             	movzx  eax,ax
  8068e1:	89 c7                	mov    edi,eax
  8068e3:	e8 4b e5 ff ff       	call   804e33 <inw>
  8068e8:	89 c2                	mov    edx,eax
  8068ea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8068ee:	48 8d 48 02          	lea    rcx,[rax+0x2]
  8068f2:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  8068f6:	66 89 10             	mov    WORD PTR [rax],dx
        for(int i=0;i<running_req->sec_n*256;i++)
  8068f9:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  8068fd:	48 8b 05 bc 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23bbc]        # 42a4c0 <running_req>
  806904:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  806907:	c1 e0 08             	shl    eax,0x8
  80690a:	39 45 f0             	cmp    DWORD PTR [rbp-0x10],eax
  80690d:	7c cc                	jl     8068db <disk_int_handler_c+0x73>
  80690f:	e9 ca 00 00 00       	jmp    8069de <disk_int_handler_c+0x176>
        }
    }else if(running_req->func==DISKREQ_WRITE)
  806914:	48 8b 05 a5 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23ba5]        # 42a4c0 <running_req>
  80691b:	8b 00                	mov    eax,DWORD PTR [rax]
  80691d:	83 f8 01             	cmp    eax,0x1
  806920:	75 42                	jne    806964 <disk_int_handler_c+0xfc>
    {
        for(int i=0;i<running_req->sec_n*256;i++)
  806922:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  806929:	eb 25                	jmp    806950 <disk_int_handler_c+0xe8>
            outw(port,*p++);
  80692b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80692f:	48 8d 50 02          	lea    rdx,[rax+0x2]
  806933:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  806937:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80693a:	0f b7 d0             	movzx  edx,ax
  80693d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806940:	0f b7 c0             	movzx  eax,ax
  806943:	89 d6                	mov    esi,edx
  806945:	89 c7                	mov    edi,eax
  806947:	e8 d1 e4 ff ff       	call   804e1d <outw>
        for(int i=0;i<running_req->sec_n*256;i++)
  80694c:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  806950:	48 8b 05 69 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23b69]        # 42a4c0 <running_req>
  806957:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80695a:	c1 e0 08             	shl    eax,0x8
  80695d:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  806960:	7c c9                	jl     80692b <disk_int_handler_c+0xc3>
  806962:	eb 7a                	jmp    8069de <disk_int_handler_c+0x176>
    }else if(running_req->func==DISKREQ_CHECK)
  806964:	48 8b 05 55 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23b55]        # 42a4c0 <running_req>
  80696b:	8b 00                	mov    eax,DWORD PTR [rax]
  80696d:	83 f8 02             	cmp    eax,0x2
  806970:	75 34                	jne    8069a6 <disk_int_handler_c+0x13e>
    {
        char stat=inb(port+7);
  806972:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806975:	83 c0 07             	add    eax,0x7
  806978:	0f b6 c0             	movzx  eax,al
  80697b:	89 c7                	mov    edi,eax
  80697d:	e8 a7 e4 ff ff       	call   804e29 <inb>
  806982:	88 45 e7             	mov    BYTE PTR [rbp-0x19],al
        short dat=inw(port);
  806985:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806988:	0f b7 c0             	movzx  eax,ax
  80698b:	89 c7                	mov    edi,eax
  80698d:	e8 a1 e4 ff ff       	call   804e33 <inw>
  806992:	66 89 45 e4          	mov    WORD PTR [rbp-0x1c],ax
        if(1)
        {
            running_req->result=DISK_CHK_OK;
  806996:	48 8b 05 23 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23b23]        # 42a4c0 <running_req>
  80699d:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  8069a4:	eb 38                	jmp    8069de <disk_int_handler_c+0x176>
            char err=inb(port+1);//错误原因
            printf("checking disk err:%x\nresetting hd\n",err);
            running_req->result=DISK_CHK_ERR;
            request(running_req->disk,DISKREQ_RESET,0,0,0);
        }
    }else if(running_req->func==DISKREQ_RESET)
  8069a6:	48 8b 05 13 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23b13]        # 42a4c0 <running_req>
  8069ad:	8b 00                	mov    eax,DWORD PTR [rax]
  8069af:	83 f8 03             	cmp    eax,0x3
  8069b2:	75 2a                	jne    8069de <disk_int_handler_c+0x176>
    {
        int stat=inb(port+7);
  8069b4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8069b7:	83 c0 07             	add    eax,0x7
  8069ba:	0f b6 c0             	movzx  eax,al
  8069bd:	89 c7                	mov    edi,eax
  8069bf:	e8 65 e4 ff ff       	call   804e29 <inb>
  8069c4:	0f b6 c0             	movzx  eax,al
  8069c7:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
        printf("reset disk done.\nstat now:%x\n",stat);
  8069ca:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8069cd:	89 c6                	mov    esi,eax
  8069cf:	bf 36 2e 81 00       	mov    edi,0x812e36
  8069d4:	b8 00 00 00 00       	mov    eax,0x0
  8069d9:	e8 2e a3 ff ff       	call   800d0c <printf>
    }
    running_req->stat=REQ_STAT_DONE;
  8069de:	48 8b 05 db 3a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23adb]        # 42a4c0 <running_req>
  8069e5:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  8069ec:	48 8b 05 cd 3a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23acd]        # 42a4c0 <running_req>
  8069f3:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  8069f7:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  8069fe:	00 00 00 
    running_devman_req->stat=REQ_STAT_DONE;
  806a01:	48 8b 05 c0 3a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23ac0]        # 42a4c8 <running_devman_req>
  806a08:	c7 80 ac 00 00 00 03 	mov    DWORD PTR [rax+0xac],0x3
  806a0f:	00 00 00 
    running_devman_req=NULL;
  806a12:	48 c7 05 ab 3a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23aab],0x0        # 42a4c8 <running_devman_req>
  806a19:	00 00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  806a1d:	48 c7 05 98 3a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23a98],0x0        # 42a4c0 <running_req>
  806a24:	00 00 00 00 
    return 0;
  806a28:	b8 00 00 00 00       	mov    eax,0x0
}
  806a2d:	c9                   	leave  
  806a2e:	c3                   	ret    

0000000000806a2f <check_dreq_stat>:
int check_dreq_stat(int req_id)
{
  806a2f:	f3 0f 1e fa          	endbr64 
  806a33:	55                   	push   rbp
  806a34:	48 89 e5             	mov    rbp,rsp
  806a37:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return disk_reqs[req_id].stat;
  806a3a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806a3d:	48 63 d0             	movsxd rdx,eax
  806a40:	48 89 d0             	mov    rax,rdx
  806a43:	48 01 c0             	add    rax,rax
  806a46:	48 01 d0             	add    rax,rdx
  806a49:	48 c1 e0 04          	shl    rax,0x4
  806a4d:	48 05 dc 77 42 00    	add    rax,0x4277dc
  806a53:	8b 00                	mov    eax,DWORD PTR [rax]
}
  806a55:	5d                   	pop    rbp
  806a56:	c3                   	ret    

0000000000806a57 <request>:
int request(int disk,int func,int lba,int secn,char *buf){
  806a57:	f3 0f 1e fa          	endbr64 
  806a5b:	55                   	push   rbp
  806a5c:	48 89 e5             	mov    rbp,rsp
  806a5f:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806a62:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806a65:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  806a68:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  806a6b:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    if((tail+1)%MAX_DISK_REQUEST_COUNT==head)
  806a6f:	8b 05 7f 3a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23a7f]        # 42a4f4 <tail>
  806a75:	83 c0 01             	add    eax,0x1
  806a78:	48 63 d0             	movsxd rdx,eax
  806a7b:	48 69 d2 89 88 88 88 	imul   rdx,rdx,0xffffffff88888889
  806a82:	48 c1 ea 20          	shr    rdx,0x20
  806a86:	01 c2                	add    edx,eax
  806a88:	c1 fa 07             	sar    edx,0x7
  806a8b:	89 c1                	mov    ecx,eax
  806a8d:	c1 f9 1f             	sar    ecx,0x1f
  806a90:	29 ca                	sub    edx,ecx
  806a92:	69 ca f0 00 00 00    	imul   ecx,edx,0xf0
  806a98:	29 c8                	sub    eax,ecx
  806a9a:	89 c2                	mov    edx,eax
  806a9c:	8b 05 4e 3a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23a4e]        # 42a4f0 <head>
  806aa2:	39 c2                	cmp    edx,eax
  806aa4:	75 0a                	jne    806ab0 <request+0x59>
    {
        return -1;
  806aa6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806aab:	e9 0d 01 00 00       	jmp    806bbd <request+0x166>
    }
    disk_reqs[tail].disk=disk;
  806ab0:	8b 05 3e 3a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23a3e]        # 42a4f4 <tail>
  806ab6:	48 63 d0             	movsxd rdx,eax
  806ab9:	48 89 d0             	mov    rax,rdx
  806abc:	48 01 c0             	add    rax,rax
  806abf:	48 01 d0             	add    rax,rdx
  806ac2:	48 c1 e0 04          	shl    rax,0x4
  806ac6:	48 8d 90 c4 77 42 00 	lea    rdx,[rax+0x4277c4]
  806acd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806ad0:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].func=func;
  806ad2:	8b 05 1c 3a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23a1c]        # 42a4f4 <tail>
  806ad8:	48 63 d0             	movsxd rdx,eax
  806adb:	48 89 d0             	mov    rax,rdx
  806ade:	48 01 c0             	add    rax,rax
  806ae1:	48 01 d0             	add    rax,rdx
  806ae4:	48 c1 e0 04          	shl    rax,0x4
  806ae8:	48 8d 90 c0 77 42 00 	lea    rdx,[rax+0x4277c0]
  806aef:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806af2:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].lba=lba;
  806af4:	8b 05 fa 39 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc239fa]        # 42a4f4 <tail>
  806afa:	48 63 d0             	movsxd rdx,eax
  806afd:	48 89 d0             	mov    rax,rdx
  806b00:	48 01 c0             	add    rax,rax
  806b03:	48 01 d0             	add    rax,rdx
  806b06:	48 c1 e0 04          	shl    rax,0x4
  806b0a:	48 8d 90 c8 77 42 00 	lea    rdx,[rax+0x4277c8]
  806b11:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806b14:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].sec_n=secn;
  806b16:	8b 05 d8 39 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc239d8]        # 42a4f4 <tail>
  806b1c:	48 63 d0             	movsxd rdx,eax
  806b1f:	48 89 d0             	mov    rax,rdx
  806b22:	48 01 c0             	add    rax,rax
  806b25:	48 01 d0             	add    rax,rdx
  806b28:	48 c1 e0 04          	shl    rax,0x4
  806b2c:	48 8d 90 cc 77 42 00 	lea    rdx,[rax+0x4277cc]
  806b33:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  806b36:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].stat=REQ_STAT_READY;
  806b38:	8b 05 b6 39 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc239b6]        # 42a4f4 <tail>
  806b3e:	48 63 d0             	movsxd rdx,eax
  806b41:	48 89 d0             	mov    rax,rdx
  806b44:	48 01 c0             	add    rax,rax
  806b47:	48 01 d0             	add    rax,rdx
  806b4a:	48 c1 e0 04          	shl    rax,0x4
  806b4e:	48 05 dc 77 42 00    	add    rax,0x4277dc
  806b54:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    disk_reqs[tail].buf=buf;
  806b5a:	8b 05 94 39 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23994]        # 42a4f4 <tail>
  806b60:	48 63 d0             	movsxd rdx,eax
  806b63:	48 89 d0             	mov    rax,rdx
  806b66:	48 01 c0             	add    rax,rax
  806b69:	48 01 d0             	add    rax,rdx
  806b6c:	48 c1 e0 04          	shl    rax,0x4
  806b70:	48 8d 90 d0 77 42 00 	lea    rdx,[rax+0x4277d0]
  806b77:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806b7b:	48 89 02             	mov    QWORD PTR [rdx],rax
    int r=tail;
  806b7e:	8b 05 70 39 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23970]        # 42a4f4 <tail>
  806b84:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    tail=(tail+1)%MAX_DISK_REQUEST_COUNT;
  806b87:	8b 05 67 39 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23967]        # 42a4f4 <tail>
  806b8d:	8d 50 01             	lea    edx,[rax+0x1]
  806b90:	48 63 c2             	movsxd rax,edx
  806b93:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  806b9a:	48 c1 e8 20          	shr    rax,0x20
  806b9e:	01 d0                	add    eax,edx
  806ba0:	c1 f8 07             	sar    eax,0x7
  806ba3:	89 d1                	mov    ecx,edx
  806ba5:	c1 f9 1f             	sar    ecx,0x1f
  806ba8:	29 c8                	sub    eax,ecx
  806baa:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  806bb0:	89 d0                	mov    eax,edx
  806bb2:	29 c8                	sub    eax,ecx
  806bb4:	89 05 3a 39 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2393a],eax        # 42a4f4 <tail>
    return r;
  806bba:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  806bbd:	5d                   	pop    rbp
  806bbe:	c3                   	ret    

0000000000806bbf <execute_request>:
int execute_request(){
  806bbf:	f3 0f 1e fa          	endbr64 
  806bc3:	55                   	push   rbp
  806bc4:	48 89 e5             	mov    rbp,rsp
  806bc7:	48 83 ec 10          	sub    rsp,0x10
    //查看是否有已经在运行的请求
    if(running_req!=NULL)
  806bcb:	48 8b 05 ee 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc238ee]        # 42a4c0 <running_req>
  806bd2:	48 85 c0             	test   rax,rax
  806bd5:	74 6a                	je     806c41 <execute_request+0x82>
    {
        running_req->time++;
  806bd7:	48 8b 05 e2 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc238e2]        # 42a4c0 <running_req>
  806bde:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  806be1:	83 c2 01             	add    edx,0x1
  806be4:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
        if(running_req->func!=DISKREQ_CHECK)
  806be7:	48 8b 05 d2 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc238d2]        # 42a4c0 <running_req>
  806bee:	8b 00                	mov    eax,DWORD PTR [rax]
  806bf0:	83 f8 02             	cmp    eax,0x2
  806bf3:	74 0a                	je     806bff <execute_request+0x40>
            return 2;
  806bf5:	b8 02 00 00 00       	mov    eax,0x2
  806bfa:	e9 b4 01 00 00       	jmp    806db3 <execute_request+0x1f4>
        if(running_req->time>MAX_DISK_CHKTIME)
  806bff:	48 8b 05 ba 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc238ba]        # 42a4c0 <running_req>
  806c06:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  806c09:	83 f8 0a             	cmp    eax,0xa
  806c0c:	7e 29                	jle    806c37 <execute_request+0x78>
        {
            //检测硬盘超时，视为没有硬盘连接
            running_req->result=DISK_CHK_ERR;
  806c0e:	48 8b 05 ab 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc238ab]        # 42a4c0 <running_req>
  806c15:	c7 40 20 02 00 00 00 	mov    DWORD PTR [rax+0x20],0x2
            running_req->stat=REQ_STAT_DONE;
  806c1c:	48 8b 05 9d 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2389d]        # 42a4c0 <running_req>
  806c23:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
            running_req=NULL;
  806c2a:	48 c7 05 8b 38 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2388b],0x0        # 42a4c0 <running_req>
  806c31:	00 00 00 00 
  806c35:	eb 0a                	jmp    806c41 <execute_request+0x82>
        }else
        {
            //未到时间继续等待
            return 2;
  806c37:	b8 02 00 00 00       	mov    eax,0x2
  806c3c:	e9 72 01 00 00       	jmp    806db3 <execute_request+0x1f4>
        }
    }
    if(head==tail)return 1;//检查是否为空
  806c41:	8b 15 a9 38 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc238a9]        # 42a4f0 <head>
  806c47:	8b 05 a7 38 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc238a7]        # 42a4f4 <tail>
  806c4d:	39 c2                	cmp    edx,eax
  806c4f:	75 0a                	jne    806c5b <execute_request+0x9c>
  806c51:	b8 01 00 00 00       	mov    eax,0x1
  806c56:	e9 58 01 00 00       	jmp    806db3 <execute_request+0x1f4>
    running_req=&disk_reqs[head];
  806c5b:	8b 05 8f 38 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2388f]        # 42a4f0 <head>
  806c61:	48 63 d0             	movsxd rdx,eax
  806c64:	48 89 d0             	mov    rax,rdx
  806c67:	48 01 c0             	add    rax,rax
  806c6a:	48 01 d0             	add    rax,rdx
  806c6d:	48 c1 e0 04          	shl    rax,0x4
  806c71:	48 05 c0 77 42 00    	add    rax,0x4277c0
  806c77:	48 89 05 42 38 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23842],rax        # 42a4c0 <running_req>
    head=(head+1)%MAX_DISK_REQUEST_COUNT;
  806c7e:	8b 05 6c 38 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2386c]        # 42a4f0 <head>
  806c84:	8d 50 01             	lea    edx,[rax+0x1]
  806c87:	48 63 c2             	movsxd rax,edx
  806c8a:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  806c91:	48 c1 e8 20          	shr    rax,0x20
  806c95:	01 d0                	add    eax,edx
  806c97:	c1 f8 07             	sar    eax,0x7
  806c9a:	89 d1                	mov    ecx,edx
  806c9c:	c1 f9 1f             	sar    ecx,0x1f
  806c9f:	29 c8                	sub    eax,ecx
  806ca1:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  806ca7:	89 d0                	mov    eax,edx
  806ca9:	29 c8                	sub    eax,ecx
  806cab:	89 05 3f 38 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2383f],eax        # 42a4f0 <head>
    running_req->stat=REQ_STAT_WORKING;
  806cb1:	48 8b 05 08 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23808]        # 42a4c0 <running_req>
  806cb8:	c7 40 1c 02 00 00 00 	mov    DWORD PTR [rax+0x1c],0x2
    //set_proc_stat(running_req->pid,SUSPENDED);
    int r=0;
  806cbf:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    switch (running_req->func)
  806cc6:	48 8b 05 f3 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc237f3]        # 42a4c0 <running_req>
  806ccd:	8b 00                	mov    eax,DWORD PTR [rax]
  806ccf:	83 f8 03             	cmp    eax,0x3
  806cd2:	0f 84 ad 00 00 00    	je     806d85 <execute_request+0x1c6>
  806cd8:	83 f8 03             	cmp    eax,0x3
  806cdb:	0f 8f bf 00 00 00    	jg     806da0 <execute_request+0x1e1>
  806ce1:	83 f8 02             	cmp    eax,0x2
  806ce4:	0f 84 85 00 00 00    	je     806d6f <execute_request+0x1b0>
  806cea:	83 f8 02             	cmp    eax,0x2
  806ced:	0f 8f ad 00 00 00    	jg     806da0 <execute_request+0x1e1>
  806cf3:	85 c0                	test   eax,eax
  806cf5:	74 0a                	je     806d01 <execute_request+0x142>
  806cf7:	83 f8 01             	cmp    eax,0x1
  806cfa:	74 3c                	je     806d38 <execute_request+0x179>
        break;
    case DISKREQ_RESET:
        r=async_reset_disk(running_req->disk);
        break;
    default:
        break;
  806cfc:	e9 9f 00 00 00       	jmp    806da0 <execute_request+0x1e1>
        running_req->lba,running_req->sec_n,running_req->buf);
  806d01:	48 8b 05 b8 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc237b8]        # 42a4c0 <running_req>
        r=async_read_disk(running_req->disk,\
  806d08:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
        running_req->lba,running_req->sec_n,running_req->buf);
  806d0c:	48 8b 05 ad 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc237ad]        # 42a4c0 <running_req>
        r=async_read_disk(running_req->disk,\
  806d13:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
        running_req->lba,running_req->sec_n,running_req->buf);
  806d16:	48 8b 05 a3 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc237a3]        # 42a4c0 <running_req>
  806d1d:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_read_disk(running_req->disk,\
  806d20:	89 c6                	mov    esi,eax
  806d22:	48 8b 05 97 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23797]        # 42a4c0 <running_req>
  806d29:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806d2c:	89 c7                	mov    edi,eax
  806d2e:	e8 a7 00 00 00       	call   806dda <async_read_disk>
  806d33:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806d36:	eb 69                	jmp    806da1 <execute_request+0x1e2>
         running_req->lba,running_req->sec_n,running_req->buf);
  806d38:	48 8b 05 81 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23781]        # 42a4c0 <running_req>
        r=async_write_disk(running_req->disk,\
  806d3f:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
         running_req->lba,running_req->sec_n,running_req->buf);
  806d43:	48 8b 05 76 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23776]        # 42a4c0 <running_req>
        r=async_write_disk(running_req->disk,\
  806d4a:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
         running_req->lba,running_req->sec_n,running_req->buf);
  806d4d:	48 8b 05 6c 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2376c]        # 42a4c0 <running_req>
  806d54:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_write_disk(running_req->disk,\
  806d57:	89 c6                	mov    esi,eax
  806d59:	48 8b 05 60 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23760]        # 42a4c0 <running_req>
  806d60:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806d63:	89 c7                	mov    edi,eax
  806d65:	e8 88 01 00 00       	call   806ef2 <async_write_disk>
  806d6a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806d6d:	eb 32                	jmp    806da1 <execute_request+0x1e2>
        r=async_check_disk(running_req->disk);
  806d6f:	48 8b 05 4a 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2374a]        # 42a4c0 <running_req>
  806d76:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806d79:	89 c7                	mov    edi,eax
  806d7b:	e8 8f 06 00 00       	call   80740f <async_check_disk>
  806d80:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806d83:	eb 1c                	jmp    806da1 <execute_request+0x1e2>
        r=async_reset_disk(running_req->disk);
  806d85:	48 8b 05 34 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23734]        # 42a4c0 <running_req>
  806d8c:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806d8f:	89 c7                	mov    edi,eax
  806d91:	b8 00 00 00 00       	mov    eax,0x0
  806d96:	e8 1a 00 00 00       	call   806db5 <async_reset_disk>
  806d9b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806d9e:	eb 01                	jmp    806da1 <execute_request+0x1e2>
        break;
  806da0:	90                   	nop
    }
    if(r==-1)return -1;
  806da1:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  806da5:	75 07                	jne    806dae <execute_request+0x1ef>
  806da7:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806dac:	eb 05                	jmp    806db3 <execute_request+0x1f4>
    return 0;
  806dae:	b8 00 00 00 00       	mov    eax,0x0
}
  806db3:	c9                   	leave  
  806db4:	c3                   	ret    

0000000000806db5 <async_reset_disk>:
int async_reset_disk(int disk)
{
  806db5:	f3 0f 1e fa          	endbr64 
  806db9:	55                   	push   rbp
  806dba:	48 89 e5             	mov    rbp,rsp
  806dbd:	48 83 ec 10          	sub    rsp,0x10
  806dc1:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    outb(PORT_DISK_CONTROL,DISK_CMD_RESET);
  806dc4:	be 0c 00 00 00       	mov    esi,0xc
  806dc9:	bf f6 03 00 00       	mov    edi,0x3f6
  806dce:	e8 3d e0 ff ff       	call   804e10 <outb>
    return 0;
  806dd3:	b8 00 00 00 00       	mov    eax,0x0
}
  806dd8:	c9                   	leave  
  806dd9:	c3                   	ret    

0000000000806dda <async_read_disk>:
int async_read_disk(int disk,unsigned int lba,int sec_n,char* mem_addr)
{
  806dda:	f3 0f 1e fa          	endbr64 
  806dde:	55                   	push   rbp
  806ddf:	48 89 e5             	mov    rbp,rsp
  806de2:	48 83 ec 30          	sub    rsp,0x30
  806de6:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806de9:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806dec:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  806def:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  806df3:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  806df9:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  806e00:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  806e04:	74 06                	je     806e0c <async_read_disk+0x32>
  806e06:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806e0a:	75 06                	jne    806e12 <async_read_disk+0x38>
        port=PORT_DISK_SLAVE;
  806e0c:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  806e12:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806e16:	74 06                	je     806e1e <async_read_disk+0x44>
  806e18:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  806e1c:	75 07                	jne    806e25 <async_read_disk+0x4b>
        slave_disk=1;
  806e1e:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    outb(port+2,sec_n);
  806e25:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806e28:	0f b6 d0             	movzx  edx,al
  806e2b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806e2f:	83 c0 02             	add    eax,0x2
  806e32:	0f b7 c0             	movzx  eax,ax
  806e35:	89 d6                	mov    esi,edx
  806e37:	89 c7                	mov    edi,eax
  806e39:	e8 d2 df ff ff       	call   804e10 <outb>
    outb(port+3,lba&0xff);
  806e3e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806e41:	0f b6 d0             	movzx  edx,al
  806e44:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806e48:	83 c0 03             	add    eax,0x3
  806e4b:	0f b7 c0             	movzx  eax,ax
  806e4e:	89 d6                	mov    esi,edx
  806e50:	89 c7                	mov    edi,eax
  806e52:	e8 b9 df ff ff       	call   804e10 <outb>
    outb(port+4,(lba>>8)&0xff);
  806e57:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806e5a:	c1 e8 08             	shr    eax,0x8
  806e5d:	0f b6 d0             	movzx  edx,al
  806e60:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806e64:	83 c0 04             	add    eax,0x4
  806e67:	0f b7 c0             	movzx  eax,ax
  806e6a:	89 d6                	mov    esi,edx
  806e6c:	89 c7                	mov    edi,eax
  806e6e:	e8 9d df ff ff       	call   804e10 <outb>
    outb(port+5,(lba>>16)&0xff);
  806e73:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806e76:	c1 e8 10             	shr    eax,0x10
  806e79:	0f b6 d0             	movzx  edx,al
  806e7c:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806e80:	83 c0 05             	add    eax,0x5
  806e83:	0f b7 c0             	movzx  eax,ax
  806e86:	89 d6                	mov    esi,edx
  806e88:	89 c7                	mov    edi,eax
  806e8a:	e8 81 df ff ff       	call   804e10 <outb>
    char drv=slave_disk?0x10:0;
  806e8f:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  806e93:	74 07                	je     806e9c <async_read_disk+0xc2>
  806e95:	b8 10 00 00 00       	mov    eax,0x10
  806e9a:	eb 05                	jmp    806ea1 <async_read_disk+0xc7>
  806e9c:	b8 00 00 00 00       	mov    eax,0x0
  806ea1:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
    char lba_hi=(lba>>24)&0xf|drv|0xe0;
  806ea4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806ea7:	c1 e8 18             	shr    eax,0x18
  806eaa:	83 e0 0f             	and    eax,0xf
  806ead:	89 c2                	mov    edx,eax
  806eaf:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  806eb3:	09 d0                	or     eax,edx
  806eb5:	83 c8 e0             	or     eax,0xffffffe0
  806eb8:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
    outb(port+6,lba_hi);
  806ebb:	0f b6 45 f6          	movzx  eax,BYTE PTR [rbp-0xa]
  806ebf:	0f b6 d0             	movzx  edx,al
  806ec2:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806ec6:	83 c0 06             	add    eax,0x6
  806ec9:	0f b7 c0             	movzx  eax,ax
  806ecc:	89 d6                	mov    esi,edx
  806ece:	89 c7                	mov    edi,eax
  806ed0:	e8 3b df ff ff       	call   804e10 <outb>
    outb(port+7,DISK_CMD_READ);
  806ed5:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806ed9:	83 c0 07             	add    eax,0x7
  806edc:	0f b7 c0             	movzx  eax,ax
  806edf:	be 20 00 00 00       	mov    esi,0x20
  806ee4:	89 c7                	mov    edi,eax
  806ee6:	e8 25 df ff ff       	call   804e10 <outb>
    // }
    // for(int i=0;i<running_req->sec_n*256;i++)
    // {
    //     *mem_addr++=inw(port);
    // }
    return 0;
  806eeb:	b8 00 00 00 00       	mov    eax,0x0
}
  806ef0:	c9                   	leave  
  806ef1:	c3                   	ret    

0000000000806ef2 <async_write_disk>:
int async_write_disk(int disk,unsigned int lba, int sec_n, char* mem_ptr)
{
  806ef2:	f3 0f 1e fa          	endbr64 
  806ef6:	55                   	push   rbp
  806ef7:	48 89 e5             	mov    rbp,rsp
  806efa:	48 83 ec 30          	sub    rsp,0x30
  806efe:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806f01:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806f04:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  806f07:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  806f0b:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  806f11:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  806f18:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  806f1c:	74 06                	je     806f24 <async_write_disk+0x32>
  806f1e:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806f22:	75 06                	jne    806f2a <async_write_disk+0x38>
        port=PORT_DISK_SLAVE;
  806f24:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  806f2a:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806f2e:	74 06                	je     806f36 <async_write_disk+0x44>
  806f30:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  806f34:	75 07                	jne    806f3d <async_write_disk+0x4b>
        slave_disk=1;
  806f36:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    while (1)
    {
        byte t=inb(0x1f7);
  806f3d:	bf f7 00 00 00       	mov    edi,0xf7
  806f42:	e8 e2 de ff ff       	call   804e29 <inb>
  806f47:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
        //logf("istat:%x",t);
        byte err=t&1;
  806f4a:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  806f4e:	83 e0 01             	and    eax,0x1
  806f51:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
        if(err!=0)
  806f54:	80 7d f6 00          	cmp    BYTE PTR [rbp-0xa],0x0
  806f58:	74 0a                	je     806f64 <async_write_disk+0x72>
        {
            //printf("ERR iwriting disk\n");
            return -1;
  806f5a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806f5f:	e9 d5 00 00 00       	jmp    807039 <async_write_disk+0x147>
        }
        t&=0x88;
  806f64:	80 65 f7 88          	and    BYTE PTR [rbp-0x9],0x88
        if(t==0x8)break;
  806f68:	80 7d f7 08          	cmp    BYTE PTR [rbp-0x9],0x8
  806f6c:	74 02                	je     806f70 <async_write_disk+0x7e>
    {
  806f6e:	eb cd                	jmp    806f3d <async_write_disk+0x4b>
        if(t==0x8)break;
  806f70:	90                   	nop
    }
    outb(port+2,sec_n);
  806f71:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806f74:	0f b6 d0             	movzx  edx,al
  806f77:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806f7b:	83 c0 02             	add    eax,0x2
  806f7e:	0f b7 c0             	movzx  eax,ax
  806f81:	89 d6                	mov    esi,edx
  806f83:	89 c7                	mov    edi,eax
  806f85:	e8 86 de ff ff       	call   804e10 <outb>
    outb(port+3,lba&0xff);
  806f8a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806f8d:	0f b6 d0             	movzx  edx,al
  806f90:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806f94:	83 c0 03             	add    eax,0x3
  806f97:	0f b7 c0             	movzx  eax,ax
  806f9a:	89 d6                	mov    esi,edx
  806f9c:	89 c7                	mov    edi,eax
  806f9e:	e8 6d de ff ff       	call   804e10 <outb>
    outb(port+4,(lba>>8)&0xff);
  806fa3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806fa6:	c1 e8 08             	shr    eax,0x8
  806fa9:	0f b6 d0             	movzx  edx,al
  806fac:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806fb0:	83 c0 04             	add    eax,0x4
  806fb3:	0f b7 c0             	movzx  eax,ax
  806fb6:	89 d6                	mov    esi,edx
  806fb8:	89 c7                	mov    edi,eax
  806fba:	e8 51 de ff ff       	call   804e10 <outb>
    outb(port+5,(lba>>16)&0xff);
  806fbf:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806fc2:	c1 e8 10             	shr    eax,0x10
  806fc5:	0f b6 d0             	movzx  edx,al
  806fc8:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806fcc:	83 c0 05             	add    eax,0x5
  806fcf:	0f b7 c0             	movzx  eax,ax
  806fd2:	89 d6                	mov    esi,edx
  806fd4:	89 c7                	mov    edi,eax
  806fd6:	e8 35 de ff ff       	call   804e10 <outb>
    char drv=slave_disk?0x10:0;
  806fdb:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  806fdf:	74 07                	je     806fe8 <async_write_disk+0xf6>
  806fe1:	b8 10 00 00 00       	mov    eax,0x10
  806fe6:	eb 05                	jmp    806fed <async_write_disk+0xfb>
  806fe8:	b8 00 00 00 00       	mov    eax,0x0
  806fed:	88 45 f5             	mov    BYTE PTR [rbp-0xb],al
    unsigned char lba_hi=(lba>>24)&0xf|drv|0xe0;
  806ff0:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806ff3:	c1 e8 18             	shr    eax,0x18
  806ff6:	83 e0 0f             	and    eax,0xf
  806ff9:	89 c2                	mov    edx,eax
  806ffb:	0f b6 45 f5          	movzx  eax,BYTE PTR [rbp-0xb]
  806fff:	09 d0                	or     eax,edx
  807001:	83 c8 e0             	or     eax,0xffffffe0
  807004:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    outb(port+6,lba_hi);
  807007:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  80700b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80700f:	83 c0 06             	add    eax,0x6
  807012:	0f b7 c0             	movzx  eax,ax
  807015:	89 d6                	mov    esi,edx
  807017:	89 c7                	mov    edi,eax
  807019:	e8 f2 dd ff ff       	call   804e10 <outb>
    outb(port+7,DISK_CMD_WRITE);
  80701e:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807022:	83 c0 07             	add    eax,0x7
  807025:	0f b7 c0             	movzx  eax,ax
  807028:	be 30 00 00 00       	mov    esi,0x30
  80702d:	89 c7                	mov    edi,eax
  80702f:	e8 dc dd ff ff       	call   804e10 <outb>
    //     if(t==0x8)break;
    // }
    // short *p=mem_ptr;
    // for(int i=0;i<running_req->sec_n*256;i++)
    //         outw(port,*p++);
    return 0;
  807034:	b8 00 00 00 00       	mov    eax,0x0
}
  807039:	c9                   	leave  
  80703a:	c3                   	ret    

000000000080703b <read_disk>:
int read_disk(driver_args* args)
{
  80703b:	f3 0f 1e fa          	endbr64 
  80703f:	55                   	push   rbp
  807040:	48 89 e5             	mov    rbp,rsp
  807043:	48 83 ec 20          	sub    rsp,0x20
  807047:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=read_disk_asm(args->lba,args->sec_c,args->dist_addr);
  80704b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80704f:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  807052:	48 98                	cdqe   
  807054:	48 89 c2             	mov    rdx,rax
  807057:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80705b:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  80705e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807062:	8b 00                	mov    eax,DWORD PTR [rax]
  807064:	89 ce                	mov    esi,ecx
  807066:	89 c7                	mov    edi,eax
  807068:	e8 8f 05 00 00       	call   8075fc <read_disk_asm>
  80706d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  807070:	48 8b 05 49 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23449]        # 42a4c0 <running_req>
  807077:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  80707e:	48 8b 05 3b 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2343b]        # 42a4c0 <running_req>
  807085:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  807089:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  807090:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  807093:	48 c7 05 22 34 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23422],0x0        # 42a4c0 <running_req>
  80709a:	00 00 00 00 
    return ret;
  80709e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8070a1:	c9                   	leave  
  8070a2:	c3                   	ret    

00000000008070a3 <write_disk>:
int write_disk(driver_args* args)
{
  8070a3:	f3 0f 1e fa          	endbr64 
  8070a7:	55                   	push   rbp
  8070a8:	48 89 e5             	mov    rbp,rsp
  8070ab:	48 83 ec 20          	sub    rsp,0x20
  8070af:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=write_disk_asm(args->lba,args->sec_c,args->src_addr);
  8070b3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8070b7:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8070ba:	48 98                	cdqe   
  8070bc:	48 89 c2             	mov    rdx,rax
  8070bf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8070c3:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  8070c6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8070ca:	8b 00                	mov    eax,DWORD PTR [rax]
  8070cc:	89 ce                	mov    esi,ecx
  8070ce:	89 c7                	mov    edi,eax
  8070d0:	e8 a7 05 00 00       	call   80767c <write_disk_asm>
  8070d5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  8070d8:	48 8b 05 e1 33 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc233e1]        # 42a4c0 <running_req>
  8070df:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  8070e6:	48 8b 05 d3 33 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc233d3]        # 42a4c0 <running_req>
  8070ed:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  8070f1:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  8070f8:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  8070fb:	48 c7 05 ba 33 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc233ba],0x0        # 42a4c0 <running_req>
  807102:	00 00 00 00 
    return ret;
  807106:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  807109:	c9                   	leave  
  80710a:	c3                   	ret    

000000000080710b <chk_result>:
int chk_result(int r)
{
  80710b:	f3 0f 1e fa          	endbr64 
  80710f:	55                   	push   rbp
  807110:	48 89 e5             	mov    rbp,rsp
  807113:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(disk_reqs[r].stat!=REQ_STAT_DONE);
  807116:	90                   	nop
  807117:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80711a:	48 63 d0             	movsxd rdx,eax
  80711d:	48 89 d0             	mov    rax,rdx
  807120:	48 01 c0             	add    rax,rax
  807123:	48 01 d0             	add    rax,rdx
  807126:	48 c1 e0 04          	shl    rax,0x4
  80712a:	48 05 dc 77 42 00    	add    rax,0x4277dc
  807130:	8b 00                	mov    eax,DWORD PTR [rax]
  807132:	83 f8 03             	cmp    eax,0x3
  807135:	75 e0                	jne    807117 <chk_result+0xc>
    return disk_reqs[r].result==DISK_CHK_OK?1:0;
  807137:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80713a:	48 63 d0             	movsxd rdx,eax
  80713d:	48 89 d0             	mov    rax,rdx
  807140:	48 01 c0             	add    rax,rax
  807143:	48 01 d0             	add    rax,rdx
  807146:	48 c1 e0 04          	shl    rax,0x4
  80714a:	48 05 e0 77 42 00    	add    rax,0x4277e0
  807150:	8b 00                	mov    eax,DWORD PTR [rax]
  807152:	83 f8 01             	cmp    eax,0x1
  807155:	0f 94 c0             	sete   al
  807158:	0f b6 c0             	movzx  eax,al
}
  80715b:	5d                   	pop    rbp
  80715c:	c3                   	ret    

000000000080715d <disk_existent>:
int disk_existent(int disk)
{
  80715d:	f3 0f 1e fa          	endbr64 
  807161:	55                   	push   rbp
  807162:	48 89 e5             	mov    rbp,rsp
  807165:	48 83 ec 10          	sub    rsp,0x10
  807169:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    switch (disk)
  80716c:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  807170:	74 5f                	je     8071d1 <disk_existent+0x74>
  807172:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  807176:	7f 6e                	jg     8071e6 <disk_existent+0x89>
  807178:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  80717c:	74 3e                	je     8071bc <disk_existent+0x5f>
  80717e:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  807182:	7f 62                	jg     8071e6 <disk_existent+0x89>
  807184:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807188:	74 08                	je     807192 <disk_existent+0x35>
  80718a:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
  80718e:	74 17                	je     8071a7 <disk_existent+0x4a>
        
    case DISK_SLAVE_SLAVE:
        return sys_find_dev("hd3")!=-1;
        break;
    default:
        break;
  807190:	eb 54                	jmp    8071e6 <disk_existent+0x89>
        return sys_find_dev("hd0")!=-1;
  807192:	bf 54 2e 81 00       	mov    edi,0x812e54
  807197:	e8 29 bd ff ff       	call   802ec5 <sys_find_dev>
  80719c:	83 f8 ff             	cmp    eax,0xffffffff
  80719f:	0f 95 c0             	setne  al
  8071a2:	0f b6 c0             	movzx  eax,al
  8071a5:	eb 45                	jmp    8071ec <disk_existent+0x8f>
        return sys_find_dev("hd1")!=-1;
  8071a7:	bf 58 2e 81 00       	mov    edi,0x812e58
  8071ac:	e8 14 bd ff ff       	call   802ec5 <sys_find_dev>
  8071b1:	83 f8 ff             	cmp    eax,0xffffffff
  8071b4:	0f 95 c0             	setne  al
  8071b7:	0f b6 c0             	movzx  eax,al
  8071ba:	eb 30                	jmp    8071ec <disk_existent+0x8f>
        return sys_find_dev("hd2")!=-1;
  8071bc:	bf 5c 2e 81 00       	mov    edi,0x812e5c
  8071c1:	e8 ff bc ff ff       	call   802ec5 <sys_find_dev>
  8071c6:	83 f8 ff             	cmp    eax,0xffffffff
  8071c9:	0f 95 c0             	setne  al
  8071cc:	0f b6 c0             	movzx  eax,al
  8071cf:	eb 1b                	jmp    8071ec <disk_existent+0x8f>
        return sys_find_dev("hd3")!=-1;
  8071d1:	bf 60 2e 81 00       	mov    edi,0x812e60
  8071d6:	e8 ea bc ff ff       	call   802ec5 <sys_find_dev>
  8071db:	83 f8 ff             	cmp    eax,0xffffffff
  8071de:	0f 95 c0             	setne  al
  8071e1:	0f b6 c0             	movzx  eax,al
  8071e4:	eb 06                	jmp    8071ec <disk_existent+0x8f>
        break;
  8071e6:	90                   	nop
    }
    return 0;
  8071e7:	b8 00 00 00 00       	mov    eax,0x0
}
  8071ec:	c9                   	leave  
  8071ed:	c3                   	ret    

00000000008071ee <hd_iterate>:
int hd_iterate()
{
  8071ee:	f3 0f 1e fa          	endbr64 
  8071f2:	55                   	push   rbp
  8071f3:	48 89 e5             	mov    rbp,rsp
  8071f6:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
    char *name;
    
    int r[4];
    r[0]=request(DISK_MAJOR_MAJOR,DISKREQ_CHECK,0,1,0);
  8071fd:	41 b8 00 00 00 00    	mov    r8d,0x0
  807203:	b9 01 00 00 00       	mov    ecx,0x1
  807208:	ba 00 00 00 00       	mov    edx,0x0
  80720d:	be 02 00 00 00       	mov    esi,0x2
  807212:	bf 00 00 00 00       	mov    edi,0x0
  807217:	e8 3b f8 ff ff       	call   806a57 <request>
  80721c:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    r[1]=request(DISK_MAJOR_SLAVE,DISKREQ_CHECK,0,1,0);
  80721f:	41 b8 00 00 00 00    	mov    r8d,0x0
  807225:	b9 01 00 00 00       	mov    ecx,0x1
  80722a:	ba 00 00 00 00       	mov    edx,0x0
  80722f:	be 02 00 00 00       	mov    esi,0x2
  807234:	bf 01 00 00 00       	mov    edi,0x1
  807239:	e8 19 f8 ff ff       	call   806a57 <request>
  80723e:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    r[2]=request(DISK_SLAVE_MAJOR,DISKREQ_CHECK,0,1,0);
  807241:	41 b8 00 00 00 00    	mov    r8d,0x0
  807247:	b9 01 00 00 00       	mov    ecx,0x1
  80724c:	ba 00 00 00 00       	mov    edx,0x0
  807251:	be 02 00 00 00       	mov    esi,0x2
  807256:	bf 02 00 00 00       	mov    edi,0x2
  80725b:	e8 f7 f7 ff ff       	call   806a57 <request>
  807260:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    r[3]=request(DISK_SLAVE_SLAVE,DISKREQ_CHECK,0,1,0);
  807263:	41 b8 00 00 00 00    	mov    r8d,0x0
  807269:	b9 01 00 00 00       	mov    ecx,0x1
  80726e:	ba 00 00 00 00       	mov    edx,0x0
  807273:	be 02 00 00 00       	mov    esi,0x2
  807278:	bf 03 00 00 00       	mov    edi,0x3
  80727d:	e8 d5 f7 ff ff       	call   806a57 <request>
  807282:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    for(int i=0;i<1;i++)
  807285:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80728c:	e9 72 01 00 00       	jmp    807403 <hd_iterate+0x215>
    {
        int disk;
        switch (i)
  807291:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  807295:	74 3b                	je     8072d2 <hd_iterate+0xe4>
  807297:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  80729b:	7f 3e                	jg     8072db <hd_iterate+0xed>
  80729d:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  8072a1:	74 26                	je     8072c9 <hd_iterate+0xdb>
  8072a3:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  8072a7:	7f 32                	jg     8072db <hd_iterate+0xed>
  8072a9:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8072ad:	74 08                	je     8072b7 <hd_iterate+0xc9>
  8072af:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  8072b3:	74 0b                	je     8072c0 <hd_iterate+0xd2>
  8072b5:	eb 24                	jmp    8072db <hd_iterate+0xed>
        {
        case 0:disk=DISK_MAJOR_MAJOR;break;
  8072b7:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  8072be:	eb 25                	jmp    8072e5 <hd_iterate+0xf7>
        case 1:disk=DISK_MAJOR_SLAVE;break;
  8072c0:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [rbp-0x10],0x1
  8072c7:	eb 1c                	jmp    8072e5 <hd_iterate+0xf7>
        case 2:disk=DISK_SLAVE_MAJOR;break;
  8072c9:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [rbp-0x10],0x2
  8072d0:	eb 13                	jmp    8072e5 <hd_iterate+0xf7>
        case 3:disk=DISK_SLAVE_SLAVE;break;
  8072d2:	c7 45 f0 03 00 00 00 	mov    DWORD PTR [rbp-0x10],0x3
  8072d9:	eb 0a                	jmp    8072e5 <hd_iterate+0xf7>
        default:
            return -1;
  8072db:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8072e0:	e9 28 01 00 00       	jmp    80740d <hd_iterate+0x21f>
            break;
        }
        if(chk_result(r[i]))//&&!disk_existent(disk)
  8072e5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8072e8:	48 98                	cdqe   
  8072ea:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  8072ee:	89 c7                	mov    edi,eax
  8072f0:	e8 16 fe ff ff       	call   80710b <chk_result>
  8072f5:	85 c0                	test   eax,eax
  8072f7:	0f 84 81 00 00 00    	je     80737e <hd_iterate+0x190>
        {
            printf("disk %d checked.\n",i);
  8072fd:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807300:	89 c6                	mov    esi,eax
  807302:	bf 64 2e 81 00       	mov    edi,0x812e64
  807307:	b8 00 00 00 00       	mov    eax,0x0
  80730c:	e8 fb 99 ff ff       	call   800d0c <printf>
            //新硬盘
            device hd={
  807311:	48 8d 95 20 ff ff ff 	lea    rdx,[rbp-0xe0]
  807318:	b8 00 00 00 00       	mov    eax,0x0
  80731d:	b9 15 00 00 00       	mov    ecx,0x15
  807322:	48 89 d7             	mov    rdi,rdx
  807325:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  807328:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80732b:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  807331:	c7 85 28 ff ff ff 01 	mov    DWORD PTR [rbp-0xd8],0x1
  807338:	00 00 00 
  80733b:	c7 85 2c ff ff ff 01 	mov    DWORD PTR [rbp-0xd4],0x1
  807342:	00 00 00 
                .type=DEV_TYPE_BLKDEV,
                .stype=DEV_STYPE_HD,
                .slave_dev=disk,
                .start_port=i<2?PORT_DISK_MAJOR:PORT_DISK_SLAVE
  807345:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  807349:	7f 07                	jg     807352 <hd_iterate+0x164>
  80734b:	b8 f0 01 00 00       	mov    eax,0x1f0
  807350:	eb 05                	jmp    807357 <hd_iterate+0x169>
  807352:	b8 70 01 00 00       	mov    eax,0x170
            device hd={
  807357:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            };
            disks[i]=reg_device(&hd);
  80735d:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  807364:	48 89 c7             	mov    rdi,rax
  807367:	e8 21 b7 ff ff       	call   802a8d <reg_device>
  80736c:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80736f:	48 63 d2             	movsxd rdx,edx
  807372:	89 04 95 e0 a4 42 00 	mov    DWORD PTR [rdx*4+0x42a4e0],eax
  807379:	e9 81 00 00 00       	jmp    8073ff <hd_iterate+0x211>
        }else if(!chk_result(r[i]))//&&disk_existent(disk)
  80737e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807381:	48 98                	cdqe   
  807383:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  807387:	89 c7                	mov    edi,eax
  807389:	e8 7d fd ff ff       	call   80710b <chk_result>
  80738e:	85 c0                	test   eax,eax
  807390:	75 6d                	jne    8073ff <hd_iterate+0x211>
        {
            switch (i)
  807392:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  807396:	74 3e                	je     8073d6 <hd_iterate+0x1e8>
  807398:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  80739c:	7f 41                	jg     8073df <hd_iterate+0x1f1>
  80739e:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  8073a2:	74 28                	je     8073cc <hd_iterate+0x1de>
  8073a4:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  8073a8:	7f 35                	jg     8073df <hd_iterate+0x1f1>
  8073aa:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8073ae:	74 08                	je     8073b8 <hd_iterate+0x1ca>
  8073b0:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  8073b4:	74 0c                	je     8073c2 <hd_iterate+0x1d4>
  8073b6:	eb 27                	jmp    8073df <hd_iterate+0x1f1>
            {
            case 0:name="hd0";break;
  8073b8:	48 c7 45 f8 54 2e 81 	mov    QWORD PTR [rbp-0x8],0x812e54
  8073bf:	00 
  8073c0:	eb 1d                	jmp    8073df <hd_iterate+0x1f1>
            case 1:name="hd1";break;
  8073c2:	48 c7 45 f8 58 2e 81 	mov    QWORD PTR [rbp-0x8],0x812e58
  8073c9:	00 
  8073ca:	eb 13                	jmp    8073df <hd_iterate+0x1f1>
            case 2:name="hd2";break;
  8073cc:	48 c7 45 f8 5c 2e 81 	mov    QWORD PTR [rbp-0x8],0x812e5c
  8073d3:	00 
  8073d4:	eb 09                	jmp    8073df <hd_iterate+0x1f1>
            case 3:name="hd3";break;
  8073d6:	48 c7 45 f8 60 2e 81 	mov    QWORD PTR [rbp-0x8],0x812e60
  8073dd:	00 
  8073de:	90                   	nop
            }
            //有硬盘被卸载了
            int devi=sys_find_dev(name);
  8073df:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8073e3:	48 89 c7             	mov    rdi,rax
  8073e6:	e8 da ba ff ff       	call   802ec5 <sys_find_dev>
  8073eb:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            dispose_device(get_dev(devi));
  8073ee:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8073f1:	89 c7                	mov    edi,eax
  8073f3:	e8 a1 c1 ff ff       	call   803599 <get_dev>
  8073f8:	89 c7                	mov    edi,eax
  8073fa:	e8 ed c0 ff ff       	call   8034ec <dispose_device>
    for(int i=0;i<1;i++)
  8073ff:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  807403:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  807407:	0f 8e 84 fe ff ff    	jle    807291 <hd_iterate+0xa3>
        }

    }
}
  80740d:	c9                   	leave  
  80740e:	c3                   	ret    

000000000080740f <async_check_disk>:

int async_check_disk(int disk)
{
  80740f:	f3 0f 1e fa          	endbr64 
  807413:	55                   	push   rbp
  807414:	48 89 e5             	mov    rbp,rsp
  807417:	48 83 ec 20          	sub    rsp,0x20
  80741b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    unsigned short disknr=PORT_DISK_MAJOR;
  80741e:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    unsigned short chkcmd=0xe0;
  807424:	66 c7 45 fc e0 00    	mov    WORD PTR [rbp-0x4],0xe0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  80742a:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  80742e:	74 06                	je     807436 <async_check_disk+0x27>
  807430:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  807434:	75 06                	jne    80743c <async_check_disk+0x2d>
        disknr=PORT_DISK_SLAVE;
  807436:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_MAJOR_SLAVE||disk==DISK_SLAVE_SLAVE)
  80743c:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  807440:	74 06                	je     807448 <async_check_disk+0x39>
  807442:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  807446:	75 06                	jne    80744e <async_check_disk+0x3f>
        chkcmd=0xf0;
  807448:	66 c7 45 fc f0 00    	mov    WORD PTR [rbp-0x4],0xf0
    outb(disknr+2,1);
  80744e:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807452:	83 c0 02             	add    eax,0x2
  807455:	0f b7 c0             	movzx  eax,ax
  807458:	be 01 00 00 00       	mov    esi,0x1
  80745d:	89 c7                	mov    edi,eax
  80745f:	e8 ac d9 ff ff       	call   804e10 <outb>
    outb(disknr+3,0);
  807464:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807468:	83 c0 03             	add    eax,0x3
  80746b:	0f b7 c0             	movzx  eax,ax
  80746e:	be 00 00 00 00       	mov    esi,0x0
  807473:	89 c7                	mov    edi,eax
  807475:	e8 96 d9 ff ff       	call   804e10 <outb>
    outb(disknr+4,0);
  80747a:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80747e:	83 c0 04             	add    eax,0x4
  807481:	0f b7 c0             	movzx  eax,ax
  807484:	be 00 00 00 00       	mov    esi,0x0
  807489:	89 c7                	mov    edi,eax
  80748b:	e8 80 d9 ff ff       	call   804e10 <outb>
    outb(disknr+5,0);
  807490:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807494:	83 c0 05             	add    eax,0x5
  807497:	0f b7 c0             	movzx  eax,ax
  80749a:	be 00 00 00 00       	mov    esi,0x0
  80749f:	89 c7                	mov    edi,eax
  8074a1:	e8 6a d9 ff ff       	call   804e10 <outb>
    outb(disknr+6,chkcmd);//主硬盘
  8074a6:	0f b7 45 fc          	movzx  eax,WORD PTR [rbp-0x4]
  8074aa:	0f b6 d0             	movzx  edx,al
  8074ad:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8074b1:	83 c0 06             	add    eax,0x6
  8074b4:	0f b7 c0             	movzx  eax,ax
  8074b7:	89 d6                	mov    esi,edx
  8074b9:	89 c7                	mov    edi,eax
  8074bb:	e8 50 d9 ff ff       	call   804e10 <outb>
    outb(disknr+7,DISK_CMD_CHECK);
  8074c0:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8074c4:	83 c0 07             	add    eax,0x7
  8074c7:	0f b7 c0             	movzx  eax,ax
  8074ca:	be 90 00 00 00       	mov    esi,0x90
  8074cf:	89 c7                	mov    edi,eax
  8074d1:	e8 3a d9 ff ff       	call   804e10 <outb>
    //     // {
    //     //     printf("DISK ERR\n");
    //     //     return -1;
    //     // }
    // }
    return 0;
  8074d6:	b8 00 00 00 00       	mov    eax,0x0
}
  8074db:	c9                   	leave  
  8074dc:	c3                   	ret    

00000000008074dd <hd_do_req>:

//接口函数：负责接收VFS的请求然后执行
int hd_do_req(driver_args *args)
{
  8074dd:	f3 0f 1e fa          	endbr64 
  8074e1:	55                   	push   rbp
  8074e2:	48 89 e5             	mov    rbp,rsp
  8074e5:	48 83 ec 18          	sub    rsp,0x18
  8074e9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int diski=0;
  8074ed:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;disks[diski]!=args->dev;diski++);
  8074f4:	eb 04                	jmp    8074fa <hd_do_req+0x1d>
  8074f6:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8074fa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8074fd:	48 98                	cdqe   
  8074ff:	8b 14 85 e0 a4 42 00 	mov    edx,DWORD PTR [rax*4+0x42a4e0]
  807506:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80750a:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  807510:	39 c2                	cmp    edx,eax
  807512:	75 e2                	jne    8074f6 <hd_do_req+0x19>
    switch (args->cmd)
  807514:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807518:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  80751e:	83 f8 04             	cmp    eax,0x4
  807521:	74 72                	je     807595 <hd_do_req+0xb8>
  807523:	83 f8 04             	cmp    eax,0x4
  807526:	0f 8f 96 00 00 00    	jg     8075c2 <hd_do_req+0xe5>
  80752c:	83 f8 02             	cmp    eax,0x2
  80752f:	74 0a                	je     80753b <hd_do_req+0x5e>
  807531:	83 f8 03             	cmp    eax,0x3
  807534:	74 32                	je     807568 <hd_do_req+0x8b>
  807536:	e9 87 00 00 00       	jmp    8075c2 <hd_do_req+0xe5>
    {
    case DRVF_READ:
        request(diski,DISKREQ_READ,args->lba,args->sec_c,args->dist_addr);
  80753b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80753f:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  807542:	48 98                	cdqe   
  807544:	48 89 c6             	mov    rsi,rax
  807547:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80754b:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  80754e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807552:	8b 10                	mov    edx,DWORD PTR [rax]
  807554:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807557:	49 89 f0             	mov    r8,rsi
  80755a:	be 00 00 00 00       	mov    esi,0x0
  80755f:	89 c7                	mov    edi,eax
  807561:	e8 f1 f4 ff ff       	call   806a57 <request>
        break;
  807566:	eb 61                	jmp    8075c9 <hd_do_req+0xec>
    case DRVF_WRITE:
        request(diski,DISKREQ_WRITE,args->lba,args->sec_c,args->src_addr);
  807568:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80756c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80756f:	48 98                	cdqe   
  807571:	48 89 c6             	mov    rsi,rax
  807574:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807578:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  80757b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80757f:	8b 10                	mov    edx,DWORD PTR [rax]
  807581:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807584:	49 89 f0             	mov    r8,rsi
  807587:	be 01 00 00 00       	mov    esi,0x1
  80758c:	89 c7                	mov    edi,eax
  80758e:	e8 c4 f4 ff ff       	call   806a57 <request>
        break;
  807593:	eb 34                	jmp    8075c9 <hd_do_req+0xec>
    case DRVF_CHK:
        request(diski,DISKREQ_CHECK,args->lba,args->sec_c,args->dist_addr);
  807595:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807599:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80759c:	48 98                	cdqe   
  80759e:	48 89 c6             	mov    rsi,rax
  8075a1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8075a5:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  8075a8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8075ac:	8b 10                	mov    edx,DWORD PTR [rax]
  8075ae:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8075b1:	49 89 f0             	mov    r8,rsi
  8075b4:	be 02 00 00 00       	mov    esi,0x2
  8075b9:	89 c7                	mov    edi,eax
  8075bb:	e8 97 f4 ff ff       	call   806a57 <request>
        break;
  8075c0:	eb 07                	jmp    8075c9 <hd_do_req+0xec>
    default:return -1;
  8075c2:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8075c7:	eb 1e                	jmp    8075e7 <hd_do_req+0x10a>
    }
    args->stat=REQ_STAT_WORKING;
  8075c9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8075cd:	c7 80 ac 00 00 00 02 	mov    DWORD PTR [rax+0xac],0x2
  8075d4:	00 00 00 
    running_devman_req=args;
  8075d7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8075db:	48 89 05 e6 2e c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22ee6],rax        # 42a4c8 <running_devman_req>
    return 0;
  8075e2:	b8 00 00 00 00       	mov    eax,0x0
  8075e7:	c9                   	leave  
  8075e8:	c3                   	ret    
  8075e9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000000008075f0 <disk_int_handler>:
  8075f0:	e8 49 d8 ff ff       	call   804e3e <eoi>
  8075f5:	e8 6e f2 ff ff       	call   806868 <disk_int_handler_c>
  8075fa:	48 cf                	iretq  

00000000008075fc <read_disk_asm>:
  8075fc:	55                   	push   rbp
  8075fd:	89 e5                	mov    ebp,esp
  8075ff:	66 ba f7 01          	mov    dx,0x1f7
  807603:	31 c9                	xor    ecx,ecx
  807605:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  80760a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  80760f:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  807614:	89 c6                	mov    esi,eax
  807616:	66 ba f2 01          	mov    dx,0x1f2
  80761a:	88 c8                	mov    al,cl
  80761c:	ee                   	out    dx,al
  80761d:	66 ba f3 01          	mov    dx,0x1f3
  807621:	89 f0                	mov    eax,esi
  807623:	ee                   	out    dx,al
  807624:	66 ff c2             	inc    dx
  807627:	c1 e8 08             	shr    eax,0x8
  80762a:	ee                   	out    dx,al
  80762b:	66 ff c2             	inc    dx
  80762e:	c1 e8 08             	shr    eax,0x8
  807631:	ee                   	out    dx,al
  807632:	66 ff c2             	inc    dx
  807635:	66 c1 e8 08          	shr    ax,0x8
  807639:	24 0f                	and    al,0xf
  80763b:	0c e0                	or     al,0xe0
  80763d:	ee                   	out    dx,al
  80763e:	66 ff c2             	inc    dx
  807641:	b0 20                	mov    al,0x20
  807643:	ee                   	out    dx,al

0000000000807644 <read_disk_asm.wait>:
  807644:	90                   	nop
  807645:	ec                   	in     al,dx
  807646:	24 88                	and    al,0x88
  807648:	3c 08                	cmp    al,0x8
  80764a:	75 f8                	jne    807644 <read_disk_asm.wait>
  80764c:	66 89 d7             	mov    di,dx
  80764f:	89 c8                	mov    eax,ecx
  807651:	66 b9 00 01          	mov    cx,0x100
  807655:	66 f7 e1             	mul    cx
  807658:	89 c1                	mov    ecx,eax
  80765a:	66 ba f0 01          	mov    dx,0x1f0

000000000080765e <read_disk_asm.read>:
  80765e:	66 ed                	in     ax,dx
  807660:	66 67 89 03          	mov    WORD PTR [ebx],ax
  807664:	83 c3 02             	add    ebx,0x2
  807667:	e2 f5                	loop   80765e <read_disk_asm.read>
  807669:	c9                   	leave  
  80766a:	b8 00 00 00 00       	mov    eax,0x0
  80766f:	c3                   	ret    

0000000000807670 <read_disk_asm.err_disk_reading>:
  807670:	66 ba f1 01          	mov    dx,0x1f1
  807674:	31 c0                	xor    eax,eax
  807676:	66 ed                	in     ax,dx
  807678:	89 ec                	mov    esp,ebp
  80767a:	5d                   	pop    rbp
  80767b:	c3                   	ret    

000000000080767c <write_disk_asm>:
  80767c:	55                   	push   rbp
  80767d:	89 e5                	mov    ebp,esp
  80767f:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  807684:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  807689:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  80768e:	50                   	push   rax
  80768f:	66 ba f2 01          	mov    dx,0x1f2
  807693:	88 c8                	mov    al,cl
  807695:	ee                   	out    dx,al
  807696:	58                   	pop    rax
  807697:	66 ba f3 01          	mov    dx,0x1f3
  80769b:	ee                   	out    dx,al
  80769c:	c1 e8 08             	shr    eax,0x8
  80769f:	66 ba f4 01          	mov    dx,0x1f4
  8076a3:	ee                   	out    dx,al
  8076a4:	c1 e8 08             	shr    eax,0x8
  8076a7:	66 ba f5 01          	mov    dx,0x1f5
  8076ab:	ee                   	out    dx,al
  8076ac:	c1 e8 08             	shr    eax,0x8
  8076af:	24 0f                	and    al,0xf
  8076b1:	0c e0                	or     al,0xe0
  8076b3:	66 ba f6 01          	mov    dx,0x1f6
  8076b7:	ee                   	out    dx,al
  8076b8:	66 ba f7 01          	mov    dx,0x1f7
  8076bc:	b0 30                	mov    al,0x30
  8076be:	ee                   	out    dx,al

00000000008076bf <write_disk_asm.not_ready2>:
  8076bf:	90                   	nop
  8076c0:	ec                   	in     al,dx
  8076c1:	24 88                	and    al,0x88
  8076c3:	3c 08                	cmp    al,0x8
  8076c5:	75 f8                	jne    8076bf <write_disk_asm.not_ready2>
  8076c7:	89 c8                	mov    eax,ecx
  8076c9:	66 b9 00 01          	mov    cx,0x100
  8076cd:	66 f7 e1             	mul    cx
  8076d0:	89 c1                	mov    ecx,eax
  8076d2:	66 ba f0 01          	mov    dx,0x1f0

00000000008076d6 <write_disk_asm.go_on_write>:
  8076d6:	66 67 8b 03          	mov    ax,WORD PTR [ebx]
  8076da:	66 ef                	out    dx,ax
  8076dc:	83 c3 02             	add    ebx,0x2
  8076df:	e2 f5                	loop   8076d6 <write_disk_asm.go_on_write>
  8076e1:	89 ec                	mov    esp,ebp
  8076e3:	5d                   	pop    rbp
  8076e4:	c3                   	ret    

00000000008076e5 <DISK1_FAT32_read_FAT_Entry>:
#include "mem.h"
#include "memory.h"
#include "proc.h"

unsigned int DISK1_FAT32_read_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry)
{
  8076e5:	f3 0f 1e fa          	endbr64 
  8076e9:	55                   	push   rbp
  8076ea:	48 89 e5             	mov    rbp,rsp
  8076ed:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  8076f4:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  8076fb:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
	unsigned int buf[128];
	memset(buf,0,512);
  807701:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  807708:	ba 00 02 00 00       	mov    edx,0x200
  80770d:	be 00 00 00 00       	mov    esi,0x0
  807712:	48 89 c7             	mov    rdi,rax
  807715:	e8 66 2e 00 00       	call   80a580 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  80771a:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  807721:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807725:	89 c2                	mov    edx,eax
  807727:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80772d:	c1 e8 07             	shr    eax,0x7
  807730:	01 d0                	add    eax,edx
  807732:	89 c2                	mov    edx,eax
  807734:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80773b:	49 89 c0             	mov    r8,rax
  80773e:	b9 01 00 00 00       	mov    ecx,0x1
  807743:	be 00 00 00 00       	mov    esi,0x0
  807748:	bf 00 00 00 00       	mov    edi,0x0
  80774d:	e8 05 f3 ff ff       	call   806a57 <request>
  807752:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    chk_result(r);
  807755:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807758:	89 c7                	mov    edi,eax
  80775a:	e8 ac f9 ff ff       	call   80710b <chk_result>
    printf("DISK1_FAT32_read_FAT_Entry fat_entry:%#018lx,%#010x\n",fat_entry,buf[fat_entry & 0x7f]);
  80775f:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  807765:	83 e0 7f             	and    eax,0x7f
  807768:	89 c0                	mov    eax,eax
  80776a:	8b 94 85 f0 fd ff ff 	mov    edx,DWORD PTR [rbp+rax*4-0x210]
  807771:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  807777:	89 c6                	mov    esi,eax
  807779:	bf 78 2e 81 00       	mov    edi,0x812e78
  80777e:	b8 00 00 00 00       	mov    eax,0x0
  807783:	e8 84 95 ff ff       	call   800d0c <printf>
	return buf[fat_entry & 0x7f] & 0x0fffffff;
  807788:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80778e:	83 e0 7f             	and    eax,0x7f
  807791:	89 c0                	mov    eax,eax
  807793:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  80779a:	25 ff ff ff 0f       	and    eax,0xfffffff
}
  80779f:	c9                   	leave  
  8077a0:	c3                   	ret    

00000000008077a1 <DISK1_FAT32_write_FAT_Entry>:


unsigned long DISK1_FAT32_write_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry,unsigned int value)
{
  8077a1:	f3 0f 1e fa          	endbr64 
  8077a5:	55                   	push   rbp
  8077a6:	48 89 e5             	mov    rbp,rsp
  8077a9:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  8077b0:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  8077b7:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
  8077bd:	89 95 e0 fd ff ff    	mov    DWORD PTR [rbp-0x220],edx
	unsigned int buf[128];
	int i;

	memset(buf,0,512);
  8077c3:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  8077ca:	ba 00 02 00 00       	mov    edx,0x200
  8077cf:	be 00 00 00 00       	mov    esi,0x0
  8077d4:	48 89 c7             	mov    rdi,rax
  8077d7:	e8 a4 2d 00 00       	call   80a580 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  8077dc:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  8077e3:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8077e7:	89 c2                	mov    edx,eax
  8077e9:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  8077ef:	c1 e8 07             	shr    eax,0x7
  8077f2:	01 d0                	add    eax,edx
  8077f4:	89 c2                	mov    edx,eax
  8077f6:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  8077fd:	49 89 c0             	mov    r8,rax
  807800:	b9 01 00 00 00       	mov    ecx,0x1
  807805:	be 00 00 00 00       	mov    esi,0x0
  80780a:	bf 00 00 00 00       	mov    edi,0x0
  80780f:	e8 43 f2 ff ff       	call   806a57 <request>
  807814:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    chk_result(r);
  807817:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80781a:	89 c7                	mov    edi,eax
  80781c:	e8 ea f8 ff ff       	call   80710b <chk_result>
    buf[fat_entry & 0x7f] = (buf[fat_entry & 0x7f] & 0xf0000000) | (value & 0x0fffffff);
  807821:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  807827:	83 e0 7f             	and    eax,0x7f
  80782a:	89 c0                	mov    eax,eax
  80782c:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  807833:	25 00 00 00 f0       	and    eax,0xf0000000
  807838:	89 c6                	mov    esi,eax
  80783a:	8b 85 e0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x220]
  807840:	25 ff ff ff 0f       	and    eax,0xfffffff
  807845:	89 c1                	mov    ecx,eax
  807847:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80784d:	83 e0 7f             	and    eax,0x7f
  807850:	89 c2                	mov    edx,eax
  807852:	89 f0                	mov    eax,esi
  807854:	09 c8                	or     eax,ecx
  807856:	89 d2                	mov    edx,edx
  807858:	89 84 95 f0 fd ff ff 	mov    DWORD PTR [rbp+rdx*4-0x210],eax

	for(i = 0;i < fsbi->NumFATs;i++){
  80785f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  807866:	eb 61                	jmp    8078c9 <DISK1_FAT32_write_FAT_Entry+0x128>
        int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,fsbi->FAT1_firstsector + fsbi->sector_per_FAT * i + (fat_entry >> 7),1,(unsigned char *)buf);
  807868:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  80786f:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807873:	89 c1                	mov    ecx,eax
  807875:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  80787c:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  807880:	89 c2                	mov    edx,eax
  807882:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807885:	48 98                	cdqe   
  807887:	0f af c2             	imul   eax,edx
  80788a:	8d 14 01             	lea    edx,[rcx+rax*1]
  80788d:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  807893:	c1 e8 07             	shr    eax,0x7
  807896:	01 d0                	add    eax,edx
  807898:	89 c2                	mov    edx,eax
  80789a:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  8078a1:	49 89 c0             	mov    r8,rax
  8078a4:	b9 01 00 00 00       	mov    ecx,0x1
  8078a9:	be 01 00 00 00       	mov    esi,0x1
  8078ae:	bf 00 00 00 00       	mov    edi,0x0
  8078b3:	e8 9f f1 ff ff       	call   806a57 <request>
  8078b8:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        chk_result(r1);
  8078bb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8078be:	89 c7                	mov    edi,eax
  8078c0:	e8 46 f8 ff ff       	call   80710b <chk_result>
	for(i = 0;i < fsbi->NumFATs;i++){
  8078c5:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8078c9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8078cc:	48 63 d0             	movsxd rdx,eax
  8078cf:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  8078d6:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8078da:	48 39 c2             	cmp    rdx,rax
  8078dd:	72 89                	jb     807868 <DISK1_FAT32_write_FAT_Entry+0xc7>
    }
	return 1;
  8078df:	b8 01 00 00 00       	mov    eax,0x1
}
  8078e4:	c9                   	leave  
  8078e5:	c3                   	ret    

00000000008078e6 <FAT32_open>:


long FAT32_open(struct index_node * inode,struct file * filp)
{
  8078e6:	f3 0f 1e fa          	endbr64 
  8078ea:	55                   	push   rbp
  8078eb:	48 89 e5             	mov    rbp,rsp
  8078ee:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8078f2:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  8078f6:	b8 01 00 00 00       	mov    eax,0x1
}
  8078fb:	5d                   	pop    rbp
  8078fc:	c3                   	ret    

00000000008078fd <FAT32_close>:


long FAT32_close(struct index_node * inode,struct file * filp)
{
  8078fd:	f3 0f 1e fa          	endbr64 
  807901:	55                   	push   rbp
  807902:	48 89 e5             	mov    rbp,rsp
  807905:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  807909:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  80790d:	b8 01 00 00 00       	mov    eax,0x1
}
  807912:	5d                   	pop    rbp
  807913:	c3                   	ret    

0000000000807914 <FAT32_read>:


long FAT32_read(struct file * filp,char * buf,unsigned long count,long * position)
{
  807914:	f3 0f 1e fa          	endbr64 
  807918:	55                   	push   rbp
  807919:	48 89 e5             	mov    rbp,rsp
  80791c:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  807920:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  807924:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  807928:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
  80792c:	48 89 4d 80          	mov    QWORD PTR [rbp-0x80],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  807930:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807934:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807938:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80793c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807940:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  807944:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807948:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80794c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807950:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807954:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807958:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

	unsigned long cluster = finode->first_cluster;
  80795c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807960:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807963:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long sector = 0;
  807967:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  80796e:	00 
	int i,length = 0;
  80796f:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
	long retval = 0;
  807976:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80797d:	00 
	int index = *position / fsbi->bytes_per_cluster;
  80797e:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807982:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807985:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  807989:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  80798d:	48 99                	cqo    
  80798f:	48 f7 fe             	idiv   rsi
  807992:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  807995:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807999:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80799c:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  8079a0:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  8079a4:	48 99                	cqo    
  8079a6:	48 f7 f9             	idiv   rcx
  8079a9:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  8079ad:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8079b1:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8079b5:	be 00 00 00 00       	mov    esi,0x0
  8079ba:	48 89 c7             	mov    rdi,rax
  8079bd:	b8 00 00 00 00       	mov    eax,0x0
  8079c2:	e8 5d 97 ff ff       	call   801124 <vmalloc>
  8079c7:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax

	if(!cluster)
  8079cb:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8079d0:	75 0c                	jne    8079de <FAT32_read+0xca>
		return -EFAULT;
  8079d2:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  8079d9:	e9 f0 01 00 00       	jmp    807bce <FAT32_read+0x2ba>
	for(i = 0;i < index;i++)
  8079de:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8079e5:	eb 1e                	jmp    807a05 <FAT32_read+0xf1>
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  8079e7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8079eb:	89 c2                	mov    edx,eax
  8079ed:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8079f1:	89 d6                	mov    esi,edx
  8079f3:	48 89 c7             	mov    rdi,rax
  8079f6:	e8 ea fc ff ff       	call   8076e5 <DISK1_FAT32_read_FAT_Entry>
  8079fb:	89 c0                	mov    eax,eax
  8079fd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	for(i = 0;i < index;i++)
  807a01:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  807a05:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807a08:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  807a0b:	7c da                	jl     8079e7 <FAT32_read+0xd3>

	if(*position + count > filp->dentry->dir_inode->file_size)
  807a0d:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807a11:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807a14:	48 89 c2             	mov    rdx,rax
  807a17:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807a1b:	48 01 c2             	add    rdx,rax
  807a1e:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807a22:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807a26:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807a2a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807a2d:	48 39 c2             	cmp    rdx,rax
  807a30:	76 2c                	jbe    807a5e <FAT32_read+0x14a>
		index = count = filp->dentry->dir_inode->file_size - *position;
  807a32:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807a36:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807a3a:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807a3e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  807a41:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807a45:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807a48:	48 89 c1             	mov    rcx,rax
  807a4b:	48 89 d0             	mov    rax,rdx
  807a4e:	48 29 c8             	sub    rax,rcx
  807a51:	48 89 45 88          	mov    QWORD PTR [rbp-0x78],rax
  807a55:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807a59:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
  807a5c:	eb 07                	jmp    807a65 <FAT32_read+0x151>
	else
		index = count;
  807a5e:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807a62:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax

//	printf("FAT32_read first_cluster:%d,size:%d,preempt_count:%d\n",finode->first_cluster,filp->dentry->dir_inode->file_size,current->preempt_count);

	do
	{
		memset(buffer,0,fsbi->bytes_per_cluster);
  807a65:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807a69:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807a6d:	89 c2                	mov    edx,eax
  807a6f:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807a73:	be 00 00 00 00       	mov    esi,0x0
  807a78:	48 89 c7             	mov    rdi,rax
  807a7b:	e8 00 2b 00 00       	call   80a580 <memset>
		sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  807a80:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807a84:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  807a88:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807a8c:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  807a90:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807a94:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807a98:	48 0f af c2          	imul   rax,rdx
  807a9c:	48 01 c8             	add    rax,rcx
  807a9f:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  807aa3:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807aa7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807aab:	89 c1                	mov    ecx,eax
  807aad:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807ab1:	89 c2                	mov    edx,eax
  807ab3:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807ab7:	49 89 c0             	mov    r8,rax
  807aba:	be 00 00 00 00       	mov    esi,0x0
  807abf:	bf 00 00 00 00       	mov    edi,0x0
  807ac4:	e8 8e ef ff ff       	call   806a57 <request>
  807ac9:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
		if(!chk_result(r))
  807acc:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807acf:	89 c7                	mov    edi,eax
  807ad1:	e8 35 f6 ff ff       	call   80710b <chk_result>
  807ad6:	85 c0                	test   eax,eax
  807ad8:	75 1c                	jne    807af6 <FAT32_read+0x1e2>
		{
			printf("FAT32 FS(read) read disk ERROR!!!!!!!!!!\n");
  807ada:	bf b0 2e 81 00       	mov    edi,0x812eb0
  807adf:	b8 00 00 00 00       	mov    eax,0x0
  807ae4:	e8 23 92 ff ff       	call   800d0c <printf>
			retval = -EIO;
  807ae9:	48 c7 45 e8 e3 ff ff 	mov    QWORD PTR [rbp-0x18],0xffffffffffffffe3
  807af0:	ff 
			break;
  807af1:	e9 ba 00 00 00       	jmp    807bb0 <FAT32_read+0x29c>
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  807af6:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  807af9:	48 63 d0             	movsxd rdx,eax
  807afc:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807b00:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807b04:	48 2b 45 d8          	sub    rax,QWORD PTR [rbp-0x28]
  807b08:	48 39 c2             	cmp    rdx,rax
  807b0b:	48 0f 4e c2          	cmovle rax,rdx
  807b0f:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax

		if((unsigned long)buf < MAX_TASKS)
  807b12:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  807b16:	48 83 f8 1f          	cmp    rax,0x1f
  807b1a:	77 1f                	ja     807b3b <FAT32_read+0x227>
			memcpy(buffer + offset,buf,length);
  807b1c:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  807b1f:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  807b23:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807b27:	48 01 c1             	add    rcx,rax
  807b2a:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  807b2e:	48 89 c6             	mov    rsi,rax
  807b31:	48 89 cf             	mov    rdi,rcx
  807b34:	e8 98 29 00 00       	call   80a4d1 <memcpy>
  807b39:	eb 1d                	jmp    807b58 <FAT32_read+0x244>
		else
			memcpy(buffer + offset,buf,length);
  807b3b:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  807b3e:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  807b42:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807b46:	48 01 c1             	add    rcx,rax
  807b49:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  807b4d:	48 89 c6             	mov    rsi,rax
  807b50:	48 89 cf             	mov    rdi,rcx
  807b53:	e8 79 29 00 00       	call   80a4d1 <memcpy>

		index -= length;
  807b58:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  807b5b:	29 45 e4             	sub    DWORD PTR [rbp-0x1c],eax
		buf += length;
  807b5e:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  807b61:	48 98                	cdqe   
  807b63:	48 01 45 90          	add    QWORD PTR [rbp-0x70],rax
		offset -= offset;
  807b67:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  807b6e:	00 
		*position += length;
  807b6f:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807b73:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  807b76:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  807b79:	48 98                	cdqe   
  807b7b:	48 01 c2             	add    rdx,rax
  807b7e:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807b82:	48 89 10             	mov    QWORD PTR [rax],rdx
	}while(index && (cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster)));
  807b85:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  807b89:	74 25                	je     807bb0 <FAT32_read+0x29c>
  807b8b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807b8f:	89 c2                	mov    edx,eax
  807b91:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807b95:	89 d6                	mov    esi,edx
  807b97:	48 89 c7             	mov    rdi,rax
  807b9a:	e8 46 fb ff ff       	call   8076e5 <DISK1_FAT32_read_FAT_Entry>
  807b9f:	89 c0                	mov    eax,eax
  807ba1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  807ba5:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  807baa:	0f 85 b5 fe ff ff    	jne    807a65 <FAT32_read+0x151>

	vmfree(buffer);
  807bb0:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807bb4:	48 89 c7             	mov    rdi,rax
  807bb7:	e8 f7 95 ff ff       	call   8011b3 <vmfree>
	if(!index)
  807bbc:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  807bc0:	75 08                	jne    807bca <FAT32_read+0x2b6>
		retval = count;
  807bc2:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807bc6:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	return retval;
  807bca:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
}
  807bce:	c9                   	leave  
  807bcf:	c3                   	ret    

0000000000807bd0 <FAT32_find_available_cluster>:


unsigned long FAT32_find_available_cluster(struct FAT32_sb_info * fsbi)
{
  807bd0:	f3 0f 1e fa          	endbr64 
  807bd4:	55                   	push   rbp
  807bd5:	48 89 e5             	mov    rbp,rsp
  807bd8:	48 81 ec 30 02 00 00 	sub    rsp,0x230
  807bdf:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
	int i,j;
	int fat_entry;
	unsigned long sector_per_fat = fsbi->sector_per_FAT;
  807be6:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  807bed:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  807bf1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	unsigned int buf[128];

//	fsbi->fat_fsinfo->FSI_Free_Count & fsbi->fat_fsinfo->FSI_Nxt_Free not exactly,so unuse

	for(i = 0;i < sector_per_fat;i++)
  807bf5:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  807bfc:	e9 8b 00 00 00       	jmp    807c8c <FAT32_find_available_cluster+0xbc>
	{
		memset(buf,0,512);
  807c01:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  807c08:	ba 00 02 00 00       	mov    edx,0x200
  807c0d:	be 00 00 00 00       	mov    esi,0x0
  807c12:	48 89 c7             	mov    rdi,rax
  807c15:	e8 66 29 00 00       	call   80a580 <memset>
		int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + i,1,(unsigned char *)buf);
  807c1a:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  807c21:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807c25:	89 c2                	mov    edx,eax
  807c27:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807c2a:	01 d0                	add    eax,edx
  807c2c:	89 c2                	mov    edx,eax
  807c2e:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  807c35:	49 89 c0             	mov    r8,rax
  807c38:	b9 01 00 00 00       	mov    ecx,0x1
  807c3d:	be 00 00 00 00       	mov    esi,0x0
  807c42:	bf 00 00 00 00       	mov    edi,0x0
  807c47:	e8 0b ee ff ff       	call   806a57 <request>
  807c4c:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

		for(j = 0;j < 128;j++)
  807c4f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807c56:	eb 2a                	jmp    807c82 <FAT32_find_available_cluster+0xb2>
		{
			if((buf[j] & 0x0fffffff) == 0)
  807c58:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807c5b:	48 98                	cdqe   
  807c5d:	8b 84 85 e0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x220]
  807c64:	25 ff ff ff 0f       	and    eax,0xfffffff
  807c69:	85 c0                	test   eax,eax
  807c6b:	75 11                	jne    807c7e <FAT32_find_available_cluster+0xae>
				return (i << 7) + j;
  807c6d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807c70:	c1 e0 07             	shl    eax,0x7
  807c73:	89 c2                	mov    edx,eax
  807c75:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807c78:	01 d0                	add    eax,edx
  807c7a:	48 98                	cdqe   
  807c7c:	eb 22                	jmp    807ca0 <FAT32_find_available_cluster+0xd0>
		for(j = 0;j < 128;j++)
  807c7e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807c82:	83 7d f8 7f          	cmp    DWORD PTR [rbp-0x8],0x7f
  807c86:	7e d0                	jle    807c58 <FAT32_find_available_cluster+0x88>
	for(i = 0;i < sector_per_fat;i++)
  807c88:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807c8c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807c8f:	48 98                	cdqe   
  807c91:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  807c95:	0f 87 66 ff ff ff    	ja     807c01 <FAT32_find_available_cluster+0x31>
		}
	}
	return 0;
  807c9b:	b8 00 00 00 00       	mov    eax,0x0
}
  807ca0:	c9                   	leave  
  807ca1:	c3                   	ret    

0000000000807ca2 <FAT32_write>:


long FAT32_write(struct file * filp,char * buf,unsigned long count,long * position)
{
  807ca2:	f3 0f 1e fa          	endbr64 
  807ca6:	55                   	push   rbp
  807ca7:	48 89 e5             	mov    rbp,rsp
  807caa:	48 81 ec 90 00 00 00 	sub    rsp,0x90
  807cb1:	48 89 7d 88          	mov    QWORD PTR [rbp-0x78],rdi
  807cb5:	48 89 75 80          	mov    QWORD PTR [rbp-0x80],rsi
  807cb9:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  807cc0:	48 89 8d 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  807cc7:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807ccb:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807ccf:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807cd3:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807cd7:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  807cdb:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807cdf:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807ce3:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807ce7:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807ceb:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807cef:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned long cluster = finode->first_cluster;
  807cf3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807cf7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807cfa:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long next_cluster = 0;
  807cfe:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  807d05:	00 
	unsigned long sector = 0;
  807d06:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  807d0d:	00 
	int i,length = 0;
  807d0e:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
	long retval = 0;
  807d15:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  807d1c:	00 
	long flags = 0;
  807d1d:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  807d24:	00 
	int index = *position / fsbi->bytes_per_cluster;
  807d25:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  807d2c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807d2f:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  807d33:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  807d37:	48 99                	cqo    
  807d39:	48 f7 fe             	idiv   rsi
  807d3c:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  807d3f:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  807d46:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807d49:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  807d4d:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  807d51:	48 99                	cqo    
  807d53:	48 f7 f9             	idiv   rcx
  807d56:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  807d5a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807d5e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807d62:	be 00 00 00 00       	mov    esi,0x0
  807d67:	48 89 c7             	mov    rdi,rax
  807d6a:	b8 00 00 00 00       	mov    eax,0x0
  807d6f:	e8 b0 93 ff ff       	call   801124 <vmalloc>
  807d74:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax

	if(!cluster)
  807d78:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  807d7d:	75 1a                	jne    807d99 <FAT32_write+0xf7>
	{
		cluster = FAT32_find_available_cluster(fsbi);
  807d7f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807d83:	48 89 c7             	mov    rdi,rax
  807d86:	e8 45 fe ff ff       	call   807bd0 <FAT32_find_available_cluster>
  807d8b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		flags = 1;
  807d8f:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  807d96:	00 
  807d97:	eb 2f                	jmp    807dc8 <FAT32_write+0x126>
	}
	else
		for(i = 0;i < index;i++)
  807d99:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  807da0:	eb 1e                	jmp    807dc0 <FAT32_write+0x11e>
			cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  807da2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807da6:	89 c2                	mov    edx,eax
  807da8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807dac:	89 d6                	mov    esi,edx
  807dae:	48 89 c7             	mov    rdi,rax
  807db1:	e8 2f f9 ff ff       	call   8076e5 <DISK1_FAT32_read_FAT_Entry>
  807db6:	89 c0                	mov    eax,eax
  807db8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		for(i = 0;i < index;i++)
  807dbc:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  807dc0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807dc3:	3b 45 d4             	cmp    eax,DWORD PTR [rbp-0x2c]
  807dc6:	7c da                	jl     807da2 <FAT32_write+0x100>

	if(!cluster)
  807dc8:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  807dcd:	75 18                	jne    807de7 <FAT32_write+0x145>
	{
		vmfree(buffer);
  807dcf:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  807dd3:	48 89 c7             	mov    rdi,rax
  807dd6:	e8 d8 93 ff ff       	call   8011b3 <vmfree>
		return -ENOSPC;
  807ddb:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  807de2:	e9 13 03 00 00       	jmp    8080fa <FAT32_write+0x458>
	}

	if(flags)
  807de7:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  807dec:	74 4d                	je     807e3b <FAT32_write+0x199>
	{
		finode->first_cluster = cluster;
  807dee:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807df2:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  807df6:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  807df9:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807dfd:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807e01:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807e05:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807e09:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  807e0d:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  807e11:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807e15:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807e19:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807e1d:	48 89 c7             	mov    rdi,rax
  807e20:	ff d2                	call   rdx
		DISK1_FAT32_write_FAT_Entry(fsbi,cluster,0x0ffffff8);
  807e22:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807e26:	89 c1                	mov    ecx,eax
  807e28:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807e2c:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  807e31:	89 ce                	mov    esi,ecx
  807e33:	48 89 c7             	mov    rdi,rax
  807e36:	e8 66 f9 ff ff       	call   8077a1 <DISK1_FAT32_write_FAT_Entry>
	}

	index = count;
  807e3b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  807e42:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax

	do
	{
		if(!flags)
  807e45:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  807e4a:	0f 85 91 00 00 00    	jne    807ee1 <FAT32_write+0x23f>
		{
			memset(buffer,0,fsbi->bytes_per_cluster);
  807e50:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807e54:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807e58:	89 c2                	mov    edx,eax
  807e5a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  807e5e:	be 00 00 00 00       	mov    esi,0x0
  807e63:	48 89 c7             	mov    rdi,rax
  807e66:	e8 15 27 00 00       	call   80a580 <memset>
			sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  807e6b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807e6f:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  807e73:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807e77:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  807e7b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807e7f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807e83:	48 0f af c2          	imul   rax,rdx
  807e87:	48 01 c8             	add    rax,rcx
  807e8a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  807e8e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807e92:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807e96:	89 c1                	mov    ecx,eax
  807e98:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807e9c:	89 c2                	mov    edx,eax
  807e9e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  807ea2:	49 89 c0             	mov    r8,rax
  807ea5:	be 00 00 00 00       	mov    esi,0x0
  807eaa:	bf 00 00 00 00       	mov    edi,0x0
  807eaf:	e8 a3 eb ff ff       	call   806a57 <request>
  807eb4:	89 45 9c             	mov    DWORD PTR [rbp-0x64],eax

			if(!chk_result(r))
  807eb7:	8b 45 9c             	mov    eax,DWORD PTR [rbp-0x64]
  807eba:	89 c7                	mov    edi,eax
  807ebc:	e8 4a f2 ff ff       	call   80710b <chk_result>
  807ec1:	85 c0                	test   eax,eax
  807ec3:	75 1c                	jne    807ee1 <FAT32_write+0x23f>
			{
				printf("FAT32 FS(write) read disk ERROR!!!!!!!!!!\n");
  807ec5:	bf e0 2e 81 00       	mov    edi,0x812ee0
  807eca:	b8 00 00 00 00       	mov    eax,0x0
  807ecf:	e8 38 8e ff ff       	call   800d0c <printf>
				retval = -EIO;
  807ed4:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  807edb:	ff 
				break;
  807edc:	e9 95 01 00 00       	jmp    808076 <FAT32_write+0x3d4>
			}
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  807ee1:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  807ee4:	48 63 d0             	movsxd rdx,eax
  807ee7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807eeb:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807eef:	48 2b 45 c8          	sub    rax,QWORD PTR [rbp-0x38]
  807ef3:	48 39 c2             	cmp    rdx,rax
  807ef6:	48 0f 4e c2          	cmovle rax,rdx
  807efa:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax

		if((unsigned long)buf < MAX_TASKS)
  807efd:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807f01:	48 83 f8 1f          	cmp    rax,0x1f
  807f05:	77 1f                	ja     807f26 <FAT32_write+0x284>
			memcpy(buf,buffer + offset,length);
  807f07:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  807f0a:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  807f0e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  807f12:	48 01 c1             	add    rcx,rax
  807f15:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807f19:	48 89 ce             	mov    rsi,rcx
  807f1c:	48 89 c7             	mov    rdi,rax
  807f1f:	e8 ad 25 00 00       	call   80a4d1 <memcpy>
  807f24:	eb 1d                	jmp    807f43 <FAT32_write+0x2a1>
		else
			memcpy(buf,buffer + offset,length);
  807f26:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  807f29:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  807f2d:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  807f31:	48 01 c1             	add    rcx,rax
  807f34:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807f38:	48 89 ce             	mov    rsi,rcx
  807f3b:	48 89 c7             	mov    rdi,rax
  807f3e:	e8 8e 25 00 00       	call   80a4d1 <memcpy>

		int r=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  807f43:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807f47:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807f4b:	89 c1                	mov    ecx,eax
  807f4d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807f51:	89 c2                	mov    edx,eax
  807f53:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  807f57:	49 89 c0             	mov    r8,rax
  807f5a:	be 01 00 00 00       	mov    esi,0x1
  807f5f:	bf 00 00 00 00       	mov    edi,0x0
  807f64:	e8 ee ea ff ff       	call   806a57 <request>
  807f69:	89 45 98             	mov    DWORD PTR [rbp-0x68],eax
        if(!chk_result(r))
  807f6c:	8b 45 98             	mov    eax,DWORD PTR [rbp-0x68]
  807f6f:	89 c7                	mov    edi,eax
  807f71:	e8 95 f1 ff ff       	call   80710b <chk_result>
  807f76:	85 c0                	test   eax,eax
  807f78:	75 1c                	jne    807f96 <FAT32_write+0x2f4>
		{
			printf("FAT32 FS(write) write disk ERROR!!!!!!!!!!\n");
  807f7a:	bf 10 2f 81 00       	mov    edi,0x812f10
  807f7f:	b8 00 00 00 00       	mov    eax,0x0
  807f84:	e8 83 8d ff ff       	call   800d0c <printf>
			retval = -EIO;
  807f89:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  807f90:	ff 
			break;
  807f91:	e9 e0 00 00 00       	jmp    808076 <FAT32_write+0x3d4>
		}

		index -= length;
  807f96:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807f99:	29 45 d4             	sub    DWORD PTR [rbp-0x2c],eax
		buf += length;
  807f9c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807f9f:	48 98                	cdqe   
  807fa1:	48 01 45 80          	add    QWORD PTR [rbp-0x80],rax
		offset -= offset;
  807fa5:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  807fac:	00 
		*position += length;
  807fad:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  807fb4:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  807fb7:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807fba:	48 98                	cdqe   
  807fbc:	48 01 c2             	add    rdx,rax
  807fbf:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  807fc6:	48 89 10             	mov    QWORD PTR [rax],rdx

		if(index)
  807fc9:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  807fcd:	0f 84 a2 00 00 00    	je     808075 <FAT32_write+0x3d3>
			next_cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  807fd3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807fd7:	89 c2                	mov    edx,eax
  807fd9:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807fdd:	89 d6                	mov    esi,edx
  807fdf:	48 89 c7             	mov    rdi,rax
  807fe2:	e8 fe f6 ff ff       	call   8076e5 <DISK1_FAT32_read_FAT_Entry>
  807fe7:	89 c0                	mov    eax,eax
  807fe9:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
		else
			break;

		if(next_cluster >= 0x0ffffff8)
  807fed:	48 81 7d b0 f7 ff ff 	cmp    QWORD PTR [rbp-0x50],0xffffff7
  807ff4:	0f 
  807ff5:	76 72                	jbe    808069 <FAT32_write+0x3c7>
		{
			next_cluster = FAT32_find_available_cluster(fsbi);
  807ff7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807ffb:	48 89 c7             	mov    rdi,rax
  807ffe:	e8 cd fb ff ff       	call   807bd0 <FAT32_find_available_cluster>
  808003:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
			if(!next_cluster)
  808007:	48 83 7d b0 00       	cmp    QWORD PTR [rbp-0x50],0x0
  80800c:	75 18                	jne    808026 <FAT32_write+0x384>
			{
				vmfree(buffer);
  80800e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808012:	48 89 c7             	mov    rdi,rax
  808015:	e8 99 91 ff ff       	call   8011b3 <vmfree>
				return -ENOSPC;
  80801a:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  808021:	e9 d4 00 00 00       	jmp    8080fa <FAT32_write+0x458>
			}			
				
			DISK1_FAT32_write_FAT_Entry(fsbi,cluster,next_cluster);
  808026:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80802a:	89 c2                	mov    edx,eax
  80802c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808030:	89 c1                	mov    ecx,eax
  808032:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808036:	89 ce                	mov    esi,ecx
  808038:	48 89 c7             	mov    rdi,rax
  80803b:	e8 61 f7 ff ff       	call   8077a1 <DISK1_FAT32_write_FAT_Entry>
			DISK1_FAT32_write_FAT_Entry(fsbi,next_cluster,0x0ffffff8);
  808040:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808044:	89 c1                	mov    ecx,eax
  808046:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80804a:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  80804f:	89 ce                	mov    esi,ecx
  808051:	48 89 c7             	mov    rdi,rax
  808054:	e8 48 f7 ff ff       	call   8077a1 <DISK1_FAT32_write_FAT_Entry>
			cluster = next_cluster;
  808059:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80805d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			flags = 1;
  808061:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  808068:	00 
		}

	}while(index);
  808069:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  80806d:	0f 85 d2 fd ff ff    	jne    807e45 <FAT32_write+0x1a3>
  808073:	eb 01                	jmp    808076 <FAT32_write+0x3d4>
			break;
  808075:	90                   	nop

	if(*position > filp->dentry->dir_inode->file_size)
  808076:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80807d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808080:	48 89 c2             	mov    rdx,rax
  808083:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808087:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80808b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80808f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808092:	48 39 c2             	cmp    rdx,rax
  808095:	76 42                	jbe    8080d9 <FAT32_write+0x437>
	{
		filp->dentry->dir_inode->file_size = *position;
  808097:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80809e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8080a1:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8080a5:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8080a9:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8080ad:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  8080b0:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8080b4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8080b8:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8080bc:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8080c0:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8080c4:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  8080c8:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8080cc:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8080d0:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8080d4:	48 89 c7             	mov    rdi,rax
  8080d7:	ff d2                	call   rdx
	}

	vmfree(buffer);
  8080d9:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8080dd:	48 89 c7             	mov    rdi,rax
  8080e0:	e8 ce 90 ff ff       	call   8011b3 <vmfree>
	if(!index)
  8080e5:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  8080e9:	75 0b                	jne    8080f6 <FAT32_write+0x454>
		retval = count;
  8080eb:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8080f2:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	return retval;
  8080f6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  8080fa:	c9                   	leave  
  8080fb:	c3                   	ret    

00000000008080fc <FAT32_lseek>:


long FAT32_lseek(struct file * filp,long offset,long origin)
{
  8080fc:	f3 0f 1e fa          	endbr64 
  808100:	55                   	push   rbp
  808101:	48 89 e5             	mov    rbp,rsp
  808104:	48 83 ec 30          	sub    rsp,0x30
  808108:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80810c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  808110:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	struct index_node *inode = filp->dentry->dir_inode;
  808114:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808118:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80811c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808120:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	long pos = 0;
  808124:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80812b:	00 

	switch(origin)
  80812c:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  808131:	74 21                	je     808154 <FAT32_lseek+0x58>
  808133:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  808138:	7f 4a                	jg     808184 <FAT32_lseek+0x88>
  80813a:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80813f:	74 09                	je     80814a <FAT32_lseek+0x4e>
  808141:	48 83 7d d8 01       	cmp    QWORD PTR [rbp-0x28],0x1
  808146:	74 20                	je     808168 <FAT32_lseek+0x6c>
  808148:	eb 3a                	jmp    808184 <FAT32_lseek+0x88>
	{
		case SEEK_SET:
				pos = offset;
  80814a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80814e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  808152:	eb 39                	jmp    80818d <FAT32_lseek+0x91>

		case SEEK_CUR:
				pos =  filp->position + offset;
  808154:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808158:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80815b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80815f:	48 01 d0             	add    rax,rdx
  808162:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  808166:	eb 25                	jmp    80818d <FAT32_lseek+0x91>

		case SEEK_END:
				pos = filp->dentry->dir_inode->file_size + offset;
  808168:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80816c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808170:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808174:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  808177:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80817b:	48 01 d0             	add    rax,rdx
  80817e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  808182:	eb 09                	jmp    80818d <FAT32_lseek+0x91>

		default:
			return -EINVAL;
  808184:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  80818b:	eb 50                	jmp    8081dd <FAT32_lseek+0xe1>
			break;
	}

	if(pos < 0 || pos > filp->dentry->dir_inode->file_size)
  80818d:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  808192:	78 18                	js     8081ac <FAT32_lseek+0xb0>
  808194:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808198:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80819c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8081a0:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8081a3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8081a7:	48 39 c2             	cmp    rdx,rax
  8081aa:	73 09                	jae    8081b5 <FAT32_lseek+0xb9>
		return -EOVERFLOW;
  8081ac:	48 c7 c0 bf ff ff ff 	mov    rax,0xffffffffffffffbf
  8081b3:	eb 28                	jmp    8081dd <FAT32_lseek+0xe1>

	filp->position = pos;
  8081b5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8081b9:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8081bd:	48 89 10             	mov    QWORD PTR [rax],rdx
	printf("FAT32 FS(lseek) alert position:%d\n",filp->position);
  8081c0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8081c4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8081c7:	48 89 c6             	mov    rsi,rax
  8081ca:	bf 40 2f 81 00       	mov    edi,0x812f40
  8081cf:	b8 00 00 00 00       	mov    eax,0x0
  8081d4:	e8 33 8b ff ff       	call   800d0c <printf>

	return pos;
  8081d9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  8081dd:	c9                   	leave  
  8081de:	c3                   	ret    

00000000008081df <FAT32_ioctl>:


long FAT32_ioctl(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg)
{}
  8081df:	f3 0f 1e fa          	endbr64 
  8081e3:	55                   	push   rbp
  8081e4:	48 89 e5             	mov    rbp,rsp
  8081e7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8081eb:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8081ef:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  8081f3:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  8081f7:	90                   	nop
  8081f8:	5d                   	pop    rbp
  8081f9:	c3                   	ret    

00000000008081fa <FAT32_readdir>:

long FAT32_readdir(struct file * filp,void * dirent,filldir_t filler)
{
  8081fa:	f3 0f 1e fa          	endbr64 
  8081fe:	55                   	push   rbp
  8081ff:	48 89 e5             	mov    rbp,rsp
  808202:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  808206:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  80820a:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  80820e:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  808212:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808216:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80821a:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80821e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808222:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  808226:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80822a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80822e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808232:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808236:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80823a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned int cluster = 0;
  80823e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  808245:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  80824c:	00 
	unsigned char * buf =NULL; 
  80824d:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
  808254:	00 
	char *name = NULL;
  808255:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80825c:	00 
	int namelen = 0;
  80825d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
	int i = 0,j = 0,x = 0,y = 0;
  808264:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  80826b:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
  808272:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  808279:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  808280:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  808287:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  808288:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  80828f:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  808290:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808294:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808298:	be 00 00 00 00       	mov    esi,0x0
  80829d:	48 89 c7             	mov    rdi,rax
  8082a0:	b8 00 00 00 00       	mov    eax,0x0
  8082a5:	e8 7a 8e ff ff       	call   801124 <vmalloc>
  8082aa:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax

	cluster = finode->first_cluster;
  8082ae:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8082b2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8082b5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

	j = filp->position/fsbi->bytes_per_cluster;
  8082b8:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8082bc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8082bf:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  8082c3:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  8082c7:	48 99                	cqo    
  8082c9:	48 f7 fe             	idiv   rsi
  8082cc:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	
	for(i = 0;i<j;i++)
  8082cf:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  8082d6:	eb 3a                	jmp    808312 <FAT32_readdir+0x118>
	{
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  8082d8:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8082db:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8082df:	89 d6                	mov    esi,edx
  8082e1:	48 89 c7             	mov    rdi,rax
  8082e4:	e8 fc f3 ff ff       	call   8076e5 <DISK1_FAT32_read_FAT_Entry>
  8082e9:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
		if(cluster > 0x0ffffff7)
  8082ec:	81 7d fc f7 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff7
  8082f3:	76 19                	jbe    80830e <FAT32_readdir+0x114>
		{
			printf("FAT32 FS(readdir) cluster didn`t exist\n");
  8082f5:	bf 68 2f 81 00       	mov    edi,0x812f68
  8082fa:	b8 00 00 00 00       	mov    eax,0x0
  8082ff:	e8 08 8a ff ff       	call   800d0c <printf>
			return NULL;
  808304:	b8 00 00 00 00       	mov    eax,0x0
  808309:	e9 86 05 00 00       	jmp    808894 <FAT32_readdir+0x69a>
	for(i = 0;i<j;i++)
  80830e:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  808312:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808315:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  808318:	7c be                	jl     8082d8 <FAT32_readdir+0xde>
		}
	}

next_cluster:
  80831a:	90                   	nop
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  80831b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80831f:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  808323:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808326:	83 e8 02             	sub    eax,0x2
  808329:	89 c1                	mov    ecx,eax
  80832b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80832f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808333:	48 0f af c1          	imul   rax,rcx
  808337:	48 01 d0             	add    rax,rdx
  80833a:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80833e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808342:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808346:	89 c1                	mov    ecx,eax
  808348:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80834c:	89 c2                	mov    edx,eax
  80834e:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808352:	49 89 c0             	mov    r8,rax
  808355:	be 00 00 00 00       	mov    esi,0x0
  80835a:	bf 00 00 00 00       	mov    edi,0x0
  80835f:	e8 f3 e6 ff ff       	call   806a57 <request>
  808364:	89 45 a4             	mov    DWORD PTR [rbp-0x5c],eax
    if(!chk_result(r))
  808367:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  80836a:	89 c7                	mov    edi,eax
  80836c:	e8 9a ed ff ff       	call   80710b <chk_result>
  808371:	85 c0                	test   eax,eax
  808373:	75 25                	jne    80839a <FAT32_readdir+0x1a0>
	{
		printf("FAT32 FS(readdir) read disk ERROR!!!!!!!!!!\n");
  808375:	bf 90 2f 81 00       	mov    edi,0x812f90
  80837a:	b8 00 00 00 00       	mov    eax,0x0
  80837f:	e8 88 89 ff ff       	call   800d0c <printf>
		vmfree(buf);
  808384:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808388:	48 89 c7             	mov    rdi,rax
  80838b:	e8 23 8e ff ff       	call   8011b3 <vmfree>
		return NULL;
  808390:	b8 00 00 00 00       	mov    eax,0x0
  808395:	e9 fa 04 00 00       	jmp    808894 <FAT32_readdir+0x69a>
	}

	tmpdentry = (struct FAT32_Directory *)(buf + filp->position%fsbi->bytes_per_cluster);
  80839a:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80839e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8083a1:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  8083a5:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  8083a9:	48 99                	cqo    
  8083ab:	48 f7 f9             	idiv   rcx
  8083ae:	48 89 d0             	mov    rax,rdx
  8083b1:	48 89 c2             	mov    rdx,rax
  8083b4:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8083b8:	48 01 d0             	add    rax,rdx
  8083bb:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  8083bf:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8083c3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8083c6:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  8083ca:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  8083ce:	48 99                	cqo    
  8083d0:	48 f7 f9             	idiv   rcx
  8083d3:	48 89 d0             	mov    rax,rdx
  8083d6:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  8083d9:	e9 2f 04 00 00       	jmp    80880d <FAT32_readdir+0x613>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  8083de:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8083e2:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  8083e6:	3c 0f                	cmp    al,0xf
  8083e8:	0f 84 00 04 00 00    	je     8087ee <FAT32_readdir+0x5f4>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  8083ee:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8083f2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8083f5:	3c e5                	cmp    al,0xe5
  8083f7:	0f 84 f4 03 00 00    	je     8087f1 <FAT32_readdir+0x5f7>
  8083fd:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808401:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808404:	84 c0                	test   al,al
  808406:	0f 84 e5 03 00 00    	je     8087f1 <FAT32_readdir+0x5f7>
  80840c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808410:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808413:	3c 05                	cmp    al,0x5
  808415:	0f 84 d6 03 00 00    	je     8087f1 <FAT32_readdir+0x5f7>
			continue;

		namelen = 0;
  80841b:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  808422:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808426:	48 83 e8 20          	sub    rax,0x20
  80842a:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

		if(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  80842e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808432:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  808436:	3c 0f                	cmp    al,0xf
  808438:	0f 85 2a 02 00 00    	jne    808668 <FAT32_readdir+0x46e>
  80843e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808442:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808445:	3c e5                	cmp    al,0xe5
  808447:	0f 84 1b 02 00 00    	je     808668 <FAT32_readdir+0x46e>
  80844d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808451:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808454:	84 c0                	test   al,al
  808456:	0f 84 0c 02 00 00    	je     808668 <FAT32_readdir+0x46e>
  80845c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808460:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808463:	3c 05                	cmp    al,0x5
  808465:	0f 84 fd 01 00 00    	je     808668 <FAT32_readdir+0x46e>
		{
			j = 0;
  80846b:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
			//long file/dir name read
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  808472:	eb 1a                	jmp    80848e <FAT32_readdir+0x294>
			{
				j++;
  808474:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
				if(tmpldentry->LDIR_Ord & 0x40)
  808478:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80847c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80847f:	0f b6 c0             	movzx  eax,al
  808482:	83 e0 40             	and    eax,0x40
  808485:	85 c0                	test   eax,eax
  808487:	75 34                	jne    8084bd <FAT32_readdir+0x2c3>
					break;
				tmpldentry --;
  808489:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  80848e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808492:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  808496:	3c 0f                	cmp    al,0xf
  808498:	75 24                	jne    8084be <FAT32_readdir+0x2c4>
  80849a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80849e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8084a1:	3c e5                	cmp    al,0xe5
  8084a3:	74 19                	je     8084be <FAT32_readdir+0x2c4>
  8084a5:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8084a9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8084ac:	84 c0                	test   al,al
  8084ae:	74 0e                	je     8084be <FAT32_readdir+0x2c4>
  8084b0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8084b4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8084b7:	3c 05                	cmp    al,0x5
  8084b9:	75 b9                	jne    808474 <FAT32_readdir+0x27a>
  8084bb:	eb 01                	jmp    8084be <FAT32_readdir+0x2c4>
					break;
  8084bd:	90                   	nop
			}

			name = vmalloc(j*13+1,0);
  8084be:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  8084c1:	89 d0                	mov    eax,edx
  8084c3:	01 c0                	add    eax,eax
  8084c5:	01 d0                	add    eax,edx
  8084c7:	c1 e0 02             	shl    eax,0x2
  8084ca:	01 d0                	add    eax,edx
  8084cc:	83 c0 01             	add    eax,0x1
  8084cf:	be 00 00 00 00       	mov    esi,0x0
  8084d4:	89 c7                	mov    edi,eax
  8084d6:	b8 00 00 00 00       	mov    eax,0x0
  8084db:	e8 44 8c ff ff       	call   801124 <vmalloc>
  8084e0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
			memset(name,0,j*13+1);
  8084e4:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  8084e7:	89 d0                	mov    eax,edx
  8084e9:	01 c0                	add    eax,eax
  8084eb:	01 d0                	add    eax,edx
  8084ed:	c1 e0 02             	shl    eax,0x2
  8084f0:	01 d0                	add    eax,edx
  8084f2:	83 c0 01             	add    eax,0x1
  8084f5:	89 c2                	mov    edx,eax
  8084f7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8084fb:	be 00 00 00 00       	mov    esi,0x0
  808500:	48 89 c7             	mov    rdi,rax
  808503:	e8 78 20 00 00       	call   80a580 <memset>
			tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  808508:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80850c:	48 83 e8 20          	sub    rax,0x20
  808510:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

			for(x = 0;x<j;x++,tmpldentry --)
  808514:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  80851b:	e9 37 01 00 00       	jmp    808657 <FAT32_readdir+0x45d>
			{
				for(y = 0;y<5;y++)
  808520:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  808527:	eb 53                	jmp    80857c <FAT32_readdir+0x382>
					if(tmpldentry->LDIR_Name1[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  808529:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80852d:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  808530:	48 63 d2             	movsxd rdx,edx
  808533:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  808538:	66 83 f8 ff          	cmp    ax,0xffff
  80853c:	74 3a                	je     808578 <FAT32_readdir+0x37e>
  80853e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808542:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  808545:	48 63 d2             	movsxd rdx,edx
  808548:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80854d:	66 85 c0             	test   ax,ax
  808550:	74 26                	je     808578 <FAT32_readdir+0x37e>
						name[namelen++] = (char)tmpldentry->LDIR_Name1[y];
  808552:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808556:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  808559:	48 63 d2             	movsxd rdx,edx
  80855c:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  808561:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808564:	8d 50 01             	lea    edx,[rax+0x1]
  808567:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80856a:	48 63 d0             	movsxd rdx,eax
  80856d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808571:	48 01 d0             	add    rax,rdx
  808574:	89 ca                	mov    edx,ecx
  808576:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<5;y++)
  808578:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  80857c:	83 7d dc 04          	cmp    DWORD PTR [rbp-0x24],0x4
  808580:	7e a7                	jle    808529 <FAT32_readdir+0x32f>

				for(y = 0;y<6;y++)
  808582:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  808589:	eb 53                	jmp    8085de <FAT32_readdir+0x3e4>
					if(tmpldentry->LDIR_Name2[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  80858b:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80858f:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  808592:	48 63 d2             	movsxd rdx,edx
  808595:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  80859a:	66 83 f8 ff          	cmp    ax,0xffff
  80859e:	74 3a                	je     8085da <FAT32_readdir+0x3e0>
  8085a0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8085a4:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8085a7:	48 63 d2             	movsxd rdx,edx
  8085aa:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  8085af:	66 85 c0             	test   ax,ax
  8085b2:	74 26                	je     8085da <FAT32_readdir+0x3e0>
						name[namelen++] = (char)tmpldentry->LDIR_Name2[y];
  8085b4:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8085b8:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8085bb:	48 63 d2             	movsxd rdx,edx
  8085be:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  8085c3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8085c6:	8d 50 01             	lea    edx,[rax+0x1]
  8085c9:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  8085cc:	48 63 d0             	movsxd rdx,eax
  8085cf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8085d3:	48 01 d0             	add    rax,rdx
  8085d6:	89 ca                	mov    edx,ecx
  8085d8:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<6;y++)
  8085da:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  8085de:	83 7d dc 05          	cmp    DWORD PTR [rbp-0x24],0x5
  8085e2:	7e a7                	jle    80858b <FAT32_readdir+0x391>

				for(y = 0;y<2;y++)
  8085e4:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  8085eb:	eb 5b                	jmp    808648 <FAT32_readdir+0x44e>
					if(tmpldentry->LDIR_Name3[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  8085ed:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8085f1:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8085f4:	48 63 d2             	movsxd rdx,edx
  8085f7:	48 83 c2 08          	add    rdx,0x8
  8085fb:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  808600:	66 83 f8 ff          	cmp    ax,0xffff
  808604:	74 3e                	je     808644 <FAT32_readdir+0x44a>
  808606:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80860a:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80860d:	48 63 d2             	movsxd rdx,edx
  808610:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  808615:	66 85 c0             	test   ax,ax
  808618:	74 2a                	je     808644 <FAT32_readdir+0x44a>
						name[namelen++] = (char)tmpldentry->LDIR_Name3[y];
  80861a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80861e:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  808621:	48 63 d2             	movsxd rdx,edx
  808624:	48 83 c2 08          	add    rdx,0x8
  808628:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  80862d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808630:	8d 50 01             	lea    edx,[rax+0x1]
  808633:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  808636:	48 63 d0             	movsxd rdx,eax
  808639:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80863d:	48 01 d0             	add    rax,rdx
  808640:	89 ca                	mov    edx,ecx
  808642:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<2;y++)
  808644:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  808648:	83 7d dc 01          	cmp    DWORD PTR [rbp-0x24],0x1
  80864c:	7e 9f                	jle    8085ed <FAT32_readdir+0x3f3>
			for(x = 0;x<j;x++,tmpldentry --)
  80864e:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  808652:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
  808657:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80865a:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80865d:	0f 8c bd fe ff ff    	jl     808520 <FAT32_readdir+0x326>
			}
			goto find_lookup_success;
  808663:	e9 f5 01 00 00       	jmp    80885d <FAT32_readdir+0x663>
		}

		name = vmalloc(15,0);
  808668:	be 00 00 00 00       	mov    esi,0x0
  80866d:	bf 0f 00 00 00       	mov    edi,0xf
  808672:	b8 00 00 00 00       	mov    eax,0x0
  808677:	e8 a8 8a ff ff       	call   801124 <vmalloc>
  80867c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
		memset(name,0,15);
  808680:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808684:	ba 0f 00 00 00       	mov    edx,0xf
  808689:	be 00 00 00 00       	mov    esi,0x0
  80868e:	48 89 c7             	mov    rdi,rax
  808691:	e8 ea 1e 00 00       	call   80a580 <memset>
		//short file/dir base name compare
		for(x=0;x<8;x++)
  808696:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  80869d:	eb 74                	jmp    808713 <FAT32_readdir+0x519>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  80869f:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8086a3:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8086a6:	48 98                	cdqe   
  8086a8:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  8086ac:	3c 20                	cmp    al,0x20
  8086ae:	74 6b                	je     80871b <FAT32_readdir+0x521>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  8086b0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8086b4:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  8086b8:	0f b6 c0             	movzx  eax,al
  8086bb:	83 e0 08             	and    eax,0x8
  8086be:	85 c0                	test   eax,eax
  8086c0:	74 29                	je     8086eb <FAT32_readdir+0x4f1>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  8086c2:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8086c6:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8086c9:	48 98                	cdqe   
  8086cb:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  8086cf:	8d 48 20             	lea    ecx,[rax+0x20]
  8086d2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8086d5:	8d 50 01             	lea    edx,[rax+0x1]
  8086d8:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  8086db:	48 63 d0             	movsxd rdx,eax
  8086de:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8086e2:	48 01 d0             	add    rax,rdx
  8086e5:	89 ca                	mov    edx,ecx
  8086e7:	88 10                	mov    BYTE PTR [rax],dl
  8086e9:	eb 24                	jmp    80870f <FAT32_readdir+0x515>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  8086eb:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8086ef:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8086f2:	48 98                	cdqe   
  8086f4:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  8086f8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8086fb:	8d 50 01             	lea    edx,[rax+0x1]
  8086fe:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  808701:	48 63 d0             	movsxd rdx,eax
  808704:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808708:	48 01 d0             	add    rax,rdx
  80870b:	89 ca                	mov    edx,ecx
  80870d:	88 10                	mov    BYTE PTR [rax],dl
		for(x=0;x<8;x++)
  80870f:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  808713:	83 7d e0 07          	cmp    DWORD PTR [rbp-0x20],0x7
  808717:	7e 86                	jle    80869f <FAT32_readdir+0x4a5>
  808719:	eb 01                	jmp    80871c <FAT32_readdir+0x522>
				break;
  80871b:	90                   	nop
		}

		if(tmpdentry->DIR_Attr & ATTR_DIRECTORY)
  80871c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808720:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  808724:	0f b6 c0             	movzx  eax,al
  808727:	83 e0 10             	and    eax,0x10
  80872a:	85 c0                	test   eax,eax
  80872c:	0f 85 27 01 00 00    	jne    808859 <FAT32_readdir+0x65f>
			goto find_lookup_success;

		name[namelen++] = '.';
  808732:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808735:	8d 50 01             	lea    edx,[rax+0x1]
  808738:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80873b:	48 63 d0             	movsxd rdx,eax
  80873e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808742:	48 01 d0             	add    rax,rdx
  808745:	c6 00 2e             	mov    BYTE PTR [rax],0x2e

		//short file ext name compare
		for(x=8;x<11;x++)
  808748:	c7 45 e0 08 00 00 00 	mov    DWORD PTR [rbp-0x20],0x8
  80874f:	eb 74                	jmp    8087c5 <FAT32_readdir+0x5cb>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  808751:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  808755:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808758:	48 98                	cdqe   
  80875a:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80875e:	3c 20                	cmp    al,0x20
  808760:	74 6b                	je     8087cd <FAT32_readdir+0x5d3>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  808762:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808766:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80876a:	0f b6 c0             	movzx  eax,al
  80876d:	83 e0 10             	and    eax,0x10
  808770:	85 c0                	test   eax,eax
  808772:	74 29                	je     80879d <FAT32_readdir+0x5a3>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  808774:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  808778:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80877b:	48 98                	cdqe   
  80877d:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808781:	8d 48 20             	lea    ecx,[rax+0x20]
  808784:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808787:	8d 50 01             	lea    edx,[rax+0x1]
  80878a:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80878d:	48 63 d0             	movsxd rdx,eax
  808790:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808794:	48 01 d0             	add    rax,rdx
  808797:	89 ca                	mov    edx,ecx
  808799:	88 10                	mov    BYTE PTR [rax],dl
  80879b:	eb 24                	jmp    8087c1 <FAT32_readdir+0x5c7>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  80879d:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8087a1:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8087a4:	48 98                	cdqe   
  8087a6:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  8087aa:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8087ad:	8d 50 01             	lea    edx,[rax+0x1]
  8087b0:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  8087b3:	48 63 d0             	movsxd rdx,eax
  8087b6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8087ba:	48 01 d0             	add    rax,rdx
  8087bd:	89 ca                	mov    edx,ecx
  8087bf:	88 10                	mov    BYTE PTR [rax],dl
		for(x=8;x<11;x++)
  8087c1:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  8087c5:	83 7d e0 0a          	cmp    DWORD PTR [rbp-0x20],0xa
  8087c9:	7e 86                	jle    808751 <FAT32_readdir+0x557>
  8087cb:	eb 01                	jmp    8087ce <FAT32_readdir+0x5d4>
				break;
  8087cd:	90                   	nop
		}
		if(x == 8)
  8087ce:	83 7d e0 08          	cmp    DWORD PTR [rbp-0x20],0x8
  8087d2:	0f 85 84 00 00 00    	jne    80885c <FAT32_readdir+0x662>
			name[--namelen] = 0;
  8087d8:	83 6d ec 01          	sub    DWORD PTR [rbp-0x14],0x1
  8087dc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8087df:	48 63 d0             	movsxd rdx,eax
  8087e2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8087e6:	48 01 d0             	add    rax,rdx
  8087e9:	c6 00 00             	mov    BYTE PTR [rax],0x0
		goto find_lookup_success;
  8087ec:	eb 6e                	jmp    80885c <FAT32_readdir+0x662>
			continue;
  8087ee:	90                   	nop
  8087ef:	eb 01                	jmp    8087f2 <FAT32_readdir+0x5f8>
			continue;
  8087f1:	90                   	nop
	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  8087f2:	83 45 e8 20          	add    DWORD PTR [rbp-0x18],0x20
  8087f6:	48 83 45 d0 20       	add    QWORD PTR [rbp-0x30],0x20
  8087fb:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8087ff:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808802:	48 8d 50 20          	lea    rdx,[rax+0x20]
  808806:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80880a:	48 89 10             	mov    QWORD PTR [rax],rdx
  80880d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808810:	48 63 d0             	movsxd rdx,eax
  808813:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808817:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80881b:	48 39 c2             	cmp    rdx,rax
  80881e:	0f 8c ba fb ff ff    	jl     8083de <FAT32_readdir+0x1e4>
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  808824:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  808827:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80882b:	89 d6                	mov    esi,edx
  80882d:	48 89 c7             	mov    rdi,rax
  808830:	e8 b0 ee ff ff       	call   8076e5 <DISK1_FAT32_read_FAT_Entry>
  808835:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  808838:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  80883f:	77 05                	ja     808846 <FAT32_readdir+0x64c>
		goto next_cluster;
  808841:	e9 d5 fa ff ff       	jmp    80831b <FAT32_readdir+0x121>

	vmfree(buf);
  808846:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80884a:	48 89 c7             	mov    rdi,rax
  80884d:	e8 61 89 ff ff       	call   8011b3 <vmfree>
	return NULL;
  808852:	b8 00 00 00 00       	mov    eax,0x0
  808857:	eb 3b                	jmp    808894 <FAT32_readdir+0x69a>
			goto find_lookup_success;
  808859:	90                   	nop
  80885a:	eb 01                	jmp    80885d <FAT32_readdir+0x663>
		goto find_lookup_success;
  80885c:	90                   	nop

find_lookup_success:

	filp->position += 32;
  80885d:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808861:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808864:	48 8d 50 20          	lea    rdx,[rax+0x20]
  808868:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80886c:	48 89 10             	mov    QWORD PTR [rax],rdx
	return filler(dirent,name,namelen,0,0);
  80886f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808872:	48 63 d0             	movsxd rdx,eax
  808875:	48 8b 75 f0          	mov    rsi,QWORD PTR [rbp-0x10]
  808879:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80887d:	4c 8b 4d 88          	mov    r9,QWORD PTR [rbp-0x78]
  808881:	41 b8 00 00 00 00    	mov    r8d,0x0
  808887:	b9 00 00 00 00       	mov    ecx,0x0
  80888c:	48 89 c7             	mov    rdi,rax
  80888f:	41 ff d1             	call   r9
  808892:	48 98                	cdqe   
}
  808894:	c9                   	leave  
  808895:	c3                   	ret    

0000000000808896 <FAT32_create>:
	.readdir = FAT32_readdir,
};


long FAT32_create(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  808896:	f3 0f 1e fa          	endbr64 
  80889a:	55                   	push   rbp
  80889b:	48 89 e5             	mov    rbp,rsp
  80889e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8088a2:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8088a6:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  8088a9:	90                   	nop
  8088aa:	5d                   	pop    rbp
  8088ab:	c3                   	ret    

00000000008088ac <FAT32_lookup>:


struct dir_entry * FAT32_lookup(struct index_node * parent_inode,struct dir_entry * dest_dentry)
{
  8088ac:	f3 0f 1e fa          	endbr64 
  8088b0:	55                   	push   rbp
  8088b1:	48 89 e5             	mov    rbp,rsp
  8088b4:	48 83 ec 60          	sub    rsp,0x60
  8088b8:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  8088bc:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
	struct FAT32_inode_info * finode = parent_inode->private_index_info;
  8088c0:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8088c4:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8088c8:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	struct FAT32_sb_info * fsbi = parent_inode->sb->private_sb_info;
  8088cc:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8088d0:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8088d4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8088d8:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	unsigned int cluster = 0;
  8088dc:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  8088e3:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  8088ea:	00 
	unsigned char * buf =NULL; 
  8088eb:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  8088f2:	00 
	int i = 0,j = 0,x = 0;
  8088f3:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8088fa:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  808901:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  808908:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80890f:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  808910:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  808917:	00 
	struct index_node * p = NULL;
  808918:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  80891f:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  808920:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808924:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808928:	be 00 00 00 00       	mov    esi,0x0
  80892d:	48 89 c7             	mov    rdi,rax
  808930:	b8 00 00 00 00       	mov    eax,0x0
  808935:	e8 ea 87 ff ff       	call   801124 <vmalloc>
  80893a:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax

	cluster = finode->first_cluster;
  80893e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808942:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808945:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

next_cluster:
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  808948:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80894c:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  808950:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808953:	83 e8 02             	sub    eax,0x2
  808956:	89 c1                	mov    ecx,eax
  808958:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80895c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808960:	48 0f af c1          	imul   rax,rcx
  808964:	48 01 d0             	add    rax,rdx
  808967:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
	printf("lookup cluster:%#010x,sector:%#018lx\n",cluster,sector);
  80896b:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80896f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808972:	89 c6                	mov    esi,eax
  808974:	bf c0 2f 81 00       	mov    edi,0x812fc0
  808979:	b8 00 00 00 00       	mov    eax,0x0
  80897e:	e8 89 83 ff ff       	call   800d0c <printf>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  808983:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808987:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80898b:	89 c1                	mov    ecx,eax
  80898d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808991:	89 c2                	mov    edx,eax
  808993:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808997:	49 89 c0             	mov    r8,rax
  80899a:	be 00 00 00 00       	mov    esi,0x0
  80899f:	bf 00 00 00 00       	mov    edi,0x0
  8089a4:	e8 ae e0 ff ff       	call   806a57 <request>
  8089a9:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    if(!chk_result(r))
  8089ac:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8089af:	89 c7                	mov    edi,eax
  8089b1:	e8 55 e7 ff ff       	call   80710b <chk_result>
  8089b6:	85 c0                	test   eax,eax
  8089b8:	75 25                	jne    8089df <FAT32_lookup+0x133>
	{
		printf("FAT32 FS(lookup) read disk ERROR!!!!!!!!!!\n");
  8089ba:	bf e8 2f 81 00       	mov    edi,0x812fe8
  8089bf:	b8 00 00 00 00       	mov    eax,0x0
  8089c4:	e8 43 83 ff ff       	call   800d0c <printf>
		vmfree(buf);
  8089c9:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8089cd:	48 89 c7             	mov    rdi,rax
  8089d0:	e8 de 87 ff ff       	call   8011b3 <vmfree>
		return NULL;
  8089d5:	b8 00 00 00 00       	mov    eax,0x0
  8089da:	e9 f0 07 00 00       	jmp    8091cf <FAT32_lookup+0x923>
	}

	tmpdentry = (struct FAT32_Directory *)buf;
  8089df:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8089e3:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax

	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  8089e7:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8089ee:	e9 9d 05 00 00       	jmp    808f90 <FAT32_lookup+0x6e4>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  8089f3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8089f7:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  8089fb:	3c 0f                	cmp    al,0xf
  8089fd:	0f 84 59 05 00 00    	je     808f5c <FAT32_lookup+0x6b0>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  808a03:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808a07:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808a0a:	3c e5                	cmp    al,0xe5
  808a0c:	0f 84 4d 05 00 00    	je     808f5f <FAT32_lookup+0x6b3>
  808a12:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808a16:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808a19:	84 c0                	test   al,al
  808a1b:	0f 84 3e 05 00 00    	je     808f5f <FAT32_lookup+0x6b3>
  808a21:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808a25:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808a28:	3c 05                	cmp    al,0x5
  808a2a:	0f 84 2f 05 00 00    	je     808f5f <FAT32_lookup+0x6b3>
			continue;

		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  808a30:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808a34:	48 83 e8 20          	sub    rax,0x20
  808a38:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
		j = 0;
  808a3c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0

		//long file/dir name compare
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  808a43:	e9 88 01 00 00       	jmp    808bd0 <FAT32_lookup+0x324>
		{
			for(x=0;x<5;x++)
  808a48:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  808a4f:	eb 6a                	jmp    808abb <FAT32_lookup+0x20f>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name1[x] == 0xffff)
  808a51:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808a55:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808a58:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808a5b:	7e 15                	jle    808a72 <FAT32_lookup+0x1c6>
  808a5d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808a61:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  808a64:	48 63 d2             	movsxd rdx,edx
  808a67:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  808a6c:	66 83 f8 ff          	cmp    ax,0xffff
  808a70:	74 44                	je     808ab6 <FAT32_lookup+0x20a>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name1[x] != (unsigned short)(dest_dentry->name[j++]))
  808a72:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808a76:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808a79:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808a7c:	0f 8f e0 04 00 00    	jg     808f62 <FAT32_lookup+0x6b6>
  808a82:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808a86:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  808a89:	48 63 d2             	movsxd rdx,edx
  808a8c:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  808a91:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808a95:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  808a98:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808a9b:	8d 50 01             	lea    edx,[rax+0x1]
  808a9e:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  808aa1:	48 98                	cdqe   
  808aa3:	48 01 f0             	add    rax,rsi
  808aa6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808aa9:	66 98                	cbw    
  808aab:	66 39 c1             	cmp    cx,ax
  808aae:	0f 85 ae 04 00 00    	jne    808f62 <FAT32_lookup+0x6b6>
  808ab4:	eb 01                	jmp    808ab7 <FAT32_lookup+0x20b>
					continue;
  808ab6:	90                   	nop
			for(x=0;x<5;x++)
  808ab7:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  808abb:	83 7d f0 04          	cmp    DWORD PTR [rbp-0x10],0x4
  808abf:	7e 90                	jle    808a51 <FAT32_lookup+0x1a5>
					goto continue_cmp_fail;
			}
			for(x=0;x<6;x++)
  808ac1:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  808ac8:	eb 6a                	jmp    808b34 <FAT32_lookup+0x288>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name2[x] == 0xffff)
  808aca:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808ace:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808ad1:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808ad4:	7e 15                	jle    808aeb <FAT32_lookup+0x23f>
  808ad6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808ada:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  808add:	48 63 d2             	movsxd rdx,edx
  808ae0:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  808ae5:	66 83 f8 ff          	cmp    ax,0xffff
  808ae9:	74 44                	je     808b2f <FAT32_lookup+0x283>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name2[x] != (unsigned short)(dest_dentry->name[j++]))
  808aeb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808aef:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808af2:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808af5:	0f 8f 6a 04 00 00    	jg     808f65 <FAT32_lookup+0x6b9>
  808afb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808aff:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  808b02:	48 63 d2             	movsxd rdx,edx
  808b05:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  808b0a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808b0e:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  808b11:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808b14:	8d 50 01             	lea    edx,[rax+0x1]
  808b17:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  808b1a:	48 98                	cdqe   
  808b1c:	48 01 f0             	add    rax,rsi
  808b1f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808b22:	66 98                	cbw    
  808b24:	66 39 c1             	cmp    cx,ax
  808b27:	0f 85 38 04 00 00    	jne    808f65 <FAT32_lookup+0x6b9>
  808b2d:	eb 01                	jmp    808b30 <FAT32_lookup+0x284>
					continue;
  808b2f:	90                   	nop
			for(x=0;x<6;x++)
  808b30:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  808b34:	83 7d f0 05          	cmp    DWORD PTR [rbp-0x10],0x5
  808b38:	7e 90                	jle    808aca <FAT32_lookup+0x21e>
					goto continue_cmp_fail;
			}
			for(x=0;x<2;x++)
  808b3a:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  808b41:	eb 72                	jmp    808bb5 <FAT32_lookup+0x309>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name3[x] == 0xffff)
  808b43:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808b47:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808b4a:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808b4d:	7e 19                	jle    808b68 <FAT32_lookup+0x2bc>
  808b4f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808b53:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  808b56:	48 63 d2             	movsxd rdx,edx
  808b59:	48 83 c2 08          	add    rdx,0x8
  808b5d:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  808b62:	66 83 f8 ff          	cmp    ax,0xffff
  808b66:	74 48                	je     808bb0 <FAT32_lookup+0x304>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name3[x] != (unsigned short)(dest_dentry->name[j++]))
  808b68:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808b6c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808b6f:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808b72:	0f 8f f0 03 00 00    	jg     808f68 <FAT32_lookup+0x6bc>
  808b78:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808b7c:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  808b7f:	48 63 d2             	movsxd rdx,edx
  808b82:	48 83 c2 08          	add    rdx,0x8
  808b86:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  808b8b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808b8f:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  808b92:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808b95:	8d 50 01             	lea    edx,[rax+0x1]
  808b98:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  808b9b:	48 98                	cdqe   
  808b9d:	48 01 f0             	add    rax,rsi
  808ba0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808ba3:	66 98                	cbw    
  808ba5:	66 39 c1             	cmp    cx,ax
  808ba8:	0f 85 ba 03 00 00    	jne    808f68 <FAT32_lookup+0x6bc>
  808bae:	eb 01                	jmp    808bb1 <FAT32_lookup+0x305>
					continue;
  808bb0:	90                   	nop
			for(x=0;x<2;x++)
  808bb1:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  808bb5:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  808bb9:	7e 88                	jle    808b43 <FAT32_lookup+0x297>
					goto continue_cmp_fail;
			}

			if(j >= dest_dentry->name_length)
  808bbb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808bbf:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808bc2:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808bc5:	0f 8d 14 04 00 00    	jge    808fdf <FAT32_lookup+0x733>
			{
				goto find_lookup_success;
			}

			tmpldentry --;
  808bcb:	48 83 6d e0 20       	sub    QWORD PTR [rbp-0x20],0x20
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  808bd0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808bd4:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  808bd8:	3c 0f                	cmp    al,0xf
  808bda:	75 0f                	jne    808beb <FAT32_lookup+0x33f>
  808bdc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808be0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808be3:	3c e5                	cmp    al,0xe5
  808be5:	0f 85 5d fe ff ff    	jne    808a48 <FAT32_lookup+0x19c>
		}

		//short file/dir base name compare
		j = 0;
  808beb:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
		for(x=0;x<8;x++)
  808bf2:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  808bf9:	e9 f4 01 00 00       	jmp    808df2 <FAT32_lookup+0x546>
		{
			switch(tmpdentry->DIR_Name[x])
  808bfe:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808c02:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808c05:	48 98                	cdqe   
  808c07:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808c0b:	0f b6 c0             	movzx  eax,al
  808c0e:	83 f8 7a             	cmp    eax,0x7a
  808c11:	0f 8f d0 01 00 00    	jg     808de7 <FAT32_lookup+0x53b>
  808c17:	83 f8 61             	cmp    eax,0x61
  808c1a:	0f 8d e6 00 00 00    	jge    808d06 <FAT32_lookup+0x45a>
  808c20:	83 f8 5a             	cmp    eax,0x5a
  808c23:	0f 8f be 01 00 00    	jg     808de7 <FAT32_lookup+0x53b>
  808c29:	83 f8 41             	cmp    eax,0x41
  808c2c:	0f 8d d4 00 00 00    	jge    808d06 <FAT32_lookup+0x45a>
  808c32:	83 f8 20             	cmp    eax,0x20
  808c35:	74 1a                	je     808c51 <FAT32_lookup+0x3a5>
  808c37:	83 f8 20             	cmp    eax,0x20
  808c3a:	0f 8c a7 01 00 00    	jl     808de7 <FAT32_lookup+0x53b>
  808c40:	83 e8 30             	sub    eax,0x30
  808c43:	83 f8 09             	cmp    eax,0x9
  808c46:	0f 87 9b 01 00 00    	ja     808de7 <FAT32_lookup+0x53b>
  808c4c:	e9 53 01 00 00       	jmp    808da4 <FAT32_lookup+0x4f8>
			{
				case ' ':
					if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  808c51:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808c55:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  808c59:	0f b6 c0             	movzx  eax,al
  808c5c:	83 e0 10             	and    eax,0x10
  808c5f:	85 c0                	test   eax,eax
  808c61:	75 50                	jne    808cb3 <FAT32_lookup+0x407>
					{
						if(dest_dentry->name[j]=='.')
  808c63:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808c67:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  808c6a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808c6d:	48 98                	cdqe   
  808c6f:	48 01 d0             	add    rax,rdx
  808c72:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c75:	3c 2e                	cmp    al,0x2e
  808c77:	0f 84 70 01 00 00    	je     808ded <FAT32_lookup+0x541>
							continue;
						else if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  808c7d:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808c81:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808c84:	48 98                	cdqe   
  808c86:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808c8a:	0f b6 d0             	movzx  edx,al
  808c8d:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808c91:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808c94:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808c97:	48 98                	cdqe   
  808c99:	48 01 c8             	add    rax,rcx
  808c9c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c9f:	0f be c0             	movsx  eax,al
  808ca2:	39 c2                	cmp    edx,eax
  808ca4:	0f 85 c1 02 00 00    	jne    808f6b <FAT32_lookup+0x6bf>
						{
							j++;
  808caa:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  808cae:	e9 3b 01 00 00       	jmp    808dee <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  808cb3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808cb7:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808cba:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808cbd:	7d 32                	jge    808cf1 <FAT32_lookup+0x445>
  808cbf:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808cc3:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808cc6:	48 98                	cdqe   
  808cc8:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808ccc:	0f b6 d0             	movzx  edx,al
  808ccf:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808cd3:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808cd6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808cd9:	48 98                	cdqe   
  808cdb:	48 01 c8             	add    rax,rcx
  808cde:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808ce1:	0f be c0             	movsx  eax,al
  808ce4:	39 c2                	cmp    edx,eax
  808ce6:	75 09                	jne    808cf1 <FAT32_lookup+0x445>
						{
							j++;
  808ce8:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  808cec:	e9 fd 00 00 00       	jmp    808dee <FAT32_lookup+0x542>
						}
						else if(j == dest_dentry->name_length)
  808cf1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808cf5:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808cf8:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808cfb:	0f 85 6d 02 00 00    	jne    808f6e <FAT32_lookup+0x6c2>
							continue;
  808d01:	e9 e8 00 00 00       	jmp    808dee <FAT32_lookup+0x542>
							goto continue_cmp_fail;
					}

				case 'A' ... 'Z':
				case 'a' ... 'z':
					if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  808d06:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808d0a:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  808d0e:	0f b6 c0             	movzx  eax,al
  808d11:	83 e0 08             	and    eax,0x8
  808d14:	85 c0                	test   eax,eax
  808d16:	74 49                	je     808d61 <FAT32_lookup+0x4b5>
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  808d18:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808d1c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808d1f:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808d22:	0f 8d 49 02 00 00    	jge    808f71 <FAT32_lookup+0x6c5>
  808d28:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808d2c:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808d2f:	48 98                	cdqe   
  808d31:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808d35:	0f b6 c0             	movzx  eax,al
  808d38:	8d 50 20             	lea    edx,[rax+0x20]
  808d3b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808d3f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808d42:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808d45:	48 98                	cdqe   
  808d47:	48 01 c8             	add    rax,rcx
  808d4a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d4d:	0f be c0             	movsx  eax,al
  808d50:	39 c2                	cmp    edx,eax
  808d52:	0f 85 19 02 00 00    	jne    808f71 <FAT32_lookup+0x6c5>
						{
							j++;
  808d58:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  808d5c:	e9 8d 00 00 00       	jmp    808dee <FAT32_lookup+0x542>
						}
						else
							goto continue_cmp_fail;
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  808d61:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808d65:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808d68:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808d6b:	0f 8d 03 02 00 00    	jge    808f74 <FAT32_lookup+0x6c8>
  808d71:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808d75:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808d78:	48 98                	cdqe   
  808d7a:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808d7e:	0f b6 d0             	movzx  edx,al
  808d81:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808d85:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808d88:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808d8b:	48 98                	cdqe   
  808d8d:	48 01 c8             	add    rax,rcx
  808d90:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d93:	0f be c0             	movsx  eax,al
  808d96:	39 c2                	cmp    edx,eax
  808d98:	0f 85 d6 01 00 00    	jne    808f74 <FAT32_lookup+0x6c8>
						{
							j++;
  808d9e:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  808da2:	eb 4a                	jmp    808dee <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}

				case '0' ... '9':
					if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  808da4:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808da8:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808dab:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808dae:	0f 8d c3 01 00 00    	jge    808f77 <FAT32_lookup+0x6cb>
  808db4:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808db8:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808dbb:	48 98                	cdqe   
  808dbd:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808dc1:	0f b6 d0             	movzx  edx,al
  808dc4:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808dc8:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808dcb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808dce:	48 98                	cdqe   
  808dd0:	48 01 c8             	add    rax,rcx
  808dd3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808dd6:	0f be c0             	movsx  eax,al
  808dd9:	39 c2                	cmp    edx,eax
  808ddb:	0f 85 96 01 00 00    	jne    808f77 <FAT32_lookup+0x6cb>
					{
						j++;
  808de1:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
						break;
  808de5:	eb 07                	jmp    808dee <FAT32_lookup+0x542>
					}
					else
						goto continue_cmp_fail;

				default :
					j++;
  808de7:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
					break;
  808deb:	eb 01                	jmp    808dee <FAT32_lookup+0x542>
							continue;
  808ded:	90                   	nop
		for(x=0;x<8;x++)
  808dee:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  808df2:	83 7d f0 07          	cmp    DWORD PTR [rbp-0x10],0x7
  808df6:	0f 8e 02 fe ff ff    	jle    808bfe <FAT32_lookup+0x352>
			}
		}
		//short file ext name compare
		if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  808dfc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808e00:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  808e04:	0f b6 c0             	movzx  eax,al
  808e07:	83 e0 10             	and    eax,0x10
  808e0a:	85 c0                	test   eax,eax
  808e0c:	0f 85 d0 01 00 00    	jne    808fe2 <FAT32_lookup+0x736>
		{
			j++;
  808e12:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
			for(x=8;x<11;x++)
  808e16:	c7 45 f0 08 00 00 00 	mov    DWORD PTR [rbp-0x10],0x8
  808e1d:	e9 2b 01 00 00       	jmp    808f4d <FAT32_lookup+0x6a1>
			{
				switch(tmpdentry->DIR_Name[x])
  808e22:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808e26:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808e29:	48 98                	cdqe   
  808e2b:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808e2f:	0f b6 c0             	movzx  eax,al
  808e32:	83 f8 7a             	cmp    eax,0x7a
  808e35:	0f 8f 3f 01 00 00    	jg     808f7a <FAT32_lookup+0x6ce>
  808e3b:	83 f8 61             	cmp    eax,0x61
  808e3e:	7d 2e                	jge    808e6e <FAT32_lookup+0x5c2>
  808e40:	83 f8 5a             	cmp    eax,0x5a
  808e43:	0f 8f 31 01 00 00    	jg     808f7a <FAT32_lookup+0x6ce>
  808e49:	83 f8 41             	cmp    eax,0x41
  808e4c:	7d 20                	jge    808e6e <FAT32_lookup+0x5c2>
  808e4e:	83 f8 20             	cmp    eax,0x20
  808e51:	0f 84 c4 00 00 00    	je     808f1b <FAT32_lookup+0x66f>
  808e57:	83 f8 20             	cmp    eax,0x20
  808e5a:	0f 8c 1a 01 00 00    	jl     808f7a <FAT32_lookup+0x6ce>
  808e60:	83 e8 30             	sub    eax,0x30
  808e63:	83 f8 09             	cmp    eax,0x9
  808e66:	0f 87 0e 01 00 00    	ja     808f7a <FAT32_lookup+0x6ce>
  808e6c:	eb 7e                	jmp    808eec <FAT32_lookup+0x640>
				{
					case 'A' ... 'Z':
					case 'a' ... 'z':
						if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  808e6e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808e72:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  808e76:	0f b6 c0             	movzx  eax,al
  808e79:	83 e0 10             	and    eax,0x10
  808e7c:	85 c0                	test   eax,eax
  808e7e:	74 39                	je     808eb9 <FAT32_lookup+0x60d>
							if(tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  808e80:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808e84:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808e87:	48 98                	cdqe   
  808e89:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808e8d:	0f b6 c0             	movzx  eax,al
  808e90:	8d 50 20             	lea    edx,[rax+0x20]
  808e93:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808e97:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808e9a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808e9d:	48 98                	cdqe   
  808e9f:	48 01 c8             	add    rax,rcx
  808ea2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808ea5:	0f be c0             	movsx  eax,al
  808ea8:	39 c2                	cmp    edx,eax
  808eaa:	0f 85 cd 00 00 00    	jne    808f7d <FAT32_lookup+0x6d1>
							{
								j++;
  808eb0:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  808eb4:	e9 90 00 00 00       	jmp    808f49 <FAT32_lookup+0x69d>
							}
							else
								goto continue_cmp_fail;
						else
						{
							if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  808eb9:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808ebd:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808ec0:	48 98                	cdqe   
  808ec2:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808ec6:	0f b6 d0             	movzx  edx,al
  808ec9:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808ecd:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808ed0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808ed3:	48 98                	cdqe   
  808ed5:	48 01 c8             	add    rax,rcx
  808ed8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808edb:	0f be c0             	movsx  eax,al
  808ede:	39 c2                	cmp    edx,eax
  808ee0:	0f 85 9a 00 00 00    	jne    808f80 <FAT32_lookup+0x6d4>
							{
								j++;
  808ee6:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  808eea:	eb 5d                	jmp    808f49 <FAT32_lookup+0x69d>
							else
								goto continue_cmp_fail;
						}

					case '0' ... '9':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  808eec:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808ef0:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808ef3:	48 98                	cdqe   
  808ef5:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808ef9:	0f b6 d0             	movzx  edx,al
  808efc:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808f00:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808f03:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808f06:	48 98                	cdqe   
  808f08:	48 01 c8             	add    rax,rcx
  808f0b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808f0e:	0f be c0             	movsx  eax,al
  808f11:	39 c2                	cmp    edx,eax
  808f13:	75 6e                	jne    808f83 <FAT32_lookup+0x6d7>
						{
							j++;
  808f15:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  808f19:	eb 2e                	jmp    808f49 <FAT32_lookup+0x69d>
						}
						else
							goto continue_cmp_fail;

					case ' ':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  808f1b:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808f1f:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808f22:	48 98                	cdqe   
  808f24:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808f28:	0f b6 d0             	movzx  edx,al
  808f2b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808f2f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808f32:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808f35:	48 98                	cdqe   
  808f37:	48 01 c8             	add    rax,rcx
  808f3a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808f3d:	0f be c0             	movsx  eax,al
  808f40:	39 c2                	cmp    edx,eax
  808f42:	75 42                	jne    808f86 <FAT32_lookup+0x6da>
						{
							j++;
  808f44:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  808f48:	90                   	nop
			for(x=8;x<11;x++)
  808f49:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  808f4d:	83 7d f0 0a          	cmp    DWORD PTR [rbp-0x10],0xa
  808f51:	0f 8e cb fe ff ff    	jle    808e22 <FAT32_lookup+0x576>
					default :
						goto continue_cmp_fail;
				}
			}
		}
		goto find_lookup_success;
  808f57:	e9 86 00 00 00       	jmp    808fe2 <FAT32_lookup+0x736>
			continue;
  808f5c:	90                   	nop
  808f5d:	eb 28                	jmp    808f87 <FAT32_lookup+0x6db>
			continue;
  808f5f:	90                   	nop
  808f60:	eb 25                	jmp    808f87 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  808f62:	90                   	nop
  808f63:	eb 22                	jmp    808f87 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  808f65:	90                   	nop
  808f66:	eb 1f                	jmp    808f87 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  808f68:	90                   	nop
  808f69:	eb 1c                	jmp    808f87 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  808f6b:	90                   	nop
  808f6c:	eb 19                	jmp    808f87 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  808f6e:	90                   	nop
  808f6f:	eb 16                	jmp    808f87 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  808f71:	90                   	nop
  808f72:	eb 13                	jmp    808f87 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  808f74:	90                   	nop
  808f75:	eb 10                	jmp    808f87 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  808f77:	90                   	nop
  808f78:	eb 0d                	jmp    808f87 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  808f7a:	90                   	nop
  808f7b:	eb 0a                	jmp    808f87 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  808f7d:	90                   	nop
  808f7e:	eb 07                	jmp    808f87 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  808f80:	90                   	nop
  808f81:	eb 04                	jmp    808f87 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  808f83:	90                   	nop
  808f84:	eb 01                	jmp    808f87 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  808f86:	90                   	nop
	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  808f87:	83 45 f8 20          	add    DWORD PTR [rbp-0x8],0x20
  808f8b:	48 83 45 e8 20       	add    QWORD PTR [rbp-0x18],0x20
  808f90:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  808f93:	48 63 d0             	movsxd rdx,eax
  808f96:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808f9a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808f9e:	48 39 c2             	cmp    rdx,rax
  808fa1:	0f 8c 4c fa ff ff    	jl     8089f3 <FAT32_lookup+0x147>

continue_cmp_fail:;
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  808fa7:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  808faa:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808fae:	89 d6                	mov    esi,edx
  808fb0:	48 89 c7             	mov    rdi,rax
  808fb3:	e8 2d e7 ff ff       	call   8076e5 <DISK1_FAT32_read_FAT_Entry>
  808fb8:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  808fbb:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  808fc2:	77 05                	ja     808fc9 <FAT32_lookup+0x71d>
		goto next_cluster;
  808fc4:	e9 7f f9 ff ff       	jmp    808948 <FAT32_lookup+0x9c>

	vmfree(buf);
  808fc9:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808fcd:	48 89 c7             	mov    rdi,rax
  808fd0:	e8 de 81 ff ff       	call   8011b3 <vmfree>
	return NULL;
  808fd5:	b8 00 00 00 00       	mov    eax,0x0
  808fda:	e9 f0 01 00 00       	jmp    8091cf <FAT32_lookup+0x923>
				goto find_lookup_success;
  808fdf:	90                   	nop
  808fe0:	eb 01                	jmp    808fe3 <FAT32_lookup+0x737>
		goto find_lookup_success;
  808fe2:	90                   	nop

find_lookup_success:
	p = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  808fe3:	be 00 00 00 00       	mov    esi,0x0
  808fe8:	bf 38 00 00 00       	mov    edi,0x38
  808fed:	b8 00 00 00 00       	mov    eax,0x0
  808ff2:	e8 2d 81 ff ff       	call   801124 <vmalloc>
  808ff7:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
	memset(p,0,sizeof(struct index_node));
  808ffb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808fff:	ba 38 00 00 00       	mov    edx,0x38
  809004:	be 00 00 00 00       	mov    esi,0x0
  809009:	48 89 c7             	mov    rdi,rax
  80900c:	e8 6f 15 00 00       	call   80a580 <memset>
	p->file_size = tmpdentry->DIR_FileSize;
  809011:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809015:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  809018:	89 c2                	mov    edx,eax
  80901a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80901e:	48 89 10             	mov    QWORD PTR [rax],rdx
	p->blocks = (p->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  809021:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809025:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809028:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80902c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809030:	48 01 d0             	add    rax,rdx
  809033:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  809037:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80903b:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80903f:	48 89 c1             	mov    rcx,rax
  809042:	48 89 d0             	mov    rax,rdx
  809045:	ba 00 00 00 00       	mov    edx,0x0
  80904a:	48 f7 f1             	div    rcx
  80904d:	48 89 c2             	mov    rdx,rax
  809050:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809054:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	p->attribute = (tmpdentry->DIR_Attr & ATTR_DIRECTORY) ? FS_ATTR_DIR : FS_ATTR_FILE;
  809058:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80905c:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809060:	0f b6 c0             	movzx  eax,al
  809063:	83 e0 10             	and    eax,0x10
  809066:	85 c0                	test   eax,eax
  809068:	74 07                	je     809071 <FAT32_lookup+0x7c5>
  80906a:	ba 02 00 00 00       	mov    edx,0x2
  80906f:	eb 05                	jmp    809076 <FAT32_lookup+0x7ca>
  809071:	ba 01 00 00 00       	mov    edx,0x1
  809076:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80907a:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	p->sb = parent_inode->sb;
  80907e:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  809082:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  809086:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80908a:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	p->f_ops = &FAT32_file_ops;
  80908e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809092:	48 c7 40 20 a0 b0 80 	mov    QWORD PTR [rax+0x20],0x80b0a0
  809099:	00 
	p->inode_ops = &FAT32_inode_ops;
  80909a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80909e:	48 c7 40 28 e0 b0 80 	mov    QWORD PTR [rax+0x28],0x80b0e0
  8090a5:	00 

	p->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  8090a6:	be 00 00 00 00       	mov    esi,0x0
  8090ab:	bf 20 00 00 00       	mov    edi,0x20
  8090b0:	b8 00 00 00 00       	mov    eax,0x0
  8090b5:	e8 6a 80 ff ff       	call   801124 <vmalloc>
  8090ba:	48 89 c2             	mov    rdx,rax
  8090bd:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8090c1:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(p->private_index_info,0,sizeof(struct FAT32_inode_info));
  8090c5:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8090c9:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8090cd:	ba 20 00 00 00       	mov    edx,0x20
  8090d2:	be 00 00 00 00       	mov    esi,0x0
  8090d7:	48 89 c7             	mov    rdi,rax
  8090da:	e8 a1 14 00 00       	call   80a580 <memset>
	finode = p->private_index_info;
  8090df:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8090e3:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8090e7:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax

	finode->first_cluster = (tmpdentry->DIR_FstClusHI<< 16 | tmpdentry->DIR_FstClusLO) & 0x0fffffff;
  8090eb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8090ef:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  8090f3:	0f b7 c0             	movzx  eax,ax
  8090f6:	c1 e0 10             	shl    eax,0x10
  8090f9:	89 c2                	mov    edx,eax
  8090fb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8090ff:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  809103:	0f b7 c0             	movzx  eax,ax
  809106:	09 d0                	or     eax,edx
  809108:	48 98                	cdqe   
  80910a:	25 ff ff ff 0f       	and    eax,0xfffffff
  80910f:	48 89 c2             	mov    rdx,rax
  809112:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809116:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = cluster;
  809119:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80911c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809120:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	finode->dentry_position = tmpdentry - (struct FAT32_Directory *)buf;
  809124:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809128:	48 2b 45 c0          	sub    rax,QWORD PTR [rbp-0x40]
  80912c:	48 c1 f8 05          	sar    rax,0x5
  809130:	48 89 c2             	mov    rdx,rax
  809133:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809137:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	finode->create_date = tmpdentry->DIR_CrtTime;
  80913b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80913f:	0f b7 50 0e          	movzx  edx,WORD PTR [rax+0xe]
  809143:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809147:	66 89 50 18          	mov    WORD PTR [rax+0x18],dx
	finode->create_time = tmpdentry->DIR_CrtDate;
  80914b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80914f:	0f b7 50 10          	movzx  edx,WORD PTR [rax+0x10]
  809153:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809157:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	finode->write_date = tmpdentry->DIR_WrtTime;
  80915b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80915f:	0f b7 50 16          	movzx  edx,WORD PTR [rax+0x16]
  809163:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809167:	66 89 50 1c          	mov    WORD PTR [rax+0x1c],dx
	finode->write_time = tmpdentry->DIR_WrtDate;
  80916b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80916f:	0f b7 50 18          	movzx  edx,WORD PTR [rax+0x18]
  809173:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809177:	66 89 50 1e          	mov    WORD PTR [rax+0x1e],dx

	if((tmpdentry->DIR_FstClusHI >> 12) && (p->attribute & FS_ATTR_FILE))
  80917b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80917f:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  809183:	66 c1 e8 0c          	shr    ax,0xc
  809187:	66 85 c0             	test   ax,ax
  80918a:	74 27                	je     8091b3 <FAT32_lookup+0x907>
  80918c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809190:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809194:	83 e0 01             	and    eax,0x1
  809197:	48 85 c0             	test   rax,rax
  80919a:	74 17                	je     8091b3 <FAT32_lookup+0x907>
	{
		p->attribute |= FS_ATTR_DEVICE;
  80919c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8091a0:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8091a4:	48 83 c8 04          	or     rax,0x4
  8091a8:	48 89 c2             	mov    rdx,rax
  8091ab:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8091af:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	}

	dest_dentry->dir_inode = p;
  8091b3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8091b7:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  8091bb:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	vmfree(buf);
  8091bf:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8091c3:	48 89 c7             	mov    rdi,rax
  8091c6:	e8 e8 7f ff ff       	call   8011b3 <vmfree>
	return dest_dentry;	
  8091cb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
}
  8091cf:	c9                   	leave  
  8091d0:	c3                   	ret    

00000000008091d1 <FAT32_mkdir>:


long FAT32_mkdir(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  8091d1:	f3 0f 1e fa          	endbr64 
  8091d5:	55                   	push   rbp
  8091d6:	48 89 e5             	mov    rbp,rsp
  8091d9:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8091dd:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8091e1:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  8091e4:	90                   	nop
  8091e5:	5d                   	pop    rbp
  8091e6:	c3                   	ret    

00000000008091e7 <FAT32_rmdir>:


long FAT32_rmdir(struct index_node * inode,struct dir_entry * dentry)
{}
  8091e7:	f3 0f 1e fa          	endbr64 
  8091eb:	55                   	push   rbp
  8091ec:	48 89 e5             	mov    rbp,rsp
  8091ef:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8091f3:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8091f7:	90                   	nop
  8091f8:	5d                   	pop    rbp
  8091f9:	c3                   	ret    

00000000008091fa <FAT32_rename>:

long FAT32_rename(struct index_node * old_inode,struct dir_entry * old_dentry,struct index_node * new_inode,struct dir_entry * new_dentry)
{}
  8091fa:	f3 0f 1e fa          	endbr64 
  8091fe:	55                   	push   rbp
  8091ff:	48 89 e5             	mov    rbp,rsp
  809202:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809206:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80920a:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80920e:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  809212:	90                   	nop
  809213:	5d                   	pop    rbp
  809214:	c3                   	ret    

0000000000809215 <FAT32_getattr>:

long FAT32_getattr(struct dir_entry * dentry,unsigned long * attr)
{}
  809215:	f3 0f 1e fa          	endbr64 
  809219:	55                   	push   rbp
  80921a:	48 89 e5             	mov    rbp,rsp
  80921d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809221:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  809225:	90                   	nop
  809226:	5d                   	pop    rbp
  809227:	c3                   	ret    

0000000000809228 <FAT32_setattr>:

long FAT32_setattr(struct dir_entry * dentry,unsigned long * attr)
{}
  809228:	f3 0f 1e fa          	endbr64 
  80922c:	55                   	push   rbp
  80922d:	48 89 e5             	mov    rbp,rsp
  809230:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809234:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  809238:	90                   	nop
  809239:	5d                   	pop    rbp
  80923a:	c3                   	ret    

000000000080923b <FAT32_compare>:
	.setattr = FAT32_setattr,
};


//// these operation need cache and list
long FAT32_compare(struct dir_entry * parent_dentry,char * source_filename,char * destination_filename){}
  80923b:	f3 0f 1e fa          	endbr64 
  80923f:	55                   	push   rbp
  809240:	48 89 e5             	mov    rbp,rsp
  809243:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809247:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80924b:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80924f:	90                   	nop
  809250:	5d                   	pop    rbp
  809251:	c3                   	ret    

0000000000809252 <FAT32_hash>:
long FAT32_hash(struct dir_entry * dentry,char * filename){}
  809252:	f3 0f 1e fa          	endbr64 
  809256:	55                   	push   rbp
  809257:	48 89 e5             	mov    rbp,rsp
  80925a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80925e:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  809262:	90                   	nop
  809263:	5d                   	pop    rbp
  809264:	c3                   	ret    

0000000000809265 <FAT32_release>:
long FAT32_release(struct dir_entry * dentry){}
  809265:	f3 0f 1e fa          	endbr64 
  809269:	55                   	push   rbp
  80926a:	48 89 e5             	mov    rbp,rsp
  80926d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809271:	90                   	nop
  809272:	5d                   	pop    rbp
  809273:	c3                   	ret    

0000000000809274 <FAT32_iput>:
long FAT32_iput(struct dir_entry * dentry,struct index_node * inode){}
  809274:	f3 0f 1e fa          	endbr64 
  809278:	55                   	push   rbp
  809279:	48 89 e5             	mov    rbp,rsp
  80927c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809280:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  809284:	90                   	nop
  809285:	5d                   	pop    rbp
  809286:	c3                   	ret    

0000000000809287 <fat32_write_superblock>:
	.release = FAT32_release,
	.iput = FAT32_iput,
};


void fat32_write_superblock(struct super_block * sb){}
  809287:	f3 0f 1e fa          	endbr64 
  80928b:	55                   	push   rbp
  80928c:	48 89 e5             	mov    rbp,rsp
  80928f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809293:	90                   	nop
  809294:	5d                   	pop    rbp
  809295:	c3                   	ret    

0000000000809296 <fat32_put_superblock>:

void fat32_put_superblock(struct super_block * sb)
{
  809296:	f3 0f 1e fa          	endbr64 
  80929a:	55                   	push   rbp
  80929b:	48 89 e5             	mov    rbp,rsp
  80929e:	48 83 ec 10          	sub    rsp,0x10
  8092a2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
	vmfree(sb->private_sb_info);
  8092a6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092aa:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8092ae:	48 89 c7             	mov    rdi,rax
  8092b1:	e8 fd 7e ff ff       	call   8011b3 <vmfree>
	vmfree(sb->root->dir_inode->private_index_info);
  8092b6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092ba:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8092bd:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8092c1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8092c5:	48 89 c7             	mov    rdi,rax
  8092c8:	e8 e6 7e ff ff       	call   8011b3 <vmfree>
	vmfree(sb->root->dir_inode);
  8092cd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092d1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8092d4:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8092d8:	48 89 c7             	mov    rdi,rax
  8092db:	e8 d3 7e ff ff       	call   8011b3 <vmfree>
	vmfree(sb->root);
  8092e0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092e4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8092e7:	48 89 c7             	mov    rdi,rax
  8092ea:	e8 c4 7e ff ff       	call   8011b3 <vmfree>
	vmfree(sb);
  8092ef:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092f3:	48 89 c7             	mov    rdi,rax
  8092f6:	e8 b8 7e ff ff       	call   8011b3 <vmfree>
}
  8092fb:	90                   	nop
  8092fc:	c9                   	leave  
  8092fd:	c3                   	ret    

00000000008092fe <fat32_write_inode>:

void fat32_write_inode(struct index_node * inode)
{
  8092fe:	f3 0f 1e fa          	endbr64 
  809302:	55                   	push   rbp
  809303:	48 89 e5             	mov    rbp,rsp
  809306:	48 83 ec 40          	sub    rsp,0x40
  80930a:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
	struct FAT32_Directory * fdentry = NULL;
  80930e:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  809315:	00 
	struct FAT32_Directory * buf = NULL;
  809316:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80931d:	00 
	struct FAT32_inode_info * finode = inode->private_index_info;
  80931e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809322:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809326:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	struct FAT32_sb_info * fsbi = inode->sb->private_sb_info;
  80932a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80932e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809332:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809336:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	unsigned long sector = 0;
  80933a:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  809341:	00 

	if(finode->dentry_location == 0)
  809342:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809346:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80934a:	48 85 c0             	test   rax,rax
  80934d:	75 14                	jne    809363 <fat32_write_inode+0x65>
	{
		printf("FS ERROR:write root inode!\n");	
  80934f:	bf 14 30 81 00       	mov    edi,0x813014
  809354:	b8 00 00 00 00       	mov    eax,0x0
  809359:	e8 ae 79 ff ff       	call   800d0c <printf>
		return ;
  80935e:	e9 30 01 00 00       	jmp    809493 <fat32_write_inode+0x195>
	}

	sector = fsbi->Data_firstsector + (finode->dentry_location - 2) * fsbi->sector_per_cluster;
  809363:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809367:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  80936b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80936f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  809373:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  809377:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80937b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80937f:	48 0f af c2          	imul   rax,rdx
  809383:	48 01 c8             	add    rax,rcx
  809386:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	buf = (struct FAT32_Directory *)vmalloc(fsbi->bytes_per_cluster,0);
  80938a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80938e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809392:	be 00 00 00 00       	mov    esi,0x0
  809397:	48 89 c7             	mov    rdi,rax
  80939a:	b8 00 00 00 00       	mov    eax,0x0
  80939f:	e8 80 7d ff ff       	call   801124 <vmalloc>
  8093a4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	memset(buf,0,fsbi->bytes_per_cluster);
  8093a8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8093ac:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8093b0:	89 c2                	mov    edx,eax
  8093b2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8093b6:	be 00 00 00 00       	mov    esi,0x0
  8093bb:	48 89 c7             	mov    rdi,rax
  8093be:	e8 bd 11 00 00       	call   80a580 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  8093c3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8093c7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8093cb:	89 c1                	mov    ecx,eax
  8093cd:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8093d1:	89 c2                	mov    edx,eax
  8093d3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8093d7:	49 89 c0             	mov    r8,rax
  8093da:	be 00 00 00 00       	mov    esi,0x0
  8093df:	bf 00 00 00 00       	mov    edi,0x0
  8093e4:	e8 6e d6 ff ff       	call   806a57 <request>
  8093e9:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    chk_result(r);
  8093ec:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8093ef:	89 c7                	mov    edi,eax
  8093f1:	e8 15 dd ff ff       	call   80710b <chk_result>
    fdentry = buf+finode->dentry_position;
  8093f6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8093fa:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8093fe:	48 c1 e0 05          	shl    rax,0x5
  809402:	48 89 c2             	mov    rdx,rax
  809405:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809409:	48 01 d0             	add    rax,rdx
  80940c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

	////alert fat32 dentry data
	fdentry->DIR_FileSize = inode->file_size;
  809410:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809414:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809417:	89 c2                	mov    edx,eax
  809419:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80941d:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
	fdentry->DIR_FstClusLO = finode->first_cluster & 0xffff;
  809420:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809424:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809427:	89 c2                	mov    edx,eax
  809429:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80942d:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	fdentry->DIR_FstClusHI = (fdentry->DIR_FstClusHI & 0xf000) | (finode->first_cluster >> 16);
  809431:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809435:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  809439:	66 25 00 f0          	and    ax,0xf000
  80943d:	89 c2                	mov    edx,eax
  80943f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809443:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809446:	48 c1 e8 10          	shr    rax,0x10
  80944a:	09 c2                	or     edx,eax
  80944c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809450:	66 89 50 14          	mov    WORD PTR [rax+0x14],dx

	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  809454:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809458:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80945c:	89 c1                	mov    ecx,eax
  80945e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809462:	89 c2                	mov    edx,eax
  809464:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809468:	49 89 c0             	mov    r8,rax
  80946b:	be 01 00 00 00       	mov    esi,0x1
  809470:	bf 00 00 00 00       	mov    edi,0x0
  809475:	e8 dd d5 ff ff       	call   806a57 <request>
  80947a:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    chk_result(r1);
  80947d:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
  809480:	89 c7                	mov    edi,eax
  809482:	e8 84 dc ff ff       	call   80710b <chk_result>
	vmfree(buf);
  809487:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80948b:	48 89 c7             	mov    rdi,rax
  80948e:	e8 20 7d ff ff       	call   8011b3 <vmfree>
}
  809493:	c9                   	leave  
  809494:	c3                   	ret    

0000000000809495 <fat32_read_superblock>:

	.write_inode = fat32_write_inode,
};

struct super_block * fat32_read_superblock(struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  809495:	f3 0f 1e fa          	endbr64 
  809499:	55                   	push   rbp
  80949a:	48 89 e5             	mov    rbp,rsp
  80949d:	48 83 ec 50          	sub    rsp,0x50
  8094a1:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  8094a5:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
	struct super_block * sbp = NULL;
  8094a9:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8094b0:	00 
	struct FAT32_inode_info * finode = NULL;
  8094b1:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8094b8:	00 
	struct FAT32_BootSector * fbs = NULL;
  8094b9:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  8094c0:	00 
	struct FAT32_sb_info * fsbi = NULL;
  8094c1:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  8094c8:	00 

	////super block
	sbp = (struct super_block *)vmalloc(sizeof(struct super_block),0);
  8094c9:	be 00 00 00 00       	mov    esi,0x0
  8094ce:	bf 18 00 00 00       	mov    edi,0x18
  8094d3:	b8 00 00 00 00       	mov    eax,0x0
  8094d8:	e8 47 7c ff ff       	call   801124 <vmalloc>
  8094dd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	memset(sbp,0,sizeof(struct super_block));
  8094e1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8094e5:	ba 18 00 00 00       	mov    edx,0x18
  8094ea:	be 00 00 00 00       	mov    esi,0x0
  8094ef:	48 89 c7             	mov    rdi,rax
  8094f2:	e8 89 10 00 00       	call   80a580 <memset>

	sbp->sb_ops = &FAT32_sb_ops;
  8094f7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8094fb:	48 c7 40 08 40 b1 80 	mov    QWORD PTR [rax+0x8],0x80b140
  809502:	00 
	sbp->private_sb_info = (struct FAT32_sb_info *)vmalloc(sizeof(struct FAT32_sb_info),0);
  809503:	be 00 00 00 00       	mov    esi,0x0
  809508:	bf 60 00 00 00       	mov    edi,0x60
  80950d:	b8 00 00 00 00       	mov    eax,0x0
  809512:	e8 0d 7c ff ff       	call   801124 <vmalloc>
  809517:	48 89 c2             	mov    rdx,rax
  80951a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80951e:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	memset(sbp->private_sb_info,0,sizeof(struct FAT32_sb_info));
  809522:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809526:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80952a:	ba 60 00 00 00       	mov    edx,0x60
  80952f:	be 00 00 00 00       	mov    esi,0x0
  809534:	48 89 c7             	mov    rdi,rax
  809537:	e8 44 10 00 00       	call   80a580 <memset>

	////fat32 boot sector
	fbs = (struct FAT32_BootSector *)buf;
  80953c:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  809540:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
 	fsbi = sbp->private_sb_info;
  809544:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809548:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80954c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	fsbi->start_sector = DPTE->start_LBA;
  809550:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809554:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809557:	89 c2                	mov    edx,eax
  809559:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80955d:	48 89 10             	mov    QWORD PTR [rax],rdx
	fsbi->sector_count = DPTE->sectors_limit;
  809560:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809564:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  809567:	89 c2                	mov    edx,eax
  809569:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80956d:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	fsbi->sector_per_cluster = fbs->BPB_SecPerClus;
  809571:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809575:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  809579:	0f b6 d0             	movzx  edx,al
  80957c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809580:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	fsbi->bytes_per_cluster = fbs->BPB_SecPerClus * fbs->BPB_BytesPerSec;
  809584:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809588:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  80958c:	0f b6 d0             	movzx  edx,al
  80958f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809593:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  809597:	0f b7 c0             	movzx  eax,ax
  80959a:	0f af c2             	imul   eax,edx
  80959d:	48 63 d0             	movsxd rdx,eax
  8095a0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8095a4:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	fsbi->bytes_per_sector = fbs->BPB_BytesPerSec;
  8095a8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8095ac:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  8095b0:	0f b7 d0             	movzx  edx,ax
  8095b3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8095b7:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
	fsbi->Data_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt + fbs->BPB_FATSz32 * fbs->BPB_NumFATs;
  8095bb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8095bf:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  8095c2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8095c6:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  8095ca:	0f b7 c0             	movzx  eax,ax
  8095cd:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  8095d0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8095d4:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  8095d7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8095db:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  8095df:	0f b6 c0             	movzx  eax,al
  8095e2:	0f af c2             	imul   eax,edx
  8095e5:	01 c8                	add    eax,ecx
  8095e7:	89 c2                	mov    edx,eax
  8095e9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8095ed:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
	fsbi->FAT1_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt;
  8095f1:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8095f5:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  8095f8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8095fc:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  809600:	0f b7 c0             	movzx  eax,ax
  809603:	01 d0                	add    eax,edx
  809605:	89 c2                	mov    edx,eax
  809607:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80960b:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	fsbi->sector_per_FAT = fbs->BPB_FATSz32;
  80960f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809613:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  809616:	89 c2                	mov    edx,eax
  809618:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80961c:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
	fsbi->NumFATs = fbs->BPB_NumFATs;
  809620:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809624:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  809628:	0f b6 d0             	movzx  edx,al
  80962b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80962f:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
	fsbi->fsinfo_sector_infat = fbs->BPB_FSInfo;
  809633:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809637:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80963b:	0f b7 d0             	movzx  edx,ax
  80963e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809642:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
	fsbi->bootsector_bk_infat = fbs->BPB_BkBootSec;	
  809646:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80964a:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  80964e:	0f b7 d0             	movzx  edx,ax
  809651:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809655:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
	
	printf("FAT32 Boot Sector\n\tBPB_FSInfo:%#018lx\n\tBPB_BkBootSec:%#018lx\n\tBPB_TotSec32:%#018lx\n",fbs->BPB_FSInfo,fbs->BPB_BkBootSec,fbs->BPB_TotSec32);
  809659:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80965d:	8b 48 20             	mov    ecx,DWORD PTR [rax+0x20]
  809660:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809664:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  809668:	0f b7 d0             	movzx  edx,ax
  80966b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80966f:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  809673:	0f b7 c0             	movzx  eax,ax
  809676:	89 c6                	mov    esi,eax
  809678:	bf 30 30 81 00       	mov    edi,0x813030
  80967d:	b8 00 00 00 00       	mov    eax,0x0
  809682:	e8 85 76 ff ff       	call   800d0c <printf>
	
	////fat32 fsinfo sector
	fsbi->fat_fsinfo = (struct FAT32_FSInfo *)vmalloc(sizeof(struct FAT32_FSInfo),0);
  809687:	be 00 00 00 00       	mov    esi,0x0
  80968c:	bf 00 02 00 00       	mov    edi,0x200
  809691:	b8 00 00 00 00       	mov    eax,0x0
  809696:	e8 89 7a ff ff       	call   801124 <vmalloc>
  80969b:	48 89 c2             	mov    rdx,rax
  80969e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8096a2:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
	memset(fsbi->fat_fsinfo,0,512);
  8096a6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8096aa:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  8096ae:	ba 00 02 00 00       	mov    edx,0x200
  8096b3:	be 00 00 00 00       	mov    esi,0x0
  8096b8:	48 89 c7             	mov    rdi,rax
  8096bb:	e8 c0 0e 00 00       	call   80a580 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPTE->start_LBA + fbs->BPB_FSInfo,1,(unsigned char *)fsbi->fat_fsinfo);
  8096c0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8096c4:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  8096c8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8096cc:	8b 48 08             	mov    ecx,DWORD PTR [rax+0x8]
  8096cf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8096d3:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  8096d7:	0f b7 c0             	movzx  eax,ax
  8096da:	01 c8                	add    eax,ecx
  8096dc:	49 89 d0             	mov    r8,rdx
  8096df:	b9 01 00 00 00       	mov    ecx,0x1
  8096e4:	89 c2                	mov    edx,eax
  8096e6:	be 00 00 00 00       	mov    esi,0x0
  8096eb:	bf 00 00 00 00       	mov    edi,0x0
  8096f0:	e8 62 d3 ff ff       	call   806a57 <request>
  8096f5:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    chk_result(r);
  8096f8:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8096fb:	89 c7                	mov    edi,eax
  8096fd:	e8 09 da ff ff       	call   80710b <chk_result>
	printf("FAT32 FSInfo\n\tFSI_LeadSig:%#018lx\n\tFSI_StrucSig:%#018lx\n\tFSI_Free_Count:%#018lx\n",fsbi->fat_fsinfo->FSI_LeadSig,fsbi->fat_fsinfo->FSI_StrucSig,fsbi->fat_fsinfo->FSI_Free_Count);
  809702:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809706:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80970a:	8b 88 e8 01 00 00    	mov    ecx,DWORD PTR [rax+0x1e8]
  809710:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809714:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  809718:	8b 90 e4 01 00 00    	mov    edx,DWORD PTR [rax+0x1e4]
  80971e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809722:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  809726:	8b 00                	mov    eax,DWORD PTR [rax]
  809728:	89 c6                	mov    esi,eax
  80972a:	bf 88 30 81 00       	mov    edi,0x813088
  80972f:	b8 00 00 00 00       	mov    eax,0x0
  809734:	e8 d3 75 ff ff       	call   800d0c <printf>
	
	////directory entry
	sbp->root = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  809739:	be 00 00 00 00       	mov    esi,0x0
  80973e:	bf 48 00 00 00       	mov    edi,0x48
  809743:	b8 00 00 00 00       	mov    eax,0x0
  809748:	e8 d7 79 ff ff       	call   801124 <vmalloc>
  80974d:	48 89 c2             	mov    rdx,rax
  809750:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809754:	48 89 10             	mov    QWORD PTR [rax],rdx
	memset(sbp->root,0,sizeof(struct dir_entry));
  809757:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80975b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80975e:	ba 48 00 00 00       	mov    edx,0x48
  809763:	be 00 00 00 00       	mov    esi,0x0
  809768:	48 89 c7             	mov    rdi,rax
  80976b:	e8 10 0e 00 00       	call   80a580 <memset>

	list_init(&sbp->root->child_node);
  809770:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809774:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809777:	48 83 c0 10          	add    rax,0x10
  80977b:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    list->prev = list;
  80977f:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809783:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  809787:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  80978a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80978e:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  809792:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  809796:	90                   	nop
	list_init(&sbp->root->subdirs_list);
  809797:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80979b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80979e:	48 83 c0 20          	add    rax,0x20
  8097a2:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    list->prev = list;
  8097a6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8097aa:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8097ae:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  8097b1:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8097b5:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8097b9:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  8097bd:	90                   	nop
	sbp->root->parent = sbp->root;
  8097be:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8097c2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8097c5:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8097c9:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  8097cc:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
	sbp->root->dir_ops = &FAT32_dentry_ops;
  8097d0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8097d4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8097d7:	48 c7 40 40 20 b1 80 	mov    QWORD PTR [rax+0x40],0x80b120
  8097de:	00 
	sbp->root->name = (char *)vmalloc(2,0);
  8097df:	be 00 00 00 00       	mov    esi,0x0
  8097e4:	bf 02 00 00 00       	mov    edi,0x2
  8097e9:	b8 00 00 00 00       	mov    eax,0x0
  8097ee:	e8 31 79 ff ff       	call   801124 <vmalloc>
  8097f3:	48 89 c2             	mov    rdx,rax
  8097f6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8097fa:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8097fd:	48 89 10             	mov    QWORD PTR [rax],rdx
	sbp->root->name[0] = '/';
  809800:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809804:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809807:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80980a:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
	sbp->root->name_length = 1;
  80980d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809811:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809814:	c7 40 08 01 00 00 00 	mov    DWORD PTR [rax+0x8],0x1

	////index node
	sbp->root->dir_inode = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  80981b:	be 00 00 00 00       	mov    esi,0x0
  809820:	bf 38 00 00 00       	mov    edi,0x38
  809825:	b8 00 00 00 00       	mov    eax,0x0
  80982a:	e8 f5 78 ff ff       	call   801124 <vmalloc>
  80982f:	48 89 c2             	mov    rdx,rax
  809832:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809836:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809839:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(sbp->root->dir_inode,0,sizeof(struct index_node));
  80983d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809841:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809844:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809848:	ba 38 00 00 00       	mov    edx,0x38
  80984d:	be 00 00 00 00       	mov    esi,0x0
  809852:	48 89 c7             	mov    rdi,rax
  809855:	e8 26 0d 00 00       	call   80a580 <memset>
	sbp->root->dir_inode->inode_ops = &FAT32_inode_ops;
  80985a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80985e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809861:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809865:	48 c7 40 28 e0 b0 80 	mov    QWORD PTR [rax+0x28],0x80b0e0
  80986c:	00 
	sbp->root->dir_inode->f_ops = &FAT32_file_ops;
  80986d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809871:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809874:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809878:	48 c7 40 20 a0 b0 80 	mov    QWORD PTR [rax+0x20],0x80b0a0
  80987f:	00 
	sbp->root->dir_inode->file_size = 0;
  809880:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809884:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809887:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80988b:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
	sbp->root->dir_inode->blocks = (sbp->root->dir_inode->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  809892:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809896:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809899:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80989d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8098a0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8098a4:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8098a8:	48 01 d0             	add    rax,rdx
  8098ab:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  8098af:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8098b3:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  8098b7:	48 89 c6             	mov    rsi,rax
  8098ba:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8098be:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8098c1:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  8098c5:	48 89 d0             	mov    rax,rdx
  8098c8:	ba 00 00 00 00       	mov    edx,0x0
  8098cd:	48 f7 f6             	div    rsi
  8098d0:	48 89 41 08          	mov    QWORD PTR [rcx+0x8],rax
	sbp->root->dir_inode->attribute = FS_ATTR_DIR;
  8098d4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8098d8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8098db:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8098df:	48 c7 40 10 02 00 00 	mov    QWORD PTR [rax+0x10],0x2
  8098e6:	00 
	sbp->root->dir_inode->sb = sbp;
  8098e7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8098eb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8098ee:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8098f2:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8098f6:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx

	////fat32 root inode
	sbp->root->dir_inode->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  8098fa:	be 00 00 00 00       	mov    esi,0x0
  8098ff:	bf 20 00 00 00       	mov    edi,0x20
  809904:	b8 00 00 00 00       	mov    eax,0x0
  809909:	e8 16 78 ff ff       	call   801124 <vmalloc>
  80990e:	48 89 c2             	mov    rdx,rax
  809911:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809915:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809918:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80991c:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(sbp->root->dir_inode->private_index_info,0,sizeof(struct FAT32_inode_info));
  809920:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809924:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809927:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80992b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80992f:	ba 20 00 00 00       	mov    edx,0x20
  809934:	be 00 00 00 00       	mov    esi,0x0
  809939:	48 89 c7             	mov    rdi,rax
  80993c:	e8 3f 0c 00 00       	call   80a580 <memset>
	finode = (struct FAT32_inode_info *)sbp->root->dir_inode->private_index_info;
  809941:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809945:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809948:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80994c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809950:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	finode->first_cluster = fbs->BPB_RootClus;
  809954:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809958:	8b 40 2c             	mov    eax,DWORD PTR [rax+0x2c]
  80995b:	89 c2                	mov    edx,eax
  80995d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809961:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = 0;
  809964:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809968:	48 c7 40 08 00 00 00 	mov    QWORD PTR [rax+0x8],0x0
  80996f:	00 
	finode->dentry_position = 0; 
  809970:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809974:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  80997b:	00 
	finode->create_date = 0;
  80997c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809980:	66 c7 40 18 00 00    	mov    WORD PTR [rax+0x18],0x0
	finode->create_time = 0;
  809986:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80998a:	66 c7 40 1a 00 00    	mov    WORD PTR [rax+0x1a],0x0
	finode->write_date = 0;
  809990:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809994:	66 c7 40 1c 00 00    	mov    WORD PTR [rax+0x1c],0x0
	finode->write_time = 0;
  80999a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80999e:	66 c7 40 1e 00 00    	mov    WORD PTR [rax+0x1e],0x0

	return sbp;
  8099a4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  8099a8:	c9                   	leave  
  8099a9:	c3                   	ret    

00000000008099aa <DISK1_FAT32_FS_init>:
	.read_superblock = fat32_read_superblock,
	.next = NULL,
};

void DISK1_FAT32_FS_init()
{
  8099aa:	f3 0f 1e fa          	endbr64 
  8099ae:	55                   	push   rbp
  8099af:	48 89 e5             	mov    rbp,rsp
  8099b2:	48 81 ec 10 04 00 00 	sub    rsp,0x410
	int i;
	unsigned char buf[512];
	struct dir_entry * dentry = NULL;
  8099b9:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8099c0:	00 
	struct Disk_Partition_Table DPT = {0};
  8099c1:	48 8d 95 f0 fb ff ff 	lea    rdx,[rbp-0x410]
  8099c8:	b8 00 00 00 00       	mov    eax,0x0
  8099cd:	b9 40 00 00 00       	mov    ecx,0x40
  8099d2:	48 89 d7             	mov    rdi,rdx
  8099d5:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax

	register_filesystem(&FAT32_fs_type);
  8099d8:	bf 60 b1 80 00       	mov    edi,0x80b160
  8099dd:	e8 bc ca ff ff       	call   80649e <register_filesystem>
	
	memset(buf,0,512);
  8099e2:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  8099e9:	ba 00 02 00 00       	mov    edx,0x200
  8099ee:	be 00 00 00 00       	mov    esi,0x0
  8099f3:	48 89 c7             	mov    rdi,rax
  8099f6:	e8 85 0b 00 00       	call   80a580 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,0x0,1,(unsigned char *)buf);
  8099fb:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  809a02:	49 89 c0             	mov    r8,rax
  809a05:	b9 01 00 00 00       	mov    ecx,0x1
  809a0a:	ba 00 00 00 00       	mov    edx,0x0
  809a0f:	be 00 00 00 00       	mov    esi,0x0
  809a14:	bf 00 00 00 00       	mov    edi,0x0
  809a19:	e8 39 d0 ff ff       	call   806a57 <request>
  809a1e:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    chk_result(r);
  809a21:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809a24:	89 c7                	mov    edi,eax
  809a26:	e8 e0 d6 ff ff       	call   80710b <chk_result>
    DPT = *(struct Disk_Partition_Table *)buf;
  809a2b:	48 8d 95 f0 fd ff ff 	lea    rdx,[rbp-0x210]
  809a32:	48 8d 85 f0 fb ff ff 	lea    rax,[rbp-0x410]
  809a39:	48 89 d6             	mov    rsi,rdx
  809a3c:	ba 40 00 00 00       	mov    edx,0x40
  809a41:	48 89 c7             	mov    rdi,rax
  809a44:	48 89 d1             	mov    rcx,rdx
  809a47:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
	printf("DPTE[0] start_LBA:%#x\ttype:%x\n",DPT.DPTE[0].start_LBA,DPT.DPTE[0].type);
  809a4a:	0f b6 85 b2 fd ff ff 	movzx  eax,BYTE PTR [rbp-0x24e]
  809a51:	0f b6 d0             	movzx  edx,al
  809a54:	8b 85 b6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x24a]
  809a5a:	89 c6                	mov    esi,eax
  809a5c:	bf e0 30 81 00       	mov    edi,0x8130e0
  809a61:	b8 00 00 00 00       	mov    eax,0x0
  809a66:	e8 a1 72 ff ff       	call   800d0c <printf>

	memset(buf,0,512);
  809a6b:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  809a72:	ba 00 02 00 00       	mov    edx,0x200
  809a77:	be 00 00 00 00       	mov    esi,0x0
  809a7c:	48 89 c7             	mov    rdi,rax
  809a7f:	e8 fc 0a 00 00       	call   80a580 <memset>
	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPT.DPTE[0].start_LBA,1,(unsigned char *)buf);
  809a84:	8b 85 b6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x24a]
  809a8a:	89 c2                	mov    edx,eax
  809a8c:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  809a93:	49 89 c0             	mov    r8,rax
  809a96:	b9 01 00 00 00       	mov    ecx,0x1
  809a9b:	be 00 00 00 00       	mov    esi,0x0
  809aa0:	bf 00 00 00 00       	mov    edi,0x0
  809aa5:	e8 ad cf ff ff       	call   806a57 <request>
  809aaa:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    chk_result(r1);
  809aad:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809ab0:	89 c7                	mov    edi,eax
  809ab2:	e8 54 d6 ff ff       	call   80710b <chk_result>

	root_sb = mount_fs("FAT32",&DPT.DPTE[0],buf);	//not dev node
  809ab7:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  809abe:	48 8d 95 f0 fb ff ff 	lea    rdx,[rbp-0x410]
  809ac5:	48 8d 8a be 01 00 00 	lea    rcx,[rdx+0x1be]
  809acc:	48 89 c2             	mov    rdx,rax
  809acf:	48 89 ce             	mov    rsi,rcx
  809ad2:	bf d9 30 81 00       	mov    edi,0x8130d9
  809ad7:	e8 4a c9 ff ff       	call   806426 <mount_fs>
  809adc:	48 89 05 a5 da c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1daa5],rax        # 427588 <root_sb>
}
  809ae3:	90                   	nop
  809ae4:	c9                   	leave  
  809ae5:	c3                   	ret    

0000000000809ae6 <scrdown>:
//{
//    video_base=addr;
//    m_ptr=addr;
//}
void scrdown(void)
{
  809ae6:	f3 0f 1e fa          	endbr64 
  809aea:	55                   	push   rbp
  809aeb:	48 89 e5             	mov    rbp,rsp
    vpage_base+=SCREEN_W*2;
  809aee:	48 8b 05 13 0a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20a13]        # 42a508 <vpage_base>
  809af5:	48 05 a0 00 00 00    	add    rax,0xa0
  809afb:	48 89 05 06 0a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20a06],rax        # 42a508 <vpage_base>
    page_boffset+=SCREEN_W*2;
  809b02:	8b 05 08 0a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20a08]        # 42a510 <page_boffset>
  809b08:	05 a0 00 00 00       	add    eax,0xa0
  809b0d:	89 05 fd 09 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc209fd],eax        # 42a510 <page_boffset>
    if(vpage_base>=video_end)
  809b13:	48 8b 15 ee 09 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc209ee]        # 42a508 <vpage_base>
  809b1a:	48 8b 05 df 09 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc209df]        # 42a500 <video_end>
  809b21:	48 39 c2             	cmp    rdx,rax
  809b24:	72 0e                	jb     809b34 <scrdown+0x4e>
        vpage_base=video_base;
  809b26:	48 8b 05 cb 09 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc209cb]        # 42a4f8 <video_base>
  809b2d:	48 89 05 d4 09 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc209d4],rax        # 42a508 <vpage_base>
    set_origin();
  809b34:	b8 00 00 00 00       	mov    eax,0x0
  809b39:	e8 6a 00 00 00       	call   809ba8 <set_origin>
}
  809b3e:	90                   	nop
  809b3f:	5d                   	pop    rbp
  809b40:	c3                   	ret    

0000000000809b41 <scrup>:
void scrup()
{
  809b41:	f3 0f 1e fa          	endbr64 
  809b45:	55                   	push   rbp
  809b46:	48 89 e5             	mov    rbp,rsp
    if(page_boffset<=0)
  809b49:	8b 05 c1 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc209c1]        # 42a510 <page_boffset>
  809b4f:	85 c0                	test   eax,eax
  809b51:	75 24                	jne    809b77 <scrup+0x36>
    {
        page_boffset=0;
  809b53:	c7 05 b3 09 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc209b3],0x0        # 42a510 <page_boffset>
  809b5a:	00 00 00 
        vpage_base=video_base;
  809b5d:	48 8b 05 94 09 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20994]        # 42a4f8 <video_base>
  809b64:	48 89 05 9d 09 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2099d],rax        # 42a508 <vpage_base>
        set_origin();
  809b6b:	b8 00 00 00 00       	mov    eax,0x0
  809b70:	e8 33 00 00 00       	call   809ba8 <set_origin>
        return;
  809b75:	eb 2f                	jmp    809ba6 <scrup+0x65>
    }
    vpage_base-=SCREEN_W*2;
  809b77:	48 8b 05 8a 09 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2098a]        # 42a508 <vpage_base>
  809b7e:	48 2d a0 00 00 00    	sub    rax,0xa0
  809b84:	48 89 05 7d 09 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2097d],rax        # 42a508 <vpage_base>
    page_boffset-=SCREEN_W*2;
  809b8b:	8b 05 7f 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2097f]        # 42a510 <page_boffset>
  809b91:	2d a0 00 00 00       	sub    eax,0xa0
  809b96:	89 05 74 09 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20974],eax        # 42a510 <page_boffset>
    set_origin();
  809b9c:	b8 00 00 00 00       	mov    eax,0x0
  809ba1:	e8 02 00 00 00       	call   809ba8 <set_origin>
}
  809ba6:	5d                   	pop    rbp
  809ba7:	c3                   	ret    

0000000000809ba8 <set_origin>:
void set_origin(void)
{
  809ba8:	f3 0f 1e fa          	endbr64 
  809bac:	55                   	push   rbp
  809bad:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  809bb0:	fa                   	cli    
    outb(port_reg_index,12);
  809bb1:	8b 05 69 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20969]        # 42a520 <port_reg_index>
  809bb7:	0f b7 c0             	movzx  eax,ax
  809bba:	be 0c 00 00 00       	mov    esi,0xc
  809bbf:	89 c7                	mov    edi,eax
  809bc1:	e8 4a b2 ff ff       	call   804e10 <outb>
    outb(port_reg_v,(page_boffset>>9)&0xff);
  809bc6:	8b 05 44 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20944]        # 42a510 <page_boffset>
  809bcc:	c1 e8 09             	shr    eax,0x9
  809bcf:	0f b6 d0             	movzx  edx,al
  809bd2:	8b 05 4c 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2094c]        # 42a524 <port_reg_v>
  809bd8:	0f b7 c0             	movzx  eax,ax
  809bdb:	89 d6                	mov    esi,edx
  809bdd:	89 c7                	mov    edi,eax
  809bdf:	e8 2c b2 ff ff       	call   804e10 <outb>
    outb(port_reg_index,13);
  809be4:	8b 05 36 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20936]        # 42a520 <port_reg_index>
  809bea:	0f b7 c0             	movzx  eax,ax
  809bed:	be 0d 00 00 00       	mov    esi,0xd
  809bf2:	89 c7                	mov    edi,eax
  809bf4:	e8 17 b2 ff ff       	call   804e10 <outb>
    outb(port_reg_v,(page_boffset>>1)&0xff);
  809bf9:	8b 05 11 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20911]        # 42a510 <page_boffset>
  809bff:	d1 e8                	shr    eax,1
  809c01:	0f b6 d0             	movzx  edx,al
  809c04:	8b 05 1a 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2091a]        # 42a524 <port_reg_v>
  809c0a:	0f b7 c0             	movzx  eax,ax
  809c0d:	89 d6                	mov    esi,edx
  809c0f:	89 c7                	mov    edi,eax
  809c11:	e8 fa b1 ff ff       	call   804e10 <outb>
    asm volatile("sti");
  809c16:	fb                   	sti    

}
  809c17:	90                   	nop
  809c18:	5d                   	pop    rbp
  809c19:	c3                   	ret    

0000000000809c1a <init_tty>:
        .type=DEV_TYPE_CHRDEV,
        .flag=DEV_FLAG_USED,
        .drv=&drv_tty
};
void init_tty()
{
  809c1a:	f3 0f 1e fa          	endbr64 
  809c1e:	55                   	push   rbp
  809c1f:	48 89 e5             	mov    rbp,rsp
  809c22:	48 83 ec 10          	sub    rsp,0x10
    strcpy(dev_tty.name,"tty0");
  809c26:	be 08 33 81 00       	mov    esi,0x813308
  809c2b:	bf b4 31 81 00       	mov    edi,0x8131b4
  809c30:	e8 9a 09 00 00       	call   80a5cf <strcpy>
    strcpy(dev_stdout.name,"stdout");
  809c35:	be 0d 33 81 00       	mov    esi,0x81330d
  809c3a:	bf 74 32 81 00       	mov    edi,0x813274
  809c3f:	e8 8b 09 00 00       	call   80a5cf <strcpy>
    reg_driver(&drv_tty);
  809c44:	bf 00 31 81 00       	mov    edi,0x813100
  809c49:	e8 27 91 ff ff       	call   802d75 <reg_driver>
    reg_device(&dev_tty);
  809c4e:	bf a0 31 81 00       	mov    edi,0x8131a0
  809c53:	e8 35 8e ff ff       	call   802a8d <reg_device>
    reg_device(&dev_stdout);
  809c58:	bf 60 32 81 00       	mov    edi,0x813260
  809c5d:	e8 2b 8e ff ff       	call   802a8d <reg_device>
    unsigned char *vp=0x20000;
  809c62:	48 c7 45 f8 00 00 02 	mov    QWORD PTR [rbp-0x8],0x20000
  809c69:	00 
    if(*vp==0x7)
  809c6a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809c6e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809c71:	3c 07                	cmp    al,0x7
  809c73:	75 36                	jne    809cab <init_tty+0x91>
    {
        video_mode=VIDEO_MONOTEXT;
  809c75:	c7 05 95 08 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20895],0x0        # 42a514 <video_mode>
  809c7c:	00 00 00 
        video_base=0xb0000;
  809c7f:	48 c7 05 6e 08 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2086e],0xb0000        # 42a4f8 <video_base>
  809c86:	00 00 0b 00 
        video_end=0xb8000-1;
  809c8a:	48 c7 05 6b 08 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2086b],0xb7fff        # 42a500 <video_end>
  809c91:	ff 7f 0b 00 
        port_reg_index=0x3b4;
  809c95:	c7 05 81 08 c2 ff b4 	mov    DWORD PTR [rip+0xffffffffffc20881],0x3b4        # 42a520 <port_reg_index>
  809c9c:	03 00 00 
        port_reg_v=0x3b5;
  809c9f:	c7 05 7b 08 c2 ff b5 	mov    DWORD PTR [rip+0xffffffffffc2087b],0x3b5        # 42a524 <port_reg_v>
  809ca6:	03 00 00 
  809ca9:	eb 61                	jmp    809d0c <init_tty+0xf2>
    }else if(*vp<=0x3)
  809cab:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809caf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809cb2:	3c 03                	cmp    al,0x3
  809cb4:	77 36                	ja     809cec <init_tty+0xd2>
    {
        video_mode=VIDEO_CHROMATEXT;
  809cb6:	c7 05 54 08 c2 ff 01 	mov    DWORD PTR [rip+0xffffffffffc20854],0x1        # 42a514 <video_mode>
  809cbd:	00 00 00 
        video_base=0xb8000;
  809cc0:	48 c7 05 2d 08 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2082d],0xb8000        # 42a4f8 <video_base>
  809cc7:	00 80 0b 00 
        video_end=0xc0000-1;
  809ccb:	48 c7 05 2a 08 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2082a],0xbffff        # 42a500 <video_end>
  809cd2:	ff ff 0b 00 
        port_reg_index=0x3d4;
  809cd6:	c7 05 40 08 c2 ff d4 	mov    DWORD PTR [rip+0xffffffffffc20840],0x3d4        # 42a520 <port_reg_index>
  809cdd:	03 00 00 
        port_reg_v=0x3d5;
  809ce0:	c7 05 3a 08 c2 ff d5 	mov    DWORD PTR [rip+0xffffffffffc2083a],0x3d5        # 42a524 <port_reg_v>
  809ce7:	03 00 00 
  809cea:	eb 20                	jmp    809d0c <init_tty+0xf2>
    }else{
        video_mode=VIDEO_GRAPHICS;
  809cec:	c7 05 1e 08 c2 ff 02 	mov    DWORD PTR [rip+0xffffffffffc2081e],0x2        # 42a514 <video_mode>
  809cf3:	00 00 00 
        video_base=0xa0000;
  809cf6:	48 c7 05 f7 07 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc207f7],0xa0000        # 42a4f8 <video_base>
  809cfd:	00 00 0a 00 
        video_end=0xb0000-1;
  809d01:	48 c7 05 f4 07 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc207f4],0xaffff        # 42a500 <video_end>
  809d08:	ff ff 0a 00 
    }
    if(*vp<=0x1)line_chs=40;
  809d0c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d10:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d13:	3c 01                	cmp    al,0x1
  809d15:	77 0f                	ja     809d26 <init_tty+0x10c>
  809d17:	c7 05 fb 07 c2 ff 28 	mov    DWORD PTR [rip+0xffffffffffc207fb],0x28        # 42a51c <line_chs>
  809d1e:	00 00 00 
  809d21:	e9 91 00 00 00       	jmp    809db7 <init_tty+0x19d>
    else if(*vp<=0x3||*vp==0x7)line_chs=80;
  809d26:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d2a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d2d:	3c 03                	cmp    al,0x3
  809d2f:	76 0b                	jbe    809d3c <init_tty+0x122>
  809d31:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d35:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d38:	3c 07                	cmp    al,0x7
  809d3a:	75 0c                	jne    809d48 <init_tty+0x12e>
  809d3c:	c7 05 d6 07 c2 ff 50 	mov    DWORD PTR [rip+0xffffffffffc207d6],0x50        # 42a51c <line_chs>
  809d43:	00 00 00 
  809d46:	eb 6f                	jmp    809db7 <init_tty+0x19d>
    else if(*vp<=0x5||*vp==0x9||*vp==0xd)line_chs=320;
  809d48:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d4c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d4f:	3c 05                	cmp    al,0x5
  809d51:	76 16                	jbe    809d69 <init_tty+0x14f>
  809d53:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d57:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d5a:	3c 09                	cmp    al,0x9
  809d5c:	74 0b                	je     809d69 <init_tty+0x14f>
  809d5e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d62:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d65:	3c 0d                	cmp    al,0xd
  809d67:	75 0c                	jne    809d75 <init_tty+0x15b>
  809d69:	c7 05 a9 07 c2 ff 40 	mov    DWORD PTR [rip+0xffffffffffc207a9],0x140        # 42a51c <line_chs>
  809d70:	01 00 00 
  809d73:	eb 42                	jmp    809db7 <init_tty+0x19d>
    else if(*vp==0x6||*vp==0xa||*vp>=0xe)line_chs=640;
  809d75:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d79:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d7c:	3c 06                	cmp    al,0x6
  809d7e:	74 16                	je     809d96 <init_tty+0x17c>
  809d80:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d84:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d87:	3c 0a                	cmp    al,0xa
  809d89:	74 0b                	je     809d96 <init_tty+0x17c>
  809d8b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d8f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d92:	3c 0d                	cmp    al,0xd
  809d94:	76 0c                	jbe    809da2 <init_tty+0x188>
  809d96:	c7 05 7c 07 c2 ff 80 	mov    DWORD PTR [rip+0xffffffffffc2077c],0x280        # 42a51c <line_chs>
  809d9d:	02 00 00 
  809da0:	eb 15                	jmp    809db7 <init_tty+0x19d>
    else if(*vp==0x8)line_chs=160;
  809da2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809da6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809da9:	3c 08                	cmp    al,0x8
  809dab:	75 0a                	jne    809db7 <init_tty+0x19d>
  809dad:	c7 05 65 07 c2 ff a0 	mov    DWORD PTR [rip+0xffffffffffc20765],0xa0        # 42a51c <line_chs>
  809db4:	00 00 00 
    switch (*vp)
  809db7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809dbb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809dbe:	0f b6 c0             	movzx  eax,al
  809dc1:	83 f8 14             	cmp    eax,0x14
  809dc4:	77 61                	ja     809e27 <init_tty+0x20d>
  809dc6:	89 c0                	mov    eax,eax
  809dc8:	48 8b 04 c5 18 33 81 	mov    rax,QWORD PTR [rax*8+0x813318]
  809dcf:	00 
  809dd0:	3e ff e0             	notrack jmp rax
    {
    case 0x0:case 0x1:vpage_size=40*25;break;
  809dd3:	c7 05 4b 07 c2 ff e8 	mov    DWORD PTR [rip+0xffffffffffc2074b],0x3e8        # 42a528 <vpage_size>
  809dda:	03 00 00 
  809ddd:	eb 49                	jmp    809e28 <init_tty+0x20e>
    case 2:case 3:case 7:vpage_size=80*25;break;
  809ddf:	c7 05 3f 07 c2 ff d0 	mov    DWORD PTR [rip+0xffffffffffc2073f],0x7d0        # 42a528 <vpage_size>
  809de6:	07 00 00 
  809de9:	eb 3d                	jmp    809e28 <init_tty+0x20e>
    case 4:case 5:case 9:case 0xd:vpage_size=320*200;break;
  809deb:	c7 05 33 07 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20733],0xfa00        # 42a528 <vpage_size>
  809df2:	fa 00 00 
  809df5:	eb 31                	jmp    809e28 <init_tty+0x20e>
    case 6:case 0xa:case 0xe:vpage_size=640*200;break;
  809df7:	c7 05 27 07 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20727],0x1f400        # 42a528 <vpage_size>
  809dfe:	f4 01 00 
  809e01:	eb 25                	jmp    809e28 <init_tty+0x20e>
    case 8:vpage_size=160*200;break;
  809e03:	c7 05 1b 07 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc2071b],0x7d00        # 42a528 <vpage_size>
  809e0a:	7d 00 00 
  809e0d:	eb 19                	jmp    809e28 <init_tty+0x20e>
    case 0xf:case 0x10:case 0x11:vpage_size=640*350;break;
  809e0f:	c7 05 0f 07 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc2070f],0x36b00        # 42a528 <vpage_size>
  809e16:	6b 03 00 
  809e19:	eb 0d                	jmp    809e28 <init_tty+0x20e>
    case 0x12:case 0x13:case 0x14:vpage_size=640*480;break;
  809e1b:	c7 05 03 07 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20703],0x4b000        # 42a528 <vpage_size>
  809e22:	b0 04 00 
  809e25:	eb 01                	jmp    809e28 <init_tty+0x20e>
    default:
        break;
  809e27:	90                   	nop
    }
    m_ptr=video_base;
  809e28:	48 8b 05 c9 06 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc206c9]        # 42a4f8 <video_base>
  809e2f:	48 89 05 4a 13 00 00 	mov    QWORD PTR [rip+0x134a],rax        # 80b180 <m_ptr>
    page_boffset=0;
  809e36:	c7 05 d0 06 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc206d0],0x0        # 42a510 <page_boffset>
  809e3d:	00 00 00 
    vpage_base=video_base;
  809e40:	48 8b 05 b1 06 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc206b1]        # 42a4f8 <video_base>
  809e47:	48 89 05 ba 06 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc206ba],rax        # 42a508 <vpage_base>
    vp++;
  809e4e:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    vpage=*vp;
  809e53:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809e57:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809e5a:	0f b6 c0             	movzx  eax,al
  809e5d:	89 05 b5 06 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc206b5],eax        # 42a518 <vpage>
    vp++;
  809e63:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    stline=*vp++;
  809e68:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809e6c:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809e70:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  809e74:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809e77:	0f b6 c0             	movzx  eax,al
  809e7a:	89 05 b4 06 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc206b4],eax        # 42a534 <stline>
    endline=*vp++;
  809e80:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809e84:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809e88:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  809e8c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809e8f:	0f b6 c0             	movzx  eax,al
  809e92:	89 05 a0 06 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc206a0],eax        # 42a538 <endline>
    videoy=*vp++;
  809e98:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809e9c:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809ea0:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  809ea4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809ea7:	0f b6 c0             	movzx  eax,al
  809eaa:	89 05 80 06 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20680],eax        # 42a530 <videoy>
    videox=*vp;
  809eb0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809eb4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809eb7:	0f b6 c0             	movzx  eax,al
  809eba:	89 05 6c 06 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2066c],eax        # 42a52c <videox>
    //logf("video:\n mode:0x%x cursor:%d,%d\n",video_mode,\
    videoy,videox);
}
  809ec0:	90                   	nop
  809ec1:	c9                   	leave  
  809ec2:	c3                   	ret    

0000000000809ec3 <seek_tty>:
char m_color=MONITOR_WHITE;
int seek_tty(driver_args * args)
{
  809ec3:	f3 0f 1e fa          	endbr64 
  809ec7:	55                   	push   rbp
  809ec8:	48 89 e5             	mov    rbp,rsp
  809ecb:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pos=args->pos;
  809ecf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809ed3:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  809ed6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    m_ptr=0xb8000+pos*2;
  809ed9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809edc:	05 00 c0 05 00       	add    eax,0x5c000
  809ee1:	01 c0                	add    eax,eax
  809ee3:	48 98                	cdqe   
  809ee5:	48 89 05 94 12 00 00 	mov    QWORD PTR [rip+0x1294],rax        # 80b180 <m_ptr>
}
  809eec:	90                   	nop
  809eed:	5d                   	pop    rbp
  809eee:	c3                   	ret    

0000000000809eef <tell_monitor>:
int tell_monitor()
{
  809eef:	f3 0f 1e fa          	endbr64 
  809ef3:	55                   	push   rbp
  809ef4:	48 89 e5             	mov    rbp,rsp
    return (m_ptr-video_base)/2;
  809ef7:	48 8b 05 82 12 00 00 	mov    rax,QWORD PTR [rip+0x1282]        # 80b180 <m_ptr>
  809efe:	48 8b 15 f3 05 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc205f3]        # 42a4f8 <video_base>
  809f05:	48 29 d0             	sub    rax,rdx
  809f08:	48 89 c2             	mov    rdx,rax
  809f0b:	48 c1 ea 3f          	shr    rdx,0x3f
  809f0f:	48 01 d0             	add    rax,rdx
  809f12:	48 d1 f8             	sar    rax,1
}
  809f15:	5d                   	pop    rbp
  809f16:	c3                   	ret    

0000000000809f17 <del_ch>:
void del_ch()
{
  809f17:	f3 0f 1e fa          	endbr64 
  809f1b:	55                   	push   rbp
  809f1c:	48 89 e5             	mov    rbp,rsp
  809f1f:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
    char *p=m_ptr-2;
  809f26:	48 8b 05 53 12 00 00 	mov    rax,QWORD PTR [rip+0x1253]        # 80b180 <m_ptr>
  809f2d:	48 83 e8 02          	sub    rax,0x2
  809f31:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int pos=tell_monitor()%SCREEN_W;
  809f35:	b8 00 00 00 00       	mov    eax,0x0
  809f3a:	e8 b0 ff ff ff       	call   809eef <tell_monitor>
  809f3f:	89 c2                	mov    edx,eax
  809f41:	48 63 c2             	movsxd rax,edx
  809f44:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  809f4b:	48 c1 e8 20          	shr    rax,0x20
  809f4f:	c1 f8 05             	sar    eax,0x5
  809f52:	89 d1                	mov    ecx,edx
  809f54:	c1 f9 1f             	sar    ecx,0x1f
  809f57:	29 c8                	sub    eax,ecx
  809f59:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  809f5c:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  809f5f:	89 c8                	mov    eax,ecx
  809f61:	c1 e0 02             	shl    eax,0x2
  809f64:	01 c8                	add    eax,ecx
  809f66:	c1 e0 04             	shl    eax,0x4
  809f69:	29 c2                	sub    edx,eax
  809f6b:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
    for(;pos<SCREEN_W-1;pos++)
  809f6e:	eb 17                	jmp    809f87 <del_ch+0x70>
    {
        *p=*(p+2);
  809f70:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809f74:	0f b6 50 02          	movzx  edx,BYTE PTR [rax+0x2]
  809f78:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809f7c:	88 10                	mov    BYTE PTR [rax],dl
        p+=2;
  809f7e:	48 83 45 f8 02       	add    QWORD PTR [rbp-0x8],0x2
    for(;pos<SCREEN_W-1;pos++)
  809f83:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  809f87:	83 7d f4 4e          	cmp    DWORD PTR [rbp-0xc],0x4e
  809f8b:	7e e3                	jle    809f70 <del_ch+0x59>
    }
    driver_args args= {
  809f8d:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  809f94:	b8 00 00 00 00       	mov    eax,0x0
  809f99:	b9 18 00 00 00       	mov    ecx,0x18
  809f9e:	48 89 d7             	mov    rdi,rdx
  809fa1:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .pos=tell_monitor() - 1
  809fa4:	b8 00 00 00 00       	mov    eax,0x0
  809fa9:	e8 41 ff ff ff       	call   809eef <tell_monitor>
  809fae:	83 e8 01             	sub    eax,0x1
    driver_args args= {
  809fb1:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    };
    seek_tty(&args);
  809fb7:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  809fbe:	48 89 c7             	mov    rdi,rax
  809fc1:	e8 fd fe ff ff       	call   809ec3 <seek_tty>
    set_cur();
  809fc6:	b8 00 00 00 00       	mov    eax,0x0
  809fcb:	e8 03 00 00 00       	call   809fd3 <set_cur>
}
  809fd0:	90                   	nop
  809fd1:	c9                   	leave  
  809fd2:	c3                   	ret    

0000000000809fd3 <set_cur>:
void set_cur()
{
  809fd3:	f3 0f 1e fa          	endbr64 
  809fd7:	55                   	push   rbp
  809fd8:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  809fdb:	fa                   	cli    
    outb(port_reg_index,14);
  809fdc:	8b 05 3e 05 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2053e]        # 42a520 <port_reg_index>
  809fe2:	0f b7 c0             	movzx  eax,ax
  809fe5:	be 0e 00 00 00       	mov    esi,0xe
  809fea:	89 c7                	mov    edi,eax
  809fec:	e8 1f ae ff ff       	call   804e10 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>9)&0xff);
  809ff1:	48 8b 05 88 11 00 00 	mov    rax,QWORD PTR [rip+0x1188]        # 80b180 <m_ptr>
  809ff8:	48 8b 15 f9 04 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc204f9]        # 42a4f8 <video_base>
  809fff:	48 29 d0             	sub    rax,rdx
  80a002:	48 c1 f8 09          	sar    rax,0x9
  80a006:	0f b6 d0             	movzx  edx,al
  80a009:	8b 05 15 05 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20515]        # 42a524 <port_reg_v>
  80a00f:	0f b7 c0             	movzx  eax,ax
  80a012:	89 d6                	mov    esi,edx
  80a014:	89 c7                	mov    edi,eax
  80a016:	e8 f5 ad ff ff       	call   804e10 <outb>
    outb(port_reg_index,15);
  80a01b:	8b 05 ff 04 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc204ff]        # 42a520 <port_reg_index>
  80a021:	0f b7 c0             	movzx  eax,ax
  80a024:	be 0f 00 00 00       	mov    esi,0xf
  80a029:	89 c7                	mov    edi,eax
  80a02b:	e8 e0 ad ff ff       	call   804e10 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>1)&0xff);
  80a030:	48 8b 05 49 11 00 00 	mov    rax,QWORD PTR [rip+0x1149]        # 80b180 <m_ptr>
  80a037:	48 8b 15 ba 04 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc204ba]        # 42a4f8 <video_base>
  80a03e:	48 29 d0             	sub    rax,rdx
  80a041:	48 d1 f8             	sar    rax,1
  80a044:	0f b6 d0             	movzx  edx,al
  80a047:	8b 05 d7 04 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc204d7]        # 42a524 <port_reg_v>
  80a04d:	0f b7 c0             	movzx  eax,ax
  80a050:	89 d6                	mov    esi,edx
  80a052:	89 c7                	mov    edi,eax
  80a054:	e8 b7 ad ff ff       	call   804e10 <outb>
    asm volatile("sti");
  80a059:	fb                   	sti    
}
  80a05a:	90                   	nop
  80a05b:	5d                   	pop    rbp
  80a05c:	c3                   	ret    

000000000080a05d <read_tty>:

int read_tty(driver_args *args)
{
  80a05d:	f3 0f 1e fa          	endbr64 
  80a061:	55                   	push   rbp
  80a062:	48 89 e5             	mov    rbp,rsp
  80a065:	48 83 ec 20          	sub    rsp,0x20
  80a069:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    char* dist=args->dist_addr;
  80a06d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a071:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80a074:	48 98                	cdqe   
  80a076:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  80a07a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a07e:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  80a081:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  80a084:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80a08b:	eb 4a                	jmp    80a0d7 <read_tty+0x7a>
    {
        *dist++=*m_ptr;
  80a08d:	48 8b 15 ec 10 00 00 	mov    rdx,QWORD PTR [rip+0x10ec]        # 80b180 <m_ptr>
  80a094:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a098:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80a09c:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80a0a0:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80a0a3:	88 10                	mov    BYTE PTR [rax],dl
        if(m_ptr==0xbffff&&i>0)
  80a0a5:	48 8b 05 d4 10 00 00 	mov    rax,QWORD PTR [rip+0x10d4]        # 80b180 <m_ptr>
  80a0ac:	48 3d ff ff 0b 00    	cmp    rax,0xbffff
  80a0b2:	75 0d                	jne    80a0c1 <read_tty+0x64>
  80a0b4:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80a0b8:	7e 07                	jle    80a0c1 <read_tty+0x64>
        {
            return 1;//读到尾了
  80a0ba:	b8 01 00 00 00       	mov    eax,0x1
  80a0bf:	eb 2d                	jmp    80a0ee <read_tty+0x91>
        }
        m_ptr+=2;
  80a0c1:	48 8b 05 b8 10 00 00 	mov    rax,QWORD PTR [rip+0x10b8]        # 80b180 <m_ptr>
  80a0c8:	48 83 c0 02          	add    rax,0x2
  80a0cc:	48 89 05 ad 10 00 00 	mov    QWORD PTR [rip+0x10ad],rax        # 80b180 <m_ptr>
    for(int i=0;i<len;i++)
  80a0d3:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80a0d7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a0da:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  80a0dd:	7c ae                	jl     80a08d <read_tty+0x30>
    }
    set_cur();
  80a0df:	b8 00 00 00 00       	mov    eax,0x0
  80a0e4:	e8 ea fe ff ff       	call   809fd3 <set_cur>
    return 0;
  80a0e9:	b8 00 00 00 00       	mov    eax,0x0
}
  80a0ee:	c9                   	leave  
  80a0ef:	c3                   	ret    

000000000080a0f0 <write_tty>:
int write_tty(driver_args *args)
{
  80a0f0:	f3 0f 1e fa          	endbr64 
  80a0f4:	55                   	push   rbp
  80a0f5:	48 89 e5             	mov    rbp,rsp
  80a0f8:	48 83 ec 30          	sub    rsp,0x30
  80a0fc:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char* src=args->src_addr;
  80a100:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a104:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a107:	48 98                	cdqe   
  80a109:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  80a10d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a111:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  80a114:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  80a117:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80a11e:	e9 0b 01 00 00       	jmp    80a22e <write_tty+0x13e>
    {
        if(*src=='\n')
  80a123:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a127:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a12a:	3c 0a                	cmp    al,0xa
  80a12c:	75 50                	jne    80a17e <write_tty+0x8e>
        {
            unsigned int off=m_ptr-0xb8000;
  80a12e:	48 8b 05 4b 10 00 00 	mov    rax,QWORD PTR [rip+0x104b]        # 80b180 <m_ptr>
  80a135:	48 2d 00 80 0b 00    	sub    rax,0xb8000
  80a13b:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            off=(off/160+1)*160;
  80a13e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80a141:	89 c2                	mov    edx,eax
  80a143:	b8 cd cc cc cc       	mov    eax,0xcccccccd
  80a148:	48 0f af c2          	imul   rax,rdx
  80a14c:	48 c1 e8 20          	shr    rax,0x20
  80a150:	c1 e8 07             	shr    eax,0x7
  80a153:	8d 50 01             	lea    edx,[rax+0x1]
  80a156:	89 d0                	mov    eax,edx
  80a158:	c1 e0 02             	shl    eax,0x2
  80a15b:	01 d0                	add    eax,edx
  80a15d:	c1 e0 05             	shl    eax,0x5
  80a160:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            ////logf("%x\n",off);
            m_ptr=0xb8000u+off;
  80a163:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80a166:	05 00 80 0b 00       	add    eax,0xb8000
  80a16b:	89 c0                	mov    eax,eax
  80a16d:	48 89 05 0c 10 00 00 	mov    QWORD PTR [rip+0x100c],rax        # 80b180 <m_ptr>
            src++;
  80a174:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
            continue;
  80a179:	e9 ac 00 00 00       	jmp    80a22a <write_tty+0x13a>
        }else if(*src=='\0')
  80a17e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a182:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a185:	84 c0                	test   al,al
  80a187:	0f 84 af 00 00 00    	je     80a23c <write_tty+0x14c>
            break;
        if(*src=='\b')
  80a18d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a191:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a194:	3c 08                	cmp    al,0x8
  80a196:	75 1e                	jne    80a1b6 <write_tty+0xc6>
        {
            m_ptr-=2;
  80a198:	48 8b 05 e1 0f 00 00 	mov    rax,QWORD PTR [rip+0xfe1]        # 80b180 <m_ptr>
  80a19f:	48 83 e8 02          	sub    rax,0x2
  80a1a3:	48 89 05 d6 0f 00 00 	mov    QWORD PTR [rip+0xfd6],rax        # 80b180 <m_ptr>
            *m_ptr=0;
  80a1aa:	48 8b 05 cf 0f 00 00 	mov    rax,QWORD PTR [rip+0xfcf]        # 80b180 <m_ptr>
  80a1b1:	c6 00 00             	mov    BYTE PTR [rax],0x0
  80a1b4:	eb 3e                	jmp    80a1f4 <write_tty+0x104>
        }else
        {
            *m_ptr++=*src++;
  80a1b6:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80a1ba:	48 8d 42 01          	lea    rax,[rdx+0x1]
  80a1be:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  80a1c2:	48 8b 05 b7 0f 00 00 	mov    rax,QWORD PTR [rip+0xfb7]        # 80b180 <m_ptr>
  80a1c9:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80a1cd:	48 89 0d ac 0f 00 00 	mov    QWORD PTR [rip+0xfac],rcx        # 80b180 <m_ptr>
  80a1d4:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80a1d7:	88 10                	mov    BYTE PTR [rax],dl
            *m_ptr++=m_color;
  80a1d9:	48 8b 05 a0 0f 00 00 	mov    rax,QWORD PTR [rip+0xfa0]        # 80b180 <m_ptr>
  80a1e0:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80a1e4:	48 89 15 95 0f 00 00 	mov    QWORD PTR [rip+0xf95],rdx        # 80b180 <m_ptr>
  80a1eb:	0f b6 15 96 0f 00 00 	movzx  edx,BYTE PTR [rip+0xf96]        # 80b188 <m_color>
  80a1f2:	88 10                	mov    BYTE PTR [rax],dl
        }
        if(m_ptr-vpage_base>=vpage_size*2-line_chs*2&&i>0)
  80a1f4:	48 8b 05 85 0f 00 00 	mov    rax,QWORD PTR [rip+0xf85]        # 80b180 <m_ptr>
  80a1fb:	48 8b 0d 06 03 c2 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc20306]        # 42a508 <vpage_base>
  80a202:	48 29 c8             	sub    rax,rcx
  80a205:	48 89 c2             	mov    rdx,rax
  80a208:	8b 05 1a 03 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2031a]        # 42a528 <vpage_size>
  80a20e:	8b 0d 08 03 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc20308]        # 42a51c <line_chs>
  80a214:	29 c8                	sub    eax,ecx
  80a216:	01 c0                	add    eax,eax
  80a218:	48 98                	cdqe   
  80a21a:	48 39 c2             	cmp    rdx,rax
  80a21d:	7c 0b                	jl     80a22a <write_tty+0x13a>
  80a21f:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80a223:	7e 05                	jle    80a22a <write_tty+0x13a>
        {
            //下滚一行
            scrdown();
  80a225:	e8 bc f8 ff ff       	call   809ae6 <scrdown>
    for(int i=0;i<len;i++)
  80a22a:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80a22e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a231:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  80a234:	0f 8c e9 fe ff ff    	jl     80a123 <write_tty+0x33>
  80a23a:	eb 01                	jmp    80a23d <write_tty+0x14d>
            break;
  80a23c:	90                   	nop
        }
    }
    set_cur();
  80a23d:	b8 00 00 00 00       	mov    eax,0x0
  80a242:	e8 8c fd ff ff       	call   809fd3 <set_cur>
    return 0;
  80a247:	b8 00 00 00 00       	mov    eax,0x0
}
  80a24c:	c9                   	leave  
  80a24d:	c3                   	ret    

000000000080a24e <cls>:

void cls(driver_args *args)
{
  80a24e:	f3 0f 1e fa          	endbr64 
  80a252:	55                   	push   rbp
  80a253:	48 89 e5             	mov    rbp,rsp
  80a256:	48 83 ec 20          	sub    rsp,0x20
  80a25a:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<vpage_size*2;i+=2)
  80a25e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80a265:	eb 16                	jmp    80a27d <cls+0x2f>
    {
        vpage_base[i]=0;
  80a267:	48 8b 15 9a 02 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc2029a]        # 42a508 <vpage_base>
  80a26e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a271:	48 98                	cdqe   
  80a273:	48 01 d0             	add    rax,rdx
  80a276:	c6 00 00             	mov    BYTE PTR [rax],0x0
    for(int i=0;i<vpage_size*2;i+=2)
  80a279:	83 45 fc 02          	add    DWORD PTR [rbp-0x4],0x2
  80a27d:	8b 05 a5 02 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc202a5]        # 42a528 <vpage_size>
  80a283:	01 c0                	add    eax,eax
  80a285:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  80a288:	7c dd                	jl     80a267 <cls+0x19>
    }
    m_ptr=vpage_base;
  80a28a:	48 8b 05 77 02 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20277]        # 42a508 <vpage_base>
  80a291:	48 89 05 e8 0e 00 00 	mov    QWORD PTR [rip+0xee8],rax        # 80b180 <m_ptr>
    set_cur();
  80a298:	b8 00 00 00 00       	mov    eax,0x0
  80a29d:	e8 31 fd ff ff       	call   809fd3 <set_cur>
}
  80a2a2:	90                   	nop
  80a2a3:	c9                   	leave  
  80a2a4:	c3                   	ret    

000000000080a2a5 <set_color>:

void set_color(char color)
{
  80a2a5:	f3 0f 1e fa          	endbr64 
  80a2a9:	55                   	push   rbp
  80a2aa:	48 89 e5             	mov    rbp,rsp
  80a2ad:	89 f8                	mov    eax,edi
  80a2af:	88 45 fc             	mov    BYTE PTR [rbp-0x4],al
    m_color=color;
  80a2b2:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80a2b6:	88 05 cc 0e 00 00    	mov    BYTE PTR [rip+0xecc],al        # 80b188 <m_color>
}
  80a2bc:	90                   	nop
  80a2bd:	5d                   	pop    rbp
  80a2be:	c3                   	ret    

000000000080a2bf <tty_do_req>:

int tty_do_req(driver_args *args)
{
  80a2bf:	f3 0f 1e fa          	endbr64 
  80a2c3:	55                   	push   rbp
  80a2c4:	48 89 e5             	mov    rbp,rsp
  80a2c7:	48 83 ec 10          	sub    rsp,0x10
  80a2cb:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    switch (args->cmd)
  80a2cf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a2d3:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  80a2d9:	83 f8 0d             	cmp    eax,0xd
  80a2dc:	74 45                	je     80a323 <tty_do_req+0x64>
  80a2de:	83 f8 0d             	cmp    eax,0xd
  80a2e1:	7f 53                	jg     80a336 <tty_do_req+0x77>
  80a2e3:	83 f8 0c             	cmp    eax,0xc
  80a2e6:	74 2d                	je     80a315 <tty_do_req+0x56>
  80a2e8:	83 f8 0c             	cmp    eax,0xc
  80a2eb:	7f 49                	jg     80a336 <tty_do_req+0x77>
  80a2ed:	83 f8 02             	cmp    eax,0x2
  80a2f0:	74 07                	je     80a2f9 <tty_do_req+0x3a>
  80a2f2:	83 f8 03             	cmp    eax,0x3
  80a2f5:	74 10                	je     80a307 <tty_do_req+0x48>
  80a2f7:	eb 3d                	jmp    80a336 <tty_do_req+0x77>
    {
    case DRVF_READ:
        read_tty(args);
  80a2f9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a2fd:	48 89 c7             	mov    rdi,rax
  80a300:	e8 58 fd ff ff       	call   80a05d <read_tty>
        break;
  80a305:	eb 36                	jmp    80a33d <tty_do_req+0x7e>
    case DRVF_WRITE:
        write_tty(args);
  80a307:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a30b:	48 89 c7             	mov    rdi,rax
  80a30e:	e8 dd fd ff ff       	call   80a0f0 <write_tty>
        break;
  80a313:	eb 28                	jmp    80a33d <tty_do_req+0x7e>
    case DRVF_SEEK:
        seek_tty(args);
  80a315:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a319:	48 89 c7             	mov    rdi,rax
  80a31c:	e8 a2 fb ff ff       	call   809ec3 <seek_tty>
        break;
  80a321:	eb 1a                	jmp    80a33d <tty_do_req+0x7e>
    case DRVF_TELL:
        tell_monitor(args);
  80a323:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a327:	48 89 c7             	mov    rdi,rax
  80a32a:	b8 00 00 00 00       	mov    eax,0x0
  80a32f:	e8 bb fb ff ff       	call   809eef <tell_monitor>
        break;
  80a334:	eb 07                	jmp    80a33d <tty_do_req+0x7e>
    default:return -1;
  80a336:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80a33b:	eb 05                	jmp    80a342 <tty_do_req+0x83>
    }
    return 0;
  80a33d:	b8 00 00 00 00       	mov    eax,0x0
}
  80a342:	c9                   	leave  
  80a343:	c3                   	ret    

000000000080a344 <init_com>:
//
#include "com.h"
#include "int.h"


void init_com(int base_port){
  80a344:	f3 0f 1e fa          	endbr64 
  80a348:	55                   	push   rbp
  80a349:	48 89 e5             	mov    rbp,rsp
  80a34c:	48 83 ec 10          	sub    rsp,0x10
  80a350:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    /* disable all interrupts */
    outb(base_port + COM_REG_IER, 0x00);
  80a353:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a356:	83 c0 01             	add    eax,0x1
  80a359:	0f b7 c0             	movzx  eax,ax
  80a35c:	be 00 00 00 00       	mov    esi,0x0
  80a361:	89 c7                	mov    edi,eax
  80a363:	e8 a8 aa ff ff       	call   804e10 <outb>
    
    /* enable DLAB to set bound rate divisor */
    outb(base_port + COM_REG_LCR, 0x80);
  80a368:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a36b:	83 c0 03             	add    eax,0x3
  80a36e:	0f b7 c0             	movzx  eax,ax
  80a371:	be 80 00 00 00       	mov    esi,0x80
  80a376:	89 c7                	mov    edi,eax
  80a378:	e8 93 aa ff ff       	call   804e10 <outb>
    
    /* set divisor to 38400 baud */
    outb(base_port + COM_REG_DLL, 0x03);
  80a37d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a380:	0f b7 c0             	movzx  eax,ax
  80a383:	be 03 00 00 00       	mov    esi,0x3
  80a388:	89 c7                	mov    edi,eax
  80a38a:	e8 81 aa ff ff       	call   804e10 <outb>
    outb(base_port + COM_REG_DLM, 0x00);
  80a38f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a392:	83 c0 01             	add    eax,0x1
  80a395:	0f b7 c0             	movzx  eax,ax
  80a398:	be 00 00 00 00       	mov    esi,0x0
  80a39d:	89 c7                	mov    edi,eax
  80a39f:	e8 6c aa ff ff       	call   804e10 <outb>
    
    /* 8 data bits, parity off, 1 stop bit, DLAB latch off */
    outb(base_port + COM_REG_LCR, 0x03);
  80a3a4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a3a7:	83 c0 03             	add    eax,0x3
  80a3aa:	0f b7 c0             	movzx  eax,ax
  80a3ad:	be 03 00 00 00       	mov    esi,0x3
  80a3b2:	89 c7                	mov    edi,eax
  80a3b4:	e8 57 aa ff ff       	call   804e10 <outb>
    
    /* enable FIFO */
    outb(base_port + COM_REG_FCR, 0xC7);
  80a3b9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a3bc:	83 c0 02             	add    eax,0x2
  80a3bf:	0f b7 c0             	movzx  eax,ax
  80a3c2:	be c7 00 00 00       	mov    esi,0xc7
  80a3c7:	89 c7                	mov    edi,eax
  80a3c9:	e8 42 aa ff ff       	call   804e10 <outb>

    /* enable IRQs, set RTS/DSR */
    outb(base_port + COM_REG_MCR, 0x0B);
  80a3ce:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a3d1:	83 c0 04             	add    eax,0x4
  80a3d4:	0f b7 c0             	movzx  eax,ax
  80a3d7:	be 0b 00 00 00       	mov    esi,0xb
  80a3dc:	89 c7                	mov    edi,eax
  80a3de:	e8 2d aa ff ff       	call   804e10 <outb>
    
    /* set in loopback mode and test serial chip */
    outb(base_port + COM_REG_MCR, 0x1E);
  80a3e3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a3e6:	83 c0 04             	add    eax,0x4
  80a3e9:	0f b7 c0             	movzx  eax,ax
  80a3ec:	be 1e 00 00 00       	mov    esi,0x1e
  80a3f1:	89 c7                	mov    edi,eax
  80a3f3:	e8 18 aa ff ff       	call   804e10 <outb>
    
    /* write a byte to test serial chip */
    outb(base_port + COM_REG_TX, "arttnba3"[0]);
  80a3f8:	b8 61 00 00 00       	mov    eax,0x61
  80a3fd:	0f b6 d0             	movzx  edx,al
  80a400:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a403:	0f b7 c0             	movzx  eax,ax
  80a406:	89 d6                	mov    esi,edx
  80a408:	89 c7                	mov    edi,eax
  80a40a:	e8 01 aa ff ff       	call   804e10 <outb>
    
    /* check if serial is faulty */
    if (inb(base_port + COM_REG_RX) != "arttnba3"[0]) {
  80a40f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a412:	0f b6 c0             	movzx  eax,al
  80a415:	89 c7                	mov    edi,eax
  80a417:	e8 0d aa ff ff       	call   804e29 <inb>
  80a41c:	0f b6 d0             	movzx  edx,al
  80a41f:	b8 61 00 00 00       	mov    eax,0x61
  80a424:	0f be c0             	movsx  eax,al
  80a427:	39 c2                	cmp    edx,eax
  80a429:	75 17                	jne    80a442 <init_com+0xfe>
        return;
    }
    
    /* set in normal mode */
    outb(base_port + COM_REG_MCR, 0x0F);
  80a42b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a42e:	83 c0 04             	add    eax,0x4
  80a431:	0f b7 c0             	movzx  eax,ax
  80a434:	be 0f 00 00 00       	mov    esi,0xf
  80a439:	89 c7                	mov    edi,eax
  80a43b:	e8 d0 a9 ff ff       	call   804e10 <outb>
  80a440:	eb 01                	jmp    80a443 <init_com+0xff>
        return;
  80a442:	90                   	nop
}
  80a443:	c9                   	leave  
  80a444:	c3                   	ret    

000000000080a445 <com_putchar>:
void com_putchar(unsigned short ch,int com_base)
{
  80a445:	f3 0f 1e fa          	endbr64 
  80a449:	55                   	push   rbp
  80a44a:	48 89 e5             	mov    rbp,rsp
  80a44d:	48 83 ec 20          	sub    rsp,0x20
  80a451:	89 f8                	mov    eax,edi
  80a453:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80a456:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    unsigned char res;
    /* wait for the port to be ready */
    do {
        res = inb(com_base + COM_REG_LSR);
  80a45a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80a45d:	83 c0 05             	add    eax,0x5
  80a460:	0f b6 c0             	movzx  eax,al
  80a463:	89 c7                	mov    edi,eax
  80a465:	e8 bf a9 ff ff       	call   804e29 <inb>
  80a46a:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        res &= 0x20;
  80a46d:	80 65 ff 20          	and    BYTE PTR [rbp-0x1],0x20
    } while (res == 0);
  80a471:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  80a475:	74 e3                	je     80a45a <com_putchar+0x15>
    outb(com_base, ch);
  80a477:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  80a47b:	0f b6 d0             	movzx  edx,al
  80a47e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80a481:	0f b7 c0             	movzx  eax,ax
  80a484:	89 d6                	mov    esi,edx
  80a486:	89 c7                	mov    edi,eax
  80a488:	e8 83 a9 ff ff       	call   804e10 <outb>
}
  80a48d:	90                   	nop
  80a48e:	c9                   	leave  
  80a48f:	c3                   	ret    

000000000080a490 <com_puts>:

void com_puts(char* s,int com_port){
  80a490:	f3 0f 1e fa          	endbr64 
  80a494:	55                   	push   rbp
  80a495:	48 89 e5             	mov    rbp,rsp
  80a498:	48 83 ec 10          	sub    rsp,0x10
  80a49c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a4a0:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    for(;*s;s++){
  80a4a3:	eb 1d                	jmp    80a4c2 <com_puts+0x32>
        com_putchar(*s,com_port);
  80a4a5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a4a9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a4ac:	66 98                	cbw    
  80a4ae:	0f b7 c0             	movzx  eax,ax
  80a4b1:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80a4b4:	89 d6                	mov    esi,edx
  80a4b6:	89 c7                	mov    edi,eax
  80a4b8:	e8 88 ff ff ff       	call   80a445 <com_putchar>
    for(;*s;s++){
  80a4bd:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  80a4c2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a4c6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a4c9:	84 c0                	test   al,al
  80a4cb:	75 d8                	jne    80a4a5 <com_puts+0x15>
    }
  80a4cd:	90                   	nop
  80a4ce:	90                   	nop
  80a4cf:	c9                   	leave  
  80a4d0:	c3                   	ret    

000000000080a4d1 <memcpy>:
#include "mem.h"
#include "typename.h"
static u32 mem_end;
static u32 usr_mem_base;
void memcpy(u8* dest, u8 *src,u32 size){
  80a4d1:	f3 0f 1e fa          	endbr64 
  80a4d5:	55                   	push   rbp
  80a4d6:	48 89 e5             	mov    rbp,rsp
  80a4d9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80a4dd:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80a4e1:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    *dest=0xff;//如果页内存还没分配，这样就可以先激发缺页异常分配了，之后写数据就会完整不会少开头第一个字节。
  80a4e4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a4e8:	c6 00 ff             	mov    BYTE PTR [rax],0xff
    for(int i=0;i<size;i++){
  80a4eb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80a4f2:	eb 1b                	jmp    80a50f <memcpy+0x3e>
        *(dest)=*(src);
  80a4f4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a4f8:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80a4fb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a4ff:	88 10                	mov    BYTE PTR [rax],dl
        dest++;
  80a501:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        src++;
  80a506:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<size;i++){
  80a50b:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a50f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a512:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
  80a515:	77 dd                	ja     80a4f4 <memcpy+0x23>
    }
}
  80a517:	90                   	nop
  80a518:	90                   	nop
  80a519:	5d                   	pop    rbp
  80a51a:	c3                   	ret    

000000000080a51b <memcmp>:
int memcmp(u8 *a,u8* b,int len)
{
  80a51b:	f3 0f 1e fa          	endbr64 
  80a51f:	55                   	push   rbp
  80a520:	48 89 e5             	mov    rbp,rsp
  80a523:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80a527:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80a52b:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    for(int i=0;i<len;i++)
  80a52e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80a535:	eb 3a                	jmp    80a571 <memcmp+0x56>
    {
        if(*a!=*b)
  80a537:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a53b:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80a53e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a542:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a545:	38 c2                	cmp    dl,al
  80a547:	74 1a                	je     80a563 <memcmp+0x48>
            return *a-*b;
  80a549:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a54d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a550:	0f b6 d0             	movzx  edx,al
  80a553:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a557:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a55a:	0f b6 c8             	movzx  ecx,al
  80a55d:	89 d0                	mov    eax,edx
  80a55f:	29 c8                	sub    eax,ecx
  80a561:	eb 1b                	jmp    80a57e <memcmp+0x63>
        a++;
  80a563:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        b++;
  80a568:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<len;i++)
  80a56d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a571:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a574:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  80a577:	7c be                	jl     80a537 <memcmp+0x1c>
    }
    return 0;
  80a579:	b8 00 00 00 00       	mov    eax,0x0
}
  80a57e:	5d                   	pop    rbp
  80a57f:	c3                   	ret    

000000000080a580 <memset>:
void memset(u8 *buf,u8 value,u32 size){
  80a580:	f3 0f 1e fa          	endbr64 
  80a584:	55                   	push   rbp
  80a585:	48 89 e5             	mov    rbp,rsp
  80a588:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80a58c:	89 f0                	mov    eax,esi
  80a58e:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
  80a591:	88 45 e4             	mov    BYTE PTR [rbp-0x1c],al
    for(u32 i=0;i<size;i++){
  80a594:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80a59b:	eb 16                	jmp    80a5b3 <memset+0x33>
        *(buf++)=value;
  80a59d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a5a1:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80a5a5:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80a5a9:	0f b6 55 e4          	movzx  edx,BYTE PTR [rbp-0x1c]
  80a5ad:	88 10                	mov    BYTE PTR [rax],dl
    for(u32 i=0;i<size;i++){
  80a5af:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a5b3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a5b6:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  80a5b9:	72 e2                	jb     80a59d <memset+0x1d>
    }
}
  80a5bb:	90                   	nop
  80a5bc:	90                   	nop
  80a5bd:	5d                   	pop    rbp
  80a5be:	c3                   	ret    

000000000080a5bf <get_mem_size>:

u32 get_mem_size(){
  80a5bf:	f3 0f 1e fa          	endbr64 
  80a5c3:	55                   	push   rbp
  80a5c4:	48 89 e5             	mov    rbp,rsp
    return mem_end;
  80a5c7:	8b 05 6f ff c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ff6f]        # 42a53c <mem_end>
}
  80a5cd:	5d                   	pop    rbp
  80a5ce:	c3                   	ret    

000000000080a5cf <strcpy>:
#include "str.h"
#include <stdarg.h>
void strcpy(unsigned char* dest, unsigned char *buf){
  80a5cf:	f3 0f 1e fa          	endbr64 
  80a5d3:	55                   	push   rbp
  80a5d4:	48 89 e5             	mov    rbp,rsp
  80a5d7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a5db:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*buf!='\0'){
  80a5df:	eb 1d                	jmp    80a5fe <strcpy+0x2f>
        *(dest++)=*(buf++);
  80a5e1:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80a5e5:	48 8d 42 01          	lea    rax,[rdx+0x1]
  80a5e9:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  80a5ed:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a5f1:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80a5f5:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80a5f9:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80a5fc:	88 10                	mov    BYTE PTR [rax],dl
    while(*buf!='\0'){
  80a5fe:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a602:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a605:	84 c0                	test   al,al
  80a607:	75 d8                	jne    80a5e1 <strcpy+0x12>
    }
    *dest='\0';
  80a609:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a60d:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80a610:	90                   	nop
  80a611:	5d                   	pop    rbp
  80a612:	c3                   	ret    

000000000080a613 <strtok>:
static char strtokkee[512],*strtokkeeptr=strtokkee;
static int tokptr=0;
static char retbuf[512],*retbptr=retbuf;
char* strtok(char *str,char splitter){
  80a613:	f3 0f 1e fa          	endbr64 
  80a617:	55                   	push   rbp
  80a618:	48 89 e5             	mov    rbp,rsp
  80a61b:	48 83 ec 30          	sub    rsp,0x30
  80a61f:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80a623:	89 f0                	mov    eax,esi
  80a625:	88 45 d4             	mov    BYTE PTR [rbp-0x2c],al
    //limit: cannot cut string longer than 512
    if(str!=(void*)0){
  80a628:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80a62d:	0f 84 9c 00 00 00    	je     80a6cf <strtok+0xbc>
        //cut for the first time
        strcpy(strtokkee,str);
  80a633:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a637:	48 89 c6             	mov    rsi,rax
  80a63a:	bf 60 a5 42 00       	mov    edi,0x42a560
  80a63f:	e8 8b ff ff ff       	call   80a5cf <strcpy>
        char* ptr=strtokkee;
  80a644:	48 c7 45 e8 60 a5 42 	mov    QWORD PTR [rbp-0x18],0x42a560
  80a64b:	00 
        for(tokptr=0;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512);
  80a64c:	c7 05 0a 01 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc2010a],0x0        # 42a760 <tokptr>
  80a653:	00 00 00 
  80a656:	eb 1c                	jmp    80a674 <strtok+0x61>
  80a658:	8b 05 02 01 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20102]        # 42a760 <tokptr>
  80a65e:	83 c0 01             	add    eax,0x1
  80a661:	99                   	cdq    
  80a662:	c1 ea 17             	shr    edx,0x17
  80a665:	01 d0                	add    eax,edx
  80a667:	25 ff 01 00 00       	and    eax,0x1ff
  80a66c:	29 d0                	sub    eax,edx
  80a66e:	89 05 ec 00 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc200ec],eax        # 42a760 <tokptr>
  80a674:	8b 05 e6 00 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc200e6]        # 42a760 <tokptr>
  80a67a:	48 98                	cdqe   
  80a67c:	0f b6 80 60 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a560]
  80a683:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80a686:	74 13                	je     80a69b <strtok+0x88>
  80a688:	8b 05 d2 00 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc200d2]        # 42a760 <tokptr>
  80a68e:	48 98                	cdqe   
  80a690:	0f b6 80 60 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a560]
  80a697:	84 c0                	test   al,al
  80a699:	75 bd                	jne    80a658 <strtok+0x45>
        strtokkee[tokptr]='\0';
  80a69b:	8b 05 bf 00 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc200bf]        # 42a760 <tokptr>
  80a6a1:	48 98                	cdqe   
  80a6a3:	c6 80 60 a5 42 00 00 	mov    BYTE PTR [rax+0x42a560],0x0
        tokptr=(tokptr+1)%512;
  80a6aa:	8b 05 b0 00 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc200b0]        # 42a760 <tokptr>
  80a6b0:	83 c0 01             	add    eax,0x1
  80a6b3:	99                   	cdq    
  80a6b4:	c1 ea 17             	shr    edx,0x17
  80a6b7:	01 d0                	add    eax,edx
  80a6b9:	25 ff 01 00 00       	and    eax,0x1ff
  80a6be:	29 d0                	sub    eax,edx
  80a6c0:	89 05 9a 00 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2009a],eax        # 42a760 <tokptr>
        return ptr;
  80a6c6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a6ca:	e9 9e 00 00 00       	jmp    80a76d <strtok+0x15a>
    }
    //go on cutting
    int c=0;
  80a6cf:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* ptr=strtokkee+tokptr;
  80a6d6:	8b 05 84 00 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20084]        # 42a760 <tokptr>
  80a6dc:	48 98                	cdqe   
  80a6de:	48 05 60 a5 42 00    	add    rax,0x42a560
  80a6e4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512,c++);
  80a6e8:	eb 20                	jmp    80a70a <strtok+0xf7>
  80a6ea:	8b 05 70 00 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20070]        # 42a760 <tokptr>
  80a6f0:	83 c0 01             	add    eax,0x1
  80a6f3:	99                   	cdq    
  80a6f4:	c1 ea 17             	shr    edx,0x17
  80a6f7:	01 d0                	add    eax,edx
  80a6f9:	25 ff 01 00 00       	and    eax,0x1ff
  80a6fe:	29 d0                	sub    eax,edx
  80a700:	89 05 5a 00 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2005a],eax        # 42a760 <tokptr>
  80a706:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a70a:	8b 05 50 00 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20050]        # 42a760 <tokptr>
  80a710:	48 98                	cdqe   
  80a712:	0f b6 80 60 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a560]
  80a719:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80a71c:	74 13                	je     80a731 <strtok+0x11e>
  80a71e:	8b 05 3c 00 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2003c]        # 42a760 <tokptr>
  80a724:	48 98                	cdqe   
  80a726:	0f b6 80 60 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a560]
  80a72d:	84 c0                	test   al,al
  80a72f:	75 b9                	jne    80a6ea <strtok+0xd7>
    strtokkee[tokptr]='\0';
  80a731:	8b 05 29 00 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20029]        # 42a760 <tokptr>
  80a737:	48 98                	cdqe   
  80a739:	c6 80 60 a5 42 00 00 	mov    BYTE PTR [rax+0x42a560],0x0
    tokptr=(tokptr+1)%512;
  80a740:	8b 05 1a 00 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2001a]        # 42a760 <tokptr>
  80a746:	83 c0 01             	add    eax,0x1
  80a749:	99                   	cdq    
  80a74a:	c1 ea 17             	shr    edx,0x17
  80a74d:	01 d0                	add    eax,edx
  80a74f:	25 ff 01 00 00       	and    eax,0x1ff
  80a754:	29 d0                	sub    eax,edx
  80a756:	89 05 04 00 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20004],eax        # 42a760 <tokptr>
    if(c)
  80a75c:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80a760:	74 06                	je     80a768 <strtok+0x155>
        return ptr;
  80a762:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a766:	eb 05                	jmp    80a76d <strtok+0x15a>
    else
        return (void*)0;
  80a768:	b8 00 00 00 00       	mov    eax,0x0
}
  80a76d:	c9                   	leave  
  80a76e:	c3                   	ret    

000000000080a76f <strcmp>:
int strcmp(char *s1,char *s2)
{
  80a76f:	f3 0f 1e fa          	endbr64 
  80a773:	55                   	push   rbp
  80a774:	48 89 e5             	mov    rbp,rsp
  80a777:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a77b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	while(*s1!='\0'&&*s2!='\0'){
  80a77f:	eb 3c                	jmp    80a7bd <strcmp+0x4e>
		if(*s1>*s2)
  80a781:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a785:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80a788:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a78c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a78f:	38 c2                	cmp    dl,al
  80a791:	7e 07                	jle    80a79a <strcmp+0x2b>
			return 1;
  80a793:	b8 01 00 00 00       	mov    eax,0x1
  80a798:	eb 52                	jmp    80a7ec <strcmp+0x7d>
		else if(*s1<*s2)
  80a79a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a79e:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80a7a1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a7a5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a7a8:	38 c2                	cmp    dl,al
  80a7aa:	7d 07                	jge    80a7b3 <strcmp+0x44>
			return -1;
  80a7ac:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80a7b1:	eb 39                	jmp    80a7ec <strcmp+0x7d>
		s1++;
  80a7b3:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
		s2++;
  80a7b8:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
	while(*s1!='\0'&&*s2!='\0'){
  80a7bd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a7c1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a7c4:	84 c0                	test   al,al
  80a7c6:	74 0b                	je     80a7d3 <strcmp+0x64>
  80a7c8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a7cc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a7cf:	84 c0                	test   al,al
  80a7d1:	75 ae                	jne    80a781 <strcmp+0x12>
	}
	if(*s1==*s2)
  80a7d3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a7d7:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80a7da:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a7de:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a7e1:	38 c2                	cmp    dl,al
  80a7e3:	75 07                	jne    80a7ec <strcmp+0x7d>
		return 0;
  80a7e5:	b8 00 00 00 00       	mov    eax,0x0
  80a7ea:	eb 00                	jmp    80a7ec <strcmp+0x7d>
}
  80a7ec:	5d                   	pop    rbp
  80a7ed:	c3                   	ret    

000000000080a7ee <strlen>:

int strlen(char *str)
{
  80a7ee:	f3 0f 1e fa          	endbr64 
  80a7f2:	55                   	push   rbp
  80a7f3:	48 89 e5             	mov    rbp,rsp
  80a7f6:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int l=0;
  80a7fa:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;*str!='\0';str++,l++);
  80a801:	eb 09                	jmp    80a80c <strlen+0x1e>
  80a803:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  80a808:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a80c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a810:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a813:	84 c0                	test   al,al
  80a815:	75 ec                	jne    80a803 <strlen+0x15>
    return l;
  80a817:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80a81a:	5d                   	pop    rbp
  80a81b:	c3                   	ret    

000000000080a81c <sprintf>:

void sprintf(char *dist, char *str,...)
{
  80a81c:	f3 0f 1e fa          	endbr64 
  80a820:	55                   	push   rbp
  80a821:	48 89 e5             	mov    rbp,rsp
  80a824:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  80a82b:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  80a832:	48 89 b5 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rsi
  80a839:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  80a840:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  80a847:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  80a84e:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  80a855:	84 c0                	test   al,al
  80a857:	74 20                	je     80a879 <sprintf+0x5d>
  80a859:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  80a85d:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  80a861:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  80a865:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  80a869:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  80a86d:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  80a871:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  80a875:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7

    //count num of args
    char *pstr=str;
  80a879:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80a880:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char *prev=str;
  80a887:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80a88e:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    int argnum=0;
  80a895:	c7 85 3c ff ff ff 00 	mov    DWORD PTR [rbp-0xc4],0x0
  80a89c:	00 00 00 
    while (*pstr!='\n')
  80a89f:	eb 39                	jmp    80a8da <sprintf+0xbe>
    {
        if(*pstr=='%'&&*prev!='%')
  80a8a1:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a8a8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a8ab:	3c 25                	cmp    al,0x25
  80a8ad:	75 15                	jne    80a8c4 <sprintf+0xa8>
  80a8af:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  80a8b6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a8b9:	3c 25                	cmp    al,0x25
  80a8bb:	74 07                	je     80a8c4 <sprintf+0xa8>
            argnum++;
  80a8bd:	83 85 3c ff ff ff 01 	add    DWORD PTR [rbp-0xc4],0x1
        prev=pstr;
  80a8c4:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a8cb:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
        pstr++;
  80a8d2:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80a8d9:	01 
    while (*pstr!='\n')
  80a8da:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a8e1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a8e4:	3c 0a                	cmp    al,0xa
  80a8e6:	75 b9                	jne    80a8a1 <sprintf+0x85>
    }

    va_list vargs;
    va_start(vargs,str);
  80a8e8:	c7 85 08 ff ff ff 10 	mov    DWORD PTR [rbp-0xf8],0x10
  80a8ef:	00 00 00 
  80a8f2:	c7 85 0c ff ff ff 30 	mov    DWORD PTR [rbp-0xf4],0x30
  80a8f9:	00 00 00 
  80a8fc:	48 8d 45 10          	lea    rax,[rbp+0x10]
  80a900:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  80a907:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  80a90e:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
    pstr=str;
  80a915:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80a91c:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    for(;*pstr!='\0';pstr++){
  80a923:	e9 e2 01 00 00       	jmp    80ab0a <sprintf+0x2ee>
        if(*pstr=='%'&&*(pstr+1)!='\0'){
  80a928:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a92f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a932:	3c 25                	cmp    al,0x25
  80a934:	0f 85 aa 01 00 00    	jne    80aae4 <sprintf+0x2c8>
  80a93a:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a941:	48 83 c0 01          	add    rax,0x1
  80a945:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a948:	84 c0                	test   al,al
  80a94a:	0f 84 94 01 00 00    	je     80aae4 <sprintf+0x2c8>
            pstr++;
  80a950:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80a957:	01 
            if(*pstr=='x'){
  80a958:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a95f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a962:	3c 78                	cmp    al,0x78
  80a964:	75 64                	jne    80a9ca <sprintf+0x1ae>
                int v=va_arg(vargs,int);
  80a966:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80a96c:	83 f8 2f             	cmp    eax,0x2f
  80a96f:	77 23                	ja     80a994 <sprintf+0x178>
  80a971:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80a978:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80a97e:	89 d2                	mov    edx,edx
  80a980:	48 01 d0             	add    rax,rdx
  80a983:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80a989:	83 c2 08             	add    edx,0x8
  80a98c:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80a992:	eb 12                	jmp    80a9a6 <sprintf+0x18a>
  80a994:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80a99b:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80a99f:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80a9a6:	8b 00                	mov    eax,DWORD PTR [rax]
  80a9a8:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
                sprint_hex(dist,v);
  80a9ae:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
  80a9b4:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80a9bb:	89 d6                	mov    esi,edx
  80a9bd:	48 89 c7             	mov    rdi,rax
  80a9c0:	e8 4e 02 00 00       	call   80ac13 <sprint_hex>
            if(*pstr=='x'){
  80a9c5:	e9 38 01 00 00       	jmp    80ab02 <sprintf+0x2e6>
            }else if(*pstr=='s'){
  80a9ca:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a9d1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a9d4:	3c 73                	cmp    al,0x73
  80a9d6:	75 68                	jne    80aa40 <sprintf+0x224>
                char* v=va_arg(vargs,char*);
  80a9d8:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80a9de:	83 f8 2f             	cmp    eax,0x2f
  80a9e1:	77 23                	ja     80aa06 <sprintf+0x1ea>
  80a9e3:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80a9ea:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80a9f0:	89 d2                	mov    edx,edx
  80a9f2:	48 01 d0             	add    rax,rdx
  80a9f5:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80a9fb:	83 c2 08             	add    edx,0x8
  80a9fe:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80aa04:	eb 12                	jmp    80aa18 <sprintf+0x1fc>
  80aa06:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80aa0d:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80aa11:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80aa18:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aa1b:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
                sprintn(dist,v);
  80aa22:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
  80aa29:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80aa30:	48 89 d6             	mov    rsi,rdx
  80aa33:	48 89 c7             	mov    rdi,rax
  80aa36:	e8 5a 02 00 00       	call   80ac95 <sprintn>
            if(*pstr=='x'){
  80aa3b:	e9 c2 00 00 00       	jmp    80ab02 <sprintf+0x2e6>
            }else if(*pstr=='d'){
  80aa40:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80aa47:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aa4a:	3c 64                	cmp    al,0x64
  80aa4c:	75 66                	jne    80aab4 <sprintf+0x298>
                char* v=va_arg(vargs,char*);
  80aa4e:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80aa54:	83 f8 2f             	cmp    eax,0x2f
  80aa57:	77 23                	ja     80aa7c <sprintf+0x260>
  80aa59:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80aa60:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80aa66:	89 d2                	mov    edx,edx
  80aa68:	48 01 d0             	add    rax,rdx
  80aa6b:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80aa71:	83 c2 08             	add    edx,0x8
  80aa74:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80aa7a:	eb 12                	jmp    80aa8e <sprintf+0x272>
  80aa7c:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80aa83:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80aa87:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80aa8e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aa91:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
                sprint_decimal(dist,v);
  80aa98:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  80aa9f:	89 c2                	mov    edx,eax
  80aaa1:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80aaa8:	89 d6                	mov    esi,edx
  80aaaa:	48 89 c7             	mov    rdi,rax
  80aaad:	e8 ad 00 00 00       	call   80ab5f <sprint_decimal>
            if(*pstr=='x'){
  80aab2:	eb 4e                	jmp    80ab02 <sprintf+0x2e6>
            }else if(*pstr=='c'){
  80aab4:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80aabb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aabe:	3c 63                	cmp    al,0x63
  80aac0:	75 02                	jne    80aac4 <sprintf+0x2a8>
                char v=va_arg(vargs,char);
  80aac2:	0f 0b                	ud2    
                sprintchar(dist,v);
            }else{
                sprintchar(dist,*pstr);
  80aac4:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80aacb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aace:	0f be d0             	movsx  edx,al
  80aad1:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80aad8:	89 d6                	mov    esi,edx
  80aada:	48 89 c7             	mov    rdi,rax
  80aadd:	e8 3e 00 00 00       	call   80ab20 <sprintchar>
            if(*pstr=='x'){
  80aae2:	eb 1e                	jmp    80ab02 <sprintf+0x2e6>
            }
        }else{
            sprintchar(dist,*pstr);
  80aae4:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80aaeb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aaee:	0f be d0             	movsx  edx,al
  80aaf1:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80aaf8:	89 d6                	mov    esi,edx
  80aafa:	48 89 c7             	mov    rdi,rax
  80aafd:	e8 1e 00 00 00       	call   80ab20 <sprintchar>
    for(;*pstr!='\0';pstr++){
  80ab02:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80ab09:	01 
  80ab0a:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80ab11:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ab14:	84 c0                	test   al,al
  80ab16:	0f 85 0c fe ff ff    	jne    80a928 <sprintf+0x10c>
        }
    }
    va_end(vargs);
}
  80ab1c:	90                   	nop
  80ab1d:	90                   	nop
  80ab1e:	c9                   	leave  
  80ab1f:	c3                   	ret    

000000000080ab20 <sprintchar>:
void sprintchar(char *dist,char c)
{
  80ab20:	f3 0f 1e fa          	endbr64 
  80ab24:	55                   	push   rbp
  80ab25:	48 89 e5             	mov    rbp,rsp
  80ab28:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80ab2c:	89 f0                	mov    eax,esi
  80ab2e:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    while(*dist!='\0')
  80ab31:	eb 05                	jmp    80ab38 <sprintchar+0x18>
        dist++;
  80ab33:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    while(*dist!='\0')
  80ab38:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ab3c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ab3f:	84 c0                	test   al,al
  80ab41:	75 f0                	jne    80ab33 <sprintchar+0x13>
    *dist++=c;
  80ab43:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ab47:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80ab4b:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80ab4f:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  80ab53:	88 10                	mov    BYTE PTR [rax],dl
    *dist='\0';
  80ab55:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ab59:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80ab5c:	90                   	nop
  80ab5d:	5d                   	pop    rbp
  80ab5e:	c3                   	ret    

000000000080ab5f <sprint_decimal>:
void sprint_decimal(char *dist,int c)
{
  80ab5f:	f3 0f 1e fa          	endbr64 
  80ab63:	55                   	push   rbp
  80ab64:	48 89 e5             	mov    rbp,rsp
  80ab67:	48 83 ec 30          	sub    rsp,0x30
  80ab6b:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80ab6f:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
    unsigned char st[22];
    int p=0;
  80ab72:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<sizeof(unsigned long)*2){
  80ab79:	eb 65                	jmp    80abe0 <sprint_decimal+0x81>
        unsigned char a=c%10+'0';
  80ab7b:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  80ab7e:	48 63 c2             	movsxd rax,edx
  80ab81:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  80ab88:	48 c1 e8 20          	shr    rax,0x20
  80ab8c:	c1 f8 02             	sar    eax,0x2
  80ab8f:	89 d6                	mov    esi,edx
  80ab91:	c1 fe 1f             	sar    esi,0x1f
  80ab94:	29 f0                	sub    eax,esi
  80ab96:	89 c1                	mov    ecx,eax
  80ab98:	89 c8                	mov    eax,ecx
  80ab9a:	c1 e0 02             	shl    eax,0x2
  80ab9d:	01 c8                	add    eax,ecx
  80ab9f:	01 c0                	add    eax,eax
  80aba1:	89 d1                	mov    ecx,edx
  80aba3:	29 c1                	sub    ecx,eax
  80aba5:	89 c8                	mov    eax,ecx
  80aba7:	83 c0 30             	add    eax,0x30
  80abaa:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        st[p++]=a;
  80abad:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80abb0:	8d 50 01             	lea    edx,[rax+0x1]
  80abb3:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80abb6:	48 98                	cdqe   
  80abb8:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80abbc:	88 54 05 e0          	mov    BYTE PTR [rbp+rax*1-0x20],dl
        c/=10;
  80abc0:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80abc3:	48 63 d0             	movsxd rdx,eax
  80abc6:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
  80abcd:	48 c1 ea 20          	shr    rdx,0x20
  80abd1:	c1 fa 02             	sar    edx,0x2
  80abd4:	c1 f8 1f             	sar    eax,0x1f
  80abd7:	89 c1                	mov    ecx,eax
  80abd9:	89 d0                	mov    eax,edx
  80abdb:	29 c8                	sub    eax,ecx
  80abdd:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    while(p<sizeof(unsigned long)*2){
  80abe0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80abe3:	83 f8 0f             	cmp    eax,0xf
  80abe6:	76 93                	jbe    80ab7b <sprint_decimal+0x1c>
    }
    while(p>0)
  80abe8:	eb 1f                	jmp    80ac09 <sprint_decimal+0xaa>
    {
        sprintchar(dist,st[--p]);
  80abea:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80abee:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80abf1:	48 98                	cdqe   
  80abf3:	0f b6 44 05 e0       	movzx  eax,BYTE PTR [rbp+rax*1-0x20]
  80abf8:	0f be d0             	movsx  edx,al
  80abfb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80abff:	89 d6                	mov    esi,edx
  80ac01:	48 89 c7             	mov    rdi,rax
  80ac04:	e8 17 ff ff ff       	call   80ab20 <sprintchar>
    while(p>0)
  80ac09:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80ac0d:	7f db                	jg     80abea <sprint_decimal+0x8b>
    }
}
  80ac0f:	90                   	nop
  80ac10:	90                   	nop
  80ac11:	c9                   	leave  
  80ac12:	c3                   	ret    

000000000080ac13 <sprint_hex>:
void sprint_hex(char *dist,unsigned int c)
{
  80ac13:	f3 0f 1e fa          	endbr64 
  80ac17:	55                   	push   rbp
  80ac18:	48 89 e5             	mov    rbp,rsp
  80ac1b:	48 83 ec 20          	sub    rsp,0x20
  80ac1f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80ac23:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    unsigned char st[10];
    int p=0;
  80ac26:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<10){
  80ac2d:	eb 35                	jmp    80ac64 <sprint_hex+0x51>
        unsigned char a=c%16;
  80ac2f:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80ac32:	83 e0 0f             	and    eax,0xf
  80ac35:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        if(a>9)a+='a'-10;
  80ac38:	80 7d fb 09          	cmp    BYTE PTR [rbp-0x5],0x9
  80ac3c:	76 06                	jbe    80ac44 <sprint_hex+0x31>
  80ac3e:	80 45 fb 57          	add    BYTE PTR [rbp-0x5],0x57
  80ac42:	eb 04                	jmp    80ac48 <sprint_hex+0x35>
        else a+='0';
  80ac44:	80 45 fb 30          	add    BYTE PTR [rbp-0x5],0x30
        st[p++]=a;
  80ac48:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ac4b:	8d 50 01             	lea    edx,[rax+0x1]
  80ac4e:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80ac51:	48 98                	cdqe   
  80ac53:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80ac57:	88 54 05 f1          	mov    BYTE PTR [rbp+rax*1-0xf],dl
        c/=16;
  80ac5b:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80ac5e:	c1 e8 04             	shr    eax,0x4
  80ac61:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    while(p<10){
  80ac64:	83 7d fc 09          	cmp    DWORD PTR [rbp-0x4],0x9
  80ac68:	7e c5                	jle    80ac2f <sprint_hex+0x1c>
    }
    while(p>0)
  80ac6a:	eb 1f                	jmp    80ac8b <sprint_hex+0x78>
    {
        sprintchar(dist,st[--p]);
  80ac6c:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80ac70:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ac73:	48 98                	cdqe   
  80ac75:	0f b6 44 05 f1       	movzx  eax,BYTE PTR [rbp+rax*1-0xf]
  80ac7a:	0f be d0             	movsx  edx,al
  80ac7d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ac81:	89 d6                	mov    esi,edx
  80ac83:	48 89 c7             	mov    rdi,rax
  80ac86:	e8 95 fe ff ff       	call   80ab20 <sprintchar>
    while(p>0)
  80ac8b:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80ac8f:	7f db                	jg     80ac6c <sprint_hex+0x59>
    }
}
  80ac91:	90                   	nop
  80ac92:	90                   	nop
  80ac93:	c9                   	leave  
  80ac94:	c3                   	ret    

000000000080ac95 <sprintn>:
void sprintn(char *dist,char *str)
{
  80ac95:	f3 0f 1e fa          	endbr64 
  80ac99:	55                   	push   rbp
  80ac9a:	48 89 e5             	mov    rbp,rsp
  80ac9d:	48 83 ec 10          	sub    rsp,0x10
  80aca1:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80aca5:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*str!='\0')
  80aca9:	eb 20                	jmp    80accb <sprintn+0x36>
    {
        sprintchar(dist,*str++);
  80acab:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80acaf:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80acb3:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  80acb7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80acba:	0f be d0             	movsx  edx,al
  80acbd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80acc1:	89 d6                	mov    esi,edx
  80acc3:	48 89 c7             	mov    rdi,rax
  80acc6:	e8 55 fe ff ff       	call   80ab20 <sprintchar>
    while(*str!='\0')
  80accb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80accf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80acd2:	84 c0                	test   al,al
  80acd4:	75 d5                	jne    80acab <sprintn+0x16>
    }
  80acd6:	90                   	nop
  80acd7:	90                   	nop
  80acd8:	c9                   	leave  
  80acd9:	c3                   	ret    
  80acda:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

000000000080ace0 <create_zero>:
  80ace0:	e8 ce 8f ff ff       	call   803cb3 <req_proc>
  80ace5:	83 f8 ff             	cmp    eax,0xffffffff
  80ace8:	74 0c                	je     80acf6 <create_zero.retu>
  80acea:	e8 bd 90 ff ff       	call   803dac <set_proc>
  80acef:	67 8b 04 24          	mov    eax,DWORD PTR [esp]
  80acf3:	83 c4 40             	add    esp,0x40

000000000080acf6 <create_zero.retu>:
  80acf6:	c3                   	ret    

000000000080acf7 <fill_desc>:
  80acf7:	55                   	push   rbp
  80acf8:	48 89 e5             	mov    rbp,rsp
  80acfb:	67 8b 45 14          	mov    eax,DWORD PTR [ebp+0x14]
  80acff:	67 8b 5d 10          	mov    ebx,DWORD PTR [ebp+0x10]
  80ad03:	67 8b 4d 0c          	mov    ecx,DWORD PTR [ebp+0xc]
  80ad07:	67 8b 55 08          	mov    edx,DWORD PTR [ebp+0x8]
  80ad0b:	be 4a ae 80 00       	mov    esi,0x80ae4a
  80ad10:	c7 04 25 4a ae 80 00 	mov    DWORD PTR ds:0x80ae4a,0x0
  80ad17:	00 00 00 00 
  80ad1b:	c7 04 25 4e ae 80 00 	mov    DWORD PTR ds:0x80ae4e,0x0
  80ad22:	00 00 00 00 
  80ad26:	66 67 89 0e          	mov    WORD PTR [esi],cx
  80ad2a:	c1 e9 10             	shr    ecx,0x10
  80ad2d:	66 67 89 56 02       	mov    WORD PTR [esi+0x2],dx
  80ad32:	c1 ea 10             	shr    edx,0x10
  80ad35:	67 88 56 04          	mov    BYTE PTR [esi+0x4],dl
  80ad39:	66 c1 ea 08          	shr    dx,0x8
  80ad3d:	67 88 56 07          	mov    BYTE PTR [esi+0x7],dl
  80ad41:	66 67 89 5e 05       	mov    WORD PTR [esi+0x5],bx
  80ad46:	67 8b 7e 04          	mov    edi,DWORD PTR [esi+0x4]
  80ad4a:	c1 e1 08             	shl    ecx,0x8
  80ad4d:	09 cf                	or     edi,ecx
  80ad4f:	67 89 7e 04          	mov    DWORD PTR [esi+0x4],edi
  80ad53:	8b 14 25 4a ae 80 00 	mov    edx,DWORD PTR ds:0x80ae4a
  80ad5a:	67 89 10             	mov    DWORD PTR [eax],edx
  80ad5d:	8b 14 25 4e ae 80 00 	mov    edx,DWORD PTR ds:0x80ae4e
  80ad64:	67 89 50 04          	mov    DWORD PTR [eax+0x4],edx
  80ad68:	c9                   	leave  
  80ad69:	c3                   	ret    

000000000080ad6a <switch_proc_asm>:
  80ad6a:	66 67 8b 44 24 04    	mov    ax,WORD PTR [esp+0x4]
  80ad70:	66 89 04 25 88 ad 80 	mov    WORD PTR ds:0x80ad88,ax
  80ad77:	00 
  80ad78:	c7 04 25 84 ad 80 00 	mov    DWORD PTR ds:0x80ad84,0x0
  80ad7f:	00 00 00 00 

000000000080ad83 <switch_proc_asm.ljmp>:
  80ad83:	ea                   	(bad)  
  80ad84:	00 00                	add    BYTE PTR [rax],al
  80ad86:	00 00                	add    BYTE PTR [rax],al
  80ad88:	00 00                	add    BYTE PTR [rax],al
  80ad8a:	c3                   	ret    

000000000080ad8b <switch_to_old>:
  80ad8b:	67 8b 74 24 04       	mov    esi,DWORD PTR [esp+0x4]
  80ad90:	67 8b 5e 20          	mov    ebx,DWORD PTR [esi+0x20]
  80ad94:	bf fc ad 80 00       	mov    edi,0x80adfc
  80ad99:	67 89 5f 01          	mov    DWORD PTR [edi+0x1],ebx
  80ad9d:	67 8b 46 38          	mov    eax,DWORD PTR [esi+0x38]
  80ada1:	89 c1                	mov    ecx,eax
  80ada3:	83 e9 04             	sub    ecx,0x4
  80ada6:	67 89 19             	mov    DWORD PTR [ecx],ebx
  80ada9:	50                   	push   rax
  80adaa:	89 f5                	mov    ebp,esi
  80adac:	83 c5 28             	add    ebp,0x28
  80adaf:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80adb3:	50                   	push   rax
  80adb4:	83 c5 04             	add    ebp,0x4
  80adb7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80adbb:	50                   	push   rax
  80adbc:	83 c5 04             	add    ebp,0x4
  80adbf:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80adc3:	50                   	push   rax
  80adc4:	83 c5 04             	add    ebp,0x4
  80adc7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80adcb:	50                   	push   rax
  80adcc:	83 c5 04             	add    ebp,0x4
  80adcf:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80add3:	50                   	push   rax
  80add4:	83 c5 04             	add    ebp,0x4
  80add7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80addb:	50                   	push   rax
  80addc:	83 c5 04             	add    ebp,0x4
  80addf:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80ade3:	50                   	push   rax
  80ade4:	83 c5 04             	add    ebp,0x4
  80ade7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80adeb:	50                   	push   rax
  80adec:	83 c5 04             	add    ebp,0x4
  80adef:	67 8b 46 1c          	mov    eax,DWORD PTR [esi+0x1c]
  80adf3:	0f 22 d8             	mov    cr3,rax
  80adf6:	67 8b 46 24          	mov    eax,DWORD PTR [esi+0x24]
  80adfa:	50                   	push   rax
  80adfb:	5c                   	pop    rsp

000000000080adfc <switch_to_old.leap>:
  80adfc:	ea                   	(bad)  
  80adfd:	00 00                	add    BYTE PTR [rax],al
  80adff:	00 00                	add    BYTE PTR [rax],al
  80ae01:	08 00                	or     BYTE PTR [rax],al

000000000080ae03 <save_context>:
  80ae03:	67 8b 44 24 24       	mov    eax,DWORD PTR [esp+0x24]
  80ae08:	83 c0 44             	add    eax,0x44
  80ae0b:	b9 08 00 00 00       	mov    ecx,0x8
  80ae10:	89 e7                	mov    edi,esp

000000000080ae12 <save_context.loops>:
  80ae12:	67 8b 17             	mov    edx,DWORD PTR [edi]
  80ae15:	67 89 10             	mov    DWORD PTR [eax],edx
  80ae18:	83 c7 04             	add    edi,0x4
  80ae1b:	83 e8 04             	sub    eax,0x4
  80ae1e:	e2 f2                	loop   80ae12 <save_context.loops>
  80ae20:	5b                   	pop    rbx
  80ae21:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  80ae26:	67 89 58 24          	mov    DWORD PTR [eax+0x24],ebx
  80ae2a:	67 48 8b 1c 24       	mov    rbx,QWORD PTR [esp]
  80ae2f:	67 89 58 20          	mov    DWORD PTR [eax+0x20],ebx
  80ae33:	c3                   	ret    

000000000080ae34 <move_to_user_mode>:
  80ae34:	66 b8 20 00          	mov    ax,0x20
  80ae38:	8e d8                	mov    ds,eax
  80ae3a:	8e c0                	mov    es,eax
  80ae3c:	8e e8                	mov    gs,eax
  80ae3e:	6a 20                	push   0x20
  80ae40:	54                   	push   rsp
  80ae41:	6a 18                	push   0x18
  80ae43:	68 49 ae 80 00       	push   0x80ae49
  80ae48:	cf                   	iret   

000000000080ae49 <move_to_user_mode.done>:
  80ae49:	c3                   	ret    

000000000080ae4a <desc>:
	...

000000000080ae52 <ret_sys_call>:
  80ae52:	58                   	pop    rax
  80ae53:	8e d8                	mov    ds,eax
  80ae55:	58                   	pop    rax
  80ae56:	8e c0                	mov    es,eax
  80ae58:	41 5f                	pop    r15
  80ae5a:	41 5e                	pop    r14
  80ae5c:	41 5d                	pop    r13
  80ae5e:	41 5c                	pop    r12
  80ae60:	41 5b                	pop    r11
  80ae62:	41 5a                	pop    r10
  80ae64:	41 59                	pop    r9
  80ae66:	41 58                	pop    r8
  80ae68:	5e                   	pop    rsi
  80ae69:	5f                   	pop    rdi
  80ae6a:	5a                   	pop    rdx
  80ae6b:	59                   	pop    rcx
  80ae6c:	5b                   	pop    rbx
  80ae6d:	58                   	pop    rax

000000000080ae6e <tmp>:
  80ae6e:	48 0f 07             	sysretq 
