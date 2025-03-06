
bin/test.elf:     file format elf64-x86-64


Disassembly of section .text:

0000000000400030 <__main>:


int a = 1, b = 2, c = 0;
// unsigned long long __bss_start__ = 0, __bss_end__ = 0;

int         __main() {}
  400030:	f3 0f 1e fa          	endbr64 
  400034:	55                   	push   rbp
  400035:	48 89 e5             	mov    rbp,rsp
  400038:	90                   	nop
  400039:	5d                   	pop    rbp
  40003a:	c3                   	ret    

000000000040003b <on_enter_pressed>:
char        text[128];
windowptr_t window, shellcontent;

void on_enter_pressed(struct _window* wndptr, int event_type, window_event_t* event)
{
  40003b:	f3 0f 1e fa          	endbr64 
  40003f:	55                   	push   rbp
  400040:	48 89 e5             	mov    rbp,rsp
  400043:	48 83 ec 20          	sub    rsp,0x20
  400047:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  40004b:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  40004e:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
    get_window_text(shellcontent, text, 128);
  400052:	48 8b 05 8f 17 00 00 	mov    rax,QWORD PTR [rip+0x178f]        # 4017e8 <shellcontent>
  400059:	ba 80 00 00 00       	mov    edx,0x80
  40005e:	48 8d 0d fb 16 00 00 	lea    rcx,[rip+0x16fb]        # 401760 <text>
  400065:	48 89 ce             	mov    rsi,rcx
  400068:	48 89 c7             	mov    rdi,rax
  40006b:	e8 e0 05 00 00       	call   400650 <get_window_text>
    strcat(text, "enter pressed\n");
  400070:	48 8d 05 e9 16 00 00 	lea    rax,[rip+0x16e9]        # 401760 <text>
  400077:	48 89 c7             	mov    rdi,rax
  40007a:	e8 61 06 00 00       	call   4006e0 <strlen>
  40007f:	48 89 c2             	mov    rdx,rax
  400082:	48 8d 05 d7 16 00 00 	lea    rax,[rip+0x16d7]        # 401760 <text>
  400089:	48 01 d0             	add    rax,rdx
  40008c:	48 b9 65 6e 74 65 72 	movabs rcx,0x7270207265746e65
  400093:	20 70 72 
  400096:	48 89 08             	mov    QWORD PTR [rax],rcx
  400099:	c7 40 08 65 73 73 65 	mov    DWORD PTR [rax+0x8],0x65737365
  4000a0:	66 c7 40 0c 64 0a    	mov    WORD PTR [rax+0xc],0xa64
  4000a6:	c6 40 0e 00          	mov    BYTE PTR [rax+0xe],0x0
    set_window_text(shellcontent, text);
  4000aa:	48 8b 05 37 17 00 00 	mov    rax,QWORD PTR [rip+0x1737]        # 4017e8 <shellcontent>
  4000b1:	48 8d 15 a8 16 00 00 	lea    rdx,[rip+0x16a8]        # 401760 <text>
  4000b8:	48 89 d6             	mov    rsi,rdx
  4000bb:	48 89 c7             	mov    rdi,rax
  4000be:	e8 2d 05 00 00       	call   4005f0 <set_window_text>
}
  4000c3:	90                   	nop
  4000c4:	c9                   	leave  
  4000c5:	c3                   	ret    

