
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
  400057:	48 8d 05 32 33 00 00 	lea    rax,[rip+0x3332]        # 403390 <b+0x4>
  40005e:	48 89 c7             	mov    rdi,rax
  400061:	e8 1a 04 00 00       	call   400480 <puts>
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
  400100:	e8 1b 04 00 00       	call   400520 <memset>
        int p = 0;
  400105:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        printf("shell:>");
  40010c:	48 8d 05 90 32 00 00 	lea    rax,[rip+0x3290]        # 4033a3 <b+0x17>
  400113:	48 89 c7             	mov    rdi,rax
  400116:	b8 00 00 00 00       	mov    eax,0x0
  40011b:	e8 10 27 00 00       	call   402830 <printf>
        // write(2, "shell:>", 7);
        gets(cmd);
  400120:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  400127:	48 89 c7             	mov    rdi,rax
  40012a:	b8 00 00 00 00       	mov    eax,0x0
  40012f:	e8 ac 03 00 00       	call   4004e0 <gets>
        //     if (cmd[p] == '\n') break;
        //     p++;
        //     if (p == 128) p = 0;
        // }
        // cmd[p] = '\0';
        puts(cmd);
  400134:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  40013b:	48 89 c7             	mov    rdi,rax
  40013e:	e8 3d 03 00 00       	call   400480 <puts>
        // write(2, cmd, p);
        if (strcmp(cmd, "version") == 0) { puts("Gamessis OS 1.0.\n"); }
  400143:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  40014a:	48 8d 15 5a 32 00 00 	lea    rdx,[rip+0x325a]        # 4033ab <b+0x1f>
  400151:	48 89 d6             	mov    rsi,rdx
  400154:	48 89 c7             	mov    rdi,rax
  400157:	e8 54 04 00 00       	call   4005b0 <strcmp>
  40015c:	85 c0                	test   eax,eax
  40015e:	75 14                	jne    400174 <main+0x139>
  400160:	48 8d 05 4c 32 00 00 	lea    rax,[rip+0x324c]        # 4033b3 <b+0x27>
  400167:	48 89 c7             	mov    rdi,rax
  40016a:	e8 11 03 00 00       	call   400480 <puts>
  40016f:	e9 78 ff ff ff       	jmp    4000ec <main+0xb1>
        else if (strcmp(cmd, "exit") == 0) {
  400174:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  40017b:	48 8d 15 43 32 00 00 	lea    rdx,[rip+0x3243]        # 4033c5 <b+0x39>
  400182:	48 89 d6             	mov    rsi,rdx
  400185:	48 89 c7             	mov    rdi,rax
  400188:	e8 23 04 00 00       	call   4005b0 <strcmp>
  40018d:	85 c0                	test   eax,eax
  40018f:	0f 84 b9 00 00 00    	je     40024e <main+0x213>
            break;
        }
        else {
            printf("trying to execute...\n");
  400195:	48 8d 05 2e 32 00 00 	lea    rax,[rip+0x322e]        # 4033ca <b+0x3e>
  40019c:	48 89 c7             	mov    rdi,rax
  40019f:	e8 dc 02 00 00       	call   400480 <puts>
            int pid = 0;
  4001a4:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
            if ((pid = fork()) == 0) {
  4001ab:	e8 60 02 00 00       	call   400410 <fork>
  4001b0:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  4001b3:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  4001b7:	75 54                	jne    40020d <main+0x1d2>
                printf("forked, ready to execve\n");
  4001b9:	48 8d 05 1f 32 00 00 	lea    rax,[rip+0x321f]        # 4033df <b+0x53>
  4001c0:	48 89 c7             	mov    rdi,rax
  4001c3:	e8 b8 02 00 00       	call   400480 <puts>
                if (execve(cmd, argv, environ) == -1) {
  4001c8:	48 8b 15 51 32 00 00 	mov    rdx,QWORD PTR [rip+0x3251]        # 403420 <environ>
  4001cf:	48 8b 8d 50 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xb0]
  4001d6:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  4001dd:	48 89 ce             	mov    rsi,rcx
  4001e0:	48 89 c7             	mov    rdi,rax
  4001e3:	e8 38 02 00 00       	call   400420 <execve>
  4001e8:	83 f8 ff             	cmp    eax,0xffffffff
  4001eb:	75 20                	jne    40020d <main+0x1d2>
                    printf("cannot find file:%s\n", cmd);
  4001ed:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  4001f4:	48 89 c6             	mov    rsi,rax
  4001f7:	48 8d 05 f9 31 00 00 	lea    rax,[rip+0x31f9]        # 4033f7 <b+0x6b>
  4001fe:	48 89 c7             	mov    rdi,rax
  400201:	b8 00 00 00 00       	mov    eax,0x0
  400206:	e8 25 26 00 00       	call   402830 <printf>
  40020b:	eb 42                	jmp    40024f <main+0x214>
                    break;
                }
            }
            printf("forked. pid=%d\n", pid);
  40020d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  400210:	89 c6                	mov    esi,eax
  400212:	48 8d 05 f3 31 00 00 	lea    rax,[rip+0x31f3]        # 40340c <b+0x80>
  400219:	48 89 c7             	mov    rdi,rax
  40021c:	b8 00 00 00 00       	mov    eax,0x0
  400221:	e8 0a 26 00 00       	call   402830 <printf>
            int loc = 0;
  400226:	c7 85 6c ff ff ff 00 	mov    DWORD PTR [rbp-0x94],0x0
  40022d:	00 00 00 

            waitpid(pid, &loc, 0);
  400230:	48 8d 8d 6c ff ff ff 	lea    rcx,[rbp-0x94]
  400237:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  40023a:	ba 00 00 00 00       	mov    edx,0x0
  40023f:	48 89 ce             	mov    rsi,rcx
  400242:	89 c7                	mov    edi,eax
  400244:	e8 e7 01 00 00       	call   400430 <waitpid>
    while (1) {
  400249:	e9 9e fe ff ff       	jmp    4000ec <main+0xb1>
            break;
  40024e:	90                   	nop
    }


    // do_syscall(SYSCAll_WRITE, 2, (int) "test exe running.\n", 0, 0, 0,0);

    return 0;
  40024f:	b8 00 00 00 00       	mov    eax,0x0
  400254:	c9                   	leave  
  400255:	c3                   	ret    
  400256:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40025d:	00 00 00 

0000000000400260 <reg_dev>:
  400260:	55                   	push   rbp
  400261:	48 89 e5             	mov    rbp,rsp
  400264:	b8 00 00 00 00       	mov    eax,0x0
  400269:	55                   	push   rbp
  40026a:	48 0f 05             	rex.W syscall 
  40026d:	5d                   	pop    rbp
  40026e:	c9                   	leave  
  40026f:	c3                   	ret    

0000000000400270 <dispose_dev>:
  400270:	55                   	push   rbp
  400271:	48 89 e5             	mov    rbp,rsp
  400274:	b8 01 00 00 00       	mov    eax,0x1
  400279:	55                   	push   rbp
  40027a:	48 0f 05             	rex.W syscall 
  40027d:	5d                   	pop    rbp
  40027e:	c9                   	leave  
  40027f:	c3                   	ret    

0000000000400280 <reg_drv>:
  400280:	55                   	push   rbp
  400281:	48 89 e5             	mov    rbp,rsp
  400284:	b8 02 00 00 00       	mov    eax,0x2
  400289:	55                   	push   rbp
  40028a:	48 0f 05             	rex.W syscall 
  40028d:	5d                   	pop    rbp
  40028e:	c9                   	leave  
  40028f:	c3                   	ret    

0000000000400290 <dispose_drv>:
  400290:	55                   	push   rbp
  400291:	48 89 e5             	mov    rbp,rsp
  400294:	b8 03 00 00 00       	mov    eax,0x3
  400299:	55                   	push   rbp
  40029a:	48 0f 05             	rex.W syscall 
  40029d:	5d                   	pop    rbp
  40029e:	c9                   	leave  
  40029f:	c3                   	ret    

00000000004002a0 <call_drvfunc>:
  4002a0:	55                   	push   rbp
  4002a1:	48 89 e5             	mov    rbp,rsp
  4002a4:	b8 04 00 00 00       	mov    eax,0x4
  4002a9:	55                   	push   rbp
  4002aa:	48 0f 05             	rex.W syscall 
  4002ad:	5d                   	pop    rbp
  4002ae:	c9                   	leave  
  4002af:	c3                   	ret    

00000000004002b0 <req_mem>:
  4002b0:	55                   	push   rbp
  4002b1:	48 89 e5             	mov    rbp,rsp
  4002b4:	b8 05 00 00 00       	mov    eax,0x5
  4002b9:	55                   	push   rbp
  4002ba:	48 0f 05             	rex.W syscall 
  4002bd:	5d                   	pop    rbp
  4002be:	c9                   	leave  
  4002bf:	c3                   	ret    

00000000004002c0 <free_mem>:
  4002c0:	55                   	push   rbp
  4002c1:	48 89 e5             	mov    rbp,rsp
  4002c4:	b8 06 00 00 00       	mov    eax,0x6
  4002c9:	55                   	push   rbp
  4002ca:	48 0f 05             	rex.W syscall 
  4002cd:	5d                   	pop    rbp
  4002ce:	c9                   	leave  
  4002cf:	c3                   	ret    

00000000004002d0 <reg_proc>:
  4002d0:	55                   	push   rbp
  4002d1:	48 89 e5             	mov    rbp,rsp
  4002d4:	b8 07 00 00 00       	mov    eax,0x7
  4002d9:	55                   	push   rbp
  4002da:	48 0f 05             	rex.W syscall 
  4002dd:	5d                   	pop    rbp
  4002de:	c9                   	leave  
  4002df:	c3                   	ret    

00000000004002e0 <del_proc>:
  4002e0:	55                   	push   rbp
  4002e1:	48 89 e5             	mov    rbp,rsp
  4002e4:	b8 08 00 00 00       	mov    eax,0x8
  4002e9:	55                   	push   rbp
  4002ea:	48 0f 05             	rex.W syscall 
  4002ed:	5d                   	pop    rbp
  4002ee:	c9                   	leave  
  4002ef:	c3                   	ret    

00000000004002f0 <get_proc_addr>:
  4002f0:	55                   	push   rbp
  4002f1:	48 89 e5             	mov    rbp,rsp
  4002f4:	b8 09 00 00 00       	mov    eax,0x9
  4002f9:	55                   	push   rbp
  4002fa:	48 0f 05             	rex.W syscall 
  4002fd:	5d                   	pop    rbp
  4002fe:	c9                   	leave  
  4002ff:	c3                   	ret    

0000000000400300 <chk_vm>:
  400300:	55                   	push   rbp
  400301:	48 89 e5             	mov    rbp,rsp
  400304:	b8 0a 00 00 00       	mov    eax,0xa
  400309:	55                   	push   rbp
  40030a:	48 0f 05             	rex.W syscall 
  40030d:	5d                   	pop    rbp
  40030e:	c9                   	leave  
  40030f:	c3                   	ret    

0000000000400310 <open>:
  400310:	55                   	push   rbp
  400311:	48 89 e5             	mov    rbp,rsp
  400314:	b8 0b 00 00 00       	mov    eax,0xb
  400319:	55                   	push   rbp
  40031a:	48 0f 05             	rex.W syscall 
  40031d:	5d                   	pop    rbp
  40031e:	c9                   	leave  
  40031f:	c3                   	ret    

0000000000400320 <close>:
  400320:	55                   	push   rbp
  400321:	48 89 e5             	mov    rbp,rsp
  400324:	b8 0c 00 00 00       	mov    eax,0xc
  400329:	55                   	push   rbp
  40032a:	48 0f 05             	rex.W syscall 
  40032d:	5d                   	pop    rbp
  40032e:	c9                   	leave  
  40032f:	c3                   	ret    

0000000000400330 <read>:
  400330:	55                   	push   rbp
  400331:	48 89 e5             	mov    rbp,rsp
  400334:	b8 0d 00 00 00       	mov    eax,0xd
  400339:	55                   	push   rbp
  40033a:	48 0f 05             	rex.W syscall 
  40033d:	5d                   	pop    rbp
  40033e:	c9                   	leave  
  40033f:	c3                   	ret    

0000000000400340 <write>:
  400340:	55                   	push   rbp
  400341:	48 89 e5             	mov    rbp,rsp
  400344:	b8 0e 00 00 00       	mov    eax,0xe
  400349:	55                   	push   rbp
  40034a:	48 0f 05             	rex.W syscall 
  40034d:	5d                   	pop    rbp
  40034e:	c9                   	leave  
  40034f:	c3                   	ret    

0000000000400350 <seek>:
  400350:	55                   	push   rbp
  400351:	48 89 e5             	mov    rbp,rsp
  400354:	b8 0f 00 00 00       	mov    eax,0xf
  400359:	55                   	push   rbp
  40035a:	48 0f 05             	rex.W syscall 
  40035d:	5d                   	pop    rbp
  40035e:	c9                   	leave  
  40035f:	c3                   	ret    

0000000000400360 <tell>:
  400360:	55                   	push   rbp
  400361:	48 89 e5             	mov    rbp,rsp
  400364:	b8 10 00 00 00       	mov    eax,0x10
  400369:	55                   	push   rbp
  40036a:	48 0f 05             	rex.W syscall 
  40036d:	5d                   	pop    rbp
  40036e:	c9                   	leave  
  40036f:	c3                   	ret    

0000000000400370 <reg_vol>:
  400370:	55                   	push   rbp
  400371:	48 89 e5             	mov    rbp,rsp
  400374:	b8 11 00 00 00       	mov    eax,0x11
  400379:	55                   	push   rbp
  40037a:	48 0f 05             	rex.W syscall 
  40037d:	5d                   	pop    rbp
  40037e:	c9                   	leave  
  40037f:	c3                   	ret    

0000000000400380 <free_vol>:
  400380:	55                   	push   rbp
  400381:	48 89 e5             	mov    rbp,rsp
  400384:	b8 12 00 00 00       	mov    eax,0x12
  400389:	55                   	push   rbp
  40038a:	48 0f 05             	rex.W syscall 
  40038d:	5d                   	pop    rbp
  40038e:	c9                   	leave  
  40038f:	c3                   	ret    

0000000000400390 <exec>:
  400390:	55                   	push   rbp
  400391:	48 89 e5             	mov    rbp,rsp
  400394:	b8 13 00 00 00       	mov    eax,0x13
  400399:	55                   	push   rbp
  40039a:	48 0f 05             	rex.W syscall 
  40039d:	5d                   	pop    rbp
  40039e:	c9                   	leave  
  40039f:	c3                   	ret    

00000000004003a0 <exit>:
  4003a0:	55                   	push   rbp
  4003a1:	48 89 e5             	mov    rbp,rsp
  4003a4:	b8 14 00 00 00       	mov    eax,0x14
  4003a9:	55                   	push   rbp
  4003aa:	48 0f 05             	rex.W syscall 
  4003ad:	5d                   	pop    rbp
  4003ae:	c9                   	leave  
  4003af:	c3                   	ret    

00000000004003b0 <call>:
  4003b0:	55                   	push   rbp
  4003b1:	48 89 e5             	mov    rbp,rsp
  4003b4:	b8 15 00 00 00       	mov    eax,0x15
  4003b9:	55                   	push   rbp
  4003ba:	48 0f 05             	rex.W syscall 
  4003bd:	5d                   	pop    rbp
  4003be:	c9                   	leave  
  4003bf:	c3                   	ret    

00000000004003c0 <mkfifo>:
  4003c0:	55                   	push   rbp
  4003c1:	48 89 e5             	mov    rbp,rsp
  4003c4:	b8 16 00 00 00       	mov    eax,0x16
  4003c9:	55                   	push   rbp
  4003ca:	48 0f 05             	rex.W syscall 
  4003cd:	5d                   	pop    rbp
  4003ce:	c9                   	leave  
  4003cf:	c3                   	ret    

00000000004003d0 <brk>:
  4003d0:	55                   	push   rbp
  4003d1:	48 89 e5             	mov    rbp,rsp
  4003d4:	b8 17 00 00 00       	mov    eax,0x17
  4003d9:	55                   	push   rbp
  4003da:	48 0f 05             	rex.W syscall 
  4003dd:	5d                   	pop    rbp
  4003de:	c9                   	leave  
  4003df:	c3                   	ret    

00000000004003e0 <free>:
  4003e0:	55                   	push   rbp
  4003e1:	48 89 e5             	mov    rbp,rsp
  4003e4:	b8 18 00 00 00       	mov    eax,0x18
  4003e9:	55                   	push   rbp
  4003ea:	48 0f 05             	rex.W syscall 
  4003ed:	5d                   	pop    rbp
  4003ee:	c9                   	leave  
  4003ef:	c3                   	ret    

00000000004003f0 <find_dev>:
  4003f0:	55                   	push   rbp
  4003f1:	48 89 e5             	mov    rbp,rsp
  4003f4:	b8 19 00 00 00       	mov    eax,0x19
  4003f9:	55                   	push   rbp
  4003fa:	48 0f 05             	rex.W syscall 
  4003fd:	5d                   	pop    rbp
  4003fe:	c9                   	leave  
  4003ff:	c3                   	ret    

0000000000400400 <operate_dev>:
  400400:	55                   	push   rbp
  400401:	48 89 e5             	mov    rbp,rsp
  400404:	b8 1a 00 00 00       	mov    eax,0x1a
  400409:	55                   	push   rbp
  40040a:	48 0f 05             	rex.W syscall 
  40040d:	5d                   	pop    rbp
  40040e:	c9                   	leave  
  40040f:	c3                   	ret    

0000000000400410 <fork>:
  400410:	55                   	push   rbp
  400411:	48 89 e5             	mov    rbp,rsp
  400414:	b8 1b 00 00 00       	mov    eax,0x1b
  400419:	55                   	push   rbp
  40041a:	48 0f 05             	rex.W syscall 
  40041d:	5d                   	pop    rbp
  40041e:	c9                   	leave  
  40041f:	c3                   	ret    

0000000000400420 <execve>:
  400420:	55                   	push   rbp
  400421:	48 89 e5             	mov    rbp,rsp
  400424:	b8 1c 00 00 00       	mov    eax,0x1c
  400429:	55                   	push   rbp
  40042a:	48 0f 05             	rex.W syscall 
  40042d:	5d                   	pop    rbp
  40042e:	c9                   	leave  
  40042f:	c3                   	ret    

0000000000400430 <waitpid>:
  400430:	55                   	push   rbp
  400431:	48 89 e5             	mov    rbp,rsp
  400434:	b8 1d 00 00 00       	mov    eax,0x1d
  400439:	55                   	push   rbp
  40043a:	48 0f 05             	rex.W syscall 
  40043d:	5d                   	pop    rbp
  40043e:	c9                   	leave  
  40043f:	c3                   	ret    

0000000000400440 <mmap>:
  400440:	55                   	push   rbp
  400441:	48 89 e5             	mov    rbp,rsp
  400444:	b8 1e 00 00 00       	mov    eax,0x1e
  400449:	55                   	push   rbp
  40044a:	48 0f 05             	rex.W syscall 
  40044d:	5d                   	pop    rbp
  40044e:	c9                   	leave  
  40044f:	c3                   	ret    

0000000000400450 <munmap>:
  400450:	55                   	push   rbp
  400451:	48 89 e5             	mov    rbp,rsp
  400454:	b8 1f 00 00 00       	mov    eax,0x1f
  400459:	55                   	push   rbp
  40045a:	48 0f 05             	rex.W syscall 
  40045d:	5d                   	pop    rbp
  40045e:	c9                   	leave  
  40045f:	c3                   	ret    

0000000000400460 <mknod>:
  400460:	55                   	push   rbp
  400461:	48 89 e5             	mov    rbp,rsp
  400464:	b8 21 00 00 00       	mov    eax,0x21
  400469:	55                   	push   rbp
  40046a:	48 0f 05             	rex.W syscall 
  40046d:	5d                   	pop    rbp
  40046e:	c9                   	leave  
  40046f:	c3                   	ret    

0000000000400470 <kb_readc>:
  400470:	55                   	push   rbp
  400471:	48 89 e5             	mov    rbp,rsp
  400474:	b8 64 00 00 00       	mov    eax,0x64
  400479:	55                   	push   rbp
  40047a:	48 0f 05             	rex.W syscall 
  40047d:	5d                   	pop    rbp
  40047e:	c9                   	leave  
  40047f:	c3                   	ret    

Disassembly of section .text.puts:

0000000000400480 <puts>:
  400480:	f3 0f 1e fa          	endbr64 
  400484:	41 54                	push   r12
  400486:	55                   	push   rbp
  400487:	48 89 fd             	mov    rbp,rdi
  40048a:	53                   	push   rbx
  40048b:	0f be 3f             	movsx  edi,BYTE PTR [rdi]
  40048e:	40 84 ff             	test   dil,dil
  400491:	74 35                	je     4004c8 <puts+0x48>
  400493:	31 db                	xor    ebx,ebx
  400495:	0f 1f 00             	nop    DWORD PTR [rax]
  400498:	e8 f3 25 00 00       	call   402a90 <putchar>
  40049d:	41 89 dc             	mov    r12d,ebx
  4004a0:	48 83 c3 01          	add    rbx,0x1
  4004a4:	0f be 7c 1d 00       	movsx  edi,BYTE PTR [rbp+rbx*1+0x0]
  4004a9:	40 84 ff             	test   dil,dil
  4004ac:	75 ea                	jne    400498 <puts+0x18>
  4004ae:	bf 0a 00 00 00       	mov    edi,0xa
  4004b3:	e8 d8 25 00 00       	call   402a90 <putchar>
  4004b8:	41 8d 44 24 02       	lea    eax,[r12+0x2]
  4004bd:	5b                   	pop    rbx
  4004be:	5d                   	pop    rbp
  4004bf:	41 5c                	pop    r12
  4004c1:	c3                   	ret    
  4004c2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4004c8:	5b                   	pop    rbx
  4004c9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  4004ce:	5d                   	pop    rbp
  4004cf:	41 5c                	pop    r12
  4004d1:	c3                   	ret    

Disassembly of section .text.gets:

00000000004004e0 <gets>:
  4004e0:	f3 0f 1e fa          	endbr64 
  4004e4:	41 54                	push   r12
  4004e6:	49 89 fc             	mov    r12,rdi
  4004e9:	eb 09                	jmp    4004f4 <gets+0x14>
  4004eb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4004f0:	49 83 c4 01          	add    r12,0x1
  4004f4:	31 c0                	xor    eax,eax
  4004f6:	ba 01 00 00 00       	mov    edx,0x1
  4004fb:	4c 89 e6             	mov    rsi,r12
  4004fe:	bf 01 00 00 00       	mov    edi,0x1
  400503:	e8 28 fe ff ff       	call   400330 <read>
  400508:	41 80 3c 24 0a       	cmp    BYTE PTR [r12],0xa
  40050d:	75 e1                	jne    4004f0 <gets+0x10>
  40050f:	4c 89 e0             	mov    rax,r12
  400512:	41 c6 04 24 00       	mov    BYTE PTR [r12],0x0
  400517:	41 5c                	pop    r12
  400519:	c3                   	ret    

Disassembly of section .text.memset:

0000000000400520 <memset>:
  400520:	f3 0f 1e fa          	endbr64 
  400524:	48 89 f8             	mov    rax,rdi
  400527:	48 85 d2             	test   rdx,rdx
  40052a:	74 77                	je     4005a3 <memset+0x83>
  40052c:	40 88 74 17 ff       	mov    BYTE PTR [rdi+rdx*1-0x1],sil
  400531:	40 88 37             	mov    BYTE PTR [rdi],sil
  400534:	48 83 fa 02          	cmp    rdx,0x2
  400538:	76 69                	jbe    4005a3 <memset+0x83>
  40053a:	40 88 74 17 fe       	mov    BYTE PTR [rdi+rdx*1-0x2],sil
  40053f:	40 88 77 01          	mov    BYTE PTR [rdi+0x1],sil
  400543:	40 88 74 17 fd       	mov    BYTE PTR [rdi+rdx*1-0x3],sil
  400548:	40 88 77 02          	mov    BYTE PTR [rdi+0x2],sil
  40054c:	48 83 fa 06          	cmp    rdx,0x6
  400550:	76 51                	jbe    4005a3 <memset+0x83>
  400552:	40 88 74 17 fc       	mov    BYTE PTR [rdi+rdx*1-0x4],sil
  400557:	40 88 77 03          	mov    BYTE PTR [rdi+0x3],sil
  40055b:	48 83 fa 08          	cmp    rdx,0x8
  40055f:	76 42                	jbe    4005a3 <memset+0x83>
  400561:	48 f7 df             	neg    rdi
  400564:	44 0f b6 c6          	movzx  r8d,sil
  400568:	c1 e6 18             	shl    esi,0x18
  40056b:	83 e7 03             	and    edi,0x3
  40056e:	45 89 c1             	mov    r9d,r8d
  400571:	48 8d 0c 38          	lea    rcx,[rax+rdi*1]
  400575:	48 29 fa             	sub    rdx,rdi
  400578:	44 89 c7             	mov    edi,r8d
  40057b:	41 c1 e1 10          	shl    r9d,0x10
  40057f:	c1 e7 08             	shl    edi,0x8
  400582:	48 83 e2 fc          	and    rdx,0xfffffffffffffffc
  400586:	44 09 cf             	or     edi,r9d
  400589:	48 01 ca             	add    rdx,rcx
  40058c:	44 09 c7             	or     edi,r8d
  40058f:	09 fe                	or     esi,edi
  400591:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  400598:	89 31                	mov    DWORD PTR [rcx],esi
  40059a:	48 83 c1 04          	add    rcx,0x4
  40059e:	48 39 ca             	cmp    rdx,rcx
  4005a1:	75 f5                	jne    400598 <memset+0x78>
  4005a3:	c3                   	ret    

