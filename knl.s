
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
  800194:	b8 37 12 80 00       	mov    eax,0x801237
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
    idt[index].attr=attr;
  8003ac:	48 8b 15 ad aa 00 00 	mov    rdx,QWORD PTR [rip+0xaaad]        # 80ae60 <idt>
  8003b3:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003b7:	48 c1 e0 04          	shl    rax,0x4
  8003bb:	48 01 c2             	add    rdx,rax
  8003be:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  8003c2:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
    idt[index].selector=selector;
  8003c6:	48 8b 15 93 aa 00 00 	mov    rdx,QWORD PTR [rip+0xaa93]        # 80ae60 <idt>
  8003cd:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003d1:	48 c1 e0 04          	shl    rax,0x4
  8003d5:	48 01 c2             	add    rdx,rax
  8003d8:	0f b7 45 f8          	movzx  eax,WORD PTR [rbp-0x8]
  8003dc:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    idt[index].rsvd=0;
  8003e0:	48 8b 15 79 aa 00 00 	mov    rdx,QWORD PTR [rip+0xaa79]        # 80ae60 <idt>
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
  80040a:	e8 4f 4a 00 00       	call   804e5e <eoi>
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
  800424:	e8 35 4a 00 00       	call   804e5e <eoi>
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
  80043e:	e8 1b 4a 00 00       	call   804e5e <eoi>
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
  800458:	e8 01 4a 00 00       	call   804e5e <eoi>
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
  800472:	e8 e7 49 00 00       	call   804e5e <eoi>
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
  80048c:	e8 cd 49 00 00       	call   804e5e <eoi>
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
  8004a5:	e8 b4 49 00 00       	call   804e5e <eoi>
    report_back_trace_of_err();
  8004aa:	b8 00 00 00 00       	mov    eax,0x0
  8004af:	e8 d5 49 00 00       	call   804e89 <report_back_trace_of_err>
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
  8004ca:	e8 8f 49 00 00       	call   804e5e <eoi>
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
  8004e4:	e8 75 49 00 00       	call   804e5e <eoi>
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
  8004fd:	e8 5c 49 00 00       	call   804e5e <eoi>
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
  800516:	e8 43 49 00 00       	call   804e5e <eoi>
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
  800530:	e8 29 49 00 00       	call   804e5e <eoi>
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
  80054a:	e8 0f 49 00 00       	call   804e5e <eoi>
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
  80056e:	e8 eb 48 00 00       	call   804e5e <eoi>
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
  80058b:	e8 ce 48 00 00       	call   804e5e <eoi>
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
  8005c4:	48 8b 04 c5 a0 25 81 	mov    rax,QWORD PTR [rax*8+0x8125a0]
  8005cb:	00 
  8005cc:	3e ff e0             	notrack jmp rax
    {
        case 0:return reg_device(b);
  8005cf:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005d2:	48 98                	cdqe   
  8005d4:	48 89 c7             	mov    rdi,rax
  8005d7:	e8 cf 24 00 00       	call   802aab <reg_device>
  8005dc:	e9 f7 01 00 00       	jmp    8007d8 <syscall+0x241>
        case 1:return dispose_device(b);
  8005e1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005e4:	89 c7                	mov    edi,eax
  8005e6:	e8 1f 2f 00 00       	call   80350a <dispose_device>
  8005eb:	e9 e8 01 00 00       	jmp    8007d8 <syscall+0x241>
        case 2:return reg_driver(b);
  8005f0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005f3:	48 98                	cdqe   
  8005f5:	48 89 c7             	mov    rdi,rax
  8005f8:	e8 96 27 00 00       	call   802d93 <reg_driver>
  8005fd:	e9 d6 01 00 00       	jmp    8007d8 <syscall+0x241>
        case 3:return dispose_driver(b);
  800602:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800605:	48 98                	cdqe   
  800607:	48 89 c7             	mov    rdi,rax
  80060a:	e8 99 2f 00 00       	call   8035a8 <dispose_driver>
  80060f:	e9 c4 01 00 00       	jmp    8007d8 <syscall+0x241>
        case 4:return call_drv_func(b,c,d);
  800614:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  800617:	48 98                	cdqe   
  800619:	48 89 c2             	mov    rdx,rax
  80061c:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  80061f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800622:	89 ce                	mov    esi,ecx
  800624:	89 c7                	mov    edi,eax
  800626:	e8 88 2c 00 00       	call   8032b3 <call_drv_func>
  80062b:	e9 a8 01 00 00       	jmp    8007d8 <syscall+0x241>
        case 5:return req_page_at(b,c);
  800630:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800633:	48 98                	cdqe   
  800635:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  800638:	89 d6                	mov    esi,edx
  80063a:	48 89 c7             	mov    rdi,rax
  80063d:	e8 50 11 00 00       	call   801792 <req_page_at>
  800642:	e9 91 01 00 00       	jmp    8007d8 <syscall+0x241>
        case 6:return free_page(b);
  800647:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80064a:	48 98                	cdqe   
  80064c:	48 89 c7             	mov    rdi,rax
  80064f:	e8 52 0f 00 00       	call   8015a6 <free_page>
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
  800671:	e8 9e 41 00 00       	call   804814 <reg_proc>
  800676:	e9 5d 01 00 00       	jmp    8007d8 <syscall+0x241>
        case 8:del_proc(b);
  80067b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80067e:	89 c7                	mov    edi,eax
  800680:	e8 61 3f 00 00       	call   8045e6 <del_proc>
        case 10:chk_vm(b,c);
  800685:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  800688:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80068b:	89 d6                	mov    esi,edx
  80068d:	89 c7                	mov    edi,eax
  80068f:	e8 d7 11 00 00       	call   80186b <chk_vm>
        case 11:return sys_open(b,c);
  800694:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800697:	48 98                	cdqe   
  800699:	48 89 c2             	mov    rdx,rax
  80069c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80069f:	89 c6                	mov    esi,eax
  8006a1:	48 89 d7             	mov    rdi,rdx
  8006a4:	e8 a6 15 00 00       	call   801c4f <sys_open>
  8006a9:	e9 2a 01 00 00       	jmp    8007d8 <syscall+0x241>
        case 12:return sys_close(b);
  8006ae:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006b1:	89 c7                	mov    edi,eax
  8006b3:	e8 60 1a 00 00       	call   802118 <sys_close>
  8006b8:	e9 1b 01 00 00       	jmp    8007d8 <syscall+0x241>
        case 13:return sys_read(b,c,d);
  8006bd:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8006c0:	48 98                	cdqe   
  8006c2:	48 89 c1             	mov    rcx,rax
  8006c5:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006c8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006cb:	48 89 ce             	mov    rsi,rcx
  8006ce:	89 c7                	mov    edi,eax
  8006d0:	e8 59 1b 00 00       	call   80222e <sys_read>
  8006d5:	e9 fe 00 00 00       	jmp    8007d8 <syscall+0x241>
        case 14:return sys_write(b,c,d);
  8006da:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8006dd:	48 98                	cdqe   
  8006df:	48 89 c1             	mov    rcx,rax
  8006e2:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006e5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006e8:	48 89 ce             	mov    rsi,rcx
  8006eb:	89 c7                	mov    edi,eax
  8006ed:	e8 ab 1a 00 00       	call   80219d <sys_write>
  8006f2:	e9 e1 00 00 00       	jmp    8007d8 <syscall+0x241>
        case 15:return sys_seek(b,c,d);
  8006f7:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006fa:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8006fd:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800700:	89 ce                	mov    esi,ecx
  800702:	89 c7                	mov    edi,eax
  800704:	e8 b6 1b 00 00       	call   8022bf <sys_seek>
  800709:	e9 ca 00 00 00       	jmp    8007d8 <syscall+0x241>
        case 16:return sys_tell(b);
  80070e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800711:	89 c7                	mov    edi,eax
  800713:	e8 ee 1b 00 00       	call   802306 <sys_tell>
  800718:	e9 bb 00 00 00       	jmp    8007d8 <syscall+0x241>
        case 17:return reg_vol(b,c,d);
  80071d:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  800720:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  800723:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800726:	89 ce                	mov    esi,ecx
  800728:	89 c7                	mov    edi,eax
  80072a:	b8 00 00 00 00       	mov    eax,0x0
  80072f:	e8 10 14 00 00       	call   801b44 <reg_vol>
  800734:	e9 9f 00 00 00       	jmp    8007d8 <syscall+0x241>
        case 18:return free_vol(b);
  800739:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80073c:	89 c7                	mov    edi,eax
  80073e:	b8 00 00 00 00       	mov    eax,0x0
  800743:	e8 e0 13 00 00       	call   801b28 <free_vol>
  800748:	e9 8b 00 00 00       	jmp    8007d8 <syscall+0x241>
        case 19:return execute(b);
  80074d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800750:	48 98                	cdqe   
  800752:	48 89 c7             	mov    rdi,rax
  800755:	e8 b5 49 00 00       	call   80510f <execute>
  80075a:	eb 7c                	jmp    8007d8 <syscall+0x241>
        case SYSCALL_EXIT:return sys_exit(b);
  80075c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80075f:	89 c7                	mov    edi,eax
  800761:	e8 8d 40 00 00       	call   8047f3 <sys_exit>
  800766:	eb 70                	jmp    8007d8 <syscall+0x241>
        case SYSCALL_CALL:return exec_call(b);
  800768:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80076b:	48 98                	cdqe   
  80076d:	48 89 c7             	mov    rdi,rax
  800770:	e8 95 4a 00 00       	call   80520a <exec_call>
  800775:	eb 61                	jmp    8007d8 <syscall+0x241>
        case SYSCALL_MKFIFO:return sys_mkfifo(b);
  800777:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80077a:	89 c7                	mov    edi,eax
  80077c:	e8 48 12 00 00       	call   8019c9 <sys_mkfifo>
  800781:	eb 55                	jmp    8007d8 <syscall+0x241>
        case SYSCALL_MALLOC:return sys_malloc(b);
  800783:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800786:	89 c7                	mov    edi,eax
  800788:	e8 22 42 00 00       	call   8049af <sys_malloc>
  80078d:	eb 49                	jmp    8007d8 <syscall+0x241>
        case SYSCALL_FREE:return sys_free(b);
  80078f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800792:	89 c7                	mov    edi,eax
  800794:	e8 bd 43 00 00       	call   804b56 <sys_free>
  800799:	eb 3d                	jmp    8007d8 <syscall+0x241>
        case SYSCALL_KB_READC:return sys_getkbc();
  80079b:	b8 00 00 00 00       	mov    eax,0x0
  8007a0:	e8 2d 60 00 00       	call   8067d2 <sys_getkbc>
  8007a5:	0f be c0             	movsx  eax,al
  8007a8:	eb 2e                	jmp    8007d8 <syscall+0x241>
        case SYSCALL_FIND_DEV:return sys_find_dev(b);
  8007aa:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8007ad:	48 98                	cdqe   
  8007af:	48 89 c7             	mov    rdi,rax
  8007b2:	e8 2c 27 00 00       	call   802ee3 <sys_find_dev>
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
  8007d1:	e8 9f 27 00 00       	call   802f75 <sys_operate_dev>
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
  80080c:	48 83 ec 70          	sub    rsp,0x70
  800810:	89 7d 9c             	mov    DWORD PTR [rbp-0x64],edi
  800813:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi

    struct multiboot_header* mbi=0ul;
  800817:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  80081e:	00 
    mbi=(struct multiboot_header*)addr;
  80081f:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  800823:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    init_logging();
  800827:	b8 00 00 00 00       	mov    eax,0x0
  80082c:	e8 90 03 00 00       	call   800bc1 <init_logging>
    }
    //获取tags
    struct multiboot_tag *tag;

	unsigned size;
    size = *(unsigned long*)addr;
  800831:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  800835:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800838:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
//    //printf("Announced mbi size 0x%x\n", size);
	for (tag = (struct multiboot_tag *)(addr + 8);
  80083b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
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
  80085d:	48 8b 04 c5 10 29 81 	mov    rax,QWORD PTR [rax*8+0x812910]
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
  800871:	e8 29 08 00 00       	call   80109f <set_high_mem_base>
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
  8008a7:	e8 0a 08 00 00       	call   8010b6 <set_mem_area>
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
  8008df:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
			void *fb = (void *) FRAMEBUFFER_ADDR;
  8008e3:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x40000000
  8008ea:	40 
			set_framebuffer(*tagfb);
  8008eb:	48 83 ec 08          	sub    rsp,0x8
  8008ef:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8008f3:	ff 70 20             	push   QWORD PTR [rax+0x20]
  8008f6:	ff 70 18             	push   QWORD PTR [rax+0x18]
  8008f9:	ff 70 10             	push   QWORD PTR [rax+0x10]
  8008fc:	ff 70 08             	push   QWORD PTR [rax+0x8]
  8008ff:	ff 30                	push   QWORD PTR [rax]
  800901:	e8 a4 53 00 00       	call   805caa <set_framebuffer>
  800906:	48 83 c4 30          	add    rsp,0x30

            init_framebuffer();
  80090a:	b8 00 00 00 00       	mov    eax,0x0
  80090f:	e8 01 52 00 00       	call   805b15 <init_framebuffer>
			switch (tagfb->common.framebuffer_type)
  800914:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
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
  800943:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800947:	48 83 c0 22          	add    rax,0x22
  80094b:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax

				color = 0;
  80094f:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
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
  800975:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
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
  800998:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
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
  8009be:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8009c2:	48 01 d0             	add    rax,rdx
  8009c5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8009c8:	0f b6 c8             	movzx  ecx,al
  8009cb:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009ce:	48 89 d0             	mov    rax,rdx
  8009d1:	48 01 c0             	add    rax,rax
  8009d4:	48 01 c2             	add    rdx,rax
  8009d7:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8009db:	48 01 d0             	add    rax,rdx
  8009de:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8009e1:	0f b6 c0             	movzx  eax,al
  8009e4:	0f af c1             	imul   eax,ecx
  8009e7:	01 c6                	add    esi,eax
  8009e9:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009ec:	48 89 d0             	mov    rax,rdx
  8009ef:	48 01 c0             	add    rax,rax
  8009f2:	48 01 c2             	add    rdx,rax
  8009f5:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8009f9:	48 01 d0             	add    rax,rdx
  8009fc:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  800a00:	0f b6 c8             	movzx  ecx,al
  800a03:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800a06:	48 89 d0             	mov    rax,rdx
  800a09:	48 01 c0             	add    rax,rax
  800a0c:	48 01 c2             	add    rdx,rax
  800a0f:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  800a13:	48 01 d0             	add    rax,rdx
  800a16:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  800a1a:	0f b6 c0             	movzx  eax,al
  800a1d:	0f af c1             	imul   eax,ecx
  800a20:	01 f0                	add    eax,esi
  800a22:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
					if (distance < best_distance)
  800a25:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  800a28:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  800a2b:	73 0c                	jae    800a39 <main+0x235>
					{
						color = i;
  800a2d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800a30:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
						best_distance = distance;
  800a33:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  800a36:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
				for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
  800a39:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  800a3d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
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
  800a53:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800a57:	0f b6 40 25          	movzx  eax,BYTE PTR [rax+0x25]
  800a5b:	0f b6 c0             	movzx  eax,al
  800a5e:	ba 01 00 00 00       	mov    edx,0x1
  800a63:	89 c1                	mov    ecx,eax
  800a65:	d3 e2                	shl    edx,cl
  800a67:	89 d0                	mov    eax,edx
  800a69:	8d 50 ff             	lea    edx,[rax-0x1]
  800a6c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800a70:	0f b6 40 24          	movzx  eax,BYTE PTR [rax+0x24]
  800a74:	0f b6 c0             	movzx  eax,al
  800a77:	89 c1                	mov    ecx,eax
  800a79:	d3 e2                	shl    edx,cl
  800a7b:	89 d0                	mov    eax,edx
  800a7d:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
				break;
  800a80:	eb 11                	jmp    800a93 <main+0x28f>

			case MULTIBOOT_FRAMEBUFFER_TYPE_EGA_TEXT:
				color = '\\' | 0x0100;
  800a82:	c7 45 bc 5c 01 00 00 	mov    DWORD PTR [rbp-0x44],0x15c
				break;
  800a89:	eb 08                	jmp    800a93 <main+0x28f>

			default:
				color = 0xffffffff;
  800a8b:	c7 45 bc ff ff ff ff 	mov    DWORD PTR [rbp-0x44],0xffffffff
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
  800ad0:	88 45 d3             	mov    BYTE PTR [rbp-0x2d],al
	//printf("disk count:%d\n",disk_count);
    init_font();
  800ad3:	b8 00 00 00 00       	mov    eax,0x0
  800ad8:	e8 f7 50 00 00       	call   805bd4 <init_font>
    //初始化区域
    //fill_rect(0,0,100,100,255);
    print("gamessis os loaded.\nkernel:>");
  800add:	bf c8 28 81 00       	mov    edi,0x8128c8
  800ae2:	e8 86 55 00 00       	call   80606d <print>
    init_int();
  800ae7:	b8 00 00 00 00       	mov    eax,0x0
  800aec:	e8 0f f5 ff ff       	call   800000 <init_int>
    print("int loaded.\n");
  800af1:	bf e5 28 81 00       	mov    edi,0x8128e5
  800af6:	e8 72 55 00 00       	call   80606d <print>
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
  800b2f:	e8 3c 42 00 00       	call   804d70 <set_tss>
  800b34:	48 83 c4 20          	add    rsp,0x20
    init_memory();
  800b38:	b8 00 00 00 00       	mov    eax,0x0
  800b3d:	e8 2b 08 00 00       	call   80136d <init_memory>
    init_com(PORT_COM1);
  800b42:	bf f8 03 00 00       	mov    edi,0x3f8
  800b47:	e8 c8 97 00 00       	call   80a314 <init_com>
    com_puts("gamessis os loaded.",PORT_COM1);
  800b4c:	be f8 03 00 00       	mov    esi,0x3f8
  800b51:	bf f2 28 81 00       	mov    edi,0x8128f2
  800b56:	e8 05 99 00 00       	call   80a460 <com_puts>
	init_paging();
  800b5b:	b8 00 00 00 00       	mov    eax,0x0
  800b60:	e8 2f 05 00 00       	call   801094 <init_paging>
 	init_gdt();
  800b65:	b8 00 00 00 00       	mov    eax,0x0
  800b6a:	e8 3e 43 00 00       	call   804ead <init_gdt>
    init_drvdev_man();
  800b6f:	b8 00 00 00 00       	mov    eax,0x0
  800b74:	e8 18 1f 00 00       	call   802a91 <init_drvdev_man>
    init_proc();
  800b79:	b8 00 00 00 00       	mov    eax,0x0
  800b7e:	e8 f9 2d 00 00       	call   80397c <init_proc>
    //自带驱动
    //init_tty();
    init_kb();
  800b83:	b8 00 00 00 00       	mov    eax,0x0
  800b88:	e8 12 5b 00 00       	call   80669f <init_kb>
//    init_disk();

    for(int i=0;i<30;i++)
  800b8d:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
  800b94:	eb 0e                	jmp    800ba4 <main+0x3a0>
        print("a\n");
  800b96:	bf 06 29 81 00       	mov    edi,0x812906
  800b9b:	e8 cd 54 00 00       	call   80606d <print>
    for(int i=0;i<30;i++)
  800ba0:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
  800ba4:	83 7d e4 1d          	cmp    DWORD PTR [rbp-0x1c],0x1d
  800ba8:	7e ec                	jle    800b96 <main+0x392>
    sti();
  800baa:	fb                   	sti    
    DISK1_FAT32_FS_init();
  800bab:	b8 00 00 00 00       	mov    eax,0x0
  800bb0:	e8 c5 8d 00 00       	call   80997a <DISK1_FAT32_FS_init>
//    init_fat16();

//    extern device *dev_tree[];
//    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
//    mount_fs("fat16",p->par,vmalloc());
    manage_proc_lock=0;
  800bb5:	c7 05 a9 a2 00 00 00 	mov    DWORD PTR [rip+0xa2a9],0x0        # 80ae68 <manage_proc_lock>
  800bbc:	00 00 00 

    while (1);
  800bbf:	eb fe                	jmp    800bbf <main+0x3bb>

0000000000800bc1 <init_logging>:
static unsigned char* video;
static int xpos,ypos;
/* 将整数 D 转换为字符串并保存在 BUF 中。如果 BASE 为 'd'，则 D 为十进制，如果 BASE 为 'x'，则 D 为十六进制。 */

int init_logging()
{
  800bc1:	f3 0f 1e fa          	endbr64 
  800bc5:	55                   	push   rbp
  800bc6:	48 89 e5             	mov    rbp,rsp
    video=0xb8000;
  800bc9:	48 c7 05 2c f4 bf ff 	mov    QWORD PTR [rip+0xffffffffffbff42c],0xb8000        # 400000 <video>
  800bd0:	00 80 0b 00 
    xpos=0;
  800bd4:	c7 05 2a f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff42a],0x0        # 400008 <xpos>
  800bdb:	00 00 00 
    ypos=0;
  800bde:	c7 05 24 f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff424],0x0        # 40000c <ypos>
  800be5:	00 00 00 
}
  800be8:	90                   	nop
  800be9:	5d                   	pop    rbp
  800bea:	c3                   	ret    

0000000000800beb <itoa>:

static void itoa (char *buf, int base, int d)
{
  800beb:	f3 0f 1e fa          	endbr64 
  800bef:	55                   	push   rbp
  800bf0:	48 89 e5             	mov    rbp,rsp
  800bf3:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  800bf7:	89 75 c4             	mov    DWORD PTR [rbp-0x3c],esi
  800bfa:	89 55 c0             	mov    DWORD PTR [rbp-0x40],edx
    char *p = buf;
  800bfd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800c01:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char *p1, *p2;
    unsigned long ud = d;
  800c05:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800c08:	48 98                	cdqe   
  800c0a:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    int divisor = 10;
  800c0e:	c7 45 dc 0a 00 00 00 	mov    DWORD PTR [rbp-0x24],0xa
 
    /* 如果指定了 %d 并且 D 是负数，在开始添上负号。 */
    if (base == 'd' && d < 0)
  800c15:	83 7d c4 64          	cmp    DWORD PTR [rbp-0x3c],0x64
  800c19:	75 27                	jne    800c42 <itoa+0x57>
  800c1b:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
  800c1f:	79 21                	jns    800c42 <itoa+0x57>
    {
        *p++ = '-';
  800c21:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c25:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800c29:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800c2d:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
        buf++;
  800c30:	48 83 45 c8 01       	add    QWORD PTR [rbp-0x38],0x1
        ud = -d;
  800c35:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800c38:	f7 d8                	neg    eax
  800c3a:	48 98                	cdqe   
  800c3c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800c40:	eb 0d                	jmp    800c4f <itoa+0x64>
    }
    else if (base == 'x')
  800c42:	83 7d c4 78          	cmp    DWORD PTR [rbp-0x3c],0x78
  800c46:	75 07                	jne    800c4f <itoa+0x64>
        divisor = 16;
  800c48:	c7 45 dc 10 00 00 00 	mov    DWORD PTR [rbp-0x24],0x10
 
    /* 用 DIVISOR 去除 UD 直到 UD == 0。 */
    do
    {
        int remainder = ud % divisor;
  800c4f:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800c52:	48 63 c8             	movsxd rcx,eax
  800c55:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800c59:	ba 00 00 00 00       	mov    edx,0x0
  800c5e:	48 f7 f1             	div    rcx
  800c61:	48 89 d0             	mov    rax,rdx
  800c64:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
 
        *p++ = (remainder < 10) ? remainder + '0' : remainder + 'a' - 10;
  800c67:	83 7d d8 09          	cmp    DWORD PTR [rbp-0x28],0x9
  800c6b:	7f 0a                	jg     800c77 <itoa+0x8c>
  800c6d:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800c70:	83 c0 30             	add    eax,0x30
  800c73:	89 c1                	mov    ecx,eax
  800c75:	eb 08                	jmp    800c7f <itoa+0x94>
  800c77:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800c7a:	83 c0 57             	add    eax,0x57
  800c7d:	89 c1                	mov    ecx,eax
  800c7f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c83:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800c87:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800c8b:	88 08                	mov    BYTE PTR [rax],cl
    }
    while (ud /= divisor);
  800c8d:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800c90:	48 63 f0             	movsxd rsi,eax
  800c93:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800c97:	ba 00 00 00 00       	mov    edx,0x0
  800c9c:	48 f7 f6             	div    rsi
  800c9f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800ca3:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  800ca8:	75 a5                	jne    800c4f <itoa+0x64>
 
    /* 在字符串尾添上终结符。 */
    *p = 0;
  800caa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800cae:	c6 00 00             	mov    BYTE PTR [rax],0x0
 
    /* 反转 BUF。 */
    p1 = buf;
  800cb1:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800cb5:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    p2 = p - 1;
  800cb9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800cbd:	48 83 e8 01          	sub    rax,0x1
  800cc1:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    while (p1 < p2)
  800cc5:	eb 2b                	jmp    800cf2 <itoa+0x107>
    {
        char tmp = *p1;
  800cc7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800ccb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800cce:	88 45 d7             	mov    BYTE PTR [rbp-0x29],al
        *p1 = *p2;
  800cd1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800cd5:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  800cd8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800cdc:	88 10                	mov    BYTE PTR [rax],dl
        *p2 = tmp;
  800cde:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800ce2:	0f b6 55 d7          	movzx  edx,BYTE PTR [rbp-0x29]
  800ce6:	88 10                	mov    BYTE PTR [rax],dl
        p1++;
  800ce8:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        p2--;
  800ced:	48 83 6d e8 01       	sub    QWORD PTR [rbp-0x18],0x1
    while (p1 < p2)
  800cf2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800cf6:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
  800cfa:	72 cb                	jb     800cc7 <itoa+0xdc>
    }
}
  800cfc:	90                   	nop
  800cfd:	90                   	nop
  800cfe:	5d                   	pop    rbp
  800cff:	c3                   	ret    

0000000000800d00 <putchar>:
 
/* 在屏幕上输出字符 C 。 */
static void putchar (char c)
{
  800d00:	f3 0f 1e fa          	endbr64 
  800d04:	55                   	push   rbp
  800d05:	48 89 e5             	mov    rbp,rsp
  800d08:	48 83 ec 20          	sub    rsp,0x20
  800d0c:	89 f8                	mov    eax,edi
  800d0e:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    char s[2]={c,'\0'};
  800d11:	0f b6 45 ec          	movzx  eax,BYTE PTR [rbp-0x14]
  800d15:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
  800d18:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
    print(s);
  800d1c:	48 8d 45 fe          	lea    rax,[rbp-0x2]
  800d20:	48 89 c7             	mov    rdi,rax
  800d23:	e8 45 53 00 00       	call   80606d <print>
    *(video + (xpos + ypos * COLUMNS) * 2 + 1) = ATTRIBUTE;
 
    xpos++;
    if (xpos >= COLUMNS)
        goto newline;
}
  800d28:	c9                   	leave  
  800d29:	c3                   	ret    

0000000000800d2a <printf>:
 
/* 格式化字符串并在屏幕上输出，就像 libc 函数 printf 一样。 */
void printf (const char *format, ...)
{
  800d2a:	f3 0f 1e fa          	endbr64 
  800d2e:	55                   	push   rbp
  800d2f:	48 89 e5             	mov    rbp,rsp
  800d32:	48 81 ec f0 00 00 00 	sub    rsp,0xf0
  800d39:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
  800d40:	48 89 b5 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rsi
  800d47:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  800d4e:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  800d55:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  800d5c:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  800d63:	84 c0                	test   al,al
  800d65:	74 20                	je     800d87 <printf+0x5d>
  800d67:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  800d6b:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  800d6f:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  800d73:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  800d77:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  800d7b:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  800d7f:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  800d83:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7
    char **arg = (char **) &format;
  800d87:	48 8d 85 18 ff ff ff 	lea    rax,[rbp-0xe8]
  800d8e:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char c;
    char buf[20];
 
    arg++;
  800d95:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x8
  800d9c:	08 
 
    while ((c = *format++) != 0)
  800d9d:	e9 29 01 00 00       	jmp    800ecb <printf+0x1a1>
    {
        if (c != '%')
  800da2:	80 bd 3f ff ff ff 25 	cmp    BYTE PTR [rbp-0xc1],0x25
  800da9:	74 13                	je     800dbe <printf+0x94>
            putchar (c);
  800dab:	0f be 85 3f ff ff ff 	movsx  eax,BYTE PTR [rbp-0xc1]
  800db2:	89 c7                	mov    edi,eax
  800db4:	e8 47 ff ff ff       	call   800d00 <putchar>
  800db9:	e9 0d 01 00 00       	jmp    800ecb <printf+0x1a1>
        else
        {
            char *p;
 
            c = *format++;
  800dbe:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800dc5:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800dc9:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800dd0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800dd3:	88 85 3f ff ff ff    	mov    BYTE PTR [rbp-0xc1],al
            switch (c)
  800dd9:	0f be 85 3f ff ff ff 	movsx  eax,BYTE PTR [rbp-0xc1]
  800de0:	83 f8 78             	cmp    eax,0x78
  800de3:	74 26                	je     800e0b <printf+0xe1>
  800de5:	83 f8 78             	cmp    eax,0x78
  800de8:	0f 8f be 00 00 00    	jg     800eac <printf+0x182>
  800dee:	83 f8 75             	cmp    eax,0x75
  800df1:	74 18                	je     800e0b <printf+0xe1>
  800df3:	83 f8 75             	cmp    eax,0x75
  800df6:	0f 8f b0 00 00 00    	jg     800eac <printf+0x182>
  800dfc:	83 f8 64             	cmp    eax,0x64
  800dff:	74 0a                	je     800e0b <printf+0xe1>
  800e01:	83 f8 73             	cmp    eax,0x73
  800e04:	74 41                	je     800e47 <printf+0x11d>
  800e06:	e9 a1 00 00 00       	jmp    800eac <printf+0x182>
            {
            case 'd':
            case 'u':
            case 'x':
                itoa (buf, c, *((int *) arg++));
  800e0b:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e12:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800e16:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800e1d:	8b 10                	mov    edx,DWORD PTR [rax]
  800e1f:	0f be 8d 3f ff ff ff 	movsx  ecx,BYTE PTR [rbp-0xc1]
  800e26:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800e2d:	89 ce                	mov    esi,ecx
  800e2f:	48 89 c7             	mov    rdi,rax
  800e32:	e8 b4 fd ff ff       	call   800beb <itoa>
                p = buf;
  800e37:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800e3e:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                goto string;
  800e45:	eb 34                	jmp    800e7b <printf+0x151>
                break;
 
            case 's':
                p = *arg++;
  800e47:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e4e:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800e52:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800e59:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800e5c:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                if (! p)
  800e63:	48 83 bd 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],0x0
  800e6a:	00 
  800e6b:	75 0d                	jne    800e7a <printf+0x150>
                    p = "(null)";
  800e6d:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x812958
  800e74:	58 29 81 00 
  800e78:	eb 22                	jmp    800e9c <printf+0x172>
 
string:
  800e7a:	90                   	nop
                while (*p)
  800e7b:	eb 1f                	jmp    800e9c <printf+0x172>
                    putchar (*p++);
  800e7d:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800e84:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800e88:	48 89 95 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rdx
  800e8f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800e92:	0f be c0             	movsx  eax,al
  800e95:	89 c7                	mov    edi,eax
  800e97:	e8 64 fe ff ff       	call   800d00 <putchar>
                while (*p)
  800e9c:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800ea3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800ea6:	84 c0                	test   al,al
  800ea8:	75 d3                	jne    800e7d <printf+0x153>
                break;
  800eaa:	eb 1f                	jmp    800ecb <printf+0x1a1>
 
            default:
                putchar (*((int *) arg++));
  800eac:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800eb3:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800eb7:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800ebe:	8b 00                	mov    eax,DWORD PTR [rax]
  800ec0:	0f be c0             	movsx  eax,al
  800ec3:	89 c7                	mov    edi,eax
  800ec5:	e8 36 fe ff ff       	call   800d00 <putchar>
                break;
  800eca:	90                   	nop
    while ((c = *format++) != 0)
  800ecb:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800ed2:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800ed6:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800edd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800ee0:	88 85 3f ff ff ff    	mov    BYTE PTR [rbp-0xc1],al
  800ee6:	80 bd 3f ff ff ff 00 	cmp    BYTE PTR [rbp-0xc1],0x0
  800eed:	0f 85 af fe ff ff    	jne    800da2 <printf+0x78>
            }
        }
    }
}
  800ef3:	90                   	nop
  800ef4:	90                   	nop
  800ef5:	c9                   	leave  
  800ef6:	c3                   	ret    

0000000000800ef7 <mmap>:
//以kb为单位
int high_mem_base=1024;
int mmap_t_i=0;

stat_t mmap(addr_t pa,addr_t la,u32 attr)
{
  800ef7:	f3 0f 1e fa          	endbr64 
  800efb:	55                   	push   rbp
  800efc:	48 89 e5             	mov    rbp,rsp
  800eff:	48 83 ec 40          	sub    rsp,0x40
  800f03:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  800f07:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  800f0b:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    page_item *pdptp= (page_item *) (pml4[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
  800f0e:	48 8b 15 6b 9f 00 00 	mov    rdx,QWORD PTR [rip+0x9f6b]        # 80ae80 <pml4>
  800f15:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800f19:	48 c1 e8 27          	shr    rax,0x27
  800f1d:	48 c1 e0 03          	shl    rax,0x3
  800f21:	48 01 d0             	add    rax,rdx
  800f24:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f27:	b0 00                	mov    al,0x0
  800f29:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
  800f2d:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  800f34:	00 00 00 
  800f37:	48 23 45 d0          	and    rax,QWORD PTR [rbp-0x30]
  800f3b:	48 c1 e8 1e          	shr    rax,0x1e
  800f3f:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
  800f42:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800f45:	48 98                	cdqe   
  800f47:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800f4e:	00 
  800f4f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800f53:	48 01 d0             	add    rax,rdx
  800f56:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f59:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
  800f5d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f61:	83 e0 01             	and    eax,0x1
  800f64:	48 85 c0             	test   rax,rax
  800f67:	75 45                	jne    800fae <mmap+0xb7>
    {
        pdp=(page_item*)vmalloc();
  800f69:	b8 00 00 00 00       	mov    eax,0x0
  800f6e:	e8 cf 01 00 00       	call   801142 <vmalloc>
  800f73:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        memset(pdp,0,4096);
  800f77:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f7b:	ba 00 10 00 00       	mov    edx,0x1000
  800f80:	be 00 00 00 00       	mov    esi,0x0
  800f85:	48 89 c7             	mov    rdi,rax
  800f88:	e8 c3 95 00 00       	call   80a550 <memset>
        pdptp[pdpti]=(addr_t)pdp|attr;
  800f8d:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800f90:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  800f94:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800f97:	48 98                	cdqe   
  800f99:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800fa0:	00 
  800fa1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800fa5:	48 01 f0             	add    rax,rsi
  800fa8:	48 09 ca             	or     rdx,rcx
  800fab:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pdp=(page_item*)((addr_t)pdp&~0xff);
  800fae:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800fb2:	b0 00                	mov    al,0x0
  800fb4:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
  800fb8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800fbc:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800fc1:	48 c1 e8 15          	shr    rax,0x15
  800fc5:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800fcc:	00 
  800fcd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800fd1:	48 01 d0             	add    rax,rdx
  800fd4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800fd7:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!((unsigned long long)pt & PAGE_PRESENT))
  800fdb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800fdf:	83 e0 01             	and    eax,0x1
  800fe2:	48 85 c0             	test   rax,rax
  800fe5:	75 4d                	jne    801034 <mmap+0x13d>
    {
        pt=(page_item*)vmalloc();
  800fe7:	b8 00 00 00 00       	mov    eax,0x0
  800fec:	e8 51 01 00 00       	call   801142 <vmalloc>
  800ff1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        memset(pt,0,4096);
  800ff5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800ff9:	ba 00 10 00 00       	mov    edx,0x1000
  800ffe:	be 00 00 00 00       	mov    esi,0x0
  801003:	48 89 c7             	mov    rdi,rax
  801006:	e8 45 95 00 00       	call   80a550 <memset>
        pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
  80100b:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  80100e:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  801012:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  801016:	25 ff ff ff 3f       	and    eax,0x3fffffff
  80101b:	48 c1 e8 15          	shr    rax,0x15
  80101f:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  801026:	00 
  801027:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80102b:	48 01 f0             	add    rax,rsi
  80102e:	48 09 ca             	or     rdx,rcx
  801031:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pt=(page_item*)((addr_t)pt & ~0xff);
  801034:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801038:	b0 00                	mov    al,0x0
  80103a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
  80103e:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  801041:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  801045:	81 e2 ff ff 1f 00    	and    edx,0x1fffff
  80104b:	48 c1 ea 0c          	shr    rdx,0xc
  80104f:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
  801056:	00 
  801057:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80105b:	48 01 ca             	add    rdx,rcx
  80105e:	48 0b 45 d8          	or     rax,QWORD PTR [rbp-0x28]
  801062:	48 89 02             	mov    QWORD PTR [rdx],rax
    return NORMAL;
  801065:	b8 00 00 00 00       	mov    eax,0x0
}
  80106a:	c9                   	leave  
  80106b:	c3                   	ret    

000000000080106c <mdemap>:

stat_t mdemap(addr_t la)
{
  80106c:	f3 0f 1e fa          	endbr64 
  801070:	55                   	push   rbp
  801071:	48 89 e5             	mov    rbp,rsp
  801074:	48 83 ec 10          	sub    rsp,0x10
  801078:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return mmap(0l,la,0);
  80107c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801080:	ba 00 00 00 00       	mov    edx,0x0
  801085:	48 89 c6             	mov    rsi,rax
  801088:	bf 00 00 00 00       	mov    edi,0x0
  80108d:	e8 65 fe ff ff       	call   800ef7 <mmap>
}
  801092:	c9                   	leave  
  801093:	c3                   	ret    

0000000000801094 <init_paging>:
int init_paging()
{
  801094:	f3 0f 1e fa          	endbr64 
  801098:	55                   	push   rbp
  801099:	48 89 e5             	mov    rbp,rsp
    //设置第一项pdpte，也就是内核空间
//    set_1gb_pdpt(pdpt,0,PAGE_RWX);//设置PDPT0x40000000ul
//    set_page_item(pdpt+1,PD_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);

    #endif
}
  80109c:	90                   	nop
  80109d:	5d                   	pop    rbp
  80109e:	c3                   	ret    

000000000080109f <set_high_mem_base>:
void set_high_mem_base(int base)
{
  80109f:	f3 0f 1e fa          	endbr64 
  8010a3:	55                   	push   rbp
  8010a4:	48 89 e5             	mov    rbp,rsp
  8010a7:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    high_mem_base=base;
  8010aa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8010ad:	89 05 e5 9d 00 00    	mov    DWORD PTR [rip+0x9de5],eax        # 80ae98 <high_mem_base>
}
  8010b3:	90                   	nop
  8010b4:	5d                   	pop    rbp
  8010b5:	c3                   	ret    

00000000008010b6 <set_mem_area>:
void set_mem_area(unsigned long base, unsigned long len, unsigned long type)
{
  8010b6:	f3 0f 1e fa          	endbr64 
  8010ba:	55                   	push   rbp
  8010bb:	48 89 e5             	mov    rbp,rsp
  8010be:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8010c2:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8010c6:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
    mmap_struct[mmap_t_i].base=base;
  8010ca:	8b 05 50 f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff150]        # 400220 <mmap_t_i>
  8010d0:	48 63 d0             	movsxd rdx,eax
  8010d3:	48 89 d0             	mov    rax,rdx
  8010d6:	48 01 c0             	add    rax,rax
  8010d9:	48 01 d0             	add    rax,rdx
  8010dc:	48 c1 e0 03          	shl    rax,0x3
  8010e0:	48 8d 90 40 00 40 00 	lea    rdx,[rax+0x400040]
  8010e7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8010eb:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i].len=len;
  8010ee:	8b 05 2c f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff12c]        # 400220 <mmap_t_i>
  8010f4:	48 63 d0             	movsxd rdx,eax
  8010f7:	48 89 d0             	mov    rax,rdx
  8010fa:	48 01 c0             	add    rax,rax
  8010fd:	48 01 d0             	add    rax,rdx
  801100:	48 c1 e0 03          	shl    rax,0x3
  801104:	48 8d 90 48 00 40 00 	lea    rdx,[rax+0x400048]
  80110b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80110f:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i++].type=type;
  801112:	8b 05 08 f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff108]        # 400220 <mmap_t_i>
  801118:	8d 50 01             	lea    edx,[rax+0x1]
  80111b:	89 15 ff f0 bf ff    	mov    DWORD PTR [rip+0xffffffffffbff0ff],edx        # 400220 <mmap_t_i>
  801121:	48 63 d0             	movsxd rdx,eax
  801124:	48 89 d0             	mov    rax,rdx
  801127:	48 01 c0             	add    rax,rax
  80112a:	48 01 d0             	add    rax,rdx
  80112d:	48 c1 e0 03          	shl    rax,0x3
  801131:	48 8d 90 50 00 40 00 	lea    rdx,[rax+0x400050]
  801138:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80113c:	48 89 02             	mov    QWORD PTR [rdx],rax
}
  80113f:	90                   	nop
  801140:	5d                   	pop    rbp
  801141:	c3                   	ret    