00000000004000c6 <main>:
// int   __stack_chk_fail() {}
int main(int argc, char** argv, char** environ)
{
  4000c6:	f3 0f 1e fa          	endbr64 
  4000ca:	55                   	push   rbp
  4000cb:	48 89 e5             	mov    rbp,rsp
  4000ce:	48 81 ec b0 01 00 00 	sub    rsp,0x1b0
  4000d5:	89 bd 6c fe ff ff    	mov    DWORD PTR [rbp-0x194],edi
  4000db:	48 89 b5 60 fe ff ff 	mov    QWORD PTR [rbp-0x1a0],rsi
  4000e2:	48 89 95 58 fe ff ff 	mov    QWORD PTR [rbp-0x1a8],rdx
    // write(2, as, strlenk(as));
    char* prepared_environ = {"os=gms"};
  4000e9:	48 8d 05 20 16 00 00 	lea    rax,[rip+0x1620]        # 401710 <b+0x4>
  4000f0:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    puts("Gamessis OS shell\n");
  4000f4:	48 8d 05 1c 16 00 00 	lea    rax,[rip+0x161c]        # 401717 <b+0xb>
  4000fb:	48 89 c7             	mov    rdi,rax
  4000fe:	e8 7d 05 00 00       	call   400680 <puts>
    char cmd[128]  = {0};
  400103:	48 c7 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],0x0
  40010a:	00 00 00 00 
  40010e:	48 c7 45 80 00 00 00 	mov    QWORD PTR [rbp-0x80],0x0
  400115:	00 
  400116:	48 c7 45 88 00 00 00 	mov    QWORD PTR [rbp-0x78],0x0
  40011d:	00 
  40011e:	48 c7 45 90 00 00 00 	mov    QWORD PTR [rbp-0x70],0x0
  400125:	00 
  400126:	48 c7 45 98 00 00 00 	mov    QWORD PTR [rbp-0x68],0x0
  40012d:	00 
  40012e:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
  400135:	00 
  400136:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
  40013d:	00 
  40013e:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  400145:	00 
  400146:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  40014d:	00 
  40014e:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  400155:	00 
  400156:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  40015d:	00 
  40015e:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  400165:	00 
  400166:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  40016d:	00 
  40016e:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  400175:	00 
  400176:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  40017d:	00 
  40017e:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  400185:	00 
    char path[128] = "/";
  400186:	48 c7 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],0x2f
  40018d:	2f 00 00 00 
  400191:	48 c7 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],0x0
  400198:	00 00 00 00 
  40019c:	48 c7 85 08 ff ff ff 	mov    QWORD PTR [rbp-0xf8],0x0
  4001a3:	00 00 00 00 
  4001a7:	48 c7 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],0x0
  4001ae:	00 00 00 00 
  4001b2:	48 c7 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],0x0
  4001b9:	00 00 00 00 
  4001bd:	48 c7 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],0x0
  4001c4:	00 00 00 00 
  4001c8:	48 c7 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],0x0
  4001cf:	00 00 00 00 
  4001d3:	48 c7 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],0x0
  4001da:	00 00 00 00 
  4001de:	48 c7 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],0x0
  4001e5:	00 00 00 00 
  4001e9:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x0
  4001f0:	00 00 00 00 
  4001f4:	48 c7 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],0x0
  4001fb:	00 00 00 00 
  4001ff:	48 c7 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],0x0
  400206:	00 00 00 00 
  40020a:	48 c7 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],0x0
  400211:	00 00 00 00 
  400215:	48 c7 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],0x0
  40021c:	00 00 00 00 
  400220:	48 c7 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],0x0
  400227:	00 00 00 00 
  40022b:	48 c7 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],0x0
  400232:	00 00 00 00 
    window         = create_window("Shell", WNDTYPE_WINDOW);
  400236:	be 00 00 00 00       	mov    esi,0x0
  40023b:	48 8d 05 e8 14 00 00 	lea    rax,[rip+0x14e8]        # 40172a <b+0x1e>
  400242:	48 89 c7             	mov    rdi,rax
  400245:	e8 46 03 00 00       	call   400590 <create_window>
  40024a:	48 89 05 8f 15 00 00 	mov    QWORD PTR [rip+0x158f],rax        # 4017e0 <window>
    shellcontent   = create_window("SHELL", WNDTYPE_EDITBOX);
  400251:	be 03 00 00 00       	mov    esi,0x3
  400256:	48 8d 05 d3 14 00 00 	lea    rax,[rip+0x14d3]        # 401730 <b+0x24>
  40025d:	48 89 c7             	mov    rdi,rax
  400260:	e8 2b 03 00 00       	call   400590 <create_window>
  400265:	48 89 05 7c 15 00 00 	mov    QWORD PTR [rip+0x157c],rax        # 4017e8 <shellcontent>
    resize_window(shellcontent, 200, 190);
  40026c:	48 8b 05 75 15 00 00 	mov    rax,QWORD PTR [rip+0x1575]        # 4017e8 <shellcontent>
  400273:	ba be 00 00 00       	mov    edx,0xbe
  400278:	be c8 00 00 00       	mov    esi,0xc8
  40027d:	48 89 c7             	mov    rdi,rax
  400280:	e8 4b 03 00 00       	call   4005d0 <resize_window>
    move_window(shellcontent, 0, 30);
  400285:	48 8b 05 5c 15 00 00 	mov    rax,QWORD PTR [rip+0x155c]        # 4017e8 <shellcontent>
  40028c:	ba 1e 00 00 00       	mov    edx,0x1e
  400291:	be 00 00 00 00       	mov    esi,0x0
  400296:	48 89 c7             	mov    rdi,rax
  400299:	e8 42 03 00 00       	call   4005e0 <move_window>
    attach_window(shellcontent, window);
  40029e:	48 8b 15 3b 15 00 00 	mov    rdx,QWORD PTR [rip+0x153b]        # 4017e0 <window>
  4002a5:	48 8b 05 3c 15 00 00 	mov    rax,QWORD PTR [rip+0x153c]        # 4017e8 <shellcontent>
  4002ac:	48 89 d6             	mov    rsi,rdx
  4002af:	48 89 c7             	mov    rdi,rax
  4002b2:	e8 49 03 00 00       	call   400600 <attach_window>
    show_window(shellcontent);
  4002b7:	48 8b 05 2a 15 00 00 	mov    rax,QWORD PTR [rip+0x152a]        # 4017e8 <shellcontent>
  4002be:	48 89 c7             	mov    rdi,rax
  4002c1:	e8 ea 02 00 00       	call   4005b0 <show_window>
    show_window(window);
  4002c6:	48 8b 05 13 15 00 00 	mov    rax,QWORD PTR [rip+0x1513]        # 4017e0 <window>
  4002cd:	48 89 c7             	mov    rdi,rax
  4002d0:	e8 db 02 00 00       	call   4005b0 <show_window>
    // add_window_event_listener(shellcontent, WND_EVENT_KEY_DOWN, on_enter_pressed);
    while (1) {
        window_event_t event;
        if (fetch_event(&event) == 0) {
  4002d5:	48 8d 85 70 fe ff ff 	lea    rax,[rbp-0x190]
  4002dc:	48 89 c7             	mov    rdi,rax
  4002df:	b8 00 00 00 00       	mov    eax,0x0
  4002e4:	e8 77 03 00 00       	call   400660 <fetch_event>
  4002e9:	85 c0                	test   eax,eax
  4002eb:	75 e8                	jne    4002d5 <main+0x20f>
            switch (event.event_type) {
  4002ed:	8b 85 80 fe ff ff    	mov    eax,DWORD PTR [rbp-0x180]
  4002f3:	83 f8 06             	cmp    eax,0x6
  4002f6:	75 20                	jne    400318 <main+0x252>
            case WND_EVENT_KEY_DOWN:
                on_enter_pressed(shellcontent, event.event_type, &event);
  4002f8:	8b 8d 80 fe ff ff    	mov    ecx,DWORD PTR [rbp-0x180]
  4002fe:	48 8b 05 e3 14 00 00 	mov    rax,QWORD PTR [rip+0x14e3]        # 4017e8 <shellcontent>
  400305:	48 8d 95 70 fe ff ff 	lea    rdx,[rbp-0x190]
  40030c:	89 ce                	mov    esi,ecx
  40030e:	48 89 c7             	mov    rdi,rax
  400311:	e8 25 fd ff ff       	call   40003b <on_enter_pressed>
                break;
  400316:	eb 10                	jmp    400328 <main+0x262>
            default: default_deal_window_event(&event); break;
  400318:	48 8d 85 70 fe ff ff 	lea    rax,[rbp-0x190]
  40031f:	48 89 c7             	mov    rdi,rax
  400322:	e8 49 03 00 00       	call   400670 <default_deal_window_event>
  400327:	90                   	nop
    while (1) {
  400328:	eb ab                	jmp    4002d5 <main+0x20f>
  40032a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000400330 <reg_dev>:
  400330:	55                   	push   rbp
  400331:	48 89 e5             	mov    rbp,rsp
  400334:	b8 00 00 00 00       	mov    eax,0x0
  400339:	55                   	push   rbp
  40033a:	48 0f 05             	rex.W syscall 
  40033d:	5d                   	pop    rbp
  40033e:	c9                   	leave  
  40033f:	c3                   	ret    

0000000000400340 <dispose_dev>:
  400340:	55                   	push   rbp
  400341:	48 89 e5             	mov    rbp,rsp
  400344:	b8 01 00 00 00       	mov    eax,0x1
  400349:	55                   	push   rbp
  40034a:	48 0f 05             	rex.W syscall 
  40034d:	5d                   	pop    rbp
  40034e:	c9                   	leave  
  40034f:	c3                   	ret    

0000000000400350 <reg_drv>:
  400350:	55                   	push   rbp
  400351:	48 89 e5             	mov    rbp,rsp
  400354:	b8 02 00 00 00       	mov    eax,0x2
  400359:	55                   	push   rbp
  40035a:	48 0f 05             	rex.W syscall 
  40035d:	5d                   	pop    rbp
  40035e:	c9                   	leave  
  40035f:	c3                   	ret    

0000000000400360 <dispose_drv>:
  400360:	55                   	push   rbp
  400361:	48 89 e5             	mov    rbp,rsp
  400364:	b8 03 00 00 00       	mov    eax,0x3
  400369:	55                   	push   rbp
  40036a:	48 0f 05             	rex.W syscall 
  40036d:	5d                   	pop    rbp
  40036e:	c9                   	leave  
  40036f:	c3                   	ret    

0000000000400370 <call_drvfunc>:
  400370:	55                   	push   rbp
  400371:	48 89 e5             	mov    rbp,rsp
  400374:	b8 04 00 00 00       	mov    eax,0x4
  400379:	55                   	push   rbp
  40037a:	48 0f 05             	rex.W syscall 
  40037d:	5d                   	pop    rbp
  40037e:	c9                   	leave  
  40037f:	c3                   	ret    

0000000000400380 <req_mem>:
  400380:	55                   	push   rbp
  400381:	48 89 e5             	mov    rbp,rsp
  400384:	b8 05 00 00 00       	mov    eax,0x5
  400389:	55                   	push   rbp
  40038a:	48 0f 05             	rex.W syscall 
  40038d:	5d                   	pop    rbp
  40038e:	c9                   	leave  
  40038f:	c3                   	ret    

0000000000400390 <free_mem>:
  400390:	55                   	push   rbp
  400391:	48 89 e5             	mov    rbp,rsp
  400394:	b8 06 00 00 00       	mov    eax,0x6
  400399:	55                   	push   rbp
  40039a:	48 0f 05             	rex.W syscall 
  40039d:	5d                   	pop    rbp
  40039e:	c9                   	leave  
  40039f:	c3                   	ret    

00000000004003a0 <reg_proc>:
  4003a0:	55                   	push   rbp
  4003a1:	48 89 e5             	mov    rbp,rsp
  4003a4:	b8 07 00 00 00       	mov    eax,0x7
  4003a9:	55                   	push   rbp
  4003aa:	48 0f 05             	rex.W syscall 
  4003ad:	5d                   	pop    rbp
  4003ae:	c9                   	leave  
  4003af:	c3                   	ret    

00000000004003b0 <del_proc>:
  4003b0:	55                   	push   rbp
  4003b1:	48 89 e5             	mov    rbp,rsp
  4003b4:	b8 08 00 00 00       	mov    eax,0x8
  4003b9:	55                   	push   rbp
  4003ba:	48 0f 05             	rex.W syscall 
  4003bd:	5d                   	pop    rbp
  4003be:	c9                   	leave  
  4003bf:	c3                   	ret    

00000000004003c0 <get_proc_addr>:
  4003c0:	55                   	push   rbp
  4003c1:	48 89 e5             	mov    rbp,rsp
  4003c4:	b8 09 00 00 00       	mov    eax,0x9
  4003c9:	55                   	push   rbp
  4003ca:	48 0f 05             	rex.W syscall 
  4003cd:	5d                   	pop    rbp
  4003ce:	c9                   	leave  
  4003cf:	c3                   	ret    

00000000004003d0 <chk_vm>:
  4003d0:	55                   	push   rbp
  4003d1:	48 89 e5             	mov    rbp,rsp
  4003d4:	b8 0a 00 00 00       	mov    eax,0xa
  4003d9:	55                   	push   rbp
  4003da:	48 0f 05             	rex.W syscall 
  4003dd:	5d                   	pop    rbp
  4003de:	c9                   	leave  
  4003df:	c3                   	ret    

00000000004003e0 <open>:
  4003e0:	55                   	push   rbp
  4003e1:	48 89 e5             	mov    rbp,rsp
  4003e4:	b8 0b 00 00 00       	mov    eax,0xb
  4003e9:	55                   	push   rbp
  4003ea:	48 0f 05             	rex.W syscall 
  4003ed:	5d                   	pop    rbp
  4003ee:	c9                   	leave  
  4003ef:	c3                   	ret    

00000000004003f0 <close>:
  4003f0:	55                   	push   rbp
  4003f1:	48 89 e5             	mov    rbp,rsp
  4003f4:	b8 0c 00 00 00       	mov    eax,0xc
  4003f9:	55                   	push   rbp
  4003fa:	48 0f 05             	rex.W syscall 
  4003fd:	5d                   	pop    rbp
  4003fe:	c9                   	leave  
  4003ff:	c3                   	ret    

0000000000400400 <read>:
  400400:	55                   	push   rbp
  400401:	48 89 e5             	mov    rbp,rsp
  400404:	b8 0d 00 00 00       	mov    eax,0xd
  400409:	55                   	push   rbp
  40040a:	48 0f 05             	rex.W syscall 
  40040d:	5d                   	pop    rbp
  40040e:	c9                   	leave  
  40040f:	c3                   	ret    

0000000000400410 <write>:
  400410:	55                   	push   rbp
  400411:	48 89 e5             	mov    rbp,rsp
  400414:	b8 0e 00 00 00       	mov    eax,0xe
  400419:	55                   	push   rbp
  40041a:	48 0f 05             	rex.W syscall 
  40041d:	5d                   	pop    rbp
  40041e:	c9                   	leave  
  40041f:	c3                   	ret    

0000000000400420 <seek>:
  400420:	55                   	push   rbp
  400421:	48 89 e5             	mov    rbp,rsp
  400424:	b8 0f 00 00 00       	mov    eax,0xf
  400429:	55                   	push   rbp
  40042a:	48 0f 05             	rex.W syscall 
  40042d:	5d                   	pop    rbp
  40042e:	c9                   	leave  
  40042f:	c3                   	ret    

0000000000400430 <tell>:
  400430:	55                   	push   rbp
  400431:	48 89 e5             	mov    rbp,rsp
  400434:	b8 10 00 00 00       	mov    eax,0x10
  400439:	55                   	push   rbp
  40043a:	48 0f 05             	rex.W syscall 
  40043d:	5d                   	pop    rbp
  40043e:	c9                   	leave  
  40043f:	c3                   	ret    

0000000000400440 <reg_vol>:
  400440:	55                   	push   rbp
  400441:	48 89 e5             	mov    rbp,rsp
  400444:	b8 11 00 00 00       	mov    eax,0x11
  400449:	55                   	push   rbp
  40044a:	48 0f 05             	rex.W syscall 
  40044d:	5d                   	pop    rbp
  40044e:	c9                   	leave  
  40044f:	c3                   	ret    

0000000000400450 <free_vol>:
  400450:	55                   	push   rbp
  400451:	48 89 e5             	mov    rbp,rsp
  400454:	b8 12 00 00 00       	mov    eax,0x12
  400459:	55                   	push   rbp
  40045a:	48 0f 05             	rex.W syscall 
  40045d:	5d                   	pop    rbp
  40045e:	c9                   	leave  
  40045f:	c3                   	ret    

0000000000400460 <exec>:
  400460:	55                   	push   rbp
  400461:	48 89 e5             	mov    rbp,rsp
  400464:	b8 13 00 00 00       	mov    eax,0x13
  400469:	55                   	push   rbp
  40046a:	48 0f 05             	rex.W syscall 
  40046d:	5d                   	pop    rbp
  40046e:	c9                   	leave  
  40046f:	c3                   	ret    

0000000000400470 <exit>:
  400470:	55                   	push   rbp
  400471:	48 89 e5             	mov    rbp,rsp
  400474:	b8 14 00 00 00       	mov    eax,0x14
  400479:	55                   	push   rbp
  40047a:	48 0f 05             	rex.W syscall 
  40047d:	5d                   	pop    rbp
  40047e:	c9                   	leave  
  40047f:	c3                   	ret    

0000000000400480 <abort>:
  400480:	55                   	push   rbp
  400481:	48 89 e5             	mov    rbp,rsp
  400484:	b8 14 00 00 00       	mov    eax,0x14
  400489:	55                   	push   rbp
  40048a:	48 0f 05             	rex.W syscall 
  40048d:	5d                   	pop    rbp
  40048e:	c9                   	leave  
  40048f:	c3                   	ret    

0000000000400490 <call>:
  400490:	55                   	push   rbp
  400491:	48 89 e5             	mov    rbp,rsp
  400494:	b8 15 00 00 00       	mov    eax,0x15
  400499:	55                   	push   rbp
  40049a:	48 0f 05             	rex.W syscall 
  40049d:	5d                   	pop    rbp
  40049e:	c9                   	leave  
  40049f:	c3                   	ret    

00000000004004a0 <mkfifo>:
  4004a0:	55                   	push   rbp
  4004a1:	48 89 e5             	mov    rbp,rsp
  4004a4:	b8 16 00 00 00       	mov    eax,0x16
  4004a9:	55                   	push   rbp
  4004aa:	48 0f 05             	rex.W syscall 
  4004ad:	5d                   	pop    rbp
  4004ae:	c9                   	leave  
  4004af:	c3                   	ret    

00000000004004b0 <brk>:
  4004b0:	55                   	push   rbp
  4004b1:	48 89 e5             	mov    rbp,rsp
  4004b4:	b8 17 00 00 00       	mov    eax,0x17
  4004b9:	55                   	push   rbp
  4004ba:	48 0f 05             	rex.W syscall 
  4004bd:	5d                   	pop    rbp
  4004be:	c9                   	leave  
  4004bf:	c3                   	ret    

00000000004004c0 <find_dev>:
  4004c0:	55                   	push   rbp
  4004c1:	48 89 e5             	mov    rbp,rsp
  4004c4:	b8 19 00 00 00       	mov    eax,0x19
  4004c9:	55                   	push   rbp
  4004ca:	48 0f 05             	rex.W syscall 
  4004cd:	5d                   	pop    rbp
  4004ce:	c9                   	leave  
  4004cf:	c3                   	ret    

00000000004004d0 <operate_dev>:
  4004d0:	55                   	push   rbp
  4004d1:	48 89 e5             	mov    rbp,rsp
  4004d4:	b8 1a 00 00 00       	mov    eax,0x1a
  4004d9:	55                   	push   rbp
  4004da:	48 0f 05             	rex.W syscall 
  4004dd:	5d                   	pop    rbp
  4004de:	c9                   	leave  
  4004df:	c3                   	ret    

00000000004004e0 <fork>:
  4004e0:	55                   	push   rbp
  4004e1:	48 89 e5             	mov    rbp,rsp
  4004e4:	b8 1b 00 00 00       	mov    eax,0x1b
  4004e9:	55                   	push   rbp
  4004ea:	48 0f 05             	rex.W syscall 
  4004ed:	5d                   	pop    rbp
  4004ee:	c9                   	leave  
  4004ef:	c3                   	ret    

00000000004004f0 <execve>:
  4004f0:	55                   	push   rbp
  4004f1:	48 89 e5             	mov    rbp,rsp
  4004f4:	b8 1c 00 00 00       	mov    eax,0x1c
  4004f9:	55                   	push   rbp
  4004fa:	48 0f 05             	rex.W syscall 
  4004fd:	5d                   	pop    rbp
  4004fe:	c9                   	leave  
  4004ff:	c3                   	ret    

0000000000400500 <waitpid>:
  400500:	55                   	push   rbp
  400501:	48 89 e5             	mov    rbp,rsp
  400504:	b8 1d 00 00 00       	mov    eax,0x1d
  400509:	55                   	push   rbp
  40050a:	48 0f 05             	rex.W syscall 
  40050d:	5d                   	pop    rbp
  40050e:	c9                   	leave  
  40050f:	c3                   	ret    

0000000000400510 <mmap>:
  400510:	55                   	push   rbp
  400511:	48 89 e5             	mov    rbp,rsp
  400514:	b8 1e 00 00 00       	mov    eax,0x1e
  400519:	55                   	push   rbp
  40051a:	48 0f 05             	rex.W syscall 
  40051d:	5d                   	pop    rbp
  40051e:	c9                   	leave  
  40051f:	c3                   	ret    

0000000000400520 <munmap>:
  400520:	55                   	push   rbp
  400521:	48 89 e5             	mov    rbp,rsp
  400524:	b8 1f 00 00 00       	mov    eax,0x1f
  400529:	55                   	push   rbp
  40052a:	48 0f 05             	rex.W syscall 
  40052d:	5d                   	pop    rbp
  40052e:	c9                   	leave  
  40052f:	c3                   	ret    

0000000000400530 <mknod>:
  400530:	55                   	push   rbp
  400531:	48 89 e5             	mov    rbp,rsp
  400534:	b8 21 00 00 00       	mov    eax,0x21
  400539:	55                   	push   rbp
  40053a:	48 0f 05             	rex.W syscall 
  40053d:	5d                   	pop    rbp
  40053e:	c9                   	leave  
  40053f:	c3                   	ret    

0000000000400540 <kb_readc>:
  400540:	55                   	push   rbp
  400541:	48 89 e5             	mov    rbp,rsp
  400544:	b8 64 00 00 00       	mov    eax,0x64
  400549:	55                   	push   rbp
  40054a:	48 0f 05             	rex.W syscall 
  40054d:	5d                   	pop    rbp
  40054e:	c9                   	leave  
  40054f:	c3                   	ret    

0000000000400550 <remove>:
  400550:	55                   	push   rbp
  400551:	48 89 e5             	mov    rbp,rsp
  400554:	b8 22 00 00 00       	mov    eax,0x22
  400559:	55                   	push   rbp
  40055a:	48 0f 05             	rex.W syscall 
  40055d:	5d                   	pop    rbp
  40055e:	c9                   	leave  
  40055f:	c3                   	ret    

0000000000400560 <sbrk>:
  400560:	55                   	push   rbp
  400561:	48 89 e5             	mov    rbp,rsp
  400564:	b8 23 00 00 00       	mov    eax,0x23
  400569:	55                   	push   rbp
  40056a:	48 0f 05             	rex.W syscall 
  40056d:	5d                   	pop    rbp
  40056e:	c9                   	leave  
  40056f:	c3                   	ret    

0000000000400570 <chkmmap>:
  400570:	55                   	push   rbp
  400571:	48 89 e5             	mov    rbp,rsp
  400574:	b8 24 00 00 00       	mov    eax,0x24
  400579:	55                   	push   rbp
  40057a:	48 0f 05             	rex.W syscall 
  40057d:	5d                   	pop    rbp
  40057e:	c9                   	leave  
  40057f:	c3                   	ret    

0000000000400580 <_readdir>:
  400580:	55                   	push   rbp
  400581:	48 89 e5             	mov    rbp,rsp
  400584:	b8 25 00 00 00       	mov    eax,0x25
  400589:	55                   	push   rbp
  40058a:	48 0f 05             	rex.W syscall 
  40058d:	5d                   	pop    rbp
  40058e:	c9                   	leave  
  40058f:	c3                   	ret    

0000000000400590 <create_window>:
  400590:	55                   	push   rbp
  400591:	48 89 e5             	mov    rbp,rsp
  400594:	b8 65 00 00 00       	mov    eax,0x65
  400599:	55                   	push   rbp
  40059a:	48 0f 05             	rex.W syscall 
  40059d:	5d                   	pop    rbp
  40059e:	c9                   	leave  
  40059f:	c3                   	ret    

00000000004005a0 <destroy_window>:
  4005a0:	55                   	push   rbp
  4005a1:	48 89 e5             	mov    rbp,rsp
  4005a4:	b8 66 00 00 00       	mov    eax,0x66
  4005a9:	55                   	push   rbp
  4005aa:	48 0f 05             	rex.W syscall 
  4005ad:	5d                   	pop    rbp
  4005ae:	c9                   	leave  
  4005af:	c3                   	ret    

00000000004005b0 <show_window>:
  4005b0:	55                   	push   rbp
  4005b1:	48 89 e5             	mov    rbp,rsp
  4005b4:	b8 67 00 00 00       	mov    eax,0x67
  4005b9:	55                   	push   rbp
  4005ba:	48 0f 05             	rex.W syscall 
  4005bd:	5d                   	pop    rbp
  4005be:	c9                   	leave  
  4005bf:	c3                   	ret    

00000000004005c0 <hide_window>:
  4005c0:	55                   	push   rbp
  4005c1:	48 89 e5             	mov    rbp,rsp
  4005c4:	b8 68 00 00 00       	mov    eax,0x68
  4005c9:	55                   	push   rbp
  4005ca:	48 0f 05             	rex.W syscall 
  4005cd:	5d                   	pop    rbp
  4005ce:	c9                   	leave  
  4005cf:	c3                   	ret    

00000000004005d0 <resize_window>:
  4005d0:	55                   	push   rbp
  4005d1:	48 89 e5             	mov    rbp,rsp
  4005d4:	b8 69 00 00 00       	mov    eax,0x69
  4005d9:	55                   	push   rbp
  4005da:	48 0f 05             	rex.W syscall 
  4005dd:	5d                   	pop    rbp
  4005de:	c9                   	leave  
  4005df:	c3                   	ret    

00000000004005e0 <move_window>:
  4005e0:	55                   	push   rbp
  4005e1:	48 89 e5             	mov    rbp,rsp
  4005e4:	b8 6a 00 00 00       	mov    eax,0x6a
  4005e9:	55                   	push   rbp
  4005ea:	48 0f 05             	rex.W syscall 
  4005ed:	5d                   	pop    rbp
  4005ee:	c9                   	leave  
  4005ef:	c3                   	ret    

00000000004005f0 <set_window_text>:
  4005f0:	55                   	push   rbp
  4005f1:	48 89 e5             	mov    rbp,rsp
  4005f4:	b8 6b 00 00 00       	mov    eax,0x6b
  4005f9:	55                   	push   rbp
  4005fa:	48 0f 05             	rex.W syscall 
  4005fd:	5d                   	pop    rbp
  4005fe:	c9                   	leave  
  4005ff:	c3                   	ret    

0000000000400600 <attach_window>:
  400600:	55                   	push   rbp
  400601:	48 89 e5             	mov    rbp,rsp
  400604:	b8 6c 00 00 00       	mov    eax,0x6c
  400609:	55                   	push   rbp
  40060a:	48 0f 05             	rex.W syscall 
  40060d:	5d                   	pop    rbp
  40060e:	c9                   	leave  
  40060f:	c3                   	ret    

0000000000400610 <detach_window>:
  400610:	55                   	push   rbp
  400611:	48 89 e5             	mov    rbp,rsp
  400614:	b8 6d 00 00 00       	mov    eax,0x6d
  400619:	55                   	push   rbp
  40061a:	48 0f 05             	rex.W syscall 
  40061d:	5d                   	pop    rbp
  40061e:	c9                   	leave  
  40061f:	c3                   	ret    

0000000000400620 <add_window_event_listener>:
  400620:	55                   	push   rbp
  400621:	48 89 e5             	mov    rbp,rsp
  400624:	b8 6e 00 00 00       	mov    eax,0x6e
  400629:	55                   	push   rbp
  40062a:	48 0f 05             	rex.W syscall 
  40062d:	5d                   	pop    rbp
  40062e:	c9                   	leave  
  40062f:	c3                   	ret    

0000000000400630 <remove_window_event_listener>:
  400630:	55                   	push   rbp
  400631:	48 89 e5             	mov    rbp,rsp
  400634:	b8 6f 00 00 00       	mov    eax,0x6f
  400639:	55                   	push   rbp
  40063a:	48 0f 05             	rex.W syscall 
  40063d:	5d                   	pop    rbp
  40063e:	c9                   	leave  
  40063f:	c3                   	ret    

0000000000400640 <send_window_event>:
  400640:	55                   	push   rbp
  400641:	48 89 e5             	mov    rbp,rsp
  400644:	b8 70 00 00 00       	mov    eax,0x70
  400649:	55                   	push   rbp
  40064a:	48 0f 05             	rex.W syscall 
  40064d:	5d                   	pop    rbp
  40064e:	c9                   	leave  
  40064f:	c3                   	ret    

0000000000400650 <get_window_text>:
  400650:	55                   	push   rbp
  400651:	48 89 e5             	mov    rbp,rsp
  400654:	b8 71 00 00 00       	mov    eax,0x71
  400659:	55                   	push   rbp
  40065a:	48 0f 05             	rex.W syscall 
  40065d:	5d                   	pop    rbp
  40065e:	c9                   	leave  
  40065f:	c3                   	ret    

0000000000400660 <fetch_event>:
  400660:	55                   	push   rbp
  400661:	48 89 e5             	mov    rbp,rsp
  400664:	b8 72 00 00 00       	mov    eax,0x72
  400669:	55                   	push   rbp
  40066a:	48 0f 05             	rex.W syscall 
  40066d:	5d                   	pop    rbp
  40066e:	c9                   	leave  
  40066f:	c3                   	ret    

0000000000400670 <default_deal_window_event>:
  400670:	55                   	push   rbp
  400671:	48 89 e5             	mov    rbp,rsp
  400674:	b8 73 00 00 00       	mov    eax,0x73
  400679:	55                   	push   rbp
  40067a:	48 0f 05             	rex.W syscall 
  40067d:	5d                   	pop    rbp
  40067e:	c9                   	leave  
  40067f:	c3                   	ret    

Disassembly of section .text.puts:

0000000000400680 <puts>:
#include <stdio.h>

int puts(const char* str)
{
  400680:	f3 0f 1e fa          	endbr64 
  400684:	41 54                	push   r12
  400686:	55                   	push   rbp
  400687:	48 89 fd             	mov    rbp,rdi
  40068a:	53                   	push   rbx
	int r = 0;

	for(const char* c = str; *c != 0; c++)
  40068b:	0f be 3f             	movsx  edi,BYTE PTR [rdi]
  40068e:	40 84 ff             	test   dil,dil
  400691:	74 35                	je     4006c8 <puts+0x48>
  400693:	31 db                	xor    ebx,ebx
  400695:	0f 1f 00             	nop    DWORD PTR [rax]
	{
		putchar((int)*c);
  400698:	e8 43 02 00 00       	call   4008e0 <putchar>
  40069d:	41 89 dc             	mov    r12d,ebx
	for(const char* c = str; *c != 0; c++)
  4006a0:	48 83 c3 01          	add    rbx,0x1
  4006a4:	0f be 7c 1d 00       	movsx  edi,BYTE PTR [rbp+rbx*1+0x0]
  4006a9:	40 84 ff             	test   dil,dil
  4006ac:	75 ea                	jne    400698 <puts+0x18>
	}

	// puts adds a newline
	if(r)
	{
		putchar('\n');
  4006ae:	bf 0a 00 00 00       	mov    edi,0xa
  4006b3:	e8 28 02 00 00       	call   4008e0 <putchar>
		r++;
  4006b8:	41 8d 44 24 02       	lea    eax,[r12+0x2]
	}

	return r ? r : EOF;
}
  4006bd:	5b                   	pop    rbx
  4006be:	5d                   	pop    rbp
  4006bf:	41 5c                	pop    r12
  4006c1:	c3                   	ret    
  4006c2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4006c8:	5b                   	pop    rbx
	return r ? r : EOF;
  4006c9:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  4006ce:	5d                   	pop    rbp
  4006cf:	41 5c                	pop    r12
  4006d1:	c3                   	ret    

Disassembly of section .text.strlen:

00000000004006e0 <strlen>:
		if(p[x] == '\0')                                \
			return ((uintptr_t)p - (uintptr_t)str + x); \
	} while(0)

size_t strlen(const char* str)
{
  4006e0:	f3 0f 1e fa          	endbr64 
	const char* p;
	const unsigned long* lp;

	/* Skip the first few bytes until we have an aligned p */
	for(p = str; (uintptr_t)p & LONGPTR_MASK; p++)
  4006e4:	48 89 fe             	mov    rsi,rdi
  4006e7:	40 f6 c7 07          	test   dil,0x7
  4006eb:	75 0d                	jne    4006fa <strlen+0x1a>
  4006ed:	eb 21                	jmp    400710 <strlen+0x30>
  4006ef:	90                   	nop
  4006f0:	48 83 c7 01          	add    rdi,0x1
  4006f4:	40 f6 c7 07          	test   dil,0x7
  4006f8:	74 16                	je     400710 <strlen+0x30>
	{
		if(*p == '\0')
  4006fa:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
  4006fd:	75 f1                	jne    4006f0 <strlen+0x10>
	for(lp = (const unsigned long*)(const void*)p;; lp++)
	{
		if((*lp - mask01) & mask80)
		{
			p = (const char*)(lp);
			testbyte(0);
  4006ff:	48 89 f8             	mov    rax,rdi
  400702:	48 29 f0             	sub    rax,rsi
  400705:	c3                   	ret    
  400706:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40070d:	00 00 00 
		if((*lp - mask01) & mask80)
  400710:	48 b9 ff fe fe fe fe 	movabs rcx,0xfefefefefefefeff
  400717:	fe fe fe 
  40071a:	48 ba 80 80 80 80 80 	movabs rdx,0x8080808080808080
  400721:	80 80 80 
  400724:	eb 38                	jmp    40075e <strlen+0x7e>
  400726:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40072d:	00 00 00 
			testbyte(1);
  400730:	80 7f 01 00          	cmp    BYTE PTR [rdi+0x1],0x0
  400734:	74 3a                	je     400770 <strlen+0x90>
			testbyte(2);
  400736:	80 7f 02 00          	cmp    BYTE PTR [rdi+0x2],0x0
  40073a:	74 3c                	je     400778 <strlen+0x98>
			testbyte(3);
  40073c:	80 7f 03 00          	cmp    BYTE PTR [rdi+0x3],0x0
  400740:	74 3e                	je     400780 <strlen+0xa0>
#if(LONG_BIT >= 64)
			testbyte(4);
  400742:	80 7f 04 00          	cmp    BYTE PTR [rdi+0x4],0x0
  400746:	74 40                	je     400788 <strlen+0xa8>
			testbyte(5);
  400748:	80 7f 05 00          	cmp    BYTE PTR [rdi+0x5],0x0
  40074c:	74 42                	je     400790 <strlen+0xb0>
			testbyte(6);
  40074e:	80 7f 06 00          	cmp    BYTE PTR [rdi+0x6],0x0
  400752:	74 44                	je     400798 <strlen+0xb8>
			testbyte(7);
  400754:	80 7f 07 00          	cmp    BYTE PTR [rdi+0x7],0x0
  400758:	74 46                	je     4007a0 <strlen+0xc0>
	for(lp = (const unsigned long*)(const void*)p;; lp++)
  40075a:	48 83 c7 08          	add    rdi,0x8
		if((*lp - mask01) & mask80)
  40075e:	48 8b 07             	mov    rax,QWORD PTR [rdi]
  400761:	48 01 c8             	add    rax,rcx
  400764:	48 85 d0             	test   rax,rdx
  400767:	74 f1                	je     40075a <strlen+0x7a>
			testbyte(0);
  400769:	80 3f 00             	cmp    BYTE PTR [rdi],0x0
  40076c:	75 c2                	jne    400730 <strlen+0x50>
  40076e:	eb 8f                	jmp    4006ff <strlen+0x1f>
			testbyte(1);
  400770:	48 29 f7             	sub    rdi,rsi
  400773:	48 8d 47 01          	lea    rax,[rdi+0x1]
  400777:	c3                   	ret    
			testbyte(2);
  400778:	48 29 f7             	sub    rdi,rsi
  40077b:	48 8d 47 02          	lea    rax,[rdi+0x2]
  40077f:	c3                   	ret    
			testbyte(3);
  400780:	48 29 f7             	sub    rdi,rsi
  400783:	48 8d 47 03          	lea    rax,[rdi+0x3]
  400787:	c3                   	ret    
			testbyte(4);
  400788:	48 29 f7             	sub    rdi,rsi
  40078b:	48 8d 47 04          	lea    rax,[rdi+0x4]
  40078f:	c3                   	ret    
			testbyte(5);
  400790:	48 29 f7             	sub    rdi,rsi
  400793:	48 8d 47 05          	lea    rax,[rdi+0x5]
  400797:	c3                   	ret    
			testbyte(6);
  400798:	48 29 f7             	sub    rdi,rsi
  40079b:	48 8d 47 06          	lea    rax,[rdi+0x6]
  40079f:	c3                   	ret    
			testbyte(7);
  4007a0:	48 29 f7             	sub    rdi,rsi
  4007a3:	48 8d 47 07          	lea    rax,[rdi+0x7]
		}
	}

	/* NOTREACHED */
	// return (0);
}
  4007a7:	c3                   	ret    

Disassembly of section .text.__libc_init_array:

00000000004007b0 <__libc_init_array>:
	return main(argc, argv, _environ);
}

// This function may call another function which changes __stack_chk_guard
__attribute__((no_stack_protector)) void __libc_init_array(void)
{
  4007b0:	f3 0f 1e fa          	endbr64 
  4007b4:	41 54                	push   r12
	size_t count = (size_t)(__preinit_array_end - __preinit_array_start);
  4007b6:	49 c7 c4 00 00 00 00 	mov    r12,0x0
{
  4007bd:	55                   	push   rbp
	size_t count = (size_t)(__preinit_array_end - __preinit_array_start);
  4007be:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
{
  4007c5:	53                   	push   rbx
	size_t count = (size_t)(__preinit_array_end - __preinit_array_start);
  4007c6:	4c 29 e5             	sub    rbp,r12
	for(size_t i = 0; i < count; i++)
  4007c9:	48 c1 fd 03          	sar    rbp,0x3
  4007cd:	74 16                	je     4007e5 <__libc_init_array+0x35>
  4007cf:	31 db                	xor    ebx,ebx
  4007d1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
	{
		__preinit_array_start[i]();
  4007d8:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
	for(size_t i = 0; i < count; i++)
  4007dc:	48 83 c3 01          	add    rbx,0x1
  4007e0:	48 39 dd             	cmp    rbp,rbx
  4007e3:	75 f3                	jne    4007d8 <__libc_init_array+0x28>
	}

	count = (size_t)(__init_array_end - __init_array_start);
  4007e5:	49 c7 c4 00 00 00 00 	mov    r12,0x0
  4007ec:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
  4007f3:	4c 29 e5             	sub    rbp,r12
	for(size_t i = 0; i < count; i++)
  4007f6:	48 c1 fd 03          	sar    rbp,0x3
  4007fa:	74 11                	je     40080d <__libc_init_array+0x5d>
  4007fc:	31 db                	xor    ebx,ebx
  4007fe:	66 90                	xchg   ax,ax
	{
		__init_array_start[i]();
  400800:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
	for(size_t i = 0; i < count; i++)
  400804:	48 83 c3 01          	add    rbx,0x1
  400808:	48 39 dd             	cmp    rbp,rbx
  40080b:	75 f3                	jne    400800 <__libc_init_array+0x50>
	}
}
  40080d:	5b                   	pop    rbx
  40080e:	5d                   	pop    rbp
  40080f:	41 5c                	pop    r12
  400811:	c3                   	ret    

Disassembly of section .text.__libc_fini_array:

0000000000400820 <__libc_fini_array>:

void __libc_fini_array(void)
{
  400820:	f3 0f 1e fa          	endbr64 
  400824:	55                   	push   rbp
  400825:	53                   	push   rbx
  400826:	48 83 ec 08          	sub    rsp,0x8
	size_t count = (size_t)(__fini_array_end - __fini_array_start);
  40082a:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
  400831:	48 c7 c3 00 00 00 00 	mov    rbx,0x0
  400838:	48 29 eb             	sub    rbx,rbp
	for(size_t i = count; i > 0; i--)
  40083b:	48 c1 fb 03          	sar    rbx,0x3
  40083f:	74 14                	je     400855 <__libc_fini_array+0x35>
  400841:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
	{
		__fini_array_start[i - 1]();
  400848:	48 83 eb 01          	sub    rbx,0x1
  40084c:	ff 54 dd 00          	call   QWORD PTR [rbp+rbx*8+0x0]
	for(size_t i = count; i > 0; i--)
  400850:	48 85 db             	test   rbx,rbx
  400853:	75 f3                	jne    400848 <__libc_fini_array+0x28>
	}
}
  400855:	48 83 c4 08          	add    rsp,0x8
  400859:	5b                   	pop    rbx
  40085a:	5d                   	pop    rbp
  40085b:	c3                   	ret    

Disassembly of section .text.CRTStartup:

0000000000400860 <CRTStartup>:

// This function may call another function which changes __stack_chk_guard
__attribute__((no_stack_protector)) void CRTStartup(void)
{
  400860:	f3 0f 1e fa          	endbr64 
  400864:	48 83 ec 08          	sub    rsp,0x8
	memset(&__bss_start__, 0, (uintptr_t)&__bss_end__ - (uintptr_t)&__bss_start__);
  400868:	48 c7 c7 36 17 40 00 	mov    rdi,0x401736
  40086f:	48 c7 c2 f0 17 40 00 	mov    rdx,0x4017f0
  400876:	31 f6                	xor    esi,esi
  400878:	48 29 fa             	sub    rdx,rdi
  40087b:	e8 80 09 00 00       	call   401200 <memset>

	__libc_init_array();

	// TODO: handle relocs?
}
  400880:	48 83 c4 08          	add    rsp,0x8
	__libc_init_array();
  400884:	e9 27 ff ff ff       	jmp    4007b0 <__libc_init_array>

Disassembly of section .text.entry:

0000000000400890 <entry>:
{
  400890:	f3 0f 1e fa          	endbr64 
  400894:	41 55                	push   r13
  400896:	49 89 f5             	mov    r13,rsi
  400899:	41 54                	push   r12
  40089b:	49 89 d4             	mov    r12,rdx
  40089e:	55                   	push   rbp
  40089f:	89 fd                	mov    ebp,edi
	CRTStartup();
  4008a1:	e8 ba ff ff ff       	call   400860 <CRTStartup>
	environ = _environ;
  4008a6:	48 c7 c0 f0 17 40 00 	mov    rax,0x4017f0
	__heap_base = sbrk(0);
  4008ad:	31 ff                	xor    edi,edi
	environ = _environ;
  4008af:	4c 89 20             	mov    QWORD PTR [rax],r12
	__heap_base = sbrk(0);
  4008b2:	31 c0                	xor    eax,eax
  4008b4:	e8 a7 fc ff ff       	call   400560 <sbrk>
  4008b9:	48 c7 c2 70 18 40 00 	mov    rdx,0x401870
	return main(argc, argv, _environ);
  4008c0:	4c 89 ee             	mov    rsi,r13
  4008c3:	89 ef                	mov    edi,ebp
	__heap_base = sbrk(0);
  4008c5:	89 02                	mov    DWORD PTR [rdx],eax
	return main(argc, argv, _environ);
  4008c7:	4c 89 e2             	mov    rdx,r12
}
  4008ca:	5d                   	pop    rbp
  4008cb:	41 5c                	pop    r12
  4008cd:	41 5d                	pop    r13
	return main(argc, argv, _environ);
  4008cf:	e9 f2 f7 ff ff       	jmp    4000c6 <main>

Disassembly of section .text.putchar:

00000000004008e0 <putchar>:
#include <printf.h>
#include <stdio.h>

int putchar(int c)
{
  4008e0:	f3 0f 1e fa          	endbr64 
  4008e4:	41 54                	push   r12
  4008e6:	41 89 fc             	mov    r12d,edi
	putchar_((char)c);
  4008e9:	40 0f be ff          	movsx  edi,dil
  4008ed:	e8 0e 00 00 00       	call   400900 <putchar_>
	return c;
}
  4008f2:	44 89 e0             	mov    eax,r12d
  4008f5:	41 5c                	pop    r12
  4008f7:	c3                   	ret    

Disassembly of section .text.putchar_:

0000000000400900 <putchar_>:
#include "stdio.h"
void putchar_(char c){
  400900:	f3 0f 1e fa          	endbr64 
  400904:	48 83 ec 18          	sub    rsp,0x18
    write(1,&c,1);
  400908:	ba 01 00 00 00       	mov    edx,0x1
  40090d:	31 c0                	xor    eax,eax
void putchar_(char c){
  40090f:	40 88 7c 24 0c       	mov    BYTE PTR [rsp+0xc],dil
    write(1,&c,1);
  400914:	48 8d 74 24 0c       	lea    rsi,[rsp+0xc]
  400919:	bf 01 00 00 00       	mov    edi,0x1
  40091e:	e8 ed fa ff ff       	call   400410 <write>
  400923:	48 83 c4 18          	add    rsp,0x18
  400927:	c3                   	ret    

Disassembly of section .text.max:

0000000000400930 <max>:
#define ASSERT_EQ(a, b) ASSERT((a) == (b))

unsigned long long __heap_base = 0;
static inline size_t max(size_t a, size_t b)
{
	return a < b ? b : a;
  400930:	48 39 f7             	cmp    rdi,rsi
  400933:	48 89 f0             	mov    rax,rsi
  400936:	48 0f 43 c7          	cmovae rax,rdi
}
  40093a:	c3                   	ret    

Disassembly of section .text.align:

0000000000400940 <align>:
static inline uintptr_t align(uintptr_t val, uintptr_t alignment)
{
	return (val + alignment - 1) & ~(alignment - 1);
  400940:	48 8d 44 3e ff       	lea    rax,[rsi+rdi*1-0x1]
  400945:	48 f7 de             	neg    rsi
  400948:	48 21 f0             	and    rax,rsi
}
  40094b:	c3                   	ret    

Disassembly of section .text.granules_to_chunk_kind:

0000000000400950 <granules_to_chunk_kind>:
static enum chunk_kind granules_to_chunk_kind(unsigned granules)
{
#define TEST_GRANULE_SIZE(i) \
	if(granules <= i)        \
		return GRANULES_##i;
	FOR_EACH_SMALL_OBJECT_GRANULES(TEST_GRANULE_SIZE);
  400950:	31 c0                	xor    eax,eax
  400952:	83 ff 01             	cmp    edi,0x1
  400955:	76 4e                	jbe    4009a5 <granules_to_chunk_kind+0x55>
  400957:	b8 01 00 00 00       	mov    eax,0x1
  40095c:	83 ff 02             	cmp    edi,0x2
  40095f:	74 44                	je     4009a5 <granules_to_chunk_kind+0x55>
  400961:	83 ff 03             	cmp    edi,0x3
  400964:	74 5a                	je     4009c0 <granules_to_chunk_kind+0x70>
  400966:	83 ff 04             	cmp    edi,0x4
  400969:	74 45                	je     4009b0 <granules_to_chunk_kind+0x60>
  40096b:	83 ff 05             	cmp    edi,0x5
  40096e:	74 60                	je     4009d0 <granules_to_chunk_kind+0x80>
  400970:	83 ff 06             	cmp    edi,0x6
  400973:	74 2b                	je     4009a0 <granules_to_chunk_kind+0x50>
  400975:	b8 06 00 00 00       	mov    eax,0x6
  40097a:	83 ff 08             	cmp    edi,0x8
  40097d:	76 26                	jbe    4009a5 <granules_to_chunk_kind+0x55>
  40097f:	b8 07 00 00 00       	mov    eax,0x7
  400984:	83 ff 0a             	cmp    edi,0xa
  400987:	76 1c                	jbe    4009a5 <granules_to_chunk_kind+0x55>
  400989:	b8 08 00 00 00       	mov    eax,0x8
  40098e:	83 ff 10             	cmp    edi,0x10
  400991:	76 12                	jbe    4009a5 <granules_to_chunk_kind+0x55>
  400993:	83 ff 21             	cmp    edi,0x21
  400996:	19 c0                	sbb    eax,eax
  400998:	24 0a                	and    al,0xa
  40099a:	05 ff 00 00 00       	add    eax,0xff
  40099f:	c3                   	ret    
  4009a0:	b8 05 00 00 00       	mov    eax,0x5
#undef TEST_GRANULE_SIZE
	return LARGE_OBJECT;
}
  4009a5:	c3                   	ret    
  4009a6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4009ad:	00 00 00 
	FOR_EACH_SMALL_OBJECT_GRANULES(TEST_GRANULE_SIZE);
  4009b0:	b8 03 00 00 00       	mov    eax,0x3
  4009b5:	c3                   	ret    
  4009b6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4009bd:	00 00 00 
  4009c0:	b8 02 00 00 00       	mov    eax,0x2
  4009c5:	c3                   	ret    
  4009c6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4009cd:	00 00 00 
  4009d0:	b8 04 00 00 00       	mov    eax,0x4
  4009d5:	c3                   	ret    

Disassembly of section .text.chunk_kind_to_granules:

00000000004009e0 <chunk_kind_to_granules>:

static unsigned chunk_kind_to_granules(enum chunk_kind kind)
{
  4009e0:	b8 ff ff ff ff       	mov    eax,0xffffffff
  4009e5:	83 ff 09             	cmp    edi,0x9
  4009e8:	77 0c                	ja     4009f6 <chunk_kind_to_granules+0x16>
  4009ea:	89 ff                	mov    edi,edi
  4009ec:	48 8d 05 ed 0c 00 00 	lea    rax,[rip+0xced]        # 4016e0 <CSWTCH.34>
  4009f3:	8b 04 b8             	mov    eax,DWORD PTR [rax+rdi*4]
		FOR_EACH_SMALL_OBJECT_GRANULES(CHUNK_KIND_GRANULE_SIZE);
#undef CHUNK_KIND_GRANULE_SIZE
		default:
			return -1;
	}
}
  4009f6:	c3                   	ret    

Disassembly of section .text.get_page:

0000000000400a00 <get_page>:
#define FIRST_ALLOCATABLE_CHUNK 1
STATIC_ASSERT_EQ(PAGE_HEADER_SIZE, FIRST_ALLOCATABLE_CHUNK* CHUNK_SIZE);

static struct page* get_page(void* ptr)
{
	return (struct page*)(char*)(((uintptr_t)ptr) & ~PAGE_MASK);
  400a00:	48 89 f8             	mov    rax,rdi
  400a03:	66 31 c0             	xor    ax,ax
}
  400a06:	c3                   	ret    

Disassembly of section .text.get_chunk_index:

0000000000400a10 <get_chunk_index>:
static unsigned get_chunk_index(void* ptr)
{
	return (((uintptr_t)ptr) & PAGE_MASK) / CHUNK_SIZE;
  400a10:	89 f8                	mov    eax,edi
  400a12:	0f b6 c4             	movzx  eax,ah
}
  400a15:	c3                   	ret    

Disassembly of section .text.get_large_object_payload:

0000000000400a20 <get_large_object_payload>:

#define LARGE_OBJECT_HEADER_SIZE (sizeof(struct large_object))

static inline void* get_large_object_payload(struct large_object* obj)
{
	return ((char*)obj) + LARGE_OBJECT_HEADER_SIZE;
  400a20:	48 8d 47 10          	lea    rax,[rdi+0x10]
}
  400a24:	c3                   	ret    

Disassembly of section .text.get_large_object:

0000000000400a30 <get_large_object>:
static inline struct large_object* get_large_object(void* ptr)
{
	return (struct large_object*)(((char*)ptr) - LARGE_OBJECT_HEADER_SIZE);
  400a30:	48 8d 47 f0          	lea    rax,[rdi-0x10]
}
  400a34:	c3                   	ret    

Disassembly of section .text.allocate_chunk:

0000000000400a40 <allocate_chunk>:
	return ret;
}

static char* allocate_chunk(struct page* page, unsigned idx, enum chunk_kind kind)
{
	page->header.chunk_kinds[idx] = kind;
  400a40:	89 f6                	mov    esi,esi
  400a42:	88 14 37             	mov    BYTE PTR [rdi+rsi*1],dl
	return page->chunks[idx].data;
  400a45:	48 c1 e6 08          	shl    rsi,0x8
  400a49:	48 8d 04 37          	lea    rax,[rdi+rsi*1]
}
  400a4d:	c3                   	ret    

Disassembly of section .text.maybe_repurpose_single_chunk_large_objects_head:

0000000000400a50 <maybe_repurpose_single_chunk_large_objects_head>:
// It's possible for splitting to produce a large object of size 248 (256 minus
// the header size) -- i.e. spanning a single chunk.  In that case, push the
// chunk back on the GRANULES_32 small object freelist.
static void maybe_repurpose_single_chunk_large_objects_head(void)
{
	if(large_objects->size < CHUNK_SIZE)
  400a50:	48 8b 0d b1 0d 00 00 	mov    rcx,QWORD PTR [rip+0xdb1]        # 401808 <large_objects>
  400a57:	48 81 79 08 ff 00 00 	cmp    QWORD PTR [rcx+0x8],0xff
  400a5e:	00 
  400a5f:	76 07                	jbe    400a68 <maybe_repurpose_single_chunk_large_objects_head+0x18>
		large_objects = large_objects->next;
		struct freelist* head = (struct freelist*)ptr;
		head->next = small_object_freelists[GRANULES_32];
		small_object_freelists[GRANULES_32] = head;
	}
}
  400a61:	c3                   	ret    
  400a62:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		unsigned idx = get_chunk_index(large_objects);
  400a68:	48 89 cf             	mov    rdi,rcx
		char* ptr = allocate_chunk(get_page(large_objects), idx, GRANULES_32);
  400a6b:	ba 09 00 00 00       	mov    edx,0x9
		unsigned idx = get_chunk_index(large_objects);
  400a70:	e8 9b ff ff ff       	call   400a10 <get_chunk_index>
  400a75:	89 c6                	mov    esi,eax
		char* ptr = allocate_chunk(get_page(large_objects), idx, GRANULES_32);
  400a77:	e8 84 ff ff ff       	call   400a00 <get_page>
  400a7c:	48 89 c7             	mov    rdi,rax
  400a7f:	e8 bc ff ff ff       	call   400a40 <allocate_chunk>
		large_objects = large_objects->next;
  400a84:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  400a87:	48 89 15 7a 0d 00 00 	mov    QWORD PTR [rip+0xd7a],rdx        # 401808 <large_objects>
		head->next = small_object_freelists[GRANULES_32];
  400a8e:	48 8b 15 d3 0d 00 00 	mov    rdx,QWORD PTR [rip+0xdd3]        # 401868 <small_object_freelists+0x48>
  400a95:	48 89 10             	mov    QWORD PTR [rax],rdx
		small_object_freelists[GRANULES_32] = head;
  400a98:	48 89 05 c9 0d 00 00 	mov    QWORD PTR [rip+0xdc9],rax        # 401868 <small_object_freelists+0x48>
}
  400a9f:	c3                   	ret    

Disassembly of section .text.size_to_granules:

0000000000400aa0 <size_to_granules>:
	return next;
}

static inline size_t size_to_granules(size_t size)
{
	return (size + GRANULE_SIZE - 1) >> GRANULE_SIZE_LOG_2;
  400aa0:	48 8d 47 07          	lea    rax,[rdi+0x7]
  400aa4:	48 c1 e8 03          	shr    rax,0x3
}
  400aa8:	c3                   	ret    

Disassembly of section .text.unlikely.maybe_merge_free_large_object:

0000000000400aa9 <maybe_merge_free_large_object.cold>:
		ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
  400aa9:	0f 0b                	ud2    

Disassembly of section .text.maybe_merge_free_large_object:

0000000000400ab0 <maybe_merge_free_large_object>:
{
  400ab0:	53                   	push   rbx
	struct large_object* obj = *prev;
  400ab1:	4c 8b 1f             	mov    r11,QWORD PTR [rdi]
{
  400ab4:	49 89 f9             	mov    r9,rdi
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
  400ab7:	48 8d 1d 4a 0d 00 00 	lea    rbx,[rip+0xd4a]        # 401808 <large_objects>
		char* end = get_large_object_payload(obj) + obj->size;
  400abe:	4c 89 df             	mov    rdi,r11
  400ac1:	e8 5a ff ff ff       	call   400a20 <get_large_object_payload>
  400ac6:	4d 8b 43 08          	mov    r8,QWORD PTR [r11+0x8]
  400aca:	49 89 c2             	mov    r10,rax
  400acd:	0f 1f 00             	nop    DWORD PTR [rax]
  400ad0:	4b 8d 14 02          	lea    rdx,[r10+r8*1]
		ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
  400ad4:	be 00 01 00 00       	mov    esi,0x100
  400ad9:	48 89 d7             	mov    rdi,rdx
  400adc:	e8 5f fe ff ff       	call   400940 <align>
  400ae1:	48 39 c2             	cmp    rdx,rax
  400ae4:	0f 85 bf ff ff ff    	jne    400aa9 <maybe_merge_free_large_object.cold>
		unsigned chunk = get_chunk_index(end);
  400aea:	e8 21 ff ff ff       	call   400a10 <get_chunk_index>
  400aef:	89 c1                	mov    ecx,eax
		if(chunk < FIRST_ALLOCATABLE_CHUNK)
  400af1:	85 c9                	test   ecx,ecx
  400af3:	74 53                	je     400b48 <maybe_merge_free_large_object+0x98>
		struct page* page = get_page(end);
  400af5:	e8 06 ff ff ff       	call   400a00 <get_page>
		if(page->header.chunk_kinds[chunk] != FREE_LARGE_OBJECT)
  400afa:	80 3c 08 fe          	cmp    BYTE PTR [rax+rcx*1],0xfe
  400afe:	75 48                	jne    400b48 <maybe_merge_free_large_object+0x98>
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
  400b00:	48 8b 05 01 0d 00 00 	mov    rax,QWORD PTR [rip+0xd01]        # 401808 <large_objects>
			ASSERT(walk);
  400b07:	48 85 c0             	test   rax,rax
  400b0a:	0f 84 99 ff ff ff    	je     400aa9 <maybe_merge_free_large_object.cold>
			if(walk == next)
  400b10:	48 39 c2             	cmp    rdx,rax
  400b13:	74 3b                	je     400b50 <maybe_merge_free_large_object+0xa0>
  400b15:	0f 1f 00             	nop    DWORD PTR [rax]
			walk = walk->next;
  400b18:	48 89 c1             	mov    rcx,rax
  400b1b:	48 8b 00             	mov    rax,QWORD PTR [rax]
			ASSERT(walk);
  400b1e:	48 85 c0             	test   rax,rax
  400b21:	74 32                	je     400b55 <maybe_merge_free_large_object+0xa5>
			if(walk == next)
  400b23:	48 39 c2             	cmp    rdx,rax
  400b26:	75 f0                	jne    400b18 <maybe_merge_free_large_object+0x68>
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
  400b28:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
				if(prev == &walk->next)
  400b2c:	4c 39 c8             	cmp    rax,r9
  400b2f:	4c 0f 44 c9          	cmove  r9,rcx
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
  400b33:	4d 8d 44 10 10       	lea    r8,[r8+rdx*1+0x10]
				*prev_prev = walk->next;
  400b38:	48 8b 10             	mov    rdx,QWORD PTR [rax]
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
  400b3b:	4d 89 43 08          	mov    QWORD PTR [r11+0x8],r8
				*prev_prev = walk->next;
  400b3f:	48 89 11             	mov    QWORD PTR [rcx],rdx
				if(prev == &walk->next)
  400b42:	eb 8c                	jmp    400ad0 <maybe_merge_free_large_object+0x20>
  400b44:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
}
  400b48:	4c 89 c8             	mov    rax,r9
  400b4b:	5b                   	pop    rbx
  400b4c:	c3                   	ret    
  400b4d:	0f 1f 00             	nop    DWORD PTR [rax]
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
  400b50:	48 89 d9             	mov    rcx,rbx
  400b53:	eb d3                	jmp    400b28 <maybe_merge_free_large_object+0x78>
  400b55:	e9 4f ff ff ff       	jmp    400aa9 <maybe_merge_free_large_object.cold>

Disassembly of section .text.maybe_compact_free_large_objects:

0000000000400b60 <maybe_compact_free_large_objects>:
	if(pending_large_object_compact)
  400b60:	8b 05 96 0c 00 00    	mov    eax,DWORD PTR [rip+0xc96]        # 4017fc <pending_large_object_compact>
  400b66:	85 c0                	test   eax,eax
  400b68:	74 2c                	je     400b96 <maybe_compact_free_large_objects+0x36>
		while(*prev)
  400b6a:	48 83 3d 96 0c 00 00 	cmp    QWORD PTR [rip+0xc96],0x0        # 401808 <large_objects>
  400b71:	00 
		pending_large_object_compact = 0;
  400b72:	c7 05 80 0c 00 00 00 	mov    DWORD PTR [rip+0xc80],0x0        # 4017fc <pending_large_object_compact>
  400b79:	00 00 00 
		while(*prev)
  400b7c:	74 18                	je     400b96 <maybe_compact_free_large_objects+0x36>
		struct large_object** prev = &large_objects;
  400b7e:	48 8d 3d 83 0c 00 00 	lea    rdi,[rip+0xc83]        # 401808 <large_objects>
  400b85:	0f 1f 00             	nop    DWORD PTR [rax]
			prev = &(*maybe_merge_free_large_object(prev))->next;
  400b88:	e8 23 ff ff ff       	call   400ab0 <maybe_merge_free_large_object>
  400b8d:	48 8b 38             	mov    rdi,QWORD PTR [rax]
		while(*prev)
  400b90:	48 83 3f 00          	cmp    QWORD PTR [rdi],0x0
  400b94:	75 f2                	jne    400b88 <maybe_compact_free_large_objects+0x28>
}
  400b96:	c3                   	ret    

Disassembly of section .text.unlikely.get_small_object_freelist:

0000000000400b97 <get_small_object_freelist.cold>:
static struct freelist** get_small_object_freelist(enum chunk_kind kind)
{
	ASSERT(kind < SMALL_OBJECT_CHUNK_KINDS);
  400b97:	0f 0b                	ud2    

Disassembly of section .text.get_small_object_freelist:

0000000000400ba0 <get_small_object_freelist>:
  400ba0:	83 ff 09             	cmp    edi,0x9
  400ba3:	0f 87 ee ff ff ff    	ja     400b97 <get_small_object_freelist.cold>
	return &small_object_freelists[kind];
  400ba9:	89 ff                	mov    edi,edi
  400bab:	48 8d 05 6e 0c 00 00 	lea    rax,[rip+0xc6e]        # 401820 <small_object_freelists>
  400bb2:	48 8d 04 f8          	lea    rax,[rax+rdi*8]
}
  400bb6:	c3                   	ret    

Disassembly of section .text.free:

0000000000400bc0 <free>:
	enum chunk_kind kind = granules_to_chunk_kind(granules);
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
}

void free(void* ptr)
{
  400bc0:	f3 0f 1e fa          	endbr64 
  400bc4:	49 89 f8             	mov    r8,rdi
	if(!ptr)
  400bc7:	48 85 ff             	test   rdi,rdi
  400bca:	74 2a                	je     400bf6 <free+0x36>
		return;
	struct page* page = get_page(ptr);
  400bcc:	e8 2f fe ff ff       	call   400a00 <get_page>
  400bd1:	49 89 c1             	mov    r9,rax
	unsigned chunk = get_chunk_index(ptr);
  400bd4:	e8 37 fe ff ff       	call   400a10 <get_chunk_index>
  400bd9:	89 c6                	mov    esi,eax
	uint8_t kind = page->header.chunk_kinds[chunk];
  400bdb:	89 c0                	mov    eax,eax
  400bdd:	41 0f b6 3c 01       	movzx  edi,BYTE PTR [r9+rax*1]
	if(kind == LARGE_OBJECT)
  400be2:	40 80 ff ff          	cmp    dil,0xff
  400be6:	74 18                	je     400c00 <free+0x40>
		pending_large_object_compact = 1;
	}
	else
	{
		size_t granules = kind;
		struct freelist** loc = get_small_object_freelist(granules);
  400be8:	e8 b3 ff ff ff       	call   400ba0 <get_small_object_freelist>
		struct freelist* obj = ptr;
		obj->next = *loc;
  400bed:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  400bf0:	49 89 10             	mov    QWORD PTR [r8],rdx
		*loc = obj;
  400bf3:	4c 89 00             	mov    QWORD PTR [rax],r8
	}
}
  400bf6:	c3                   	ret    
  400bf7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  400bfe:	00 00 
		struct large_object* obj = get_large_object(ptr);
  400c00:	4c 89 c7             	mov    rdi,r8
  400c03:	e8 28 fe ff ff       	call   400a30 <get_large_object>
		obj->next = large_objects;
  400c08:	48 8b 15 f9 0b 00 00 	mov    rdx,QWORD PTR [rip+0xbf9]        # 401808 <large_objects>
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
  400c0f:	4c 89 cf             	mov    rdi,r9
		obj->next = large_objects;
  400c12:	48 89 10             	mov    QWORD PTR [rax],rdx
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
  400c15:	ba fe 00 00 00       	mov    edx,0xfe
		large_objects = obj;
  400c1a:	48 89 05 e7 0b 00 00 	mov    QWORD PTR [rip+0xbe7],rax        # 401808 <large_objects>
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
  400c21:	e8 1a fe ff ff       	call   400a40 <allocate_chunk>
		pending_large_object_compact = 1;
  400c26:	c7 05 cc 0b 00 00 01 	mov    DWORD PTR [rip+0xbcc],0x1        # 4017fc <pending_large_object_compact>
  400c2d:	00 00 00 
  400c30:	c3                   	ret    