Disassembly of section .text.strcmp:

00000000004005b0 <strcmp>:
  4005b0:	f3 0f 1e fa          	endbr64 
  4005b4:	48 39 f7             	cmp    rdi,rsi
  4005b7:	74 34                	je     4005ed <strcmp+0x3d>
  4005b9:	48 85 ff             	test   rdi,rdi
  4005bc:	74 38                	je     4005f6 <strcmp+0x46>
  4005be:	48 85 f6             	test   rsi,rsi
  4005c1:	74 33                	je     4005f6 <strcmp+0x46>
  4005c3:	0f b6 17             	movzx  edx,BYTE PTR [rdi]
  4005c6:	0f be 0e             	movsx  ecx,BYTE PTR [rsi]
  4005c9:	38 ca                	cmp    dl,cl
  4005cb:	75 23                	jne    4005f0 <strcmp+0x40>
  4005cd:	b8 01 00 00 00       	mov    eax,0x1
  4005d2:	eb 15                	jmp    4005e9 <strcmp+0x39>
  4005d4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  4005d8:	0f b6 14 07          	movzx  edx,BYTE PTR [rdi+rax*1]
  4005dc:	48 83 c0 01          	add    rax,0x1
  4005e0:	0f be 4c 06 ff       	movsx  ecx,BYTE PTR [rsi+rax*1-0x1]
  4005e5:	38 ca                	cmp    dl,cl
  4005e7:	75 07                	jne    4005f0 <strcmp+0x40>
  4005e9:	84 d2                	test   dl,dl
  4005eb:	75 eb                	jne    4005d8 <strcmp+0x28>
  4005ed:	31 c0                	xor    eax,eax
  4005ef:	c3                   	ret    
  4005f0:	0f be c2             	movsx  eax,dl
  4005f3:	29 c8                	sub    eax,ecx
  4005f5:	c3                   	ret    
  4005f6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  4005fb:	c3                   	ret    

Disassembly of section .text.__libc_init_array:

0000000000400600 <__libc_init_array>:
  400600:	f3 0f 1e fa          	endbr64 
  400604:	41 54                	push   r12
  400606:	49 c7 c4 00 00 00 00 	mov    r12,0x0
  40060d:	55                   	push   rbp
  40060e:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
  400615:	53                   	push   rbx
  400616:	4c 29 e5             	sub    rbp,r12
  400619:	48 c1 fd 03          	sar    rbp,0x3
  40061d:	74 16                	je     400635 <__libc_init_array+0x35>
  40061f:	31 db                	xor    ebx,ebx
  400621:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  400628:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
  40062c:	48 83 c3 01          	add    rbx,0x1
  400630:	48 39 dd             	cmp    rbp,rbx
  400633:	75 f3                	jne    400628 <__libc_init_array+0x28>
  400635:	49 c7 c4 00 00 00 00 	mov    r12,0x0
  40063c:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
  400643:	4c 29 e5             	sub    rbp,r12
  400646:	48 c1 fd 03          	sar    rbp,0x3
  40064a:	74 11                	je     40065d <__libc_init_array+0x5d>
  40064c:	31 db                	xor    ebx,ebx
  40064e:	66 90                	xchg   ax,ax
  400650:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
  400654:	48 83 c3 01          	add    rbx,0x1
  400658:	48 39 dd             	cmp    rbp,rbx
  40065b:	75 f3                	jne    400650 <__libc_init_array+0x50>
  40065d:	5b                   	pop    rbx
  40065e:	5d                   	pop    rbp
  40065f:	41 5c                	pop    r12
  400661:	c3                   	ret    

Disassembly of section .text.__libc_fini_array:

0000000000400670 <__libc_fini_array>:
  400670:	f3 0f 1e fa          	endbr64 
  400674:	55                   	push   rbp
  400675:	53                   	push   rbx
  400676:	48 83 ec 08          	sub    rsp,0x8
  40067a:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
  400681:	48 c7 c3 00 00 00 00 	mov    rbx,0x0
  400688:	48 29 eb             	sub    rbx,rbp
  40068b:	48 c1 fb 03          	sar    rbx,0x3
  40068f:	74 14                	je     4006a5 <__libc_fini_array+0x35>
  400691:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  400698:	48 83 eb 01          	sub    rbx,0x1
  40069c:	ff 54 dd 00          	call   QWORD PTR [rbp+rbx*8+0x0]
  4006a0:	48 85 db             	test   rbx,rbx
  4006a3:	75 f3                	jne    400698 <__libc_fini_array+0x28>
  4006a5:	48 83 c4 08          	add    rsp,0x8
  4006a9:	5b                   	pop    rbx
  4006aa:	5d                   	pop    rbp
  4006ab:	c3                   	ret    

Disassembly of section .text.CRTStartup:

00000000004006b0 <CRTStartup>:
  4006b0:	f3 0f 1e fa          	endbr64 
  4006b4:	48 83 ec 08          	sub    rsp,0x8
  4006b8:	48 c7 c7 1c 34 40 00 	mov    rdi,0x40341c
  4006bf:	48 c7 c2 20 34 40 00 	mov    rdx,0x403420
  4006c6:	31 f6                	xor    esi,esi
  4006c8:	48 29 fa             	sub    rdx,rdi
  4006cb:	e8 50 fe ff ff       	call   400520 <memset>
  4006d0:	48 83 c4 08          	add    rsp,0x8
  4006d4:	e9 27 ff ff ff       	jmp    400600 <__libc_init_array>

Disassembly of section .text.entry:

00000000004006e0 <entry>:
  4006e0:	f3 0f 1e fa          	endbr64 
  4006e4:	41 54                	push   r12
  4006e6:	49 89 f4             	mov    r12,rsi
  4006e9:	55                   	push   rbp
  4006ea:	89 fd                	mov    ebp,edi
  4006ec:	53                   	push   rbx
  4006ed:	48 89 d3             	mov    rbx,rdx
  4006f0:	e8 bb ff ff ff       	call   4006b0 <CRTStartup>
  4006f5:	48 c7 c0 20 34 40 00 	mov    rax,0x403420
  4006fc:	4c 89 e6             	mov    rsi,r12
  4006ff:	89 ef                	mov    edi,ebp
  400701:	48 89 18             	mov    QWORD PTR [rax],rbx
  400704:	5b                   	pop    rbx
  400705:	5d                   	pop    rbp
  400706:	41 5c                	pop    r12
  400708:	e9 2e f9 ff ff       	jmp    40003b <main>

Disassembly of section .text.get_components:

0000000000400710 <get_components>:
  400710:	66 48 0f 7e c2       	movq   rdx,xmm0
  400715:	48 89 f8             	mov    rax,rdi
  400718:	48 c1 ea 3f          	shr    rdx,0x3f
  40071c:	89 d7                	mov    edi,edx
  40071e:	83 e7 01             	and    edi,0x1
  400721:	48 85 d2             	test   rdx,rdx
  400724:	74 08                	je     40072e <get_components+0x1e>
  400726:	66 0f 57 05 a2 2b 00 	xorpd  xmm0,XMMWORD PTR [rip+0x2ba2]        # 4032d0 <powers_of_10+0x90>
  40072d:	00 
  40072e:	f2 48 0f 2c c8       	cvttsd2si rcx,xmm0
  400733:	66 0f ef d2          	pxor   xmm2,xmm2
  400737:	66 0f 28 c8          	movapd xmm1,xmm0
  40073b:	89 f2                	mov    edx,esi
  40073d:	4c 8d 05 fc 2a 00 00 	lea    r8,[rip+0x2afc]        # 403240 <powers_of_10>
  400744:	f2 41 0f 10 1c d0    	movsd  xmm3,QWORD PTR [r8+rdx*8]
  40074a:	f2 48 0f 2a d1       	cvtsi2sd xmm2,rcx
  40074f:	f2 0f 5c ca          	subsd  xmm1,xmm2
  400753:	66 0f ef d2          	pxor   xmm2,xmm2
  400757:	f2 0f 59 cb          	mulsd  xmm1,xmm3
  40075b:	f2 48 0f 2c d1       	cvttsd2si rdx,xmm1
  400760:	f2 48 0f 2a d2       	cvtsi2sd xmm2,rdx
  400765:	f2 0f 5c ca          	subsd  xmm1,xmm2
  400769:	f2 0f 10 15 6f 2b 00 	movsd  xmm2,QWORD PTR [rip+0x2b6f]        # 4032e0 <powers_of_10+0xa0>
  400770:	00 
  400771:	66 0f 2f ca          	comisd xmm1,xmm2
  400775:	76 51                	jbe    4007c8 <get_components+0xb8>
  400777:	48 83 c2 01          	add    rdx,0x1
  40077b:	66 0f ef c9          	pxor   xmm1,xmm1
  40077f:	f2 48 0f 2a ca       	cvtsi2sd xmm1,rdx
  400784:	66 0f 2f cb          	comisd xmm1,xmm3
  400788:	73 56                	jae    4007e0 <get_components+0xd0>
  40078a:	85 f6                	test   esi,esi
  40078c:	75 27                	jne    4007b5 <get_components+0xa5>
  40078e:	66 0f ef c9          	pxor   xmm1,xmm1
  400792:	f2 48 0f 2a c9       	cvtsi2sd xmm1,rcx
  400797:	f2 0f 5c c1          	subsd  xmm0,xmm1
  40079b:	66 0f 2f d0          	comisd xmm2,xmm0
  40079f:	76 06                	jbe    4007a7 <get_components+0x97>
  4007a1:	66 0f 2f c2          	comisd xmm0,xmm2
  4007a5:	76 0e                	jbe    4007b5 <get_components+0xa5>
  4007a7:	48 89 ce             	mov    rsi,rcx
  4007aa:	83 e6 01             	and    esi,0x1
  4007ad:	48 83 fe 01          	cmp    rsi,0x1
  4007b1:	48 83 d9 ff          	sbb    rcx,0xffffffffffffffff
  4007b5:	48 89 08             	mov    QWORD PTR [rax],rcx
  4007b8:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
  4007bc:	40 88 78 10          	mov    BYTE PTR [rax+0x10],dil
  4007c0:	c3                   	ret    
  4007c1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4007c8:	66 0f 2e ca          	ucomisd xmm1,xmm2
  4007cc:	7a bc                	jp     40078a <get_components+0x7a>
  4007ce:	75 ba                	jne    40078a <get_components+0x7a>
  4007d0:	48 85 d2             	test   rdx,rdx
  4007d3:	75 1b                	jne    4007f0 <get_components+0xe0>
  4007d5:	48 83 c2 01          	add    rdx,0x1
  4007d9:	eb af                	jmp    40078a <get_components+0x7a>
  4007db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4007e0:	48 83 c1 01          	add    rcx,0x1
  4007e4:	31 d2                	xor    edx,edx
  4007e6:	eb a2                	jmp    40078a <get_components+0x7a>
  4007e8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4007ef:	00 
  4007f0:	f6 c2 01             	test   dl,0x1
  4007f3:	74 95                	je     40078a <get_components+0x7a>
  4007f5:	eb de                	jmp    4007d5 <get_components+0xc5>

Disassembly of section .text.putchar_wrapper:

0000000000400800 <putchar_wrapper>:
  400800:	f3 0f 1e fa          	endbr64 
  400804:	40 0f be ff          	movsx  edi,dil
  400808:	e9 a3 22 00 00       	jmp    402ab0 <putchar_>

Disassembly of section .text.out_rev_:

0000000000400810 <out_rev_>:
  400810:	41 57                	push   r15
  400812:	44 89 c0             	mov    eax,r8d
  400815:	41 56                	push   r14
  400817:	41 89 d6             	mov    r14d,edx
  40081a:	41 55                	push   r13
  40081c:	49 89 f5             	mov    r13,rsi
  40081f:	41 54                	push   r12
  400821:	41 89 cc             	mov    r12d,ecx
  400824:	55                   	push   rbp
  400825:	53                   	push   rbx
  400826:	48 89 fb             	mov    rbx,rdi
  400829:	48 83 ec 18          	sub    rsp,0x18
  40082d:	44 8b 7f 18          	mov    r15d,DWORD PTR [rdi+0x18]
  400831:	44 89 44 24 0c       	mov    DWORD PTR [rsp+0xc],r8d
  400836:	a8 03                	test   al,0x3
  400838:	75 16                	jne    400850 <out_rev_+0x40>
  40083a:	44 89 f8             	mov    eax,r15d
  40083d:	89 d5                	mov    ebp,edx
  40083f:	39 ca                	cmp    edx,ecx
  400841:	0f 82 93 00 00 00    	jb     4008da <out_rev_+0xca>
  400847:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40084e:	00 00 
  400850:	41 8d 6e ff          	lea    ebp,[r14-0x1]
  400854:	4c 01 ed             	add    rbp,r13
  400857:	45 85 f6             	test   r14d,r14d
  40085a:	75 16                	jne    400872 <out_rev_+0x62>
  40085c:	eb 42                	jmp    4008a0 <out_rev_+0x90>
  40085e:	66 90                	xchg   ax,ax
  400860:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  400864:	ff d2                	call   rdx
  400866:	48 8d 45 ff          	lea    rax,[rbp-0x1]
  40086a:	49 39 ed             	cmp    r13,rbp
  40086d:	74 31                	je     4008a0 <out_rev_+0x90>
  40086f:	48 89 c5             	mov    rbp,rax
  400872:	8b 43 18             	mov    eax,DWORD PTR [rbx+0x18]
  400875:	0f be 7d 00          	movsx  edi,BYTE PTR [rbp+0x0]
  400879:	8d 50 01             	lea    edx,[rax+0x1]
  40087c:	89 53 18             	mov    DWORD PTR [rbx+0x18],edx
  40087f:	3b 43 1c             	cmp    eax,DWORD PTR [rbx+0x1c]
  400882:	73 e2                	jae    400866 <out_rev_+0x56>
  400884:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
  400887:	48 85 d2             	test   rdx,rdx
  40088a:	75 d4                	jne    400860 <out_rev_+0x50>
  40088c:	48 8b 53 10          	mov    rdx,QWORD PTR [rbx+0x10]
  400890:	40 88 3c 02          	mov    BYTE PTR [rdx+rax*1],dil
  400894:	48 8d 45 ff          	lea    rax,[rbp-0x1]
  400898:	49 39 ed             	cmp    r13,rbp
  40089b:	75 d2                	jne    40086f <out_rev_+0x5f>
  40089d:	0f 1f 00             	nop    DWORD PTR [rax]
  4008a0:	f6 44 24 0c 02       	test   BYTE PTR [rsp+0xc],0x2
  4008a5:	75 61                	jne    400908 <out_rev_+0xf8>
  4008a7:	48 83 c4 18          	add    rsp,0x18
  4008ab:	5b                   	pop    rbx
  4008ac:	5d                   	pop    rbp
  4008ad:	41 5c                	pop    r12
  4008af:	41 5d                	pop    r13
  4008b1:	41 5e                	pop    r14
  4008b3:	41 5f                	pop    r15
  4008b5:	c3                   	ret    
  4008b6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4008bd:	00 00 00 
  4008c0:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  4008c4:	bf 20 00 00 00       	mov    edi,0x20
  4008c9:	ff d2                	call   rdx
  4008cb:	83 c5 01             	add    ebp,0x1
  4008ce:	41 39 ec             	cmp    r12d,ebp
  4008d1:	0f 84 79 ff ff ff    	je     400850 <out_rev_+0x40>
  4008d7:	8b 43 18             	mov    eax,DWORD PTR [rbx+0x18]
  4008da:	8d 50 01             	lea    edx,[rax+0x1]
  4008dd:	89 53 18             	mov    DWORD PTR [rbx+0x18],edx
  4008e0:	39 43 1c             	cmp    DWORD PTR [rbx+0x1c],eax
  4008e3:	76 e6                	jbe    4008cb <out_rev_+0xbb>
  4008e5:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
  4008e8:	48 85 d2             	test   rdx,rdx
  4008eb:	75 d3                	jne    4008c0 <out_rev_+0xb0>
  4008ed:	48 8b 53 10          	mov    rdx,QWORD PTR [rbx+0x10]
  4008f1:	c6 04 02 20          	mov    BYTE PTR [rdx+rax*1],0x20
  4008f5:	eb d4                	jmp    4008cb <out_rev_+0xbb>
  4008f7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4008fe:	00 00 
  400900:	48 8b 53 10          	mov    rdx,QWORD PTR [rbx+0x10]
  400904:	c6 04 02 20          	mov    BYTE PTR [rdx+rax*1],0x20
  400908:	8b 43 18             	mov    eax,DWORD PTR [rbx+0x18]
  40090b:	89 c2                	mov    edx,eax
  40090d:	44 29 fa             	sub    edx,r15d
  400910:	41 39 d4             	cmp    r12d,edx
  400913:	76 92                	jbe    4008a7 <out_rev_+0x97>
  400915:	8d 48 01             	lea    ecx,[rax+0x1]
  400918:	83 c2 01             	add    edx,0x1
  40091b:	89 4b 18             	mov    DWORD PTR [rbx+0x18],ecx
  40091e:	39 43 1c             	cmp    DWORD PTR [rbx+0x1c],eax
  400921:	76 1d                	jbe    400940 <out_rev_+0x130>
  400923:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
  400926:	48 85 d2             	test   rdx,rdx
  400929:	74 d5                	je     400900 <out_rev_+0xf0>
  40092b:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  40092f:	bf 20 00 00 00       	mov    edi,0x20
  400934:	ff d2                	call   rdx
  400936:	8b 43 18             	mov    eax,DWORD PTR [rbx+0x18]
  400939:	89 c2                	mov    edx,eax
  40093b:	44 29 fa             	sub    edx,r15d
  40093e:	eb d0                	jmp    400910 <out_rev_+0x100>
  400940:	89 c8                	mov    eax,ecx
  400942:	eb cc                	jmp    400910 <out_rev_+0x100>

Disassembly of section .text.print_integer:

0000000000400950 <print_integer>:
  400950:	41 57                	push   r15
  400952:	45 89 c3             	mov    r11d,r8d
  400955:	41 56                	push   r14
  400957:	41 55                	push   r13
  400959:	41 54                	push   r12
  40095b:	41 89 cc             	mov    r12d,ecx
  40095e:	55                   	push   rbp
  40095f:	48 89 fd             	mov    rbp,rdi
  400962:	53                   	push   rbx
  400963:	89 d3                	mov    ebx,edx
  400965:	48 83 ec 28          	sub    rsp,0x28
  400969:	44 8b 44 24 60       	mov    r8d,DWORD PTR [rsp+0x60]
  40096e:	48 85 f6             	test   rsi,rsi
  400971:	0f 85 39 01 00 00    	jne    400ab0 <print_integer+0x160>
  400977:	41 f7 c0 00 08 00 00 	test   r8d,0x800
  40097e:	0f 85 0c 02 00 00    	jne    400b90 <print_integer+0x240>
  400984:	c6 04 24 30          	mov    BYTE PTR [rsp],0x30
  400988:	41 83 e0 ef          	and    r8d,0xffffffef
  40098c:	bf 01 00 00 00       	mov    edi,0x1
  400991:	41 bd 01 00 00 00    	mov    r13d,0x1
  400997:	41 f6 c0 02          	test   r8b,0x2
  40099b:	0f 85 7f 01 00 00    	jne    400b20 <print_integer+0x1d0>
  4009a1:	44 89 c0             	mov    eax,r8d
  4009a4:	83 e0 01             	and    eax,0x1
  4009a7:	45 85 c9             	test   r9d,r9d
  4009aa:	0f 84 70 01 00 00    	je     400b20 <print_integer+0x1d0>
  4009b0:	85 c0                	test   eax,eax
  4009b2:	0f 84 68 01 00 00    	je     400b20 <print_integer+0x1d0>
  4009b8:	84 db                	test   bl,bl
  4009ba:	0f 85 70 02 00 00    	jne    400c30 <print_integer+0x2e0>
  4009c0:	41 f6 c0 0c          	test   r8b,0xc
  4009c4:	0f 85 66 02 00 00    	jne    400c30 <print_integer+0x2e0>
  4009ca:	45 39 cd             	cmp    r13d,r9d
  4009cd:	0f 83 4d 01 00 00    	jae    400b20 <print_integer+0x1d0>
  4009d3:	40 84 ff             	test   dil,dil
  4009d6:	0f 84 44 01 00 00    	je     400b20 <print_integer+0x1d0>
  4009dc:	48 89 e6             	mov    rsi,rsp
  4009df:	44 89 e8             	mov    eax,r13d
  4009e2:	44 89 ea             	mov    edx,r13d
  4009e5:	48 01 f0             	add    rax,rsi
  4009e8:	eb 0a                	jmp    4009f4 <print_integer+0xa4>
  4009ea:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4009f0:	84 c9                	test   cl,cl
  4009f2:	74 15                	je     400a09 <print_integer+0xb9>
  4009f4:	83 c2 01             	add    edx,0x1
  4009f7:	c6 00 30             	mov    BYTE PTR [rax],0x30
  4009fa:	83 fa 1f             	cmp    edx,0x1f
  4009fd:	0f 96 c1             	setbe  cl
  400a00:	48 83 c0 01          	add    rax,0x1
  400a04:	44 39 ca             	cmp    edx,r9d
  400a07:	72 e7                	jb     4009f0 <print_integer+0xa0>
  400a09:	41 39 d3             	cmp    r11d,edx
  400a0c:	76 26                	jbe    400a34 <print_integer+0xe4>
  400a0e:	84 c9                	test   cl,cl
  400a10:	74 22                	je     400a34 <print_integer+0xe4>
  400a12:	89 d0                	mov    eax,edx
  400a14:	48 01 f0             	add    rax,rsi
  400a17:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  400a1e:	00 00 
  400a20:	83 c2 01             	add    edx,0x1
  400a23:	c6 00 30             	mov    BYTE PTR [rax],0x30
  400a26:	48 83 c0 01          	add    rax,0x1
  400a2a:	41 39 d3             	cmp    r11d,edx
  400a2d:	76 05                	jbe    400a34 <print_integer+0xe4>
  400a2f:	83 fa 1f             	cmp    edx,0x1f
  400a32:	76 ec                	jbe    400a20 <print_integer+0xd0>
  400a34:	41 39 d5             	cmp    r13d,edx
  400a37:	40 0f 92 c7          	setb   dil
  400a3b:	41 80 fc 08          	cmp    r12b,0x8
  400a3f:	0f 94 c0             	sete   al
  400a42:	40 20 f8             	and    al,dil
  400a45:	74 06                	je     400a4d <print_integer+0xfd>
  400a47:	41 83 e0 ef          	and    r8d,0xffffffef
  400a4b:	89 c7                	mov    edi,eax
  400a4d:	41 f7 c0 10 20 00 00 	test   r8d,0x2010
  400a54:	0f 84 12 01 00 00    	je     400b6c <print_integer+0x21c>
  400a5a:	41 f7 c0 00 08 00 00 	test   r8d,0x800
  400a61:	0f 84 d9 00 00 00    	je     400b40 <print_integer+0x1f0>
  400a67:	83 fa 1f             	cmp    edx,0x1f
  400a6a:	0f 96 c0             	setbe  al
  400a6d:	41 80 fc 10          	cmp    r12b,0x10
  400a71:	0f 84 c9 01 00 00    	je     400c40 <print_integer+0x2f0>
  400a77:	41 80 fc 02          	cmp    r12b,0x2
  400a7b:	75 0d                	jne    400a8a <print_integer+0x13a>
  400a7d:	84 c0                	test   al,al
  400a7f:	74 09                	je     400a8a <print_integer+0x13a>
  400a81:	89 d0                	mov    eax,edx
  400a83:	83 c2 01             	add    edx,0x1
  400a86:	c6 04 04 62          	mov    BYTE PTR [rsp+rax*1],0x62
  400a8a:	83 fa 20             	cmp    edx,0x20
  400a8d:	0f 85 93 01 00 00    	jne    400c26 <print_integer+0x2d6>
  400a93:	48 89 ef             	mov    rdi,rbp
  400a96:	44 89 c9             	mov    ecx,r9d
  400a99:	e8 72 fd ff ff       	call   400810 <out_rev_>
  400a9e:	48 83 c4 28          	add    rsp,0x28
  400aa2:	5b                   	pop    rbx
  400aa3:	5d                   	pop    rbp
  400aa4:	41 5c                	pop    r12
  400aa6:	41 5d                	pop    r13
  400aa8:	41 5e                	pop    r14
  400aaa:	41 5f                	pop    r15
  400aac:	c3                   	ret    
  400aad:	0f 1f 00             	nop    DWORD PTR [rax]
  400ab0:	44 89 c0             	mov    eax,r8d
  400ab3:	44 0f b6 d1          	movzx  r10d,cl
  400ab7:	4c 8d 7c 24 ff       	lea    r15,[rsp-0x1]
  400abc:	b9 01 00 00 00       	mov    ecx,0x1
  400ac1:	83 e0 20             	and    eax,0x20
  400ac4:	83 f8 01             	cmp    eax,0x1
  400ac7:	45 19 f6             	sbb    r14d,r14d
  400aca:	41 83 e6 20          	and    r14d,0x20
  400ace:	41 83 c6 37          	add    r14d,0x37
  400ad2:	eb 07                	jmp    400adb <print_integer+0x18b>
  400ad4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  400ad8:	48 89 c6             	mov    rsi,rax
  400adb:	31 d2                	xor    edx,edx
  400add:	48 89 f0             	mov    rax,rsi
  400ae0:	49 f7 f2             	div    r10
  400ae3:	44 8d 6a 30          	lea    r13d,[rdx+0x30]
  400ae7:	48 83 fa 09          	cmp    rdx,0x9
  400aeb:	41 8d 3c 16          	lea    edi,[r14+rdx*1]
  400aef:	41 0f 46 fd          	cmovbe edi,r13d
  400af3:	83 f9 1f             	cmp    ecx,0x1f
  400af6:	41 89 cd             	mov    r13d,ecx
  400af9:	0f 96 c2             	setbe  dl
  400afc:	41 88 3c 0f          	mov    BYTE PTR [r15+rcx*1],dil
  400b00:	89 d7                	mov    edi,edx
  400b02:	48 83 c1 01          	add    rcx,0x1
  400b06:	4c 39 d6             	cmp    rsi,r10
  400b09:	0f 82 88 fe ff ff    	jb     400997 <print_integer+0x47>
  400b0f:	84 d2                	test   dl,dl
  400b11:	75 c5                	jne    400ad8 <print_integer+0x188>
  400b13:	41 f6 c0 02          	test   r8b,0x2
  400b17:	0f 84 84 fe ff ff    	je     4009a1 <print_integer+0x51>
  400b1d:	0f 1f 00             	nop    DWORD PTR [rax]
  400b20:	45 39 dd             	cmp    r13d,r11d
  400b23:	44 89 ea             	mov    edx,r13d
  400b26:	48 89 e6             	mov    rsi,rsp
  400b29:	0f 92 c0             	setb   al
  400b2c:	40 20 c7             	and    dil,al
  400b2f:	0f 85 dd fe ff ff    	jne    400a12 <print_integer+0xc2>
  400b35:	e9 13 ff ff ff       	jmp    400a4d <print_integer+0xfd>
  400b3a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  400b40:	85 d2                	test   edx,edx
  400b42:	0f 85 88 00 00 00    	jne    400bd0 <print_integer+0x280>
  400b48:	41 80 fc 10          	cmp    r12b,0x10
  400b4c:	0f 84 18 01 00 00    	je     400c6a <print_integer+0x31a>
  400b52:	41 80 fc 02          	cmp    r12b,0x2
  400b56:	0f 85 30 01 00 00    	jne    400c8c <print_integer+0x33c>
  400b5c:	c6 04 24 62          	mov    BYTE PTR [rsp],0x62
  400b60:	b8 01 00 00 00       	mov    eax,0x1
  400b65:	c6 04 04 30          	mov    BYTE PTR [rsp+rax*1],0x30
  400b69:	8d 50 01             	lea    edx,[rax+0x1]
  400b6c:	83 fa 20             	cmp    edx,0x20
  400b6f:	0f 84 1e ff ff ff    	je     400a93 <print_integer+0x143>
  400b75:	84 db                	test   bl,bl
  400b77:	74 37                	je     400bb0 <print_integer+0x260>
  400b79:	89 d0                	mov    eax,edx
  400b7b:	83 c2 01             	add    edx,0x1
  400b7e:	c6 04 04 2d          	mov    BYTE PTR [rsp+rax*1],0x2d
  400b82:	e9 0c ff ff ff       	jmp    400a93 <print_integer+0x143>
  400b87:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  400b8e:	00 00 
  400b90:	44 89 c0             	mov    eax,r8d
  400b93:	45 31 ed             	xor    r13d,r13d
  400b96:	41 83 e0 ef          	and    r8d,0xffffffef
  400b9a:	80 f9 10             	cmp    cl,0x10
  400b9d:	44 0f 45 c0          	cmovne r8d,eax
  400ba1:	bf 01 00 00 00       	mov    edi,0x1
  400ba6:	e9 ec fd ff ff       	jmp    400997 <print_integer+0x47>
  400bab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  400bb0:	41 f6 c0 04          	test   r8b,0x4
  400bb4:	75 62                	jne    400c18 <print_integer+0x2c8>
  400bb6:	41 f6 c0 08          	test   r8b,0x8
  400bba:	0f 84 d3 fe ff ff    	je     400a93 <print_integer+0x143>
  400bc0:	89 d0                	mov    eax,edx
  400bc2:	83 c2 01             	add    edx,0x1
  400bc5:	c6 04 04 20          	mov    BYTE PTR [rsp+rax*1],0x20
  400bc9:	e9 c5 fe ff ff       	jmp    400a93 <print_integer+0x143>
  400bce:	66 90                	xchg   ax,ax
  400bd0:	41 39 d3             	cmp    r11d,edx
  400bd3:	74 09                	je     400bde <print_integer+0x28e>
  400bd5:	44 39 ca             	cmp    edx,r9d
  400bd8:	0f 85 89 fe ff ff    	jne    400a67 <print_integer+0x117>
  400bde:	40 84 ff             	test   dil,dil
  400be1:	0f 84 80 fe ff ff    	je     400a67 <print_integer+0x117>
  400be7:	89 d0                	mov    eax,edx
  400be9:	83 e8 01             	sub    eax,0x1
  400bec:	0f 84 56 ff ff ff    	je     400b48 <print_integer+0x1f8>
  400bf2:	b9 04 00 01 00       	mov    ecx,0x10004
  400bf7:	4c 0f a3 e1          	bt     rcx,r12
  400bfb:	0f 83 a7 00 00 00    	jae    400ca8 <print_integer+0x358>
  400c01:	41 39 c5             	cmp    r13d,eax
  400c04:	0f 83 9e 00 00 00    	jae    400ca8 <print_integer+0x358>
  400c0a:	83 ea 02             	sub    edx,0x2
  400c0d:	e9 55 fe ff ff       	jmp    400a67 <print_integer+0x117>
  400c12:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  400c18:	89 d0                	mov    eax,edx
  400c1a:	83 c2 01             	add    edx,0x1
  400c1d:	c6 04 04 2b          	mov    BYTE PTR [rsp+rax*1],0x2b
  400c21:	e9 6d fe ff ff       	jmp    400a93 <print_integer+0x143>
  400c26:	89 d0                	mov    eax,edx
  400c28:	e9 38 ff ff ff       	jmp    400b65 <print_integer+0x215>
  400c2d:	0f 1f 00             	nop    DWORD PTR [rax]
  400c30:	41 83 e9 01          	sub    r9d,0x1
  400c34:	e9 91 fd ff ff       	jmp    4009ca <print_integer+0x7a>
  400c39:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  400c40:	44 89 c1             	mov    ecx,r8d
  400c43:	83 e1 20             	and    ecx,0x20
  400c46:	75 0c                	jne    400c54 <print_integer+0x304>
  400c48:	84 c0                	test   al,al
  400c4a:	75 4e                	jne    400c9a <print_integer+0x34a>
  400c4c:	85 c9                	test   ecx,ecx
  400c4e:	0f 84 36 fe ff ff    	je     400a8a <print_integer+0x13a>
  400c54:	84 c0                	test   al,al
  400c56:	0f 84 2e fe ff ff    	je     400a8a <print_integer+0x13a>
  400c5c:	89 d0                	mov    eax,edx
  400c5e:	83 c2 01             	add    edx,0x1
  400c61:	c6 04 04 58          	mov    BYTE PTR [rsp+rax*1],0x58
  400c65:	e9 20 fe ff ff       	jmp    400a8a <print_integer+0x13a>
  400c6a:	41 f6 c0 20          	test   r8b,0x20
  400c6e:	75 0e                	jne    400c7e <print_integer+0x32e>
  400c70:	c6 04 24 78          	mov    BYTE PTR [rsp],0x78
  400c74:	b8 01 00 00 00       	mov    eax,0x1
  400c79:	e9 e7 fe ff ff       	jmp    400b65 <print_integer+0x215>
  400c7e:	c6 04 24 58          	mov    BYTE PTR [rsp],0x58
  400c82:	b8 01 00 00 00       	mov    eax,0x1
  400c87:	e9 d9 fe ff ff       	jmp    400b65 <print_integer+0x215>
  400c8c:	c6 04 24 30          	mov    BYTE PTR [rsp],0x30
  400c90:	ba 01 00 00 00       	mov    edx,0x1
  400c95:	e9 db fe ff ff       	jmp    400b75 <print_integer+0x225>
  400c9a:	89 d0                	mov    eax,edx
  400c9c:	83 c2 01             	add    edx,0x1
  400c9f:	c6 04 04 78          	mov    BYTE PTR [rsp+rax*1],0x78
  400ca3:	e9 e2 fd ff ff       	jmp    400a8a <print_integer+0x13a>
  400ca8:	89 c2                	mov    edx,eax
  400caa:	e9 b8 fd ff ff       	jmp    400a67 <print_integer+0x117>

Disassembly of section .text.print_broken_up_decimal.isra.0:

0000000000400cb0 <print_broken_up_decimal.isra.0>:
  400cb0:	41 56                	push   r14
  400cb2:	49 89 ca             	mov    r10,rcx
  400cb5:	41 89 d3             	mov    r11d,edx
  400cb8:	41 55                	push   r13
  400cba:	45 89 c5             	mov    r13d,r8d
  400cbd:	41 54                	push   r12
  400cbf:	55                   	push   rbp
  400cc0:	53                   	push   rbx
  400cc1:	44 8b 44 24 30       	mov    r8d,DWORD PTR [rsp+0x30]
  400cc6:	48 8b 6c 24 38       	mov    rbp,QWORD PTR [rsp+0x38]
  400ccb:	8b 4c 24 40          	mov    ecx,DWORD PTR [rsp+0x40]
  400ccf:	45 85 ed             	test   r13d,r13d
  400cd2:	0f 84 90 00 00 00    	je     400d68 <print_broken_up_decimal.isra.0+0xb8>
  400cd8:	44 89 c0             	mov    eax,r8d
  400cdb:	25 10 10 00 00       	and    eax,0x1010
  400ce0:	3d 00 10 00 00       	cmp    eax,0x1000
  400ce5:	0f 84 05 02 00 00    	je     400ef0 <print_broken_up_decimal.isra.0+0x240>
  400ceb:	41 89 cc             	mov    r12d,ecx
  400cee:	89 cb                	mov    ebx,ecx
  400cf0:	42 8d 4c 29 ff       	lea    ecx,[rcx+r13*1-0x1]
  400cf5:	49 bd 67 66 66 66 66 	movabs r13,0x6666666666666667
  400cfc:	66 66 66 
  400cff:	49 01 ec             	add    r12,rbp
  400d02:	eb 43                	jmp    400d47 <print_broken_up_decimal.isra.0+0x97>
  400d04:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  400d08:	48 89 f0             	mov    rax,rsi
  400d0b:	41 89 ce             	mov    r14d,ecx
  400d0e:	49 83 c4 01          	add    r12,0x1
  400d12:	49 f7 ed             	imul   r13
  400d15:	48 89 f0             	mov    rax,rsi
  400d18:	41 29 de             	sub    r14d,ebx
  400d1b:	83 c3 01             	add    ebx,0x1
  400d1e:	48 c1 f8 3f          	sar    rax,0x3f
  400d22:	48 c1 fa 02          	sar    rdx,0x2
  400d26:	48 29 c2             	sub    rdx,rax
  400d29:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  400d2d:	48 01 c0             	add    rax,rax
  400d30:	48 29 c6             	sub    rsi,rax
  400d33:	83 c6 30             	add    esi,0x30
  400d36:	41 88 74 24 ff       	mov    BYTE PTR [r12-0x1],sil
  400d3b:	48 89 d6             	mov    rsi,rdx
  400d3e:	48 85 d2             	test   rdx,rdx
  400d41:	0f 84 f9 00 00 00    	je     400e40 <print_broken_up_decimal.isra.0+0x190>
  400d47:	83 fb 20             	cmp    ebx,0x20
  400d4a:	75 bc                	jne    400d08 <print_broken_up_decimal.isra.0+0x58>
  400d4c:	44 89 c0             	mov    eax,r8d
  400d4f:	83 e0 03             	and    eax,0x3
  400d52:	83 f8 01             	cmp    eax,0x1
  400d55:	0f 84 35 01 00 00    	je     400e90 <print_broken_up_decimal.isra.0+0x1e0>
  400d5b:	ba 20 00 00 00       	mov    edx,0x20
  400d60:	e9 7d 00 00 00       	jmp    400de2 <print_broken_up_decimal.isra.0+0x132>
  400d65:	0f 1f 00             	nop    DWORD PTR [rax]
  400d68:	41 f6 c0 10          	test   r8b,0x10
  400d6c:	0f 85 8e 00 00 00    	jne    400e00 <print_broken_up_decimal.isra.0+0x150>
  400d72:	48 bb 67 66 66 66 66 	movabs rbx,0x6666666666666667
  400d79:	66 66 66 
  400d7c:	89 ce                	mov    esi,ecx
  400d7e:	48 01 ee             	add    rsi,rbp
  400d81:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  400d88:	83 f9 20             	cmp    ecx,0x20
  400d8b:	74 bf                	je     400d4c <print_broken_up_decimal.isra.0+0x9c>
  400d8d:	48 89 f8             	mov    rax,rdi
  400d90:	83 c1 01             	add    ecx,0x1
  400d93:	48 83 c6 01          	add    rsi,0x1
  400d97:	48 f7 eb             	imul   rbx
  400d9a:	48 89 f8             	mov    rax,rdi
  400d9d:	48 c1 f8 3f          	sar    rax,0x3f
  400da1:	48 c1 fa 02          	sar    rdx,0x2
  400da5:	48 29 c2             	sub    rdx,rax
  400da8:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  400dac:	48 01 c0             	add    rax,rax
  400daf:	48 29 c7             	sub    rdi,rax
  400db2:	83 c7 30             	add    edi,0x30
  400db5:	40 88 7e ff          	mov    BYTE PTR [rsi-0x1],dil
  400db9:	48 89 d7             	mov    rdi,rdx
  400dbc:	48 85 d2             	test   rdx,rdx
  400dbf:	75 c7                	jne    400d88 <print_broken_up_decimal.isra.0+0xd8>
  400dc1:	44 89 c0             	mov    eax,r8d
  400dc4:	83 e0 03             	and    eax,0x3
  400dc7:	83 f8 01             	cmp    eax,0x1
  400dca:	0f 84 b8 01 00 00    	je     400f88 <print_broken_up_decimal.isra.0+0x2d8>
  400dd0:	83 f9 20             	cmp    ecx,0x20
  400dd3:	74 86                	je     400d5b <print_broken_up_decimal.isra.0+0xab>
  400dd5:	45 84 db             	test   r11b,r11b
  400dd8:	74 46                	je     400e20 <print_broken_up_decimal.isra.0+0x170>
  400dda:	c6 44 0d 00 2d       	mov    BYTE PTR [rbp+rcx*1+0x0],0x2d
  400ddf:	8d 51 01             	lea    edx,[rcx+0x1]
  400de2:	5b                   	pop    rbx
  400de3:	48 89 ee             	mov    rsi,rbp
  400de6:	44 89 c9             	mov    ecx,r9d
  400de9:	5d                   	pop    rbp
  400dea:	4c 89 d7             	mov    rdi,r10
  400ded:	41 5c                	pop    r12
  400def:	41 5d                	pop    r13
  400df1:	41 5e                	pop    r14
  400df3:	e9 18 fa ff ff       	jmp    400810 <out_rev_>
  400df8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  400dff:	00 
  400e00:	83 f9 20             	cmp    ecx,0x20
  400e03:	0f 84 43 ff ff ff    	je     400d4c <print_broken_up_decimal.isra.0+0x9c>
  400e09:	89 c8                	mov    eax,ecx
  400e0b:	83 c1 01             	add    ecx,0x1
  400e0e:	c6 44 05 00 2e       	mov    BYTE PTR [rbp+rax*1+0x0],0x2e
  400e13:	e9 5a ff ff ff       	jmp    400d72 <print_broken_up_decimal.isra.0+0xc2>
  400e18:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  400e1f:	00 
  400e20:	41 f6 c0 04          	test   r8b,0x4
  400e24:	0f 85 3e 01 00 00    	jne    400f68 <print_broken_up_decimal.isra.0+0x2b8>
  400e2a:	89 ca                	mov    edx,ecx
  400e2c:	41 f6 c0 08          	test   r8b,0x8
  400e30:	74 b0                	je     400de2 <print_broken_up_decimal.isra.0+0x132>
  400e32:	c6 44 0d 00 20       	mov    BYTE PTR [rbp+rcx*1+0x0],0x20
  400e37:	83 c2 01             	add    edx,0x1
  400e3a:	eb a6                	jmp    400de2 <print_broken_up_decimal.isra.0+0x132>
  400e3c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  400e40:	83 fb 1f             	cmp    ebx,0x1f
  400e43:	77 13                	ja     400e58 <print_broken_up_decimal.isra.0+0x1a8>
  400e45:	45 85 f6             	test   r14d,r14d
  400e48:	89 d8                	mov    eax,ebx
  400e4a:	0f 95 c2             	setne  dl
  400e4d:	48 01 e8             	add    rax,rbp
  400e50:	84 d2                	test   dl,dl
  400e52:	75 20                	jne    400e74 <print_broken_up_decimal.isra.0+0x1c4>
  400e54:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  400e58:	83 fb 20             	cmp    ebx,0x20
  400e5b:	0f 84 eb fe ff ff    	je     400d4c <print_broken_up_decimal.isra.0+0x9c>
  400e61:	c6 44 1d 00 2e       	mov    BYTE PTR [rbp+rbx*1+0x0],0x2e
  400e66:	8d 4b 01             	lea    ecx,[rbx+0x1]
  400e69:	e9 04 ff ff ff       	jmp    400d72 <print_broken_up_decimal.isra.0+0xc2>
  400e6e:	66 90                	xchg   ax,ax
  400e70:	39 ca                	cmp    edx,ecx
  400e72:	74 e4                	je     400e58 <print_broken_up_decimal.isra.0+0x1a8>
  400e74:	89 da                	mov    edx,ebx
  400e76:	83 c3 01             	add    ebx,0x1
  400e79:	c6 00 30             	mov    BYTE PTR [rax],0x30
  400e7c:	48 83 c0 01          	add    rax,0x1
  400e80:	83 fb 1f             	cmp    ebx,0x1f
  400e83:	76 eb                	jbe    400e70 <print_broken_up_decimal.isra.0+0x1c0>
  400e85:	eb d1                	jmp    400e58 <print_broken_up_decimal.isra.0+0x1a8>
  400e87:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  400e8e:	00 00 
  400e90:	45 85 c9             	test   r9d,r9d
  400e93:	0f 84 c2 fe ff ff    	je     400d5b <print_broken_up_decimal.isra.0+0xab>
  400e99:	31 d2                	xor    edx,edx
  400e9b:	b9 20 00 00 00       	mov    ecx,0x20
  400ea0:	45 84 db             	test   r11b,r11b
  400ea3:	0f 85 cf 00 00 00    	jne    400f78 <print_broken_up_decimal.isra.0+0x2c8>
  400ea9:	41 f6 c0 0c          	test   r8b,0xc
  400ead:	0f 85 c5 00 00 00    	jne    400f78 <print_broken_up_decimal.isra.0+0x2c8>
  400eb3:	44 39 c9             	cmp    ecx,r9d
  400eb6:	0f 83 14 ff ff ff    	jae    400dd0 <print_broken_up_decimal.isra.0+0x120>
  400ebc:	89 c8                	mov    eax,ecx
  400ebe:	48 01 e8             	add    rax,rbp
  400ec1:	84 d2                	test   dl,dl
  400ec3:	0f 84 07 ff ff ff    	je     400dd0 <print_broken_up_decimal.isra.0+0x120>
  400ec9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  400ed0:	83 c1 01             	add    ecx,0x1
  400ed3:	c6 00 30             	mov    BYTE PTR [rax],0x30
  400ed6:	48 83 c0 01          	add    rax,0x1
  400eda:	44 39 c9             	cmp    ecx,r9d
  400edd:	0f 83 ed fe ff ff    	jae    400dd0 <print_broken_up_decimal.isra.0+0x120>
  400ee3:	83 f9 1f             	cmp    ecx,0x1f
  400ee6:	76 e8                	jbe    400ed0 <print_broken_up_decimal.isra.0+0x220>
  400ee8:	e9 e3 fe ff ff       	jmp    400dd0 <print_broken_up_decimal.isra.0+0x120>
  400eed:	0f 1f 00             	nop    DWORD PTR [rax]
  400ef0:	48 85 f6             	test   rsi,rsi
  400ef3:	0f 8e 79 fe ff ff    	jle    400d72 <print_broken_up_decimal.isra.0+0xc2>
  400ef9:	48 bb cd cc cc cc cc 	movabs rbx,0xcccccccccccccccd
  400f00:	cc cc cc 
  400f03:	48 89 f0             	mov    rax,rsi
  400f06:	48 ba 98 99 99 99 99 	movabs rdx,0x1999999999999998
  400f0d:	99 99 19 
  400f10:	48 0f af c3          	imul   rax,rbx
  400f14:	48 01 d0             	add    rax,rdx
  400f17:	48 d1 c8             	ror    rax,1
  400f1a:	48 39 d0             	cmp    rax,rdx
  400f1d:	0f 87 c8 fd ff ff    	ja     400ceb <print_broken_up_decimal.isra.0+0x3b>
  400f23:	49 be 99 99 99 99 99 	movabs r14,0x1999999999999999
  400f2a:	99 99 19 
  400f2d:	0f 1f 00             	nop    DWORD PTR [rax]
  400f30:	48 89 f0             	mov    rax,rsi
  400f33:	49 89 f4             	mov    r12,rsi
  400f36:	41 83 ed 01          	sub    r13d,0x1
  400f3a:	48 f7 e3             	mul    rbx
  400f3d:	48 89 d6             	mov    rsi,rdx
  400f40:	48 c1 ee 03          	shr    rsi,0x3
  400f44:	48 89 f0             	mov    rax,rsi
  400f47:	48 0f af c3          	imul   rax,rbx
  400f4b:	48 d1 c8             	ror    rax,1
  400f4e:	4c 39 f0             	cmp    rax,r14
  400f51:	76 dd                	jbe    400f30 <print_broken_up_decimal.isra.0+0x280>
  400f53:	49 83 fc 09          	cmp    r12,0x9
  400f57:	0f 8f 8e fd ff ff    	jg     400ceb <print_broken_up_decimal.isra.0+0x3b>
  400f5d:	e9 10 fe ff ff       	jmp    400d72 <print_broken_up_decimal.isra.0+0xc2>
  400f62:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  400f68:	c6 44 0d 00 2b       	mov    BYTE PTR [rbp+rcx*1+0x0],0x2b
  400f6d:	8d 51 01             	lea    edx,[rcx+0x1]
  400f70:	e9 6d fe ff ff       	jmp    400de2 <print_broken_up_decimal.isra.0+0x132>
  400f75:	0f 1f 00             	nop    DWORD PTR [rax]
  400f78:	41 83 e9 01          	sub    r9d,0x1
  400f7c:	e9 32 ff ff ff       	jmp    400eb3 <print_broken_up_decimal.isra.0+0x203>
  400f81:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  400f88:	45 85 c9             	test   r9d,r9d
  400f8b:	0f 84 3f fe ff ff    	je     400dd0 <print_broken_up_decimal.isra.0+0x120>
  400f91:	83 f9 1f             	cmp    ecx,0x1f
  400f94:	0f 96 c2             	setbe  dl
  400f97:	e9 04 ff ff ff       	jmp    400ea0 <print_broken_up_decimal.isra.0+0x1f0>