0000000000801142 <vmalloc>:
addr_t vmalloc()
{
  801142:	f3 0f 1e fa          	endbr64 
  801146:	55                   	push   rbp
  801147:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<VMALLOC_PGN/32;i++)
  80114a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801151:	eb 76                	jmp    8011c9 <vmalloc+0x87>
    {
        for(int j=0;j<32;j++)
  801153:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80115a:	eb 63                	jmp    8011bf <vmalloc+0x7d>
        {
            if(!(vmalloc_map[i]&(1<<j)))
  80115c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80115f:	48 98                	cdqe   
  801161:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  801168:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80116b:	be 01 00 00 00       	mov    esi,0x1
  801170:	89 c1                	mov    ecx,eax
  801172:	d3 e6                	shl    esi,cl
  801174:	89 f0                	mov    eax,esi
  801176:	21 d0                	and    eax,edx
  801178:	85 c0                	test   eax,eax
  80117a:	75 3f                	jne    8011bb <vmalloc+0x79>
            {
                vmalloc_map[i]|=(1<<j);
  80117c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80117f:	48 98                	cdqe   
  801181:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  801188:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80118b:	be 01 00 00 00       	mov    esi,0x1
  801190:	89 c1                	mov    ecx,eax
  801192:	d3 e6                	shl    esi,cl
  801194:	89 f0                	mov    eax,esi
  801196:	09 c2                	or     edx,eax
  801198:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80119b:	48 98                	cdqe   
  80119d:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
                return VMALLOC_BASE+(i*32+j)*0x1000;
  8011a4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8011a7:	c1 e0 05             	shl    eax,0x5
  8011aa:	89 c2                	mov    edx,eax
  8011ac:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8011af:	01 d0                	add    eax,edx
  8011b1:	83 c0 20             	add    eax,0x20
  8011b4:	c1 e0 0c             	shl    eax,0xc
  8011b7:	48 98                	cdqe   
  8011b9:	eb 14                	jmp    8011cf <vmalloc+0x8d>
        for(int j=0;j<32;j++)
  8011bb:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8011bf:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  8011c3:	7e 97                	jle    80115c <vmalloc+0x1a>
    for(int i=0;i<VMALLOC_PGN/32;i++)
  8011c5:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8011c9:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  8011cd:	7e 84                	jle    801153 <vmalloc+0x11>
            }
        }
    }
}
  8011cf:	5d                   	pop    rbp
  8011d0:	c3                   	ret    

00000000008011d1 <vmfree>:

int vmfree(addr_t ptr)
{
  8011d1:	f3 0f 1e fa          	endbr64 
  8011d5:	55                   	push   rbp
  8011d6:	48 89 e5             	mov    rbp,rsp
  8011d9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=ptr/PAGE_SIZE;
  8011dd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8011e1:	48 c1 e8 0c          	shr    rax,0xc
  8011e5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  8011e8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8011eb:	8d 50 1f             	lea    edx,[rax+0x1f]
  8011ee:	85 c0                	test   eax,eax
  8011f0:	0f 48 c2             	cmovs  eax,edx
  8011f3:	c1 f8 05             	sar    eax,0x5
  8011f6:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  8011f9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8011fc:	99                   	cdq    
  8011fd:	c1 ea 1b             	shr    edx,0x1b
  801200:	01 d0                	add    eax,edx
  801202:	83 e0 1f             	and    eax,0x1f
  801205:	29 d0                	sub    eax,edx
  801207:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    vmalloc_map[n]=vmalloc_map[n]&~(unsigned int)(1<<r);
  80120a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80120d:	48 98                	cdqe   
  80120f:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  801216:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801219:	be 01 00 00 00       	mov    esi,0x1
  80121e:	89 c1                	mov    ecx,eax
  801220:	d3 e6                	shl    esi,cl
  801222:	89 f0                	mov    eax,esi
  801224:	f7 d0                	not    eax
  801226:	21 c2                	and    edx,eax
  801228:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80122b:	48 98                	cdqe   
  80122d:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
}
  801234:	90                   	nop
  801235:	5d                   	pop    rbp
  801236:	c3                   	ret    

0000000000801237 <page_err>:
void page_err(){
  801237:	f3 0f 1e fa          	endbr64 
  80123b:	55                   	push   rbp
  80123c:	48 89 e5             	mov    rbp,rsp
  80123f:	53                   	push   rbx
  801240:	48 83 ec 28          	sub    rsp,0x28
    asm("cli");
  801244:	fa                   	cli    
    print("page err\n");
  801245:	bf 60 29 81 00       	mov    edi,0x812960
  80124a:	e8 1e 4e 00 00       	call   80606d <print>
    unsigned long err_code=0,l_addr=0;
  80124f:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  801256:	00 
  801257:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  80125e:	00 
    asm volatile("mov 0(%%rbp),%0":"=r"(err_code));
  80125f:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
  801263:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    asm volatile("mov %%cr2,%0":"=r"(l_addr));//试图访问的地址
  801267:	0f 20 d0             	mov    rax,cr2
  80126a:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    int p=err_code&1;
  80126e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801272:	83 e0 01             	and    eax,0x1
  801275:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

    if(!p)
  801278:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80127c:	75 27                	jne    8012a5 <page_err+0x6e>
        //accessing non-existent page
        //检查地址合法性
        if(l_addr>=MEM_END)
            ;
        //在进程的页表中申请新页
        mmap(vmalloc(),l_addr&~0xfff,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  80127e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801282:	48 25 00 f0 ff ff    	and    rax,0xfffffffffffff000
  801288:	48 89 c3             	mov    rbx,rax
  80128b:	b8 00 00 00 00       	mov    eax,0x0
  801290:	e8 ad fe ff ff       	call   801142 <vmalloc>
  801295:	ba 07 00 00 00       	mov    edx,0x7
  80129a:	48 89 de             	mov    rsi,rbx
  80129d:	48 89 c7             	mov    rdi,rax
  8012a0:	e8 52 fc ff ff       	call   800ef7 <mmap>
    }
    else
    {
        //page level protection
    }
    p=err_code&2;
  8012a5:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8012a9:	83 e0 02             	and    eax,0x2
  8012ac:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("when writing\n");else //puts("when reading");
  8012af:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8012b3:	74 0c                	je     8012c1 <page_err+0x8a>
  8012b5:	bf 6a 29 81 00       	mov    edi,0x81296a
  8012ba:	e8 ae 4d 00 00       	call   80606d <print>
  8012bf:	eb 0a                	jmp    8012cb <page_err+0x94>
    p=err_code&4;
  8012c1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8012c5:	83 e0 04             	and    eax,0x4
  8012c8:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(!p)print("supervisor mode\n");else //puts("user mode");
  8012cb:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8012cf:	75 0c                	jne    8012dd <page_err+0xa6>
  8012d1:	bf 78 29 81 00       	mov    edi,0x812978
  8012d6:	e8 92 4d 00 00       	call   80606d <print>
  8012db:	eb 0a                	jmp    8012e7 <page_err+0xb0>
    p=err_code&16;
  8012dd:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8012e1:	83 e0 10             	and    eax,0x10
  8012e4:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("an instruction tries to fetch\n");
  8012e7:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8012eb:	74 0a                	je     8012f7 <page_err+0xc0>
  8012ed:	bf 90 29 81 00       	mov    edi,0x812990
  8012f2:	e8 76 4d 00 00       	call   80606d <print>
    unsigned int addr=0;
  8012f7:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
    asm volatile("mov 8(%%ebp),%0":"=r"(addr));
  8012fe:	67 8b 45 08          	mov    eax,DWORD PTR [ebp+0x8]
  801302:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    printf("occurred at %x(paddr), %x(laddr)\n",addr,l_addr);
  801305:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  801309:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80130c:	89 c6                	mov    esi,eax
  80130e:	bf b0 29 81 00       	mov    edi,0x8129b0
  801313:	b8 00 00 00 00       	mov    eax,0x0
  801318:	e8 0d fa ff ff       	call   800d2a <printf>
    extern int cur_proc;
    extern struct process *task;
    if(task[cur_proc].pid==1)//系统进程
  80131d:	48 8b 0d 7c 71 c0 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc0717c]        # 4084a0 <task>
  801324:	8b 05 e2 31 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc131e2]        # 41450c <cur_proc>
  80132a:	48 63 d0             	movsxd rdx,eax
  80132d:	48 89 d0             	mov    rax,rdx
  801330:	48 01 c0             	add    rax,rax
  801333:	48 01 d0             	add    rax,rdx
  801336:	48 c1 e0 08          	shl    rax,0x8
  80133a:	48 01 c8             	add    rax,rcx
  80133d:	8b 00                	mov    eax,DWORD PTR [rax]
  80133f:	83 f8 01             	cmp    eax,0x1
  801342:	75 11                	jne    801355 <page_err+0x11e>
    {
        printf("sys died. please reboot.\n");
  801344:	bf d2 29 81 00       	mov    edi,0x8129d2
  801349:	b8 00 00 00 00       	mov    eax,0x0
  80134e:	e8 d7 f9 ff ff       	call   800d2a <printf>
        asm volatile("jmp .");
  801353:	eb fe                	jmp    801353 <page_err+0x11c>
    }
    //杀死问题进程
//    del_proc(cur_proc);
    // printf("killed the problem process.\n");
    // printf("shell:>");
    eoi();
  801355:	b8 00 00 00 00       	mov    eax,0x0
  80135a:	e8 ff 3a 00 00       	call   804e5e <eoi>
    //这里对esp的加法是必要的，因为page fault多push了一个错误码，但是iret识别不了
    __asm__ volatile ("sti \r\n  leave\n add $8,%esp \n iretq");
  80135f:	fb                   	sti    
  801360:	c9                   	leave  
  801361:	83 c4 08             	add    esp,0x8
  801364:	48 cf                	iretq  
}
  801366:	90                   	nop
  801367:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80136b:	c9                   	leave  
  80136c:	c3                   	ret    

000000000080136d <init_memory>:
void init_memory()
{
  80136d:	f3 0f 1e fa          	endbr64 
  801371:	55                   	push   rbp
  801372:	48 89 e5             	mov    rbp,rsp
    extern addr_t _knl_end,_knl_start;//lds中声明的内核的结尾地址，放置位图
    //获取内存大小
    size_t mem_size=mmap_struct[mmap_t_i-1].base+mmap_struct[mmap_t_i-1].len;
  801375:	8b 05 a5 ee bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfeea5]        # 400220 <mmap_t_i>
  80137b:	83 e8 01             	sub    eax,0x1
  80137e:	48 63 d0             	movsxd rdx,eax
  801381:	48 89 d0             	mov    rax,rdx
  801384:	48 01 c0             	add    rax,rax
  801387:	48 01 d0             	add    rax,rdx
  80138a:	48 c1 e0 03          	shl    rax,0x3
  80138e:	48 05 40 00 40 00    	add    rax,0x400040
  801394:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  801397:	8b 05 83 ee bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfee83]        # 400220 <mmap_t_i>
  80139d:	83 e8 01             	sub    eax,0x1
  8013a0:	48 63 d0             	movsxd rdx,eax
  8013a3:	48 89 d0             	mov    rax,rdx
  8013a6:	48 01 c0             	add    rax,rax
  8013a9:	48 01 d0             	add    rax,rdx
  8013ac:	48 c1 e0 03          	shl    rax,0x3
  8013b0:	48 05 48 00 40 00    	add    rax,0x400048
  8013b6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8013b9:	48 01 c8             	add    rax,rcx
  8013bc:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    //计算出所需内存页数量
    int pgc=mem_size/PAGE_SIZE;
  8013c0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8013c4:	48 c1 e8 0c          	shr    rax,0xc
  8013c8:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    //计算出位图所需的字节数
    int pg_bytes=pgc/32;
  8013cb:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8013ce:	8d 50 1f             	lea    edx,[rax+0x1f]
  8013d1:	85 c0                	test   eax,eax
  8013d3:	0f 48 c2             	cmovs  eax,edx
  8013d6:	c1 f8 05             	sar    eax,0x5
  8013d9:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    page_map=(unsigned int*)PAGE_4K_ALIGN(0xc00000);
  8013dc:	48 c7 05 39 ec bf ff 	mov    QWORD PTR [rip+0xffffffffffbfec39],0xc00000        # 400020 <page_map>
  8013e3:	00 00 c0 00 
    int* p=page_map;
  8013e7:	48 8b 05 32 ec bf ff 	mov    rax,QWORD PTR [rip+0xffffffffffbfec32]        # 400020 <page_map>
  8013ee:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    addr_t curp=0;
  8013f2:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  8013f9:	00 
    for(int i=0;i<mmap_t_i;i++){
  8013fa:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  801401:	e9 91 00 00 00       	jmp    801497 <init_memory+0x12a>
        int cont=0;
  801406:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
        if(mmap_struct[i].type!=MULTIBOOT_MEMORY_AVAILABLE)
  80140d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801410:	48 63 d0             	movsxd rdx,eax
  801413:	48 89 d0             	mov    rax,rdx
  801416:	48 01 c0             	add    rax,rax
  801419:	48 01 d0             	add    rax,rdx
  80141c:	48 c1 e0 03          	shl    rax,0x3
  801420:	48 05 50 00 40 00    	add    rax,0x400050
  801426:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801429:	48 83 f8 01          	cmp    rax,0x1
  80142d:	74 07                	je     801436 <init_memory+0xc9>
            cont=-1;
  80142f:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [rbp-0x10],0xffffffff
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  801436:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80143d:	eb 15                	jmp    801454 <init_memory+0xe7>
            *(p++)=cont;
  80143f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801443:	48 8d 50 04          	lea    rdx,[rax+0x4]
  801447:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80144b:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80144e:	89 10                	mov    DWORD PTR [rax],edx
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  801450:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801454:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801457:	48 63 c8             	movsxd rcx,eax
  80145a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80145d:	48 63 d0             	movsxd rdx,eax
  801460:	48 89 d0             	mov    rax,rdx
  801463:	48 01 c0             	add    rax,rax
  801466:	48 01 d0             	add    rax,rdx
  801469:	48 c1 e0 03          	shl    rax,0x3
  80146d:	48 05 48 00 40 00    	add    rax,0x400048
  801473:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801476:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  80147d:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  801484:	ff 00 00 
  801487:	48 21 d0             	and    rax,rdx
  80148a:	48 c1 e8 11          	shr    rax,0x11
  80148e:	48 39 c1             	cmp    rcx,rax
  801491:	72 ac                	jb     80143f <init_memory+0xd2>
    for(int i=0;i<mmap_t_i;i++){
  801493:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  801497:	8b 05 83 ed bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfed83]        # 400220 <mmap_t_i>
  80149d:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  8014a0:	0f 8c 60 ff ff ff    	jl     801406 <init_memory+0x99>
        }
    }

    //低16M空间直接被内核占用
    for(int i=0;i<128;i++){
  8014a6:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  8014ad:	eb 1d                	jmp    8014cc <init_memory+0x15f>
        page_map[i]=0xffffffff;
  8014af:	48 8b 15 6a eb bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfeb6a]        # 400020 <page_map>
  8014b6:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8014b9:	48 98                	cdqe   
  8014bb:	48 c1 e0 02          	shl    rax,0x2
  8014bf:	48 01 d0             	add    rax,rdx
  8014c2:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<128;i++){
  8014c8:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  8014cc:	83 7d e8 7f          	cmp    DWORD PTR [rbp-0x18],0x7f
  8014d0:	7e dd                	jle    8014af <init_memory+0x142>
    }
}
  8014d2:	90                   	nop
  8014d3:	90                   	nop
  8014d4:	5d                   	pop    rbp
  8014d5:	c3                   	ret    

00000000008014d6 <req_a_page>:
/*
page_map存储方式:
0x00000000
little end
*/
addr_t req_a_page(){
  8014d6:	f3 0f 1e fa          	endbr64 
  8014da:	55                   	push   rbp
  8014db:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  8014de:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8014e5:	e9 b0 00 00 00       	jmp    80159a <req_a_page+0xc4>
        for(int j=0;j<32;j++){
  8014ea:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8014f1:	e9 96 00 00 00       	jmp    80158c <req_a_page+0xb6>
            unsigned int bit=page_map[i]&(1<<j);
  8014f6:	48 8b 15 23 eb bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfeb23]        # 400020 <page_map>
  8014fd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801500:	48 98                	cdqe   
  801502:	48 c1 e0 02          	shl    rax,0x2
  801506:	48 01 d0             	add    rax,rdx
  801509:	8b 10                	mov    edx,DWORD PTR [rax]
  80150b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80150e:	be 01 00 00 00       	mov    esi,0x1
  801513:	89 c1                	mov    ecx,eax
  801515:	d3 e6                	shl    esi,cl
  801517:	89 f0                	mov    eax,esi
  801519:	21 d0                	and    eax,edx
  80151b:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            if((i*32+j)*4096>=0x100000&&!bit)
  80151e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801521:	c1 e0 05             	shl    eax,0x5
  801524:	89 c2                	mov    edx,eax
  801526:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801529:	01 d0                	add    eax,edx
  80152b:	c1 e0 0c             	shl    eax,0xc
  80152e:	3d ff ff 0f 00       	cmp    eax,0xfffff
  801533:	7e 53                	jle    801588 <req_a_page+0xb2>
  801535:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  801539:	75 4d                	jne    801588 <req_a_page+0xb2>
            {
                page_map[i]=page_map[i]|(1<<j);
  80153b:	48 8b 15 de ea bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfeade]        # 400020 <page_map>
  801542:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801545:	48 98                	cdqe   
  801547:	48 c1 e0 02          	shl    rax,0x2
  80154b:	48 01 d0             	add    rax,rdx
  80154e:	8b 10                	mov    edx,DWORD PTR [rax]
  801550:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801553:	be 01 00 00 00       	mov    esi,0x1
  801558:	89 c1                	mov    ecx,eax
  80155a:	d3 e6                	shl    esi,cl
  80155c:	89 f0                	mov    eax,esi
  80155e:	89 c6                	mov    esi,eax
  801560:	48 8b 0d b9 ea bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfeab9]        # 400020 <page_map>
  801567:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80156a:	48 98                	cdqe   
  80156c:	48 c1 e0 02          	shl    rax,0x2
  801570:	48 01 c8             	add    rax,rcx
  801573:	09 f2                	or     edx,esi
  801575:	89 10                	mov    DWORD PTR [rax],edx
                return i*32+j;//num of page
  801577:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80157a:	c1 e0 05             	shl    eax,0x5
  80157d:	89 c2                	mov    edx,eax
  80157f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801582:	01 d0                	add    eax,edx
  801584:	48 98                	cdqe   
  801586:	eb 1c                	jmp    8015a4 <req_a_page+0xce>
        for(int j=0;j<32;j++){
  801588:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80158c:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  801590:	0f 8e 60 ff ff ff    	jle    8014f6 <req_a_page+0x20>
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  801596:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80159a:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  80159e:	0f 8e 46 ff ff ff    	jle    8014ea <req_a_page+0x14>

            }
        }
    }
}
  8015a4:	5d                   	pop    rbp
  8015a5:	c3                   	ret    

00000000008015a6 <free_page>:

int free_page(char *paddr){
  8015a6:	f3 0f 1e fa          	endbr64 
  8015aa:	55                   	push   rbp
  8015ab:	48 89 e5             	mov    rbp,rsp
  8015ae:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=(int)paddr/4096;
  8015b2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8015b6:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8015bc:	85 c0                	test   eax,eax
  8015be:	0f 48 c2             	cmovs  eax,edx
  8015c1:	c1 f8 0c             	sar    eax,0xc
  8015c4:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  8015c7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8015ca:	8d 50 1f             	lea    edx,[rax+0x1f]
  8015cd:	85 c0                	test   eax,eax
  8015cf:	0f 48 c2             	cmovs  eax,edx
  8015d2:	c1 f8 05             	sar    eax,0x5
  8015d5:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  8015d8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8015db:	99                   	cdq    
  8015dc:	c1 ea 1b             	shr    edx,0x1b
  8015df:	01 d0                	add    eax,edx
  8015e1:	83 e0 1f             	and    eax,0x1f
  8015e4:	29 d0                	sub    eax,edx
  8015e6:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    page_map[n]=page_map[n]&~(unsigned int)(1<<r);
  8015e9:	48 8b 15 30 ea bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfea30]        # 400020 <page_map>
  8015f0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8015f3:	48 98                	cdqe   
  8015f5:	48 c1 e0 02          	shl    rax,0x2
  8015f9:	48 01 d0             	add    rax,rdx
  8015fc:	8b 10                	mov    edx,DWORD PTR [rax]
  8015fe:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801601:	be 01 00 00 00       	mov    esi,0x1
  801606:	89 c1                	mov    ecx,eax
  801608:	d3 e6                	shl    esi,cl
  80160a:	89 f0                	mov    eax,esi
  80160c:	f7 d0                	not    eax
  80160e:	89 c6                	mov    esi,eax
  801610:	48 8b 0d 09 ea bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfea09]        # 400020 <page_map>
  801617:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80161a:	48 98                	cdqe   
  80161c:	48 c1 e0 02          	shl    rax,0x2
  801620:	48 01 c8             	add    rax,rcx
  801623:	21 f2                	and    edx,esi
  801625:	89 10                	mov    DWORD PTR [rax],edx
}
  801627:	90                   	nop
  801628:	5d                   	pop    rbp
  801629:	c3                   	ret    

000000000080162a <check_page>:
int check_page(int num){
  80162a:	f3 0f 1e fa          	endbr64 
  80162e:	55                   	push   rbp
  80162f:	48 89 e5             	mov    rbp,rsp
  801632:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int n=num/32;
  801635:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801638:	8d 50 1f             	lea    edx,[rax+0x1f]
  80163b:	85 c0                	test   eax,eax
  80163d:	0f 48 c2             	cmovs  eax,edx
  801640:	c1 f8 05             	sar    eax,0x5
  801643:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int r=num%32;
  801646:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801649:	99                   	cdq    
  80164a:	c1 ea 1b             	shr    edx,0x1b
  80164d:	01 d0                	add    eax,edx
  80164f:	83 e0 1f             	and    eax,0x1f
  801652:	29 d0                	sub    eax,edx
  801654:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int bit=page_map[n]&(1<<r);
  801657:	48 8b 15 c2 e9 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe9c2]        # 400020 <page_map>
  80165e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801661:	48 98                	cdqe   
  801663:	48 c1 e0 02          	shl    rax,0x2
  801667:	48 01 d0             	add    rax,rdx
  80166a:	8b 10                	mov    edx,DWORD PTR [rax]
  80166c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80166f:	be 01 00 00 00       	mov    esi,0x1
  801674:	89 c1                	mov    ecx,eax
  801676:	d3 e6                	shl    esi,cl
  801678:	89 f0                	mov    eax,esi
  80167a:	21 d0                	and    eax,edx
  80167c:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    return bit;
  80167f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  801682:	5d                   	pop    rbp
  801683:	c3                   	ret    

0000000000801684 <get_phyaddr>:
/*
 * 获得这个页对应的物理内存地址
 * */
int get_phyaddr(int num){
  801684:	f3 0f 1e fa          	endbr64 
  801688:	55                   	push   rbp
  801689:	48 89 e5             	mov    rbp,rsp
  80168c:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return num*0x1000;
  80168f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801692:	c1 e0 0c             	shl    eax,0xc
}
  801695:	5d                   	pop    rbp
  801696:	c3                   	ret    

0000000000801697 <set_page_item>:

void set_page_item(page_item *item_addr,int phy_addr,int attr)
{
  801697:	f3 0f 1e fa          	endbr64 
  80169b:	55                   	push   rbp
  80169c:	48 89 e5             	mov    rbp,rsp
  80169f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8016a3:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  8016a6:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    *item_addr=0;
  8016a9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8016ad:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *item_addr|=phy_addr&0xfffff000;
  8016b4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8016b8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8016bb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8016be:	89 c0                	mov    eax,eax
  8016c0:	25 00 f0 ff ff       	and    eax,0xfffff000
  8016c5:	48 09 c2             	or     rdx,rax
  8016c8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8016cc:	48 89 10             	mov    QWORD PTR [rax],rdx
    *item_addr|=attr;
  8016cf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8016d3:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8016d6:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8016d9:	48 98                	cdqe   
  8016db:	48 09 c2             	or     rdx,rax
  8016de:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8016e2:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  8016e5:	90                   	nop
  8016e6:	5d                   	pop    rbp
  8016e7:	c3                   	ret    

00000000008016e8 <set_1gb_pdpt>:
void set_1gb_pdpt(page_item* ppdpt,int pa,unsigned int extra_attr)
{
  8016e8:	f3 0f 1e fa          	endbr64 
  8016ec:	55                   	push   rbp
  8016ed:	48 89 e5             	mov    rbp,rsp
  8016f0:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8016f4:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  8016f7:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *ppdpt=0;
  8016fa:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016fe:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *ppdpt|=PAGE_PRESENT|PDPTE_1GB|extra_attr;
  801705:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801709:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80170c:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80170f:	0c 81                	or     al,0x81
  801711:	89 c0                	mov    eax,eax
  801713:	48 09 c2             	or     rdx,rax
  801716:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80171a:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffffc0000000ul;
  80171d:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801720:	25 00 00 00 c0       	and    eax,0xc0000000
  801725:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *ppdpt|=hipa;
  801728:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80172c:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80172f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801732:	48 09 c2             	or     rdx,rax
  801735:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801739:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  80173c:	90                   	nop
  80173d:	5d                   	pop    rbp
  80173e:	c3                   	ret    

000000000080173f <set_2mb_pde>:
void set_2mb_pde(page_item* pde,int pa)
{
  80173f:	f3 0f 1e fa          	endbr64 
  801743:	55                   	push   rbp
  801744:	48 89 e5             	mov    rbp,rsp
  801747:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80174b:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    *pde=0;
  80174e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801752:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *pde|=PAGE_PRESENT|PAGE_4MB_PAGE|PDE_4MB_PAT;
  801759:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80175d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801760:	48 0d 81 10 00 00    	or     rax,0x1081
  801766:	48 89 c2             	mov    rdx,rax
  801769:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80176d:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffc00000;
  801770:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801773:	25 00 00 c0 ff       	and    eax,0xffc00000
  801778:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *pde|=hipa;
  80177b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80177f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801782:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801785:	48 09 c2             	or     rdx,rax
  801788:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80178c:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  80178f:	90                   	nop
  801790:	5d                   	pop    rbp
  801791:	c3                   	ret    

0000000000801792 <req_page_at>:
        page_map[i]&=(u32)(1<<j);
    return ret;
} */
//在bitmap申请指定的页面,base默认0x1000对齐
addr_t req_page_at(addr_t base,int pgn)
{
  801792:	f3 0f 1e fa          	endbr64 
  801796:	55                   	push   rbp
  801797:	48 89 e5             	mov    rbp,rsp
  80179a:	48 83 ec 20          	sub    rsp,0x20
  80179e:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8017a2:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    if(base==0)//不指定地址
  8017a5:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  8017aa:	75 18                	jne    8017c4 <req_page_at+0x32>
    {
        return get_phyaddr(req_a_page());
  8017ac:	b8 00 00 00 00       	mov    eax,0x0
  8017b1:	e8 20 fd ff ff       	call   8014d6 <req_a_page>
  8017b6:	89 c7                	mov    edi,eax
  8017b8:	e8 c7 fe ff ff       	call   801684 <get_phyaddr>
  8017bd:	48 98                	cdqe   
  8017bf:	e9 a5 00 00 00       	jmp    801869 <req_page_at+0xd7>
    }
    if(!is_pgs_ava(base,pgn))return -1;//先检查
  8017c4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8017c8:	89 c2                	mov    edx,eax
  8017ca:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8017cd:	89 c6                	mov    esi,eax
  8017cf:	89 d7                	mov    edi,edx
  8017d1:	e8 52 01 00 00       	call   801928 <is_pgs_ava>
  8017d6:	85 c0                	test   eax,eax
  8017d8:	75 0c                	jne    8017e6 <req_page_at+0x54>
  8017da:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  8017e1:	e9 83 00 00 00       	jmp    801869 <req_page_at+0xd7>
    int pgni=base/4096;
  8017e6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8017ea:	48 c1 e8 0c          	shr    rax,0xc
  8017ee:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int pgi=pgni/32;
  8017f1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8017f4:	8d 50 1f             	lea    edx,[rax+0x1f]
  8017f7:	85 c0                	test   eax,eax
  8017f9:	0f 48 c2             	cmovs  eax,edx
  8017fc:	c1 f8 05             	sar    eax,0x5
  8017ff:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    int pgj=pgni%32;
  801802:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801805:	99                   	cdq    
  801806:	c1 ea 1b             	shr    edx,0x1b
  801809:	01 d0                	add    eax,edx
  80180b:	83 e0 1f             	and    eax,0x1f
  80180e:	29 d0                	sub    eax,edx
  801810:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<pgn;i++)
  801813:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80181a:	eb 40                	jmp    80185c <req_page_at+0xca>
    {
        page_map[i]|=(1<<pgj);
  80181c:	48 8b 15 fd e7 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe7fd]        # 400020 <page_map>
  801823:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801826:	48 98                	cdqe   
  801828:	48 c1 e0 02          	shl    rax,0x2
  80182c:	48 01 d0             	add    rax,rdx
  80182f:	8b 10                	mov    edx,DWORD PTR [rax]
  801831:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  801834:	be 01 00 00 00       	mov    esi,0x1
  801839:	89 c1                	mov    ecx,eax
  80183b:	d3 e6                	shl    esi,cl
  80183d:	89 f0                	mov    eax,esi
  80183f:	89 c6                	mov    esi,eax
  801841:	48 8b 0d d8 e7 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe7d8]        # 400020 <page_map>
  801848:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80184b:	48 98                	cdqe   
  80184d:	48 c1 e0 02          	shl    rax,0x2
  801851:	48 01 c8             	add    rax,rcx
  801854:	09 f2                	or     edx,esi
  801856:	89 10                	mov    DWORD PTR [rax],edx
    for(int i=0;i<pgn;i++)
  801858:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80185c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80185f:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  801862:	7c b8                	jl     80181c <req_page_at+0x8a>
    }
    return 0;
  801864:	b8 00 00 00 00       	mov    eax,0x0

}
  801869:	c9                   	leave  
  80186a:	c3                   	ret    

000000000080186b <chk_vm>:
int chk_vm(int base, int pgn)
{
  80186b:	f3 0f 1e fa          	endbr64 
  80186f:	55                   	push   rbp
  801870:	48 89 e5             	mov    rbp,rsp
  801873:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801876:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int *pdet=0;
  801879:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  801880:	00 
    asm volatile("mov %%cr3,%0":"=r"(pdet));
  801881:	0f 20 d8             	mov    rax,cr3
  801884:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int *pt=pdet[base/PAGE_INDEX_SIZE]&0xfffff000;
  801888:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80188b:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  801891:	85 c0                	test   eax,eax
  801893:	0f 48 c2             	cmovs  eax,edx
  801896:	c1 f8 16             	sar    eax,0x16
  801899:	48 98                	cdqe   
  80189b:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8018a2:	00 
  8018a3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8018a7:	48 01 d0             	add    rax,rdx
  8018aa:	8b 00                	mov    eax,DWORD PTR [rax]
  8018ac:	89 c0                	mov    eax,eax
  8018ae:	25 00 f0 ff ff       	and    eax,0xfffff000
  8018b3:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  8018b7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8018ba:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  8018c0:	85 c0                	test   eax,eax
  8018c2:	0f 48 c2             	cmovs  eax,edx
  8018c5:	c1 f8 16             	sar    eax,0x16
  8018c8:	48 98                	cdqe   
  8018ca:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8018d1:	00 
  8018d2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8018d6:	48 01 d0             	add    rax,rdx
  8018d9:	8b 00                	mov    eax,DWORD PTR [rax]
  8018db:	83 e0 01             	and    eax,0x1
  8018de:	85 c0                	test   eax,eax
  8018e0:	74 38                	je     80191a <chk_vm+0xaf>
    !(pt[base%PAGE_INDEX_SIZE/PAGE_SIZE]&PAGE_PRESENT))
  8018e2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8018e5:	99                   	cdq    
  8018e6:	c1 ea 0a             	shr    edx,0xa
  8018e9:	01 d0                	add    eax,edx
  8018eb:	25 ff ff 3f 00       	and    eax,0x3fffff
  8018f0:	29 d0                	sub    eax,edx
  8018f2:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8018f8:	85 c0                	test   eax,eax
  8018fa:	0f 48 c2             	cmovs  eax,edx
  8018fd:	c1 f8 0c             	sar    eax,0xc
  801900:	48 98                	cdqe   
  801902:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801909:	00 
  80190a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80190e:	48 01 d0             	add    rax,rdx
  801911:	8b 00                	mov    eax,DWORD PTR [rax]
  801913:	83 e0 01             	and    eax,0x1
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  801916:	85 c0                	test   eax,eax
  801918:	75 07                	jne    801921 <chk_vm+0xb6>
    {
        return -1;
  80191a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80191f:	eb 05                	jmp    801926 <chk_vm+0xbb>
    }
    return 0;
  801921:	b8 00 00 00 00       	mov    eax,0x0
}
  801926:	5d                   	pop    rbp
  801927:	c3                   	ret    