Disassembly of section .text.heap_size_in_pages:

0000000000400c40 <heap_size_in_pages>:
int heap_size_in_pages()
{
  400c40:	f3 0f 1e fa          	endbr64 
  400c44:	48 83 ec 08          	sub    rsp,0x8
	return (int)sbrk(0) - __heap_base;
  400c48:	31 ff                	xor    edi,edi
  400c4a:	e8 11 f9 ff ff       	call   400560 <sbrk>
  400c4f:	48 c7 c2 70 18 40 00 	mov    rdx,0x401870
  400c56:	2b 02                	sub    eax,DWORD PTR [rdx]
  400c58:	48 83 c4 08          	add    rsp,0x8
  400c5c:	c3                   	ret    

Disassembly of section .text.unlikely.allocate_pages.constprop.0:

0000000000400c5d <allocate_pages.constprop.0.cold>:
		ASSERT(grow);
  400c5d:	0f 0b                	ud2    

Disassembly of section .text.allocate_pages.constprop.0:

0000000000400c60 <allocate_pages.constprop.0>:
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
  400c60:	41 55                	push   r13
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
  400c62:	31 c0                	xor    eax,eax
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
  400c64:	41 54                	push   r12
	size_t needed = payload_size + PAGE_HEADER_SIZE;
  400c66:	4c 8d a7 00 01 00 00 	lea    r12,[rdi+0x100]
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
  400c6d:	55                   	push   rbp
  400c6e:	48 89 f5             	mov    rbp,rsi
  400c71:	53                   	push   rbx
  400c72:	48 83 ec 08          	sub    rsp,0x8
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
  400c76:	e8 c5 ff ff ff       	call   400c40 <heap_size_in_pages>
	if(!walloc_heap_size)
  400c7b:	48 8b 3d 7e 0b 00 00 	mov    rdi,QWORD PTR [rip+0xb7e]        # 401800 <walloc_heap_size>
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
  400c82:	c1 e0 10             	shl    eax,0x10
  400c85:	48 63 d8             	movsxd rbx,eax
	if(!walloc_heap_size)
  400c88:	48 85 ff             	test   rdi,rdi
  400c8b:	75 63                	jne    400cf0 <allocate_pages.constprop.0+0x90>
		uintptr_t heap_base = align((uintptr_t)&__heap_base, PAGE_SIZE);
  400c8d:	48 c7 c7 70 18 40 00 	mov    rdi,0x401870
  400c94:	be 00 00 01 00       	mov    esi,0x10000
  400c99:	e8 a2 fc ff ff       	call   400940 <align>
		walloc_heap_size = preallocated;
  400c9e:	48 89 1d 5b 0b 00 00 	mov    QWORD PTR [rip+0xb5b],rbx        # 401800 <walloc_heap_size>
		uintptr_t heap_base = align((uintptr_t)&__heap_base, PAGE_SIZE);
  400ca5:	49 89 c0             	mov    r8,rax
	if(preallocated < needed)
  400ca8:	49 39 dc             	cmp    r12,rbx
  400cab:	0f 87 94 00 00 00    	ja     400d45 <allocate_pages.constprop.0+0xe5>
	ASSERT(size);
  400cb1:	48 85 db             	test   rbx,rbx
  400cb4:	0f 84 a3 ff ff ff    	je     400c5d <allocate_pages.constprop.0.cold>
	ASSERT_ALIGNED(size, PAGE_SIZE);
  400cba:	be 00 00 01 00       	mov    esi,0x10000
  400cbf:	48 89 df             	mov    rdi,rbx
  400cc2:	e8 79 fc ff ff       	call   400940 <align>
  400cc7:	48 39 c3             	cmp    rbx,rax
  400cca:	0f 85 8d ff ff ff    	jne    400c5d <allocate_pages.constprop.0.cold>
	*n_allocated = size / PAGE_SIZE;
  400cd0:	48 c1 eb 10          	shr    rbx,0x10
  400cd4:	48 89 5d 00          	mov    QWORD PTR [rbp+0x0],rbx
}
  400cd8:	48 83 c4 08          	add    rsp,0x8
  400cdc:	4c 89 c0             	mov    rax,r8
  400cdf:	5b                   	pop    rbx
  400ce0:	5d                   	pop    rbp
  400ce1:	41 5c                	pop    r12
  400ce3:	41 5d                	pop    r13
  400ce5:	c3                   	ret    
  400ce6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  400ced:	00 00 00 
	if(preallocated < needed)
  400cf0:	4d 85 e4             	test   r12,r12
  400cf3:	74 5e                	je     400d53 <allocate_pages.constprop.0+0xf3>
	uintptr_t preallocated = 0, grow = 0;
  400cf5:	45 31 ed             	xor    r13d,r13d
		grow = align(max(walloc_heap_size / 2, needed - preallocated), PAGE_SIZE);
  400cf8:	4c 89 e6             	mov    rsi,r12
  400cfb:	48 d1 ef             	shr    rdi,1
  400cfe:	e8 2d fc ff ff       	call   400930 <max>
  400d03:	be 00 00 01 00       	mov    esi,0x10000
  400d08:	48 89 c7             	mov    rdi,rax
  400d0b:	e8 30 fc ff ff       	call   400940 <align>
  400d10:	49 89 c4             	mov    r12,rax
		ASSERT(grow);
  400d13:	48 85 c0             	test   rax,rax
  400d16:	0f 84 41 ff ff ff    	je     400c5d <allocate_pages.constprop.0.cold>
		if(sbrk(grow) == -1) // >> PAGE_SIZE_LOG_2
  400d1c:	48 89 c7             	mov    rdi,rax
  400d1f:	e8 3c f8 ff ff       	call   400560 <sbrk>
  400d24:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
  400d28:	74 16                	je     400d40 <allocate_pages.constprop.0+0xe0>
	size_t size = grow + preallocated;
  400d2a:	49 89 d8             	mov    r8,rbx
		walloc_heap_size += grow;
  400d2d:	4c 01 25 cc 0a 00 00 	add    QWORD PTR [rip+0xacc],r12        # 401800 <walloc_heap_size>
	size_t size = grow + preallocated;
  400d34:	4b 8d 1c 2c          	lea    rbx,[r12+r13*1]
  400d38:	e9 74 ff ff ff       	jmp    400cb1 <allocate_pages.constprop.0+0x51>
  400d3d:	0f 1f 00             	nop    DWORD PTR [rax]
			return NULL;
  400d40:	45 31 c0             	xor    r8d,r8d
  400d43:	eb 93                	jmp    400cd8 <allocate_pages.constprop.0+0x78>
		grow = align(max(walloc_heap_size / 2, needed - preallocated), PAGE_SIZE);
  400d45:	49 29 dc             	sub    r12,rbx
  400d48:	48 89 df             	mov    rdi,rbx
  400d4b:	49 89 dd             	mov    r13,rbx
		base = heap_base;
  400d4e:	48 89 c3             	mov    rbx,rax
  400d51:	eb a5                	jmp    400cf8 <allocate_pages.constprop.0+0x98>
  400d53:	e9 05 ff ff ff       	jmp    400c5d <allocate_pages.constprop.0.cold>

