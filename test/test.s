
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
  400057:	48 8d 05 b2 3b 00 00 	lea    rax,[rip+0x3bb2]        # 403c10 <b+0x4>
  40005e:	48 89 c7             	mov    rdi,rax
  400061:	e8 2a 04 00 00       	call   400490 <puts>
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
  400100:	e8 2b 04 00 00       	call   400530 <memset>
        int p = 0;
  400105:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        printf("shell:>");
  40010c:	48 8d 05 10 3b 00 00 	lea    rax,[rip+0x3b10]        # 403c23 <b+0x17>
  400113:	48 89 c7             	mov    rdi,rax
  400116:	b8 00 00 00 00       	mov    eax,0x0
  40011b:	e8 30 27 00 00       	call   402850 <printf>
        // write(2, "shell:>", 7);
        gets(cmd);
  400120:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  400127:	48 89 c7             	mov    rdi,rax
  40012a:	b8 00 00 00 00       	mov    eax,0x0
  40012f:	e8 bc 03 00 00       	call   4004f0 <gets>
        puts(cmd);
  400134:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  40013b:	48 89 c7             	mov    rdi,rax
  40013e:	e8 4d 03 00 00       	call   400490 <puts>
        // write(2, cmd, p);
        if (strcmp(cmd, "version") == 0) { puts("Gamessis OS 1.0.\n"); }
  400143:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  40014a:	48 8d 15 da 3a 00 00 	lea    rdx,[rip+0x3ada]        # 403c2b <b+0x1f>
  400151:	48 89 d6             	mov    rsi,rdx
  400154:	48 89 c7             	mov    rdi,rax
  400157:	e8 64 04 00 00       	call   4005c0 <strcmp>
  40015c:	85 c0                	test   eax,eax
  40015e:	75 14                	jne    400174 <main+0x139>
  400160:	48 8d 05 cc 3a 00 00 	lea    rax,[rip+0x3acc]        # 403c33 <b+0x27>
  400167:	48 89 c7             	mov    rdi,rax
  40016a:	e8 21 03 00 00       	call   400490 <puts>
  40016f:	e9 78 ff ff ff       	jmp    4000ec <main+0xb1>
        else if (strcmp(cmd, "exit") == 0) {
  400174:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  40017b:	48 8d 15 c3 3a 00 00 	lea    rdx,[rip+0x3ac3]        # 403c45 <b+0x39>
  400182:	48 89 d6             	mov    rsi,rdx
  400185:	48 89 c7             	mov    rdi,rax
  400188:	e8 33 04 00 00       	call   4005c0 <strcmp>
  40018d:	85 c0                	test   eax,eax
  40018f:	0f 84 b9 00 00 00    	je     40024e <main+0x213>
            break;
        }
        else {
            printf("trying to execute...\n");
  400195:	48 8d 05 ae 3a 00 00 	lea    rax,[rip+0x3aae]        # 403c4a <b+0x3e>
  40019c:	48 89 c7             	mov    rdi,rax
  40019f:	e8 ec 02 00 00       	call   400490 <puts>
            int pid = 0;
  4001a4:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
            if ((pid = fork()) == 0) {
  4001ab:	e8 50 02 00 00       	call   400400 <fork>
  4001b0:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  4001b3:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  4001b7:	75 54                	jne    40020d <main+0x1d2>
                printf("forked, ready to execve\n");
  4001b9:	48 8d 05 9f 3a 00 00 	lea    rax,[rip+0x3a9f]        # 403c5f <b+0x53>
  4001c0:	48 89 c7             	mov    rdi,rax
  4001c3:	e8 c8 02 00 00       	call   400490 <puts>
                if (execve(cmd, argv, environ) == -1) {
  4001c8:	48 8b 15 d1 3a 00 00 	mov    rdx,QWORD PTR [rip+0x3ad1]        # 403ca0 <environ>
  4001cf:	48 8b 8d 50 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xb0]
  4001d6:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  4001dd:	48 89 ce             	mov    rsi,rcx
  4001e0:	48 89 c7             	mov    rdi,rax
  4001e3:	e8 28 02 00 00       	call   400410 <execve>
  4001e8:	83 f8 ff             	cmp    eax,0xffffffff
  4001eb:	75 20                	jne    40020d <main+0x1d2>
                    printf("cannot find file:%s\n", cmd);
  4001ed:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  4001f4:	48 89 c6             	mov    rsi,rax
  4001f7:	48 8d 05 79 3a 00 00 	lea    rax,[rip+0x3a79]        # 403c77 <b+0x6b>
  4001fe:	48 89 c7             	mov    rdi,rax
  400201:	b8 00 00 00 00       	mov    eax,0x0
  400206:	e8 45 26 00 00       	call   402850 <printf>
  40020b:	eb 42                	jmp    40024f <main+0x214>
                    break;
                }
            }
            printf("forked. pid=%d\n", pid);
  40020d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  400210:	89 c6                	mov    esi,eax
  400212:	48 8d 05 73 3a 00 00 	lea    rax,[rip+0x3a73]        # 403c8c <b+0x80>
  400219:	48 89 c7             	mov    rdi,rax
  40021c:	b8 00 00 00 00       	mov    eax,0x0
  400221:	e8 2a 26 00 00       	call   402850 <printf>
            int loc = 0;
  400226:	c7 85 6c ff ff ff 00 	mov    DWORD PTR [rbp-0x94],0x0
  40022d:	00 00 00 

            waitpid(pid, &loc, 0);
  400230:	48 8d 8d 6c ff ff ff 	lea    rcx,[rbp-0x94]
  400237:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  40023a:	ba 00 00 00 00       	mov    edx,0x0
  40023f:	48 89 ce             	mov    rsi,rcx
  400242:	89 c7                	mov    edi,eax
  400244:	e8 d7 01 00 00       	call   400420 <waitpid>
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

0000000000400470 <remove>:
  400470:	55                   	push   rbp
  400471:	48 89 e5             	mov    rbp,rsp
  400474:	b8 22 00 00 00       	mov    eax,0x22
  400479:	55                   	push   rbp
  40047a:	48 0f 05             	rex.W syscall 
  40047d:	5d                   	pop    rbp
  40047e:	c9                   	leave  
  40047f:	c3                   	ret    

0000000000400480 <sbrk>:
  400480:	55                   	push   rbp
  400481:	48 89 e5             	mov    rbp,rsp
  400484:	b8 23 00 00 00       	mov    eax,0x23
  400489:	55                   	push   rbp
  40048a:	48 0f 05             	rex.W syscall 
  40048d:	5d                   	pop    rbp
  40048e:	c9                   	leave  
  40048f:	c3                   	ret    

Disassembly of section .text.puts:

0000000000400490 <puts>:
  400490:	f3 0f 1e fa          	endbr64 
  400494:	41 54                	push   r12
  400496:	55                   	push   rbp
  400497:	48 89 fd             	mov    rbp,rdi
  40049a:	53                   	push   rbx
  40049b:	0f be 3f             	movsx  edi,BYTE PTR [rdi]
  40049e:	40 84 ff             	test   dil,dil
  4004a1:	74 35                	je     4004d8 <puts+0x48>
  4004a3:	31 db                	xor    ebx,ebx
  4004a5:	0f 1f 00             	nop    DWORD PTR [rax]
  4004a8:	e8 03 26 00 00       	call   402ab0 <putchar>
  4004ad:	41 89 dc             	mov    r12d,ebx
  4004b0:	48 83 c3 01          	add    rbx,0x1
  4004b4:	0f be 7c 1d 00       	movsx  edi,BYTE PTR [rbp+rbx*1+0x0]
  4004b9:	40 84 ff             	test   dil,dil
  4004bc:	75 ea                	jne    4004a8 <puts+0x18>
  4004be:	bf 0a 00 00 00       	mov    edi,0xa
  4004c3:	e8 e8 25 00 00       	call   402ab0 <putchar>
  4004c8:	41 8d 44 24 02       	lea    eax,[r12+0x2]
  4004cd:	5b                   	pop    rbx
  4004ce:	5d                   	pop    rbp
  4004cf:	41 5c                	pop    r12
  4004d1:	c3                   	ret    
  4004d2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4004d8:	5b                   	pop    rbx
  4004d9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  4004de:	5d                   	pop    rbp
  4004df:	41 5c                	pop    r12
  4004e1:	c3                   	ret    

Disassembly of section .text.gets:

00000000004004f0 <gets>:
  4004f0:	f3 0f 1e fa          	endbr64 
  4004f4:	41 54                	push   r12
  4004f6:	49 89 fc             	mov    r12,rdi
  4004f9:	eb 09                	jmp    400504 <gets+0x14>
  4004fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  400500:	49 83 c4 01          	add    r12,0x1
  400504:	31 c0                	xor    eax,eax
  400506:	ba 01 00 00 00       	mov    edx,0x1
  40050b:	4c 89 e6             	mov    rsi,r12
  40050e:	bf 01 00 00 00       	mov    edi,0x1
  400513:	e8 18 fe ff ff       	call   400330 <read>
  400518:	41 80 3c 24 0a       	cmp    BYTE PTR [r12],0xa
  40051d:	75 e1                	jne    400500 <gets+0x10>
  40051f:	4c 89 e0             	mov    rax,r12
  400522:	41 c6 04 24 00       	mov    BYTE PTR [r12],0x0
  400527:	41 5c                	pop    r12
  400529:	c3                   	ret    

Disassembly of section .text.memset:

0000000000400530 <memset>:
  400530:	f3 0f 1e fa          	endbr64 
  400534:	48 89 f8             	mov    rax,rdi
  400537:	48 85 d2             	test   rdx,rdx
  40053a:	74 77                	je     4005b3 <memset+0x83>
  40053c:	40 88 74 17 ff       	mov    BYTE PTR [rdi+rdx*1-0x1],sil
  400541:	40 88 37             	mov    BYTE PTR [rdi],sil
  400544:	48 83 fa 02          	cmp    rdx,0x2
  400548:	76 69                	jbe    4005b3 <memset+0x83>
  40054a:	40 88 74 17 fe       	mov    BYTE PTR [rdi+rdx*1-0x2],sil
  40054f:	40 88 77 01          	mov    BYTE PTR [rdi+0x1],sil
  400553:	40 88 74 17 fd       	mov    BYTE PTR [rdi+rdx*1-0x3],sil
  400558:	40 88 77 02          	mov    BYTE PTR [rdi+0x2],sil
  40055c:	48 83 fa 06          	cmp    rdx,0x6
  400560:	76 51                	jbe    4005b3 <memset+0x83>
  400562:	40 88 74 17 fc       	mov    BYTE PTR [rdi+rdx*1-0x4],sil
  400567:	40 88 77 03          	mov    BYTE PTR [rdi+0x3],sil
  40056b:	48 83 fa 08          	cmp    rdx,0x8
  40056f:	76 42                	jbe    4005b3 <memset+0x83>
  400571:	48 f7 df             	neg    rdi
  400574:	44 0f b6 c6          	movzx  r8d,sil
  400578:	c1 e6 18             	shl    esi,0x18
  40057b:	83 e7 03             	and    edi,0x3
  40057e:	45 89 c1             	mov    r9d,r8d
  400581:	48 8d 0c 38          	lea    rcx,[rax+rdi*1]
  400585:	48 29 fa             	sub    rdx,rdi
  400588:	44 89 c7             	mov    edi,r8d
  40058b:	41 c1 e1 10          	shl    r9d,0x10
  40058f:	c1 e7 08             	shl    edi,0x8
  400592:	48 83 e2 fc          	and    rdx,0xfffffffffffffffc
  400596:	44 09 cf             	or     edi,r9d
  400599:	48 01 ca             	add    rdx,rcx
  40059c:	44 09 c7             	or     edi,r8d
  40059f:	09 fe                	or     esi,edi
  4005a1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4005a8:	89 31                	mov    DWORD PTR [rcx],esi
  4005aa:	48 83 c1 04          	add    rcx,0x4
  4005ae:	48 39 ca             	cmp    rdx,rcx
  4005b1:	75 f5                	jne    4005a8 <memset+0x78>
  4005b3:	c3                   	ret    

Disassembly of section .text.strcmp:

00000000004005c0 <strcmp>:
  4005c0:	f3 0f 1e fa          	endbr64 
  4005c4:	48 39 f7             	cmp    rdi,rsi
  4005c7:	74 34                	je     4005fd <strcmp+0x3d>
  4005c9:	48 85 ff             	test   rdi,rdi
  4005cc:	74 38                	je     400606 <strcmp+0x46>
  4005ce:	48 85 f6             	test   rsi,rsi
  4005d1:	74 33                	je     400606 <strcmp+0x46>
  4005d3:	0f b6 17             	movzx  edx,BYTE PTR [rdi]
  4005d6:	0f be 0e             	movsx  ecx,BYTE PTR [rsi]
  4005d9:	38 ca                	cmp    dl,cl
  4005db:	75 23                	jne    400600 <strcmp+0x40>
  4005dd:	b8 01 00 00 00       	mov    eax,0x1
  4005e2:	eb 15                	jmp    4005f9 <strcmp+0x39>
  4005e4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  4005e8:	0f b6 14 07          	movzx  edx,BYTE PTR [rdi+rax*1]
  4005ec:	48 83 c0 01          	add    rax,0x1
  4005f0:	0f be 4c 06 ff       	movsx  ecx,BYTE PTR [rsi+rax*1-0x1]
  4005f5:	38 ca                	cmp    dl,cl
  4005f7:	75 07                	jne    400600 <strcmp+0x40>
  4005f9:	84 d2                	test   dl,dl
  4005fb:	75 eb                	jne    4005e8 <strcmp+0x28>
  4005fd:	31 c0                	xor    eax,eax
  4005ff:	c3                   	ret    
  400600:	0f be c2             	movsx  eax,dl
  400603:	29 c8                	sub    eax,ecx
  400605:	c3                   	ret    
  400606:	b8 ff ff ff ff       	mov    eax,0xffffffff
  40060b:	c3                   	ret    

Disassembly of section .text.__libc_init_array:

0000000000400610 <__libc_init_array>:
  400610:	f3 0f 1e fa          	endbr64 
  400614:	41 54                	push   r12
  400616:	49 c7 c4 00 00 00 00 	mov    r12,0x0
  40061d:	55                   	push   rbp
  40061e:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
  400625:	53                   	push   rbx
  400626:	4c 29 e5             	sub    rbp,r12
  400629:	48 c1 fd 03          	sar    rbp,0x3
  40062d:	74 16                	je     400645 <__libc_init_array+0x35>
  40062f:	31 db                	xor    ebx,ebx
  400631:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  400638:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
  40063c:	48 83 c3 01          	add    rbx,0x1
  400640:	48 39 dd             	cmp    rbp,rbx
  400643:	75 f3                	jne    400638 <__libc_init_array+0x28>
  400645:	49 c7 c4 00 00 00 00 	mov    r12,0x0
  40064c:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
  400653:	4c 29 e5             	sub    rbp,r12
  400656:	48 c1 fd 03          	sar    rbp,0x3
  40065a:	74 11                	je     40066d <__libc_init_array+0x5d>
  40065c:	31 db                	xor    ebx,ebx
  40065e:	66 90                	xchg   ax,ax
  400660:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
  400664:	48 83 c3 01          	add    rbx,0x1
  400668:	48 39 dd             	cmp    rbp,rbx
  40066b:	75 f3                	jne    400660 <__libc_init_array+0x50>
  40066d:	5b                   	pop    rbx
  40066e:	5d                   	pop    rbp
  40066f:	41 5c                	pop    r12
  400671:	c3                   	ret    

Disassembly of section .text.__libc_fini_array:

0000000000400680 <__libc_fini_array>:
  400680:	f3 0f 1e fa          	endbr64 
  400684:	55                   	push   rbp
  400685:	53                   	push   rbx
  400686:	48 83 ec 08          	sub    rsp,0x8
  40068a:	48 c7 c5 00 00 00 00 	mov    rbp,0x0
  400691:	48 c7 c3 00 00 00 00 	mov    rbx,0x0
  400698:	48 29 eb             	sub    rbx,rbp
  40069b:	48 c1 fb 03          	sar    rbx,0x3
  40069f:	74 14                	je     4006b5 <__libc_fini_array+0x35>
  4006a1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4006a8:	48 83 eb 01          	sub    rbx,0x1
  4006ac:	ff 54 dd 00          	call   QWORD PTR [rbp+rbx*8+0x0]
  4006b0:	48 85 db             	test   rbx,rbx
  4006b3:	75 f3                	jne    4006a8 <__libc_fini_array+0x28>
  4006b5:	48 83 c4 08          	add    rsp,0x8
  4006b9:	5b                   	pop    rbx
  4006ba:	5d                   	pop    rbp
  4006bb:	c3                   	ret    

Disassembly of section .text.CRTStartup:

00000000004006c0 <CRTStartup>:
  4006c0:	f3 0f 1e fa          	endbr64 
  4006c4:	48 83 ec 08          	sub    rsp,0x8
  4006c8:	48 c7 c7 9c 3c 40 00 	mov    rdi,0x403c9c
  4006cf:	48 c7 c2 a0 3c 40 00 	mov    rdx,0x403ca0
  4006d6:	31 f6                	xor    esi,esi
  4006d8:	48 29 fa             	sub    rdx,rdi
  4006db:	e8 50 fe ff ff       	call   400530 <memset>
  4006e0:	48 83 c4 08          	add    rsp,0x8
  4006e4:	e9 27 ff ff ff       	jmp    400610 <__libc_init_array>

Disassembly of section .text.entry:

00000000004006f0 <entry>:
  4006f0:	f3 0f 1e fa          	endbr64 
  4006f4:	41 54                	push   r12
  4006f6:	49 89 f4             	mov    r12,rsi
  4006f9:	55                   	push   rbp
  4006fa:	89 fd                	mov    ebp,edi
  4006fc:	53                   	push   rbx
  4006fd:	48 89 d3             	mov    rbx,rdx
  400700:	e8 bb ff ff ff       	call   4006c0 <CRTStartup>
  400705:	48 c7 c0 a0 3c 40 00 	mov    rax,0x403ca0
  40070c:	31 ff                	xor    edi,edi
  40070e:	48 89 18             	mov    QWORD PTR [rax],rbx
  400711:	31 c0                	xor    eax,eax
  400713:	e8 68 fd ff ff       	call   400480 <sbrk>
  400718:	48 c7 c2 10 3d 40 00 	mov    rdx,0x403d10
  40071f:	4c 89 e6             	mov    rsi,r12
  400722:	89 ef                	mov    edi,ebp
  400724:	89 02                	mov    DWORD PTR [rdx],eax
  400726:	5b                   	pop    rbx
  400727:	5d                   	pop    rbp
  400728:	41 5c                	pop    r12
  40072a:	e9 0c f9 ff ff       	jmp    40003b <main>

Disassembly of section .text.get_components:

0000000000400730 <get_components>:
  400730:	66 48 0f 7e c2       	movq   rdx,xmm0
  400735:	48 89 f8             	mov    rax,rdi
  400738:	48 c1 ea 3f          	shr    rdx,0x3f
  40073c:	89 d7                	mov    edi,edx
  40073e:	83 e7 01             	and    edi,0x1
  400741:	48 85 d2             	test   rdx,rdx
  400744:	74 08                	je     40074e <get_components+0x1e>
  400746:	66 0f 57 05 c2 33 00 	xorpd  xmm0,XMMWORD PTR [rip+0x33c2]        # 403b10 <powers_of_10+0x90>
  40074d:	00 
  40074e:	f2 48 0f 2c c8       	cvttsd2si rcx,xmm0
  400753:	66 0f ef d2          	pxor   xmm2,xmm2
  400757:	66 0f 28 c8          	movapd xmm1,xmm0
  40075b:	89 f2                	mov    edx,esi
  40075d:	4c 8d 05 1c 33 00 00 	lea    r8,[rip+0x331c]        # 403a80 <powers_of_10>
  400764:	f2 41 0f 10 1c d0    	movsd  xmm3,QWORD PTR [r8+rdx*8]
  40076a:	f2 48 0f 2a d1       	cvtsi2sd xmm2,rcx
  40076f:	f2 0f 5c ca          	subsd  xmm1,xmm2
  400773:	66 0f ef d2          	pxor   xmm2,xmm2
  400777:	f2 0f 59 cb          	mulsd  xmm1,xmm3
  40077b:	f2 48 0f 2c d1       	cvttsd2si rdx,xmm1
  400780:	f2 48 0f 2a d2       	cvtsi2sd xmm2,rdx
  400785:	f2 0f 5c ca          	subsd  xmm1,xmm2
  400789:	f2 0f 10 15 8f 33 00 	movsd  xmm2,QWORD PTR [rip+0x338f]        # 403b20 <powers_of_10+0xa0>
  400790:	00 
  400791:	66 0f 2f ca          	comisd xmm1,xmm2
  400795:	76 51                	jbe    4007e8 <get_components+0xb8>
  400797:	48 83 c2 01          	add    rdx,0x1
  40079b:	66 0f ef c9          	pxor   xmm1,xmm1
  40079f:	f2 48 0f 2a ca       	cvtsi2sd xmm1,rdx
  4007a4:	66 0f 2f cb          	comisd xmm1,xmm3
  4007a8:	73 56                	jae    400800 <get_components+0xd0>
  4007aa:	85 f6                	test   esi,esi
  4007ac:	75 27                	jne    4007d5 <get_components+0xa5>
  4007ae:	66 0f ef c9          	pxor   xmm1,xmm1
  4007b2:	f2 48 0f 2a c9       	cvtsi2sd xmm1,rcx
  4007b7:	f2 0f 5c c1          	subsd  xmm0,xmm1
  4007bb:	66 0f 2f d0          	comisd xmm2,xmm0
  4007bf:	76 06                	jbe    4007c7 <get_components+0x97>
  4007c1:	66 0f 2f c2          	comisd xmm0,xmm2
  4007c5:	76 0e                	jbe    4007d5 <get_components+0xa5>
  4007c7:	48 89 ce             	mov    rsi,rcx
  4007ca:	83 e6 01             	and    esi,0x1
  4007cd:	48 83 fe 01          	cmp    rsi,0x1
  4007d1:	48 83 d9 ff          	sbb    rcx,0xffffffffffffffff
  4007d5:	48 89 08             	mov    QWORD PTR [rax],rcx
  4007d8:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
  4007dc:	40 88 78 10          	mov    BYTE PTR [rax+0x10],dil
  4007e0:	c3                   	ret    
  4007e1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4007e8:	66 0f 2e ca          	ucomisd xmm1,xmm2
  4007ec:	7a bc                	jp     4007aa <get_components+0x7a>
  4007ee:	75 ba                	jne    4007aa <get_components+0x7a>
  4007f0:	48 85 d2             	test   rdx,rdx
  4007f3:	75 1b                	jne    400810 <get_components+0xe0>
  4007f5:	48 83 c2 01          	add    rdx,0x1
  4007f9:	eb af                	jmp    4007aa <get_components+0x7a>
  4007fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  400800:	48 83 c1 01          	add    rcx,0x1
  400804:	31 d2                	xor    edx,edx
  400806:	eb a2                	jmp    4007aa <get_components+0x7a>
  400808:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40080f:	00 
  400810:	f6 c2 01             	test   dl,0x1
  400813:	74 95                	je     4007aa <get_components+0x7a>
  400815:	eb de                	jmp    4007f5 <get_components+0xc5>

Disassembly of section .text.putchar_wrapper:

0000000000400820 <putchar_wrapper>:
  400820:	f3 0f 1e fa          	endbr64 
  400824:	40 0f be ff          	movsx  edi,dil
  400828:	e9 a3 22 00 00       	jmp    402ad0 <putchar_>

Disassembly of section .text.out_rev_:

0000000000400830 <out_rev_>:
  400830:	41 57                	push   r15
  400832:	44 89 c0             	mov    eax,r8d
  400835:	41 56                	push   r14
  400837:	41 89 d6             	mov    r14d,edx
  40083a:	41 55                	push   r13
  40083c:	49 89 f5             	mov    r13,rsi
  40083f:	41 54                	push   r12
  400841:	41 89 cc             	mov    r12d,ecx
  400844:	55                   	push   rbp
  400845:	53                   	push   rbx
  400846:	48 89 fb             	mov    rbx,rdi
  400849:	48 83 ec 18          	sub    rsp,0x18
  40084d:	44 8b 7f 18          	mov    r15d,DWORD PTR [rdi+0x18]
  400851:	44 89 44 24 0c       	mov    DWORD PTR [rsp+0xc],r8d
  400856:	a8 03                	test   al,0x3
  400858:	75 16                	jne    400870 <out_rev_+0x40>
  40085a:	44 89 f8             	mov    eax,r15d
  40085d:	89 d5                	mov    ebp,edx
  40085f:	39 ca                	cmp    edx,ecx
  400861:	0f 82 93 00 00 00    	jb     4008fa <out_rev_+0xca>
  400867:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40086e:	00 00 
  400870:	41 8d 6e ff          	lea    ebp,[r14-0x1]
  400874:	4c 01 ed             	add    rbp,r13
  400877:	45 85 f6             	test   r14d,r14d
  40087a:	75 16                	jne    400892 <out_rev_+0x62>
  40087c:	eb 42                	jmp    4008c0 <out_rev_+0x90>
  40087e:	66 90                	xchg   ax,ax
  400880:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  400884:	ff d2                	call   rdx
  400886:	48 8d 45 ff          	lea    rax,[rbp-0x1]
  40088a:	49 39 ed             	cmp    r13,rbp
  40088d:	74 31                	je     4008c0 <out_rev_+0x90>
  40088f:	48 89 c5             	mov    rbp,rax
  400892:	8b 43 18             	mov    eax,DWORD PTR [rbx+0x18]
  400895:	0f be 7d 00          	movsx  edi,BYTE PTR [rbp+0x0]
  400899:	8d 50 01             	lea    edx,[rax+0x1]
  40089c:	89 53 18             	mov    DWORD PTR [rbx+0x18],edx
  40089f:	3b 43 1c             	cmp    eax,DWORD PTR [rbx+0x1c]
  4008a2:	73 e2                	jae    400886 <out_rev_+0x56>
  4008a4:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
  4008a7:	48 85 d2             	test   rdx,rdx
  4008aa:	75 d4                	jne    400880 <out_rev_+0x50>
  4008ac:	48 8b 53 10          	mov    rdx,QWORD PTR [rbx+0x10]
  4008b0:	40 88 3c 02          	mov    BYTE PTR [rdx+rax*1],dil
  4008b4:	48 8d 45 ff          	lea    rax,[rbp-0x1]
  4008b8:	49 39 ed             	cmp    r13,rbp
  4008bb:	75 d2                	jne    40088f <out_rev_+0x5f>
  4008bd:	0f 1f 00             	nop    DWORD PTR [rax]
  4008c0:	f6 44 24 0c 02       	test   BYTE PTR [rsp+0xc],0x2
  4008c5:	75 61                	jne    400928 <out_rev_+0xf8>
  4008c7:	48 83 c4 18          	add    rsp,0x18
  4008cb:	5b                   	pop    rbx
  4008cc:	5d                   	pop    rbp
  4008cd:	41 5c                	pop    r12
  4008cf:	41 5d                	pop    r13
  4008d1:	41 5e                	pop    r14
  4008d3:	41 5f                	pop    r15
  4008d5:	c3                   	ret    
  4008d6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4008dd:	00 00 00 
  4008e0:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  4008e4:	bf 20 00 00 00       	mov    edi,0x20
  4008e9:	ff d2                	call   rdx
  4008eb:	83 c5 01             	add    ebp,0x1
  4008ee:	41 39 ec             	cmp    r12d,ebp
  4008f1:	0f 84 79 ff ff ff    	je     400870 <out_rev_+0x40>
  4008f7:	8b 43 18             	mov    eax,DWORD PTR [rbx+0x18]
  4008fa:	8d 50 01             	lea    edx,[rax+0x1]
  4008fd:	89 53 18             	mov    DWORD PTR [rbx+0x18],edx
  400900:	39 43 1c             	cmp    DWORD PTR [rbx+0x1c],eax
  400903:	76 e6                	jbe    4008eb <out_rev_+0xbb>
  400905:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
  400908:	48 85 d2             	test   rdx,rdx
  40090b:	75 d3                	jne    4008e0 <out_rev_+0xb0>
  40090d:	48 8b 53 10          	mov    rdx,QWORD PTR [rbx+0x10]
  400911:	c6 04 02 20          	mov    BYTE PTR [rdx+rax*1],0x20
  400915:	eb d4                	jmp    4008eb <out_rev_+0xbb>
  400917:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40091e:	00 00 
  400920:	48 8b 53 10          	mov    rdx,QWORD PTR [rbx+0x10]
  400924:	c6 04 02 20          	mov    BYTE PTR [rdx+rax*1],0x20
  400928:	8b 43 18             	mov    eax,DWORD PTR [rbx+0x18]
  40092b:	89 c2                	mov    edx,eax
  40092d:	44 29 fa             	sub    edx,r15d
  400930:	41 39 d4             	cmp    r12d,edx
  400933:	76 92                	jbe    4008c7 <out_rev_+0x97>
  400935:	8d 48 01             	lea    ecx,[rax+0x1]
  400938:	83 c2 01             	add    edx,0x1
  40093b:	89 4b 18             	mov    DWORD PTR [rbx+0x18],ecx
  40093e:	39 43 1c             	cmp    DWORD PTR [rbx+0x1c],eax
  400941:	76 1d                	jbe    400960 <out_rev_+0x130>
  400943:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
  400946:	48 85 d2             	test   rdx,rdx
  400949:	74 d5                	je     400920 <out_rev_+0xf0>
  40094b:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  40094f:	bf 20 00 00 00       	mov    edi,0x20
  400954:	ff d2                	call   rdx
  400956:	8b 43 18             	mov    eax,DWORD PTR [rbx+0x18]
  400959:	89 c2                	mov    edx,eax
  40095b:	44 29 fa             	sub    edx,r15d
  40095e:	eb d0                	jmp    400930 <out_rev_+0x100>
  400960:	89 c8                	mov    eax,ecx
  400962:	eb cc                	jmp    400930 <out_rev_+0x100>