0000000000801928 <is_pgs_ava>:
//查看指定区域的页内存是否可用
int is_pgs_ava(int base,int pgn)
{
  801928:	f3 0f 1e fa          	endbr64 
  80192c:	55                   	push   rbp
  80192d:	48 89 e5             	mov    rbp,rsp
  801930:	48 83 ec 18          	sub    rsp,0x18
  801934:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801937:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int pgi=base/4096;
  80193a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80193d:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801943:	85 c0                	test   eax,eax
  801945:	0f 48 c2             	cmovs  eax,edx
  801948:	c1 f8 0c             	sar    eax,0xc
  80194b:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    for(int i=0;i<pgn;i++)
  80194e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801955:	eb 1e                	jmp    801975 <is_pgs_ava+0x4d>
    {
        if(check_page(pgi+i)!=0)return 0;
  801957:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  80195a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80195d:	01 d0                	add    eax,edx
  80195f:	89 c7                	mov    edi,eax
  801961:	e8 c4 fc ff ff       	call   80162a <check_page>
  801966:	85 c0                	test   eax,eax
  801968:	74 07                	je     801971 <is_pgs_ava+0x49>
  80196a:	b8 00 00 00 00       	mov    eax,0x0
  80196f:	eb 11                	jmp    801982 <is_pgs_ava+0x5a>
    for(int i=0;i<pgn;i++)
  801971:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801975:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801978:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  80197b:	7c da                	jl     801957 <is_pgs_ava+0x2f>
    }
    return 1;
  80197d:	b8 01 00 00 00       	mov    eax,0x1

}
  801982:	c9                   	leave  
  801983:	c3                   	ret    

0000000000801984 <setup_sys_vol>:
super_block sbs[MAX_SUPERBLOCKS];
fs_operations fs[MAX_FS];

buffer_head buffer_heads[NR_BUFFERHEADS];
int setup_sys_vol(void *disk_drv, void *fs_drv)
{
  801984:	f3 0f 1e fa          	endbr64 
  801988:	55                   	push   rbp
  801989:	48 89 e5             	mov    rbp,rsp
  80198c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  801990:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    vols[0].name[0]='C';
  801994:	c6 05 a5 e8 bf ff 43 	mov    BYTE PTR [rip+0xffffffffffbfe8a5],0x43        # 400240 <vols>
    vols[0].name[1]='\0';
  80199b:	c6 05 9f e8 bf ff 00 	mov    BYTE PTR [rip+0xffffffffffbfe89f],0x0        # 400241 <vols+0x1>
    vols[0].disk_drv=disk_drv;
  8019a2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8019a6:	48 89 05 9b e8 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe89b],rax        # 400248 <vols+0x8>
    vols[0].fs_drv=fs_drv;
  8019ad:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8019b1:	48 89 05 98 e8 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe898],rax        # 400250 <vols+0x10>
    vols[0].stat=VOLUME_STAT_READY;
  8019b8:	c7 05 9e e8 bf ff 01 	mov    DWORD PTR [rip+0xffffffffffbfe89e],0x1        # 400260 <vols+0x20>
  8019bf:	00 00 00 
    return 0;
  8019c2:	b8 00 00 00 00       	mov    eax,0x0
}
  8019c7:	5d                   	pop    rbp
  8019c8:	c3                   	ret    

00000000008019c9 <sys_mkfifo>:
//返回管道描述符
int sys_mkfifo(int number)
{
  8019c9:	f3 0f 1e fa          	endbr64 
  8019cd:	55                   	push   rbp
  8019ce:	48 89 e5             	mov    rbp,rsp
  8019d1:	48 83 ec 20          	sub    rsp,0x20
  8019d5:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    //查重
    for(int i=0;i<MAX_FIFOS;i++)
  8019d8:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8019df:	eb 38                	jmp    801a19 <sys_mkfifo+0x50>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  8019e1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019e4:	48 98                	cdqe   
  8019e6:	48 c1 e0 04          	shl    rax,0x4
  8019ea:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  8019f0:	8b 00                	mov    eax,DWORD PTR [rax]
  8019f2:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8019f5:	75 1e                	jne    801a15 <sys_mkfifo+0x4c>
  8019f7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019fa:	48 98                	cdqe   
  8019fc:	48 c1 e0 04          	shl    rax,0x4
  801a00:	48 05 68 1e 40 00    	add    rax,0x401e68
  801a06:	8b 00                	mov    eax,DWORD PTR [rax]
  801a08:	83 f8 01             	cmp    eax,0x1
  801a0b:	75 08                	jne    801a15 <sys_mkfifo+0x4c>
            return i;
  801a0d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a10:	e9 a6 00 00 00       	jmp    801abb <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801a15:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801a19:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801a1d:	7e c2                	jle    8019e1 <sys_mkfifo+0x18>
        }
    }
    for(int i=0;i<MAX_FIFOS;i++)
  801a1f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801a26:	e9 81 00 00 00       	jmp    801aac <sys_mkfifo+0xe3>
    {
        if(fifos[i].flag==0) {
  801a2b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801a2e:	48 98                	cdqe   
  801a30:	48 c1 e0 04          	shl    rax,0x4
  801a34:	48 05 68 1e 40 00    	add    rax,0x401e68
  801a3a:	8b 00                	mov    eax,DWORD PTR [rax]
  801a3c:	85 c0                	test   eax,eax
  801a3e:	75 68                	jne    801aa8 <sys_mkfifo+0xdf>
            fifos[i].flag=1;
  801a40:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801a43:	48 98                	cdqe   
  801a45:	48 c1 e0 04          	shl    rax,0x4
  801a49:	48 05 68 1e 40 00    	add    rax,0x401e68
  801a4f:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            fifos[i].id=number;
  801a55:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801a58:	48 98                	cdqe   
  801a5a:	48 c1 e0 04          	shl    rax,0x4
  801a5e:	48 8d 90 6c 1e 40 00 	lea    rdx,[rax+0x401e6c]
  801a65:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a68:	89 02                	mov    DWORD PTR [rdx],eax
            fifos[i].size=CHUNK_SIZE;
  801a6a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801a6d:	48 98                	cdqe   
  801a6f:	48 c1 e0 04          	shl    rax,0x4
  801a73:	48 05 64 1e 40 00    	add    rax,0x401e64
  801a79:	c7 00 00 10 00 00    	mov    DWORD PTR [rax],0x1000
            //分配内存
            fifos[i].pa= get_phyaddr(req_a_page());
  801a7f:	b8 00 00 00 00       	mov    eax,0x0
  801a84:	e8 4d fa ff ff       	call   8014d6 <req_a_page>
  801a89:	89 c7                	mov    edi,eax
  801a8b:	e8 f4 fb ff ff       	call   801684 <get_phyaddr>
  801a90:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801a93:	48 63 d2             	movsxd rdx,edx
  801a96:	48 c1 e2 04          	shl    rdx,0x4
  801a9a:	48 81 c2 60 1e 40 00 	add    rdx,0x401e60
  801aa1:	89 02                	mov    DWORD PTR [rdx],eax
            return i;
  801aa3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801aa6:	eb 13                	jmp    801abb <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801aa8:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801aac:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  801ab0:	0f 8e 75 ff ff ff    	jle    801a2b <sys_mkfifo+0x62>
        }
    }
    return -1;
  801ab6:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801abb:	c9                   	leave  
  801abc:	c3                   	ret    

0000000000801abd <sys_rmfifo>:

int sys_rmfifo(int number)
{
  801abd:	f3 0f 1e fa          	endbr64 
  801ac1:	55                   	push   rbp
  801ac2:	48 89 e5             	mov    rbp,rsp
  801ac5:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_FIFOS;i++)
  801ac8:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801acf:	eb 4a                	jmp    801b1b <sys_rmfifo+0x5e>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801ad1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ad4:	48 98                	cdqe   
  801ad6:	48 c1 e0 04          	shl    rax,0x4
  801ada:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801ae0:	8b 00                	mov    eax,DWORD PTR [rax]
  801ae2:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801ae5:	75 30                	jne    801b17 <sys_rmfifo+0x5a>
  801ae7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801aea:	48 98                	cdqe   
  801aec:	48 c1 e0 04          	shl    rax,0x4
  801af0:	48 05 68 1e 40 00    	add    rax,0x401e68
  801af6:	8b 00                	mov    eax,DWORD PTR [rax]
  801af8:	83 f8 01             	cmp    eax,0x1
  801afb:	75 1a                	jne    801b17 <sys_rmfifo+0x5a>
            fifos[i].flag=0;
  801afd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b00:	48 98                	cdqe   
  801b02:	48 c1 e0 04          	shl    rax,0x4
  801b06:	48 05 68 1e 40 00    	add    rax,0x401e68
  801b0c:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            return i;
  801b12:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b15:	eb 0f                	jmp    801b26 <sys_rmfifo+0x69>
    for(int i=0;i<MAX_FIFOS;i++)
  801b17:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801b1b:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801b1f:	7e b0                	jle    801ad1 <sys_rmfifo+0x14>
        }
    }
    return -1;
  801b21:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801b26:	5d                   	pop    rbp
  801b27:	c3                   	ret    

0000000000801b28 <free_vol>:
int free_vol(int voli)
{
  801b28:	f3 0f 1e fa          	endbr64 
  801b2c:	55                   	push   rbp
  801b2d:	48 89 e5             	mov    rbp,rsp
  801b30:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    vols[0].stat=VOLUME_STAT_EMPTY;
  801b33:	c7 05 23 e7 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbfe723],0x0        # 400260 <vols+0x20>
  801b3a:	00 00 00 
    return 0;
  801b3d:	b8 00 00 00 00       	mov    eax,0x0
}
  801b42:	5d                   	pop    rbp
  801b43:	c3                   	ret    

0000000000801b44 <reg_vol>:

int reg_vol(int disk_drvi, int fs_drvi, char *name)
{
  801b44:	f3 0f 1e fa          	endbr64 
  801b48:	55                   	push   rbp
  801b49:	48 89 e5             	mov    rbp,rsp
  801b4c:	48 83 ec 20          	sub    rsp,0x20
  801b50:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801b53:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  801b56:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
    for(int i=0;i<MAX_VOLUMES;i++)
  801b5a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801b61:	e9 d8 00 00 00       	jmp    801c3e <reg_vol+0xfa>
    {
        if(vols[i].stat==VOLUME_STAT_EMPTY)
  801b66:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b69:	48 63 d0             	movsxd rdx,eax
  801b6c:	48 89 d0             	mov    rax,rdx
  801b6f:	48 c1 e0 02          	shl    rax,0x2
  801b73:	48 01 d0             	add    rax,rdx
  801b76:	48 c1 e0 03          	shl    rax,0x3
  801b7a:	48 05 60 02 40 00    	add    rax,0x400260
  801b80:	8b 00                	mov    eax,DWORD PTR [rax]
  801b82:	85 c0                	test   eax,eax
  801b84:	0f 85 b0 00 00 00    	jne    801c3a <reg_vol+0xf6>
        {
            extern driver *drvs;
            vols[i].stat=VOLUME_STAT_READY;
  801b8a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b8d:	48 63 d0             	movsxd rdx,eax
  801b90:	48 89 d0             	mov    rax,rdx
  801b93:	48 c1 e0 02          	shl    rax,0x2
  801b97:	48 01 d0             	add    rax,rdx
  801b9a:	48 c1 e0 03          	shl    rax,0x3
  801b9e:	48 05 60 02 40 00    	add    rax,0x400260
  801ba4:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            vols[i].fs= &fs[fs_drvi];
  801baa:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801bad:	48 63 d0             	movsxd rdx,eax
  801bb0:	48 89 d0             	mov    rax,rdx
  801bb3:	48 01 c0             	add    rax,rax
  801bb6:	48 01 d0             	add    rax,rdx
  801bb9:	48 c1 e0 03          	shl    rax,0x3
  801bbd:	48 8d 88 80 23 40 00 	lea    rcx,[rax+0x402380]
  801bc4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801bc7:	48 63 d0             	movsxd rdx,eax
  801bca:	48 89 d0             	mov    rax,rdx
  801bcd:	48 c1 e0 02          	shl    rax,0x2
  801bd1:	48 01 d0             	add    rax,rdx
  801bd4:	48 c1 e0 03          	shl    rax,0x3
  801bd8:	48 05 58 02 40 00    	add    rax,0x400258
  801bde:	48 89 08             	mov    QWORD PTR [rax],rcx
            vols[i].disk_drv= get_drv(disk_drvi);
  801be1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801be4:	89 c7                	mov    edi,eax
  801be6:	e8 fa 19 00 00       	call   8035e5 <get_drv>
  801beb:	48 89 c2             	mov    rdx,rax
  801bee:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801bf1:	48 63 c8             	movsxd rcx,eax
  801bf4:	48 89 c8             	mov    rax,rcx
  801bf7:	48 c1 e0 02          	shl    rax,0x2
  801bfb:	48 01 c8             	add    rax,rcx
  801bfe:	48 c1 e0 03          	shl    rax,0x3
  801c02:	48 05 48 02 40 00    	add    rax,0x400248
  801c08:	48 89 10             	mov    QWORD PTR [rax],rdx
            strcpy(vols[i].name,name);
  801c0b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801c0e:	48 63 d0             	movsxd rdx,eax
  801c11:	48 89 d0             	mov    rax,rdx
  801c14:	48 c1 e0 02          	shl    rax,0x2
  801c18:	48 01 d0             	add    rax,rdx
  801c1b:	48 c1 e0 03          	shl    rax,0x3
  801c1f:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801c26:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801c2a:	48 89 c6             	mov    rsi,rax
  801c2d:	48 89 d7             	mov    rdi,rdx
  801c30:	e8 6a 89 00 00       	call   80a59f <strcpy>
            return i;
  801c35:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801c38:	eb 13                	jmp    801c4d <reg_vol+0x109>
    for(int i=0;i<MAX_VOLUMES;i++)
  801c3a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801c3e:	83 7d fc 19          	cmp    DWORD PTR [rbp-0x4],0x19
  801c42:	0f 8e 1e ff ff ff    	jle    801b66 <reg_vol+0x22>
        }
    }
    return -1;
  801c48:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801c4d:	c9                   	leave  
  801c4e:	c3                   	ret    

0000000000801c4f <sys_open>:
int sys_open(char *path, int mode)
{
  801c4f:	f3 0f 1e fa          	endbr64 
  801c53:	55                   	push   rbp
  801c54:	48 89 e5             	mov    rbp,rsp
  801c57:	53                   	push   rbx
  801c58:	48 81 ec 28 02 00 00 	sub    rsp,0x228
  801c5f:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
  801c66:	89 b5 d4 fd ff ff    	mov    DWORD PTR [rbp-0x22c],esi
    {

    }
    //根据文件路径找到相应的卷
    char volname[26];
    int i=0,rec=0;
  801c6c:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801c73:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
    for(;path[i]!='/'&&i<26;i++)
  801c7a:	eb 20                	jmp    801c9c <sys_open+0x4d>
        volname[i]=path[i];
  801c7c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c7f:	48 63 d0             	movsxd rdx,eax
  801c82:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801c89:	48 01 d0             	add    rax,rdx
  801c8c:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  801c8f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c92:	48 98                	cdqe   
  801c94:	88 54 05 c0          	mov    BYTE PTR [rbp+rax*1-0x40],dl
    for(;path[i]!='/'&&i<26;i++)
  801c98:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801c9c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c9f:	48 63 d0             	movsxd rdx,eax
  801ca2:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801ca9:	48 01 d0             	add    rax,rdx
  801cac:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  801caf:	3c 2f                	cmp    al,0x2f
  801cb1:	74 06                	je     801cb9 <sys_open+0x6a>
  801cb3:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  801cb7:	7e c3                	jle    801c7c <sys_open+0x2d>
    volname[i]='\0';
  801cb9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801cbc:	48 98                	cdqe   
  801cbe:	c6 44 05 c0 00       	mov    BYTE PTR [rbp+rax*1-0x40],0x0
    if(!path[i+1])
  801cc3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801cc6:	48 98                	cdqe   
  801cc8:	48 8d 50 01          	lea    rdx,[rax+0x1]
  801ccc:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801cd3:	48 01 d0             	add    rax,rdx
  801cd6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  801cd9:	84 c0                	test   al,al
  801cdb:	75 0a                	jne    801ce7 <sys_open+0x98>
        return -2;//是根目录
  801cdd:	b8 fe ff ff ff       	mov    eax,0xfffffffe
  801ce2:	e9 2b 04 00 00       	jmp    802112 <sys_open+0x4c3>
    rec=i;
  801ce7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801cea:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    for(i=0;i<MAX_VOLUMES;i++)
  801ced:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801cf4:	eb 52                	jmp    801d48 <sys_open+0xf9>
        if(vols[i].stat!=VOLUME_STAT_EMPTY&& \
  801cf6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801cf9:	48 63 d0             	movsxd rdx,eax
  801cfc:	48 89 d0             	mov    rax,rdx
  801cff:	48 c1 e0 02          	shl    rax,0x2
  801d03:	48 01 d0             	add    rax,rdx
  801d06:	48 c1 e0 03          	shl    rax,0x3
  801d0a:	48 05 60 02 40 00    	add    rax,0x400260
  801d10:	8b 00                	mov    eax,DWORD PTR [rax]
  801d12:	85 c0                	test   eax,eax
  801d14:	74 2e                	je     801d44 <sys_open+0xf5>
        (strcmp(vols[i].name,volname)==0))
  801d16:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801d19:	48 63 d0             	movsxd rdx,eax
  801d1c:	48 89 d0             	mov    rax,rdx
  801d1f:	48 c1 e0 02          	shl    rax,0x2
  801d23:	48 01 d0             	add    rax,rdx
  801d26:	48 c1 e0 03          	shl    rax,0x3
  801d2a:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801d31:	48 8d 45 c0          	lea    rax,[rbp-0x40]
  801d35:	48 89 c6             	mov    rsi,rax
  801d38:	48 89 d7             	mov    rdi,rdx
  801d3b:	e8 ff 89 00 00       	call   80a73f <strcmp>
        if(vols[i].stat!=VOLUME_STAT_EMPTY&& \
  801d40:	85 c0                	test   eax,eax
  801d42:	74 0c                	je     801d50 <sys_open+0x101>
    for(i=0;i<MAX_VOLUMES;i++)
  801d44:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801d48:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  801d4c:	7e a8                	jle    801cf6 <sys_open+0xa7>
  801d4e:	eb 01                	jmp    801d51 <sys_open+0x102>
            break;
  801d50:	90                   	nop
    if(i==MAX_VOLUMES)return -1;
  801d51:	83 7d ec 1a          	cmp    DWORD PTR [rbp-0x14],0x1a
  801d55:	75 0a                	jne    801d61 <sys_open+0x112>
  801d57:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801d5c:	e9 b1 03 00 00       	jmp    802112 <sys_open+0x4c3>
    driver_args arg={
  801d61:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
  801d68:	b8 00 00 00 00       	mov    eax,0x0
  801d6d:	b9 17 00 00 00       	mov    ecx,0x17
  801d72:	48 89 d7             	mov    rdi,rdx
  801d75:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  801d78:	48 89 fa             	mov    rdx,rdi
  801d7b:	89 02                	mov    DWORD PTR [rdx],eax
  801d7d:	48 83 c2 04          	add    rdx,0x4
            .path=path+rec+1
  801d81:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801d84:	48 98                	cdqe   
  801d86:	48 8d 50 01          	lea    rdx,[rax+0x1]
  801d8a:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801d91:	48 01 d0             	add    rax,rdx
    driver_args arg={
  801d94:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
    };
    vfs_dir_entry dir;
    vfs_dir_entry res;
    int voln=i;
  801d9b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801d9e:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    if(vols[i].fs->find(path+rec+1,dir,&res)==-1)//找不到文件 ((driver*)vols[i].fs_drv)->find(&arg)==-1
  801da1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801da4:	48 63 d0             	movsxd rdx,eax
  801da7:	48 89 d0             	mov    rax,rdx
  801daa:	48 c1 e0 02          	shl    rax,0x2
  801dae:	48 01 d0             	add    rax,rdx
  801db1:	48 c1 e0 03          	shl    rax,0x3
  801db5:	48 05 58 02 40 00    	add    rax,0x400258
  801dbb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801dbe:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  801dc2:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801dc5:	48 98                	cdqe   
  801dc7:	48 8d 48 01          	lea    rcx,[rax+0x1]
  801dcb:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801dd2:	48 01 c1             	add    rcx,rax
  801dd5:	48 8d 85 40 fe ff ff 	lea    rax,[rbp-0x1c0]
  801ddc:	ff b5 f8 fe ff ff    	push   QWORD PTR [rbp-0x108]
  801de2:	ff b5 f0 fe ff ff    	push   QWORD PTR [rbp-0x110]
  801de8:	ff b5 e8 fe ff ff    	push   QWORD PTR [rbp-0x118]
  801dee:	ff b5 e0 fe ff ff    	push   QWORD PTR [rbp-0x120]
  801df4:	ff b5 d8 fe ff ff    	push   QWORD PTR [rbp-0x128]
  801dfa:	ff b5 d0 fe ff ff    	push   QWORD PTR [rbp-0x130]
  801e00:	ff b5 c8 fe ff ff    	push   QWORD PTR [rbp-0x138]
  801e06:	ff b5 c0 fe ff ff    	push   QWORD PTR [rbp-0x140]
  801e0c:	ff b5 b8 fe ff ff    	push   QWORD PTR [rbp-0x148]
  801e12:	ff b5 b0 fe ff ff    	push   QWORD PTR [rbp-0x150]
  801e18:	ff b5 a8 fe ff ff    	push   QWORD PTR [rbp-0x158]
  801e1e:	ff b5 a0 fe ff ff    	push   QWORD PTR [rbp-0x160]
  801e24:	48 89 c6             	mov    rsi,rax
  801e27:	48 89 cf             	mov    rdi,rcx
  801e2a:	ff d2                	call   rdx
  801e2c:	48 83 c4 60          	add    rsp,0x60
  801e30:	83 f8 ff             	cmp    eax,0xffffffff
  801e33:	75 49                	jne    801e7e <sys_open+0x22f>
    {
        if(mode&FILE_MODE_WRITE) {
  801e35:	8b 85 d4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x22c]
  801e3b:	83 e0 02             	and    eax,0x2
  801e3e:	85 c0                	test   eax,eax
  801e40:	74 32                	je     801e74 <sys_open+0x225>
            return ((driver *) vols[i].fs_drv)->touch(&arg);//这里之后要改
  801e42:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801e45:	48 63 d0             	movsxd rdx,eax
  801e48:	48 89 d0             	mov    rax,rdx
  801e4b:	48 c1 e0 02          	shl    rax,0x2
  801e4f:	48 01 d0             	add    rax,rdx
  801e52:	48 c1 e0 03          	shl    rax,0x3
  801e56:	48 05 50 02 40 00    	add    rax,0x400250
  801e5c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801e5f:	48 8b 50 4c          	mov    rdx,QWORD PTR [rax+0x4c]
  801e63:	48 8d 85 00 ff ff ff 	lea    rax,[rbp-0x100]
  801e6a:	48 89 c7             	mov    rdi,rax
  801e6d:	ff d2                	call   rdx
  801e6f:	e9 9e 02 00 00       	jmp    802112 <sys_open+0x4c3>
        }else
            return -1;
  801e74:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801e79:	e9 94 02 00 00       	jmp    802112 <sys_open+0x4c3>
    }
    vfs_dir_entry entry=res;//=arg.entry;
  801e7e:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
  801e85:	48 8b 95 48 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b8]
  801e8c:	48 89 85 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],rax
  801e93:	48 89 95 e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdx
  801e9a:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
  801ea1:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
  801ea8:	48 89 85 f0 fd ff ff 	mov    QWORD PTR [rbp-0x210],rax
  801eaf:	48 89 95 f8 fd ff ff 	mov    QWORD PTR [rbp-0x208],rdx
  801eb6:	48 8b 85 60 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1a0]
  801ebd:	48 8b 95 68 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x198]
  801ec4:	48 89 85 00 fe ff ff 	mov    QWORD PTR [rbp-0x200],rax
  801ecb:	48 89 95 08 fe ff ff 	mov    QWORD PTR [rbp-0x1f8],rdx
  801ed2:	48 8b 85 70 fe ff ff 	mov    rax,QWORD PTR [rbp-0x190]
  801ed9:	48 8b 95 78 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x188]
  801ee0:	48 89 85 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rax
  801ee7:	48 89 95 18 fe ff ff 	mov    QWORD PTR [rbp-0x1e8],rdx
  801eee:	48 8b 85 80 fe ff ff 	mov    rax,QWORD PTR [rbp-0x180]
  801ef5:	48 8b 95 88 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x178]
  801efc:	48 89 85 20 fe ff ff 	mov    QWORD PTR [rbp-0x1e0],rax
  801f03:	48 89 95 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rdx
  801f0a:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
  801f11:	48 8b 95 98 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x168]
  801f18:	48 89 85 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],rax
  801f1f:	48 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdx
    int j=-1;
  801f26:	c7 45 e8 ff ff ff ff 	mov    DWORD PTR [rbp-0x18],0xffffffff
    for(i=0;i<MAX_OPEN_FILES;i++)
  801f2d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801f34:	eb 5c                	jmp    801f92 <sys_open+0x343>
    {
        if(opened[i].voln==voln&&opened[i].id==entry.id)
  801f36:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801f39:	48 63 d0             	movsxd rdx,eax
  801f3c:	48 89 d0             	mov    rax,rdx
  801f3f:	48 01 c0             	add    rax,rax
  801f42:	48 01 d0             	add    rax,rdx
  801f45:	48 c1 e0 05          	shl    rax,0x5
  801f49:	48 05 68 06 40 00    	add    rax,0x400668
  801f4f:	8b 00                	mov    eax,DWORD PTR [rax]
  801f51:	39 45 e0             	cmp    DWORD PTR [rbp-0x20],eax
  801f54:	75 38                	jne    801f8e <sys_open+0x33f>
  801f56:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801f59:	48 63 d0             	movsxd rdx,eax
  801f5c:	48 89 d0             	mov    rax,rdx
  801f5f:	48 01 c0             	add    rax,rax
  801f62:	48 01 d0             	add    rax,rdx
  801f65:	48 c1 e0 05          	shl    rax,0x5
  801f69:	48 05 74 06 40 00    	add    rax,0x400674
  801f6f:	8b 10                	mov    edx,DWORD PTR [rax]
  801f71:	8b 85 f4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x20c]
  801f77:	39 c2                	cmp    edx,eax
  801f79:	75 13                	jne    801f8e <sys_open+0x33f>
        {
            if(mode==FILE_MODE_WRITE)
  801f7b:	83 bd d4 fd ff ff 02 	cmp    DWORD PTR [rbp-0x22c],0x2
  801f82:	75 0a                	jne    801f8e <sys_open+0x33f>
            {
                return -1;//读模式会重新给一个fno但是指向同一个文件
  801f84:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801f89:	e9 84 01 00 00       	jmp    802112 <sys_open+0x4c3>
    for(i=0;i<MAX_OPEN_FILES;i++)
  801f8e:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801f92:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  801f96:	7e 9e                	jle    801f36 <sys_open+0x2e7>
            }
        }
    }
    for(i=0;i<MAX_OPEN_FILES;i++)
  801f98:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801f9f:	eb 2b                	jmp    801fcc <sys_open+0x37d>
    {
        if(!opened[i].mode) {
  801fa1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801fa4:	48 63 d0             	movsxd rdx,eax
  801fa7:	48 89 d0             	mov    rax,rdx
  801faa:	48 01 c0             	add    rax,rax
  801fad:	48 01 d0             	add    rax,rdx
  801fb0:	48 c1 e0 05          	shl    rax,0x5
  801fb4:	48 05 64 06 40 00    	add    rax,0x400664
  801fba:	8b 00                	mov    eax,DWORD PTR [rax]
  801fbc:	85 c0                	test   eax,eax
  801fbe:	75 08                	jne    801fc8 <sys_open+0x379>
            j = i;
  801fc0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801fc3:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            break;
  801fc6:	eb 0a                	jmp    801fd2 <sys_open+0x383>
    for(i=0;i<MAX_OPEN_FILES;i++)
  801fc8:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801fcc:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  801fd0:	7e cf                	jle    801fa1 <sys_open+0x352>
        }
    }
    if(j==-1)return -1;
  801fd2:	83 7d e8 ff          	cmp    DWORD PTR [rbp-0x18],0xffffffff
  801fd6:	75 0a                	jne    801fe2 <sys_open+0x393>
  801fd8:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801fdd:	e9 30 01 00 00       	jmp    802112 <sys_open+0x4c3>
    opened[j]=entry;
  801fe2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801fe5:	48 63 d0             	movsxd rdx,eax
  801fe8:	48 89 d0             	mov    rax,rdx
  801feb:	48 01 c0             	add    rax,rax
  801fee:	48 01 d0             	add    rax,rdx
  801ff1:	48 c1 e0 05          	shl    rax,0x5
  801ff5:	48 05 60 06 40 00    	add    rax,0x400660
  801ffb:	48 8b 8d e0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x220]
  802002:	48 8b 9d e8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x218]
  802009:	48 89 08             	mov    QWORD PTR [rax],rcx
  80200c:	48 89 58 08          	mov    QWORD PTR [rax+0x8],rbx
  802010:	48 8b 8d f0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x210]
  802017:	48 8b 9d f8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x208]
  80201e:	48 89 48 10          	mov    QWORD PTR [rax+0x10],rcx
  802022:	48 89 58 18          	mov    QWORD PTR [rax+0x18],rbx
  802026:	48 8b 8d 00 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x200]
  80202d:	48 8b 9d 08 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1f8]
  802034:	48 89 48 20          	mov    QWORD PTR [rax+0x20],rcx
  802038:	48 89 58 28          	mov    QWORD PTR [rax+0x28],rbx
  80203c:	48 8b 8d 10 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1f0]
  802043:	48 8b 9d 18 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1e8]
  80204a:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
  80204e:	48 89 58 38          	mov    QWORD PTR [rax+0x38],rbx
  802052:	48 8b 8d 20 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1e0]
  802059:	48 8b 9d 28 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1d8]
  802060:	48 89 48 40          	mov    QWORD PTR [rax+0x40],rcx
  802064:	48 89 58 48          	mov    QWORD PTR [rax+0x48],rbx
  802068:	48 8b 8d 30 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1d0]
  80206f:	48 8b 9d 38 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1c8]
  802076:	48 89 48 50          	mov    QWORD PTR [rax+0x50],rcx
  80207a:	48 89 58 58          	mov    QWORD PTR [rax+0x58],rbx
    opened[j].fno=i;
  80207e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802081:	48 63 d0             	movsxd rdx,eax
  802084:	48 89 d0             	mov    rax,rdx
  802087:	48 01 c0             	add    rax,rax
  80208a:	48 01 d0             	add    rax,rdx
  80208d:	48 c1 e0 05          	shl    rax,0x5
  802091:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  802098:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80209b:	89 02                	mov    DWORD PTR [rdx],eax
    opened[j].link_c++;
  80209d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8020a0:	48 63 d0             	movsxd rdx,eax
  8020a3:	48 89 d0             	mov    rax,rdx
  8020a6:	48 01 c0             	add    rax,rax
  8020a9:	48 01 d0             	add    rax,rdx
  8020ac:	48 c1 e0 05          	shl    rax,0x5
  8020b0:	48 05 6c 06 40 00    	add    rax,0x40066c
  8020b6:	8b 00                	mov    eax,DWORD PTR [rax]
  8020b8:	8d 48 01             	lea    ecx,[rax+0x1]
  8020bb:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8020be:	48 63 d0             	movsxd rdx,eax
  8020c1:	48 89 d0             	mov    rax,rdx
  8020c4:	48 01 c0             	add    rax,rax
  8020c7:	48 01 d0             	add    rax,rdx
  8020ca:	48 c1 e0 05          	shl    rax,0x5
  8020ce:	48 05 6c 06 40 00    	add    rax,0x40066c
  8020d4:	89 08                	mov    DWORD PTR [rax],ecx
    add_proc_openf(&opened[j]);
  8020d6:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8020d9:	48 63 d0             	movsxd rdx,eax
  8020dc:	48 89 d0             	mov    rax,rdx
  8020df:	48 01 c0             	add    rax,rax
  8020e2:	48 01 d0             	add    rax,rdx
  8020e5:	48 c1 e0 05          	shl    rax,0x5
  8020e9:	48 05 60 06 40 00    	add    rax,0x400660
  8020ef:	48 89 c7             	mov    rdi,rax
  8020f2:	e8 70 26 00 00       	call   804767 <add_proc_openf>
    return opened[j].fno;
  8020f7:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8020fa:	48 63 d0             	movsxd rdx,eax
  8020fd:	48 89 d0             	mov    rax,rdx
  802100:	48 01 c0             	add    rax,rax
  802103:	48 01 d0             	add    rax,rdx
  802106:	48 c1 e0 05          	shl    rax,0x5
  80210a:	48 05 60 06 40 00    	add    rax,0x400660
  802110:	8b 00                	mov    eax,DWORD PTR [rax]
}
  802112:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802116:	c9                   	leave  
  802117:	c3                   	ret    

0000000000802118 <sys_close>:
int sys_close(int fno)
{
  802118:	f3 0f 1e fa          	endbr64 
  80211c:	55                   	push   rbp
  80211d:	48 89 e5             	mov    rbp,rsp
  802120:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  802123:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80212a:	eb 64                	jmp    802190 <sys_close+0x78>
    {
        if(opened[i].fno==fno)
  80212c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80212f:	48 63 d0             	movsxd rdx,eax
  802132:	48 89 d0             	mov    rax,rdx
  802135:	48 01 c0             	add    rax,rax
  802138:	48 01 d0             	add    rax,rdx
  80213b:	48 c1 e0 05          	shl    rax,0x5
  80213f:	48 05 60 06 40 00    	add    rax,0x400660
  802145:	8b 00                	mov    eax,DWORD PTR [rax]
  802147:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80214a:	75 40                	jne    80218c <sys_close+0x74>
        {
            opened[i].link_c--;
  80214c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80214f:	48 63 d0             	movsxd rdx,eax
  802152:	48 89 d0             	mov    rax,rdx
  802155:	48 01 c0             	add    rax,rax
  802158:	48 01 d0             	add    rax,rdx
  80215b:	48 c1 e0 05          	shl    rax,0x5
  80215f:	48 05 6c 06 40 00    	add    rax,0x40066c
  802165:	8b 00                	mov    eax,DWORD PTR [rax]
  802167:	8d 48 ff             	lea    ecx,[rax-0x1]
  80216a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80216d:	48 63 d0             	movsxd rdx,eax
  802170:	48 89 d0             	mov    rax,rdx
  802173:	48 01 c0             	add    rax,rax
  802176:	48 01 d0             	add    rax,rdx
  802179:	48 c1 e0 05          	shl    rax,0x5
  80217d:	48 05 6c 06 40 00    	add    rax,0x40066c
  802183:	89 08                	mov    DWORD PTR [rax],ecx
            return 0;
  802185:	b8 00 00 00 00       	mov    eax,0x0
  80218a:	eb 0f                	jmp    80219b <sys_close+0x83>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  80218c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802190:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802194:	7e 96                	jle    80212c <sys_close+0x14>
        }
    }
    return -1;
  802196:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  80219b:	5d                   	pop    rbp
  80219c:	c3                   	ret    

000000000080219d <sys_write>:
int sys_write(int fno, char *src, int len)
{
  80219d:	f3 0f 1e fa          	endbr64 
  8021a1:	55                   	push   rbp
  8021a2:	48 89 e5             	mov    rbp,rsp
  8021a5:	48 83 ec 20          	sub    rsp,0x20
  8021a9:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8021ac:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8021b0:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  8021b3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8021b6:	89 c7                	mov    edi,eax
  8021b8:	e8 7d 01 00 00       	call   80233a <get_vfs_entry>
  8021bd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  8021c1:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8021c6:	75 07                	jne    8021cf <sys_write+0x32>
  8021c8:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8021cd:	eb 5d                	jmp    80222c <sys_write+0x8f>
    if(f->type==FTYPE_REG)
  8021cf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021d3:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8021d6:	85 c0                	test   eax,eax
  8021d8:	75 18                	jne    8021f2 <sys_write+0x55>
    {
        return vfs_write_file(f,src,len);
  8021da:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8021dd:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  8021e1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021e5:	48 89 ce             	mov    rsi,rcx
  8021e8:	48 89 c7             	mov    rdi,rax
  8021eb:	e8 67 03 00 00       	call   802557 <vfs_write_file>
  8021f0:	eb 3a                	jmp    80222c <sys_write+0x8f>
    }else if(f->type==FTYPE_BLKDEV)
  8021f2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021f6:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8021f9:	83 f8 01             	cmp    eax,0x1
  8021fc:	75 29                	jne    802227 <sys_write+0x8a>
    {
        int block=get_according_bnr(f);
  8021fe:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802202:	48 89 c7             	mov    rdi,rax
  802205:	e8 5b 04 00 00       	call   802665 <get_according_bnr>
  80220a:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        return write_block(f->dev,block,src,len);
  80220d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802211:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  802214:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  802217:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  80221b:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  80221e:	89 c7                	mov    edi,eax
  802220:	e8 13 07 00 00       	call   802938 <write_block>
  802225:	eb 05                	jmp    80222c <sys_write+0x8f>
    }
    return -1;
  802227:	b8 ff ff ff ff       	mov    eax,0xffffffff
            .src_addr=src,
            .len=len,
            .pos=pos
    };
    return ((driver*)vols[f->voln].fs_drv)->write(&args); */
}
  80222c:	c9                   	leave  
  80222d:	c3                   	ret    