Disassembly of section .text.unlikely.allocate_large_object:

0000000000400d58 <allocate_large_object.cold>:
		ASSERT(best_size >= size_with_header);
  400d58:	0f 0b                	ud2    

Disassembly of section .text.allocate_large_object:

0000000000400d60 <allocate_large_object>:
{
  400d60:	41 54                	push   r12
  400d62:	55                   	push   rbp
  400d63:	53                   	push   rbx
  400d64:	48 89 fb             	mov    rbx,rdi
  400d67:	48 83 ec 10          	sub    rsp,0x10
	maybe_compact_free_large_objects();
  400d6b:	e8 f0 fd ff ff       	call   400b60 <maybe_compact_free_large_objects>
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
  400d70:	48 8b 15 91 0a 00 00 	mov    rdx,QWORD PTR [rip+0xa91]        # 401808 <large_objects>
  400d77:	48 85 d2             	test   rdx,rdx
  400d7a:	0f 84 da 01 00 00    	je     400f5a <allocate_large_object+0x1fa>
  400d80:	4c 8d 0d 81 0a 00 00 	lea    r9,[rip+0xa81]        # 401808 <large_objects>
	size_t best_size = -1;
  400d87:	49 c7 c0 ff ff ff ff 	mov    r8,0xffffffffffffffff
			   align(size + LARGE_OBJECT_HEADER_SIZE, CHUNK_SIZE))
  400d8e:	48 8d 7b 10          	lea    rdi,[rbx+0x10]
	struct large_object *best = NULL, **best_prev = &large_objects;
  400d92:	45 31 d2             	xor    r10d,r10d
  400d95:	4c 89 cd             	mov    rbp,r9
  400d98:	eb 11                	jmp    400dab <allocate_large_object+0x4b>
  400d9a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		prev = &walk->next, walk = walk->next)
  400da0:	49 89 d1             	mov    r9,rdx
  400da3:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
  400da6:	48 85 d2             	test   rdx,rdx
  400da9:	74 39                	je     400de4 <allocate_large_object+0x84>
		if(walk->size >= size && walk->size < best_size)
  400dab:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
  400daf:	4c 39 c1             	cmp    rcx,r8
  400db2:	73 ec                	jae    400da0 <allocate_large_object+0x40>
  400db4:	48 39 d9             	cmp    rcx,rbx
  400db7:	72 e7                	jb     400da0 <allocate_large_object+0x40>
			   align(size + LARGE_OBJECT_HEADER_SIZE, CHUNK_SIZE))
  400db9:	be 00 01 00 00       	mov    esi,0x100
  400dbe:	e8 7d fb ff ff       	call   400940 <align>
			if(best_size + LARGE_OBJECT_HEADER_SIZE ==
  400dc3:	48 8d 71 10          	lea    rsi,[rcx+0x10]
  400dc7:	48 39 c6             	cmp    rsi,rax
  400dca:	0f 84 88 02 00 00    	je     401058 <allocate_large_object+0x2f8>
  400dd0:	4c 89 cd             	mov    rbp,r9
  400dd3:	49 89 d2             	mov    r10,rdx
		prev = &walk->next, walk = walk->next)
  400dd6:	49 89 d1             	mov    r9,rdx
  400dd9:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  400ddc:	49 89 c8             	mov    r8,rcx
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
  400ddf:	48 85 d2             	test   rdx,rdx
  400de2:	75 c7                	jne    400dab <allocate_large_object+0x4b>
	if(!best)
  400de4:	4d 85 d2             	test   r10,r10
  400de7:	0f 84 7b 01 00 00    	je     400f68 <allocate_large_object+0x208>
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
  400ded:	4c 89 d7             	mov    rdi,r10
  400df0:	ba ff 00 00 00       	mov    edx,0xff
	size_t tail_size = (best_size - size) & ~CHUNK_MASK;
  400df5:	4c 89 c1             	mov    rcx,r8
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
  400df8:	e8 13 fc ff ff       	call   400a10 <get_chunk_index>
	size_t tail_size = (best_size - size) & ~CHUNK_MASK;
  400dfd:	48 29 d9             	sub    rcx,rbx
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
  400e00:	89 c6                	mov    esi,eax
  400e02:	e8 f9 fb ff ff       	call   400a00 <get_page>
  400e07:	48 89 c7             	mov    rdi,rax
  400e0a:	49 89 c1             	mov    r9,rax
  400e0d:	e8 2e fc ff ff       	call   400a40 <allocate_chunk>
	struct large_object* next = best->next;
  400e12:	49 8b 02             	mov    rax,QWORD PTR [r10]
	*best_prev = next;
  400e15:	48 89 45 00          	mov    QWORD PTR [rbp+0x0],rax
	if(tail_size)
  400e19:	48 81 e1 00 ff ff ff 	and    rcx,0xffffffffffffff00
  400e20:	75 36                	jne    400e58 <allocate_large_object+0xf8>
	ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(best) + best->size), CHUNK_SIZE);
  400e22:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
  400e26:	4c 89 d7             	mov    rdi,r10
  400e29:	be 00 01 00 00       	mov    esi,0x100
  400e2e:	e8 ed fb ff ff       	call   400a20 <get_large_object_payload>
  400e33:	48 01 c2             	add    rdx,rax
  400e36:	48 89 d7             	mov    rdi,rdx
  400e39:	e8 02 fb ff ff       	call   400940 <align>
  400e3e:	48 39 c2             	cmp    rdx,rax
  400e41:	0f 85 11 ff ff ff    	jne    400d58 <allocate_large_object.cold>
}
  400e47:	48 83 c4 10          	add    rsp,0x10
  400e4b:	4c 89 d0             	mov    rax,r10
  400e4e:	5b                   	pop    rbx
  400e4f:	5d                   	pop    rbp
  400e50:	41 5c                	pop    r12
  400e52:	c3                   	ret    
  400e53:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
		char* start = get_large_object_payload(best);
  400e58:	4c 89 d7             	mov    rdi,r10
  400e5b:	e8 c0 fb ff ff       	call   400a20 <get_large_object_payload>
		if(start_page == get_page(end - tail_size - 1))
  400e60:	48 89 cf             	mov    rdi,rcx
		char* end = start + best_size;
  400e63:	4e 8d 1c 00          	lea    r11,[rax+r8*1]
		if(start_page == get_page(end - tail_size - 1))
  400e67:	48 f7 d7             	not    rdi
		char* start = get_large_object_payload(best);
  400e6a:	48 89 c5             	mov    rbp,rax
		if(start_page == get_page(end - tail_size - 1))
  400e6d:	4c 01 df             	add    rdi,r11
  400e70:	e8 8b fb ff ff       	call   400a00 <get_page>
  400e75:	49 39 c1             	cmp    r9,rax
  400e78:	0f 84 e8 01 00 00    	je     401066 <allocate_large_object+0x306>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
  400e7e:	be 00 00 01 00       	mov    esi,0x10000
  400e83:	4c 89 df             	mov    rdi,r11
  400e86:	e8 b5 fa ff ff       	call   400940 <align>
		else if(size < PAGE_SIZE - LARGE_OBJECT_HEADER_SIZE - CHUNK_SIZE)
  400e8b:	48 81 fb ef fe 00 00 	cmp    rbx,0xfeef
  400e92:	0f 86 38 01 00 00    	jbe    400fd0 <allocate_large_object+0x270>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
  400e98:	4c 39 d8             	cmp    rax,r11
  400e9b:	0f 85 b7 fe ff ff    	jne    400d58 <allocate_large_object.cold>
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
  400ea1:	0f b7 ed             	movzx  ebp,bp
			size_t tail_pages_size = align(size - first_page_size, PAGE_SIZE);
  400ea4:	be 00 00 01 00       	mov    esi,0x10000
  400ea9:	48 8d bc 1d 00 00 ff 	lea    rdi,[rbp+rbx*1-0x10000]
  400eb0:	ff 
			tail_size = best_size - size;
  400eb1:	4a 8d 8c 05 00 00 ff 	lea    rcx,[rbp+r8*1-0x10000]
  400eb8:	ff 
			size_t tail_pages_size = align(size - first_page_size, PAGE_SIZE);
  400eb9:	e8 82 fa ff ff       	call   400940 <align>
		best->size -= tail_size;
  400ebe:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
			tail_size = best_size - size;
  400ec2:	48 29 c1             	sub    rcx,rax
		best->size -= tail_size;
  400ec5:	48 29 ca             	sub    rdx,rcx
		unsigned tail_idx = get_chunk_index(end - tail_size);
  400ec8:	4c 89 df             	mov    rdi,r11
		best->size -= tail_size;
  400ecb:	49 89 52 08          	mov    QWORD PTR [r10+0x8],rdx
		unsigned tail_idx = get_chunk_index(end - tail_size);
  400ecf:	48 29 cf             	sub    rdi,rcx
  400ed2:	e8 39 fb ff ff       	call   400a10 <get_chunk_index>
  400ed7:	89 c6                	mov    esi,eax
		while(tail_idx < FIRST_ALLOCATABLE_CHUNK && tail_size)
  400ed9:	48 85 c9             	test   rcx,rcx
  400edc:	0f 84 44 ff ff ff    	je     400e26 <allocate_large_object+0xc6>
  400ee2:	85 c0                	test   eax,eax
  400ee4:	75 0c                	jne    400ef2 <allocate_large_object+0x192>
			tail_size -= CHUNK_SIZE;
  400ee6:	48 81 e9 00 01 00 00 	sub    rcx,0x100
			tail_idx++;
  400eed:	be 01 00 00 00       	mov    esi,0x1
		if(tail_size)
  400ef2:	48 85 c9             	test   rcx,rcx
  400ef5:	0f 84 2b ff ff ff    	je     400e26 <allocate_large_object+0xc6>
			struct page* page = get_page(end - tail_size);
  400efb:	4c 89 df             	mov    rdi,r11
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
  400efe:	ba fe 00 00 00       	mov    edx,0xfe
			struct page* page = get_page(end - tail_size);
  400f03:	48 29 cf             	sub    rdi,rcx
			tail->size = tail_size - LARGE_OBJECT_HEADER_SIZE;
  400f06:	48 83 e9 10          	sub    rcx,0x10
			struct page* page = get_page(end - tail_size);
  400f0a:	e8 f1 fa ff ff       	call   400a00 <get_page>
  400f0f:	48 89 c7             	mov    rdi,rax
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
  400f12:	e8 29 fb ff ff       	call   400a40 <allocate_chunk>
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
  400f17:	be 00 01 00 00       	mov    esi,0x100
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
  400f1c:	48 89 c2             	mov    rdx,rax
			tail->next = large_objects;
  400f1f:	48 8b 05 e2 08 00 00 	mov    rax,QWORD PTR [rip+0x8e2]        # 401808 <large_objects>
			tail->size = tail_size - LARGE_OBJECT_HEADER_SIZE;
  400f26:	48 89 4a 08          	mov    QWORD PTR [rdx+0x8],rcx
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
  400f2a:	48 89 d7             	mov    rdi,rdx
			tail->next = large_objects;
  400f2d:	48 89 02             	mov    QWORD PTR [rdx],rax
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
  400f30:	e8 eb fa ff ff       	call   400a20 <get_large_object_payload>
  400f35:	48 01 c1             	add    rcx,rax
  400f38:	48 89 cf             	mov    rdi,rcx
  400f3b:	e8 00 fa ff ff       	call   400940 <align>
  400f40:	48 39 c1             	cmp    rcx,rax
  400f43:	0f 85 0f fe ff ff    	jne    400d58 <allocate_large_object.cold>
			large_objects = tail;
  400f49:	48 89 15 b8 08 00 00 	mov    QWORD PTR [rip+0x8b8],rdx        # 401808 <large_objects>
			maybe_repurpose_single_chunk_large_objects_head();
  400f50:	e8 fb fa ff ff       	call   400a50 <maybe_repurpose_single_chunk_large_objects_head>
  400f55:	e9 c8 fe ff ff       	jmp    400e22 <allocate_large_object+0xc2>
	struct large_object *best = NULL, **best_prev = &large_objects;
  400f5a:	48 8d 2d a7 08 00 00 	lea    rbp,[rip+0x8a7]        # 401808 <large_objects>
  400f61:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
		size_t size_with_header = size + sizeof(struct large_object);
  400f68:	4c 8d 63 10          	lea    r12,[rbx+0x10]
		struct page* page = allocate_pages(size_with_header, &n_allocated);
  400f6c:	48 8d 74 24 08       	lea    rsi,[rsp+0x8]
		size_t n_allocated = 0;
  400f71:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
  400f78:	00 00 
		struct page* page = allocate_pages(size_with_header, &n_allocated);
  400f7a:	4c 89 e7             	mov    rdi,r12
  400f7d:	e8 de fc ff ff       	call   400c60 <allocate_pages.constprop.0>
  400f82:	48 89 c1             	mov    rcx,rax
		if(!page)
  400f85:	48 85 c0             	test   rax,rax
  400f88:	0f 84 10 01 00 00    	je     40109e <allocate_large_object+0x33e>
		char* ptr = allocate_chunk(page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  400f8e:	ba ff 00 00 00       	mov    edx,0xff
  400f93:	be 01 00 00 00       	mov    esi,0x1
  400f98:	48 89 c7             	mov    rdi,rax
  400f9b:	e8 a0 fa ff ff       	call   400a40 <allocate_chunk>
  400fa0:	49 89 c2             	mov    r10,rax
		best->next = large_objects;
  400fa3:	48 8b 05 5e 08 00 00 	mov    rax,QWORD PTR [rip+0x85e]        # 401808 <large_objects>
		size_t page_header = ptr - ((char*)page);
  400faa:	4c 29 d1             	sub    rcx,r10
		best->next = large_objects;
  400fad:	49 89 02             	mov    QWORD PTR [r10],rax
		best->size = best_size = n_allocated * PAGE_SIZE - page_header - LARGE_OBJECT_HEADER_SIZE;
  400fb0:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
  400fb5:	48 c1 e0 10          	shl    rax,0x10
  400fb9:	4c 8d 44 01 f0       	lea    r8,[rcx+rax*1-0x10]
  400fbe:	4d 89 42 08          	mov    QWORD PTR [r10+0x8],r8
		ASSERT(best_size >= size_with_header);
  400fc2:	4d 39 c4             	cmp    r12,r8
  400fc5:	0f 86 22 fe ff ff    	jbe    400ded <allocate_large_object+0x8d>
  400fcb:	e9 88 fd ff ff       	jmp    400d58 <allocate_large_object.cold>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
  400fd0:	4c 39 d8             	cmp    rax,r11
  400fd3:	0f 85 7f fd ff ff    	jne    400d58 <allocate_large_object.cold>
			allocate_chunk(start_page, get_chunk_index(start), FREE_LARGE_OBJECT);
  400fd9:	48 89 ef             	mov    rdi,rbp
  400fdc:	ba fe 00 00 00       	mov    edx,0xfe
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
  400fe1:	44 0f b7 e5          	movzx  r12d,bp
			allocate_chunk(start_page, get_chunk_index(start), FREE_LARGE_OBJECT);
  400fe5:	e8 26 fa ff ff       	call   400a10 <get_chunk_index>
  400fea:	4c 89 cf             	mov    rdi,r9
  400fed:	89 c6                	mov    esi,eax
  400fef:	e8 4c fa ff ff       	call   400a40 <allocate_chunk>
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
  400ff4:	b8 00 00 01 00       	mov    eax,0x10000
  400ff9:	4c 29 e0             	sub    rax,r12
  400ffc:	49 89 42 08          	mov    QWORD PTR [r10+0x8],rax
			head->next = large_objects;
  401000:	48 8b 05 01 08 00 00 	mov    rax,QWORD PTR [rip+0x801]        # 401808 <large_objects>
  401007:	49 89 02             	mov    QWORD PTR [r10],rax
			large_objects = head;
  40100a:	4c 89 15 f7 07 00 00 	mov    QWORD PTR [rip+0x7f7],r10        # 401808 <large_objects>
			maybe_repurpose_single_chunk_large_objects_head();
  401011:	e8 3a fa ff ff       	call   400a50 <maybe_repurpose_single_chunk_large_objects_head>
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  401016:	ba ff 00 00 00       	mov    edx,0xff
  40101b:	be 01 00 00 00       	mov    esi,0x1
			struct page* next_page = start_page + 1;
  401020:	49 8d b9 00 00 01 00 	lea    rdi,[r9+0x10000]
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  401027:	e8 14 fa ff ff       	call   400a40 <allocate_chunk>
			best->size = best_size =
  40102c:	4b 8d 94 04 f0 fe fe 	lea    rdx,[r12+r8*1-0x10110]
  401033:	ff 
  401034:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
  401038:	49 89 c2             	mov    r10,rax
			ASSERT(best_size >= size);
  40103b:	48 39 d3             	cmp    rbx,rdx
  40103e:	0f 87 14 fd ff ff    	ja     400d58 <allocate_large_object.cold>
			tail_size = (best_size - size) & ~CHUNK_MASK;
  401044:	48 89 d1             	mov    rcx,rdx
  401047:	48 29 d9             	sub    rcx,rbx
  40104a:	30 c9                	xor    cl,cl
  40104c:	e9 74 fe ff ff       	jmp    400ec5 <allocate_large_object+0x165>
  401051:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401058:	4c 89 cd             	mov    rbp,r9
  40105b:	49 89 c8             	mov    r8,rcx
  40105e:	49 89 d2             	mov    r10,rdx
  401061:	e9 87 fd ff ff       	jmp    400ded <allocate_large_object+0x8d>
			ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
  401066:	be 00 01 00 00       	mov    esi,0x100
  40106b:	4c 89 df             	mov    rdi,r11
  40106e:	e8 cd f8 ff ff       	call   400940 <align>
  401073:	49 39 c3             	cmp    r11,rax
  401076:	0f 85 dc fc ff ff    	jne    400d58 <allocate_large_object.cold>
		best->size -= tail_size;
  40107c:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
		unsigned tail_idx = get_chunk_index(end - tail_size);
  401080:	48 29 cf             	sub    rdi,rcx
		best->size -= tail_size;
  401083:	48 29 ca             	sub    rdx,rcx
  401086:	49 89 52 08          	mov    QWORD PTR [r10+0x8],rdx
		unsigned tail_idx = get_chunk_index(end - tail_size);
  40108a:	e8 81 f9 ff ff       	call   400a10 <get_chunk_index>
  40108f:	89 c6                	mov    esi,eax
		while(tail_idx < FIRST_ALLOCATABLE_CHUNK && tail_size)
  401091:	85 c0                	test   eax,eax
  401093:	0f 84 4d fe ff ff    	je     400ee6 <allocate_large_object+0x186>
  401099:	e9 5d fe ff ff       	jmp    400efb <allocate_large_object+0x19b>
			return NULL;
  40109e:	45 31 d2             	xor    r10d,r10d
  4010a1:	e9 a1 fd ff ff       	jmp    400e47 <allocate_large_object+0xe7>

Disassembly of section .text.allocate_large:

00000000004010b0 <allocate_large>:
{
  4010b0:	48 83 ec 08          	sub    rsp,0x8
	struct large_object* obj = allocate_large_object(size);
  4010b4:	e8 a7 fc ff ff       	call   400d60 <allocate_large_object>
	return obj ? get_large_object_payload(obj) : NULL;
  4010b9:	48 85 c0             	test   rax,rax
  4010bc:	74 12                	je     4010d0 <allocate_large+0x20>
  4010be:	48 89 c7             	mov    rdi,rax
}
  4010c1:	48 83 c4 08          	add    rsp,0x8
	return obj ? get_large_object_payload(obj) : NULL;
  4010c5:	e9 56 f9 ff ff       	jmp    400a20 <get_large_object_payload>
  4010ca:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
}
  4010d0:	31 c0                	xor    eax,eax
  4010d2:	48 83 c4 08          	add    rsp,0x8
  4010d6:	c3                   	ret    

