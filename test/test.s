
bin/test.elf:     file format elf64-x86-64


Disassembly of section .text:

0000000000400030 <__main>:


int a = 1, b = 2, c = 0;
// unsigned long long __bss_start__ = 0, __bss_end__ = 0;

int __main() {}
  400030:	f3 0f 1e fa          	endbr64 
  400034:	55                   	push   rbp
  400035:	48 89 e5             	mov    rbp,rsp
  400038:	90                   	nop
  400039:	5d                   	pop    rbp
  40003a:	c3                   	ret    

000000000040003b <main>:
// int   __stack_chk_fail() {}
int main(int argc, char** argv)
{
  40003b:	f3 0f 1e fa          	endbr64 
  40003f:	55                   	push   rbp
  400040:	48 89 e5             	mov    rbp,rsp
  400043:	48 81 ec b0 00 00 00 	sub    rsp,0xb0
  40004a:	89 bd 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edi
  400050:	48 89 b5 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],rsi
    // write(2, as, strlen(as));
    puts("Gamessis OS shell\n");
  400057:	48 8d 05 12 33 00 00 	lea    rax,[rip+0x3312]        # 403370 <b+0x4>
  40005e:	48 89 c7             	mov    rdi,rax
  400061:	e8 0a 04 00 00       	call   400470 <puts>
    char cmd[128] = {0};
  400066:	48 c7 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],0x0
  40006d:	00 00 00 00 
  400071:	48 c7 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],0x0
  400078:	00 00 00 00 
  40007c:	48 c7 45 80 00 00 00 	mov    QWORD PTR [rbp-0x80],0x0
  400083:	00 
  400084:	48 c7 45 88 00 00 00 	mov    QWORD PTR [rbp-0x78],0x0
  40008b:	00 
  40008c:	48 c7 45 90 00 00 00 	mov    QWORD PTR [rbp-0x70],0x0
  400093:	00 
  400094:	48 c7 45 98 00 00 00 	mov    QWORD PTR [rbp-0x68],0x0
  40009b:	00 
  40009c:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
  4000a3:	00 
  4000a4:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
  4000ab:	00 
  4000ac:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  4000b3:	00 
  4000b4:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  4000bb:	00 
  4000bc:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  4000c3:	00 
  4000c4:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  4000cb:	00 
  4000cc:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  4000d3:	00 
  4000d4:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  4000db:	00 
  4000dc:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  4000e3:	00 
  4000e4:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  4000eb:	00 
    while (1) {
        memset(cmd, 0, 128);
  4000ec:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  4000f3:	ba 80 00 00 00       	mov    edx,0x80
  4000f8:	be 00 00 00 00       	mov    esi,0x0
  4000fd:	48 89 c7             	mov    rdi,rax
  400100:	e8 0b 04 00 00       	call   400510 <memset>
        int p = 0;
  400105:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        printf("shell:>");
  40010c:	48 8d 05 70 32 00 00 	lea    rax,[rip+0x3270]        # 403383 <b+0x17>
  400113:	48 89 c7             	mov    rdi,rax
  400116:	b8 00 00 00 00       	mov    eax,0x0
  40011b:	e8 f0 26 00 00       	call   402810 <printf>
        // write(2, "shell:>", 7);
        gets(cmd);
  400120:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  400127:	48 89 c7             	mov    rdi,rax
  40012a:	b8 00 00 00 00       	mov    eax,0x0
  40012f:	e8 9c 03 00 00       	call   4004d0 <gets>
        //     if (cmd[p] == '\n') break;
        //     p++;
        //     if (p == 128) p = 0;
        // }
        // cmd[p] = '\0';
        puts(cmd);
  400134:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  40013b:	48 89 c7             	mov    rdi,rax
  40013e:	e8 2d 03 00 00       	call   400470 <puts>
        // write(2, cmd, p);
        if (strcmp(cmd, "version") == 0) { puts("Gamessis OS 1.0.\n"); }
  400143:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  40014a:	48 8d 15 3a 32 00 00 	lea    rdx,[rip+0x323a]        # 40338b <b+0x1f>
  400151:	48 89 d6             	mov    rsi,rdx
  400154:	48 89 c7             	mov    rdi,rax
  400157:	e8 44 04 00 00       	call   4005a0 <strcmp>
  40015c:	85 c0                	test   eax,eax
  40015e:	75 14                	jne    400174 <main+0x139>
  400160:	48 8d 05 2c 32 00 00 	lea    rax,[rip+0x322c]        # 403393 <b+0x27>
  400167:	48 89 c7             	mov    rdi,rax
  40016a:	e8 01 03 00 00       	call   400470 <puts>
  40016f:	e9 78 ff ff ff       	jmp    4000ec <main+0xb1>
        else if (strcmp(cmd, "exit") == 0) {
  400174:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  40017b:	48 8d 15 23 32 00 00 	lea    rdx,[rip+0x3223]        # 4033a5 <b+0x39>
  400182:	48 89 d6             	mov    rsi,rdx
  400185:	48 89 c7             	mov    rdi,rax
  400188:	e8 13 04 00 00       	call   4005a0 <strcmp>
  40018d:	85 c0                	test   eax,eax
  40018f:	0f 84 b2 00 00 00    	je     400247 <main+0x20c>
            break;
        }
        else {
            printf("trying to execute...\n");
  400195:	48 8d 05 0e 32 00 00 	lea    rax,[rip+0x320e]        # 4033aa <b+0x3e>
  40019c:	48 89 c7             	mov    rdi,rax
  40019f:	e8 cc 02 00 00       	call   400470 <puts>
            int pid = 0;
  4001a4:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
            if ((pid = fork()) == 0) {
  4001ab:	e8 50 02 00 00       	call   400400 <fork>
  4001b0:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  4001b3:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  4001b7:	75 4d                	jne    400206 <main+0x1cb>
                printf("forked, ready to execve\n");
  4001b9:	48 8d 05 ff 31 00 00 	lea    rax,[rip+0x31ff]        # 4033bf <b+0x53>
  4001c0:	48 89 c7             	mov    rdi,rax
  4001c3:	e8 a8 02 00 00       	call   400470 <puts>
                if (execve(cmd, NULL, NULL) == -1) {
  4001c8:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  4001cf:	ba 00 00 00 00       	mov    edx,0x0
  4001d4:	be 00 00 00 00       	mov    esi,0x0
  4001d9:	48 89 c7             	mov    rdi,rax
  4001dc:	e8 2f 02 00 00       	call   400410 <execve>
  4001e1:	83 f8 ff             	cmp    eax,0xffffffff
  4001e4:	75 20                	jne    400206 <main+0x1cb>
                    printf("cannot find file:%s\n", cmd);
  4001e6:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  4001ed:	48 89 c6             	mov    rsi,rax
  4001f0:	48 8d 05 e0 31 00 00 	lea    rax,[rip+0x31e0]        # 4033d7 <b+0x6b>
  4001f7:	48 89 c7             	mov    rdi,rax
  4001fa:	b8 00 00 00 00       	mov    eax,0x0
  4001ff:	e8 0c 26 00 00       	call   402810 <printf>
  400204:	eb 42                	jmp    400248 <main+0x20d>
                    break;
                }
            }
            printf("forked. pid=%d\n", pid);
  400206:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  400209:	89 c6                	mov    esi,eax
  40020b:	48 8d 05 da 31 00 00 	lea    rax,[rip+0x31da]        # 4033ec <b+0x80>
  400212:	48 89 c7             	mov    rdi,rax
  400215:	b8 00 00 00 00       	mov    eax,0x0
  40021a:	e8 f1 25 00 00       	call   402810 <printf>
            int loc = 0;
  40021f:	c7 85 6c ff ff ff 00 	mov    DWORD PTR [rbp-0x94],0x0
  400226:	00 00 00 

            waitpid(pid, &loc, 0);
  400229:	48 8d 8d 6c ff ff ff 	lea    rcx,[rbp-0x94]
  400230:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  400233:	ba 00 00 00 00       	mov    edx,0x0
  400238:	48 89 ce             	mov    rsi,rcx
  40023b:	89 c7                	mov    edi,eax
  40023d:	e8 de 01 00 00       	call   400420 <waitpid>
    while (1) {
  400242:	e9 a5 fe ff ff       	jmp    4000ec <main+0xb1>
            break;
  400247:	90                   	nop
    }


    // do_syscall(SYSCAll_WRITE, 2, (int) "test exe running.\n", 0, 0, 0,0);

    return 0;
  400248:	b8 00 00 00 00       	mov    eax,0x0
  40024d:	c9                   	leave  
  40024e:	c3                   	ret    
  40024f:	90                   	nop

0000000000400250 <reg_dev>:
  400250:	55                   	push   rbp
  400251:	48 89 e5             	mov    rbp,rsp
  400254:	b8 00 00 00 00       	mov    eax,0x0
  400259:	55                   	push   rbp
  40025a:	48 0f 05             	rex.W syscall 
  40025d:	5d                   	pop    rbp
  40025e:	c9                   	leave  
  40025f:	c3                   	ret    

0000000000400260 <dispose_dev>:
  400260:	55                   	push   rbp
  400261:	48 89 e5             	mov    rbp,rsp
  400264:	b8 01 00 00 00       	mov    eax,0x1
  400269:	55                   	push   rbp
  40026a:	48 0f 05             	rex.W syscall 
  40026d:	5d                   	pop    rbp
  40026e:	c9                   	leave  
  40026f:	c3                   	ret    

0000000000400270 <reg_drv>:
  400270:	55                   	push   rbp
  400271:	48 89 e5             	mov    rbp,rsp
  400274:	b8 02 00 00 00       	mov    eax,0x2
  400279:	55                   	push   rbp
  40027a:	48 0f 05             	rex.W syscall 
  40027d:	5d                   	pop    rbp
  40027e:	c9                   	leave  
  40027f:	c3                   	ret    

0000000000400280 <dispose_drv>:
  400280:	55                   	push   rbp
  400281:	48 89 e5             	mov    rbp,rsp
  400284:	b8 03 00 00 00       	mov    eax,0x3
  400289:	55                   	push   rbp
  40028a:	48 0f 05             	rex.W syscall 
  40028d:	5d                   	pop    rbp
  40028e:	c9                   	leave  
  40028f:	c3                   	ret    

0000000000400290 <call_drvfunc>:
  400290:	55                   	push   rbp
  400291:	48 89 e5             	mov    rbp,rsp
  400294:	b8 04 00 00 00       	mov    eax,0x4
  400299:	55                   	push   rbp
  40029a:	48 0f 05             	rex.W syscall 
  40029d:	5d                   	pop    rbp
  40029e:	c9                   	leave  
  40029f:	c3                   	ret    

00000000004002a0 <req_mem>:
  4002a0:	55                   	push   rbp
  4002a1:	48 89 e5             	mov    rbp,rsp
  4002a4:	b8 05 00 00 00       	mov    eax,0x5
  4002a9:	55                   	push   rbp
  4002aa:	48 0f 05             	rex.W syscall 
  4002ad:	5d                   	pop    rbp
  4002ae:	c9                   	leave  
  4002af:	c3                   	ret    

00000000004002b0 <free_mem>:
  4002b0:	55                   	push   rbp
  4002b1:	48 89 e5             	mov    rbp,rsp
  4002b4:	b8 06 00 00 00       	mov    eax,0x6
  4002b9:	55                   	push   rbp
  4002ba:	48 0f 05             	rex.W syscall 
  4002bd:	5d                   	pop    rbp
  4002be:	c9                   	leave  
  4002bf:	c3                   	ret    

00000000004002c0 <reg_proc>:
  4002c0:	55                   	push   rbp
  4002c1:	48 89 e5             	mov    rbp,rsp
  4002c4:	b8 07 00 00 00       	mov    eax,0x7
  4002c9:	55                   	push   rbp
  4002ca:	48 0f 05             	rex.W syscall 
  4002cd:	5d                   	pop    rbp
  4002ce:	c9                   	leave  
  4002cf:	c3                   	ret    

00000000004002d0 <del_proc>:
  4002d0:	55                   	push   rbp
  4002d1:	48 89 e5             	mov    rbp,rsp
  4002d4:	b8 08 00 00 00       	mov    eax,0x8
  4002d9:	55                   	push   rbp
  4002da:	48 0f 05             	rex.W syscall 
  4002dd:	5d                   	pop    rbp
  4002de:	c9                   	leave  
  4002df:	c3                   	ret    

00000000004002e0 <get_proc_addr>:
  4002e0:	55                   	push   rbp
  4002e1:	48 89 e5             	mov    rbp,rsp
  4002e4:	b8 09 00 00 00       	mov    eax,0x9
  4002e9:	55                   	push   rbp
  4002ea:	48 0f 05             	rex.W syscall 
  4002ed:	5d                   	pop    rbp
  4002ee:	c9                   	leave  
  4002ef:	c3                   	ret    

00000000004002f0 <chk_vm>:
  4002f0:	55                   	push   rbp
  4002f1:	48 89 e5             	mov    rbp,rsp
  4002f4:	b8 0a 00 00 00       	mov    eax,0xa
  4002f9:	55                   	push   rbp
  4002fa:	48 0f 05             	rex.W syscall 
  4002fd:	5d                   	pop    rbp
  4002fe:	c9                   	leave  
  4002ff:	c3                   	ret    

0000000000400300 <open>:
  400300:	55                   	push   rbp
  400301:	48 89 e5             	mov    rbp,rsp
  400304:	b8 0b 00 00 00       	mov    eax,0xb
  400309:	55                   	push   rbp
  40030a:	48 0f 05             	rex.W syscall 
  40030d:	5d                   	pop    rbp
  40030e:	c9                   	leave  
  40030f:	c3                   	ret    

0000000000400310 <close>:
  400310:	55                   	push   rbp
  400311:	48 89 e5             	mov    rbp,rsp
  400314:	b8 0c 00 00 00       	mov    eax,0xc
  400319:	55                   	push   rbp
  40031a:	48 0f 05             	rex.W syscall 
  40031d:	5d                   	pop    rbp
  40031e:	c9                   	leave  
  40031f:	c3                   	ret    

0000000000400320 <read>:
  400320:	55                   	push   rbp
  400321:	48 89 e5             	mov    rbp,rsp
  400324:	b8 0d 00 00 00       	mov    eax,0xd
  400329:	55                   	push   rbp
  40032a:	48 0f 05             	rex.W syscall 
  40032d:	5d                   	pop    rbp
  40032e:	c9                   	leave  
  40032f:	c3                   	ret    

0000000000400330 <write>:
  400330:	55                   	push   rbp
  400331:	48 89 e5             	mov    rbp,rsp
  400334:	b8 0e 00 00 00       	mov    eax,0xe
  400339:	55                   	push   rbp
  40033a:	48 0f 05             	rex.W syscall 
  40033d:	5d                   	pop    rbp
  40033e:	c9                   	leave  
  40033f:	c3                   	ret    

0000000000400340 <seek>:
  400340:	55                   	push   rbp
  400341:	48 89 e5             	mov    rbp,rsp
  400344:	b8 0f 00 00 00       	mov    eax,0xf
  400349:	55                   	push   rbp
  40034a:	48 0f 05             	rex.W syscall 
  40034d:	5d                   	pop    rbp
  40034e:	c9                   	leave  
  40034f:	c3                   	ret    

0000000000400350 <tell>:
  400350:	55                   	push   rbp
  400351:	48 89 e5             	mov    rbp,rsp
  400354:	b8 10 00 00 00       	mov    eax,0x10
  400359:	55                   	push   rbp
  40035a:	48 0f 05             	rex.W syscall 
  40035d:	5d                   	pop    rbp
  40035e:	c9                   	leave  
  40035f:	c3                   	ret    

0000000000400360 <reg_vol>:
  400360:	55                   	push   rbp
  400361:	48 89 e5             	mov    rbp,rsp
  400364:	b8 11 00 00 00       	mov    eax,0x11
  400369:	55                   	push   rbp
  40036a:	48 0f 05             	rex.W syscall 
  40036d:	5d                   	pop    rbp
  40036e:	c9                   	leave  
  40036f:	c3                   	ret    

0000000000400370 <free_vol>:
  400370:	55                   	push   rbp
  400371:	48 89 e5             	mov    rbp,rsp
  400374:	b8 12 00 00 00       	mov    eax,0x12
  400379:	55                   	push   rbp
  40037a:	48 0f 05             	rex.W syscall 
  40037d:	5d                   	pop    rbp
  40037e:	c9                   	leave  
  40037f:	c3                   	ret    

0000000000400380 <exec>:
  400380:	55                   	push   rbp
  400381:	48 89 e5             	mov    rbp,rsp
  400384:	b8 13 00 00 00       	mov    eax,0x13
  400389:	55                   	push   rbp
  40038a:	48 0f 05             	rex.W syscall 
  40038d:	5d                   	pop    rbp
  40038e:	c9                   	leave  
  40038f:	c3                   	ret    

0000000000400390 <exit>:
  400390:	55                   	push   rbp
  400391:	48 89 e5             	mov    rbp,rsp
  400394:	b8 14 00 00 00       	mov    eax,0x14
  400399:	55                   	push   rbp
  40039a:	48 0f 05             	rex.W syscall 
  40039d:	5d                   	pop    rbp
  40039e:	c9                   	leave  
  40039f:	c3                   	ret    

00000000004003a0 <call>:
  4003a0:	55                   	push   rbp
  4003a1:	48 89 e5             	mov    rbp,rsp
  4003a4:	b8 15 00 00 00       	mov    eax,0x15
  4003a9:	55                   	push   rbp
  4003aa:	48 0f 05             	rex.W syscall 
  4003ad:	5d                   	pop    rbp
  4003ae:	c9                   	leave  
  4003af:	c3                   	ret    

00000000004003b0 <mkfifo>:
  4003b0:	55                   	push   rbp
  4003b1:	48 89 e5             	mov    rbp,rsp
  4003b4:	b8 16 00 00 00       	mov    eax,0x16
  4003b9:	55                   	push   rbp
  4003ba:	48 0f 05             	rex.W syscall 
  4003bd:	5d                   	pop    rbp
  4003be:	c9                   	leave  
  4003bf:	c3                   	ret    

00000000004003c0 <brk>:
  4003c0:	55                   	push   rbp
  4003c1:	48 89 e5             	mov    rbp,rsp
  4003c4:	b8 17 00 00 00       	mov    eax,0x17
  4003c9:	55                   	push   rbp
  4003ca:	48 0f 05             	rex.W syscall 
  4003cd:	5d                   	pop    rbp
  4003ce:	c9                   	leave  
  4003cf:	c3                   	ret    

00000000004003d0 <free>:
  4003d0:	55                   	push   rbp
  4003d1:	48 89 e5             	mov    rbp,rsp
  4003d4:	b8 18 00 00 00       	mov    eax,0x18
  4003d9:	55                   	push   rbp
  4003da:	48 0f 05             	rex.W syscall 
  4003dd:	5d                   	pop    rbp
  4003de:	c9                   	leave  
  4003df:	c3                   	ret    

00000000004003e0 <find_dev>:
  4003e0:	55                   	push   rbp
  4003e1:	48 89 e5             	mov    rbp,rsp
  4003e4:	b8 19 00 00 00       	mov    eax,0x19
  4003e9:	55                   	push   rbp
  4003ea:	48 0f 05             	rex.W syscall 
  4003ed:	5d                   	pop    rbp
  4003ee:	c9                   	leave  
  4003ef:	c3                   	ret    

00000000004003f0 <operate_dev>:
  4003f0:	55                   	push   rbp
  4003f1:	48 89 e5             	mov    rbp,rsp
  4003f4:	b8 1a 00 00 00       	mov    eax,0x1a
  4003f9:	55                   	push   rbp
  4003fa:	48 0f 05             	rex.W syscall 
  4003fd:	5d                   	pop    rbp
  4003fe:	c9                   	leave  
  4003ff:	c3                   	ret    

0000000000400400 <fork>:
  400400:	55                   	push   rbp
  400401:	48 89 e5             	mov    rbp,rsp
  400404:	b8 1b 00 00 00       	mov    eax,0x1b
  400409:	55                   	push   rbp
  40040a:	48 0f 05             	rex.W syscall 
  40040d:	5d                   	pop    rbp
  40040e:	c9                   	leave  
  40040f:	c3                   	ret    

0000000000400410 <execve>:
  400410:	55                   	push   rbp
  400411:	48 89 e5             	mov    rbp,rsp
  400414:	b8 1c 00 00 00       	mov    eax,0x1c
  400419:	55                   	push   rbp
  40041a:	48 0f 05             	rex.W syscall 
  40041d:	5d                   	pop    rbp
  40041e:	c9                   	leave  
  40041f:	c3                   	ret    

0000000000400420 <waitpid>:
  400420:	55                   	push   rbp
  400421:	48 89 e5             	mov    rbp,rsp
  400424:	b8 1d 00 00 00       	mov    eax,0x1d
  400429:	55                   	push   rbp
  40042a:	48 0f 05             	rex.W syscall 
  40042d:	5d                   	pop    rbp
  40042e:	c9                   	leave  
  40042f:	c3                   	ret    

0000000000400430 <mmap>:
  400430:	55                   	push   rbp
  400431:	48 89 e5             	mov    rbp,rsp
  400434:	b8 1e 00 00 00       	mov    eax,0x1e
  400439:	55                   	push   rbp
  40043a:	48 0f 05             	rex.W syscall 
  40043d:	5d                   	pop    rbp
  40043e:	c9                   	leave  
  40043f:	c3                   	ret    

0000000000400440 <munmap>:
  400440:	55                   	push   rbp
  400441:	48 89 e5             	mov    rbp,rsp
  400444:	b8 1f 00 00 00       	mov    eax,0x1f
  400449:	55                   	push   rbp
  40044a:	48 0f 05             	rex.W syscall 
  40044d:	5d                   	pop    rbp
  40044e:	c9                   	leave  
  40044f:	c3                   	ret    

0000000000400450 <mknod>:
  400450:	55                   	push   rbp
  400451:	48 89 e5             	mov    rbp,rsp
  400454:	b8 21 00 00 00       	mov    eax,0x21
  400459:	55                   	push   rbp
  40045a:	48 0f 05             	rex.W syscall 
  40045d:	5d                   	pop    rbp
  40045e:	c9                   	leave  
  40045f:	c3                   	ret    

0000000000400460 <kb_readc>:
  400460:	55                   	push   rbp
  400461:	48 89 e5             	mov    rbp,rsp
  400464:	b8 64 00 00 00       	mov    eax,0x64
  400469:	55                   	push   rbp
  40046a:	48 0f 05             	rex.W syscall 
  40046d:	5d                   	pop    rbp
  40046e:	c9                   	leave  
  40046f:	c3                   	ret    

Disassembly of section .text.puts:

0000000000400470 <puts>:
  400470:	f3 0f 1e fa          	endbr64 
  400474:	41 54                	push   r12
  400476:	55                   	push   rbp
  400477:	48 89 fd             	mov    rbp,rdi
  40047a:	53                   	push   rbx
  40047b:	0f be 3f             	movsx  edi,BYTE PTR [rdi]
  40047e:	40 84 ff             	test   dil,dil
  400481:	74 35                	je     4004b8 <puts+0x48>
  400483:	31 db                	xor    ebx,ebx
  400485:	0f 1f 00             	nop    DWORD PTR [rax]
  400488:	e8 e3 25 00 00       	call   402a70 <putchar>
  40048d:	41 89 dc             	mov    r12d,ebx
  400490:	48 83 c3 01          	add    rbx,0x1
  400494:	0f be 7c 1d 00       	movsx  edi,BYTE PTR [rbp+rbx*1+0x0]
  400499:	40 84 ff             	test   dil,dil
  40049c:	75 ea                	jne    400488 <puts+0x18>
  40049e:	bf 0a 00 00 00       	mov    edi,0xa
  4004a3:	e8 c8 25 00 00       	call   402a70 <putchar>
  4004a8:	41 8d 44 24 02       	lea    eax,[r12+0x2]
  4004ad:	5b                   	pop    rbx
  4004ae:	5d                   	pop    rbp
  4004af:	41 5c                	pop    r12
  4004b1:	c3                   	ret    
  4004b2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4004b8:	5b                   	pop    rbx
  4004b9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  4004be:	5d                   	pop    rbp
  4004bf:	41 5c                	pop    r12
  4004c1:	c3                   	ret    

Disassembly of section .text.gets:

00000000004004d0 <gets>:
  4004d0:	f3 0f 1e fa          	endbr64 
  4004d4:	41 54                	push   r12
  4004d6:	49 89 fc             	mov    r12,rdi
  4004d9:	eb 09                	jmp    4004e4 <gets+0x14>
  4004db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4004e0:	49 83 c4 01          	add    r12,0x1
  4004e4:	31 c0                	xor    eax,eax
  4004e6:	ba 01 00 00 00       	mov    edx,0x1
  4004eb:	4c 89 e6             	mov    rsi,r12
  4004ee:	bf 01 00 00 00       	mov    edi,0x1
  4004f3:	e8 28 fe ff ff       	call   400320 <read>
  4004f8:	41 80 3c 24 0a       	cmp    BYTE PTR [r12],0xa
  4004fd:	75 e1                	jne    4004e0 <gets+0x10>
  4004ff:	4c 89 e0             	mov    rax,r12
  400502:	41 c6 04 24 00       	mov    BYTE PTR [r12],0x0
  400507:	41 5c                	pop    r12
  400509:	c3                   	ret    

Disassembly of section .text.memset:

0000000000400510 <memset>:
  400510:	f3 0f 1e fa          	endbr64 
  400514:	48 89 f8             	mov    rax,rdi
  400517:	48 85 d2             	test   rdx,rdx
  40051a:	74 77                	je     400593 <memset+0x83>
  40051c:	40 88 74 17 ff       	mov    BYTE PTR [rdi+rdx*1-0x1],sil
  400521:	40 88 37             	mov    BYTE PTR [rdi],sil
  400524:	48 83 fa 02          	cmp    rdx,0x2
  400528:	76 69                	jbe    400593 <memset+0x83>
  40052a:	40 88 74 17 fe       	mov    BYTE PTR [rdi+rdx*1-0x2],sil
  40052f:	40 88 77 01          	mov    BYTE PTR [rdi+0x1],sil
  400533:	40 88 74 17 fd       	mov    BYTE PTR [rdi+rdx*1-0x3],sil
  400538:	40 88 77 02          	mov    BYTE PTR [rdi+0x2],sil
  40053c:	48 83 fa 06          	cmp    rdx,0x6
  400540:	76 51                	jbe    400593 <memset+0x83>
  400542:	40 88 74 17 fc       	mov    BYTE PTR [rdi+rdx*1-0x4],sil
  400547:	40 88 77 03          	mov    BYTE PTR [rdi+0x3],sil
  40054b:	48 83 fa 08          	cmp    rdx,0x8
  40054f:	76 42                	jbe    400593 <memset+0x83>
  400551:	48 f7 df             	neg    rdi
  400554:	44 0f b6 c6          	movzx  r8d,sil
  400558:	c1 e6 18             	shl    esi,0x18
  40055b:	83 e7 03             	and    edi,0x3
  40055e:	45 89 c1             	mov    r9d,r8d
  400561:	48 8d 0c 38          	lea    rcx,[rax+rdi*1]
  400565:	48 29 fa             	sub    rdx,rdi
  400568:	44 89 c7             	mov    edi,r8d
  40056b:	41 c1 e1 10          	shl    r9d,0x10
  40056f:	c1 e7 08             	shl    edi,0x8
  400572:	48 83 e2 fc          	and    rdx,0xfffffffffffffffc
  400576:	44 09 cf             	or     edi,r9d
  400579:	48 01 ca             	add    rdx,rcx
  40057c:	44 09 c7             	or     edi,r8d
  40057f:	09 fe                	or     esi,edi
  400581:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  400588:	89 31                	mov    DWORD PTR [rcx],esi
  40058a:	48 83 c1 04          	add    rcx,0x4
  40058e:	48 39 ca             	cmp    rdx,rcx
  400591:	75 f5                	jne    400588 <memset+0x78>
  400593:	c3                   	ret    

Disassembly of section .text.strcmp:

00000000004005a0 <strcmp>:
  4005a0:	f3 0f 1e fa          	endbr64 
  4005a4:	48 39 f7             	cmp    rdi,rsi
  4005a7:	74 34                	je     4005dd <strcmp+0x3d>
  4005a9:	48 85 ff             	test   rdi,rdi
  4005ac:	74 38                	je     4005e6 <strcmp+0x46>
  4005ae:	48 85 f6             	test   rsi,rsi
  4005b1:	74 33                	je     4005e6 <strcmp+0x46>
  4005b3:	0f b6 17             	movzx  edx,BYTE PTR [rdi]
  4005b6:	0f be 0e             	movsx  ecx,BYTE PTR [rsi]
  4005b9:	38 ca                	cmp    dl,cl
  4005bb:	75 23                	jne    4005e0 <strcmp+0x40>
  4005bd:	b8 01 00 00 00       	mov    eax,0x1
  4005c2:	eb 15                	jmp    4005d9 <strcmp+0x39>
  4005c4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  4005c8:	0f b6 14 07          	movzx  edx,BYTE PTR [rdi+rax*1]
  4005cc:	48 83 c0 01          	add    rax,0x1
  4005d0:	0f be 4c 06 ff       	movsx  ecx,BYTE PTR [rsi+rax*1-0x1]
  4005d5:	38 ca                	cmp    dl,cl
  4005d7:	75 07                	jne    4005e0 <strcmp+0x40>
  4005d9:	84 d2                	test   dl,dl
  4005db:	75 eb                	jne    4005c8 <strcmp+0x28>
  4005dd:	31 c0                	xor    eax,eax
  4005df:	c3                   	ret    
  4005e0:	0f be c2             	movsx  eax,dl
  4005e3:	29 c8                	sub    eax,ecx
  4005e5:	c3                   	ret    
  4005e6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  4005eb:	c3                   	ret    

Disassembly of section .text.__libc_init_array:

00000000004005f0 <__libc_init_array>:
  4005f0:	f3 0f 1e fa          	endbr64 
  4005f4:	41 54                	push   r12
  4005f6:	49 c7 c4 00 00 00 00 	mov    r12,0x0
  4005fd:	55                   	push   rbp
  4005fe:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
  400605:	53                   	push   rbx
  400606:	4c 29 e5             	sub    rbp,r12
  400609:	48 c1 fd 03          	sar    rbp,0x3
  40060d:	74 16                	je     400625 <__libc_init_array+0x35>
  40060f:	31 db                	xor    ebx,ebx
  400611:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  400618:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
  40061c:	48 83 c3 01          	add    rbx,0x1
  400620:	48 39 dd             	cmp    rbp,rbx
  400623:	75 f3                	jne    400618 <__libc_init_array+0x28>
  400625:	49 c7 c4 00 00 00 00 	mov    r12,0x0
  40062c:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
  400633:	4c 29 e5             	sub    rbp,r12
  400636:	48 c1 fd 03          	sar    rbp,0x3
  40063a:	74 11                	je     40064d <__libc_init_array+0x5d>
  40063c:	31 db                	xor    ebx,ebx
  40063e:	66 90                	xchg   ax,ax
  400640:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
  400644:	48 83 c3 01          	add    rbx,0x1
  400648:	48 39 dd             	cmp    rbp,rbx
  40064b:	75 f3                	jne    400640 <__libc_init_array+0x50>
  40064d:	5b                   	pop    rbx
  40064e:	5d                   	pop    rbp
  40064f:	41 5c                	pop    r12
  400651:	c3                   	ret    

Disassembly of section .text.__libc_fini_array:

0000000000400660 <__libc_fini_array>:
  400660:	f3 0f 1e fa          	endbr64 
  400664:	55                   	push   rbp
  400665:	53                   	push   rbx
  400666:	48 83 ec 08          	sub    rsp,0x8
  40066a:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
  400671:	48 c7 c3 00 00 00 00 	mov    rbx,0x0
  400678:	48 29 eb             	sub    rbx,rbp
  40067b:	48 c1 fb 03          	sar    rbx,0x3
  40067f:	74 14                	je     400695 <__libc_fini_array+0x35>
  400681:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  400688:	48 83 eb 01          	sub    rbx,0x1
  40068c:	ff 54 dd 00          	call   QWORD PTR [rbp+rbx*8+0x0]
  400690:	48 85 db             	test   rbx,rbx
  400693:	75 f3                	jne    400688 <__libc_fini_array+0x28>
  400695:	48 83 c4 08          	add    rsp,0x8
  400699:	5b                   	pop    rbx
  40069a:	5d                   	pop    rbp
  40069b:	c3                   	ret    

Disassembly of section .text.CRTStartup:

00000000004006a0 <CRTStartup>:
  4006a0:	f3 0f 1e fa          	endbr64 
  4006a4:	48 83 ec 08          	sub    rsp,0x8
  4006a8:	48 c7 c7 fc 33 40 00 	mov    rdi,0x4033fc
  4006af:	48 c7 c2 00 34 40 00 	mov    rdx,0x403400
  4006b6:	31 f6                	xor    esi,esi
  4006b8:	48 29 fa             	sub    rdx,rdi
  4006bb:	e8 50 fe ff ff       	call   400510 <memset>
  4006c0:	48 83 c4 08          	add    rsp,0x8
  4006c4:	e9 27 ff ff ff       	jmp    4005f0 <__libc_init_array>

Disassembly of section .text.entry:

00000000004006d0 <entry>:
  4006d0:	f3 0f 1e fa          	endbr64 
  4006d4:	48 83 ec 08          	sub    rsp,0x8
  4006d8:	e8 c3 ff ff ff       	call   4006a0 <CRTStartup>
  4006dd:	48 83 c4 08          	add    rsp,0x8
  4006e1:	e9 55 f9 ff ff       	jmp    40003b <main>

Disassembly of section .text.get_components:

00000000004006f0 <get_components>:
  4006f0:	66 48 0f 7e c2       	movq   rdx,xmm0
  4006f5:	48 89 f8             	mov    rax,rdi
  4006f8:	48 c1 ea 3f          	shr    rdx,0x3f
  4006fc:	89 d7                	mov    edi,edx
  4006fe:	83 e7 01             	and    edi,0x1
  400701:	48 85 d2             	test   rdx,rdx
  400704:	74 08                	je     40070e <get_components+0x1e>
  400706:	66 0f 57 05 a2 2b 00 	xorpd  xmm0,XMMWORD PTR [rip+0x2ba2]        # 4032b0 <powers_of_10+0x90>
  40070d:	00 
  40070e:	f2 48 0f 2c c8       	cvttsd2si rcx,xmm0
  400713:	66 0f ef d2          	pxor   xmm2,xmm2
  400717:	66 0f 28 c8          	movapd xmm1,xmm0
  40071b:	89 f2                	mov    edx,esi
  40071d:	4c 8d 05 fc 2a 00 00 	lea    r8,[rip+0x2afc]        # 403220 <powers_of_10>
  400724:	f2 41 0f 10 1c d0    	movsd  xmm3,QWORD PTR [r8+rdx*8]
  40072a:	f2 48 0f 2a d1       	cvtsi2sd xmm2,rcx
  40072f:	f2 0f 5c ca          	subsd  xmm1,xmm2
  400733:	66 0f ef d2          	pxor   xmm2,xmm2
  400737:	f2 0f 59 cb          	mulsd  xmm1,xmm3
  40073b:	f2 48 0f 2c d1       	cvttsd2si rdx,xmm1
  400740:	f2 48 0f 2a d2       	cvtsi2sd xmm2,rdx
  400745:	f2 0f 5c ca          	subsd  xmm1,xmm2
  400749:	f2 0f 10 15 6f 2b 00 	movsd  xmm2,QWORD PTR [rip+0x2b6f]        # 4032c0 <powers_of_10+0xa0>
  400750:	00 
  400751:	66 0f 2f ca          	comisd xmm1,xmm2
  400755:	76 51                	jbe    4007a8 <get_components+0xb8>
  400757:	48 83 c2 01          	add    rdx,0x1
  40075b:	66 0f ef c9          	pxor   xmm1,xmm1
  40075f:	f2 48 0f 2a ca       	cvtsi2sd xmm1,rdx
  400764:	66 0f 2f cb          	comisd xmm1,xmm3
  400768:	73 56                	jae    4007c0 <get_components+0xd0>
  40076a:	85 f6                	test   esi,esi
  40076c:	75 27                	jne    400795 <get_components+0xa5>
  40076e:	66 0f ef c9          	pxor   xmm1,xmm1
  400772:	f2 48 0f 2a c9       	cvtsi2sd xmm1,rcx
  400777:	f2 0f 5c c1          	subsd  xmm0,xmm1
  40077b:	66 0f 2f d0          	comisd xmm2,xmm0
  40077f:	76 06                	jbe    400787 <get_components+0x97>
  400781:	66 0f 2f c2          	comisd xmm0,xmm2
  400785:	76 0e                	jbe    400795 <get_components+0xa5>
  400787:	48 89 ce             	mov    rsi,rcx
  40078a:	83 e6 01             	and    esi,0x1
  40078d:	48 83 fe 01          	cmp    rsi,0x1
  400791:	48 83 d9 ff          	sbb    rcx,0xffffffffffffffff
  400795:	48 89 08             	mov    QWORD PTR [rax],rcx
  400798:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
  40079c:	40 88 78 10          	mov    BYTE PTR [rax+0x10],dil
  4007a0:	c3                   	ret    
  4007a1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4007a8:	66 0f 2e ca          	ucomisd xmm1,xmm2
  4007ac:	7a bc                	jp     40076a <get_components+0x7a>
  4007ae:	75 ba                	jne    40076a <get_components+0x7a>
  4007b0:	48 85 d2             	test   rdx,rdx
  4007b3:	75 1b                	jne    4007d0 <get_components+0xe0>
  4007b5:	48 83 c2 01          	add    rdx,0x1
  4007b9:	eb af                	jmp    40076a <get_components+0x7a>
  4007bb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4007c0:	48 83 c1 01          	add    rcx,0x1
  4007c4:	31 d2                	xor    edx,edx
  4007c6:	eb a2                	jmp    40076a <get_components+0x7a>
  4007c8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4007cf:	00 
  4007d0:	f6 c2 01             	test   dl,0x1
  4007d3:	74 95                	je     40076a <get_components+0x7a>
  4007d5:	eb de                	jmp    4007b5 <get_components+0xc5>

Disassembly of section .text.putchar_wrapper:

00000000004007e0 <putchar_wrapper>:
  4007e0:	f3 0f 1e fa          	endbr64 
  4007e4:	40 0f be ff          	movsx  edi,dil
  4007e8:	e9 a3 22 00 00       	jmp    402a90 <putchar_>

Disassembly of section .text.out_rev_:

00000000004007f0 <out_rev_>:
  4007f0:	41 57                	push   r15
  4007f2:	44 89 c0             	mov    eax,r8d
  4007f5:	41 56                	push   r14
  4007f7:	41 89 d6             	mov    r14d,edx
  4007fa:	41 55                	push   r13
  4007fc:	49 89 f5             	mov    r13,rsi
  4007ff:	41 54                	push   r12
  400801:	41 89 cc             	mov    r12d,ecx
  400804:	55                   	push   rbp
  400805:	53                   	push   rbx
  400806:	48 89 fb             	mov    rbx,rdi
  400809:	48 83 ec 18          	sub    rsp,0x18
  40080d:	44 8b 7f 18          	mov    r15d,DWORD PTR [rdi+0x18]
  400811:	44 89 44 24 0c       	mov    DWORD PTR [rsp+0xc],r8d
  400816:	a8 03                	test   al,0x3
  400818:	75 16                	jne    400830 <out_rev_+0x40>
  40081a:	44 89 f8             	mov    eax,r15d
  40081d:	89 d5                	mov    ebp,edx
  40081f:	39 ca                	cmp    edx,ecx
  400821:	0f 82 93 00 00 00    	jb     4008ba <out_rev_+0xca>
  400827:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40082e:	00 00 
  400830:	41 8d 6e ff          	lea    ebp,[r14-0x1]
  400834:	4c 01 ed             	add    rbp,r13
  400837:	45 85 f6             	test   r14d,r14d
  40083a:	75 16                	jne    400852 <out_rev_+0x62>
  40083c:	eb 42                	jmp    400880 <out_rev_+0x90>
  40083e:	66 90                	xchg   ax,ax
  400840:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  400844:	ff d2                	call   rdx
  400846:	48 8d 45 ff          	lea    rax,[rbp-0x1]
  40084a:	49 39 ed             	cmp    r13,rbp
  40084d:	74 31                	je     400880 <out_rev_+0x90>
  40084f:	48 89 c5             	mov    rbp,rax
  400852:	8b 43 18             	mov    eax,DWORD PTR [rbx+0x18]
  400855:	0f be 7d 00          	movsx  edi,BYTE PTR [rbp+0x0]
  400859:	8d 50 01             	lea    edx,[rax+0x1]
  40085c:	89 53 18             	mov    DWORD PTR [rbx+0x18],edx
  40085f:	3b 43 1c             	cmp    eax,DWORD PTR [rbx+0x1c]
  400862:	73 e2                	jae    400846 <out_rev_+0x56>
  400864:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
  400867:	48 85 d2             	test   rdx,rdx
  40086a:	75 d4                	jne    400840 <out_rev_+0x50>
  40086c:	48 8b 53 10          	mov    rdx,QWORD PTR [rbx+0x10]
  400870:	40 88 3c 02          	mov    BYTE PTR [rdx+rax*1],dil
  400874:	48 8d 45 ff          	lea    rax,[rbp-0x1]
  400878:	49 39 ed             	cmp    r13,rbp
  40087b:	75 d2                	jne    40084f <out_rev_+0x5f>
  40087d:	0f 1f 00             	nop    DWORD PTR [rax]
  400880:	f6 44 24 0c 02       	test   BYTE PTR [rsp+0xc],0x2
  400885:	75 61                	jne    4008e8 <out_rev_+0xf8>
  400887:	48 83 c4 18          	add    rsp,0x18
  40088b:	5b                   	pop    rbx
  40088c:	5d                   	pop    rbp
  40088d:	41 5c                	pop    r12
  40088f:	41 5d                	pop    r13
  400891:	41 5e                	pop    r14
  400893:	41 5f                	pop    r15
  400895:	c3                   	ret    
  400896:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40089d:	00 00 00 
  4008a0:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  4008a4:	bf 20 00 00 00       	mov    edi,0x20
  4008a9:	ff d2                	call   rdx
  4008ab:	83 c5 01             	add    ebp,0x1
  4008ae:	41 39 ec             	cmp    r12d,ebp
  4008b1:	0f 84 79 ff ff ff    	je     400830 <out_rev_+0x40>
  4008b7:	8b 43 18             	mov    eax,DWORD PTR [rbx+0x18]
  4008ba:	8d 50 01             	lea    edx,[rax+0x1]
  4008bd:	89 53 18             	mov    DWORD PTR [rbx+0x18],edx
  4008c0:	39 43 1c             	cmp    DWORD PTR [rbx+0x1c],eax
  4008c3:	76 e6                	jbe    4008ab <out_rev_+0xbb>
  4008c5:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
  4008c8:	48 85 d2             	test   rdx,rdx
  4008cb:	75 d3                	jne    4008a0 <out_rev_+0xb0>
  4008cd:	48 8b 53 10          	mov    rdx,QWORD PTR [rbx+0x10]
  4008d1:	c6 04 02 20          	mov    BYTE PTR [rdx+rax*1],0x20
  4008d5:	eb d4                	jmp    4008ab <out_rev_+0xbb>
  4008d7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4008de:	00 00 
  4008e0:	48 8b 53 10          	mov    rdx,QWORD PTR [rbx+0x10]
  4008e4:	c6 04 02 20          	mov    BYTE PTR [rdx+rax*1],0x20
  4008e8:	8b 43 18             	mov    eax,DWORD PTR [rbx+0x18]
  4008eb:	89 c2                	mov    edx,eax
  4008ed:	44 29 fa             	sub    edx,r15d
  4008f0:	41 39 d4             	cmp    r12d,edx
  4008f3:	76 92                	jbe    400887 <out_rev_+0x97>
  4008f5:	8d 48 01             	lea    ecx,[rax+0x1]
  4008f8:	83 c2 01             	add    edx,0x1
  4008fb:	89 4b 18             	mov    DWORD PTR [rbx+0x18],ecx
  4008fe:	39 43 1c             	cmp    DWORD PTR [rbx+0x1c],eax
  400901:	76 1d                	jbe    400920 <out_rev_+0x130>
  400903:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
  400906:	48 85 d2             	test   rdx,rdx
  400909:	74 d5                	je     4008e0 <out_rev_+0xf0>
  40090b:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  40090f:	bf 20 00 00 00       	mov    edi,0x20
  400914:	ff d2                	call   rdx
  400916:	8b 43 18             	mov    eax,DWORD PTR [rbx+0x18]
  400919:	89 c2                	mov    edx,eax
  40091b:	44 29 fa             	sub    edx,r15d
  40091e:	eb d0                	jmp    4008f0 <out_rev_+0x100>
  400920:	89 c8                	mov    eax,ecx
  400922:	eb cc                	jmp    4008f0 <out_rev_+0x100>

Disassembly of section .text.print_integer:

0000000000400930 <print_integer>:
  400930:	41 57                	push   r15
  400932:	45 89 c3             	mov    r11d,r8d
  400935:	41 56                	push   r14
  400937:	41 55                	push   r13
  400939:	41 54                	push   r12
  40093b:	41 89 cc             	mov    r12d,ecx
  40093e:	55                   	push   rbp
  40093f:	48 89 fd             	mov    rbp,rdi
  400942:	53                   	push   rbx
  400943:	89 d3                	mov    ebx,edx
  400945:	48 83 ec 28          	sub    rsp,0x28
  400949:	44 8b 44 24 60       	mov    r8d,DWORD PTR [rsp+0x60]
  40094e:	48 85 f6             	test   rsi,rsi
  400951:	0f 85 39 01 00 00    	jne    400a90 <print_integer+0x160>
  400957:	41 f7 c0 00 08 00 00 	test   r8d,0x800
  40095e:	0f 85 0c 02 00 00    	jne    400b70 <print_integer+0x240>
  400964:	c6 04 24 30          	mov    BYTE PTR [rsp],0x30
  400968:	41 83 e0 ef          	and    r8d,0xffffffef
  40096c:	bf 01 00 00 00       	mov    edi,0x1
  400971:	41 bd 01 00 00 00    	mov    r13d,0x1
  400977:	41 f6 c0 02          	test   r8b,0x2
  40097b:	0f 85 7f 01 00 00    	jne    400b00 <print_integer+0x1d0>
  400981:	44 89 c0             	mov    eax,r8d
  400984:	83 e0 01             	and    eax,0x1
  400987:	45 85 c9             	test   r9d,r9d
  40098a:	0f 84 70 01 00 00    	je     400b00 <print_integer+0x1d0>
  400990:	85 c0                	test   eax,eax
  400992:	0f 84 68 01 00 00    	je     400b00 <print_integer+0x1d0>
  400998:	84 db                	test   bl,bl
  40099a:	0f 85 70 02 00 00    	jne    400c10 <print_integer+0x2e0>
  4009a0:	41 f6 c0 0c          	test   r8b,0xc
  4009a4:	0f 85 66 02 00 00    	jne    400c10 <print_integer+0x2e0>
  4009aa:	45 39 cd             	cmp    r13d,r9d
  4009ad:	0f 83 4d 01 00 00    	jae    400b00 <print_integer+0x1d0>
  4009b3:	40 84 ff             	test   dil,dil
  4009b6:	0f 84 44 01 00 00    	je     400b00 <print_integer+0x1d0>
  4009bc:	48 89 e6             	mov    rsi,rsp
  4009bf:	44 89 e8             	mov    eax,r13d
  4009c2:	44 89 ea             	mov    edx,r13d
  4009c5:	48 01 f0             	add    rax,rsi
  4009c8:	eb 0a                	jmp    4009d4 <print_integer+0xa4>
  4009ca:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4009d0:	84 c9                	test   cl,cl
  4009d2:	74 15                	je     4009e9 <print_integer+0xb9>
  4009d4:	83 c2 01             	add    edx,0x1
  4009d7:	c6 00 30             	mov    BYTE PTR [rax],0x30
  4009da:	83 fa 1f             	cmp    edx,0x1f
  4009dd:	0f 96 c1             	setbe  cl
  4009e0:	48 83 c0 01          	add    rax,0x1
  4009e4:	44 39 ca             	cmp    edx,r9d
  4009e7:	72 e7                	jb     4009d0 <print_integer+0xa0>
  4009e9:	41 39 d3             	cmp    r11d,edx
  4009ec:	76 26                	jbe    400a14 <print_integer+0xe4>
  4009ee:	84 c9                	test   cl,cl
  4009f0:	74 22                	je     400a14 <print_integer+0xe4>
  4009f2:	89 d0                	mov    eax,edx
  4009f4:	48 01 f0             	add    rax,rsi
  4009f7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4009fe:	00 00 
  400a00:	83 c2 01             	add    edx,0x1
  400a03:	c6 00 30             	mov    BYTE PTR [rax],0x30
  400a06:	48 83 c0 01          	add    rax,0x1
  400a0a:	41 39 d3             	cmp    r11d,edx
  400a0d:	76 05                	jbe    400a14 <print_integer+0xe4>
  400a0f:	83 fa 1f             	cmp    edx,0x1f
  400a12:	76 ec                	jbe    400a00 <print_integer+0xd0>
  400a14:	41 39 d5             	cmp    r13d,edx
  400a17:	40 0f 92 c7          	setb   dil
  400a1b:	41 80 fc 08          	cmp    r12b,0x8
  400a1f:	0f 94 c0             	sete   al
  400a22:	40 20 f8             	and    al,dil
  400a25:	74 06                	je     400a2d <print_integer+0xfd>
  400a27:	41 83 e0 ef          	and    r8d,0xffffffef
  400a2b:	89 c7                	mov    edi,eax
  400a2d:	41 f7 c0 10 20 00 00 	test   r8d,0x2010
  400a34:	0f 84 12 01 00 00    	je     400b4c <print_integer+0x21c>
  400a3a:	41 f7 c0 00 08 00 00 	test   r8d,0x800
  400a41:	0f 84 d9 00 00 00    	je     400b20 <print_integer+0x1f0>
  400a47:	83 fa 1f             	cmp    edx,0x1f
  400a4a:	0f 96 c0             	setbe  al
  400a4d:	41 80 fc 10          	cmp    r12b,0x10
  400a51:	0f 84 c9 01 00 00    	je     400c20 <print_integer+0x2f0>
  400a57:	41 80 fc 02          	cmp    r12b,0x2
  400a5b:	75 0d                	jne    400a6a <print_integer+0x13a>
  400a5d:	84 c0                	test   al,al
  400a5f:	74 09                	je     400a6a <print_integer+0x13a>
  400a61:	89 d0                	mov    eax,edx
  400a63:	83 c2 01             	add    edx,0x1
  400a66:	c6 04 04 62          	mov    BYTE PTR [rsp+rax*1],0x62
  400a6a:	83 fa 20             	cmp    edx,0x20
  400a6d:	0f 85 93 01 00 00    	jne    400c06 <print_integer+0x2d6>
  400a73:	48 89 ef             	mov    rdi,rbp
  400a76:	44 89 c9             	mov    ecx,r9d
  400a79:	e8 72 fd ff ff       	call   4007f0 <out_rev_>
  400a7e:	48 83 c4 28          	add    rsp,0x28
  400a82:	5b                   	pop    rbx
  400a83:	5d                   	pop    rbp
  400a84:	41 5c                	pop    r12
  400a86:	41 5d                	pop    r13
  400a88:	41 5e                	pop    r14
  400a8a:	41 5f                	pop    r15
  400a8c:	c3                   	ret    
  400a8d:	0f 1f 00             	nop    DWORD PTR [rax]
  400a90:	44 89 c0             	mov    eax,r8d
  400a93:	44 0f b6 d1          	movzx  r10d,cl
  400a97:	4c 8d 7c 24 ff       	lea    r15,[rsp-0x1]
  400a9c:	b9 01 00 00 00       	mov    ecx,0x1
  400aa1:	83 e0 20             	and    eax,0x20
  400aa4:	83 f8 01             	cmp    eax,0x1
  400aa7:	45 19 f6             	sbb    r14d,r14d
  400aaa:	41 83 e6 20          	and    r14d,0x20
  400aae:	41 83 c6 37          	add    r14d,0x37
  400ab2:	eb 07                	jmp    400abb <print_integer+0x18b>
  400ab4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  400ab8:	48 89 c6             	mov    rsi,rax
  400abb:	31 d2                	xor    edx,edx
  400abd:	48 89 f0             	mov    rax,rsi
  400ac0:	49 f7 f2             	div    r10
  400ac3:	44 8d 6a 30          	lea    r13d,[rdx+0x30]
  400ac7:	48 83 fa 09          	cmp    rdx,0x9
  400acb:	41 8d 3c 16          	lea    edi,[r14+rdx*1]
  400acf:	41 0f 46 fd          	cmovbe edi,r13d
  400ad3:	83 f9 1f             	cmp    ecx,0x1f
  400ad6:	41 89 cd             	mov    r13d,ecx
  400ad9:	0f 96 c2             	setbe  dl
  400adc:	41 88 3c 0f          	mov    BYTE PTR [r15+rcx*1],dil
  400ae0:	89 d7                	mov    edi,edx
  400ae2:	48 83 c1 01          	add    rcx,0x1
  400ae6:	4c 39 d6             	cmp    rsi,r10
  400ae9:	0f 82 88 fe ff ff    	jb     400977 <print_integer+0x47>
  400aef:	84 d2                	test   dl,dl
  400af1:	75 c5                	jne    400ab8 <print_integer+0x188>
  400af3:	41 f6 c0 02          	test   r8b,0x2
  400af7:	0f 84 84 fe ff ff    	je     400981 <print_integer+0x51>
  400afd:	0f 1f 00             	nop    DWORD PTR [rax]
  400b00:	45 39 dd             	cmp    r13d,r11d
  400b03:	44 89 ea             	mov    edx,r13d
  400b06:	48 89 e6             	mov    rsi,rsp
  400b09:	0f 92 c0             	setb   al
  400b0c:	40 20 c7             	and    dil,al
  400b0f:	0f 85 dd fe ff ff    	jne    4009f2 <print_integer+0xc2>
  400b15:	e9 13 ff ff ff       	jmp    400a2d <print_integer+0xfd>
  400b1a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  400b20:	85 d2                	test   edx,edx
  400b22:	0f 85 88 00 00 00    	jne    400bb0 <print_integer+0x280>
  400b28:	41 80 fc 10          	cmp    r12b,0x10
  400b2c:	0f 84 18 01 00 00    	je     400c4a <print_integer+0x31a>
  400b32:	41 80 fc 02          	cmp    r12b,0x2
  400b36:	0f 85 30 01 00 00    	jne    400c6c <print_integer+0x33c>
  400b3c:	c6 04 24 62          	mov    BYTE PTR [rsp],0x62
  400b40:	b8 01 00 00 00       	mov    eax,0x1
  400b45:	c6 04 04 30          	mov    BYTE PTR [rsp+rax*1],0x30
  400b49:	8d 50 01             	lea    edx,[rax+0x1]
  400b4c:	83 fa 20             	cmp    edx,0x20
  400b4f:	0f 84 1e ff ff ff    	je     400a73 <print_integer+0x143>
  400b55:	84 db                	test   bl,bl
  400b57:	74 37                	je     400b90 <print_integer+0x260>
  400b59:	89 d0                	mov    eax,edx
  400b5b:	83 c2 01             	add    edx,0x1
  400b5e:	c6 04 04 2d          	mov    BYTE PTR [rsp+rax*1],0x2d
  400b62:	e9 0c ff ff ff       	jmp    400a73 <print_integer+0x143>
  400b67:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  400b6e:	00 00 
  400b70:	44 89 c0             	mov    eax,r8d
  400b73:	45 31 ed             	xor    r13d,r13d
  400b76:	41 83 e0 ef          	and    r8d,0xffffffef
  400b7a:	80 f9 10             	cmp    cl,0x10
  400b7d:	44 0f 45 c0          	cmovne r8d,eax
  400b81:	bf 01 00 00 00       	mov    edi,0x1
  400b86:	e9 ec fd ff ff       	jmp    400977 <print_integer+0x47>
  400b8b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  400b90:	41 f6 c0 04          	test   r8b,0x4
  400b94:	75 62                	jne    400bf8 <print_integer+0x2c8>
  400b96:	41 f6 c0 08          	test   r8b,0x8
  400b9a:	0f 84 d3 fe ff ff    	je     400a73 <print_integer+0x143>
  400ba0:	89 d0                	mov    eax,edx
  400ba2:	83 c2 01             	add    edx,0x1
  400ba5:	c6 04 04 20          	mov    BYTE PTR [rsp+rax*1],0x20
  400ba9:	e9 c5 fe ff ff       	jmp    400a73 <print_integer+0x143>
  400bae:	66 90                	xchg   ax,ax
  400bb0:	41 39 d3             	cmp    r11d,edx
  400bb3:	74 09                	je     400bbe <print_integer+0x28e>
  400bb5:	44 39 ca             	cmp    edx,r9d
  400bb8:	0f 85 89 fe ff ff    	jne    400a47 <print_integer+0x117>
  400bbe:	40 84 ff             	test   dil,dil
  400bc1:	0f 84 80 fe ff ff    	je     400a47 <print_integer+0x117>
  400bc7:	89 d0                	mov    eax,edx
  400bc9:	83 e8 01             	sub    eax,0x1
  400bcc:	0f 84 56 ff ff ff    	je     400b28 <print_integer+0x1f8>
  400bd2:	b9 04 00 01 00       	mov    ecx,0x10004
  400bd7:	4c 0f a3 e1          	bt     rcx,r12
  400bdb:	0f 83 a7 00 00 00    	jae    400c88 <print_integer+0x358>
  400be1:	41 39 c5             	cmp    r13d,eax
  400be4:	0f 83 9e 00 00 00    	jae    400c88 <print_integer+0x358>
  400bea:	83 ea 02             	sub    edx,0x2
  400bed:	e9 55 fe ff ff       	jmp    400a47 <print_integer+0x117>
  400bf2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  400bf8:	89 d0                	mov    eax,edx
  400bfa:	83 c2 01             	add    edx,0x1
  400bfd:	c6 04 04 2b          	mov    BYTE PTR [rsp+rax*1],0x2b
  400c01:	e9 6d fe ff ff       	jmp    400a73 <print_integer+0x143>
  400c06:	89 d0                	mov    eax,edx
  400c08:	e9 38 ff ff ff       	jmp    400b45 <print_integer+0x215>
  400c0d:	0f 1f 00             	nop    DWORD PTR [rax]
  400c10:	41 83 e9 01          	sub    r9d,0x1
  400c14:	e9 91 fd ff ff       	jmp    4009aa <print_integer+0x7a>
  400c19:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  400c20:	44 89 c1             	mov    ecx,r8d
  400c23:	83 e1 20             	and    ecx,0x20
  400c26:	75 0c                	jne    400c34 <print_integer+0x304>
  400c28:	84 c0                	test   al,al
  400c2a:	75 4e                	jne    400c7a <print_integer+0x34a>
  400c2c:	85 c9                	test   ecx,ecx
  400c2e:	0f 84 36 fe ff ff    	je     400a6a <print_integer+0x13a>
  400c34:	84 c0                	test   al,al
  400c36:	0f 84 2e fe ff ff    	je     400a6a <print_integer+0x13a>
  400c3c:	89 d0                	mov    eax,edx
  400c3e:	83 c2 01             	add    edx,0x1
  400c41:	c6 04 04 58          	mov    BYTE PTR [rsp+rax*1],0x58
  400c45:	e9 20 fe ff ff       	jmp    400a6a <print_integer+0x13a>
  400c4a:	41 f6 c0 20          	test   r8b,0x20
  400c4e:	75 0e                	jne    400c5e <print_integer+0x32e>
  400c50:	c6 04 24 78          	mov    BYTE PTR [rsp],0x78
  400c54:	b8 01 00 00 00       	mov    eax,0x1
  400c59:	e9 e7 fe ff ff       	jmp    400b45 <print_integer+0x215>
  400c5e:	c6 04 24 58          	mov    BYTE PTR [rsp],0x58
  400c62:	b8 01 00 00 00       	mov    eax,0x1
  400c67:	e9 d9 fe ff ff       	jmp    400b45 <print_integer+0x215>
  400c6c:	c6 04 24 30          	mov    BYTE PTR [rsp],0x30
  400c70:	ba 01 00 00 00       	mov    edx,0x1
  400c75:	e9 db fe ff ff       	jmp    400b55 <print_integer+0x225>
  400c7a:	89 d0                	mov    eax,edx
  400c7c:	83 c2 01             	add    edx,0x1
  400c7f:	c6 04 04 78          	mov    BYTE PTR [rsp+rax*1],0x78
  400c83:	e9 e2 fd ff ff       	jmp    400a6a <print_integer+0x13a>
  400c88:	89 c2                	mov    edx,eax
  400c8a:	e9 b8 fd ff ff       	jmp    400a47 <print_integer+0x117>

Disassembly of section .text.print_broken_up_decimal.isra.0:

0000000000400c90 <print_broken_up_decimal.isra.0>:
  400c90:	41 56                	push   r14
  400c92:	49 89 ca             	mov    r10,rcx
  400c95:	41 89 d3             	mov    r11d,edx
  400c98:	41 55                	push   r13
  400c9a:	45 89 c5             	mov    r13d,r8d
  400c9d:	41 54                	push   r12
  400c9f:	55                   	push   rbp
  400ca0:	53                   	push   rbx
  400ca1:	44 8b 44 24 30       	mov    r8d,DWORD PTR [rsp+0x30]
  400ca6:	48 8b 6c 24 38       	mov    rbp,QWORD PTR [rsp+0x38]
  400cab:	8b 4c 24 40          	mov    ecx,DWORD PTR [rsp+0x40]
  400caf:	45 85 ed             	test   r13d,r13d
  400cb2:	0f 84 90 00 00 00    	je     400d48 <print_broken_up_decimal.isra.0+0xb8>
  400cb8:	44 89 c0             	mov    eax,r8d
  400cbb:	25 10 10 00 00       	and    eax,0x1010
  400cc0:	3d 00 10 00 00       	cmp    eax,0x1000
  400cc5:	0f 84 05 02 00 00    	je     400ed0 <print_broken_up_decimal.isra.0+0x240>
  400ccb:	41 89 cc             	mov    r12d,ecx
  400cce:	89 cb                	mov    ebx,ecx
  400cd0:	42 8d 4c 29 ff       	lea    ecx,[rcx+r13*1-0x1]
  400cd5:	49 bd 67 66 66 66 66 	movabs r13,0x6666666666666667
  400cdc:	66 66 66 
  400cdf:	49 01 ec             	add    r12,rbp
  400ce2:	eb 43                	jmp    400d27 <print_broken_up_decimal.isra.0+0x97>
  400ce4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  400ce8:	48 89 f0             	mov    rax,rsi
  400ceb:	41 89 ce             	mov    r14d,ecx
  400cee:	49 83 c4 01          	add    r12,0x1
  400cf2:	49 f7 ed             	imul   r13
  400cf5:	48 89 f0             	mov    rax,rsi
  400cf8:	41 29 de             	sub    r14d,ebx
  400cfb:	83 c3 01             	add    ebx,0x1
  400cfe:	48 c1 f8 3f          	sar    rax,0x3f
  400d02:	48 c1 fa 02          	sar    rdx,0x2
  400d06:	48 29 c2             	sub    rdx,rax
  400d09:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  400d0d:	48 01 c0             	add    rax,rax
  400d10:	48 29 c6             	sub    rsi,rax
  400d13:	83 c6 30             	add    esi,0x30
  400d16:	41 88 74 24 ff       	mov    BYTE PTR [r12-0x1],sil
  400d1b:	48 89 d6             	mov    rsi,rdx
  400d1e:	48 85 d2             	test   rdx,rdx
  400d21:	0f 84 f9 00 00 00    	je     400e20 <print_broken_up_decimal.isra.0+0x190>
  400d27:	83 fb 20             	cmp    ebx,0x20
  400d2a:	75 bc                	jne    400ce8 <print_broken_up_decimal.isra.0+0x58>
  400d2c:	44 89 c0             	mov    eax,r8d
  400d2f:	83 e0 03             	and    eax,0x3
  400d32:	83 f8 01             	cmp    eax,0x1
  400d35:	0f 84 35 01 00 00    	je     400e70 <print_broken_up_decimal.isra.0+0x1e0>
  400d3b:	ba 20 00 00 00       	mov    edx,0x20
  400d40:	e9 7d 00 00 00       	jmp    400dc2 <print_broken_up_decimal.isra.0+0x132>
  400d45:	0f 1f 00             	nop    DWORD PTR [rax]
  400d48:	41 f6 c0 10          	test   r8b,0x10
  400d4c:	0f 85 8e 00 00 00    	jne    400de0 <print_broken_up_decimal.isra.0+0x150>
  400d52:	48 bb 67 66 66 66 66 	movabs rbx,0x6666666666666667
  400d59:	66 66 66 
  400d5c:	89 ce                	mov    esi,ecx
  400d5e:	48 01 ee             	add    rsi,rbp
  400d61:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  400d68:	83 f9 20             	cmp    ecx,0x20
  400d6b:	74 bf                	je     400d2c <print_broken_up_decimal.isra.0+0x9c>
  400d6d:	48 89 f8             	mov    rax,rdi
  400d70:	83 c1 01             	add    ecx,0x1
  400d73:	48 83 c6 01          	add    rsi,0x1
  400d77:	48 f7 eb             	imul   rbx
  400d7a:	48 89 f8             	mov    rax,rdi
  400d7d:	48 c1 f8 3f          	sar    rax,0x3f
  400d81:	48 c1 fa 02          	sar    rdx,0x2
  400d85:	48 29 c2             	sub    rdx,rax
  400d88:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  400d8c:	48 01 c0             	add    rax,rax
  400d8f:	48 29 c7             	sub    rdi,rax
  400d92:	83 c7 30             	add    edi,0x30
  400d95:	40 88 7e ff          	mov    BYTE PTR [rsi-0x1],dil
  400d99:	48 89 d7             	mov    rdi,rdx
  400d9c:	48 85 d2             	test   rdx,rdx
  400d9f:	75 c7                	jne    400d68 <print_broken_up_decimal.isra.0+0xd8>
  400da1:	44 89 c0             	mov    eax,r8d
  400da4:	83 e0 03             	and    eax,0x3
  400da7:	83 f8 01             	cmp    eax,0x1
  400daa:	0f 84 b8 01 00 00    	je     400f68 <print_broken_up_decimal.isra.0+0x2d8>
  400db0:	83 f9 20             	cmp    ecx,0x20
  400db3:	74 86                	je     400d3b <print_broken_up_decimal.isra.0+0xab>
  400db5:	45 84 db             	test   r11b,r11b
  400db8:	74 46                	je     400e00 <print_broken_up_decimal.isra.0+0x170>
  400dba:	c6 44 0d 00 2d       	mov    BYTE PTR [rbp+rcx*1+0x0],0x2d
  400dbf:	8d 51 01             	lea    edx,[rcx+0x1]
  400dc2:	5b                   	pop    rbx
  400dc3:	48 89 ee             	mov    rsi,rbp
  400dc6:	44 89 c9             	mov    ecx,r9d
  400dc9:	5d                   	pop    rbp
  400dca:	4c 89 d7             	mov    rdi,r10
  400dcd:	41 5c                	pop    r12
  400dcf:	41 5d                	pop    r13
  400dd1:	41 5e                	pop    r14
  400dd3:	e9 18 fa ff ff       	jmp    4007f0 <out_rev_>
  400dd8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  400ddf:	00 
  400de0:	83 f9 20             	cmp    ecx,0x20
  400de3:	0f 84 43 ff ff ff    	je     400d2c <print_broken_up_decimal.isra.0+0x9c>
  400de9:	89 c8                	mov    eax,ecx
  400deb:	83 c1 01             	add    ecx,0x1
  400dee:	c6 44 05 00 2e       	mov    BYTE PTR [rbp+rax*1+0x0],0x2e
  400df3:	e9 5a ff ff ff       	jmp    400d52 <print_broken_up_decimal.isra.0+0xc2>
  400df8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  400dff:	00 
  400e00:	41 f6 c0 04          	test   r8b,0x4
  400e04:	0f 85 3e 01 00 00    	jne    400f48 <print_broken_up_decimal.isra.0+0x2b8>
  400e0a:	89 ca                	mov    edx,ecx
  400e0c:	41 f6 c0 08          	test   r8b,0x8
  400e10:	74 b0                	je     400dc2 <print_broken_up_decimal.isra.0+0x132>
  400e12:	c6 44 0d 00 20       	mov    BYTE PTR [rbp+rcx*1+0x0],0x20
  400e17:	83 c2 01             	add    edx,0x1
  400e1a:	eb a6                	jmp    400dc2 <print_broken_up_decimal.isra.0+0x132>
  400e1c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  400e20:	83 fb 1f             	cmp    ebx,0x1f
  400e23:	77 13                	ja     400e38 <print_broken_up_decimal.isra.0+0x1a8>
  400e25:	45 85 f6             	test   r14d,r14d
  400e28:	89 d8                	mov    eax,ebx
  400e2a:	0f 95 c2             	setne  dl
  400e2d:	48 01 e8             	add    rax,rbp
  400e30:	84 d2                	test   dl,dl
  400e32:	75 20                	jne    400e54 <print_broken_up_decimal.isra.0+0x1c4>
  400e34:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  400e38:	83 fb 20             	cmp    ebx,0x20
  400e3b:	0f 84 eb fe ff ff    	je     400d2c <print_broken_up_decimal.isra.0+0x9c>
  400e41:	c6 44 1d 00 2e       	mov    BYTE PTR [rbp+rbx*1+0x0],0x2e
  400e46:	8d 4b 01             	lea    ecx,[rbx+0x1]
  400e49:	e9 04 ff ff ff       	jmp    400d52 <print_broken_up_decimal.isra.0+0xc2>
  400e4e:	66 90                	xchg   ax,ax
  400e50:	39 ca                	cmp    edx,ecx
  400e52:	74 e4                	je     400e38 <print_broken_up_decimal.isra.0+0x1a8>
  400e54:	89 da                	mov    edx,ebx
  400e56:	83 c3 01             	add    ebx,0x1
  400e59:	c6 00 30             	mov    BYTE PTR [rax],0x30
  400e5c:	48 83 c0 01          	add    rax,0x1
  400e60:	83 fb 1f             	cmp    ebx,0x1f
  400e63:	76 eb                	jbe    400e50 <print_broken_up_decimal.isra.0+0x1c0>
  400e65:	eb d1                	jmp    400e38 <print_broken_up_decimal.isra.0+0x1a8>
  400e67:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  400e6e:	00 00 
  400e70:	45 85 c9             	test   r9d,r9d
  400e73:	0f 84 c2 fe ff ff    	je     400d3b <print_broken_up_decimal.isra.0+0xab>
  400e79:	31 d2                	xor    edx,edx
  400e7b:	b9 20 00 00 00       	mov    ecx,0x20
  400e80:	45 84 db             	test   r11b,r11b
  400e83:	0f 85 cf 00 00 00    	jne    400f58 <print_broken_up_decimal.isra.0+0x2c8>
  400e89:	41 f6 c0 0c          	test   r8b,0xc
  400e8d:	0f 85 c5 00 00 00    	jne    400f58 <print_broken_up_decimal.isra.0+0x2c8>
  400e93:	44 39 c9             	cmp    ecx,r9d
  400e96:	0f 83 14 ff ff ff    	jae    400db0 <print_broken_up_decimal.isra.0+0x120>
  400e9c:	89 c8                	mov    eax,ecx
  400e9e:	48 01 e8             	add    rax,rbp
  400ea1:	84 d2                	test   dl,dl
  400ea3:	0f 84 07 ff ff ff    	je     400db0 <print_broken_up_decimal.isra.0+0x120>
  400ea9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  400eb0:	83 c1 01             	add    ecx,0x1
  400eb3:	c6 00 30             	mov    BYTE PTR [rax],0x30
  400eb6:	48 83 c0 01          	add    rax,0x1
  400eba:	44 39 c9             	cmp    ecx,r9d
  400ebd:	0f 83 ed fe ff ff    	jae    400db0 <print_broken_up_decimal.isra.0+0x120>
  400ec3:	83 f9 1f             	cmp    ecx,0x1f
  400ec6:	76 e8                	jbe    400eb0 <print_broken_up_decimal.isra.0+0x220>
  400ec8:	e9 e3 fe ff ff       	jmp    400db0 <print_broken_up_decimal.isra.0+0x120>
  400ecd:	0f 1f 00             	nop    DWORD PTR [rax]
  400ed0:	48 85 f6             	test   rsi,rsi
  400ed3:	0f 8e 79 fe ff ff    	jle    400d52 <print_broken_up_decimal.isra.0+0xc2>
  400ed9:	48 bb cd cc cc cc cc 	movabs rbx,0xcccccccccccccccd
  400ee0:	cc cc cc 
  400ee3:	48 89 f0             	mov    rax,rsi
  400ee6:	48 ba 98 99 99 99 99 	movabs rdx,0x1999999999999998
  400eed:	99 99 19 
  400ef0:	48 0f af c3          	imul   rax,rbx
  400ef4:	48 01 d0             	add    rax,rdx
  400ef7:	48 d1 c8             	ror    rax,1
  400efa:	48 39 d0             	cmp    rax,rdx
  400efd:	0f 87 c8 fd ff ff    	ja     400ccb <print_broken_up_decimal.isra.0+0x3b>
  400f03:	49 be 99 99 99 99 99 	movabs r14,0x1999999999999999
  400f0a:	99 99 19 
  400f0d:	0f 1f 00             	nop    DWORD PTR [rax]
  400f10:	48 89 f0             	mov    rax,rsi
  400f13:	49 89 f4             	mov    r12,rsi
  400f16:	41 83 ed 01          	sub    r13d,0x1
  400f1a:	48 f7 e3             	mul    rbx
  400f1d:	48 89 d6             	mov    rsi,rdx
  400f20:	48 c1 ee 03          	shr    rsi,0x3
  400f24:	48 89 f0             	mov    rax,rsi
  400f27:	48 0f af c3          	imul   rax,rbx
  400f2b:	48 d1 c8             	ror    rax,1
  400f2e:	4c 39 f0             	cmp    rax,r14
  400f31:	76 dd                	jbe    400f10 <print_broken_up_decimal.isra.0+0x280>
  400f33:	49 83 fc 09          	cmp    r12,0x9
  400f37:	0f 8f 8e fd ff ff    	jg     400ccb <print_broken_up_decimal.isra.0+0x3b>
  400f3d:	e9 10 fe ff ff       	jmp    400d52 <print_broken_up_decimal.isra.0+0xc2>
  400f42:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  400f48:	c6 44 0d 00 2b       	mov    BYTE PTR [rbp+rcx*1+0x0],0x2b
  400f4d:	8d 51 01             	lea    edx,[rcx+0x1]
  400f50:	e9 6d fe ff ff       	jmp    400dc2 <print_broken_up_decimal.isra.0+0x132>
  400f55:	0f 1f 00             	nop    DWORD PTR [rax]
  400f58:	41 83 e9 01          	sub    r9d,0x1
  400f5c:	e9 32 ff ff ff       	jmp    400e93 <print_broken_up_decimal.isra.0+0x203>
  400f61:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  400f68:	45 85 c9             	test   r9d,r9d
  400f6b:	0f 84 3f fe ff ff    	je     400db0 <print_broken_up_decimal.isra.0+0x120>
  400f71:	83 f9 1f             	cmp    ecx,0x1f
  400f74:	0f 96 c2             	setbe  dl
  400f77:	e9 04 ff ff ff       	jmp    400e80 <print_broken_up_decimal.isra.0+0x1f0>

Disassembly of section .text.print_exponential_number:

0000000000400f80 <print_exponential_number>:
  400f80:	41 57                	push   r15
  400f82:	41 89 f2             	mov    r10d,esi
  400f85:	41 89 cf             	mov    r15d,ecx
  400f88:	4d 89 c3             	mov    r11,r8
  400f8b:	41 56                	push   r14
  400f8d:	41 55                	push   r13
  400f8f:	41 54                	push   r12
  400f91:	49 89 fc             	mov    r12,rdi
  400f94:	55                   	push   rbp
  400f95:	89 d5                	mov    ebp,edx
  400f97:	66 48 0f 7e c2       	movq   rdx,xmm0
  400f9c:	53                   	push   rbx
  400f9d:	48 83 ec 38          	sub    rsp,0x38
  400fa1:	48 c1 ea 3f          	shr    rdx,0x3f
  400fa5:	74 08                	je     400faf <print_exponential_number+0x2f>
  400fa7:	66 0f 57 05 01 23 00 	xorpd  xmm0,XMMWORD PTR [rip+0x2301]        # 4032b0 <powers_of_10+0x90>
  400fae:	00 
  400faf:	44 89 f9             	mov    ecx,r15d
  400fb2:	66 0f ef db          	pxor   xmm3,xmm3
  400fb6:	81 e1 00 10 00 00    	and    ecx,0x1000
  400fbc:	66 0f 2e c3          	ucomisd xmm0,xmm3
  400fc0:	0f 8a 9a 00 00 00    	jp     401060 <print_exponential_number+0xe0>
  400fc6:	0f 85 94 00 00 00    	jne    401060 <print_exponential_number+0xe0>
  400fcc:	85 c9                	test   ecx,ecx
  400fce:	0f 85 6c 02 00 00    	jne    401240 <print_exponential_number+0x2c0>
  400fd4:	48 85 d2             	test   rdx,rdx
  400fd7:	0f 84 fc 06 00 00    	je     4016d9 <print_exponential_number+0x759>
  400fdd:	31 c0                	xor    eax,eax
  400fdf:	31 db                	xor    ebx,ebx
  400fe1:	66 0f 57 05 c7 22 00 	xorpd  xmm0,XMMWORD PTR [rip+0x22c7]        # 4032b0 <powers_of_10+0x90>
  400fe8:	00 
  400fe9:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  400fee:	44 89 d6             	mov    esi,r10d
  400ff1:	88 44 24 0c          	mov    BYTE PTR [rsp+0xc],al
  400ff5:	e8 f6 f6 ff ff       	call   4006f0 <get_components>
  400ffa:	0f b6 44 24 0c       	movzx  eax,BYTE PTR [rsp+0xc]
  400fff:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  401004:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  401009:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  40100e:	84 c0                	test   al,al
  401010:	0f 84 0a 03 00 00    	je     401320 <print_exponential_number+0x3a0>
  401016:	41 f7 c7 00 10 00 00 	test   r15d,0x1000
  40101d:	74 09                	je     401028 <print_exponential_number+0xa8>
  40101f:	83 fb ff             	cmp    ebx,0xffffffff
  401022:	0f 8d 48 05 00 00    	jge    401570 <print_exponential_number+0x5f0>
  401028:	85 ed                	test   ebp,ebp
  40102a:	0f 84 30 03 00 00    	je     401360 <print_exponential_number+0x3e0>
  401030:	48 83 ec 08          	sub    rsp,0x8
  401034:	45 89 d0             	mov    r8d,r10d
  401037:	4c 89 e1             	mov    rcx,r12
  40103a:	41 51                	push   r9
  40103c:	41 89 e9             	mov    r9d,ebp
  40103f:	41 53                	push   r11
  401041:	41 57                	push   r15
  401043:	e8 48 fc ff ff       	call   400c90 <print_broken_up_decimal.isra.0>
  401048:	48 83 c4 20          	add    rsp,0x20
  40104c:	48 83 c4 38          	add    rsp,0x38
  401050:	5b                   	pop    rbx
  401051:	5d                   	pop    rbp
  401052:	41 5c                	pop    r12
  401054:	41 5d                	pop    r13
  401056:	41 5e                	pop    r14
  401058:	41 5f                	pop    r15
  40105a:	c3                   	ret    
  40105b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  401060:	66 48 0f 7e c6       	movq   rsi,xmm0
  401065:	f2 0f 10 2d 83 22 00 	movsd  xmm5,QWORD PTR [rip+0x2283]        # 4032f0 <powers_of_10+0xd0>
  40106c:	00 
  40106d:	48 b8 ff ff ff ff ff 	movabs rax,0xfffffffffffff
  401074:	ff 0f 00 
  401077:	48 bf 00 00 00 00 00 	movabs rdi,0x3ff0000000000000
  40107e:	00 f0 3f 
  401081:	48 21 f0             	and    rax,rsi
  401084:	f2 0f 10 15 54 22 00 	movsd  xmm2,QWORD PTR [rip+0x2254]        # 4032e0 <powers_of_10+0xc0>
  40108b:	00 
  40108c:	48 c1 ee 34          	shr    rsi,0x34
  401090:	48 09 f8             	or     rax,rdi
  401093:	81 e6 ff 07 00 00    	and    esi,0x7ff
  401099:	66 48 0f 6e c8       	movq   xmm1,rax
  40109e:	f2 0f 5c 0d 32 22 00 	subsd  xmm1,QWORD PTR [rip+0x2232]        # 4032d8 <powers_of_10+0xb8>
  4010a5:	00 
  4010a6:	81 ee ff 03 00 00    	sub    esi,0x3ff
  4010ac:	f2 0f 59 d1          	mulsd  xmm2,xmm1
  4010b0:	66 0f 28 e1          	movapd xmm4,xmm1
  4010b4:	f2 0f 59 e1          	mulsd  xmm4,xmm1
  4010b8:	f2 0f 58 15 28 22 00 	addsd  xmm2,QWORD PTR [rip+0x2228]        # 4032e8 <powers_of_10+0xc8>
  4010bf:	00 
  4010c0:	f2 0f 59 ec          	mulsd  xmm5,xmm4
  4010c4:	f2 0f 59 cc          	mulsd  xmm1,xmm4
  4010c8:	f2 0f 59 0d 28 22 00 	mulsd  xmm1,QWORD PTR [rip+0x2228]        # 4032f8 <powers_of_10+0xd8>
  4010cf:	00 
  4010d0:	f2 0f 5c d5          	subsd  xmm2,xmm5
  4010d4:	f2 0f 58 ca          	addsd  xmm1,xmm2
  4010d8:	66 0f ef d2          	pxor   xmm2,xmm2
  4010dc:	f2 0f 2a d6          	cvtsi2sd xmm2,esi
  4010e0:	f2 0f 59 15 18 22 00 	mulsd  xmm2,QWORD PTR [rip+0x2218]        # 403300 <powers_of_10+0xe0>
  4010e7:	00 
  4010e8:	f2 0f 58 ca          	addsd  xmm1,xmm2
  4010ec:	66 0f 2f cb          	comisd xmm1,xmm3
  4010f0:	f2 0f 2c d9          	cvttsd2si ebx,xmm1
  4010f4:	73 18                	jae    40110e <print_exponential_number+0x18e>
  4010f6:	66 0f ef d2          	pxor   xmm2,xmm2
  4010fa:	f2 0f 2a d3          	cvtsi2sd xmm2,ebx
  4010fe:	66 0f 2e ca          	ucomisd xmm1,xmm2
  401102:	0f 8a 98 04 00 00    	jp     4015a0 <print_exponential_number+0x620>
  401108:	0f 85 92 04 00 00    	jne    4015a0 <print_exponential_number+0x620>
  40110e:	81 fb cc fe ff ff    	cmp    ebx,0xfffffecc
  401114:	0f 84 16 05 00 00    	je     401630 <print_exponential_number+0x6b0>
  40111a:	66 0f ef d2          	pxor   xmm2,xmm2
  40111e:	f2 0f 10 0d e2 21 00 	movsd  xmm1,QWORD PTR [rip+0x21e2]        # 403308 <powers_of_10+0xe8>
  401125:	00 
  401126:	66 0f ef e4          	pxor   xmm4,xmm4
  40112a:	f2 0f 2a d3          	cvtsi2sd xmm2,ebx
  40112e:	f2 0f 59 ca          	mulsd  xmm1,xmm2
  401132:	f2 0f 58 0d 86 21 00 	addsd  xmm1,QWORD PTR [rip+0x2186]        # 4032c0 <powers_of_10+0xa0>
  401139:	00 
  40113a:	f2 0f 2c c1          	cvttsd2si eax,xmm1
  40113e:	66 0f 2f cb          	comisd xmm1,xmm3
  401142:	f2 0f 2a e0          	cvtsi2sd xmm4,eax
  401146:	73 10                	jae    401158 <print_exponential_number+0x1d8>
  401148:	66 0f 2e cc          	ucomisd xmm1,xmm4
  40114c:	0f 8a ce 04 00 00    	jp     401620 <print_exponential_number+0x6a0>
  401152:	0f 85 c8 04 00 00    	jne    401620 <print_exponential_number+0x6a0>
  401158:	f2 0f 59 25 b8 21 00 	mulsd  xmm4,QWORD PTR [rip+0x21b8]        # 403318 <powers_of_10+0xf8>
  40115f:	00 
  401160:	f2 0f 10 35 c0 21 00 	movsd  xmm6,QWORD PTR [rip+0x21c0]        # 403328 <powers_of_10+0x108>
  401167:	00 
  401168:	48 98                	cdqe   
  40116a:	f2 0f 59 15 9e 21 00 	mulsd  xmm2,QWORD PTR [rip+0x219e]        # 403310 <powers_of_10+0xf0>
  401171:	00 
  401172:	48 05 ff 03 00 00    	add    rax,0x3ff
  401178:	48 c1 e0 34          	shl    rax,0x34
  40117c:	66 48 0f 6e f8       	movq   xmm7,rax
  401181:	f2 0f 5c d4          	subsd  xmm2,xmm4
  401185:	66 0f 28 da          	movapd xmm3,xmm2
  401189:	66 0f 28 ca          	movapd xmm1,xmm2
  40118d:	f2 0f 59 da          	mulsd  xmm3,xmm2
  401191:	f2 0f 58 ca          	addsd  xmm1,xmm2
  401195:	66 0f 28 eb          	movapd xmm5,xmm3
  401199:	f2 0f 5e 2d 7f 21 00 	divsd  xmm5,QWORD PTR [rip+0x217f]        # 403320 <powers_of_10+0x100>
  4011a0:	00 
  4011a1:	f2 0f 58 ee          	addsd  xmm5,xmm6
  4011a5:	66 0f 28 e3          	movapd xmm4,xmm3
  4011a9:	f2 0f 5e e5          	divsd  xmm4,xmm5
  4011ad:	f2 0f 58 25 7b 21 00 	addsd  xmm4,QWORD PTR [rip+0x217b]        # 403330 <powers_of_10+0x110>
  4011b4:	00 
  4011b5:	f2 0f 5e dc          	divsd  xmm3,xmm4
  4011b9:	f2 0f 10 25 77 21 00 	movsd  xmm4,QWORD PTR [rip+0x2177]        # 403338 <powers_of_10+0x118>
  4011c0:	00 
  4011c1:	f2 0f 5c e2          	subsd  xmm4,xmm2
  4011c5:	f2 0f 58 dc          	addsd  xmm3,xmm4
  4011c9:	f2 0f 5e cb          	divsd  xmm1,xmm3
  4011cd:	f2 0f 58 0d 6b 21 00 	addsd  xmm1,QWORD PTR [rip+0x216b]        # 403340 <powers_of_10+0x120>
  4011d4:	00 
  4011d5:	f2 0f 59 cf          	mulsd  xmm1,xmm7
  4011d9:	66 0f 2f c8          	comisd xmm1,xmm0
  4011dd:	0f 87 7d 03 00 00    	ja     401560 <print_exponential_number+0x5e0>
  4011e3:	8d 43 11             	lea    eax,[rbx+0x11]
  4011e6:	31 f6                	xor    esi,esi
  4011e8:	83 f8 22             	cmp    eax,0x22
  4011eb:	77 1a                	ja     401207 <print_exponential_number+0x287>
  4011ed:	89 d8                	mov    eax,ebx
  4011ef:	48 8d 35 2a 20 00 00 	lea    rsi,[rip+0x202a]        # 403220 <powers_of_10>
  4011f6:	f7 d8                	neg    eax
  4011f8:	0f 48 c3             	cmovs  eax,ebx
  4011fb:	48 98                	cdqe   
  4011fd:	f2 0f 10 0c c6       	movsd  xmm1,QWORD PTR [rsi+rax*8]
  401202:	be 01 00 00 00       	mov    esi,0x1
  401207:	89 d8                	mov    eax,ebx
  401209:	c1 e8 1f             	shr    eax,0x1f
  40120c:	21 c6                	and    esi,eax
  40120e:	85 db                	test   ebx,ebx
  401210:	40 0f 94 c7          	sete   dil
  401214:	31 c0                	xor    eax,eax
  401216:	85 c9                	test   ecx,ecx
  401218:	74 5f                	je     401279 <print_exponential_number+0x2f9>
  40121a:	45 85 d2             	test   r10d,r10d
  40121d:	b8 01 00 00 00       	mov    eax,0x1
  401222:	41 0f 45 c2          	cmovne eax,r10d
  401226:	39 c3                	cmp    ebx,eax
  401228:	0f 9c c0             	setl   al
  40122b:	83 fb fc             	cmp    ebx,0xfffffffc
  40122e:	0f 9d c1             	setge  cl
  401231:	21 c8                	and    eax,ecx
  401233:	09 c7                	or     edi,eax
  401235:	eb 23                	jmp    40125a <print_exponential_number+0x2da>
  401237:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40123e:	00 00 
  401240:	45 85 d2             	test   r10d,r10d
  401243:	b8 01 00 00 00       	mov    eax,0x1
  401248:	bf 01 00 00 00       	mov    edi,0x1
  40124d:	41 0f 45 c2          	cmovne eax,r10d
  401251:	85 c0                	test   eax,eax
  401253:	0f 9f c0             	setg   al
  401256:	31 f6                	xor    esi,esi
  401258:	31 db                	xor    ebx,ebx
  40125a:	41 83 ea 01          	sub    r10d,0x1
  40125e:	44 89 d1             	mov    ecx,r10d
  401261:	29 d9                	sub    ecx,ebx
  401263:	84 c0                	test   al,al
  401265:	44 0f 45 d1          	cmovne r10d,ecx
  401269:	31 c9                	xor    ecx,ecx
  40126b:	45 85 d2             	test   r10d,r10d
  40126e:	44 0f 48 d1          	cmovs  r10d,ecx
  401272:	41 81 cf 00 08 00 00 	or     r15d,0x800
  401279:	40 84 ff             	test   dil,dil
  40127c:	0f 85 c6 02 00 00    	jne    401548 <print_exponential_number+0x5c8>
  401282:	44 89 d1             	mov    ecx,r10d
  401285:	29 d9                	sub    ecx,ebx
  401287:	40 84 f6             	test   sil,sil
  40128a:	0f 84 28 02 00 00    	je     4014b8 <print_exponential_number+0x538>
  401290:	66 0f 28 d0          	movapd xmm2,xmm0
  401294:	f2 0f 59 d1          	mulsd  xmm2,xmm1
  401298:	81 f9 32 01 00 00    	cmp    ecx,0x132
  40129e:	0f 8f ac 03 00 00    	jg     401650 <print_exponential_number+0x6d0>
  4012a4:	f2 48 0f 2c fa       	cvttsd2si rdi,xmm2
  4012a9:	66 0f ef d2          	pxor   xmm2,xmm2
  4012ad:	66 0f 28 d9          	movapd xmm3,xmm1
  4012b1:	44 89 d1             	mov    ecx,r10d
  4012b4:	48 8d 35 65 1f 00 00 	lea    rsi,[rip+0x1f65]        # 403220 <powers_of_10>
  4012bb:	f2 48 0f 2a d7       	cvtsi2sd xmm2,rdi
  4012c0:	f2 0f 5e d1          	divsd  xmm2,xmm1
  4012c4:	f2 0f 5c c2          	subsd  xmm0,xmm2
  4012c8:	f2 0f 10 14 ce       	movsd  xmm2,QWORD PTR [rsi+rcx*8]
  4012cd:	f2 0f 59 da          	mulsd  xmm3,xmm2
  4012d1:	f2 0f 59 c3          	mulsd  xmm0,xmm3
  4012d5:	f2 48 0f 2c c8       	cvttsd2si rcx,xmm0
  4012da:	66 0f ef c9          	pxor   xmm1,xmm1
  4012de:	31 f6                	xor    esi,esi
  4012e0:	f2 48 0f 2a c9       	cvtsi2sd xmm1,rcx
  4012e5:	f2 0f 5c c1          	subsd  xmm0,xmm1
  4012e9:	66 0f 2f 05 cf 1f 00 	comisd xmm0,QWORD PTR [rip+0x1fcf]        # 4032c0 <powers_of_10+0xa0>
  4012f0:	00 
  4012f1:	40 0f 93 c6          	setae  sil
  4012f5:	48 01 ce             	add    rsi,rcx
  4012f8:	66 0f 2e 05 c0 1f 00 	ucomisd xmm0,QWORD PTR [rip+0x1fc0]        # 4032c0 <powers_of_10+0xa0>
  4012ff:	00 
  401300:	7a 06                	jp     401308 <print_exponential_number+0x388>
  401302:	75 04                	jne    401308 <print_exponential_number+0x388>
  401304:	48 83 e6 fe          	and    rsi,0xfffffffffffffffe
  401308:	66 0f ef c0          	pxor   xmm0,xmm0
  40130c:	f2 48 0f 2a c6       	cvtsi2sd xmm0,rsi
  401311:	66 0f 2f c2          	comisd xmm0,xmm2
  401315:	72 06                	jb     40131d <print_exponential_number+0x39d>
  401317:	48 83 c7 01          	add    rdi,0x1
  40131b:	31 f6                	xor    esi,esi
  40131d:	83 e2 01             	and    edx,0x1
  401320:	48 83 ff 09          	cmp    rdi,0x9
  401324:	7e 0a                	jle    401330 <print_exponential_number+0x3b0>
  401326:	83 c3 01             	add    ebx,0x1
  401329:	31 f6                	xor    esi,esi
  40132b:	bf 01 00 00 00       	mov    edi,0x1
  401330:	45 89 fe             	mov    r14d,r15d
  401333:	8d 4b 63             	lea    ecx,[rbx+0x63]
  401336:	41 83 e6 02          	and    r14d,0x2
  40133a:	81 f9 c6 00 00 00    	cmp    ecx,0xc6
  401340:	77 4e                	ja     401390 <print_exponential_number+0x410>
  401342:	45 85 f6             	test   r14d,r14d
  401345:	0f 85 c5 02 00 00    	jne    401610 <print_exponential_number+0x690>
  40134b:	41 be 04 00 00 00    	mov    r14d,0x4
  401351:	e9 68 02 00 00       	jmp    4015be <print_exponential_number+0x63e>
  401356:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40135d:	00 00 00 
  401360:	48 83 ec 08          	sub    rsp,0x8
  401364:	4c 89 e1             	mov    rcx,r12
  401367:	45 89 d0             	mov    r8d,r10d
  40136a:	41 51                	push   r9
  40136c:	45 31 c9             	xor    r9d,r9d
  40136f:	41 53                	push   r11
  401371:	41 57                	push   r15
  401373:	e8 18 f9 ff ff       	call   400c90 <print_broken_up_decimal.isra.0>
  401378:	48 83 c4 20          	add    rsp,0x20
  40137c:	48 83 c4 38          	add    rsp,0x38
  401380:	5b                   	pop    rbx
  401381:	5d                   	pop    rbp
  401382:	41 5c                	pop    r12
  401384:	41 5d                	pop    r13
  401386:	41 5e                	pop    r14
  401388:	41 5f                	pop    r15
  40138a:	c3                   	ret    
  40138b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  401390:	45 85 f6             	test   r14d,r14d
  401393:	0f 84 1f 02 00 00    	je     4015b8 <print_exponential_number+0x638>
  401399:	b8 04 00 00 00       	mov    eax,0x4
  40139e:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  4013a2:	48 83 ec 08          	sub    rsp,0x8
  4013a6:	45 89 d0             	mov    r8d,r10d
  4013a9:	4c 89 e1             	mov    rcx,r12
  4013ac:	41 51                	push   r9
  4013ae:	45 31 c9             	xor    r9d,r9d
  4013b1:	45 8b 6c 24 18       	mov    r13d,DWORD PTR [r12+0x18]
  4013b6:	41 53                	push   r11
  4013b8:	41 57                	push   r15
  4013ba:	e8 d1 f8 ff ff       	call   400c90 <print_broken_up_decimal.isra.0>
  4013bf:	8b 44 24 2c          	mov    eax,DWORD PTR [rsp+0x2c]
  4013c3:	48 83 c4 20          	add    rsp,0x20
  4013c7:	41 83 e7 20          	and    r15d,0x20
  4013cb:	41 8b 4c 24 18       	mov    ecx,DWORD PTR [r12+0x18]
  4013d0:	41 83 ff 01          	cmp    r15d,0x1
  4013d4:	19 d2                	sbb    edx,edx
  4013d6:	8d 71 01             	lea    esi,[rcx+0x1]
  4013d9:	83 e2 20             	and    edx,0x20
  4013dc:	41 89 74 24 18       	mov    DWORD PTR [r12+0x18],esi
  4013e1:	83 c2 45             	add    edx,0x45
  4013e4:	41 83 ff 01          	cmp    r15d,0x1
  4013e8:	19 ff                	sbb    edi,edi
  4013ea:	83 e7 20             	and    edi,0x20
  4013ed:	83 c7 45             	add    edi,0x45
  4013f0:	41 3b 4c 24 1c       	cmp    ecx,DWORD PTR [r12+0x1c]
  4013f5:	73 1d                	jae    401414 <print_exponential_number+0x494>
  4013f7:	4d 8b 04 24          	mov    r8,QWORD PTR [r12]
  4013fb:	4d 85 c0             	test   r8,r8
  4013fe:	0f 84 bc 02 00 00    	je     4016c0 <print_exponential_number+0x740>
  401404:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  401408:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  40140d:	41 ff d0             	call   r8
  401410:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
  401414:	48 63 d3             	movsxd rdx,ebx
  401417:	41 89 da             	mov    r10d,ebx
  40141a:	41 89 c1             	mov    r9d,eax
  40141d:	b9 0a 00 00 00       	mov    ecx,0xa
  401422:	48 89 d6             	mov    rsi,rdx
  401425:	41 c1 ea 1f          	shr    r10d,0x1f
  401429:	4c 89 e7             	mov    rdi,r12
  40142c:	48 f7 de             	neg    rsi
  40142f:	85 db                	test   ebx,ebx
  401431:	48 0f 4f f2          	cmovg  rsi,rdx
  401435:	48 83 ec 08          	sub    rsp,0x8
  401439:	44 89 d2             	mov    edx,r10d
  40143c:	45 31 c0             	xor    r8d,r8d
  40143f:	6a 05                	push   0x5
  401441:	e8 ea f4 ff ff       	call   400930 <print_integer>
  401446:	58                   	pop    rax
  401447:	5a                   	pop    rdx
  401448:	45 85 f6             	test   r14d,r14d
  40144b:	0f 84 fb fb ff ff    	je     40104c <print_exponential_number+0xcc>
  401451:	41 8b 44 24 18       	mov    eax,DWORD PTR [r12+0x18]
  401456:	89 c2                	mov    edx,eax
  401458:	44 29 ea             	sub    edx,r13d
  40145b:	39 d5                	cmp    ebp,edx
  40145d:	0f 86 e9 fb ff ff    	jbe    40104c <print_exponential_number+0xcc>
  401463:	8d 48 01             	lea    ecx,[rax+0x1]
  401466:	83 c2 01             	add    edx,0x1
  401469:	41 89 4c 24 18       	mov    DWORD PTR [r12+0x18],ecx
  40146e:	41 39 44 24 1c       	cmp    DWORD PTR [r12+0x1c],eax
  401473:	0f 86 17 02 00 00    	jbe    401690 <print_exponential_number+0x710>
  401479:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
  40147d:	48 85 d2             	test   rdx,rdx
  401480:	0f 84 1a 02 00 00    	je     4016a0 <print_exponential_number+0x720>
  401486:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  40148b:	bf 20 00 00 00       	mov    edi,0x20
  401490:	ff d2                	call   rdx
  401492:	41 8b 44 24 18       	mov    eax,DWORD PTR [r12+0x18]
  401497:	89 c2                	mov    edx,eax
  401499:	44 29 ea             	sub    edx,r13d
  40149c:	eb bd                	jmp    40145b <print_exponential_number+0x4db>
  40149e:	66 90                	xchg   ax,ax
  4014a0:	85 c9                	test   ecx,ecx
  4014a2:	0f 85 28 02 00 00    	jne    4016d0 <print_exponential_number+0x750>
  4014a8:	41 8d 8a 34 01 00 00 	lea    ecx,[r10+0x134]
  4014af:	31 c0                	xor    eax,eax
  4014b1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4014b8:	66 0f 28 d0          	movapd xmm2,xmm0
  4014bc:	f2 0f 5e d1          	divsd  xmm2,xmm1
  4014c0:	81 f9 32 01 00 00    	cmp    ecx,0x132
  4014c6:	0f 8f 84 01 00 00    	jg     401650 <print_exponential_number+0x6d0>
  4014cc:	f2 48 0f 2c fa       	cvttsd2si rdi,xmm2
  4014d1:	66 0f ef d2          	pxor   xmm2,xmm2
  4014d5:	44 89 d1             	mov    ecx,r10d
  4014d8:	48 8d 35 41 1d 00 00 	lea    rsi,[rip+0x1d41]        # 403220 <powers_of_10>
  4014df:	f2 48 0f 2a d7       	cvtsi2sd xmm2,rdi
  4014e4:	f2 0f 59 d1          	mulsd  xmm2,xmm1
  4014e8:	f2 0f 5c c2          	subsd  xmm0,xmm2
  4014ec:	f2 0f 10 14 ce       	movsd  xmm2,QWORD PTR [rsi+rcx*8]
  4014f1:	66 48 0f 7e c9       	movq   rcx,xmm1
  4014f6:	48 c1 e9 34          	shr    rcx,0x34
  4014fa:	81 e1 ff 07 00 00    	and    ecx,0x7ff
  401500:	81 e9 ff 03 00 00    	sub    ecx,0x3ff
  401506:	89 ce                	mov    esi,ecx
  401508:	f7 de                	neg    esi
  40150a:	0f 48 f1             	cmovs  esi,ecx
  40150d:	66 48 0f 7e d1       	movq   rcx,xmm2
  401512:	48 c1 e9 34          	shr    rcx,0x34
  401516:	81 e1 ff 07 00 00    	and    ecx,0x7ff
  40151c:	81 e9 ff 03 00 00    	sub    ecx,0x3ff
  401522:	41 89 c8             	mov    r8d,ecx
  401525:	41 f7 d8             	neg    r8d
  401528:	41 0f 49 c8          	cmovns ecx,r8d
  40152c:	39 ce                	cmp    esi,ecx
  40152e:	0f 8f 7c 01 00 00    	jg     4016b0 <print_exponential_number+0x730>
  401534:	66 0f 28 da          	movapd xmm3,xmm2
  401538:	f2 0f 5e d9          	divsd  xmm3,xmm1
  40153c:	e9 90 fd ff ff       	jmp    4012d1 <print_exponential_number+0x351>
  401541:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401548:	48 85 d2             	test   rdx,rdx
  40154b:	0f 84 98 fa ff ff    	je     400fe9 <print_exponential_number+0x69>
  401551:	e9 8b fa ff ff       	jmp    400fe1 <print_exponential_number+0x61>
  401556:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40155d:	00 00 00 
  401560:	f2 0f 5e ce          	divsd  xmm1,xmm6
  401564:	83 eb 01             	sub    ebx,0x1
  401567:	e9 77 fc ff ff       	jmp    4011e3 <print_exponential_number+0x263>
  40156c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401570:	83 c3 01             	add    ebx,0x1
  401573:	66 0f ef c0          	pxor   xmm0,xmm0
  401577:	48 8d 05 a2 1c 00 00 	lea    rax,[rip+0x1ca2]        # 403220 <powers_of_10>
  40157e:	48 63 db             	movsxd rbx,ebx
  401581:	f2 48 0f 2a c7       	cvtsi2sd xmm0,rdi
  401586:	66 0f 2e 04 d8       	ucomisd xmm0,QWORD PTR [rax+rbx*8]
  40158b:	0f 8a 97 fa ff ff    	jp     401028 <print_exponential_number+0xa8>
  401591:	0f 85 91 fa ff ff    	jne    401028 <print_exponential_number+0xa8>
  401597:	41 83 ea 01          	sub    r10d,0x1
  40159b:	e9 88 fa ff ff       	jmp    401028 <print_exponential_number+0xa8>
  4015a0:	83 eb 01             	sub    ebx,0x1
  4015a3:	81 fb cc fe ff ff    	cmp    ebx,0xfffffecc
  4015a9:	0f 85 6b fb ff ff    	jne    40111a <print_exponential_number+0x19a>
  4015af:	eb 7f                	jmp    401630 <print_exponential_number+0x6b0>
  4015b1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4015b8:	41 be 05 00 00 00    	mov    r14d,0x5
  4015be:	89 e9                	mov    ecx,ebp
  4015c0:	45 31 c0             	xor    r8d,r8d
  4015c3:	88 44 24 0c          	mov    BYTE PTR [rsp+0xc],al
  4015c7:	45 8b 6c 24 18       	mov    r13d,DWORD PTR [r12+0x18]
  4015cc:	44 29 f1             	sub    ecx,r14d
  4015cf:	44 39 f5             	cmp    ebp,r14d
  4015d2:	41 0f 46 c8          	cmovbe ecx,r8d
  4015d6:	48 83 ec 08          	sub    rsp,0x8
  4015da:	45 89 d0             	mov    r8d,r10d
  4015dd:	41 51                	push   r9
  4015df:	41 53                	push   r11
  4015e1:	41 89 c9             	mov    r9d,ecx
  4015e4:	4c 89 e1             	mov    rcx,r12
  4015e7:	41 57                	push   r15
  4015e9:	e8 a2 f6 ff ff       	call   400c90 <print_broken_up_decimal.isra.0>
  4015ee:	0f b6 44 24 2c       	movzx  eax,BYTE PTR [rsp+0x2c]
  4015f3:	48 83 c4 20          	add    rsp,0x20
  4015f7:	84 c0                	test   al,al
  4015f9:	0f 85 4d fa ff ff    	jne    40104c <print_exponential_number+0xcc>
  4015ff:	41 8d 46 ff          	lea    eax,[r14-0x1]
  401603:	45 31 f6             	xor    r14d,r14d
  401606:	e9 bc fd ff ff       	jmp    4013c7 <print_exponential_number+0x447>
  40160b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  401610:	b8 03 00 00 00       	mov    eax,0x3
  401615:	e9 84 fd ff ff       	jmp    40139e <print_exponential_number+0x41e>
  40161a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  401620:	83 e8 01             	sub    eax,0x1
  401623:	66 0f ef e4          	pxor   xmm4,xmm4
  401627:	f2 0f 2a e0          	cvtsi2sd xmm4,eax
  40162b:	e9 28 fb ff ff       	jmp    401158 <print_exponential_number+0x1d8>
  401630:	f2 0f 10 0d 98 1c 00 	movsd  xmm1,QWORD PTR [rip+0x1c98]        # 4032d0 <powers_of_10+0xb0>
  401637:	00 
  401638:	66 0f 2f c8          	comisd xmm1,xmm0
  40163c:	0f 86 5e fe ff ff    	jbe    4014a0 <print_exponential_number+0x520>
  401642:	f2 0f 10 0d 7e 1c 00 	movsd  xmm1,QWORD PTR [rip+0x1c7e]        # 4032c8 <powers_of_10+0xa8>
  401649:	00 
  40164a:	e9 15 ff ff ff       	jmp    401564 <print_exponential_number+0x5e4>
  40164f:	90                   	nop
  401650:	48 85 d2             	test   rdx,rdx
  401653:	74 08                	je     40165d <print_exponential_number+0x6dd>
  401655:	66 0f 57 15 53 1c 00 	xorpd  xmm2,XMMWORD PTR [rip+0x1c53]        # 4032b0 <powers_of_10+0x90>
  40165c:	00 
  40165d:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  401662:	44 89 d6             	mov    esi,r10d
  401665:	66 0f 28 c2          	movapd xmm0,xmm2
  401669:	88 44 24 0c          	mov    BYTE PTR [rsp+0xc],al
  40166d:	e8 7e f0 ff ff       	call   4006f0 <get_components>
  401672:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  401677:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  40167c:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  401681:	0f b6 44 24 0c       	movzx  eax,BYTE PTR [rsp+0xc]
  401686:	e9 95 fc ff ff       	jmp    401320 <print_exponential_number+0x3a0>
  40168b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  401690:	89 c8                	mov    eax,ecx
  401692:	e9 c4 fd ff ff       	jmp    40145b <print_exponential_number+0x4db>
  401697:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40169e:	00 00 
  4016a0:	49 8b 54 24 10       	mov    rdx,QWORD PTR [r12+0x10]
  4016a5:	c6 04 02 20          	mov    BYTE PTR [rdx+rax*1],0x20
  4016a9:	e9 a3 fd ff ff       	jmp    401451 <print_exponential_number+0x4d1>
  4016ae:	66 90                	xchg   ax,ax
  4016b0:	f2 0f 5e ca          	divsd  xmm1,xmm2
  4016b4:	f2 0f 5e c1          	divsd  xmm0,xmm1
  4016b8:	e9 18 fc ff ff       	jmp    4012d5 <print_exponential_number+0x355>
  4016bd:	0f 1f 00             	nop    DWORD PTR [rax]
  4016c0:	49 8b 74 24 10       	mov    rsi,QWORD PTR [r12+0x10]
  4016c5:	88 14 0e             	mov    BYTE PTR [rsi+rcx*1],dl
  4016c8:	e9 47 fd ff ff       	jmp    401414 <print_exponential_number+0x494>
  4016cd:	0f 1f 00             	nop    DWORD PTR [rax]
  4016d0:	31 ff                	xor    edi,edi
  4016d2:	31 f6                	xor    esi,esi
  4016d4:	e9 41 fb ff ff       	jmp    40121a <print_exponential_number+0x29a>
  4016d9:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  4016de:	44 89 d6             	mov    esi,r10d
  4016e1:	31 db                	xor    ebx,ebx
  4016e3:	e8 08 f0 ff ff       	call   4006f0 <get_components>
  4016e8:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  4016ed:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  4016f2:	31 c0                	xor    eax,eax
  4016f4:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  4016f9:	e9 22 fc ff ff       	jmp    401320 <print_exponential_number+0x3a0>

Disassembly of section .text.print_floating_point:

0000000000401700 <print_floating_point>:
  401700:	41 54                	push   r12
  401702:	41 89 d4             	mov    r12d,edx
  401705:	55                   	push   rbp
  401706:	48 89 fd             	mov    rbp,rdi
  401709:	48 83 ec 58          	sub    rsp,0x58
  40170d:	66 0f 2e c0          	ucomisd xmm0,xmm0
  401711:	0f 8a 31 01 00 00    	jp     401848 <print_floating_point+0x148>
  401717:	f2 0f 10 0d 29 1c 00 	movsd  xmm1,QWORD PTR [rip+0x1c29]        # 403348 <powers_of_10+0x128>
  40171e:	00 
  40171f:	66 0f 2f c8          	comisd xmm1,xmm0
  401723:	0f 87 87 01 00 00    	ja     4018b0 <print_floating_point+0x1b0>
  401729:	66 0f 2f 05 1f 1c 00 	comisd xmm0,QWORD PTR [rip+0x1c1f]        # 403350 <powers_of_10+0x130>
  401730:	00 
  401731:	0f 87 91 00 00 00    	ja     4017c8 <print_floating_point+0xc8>
  401737:	45 84 c0             	test   r8b,r8b
  40173a:	0f 85 c0 00 00 00    	jne    401800 <print_floating_point+0x100>
  401740:	66 0f 2f 05 10 1c 00 	comisd xmm0,QWORD PTR [rip+0x1c10]        # 403358 <powers_of_10+0x138>
  401747:	00 
  401748:	0f 87 42 01 00 00    	ja     401890 <print_floating_point+0x190>
  40174e:	f2 0f 10 0d 0a 1c 00 	movsd  xmm1,QWORD PTR [rip+0x1c0a]        # 403360 <powers_of_10+0x140>
  401755:	00 
  401756:	66 0f 2f c8          	comisd xmm1,xmm0
  40175a:	0f 87 30 01 00 00    	ja     401890 <print_floating_point+0x190>
  401760:	41 89 c9             	mov    r9d,ecx
  401763:	41 81 e1 00 08 00 00 	and    r9d,0x800
  40176a:	0f 85 60 01 00 00    	jne    4018d0 <print_floating_point+0x1d0>
  401770:	be 06 00 00 00       	mov    esi,0x6
  401775:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  40177a:	89 4c 24 0c          	mov    DWORD PTR [rsp+0xc],ecx
  40177e:	89 74 24 08          	mov    DWORD PTR [rsp+0x8],esi
  401782:	e8 69 ef ff ff       	call   4006f0 <get_components>
  401787:	48 83 ec 08          	sub    rsp,0x8
  40178b:	41 51                	push   r9
  40178d:	45 89 e1             	mov    r9d,r12d
  401790:	48 8d 44 24 40       	lea    rax,[rsp+0x40]
  401795:	50                   	push   rax
  401796:	8b 4c 24 24          	mov    ecx,DWORD PTR [rsp+0x24]
  40179a:	51                   	push   rcx
  40179b:	44 8b 44 24 28       	mov    r8d,DWORD PTR [rsp+0x28]
  4017a0:	48 89 e9             	mov    rcx,rbp
  4017a3:	0f b6 54 24 40       	movzx  edx,BYTE PTR [rsp+0x40]
  4017a8:	48 8b 74 24 38       	mov    rsi,QWORD PTR [rsp+0x38]
  4017ad:	48 8b 7c 24 30       	mov    rdi,QWORD PTR [rsp+0x30]
  4017b2:	e8 d9 f4 ff ff       	call   400c90 <print_broken_up_decimal.isra.0>
  4017b7:	48 83 c4 20          	add    rsp,0x20
  4017bb:	48 83 c4 58          	add    rsp,0x58
  4017bf:	5d                   	pop    rbp
  4017c0:	41 5c                	pop    r12
  4017c2:	c3                   	ret    
  4017c3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4017c8:	89 c8                	mov    eax,ecx
  4017ca:	48 8d 35 3c 18 00 00 	lea    rsi,[rip+0x183c]        # 40300d <putchar_+0x57d>
  4017d1:	41 89 c8             	mov    r8d,ecx
  4017d4:	48 89 ef             	mov    rdi,rbp
  4017d7:	83 e0 04             	and    eax,0x4
  4017da:	44 89 e1             	mov    ecx,r12d
  4017dd:	83 f8 01             	cmp    eax,0x1
  4017e0:	19 d2                	sbb    edx,edx
  4017e2:	83 c2 04             	add    edx,0x4
  4017e5:	85 c0                	test   eax,eax
  4017e7:	48 8d 05 1a 18 00 00 	lea    rax,[rip+0x181a]        # 403008 <putchar_+0x578>
  4017ee:	48 0f 45 f0          	cmovne rsi,rax
  4017f2:	48 83 c4 58          	add    rsp,0x58
  4017f6:	5d                   	pop    rbp
  4017f7:	41 5c                	pop    r12
  4017f9:	e9 f2 ef ff ff       	jmp    4007f0 <out_rev_>
  4017fe:	66 90                	xchg   ax,ax
  401800:	41 89 c9             	mov    r9d,ecx
  401803:	41 81 e1 00 08 00 00 	and    r9d,0x800
  40180a:	74 64                	je     401870 <print_floating_point+0x170>
  40180c:	b8 01 00 00 00       	mov    eax,0x1
  401811:	45 31 c9             	xor    r9d,r9d
  401814:	83 fe 11             	cmp    esi,0x11
  401817:	76 5c                	jbe    401875 <print_floating_point+0x175>
  401819:	48 8d 54 24 2f       	lea    rdx,[rsp+0x2f]
  40181e:	66 90                	xchg   ax,ax
  401820:	41 89 c1             	mov    r9d,eax
  401823:	c6 04 02 30          	mov    BYTE PTR [rdx+rax*1],0x30
  401827:	83 ee 01             	sub    esi,0x1
  40182a:	48 83 c0 01          	add    rax,0x1
  40182e:	41 83 f9 1f          	cmp    r9d,0x1f
  401832:	77 05                	ja     401839 <print_floating_point+0x139>
  401834:	83 fe 11             	cmp    esi,0x11
  401837:	77 e7                	ja     401820 <print_floating_point+0x120>
  401839:	45 84 c0             	test   r8b,r8b
  40183c:	0f 84 33 ff ff ff    	je     401775 <print_floating_point+0x75>
  401842:	eb 31                	jmp    401875 <print_floating_point+0x175>
  401844:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401848:	48 83 c4 58          	add    rsp,0x58
  40184c:	41 89 c8             	mov    r8d,ecx
  40184f:	89 d1                	mov    ecx,edx
  401851:	48 89 ef             	mov    rdi,rbp
  401854:	ba 03 00 00 00       	mov    edx,0x3
  401859:	5d                   	pop    rbp
  40185a:	48 8d 35 b0 17 00 00 	lea    rsi,[rip+0x17b0]        # 403011 <putchar_+0x581>
  401861:	41 5c                	pop    r12
  401863:	e9 88 ef ff ff       	jmp    4007f0 <out_rev_>
  401868:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40186f:	00 
  401870:	be 06 00 00 00       	mov    esi,0x6
  401875:	4c 8d 44 24 30       	lea    r8,[rsp+0x30]
  40187a:	44 89 e2             	mov    edx,r12d
  40187d:	48 89 ef             	mov    rdi,rbp
  401880:	e8 fb f6 ff ff       	call   400f80 <print_exponential_number>
  401885:	48 83 c4 58          	add    rsp,0x58
  401889:	5d                   	pop    rbp
  40188a:	41 5c                	pop    r12
  40188c:	c3                   	ret    
  40188d:	0f 1f 00             	nop    DWORD PTR [rax]
  401890:	45 31 c9             	xor    r9d,r9d
  401893:	4c 8d 44 24 30       	lea    r8,[rsp+0x30]
  401898:	44 89 e2             	mov    edx,r12d
  40189b:	48 89 ef             	mov    rdi,rbp
  40189e:	e8 dd f6 ff ff       	call   400f80 <print_exponential_number>
  4018a3:	e9 13 ff ff ff       	jmp    4017bb <print_floating_point+0xbb>
  4018a8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4018af:	00 
  4018b0:	48 83 c4 58          	add    rsp,0x58
  4018b4:	41 89 c8             	mov    r8d,ecx
  4018b7:	89 d1                	mov    ecx,edx
  4018b9:	48 89 ef             	mov    rdi,rbp
  4018bc:	ba 04 00 00 00       	mov    edx,0x4
  4018c1:	5d                   	pop    rbp
  4018c2:	48 8d 35 4c 17 00 00 	lea    rsi,[rip+0x174c]        # 403015 <putchar_+0x585>
  4018c9:	41 5c                	pop    r12
  4018cb:	e9 20 ef ff ff       	jmp    4007f0 <out_rev_>
  4018d0:	b8 01 00 00 00       	mov    eax,0x1
  4018d5:	45 31 c9             	xor    r9d,r9d
  4018d8:	83 fe 11             	cmp    esi,0x11
  4018db:	0f 87 38 ff ff ff    	ja     401819 <print_floating_point+0x119>
  4018e1:	e9 8f fe ff ff       	jmp    401775 <print_floating_point+0x75>

Disassembly of section .text.format_string_loop.constprop.0:

00000000004018f0 <format_string_loop.constprop.0>:
  4018f0:	41 57                	push   r15
  4018f2:	49 89 d7             	mov    r15,rdx
  4018f5:	41 56                	push   r14
  4018f7:	41 55                	push   r13
  4018f9:	41 54                	push   r12
  4018fb:	55                   	push   rbp
  4018fc:	53                   	push   rbx
  4018fd:	48 83 ec 38          	sub    rsp,0x38
  401901:	0f b6 16             	movzx  edx,BYTE PTR [rsi]
  401904:	84 d2                	test   dl,dl
  401906:	0f 84 5f 01 00 00    	je     401a6b <format_string_loop.constprop.0+0x17b>
  40190c:	49 89 fc             	mov    r12,rdi
  40190f:	48 89 f3             	mov    rbx,rsi
  401912:	4c 8d 2d 0f 17 00 00 	lea    r13,[rip+0x170f]        # 403028 <putchar_+0x598>
  401919:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401920:	4c 8d 73 01          	lea    r14,[rbx+0x1]
  401924:	80 fa 25             	cmp    dl,0x25
  401927:	0f 85 d3 05 00 00    	jne    401f00 <format_string_loop.constprop.0+0x610>
  40192d:	0f be 73 01          	movsx  esi,BYTE PTR [rbx+0x1]
  401931:	40 84 f6             	test   sil,sil
  401934:	0f 84 31 01 00 00    	je     401a6b <format_string_loop.constprop.0+0x17b>
  40193a:	31 c9                	xor    ecx,ecx
  40193c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401940:	8d 46 e0             	lea    eax,[rsi-0x20]
  401943:	49 8d 5e 01          	lea    rbx,[r14+0x1]
  401947:	3c 10                	cmp    al,0x10
  401949:	77 15                	ja     401960 <format_string_loop.constprop.0+0x70>
  40194b:	0f b6 c0             	movzx  eax,al
  40194e:	49 63 44 85 00       	movsxd rax,DWORD PTR [r13+rax*4+0x0]
  401953:	4c 01 e8             	add    rax,r13
  401956:	3e ff e0             	notrack jmp rax
  401959:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401960:	8d 56 d0             	lea    edx,[rsi-0x30]
  401963:	80 fa 09             	cmp    dl,0x9
  401966:	ba 00 00 00 00       	mov    edx,0x0
  40196b:	76 47                	jbe    4019b4 <format_string_loop.constprop.0+0xc4>
  40196d:	40 80 fe 2a          	cmp    sil,0x2a
  401971:	0f 84 e1 05 00 00    	je     401f58 <format_string_loop.constprop.0+0x668>
  401977:	45 31 d2             	xor    r10d,r10d
  40197a:	40 80 fe 2e          	cmp    sil,0x2e
  40197e:	74 51                	je     4019d1 <format_string_loop.constprop.0+0xe1>
  401980:	8d 7e 98             	lea    edi,[rsi-0x68]
  401983:	49 8d 5e 01          	lea    rbx,[r14+0x1]
  401987:	40 80 ff 12          	cmp    dil,0x12
  40198b:	0f 87 7f 00 00 00    	ja     401a10 <format_string_loop.constprop.0+0x120>
  401991:	4c 8d 05 d4 16 00 00 	lea    r8,[rip+0x16d4]        # 40306c <putchar_+0x5dc>
  401998:	40 0f b6 ff          	movzx  edi,dil
  40199c:	49 63 3c b8          	movsxd rdi,DWORD PTR [r8+rdi*4]
  4019a0:	4c 01 c7             	add    rdi,r8
  4019a3:	3e ff e7             	notrack jmp rdi
  4019a6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4019ad:	00 00 00 
  4019b0:	48 83 c3 01          	add    rbx,0x1
  4019b4:	8d 04 92             	lea    eax,[rdx+rdx*4]
  4019b7:	49 89 de             	mov    r14,rbx
  4019ba:	8d 54 46 d0          	lea    edx,[rsi+rax*2-0x30]
  4019be:	0f be 33             	movsx  esi,BYTE PTR [rbx]
  4019c1:	8d 46 d0             	lea    eax,[rsi-0x30]
  4019c4:	3c 09                	cmp    al,0x9
  4019c6:	76 e8                	jbe    4019b0 <format_string_loop.constprop.0+0xc0>
  4019c8:	45 31 d2             	xor    r10d,r10d
  4019cb:	40 80 fe 2e          	cmp    sil,0x2e
  4019cf:	75 af                	jne    401980 <format_string_loop.constprop.0+0x90>
  4019d1:	41 0f be 76 01       	movsx  esi,BYTE PTR [r14+0x1]
  4019d6:	80 cd 08             	or     ch,0x8
  4019d9:	40 84 f6             	test   sil,sil
  4019dc:	0f 84 89 00 00 00    	je     401a6b <format_string_loop.constprop.0+0x17b>
  4019e2:	44 8d 46 d0          	lea    r8d,[rsi-0x30]
  4019e6:	49 8d 7e 01          	lea    rdi,[r14+0x1]
  4019ea:	41 80 f8 09          	cmp    r8b,0x9
  4019ee:	0f 86 44 05 00 00    	jbe    401f38 <format_string_loop.constprop.0+0x648>
  4019f4:	40 80 fe 2a          	cmp    sil,0x2a
  4019f8:	0f 84 b2 05 00 00    	je     401fb0 <format_string_loop.constprop.0+0x6c0>
  4019fe:	49 89 fe             	mov    r14,rdi
  401a01:	8d 7e 98             	lea    edi,[rsi-0x68]
  401a04:	49 8d 5e 01          	lea    rbx,[r14+0x1]
  401a08:	40 80 ff 12          	cmp    dil,0x12
  401a0c:	76 83                	jbe    401991 <format_string_loop.constprop.0+0xa1>
  401a0e:	66 90                	xchg   ax,ax
  401a10:	8d 7e db             	lea    edi,[rsi-0x25]
  401a13:	40 80 ff 53          	cmp    dil,0x53
  401a17:	77 17                	ja     401a30 <format_string_loop.constprop.0+0x140>
  401a19:	48 8d 05 98 16 00 00 	lea    rax,[rip+0x1698]        # 4030b8 <putchar_+0x628>
  401a20:	40 0f b6 ff          	movzx  edi,dil
  401a24:	48 63 3c b8          	movsxd rdi,DWORD PTR [rax+rdi*4]
  401a28:	48 01 c7             	add    rdi,rax
  401a2b:	3e ff e7             	notrack jmp rdi
  401a2e:	66 90                	xchg   ax,ax
  401a30:	41 8b 54 24 18       	mov    edx,DWORD PTR [r12+0x18]
  401a35:	8d 4a 01             	lea    ecx,[rdx+0x1]
  401a38:	41 89 4c 24 18       	mov    DWORD PTR [r12+0x18],ecx
  401a3d:	41 3b 54 24 1c       	cmp    edx,DWORD PTR [r12+0x1c]
  401a42:	73 1c                	jae    401a60 <format_string_loop.constprop.0+0x170>
  401a44:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  401a48:	48 85 c9             	test   rcx,rcx
  401a4b:	0f 84 cf 09 00 00    	je     402420 <format_string_loop.constprop.0+0xb30>
  401a51:	4d 8b 44 24 08       	mov    r8,QWORD PTR [r12+0x8]
  401a56:	40 0f be fe          	movsx  edi,sil
  401a5a:	4c 89 c6             	mov    rsi,r8
  401a5d:	ff d1                	call   rcx
  401a5f:	90                   	nop
  401a60:	0f b6 13             	movzx  edx,BYTE PTR [rbx]
  401a63:	84 d2                	test   dl,dl
  401a65:	0f 85 b5 fe ff ff    	jne    401920 <format_string_loop.constprop.0+0x30>
  401a6b:	48 83 c4 38          	add    rsp,0x38
  401a6f:	5b                   	pop    rbx
  401a70:	5d                   	pop    rbp
  401a71:	41 5c                	pop    r12
  401a73:	41 5d                	pop    r13
  401a75:	41 5e                	pop    r14
  401a77:	41 5f                	pop    r15
  401a79:	c3                   	ret    
  401a7a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  401a80:	83 c9 02             	or     ecx,0x2
  401a83:	0f be 33             	movsx  esi,BYTE PTR [rbx]
  401a86:	49 89 de             	mov    r14,rbx
  401a89:	e9 b2 fe ff ff       	jmp    401940 <format_string_loop.constprop.0+0x50>
  401a8e:	66 90                	xchg   ax,ax
  401a90:	83 c9 04             	or     ecx,0x4
  401a93:	eb ee                	jmp    401a83 <format_string_loop.constprop.0+0x193>
  401a95:	0f 1f 00             	nop    DWORD PTR [rax]
  401a98:	83 c9 10             	or     ecx,0x10
  401a9b:	eb e6                	jmp    401a83 <format_string_loop.constprop.0+0x193>
  401a9d:	0f 1f 00             	nop    DWORD PTR [rax]
  401aa0:	83 c9 08             	or     ecx,0x8
  401aa3:	eb de                	jmp    401a83 <format_string_loop.constprop.0+0x193>
  401aa5:	0f 1f 00             	nop    DWORD PTR [rax]
  401aa8:	83 c9 01             	or     ecx,0x1
  401aab:	eb d6                	jmp    401a83 <format_string_loop.constprop.0+0x193>
  401aad:	0f 1f 00             	nop    DWORD PTR [rax]
  401ab0:	41 0f b6 76 01       	movzx  esi,BYTE PTR [r14+0x1]
  401ab5:	80 cd 02             	or     ch,0x2
  401ab8:	40 84 f6             	test   sil,sil
  401abb:	74 ae                	je     401a6b <format_string_loop.constprop.0+0x17b>
  401abd:	48 83 c3 01          	add    rbx,0x1
  401ac1:	e9 4a ff ff ff       	jmp    401a10 <format_string_loop.constprop.0+0x120>
  401ac6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  401acd:	00 00 00 
  401ad0:	40 80 fe 64          	cmp    sil,0x64
  401ad4:	0f 84 2a 06 00 00    	je     402104 <format_string_loop.constprop.0+0x814>
  401ada:	40 80 fe 69          	cmp    sil,0x69
  401ade:	0f 84 20 06 00 00    	je     402104 <format_string_loop.constprop.0+0x814>
  401ae4:	89 f7                	mov    edi,esi
  401ae6:	83 e7 df             	and    edi,0xffffffdf
  401ae9:	40 80 ff 58          	cmp    dil,0x58
  401aed:	0f 84 f6 05 00 00    	je     4020e9 <format_string_loop.constprop.0+0x7f9>
  401af3:	41 bb 08 00 00 00    	mov    r11d,0x8
  401af9:	40 80 fe 6f          	cmp    sil,0x6f
  401afd:	74 15                	je     401b14 <format_string_loop.constprop.0+0x224>
  401aff:	41 bb 02 00 00 00    	mov    r11d,0x2
  401b05:	40 80 fe 62          	cmp    sil,0x62
  401b09:	74 09                	je     401b14 <format_string_loop.constprop.0+0x224>
  401b0b:	83 e1 ef             	and    ecx,0xffffffef
  401b0e:	41 bb 0a 00 00 00    	mov    r11d,0xa
  401b14:	89 ce                	mov    esi,ecx
  401b16:	83 e6 fe             	and    esi,0xfffffffe
  401b19:	f6 c5 08             	test   ch,0x8
  401b1c:	0f 45 ce             	cmovne ecx,esi
  401b1f:	41 8b 37             	mov    esi,DWORD PTR [r15]
  401b22:	89 cf                	mov    edi,ecx
  401b24:	81 e7 00 04 00 00    	and    edi,0x400
  401b2a:	f6 c5 40             	test   ch,0x40
  401b2d:	0f 84 5d 05 00 00    	je     402090 <format_string_loop.constprop.0+0x7a0>
  401b33:	85 ff                	test   edi,edi
  401b35:	0f 85 3e 07 00 00    	jne    402279 <format_string_loop.constprop.0+0x989>
  401b3b:	f6 c5 02             	test   ch,0x2
  401b3e:	0f 85 35 07 00 00    	jne    402279 <format_string_loop.constprop.0+0x989>
  401b44:	f6 c1 40             	test   cl,0x40
  401b47:	0f 84 e8 09 00 00    	je     402535 <format_string_loop.constprop.0+0xc45>
  401b4d:	83 fe 2f             	cmp    esi,0x2f
  401b50:	0f 87 3b 0a 00 00    	ja     402591 <format_string_loop.constprop.0+0xca1>
  401b56:	89 f7                	mov    edi,esi
  401b58:	83 c6 08             	add    esi,0x8
  401b5b:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  401b5f:	41 89 37             	mov    DWORD PTR [r15],esi
  401b62:	0f be 3f             	movsx  edi,BYTE PTR [rdi]
  401b65:	4c 63 c7             	movsxd r8,edi
  401b68:	41 89 fe             	mov    r14d,edi
  401b6b:	41 89 d1             	mov    r9d,edx
  401b6e:	4c 89 c6             	mov    rsi,r8
  401b71:	41 c1 ee 1f          	shr    r14d,0x1f
  401b75:	48 f7 de             	neg    rsi
  401b78:	85 ff                	test   edi,edi
  401b7a:	44 89 f2             	mov    edx,r14d
  401b7d:	4c 89 e7             	mov    rdi,r12
  401b80:	49 0f 4f f0          	cmovg  rsi,r8
  401b84:	48 83 ec 08          	sub    rsp,0x8
  401b88:	45 89 d0             	mov    r8d,r10d
  401b8b:	51                   	push   rcx
  401b8c:	44 89 d9             	mov    ecx,r11d
  401b8f:	e8 9c ed ff ff       	call   400930 <print_integer>
  401b94:	41 5a                	pop    r10
  401b96:	41 5b                	pop    r11
  401b98:	e9 c3 fe ff ff       	jmp    401a60 <format_string_loop.constprop.0+0x170>
  401b9d:	41 0f b6 76 01       	movzx  esi,BYTE PTR [r14+0x1]
  401ba2:	40 84 f6             	test   sil,sil
  401ba5:	0f 84 c0 fe ff ff    	je     401a6b <format_string_loop.constprop.0+0x17b>
  401bab:	40 80 fe 68          	cmp    sil,0x68
  401baf:	0f 84 3b 04 00 00    	je     401ff0 <format_string_loop.constprop.0+0x700>
  401bb5:	80 c9 80             	or     cl,0x80
  401bb8:	48 83 c3 01          	add    rbx,0x1
  401bbc:	e9 4f fe ff ff       	jmp    401a10 <format_string_loop.constprop.0+0x120>
  401bc1:	41 0f b6 76 01       	movzx  esi,BYTE PTR [r14+0x1]
  401bc6:	40 84 f6             	test   sil,sil
  401bc9:	0f 84 9c fe ff ff    	je     401a6b <format_string_loop.constprop.0+0x17b>
  401bcf:	40 80 fe 6c          	cmp    sil,0x6c
  401bd3:	0f 84 31 04 00 00    	je     40200a <format_string_loop.constprop.0+0x71a>
  401bd9:	80 cd 02             	or     ch,0x2
  401bdc:	48 83 c3 01          	add    rbx,0x1
  401be0:	e9 2b fe ff ff       	jmp    401a10 <format_string_loop.constprop.0+0x120>
  401be5:	41 89 f0             	mov    r8d,esi
  401be8:	89 cf                	mov    edi,ecx
  401bea:	41 83 e0 df          	and    r8d,0xffffffdf
  401bee:	81 cf 00 10 00 00    	or     edi,0x1000
  401bf4:	41 80 f8 47          	cmp    r8b,0x47
  401bf8:	0f 44 cf             	cmove  ecx,edi
  401bfb:	83 e6 fd             	and    esi,0xfffffffd
  401bfe:	89 cf                	mov    edi,ecx
  401c00:	83 cf 20             	or     edi,0x20
  401c03:	40 80 fe 45          	cmp    sil,0x45
  401c07:	41 8b 77 04          	mov    esi,DWORD PTR [r15+0x4]
  401c0b:	0f 44 cf             	cmove  ecx,edi
  401c0e:	81 fe af 00 00 00    	cmp    esi,0xaf
  401c14:	0f 87 06 04 00 00    	ja     402020 <format_string_loop.constprop.0+0x730>
  401c1a:	89 f7                	mov    edi,esi
  401c1c:	83 c6 10             	add    esi,0x10
  401c1f:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  401c23:	41 89 77 04          	mov    DWORD PTR [r15+0x4],esi
  401c27:	f2 0f 10 07          	movsd  xmm0,QWORD PTR [rdi]
  401c2b:	41 b8 01 00 00 00    	mov    r8d,0x1
  401c31:	44 89 d6             	mov    esi,r10d
  401c34:	4c 89 e7             	mov    rdi,r12
  401c37:	e8 c4 fa ff ff       	call   401700 <print_floating_point>
  401c3c:	e9 1f fe ff ff       	jmp    401a60 <format_string_loop.constprop.0+0x170>
  401c41:	89 cf                	mov    edi,ecx
  401c43:	83 cf 20             	or     edi,0x20
  401c46:	40 80 fe 46          	cmp    sil,0x46
  401c4a:	41 8b 77 04          	mov    esi,DWORD PTR [r15+0x4]
  401c4e:	0f 44 cf             	cmove  ecx,edi
  401c51:	81 fe af 00 00 00    	cmp    esi,0xaf
  401c57:	0f 87 af 04 00 00    	ja     40210c <format_string_loop.constprop.0+0x81c>
  401c5d:	89 f7                	mov    edi,esi
  401c5f:	83 c6 10             	add    esi,0x10
  401c62:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  401c66:	41 89 77 04          	mov    DWORD PTR [r15+0x4],esi
  401c6a:	f2 0f 10 07          	movsd  xmm0,QWORD PTR [rdi]
  401c6e:	45 31 c0             	xor    r8d,r8d
  401c71:	44 89 d6             	mov    esi,r10d
  401c74:	4c 89 e7             	mov    rdi,r12
  401c77:	e8 84 fa ff ff       	call   401700 <print_floating_point>
  401c7c:	e9 df fd ff ff       	jmp    401a60 <format_string_loop.constprop.0+0x170>
  401c81:	41 8b 37             	mov    esi,DWORD PTR [r15]
  401c84:	83 fe 2f             	cmp    esi,0x2f
  401c87:	0f 87 a4 03 00 00    	ja     402031 <format_string_loop.constprop.0+0x741>
  401c8d:	89 f7                	mov    edi,esi
  401c8f:	83 c6 08             	add    esi,0x8
  401c92:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  401c96:	41 89 37             	mov    DWORD PTR [r15],esi
  401c99:	48 8b 2f             	mov    rbp,QWORD PTR [rdi]
  401c9c:	48 85 ed             	test   rbp,rbp
  401c9f:	0f 84 a4 03 00 00    	je     402049 <format_string_loop.constprop.0+0x759>
  401ca5:	44 0f b6 4d 00       	movzx  r9d,BYTE PTR [rbp+0x0]
  401caa:	44 89 ce             	mov    esi,r9d
  401cad:	45 85 d2             	test   r10d,r10d
  401cb0:	0f 85 35 05 00 00    	jne    4021eb <format_string_loop.constprop.0+0x8fb>
  401cb6:	bf fe ff ff 7f       	mov    edi,0x7ffffffe
  401cbb:	45 84 c9             	test   r9b,r9b
  401cbe:	0f 84 82 09 00 00    	je     402646 <format_string_loop.constprop.0+0xd56>
  401cc4:	83 c7 01             	add    edi,0x1
  401cc7:	49 89 ee             	mov    r14,rbp
  401cca:	48 01 ef             	add    rdi,rbp
  401ccd:	eb 06                	jmp    401cd5 <format_string_loop.constprop.0+0x3e5>
  401ccf:	90                   	nop
  401cd0:	49 39 fe             	cmp    r14,rdi
  401cd3:	74 0a                	je     401cdf <format_string_loop.constprop.0+0x3ef>
  401cd5:	49 83 c6 01          	add    r14,0x1
  401cd9:	41 80 3e 00          	cmp    BYTE PTR [r14],0x0
  401cdd:	75 f1                	jne    401cd0 <format_string_loop.constprop.0+0x3e0>
  401cdf:	44 89 f0             	mov    eax,r14d
  401ce2:	29 e8                	sub    eax,ebp
  401ce4:	89 44 24 10          	mov    DWORD PTR [rsp+0x10],eax
  401ce8:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  401cec:	41 89 ce             	mov    r14d,ecx
  401cef:	44 39 d0             	cmp    eax,r10d
  401cf2:	89 c7                	mov    edi,eax
  401cf4:	41 0f 47 fa          	cmova  edi,r10d
  401cf8:	41 81 e6 00 08 00 00 	and    r14d,0x800
  401cff:	0f 44 f8             	cmove  edi,eax
  401d02:	83 e1 02             	and    ecx,0x2
  401d05:	89 4c 24 1c          	mov    DWORD PTR [rsp+0x1c],ecx
  401d09:	89 7c 24 10          	mov    DWORD PTR [rsp+0x10],edi
  401d0d:	0f 84 1b 07 00 00    	je     40242e <format_string_loop.constprop.0+0xb3e>
  401d13:	45 84 c9             	test   r9b,r9b
  401d16:	0f 84 92 00 00 00    	je     401dae <format_string_loop.constprop.0+0x4be>
  401d1c:	45 85 f6             	test   r14d,r14d
  401d1f:	0f 94 44 24 08       	sete   BYTE PTR [rsp+0x8]
  401d24:	0f b6 44 24 08       	movzx  eax,BYTE PTR [rsp+0x8]
  401d29:	45 85 d2             	test   r10d,r10d
  401d2c:	75 04                	jne    401d32 <format_string_loop.constprop.0+0x442>
  401d2e:	84 c0                	test   al,al
  401d30:	74 7c                	je     401dae <format_string_loop.constprop.0+0x4be>
  401d32:	4c 89 7c 24 20       	mov    QWORD PTR [rsp+0x20],r15
  401d37:	49 89 ee             	mov    r14,rbp
  401d3a:	41 89 d7             	mov    r15d,edx
  401d3d:	48 89 5c 24 28       	mov    QWORD PTR [rsp+0x28],rbx
  401d42:	44 89 d3             	mov    ebx,r10d
  401d45:	0f 1f 00             	nop    DWORD PTR [rax]
  401d48:	41 8b 44 24 18       	mov    eax,DWORD PTR [r12+0x18]
  401d4d:	49 83 c6 01          	add    r14,0x1
  401d51:	8d 78 01             	lea    edi,[rax+0x1]
  401d54:	41 89 7c 24 18       	mov    DWORD PTR [r12+0x18],edi
  401d59:	41 3b 44 24 1c       	cmp    eax,DWORD PTR [r12+0x1c]
  401d5e:	73 1c                	jae    401d7c <format_string_loop.constprop.0+0x48c>
  401d60:	4d 8b 04 24          	mov    r8,QWORD PTR [r12]
  401d64:	4d 85 c0             	test   r8,r8
  401d67:	0f 84 c3 05 00 00    	je     402330 <format_string_loop.constprop.0+0xa40>
  401d6d:	4d 8b 4c 24 08       	mov    r9,QWORD PTR [r12+0x8]
  401d72:	40 0f be fe          	movsx  edi,sil
  401d76:	4c 89 ce             	mov    rsi,r9
  401d79:	41 ff d0             	call   r8
  401d7c:	41 0f b6 36          	movzx  esi,BYTE PTR [r14]
  401d80:	40 84 f6             	test   sil,sil
  401d83:	74 10                	je     401d95 <format_string_loop.constprop.0+0x4a5>
  401d85:	89 d8                	mov    eax,ebx
  401d87:	44 29 f0             	sub    eax,r14d
  401d8a:	01 e8                	add    eax,ebp
  401d8c:	75 ba                	jne    401d48 <format_string_loop.constprop.0+0x458>
  401d8e:	80 7c 24 08 00       	cmp    BYTE PTR [rsp+0x8],0x0
  401d93:	75 b3                	jne    401d48 <format_string_loop.constprop.0+0x458>
  401d95:	8b 4c 24 1c          	mov    ecx,DWORD PTR [rsp+0x1c]
  401d99:	44 89 fa             	mov    edx,r15d
  401d9c:	48 8b 5c 24 28       	mov    rbx,QWORD PTR [rsp+0x28]
  401da1:	4c 8b 7c 24 20       	mov    r15,QWORD PTR [rsp+0x20]
  401da6:	85 c9                	test   ecx,ecx
  401da8:	0f 84 b2 fc ff ff    	je     401a60 <format_string_loop.constprop.0+0x170>
  401dae:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  401db2:	41 89 d6             	mov    r14d,edx
  401db5:	8d 68 01             	lea    ebp,[rax+0x1]
  401db8:	39 c2                	cmp    edx,eax
  401dba:	0f 87 22 05 00 00    	ja     4022e2 <format_string_loop.constprop.0+0x9f2>
  401dc0:	e9 9b fc ff ff       	jmp    401a60 <format_string_loop.constprop.0+0x170>
  401dc5:	0f 1f 00             	nop    DWORD PTR [rax]
  401dc8:	41 8b 54 24 18       	mov    edx,DWORD PTR [r12+0x18]
  401dcd:	8d 4a 01             	lea    ecx,[rdx+0x1]
  401dd0:	41 89 4c 24 18       	mov    DWORD PTR [r12+0x18],ecx
  401dd5:	41 3b 54 24 1c       	cmp    edx,DWORD PTR [r12+0x1c]
  401dda:	0f 83 80 fc ff ff    	jae    401a60 <format_string_loop.constprop.0+0x170>
  401de0:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  401de4:	48 85 c9             	test   rcx,rcx
  401de7:	0f 84 25 06 00 00    	je     402412 <format_string_loop.constprop.0+0xb22>
  401ded:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  401df2:	bf 25 00 00 00       	mov    edi,0x25
  401df7:	ff d1                	call   rcx
  401df9:	e9 62 fc ff ff       	jmp    401a60 <format_string_loop.constprop.0+0x170>
  401dfe:	41 8b 74 24 18       	mov    esi,DWORD PTR [r12+0x18]
  401e03:	41 8b 17             	mov    edx,DWORD PTR [r15]
  401e06:	f6 c1 40             	test   cl,0x40
  401e09:	0f 84 58 02 00 00    	je     402067 <format_string_loop.constprop.0+0x777>
  401e0f:	83 fa 2f             	cmp    edx,0x2f
  401e12:	0f 86 e5 03 00 00    	jbe    4021fd <format_string_loop.constprop.0+0x90d>
  401e18:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  401e1c:	48 8d 51 08          	lea    rdx,[rcx+0x8]
  401e20:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  401e24:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  401e27:	40 88 32             	mov    BYTE PTR [rdx],sil
  401e2a:	e9 31 fc ff ff       	jmp    401a60 <format_string_loop.constprop.0+0x170>
  401e2f:	83 e1 02             	and    ecx,0x2
  401e32:	41 8b 74 24 18       	mov    esi,DWORD PTR [r12+0x18]
  401e37:	41 8b 7c 24 1c       	mov    edi,DWORD PTR [r12+0x1c]
  401e3c:	89 cd                	mov    ebp,ecx
  401e3e:	0f 84 fa 04 00 00    	je     40233e <format_string_loop.constprop.0+0xa4e>
  401e44:	41 8b 0f             	mov    ecx,DWORD PTR [r15]
  401e47:	83 f9 2f             	cmp    ecx,0x2f
  401e4a:	0f 87 06 03 00 00    	ja     402156 <format_string_loop.constprop.0+0x866>
  401e50:	41 89 c8             	mov    r8d,ecx
  401e53:	83 c1 08             	add    ecx,0x8
  401e56:	4d 03 47 10          	add    r8,QWORD PTR [r15+0x10]
  401e5a:	41 89 0f             	mov    DWORD PTR [r15],ecx
  401e5d:	41 8b 08             	mov    ecx,DWORD PTR [r8]
  401e60:	44 8d 46 01          	lea    r8d,[rsi+0x1]
  401e64:	45 89 44 24 18       	mov    DWORD PTR [r12+0x18],r8d
  401e69:	39 fe                	cmp    esi,edi
  401e6b:	0f 83 05 03 00 00    	jae    402176 <format_string_loop.constprop.0+0x886>
  401e71:	41 89 c8             	mov    r8d,ecx
  401e74:	0f be f9             	movsx  edi,cl
  401e77:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  401e7b:	c7 44 24 08 01 00 00 	mov    DWORD PTR [rsp+0x8],0x1
  401e82:	00 
  401e83:	48 85 c9             	test   rcx,rcx
  401e86:	0f 84 60 05 00 00    	je     4023ec <format_string_loop.constprop.0+0xafc>
  401e8c:	89 54 24 10          	mov    DWORD PTR [rsp+0x10],edx
  401e90:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  401e95:	ff d1                	call   rcx
  401e97:	8b 54 24 10          	mov    edx,DWORD PTR [rsp+0x10]
  401e9b:	85 ed                	test   ebp,ebp
  401e9d:	0f 84 bd fb ff ff    	je     401a60 <format_string_loop.constprop.0+0x170>
  401ea3:	8b 44 24 08          	mov    eax,DWORD PTR [rsp+0x8]
  401ea7:	8d 68 01             	lea    ebp,[rax+0x1]
  401eaa:	e9 d4 02 00 00       	jmp    402183 <format_string_loop.constprop.0+0x893>
  401eaf:	90                   	nop
  401eb0:	41 8b 17             	mov    edx,DWORD PTR [r15]
  401eb3:	81 c9 01 20 00 00    	or     ecx,0x2001
  401eb9:	83 fa 2f             	cmp    edx,0x2f
  401ebc:	0f 87 5b 02 00 00    	ja     40211d <format_string_loop.constprop.0+0x82d>
  401ec2:	89 d6                	mov    esi,edx
  401ec4:	83 c2 08             	add    edx,0x8
  401ec7:	49 03 77 10          	add    rsi,QWORD PTR [r15+0x10]
  401ecb:	41 89 17             	mov    DWORD PTR [r15],edx
  401ece:	48 8b 36             	mov    rsi,QWORD PTR [rsi]
  401ed1:	48 85 f6             	test   rsi,rsi
  401ed4:	0f 84 5b 02 00 00    	je     402135 <format_string_loop.constprop.0+0x845>
  401eda:	48 83 ec 08          	sub    rsp,0x8
  401ede:	31 d2                	xor    edx,edx
  401ee0:	41 b9 12 00 00 00    	mov    r9d,0x12
  401ee6:	45 89 d0             	mov    r8d,r10d
  401ee9:	51                   	push   rcx
  401eea:	4c 89 e7             	mov    rdi,r12
  401eed:	b9 10 00 00 00       	mov    ecx,0x10
  401ef2:	e8 39 ea ff ff       	call   400930 <print_integer>
  401ef7:	58                   	pop    rax
  401ef8:	5a                   	pop    rdx
  401ef9:	e9 62 fb ff ff       	jmp    401a60 <format_string_loop.constprop.0+0x170>
  401efe:	66 90                	xchg   ax,ax
  401f00:	41 8b 4c 24 18       	mov    ecx,DWORD PTR [r12+0x18]
  401f05:	8d 71 01             	lea    esi,[rcx+0x1]
  401f08:	41 89 74 24 18       	mov    DWORD PTR [r12+0x18],esi
  401f0d:	41 3b 4c 24 1c       	cmp    ecx,DWORD PTR [r12+0x1c]
  401f12:	73 18                	jae    401f2c <format_string_loop.constprop.0+0x63c>
  401f14:	4d 8b 04 24          	mov    r8,QWORD PTR [r12]
  401f18:	4d 85 c0             	test   r8,r8
  401f1b:	0f 84 7f 00 00 00    	je     401fa0 <format_string_loop.constprop.0+0x6b0>
  401f21:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  401f26:	0f be fa             	movsx  edi,dl
  401f29:	41 ff d0             	call   r8
  401f2c:	4c 89 f3             	mov    rbx,r14
  401f2f:	e9 2c fb ff ff       	jmp    401a60 <format_string_loop.constprop.0+0x170>
  401f34:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401f38:	43 8d 04 92          	lea    eax,[r10+r10*4]
  401f3c:	48 83 c7 01          	add    rdi,0x1
  401f40:	44 8d 54 46 d0       	lea    r10d,[rsi+rax*2-0x30]
  401f45:	0f be 37             	movsx  esi,BYTE PTR [rdi]
  401f48:	8d 46 d0             	lea    eax,[rsi-0x30]
  401f4b:	3c 09                	cmp    al,0x9
  401f4d:	76 e9                	jbe    401f38 <format_string_loop.constprop.0+0x648>
  401f4f:	e9 aa fa ff ff       	jmp    4019fe <format_string_loop.constprop.0+0x10e>
  401f54:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401f58:	41 8b 17             	mov    edx,DWORD PTR [r15]
  401f5b:	83 fa 2f             	cmp    edx,0x2f
  401f5e:	77 30                	ja     401f90 <format_string_loop.constprop.0+0x6a0>
  401f60:	89 d6                	mov    esi,edx
  401f62:	83 c2 08             	add    edx,0x8
  401f65:	49 03 77 10          	add    rsi,QWORD PTR [r15+0x10]
  401f69:	41 89 17             	mov    DWORD PTR [r15],edx
  401f6c:	8b 16                	mov    edx,DWORD PTR [rsi]
  401f6e:	85 d2                	test   edx,edx
  401f70:	79 05                	jns    401f77 <format_string_loop.constprop.0+0x687>
  401f72:	83 c9 02             	or     ecx,0x2
  401f75:	f7 da                	neg    edx
  401f77:	41 0f b6 76 01       	movzx  esi,BYTE PTR [r14+0x1]
  401f7c:	40 84 f6             	test   sil,sil
  401f7f:	0f 84 e6 fa ff ff    	je     401a6b <format_string_loop.constprop.0+0x17b>
  401f85:	49 89 de             	mov    r14,rbx
  401f88:	e9 ea f9 ff ff       	jmp    401977 <format_string_loop.constprop.0+0x87>
  401f8d:	0f 1f 00             	nop    DWORD PTR [rax]
  401f90:	49 8b 77 08          	mov    rsi,QWORD PTR [r15+0x8]
  401f94:	48 8d 56 08          	lea    rdx,[rsi+0x8]
  401f98:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  401f9c:	eb ce                	jmp    401f6c <format_string_loop.constprop.0+0x67c>
  401f9e:	66 90                	xchg   ax,ax
  401fa0:	49 8b 74 24 10       	mov    rsi,QWORD PTR [r12+0x10]
  401fa5:	88 14 0e             	mov    BYTE PTR [rsi+rcx*1],dl
  401fa8:	e9 7f ff ff ff       	jmp    401f2c <format_string_loop.constprop.0+0x63c>
  401fad:	0f 1f 00             	nop    DWORD PTR [rax]
  401fb0:	41 8b 37             	mov    esi,DWORD PTR [r15]
  401fb3:	83 fe 2f             	cmp    esi,0x2f
  401fb6:	0f 87 1e 02 00 00    	ja     4021da <format_string_loop.constprop.0+0x8ea>
  401fbc:	89 f7                	mov    edi,esi
  401fbe:	83 c6 08             	add    esi,0x8
  401fc1:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  401fc5:	41 89 37             	mov    DWORD PTR [r15],esi
  401fc8:	44 8b 17             	mov    r10d,DWORD PTR [rdi]
  401fcb:	31 f6                	xor    esi,esi
  401fcd:	49 8d 7e 02          	lea    rdi,[r14+0x2]
  401fd1:	45 85 d2             	test   r10d,r10d
  401fd4:	44 0f 48 d6          	cmovs  r10d,esi
  401fd8:	41 0f b6 76 02       	movzx  esi,BYTE PTR [r14+0x2]
  401fdd:	40 84 f6             	test   sil,sil
  401fe0:	0f 85 18 fa ff ff    	jne    4019fe <format_string_loop.constprop.0+0x10e>
  401fe6:	e9 80 fa ff ff       	jmp    401a6b <format_string_loop.constprop.0+0x17b>
  401feb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  401ff0:	41 0f b6 76 02       	movzx  esi,BYTE PTR [r14+0x2]
  401ff5:	80 c9 c0             	or     cl,0xc0
  401ff8:	40 84 f6             	test   sil,sil
  401ffb:	0f 84 6a fa ff ff    	je     401a6b <format_string_loop.constprop.0+0x17b>
  402001:	49 8d 5e 03          	lea    rbx,[r14+0x3]
  402005:	e9 06 fa ff ff       	jmp    401a10 <format_string_loop.constprop.0+0x120>
  40200a:	41 0f b6 76 02       	movzx  esi,BYTE PTR [r14+0x2]
  40200f:	80 cd 06             	or     ch,0x6
  402012:	40 84 f6             	test   sil,sil
  402015:	75 ea                	jne    402001 <format_string_loop.constprop.0+0x711>
  402017:	e9 4f fa ff ff       	jmp    401a6b <format_string_loop.constprop.0+0x17b>
  40201c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402020:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  402024:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  402028:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  40202c:	e9 f6 fb ff ff       	jmp    401c27 <format_string_loop.constprop.0+0x337>
  402031:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  402035:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  402039:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  40203d:	48 8b 2f             	mov    rbp,QWORD PTR [rdi]
  402040:	48 85 ed             	test   rbp,rbp
  402043:	0f 85 5c fc ff ff    	jne    401ca5 <format_string_loop.constprop.0+0x3b5>
  402049:	41 89 c8             	mov    r8d,ecx
  40204c:	48 8d 35 c7 0f 00 00 	lea    rsi,[rip+0xfc7]        # 40301a <putchar_+0x58a>
  402053:	89 d1                	mov    ecx,edx
  402055:	4c 89 e7             	mov    rdi,r12
  402058:	ba 06 00 00 00       	mov    edx,0x6
  40205d:	e8 8e e7 ff ff       	call   4007f0 <out_rev_>
  402062:	e9 f9 f9 ff ff       	jmp    401a60 <format_string_loop.constprop.0+0x170>
  402067:	f6 c1 80             	test   cl,0x80
  40206a:	0f 84 9e 01 00 00    	je     40220e <format_string_loop.constprop.0+0x91e>
  402070:	83 fa 2f             	cmp    edx,0x2f
  402073:	0f 87 ab 04 00 00    	ja     402524 <format_string_loop.constprop.0+0xc34>
  402079:	89 d1                	mov    ecx,edx
  40207b:	83 c2 08             	add    edx,0x8
  40207e:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  402082:	41 89 17             	mov    DWORD PTR [r15],edx
  402085:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  402088:	66 89 32             	mov    WORD PTR [rdx],si
  40208b:	e9 d0 f9 ff ff       	jmp    401a60 <format_string_loop.constprop.0+0x170>
  402090:	41 89 c8             	mov    r8d,ecx
  402093:	41 83 e0 f3          	and    r8d,0xfffffff3
  402097:	85 ff                	test   edi,edi
  402099:	0f 85 a0 01 00 00    	jne    40223f <format_string_loop.constprop.0+0x94f>
  40209f:	f6 c5 02             	test   ch,0x2
  4020a2:	0f 85 97 01 00 00    	jne    40223f <format_string_loop.constprop.0+0x94f>
  4020a8:	f6 c1 40             	test   cl,0x40
  4020ab:	0f 84 aa 04 00 00    	je     40255b <format_string_loop.constprop.0+0xc6b>
  4020b1:	83 fe 2f             	cmp    esi,0x2f
  4020b4:	0f 87 00 05 00 00    	ja     4025ba <format_string_loop.constprop.0+0xcca>
  4020ba:	89 f1                	mov    ecx,esi
  4020bc:	83 c6 08             	add    esi,0x8
  4020bf:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  4020c3:	41 89 37             	mov    DWORD PTR [r15],esi
  4020c6:	0f b6 31             	movzx  esi,BYTE PTR [rcx]
  4020c9:	48 83 ec 08          	sub    rsp,0x8
  4020cd:	41 89 d1             	mov    r9d,edx
  4020d0:	4c 89 e7             	mov    rdi,r12
  4020d3:	44 89 d9             	mov    ecx,r11d
  4020d6:	41 50                	push   r8
  4020d8:	31 d2                	xor    edx,edx
  4020da:	45 89 d0             	mov    r8d,r10d
  4020dd:	e8 4e e8 ff ff       	call   400930 <print_integer>
  4020e2:	5e                   	pop    rsi
  4020e3:	5f                   	pop    rdi
  4020e4:	e9 77 f9 ff ff       	jmp    401a60 <format_string_loop.constprop.0+0x170>
  4020e9:	89 cf                	mov    edi,ecx
  4020eb:	83 c9 20             	or     ecx,0x20
  4020ee:	40 80 fe 58          	cmp    sil,0x58
  4020f2:	41 bb 10 00 00 00    	mov    r11d,0x10
  4020f8:	89 cd                	mov    ebp,ecx
  4020fa:	89 f9                	mov    ecx,edi
  4020fc:	0f 44 cd             	cmove  ecx,ebp
  4020ff:	e9 10 fa ff ff       	jmp    401b14 <format_string_loop.constprop.0+0x224>
  402104:	80 cd 40             	or     ch,0x40
  402107:	e9 d8 f9 ff ff       	jmp    401ae4 <format_string_loop.constprop.0+0x1f4>
  40210c:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  402110:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  402114:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  402118:	e9 4d fb ff ff       	jmp    401c6a <format_string_loop.constprop.0+0x37a>
  40211d:	49 8b 77 08          	mov    rsi,QWORD PTR [r15+0x8]
  402121:	48 8d 56 08          	lea    rdx,[rsi+0x8]
  402125:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  402129:	48 8b 36             	mov    rsi,QWORD PTR [rsi]
  40212c:	48 85 f6             	test   rsi,rsi
  40212f:	0f 85 a5 fd ff ff    	jne    401eda <format_string_loop.constprop.0+0x5ea>
  402135:	41 89 c8             	mov    r8d,ecx
  402138:	ba 05 00 00 00       	mov    edx,0x5
  40213d:	b9 12 00 00 00       	mov    ecx,0x12
  402142:	4c 89 e7             	mov    rdi,r12
  402145:	48 8d 35 d5 0e 00 00 	lea    rsi,[rip+0xed5]        # 403021 <putchar_+0x591>
  40214c:	e8 9f e6 ff ff       	call   4007f0 <out_rev_>
  402151:	e9 0a f9 ff ff       	jmp    401a60 <format_string_loop.constprop.0+0x170>
  402156:	4d 8b 47 08          	mov    r8,QWORD PTR [r15+0x8]
  40215a:	49 8d 48 08          	lea    rcx,[r8+0x8]
  40215e:	49 89 4f 08          	mov    QWORD PTR [r15+0x8],rcx
  402162:	41 8b 08             	mov    ecx,DWORD PTR [r8]
  402165:	44 8d 46 01          	lea    r8d,[rsi+0x1]
  402169:	45 89 44 24 18       	mov    DWORD PTR [r12+0x18],r8d
  40216e:	39 fe                	cmp    esi,edi
  402170:	0f 82 fb fc ff ff    	jb     401e71 <format_string_loop.constprop.0+0x581>
  402176:	c7 44 24 08 01 00 00 	mov    DWORD PTR [rsp+0x8],0x1
  40217d:	00 
  40217e:	bd 02 00 00 00       	mov    ebp,0x2
  402183:	41 89 d6             	mov    r14d,edx
  402186:	3b 54 24 08          	cmp    edx,DWORD PTR [rsp+0x8]
  40218a:	77 26                	ja     4021b2 <format_string_loop.constprop.0+0x8c2>
  40218c:	e9 cf f8 ff ff       	jmp    401a60 <format_string_loop.constprop.0+0x170>
  402191:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  402198:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  40219d:	bf 20 00 00 00       	mov    edi,0x20
  4021a2:	ff d1                	call   rcx
  4021a4:	8d 45 01             	lea    eax,[rbp+0x1]
  4021a7:	41 39 ee             	cmp    r14d,ebp
  4021aa:	0f 86 b0 f8 ff ff    	jbe    401a60 <format_string_loop.constprop.0+0x170>
  4021b0:	89 c5                	mov    ebp,eax
  4021b2:	41 8b 44 24 18       	mov    eax,DWORD PTR [r12+0x18]
  4021b7:	8d 48 01             	lea    ecx,[rax+0x1]
  4021ba:	41 89 4c 24 18       	mov    DWORD PTR [r12+0x18],ecx
  4021bf:	41 3b 44 24 1c       	cmp    eax,DWORD PTR [r12+0x1c]
  4021c4:	73 de                	jae    4021a4 <format_string_loop.constprop.0+0x8b4>
  4021c6:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  4021ca:	48 85 c9             	test   rcx,rcx
  4021cd:	75 c9                	jne    402198 <format_string_loop.constprop.0+0x8a8>
  4021cf:	49 8b 54 24 10       	mov    rdx,QWORD PTR [r12+0x10]
  4021d4:	c6 04 02 20          	mov    BYTE PTR [rdx+rax*1],0x20
  4021d8:	eb ca                	jmp    4021a4 <format_string_loop.constprop.0+0x8b4>
  4021da:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  4021de:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  4021e2:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  4021e6:	e9 dd fd ff ff       	jmp    401fc8 <format_string_loop.constprop.0+0x6d8>
  4021eb:	45 84 c9             	test   r9b,r9b
  4021ee:	0f 84 52 04 00 00    	je     402646 <format_string_loop.constprop.0+0xd56>
  4021f4:	41 8d 7a ff          	lea    edi,[r10-0x1]
  4021f8:	e9 c7 fa ff ff       	jmp    401cc4 <format_string_loop.constprop.0+0x3d4>
  4021fd:	89 d1                	mov    ecx,edx
  4021ff:	83 c2 08             	add    edx,0x8
  402202:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  402206:	41 89 17             	mov    DWORD PTR [r15],edx
  402209:	e9 16 fc ff ff       	jmp    401e24 <format_string_loop.constprop.0+0x534>
  40220e:	f6 c5 02             	test   ch,0x2
  402211:	0f 85 f3 00 00 00    	jne    40230a <format_string_loop.constprop.0+0xa1a>
  402217:	80 e5 04             	and    ch,0x4
  40221a:	0f 85 ea 00 00 00    	jne    40230a <format_string_loop.constprop.0+0xa1a>
  402220:	83 fa 2f             	cmp    edx,0x2f
  402223:	0f 87 ba 03 00 00    	ja     4025e3 <format_string_loop.constprop.0+0xcf3>
  402229:	89 d1                	mov    ecx,edx
  40222b:	83 c2 08             	add    edx,0x8
  40222e:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  402232:	41 89 17             	mov    DWORD PTR [r15],edx
  402235:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  402238:	89 32                	mov    DWORD PTR [rdx],esi
  40223a:	e9 21 f8 ff ff       	jmp    401a60 <format_string_loop.constprop.0+0x170>
  40223f:	83 fe 2f             	cmp    esi,0x2f
  402242:	0f 87 b9 02 00 00    	ja     402501 <format_string_loop.constprop.0+0xc11>
  402248:	89 f7                	mov    edi,esi
  40224a:	83 c6 08             	add    esi,0x8
  40224d:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  402251:	41 89 37             	mov    DWORD PTR [r15],esi
  402254:	48 83 ec 08          	sub    rsp,0x8
  402258:	41 89 d1             	mov    r9d,edx
  40225b:	44 89 d9             	mov    ecx,r11d
  40225e:	31 d2                	xor    edx,edx
  402260:	41 50                	push   r8
  402262:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
  402265:	45 89 d0             	mov    r8d,r10d
  402268:	4c 89 e7             	mov    rdi,r12
  40226b:	e8 c0 e6 ff ff       	call   400930 <print_integer>
  402270:	41 58                	pop    r8
  402272:	41 59                	pop    r9
  402274:	e9 e7 f7 ff ff       	jmp    401a60 <format_string_loop.constprop.0+0x170>
  402279:	83 fe 2f             	cmp    esi,0x2f
  40227c:	0f 87 6e 02 00 00    	ja     4024f0 <format_string_loop.constprop.0+0xc00>
  402282:	89 f7                	mov    edi,esi
  402284:	83 c6 08             	add    esi,0x8
  402287:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  40228b:	41 89 37             	mov    DWORD PTR [r15],esi
  40228e:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
  402291:	41 89 d1             	mov    r9d,edx
  402294:	45 89 d0             	mov    r8d,r10d
  402297:	4c 89 e7             	mov    rdi,r12
  40229a:	48 89 f5             	mov    rbp,rsi
  40229d:	48 f7 dd             	neg    rbp
  4022a0:	48 0f 48 ee          	cmovs  rbp,rsi
  4022a4:	48 83 ec 08          	sub    rsp,0x8
  4022a8:	48 c1 ee 3f          	shr    rsi,0x3f
  4022ac:	51                   	push   rcx
  4022ad:	48 89 f2             	mov    rdx,rsi
  4022b0:	44 89 d9             	mov    ecx,r11d
  4022b3:	48 89 ee             	mov    rsi,rbp
  4022b6:	e8 75 e6 ff ff       	call   400930 <print_integer>
  4022bb:	5d                   	pop    rbp
  4022bc:	41 5e                	pop    r14
  4022be:	e9 9d f7 ff ff       	jmp    401a60 <format_string_loop.constprop.0+0x170>
  4022c3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4022c8:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  4022cd:	bf 20 00 00 00       	mov    edi,0x20
  4022d2:	ff d1                	call   rcx
  4022d4:	8d 45 01             	lea    eax,[rbp+0x1]
  4022d7:	41 39 ee             	cmp    r14d,ebp
  4022da:	0f 84 80 f7 ff ff    	je     401a60 <format_string_loop.constprop.0+0x170>
  4022e0:	89 c5                	mov    ebp,eax
  4022e2:	41 8b 44 24 18       	mov    eax,DWORD PTR [r12+0x18]
  4022e7:	8d 48 01             	lea    ecx,[rax+0x1]
  4022ea:	41 89 4c 24 18       	mov    DWORD PTR [r12+0x18],ecx
  4022ef:	41 3b 44 24 1c       	cmp    eax,DWORD PTR [r12+0x1c]
  4022f4:	73 de                	jae    4022d4 <format_string_loop.constprop.0+0x9e4>
  4022f6:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  4022fa:	48 85 c9             	test   rcx,rcx
  4022fd:	75 c9                	jne    4022c8 <format_string_loop.constprop.0+0x9d8>
  4022ff:	49 8b 54 24 10       	mov    rdx,QWORD PTR [r12+0x10]
  402304:	c6 04 02 20          	mov    BYTE PTR [rdx+rax*1],0x20
  402308:	eb ca                	jmp    4022d4 <format_string_loop.constprop.0+0x9e4>
  40230a:	83 fa 2f             	cmp    edx,0x2f
  40230d:	0f 87 6d 02 00 00    	ja     402580 <format_string_loop.constprop.0+0xc90>
  402313:	89 d1                	mov    ecx,edx
  402315:	83 c2 08             	add    edx,0x8
  402318:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  40231c:	41 89 17             	mov    DWORD PTR [r15],edx
  40231f:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  402322:	89 f0                	mov    eax,esi
  402324:	48 89 02             	mov    QWORD PTR [rdx],rax
  402327:	e9 34 f7 ff ff       	jmp    401a60 <format_string_loop.constprop.0+0x170>
  40232c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402330:	49 8b 7c 24 10       	mov    rdi,QWORD PTR [r12+0x10]
  402335:	40 88 34 07          	mov    BYTE PTR [rdi+rax*1],sil
  402339:	e9 3e fa ff ff       	jmp    401d7c <format_string_loop.constprop.0+0x48c>
  40233e:	83 fa 01             	cmp    edx,0x1
  402341:	0f 86 0c 03 00 00    	jbe    402653 <format_string_loop.constprop.0+0xd63>
  402347:	8d 42 01             	lea    eax,[rdx+0x1]
  40234a:	48 89 5c 24 10       	mov    QWORD PTR [rsp+0x10],rbx
  40234f:	41 be 02 00 00 00    	mov    r14d,0x2
  402355:	89 d3                	mov    ebx,edx
  402357:	89 44 24 08          	mov    DWORD PTR [rsp+0x8],eax
  40235b:	eb 32                	jmp    40238f <format_string_loop.constprop.0+0xa9f>
  40235d:	0f 1f 00             	nop    DWORD PTR [rax]
  402360:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
  402364:	48 85 c0             	test   rax,rax
  402367:	0f 84 8d 00 00 00    	je     4023fa <format_string_loop.constprop.0+0xb0a>
  40236d:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  402372:	bf 20 00 00 00       	mov    edi,0x20
  402377:	ff d0                	call   rax
  402379:	41 8b 74 24 18       	mov    esi,DWORD PTR [r12+0x18]
  40237e:	41 8b 7c 24 1c       	mov    edi,DWORD PTR [r12+0x1c]
  402383:	41 8d 46 01          	lea    eax,[r14+0x1]
  402387:	44 39 f3             	cmp    ebx,r14d
  40238a:	74 1a                	je     4023a6 <format_string_loop.constprop.0+0xab6>
  40238c:	41 89 c6             	mov    r14d,eax
  40238f:	8d 46 01             	lea    eax,[rsi+0x1]
  402392:	41 89 44 24 18       	mov    DWORD PTR [r12+0x18],eax
  402397:	39 fe                	cmp    esi,edi
  402399:	72 c5                	jb     402360 <format_string_loop.constprop.0+0xa70>
  40239b:	89 c6                	mov    esi,eax
  40239d:	41 8d 46 01          	lea    eax,[r14+0x1]
  4023a1:	44 39 f3             	cmp    ebx,r14d
  4023a4:	75 e6                	jne    40238c <format_string_loop.constprop.0+0xa9c>
  4023a6:	89 da                	mov    edx,ebx
  4023a8:	48 8b 5c 24 10       	mov    rbx,QWORD PTR [rsp+0x10]
  4023ad:	41 8b 0f             	mov    ecx,DWORD PTR [r15]
  4023b0:	83 f9 2f             	cmp    ecx,0x2f
  4023b3:	0f 86 59 01 00 00    	jbe    402512 <format_string_loop.constprop.0+0xc22>
  4023b9:	4d 8b 47 08          	mov    r8,QWORD PTR [r15+0x8]
  4023bd:	49 8d 48 08          	lea    rcx,[r8+0x8]
  4023c1:	49 89 4f 08          	mov    QWORD PTR [r15+0x8],rcx
  4023c5:	41 8b 08             	mov    ecx,DWORD PTR [r8]
  4023c8:	44 8d 46 01          	lea    r8d,[rsi+0x1]
  4023cc:	45 89 44 24 18       	mov    DWORD PTR [r12+0x18],r8d
  4023d1:	39 fe                	cmp    esi,edi
  4023d3:	0f 83 87 f6 ff ff    	jae    401a60 <format_string_loop.constprop.0+0x170>
  4023d9:	41 89 c8             	mov    r8d,ecx
  4023dc:	0f be f9             	movsx  edi,cl
  4023df:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  4023e3:	48 85 c9             	test   rcx,rcx
  4023e6:	0f 85 a0 fa ff ff    	jne    401e8c <format_string_loop.constprop.0+0x59c>
  4023ec:	49 8b 4c 24 10       	mov    rcx,QWORD PTR [r12+0x10]
  4023f1:	44 88 04 31          	mov    BYTE PTR [rcx+rsi*1],r8b
  4023f5:	e9 a1 fa ff ff       	jmp    401e9b <format_string_loop.constprop.0+0x5ab>
  4023fa:	49 8b 44 24 10       	mov    rax,QWORD PTR [r12+0x10]
  4023ff:	c6 04 30 20          	mov    BYTE PTR [rax+rsi*1],0x20
  402403:	41 8b 74 24 18       	mov    esi,DWORD PTR [r12+0x18]
  402408:	41 8b 7c 24 1c       	mov    edi,DWORD PTR [r12+0x1c]
  40240d:	e9 71 ff ff ff       	jmp    402383 <format_string_loop.constprop.0+0xa93>
  402412:	49 8b 4c 24 10       	mov    rcx,QWORD PTR [r12+0x10]
  402417:	c6 04 11 25          	mov    BYTE PTR [rcx+rdx*1],0x25
  40241b:	e9 40 f6 ff ff       	jmp    401a60 <format_string_loop.constprop.0+0x170>
  402420:	49 8b 4c 24 10       	mov    rcx,QWORD PTR [r12+0x10]
  402425:	40 88 34 11          	mov    BYTE PTR [rcx+rdx*1],sil
  402429:	e9 32 f6 ff ff       	jmp    401a60 <format_string_loop.constprop.0+0x170>
  40242e:	44 8d 5f 01          	lea    r11d,[rdi+0x1]
  402432:	39 fa                	cmp    edx,edi
  402434:	0f 86 02 02 00 00    	jbe    40263c <format_string_loop.constprop.0+0xd4c>
  40243a:	8d 42 01             	lea    eax,[rdx+0x1]
  40243d:	48 89 6c 24 08       	mov    QWORD PTR [rsp+0x8],rbp
  402442:	89 d5                	mov    ebp,edx
  402444:	48 89 5c 24 28       	mov    QWORD PTR [rsp+0x28],rbx
  402449:	44 89 db             	mov    ebx,r11d
  40244c:	89 44 24 10          	mov    DWORD PTR [rsp+0x10],eax
  402450:	44 89 54 24 20       	mov    DWORD PTR [rsp+0x20],r10d
  402455:	eb 1f                	jmp    402476 <format_string_loop.constprop.0+0xb86>
  402457:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40245e:	00 00 
  402460:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  402465:	bf 20 00 00 00       	mov    edi,0x20
  40246a:	41 ff d0             	call   r8
  40246d:	8d 4b 01             	lea    ecx,[rbx+0x1]
  402470:	39 dd                	cmp    ebp,ebx
  402472:	74 2f                	je     4024a3 <format_string_loop.constprop.0+0xbb3>
  402474:	89 cb                	mov    ebx,ecx
  402476:	41 8b 4c 24 18       	mov    ecx,DWORD PTR [r12+0x18]
  40247b:	8d 71 01             	lea    esi,[rcx+0x1]
  40247e:	41 89 74 24 18       	mov    DWORD PTR [r12+0x18],esi
  402483:	41 3b 4c 24 1c       	cmp    ecx,DWORD PTR [r12+0x1c]
  402488:	73 e3                	jae    40246d <format_string_loop.constprop.0+0xb7d>
  40248a:	4d 8b 04 24          	mov    r8,QWORD PTR [r12]
  40248e:	4d 85 c0             	test   r8,r8
  402491:	75 cd                	jne    402460 <format_string_loop.constprop.0+0xb70>
  402493:	49 8b 74 24 10       	mov    rsi,QWORD PTR [r12+0x10]
  402498:	c6 04 0e 20          	mov    BYTE PTR [rsi+rcx*1],0x20
  40249c:	8d 4b 01             	lea    ecx,[rbx+0x1]
  40249f:	39 dd                	cmp    ebp,ebx
  4024a1:	75 d1                	jne    402474 <format_string_loop.constprop.0+0xb84>
  4024a3:	89 ea                	mov    edx,ebp
  4024a5:	48 8b 6c 24 08       	mov    rbp,QWORD PTR [rsp+0x8]
  4024aa:	44 8b 54 24 20       	mov    r10d,DWORD PTR [rsp+0x20]
  4024af:	48 8b 5c 24 28       	mov    rbx,QWORD PTR [rsp+0x28]
  4024b4:	44 0f b6 4d 00       	movzx  r9d,BYTE PTR [rbp+0x0]
  4024b9:	44 89 ce             	mov    esi,r9d
  4024bc:	45 84 c9             	test   r9b,r9b
  4024bf:	0f 84 9b f5 ff ff    	je     401a60 <format_string_loop.constprop.0+0x170>
  4024c5:	45 85 f6             	test   r14d,r14d
  4024c8:	0f 94 44 24 08       	sete   BYTE PTR [rsp+0x8]
  4024cd:	0f b6 44 24 08       	movzx  eax,BYTE PTR [rsp+0x8]
  4024d2:	45 85 d2             	test   r10d,r10d
  4024d5:	0f 85 57 f8 ff ff    	jne    401d32 <format_string_loop.constprop.0+0x442>
  4024db:	84 c0                	test   al,al
  4024dd:	0f 85 4f f8 ff ff    	jne    401d32 <format_string_loop.constprop.0+0x442>
  4024e3:	e9 78 f5 ff ff       	jmp    401a60 <format_string_loop.constprop.0+0x170>
  4024e8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4024ef:	00 
  4024f0:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  4024f4:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  4024f8:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  4024fc:	e9 8d fd ff ff       	jmp    40228e <format_string_loop.constprop.0+0x99e>
  402501:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  402505:	48 8d 4f 08          	lea    rcx,[rdi+0x8]
  402509:	49 89 4f 08          	mov    QWORD PTR [r15+0x8],rcx
  40250d:	e9 42 fd ff ff       	jmp    402254 <format_string_loop.constprop.0+0x964>
  402512:	41 89 c8             	mov    r8d,ecx
  402515:	83 c1 08             	add    ecx,0x8
  402518:	4d 03 47 10          	add    r8,QWORD PTR [r15+0x10]
  40251c:	41 89 0f             	mov    DWORD PTR [r15],ecx
  40251f:	e9 a1 fe ff ff       	jmp    4023c5 <format_string_loop.constprop.0+0xad5>
  402524:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  402528:	48 8d 51 08          	lea    rdx,[rcx+0x8]
  40252c:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  402530:	e9 50 fb ff ff       	jmp    402085 <format_string_loop.constprop.0+0x795>
  402535:	f6 c1 80             	test   cl,0x80
  402538:	0f 84 8d 00 00 00    	je     4025cb <format_string_loop.constprop.0+0xcdb>
  40253e:	83 fe 2f             	cmp    esi,0x2f
  402541:	0f 87 e4 00 00 00    	ja     40262b <format_string_loop.constprop.0+0xd3b>
  402547:	89 f7                	mov    edi,esi
  402549:	83 c6 08             	add    esi,0x8
  40254c:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  402550:	41 89 37             	mov    DWORD PTR [r15],esi
  402553:	0f bf 3f             	movsx  edi,WORD PTR [rdi]
  402556:	e9 0a f6 ff ff       	jmp    401b65 <format_string_loop.constprop.0+0x275>
  40255b:	81 e1 80 00 00 00    	and    ecx,0x80
  402561:	74 3f                	je     4025a2 <format_string_loop.constprop.0+0xcb2>
  402563:	83 fe 2f             	cmp    esi,0x2f
  402566:	0f 87 ae 00 00 00    	ja     40261a <format_string_loop.constprop.0+0xd2a>
  40256c:	89 f1                	mov    ecx,esi
  40256e:	83 c6 08             	add    esi,0x8
  402571:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  402575:	41 89 37             	mov    DWORD PTR [r15],esi
  402578:	0f b7 31             	movzx  esi,WORD PTR [rcx]
  40257b:	e9 49 fb ff ff       	jmp    4020c9 <format_string_loop.constprop.0+0x7d9>
  402580:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  402584:	48 8d 51 08          	lea    rdx,[rcx+0x8]
  402588:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  40258c:	e9 8e fd ff ff       	jmp    40231f <format_string_loop.constprop.0+0xa2f>
  402591:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  402595:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  402599:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  40259d:	e9 c0 f5 ff ff       	jmp    401b62 <format_string_loop.constprop.0+0x272>
  4025a2:	83 fe 2f             	cmp    esi,0x2f
  4025a5:	76 60                	jbe    402607 <format_string_loop.constprop.0+0xd17>
  4025a7:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  4025ab:	48 8d 71 08          	lea    rsi,[rcx+0x8]
  4025af:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  4025b3:	8b 31                	mov    esi,DWORD PTR [rcx]
  4025b5:	e9 0f fb ff ff       	jmp    4020c9 <format_string_loop.constprop.0+0x7d9>
  4025ba:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  4025be:	48 8d 71 08          	lea    rsi,[rcx+0x8]
  4025c2:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  4025c6:	e9 fb fa ff ff       	jmp    4020c6 <format_string_loop.constprop.0+0x7d6>
  4025cb:	83 fe 2f             	cmp    esi,0x2f
  4025ce:	76 24                	jbe    4025f4 <format_string_loop.constprop.0+0xd04>
  4025d0:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  4025d4:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  4025d8:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  4025dc:	8b 3f                	mov    edi,DWORD PTR [rdi]
  4025de:	e9 82 f5 ff ff       	jmp    401b65 <format_string_loop.constprop.0+0x275>
  4025e3:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  4025e7:	48 8d 51 08          	lea    rdx,[rcx+0x8]
  4025eb:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  4025ef:	e9 41 fc ff ff       	jmp    402235 <format_string_loop.constprop.0+0x945>
  4025f4:	89 f7                	mov    edi,esi
  4025f6:	83 c6 08             	add    esi,0x8
  4025f9:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  4025fd:	41 89 37             	mov    DWORD PTR [r15],esi
  402600:	8b 3f                	mov    edi,DWORD PTR [rdi]
  402602:	e9 5e f5 ff ff       	jmp    401b65 <format_string_loop.constprop.0+0x275>
  402607:	89 f1                	mov    ecx,esi
  402609:	83 c6 08             	add    esi,0x8
  40260c:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  402610:	41 89 37             	mov    DWORD PTR [r15],esi
  402613:	8b 31                	mov    esi,DWORD PTR [rcx]
  402615:	e9 af fa ff ff       	jmp    4020c9 <format_string_loop.constprop.0+0x7d9>
  40261a:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  40261e:	48 8d 71 08          	lea    rsi,[rcx+0x8]
  402622:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  402626:	e9 4d ff ff ff       	jmp    402578 <format_string_loop.constprop.0+0xc88>
  40262b:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  40262f:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  402633:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  402637:	e9 17 ff ff ff       	jmp    402553 <format_string_loop.constprop.0+0xc63>
  40263c:	44 89 5c 24 10       	mov    DWORD PTR [rsp+0x10],r11d
  402641:	e9 73 fe ff ff       	jmp    4024b9 <format_string_loop.constprop.0+0xbc9>
  402646:	c7 44 24 10 00 00 00 	mov    DWORD PTR [rsp+0x10],0x0
  40264d:	00 
  40264e:	e9 95 f6 ff ff       	jmp    401ce8 <format_string_loop.constprop.0+0x3f8>
  402653:	c7 44 24 08 02 00 00 	mov    DWORD PTR [rsp+0x8],0x2
  40265a:	00 
  40265b:	e9 4d fd ff ff       	jmp    4023ad <format_string_loop.constprop.0+0xabd>

Disassembly of section .text.vprintf:

0000000000402660 <vprintf>:
  402660:	f3 0f 1e fa          	endbr64 
  402664:	48 83 ec 28          	sub    rsp,0x28
  402668:	49 89 f8             	mov    r8,rdi
  40266b:	48 8d 05 6e e1 ff ff 	lea    rax,[rip+0xffffffffffffe16e]        # 4007e0 <putchar_wrapper>
  402672:	48 89 f2             	mov    rdx,rsi
  402675:	48 89 04 24          	mov    QWORD PTR [rsp],rax
  402679:	48 89 e7             	mov    rdi,rsp
  40267c:	4c 89 c6             	mov    rsi,r8
  40267f:	48 b8 00 00 00 00 ff 	movabs rax,0x7fffffff00000000
  402686:	ff ff 7f 
  402689:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
  402690:	00 00 
  402692:	48 c7 44 24 10 00 00 	mov    QWORD PTR [rsp+0x10],0x0
  402699:	00 00 
  40269b:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  4026a0:	e8 4b f2 ff ff       	call   4018f0 <format_string_loop.constprop.0>
  4026a5:	48 83 3c 24 00       	cmp    QWORD PTR [rsp],0x0
  4026aa:	74 0c                	je     4026b8 <vprintf+0x58>
  4026ac:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  4026b0:	48 83 c4 28          	add    rsp,0x28
  4026b4:	c3                   	ret    
  4026b5:	0f 1f 00             	nop    DWORD PTR [rax]
  4026b8:	8b 4c 24 1c          	mov    ecx,DWORD PTR [rsp+0x1c]
  4026bc:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  4026c0:	85 c9                	test   ecx,ecx
  4026c2:	74 ec                	je     4026b0 <vprintf+0x50>
  4026c4:	48 8b 74 24 10       	mov    rsi,QWORD PTR [rsp+0x10]
  4026c9:	48 85 f6             	test   rsi,rsi
  4026cc:	74 e2                	je     4026b0 <vprintf+0x50>
  4026ce:	39 c1                	cmp    ecx,eax
  4026d0:	8d 51 ff             	lea    edx,[rcx-0x1]
  4026d3:	48 0f 47 d0          	cmova  rdx,rax
  4026d7:	c6 04 16 00          	mov    BYTE PTR [rsi+rdx*1],0x0
  4026db:	48 83 c4 28          	add    rsp,0x28
  4026df:	c3                   	ret    

Disassembly of section .text.vsnprintf:

00000000004026e0 <vsnprintf>:
  4026e0:	f3 0f 1e fa          	endbr64 
  4026e4:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
  4026e9:	48 83 ec 28          	sub    rsp,0x28
  4026ed:	49 89 d0             	mov    r8,rdx
  4026f0:	48 89 ca             	mov    rdx,rcx
  4026f3:	48 39 c6             	cmp    rsi,rax
  4026f6:	48 89 7c 24 10       	mov    QWORD PTR [rsp+0x10],rdi
  4026fb:	48 0f 47 f0          	cmova  rsi,rax
  4026ff:	31 c0                	xor    eax,eax
  402701:	48 85 ff             	test   rdi,rdi
  402704:	48 89 e7             	mov    rdi,rsp
  402707:	48 c7 04 24 00 00 00 	mov    QWORD PTR [rsp],0x0
  40270e:	00 
  40270f:	48 0f 44 f0          	cmove  rsi,rax
  402713:	c7 44 24 18 00 00 00 	mov    DWORD PTR [rsp+0x18],0x0
  40271a:	00 
  40271b:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
  402722:	00 00 
  402724:	89 74 24 1c          	mov    DWORD PTR [rsp+0x1c],esi
  402728:	4c 89 c6             	mov    rsi,r8
  40272b:	e8 c0 f1 ff ff       	call   4018f0 <format_string_loop.constprop.0>
  402730:	48 83 3c 24 00       	cmp    QWORD PTR [rsp],0x0
  402735:	74 09                	je     402740 <vsnprintf+0x60>
  402737:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  40273b:	48 83 c4 28          	add    rsp,0x28
  40273f:	c3                   	ret    
  402740:	8b 4c 24 1c          	mov    ecx,DWORD PTR [rsp+0x1c]
  402744:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  402748:	85 c9                	test   ecx,ecx
  40274a:	74 ef                	je     40273b <vsnprintf+0x5b>
  40274c:	48 8b 74 24 10       	mov    rsi,QWORD PTR [rsp+0x10]
  402751:	48 85 f6             	test   rsi,rsi
  402754:	74 e5                	je     40273b <vsnprintf+0x5b>
  402756:	39 c1                	cmp    ecx,eax
  402758:	8d 51 ff             	lea    edx,[rcx-0x1]
  40275b:	48 0f 47 d0          	cmova  rdx,rax
  40275f:	c6 04 16 00          	mov    BYTE PTR [rsi+rdx*1],0x0
  402763:	48 83 c4 28          	add    rsp,0x28
  402767:	c3                   	ret    

Disassembly of section .text.vsprintf:

0000000000402770 <vsprintf>:
  402770:	f3 0f 1e fa          	endbr64 
  402774:	48 89 d1             	mov    rcx,rdx
  402777:	48 89 f2             	mov    rdx,rsi
  40277a:	be ff ff ff 7f       	mov    esi,0x7fffffff
  40277f:	e9 5c ff ff ff       	jmp    4026e0 <vsnprintf>

Disassembly of section .text.vfctprintf:

0000000000402790 <vfctprintf>:
  402790:	f3 0f 1e fa          	endbr64 
  402794:	48 83 ec 28          	sub    rsp,0x28
  402798:	49 89 f0             	mov    r8,rsi
  40279b:	48 89 d6             	mov    rsi,rdx
  40279e:	48 b8 00 00 00 00 ff 	movabs rax,0x7fffffff00000000
  4027a5:	ff ff 7f 
  4027a8:	48 89 3c 24          	mov    QWORD PTR [rsp],rdi
  4027ac:	48 89 ca             	mov    rdx,rcx
  4027af:	48 89 e7             	mov    rdi,rsp
  4027b2:	4c 89 44 24 08       	mov    QWORD PTR [rsp+0x8],r8
  4027b7:	48 c7 44 24 10 00 00 	mov    QWORD PTR [rsp+0x10],0x0
  4027be:	00 00 
  4027c0:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  4027c5:	e8 26 f1 ff ff       	call   4018f0 <format_string_loop.constprop.0>
  4027ca:	48 83 3c 24 00       	cmp    QWORD PTR [rsp],0x0
  4027cf:	74 0f                	je     4027e0 <vfctprintf+0x50>
  4027d1:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  4027d5:	48 83 c4 28          	add    rsp,0x28
  4027d9:	c3                   	ret    
  4027da:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4027e0:	8b 4c 24 1c          	mov    ecx,DWORD PTR [rsp+0x1c]
  4027e4:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  4027e8:	85 c9                	test   ecx,ecx
  4027ea:	74 e9                	je     4027d5 <vfctprintf+0x45>
  4027ec:	48 8b 74 24 10       	mov    rsi,QWORD PTR [rsp+0x10]
  4027f1:	48 85 f6             	test   rsi,rsi
  4027f4:	74 df                	je     4027d5 <vfctprintf+0x45>
  4027f6:	39 c1                	cmp    ecx,eax
  4027f8:	8d 51 ff             	lea    edx,[rcx-0x1]
  4027fb:	48 0f 47 d0          	cmova  rdx,rax
  4027ff:	c6 04 16 00          	mov    BYTE PTR [rsi+rdx*1],0x0
  402803:	48 83 c4 28          	add    rsp,0x28
  402807:	c3                   	ret    

Disassembly of section .text.printf:

0000000000402810 <printf>:
  402810:	f3 0f 1e fa          	endbr64 
  402814:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  40281b:	48 89 74 24 28       	mov    QWORD PTR [rsp+0x28],rsi
  402820:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
  402825:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  40282a:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  40282f:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  402834:	84 c0                	test   al,al
  402836:	74 37                	je     40286f <printf+0x5f>
  402838:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  40283d:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  402842:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  402847:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  40284e:	00 
  40284f:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  402856:	00 
  402857:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  40285e:	00 
  40285f:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  402866:	00 
  402867:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  40286e:	00 
  40286f:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  402876:	00 
  402877:	48 8d 74 24 08       	lea    rsi,[rsp+0x8]
  40287c:	c7 44 24 08 08 00 00 	mov    DWORD PTR [rsp+0x8],0x8
  402883:	00 
  402884:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  402889:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  40288e:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  402895:	00 
  402896:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  40289b:	e8 c0 fd ff ff       	call   402660 <vprintf>
  4028a0:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  4028a7:	c3                   	ret    

Disassembly of section .text.sprintf:

00000000004028b0 <sprintf>:
  4028b0:	f3 0f 1e fa          	endbr64 
  4028b4:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  4028bb:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
  4028c0:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  4028c5:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  4028ca:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  4028cf:	84 c0                	test   al,al
  4028d1:	74 37                	je     40290a <sprintf+0x5a>
  4028d3:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  4028d8:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  4028dd:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  4028e2:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  4028e9:	00 
  4028ea:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  4028f1:	00 
  4028f2:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  4028f9:	00 
  4028fa:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  402901:	00 
  402902:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  402909:	00 
  40290a:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  402911:	00 
  402912:	48 8d 54 24 08       	lea    rdx,[rsp+0x8]
  402917:	c7 44 24 08 10 00 00 	mov    DWORD PTR [rsp+0x8],0x10
  40291e:	00 
  40291f:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  402924:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  402929:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  402930:	00 
  402931:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  402936:	e8 35 fe ff ff       	call   402770 <vsprintf>
  40293b:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  402942:	c3                   	ret    

Disassembly of section .text.snprintf:

0000000000402950 <snprintf>:
  402950:	f3 0f 1e fa          	endbr64 
  402954:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  40295b:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  402960:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  402965:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  40296a:	84 c0                	test   al,al
  40296c:	74 37                	je     4029a5 <snprintf+0x55>
  40296e:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  402973:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  402978:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  40297d:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  402984:	00 
  402985:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  40298c:	00 
  40298d:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  402994:	00 
  402995:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  40299c:	00 
  40299d:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  4029a4:	00 
  4029a5:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  4029ac:	00 
  4029ad:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
  4029b2:	c7 44 24 08 18 00 00 	mov    DWORD PTR [rsp+0x8],0x18
  4029b9:	00 
  4029ba:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  4029bf:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  4029c4:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  4029cb:	00 
  4029cc:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  4029d1:	e8 0a fd ff ff       	call   4026e0 <vsnprintf>
  4029d6:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  4029dd:	c3                   	ret    

Disassembly of section .text.fctprintf:

00000000004029e0 <fctprintf>:
  4029e0:	f3 0f 1e fa          	endbr64 
  4029e4:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  4029eb:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  4029f0:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  4029f5:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  4029fa:	84 c0                	test   al,al
  4029fc:	74 37                	je     402a35 <fctprintf+0x55>
  4029fe:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  402a03:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  402a08:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  402a0d:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  402a14:	00 
  402a15:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  402a1c:	00 
  402a1d:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  402a24:	00 
  402a25:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  402a2c:	00 
  402a2d:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  402a34:	00 
  402a35:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  402a3c:	00 
  402a3d:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
  402a42:	c7 44 24 08 18 00 00 	mov    DWORD PTR [rsp+0x8],0x18
  402a49:	00 
  402a4a:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  402a4f:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  402a54:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  402a5b:	00 
  402a5c:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  402a61:	e8 2a fd ff ff       	call   402790 <vfctprintf>
  402a66:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  402a6d:	c3                   	ret    

Disassembly of section .text.putchar:

0000000000402a70 <putchar>:
  402a70:	f3 0f 1e fa          	endbr64 
  402a74:	41 54                	push   r12
  402a76:	41 89 fc             	mov    r12d,edi
  402a79:	40 0f be ff          	movsx  edi,dil
  402a7d:	e8 0e 00 00 00       	call   402a90 <putchar_>
  402a82:	44 89 e0             	mov    eax,r12d
  402a85:	41 5c                	pop    r12
  402a87:	c3                   	ret    

Disassembly of section .text.putchar_:

0000000000402a90 <putchar_>:
  402a90:	f3 0f 1e fa          	endbr64 
  402a94:	48 83 ec 18          	sub    rsp,0x18
  402a98:	ba 01 00 00 00       	mov    edx,0x1
  402a9d:	31 c0                	xor    eax,eax
  402a9f:	40 88 7c 24 0c       	mov    BYTE PTR [rsp+0xc],dil
  402aa4:	48 8d 74 24 0c       	lea    rsi,[rsp+0xc]
  402aa9:	bf 01 00 00 00       	mov    edi,0x1
  402aae:	e8 7d d8 ff ff       	call   400330 <write>
  402ab3:	48 83 c4 18          	add    rsp,0x18
  402ab7:	c3                   	ret    