Disassembly of section .text.print_integer:

0000000000400970 <print_integer>:
  400970:	41 57                	push   r15
  400972:	45 89 c3             	mov    r11d,r8d
  400975:	41 56                	push   r14
  400977:	41 55                	push   r13
  400979:	41 54                	push   r12
  40097b:	41 89 cc             	mov    r12d,ecx
  40097e:	55                   	push   rbp
  40097f:	48 89 fd             	mov    rbp,rdi
  400982:	53                   	push   rbx
  400983:	89 d3                	mov    ebx,edx
  400985:	48 83 ec 28          	sub    rsp,0x28
  400989:	44 8b 44 24 60       	mov    r8d,DWORD PTR [rsp+0x60]
  40098e:	48 85 f6             	test   rsi,rsi
  400991:	0f 85 39 01 00 00    	jne    400ad0 <print_integer+0x160>
  400997:	41 f7 c0 00 08 00 00 	test   r8d,0x800
  40099e:	0f 85 0c 02 00 00    	jne    400bb0 <print_integer+0x240>
  4009a4:	c6 04 24 30          	mov    BYTE PTR [rsp],0x30
  4009a8:	41 83 e0 ef          	and    r8d,0xffffffef
  4009ac:	bf 01 00 00 00       	mov    edi,0x1
  4009b1:	41 bd 01 00 00 00    	mov    r13d,0x1
  4009b7:	41 f6 c0 02          	test   r8b,0x2
  4009bb:	0f 85 7f 01 00 00    	jne    400b40 <print_integer+0x1d0>
  4009c1:	44 89 c0             	mov    eax,r8d
  4009c4:	83 e0 01             	and    eax,0x1
  4009c7:	45 85 c9             	test   r9d,r9d
  4009ca:	0f 84 70 01 00 00    	je     400b40 <print_integer+0x1d0>
  4009d0:	85 c0                	test   eax,eax
  4009d2:	0f 84 68 01 00 00    	je     400b40 <print_integer+0x1d0>
  4009d8:	84 db                	test   bl,bl
  4009da:	0f 85 70 02 00 00    	jne    400c50 <print_integer+0x2e0>
  4009e0:	41 f6 c0 0c          	test   r8b,0xc
  4009e4:	0f 85 66 02 00 00    	jne    400c50 <print_integer+0x2e0>
  4009ea:	45 39 cd             	cmp    r13d,r9d
  4009ed:	0f 83 4d 01 00 00    	jae    400b40 <print_integer+0x1d0>
  4009f3:	40 84 ff             	test   dil,dil
  4009f6:	0f 84 44 01 00 00    	je     400b40 <print_integer+0x1d0>
  4009fc:	48 89 e6             	mov    rsi,rsp
  4009ff:	44 89 e8             	mov    eax,r13d
  400a02:	44 89 ea             	mov    edx,r13d
  400a05:	48 01 f0             	add    rax,rsi
  400a08:	eb 0a                	jmp    400a14 <print_integer+0xa4>
  400a0a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  400a10:	84 c9                	test   cl,cl
  400a12:	74 15                	je     400a29 <print_integer+0xb9>
  400a14:	83 c2 01             	add    edx,0x1
  400a17:	c6 00 30             	mov    BYTE PTR [rax],0x30
  400a1a:	83 fa 1f             	cmp    edx,0x1f
  400a1d:	0f 96 c1             	setbe  cl
  400a20:	48 83 c0 01          	add    rax,0x1
  400a24:	44 39 ca             	cmp    edx,r9d
  400a27:	72 e7                	jb     400a10 <print_integer+0xa0>
  400a29:	41 39 d3             	cmp    r11d,edx
  400a2c:	76 26                	jbe    400a54 <print_integer+0xe4>
  400a2e:	84 c9                	test   cl,cl
  400a30:	74 22                	je     400a54 <print_integer+0xe4>
  400a32:	89 d0                	mov    eax,edx
  400a34:	48 01 f0             	add    rax,rsi
  400a37:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  400a3e:	00 00 
  400a40:	83 c2 01             	add    edx,0x1
  400a43:	c6 00 30             	mov    BYTE PTR [rax],0x30
  400a46:	48 83 c0 01          	add    rax,0x1
  400a4a:	41 39 d3             	cmp    r11d,edx
  400a4d:	76 05                	jbe    400a54 <print_integer+0xe4>
  400a4f:	83 fa 1f             	cmp    edx,0x1f
  400a52:	76 ec                	jbe    400a40 <print_integer+0xd0>
  400a54:	41 39 d5             	cmp    r13d,edx
  400a57:	40 0f 92 c7          	setb   dil
  400a5b:	41 80 fc 08          	cmp    r12b,0x8
  400a5f:	0f 94 c0             	sete   al
  400a62:	40 20 f8             	and    al,dil
  400a65:	74 06                	je     400a6d <print_integer+0xfd>
  400a67:	41 83 e0 ef          	and    r8d,0xffffffef
  400a6b:	89 c7                	mov    edi,eax
  400a6d:	41 f7 c0 10 20 00 00 	test   r8d,0x2010
  400a74:	0f 84 12 01 00 00    	je     400b8c <print_integer+0x21c>
  400a7a:	41 f7 c0 00 08 00 00 	test   r8d,0x800
  400a81:	0f 84 d9 00 00 00    	je     400b60 <print_integer+0x1f0>
  400a87:	83 fa 1f             	cmp    edx,0x1f
  400a8a:	0f 96 c0             	setbe  al
  400a8d:	41 80 fc 10          	cmp    r12b,0x10
  400a91:	0f 84 c9 01 00 00    	je     400c60 <print_integer+0x2f0>
  400a97:	41 80 fc 02          	cmp    r12b,0x2
  400a9b:	75 0d                	jne    400aaa <print_integer+0x13a>
  400a9d:	84 c0                	test   al,al
  400a9f:	74 09                	je     400aaa <print_integer+0x13a>
  400aa1:	89 d0                	mov    eax,edx
  400aa3:	83 c2 01             	add    edx,0x1
  400aa6:	c6 04 04 62          	mov    BYTE PTR [rsp+rax*1],0x62
  400aaa:	83 fa 20             	cmp    edx,0x20
  400aad:	0f 85 93 01 00 00    	jne    400c46 <print_integer+0x2d6>
  400ab3:	48 89 ef             	mov    rdi,rbp
  400ab6:	44 89 c9             	mov    ecx,r9d
  400ab9:	e8 72 fd ff ff       	call   400830 <out_rev_>
  400abe:	48 83 c4 28          	add    rsp,0x28
  400ac2:	5b                   	pop    rbx
  400ac3:	5d                   	pop    rbp
  400ac4:	41 5c                	pop    r12
  400ac6:	41 5d                	pop    r13
  400ac8:	41 5e                	pop    r14
  400aca:	41 5f                	pop    r15
  400acc:	c3                   	ret    
  400acd:	0f 1f 00             	nop    DWORD PTR [rax]
  400ad0:	44 89 c0             	mov    eax,r8d
  400ad3:	44 0f b6 d1          	movzx  r10d,cl
  400ad7:	4c 8d 7c 24 ff       	lea    r15,[rsp-0x1]
  400adc:	b9 01 00 00 00       	mov    ecx,0x1
  400ae1:	83 e0 20             	and    eax,0x20
  400ae4:	83 f8 01             	cmp    eax,0x1
  400ae7:	45 19 f6             	sbb    r14d,r14d
  400aea:	41 83 e6 20          	and    r14d,0x20
  400aee:	41 83 c6 37          	add    r14d,0x37
  400af2:	eb 07                	jmp    400afb <print_integer+0x18b>
  400af4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  400af8:	48 89 c6             	mov    rsi,rax
  400afb:	31 d2                	xor    edx,edx
  400afd:	48 89 f0             	mov    rax,rsi
  400b00:	49 f7 f2             	div    r10
  400b03:	44 8d 6a 30          	lea    r13d,[rdx+0x30]
  400b07:	48 83 fa 09          	cmp    rdx,0x9
  400b0b:	41 8d 3c 16          	lea    edi,[r14+rdx*1]
  400b0f:	41 0f 46 fd          	cmovbe edi,r13d
  400b13:	83 f9 1f             	cmp    ecx,0x1f
  400b16:	41 89 cd             	mov    r13d,ecx
  400b19:	0f 96 c2             	setbe  dl
  400b1c:	41 88 3c 0f          	mov    BYTE PTR [r15+rcx*1],dil
  400b20:	89 d7                	mov    edi,edx
  400b22:	48 83 c1 01          	add    rcx,0x1
  400b26:	4c 39 d6             	cmp    rsi,r10
  400b29:	0f 82 88 fe ff ff    	jb     4009b7 <print_integer+0x47>
  400b2f:	84 d2                	test   dl,dl
  400b31:	75 c5                	jne    400af8 <print_integer+0x188>
  400b33:	41 f6 c0 02          	test   r8b,0x2
  400b37:	0f 84 84 fe ff ff    	je     4009c1 <print_integer+0x51>
  400b3d:	0f 1f 00             	nop    DWORD PTR [rax]
  400b40:	45 39 dd             	cmp    r13d,r11d
  400b43:	44 89 ea             	mov    edx,r13d
  400b46:	48 89 e6             	mov    rsi,rsp
  400b49:	0f 92 c0             	setb   al
  400b4c:	40 20 c7             	and    dil,al
  400b4f:	0f 85 dd fe ff ff    	jne    400a32 <print_integer+0xc2>
  400b55:	e9 13 ff ff ff       	jmp    400a6d <print_integer+0xfd>
  400b5a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  400b60:	85 d2                	test   edx,edx
  400b62:	0f 85 88 00 00 00    	jne    400bf0 <print_integer+0x280>
  400b68:	41 80 fc 10          	cmp    r12b,0x10
  400b6c:	0f 84 18 01 00 00    	je     400c8a <print_integer+0x31a>
  400b72:	41 80 fc 02          	cmp    r12b,0x2
  400b76:	0f 85 30 01 00 00    	jne    400cac <print_integer+0x33c>
  400b7c:	c6 04 24 62          	mov    BYTE PTR [rsp],0x62
  400b80:	b8 01 00 00 00       	mov    eax,0x1
  400b85:	c6 04 04 30          	mov    BYTE PTR [rsp+rax*1],0x30
  400b89:	8d 50 01             	lea    edx,[rax+0x1]
  400b8c:	83 fa 20             	cmp    edx,0x20
  400b8f:	0f 84 1e ff ff ff    	je     400ab3 <print_integer+0x143>
  400b95:	84 db                	test   bl,bl
  400b97:	74 37                	je     400bd0 <print_integer+0x260>
  400b99:	89 d0                	mov    eax,edx
  400b9b:	83 c2 01             	add    edx,0x1
  400b9e:	c6 04 04 2d          	mov    BYTE PTR [rsp+rax*1],0x2d
  400ba2:	e9 0c ff ff ff       	jmp    400ab3 <print_integer+0x143>
  400ba7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  400bae:	00 00 
  400bb0:	44 89 c0             	mov    eax,r8d
  400bb3:	45 31 ed             	xor    r13d,r13d
  400bb6:	41 83 e0 ef          	and    r8d,0xffffffef
  400bba:	80 f9 10             	cmp    cl,0x10
  400bbd:	44 0f 45 c0          	cmovne r8d,eax
  400bc1:	bf 01 00 00 00       	mov    edi,0x1
  400bc6:	e9 ec fd ff ff       	jmp    4009b7 <print_integer+0x47>
  400bcb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  400bd0:	41 f6 c0 04          	test   r8b,0x4
  400bd4:	75 62                	jne    400c38 <print_integer+0x2c8>
  400bd6:	41 f6 c0 08          	test   r8b,0x8
  400bda:	0f 84 d3 fe ff ff    	je     400ab3 <print_integer+0x143>
  400be0:	89 d0                	mov    eax,edx
  400be2:	83 c2 01             	add    edx,0x1
  400be5:	c6 04 04 20          	mov    BYTE PTR [rsp+rax*1],0x20
  400be9:	e9 c5 fe ff ff       	jmp    400ab3 <print_integer+0x143>
  400bee:	66 90                	xchg   ax,ax
  400bf0:	41 39 d3             	cmp    r11d,edx
  400bf3:	74 09                	je     400bfe <print_integer+0x28e>
  400bf5:	44 39 ca             	cmp    edx,r9d
  400bf8:	0f 85 89 fe ff ff    	jne    400a87 <print_integer+0x117>
  400bfe:	40 84 ff             	test   dil,dil
  400c01:	0f 84 80 fe ff ff    	je     400a87 <print_integer+0x117>
  400c07:	89 d0                	mov    eax,edx
  400c09:	83 e8 01             	sub    eax,0x1
  400c0c:	0f 84 56 ff ff ff    	je     400b68 <print_integer+0x1f8>
  400c12:	b9 04 00 01 00       	mov    ecx,0x10004
  400c17:	4c 0f a3 e1          	bt     rcx,r12
  400c1b:	0f 83 a7 00 00 00    	jae    400cc8 <print_integer+0x358>
  400c21:	41 39 c5             	cmp    r13d,eax
  400c24:	0f 83 9e 00 00 00    	jae    400cc8 <print_integer+0x358>
  400c2a:	83 ea 02             	sub    edx,0x2
  400c2d:	e9 55 fe ff ff       	jmp    400a87 <print_integer+0x117>
  400c32:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  400c38:	89 d0                	mov    eax,edx
  400c3a:	83 c2 01             	add    edx,0x1
  400c3d:	c6 04 04 2b          	mov    BYTE PTR [rsp+rax*1],0x2b
  400c41:	e9 6d fe ff ff       	jmp    400ab3 <print_integer+0x143>
  400c46:	89 d0                	mov    eax,edx
  400c48:	e9 38 ff ff ff       	jmp    400b85 <print_integer+0x215>
  400c4d:	0f 1f 00             	nop    DWORD PTR [rax]
  400c50:	41 83 e9 01          	sub    r9d,0x1
  400c54:	e9 91 fd ff ff       	jmp    4009ea <print_integer+0x7a>
  400c59:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  400c60:	44 89 c1             	mov    ecx,r8d
  400c63:	83 e1 20             	and    ecx,0x20
  400c66:	75 0c                	jne    400c74 <print_integer+0x304>
  400c68:	84 c0                	test   al,al
  400c6a:	75 4e                	jne    400cba <print_integer+0x34a>
  400c6c:	85 c9                	test   ecx,ecx
  400c6e:	0f 84 36 fe ff ff    	je     400aaa <print_integer+0x13a>
  400c74:	84 c0                	test   al,al
  400c76:	0f 84 2e fe ff ff    	je     400aaa <print_integer+0x13a>
  400c7c:	89 d0                	mov    eax,edx
  400c7e:	83 c2 01             	add    edx,0x1
  400c81:	c6 04 04 58          	mov    BYTE PTR [rsp+rax*1],0x58
  400c85:	e9 20 fe ff ff       	jmp    400aaa <print_integer+0x13a>
  400c8a:	41 f6 c0 20          	test   r8b,0x20
  400c8e:	75 0e                	jne    400c9e <print_integer+0x32e>
  400c90:	c6 04 24 78          	mov    BYTE PTR [rsp],0x78
  400c94:	b8 01 00 00 00       	mov    eax,0x1
  400c99:	e9 e7 fe ff ff       	jmp    400b85 <print_integer+0x215>
  400c9e:	c6 04 24 58          	mov    BYTE PTR [rsp],0x58
  400ca2:	b8 01 00 00 00       	mov    eax,0x1
  400ca7:	e9 d9 fe ff ff       	jmp    400b85 <print_integer+0x215>
  400cac:	c6 04 24 30          	mov    BYTE PTR [rsp],0x30
  400cb0:	ba 01 00 00 00       	mov    edx,0x1
  400cb5:	e9 db fe ff ff       	jmp    400b95 <print_integer+0x225>
  400cba:	89 d0                	mov    eax,edx
  400cbc:	83 c2 01             	add    edx,0x1
  400cbf:	c6 04 04 78          	mov    BYTE PTR [rsp+rax*1],0x78
  400cc3:	e9 e2 fd ff ff       	jmp    400aaa <print_integer+0x13a>
  400cc8:	89 c2                	mov    edx,eax
  400cca:	e9 b8 fd ff ff       	jmp    400a87 <print_integer+0x117>

Disassembly of section .text.print_broken_up_decimal.isra.0:

0000000000400cd0 <print_broken_up_decimal.isra.0>:
  400cd0:	41 56                	push   r14
  400cd2:	49 89 ca             	mov    r10,rcx
  400cd5:	41 89 d3             	mov    r11d,edx
  400cd8:	41 55                	push   r13
  400cda:	45 89 c5             	mov    r13d,r8d
  400cdd:	41 54                	push   r12
  400cdf:	55                   	push   rbp
  400ce0:	53                   	push   rbx
  400ce1:	44 8b 44 24 30       	mov    r8d,DWORD PTR [rsp+0x30]
  400ce6:	48 8b 6c 24 38       	mov    rbp,QWORD PTR [rsp+0x38]
  400ceb:	8b 4c 24 40          	mov    ecx,DWORD PTR [rsp+0x40]
  400cef:	45 85 ed             	test   r13d,r13d
  400cf2:	0f 84 90 00 00 00    	je     400d88 <print_broken_up_decimal.isra.0+0xb8>
  400cf8:	44 89 c0             	mov    eax,r8d
  400cfb:	25 10 10 00 00       	and    eax,0x1010
  400d00:	3d 00 10 00 00       	cmp    eax,0x1000
  400d05:	0f 84 05 02 00 00    	je     400f10 <print_broken_up_decimal.isra.0+0x240>
  400d0b:	41 89 cc             	mov    r12d,ecx
  400d0e:	89 cb                	mov    ebx,ecx
  400d10:	42 8d 4c 29 ff       	lea    ecx,[rcx+r13*1-0x1]
  400d15:	49 bd 67 66 66 66 66 	movabs r13,0x6666666666666667
  400d1c:	66 66 66 
  400d1f:	49 01 ec             	add    r12,rbp
  400d22:	eb 43                	jmp    400d67 <print_broken_up_decimal.isra.0+0x97>
  400d24:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  400d28:	48 89 f0             	mov    rax,rsi
  400d2b:	41 89 ce             	mov    r14d,ecx
  400d2e:	49 83 c4 01          	add    r12,0x1
  400d32:	49 f7 ed             	imul   r13
  400d35:	48 89 f0             	mov    rax,rsi
  400d38:	41 29 de             	sub    r14d,ebx
  400d3b:	83 c3 01             	add    ebx,0x1
  400d3e:	48 c1 f8 3f          	sar    rax,0x3f
  400d42:	48 c1 fa 02          	sar    rdx,0x2
  400d46:	48 29 c2             	sub    rdx,rax
  400d49:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  400d4d:	48 01 c0             	add    rax,rax
  400d50:	48 29 c6             	sub    rsi,rax
  400d53:	83 c6 30             	add    esi,0x30
  400d56:	41 88 74 24 ff       	mov    BYTE PTR [r12-0x1],sil
  400d5b:	48 89 d6             	mov    rsi,rdx
  400d5e:	48 85 d2             	test   rdx,rdx
  400d61:	0f 84 f9 00 00 00    	je     400e60 <print_broken_up_decimal.isra.0+0x190>
  400d67:	83 fb 20             	cmp    ebx,0x20
  400d6a:	75 bc                	jne    400d28 <print_broken_up_decimal.isra.0+0x58>
  400d6c:	44 89 c0             	mov    eax,r8d
  400d6f:	83 e0 03             	and    eax,0x3
  400d72:	83 f8 01             	cmp    eax,0x1
  400d75:	0f 84 35 01 00 00    	je     400eb0 <print_broken_up_decimal.isra.0+0x1e0>
  400d7b:	ba 20 00 00 00       	mov    edx,0x20
  400d80:	e9 7d 00 00 00       	jmp    400e02 <print_broken_up_decimal.isra.0+0x132>
  400d85:	0f 1f 00             	nop    DWORD PTR [rax]
  400d88:	41 f6 c0 10          	test   r8b,0x10
  400d8c:	0f 85 8e 00 00 00    	jne    400e20 <print_broken_up_decimal.isra.0+0x150>
  400d92:	48 bb 67 66 66 66 66 	movabs rbx,0x6666666666666667
  400d99:	66 66 66 
  400d9c:	89 ce                	mov    esi,ecx
  400d9e:	48 01 ee             	add    rsi,rbp
  400da1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  400da8:	83 f9 20             	cmp    ecx,0x20
  400dab:	74 bf                	je     400d6c <print_broken_up_decimal.isra.0+0x9c>
  400dad:	48 89 f8             	mov    rax,rdi
  400db0:	83 c1 01             	add    ecx,0x1
  400db3:	48 83 c6 01          	add    rsi,0x1
  400db7:	48 f7 eb             	imul   rbx
  400dba:	48 89 f8             	mov    rax,rdi
  400dbd:	48 c1 f8 3f          	sar    rax,0x3f
  400dc1:	48 c1 fa 02          	sar    rdx,0x2
  400dc5:	48 29 c2             	sub    rdx,rax
  400dc8:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  400dcc:	48 01 c0             	add    rax,rax
  400dcf:	48 29 c7             	sub    rdi,rax
  400dd2:	83 c7 30             	add    edi,0x30
  400dd5:	40 88 7e ff          	mov    BYTE PTR [rsi-0x1],dil
  400dd9:	48 89 d7             	mov    rdi,rdx
  400ddc:	48 85 d2             	test   rdx,rdx
  400ddf:	75 c7                	jne    400da8 <print_broken_up_decimal.isra.0+0xd8>
  400de1:	44 89 c0             	mov    eax,r8d
  400de4:	83 e0 03             	and    eax,0x3
  400de7:	83 f8 01             	cmp    eax,0x1
  400dea:	0f 84 b8 01 00 00    	je     400fa8 <print_broken_up_decimal.isra.0+0x2d8>
  400df0:	83 f9 20             	cmp    ecx,0x20
  400df3:	74 86                	je     400d7b <print_broken_up_decimal.isra.0+0xab>
  400df5:	45 84 db             	test   r11b,r11b
  400df8:	74 46                	je     400e40 <print_broken_up_decimal.isra.0+0x170>
  400dfa:	c6 44 0d 00 2d       	mov    BYTE PTR [rbp+rcx*1+0x0],0x2d
  400dff:	8d 51 01             	lea    edx,[rcx+0x1]
  400e02:	5b                   	pop    rbx
  400e03:	48 89 ee             	mov    rsi,rbp
  400e06:	44 89 c9             	mov    ecx,r9d
  400e09:	5d                   	pop    rbp
  400e0a:	4c 89 d7             	mov    rdi,r10
  400e0d:	41 5c                	pop    r12
  400e0f:	41 5d                	pop    r13
  400e11:	41 5e                	pop    r14
  400e13:	e9 18 fa ff ff       	jmp    400830 <out_rev_>
  400e18:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  400e1f:	00 
  400e20:	83 f9 20             	cmp    ecx,0x20
  400e23:	0f 84 43 ff ff ff    	je     400d6c <print_broken_up_decimal.isra.0+0x9c>
  400e29:	89 c8                	mov    eax,ecx
  400e2b:	83 c1 01             	add    ecx,0x1
  400e2e:	c6 44 05 00 2e       	mov    BYTE PTR [rbp+rax*1+0x0],0x2e
  400e33:	e9 5a ff ff ff       	jmp    400d92 <print_broken_up_decimal.isra.0+0xc2>
  400e38:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  400e3f:	00 
  400e40:	41 f6 c0 04          	test   r8b,0x4
  400e44:	0f 85 3e 01 00 00    	jne    400f88 <print_broken_up_decimal.isra.0+0x2b8>
  400e4a:	89 ca                	mov    edx,ecx
  400e4c:	41 f6 c0 08          	test   r8b,0x8
  400e50:	74 b0                	je     400e02 <print_broken_up_decimal.isra.0+0x132>
  400e52:	c6 44 0d 00 20       	mov    BYTE PTR [rbp+rcx*1+0x0],0x20
  400e57:	83 c2 01             	add    edx,0x1
  400e5a:	eb a6                	jmp    400e02 <print_broken_up_decimal.isra.0+0x132>
  400e5c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  400e60:	83 fb 1f             	cmp    ebx,0x1f
  400e63:	77 13                	ja     400e78 <print_broken_up_decimal.isra.0+0x1a8>
  400e65:	45 85 f6             	test   r14d,r14d
  400e68:	89 d8                	mov    eax,ebx
  400e6a:	0f 95 c2             	setne  dl
  400e6d:	48 01 e8             	add    rax,rbp
  400e70:	84 d2                	test   dl,dl
  400e72:	75 20                	jne    400e94 <print_broken_up_decimal.isra.0+0x1c4>
  400e74:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  400e78:	83 fb 20             	cmp    ebx,0x20
  400e7b:	0f 84 eb fe ff ff    	je     400d6c <print_broken_up_decimal.isra.0+0x9c>
  400e81:	c6 44 1d 00 2e       	mov    BYTE PTR [rbp+rbx*1+0x0],0x2e
  400e86:	8d 4b 01             	lea    ecx,[rbx+0x1]
  400e89:	e9 04 ff ff ff       	jmp    400d92 <print_broken_up_decimal.isra.0+0xc2>
  400e8e:	66 90                	xchg   ax,ax
  400e90:	39 ca                	cmp    edx,ecx
  400e92:	74 e4                	je     400e78 <print_broken_up_decimal.isra.0+0x1a8>
  400e94:	89 da                	mov    edx,ebx
  400e96:	83 c3 01             	add    ebx,0x1
  400e99:	c6 00 30             	mov    BYTE PTR [rax],0x30
  400e9c:	48 83 c0 01          	add    rax,0x1
  400ea0:	83 fb 1f             	cmp    ebx,0x1f
  400ea3:	76 eb                	jbe    400e90 <print_broken_up_decimal.isra.0+0x1c0>
  400ea5:	eb d1                	jmp    400e78 <print_broken_up_decimal.isra.0+0x1a8>
  400ea7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  400eae:	00 00 
  400eb0:	45 85 c9             	test   r9d,r9d
  400eb3:	0f 84 c2 fe ff ff    	je     400d7b <print_broken_up_decimal.isra.0+0xab>
  400eb9:	31 d2                	xor    edx,edx
  400ebb:	b9 20 00 00 00       	mov    ecx,0x20
  400ec0:	45 84 db             	test   r11b,r11b
  400ec3:	0f 85 cf 00 00 00    	jne    400f98 <print_broken_up_decimal.isra.0+0x2c8>
  400ec9:	41 f6 c0 0c          	test   r8b,0xc
  400ecd:	0f 85 c5 00 00 00    	jne    400f98 <print_broken_up_decimal.isra.0+0x2c8>
  400ed3:	44 39 c9             	cmp    ecx,r9d
  400ed6:	0f 83 14 ff ff ff    	jae    400df0 <print_broken_up_decimal.isra.0+0x120>
  400edc:	89 c8                	mov    eax,ecx
  400ede:	48 01 e8             	add    rax,rbp
  400ee1:	84 d2                	test   dl,dl
  400ee3:	0f 84 07 ff ff ff    	je     400df0 <print_broken_up_decimal.isra.0+0x120>
  400ee9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  400ef0:	83 c1 01             	add    ecx,0x1
  400ef3:	c6 00 30             	mov    BYTE PTR [rax],0x30
  400ef6:	48 83 c0 01          	add    rax,0x1
  400efa:	44 39 c9             	cmp    ecx,r9d
  400efd:	0f 83 ed fe ff ff    	jae    400df0 <print_broken_up_decimal.isra.0+0x120>
  400f03:	83 f9 1f             	cmp    ecx,0x1f
  400f06:	76 e8                	jbe    400ef0 <print_broken_up_decimal.isra.0+0x220>
  400f08:	e9 e3 fe ff ff       	jmp    400df0 <print_broken_up_decimal.isra.0+0x120>
  400f0d:	0f 1f 00             	nop    DWORD PTR [rax]
  400f10:	48 85 f6             	test   rsi,rsi
  400f13:	0f 8e 79 fe ff ff    	jle    400d92 <print_broken_up_decimal.isra.0+0xc2>
  400f19:	48 bb cd cc cc cc cc 	movabs rbx,0xcccccccccccccccd
  400f20:	cc cc cc 
  400f23:	48 89 f0             	mov    rax,rsi
  400f26:	48 ba 98 99 99 99 99 	movabs rdx,0x1999999999999998
  400f2d:	99 99 19 
  400f30:	48 0f af c3          	imul   rax,rbx
  400f34:	48 01 d0             	add    rax,rdx
  400f37:	48 d1 c8             	ror    rax,1
  400f3a:	48 39 d0             	cmp    rax,rdx
  400f3d:	0f 87 c8 fd ff ff    	ja     400d0b <print_broken_up_decimal.isra.0+0x3b>
  400f43:	49 be 99 99 99 99 99 	movabs r14,0x1999999999999999
  400f4a:	99 99 19 
  400f4d:	0f 1f 00             	nop    DWORD PTR [rax]
  400f50:	48 89 f0             	mov    rax,rsi
  400f53:	49 89 f4             	mov    r12,rsi
  400f56:	41 83 ed 01          	sub    r13d,0x1
  400f5a:	48 f7 e3             	mul    rbx
  400f5d:	48 89 d6             	mov    rsi,rdx
  400f60:	48 c1 ee 03          	shr    rsi,0x3
  400f64:	48 89 f0             	mov    rax,rsi
  400f67:	48 0f af c3          	imul   rax,rbx
  400f6b:	48 d1 c8             	ror    rax,1
  400f6e:	4c 39 f0             	cmp    rax,r14
  400f71:	76 dd                	jbe    400f50 <print_broken_up_decimal.isra.0+0x280>
  400f73:	49 83 fc 09          	cmp    r12,0x9
  400f77:	0f 8f 8e fd ff ff    	jg     400d0b <print_broken_up_decimal.isra.0+0x3b>
  400f7d:	e9 10 fe ff ff       	jmp    400d92 <print_broken_up_decimal.isra.0+0xc2>
  400f82:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  400f88:	c6 44 0d 00 2b       	mov    BYTE PTR [rbp+rcx*1+0x0],0x2b
  400f8d:	8d 51 01             	lea    edx,[rcx+0x1]
  400f90:	e9 6d fe ff ff       	jmp    400e02 <print_broken_up_decimal.isra.0+0x132>
  400f95:	0f 1f 00             	nop    DWORD PTR [rax]
  400f98:	41 83 e9 01          	sub    r9d,0x1
  400f9c:	e9 32 ff ff ff       	jmp    400ed3 <print_broken_up_decimal.isra.0+0x203>
  400fa1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  400fa8:	45 85 c9             	test   r9d,r9d
  400fab:	0f 84 3f fe ff ff    	je     400df0 <print_broken_up_decimal.isra.0+0x120>
  400fb1:	83 f9 1f             	cmp    ecx,0x1f
  400fb4:	0f 96 c2             	setbe  dl
  400fb7:	e9 04 ff ff ff       	jmp    400ec0 <print_broken_up_decimal.isra.0+0x1f0>