Disassembly of section .text.obtain_small_objects:

00000000004010e0 <obtain_small_objects>:
{
  4010e0:	55                   	push   rbp
  4010e1:	89 fd                	mov    ebp,edi
	if(*whole_chunk_freelist)
  4010e3:	48 8b 3d 7e 07 00 00 	mov    rdi,QWORD PTR [rip+0x77e]        # 401868 <small_object_freelists+0x48>
  4010ea:	48 85 ff             	test   rdi,rdi
  4010ed:	74 71                	je     401160 <obtain_small_objects+0x80>
		*whole_chunk_freelist = (*whole_chunk_freelist)->next;
  4010ef:	48 8b 07             	mov    rax,QWORD PTR [rdi]
  4010f2:	48 89 05 6f 07 00 00 	mov    QWORD PTR [rip+0x76f],rax        # 401868 <small_object_freelists+0x48>
	char* ptr = allocate_chunk(get_page(chunk), get_chunk_index(chunk), kind);
  4010f9:	e8 12 f9 ff ff       	call   400a10 <get_chunk_index>
  4010fe:	89 ea                	mov    edx,ebp
  401100:	89 c6                	mov    esi,eax
  401102:	e8 f9 f8 ff ff       	call   400a00 <get_page>
  401107:	48 89 c7             	mov    rdi,rax
  40110a:	e8 31 f9 ff ff       	call   400a40 <allocate_chunk>
	size_t size = chunk_kind_to_granules(kind) * GRANULE_SIZE;
  40110f:	89 ef                	mov    edi,ebp
	char* ptr = allocate_chunk(get_page(chunk), get_chunk_index(chunk), kind);
  401111:	48 89 c2             	mov    rdx,rax
	size_t size = chunk_kind_to_granules(kind) * GRANULE_SIZE;
  401114:	e8 c7 f8 ff ff       	call   4009e0 <chunk_kind_to_granules>
  401119:	8d 34 c5 00 00 00 00 	lea    esi,[rax*8+0x0]
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
  401120:	48 81 fe 00 01 00 00 	cmp    rsi,0x100
  401127:	77 46                	ja     40116f <obtain_small_objects+0x8f>
  401129:	48 89 d0             	mov    rax,rdx
  40112c:	48 89 f1             	mov    rcx,rsi
  40112f:	48 29 f0             	sub    rax,rsi
  401132:	48 8d 90 00 01 00 00 	lea    rdx,[rax+0x100]
	struct freelist* next = NULL;
  401139:	31 c0                	xor    eax,eax
  40113b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
		struct freelist* head = (struct freelist*)(end - i);
  401140:	48 89 c7             	mov    rdi,rax
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
  401143:	48 01 f1             	add    rcx,rsi
		struct freelist* head = (struct freelist*)(end - i);
  401146:	48 89 d0             	mov    rax,rdx
		head->next = next;
  401149:	48 89 3a             	mov    QWORD PTR [rdx],rdi
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
  40114c:	48 29 f2             	sub    rdx,rsi
  40114f:	48 81 f9 00 01 00 00 	cmp    rcx,0x100
  401156:	76 e8                	jbe    401140 <obtain_small_objects+0x60>
}
  401158:	5d                   	pop    rbp
  401159:	c3                   	ret    
  40115a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		chunk = allocate_large_object(0);
  401160:	31 ff                	xor    edi,edi
  401162:	e8 f9 fb ff ff       	call   400d60 <allocate_large_object>
  401167:	48 89 c7             	mov    rdi,rax
		if(!chunk)
  40116a:	48 85 c0             	test   rax,rax
  40116d:	75 8a                	jne    4010f9 <obtain_small_objects+0x19>
			return NULL;
  40116f:	31 c0                	xor    eax,eax
}
  401171:	5d                   	pop    rbp
  401172:	c3                   	ret    