000000000080222e <sys_read>:
int sys_read(int fno, char *dist,  int len)
{
  80222e:	f3 0f 1e fa          	endbr64 
  802232:	55                   	push   rbp
  802233:	48 89 e5             	mov    rbp,rsp
  802236:	48 83 ec 20          	sub    rsp,0x20
  80223a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80223d:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  802241:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  802244:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802247:	89 c7                	mov    edi,eax
  802249:	e8 ec 00 00 00       	call   80233a <get_vfs_entry>
  80224e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  802252:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802257:	75 07                	jne    802260 <sys_read+0x32>
  802259:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80225e:	eb 5d                	jmp    8022bd <sys_read+0x8f>
    if(f->type==FTYPE_REG)
  802260:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802264:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  802267:	85 c0                	test   eax,eax
  802269:	75 18                	jne    802283 <sys_read+0x55>
    {
        return vfs_read_file(f,dist,len);
  80226b:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80226e:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  802272:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802276:	48 89 ce             	mov    rsi,rcx
  802279:	48 89 c7             	mov    rdi,rax
  80227c:	e8 37 02 00 00       	call   8024b8 <vfs_read_file>
  802281:	eb 3a                	jmp    8022bd <sys_read+0x8f>
    }else if(f->type==FTYPE_BLKDEV)
  802283:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802287:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80228a:	83 f8 01             	cmp    eax,0x1
  80228d:	75 29                	jne    8022b8 <sys_read+0x8a>
    {
        int block=get_according_bnr(f);
  80228f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802293:	48 89 c7             	mov    rdi,rax
  802296:	e8 ca 03 00 00       	call   802665 <get_according_bnr>
  80229b:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        return read_block(f->dev,block,dist,len);
  80229e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8022a2:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  8022a5:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  8022a8:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  8022ac:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  8022af:	89 c7                	mov    edi,eax
  8022b1:	e8 ff 06 00 00       	call   8029b5 <read_block>
  8022b6:	eb 05                	jmp    8022bd <sys_read+0x8f>
    }
    return -1;
  8022b8:	b8 ff ff ff ff       	mov    eax,0xffffffff
    //         .len=len,
    //         .pos=pos,
    //         .entry=*f
    // };
    // return ((driver*)vols[f->voln].fs_drv)->read(&args);
}
  8022bd:	c9                   	leave  
  8022be:	c3                   	ret    

00000000008022bf <sys_seek>:
int sys_seek(int fno, int offset, int origin)
{
  8022bf:	f3 0f 1e fa          	endbr64 
  8022c3:	55                   	push   rbp
  8022c4:	48 89 e5             	mov    rbp,rsp
  8022c7:	48 83 ec 20          	sub    rsp,0x20
  8022cb:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8022ce:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8022d1:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  8022d4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8022d7:	89 c7                	mov    edi,eax
  8022d9:	e8 5c 00 00 00       	call   80233a <get_vfs_entry>
  8022de:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  8022e2:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8022e7:	75 07                	jne    8022f0 <sys_seek+0x31>
  8022e9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8022ee:	eb 14                	jmp    802304 <sys_seek+0x45>
    f->ptr=offset+origin;
  8022f0:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8022f3:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8022f6:	01 c2                	add    edx,eax
  8022f8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8022fc:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
    return 0;
  8022ff:	b8 00 00 00 00       	mov    eax,0x0
}
  802304:	c9                   	leave  
  802305:	c3                   	ret    

0000000000802306 <sys_tell>:
int sys_tell(int fno)
{
  802306:	f3 0f 1e fa          	endbr64 
  80230a:	55                   	push   rbp
  80230b:	48 89 e5             	mov    rbp,rsp
  80230e:	48 83 ec 20          	sub    rsp,0x20
  802312:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    vfs_dir_entry *f= get_vfs_entry(fno);
  802315:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802318:	89 c7                	mov    edi,eax
  80231a:	e8 1b 00 00 00       	call   80233a <get_vfs_entry>
  80231f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  802323:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802328:	75 07                	jne    802331 <sys_tell+0x2b>
  80232a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80232f:	eb 07                	jmp    802338 <sys_tell+0x32>
    return f->ptr;
  802331:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802335:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  802338:	c9                   	leave  
  802339:	c3                   	ret    

000000000080233a <get_vfs_entry>:
vfs_dir_entry *get_vfs_entry(int fno)
{
  80233a:	f3 0f 1e fa          	endbr64 
  80233e:	55                   	push   rbp
  80233f:	48 89 e5             	mov    rbp,rsp
  802342:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  802345:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80234c:	eb 3f                	jmp    80238d <get_vfs_entry+0x53>
    {
        if(opened[i].fno==fno)
  80234e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802351:	48 63 d0             	movsxd rdx,eax
  802354:	48 89 d0             	mov    rax,rdx
  802357:	48 01 c0             	add    rax,rax
  80235a:	48 01 d0             	add    rax,rdx
  80235d:	48 c1 e0 05          	shl    rax,0x5
  802361:	48 05 60 06 40 00    	add    rax,0x400660
  802367:	8b 00                	mov    eax,DWORD PTR [rax]
  802369:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80236c:	75 1b                	jne    802389 <get_vfs_entry+0x4f>
        {
            return &opened[i];
  80236e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802371:	48 63 d0             	movsxd rdx,eax
  802374:	48 89 d0             	mov    rax,rdx
  802377:	48 01 c0             	add    rax,rax
  80237a:	48 01 d0             	add    rax,rdx
  80237d:	48 c1 e0 05          	shl    rax,0x5
  802381:	48 05 60 06 40 00    	add    rax,0x400660
  802387:	eb 0f                	jmp    802398 <get_vfs_entry+0x5e>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  802389:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80238d:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802391:	7e bb                	jle    80234e <get_vfs_entry+0x14>
        }
    }
    return NULL;
  802393:	b8 00 00 00 00       	mov    eax,0x0
}
  802398:	5d                   	pop    rbp
  802399:	c3                   	ret    

000000000080239a <brelse>:

//释放缓冲区（只释放这一块）
int brelse(buffer_head* bh)
{
  80239a:	f3 0f 1e fa          	endbr64 
  80239e:	55                   	push   rbp
  80239f:	48 89 e5             	mov    rbp,rsp
  8023a2:	48 83 ec 10          	sub    rsp,0x10
  8023a6:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    wait_on_buf(bh);
  8023aa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023ae:	48 89 c7             	mov    rdi,rax
  8023b1:	e8 a0 04 00 00       	call   802856 <wait_on_buf>
    if(bh->b_count==0)return -1;
  8023b6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023ba:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  8023be:	84 c0                	test   al,al
  8023c0:	75 07                	jne    8023c9 <brelse+0x2f>
  8023c2:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8023c7:	eb 32                	jmp    8023fb <brelse+0x61>
    bh->b_count--;
  8023c9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023cd:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  8023d1:	8d 50 ff             	lea    edx,[rax-0x1]
  8023d4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023d8:	88 50 14             	mov    BYTE PTR [rax+0x14],dl
    if(bh->b_count==0)
  8023db:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023df:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  8023e3:	84 c0                	test   al,al
  8023e5:	75 0f                	jne    8023f6 <brelse+0x5c>
        vmfree(bh->b_data);
  8023e7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023eb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8023ee:	48 89 c7             	mov    rdi,rax
  8023f1:	e8 db ed ff ff       	call   8011d1 <vmfree>
    return 0;
  8023f6:	b8 00 00 00 00       	mov    eax,0x0
}
  8023fb:	c9                   	leave  
  8023fc:	c3                   	ret    

00000000008023fd <bread>:
//从设备中读取指定设备的指定块并返回缓冲区
buffer_head* bread(int dev,int blk)
{
  8023fd:	f3 0f 1e fa          	endbr64 
  802401:	55                   	push   rbp
  802402:	48 89 e5             	mov    rbp,rsp
  802405:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  80240c:	89 bd 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],edi
  802412:	89 b5 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],esi

    buffer_head *bh=get_buf(dev,blk);
  802418:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  80241e:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  802424:	89 d6                	mov    esi,edx
  802426:	89 c7                	mov    edi,eax
  802428:	e8 78 02 00 00       	call   8026a5 <get_buf>
  80242d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!bh)return -1;//申请失败
  802431:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802436:	75 09                	jne    802441 <bread+0x44>
  802438:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80243f:	eb 75                	jmp    8024b6 <bread+0xb9>
    if(!bh->b_uptodate)
  802441:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802445:	0f b6 40 12          	movzx  eax,BYTE PTR [rax+0x12]
  802449:	84 c0                	test   al,al
  80244b:	75 65                	jne    8024b2 <bread+0xb5>
    {
        driver_args arg;
        arg.dev=dev;
  80244d:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  802453:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
        arg.cmd=DRVF_READ;
  802456:	c7 45 d8 02 00 00 00 	mov    DWORD PTR [rbp-0x28],0x2
        arg.dist_addr=bh->b_data;
  80245d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802461:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802464:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.len=BLOCK_SIZE;
  80246a:	c7 85 48 ff ff ff 00 	mov    DWORD PTR [rbp-0xb8],0x200
  802471:	02 00 00 
        arg.lba=bh->b_blocknr;
  802474:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802478:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80247c:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
        arg.sec_c=BLOCK_SIZE/512;//之后会改
  802482:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  802489:	00 00 00 
        //lock_buffer(bh);//锁定缓冲块直到读取完成
        int reqi=make_request(&arg);
  80248c:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  802493:	48 89 c7             	mov    rdi,rax
  802496:	e8 71 11 00 00       	call   80360c <make_request>
  80249b:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        wait_on_req(reqi);
  80249e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8024a1:	89 c7                	mov    edi,eax
  8024a3:	e8 77 14 00 00       	call   80391f <wait_on_req>
        clear_req(reqi);
  8024a8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8024ab:	89 c7                	mov    edi,eax
  8024ad:	e8 9d 14 00 00       	call   80394f <clear_req>
    }
    return bh;
  8024b2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  8024b6:	c9                   	leave  
  8024b7:	c3                   	ret    

00000000008024b8 <vfs_read_file>:


int vfs_read_file(vfs_dir_entry *f,char *buf,int len)
{
  8024b8:	f3 0f 1e fa          	endbr64 
  8024bc:	55                   	push   rbp
  8024bd:	48 89 e5             	mov    rbp,rsp
  8024c0:	48 83 ec 40          	sub    rsp,0x40
  8024c4:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  8024c8:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  8024cc:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  8024cf:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8024d3:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  8024d6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  8024d9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8024dd:	48 89 c7             	mov    rdi,rax
  8024e0:	e8 80 01 00 00       	call   802665 <get_according_bnr>
  8024e5:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=bread(dev,block);
  8024e8:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  8024eb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8024ee:	89 d6                	mov    esi,edx
  8024f0:	89 c7                	mov    edi,eax
  8024f2:	e8 06 ff ff ff       	call   8023fd <bread>
  8024f7:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  8024fb:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8024fe:	ba 00 02 00 00       	mov    edx,0x200
  802503:	39 d0                	cmp    eax,edx
  802505:	0f 4f c2             	cmovg  eax,edx
  802508:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(buf,bh->b_data,size);
  80250b:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80250e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802512:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802515:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802519:	48 89 ce             	mov    rsi,rcx
  80251c:	48 89 c7             	mov    rdi,rax
  80251f:	e8 7d 7f 00 00       	call   80a4a1 <memcpy>
        len-=BLOCK_SIZE;
  802524:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  80252b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80252f:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  802532:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802535:	01 c2                	add    edx,eax
  802537:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80253b:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        brelse(bh);
  80253e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802542:	48 89 c7             	mov    rdi,rax
  802545:	e8 50 fe ff ff       	call   80239a <brelse>
    }while(len>0);
  80254a:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  80254e:	7f 89                	jg     8024d9 <vfs_read_file+0x21>
    return 0;
  802550:	b8 00 00 00 00       	mov    eax,0x0
}
  802555:	c9                   	leave  
  802556:	c3                   	ret    

0000000000802557 <vfs_write_file>:
int vfs_write_file(vfs_dir_entry *f,char *buf,int len)
{
  802557:	f3 0f 1e fa          	endbr64 
  80255b:	55                   	push   rbp
  80255c:	48 89 e5             	mov    rbp,rsp
  80255f:	48 83 ec 40          	sub    rsp,0x40
  802563:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  802567:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  80256b:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  80256e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802572:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  802575:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  802578:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80257c:	48 89 c7             	mov    rdi,rax
  80257f:	e8 e1 00 00 00       	call   802665 <get_according_bnr>
  802584:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=get_buf(dev,block);
  802587:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  80258a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80258d:	89 d6                	mov    esi,edx
  80258f:	89 c7                	mov    edi,eax
  802591:	e8 0f 01 00 00       	call   8026a5 <get_buf>
  802596:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  80259a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80259d:	ba 00 02 00 00       	mov    edx,0x200
  8025a2:	39 d0                	cmp    eax,edx
  8025a4:	0f 4f c2             	cmovg  eax,edx
  8025a7:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(bh->b_data,buf,size);
  8025aa:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8025ad:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8025b1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8025b4:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  8025b8:	48 89 ce             	mov    rsi,rcx
  8025bb:	48 89 c7             	mov    rdi,rax
  8025be:	e8 de 7e 00 00       	call   80a4a1 <memcpy>
        len-=BLOCK_SIZE;
  8025c3:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  8025ca:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8025ce:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8025d1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8025d4:	01 c2                	add    edx,eax
  8025d6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8025da:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        bh->b_dirt=1;//修改置位
  8025dd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8025e1:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  8025e5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8025e9:	48 89 c7             	mov    rdi,rax
  8025ec:	e8 a9 fd ff ff       	call   80239a <brelse>
    }while(len>0);
  8025f1:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  8025f5:	7f 81                	jg     802578 <vfs_write_file+0x21>
    return 0;
  8025f7:	b8 00 00 00 00       	mov    eax,0x0
}
  8025fc:	c9                   	leave  
  8025fd:	c3                   	ret    

00000000008025fe <vfs_seek_file>:

int vfs_seek_file(vfs_dir_entry *f,int offset,int origin)
{
  8025fe:	f3 0f 1e fa          	endbr64 
  802602:	55                   	push   rbp
  802603:	48 89 e5             	mov    rbp,rsp
  802606:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80260a:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  80260d:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    switch (origin)
  802610:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  802614:	74 20                	je     802636 <vfs_seek_file+0x38>
  802616:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  80261a:	7f 3f                	jg     80265b <vfs_seek_file+0x5d>
  80261c:	83 7d f0 00          	cmp    DWORD PTR [rbp-0x10],0x0
  802620:	74 08                	je     80262a <vfs_seek_file+0x2c>
  802622:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  802626:	74 23                	je     80264b <vfs_seek_file+0x4d>
        break;
    case SEEK_END:
        f->ptr=f->size;
        break;
    default:
        break;
  802628:	eb 31                	jmp    80265b <vfs_seek_file+0x5d>
        f->ptr=offset;
  80262a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80262e:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802631:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  802634:	eb 26                	jmp    80265c <vfs_seek_file+0x5e>
        f->ptr+=offset;
  802636:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80263a:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  80263d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802640:	01 c2                	add    edx,eax
  802642:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802646:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  802649:	eb 11                	jmp    80265c <vfs_seek_file+0x5e>
        f->ptr=f->size;
  80264b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80264f:	8b 50 18             	mov    edx,DWORD PTR [rax+0x18]
  802652:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802656:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  802659:	eb 01                	jmp    80265c <vfs_seek_file+0x5e>
        break;
  80265b:	90                   	nop
    }
    return f->ptr;
  80265c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802660:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  802663:	5d                   	pop    rbp
  802664:	c3                   	ret    

0000000000802665 <get_according_bnr>:
//返回文件ptr在块设备中的块号
int get_according_bnr(vfs_dir_entry *f)
{
  802665:	f3 0f 1e fa          	endbr64 
  802669:	55                   	push   rbp
  80266a:	48 89 e5             	mov    rbp,rsp
  80266d:	48 83 ec 10          	sub    rsp,0x10
  802671:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return vols[f->voln].fs->get_according_bnr(f);
  802675:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802679:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80267c:	48 63 d0             	movsxd rdx,eax
  80267f:	48 89 d0             	mov    rax,rdx
  802682:	48 c1 e0 02          	shl    rax,0x2
  802686:	48 01 d0             	add    rax,rdx
  802689:	48 c1 e0 03          	shl    rax,0x3
  80268d:	48 05 58 02 40 00    	add    rax,0x400258
  802693:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802696:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  80269a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80269e:	48 89 c7             	mov    rdi,rax
  8026a1:	ff d2                	call   rdx

}
  8026a3:	c9                   	leave  
  8026a4:	c3                   	ret    

00000000008026a5 <get_buf>:
//获取或者新建一个和dev上block相对应的缓冲区。
buffer_head* get_buf(int dev,int block)
{
  8026a5:	f3 0f 1e fa          	endbr64 
  8026a9:	55                   	push   rbp
  8026aa:	48 89 e5             	mov    rbp,rsp
  8026ad:	48 83 ec 20          	sub    rsp,0x20
  8026b1:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8026b4:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8026b7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8026be:	e9 b9 00 00 00       	jmp    80277c <get_buf+0xd7>
    {
        if(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block)
  8026c3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8026c6:	48 98                	cdqe   
  8026c8:	48 c1 e0 06          	shl    rax,0x6
  8026cc:	48 05 90 26 40 00    	add    rax,0x402690
  8026d2:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8026d5:	0f b7 c0             	movzx  eax,ax
  8026d8:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8026db:	0f 85 97 00 00 00    	jne    802778 <get_buf+0xd3>
  8026e1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8026e4:	48 98                	cdqe   
  8026e6:	48 c1 e0 06          	shl    rax,0x6
  8026ea:	48 05 88 26 40 00    	add    rax,0x402688
  8026f0:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8026f3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8026f6:	48 98                	cdqe   
  8026f8:	48 39 c2             	cmp    rdx,rax
  8026fb:	75 7b                	jne    802778 <get_buf+0xd3>
        {
            repeat:
  8026fd:	90                   	nop
            wait_on_buf(&buffer_heads[i]);//等待解锁
  8026fe:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802701:	48 98                	cdqe   
  802703:	48 c1 e0 06          	shl    rax,0x6
  802707:	48 05 80 26 40 00    	add    rax,0x402680
  80270d:	48 89 c7             	mov    rdi,rax
  802710:	e8 41 01 00 00       	call   802856 <wait_on_buf>
            if(buffer_heads[i].b_count>0)//别的进程正在用
  802715:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802718:	48 98                	cdqe   
  80271a:	48 c1 e0 06          	shl    rax,0x6
  80271e:	48 05 94 26 40 00    	add    rax,0x402694
  802724:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802727:	84 c0                	test   al,al
  802729:	74 02                	je     80272d <get_buf+0x88>
                goto repeat;
  80272b:	eb d1                	jmp    8026fe <get_buf+0x59>
            if(!(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block))//别的进程修改了
  80272d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802730:	48 98                	cdqe   
  802732:	48 c1 e0 06          	shl    rax,0x6
  802736:	48 05 90 26 40 00    	add    rax,0x402690
  80273c:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80273f:	0f b7 c0             	movzx  eax,ax
  802742:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  802745:	75 30                	jne    802777 <get_buf+0xd2>
  802747:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80274a:	48 98                	cdqe   
  80274c:	48 c1 e0 06          	shl    rax,0x6
  802750:	48 05 88 26 40 00    	add    rax,0x402688
  802756:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802759:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80275c:	48 98                	cdqe   
  80275e:	48 39 c2             	cmp    rdx,rax
  802761:	75 14                	jne    802777 <get_buf+0xd2>
                continue;
            return &buffer_heads[i];
  802763:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802766:	48 98                	cdqe   
  802768:	48 c1 e0 06          	shl    rax,0x6
  80276c:	48 05 80 26 40 00    	add    rax,0x402680
  802772:	e9 dd 00 00 00       	jmp    802854 <get_buf+0x1af>
                continue;
  802777:	90                   	nop
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802778:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80277c:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  802780:	0f 8e 3d ff ff ff    	jle    8026c3 <get_buf+0x1e>
        }
    }
    //空头中找
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802786:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80278d:	e9 b8 00 00 00       	jmp    80284a <get_buf+0x1a5>
    {
        if(buffer_heads[i].b_count==0)
  802792:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802795:	48 98                	cdqe   
  802797:	48 c1 e0 06          	shl    rax,0x6
  80279b:	48 05 94 26 40 00    	add    rax,0x402694
  8027a1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8027a4:	84 c0                	test   al,al
  8027a6:	0f 85 9a 00 00 00    	jne    802846 <get_buf+0x1a1>
        {
            if(buffer_heads[i].b_dirt)
  8027ac:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8027af:	48 98                	cdqe   
  8027b1:	48 c1 e0 06          	shl    rax,0x6
  8027b5:	48 05 93 26 40 00    	add    rax,0x402693
  8027bb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8027be:	84 c0                	test   al,al
  8027c0:	74 2e                	je     8027f0 <get_buf+0x14b>
            {
                sync_buf(&buffer_heads[i]);
  8027c2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8027c5:	48 98                	cdqe   
  8027c7:	48 c1 e0 06          	shl    rax,0x6
  8027cb:	48 05 80 26 40 00    	add    rax,0x402680
  8027d1:	48 89 c7             	mov    rdi,rax
  8027d4:	e8 1b 01 00 00       	call   8028f4 <sync_buf>
                wait_on_buf(&buffer_heads[i]);
  8027d9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8027dc:	48 98                	cdqe   
  8027de:	48 c1 e0 06          	shl    rax,0x6
  8027e2:	48 05 80 26 40 00    	add    rax,0x402680
  8027e8:	48 89 c7             	mov    rdi,rax
  8027eb:	e8 66 00 00 00       	call   802856 <wait_on_buf>
            }
            buffer_heads[i].b_count++;
  8027f0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8027f3:	48 98                	cdqe   
  8027f5:	48 c1 e0 06          	shl    rax,0x6
  8027f9:	48 05 94 26 40 00    	add    rax,0x402694
  8027ff:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802802:	8d 50 01             	lea    edx,[rax+0x1]
  802805:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802808:	48 98                	cdqe   
  80280a:	48 c1 e0 06          	shl    rax,0x6
  80280e:	48 05 94 26 40 00    	add    rax,0x402694
  802814:	88 10                	mov    BYTE PTR [rax],dl
            //给buffer分配一个实际的缓冲区
            buffer_heads[i].b_data=vmalloc();
  802816:	b8 00 00 00 00       	mov    eax,0x0
  80281b:	e8 22 e9 ff ff       	call   801142 <vmalloc>
  802820:	48 89 c2             	mov    rdx,rax
  802823:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802826:	48 98                	cdqe   
  802828:	48 c1 e0 06          	shl    rax,0x6
  80282c:	48 05 80 26 40 00    	add    rax,0x402680
  802832:	48 89 10             	mov    QWORD PTR [rax],rdx
            return &buffer_heads[i];
  802835:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802838:	48 98                	cdqe   
  80283a:	48 c1 e0 06          	shl    rax,0x6
  80283e:	48 05 80 26 40 00    	add    rax,0x402680
  802844:	eb 0e                	jmp    802854 <get_buf+0x1af>
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802846:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80284a:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  80284e:	0f 8e 3e ff ff ff    	jle    802792 <get_buf+0xed>
        }
    }
}
  802854:	c9                   	leave  
  802855:	c3                   	ret    

0000000000802856 <wait_on_buf>:

void wait_on_buf(buffer_head* bh)
{
  802856:	f3 0f 1e fa          	endbr64 
  80285a:	55                   	push   rbp
  80285b:	48 89 e5             	mov    rbp,rsp
  80285e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    //等待缓冲区解锁
    while (bh->b_lock);
  802862:	90                   	nop
  802863:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802867:	0f b6 40 15          	movzx  eax,BYTE PTR [rax+0x15]
  80286b:	84 c0                	test   al,al
  80286d:	75 f4                	jne    802863 <wait_on_buf+0xd>
    
}
  80286f:	90                   	nop
  802870:	90                   	nop
  802871:	5d                   	pop    rbp
  802872:	c3                   	ret    

0000000000802873 <scan_dev>:

//扫描块设备，读取分区，识别文件系统
int scan_dev(int dev)
{
  802873:	f3 0f 1e fa          	endbr64 
  802877:	55                   	push   rbp
  802878:	48 89 e5             	mov    rbp,rsp
  80287b:	48 83 ec 30          	sub    rsp,0x30
  80287f:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
//    device *blkdev=get_dev(dev);
//    buffer_head* bh=bread(dev,0);
//    if(!bh)return -1;
    char* buf=vmalloc();
  802882:	b8 00 00 00 00       	mov    eax,0x0
  802887:	e8 b6 e8 ff ff       	call   801142 <vmalloc>
  80288c:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    int r=request(DISK_MAJOR_MAJOR,DISK_CMD_READ,0,1,buf);
  802890:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802894:	49 89 c0             	mov    r8,rax
  802897:	b9 01 00 00 00       	mov    ecx,0x1
  80289c:	ba 00 00 00 00       	mov    edx,0x0
  8028a1:	be 20 00 00 00       	mov    esi,0x20
  8028a6:	bf 00 00 00 00       	mov    edi,0x0
  8028ab:	e8 7b 41 00 00       	call   806a2b <request>
  8028b0:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    chk_result(r);
  8028b3:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8028b6:	89 c7                	mov    edi,eax
  8028b8:	e8 22 48 00 00       	call   8070df <chk_result>

    dpt_t* dpte=buf+0x1be;
  8028bd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8028c1:	48 05 be 01 00 00    	add    rax,0x1be
  8028c7:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(int i=0;i<4;i++)
  8028cb:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8028d2:	eb 13                	jmp    8028e7 <scan_dev+0x74>
    {
//        blkdev->par[i].type=dpte->type;
        int stlba=dpte->start_lba;
  8028d4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8028d8:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8028db:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
//        {
//            printf("err:unrecognised partition fs.\n");
//        }

//        blkdev->par[i].end_sec=dpte->end_lba;
        dpte++;
  8028de:	48 83 45 f8 10       	add    QWORD PTR [rbp-0x8],0x10
    for(int i=0;i<4;i++)
  8028e3:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8028e7:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8028eb:	7e e7                	jle    8028d4 <scan_dev+0x61>
    }
//    brelse(bh);
    return 0;
  8028ed:	b8 00 00 00 00       	mov    eax,0x0
}
  8028f2:	c9                   	leave  
  8028f3:	c3                   	ret    

00000000008028f4 <sync_buf>:

int sync_buf(buffer_head* bh)
{
  8028f4:	f3 0f 1e fa          	endbr64 
  8028f8:	55                   	push   rbp
  8028f9:	48 89 e5             	mov    rbp,rsp
  8028fc:	48 83 ec 20          	sub    rsp,0x20
  802900:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int dev=bh->b_dev;
  802904:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802908:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
  80290c:	0f b7 c0             	movzx  eax,ax
  80290f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int block=bh->b_blocknr;
  802912:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802916:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80291a:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //这里需要调用块设备写函数write_block
    return write_block(dev,block,bh->b_data,BLOCK_SIZE);
  80291d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802921:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802924:	8b 75 f8             	mov    esi,DWORD PTR [rbp-0x8]
  802927:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80292a:	b9 00 02 00 00       	mov    ecx,0x200
  80292f:	89 c7                	mov    edi,eax
  802931:	e8 02 00 00 00       	call   802938 <write_block>

}
  802936:	c9                   	leave  
  802937:	c3                   	ret    

0000000000802938 <write_block>:
//操作块设备函数
int write_block(int dev,int block,char *buf,int len)
{
  802938:	f3 0f 1e fa          	endbr64 
  80293c:	55                   	push   rbp
  80293d:	48 89 e5             	mov    rbp,rsp
  802940:	48 83 ec 30          	sub    rsp,0x30
  802944:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802947:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80294a:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  80294e:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=get_buf(dev,block);
  802951:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802954:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802957:	89 d6                	mov    esi,edx
  802959:	89 c7                	mov    edi,eax
  80295b:	e8 45 fd ff ff       	call   8026a5 <get_buf>
  802960:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802964:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  802967:	ba 00 02 00 00       	mov    edx,0x200
  80296c:	39 d0                	cmp    eax,edx
  80296e:	0f 4f c2             	cmovg  eax,edx
  802971:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(bh->b_data,buf,size);
  802974:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802977:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80297b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80297e:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  802982:	48 89 ce             	mov    rsi,rcx
  802985:	48 89 c7             	mov    rdi,rax
  802988:	e8 14 7b 00 00       	call   80a4a1 <memcpy>
        len-=BLOCK_SIZE;
  80298d:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        bh->b_dirt=1;//修改置位
  802994:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802998:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  80299c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8029a0:	48 89 c7             	mov    rdi,rax
  8029a3:	e8 f2 f9 ff ff       	call   80239a <brelse>
    }while(len>0);
  8029a8:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  8029ac:	7f a3                	jg     802951 <write_block+0x19>
    return 0;
  8029ae:	b8 00 00 00 00       	mov    eax,0x0
}
  8029b3:	c9                   	leave  
  8029b4:	c3                   	ret    

00000000008029b5 <read_block>:
int read_block(int dev,int block,char* buf,int len)
{
  8029b5:	f3 0f 1e fa          	endbr64 
  8029b9:	55                   	push   rbp
  8029ba:	48 89 e5             	mov    rbp,rsp
  8029bd:	48 83 ec 30          	sub    rsp,0x30
  8029c1:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8029c4:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8029c7:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  8029cb:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=bread(dev,block);
  8029ce:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8029d1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8029d4:	89 d6                	mov    esi,edx
  8029d6:	89 c7                	mov    edi,eax
  8029d8:	e8 20 fa ff ff       	call   8023fd <bread>
  8029dd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  8029e1:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8029e4:	ba 00 02 00 00       	mov    edx,0x200
  8029e9:	39 d0                	cmp    eax,edx
  8029eb:	0f 4f c2             	cmovg  eax,edx
  8029ee:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(buf,bh->b_data,size);
  8029f1:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8029f4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8029f8:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8029fb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8029ff:	48 89 ce             	mov    rsi,rcx
  802a02:	48 89 c7             	mov    rdi,rax
  802a05:	e8 97 7a 00 00       	call   80a4a1 <memcpy>
        len-=BLOCK_SIZE;
  802a0a:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        brelse(bh);
  802a11:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802a15:	48 89 c7             	mov    rdi,rax
  802a18:	e8 7d f9 ff ff       	call   80239a <brelse>
    }while(len>0);
  802a1d:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  802a21:	7f ab                	jg     8029ce <read_block+0x19>
    return 0;
  802a23:	b8 00 00 00 00       	mov    eax,0x0
}
  802a28:	c9                   	leave  
  802a29:	c3                   	ret    

0000000000802a2a <init_vfs>:

int init_vfs()
{
  802a2a:	f3 0f 1e fa          	endbr64 
  802a2e:	55                   	push   rbp
  802a2f:	48 89 e5             	mov    rbp,rsp
  802a32:	48 83 ec 10          	sub    rsp,0x10
    //扫描块设备
    extern device *dev_tree[];
    extern device devs[];
    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
  802a36:	48 8b 05 43 5a c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05a43]        # 408480 <dev_tree>
  802a3d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(;p;p=p->next)
  802a41:	eb 40                	jmp    802a83 <init_vfs+0x59>
    {
        if(scan_dev(p-devs)!=0)return -1;
  802a43:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802a47:	48 2d 80 2e 40 00    	sub    rax,0x402e80
  802a4d:	48 c1 f8 02          	sar    rax,0x2
  802a51:	48 89 c2             	mov    rdx,rax
  802a54:	48 b8 19 9c 8f c1 f9 	movabs rax,0x8f9c18f9c18f9c19
  802a5b:	18 9c 8f 
  802a5e:	48 0f af c2          	imul   rax,rdx
  802a62:	89 c7                	mov    edi,eax
  802a64:	e8 0a fe ff ff       	call   802873 <scan_dev>
  802a69:	85 c0                	test   eax,eax
  802a6b:	74 07                	je     802a74 <init_vfs+0x4a>
  802a6d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802a72:	eb 1b                	jmp    802a8f <init_vfs+0x65>
    for(;p;p=p->next)
  802a74:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802a78:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802a7f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  802a83:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802a88:	75 b9                	jne    802a43 <init_vfs+0x19>
    }

    return 0;
  802a8a:	b8 00 00 00 00       	mov    eax,0x0
}
  802a8f:	c9                   	leave  
  802a90:	c3                   	ret    

0000000000802a91 <init_drvdev_man>:
    [OPERATIONS_KEYBOARD]=NULL,
    [OPERATIONS_MOUSE]=NULL
};
static int rhead=0,rtail=0;
int init_drvdev_man()
{
  802a91:	f3 0f 1e fa          	endbr64 
  802a95:	55                   	push   rbp
  802a96:	48 89 e5             	mov    rbp,rsp
}
  802a99:	90                   	nop
  802a9a:	5d                   	pop    rbp
  802a9b:	c3                   	ret    

0000000000802a9c <load_driver>:
int load_driver(char *path)
{
  802a9c:	f3 0f 1e fa          	endbr64 
  802aa0:	55                   	push   rbp
  802aa1:	48 89 e5             	mov    rbp,rsp
  802aa4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    
}
  802aa8:	90                   	nop
  802aa9:	5d                   	pop    rbp
  802aaa:	c3                   	ret    

0000000000802aab <reg_device>:

int reg_device(device* dev)
{
  802aab:	f3 0f 1e fa          	endbr64 
  802aaf:	55                   	push   rbp
  802ab0:	48 89 e5             	mov    rbp,rsp
  802ab3:	53                   	push   rbx
  802ab4:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //TODO:查重

    //放入数组
    int i=0;
  802ab8:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<MAX_DEVICES;i++)
  802abf:	e9 42 01 00 00       	jmp    802c06 <reg_device+0x15b>
    {
        if(devs[i].flag==DEV_FLAG_EMPTY)
  802ac4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802ac7:	48 63 d0             	movsxd rdx,eax
  802aca:	48 89 d0             	mov    rax,rdx
  802acd:	48 c1 e0 02          	shl    rax,0x2
  802ad1:	48 01 d0             	add    rax,rdx
  802ad4:	48 c1 e0 02          	shl    rax,0x2
  802ad8:	48 01 d0             	add    rax,rdx
  802adb:	48 c1 e0 03          	shl    rax,0x3
  802adf:	48 05 90 2e 40 00    	add    rax,0x402e90
  802ae5:	8b 00                	mov    eax,DWORD PTR [rax]
  802ae7:	85 c0                	test   eax,eax
  802ae9:	0f 85 13 01 00 00    	jne    802c02 <reg_device+0x157>
        {
            devs[i]=*dev;
  802aef:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802af2:	48 63 d0             	movsxd rdx,eax
  802af5:	48 89 d0             	mov    rax,rdx
  802af8:	48 c1 e0 02          	shl    rax,0x2
  802afc:	48 01 d0             	add    rax,rdx
  802aff:	48 c1 e0 02          	shl    rax,0x2
  802b03:	48 01 d0             	add    rax,rdx
  802b06:	48 c1 e0 03          	shl    rax,0x3
  802b0a:	48 8d 90 80 2e 40 00 	lea    rdx,[rax+0x402e80]
  802b11:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802b15:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802b18:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802b1c:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802b1f:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802b23:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802b27:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802b2b:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802b2f:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802b33:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802b37:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802b3b:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802b3f:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802b43:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802b47:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802b4b:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802b4f:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802b53:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802b57:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802b5b:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802b5f:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802b63:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802b67:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802b6b:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802b6f:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802b73:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802b77:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802b7b:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802b7f:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802b83:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802b87:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802b8b:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802b8f:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802b93:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802b9a:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802ba1:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802ba8:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  802baf:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802bb6:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  802bbd:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802bc4:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  802bcb:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
  802bd2:	48 89 82 a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rax
            devs[i].flag=DEV_FLAG_USED;
  802bd9:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802bdc:	48 63 d0             	movsxd rdx,eax
  802bdf:	48 89 d0             	mov    rax,rdx
  802be2:	48 c1 e0 02          	shl    rax,0x2
  802be6:	48 01 d0             	add    rax,rdx
  802be9:	48 c1 e0 02          	shl    rax,0x2
  802bed:	48 01 d0             	add    rax,rdx
  802bf0:	48 c1 e0 03          	shl    rax,0x3
  802bf4:	48 05 90 2e 40 00    	add    rax,0x402e90
  802bfa:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            break;
  802c00:	eb 0e                	jmp    802c10 <reg_device+0x165>
    for(;i<MAX_DEVICES;i++)
  802c02:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802c06:	83 7d f4 3f          	cmp    DWORD PTR [rbp-0xc],0x3f
  802c0a:	0f 8e b4 fe ff ff    	jle    802ac4 <reg_device+0x19>
        }
    }
    if(i==MAX_DEVICES)
  802c10:	83 7d f4 40          	cmp    DWORD PTR [rbp-0xc],0x40
  802c14:	75 0a                	jne    802c20 <reg_device+0x175>
        return -1;
  802c16:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802c1b:	e9 6d 01 00 00       	jmp    802d8d <reg_device+0x2e2>
    //添加到链表
    device* p=NULL,*neo=&devs[i],**pp;
  802c20:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  802c27:	00 
  802c28:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802c2b:	48 63 d0             	movsxd rdx,eax
  802c2e:	48 89 d0             	mov    rax,rdx
  802c31:	48 c1 e0 02          	shl    rax,0x2
  802c35:	48 01 d0             	add    rax,rdx
  802c38:	48 c1 e0 02          	shl    rax,0x2
  802c3c:	48 01 d0             	add    rax,rdx
  802c3f:	48 c1 e0 03          	shl    rax,0x3
  802c43:	48 05 80 2e 40 00    	add    rax,0x402e80
  802c49:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    switch (dev->type)
  802c4d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802c51:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802c54:	83 f8 03             	cmp    eax,0x3
  802c57:	74 3b                	je     802c94 <reg_device+0x1e9>
  802c59:	83 f8 03             	cmp    eax,0x3
  802c5c:	7f 4b                	jg     802ca9 <reg_device+0x1fe>
  802c5e:	83 f8 01             	cmp    eax,0x1
  802c61:	74 07                	je     802c6a <reg_device+0x1bf>
  802c63:	83 f8 02             	cmp    eax,0x2
  802c66:	74 17                	je     802c7f <reg_device+0x1d4>
  802c68:	eb 3f                	jmp    802ca9 <reg_device+0x1fe>
    {
    case DEV_TYPE_BLKDEV:
        p=dev_tree[DEVTREE_BLKDEVI];pp=&dev_tree[DEVTREE_BLKDEVI];
  802c6a:	48 8b 05 0f 58 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0580f]        # 408480 <dev_tree>
  802c71:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802c75:	48 c7 45 e0 80 84 40 	mov    QWORD PTR [rbp-0x20],0x408480
  802c7c:	00 
        break;
  802c7d:	eb 34                	jmp    802cb3 <reg_device+0x208>
    
    case DEV_TYPE_CHRDEV:
        p=dev_tree[DEVTREE_CHRDEVI];pp=&dev_tree[DEVTREE_CHRDEVI];
  802c7f:	48 8b 05 02 58 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05802]        # 408488 <dev_tree+0x8>
  802c86:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802c8a:	48 c7 45 e0 88 84 40 	mov    QWORD PTR [rbp-0x20],0x408488
  802c91:	00 
        break;
  802c92:	eb 1f                	jmp    802cb3 <reg_device+0x208>
        
    case DEV_TYPE_OTHERS:
        p=dev_tree[DEVTREE_OTHERDEVI];pp=&dev_tree[DEVTREE_OTHERDEVI];
  802c94:	48 8b 05 f5 57 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc057f5]        # 408490 <dev_tree+0x10>
  802c9b:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802c9f:	48 c7 45 e0 90 84 40 	mov    QWORD PTR [rbp-0x20],0x408490
  802ca6:	00 
        break;
  802ca7:	eb 0a                	jmp    802cb3 <reg_device+0x208>
    default:return -1;//不可能有其他情况
  802ca9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802cae:	e9 da 00 00 00       	jmp    802d8d <reg_device+0x2e2>
    }
    if(!p){
  802cb3:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  802cb8:	75 2b                	jne    802ce5 <reg_device+0x23a>
        *pp=neo;
  802cba:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802cbe:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802cc2:	48 89 10             	mov    QWORD PTR [rax],rdx
        neo->prev=NULL;
  802cc5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802cc9:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x0
  802cd0:	00 00 00 00 
  802cd4:	eb 3d                	jmp    802d13 <reg_device+0x268>
    }
    else{
        for(;p->next;p=p->next);
  802cd6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802cda:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802ce1:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802ce5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802ce9:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802cf0:	48 85 c0             	test   rax,rax
  802cf3:	75 e1                	jne    802cd6 <reg_device+0x22b>
        p->next=neo;
  802cf5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802cf9:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802cfd:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
        neo->prev=p;
  802d04:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d08:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  802d0c:	48 89 90 98 00 00 00 	mov    QWORD PTR [rax+0x98],rdx
    }
    neo->next=NULL;
  802d13:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d17:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x0
  802d1e:	00 00 00 00 
    //设置相应的请求函数
    switch (neo->stype)
  802d22:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d26:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  802d29:	83 f8 04             	cmp    eax,0x4
  802d2c:	74 3b                	je     802d69 <reg_device+0x2be>
  802d2e:	83 f8 04             	cmp    eax,0x4
  802d31:	7f 56                	jg     802d89 <reg_device+0x2de>
  802d33:	83 f8 03             	cmp    eax,0x3
  802d36:	74 21                	je     802d59 <reg_device+0x2ae>
  802d38:	83 f8 03             	cmp    eax,0x3
  802d3b:	7f 4c                	jg     802d89 <reg_device+0x2de>
  802d3d:	83 f8 01             	cmp    eax,0x1
  802d40:	74 07                	je     802d49 <reg_device+0x29e>
  802d42:	83 f8 02             	cmp    eax,0x2
  802d45:	74 32                	je     802d79 <reg_device+0x2ce>
        break;
    case DEV_STYPE_TTY:
        neo->operi=OPERATIONS_TTY;
        break;
    default:
        break;
  802d47:	eb 40                	jmp    802d89 <reg_device+0x2de>
        neo->operi=OPERATIONS_HD;
  802d49:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d4d:	c7 80 a0 00 00 00 00 	mov    DWORD PTR [rax+0xa0],0x0
  802d54:	00 00 00 
        break;
  802d57:	eb 31                	jmp    802d8a <reg_device+0x2df>
        neo->operi=OPERATIONS_MOUSE;
  802d59:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d5d:	c7 80 a0 00 00 00 02 	mov    DWORD PTR [rax+0xa0],0x2
  802d64:	00 00 00 
        break;
  802d67:	eb 21                	jmp    802d8a <reg_device+0x2df>
        neo->operi=OPERATIONS_KEYBOARD;
  802d69:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d6d:	c7 80 a0 00 00 00 03 	mov    DWORD PTR [rax+0xa0],0x3
  802d74:	00 00 00 
        break;
  802d77:	eb 11                	jmp    802d8a <reg_device+0x2df>
        neo->operi=OPERATIONS_TTY;
  802d79:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d7d:	c7 80 a0 00 00 00 01 	mov    DWORD PTR [rax+0xa0],0x1
  802d84:	00 00 00 
        break;
  802d87:	eb 01                	jmp    802d8a <reg_device+0x2df>
        break;
  802d89:	90                   	nop
    }
    return i;
  802d8a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  802d8d:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802d91:	c9                   	leave  
  802d92:	c3                   	ret    

0000000000802d93 <reg_driver>:


int reg_driver(driver *drv)
{
  802d93:	f3 0f 1e fa          	endbr64 
  802d97:	55                   	push   rbp
  802d98:	48 89 e5             	mov    rbp,rsp
  802d9b:	53                   	push   rbx
  802d9c:	48 89 7d e0          	mov    QWORD PTR [rbp-0x20],rdi
    for(int i=0;i<MAX_DRIVERS;i++)
  802da0:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  802da7:	e9 22 01 00 00       	jmp    802ece <reg_driver+0x13b>
    {
        if(drvs[i].flag==DRV_FLAG_EMPTY)
  802dac:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802daf:	48 63 d0             	movsxd rdx,eax
  802db2:	48 89 d0             	mov    rax,rdx
  802db5:	48 c1 e0 02          	shl    rax,0x2
  802db9:	48 01 d0             	add    rax,rdx
  802dbc:	48 c1 e0 05          	shl    rax,0x5
  802dc0:	48 05 80 58 40 00    	add    rax,0x405880
  802dc6:	8b 00                	mov    eax,DWORD PTR [rax]
  802dc8:	85 c0                	test   eax,eax
  802dca:	0f 85 fa 00 00 00    	jne    802eca <reg_driver+0x137>
        {
            drvs[i]=*drv;
  802dd0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802dd3:	48 63 d0             	movsxd rdx,eax
  802dd6:	48 89 d0             	mov    rax,rdx
  802dd9:	48 c1 e0 02          	shl    rax,0x2
  802ddd:	48 01 d0             	add    rax,rdx
  802de0:	48 c1 e0 05          	shl    rax,0x5
  802de4:	48 8d 90 80 58 40 00 	lea    rdx,[rax+0x405880]
  802deb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802def:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802df2:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802df6:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802df9:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802dfd:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802e01:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802e05:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802e09:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802e0d:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802e11:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802e15:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802e19:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802e1d:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802e21:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802e25:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802e29:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802e2d:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802e31:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802e35:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802e39:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802e3d:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802e41:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802e45:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802e49:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802e4d:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802e51:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802e55:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802e59:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802e5d:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802e61:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802e65:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802e69:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802e6d:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802e74:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802e7b:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802e82:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  802e89:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802e90:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  802e97:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802e9e:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
            drvs[i].flag=DRV_FLAG_USED;
  802ea5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802ea8:	48 63 d0             	movsxd rdx,eax
  802eab:	48 89 d0             	mov    rax,rdx
  802eae:	48 c1 e0 02          	shl    rax,0x2
  802eb2:	48 01 d0             	add    rax,rdx
  802eb5:	48 c1 e0 05          	shl    rax,0x5
  802eb9:	48 05 80 58 40 00    	add    rax,0x405880
  802ebf:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            return i;
  802ec5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802ec8:	eb 13                	jmp    802edd <reg_driver+0x14a>
    for(int i=0;i<MAX_DRIVERS;i++)
  802eca:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802ece:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  802ed2:	0f 8e d4 fe ff ff    	jle    802dac <reg_driver+0x19>
        }
    }
    return -1;
  802ed8:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802edd:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802ee1:	c9                   	leave  
  802ee2:	c3                   	ret    

0000000000802ee3 <sys_find_dev>:

int sys_find_dev(char *name)
{
  802ee3:	f3 0f 1e fa          	endbr64 
  802ee7:	55                   	push   rbp
  802ee8:	48 89 e5             	mov    rbp,rsp
  802eeb:	48 83 ec 20          	sub    rsp,0x20
  802eef:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_DEVICES;i++)
  802ef3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802efa:	eb 6c                	jmp    802f68 <sys_find_dev+0x85>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802efc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802eff:	48 63 d0             	movsxd rdx,eax
  802f02:	48 89 d0             	mov    rax,rdx
  802f05:	48 c1 e0 02          	shl    rax,0x2
  802f09:	48 01 d0             	add    rax,rdx
  802f0c:	48 c1 e0 02          	shl    rax,0x2
  802f10:	48 01 d0             	add    rax,rdx
  802f13:	48 c1 e0 03          	shl    rax,0x3
  802f17:	48 05 90 2e 40 00    	add    rax,0x402e90
  802f1d:	8b 00                	mov    eax,DWORD PTR [rax]
  802f1f:	85 c0                	test   eax,eax
  802f21:	74 41                	je     802f64 <sys_find_dev+0x81>
  802f23:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f26:	48 63 d0             	movsxd rdx,eax
  802f29:	48 89 d0             	mov    rax,rdx
  802f2c:	48 c1 e0 02          	shl    rax,0x2
  802f30:	48 01 d0             	add    rax,rdx
  802f33:	48 c1 e0 02          	shl    rax,0x2
  802f37:	48 01 d0             	add    rax,rdx
  802f3a:	48 c1 e0 03          	shl    rax,0x3
  802f3e:	48 83 c0 10          	add    rax,0x10
  802f42:	48 05 80 2e 40 00    	add    rax,0x402e80
  802f48:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802f4c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802f50:	48 89 d6             	mov    rsi,rdx
  802f53:	48 89 c7             	mov    rdi,rax
  802f56:	e8 e4 77 00 00       	call   80a73f <strcmp>
  802f5b:	85 c0                	test   eax,eax
  802f5d:	75 05                	jne    802f64 <sys_find_dev+0x81>
            return i;
  802f5f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f62:	eb 0f                	jmp    802f73 <sys_find_dev+0x90>
    for(int i=0;i<MAX_DEVICES;i++)
  802f64:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802f68:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802f6c:	7e 8e                	jle    802efc <sys_find_dev+0x19>
    }
    return -1;
  802f6e:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802f73:	c9                   	leave  
  802f74:	c3                   	ret    

0000000000802f75 <sys_operate_dev>:

int sys_operate_dev(char *name,int func,driver_args* args)
{
  802f75:	f3 0f 1e fa          	endbr64 
  802f79:	55                   	push   rbp
  802f7a:	48 89 e5             	mov    rbp,rsp
  802f7d:	48 83 ec 30          	sub    rsp,0x30
  802f81:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802f85:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  802f88:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    int i=0;
  802f8c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;i<MAX_DEVICES;i++)
  802f93:	eb 67                	jmp    802ffc <sys_operate_dev+0x87>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802f95:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f98:	48 63 d0             	movsxd rdx,eax
  802f9b:	48 89 d0             	mov    rax,rdx
  802f9e:	48 c1 e0 02          	shl    rax,0x2
  802fa2:	48 01 d0             	add    rax,rdx
  802fa5:	48 c1 e0 02          	shl    rax,0x2
  802fa9:	48 01 d0             	add    rax,rdx
  802fac:	48 c1 e0 03          	shl    rax,0x3
  802fb0:	48 05 90 2e 40 00    	add    rax,0x402e90
  802fb6:	8b 00                	mov    eax,DWORD PTR [rax]
  802fb8:	85 c0                	test   eax,eax
  802fba:	74 3c                	je     802ff8 <sys_operate_dev+0x83>
  802fbc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802fbf:	48 63 d0             	movsxd rdx,eax
  802fc2:	48 89 d0             	mov    rax,rdx
  802fc5:	48 c1 e0 02          	shl    rax,0x2
  802fc9:	48 01 d0             	add    rax,rdx
  802fcc:	48 c1 e0 02          	shl    rax,0x2
  802fd0:	48 01 d0             	add    rax,rdx
  802fd3:	48 c1 e0 03          	shl    rax,0x3
  802fd7:	48 83 c0 10          	add    rax,0x10
  802fdb:	48 05 80 2e 40 00    	add    rax,0x402e80
  802fe1:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802fe5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802fe9:	48 89 d6             	mov    rsi,rdx
  802fec:	48 89 c7             	mov    rdi,rax
  802fef:	e8 4b 77 00 00       	call   80a73f <strcmp>
  802ff4:	85 c0                	test   eax,eax
  802ff6:	74 0c                	je     803004 <sys_operate_dev+0x8f>
    for(;i<MAX_DEVICES;i++)
  802ff8:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802ffc:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803000:	7e 93                	jle    802f95 <sys_operate_dev+0x20>
  803002:	eb 01                	jmp    803005 <sys_operate_dev+0x90>
            break;
  803004:	90                   	nop
    }
    if(i==MAX_DEVICES)return -1;
  803005:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  803009:	75 0a                	jne    803015 <sys_operate_dev+0xa0>
  80300b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803010:	e9 9c 02 00 00       	jmp    8032b1 <sys_operate_dev+0x33c>
    switch (func) {
  803015:	83 7d e4 0b          	cmp    DWORD PTR [rbp-0x1c],0xb
  803019:	0f 87 8d 02 00 00    	ja     8032ac <sys_operate_dev+0x337>
  80301f:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  803022:	48 8b 04 c5 f0 29 81 	mov    rax,QWORD PTR [rax*8+0x8129f0]
  803029:	00 
  80302a:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return devs[i].drv->open(args);
  80302d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803030:	48 63 d0             	movsxd rdx,eax
  803033:	48 89 d0             	mov    rax,rdx
  803036:	48 c1 e0 02          	shl    rax,0x2
  80303a:	48 01 d0             	add    rax,rdx
  80303d:	48 c1 e0 02          	shl    rax,0x2
  803041:	48 01 d0             	add    rax,rdx
  803044:	48 c1 e0 03          	shl    rax,0x3
  803048:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80304e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803051:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  803055:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803059:	48 89 c7             	mov    rdi,rax
  80305c:	ff d2                	call   rdx
  80305e:	e9 4e 02 00 00       	jmp    8032b1 <sys_operate_dev+0x33c>
        case DRVF_CLOSE:return devs[i].drv->close(args);
  803063:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803066:	48 63 d0             	movsxd rdx,eax
  803069:	48 89 d0             	mov    rax,rdx
  80306c:	48 c1 e0 02          	shl    rax,0x2
  803070:	48 01 d0             	add    rax,rdx
  803073:	48 c1 e0 02          	shl    rax,0x2
  803077:	48 01 d0             	add    rax,rdx
  80307a:	48 c1 e0 03          	shl    rax,0x3
  80307e:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803084:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803087:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  80308b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80308f:	48 89 c7             	mov    rdi,rax
  803092:	ff d2                	call   rdx
  803094:	e9 18 02 00 00       	jmp    8032b1 <sys_operate_dev+0x33c>
        case DRVF_READ :return devs[i].drv->read(args);
  803099:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80309c:	48 63 d0             	movsxd rdx,eax
  80309f:	48 89 d0             	mov    rax,rdx
  8030a2:	48 c1 e0 02          	shl    rax,0x2
  8030a6:	48 01 d0             	add    rax,rdx
  8030a9:	48 c1 e0 02          	shl    rax,0x2
  8030ad:	48 01 d0             	add    rax,rdx
  8030b0:	48 c1 e0 03          	shl    rax,0x3
  8030b4:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8030ba:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8030bd:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  8030c1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8030c5:	48 89 c7             	mov    rdi,rax
  8030c8:	ff d2                	call   rdx
  8030ca:	e9 e2 01 00 00       	jmp    8032b1 <sys_operate_dev+0x33c>
        case DRVF_WRITE:return devs[i].drv->write(args);
  8030cf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8030d2:	48 63 d0             	movsxd rdx,eax
  8030d5:	48 89 d0             	mov    rax,rdx
  8030d8:	48 c1 e0 02          	shl    rax,0x2
  8030dc:	48 01 d0             	add    rax,rdx
  8030df:	48 c1 e0 02          	shl    rax,0x2
  8030e3:	48 01 d0             	add    rax,rdx
  8030e6:	48 c1 e0 03          	shl    rax,0x3
  8030ea:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8030f0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8030f3:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  8030f7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8030fb:	48 89 c7             	mov    rdi,rax
  8030fe:	ff d2                	call   rdx
  803100:	e9 ac 01 00 00       	jmp    8032b1 <sys_operate_dev+0x33c>
        case DRVF_CHK  :return devs[i].drv->check(args);
  803105:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803108:	48 63 d0             	movsxd rdx,eax
  80310b:	48 89 d0             	mov    rax,rdx
  80310e:	48 c1 e0 02          	shl    rax,0x2
  803112:	48 01 d0             	add    rax,rdx
  803115:	48 c1 e0 02          	shl    rax,0x2
  803119:	48 01 d0             	add    rax,rdx
  80311c:	48 c1 e0 03          	shl    rax,0x3
  803120:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803126:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803129:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  80312d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803131:	48 89 c7             	mov    rdi,rax
  803134:	ff d2                	call   rdx
  803136:	e9 76 01 00 00       	jmp    8032b1 <sys_operate_dev+0x33c>
        case DRVF_RSVD :return devs[i].drv->reserved(args);
  80313b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80313e:	48 63 d0             	movsxd rdx,eax
  803141:	48 89 d0             	mov    rax,rdx
  803144:	48 c1 e0 02          	shl    rax,0x2
  803148:	48 01 d0             	add    rax,rdx
  80314b:	48 c1 e0 02          	shl    rax,0x2
  80314f:	48 01 d0             	add    rax,rdx
  803152:	48 c1 e0 03          	shl    rax,0x3
  803156:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80315c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80315f:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
  803163:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803167:	48 89 c7             	mov    rdi,rax
  80316a:	ff d2                	call   rdx
  80316c:	e9 40 01 00 00       	jmp    8032b1 <sys_operate_dev+0x33c>
        case DRVF_INT  :return devs[i].drv->inthandler(args);
  803171:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803174:	48 63 d0             	movsxd rdx,eax
  803177:	48 89 d0             	mov    rax,rdx
  80317a:	48 c1 e0 02          	shl    rax,0x2
  80317e:	48 01 d0             	add    rax,rdx
  803181:	48 c1 e0 02          	shl    rax,0x2
  803185:	48 01 d0             	add    rax,rdx
  803188:	48 c1 e0 03          	shl    rax,0x3
  80318c:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803192:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803195:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
  803199:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80319d:	48 89 c7             	mov    rdi,rax
  8031a0:	ff d2                	call   rdx
  8031a2:	e9 0a 01 00 00       	jmp    8032b1 <sys_operate_dev+0x33c>
        case DRVF_FIND :return devs[i].drv->find(args);
  8031a7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8031aa:	48 63 d0             	movsxd rdx,eax
  8031ad:	48 89 d0             	mov    rax,rdx
  8031b0:	48 c1 e0 02          	shl    rax,0x2
  8031b4:	48 01 d0             	add    rax,rdx
  8031b7:	48 c1 e0 02          	shl    rax,0x2
  8031bb:	48 01 d0             	add    rax,rdx
  8031be:	48 c1 e0 03          	shl    rax,0x3
  8031c2:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8031c8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8031cb:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  8031cf:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8031d3:	48 89 c7             	mov    rdi,rax
  8031d6:	ff d2                	call   rdx
  8031d8:	e9 d4 00 00 00       	jmp    8032b1 <sys_operate_dev+0x33c>
        case DRVF_RM   :return devs[i].drv->rm(args);
  8031dd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8031e0:	48 63 d0             	movsxd rdx,eax
  8031e3:	48 89 d0             	mov    rax,rdx
  8031e6:	48 c1 e0 02          	shl    rax,0x2
  8031ea:	48 01 d0             	add    rax,rdx
  8031ed:	48 c1 e0 02          	shl    rax,0x2
  8031f1:	48 01 d0             	add    rax,rdx
  8031f4:	48 c1 e0 03          	shl    rax,0x3
  8031f8:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8031fe:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803201:	48 8b 50 48          	mov    rdx,QWORD PTR [rax+0x48]
  803205:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803209:	48 89 c7             	mov    rdi,rax
  80320c:	ff d2                	call   rdx
  80320e:	e9 9e 00 00 00       	jmp    8032b1 <sys_operate_dev+0x33c>
        case DRVF_TOUCH:return devs[i].drv->touch(args);
  803213:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803216:	48 63 d0             	movsxd rdx,eax
  803219:	48 89 d0             	mov    rax,rdx
  80321c:	48 c1 e0 02          	shl    rax,0x2
  803220:	48 01 d0             	add    rax,rdx
  803223:	48 c1 e0 02          	shl    rax,0x2
  803227:	48 01 d0             	add    rax,rdx
  80322a:	48 c1 e0 03          	shl    rax,0x3
  80322e:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803234:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803237:	48 8b 50 50          	mov    rdx,QWORD PTR [rax+0x50]
  80323b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80323f:	48 89 c7             	mov    rdi,rax
  803242:	ff d2                	call   rdx
  803244:	eb 6b                	jmp    8032b1 <sys_operate_dev+0x33c>
        case DRVF_MKDIR:return devs[i].drv->mkdir(args);
  803246:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803249:	48 63 d0             	movsxd rdx,eax
  80324c:	48 89 d0             	mov    rax,rdx
  80324f:	48 c1 e0 02          	shl    rax,0x2
  803253:	48 01 d0             	add    rax,rdx
  803256:	48 c1 e0 02          	shl    rax,0x2
  80325a:	48 01 d0             	add    rax,rdx
  80325d:	48 c1 e0 03          	shl    rax,0x3
  803261:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803267:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80326a:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  80326e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803272:	48 89 c7             	mov    rdi,rax
  803275:	ff d2                	call   rdx
  803277:	eb 38                	jmp    8032b1 <sys_operate_dev+0x33c>
        case DRVF_LS:return    devs[i].drv->ls(args);
  803279:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80327c:	48 63 d0             	movsxd rdx,eax
  80327f:	48 89 d0             	mov    rax,rdx
  803282:	48 c1 e0 02          	shl    rax,0x2
  803286:	48 01 d0             	add    rax,rdx
  803289:	48 c1 e0 02          	shl    rax,0x2
  80328d:	48 01 d0             	add    rax,rdx
  803290:	48 c1 e0 03          	shl    rax,0x3
  803294:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80329a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80329d:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
  8032a1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8032a5:	48 89 c7             	mov    rdi,rax
  8032a8:	ff d2                	call   rdx
  8032aa:	eb 05                	jmp    8032b1 <sys_operate_dev+0x33c>
    }
    return -1;
  8032ac:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8032b1:	c9                   	leave  
  8032b2:	c3                   	ret    