Disassembly of section .text.print_exponential_number:

0000000000400fc0 <print_exponential_number>:
  400fc0:	41 57                	push   r15
  400fc2:	41 89 f2             	mov    r10d,esi
  400fc5:	41 89 cf             	mov    r15d,ecx
  400fc8:	4d 89 c3             	mov    r11,r8
  400fcb:	41 56                	push   r14
  400fcd:	41 55                	push   r13
  400fcf:	41 54                	push   r12
  400fd1:	49 89 fc             	mov    r12,rdi
  400fd4:	55                   	push   rbp
  400fd5:	89 d5                	mov    ebp,edx
  400fd7:	66 48 0f 7e c2       	movq   rdx,xmm0
  400fdc:	53                   	push   rbx
  400fdd:	48 83 ec 38          	sub    rsp,0x38
  400fe1:	48 c1 ea 3f          	shr    rdx,0x3f
  400fe5:	74 08                	je     400fef <print_exponential_number+0x2f>
  400fe7:	66 0f 57 05 21 2b 00 	xorpd  xmm0,XMMWORD PTR [rip+0x2b21]        # 403b10 <powers_of_10+0x90>
  400fee:	00 
  400fef:	44 89 f9             	mov    ecx,r15d
  400ff2:	66 0f ef db          	pxor   xmm3,xmm3
  400ff6:	81 e1 00 10 00 00    	and    ecx,0x1000
  400ffc:	66 0f 2e c3          	ucomisd xmm0,xmm3
  401000:	0f 8a 9a 00 00 00    	jp     4010a0 <print_exponential_number+0xe0>
  401006:	0f 85 94 00 00 00    	jne    4010a0 <print_exponential_number+0xe0>
  40100c:	85 c9                	test   ecx,ecx
  40100e:	0f 85 6c 02 00 00    	jne    401280 <print_exponential_number+0x2c0>
  401014:	48 85 d2             	test   rdx,rdx
  401017:	0f 84 fc 06 00 00    	je     401719 <print_exponential_number+0x759>
  40101d:	31 c0                	xor    eax,eax
  40101f:	31 db                	xor    ebx,ebx
  401021:	66 0f 57 05 e7 2a 00 	xorpd  xmm0,XMMWORD PTR [rip+0x2ae7]        # 403b10 <powers_of_10+0x90>
  401028:	00 
  401029:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  40102e:	44 89 d6             	mov    esi,r10d
  401031:	88 44 24 0c          	mov    BYTE PTR [rsp+0xc],al
  401035:	e8 f6 f6 ff ff       	call   400730 <get_components>
  40103a:	0f b6 44 24 0c       	movzx  eax,BYTE PTR [rsp+0xc]
  40103f:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  401044:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  401049:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  40104e:	84 c0                	test   al,al
  401050:	0f 84 0a 03 00 00    	je     401360 <print_exponential_number+0x3a0>
  401056:	41 f7 c7 00 10 00 00 	test   r15d,0x1000
  40105d:	74 09                	je     401068 <print_exponential_number+0xa8>
  40105f:	83 fb ff             	cmp    ebx,0xffffffff
  401062:	0f 8d 48 05 00 00    	jge    4015b0 <print_exponential_number+0x5f0>
  401068:	85 ed                	test   ebp,ebp
  40106a:	0f 84 30 03 00 00    	je     4013a0 <print_exponential_number+0x3e0>
  401070:	48 83 ec 08          	sub    rsp,0x8
  401074:	45 89 d0             	mov    r8d,r10d
  401077:	4c 89 e1             	mov    rcx,r12
  40107a:	41 51                	push   r9
  40107c:	41 89 e9             	mov    r9d,ebp
  40107f:	41 53                	push   r11
  401081:	41 57                	push   r15
  401083:	e8 48 fc ff ff       	call   400cd0 <print_broken_up_decimal.isra.0>
  401088:	48 83 c4 20          	add    rsp,0x20
  40108c:	48 83 c4 38          	add    rsp,0x38
  401090:	5b                   	pop    rbx
  401091:	5d                   	pop    rbp
  401092:	41 5c                	pop    r12
  401094:	41 5d                	pop    r13
  401096:	41 5e                	pop    r14
  401098:	41 5f                	pop    r15
  40109a:	c3                   	ret    
  40109b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4010a0:	66 48 0f 7e c6       	movq   rsi,xmm0
  4010a5:	f2 0f 10 2d a3 2a 00 	movsd  xmm5,QWORD PTR [rip+0x2aa3]        # 403b50 <powers_of_10+0xd0>
  4010ac:	00 
  4010ad:	48 b8 ff ff ff ff ff 	movabs rax,0xfffffffffffff
  4010b4:	ff 0f 00 
  4010b7:	48 bf 00 00 00 00 00 	movabs rdi,0x3ff0000000000000
  4010be:	00 f0 3f 
  4010c1:	48 21 f0             	and    rax,rsi
  4010c4:	f2 0f 10 15 74 2a 00 	movsd  xmm2,QWORD PTR [rip+0x2a74]        # 403b40 <powers_of_10+0xc0>
  4010cb:	00 
  4010cc:	48 c1 ee 34          	shr    rsi,0x34
  4010d0:	48 09 f8             	or     rax,rdi
  4010d3:	81 e6 ff 07 00 00    	and    esi,0x7ff
  4010d9:	66 48 0f 6e c8       	movq   xmm1,rax
  4010de:	f2 0f 5c 0d 52 2a 00 	subsd  xmm1,QWORD PTR [rip+0x2a52]        # 403b38 <powers_of_10+0xb8>
  4010e5:	00 
  4010e6:	81 ee ff 03 00 00    	sub    esi,0x3ff
  4010ec:	f2 0f 59 d1          	mulsd  xmm2,xmm1
  4010f0:	66 0f 28 e1          	movapd xmm4,xmm1
  4010f4:	f2 0f 59 e1          	mulsd  xmm4,xmm1
  4010f8:	f2 0f 58 15 48 2a 00 	addsd  xmm2,QWORD PTR [rip+0x2a48]        # 403b48 <powers_of_10+0xc8>
  4010ff:	00 
  401100:	f2 0f 59 ec          	mulsd  xmm5,xmm4
  401104:	f2 0f 59 cc          	mulsd  xmm1,xmm4
  401108:	f2 0f 59 0d 48 2a 00 	mulsd  xmm1,QWORD PTR [rip+0x2a48]        # 403b58 <powers_of_10+0xd8>
  40110f:	00 
  401110:	f2 0f 5c d5          	subsd  xmm2,xmm5
  401114:	f2 0f 58 ca          	addsd  xmm1,xmm2
  401118:	66 0f ef d2          	pxor   xmm2,xmm2
  40111c:	f2 0f 2a d6          	cvtsi2sd xmm2,esi
  401120:	f2 0f 59 15 38 2a 00 	mulsd  xmm2,QWORD PTR [rip+0x2a38]        # 403b60 <powers_of_10+0xe0>
  401127:	00 
  401128:	f2 0f 58 ca          	addsd  xmm1,xmm2
  40112c:	66 0f 2f cb          	comisd xmm1,xmm3
  401130:	f2 0f 2c d9          	cvttsd2si ebx,xmm1
  401134:	73 18                	jae    40114e <print_exponential_number+0x18e>
  401136:	66 0f ef d2          	pxor   xmm2,xmm2
  40113a:	f2 0f 2a d3          	cvtsi2sd xmm2,ebx
  40113e:	66 0f 2e ca          	ucomisd xmm1,xmm2
  401142:	0f 8a 98 04 00 00    	jp     4015e0 <print_exponential_number+0x620>
  401148:	0f 85 92 04 00 00    	jne    4015e0 <print_exponential_number+0x620>
  40114e:	81 fb cc fe ff ff    	cmp    ebx,0xfffffecc
  401154:	0f 84 16 05 00 00    	je     401670 <print_exponential_number+0x6b0>
  40115a:	66 0f ef d2          	pxor   xmm2,xmm2
  40115e:	f2 0f 10 0d 02 2a 00 	movsd  xmm1,QWORD PTR [rip+0x2a02]        # 403b68 <powers_of_10+0xe8>
  401165:	00 
  401166:	66 0f ef e4          	pxor   xmm4,xmm4
  40116a:	f2 0f 2a d3          	cvtsi2sd xmm2,ebx
  40116e:	f2 0f 59 ca          	mulsd  xmm1,xmm2
  401172:	f2 0f 58 0d a6 29 00 	addsd  xmm1,QWORD PTR [rip+0x29a6]        # 403b20 <powers_of_10+0xa0>
  401179:	00 
  40117a:	f2 0f 2c c1          	cvttsd2si eax,xmm1
  40117e:	66 0f 2f cb          	comisd xmm1,xmm3
  401182:	f2 0f 2a e0          	cvtsi2sd xmm4,eax
  401186:	73 10                	jae    401198 <print_exponential_number+0x1d8>
  401188:	66 0f 2e cc          	ucomisd xmm1,xmm4
  40118c:	0f 8a ce 04 00 00    	jp     401660 <print_exponential_number+0x6a0>
  401192:	0f 85 c8 04 00 00    	jne    401660 <print_exponential_number+0x6a0>
  401198:	f2 0f 59 25 d8 29 00 	mulsd  xmm4,QWORD PTR [rip+0x29d8]        # 403b78 <powers_of_10+0xf8>
  40119f:	00 
  4011a0:	f2 0f 10 35 e0 29 00 	movsd  xmm6,QWORD PTR [rip+0x29e0]        # 403b88 <powers_of_10+0x108>
  4011a7:	00 
  4011a8:	48 98                	cdqe   
  4011aa:	f2 0f 59 15 be 29 00 	mulsd  xmm2,QWORD PTR [rip+0x29be]        # 403b70 <powers_of_10+0xf0>
  4011b1:	00 
  4011b2:	48 05 ff 03 00 00    	add    rax,0x3ff
  4011b8:	48 c1 e0 34          	shl    rax,0x34
  4011bc:	66 48 0f 6e f8       	movq   xmm7,rax
  4011c1:	f2 0f 5c d4          	subsd  xmm2,xmm4
  4011c5:	66 0f 28 da          	movapd xmm3,xmm2
  4011c9:	66 0f 28 ca          	movapd xmm1,xmm2
  4011cd:	f2 0f 59 da          	mulsd  xmm3,xmm2
  4011d1:	f2 0f 58 ca          	addsd  xmm1,xmm2
  4011d5:	66 0f 28 eb          	movapd xmm5,xmm3
  4011d9:	f2 0f 5e 2d 9f 29 00 	divsd  xmm5,QWORD PTR [rip+0x299f]        # 403b80 <powers_of_10+0x100>
  4011e0:	00 
  4011e1:	f2 0f 58 ee          	addsd  xmm5,xmm6
  4011e5:	66 0f 28 e3          	movapd xmm4,xmm3
  4011e9:	f2 0f 5e e5          	divsd  xmm4,xmm5
  4011ed:	f2 0f 58 25 9b 29 00 	addsd  xmm4,QWORD PTR [rip+0x299b]        # 403b90 <powers_of_10+0x110>
  4011f4:	00 
  4011f5:	f2 0f 5e dc          	divsd  xmm3,xmm4
  4011f9:	f2 0f 10 25 97 29 00 	movsd  xmm4,QWORD PTR [rip+0x2997]        # 403b98 <powers_of_10+0x118>
  401200:	00 
  401201:	f2 0f 5c e2          	subsd  xmm4,xmm2
  401205:	f2 0f 58 dc          	addsd  xmm3,xmm4
  401209:	f2 0f 5e cb          	divsd  xmm1,xmm3
  40120d:	f2 0f 58 0d 8b 29 00 	addsd  xmm1,QWORD PTR [rip+0x298b]        # 403ba0 <powers_of_10+0x120>
  401214:	00 
  401215:	f2 0f 59 cf          	mulsd  xmm1,xmm7
  401219:	66 0f 2f c8          	comisd xmm1,xmm0
  40121d:	0f 87 7d 03 00 00    	ja     4015a0 <print_exponential_number+0x5e0>
  401223:	8d 43 11             	lea    eax,[rbx+0x11]
  401226:	31 f6                	xor    esi,esi
  401228:	83 f8 22             	cmp    eax,0x22
  40122b:	77 1a                	ja     401247 <print_exponential_number+0x287>
  40122d:	89 d8                	mov    eax,ebx
  40122f:	48 8d 35 4a 28 00 00 	lea    rsi,[rip+0x284a]        # 403a80 <powers_of_10>
  401236:	f7 d8                	neg    eax
  401238:	0f 48 c3             	cmovs  eax,ebx
  40123b:	48 98                	cdqe   
  40123d:	f2 0f 10 0c c6       	movsd  xmm1,QWORD PTR [rsi+rax*8]
  401242:	be 01 00 00 00       	mov    esi,0x1
  401247:	89 d8                	mov    eax,ebx
  401249:	c1 e8 1f             	shr    eax,0x1f
  40124c:	21 c6                	and    esi,eax
  40124e:	85 db                	test   ebx,ebx
  401250:	40 0f 94 c7          	sete   dil
  401254:	31 c0                	xor    eax,eax
  401256:	85 c9                	test   ecx,ecx
  401258:	74 5f                	je     4012b9 <print_exponential_number+0x2f9>
  40125a:	45 85 d2             	test   r10d,r10d
  40125d:	b8 01 00 00 00       	mov    eax,0x1
  401262:	41 0f 45 c2          	cmovne eax,r10d
  401266:	39 c3                	cmp    ebx,eax
  401268:	0f 9c c0             	setl   al
  40126b:	83 fb fc             	cmp    ebx,0xfffffffc
  40126e:	0f 9d c1             	setge  cl
  401271:	21 c8                	and    eax,ecx
  401273:	09 c7                	or     edi,eax
  401275:	eb 23                	jmp    40129a <print_exponential_number+0x2da>
  401277:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40127e:	00 00 
  401280:	45 85 d2             	test   r10d,r10d
  401283:	b8 01 00 00 00       	mov    eax,0x1
  401288:	bf 01 00 00 00       	mov    edi,0x1
  40128d:	41 0f 45 c2          	cmovne eax,r10d
  401291:	85 c0                	test   eax,eax
  401293:	0f 9f c0             	setg   al
  401296:	31 f6                	xor    esi,esi
  401298:	31 db                	xor    ebx,ebx
  40129a:	41 83 ea 01          	sub    r10d,0x1
  40129e:	44 89 d1             	mov    ecx,r10d
  4012a1:	29 d9                	sub    ecx,ebx
  4012a3:	84 c0                	test   al,al
  4012a5:	44 0f 45 d1          	cmovne r10d,ecx
  4012a9:	31 c9                	xor    ecx,ecx
  4012ab:	45 85 d2             	test   r10d,r10d
  4012ae:	44 0f 48 d1          	cmovs  r10d,ecx
  4012b2:	41 81 cf 00 08 00 00 	or     r15d,0x800
  4012b9:	40 84 ff             	test   dil,dil
  4012bc:	0f 85 c6 02 00 00    	jne    401588 <print_exponential_number+0x5c8>
  4012c2:	44 89 d1             	mov    ecx,r10d
  4012c5:	29 d9                	sub    ecx,ebx
  4012c7:	40 84 f6             	test   sil,sil
  4012ca:	0f 84 28 02 00 00    	je     4014f8 <print_exponential_number+0x538>
  4012d0:	66 0f 28 d0          	movapd xmm2,xmm0
  4012d4:	f2 0f 59 d1          	mulsd  xmm2,xmm1
  4012d8:	81 f9 32 01 00 00    	cmp    ecx,0x132
  4012de:	0f 8f ac 03 00 00    	jg     401690 <print_exponential_number+0x6d0>
  4012e4:	f2 48 0f 2c fa       	cvttsd2si rdi,xmm2
  4012e9:	66 0f ef d2          	pxor   xmm2,xmm2
  4012ed:	66 0f 28 d9          	movapd xmm3,xmm1
  4012f1:	44 89 d1             	mov    ecx,r10d
  4012f4:	48 8d 35 85 27 00 00 	lea    rsi,[rip+0x2785]        # 403a80 <powers_of_10>
  4012fb:	f2 48 0f 2a d7       	cvtsi2sd xmm2,rdi
  401300:	f2 0f 5e d1          	divsd  xmm2,xmm1
  401304:	f2 0f 5c c2          	subsd  xmm0,xmm2
  401308:	f2 0f 10 14 ce       	movsd  xmm2,QWORD PTR [rsi+rcx*8]
  40130d:	f2 0f 59 da          	mulsd  xmm3,xmm2
  401311:	f2 0f 59 c3          	mulsd  xmm0,xmm3
  401315:	f2 48 0f 2c c8       	cvttsd2si rcx,xmm0
  40131a:	66 0f ef c9          	pxor   xmm1,xmm1
  40131e:	31 f6                	xor    esi,esi
  401320:	f2 48 0f 2a c9       	cvtsi2sd xmm1,rcx
  401325:	f2 0f 5c c1          	subsd  xmm0,xmm1
  401329:	66 0f 2f 05 ef 27 00 	comisd xmm0,QWORD PTR [rip+0x27ef]        # 403b20 <powers_of_10+0xa0>
  401330:	00 
  401331:	40 0f 93 c6          	setae  sil
  401335:	48 01 ce             	add    rsi,rcx
  401338:	66 0f 2e 05 e0 27 00 	ucomisd xmm0,QWORD PTR [rip+0x27e0]        # 403b20 <powers_of_10+0xa0>
  40133f:	00 
  401340:	7a 06                	jp     401348 <print_exponential_number+0x388>
  401342:	75 04                	jne    401348 <print_exponential_number+0x388>
  401344:	48 83 e6 fe          	and    rsi,0xfffffffffffffffe
  401348:	66 0f ef c0          	pxor   xmm0,xmm0
  40134c:	f2 48 0f 2a c6       	cvtsi2sd xmm0,rsi
  401351:	66 0f 2f c2          	comisd xmm0,xmm2
  401355:	72 06                	jb     40135d <print_exponential_number+0x39d>
  401357:	48 83 c7 01          	add    rdi,0x1
  40135b:	31 f6                	xor    esi,esi
  40135d:	83 e2 01             	and    edx,0x1
  401360:	48 83 ff 09          	cmp    rdi,0x9
  401364:	7e 0a                	jle    401370 <print_exponential_number+0x3b0>
  401366:	83 c3 01             	add    ebx,0x1
  401369:	31 f6                	xor    esi,esi
  40136b:	bf 01 00 00 00       	mov    edi,0x1
  401370:	45 89 fe             	mov    r14d,r15d
  401373:	8d 4b 63             	lea    ecx,[rbx+0x63]
  401376:	41 83 e6 02          	and    r14d,0x2
  40137a:	81 f9 c6 00 00 00    	cmp    ecx,0xc6
  401380:	77 4e                	ja     4013d0 <print_exponential_number+0x410>
  401382:	45 85 f6             	test   r14d,r14d
  401385:	0f 85 c5 02 00 00    	jne    401650 <print_exponential_number+0x690>
  40138b:	41 be 04 00 00 00    	mov    r14d,0x4
  401391:	e9 68 02 00 00       	jmp    4015fe <print_exponential_number+0x63e>
  401396:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40139d:	00 00 00 
  4013a0:	48 83 ec 08          	sub    rsp,0x8
  4013a4:	4c 89 e1             	mov    rcx,r12
  4013a7:	45 89 d0             	mov    r8d,r10d
  4013aa:	41 51                	push   r9
  4013ac:	45 31 c9             	xor    r9d,r9d
  4013af:	41 53                	push   r11
  4013b1:	41 57                	push   r15
  4013b3:	e8 18 f9 ff ff       	call   400cd0 <print_broken_up_decimal.isra.0>
  4013b8:	48 83 c4 20          	add    rsp,0x20
  4013bc:	48 83 c4 38          	add    rsp,0x38
  4013c0:	5b                   	pop    rbx
  4013c1:	5d                   	pop    rbp
  4013c2:	41 5c                	pop    r12
  4013c4:	41 5d                	pop    r13
  4013c6:	41 5e                	pop    r14
  4013c8:	41 5f                	pop    r15
  4013ca:	c3                   	ret    
  4013cb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4013d0:	45 85 f6             	test   r14d,r14d
  4013d3:	0f 84 1f 02 00 00    	je     4015f8 <print_exponential_number+0x638>
  4013d9:	b8 04 00 00 00       	mov    eax,0x4
  4013de:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  4013e2:	48 83 ec 08          	sub    rsp,0x8
  4013e6:	45 89 d0             	mov    r8d,r10d
  4013e9:	4c 89 e1             	mov    rcx,r12
  4013ec:	41 51                	push   r9
  4013ee:	45 31 c9             	xor    r9d,r9d
  4013f1:	45 8b 6c 24 18       	mov    r13d,DWORD PTR [r12+0x18]
  4013f6:	41 53                	push   r11
  4013f8:	41 57                	push   r15
  4013fa:	e8 d1 f8 ff ff       	call   400cd0 <print_broken_up_decimal.isra.0>
  4013ff:	8b 44 24 2c          	mov    eax,DWORD PTR [rsp+0x2c]
  401403:	48 83 c4 20          	add    rsp,0x20
  401407:	41 83 e7 20          	and    r15d,0x20
  40140b:	41 8b 4c 24 18       	mov    ecx,DWORD PTR [r12+0x18]
  401410:	41 83 ff 01          	cmp    r15d,0x1
  401414:	19 d2                	sbb    edx,edx
  401416:	8d 71 01             	lea    esi,[rcx+0x1]
  401419:	83 e2 20             	and    edx,0x20
  40141c:	41 89 74 24 18       	mov    DWORD PTR [r12+0x18],esi
  401421:	83 c2 45             	add    edx,0x45
  401424:	41 83 ff 01          	cmp    r15d,0x1
  401428:	19 ff                	sbb    edi,edi
  40142a:	83 e7 20             	and    edi,0x20
  40142d:	83 c7 45             	add    edi,0x45
  401430:	41 3b 4c 24 1c       	cmp    ecx,DWORD PTR [r12+0x1c]
  401435:	73 1d                	jae    401454 <print_exponential_number+0x494>
  401437:	4d 8b 04 24          	mov    r8,QWORD PTR [r12]
  40143b:	4d 85 c0             	test   r8,r8
  40143e:	0f 84 bc 02 00 00    	je     401700 <print_exponential_number+0x740>
  401444:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  401448:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  40144d:	41 ff d0             	call   r8
  401450:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
  401454:	48 63 d3             	movsxd rdx,ebx
  401457:	41 89 da             	mov    r10d,ebx
  40145a:	41 89 c1             	mov    r9d,eax
  40145d:	b9 0a 00 00 00       	mov    ecx,0xa
  401462:	48 89 d6             	mov    rsi,rdx
  401465:	41 c1 ea 1f          	shr    r10d,0x1f
  401469:	4c 89 e7             	mov    rdi,r12
  40146c:	48 f7 de             	neg    rsi
  40146f:	85 db                	test   ebx,ebx
  401471:	48 0f 4f f2          	cmovg  rsi,rdx
  401475:	48 83 ec 08          	sub    rsp,0x8
  401479:	44 89 d2             	mov    edx,r10d
  40147c:	45 31 c0             	xor    r8d,r8d
  40147f:	6a 05                	push   0x5
  401481:	e8 ea f4 ff ff       	call   400970 <print_integer>
  401486:	58                   	pop    rax
  401487:	5a                   	pop    rdx
  401488:	45 85 f6             	test   r14d,r14d
  40148b:	0f 84 fb fb ff ff    	je     40108c <print_exponential_number+0xcc>
  401491:	41 8b 44 24 18       	mov    eax,DWORD PTR [r12+0x18]
  401496:	89 c2                	mov    edx,eax
  401498:	44 29 ea             	sub    edx,r13d
  40149b:	39 d5                	cmp    ebp,edx
  40149d:	0f 86 e9 fb ff ff    	jbe    40108c <print_exponential_number+0xcc>
  4014a3:	8d 48 01             	lea    ecx,[rax+0x1]
  4014a6:	83 c2 01             	add    edx,0x1
  4014a9:	41 89 4c 24 18       	mov    DWORD PTR [r12+0x18],ecx
  4014ae:	41 39 44 24 1c       	cmp    DWORD PTR [r12+0x1c],eax
  4014b3:	0f 86 17 02 00 00    	jbe    4016d0 <print_exponential_number+0x710>
  4014b9:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
  4014bd:	48 85 d2             	test   rdx,rdx
  4014c0:	0f 84 1a 02 00 00    	je     4016e0 <print_exponential_number+0x720>
  4014c6:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  4014cb:	bf 20 00 00 00       	mov    edi,0x20
  4014d0:	ff d2                	call   rdx
  4014d2:	41 8b 44 24 18       	mov    eax,DWORD PTR [r12+0x18]
  4014d7:	89 c2                	mov    edx,eax
  4014d9:	44 29 ea             	sub    edx,r13d
  4014dc:	eb bd                	jmp    40149b <print_exponential_number+0x4db>
  4014de:	66 90                	xchg   ax,ax
  4014e0:	85 c9                	test   ecx,ecx
  4014e2:	0f 85 28 02 00 00    	jne    401710 <print_exponential_number+0x750>
  4014e8:	41 8d 8a 34 01 00 00 	lea    ecx,[r10+0x134]
  4014ef:	31 c0                	xor    eax,eax
  4014f1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4014f8:	66 0f 28 d0          	movapd xmm2,xmm0
  4014fc:	f2 0f 5e d1          	divsd  xmm2,xmm1
  401500:	81 f9 32 01 00 00    	cmp    ecx,0x132
  401506:	0f 8f 84 01 00 00    	jg     401690 <print_exponential_number+0x6d0>
  40150c:	f2 48 0f 2c fa       	cvttsd2si rdi,xmm2
  401511:	66 0f ef d2          	pxor   xmm2,xmm2
  401515:	44 89 d1             	mov    ecx,r10d
  401518:	48 8d 35 61 25 00 00 	lea    rsi,[rip+0x2561]        # 403a80 <powers_of_10>
  40151f:	f2 48 0f 2a d7       	cvtsi2sd xmm2,rdi
  401524:	f2 0f 59 d1          	mulsd  xmm2,xmm1
  401528:	f2 0f 5c c2          	subsd  xmm0,xmm2
  40152c:	f2 0f 10 14 ce       	movsd  xmm2,QWORD PTR [rsi+rcx*8]
  401531:	66 48 0f 7e c9       	movq   rcx,xmm1
  401536:	48 c1 e9 34          	shr    rcx,0x34
  40153a:	81 e1 ff 07 00 00    	and    ecx,0x7ff
  401540:	81 e9 ff 03 00 00    	sub    ecx,0x3ff
  401546:	89 ce                	mov    esi,ecx
  401548:	f7 de                	neg    esi
  40154a:	0f 48 f1             	cmovs  esi,ecx
  40154d:	66 48 0f 7e d1       	movq   rcx,xmm2
  401552:	48 c1 e9 34          	shr    rcx,0x34
  401556:	81 e1 ff 07 00 00    	and    ecx,0x7ff
  40155c:	81 e9 ff 03 00 00    	sub    ecx,0x3ff
  401562:	41 89 c8             	mov    r8d,ecx
  401565:	41 f7 d8             	neg    r8d
  401568:	41 0f 49 c8          	cmovns ecx,r8d
  40156c:	39 ce                	cmp    esi,ecx
  40156e:	0f 8f 7c 01 00 00    	jg     4016f0 <print_exponential_number+0x730>
  401574:	66 0f 28 da          	movapd xmm3,xmm2
  401578:	f2 0f 5e d9          	divsd  xmm3,xmm1
  40157c:	e9 90 fd ff ff       	jmp    401311 <print_exponential_number+0x351>
  401581:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401588:	48 85 d2             	test   rdx,rdx
  40158b:	0f 84 98 fa ff ff    	je     401029 <print_exponential_number+0x69>
  401591:	e9 8b fa ff ff       	jmp    401021 <print_exponential_number+0x61>
  401596:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40159d:	00 00 00 
  4015a0:	f2 0f 5e ce          	divsd  xmm1,xmm6
  4015a4:	83 eb 01             	sub    ebx,0x1
  4015a7:	e9 77 fc ff ff       	jmp    401223 <print_exponential_number+0x263>
  4015ac:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  4015b0:	83 c3 01             	add    ebx,0x1
  4015b3:	66 0f ef c0          	pxor   xmm0,xmm0
  4015b7:	48 8d 05 c2 24 00 00 	lea    rax,[rip+0x24c2]        # 403a80 <powers_of_10>
  4015be:	48 63 db             	movsxd rbx,ebx
  4015c1:	f2 48 0f 2a c7       	cvtsi2sd xmm0,rdi
  4015c6:	66 0f 2e 04 d8       	ucomisd xmm0,QWORD PTR [rax+rbx*8]
  4015cb:	0f 8a 97 fa ff ff    	jp     401068 <print_exponential_number+0xa8>
  4015d1:	0f 85 91 fa ff ff    	jne    401068 <print_exponential_number+0xa8>
  4015d7:	41 83 ea 01          	sub    r10d,0x1
  4015db:	e9 88 fa ff ff       	jmp    401068 <print_exponential_number+0xa8>
  4015e0:	83 eb 01             	sub    ebx,0x1
  4015e3:	81 fb cc fe ff ff    	cmp    ebx,0xfffffecc
  4015e9:	0f 85 6b fb ff ff    	jne    40115a <print_exponential_number+0x19a>
  4015ef:	eb 7f                	jmp    401670 <print_exponential_number+0x6b0>
  4015f1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4015f8:	41 be 05 00 00 00    	mov    r14d,0x5
  4015fe:	89 e9                	mov    ecx,ebp
  401600:	45 31 c0             	xor    r8d,r8d
  401603:	88 44 24 0c          	mov    BYTE PTR [rsp+0xc],al
  401607:	45 8b 6c 24 18       	mov    r13d,DWORD PTR [r12+0x18]
  40160c:	44 29 f1             	sub    ecx,r14d
  40160f:	44 39 f5             	cmp    ebp,r14d
  401612:	41 0f 46 c8          	cmovbe ecx,r8d
  401616:	48 83 ec 08          	sub    rsp,0x8
  40161a:	45 89 d0             	mov    r8d,r10d
  40161d:	41 51                	push   r9
  40161f:	41 53                	push   r11
  401621:	41 89 c9             	mov    r9d,ecx
  401624:	4c 89 e1             	mov    rcx,r12
  401627:	41 57                	push   r15
  401629:	e8 a2 f6 ff ff       	call   400cd0 <print_broken_up_decimal.isra.0>
  40162e:	0f b6 44 24 2c       	movzx  eax,BYTE PTR [rsp+0x2c]
  401633:	48 83 c4 20          	add    rsp,0x20
  401637:	84 c0                	test   al,al
  401639:	0f 85 4d fa ff ff    	jne    40108c <print_exponential_number+0xcc>
  40163f:	41 8d 46 ff          	lea    eax,[r14-0x1]
  401643:	45 31 f6             	xor    r14d,r14d
  401646:	e9 bc fd ff ff       	jmp    401407 <print_exponential_number+0x447>
  40164b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  401650:	b8 03 00 00 00       	mov    eax,0x3
  401655:	e9 84 fd ff ff       	jmp    4013de <print_exponential_number+0x41e>
  40165a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  401660:	83 e8 01             	sub    eax,0x1
  401663:	66 0f ef e4          	pxor   xmm4,xmm4
  401667:	f2 0f 2a e0          	cvtsi2sd xmm4,eax
  40166b:	e9 28 fb ff ff       	jmp    401198 <print_exponential_number+0x1d8>
  401670:	f2 0f 10 0d b8 24 00 	movsd  xmm1,QWORD PTR [rip+0x24b8]        # 403b30 <powers_of_10+0xb0>
  401677:	00 
  401678:	66 0f 2f c8          	comisd xmm1,xmm0
  40167c:	0f 86 5e fe ff ff    	jbe    4014e0 <print_exponential_number+0x520>
  401682:	f2 0f 10 0d 9e 24 00 	movsd  xmm1,QWORD PTR [rip+0x249e]        # 403b28 <powers_of_10+0xa8>
  401689:	00 
  40168a:	e9 15 ff ff ff       	jmp    4015a4 <print_exponential_number+0x5e4>
  40168f:	90                   	nop
  401690:	48 85 d2             	test   rdx,rdx
  401693:	74 08                	je     40169d <print_exponential_number+0x6dd>
  401695:	66 0f 57 15 73 24 00 	xorpd  xmm2,XMMWORD PTR [rip+0x2473]        # 403b10 <powers_of_10+0x90>
  40169c:	00 
  40169d:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  4016a2:	44 89 d6             	mov    esi,r10d
  4016a5:	66 0f 28 c2          	movapd xmm0,xmm2
  4016a9:	88 44 24 0c          	mov    BYTE PTR [rsp+0xc],al
  4016ad:	e8 7e f0 ff ff       	call   400730 <get_components>
  4016b2:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  4016b7:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  4016bc:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  4016c1:	0f b6 44 24 0c       	movzx  eax,BYTE PTR [rsp+0xc]
  4016c6:	e9 95 fc ff ff       	jmp    401360 <print_exponential_number+0x3a0>
  4016cb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4016d0:	89 c8                	mov    eax,ecx
  4016d2:	e9 c4 fd ff ff       	jmp    40149b <print_exponential_number+0x4db>
  4016d7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4016de:	00 00 
  4016e0:	49 8b 54 24 10       	mov    rdx,QWORD PTR [r12+0x10]
  4016e5:	c6 04 02 20          	mov    BYTE PTR [rdx+rax*1],0x20
  4016e9:	e9 a3 fd ff ff       	jmp    401491 <print_exponential_number+0x4d1>
  4016ee:	66 90                	xchg   ax,ax
  4016f0:	f2 0f 5e ca          	divsd  xmm1,xmm2
  4016f4:	f2 0f 5e c1          	divsd  xmm0,xmm1
  4016f8:	e9 18 fc ff ff       	jmp    401315 <print_exponential_number+0x355>
  4016fd:	0f 1f 00             	nop    DWORD PTR [rax]
  401700:	49 8b 74 24 10       	mov    rsi,QWORD PTR [r12+0x10]
  401705:	88 14 0e             	mov    BYTE PTR [rsi+rcx*1],dl
  401708:	e9 47 fd ff ff       	jmp    401454 <print_exponential_number+0x494>
  40170d:	0f 1f 00             	nop    DWORD PTR [rax]
  401710:	31 ff                	xor    edi,edi
  401712:	31 f6                	xor    esi,esi
  401714:	e9 41 fb ff ff       	jmp    40125a <print_exponential_number+0x29a>
  401719:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  40171e:	44 89 d6             	mov    esi,r10d
  401721:	31 db                	xor    ebx,ebx
  401723:	e8 08 f0 ff ff       	call   400730 <get_components>
  401728:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  40172d:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  401732:	31 c0                	xor    eax,eax
  401734:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  401739:	e9 22 fc ff ff       	jmp    401360 <print_exponential_number+0x3a0>