Disassembly of section .text.allocate_small:

0000000000401180 <allocate_small>:
{
  401180:	53                   	push   rbx
  401181:	41 89 f8             	mov    r8d,edi
	struct freelist** loc = get_small_object_freelist(kind);
  401184:	e8 17 fa ff ff       	call   400ba0 <get_small_object_freelist>
  401189:	48 89 c3             	mov    rbx,rax
	if(!*loc)
  40118c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  40118f:	48 85 c0             	test   rax,rax
  401192:	74 0c                	je     4011a0 <allocate_small+0x20>
	*loc = ret->next;
  401194:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  401197:	48 89 13             	mov    QWORD PTR [rbx],rdx
}
  40119a:	5b                   	pop    rbx
  40119b:	c3                   	ret    
  40119c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
		struct freelist* freelist = obtain_small_objects(kind);
  4011a0:	44 89 c7             	mov    edi,r8d
  4011a3:	e8 38 ff ff ff       	call   4010e0 <obtain_small_objects>
		if(!freelist)
  4011a8:	48 85 c0             	test   rax,rax
  4011ab:	74 ed                	je     40119a <allocate_small+0x1a>
		*loc = freelist;
  4011ad:	48 89 03             	mov    QWORD PTR [rbx],rax
  4011b0:	eb e2                	jmp    401194 <allocate_small+0x14>