Disassembly of section .text.print_exponential_number:

0000000000400fa0 <print_exponential_number>:
  400fa0:	41 57                	push   r15
  400fa2:	41 89 f2             	mov    r10d,esi
  400fa5:	41 89 cf             	mov    r15d,ecx
  400fa8:	4d 89 c3             	mov    r11,r8
  400fab:	41 56                	push   r14
  400fad:	41 55                	push   r13
  400faf:	41 54                	push   r12
  400fb1:	49 89 fc             	mov    r12,rdi
  400fb4:	55                   	push   rbp
  400fb5:	89 d5                	mov    ebp,edx
  400fb7:	66 48 0f 7e c2       	movq   rdx,xmm0
  400fbc:	53                   	push   rbx
  400fbd:	48 83 ec 38          	sub    rsp,0x38
  400fc1:	48 c1 ea 3f          	shr    rdx,0x3f
  400fc5:	74 08                	je     400fcf <print_exponential_number+0x2f>
  400fc7:	66 0f 57 05 01 23 00 	xorpd  xmm0,XMMWORD PTR [rip+0x2301]        # 4032d0 <powers_of_10+0x90>
  400fce:	00 
  400fcf:	44 89 f9             	mov    ecx,r15d
  400fd2:	66 0f ef db          	pxor   xmm3,xmm3
  400fd6:	81 e1 00 10 00 00    	and    ecx,0x1000
  400fdc:	66 0f 2e c3          	ucomisd xmm0,xmm3
  400fe0:	0f 8a 9a 00 00 00    	jp     401080 <print_exponential_number+0xe0>
  400fe6:	0f 85 94 00 00 00    	jne    401080 <print_exponential_number+0xe0>
  400fec:	85 c9                	test   ecx,ecx
  400fee:	0f 85 6c 02 00 00    	jne    401260 <print_exponential_number+0x2c0>
  400ff4:	48 85 d2             	test   rdx,rdx
  400ff7:	0f 84 fc 06 00 00    	je     4016f9 <print_exponential_number+0x759>
  400ffd:	31 c0                	xor    eax,eax
  400fff:	31 db                	xor    ebx,ebx
  401001:	66 0f 57 05 c7 22 00 	xorpd  xmm0,XMMWORD PTR [rip+0x22c7]        # 4032d0 <powers_of_10+0x90>
  401008:	00 
  401009:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  40100e:	44 89 d6             	mov    esi,r10d
  401011:	88 44 24 0c          	mov    BYTE PTR [rsp+0xc],al
  401015:	e8 f6 f6 ff ff       	call   400710 <get_components>
  40101a:	0f b6 44 24 0c       	movzx  eax,BYTE PTR [rsp+0xc]
  40101f:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  401024:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  401029:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  40102e:	84 c0                	test   al,al
  401030:	0f 84 0a 03 00 00    	je     401340 <print_exponential_number+0x3a0>
  401036:	41 f7 c7 00 10 00 00 	test   r15d,0x1000
  40103d:	74 09                	je     401048 <print_exponential_number+0xa8>
  40103f:	83 fb ff             	cmp    ebx,0xffffffff
  401042:	0f 8d 48 05 00 00    	jge    401590 <print_exponential_number+0x5f0>
  401048:	85 ed                	test   ebp,ebp
  40104a:	0f 84 30 03 00 00    	je     401380 <print_exponential_number+0x3e0>
  401050:	48 83 ec 08          	sub    rsp,0x8
  401054:	45 89 d0             	mov    r8d,r10d
  401057:	4c 89 e1             	mov    rcx,r12
  40105a:	41 51                	push   r9
  40105c:	41 89 e9             	mov    r9d,ebp
  40105f:	41 53                	push   r11
  401061:	41 57                	push   r15
  401063:	e8 48 fc ff ff       	call   400cb0 <print_broken_up_decimal.isra.0>
  401068:	48 83 c4 20          	add    rsp,0x20
  40106c:	48 83 c4 38          	add    rsp,0x38
  401070:	5b                   	pop    rbx
  401071:	5d                   	pop    rbp
  401072:	41 5c                	pop    r12
  401074:	41 5d                	pop    r13
  401076:	41 5e                	pop    r14
  401078:	41 5f                	pop    r15
  40107a:	c3                   	ret    
  40107b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  401080:	66 48 0f 7e c6       	movq   rsi,xmm0
  401085:	f2 0f 10 2d 83 22 00 	movsd  xmm5,QWORD PTR [rip+0x2283]        # 403310 <powers_of_10+0xd0>
  40108c:	00 
  40108d:	48 b8 ff ff ff ff ff 	movabs rax,0xfffffffffffff
  401094:	ff 0f 00 
  401097:	48 bf 00 00 00 00 00 	movabs rdi,0x3ff0000000000000
  40109e:	00 f0 3f 
  4010a1:	48 21 f0             	and    rax,rsi
  4010a4:	f2 0f 10 15 54 22 00 	movsd  xmm2,QWORD PTR [rip+0x2254]        # 403300 <powers_of_10+0xc0>
  4010ab:	00 
  4010ac:	48 c1 ee 34          	shr    rsi,0x34
  4010b0:	48 09 f8             	or     rax,rdi
  4010b3:	81 e6 ff 07 00 00    	and    esi,0x7ff
  4010b9:	66 48 0f 6e c8       	movq   xmm1,rax
  4010be:	f2 0f 5c 0d 32 22 00 	subsd  xmm1,QWORD PTR [rip+0x2232]        # 4032f8 <powers_of_10+0xb8>
  4010c5:	00 
  4010c6:	81 ee ff 03 00 00    	sub    esi,0x3ff
  4010cc:	f2 0f 59 d1          	mulsd  xmm2,xmm1
  4010d0:	66 0f 28 e1          	movapd xmm4,xmm1
  4010d4:	f2 0f 59 e1          	mulsd  xmm4,xmm1
  4010d8:	f2 0f 58 15 28 22 00 	addsd  xmm2,QWORD PTR [rip+0x2228]        # 403308 <powers_of_10+0xc8>
  4010df:	00 
  4010e0:	f2 0f 59 ec          	mulsd  xmm5,xmm4
  4010e4:	f2 0f 59 cc          	mulsd  xmm1,xmm4
  4010e8:	f2 0f 59 0d 28 22 00 	mulsd  xmm1,QWORD PTR [rip+0x2228]        # 403318 <powers_of_10+0xd8>
  4010ef:	00 
  4010f0:	f2 0f 5c d5          	subsd  xmm2,xmm5
  4010f4:	f2 0f 58 ca          	addsd  xmm1,xmm2
  4010f8:	66 0f ef d2          	pxor   xmm2,xmm2
  4010fc:	f2 0f 2a d6          	cvtsi2sd xmm2,esi
  401100:	f2 0f 59 15 18 22 00 	mulsd  xmm2,QWORD PTR [rip+0x2218]        # 403320 <powers_of_10+0xe0>
  401107:	00 
  401108:	f2 0f 58 ca          	addsd  xmm1,xmm2
  40110c:	66 0f 2f cb          	comisd xmm1,xmm3
  401110:	f2 0f 2c d9          	cvttsd2si ebx,xmm1
  401114:	73 18                	jae    40112e <print_exponential_number+0x18e>
  401116:	66 0f ef d2          	pxor   xmm2,xmm2
  40111a:	f2 0f 2a d3          	cvtsi2sd xmm2,ebx
  40111e:	66 0f 2e ca          	ucomisd xmm1,xmm2
  401122:	0f 8a 98 04 00 00    	jp     4015c0 <print_exponential_number+0x620>
  401128:	0f 85 92 04 00 00    	jne    4015c0 <print_exponential_number+0x620>
  40112e:	81 fb cc fe ff ff    	cmp    ebx,0xfffffecc
  401134:	0f 84 16 05 00 00    	je     401650 <print_exponential_number+0x6b0>
  40113a:	66 0f ef d2          	pxor   xmm2,xmm2
  40113e:	f2 0f 10 0d e2 21 00 	movsd  xmm1,QWORD PTR [rip+0x21e2]        # 403328 <powers_of_10+0xe8>
  401145:	00 
  401146:	66 0f ef e4          	pxor   xmm4,xmm4
  40114a:	f2 0f 2a d3          	cvtsi2sd xmm2,ebx
  40114e:	f2 0f 59 ca          	mulsd  xmm1,xmm2
  401152:	f2 0f 58 0d 86 21 00 	addsd  xmm1,QWORD PTR [rip+0x2186]        # 4032e0 <powers_of_10+0xa0>
  401159:	00 
  40115a:	f2 0f 2c c1          	cvttsd2si eax,xmm1
  40115e:	66 0f 2f cb          	comisd xmm1,xmm3
  401162:	f2 0f 2a e0          	cvtsi2sd xmm4,eax
  401166:	73 10                	jae    401178 <print_exponential_number+0x1d8>
  401168:	66 0f 2e cc          	ucomisd xmm1,xmm4
  40116c:	0f 8a ce 04 00 00    	jp     401640 <print_exponential_number+0x6a0>
  401172:	0f 85 c8 04 00 00    	jne    401640 <print_exponential_number+0x6a0>
  401178:	f2 0f 59 25 b8 21 00 	mulsd  xmm4,QWORD PTR [rip+0x21b8]        # 403338 <powers_of_10+0xf8>
  40117f:	00 
  401180:	f2 0f 10 35 c0 21 00 	movsd  xmm6,QWORD PTR [rip+0x21c0]        # 403348 <powers_of_10+0x108>
  401187:	00 
  401188:	48 98                	cdqe   
  40118a:	f2 0f 59 15 9e 21 00 	mulsd  xmm2,QWORD PTR [rip+0x219e]        # 403330 <powers_of_10+0xf0>
  401191:	00 
  401192:	48 05 ff 03 00 00    	add    rax,0x3ff
  401198:	48 c1 e0 34          	shl    rax,0x34
  40119c:	66 48 0f 6e f8       	movq   xmm7,rax
  4011a1:	f2 0f 5c d4          	subsd  xmm2,xmm4
  4011a5:	66 0f 28 da          	movapd xmm3,xmm2
  4011a9:	66 0f 28 ca          	movapd xmm1,xmm2
  4011ad:	f2 0f 59 da          	mulsd  xmm3,xmm2
  4011b1:	f2 0f 58 ca          	addsd  xmm1,xmm2
  4011b5:	66 0f 28 eb          	movapd xmm5,xmm3
  4011b9:	f2 0f 5e 2d 7f 21 00 	divsd  xmm5,QWORD PTR [rip+0x217f]        # 403340 <powers_of_10+0x100>
  4011c0:	00 
  4011c1:	f2 0f 58 ee          	addsd  xmm5,xmm6
  4011c5:	66 0f 28 e3          	movapd xmm4,xmm3
  4011c9:	f2 0f 5e e5          	divsd  xmm4,xmm5
  4011cd:	f2 0f 58 25 7b 21 00 	addsd  xmm4,QWORD PTR [rip+0x217b]        # 403350 <powers_of_10+0x110>
  4011d4:	00 
  4011d5:	f2 0f 5e dc          	divsd  xmm3,xmm4
  4011d9:	f2 0f 10 25 77 21 00 	movsd  xmm4,QWORD PTR [rip+0x2177]        # 403358 <powers_of_10+0x118>
  4011e0:	00 
  4011e1:	f2 0f 5c e2          	subsd  xmm4,xmm2
  4011e5:	f2 0f 58 dc          	addsd  xmm3,xmm4
  4011e9:	f2 0f 5e cb          	divsd  xmm1,xmm3
  4011ed:	f2 0f 58 0d 6b 21 00 	addsd  xmm1,QWORD PTR [rip+0x216b]        # 403360 <powers_of_10+0x120>
  4011f4:	00 
  4011f5:	f2 0f 59 cf          	mulsd  xmm1,xmm7
  4011f9:	66 0f 2f c8          	comisd xmm1,xmm0
  4011fd:	0f 87 7d 03 00 00    	ja     401580 <print_exponential_number+0x5e0>
  401203:	8d 43 11             	lea    eax,[rbx+0x11]
  401206:	31 f6                	xor    esi,esi
  401208:	83 f8 22             	cmp    eax,0x22
  40120b:	77 1a                	ja     401227 <print_exponential_number+0x287>
  40120d:	89 d8                	mov    eax,ebx
  40120f:	48 8d 35 2a 20 00 00 	lea    rsi,[rip+0x202a]        # 403240 <powers_of_10>
  401216:	f7 d8                	neg    eax
  401218:	0f 48 c3             	cmovs  eax,ebx
  40121b:	48 98                	cdqe   
  40121d:	f2 0f 10 0c c6       	movsd  xmm1,QWORD PTR [rsi+rax*8]
  401222:	be 01 00 00 00       	mov    esi,0x1
  401227:	89 d8                	mov    eax,ebx
  401229:	c1 e8 1f             	shr    eax,0x1f
  40122c:	21 c6                	and    esi,eax
  40122e:	85 db                	test   ebx,ebx
  401230:	40 0f 94 c7          	sete   dil
  401234:	31 c0                	xor    eax,eax
  401236:	85 c9                	test   ecx,ecx
  401238:	74 5f                	je     401299 <print_exponential_number+0x2f9>
  40123a:	45 85 d2             	test   r10d,r10d
  40123d:	b8 01 00 00 00       	mov    eax,0x1
  401242:	41 0f 45 c2          	cmovne eax,r10d
  401246:	39 c3                	cmp    ebx,eax
  401248:	0f 9c c0             	setl   al
  40124b:	83 fb fc             	cmp    ebx,0xfffffffc
  40124e:	0f 9d c1             	setge  cl
  401251:	21 c8                	and    eax,ecx
  401253:	09 c7                	or     edi,eax
  401255:	eb 23                	jmp    40127a <print_exponential_number+0x2da>
  401257:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40125e:	00 00 
  401260:	45 85 d2             	test   r10d,r10d
  401263:	b8 01 00 00 00       	mov    eax,0x1
  401268:	bf 01 00 00 00       	mov    edi,0x1
  40126d:	41 0f 45 c2          	cmovne eax,r10d
  401271:	85 c0                	test   eax,eax
  401273:	0f 9f c0             	setg   al
  401276:	31 f6                	xor    esi,esi
  401278:	31 db                	xor    ebx,ebx
  40127a:	41 83 ea 01          	sub    r10d,0x1
  40127e:	44 89 d1             	mov    ecx,r10d
  401281:	29 d9                	sub    ecx,ebx
  401283:	84 c0                	test   al,al
  401285:	44 0f 45 d1          	cmovne r10d,ecx
  401289:	31 c9                	xor    ecx,ecx
  40128b:	45 85 d2             	test   r10d,r10d
  40128e:	44 0f 48 d1          	cmovs  r10d,ecx
  401292:	41 81 cf 00 08 00 00 	or     r15d,0x800
  401299:	40 84 ff             	test   dil,dil
  40129c:	0f 85 c6 02 00 00    	jne    401568 <print_exponential_number+0x5c8>
  4012a2:	44 89 d1             	mov    ecx,r10d
  4012a5:	29 d9                	sub    ecx,ebx
  4012a7:	40 84 f6             	test   sil,sil
  4012aa:	0f 84 28 02 00 00    	je     4014d8 <print_exponential_number+0x538>
  4012b0:	66 0f 28 d0          	movapd xmm2,xmm0
  4012b4:	f2 0f 59 d1          	mulsd  xmm2,xmm1
  4012b8:	81 f9 32 01 00 00    	cmp    ecx,0x132
  4012be:	0f 8f ac 03 00 00    	jg     401670 <print_exponential_number+0x6d0>
  4012c4:	f2 48 0f 2c fa       	cvttsd2si rdi,xmm2
  4012c9:	66 0f ef d2          	pxor   xmm2,xmm2
  4012cd:	66 0f 28 d9          	movapd xmm3,xmm1
  4012d1:	44 89 d1             	mov    ecx,r10d
  4012d4:	48 8d 35 65 1f 00 00 	lea    rsi,[rip+0x1f65]        # 403240 <powers_of_10>
  4012db:	f2 48 0f 2a d7       	cvtsi2sd xmm2,rdi
  4012e0:	f2 0f 5e d1          	divsd  xmm2,xmm1
  4012e4:	f2 0f 5c c2          	subsd  xmm0,xmm2
  4012e8:	f2 0f 10 14 ce       	movsd  xmm2,QWORD PTR [rsi+rcx*8]
  4012ed:	f2 0f 59 da          	mulsd  xmm3,xmm2
  4012f1:	f2 0f 59 c3          	mulsd  xmm0,xmm3
  4012f5:	f2 48 0f 2c c8       	cvttsd2si rcx,xmm0
  4012fa:	66 0f ef c9          	pxor   xmm1,xmm1
  4012fe:	31 f6                	xor    esi,esi
  401300:	f2 48 0f 2a c9       	cvtsi2sd xmm1,rcx
  401305:	f2 0f 5c c1          	subsd  xmm0,xmm1
  401309:	66 0f 2f 05 cf 1f 00 	comisd xmm0,QWORD PTR [rip+0x1fcf]        # 4032e0 <powers_of_10+0xa0>
  401310:	00 
  401311:	40 0f 93 c6          	setae  sil
  401315:	48 01 ce             	add    rsi,rcx
  401318:	66 0f 2e 05 c0 1f 00 	ucomisd xmm0,QWORD PTR [rip+0x1fc0]        # 4032e0 <powers_of_10+0xa0>
  40131f:	00 
  401320:	7a 06                	jp     401328 <print_exponential_number+0x388>
  401322:	75 04                	jne    401328 <print_exponential_number+0x388>
  401324:	48 83 e6 fe          	and    rsi,0xfffffffffffffffe
  401328:	66 0f ef c0          	pxor   xmm0,xmm0
  40132c:	f2 48 0f 2a c6       	cvtsi2sd xmm0,rsi
  401331:	66 0f 2f c2          	comisd xmm0,xmm2
  401335:	72 06                	jb     40133d <print_exponential_number+0x39d>
  401337:	48 83 c7 01          	add    rdi,0x1
  40133b:	31 f6                	xor    esi,esi
  40133d:	83 e2 01             	and    edx,0x1
  401340:	48 83 ff 09          	cmp    rdi,0x9
  401344:	7e 0a                	jle    401350 <print_exponential_number+0x3b0>
  401346:	83 c3 01             	add    ebx,0x1
  401349:	31 f6                	xor    esi,esi
  40134b:	bf 01 00 00 00       	mov    edi,0x1
  401350:	45 89 fe             	mov    r14d,r15d
  401353:	8d 4b 63             	lea    ecx,[rbx+0x63]
  401356:	41 83 e6 02          	and    r14d,0x2
  40135a:	81 f9 c6 00 00 00    	cmp    ecx,0xc6
  401360:	77 4e                	ja     4013b0 <print_exponential_number+0x410>
  401362:	45 85 f6             	test   r14d,r14d
  401365:	0f 85 c5 02 00 00    	jne    401630 <print_exponential_number+0x690>
  40136b:	41 be 04 00 00 00    	mov    r14d,0x4
  401371:	e9 68 02 00 00       	jmp    4015de <print_exponential_number+0x63e>
  401376:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40137d:	00 00 00 
  401380:	48 83 ec 08          	sub    rsp,0x8
  401384:	4c 89 e1             	mov    rcx,r12
  401387:	45 89 d0             	mov    r8d,r10d
  40138a:	41 51                	push   r9
  40138c:	45 31 c9             	xor    r9d,r9d
  40138f:	41 53                	push   r11
  401391:	41 57                	push   r15
  401393:	e8 18 f9 ff ff       	call   400cb0 <print_broken_up_decimal.isra.0>
  401398:	48 83 c4 20          	add    rsp,0x20
  40139c:	48 83 c4 38          	add    rsp,0x38
  4013a0:	5b                   	pop    rbx
  4013a1:	5d                   	pop    rbp
  4013a2:	41 5c                	pop    r12
  4013a4:	41 5d                	pop    r13
  4013a6:	41 5e                	pop    r14
  4013a8:	41 5f                	pop    r15
  4013aa:	c3                   	ret    
  4013ab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4013b0:	45 85 f6             	test   r14d,r14d
  4013b3:	0f 84 1f 02 00 00    	je     4015d8 <print_exponential_number+0x638>
  4013b9:	b8 04 00 00 00       	mov    eax,0x4
  4013be:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  4013c2:	48 83 ec 08          	sub    rsp,0x8
  4013c6:	45 89 d0             	mov    r8d,r10d
  4013c9:	4c 89 e1             	mov    rcx,r12
  4013cc:	41 51                	push   r9
  4013ce:	45 31 c9             	xor    r9d,r9d
  4013d1:	45 8b 6c 24 18       	mov    r13d,DWORD PTR [r12+0x18]
  4013d6:	41 53                	push   r11
  4013d8:	41 57                	push   r15
  4013da:	e8 d1 f8 ff ff       	call   400cb0 <print_broken_up_decimal.isra.0>
  4013df:	8b 44 24 2c          	mov    eax,DWORD PTR [rsp+0x2c]
  4013e3:	48 83 c4 20          	add    rsp,0x20
  4013e7:	41 83 e7 20          	and    r15d,0x20
  4013eb:	41 8b 4c 24 18       	mov    ecx,DWORD PTR [r12+0x18]
  4013f0:	41 83 ff 01          	cmp    r15d,0x1
  4013f4:	19 d2                	sbb    edx,edx
  4013f6:	8d 71 01             	lea    esi,[rcx+0x1]
  4013f9:	83 e2 20             	and    edx,0x20
  4013fc:	41 89 74 24 18       	mov    DWORD PTR [r12+0x18],esi
  401401:	83 c2 45             	add    edx,0x45
  401404:	41 83 ff 01          	cmp    r15d,0x1
  401408:	19 ff                	sbb    edi,edi
  40140a:	83 e7 20             	and    edi,0x20
  40140d:	83 c7 45             	add    edi,0x45
  401410:	41 3b 4c 24 1c       	cmp    ecx,DWORD PTR [r12+0x1c]
  401415:	73 1d                	jae    401434 <print_exponential_number+0x494>
  401417:	4d 8b 04 24          	mov    r8,QWORD PTR [r12]
  40141b:	4d 85 c0             	test   r8,r8
  40141e:	0f 84 bc 02 00 00    	je     4016e0 <print_exponential_number+0x740>
  401424:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  401428:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  40142d:	41 ff d0             	call   r8
  401430:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
  401434:	48 63 d3             	movsxd rdx,ebx
  401437:	41 89 da             	mov    r10d,ebx
  40143a:	41 89 c1             	mov    r9d,eax
  40143d:	b9 0a 00 00 00       	mov    ecx,0xa
  401442:	48 89 d6             	mov    rsi,rdx
  401445:	41 c1 ea 1f          	shr    r10d,0x1f
  401449:	4c 89 e7             	mov    rdi,r12
  40144c:	48 f7 de             	neg    rsi
  40144f:	85 db                	test   ebx,ebx
  401451:	48 0f 4f f2          	cmovg  rsi,rdx
  401455:	48 83 ec 08          	sub    rsp,0x8
  401459:	44 89 d2             	mov    edx,r10d
  40145c:	45 31 c0             	xor    r8d,r8d
  40145f:	6a 05                	push   0x5
  401461:	e8 ea f4 ff ff       	call   400950 <print_integer>
  401466:	58                   	pop    rax
  401467:	5a                   	pop    rdx
  401468:	45 85 f6             	test   r14d,r14d
  40146b:	0f 84 fb fb ff ff    	je     40106c <print_exponential_number+0xcc>
  401471:	41 8b 44 24 18       	mov    eax,DWORD PTR [r12+0x18]
  401476:	89 c2                	mov    edx,eax
  401478:	44 29 ea             	sub    edx,r13d
  40147b:	39 d5                	cmp    ebp,edx
  40147d:	0f 86 e9 fb ff ff    	jbe    40106c <print_exponential_number+0xcc>
  401483:	8d 48 01             	lea    ecx,[rax+0x1]
  401486:	83 c2 01             	add    edx,0x1
  401489:	41 89 4c 24 18       	mov    DWORD PTR [r12+0x18],ecx
  40148e:	41 39 44 24 1c       	cmp    DWORD PTR [r12+0x1c],eax
  401493:	0f 86 17 02 00 00    	jbe    4016b0 <print_exponential_number+0x710>
  401499:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
  40149d:	48 85 d2             	test   rdx,rdx
  4014a0:	0f 84 1a 02 00 00    	je     4016c0 <print_exponential_number+0x720>
  4014a6:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  4014ab:	bf 20 00 00 00       	mov    edi,0x20
  4014b0:	ff d2                	call   rdx
  4014b2:	41 8b 44 24 18       	mov    eax,DWORD PTR [r12+0x18]
  4014b7:	89 c2                	mov    edx,eax
  4014b9:	44 29 ea             	sub    edx,r13d
  4014bc:	eb bd                	jmp    40147b <print_exponential_number+0x4db>
  4014be:	66 90                	xchg   ax,ax
  4014c0:	85 c9                	test   ecx,ecx
  4014c2:	0f 85 28 02 00 00    	jne    4016f0 <print_exponential_number+0x750>
  4014c8:	41 8d 8a 34 01 00 00 	lea    ecx,[r10+0x134]
  4014cf:	31 c0                	xor    eax,eax
  4014d1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4014d8:	66 0f 28 d0          	movapd xmm2,xmm0
  4014dc:	f2 0f 5e d1          	divsd  xmm2,xmm1
  4014e0:	81 f9 32 01 00 00    	cmp    ecx,0x132
  4014e6:	0f 8f 84 01 00 00    	jg     401670 <print_exponential_number+0x6d0>
  4014ec:	f2 48 0f 2c fa       	cvttsd2si rdi,xmm2
  4014f1:	66 0f ef d2          	pxor   xmm2,xmm2
  4014f5:	44 89 d1             	mov    ecx,r10d
  4014f8:	48 8d 35 41 1d 00 00 	lea    rsi,[rip+0x1d41]        # 403240 <powers_of_10>
  4014ff:	f2 48 0f 2a d7       	cvtsi2sd xmm2,rdi
  401504:	f2 0f 59 d1          	mulsd  xmm2,xmm1
  401508:	f2 0f 5c c2          	subsd  xmm0,xmm2
  40150c:	f2 0f 10 14 ce       	movsd  xmm2,QWORD PTR [rsi+rcx*8]
  401511:	66 48 0f 7e c9       	movq   rcx,xmm1
  401516:	48 c1 e9 34          	shr    rcx,0x34
  40151a:	81 e1 ff 07 00 00    	and    ecx,0x7ff
  401520:	81 e9 ff 03 00 00    	sub    ecx,0x3ff
  401526:	89 ce                	mov    esi,ecx
  401528:	f7 de                	neg    esi
  40152a:	0f 48 f1             	cmovs  esi,ecx
  40152d:	66 48 0f 7e d1       	movq   rcx,xmm2
  401532:	48 c1 e9 34          	shr    rcx,0x34
  401536:	81 e1 ff 07 00 00    	and    ecx,0x7ff
  40153c:	81 e9 ff 03 00 00    	sub    ecx,0x3ff
  401542:	41 89 c8             	mov    r8d,ecx
  401545:	41 f7 d8             	neg    r8d
  401548:	41 0f 49 c8          	cmovns ecx,r8d
  40154c:	39 ce                	cmp    esi,ecx
  40154e:	0f 8f 7c 01 00 00    	jg     4016d0 <print_exponential_number+0x730>
  401554:	66 0f 28 da          	movapd xmm3,xmm2
  401558:	f2 0f 5e d9          	divsd  xmm3,xmm1
  40155c:	e9 90 fd ff ff       	jmp    4012f1 <print_exponential_number+0x351>
  401561:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401568:	48 85 d2             	test   rdx,rdx
  40156b:	0f 84 98 fa ff ff    	je     401009 <print_exponential_number+0x69>
  401571:	e9 8b fa ff ff       	jmp    401001 <print_exponential_number+0x61>
  401576:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40157d:	00 00 00 
  401580:	f2 0f 5e ce          	divsd  xmm1,xmm6
  401584:	83 eb 01             	sub    ebx,0x1
  401587:	e9 77 fc ff ff       	jmp    401203 <print_exponential_number+0x263>
  40158c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401590:	83 c3 01             	add    ebx,0x1
  401593:	66 0f ef c0          	pxor   xmm0,xmm0
  401597:	48 8d 05 a2 1c 00 00 	lea    rax,[rip+0x1ca2]        # 403240 <powers_of_10>
  40159e:	48 63 db             	movsxd rbx,ebx
  4015a1:	f2 48 0f 2a c7       	cvtsi2sd xmm0,rdi
  4015a6:	66 0f 2e 04 d8       	ucomisd xmm0,QWORD PTR [rax+rbx*8]
  4015ab:	0f 8a 97 fa ff ff    	jp     401048 <print_exponential_number+0xa8>
  4015b1:	0f 85 91 fa ff ff    	jne    401048 <print_exponential_number+0xa8>
  4015b7:	41 83 ea 01          	sub    r10d,0x1
  4015bb:	e9 88 fa ff ff       	jmp    401048 <print_exponential_number+0xa8>
  4015c0:	83 eb 01             	sub    ebx,0x1
  4015c3:	81 fb cc fe ff ff    	cmp    ebx,0xfffffecc
  4015c9:	0f 85 6b fb ff ff    	jne    40113a <print_exponential_number+0x19a>
  4015cf:	eb 7f                	jmp    401650 <print_exponential_number+0x6b0>
  4015d1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4015d8:	41 be 05 00 00 00    	mov    r14d,0x5
  4015de:	89 e9                	mov    ecx,ebp
  4015e0:	45 31 c0             	xor    r8d,r8d
  4015e3:	88 44 24 0c          	mov    BYTE PTR [rsp+0xc],al
  4015e7:	45 8b 6c 24 18       	mov    r13d,DWORD PTR [r12+0x18]
  4015ec:	44 29 f1             	sub    ecx,r14d
  4015ef:	44 39 f5             	cmp    ebp,r14d
  4015f2:	41 0f 46 c8          	cmovbe ecx,r8d
  4015f6:	48 83 ec 08          	sub    rsp,0x8
  4015fa:	45 89 d0             	mov    r8d,r10d
  4015fd:	41 51                	push   r9
  4015ff:	41 53                	push   r11
  401601:	41 89 c9             	mov    r9d,ecx
  401604:	4c 89 e1             	mov    rcx,r12
  401607:	41 57                	push   r15
  401609:	e8 a2 f6 ff ff       	call   400cb0 <print_broken_up_decimal.isra.0>
  40160e:	0f b6 44 24 2c       	movzx  eax,BYTE PTR [rsp+0x2c]
  401613:	48 83 c4 20          	add    rsp,0x20
  401617:	84 c0                	test   al,al
  401619:	0f 85 4d fa ff ff    	jne    40106c <print_exponential_number+0xcc>
  40161f:	41 8d 46 ff          	lea    eax,[r14-0x1]
  401623:	45 31 f6             	xor    r14d,r14d
  401626:	e9 bc fd ff ff       	jmp    4013e7 <print_exponential_number+0x447>
  40162b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  401630:	b8 03 00 00 00       	mov    eax,0x3
  401635:	e9 84 fd ff ff       	jmp    4013be <print_exponential_number+0x41e>
  40163a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  401640:	83 e8 01             	sub    eax,0x1
  401643:	66 0f ef e4          	pxor   xmm4,xmm4
  401647:	f2 0f 2a e0          	cvtsi2sd xmm4,eax
  40164b:	e9 28 fb ff ff       	jmp    401178 <print_exponential_number+0x1d8>
  401650:	f2 0f 10 0d 98 1c 00 	movsd  xmm1,QWORD PTR [rip+0x1c98]        # 4032f0 <powers_of_10+0xb0>
  401657:	00 
  401658:	66 0f 2f c8          	comisd xmm1,xmm0
  40165c:	0f 86 5e fe ff ff    	jbe    4014c0 <print_exponential_number+0x520>
  401662:	f2 0f 10 0d 7e 1c 00 	movsd  xmm1,QWORD PTR [rip+0x1c7e]        # 4032e8 <powers_of_10+0xa8>
  401669:	00 
  40166a:	e9 15 ff ff ff       	jmp    401584 <print_exponential_number+0x5e4>
  40166f:	90                   	nop
  401670:	48 85 d2             	test   rdx,rdx
  401673:	74 08                	je     40167d <print_exponential_number+0x6dd>
  401675:	66 0f 57 15 53 1c 00 	xorpd  xmm2,XMMWORD PTR [rip+0x1c53]        # 4032d0 <powers_of_10+0x90>
  40167c:	00 
  40167d:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  401682:	44 89 d6             	mov    esi,r10d
  401685:	66 0f 28 c2          	movapd xmm0,xmm2
  401689:	88 44 24 0c          	mov    BYTE PTR [rsp+0xc],al
  40168d:	e8 7e f0 ff ff       	call   400710 <get_components>
  401692:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  401697:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  40169c:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  4016a1:	0f b6 44 24 0c       	movzx  eax,BYTE PTR [rsp+0xc]
  4016a6:	e9 95 fc ff ff       	jmp    401340 <print_exponential_number+0x3a0>
  4016ab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4016b0:	89 c8                	mov    eax,ecx
  4016b2:	e9 c4 fd ff ff       	jmp    40147b <print_exponential_number+0x4db>
  4016b7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4016be:	00 00 
  4016c0:	49 8b 54 24 10       	mov    rdx,QWORD PTR [r12+0x10]
  4016c5:	c6 04 02 20          	mov    BYTE PTR [rdx+rax*1],0x20
  4016c9:	e9 a3 fd ff ff       	jmp    401471 <print_exponential_number+0x4d1>
  4016ce:	66 90                	xchg   ax,ax
  4016d0:	f2 0f 5e ca          	divsd  xmm1,xmm2
  4016d4:	f2 0f 5e c1          	divsd  xmm0,xmm1
  4016d8:	e9 18 fc ff ff       	jmp    4012f5 <print_exponential_number+0x355>
  4016dd:	0f 1f 00             	nop    DWORD PTR [rax]
  4016e0:	49 8b 74 24 10       	mov    rsi,QWORD PTR [r12+0x10]
  4016e5:	88 14 0e             	mov    BYTE PTR [rsi+rcx*1],dl
  4016e8:	e9 47 fd ff ff       	jmp    401434 <print_exponential_number+0x494>
  4016ed:	0f 1f 00             	nop    DWORD PTR [rax]
  4016f0:	31 ff                	xor    edi,edi
  4016f2:	31 f6                	xor    esi,esi
  4016f4:	e9 41 fb ff ff       	jmp    40123a <print_exponential_number+0x29a>
  4016f9:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  4016fe:	44 89 d6             	mov    esi,r10d
  401701:	31 db                	xor    ebx,ebx
  401703:	e8 08 f0 ff ff       	call   400710 <get_components>
  401708:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  40170d:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  401712:	31 c0                	xor    eax,eax
  401714:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  401719:	e9 22 fc ff ff       	jmp    401340 <print_exponential_number+0x3a0>