00000000008032b3 <call_drv_func>:
int call_drv_func(int drv_n,int func_n,driver_args *args)
{
  8032b3:	f3 0f 1e fa          	endbr64 
  8032b7:	55                   	push   rbp
  8032b8:	48 89 e5             	mov    rbp,rsp
  8032bb:	48 83 ec 10          	sub    rsp,0x10
  8032bf:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  8032c2:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  8032c5:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    if(drvs[drv_n].flag==DRV_FLAG_EMPTY)return -1;
  8032c9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032cc:	48 63 d0             	movsxd rdx,eax
  8032cf:	48 89 d0             	mov    rax,rdx
  8032d2:	48 c1 e0 02          	shl    rax,0x2
  8032d6:	48 01 d0             	add    rax,rdx
  8032d9:	48 c1 e0 05          	shl    rax,0x5
  8032dd:	48 05 80 58 40 00    	add    rax,0x405880
  8032e3:	8b 00                	mov    eax,DWORD PTR [rax]
  8032e5:	85 c0                	test   eax,eax
  8032e7:	75 0a                	jne    8032f3 <call_drv_func+0x40>
  8032e9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8032ee:	e9 15 02 00 00       	jmp    803508 <call_drv_func+0x255>
    /*driverfunc f=drvs[drv_n].func_thunk[func_n];
    return f(args);*/
    switch (func_n) {
  8032f3:	83 7d f8 0b          	cmp    DWORD PTR [rbp-0x8],0xb
  8032f7:	0f 87 06 02 00 00    	ja     803503 <call_drv_func+0x250>
  8032fd:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803300:	48 8b 04 c5 50 2a 81 	mov    rax,QWORD PTR [rax*8+0x812a50]
  803307:	00 
  803308:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return drvs[drv_n].open(args);
  80330b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80330e:	48 63 d0             	movsxd rdx,eax
  803311:	48 89 d0             	mov    rax,rdx
  803314:	48 c1 e0 02          	shl    rax,0x2
  803318:	48 01 d0             	add    rax,rdx
  80331b:	48 c1 e0 05          	shl    rax,0x5
  80331f:	48 05 88 58 40 00    	add    rax,0x405888
  803325:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803328:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80332c:	48 89 c7             	mov    rdi,rax
  80332f:	ff d2                	call   rdx
  803331:	e9 d2 01 00 00       	jmp    803508 <call_drv_func+0x255>
        case DRVF_CLOSE:return drvs[drv_n].close(args);
  803336:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803339:	48 63 d0             	movsxd rdx,eax
  80333c:	48 89 d0             	mov    rax,rdx
  80333f:	48 c1 e0 02          	shl    rax,0x2
  803343:	48 01 d0             	add    rax,rdx
  803346:	48 c1 e0 05          	shl    rax,0x5
  80334a:	48 05 90 58 40 00    	add    rax,0x405890
  803350:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803353:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803357:	48 89 c7             	mov    rdi,rax
  80335a:	ff d2                	call   rdx
  80335c:	e9 a7 01 00 00       	jmp    803508 <call_drv_func+0x255>
        case DRVF_READ :return drvs[drv_n].read(args);
  803361:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803364:	48 63 d0             	movsxd rdx,eax
  803367:	48 89 d0             	mov    rax,rdx
  80336a:	48 c1 e0 02          	shl    rax,0x2
  80336e:	48 01 d0             	add    rax,rdx
  803371:	48 c1 e0 05          	shl    rax,0x5
  803375:	48 05 98 58 40 00    	add    rax,0x405898
  80337b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80337e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803382:	48 89 c7             	mov    rdi,rax
  803385:	ff d2                	call   rdx
  803387:	e9 7c 01 00 00       	jmp    803508 <call_drv_func+0x255>
        case DRVF_WRITE:return drvs[drv_n].write(args);
  80338c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80338f:	48 63 d0             	movsxd rdx,eax
  803392:	48 89 d0             	mov    rax,rdx
  803395:	48 c1 e0 02          	shl    rax,0x2
  803399:	48 01 d0             	add    rax,rdx
  80339c:	48 c1 e0 05          	shl    rax,0x5
  8033a0:	48 05 a0 58 40 00    	add    rax,0x4058a0
  8033a6:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8033a9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033ad:	48 89 c7             	mov    rdi,rax
  8033b0:	ff d2                	call   rdx
  8033b2:	e9 51 01 00 00       	jmp    803508 <call_drv_func+0x255>
        case DRVF_CHK  :return drvs[drv_n].check(args);
  8033b7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8033ba:	48 63 d0             	movsxd rdx,eax
  8033bd:	48 89 d0             	mov    rax,rdx
  8033c0:	48 c1 e0 02          	shl    rax,0x2
  8033c4:	48 01 d0             	add    rax,rdx
  8033c7:	48 c1 e0 05          	shl    rax,0x5
  8033cb:	48 05 a8 58 40 00    	add    rax,0x4058a8
  8033d1:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8033d4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033d8:	48 89 c7             	mov    rdi,rax
  8033db:	ff d2                	call   rdx
  8033dd:	e9 26 01 00 00       	jmp    803508 <call_drv_func+0x255>
        case DRVF_RSVD :return drvs[drv_n].reserved(args);
  8033e2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8033e5:	48 63 d0             	movsxd rdx,eax
  8033e8:	48 89 d0             	mov    rax,rdx
  8033eb:	48 c1 e0 02          	shl    rax,0x2
  8033ef:	48 01 d0             	add    rax,rdx
  8033f2:	48 c1 e0 05          	shl    rax,0x5
  8033f6:	48 05 b0 58 40 00    	add    rax,0x4058b0
  8033fc:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8033ff:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803403:	48 89 c7             	mov    rdi,rax
  803406:	ff d2                	call   rdx
  803408:	e9 fb 00 00 00       	jmp    803508 <call_drv_func+0x255>
        case DRVF_INT  :return drvs[drv_n].inthandler(args);
  80340d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803410:	48 63 d0             	movsxd rdx,eax
  803413:	48 89 d0             	mov    rax,rdx
  803416:	48 c1 e0 02          	shl    rax,0x2
  80341a:	48 01 d0             	add    rax,rdx
  80341d:	48 c1 e0 05          	shl    rax,0x5
  803421:	48 05 b8 58 40 00    	add    rax,0x4058b8
  803427:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80342a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80342e:	48 89 c7             	mov    rdi,rax
  803431:	ff d2                	call   rdx
  803433:	e9 d0 00 00 00       	jmp    803508 <call_drv_func+0x255>
        case DRVF_FIND :return drvs[drv_n].find(args);
  803438:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80343b:	48 63 d0             	movsxd rdx,eax
  80343e:	48 89 d0             	mov    rax,rdx
  803441:	48 c1 e0 02          	shl    rax,0x2
  803445:	48 01 d0             	add    rax,rdx
  803448:	48 c1 e0 05          	shl    rax,0x5
  80344c:	48 05 c0 58 40 00    	add    rax,0x4058c0
  803452:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803455:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803459:	48 89 c7             	mov    rdi,rax
  80345c:	ff d2                	call   rdx
  80345e:	e9 a5 00 00 00       	jmp    803508 <call_drv_func+0x255>
        case DRVF_RM   :return drvs[drv_n].rm(args);
  803463:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803466:	48 63 d0             	movsxd rdx,eax
  803469:	48 89 d0             	mov    rax,rdx
  80346c:	48 c1 e0 02          	shl    rax,0x2
  803470:	48 01 d0             	add    rax,rdx
  803473:	48 c1 e0 05          	shl    rax,0x5
  803477:	48 05 c8 58 40 00    	add    rax,0x4058c8
  80347d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803480:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803484:	48 89 c7             	mov    rdi,rax
  803487:	ff d2                	call   rdx
  803489:	eb 7d                	jmp    803508 <call_drv_func+0x255>
        case DRVF_TOUCH:return drvs[drv_n].touch(args);
  80348b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80348e:	48 63 d0             	movsxd rdx,eax
  803491:	48 89 d0             	mov    rax,rdx
  803494:	48 c1 e0 02          	shl    rax,0x2
  803498:	48 01 d0             	add    rax,rdx
  80349b:	48 c1 e0 05          	shl    rax,0x5
  80349f:	48 05 d0 58 40 00    	add    rax,0x4058d0
  8034a5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8034a8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8034ac:	48 89 c7             	mov    rdi,rax
  8034af:	ff d2                	call   rdx
  8034b1:	eb 55                	jmp    803508 <call_drv_func+0x255>
        case DRVF_MKDIR:return drvs[drv_n].mkdir(args);
  8034b3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034b6:	48 63 d0             	movsxd rdx,eax
  8034b9:	48 89 d0             	mov    rax,rdx
  8034bc:	48 c1 e0 02          	shl    rax,0x2
  8034c0:	48 01 d0             	add    rax,rdx
  8034c3:	48 c1 e0 05          	shl    rax,0x5
  8034c7:	48 05 d8 58 40 00    	add    rax,0x4058d8
  8034cd:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8034d0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8034d4:	48 89 c7             	mov    rdi,rax
  8034d7:	ff d2                	call   rdx
  8034d9:	eb 2d                	jmp    803508 <call_drv_func+0x255>
        case DRVF_LS:return drvs[drv_n].ls(args);
  8034db:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034de:	48 63 d0             	movsxd rdx,eax
  8034e1:	48 89 d0             	mov    rax,rdx
  8034e4:	48 c1 e0 02          	shl    rax,0x2
  8034e8:	48 01 d0             	add    rax,rdx
  8034eb:	48 c1 e0 05          	shl    rax,0x5
  8034ef:	48 05 e0 58 40 00    	add    rax,0x4058e0
  8034f5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8034f8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8034fc:	48 89 c7             	mov    rdi,rax
  8034ff:	ff d2                	call   rdx
  803501:	eb 05                	jmp    803508 <call_drv_func+0x255>
    }
    return -1;
  803503:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  803508:	c9                   	leave  
  803509:	c3                   	ret    

000000000080350a <dispose_device>:
int dispose_device(int dev){
  80350a:	f3 0f 1e fa          	endbr64 
  80350e:	55                   	push   rbp
  80350f:	48 89 e5             	mov    rbp,rsp
  803512:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(devs[dev].flag!=DEV_FLAG_USED)return -1;
  803515:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803518:	48 63 d0             	movsxd rdx,eax
  80351b:	48 89 d0             	mov    rax,rdx
  80351e:	48 c1 e0 02          	shl    rax,0x2
  803522:	48 01 d0             	add    rax,rdx
  803525:	48 c1 e0 02          	shl    rax,0x2
  803529:	48 01 d0             	add    rax,rdx
  80352c:	48 c1 e0 03          	shl    rax,0x3
  803530:	48 05 90 2e 40 00    	add    rax,0x402e90
  803536:	8b 00                	mov    eax,DWORD PTR [rax]
  803538:	83 f8 01             	cmp    eax,0x1
  80353b:	74 07                	je     803544 <dispose_device+0x3a>
  80353d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803542:	eb 62                	jmp    8035a6 <dispose_device+0x9c>
    device* p=&devs[dev];
  803544:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803547:	48 63 d0             	movsxd rdx,eax
  80354a:	48 89 d0             	mov    rax,rdx
  80354d:	48 c1 e0 02          	shl    rax,0x2
  803551:	48 01 d0             	add    rax,rdx
  803554:	48 c1 e0 02          	shl    rax,0x2
  803558:	48 01 d0             	add    rax,rdx
  80355b:	48 c1 e0 03          	shl    rax,0x3
  80355f:	48 05 80 2e 40 00    	add    rax,0x402e80
  803565:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //从链表删除
    if(p->prev)p->prev->next=p->next;
  803569:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80356d:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  803574:	48 85 c0             	test   rax,rax
  803577:	74 1d                	je     803596 <dispose_device+0x8c>
  803579:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80357d:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  803584:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  803588:	48 8b 92 90 00 00 00 	mov    rdx,QWORD PTR [rdx+0x90]
  80358f:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
    p->flag=DEV_FLAG_EMPTY;
  803596:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80359a:	c7 40 10 00 00 00 00 	mov    DWORD PTR [rax+0x10],0x0
    return 0;
  8035a1:	b8 00 00 00 00       	mov    eax,0x0
}
  8035a6:	5d                   	pop    rbp
  8035a7:	c3                   	ret    

00000000008035a8 <dispose_driver>:
int dispose_driver(driver *drv){
  8035a8:	f3 0f 1e fa          	endbr64 
  8035ac:	55                   	push   rbp
  8035ad:	48 89 e5             	mov    rbp,rsp
  8035b0:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  8035b4:	90                   	nop
  8035b5:	5d                   	pop    rbp
  8035b6:	c3                   	ret    

00000000008035b7 <get_dev>:

device *get_dev(int devi)
{
  8035b7:	f3 0f 1e fa          	endbr64 
  8035bb:	55                   	push   rbp
  8035bc:	48 89 e5             	mov    rbp,rsp
  8035bf:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &devs[devi];
  8035c2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8035c5:	48 63 d0             	movsxd rdx,eax
  8035c8:	48 89 d0             	mov    rax,rdx
  8035cb:	48 c1 e0 02          	shl    rax,0x2
  8035cf:	48 01 d0             	add    rax,rdx
  8035d2:	48 c1 e0 02          	shl    rax,0x2
  8035d6:	48 01 d0             	add    rax,rdx
  8035d9:	48 c1 e0 03          	shl    rax,0x3
  8035dd:	48 05 80 2e 40 00    	add    rax,0x402e80
}
  8035e3:	5d                   	pop    rbp
  8035e4:	c3                   	ret    

00000000008035e5 <get_drv>:
driver *get_drv(int drvi)
{
  8035e5:	f3 0f 1e fa          	endbr64 
  8035e9:	55                   	push   rbp
  8035ea:	48 89 e5             	mov    rbp,rsp
  8035ed:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &drvs[drvi];
  8035f0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8035f3:	48 63 d0             	movsxd rdx,eax
  8035f6:	48 89 d0             	mov    rax,rdx
  8035f9:	48 c1 e0 02          	shl    rax,0x2
  8035fd:	48 01 d0             	add    rax,rdx
  803600:	48 c1 e0 05          	shl    rax,0x5
  803604:	48 05 80 58 40 00    	add    rax,0x405880
}
  80360a:	5d                   	pop    rbp
  80360b:	c3                   	ret    

000000000080360c <make_request>:

//发送一个操作设备的申请
int make_request(driver_args* args)
{
  80360c:	f3 0f 1e fa          	endbr64 
  803610:	55                   	push   rbp
  803611:	48 89 e5             	mov    rbp,rsp
  803614:	53                   	push   rbx
  803615:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //在数组中寻找空项
    int i=0;
  803619:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<NR_REQS;i++)
  803620:	eb 23                	jmp    803645 <make_request+0x39>
    {
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  803622:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803625:	48 63 d0             	movsxd rdx,eax
  803628:	48 89 d0             	mov    rax,rdx
  80362b:	48 01 c0             	add    rax,rax
  80362e:	48 01 d0             	add    rax,rdx
  803631:	48 c1 e0 06          	shl    rax,0x6
  803635:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  80363b:	8b 00                	mov    eax,DWORD PTR [rax]
  80363d:	85 c0                	test   eax,eax
  80363f:	74 0c                	je     80364d <make_request+0x41>
    for(;i<NR_REQS;i++)
  803641:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  803645:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  803649:	7e d7                	jle    803622 <make_request+0x16>
  80364b:	eb 01                	jmp    80364e <make_request+0x42>
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  80364d:	90                   	nop
    }
    if(i==NR_REQS)return -1;//满了
  80364e:	83 7d f4 20          	cmp    DWORD PTR [rbp-0xc],0x20
  803652:	75 0a                	jne    80365e <make_request+0x52>
  803654:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803659:	e9 e7 01 00 00       	jmp    803845 <make_request+0x239>
    reqs[i]=*args;//放入数组
  80365e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803661:	48 63 d0             	movsxd rdx,eax
  803664:	48 89 d0             	mov    rax,rdx
  803667:	48 01 c0             	add    rax,rax
  80366a:	48 01 d0             	add    rax,rdx
  80366d:	48 c1 e0 06          	shl    rax,0x6
  803671:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803678:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80367c:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80367f:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  803683:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  803686:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  80368a:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  80368e:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  803692:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  803696:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  80369a:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  80369e:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  8036a2:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  8036a6:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  8036aa:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  8036ae:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  8036b2:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  8036b6:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  8036ba:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  8036be:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  8036c2:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  8036c6:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  8036ca:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  8036ce:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  8036d2:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  8036d6:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  8036da:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  8036de:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  8036e2:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  8036e6:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  8036ea:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  8036ee:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  8036f2:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  8036f6:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  8036fa:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  803701:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  803708:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  80370f:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  803716:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  80371d:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  803724:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  80372b:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  803732:	48 8b 88 a0 00 00 00 	mov    rcx,QWORD PTR [rax+0xa0]
  803739:	48 8b 98 a8 00 00 00 	mov    rbx,QWORD PTR [rax+0xa8]
  803740:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  803747:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  80374e:	48 8b 88 b0 00 00 00 	mov    rcx,QWORD PTR [rax+0xb0]
  803755:	48 8b 98 b8 00 00 00 	mov    rbx,QWORD PTR [rax+0xb8]
  80375c:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  803763:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
    //插入具体设备的等待链表中
    device* dev=&devs[args->dev];
  80376a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80376e:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  803774:	48 63 d0             	movsxd rdx,eax
  803777:	48 89 d0             	mov    rax,rdx
  80377a:	48 c1 e0 02          	shl    rax,0x2
  80377e:	48 01 d0             	add    rax,rdx
  803781:	48 c1 e0 02          	shl    rax,0x2
  803785:	48 01 d0             	add    rax,rdx
  803788:	48 c1 e0 03          	shl    rax,0x3
  80378c:	48 05 80 2e 40 00    	add    rax,0x402e80
  803792:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!dev->waiting_reqs)//空的等待队列
  803796:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80379a:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8037a1:	48 85 c0             	test   rax,rax
  8037a4:	75 27                	jne    8037cd <make_request+0x1c1>
        dev->waiting_reqs=&reqs[i];
  8037a6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8037a9:	48 63 d0             	movsxd rdx,eax
  8037ac:	48 89 d0             	mov    rax,rdx
  8037af:	48 01 c0             	add    rax,rax
  8037b2:	48 01 d0             	add    rax,rdx
  8037b5:	48 c1 e0 06          	shl    rax,0x6
  8037b9:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  8037c0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8037c4:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
  8037cb:	eb 75                	jmp    803842 <make_request+0x236>
    else{
        driver_args* p=dev->waiting_reqs;
  8037cd:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8037d1:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8037d8:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        for(;p->next;p=p->next);
  8037dc:	eb 0f                	jmp    8037ed <make_request+0x1e1>
  8037de:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8037e2:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  8037e9:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  8037ed:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8037f1:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  8037f8:	48 85 c0             	test   rax,rax
  8037fb:	75 e1                	jne    8037de <make_request+0x1d2>
        p->next=&reqs[i];
  8037fd:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803800:	48 63 d0             	movsxd rdx,eax
  803803:	48 89 d0             	mov    rax,rdx
  803806:	48 01 c0             	add    rax,rax
  803809:	48 01 d0             	add    rax,rdx
  80380c:	48 c1 e0 06          	shl    rax,0x6
  803810:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803817:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80381b:	48 89 90 b8 00 00 00 	mov    QWORD PTR [rax+0xb8],rdx
        reqs[i].next=NULL;
  803822:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803825:	48 63 d0             	movsxd rdx,eax
  803828:	48 89 d0             	mov    rax,rdx
  80382b:	48 01 c0             	add    rax,rax
  80382e:	48 01 d0             	add    rax,rdx
  803831:	48 c1 e0 06          	shl    rax,0x6
  803835:	48 05 38 6d 40 00    	add    rax,0x406d38
  80383b:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }

    return i;
  803842:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  803845:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  803849:	c9                   	leave  
  80384a:	c3                   	ret    

000000000080384b <do_req>:
//取出一个申请并且执行
int do_req()
{
  80384b:	f3 0f 1e fa          	endbr64 
  80384f:	55                   	push   rbp
  803850:	48 89 e5             	mov    rbp,rsp
  803853:	48 83 ec 10          	sub    rsp,0x10
    //查看每个设备的请求情况
    //块设备
    for(int i=0;i<3;i++)
  803857:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80385e:	e9 ab 00 00 00       	jmp    80390e <do_req+0xc3>
    {
        device* p=dev_tree[i];
  803863:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803866:	48 98                	cdqe   
  803868:	48 8b 04 c5 80 84 40 	mov    rax,QWORD PTR [rax*8+0x408480]
  80386f:	00 
  803870:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(;p;p=p->next)
  803874:	e9 86 00 00 00       	jmp    8038ff <do_req+0xb4>
        {
            //如果没有请求运行而且有请求要运行
            if(!p->running_req&&p->waiting_reqs)
  803879:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80387d:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  803884:	48 85 c0             	test   rax,rax
  803887:	75 67                	jne    8038f0 <do_req+0xa5>
  803889:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80388d:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803894:	48 85 c0             	test   rax,rax
  803897:	74 57                	je     8038f0 <do_req+0xa5>
            {
                p->running_req=p->waiting_reqs;
  803899:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80389d:	48 8b 90 88 00 00 00 	mov    rdx,QWORD PTR [rax+0x88]
  8038a4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038a8:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
                p->waiting_reqs=p->waiting_reqs->next;//取出一个
  8038af:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038b3:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8038ba:	48 8b 90 b8 00 00 00 	mov    rdx,QWORD PTR [rax+0xb8]
  8038c1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038c5:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
                dev_funcs[p->operi](p->running_req);
  8038cc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038d0:	8b 80 a0 00 00 00    	mov    eax,DWORD PTR [rax+0xa0]
  8038d6:	48 98                	cdqe   
  8038d8:	48 8b 14 c5 a0 ae 80 	mov    rdx,QWORD PTR [rax*8+0x80aea0]
  8038df:	00 
  8038e0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038e4:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  8038eb:	48 89 c7             	mov    rdi,rax
  8038ee:	ff d2                	call   rdx
        for(;p;p=p->next)
  8038f0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038f4:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  8038fb:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  8038ff:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  803904:	0f 85 6f ff ff ff    	jne    803879 <do_req+0x2e>
    for(int i=0;i<3;i++)
  80390a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80390e:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  803912:	0f 8e 4b ff ff ff    	jle    803863 <do_req+0x18>
            }
            //如果还在运行（DONE的状态不能直接覆盖，因为里面的运行结果可能还没被拿走）
        }
    }
    
    return 0;
  803918:	b8 00 00 00 00       	mov    eax,0x0
}
  80391d:	c9                   	leave  
  80391e:	c3                   	ret    

000000000080391f <wait_on_req>:


void wait_on_req(int reqi)
{
  80391f:	f3 0f 1e fa          	endbr64 
  803923:	55                   	push   rbp
  803924:	48 89 e5             	mov    rbp,rsp
  803927:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(reqs[reqi].stat!=REQ_STAT_DONE);
  80392a:	90                   	nop
  80392b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80392e:	48 63 d0             	movsxd rdx,eax
  803931:	48 89 d0             	mov    rax,rdx
  803934:	48 01 c0             	add    rax,rax
  803937:	48 01 d0             	add    rax,rdx
  80393a:	48 c1 e0 06          	shl    rax,0x6
  80393e:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803944:	8b 00                	mov    eax,DWORD PTR [rax]
  803946:	83 f8 03             	cmp    eax,0x3
  803949:	75 e0                	jne    80392b <wait_on_req+0xc>
}
  80394b:	90                   	nop
  80394c:	90                   	nop
  80394d:	5d                   	pop    rbp
  80394e:	c3                   	ret    

000000000080394f <clear_req>:
void clear_req(int reqi)
{
  80394f:	f3 0f 1e fa          	endbr64 
  803953:	55                   	push   rbp
  803954:	48 89 e5             	mov    rbp,rsp
  803957:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    reqs[reqi].stat=REQ_STAT_EMPTY;
  80395a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80395d:	48 63 d0             	movsxd rdx,eax
  803960:	48 89 d0             	mov    rax,rdx
  803963:	48 01 c0             	add    rax,rax
  803966:	48 01 d0             	add    rax,rdx
  803969:	48 c1 e0 06          	shl    rax,0x6
  80396d:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803973:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  803979:	90                   	nop
  80397a:	5d                   	pop    rbp
  80397b:	c3                   	ret    

000000000080397c <init_proc>:
TSS scene_saver;
TSS *tss=0x108000;
int cur_proc=0;
int pidd=0;
int palloc_paddr=0;
void init_proc(){
  80397c:	f3 0f 1e fa          	endbr64 
  803980:	55                   	push   rbp
  803981:	48 89 e5             	mov    rbp,rsp
  803984:	48 83 ec 10          	sub    rsp,0x10
    //task=(struct process*)get_global_var(TASK_PCBS_ADDR);//[MAX_TASKS];;
    for(int i=0;i<MAX_PROC_COUNT;i++){
  803988:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80398f:	eb 61                	jmp    8039f2 <init_proc+0x76>
        task[i].pid=-1;
  803991:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803994:	48 63 d0             	movsxd rdx,eax
  803997:	48 89 d0             	mov    rax,rdx
  80399a:	48 01 c0             	add    rax,rax
  80399d:	48 01 d0             	add    rax,rdx
  8039a0:	48 c1 e0 08          	shl    rax,0x8
  8039a4:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8039aa:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
        task[i].stat=ENDED;
  8039b0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039b3:	48 63 d0             	movsxd rdx,eax
  8039b6:	48 89 d0             	mov    rax,rdx
  8039b9:	48 01 c0             	add    rax,rax
  8039bc:	48 01 d0             	add    rax,rdx
  8039bf:	48 c1 e0 08          	shl    rax,0x8
  8039c3:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8039c9:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
        task[i].parent_pid=-1;
  8039cf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039d2:	48 63 d0             	movsxd rdx,eax
  8039d5:	48 89 d0             	mov    rax,rdx
  8039d8:	48 01 c0             	add    rax,rax
  8039db:	48 01 d0             	add    rax,rdx
  8039de:	48 c1 e0 08          	shl    rax,0x8
  8039e2:	48 05 28 85 40 00    	add    rax,0x408528
  8039e8:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<MAX_PROC_COUNT;i++){
  8039ee:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8039f2:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8039f6:	7e 99                	jle    803991 <init_proc+0x15>
    }
    cur_proc=0;//no proc
  8039f8:	c7 05 0a 0b c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc10b0a],0x0        # 41450c <cur_proc>
  8039ff:	00 00 00 
    pidd=1;
  803a02:	c7 05 04 0b c1 ff 01 	mov    DWORD PTR [rip+0xffffffffffc10b04],0x1        # 414510 <pidd>
  803a09:	00 00 00 
     //创建0号进程
    int zi=create_proc();
  803a0c:	b8 00 00 00 00       	mov    eax,0x0
  803a11:	e8 38 02 00 00       	call   803c4e <create_proc>
  803a16:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    task[zi].stat=READY;
  803a19:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803a1c:	48 63 d0             	movsxd rdx,eax
  803a1f:	48 89 d0             	mov    rax,rdx
  803a22:	48 01 c0             	add    rax,rax
  803a25:	48 01 d0             	add    rax,rdx
  803a28:	48 c1 e0 08          	shl    rax,0x8
  803a2c:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803a32:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int xi= _LDT_IND(zi)*8;
  803a38:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803a3b:	83 c0 03             	add    eax,0x3
  803a3e:	c1 e0 04             	shl    eax,0x4
  803a41:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    zi=_TSS_IND(zi)*8;
  803a44:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803a47:	01 c0                	add    eax,eax
  803a49:	83 c0 05             	add    eax,0x5
  803a4c:	c1 e0 03             	shl    eax,0x3
  803a4f:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //asm volatile("lldt %0"::"m"(xi));
    //asm volatile("ltr %0"::"m"(zi));
    //把内核代码段选择子写到MSR寄存器中准备用于特权级转换(sysexit，现在没用)
    wrmsr(0x174,0x8);
  803a52:	be 08 00 00 00       	mov    esi,0x8
  803a57:	bf 74 01 00 00       	mov    edi,0x174
  803a5c:	e8 79 cd ff ff       	call   8007da <wrmsr>
    //准备用于特权级转换(sysret，正在使用)
    wrmsr(0xc0000081,0x0020000800000000ul);
  803a61:	48 b8 00 00 00 00 08 	movabs rax,0x20000800000000
  803a68:	00 20 00 
  803a6b:	48 89 c6             	mov    rsi,rax
  803a6e:	b8 81 00 00 c0       	mov    eax,0xc0000081
  803a73:	48 89 c7             	mov    rdi,rax
  803a76:	e8 5f cd ff ff       	call   8007da <wrmsr>
    //创建一个测试进程
    create_test_proc();
  803a7b:	b8 00 00 00 00       	mov    eax,0x0
  803a80:	e8 03 00 00 00       	call   803a88 <create_test_proc>
}
  803a85:	90                   	nop
  803a86:	c9                   	leave  
  803a87:	c3                   	ret    

0000000000803a88 <create_test_proc>:
void create_test_proc(){
  803a88:	f3 0f 1e fa          	endbr64 
  803a8c:	55                   	push   rbp
  803a8d:	48 89 e5             	mov    rbp,rsp
  803a90:	48 83 ec 20          	sub    rsp,0x20

    int index=req_proc();
  803a94:	b8 00 00 00 00       	mov    eax,0x0
  803a99:	e8 33 02 00 00       	call   803cd1 <req_proc>
  803a9e:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    task[index].stat=READY;
  803aa1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803aa4:	48 63 d0             	movsxd rdx,eax
  803aa7:	48 89 d0             	mov    rax,rdx
  803aaa:	48 01 c0             	add    rax,rax
  803aad:	48 01 d0             	add    rax,rdx
  803ab0:	48 c1 e0 08          	shl    rax,0x8
  803ab4:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803aba:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int currsp=0x9fc00-1;
  803ac0:	c7 45 ec ff fb 09 00 	mov    DWORD PTR [rbp-0x14],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  803ac7:	48 89 65 ec          	mov    QWORD PTR [rbp-0x14],rsp
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  803acb:	ba 22 ae 80 00       	mov    edx,0x80ae22
  803ad0:	48 83 ec 08          	sub    rsp,0x8
  803ad4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803ad7:	50                   	push   rax
  803ad8:	6a 00                	push   0x0
  803ada:	52                   	push   rdx
  803adb:	6a 00                	push   0x0
  803add:	6a 00                	push   0x0
  803adf:	6a 00                	push   0x0
  803ae1:	68 58 7d 00 00       	push   0x7d58
  803ae6:	6a 10                	push   0x10
  803ae8:	6a 10                	push   0x10
  803aea:	6a 10                	push   0x10
  803aec:	6a 10                	push   0x10
  803aee:	41 b9 08 00 00 00    	mov    r9d,0x8
  803af4:	41 b8 10 00 00 00    	mov    r8d,0x10
  803afa:	b9 00 00 00 00       	mov    ecx,0x0
  803aff:	ba 00 00 00 00       	mov    edx,0x0
  803b04:	be 00 00 00 00       	mov    esi,0x0
  803b09:	bf 00 00 00 00       	mov    edi,0x0
  803b0e:	e8 b7 02 00 00       	call   803dca <set_proc>
  803b13:	48 83 c4 60          	add    rsp,0x60
             0x7e00- sizeof(stack_store_regs), 0, 0, 0, (long)ret_sys_call, 0, index);
    task[index].tss.rsp0=0x400000;
  803b17:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803b1a:	48 63 d0             	movsxd rdx,eax
  803b1d:	48 89 d0             	mov    rax,rdx
  803b20:	48 01 c0             	add    rax,rax
  803b23:	48 01 d0             	add    rax,rdx
  803b26:	48 c1 e0 08          	shl    rax,0x8
  803b2a:	48 05 68 86 40 00    	add    rax,0x408668
  803b30:	48 c7 00 00 00 40 00 	mov    QWORD PTR [rax],0x400000
    //把还原现场时用到的堆栈设置好
    stack_store_regs *str= (stack_store_regs *) (0x7e00 - sizeof(stack_store_regs));
  803b37:	48 c7 45 f0 58 7d 00 	mov    QWORD PTR [rbp-0x10],0x7d58
  803b3e:	00 
    str->rax=0;
  803b3f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b43:	48 c7 40 78 00 00 00 	mov    QWORD PTR [rax+0x78],0x0
  803b4a:	00 
    str->rbx=0;
  803b4b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b4f:	48 c7 40 70 00 00 00 	mov    QWORD PTR [rax+0x70],0x0
  803b56:	00 
    str->rcx=proc_zero;//sysret采用的返回地址
  803b57:	ba 36 3f 80 00       	mov    edx,0x803f36
  803b5c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b60:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    str->rdx=0;
  803b64:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b68:	48 c7 40 60 00 00 00 	mov    QWORD PTR [rax+0x60],0x0
  803b6f:	00 
    str->rsi=0;
  803b70:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b74:	48 c7 40 50 00 00 00 	mov    QWORD PTR [rax+0x50],0x0
  803b7b:	00 
    str->rdi=0;
  803b7c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b80:	48 c7 40 58 00 00 00 	mov    QWORD PTR [rax+0x58],0x0
  803b87:	00 
    str->r15=0;
  803b88:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b8c:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  803b93:	00 
    str->r14=0;
  803b94:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b98:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  803b9f:	00 
    str->r13=0;
  803ba0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803ba4:	48 c7 40 20 00 00 00 	mov    QWORD PTR [rax+0x20],0x0
  803bab:	00 
    str->r12=0;
  803bac:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bb0:	48 c7 40 28 00 00 00 	mov    QWORD PTR [rax+0x28],0x0
  803bb7:	00 
    str->r11=0;
  803bb8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bbc:	48 c7 40 30 00 00 00 	mov    QWORD PTR [rax+0x30],0x0
  803bc3:	00 
    str->r10=0;
  803bc4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bc8:	48 c7 40 38 00 00 00 	mov    QWORD PTR [rax+0x38],0x0
  803bcf:	00 
    str->r9=0;
  803bd0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bd4:	48 c7 40 40 00 00 00 	mov    QWORD PTR [rax+0x40],0x0
  803bdb:	00 
    str->r8=0;
  803bdc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803be0:	48 c7 40 48 00 00 00 	mov    QWORD PTR [rax+0x48],0x0
  803be7:	00 
    str->rip=proc_zero;
  803be8:	ba 36 3f 80 00       	mov    edx,0x803f36
  803bed:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bf1:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
    str->cs=0x8;
  803bf8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bfc:	48 c7 80 88 00 00 00 	mov    QWORD PTR [rax+0x88],0x8
  803c03:	08 00 00 00 
    str->rflags=0x00200006;
  803c07:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c0b:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x200006
  803c12:	06 00 20 00 
    str->rsp=0x7e00;
  803c16:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c1a:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x7e00
  803c21:	00 7e 00 00 
    str->ss=0x2b;
  803c25:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c29:	48 c7 80 a0 00 00 00 	mov    QWORD PTR [rax+0xa0],0x2b
  803c30:	2b 00 00 00 
    str->ds=0x2b;
  803c34:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c38:	48 c7 00 2b 00 00 00 	mov    QWORD PTR [rax],0x2b
    str->es=0x2b;
  803c3f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c43:	48 c7 40 08 2b 00 00 	mov    QWORD PTR [rax+0x8],0x2b
  803c4a:	00 

}
  803c4b:	90                   	nop
  803c4c:	c9                   	leave  
  803c4d:	c3                   	ret    

0000000000803c4e <create_proc>:
int create_proc()
{
  803c4e:	f3 0f 1e fa          	endbr64 
  803c52:	55                   	push   rbp
  803c53:	48 89 e5             	mov    rbp,rsp
  803c56:	48 83 ec 10          	sub    rsp,0x10
    int index=req_proc();
  803c5a:	b8 00 00 00 00       	mov    eax,0x0
  803c5f:	e8 6d 00 00 00       	call   803cd1 <req_proc>
  803c64:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(index==-1)return -1;
  803c67:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  803c6b:	75 07                	jne    803c74 <create_proc+0x26>
  803c6d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803c72:	eb 5b                	jmp    803ccf <create_proc+0x81>
    int currsp=0x9fc00-1;
  803c74:	c7 45 f8 ff fb 09 00 	mov    DWORD PTR [rbp-0x8],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  803c7b:	48 89 65 f8          	mov    QWORD PTR [rbp-0x8],rsp
    //默认DPL=3
    //set_proc(0,0,0,0,0x23,0x1b,0x23,0x23,0x23,0x23,curesp,0,0,0,0,index);
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  803c7f:	b9 36 3f 80 00       	mov    ecx,0x803f36
  803c84:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803c87:	48 98                	cdqe   
  803c89:	48 83 ec 08          	sub    rsp,0x8
  803c8d:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  803c90:	52                   	push   rdx
  803c91:	6a 00                	push   0x0
  803c93:	51                   	push   rcx
  803c94:	6a 00                	push   0x0
  803c96:	6a 00                	push   0x0
  803c98:	6a 00                	push   0x0
  803c9a:	50                   	push   rax
  803c9b:	6a 10                	push   0x10
  803c9d:	6a 10                	push   0x10
  803c9f:	6a 10                	push   0x10
  803ca1:	6a 10                	push   0x10
  803ca3:	41 b9 08 00 00 00    	mov    r9d,0x8
  803ca9:	41 b8 10 00 00 00    	mov    r8d,0x10
  803caf:	b9 00 00 00 00       	mov    ecx,0x0
  803cb4:	ba 00 00 00 00       	mov    edx,0x0
  803cb9:	be 00 00 00 00       	mov    esi,0x0
  803cbe:	bf 00 00 00 00       	mov    edi,0x0
  803cc3:	e8 02 01 00 00       	call   803dca <set_proc>
  803cc8:	48 83 c4 60          	add    rsp,0x60
             currsp, 0, 0, 0, (long)proc_zero, 0, index);
//    task[index].tss.eip=(long)proc_zero;

    return index;
  803ccc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803ccf:	c9                   	leave  
  803cd0:	c3                   	ret    

0000000000803cd1 <req_proc>:
int req_proc(){
  803cd1:	f3 0f 1e fa          	endbr64 
  803cd5:	55                   	push   rbp
  803cd6:	48 89 e5             	mov    rbp,rsp
    int num=0;
  803cd9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803ce0:	eb 04                	jmp    803ce6 <req_proc+0x15>
    num<=MAX_PROC_COUNT){
        num++;
  803ce2:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803ce6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803ce9:	48 63 d0             	movsxd rdx,eax
  803cec:	48 89 d0             	mov    rax,rdx
  803cef:	48 01 c0             	add    rax,rax
  803cf2:	48 01 d0             	add    rax,rdx
  803cf5:	48 c1 e0 08          	shl    rax,0x8
  803cf9:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803cff:	8b 00                	mov    eax,DWORD PTR [rax]
  803d01:	83 f8 ff             	cmp    eax,0xffffffff
  803d04:	74 26                	je     803d2c <req_proc+0x5b>
  803d06:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d09:	48 63 d0             	movsxd rdx,eax
  803d0c:	48 89 d0             	mov    rax,rdx
  803d0f:	48 01 c0             	add    rax,rax
  803d12:	48 01 d0             	add    rax,rdx
  803d15:	48 c1 e0 08          	shl    rax,0x8
  803d19:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803d1f:	8b 00                	mov    eax,DWORD PTR [rax]
  803d21:	83 f8 03             	cmp    eax,0x3
  803d24:	74 06                	je     803d2c <req_proc+0x5b>
  803d26:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  803d2a:	7e b6                	jle    803ce2 <req_proc+0x11>
    }
    if(num>=MAX_PROC_COUNT)
  803d2c:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803d30:	7e 0a                	jle    803d3c <req_proc+0x6b>
        return -1;
  803d32:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803d37:	e9 8c 00 00 00       	jmp    803dc8 <req_proc+0xf7>
    task[num].pid=pidd++;
  803d3c:	8b 05 ce 07 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc107ce]        # 414510 <pidd>
  803d42:	8d 50 01             	lea    edx,[rax+0x1]
  803d45:	89 15 c5 07 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc107c5],edx        # 414510 <pidd>
  803d4b:	89 c1                	mov    ecx,eax
  803d4d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d50:	48 63 d0             	movsxd rdx,eax
  803d53:	48 89 d0             	mov    rax,rdx
  803d56:	48 01 c0             	add    rax,rax
  803d59:	48 01 d0             	add    rax,rdx
  803d5c:	48 c1 e0 08          	shl    rax,0x8
  803d60:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803d66:	89 08                	mov    DWORD PTR [rax],ecx
    task[num].stat=ENDED;
  803d68:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d6b:	48 63 d0             	movsxd rdx,eax
  803d6e:	48 89 d0             	mov    rax,rdx
  803d71:	48 01 c0             	add    rax,rax
  803d74:	48 01 d0             	add    rax,rdx
  803d77:	48 c1 e0 08          	shl    rax,0x8
  803d7b:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803d81:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[num].utime=0;
  803d87:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d8a:	48 63 d0             	movsxd rdx,eax
  803d8d:	48 89 d0             	mov    rax,rdx
  803d90:	48 01 c0             	add    rax,rax
  803d93:	48 01 d0             	add    rax,rdx
  803d96:	48 c1 e0 08          	shl    rax,0x8
  803d9a:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803da0:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[num].priority=0;
  803da6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803da9:	48 63 d0             	movsxd rdx,eax
  803dac:	48 89 d0             	mov    rax,rdx
  803daf:	48 01 c0             	add    rax,rax
  803db2:	48 01 d0             	add    rax,rdx
  803db5:	48 c1 e0 08          	shl    rax,0x8
  803db9:	48 05 ac 84 40 00    	add    rax,0x4084ac
  803dbf:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return num;
  803dc5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803dc8:	5d                   	pop    rbp
  803dc9:	c3                   	ret    

0000000000803dca <set_proc>:
void set_proc(long eax, long ebx, long ecx, long edx, long es, long cs, long ss, long ds, long fs, long gs, long esp,
              long ebp, long esi, long edi, long rip, long eflags, int proc_nr) {
  803dca:	f3 0f 1e fa          	endbr64 
  803dce:	55                   	push   rbp
  803dcf:	48 89 e5             	mov    rbp,rsp
  803dd2:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  803dd6:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  803dda:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  803dde:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  803de2:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
  803de6:	4c 89 4d c0          	mov    QWORD PTR [rbp-0x40],r9
    struct process* proc=&task[proc_nr];
  803dea:	8b 45 60             	mov    eax,DWORD PTR [rbp+0x60]
  803ded:	48 63 d0             	movsxd rdx,eax
  803df0:	48 89 d0             	mov    rax,rdx
  803df3:	48 01 c0             	add    rax,rax
  803df6:	48 01 d0             	add    rax,rdx
  803df9:	48 c1 e0 08          	shl    rax,0x8
  803dfd:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803e03:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    proc->regs.rax=eax;
  803e07:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e0b:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  803e0f:	48 89 90 48 02 00 00 	mov    QWORD PTR [rax+0x248],rdx
    proc->regs.rbx=ebx;
  803e16:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e1a:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  803e1e:	48 89 90 60 02 00 00 	mov    QWORD PTR [rax+0x260],rdx
    proc->regs.rcx=ecx;
  803e25:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e29:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  803e2d:	48 89 90 50 02 00 00 	mov    QWORD PTR [rax+0x250],rdx
    proc->regs.rdx=edx;
  803e34:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e38:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  803e3c:	48 89 90 58 02 00 00 	mov    QWORD PTR [rax+0x258],rdx
    proc->regs.es=es;
  803e43:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e47:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803e4b:	48 89 90 88 02 00 00 	mov    QWORD PTR [rax+0x288],rdx
    proc->regs.cs=cs;
  803e52:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e56:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803e5a:	48 89 90 90 02 00 00 	mov    QWORD PTR [rax+0x290],rdx
    proc->regs.ss=ss;
  803e61:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e65:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803e69:	48 89 90 98 02 00 00 	mov    QWORD PTR [rax+0x298],rdx
    proc->regs.ds=ds;
  803e70:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e74:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803e78:	48 89 90 a0 02 00 00 	mov    QWORD PTR [rax+0x2a0],rdx
    proc->regs.fs=fs;
  803e7f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e83:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  803e87:	48 89 90 a8 02 00 00 	mov    QWORD PTR [rax+0x2a8],rdx
    proc->regs.gs=gs;
  803e8e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e92:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  803e96:	48 89 90 b0 02 00 00 	mov    QWORD PTR [rax+0x2b0],rdx
    proc->regs.rsp=esp;
  803e9d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ea1:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803ea5:	48 89 90 68 02 00 00 	mov    QWORD PTR [rax+0x268],rdx
    proc->regs.rbp=ebp;
  803eac:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803eb0:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
  803eb4:	48 89 90 70 02 00 00 	mov    QWORD PTR [rax+0x270],rdx
    proc->regs.rsi=esi;
  803ebb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ebf:	48 8b 55 40          	mov    rdx,QWORD PTR [rbp+0x40]
  803ec3:	48 89 90 78 02 00 00 	mov    QWORD PTR [rax+0x278],rdx
    proc->regs.rdi=edi;
  803eca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ece:	48 8b 55 48          	mov    rdx,QWORD PTR [rbp+0x48]
  803ed2:	48 89 90 80 02 00 00 	mov    QWORD PTR [rax+0x280],rdx
    proc->regs.rflags=0x202;//设置为默认值:0b 0010 0000 0010
  803ed9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803edd:	48 c7 80 40 02 00 00 	mov    QWORD PTR [rax+0x240],0x202
  803ee4:	02 02 00 00 
    //能接受中断
    proc->regs.rip=rip;
  803ee8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803eec:	48 8b 55 50          	mov    rdx,QWORD PTR [rbp+0x50]
  803ef0:	48 89 90 38 02 00 00 	mov    QWORD PTR [rax+0x238],rdx

    proc->regs.cs=cs;
  803ef7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803efb:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803eff:	48 89 90 90 02 00 00 	mov    QWORD PTR [rax+0x290],rdx
    proc->regs.ds=ds;
  803f06:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f0a:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803f0e:	48 89 90 a0 02 00 00 	mov    QWORD PTR [rax+0x2a0],rdx
    proc->regs.es=es;
  803f15:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f19:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803f1d:	48 89 90 88 02 00 00 	mov    QWORD PTR [rax+0x288],rdx
    proc->regs.cr3=PML4_ADDR;//get_phyaddr(n1);//暂时先搞成全局
  803f24:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f28:	48 c7 80 30 02 00 00 	mov    QWORD PTR [rax+0x230],0x101000
  803f2f:	00 10 10 00 


}
  803f33:	90                   	nop
  803f34:	5d                   	pop    rbp
  803f35:	c3                   	ret    