Disassembly of section .text.malloc:

00000000004011c0 <malloc>:
{
  4011c0:	f3 0f 1e fa          	endbr64 
  4011c4:	48 83 ec 08          	sub    rsp,0x8
  4011c8:	49 89 f8             	mov    r8,rdi
	size_t granules = size_to_granules(size);
  4011cb:	e8 d0 f8 ff ff       	call   400aa0 <size_to_granules>
	enum chunk_kind kind = granules_to_chunk_kind(granules);
  4011d0:	89 c7                	mov    edi,eax
  4011d2:	e8 79 f7 ff ff       	call   400950 <granules_to_chunk_kind>
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
  4011d7:	3d ff 00 00 00       	cmp    eax,0xff
  4011dc:	74 12                	je     4011f0 <malloc+0x30>
  4011de:	89 c7                	mov    edi,eax
}
  4011e0:	48 83 c4 08          	add    rsp,0x8
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
  4011e4:	e9 97 ff ff ff       	jmp    401180 <allocate_small>
  4011e9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4011f0:	4c 89 c7             	mov    rdi,r8
}
  4011f3:	48 83 c4 08          	add    rsp,0x8
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
  4011f7:	e9 b4 fe ff ff       	jmp    4010b0 <allocate_large>

Disassembly of section .text.memset:

0000000000401200 <memset>:

#include <stdint.h>
#include <string.h>

void* __attribute__((weak)) memset(void* dest, int c, size_t n)
{
  401200:	f3 0f 1e fa          	endbr64 
  401204:	48 89 f8             	mov    rax,rdi

	/* Fill head and tail with minimal branching. Each
	 * conditional ensures that all the subsequently used
	 * offsets are well-defined and in the dest region. */

	if(!n)
  401207:	48 85 d2             	test   rdx,rdx
  40120a:	74 77                	je     401283 <memset+0x83>
	{
		return dest;
	}

	s[0] = s[n - 1] = (unsigned char)c;
  40120c:	40 88 74 17 ff       	mov    BYTE PTR [rdi+rdx*1-0x1],sil
  401211:	40 88 37             	mov    BYTE PTR [rdi],sil

	if(n <= 2)
  401214:	48 83 fa 02          	cmp    rdx,0x2
  401218:	76 69                	jbe    401283 <memset+0x83>
	{
		return dest;
	}

	s[1] = s[n - 2] = (unsigned char)c;
  40121a:	40 88 74 17 fe       	mov    BYTE PTR [rdi+rdx*1-0x2],sil
  40121f:	40 88 77 01          	mov    BYTE PTR [rdi+0x1],sil
	s[2] = s[n - 3] = (unsigned char)c;
  401223:	40 88 74 17 fd       	mov    BYTE PTR [rdi+rdx*1-0x3],sil
  401228:	40 88 77 02          	mov    BYTE PTR [rdi+0x2],sil

	if(n <= 6)
  40122c:	48 83 fa 06          	cmp    rdx,0x6
  401230:	76 51                	jbe    401283 <memset+0x83>
	{
		return dest;
	}

	s[3] = s[n - 4] = (unsigned char)c;
  401232:	40 88 74 17 fc       	mov    BYTE PTR [rdi+rdx*1-0x4],sil
  401237:	40 88 77 03          	mov    BYTE PTR [rdi+0x3],sil

	if(n <= 8)
  40123b:	48 83 fa 08          	cmp    rdx,0x8
  40123f:	76 42                	jbe    401283 <memset+0x83>
	/* Advance pointer to align it at a 4-byte boundary,
	 * and truncate n to a multiple of 4. The previous code
	 * already took care of any head/tail that get cut off
	 * by the alignment. */

	k = -(uintptr_t)s & 3;
  401241:	48 f7 df             	neg    rdi
	n &= (unsigned long)-4;
	n /= 4;

	// Cast to void first to prevent alignment warning
	uint32_t* ws = (uint32_t*)(void*)s;
	uint32_t wc = c & 0xFF;
  401244:	44 0f b6 c6          	movzx  r8d,sil
	wc |= ((wc << 8) | (wc << 16) | (wc << 24));
  401248:	c1 e6 18             	shl    esi,0x18
	k = -(uintptr_t)s & 3;
  40124b:	83 e7 03             	and    edi,0x3
	wc |= ((wc << 8) | (wc << 16) | (wc << 24));
  40124e:	45 89 c1             	mov    r9d,r8d
	s += k;
  401251:	48 8d 0c 38          	lea    rcx,[rax+rdi*1]
	n -= k;
  401255:	48 29 fa             	sub    rdx,rdi
	wc |= ((wc << 8) | (wc << 16) | (wc << 24));
  401258:	44 89 c7             	mov    edi,r8d
  40125b:	41 c1 e1 10          	shl    r9d,0x10
  40125f:	c1 e7 08             	shl    edi,0x8
  401262:	48 83 e2 fc          	and    rdx,0xfffffffffffffffc
  401266:	44 09 cf             	or     edi,r9d
  401269:	48 01 ca             	add    rdx,rcx
  40126c:	44 09 c7             	or     edi,r8d
  40126f:	09 fe                	or     esi,edi

	/* Pure C fallback with no aliasing violations. */
	for(; n; n--, ws++)
  401271:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
	{
		*ws = wc;
  401278:	89 31                	mov    DWORD PTR [rcx],esi
	for(; n; n--, ws++)
  40127a:	48 83 c1 04          	add    rcx,0x4
  40127e:	48 39 ca             	cmp    rdx,rcx
  401281:	75 f5                	jne    401278 <memset+0x78>
	}

	return dest;
}
  401283:	c3                   	ret    