Disassembly of section .text.print_floating_point:

0000000000401720 <print_floating_point>:
  401720:	41 54                	push   r12
  401722:	41 89 d4             	mov    r12d,edx
  401725:	55                   	push   rbp
  401726:	48 89 fd             	mov    rbp,rdi
  401729:	48 83 ec 58          	sub    rsp,0x58
  40172d:	66 0f 2e c0          	ucomisd xmm0,xmm0
  401731:	0f 8a 31 01 00 00    	jp     401868 <print_floating_point+0x148>
  401737:	f2 0f 10 0d 29 1c 00 	movsd  xmm1,QWORD PTR [rip+0x1c29]        # 403368 <powers_of_10+0x128>
  40173e:	00 
  40173f:	66 0f 2f c8          	comisd xmm1,xmm0
  401743:	0f 87 87 01 00 00    	ja     4018d0 <print_floating_point+0x1b0>
  401749:	66 0f 2f 05 1f 1c 00 	comisd xmm0,QWORD PTR [rip+0x1c1f]        # 403370 <powers_of_10+0x130>
  401750:	00 
  401751:	0f 87 91 00 00 00    	ja     4017e8 <print_floating_point+0xc8>
  401757:	45 84 c0             	test   r8b,r8b
  40175a:	0f 85 c0 00 00 00    	jne    401820 <print_floating_point+0x100>
  401760:	66 0f 2f 05 10 1c 00 	comisd xmm0,QWORD PTR [rip+0x1c10]        # 403378 <powers_of_10+0x138>
  401767:	00 
  401768:	0f 87 42 01 00 00    	ja     4018b0 <print_floating_point+0x190>
  40176e:	f2 0f 10 0d 0a 1c 00 	movsd  xmm1,QWORD PTR [rip+0x1c0a]        # 403380 <powers_of_10+0x140>
  401775:	00 
  401776:	66 0f 2f c8          	comisd xmm1,xmm0
  40177a:	0f 87 30 01 00 00    	ja     4018b0 <print_floating_point+0x190>
  401780:	41 89 c9             	mov    r9d,ecx
  401783:	41 81 e1 00 08 00 00 	and    r9d,0x800
  40178a:	0f 85 60 01 00 00    	jne    4018f0 <print_floating_point+0x1d0>
  401790:	be 06 00 00 00       	mov    esi,0x6
  401795:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  40179a:	89 4c 24 0c          	mov    DWORD PTR [rsp+0xc],ecx
  40179e:	89 74 24 08          	mov    DWORD PTR [rsp+0x8],esi
  4017a2:	e8 69 ef ff ff       	call   400710 <get_components>
  4017a7:	48 83 ec 08          	sub    rsp,0x8
  4017ab:	41 51                	push   r9
  4017ad:	45 89 e1             	mov    r9d,r12d
  4017b0:	48 8d 44 24 40       	lea    rax,[rsp+0x40]
  4017b5:	50                   	push   rax
  4017b6:	8b 4c 24 24          	mov    ecx,DWORD PTR [rsp+0x24]
  4017ba:	51                   	push   rcx
  4017bb:	44 8b 44 24 28       	mov    r8d,DWORD PTR [rsp+0x28]
  4017c0:	48 89 e9             	mov    rcx,rbp
  4017c3:	0f b6 54 24 40       	movzx  edx,BYTE PTR [rsp+0x40]
  4017c8:	48 8b 74 24 38       	mov    rsi,QWORD PTR [rsp+0x38]
  4017cd:	48 8b 7c 24 30       	mov    rdi,QWORD PTR [rsp+0x30]
  4017d2:	e8 d9 f4 ff ff       	call   400cb0 <print_broken_up_decimal.isra.0>
  4017d7:	48 83 c4 20          	add    rsp,0x20
  4017db:	48 83 c4 58          	add    rsp,0x58
  4017df:	5d                   	pop    rbp
  4017e0:	41 5c                	pop    r12
  4017e2:	c3                   	ret    
  4017e3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4017e8:	89 c8                	mov    eax,ecx
  4017ea:	48 8d 35 4c 18 00 00 	lea    rsi,[rip+0x184c]        # 40303d <putchar_+0x58d>
  4017f1:	41 89 c8             	mov    r8d,ecx
  4017f4:	48 89 ef             	mov    rdi,rbp
  4017f7:	83 e0 04             	and    eax,0x4
  4017fa:	44 89 e1             	mov    ecx,r12d
  4017fd:	83 f8 01             	cmp    eax,0x1
  401800:	19 d2                	sbb    edx,edx
  401802:	83 c2 04             	add    edx,0x4
  401805:	85 c0                	test   eax,eax
  401807:	48 8d 05 2a 18 00 00 	lea    rax,[rip+0x182a]        # 403038 <putchar_+0x588>
  40180e:	48 0f 45 f0          	cmovne rsi,rax
  401812:	48 83 c4 58          	add    rsp,0x58
  401816:	5d                   	pop    rbp
  401817:	41 5c                	pop    r12
  401819:	e9 f2 ef ff ff       	jmp    400810 <out_rev_>
  40181e:	66 90                	xchg   ax,ax
  401820:	41 89 c9             	mov    r9d,ecx
  401823:	41 81 e1 00 08 00 00 	and    r9d,0x800
  40182a:	74 64                	je     401890 <print_floating_point+0x170>
  40182c:	b8 01 00 00 00       	mov    eax,0x1
  401831:	45 31 c9             	xor    r9d,r9d
  401834:	83 fe 11             	cmp    esi,0x11
  401837:	76 5c                	jbe    401895 <print_floating_point+0x175>
  401839:	48 8d 54 24 2f       	lea    rdx,[rsp+0x2f]
  40183e:	66 90                	xchg   ax,ax
  401840:	41 89 c1             	mov    r9d,eax
  401843:	c6 04 02 30          	mov    BYTE PTR [rdx+rax*1],0x30
  401847:	83 ee 01             	sub    esi,0x1
  40184a:	48 83 c0 01          	add    rax,0x1
  40184e:	41 83 f9 1f          	cmp    r9d,0x1f
  401852:	77 05                	ja     401859 <print_floating_point+0x139>
  401854:	83 fe 11             	cmp    esi,0x11
  401857:	77 e7                	ja     401840 <print_floating_point+0x120>
  401859:	45 84 c0             	test   r8b,r8b
  40185c:	0f 84 33 ff ff ff    	je     401795 <print_floating_point+0x75>
  401862:	eb 31                	jmp    401895 <print_floating_point+0x175>
  401864:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401868:	48 83 c4 58          	add    rsp,0x58
  40186c:	41 89 c8             	mov    r8d,ecx
  40186f:	89 d1                	mov    ecx,edx
  401871:	48 89 ef             	mov    rdi,rbp
  401874:	ba 03 00 00 00       	mov    edx,0x3
  401879:	5d                   	pop    rbp
  40187a:	48 8d 35 c0 17 00 00 	lea    rsi,[rip+0x17c0]        # 403041 <putchar_+0x591>
  401881:	41 5c                	pop    r12
  401883:	e9 88 ef ff ff       	jmp    400810 <out_rev_>
  401888:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40188f:	00 
  401890:	be 06 00 00 00       	mov    esi,0x6
  401895:	4c 8d 44 24 30       	lea    r8,[rsp+0x30]
  40189a:	44 89 e2             	mov    edx,r12d
  40189d:	48 89 ef             	mov    rdi,rbp
  4018a0:	e8 fb f6 ff ff       	call   400fa0 <print_exponential_number>
  4018a5:	48 83 c4 58          	add    rsp,0x58
  4018a9:	5d                   	pop    rbp
  4018aa:	41 5c                	pop    r12
  4018ac:	c3                   	ret    
  4018ad:	0f 1f 00             	nop    DWORD PTR [rax]
  4018b0:	45 31 c9             	xor    r9d,r9d
  4018b3:	4c 8d 44 24 30       	lea    r8,[rsp+0x30]
  4018b8:	44 89 e2             	mov    edx,r12d
  4018bb:	48 89 ef             	mov    rdi,rbp
  4018be:	e8 dd f6 ff ff       	call   400fa0 <print_exponential_number>
  4018c3:	e9 13 ff ff ff       	jmp    4017db <print_floating_point+0xbb>
  4018c8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4018cf:	00 
  4018d0:	48 83 c4 58          	add    rsp,0x58
  4018d4:	41 89 c8             	mov    r8d,ecx
  4018d7:	89 d1                	mov    ecx,edx
  4018d9:	48 89 ef             	mov    rdi,rbp
  4018dc:	ba 04 00 00 00       	mov    edx,0x4
  4018e1:	5d                   	pop    rbp
  4018e2:	48 8d 35 5c 17 00 00 	lea    rsi,[rip+0x175c]        # 403045 <putchar_+0x595>
  4018e9:	41 5c                	pop    r12
  4018eb:	e9 20 ef ff ff       	jmp    400810 <out_rev_>
  4018f0:	b8 01 00 00 00       	mov    eax,0x1
  4018f5:	45 31 c9             	xor    r9d,r9d
  4018f8:	83 fe 11             	cmp    esi,0x11
  4018fb:	0f 87 38 ff ff ff    	ja     401839 <print_floating_point+0x119>
  401901:	e9 8f fe ff ff       	jmp    401795 <print_floating_point+0x75>

Disassembly of section .text.format_string_loop.constprop.0:

0000000000401910 <format_string_loop.constprop.0>:
  401910:	41 57                	push   r15
  401912:	49 89 d7             	mov    r15,rdx
  401915:	41 56                	push   r14
  401917:	41 55                	push   r13
  401919:	41 54                	push   r12
  40191b:	55                   	push   rbp
  40191c:	53                   	push   rbx
  40191d:	48 83 ec 38          	sub    rsp,0x38
  401921:	0f b6 16             	movzx  edx,BYTE PTR [rsi]
  401924:	84 d2                	test   dl,dl
  401926:	0f 84 5f 01 00 00    	je     401a8b <format_string_loop.constprop.0+0x17b>
  40192c:	49 89 fc             	mov    r12,rdi
  40192f:	48 89 f3             	mov    rbx,rsi
  401932:	4c 8d 2d 1f 17 00 00 	lea    r13,[rip+0x171f]        # 403058 <putchar_+0x5a8>
  401939:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401940:	4c 8d 73 01          	lea    r14,[rbx+0x1]
  401944:	80 fa 25             	cmp    dl,0x25
  401947:	0f 85 d3 05 00 00    	jne    401f20 <format_string_loop.constprop.0+0x610>
  40194d:	0f be 73 01          	movsx  esi,BYTE PTR [rbx+0x1]
  401951:	40 84 f6             	test   sil,sil
  401954:	0f 84 31 01 00 00    	je     401a8b <format_string_loop.constprop.0+0x17b>
  40195a:	31 c9                	xor    ecx,ecx
  40195c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401960:	8d 46 e0             	lea    eax,[rsi-0x20]
  401963:	49 8d 5e 01          	lea    rbx,[r14+0x1]
  401967:	3c 10                	cmp    al,0x10
  401969:	77 15                	ja     401980 <format_string_loop.constprop.0+0x70>
  40196b:	0f b6 c0             	movzx  eax,al
  40196e:	49 63 44 85 00       	movsxd rax,DWORD PTR [r13+rax*4+0x0]
  401973:	4c 01 e8             	add    rax,r13
  401976:	3e ff e0             	notrack jmp rax
  401979:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401980:	8d 56 d0             	lea    edx,[rsi-0x30]
  401983:	80 fa 09             	cmp    dl,0x9
  401986:	ba 00 00 00 00       	mov    edx,0x0
  40198b:	76 47                	jbe    4019d4 <format_string_loop.constprop.0+0xc4>
  40198d:	40 80 fe 2a          	cmp    sil,0x2a
  401991:	0f 84 e1 05 00 00    	je     401f78 <format_string_loop.constprop.0+0x668>
  401997:	45 31 d2             	xor    r10d,r10d
  40199a:	40 80 fe 2e          	cmp    sil,0x2e
  40199e:	74 51                	je     4019f1 <format_string_loop.constprop.0+0xe1>
  4019a0:	8d 7e 98             	lea    edi,[rsi-0x68]
  4019a3:	49 8d 5e 01          	lea    rbx,[r14+0x1]
  4019a7:	40 80 ff 12          	cmp    dil,0x12
  4019ab:	0f 87 7f 00 00 00    	ja     401a30 <format_string_loop.constprop.0+0x120>
  4019b1:	4c 8d 05 e4 16 00 00 	lea    r8,[rip+0x16e4]        # 40309c <putchar_+0x5ec>
  4019b8:	40 0f b6 ff          	movzx  edi,dil
  4019bc:	49 63 3c b8          	movsxd rdi,DWORD PTR [r8+rdi*4]
  4019c0:	4c 01 c7             	add    rdi,r8
  4019c3:	3e ff e7             	notrack jmp rdi
  4019c6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4019cd:	00 00 00 
  4019d0:	48 83 c3 01          	add    rbx,0x1
  4019d4:	8d 04 92             	lea    eax,[rdx+rdx*4]
  4019d7:	49 89 de             	mov    r14,rbx
  4019da:	8d 54 46 d0          	lea    edx,[rsi+rax*2-0x30]
  4019de:	0f be 33             	movsx  esi,BYTE PTR [rbx]
  4019e1:	8d 46 d0             	lea    eax,[rsi-0x30]
  4019e4:	3c 09                	cmp    al,0x9
  4019e6:	76 e8                	jbe    4019d0 <format_string_loop.constprop.0+0xc0>
  4019e8:	45 31 d2             	xor    r10d,r10d
  4019eb:	40 80 fe 2e          	cmp    sil,0x2e
  4019ef:	75 af                	jne    4019a0 <format_string_loop.constprop.0+0x90>
  4019f1:	41 0f be 76 01       	movsx  esi,BYTE PTR [r14+0x1]
  4019f6:	80 cd 08             	or     ch,0x8
  4019f9:	40 84 f6             	test   sil,sil
  4019fc:	0f 84 89 00 00 00    	je     401a8b <format_string_loop.constprop.0+0x17b>
  401a02:	44 8d 46 d0          	lea    r8d,[rsi-0x30]
  401a06:	49 8d 7e 01          	lea    rdi,[r14+0x1]
  401a0a:	41 80 f8 09          	cmp    r8b,0x9
  401a0e:	0f 86 44 05 00 00    	jbe    401f58 <format_string_loop.constprop.0+0x648>
  401a14:	40 80 fe 2a          	cmp    sil,0x2a
  401a18:	0f 84 b2 05 00 00    	je     401fd0 <format_string_loop.constprop.0+0x6c0>
  401a1e:	49 89 fe             	mov    r14,rdi
  401a21:	8d 7e 98             	lea    edi,[rsi-0x68]
  401a24:	49 8d 5e 01          	lea    rbx,[r14+0x1]
  401a28:	40 80 ff 12          	cmp    dil,0x12
  401a2c:	76 83                	jbe    4019b1 <format_string_loop.constprop.0+0xa1>
  401a2e:	66 90                	xchg   ax,ax
  401a30:	8d 7e db             	lea    edi,[rsi-0x25]
  401a33:	40 80 ff 53          	cmp    dil,0x53
  401a37:	77 17                	ja     401a50 <format_string_loop.constprop.0+0x140>
  401a39:	48 8d 05 a8 16 00 00 	lea    rax,[rip+0x16a8]        # 4030e8 <putchar_+0x638>
  401a40:	40 0f b6 ff          	movzx  edi,dil
  401a44:	48 63 3c b8          	movsxd rdi,DWORD PTR [rax+rdi*4]
  401a48:	48 01 c7             	add    rdi,rax
  401a4b:	3e ff e7             	notrack jmp rdi
  401a4e:	66 90                	xchg   ax,ax
  401a50:	41 8b 54 24 18       	mov    edx,DWORD PTR [r12+0x18]
  401a55:	8d 4a 01             	lea    ecx,[rdx+0x1]
  401a58:	41 89 4c 24 18       	mov    DWORD PTR [r12+0x18],ecx
  401a5d:	41 3b 54 24 1c       	cmp    edx,DWORD PTR [r12+0x1c]
  401a62:	73 1c                	jae    401a80 <format_string_loop.constprop.0+0x170>
  401a64:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  401a68:	48 85 c9             	test   rcx,rcx
  401a6b:	0f 84 cf 09 00 00    	je     402440 <format_string_loop.constprop.0+0xb30>
  401a71:	4d 8b 44 24 08       	mov    r8,QWORD PTR [r12+0x8]
  401a76:	40 0f be fe          	movsx  edi,sil
  401a7a:	4c 89 c6             	mov    rsi,r8
  401a7d:	ff d1                	call   rcx
  401a7f:	90                   	nop
  401a80:	0f b6 13             	movzx  edx,BYTE PTR [rbx]
  401a83:	84 d2                	test   dl,dl
  401a85:	0f 85 b5 fe ff ff    	jne    401940 <format_string_loop.constprop.0+0x30>
  401a8b:	48 83 c4 38          	add    rsp,0x38
  401a8f:	5b                   	pop    rbx
  401a90:	5d                   	pop    rbp
  401a91:	41 5c                	pop    r12
  401a93:	41 5d                	pop    r13
  401a95:	41 5e                	pop    r14
  401a97:	41 5f                	pop    r15
  401a99:	c3                   	ret    
  401a9a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  401aa0:	83 c9 02             	or     ecx,0x2
  401aa3:	0f be 33             	movsx  esi,BYTE PTR [rbx]
  401aa6:	49 89 de             	mov    r14,rbx
  401aa9:	e9 b2 fe ff ff       	jmp    401960 <format_string_loop.constprop.0+0x50>
  401aae:	66 90                	xchg   ax,ax
  401ab0:	83 c9 04             	or     ecx,0x4
  401ab3:	eb ee                	jmp    401aa3 <format_string_loop.constprop.0+0x193>
  401ab5:	0f 1f 00             	nop    DWORD PTR [rax]
  401ab8:	83 c9 10             	or     ecx,0x10
  401abb:	eb e6                	jmp    401aa3 <format_string_loop.constprop.0+0x193>
  401abd:	0f 1f 00             	nop    DWORD PTR [rax]
  401ac0:	83 c9 08             	or     ecx,0x8
  401ac3:	eb de                	jmp    401aa3 <format_string_loop.constprop.0+0x193>
  401ac5:	0f 1f 00             	nop    DWORD PTR [rax]
  401ac8:	83 c9 01             	or     ecx,0x1
  401acb:	eb d6                	jmp    401aa3 <format_string_loop.constprop.0+0x193>
  401acd:	0f 1f 00             	nop    DWORD PTR [rax]
  401ad0:	41 0f b6 76 01       	movzx  esi,BYTE PTR [r14+0x1]
  401ad5:	80 cd 02             	or     ch,0x2
  401ad8:	40 84 f6             	test   sil,sil
  401adb:	74 ae                	je     401a8b <format_string_loop.constprop.0+0x17b>
  401add:	48 83 c3 01          	add    rbx,0x1
  401ae1:	e9 4a ff ff ff       	jmp    401a30 <format_string_loop.constprop.0+0x120>
  401ae6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  401aed:	00 00 00 
  401af0:	40 80 fe 64          	cmp    sil,0x64
  401af4:	0f 84 2a 06 00 00    	je     402124 <format_string_loop.constprop.0+0x814>
  401afa:	40 80 fe 69          	cmp    sil,0x69
  401afe:	0f 84 20 06 00 00    	je     402124 <format_string_loop.constprop.0+0x814>
  401b04:	89 f7                	mov    edi,esi
  401b06:	83 e7 df             	and    edi,0xffffffdf
  401b09:	40 80 ff 58          	cmp    dil,0x58
  401b0d:	0f 84 f6 05 00 00    	je     402109 <format_string_loop.constprop.0+0x7f9>
  401b13:	41 bb 08 00 00 00    	mov    r11d,0x8
  401b19:	40 80 fe 6f          	cmp    sil,0x6f
  401b1d:	74 15                	je     401b34 <format_string_loop.constprop.0+0x224>
  401b1f:	41 bb 02 00 00 00    	mov    r11d,0x2
  401b25:	40 80 fe 62          	cmp    sil,0x62
  401b29:	74 09                	je     401b34 <format_string_loop.constprop.0+0x224>
  401b2b:	83 e1 ef             	and    ecx,0xffffffef
  401b2e:	41 bb 0a 00 00 00    	mov    r11d,0xa
  401b34:	89 ce                	mov    esi,ecx
  401b36:	83 e6 fe             	and    esi,0xfffffffe
  401b39:	f6 c5 08             	test   ch,0x8
  401b3c:	0f 45 ce             	cmovne ecx,esi
  401b3f:	41 8b 37             	mov    esi,DWORD PTR [r15]
  401b42:	89 cf                	mov    edi,ecx
  401b44:	81 e7 00 04 00 00    	and    edi,0x400
  401b4a:	f6 c5 40             	test   ch,0x40
  401b4d:	0f 84 5d 05 00 00    	je     4020b0 <format_string_loop.constprop.0+0x7a0>
  401b53:	85 ff                	test   edi,edi
  401b55:	0f 85 3e 07 00 00    	jne    402299 <format_string_loop.constprop.0+0x989>
  401b5b:	f6 c5 02             	test   ch,0x2
  401b5e:	0f 85 35 07 00 00    	jne    402299 <format_string_loop.constprop.0+0x989>
  401b64:	f6 c1 40             	test   cl,0x40
  401b67:	0f 84 e8 09 00 00    	je     402555 <format_string_loop.constprop.0+0xc45>
  401b6d:	83 fe 2f             	cmp    esi,0x2f
  401b70:	0f 87 3b 0a 00 00    	ja     4025b1 <format_string_loop.constprop.0+0xca1>
  401b76:	89 f7                	mov    edi,esi
  401b78:	83 c6 08             	add    esi,0x8
  401b7b:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  401b7f:	41 89 37             	mov    DWORD PTR [r15],esi
  401b82:	0f be 3f             	movsx  edi,BYTE PTR [rdi]
  401b85:	4c 63 c7             	movsxd r8,edi
  401b88:	41 89 fe             	mov    r14d,edi
  401b8b:	41 89 d1             	mov    r9d,edx
  401b8e:	4c 89 c6             	mov    rsi,r8
  401b91:	41 c1 ee 1f          	shr    r14d,0x1f
  401b95:	48 f7 de             	neg    rsi
  401b98:	85 ff                	test   edi,edi
  401b9a:	44 89 f2             	mov    edx,r14d
  401b9d:	4c 89 e7             	mov    rdi,r12
  401ba0:	49 0f 4f f0          	cmovg  rsi,r8
  401ba4:	48 83 ec 08          	sub    rsp,0x8
  401ba8:	45 89 d0             	mov    r8d,r10d
  401bab:	51                   	push   rcx
  401bac:	44 89 d9             	mov    ecx,r11d
  401baf:	e8 9c ed ff ff       	call   400950 <print_integer>
  401bb4:	41 5a                	pop    r10
  401bb6:	41 5b                	pop    r11
  401bb8:	e9 c3 fe ff ff       	jmp    401a80 <format_string_loop.constprop.0+0x170>
  401bbd:	41 0f b6 76 01       	movzx  esi,BYTE PTR [r14+0x1]
  401bc2:	40 84 f6             	test   sil,sil
  401bc5:	0f 84 c0 fe ff ff    	je     401a8b <format_string_loop.constprop.0+0x17b>
  401bcb:	40 80 fe 68          	cmp    sil,0x68
  401bcf:	0f 84 3b 04 00 00    	je     402010 <format_string_loop.constprop.0+0x700>
  401bd5:	80 c9 80             	or     cl,0x80
  401bd8:	48 83 c3 01          	add    rbx,0x1
  401bdc:	e9 4f fe ff ff       	jmp    401a30 <format_string_loop.constprop.0+0x120>
  401be1:	41 0f b6 76 01       	movzx  esi,BYTE PTR [r14+0x1]
  401be6:	40 84 f6             	test   sil,sil
  401be9:	0f 84 9c fe ff ff    	je     401a8b <format_string_loop.constprop.0+0x17b>
  401bef:	40 80 fe 6c          	cmp    sil,0x6c
  401bf3:	0f 84 31 04 00 00    	je     40202a <format_string_loop.constprop.0+0x71a>
  401bf9:	80 cd 02             	or     ch,0x2
  401bfc:	48 83 c3 01          	add    rbx,0x1
  401c00:	e9 2b fe ff ff       	jmp    401a30 <format_string_loop.constprop.0+0x120>
  401c05:	41 89 f0             	mov    r8d,esi
  401c08:	89 cf                	mov    edi,ecx
  401c0a:	41 83 e0 df          	and    r8d,0xffffffdf
  401c0e:	81 cf 00 10 00 00    	or     edi,0x1000
  401c14:	41 80 f8 47          	cmp    r8b,0x47
  401c18:	0f 44 cf             	cmove  ecx,edi
  401c1b:	83 e6 fd             	and    esi,0xfffffffd
  401c1e:	89 cf                	mov    edi,ecx
  401c20:	83 cf 20             	or     edi,0x20
  401c23:	40 80 fe 45          	cmp    sil,0x45
  401c27:	41 8b 77 04          	mov    esi,DWORD PTR [r15+0x4]
  401c2b:	0f 44 cf             	cmove  ecx,edi
  401c2e:	81 fe af 00 00 00    	cmp    esi,0xaf
  401c34:	0f 87 06 04 00 00    	ja     402040 <format_string_loop.constprop.0+0x730>
  401c3a:	89 f7                	mov    edi,esi
  401c3c:	83 c6 10             	add    esi,0x10
  401c3f:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  401c43:	41 89 77 04          	mov    DWORD PTR [r15+0x4],esi
  401c47:	f2 0f 10 07          	movsd  xmm0,QWORD PTR [rdi]
  401c4b:	41 b8 01 00 00 00    	mov    r8d,0x1
  401c51:	44 89 d6             	mov    esi,r10d
  401c54:	4c 89 e7             	mov    rdi,r12
  401c57:	e8 c4 fa ff ff       	call   401720 <print_floating_point>
  401c5c:	e9 1f fe ff ff       	jmp    401a80 <format_string_loop.constprop.0+0x170>
  401c61:	89 cf                	mov    edi,ecx
  401c63:	83 cf 20             	or     edi,0x20
  401c66:	40 80 fe 46          	cmp    sil,0x46
  401c6a:	41 8b 77 04          	mov    esi,DWORD PTR [r15+0x4]
  401c6e:	0f 44 cf             	cmove  ecx,edi
  401c71:	81 fe af 00 00 00    	cmp    esi,0xaf
  401c77:	0f 87 af 04 00 00    	ja     40212c <format_string_loop.constprop.0+0x81c>
  401c7d:	89 f7                	mov    edi,esi
  401c7f:	83 c6 10             	add    esi,0x10
  401c82:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  401c86:	41 89 77 04          	mov    DWORD PTR [r15+0x4],esi
  401c8a:	f2 0f 10 07          	movsd  xmm0,QWORD PTR [rdi]
  401c8e:	45 31 c0             	xor    r8d,r8d
  401c91:	44 89 d6             	mov    esi,r10d
  401c94:	4c 89 e7             	mov    rdi,r12
  401c97:	e8 84 fa ff ff       	call   401720 <print_floating_point>
  401c9c:	e9 df fd ff ff       	jmp    401a80 <format_string_loop.constprop.0+0x170>
  401ca1:	41 8b 37             	mov    esi,DWORD PTR [r15]
  401ca4:	83 fe 2f             	cmp    esi,0x2f
  401ca7:	0f 87 a4 03 00 00    	ja     402051 <format_string_loop.constprop.0+0x741>
  401cad:	89 f7                	mov    edi,esi
  401caf:	83 c6 08             	add    esi,0x8
  401cb2:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  401cb6:	41 89 37             	mov    DWORD PTR [r15],esi
  401cb9:	48 8b 2f             	mov    rbp,QWORD PTR [rdi]
  401cbc:	48 85 ed             	test   rbp,rbp
  401cbf:	0f 84 a4 03 00 00    	je     402069 <format_string_loop.constprop.0+0x759>
  401cc5:	44 0f b6 4d 00       	movzx  r9d,BYTE PTR [rbp+0x0]
  401cca:	44 89 ce             	mov    esi,r9d
  401ccd:	45 85 d2             	test   r10d,r10d
  401cd0:	0f 85 35 05 00 00    	jne    40220b <format_string_loop.constprop.0+0x8fb>
  401cd6:	bf fe ff ff 7f       	mov    edi,0x7ffffffe
  401cdb:	45 84 c9             	test   r9b,r9b
  401cde:	0f 84 82 09 00 00    	je     402666 <format_string_loop.constprop.0+0xd56>
  401ce4:	83 c7 01             	add    edi,0x1
  401ce7:	49 89 ee             	mov    r14,rbp
  401cea:	48 01 ef             	add    rdi,rbp
  401ced:	eb 06                	jmp    401cf5 <format_string_loop.constprop.0+0x3e5>
  401cef:	90                   	nop
  401cf0:	49 39 fe             	cmp    r14,rdi
  401cf3:	74 0a                	je     401cff <format_string_loop.constprop.0+0x3ef>
  401cf5:	49 83 c6 01          	add    r14,0x1
  401cf9:	41 80 3e 00          	cmp    BYTE PTR [r14],0x0
  401cfd:	75 f1                	jne    401cf0 <format_string_loop.constprop.0+0x3e0>
  401cff:	44 89 f0             	mov    eax,r14d
  401d02:	29 e8                	sub    eax,ebp
  401d04:	89 44 24 10          	mov    DWORD PTR [rsp+0x10],eax
  401d08:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  401d0c:	41 89 ce             	mov    r14d,ecx
  401d0f:	44 39 d0             	cmp    eax,r10d
  401d12:	89 c7                	mov    edi,eax
  401d14:	41 0f 47 fa          	cmova  edi,r10d
  401d18:	41 81 e6 00 08 00 00 	and    r14d,0x800
  401d1f:	0f 44 f8             	cmove  edi,eax
  401d22:	83 e1 02             	and    ecx,0x2
  401d25:	89 4c 24 1c          	mov    DWORD PTR [rsp+0x1c],ecx
  401d29:	89 7c 24 10          	mov    DWORD PTR [rsp+0x10],edi
  401d2d:	0f 84 1b 07 00 00    	je     40244e <format_string_loop.constprop.0+0xb3e>
  401d33:	45 84 c9             	test   r9b,r9b
  401d36:	0f 84 92 00 00 00    	je     401dce <format_string_loop.constprop.0+0x4be>
  401d3c:	45 85 f6             	test   r14d,r14d
  401d3f:	0f 94 44 24 08       	sete   BYTE PTR [rsp+0x8]
  401d44:	0f b6 44 24 08       	movzx  eax,BYTE PTR [rsp+0x8]
  401d49:	45 85 d2             	test   r10d,r10d
  401d4c:	75 04                	jne    401d52 <format_string_loop.constprop.0+0x442>
  401d4e:	84 c0                	test   al,al
  401d50:	74 7c                	je     401dce <format_string_loop.constprop.0+0x4be>
  401d52:	4c 89 7c 24 20       	mov    QWORD PTR [rsp+0x20],r15
  401d57:	49 89 ee             	mov    r14,rbp
  401d5a:	41 89 d7             	mov    r15d,edx
  401d5d:	48 89 5c 24 28       	mov    QWORD PTR [rsp+0x28],rbx
  401d62:	44 89 d3             	mov    ebx,r10d
  401d65:	0f 1f 00             	nop    DWORD PTR [rax]
  401d68:	41 8b 44 24 18       	mov    eax,DWORD PTR [r12+0x18]
  401d6d:	49 83 c6 01          	add    r14,0x1
  401d71:	8d 78 01             	lea    edi,[rax+0x1]
  401d74:	41 89 7c 24 18       	mov    DWORD PTR [r12+0x18],edi
  401d79:	41 3b 44 24 1c       	cmp    eax,DWORD PTR [r12+0x1c]
  401d7e:	73 1c                	jae    401d9c <format_string_loop.constprop.0+0x48c>
  401d80:	4d 8b 04 24          	mov    r8,QWORD PTR [r12]
  401d84:	4d 85 c0             	test   r8,r8
  401d87:	0f 84 c3 05 00 00    	je     402350 <format_string_loop.constprop.0+0xa40>
  401d8d:	4d 8b 4c 24 08       	mov    r9,QWORD PTR [r12+0x8]
  401d92:	40 0f be fe          	movsx  edi,sil
  401d96:	4c 89 ce             	mov    rsi,r9
  401d99:	41 ff d0             	call   r8
  401d9c:	41 0f b6 36          	movzx  esi,BYTE PTR [r14]
  401da0:	40 84 f6             	test   sil,sil
  401da3:	74 10                	je     401db5 <format_string_loop.constprop.0+0x4a5>
  401da5:	89 d8                	mov    eax,ebx
  401da7:	44 29 f0             	sub    eax,r14d
  401daa:	01 e8                	add    eax,ebp
  401dac:	75 ba                	jne    401d68 <format_string_loop.constprop.0+0x458>
  401dae:	80 7c 24 08 00       	cmp    BYTE PTR [rsp+0x8],0x0
  401db3:	75 b3                	jne    401d68 <format_string_loop.constprop.0+0x458>
  401db5:	8b 4c 24 1c          	mov    ecx,DWORD PTR [rsp+0x1c]
  401db9:	44 89 fa             	mov    edx,r15d
  401dbc:	48 8b 5c 24 28       	mov    rbx,QWORD PTR [rsp+0x28]
  401dc1:	4c 8b 7c 24 20       	mov    r15,QWORD PTR [rsp+0x20]
  401dc6:	85 c9                	test   ecx,ecx
  401dc8:	0f 84 b2 fc ff ff    	je     401a80 <format_string_loop.constprop.0+0x170>
  401dce:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  401dd2:	41 89 d6             	mov    r14d,edx
  401dd5:	8d 68 01             	lea    ebp,[rax+0x1]
  401dd8:	39 c2                	cmp    edx,eax
  401dda:	0f 87 22 05 00 00    	ja     402302 <format_string_loop.constprop.0+0x9f2>
  401de0:	e9 9b fc ff ff       	jmp    401a80 <format_string_loop.constprop.0+0x170>
  401de5:	0f 1f 00             	nop    DWORD PTR [rax]
  401de8:	41 8b 54 24 18       	mov    edx,DWORD PTR [r12+0x18]
  401ded:	8d 4a 01             	lea    ecx,[rdx+0x1]
  401df0:	41 89 4c 24 18       	mov    DWORD PTR [r12+0x18],ecx
  401df5:	41 3b 54 24 1c       	cmp    edx,DWORD PTR [r12+0x1c]
  401dfa:	0f 83 80 fc ff ff    	jae    401a80 <format_string_loop.constprop.0+0x170>
  401e00:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  401e04:	48 85 c9             	test   rcx,rcx
  401e07:	0f 84 25 06 00 00    	je     402432 <format_string_loop.constprop.0+0xb22>
  401e0d:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  401e12:	bf 25 00 00 00       	mov    edi,0x25
  401e17:	ff d1                	call   rcx
  401e19:	e9 62 fc ff ff       	jmp    401a80 <format_string_loop.constprop.0+0x170>
  401e1e:	41 8b 74 24 18       	mov    esi,DWORD PTR [r12+0x18]
  401e23:	41 8b 17             	mov    edx,DWORD PTR [r15]
  401e26:	f6 c1 40             	test   cl,0x40
  401e29:	0f 84 58 02 00 00    	je     402087 <format_string_loop.constprop.0+0x777>
  401e2f:	83 fa 2f             	cmp    edx,0x2f
  401e32:	0f 86 e5 03 00 00    	jbe    40221d <format_string_loop.constprop.0+0x90d>
  401e38:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  401e3c:	48 8d 51 08          	lea    rdx,[rcx+0x8]
  401e40:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  401e44:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  401e47:	40 88 32             	mov    BYTE PTR [rdx],sil
  401e4a:	e9 31 fc ff ff       	jmp    401a80 <format_string_loop.constprop.0+0x170>
  401e4f:	83 e1 02             	and    ecx,0x2
  401e52:	41 8b 74 24 18       	mov    esi,DWORD PTR [r12+0x18]
  401e57:	41 8b 7c 24 1c       	mov    edi,DWORD PTR [r12+0x1c]
  401e5c:	89 cd                	mov    ebp,ecx
  401e5e:	0f 84 fa 04 00 00    	je     40235e <format_string_loop.constprop.0+0xa4e>
  401e64:	41 8b 0f             	mov    ecx,DWORD PTR [r15]
  401e67:	83 f9 2f             	cmp    ecx,0x2f
  401e6a:	0f 87 06 03 00 00    	ja     402176 <format_string_loop.constprop.0+0x866>
  401e70:	41 89 c8             	mov    r8d,ecx
  401e73:	83 c1 08             	add    ecx,0x8
  401e76:	4d 03 47 10          	add    r8,QWORD PTR [r15+0x10]
  401e7a:	41 89 0f             	mov    DWORD PTR [r15],ecx
  401e7d:	41 8b 08             	mov    ecx,DWORD PTR [r8]
  401e80:	44 8d 46 01          	lea    r8d,[rsi+0x1]
  401e84:	45 89 44 24 18       	mov    DWORD PTR [r12+0x18],r8d
  401e89:	39 fe                	cmp    esi,edi
  401e8b:	0f 83 05 03 00 00    	jae    402196 <format_string_loop.constprop.0+0x886>
  401e91:	41 89 c8             	mov    r8d,ecx
  401e94:	0f be f9             	movsx  edi,cl
  401e97:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  401e9b:	c7 44 24 08 01 00 00 	mov    DWORD PTR [rsp+0x8],0x1
  401ea2:	00 
  401ea3:	48 85 c9             	test   rcx,rcx
  401ea6:	0f 84 60 05 00 00    	je     40240c <format_string_loop.constprop.0+0xafc>
  401eac:	89 54 24 10          	mov    DWORD PTR [rsp+0x10],edx
  401eb0:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  401eb5:	ff d1                	call   rcx
  401eb7:	8b 54 24 10          	mov    edx,DWORD PTR [rsp+0x10]
  401ebb:	85 ed                	test   ebp,ebp
  401ebd:	0f 84 bd fb ff ff    	je     401a80 <format_string_loop.constprop.0+0x170>
  401ec3:	8b 44 24 08          	mov    eax,DWORD PTR [rsp+0x8]
  401ec7:	8d 68 01             	lea    ebp,[rax+0x1]
  401eca:	e9 d4 02 00 00       	jmp    4021a3 <format_string_loop.constprop.0+0x893>
  401ecf:	90                   	nop
  401ed0:	41 8b 17             	mov    edx,DWORD PTR [r15]
  401ed3:	81 c9 01 20 00 00    	or     ecx,0x2001
  401ed9:	83 fa 2f             	cmp    edx,0x2f
  401edc:	0f 87 5b 02 00 00    	ja     40213d <format_string_loop.constprop.0+0x82d>
  401ee2:	89 d6                	mov    esi,edx
  401ee4:	83 c2 08             	add    edx,0x8
  401ee7:	49 03 77 10          	add    rsi,QWORD PTR [r15+0x10]
  401eeb:	41 89 17             	mov    DWORD PTR [r15],edx
  401eee:	48 8b 36             	mov    rsi,QWORD PTR [rsi]
  401ef1:	48 85 f6             	test   rsi,rsi
  401ef4:	0f 84 5b 02 00 00    	je     402155 <format_string_loop.constprop.0+0x845>
  401efa:	48 83 ec 08          	sub    rsp,0x8
  401efe:	31 d2                	xor    edx,edx
  401f00:	41 b9 12 00 00 00    	mov    r9d,0x12
  401f06:	45 89 d0             	mov    r8d,r10d
  401f09:	51                   	push   rcx
  401f0a:	4c 89 e7             	mov    rdi,r12
  401f0d:	b9 10 00 00 00       	mov    ecx,0x10
  401f12:	e8 39 ea ff ff       	call   400950 <print_integer>
  401f17:	58                   	pop    rax
  401f18:	5a                   	pop    rdx
  401f19:	e9 62 fb ff ff       	jmp    401a80 <format_string_loop.constprop.0+0x170>
  401f1e:	66 90                	xchg   ax,ax
  401f20:	41 8b 4c 24 18       	mov    ecx,DWORD PTR [r12+0x18]
  401f25:	8d 71 01             	lea    esi,[rcx+0x1]
  401f28:	41 89 74 24 18       	mov    DWORD PTR [r12+0x18],esi
  401f2d:	41 3b 4c 24 1c       	cmp    ecx,DWORD PTR [r12+0x1c]
  401f32:	73 18                	jae    401f4c <format_string_loop.constprop.0+0x63c>
  401f34:	4d 8b 04 24          	mov    r8,QWORD PTR [r12]
  401f38:	4d 85 c0             	test   r8,r8
  401f3b:	0f 84 7f 00 00 00    	je     401fc0 <format_string_loop.constprop.0+0x6b0>
  401f41:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  401f46:	0f be fa             	movsx  edi,dl
  401f49:	41 ff d0             	call   r8
  401f4c:	4c 89 f3             	mov    rbx,r14
  401f4f:	e9 2c fb ff ff       	jmp    401a80 <format_string_loop.constprop.0+0x170>
  401f54:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401f58:	43 8d 04 92          	lea    eax,[r10+r10*4]
  401f5c:	48 83 c7 01          	add    rdi,0x1
  401f60:	44 8d 54 46 d0       	lea    r10d,[rsi+rax*2-0x30]
  401f65:	0f be 37             	movsx  esi,BYTE PTR [rdi]
  401f68:	8d 46 d0             	lea    eax,[rsi-0x30]
  401f6b:	3c 09                	cmp    al,0x9
  401f6d:	76 e9                	jbe    401f58 <format_string_loop.constprop.0+0x648>
  401f6f:	e9 aa fa ff ff       	jmp    401a1e <format_string_loop.constprop.0+0x10e>
  401f74:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401f78:	41 8b 17             	mov    edx,DWORD PTR [r15]
  401f7b:	83 fa 2f             	cmp    edx,0x2f
  401f7e:	77 30                	ja     401fb0 <format_string_loop.constprop.0+0x6a0>
  401f80:	89 d6                	mov    esi,edx
  401f82:	83 c2 08             	add    edx,0x8
  401f85:	49 03 77 10          	add    rsi,QWORD PTR [r15+0x10]
  401f89:	41 89 17             	mov    DWORD PTR [r15],edx
  401f8c:	8b 16                	mov    edx,DWORD PTR [rsi]
  401f8e:	85 d2                	test   edx,edx
  401f90:	79 05                	jns    401f97 <format_string_loop.constprop.0+0x687>
  401f92:	83 c9 02             	or     ecx,0x2
  401f95:	f7 da                	neg    edx
  401f97:	41 0f b6 76 01       	movzx  esi,BYTE PTR [r14+0x1]
  401f9c:	40 84 f6             	test   sil,sil
  401f9f:	0f 84 e6 fa ff ff    	je     401a8b <format_string_loop.constprop.0+0x17b>
  401fa5:	49 89 de             	mov    r14,rbx
  401fa8:	e9 ea f9 ff ff       	jmp    401997 <format_string_loop.constprop.0+0x87>
  401fad:	0f 1f 00             	nop    DWORD PTR [rax]
  401fb0:	49 8b 77 08          	mov    rsi,QWORD PTR [r15+0x8]
  401fb4:	48 8d 56 08          	lea    rdx,[rsi+0x8]
  401fb8:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  401fbc:	eb ce                	jmp    401f8c <format_string_loop.constprop.0+0x67c>
  401fbe:	66 90                	xchg   ax,ax
  401fc0:	49 8b 74 24 10       	mov    rsi,QWORD PTR [r12+0x10]
  401fc5:	88 14 0e             	mov    BYTE PTR [rsi+rcx*1],dl
  401fc8:	e9 7f ff ff ff       	jmp    401f4c <format_string_loop.constprop.0+0x63c>
  401fcd:	0f 1f 00             	nop    DWORD PTR [rax]
  401fd0:	41 8b 37             	mov    esi,DWORD PTR [r15]
  401fd3:	83 fe 2f             	cmp    esi,0x2f
  401fd6:	0f 87 1e 02 00 00    	ja     4021fa <format_string_loop.constprop.0+0x8ea>
  401fdc:	89 f7                	mov    edi,esi
  401fde:	83 c6 08             	add    esi,0x8
  401fe1:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  401fe5:	41 89 37             	mov    DWORD PTR [r15],esi
  401fe8:	44 8b 17             	mov    r10d,DWORD PTR [rdi]
  401feb:	31 f6                	xor    esi,esi
  401fed:	49 8d 7e 02          	lea    rdi,[r14+0x2]
  401ff1:	45 85 d2             	test   r10d,r10d
  401ff4:	44 0f 48 d6          	cmovs  r10d,esi
  401ff8:	41 0f b6 76 02       	movzx  esi,BYTE PTR [r14+0x2]
  401ffd:	40 84 f6             	test   sil,sil
  402000:	0f 85 18 fa ff ff    	jne    401a1e <format_string_loop.constprop.0+0x10e>
  402006:	e9 80 fa ff ff       	jmp    401a8b <format_string_loop.constprop.0+0x17b>
  40200b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  402010:	41 0f b6 76 02       	movzx  esi,BYTE PTR [r14+0x2]
  402015:	80 c9 c0             	or     cl,0xc0
  402018:	40 84 f6             	test   sil,sil
  40201b:	0f 84 6a fa ff ff    	je     401a8b <format_string_loop.constprop.0+0x17b>
  402021:	49 8d 5e 03          	lea    rbx,[r14+0x3]
  402025:	e9 06 fa ff ff       	jmp    401a30 <format_string_loop.constprop.0+0x120>
  40202a:	41 0f b6 76 02       	movzx  esi,BYTE PTR [r14+0x2]
  40202f:	80 cd 06             	or     ch,0x6
  402032:	40 84 f6             	test   sil,sil
  402035:	75 ea                	jne    402021 <format_string_loop.constprop.0+0x711>
  402037:	e9 4f fa ff ff       	jmp    401a8b <format_string_loop.constprop.0+0x17b>
  40203c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402040:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  402044:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  402048:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  40204c:	e9 f6 fb ff ff       	jmp    401c47 <format_string_loop.constprop.0+0x337>
  402051:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  402055:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  402059:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  40205d:	48 8b 2f             	mov    rbp,QWORD PTR [rdi]
  402060:	48 85 ed             	test   rbp,rbp
  402063:	0f 85 5c fc ff ff    	jne    401cc5 <format_string_loop.constprop.0+0x3b5>
  402069:	41 89 c8             	mov    r8d,ecx
  40206c:	48 8d 35 d7 0f 00 00 	lea    rsi,[rip+0xfd7]        # 40304a <putchar_+0x59a>
  402073:	89 d1                	mov    ecx,edx
  402075:	4c 89 e7             	mov    rdi,r12
  402078:	ba 06 00 00 00       	mov    edx,0x6
  40207d:	e8 8e e7 ff ff       	call   400810 <out_rev_>
  402082:	e9 f9 f9 ff ff       	jmp    401a80 <format_string_loop.constprop.0+0x170>
  402087:	f6 c1 80             	test   cl,0x80
  40208a:	0f 84 9e 01 00 00    	je     40222e <format_string_loop.constprop.0+0x91e>
  402090:	83 fa 2f             	cmp    edx,0x2f
  402093:	0f 87 ab 04 00 00    	ja     402544 <format_string_loop.constprop.0+0xc34>
  402099:	89 d1                	mov    ecx,edx
  40209b:	83 c2 08             	add    edx,0x8
  40209e:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  4020a2:	41 89 17             	mov    DWORD PTR [r15],edx
  4020a5:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  4020a8:	66 89 32             	mov    WORD PTR [rdx],si
  4020ab:	e9 d0 f9 ff ff       	jmp    401a80 <format_string_loop.constprop.0+0x170>
  4020b0:	41 89 c8             	mov    r8d,ecx
  4020b3:	41 83 e0 f3          	and    r8d,0xfffffff3
  4020b7:	85 ff                	test   edi,edi
  4020b9:	0f 85 a0 01 00 00    	jne    40225f <format_string_loop.constprop.0+0x94f>
  4020bf:	f6 c5 02             	test   ch,0x2
  4020c2:	0f 85 97 01 00 00    	jne    40225f <format_string_loop.constprop.0+0x94f>
  4020c8:	f6 c1 40             	test   cl,0x40
  4020cb:	0f 84 aa 04 00 00    	je     40257b <format_string_loop.constprop.0+0xc6b>
  4020d1:	83 fe 2f             	cmp    esi,0x2f
  4020d4:	0f 87 00 05 00 00    	ja     4025da <format_string_loop.constprop.0+0xcca>
  4020da:	89 f1                	mov    ecx,esi
  4020dc:	83 c6 08             	add    esi,0x8
  4020df:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  4020e3:	41 89 37             	mov    DWORD PTR [r15],esi
  4020e6:	0f b6 31             	movzx  esi,BYTE PTR [rcx]
  4020e9:	48 83 ec 08          	sub    rsp,0x8
  4020ed:	41 89 d1             	mov    r9d,edx
  4020f0:	4c 89 e7             	mov    rdi,r12
  4020f3:	44 89 d9             	mov    ecx,r11d
  4020f6:	41 50                	push   r8
  4020f8:	31 d2                	xor    edx,edx
  4020fa:	45 89 d0             	mov    r8d,r10d
  4020fd:	e8 4e e8 ff ff       	call   400950 <print_integer>
  402102:	5e                   	pop    rsi
  402103:	5f                   	pop    rdi
  402104:	e9 77 f9 ff ff       	jmp    401a80 <format_string_loop.constprop.0+0x170>
  402109:	89 cf                	mov    edi,ecx
  40210b:	83 c9 20             	or     ecx,0x20
  40210e:	40 80 fe 58          	cmp    sil,0x58
  402112:	41 bb 10 00 00 00    	mov    r11d,0x10
  402118:	89 cd                	mov    ebp,ecx
  40211a:	89 f9                	mov    ecx,edi
  40211c:	0f 44 cd             	cmove  ecx,ebp
  40211f:	e9 10 fa ff ff       	jmp    401b34 <format_string_loop.constprop.0+0x224>
  402124:	80 cd 40             	or     ch,0x40
  402127:	e9 d8 f9 ff ff       	jmp    401b04 <format_string_loop.constprop.0+0x1f4>
  40212c:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  402130:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  402134:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  402138:	e9 4d fb ff ff       	jmp    401c8a <format_string_loop.constprop.0+0x37a>
  40213d:	49 8b 77 08          	mov    rsi,QWORD PTR [r15+0x8]
  402141:	48 8d 56 08          	lea    rdx,[rsi+0x8]
  402145:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  402149:	48 8b 36             	mov    rsi,QWORD PTR [rsi]
  40214c:	48 85 f6             	test   rsi,rsi
  40214f:	0f 85 a5 fd ff ff    	jne    401efa <format_string_loop.constprop.0+0x5ea>
  402155:	41 89 c8             	mov    r8d,ecx
  402158:	ba 05 00 00 00       	mov    edx,0x5
  40215d:	b9 12 00 00 00       	mov    ecx,0x12
  402162:	4c 89 e7             	mov    rdi,r12
  402165:	48 8d 35 e5 0e 00 00 	lea    rsi,[rip+0xee5]        # 403051 <putchar_+0x5a1>
  40216c:	e8 9f e6 ff ff       	call   400810 <out_rev_>
  402171:	e9 0a f9 ff ff       	jmp    401a80 <format_string_loop.constprop.0+0x170>
  402176:	4d 8b 47 08          	mov    r8,QWORD PTR [r15+0x8]
  40217a:	49 8d 48 08          	lea    rcx,[r8+0x8]
  40217e:	49 89 4f 08          	mov    QWORD PTR [r15+0x8],rcx
  402182:	41 8b 08             	mov    ecx,DWORD PTR [r8]
  402185:	44 8d 46 01          	lea    r8d,[rsi+0x1]
  402189:	45 89 44 24 18       	mov    DWORD PTR [r12+0x18],r8d
  40218e:	39 fe                	cmp    esi,edi
  402190:	0f 82 fb fc ff ff    	jb     401e91 <format_string_loop.constprop.0+0x581>
  402196:	c7 44 24 08 01 00 00 	mov    DWORD PTR [rsp+0x8],0x1
  40219d:	00 
  40219e:	bd 02 00 00 00       	mov    ebp,0x2
  4021a3:	41 89 d6             	mov    r14d,edx
  4021a6:	3b 54 24 08          	cmp    edx,DWORD PTR [rsp+0x8]
  4021aa:	77 26                	ja     4021d2 <format_string_loop.constprop.0+0x8c2>
  4021ac:	e9 cf f8 ff ff       	jmp    401a80 <format_string_loop.constprop.0+0x170>
  4021b1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4021b8:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  4021bd:	bf 20 00 00 00       	mov    edi,0x20
  4021c2:	ff d1                	call   rcx
  4021c4:	8d 45 01             	lea    eax,[rbp+0x1]
  4021c7:	41 39 ee             	cmp    r14d,ebp
  4021ca:	0f 86 b0 f8 ff ff    	jbe    401a80 <format_string_loop.constprop.0+0x170>
  4021d0:	89 c5                	mov    ebp,eax
  4021d2:	41 8b 44 24 18       	mov    eax,DWORD PTR [r12+0x18]
  4021d7:	8d 48 01             	lea    ecx,[rax+0x1]
  4021da:	41 89 4c 24 18       	mov    DWORD PTR [r12+0x18],ecx
  4021df:	41 3b 44 24 1c       	cmp    eax,DWORD PTR [r12+0x1c]
  4021e4:	73 de                	jae    4021c4 <format_string_loop.constprop.0+0x8b4>
  4021e6:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  4021ea:	48 85 c9             	test   rcx,rcx
  4021ed:	75 c9                	jne    4021b8 <format_string_loop.constprop.0+0x8a8>
  4021ef:	49 8b 54 24 10       	mov    rdx,QWORD PTR [r12+0x10]
  4021f4:	c6 04 02 20          	mov    BYTE PTR [rdx+rax*1],0x20
  4021f8:	eb ca                	jmp    4021c4 <format_string_loop.constprop.0+0x8b4>
  4021fa:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  4021fe:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  402202:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  402206:	e9 dd fd ff ff       	jmp    401fe8 <format_string_loop.constprop.0+0x6d8>
  40220b:	45 84 c9             	test   r9b,r9b
  40220e:	0f 84 52 04 00 00    	je     402666 <format_string_loop.constprop.0+0xd56>
  402214:	41 8d 7a ff          	lea    edi,[r10-0x1]
  402218:	e9 c7 fa ff ff       	jmp    401ce4 <format_string_loop.constprop.0+0x3d4>
  40221d:	89 d1                	mov    ecx,edx
  40221f:	83 c2 08             	add    edx,0x8
  402222:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  402226:	41 89 17             	mov    DWORD PTR [r15],edx
  402229:	e9 16 fc ff ff       	jmp    401e44 <format_string_loop.constprop.0+0x534>
  40222e:	f6 c5 02             	test   ch,0x2
  402231:	0f 85 f3 00 00 00    	jne    40232a <format_string_loop.constprop.0+0xa1a>
  402237:	80 e5 04             	and    ch,0x4
  40223a:	0f 85 ea 00 00 00    	jne    40232a <format_string_loop.constprop.0+0xa1a>
  402240:	83 fa 2f             	cmp    edx,0x2f
  402243:	0f 87 ba 03 00 00    	ja     402603 <format_string_loop.constprop.0+0xcf3>
  402249:	89 d1                	mov    ecx,edx
  40224b:	83 c2 08             	add    edx,0x8
  40224e:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  402252:	41 89 17             	mov    DWORD PTR [r15],edx
  402255:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  402258:	89 32                	mov    DWORD PTR [rdx],esi
  40225a:	e9 21 f8 ff ff       	jmp    401a80 <format_string_loop.constprop.0+0x170>
  40225f:	83 fe 2f             	cmp    esi,0x2f
  402262:	0f 87 b9 02 00 00    	ja     402521 <format_string_loop.constprop.0+0xc11>
  402268:	89 f7                	mov    edi,esi
  40226a:	83 c6 08             	add    esi,0x8
  40226d:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  402271:	41 89 37             	mov    DWORD PTR [r15],esi
  402274:	48 83 ec 08          	sub    rsp,0x8
  402278:	41 89 d1             	mov    r9d,edx
  40227b:	44 89 d9             	mov    ecx,r11d
  40227e:	31 d2                	xor    edx,edx
  402280:	41 50                	push   r8
  402282:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
  402285:	45 89 d0             	mov    r8d,r10d
  402288:	4c 89 e7             	mov    rdi,r12
  40228b:	e8 c0 e6 ff ff       	call   400950 <print_integer>
  402290:	41 58                	pop    r8
  402292:	41 59                	pop    r9
  402294:	e9 e7 f7 ff ff       	jmp    401a80 <format_string_loop.constprop.0+0x170>
  402299:	83 fe 2f             	cmp    esi,0x2f
  40229c:	0f 87 6e 02 00 00    	ja     402510 <format_string_loop.constprop.0+0xc00>
  4022a2:	89 f7                	mov    edi,esi
  4022a4:	83 c6 08             	add    esi,0x8
  4022a7:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  4022ab:	41 89 37             	mov    DWORD PTR [r15],esi
  4022ae:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
  4022b1:	41 89 d1             	mov    r9d,edx
  4022b4:	45 89 d0             	mov    r8d,r10d
  4022b7:	4c 89 e7             	mov    rdi,r12
  4022ba:	48 89 f5             	mov    rbp,rsi
  4022bd:	48 f7 dd             	neg    rbp
  4022c0:	48 0f 48 ee          	cmovs  rbp,rsi
  4022c4:	48 83 ec 08          	sub    rsp,0x8
  4022c8:	48 c1 ee 3f          	shr    rsi,0x3f
  4022cc:	51                   	push   rcx
  4022cd:	48 89 f2             	mov    rdx,rsi
  4022d0:	44 89 d9             	mov    ecx,r11d
  4022d3:	48 89 ee             	mov    rsi,rbp
  4022d6:	e8 75 e6 ff ff       	call   400950 <print_integer>
  4022db:	5d                   	pop    rbp
  4022dc:	41 5e                	pop    r14
  4022de:	e9 9d f7 ff ff       	jmp    401a80 <format_string_loop.constprop.0+0x170>
  4022e3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4022e8:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  4022ed:	bf 20 00 00 00       	mov    edi,0x20
  4022f2:	ff d1                	call   rcx
  4022f4:	8d 45 01             	lea    eax,[rbp+0x1]
  4022f7:	41 39 ee             	cmp    r14d,ebp
  4022fa:	0f 84 80 f7 ff ff    	je     401a80 <format_string_loop.constprop.0+0x170>
  402300:	89 c5                	mov    ebp,eax
  402302:	41 8b 44 24 18       	mov    eax,DWORD PTR [r12+0x18]
  402307:	8d 48 01             	lea    ecx,[rax+0x1]
  40230a:	41 89 4c 24 18       	mov    DWORD PTR [r12+0x18],ecx
  40230f:	41 3b 44 24 1c       	cmp    eax,DWORD PTR [r12+0x1c]
  402314:	73 de                	jae    4022f4 <format_string_loop.constprop.0+0x9e4>
  402316:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  40231a:	48 85 c9             	test   rcx,rcx
  40231d:	75 c9                	jne    4022e8 <format_string_loop.constprop.0+0x9d8>
  40231f:	49 8b 54 24 10       	mov    rdx,QWORD PTR [r12+0x10]
  402324:	c6 04 02 20          	mov    BYTE PTR [rdx+rax*1],0x20
  402328:	eb ca                	jmp    4022f4 <format_string_loop.constprop.0+0x9e4>
  40232a:	83 fa 2f             	cmp    edx,0x2f
  40232d:	0f 87 6d 02 00 00    	ja     4025a0 <format_string_loop.constprop.0+0xc90>
  402333:	89 d1                	mov    ecx,edx
  402335:	83 c2 08             	add    edx,0x8
  402338:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  40233c:	41 89 17             	mov    DWORD PTR [r15],edx
  40233f:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  402342:	89 f0                	mov    eax,esi
  402344:	48 89 02             	mov    QWORD PTR [rdx],rax
  402347:	e9 34 f7 ff ff       	jmp    401a80 <format_string_loop.constprop.0+0x170>
  40234c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402350:	49 8b 7c 24 10       	mov    rdi,QWORD PTR [r12+0x10]
  402355:	40 88 34 07          	mov    BYTE PTR [rdi+rax*1],sil
  402359:	e9 3e fa ff ff       	jmp    401d9c <format_string_loop.constprop.0+0x48c>
  40235e:	83 fa 01             	cmp    edx,0x1
  402361:	0f 86 0c 03 00 00    	jbe    402673 <format_string_loop.constprop.0+0xd63>
  402367:	8d 42 01             	lea    eax,[rdx+0x1]
  40236a:	48 89 5c 24 10       	mov    QWORD PTR [rsp+0x10],rbx
  40236f:	41 be 02 00 00 00    	mov    r14d,0x2
  402375:	89 d3                	mov    ebx,edx
  402377:	89 44 24 08          	mov    DWORD PTR [rsp+0x8],eax
  40237b:	eb 32                	jmp    4023af <format_string_loop.constprop.0+0xa9f>
  40237d:	0f 1f 00             	nop    DWORD PTR [rax]
  402380:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
  402384:	48 85 c0             	test   rax,rax
  402387:	0f 84 8d 00 00 00    	je     40241a <format_string_loop.constprop.0+0xb0a>
  40238d:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  402392:	bf 20 00 00 00       	mov    edi,0x20
  402397:	ff d0                	call   rax
  402399:	41 8b 74 24 18       	mov    esi,DWORD PTR [r12+0x18]
  40239e:	41 8b 7c 24 1c       	mov    edi,DWORD PTR [r12+0x1c]
  4023a3:	41 8d 46 01          	lea    eax,[r14+0x1]
  4023a7:	44 39 f3             	cmp    ebx,r14d
  4023aa:	74 1a                	je     4023c6 <format_string_loop.constprop.0+0xab6>
  4023ac:	41 89 c6             	mov    r14d,eax
  4023af:	8d 46 01             	lea    eax,[rsi+0x1]
  4023b2:	41 89 44 24 18       	mov    DWORD PTR [r12+0x18],eax
  4023b7:	39 fe                	cmp    esi,edi
  4023b9:	72 c5                	jb     402380 <format_string_loop.constprop.0+0xa70>
  4023bb:	89 c6                	mov    esi,eax
  4023bd:	41 8d 46 01          	lea    eax,[r14+0x1]
  4023c1:	44 39 f3             	cmp    ebx,r14d
  4023c4:	75 e6                	jne    4023ac <format_string_loop.constprop.0+0xa9c>
  4023c6:	89 da                	mov    edx,ebx
  4023c8:	48 8b 5c 24 10       	mov    rbx,QWORD PTR [rsp+0x10]
  4023cd:	41 8b 0f             	mov    ecx,DWORD PTR [r15]
  4023d0:	83 f9 2f             	cmp    ecx,0x2f
  4023d3:	0f 86 59 01 00 00    	jbe    402532 <format_string_loop.constprop.0+0xc22>
  4023d9:	4d 8b 47 08          	mov    r8,QWORD PTR [r15+0x8]
  4023dd:	49 8d 48 08          	lea    rcx,[r8+0x8]
  4023e1:	49 89 4f 08          	mov    QWORD PTR [r15+0x8],rcx
  4023e5:	41 8b 08             	mov    ecx,DWORD PTR [r8]
  4023e8:	44 8d 46 01          	lea    r8d,[rsi+0x1]
  4023ec:	45 89 44 24 18       	mov    DWORD PTR [r12+0x18],r8d
  4023f1:	39 fe                	cmp    esi,edi
  4023f3:	0f 83 87 f6 ff ff    	jae    401a80 <format_string_loop.constprop.0+0x170>
  4023f9:	41 89 c8             	mov    r8d,ecx
  4023fc:	0f be f9             	movsx  edi,cl
  4023ff:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  402403:	48 85 c9             	test   rcx,rcx
  402406:	0f 85 a0 fa ff ff    	jne    401eac <format_string_loop.constprop.0+0x59c>
  40240c:	49 8b 4c 24 10       	mov    rcx,QWORD PTR [r12+0x10]
  402411:	44 88 04 31          	mov    BYTE PTR [rcx+rsi*1],r8b
  402415:	e9 a1 fa ff ff       	jmp    401ebb <format_string_loop.constprop.0+0x5ab>
  40241a:	49 8b 44 24 10       	mov    rax,QWORD PTR [r12+0x10]
  40241f:	c6 04 30 20          	mov    BYTE PTR [rax+rsi*1],0x20
  402423:	41 8b 74 24 18       	mov    esi,DWORD PTR [r12+0x18]
  402428:	41 8b 7c 24 1c       	mov    edi,DWORD PTR [r12+0x1c]
  40242d:	e9 71 ff ff ff       	jmp    4023a3 <format_string_loop.constprop.0+0xa93>
  402432:	49 8b 4c 24 10       	mov    rcx,QWORD PTR [r12+0x10]
  402437:	c6 04 11 25          	mov    BYTE PTR [rcx+rdx*1],0x25
  40243b:	e9 40 f6 ff ff       	jmp    401a80 <format_string_loop.constprop.0+0x170>
  402440:	49 8b 4c 24 10       	mov    rcx,QWORD PTR [r12+0x10]
  402445:	40 88 34 11          	mov    BYTE PTR [rcx+rdx*1],sil
  402449:	e9 32 f6 ff ff       	jmp    401a80 <format_string_loop.constprop.0+0x170>
  40244e:	44 8d 5f 01          	lea    r11d,[rdi+0x1]
  402452:	39 fa                	cmp    edx,edi
  402454:	0f 86 02 02 00 00    	jbe    40265c <format_string_loop.constprop.0+0xd4c>
  40245a:	8d 42 01             	lea    eax,[rdx+0x1]
  40245d:	48 89 6c 24 08       	mov    QWORD PTR [rsp+0x8],rbp
  402462:	89 d5                	mov    ebp,edx
  402464:	48 89 5c 24 28       	mov    QWORD PTR [rsp+0x28],rbx
  402469:	44 89 db             	mov    ebx,r11d
  40246c:	89 44 24 10          	mov    DWORD PTR [rsp+0x10],eax
  402470:	44 89 54 24 20       	mov    DWORD PTR [rsp+0x20],r10d
  402475:	eb 1f                	jmp    402496 <format_string_loop.constprop.0+0xb86>
  402477:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40247e:	00 00 
  402480:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  402485:	bf 20 00 00 00       	mov    edi,0x20
  40248a:	41 ff d0             	call   r8
  40248d:	8d 4b 01             	lea    ecx,[rbx+0x1]
  402490:	39 dd                	cmp    ebp,ebx
  402492:	74 2f                	je     4024c3 <format_string_loop.constprop.0+0xbb3>
  402494:	89 cb                	mov    ebx,ecx
  402496:	41 8b 4c 24 18       	mov    ecx,DWORD PTR [r12+0x18]
  40249b:	8d 71 01             	lea    esi,[rcx+0x1]
  40249e:	41 89 74 24 18       	mov    DWORD PTR [r12+0x18],esi
  4024a3:	41 3b 4c 24 1c       	cmp    ecx,DWORD PTR [r12+0x1c]
  4024a8:	73 e3                	jae    40248d <format_string_loop.constprop.0+0xb7d>
  4024aa:	4d 8b 04 24          	mov    r8,QWORD PTR [r12]
  4024ae:	4d 85 c0             	test   r8,r8
  4024b1:	75 cd                	jne    402480 <format_string_loop.constprop.0+0xb70>
  4024b3:	49 8b 74 24 10       	mov    rsi,QWORD PTR [r12+0x10]
  4024b8:	c6 04 0e 20          	mov    BYTE PTR [rsi+rcx*1],0x20
  4024bc:	8d 4b 01             	lea    ecx,[rbx+0x1]
  4024bf:	39 dd                	cmp    ebp,ebx
  4024c1:	75 d1                	jne    402494 <format_string_loop.constprop.0+0xb84>
  4024c3:	89 ea                	mov    edx,ebp
  4024c5:	48 8b 6c 24 08       	mov    rbp,QWORD PTR [rsp+0x8]
  4024ca:	44 8b 54 24 20       	mov    r10d,DWORD PTR [rsp+0x20]
  4024cf:	48 8b 5c 24 28       	mov    rbx,QWORD PTR [rsp+0x28]
  4024d4:	44 0f b6 4d 00       	movzx  r9d,BYTE PTR [rbp+0x0]
  4024d9:	44 89 ce             	mov    esi,r9d
  4024dc:	45 84 c9             	test   r9b,r9b
  4024df:	0f 84 9b f5 ff ff    	je     401a80 <format_string_loop.constprop.0+0x170>
  4024e5:	45 85 f6             	test   r14d,r14d
  4024e8:	0f 94 44 24 08       	sete   BYTE PTR [rsp+0x8]
  4024ed:	0f b6 44 24 08       	movzx  eax,BYTE PTR [rsp+0x8]
  4024f2:	45 85 d2             	test   r10d,r10d
  4024f5:	0f 85 57 f8 ff ff    	jne    401d52 <format_string_loop.constprop.0+0x442>
  4024fb:	84 c0                	test   al,al
  4024fd:	0f 85 4f f8 ff ff    	jne    401d52 <format_string_loop.constprop.0+0x442>
  402503:	e9 78 f5 ff ff       	jmp    401a80 <format_string_loop.constprop.0+0x170>
  402508:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40250f:	00 
  402510:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  402514:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  402518:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  40251c:	e9 8d fd ff ff       	jmp    4022ae <format_string_loop.constprop.0+0x99e>
  402521:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  402525:	48 8d 4f 08          	lea    rcx,[rdi+0x8]
  402529:	49 89 4f 08          	mov    QWORD PTR [r15+0x8],rcx
  40252d:	e9 42 fd ff ff       	jmp    402274 <format_string_loop.constprop.0+0x964>
  402532:	41 89 c8             	mov    r8d,ecx
  402535:	83 c1 08             	add    ecx,0x8
  402538:	4d 03 47 10          	add    r8,QWORD PTR [r15+0x10]
  40253c:	41 89 0f             	mov    DWORD PTR [r15],ecx
  40253f:	e9 a1 fe ff ff       	jmp    4023e5 <format_string_loop.constprop.0+0xad5>
  402544:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  402548:	48 8d 51 08          	lea    rdx,[rcx+0x8]
  40254c:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  402550:	e9 50 fb ff ff       	jmp    4020a5 <format_string_loop.constprop.0+0x795>
  402555:	f6 c1 80             	test   cl,0x80
  402558:	0f 84 8d 00 00 00    	je     4025eb <format_string_loop.constprop.0+0xcdb>
  40255e:	83 fe 2f             	cmp    esi,0x2f
  402561:	0f 87 e4 00 00 00    	ja     40264b <format_string_loop.constprop.0+0xd3b>
  402567:	89 f7                	mov    edi,esi
  402569:	83 c6 08             	add    esi,0x8
  40256c:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  402570:	41 89 37             	mov    DWORD PTR [r15],esi
  402573:	0f bf 3f             	movsx  edi,WORD PTR [rdi]
  402576:	e9 0a f6 ff ff       	jmp    401b85 <format_string_loop.constprop.0+0x275>
  40257b:	81 e1 80 00 00 00    	and    ecx,0x80
  402581:	74 3f                	je     4025c2 <format_string_loop.constprop.0+0xcb2>
  402583:	83 fe 2f             	cmp    esi,0x2f
  402586:	0f 87 ae 00 00 00    	ja     40263a <format_string_loop.constprop.0+0xd2a>
  40258c:	89 f1                	mov    ecx,esi
  40258e:	83 c6 08             	add    esi,0x8
  402591:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  402595:	41 89 37             	mov    DWORD PTR [r15],esi
  402598:	0f b7 31             	movzx  esi,WORD PTR [rcx]
  40259b:	e9 49 fb ff ff       	jmp    4020e9 <format_string_loop.constprop.0+0x7d9>
  4025a0:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  4025a4:	48 8d 51 08          	lea    rdx,[rcx+0x8]
  4025a8:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  4025ac:	e9 8e fd ff ff       	jmp    40233f <format_string_loop.constprop.0+0xa2f>
  4025b1:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  4025b5:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  4025b9:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  4025bd:	e9 c0 f5 ff ff       	jmp    401b82 <format_string_loop.constprop.0+0x272>
  4025c2:	83 fe 2f             	cmp    esi,0x2f
  4025c5:	76 60                	jbe    402627 <format_string_loop.constprop.0+0xd17>
  4025c7:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  4025cb:	48 8d 71 08          	lea    rsi,[rcx+0x8]
  4025cf:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  4025d3:	8b 31                	mov    esi,DWORD PTR [rcx]
  4025d5:	e9 0f fb ff ff       	jmp    4020e9 <format_string_loop.constprop.0+0x7d9>
  4025da:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  4025de:	48 8d 71 08          	lea    rsi,[rcx+0x8]
  4025e2:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  4025e6:	e9 fb fa ff ff       	jmp    4020e6 <format_string_loop.constprop.0+0x7d6>
  4025eb:	83 fe 2f             	cmp    esi,0x2f
  4025ee:	76 24                	jbe    402614 <format_string_loop.constprop.0+0xd04>
  4025f0:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  4025f4:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  4025f8:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  4025fc:	8b 3f                	mov    edi,DWORD PTR [rdi]
  4025fe:	e9 82 f5 ff ff       	jmp    401b85 <format_string_loop.constprop.0+0x275>
  402603:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  402607:	48 8d 51 08          	lea    rdx,[rcx+0x8]
  40260b:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  40260f:	e9 41 fc ff ff       	jmp    402255 <format_string_loop.constprop.0+0x945>
  402614:	89 f7                	mov    edi,esi
  402616:	83 c6 08             	add    esi,0x8
  402619:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  40261d:	41 89 37             	mov    DWORD PTR [r15],esi
  402620:	8b 3f                	mov    edi,DWORD PTR [rdi]
  402622:	e9 5e f5 ff ff       	jmp    401b85 <format_string_loop.constprop.0+0x275>
  402627:	89 f1                	mov    ecx,esi
  402629:	83 c6 08             	add    esi,0x8
  40262c:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  402630:	41 89 37             	mov    DWORD PTR [r15],esi
  402633:	8b 31                	mov    esi,DWORD PTR [rcx]
  402635:	e9 af fa ff ff       	jmp    4020e9 <format_string_loop.constprop.0+0x7d9>
  40263a:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  40263e:	48 8d 71 08          	lea    rsi,[rcx+0x8]
  402642:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  402646:	e9 4d ff ff ff       	jmp    402598 <format_string_loop.constprop.0+0xc88>
  40264b:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  40264f:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  402653:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  402657:	e9 17 ff ff ff       	jmp    402573 <format_string_loop.constprop.0+0xc63>
  40265c:	44 89 5c 24 10       	mov    DWORD PTR [rsp+0x10],r11d
  402661:	e9 73 fe ff ff       	jmp    4024d9 <format_string_loop.constprop.0+0xbc9>
  402666:	c7 44 24 10 00 00 00 	mov    DWORD PTR [rsp+0x10],0x0
  40266d:	00 
  40266e:	e9 95 f6 ff ff       	jmp    401d08 <format_string_loop.constprop.0+0x3f8>
  402673:	c7 44 24 08 02 00 00 	mov    DWORD PTR [rsp+0x8],0x2
  40267a:	00 
  40267b:	e9 4d fd ff ff       	jmp    4023cd <format_string_loop.constprop.0+0xabd>