0000000000803f36 <proc_zero>:
void proc_zero()
{
  803f36:	f3 0f 1e fa          	endbr64 
  803f3a:	55                   	push   rbp
  803f3b:	48 89 e5             	mov    rbp,rsp
    asm volatile("mov $1,%rax\n"
  803f3e:	48 c7 c0 01 00 00 00 	mov    rax,0x1
  803f45:	48 0f 05             	rex.W syscall 
                 ".byte 0x48\n"
                 "syscall");
    while(1);
  803f48:	eb fe                	jmp    803f48 <proc_zero+0x12>

0000000000803f4a <manage_proc>:
}
void manage_proc(){
  803f4a:	f3 0f 1e fa          	endbr64 
  803f4e:	55                   	push   rbp
  803f4f:	48 89 e5             	mov    rbp,rsp
  803f52:	48 83 ec 10          	sub    rsp,0x10
    if(cur_proc!=-1)
  803f56:	8b 05 b0 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc105b0]        # 41450c <cur_proc>
  803f5c:	83 f8 ff             	cmp    eax,0xffffffff
  803f5f:	74 39                	je     803f9a <manage_proc+0x50>
        task[cur_proc].utime++;
  803f61:	8b 15 a5 05 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc105a5]        # 41450c <cur_proc>
  803f67:	48 63 ca             	movsxd rcx,edx
  803f6a:	48 89 c8             	mov    rax,rcx
  803f6d:	48 01 c0             	add    rax,rax
  803f70:	48 01 c8             	add    rax,rcx
  803f73:	48 c1 e0 08          	shl    rax,0x8
  803f77:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803f7d:	8b 00                	mov    eax,DWORD PTR [rax]
  803f7f:	8d 48 01             	lea    ecx,[rax+0x1]
  803f82:	48 63 d2             	movsxd rdx,edx
  803f85:	48 89 d0             	mov    rax,rdx
  803f88:	48 01 c0             	add    rax,rax
  803f8b:	48 01 d0             	add    rax,rdx
  803f8e:	48 c1 e0 08          	shl    rax,0x8
  803f92:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803f98:	89 08                	mov    DWORD PTR [rax],ecx
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803f9a:	8b 05 6c 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1056c]        # 41450c <cur_proc>
  803fa0:	83 f8 ff             	cmp    eax,0xffffffff
  803fa3:	74 4a                	je     803fef <manage_proc+0xa5>
  803fa5:	8b 05 61 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10561]        # 41450c <cur_proc>
  803fab:	48 63 d0             	movsxd rdx,eax
  803fae:	48 89 d0             	mov    rax,rdx
  803fb1:	48 01 c0             	add    rax,rax
  803fb4:	48 01 d0             	add    rax,rdx
  803fb7:	48 c1 e0 08          	shl    rax,0x8
  803fbb:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803fc1:	8b 00                	mov    eax,DWORD PTR [rax]
  803fc3:	83 f8 01             	cmp    eax,0x1
  803fc6:	77 27                	ja     803fef <manage_proc+0xa5>
    task[cur_proc].stat!=READY){
  803fc8:	8b 05 3e 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1053e]        # 41450c <cur_proc>
  803fce:	48 63 d0             	movsxd rdx,eax
  803fd1:	48 89 d0             	mov    rax,rdx
  803fd4:	48 01 c0             	add    rax,rax
  803fd7:	48 01 d0             	add    rax,rdx
  803fda:	48 c1 e0 08          	shl    rax,0x8
  803fde:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803fe4:	8b 00                	mov    eax,DWORD PTR [rax]
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803fe6:	83 f8 01             	cmp    eax,0x1
  803fe9:	0f 84 21 01 00 00    	je     804110 <manage_proc+0x1c6>
        if(cur_proc!=-1)
  803fef:	8b 05 17 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10517]        # 41450c <cur_proc>
  803ff5:	83 f8 ff             	cmp    eax,0xffffffff
  803ff8:	74 22                	je     80401c <manage_proc+0xd2>
            task[cur_proc].utime=0;
  803ffa:	8b 05 0c 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1050c]        # 41450c <cur_proc>
  804000:	48 63 d0             	movsxd rdx,eax
  804003:	48 89 d0             	mov    rax,rdx
  804006:	48 01 c0             	add    rax,rax
  804009:	48 01 d0             	add    rax,rdx
  80400c:	48 c1 e0 08          	shl    rax,0x8
  804010:	48 05 a8 84 40 00    	add    rax,0x4084a8
  804016:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        //find
        int i=0;
  80401c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        for(i=0;i<MAX_PROC_COUNT;i++){
  804023:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80402a:	eb 4f                	jmp    80407b <manage_proc+0x131>
            if(task[i].pid!=-1&&task[i].stat==READY&&i!=cur_proc){
  80402c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80402f:	48 63 d0             	movsxd rdx,eax
  804032:	48 89 d0             	mov    rax,rdx
  804035:	48 01 c0             	add    rax,rax
  804038:	48 01 d0             	add    rax,rdx
  80403b:	48 c1 e0 08          	shl    rax,0x8
  80403f:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804045:	8b 00                	mov    eax,DWORD PTR [rax]
  804047:	83 f8 ff             	cmp    eax,0xffffffff
  80404a:	74 2b                	je     804077 <manage_proc+0x12d>
  80404c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80404f:	48 63 d0             	movsxd rdx,eax
  804052:	48 89 d0             	mov    rax,rdx
  804055:	48 01 c0             	add    rax,rax
  804058:	48 01 d0             	add    rax,rdx
  80405b:	48 c1 e0 08          	shl    rax,0x8
  80405f:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804065:	8b 00                	mov    eax,DWORD PTR [rax]
  804067:	83 f8 01             	cmp    eax,0x1
  80406a:	75 0b                	jne    804077 <manage_proc+0x12d>
  80406c:	8b 05 9a 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1049a]        # 41450c <cur_proc>
  804072:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  804075:	75 0c                	jne    804083 <manage_proc+0x139>
        for(i=0;i<MAX_PROC_COUNT;i++){
  804077:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80407b:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  80407f:	7e ab                	jle    80402c <manage_proc+0xe2>
  804081:	eb 01                	jmp    804084 <manage_proc+0x13a>
                break;
  804083:	90                   	nop
            }
        }
        if(i>=MAX_PROC_COUNT)
  804084:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  804088:	0f 8f 85 00 00 00    	jg     804113 <manage_proc+0x1c9>
            return;
        //switch
        task[cur_proc].stat=READY;
  80408e:	8b 05 78 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10478]        # 41450c <cur_proc>
  804094:	48 63 d0             	movsxd rdx,eax
  804097:	48 89 d0             	mov    rax,rdx
  80409a:	48 01 c0             	add    rax,rax
  80409d:	48 01 d0             	add    rax,rdx
  8040a0:	48 c1 e0 08          	shl    rax,0x8
  8040a4:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8040aa:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        task[i].stat=RUNNING;
  8040b0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8040b3:	48 63 d0             	movsxd rdx,eax
  8040b6:	48 89 d0             	mov    rax,rdx
  8040b9:	48 01 c0             	add    rax,rax
  8040bc:	48 01 d0             	add    rax,rdx
  8040bf:	48 c1 e0 08          	shl    rax,0x8
  8040c3:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8040c9:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        switch_to(&task[cur_proc], &task[i]);
  8040cf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8040d2:	48 63 d0             	movsxd rdx,eax
  8040d5:	48 89 d0             	mov    rax,rdx
  8040d8:	48 01 c0             	add    rax,rax
  8040db:	48 01 d0             	add    rax,rdx
  8040de:	48 c1 e0 08          	shl    rax,0x8
  8040e2:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  8040e9:	8b 05 1d 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1041d]        # 41450c <cur_proc>
  8040ef:	48 63 c8             	movsxd rcx,eax
  8040f2:	48 89 c8             	mov    rax,rcx
  8040f5:	48 01 c0             	add    rax,rax
  8040f8:	48 01 c8             	add    rax,rcx
  8040fb:	48 c1 e0 08          	shl    rax,0x8
  8040ff:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804105:	48 89 d6             	mov    rsi,rdx
  804108:	48 89 c7             	mov    rdi,rax
  80410b:	e8 fd 0a 00 00       	call   804c0d <switch_to>
    }
    return;
  804110:	90                   	nop
  804111:	eb 01                	jmp    804114 <manage_proc+0x1ca>
            return;
  804113:	90                   	nop
}
  804114:	c9                   	leave  
  804115:	c3                   	ret    

0000000000804116 <switch_proc_tss>:

void switch_proc_tss(int pnr)
{
  804116:	f3 0f 1e fa          	endbr64 
  80411a:	55                   	push   rbp
  80411b:	48 89 e5             	mov    rbp,rsp
  80411e:	48 83 ec 20          	sub    rsp,0x20
  804122:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int sel=_TSS_IND(pnr)*8;
  804125:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804128:	01 c0                	add    eax,eax
  80412a:	83 c0 05             	add    eax,0x5
  80412d:	c1 e0 03             	shl    eax,0x3
  804130:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    cur_proc=pnr;
  804133:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804136:	89 05 d0 03 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc103d0],eax        # 41450c <cur_proc>
    switch_proc_asm(sel);
  80413c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80413f:	89 c7                	mov    edi,eax
  804141:	e8 f4 6b 00 00       	call   80ad3a <switch_proc_asm>
}
  804146:	90                   	nop
  804147:	c9                   	leave  
  804148:	c3                   	ret    

0000000000804149 <switch_proc>:
void switch_proc(int pnr){
  804149:	f3 0f 1e fa          	endbr64 
  80414d:	55                   	push   rbp
  80414e:	48 89 e5             	mov    rbp,rsp
  804151:	48 81 ec 20 03 00 00 	sub    rsp,0x320
  804158:	89 bd ec fc ff ff    	mov    DWORD PTR [rbp-0x314],edi
    //printf("switching proc to %d\n",pnr);
    //printf("eip:%x\n",task[pnr].tss.eip);
    struct process p=task[pnr];
  80415e:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  804164:	48 63 d0             	movsxd rdx,eax
  804167:	48 89 d0             	mov    rax,rdx
  80416a:	48 01 c0             	add    rax,rax
  80416d:	48 01 d0             	add    rax,rdx
  804170:	48 c1 e0 08          	shl    rax,0x8
  804174:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  80417b:	48 8d 85 f0 fc ff ff 	lea    rax,[rbp-0x310]
  804182:	48 89 d6             	mov    rsi,rdx
  804185:	ba 60 00 00 00       	mov    edx,0x60
  80418a:	48 89 c7             	mov    rdi,rax
  80418d:	48 89 d1             	mov    rcx,rdx
  804190:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
    save_context(&task[cur_proc].tss);
  804193:	8b 05 73 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10373]        # 41450c <cur_proc>
  804199:	48 63 d0             	movsxd rdx,eax
  80419c:	48 89 d0             	mov    rax,rdx
  80419f:	48 01 c0             	add    rax,rax
  8041a2:	48 01 d0             	add    rax,rdx
  8041a5:	48 c1 e0 08          	shl    rax,0x8
  8041a9:	48 05 c0 01 00 00    	add    rax,0x1c0
  8041af:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8041b5:	48 83 c0 04          	add    rax,0x4
  8041b9:	48 89 c7             	mov    rdi,rax
  8041bc:	e8 53 00 00 00       	call   804214 <save_context>
//    //重新设置0号进程
//    task[0].tss.eip=proc_zero;
//    task[0].tss.cr3=PAGE_INDEX_ADDR;
//    task[0].tss.eflags=0x202;
    cur_proc=pnr;
  8041c1:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  8041c7:	89 05 3f 03 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1033f],eax        # 41450c <cur_proc>
    int sel=_TSS_IND(pnr)*8;
  8041cd:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  8041d3:	01 c0                	add    eax,eax
  8041d5:	83 c0 05             	add    eax,0x5
  8041d8:	c1 e0 03             	shl    eax,0x3
  8041db:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    switch_to(NULL, &task[pnr].tss);
  8041de:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  8041e4:	48 63 d0             	movsxd rdx,eax
  8041e7:	48 89 d0             	mov    rax,rdx
  8041ea:	48 01 c0             	add    rax,rax
  8041ed:	48 01 d0             	add    rax,rdx
  8041f0:	48 c1 e0 08          	shl    rax,0x8
  8041f4:	48 05 c0 01 00 00    	add    rax,0x1c0
  8041fa:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804200:	48 83 c0 04          	add    rax,0x4
  804204:	48 89 c6             	mov    rsi,rax
  804207:	bf 00 00 00 00       	mov    edi,0x0
  80420c:	e8 fc 09 00 00       	call   804c0d <switch_to>
    //asm volatile("push %0":"=r"(task[pnr].tss.eip));
    //switch_proc_asm(pnr*8+0x8*3);
}
  804211:	90                   	nop
  804212:	c9                   	leave  
  804213:	c3                   	ret    

0000000000804214 <save_context>:
void save_context(TSS *tss)
{
  804214:	f3 0f 1e fa          	endbr64 
  804218:	55                   	push   rbp
  804219:	48 89 e5             	mov    rbp,rsp
  80421c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//    tss->esi=scene_saver.esi;
//    tss->edi=scene_saver.edi;
//    tss->eflags=scene_saver.eflags;
//    tss->esp=scene_saver.esp;
//    tss->ebp=scene_saver.ebp;
}
  804220:	90                   	nop
  804221:	5d                   	pop    rbp
  804222:	c3                   	ret    

0000000000804223 <palloc>:
    task[index].stat=READY;
    return index;
} */
//为指定进程申请新的内存，并返回这块内存的线性地址。
void* palloc(int proc_index,int size)
{
  804223:	f3 0f 1e fa          	endbr64 
  804227:	55                   	push   rbp
  804228:	48 89 e5             	mov    rbp,rsp
  80422b:	48 83 ec 60          	sub    rsp,0x60
  80422f:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  804232:	89 75 a8             	mov    DWORD PTR [rbp-0x58],esi
    int page_c=size/4096+size%4096?1:0;
  804235:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  804238:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80423e:	85 c0                	test   eax,eax
  804240:	0f 48 c2             	cmovs  eax,edx
  804243:	c1 f8 0c             	sar    eax,0xc
  804246:	89 c1                	mov    ecx,eax
  804248:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  80424b:	99                   	cdq    
  80424c:	c1 ea 14             	shr    edx,0x14
  80424f:	01 d0                	add    eax,edx
  804251:	25 ff 0f 00 00       	and    eax,0xfff
  804256:	29 d0                	sub    eax,edx
  804258:	01 c8                	add    eax,ecx
  80425a:	85 c0                	test   eax,eax
  80425c:	0f 95 c0             	setne  al
  80425f:	0f b6 c0             	movzx  eax,al
  804262:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=0;
  804265:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    void *ptr=NULL;
  80426c:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  804273:	00 
    page_item *pgind=NULL;//task[proc_index].tss.cr3;
  804274:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80427b:	00 
    pgind++;
  80427c:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  804281:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [rbp-0x14],0x1
  804288:	e9 76 02 00 00       	jmp    804503 <palloc+0x2e0>
    {
        page_item* tblp=*pgind&0xfffff000;
  80428d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804291:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804294:	25 00 f0 ff ff       	and    eax,0xfffff000
  804299:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for(int j=0;j<1024;j++)
  80429d:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  8042a4:	e9 44 02 00 00       	jmp    8044ed <palloc+0x2ca>
        {
            int v=*tblp&PAGE_PRESENT;
  8042a9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8042ad:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8042b0:	83 e0 01             	and    eax,0x1
  8042b3:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
            if(!v)
  8042b6:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  8042ba:	0f 85 24 02 00 00    	jne    8044e4 <palloc+0x2c1>
            {
                int new_pg=req_a_page();
  8042c0:	b8 00 00 00 00       	mov    eax,0x0
  8042c5:	e8 0c d2 ff ff       	call   8014d6 <req_a_page>
  8042ca:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
                if(new_pg==-1)
  8042cd:	83 7d c8 ff          	cmp    DWORD PTR [rbp-0x38],0xffffffff
  8042d1:	0f 85 dc 00 00 00    	jne    8043b3 <palloc+0x190>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  8042d7:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8042da:	48 63 d0             	movsxd rdx,eax
  8042dd:	48 89 d0             	mov    rax,rdx
  8042e0:	48 01 c0             	add    rax,rax
  8042e3:	48 01 d0             	add    rax,rdx
  8042e6:	48 c1 e0 08          	shl    rax,0x8
  8042ea:	48 05 f4 84 40 00    	add    rax,0x4084f4
  8042f0:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8042f3:	0f b7 c0             	movzx  eax,ax
  8042f6:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  8042f9:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8042fc:	48 63 d0             	movsxd rdx,eax
  8042ff:	48 89 d0             	mov    rax,rdx
  804302:	48 01 c0             	add    rax,rax
  804305:	48 01 d0             	add    rax,rdx
  804308:	48 c1 e0 08          	shl    rax,0x8
  80430c:	48 05 f0 84 40 00    	add    rax,0x4084f0
  804312:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  804316:	0f b7 c0             	movzx  eax,ax
  804319:	c1 e0 10             	shl    eax,0x10
  80431c:	25 00 00 0f 00       	and    eax,0xf0000
  804321:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    size+=c;
  804324:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804327:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  80432a:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80432d:	89 c1                	mov    ecx,eax
  80432f:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804332:	48 63 d0             	movsxd rdx,eax
  804335:	48 89 d0             	mov    rax,rdx
  804338:	48 01 c0             	add    rax,rax
  80433b:	48 01 d0             	add    rax,rdx
  80433e:	48 c1 e0 08          	shl    rax,0x8
  804342:	48 05 f4 84 40 00    	add    rax,0x4084f4
  804348:	66 89 08             	mov    WORD PTR [rax],cx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  80434b:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80434e:	48 63 d0             	movsxd rdx,eax
  804351:	48 89 d0             	mov    rax,rdx
  804354:	48 01 c0             	add    rax,rax
  804357:	48 01 d0             	add    rax,rdx
  80435a:	48 c1 e0 08          	shl    rax,0x8
  80435e:	48 05 f0 84 40 00    	add    rax,0x4084f0
  804364:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  804368:	0f b7 c0             	movzx  eax,ax
  80436b:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    tmp_attr&=0xfff0;
  80436e:	81 65 b0 f0 ff 00 00 	and    DWORD PTR [rbp-0x50],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  804375:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  804378:	c1 e8 10             	shr    eax,0x10
  80437b:	83 e0 0f             	and    eax,0xf
  80437e:	89 c2                	mov    edx,eax
  804380:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  804383:	01 d0                	add    eax,edx
  804385:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  804388:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  80438b:	89 c1                	mov    ecx,eax
  80438d:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804390:	48 63 d0             	movsxd rdx,eax
  804393:	48 89 d0             	mov    rax,rdx
  804396:	48 01 c0             	add    rax,rax
  804399:	48 01 d0             	add    rax,rdx
  80439c:	48 c1 e0 08          	shl    rax,0x8
  8043a0:	48 05 f0 84 40 00    	add    rax,0x4084f0
  8043a6:	66 89 48 09          	mov    WORD PTR [rax+0x9],cx
                    return ptr;//失败了，只能申请一部分的内存或者返回NULL
  8043aa:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8043ae:	e9 62 01 00 00       	jmp    804515 <palloc+0x2f2>
                }
                int addr=get_phyaddr(new_pg);
  8043b3:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  8043b6:	89 c7                	mov    edi,eax
  8043b8:	e8 c7 d2 ff ff       	call   801684 <get_phyaddr>
  8043bd:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
                set_page_item(tblp,addr,PAGE_PRESENT|\
  8043c0:	8b 4d c4             	mov    ecx,DWORD PTR [rbp-0x3c]
  8043c3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8043c7:	ba 07 00 00 00       	mov    edx,0x7
  8043cc:	89 ce                	mov    esi,ecx
  8043ce:	48 89 c7             	mov    rdi,rax
  8043d1:	e8 c1 d2 ff ff       	call   801697 <set_page_item>
                PAGE_RWX|PAGE_FOR_ALL);
                int laddr=i*0x400000+j*0x1000;//线性地址
  8043d6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8043d9:	c1 e0 0a             	shl    eax,0xa
  8043dc:	89 c2                	mov    edx,eax
  8043de:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8043e1:	01 d0                	add    eax,edx
  8043e3:	c1 e0 0c             	shl    eax,0xc
  8043e6:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
                if(ptr==NULL)
  8043e9:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
  8043ee:	75 09                	jne    8043f9 <palloc+0x1d6>
                {
                   // ptr=laddr;
                    palloc_paddr=addr;
  8043f0:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8043f3:	89 05 1b 01 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1011b],eax        # 414514 <palloc_paddr>
                }
                page_c--;
  8043f9:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
                c++;
  8043fd:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                if(page_c==0)
  804401:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  804405:	0f 85 d9 00 00 00    	jne    8044e4 <palloc+0x2c1>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  80440b:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80440e:	48 63 d0             	movsxd rdx,eax
  804411:	48 89 d0             	mov    rax,rdx
  804414:	48 01 c0             	add    rax,rax
  804417:	48 01 d0             	add    rax,rdx
  80441a:	48 c1 e0 08          	shl    rax,0x8
  80441e:	48 05 f4 84 40 00    	add    rax,0x4084f4
  804424:	0f b7 00             	movzx  eax,WORD PTR [rax]
  804427:	0f b7 c0             	movzx  eax,ax
  80442a:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  80442d:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804430:	48 63 d0             	movsxd rdx,eax
  804433:	48 89 d0             	mov    rax,rdx
  804436:	48 01 c0             	add    rax,rax
  804439:	48 01 d0             	add    rax,rdx
  80443c:	48 c1 e0 08          	shl    rax,0x8
  804440:	48 05 f0 84 40 00    	add    rax,0x4084f0
  804446:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  80444a:	0f b7 c0             	movzx  eax,ax
  80444d:	c1 e0 10             	shl    eax,0x10
  804450:	25 00 00 0f 00       	and    eax,0xf0000
  804455:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    size+=c;
  804458:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80445b:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  80445e:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  804461:	89 c1                	mov    ecx,eax
  804463:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804466:	48 63 d0             	movsxd rdx,eax
  804469:	48 89 d0             	mov    rax,rdx
  80446c:	48 01 c0             	add    rax,rax
  80446f:	48 01 d0             	add    rax,rdx
  804472:	48 c1 e0 08          	shl    rax,0x8
  804476:	48 05 f4 84 40 00    	add    rax,0x4084f4
  80447c:	66 89 08             	mov    WORD PTR [rax],cx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  80447f:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804482:	48 63 d0             	movsxd rdx,eax
  804485:	48 89 d0             	mov    rax,rdx
  804488:	48 01 c0             	add    rax,rax
  80448b:	48 01 d0             	add    rax,rdx
  80448e:	48 c1 e0 08          	shl    rax,0x8
  804492:	48 05 f0 84 40 00    	add    rax,0x4084f0
  804498:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  80449c:	0f b7 c0             	movzx  eax,ax
  80449f:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    tmp_attr&=0xfff0;
  8044a2:	81 65 b8 f0 ff 00 00 	and    DWORD PTR [rbp-0x48],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  8044a9:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  8044ac:	c1 e8 10             	shr    eax,0x10
  8044af:	83 e0 0f             	and    eax,0xf
  8044b2:	89 c2                	mov    edx,eax
  8044b4:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  8044b7:	01 d0                	add    eax,edx
  8044b9:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  8044bc:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  8044bf:	89 c1                	mov    ecx,eax
  8044c1:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8044c4:	48 63 d0             	movsxd rdx,eax
  8044c7:	48 89 d0             	mov    rax,rdx
  8044ca:	48 01 c0             	add    rax,rax
  8044cd:	48 01 d0             	add    rax,rdx
  8044d0:	48 c1 e0 08          	shl    rax,0x8
  8044d4:	48 05 f0 84 40 00    	add    rax,0x4084f0
  8044da:	66 89 48 09          	mov    WORD PTR [rax+0x9],cx
                    return ptr;
  8044de:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8044e2:	eb 31                	jmp    804515 <palloc+0x2f2>
                }
            }
            tblp++;
  8044e4:	48 83 45 e0 08       	add    QWORD PTR [rbp-0x20],0x8
        for(int j=0;j<1024;j++)
  8044e9:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  8044ed:	81 7d dc ff 03 00 00 	cmp    DWORD PTR [rbp-0x24],0x3ff
  8044f4:	0f 8e af fd ff ff    	jle    8042a9 <palloc+0x86>
        }
        pgind++;
  8044fa:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  8044ff:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804503:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  80450a:	0f 8e 7d fd ff ff    	jle    80428d <palloc+0x6a>
    }
    return NULL;
  804510:	b8 00 00 00 00       	mov    eax,0x0
}
  804515:	c9                   	leave  
  804516:	c3                   	ret    

0000000000804517 <malloc>:
//为当前进程申请新的内存，并返回这块内存的线性地址。
void* malloc(int size)
{
  804517:	f3 0f 1e fa          	endbr64 
  80451b:	55                   	push   rbp
  80451c:	48 89 e5             	mov    rbp,rsp
  80451f:	48 83 ec 10          	sub    rsp,0x10
  804523:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return palloc(cur_proc,size);
  804526:	8b 05 e0 ff c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ffe0]        # 41450c <cur_proc>
  80452c:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80452f:	89 d6                	mov    esi,edx
  804531:	89 c7                	mov    edi,eax
  804533:	e8 eb fc ff ff       	call   804223 <palloc>
}
  804538:	c9                   	leave  
  804539:	c3                   	ret    

000000000080453a <proc_end>:
void proc_end()
{
  80453a:	f3 0f 1e fa          	endbr64 
  80453e:	55                   	push   rbp
  80453f:	48 89 e5             	mov    rbp,rsp
  804542:	48 83 ec 10          	sub    rsp,0x10
    int ret;
    asm volatile("mov %%eax,%0":"=m"(ret));
  804546:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("proc #%d ended with retv %d.\n",cur_proc,ret);
    //切换堆栈
    //asm volatile("mov %0,%%rsp"::"r"(task[0].tss.esp));
    del_proc(cur_proc);
  804549:	8b 05 bd ff c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ffbd]        # 41450c <cur_proc>
  80454f:	89 c7                	mov    edi,eax
  804551:	e8 90 00 00 00       	call   8045e6 <del_proc>
    if(task[cur_proc].parent_pid!=-1){
  804556:	8b 05 b0 ff c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ffb0]        # 41450c <cur_proc>
  80455c:	48 63 d0             	movsxd rdx,eax
  80455f:	48 89 d0             	mov    rax,rdx
  804562:	48 01 c0             	add    rax,rax
  804565:	48 01 d0             	add    rax,rdx
  804568:	48 c1 e0 08          	shl    rax,0x8
  80456c:	48 05 28 85 40 00    	add    rax,0x408528
  804572:	8b 00                	mov    eax,DWORD PTR [rax]
  804574:	83 f8 ff             	cmp    eax,0xffffffff
  804577:	74 60                	je     8045d9 <proc_end+0x9f>
        task[task[cur_proc].parent_pid].stat=READY;
  804579:	8b 05 8d ff c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ff8d]        # 41450c <cur_proc>
  80457f:	48 63 d0             	movsxd rdx,eax
  804582:	48 89 d0             	mov    rax,rdx
  804585:	48 01 c0             	add    rax,rax
  804588:	48 01 d0             	add    rax,rdx
  80458b:	48 c1 e0 08          	shl    rax,0x8
  80458f:	48 05 28 85 40 00    	add    rax,0x408528
  804595:	8b 00                	mov    eax,DWORD PTR [rax]
  804597:	89 c2                	mov    edx,eax
  804599:	48 89 d0             	mov    rax,rdx
  80459c:	48 01 c0             	add    rax,rax
  80459f:	48 01 d0             	add    rax,rdx
  8045a2:	48 c1 e0 08          	shl    rax,0x8
  8045a6:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8045ac:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        switch_proc_tss(task[cur_proc].parent_pid);
  8045b2:	8b 05 54 ff c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ff54]        # 41450c <cur_proc>
  8045b8:	48 63 d0             	movsxd rdx,eax
  8045bb:	48 89 d0             	mov    rax,rdx
  8045be:	48 01 c0             	add    rax,rax
  8045c1:	48 01 d0             	add    rax,rdx
  8045c4:	48 c1 e0 08          	shl    rax,0x8
  8045c8:	48 05 28 85 40 00    	add    rax,0x408528
  8045ce:	8b 00                	mov    eax,DWORD PTR [rax]
  8045d0:	89 c7                	mov    edi,eax
  8045d2:	e8 3f fb ff ff       	call   804116 <switch_proc_tss>
    }
    else
        switch_proc_tss(0);
    //syscall(SYSCALL_DEL_PROC,cur_proc,0,0,0,0);
}
  8045d7:	eb 0a                	jmp    8045e3 <proc_end+0xa9>
        switch_proc_tss(0);
  8045d9:	bf 00 00 00 00       	mov    edi,0x0
  8045de:	e8 33 fb ff ff       	call   804116 <switch_proc_tss>
}
  8045e3:	90                   	nop
  8045e4:	c9                   	leave  
  8045e5:	c3                   	ret    

00000000008045e6 <del_proc>:
void del_proc(int pnr)
{
  8045e6:	f3 0f 1e fa          	endbr64 
  8045ea:	55                   	push   rbp
  8045eb:	48 89 e5             	mov    rbp,rsp
  8045ee:	48 83 ec 30          	sub    rsp,0x30
  8045f2:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
    task[pnr].stat=ENDED;
  8045f5:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8045f8:	48 63 d0             	movsxd rdx,eax
  8045fb:	48 89 d0             	mov    rax,rdx
  8045fe:	48 01 c0             	add    rax,rax
  804601:	48 01 d0             	add    rax,rdx
  804604:	48 c1 e0 08          	shl    rax,0x8
  804608:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80460e:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[pnr].pid=-1;
  804614:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804617:	48 63 d0             	movsxd rdx,eax
  80461a:	48 89 d0             	mov    rax,rdx
  80461d:	48 01 c0             	add    rax,rax
  804620:	48 01 d0             	add    rax,rdx
  804623:	48 c1 e0 08          	shl    rax,0x8
  804627:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80462d:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    //释放申请的页面
    page_item *p;//task[pnr].tss.cr3;
    p++;
  804633:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
    for(;(*p&PAGE_PRESENT)!=0;p++)
  804638:	eb 63                	jmp    80469d <del_proc+0xb7>
    {
        page_item *tp=*p&0xfffff000;
  80463a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80463e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804641:	25 00 f0 ff ff       	and    eax,0xfffff000
  804646:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<1024;i++)
  80464a:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804651:	eb 30                	jmp    804683 <del_proc+0x9d>
        {
            unsigned int present=*tp&PAGE_PRESENT;
  804653:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804657:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80465a:	83 e0 01             	and    eax,0x1
  80465d:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            if(present)
  804660:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  804664:	74 14                	je     80467a <del_proc+0x94>
            {
                free_page(*tp&0xfffff000);
  804666:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80466a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80466d:	25 00 f0 ff ff       	and    eax,0xfffff000
  804672:	48 89 c7             	mov    rdi,rax
  804675:	e8 2c cf ff ff       	call   8015a6 <free_page>
                //printf("freed page at %x.\n",*tp&0xfffff000);
            }
            tp++;
  80467a:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
        for(int i=0;i<1024;i++)
  80467f:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804683:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  80468a:	7e c7                	jle    804653 <del_proc+0x6d>
        }
        vmfree(tp);
  80468c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804690:	48 89 c7             	mov    rdi,rax
  804693:	e8 39 cb ff ff       	call   8011d1 <vmfree>
    for(;(*p&PAGE_PRESENT)!=0;p++)
  804698:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
  80469d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046a1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8046a4:	83 e0 01             	and    eax,0x1
  8046a7:	48 85 c0             	test   rax,rax
  8046aa:	75 8e                	jne    80463a <del_proc+0x54>
    }
    //释放存放页目录的页面
    vmfree(p);
  8046ac:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046b0:	48 89 c7             	mov    rdi,rax
  8046b3:	e8 19 cb ff ff       	call   8011d1 <vmfree>
    //从进程中解除cr3,tss和ldt
    //switch_proc_tss(task[pnr]);
}
  8046b8:	90                   	nop
  8046b9:	c9                   	leave  
  8046ba:	c3                   	ret    

00000000008046bb <set_proc_stat>:

int set_proc_stat(int pid,int stat)
{
  8046bb:	f3 0f 1e fa          	endbr64 
  8046bf:	55                   	push   rbp
  8046c0:	48 89 e5             	mov    rbp,rsp
  8046c3:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8046c6:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==-1)return -1;
  8046c9:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  8046cd:	75 0a                	jne    8046d9 <set_proc_stat+0x1e>
  8046cf:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8046d4:	e9 8c 00 00 00       	jmp    804765 <set_proc_stat+0xaa>
    int i=0;
  8046d9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;task[i].pid!=pid;i++);
  8046e0:	eb 04                	jmp    8046e6 <set_proc_stat+0x2b>
  8046e2:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8046e6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8046e9:	48 63 d0             	movsxd rdx,eax
  8046ec:	48 89 d0             	mov    rax,rdx
  8046ef:	48 01 c0             	add    rax,rax
  8046f2:	48 01 d0             	add    rax,rdx
  8046f5:	48 c1 e0 08          	shl    rax,0x8
  8046f9:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8046ff:	8b 10                	mov    edx,DWORD PTR [rax]
  804701:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804704:	39 c2                	cmp    edx,eax
  804706:	75 da                	jne    8046e2 <set_proc_stat+0x27>
    if(i==MAX_PROC_COUNT)return -1;
  804708:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  80470c:	75 07                	jne    804715 <set_proc_stat+0x5a>
  80470e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804713:	eb 50                	jmp    804765 <set_proc_stat+0xaa>
    task[i].stat=stat;
  804715:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804718:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80471b:	48 63 c8             	movsxd rcx,eax
  80471e:	48 89 c8             	mov    rax,rcx
  804721:	48 01 c0             	add    rax,rax
  804724:	48 01 c8             	add    rax,rcx
  804727:	48 c1 e0 08          	shl    rax,0x8
  80472b:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804731:	89 10                	mov    DWORD PTR [rax],edx
    //如果这就是正在运行的进程，那么马上停止
    if(cur_proc==i)
  804733:	8b 05 d3 fd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fdd3]        # 41450c <cur_proc>
  804739:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  80473c:	75 22                	jne    804760 <set_proc_stat+0xa5>
        task[cur_proc].utime=MAX_UTIME;
  80473e:	8b 05 c8 fd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fdc8]        # 41450c <cur_proc>
  804744:	48 63 d0             	movsxd rdx,eax
  804747:	48 89 d0             	mov    rax,rdx
  80474a:	48 01 c0             	add    rax,rax
  80474d:	48 01 d0             	add    rax,rdx
  804750:	48 c1 e0 08          	shl    rax,0x8
  804754:	48 05 a8 84 40 00    	add    rax,0x4084a8
  80475a:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    return 0;
  804760:	b8 00 00 00 00       	mov    eax,0x0
}
  804765:	5d                   	pop    rbp
  804766:	c3                   	ret    

0000000000804767 <add_proc_openf>:

    return 0;
} */

int add_proc_openf(vfs_dir_entry *entry)
{
  804767:	f3 0f 1e fa          	endbr64 
  80476b:	55                   	push   rbp
  80476c:	48 89 e5             	mov    rbp,rsp
  80476f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_PROC_OPENF;i++){
  804773:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80477a:	eb 6a                	jmp    8047e6 <add_proc_openf+0x7f>
        if(task[cur_proc].openf[i]==NULL)
  80477c:	8b 05 8a fd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fd8a]        # 41450c <cur_proc>
  804782:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804785:	48 63 ca             	movsxd rcx,edx
  804788:	48 63 d0             	movsxd rdx,eax
  80478b:	48 89 d0             	mov    rax,rdx
  80478e:	48 01 c0             	add    rax,rax
  804791:	48 01 d0             	add    rax,rdx
  804794:	48 c1 e0 05          	shl    rax,0x5
  804798:	48 01 c8             	add    rax,rcx
  80479b:	48 83 c0 18          	add    rax,0x18
  80479f:	48 8b 04 c5 a4 84 40 	mov    rax,QWORD PTR [rax*8+0x4084a4]
  8047a6:	00 
  8047a7:	48 85 c0             	test   rax,rax
  8047aa:	75 36                	jne    8047e2 <add_proc_openf+0x7b>
        {
            task[cur_proc].openf[i]=entry;
  8047ac:	8b 05 5a fd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fd5a]        # 41450c <cur_proc>
  8047b2:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8047b5:	48 63 ca             	movsxd rcx,edx
  8047b8:	48 63 d0             	movsxd rdx,eax
  8047bb:	48 89 d0             	mov    rax,rdx
  8047be:	48 01 c0             	add    rax,rax
  8047c1:	48 01 d0             	add    rax,rdx
  8047c4:	48 c1 e0 05          	shl    rax,0x5
  8047c8:	48 01 c8             	add    rax,rcx
  8047cb:	48 8d 50 18          	lea    rdx,[rax+0x18]
  8047cf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8047d3:	48 89 04 d5 a4 84 40 	mov    QWORD PTR [rdx*8+0x4084a4],rax
  8047da:	00 
            return 0;
  8047db:	b8 00 00 00 00       	mov    eax,0x0
  8047e0:	eb 0f                	jmp    8047f1 <add_proc_openf+0x8a>
    for(int i=0;i<MAX_PROC_OPENF;i++){
  8047e2:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8047e6:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  8047ea:	7e 90                	jle    80477c <add_proc_openf+0x15>
        }
    }
    return -1;//full
  8047ec:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8047f1:	5d                   	pop    rbp
  8047f2:	c3                   	ret    

00000000008047f3 <sys_exit>:
/*
 * 进程结束。
 * */
int sys_exit(int code)
{
  8047f3:	f3 0f 1e fa          	endbr64 
  8047f7:	55                   	push   rbp
  8047f8:	48 89 e5             	mov    rbp,rsp
  8047fb:	48 83 ec 10          	sub    rsp,0x10
  8047ff:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    del_proc(cur_proc);
  804802:	8b 05 04 fd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fd04]        # 41450c <cur_proc>
  804808:	89 c7                	mov    edi,eax
  80480a:	e8 d7 fd ff ff       	call   8045e6 <del_proc>
    return code;
  80480f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  804812:	c9                   	leave  
  804813:	c3                   	ret    

0000000000804814 <reg_proc>:
    dllmain(NULL,0,NULL);
    
}*/

