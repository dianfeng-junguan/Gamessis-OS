
bin/test.elf:     file format elf64-x86-64


Disassembly of section .text:

0000000000401000 <__main>:



int   a = 1, b = 2, c = 0;
char* as = "Gamessis OS shell\n";
int   __main() {}
  401000:	f3 0f 1e fa          	endbr64 
  401004:	55                   	push   rbp
  401005:	48 89 e5             	mov    rbp,rsp
  401008:	90                   	nop
  401009:	5d                   	pop    rbp
  40100a:	c3                   	ret    

000000000040100b <__stack_chk_fail>:
int   __stack_chk_fail() {}
  40100b:	f3 0f 1e fa          	endbr64 
  40100f:	55                   	push   rbp
  401010:	48 89 e5             	mov    rbp,rsp
  401013:	90                   	nop
  401014:	5d                   	pop    rbp
  401015:	c3                   	ret    

0000000000401016 <main>:
int   main(int argc, char** argv)
{
  401016:	f3 0f 1e fa          	endbr64 
  40101a:	55                   	push   rbp
  40101b:	48 89 e5             	mov    rbp,rsp
  40101e:	48 81 ec b0 00 00 00 	sub    rsp,0xb0
  401025:	89 bd 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edi
  40102b:	48 89 b5 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],rsi
    // write(2, as, strlen(as));
    puts(as);
  401032:	48 8b 05 cf 4f 00 00 	mov    rax,QWORD PTR [rip+0x4fcf]        # 406008 <as>
  401039:	48 89 c7             	mov    rdi,rax
  40103c:	e8 df 01 00 00       	call   401220 <puts>
    char cmd[128] = {0};
  401041:	48 c7 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],0x0
  401048:	00 00 00 00 
  40104c:	48 c7 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],0x0
  401053:	00 00 00 00 
  401057:	48 c7 45 80 00 00 00 	mov    QWORD PTR [rbp-0x80],0x0
  40105e:	00 
  40105f:	48 c7 45 88 00 00 00 	mov    QWORD PTR [rbp-0x78],0x0
  401066:	00 
  401067:	48 c7 45 90 00 00 00 	mov    QWORD PTR [rbp-0x70],0x0
  40106e:	00 
  40106f:	48 c7 45 98 00 00 00 	mov    QWORD PTR [rbp-0x68],0x0
  401076:	00 
  401077:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
  40107e:	00 
  40107f:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
  401086:	00 
  401087:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  40108e:	00 
  40108f:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  401096:	00 
  401097:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  40109e:	00 
  40109f:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  4010a6:	00 
  4010a7:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  4010ae:	00 
  4010af:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  4010b6:	00 
  4010b7:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  4010be:	00 
  4010bf:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  4010c6:	00 
    while (1) {
        memset(cmd, 0, 128);
  4010c7:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  4010ce:	ba 80 00 00 00       	mov    edx,0x80
  4010d3:	be 00 00 00 00       	mov    esi,0x0
  4010d8:	48 89 c7             	mov    rdi,rax
  4010db:	e8 e0 01 00 00       	call   4012c0 <memset>
        int p = 0;
  4010e0:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        printf("shell:>");
  4010e7:	48 8d 05 25 2f 00 00 	lea    rax,[rip+0x2f25]        # 404013 <kb_readc+0x6d5>
  4010ee:	48 89 c7             	mov    rdi,rax
  4010f1:	b8 00 00 00 00       	mov    eax,0x0
  4010f6:	e8 c5 23 00 00       	call   4034c0 <printf>
        // write(2, "shell:>", 7);
        gets(cmd);
  4010fb:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  401102:	48 89 c7             	mov    rdi,rax
  401105:	b8 00 00 00 00       	mov    eax,0x0
  40110a:	e8 71 01 00 00       	call   401280 <gets>
        //     if (cmd[p] == '\n') break;
        //     p++;
        //     if (p == 128) p = 0;
        // }
        // cmd[p] = '\0';
        puts(cmd);
  40110f:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  401116:	48 89 c7             	mov    rdi,rax
  401119:	e8 02 01 00 00       	call   401220 <puts>
        // write(2, cmd, p);
        if (strcmp(cmd, "version") == 0) { puts("Gamessis OS 1.0.\n"); }
  40111e:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  401125:	48 8d 15 ef 2e 00 00 	lea    rdx,[rip+0x2eef]        # 40401b <kb_readc+0x6dd>
  40112c:	48 89 d6             	mov    rsi,rdx
  40112f:	48 89 c7             	mov    rdi,rax
  401132:	e8 19 02 00 00       	call   401350 <strcmp>
  401137:	85 c0                	test   eax,eax
  401139:	75 14                	jne    40114f <main+0x139>
  40113b:	48 8d 05 e1 2e 00 00 	lea    rax,[rip+0x2ee1]        # 404023 <kb_readc+0x6e5>
  401142:	48 89 c7             	mov    rdi,rax
  401145:	e8 d6 00 00 00       	call   401220 <puts>
  40114a:	e9 78 ff ff ff       	jmp    4010c7 <main+0xb1>
        else if (strcmp(cmd, "exit") == 0) {
  40114f:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  401156:	48 8d 15 d8 2e 00 00 	lea    rdx,[rip+0x2ed8]        # 404035 <kb_readc+0x6f7>
  40115d:	48 89 d6             	mov    rsi,rdx
  401160:	48 89 c7             	mov    rdi,rax
  401163:	e8 e8 01 00 00       	call   401350 <strcmp>
  401168:	85 c0                	test   eax,eax
  40116a:	0f 84 99 00 00 00    	je     401209 <main+0x1f3>
            break;
        }
        else {
            printf("trying to execute...\n");
  401170:	48 8d 05 c3 2e 00 00 	lea    rax,[rip+0x2ec3]        # 40403a <kb_readc+0x6fc>
  401177:	48 89 c7             	mov    rdi,rax
  40117a:	e8 a1 00 00 00       	call   401220 <puts>
            int pid = 0;
  40117f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
            if ((pid = fork()) == 0) {
  401186:	e8 5f 27 00 00       	call   4038ea <fork>
  40118b:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  40118e:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  401192:	75 4d                	jne    4011e1 <main+0x1cb>
                printf("forked, ready to execve\n");
  401194:	48 8d 05 b4 2e 00 00 	lea    rax,[rip+0x2eb4]        # 40404f <kb_readc+0x711>
  40119b:	48 89 c7             	mov    rdi,rax
  40119e:	e8 7d 00 00 00       	call   401220 <puts>
                if (execve(cmd, NULL, NULL) == -1) {
  4011a3:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  4011aa:	ba 00 00 00 00       	mov    edx,0x0
  4011af:	be 00 00 00 00       	mov    esi,0x0
  4011b4:	48 89 c7             	mov    rdi,rax
  4011b7:	e8 3c 27 00 00       	call   4038f8 <execve>
  4011bc:	83 f8 ff             	cmp    eax,0xffffffff
  4011bf:	75 20                	jne    4011e1 <main+0x1cb>
                    printf("cannot find file:%s\n", cmd);
  4011c1:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  4011c8:	48 89 c6             	mov    rsi,rax
  4011cb:	48 8d 05 95 2e 00 00 	lea    rax,[rip+0x2e95]        # 404067 <kb_readc+0x729>
  4011d2:	48 89 c7             	mov    rdi,rax
  4011d5:	b8 00 00 00 00       	mov    eax,0x0
  4011da:	e8 e1 22 00 00       	call   4034c0 <printf>
  4011df:	eb 29                	jmp    40120a <main+0x1f4>
                    break;
                }
            }
            int loc = 0;
  4011e1:	c7 85 6c ff ff ff 00 	mov    DWORD PTR [rbp-0x94],0x0
  4011e8:	00 00 00 

            waitpid(pid, &loc, 0);
  4011eb:	48 8d 8d 6c ff ff ff 	lea    rcx,[rbp-0x94]
  4011f2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  4011f5:	ba 00 00 00 00       	mov    edx,0x0
  4011fa:	48 89 ce             	mov    rsi,rcx
  4011fd:	89 c7                	mov    edi,eax
  4011ff:	e8 02 27 00 00       	call   403906 <waitpid>
    while (1) {
  401204:	e9 be fe ff ff       	jmp    4010c7 <main+0xb1>
            break;
  401209:	90                   	nop
    }


    // do_syscall(SYSCAll_WRITE, 2, (int) "test exe running.\n", 0, 0, 0,0);

    return 0;
  40120a:	b8 00 00 00 00       	mov    eax,0x0
  40120f:	c9                   	leave  
  401210:	c3                   	ret    
  401211:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  401218:	00 00 00 
  40121b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000401220 <puts>:
  401220:	f3 0f 1e fa          	endbr64 
  401224:	41 54                	push   r12
  401226:	55                   	push   rbp
  401227:	48 89 fd             	mov    rbp,rdi
  40122a:	53                   	push   rbx
  40122b:	0f be 3f             	movsx  edi,BYTE PTR [rdi]
  40122e:	40 84 ff             	test   dil,dil
  401231:	74 35                	je     401268 <puts+0x48>
  401233:	31 db                	xor    ebx,ebx
  401235:	0f 1f 00             	nop    DWORD PTR [rax]
  401238:	e8 e3 24 00 00       	call   403720 <putchar>
  40123d:	41 89 dc             	mov    r12d,ebx
  401240:	48 83 c3 01          	add    rbx,0x1
  401244:	0f be 7c 1d 00       	movsx  edi,BYTE PTR [rbp+rbx*1+0x0]
  401249:	40 84 ff             	test   dil,dil
  40124c:	75 ea                	jne    401238 <puts+0x18>
  40124e:	bf 0a 00 00 00       	mov    edi,0xa
  401253:	e8 c8 24 00 00       	call   403720 <putchar>
  401258:	41 8d 44 24 02       	lea    eax,[r12+0x2]
  40125d:	5b                   	pop    rbx
  40125e:	5d                   	pop    rbp
  40125f:	41 5c                	pop    r12
  401261:	c3                   	ret    
  401262:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  401268:	5b                   	pop    rbx
  401269:	b8 ff ff ff ff       	mov    eax,0xffffffff
  40126e:	5d                   	pop    rbp
  40126f:	41 5c                	pop    r12
  401271:	c3                   	ret    
  401272:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  401279:	00 00 00 
  40127c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000401280 <gets>:
  401280:	f3 0f 1e fa          	endbr64 
  401284:	41 54                	push   r12
  401286:	49 89 fc             	mov    r12,rdi
  401289:	eb 09                	jmp    401294 <gets+0x14>
  40128b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  401290:	49 83 c4 01          	add    r12,0x1
  401294:	31 c0                	xor    eax,eax
  401296:	ba 01 00 00 00       	mov    edx,0x1
  40129b:	4c 89 e6             	mov    rsi,r12
  40129e:	bf 01 00 00 00       	mov    edi,0x1
  4012a3:	e8 7e 25 00 00       	call   403826 <read>
  4012a8:	41 80 3c 24 0a       	cmp    BYTE PTR [r12],0xa
  4012ad:	75 e1                	jne    401290 <gets+0x10>
  4012af:	4c 89 e0             	mov    rax,r12
  4012b2:	41 c6 04 24 00       	mov    BYTE PTR [r12],0x0
  4012b7:	41 5c                	pop    r12
  4012b9:	c3                   	ret    
  4012ba:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000004012c0 <memset>:
  4012c0:	f3 0f 1e fa          	endbr64 
  4012c4:	48 89 f8             	mov    rax,rdi
  4012c7:	48 85 d2             	test   rdx,rdx
  4012ca:	74 77                	je     401343 <memset+0x83>
  4012cc:	40 88 74 17 ff       	mov    BYTE PTR [rdi+rdx*1-0x1],sil
  4012d1:	40 88 37             	mov    BYTE PTR [rdi],sil
  4012d4:	48 83 fa 02          	cmp    rdx,0x2
  4012d8:	76 69                	jbe    401343 <memset+0x83>
  4012da:	40 88 74 17 fe       	mov    BYTE PTR [rdi+rdx*1-0x2],sil
  4012df:	40 88 77 01          	mov    BYTE PTR [rdi+0x1],sil
  4012e3:	40 88 74 17 fd       	mov    BYTE PTR [rdi+rdx*1-0x3],sil
  4012e8:	40 88 77 02          	mov    BYTE PTR [rdi+0x2],sil
  4012ec:	48 83 fa 06          	cmp    rdx,0x6
  4012f0:	76 51                	jbe    401343 <memset+0x83>
  4012f2:	40 88 74 17 fc       	mov    BYTE PTR [rdi+rdx*1-0x4],sil
  4012f7:	40 88 77 03          	mov    BYTE PTR [rdi+0x3],sil
  4012fb:	48 83 fa 08          	cmp    rdx,0x8
  4012ff:	76 42                	jbe    401343 <memset+0x83>
  401301:	48 f7 df             	neg    rdi
  401304:	44 0f b6 c6          	movzx  r8d,sil
  401308:	c1 e6 18             	shl    esi,0x18
  40130b:	83 e7 03             	and    edi,0x3
  40130e:	45 89 c1             	mov    r9d,r8d
  401311:	48 8d 0c 38          	lea    rcx,[rax+rdi*1]
  401315:	48 29 fa             	sub    rdx,rdi
  401318:	44 89 c7             	mov    edi,r8d
  40131b:	41 c1 e1 10          	shl    r9d,0x10
  40131f:	c1 e7 08             	shl    edi,0x8
  401322:	48 83 e2 fc          	and    rdx,0xfffffffffffffffc
  401326:	44 09 cf             	or     edi,r9d
  401329:	48 01 ca             	add    rdx,rcx
  40132c:	44 09 c7             	or     edi,r8d
  40132f:	09 fe                	or     esi,edi
  401331:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401338:	89 31                	mov    DWORD PTR [rcx],esi
  40133a:	48 83 c1 04          	add    rcx,0x4
  40133e:	48 39 ca             	cmp    rdx,rcx
  401341:	75 f5                	jne    401338 <memset+0x78>
  401343:	c3                   	ret    
  401344:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40134b:	00 00 00 
  40134e:	66 90                	xchg   ax,ax

0000000000401350 <strcmp>:
  401350:	f3 0f 1e fa          	endbr64 
  401354:	48 39 f7             	cmp    rdi,rsi
  401357:	74 34                	je     40138d <strcmp+0x3d>
  401359:	48 85 ff             	test   rdi,rdi
  40135c:	74 38                	je     401396 <strcmp+0x46>
  40135e:	48 85 f6             	test   rsi,rsi
  401361:	74 33                	je     401396 <strcmp+0x46>
  401363:	0f b6 17             	movzx  edx,BYTE PTR [rdi]
  401366:	0f be 0e             	movsx  ecx,BYTE PTR [rsi]
  401369:	38 ca                	cmp    dl,cl
  40136b:	75 23                	jne    401390 <strcmp+0x40>
  40136d:	b8 01 00 00 00       	mov    eax,0x1
  401372:	eb 15                	jmp    401389 <strcmp+0x39>
  401374:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401378:	0f b6 14 07          	movzx  edx,BYTE PTR [rdi+rax*1]
  40137c:	48 83 c0 01          	add    rax,0x1
  401380:	0f be 4c 06 ff       	movsx  ecx,BYTE PTR [rsi+rax*1-0x1]
  401385:	38 ca                	cmp    dl,cl
  401387:	75 07                	jne    401390 <strcmp+0x40>
  401389:	84 d2                	test   dl,dl
  40138b:	75 eb                	jne    401378 <strcmp+0x28>
  40138d:	31 c0                	xor    eax,eax
  40138f:	c3                   	ret    
  401390:	0f be c2             	movsx  eax,dl
  401393:	29 c8                	sub    eax,ecx
  401395:	c3                   	ret    
  401396:	b8 ff ff ff ff       	mov    eax,0xffffffff
  40139b:	c3                   	ret    
  40139c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

00000000004013a0 <get_components>:
  4013a0:	66 48 0f 7e c2       	movq   rdx,xmm0
  4013a5:	48 89 f8             	mov    rax,rdi
  4013a8:	48 c1 ea 3f          	shr    rdx,0x3f
  4013ac:	89 d7                	mov    edi,edx
  4013ae:	83 e7 01             	and    edi,0x1
  4013b1:	48 85 d2             	test   rdx,rdx
  4013b4:	74 08                	je     4013be <get_components+0x1e>
  4013b6:	66 0f 57 05 52 2f 00 	xorpd  xmm0,XMMWORD PTR [rip+0x2f52]        # 404310 <powers_of_10+0x90>
  4013bd:	00 
  4013be:	f2 48 0f 2c c8       	cvttsd2si rcx,xmm0
  4013c3:	66 0f ef d2          	pxor   xmm2,xmm2
  4013c7:	66 0f 28 c8          	movapd xmm1,xmm0
  4013cb:	89 f2                	mov    edx,esi
  4013cd:	4c 8d 05 ac 2e 00 00 	lea    r8,[rip+0x2eac]        # 404280 <powers_of_10>
  4013d4:	f2 41 0f 10 1c d0    	movsd  xmm3,QWORD PTR [r8+rdx*8]
  4013da:	f2 48 0f 2a d1       	cvtsi2sd xmm2,rcx
  4013df:	f2 0f 5c ca          	subsd  xmm1,xmm2
  4013e3:	66 0f ef d2          	pxor   xmm2,xmm2
  4013e7:	f2 0f 59 cb          	mulsd  xmm1,xmm3
  4013eb:	f2 48 0f 2c d1       	cvttsd2si rdx,xmm1
  4013f0:	f2 48 0f 2a d2       	cvtsi2sd xmm2,rdx
  4013f5:	f2 0f 5c ca          	subsd  xmm1,xmm2
  4013f9:	f2 0f 10 15 1f 2f 00 	movsd  xmm2,QWORD PTR [rip+0x2f1f]        # 404320 <powers_of_10+0xa0>
  401400:	00 
  401401:	66 0f 2f ca          	comisd xmm1,xmm2
  401405:	76 51                	jbe    401458 <get_components+0xb8>
  401407:	48 83 c2 01          	add    rdx,0x1
  40140b:	66 0f ef c9          	pxor   xmm1,xmm1
  40140f:	f2 48 0f 2a ca       	cvtsi2sd xmm1,rdx
  401414:	66 0f 2f cb          	comisd xmm1,xmm3
  401418:	73 56                	jae    401470 <get_components+0xd0>
  40141a:	85 f6                	test   esi,esi
  40141c:	75 27                	jne    401445 <get_components+0xa5>
  40141e:	66 0f ef c9          	pxor   xmm1,xmm1
  401422:	f2 48 0f 2a c9       	cvtsi2sd xmm1,rcx
  401427:	f2 0f 5c c1          	subsd  xmm0,xmm1
  40142b:	66 0f 2f d0          	comisd xmm2,xmm0
  40142f:	76 06                	jbe    401437 <get_components+0x97>
  401431:	66 0f 2f c2          	comisd xmm0,xmm2
  401435:	76 0e                	jbe    401445 <get_components+0xa5>
  401437:	48 89 ce             	mov    rsi,rcx
  40143a:	83 e6 01             	and    esi,0x1
  40143d:	48 83 fe 01          	cmp    rsi,0x1
  401441:	48 83 d9 ff          	sbb    rcx,0xffffffffffffffff
  401445:	48 89 08             	mov    QWORD PTR [rax],rcx
  401448:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
  40144c:	40 88 78 10          	mov    BYTE PTR [rax+0x10],dil
  401450:	c3                   	ret    
  401451:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401458:	66 0f 2e ca          	ucomisd xmm1,xmm2
  40145c:	7a bc                	jp     40141a <get_components+0x7a>
  40145e:	75 ba                	jne    40141a <get_components+0x7a>
  401460:	48 85 d2             	test   rdx,rdx
  401463:	75 1b                	jne    401480 <get_components+0xe0>
  401465:	48 83 c2 01          	add    rdx,0x1
  401469:	eb af                	jmp    40141a <get_components+0x7a>
  40146b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  401470:	48 83 c1 01          	add    rcx,0x1
  401474:	31 d2                	xor    edx,edx
  401476:	eb a2                	jmp    40141a <get_components+0x7a>
  401478:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40147f:	00 
  401480:	f6 c2 01             	test   dl,0x1
  401483:	74 95                	je     40141a <get_components+0x7a>
  401485:	eb de                	jmp    401465 <get_components+0xc5>
  401487:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40148e:	00 00 

0000000000401490 <putchar_wrapper>:
  401490:	f3 0f 1e fa          	endbr64 
  401494:	40 0f be ff          	movsx  edi,dil
  401498:	e9 a3 22 00 00       	jmp    403740 <putchar_>
  40149d:	0f 1f 00             	nop    DWORD PTR [rax]

00000000004014a0 <out_rev_>:
  4014a0:	41 57                	push   r15
  4014a2:	44 89 c0             	mov    eax,r8d
  4014a5:	41 56                	push   r14
  4014a7:	41 89 d6             	mov    r14d,edx
  4014aa:	41 55                	push   r13
  4014ac:	49 89 f5             	mov    r13,rsi
  4014af:	41 54                	push   r12
  4014b1:	41 89 cc             	mov    r12d,ecx
  4014b4:	55                   	push   rbp
  4014b5:	53                   	push   rbx
  4014b6:	48 89 fb             	mov    rbx,rdi
  4014b9:	48 83 ec 18          	sub    rsp,0x18
  4014bd:	44 8b 7f 18          	mov    r15d,DWORD PTR [rdi+0x18]
  4014c1:	44 89 44 24 0c       	mov    DWORD PTR [rsp+0xc],r8d
  4014c6:	a8 03                	test   al,0x3
  4014c8:	75 16                	jne    4014e0 <out_rev_+0x40>
  4014ca:	44 89 f8             	mov    eax,r15d
  4014cd:	89 d5                	mov    ebp,edx
  4014cf:	39 ca                	cmp    edx,ecx
  4014d1:	0f 82 93 00 00 00    	jb     40156a <out_rev_+0xca>
  4014d7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4014de:	00 00 
  4014e0:	41 8d 6e ff          	lea    ebp,[r14-0x1]
  4014e4:	4c 01 ed             	add    rbp,r13
  4014e7:	45 85 f6             	test   r14d,r14d
  4014ea:	75 16                	jne    401502 <out_rev_+0x62>
  4014ec:	eb 42                	jmp    401530 <out_rev_+0x90>
  4014ee:	66 90                	xchg   ax,ax
  4014f0:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  4014f4:	ff d2                	call   rdx
  4014f6:	48 8d 45 ff          	lea    rax,[rbp-0x1]
  4014fa:	49 39 ed             	cmp    r13,rbp
  4014fd:	74 31                	je     401530 <out_rev_+0x90>
  4014ff:	48 89 c5             	mov    rbp,rax
  401502:	8b 43 18             	mov    eax,DWORD PTR [rbx+0x18]
  401505:	0f be 7d 00          	movsx  edi,BYTE PTR [rbp+0x0]
  401509:	8d 50 01             	lea    edx,[rax+0x1]
  40150c:	89 53 18             	mov    DWORD PTR [rbx+0x18],edx
  40150f:	3b 43 1c             	cmp    eax,DWORD PTR [rbx+0x1c]
  401512:	73 e2                	jae    4014f6 <out_rev_+0x56>
  401514:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
  401517:	48 85 d2             	test   rdx,rdx
  40151a:	75 d4                	jne    4014f0 <out_rev_+0x50>
  40151c:	48 8b 53 10          	mov    rdx,QWORD PTR [rbx+0x10]
  401520:	40 88 3c 02          	mov    BYTE PTR [rdx+rax*1],dil
  401524:	48 8d 45 ff          	lea    rax,[rbp-0x1]
  401528:	49 39 ed             	cmp    r13,rbp
  40152b:	75 d2                	jne    4014ff <out_rev_+0x5f>
  40152d:	0f 1f 00             	nop    DWORD PTR [rax]
  401530:	f6 44 24 0c 02       	test   BYTE PTR [rsp+0xc],0x2
  401535:	75 61                	jne    401598 <out_rev_+0xf8>
  401537:	48 83 c4 18          	add    rsp,0x18
  40153b:	5b                   	pop    rbx
  40153c:	5d                   	pop    rbp
  40153d:	41 5c                	pop    r12
  40153f:	41 5d                	pop    r13
  401541:	41 5e                	pop    r14
  401543:	41 5f                	pop    r15
  401545:	c3                   	ret    
  401546:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40154d:	00 00 00 
  401550:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  401554:	bf 20 00 00 00       	mov    edi,0x20
  401559:	ff d2                	call   rdx
  40155b:	83 c5 01             	add    ebp,0x1
  40155e:	41 39 ec             	cmp    r12d,ebp
  401561:	0f 84 79 ff ff ff    	je     4014e0 <out_rev_+0x40>
  401567:	8b 43 18             	mov    eax,DWORD PTR [rbx+0x18]
  40156a:	8d 50 01             	lea    edx,[rax+0x1]
  40156d:	89 53 18             	mov    DWORD PTR [rbx+0x18],edx
  401570:	39 43 1c             	cmp    DWORD PTR [rbx+0x1c],eax
  401573:	76 e6                	jbe    40155b <out_rev_+0xbb>
  401575:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
  401578:	48 85 d2             	test   rdx,rdx
  40157b:	75 d3                	jne    401550 <out_rev_+0xb0>
  40157d:	48 8b 53 10          	mov    rdx,QWORD PTR [rbx+0x10]
  401581:	c6 04 02 20          	mov    BYTE PTR [rdx+rax*1],0x20
  401585:	eb d4                	jmp    40155b <out_rev_+0xbb>
  401587:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40158e:	00 00 
  401590:	48 8b 53 10          	mov    rdx,QWORD PTR [rbx+0x10]
  401594:	c6 04 02 20          	mov    BYTE PTR [rdx+rax*1],0x20
  401598:	8b 43 18             	mov    eax,DWORD PTR [rbx+0x18]
  40159b:	89 c2                	mov    edx,eax
  40159d:	44 29 fa             	sub    edx,r15d
  4015a0:	41 39 d4             	cmp    r12d,edx
  4015a3:	76 92                	jbe    401537 <out_rev_+0x97>
  4015a5:	8d 48 01             	lea    ecx,[rax+0x1]
  4015a8:	83 c2 01             	add    edx,0x1
  4015ab:	89 4b 18             	mov    DWORD PTR [rbx+0x18],ecx
  4015ae:	39 43 1c             	cmp    DWORD PTR [rbx+0x1c],eax
  4015b1:	76 1d                	jbe    4015d0 <out_rev_+0x130>
  4015b3:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
  4015b6:	48 85 d2             	test   rdx,rdx
  4015b9:	74 d5                	je     401590 <out_rev_+0xf0>
  4015bb:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  4015bf:	bf 20 00 00 00       	mov    edi,0x20
  4015c4:	ff d2                	call   rdx
  4015c6:	8b 43 18             	mov    eax,DWORD PTR [rbx+0x18]
  4015c9:	89 c2                	mov    edx,eax
  4015cb:	44 29 fa             	sub    edx,r15d
  4015ce:	eb d0                	jmp    4015a0 <out_rev_+0x100>
  4015d0:	89 c8                	mov    eax,ecx
  4015d2:	eb cc                	jmp    4015a0 <out_rev_+0x100>
  4015d4:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4015db:	00 00 00 
  4015de:	66 90                	xchg   ax,ax

00000000004015e0 <print_integer>:
  4015e0:	41 57                	push   r15
  4015e2:	45 89 c3             	mov    r11d,r8d
  4015e5:	41 56                	push   r14
  4015e7:	41 55                	push   r13
  4015e9:	41 54                	push   r12
  4015eb:	41 89 cc             	mov    r12d,ecx
  4015ee:	55                   	push   rbp
  4015ef:	48 89 fd             	mov    rbp,rdi
  4015f2:	53                   	push   rbx
  4015f3:	89 d3                	mov    ebx,edx
  4015f5:	48 83 ec 28          	sub    rsp,0x28
  4015f9:	44 8b 44 24 60       	mov    r8d,DWORD PTR [rsp+0x60]
  4015fe:	48 85 f6             	test   rsi,rsi
  401601:	0f 85 39 01 00 00    	jne    401740 <print_integer+0x160>
  401607:	41 f7 c0 00 08 00 00 	test   r8d,0x800
  40160e:	0f 85 0c 02 00 00    	jne    401820 <print_integer+0x240>
  401614:	c6 04 24 30          	mov    BYTE PTR [rsp],0x30
  401618:	41 83 e0 ef          	and    r8d,0xffffffef
  40161c:	bf 01 00 00 00       	mov    edi,0x1
  401621:	41 bd 01 00 00 00    	mov    r13d,0x1
  401627:	41 f6 c0 02          	test   r8b,0x2
  40162b:	0f 85 7f 01 00 00    	jne    4017b0 <print_integer+0x1d0>
  401631:	44 89 c0             	mov    eax,r8d
  401634:	83 e0 01             	and    eax,0x1
  401637:	45 85 c9             	test   r9d,r9d
  40163a:	0f 84 70 01 00 00    	je     4017b0 <print_integer+0x1d0>
  401640:	85 c0                	test   eax,eax
  401642:	0f 84 68 01 00 00    	je     4017b0 <print_integer+0x1d0>
  401648:	84 db                	test   bl,bl
  40164a:	0f 85 70 02 00 00    	jne    4018c0 <print_integer+0x2e0>
  401650:	41 f6 c0 0c          	test   r8b,0xc
  401654:	0f 85 66 02 00 00    	jne    4018c0 <print_integer+0x2e0>
  40165a:	45 39 cd             	cmp    r13d,r9d
  40165d:	0f 83 4d 01 00 00    	jae    4017b0 <print_integer+0x1d0>
  401663:	40 84 ff             	test   dil,dil
  401666:	0f 84 44 01 00 00    	je     4017b0 <print_integer+0x1d0>
  40166c:	48 89 e6             	mov    rsi,rsp
  40166f:	44 89 e8             	mov    eax,r13d
  401672:	44 89 ea             	mov    edx,r13d
  401675:	48 01 f0             	add    rax,rsi
  401678:	eb 0a                	jmp    401684 <print_integer+0xa4>
  40167a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  401680:	84 c9                	test   cl,cl
  401682:	74 15                	je     401699 <print_integer+0xb9>
  401684:	83 c2 01             	add    edx,0x1
  401687:	c6 00 30             	mov    BYTE PTR [rax],0x30
  40168a:	83 fa 1f             	cmp    edx,0x1f
  40168d:	0f 96 c1             	setbe  cl
  401690:	48 83 c0 01          	add    rax,0x1
  401694:	44 39 ca             	cmp    edx,r9d
  401697:	72 e7                	jb     401680 <print_integer+0xa0>
  401699:	41 39 d3             	cmp    r11d,edx
  40169c:	76 26                	jbe    4016c4 <print_integer+0xe4>
  40169e:	84 c9                	test   cl,cl
  4016a0:	74 22                	je     4016c4 <print_integer+0xe4>
  4016a2:	89 d0                	mov    eax,edx
  4016a4:	48 01 f0             	add    rax,rsi
  4016a7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4016ae:	00 00 
  4016b0:	83 c2 01             	add    edx,0x1
  4016b3:	c6 00 30             	mov    BYTE PTR [rax],0x30
  4016b6:	48 83 c0 01          	add    rax,0x1
  4016ba:	41 39 d3             	cmp    r11d,edx
  4016bd:	76 05                	jbe    4016c4 <print_integer+0xe4>
  4016bf:	83 fa 1f             	cmp    edx,0x1f
  4016c2:	76 ec                	jbe    4016b0 <print_integer+0xd0>
  4016c4:	41 39 d5             	cmp    r13d,edx
  4016c7:	40 0f 92 c7          	setb   dil
  4016cb:	41 80 fc 08          	cmp    r12b,0x8
  4016cf:	0f 94 c0             	sete   al
  4016d2:	40 20 f8             	and    al,dil
  4016d5:	74 06                	je     4016dd <print_integer+0xfd>
  4016d7:	41 83 e0 ef          	and    r8d,0xffffffef
  4016db:	89 c7                	mov    edi,eax
  4016dd:	41 f7 c0 10 20 00 00 	test   r8d,0x2010
  4016e4:	0f 84 12 01 00 00    	je     4017fc <print_integer+0x21c>
  4016ea:	41 f7 c0 00 08 00 00 	test   r8d,0x800
  4016f1:	0f 84 d9 00 00 00    	je     4017d0 <print_integer+0x1f0>
  4016f7:	83 fa 1f             	cmp    edx,0x1f
  4016fa:	0f 96 c0             	setbe  al
  4016fd:	41 80 fc 10          	cmp    r12b,0x10
  401701:	0f 84 c9 01 00 00    	je     4018d0 <print_integer+0x2f0>
  401707:	41 80 fc 02          	cmp    r12b,0x2
  40170b:	75 0d                	jne    40171a <print_integer+0x13a>
  40170d:	84 c0                	test   al,al
  40170f:	74 09                	je     40171a <print_integer+0x13a>
  401711:	89 d0                	mov    eax,edx
  401713:	83 c2 01             	add    edx,0x1
  401716:	c6 04 04 62          	mov    BYTE PTR [rsp+rax*1],0x62
  40171a:	83 fa 20             	cmp    edx,0x20
  40171d:	0f 85 93 01 00 00    	jne    4018b6 <print_integer+0x2d6>
  401723:	48 89 ef             	mov    rdi,rbp
  401726:	44 89 c9             	mov    ecx,r9d
  401729:	e8 72 fd ff ff       	call   4014a0 <out_rev_>
  40172e:	48 83 c4 28          	add    rsp,0x28
  401732:	5b                   	pop    rbx
  401733:	5d                   	pop    rbp
  401734:	41 5c                	pop    r12
  401736:	41 5d                	pop    r13
  401738:	41 5e                	pop    r14
  40173a:	41 5f                	pop    r15
  40173c:	c3                   	ret    
  40173d:	0f 1f 00             	nop    DWORD PTR [rax]
  401740:	44 89 c0             	mov    eax,r8d
  401743:	44 0f b6 d1          	movzx  r10d,cl
  401747:	4c 8d 7c 24 ff       	lea    r15,[rsp-0x1]
  40174c:	b9 01 00 00 00       	mov    ecx,0x1
  401751:	83 e0 20             	and    eax,0x20
  401754:	83 f8 01             	cmp    eax,0x1
  401757:	45 19 f6             	sbb    r14d,r14d
  40175a:	41 83 e6 20          	and    r14d,0x20
  40175e:	41 83 c6 37          	add    r14d,0x37
  401762:	eb 07                	jmp    40176b <print_integer+0x18b>
  401764:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401768:	48 89 c6             	mov    rsi,rax
  40176b:	31 d2                	xor    edx,edx
  40176d:	48 89 f0             	mov    rax,rsi
  401770:	49 f7 f2             	div    r10
  401773:	44 8d 6a 30          	lea    r13d,[rdx+0x30]
  401777:	48 83 fa 09          	cmp    rdx,0x9
  40177b:	41 8d 3c 16          	lea    edi,[r14+rdx*1]
  40177f:	41 0f 46 fd          	cmovbe edi,r13d
  401783:	83 f9 1f             	cmp    ecx,0x1f
  401786:	41 89 cd             	mov    r13d,ecx
  401789:	0f 96 c2             	setbe  dl
  40178c:	41 88 3c 0f          	mov    BYTE PTR [r15+rcx*1],dil
  401790:	89 d7                	mov    edi,edx
  401792:	48 83 c1 01          	add    rcx,0x1
  401796:	4c 39 d6             	cmp    rsi,r10
  401799:	0f 82 88 fe ff ff    	jb     401627 <print_integer+0x47>
  40179f:	84 d2                	test   dl,dl
  4017a1:	75 c5                	jne    401768 <print_integer+0x188>
  4017a3:	41 f6 c0 02          	test   r8b,0x2
  4017a7:	0f 84 84 fe ff ff    	je     401631 <print_integer+0x51>
  4017ad:	0f 1f 00             	nop    DWORD PTR [rax]
  4017b0:	45 39 dd             	cmp    r13d,r11d
  4017b3:	44 89 ea             	mov    edx,r13d
  4017b6:	48 89 e6             	mov    rsi,rsp
  4017b9:	0f 92 c0             	setb   al
  4017bc:	40 20 c7             	and    dil,al
  4017bf:	0f 85 dd fe ff ff    	jne    4016a2 <print_integer+0xc2>
  4017c5:	e9 13 ff ff ff       	jmp    4016dd <print_integer+0xfd>
  4017ca:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4017d0:	85 d2                	test   edx,edx
  4017d2:	0f 85 88 00 00 00    	jne    401860 <print_integer+0x280>
  4017d8:	41 80 fc 10          	cmp    r12b,0x10
  4017dc:	0f 84 18 01 00 00    	je     4018fa <print_integer+0x31a>
  4017e2:	41 80 fc 02          	cmp    r12b,0x2
  4017e6:	0f 85 30 01 00 00    	jne    40191c <print_integer+0x33c>
  4017ec:	c6 04 24 62          	mov    BYTE PTR [rsp],0x62
  4017f0:	b8 01 00 00 00       	mov    eax,0x1
  4017f5:	c6 04 04 30          	mov    BYTE PTR [rsp+rax*1],0x30
  4017f9:	8d 50 01             	lea    edx,[rax+0x1]
  4017fc:	83 fa 20             	cmp    edx,0x20
  4017ff:	0f 84 1e ff ff ff    	je     401723 <print_integer+0x143>
  401805:	84 db                	test   bl,bl
  401807:	74 37                	je     401840 <print_integer+0x260>
  401809:	89 d0                	mov    eax,edx
  40180b:	83 c2 01             	add    edx,0x1
  40180e:	c6 04 04 2d          	mov    BYTE PTR [rsp+rax*1],0x2d
  401812:	e9 0c ff ff ff       	jmp    401723 <print_integer+0x143>
  401817:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40181e:	00 00 
  401820:	44 89 c0             	mov    eax,r8d
  401823:	45 31 ed             	xor    r13d,r13d
  401826:	41 83 e0 ef          	and    r8d,0xffffffef
  40182a:	80 f9 10             	cmp    cl,0x10
  40182d:	44 0f 45 c0          	cmovne r8d,eax
  401831:	bf 01 00 00 00       	mov    edi,0x1
  401836:	e9 ec fd ff ff       	jmp    401627 <print_integer+0x47>
  40183b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  401840:	41 f6 c0 04          	test   r8b,0x4
  401844:	75 62                	jne    4018a8 <print_integer+0x2c8>
  401846:	41 f6 c0 08          	test   r8b,0x8
  40184a:	0f 84 d3 fe ff ff    	je     401723 <print_integer+0x143>
  401850:	89 d0                	mov    eax,edx
  401852:	83 c2 01             	add    edx,0x1
  401855:	c6 04 04 20          	mov    BYTE PTR [rsp+rax*1],0x20
  401859:	e9 c5 fe ff ff       	jmp    401723 <print_integer+0x143>
  40185e:	66 90                	xchg   ax,ax
  401860:	41 39 d3             	cmp    r11d,edx
  401863:	74 09                	je     40186e <print_integer+0x28e>
  401865:	44 39 ca             	cmp    edx,r9d
  401868:	0f 85 89 fe ff ff    	jne    4016f7 <print_integer+0x117>
  40186e:	40 84 ff             	test   dil,dil
  401871:	0f 84 80 fe ff ff    	je     4016f7 <print_integer+0x117>
  401877:	89 d0                	mov    eax,edx
  401879:	83 e8 01             	sub    eax,0x1
  40187c:	0f 84 56 ff ff ff    	je     4017d8 <print_integer+0x1f8>
  401882:	b9 04 00 01 00       	mov    ecx,0x10004
  401887:	4c 0f a3 e1          	bt     rcx,r12
  40188b:	0f 83 a7 00 00 00    	jae    401938 <print_integer+0x358>
  401891:	41 39 c5             	cmp    r13d,eax
  401894:	0f 83 9e 00 00 00    	jae    401938 <print_integer+0x358>
  40189a:	83 ea 02             	sub    edx,0x2
  40189d:	e9 55 fe ff ff       	jmp    4016f7 <print_integer+0x117>
  4018a2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4018a8:	89 d0                	mov    eax,edx
  4018aa:	83 c2 01             	add    edx,0x1
  4018ad:	c6 04 04 2b          	mov    BYTE PTR [rsp+rax*1],0x2b
  4018b1:	e9 6d fe ff ff       	jmp    401723 <print_integer+0x143>
  4018b6:	89 d0                	mov    eax,edx
  4018b8:	e9 38 ff ff ff       	jmp    4017f5 <print_integer+0x215>
  4018bd:	0f 1f 00             	nop    DWORD PTR [rax]
  4018c0:	41 83 e9 01          	sub    r9d,0x1
  4018c4:	e9 91 fd ff ff       	jmp    40165a <print_integer+0x7a>
  4018c9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4018d0:	44 89 c1             	mov    ecx,r8d
  4018d3:	83 e1 20             	and    ecx,0x20
  4018d6:	75 0c                	jne    4018e4 <print_integer+0x304>
  4018d8:	84 c0                	test   al,al
  4018da:	75 4e                	jne    40192a <print_integer+0x34a>
  4018dc:	85 c9                	test   ecx,ecx
  4018de:	0f 84 36 fe ff ff    	je     40171a <print_integer+0x13a>
  4018e4:	84 c0                	test   al,al
  4018e6:	0f 84 2e fe ff ff    	je     40171a <print_integer+0x13a>
  4018ec:	89 d0                	mov    eax,edx
  4018ee:	83 c2 01             	add    edx,0x1
  4018f1:	c6 04 04 58          	mov    BYTE PTR [rsp+rax*1],0x58
  4018f5:	e9 20 fe ff ff       	jmp    40171a <print_integer+0x13a>
  4018fa:	41 f6 c0 20          	test   r8b,0x20
  4018fe:	75 0e                	jne    40190e <print_integer+0x32e>
  401900:	c6 04 24 78          	mov    BYTE PTR [rsp],0x78
  401904:	b8 01 00 00 00       	mov    eax,0x1
  401909:	e9 e7 fe ff ff       	jmp    4017f5 <print_integer+0x215>
  40190e:	c6 04 24 58          	mov    BYTE PTR [rsp],0x58
  401912:	b8 01 00 00 00       	mov    eax,0x1
  401917:	e9 d9 fe ff ff       	jmp    4017f5 <print_integer+0x215>
  40191c:	c6 04 24 30          	mov    BYTE PTR [rsp],0x30
  401920:	ba 01 00 00 00       	mov    edx,0x1
  401925:	e9 db fe ff ff       	jmp    401805 <print_integer+0x225>
  40192a:	89 d0                	mov    eax,edx
  40192c:	83 c2 01             	add    edx,0x1
  40192f:	c6 04 04 78          	mov    BYTE PTR [rsp+rax*1],0x78
  401933:	e9 e2 fd ff ff       	jmp    40171a <print_integer+0x13a>
  401938:	89 c2                	mov    edx,eax
  40193a:	e9 b8 fd ff ff       	jmp    4016f7 <print_integer+0x117>
  40193f:	90                   	nop

0000000000401940 <print_broken_up_decimal.isra.0>:
  401940:	41 56                	push   r14
  401942:	49 89 ca             	mov    r10,rcx
  401945:	41 89 d3             	mov    r11d,edx
  401948:	41 55                	push   r13
  40194a:	45 89 c5             	mov    r13d,r8d
  40194d:	41 54                	push   r12
  40194f:	55                   	push   rbp
  401950:	53                   	push   rbx
  401951:	44 8b 44 24 30       	mov    r8d,DWORD PTR [rsp+0x30]
  401956:	48 8b 6c 24 38       	mov    rbp,QWORD PTR [rsp+0x38]
  40195b:	8b 4c 24 40          	mov    ecx,DWORD PTR [rsp+0x40]
  40195f:	45 85 ed             	test   r13d,r13d
  401962:	0f 84 90 00 00 00    	je     4019f8 <print_broken_up_decimal.isra.0+0xb8>
  401968:	44 89 c0             	mov    eax,r8d
  40196b:	25 10 10 00 00       	and    eax,0x1010
  401970:	3d 00 10 00 00       	cmp    eax,0x1000
  401975:	0f 84 05 02 00 00    	je     401b80 <print_broken_up_decimal.isra.0+0x240>
  40197b:	41 89 cc             	mov    r12d,ecx
  40197e:	89 cb                	mov    ebx,ecx
  401980:	42 8d 4c 29 ff       	lea    ecx,[rcx+r13*1-0x1]
  401985:	49 bd 67 66 66 66 66 	movabs r13,0x6666666666666667
  40198c:	66 66 66 
  40198f:	49 01 ec             	add    r12,rbp
  401992:	eb 43                	jmp    4019d7 <print_broken_up_decimal.isra.0+0x97>
  401994:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401998:	48 89 f0             	mov    rax,rsi
  40199b:	41 89 ce             	mov    r14d,ecx
  40199e:	49 83 c4 01          	add    r12,0x1
  4019a2:	49 f7 ed             	imul   r13
  4019a5:	48 89 f0             	mov    rax,rsi
  4019a8:	41 29 de             	sub    r14d,ebx
  4019ab:	83 c3 01             	add    ebx,0x1
  4019ae:	48 c1 f8 3f          	sar    rax,0x3f
  4019b2:	48 c1 fa 02          	sar    rdx,0x2
  4019b6:	48 29 c2             	sub    rdx,rax
  4019b9:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  4019bd:	48 01 c0             	add    rax,rax
  4019c0:	48 29 c6             	sub    rsi,rax
  4019c3:	83 c6 30             	add    esi,0x30
  4019c6:	41 88 74 24 ff       	mov    BYTE PTR [r12-0x1],sil
  4019cb:	48 89 d6             	mov    rsi,rdx
  4019ce:	48 85 d2             	test   rdx,rdx
  4019d1:	0f 84 f9 00 00 00    	je     401ad0 <print_broken_up_decimal.isra.0+0x190>
  4019d7:	83 fb 20             	cmp    ebx,0x20
  4019da:	75 bc                	jne    401998 <print_broken_up_decimal.isra.0+0x58>
  4019dc:	44 89 c0             	mov    eax,r8d
  4019df:	83 e0 03             	and    eax,0x3
  4019e2:	83 f8 01             	cmp    eax,0x1
  4019e5:	0f 84 35 01 00 00    	je     401b20 <print_broken_up_decimal.isra.0+0x1e0>
  4019eb:	ba 20 00 00 00       	mov    edx,0x20
  4019f0:	e9 7d 00 00 00       	jmp    401a72 <print_broken_up_decimal.isra.0+0x132>
  4019f5:	0f 1f 00             	nop    DWORD PTR [rax]
  4019f8:	41 f6 c0 10          	test   r8b,0x10
  4019fc:	0f 85 8e 00 00 00    	jne    401a90 <print_broken_up_decimal.isra.0+0x150>
  401a02:	48 bb 67 66 66 66 66 	movabs rbx,0x6666666666666667
  401a09:	66 66 66 
  401a0c:	89 ce                	mov    esi,ecx
  401a0e:	48 01 ee             	add    rsi,rbp
  401a11:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401a18:	83 f9 20             	cmp    ecx,0x20
  401a1b:	74 bf                	je     4019dc <print_broken_up_decimal.isra.0+0x9c>
  401a1d:	48 89 f8             	mov    rax,rdi
  401a20:	83 c1 01             	add    ecx,0x1
  401a23:	48 83 c6 01          	add    rsi,0x1
  401a27:	48 f7 eb             	imul   rbx
  401a2a:	48 89 f8             	mov    rax,rdi
  401a2d:	48 c1 f8 3f          	sar    rax,0x3f
  401a31:	48 c1 fa 02          	sar    rdx,0x2
  401a35:	48 29 c2             	sub    rdx,rax
  401a38:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  401a3c:	48 01 c0             	add    rax,rax
  401a3f:	48 29 c7             	sub    rdi,rax
  401a42:	83 c7 30             	add    edi,0x30
  401a45:	40 88 7e ff          	mov    BYTE PTR [rsi-0x1],dil
  401a49:	48 89 d7             	mov    rdi,rdx
  401a4c:	48 85 d2             	test   rdx,rdx
  401a4f:	75 c7                	jne    401a18 <print_broken_up_decimal.isra.0+0xd8>
  401a51:	44 89 c0             	mov    eax,r8d
  401a54:	83 e0 03             	and    eax,0x3
  401a57:	83 f8 01             	cmp    eax,0x1
  401a5a:	0f 84 b8 01 00 00    	je     401c18 <print_broken_up_decimal.isra.0+0x2d8>
  401a60:	83 f9 20             	cmp    ecx,0x20
  401a63:	74 86                	je     4019eb <print_broken_up_decimal.isra.0+0xab>
  401a65:	45 84 db             	test   r11b,r11b
  401a68:	74 46                	je     401ab0 <print_broken_up_decimal.isra.0+0x170>
  401a6a:	c6 44 0d 00 2d       	mov    BYTE PTR [rbp+rcx*1+0x0],0x2d
  401a6f:	8d 51 01             	lea    edx,[rcx+0x1]
  401a72:	5b                   	pop    rbx
  401a73:	48 89 ee             	mov    rsi,rbp
  401a76:	44 89 c9             	mov    ecx,r9d
  401a79:	5d                   	pop    rbp
  401a7a:	4c 89 d7             	mov    rdi,r10
  401a7d:	41 5c                	pop    r12
  401a7f:	41 5d                	pop    r13
  401a81:	41 5e                	pop    r14
  401a83:	e9 18 fa ff ff       	jmp    4014a0 <out_rev_>
  401a88:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  401a8f:	00 
  401a90:	83 f9 20             	cmp    ecx,0x20
  401a93:	0f 84 43 ff ff ff    	je     4019dc <print_broken_up_decimal.isra.0+0x9c>
  401a99:	89 c8                	mov    eax,ecx
  401a9b:	83 c1 01             	add    ecx,0x1
  401a9e:	c6 44 05 00 2e       	mov    BYTE PTR [rbp+rax*1+0x0],0x2e
  401aa3:	e9 5a ff ff ff       	jmp    401a02 <print_broken_up_decimal.isra.0+0xc2>
  401aa8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  401aaf:	00 
  401ab0:	41 f6 c0 04          	test   r8b,0x4
  401ab4:	0f 85 3e 01 00 00    	jne    401bf8 <print_broken_up_decimal.isra.0+0x2b8>
  401aba:	89 ca                	mov    edx,ecx
  401abc:	41 f6 c0 08          	test   r8b,0x8
  401ac0:	74 b0                	je     401a72 <print_broken_up_decimal.isra.0+0x132>
  401ac2:	c6 44 0d 00 20       	mov    BYTE PTR [rbp+rcx*1+0x0],0x20
  401ac7:	83 c2 01             	add    edx,0x1
  401aca:	eb a6                	jmp    401a72 <print_broken_up_decimal.isra.0+0x132>
  401acc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401ad0:	83 fb 1f             	cmp    ebx,0x1f
  401ad3:	77 13                	ja     401ae8 <print_broken_up_decimal.isra.0+0x1a8>
  401ad5:	45 85 f6             	test   r14d,r14d
  401ad8:	89 d8                	mov    eax,ebx
  401ada:	0f 95 c2             	setne  dl
  401add:	48 01 e8             	add    rax,rbp
  401ae0:	84 d2                	test   dl,dl
  401ae2:	75 20                	jne    401b04 <print_broken_up_decimal.isra.0+0x1c4>
  401ae4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401ae8:	83 fb 20             	cmp    ebx,0x20
  401aeb:	0f 84 eb fe ff ff    	je     4019dc <print_broken_up_decimal.isra.0+0x9c>
  401af1:	c6 44 1d 00 2e       	mov    BYTE PTR [rbp+rbx*1+0x0],0x2e
  401af6:	8d 4b 01             	lea    ecx,[rbx+0x1]
  401af9:	e9 04 ff ff ff       	jmp    401a02 <print_broken_up_decimal.isra.0+0xc2>
  401afe:	66 90                	xchg   ax,ax
  401b00:	39 ca                	cmp    edx,ecx
  401b02:	74 e4                	je     401ae8 <print_broken_up_decimal.isra.0+0x1a8>
  401b04:	89 da                	mov    edx,ebx
  401b06:	83 c3 01             	add    ebx,0x1
  401b09:	c6 00 30             	mov    BYTE PTR [rax],0x30
  401b0c:	48 83 c0 01          	add    rax,0x1
  401b10:	83 fb 1f             	cmp    ebx,0x1f
  401b13:	76 eb                	jbe    401b00 <print_broken_up_decimal.isra.0+0x1c0>
  401b15:	eb d1                	jmp    401ae8 <print_broken_up_decimal.isra.0+0x1a8>
  401b17:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  401b1e:	00 00 
  401b20:	45 85 c9             	test   r9d,r9d
  401b23:	0f 84 c2 fe ff ff    	je     4019eb <print_broken_up_decimal.isra.0+0xab>
  401b29:	31 d2                	xor    edx,edx
  401b2b:	b9 20 00 00 00       	mov    ecx,0x20
  401b30:	45 84 db             	test   r11b,r11b
  401b33:	0f 85 cf 00 00 00    	jne    401c08 <print_broken_up_decimal.isra.0+0x2c8>
  401b39:	41 f6 c0 0c          	test   r8b,0xc
  401b3d:	0f 85 c5 00 00 00    	jne    401c08 <print_broken_up_decimal.isra.0+0x2c8>
  401b43:	44 39 c9             	cmp    ecx,r9d
  401b46:	0f 83 14 ff ff ff    	jae    401a60 <print_broken_up_decimal.isra.0+0x120>
  401b4c:	89 c8                	mov    eax,ecx
  401b4e:	48 01 e8             	add    rax,rbp
  401b51:	84 d2                	test   dl,dl
  401b53:	0f 84 07 ff ff ff    	je     401a60 <print_broken_up_decimal.isra.0+0x120>
  401b59:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401b60:	83 c1 01             	add    ecx,0x1
  401b63:	c6 00 30             	mov    BYTE PTR [rax],0x30
  401b66:	48 83 c0 01          	add    rax,0x1
  401b6a:	44 39 c9             	cmp    ecx,r9d
  401b6d:	0f 83 ed fe ff ff    	jae    401a60 <print_broken_up_decimal.isra.0+0x120>
  401b73:	83 f9 1f             	cmp    ecx,0x1f
  401b76:	76 e8                	jbe    401b60 <print_broken_up_decimal.isra.0+0x220>
  401b78:	e9 e3 fe ff ff       	jmp    401a60 <print_broken_up_decimal.isra.0+0x120>
  401b7d:	0f 1f 00             	nop    DWORD PTR [rax]
  401b80:	48 85 f6             	test   rsi,rsi
  401b83:	0f 8e 79 fe ff ff    	jle    401a02 <print_broken_up_decimal.isra.0+0xc2>
  401b89:	48 bb cd cc cc cc cc 	movabs rbx,0xcccccccccccccccd
  401b90:	cc cc cc 
  401b93:	48 89 f0             	mov    rax,rsi
  401b96:	48 ba 98 99 99 99 99 	movabs rdx,0x1999999999999998
  401b9d:	99 99 19 
  401ba0:	48 0f af c3          	imul   rax,rbx
  401ba4:	48 01 d0             	add    rax,rdx
  401ba7:	48 d1 c8             	ror    rax,1
  401baa:	48 39 d0             	cmp    rax,rdx
  401bad:	0f 87 c8 fd ff ff    	ja     40197b <print_broken_up_decimal.isra.0+0x3b>
  401bb3:	49 be 99 99 99 99 99 	movabs r14,0x1999999999999999
  401bba:	99 99 19 
  401bbd:	0f 1f 00             	nop    DWORD PTR [rax]
  401bc0:	48 89 f0             	mov    rax,rsi
  401bc3:	49 89 f4             	mov    r12,rsi
  401bc6:	41 83 ed 01          	sub    r13d,0x1
  401bca:	48 f7 e3             	mul    rbx
  401bcd:	48 89 d6             	mov    rsi,rdx
  401bd0:	48 c1 ee 03          	shr    rsi,0x3
  401bd4:	48 89 f0             	mov    rax,rsi
  401bd7:	48 0f af c3          	imul   rax,rbx
  401bdb:	48 d1 c8             	ror    rax,1
  401bde:	4c 39 f0             	cmp    rax,r14
  401be1:	76 dd                	jbe    401bc0 <print_broken_up_decimal.isra.0+0x280>
  401be3:	49 83 fc 09          	cmp    r12,0x9
  401be7:	0f 8f 8e fd ff ff    	jg     40197b <print_broken_up_decimal.isra.0+0x3b>
  401bed:	e9 10 fe ff ff       	jmp    401a02 <print_broken_up_decimal.isra.0+0xc2>
  401bf2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  401bf8:	c6 44 0d 00 2b       	mov    BYTE PTR [rbp+rcx*1+0x0],0x2b
  401bfd:	8d 51 01             	lea    edx,[rcx+0x1]
  401c00:	e9 6d fe ff ff       	jmp    401a72 <print_broken_up_decimal.isra.0+0x132>
  401c05:	0f 1f 00             	nop    DWORD PTR [rax]
  401c08:	41 83 e9 01          	sub    r9d,0x1
  401c0c:	e9 32 ff ff ff       	jmp    401b43 <print_broken_up_decimal.isra.0+0x203>
  401c11:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401c18:	45 85 c9             	test   r9d,r9d
  401c1b:	0f 84 3f fe ff ff    	je     401a60 <print_broken_up_decimal.isra.0+0x120>
  401c21:	83 f9 1f             	cmp    ecx,0x1f
  401c24:	0f 96 c2             	setbe  dl
  401c27:	e9 04 ff ff ff       	jmp    401b30 <print_broken_up_decimal.isra.0+0x1f0>
  401c2c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000401c30 <print_exponential_number>:
  401c30:	41 57                	push   r15
  401c32:	41 89 f2             	mov    r10d,esi
  401c35:	41 89 cf             	mov    r15d,ecx
  401c38:	4d 89 c3             	mov    r11,r8
  401c3b:	41 56                	push   r14
  401c3d:	41 55                	push   r13
  401c3f:	41 54                	push   r12
  401c41:	49 89 fc             	mov    r12,rdi
  401c44:	55                   	push   rbp
  401c45:	89 d5                	mov    ebp,edx
  401c47:	66 48 0f 7e c2       	movq   rdx,xmm0
  401c4c:	53                   	push   rbx
  401c4d:	48 83 ec 38          	sub    rsp,0x38
  401c51:	48 c1 ea 3f          	shr    rdx,0x3f
  401c55:	74 08                	je     401c5f <print_exponential_number+0x2f>
  401c57:	66 0f 57 05 b1 26 00 	xorpd  xmm0,XMMWORD PTR [rip+0x26b1]        # 404310 <powers_of_10+0x90>
  401c5e:	00 
  401c5f:	44 89 f9             	mov    ecx,r15d
  401c62:	66 0f ef db          	pxor   xmm3,xmm3
  401c66:	81 e1 00 10 00 00    	and    ecx,0x1000
  401c6c:	66 0f 2e c3          	ucomisd xmm0,xmm3
  401c70:	0f 8a 9a 00 00 00    	jp     401d10 <print_exponential_number+0xe0>
  401c76:	0f 85 94 00 00 00    	jne    401d10 <print_exponential_number+0xe0>
  401c7c:	85 c9                	test   ecx,ecx
  401c7e:	0f 85 6c 02 00 00    	jne    401ef0 <print_exponential_number+0x2c0>
  401c84:	48 85 d2             	test   rdx,rdx
  401c87:	0f 84 fc 06 00 00    	je     402389 <print_exponential_number+0x759>
  401c8d:	31 c0                	xor    eax,eax
  401c8f:	31 db                	xor    ebx,ebx
  401c91:	66 0f 57 05 77 26 00 	xorpd  xmm0,XMMWORD PTR [rip+0x2677]        # 404310 <powers_of_10+0x90>
  401c98:	00 
  401c99:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  401c9e:	44 89 d6             	mov    esi,r10d
  401ca1:	88 44 24 0c          	mov    BYTE PTR [rsp+0xc],al
  401ca5:	e8 f6 f6 ff ff       	call   4013a0 <get_components>
  401caa:	0f b6 44 24 0c       	movzx  eax,BYTE PTR [rsp+0xc]
  401caf:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  401cb4:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  401cb9:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  401cbe:	84 c0                	test   al,al
  401cc0:	0f 84 0a 03 00 00    	je     401fd0 <print_exponential_number+0x3a0>
  401cc6:	41 f7 c7 00 10 00 00 	test   r15d,0x1000
  401ccd:	74 09                	je     401cd8 <print_exponential_number+0xa8>
  401ccf:	83 fb ff             	cmp    ebx,0xffffffff
  401cd2:	0f 8d 48 05 00 00    	jge    402220 <print_exponential_number+0x5f0>
  401cd8:	85 ed                	test   ebp,ebp
  401cda:	0f 84 30 03 00 00    	je     402010 <print_exponential_number+0x3e0>
  401ce0:	48 83 ec 08          	sub    rsp,0x8
  401ce4:	45 89 d0             	mov    r8d,r10d
  401ce7:	4c 89 e1             	mov    rcx,r12
  401cea:	41 51                	push   r9
  401cec:	41 89 e9             	mov    r9d,ebp
  401cef:	41 53                	push   r11
  401cf1:	41 57                	push   r15
  401cf3:	e8 48 fc ff ff       	call   401940 <print_broken_up_decimal.isra.0>
  401cf8:	48 83 c4 20          	add    rsp,0x20
  401cfc:	48 83 c4 38          	add    rsp,0x38
  401d00:	5b                   	pop    rbx
  401d01:	5d                   	pop    rbp
  401d02:	41 5c                	pop    r12
  401d04:	41 5d                	pop    r13
  401d06:	41 5e                	pop    r14
  401d08:	41 5f                	pop    r15
  401d0a:	c3                   	ret    
  401d0b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  401d10:	66 48 0f 7e c6       	movq   rsi,xmm0
  401d15:	f2 0f 10 2d 33 26 00 	movsd  xmm5,QWORD PTR [rip+0x2633]        # 404350 <powers_of_10+0xd0>
  401d1c:	00 
  401d1d:	48 b8 ff ff ff ff ff 	movabs rax,0xfffffffffffff
  401d24:	ff 0f 00 
  401d27:	48 bf 00 00 00 00 00 	movabs rdi,0x3ff0000000000000
  401d2e:	00 f0 3f 
  401d31:	48 21 f0             	and    rax,rsi
  401d34:	f2 0f 10 15 04 26 00 	movsd  xmm2,QWORD PTR [rip+0x2604]        # 404340 <powers_of_10+0xc0>
  401d3b:	00 
  401d3c:	48 c1 ee 34          	shr    rsi,0x34
  401d40:	48 09 f8             	or     rax,rdi
  401d43:	81 e6 ff 07 00 00    	and    esi,0x7ff
  401d49:	66 48 0f 6e c8       	movq   xmm1,rax
  401d4e:	f2 0f 5c 0d e2 25 00 	subsd  xmm1,QWORD PTR [rip+0x25e2]        # 404338 <powers_of_10+0xb8>
  401d55:	00 
  401d56:	81 ee ff 03 00 00    	sub    esi,0x3ff
  401d5c:	f2 0f 59 d1          	mulsd  xmm2,xmm1
  401d60:	66 0f 28 e1          	movapd xmm4,xmm1
  401d64:	f2 0f 59 e1          	mulsd  xmm4,xmm1
  401d68:	f2 0f 58 15 d8 25 00 	addsd  xmm2,QWORD PTR [rip+0x25d8]        # 404348 <powers_of_10+0xc8>
  401d6f:	00 
  401d70:	f2 0f 59 ec          	mulsd  xmm5,xmm4
  401d74:	f2 0f 59 cc          	mulsd  xmm1,xmm4
  401d78:	f2 0f 59 0d d8 25 00 	mulsd  xmm1,QWORD PTR [rip+0x25d8]        # 404358 <powers_of_10+0xd8>
  401d7f:	00 
  401d80:	f2 0f 5c d5          	subsd  xmm2,xmm5
  401d84:	f2 0f 58 ca          	addsd  xmm1,xmm2
  401d88:	66 0f ef d2          	pxor   xmm2,xmm2
  401d8c:	f2 0f 2a d6          	cvtsi2sd xmm2,esi
  401d90:	f2 0f 59 15 c8 25 00 	mulsd  xmm2,QWORD PTR [rip+0x25c8]        # 404360 <powers_of_10+0xe0>
  401d97:	00 
  401d98:	f2 0f 58 ca          	addsd  xmm1,xmm2
  401d9c:	66 0f 2f cb          	comisd xmm1,xmm3
  401da0:	f2 0f 2c d9          	cvttsd2si ebx,xmm1
  401da4:	73 18                	jae    401dbe <print_exponential_number+0x18e>
  401da6:	66 0f ef d2          	pxor   xmm2,xmm2
  401daa:	f2 0f 2a d3          	cvtsi2sd xmm2,ebx
  401dae:	66 0f 2e ca          	ucomisd xmm1,xmm2
  401db2:	0f 8a 98 04 00 00    	jp     402250 <print_exponential_number+0x620>
  401db8:	0f 85 92 04 00 00    	jne    402250 <print_exponential_number+0x620>
  401dbe:	81 fb cc fe ff ff    	cmp    ebx,0xfffffecc
  401dc4:	0f 84 16 05 00 00    	je     4022e0 <print_exponential_number+0x6b0>
  401dca:	66 0f ef d2          	pxor   xmm2,xmm2
  401dce:	f2 0f 10 0d 92 25 00 	movsd  xmm1,QWORD PTR [rip+0x2592]        # 404368 <powers_of_10+0xe8>
  401dd5:	00 
  401dd6:	66 0f ef e4          	pxor   xmm4,xmm4
  401dda:	f2 0f 2a d3          	cvtsi2sd xmm2,ebx
  401dde:	f2 0f 59 ca          	mulsd  xmm1,xmm2
  401de2:	f2 0f 58 0d 36 25 00 	addsd  xmm1,QWORD PTR [rip+0x2536]        # 404320 <powers_of_10+0xa0>
  401de9:	00 
  401dea:	f2 0f 2c c1          	cvttsd2si eax,xmm1
  401dee:	66 0f 2f cb          	comisd xmm1,xmm3
  401df2:	f2 0f 2a e0          	cvtsi2sd xmm4,eax
  401df6:	73 10                	jae    401e08 <print_exponential_number+0x1d8>
  401df8:	66 0f 2e cc          	ucomisd xmm1,xmm4
  401dfc:	0f 8a ce 04 00 00    	jp     4022d0 <print_exponential_number+0x6a0>
  401e02:	0f 85 c8 04 00 00    	jne    4022d0 <print_exponential_number+0x6a0>
  401e08:	f2 0f 59 25 68 25 00 	mulsd  xmm4,QWORD PTR [rip+0x2568]        # 404378 <powers_of_10+0xf8>
  401e0f:	00 
  401e10:	f2 0f 10 35 70 25 00 	movsd  xmm6,QWORD PTR [rip+0x2570]        # 404388 <powers_of_10+0x108>
  401e17:	00 
  401e18:	48 98                	cdqe   
  401e1a:	f2 0f 59 15 4e 25 00 	mulsd  xmm2,QWORD PTR [rip+0x254e]        # 404370 <powers_of_10+0xf0>
  401e21:	00 
  401e22:	48 05 ff 03 00 00    	add    rax,0x3ff
  401e28:	48 c1 e0 34          	shl    rax,0x34
  401e2c:	66 48 0f 6e f8       	movq   xmm7,rax
  401e31:	f2 0f 5c d4          	subsd  xmm2,xmm4
  401e35:	66 0f 28 da          	movapd xmm3,xmm2
  401e39:	66 0f 28 ca          	movapd xmm1,xmm2
  401e3d:	f2 0f 59 da          	mulsd  xmm3,xmm2
  401e41:	f2 0f 58 ca          	addsd  xmm1,xmm2
  401e45:	66 0f 28 eb          	movapd xmm5,xmm3
  401e49:	f2 0f 5e 2d 2f 25 00 	divsd  xmm5,QWORD PTR [rip+0x252f]        # 404380 <powers_of_10+0x100>
  401e50:	00 
  401e51:	f2 0f 58 ee          	addsd  xmm5,xmm6
  401e55:	66 0f 28 e3          	movapd xmm4,xmm3
  401e59:	f2 0f 5e e5          	divsd  xmm4,xmm5
  401e5d:	f2 0f 58 25 2b 25 00 	addsd  xmm4,QWORD PTR [rip+0x252b]        # 404390 <powers_of_10+0x110>
  401e64:	00 
  401e65:	f2 0f 5e dc          	divsd  xmm3,xmm4
  401e69:	f2 0f 10 25 27 25 00 	movsd  xmm4,QWORD PTR [rip+0x2527]        # 404398 <powers_of_10+0x118>
  401e70:	00 
  401e71:	f2 0f 5c e2          	subsd  xmm4,xmm2
  401e75:	f2 0f 58 dc          	addsd  xmm3,xmm4
  401e79:	f2 0f 5e cb          	divsd  xmm1,xmm3
  401e7d:	f2 0f 58 0d 1b 25 00 	addsd  xmm1,QWORD PTR [rip+0x251b]        # 4043a0 <powers_of_10+0x120>
  401e84:	00 
  401e85:	f2 0f 59 cf          	mulsd  xmm1,xmm7
  401e89:	66 0f 2f c8          	comisd xmm1,xmm0
  401e8d:	0f 87 7d 03 00 00    	ja     402210 <print_exponential_number+0x5e0>
  401e93:	8d 43 11             	lea    eax,[rbx+0x11]
  401e96:	31 f6                	xor    esi,esi
  401e98:	83 f8 22             	cmp    eax,0x22
  401e9b:	77 1a                	ja     401eb7 <print_exponential_number+0x287>
  401e9d:	89 d8                	mov    eax,ebx
  401e9f:	48 8d 35 da 23 00 00 	lea    rsi,[rip+0x23da]        # 404280 <powers_of_10>
  401ea6:	f7 d8                	neg    eax
  401ea8:	0f 48 c3             	cmovs  eax,ebx
  401eab:	48 98                	cdqe   
  401ead:	f2 0f 10 0c c6       	movsd  xmm1,QWORD PTR [rsi+rax*8]
  401eb2:	be 01 00 00 00       	mov    esi,0x1
  401eb7:	89 d8                	mov    eax,ebx
  401eb9:	c1 e8 1f             	shr    eax,0x1f
  401ebc:	21 c6                	and    esi,eax
  401ebe:	85 db                	test   ebx,ebx
  401ec0:	40 0f 94 c7          	sete   dil
  401ec4:	31 c0                	xor    eax,eax
  401ec6:	85 c9                	test   ecx,ecx
  401ec8:	74 5f                	je     401f29 <print_exponential_number+0x2f9>
  401eca:	45 85 d2             	test   r10d,r10d
  401ecd:	b8 01 00 00 00       	mov    eax,0x1
  401ed2:	41 0f 45 c2          	cmovne eax,r10d
  401ed6:	39 c3                	cmp    ebx,eax
  401ed8:	0f 9c c0             	setl   al
  401edb:	83 fb fc             	cmp    ebx,0xfffffffc
  401ede:	0f 9d c1             	setge  cl
  401ee1:	21 c8                	and    eax,ecx
  401ee3:	09 c7                	or     edi,eax
  401ee5:	eb 23                	jmp    401f0a <print_exponential_number+0x2da>
  401ee7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  401eee:	00 00 
  401ef0:	45 85 d2             	test   r10d,r10d
  401ef3:	b8 01 00 00 00       	mov    eax,0x1
  401ef8:	bf 01 00 00 00       	mov    edi,0x1
  401efd:	41 0f 45 c2          	cmovne eax,r10d
  401f01:	85 c0                	test   eax,eax
  401f03:	0f 9f c0             	setg   al
  401f06:	31 f6                	xor    esi,esi
  401f08:	31 db                	xor    ebx,ebx
  401f0a:	41 83 ea 01          	sub    r10d,0x1
  401f0e:	44 89 d1             	mov    ecx,r10d
  401f11:	29 d9                	sub    ecx,ebx
  401f13:	84 c0                	test   al,al
  401f15:	44 0f 45 d1          	cmovne r10d,ecx
  401f19:	31 c9                	xor    ecx,ecx
  401f1b:	45 85 d2             	test   r10d,r10d
  401f1e:	44 0f 48 d1          	cmovs  r10d,ecx
  401f22:	41 81 cf 00 08 00 00 	or     r15d,0x800
  401f29:	40 84 ff             	test   dil,dil
  401f2c:	0f 85 c6 02 00 00    	jne    4021f8 <print_exponential_number+0x5c8>
  401f32:	44 89 d1             	mov    ecx,r10d
  401f35:	29 d9                	sub    ecx,ebx
  401f37:	40 84 f6             	test   sil,sil
  401f3a:	0f 84 28 02 00 00    	je     402168 <print_exponential_number+0x538>
  401f40:	66 0f 28 d0          	movapd xmm2,xmm0
  401f44:	f2 0f 59 d1          	mulsd  xmm2,xmm1
  401f48:	81 f9 32 01 00 00    	cmp    ecx,0x132
  401f4e:	0f 8f ac 03 00 00    	jg     402300 <print_exponential_number+0x6d0>
  401f54:	f2 48 0f 2c fa       	cvttsd2si rdi,xmm2
  401f59:	66 0f ef d2          	pxor   xmm2,xmm2
  401f5d:	66 0f 28 d9          	movapd xmm3,xmm1
  401f61:	44 89 d1             	mov    ecx,r10d
  401f64:	48 8d 35 15 23 00 00 	lea    rsi,[rip+0x2315]        # 404280 <powers_of_10>
  401f6b:	f2 48 0f 2a d7       	cvtsi2sd xmm2,rdi
  401f70:	f2 0f 5e d1          	divsd  xmm2,xmm1
  401f74:	f2 0f 5c c2          	subsd  xmm0,xmm2
  401f78:	f2 0f 10 14 ce       	movsd  xmm2,QWORD PTR [rsi+rcx*8]
  401f7d:	f2 0f 59 da          	mulsd  xmm3,xmm2
  401f81:	f2 0f 59 c3          	mulsd  xmm0,xmm3
  401f85:	f2 48 0f 2c c8       	cvttsd2si rcx,xmm0
  401f8a:	66 0f ef c9          	pxor   xmm1,xmm1
  401f8e:	31 f6                	xor    esi,esi
  401f90:	f2 48 0f 2a c9       	cvtsi2sd xmm1,rcx
  401f95:	f2 0f 5c c1          	subsd  xmm0,xmm1
  401f99:	66 0f 2f 05 7f 23 00 	comisd xmm0,QWORD PTR [rip+0x237f]        # 404320 <powers_of_10+0xa0>
  401fa0:	00 
  401fa1:	40 0f 93 c6          	setae  sil
  401fa5:	48 01 ce             	add    rsi,rcx
  401fa8:	66 0f 2e 05 70 23 00 	ucomisd xmm0,QWORD PTR [rip+0x2370]        # 404320 <powers_of_10+0xa0>
  401faf:	00 
  401fb0:	7a 06                	jp     401fb8 <print_exponential_number+0x388>
  401fb2:	75 04                	jne    401fb8 <print_exponential_number+0x388>
  401fb4:	48 83 e6 fe          	and    rsi,0xfffffffffffffffe
  401fb8:	66 0f ef c0          	pxor   xmm0,xmm0
  401fbc:	f2 48 0f 2a c6       	cvtsi2sd xmm0,rsi
  401fc1:	66 0f 2f c2          	comisd xmm0,xmm2
  401fc5:	72 06                	jb     401fcd <print_exponential_number+0x39d>
  401fc7:	48 83 c7 01          	add    rdi,0x1
  401fcb:	31 f6                	xor    esi,esi
  401fcd:	83 e2 01             	and    edx,0x1
  401fd0:	48 83 ff 09          	cmp    rdi,0x9
  401fd4:	7e 0a                	jle    401fe0 <print_exponential_number+0x3b0>
  401fd6:	83 c3 01             	add    ebx,0x1
  401fd9:	31 f6                	xor    esi,esi
  401fdb:	bf 01 00 00 00       	mov    edi,0x1
  401fe0:	45 89 fe             	mov    r14d,r15d
  401fe3:	8d 4b 63             	lea    ecx,[rbx+0x63]
  401fe6:	41 83 e6 02          	and    r14d,0x2
  401fea:	81 f9 c6 00 00 00    	cmp    ecx,0xc6
  401ff0:	77 4e                	ja     402040 <print_exponential_number+0x410>
  401ff2:	45 85 f6             	test   r14d,r14d
  401ff5:	0f 85 c5 02 00 00    	jne    4022c0 <print_exponential_number+0x690>
  401ffb:	41 be 04 00 00 00    	mov    r14d,0x4
  402001:	e9 68 02 00 00       	jmp    40226e <print_exponential_number+0x63e>
  402006:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40200d:	00 00 00 
  402010:	48 83 ec 08          	sub    rsp,0x8
  402014:	4c 89 e1             	mov    rcx,r12
  402017:	45 89 d0             	mov    r8d,r10d
  40201a:	41 51                	push   r9
  40201c:	45 31 c9             	xor    r9d,r9d
  40201f:	41 53                	push   r11
  402021:	41 57                	push   r15
  402023:	e8 18 f9 ff ff       	call   401940 <print_broken_up_decimal.isra.0>
  402028:	48 83 c4 20          	add    rsp,0x20
  40202c:	48 83 c4 38          	add    rsp,0x38
  402030:	5b                   	pop    rbx
  402031:	5d                   	pop    rbp
  402032:	41 5c                	pop    r12
  402034:	41 5d                	pop    r13
  402036:	41 5e                	pop    r14
  402038:	41 5f                	pop    r15
  40203a:	c3                   	ret    
  40203b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  402040:	45 85 f6             	test   r14d,r14d
  402043:	0f 84 1f 02 00 00    	je     402268 <print_exponential_number+0x638>
  402049:	b8 04 00 00 00       	mov    eax,0x4
  40204e:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  402052:	48 83 ec 08          	sub    rsp,0x8
  402056:	45 89 d0             	mov    r8d,r10d
  402059:	4c 89 e1             	mov    rcx,r12
  40205c:	41 51                	push   r9
  40205e:	45 31 c9             	xor    r9d,r9d
  402061:	45 8b 6c 24 18       	mov    r13d,DWORD PTR [r12+0x18]
  402066:	41 53                	push   r11
  402068:	41 57                	push   r15
  40206a:	e8 d1 f8 ff ff       	call   401940 <print_broken_up_decimal.isra.0>
  40206f:	8b 44 24 2c          	mov    eax,DWORD PTR [rsp+0x2c]
  402073:	48 83 c4 20          	add    rsp,0x20
  402077:	41 83 e7 20          	and    r15d,0x20
  40207b:	41 8b 4c 24 18       	mov    ecx,DWORD PTR [r12+0x18]
  402080:	41 83 ff 01          	cmp    r15d,0x1
  402084:	19 d2                	sbb    edx,edx
  402086:	8d 71 01             	lea    esi,[rcx+0x1]
  402089:	83 e2 20             	and    edx,0x20
  40208c:	41 89 74 24 18       	mov    DWORD PTR [r12+0x18],esi
  402091:	83 c2 45             	add    edx,0x45
  402094:	41 83 ff 01          	cmp    r15d,0x1
  402098:	19 ff                	sbb    edi,edi
  40209a:	83 e7 20             	and    edi,0x20
  40209d:	83 c7 45             	add    edi,0x45
  4020a0:	41 3b 4c 24 1c       	cmp    ecx,DWORD PTR [r12+0x1c]
  4020a5:	73 1d                	jae    4020c4 <print_exponential_number+0x494>
  4020a7:	4d 8b 04 24          	mov    r8,QWORD PTR [r12]
  4020ab:	4d 85 c0             	test   r8,r8
  4020ae:	0f 84 bc 02 00 00    	je     402370 <print_exponential_number+0x740>
  4020b4:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  4020b8:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  4020bd:	41 ff d0             	call   r8
  4020c0:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
  4020c4:	48 63 d3             	movsxd rdx,ebx
  4020c7:	41 89 da             	mov    r10d,ebx
  4020ca:	41 89 c1             	mov    r9d,eax
  4020cd:	b9 0a 00 00 00       	mov    ecx,0xa
  4020d2:	48 89 d6             	mov    rsi,rdx
  4020d5:	41 c1 ea 1f          	shr    r10d,0x1f
  4020d9:	4c 89 e7             	mov    rdi,r12
  4020dc:	48 f7 de             	neg    rsi
  4020df:	85 db                	test   ebx,ebx
  4020e1:	48 0f 4f f2          	cmovg  rsi,rdx
  4020e5:	48 83 ec 08          	sub    rsp,0x8
  4020e9:	44 89 d2             	mov    edx,r10d
  4020ec:	45 31 c0             	xor    r8d,r8d
  4020ef:	6a 05                	push   0x5
  4020f1:	e8 ea f4 ff ff       	call   4015e0 <print_integer>
  4020f6:	58                   	pop    rax
  4020f7:	5a                   	pop    rdx
  4020f8:	45 85 f6             	test   r14d,r14d
  4020fb:	0f 84 fb fb ff ff    	je     401cfc <print_exponential_number+0xcc>
  402101:	41 8b 44 24 18       	mov    eax,DWORD PTR [r12+0x18]
  402106:	89 c2                	mov    edx,eax
  402108:	44 29 ea             	sub    edx,r13d
  40210b:	39 d5                	cmp    ebp,edx
  40210d:	0f 86 e9 fb ff ff    	jbe    401cfc <print_exponential_number+0xcc>
  402113:	8d 48 01             	lea    ecx,[rax+0x1]
  402116:	83 c2 01             	add    edx,0x1
  402119:	41 89 4c 24 18       	mov    DWORD PTR [r12+0x18],ecx
  40211e:	41 39 44 24 1c       	cmp    DWORD PTR [r12+0x1c],eax
  402123:	0f 86 17 02 00 00    	jbe    402340 <print_exponential_number+0x710>
  402129:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
  40212d:	48 85 d2             	test   rdx,rdx
  402130:	0f 84 1a 02 00 00    	je     402350 <print_exponential_number+0x720>
  402136:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  40213b:	bf 20 00 00 00       	mov    edi,0x20
  402140:	ff d2                	call   rdx
  402142:	41 8b 44 24 18       	mov    eax,DWORD PTR [r12+0x18]
  402147:	89 c2                	mov    edx,eax
  402149:	44 29 ea             	sub    edx,r13d
  40214c:	eb bd                	jmp    40210b <print_exponential_number+0x4db>
  40214e:	66 90                	xchg   ax,ax
  402150:	85 c9                	test   ecx,ecx
  402152:	0f 85 28 02 00 00    	jne    402380 <print_exponential_number+0x750>
  402158:	41 8d 8a 34 01 00 00 	lea    ecx,[r10+0x134]
  40215f:	31 c0                	xor    eax,eax
  402161:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  402168:	66 0f 28 d0          	movapd xmm2,xmm0
  40216c:	f2 0f 5e d1          	divsd  xmm2,xmm1
  402170:	81 f9 32 01 00 00    	cmp    ecx,0x132
  402176:	0f 8f 84 01 00 00    	jg     402300 <print_exponential_number+0x6d0>
  40217c:	f2 48 0f 2c fa       	cvttsd2si rdi,xmm2
  402181:	66 0f ef d2          	pxor   xmm2,xmm2
  402185:	44 89 d1             	mov    ecx,r10d
  402188:	48 8d 35 f1 20 00 00 	lea    rsi,[rip+0x20f1]        # 404280 <powers_of_10>
  40218f:	f2 48 0f 2a d7       	cvtsi2sd xmm2,rdi
  402194:	f2 0f 59 d1          	mulsd  xmm2,xmm1
  402198:	f2 0f 5c c2          	subsd  xmm0,xmm2
  40219c:	f2 0f 10 14 ce       	movsd  xmm2,QWORD PTR [rsi+rcx*8]
  4021a1:	66 48 0f 7e c9       	movq   rcx,xmm1
  4021a6:	48 c1 e9 34          	shr    rcx,0x34
  4021aa:	81 e1 ff 07 00 00    	and    ecx,0x7ff
  4021b0:	81 e9 ff 03 00 00    	sub    ecx,0x3ff
  4021b6:	89 ce                	mov    esi,ecx
  4021b8:	f7 de                	neg    esi
  4021ba:	0f 48 f1             	cmovs  esi,ecx
  4021bd:	66 48 0f 7e d1       	movq   rcx,xmm2
  4021c2:	48 c1 e9 34          	shr    rcx,0x34
  4021c6:	81 e1 ff 07 00 00    	and    ecx,0x7ff
  4021cc:	81 e9 ff 03 00 00    	sub    ecx,0x3ff
  4021d2:	41 89 c8             	mov    r8d,ecx
  4021d5:	41 f7 d8             	neg    r8d
  4021d8:	41 0f 49 c8          	cmovns ecx,r8d
  4021dc:	39 ce                	cmp    esi,ecx
  4021de:	0f 8f 7c 01 00 00    	jg     402360 <print_exponential_number+0x730>
  4021e4:	66 0f 28 da          	movapd xmm3,xmm2
  4021e8:	f2 0f 5e d9          	divsd  xmm3,xmm1
  4021ec:	e9 90 fd ff ff       	jmp    401f81 <print_exponential_number+0x351>
  4021f1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4021f8:	48 85 d2             	test   rdx,rdx
  4021fb:	0f 84 98 fa ff ff    	je     401c99 <print_exponential_number+0x69>
  402201:	e9 8b fa ff ff       	jmp    401c91 <print_exponential_number+0x61>
  402206:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40220d:	00 00 00 
  402210:	f2 0f 5e ce          	divsd  xmm1,xmm6
  402214:	83 eb 01             	sub    ebx,0x1
  402217:	e9 77 fc ff ff       	jmp    401e93 <print_exponential_number+0x263>
  40221c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402220:	83 c3 01             	add    ebx,0x1
  402223:	66 0f ef c0          	pxor   xmm0,xmm0
  402227:	48 8d 05 52 20 00 00 	lea    rax,[rip+0x2052]        # 404280 <powers_of_10>
  40222e:	48 63 db             	movsxd rbx,ebx
  402231:	f2 48 0f 2a c7       	cvtsi2sd xmm0,rdi
  402236:	66 0f 2e 04 d8       	ucomisd xmm0,QWORD PTR [rax+rbx*8]
  40223b:	0f 8a 97 fa ff ff    	jp     401cd8 <print_exponential_number+0xa8>
  402241:	0f 85 91 fa ff ff    	jne    401cd8 <print_exponential_number+0xa8>
  402247:	41 83 ea 01          	sub    r10d,0x1
  40224b:	e9 88 fa ff ff       	jmp    401cd8 <print_exponential_number+0xa8>
  402250:	83 eb 01             	sub    ebx,0x1
  402253:	81 fb cc fe ff ff    	cmp    ebx,0xfffffecc
  402259:	0f 85 6b fb ff ff    	jne    401dca <print_exponential_number+0x19a>
  40225f:	eb 7f                	jmp    4022e0 <print_exponential_number+0x6b0>
  402261:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  402268:	41 be 05 00 00 00    	mov    r14d,0x5
  40226e:	89 e9                	mov    ecx,ebp
  402270:	45 31 c0             	xor    r8d,r8d
  402273:	88 44 24 0c          	mov    BYTE PTR [rsp+0xc],al
  402277:	45 8b 6c 24 18       	mov    r13d,DWORD PTR [r12+0x18]
  40227c:	44 29 f1             	sub    ecx,r14d
  40227f:	44 39 f5             	cmp    ebp,r14d
  402282:	41 0f 46 c8          	cmovbe ecx,r8d
  402286:	48 83 ec 08          	sub    rsp,0x8
  40228a:	45 89 d0             	mov    r8d,r10d
  40228d:	41 51                	push   r9
  40228f:	41 53                	push   r11
  402291:	41 89 c9             	mov    r9d,ecx
  402294:	4c 89 e1             	mov    rcx,r12
  402297:	41 57                	push   r15
  402299:	e8 a2 f6 ff ff       	call   401940 <print_broken_up_decimal.isra.0>
  40229e:	0f b6 44 24 2c       	movzx  eax,BYTE PTR [rsp+0x2c]
  4022a3:	48 83 c4 20          	add    rsp,0x20
  4022a7:	84 c0                	test   al,al
  4022a9:	0f 85 4d fa ff ff    	jne    401cfc <print_exponential_number+0xcc>
  4022af:	41 8d 46 ff          	lea    eax,[r14-0x1]
  4022b3:	45 31 f6             	xor    r14d,r14d
  4022b6:	e9 bc fd ff ff       	jmp    402077 <print_exponential_number+0x447>
  4022bb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4022c0:	b8 03 00 00 00       	mov    eax,0x3
  4022c5:	e9 84 fd ff ff       	jmp    40204e <print_exponential_number+0x41e>
  4022ca:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4022d0:	83 e8 01             	sub    eax,0x1
  4022d3:	66 0f ef e4          	pxor   xmm4,xmm4
  4022d7:	f2 0f 2a e0          	cvtsi2sd xmm4,eax
  4022db:	e9 28 fb ff ff       	jmp    401e08 <print_exponential_number+0x1d8>
  4022e0:	f2 0f 10 0d 48 20 00 	movsd  xmm1,QWORD PTR [rip+0x2048]        # 404330 <powers_of_10+0xb0>
  4022e7:	00 
  4022e8:	66 0f 2f c8          	comisd xmm1,xmm0
  4022ec:	0f 86 5e fe ff ff    	jbe    402150 <print_exponential_number+0x520>
  4022f2:	f2 0f 10 0d 2e 20 00 	movsd  xmm1,QWORD PTR [rip+0x202e]        # 404328 <powers_of_10+0xa8>
  4022f9:	00 
  4022fa:	e9 15 ff ff ff       	jmp    402214 <print_exponential_number+0x5e4>
  4022ff:	90                   	nop
  402300:	48 85 d2             	test   rdx,rdx
  402303:	74 08                	je     40230d <print_exponential_number+0x6dd>
  402305:	66 0f 57 15 03 20 00 	xorpd  xmm2,XMMWORD PTR [rip+0x2003]        # 404310 <powers_of_10+0x90>
  40230c:	00 
  40230d:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  402312:	44 89 d6             	mov    esi,r10d
  402315:	66 0f 28 c2          	movapd xmm0,xmm2
  402319:	88 44 24 0c          	mov    BYTE PTR [rsp+0xc],al
  40231d:	e8 7e f0 ff ff       	call   4013a0 <get_components>
  402322:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  402327:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  40232c:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  402331:	0f b6 44 24 0c       	movzx  eax,BYTE PTR [rsp+0xc]
  402336:	e9 95 fc ff ff       	jmp    401fd0 <print_exponential_number+0x3a0>
  40233b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  402340:	89 c8                	mov    eax,ecx
  402342:	e9 c4 fd ff ff       	jmp    40210b <print_exponential_number+0x4db>
  402347:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40234e:	00 00 
  402350:	49 8b 54 24 10       	mov    rdx,QWORD PTR [r12+0x10]
  402355:	c6 04 02 20          	mov    BYTE PTR [rdx+rax*1],0x20
  402359:	e9 a3 fd ff ff       	jmp    402101 <print_exponential_number+0x4d1>
  40235e:	66 90                	xchg   ax,ax
  402360:	f2 0f 5e ca          	divsd  xmm1,xmm2
  402364:	f2 0f 5e c1          	divsd  xmm0,xmm1
  402368:	e9 18 fc ff ff       	jmp    401f85 <print_exponential_number+0x355>
  40236d:	0f 1f 00             	nop    DWORD PTR [rax]
  402370:	49 8b 74 24 10       	mov    rsi,QWORD PTR [r12+0x10]
  402375:	88 14 0e             	mov    BYTE PTR [rsi+rcx*1],dl
  402378:	e9 47 fd ff ff       	jmp    4020c4 <print_exponential_number+0x494>
  40237d:	0f 1f 00             	nop    DWORD PTR [rax]
  402380:	31 ff                	xor    edi,edi
  402382:	31 f6                	xor    esi,esi
  402384:	e9 41 fb ff ff       	jmp    401eca <print_exponential_number+0x29a>
  402389:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  40238e:	44 89 d6             	mov    esi,r10d
  402391:	31 db                	xor    ebx,ebx
  402393:	e8 08 f0 ff ff       	call   4013a0 <get_components>
  402398:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  40239d:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  4023a2:	31 c0                	xor    eax,eax
  4023a4:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  4023a9:	e9 22 fc ff ff       	jmp    401fd0 <print_exponential_number+0x3a0>
  4023ae:	66 90                	xchg   ax,ax

00000000004023b0 <print_floating_point>:
  4023b0:	41 54                	push   r12
  4023b2:	41 89 d4             	mov    r12d,edx
  4023b5:	55                   	push   rbp
  4023b6:	48 89 fd             	mov    rbp,rdi
  4023b9:	48 83 ec 58          	sub    rsp,0x58
  4023bd:	66 0f 2e c0          	ucomisd xmm0,xmm0
  4023c1:	0f 8a 31 01 00 00    	jp     4024f8 <print_floating_point+0x148>
  4023c7:	f2 0f 10 0d d9 1f 00 	movsd  xmm1,QWORD PTR [rip+0x1fd9]        # 4043a8 <powers_of_10+0x128>
  4023ce:	00 
  4023cf:	66 0f 2f c8          	comisd xmm1,xmm0
  4023d3:	0f 87 87 01 00 00    	ja     402560 <print_floating_point+0x1b0>
  4023d9:	66 0f 2f 05 cf 1f 00 	comisd xmm0,QWORD PTR [rip+0x1fcf]        # 4043b0 <powers_of_10+0x130>
  4023e0:	00 
  4023e1:	0f 87 91 00 00 00    	ja     402478 <print_floating_point+0xc8>
  4023e7:	45 84 c0             	test   r8b,r8b
  4023ea:	0f 85 c0 00 00 00    	jne    4024b0 <print_floating_point+0x100>
  4023f0:	66 0f 2f 05 c0 1f 00 	comisd xmm0,QWORD PTR [rip+0x1fc0]        # 4043b8 <powers_of_10+0x138>
  4023f7:	00 
  4023f8:	0f 87 42 01 00 00    	ja     402540 <print_floating_point+0x190>
  4023fe:	f2 0f 10 0d ba 1f 00 	movsd  xmm1,QWORD PTR [rip+0x1fba]        # 4043c0 <powers_of_10+0x140>
  402405:	00 
  402406:	66 0f 2f c8          	comisd xmm1,xmm0
  40240a:	0f 87 30 01 00 00    	ja     402540 <print_floating_point+0x190>
  402410:	41 89 c9             	mov    r9d,ecx
  402413:	41 81 e1 00 08 00 00 	and    r9d,0x800
  40241a:	0f 85 60 01 00 00    	jne    402580 <print_floating_point+0x1d0>
  402420:	be 06 00 00 00       	mov    esi,0x6
  402425:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  40242a:	89 4c 24 0c          	mov    DWORD PTR [rsp+0xc],ecx
  40242e:	89 74 24 08          	mov    DWORD PTR [rsp+0x8],esi
  402432:	e8 69 ef ff ff       	call   4013a0 <get_components>
  402437:	48 83 ec 08          	sub    rsp,0x8
  40243b:	41 51                	push   r9
  40243d:	45 89 e1             	mov    r9d,r12d
  402440:	48 8d 44 24 40       	lea    rax,[rsp+0x40]
  402445:	50                   	push   rax
  402446:	8b 4c 24 24          	mov    ecx,DWORD PTR [rsp+0x24]
  40244a:	51                   	push   rcx
  40244b:	44 8b 44 24 28       	mov    r8d,DWORD PTR [rsp+0x28]
  402450:	48 89 e9             	mov    rcx,rbp
  402453:	0f b6 54 24 40       	movzx  edx,BYTE PTR [rsp+0x40]
  402458:	48 8b 74 24 38       	mov    rsi,QWORD PTR [rsp+0x38]
  40245d:	48 8b 7c 24 30       	mov    rdi,QWORD PTR [rsp+0x30]
  402462:	e8 d9 f4 ff ff       	call   401940 <print_broken_up_decimal.isra.0>
  402467:	48 83 c4 20          	add    rsp,0x20
  40246b:	48 83 c4 58          	add    rsp,0x58
  40246f:	5d                   	pop    rbp
  402470:	41 5c                	pop    r12
  402472:	c3                   	ret    
  402473:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  402478:	89 c8                	mov    eax,ecx
  40247a:	48 8d 35 00 1c 00 00 	lea    rsi,[rip+0x1c00]        # 404081 <kb_readc+0x743>
  402481:	41 89 c8             	mov    r8d,ecx
  402484:	48 89 ef             	mov    rdi,rbp
  402487:	83 e0 04             	and    eax,0x4
  40248a:	44 89 e1             	mov    ecx,r12d
  40248d:	83 f8 01             	cmp    eax,0x1
  402490:	19 d2                	sbb    edx,edx
  402492:	83 c2 04             	add    edx,0x4
  402495:	85 c0                	test   eax,eax
  402497:	48 8d 05 de 1b 00 00 	lea    rax,[rip+0x1bde]        # 40407c <kb_readc+0x73e>
  40249e:	48 0f 45 f0          	cmovne rsi,rax
  4024a2:	48 83 c4 58          	add    rsp,0x58
  4024a6:	5d                   	pop    rbp
  4024a7:	41 5c                	pop    r12
  4024a9:	e9 f2 ef ff ff       	jmp    4014a0 <out_rev_>
  4024ae:	66 90                	xchg   ax,ax
  4024b0:	41 89 c9             	mov    r9d,ecx
  4024b3:	41 81 e1 00 08 00 00 	and    r9d,0x800
  4024ba:	74 64                	je     402520 <print_floating_point+0x170>
  4024bc:	b8 01 00 00 00       	mov    eax,0x1
  4024c1:	45 31 c9             	xor    r9d,r9d
  4024c4:	83 fe 11             	cmp    esi,0x11
  4024c7:	76 5c                	jbe    402525 <print_floating_point+0x175>
  4024c9:	48 8d 54 24 2f       	lea    rdx,[rsp+0x2f]
  4024ce:	66 90                	xchg   ax,ax
  4024d0:	41 89 c1             	mov    r9d,eax
  4024d3:	c6 04 02 30          	mov    BYTE PTR [rdx+rax*1],0x30
  4024d7:	83 ee 01             	sub    esi,0x1
  4024da:	48 83 c0 01          	add    rax,0x1
  4024de:	41 83 f9 1f          	cmp    r9d,0x1f
  4024e2:	77 05                	ja     4024e9 <print_floating_point+0x139>
  4024e4:	83 fe 11             	cmp    esi,0x11
  4024e7:	77 e7                	ja     4024d0 <print_floating_point+0x120>
  4024e9:	45 84 c0             	test   r8b,r8b
  4024ec:	0f 84 33 ff ff ff    	je     402425 <print_floating_point+0x75>
  4024f2:	eb 31                	jmp    402525 <print_floating_point+0x175>
  4024f4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  4024f8:	48 83 c4 58          	add    rsp,0x58
  4024fc:	41 89 c8             	mov    r8d,ecx
  4024ff:	89 d1                	mov    ecx,edx
  402501:	48 89 ef             	mov    rdi,rbp
  402504:	ba 03 00 00 00       	mov    edx,0x3
  402509:	5d                   	pop    rbp
  40250a:	48 8d 35 74 1b 00 00 	lea    rsi,[rip+0x1b74]        # 404085 <kb_readc+0x747>
  402511:	41 5c                	pop    r12
  402513:	e9 88 ef ff ff       	jmp    4014a0 <out_rev_>
  402518:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40251f:	00 
  402520:	be 06 00 00 00       	mov    esi,0x6
  402525:	4c 8d 44 24 30       	lea    r8,[rsp+0x30]
  40252a:	44 89 e2             	mov    edx,r12d
  40252d:	48 89 ef             	mov    rdi,rbp
  402530:	e8 fb f6 ff ff       	call   401c30 <print_exponential_number>
  402535:	48 83 c4 58          	add    rsp,0x58
  402539:	5d                   	pop    rbp
  40253a:	41 5c                	pop    r12
  40253c:	c3                   	ret    
  40253d:	0f 1f 00             	nop    DWORD PTR [rax]
  402540:	45 31 c9             	xor    r9d,r9d
  402543:	4c 8d 44 24 30       	lea    r8,[rsp+0x30]
  402548:	44 89 e2             	mov    edx,r12d
  40254b:	48 89 ef             	mov    rdi,rbp
  40254e:	e8 dd f6 ff ff       	call   401c30 <print_exponential_number>
  402553:	e9 13 ff ff ff       	jmp    40246b <print_floating_point+0xbb>
  402558:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40255f:	00 
  402560:	48 83 c4 58          	add    rsp,0x58
  402564:	41 89 c8             	mov    r8d,ecx
  402567:	89 d1                	mov    ecx,edx
  402569:	48 89 ef             	mov    rdi,rbp
  40256c:	ba 04 00 00 00       	mov    edx,0x4
  402571:	5d                   	pop    rbp
  402572:	48 8d 35 10 1b 00 00 	lea    rsi,[rip+0x1b10]        # 404089 <kb_readc+0x74b>
  402579:	41 5c                	pop    r12
  40257b:	e9 20 ef ff ff       	jmp    4014a0 <out_rev_>
  402580:	b8 01 00 00 00       	mov    eax,0x1
  402585:	45 31 c9             	xor    r9d,r9d
  402588:	83 fe 11             	cmp    esi,0x11
  40258b:	0f 87 38 ff ff ff    	ja     4024c9 <print_floating_point+0x119>
  402591:	e9 8f fe ff ff       	jmp    402425 <print_floating_point+0x75>
  402596:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40259d:	00 00 00 

00000000004025a0 <format_string_loop.constprop.0>:
  4025a0:	41 57                	push   r15
  4025a2:	49 89 d7             	mov    r15,rdx
  4025a5:	41 56                	push   r14
  4025a7:	41 55                	push   r13
  4025a9:	41 54                	push   r12
  4025ab:	55                   	push   rbp
  4025ac:	53                   	push   rbx
  4025ad:	48 83 ec 38          	sub    rsp,0x38
  4025b1:	0f b6 16             	movzx  edx,BYTE PTR [rsi]
  4025b4:	84 d2                	test   dl,dl
  4025b6:	0f 84 5f 01 00 00    	je     40271b <format_string_loop.constprop.0+0x17b>
  4025bc:	49 89 fc             	mov    r12,rdi
  4025bf:	48 89 f3             	mov    rbx,rsi
  4025c2:	4c 8d 2d d3 1a 00 00 	lea    r13,[rip+0x1ad3]        # 40409c <kb_readc+0x75e>
  4025c9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4025d0:	4c 8d 73 01          	lea    r14,[rbx+0x1]
  4025d4:	80 fa 25             	cmp    dl,0x25
  4025d7:	0f 85 d3 05 00 00    	jne    402bb0 <format_string_loop.constprop.0+0x610>
  4025dd:	0f be 73 01          	movsx  esi,BYTE PTR [rbx+0x1]
  4025e1:	40 84 f6             	test   sil,sil
  4025e4:	0f 84 31 01 00 00    	je     40271b <format_string_loop.constprop.0+0x17b>
  4025ea:	31 c9                	xor    ecx,ecx
  4025ec:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  4025f0:	8d 46 e0             	lea    eax,[rsi-0x20]
  4025f3:	49 8d 5e 01          	lea    rbx,[r14+0x1]
  4025f7:	3c 10                	cmp    al,0x10
  4025f9:	77 15                	ja     402610 <format_string_loop.constprop.0+0x70>
  4025fb:	0f b6 c0             	movzx  eax,al
  4025fe:	49 63 44 85 00       	movsxd rax,DWORD PTR [r13+rax*4+0x0]
  402603:	4c 01 e8             	add    rax,r13
  402606:	3e ff e0             	notrack jmp rax
  402609:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  402610:	8d 56 d0             	lea    edx,[rsi-0x30]
  402613:	80 fa 09             	cmp    dl,0x9
  402616:	ba 00 00 00 00       	mov    edx,0x0
  40261b:	76 47                	jbe    402664 <format_string_loop.constprop.0+0xc4>
  40261d:	40 80 fe 2a          	cmp    sil,0x2a
  402621:	0f 84 e1 05 00 00    	je     402c08 <format_string_loop.constprop.0+0x668>
  402627:	45 31 d2             	xor    r10d,r10d
  40262a:	40 80 fe 2e          	cmp    sil,0x2e
  40262e:	74 51                	je     402681 <format_string_loop.constprop.0+0xe1>
  402630:	8d 7e 98             	lea    edi,[rsi-0x68]
  402633:	49 8d 5e 01          	lea    rbx,[r14+0x1]
  402637:	40 80 ff 12          	cmp    dil,0x12
  40263b:	0f 87 7f 00 00 00    	ja     4026c0 <format_string_loop.constprop.0+0x120>
  402641:	4c 8d 05 98 1a 00 00 	lea    r8,[rip+0x1a98]        # 4040e0 <kb_readc+0x7a2>
  402648:	40 0f b6 ff          	movzx  edi,dil
  40264c:	49 63 3c b8          	movsxd rdi,DWORD PTR [r8+rdi*4]
  402650:	4c 01 c7             	add    rdi,r8
  402653:	3e ff e7             	notrack jmp rdi
  402656:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40265d:	00 00 00 
  402660:	48 83 c3 01          	add    rbx,0x1
  402664:	8d 04 92             	lea    eax,[rdx+rdx*4]
  402667:	49 89 de             	mov    r14,rbx
  40266a:	8d 54 46 d0          	lea    edx,[rsi+rax*2-0x30]
  40266e:	0f be 33             	movsx  esi,BYTE PTR [rbx]
  402671:	8d 46 d0             	lea    eax,[rsi-0x30]
  402674:	3c 09                	cmp    al,0x9
  402676:	76 e8                	jbe    402660 <format_string_loop.constprop.0+0xc0>
  402678:	45 31 d2             	xor    r10d,r10d
  40267b:	40 80 fe 2e          	cmp    sil,0x2e
  40267f:	75 af                	jne    402630 <format_string_loop.constprop.0+0x90>
  402681:	41 0f be 76 01       	movsx  esi,BYTE PTR [r14+0x1]
  402686:	80 cd 08             	or     ch,0x8
  402689:	40 84 f6             	test   sil,sil
  40268c:	0f 84 89 00 00 00    	je     40271b <format_string_loop.constprop.0+0x17b>
  402692:	44 8d 46 d0          	lea    r8d,[rsi-0x30]
  402696:	49 8d 7e 01          	lea    rdi,[r14+0x1]
  40269a:	41 80 f8 09          	cmp    r8b,0x9
  40269e:	0f 86 44 05 00 00    	jbe    402be8 <format_string_loop.constprop.0+0x648>
  4026a4:	40 80 fe 2a          	cmp    sil,0x2a
  4026a8:	0f 84 b2 05 00 00    	je     402c60 <format_string_loop.constprop.0+0x6c0>
  4026ae:	49 89 fe             	mov    r14,rdi
  4026b1:	8d 7e 98             	lea    edi,[rsi-0x68]
  4026b4:	49 8d 5e 01          	lea    rbx,[r14+0x1]
  4026b8:	40 80 ff 12          	cmp    dil,0x12
  4026bc:	76 83                	jbe    402641 <format_string_loop.constprop.0+0xa1>
  4026be:	66 90                	xchg   ax,ax
  4026c0:	8d 7e db             	lea    edi,[rsi-0x25]
  4026c3:	40 80 ff 53          	cmp    dil,0x53
  4026c7:	77 17                	ja     4026e0 <format_string_loop.constprop.0+0x140>
  4026c9:	48 8d 05 5c 1a 00 00 	lea    rax,[rip+0x1a5c]        # 40412c <kb_readc+0x7ee>
  4026d0:	40 0f b6 ff          	movzx  edi,dil
  4026d4:	48 63 3c b8          	movsxd rdi,DWORD PTR [rax+rdi*4]
  4026d8:	48 01 c7             	add    rdi,rax
  4026db:	3e ff e7             	notrack jmp rdi
  4026de:	66 90                	xchg   ax,ax
  4026e0:	41 8b 54 24 18       	mov    edx,DWORD PTR [r12+0x18]
  4026e5:	8d 4a 01             	lea    ecx,[rdx+0x1]
  4026e8:	41 89 4c 24 18       	mov    DWORD PTR [r12+0x18],ecx
  4026ed:	41 3b 54 24 1c       	cmp    edx,DWORD PTR [r12+0x1c]
  4026f2:	73 1c                	jae    402710 <format_string_loop.constprop.0+0x170>
  4026f4:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  4026f8:	48 85 c9             	test   rcx,rcx
  4026fb:	0f 84 cf 09 00 00    	je     4030d0 <format_string_loop.constprop.0+0xb30>
  402701:	4d 8b 44 24 08       	mov    r8,QWORD PTR [r12+0x8]
  402706:	40 0f be fe          	movsx  edi,sil
  40270a:	4c 89 c6             	mov    rsi,r8
  40270d:	ff d1                	call   rcx
  40270f:	90                   	nop
  402710:	0f b6 13             	movzx  edx,BYTE PTR [rbx]
  402713:	84 d2                	test   dl,dl
  402715:	0f 85 b5 fe ff ff    	jne    4025d0 <format_string_loop.constprop.0+0x30>
  40271b:	48 83 c4 38          	add    rsp,0x38
  40271f:	5b                   	pop    rbx
  402720:	5d                   	pop    rbp
  402721:	41 5c                	pop    r12
  402723:	41 5d                	pop    r13
  402725:	41 5e                	pop    r14
  402727:	41 5f                	pop    r15
  402729:	c3                   	ret    
  40272a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  402730:	83 c9 02             	or     ecx,0x2
  402733:	0f be 33             	movsx  esi,BYTE PTR [rbx]
  402736:	49 89 de             	mov    r14,rbx
  402739:	e9 b2 fe ff ff       	jmp    4025f0 <format_string_loop.constprop.0+0x50>
  40273e:	66 90                	xchg   ax,ax
  402740:	83 c9 04             	or     ecx,0x4
  402743:	eb ee                	jmp    402733 <format_string_loop.constprop.0+0x193>
  402745:	0f 1f 00             	nop    DWORD PTR [rax]
  402748:	83 c9 10             	or     ecx,0x10
  40274b:	eb e6                	jmp    402733 <format_string_loop.constprop.0+0x193>
  40274d:	0f 1f 00             	nop    DWORD PTR [rax]
  402750:	83 c9 08             	or     ecx,0x8
  402753:	eb de                	jmp    402733 <format_string_loop.constprop.0+0x193>
  402755:	0f 1f 00             	nop    DWORD PTR [rax]
  402758:	83 c9 01             	or     ecx,0x1
  40275b:	eb d6                	jmp    402733 <format_string_loop.constprop.0+0x193>
  40275d:	0f 1f 00             	nop    DWORD PTR [rax]
  402760:	41 0f b6 76 01       	movzx  esi,BYTE PTR [r14+0x1]
  402765:	80 cd 02             	or     ch,0x2
  402768:	40 84 f6             	test   sil,sil
  40276b:	74 ae                	je     40271b <format_string_loop.constprop.0+0x17b>
  40276d:	48 83 c3 01          	add    rbx,0x1
  402771:	e9 4a ff ff ff       	jmp    4026c0 <format_string_loop.constprop.0+0x120>
  402776:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40277d:	00 00 00 
  402780:	40 80 fe 64          	cmp    sil,0x64
  402784:	0f 84 2a 06 00 00    	je     402db4 <format_string_loop.constprop.0+0x814>
  40278a:	40 80 fe 69          	cmp    sil,0x69
  40278e:	0f 84 20 06 00 00    	je     402db4 <format_string_loop.constprop.0+0x814>
  402794:	89 f7                	mov    edi,esi
  402796:	83 e7 df             	and    edi,0xffffffdf
  402799:	40 80 ff 58          	cmp    dil,0x58
  40279d:	0f 84 f6 05 00 00    	je     402d99 <format_string_loop.constprop.0+0x7f9>
  4027a3:	41 bb 08 00 00 00    	mov    r11d,0x8
  4027a9:	40 80 fe 6f          	cmp    sil,0x6f
  4027ad:	74 15                	je     4027c4 <format_string_loop.constprop.0+0x224>
  4027af:	41 bb 02 00 00 00    	mov    r11d,0x2
  4027b5:	40 80 fe 62          	cmp    sil,0x62
  4027b9:	74 09                	je     4027c4 <format_string_loop.constprop.0+0x224>
  4027bb:	83 e1 ef             	and    ecx,0xffffffef
  4027be:	41 bb 0a 00 00 00    	mov    r11d,0xa
  4027c4:	89 ce                	mov    esi,ecx
  4027c6:	83 e6 fe             	and    esi,0xfffffffe
  4027c9:	f6 c5 08             	test   ch,0x8
  4027cc:	0f 45 ce             	cmovne ecx,esi
  4027cf:	41 8b 37             	mov    esi,DWORD PTR [r15]
  4027d2:	89 cf                	mov    edi,ecx
  4027d4:	81 e7 00 04 00 00    	and    edi,0x400
  4027da:	f6 c5 40             	test   ch,0x40
  4027dd:	0f 84 5d 05 00 00    	je     402d40 <format_string_loop.constprop.0+0x7a0>
  4027e3:	85 ff                	test   edi,edi
  4027e5:	0f 85 3e 07 00 00    	jne    402f29 <format_string_loop.constprop.0+0x989>
  4027eb:	f6 c5 02             	test   ch,0x2
  4027ee:	0f 85 35 07 00 00    	jne    402f29 <format_string_loop.constprop.0+0x989>
  4027f4:	f6 c1 40             	test   cl,0x40
  4027f7:	0f 84 e8 09 00 00    	je     4031e5 <format_string_loop.constprop.0+0xc45>
  4027fd:	83 fe 2f             	cmp    esi,0x2f
  402800:	0f 87 3b 0a 00 00    	ja     403241 <format_string_loop.constprop.0+0xca1>
  402806:	89 f7                	mov    edi,esi
  402808:	83 c6 08             	add    esi,0x8
  40280b:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  40280f:	41 89 37             	mov    DWORD PTR [r15],esi
  402812:	0f be 3f             	movsx  edi,BYTE PTR [rdi]
  402815:	4c 63 c7             	movsxd r8,edi
  402818:	41 89 fe             	mov    r14d,edi
  40281b:	41 89 d1             	mov    r9d,edx
  40281e:	4c 89 c6             	mov    rsi,r8
  402821:	41 c1 ee 1f          	shr    r14d,0x1f
  402825:	48 f7 de             	neg    rsi
  402828:	85 ff                	test   edi,edi
  40282a:	44 89 f2             	mov    edx,r14d
  40282d:	4c 89 e7             	mov    rdi,r12
  402830:	49 0f 4f f0          	cmovg  rsi,r8
  402834:	48 83 ec 08          	sub    rsp,0x8
  402838:	45 89 d0             	mov    r8d,r10d
  40283b:	51                   	push   rcx
  40283c:	44 89 d9             	mov    ecx,r11d
  40283f:	e8 9c ed ff ff       	call   4015e0 <print_integer>
  402844:	41 5a                	pop    r10
  402846:	41 5b                	pop    r11
  402848:	e9 c3 fe ff ff       	jmp    402710 <format_string_loop.constprop.0+0x170>
  40284d:	41 0f b6 76 01       	movzx  esi,BYTE PTR [r14+0x1]
  402852:	40 84 f6             	test   sil,sil
  402855:	0f 84 c0 fe ff ff    	je     40271b <format_string_loop.constprop.0+0x17b>
  40285b:	40 80 fe 68          	cmp    sil,0x68
  40285f:	0f 84 3b 04 00 00    	je     402ca0 <format_string_loop.constprop.0+0x700>
  402865:	80 c9 80             	or     cl,0x80
  402868:	48 83 c3 01          	add    rbx,0x1
  40286c:	e9 4f fe ff ff       	jmp    4026c0 <format_string_loop.constprop.0+0x120>
  402871:	41 0f b6 76 01       	movzx  esi,BYTE PTR [r14+0x1]
  402876:	40 84 f6             	test   sil,sil
  402879:	0f 84 9c fe ff ff    	je     40271b <format_string_loop.constprop.0+0x17b>
  40287f:	40 80 fe 6c          	cmp    sil,0x6c
  402883:	0f 84 31 04 00 00    	je     402cba <format_string_loop.constprop.0+0x71a>
  402889:	80 cd 02             	or     ch,0x2
  40288c:	48 83 c3 01          	add    rbx,0x1
  402890:	e9 2b fe ff ff       	jmp    4026c0 <format_string_loop.constprop.0+0x120>
  402895:	41 89 f0             	mov    r8d,esi
  402898:	89 cf                	mov    edi,ecx
  40289a:	41 83 e0 df          	and    r8d,0xffffffdf
  40289e:	81 cf 00 10 00 00    	or     edi,0x1000
  4028a4:	41 80 f8 47          	cmp    r8b,0x47
  4028a8:	0f 44 cf             	cmove  ecx,edi
  4028ab:	83 e6 fd             	and    esi,0xfffffffd
  4028ae:	89 cf                	mov    edi,ecx
  4028b0:	83 cf 20             	or     edi,0x20
  4028b3:	40 80 fe 45          	cmp    sil,0x45
  4028b7:	41 8b 77 04          	mov    esi,DWORD PTR [r15+0x4]
  4028bb:	0f 44 cf             	cmove  ecx,edi
  4028be:	81 fe af 00 00 00    	cmp    esi,0xaf
  4028c4:	0f 87 06 04 00 00    	ja     402cd0 <format_string_loop.constprop.0+0x730>
  4028ca:	89 f7                	mov    edi,esi
  4028cc:	83 c6 10             	add    esi,0x10
  4028cf:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  4028d3:	41 89 77 04          	mov    DWORD PTR [r15+0x4],esi
  4028d7:	f2 0f 10 07          	movsd  xmm0,QWORD PTR [rdi]
  4028db:	41 b8 01 00 00 00    	mov    r8d,0x1
  4028e1:	44 89 d6             	mov    esi,r10d
  4028e4:	4c 89 e7             	mov    rdi,r12
  4028e7:	e8 c4 fa ff ff       	call   4023b0 <print_floating_point>
  4028ec:	e9 1f fe ff ff       	jmp    402710 <format_string_loop.constprop.0+0x170>
  4028f1:	89 cf                	mov    edi,ecx
  4028f3:	83 cf 20             	or     edi,0x20
  4028f6:	40 80 fe 46          	cmp    sil,0x46
  4028fa:	41 8b 77 04          	mov    esi,DWORD PTR [r15+0x4]
  4028fe:	0f 44 cf             	cmove  ecx,edi
  402901:	81 fe af 00 00 00    	cmp    esi,0xaf
  402907:	0f 87 af 04 00 00    	ja     402dbc <format_string_loop.constprop.0+0x81c>
  40290d:	89 f7                	mov    edi,esi
  40290f:	83 c6 10             	add    esi,0x10
  402912:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  402916:	41 89 77 04          	mov    DWORD PTR [r15+0x4],esi
  40291a:	f2 0f 10 07          	movsd  xmm0,QWORD PTR [rdi]
  40291e:	45 31 c0             	xor    r8d,r8d
  402921:	44 89 d6             	mov    esi,r10d
  402924:	4c 89 e7             	mov    rdi,r12
  402927:	e8 84 fa ff ff       	call   4023b0 <print_floating_point>
  40292c:	e9 df fd ff ff       	jmp    402710 <format_string_loop.constprop.0+0x170>
  402931:	41 8b 37             	mov    esi,DWORD PTR [r15]
  402934:	83 fe 2f             	cmp    esi,0x2f
  402937:	0f 87 a4 03 00 00    	ja     402ce1 <format_string_loop.constprop.0+0x741>
  40293d:	89 f7                	mov    edi,esi
  40293f:	83 c6 08             	add    esi,0x8
  402942:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  402946:	41 89 37             	mov    DWORD PTR [r15],esi
  402949:	48 8b 2f             	mov    rbp,QWORD PTR [rdi]
  40294c:	48 85 ed             	test   rbp,rbp
  40294f:	0f 84 a4 03 00 00    	je     402cf9 <format_string_loop.constprop.0+0x759>
  402955:	44 0f b6 4d 00       	movzx  r9d,BYTE PTR [rbp+0x0]
  40295a:	44 89 ce             	mov    esi,r9d
  40295d:	45 85 d2             	test   r10d,r10d
  402960:	0f 85 35 05 00 00    	jne    402e9b <format_string_loop.constprop.0+0x8fb>
  402966:	bf fe ff ff 7f       	mov    edi,0x7ffffffe
  40296b:	45 84 c9             	test   r9b,r9b
  40296e:	0f 84 82 09 00 00    	je     4032f6 <format_string_loop.constprop.0+0xd56>
  402974:	83 c7 01             	add    edi,0x1
  402977:	49 89 ee             	mov    r14,rbp
  40297a:	48 01 ef             	add    rdi,rbp
  40297d:	eb 06                	jmp    402985 <format_string_loop.constprop.0+0x3e5>
  40297f:	90                   	nop
  402980:	49 39 fe             	cmp    r14,rdi
  402983:	74 0a                	je     40298f <format_string_loop.constprop.0+0x3ef>
  402985:	49 83 c6 01          	add    r14,0x1
  402989:	41 80 3e 00          	cmp    BYTE PTR [r14],0x0
  40298d:	75 f1                	jne    402980 <format_string_loop.constprop.0+0x3e0>
  40298f:	44 89 f0             	mov    eax,r14d
  402992:	29 e8                	sub    eax,ebp
  402994:	89 44 24 10          	mov    DWORD PTR [rsp+0x10],eax
  402998:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  40299c:	41 89 ce             	mov    r14d,ecx
  40299f:	44 39 d0             	cmp    eax,r10d
  4029a2:	89 c7                	mov    edi,eax
  4029a4:	41 0f 47 fa          	cmova  edi,r10d
  4029a8:	41 81 e6 00 08 00 00 	and    r14d,0x800
  4029af:	0f 44 f8             	cmove  edi,eax
  4029b2:	83 e1 02             	and    ecx,0x2
  4029b5:	89 4c 24 1c          	mov    DWORD PTR [rsp+0x1c],ecx
  4029b9:	89 7c 24 10          	mov    DWORD PTR [rsp+0x10],edi
  4029bd:	0f 84 1b 07 00 00    	je     4030de <format_string_loop.constprop.0+0xb3e>
  4029c3:	45 84 c9             	test   r9b,r9b
  4029c6:	0f 84 92 00 00 00    	je     402a5e <format_string_loop.constprop.0+0x4be>
  4029cc:	45 85 f6             	test   r14d,r14d
  4029cf:	0f 94 44 24 08       	sete   BYTE PTR [rsp+0x8]
  4029d4:	0f b6 44 24 08       	movzx  eax,BYTE PTR [rsp+0x8]
  4029d9:	45 85 d2             	test   r10d,r10d
  4029dc:	75 04                	jne    4029e2 <format_string_loop.constprop.0+0x442>
  4029de:	84 c0                	test   al,al
  4029e0:	74 7c                	je     402a5e <format_string_loop.constprop.0+0x4be>
  4029e2:	4c 89 7c 24 20       	mov    QWORD PTR [rsp+0x20],r15
  4029e7:	49 89 ee             	mov    r14,rbp
  4029ea:	41 89 d7             	mov    r15d,edx
  4029ed:	48 89 5c 24 28       	mov    QWORD PTR [rsp+0x28],rbx
  4029f2:	44 89 d3             	mov    ebx,r10d
  4029f5:	0f 1f 00             	nop    DWORD PTR [rax]
  4029f8:	41 8b 44 24 18       	mov    eax,DWORD PTR [r12+0x18]
  4029fd:	49 83 c6 01          	add    r14,0x1
  402a01:	8d 78 01             	lea    edi,[rax+0x1]
  402a04:	41 89 7c 24 18       	mov    DWORD PTR [r12+0x18],edi
  402a09:	41 3b 44 24 1c       	cmp    eax,DWORD PTR [r12+0x1c]
  402a0e:	73 1c                	jae    402a2c <format_string_loop.constprop.0+0x48c>
  402a10:	4d 8b 04 24          	mov    r8,QWORD PTR [r12]
  402a14:	4d 85 c0             	test   r8,r8
  402a17:	0f 84 c3 05 00 00    	je     402fe0 <format_string_loop.constprop.0+0xa40>
  402a1d:	4d 8b 4c 24 08       	mov    r9,QWORD PTR [r12+0x8]
  402a22:	40 0f be fe          	movsx  edi,sil
  402a26:	4c 89 ce             	mov    rsi,r9
  402a29:	41 ff d0             	call   r8
  402a2c:	41 0f b6 36          	movzx  esi,BYTE PTR [r14]
  402a30:	40 84 f6             	test   sil,sil
  402a33:	74 10                	je     402a45 <format_string_loop.constprop.0+0x4a5>
  402a35:	89 d8                	mov    eax,ebx
  402a37:	44 29 f0             	sub    eax,r14d
  402a3a:	01 e8                	add    eax,ebp
  402a3c:	75 ba                	jne    4029f8 <format_string_loop.constprop.0+0x458>
  402a3e:	80 7c 24 08 00       	cmp    BYTE PTR [rsp+0x8],0x0
  402a43:	75 b3                	jne    4029f8 <format_string_loop.constprop.0+0x458>
  402a45:	8b 4c 24 1c          	mov    ecx,DWORD PTR [rsp+0x1c]
  402a49:	44 89 fa             	mov    edx,r15d
  402a4c:	48 8b 5c 24 28       	mov    rbx,QWORD PTR [rsp+0x28]
  402a51:	4c 8b 7c 24 20       	mov    r15,QWORD PTR [rsp+0x20]
  402a56:	85 c9                	test   ecx,ecx
  402a58:	0f 84 b2 fc ff ff    	je     402710 <format_string_loop.constprop.0+0x170>
  402a5e:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  402a62:	41 89 d6             	mov    r14d,edx
  402a65:	8d 68 01             	lea    ebp,[rax+0x1]
  402a68:	39 c2                	cmp    edx,eax
  402a6a:	0f 87 22 05 00 00    	ja     402f92 <format_string_loop.constprop.0+0x9f2>
  402a70:	e9 9b fc ff ff       	jmp    402710 <format_string_loop.constprop.0+0x170>
  402a75:	0f 1f 00             	nop    DWORD PTR [rax]
  402a78:	41 8b 54 24 18       	mov    edx,DWORD PTR [r12+0x18]
  402a7d:	8d 4a 01             	lea    ecx,[rdx+0x1]
  402a80:	41 89 4c 24 18       	mov    DWORD PTR [r12+0x18],ecx
  402a85:	41 3b 54 24 1c       	cmp    edx,DWORD PTR [r12+0x1c]
  402a8a:	0f 83 80 fc ff ff    	jae    402710 <format_string_loop.constprop.0+0x170>
  402a90:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  402a94:	48 85 c9             	test   rcx,rcx
  402a97:	0f 84 25 06 00 00    	je     4030c2 <format_string_loop.constprop.0+0xb22>
  402a9d:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  402aa2:	bf 25 00 00 00       	mov    edi,0x25
  402aa7:	ff d1                	call   rcx
  402aa9:	e9 62 fc ff ff       	jmp    402710 <format_string_loop.constprop.0+0x170>
  402aae:	41 8b 74 24 18       	mov    esi,DWORD PTR [r12+0x18]
  402ab3:	41 8b 17             	mov    edx,DWORD PTR [r15]
  402ab6:	f6 c1 40             	test   cl,0x40
  402ab9:	0f 84 58 02 00 00    	je     402d17 <format_string_loop.constprop.0+0x777>
  402abf:	83 fa 2f             	cmp    edx,0x2f
  402ac2:	0f 86 e5 03 00 00    	jbe    402ead <format_string_loop.constprop.0+0x90d>
  402ac8:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  402acc:	48 8d 51 08          	lea    rdx,[rcx+0x8]
  402ad0:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  402ad4:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  402ad7:	40 88 32             	mov    BYTE PTR [rdx],sil
  402ada:	e9 31 fc ff ff       	jmp    402710 <format_string_loop.constprop.0+0x170>
  402adf:	83 e1 02             	and    ecx,0x2
  402ae2:	41 8b 74 24 18       	mov    esi,DWORD PTR [r12+0x18]
  402ae7:	41 8b 7c 24 1c       	mov    edi,DWORD PTR [r12+0x1c]
  402aec:	89 cd                	mov    ebp,ecx
  402aee:	0f 84 fa 04 00 00    	je     402fee <format_string_loop.constprop.0+0xa4e>
  402af4:	41 8b 0f             	mov    ecx,DWORD PTR [r15]
  402af7:	83 f9 2f             	cmp    ecx,0x2f
  402afa:	0f 87 06 03 00 00    	ja     402e06 <format_string_loop.constprop.0+0x866>
  402b00:	41 89 c8             	mov    r8d,ecx
  402b03:	83 c1 08             	add    ecx,0x8
  402b06:	4d 03 47 10          	add    r8,QWORD PTR [r15+0x10]
  402b0a:	41 89 0f             	mov    DWORD PTR [r15],ecx
  402b0d:	41 8b 08             	mov    ecx,DWORD PTR [r8]
  402b10:	44 8d 46 01          	lea    r8d,[rsi+0x1]
  402b14:	45 89 44 24 18       	mov    DWORD PTR [r12+0x18],r8d
  402b19:	39 fe                	cmp    esi,edi
  402b1b:	0f 83 05 03 00 00    	jae    402e26 <format_string_loop.constprop.0+0x886>
  402b21:	41 89 c8             	mov    r8d,ecx
  402b24:	0f be f9             	movsx  edi,cl
  402b27:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  402b2b:	c7 44 24 08 01 00 00 	mov    DWORD PTR [rsp+0x8],0x1
  402b32:	00 
  402b33:	48 85 c9             	test   rcx,rcx
  402b36:	0f 84 60 05 00 00    	je     40309c <format_string_loop.constprop.0+0xafc>
  402b3c:	89 54 24 10          	mov    DWORD PTR [rsp+0x10],edx
  402b40:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  402b45:	ff d1                	call   rcx
  402b47:	8b 54 24 10          	mov    edx,DWORD PTR [rsp+0x10]
  402b4b:	85 ed                	test   ebp,ebp
  402b4d:	0f 84 bd fb ff ff    	je     402710 <format_string_loop.constprop.0+0x170>
  402b53:	8b 44 24 08          	mov    eax,DWORD PTR [rsp+0x8]
  402b57:	8d 68 01             	lea    ebp,[rax+0x1]
  402b5a:	e9 d4 02 00 00       	jmp    402e33 <format_string_loop.constprop.0+0x893>
  402b5f:	90                   	nop
  402b60:	41 8b 17             	mov    edx,DWORD PTR [r15]
  402b63:	81 c9 01 20 00 00    	or     ecx,0x2001
  402b69:	83 fa 2f             	cmp    edx,0x2f
  402b6c:	0f 87 5b 02 00 00    	ja     402dcd <format_string_loop.constprop.0+0x82d>
  402b72:	89 d6                	mov    esi,edx
  402b74:	83 c2 08             	add    edx,0x8
  402b77:	49 03 77 10          	add    rsi,QWORD PTR [r15+0x10]
  402b7b:	41 89 17             	mov    DWORD PTR [r15],edx
  402b7e:	48 8b 36             	mov    rsi,QWORD PTR [rsi]
  402b81:	48 85 f6             	test   rsi,rsi
  402b84:	0f 84 5b 02 00 00    	je     402de5 <format_string_loop.constprop.0+0x845>
  402b8a:	48 83 ec 08          	sub    rsp,0x8
  402b8e:	31 d2                	xor    edx,edx
  402b90:	41 b9 12 00 00 00    	mov    r9d,0x12
  402b96:	45 89 d0             	mov    r8d,r10d
  402b99:	51                   	push   rcx
  402b9a:	4c 89 e7             	mov    rdi,r12
  402b9d:	b9 10 00 00 00       	mov    ecx,0x10
  402ba2:	e8 39 ea ff ff       	call   4015e0 <print_integer>
  402ba7:	58                   	pop    rax
  402ba8:	5a                   	pop    rdx
  402ba9:	e9 62 fb ff ff       	jmp    402710 <format_string_loop.constprop.0+0x170>
  402bae:	66 90                	xchg   ax,ax
  402bb0:	41 8b 4c 24 18       	mov    ecx,DWORD PTR [r12+0x18]
  402bb5:	8d 71 01             	lea    esi,[rcx+0x1]
  402bb8:	41 89 74 24 18       	mov    DWORD PTR [r12+0x18],esi
  402bbd:	41 3b 4c 24 1c       	cmp    ecx,DWORD PTR [r12+0x1c]
  402bc2:	73 18                	jae    402bdc <format_string_loop.constprop.0+0x63c>
  402bc4:	4d 8b 04 24          	mov    r8,QWORD PTR [r12]
  402bc8:	4d 85 c0             	test   r8,r8
  402bcb:	0f 84 7f 00 00 00    	je     402c50 <format_string_loop.constprop.0+0x6b0>
  402bd1:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  402bd6:	0f be fa             	movsx  edi,dl
  402bd9:	41 ff d0             	call   r8
  402bdc:	4c 89 f3             	mov    rbx,r14
  402bdf:	e9 2c fb ff ff       	jmp    402710 <format_string_loop.constprop.0+0x170>
  402be4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402be8:	43 8d 04 92          	lea    eax,[r10+r10*4]
  402bec:	48 83 c7 01          	add    rdi,0x1
  402bf0:	44 8d 54 46 d0       	lea    r10d,[rsi+rax*2-0x30]
  402bf5:	0f be 37             	movsx  esi,BYTE PTR [rdi]
  402bf8:	8d 46 d0             	lea    eax,[rsi-0x30]
  402bfb:	3c 09                	cmp    al,0x9
  402bfd:	76 e9                	jbe    402be8 <format_string_loop.constprop.0+0x648>
  402bff:	e9 aa fa ff ff       	jmp    4026ae <format_string_loop.constprop.0+0x10e>
  402c04:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402c08:	41 8b 17             	mov    edx,DWORD PTR [r15]
  402c0b:	83 fa 2f             	cmp    edx,0x2f
  402c0e:	77 30                	ja     402c40 <format_string_loop.constprop.0+0x6a0>
  402c10:	89 d6                	mov    esi,edx
  402c12:	83 c2 08             	add    edx,0x8
  402c15:	49 03 77 10          	add    rsi,QWORD PTR [r15+0x10]
  402c19:	41 89 17             	mov    DWORD PTR [r15],edx
  402c1c:	8b 16                	mov    edx,DWORD PTR [rsi]
  402c1e:	85 d2                	test   edx,edx
  402c20:	79 05                	jns    402c27 <format_string_loop.constprop.0+0x687>
  402c22:	83 c9 02             	or     ecx,0x2
  402c25:	f7 da                	neg    edx
  402c27:	41 0f b6 76 01       	movzx  esi,BYTE PTR [r14+0x1]
  402c2c:	40 84 f6             	test   sil,sil
  402c2f:	0f 84 e6 fa ff ff    	je     40271b <format_string_loop.constprop.0+0x17b>
  402c35:	49 89 de             	mov    r14,rbx
  402c38:	e9 ea f9 ff ff       	jmp    402627 <format_string_loop.constprop.0+0x87>
  402c3d:	0f 1f 00             	nop    DWORD PTR [rax]
  402c40:	49 8b 77 08          	mov    rsi,QWORD PTR [r15+0x8]
  402c44:	48 8d 56 08          	lea    rdx,[rsi+0x8]
  402c48:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  402c4c:	eb ce                	jmp    402c1c <format_string_loop.constprop.0+0x67c>
  402c4e:	66 90                	xchg   ax,ax
  402c50:	49 8b 74 24 10       	mov    rsi,QWORD PTR [r12+0x10]
  402c55:	88 14 0e             	mov    BYTE PTR [rsi+rcx*1],dl
  402c58:	e9 7f ff ff ff       	jmp    402bdc <format_string_loop.constprop.0+0x63c>
  402c5d:	0f 1f 00             	nop    DWORD PTR [rax]
  402c60:	41 8b 37             	mov    esi,DWORD PTR [r15]
  402c63:	83 fe 2f             	cmp    esi,0x2f
  402c66:	0f 87 1e 02 00 00    	ja     402e8a <format_string_loop.constprop.0+0x8ea>
  402c6c:	89 f7                	mov    edi,esi
  402c6e:	83 c6 08             	add    esi,0x8
  402c71:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  402c75:	41 89 37             	mov    DWORD PTR [r15],esi
  402c78:	44 8b 17             	mov    r10d,DWORD PTR [rdi]
  402c7b:	31 f6                	xor    esi,esi
  402c7d:	49 8d 7e 02          	lea    rdi,[r14+0x2]
  402c81:	45 85 d2             	test   r10d,r10d
  402c84:	44 0f 48 d6          	cmovs  r10d,esi
  402c88:	41 0f b6 76 02       	movzx  esi,BYTE PTR [r14+0x2]
  402c8d:	40 84 f6             	test   sil,sil
  402c90:	0f 85 18 fa ff ff    	jne    4026ae <format_string_loop.constprop.0+0x10e>
  402c96:	e9 80 fa ff ff       	jmp    40271b <format_string_loop.constprop.0+0x17b>
  402c9b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  402ca0:	41 0f b6 76 02       	movzx  esi,BYTE PTR [r14+0x2]
  402ca5:	80 c9 c0             	or     cl,0xc0
  402ca8:	40 84 f6             	test   sil,sil
  402cab:	0f 84 6a fa ff ff    	je     40271b <format_string_loop.constprop.0+0x17b>
  402cb1:	49 8d 5e 03          	lea    rbx,[r14+0x3]
  402cb5:	e9 06 fa ff ff       	jmp    4026c0 <format_string_loop.constprop.0+0x120>
  402cba:	41 0f b6 76 02       	movzx  esi,BYTE PTR [r14+0x2]
  402cbf:	80 cd 06             	or     ch,0x6
  402cc2:	40 84 f6             	test   sil,sil
  402cc5:	75 ea                	jne    402cb1 <format_string_loop.constprop.0+0x711>
  402cc7:	e9 4f fa ff ff       	jmp    40271b <format_string_loop.constprop.0+0x17b>
  402ccc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402cd0:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  402cd4:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  402cd8:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  402cdc:	e9 f6 fb ff ff       	jmp    4028d7 <format_string_loop.constprop.0+0x337>
  402ce1:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  402ce5:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  402ce9:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  402ced:	48 8b 2f             	mov    rbp,QWORD PTR [rdi]
  402cf0:	48 85 ed             	test   rbp,rbp
  402cf3:	0f 85 5c fc ff ff    	jne    402955 <format_string_loop.constprop.0+0x3b5>
  402cf9:	41 89 c8             	mov    r8d,ecx
  402cfc:	48 8d 35 8b 13 00 00 	lea    rsi,[rip+0x138b]        # 40408e <kb_readc+0x750>
  402d03:	89 d1                	mov    ecx,edx
  402d05:	4c 89 e7             	mov    rdi,r12
  402d08:	ba 06 00 00 00       	mov    edx,0x6
  402d0d:	e8 8e e7 ff ff       	call   4014a0 <out_rev_>
  402d12:	e9 f9 f9 ff ff       	jmp    402710 <format_string_loop.constprop.0+0x170>
  402d17:	f6 c1 80             	test   cl,0x80
  402d1a:	0f 84 9e 01 00 00    	je     402ebe <format_string_loop.constprop.0+0x91e>
  402d20:	83 fa 2f             	cmp    edx,0x2f
  402d23:	0f 87 ab 04 00 00    	ja     4031d4 <format_string_loop.constprop.0+0xc34>
  402d29:	89 d1                	mov    ecx,edx
  402d2b:	83 c2 08             	add    edx,0x8
  402d2e:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  402d32:	41 89 17             	mov    DWORD PTR [r15],edx
  402d35:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  402d38:	66 89 32             	mov    WORD PTR [rdx],si
  402d3b:	e9 d0 f9 ff ff       	jmp    402710 <format_string_loop.constprop.0+0x170>
  402d40:	41 89 c8             	mov    r8d,ecx
  402d43:	41 83 e0 f3          	and    r8d,0xfffffff3
  402d47:	85 ff                	test   edi,edi
  402d49:	0f 85 a0 01 00 00    	jne    402eef <format_string_loop.constprop.0+0x94f>
  402d4f:	f6 c5 02             	test   ch,0x2
  402d52:	0f 85 97 01 00 00    	jne    402eef <format_string_loop.constprop.0+0x94f>
  402d58:	f6 c1 40             	test   cl,0x40
  402d5b:	0f 84 aa 04 00 00    	je     40320b <format_string_loop.constprop.0+0xc6b>
  402d61:	83 fe 2f             	cmp    esi,0x2f
  402d64:	0f 87 00 05 00 00    	ja     40326a <format_string_loop.constprop.0+0xcca>
  402d6a:	89 f1                	mov    ecx,esi
  402d6c:	83 c6 08             	add    esi,0x8
  402d6f:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  402d73:	41 89 37             	mov    DWORD PTR [r15],esi
  402d76:	0f b6 31             	movzx  esi,BYTE PTR [rcx]
  402d79:	48 83 ec 08          	sub    rsp,0x8
  402d7d:	41 89 d1             	mov    r9d,edx
  402d80:	4c 89 e7             	mov    rdi,r12
  402d83:	44 89 d9             	mov    ecx,r11d
  402d86:	41 50                	push   r8
  402d88:	31 d2                	xor    edx,edx
  402d8a:	45 89 d0             	mov    r8d,r10d
  402d8d:	e8 4e e8 ff ff       	call   4015e0 <print_integer>
  402d92:	5e                   	pop    rsi
  402d93:	5f                   	pop    rdi
  402d94:	e9 77 f9 ff ff       	jmp    402710 <format_string_loop.constprop.0+0x170>
  402d99:	89 cf                	mov    edi,ecx
  402d9b:	83 c9 20             	or     ecx,0x20
  402d9e:	40 80 fe 58          	cmp    sil,0x58
  402da2:	41 bb 10 00 00 00    	mov    r11d,0x10
  402da8:	89 cd                	mov    ebp,ecx
  402daa:	89 f9                	mov    ecx,edi
  402dac:	0f 44 cd             	cmove  ecx,ebp
  402daf:	e9 10 fa ff ff       	jmp    4027c4 <format_string_loop.constprop.0+0x224>
  402db4:	80 cd 40             	or     ch,0x40
  402db7:	e9 d8 f9 ff ff       	jmp    402794 <format_string_loop.constprop.0+0x1f4>
  402dbc:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  402dc0:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  402dc4:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  402dc8:	e9 4d fb ff ff       	jmp    40291a <format_string_loop.constprop.0+0x37a>
  402dcd:	49 8b 77 08          	mov    rsi,QWORD PTR [r15+0x8]
  402dd1:	48 8d 56 08          	lea    rdx,[rsi+0x8]
  402dd5:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  402dd9:	48 8b 36             	mov    rsi,QWORD PTR [rsi]
  402ddc:	48 85 f6             	test   rsi,rsi
  402ddf:	0f 85 a5 fd ff ff    	jne    402b8a <format_string_loop.constprop.0+0x5ea>
  402de5:	41 89 c8             	mov    r8d,ecx
  402de8:	ba 05 00 00 00       	mov    edx,0x5
  402ded:	b9 12 00 00 00       	mov    ecx,0x12
  402df2:	4c 89 e7             	mov    rdi,r12
  402df5:	48 8d 35 99 12 00 00 	lea    rsi,[rip+0x1299]        # 404095 <kb_readc+0x757>
  402dfc:	e8 9f e6 ff ff       	call   4014a0 <out_rev_>
  402e01:	e9 0a f9 ff ff       	jmp    402710 <format_string_loop.constprop.0+0x170>
  402e06:	4d 8b 47 08          	mov    r8,QWORD PTR [r15+0x8]
  402e0a:	49 8d 48 08          	lea    rcx,[r8+0x8]
  402e0e:	49 89 4f 08          	mov    QWORD PTR [r15+0x8],rcx
  402e12:	41 8b 08             	mov    ecx,DWORD PTR [r8]
  402e15:	44 8d 46 01          	lea    r8d,[rsi+0x1]
  402e19:	45 89 44 24 18       	mov    DWORD PTR [r12+0x18],r8d
  402e1e:	39 fe                	cmp    esi,edi
  402e20:	0f 82 fb fc ff ff    	jb     402b21 <format_string_loop.constprop.0+0x581>
  402e26:	c7 44 24 08 01 00 00 	mov    DWORD PTR [rsp+0x8],0x1
  402e2d:	00 
  402e2e:	bd 02 00 00 00       	mov    ebp,0x2
  402e33:	41 89 d6             	mov    r14d,edx
  402e36:	3b 54 24 08          	cmp    edx,DWORD PTR [rsp+0x8]
  402e3a:	77 26                	ja     402e62 <format_string_loop.constprop.0+0x8c2>
  402e3c:	e9 cf f8 ff ff       	jmp    402710 <format_string_loop.constprop.0+0x170>
  402e41:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  402e48:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  402e4d:	bf 20 00 00 00       	mov    edi,0x20
  402e52:	ff d1                	call   rcx
  402e54:	8d 45 01             	lea    eax,[rbp+0x1]
  402e57:	41 39 ee             	cmp    r14d,ebp
  402e5a:	0f 86 b0 f8 ff ff    	jbe    402710 <format_string_loop.constprop.0+0x170>
  402e60:	89 c5                	mov    ebp,eax
  402e62:	41 8b 44 24 18       	mov    eax,DWORD PTR [r12+0x18]
  402e67:	8d 48 01             	lea    ecx,[rax+0x1]
  402e6a:	41 89 4c 24 18       	mov    DWORD PTR [r12+0x18],ecx
  402e6f:	41 3b 44 24 1c       	cmp    eax,DWORD PTR [r12+0x1c]
  402e74:	73 de                	jae    402e54 <format_string_loop.constprop.0+0x8b4>
  402e76:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  402e7a:	48 85 c9             	test   rcx,rcx
  402e7d:	75 c9                	jne    402e48 <format_string_loop.constprop.0+0x8a8>
  402e7f:	49 8b 54 24 10       	mov    rdx,QWORD PTR [r12+0x10]
  402e84:	c6 04 02 20          	mov    BYTE PTR [rdx+rax*1],0x20
  402e88:	eb ca                	jmp    402e54 <format_string_loop.constprop.0+0x8b4>
  402e8a:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  402e8e:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  402e92:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  402e96:	e9 dd fd ff ff       	jmp    402c78 <format_string_loop.constprop.0+0x6d8>
  402e9b:	45 84 c9             	test   r9b,r9b
  402e9e:	0f 84 52 04 00 00    	je     4032f6 <format_string_loop.constprop.0+0xd56>
  402ea4:	41 8d 7a ff          	lea    edi,[r10-0x1]
  402ea8:	e9 c7 fa ff ff       	jmp    402974 <format_string_loop.constprop.0+0x3d4>
  402ead:	89 d1                	mov    ecx,edx
  402eaf:	83 c2 08             	add    edx,0x8
  402eb2:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  402eb6:	41 89 17             	mov    DWORD PTR [r15],edx
  402eb9:	e9 16 fc ff ff       	jmp    402ad4 <format_string_loop.constprop.0+0x534>
  402ebe:	f6 c5 02             	test   ch,0x2
  402ec1:	0f 85 f3 00 00 00    	jne    402fba <format_string_loop.constprop.0+0xa1a>
  402ec7:	80 e5 04             	and    ch,0x4
  402eca:	0f 85 ea 00 00 00    	jne    402fba <format_string_loop.constprop.0+0xa1a>
  402ed0:	83 fa 2f             	cmp    edx,0x2f
  402ed3:	0f 87 ba 03 00 00    	ja     403293 <format_string_loop.constprop.0+0xcf3>
  402ed9:	89 d1                	mov    ecx,edx
  402edb:	83 c2 08             	add    edx,0x8
  402ede:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  402ee2:	41 89 17             	mov    DWORD PTR [r15],edx
  402ee5:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  402ee8:	89 32                	mov    DWORD PTR [rdx],esi
  402eea:	e9 21 f8 ff ff       	jmp    402710 <format_string_loop.constprop.0+0x170>
  402eef:	83 fe 2f             	cmp    esi,0x2f
  402ef2:	0f 87 b9 02 00 00    	ja     4031b1 <format_string_loop.constprop.0+0xc11>
  402ef8:	89 f7                	mov    edi,esi
  402efa:	83 c6 08             	add    esi,0x8
  402efd:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  402f01:	41 89 37             	mov    DWORD PTR [r15],esi
  402f04:	48 83 ec 08          	sub    rsp,0x8
  402f08:	41 89 d1             	mov    r9d,edx
  402f0b:	44 89 d9             	mov    ecx,r11d
  402f0e:	31 d2                	xor    edx,edx
  402f10:	41 50                	push   r8
  402f12:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
  402f15:	45 89 d0             	mov    r8d,r10d
  402f18:	4c 89 e7             	mov    rdi,r12
  402f1b:	e8 c0 e6 ff ff       	call   4015e0 <print_integer>
  402f20:	41 58                	pop    r8
  402f22:	41 59                	pop    r9
  402f24:	e9 e7 f7 ff ff       	jmp    402710 <format_string_loop.constprop.0+0x170>
  402f29:	83 fe 2f             	cmp    esi,0x2f
  402f2c:	0f 87 6e 02 00 00    	ja     4031a0 <format_string_loop.constprop.0+0xc00>
  402f32:	89 f7                	mov    edi,esi
  402f34:	83 c6 08             	add    esi,0x8
  402f37:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  402f3b:	41 89 37             	mov    DWORD PTR [r15],esi
  402f3e:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
  402f41:	41 89 d1             	mov    r9d,edx
  402f44:	45 89 d0             	mov    r8d,r10d
  402f47:	4c 89 e7             	mov    rdi,r12
  402f4a:	48 89 f5             	mov    rbp,rsi
  402f4d:	48 f7 dd             	neg    rbp
  402f50:	48 0f 48 ee          	cmovs  rbp,rsi
  402f54:	48 83 ec 08          	sub    rsp,0x8
  402f58:	48 c1 ee 3f          	shr    rsi,0x3f
  402f5c:	51                   	push   rcx
  402f5d:	48 89 f2             	mov    rdx,rsi
  402f60:	44 89 d9             	mov    ecx,r11d
  402f63:	48 89 ee             	mov    rsi,rbp
  402f66:	e8 75 e6 ff ff       	call   4015e0 <print_integer>
  402f6b:	5d                   	pop    rbp
  402f6c:	41 5e                	pop    r14
  402f6e:	e9 9d f7 ff ff       	jmp    402710 <format_string_loop.constprop.0+0x170>
  402f73:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  402f78:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  402f7d:	bf 20 00 00 00       	mov    edi,0x20
  402f82:	ff d1                	call   rcx
  402f84:	8d 45 01             	lea    eax,[rbp+0x1]
  402f87:	41 39 ee             	cmp    r14d,ebp
  402f8a:	0f 84 80 f7 ff ff    	je     402710 <format_string_loop.constprop.0+0x170>
  402f90:	89 c5                	mov    ebp,eax
  402f92:	41 8b 44 24 18       	mov    eax,DWORD PTR [r12+0x18]
  402f97:	8d 48 01             	lea    ecx,[rax+0x1]
  402f9a:	41 89 4c 24 18       	mov    DWORD PTR [r12+0x18],ecx
  402f9f:	41 3b 44 24 1c       	cmp    eax,DWORD PTR [r12+0x1c]
  402fa4:	73 de                	jae    402f84 <format_string_loop.constprop.0+0x9e4>
  402fa6:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  402faa:	48 85 c9             	test   rcx,rcx
  402fad:	75 c9                	jne    402f78 <format_string_loop.constprop.0+0x9d8>
  402faf:	49 8b 54 24 10       	mov    rdx,QWORD PTR [r12+0x10]
  402fb4:	c6 04 02 20          	mov    BYTE PTR [rdx+rax*1],0x20
  402fb8:	eb ca                	jmp    402f84 <format_string_loop.constprop.0+0x9e4>
  402fba:	83 fa 2f             	cmp    edx,0x2f
  402fbd:	0f 87 6d 02 00 00    	ja     403230 <format_string_loop.constprop.0+0xc90>
  402fc3:	89 d1                	mov    ecx,edx
  402fc5:	83 c2 08             	add    edx,0x8
  402fc8:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  402fcc:	41 89 17             	mov    DWORD PTR [r15],edx
  402fcf:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  402fd2:	89 f0                	mov    eax,esi
  402fd4:	48 89 02             	mov    QWORD PTR [rdx],rax
  402fd7:	e9 34 f7 ff ff       	jmp    402710 <format_string_loop.constprop.0+0x170>
  402fdc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402fe0:	49 8b 7c 24 10       	mov    rdi,QWORD PTR [r12+0x10]
  402fe5:	40 88 34 07          	mov    BYTE PTR [rdi+rax*1],sil
  402fe9:	e9 3e fa ff ff       	jmp    402a2c <format_string_loop.constprop.0+0x48c>
  402fee:	83 fa 01             	cmp    edx,0x1
  402ff1:	0f 86 0c 03 00 00    	jbe    403303 <format_string_loop.constprop.0+0xd63>
  402ff7:	8d 42 01             	lea    eax,[rdx+0x1]
  402ffa:	48 89 5c 24 10       	mov    QWORD PTR [rsp+0x10],rbx
  402fff:	41 be 02 00 00 00    	mov    r14d,0x2
  403005:	89 d3                	mov    ebx,edx
  403007:	89 44 24 08          	mov    DWORD PTR [rsp+0x8],eax
  40300b:	eb 32                	jmp    40303f <format_string_loop.constprop.0+0xa9f>
  40300d:	0f 1f 00             	nop    DWORD PTR [rax]
  403010:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
  403014:	48 85 c0             	test   rax,rax
  403017:	0f 84 8d 00 00 00    	je     4030aa <format_string_loop.constprop.0+0xb0a>
  40301d:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  403022:	bf 20 00 00 00       	mov    edi,0x20
  403027:	ff d0                	call   rax
  403029:	41 8b 74 24 18       	mov    esi,DWORD PTR [r12+0x18]
  40302e:	41 8b 7c 24 1c       	mov    edi,DWORD PTR [r12+0x1c]
  403033:	41 8d 46 01          	lea    eax,[r14+0x1]
  403037:	44 39 f3             	cmp    ebx,r14d
  40303a:	74 1a                	je     403056 <format_string_loop.constprop.0+0xab6>
  40303c:	41 89 c6             	mov    r14d,eax
  40303f:	8d 46 01             	lea    eax,[rsi+0x1]
  403042:	41 89 44 24 18       	mov    DWORD PTR [r12+0x18],eax
  403047:	39 fe                	cmp    esi,edi
  403049:	72 c5                	jb     403010 <format_string_loop.constprop.0+0xa70>
  40304b:	89 c6                	mov    esi,eax
  40304d:	41 8d 46 01          	lea    eax,[r14+0x1]
  403051:	44 39 f3             	cmp    ebx,r14d
  403054:	75 e6                	jne    40303c <format_string_loop.constprop.0+0xa9c>
  403056:	89 da                	mov    edx,ebx
  403058:	48 8b 5c 24 10       	mov    rbx,QWORD PTR [rsp+0x10]
  40305d:	41 8b 0f             	mov    ecx,DWORD PTR [r15]
  403060:	83 f9 2f             	cmp    ecx,0x2f
  403063:	0f 86 59 01 00 00    	jbe    4031c2 <format_string_loop.constprop.0+0xc22>
  403069:	4d 8b 47 08          	mov    r8,QWORD PTR [r15+0x8]
  40306d:	49 8d 48 08          	lea    rcx,[r8+0x8]
  403071:	49 89 4f 08          	mov    QWORD PTR [r15+0x8],rcx
  403075:	41 8b 08             	mov    ecx,DWORD PTR [r8]
  403078:	44 8d 46 01          	lea    r8d,[rsi+0x1]
  40307c:	45 89 44 24 18       	mov    DWORD PTR [r12+0x18],r8d
  403081:	39 fe                	cmp    esi,edi
  403083:	0f 83 87 f6 ff ff    	jae    402710 <format_string_loop.constprop.0+0x170>
  403089:	41 89 c8             	mov    r8d,ecx
  40308c:	0f be f9             	movsx  edi,cl
  40308f:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  403093:	48 85 c9             	test   rcx,rcx
  403096:	0f 85 a0 fa ff ff    	jne    402b3c <format_string_loop.constprop.0+0x59c>
  40309c:	49 8b 4c 24 10       	mov    rcx,QWORD PTR [r12+0x10]
  4030a1:	44 88 04 31          	mov    BYTE PTR [rcx+rsi*1],r8b
  4030a5:	e9 a1 fa ff ff       	jmp    402b4b <format_string_loop.constprop.0+0x5ab>
  4030aa:	49 8b 44 24 10       	mov    rax,QWORD PTR [r12+0x10]
  4030af:	c6 04 30 20          	mov    BYTE PTR [rax+rsi*1],0x20
  4030b3:	41 8b 74 24 18       	mov    esi,DWORD PTR [r12+0x18]
  4030b8:	41 8b 7c 24 1c       	mov    edi,DWORD PTR [r12+0x1c]
  4030bd:	e9 71 ff ff ff       	jmp    403033 <format_string_loop.constprop.0+0xa93>
  4030c2:	49 8b 4c 24 10       	mov    rcx,QWORD PTR [r12+0x10]
  4030c7:	c6 04 11 25          	mov    BYTE PTR [rcx+rdx*1],0x25
  4030cb:	e9 40 f6 ff ff       	jmp    402710 <format_string_loop.constprop.0+0x170>
  4030d0:	49 8b 4c 24 10       	mov    rcx,QWORD PTR [r12+0x10]
  4030d5:	40 88 34 11          	mov    BYTE PTR [rcx+rdx*1],sil
  4030d9:	e9 32 f6 ff ff       	jmp    402710 <format_string_loop.constprop.0+0x170>
  4030de:	44 8d 5f 01          	lea    r11d,[rdi+0x1]
  4030e2:	39 fa                	cmp    edx,edi
  4030e4:	0f 86 02 02 00 00    	jbe    4032ec <format_string_loop.constprop.0+0xd4c>
  4030ea:	8d 42 01             	lea    eax,[rdx+0x1]
  4030ed:	48 89 6c 24 08       	mov    QWORD PTR [rsp+0x8],rbp
  4030f2:	89 d5                	mov    ebp,edx
  4030f4:	48 89 5c 24 28       	mov    QWORD PTR [rsp+0x28],rbx
  4030f9:	44 89 db             	mov    ebx,r11d
  4030fc:	89 44 24 10          	mov    DWORD PTR [rsp+0x10],eax
  403100:	44 89 54 24 20       	mov    DWORD PTR [rsp+0x20],r10d
  403105:	eb 1f                	jmp    403126 <format_string_loop.constprop.0+0xb86>
  403107:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40310e:	00 00 
  403110:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  403115:	bf 20 00 00 00       	mov    edi,0x20
  40311a:	41 ff d0             	call   r8
  40311d:	8d 4b 01             	lea    ecx,[rbx+0x1]
  403120:	39 dd                	cmp    ebp,ebx
  403122:	74 2f                	je     403153 <format_string_loop.constprop.0+0xbb3>
  403124:	89 cb                	mov    ebx,ecx
  403126:	41 8b 4c 24 18       	mov    ecx,DWORD PTR [r12+0x18]
  40312b:	8d 71 01             	lea    esi,[rcx+0x1]
  40312e:	41 89 74 24 18       	mov    DWORD PTR [r12+0x18],esi
  403133:	41 3b 4c 24 1c       	cmp    ecx,DWORD PTR [r12+0x1c]
  403138:	73 e3                	jae    40311d <format_string_loop.constprop.0+0xb7d>
  40313a:	4d 8b 04 24          	mov    r8,QWORD PTR [r12]
  40313e:	4d 85 c0             	test   r8,r8
  403141:	75 cd                	jne    403110 <format_string_loop.constprop.0+0xb70>
  403143:	49 8b 74 24 10       	mov    rsi,QWORD PTR [r12+0x10]
  403148:	c6 04 0e 20          	mov    BYTE PTR [rsi+rcx*1],0x20
  40314c:	8d 4b 01             	lea    ecx,[rbx+0x1]
  40314f:	39 dd                	cmp    ebp,ebx
  403151:	75 d1                	jne    403124 <format_string_loop.constprop.0+0xb84>
  403153:	89 ea                	mov    edx,ebp
  403155:	48 8b 6c 24 08       	mov    rbp,QWORD PTR [rsp+0x8]
  40315a:	44 8b 54 24 20       	mov    r10d,DWORD PTR [rsp+0x20]
  40315f:	48 8b 5c 24 28       	mov    rbx,QWORD PTR [rsp+0x28]
  403164:	44 0f b6 4d 00       	movzx  r9d,BYTE PTR [rbp+0x0]
  403169:	44 89 ce             	mov    esi,r9d
  40316c:	45 84 c9             	test   r9b,r9b
  40316f:	0f 84 9b f5 ff ff    	je     402710 <format_string_loop.constprop.0+0x170>
  403175:	45 85 f6             	test   r14d,r14d
  403178:	0f 94 44 24 08       	sete   BYTE PTR [rsp+0x8]
  40317d:	0f b6 44 24 08       	movzx  eax,BYTE PTR [rsp+0x8]
  403182:	45 85 d2             	test   r10d,r10d
  403185:	0f 85 57 f8 ff ff    	jne    4029e2 <format_string_loop.constprop.0+0x442>
  40318b:	84 c0                	test   al,al
  40318d:	0f 85 4f f8 ff ff    	jne    4029e2 <format_string_loop.constprop.0+0x442>
  403193:	e9 78 f5 ff ff       	jmp    402710 <format_string_loop.constprop.0+0x170>
  403198:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40319f:	00 
  4031a0:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  4031a4:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  4031a8:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  4031ac:	e9 8d fd ff ff       	jmp    402f3e <format_string_loop.constprop.0+0x99e>
  4031b1:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  4031b5:	48 8d 4f 08          	lea    rcx,[rdi+0x8]
  4031b9:	49 89 4f 08          	mov    QWORD PTR [r15+0x8],rcx
  4031bd:	e9 42 fd ff ff       	jmp    402f04 <format_string_loop.constprop.0+0x964>
  4031c2:	41 89 c8             	mov    r8d,ecx
  4031c5:	83 c1 08             	add    ecx,0x8
  4031c8:	4d 03 47 10          	add    r8,QWORD PTR [r15+0x10]
  4031cc:	41 89 0f             	mov    DWORD PTR [r15],ecx
  4031cf:	e9 a1 fe ff ff       	jmp    403075 <format_string_loop.constprop.0+0xad5>
  4031d4:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  4031d8:	48 8d 51 08          	lea    rdx,[rcx+0x8]
  4031dc:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  4031e0:	e9 50 fb ff ff       	jmp    402d35 <format_string_loop.constprop.0+0x795>
  4031e5:	f6 c1 80             	test   cl,0x80
  4031e8:	0f 84 8d 00 00 00    	je     40327b <format_string_loop.constprop.0+0xcdb>
  4031ee:	83 fe 2f             	cmp    esi,0x2f
  4031f1:	0f 87 e4 00 00 00    	ja     4032db <format_string_loop.constprop.0+0xd3b>
  4031f7:	89 f7                	mov    edi,esi
  4031f9:	83 c6 08             	add    esi,0x8
  4031fc:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  403200:	41 89 37             	mov    DWORD PTR [r15],esi
  403203:	0f bf 3f             	movsx  edi,WORD PTR [rdi]
  403206:	e9 0a f6 ff ff       	jmp    402815 <format_string_loop.constprop.0+0x275>
  40320b:	81 e1 80 00 00 00    	and    ecx,0x80
  403211:	74 3f                	je     403252 <format_string_loop.constprop.0+0xcb2>
  403213:	83 fe 2f             	cmp    esi,0x2f
  403216:	0f 87 ae 00 00 00    	ja     4032ca <format_string_loop.constprop.0+0xd2a>
  40321c:	89 f1                	mov    ecx,esi
  40321e:	83 c6 08             	add    esi,0x8
  403221:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  403225:	41 89 37             	mov    DWORD PTR [r15],esi
  403228:	0f b7 31             	movzx  esi,WORD PTR [rcx]
  40322b:	e9 49 fb ff ff       	jmp    402d79 <format_string_loop.constprop.0+0x7d9>
  403230:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  403234:	48 8d 51 08          	lea    rdx,[rcx+0x8]
  403238:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  40323c:	e9 8e fd ff ff       	jmp    402fcf <format_string_loop.constprop.0+0xa2f>
  403241:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  403245:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  403249:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  40324d:	e9 c0 f5 ff ff       	jmp    402812 <format_string_loop.constprop.0+0x272>
  403252:	83 fe 2f             	cmp    esi,0x2f
  403255:	76 60                	jbe    4032b7 <format_string_loop.constprop.0+0xd17>
  403257:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  40325b:	48 8d 71 08          	lea    rsi,[rcx+0x8]
  40325f:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  403263:	8b 31                	mov    esi,DWORD PTR [rcx]
  403265:	e9 0f fb ff ff       	jmp    402d79 <format_string_loop.constprop.0+0x7d9>
  40326a:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  40326e:	48 8d 71 08          	lea    rsi,[rcx+0x8]
  403272:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  403276:	e9 fb fa ff ff       	jmp    402d76 <format_string_loop.constprop.0+0x7d6>
  40327b:	83 fe 2f             	cmp    esi,0x2f
  40327e:	76 24                	jbe    4032a4 <format_string_loop.constprop.0+0xd04>
  403280:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  403284:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  403288:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  40328c:	8b 3f                	mov    edi,DWORD PTR [rdi]
  40328e:	e9 82 f5 ff ff       	jmp    402815 <format_string_loop.constprop.0+0x275>
  403293:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  403297:	48 8d 51 08          	lea    rdx,[rcx+0x8]
  40329b:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  40329f:	e9 41 fc ff ff       	jmp    402ee5 <format_string_loop.constprop.0+0x945>
  4032a4:	89 f7                	mov    edi,esi
  4032a6:	83 c6 08             	add    esi,0x8
  4032a9:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  4032ad:	41 89 37             	mov    DWORD PTR [r15],esi
  4032b0:	8b 3f                	mov    edi,DWORD PTR [rdi]
  4032b2:	e9 5e f5 ff ff       	jmp    402815 <format_string_loop.constprop.0+0x275>
  4032b7:	89 f1                	mov    ecx,esi
  4032b9:	83 c6 08             	add    esi,0x8
  4032bc:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  4032c0:	41 89 37             	mov    DWORD PTR [r15],esi
  4032c3:	8b 31                	mov    esi,DWORD PTR [rcx]
  4032c5:	e9 af fa ff ff       	jmp    402d79 <format_string_loop.constprop.0+0x7d9>
  4032ca:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  4032ce:	48 8d 71 08          	lea    rsi,[rcx+0x8]
  4032d2:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  4032d6:	e9 4d ff ff ff       	jmp    403228 <format_string_loop.constprop.0+0xc88>
  4032db:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  4032df:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  4032e3:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  4032e7:	e9 17 ff ff ff       	jmp    403203 <format_string_loop.constprop.0+0xc63>
  4032ec:	44 89 5c 24 10       	mov    DWORD PTR [rsp+0x10],r11d
  4032f1:	e9 73 fe ff ff       	jmp    403169 <format_string_loop.constprop.0+0xbc9>
  4032f6:	c7 44 24 10 00 00 00 	mov    DWORD PTR [rsp+0x10],0x0
  4032fd:	00 
  4032fe:	e9 95 f6 ff ff       	jmp    402998 <format_string_loop.constprop.0+0x3f8>
  403303:	c7 44 24 08 02 00 00 	mov    DWORD PTR [rsp+0x8],0x2
  40330a:	00 
  40330b:	e9 4d fd ff ff       	jmp    40305d <format_string_loop.constprop.0+0xabd>

0000000000403310 <vprintf>:
  403310:	f3 0f 1e fa          	endbr64 
  403314:	48 83 ec 28          	sub    rsp,0x28
  403318:	49 89 f8             	mov    r8,rdi
  40331b:	48 8d 05 6e e1 ff ff 	lea    rax,[rip+0xffffffffffffe16e]        # 401490 <putchar_wrapper>
  403322:	48 89 f2             	mov    rdx,rsi
  403325:	48 89 04 24          	mov    QWORD PTR [rsp],rax
  403329:	48 89 e7             	mov    rdi,rsp
  40332c:	4c 89 c6             	mov    rsi,r8
  40332f:	48 b8 00 00 00 00 ff 	movabs rax,0x7fffffff00000000
  403336:	ff ff 7f 
  403339:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
  403340:	00 00 
  403342:	48 c7 44 24 10 00 00 	mov    QWORD PTR [rsp+0x10],0x0
  403349:	00 00 
  40334b:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  403350:	e8 4b f2 ff ff       	call   4025a0 <format_string_loop.constprop.0>
  403355:	48 83 3c 24 00       	cmp    QWORD PTR [rsp],0x0
  40335a:	74 0c                	je     403368 <vprintf+0x58>
  40335c:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  403360:	48 83 c4 28          	add    rsp,0x28
  403364:	c3                   	ret    
  403365:	0f 1f 00             	nop    DWORD PTR [rax]
  403368:	8b 4c 24 1c          	mov    ecx,DWORD PTR [rsp+0x1c]
  40336c:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  403370:	85 c9                	test   ecx,ecx
  403372:	74 ec                	je     403360 <vprintf+0x50>
  403374:	48 8b 74 24 10       	mov    rsi,QWORD PTR [rsp+0x10]
  403379:	48 85 f6             	test   rsi,rsi
  40337c:	74 e2                	je     403360 <vprintf+0x50>
  40337e:	39 c1                	cmp    ecx,eax
  403380:	8d 51 ff             	lea    edx,[rcx-0x1]
  403383:	48 0f 47 d0          	cmova  rdx,rax
  403387:	c6 04 16 00          	mov    BYTE PTR [rsi+rdx*1],0x0
  40338b:	48 83 c4 28          	add    rsp,0x28
  40338f:	c3                   	ret    

0000000000403390 <vsnprintf>:
  403390:	f3 0f 1e fa          	endbr64 
  403394:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
  403399:	48 83 ec 28          	sub    rsp,0x28
  40339d:	49 89 d0             	mov    r8,rdx
  4033a0:	48 89 ca             	mov    rdx,rcx
  4033a3:	48 39 c6             	cmp    rsi,rax
  4033a6:	48 89 7c 24 10       	mov    QWORD PTR [rsp+0x10],rdi
  4033ab:	48 0f 47 f0          	cmova  rsi,rax
  4033af:	31 c0                	xor    eax,eax
  4033b1:	48 85 ff             	test   rdi,rdi
  4033b4:	48 89 e7             	mov    rdi,rsp
  4033b7:	48 c7 04 24 00 00 00 	mov    QWORD PTR [rsp],0x0
  4033be:	00 
  4033bf:	48 0f 44 f0          	cmove  rsi,rax
  4033c3:	c7 44 24 18 00 00 00 	mov    DWORD PTR [rsp+0x18],0x0
  4033ca:	00 
  4033cb:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
  4033d2:	00 00 
  4033d4:	89 74 24 1c          	mov    DWORD PTR [rsp+0x1c],esi
  4033d8:	4c 89 c6             	mov    rsi,r8
  4033db:	e8 c0 f1 ff ff       	call   4025a0 <format_string_loop.constprop.0>
  4033e0:	48 83 3c 24 00       	cmp    QWORD PTR [rsp],0x0
  4033e5:	74 09                	je     4033f0 <vsnprintf+0x60>
  4033e7:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  4033eb:	48 83 c4 28          	add    rsp,0x28
  4033ef:	c3                   	ret    
  4033f0:	8b 4c 24 1c          	mov    ecx,DWORD PTR [rsp+0x1c]
  4033f4:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  4033f8:	85 c9                	test   ecx,ecx
  4033fa:	74 ef                	je     4033eb <vsnprintf+0x5b>
  4033fc:	48 8b 74 24 10       	mov    rsi,QWORD PTR [rsp+0x10]
  403401:	48 85 f6             	test   rsi,rsi
  403404:	74 e5                	je     4033eb <vsnprintf+0x5b>
  403406:	39 c1                	cmp    ecx,eax
  403408:	8d 51 ff             	lea    edx,[rcx-0x1]
  40340b:	48 0f 47 d0          	cmova  rdx,rax
  40340f:	c6 04 16 00          	mov    BYTE PTR [rsi+rdx*1],0x0
  403413:	48 83 c4 28          	add    rsp,0x28
  403417:	c3                   	ret    
  403418:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40341f:	00 

0000000000403420 <vsprintf>:
  403420:	f3 0f 1e fa          	endbr64 
  403424:	48 89 d1             	mov    rcx,rdx
  403427:	48 89 f2             	mov    rdx,rsi
  40342a:	be ff ff ff 7f       	mov    esi,0x7fffffff
  40342f:	e9 5c ff ff ff       	jmp    403390 <vsnprintf>
  403434:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40343b:	00 00 00 
  40343e:	66 90                	xchg   ax,ax

0000000000403440 <vfctprintf>:
  403440:	f3 0f 1e fa          	endbr64 
  403444:	48 83 ec 28          	sub    rsp,0x28
  403448:	49 89 f0             	mov    r8,rsi
  40344b:	48 89 d6             	mov    rsi,rdx
  40344e:	48 b8 00 00 00 00 ff 	movabs rax,0x7fffffff00000000
  403455:	ff ff 7f 
  403458:	48 89 3c 24          	mov    QWORD PTR [rsp],rdi
  40345c:	48 89 ca             	mov    rdx,rcx
  40345f:	48 89 e7             	mov    rdi,rsp
  403462:	4c 89 44 24 08       	mov    QWORD PTR [rsp+0x8],r8
  403467:	48 c7 44 24 10 00 00 	mov    QWORD PTR [rsp+0x10],0x0
  40346e:	00 00 
  403470:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  403475:	e8 26 f1 ff ff       	call   4025a0 <format_string_loop.constprop.0>
  40347a:	48 83 3c 24 00       	cmp    QWORD PTR [rsp],0x0
  40347f:	74 0f                	je     403490 <vfctprintf+0x50>
  403481:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  403485:	48 83 c4 28          	add    rsp,0x28
  403489:	c3                   	ret    
  40348a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  403490:	8b 4c 24 1c          	mov    ecx,DWORD PTR [rsp+0x1c]
  403494:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  403498:	85 c9                	test   ecx,ecx
  40349a:	74 e9                	je     403485 <vfctprintf+0x45>
  40349c:	48 8b 74 24 10       	mov    rsi,QWORD PTR [rsp+0x10]
  4034a1:	48 85 f6             	test   rsi,rsi
  4034a4:	74 df                	je     403485 <vfctprintf+0x45>
  4034a6:	39 c1                	cmp    ecx,eax
  4034a8:	8d 51 ff             	lea    edx,[rcx-0x1]
  4034ab:	48 0f 47 d0          	cmova  rdx,rax
  4034af:	c6 04 16 00          	mov    BYTE PTR [rsi+rdx*1],0x0
  4034b3:	48 83 c4 28          	add    rsp,0x28
  4034b7:	c3                   	ret    
  4034b8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4034bf:	00 

00000000004034c0 <printf>:
  4034c0:	f3 0f 1e fa          	endbr64 
  4034c4:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  4034cb:	48 89 74 24 28       	mov    QWORD PTR [rsp+0x28],rsi
  4034d0:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
  4034d5:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  4034da:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  4034df:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  4034e4:	84 c0                	test   al,al
  4034e6:	74 37                	je     40351f <printf+0x5f>
  4034e8:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  4034ed:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  4034f2:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  4034f7:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  4034fe:	00 
  4034ff:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  403506:	00 
  403507:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  40350e:	00 
  40350f:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  403516:	00 
  403517:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  40351e:	00 
  40351f:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  403526:	00 
  403527:	48 8d 74 24 08       	lea    rsi,[rsp+0x8]
  40352c:	c7 44 24 08 08 00 00 	mov    DWORD PTR [rsp+0x8],0x8
  403533:	00 
  403534:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403539:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  40353e:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  403545:	00 
  403546:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  40354b:	e8 c0 fd ff ff       	call   403310 <vprintf>
  403550:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  403557:	c3                   	ret    
  403558:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40355f:	00 

0000000000403560 <sprintf>:
  403560:	f3 0f 1e fa          	endbr64 
  403564:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  40356b:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
  403570:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  403575:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  40357a:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  40357f:	84 c0                	test   al,al
  403581:	74 37                	je     4035ba <sprintf+0x5a>
  403583:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  403588:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  40358d:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  403592:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  403599:	00 
  40359a:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  4035a1:	00 
  4035a2:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  4035a9:	00 
  4035aa:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  4035b1:	00 
  4035b2:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  4035b9:	00 
  4035ba:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  4035c1:	00 
  4035c2:	48 8d 54 24 08       	lea    rdx,[rsp+0x8]
  4035c7:	c7 44 24 08 10 00 00 	mov    DWORD PTR [rsp+0x8],0x10
  4035ce:	00 
  4035cf:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  4035d4:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  4035d9:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  4035e0:	00 
  4035e1:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  4035e6:	e8 35 fe ff ff       	call   403420 <vsprintf>
  4035eb:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  4035f2:	c3                   	ret    
  4035f3:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4035fa:	00 00 00 
  4035fd:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000403600 <snprintf>:
  403600:	f3 0f 1e fa          	endbr64 
  403604:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  40360b:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  403610:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  403615:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  40361a:	84 c0                	test   al,al
  40361c:	74 37                	je     403655 <snprintf+0x55>
  40361e:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  403623:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  403628:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  40362d:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  403634:	00 
  403635:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  40363c:	00 
  40363d:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  403644:	00 
  403645:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  40364c:	00 
  40364d:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  403654:	00 
  403655:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  40365c:	00 
  40365d:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
  403662:	c7 44 24 08 18 00 00 	mov    DWORD PTR [rsp+0x8],0x18
  403669:	00 
  40366a:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  40366f:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  403674:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  40367b:	00 
  40367c:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  403681:	e8 0a fd ff ff       	call   403390 <vsnprintf>
  403686:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  40368d:	c3                   	ret    
  40368e:	66 90                	xchg   ax,ax

0000000000403690 <fctprintf>:
  403690:	f3 0f 1e fa          	endbr64 
  403694:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  40369b:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  4036a0:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  4036a5:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  4036aa:	84 c0                	test   al,al
  4036ac:	74 37                	je     4036e5 <fctprintf+0x55>
  4036ae:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  4036b3:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  4036b8:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  4036bd:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  4036c4:	00 
  4036c5:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  4036cc:	00 
  4036cd:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  4036d4:	00 
  4036d5:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  4036dc:	00 
  4036dd:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  4036e4:	00 
  4036e5:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  4036ec:	00 
  4036ed:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
  4036f2:	c7 44 24 08 18 00 00 	mov    DWORD PTR [rsp+0x8],0x18
  4036f9:	00 
  4036fa:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  4036ff:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  403704:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  40370b:	00 
  40370c:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  403711:	e8 2a fd ff ff       	call   403440 <vfctprintf>
  403716:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  40371d:	c3                   	ret    
  40371e:	66 90                	xchg   ax,ax

0000000000403720 <putchar>:
  403720:	f3 0f 1e fa          	endbr64 
  403724:	41 54                	push   r12
  403726:	41 89 fc             	mov    r12d,edi
  403729:	40 0f be ff          	movsx  edi,dil
  40372d:	e8 0e 00 00 00       	call   403740 <putchar_>
  403732:	44 89 e0             	mov    eax,r12d
  403735:	41 5c                	pop    r12
  403737:	c3                   	ret    
  403738:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40373f:	00 

0000000000403740 <putchar_>:
  403740:	f3 0f 1e fa          	endbr64 
  403744:	48 83 ec 18          	sub    rsp,0x18
  403748:	ba 01 00 00 00       	mov    edx,0x1
  40374d:	31 c0                	xor    eax,eax
  40374f:	40 88 7c 24 0c       	mov    BYTE PTR [rsp+0xc],dil
  403754:	48 8d 74 24 0c       	lea    rsi,[rsp+0xc]
  403759:	bf 01 00 00 00       	mov    edi,0x1
  40375e:	e8 d1 00 00 00       	call   403834 <write>
  403763:	48 83 c4 18          	add    rsp,0x18
  403767:	c3                   	ret    
  403768:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40376f:	00 

0000000000403770 <reg_dev>:
  403770:	55                   	push   rbp
  403771:	48 89 e5             	mov    rbp,rsp
  403774:	b8 00 00 00 00       	mov    eax,0x0
  403779:	48 0f 05             	rex.W syscall 
  40377c:	c9                   	leave  
  40377d:	c3                   	ret    

000000000040377e <dispose_dev>:
  40377e:	55                   	push   rbp
  40377f:	48 89 e5             	mov    rbp,rsp
  403782:	b8 01 00 00 00       	mov    eax,0x1
  403787:	48 0f 05             	rex.W syscall 
  40378a:	c9                   	leave  
  40378b:	c3                   	ret    

000000000040378c <reg_drv>:
  40378c:	55                   	push   rbp
  40378d:	48 89 e5             	mov    rbp,rsp
  403790:	b8 02 00 00 00       	mov    eax,0x2
  403795:	48 0f 05             	rex.W syscall 
  403798:	c9                   	leave  
  403799:	c3                   	ret    

000000000040379a <dispose_drv>:
  40379a:	55                   	push   rbp
  40379b:	48 89 e5             	mov    rbp,rsp
  40379e:	b8 03 00 00 00       	mov    eax,0x3
  4037a3:	48 0f 05             	rex.W syscall 
  4037a6:	c9                   	leave  
  4037a7:	c3                   	ret    

00000000004037a8 <call_drvfunc>:
  4037a8:	55                   	push   rbp
  4037a9:	48 89 e5             	mov    rbp,rsp
  4037ac:	b8 04 00 00 00       	mov    eax,0x4
  4037b1:	48 0f 05             	rex.W syscall 
  4037b4:	c9                   	leave  
  4037b5:	c3                   	ret    

00000000004037b6 <req_mem>:
  4037b6:	55                   	push   rbp
  4037b7:	48 89 e5             	mov    rbp,rsp
  4037ba:	b8 05 00 00 00       	mov    eax,0x5
  4037bf:	48 0f 05             	rex.W syscall 
  4037c2:	c9                   	leave  
  4037c3:	c3                   	ret    

00000000004037c4 <free_mem>:
  4037c4:	55                   	push   rbp
  4037c5:	48 89 e5             	mov    rbp,rsp
  4037c8:	b8 06 00 00 00       	mov    eax,0x6
  4037cd:	48 0f 05             	rex.W syscall 
  4037d0:	c9                   	leave  
  4037d1:	c3                   	ret    

00000000004037d2 <reg_proc>:
  4037d2:	55                   	push   rbp
  4037d3:	48 89 e5             	mov    rbp,rsp
  4037d6:	b8 07 00 00 00       	mov    eax,0x7
  4037db:	48 0f 05             	rex.W syscall 
  4037de:	c9                   	leave  
  4037df:	c3                   	ret    

00000000004037e0 <del_proc>:
  4037e0:	55                   	push   rbp
  4037e1:	48 89 e5             	mov    rbp,rsp
  4037e4:	b8 08 00 00 00       	mov    eax,0x8
  4037e9:	48 0f 05             	rex.W syscall 
  4037ec:	c9                   	leave  
  4037ed:	c3                   	ret    

00000000004037ee <get_proc_addr>:
  4037ee:	55                   	push   rbp
  4037ef:	48 89 e5             	mov    rbp,rsp
  4037f2:	b8 09 00 00 00       	mov    eax,0x9
  4037f7:	48 0f 05             	rex.W syscall 
  4037fa:	c9                   	leave  
  4037fb:	c3                   	ret    

00000000004037fc <chk_vm>:
  4037fc:	55                   	push   rbp
  4037fd:	48 89 e5             	mov    rbp,rsp
  403800:	b8 0a 00 00 00       	mov    eax,0xa
  403805:	48 0f 05             	rex.W syscall 
  403808:	c9                   	leave  
  403809:	c3                   	ret    

000000000040380a <open>:
  40380a:	55                   	push   rbp
  40380b:	48 89 e5             	mov    rbp,rsp
  40380e:	b8 0b 00 00 00       	mov    eax,0xb
  403813:	48 0f 05             	rex.W syscall 
  403816:	c9                   	leave  
  403817:	c3                   	ret    

0000000000403818 <close>:
  403818:	55                   	push   rbp
  403819:	48 89 e5             	mov    rbp,rsp
  40381c:	b8 0c 00 00 00       	mov    eax,0xc
  403821:	48 0f 05             	rex.W syscall 
  403824:	c9                   	leave  
  403825:	c3                   	ret    

0000000000403826 <read>:
  403826:	55                   	push   rbp
  403827:	48 89 e5             	mov    rbp,rsp
  40382a:	b8 0d 00 00 00       	mov    eax,0xd
  40382f:	48 0f 05             	rex.W syscall 
  403832:	c9                   	leave  
  403833:	c3                   	ret    

0000000000403834 <write>:
  403834:	55                   	push   rbp
  403835:	48 89 e5             	mov    rbp,rsp
  403838:	b8 0e 00 00 00       	mov    eax,0xe
  40383d:	48 0f 05             	rex.W syscall 
  403840:	c9                   	leave  
  403841:	c3                   	ret    

0000000000403842 <seek>:
  403842:	55                   	push   rbp
  403843:	48 89 e5             	mov    rbp,rsp
  403846:	b8 0f 00 00 00       	mov    eax,0xf
  40384b:	48 0f 05             	rex.W syscall 
  40384e:	c9                   	leave  
  40384f:	c3                   	ret    

0000000000403850 <tell>:
  403850:	55                   	push   rbp
  403851:	48 89 e5             	mov    rbp,rsp
  403854:	b8 10 00 00 00       	mov    eax,0x10
  403859:	48 0f 05             	rex.W syscall 
  40385c:	c9                   	leave  
  40385d:	c3                   	ret    

000000000040385e <reg_vol>:
  40385e:	55                   	push   rbp
  40385f:	48 89 e5             	mov    rbp,rsp
  403862:	b8 11 00 00 00       	mov    eax,0x11
  403867:	48 0f 05             	rex.W syscall 
  40386a:	c9                   	leave  
  40386b:	c3                   	ret    

000000000040386c <free_vol>:
  40386c:	55                   	push   rbp
  40386d:	48 89 e5             	mov    rbp,rsp
  403870:	b8 12 00 00 00       	mov    eax,0x12
  403875:	48 0f 05             	rex.W syscall 
  403878:	c9                   	leave  
  403879:	c3                   	ret    

000000000040387a <exec>:
  40387a:	55                   	push   rbp
  40387b:	48 89 e5             	mov    rbp,rsp
  40387e:	b8 13 00 00 00       	mov    eax,0x13
  403883:	48 0f 05             	rex.W syscall 
  403886:	c9                   	leave  
  403887:	c3                   	ret    

0000000000403888 <exit>:
  403888:	55                   	push   rbp
  403889:	48 89 e5             	mov    rbp,rsp
  40388c:	b8 14 00 00 00       	mov    eax,0x14
  403891:	48 0f 05             	rex.W syscall 
  403894:	c9                   	leave  
  403895:	c3                   	ret    

0000000000403896 <call>:
  403896:	55                   	push   rbp
  403897:	48 89 e5             	mov    rbp,rsp
  40389a:	b8 15 00 00 00       	mov    eax,0x15
  40389f:	48 0f 05             	rex.W syscall 
  4038a2:	c9                   	leave  
  4038a3:	c3                   	ret    

00000000004038a4 <mkfifo>:
  4038a4:	55                   	push   rbp
  4038a5:	48 89 e5             	mov    rbp,rsp
  4038a8:	b8 16 00 00 00       	mov    eax,0x16
  4038ad:	48 0f 05             	rex.W syscall 
  4038b0:	c9                   	leave  
  4038b1:	c3                   	ret    

00000000004038b2 <brk>:
  4038b2:	55                   	push   rbp
  4038b3:	48 89 e5             	mov    rbp,rsp
  4038b6:	b8 17 00 00 00       	mov    eax,0x17
  4038bb:	48 0f 05             	rex.W syscall 
  4038be:	c9                   	leave  
  4038bf:	c3                   	ret    

00000000004038c0 <free>:
  4038c0:	55                   	push   rbp
  4038c1:	48 89 e5             	mov    rbp,rsp
  4038c4:	b8 18 00 00 00       	mov    eax,0x18
  4038c9:	48 0f 05             	rex.W syscall 
  4038cc:	c9                   	leave  
  4038cd:	c3                   	ret    

00000000004038ce <find_dev>:
  4038ce:	55                   	push   rbp
  4038cf:	48 89 e5             	mov    rbp,rsp
  4038d2:	b8 19 00 00 00       	mov    eax,0x19
  4038d7:	48 0f 05             	rex.W syscall 
  4038da:	c9                   	leave  
  4038db:	c3                   	ret    

00000000004038dc <operate_dev>:
  4038dc:	55                   	push   rbp
  4038dd:	48 89 e5             	mov    rbp,rsp
  4038e0:	b8 1a 00 00 00       	mov    eax,0x1a
  4038e5:	48 0f 05             	rex.W syscall 
  4038e8:	c9                   	leave  
  4038e9:	c3                   	ret    

00000000004038ea <fork>:
  4038ea:	55                   	push   rbp
  4038eb:	48 89 e5             	mov    rbp,rsp
  4038ee:	b8 1b 00 00 00       	mov    eax,0x1b
  4038f3:	48 0f 05             	rex.W syscall 
  4038f6:	c9                   	leave  
  4038f7:	c3                   	ret    

00000000004038f8 <execve>:
  4038f8:	55                   	push   rbp
  4038f9:	48 89 e5             	mov    rbp,rsp
  4038fc:	b8 1c 00 00 00       	mov    eax,0x1c
  403901:	48 0f 05             	rex.W syscall 
  403904:	c9                   	leave  
  403905:	c3                   	ret    

0000000000403906 <waitpid>:
  403906:	55                   	push   rbp
  403907:	48 89 e5             	mov    rbp,rsp
  40390a:	b8 1d 00 00 00       	mov    eax,0x1d
  40390f:	48 0f 05             	rex.W syscall 
  403912:	c9                   	leave  
  403913:	c3                   	ret    

0000000000403914 <mmap>:
  403914:	55                   	push   rbp
  403915:	48 89 e5             	mov    rbp,rsp
  403918:	b8 1e 00 00 00       	mov    eax,0x1e
  40391d:	48 0f 05             	rex.W syscall 
  403920:	c9                   	leave  
  403921:	c3                   	ret    

0000000000403922 <munmap>:
  403922:	55                   	push   rbp
  403923:	48 89 e5             	mov    rbp,rsp
  403926:	b8 1f 00 00 00       	mov    eax,0x1f
  40392b:	48 0f 05             	rex.W syscall 
  40392e:	c9                   	leave  
  40392f:	c3                   	ret    

0000000000403930 <mknod>:
  403930:	55                   	push   rbp
  403931:	48 89 e5             	mov    rbp,rsp
  403934:	b8 21 00 00 00       	mov    eax,0x21
  403939:	48 0f 05             	rex.W syscall 
  40393c:	c9                   	leave  
  40393d:	c3                   	ret    

000000000040393e <kb_readc>:
  40393e:	55                   	push   rbp
  40393f:	48 89 e5             	mov    rbp,rsp
  403942:	b8 64 00 00 00       	mov    eax,0x64
  403947:	48 0f 05             	rex.W syscall 
  40394a:	c9                   	leave  
  40394b:	c3                   	ret    