Disassembly of section .text.print_floating_point:

0000000000401740 <print_floating_point>:
  401740:	41 54                	push   r12
  401742:	41 89 d4             	mov    r12d,edx
  401745:	55                   	push   rbp
  401746:	48 89 fd             	mov    rbp,rdi
  401749:	48 83 ec 58          	sub    rsp,0x58
  40174d:	66 0f 2e c0          	ucomisd xmm0,xmm0
  401751:	0f 8a 31 01 00 00    	jp     401888 <print_floating_point+0x148>
  401757:	f2 0f 10 0d 49 24 00 	movsd  xmm1,QWORD PTR [rip+0x2449]        # 403ba8 <powers_of_10+0x128>
  40175e:	00 
  40175f:	66 0f 2f c8          	comisd xmm1,xmm0
  401763:	0f 87 87 01 00 00    	ja     4018f0 <print_floating_point+0x1b0>
  401769:	66 0f 2f 05 3f 24 00 	comisd xmm0,QWORD PTR [rip+0x243f]        # 403bb0 <powers_of_10+0x130>
  401770:	00 
  401771:	0f 87 91 00 00 00    	ja     401808 <print_floating_point+0xc8>
  401777:	45 84 c0             	test   r8b,r8b
  40177a:	0f 85 c0 00 00 00    	jne    401840 <print_floating_point+0x100>
  401780:	66 0f 2f 05 30 24 00 	comisd xmm0,QWORD PTR [rip+0x2430]        # 403bb8 <powers_of_10+0x138>
  401787:	00 
  401788:	0f 87 42 01 00 00    	ja     4018d0 <print_floating_point+0x190>
  40178e:	f2 0f 10 0d 2a 24 00 	movsd  xmm1,QWORD PTR [rip+0x242a]        # 403bc0 <powers_of_10+0x140>
  401795:	00 
  401796:	66 0f 2f c8          	comisd xmm1,xmm0
  40179a:	0f 87 30 01 00 00    	ja     4018d0 <print_floating_point+0x190>
  4017a0:	41 89 c9             	mov    r9d,ecx
  4017a3:	41 81 e1 00 08 00 00 	and    r9d,0x800
  4017aa:	0f 85 60 01 00 00    	jne    401910 <print_floating_point+0x1d0>
  4017b0:	be 06 00 00 00       	mov    esi,0x6
  4017b5:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  4017ba:	89 4c 24 0c          	mov    DWORD PTR [rsp+0xc],ecx
  4017be:	89 74 24 08          	mov    DWORD PTR [rsp+0x8],esi
  4017c2:	e8 69 ef ff ff       	call   400730 <get_components>
  4017c7:	48 83 ec 08          	sub    rsp,0x8
  4017cb:	41 51                	push   r9
  4017cd:	45 89 e1             	mov    r9d,r12d
  4017d0:	48 8d 44 24 40       	lea    rax,[rsp+0x40]
  4017d5:	50                   	push   rax
  4017d6:	8b 4c 24 24          	mov    ecx,DWORD PTR [rsp+0x24]
  4017da:	51                   	push   rcx
  4017db:	44 8b 44 24 28       	mov    r8d,DWORD PTR [rsp+0x28]
  4017e0:	48 89 e9             	mov    rcx,rbp
  4017e3:	0f b6 54 24 40       	movzx  edx,BYTE PTR [rsp+0x40]
  4017e8:	48 8b 74 24 38       	mov    rsi,QWORD PTR [rsp+0x38]
  4017ed:	48 8b 7c 24 30       	mov    rdi,QWORD PTR [rsp+0x30]
  4017f2:	e8 d9 f4 ff ff       	call   400cd0 <print_broken_up_decimal.isra.0>
  4017f7:	48 83 c4 20          	add    rsp,0x20
  4017fb:	48 83 c4 58          	add    rsp,0x58
  4017ff:	5d                   	pop    rbp
  401800:	41 5c                	pop    r12
  401802:	c3                   	ret    
  401803:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  401808:	89 c8                	mov    eax,ecx
  40180a:	48 8d 35 74 20 00 00 	lea    rsi,[rip+0x2074]        # 403885 <malloc+0x815>
  401811:	41 89 c8             	mov    r8d,ecx
  401814:	48 89 ef             	mov    rdi,rbp
  401817:	83 e0 04             	and    eax,0x4
  40181a:	44 89 e1             	mov    ecx,r12d
  40181d:	83 f8 01             	cmp    eax,0x1
  401820:	19 d2                	sbb    edx,edx
  401822:	83 c2 04             	add    edx,0x4
  401825:	85 c0                	test   eax,eax
  401827:	48 8d 05 52 20 00 00 	lea    rax,[rip+0x2052]        # 403880 <malloc+0x810>
  40182e:	48 0f 45 f0          	cmovne rsi,rax
  401832:	48 83 c4 58          	add    rsp,0x58
  401836:	5d                   	pop    rbp
  401837:	41 5c                	pop    r12
  401839:	e9 f2 ef ff ff       	jmp    400830 <out_rev_>
  40183e:	66 90                	xchg   ax,ax
  401840:	41 89 c9             	mov    r9d,ecx
  401843:	41 81 e1 00 08 00 00 	and    r9d,0x800
  40184a:	74 64                	je     4018b0 <print_floating_point+0x170>
  40184c:	b8 01 00 00 00       	mov    eax,0x1
  401851:	45 31 c9             	xor    r9d,r9d
  401854:	83 fe 11             	cmp    esi,0x11
  401857:	76 5c                	jbe    4018b5 <print_floating_point+0x175>
  401859:	48 8d 54 24 2f       	lea    rdx,[rsp+0x2f]
  40185e:	66 90                	xchg   ax,ax
  401860:	41 89 c1             	mov    r9d,eax
  401863:	c6 04 02 30          	mov    BYTE PTR [rdx+rax*1],0x30
  401867:	83 ee 01             	sub    esi,0x1
  40186a:	48 83 c0 01          	add    rax,0x1
  40186e:	41 83 f9 1f          	cmp    r9d,0x1f
  401872:	77 05                	ja     401879 <print_floating_point+0x139>
  401874:	83 fe 11             	cmp    esi,0x11
  401877:	77 e7                	ja     401860 <print_floating_point+0x120>
  401879:	45 84 c0             	test   r8b,r8b
  40187c:	0f 84 33 ff ff ff    	je     4017b5 <print_floating_point+0x75>
  401882:	eb 31                	jmp    4018b5 <print_floating_point+0x175>
  401884:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401888:	48 83 c4 58          	add    rsp,0x58
  40188c:	41 89 c8             	mov    r8d,ecx
  40188f:	89 d1                	mov    ecx,edx
  401891:	48 89 ef             	mov    rdi,rbp
  401894:	ba 03 00 00 00       	mov    edx,0x3
  401899:	5d                   	pop    rbp
  40189a:	48 8d 35 e8 1f 00 00 	lea    rsi,[rip+0x1fe8]        # 403889 <malloc+0x819>
  4018a1:	41 5c                	pop    r12
  4018a3:	e9 88 ef ff ff       	jmp    400830 <out_rev_>
  4018a8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4018af:	00 
  4018b0:	be 06 00 00 00       	mov    esi,0x6
  4018b5:	4c 8d 44 24 30       	lea    r8,[rsp+0x30]
  4018ba:	44 89 e2             	mov    edx,r12d
  4018bd:	48 89 ef             	mov    rdi,rbp
  4018c0:	e8 fb f6 ff ff       	call   400fc0 <print_exponential_number>
  4018c5:	48 83 c4 58          	add    rsp,0x58
  4018c9:	5d                   	pop    rbp
  4018ca:	41 5c                	pop    r12
  4018cc:	c3                   	ret    
  4018cd:	0f 1f 00             	nop    DWORD PTR [rax]
  4018d0:	45 31 c9             	xor    r9d,r9d
  4018d3:	4c 8d 44 24 30       	lea    r8,[rsp+0x30]
  4018d8:	44 89 e2             	mov    edx,r12d
  4018db:	48 89 ef             	mov    rdi,rbp
  4018de:	e8 dd f6 ff ff       	call   400fc0 <print_exponential_number>
  4018e3:	e9 13 ff ff ff       	jmp    4017fb <print_floating_point+0xbb>
  4018e8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4018ef:	00 
  4018f0:	48 83 c4 58          	add    rsp,0x58
  4018f4:	41 89 c8             	mov    r8d,ecx
  4018f7:	89 d1                	mov    ecx,edx
  4018f9:	48 89 ef             	mov    rdi,rbp
  4018fc:	ba 04 00 00 00       	mov    edx,0x4
  401901:	5d                   	pop    rbp
  401902:	48 8d 35 84 1f 00 00 	lea    rsi,[rip+0x1f84]        # 40388d <malloc+0x81d>
  401909:	41 5c                	pop    r12
  40190b:	e9 20 ef ff ff       	jmp    400830 <out_rev_>
  401910:	b8 01 00 00 00       	mov    eax,0x1
  401915:	45 31 c9             	xor    r9d,r9d
  401918:	83 fe 11             	cmp    esi,0x11
  40191b:	0f 87 38 ff ff ff    	ja     401859 <print_floating_point+0x119>
  401921:	e9 8f fe ff ff       	jmp    4017b5 <print_floating_point+0x75>

Disassembly of section .text.format_string_loop.constprop.0:

0000000000401930 <format_string_loop.constprop.0>:
  401930:	41 57                	push   r15
  401932:	49 89 d7             	mov    r15,rdx
  401935:	41 56                	push   r14
  401937:	41 55                	push   r13
  401939:	41 54                	push   r12
  40193b:	55                   	push   rbp
  40193c:	53                   	push   rbx
  40193d:	48 83 ec 38          	sub    rsp,0x38
  401941:	0f b6 16             	movzx  edx,BYTE PTR [rsi]
  401944:	84 d2                	test   dl,dl
  401946:	0f 84 5f 01 00 00    	je     401aab <format_string_loop.constprop.0+0x17b>
  40194c:	49 89 fc             	mov    r12,rdi
  40194f:	48 89 f3             	mov    rbx,rsi
  401952:	4c 8d 2d 47 1f 00 00 	lea    r13,[rip+0x1f47]        # 4038a0 <malloc+0x830>
  401959:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401960:	4c 8d 73 01          	lea    r14,[rbx+0x1]
  401964:	80 fa 25             	cmp    dl,0x25
  401967:	0f 85 d3 05 00 00    	jne    401f40 <format_string_loop.constprop.0+0x610>
  40196d:	0f be 73 01          	movsx  esi,BYTE PTR [rbx+0x1]
  401971:	40 84 f6             	test   sil,sil
  401974:	0f 84 31 01 00 00    	je     401aab <format_string_loop.constprop.0+0x17b>
  40197a:	31 c9                	xor    ecx,ecx
  40197c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401980:	8d 46 e0             	lea    eax,[rsi-0x20]
  401983:	49 8d 5e 01          	lea    rbx,[r14+0x1]
  401987:	3c 10                	cmp    al,0x10
  401989:	77 15                	ja     4019a0 <format_string_loop.constprop.0+0x70>
  40198b:	0f b6 c0             	movzx  eax,al
  40198e:	49 63 44 85 00       	movsxd rax,DWORD PTR [r13+rax*4+0x0]
  401993:	4c 01 e8             	add    rax,r13
  401996:	3e ff e0             	notrack jmp rax
  401999:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4019a0:	8d 56 d0             	lea    edx,[rsi-0x30]
  4019a3:	80 fa 09             	cmp    dl,0x9
  4019a6:	ba 00 00 00 00       	mov    edx,0x0
  4019ab:	76 47                	jbe    4019f4 <format_string_loop.constprop.0+0xc4>
  4019ad:	40 80 fe 2a          	cmp    sil,0x2a
  4019b1:	0f 84 e1 05 00 00    	je     401f98 <format_string_loop.constprop.0+0x668>
  4019b7:	45 31 d2             	xor    r10d,r10d
  4019ba:	40 80 fe 2e          	cmp    sil,0x2e
  4019be:	74 51                	je     401a11 <format_string_loop.constprop.0+0xe1>
  4019c0:	8d 7e 98             	lea    edi,[rsi-0x68]
  4019c3:	49 8d 5e 01          	lea    rbx,[r14+0x1]
  4019c7:	40 80 ff 12          	cmp    dil,0x12
  4019cb:	0f 87 7f 00 00 00    	ja     401a50 <format_string_loop.constprop.0+0x120>
  4019d1:	4c 8d 05 0c 1f 00 00 	lea    r8,[rip+0x1f0c]        # 4038e4 <malloc+0x874>
  4019d8:	40 0f b6 ff          	movzx  edi,dil
  4019dc:	49 63 3c b8          	movsxd rdi,DWORD PTR [r8+rdi*4]
  4019e0:	4c 01 c7             	add    rdi,r8
  4019e3:	3e ff e7             	notrack jmp rdi
  4019e6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4019ed:	00 00 00 
  4019f0:	48 83 c3 01          	add    rbx,0x1
  4019f4:	8d 04 92             	lea    eax,[rdx+rdx*4]
  4019f7:	49 89 de             	mov    r14,rbx
  4019fa:	8d 54 46 d0          	lea    edx,[rsi+rax*2-0x30]
  4019fe:	0f be 33             	movsx  esi,BYTE PTR [rbx]
  401a01:	8d 46 d0             	lea    eax,[rsi-0x30]
  401a04:	3c 09                	cmp    al,0x9
  401a06:	76 e8                	jbe    4019f0 <format_string_loop.constprop.0+0xc0>
  401a08:	45 31 d2             	xor    r10d,r10d
  401a0b:	40 80 fe 2e          	cmp    sil,0x2e
  401a0f:	75 af                	jne    4019c0 <format_string_loop.constprop.0+0x90>
  401a11:	41 0f be 76 01       	movsx  esi,BYTE PTR [r14+0x1]
  401a16:	80 cd 08             	or     ch,0x8
  401a19:	40 84 f6             	test   sil,sil
  401a1c:	0f 84 89 00 00 00    	je     401aab <format_string_loop.constprop.0+0x17b>
  401a22:	44 8d 46 d0          	lea    r8d,[rsi-0x30]
  401a26:	49 8d 7e 01          	lea    rdi,[r14+0x1]
  401a2a:	41 80 f8 09          	cmp    r8b,0x9
  401a2e:	0f 86 44 05 00 00    	jbe    401f78 <format_string_loop.constprop.0+0x648>
  401a34:	40 80 fe 2a          	cmp    sil,0x2a
  401a38:	0f 84 b2 05 00 00    	je     401ff0 <format_string_loop.constprop.0+0x6c0>
  401a3e:	49 89 fe             	mov    r14,rdi
  401a41:	8d 7e 98             	lea    edi,[rsi-0x68]
  401a44:	49 8d 5e 01          	lea    rbx,[r14+0x1]
  401a48:	40 80 ff 12          	cmp    dil,0x12
  401a4c:	76 83                	jbe    4019d1 <format_string_loop.constprop.0+0xa1>
  401a4e:	66 90                	xchg   ax,ax
  401a50:	8d 7e db             	lea    edi,[rsi-0x25]
  401a53:	40 80 ff 53          	cmp    dil,0x53
  401a57:	77 17                	ja     401a70 <format_string_loop.constprop.0+0x140>
  401a59:	48 8d 05 d0 1e 00 00 	lea    rax,[rip+0x1ed0]        # 403930 <malloc+0x8c0>
  401a60:	40 0f b6 ff          	movzx  edi,dil
  401a64:	48 63 3c b8          	movsxd rdi,DWORD PTR [rax+rdi*4]
  401a68:	48 01 c7             	add    rdi,rax
  401a6b:	3e ff e7             	notrack jmp rdi
  401a6e:	66 90                	xchg   ax,ax
  401a70:	41 8b 54 24 18       	mov    edx,DWORD PTR [r12+0x18]
  401a75:	8d 4a 01             	lea    ecx,[rdx+0x1]
  401a78:	41 89 4c 24 18       	mov    DWORD PTR [r12+0x18],ecx
  401a7d:	41 3b 54 24 1c       	cmp    edx,DWORD PTR [r12+0x1c]
  401a82:	73 1c                	jae    401aa0 <format_string_loop.constprop.0+0x170>
  401a84:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  401a88:	48 85 c9             	test   rcx,rcx
  401a8b:	0f 84 cf 09 00 00    	je     402460 <format_string_loop.constprop.0+0xb30>
  401a91:	4d 8b 44 24 08       	mov    r8,QWORD PTR [r12+0x8]
  401a96:	40 0f be fe          	movsx  edi,sil
  401a9a:	4c 89 c6             	mov    rsi,r8
  401a9d:	ff d1                	call   rcx
  401a9f:	90                   	nop
  401aa0:	0f b6 13             	movzx  edx,BYTE PTR [rbx]
  401aa3:	84 d2                	test   dl,dl
  401aa5:	0f 85 b5 fe ff ff    	jne    401960 <format_string_loop.constprop.0+0x30>
  401aab:	48 83 c4 38          	add    rsp,0x38
  401aaf:	5b                   	pop    rbx
  401ab0:	5d                   	pop    rbp
  401ab1:	41 5c                	pop    r12
  401ab3:	41 5d                	pop    r13
  401ab5:	41 5e                	pop    r14
  401ab7:	41 5f                	pop    r15
  401ab9:	c3                   	ret    
  401aba:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  401ac0:	83 c9 02             	or     ecx,0x2
  401ac3:	0f be 33             	movsx  esi,BYTE PTR [rbx]
  401ac6:	49 89 de             	mov    r14,rbx
  401ac9:	e9 b2 fe ff ff       	jmp    401980 <format_string_loop.constprop.0+0x50>
  401ace:	66 90                	xchg   ax,ax
  401ad0:	83 c9 04             	or     ecx,0x4
  401ad3:	eb ee                	jmp    401ac3 <format_string_loop.constprop.0+0x193>
  401ad5:	0f 1f 00             	nop    DWORD PTR [rax]
  401ad8:	83 c9 10             	or     ecx,0x10
  401adb:	eb e6                	jmp    401ac3 <format_string_loop.constprop.0+0x193>
  401add:	0f 1f 00             	nop    DWORD PTR [rax]
  401ae0:	83 c9 08             	or     ecx,0x8
  401ae3:	eb de                	jmp    401ac3 <format_string_loop.constprop.0+0x193>
  401ae5:	0f 1f 00             	nop    DWORD PTR [rax]
  401ae8:	83 c9 01             	or     ecx,0x1
  401aeb:	eb d6                	jmp    401ac3 <format_string_loop.constprop.0+0x193>
  401aed:	0f 1f 00             	nop    DWORD PTR [rax]
  401af0:	41 0f b6 76 01       	movzx  esi,BYTE PTR [r14+0x1]
  401af5:	80 cd 02             	or     ch,0x2
  401af8:	40 84 f6             	test   sil,sil
  401afb:	74 ae                	je     401aab <format_string_loop.constprop.0+0x17b>
  401afd:	48 83 c3 01          	add    rbx,0x1
  401b01:	e9 4a ff ff ff       	jmp    401a50 <format_string_loop.constprop.0+0x120>
  401b06:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  401b0d:	00 00 00 
  401b10:	40 80 fe 64          	cmp    sil,0x64
  401b14:	0f 84 2a 06 00 00    	je     402144 <format_string_loop.constprop.0+0x814>
  401b1a:	40 80 fe 69          	cmp    sil,0x69
  401b1e:	0f 84 20 06 00 00    	je     402144 <format_string_loop.constprop.0+0x814>
  401b24:	89 f7                	mov    edi,esi
  401b26:	83 e7 df             	and    edi,0xffffffdf
  401b29:	40 80 ff 58          	cmp    dil,0x58
  401b2d:	0f 84 f6 05 00 00    	je     402129 <format_string_loop.constprop.0+0x7f9>
  401b33:	41 bb 08 00 00 00    	mov    r11d,0x8
  401b39:	40 80 fe 6f          	cmp    sil,0x6f
  401b3d:	74 15                	je     401b54 <format_string_loop.constprop.0+0x224>
  401b3f:	41 bb 02 00 00 00    	mov    r11d,0x2
  401b45:	40 80 fe 62          	cmp    sil,0x62
  401b49:	74 09                	je     401b54 <format_string_loop.constprop.0+0x224>
  401b4b:	83 e1 ef             	and    ecx,0xffffffef
  401b4e:	41 bb 0a 00 00 00    	mov    r11d,0xa
  401b54:	89 ce                	mov    esi,ecx
  401b56:	83 e6 fe             	and    esi,0xfffffffe
  401b59:	f6 c5 08             	test   ch,0x8
  401b5c:	0f 45 ce             	cmovne ecx,esi
  401b5f:	41 8b 37             	mov    esi,DWORD PTR [r15]
  401b62:	89 cf                	mov    edi,ecx
  401b64:	81 e7 00 04 00 00    	and    edi,0x400
  401b6a:	f6 c5 40             	test   ch,0x40
  401b6d:	0f 84 5d 05 00 00    	je     4020d0 <format_string_loop.constprop.0+0x7a0>
  401b73:	85 ff                	test   edi,edi
  401b75:	0f 85 3e 07 00 00    	jne    4022b9 <format_string_loop.constprop.0+0x989>
  401b7b:	f6 c5 02             	test   ch,0x2
  401b7e:	0f 85 35 07 00 00    	jne    4022b9 <format_string_loop.constprop.0+0x989>
  401b84:	f6 c1 40             	test   cl,0x40
  401b87:	0f 84 e8 09 00 00    	je     402575 <format_string_loop.constprop.0+0xc45>
  401b8d:	83 fe 2f             	cmp    esi,0x2f
  401b90:	0f 87 3b 0a 00 00    	ja     4025d1 <format_string_loop.constprop.0+0xca1>
  401b96:	89 f7                	mov    edi,esi
  401b98:	83 c6 08             	add    esi,0x8
  401b9b:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  401b9f:	41 89 37             	mov    DWORD PTR [r15],esi
  401ba2:	0f be 3f             	movsx  edi,BYTE PTR [rdi]
  401ba5:	4c 63 c7             	movsxd r8,edi
  401ba8:	41 89 fe             	mov    r14d,edi
  401bab:	41 89 d1             	mov    r9d,edx
  401bae:	4c 89 c6             	mov    rsi,r8
  401bb1:	41 c1 ee 1f          	shr    r14d,0x1f
  401bb5:	48 f7 de             	neg    rsi
  401bb8:	85 ff                	test   edi,edi
  401bba:	44 89 f2             	mov    edx,r14d
  401bbd:	4c 89 e7             	mov    rdi,r12
  401bc0:	49 0f 4f f0          	cmovg  rsi,r8
  401bc4:	48 83 ec 08          	sub    rsp,0x8
  401bc8:	45 89 d0             	mov    r8d,r10d
  401bcb:	51                   	push   rcx
  401bcc:	44 89 d9             	mov    ecx,r11d
  401bcf:	e8 9c ed ff ff       	call   400970 <print_integer>
  401bd4:	41 5a                	pop    r10
  401bd6:	41 5b                	pop    r11
  401bd8:	e9 c3 fe ff ff       	jmp    401aa0 <format_string_loop.constprop.0+0x170>
  401bdd:	41 0f b6 76 01       	movzx  esi,BYTE PTR [r14+0x1]
  401be2:	40 84 f6             	test   sil,sil
  401be5:	0f 84 c0 fe ff ff    	je     401aab <format_string_loop.constprop.0+0x17b>
  401beb:	40 80 fe 68          	cmp    sil,0x68
  401bef:	0f 84 3b 04 00 00    	je     402030 <format_string_loop.constprop.0+0x700>
  401bf5:	80 c9 80             	or     cl,0x80
  401bf8:	48 83 c3 01          	add    rbx,0x1
  401bfc:	e9 4f fe ff ff       	jmp    401a50 <format_string_loop.constprop.0+0x120>
  401c01:	41 0f b6 76 01       	movzx  esi,BYTE PTR [r14+0x1]
  401c06:	40 84 f6             	test   sil,sil
  401c09:	0f 84 9c fe ff ff    	je     401aab <format_string_loop.constprop.0+0x17b>
  401c0f:	40 80 fe 6c          	cmp    sil,0x6c
  401c13:	0f 84 31 04 00 00    	je     40204a <format_string_loop.constprop.0+0x71a>
  401c19:	80 cd 02             	or     ch,0x2
  401c1c:	48 83 c3 01          	add    rbx,0x1
  401c20:	e9 2b fe ff ff       	jmp    401a50 <format_string_loop.constprop.0+0x120>
  401c25:	41 89 f0             	mov    r8d,esi
  401c28:	89 cf                	mov    edi,ecx
  401c2a:	41 83 e0 df          	and    r8d,0xffffffdf
  401c2e:	81 cf 00 10 00 00    	or     edi,0x1000
  401c34:	41 80 f8 47          	cmp    r8b,0x47
  401c38:	0f 44 cf             	cmove  ecx,edi
  401c3b:	83 e6 fd             	and    esi,0xfffffffd
  401c3e:	89 cf                	mov    edi,ecx
  401c40:	83 cf 20             	or     edi,0x20
  401c43:	40 80 fe 45          	cmp    sil,0x45
  401c47:	41 8b 77 04          	mov    esi,DWORD PTR [r15+0x4]
  401c4b:	0f 44 cf             	cmove  ecx,edi
  401c4e:	81 fe af 00 00 00    	cmp    esi,0xaf
  401c54:	0f 87 06 04 00 00    	ja     402060 <format_string_loop.constprop.0+0x730>
  401c5a:	89 f7                	mov    edi,esi
  401c5c:	83 c6 10             	add    esi,0x10
  401c5f:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  401c63:	41 89 77 04          	mov    DWORD PTR [r15+0x4],esi
  401c67:	f2 0f 10 07          	movsd  xmm0,QWORD PTR [rdi]
  401c6b:	41 b8 01 00 00 00    	mov    r8d,0x1
  401c71:	44 89 d6             	mov    esi,r10d
  401c74:	4c 89 e7             	mov    rdi,r12
  401c77:	e8 c4 fa ff ff       	call   401740 <print_floating_point>
  401c7c:	e9 1f fe ff ff       	jmp    401aa0 <format_string_loop.constprop.0+0x170>
  401c81:	89 cf                	mov    edi,ecx
  401c83:	83 cf 20             	or     edi,0x20
  401c86:	40 80 fe 46          	cmp    sil,0x46
  401c8a:	41 8b 77 04          	mov    esi,DWORD PTR [r15+0x4]
  401c8e:	0f 44 cf             	cmove  ecx,edi
  401c91:	81 fe af 00 00 00    	cmp    esi,0xaf
  401c97:	0f 87 af 04 00 00    	ja     40214c <format_string_loop.constprop.0+0x81c>
  401c9d:	89 f7                	mov    edi,esi
  401c9f:	83 c6 10             	add    esi,0x10
  401ca2:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  401ca6:	41 89 77 04          	mov    DWORD PTR [r15+0x4],esi
  401caa:	f2 0f 10 07          	movsd  xmm0,QWORD PTR [rdi]
  401cae:	45 31 c0             	xor    r8d,r8d
  401cb1:	44 89 d6             	mov    esi,r10d
  401cb4:	4c 89 e7             	mov    rdi,r12
  401cb7:	e8 84 fa ff ff       	call   401740 <print_floating_point>
  401cbc:	e9 df fd ff ff       	jmp    401aa0 <format_string_loop.constprop.0+0x170>
  401cc1:	41 8b 37             	mov    esi,DWORD PTR [r15]
  401cc4:	83 fe 2f             	cmp    esi,0x2f
  401cc7:	0f 87 a4 03 00 00    	ja     402071 <format_string_loop.constprop.0+0x741>
  401ccd:	89 f7                	mov    edi,esi
  401ccf:	83 c6 08             	add    esi,0x8
  401cd2:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  401cd6:	41 89 37             	mov    DWORD PTR [r15],esi
  401cd9:	48 8b 2f             	mov    rbp,QWORD PTR [rdi]
  401cdc:	48 85 ed             	test   rbp,rbp
  401cdf:	0f 84 a4 03 00 00    	je     402089 <format_string_loop.constprop.0+0x759>
  401ce5:	44 0f b6 4d 00       	movzx  r9d,BYTE PTR [rbp+0x0]
  401cea:	44 89 ce             	mov    esi,r9d
  401ced:	45 85 d2             	test   r10d,r10d
  401cf0:	0f 85 35 05 00 00    	jne    40222b <format_string_loop.constprop.0+0x8fb>
  401cf6:	bf fe ff ff 7f       	mov    edi,0x7ffffffe
  401cfb:	45 84 c9             	test   r9b,r9b
  401cfe:	0f 84 82 09 00 00    	je     402686 <format_string_loop.constprop.0+0xd56>
  401d04:	83 c7 01             	add    edi,0x1
  401d07:	49 89 ee             	mov    r14,rbp
  401d0a:	48 01 ef             	add    rdi,rbp
  401d0d:	eb 06                	jmp    401d15 <format_string_loop.constprop.0+0x3e5>
  401d0f:	90                   	nop
  401d10:	49 39 fe             	cmp    r14,rdi
  401d13:	74 0a                	je     401d1f <format_string_loop.constprop.0+0x3ef>
  401d15:	49 83 c6 01          	add    r14,0x1
  401d19:	41 80 3e 00          	cmp    BYTE PTR [r14],0x0
  401d1d:	75 f1                	jne    401d10 <format_string_loop.constprop.0+0x3e0>
  401d1f:	44 89 f0             	mov    eax,r14d
  401d22:	29 e8                	sub    eax,ebp
  401d24:	89 44 24 10          	mov    DWORD PTR [rsp+0x10],eax
  401d28:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  401d2c:	41 89 ce             	mov    r14d,ecx
  401d2f:	44 39 d0             	cmp    eax,r10d
  401d32:	89 c7                	mov    edi,eax
  401d34:	41 0f 47 fa          	cmova  edi,r10d
  401d38:	41 81 e6 00 08 00 00 	and    r14d,0x800
  401d3f:	0f 44 f8             	cmove  edi,eax
  401d42:	83 e1 02             	and    ecx,0x2
  401d45:	89 4c 24 1c          	mov    DWORD PTR [rsp+0x1c],ecx
  401d49:	89 7c 24 10          	mov    DWORD PTR [rsp+0x10],edi
  401d4d:	0f 84 1b 07 00 00    	je     40246e <format_string_loop.constprop.0+0xb3e>
  401d53:	45 84 c9             	test   r9b,r9b
  401d56:	0f 84 92 00 00 00    	je     401dee <format_string_loop.constprop.0+0x4be>
  401d5c:	45 85 f6             	test   r14d,r14d
  401d5f:	0f 94 44 24 08       	sete   BYTE PTR [rsp+0x8]
  401d64:	0f b6 44 24 08       	movzx  eax,BYTE PTR [rsp+0x8]
  401d69:	45 85 d2             	test   r10d,r10d
  401d6c:	75 04                	jne    401d72 <format_string_loop.constprop.0+0x442>
  401d6e:	84 c0                	test   al,al
  401d70:	74 7c                	je     401dee <format_string_loop.constprop.0+0x4be>
  401d72:	4c 89 7c 24 20       	mov    QWORD PTR [rsp+0x20],r15
  401d77:	49 89 ee             	mov    r14,rbp
  401d7a:	41 89 d7             	mov    r15d,edx
  401d7d:	48 89 5c 24 28       	mov    QWORD PTR [rsp+0x28],rbx
  401d82:	44 89 d3             	mov    ebx,r10d
  401d85:	0f 1f 00             	nop    DWORD PTR [rax]
  401d88:	41 8b 44 24 18       	mov    eax,DWORD PTR [r12+0x18]
  401d8d:	49 83 c6 01          	add    r14,0x1
  401d91:	8d 78 01             	lea    edi,[rax+0x1]
  401d94:	41 89 7c 24 18       	mov    DWORD PTR [r12+0x18],edi
  401d99:	41 3b 44 24 1c       	cmp    eax,DWORD PTR [r12+0x1c]
  401d9e:	73 1c                	jae    401dbc <format_string_loop.constprop.0+0x48c>
  401da0:	4d 8b 04 24          	mov    r8,QWORD PTR [r12]
  401da4:	4d 85 c0             	test   r8,r8
  401da7:	0f 84 c3 05 00 00    	je     402370 <format_string_loop.constprop.0+0xa40>
  401dad:	4d 8b 4c 24 08       	mov    r9,QWORD PTR [r12+0x8]
  401db2:	40 0f be fe          	movsx  edi,sil
  401db6:	4c 89 ce             	mov    rsi,r9
  401db9:	41 ff d0             	call   r8
  401dbc:	41 0f b6 36          	movzx  esi,BYTE PTR [r14]
  401dc0:	40 84 f6             	test   sil,sil
  401dc3:	74 10                	je     401dd5 <format_string_loop.constprop.0+0x4a5>
  401dc5:	89 d8                	mov    eax,ebx
  401dc7:	44 29 f0             	sub    eax,r14d
  401dca:	01 e8                	add    eax,ebp
  401dcc:	75 ba                	jne    401d88 <format_string_loop.constprop.0+0x458>
  401dce:	80 7c 24 08 00       	cmp    BYTE PTR [rsp+0x8],0x0
  401dd3:	75 b3                	jne    401d88 <format_string_loop.constprop.0+0x458>
  401dd5:	8b 4c 24 1c          	mov    ecx,DWORD PTR [rsp+0x1c]
  401dd9:	44 89 fa             	mov    edx,r15d
  401ddc:	48 8b 5c 24 28       	mov    rbx,QWORD PTR [rsp+0x28]
  401de1:	4c 8b 7c 24 20       	mov    r15,QWORD PTR [rsp+0x20]
  401de6:	85 c9                	test   ecx,ecx
  401de8:	0f 84 b2 fc ff ff    	je     401aa0 <format_string_loop.constprop.0+0x170>
  401dee:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  401df2:	41 89 d6             	mov    r14d,edx
  401df5:	8d 68 01             	lea    ebp,[rax+0x1]
  401df8:	39 c2                	cmp    edx,eax
  401dfa:	0f 87 22 05 00 00    	ja     402322 <format_string_loop.constprop.0+0x9f2>
  401e00:	e9 9b fc ff ff       	jmp    401aa0 <format_string_loop.constprop.0+0x170>
  401e05:	0f 1f 00             	nop    DWORD PTR [rax]
  401e08:	41 8b 54 24 18       	mov    edx,DWORD PTR [r12+0x18]
  401e0d:	8d 4a 01             	lea    ecx,[rdx+0x1]
  401e10:	41 89 4c 24 18       	mov    DWORD PTR [r12+0x18],ecx
  401e15:	41 3b 54 24 1c       	cmp    edx,DWORD PTR [r12+0x1c]
  401e1a:	0f 83 80 fc ff ff    	jae    401aa0 <format_string_loop.constprop.0+0x170>
  401e20:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  401e24:	48 85 c9             	test   rcx,rcx
  401e27:	0f 84 25 06 00 00    	je     402452 <format_string_loop.constprop.0+0xb22>
  401e2d:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  401e32:	bf 25 00 00 00       	mov    edi,0x25
  401e37:	ff d1                	call   rcx
  401e39:	e9 62 fc ff ff       	jmp    401aa0 <format_string_loop.constprop.0+0x170>
  401e3e:	41 8b 74 24 18       	mov    esi,DWORD PTR [r12+0x18]
  401e43:	41 8b 17             	mov    edx,DWORD PTR [r15]
  401e46:	f6 c1 40             	test   cl,0x40
  401e49:	0f 84 58 02 00 00    	je     4020a7 <format_string_loop.constprop.0+0x777>
  401e4f:	83 fa 2f             	cmp    edx,0x2f
  401e52:	0f 86 e5 03 00 00    	jbe    40223d <format_string_loop.constprop.0+0x90d>
  401e58:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  401e5c:	48 8d 51 08          	lea    rdx,[rcx+0x8]
  401e60:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  401e64:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  401e67:	40 88 32             	mov    BYTE PTR [rdx],sil
  401e6a:	e9 31 fc ff ff       	jmp    401aa0 <format_string_loop.constprop.0+0x170>
  401e6f:	83 e1 02             	and    ecx,0x2
  401e72:	41 8b 74 24 18       	mov    esi,DWORD PTR [r12+0x18]
  401e77:	41 8b 7c 24 1c       	mov    edi,DWORD PTR [r12+0x1c]
  401e7c:	89 cd                	mov    ebp,ecx
  401e7e:	0f 84 fa 04 00 00    	je     40237e <format_string_loop.constprop.0+0xa4e>
  401e84:	41 8b 0f             	mov    ecx,DWORD PTR [r15]
  401e87:	83 f9 2f             	cmp    ecx,0x2f
  401e8a:	0f 87 06 03 00 00    	ja     402196 <format_string_loop.constprop.0+0x866>
  401e90:	41 89 c8             	mov    r8d,ecx
  401e93:	83 c1 08             	add    ecx,0x8
  401e96:	4d 03 47 10          	add    r8,QWORD PTR [r15+0x10]
  401e9a:	41 89 0f             	mov    DWORD PTR [r15],ecx
  401e9d:	41 8b 08             	mov    ecx,DWORD PTR [r8]
  401ea0:	44 8d 46 01          	lea    r8d,[rsi+0x1]
  401ea4:	45 89 44 24 18       	mov    DWORD PTR [r12+0x18],r8d
  401ea9:	39 fe                	cmp    esi,edi
  401eab:	0f 83 05 03 00 00    	jae    4021b6 <format_string_loop.constprop.0+0x886>
  401eb1:	41 89 c8             	mov    r8d,ecx
  401eb4:	0f be f9             	movsx  edi,cl
  401eb7:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  401ebb:	c7 44 24 08 01 00 00 	mov    DWORD PTR [rsp+0x8],0x1
  401ec2:	00 
  401ec3:	48 85 c9             	test   rcx,rcx
  401ec6:	0f 84 60 05 00 00    	je     40242c <format_string_loop.constprop.0+0xafc>
  401ecc:	89 54 24 10          	mov    DWORD PTR [rsp+0x10],edx
  401ed0:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  401ed5:	ff d1                	call   rcx
  401ed7:	8b 54 24 10          	mov    edx,DWORD PTR [rsp+0x10]
  401edb:	85 ed                	test   ebp,ebp
  401edd:	0f 84 bd fb ff ff    	je     401aa0 <format_string_loop.constprop.0+0x170>
  401ee3:	8b 44 24 08          	mov    eax,DWORD PTR [rsp+0x8]
  401ee7:	8d 68 01             	lea    ebp,[rax+0x1]
  401eea:	e9 d4 02 00 00       	jmp    4021c3 <format_string_loop.constprop.0+0x893>
  401eef:	90                   	nop
  401ef0:	41 8b 17             	mov    edx,DWORD PTR [r15]
  401ef3:	81 c9 01 20 00 00    	or     ecx,0x2001
  401ef9:	83 fa 2f             	cmp    edx,0x2f
  401efc:	0f 87 5b 02 00 00    	ja     40215d <format_string_loop.constprop.0+0x82d>
  401f02:	89 d6                	mov    esi,edx
  401f04:	83 c2 08             	add    edx,0x8
  401f07:	49 03 77 10          	add    rsi,QWORD PTR [r15+0x10]
  401f0b:	41 89 17             	mov    DWORD PTR [r15],edx
  401f0e:	48 8b 36             	mov    rsi,QWORD PTR [rsi]
  401f11:	48 85 f6             	test   rsi,rsi
  401f14:	0f 84 5b 02 00 00    	je     402175 <format_string_loop.constprop.0+0x845>
  401f1a:	48 83 ec 08          	sub    rsp,0x8
  401f1e:	31 d2                	xor    edx,edx
  401f20:	41 b9 12 00 00 00    	mov    r9d,0x12
  401f26:	45 89 d0             	mov    r8d,r10d
  401f29:	51                   	push   rcx
  401f2a:	4c 89 e7             	mov    rdi,r12
  401f2d:	b9 10 00 00 00       	mov    ecx,0x10
  401f32:	e8 39 ea ff ff       	call   400970 <print_integer>
  401f37:	58                   	pop    rax
  401f38:	5a                   	pop    rdx
  401f39:	e9 62 fb ff ff       	jmp    401aa0 <format_string_loop.constprop.0+0x170>
  401f3e:	66 90                	xchg   ax,ax
  401f40:	41 8b 4c 24 18       	mov    ecx,DWORD PTR [r12+0x18]
  401f45:	8d 71 01             	lea    esi,[rcx+0x1]
  401f48:	41 89 74 24 18       	mov    DWORD PTR [r12+0x18],esi
  401f4d:	41 3b 4c 24 1c       	cmp    ecx,DWORD PTR [r12+0x1c]
  401f52:	73 18                	jae    401f6c <format_string_loop.constprop.0+0x63c>
  401f54:	4d 8b 04 24          	mov    r8,QWORD PTR [r12]
  401f58:	4d 85 c0             	test   r8,r8
  401f5b:	0f 84 7f 00 00 00    	je     401fe0 <format_string_loop.constprop.0+0x6b0>
  401f61:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  401f66:	0f be fa             	movsx  edi,dl
  401f69:	41 ff d0             	call   r8
  401f6c:	4c 89 f3             	mov    rbx,r14
  401f6f:	e9 2c fb ff ff       	jmp    401aa0 <format_string_loop.constprop.0+0x170>
  401f74:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401f78:	43 8d 04 92          	lea    eax,[r10+r10*4]
  401f7c:	48 83 c7 01          	add    rdi,0x1
  401f80:	44 8d 54 46 d0       	lea    r10d,[rsi+rax*2-0x30]
  401f85:	0f be 37             	movsx  esi,BYTE PTR [rdi]
  401f88:	8d 46 d0             	lea    eax,[rsi-0x30]
  401f8b:	3c 09                	cmp    al,0x9
  401f8d:	76 e9                	jbe    401f78 <format_string_loop.constprop.0+0x648>
  401f8f:	e9 aa fa ff ff       	jmp    401a3e <format_string_loop.constprop.0+0x10e>
  401f94:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401f98:	41 8b 17             	mov    edx,DWORD PTR [r15]
  401f9b:	83 fa 2f             	cmp    edx,0x2f
  401f9e:	77 30                	ja     401fd0 <format_string_loop.constprop.0+0x6a0>
  401fa0:	89 d6                	mov    esi,edx
  401fa2:	83 c2 08             	add    edx,0x8
  401fa5:	49 03 77 10          	add    rsi,QWORD PTR [r15+0x10]
  401fa9:	41 89 17             	mov    DWORD PTR [r15],edx
  401fac:	8b 16                	mov    edx,DWORD PTR [rsi]
  401fae:	85 d2                	test   edx,edx
  401fb0:	79 05                	jns    401fb7 <format_string_loop.constprop.0+0x687>
  401fb2:	83 c9 02             	or     ecx,0x2
  401fb5:	f7 da                	neg    edx
  401fb7:	41 0f b6 76 01       	movzx  esi,BYTE PTR [r14+0x1]
  401fbc:	40 84 f6             	test   sil,sil
  401fbf:	0f 84 e6 fa ff ff    	je     401aab <format_string_loop.constprop.0+0x17b>
  401fc5:	49 89 de             	mov    r14,rbx
  401fc8:	e9 ea f9 ff ff       	jmp    4019b7 <format_string_loop.constprop.0+0x87>
  401fcd:	0f 1f 00             	nop    DWORD PTR [rax]
  401fd0:	49 8b 77 08          	mov    rsi,QWORD PTR [r15+0x8]
  401fd4:	48 8d 56 08          	lea    rdx,[rsi+0x8]
  401fd8:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  401fdc:	eb ce                	jmp    401fac <format_string_loop.constprop.0+0x67c>
  401fde:	66 90                	xchg   ax,ax
  401fe0:	49 8b 74 24 10       	mov    rsi,QWORD PTR [r12+0x10]
  401fe5:	88 14 0e             	mov    BYTE PTR [rsi+rcx*1],dl
  401fe8:	e9 7f ff ff ff       	jmp    401f6c <format_string_loop.constprop.0+0x63c>
  401fed:	0f 1f 00             	nop    DWORD PTR [rax]
  401ff0:	41 8b 37             	mov    esi,DWORD PTR [r15]
  401ff3:	83 fe 2f             	cmp    esi,0x2f
  401ff6:	0f 87 1e 02 00 00    	ja     40221a <format_string_loop.constprop.0+0x8ea>
  401ffc:	89 f7                	mov    edi,esi
  401ffe:	83 c6 08             	add    esi,0x8
  402001:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  402005:	41 89 37             	mov    DWORD PTR [r15],esi
  402008:	44 8b 17             	mov    r10d,DWORD PTR [rdi]
  40200b:	31 f6                	xor    esi,esi
  40200d:	49 8d 7e 02          	lea    rdi,[r14+0x2]
  402011:	45 85 d2             	test   r10d,r10d
  402014:	44 0f 48 d6          	cmovs  r10d,esi
  402018:	41 0f b6 76 02       	movzx  esi,BYTE PTR [r14+0x2]
  40201d:	40 84 f6             	test   sil,sil
  402020:	0f 85 18 fa ff ff    	jne    401a3e <format_string_loop.constprop.0+0x10e>
  402026:	e9 80 fa ff ff       	jmp    401aab <format_string_loop.constprop.0+0x17b>
  40202b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  402030:	41 0f b6 76 02       	movzx  esi,BYTE PTR [r14+0x2]
  402035:	80 c9 c0             	or     cl,0xc0
  402038:	40 84 f6             	test   sil,sil
  40203b:	0f 84 6a fa ff ff    	je     401aab <format_string_loop.constprop.0+0x17b>
  402041:	49 8d 5e 03          	lea    rbx,[r14+0x3]
  402045:	e9 06 fa ff ff       	jmp    401a50 <format_string_loop.constprop.0+0x120>
  40204a:	41 0f b6 76 02       	movzx  esi,BYTE PTR [r14+0x2]
  40204f:	80 cd 06             	or     ch,0x6
  402052:	40 84 f6             	test   sil,sil
  402055:	75 ea                	jne    402041 <format_string_loop.constprop.0+0x711>
  402057:	e9 4f fa ff ff       	jmp    401aab <format_string_loop.constprop.0+0x17b>
  40205c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402060:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  402064:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  402068:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  40206c:	e9 f6 fb ff ff       	jmp    401c67 <format_string_loop.constprop.0+0x337>
  402071:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  402075:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  402079:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  40207d:	48 8b 2f             	mov    rbp,QWORD PTR [rdi]
  402080:	48 85 ed             	test   rbp,rbp
  402083:	0f 85 5c fc ff ff    	jne    401ce5 <format_string_loop.constprop.0+0x3b5>
  402089:	41 89 c8             	mov    r8d,ecx
  40208c:	48 8d 35 ff 17 00 00 	lea    rsi,[rip+0x17ff]        # 403892 <malloc+0x822>
  402093:	89 d1                	mov    ecx,edx
  402095:	4c 89 e7             	mov    rdi,r12
  402098:	ba 06 00 00 00       	mov    edx,0x6
  40209d:	e8 8e e7 ff ff       	call   400830 <out_rev_>
  4020a2:	e9 f9 f9 ff ff       	jmp    401aa0 <format_string_loop.constprop.0+0x170>
  4020a7:	f6 c1 80             	test   cl,0x80
  4020aa:	0f 84 9e 01 00 00    	je     40224e <format_string_loop.constprop.0+0x91e>
  4020b0:	83 fa 2f             	cmp    edx,0x2f
  4020b3:	0f 87 ab 04 00 00    	ja     402564 <format_string_loop.constprop.0+0xc34>
  4020b9:	89 d1                	mov    ecx,edx
  4020bb:	83 c2 08             	add    edx,0x8
  4020be:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  4020c2:	41 89 17             	mov    DWORD PTR [r15],edx
  4020c5:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  4020c8:	66 89 32             	mov    WORD PTR [rdx],si
  4020cb:	e9 d0 f9 ff ff       	jmp    401aa0 <format_string_loop.constprop.0+0x170>
  4020d0:	41 89 c8             	mov    r8d,ecx
  4020d3:	41 83 e0 f3          	and    r8d,0xfffffff3
  4020d7:	85 ff                	test   edi,edi
  4020d9:	0f 85 a0 01 00 00    	jne    40227f <format_string_loop.constprop.0+0x94f>
  4020df:	f6 c5 02             	test   ch,0x2
  4020e2:	0f 85 97 01 00 00    	jne    40227f <format_string_loop.constprop.0+0x94f>
  4020e8:	f6 c1 40             	test   cl,0x40
  4020eb:	0f 84 aa 04 00 00    	je     40259b <format_string_loop.constprop.0+0xc6b>
  4020f1:	83 fe 2f             	cmp    esi,0x2f
  4020f4:	0f 87 00 05 00 00    	ja     4025fa <format_string_loop.constprop.0+0xcca>
  4020fa:	89 f1                	mov    ecx,esi
  4020fc:	83 c6 08             	add    esi,0x8
  4020ff:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  402103:	41 89 37             	mov    DWORD PTR [r15],esi
  402106:	0f b6 31             	movzx  esi,BYTE PTR [rcx]
  402109:	48 83 ec 08          	sub    rsp,0x8
  40210d:	41 89 d1             	mov    r9d,edx
  402110:	4c 89 e7             	mov    rdi,r12
  402113:	44 89 d9             	mov    ecx,r11d
  402116:	41 50                	push   r8
  402118:	31 d2                	xor    edx,edx
  40211a:	45 89 d0             	mov    r8d,r10d
  40211d:	e8 4e e8 ff ff       	call   400970 <print_integer>
  402122:	5e                   	pop    rsi
  402123:	5f                   	pop    rdi
  402124:	e9 77 f9 ff ff       	jmp    401aa0 <format_string_loop.constprop.0+0x170>
  402129:	89 cf                	mov    edi,ecx
  40212b:	83 c9 20             	or     ecx,0x20
  40212e:	40 80 fe 58          	cmp    sil,0x58
  402132:	41 bb 10 00 00 00    	mov    r11d,0x10
  402138:	89 cd                	mov    ebp,ecx
  40213a:	89 f9                	mov    ecx,edi
  40213c:	0f 44 cd             	cmove  ecx,ebp
  40213f:	e9 10 fa ff ff       	jmp    401b54 <format_string_loop.constprop.0+0x224>
  402144:	80 cd 40             	or     ch,0x40
  402147:	e9 d8 f9 ff ff       	jmp    401b24 <format_string_loop.constprop.0+0x1f4>
  40214c:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  402150:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  402154:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  402158:	e9 4d fb ff ff       	jmp    401caa <format_string_loop.constprop.0+0x37a>
  40215d:	49 8b 77 08          	mov    rsi,QWORD PTR [r15+0x8]
  402161:	48 8d 56 08          	lea    rdx,[rsi+0x8]
  402165:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  402169:	48 8b 36             	mov    rsi,QWORD PTR [rsi]
  40216c:	48 85 f6             	test   rsi,rsi
  40216f:	0f 85 a5 fd ff ff    	jne    401f1a <format_string_loop.constprop.0+0x5ea>
  402175:	41 89 c8             	mov    r8d,ecx
  402178:	ba 05 00 00 00       	mov    edx,0x5
  40217d:	b9 12 00 00 00       	mov    ecx,0x12
  402182:	4c 89 e7             	mov    rdi,r12
  402185:	48 8d 35 0d 17 00 00 	lea    rsi,[rip+0x170d]        # 403899 <malloc+0x829>
  40218c:	e8 9f e6 ff ff       	call   400830 <out_rev_>
  402191:	e9 0a f9 ff ff       	jmp    401aa0 <format_string_loop.constprop.0+0x170>
  402196:	4d 8b 47 08          	mov    r8,QWORD PTR [r15+0x8]
  40219a:	49 8d 48 08          	lea    rcx,[r8+0x8]
  40219e:	49 89 4f 08          	mov    QWORD PTR [r15+0x8],rcx
  4021a2:	41 8b 08             	mov    ecx,DWORD PTR [r8]
  4021a5:	44 8d 46 01          	lea    r8d,[rsi+0x1]
  4021a9:	45 89 44 24 18       	mov    DWORD PTR [r12+0x18],r8d
  4021ae:	39 fe                	cmp    esi,edi
  4021b0:	0f 82 fb fc ff ff    	jb     401eb1 <format_string_loop.constprop.0+0x581>
  4021b6:	c7 44 24 08 01 00 00 	mov    DWORD PTR [rsp+0x8],0x1
  4021bd:	00 
  4021be:	bd 02 00 00 00       	mov    ebp,0x2
  4021c3:	41 89 d6             	mov    r14d,edx
  4021c6:	3b 54 24 08          	cmp    edx,DWORD PTR [rsp+0x8]
  4021ca:	77 26                	ja     4021f2 <format_string_loop.constprop.0+0x8c2>
  4021cc:	e9 cf f8 ff ff       	jmp    401aa0 <format_string_loop.constprop.0+0x170>
  4021d1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4021d8:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  4021dd:	bf 20 00 00 00       	mov    edi,0x20
  4021e2:	ff d1                	call   rcx
  4021e4:	8d 45 01             	lea    eax,[rbp+0x1]
  4021e7:	41 39 ee             	cmp    r14d,ebp
  4021ea:	0f 86 b0 f8 ff ff    	jbe    401aa0 <format_string_loop.constprop.0+0x170>
  4021f0:	89 c5                	mov    ebp,eax
  4021f2:	41 8b 44 24 18       	mov    eax,DWORD PTR [r12+0x18]
  4021f7:	8d 48 01             	lea    ecx,[rax+0x1]
  4021fa:	41 89 4c 24 18       	mov    DWORD PTR [r12+0x18],ecx
  4021ff:	41 3b 44 24 1c       	cmp    eax,DWORD PTR [r12+0x1c]
  402204:	73 de                	jae    4021e4 <format_string_loop.constprop.0+0x8b4>
  402206:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  40220a:	48 85 c9             	test   rcx,rcx
  40220d:	75 c9                	jne    4021d8 <format_string_loop.constprop.0+0x8a8>
  40220f:	49 8b 54 24 10       	mov    rdx,QWORD PTR [r12+0x10]
  402214:	c6 04 02 20          	mov    BYTE PTR [rdx+rax*1],0x20
  402218:	eb ca                	jmp    4021e4 <format_string_loop.constprop.0+0x8b4>
  40221a:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  40221e:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  402222:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  402226:	e9 dd fd ff ff       	jmp    402008 <format_string_loop.constprop.0+0x6d8>
  40222b:	45 84 c9             	test   r9b,r9b
  40222e:	0f 84 52 04 00 00    	je     402686 <format_string_loop.constprop.0+0xd56>
  402234:	41 8d 7a ff          	lea    edi,[r10-0x1]
  402238:	e9 c7 fa ff ff       	jmp    401d04 <format_string_loop.constprop.0+0x3d4>
  40223d:	89 d1                	mov    ecx,edx
  40223f:	83 c2 08             	add    edx,0x8
  402242:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  402246:	41 89 17             	mov    DWORD PTR [r15],edx
  402249:	e9 16 fc ff ff       	jmp    401e64 <format_string_loop.constprop.0+0x534>
  40224e:	f6 c5 02             	test   ch,0x2
  402251:	0f 85 f3 00 00 00    	jne    40234a <format_string_loop.constprop.0+0xa1a>
  402257:	80 e5 04             	and    ch,0x4
  40225a:	0f 85 ea 00 00 00    	jne    40234a <format_string_loop.constprop.0+0xa1a>
  402260:	83 fa 2f             	cmp    edx,0x2f
  402263:	0f 87 ba 03 00 00    	ja     402623 <format_string_loop.constprop.0+0xcf3>
  402269:	89 d1                	mov    ecx,edx
  40226b:	83 c2 08             	add    edx,0x8
  40226e:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  402272:	41 89 17             	mov    DWORD PTR [r15],edx
  402275:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  402278:	89 32                	mov    DWORD PTR [rdx],esi
  40227a:	e9 21 f8 ff ff       	jmp    401aa0 <format_string_loop.constprop.0+0x170>
  40227f:	83 fe 2f             	cmp    esi,0x2f
  402282:	0f 87 b9 02 00 00    	ja     402541 <format_string_loop.constprop.0+0xc11>
  402288:	89 f7                	mov    edi,esi
  40228a:	83 c6 08             	add    esi,0x8
  40228d:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  402291:	41 89 37             	mov    DWORD PTR [r15],esi
  402294:	48 83 ec 08          	sub    rsp,0x8
  402298:	41 89 d1             	mov    r9d,edx
  40229b:	44 89 d9             	mov    ecx,r11d
  40229e:	31 d2                	xor    edx,edx
  4022a0:	41 50                	push   r8
  4022a2:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
  4022a5:	45 89 d0             	mov    r8d,r10d
  4022a8:	4c 89 e7             	mov    rdi,r12
  4022ab:	e8 c0 e6 ff ff       	call   400970 <print_integer>
  4022b0:	41 58                	pop    r8
  4022b2:	41 59                	pop    r9
  4022b4:	e9 e7 f7 ff ff       	jmp    401aa0 <format_string_loop.constprop.0+0x170>
  4022b9:	83 fe 2f             	cmp    esi,0x2f
  4022bc:	0f 87 6e 02 00 00    	ja     402530 <format_string_loop.constprop.0+0xc00>
  4022c2:	89 f7                	mov    edi,esi
  4022c4:	83 c6 08             	add    esi,0x8
  4022c7:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  4022cb:	41 89 37             	mov    DWORD PTR [r15],esi
  4022ce:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
  4022d1:	41 89 d1             	mov    r9d,edx
  4022d4:	45 89 d0             	mov    r8d,r10d
  4022d7:	4c 89 e7             	mov    rdi,r12
  4022da:	48 89 f5             	mov    rbp,rsi
  4022dd:	48 f7 dd             	neg    rbp
  4022e0:	48 0f 48 ee          	cmovs  rbp,rsi
  4022e4:	48 83 ec 08          	sub    rsp,0x8
  4022e8:	48 c1 ee 3f          	shr    rsi,0x3f
  4022ec:	51                   	push   rcx
  4022ed:	48 89 f2             	mov    rdx,rsi
  4022f0:	44 89 d9             	mov    ecx,r11d
  4022f3:	48 89 ee             	mov    rsi,rbp
  4022f6:	e8 75 e6 ff ff       	call   400970 <print_integer>
  4022fb:	5d                   	pop    rbp
  4022fc:	41 5e                	pop    r14
  4022fe:	e9 9d f7 ff ff       	jmp    401aa0 <format_string_loop.constprop.0+0x170>
  402303:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  402308:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  40230d:	bf 20 00 00 00       	mov    edi,0x20
  402312:	ff d1                	call   rcx
  402314:	8d 45 01             	lea    eax,[rbp+0x1]
  402317:	41 39 ee             	cmp    r14d,ebp
  40231a:	0f 84 80 f7 ff ff    	je     401aa0 <format_string_loop.constprop.0+0x170>
  402320:	89 c5                	mov    ebp,eax
  402322:	41 8b 44 24 18       	mov    eax,DWORD PTR [r12+0x18]
  402327:	8d 48 01             	lea    ecx,[rax+0x1]
  40232a:	41 89 4c 24 18       	mov    DWORD PTR [r12+0x18],ecx
  40232f:	41 3b 44 24 1c       	cmp    eax,DWORD PTR [r12+0x1c]
  402334:	73 de                	jae    402314 <format_string_loop.constprop.0+0x9e4>
  402336:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  40233a:	48 85 c9             	test   rcx,rcx
  40233d:	75 c9                	jne    402308 <format_string_loop.constprop.0+0x9d8>
  40233f:	49 8b 54 24 10       	mov    rdx,QWORD PTR [r12+0x10]
  402344:	c6 04 02 20          	mov    BYTE PTR [rdx+rax*1],0x20
  402348:	eb ca                	jmp    402314 <format_string_loop.constprop.0+0x9e4>
  40234a:	83 fa 2f             	cmp    edx,0x2f
  40234d:	0f 87 6d 02 00 00    	ja     4025c0 <format_string_loop.constprop.0+0xc90>
  402353:	89 d1                	mov    ecx,edx
  402355:	83 c2 08             	add    edx,0x8
  402358:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  40235c:	41 89 17             	mov    DWORD PTR [r15],edx
  40235f:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  402362:	89 f0                	mov    eax,esi
  402364:	48 89 02             	mov    QWORD PTR [rdx],rax
  402367:	e9 34 f7 ff ff       	jmp    401aa0 <format_string_loop.constprop.0+0x170>
  40236c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402370:	49 8b 7c 24 10       	mov    rdi,QWORD PTR [r12+0x10]
  402375:	40 88 34 07          	mov    BYTE PTR [rdi+rax*1],sil
  402379:	e9 3e fa ff ff       	jmp    401dbc <format_string_loop.constprop.0+0x48c>
  40237e:	83 fa 01             	cmp    edx,0x1
  402381:	0f 86 0c 03 00 00    	jbe    402693 <format_string_loop.constprop.0+0xd63>
  402387:	8d 42 01             	lea    eax,[rdx+0x1]
  40238a:	48 89 5c 24 10       	mov    QWORD PTR [rsp+0x10],rbx
  40238f:	41 be 02 00 00 00    	mov    r14d,0x2
  402395:	89 d3                	mov    ebx,edx
  402397:	89 44 24 08          	mov    DWORD PTR [rsp+0x8],eax
  40239b:	eb 32                	jmp    4023cf <format_string_loop.constprop.0+0xa9f>
  40239d:	0f 1f 00             	nop    DWORD PTR [rax]
  4023a0:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
  4023a4:	48 85 c0             	test   rax,rax
  4023a7:	0f 84 8d 00 00 00    	je     40243a <format_string_loop.constprop.0+0xb0a>
  4023ad:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  4023b2:	bf 20 00 00 00       	mov    edi,0x20
  4023b7:	ff d0                	call   rax
  4023b9:	41 8b 74 24 18       	mov    esi,DWORD PTR [r12+0x18]
  4023be:	41 8b 7c 24 1c       	mov    edi,DWORD PTR [r12+0x1c]
  4023c3:	41 8d 46 01          	lea    eax,[r14+0x1]
  4023c7:	44 39 f3             	cmp    ebx,r14d
  4023ca:	74 1a                	je     4023e6 <format_string_loop.constprop.0+0xab6>
  4023cc:	41 89 c6             	mov    r14d,eax
  4023cf:	8d 46 01             	lea    eax,[rsi+0x1]
  4023d2:	41 89 44 24 18       	mov    DWORD PTR [r12+0x18],eax
  4023d7:	39 fe                	cmp    esi,edi
  4023d9:	72 c5                	jb     4023a0 <format_string_loop.constprop.0+0xa70>
  4023db:	89 c6                	mov    esi,eax
  4023dd:	41 8d 46 01          	lea    eax,[r14+0x1]
  4023e1:	44 39 f3             	cmp    ebx,r14d
  4023e4:	75 e6                	jne    4023cc <format_string_loop.constprop.0+0xa9c>
  4023e6:	89 da                	mov    edx,ebx
  4023e8:	48 8b 5c 24 10       	mov    rbx,QWORD PTR [rsp+0x10]
  4023ed:	41 8b 0f             	mov    ecx,DWORD PTR [r15]
  4023f0:	83 f9 2f             	cmp    ecx,0x2f
  4023f3:	0f 86 59 01 00 00    	jbe    402552 <format_string_loop.constprop.0+0xc22>
  4023f9:	4d 8b 47 08          	mov    r8,QWORD PTR [r15+0x8]
  4023fd:	49 8d 48 08          	lea    rcx,[r8+0x8]
  402401:	49 89 4f 08          	mov    QWORD PTR [r15+0x8],rcx
  402405:	41 8b 08             	mov    ecx,DWORD PTR [r8]
  402408:	44 8d 46 01          	lea    r8d,[rsi+0x1]
  40240c:	45 89 44 24 18       	mov    DWORD PTR [r12+0x18],r8d
  402411:	39 fe                	cmp    esi,edi
  402413:	0f 83 87 f6 ff ff    	jae    401aa0 <format_string_loop.constprop.0+0x170>
  402419:	41 89 c8             	mov    r8d,ecx
  40241c:	0f be f9             	movsx  edi,cl
  40241f:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  402423:	48 85 c9             	test   rcx,rcx
  402426:	0f 85 a0 fa ff ff    	jne    401ecc <format_string_loop.constprop.0+0x59c>
  40242c:	49 8b 4c 24 10       	mov    rcx,QWORD PTR [r12+0x10]
  402431:	44 88 04 31          	mov    BYTE PTR [rcx+rsi*1],r8b
  402435:	e9 a1 fa ff ff       	jmp    401edb <format_string_loop.constprop.0+0x5ab>
  40243a:	49 8b 44 24 10       	mov    rax,QWORD PTR [r12+0x10]
  40243f:	c6 04 30 20          	mov    BYTE PTR [rax+rsi*1],0x20
  402443:	41 8b 74 24 18       	mov    esi,DWORD PTR [r12+0x18]
  402448:	41 8b 7c 24 1c       	mov    edi,DWORD PTR [r12+0x1c]
  40244d:	e9 71 ff ff ff       	jmp    4023c3 <format_string_loop.constprop.0+0xa93>
  402452:	49 8b 4c 24 10       	mov    rcx,QWORD PTR [r12+0x10]
  402457:	c6 04 11 25          	mov    BYTE PTR [rcx+rdx*1],0x25
  40245b:	e9 40 f6 ff ff       	jmp    401aa0 <format_string_loop.constprop.0+0x170>
  402460:	49 8b 4c 24 10       	mov    rcx,QWORD PTR [r12+0x10]
  402465:	40 88 34 11          	mov    BYTE PTR [rcx+rdx*1],sil
  402469:	e9 32 f6 ff ff       	jmp    401aa0 <format_string_loop.constprop.0+0x170>
  40246e:	44 8d 5f 01          	lea    r11d,[rdi+0x1]
  402472:	39 fa                	cmp    edx,edi
  402474:	0f 86 02 02 00 00    	jbe    40267c <format_string_loop.constprop.0+0xd4c>
  40247a:	8d 42 01             	lea    eax,[rdx+0x1]
  40247d:	48 89 6c 24 08       	mov    QWORD PTR [rsp+0x8],rbp
  402482:	89 d5                	mov    ebp,edx
  402484:	48 89 5c 24 28       	mov    QWORD PTR [rsp+0x28],rbx
  402489:	44 89 db             	mov    ebx,r11d
  40248c:	89 44 24 10          	mov    DWORD PTR [rsp+0x10],eax
  402490:	44 89 54 24 20       	mov    DWORD PTR [rsp+0x20],r10d
  402495:	eb 1f                	jmp    4024b6 <format_string_loop.constprop.0+0xb86>
  402497:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40249e:	00 00 
  4024a0:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  4024a5:	bf 20 00 00 00       	mov    edi,0x20
  4024aa:	41 ff d0             	call   r8
  4024ad:	8d 4b 01             	lea    ecx,[rbx+0x1]
  4024b0:	39 dd                	cmp    ebp,ebx
  4024b2:	74 2f                	je     4024e3 <format_string_loop.constprop.0+0xbb3>
  4024b4:	89 cb                	mov    ebx,ecx
  4024b6:	41 8b 4c 24 18       	mov    ecx,DWORD PTR [r12+0x18]
  4024bb:	8d 71 01             	lea    esi,[rcx+0x1]
  4024be:	41 89 74 24 18       	mov    DWORD PTR [r12+0x18],esi
  4024c3:	41 3b 4c 24 1c       	cmp    ecx,DWORD PTR [r12+0x1c]
  4024c8:	73 e3                	jae    4024ad <format_string_loop.constprop.0+0xb7d>
  4024ca:	4d 8b 04 24          	mov    r8,QWORD PTR [r12]
  4024ce:	4d 85 c0             	test   r8,r8
  4024d1:	75 cd                	jne    4024a0 <format_string_loop.constprop.0+0xb70>
  4024d3:	49 8b 74 24 10       	mov    rsi,QWORD PTR [r12+0x10]
  4024d8:	c6 04 0e 20          	mov    BYTE PTR [rsi+rcx*1],0x20
  4024dc:	8d 4b 01             	lea    ecx,[rbx+0x1]
  4024df:	39 dd                	cmp    ebp,ebx
  4024e1:	75 d1                	jne    4024b4 <format_string_loop.constprop.0+0xb84>
  4024e3:	89 ea                	mov    edx,ebp
  4024e5:	48 8b 6c 24 08       	mov    rbp,QWORD PTR [rsp+0x8]
  4024ea:	44 8b 54 24 20       	mov    r10d,DWORD PTR [rsp+0x20]
  4024ef:	48 8b 5c 24 28       	mov    rbx,QWORD PTR [rsp+0x28]
  4024f4:	44 0f b6 4d 00       	movzx  r9d,BYTE PTR [rbp+0x0]
  4024f9:	44 89 ce             	mov    esi,r9d
  4024fc:	45 84 c9             	test   r9b,r9b
  4024ff:	0f 84 9b f5 ff ff    	je     401aa0 <format_string_loop.constprop.0+0x170>
  402505:	45 85 f6             	test   r14d,r14d
  402508:	0f 94 44 24 08       	sete   BYTE PTR [rsp+0x8]
  40250d:	0f b6 44 24 08       	movzx  eax,BYTE PTR [rsp+0x8]
  402512:	45 85 d2             	test   r10d,r10d
  402515:	0f 85 57 f8 ff ff    	jne    401d72 <format_string_loop.constprop.0+0x442>
  40251b:	84 c0                	test   al,al
  40251d:	0f 85 4f f8 ff ff    	jne    401d72 <format_string_loop.constprop.0+0x442>
  402523:	e9 78 f5 ff ff       	jmp    401aa0 <format_string_loop.constprop.0+0x170>
  402528:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40252f:	00 
  402530:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  402534:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  402538:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  40253c:	e9 8d fd ff ff       	jmp    4022ce <format_string_loop.constprop.0+0x99e>
  402541:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  402545:	48 8d 4f 08          	lea    rcx,[rdi+0x8]
  402549:	49 89 4f 08          	mov    QWORD PTR [r15+0x8],rcx
  40254d:	e9 42 fd ff ff       	jmp    402294 <format_string_loop.constprop.0+0x964>
  402552:	41 89 c8             	mov    r8d,ecx
  402555:	83 c1 08             	add    ecx,0x8
  402558:	4d 03 47 10          	add    r8,QWORD PTR [r15+0x10]
  40255c:	41 89 0f             	mov    DWORD PTR [r15],ecx
  40255f:	e9 a1 fe ff ff       	jmp    402405 <format_string_loop.constprop.0+0xad5>
  402564:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  402568:	48 8d 51 08          	lea    rdx,[rcx+0x8]
  40256c:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  402570:	e9 50 fb ff ff       	jmp    4020c5 <format_string_loop.constprop.0+0x795>
  402575:	f6 c1 80             	test   cl,0x80
  402578:	0f 84 8d 00 00 00    	je     40260b <format_string_loop.constprop.0+0xcdb>
  40257e:	83 fe 2f             	cmp    esi,0x2f
  402581:	0f 87 e4 00 00 00    	ja     40266b <format_string_loop.constprop.0+0xd3b>
  402587:	89 f7                	mov    edi,esi
  402589:	83 c6 08             	add    esi,0x8
  40258c:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  402590:	41 89 37             	mov    DWORD PTR [r15],esi
  402593:	0f bf 3f             	movsx  edi,WORD PTR [rdi]
  402596:	e9 0a f6 ff ff       	jmp    401ba5 <format_string_loop.constprop.0+0x275>
  40259b:	81 e1 80 00 00 00    	and    ecx,0x80
  4025a1:	74 3f                	je     4025e2 <format_string_loop.constprop.0+0xcb2>
  4025a3:	83 fe 2f             	cmp    esi,0x2f
  4025a6:	0f 87 ae 00 00 00    	ja     40265a <format_string_loop.constprop.0+0xd2a>
  4025ac:	89 f1                	mov    ecx,esi
  4025ae:	83 c6 08             	add    esi,0x8
  4025b1:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  4025b5:	41 89 37             	mov    DWORD PTR [r15],esi
  4025b8:	0f b7 31             	movzx  esi,WORD PTR [rcx]
  4025bb:	e9 49 fb ff ff       	jmp    402109 <format_string_loop.constprop.0+0x7d9>
  4025c0:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  4025c4:	48 8d 51 08          	lea    rdx,[rcx+0x8]
  4025c8:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  4025cc:	e9 8e fd ff ff       	jmp    40235f <format_string_loop.constprop.0+0xa2f>
  4025d1:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  4025d5:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  4025d9:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  4025dd:	e9 c0 f5 ff ff       	jmp    401ba2 <format_string_loop.constprop.0+0x272>
  4025e2:	83 fe 2f             	cmp    esi,0x2f
  4025e5:	76 60                	jbe    402647 <format_string_loop.constprop.0+0xd17>
  4025e7:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  4025eb:	48 8d 71 08          	lea    rsi,[rcx+0x8]
  4025ef:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  4025f3:	8b 31                	mov    esi,DWORD PTR [rcx]
  4025f5:	e9 0f fb ff ff       	jmp    402109 <format_string_loop.constprop.0+0x7d9>
  4025fa:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  4025fe:	48 8d 71 08          	lea    rsi,[rcx+0x8]
  402602:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  402606:	e9 fb fa ff ff       	jmp    402106 <format_string_loop.constprop.0+0x7d6>
  40260b:	83 fe 2f             	cmp    esi,0x2f
  40260e:	76 24                	jbe    402634 <format_string_loop.constprop.0+0xd04>
  402610:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  402614:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  402618:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  40261c:	8b 3f                	mov    edi,DWORD PTR [rdi]
  40261e:	e9 82 f5 ff ff       	jmp    401ba5 <format_string_loop.constprop.0+0x275>
  402623:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  402627:	48 8d 51 08          	lea    rdx,[rcx+0x8]
  40262b:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  40262f:	e9 41 fc ff ff       	jmp    402275 <format_string_loop.constprop.0+0x945>
  402634:	89 f7                	mov    edi,esi
  402636:	83 c6 08             	add    esi,0x8
  402639:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  40263d:	41 89 37             	mov    DWORD PTR [r15],esi
  402640:	8b 3f                	mov    edi,DWORD PTR [rdi]
  402642:	e9 5e f5 ff ff       	jmp    401ba5 <format_string_loop.constprop.0+0x275>
  402647:	89 f1                	mov    ecx,esi
  402649:	83 c6 08             	add    esi,0x8
  40264c:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  402650:	41 89 37             	mov    DWORD PTR [r15],esi
  402653:	8b 31                	mov    esi,DWORD PTR [rcx]
  402655:	e9 af fa ff ff       	jmp    402109 <format_string_loop.constprop.0+0x7d9>
  40265a:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  40265e:	48 8d 71 08          	lea    rsi,[rcx+0x8]
  402662:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  402666:	e9 4d ff ff ff       	jmp    4025b8 <format_string_loop.constprop.0+0xc88>
  40266b:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  40266f:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  402673:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  402677:	e9 17 ff ff ff       	jmp    402593 <format_string_loop.constprop.0+0xc63>
  40267c:	44 89 5c 24 10       	mov    DWORD PTR [rsp+0x10],r11d
  402681:	e9 73 fe ff ff       	jmp    4024f9 <format_string_loop.constprop.0+0xbc9>
  402686:	c7 44 24 10 00 00 00 	mov    DWORD PTR [rsp+0x10],0x0
  40268d:	00 
  40268e:	e9 95 f6 ff ff       	jmp    401d28 <format_string_loop.constprop.0+0x3f8>
  402693:	c7 44 24 08 02 00 00 	mov    DWORD PTR [rsp+0x8],0x2
  40269a:	00 
  40269b:	e9 4d fd ff ff       	jmp    4023ed <format_string_loop.constprop.0+0xabd>