int reg_proc(int entry, vfs_dir_entry *cwd, vfs_dir_entry *exef)
{
  804814:	f3 0f 1e fa          	endbr64 
  804818:	55                   	push   rbp
  804819:	48 89 e5             	mov    rbp,rsp
  80481c:	48 83 ec 40          	sub    rsp,0x40
  804820:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  804823:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  804827:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
    
    int i=req_proc();
  80482b:	b8 00 00 00 00       	mov    eax,0x0
  804830:	e8 9c f4 ff ff       	call   803cd1 <req_proc>
  804835:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(i==-1)return -1;
  804838:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  80483c:	75 0a                	jne    804848 <reg_proc+0x34>
  80483e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804843:	e9 65 01 00 00       	jmp    8049ad <reg_proc+0x199>
    /*set_proc(0,0,0,0,SEL_LDT_DATA,SEL_LDT_CODE,SEL_LDT_STACK,SEL_LDT_DATA\
    ,SEL_LDT_DATA,SEL_LDT_DATA,0x1c00000-4,0,0,0,0,i);*/
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10\
  804848:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80484b:	50                   	push   rax
  80484c:	6a 00                	push   0x0
  80484e:	6a 00                	push   0x0
  804850:	6a 00                	push   0x0
  804852:	6a 00                	push   0x0
  804854:	6a 00                	push   0x0
  804856:	68 fc ff bf 01       	push   0x1bffffc
  80485b:	6a 10                	push   0x10
  80485d:	6a 10                	push   0x10
  80485f:	6a 10                	push   0x10
  804861:	6a 10                	push   0x10
  804863:	41 b9 08 00 00 00    	mov    r9d,0x8
  804869:	41 b8 10 00 00 00    	mov    r8d,0x10
  80486f:	b9 00 00 00 00       	mov    ecx,0x0
  804874:	ba 00 00 00 00       	mov    edx,0x0
  804879:	be 00 00 00 00       	mov    esi,0x0
  80487e:	bf 00 00 00 00       	mov    edi,0x0
  804883:	e8 42 f5 ff ff       	call   803dca <set_proc>
  804888:	48 83 c4 58          	add    rsp,0x58
, 0x10, 0x10, 0x1c00000 - 4, 0, 0, 0, 0, 0, i);
    task[i].pml4=vmalloc();
  80488c:	b8 00 00 00 00       	mov    eax,0x0
  804891:	e8 ac c8 ff ff       	call   801142 <vmalloc>
  804896:	48 89 c1             	mov    rcx,rax
  804899:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80489c:	48 63 d0             	movsxd rdx,eax
  80489f:	48 89 d0             	mov    rax,rdx
  8048a2:	48 01 c0             	add    rax,rax
  8048a5:	48 01 d0             	add    rax,rdx
  8048a8:	48 c1 e0 08          	shl    rax,0x8
  8048ac:	48 05 40 85 40 00    	add    rax,0x408540
  8048b2:	48 89 48 0c          	mov    QWORD PTR [rax+0xc],rcx
    int *pt=vmalloc();
  8048b6:	b8 00 00 00 00       	mov    eax,0x0
  8048bb:	e8 82 c8 ff ff       	call   801142 <vmalloc>
  8048c0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    task[i].pml4[0]=PAGE_TABLE_ADDR|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;
  8048c4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8048c7:	48 63 d0             	movsxd rdx,eax
  8048ca:	48 89 d0             	mov    rax,rdx
  8048cd:	48 01 c0             	add    rax,rax
  8048d0:	48 01 d0             	add    rax,rdx
  8048d3:	48 c1 e0 08          	shl    rax,0x8
  8048d7:	48 05 40 85 40 00    	add    rax,0x408540
  8048dd:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8048e1:	48 c7 00 07 20 00 00 	mov    QWORD PTR [rax],0x2007
    /*for(int j=0;j<32;j++)
        pt[j]=(PAGE_TABLE_ADDR+j*0x1000)|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;//复制内核页表*/
    //PAGE_TABLE_ADDR|PAGE_PRESENT;//复制内核页表
    //task[i].pml4[7]=PAGE_TABLE_ADDR+7*0x1000|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//sys.dll
    int *stackb=vmalloc();
  8048e8:	b8 00 00 00 00       	mov    eax,0x0
  8048ed:	e8 50 c8 ff ff       	call   801142 <vmalloc>
  8048f2:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    task[i].pml4[6]=(int)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  8048f6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8048fa:	83 c8 07             	or     eax,0x7
  8048fd:	89 c1                	mov    ecx,eax
  8048ff:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804902:	48 63 d0             	movsxd rdx,eax
  804905:	48 89 d0             	mov    rax,rdx
  804908:	48 01 c0             	add    rax,rax
  80490b:	48 01 d0             	add    rax,rdx
  80490e:	48 c1 e0 08          	shl    rax,0x8
  804912:	48 05 40 85 40 00    	add    rax,0x408540
  804918:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  80491c:	48 8d 50 30          	lea    rdx,[rax+0x30]
  804920:	48 63 c1             	movsxd rax,ecx
  804923:	48 89 02             	mov    QWORD PTR [rdx],rax
    stackb[1023]=get_phyaddr(req_a_page())|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  804926:	b8 00 00 00 00       	mov    eax,0x0
  80492b:	e8 a6 cb ff ff       	call   8014d6 <req_a_page>
  804930:	89 c7                	mov    edi,eax
  804932:	e8 4d cd ff ff       	call   801684 <get_phyaddr>
  804937:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80493b:	48 81 c2 fc 0f 00 00 	add    rdx,0xffc
  804942:	83 c8 07             	or     eax,0x7
  804945:	89 02                	mov    DWORD PTR [rdx],eax
//    task[i].tss.cr3=task[i].pml4;

    task[i].stat=READY;
  804947:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80494a:	48 63 d0             	movsxd rdx,eax
  80494d:	48 89 d0             	mov    rax,rdx
  804950:	48 01 c0             	add    rax,rax
  804953:	48 01 d0             	add    rax,rdx
  804956:	48 c1 e0 08          	shl    rax,0x8
  80495a:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804960:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[i].cwd=cwd;
  804966:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804969:	48 63 d0             	movsxd rdx,eax
  80496c:	48 89 d0             	mov    rax,rdx
  80496f:	48 01 c0             	add    rax,rax
  804972:	48 01 d0             	add    rax,rdx
  804975:	48 c1 e0 08          	shl    rax,0x8
  804979:	48 8d 90 50 85 40 00 	lea    rdx,[rax+0x408550]
  804980:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804984:	48 89 42 04          	mov    QWORD PTR [rdx+0x4],rax
    task[i].exef=exef;
  804988:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80498b:	48 63 d0             	movsxd rdx,eax
  80498e:	48 89 d0             	mov    rax,rdx
  804991:	48 01 c0             	add    rax,rax
  804994:	48 01 d0             	add    rax,rdx
  804997:	48 c1 e0 08          	shl    rax,0x8
  80499b:	48 8d 90 50 85 40 00 	lea    rdx,[rax+0x408550]
  8049a2:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8049a6:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
    task[i].tss.ss=0x10;
    task[i].tss.gs=0x10;
    task[i].tss.fs=0x10;
    task[i].tss.cs=0x8;*/
//    task[i].tss.eip=entry;
    return i;
  8049aa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    proc_ret_stack *pstack=stack_paddr+stack_size-12;
    pstack->argc=0;
    pstack->argv=0;
    pstack->proc_end_addr=proc_end;
    int *pptr=pstack;*/
}
  8049ad:	c9                   	leave  
  8049ae:	c3                   	ret    

00000000008049af <sys_malloc>:

void * sys_malloc(int size)
{
  8049af:	f3 0f 1e fa          	endbr64 
  8049b3:	55                   	push   rbp
  8049b4:	48 89 e5             	mov    rbp,rsp
  8049b7:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    //
    int n=size/CHUNK_SIZE+size%CHUNK_SIZE?1:0;
  8049ba:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8049bd:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8049c3:	85 c0                	test   eax,eax
  8049c5:	0f 48 c2             	cmovs  eax,edx
  8049c8:	c1 f8 0c             	sar    eax,0xc
  8049cb:	89 c1                	mov    ecx,eax
  8049cd:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8049d0:	99                   	cdq    
  8049d1:	c1 ea 14             	shr    edx,0x14
  8049d4:	01 d0                	add    eax,edx
  8049d6:	25 ff 0f 00 00       	and    eax,0xfff
  8049db:	29 d0                	sub    eax,edx
  8049dd:	01 c8                	add    eax,ecx
  8049df:	85 c0                	test   eax,eax
  8049e1:	0f 95 c0             	setne  al
  8049e4:	0f b6 c0             	movzx  eax,al
  8049e7:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    chunk_header *hp=(chunk_header*)task[cur_proc].mem_struct.heap_base;
  8049ea:	8b 05 1c fb c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fb1c]        # 41450c <cur_proc>
  8049f0:	48 63 d0             	movsxd rdx,eax
  8049f3:	48 89 d0             	mov    rax,rdx
  8049f6:	48 01 c0             	add    rax,rax
  8049f9:	48 01 d0             	add    rax,rdx
  8049fc:	48 c1 e0 08          	shl    rax,0x8
  804a00:	48 05 b4 84 40 00    	add    rax,0x4084b4
  804a06:	8b 00                	mov    eax,DWORD PTR [rax]
  804a08:	48 98                	cdqe   
  804a0a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804a0e:	eb 0c                	jmp    804a1c <sys_malloc+0x6d>
        hp=hp->next;
  804a10:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a14:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804a18:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804a1c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a20:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804a24:	48 85 c0             	test   rax,rax
  804a27:	74 16                	je     804a3f <sys_malloc+0x90>
  804a29:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a2d:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804a30:	85 c0                	test   eax,eax
  804a32:	75 0b                	jne    804a3f <sys_malloc+0x90>
  804a34:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a38:	8b 00                	mov    eax,DWORD PTR [rax]
  804a3a:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804a3d:	7e d1                	jle    804a10 <sys_malloc+0x61>
    if(hp->pgn<n)
  804a3f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a43:	8b 00                	mov    eax,DWORD PTR [rax]
  804a45:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804a48:	0f 8e 8d 00 00 00    	jle    804adb <sys_malloc+0x12c>
    {
        //上抬heap top
        if(task[cur_proc].mem_struct.heap_top+CHUNK_SIZE*n>=HEAP_MAXTOP)
  804a4e:	8b 05 b8 fa c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fab8]        # 41450c <cur_proc>
  804a54:	48 63 d0             	movsxd rdx,eax
  804a57:	48 89 d0             	mov    rax,rdx
  804a5a:	48 01 c0             	add    rax,rax
  804a5d:	48 01 d0             	add    rax,rdx
  804a60:	48 c1 e0 08          	shl    rax,0x8
  804a64:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804a6a:	8b 10                	mov    edx,DWORD PTR [rax]
  804a6c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804a6f:	c1 e0 0c             	shl    eax,0xc
  804a72:	01 d0                	add    eax,edx
  804a74:	3d ff ff ef 01       	cmp    eax,0x1efffff
  804a79:	7e 0a                	jle    804a85 <sys_malloc+0xd6>
        {
            //超过顶部
            return NULL;
  804a7b:	b8 00 00 00 00       	mov    eax,0x0
  804a80:	e9 cf 00 00 00       	jmp    804b54 <sys_malloc+0x1a5>
        }
        int needed=n-hp->pgn;
  804a85:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a89:	8b 10                	mov    edx,DWORD PTR [rax]
  804a8b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804a8e:	29 d0                	sub    eax,edx
  804a90:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
        char* p=task[cur_proc].mem_struct.heap_top;
  804a93:	8b 05 73 fa c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fa73]        # 41450c <cur_proc>
  804a99:	48 63 d0             	movsxd rdx,eax
  804a9c:	48 89 d0             	mov    rax,rdx
  804a9f:	48 01 c0             	add    rax,rax
  804aa2:	48 01 d0             	add    rax,rdx
  804aa5:	48 c1 e0 08          	shl    rax,0x8
  804aa9:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804aaf:	8b 00                	mov    eax,DWORD PTR [rax]
  804ab1:	48 98                	cdqe   
  804ab3:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804ab7:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804abe:	eb 13                	jmp    804ad3 <sys_malloc+0x124>
        {
            *p=0;//触发缺页中断
  804ac0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804ac4:	c6 00 00             	mov    BYTE PTR [rax],0x0
            p+=PAGE_SIZE;
  804ac7:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  804ace:	00 
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804acf:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804ad3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804ad6:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  804ad9:	7c e5                	jl     804ac0 <sys_malloc+0x111>
        }
    }
    if(hp->pgn>n)
  804adb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804adf:	8b 00                	mov    eax,DWORD PTR [rax]
  804ae1:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804ae4:	7d 59                	jge    804b3f <sys_malloc+0x190>
    {
        //在后面新建一个头
        char *p=hp;
  804ae6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804aea:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        p+=(n+1)*CHUNK_SIZE;//算上存储头一个
  804aee:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804af1:	83 c0 01             	add    eax,0x1
  804af4:	c1 e0 0c             	shl    eax,0xc
  804af7:	48 98                	cdqe   
  804af9:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
        chunk_header *np=p;
  804afd:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804b01:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
        np->pgn=hp->pgn-n-1;
  804b05:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b09:	8b 00                	mov    eax,DWORD PTR [rax]
  804b0b:	2b 45 e8             	sub    eax,DWORD PTR [rbp-0x18]
  804b0e:	8d 50 ff             	lea    edx,[rax-0x1]
  804b11:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804b15:	89 10                	mov    DWORD PTR [rax],edx
        np->next=hp->next;
  804b17:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b1b:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  804b1f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804b23:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
        np->prev=hp;
  804b27:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804b2b:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804b2f:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
        hp->next=np;
  804b33:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b37:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804b3b:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    }
    hp->alloc=1;//分配完毕
  804b3f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b43:	c7 40 04 01 00 00 00 	mov    DWORD PTR [rax+0x4],0x1
    return (char*)hp+CHUNK_SIZE;//返回后边的第一个数据块地址
  804b4a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b4e:	48 05 00 10 00 00    	add    rax,0x1000
}
  804b54:	5d                   	pop    rbp
  804b55:	c3                   	ret    

0000000000804b56 <sys_free>:
int sys_free(int ptr)
{
  804b56:	f3 0f 1e fa          	endbr64 
  804b5a:	55                   	push   rbp
  804b5b:	48 89 e5             	mov    rbp,rsp
  804b5e:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    chunk_header *hp=ptr-CHUNK_SIZE;//回退到头
  804b61:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804b64:	2d 00 10 00 00       	sub    eax,0x1000
  804b69:	48 98                	cdqe   
  804b6b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    hp->alloc=0;
  804b6f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b73:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
    //合并
    //向后合并
    chunk_header *p=hp->next;
  804b7a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b7e:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804b82:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804b86:	eb 2e                	jmp    804bb6 <sys_free+0x60>
    {
        if(p->alloc==0)
  804b88:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b8c:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804b8f:	85 c0                	test   eax,eax
  804b91:	75 2c                	jne    804bbf <sys_free+0x69>
        {
            hp->pgn+=p->pgn+1;//把区域合并
  804b93:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b97:	8b 10                	mov    edx,DWORD PTR [rax]
  804b99:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b9d:	8b 00                	mov    eax,DWORD PTR [rax]
  804b9f:	83 c0 01             	add    eax,0x1
  804ba2:	01 c2                	add    edx,eax
  804ba4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804ba8:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->next;
  804baa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804bae:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804bb2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804bb6:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804bbb:	75 cb                	jne    804b88 <sys_free+0x32>
  804bbd:	eb 01                	jmp    804bc0 <sys_free+0x6a>
            break;
  804bbf:	90                   	nop
    }
    //向前合并
    p=hp->prev;
  804bc0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804bc4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  804bc8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804bcc:	eb 2e                	jmp    804bfc <sys_free+0xa6>
    {
        if(p->alloc==0)
  804bce:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804bd2:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804bd5:	85 c0                	test   eax,eax
  804bd7:	75 2c                	jne    804c05 <sys_free+0xaf>
        {
            p->pgn+=hp->pgn+1;//把区域合并
  804bd9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804bdd:	8b 10                	mov    edx,DWORD PTR [rax]
  804bdf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804be3:	8b 00                	mov    eax,DWORD PTR [rax]
  804be5:	83 c0 01             	add    eax,0x1
  804be8:	01 c2                	add    edx,eax
  804bea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804bee:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->prev;
  804bf0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804bf4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  804bf8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804bfc:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804c01:	75 cb                	jne    804bce <sys_free+0x78>
  804c03:	eb 01                	jmp    804c06 <sys_free+0xb0>
            break;
  804c05:	90                   	nop
    }
    //合并完成
    return 0;
  804c06:	b8 00 00 00 00       	mov    eax,0x0
}
  804c0b:	5d                   	pop    rbp
  804c0c:	c3                   	ret    

0000000000804c0d <switch_to>:

void switch_to(struct process *from, struct process *to) {
  804c0d:	f3 0f 1e fa          	endbr64 
  804c11:	55                   	push   rbp
  804c12:	48 89 e5             	mov    rbp,rsp
  804c15:	53                   	push   rbx
  804c16:	48 89 7d f0          	mov    QWORD PTR [rbp-0x10],rdi
  804c1a:	48 89 75 e8          	mov    QWORD PTR [rbp-0x18],rsi
    cur_proc=to-task;
  804c1e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804c22:	48 2d a0 84 40 00    	sub    rax,0x4084a0
  804c28:	48 c1 f8 08          	sar    rax,0x8
  804c2c:	48 89 c2             	mov    rdx,rax
  804c2f:	48 b8 ab aa aa aa aa 	movabs rax,0xaaaaaaaaaaaaaaab
  804c36:	aa aa aa 
  804c39:	48 0f af c2          	imul   rax,rdx
  804c3d:	89 05 c9 f8 c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0f8c9],eax        # 41450c <cur_proc>
    asm volatile("mov %%rsp,%0\r\n"
  804c43:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  804c47:	4c 8b 55 f0          	mov    r10,QWORD PTR [rbp-0x10]
  804c4b:	4c 8b 5d f0          	mov    r11,QWORD PTR [rbp-0x10]
  804c4f:	48 8b 5d f0          	mov    rbx,QWORD PTR [rbp-0x10]
  804c53:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804c57:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804c5b:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  804c5f:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  804c63:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  804c67:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  804c6b:	49 89 a1 68 02 00 00 	mov    QWORD PTR [r9+0x268],rsp
  804c72:	48 8d 05 24 00 00 00 	lea    rax,[rip+0x24]        # 804c9d <done>
  804c79:	49 89 82 38 02 00 00 	mov    QWORD PTR [r10+0x238],rax
  804c80:	41 8c a3 a8 02 00 00 	mov    WORD PTR [r11+0x2a8],fs
  804c87:	8c ab b0 02 00 00    	mov    WORD PTR [rbx+0x2b0],gs
  804c8d:	48 8b a1 68 02 00 00 	mov    rsp,QWORD PTR [rcx+0x268]
  804c94:	41 ff b0 38 02 00 00 	push   QWORD PTR [r8+0x238]
  804c9b:	eb 08                	jmp    804ca5 <__switch_to>

0000000000804c9d <done>:
  804c9d:	90                   	nop
                 "nop":"=m"(from->regs.rsp),"=m"(from->regs.rip),
                 "=m"(from->regs.fs),"=m"(from->regs.gs):
                "m"(to->regs.fs),"m"(to->regs.gs),"m"(to->regs.rsp),"m"(to->regs.rip),
                "D"(from),"S"(to));

}
  804c9e:	90                   	nop
  804c9f:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804ca3:	c9                   	leave  
  804ca4:	c3                   	ret    

0000000000804ca5 <__switch_to>:
void __switch_to(struct process *from, struct process *to) {
  804ca5:	f3 0f 1e fa          	endbr64 
  804ca9:	55                   	push   rbp
  804caa:	48 89 e5             	mov    rbp,rsp
  804cad:	53                   	push   rbx
  804cae:	48 83 ec 18          	sub    rsp,0x18
  804cb2:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  804cb6:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804cba:	48 8b 05 ff 61 00 00 	mov    rax,QWORD PTR [rip+0x61ff]        # 80aec0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804cc1:	4c 8b 50 54          	mov    r10,QWORD PTR [rax+0x54]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804cc5:	48 8b 05 f4 61 00 00 	mov    rax,QWORD PTR [rip+0x61f4]        # 80aec0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804ccc:	4c 8b 48 4c          	mov    r9,QWORD PTR [rax+0x4c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804cd0:	48 8b 05 e9 61 00 00 	mov    rax,QWORD PTR [rip+0x61e9]        # 80aec0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804cd7:	4c 8b 40 44          	mov    r8,QWORD PTR [rax+0x44]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804cdb:	48 8b 05 de 61 00 00 	mov    rax,QWORD PTR [rip+0x61de]        # 80aec0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804ce2:	48 8b 78 3c          	mov    rdi,QWORD PTR [rax+0x3c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804ce6:	48 8b 05 d3 61 00 00 	mov    rax,QWORD PTR [rip+0x61d3]        # 80aec0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804ced:	48 8b 58 34          	mov    rbx,QWORD PTR [rax+0x34]
  804cf1:	48 8b 05 c8 61 00 00 	mov    rax,QWORD PTR [rip+0x61c8]        # 80aec0 <tss>
  804cf8:	4c 8b 58 2c          	mov    r11,QWORD PTR [rax+0x2c]
  804cfc:	48 8b 05 bd 61 00 00 	mov    rax,QWORD PTR [rip+0x61bd]        # 80aec0 <tss>
  804d03:	48 8b 48 24          	mov    rcx,QWORD PTR [rax+0x24]
  804d07:	48 8b 05 b2 61 00 00 	mov    rax,QWORD PTR [rip+0x61b2]        # 80aec0 <tss>
  804d0e:	48 8b 50 14          	mov    rdx,QWORD PTR [rax+0x14]
  804d12:	48 8b 05 a7 61 00 00 	mov    rax,QWORD PTR [rip+0x61a7]        # 80aec0 <tss>
  804d19:	48 8b 70 0c          	mov    rsi,QWORD PTR [rax+0xc]
  804d1d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804d21:	48 8b 80 c8 01 00 00 	mov    rax,QWORD PTR [rax+0x1c8]
  804d28:	41 52                	push   r10
  804d2a:	41 51                	push   r9
  804d2c:	41 50                	push   r8
  804d2e:	57                   	push   rdi
  804d2f:	49 89 d9             	mov    r9,rbx
  804d32:	4d 89 d8             	mov    r8,r11
  804d35:	48 89 c7             	mov    rdi,rax
  804d38:	e8 33 00 00 00       	call   804d70 <set_tss>
  804d3d:	48 83 c4 20          	add    rsp,0x20
    asm volatile("mov %%fs,%0\r\n"
  804d41:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804d45:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  804d49:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804d4d:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  804d51:	8c a0 a8 02 00 00    	mov    WORD PTR [rax+0x2a8],fs
  804d57:	8c ae b0 02 00 00    	mov    WORD PTR [rsi+0x2b0],gs
  804d5d:	8e a2 a8 02 00 00    	mov    fs,WORD PTR [rdx+0x2a8]
  804d63:	8e a9 b0 02 00 00    	mov    gs,WORD PTR [rcx+0x2b0]
                 "mov %%gs,%1\r\n"
                 "mov %2,%%fs\r\n"
                 "mov %3,%%gs":"=m"(to->regs.fs),"=m"(to->regs.gs):
                 "m"(from->regs.fs),"m"(from->regs.gs));
}
  804d69:	90                   	nop
  804d6a:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804d6e:	c9                   	leave  
  804d6f:	c3                   	ret    

0000000000804d70 <set_tss>:

void set_tss(u64 rsp0,u64 rsp1,u64 rsp2,u64 ist0,u64 ist1,u64 ist2,u64 ist3,u64 ist4,u64 ist5,u64 ist6){
  804d70:	f3 0f 1e fa          	endbr64 
  804d74:	55                   	push   rbp
  804d75:	48 89 e5             	mov    rbp,rsp
  804d78:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  804d7c:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  804d80:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  804d84:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  804d88:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
  804d8c:	4c 89 4d d0          	mov    QWORD PTR [rbp-0x30],r9
    tss->rsp0=rsp0;
  804d90:	48 8b 05 29 61 00 00 	mov    rax,QWORD PTR [rip+0x6129]        # 80aec0 <tss>
  804d97:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804d9b:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx
    tss->rsp1=rsp1;
  804d9f:	48 8b 05 1a 61 00 00 	mov    rax,QWORD PTR [rip+0x611a]        # 80aec0 <tss>
  804da6:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  804daa:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    tss->rsp2=rsp2;
  804dae:	48 8b 05 0b 61 00 00 	mov    rax,QWORD PTR [rip+0x610b]        # 80aec0 <tss>
  804db5:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804db9:	48 89 50 14          	mov    QWORD PTR [rax+0x14],rdx
    tss->ists[0]=ist0;
  804dbd:	48 8b 05 fc 60 00 00 	mov    rax,QWORD PTR [rip+0x60fc]        # 80aec0 <tss>
  804dc4:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  804dc8:	48 89 50 24          	mov    QWORD PTR [rax+0x24],rdx
    tss->ists[1]=ist1;
  804dcc:	48 8b 05 ed 60 00 00 	mov    rax,QWORD PTR [rip+0x60ed]        # 80aec0 <tss>
  804dd3:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  804dd7:	48 89 50 2c          	mov    QWORD PTR [rax+0x2c],rdx
    tss->ists[2]=ist2;
  804ddb:	48 8b 05 de 60 00 00 	mov    rax,QWORD PTR [rip+0x60de]        # 80aec0 <tss>
  804de2:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804de6:	48 89 50 34          	mov    QWORD PTR [rax+0x34],rdx
    tss->ists[3]=ist3;
  804dea:	48 8b 05 cf 60 00 00 	mov    rax,QWORD PTR [rip+0x60cf]        # 80aec0 <tss>
  804df1:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  804df5:	48 89 50 3c          	mov    QWORD PTR [rax+0x3c],rdx
    tss->ists[4]=ist4;
  804df9:	48 8b 05 c0 60 00 00 	mov    rax,QWORD PTR [rip+0x60c0]        # 80aec0 <tss>
  804e00:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  804e04:	48 89 50 44          	mov    QWORD PTR [rax+0x44],rdx
    tss->ists[5]=ist5;
  804e08:	48 8b 05 b1 60 00 00 	mov    rax,QWORD PTR [rip+0x60b1]        # 80aec0 <tss>
  804e0f:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  804e13:	48 89 50 4c          	mov    QWORD PTR [rax+0x4c],rdx
    tss->ists[6]=ist6;
  804e17:	48 8b 05 a2 60 00 00 	mov    rax,QWORD PTR [rip+0x60a2]        # 80aec0 <tss>
  804e1e:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  804e22:	48 89 50 54          	mov    QWORD PTR [rax+0x54],rdx
}
  804e26:	90                   	nop
  804e27:	5d                   	pop    rbp
  804e28:	c3                   	ret    
  804e29:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

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
  805095:	e8 b1 e7 ff ff       	call   80384b <do_req>
    if(!manage_proc_lock)
  80509a:	8b 05 c8 5d 00 00    	mov    eax,DWORD PTR [rip+0x5dc8]        # 80ae68 <manage_proc_lock>
  8050a0:	85 c0                	test   eax,eax
  8050a2:	75 0a                	jne    8050ae <clock_c+0x30>
    {
        manage_proc();
  8050a4:	b8 00 00 00 00       	mov    eax,0x0
  8050a9:	e8 9c ee ff ff       	call   803f4a <manage_proc>
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
  805139:	e8 11 cb ff ff       	call   801c4f <sys_open>
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
  8051a4:	e8 a6 ca ff ff       	call   801c4f <sys_open>
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
  8051fd:	e8 12 f6 ff ff       	call   804814 <reg_proc>
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
  80523c:	e8 d5 ee ff ff       	call   804116 <switch_proc_tss>
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
  8052b4:	e8 2d f3 ff ff       	call   8045e6 <del_proc>
    switch_proc_tss(0);
  8052b9:	bf 00 00 00 00       	mov    edi,0x0
  8052be:	e8 53 ee ff ff       	call   804116 <switch_proc_tss>
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
  80530b:	e8 1e cf ff ff       	call   80222e <sys_read>
    sys_seek(exefno,tdh.e_lfanew,SEEK_SET);
  805310:	48 8b 85 ac fe ff ff 	mov    rax,QWORD PTR [rbp-0x154]
  805317:	89 c1                	mov    ecx,eax
  805319:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  80531c:	ba 00 00 00 00       	mov    edx,0x0
  805321:	89 ce                	mov    esi,ecx
  805323:	89 c7                	mov    edi,eax
  805325:	e8 95 cf ff ff       	call   8022bf <sys_seek>
    sys_read(exefno, &tnth, sizeof(tnth));
  80532a:	48 8d 8d 70 fd ff ff 	lea    rcx,[rbp-0x290]
  805331:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  805334:	ba f8 00 00 00       	mov    edx,0xf8
  805339:	48 89 ce             	mov    rsi,rcx
  80533c:	89 c7                	mov    edi,eax
  80533e:	e8 eb ce ff ff       	call   80222e <sys_read>

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
  8053fe:	e8 bc ce ff ff       	call   8022bf <sys_seek>
    sys_read(exefno, nbase, PAGE_SIZE);
  805403:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805406:	48 89 c1             	mov    rcx,rax
  805409:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  80540c:	ba 00 10 00 00       	mov    edx,0x1000
  805411:	48 89 ce             	mov    rsi,rcx
  805414:	89 c7                	mov    edi,eax
  805416:	e8 13 ce ff ff       	call   80222e <sys_read>
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
  8055a2:	e8 18 cd ff ff       	call   8022bf <sys_seek>
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
  8055c9:	e8 60 cc ff ff       	call   80222e <sys_read>
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
  805652:	be b0 2a 81 00       	mov    esi,0x812ab0
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
  805b01:	e8 91 aa ff ff       	call   800597 <syscall>
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
  805bab:	e8 47 b3 ff ff       	call   800ef7 <mmap>
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
  8061f7:	e8 46 af ff ff       	call   801142 <vmalloc>
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
  806228:	e8 15 af ff ff       	call   801142 <vmalloc>
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
  8062ad:	bf b8 2a 81 00       	mov    edi,0x812ab8
  8062b2:	b8 00 00 00 00       	mov    eax,0x0
  8062b7:	e8 6e aa ff ff       	call   800d2a <printf>
            vmfree(path->name);
  8062bc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8062c0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8062c3:	48 89 c7             	mov    rdi,rax
  8062c6:	e8 06 af ff ff       	call   8011d1 <vmfree>
            vmfree(path);
  8062cb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8062cf:	48 89 c7             	mov    rdi,rax
  8062d2:	e8 fa ae ff ff       	call   8011d1 <vmfree>
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
  8066ac:	e8 fa c3 ff ff       	call   802aab <reg_device>
    reg_driver(&drv_keyboard);
  8066b1:	bf e0 2a 81 00       	mov    edi,0x812ae0
  8066b6:	e8 d8 c6 ff ff       	call   802d93 <reg_driver>
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
  8069ad:	e8 78 a3 ff ff       	call   800d2a <printf>
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
  80716b:	e8 73 bd ff ff       	call   802ee3 <sys_find_dev>
  807170:	83 f8 ff             	cmp    eax,0xffffffff
  807173:	0f 95 c0             	setne  al
  807176:	0f b6 c0             	movzx  eax,al
  807179:	eb 45                	jmp    8071c0 <disk_existent+0x8f>
        return sys_find_dev("hd1")!=-1;
  80717b:	bf 38 2e 81 00       	mov    edi,0x812e38
  807180:	e8 5e bd ff ff       	call   802ee3 <sys_find_dev>
  807185:	83 f8 ff             	cmp    eax,0xffffffff
  807188:	0f 95 c0             	setne  al
  80718b:	0f b6 c0             	movzx  eax,al
  80718e:	eb 30                	jmp    8071c0 <disk_existent+0x8f>
        return sys_find_dev("hd2")!=-1;
  807190:	bf 3c 2e 81 00       	mov    edi,0x812e3c
  807195:	e8 49 bd ff ff       	call   802ee3 <sys_find_dev>
  80719a:	83 f8 ff             	cmp    eax,0xffffffff
  80719d:	0f 95 c0             	setne  al
  8071a0:	0f b6 c0             	movzx  eax,al
  8071a3:	eb 1b                	jmp    8071c0 <disk_existent+0x8f>
        return sys_find_dev("hd3")!=-1;
  8071a5:	bf 40 2e 81 00       	mov    edi,0x812e40
  8071aa:	e8 34 bd ff ff       	call   802ee3 <sys_find_dev>
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
  8072e0:	e8 45 9a ff ff       	call   800d2a <printf>
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
  80733b:	e8 6b b7 ff ff       	call   802aab <reg_device>
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
  8073ba:	e8 24 bb ff ff       	call   802ee3 <sys_find_dev>
  8073bf:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            dispose_device(get_dev(devi));
  8073c2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8073c5:	89 c7                	mov    edi,eax
  8073c7:	e8 eb c1 ff ff       	call   8035b7 <get_dev>
  8073cc:	89 c7                	mov    edi,eax
  8073ce:	e8 37 c1 ff ff       	call   80350a <dispose_device>
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
  807753:	e8 d2 95 ff ff       	call   800d2a <printf>
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
  807992:	e8 ab 97 ff ff       	call   801142 <vmalloc>
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
  807ab4:	e8 71 92 ff ff       	call   800d2a <printf>
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
  807b87:	e8 45 96 ff ff       	call   8011d1 <vmfree>
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
  807d3f:	e8 fe 93 ff ff       	call   801142 <vmalloc>
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
  807da6:	e8 26 94 ff ff       	call   8011d1 <vmfree>
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
  807e9f:	e8 86 8e ff ff       	call   800d2a <printf>
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
  807f54:	e8 d1 8d ff ff       	call   800d2a <printf>
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
  807fe5:	e8 e7 91 ff ff       	call   8011d1 <vmfree>
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
  8080b0:	e8 1c 91 ff ff       	call   8011d1 <vmfree>
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
  8081a4:	e8 81 8b ff ff       	call   800d2a <printf>

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
  808275:	e8 c8 8e ff ff       	call   801142 <vmalloc>
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
  8082cf:	e8 56 8a ff ff       	call   800d2a <printf>
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
  80834f:	e8 d6 89 ff ff       	call   800d2a <printf>
		vmfree(buf);
  808354:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808358:	48 89 c7             	mov    rdi,rax
  80835b:	e8 71 8e ff ff       	call   8011d1 <vmfree>
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
  8084ab:	e8 92 8c ff ff       	call   801142 <vmalloc>
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
  808647:	e8 f6 8a ff ff       	call   801142 <vmalloc>
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
  80881d:	e8 af 89 ff ff       	call   8011d1 <vmfree>
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
  808905:	e8 38 88 ff ff       	call   801142 <vmalloc>
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
  80894e:	e8 d7 83 ff ff       	call   800d2a <printf>
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
  808994:	e8 91 83 ff ff       	call   800d2a <printf>
		vmfree(buf);
  808999:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80899d:	48 89 c7             	mov    rdi,rax
  8089a0:	e8 2c 88 ff ff       	call   8011d1 <vmfree>
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
  808fa0:	e8 2c 82 ff ff       	call   8011d1 <vmfree>
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
  808fc2:	e8 7b 81 ff ff       	call   801142 <vmalloc>
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
  809085:	e8 b8 80 ff ff       	call   801142 <vmalloc>
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
  809196:	e8 36 80 ff ff       	call   8011d1 <vmfree>
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
  809281:	e8 4b 7f ff ff       	call   8011d1 <vmfree>
	vmfree(sb->root->dir_inode->private_index_info);
  809286:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80928a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80928d:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809291:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809295:	48 89 c7             	mov    rdi,rax
  809298:	e8 34 7f ff ff       	call   8011d1 <vmfree>
	vmfree(sb->root->dir_inode);
  80929d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092a1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8092a4:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8092a8:	48 89 c7             	mov    rdi,rax
  8092ab:	e8 21 7f ff ff       	call   8011d1 <vmfree>
	vmfree(sb->root);
  8092b0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092b4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8092b7:	48 89 c7             	mov    rdi,rax
  8092ba:	e8 12 7f ff ff       	call   8011d1 <vmfree>
	vmfree(sb);
  8092bf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092c3:	48 89 c7             	mov    rdi,rax
  8092c6:	e8 06 7f ff ff       	call   8011d1 <vmfree>
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
  809329:	e8 fc 79 ff ff       	call   800d2a <printf>
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
  80936f:	e8 ce 7d ff ff       	call   801142 <vmalloc>
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
  80945e:	e8 6e 7d ff ff       	call   8011d1 <vmfree>
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
  8094a8:	e8 95 7c ff ff       	call   801142 <vmalloc>
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
  8094e2:	e8 5b 7c ff ff       	call   801142 <vmalloc>
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
  809652:	e8 d3 76 ff ff       	call   800d2a <printf>
	
	////fat32 fsinfo sector
	fsbi->fat_fsinfo = (struct FAT32_FSInfo *)vmalloc(sizeof(struct FAT32_FSInfo),0);
  809657:	be 00 00 00 00       	mov    esi,0x0
  80965c:	bf 00 02 00 00       	mov    edi,0x200
  809661:	b8 00 00 00 00       	mov    eax,0x0
  809666:	e8 d7 7a ff ff       	call   801142 <vmalloc>
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
  809704:	e8 21 76 ff ff       	call   800d2a <printf>
	
	////directory entry
	sbp->root = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  809709:	be 00 00 00 00       	mov    esi,0x0
  80970e:	bf 48 00 00 00       	mov    edi,0x48
  809713:	b8 00 00 00 00       	mov    eax,0x0
  809718:	e8 25 7a ff ff       	call   801142 <vmalloc>
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
  8097be:	e8 7f 79 ff ff       	call   801142 <vmalloc>
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
  8097fa:	e8 43 79 ff ff       	call   801142 <vmalloc>
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
  8098d9:	e8 64 78 ff ff       	call   801142 <vmalloc>
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
  809a36:	e8 ef 72 ff ff       	call   800d2a <printf>

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
  809c19:	e8 75 91 ff ff       	call   802d93 <reg_driver>
    reg_device(&dev_tty);
  809c1e:	bf 60 31 81 00       	mov    edi,0x813160
  809c23:	e8 83 8e ff ff       	call   802aab <reg_device>
    reg_device(&dev_stdout);
  809c28:	bf 20 32 81 00       	mov    edi,0x813220
  809c2d:	e8 79 8e ff ff       	call   802aab <reg_device>
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
  80acb0:	e8 1c 90 ff ff       	call   803cd1 <req_proc>
  80acb5:	83 f8 ff             	cmp    eax,0xffffffff
  80acb8:	74 0c                	je     80acc6 <create_zero.retu>
  80acba:	e8 0b 91 ff ff       	call   803dca <set_proc>
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