Disassembly of section .text.vprintf:

0000000000402680 <vprintf>:
  402680:	f3 0f 1e fa          	endbr64 
  402684:	48 83 ec 28          	sub    rsp,0x28
  402688:	49 89 f8             	mov    r8,rdi
  40268b:	48 8d 05 6e e1 ff ff 	lea    rax,[rip+0xffffffffffffe16e]        # 400800 <putchar_wrapper>
  402692:	48 89 f2             	mov    rdx,rsi
  402695:	48 89 04 24          	mov    QWORD PTR [rsp],rax
  402699:	48 89 e7             	mov    rdi,rsp
  40269c:	4c 89 c6             	mov    rsi,r8
  40269f:	48 b8 00 00 00 00 ff 	movabs rax,0x7fffffff00000000
  4026a6:	ff ff 7f 
  4026a9:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
  4026b0:	00 00 
  4026b2:	48 c7 44 24 10 00 00 	mov    QWORD PTR [rsp+0x10],0x0
  4026b9:	00 00 
  4026bb:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  4026c0:	e8 4b f2 ff ff       	call   401910 <format_string_loop.constprop.0>
  4026c5:	48 83 3c 24 00       	cmp    QWORD PTR [rsp],0x0
  4026ca:	74 0c                	je     4026d8 <vprintf+0x58>
  4026cc:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  4026d0:	48 83 c4 28          	add    rsp,0x28
  4026d4:	c3                   	ret    
  4026d5:	0f 1f 00             	nop    DWORD PTR [rax]
  4026d8:	8b 4c 24 1c          	mov    ecx,DWORD PTR [rsp+0x1c]
  4026dc:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  4026e0:	85 c9                	test   ecx,ecx
  4026e2:	74 ec                	je     4026d0 <vprintf+0x50>
  4026e4:	48 8b 74 24 10       	mov    rsi,QWORD PTR [rsp+0x10]
  4026e9:	48 85 f6             	test   rsi,rsi
  4026ec:	74 e2                	je     4026d0 <vprintf+0x50>
  4026ee:	39 c1                	cmp    ecx,eax
  4026f0:	8d 51 ff             	lea    edx,[rcx-0x1]
  4026f3:	48 0f 47 d0          	cmova  rdx,rax
  4026f7:	c6 04 16 00          	mov    BYTE PTR [rsi+rdx*1],0x0
  4026fb:	48 83 c4 28          	add    rsp,0x28
  4026ff:	c3                   	ret    