Disassembly of section .text.vprintf:

00000000004026a0 <vprintf>:
  4026a0:	f3 0f 1e fa          	endbr64 
  4026a4:	48 83 ec 28          	sub    rsp,0x28
  4026a8:	49 89 f8             	mov    r8,rdi
  4026ab:	48 8d 05 6e e1 ff ff 	lea    rax,[rip+0xffffffffffffe16e]        # 400820 <putchar_wrapper>
  4026b2:	48 89 f2             	mov    rdx,rsi
  4026b5:	48 89 04 24          	mov    QWORD PTR [rsp],rax
  4026b9:	48 89 e7             	mov    rdi,rsp
  4026bc:	4c 89 c6             	mov    rsi,r8
  4026bf:	48 b8 00 00 00 00 ff 	movabs rax,0x7fffffff00000000
  4026c6:	ff ff 7f 
  4026c9:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
  4026d0:	00 00 
  4026d2:	48 c7 44 24 10 00 00 	mov    QWORD PTR [rsp+0x10],0x0
  4026d9:	00 00 
  4026db:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  4026e0:	e8 4b f2 ff ff       	call   401930 <format_string_loop.constprop.0>
  4026e5:	48 83 3c 24 00       	cmp    QWORD PTR [rsp],0x0
  4026ea:	74 0c                	je     4026f8 <vprintf+0x58>
  4026ec:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  4026f0:	48 83 c4 28          	add    rsp,0x28
  4026f4:	c3                   	ret    
  4026f5:	0f 1f 00             	nop    DWORD PTR [rax]
  4026f8:	8b 4c 24 1c          	mov    ecx,DWORD PTR [rsp+0x1c]
  4026fc:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  402700:	85 c9                	test   ecx,ecx
  402702:	74 ec                	je     4026f0 <vprintf+0x50>
  402704:	48 8b 74 24 10       	mov    rsi,QWORD PTR [rsp+0x10]
  402709:	48 85 f6             	test   rsi,rsi
  40270c:	74 e2                	je     4026f0 <vprintf+0x50>
  40270e:	39 c1                	cmp    ecx,eax
  402710:	8d 51 ff             	lea    edx,[rcx-0x1]
  402713:	48 0f 47 d0          	cmova  rdx,rax
  402717:	c6 04 16 00          	mov    BYTE PTR [rsi+rdx*1],0x0
  40271b:	48 83 c4 28          	add    rsp,0x28
  40271f:	c3                   	ret    

Disassembly of section .text.vsnprintf:

0000000000402720 <vsnprintf>:
  402720:	f3 0f 1e fa          	endbr64 
  402724:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
  402729:	48 83 ec 28          	sub    rsp,0x28
  40272d:	49 89 d0             	mov    r8,rdx
  402730:	48 89 ca             	mov    rdx,rcx
  402733:	48 39 c6             	cmp    rsi,rax
  402736:	48 89 7c 24 10       	mov    QWORD PTR [rsp+0x10],rdi
  40273b:	48 0f 47 f0          	cmova  rsi,rax
  40273f:	31 c0                	xor    eax,eax
  402741:	48 85 ff             	test   rdi,rdi
  402744:	48 89 e7             	mov    rdi,rsp
  402747:	48 c7 04 24 00 00 00 	mov    QWORD PTR [rsp],0x0
  40274e:	00 
  40274f:	48 0f 44 f0          	cmove  rsi,rax
  402753:	c7 44 24 18 00 00 00 	mov    DWORD PTR [rsp+0x18],0x0
  40275a:	00 
  40275b:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
  402762:	00 00 
  402764:	89 74 24 1c          	mov    DWORD PTR [rsp+0x1c],esi
  402768:	4c 89 c6             	mov    rsi,r8
  40276b:	e8 c0 f1 ff ff       	call   401930 <format_string_loop.constprop.0>
  402770:	48 83 3c 24 00       	cmp    QWORD PTR [rsp],0x0
  402775:	74 09                	je     402780 <vsnprintf+0x60>
  402777:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  40277b:	48 83 c4 28          	add    rsp,0x28
  40277f:	c3                   	ret    
  402780:	8b 4c 24 1c          	mov    ecx,DWORD PTR [rsp+0x1c]
  402784:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  402788:	85 c9                	test   ecx,ecx
  40278a:	74 ef                	je     40277b <vsnprintf+0x5b>
  40278c:	48 8b 74 24 10       	mov    rsi,QWORD PTR [rsp+0x10]
  402791:	48 85 f6             	test   rsi,rsi
  402794:	74 e5                	je     40277b <vsnprintf+0x5b>
  402796:	39 c1                	cmp    ecx,eax
  402798:	8d 51 ff             	lea    edx,[rcx-0x1]
  40279b:	48 0f 47 d0          	cmova  rdx,rax
  40279f:	c6 04 16 00          	mov    BYTE PTR [rsi+rdx*1],0x0
  4027a3:	48 83 c4 28          	add    rsp,0x28
  4027a7:	c3                   	ret    

Disassembly of section .text.vsprintf:

00000000004027b0 <vsprintf>:
  4027b0:	f3 0f 1e fa          	endbr64 
  4027b4:	48 89 d1             	mov    rcx,rdx
  4027b7:	48 89 f2             	mov    rdx,rsi
  4027ba:	be ff ff ff 7f       	mov    esi,0x7fffffff
  4027bf:	e9 5c ff ff ff       	jmp    402720 <vsnprintf>

Disassembly of section .text.vfctprintf:

00000000004027d0 <vfctprintf>:
  4027d0:	f3 0f 1e fa          	endbr64 
  4027d4:	48 83 ec 28          	sub    rsp,0x28
  4027d8:	49 89 f0             	mov    r8,rsi
  4027db:	48 89 d6             	mov    rsi,rdx
  4027de:	48 b8 00 00 00 00 ff 	movabs rax,0x7fffffff00000000
  4027e5:	ff ff 7f 
  4027e8:	48 89 3c 24          	mov    QWORD PTR [rsp],rdi
  4027ec:	48 89 ca             	mov    rdx,rcx
  4027ef:	48 89 e7             	mov    rdi,rsp
  4027f2:	4c 89 44 24 08       	mov    QWORD PTR [rsp+0x8],r8
  4027f7:	48 c7 44 24 10 00 00 	mov    QWORD PTR [rsp+0x10],0x0
  4027fe:	00 00 
  402800:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  402805:	e8 26 f1 ff ff       	call   401930 <format_string_loop.constprop.0>
  40280a:	48 83 3c 24 00       	cmp    QWORD PTR [rsp],0x0
  40280f:	74 0f                	je     402820 <vfctprintf+0x50>
  402811:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  402815:	48 83 c4 28          	add    rsp,0x28
  402819:	c3                   	ret    
  40281a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  402820:	8b 4c 24 1c          	mov    ecx,DWORD PTR [rsp+0x1c]
  402824:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  402828:	85 c9                	test   ecx,ecx
  40282a:	74 e9                	je     402815 <vfctprintf+0x45>
  40282c:	48 8b 74 24 10       	mov    rsi,QWORD PTR [rsp+0x10]
  402831:	48 85 f6             	test   rsi,rsi
  402834:	74 df                	je     402815 <vfctprintf+0x45>
  402836:	39 c1                	cmp    ecx,eax
  402838:	8d 51 ff             	lea    edx,[rcx-0x1]
  40283b:	48 0f 47 d0          	cmova  rdx,rax
  40283f:	c6 04 16 00          	mov    BYTE PTR [rsi+rdx*1],0x0
  402843:	48 83 c4 28          	add    rsp,0x28
  402847:	c3                   	ret    

Disassembly of section .text.printf:

0000000000402850 <printf>:
  402850:	f3 0f 1e fa          	endbr64 
  402854:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  40285b:	48 89 74 24 28       	mov    QWORD PTR [rsp+0x28],rsi
  402860:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
  402865:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  40286a:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  40286f:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  402874:	84 c0                	test   al,al
  402876:	74 37                	je     4028af <printf+0x5f>
  402878:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  40287d:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  402882:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  402887:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  40288e:	00 
  40288f:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  402896:	00 
  402897:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  40289e:	00 
  40289f:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  4028a6:	00 
  4028a7:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  4028ae:	00 
  4028af:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  4028b6:	00 
  4028b7:	48 8d 74 24 08       	lea    rsi,[rsp+0x8]
  4028bc:	c7 44 24 08 08 00 00 	mov    DWORD PTR [rsp+0x8],0x8
  4028c3:	00 
  4028c4:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  4028c9:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  4028ce:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  4028d5:	00 
  4028d6:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  4028db:	e8 c0 fd ff ff       	call   4026a0 <vprintf>
  4028e0:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  4028e7:	c3                   	ret    

Disassembly of section .text.sprintf:

00000000004028f0 <sprintf>:
  4028f0:	f3 0f 1e fa          	endbr64 
  4028f4:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  4028fb:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
  402900:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  402905:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  40290a:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  40290f:	84 c0                	test   al,al
  402911:	74 37                	je     40294a <sprintf+0x5a>
  402913:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  402918:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  40291d:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  402922:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  402929:	00 
  40292a:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  402931:	00 
  402932:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  402939:	00 
  40293a:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  402941:	00 
  402942:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  402949:	00 
  40294a:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  402951:	00 
  402952:	48 8d 54 24 08       	lea    rdx,[rsp+0x8]
  402957:	c7 44 24 08 10 00 00 	mov    DWORD PTR [rsp+0x8],0x10
  40295e:	00 
  40295f:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  402964:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  402969:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  402970:	00 
  402971:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  402976:	e8 35 fe ff ff       	call   4027b0 <vsprintf>
  40297b:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  402982:	c3                   	ret    

Disassembly of section .text.snprintf:

0000000000402990 <snprintf>:
  402990:	f3 0f 1e fa          	endbr64 
  402994:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  40299b:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  4029a0:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  4029a5:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  4029aa:	84 c0                	test   al,al
  4029ac:	74 37                	je     4029e5 <snprintf+0x55>
  4029ae:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  4029b3:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  4029b8:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  4029bd:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  4029c4:	00 
  4029c5:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  4029cc:	00 
  4029cd:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  4029d4:	00 
  4029d5:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  4029dc:	00 
  4029dd:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  4029e4:	00 
  4029e5:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  4029ec:	00 
  4029ed:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
  4029f2:	c7 44 24 08 18 00 00 	mov    DWORD PTR [rsp+0x8],0x18
  4029f9:	00 
  4029fa:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  4029ff:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  402a04:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  402a0b:	00 
  402a0c:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  402a11:	e8 0a fd ff ff       	call   402720 <vsnprintf>
  402a16:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  402a1d:	c3                   	ret    

Disassembly of section .text.fctprintf:

0000000000402a20 <fctprintf>:
  402a20:	f3 0f 1e fa          	endbr64 
  402a24:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  402a2b:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  402a30:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  402a35:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  402a3a:	84 c0                	test   al,al
  402a3c:	74 37                	je     402a75 <fctprintf+0x55>
  402a3e:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  402a43:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  402a48:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  402a4d:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  402a54:	00 
  402a55:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  402a5c:	00 
  402a5d:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  402a64:	00 
  402a65:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  402a6c:	00 
  402a6d:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  402a74:	00 
  402a75:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  402a7c:	00 
  402a7d:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
  402a82:	c7 44 24 08 18 00 00 	mov    DWORD PTR [rsp+0x8],0x18
  402a89:	00 
  402a8a:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  402a8f:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  402a94:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  402a9b:	00 
  402a9c:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  402aa1:	e8 2a fd ff ff       	call   4027d0 <vfctprintf>
  402aa6:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  402aad:	c3                   	ret    

Disassembly of section .text.putchar:

0000000000402ab0 <putchar>:
  402ab0:	f3 0f 1e fa          	endbr64 
  402ab4:	41 54                	push   r12
  402ab6:	41 89 fc             	mov    r12d,edi
  402ab9:	40 0f be ff          	movsx  edi,dil
  402abd:	e8 0e 00 00 00       	call   402ad0 <putchar_>
  402ac2:	44 89 e0             	mov    eax,r12d
  402ac5:	41 5c                	pop    r12
  402ac7:	c3                   	ret    

Disassembly of section .text.putchar_:

0000000000402ad0 <putchar_>:
  402ad0:	f3 0f 1e fa          	endbr64 
  402ad4:	48 83 ec 18          	sub    rsp,0x18
  402ad8:	ba 01 00 00 00       	mov    edx,0x1
  402add:	31 c0                	xor    eax,eax
  402adf:	40 88 7c 24 0c       	mov    BYTE PTR [rsp+0xc],dil
  402ae4:	48 8d 74 24 0c       	lea    rsi,[rsp+0xc]
  402ae9:	bf 01 00 00 00       	mov    edi,0x1
  402aee:	e8 4d d8 ff ff       	call   400340 <write>
  402af3:	48 83 c4 18          	add    rsp,0x18
  402af7:	c3                   	ret    

Disassembly of section .text.unlikely.free:

0000000000402af8 <free.cold>:
  402af8:	0f 0b                	ud2    

Disassembly of section .text.free:

0000000000402b00 <free>:
  402b00:	f3 0f 1e fa          	endbr64 
  402b04:	48 85 ff             	test   rdi,rdi
  402b07:	74 35                	je     402b3e <free+0x3e>
  402b09:	48 89 fe             	mov    rsi,rdi
  402b0c:	48 89 f8             	mov    rax,rdi
  402b0f:	66 31 f6             	xor    si,si
  402b12:	0f b6 cc             	movzx  ecx,ah
  402b15:	0f b6 14 0e          	movzx  edx,BYTE PTR [rsi+rcx*1]
  402b19:	80 fa ff             	cmp    dl,0xff
  402b1c:	74 22                	je     402b40 <free+0x40>
  402b1e:	0f b6 ca             	movzx  ecx,dl
  402b21:	80 fa 09             	cmp    dl,0x9
  402b24:	0f 87 ce ff ff ff    	ja     402af8 <free.cold>
  402b2a:	48 8d 35 8f 11 00 00 	lea    rsi,[rip+0x118f]        # 403cc0 <small_object_freelists>
  402b31:	89 ca                	mov    edx,ecx
  402b33:	48 8b 0c d6          	mov    rcx,QWORD PTR [rsi+rdx*8]
  402b37:	48 89 3c d6          	mov    QWORD PTR [rsi+rdx*8],rdi
  402b3b:	48 89 0f             	mov    QWORD PTR [rdi],rcx
  402b3e:	c3                   	ret    
  402b3f:	90                   	nop
  402b40:	48 8b 15 71 11 00 00 	mov    rdx,QWORD PTR [rip+0x1171]        # 403cb8 <large_objects>
  402b47:	48 8d 47 f0          	lea    rax,[rdi-0x10]
  402b4b:	c7 05 57 11 00 00 01 	mov    DWORD PTR [rip+0x1157],0x1        # 403cac <pending_large_object_compact>
  402b52:	00 00 00 
  402b55:	48 89 57 f0          	mov    QWORD PTR [rdi-0x10],rdx
  402b59:	48 89 05 58 11 00 00 	mov    QWORD PTR [rip+0x1158],rax        # 403cb8 <large_objects>
  402b60:	c6 04 0e fe          	mov    BYTE PTR [rsi+rcx*1],0xfe
  402b64:	c3                   	ret    

Disassembly of section .text.heap_size_in_pages:

0000000000402b70 <heap_size_in_pages>:
  402b70:	f3 0f 1e fa          	endbr64 
  402b74:	48 83 ec 08          	sub    rsp,0x8
  402b78:	31 ff                	xor    edi,edi
  402b7a:	e8 01 d9 ff ff       	call   400480 <sbrk>
  402b7f:	48 c7 c2 10 3d 40 00 	mov    rdx,0x403d10
  402b86:	2b 02                	sub    eax,DWORD PTR [rdx]
  402b88:	48 83 c4 08          	add    rsp,0x8
  402b8c:	c3                   	ret    

Disassembly of section .text.unlikely.allocate_large_object:

0000000000402b8d <allocate_large_object.cold>:
  402b8d:	0f 0b                	ud2    

Disassembly of section .text.allocate_large_object:

0000000000402b90 <allocate_large_object>:
  402b90:	41 57                	push   r15
  402b92:	41 56                	push   r14
  402b94:	41 55                	push   r13
  402b96:	41 54                	push   r12
  402b98:	55                   	push   rbp
  402b99:	53                   	push   rbx
  402b9a:	48 89 fb             	mov    rbx,rdi
  402b9d:	48 83 ec 08          	sub    rsp,0x8
  402ba1:	8b 05 05 11 00 00    	mov    eax,DWORD PTR [rip+0x1105]        # 403cac <pending_large_object_compact>
  402ba7:	4c 8b 05 0a 11 00 00 	mov    r8,QWORD PTR [rip+0x110a]        # 403cb8 <large_objects>
  402bae:	85 c0                	test   eax,eax
  402bb0:	0f 84 df 00 00 00    	je     402c95 <allocate_large_object+0x105>
  402bb6:	48 8d 3d fb 10 00 00 	lea    rdi,[rip+0x10fb]        # 403cb8 <large_objects>
  402bbd:	c7 05 e5 10 00 00 00 	mov    DWORD PTR [rip+0x10e5],0x0        # 403cac <pending_large_object_compact>
  402bc4:	00 00 00 
  402bc7:	49 89 f9             	mov    r9,rdi
  402bca:	4d 85 c0             	test   r8,r8
  402bcd:	0f 84 36 03 00 00    	je     402f09 <allocate_large_object+0x379>
  402bd3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  402bd8:	49 8b 70 08          	mov    rsi,QWORD PTR [r8+0x8]
  402bdc:	49 8d 54 30 10       	lea    rdx,[r8+rsi*1+0x10]
  402be1:	48 8d 82 ff 00 00 00 	lea    rax,[rdx+0xff]
  402be8:	30 c0                	xor    al,al
  402bea:	48 39 d0             	cmp    rax,rdx
  402bed:	0f 85 6a 04 00 00    	jne    40305d <allocate_large_object+0x4cd>
  402bf3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  402bf8:	0f b6 c6             	movzx  eax,dh
  402bfb:	f6 c6 ff             	test   dh,0xff
  402bfe:	74 70                	je     402c70 <allocate_large_object+0xe0>
  402c00:	48 89 d1             	mov    rcx,rdx
  402c03:	66 31 c9             	xor    cx,cx
  402c06:	80 3c 01 fe          	cmp    BYTE PTR [rcx+rax*1],0xfe
  402c0a:	75 64                	jne    402c70 <allocate_large_object+0xe0>
  402c0c:	48 8b 05 a5 10 00 00 	mov    rax,QWORD PTR [rip+0x10a5]        # 403cb8 <large_objects>
  402c13:	48 85 c0             	test   rax,rax
  402c16:	0f 84 71 ff ff ff    	je     402b8d <allocate_large_object.cold>
  402c1c:	48 39 c2             	cmp    rdx,rax
  402c1f:	74 6f                	je     402c90 <allocate_large_object+0x100>
  402c21:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  402c28:	48 89 c1             	mov    rcx,rax
  402c2b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  402c2e:	48 85 c0             	test   rax,rax
  402c31:	0f 84 2b 04 00 00    	je     403062 <allocate_large_object+0x4d2>
  402c37:	48 39 c2             	cmp    rdx,rax
  402c3a:	75 ec                	jne    402c28 <allocate_large_object+0x98>
  402c3c:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  402c40:	48 39 f8             	cmp    rax,rdi
  402c43:	48 0f 44 f9          	cmove  rdi,rcx
  402c47:	48 8d 74 16 10       	lea    rsi,[rsi+rdx*1+0x10]
  402c4c:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  402c4f:	49 89 70 08          	mov    QWORD PTR [r8+0x8],rsi
  402c53:	48 89 11             	mov    QWORD PTR [rcx],rdx
  402c56:	49 8d 54 30 10       	lea    rdx,[r8+rsi*1+0x10]
  402c5b:	48 8d 82 ff 00 00 00 	lea    rax,[rdx+0xff]
  402c62:	30 c0                	xor    al,al
  402c64:	48 39 c2             	cmp    rdx,rax
  402c67:	74 8f                	je     402bf8 <allocate_large_object+0x68>
  402c69:	e9 1f ff ff ff       	jmp    402b8d <allocate_large_object.cold>
  402c6e:	66 90                	xchg   ax,ax
  402c70:	48 8b 3f             	mov    rdi,QWORD PTR [rdi]
  402c73:	4c 8b 07             	mov    r8,QWORD PTR [rdi]
  402c76:	4d 85 c0             	test   r8,r8
  402c79:	0f 85 59 ff ff ff    	jne    402bd8 <allocate_large_object+0x48>
  402c7f:	48 8b 05 32 10 00 00 	mov    rax,QWORD PTR [rip+0x1032]        # 403cb8 <large_objects>
  402c86:	eb 10                	jmp    402c98 <allocate_large_object+0x108>
  402c88:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  402c8f:	00 
  402c90:	4c 89 c9             	mov    rcx,r9
  402c93:	eb a7                	jmp    402c3c <allocate_large_object+0xac>
  402c95:	4c 89 c0             	mov    rax,r8
  402c98:	48 85 c0             	test   rax,rax
  402c9b:	0f 84 68 02 00 00    	je     402f09 <allocate_large_object+0x379>
  402ca1:	48 8d 35 10 10 00 00 	lea    rsi,[rip+0x1010]        # 403cb8 <large_objects>
  402ca8:	48 8d bb 0f 01 00 00 	lea    rdi,[rbx+0x10f]
  402caf:	48 c7 c1 ff ff ff ff 	mov    rcx,0xffffffffffffffff
  402cb6:	45 31 c0             	xor    r8d,r8d
  402cb9:	48 89 f5             	mov    rbp,rsi
  402cbc:	40 30 ff             	xor    dil,dil
  402cbf:	eb 12                	jmp    402cd3 <allocate_large_object+0x143>
  402cc1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  402cc8:	48 89 c6             	mov    rsi,rax
  402ccb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  402cce:	48 85 c0             	test   rax,rax
  402cd1:	74 2f                	je     402d02 <allocate_large_object+0x172>
  402cd3:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  402cd7:	48 39 ca             	cmp    rdx,rcx
  402cda:	73 ec                	jae    402cc8 <allocate_large_object+0x138>
  402cdc:	48 39 da             	cmp    rdx,rbx
  402cdf:	72 e7                	jb     402cc8 <allocate_large_object+0x138>
  402ce1:	48 8d 4a 10          	lea    rcx,[rdx+0x10]
  402ce5:	48 39 f9             	cmp    rcx,rdi
  402ce8:	0f 84 da 02 00 00    	je     402fc8 <allocate_large_object+0x438>
  402cee:	48 89 f5             	mov    rbp,rsi
  402cf1:	49 89 c0             	mov    r8,rax
  402cf4:	48 89 c6             	mov    rsi,rax
  402cf7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  402cfa:	48 89 d1             	mov    rcx,rdx
  402cfd:	48 85 c0             	test   rax,rax
  402d00:	75 d1                	jne    402cd3 <allocate_large_object+0x143>
  402d02:	4d 85 c0             	test   r8,r8
  402d05:	0f 84 05 02 00 00    	je     402f10 <allocate_large_object+0x380>
  402d0b:	4d 8b 08             	mov    r9,QWORD PTR [r8]
  402d0e:	4c 89 c0             	mov    rax,r8
  402d11:	4c 89 c7             	mov    rdi,r8
  402d14:	0f b6 f4             	movzx  esi,ah
  402d17:	48 89 c8             	mov    rax,rcx
  402d1a:	66 31 ff             	xor    di,di
  402d1d:	41 89 f2             	mov    r10d,esi
  402d20:	48 29 d8             	sub    rax,rbx
  402d23:	42 c6 04 17 ff       	mov    BYTE PTR [rdi+r10*1],0xff
  402d28:	4c 89 4d 00          	mov    QWORD PTR [rbp+0x0],r9
  402d2c:	48 25 00 ff ff ff    	and    rax,0xffffffffffffff00
  402d32:	75 2d                	jne    402d61 <allocate_large_object+0x1d1>
  402d34:	49 8b 70 08          	mov    rsi,QWORD PTR [r8+0x8]
  402d38:	49 8d 54 30 10       	lea    rdx,[r8+rsi*1+0x10]
  402d3d:	48 8d 82 ff 00 00 00 	lea    rax,[rdx+0xff]
  402d44:	30 c0                	xor    al,al
  402d46:	48 39 c2             	cmp    rdx,rax
  402d49:	0f 85 18 03 00 00    	jne    403067 <allocate_large_object+0x4d7>
  402d4f:	48 83 c4 08          	add    rsp,0x8
  402d53:	4c 89 c0             	mov    rax,r8
  402d56:	5b                   	pop    rbx
  402d57:	5d                   	pop    rbp
  402d58:	41 5c                	pop    r12
  402d5a:	41 5d                	pop    r13
  402d5c:	41 5e                	pop    r14
  402d5e:	41 5f                	pop    r15
  402d60:	c3                   	ret    
  402d61:	4d 8d 48 10          	lea    r9,[r8+0x10]
  402d65:	49 89 c3             	mov    r11,rax
  402d68:	49 8d 14 09          	lea    rdx,[r9+rcx*1]
  402d6c:	49 f7 d3             	not    r11
  402d6f:	49 01 d3             	add    r11,rdx
  402d72:	66 45 31 db          	xor    r11w,r11w
  402d76:	4c 39 df             	cmp    rdi,r11
  402d79:	0f 84 5a 02 00 00    	je     402fd9 <allocate_large_object+0x449>
  402d7f:	48 8d 82 ff ff 00 00 	lea    rax,[rdx+0xffff]
  402d86:	66 31 c0             	xor    ax,ax
  402d89:	48 81 fb ef fe 00 00 	cmp    rbx,0xfeef
  402d90:	0f 86 d9 00 00 00    	jbe    402e6f <allocate_large_object+0x2df>
  402d96:	48 39 d0             	cmp    rax,rdx
  402d99:	0f 85 ee fd ff ff    	jne    402b8d <allocate_large_object.cold>
  402d9f:	45 0f b7 c9          	movzx  r9d,r9w
  402da3:	49 8d 84 09 00 00 ff 	lea    rax,[r9+rcx*1-0x10000]
  402daa:	ff 
  402dab:	49 8d 4c 19 ff       	lea    rcx,[r9+rbx*1-0x1]
  402db0:	66 31 c9             	xor    cx,cx
  402db3:	48 29 c8             	sub    rax,rcx
  402db6:	49 8b 70 08          	mov    rsi,QWORD PTR [r8+0x8]
  402dba:	48 89 d1             	mov    rcx,rdx
  402dbd:	48 29 c6             	sub    rsi,rax
  402dc0:	48 29 c1             	sub    rcx,rax
  402dc3:	49 89 70 08          	mov    QWORD PTR [r8+0x8],rsi
  402dc7:	0f b6 fd             	movzx  edi,ch
  402dca:	89 f9                	mov    ecx,edi
  402dcc:	48 85 ff             	test   rdi,rdi
  402dcf:	75 14                	jne    402de5 <allocate_large_object+0x255>
  402dd1:	48 85 c0             	test   rax,rax
  402dd4:	0f 84 5e ff ff ff    	je     402d38 <allocate_large_object+0x1a8>
  402dda:	48 2d 00 01 00 00    	sub    rax,0x100
  402de0:	b9 01 00 00 00       	mov    ecx,0x1
  402de5:	48 85 c0             	test   rax,rax
  402de8:	0f 84 4a ff ff ff    	je     402d38 <allocate_large_object+0x1a8>
  402dee:	48 29 c2             	sub    rdx,rax
  402df1:	4c 8d 48 f0          	lea    r9,[rax-0x10]
  402df5:	48 8b 3d bc 0e 00 00 	mov    rdi,QWORD PTR [rip+0xebc]        # 403cb8 <large_objects>
  402dfc:	66 31 d2             	xor    dx,dx
  402dff:	c6 04 0a fe          	mov    BYTE PTR [rdx+rcx*1],0xfe
  402e03:	48 c1 e1 08          	shl    rcx,0x8
  402e07:	48 01 ca             	add    rdx,rcx
  402e0a:	48 01 d0             	add    rax,rdx
  402e0d:	48 89 3a             	mov    QWORD PTR [rdx],rdi
  402e10:	48 8d 88 ff 00 00 00 	lea    rcx,[rax+0xff]
  402e17:	4c 89 4a 08          	mov    QWORD PTR [rdx+0x8],r9
  402e1b:	30 c9                	xor    cl,cl
  402e1d:	48 39 c8             	cmp    rax,rcx
  402e20:	0f 85 67 fd ff ff    	jne    402b8d <allocate_large_object.cold>
  402e26:	48 89 15 8b 0e 00 00 	mov    QWORD PTR [rip+0xe8b],rdx        # 403cb8 <large_objects>
  402e2d:	49 8b 70 08          	mov    rsi,QWORD PTR [r8+0x8]
  402e31:	49 81 f9 ff 00 00 00 	cmp    r9,0xff
  402e38:	0f 87 fa fe ff ff    	ja     402d38 <allocate_large_object+0x1a8>
  402e3e:	48 89 d0             	mov    rax,rdx
  402e41:	0f b6 ce             	movzx  ecx,dh
  402e44:	48 8b 15 bd 0e 00 00 	mov    rdx,QWORD PTR [rip+0xebd]        # 403d08 <small_object_freelists+0x48>
  402e4b:	66 31 c0             	xor    ax,ax
  402e4e:	c6 04 08 09          	mov    BYTE PTR [rax+rcx*1],0x9
  402e52:	48 c1 e1 08          	shl    rcx,0x8
  402e56:	48 01 c8             	add    rax,rcx
  402e59:	48 89 3d 58 0e 00 00 	mov    QWORD PTR [rip+0xe58],rdi        # 403cb8 <large_objects>
  402e60:	48 89 05 a1 0e 00 00 	mov    QWORD PTR [rip+0xea1],rax        # 403d08 <small_object_freelists+0x48>
  402e67:	48 89 10             	mov    QWORD PTR [rax],rdx
  402e6a:	e9 c9 fe ff ff       	jmp    402d38 <allocate_large_object+0x1a8>
  402e6f:	48 39 d0             	cmp    rax,rdx
  402e72:	0f 85 15 fd ff ff    	jne    402b8d <allocate_large_object.cold>
  402e78:	45 0f b7 d9          	movzx  r11d,r9w
  402e7c:	b8 00 00 01 00       	mov    eax,0x10000
  402e81:	4c 29 d8             	sub    rax,r11
  402e84:	49 89 c7             	mov    r15,rax
  402e87:	4c 89 c8             	mov    rax,r9
  402e8a:	4c 8b 0d 27 0e 00 00 	mov    r9,QWORD PTR [rip+0xe27]        # 403cb8 <large_objects>
  402e91:	0f b6 c4             	movzx  eax,ah
  402e94:	c6 04 07 fe          	mov    BYTE PTR [rdi+rax*1],0xfe
  402e98:	4d 89 08             	mov    QWORD PTR [r8],r9
  402e9b:	4d 89 78 08          	mov    QWORD PTR [r8+0x8],r15
  402e9f:	4c 89 05 12 0e 00 00 	mov    QWORD PTR [rip+0xe12],r8        # 403cb8 <large_objects>
  402ea6:	49 81 ff ff 00 00 00 	cmp    r15,0xff
  402ead:	77 27                	ja     402ed6 <allocate_large_object+0x346>
  402eaf:	48 89 f0             	mov    rax,rsi
  402eb2:	48 8b 35 4f 0e 00 00 	mov    rsi,QWORD PTR [rip+0xe4f]        # 403d08 <small_object_freelists+0x48>
  402eb9:	42 c6 04 17 09       	mov    BYTE PTR [rdi+r10*1],0x9
  402ebe:	48 c1 e0 08          	shl    rax,0x8
  402ec2:	4c 89 0d ef 0d 00 00 	mov    QWORD PTR [rip+0xdef],r9        # 403cb8 <large_objects>
  402ec9:	48 01 f8             	add    rax,rdi
  402ecc:	48 89 30             	mov    QWORD PTR [rax],rsi
  402ecf:	48 89 05 32 0e 00 00 	mov    QWORD PTR [rip+0xe32],rax        # 403d08 <small_object_freelists+0x48>
  402ed6:	49 8d b4 0b f0 fe fe 	lea    rsi,[r11+rcx*1-0x10110]
  402edd:	ff 
  402ede:	c6 87 01 00 01 00 ff 	mov    BYTE PTR [rdi+0x10001],0xff
  402ee5:	4c 8d 87 00 01 01 00 	lea    r8,[rdi+0x10100]
  402eec:	48 89 b7 08 01 01 00 	mov    QWORD PTR [rdi+0x10108],rsi
  402ef3:	48 39 f3             	cmp    rbx,rsi
  402ef6:	0f 87 91 fc ff ff    	ja     402b8d <allocate_large_object.cold>
  402efc:	48 89 f0             	mov    rax,rsi
  402eff:	48 29 d8             	sub    rax,rbx
  402f02:	30 c0                	xor    al,al
  402f04:	e9 b1 fe ff ff       	jmp    402dba <allocate_large_object+0x22a>
  402f09:	48 8d 2d a8 0d 00 00 	lea    rbp,[rip+0xda8]        # 403cb8 <large_objects>
  402f10:	31 c0                	xor    eax,eax
  402f12:	4c 8d 6b 10          	lea    r13,[rbx+0x10]
  402f16:	4c 8d a3 10 01 00 00 	lea    r12,[rbx+0x110]
  402f1d:	e8 4e fc ff ff       	call   402b70 <heap_size_in_pages>
  402f22:	c1 e0 10             	shl    eax,0x10
  402f25:	4c 63 f8             	movsxd r15,eax
  402f28:	48 8b 05 81 0d 00 00 	mov    rax,QWORD PTR [rip+0xd81]        # 403cb0 <walloc_heap_size>
  402f2f:	48 85 c0             	test   rax,rax
  402f32:	0f 85 b8 00 00 00    	jne    402ff0 <allocate_large_object+0x460>
  402f38:	48 c7 c0 10 3d 40 00 	mov    rax,0x403d10
  402f3f:	4d 89 fe             	mov    r14,r15
  402f42:	48 8d 90 ff ff 00 00 	lea    rdx,[rax+0xffff]
  402f49:	66 31 d2             	xor    dx,dx
  402f4c:	49 29 d6             	sub    r14,rdx
  402f4f:	4c 89 35 5a 0d 00 00 	mov    QWORD PTR [rip+0xd5a],r14        # 403cb0 <walloc_heap_size>
  402f56:	4d 39 f4             	cmp    r12,r14
  402f59:	0f 87 d7 00 00 00    	ja     403036 <allocate_large_object+0x4a6>
  402f5f:	4d 85 f6             	test   r14,r14
  402f62:	0f 84 25 fc ff ff    	je     402b8d <allocate_large_object.cold>
  402f68:	49 8d 86 ff ff 00 00 	lea    rax,[r14+0xffff]
  402f6f:	66 31 c0             	xor    ax,ax
  402f72:	4c 39 f0             	cmp    rax,r14
  402f75:	0f 85 12 fc ff ff    	jne    402b8d <allocate_large_object.cold>
  402f7b:	4c 89 f1             	mov    rcx,r14
  402f7e:	48 c1 e9 10          	shr    rcx,0x10
  402f82:	48 85 d2             	test   rdx,rdx
  402f85:	0f 84 c5 00 00 00    	je     403050 <allocate_large_object+0x4c0>
  402f8b:	4c 8b 0d 26 0d 00 00 	mov    r9,QWORD PTR [rip+0xd26]        # 403cb8 <large_objects>
  402f92:	48 c1 e1 10          	shl    rcx,0x10
  402f96:	c6 42 01 ff          	mov    BYTE PTR [rdx+0x1],0xff
  402f9a:	4c 8d 82 00 01 00 00 	lea    r8,[rdx+0x100]
  402fa1:	48 81 e9 10 01 00 00 	sub    rcx,0x110
  402fa8:	4c 89 8a 00 01 00 00 	mov    QWORD PTR [rdx+0x100],r9
  402faf:	48 89 8a 08 01 00 00 	mov    QWORD PTR [rdx+0x108],rcx
  402fb6:	49 39 cd             	cmp    r13,rcx
  402fb9:	0f 86 4f fd ff ff    	jbe    402d0e <allocate_large_object+0x17e>
  402fbf:	e9 c9 fb ff ff       	jmp    402b8d <allocate_large_object.cold>
  402fc4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402fc8:	4c 8b 08             	mov    r9,QWORD PTR [rax]
  402fcb:	48 89 f5             	mov    rbp,rsi
  402fce:	48 89 d1             	mov    rcx,rdx
  402fd1:	49 89 c0             	mov    r8,rax
  402fd4:	e9 35 fd ff ff       	jmp    402d0e <allocate_large_object+0x17e>
  402fd9:	48 8d 8a ff 00 00 00 	lea    rcx,[rdx+0xff]
  402fe0:	30 c9                	xor    cl,cl
  402fe2:	48 39 d1             	cmp    rcx,rdx
  402fe5:	0f 84 cb fd ff ff    	je     402db6 <allocate_large_object+0x226>
  402feb:	e9 9d fb ff ff       	jmp    402b8d <allocate_large_object.cold>
  402ff0:	4d 85 e4             	test   r12,r12
  402ff3:	74 63                	je     403058 <allocate_large_object+0x4c8>
  402ff5:	45 31 f6             	xor    r14d,r14d
  402ff8:	48 d1 e8             	shr    rax,1
  402ffb:	4c 39 e0             	cmp    rax,r12
  402ffe:	49 0f 42 c4          	cmovb  rax,r12
  403002:	4c 8d a0 ff ff 00 00 	lea    r12,[rax+0xffff]
  403009:	49 81 e4 00 00 ff ff 	and    r12,0xffffffffffff0000
  403010:	0f 84 77 fb ff ff    	je     402b8d <allocate_large_object.cold>
  403016:	4c 89 e7             	mov    rdi,r12
  403019:	e8 62 d4 ff ff       	call   400480 <sbrk>
  40301e:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
  403022:	74 2c                	je     403050 <allocate_large_object+0x4c0>
  403024:	4c 01 25 85 0c 00 00 	add    QWORD PTR [rip+0xc85],r12        # 403cb0 <walloc_heap_size>
  40302b:	4d 01 e6             	add    r14,r12
  40302e:	4c 89 fa             	mov    rdx,r15
  403031:	e9 29 ff ff ff       	jmp    402f5f <allocate_large_object+0x3cf>
  403036:	48 89 d0             	mov    rax,rdx
  403039:	4c 29 f8             	sub    rax,r15
  40303c:	49 89 d7             	mov    r15,rdx
  40303f:	49 01 c4             	add    r12,rax
  403042:	4c 89 f0             	mov    rax,r14
  403045:	eb b1                	jmp    402ff8 <allocate_large_object+0x468>
  403047:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40304e:	00 00 
  403050:	45 31 c0             	xor    r8d,r8d
  403053:	e9 f7 fc ff ff       	jmp    402d4f <allocate_large_object+0x1bf>
  403058:	e9 30 fb ff ff       	jmp    402b8d <allocate_large_object.cold>
  40305d:	e9 2b fb ff ff       	jmp    402b8d <allocate_large_object.cold>
  403062:	e9 26 fb ff ff       	jmp    402b8d <allocate_large_object.cold>
  403067:	e9 21 fb ff ff       	jmp    402b8d <allocate_large_object.cold>

Disassembly of section .text.malloc:

0000000000403070 <malloc>:
  403070:	f3 0f 1e fa          	endbr64 
  403074:	41 55                	push   r13
  403076:	48 8d 47 07          	lea    rax,[rdi+0x7]
  40307a:	41 54                	push   r12
  40307c:	48 c1 e8 03          	shr    rax,0x3
  403080:	55                   	push   rbp
  403081:	53                   	push   rbx
  403082:	48 83 ec 08          	sub    rsp,0x8
  403086:	83 f8 01             	cmp    eax,0x1
  403089:	76 65                	jbe    4030f0 <malloc+0x80>
  40308b:	83 f8 02             	cmp    eax,0x2
  40308e:	0f 84 9c 00 00 00    	je     403130 <malloc+0xc0>
  403094:	83 f8 03             	cmp    eax,0x3
  403097:	0f 84 23 01 00 00    	je     4031c0 <malloc+0x150>
  40309d:	83 f8 04             	cmp    eax,0x4
  4030a0:	74 7e                	je     403120 <malloc+0xb0>
  4030a2:	83 f8 05             	cmp    eax,0x5
  4030a5:	0f 84 45 01 00 00    	je     4031f0 <malloc+0x180>
  4030ab:	83 f8 06             	cmp    eax,0x6
  4030ae:	0f 84 5c 01 00 00    	je     403210 <malloc+0x1a0>
  4030b4:	83 f8 08             	cmp    eax,0x8
  4030b7:	0f 86 f3 00 00 00    	jbe    4031b0 <malloc+0x140>
  4030bd:	83 f8 0a             	cmp    eax,0xa
  4030c0:	0f 86 0a 01 00 00    	jbe    4031d0 <malloc+0x160>
  4030c6:	83 f8 10             	cmp    eax,0x10
  4030c9:	0f 86 31 01 00 00    	jbe    403200 <malloc+0x190>
  4030cf:	83 f8 20             	cmp    eax,0x20
  4030d2:	0f 86 08 01 00 00    	jbe    4031e0 <malloc+0x170>
  4030d8:	e8 b3 fa ff ff       	call   402b90 <allocate_large_object>
  4030dd:	4c 8d 60 10          	lea    r12,[rax+0x10]
  4030e1:	48 85 c0             	test   rax,rax
  4030e4:	75 2a                	jne    403110 <malloc+0xa0>
  4030e6:	45 31 e4             	xor    r12d,r12d
  4030e9:	eb 25                	jmp    403110 <malloc+0xa0>
  4030eb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4030f0:	45 31 ed             	xor    r13d,r13d
  4030f3:	48 8d 2d c6 0b 00 00 	lea    rbp,[rip+0xbc6]        # 403cc0 <small_object_freelists>
  4030fa:	44 89 eb             	mov    ebx,r13d
  4030fd:	4c 8b 64 dd 00       	mov    r12,QWORD PTR [rbp+rbx*8+0x0]
  403102:	4d 85 e4             	test   r12,r12
  403105:	74 39                	je     403140 <malloc+0xd0>
  403107:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
  40310b:	48 89 54 dd 00       	mov    QWORD PTR [rbp+rbx*8+0x0],rdx
  403110:	48 83 c4 08          	add    rsp,0x8
  403114:	4c 89 e0             	mov    rax,r12
  403117:	5b                   	pop    rbx
  403118:	5d                   	pop    rbp
  403119:	41 5c                	pop    r12
  40311b:	41 5d                	pop    r13
  40311d:	c3                   	ret    
  40311e:	66 90                	xchg   ax,ax
  403120:	41 bd 03 00 00 00    	mov    r13d,0x3
  403126:	eb cb                	jmp    4030f3 <malloc+0x83>
  403128:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40312f:	00 
  403130:	41 bd 01 00 00 00    	mov    r13d,0x1
  403136:	eb bb                	jmp    4030f3 <malloc+0x83>
  403138:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40313f:	00 
  403140:	48 8b 05 c1 0b 00 00 	mov    rax,QWORD PTR [rip+0xbc1]        # 403d08 <small_object_freelists+0x48>
  403147:	48 85 c0             	test   rax,rax
  40314a:	0f 84 d0 00 00 00    	je     403220 <malloc+0x1b0>
  403150:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  403153:	48 89 15 ae 0b 00 00 	mov    QWORD PTR [rip+0xbae],rdx        # 403d08 <small_object_freelists+0x48>
  40315a:	48 8d 0d 7f 0a 00 00 	lea    rcx,[rip+0xa7f]        # 403be0 <CSWTCH.34>
  403161:	0f b6 d4             	movzx  edx,ah
  403164:	66 31 c0             	xor    ax,ax
  403167:	8b 34 99             	mov    esi,DWORD PTR [rcx+rbx*4]
  40316a:	44 88 2c 10          	mov    BYTE PTR [rax+rdx*1],r13b
  40316e:	48 c1 e2 08          	shl    rdx,0x8
  403172:	c1 e6 03             	shl    esi,0x3
  403175:	48 81 fe 00 01 00 00 	cmp    rsi,0x100
  40317c:	0f 87 64 ff ff ff    	ja     4030e6 <malloc+0x76>
  403182:	48 29 f2             	sub    rdx,rsi
  403185:	48 89 f1             	mov    rcx,rsi
  403188:	48 8d 84 10 00 01 00 	lea    rax,[rax+rdx*1+0x100]
  40318f:	00 
  403190:	4c 89 e2             	mov    rdx,r12
  403193:	48 01 f1             	add    rcx,rsi
  403196:	49 89 c4             	mov    r12,rax
  403199:	48 89 10             	mov    QWORD PTR [rax],rdx
  40319c:	48 29 f0             	sub    rax,rsi
  40319f:	48 81 f9 00 01 00 00 	cmp    rcx,0x100
  4031a6:	76 e8                	jbe    403190 <malloc+0x120>
  4031a8:	e9 5e ff ff ff       	jmp    40310b <malloc+0x9b>
  4031ad:	0f 1f 00             	nop    DWORD PTR [rax]
  4031b0:	41 bd 06 00 00 00    	mov    r13d,0x6
  4031b6:	e9 38 ff ff ff       	jmp    4030f3 <malloc+0x83>
  4031bb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4031c0:	41 bd 02 00 00 00    	mov    r13d,0x2
  4031c6:	e9 28 ff ff ff       	jmp    4030f3 <malloc+0x83>
  4031cb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4031d0:	41 bd 07 00 00 00    	mov    r13d,0x7
  4031d6:	e9 18 ff ff ff       	jmp    4030f3 <malloc+0x83>
  4031db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4031e0:	41 bd 09 00 00 00    	mov    r13d,0x9
  4031e6:	e9 08 ff ff ff       	jmp    4030f3 <malloc+0x83>
  4031eb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4031f0:	41 bd 04 00 00 00    	mov    r13d,0x4
  4031f6:	e9 f8 fe ff ff       	jmp    4030f3 <malloc+0x83>
  4031fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  403200:	41 bd 08 00 00 00    	mov    r13d,0x8
  403206:	e9 e8 fe ff ff       	jmp    4030f3 <malloc+0x83>
  40320b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  403210:	41 bd 05 00 00 00    	mov    r13d,0x5
  403216:	e9 d8 fe ff ff       	jmp    4030f3 <malloc+0x83>
  40321b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  403220:	31 ff                	xor    edi,edi
  403222:	e8 69 f9 ff ff       	call   402b90 <allocate_large_object>
  403227:	48 85 c0             	test   rax,rax
  40322a:	0f 85 2a ff ff ff    	jne    40315a <malloc+0xea>
  403230:	e9 b1 fe ff ff       	jmp    4030e6 <malloc+0x76>