Disassembly of section .text.vsnprintf:

0000000000402700 <vsnprintf>:
  402700:	f3 0f 1e fa          	endbr64 
  402704:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
  402709:	48 83 ec 28          	sub    rsp,0x28
  40270d:	49 89 d0             	mov    r8,rdx
  402710:	48 89 ca             	mov    rdx,rcx
  402713:	48 39 c6             	cmp    rsi,rax
  402716:	48 89 7c 24 10       	mov    QWORD PTR [rsp+0x10],rdi
  40271b:	48 0f 47 f0          	cmova  rsi,rax
  40271f:	31 c0                	xor    eax,eax
  402721:	48 85 ff             	test   rdi,rdi
  402724:	48 89 e7             	mov    rdi,rsp
  402727:	48 c7 04 24 00 00 00 	mov    QWORD PTR [rsp],0x0
  40272e:	00 
  40272f:	48 0f 44 f0          	cmove  rsi,rax
  402733:	c7 44 24 18 00 00 00 	mov    DWORD PTR [rsp+0x18],0x0
  40273a:	00 
  40273b:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
  402742:	00 00 
  402744:	89 74 24 1c          	mov    DWORD PTR [rsp+0x1c],esi
  402748:	4c 89 c6             	mov    rsi,r8
  40274b:	e8 c0 f1 ff ff       	call   401910 <format_string_loop.constprop.0>
  402750:	48 83 3c 24 00       	cmp    QWORD PTR [rsp],0x0
  402755:	74 09                	je     402760 <vsnprintf+0x60>
  402757:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  40275b:	48 83 c4 28          	add    rsp,0x28
  40275f:	c3                   	ret    
  402760:	8b 4c 24 1c          	mov    ecx,DWORD PTR [rsp+0x1c]
  402764:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  402768:	85 c9                	test   ecx,ecx
  40276a:	74 ef                	je     40275b <vsnprintf+0x5b>
  40276c:	48 8b 74 24 10       	mov    rsi,QWORD PTR [rsp+0x10]
  402771:	48 85 f6             	test   rsi,rsi
  402774:	74 e5                	je     40275b <vsnprintf+0x5b>
  402776:	39 c1                	cmp    ecx,eax
  402778:	8d 51 ff             	lea    edx,[rcx-0x1]
  40277b:	48 0f 47 d0          	cmova  rdx,rax
  40277f:	c6 04 16 00          	mov    BYTE PTR [rsi+rdx*1],0x0
  402783:	48 83 c4 28          	add    rsp,0x28
  402787:	c3                   	ret    

Disassembly of section .text.vsprintf:

0000000000402790 <vsprintf>:
  402790:	f3 0f 1e fa          	endbr64 
  402794:	48 89 d1             	mov    rcx,rdx
  402797:	48 89 f2             	mov    rdx,rsi
  40279a:	be ff ff ff 7f       	mov    esi,0x7fffffff
  40279f:	e9 5c ff ff ff       	jmp    402700 <vsnprintf>

Disassembly of section .text.vfctprintf:

00000000004027b0 <vfctprintf>:
  4027b0:	f3 0f 1e fa          	endbr64 
  4027b4:	48 83 ec 28          	sub    rsp,0x28
  4027b8:	49 89 f0             	mov    r8,rsi
  4027bb:	48 89 d6             	mov    rsi,rdx
  4027be:	48 b8 00 00 00 00 ff 	movabs rax,0x7fffffff00000000
  4027c5:	ff ff 7f 
  4027c8:	48 89 3c 24          	mov    QWORD PTR [rsp],rdi
  4027cc:	48 89 ca             	mov    rdx,rcx
  4027cf:	48 89 e7             	mov    rdi,rsp
  4027d2:	4c 89 44 24 08       	mov    QWORD PTR [rsp+0x8],r8
  4027d7:	48 c7 44 24 10 00 00 	mov    QWORD PTR [rsp+0x10],0x0
  4027de:	00 00 
  4027e0:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  4027e5:	e8 26 f1 ff ff       	call   401910 <format_string_loop.constprop.0>
  4027ea:	48 83 3c 24 00       	cmp    QWORD PTR [rsp],0x0
  4027ef:	74 0f                	je     402800 <vfctprintf+0x50>
  4027f1:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  4027f5:	48 83 c4 28          	add    rsp,0x28
  4027f9:	c3                   	ret    
  4027fa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  402800:	8b 4c 24 1c          	mov    ecx,DWORD PTR [rsp+0x1c]
  402804:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  402808:	85 c9                	test   ecx,ecx
  40280a:	74 e9                	je     4027f5 <vfctprintf+0x45>
  40280c:	48 8b 74 24 10       	mov    rsi,QWORD PTR [rsp+0x10]
  402811:	48 85 f6             	test   rsi,rsi
  402814:	74 df                	je     4027f5 <vfctprintf+0x45>
  402816:	39 c1                	cmp    ecx,eax
  402818:	8d 51 ff             	lea    edx,[rcx-0x1]
  40281b:	48 0f 47 d0          	cmova  rdx,rax
  40281f:	c6 04 16 00          	mov    BYTE PTR [rsi+rdx*1],0x0
  402823:	48 83 c4 28          	add    rsp,0x28
  402827:	c3                   	ret    

Disassembly of section .text.printf:

0000000000402830 <printf>:
  402830:	f3 0f 1e fa          	endbr64 
  402834:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  40283b:	48 89 74 24 28       	mov    QWORD PTR [rsp+0x28],rsi
  402840:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
  402845:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  40284a:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  40284f:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  402854:	84 c0                	test   al,al
  402856:	74 37                	je     40288f <printf+0x5f>
  402858:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  40285d:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  402862:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  402867:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  40286e:	00 
  40286f:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  402876:	00 
  402877:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  40287e:	00 
  40287f:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  402886:	00 
  402887:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  40288e:	00 
  40288f:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  402896:	00 
  402897:	48 8d 74 24 08       	lea    rsi,[rsp+0x8]
  40289c:	c7 44 24 08 08 00 00 	mov    DWORD PTR [rsp+0x8],0x8
  4028a3:	00 
  4028a4:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  4028a9:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  4028ae:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  4028b5:	00 
  4028b6:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  4028bb:	e8 c0 fd ff ff       	call   402680 <vprintf>
  4028c0:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  4028c7:	c3                   	ret    

Disassembly of section .text.sprintf:

00000000004028d0 <sprintf>:
  4028d0:	f3 0f 1e fa          	endbr64 
  4028d4:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  4028db:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
  4028e0:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  4028e5:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  4028ea:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  4028ef:	84 c0                	test   al,al
  4028f1:	74 37                	je     40292a <sprintf+0x5a>
  4028f3:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  4028f8:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  4028fd:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  402902:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  402909:	00 
  40290a:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  402911:	00 
  402912:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  402919:	00 
  40291a:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  402921:	00 
  402922:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  402929:	00 
  40292a:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  402931:	00 
  402932:	48 8d 54 24 08       	lea    rdx,[rsp+0x8]
  402937:	c7 44 24 08 10 00 00 	mov    DWORD PTR [rsp+0x8],0x10
  40293e:	00 
  40293f:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  402944:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  402949:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  402950:	00 
  402951:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  402956:	e8 35 fe ff ff       	call   402790 <vsprintf>
  40295b:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  402962:	c3                   	ret    

Disassembly of section .text.snprintf:

0000000000402970 <snprintf>:
  402970:	f3 0f 1e fa          	endbr64 
  402974:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  40297b:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  402980:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  402985:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  40298a:	84 c0                	test   al,al
  40298c:	74 37                	je     4029c5 <snprintf+0x55>
  40298e:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  402993:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  402998:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  40299d:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  4029a4:	00 
  4029a5:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  4029ac:	00 
  4029ad:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  4029b4:	00 
  4029b5:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  4029bc:	00 
  4029bd:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  4029c4:	00 
  4029c5:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  4029cc:	00 
  4029cd:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
  4029d2:	c7 44 24 08 18 00 00 	mov    DWORD PTR [rsp+0x8],0x18
  4029d9:	00 
  4029da:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  4029df:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  4029e4:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  4029eb:	00 
  4029ec:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  4029f1:	e8 0a fd ff ff       	call   402700 <vsnprintf>
  4029f6:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  4029fd:	c3                   	ret    

Disassembly of section .text.fctprintf:

0000000000402a00 <fctprintf>:
  402a00:	f3 0f 1e fa          	endbr64 
  402a04:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  402a0b:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  402a10:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  402a15:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  402a1a:	84 c0                	test   al,al
  402a1c:	74 37                	je     402a55 <fctprintf+0x55>
  402a1e:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  402a23:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  402a28:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  402a2d:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  402a34:	00 
  402a35:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  402a3c:	00 
  402a3d:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  402a44:	00 
  402a45:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  402a4c:	00 
  402a4d:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  402a54:	00 
  402a55:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  402a5c:	00 
  402a5d:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
  402a62:	c7 44 24 08 18 00 00 	mov    DWORD PTR [rsp+0x8],0x18
  402a69:	00 
  402a6a:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  402a6f:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  402a74:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  402a7b:	00 
  402a7c:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  402a81:	e8 2a fd ff ff       	call   4027b0 <vfctprintf>
  402a86:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  402a8d:	c3                   	ret    

Disassembly of section .text.putchar:

0000000000402a90 <putchar>:
  402a90:	f3 0f 1e fa          	endbr64 
  402a94:	41 54                	push   r12
  402a96:	41 89 fc             	mov    r12d,edi
  402a99:	40 0f be ff          	movsx  edi,dil
  402a9d:	e8 0e 00 00 00       	call   402ab0 <putchar_>
  402aa2:	44 89 e0             	mov    eax,r12d
  402aa5:	41 5c                	pop    r12
  402aa7:	c3                   	ret    

Disassembly of section .text.putchar_:

0000000000402ab0 <putchar_>:
  402ab0:	f3 0f 1e fa          	endbr64 
  402ab4:	48 83 ec 18          	sub    rsp,0x18
  402ab8:	ba 01 00 00 00       	mov    edx,0x1
  402abd:	31 c0                	xor    eax,eax
  402abf:	40 88 7c 24 0c       	mov    BYTE PTR [rsp+0xc],dil
  402ac4:	48 8d 74 24 0c       	lea    rsi,[rsp+0xc]
  402ac9:	bf 01 00 00 00       	mov    edi,0x1
  402ace:	e8 6d d8 ff ff       	call   400340 <write>
  402ad3:	48 83 c4 18          	add    rsp,0x18
  402ad7:	c3                   	ret    
