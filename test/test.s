
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
  40103c:	e8 ef 01 00 00       	call   401230 <puts>
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
  4010db:	e8 f0 01 00 00       	call   4012d0 <memset>
        int p = 0;
  4010e0:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        printf("shell:>");
  4010e7:	48 8d 05 25 2f 00 00 	lea    rax,[rip+0x2f25]        # 404013 <kb_readc+0x683>
  4010ee:	48 89 c7             	mov    rdi,rax
  4010f1:	b8 00 00 00 00       	mov    eax,0x0
  4010f6:	e8 d5 23 00 00       	call   4034d0 <printf>
        // write(2, "shell:>", 7);
        gets(cmd);
  4010fb:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  401102:	48 89 c7             	mov    rdi,rax
  401105:	b8 00 00 00 00       	mov    eax,0x0
  40110a:	e8 81 01 00 00       	call   401290 <gets>
        //     if (cmd[p] == '\n') break;
        //     p++;
        //     if (p == 128) p = 0;
        // }
        // cmd[p] = '\0';
        puts(cmd);
  40110f:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  401116:	48 89 c7             	mov    rdi,rax
  401119:	e8 12 01 00 00       	call   401230 <puts>
        // write(2, cmd, p);
        if (strcmp(cmd, "version") == 0) { puts("Gamessis OS 1.0.\n"); }
  40111e:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  401125:	48 8d 15 ef 2e 00 00 	lea    rdx,[rip+0x2eef]        # 40401b <kb_readc+0x68b>
  40112c:	48 89 d6             	mov    rsi,rdx
  40112f:	48 89 c7             	mov    rdi,rax
  401132:	e8 29 02 00 00       	call   401360 <strcmp>
  401137:	85 c0                	test   eax,eax
  401139:	75 14                	jne    40114f <main+0x139>
  40113b:	48 8d 05 e1 2e 00 00 	lea    rax,[rip+0x2ee1]        # 404023 <kb_readc+0x693>
  401142:	48 89 c7             	mov    rdi,rax
  401145:	e8 e6 00 00 00       	call   401230 <puts>
  40114a:	e9 78 ff ff ff       	jmp    4010c7 <main+0xb1>
        else if (strcmp(cmd, "exit") == 0) {
  40114f:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  401156:	48 8d 15 d8 2e 00 00 	lea    rdx,[rip+0x2ed8]        # 404035 <kb_readc+0x6a5>
  40115d:	48 89 d6             	mov    rsi,rdx
  401160:	48 89 c7             	mov    rdi,rax
  401163:	e8 f8 01 00 00       	call   401360 <strcmp>
  401168:	85 c0                	test   eax,eax
  40116a:	0f 84 b2 00 00 00    	je     401222 <main+0x20c>
            break;
        }
        else {
            printf("trying to execute...\n");
  401170:	48 8d 05 c3 2e 00 00 	lea    rax,[rip+0x2ec3]        # 40403a <kb_readc+0x6aa>
  401177:	48 89 c7             	mov    rdi,rax
  40117a:	e8 b1 00 00 00       	call   401230 <puts>
            int pid = 0;
  40117f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
            if ((pid = fork()) == 0) {
  401186:	e8 a5 27 00 00       	call   403930 <fork>
  40118b:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  40118e:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  401192:	75 4d                	jne    4011e1 <main+0x1cb>
                printf("forked, ready to execve\n");
  401194:	48 8d 05 b4 2e 00 00 	lea    rax,[rip+0x2eb4]        # 40404f <kb_readc+0x6bf>
  40119b:	48 89 c7             	mov    rdi,rax
  40119e:	e8 8d 00 00 00       	call   401230 <puts>
                if (execve(cmd, NULL, NULL) == -1) {
  4011a3:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  4011aa:	ba 00 00 00 00       	mov    edx,0x0
  4011af:	be 00 00 00 00       	mov    esi,0x0
  4011b4:	48 89 c7             	mov    rdi,rax
  4011b7:	e8 84 27 00 00       	call   403940 <execve>
  4011bc:	83 f8 ff             	cmp    eax,0xffffffff
  4011bf:	75 20                	jne    4011e1 <main+0x1cb>
                    printf("cannot find file:%s\n", cmd);
  4011c1:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  4011c8:	48 89 c6             	mov    rsi,rax
  4011cb:	48 8d 05 95 2e 00 00 	lea    rax,[rip+0x2e95]        # 404067 <kb_readc+0x6d7>
  4011d2:	48 89 c7             	mov    rdi,rax
  4011d5:	b8 00 00 00 00       	mov    eax,0x0
  4011da:	e8 f1 22 00 00       	call   4034d0 <printf>
  4011df:	eb 42                	jmp    401223 <main+0x20d>
                    break;
                }
            }
            printf("forked. pid=%d\n", pid);
  4011e1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  4011e4:	89 c6                	mov    esi,eax
  4011e6:	48 8d 05 8f 2e 00 00 	lea    rax,[rip+0x2e8f]        # 40407c <kb_readc+0x6ec>
  4011ed:	48 89 c7             	mov    rdi,rax
  4011f0:	b8 00 00 00 00       	mov    eax,0x0
  4011f5:	e8 d6 22 00 00       	call   4034d0 <printf>
            int loc = 0;
  4011fa:	c7 85 6c ff ff ff 00 	mov    DWORD PTR [rbp-0x94],0x0
  401201:	00 00 00 

            waitpid(pid, &loc, 0);
  401204:	48 8d 8d 6c ff ff ff 	lea    rcx,[rbp-0x94]
  40120b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  40120e:	ba 00 00 00 00       	mov    edx,0x0
  401213:	48 89 ce             	mov    rsi,rcx
  401216:	89 c7                	mov    edi,eax
  401218:	e8 33 27 00 00       	call   403950 <waitpid>
    while (1) {
  40121d:	e9 a5 fe ff ff       	jmp    4010c7 <main+0xb1>
            break;
  401222:	90                   	nop
    }


    // do_syscall(SYSCAll_WRITE, 2, (int) "test exe running.\n", 0, 0, 0,0);

    return 0;
  401223:	b8 00 00 00 00       	mov    eax,0x0
  401228:	c9                   	leave  
  401229:	c3                   	ret    
  40122a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000401230 <puts>:
  401230:	f3 0f 1e fa          	endbr64 
  401234:	41 54                	push   r12
  401236:	55                   	push   rbp
  401237:	48 89 fd             	mov    rbp,rdi
  40123a:	53                   	push   rbx
  40123b:	0f be 3f             	movsx  edi,BYTE PTR [rdi]
  40123e:	40 84 ff             	test   dil,dil
  401241:	74 35                	je     401278 <puts+0x48>
  401243:	31 db                	xor    ebx,ebx
  401245:	0f 1f 00             	nop    DWORD PTR [rax]
  401248:	e8 e3 24 00 00       	call   403730 <putchar>
  40124d:	41 89 dc             	mov    r12d,ebx
  401250:	48 83 c3 01          	add    rbx,0x1
  401254:	0f be 7c 1d 00       	movsx  edi,BYTE PTR [rbp+rbx*1+0x0]
  401259:	40 84 ff             	test   dil,dil
  40125c:	75 ea                	jne    401248 <puts+0x18>
  40125e:	bf 0a 00 00 00       	mov    edi,0xa
  401263:	e8 c8 24 00 00       	call   403730 <putchar>
  401268:	41 8d 44 24 02       	lea    eax,[r12+0x2]
  40126d:	5b                   	pop    rbx
  40126e:	5d                   	pop    rbp
  40126f:	41 5c                	pop    r12
  401271:	c3                   	ret    
  401272:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  401278:	5b                   	pop    rbx
  401279:	b8 ff ff ff ff       	mov    eax,0xffffffff
  40127e:	5d                   	pop    rbp
  40127f:	41 5c                	pop    r12
  401281:	c3                   	ret    
  401282:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  401289:	00 00 00 
  40128c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000401290 <gets>:
  401290:	f3 0f 1e fa          	endbr64 
  401294:	41 54                	push   r12
  401296:	49 89 fc             	mov    r12,rdi
  401299:	eb 09                	jmp    4012a4 <gets+0x14>
  40129b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4012a0:	49 83 c4 01          	add    r12,0x1
  4012a4:	31 c0                	xor    eax,eax
  4012a6:	ba 01 00 00 00       	mov    edx,0x1
  4012ab:	4c 89 e6             	mov    rsi,r12
  4012ae:	bf 01 00 00 00       	mov    edi,0x1
  4012b3:	e8 98 25 00 00       	call   403850 <read>
  4012b8:	41 80 3c 24 0a       	cmp    BYTE PTR [r12],0xa
  4012bd:	75 e1                	jne    4012a0 <gets+0x10>
  4012bf:	4c 89 e0             	mov    rax,r12
  4012c2:	41 c6 04 24 00       	mov    BYTE PTR [r12],0x0
  4012c7:	41 5c                	pop    r12
  4012c9:	c3                   	ret    
  4012ca:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000004012d0 <memset>:
  4012d0:	f3 0f 1e fa          	endbr64 
  4012d4:	48 89 f8             	mov    rax,rdi
  4012d7:	48 85 d2             	test   rdx,rdx
  4012da:	74 77                	je     401353 <memset+0x83>
  4012dc:	40 88 74 17 ff       	mov    BYTE PTR [rdi+rdx*1-0x1],sil
  4012e1:	40 88 37             	mov    BYTE PTR [rdi],sil
  4012e4:	48 83 fa 02          	cmp    rdx,0x2
  4012e8:	76 69                	jbe    401353 <memset+0x83>
  4012ea:	40 88 74 17 fe       	mov    BYTE PTR [rdi+rdx*1-0x2],sil
  4012ef:	40 88 77 01          	mov    BYTE PTR [rdi+0x1],sil
  4012f3:	40 88 74 17 fd       	mov    BYTE PTR [rdi+rdx*1-0x3],sil
  4012f8:	40 88 77 02          	mov    BYTE PTR [rdi+0x2],sil
  4012fc:	48 83 fa 06          	cmp    rdx,0x6
  401300:	76 51                	jbe    401353 <memset+0x83>
  401302:	40 88 74 17 fc       	mov    BYTE PTR [rdi+rdx*1-0x4],sil
  401307:	40 88 77 03          	mov    BYTE PTR [rdi+0x3],sil
  40130b:	48 83 fa 08          	cmp    rdx,0x8
  40130f:	76 42                	jbe    401353 <memset+0x83>
  401311:	48 f7 df             	neg    rdi
  401314:	44 0f b6 c6          	movzx  r8d,sil
  401318:	c1 e6 18             	shl    esi,0x18
  40131b:	83 e7 03             	and    edi,0x3
  40131e:	45 89 c1             	mov    r9d,r8d
  401321:	48 8d 0c 38          	lea    rcx,[rax+rdi*1]
  401325:	48 29 fa             	sub    rdx,rdi
  401328:	44 89 c7             	mov    edi,r8d
  40132b:	41 c1 e1 10          	shl    r9d,0x10
  40132f:	c1 e7 08             	shl    edi,0x8
  401332:	48 83 e2 fc          	and    rdx,0xfffffffffffffffc
  401336:	44 09 cf             	or     edi,r9d
  401339:	48 01 ca             	add    rdx,rcx
  40133c:	44 09 c7             	or     edi,r8d
  40133f:	09 fe                	or     esi,edi
  401341:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401348:	89 31                	mov    DWORD PTR [rcx],esi
  40134a:	48 83 c1 04          	add    rcx,0x4
  40134e:	48 39 ca             	cmp    rdx,rcx
  401351:	75 f5                	jne    401348 <memset+0x78>
  401353:	c3                   	ret    
  401354:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40135b:	00 00 00 
  40135e:	66 90                	xchg   ax,ax

0000000000401360 <strcmp>:
  401360:	f3 0f 1e fa          	endbr64 
  401364:	48 39 f7             	cmp    rdi,rsi
  401367:	74 34                	je     40139d <strcmp+0x3d>
  401369:	48 85 ff             	test   rdi,rdi
  40136c:	74 38                	je     4013a6 <strcmp+0x46>
  40136e:	48 85 f6             	test   rsi,rsi
  401371:	74 33                	je     4013a6 <strcmp+0x46>
  401373:	0f b6 17             	movzx  edx,BYTE PTR [rdi]
  401376:	0f be 0e             	movsx  ecx,BYTE PTR [rsi]
  401379:	38 ca                	cmp    dl,cl
  40137b:	75 23                	jne    4013a0 <strcmp+0x40>
  40137d:	b8 01 00 00 00       	mov    eax,0x1
  401382:	eb 15                	jmp    401399 <strcmp+0x39>
  401384:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401388:	0f b6 14 07          	movzx  edx,BYTE PTR [rdi+rax*1]
  40138c:	48 83 c0 01          	add    rax,0x1
  401390:	0f be 4c 06 ff       	movsx  ecx,BYTE PTR [rsi+rax*1-0x1]
  401395:	38 ca                	cmp    dl,cl
  401397:	75 07                	jne    4013a0 <strcmp+0x40>
  401399:	84 d2                	test   dl,dl
  40139b:	75 eb                	jne    401388 <strcmp+0x28>
  40139d:	31 c0                	xor    eax,eax
  40139f:	c3                   	ret    
  4013a0:	0f be c2             	movsx  eax,dl
  4013a3:	29 c8                	sub    eax,ecx
  4013a5:	c3                   	ret    
  4013a6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  4013ab:	c3                   	ret    
  4013ac:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

00000000004013b0 <get_components>:
  4013b0:	66 48 0f 7e c2       	movq   rdx,xmm0
  4013b5:	48 89 f8             	mov    rax,rdi
  4013b8:	48 c1 ea 3f          	shr    rdx,0x3f
  4013bc:	89 d7                	mov    edi,edx
  4013be:	83 e7 01             	and    edi,0x1
  4013c1:	48 85 d2             	test   rdx,rdx
  4013c4:	74 08                	je     4013ce <get_components+0x1e>
  4013c6:	66 0f 57 05 62 2f 00 	xorpd  xmm0,XMMWORD PTR [rip+0x2f62]        # 404330 <powers_of_10+0x90>
  4013cd:	00 
  4013ce:	f2 48 0f 2c c8       	cvttsd2si rcx,xmm0
  4013d3:	66 0f ef d2          	pxor   xmm2,xmm2
  4013d7:	66 0f 28 c8          	movapd xmm1,xmm0
  4013db:	89 f2                	mov    edx,esi
  4013dd:	4c 8d 05 bc 2e 00 00 	lea    r8,[rip+0x2ebc]        # 4042a0 <powers_of_10>
  4013e4:	f2 41 0f 10 1c d0    	movsd  xmm3,QWORD PTR [r8+rdx*8]
  4013ea:	f2 48 0f 2a d1       	cvtsi2sd xmm2,rcx
  4013ef:	f2 0f 5c ca          	subsd  xmm1,xmm2
  4013f3:	66 0f ef d2          	pxor   xmm2,xmm2
  4013f7:	f2 0f 59 cb          	mulsd  xmm1,xmm3
  4013fb:	f2 48 0f 2c d1       	cvttsd2si rdx,xmm1
  401400:	f2 48 0f 2a d2       	cvtsi2sd xmm2,rdx
  401405:	f2 0f 5c ca          	subsd  xmm1,xmm2
  401409:	f2 0f 10 15 2f 2f 00 	movsd  xmm2,QWORD PTR [rip+0x2f2f]        # 404340 <powers_of_10+0xa0>
  401410:	00 
  401411:	66 0f 2f ca          	comisd xmm1,xmm2
  401415:	76 51                	jbe    401468 <get_components+0xb8>
  401417:	48 83 c2 01          	add    rdx,0x1
  40141b:	66 0f ef c9          	pxor   xmm1,xmm1
  40141f:	f2 48 0f 2a ca       	cvtsi2sd xmm1,rdx
  401424:	66 0f 2f cb          	comisd xmm1,xmm3
  401428:	73 56                	jae    401480 <get_components+0xd0>
  40142a:	85 f6                	test   esi,esi
  40142c:	75 27                	jne    401455 <get_components+0xa5>
  40142e:	66 0f ef c9          	pxor   xmm1,xmm1
  401432:	f2 48 0f 2a c9       	cvtsi2sd xmm1,rcx
  401437:	f2 0f 5c c1          	subsd  xmm0,xmm1
  40143b:	66 0f 2f d0          	comisd xmm2,xmm0
  40143f:	76 06                	jbe    401447 <get_components+0x97>
  401441:	66 0f 2f c2          	comisd xmm0,xmm2
  401445:	76 0e                	jbe    401455 <get_components+0xa5>
  401447:	48 89 ce             	mov    rsi,rcx
  40144a:	83 e6 01             	and    esi,0x1
  40144d:	48 83 fe 01          	cmp    rsi,0x1
  401451:	48 83 d9 ff          	sbb    rcx,0xffffffffffffffff
  401455:	48 89 08             	mov    QWORD PTR [rax],rcx
  401458:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
  40145c:	40 88 78 10          	mov    BYTE PTR [rax+0x10],dil
  401460:	c3                   	ret    
  401461:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401468:	66 0f 2e ca          	ucomisd xmm1,xmm2
  40146c:	7a bc                	jp     40142a <get_components+0x7a>
  40146e:	75 ba                	jne    40142a <get_components+0x7a>
  401470:	48 85 d2             	test   rdx,rdx
  401473:	75 1b                	jne    401490 <get_components+0xe0>
  401475:	48 83 c2 01          	add    rdx,0x1
  401479:	eb af                	jmp    40142a <get_components+0x7a>
  40147b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  401480:	48 83 c1 01          	add    rcx,0x1
  401484:	31 d2                	xor    edx,edx
  401486:	eb a2                	jmp    40142a <get_components+0x7a>
  401488:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40148f:	00 
  401490:	f6 c2 01             	test   dl,0x1
  401493:	74 95                	je     40142a <get_components+0x7a>
  401495:	eb de                	jmp    401475 <get_components+0xc5>
  401497:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40149e:	00 00 

00000000004014a0 <putchar_wrapper>:
  4014a0:	f3 0f 1e fa          	endbr64 
  4014a4:	40 0f be ff          	movsx  edi,dil
  4014a8:	e9 a3 22 00 00       	jmp    403750 <putchar_>
  4014ad:	0f 1f 00             	nop    DWORD PTR [rax]

00000000004014b0 <out_rev_>:
  4014b0:	41 57                	push   r15
  4014b2:	44 89 c0             	mov    eax,r8d
  4014b5:	41 56                	push   r14
  4014b7:	41 89 d6             	mov    r14d,edx
  4014ba:	41 55                	push   r13
  4014bc:	49 89 f5             	mov    r13,rsi
  4014bf:	41 54                	push   r12
  4014c1:	41 89 cc             	mov    r12d,ecx
  4014c4:	55                   	push   rbp
  4014c5:	53                   	push   rbx
  4014c6:	48 89 fb             	mov    rbx,rdi
  4014c9:	48 83 ec 18          	sub    rsp,0x18
  4014cd:	44 8b 7f 18          	mov    r15d,DWORD PTR [rdi+0x18]
  4014d1:	44 89 44 24 0c       	mov    DWORD PTR [rsp+0xc],r8d
  4014d6:	a8 03                	test   al,0x3
  4014d8:	75 16                	jne    4014f0 <out_rev_+0x40>
  4014da:	44 89 f8             	mov    eax,r15d
  4014dd:	89 d5                	mov    ebp,edx
  4014df:	39 ca                	cmp    edx,ecx
  4014e1:	0f 82 93 00 00 00    	jb     40157a <out_rev_+0xca>
  4014e7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4014ee:	00 00 
  4014f0:	41 8d 6e ff          	lea    ebp,[r14-0x1]
  4014f4:	4c 01 ed             	add    rbp,r13
  4014f7:	45 85 f6             	test   r14d,r14d
  4014fa:	75 16                	jne    401512 <out_rev_+0x62>
  4014fc:	eb 42                	jmp    401540 <out_rev_+0x90>
  4014fe:	66 90                	xchg   ax,ax
  401500:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  401504:	ff d2                	call   rdx
  401506:	48 8d 45 ff          	lea    rax,[rbp-0x1]
  40150a:	49 39 ed             	cmp    r13,rbp
  40150d:	74 31                	je     401540 <out_rev_+0x90>
  40150f:	48 89 c5             	mov    rbp,rax
  401512:	8b 43 18             	mov    eax,DWORD PTR [rbx+0x18]
  401515:	0f be 7d 00          	movsx  edi,BYTE PTR [rbp+0x0]
  401519:	8d 50 01             	lea    edx,[rax+0x1]
  40151c:	89 53 18             	mov    DWORD PTR [rbx+0x18],edx
  40151f:	3b 43 1c             	cmp    eax,DWORD PTR [rbx+0x1c]
  401522:	73 e2                	jae    401506 <out_rev_+0x56>
  401524:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
  401527:	48 85 d2             	test   rdx,rdx
  40152a:	75 d4                	jne    401500 <out_rev_+0x50>
  40152c:	48 8b 53 10          	mov    rdx,QWORD PTR [rbx+0x10]
  401530:	40 88 3c 02          	mov    BYTE PTR [rdx+rax*1],dil
  401534:	48 8d 45 ff          	lea    rax,[rbp-0x1]
  401538:	49 39 ed             	cmp    r13,rbp
  40153b:	75 d2                	jne    40150f <out_rev_+0x5f>
  40153d:	0f 1f 00             	nop    DWORD PTR [rax]
  401540:	f6 44 24 0c 02       	test   BYTE PTR [rsp+0xc],0x2
  401545:	75 61                	jne    4015a8 <out_rev_+0xf8>
  401547:	48 83 c4 18          	add    rsp,0x18
  40154b:	5b                   	pop    rbx
  40154c:	5d                   	pop    rbp
  40154d:	41 5c                	pop    r12
  40154f:	41 5d                	pop    r13
  401551:	41 5e                	pop    r14
  401553:	41 5f                	pop    r15
  401555:	c3                   	ret    
  401556:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40155d:	00 00 00 
  401560:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  401564:	bf 20 00 00 00       	mov    edi,0x20
  401569:	ff d2                	call   rdx
  40156b:	83 c5 01             	add    ebp,0x1
  40156e:	41 39 ec             	cmp    r12d,ebp
  401571:	0f 84 79 ff ff ff    	je     4014f0 <out_rev_+0x40>
  401577:	8b 43 18             	mov    eax,DWORD PTR [rbx+0x18]
  40157a:	8d 50 01             	lea    edx,[rax+0x1]
  40157d:	89 53 18             	mov    DWORD PTR [rbx+0x18],edx
  401580:	39 43 1c             	cmp    DWORD PTR [rbx+0x1c],eax
  401583:	76 e6                	jbe    40156b <out_rev_+0xbb>
  401585:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
  401588:	48 85 d2             	test   rdx,rdx
  40158b:	75 d3                	jne    401560 <out_rev_+0xb0>
  40158d:	48 8b 53 10          	mov    rdx,QWORD PTR [rbx+0x10]
  401591:	c6 04 02 20          	mov    BYTE PTR [rdx+rax*1],0x20
  401595:	eb d4                	jmp    40156b <out_rev_+0xbb>
  401597:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40159e:	00 00 
  4015a0:	48 8b 53 10          	mov    rdx,QWORD PTR [rbx+0x10]
  4015a4:	c6 04 02 20          	mov    BYTE PTR [rdx+rax*1],0x20
  4015a8:	8b 43 18             	mov    eax,DWORD PTR [rbx+0x18]
  4015ab:	89 c2                	mov    edx,eax
  4015ad:	44 29 fa             	sub    edx,r15d
  4015b0:	41 39 d4             	cmp    r12d,edx
  4015b3:	76 92                	jbe    401547 <out_rev_+0x97>
  4015b5:	8d 48 01             	lea    ecx,[rax+0x1]
  4015b8:	83 c2 01             	add    edx,0x1
  4015bb:	89 4b 18             	mov    DWORD PTR [rbx+0x18],ecx
  4015be:	39 43 1c             	cmp    DWORD PTR [rbx+0x1c],eax
  4015c1:	76 1d                	jbe    4015e0 <out_rev_+0x130>
  4015c3:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
  4015c6:	48 85 d2             	test   rdx,rdx
  4015c9:	74 d5                	je     4015a0 <out_rev_+0xf0>
  4015cb:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
  4015cf:	bf 20 00 00 00       	mov    edi,0x20
  4015d4:	ff d2                	call   rdx
  4015d6:	8b 43 18             	mov    eax,DWORD PTR [rbx+0x18]
  4015d9:	89 c2                	mov    edx,eax
  4015db:	44 29 fa             	sub    edx,r15d
  4015de:	eb d0                	jmp    4015b0 <out_rev_+0x100>
  4015e0:	89 c8                	mov    eax,ecx
  4015e2:	eb cc                	jmp    4015b0 <out_rev_+0x100>
  4015e4:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4015eb:	00 00 00 
  4015ee:	66 90                	xchg   ax,ax

00000000004015f0 <print_integer>:
  4015f0:	41 57                	push   r15
  4015f2:	45 89 c3             	mov    r11d,r8d
  4015f5:	41 56                	push   r14
  4015f7:	41 55                	push   r13
  4015f9:	41 54                	push   r12
  4015fb:	41 89 cc             	mov    r12d,ecx
  4015fe:	55                   	push   rbp
  4015ff:	48 89 fd             	mov    rbp,rdi
  401602:	53                   	push   rbx
  401603:	89 d3                	mov    ebx,edx
  401605:	48 83 ec 28          	sub    rsp,0x28
  401609:	44 8b 44 24 60       	mov    r8d,DWORD PTR [rsp+0x60]
  40160e:	48 85 f6             	test   rsi,rsi
  401611:	0f 85 39 01 00 00    	jne    401750 <print_integer+0x160>
  401617:	41 f7 c0 00 08 00 00 	test   r8d,0x800
  40161e:	0f 85 0c 02 00 00    	jne    401830 <print_integer+0x240>
  401624:	c6 04 24 30          	mov    BYTE PTR [rsp],0x30
  401628:	41 83 e0 ef          	and    r8d,0xffffffef
  40162c:	bf 01 00 00 00       	mov    edi,0x1
  401631:	41 bd 01 00 00 00    	mov    r13d,0x1
  401637:	41 f6 c0 02          	test   r8b,0x2
  40163b:	0f 85 7f 01 00 00    	jne    4017c0 <print_integer+0x1d0>
  401641:	44 89 c0             	mov    eax,r8d
  401644:	83 e0 01             	and    eax,0x1
  401647:	45 85 c9             	test   r9d,r9d
  40164a:	0f 84 70 01 00 00    	je     4017c0 <print_integer+0x1d0>
  401650:	85 c0                	test   eax,eax
  401652:	0f 84 68 01 00 00    	je     4017c0 <print_integer+0x1d0>
  401658:	84 db                	test   bl,bl
  40165a:	0f 85 70 02 00 00    	jne    4018d0 <print_integer+0x2e0>
  401660:	41 f6 c0 0c          	test   r8b,0xc
  401664:	0f 85 66 02 00 00    	jne    4018d0 <print_integer+0x2e0>
  40166a:	45 39 cd             	cmp    r13d,r9d
  40166d:	0f 83 4d 01 00 00    	jae    4017c0 <print_integer+0x1d0>
  401673:	40 84 ff             	test   dil,dil
  401676:	0f 84 44 01 00 00    	je     4017c0 <print_integer+0x1d0>
  40167c:	48 89 e6             	mov    rsi,rsp
  40167f:	44 89 e8             	mov    eax,r13d
  401682:	44 89 ea             	mov    edx,r13d
  401685:	48 01 f0             	add    rax,rsi
  401688:	eb 0a                	jmp    401694 <print_integer+0xa4>
  40168a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  401690:	84 c9                	test   cl,cl
  401692:	74 15                	je     4016a9 <print_integer+0xb9>
  401694:	83 c2 01             	add    edx,0x1
  401697:	c6 00 30             	mov    BYTE PTR [rax],0x30
  40169a:	83 fa 1f             	cmp    edx,0x1f
  40169d:	0f 96 c1             	setbe  cl
  4016a0:	48 83 c0 01          	add    rax,0x1
  4016a4:	44 39 ca             	cmp    edx,r9d
  4016a7:	72 e7                	jb     401690 <print_integer+0xa0>
  4016a9:	41 39 d3             	cmp    r11d,edx
  4016ac:	76 26                	jbe    4016d4 <print_integer+0xe4>
  4016ae:	84 c9                	test   cl,cl
  4016b0:	74 22                	je     4016d4 <print_integer+0xe4>
  4016b2:	89 d0                	mov    eax,edx
  4016b4:	48 01 f0             	add    rax,rsi
  4016b7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4016be:	00 00 
  4016c0:	83 c2 01             	add    edx,0x1
  4016c3:	c6 00 30             	mov    BYTE PTR [rax],0x30
  4016c6:	48 83 c0 01          	add    rax,0x1
  4016ca:	41 39 d3             	cmp    r11d,edx
  4016cd:	76 05                	jbe    4016d4 <print_integer+0xe4>
  4016cf:	83 fa 1f             	cmp    edx,0x1f
  4016d2:	76 ec                	jbe    4016c0 <print_integer+0xd0>
  4016d4:	41 39 d5             	cmp    r13d,edx
  4016d7:	40 0f 92 c7          	setb   dil
  4016db:	41 80 fc 08          	cmp    r12b,0x8
  4016df:	0f 94 c0             	sete   al
  4016e2:	40 20 f8             	and    al,dil
  4016e5:	74 06                	je     4016ed <print_integer+0xfd>
  4016e7:	41 83 e0 ef          	and    r8d,0xffffffef
  4016eb:	89 c7                	mov    edi,eax
  4016ed:	41 f7 c0 10 20 00 00 	test   r8d,0x2010
  4016f4:	0f 84 12 01 00 00    	je     40180c <print_integer+0x21c>
  4016fa:	41 f7 c0 00 08 00 00 	test   r8d,0x800
  401701:	0f 84 d9 00 00 00    	je     4017e0 <print_integer+0x1f0>
  401707:	83 fa 1f             	cmp    edx,0x1f
  40170a:	0f 96 c0             	setbe  al
  40170d:	41 80 fc 10          	cmp    r12b,0x10
  401711:	0f 84 c9 01 00 00    	je     4018e0 <print_integer+0x2f0>
  401717:	41 80 fc 02          	cmp    r12b,0x2
  40171b:	75 0d                	jne    40172a <print_integer+0x13a>
  40171d:	84 c0                	test   al,al
  40171f:	74 09                	je     40172a <print_integer+0x13a>
  401721:	89 d0                	mov    eax,edx
  401723:	83 c2 01             	add    edx,0x1
  401726:	c6 04 04 62          	mov    BYTE PTR [rsp+rax*1],0x62
  40172a:	83 fa 20             	cmp    edx,0x20
  40172d:	0f 85 93 01 00 00    	jne    4018c6 <print_integer+0x2d6>
  401733:	48 89 ef             	mov    rdi,rbp
  401736:	44 89 c9             	mov    ecx,r9d
  401739:	e8 72 fd ff ff       	call   4014b0 <out_rev_>
  40173e:	48 83 c4 28          	add    rsp,0x28
  401742:	5b                   	pop    rbx
  401743:	5d                   	pop    rbp
  401744:	41 5c                	pop    r12
  401746:	41 5d                	pop    r13
  401748:	41 5e                	pop    r14
  40174a:	41 5f                	pop    r15
  40174c:	c3                   	ret    
  40174d:	0f 1f 00             	nop    DWORD PTR [rax]
  401750:	44 89 c0             	mov    eax,r8d
  401753:	44 0f b6 d1          	movzx  r10d,cl
  401757:	4c 8d 7c 24 ff       	lea    r15,[rsp-0x1]
  40175c:	b9 01 00 00 00       	mov    ecx,0x1
  401761:	83 e0 20             	and    eax,0x20
  401764:	83 f8 01             	cmp    eax,0x1
  401767:	45 19 f6             	sbb    r14d,r14d
  40176a:	41 83 e6 20          	and    r14d,0x20
  40176e:	41 83 c6 37          	add    r14d,0x37
  401772:	eb 07                	jmp    40177b <print_integer+0x18b>
  401774:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401778:	48 89 c6             	mov    rsi,rax
  40177b:	31 d2                	xor    edx,edx
  40177d:	48 89 f0             	mov    rax,rsi
  401780:	49 f7 f2             	div    r10
  401783:	44 8d 6a 30          	lea    r13d,[rdx+0x30]
  401787:	48 83 fa 09          	cmp    rdx,0x9
  40178b:	41 8d 3c 16          	lea    edi,[r14+rdx*1]
  40178f:	41 0f 46 fd          	cmovbe edi,r13d
  401793:	83 f9 1f             	cmp    ecx,0x1f
  401796:	41 89 cd             	mov    r13d,ecx
  401799:	0f 96 c2             	setbe  dl
  40179c:	41 88 3c 0f          	mov    BYTE PTR [r15+rcx*1],dil
  4017a0:	89 d7                	mov    edi,edx
  4017a2:	48 83 c1 01          	add    rcx,0x1
  4017a6:	4c 39 d6             	cmp    rsi,r10
  4017a9:	0f 82 88 fe ff ff    	jb     401637 <print_integer+0x47>
  4017af:	84 d2                	test   dl,dl
  4017b1:	75 c5                	jne    401778 <print_integer+0x188>
  4017b3:	41 f6 c0 02          	test   r8b,0x2
  4017b7:	0f 84 84 fe ff ff    	je     401641 <print_integer+0x51>
  4017bd:	0f 1f 00             	nop    DWORD PTR [rax]
  4017c0:	45 39 dd             	cmp    r13d,r11d
  4017c3:	44 89 ea             	mov    edx,r13d
  4017c6:	48 89 e6             	mov    rsi,rsp
  4017c9:	0f 92 c0             	setb   al
  4017cc:	40 20 c7             	and    dil,al
  4017cf:	0f 85 dd fe ff ff    	jne    4016b2 <print_integer+0xc2>
  4017d5:	e9 13 ff ff ff       	jmp    4016ed <print_integer+0xfd>
  4017da:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4017e0:	85 d2                	test   edx,edx
  4017e2:	0f 85 88 00 00 00    	jne    401870 <print_integer+0x280>
  4017e8:	41 80 fc 10          	cmp    r12b,0x10
  4017ec:	0f 84 18 01 00 00    	je     40190a <print_integer+0x31a>
  4017f2:	41 80 fc 02          	cmp    r12b,0x2
  4017f6:	0f 85 30 01 00 00    	jne    40192c <print_integer+0x33c>
  4017fc:	c6 04 24 62          	mov    BYTE PTR [rsp],0x62
  401800:	b8 01 00 00 00       	mov    eax,0x1
  401805:	c6 04 04 30          	mov    BYTE PTR [rsp+rax*1],0x30
  401809:	8d 50 01             	lea    edx,[rax+0x1]
  40180c:	83 fa 20             	cmp    edx,0x20
  40180f:	0f 84 1e ff ff ff    	je     401733 <print_integer+0x143>
  401815:	84 db                	test   bl,bl
  401817:	74 37                	je     401850 <print_integer+0x260>
  401819:	89 d0                	mov    eax,edx
  40181b:	83 c2 01             	add    edx,0x1
  40181e:	c6 04 04 2d          	mov    BYTE PTR [rsp+rax*1],0x2d
  401822:	e9 0c ff ff ff       	jmp    401733 <print_integer+0x143>
  401827:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40182e:	00 00 
  401830:	44 89 c0             	mov    eax,r8d
  401833:	45 31 ed             	xor    r13d,r13d
  401836:	41 83 e0 ef          	and    r8d,0xffffffef
  40183a:	80 f9 10             	cmp    cl,0x10
  40183d:	44 0f 45 c0          	cmovne r8d,eax
  401841:	bf 01 00 00 00       	mov    edi,0x1
  401846:	e9 ec fd ff ff       	jmp    401637 <print_integer+0x47>
  40184b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  401850:	41 f6 c0 04          	test   r8b,0x4
  401854:	75 62                	jne    4018b8 <print_integer+0x2c8>
  401856:	41 f6 c0 08          	test   r8b,0x8
  40185a:	0f 84 d3 fe ff ff    	je     401733 <print_integer+0x143>
  401860:	89 d0                	mov    eax,edx
  401862:	83 c2 01             	add    edx,0x1
  401865:	c6 04 04 20          	mov    BYTE PTR [rsp+rax*1],0x20
  401869:	e9 c5 fe ff ff       	jmp    401733 <print_integer+0x143>
  40186e:	66 90                	xchg   ax,ax
  401870:	41 39 d3             	cmp    r11d,edx
  401873:	74 09                	je     40187e <print_integer+0x28e>
  401875:	44 39 ca             	cmp    edx,r9d
  401878:	0f 85 89 fe ff ff    	jne    401707 <print_integer+0x117>
  40187e:	40 84 ff             	test   dil,dil
  401881:	0f 84 80 fe ff ff    	je     401707 <print_integer+0x117>
  401887:	89 d0                	mov    eax,edx
  401889:	83 e8 01             	sub    eax,0x1
  40188c:	0f 84 56 ff ff ff    	je     4017e8 <print_integer+0x1f8>
  401892:	b9 04 00 01 00       	mov    ecx,0x10004
  401897:	4c 0f a3 e1          	bt     rcx,r12
  40189b:	0f 83 a7 00 00 00    	jae    401948 <print_integer+0x358>
  4018a1:	41 39 c5             	cmp    r13d,eax
  4018a4:	0f 83 9e 00 00 00    	jae    401948 <print_integer+0x358>
  4018aa:	83 ea 02             	sub    edx,0x2
  4018ad:	e9 55 fe ff ff       	jmp    401707 <print_integer+0x117>
  4018b2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4018b8:	89 d0                	mov    eax,edx
  4018ba:	83 c2 01             	add    edx,0x1
  4018bd:	c6 04 04 2b          	mov    BYTE PTR [rsp+rax*1],0x2b
  4018c1:	e9 6d fe ff ff       	jmp    401733 <print_integer+0x143>
  4018c6:	89 d0                	mov    eax,edx
  4018c8:	e9 38 ff ff ff       	jmp    401805 <print_integer+0x215>
  4018cd:	0f 1f 00             	nop    DWORD PTR [rax]
  4018d0:	41 83 e9 01          	sub    r9d,0x1
  4018d4:	e9 91 fd ff ff       	jmp    40166a <print_integer+0x7a>
  4018d9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4018e0:	44 89 c1             	mov    ecx,r8d
  4018e3:	83 e1 20             	and    ecx,0x20
  4018e6:	75 0c                	jne    4018f4 <print_integer+0x304>
  4018e8:	84 c0                	test   al,al
  4018ea:	75 4e                	jne    40193a <print_integer+0x34a>
  4018ec:	85 c9                	test   ecx,ecx
  4018ee:	0f 84 36 fe ff ff    	je     40172a <print_integer+0x13a>
  4018f4:	84 c0                	test   al,al
  4018f6:	0f 84 2e fe ff ff    	je     40172a <print_integer+0x13a>
  4018fc:	89 d0                	mov    eax,edx
  4018fe:	83 c2 01             	add    edx,0x1
  401901:	c6 04 04 58          	mov    BYTE PTR [rsp+rax*1],0x58
  401905:	e9 20 fe ff ff       	jmp    40172a <print_integer+0x13a>
  40190a:	41 f6 c0 20          	test   r8b,0x20
  40190e:	75 0e                	jne    40191e <print_integer+0x32e>
  401910:	c6 04 24 78          	mov    BYTE PTR [rsp],0x78
  401914:	b8 01 00 00 00       	mov    eax,0x1
  401919:	e9 e7 fe ff ff       	jmp    401805 <print_integer+0x215>
  40191e:	c6 04 24 58          	mov    BYTE PTR [rsp],0x58
  401922:	b8 01 00 00 00       	mov    eax,0x1
  401927:	e9 d9 fe ff ff       	jmp    401805 <print_integer+0x215>
  40192c:	c6 04 24 30          	mov    BYTE PTR [rsp],0x30
  401930:	ba 01 00 00 00       	mov    edx,0x1
  401935:	e9 db fe ff ff       	jmp    401815 <print_integer+0x225>
  40193a:	89 d0                	mov    eax,edx
  40193c:	83 c2 01             	add    edx,0x1
  40193f:	c6 04 04 78          	mov    BYTE PTR [rsp+rax*1],0x78
  401943:	e9 e2 fd ff ff       	jmp    40172a <print_integer+0x13a>
  401948:	89 c2                	mov    edx,eax
  40194a:	e9 b8 fd ff ff       	jmp    401707 <print_integer+0x117>
  40194f:	90                   	nop

0000000000401950 <print_broken_up_decimal.isra.0>:
  401950:	41 56                	push   r14
  401952:	49 89 ca             	mov    r10,rcx
  401955:	41 89 d3             	mov    r11d,edx
  401958:	41 55                	push   r13
  40195a:	45 89 c5             	mov    r13d,r8d
  40195d:	41 54                	push   r12
  40195f:	55                   	push   rbp
  401960:	53                   	push   rbx
  401961:	44 8b 44 24 30       	mov    r8d,DWORD PTR [rsp+0x30]
  401966:	48 8b 6c 24 38       	mov    rbp,QWORD PTR [rsp+0x38]
  40196b:	8b 4c 24 40          	mov    ecx,DWORD PTR [rsp+0x40]
  40196f:	45 85 ed             	test   r13d,r13d
  401972:	0f 84 90 00 00 00    	je     401a08 <print_broken_up_decimal.isra.0+0xb8>
  401978:	44 89 c0             	mov    eax,r8d
  40197b:	25 10 10 00 00       	and    eax,0x1010
  401980:	3d 00 10 00 00       	cmp    eax,0x1000
  401985:	0f 84 05 02 00 00    	je     401b90 <print_broken_up_decimal.isra.0+0x240>
  40198b:	41 89 cc             	mov    r12d,ecx
  40198e:	89 cb                	mov    ebx,ecx
  401990:	42 8d 4c 29 ff       	lea    ecx,[rcx+r13*1-0x1]
  401995:	49 bd 67 66 66 66 66 	movabs r13,0x6666666666666667
  40199c:	66 66 66 
  40199f:	49 01 ec             	add    r12,rbp
  4019a2:	eb 43                	jmp    4019e7 <print_broken_up_decimal.isra.0+0x97>
  4019a4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  4019a8:	48 89 f0             	mov    rax,rsi
  4019ab:	41 89 ce             	mov    r14d,ecx
  4019ae:	49 83 c4 01          	add    r12,0x1
  4019b2:	49 f7 ed             	imul   r13
  4019b5:	48 89 f0             	mov    rax,rsi
  4019b8:	41 29 de             	sub    r14d,ebx
  4019bb:	83 c3 01             	add    ebx,0x1
  4019be:	48 c1 f8 3f          	sar    rax,0x3f
  4019c2:	48 c1 fa 02          	sar    rdx,0x2
  4019c6:	48 29 c2             	sub    rdx,rax
  4019c9:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  4019cd:	48 01 c0             	add    rax,rax
  4019d0:	48 29 c6             	sub    rsi,rax
  4019d3:	83 c6 30             	add    esi,0x30
  4019d6:	41 88 74 24 ff       	mov    BYTE PTR [r12-0x1],sil
  4019db:	48 89 d6             	mov    rsi,rdx
  4019de:	48 85 d2             	test   rdx,rdx
  4019e1:	0f 84 f9 00 00 00    	je     401ae0 <print_broken_up_decimal.isra.0+0x190>
  4019e7:	83 fb 20             	cmp    ebx,0x20
  4019ea:	75 bc                	jne    4019a8 <print_broken_up_decimal.isra.0+0x58>
  4019ec:	44 89 c0             	mov    eax,r8d
  4019ef:	83 e0 03             	and    eax,0x3
  4019f2:	83 f8 01             	cmp    eax,0x1
  4019f5:	0f 84 35 01 00 00    	je     401b30 <print_broken_up_decimal.isra.0+0x1e0>
  4019fb:	ba 20 00 00 00       	mov    edx,0x20
  401a00:	e9 7d 00 00 00       	jmp    401a82 <print_broken_up_decimal.isra.0+0x132>
  401a05:	0f 1f 00             	nop    DWORD PTR [rax]
  401a08:	41 f6 c0 10          	test   r8b,0x10
  401a0c:	0f 85 8e 00 00 00    	jne    401aa0 <print_broken_up_decimal.isra.0+0x150>
  401a12:	48 bb 67 66 66 66 66 	movabs rbx,0x6666666666666667
  401a19:	66 66 66 
  401a1c:	89 ce                	mov    esi,ecx
  401a1e:	48 01 ee             	add    rsi,rbp
  401a21:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401a28:	83 f9 20             	cmp    ecx,0x20
  401a2b:	74 bf                	je     4019ec <print_broken_up_decimal.isra.0+0x9c>
  401a2d:	48 89 f8             	mov    rax,rdi
  401a30:	83 c1 01             	add    ecx,0x1
  401a33:	48 83 c6 01          	add    rsi,0x1
  401a37:	48 f7 eb             	imul   rbx
  401a3a:	48 89 f8             	mov    rax,rdi
  401a3d:	48 c1 f8 3f          	sar    rax,0x3f
  401a41:	48 c1 fa 02          	sar    rdx,0x2
  401a45:	48 29 c2             	sub    rdx,rax
  401a48:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  401a4c:	48 01 c0             	add    rax,rax
  401a4f:	48 29 c7             	sub    rdi,rax
  401a52:	83 c7 30             	add    edi,0x30
  401a55:	40 88 7e ff          	mov    BYTE PTR [rsi-0x1],dil
  401a59:	48 89 d7             	mov    rdi,rdx
  401a5c:	48 85 d2             	test   rdx,rdx
  401a5f:	75 c7                	jne    401a28 <print_broken_up_decimal.isra.0+0xd8>
  401a61:	44 89 c0             	mov    eax,r8d
  401a64:	83 e0 03             	and    eax,0x3
  401a67:	83 f8 01             	cmp    eax,0x1
  401a6a:	0f 84 b8 01 00 00    	je     401c28 <print_broken_up_decimal.isra.0+0x2d8>
  401a70:	83 f9 20             	cmp    ecx,0x20
  401a73:	74 86                	je     4019fb <print_broken_up_decimal.isra.0+0xab>
  401a75:	45 84 db             	test   r11b,r11b
  401a78:	74 46                	je     401ac0 <print_broken_up_decimal.isra.0+0x170>
  401a7a:	c6 44 0d 00 2d       	mov    BYTE PTR [rbp+rcx*1+0x0],0x2d
  401a7f:	8d 51 01             	lea    edx,[rcx+0x1]
  401a82:	5b                   	pop    rbx
  401a83:	48 89 ee             	mov    rsi,rbp
  401a86:	44 89 c9             	mov    ecx,r9d
  401a89:	5d                   	pop    rbp
  401a8a:	4c 89 d7             	mov    rdi,r10
  401a8d:	41 5c                	pop    r12
  401a8f:	41 5d                	pop    r13
  401a91:	41 5e                	pop    r14
  401a93:	e9 18 fa ff ff       	jmp    4014b0 <out_rev_>
  401a98:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  401a9f:	00 
  401aa0:	83 f9 20             	cmp    ecx,0x20
  401aa3:	0f 84 43 ff ff ff    	je     4019ec <print_broken_up_decimal.isra.0+0x9c>
  401aa9:	89 c8                	mov    eax,ecx
  401aab:	83 c1 01             	add    ecx,0x1
  401aae:	c6 44 05 00 2e       	mov    BYTE PTR [rbp+rax*1+0x0],0x2e
  401ab3:	e9 5a ff ff ff       	jmp    401a12 <print_broken_up_decimal.isra.0+0xc2>
  401ab8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  401abf:	00 
  401ac0:	41 f6 c0 04          	test   r8b,0x4
  401ac4:	0f 85 3e 01 00 00    	jne    401c08 <print_broken_up_decimal.isra.0+0x2b8>
  401aca:	89 ca                	mov    edx,ecx
  401acc:	41 f6 c0 08          	test   r8b,0x8
  401ad0:	74 b0                	je     401a82 <print_broken_up_decimal.isra.0+0x132>
  401ad2:	c6 44 0d 00 20       	mov    BYTE PTR [rbp+rcx*1+0x0],0x20
  401ad7:	83 c2 01             	add    edx,0x1
  401ada:	eb a6                	jmp    401a82 <print_broken_up_decimal.isra.0+0x132>
  401adc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401ae0:	83 fb 1f             	cmp    ebx,0x1f
  401ae3:	77 13                	ja     401af8 <print_broken_up_decimal.isra.0+0x1a8>
  401ae5:	45 85 f6             	test   r14d,r14d
  401ae8:	89 d8                	mov    eax,ebx
  401aea:	0f 95 c2             	setne  dl
  401aed:	48 01 e8             	add    rax,rbp
  401af0:	84 d2                	test   dl,dl
  401af2:	75 20                	jne    401b14 <print_broken_up_decimal.isra.0+0x1c4>
  401af4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401af8:	83 fb 20             	cmp    ebx,0x20
  401afb:	0f 84 eb fe ff ff    	je     4019ec <print_broken_up_decimal.isra.0+0x9c>
  401b01:	c6 44 1d 00 2e       	mov    BYTE PTR [rbp+rbx*1+0x0],0x2e
  401b06:	8d 4b 01             	lea    ecx,[rbx+0x1]
  401b09:	e9 04 ff ff ff       	jmp    401a12 <print_broken_up_decimal.isra.0+0xc2>
  401b0e:	66 90                	xchg   ax,ax
  401b10:	39 ca                	cmp    edx,ecx
  401b12:	74 e4                	je     401af8 <print_broken_up_decimal.isra.0+0x1a8>
  401b14:	89 da                	mov    edx,ebx
  401b16:	83 c3 01             	add    ebx,0x1
  401b19:	c6 00 30             	mov    BYTE PTR [rax],0x30
  401b1c:	48 83 c0 01          	add    rax,0x1
  401b20:	83 fb 1f             	cmp    ebx,0x1f
  401b23:	76 eb                	jbe    401b10 <print_broken_up_decimal.isra.0+0x1c0>
  401b25:	eb d1                	jmp    401af8 <print_broken_up_decimal.isra.0+0x1a8>
  401b27:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  401b2e:	00 00 
  401b30:	45 85 c9             	test   r9d,r9d
  401b33:	0f 84 c2 fe ff ff    	je     4019fb <print_broken_up_decimal.isra.0+0xab>
  401b39:	31 d2                	xor    edx,edx
  401b3b:	b9 20 00 00 00       	mov    ecx,0x20
  401b40:	45 84 db             	test   r11b,r11b
  401b43:	0f 85 cf 00 00 00    	jne    401c18 <print_broken_up_decimal.isra.0+0x2c8>
  401b49:	41 f6 c0 0c          	test   r8b,0xc
  401b4d:	0f 85 c5 00 00 00    	jne    401c18 <print_broken_up_decimal.isra.0+0x2c8>
  401b53:	44 39 c9             	cmp    ecx,r9d
  401b56:	0f 83 14 ff ff ff    	jae    401a70 <print_broken_up_decimal.isra.0+0x120>
  401b5c:	89 c8                	mov    eax,ecx
  401b5e:	48 01 e8             	add    rax,rbp
  401b61:	84 d2                	test   dl,dl
  401b63:	0f 84 07 ff ff ff    	je     401a70 <print_broken_up_decimal.isra.0+0x120>
  401b69:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401b70:	83 c1 01             	add    ecx,0x1
  401b73:	c6 00 30             	mov    BYTE PTR [rax],0x30
  401b76:	48 83 c0 01          	add    rax,0x1
  401b7a:	44 39 c9             	cmp    ecx,r9d
  401b7d:	0f 83 ed fe ff ff    	jae    401a70 <print_broken_up_decimal.isra.0+0x120>
  401b83:	83 f9 1f             	cmp    ecx,0x1f
  401b86:	76 e8                	jbe    401b70 <print_broken_up_decimal.isra.0+0x220>
  401b88:	e9 e3 fe ff ff       	jmp    401a70 <print_broken_up_decimal.isra.0+0x120>
  401b8d:	0f 1f 00             	nop    DWORD PTR [rax]
  401b90:	48 85 f6             	test   rsi,rsi
  401b93:	0f 8e 79 fe ff ff    	jle    401a12 <print_broken_up_decimal.isra.0+0xc2>
  401b99:	48 bb cd cc cc cc cc 	movabs rbx,0xcccccccccccccccd
  401ba0:	cc cc cc 
  401ba3:	48 89 f0             	mov    rax,rsi
  401ba6:	48 ba 98 99 99 99 99 	movabs rdx,0x1999999999999998
  401bad:	99 99 19 
  401bb0:	48 0f af c3          	imul   rax,rbx
  401bb4:	48 01 d0             	add    rax,rdx
  401bb7:	48 d1 c8             	ror    rax,1
  401bba:	48 39 d0             	cmp    rax,rdx
  401bbd:	0f 87 c8 fd ff ff    	ja     40198b <print_broken_up_decimal.isra.0+0x3b>
  401bc3:	49 be 99 99 99 99 99 	movabs r14,0x1999999999999999
  401bca:	99 99 19 
  401bcd:	0f 1f 00             	nop    DWORD PTR [rax]
  401bd0:	48 89 f0             	mov    rax,rsi
  401bd3:	49 89 f4             	mov    r12,rsi
  401bd6:	41 83 ed 01          	sub    r13d,0x1
  401bda:	48 f7 e3             	mul    rbx
  401bdd:	48 89 d6             	mov    rsi,rdx
  401be0:	48 c1 ee 03          	shr    rsi,0x3
  401be4:	48 89 f0             	mov    rax,rsi
  401be7:	48 0f af c3          	imul   rax,rbx
  401beb:	48 d1 c8             	ror    rax,1
  401bee:	4c 39 f0             	cmp    rax,r14
  401bf1:	76 dd                	jbe    401bd0 <print_broken_up_decimal.isra.0+0x280>
  401bf3:	49 83 fc 09          	cmp    r12,0x9
  401bf7:	0f 8f 8e fd ff ff    	jg     40198b <print_broken_up_decimal.isra.0+0x3b>
  401bfd:	e9 10 fe ff ff       	jmp    401a12 <print_broken_up_decimal.isra.0+0xc2>
  401c02:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  401c08:	c6 44 0d 00 2b       	mov    BYTE PTR [rbp+rcx*1+0x0],0x2b
  401c0d:	8d 51 01             	lea    edx,[rcx+0x1]
  401c10:	e9 6d fe ff ff       	jmp    401a82 <print_broken_up_decimal.isra.0+0x132>
  401c15:	0f 1f 00             	nop    DWORD PTR [rax]
  401c18:	41 83 e9 01          	sub    r9d,0x1
  401c1c:	e9 32 ff ff ff       	jmp    401b53 <print_broken_up_decimal.isra.0+0x203>
  401c21:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401c28:	45 85 c9             	test   r9d,r9d
  401c2b:	0f 84 3f fe ff ff    	je     401a70 <print_broken_up_decimal.isra.0+0x120>
  401c31:	83 f9 1f             	cmp    ecx,0x1f
  401c34:	0f 96 c2             	setbe  dl
  401c37:	e9 04 ff ff ff       	jmp    401b40 <print_broken_up_decimal.isra.0+0x1f0>
  401c3c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000401c40 <print_exponential_number>:
  401c40:	41 57                	push   r15
  401c42:	41 89 f2             	mov    r10d,esi
  401c45:	41 89 cf             	mov    r15d,ecx
  401c48:	4d 89 c3             	mov    r11,r8
  401c4b:	41 56                	push   r14
  401c4d:	41 55                	push   r13
  401c4f:	41 54                	push   r12
  401c51:	49 89 fc             	mov    r12,rdi
  401c54:	55                   	push   rbp
  401c55:	89 d5                	mov    ebp,edx
  401c57:	66 48 0f 7e c2       	movq   rdx,xmm0
  401c5c:	53                   	push   rbx
  401c5d:	48 83 ec 38          	sub    rsp,0x38
  401c61:	48 c1 ea 3f          	shr    rdx,0x3f
  401c65:	74 08                	je     401c6f <print_exponential_number+0x2f>
  401c67:	66 0f 57 05 c1 26 00 	xorpd  xmm0,XMMWORD PTR [rip+0x26c1]        # 404330 <powers_of_10+0x90>
  401c6e:	00 
  401c6f:	44 89 f9             	mov    ecx,r15d
  401c72:	66 0f ef db          	pxor   xmm3,xmm3
  401c76:	81 e1 00 10 00 00    	and    ecx,0x1000
  401c7c:	66 0f 2e c3          	ucomisd xmm0,xmm3
  401c80:	0f 8a 9a 00 00 00    	jp     401d20 <print_exponential_number+0xe0>
  401c86:	0f 85 94 00 00 00    	jne    401d20 <print_exponential_number+0xe0>
  401c8c:	85 c9                	test   ecx,ecx
  401c8e:	0f 85 6c 02 00 00    	jne    401f00 <print_exponential_number+0x2c0>
  401c94:	48 85 d2             	test   rdx,rdx
  401c97:	0f 84 fc 06 00 00    	je     402399 <print_exponential_number+0x759>
  401c9d:	31 c0                	xor    eax,eax
  401c9f:	31 db                	xor    ebx,ebx
  401ca1:	66 0f 57 05 87 26 00 	xorpd  xmm0,XMMWORD PTR [rip+0x2687]        # 404330 <powers_of_10+0x90>
  401ca8:	00 
  401ca9:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  401cae:	44 89 d6             	mov    esi,r10d
  401cb1:	88 44 24 0c          	mov    BYTE PTR [rsp+0xc],al
  401cb5:	e8 f6 f6 ff ff       	call   4013b0 <get_components>
  401cba:	0f b6 44 24 0c       	movzx  eax,BYTE PTR [rsp+0xc]
  401cbf:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  401cc4:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  401cc9:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  401cce:	84 c0                	test   al,al
  401cd0:	0f 84 0a 03 00 00    	je     401fe0 <print_exponential_number+0x3a0>
  401cd6:	41 f7 c7 00 10 00 00 	test   r15d,0x1000
  401cdd:	74 09                	je     401ce8 <print_exponential_number+0xa8>
  401cdf:	83 fb ff             	cmp    ebx,0xffffffff
  401ce2:	0f 8d 48 05 00 00    	jge    402230 <print_exponential_number+0x5f0>
  401ce8:	85 ed                	test   ebp,ebp
  401cea:	0f 84 30 03 00 00    	je     402020 <print_exponential_number+0x3e0>
  401cf0:	48 83 ec 08          	sub    rsp,0x8
  401cf4:	45 89 d0             	mov    r8d,r10d
  401cf7:	4c 89 e1             	mov    rcx,r12
  401cfa:	41 51                	push   r9
  401cfc:	41 89 e9             	mov    r9d,ebp
  401cff:	41 53                	push   r11
  401d01:	41 57                	push   r15
  401d03:	e8 48 fc ff ff       	call   401950 <print_broken_up_decimal.isra.0>
  401d08:	48 83 c4 20          	add    rsp,0x20
  401d0c:	48 83 c4 38          	add    rsp,0x38
  401d10:	5b                   	pop    rbx
  401d11:	5d                   	pop    rbp
  401d12:	41 5c                	pop    r12
  401d14:	41 5d                	pop    r13
  401d16:	41 5e                	pop    r14
  401d18:	41 5f                	pop    r15
  401d1a:	c3                   	ret    
  401d1b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  401d20:	66 48 0f 7e c6       	movq   rsi,xmm0
  401d25:	f2 0f 10 2d 43 26 00 	movsd  xmm5,QWORD PTR [rip+0x2643]        # 404370 <powers_of_10+0xd0>
  401d2c:	00 
  401d2d:	48 b8 ff ff ff ff ff 	movabs rax,0xfffffffffffff
  401d34:	ff 0f 00 
  401d37:	48 bf 00 00 00 00 00 	movabs rdi,0x3ff0000000000000
  401d3e:	00 f0 3f 
  401d41:	48 21 f0             	and    rax,rsi
  401d44:	f2 0f 10 15 14 26 00 	movsd  xmm2,QWORD PTR [rip+0x2614]        # 404360 <powers_of_10+0xc0>
  401d4b:	00 
  401d4c:	48 c1 ee 34          	shr    rsi,0x34
  401d50:	48 09 f8             	or     rax,rdi
  401d53:	81 e6 ff 07 00 00    	and    esi,0x7ff
  401d59:	66 48 0f 6e c8       	movq   xmm1,rax
  401d5e:	f2 0f 5c 0d f2 25 00 	subsd  xmm1,QWORD PTR [rip+0x25f2]        # 404358 <powers_of_10+0xb8>
  401d65:	00 
  401d66:	81 ee ff 03 00 00    	sub    esi,0x3ff
  401d6c:	f2 0f 59 d1          	mulsd  xmm2,xmm1
  401d70:	66 0f 28 e1          	movapd xmm4,xmm1
  401d74:	f2 0f 59 e1          	mulsd  xmm4,xmm1
  401d78:	f2 0f 58 15 e8 25 00 	addsd  xmm2,QWORD PTR [rip+0x25e8]        # 404368 <powers_of_10+0xc8>
  401d7f:	00 
  401d80:	f2 0f 59 ec          	mulsd  xmm5,xmm4
  401d84:	f2 0f 59 cc          	mulsd  xmm1,xmm4
  401d88:	f2 0f 59 0d e8 25 00 	mulsd  xmm1,QWORD PTR [rip+0x25e8]        # 404378 <powers_of_10+0xd8>
  401d8f:	00 
  401d90:	f2 0f 5c d5          	subsd  xmm2,xmm5
  401d94:	f2 0f 58 ca          	addsd  xmm1,xmm2
  401d98:	66 0f ef d2          	pxor   xmm2,xmm2
  401d9c:	f2 0f 2a d6          	cvtsi2sd xmm2,esi
  401da0:	f2 0f 59 15 d8 25 00 	mulsd  xmm2,QWORD PTR [rip+0x25d8]        # 404380 <powers_of_10+0xe0>
  401da7:	00 
  401da8:	f2 0f 58 ca          	addsd  xmm1,xmm2
  401dac:	66 0f 2f cb          	comisd xmm1,xmm3
  401db0:	f2 0f 2c d9          	cvttsd2si ebx,xmm1
  401db4:	73 18                	jae    401dce <print_exponential_number+0x18e>
  401db6:	66 0f ef d2          	pxor   xmm2,xmm2
  401dba:	f2 0f 2a d3          	cvtsi2sd xmm2,ebx
  401dbe:	66 0f 2e ca          	ucomisd xmm1,xmm2
  401dc2:	0f 8a 98 04 00 00    	jp     402260 <print_exponential_number+0x620>
  401dc8:	0f 85 92 04 00 00    	jne    402260 <print_exponential_number+0x620>
  401dce:	81 fb cc fe ff ff    	cmp    ebx,0xfffffecc
  401dd4:	0f 84 16 05 00 00    	je     4022f0 <print_exponential_number+0x6b0>
  401dda:	66 0f ef d2          	pxor   xmm2,xmm2
  401dde:	f2 0f 10 0d a2 25 00 	movsd  xmm1,QWORD PTR [rip+0x25a2]        # 404388 <powers_of_10+0xe8>
  401de5:	00 
  401de6:	66 0f ef e4          	pxor   xmm4,xmm4
  401dea:	f2 0f 2a d3          	cvtsi2sd xmm2,ebx
  401dee:	f2 0f 59 ca          	mulsd  xmm1,xmm2
  401df2:	f2 0f 58 0d 46 25 00 	addsd  xmm1,QWORD PTR [rip+0x2546]        # 404340 <powers_of_10+0xa0>
  401df9:	00 
  401dfa:	f2 0f 2c c1          	cvttsd2si eax,xmm1
  401dfe:	66 0f 2f cb          	comisd xmm1,xmm3
  401e02:	f2 0f 2a e0          	cvtsi2sd xmm4,eax
  401e06:	73 10                	jae    401e18 <print_exponential_number+0x1d8>
  401e08:	66 0f 2e cc          	ucomisd xmm1,xmm4
  401e0c:	0f 8a ce 04 00 00    	jp     4022e0 <print_exponential_number+0x6a0>
  401e12:	0f 85 c8 04 00 00    	jne    4022e0 <print_exponential_number+0x6a0>
  401e18:	f2 0f 59 25 78 25 00 	mulsd  xmm4,QWORD PTR [rip+0x2578]        # 404398 <powers_of_10+0xf8>
  401e1f:	00 
  401e20:	f2 0f 10 35 80 25 00 	movsd  xmm6,QWORD PTR [rip+0x2580]        # 4043a8 <powers_of_10+0x108>
  401e27:	00 
  401e28:	48 98                	cdqe   
  401e2a:	f2 0f 59 15 5e 25 00 	mulsd  xmm2,QWORD PTR [rip+0x255e]        # 404390 <powers_of_10+0xf0>
  401e31:	00 
  401e32:	48 05 ff 03 00 00    	add    rax,0x3ff
  401e38:	48 c1 e0 34          	shl    rax,0x34
  401e3c:	66 48 0f 6e f8       	movq   xmm7,rax
  401e41:	f2 0f 5c d4          	subsd  xmm2,xmm4
  401e45:	66 0f 28 da          	movapd xmm3,xmm2
  401e49:	66 0f 28 ca          	movapd xmm1,xmm2
  401e4d:	f2 0f 59 da          	mulsd  xmm3,xmm2
  401e51:	f2 0f 58 ca          	addsd  xmm1,xmm2
  401e55:	66 0f 28 eb          	movapd xmm5,xmm3
  401e59:	f2 0f 5e 2d 3f 25 00 	divsd  xmm5,QWORD PTR [rip+0x253f]        # 4043a0 <powers_of_10+0x100>
  401e60:	00 
  401e61:	f2 0f 58 ee          	addsd  xmm5,xmm6
  401e65:	66 0f 28 e3          	movapd xmm4,xmm3
  401e69:	f2 0f 5e e5          	divsd  xmm4,xmm5
  401e6d:	f2 0f 58 25 3b 25 00 	addsd  xmm4,QWORD PTR [rip+0x253b]        # 4043b0 <powers_of_10+0x110>
  401e74:	00 
  401e75:	f2 0f 5e dc          	divsd  xmm3,xmm4
  401e79:	f2 0f 10 25 37 25 00 	movsd  xmm4,QWORD PTR [rip+0x2537]        # 4043b8 <powers_of_10+0x118>
  401e80:	00 
  401e81:	f2 0f 5c e2          	subsd  xmm4,xmm2
  401e85:	f2 0f 58 dc          	addsd  xmm3,xmm4
  401e89:	f2 0f 5e cb          	divsd  xmm1,xmm3
  401e8d:	f2 0f 58 0d 2b 25 00 	addsd  xmm1,QWORD PTR [rip+0x252b]        # 4043c0 <powers_of_10+0x120>
  401e94:	00 
  401e95:	f2 0f 59 cf          	mulsd  xmm1,xmm7
  401e99:	66 0f 2f c8          	comisd xmm1,xmm0
  401e9d:	0f 87 7d 03 00 00    	ja     402220 <print_exponential_number+0x5e0>
  401ea3:	8d 43 11             	lea    eax,[rbx+0x11]
  401ea6:	31 f6                	xor    esi,esi
  401ea8:	83 f8 22             	cmp    eax,0x22
  401eab:	77 1a                	ja     401ec7 <print_exponential_number+0x287>
  401ead:	89 d8                	mov    eax,ebx
  401eaf:	48 8d 35 ea 23 00 00 	lea    rsi,[rip+0x23ea]        # 4042a0 <powers_of_10>
  401eb6:	f7 d8                	neg    eax
  401eb8:	0f 48 c3             	cmovs  eax,ebx
  401ebb:	48 98                	cdqe   
  401ebd:	f2 0f 10 0c c6       	movsd  xmm1,QWORD PTR [rsi+rax*8]
  401ec2:	be 01 00 00 00       	mov    esi,0x1
  401ec7:	89 d8                	mov    eax,ebx
  401ec9:	c1 e8 1f             	shr    eax,0x1f
  401ecc:	21 c6                	and    esi,eax
  401ece:	85 db                	test   ebx,ebx
  401ed0:	40 0f 94 c7          	sete   dil
  401ed4:	31 c0                	xor    eax,eax
  401ed6:	85 c9                	test   ecx,ecx
  401ed8:	74 5f                	je     401f39 <print_exponential_number+0x2f9>
  401eda:	45 85 d2             	test   r10d,r10d
  401edd:	b8 01 00 00 00       	mov    eax,0x1
  401ee2:	41 0f 45 c2          	cmovne eax,r10d
  401ee6:	39 c3                	cmp    ebx,eax
  401ee8:	0f 9c c0             	setl   al
  401eeb:	83 fb fc             	cmp    ebx,0xfffffffc
  401eee:	0f 9d c1             	setge  cl
  401ef1:	21 c8                	and    eax,ecx
  401ef3:	09 c7                	or     edi,eax
  401ef5:	eb 23                	jmp    401f1a <print_exponential_number+0x2da>
  401ef7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  401efe:	00 00 
  401f00:	45 85 d2             	test   r10d,r10d
  401f03:	b8 01 00 00 00       	mov    eax,0x1
  401f08:	bf 01 00 00 00       	mov    edi,0x1
  401f0d:	41 0f 45 c2          	cmovne eax,r10d
  401f11:	85 c0                	test   eax,eax
  401f13:	0f 9f c0             	setg   al
  401f16:	31 f6                	xor    esi,esi
  401f18:	31 db                	xor    ebx,ebx
  401f1a:	41 83 ea 01          	sub    r10d,0x1
  401f1e:	44 89 d1             	mov    ecx,r10d
  401f21:	29 d9                	sub    ecx,ebx
  401f23:	84 c0                	test   al,al
  401f25:	44 0f 45 d1          	cmovne r10d,ecx
  401f29:	31 c9                	xor    ecx,ecx
  401f2b:	45 85 d2             	test   r10d,r10d
  401f2e:	44 0f 48 d1          	cmovs  r10d,ecx
  401f32:	41 81 cf 00 08 00 00 	or     r15d,0x800
  401f39:	40 84 ff             	test   dil,dil
  401f3c:	0f 85 c6 02 00 00    	jne    402208 <print_exponential_number+0x5c8>
  401f42:	44 89 d1             	mov    ecx,r10d
  401f45:	29 d9                	sub    ecx,ebx
  401f47:	40 84 f6             	test   sil,sil
  401f4a:	0f 84 28 02 00 00    	je     402178 <print_exponential_number+0x538>
  401f50:	66 0f 28 d0          	movapd xmm2,xmm0
  401f54:	f2 0f 59 d1          	mulsd  xmm2,xmm1
  401f58:	81 f9 32 01 00 00    	cmp    ecx,0x132
  401f5e:	0f 8f ac 03 00 00    	jg     402310 <print_exponential_number+0x6d0>
  401f64:	f2 48 0f 2c fa       	cvttsd2si rdi,xmm2
  401f69:	66 0f ef d2          	pxor   xmm2,xmm2
  401f6d:	66 0f 28 d9          	movapd xmm3,xmm1
  401f71:	44 89 d1             	mov    ecx,r10d
  401f74:	48 8d 35 25 23 00 00 	lea    rsi,[rip+0x2325]        # 4042a0 <powers_of_10>
  401f7b:	f2 48 0f 2a d7       	cvtsi2sd xmm2,rdi
  401f80:	f2 0f 5e d1          	divsd  xmm2,xmm1
  401f84:	f2 0f 5c c2          	subsd  xmm0,xmm2
  401f88:	f2 0f 10 14 ce       	movsd  xmm2,QWORD PTR [rsi+rcx*8]
  401f8d:	f2 0f 59 da          	mulsd  xmm3,xmm2
  401f91:	f2 0f 59 c3          	mulsd  xmm0,xmm3
  401f95:	f2 48 0f 2c c8       	cvttsd2si rcx,xmm0
  401f9a:	66 0f ef c9          	pxor   xmm1,xmm1
  401f9e:	31 f6                	xor    esi,esi
  401fa0:	f2 48 0f 2a c9       	cvtsi2sd xmm1,rcx
  401fa5:	f2 0f 5c c1          	subsd  xmm0,xmm1
  401fa9:	66 0f 2f 05 8f 23 00 	comisd xmm0,QWORD PTR [rip+0x238f]        # 404340 <powers_of_10+0xa0>
  401fb0:	00 
  401fb1:	40 0f 93 c6          	setae  sil
  401fb5:	48 01 ce             	add    rsi,rcx
  401fb8:	66 0f 2e 05 80 23 00 	ucomisd xmm0,QWORD PTR [rip+0x2380]        # 404340 <powers_of_10+0xa0>
  401fbf:	00 
  401fc0:	7a 06                	jp     401fc8 <print_exponential_number+0x388>
  401fc2:	75 04                	jne    401fc8 <print_exponential_number+0x388>
  401fc4:	48 83 e6 fe          	and    rsi,0xfffffffffffffffe
  401fc8:	66 0f ef c0          	pxor   xmm0,xmm0
  401fcc:	f2 48 0f 2a c6       	cvtsi2sd xmm0,rsi
  401fd1:	66 0f 2f c2          	comisd xmm0,xmm2
  401fd5:	72 06                	jb     401fdd <print_exponential_number+0x39d>
  401fd7:	48 83 c7 01          	add    rdi,0x1
  401fdb:	31 f6                	xor    esi,esi
  401fdd:	83 e2 01             	and    edx,0x1
  401fe0:	48 83 ff 09          	cmp    rdi,0x9
  401fe4:	7e 0a                	jle    401ff0 <print_exponential_number+0x3b0>
  401fe6:	83 c3 01             	add    ebx,0x1
  401fe9:	31 f6                	xor    esi,esi
  401feb:	bf 01 00 00 00       	mov    edi,0x1
  401ff0:	45 89 fe             	mov    r14d,r15d
  401ff3:	8d 4b 63             	lea    ecx,[rbx+0x63]
  401ff6:	41 83 e6 02          	and    r14d,0x2
  401ffa:	81 f9 c6 00 00 00    	cmp    ecx,0xc6
  402000:	77 4e                	ja     402050 <print_exponential_number+0x410>
  402002:	45 85 f6             	test   r14d,r14d
  402005:	0f 85 c5 02 00 00    	jne    4022d0 <print_exponential_number+0x690>
  40200b:	41 be 04 00 00 00    	mov    r14d,0x4
  402011:	e9 68 02 00 00       	jmp    40227e <print_exponential_number+0x63e>
  402016:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40201d:	00 00 00 
  402020:	48 83 ec 08          	sub    rsp,0x8
  402024:	4c 89 e1             	mov    rcx,r12
  402027:	45 89 d0             	mov    r8d,r10d
  40202a:	41 51                	push   r9
  40202c:	45 31 c9             	xor    r9d,r9d
  40202f:	41 53                	push   r11
  402031:	41 57                	push   r15
  402033:	e8 18 f9 ff ff       	call   401950 <print_broken_up_decimal.isra.0>
  402038:	48 83 c4 20          	add    rsp,0x20
  40203c:	48 83 c4 38          	add    rsp,0x38
  402040:	5b                   	pop    rbx
  402041:	5d                   	pop    rbp
  402042:	41 5c                	pop    r12
  402044:	41 5d                	pop    r13
  402046:	41 5e                	pop    r14
  402048:	41 5f                	pop    r15
  40204a:	c3                   	ret    
  40204b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  402050:	45 85 f6             	test   r14d,r14d
  402053:	0f 84 1f 02 00 00    	je     402278 <print_exponential_number+0x638>
  402059:	b8 04 00 00 00       	mov    eax,0x4
  40205e:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  402062:	48 83 ec 08          	sub    rsp,0x8
  402066:	45 89 d0             	mov    r8d,r10d
  402069:	4c 89 e1             	mov    rcx,r12
  40206c:	41 51                	push   r9
  40206e:	45 31 c9             	xor    r9d,r9d
  402071:	45 8b 6c 24 18       	mov    r13d,DWORD PTR [r12+0x18]
  402076:	41 53                	push   r11
  402078:	41 57                	push   r15
  40207a:	e8 d1 f8 ff ff       	call   401950 <print_broken_up_decimal.isra.0>
  40207f:	8b 44 24 2c          	mov    eax,DWORD PTR [rsp+0x2c]
  402083:	48 83 c4 20          	add    rsp,0x20
  402087:	41 83 e7 20          	and    r15d,0x20
  40208b:	41 8b 4c 24 18       	mov    ecx,DWORD PTR [r12+0x18]
  402090:	41 83 ff 01          	cmp    r15d,0x1
  402094:	19 d2                	sbb    edx,edx
  402096:	8d 71 01             	lea    esi,[rcx+0x1]
  402099:	83 e2 20             	and    edx,0x20
  40209c:	41 89 74 24 18       	mov    DWORD PTR [r12+0x18],esi
  4020a1:	83 c2 45             	add    edx,0x45
  4020a4:	41 83 ff 01          	cmp    r15d,0x1
  4020a8:	19 ff                	sbb    edi,edi
  4020aa:	83 e7 20             	and    edi,0x20
  4020ad:	83 c7 45             	add    edi,0x45
  4020b0:	41 3b 4c 24 1c       	cmp    ecx,DWORD PTR [r12+0x1c]
  4020b5:	73 1d                	jae    4020d4 <print_exponential_number+0x494>
  4020b7:	4d 8b 04 24          	mov    r8,QWORD PTR [r12]
  4020bb:	4d 85 c0             	test   r8,r8
  4020be:	0f 84 bc 02 00 00    	je     402380 <print_exponential_number+0x740>
  4020c4:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  4020c8:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  4020cd:	41 ff d0             	call   r8
  4020d0:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
  4020d4:	48 63 d3             	movsxd rdx,ebx
  4020d7:	41 89 da             	mov    r10d,ebx
  4020da:	41 89 c1             	mov    r9d,eax
  4020dd:	b9 0a 00 00 00       	mov    ecx,0xa
  4020e2:	48 89 d6             	mov    rsi,rdx
  4020e5:	41 c1 ea 1f          	shr    r10d,0x1f
  4020e9:	4c 89 e7             	mov    rdi,r12
  4020ec:	48 f7 de             	neg    rsi
  4020ef:	85 db                	test   ebx,ebx
  4020f1:	48 0f 4f f2          	cmovg  rsi,rdx
  4020f5:	48 83 ec 08          	sub    rsp,0x8
  4020f9:	44 89 d2             	mov    edx,r10d
  4020fc:	45 31 c0             	xor    r8d,r8d
  4020ff:	6a 05                	push   0x5
  402101:	e8 ea f4 ff ff       	call   4015f0 <print_integer>
  402106:	58                   	pop    rax
  402107:	5a                   	pop    rdx
  402108:	45 85 f6             	test   r14d,r14d
  40210b:	0f 84 fb fb ff ff    	je     401d0c <print_exponential_number+0xcc>
  402111:	41 8b 44 24 18       	mov    eax,DWORD PTR [r12+0x18]
  402116:	89 c2                	mov    edx,eax
  402118:	44 29 ea             	sub    edx,r13d
  40211b:	39 d5                	cmp    ebp,edx
  40211d:	0f 86 e9 fb ff ff    	jbe    401d0c <print_exponential_number+0xcc>
  402123:	8d 48 01             	lea    ecx,[rax+0x1]
  402126:	83 c2 01             	add    edx,0x1
  402129:	41 89 4c 24 18       	mov    DWORD PTR [r12+0x18],ecx
  40212e:	41 39 44 24 1c       	cmp    DWORD PTR [r12+0x1c],eax
  402133:	0f 86 17 02 00 00    	jbe    402350 <print_exponential_number+0x710>
  402139:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
  40213d:	48 85 d2             	test   rdx,rdx
  402140:	0f 84 1a 02 00 00    	je     402360 <print_exponential_number+0x720>
  402146:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  40214b:	bf 20 00 00 00       	mov    edi,0x20
  402150:	ff d2                	call   rdx
  402152:	41 8b 44 24 18       	mov    eax,DWORD PTR [r12+0x18]
  402157:	89 c2                	mov    edx,eax
  402159:	44 29 ea             	sub    edx,r13d
  40215c:	eb bd                	jmp    40211b <print_exponential_number+0x4db>
  40215e:	66 90                	xchg   ax,ax
  402160:	85 c9                	test   ecx,ecx
  402162:	0f 85 28 02 00 00    	jne    402390 <print_exponential_number+0x750>
  402168:	41 8d 8a 34 01 00 00 	lea    ecx,[r10+0x134]
  40216f:	31 c0                	xor    eax,eax
  402171:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  402178:	66 0f 28 d0          	movapd xmm2,xmm0
  40217c:	f2 0f 5e d1          	divsd  xmm2,xmm1
  402180:	81 f9 32 01 00 00    	cmp    ecx,0x132
  402186:	0f 8f 84 01 00 00    	jg     402310 <print_exponential_number+0x6d0>
  40218c:	f2 48 0f 2c fa       	cvttsd2si rdi,xmm2
  402191:	66 0f ef d2          	pxor   xmm2,xmm2
  402195:	44 89 d1             	mov    ecx,r10d
  402198:	48 8d 35 01 21 00 00 	lea    rsi,[rip+0x2101]        # 4042a0 <powers_of_10>
  40219f:	f2 48 0f 2a d7       	cvtsi2sd xmm2,rdi
  4021a4:	f2 0f 59 d1          	mulsd  xmm2,xmm1
  4021a8:	f2 0f 5c c2          	subsd  xmm0,xmm2
  4021ac:	f2 0f 10 14 ce       	movsd  xmm2,QWORD PTR [rsi+rcx*8]
  4021b1:	66 48 0f 7e c9       	movq   rcx,xmm1
  4021b6:	48 c1 e9 34          	shr    rcx,0x34
  4021ba:	81 e1 ff 07 00 00    	and    ecx,0x7ff
  4021c0:	81 e9 ff 03 00 00    	sub    ecx,0x3ff
  4021c6:	89 ce                	mov    esi,ecx
  4021c8:	f7 de                	neg    esi
  4021ca:	0f 48 f1             	cmovs  esi,ecx
  4021cd:	66 48 0f 7e d1       	movq   rcx,xmm2
  4021d2:	48 c1 e9 34          	shr    rcx,0x34
  4021d6:	81 e1 ff 07 00 00    	and    ecx,0x7ff
  4021dc:	81 e9 ff 03 00 00    	sub    ecx,0x3ff
  4021e2:	41 89 c8             	mov    r8d,ecx
  4021e5:	41 f7 d8             	neg    r8d
  4021e8:	41 0f 49 c8          	cmovns ecx,r8d
  4021ec:	39 ce                	cmp    esi,ecx
  4021ee:	0f 8f 7c 01 00 00    	jg     402370 <print_exponential_number+0x730>
  4021f4:	66 0f 28 da          	movapd xmm3,xmm2
  4021f8:	f2 0f 5e d9          	divsd  xmm3,xmm1
  4021fc:	e9 90 fd ff ff       	jmp    401f91 <print_exponential_number+0x351>
  402201:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  402208:	48 85 d2             	test   rdx,rdx
  40220b:	0f 84 98 fa ff ff    	je     401ca9 <print_exponential_number+0x69>
  402211:	e9 8b fa ff ff       	jmp    401ca1 <print_exponential_number+0x61>
  402216:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40221d:	00 00 00 
  402220:	f2 0f 5e ce          	divsd  xmm1,xmm6
  402224:	83 eb 01             	sub    ebx,0x1
  402227:	e9 77 fc ff ff       	jmp    401ea3 <print_exponential_number+0x263>
  40222c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402230:	83 c3 01             	add    ebx,0x1
  402233:	66 0f ef c0          	pxor   xmm0,xmm0
  402237:	48 8d 05 62 20 00 00 	lea    rax,[rip+0x2062]        # 4042a0 <powers_of_10>
  40223e:	48 63 db             	movsxd rbx,ebx
  402241:	f2 48 0f 2a c7       	cvtsi2sd xmm0,rdi
  402246:	66 0f 2e 04 d8       	ucomisd xmm0,QWORD PTR [rax+rbx*8]
  40224b:	0f 8a 97 fa ff ff    	jp     401ce8 <print_exponential_number+0xa8>
  402251:	0f 85 91 fa ff ff    	jne    401ce8 <print_exponential_number+0xa8>
  402257:	41 83 ea 01          	sub    r10d,0x1
  40225b:	e9 88 fa ff ff       	jmp    401ce8 <print_exponential_number+0xa8>
  402260:	83 eb 01             	sub    ebx,0x1
  402263:	81 fb cc fe ff ff    	cmp    ebx,0xfffffecc
  402269:	0f 85 6b fb ff ff    	jne    401dda <print_exponential_number+0x19a>
  40226f:	eb 7f                	jmp    4022f0 <print_exponential_number+0x6b0>
  402271:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  402278:	41 be 05 00 00 00    	mov    r14d,0x5
  40227e:	89 e9                	mov    ecx,ebp
  402280:	45 31 c0             	xor    r8d,r8d
  402283:	88 44 24 0c          	mov    BYTE PTR [rsp+0xc],al
  402287:	45 8b 6c 24 18       	mov    r13d,DWORD PTR [r12+0x18]
  40228c:	44 29 f1             	sub    ecx,r14d
  40228f:	44 39 f5             	cmp    ebp,r14d
  402292:	41 0f 46 c8          	cmovbe ecx,r8d
  402296:	48 83 ec 08          	sub    rsp,0x8
  40229a:	45 89 d0             	mov    r8d,r10d
  40229d:	41 51                	push   r9
  40229f:	41 53                	push   r11
  4022a1:	41 89 c9             	mov    r9d,ecx
  4022a4:	4c 89 e1             	mov    rcx,r12
  4022a7:	41 57                	push   r15
  4022a9:	e8 a2 f6 ff ff       	call   401950 <print_broken_up_decimal.isra.0>
  4022ae:	0f b6 44 24 2c       	movzx  eax,BYTE PTR [rsp+0x2c]
  4022b3:	48 83 c4 20          	add    rsp,0x20
  4022b7:	84 c0                	test   al,al
  4022b9:	0f 85 4d fa ff ff    	jne    401d0c <print_exponential_number+0xcc>
  4022bf:	41 8d 46 ff          	lea    eax,[r14-0x1]
  4022c3:	45 31 f6             	xor    r14d,r14d
  4022c6:	e9 bc fd ff ff       	jmp    402087 <print_exponential_number+0x447>
  4022cb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4022d0:	b8 03 00 00 00       	mov    eax,0x3
  4022d5:	e9 84 fd ff ff       	jmp    40205e <print_exponential_number+0x41e>
  4022da:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4022e0:	83 e8 01             	sub    eax,0x1
  4022e3:	66 0f ef e4          	pxor   xmm4,xmm4
  4022e7:	f2 0f 2a e0          	cvtsi2sd xmm4,eax
  4022eb:	e9 28 fb ff ff       	jmp    401e18 <print_exponential_number+0x1d8>
  4022f0:	f2 0f 10 0d 58 20 00 	movsd  xmm1,QWORD PTR [rip+0x2058]        # 404350 <powers_of_10+0xb0>
  4022f7:	00 
  4022f8:	66 0f 2f c8          	comisd xmm1,xmm0
  4022fc:	0f 86 5e fe ff ff    	jbe    402160 <print_exponential_number+0x520>
  402302:	f2 0f 10 0d 3e 20 00 	movsd  xmm1,QWORD PTR [rip+0x203e]        # 404348 <powers_of_10+0xa8>
  402309:	00 
  40230a:	e9 15 ff ff ff       	jmp    402224 <print_exponential_number+0x5e4>
  40230f:	90                   	nop
  402310:	48 85 d2             	test   rdx,rdx
  402313:	74 08                	je     40231d <print_exponential_number+0x6dd>
  402315:	66 0f 57 15 13 20 00 	xorpd  xmm2,XMMWORD PTR [rip+0x2013]        # 404330 <powers_of_10+0x90>
  40231c:	00 
  40231d:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  402322:	44 89 d6             	mov    esi,r10d
  402325:	66 0f 28 c2          	movapd xmm0,xmm2
  402329:	88 44 24 0c          	mov    BYTE PTR [rsp+0xc],al
  40232d:	e8 7e f0 ff ff       	call   4013b0 <get_components>
  402332:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  402337:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  40233c:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  402341:	0f b6 44 24 0c       	movzx  eax,BYTE PTR [rsp+0xc]
  402346:	e9 95 fc ff ff       	jmp    401fe0 <print_exponential_number+0x3a0>
  40234b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  402350:	89 c8                	mov    eax,ecx
  402352:	e9 c4 fd ff ff       	jmp    40211b <print_exponential_number+0x4db>
  402357:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40235e:	00 00 
  402360:	49 8b 54 24 10       	mov    rdx,QWORD PTR [r12+0x10]
  402365:	c6 04 02 20          	mov    BYTE PTR [rdx+rax*1],0x20
  402369:	e9 a3 fd ff ff       	jmp    402111 <print_exponential_number+0x4d1>
  40236e:	66 90                	xchg   ax,ax
  402370:	f2 0f 5e ca          	divsd  xmm1,xmm2
  402374:	f2 0f 5e c1          	divsd  xmm0,xmm1
  402378:	e9 18 fc ff ff       	jmp    401f95 <print_exponential_number+0x355>
  40237d:	0f 1f 00             	nop    DWORD PTR [rax]
  402380:	49 8b 74 24 10       	mov    rsi,QWORD PTR [r12+0x10]
  402385:	88 14 0e             	mov    BYTE PTR [rsi+rcx*1],dl
  402388:	e9 47 fd ff ff       	jmp    4020d4 <print_exponential_number+0x494>
  40238d:	0f 1f 00             	nop    DWORD PTR [rax]
  402390:	31 ff                	xor    edi,edi
  402392:	31 f6                	xor    esi,esi
  402394:	e9 41 fb ff ff       	jmp    401eda <print_exponential_number+0x29a>
  402399:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  40239e:	44 89 d6             	mov    esi,r10d
  4023a1:	31 db                	xor    ebx,ebx
  4023a3:	e8 08 f0 ff ff       	call   4013b0 <get_components>
  4023a8:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  4023ad:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  4023b2:	31 c0                	xor    eax,eax
  4023b4:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  4023b9:	e9 22 fc ff ff       	jmp    401fe0 <print_exponential_number+0x3a0>
  4023be:	66 90                	xchg   ax,ax

00000000004023c0 <print_floating_point>:
  4023c0:	41 54                	push   r12
  4023c2:	41 89 d4             	mov    r12d,edx
  4023c5:	55                   	push   rbp
  4023c6:	48 89 fd             	mov    rbp,rdi
  4023c9:	48 83 ec 58          	sub    rsp,0x58
  4023cd:	66 0f 2e c0          	ucomisd xmm0,xmm0
  4023d1:	0f 8a 31 01 00 00    	jp     402508 <print_floating_point+0x148>
  4023d7:	f2 0f 10 0d e9 1f 00 	movsd  xmm1,QWORD PTR [rip+0x1fe9]        # 4043c8 <powers_of_10+0x128>
  4023de:	00 
  4023df:	66 0f 2f c8          	comisd xmm1,xmm0
  4023e3:	0f 87 87 01 00 00    	ja     402570 <print_floating_point+0x1b0>
  4023e9:	66 0f 2f 05 df 1f 00 	comisd xmm0,QWORD PTR [rip+0x1fdf]        # 4043d0 <powers_of_10+0x130>
  4023f0:	00 
  4023f1:	0f 87 91 00 00 00    	ja     402488 <print_floating_point+0xc8>
  4023f7:	45 84 c0             	test   r8b,r8b
  4023fa:	0f 85 c0 00 00 00    	jne    4024c0 <print_floating_point+0x100>
  402400:	66 0f 2f 05 d0 1f 00 	comisd xmm0,QWORD PTR [rip+0x1fd0]        # 4043d8 <powers_of_10+0x138>
  402407:	00 
  402408:	0f 87 42 01 00 00    	ja     402550 <print_floating_point+0x190>
  40240e:	f2 0f 10 0d ca 1f 00 	movsd  xmm1,QWORD PTR [rip+0x1fca]        # 4043e0 <powers_of_10+0x140>
  402415:	00 
  402416:	66 0f 2f c8          	comisd xmm1,xmm0
  40241a:	0f 87 30 01 00 00    	ja     402550 <print_floating_point+0x190>
  402420:	41 89 c9             	mov    r9d,ecx
  402423:	41 81 e1 00 08 00 00 	and    r9d,0x800
  40242a:	0f 85 60 01 00 00    	jne    402590 <print_floating_point+0x1d0>
  402430:	be 06 00 00 00       	mov    esi,0x6
  402435:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  40243a:	89 4c 24 0c          	mov    DWORD PTR [rsp+0xc],ecx
  40243e:	89 74 24 08          	mov    DWORD PTR [rsp+0x8],esi
  402442:	e8 69 ef ff ff       	call   4013b0 <get_components>
  402447:	48 83 ec 08          	sub    rsp,0x8
  40244b:	41 51                	push   r9
  40244d:	45 89 e1             	mov    r9d,r12d
  402450:	48 8d 44 24 40       	lea    rax,[rsp+0x40]
  402455:	50                   	push   rax
  402456:	8b 4c 24 24          	mov    ecx,DWORD PTR [rsp+0x24]
  40245a:	51                   	push   rcx
  40245b:	44 8b 44 24 28       	mov    r8d,DWORD PTR [rsp+0x28]
  402460:	48 89 e9             	mov    rcx,rbp
  402463:	0f b6 54 24 40       	movzx  edx,BYTE PTR [rsp+0x40]
  402468:	48 8b 74 24 38       	mov    rsi,QWORD PTR [rsp+0x38]
  40246d:	48 8b 7c 24 30       	mov    rdi,QWORD PTR [rsp+0x30]
  402472:	e8 d9 f4 ff ff       	call   401950 <print_broken_up_decimal.isra.0>
  402477:	48 83 c4 20          	add    rsp,0x20
  40247b:	48 83 c4 58          	add    rsp,0x58
  40247f:	5d                   	pop    rbp
  402480:	41 5c                	pop    r12
  402482:	c3                   	ret    
  402483:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  402488:	89 c8                	mov    eax,ecx
  40248a:	48 8d 35 00 1c 00 00 	lea    rsi,[rip+0x1c00]        # 404091 <kb_readc+0x701>
  402491:	41 89 c8             	mov    r8d,ecx
  402494:	48 89 ef             	mov    rdi,rbp
  402497:	83 e0 04             	and    eax,0x4
  40249a:	44 89 e1             	mov    ecx,r12d
  40249d:	83 f8 01             	cmp    eax,0x1
  4024a0:	19 d2                	sbb    edx,edx
  4024a2:	83 c2 04             	add    edx,0x4
  4024a5:	85 c0                	test   eax,eax
  4024a7:	48 8d 05 de 1b 00 00 	lea    rax,[rip+0x1bde]        # 40408c <kb_readc+0x6fc>
  4024ae:	48 0f 45 f0          	cmovne rsi,rax
  4024b2:	48 83 c4 58          	add    rsp,0x58
  4024b6:	5d                   	pop    rbp
  4024b7:	41 5c                	pop    r12
  4024b9:	e9 f2 ef ff ff       	jmp    4014b0 <out_rev_>
  4024be:	66 90                	xchg   ax,ax
  4024c0:	41 89 c9             	mov    r9d,ecx
  4024c3:	41 81 e1 00 08 00 00 	and    r9d,0x800
  4024ca:	74 64                	je     402530 <print_floating_point+0x170>
  4024cc:	b8 01 00 00 00       	mov    eax,0x1
  4024d1:	45 31 c9             	xor    r9d,r9d
  4024d4:	83 fe 11             	cmp    esi,0x11
  4024d7:	76 5c                	jbe    402535 <print_floating_point+0x175>
  4024d9:	48 8d 54 24 2f       	lea    rdx,[rsp+0x2f]
  4024de:	66 90                	xchg   ax,ax
  4024e0:	41 89 c1             	mov    r9d,eax
  4024e3:	c6 04 02 30          	mov    BYTE PTR [rdx+rax*1],0x30
  4024e7:	83 ee 01             	sub    esi,0x1
  4024ea:	48 83 c0 01          	add    rax,0x1
  4024ee:	41 83 f9 1f          	cmp    r9d,0x1f
  4024f2:	77 05                	ja     4024f9 <print_floating_point+0x139>
  4024f4:	83 fe 11             	cmp    esi,0x11
  4024f7:	77 e7                	ja     4024e0 <print_floating_point+0x120>
  4024f9:	45 84 c0             	test   r8b,r8b
  4024fc:	0f 84 33 ff ff ff    	je     402435 <print_floating_point+0x75>
  402502:	eb 31                	jmp    402535 <print_floating_point+0x175>
  402504:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402508:	48 83 c4 58          	add    rsp,0x58
  40250c:	41 89 c8             	mov    r8d,ecx
  40250f:	89 d1                	mov    ecx,edx
  402511:	48 89 ef             	mov    rdi,rbp
  402514:	ba 03 00 00 00       	mov    edx,0x3
  402519:	5d                   	pop    rbp
  40251a:	48 8d 35 74 1b 00 00 	lea    rsi,[rip+0x1b74]        # 404095 <kb_readc+0x705>
  402521:	41 5c                	pop    r12
  402523:	e9 88 ef ff ff       	jmp    4014b0 <out_rev_>
  402528:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40252f:	00 
  402530:	be 06 00 00 00       	mov    esi,0x6
  402535:	4c 8d 44 24 30       	lea    r8,[rsp+0x30]
  40253a:	44 89 e2             	mov    edx,r12d
  40253d:	48 89 ef             	mov    rdi,rbp
  402540:	e8 fb f6 ff ff       	call   401c40 <print_exponential_number>
  402545:	48 83 c4 58          	add    rsp,0x58
  402549:	5d                   	pop    rbp
  40254a:	41 5c                	pop    r12
  40254c:	c3                   	ret    
  40254d:	0f 1f 00             	nop    DWORD PTR [rax]
  402550:	45 31 c9             	xor    r9d,r9d
  402553:	4c 8d 44 24 30       	lea    r8,[rsp+0x30]
  402558:	44 89 e2             	mov    edx,r12d
  40255b:	48 89 ef             	mov    rdi,rbp
  40255e:	e8 dd f6 ff ff       	call   401c40 <print_exponential_number>
  402563:	e9 13 ff ff ff       	jmp    40247b <print_floating_point+0xbb>
  402568:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40256f:	00 
  402570:	48 83 c4 58          	add    rsp,0x58
  402574:	41 89 c8             	mov    r8d,ecx
  402577:	89 d1                	mov    ecx,edx
  402579:	48 89 ef             	mov    rdi,rbp
  40257c:	ba 04 00 00 00       	mov    edx,0x4
  402581:	5d                   	pop    rbp
  402582:	48 8d 35 10 1b 00 00 	lea    rsi,[rip+0x1b10]        # 404099 <kb_readc+0x709>
  402589:	41 5c                	pop    r12
  40258b:	e9 20 ef ff ff       	jmp    4014b0 <out_rev_>
  402590:	b8 01 00 00 00       	mov    eax,0x1
  402595:	45 31 c9             	xor    r9d,r9d
  402598:	83 fe 11             	cmp    esi,0x11
  40259b:	0f 87 38 ff ff ff    	ja     4024d9 <print_floating_point+0x119>
  4025a1:	e9 8f fe ff ff       	jmp    402435 <print_floating_point+0x75>
  4025a6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  4025ad:	00 00 00 

00000000004025b0 <format_string_loop.constprop.0>:
  4025b0:	41 57                	push   r15
  4025b2:	49 89 d7             	mov    r15,rdx
  4025b5:	41 56                	push   r14
  4025b7:	41 55                	push   r13
  4025b9:	41 54                	push   r12
  4025bb:	55                   	push   rbp
  4025bc:	53                   	push   rbx
  4025bd:	48 83 ec 38          	sub    rsp,0x38
  4025c1:	0f b6 16             	movzx  edx,BYTE PTR [rsi]
  4025c4:	84 d2                	test   dl,dl
  4025c6:	0f 84 5f 01 00 00    	je     40272b <format_string_loop.constprop.0+0x17b>
  4025cc:	49 89 fc             	mov    r12,rdi
  4025cf:	48 89 f3             	mov    rbx,rsi
  4025d2:	4c 8d 2d d3 1a 00 00 	lea    r13,[rip+0x1ad3]        # 4040ac <kb_readc+0x71c>
  4025d9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4025e0:	4c 8d 73 01          	lea    r14,[rbx+0x1]
  4025e4:	80 fa 25             	cmp    dl,0x25
  4025e7:	0f 85 d3 05 00 00    	jne    402bc0 <format_string_loop.constprop.0+0x610>
  4025ed:	0f be 73 01          	movsx  esi,BYTE PTR [rbx+0x1]
  4025f1:	40 84 f6             	test   sil,sil
  4025f4:	0f 84 31 01 00 00    	je     40272b <format_string_loop.constprop.0+0x17b>
  4025fa:	31 c9                	xor    ecx,ecx
  4025fc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402600:	8d 46 e0             	lea    eax,[rsi-0x20]
  402603:	49 8d 5e 01          	lea    rbx,[r14+0x1]
  402607:	3c 10                	cmp    al,0x10
  402609:	77 15                	ja     402620 <format_string_loop.constprop.0+0x70>
  40260b:	0f b6 c0             	movzx  eax,al
  40260e:	49 63 44 85 00       	movsxd rax,DWORD PTR [r13+rax*4+0x0]
  402613:	4c 01 e8             	add    rax,r13
  402616:	3e ff e0             	notrack jmp rax
  402619:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  402620:	8d 56 d0             	lea    edx,[rsi-0x30]
  402623:	80 fa 09             	cmp    dl,0x9
  402626:	ba 00 00 00 00       	mov    edx,0x0
  40262b:	76 47                	jbe    402674 <format_string_loop.constprop.0+0xc4>
  40262d:	40 80 fe 2a          	cmp    sil,0x2a
  402631:	0f 84 e1 05 00 00    	je     402c18 <format_string_loop.constprop.0+0x668>
  402637:	45 31 d2             	xor    r10d,r10d
  40263a:	40 80 fe 2e          	cmp    sil,0x2e
  40263e:	74 51                	je     402691 <format_string_loop.constprop.0+0xe1>
  402640:	8d 7e 98             	lea    edi,[rsi-0x68]
  402643:	49 8d 5e 01          	lea    rbx,[r14+0x1]
  402647:	40 80 ff 12          	cmp    dil,0x12
  40264b:	0f 87 7f 00 00 00    	ja     4026d0 <format_string_loop.constprop.0+0x120>
  402651:	4c 8d 05 98 1a 00 00 	lea    r8,[rip+0x1a98]        # 4040f0 <kb_readc+0x760>
  402658:	40 0f b6 ff          	movzx  edi,dil
  40265c:	49 63 3c b8          	movsxd rdi,DWORD PTR [r8+rdi*4]
  402660:	4c 01 c7             	add    rdi,r8
  402663:	3e ff e7             	notrack jmp rdi
  402666:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40266d:	00 00 00 
  402670:	48 83 c3 01          	add    rbx,0x1
  402674:	8d 04 92             	lea    eax,[rdx+rdx*4]
  402677:	49 89 de             	mov    r14,rbx
  40267a:	8d 54 46 d0          	lea    edx,[rsi+rax*2-0x30]
  40267e:	0f be 33             	movsx  esi,BYTE PTR [rbx]
  402681:	8d 46 d0             	lea    eax,[rsi-0x30]
  402684:	3c 09                	cmp    al,0x9
  402686:	76 e8                	jbe    402670 <format_string_loop.constprop.0+0xc0>
  402688:	45 31 d2             	xor    r10d,r10d
  40268b:	40 80 fe 2e          	cmp    sil,0x2e
  40268f:	75 af                	jne    402640 <format_string_loop.constprop.0+0x90>
  402691:	41 0f be 76 01       	movsx  esi,BYTE PTR [r14+0x1]
  402696:	80 cd 08             	or     ch,0x8
  402699:	40 84 f6             	test   sil,sil
  40269c:	0f 84 89 00 00 00    	je     40272b <format_string_loop.constprop.0+0x17b>
  4026a2:	44 8d 46 d0          	lea    r8d,[rsi-0x30]
  4026a6:	49 8d 7e 01          	lea    rdi,[r14+0x1]
  4026aa:	41 80 f8 09          	cmp    r8b,0x9
  4026ae:	0f 86 44 05 00 00    	jbe    402bf8 <format_string_loop.constprop.0+0x648>
  4026b4:	40 80 fe 2a          	cmp    sil,0x2a
  4026b8:	0f 84 b2 05 00 00    	je     402c70 <format_string_loop.constprop.0+0x6c0>
  4026be:	49 89 fe             	mov    r14,rdi
  4026c1:	8d 7e 98             	lea    edi,[rsi-0x68]
  4026c4:	49 8d 5e 01          	lea    rbx,[r14+0x1]
  4026c8:	40 80 ff 12          	cmp    dil,0x12
  4026cc:	76 83                	jbe    402651 <format_string_loop.constprop.0+0xa1>
  4026ce:	66 90                	xchg   ax,ax
  4026d0:	8d 7e db             	lea    edi,[rsi-0x25]
  4026d3:	40 80 ff 53          	cmp    dil,0x53
  4026d7:	77 17                	ja     4026f0 <format_string_loop.constprop.0+0x140>
  4026d9:	48 8d 05 5c 1a 00 00 	lea    rax,[rip+0x1a5c]        # 40413c <kb_readc+0x7ac>
  4026e0:	40 0f b6 ff          	movzx  edi,dil
  4026e4:	48 63 3c b8          	movsxd rdi,DWORD PTR [rax+rdi*4]
  4026e8:	48 01 c7             	add    rdi,rax
  4026eb:	3e ff e7             	notrack jmp rdi
  4026ee:	66 90                	xchg   ax,ax
  4026f0:	41 8b 54 24 18       	mov    edx,DWORD PTR [r12+0x18]
  4026f5:	8d 4a 01             	lea    ecx,[rdx+0x1]
  4026f8:	41 89 4c 24 18       	mov    DWORD PTR [r12+0x18],ecx
  4026fd:	41 3b 54 24 1c       	cmp    edx,DWORD PTR [r12+0x1c]
  402702:	73 1c                	jae    402720 <format_string_loop.constprop.0+0x170>
  402704:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  402708:	48 85 c9             	test   rcx,rcx
  40270b:	0f 84 cf 09 00 00    	je     4030e0 <format_string_loop.constprop.0+0xb30>
  402711:	4d 8b 44 24 08       	mov    r8,QWORD PTR [r12+0x8]
  402716:	40 0f be fe          	movsx  edi,sil
  40271a:	4c 89 c6             	mov    rsi,r8
  40271d:	ff d1                	call   rcx
  40271f:	90                   	nop
  402720:	0f b6 13             	movzx  edx,BYTE PTR [rbx]
  402723:	84 d2                	test   dl,dl
  402725:	0f 85 b5 fe ff ff    	jne    4025e0 <format_string_loop.constprop.0+0x30>
  40272b:	48 83 c4 38          	add    rsp,0x38
  40272f:	5b                   	pop    rbx
  402730:	5d                   	pop    rbp
  402731:	41 5c                	pop    r12
  402733:	41 5d                	pop    r13
  402735:	41 5e                	pop    r14
  402737:	41 5f                	pop    r15
  402739:	c3                   	ret    
  40273a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  402740:	83 c9 02             	or     ecx,0x2
  402743:	0f be 33             	movsx  esi,BYTE PTR [rbx]
  402746:	49 89 de             	mov    r14,rbx
  402749:	e9 b2 fe ff ff       	jmp    402600 <format_string_loop.constprop.0+0x50>
  40274e:	66 90                	xchg   ax,ax
  402750:	83 c9 04             	or     ecx,0x4
  402753:	eb ee                	jmp    402743 <format_string_loop.constprop.0+0x193>
  402755:	0f 1f 00             	nop    DWORD PTR [rax]
  402758:	83 c9 10             	or     ecx,0x10
  40275b:	eb e6                	jmp    402743 <format_string_loop.constprop.0+0x193>
  40275d:	0f 1f 00             	nop    DWORD PTR [rax]
  402760:	83 c9 08             	or     ecx,0x8
  402763:	eb de                	jmp    402743 <format_string_loop.constprop.0+0x193>
  402765:	0f 1f 00             	nop    DWORD PTR [rax]
  402768:	83 c9 01             	or     ecx,0x1
  40276b:	eb d6                	jmp    402743 <format_string_loop.constprop.0+0x193>
  40276d:	0f 1f 00             	nop    DWORD PTR [rax]
  402770:	41 0f b6 76 01       	movzx  esi,BYTE PTR [r14+0x1]
  402775:	80 cd 02             	or     ch,0x2
  402778:	40 84 f6             	test   sil,sil
  40277b:	74 ae                	je     40272b <format_string_loop.constprop.0+0x17b>
  40277d:	48 83 c3 01          	add    rbx,0x1
  402781:	e9 4a ff ff ff       	jmp    4026d0 <format_string_loop.constprop.0+0x120>
  402786:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40278d:	00 00 00 
  402790:	40 80 fe 64          	cmp    sil,0x64
  402794:	0f 84 2a 06 00 00    	je     402dc4 <format_string_loop.constprop.0+0x814>
  40279a:	40 80 fe 69          	cmp    sil,0x69
  40279e:	0f 84 20 06 00 00    	je     402dc4 <format_string_loop.constprop.0+0x814>
  4027a4:	89 f7                	mov    edi,esi
  4027a6:	83 e7 df             	and    edi,0xffffffdf
  4027a9:	40 80 ff 58          	cmp    dil,0x58
  4027ad:	0f 84 f6 05 00 00    	je     402da9 <format_string_loop.constprop.0+0x7f9>
  4027b3:	41 bb 08 00 00 00    	mov    r11d,0x8
  4027b9:	40 80 fe 6f          	cmp    sil,0x6f
  4027bd:	74 15                	je     4027d4 <format_string_loop.constprop.0+0x224>
  4027bf:	41 bb 02 00 00 00    	mov    r11d,0x2
  4027c5:	40 80 fe 62          	cmp    sil,0x62
  4027c9:	74 09                	je     4027d4 <format_string_loop.constprop.0+0x224>
  4027cb:	83 e1 ef             	and    ecx,0xffffffef
  4027ce:	41 bb 0a 00 00 00    	mov    r11d,0xa
  4027d4:	89 ce                	mov    esi,ecx
  4027d6:	83 e6 fe             	and    esi,0xfffffffe
  4027d9:	f6 c5 08             	test   ch,0x8
  4027dc:	0f 45 ce             	cmovne ecx,esi
  4027df:	41 8b 37             	mov    esi,DWORD PTR [r15]
  4027e2:	89 cf                	mov    edi,ecx
  4027e4:	81 e7 00 04 00 00    	and    edi,0x400
  4027ea:	f6 c5 40             	test   ch,0x40
  4027ed:	0f 84 5d 05 00 00    	je     402d50 <format_string_loop.constprop.0+0x7a0>
  4027f3:	85 ff                	test   edi,edi
  4027f5:	0f 85 3e 07 00 00    	jne    402f39 <format_string_loop.constprop.0+0x989>
  4027fb:	f6 c5 02             	test   ch,0x2
  4027fe:	0f 85 35 07 00 00    	jne    402f39 <format_string_loop.constprop.0+0x989>
  402804:	f6 c1 40             	test   cl,0x40
  402807:	0f 84 e8 09 00 00    	je     4031f5 <format_string_loop.constprop.0+0xc45>
  40280d:	83 fe 2f             	cmp    esi,0x2f
  402810:	0f 87 3b 0a 00 00    	ja     403251 <format_string_loop.constprop.0+0xca1>
  402816:	89 f7                	mov    edi,esi
  402818:	83 c6 08             	add    esi,0x8
  40281b:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  40281f:	41 89 37             	mov    DWORD PTR [r15],esi
  402822:	0f be 3f             	movsx  edi,BYTE PTR [rdi]
  402825:	4c 63 c7             	movsxd r8,edi
  402828:	41 89 fe             	mov    r14d,edi
  40282b:	41 89 d1             	mov    r9d,edx
  40282e:	4c 89 c6             	mov    rsi,r8
  402831:	41 c1 ee 1f          	shr    r14d,0x1f
  402835:	48 f7 de             	neg    rsi
  402838:	85 ff                	test   edi,edi
  40283a:	44 89 f2             	mov    edx,r14d
  40283d:	4c 89 e7             	mov    rdi,r12
  402840:	49 0f 4f f0          	cmovg  rsi,r8
  402844:	48 83 ec 08          	sub    rsp,0x8
  402848:	45 89 d0             	mov    r8d,r10d
  40284b:	51                   	push   rcx
  40284c:	44 89 d9             	mov    ecx,r11d
  40284f:	e8 9c ed ff ff       	call   4015f0 <print_integer>
  402854:	41 5a                	pop    r10
  402856:	41 5b                	pop    r11
  402858:	e9 c3 fe ff ff       	jmp    402720 <format_string_loop.constprop.0+0x170>
  40285d:	41 0f b6 76 01       	movzx  esi,BYTE PTR [r14+0x1]
  402862:	40 84 f6             	test   sil,sil
  402865:	0f 84 c0 fe ff ff    	je     40272b <format_string_loop.constprop.0+0x17b>
  40286b:	40 80 fe 68          	cmp    sil,0x68
  40286f:	0f 84 3b 04 00 00    	je     402cb0 <format_string_loop.constprop.0+0x700>
  402875:	80 c9 80             	or     cl,0x80
  402878:	48 83 c3 01          	add    rbx,0x1
  40287c:	e9 4f fe ff ff       	jmp    4026d0 <format_string_loop.constprop.0+0x120>
  402881:	41 0f b6 76 01       	movzx  esi,BYTE PTR [r14+0x1]
  402886:	40 84 f6             	test   sil,sil
  402889:	0f 84 9c fe ff ff    	je     40272b <format_string_loop.constprop.0+0x17b>
  40288f:	40 80 fe 6c          	cmp    sil,0x6c
  402893:	0f 84 31 04 00 00    	je     402cca <format_string_loop.constprop.0+0x71a>
  402899:	80 cd 02             	or     ch,0x2
  40289c:	48 83 c3 01          	add    rbx,0x1
  4028a0:	e9 2b fe ff ff       	jmp    4026d0 <format_string_loop.constprop.0+0x120>
  4028a5:	41 89 f0             	mov    r8d,esi
  4028a8:	89 cf                	mov    edi,ecx
  4028aa:	41 83 e0 df          	and    r8d,0xffffffdf
  4028ae:	81 cf 00 10 00 00    	or     edi,0x1000
  4028b4:	41 80 f8 47          	cmp    r8b,0x47
  4028b8:	0f 44 cf             	cmove  ecx,edi
  4028bb:	83 e6 fd             	and    esi,0xfffffffd
  4028be:	89 cf                	mov    edi,ecx
  4028c0:	83 cf 20             	or     edi,0x20
  4028c3:	40 80 fe 45          	cmp    sil,0x45
  4028c7:	41 8b 77 04          	mov    esi,DWORD PTR [r15+0x4]
  4028cb:	0f 44 cf             	cmove  ecx,edi
  4028ce:	81 fe af 00 00 00    	cmp    esi,0xaf
  4028d4:	0f 87 06 04 00 00    	ja     402ce0 <format_string_loop.constprop.0+0x730>
  4028da:	89 f7                	mov    edi,esi
  4028dc:	83 c6 10             	add    esi,0x10
  4028df:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  4028e3:	41 89 77 04          	mov    DWORD PTR [r15+0x4],esi
  4028e7:	f2 0f 10 07          	movsd  xmm0,QWORD PTR [rdi]
  4028eb:	41 b8 01 00 00 00    	mov    r8d,0x1
  4028f1:	44 89 d6             	mov    esi,r10d
  4028f4:	4c 89 e7             	mov    rdi,r12
  4028f7:	e8 c4 fa ff ff       	call   4023c0 <print_floating_point>
  4028fc:	e9 1f fe ff ff       	jmp    402720 <format_string_loop.constprop.0+0x170>
  402901:	89 cf                	mov    edi,ecx
  402903:	83 cf 20             	or     edi,0x20
  402906:	40 80 fe 46          	cmp    sil,0x46
  40290a:	41 8b 77 04          	mov    esi,DWORD PTR [r15+0x4]
  40290e:	0f 44 cf             	cmove  ecx,edi
  402911:	81 fe af 00 00 00    	cmp    esi,0xaf
  402917:	0f 87 af 04 00 00    	ja     402dcc <format_string_loop.constprop.0+0x81c>
  40291d:	89 f7                	mov    edi,esi
  40291f:	83 c6 10             	add    esi,0x10
  402922:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  402926:	41 89 77 04          	mov    DWORD PTR [r15+0x4],esi
  40292a:	f2 0f 10 07          	movsd  xmm0,QWORD PTR [rdi]
  40292e:	45 31 c0             	xor    r8d,r8d
  402931:	44 89 d6             	mov    esi,r10d
  402934:	4c 89 e7             	mov    rdi,r12
  402937:	e8 84 fa ff ff       	call   4023c0 <print_floating_point>
  40293c:	e9 df fd ff ff       	jmp    402720 <format_string_loop.constprop.0+0x170>
  402941:	41 8b 37             	mov    esi,DWORD PTR [r15]
  402944:	83 fe 2f             	cmp    esi,0x2f
  402947:	0f 87 a4 03 00 00    	ja     402cf1 <format_string_loop.constprop.0+0x741>
  40294d:	89 f7                	mov    edi,esi
  40294f:	83 c6 08             	add    esi,0x8
  402952:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  402956:	41 89 37             	mov    DWORD PTR [r15],esi
  402959:	48 8b 2f             	mov    rbp,QWORD PTR [rdi]
  40295c:	48 85 ed             	test   rbp,rbp
  40295f:	0f 84 a4 03 00 00    	je     402d09 <format_string_loop.constprop.0+0x759>
  402965:	44 0f b6 4d 00       	movzx  r9d,BYTE PTR [rbp+0x0]
  40296a:	44 89 ce             	mov    esi,r9d
  40296d:	45 85 d2             	test   r10d,r10d
  402970:	0f 85 35 05 00 00    	jne    402eab <format_string_loop.constprop.0+0x8fb>
  402976:	bf fe ff ff 7f       	mov    edi,0x7ffffffe
  40297b:	45 84 c9             	test   r9b,r9b
  40297e:	0f 84 82 09 00 00    	je     403306 <format_string_loop.constprop.0+0xd56>
  402984:	83 c7 01             	add    edi,0x1
  402987:	49 89 ee             	mov    r14,rbp
  40298a:	48 01 ef             	add    rdi,rbp
  40298d:	eb 06                	jmp    402995 <format_string_loop.constprop.0+0x3e5>
  40298f:	90                   	nop
  402990:	49 39 fe             	cmp    r14,rdi
  402993:	74 0a                	je     40299f <format_string_loop.constprop.0+0x3ef>
  402995:	49 83 c6 01          	add    r14,0x1
  402999:	41 80 3e 00          	cmp    BYTE PTR [r14],0x0
  40299d:	75 f1                	jne    402990 <format_string_loop.constprop.0+0x3e0>
  40299f:	44 89 f0             	mov    eax,r14d
  4029a2:	29 e8                	sub    eax,ebp
  4029a4:	89 44 24 10          	mov    DWORD PTR [rsp+0x10],eax
  4029a8:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  4029ac:	41 89 ce             	mov    r14d,ecx
  4029af:	44 39 d0             	cmp    eax,r10d
  4029b2:	89 c7                	mov    edi,eax
  4029b4:	41 0f 47 fa          	cmova  edi,r10d
  4029b8:	41 81 e6 00 08 00 00 	and    r14d,0x800
  4029bf:	0f 44 f8             	cmove  edi,eax
  4029c2:	83 e1 02             	and    ecx,0x2
  4029c5:	89 4c 24 1c          	mov    DWORD PTR [rsp+0x1c],ecx
  4029c9:	89 7c 24 10          	mov    DWORD PTR [rsp+0x10],edi
  4029cd:	0f 84 1b 07 00 00    	je     4030ee <format_string_loop.constprop.0+0xb3e>
  4029d3:	45 84 c9             	test   r9b,r9b
  4029d6:	0f 84 92 00 00 00    	je     402a6e <format_string_loop.constprop.0+0x4be>
  4029dc:	45 85 f6             	test   r14d,r14d
  4029df:	0f 94 44 24 08       	sete   BYTE PTR [rsp+0x8]
  4029e4:	0f b6 44 24 08       	movzx  eax,BYTE PTR [rsp+0x8]
  4029e9:	45 85 d2             	test   r10d,r10d
  4029ec:	75 04                	jne    4029f2 <format_string_loop.constprop.0+0x442>
  4029ee:	84 c0                	test   al,al
  4029f0:	74 7c                	je     402a6e <format_string_loop.constprop.0+0x4be>
  4029f2:	4c 89 7c 24 20       	mov    QWORD PTR [rsp+0x20],r15
  4029f7:	49 89 ee             	mov    r14,rbp
  4029fa:	41 89 d7             	mov    r15d,edx
  4029fd:	48 89 5c 24 28       	mov    QWORD PTR [rsp+0x28],rbx
  402a02:	44 89 d3             	mov    ebx,r10d
  402a05:	0f 1f 00             	nop    DWORD PTR [rax]
  402a08:	41 8b 44 24 18       	mov    eax,DWORD PTR [r12+0x18]
  402a0d:	49 83 c6 01          	add    r14,0x1
  402a11:	8d 78 01             	lea    edi,[rax+0x1]
  402a14:	41 89 7c 24 18       	mov    DWORD PTR [r12+0x18],edi
  402a19:	41 3b 44 24 1c       	cmp    eax,DWORD PTR [r12+0x1c]
  402a1e:	73 1c                	jae    402a3c <format_string_loop.constprop.0+0x48c>
  402a20:	4d 8b 04 24          	mov    r8,QWORD PTR [r12]
  402a24:	4d 85 c0             	test   r8,r8
  402a27:	0f 84 c3 05 00 00    	je     402ff0 <format_string_loop.constprop.0+0xa40>
  402a2d:	4d 8b 4c 24 08       	mov    r9,QWORD PTR [r12+0x8]
  402a32:	40 0f be fe          	movsx  edi,sil
  402a36:	4c 89 ce             	mov    rsi,r9
  402a39:	41 ff d0             	call   r8
  402a3c:	41 0f b6 36          	movzx  esi,BYTE PTR [r14]
  402a40:	40 84 f6             	test   sil,sil
  402a43:	74 10                	je     402a55 <format_string_loop.constprop.0+0x4a5>
  402a45:	89 d8                	mov    eax,ebx
  402a47:	44 29 f0             	sub    eax,r14d
  402a4a:	01 e8                	add    eax,ebp
  402a4c:	75 ba                	jne    402a08 <format_string_loop.constprop.0+0x458>
  402a4e:	80 7c 24 08 00       	cmp    BYTE PTR [rsp+0x8],0x0
  402a53:	75 b3                	jne    402a08 <format_string_loop.constprop.0+0x458>
  402a55:	8b 4c 24 1c          	mov    ecx,DWORD PTR [rsp+0x1c]
  402a59:	44 89 fa             	mov    edx,r15d
  402a5c:	48 8b 5c 24 28       	mov    rbx,QWORD PTR [rsp+0x28]
  402a61:	4c 8b 7c 24 20       	mov    r15,QWORD PTR [rsp+0x20]
  402a66:	85 c9                	test   ecx,ecx
  402a68:	0f 84 b2 fc ff ff    	je     402720 <format_string_loop.constprop.0+0x170>
  402a6e:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  402a72:	41 89 d6             	mov    r14d,edx
  402a75:	8d 68 01             	lea    ebp,[rax+0x1]
  402a78:	39 c2                	cmp    edx,eax
  402a7a:	0f 87 22 05 00 00    	ja     402fa2 <format_string_loop.constprop.0+0x9f2>
  402a80:	e9 9b fc ff ff       	jmp    402720 <format_string_loop.constprop.0+0x170>
  402a85:	0f 1f 00             	nop    DWORD PTR [rax]
  402a88:	41 8b 54 24 18       	mov    edx,DWORD PTR [r12+0x18]
  402a8d:	8d 4a 01             	lea    ecx,[rdx+0x1]
  402a90:	41 89 4c 24 18       	mov    DWORD PTR [r12+0x18],ecx
  402a95:	41 3b 54 24 1c       	cmp    edx,DWORD PTR [r12+0x1c]
  402a9a:	0f 83 80 fc ff ff    	jae    402720 <format_string_loop.constprop.0+0x170>
  402aa0:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  402aa4:	48 85 c9             	test   rcx,rcx
  402aa7:	0f 84 25 06 00 00    	je     4030d2 <format_string_loop.constprop.0+0xb22>
  402aad:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  402ab2:	bf 25 00 00 00       	mov    edi,0x25
  402ab7:	ff d1                	call   rcx
  402ab9:	e9 62 fc ff ff       	jmp    402720 <format_string_loop.constprop.0+0x170>
  402abe:	41 8b 74 24 18       	mov    esi,DWORD PTR [r12+0x18]
  402ac3:	41 8b 17             	mov    edx,DWORD PTR [r15]
  402ac6:	f6 c1 40             	test   cl,0x40
  402ac9:	0f 84 58 02 00 00    	je     402d27 <format_string_loop.constprop.0+0x777>
  402acf:	83 fa 2f             	cmp    edx,0x2f
  402ad2:	0f 86 e5 03 00 00    	jbe    402ebd <format_string_loop.constprop.0+0x90d>
  402ad8:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  402adc:	48 8d 51 08          	lea    rdx,[rcx+0x8]
  402ae0:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  402ae4:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  402ae7:	40 88 32             	mov    BYTE PTR [rdx],sil
  402aea:	e9 31 fc ff ff       	jmp    402720 <format_string_loop.constprop.0+0x170>
  402aef:	83 e1 02             	and    ecx,0x2
  402af2:	41 8b 74 24 18       	mov    esi,DWORD PTR [r12+0x18]
  402af7:	41 8b 7c 24 1c       	mov    edi,DWORD PTR [r12+0x1c]
  402afc:	89 cd                	mov    ebp,ecx
  402afe:	0f 84 fa 04 00 00    	je     402ffe <format_string_loop.constprop.0+0xa4e>
  402b04:	41 8b 0f             	mov    ecx,DWORD PTR [r15]
  402b07:	83 f9 2f             	cmp    ecx,0x2f
  402b0a:	0f 87 06 03 00 00    	ja     402e16 <format_string_loop.constprop.0+0x866>
  402b10:	41 89 c8             	mov    r8d,ecx
  402b13:	83 c1 08             	add    ecx,0x8
  402b16:	4d 03 47 10          	add    r8,QWORD PTR [r15+0x10]
  402b1a:	41 89 0f             	mov    DWORD PTR [r15],ecx
  402b1d:	41 8b 08             	mov    ecx,DWORD PTR [r8]
  402b20:	44 8d 46 01          	lea    r8d,[rsi+0x1]
  402b24:	45 89 44 24 18       	mov    DWORD PTR [r12+0x18],r8d
  402b29:	39 fe                	cmp    esi,edi
  402b2b:	0f 83 05 03 00 00    	jae    402e36 <format_string_loop.constprop.0+0x886>
  402b31:	41 89 c8             	mov    r8d,ecx
  402b34:	0f be f9             	movsx  edi,cl
  402b37:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  402b3b:	c7 44 24 08 01 00 00 	mov    DWORD PTR [rsp+0x8],0x1
  402b42:	00 
  402b43:	48 85 c9             	test   rcx,rcx
  402b46:	0f 84 60 05 00 00    	je     4030ac <format_string_loop.constprop.0+0xafc>
  402b4c:	89 54 24 10          	mov    DWORD PTR [rsp+0x10],edx
  402b50:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  402b55:	ff d1                	call   rcx
  402b57:	8b 54 24 10          	mov    edx,DWORD PTR [rsp+0x10]
  402b5b:	85 ed                	test   ebp,ebp
  402b5d:	0f 84 bd fb ff ff    	je     402720 <format_string_loop.constprop.0+0x170>
  402b63:	8b 44 24 08          	mov    eax,DWORD PTR [rsp+0x8]
  402b67:	8d 68 01             	lea    ebp,[rax+0x1]
  402b6a:	e9 d4 02 00 00       	jmp    402e43 <format_string_loop.constprop.0+0x893>
  402b6f:	90                   	nop
  402b70:	41 8b 17             	mov    edx,DWORD PTR [r15]
  402b73:	81 c9 01 20 00 00    	or     ecx,0x2001
  402b79:	83 fa 2f             	cmp    edx,0x2f
  402b7c:	0f 87 5b 02 00 00    	ja     402ddd <format_string_loop.constprop.0+0x82d>
  402b82:	89 d6                	mov    esi,edx
  402b84:	83 c2 08             	add    edx,0x8
  402b87:	49 03 77 10          	add    rsi,QWORD PTR [r15+0x10]
  402b8b:	41 89 17             	mov    DWORD PTR [r15],edx
  402b8e:	48 8b 36             	mov    rsi,QWORD PTR [rsi]
  402b91:	48 85 f6             	test   rsi,rsi
  402b94:	0f 84 5b 02 00 00    	je     402df5 <format_string_loop.constprop.0+0x845>
  402b9a:	48 83 ec 08          	sub    rsp,0x8
  402b9e:	31 d2                	xor    edx,edx
  402ba0:	41 b9 12 00 00 00    	mov    r9d,0x12
  402ba6:	45 89 d0             	mov    r8d,r10d
  402ba9:	51                   	push   rcx
  402baa:	4c 89 e7             	mov    rdi,r12
  402bad:	b9 10 00 00 00       	mov    ecx,0x10
  402bb2:	e8 39 ea ff ff       	call   4015f0 <print_integer>
  402bb7:	58                   	pop    rax
  402bb8:	5a                   	pop    rdx
  402bb9:	e9 62 fb ff ff       	jmp    402720 <format_string_loop.constprop.0+0x170>
  402bbe:	66 90                	xchg   ax,ax
  402bc0:	41 8b 4c 24 18       	mov    ecx,DWORD PTR [r12+0x18]
  402bc5:	8d 71 01             	lea    esi,[rcx+0x1]
  402bc8:	41 89 74 24 18       	mov    DWORD PTR [r12+0x18],esi
  402bcd:	41 3b 4c 24 1c       	cmp    ecx,DWORD PTR [r12+0x1c]
  402bd2:	73 18                	jae    402bec <format_string_loop.constprop.0+0x63c>
  402bd4:	4d 8b 04 24          	mov    r8,QWORD PTR [r12]
  402bd8:	4d 85 c0             	test   r8,r8
  402bdb:	0f 84 7f 00 00 00    	je     402c60 <format_string_loop.constprop.0+0x6b0>
  402be1:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  402be6:	0f be fa             	movsx  edi,dl
  402be9:	41 ff d0             	call   r8
  402bec:	4c 89 f3             	mov    rbx,r14
  402bef:	e9 2c fb ff ff       	jmp    402720 <format_string_loop.constprop.0+0x170>
  402bf4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402bf8:	43 8d 04 92          	lea    eax,[r10+r10*4]
  402bfc:	48 83 c7 01          	add    rdi,0x1
  402c00:	44 8d 54 46 d0       	lea    r10d,[rsi+rax*2-0x30]
  402c05:	0f be 37             	movsx  esi,BYTE PTR [rdi]
  402c08:	8d 46 d0             	lea    eax,[rsi-0x30]
  402c0b:	3c 09                	cmp    al,0x9
  402c0d:	76 e9                	jbe    402bf8 <format_string_loop.constprop.0+0x648>
  402c0f:	e9 aa fa ff ff       	jmp    4026be <format_string_loop.constprop.0+0x10e>
  402c14:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402c18:	41 8b 17             	mov    edx,DWORD PTR [r15]
  402c1b:	83 fa 2f             	cmp    edx,0x2f
  402c1e:	77 30                	ja     402c50 <format_string_loop.constprop.0+0x6a0>
  402c20:	89 d6                	mov    esi,edx
  402c22:	83 c2 08             	add    edx,0x8
  402c25:	49 03 77 10          	add    rsi,QWORD PTR [r15+0x10]
  402c29:	41 89 17             	mov    DWORD PTR [r15],edx
  402c2c:	8b 16                	mov    edx,DWORD PTR [rsi]
  402c2e:	85 d2                	test   edx,edx
  402c30:	79 05                	jns    402c37 <format_string_loop.constprop.0+0x687>
  402c32:	83 c9 02             	or     ecx,0x2
  402c35:	f7 da                	neg    edx
  402c37:	41 0f b6 76 01       	movzx  esi,BYTE PTR [r14+0x1]
  402c3c:	40 84 f6             	test   sil,sil
  402c3f:	0f 84 e6 fa ff ff    	je     40272b <format_string_loop.constprop.0+0x17b>
  402c45:	49 89 de             	mov    r14,rbx
  402c48:	e9 ea f9 ff ff       	jmp    402637 <format_string_loop.constprop.0+0x87>
  402c4d:	0f 1f 00             	nop    DWORD PTR [rax]
  402c50:	49 8b 77 08          	mov    rsi,QWORD PTR [r15+0x8]
  402c54:	48 8d 56 08          	lea    rdx,[rsi+0x8]
  402c58:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  402c5c:	eb ce                	jmp    402c2c <format_string_loop.constprop.0+0x67c>
  402c5e:	66 90                	xchg   ax,ax
  402c60:	49 8b 74 24 10       	mov    rsi,QWORD PTR [r12+0x10]
  402c65:	88 14 0e             	mov    BYTE PTR [rsi+rcx*1],dl
  402c68:	e9 7f ff ff ff       	jmp    402bec <format_string_loop.constprop.0+0x63c>
  402c6d:	0f 1f 00             	nop    DWORD PTR [rax]
  402c70:	41 8b 37             	mov    esi,DWORD PTR [r15]
  402c73:	83 fe 2f             	cmp    esi,0x2f
  402c76:	0f 87 1e 02 00 00    	ja     402e9a <format_string_loop.constprop.0+0x8ea>
  402c7c:	89 f7                	mov    edi,esi
  402c7e:	83 c6 08             	add    esi,0x8
  402c81:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  402c85:	41 89 37             	mov    DWORD PTR [r15],esi
  402c88:	44 8b 17             	mov    r10d,DWORD PTR [rdi]
  402c8b:	31 f6                	xor    esi,esi
  402c8d:	49 8d 7e 02          	lea    rdi,[r14+0x2]
  402c91:	45 85 d2             	test   r10d,r10d
  402c94:	44 0f 48 d6          	cmovs  r10d,esi
  402c98:	41 0f b6 76 02       	movzx  esi,BYTE PTR [r14+0x2]
  402c9d:	40 84 f6             	test   sil,sil
  402ca0:	0f 85 18 fa ff ff    	jne    4026be <format_string_loop.constprop.0+0x10e>
  402ca6:	e9 80 fa ff ff       	jmp    40272b <format_string_loop.constprop.0+0x17b>
  402cab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  402cb0:	41 0f b6 76 02       	movzx  esi,BYTE PTR [r14+0x2]
  402cb5:	80 c9 c0             	or     cl,0xc0
  402cb8:	40 84 f6             	test   sil,sil
  402cbb:	0f 84 6a fa ff ff    	je     40272b <format_string_loop.constprop.0+0x17b>
  402cc1:	49 8d 5e 03          	lea    rbx,[r14+0x3]
  402cc5:	e9 06 fa ff ff       	jmp    4026d0 <format_string_loop.constprop.0+0x120>
  402cca:	41 0f b6 76 02       	movzx  esi,BYTE PTR [r14+0x2]
  402ccf:	80 cd 06             	or     ch,0x6
  402cd2:	40 84 f6             	test   sil,sil
  402cd5:	75 ea                	jne    402cc1 <format_string_loop.constprop.0+0x711>
  402cd7:	e9 4f fa ff ff       	jmp    40272b <format_string_loop.constprop.0+0x17b>
  402cdc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402ce0:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  402ce4:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  402ce8:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  402cec:	e9 f6 fb ff ff       	jmp    4028e7 <format_string_loop.constprop.0+0x337>
  402cf1:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  402cf5:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  402cf9:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  402cfd:	48 8b 2f             	mov    rbp,QWORD PTR [rdi]
  402d00:	48 85 ed             	test   rbp,rbp
  402d03:	0f 85 5c fc ff ff    	jne    402965 <format_string_loop.constprop.0+0x3b5>
  402d09:	41 89 c8             	mov    r8d,ecx
  402d0c:	48 8d 35 8b 13 00 00 	lea    rsi,[rip+0x138b]        # 40409e <kb_readc+0x70e>
  402d13:	89 d1                	mov    ecx,edx
  402d15:	4c 89 e7             	mov    rdi,r12
  402d18:	ba 06 00 00 00       	mov    edx,0x6
  402d1d:	e8 8e e7 ff ff       	call   4014b0 <out_rev_>
  402d22:	e9 f9 f9 ff ff       	jmp    402720 <format_string_loop.constprop.0+0x170>
  402d27:	f6 c1 80             	test   cl,0x80
  402d2a:	0f 84 9e 01 00 00    	je     402ece <format_string_loop.constprop.0+0x91e>
  402d30:	83 fa 2f             	cmp    edx,0x2f
  402d33:	0f 87 ab 04 00 00    	ja     4031e4 <format_string_loop.constprop.0+0xc34>
  402d39:	89 d1                	mov    ecx,edx
  402d3b:	83 c2 08             	add    edx,0x8
  402d3e:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  402d42:	41 89 17             	mov    DWORD PTR [r15],edx
  402d45:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  402d48:	66 89 32             	mov    WORD PTR [rdx],si
  402d4b:	e9 d0 f9 ff ff       	jmp    402720 <format_string_loop.constprop.0+0x170>
  402d50:	41 89 c8             	mov    r8d,ecx
  402d53:	41 83 e0 f3          	and    r8d,0xfffffff3
  402d57:	85 ff                	test   edi,edi
  402d59:	0f 85 a0 01 00 00    	jne    402eff <format_string_loop.constprop.0+0x94f>
  402d5f:	f6 c5 02             	test   ch,0x2
  402d62:	0f 85 97 01 00 00    	jne    402eff <format_string_loop.constprop.0+0x94f>
  402d68:	f6 c1 40             	test   cl,0x40
  402d6b:	0f 84 aa 04 00 00    	je     40321b <format_string_loop.constprop.0+0xc6b>
  402d71:	83 fe 2f             	cmp    esi,0x2f
  402d74:	0f 87 00 05 00 00    	ja     40327a <format_string_loop.constprop.0+0xcca>
  402d7a:	89 f1                	mov    ecx,esi
  402d7c:	83 c6 08             	add    esi,0x8
  402d7f:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  402d83:	41 89 37             	mov    DWORD PTR [r15],esi
  402d86:	0f b6 31             	movzx  esi,BYTE PTR [rcx]
  402d89:	48 83 ec 08          	sub    rsp,0x8
  402d8d:	41 89 d1             	mov    r9d,edx
  402d90:	4c 89 e7             	mov    rdi,r12
  402d93:	44 89 d9             	mov    ecx,r11d
  402d96:	41 50                	push   r8
  402d98:	31 d2                	xor    edx,edx
  402d9a:	45 89 d0             	mov    r8d,r10d
  402d9d:	e8 4e e8 ff ff       	call   4015f0 <print_integer>
  402da2:	5e                   	pop    rsi
  402da3:	5f                   	pop    rdi
  402da4:	e9 77 f9 ff ff       	jmp    402720 <format_string_loop.constprop.0+0x170>
  402da9:	89 cf                	mov    edi,ecx
  402dab:	83 c9 20             	or     ecx,0x20
  402dae:	40 80 fe 58          	cmp    sil,0x58
  402db2:	41 bb 10 00 00 00    	mov    r11d,0x10
  402db8:	89 cd                	mov    ebp,ecx
  402dba:	89 f9                	mov    ecx,edi
  402dbc:	0f 44 cd             	cmove  ecx,ebp
  402dbf:	e9 10 fa ff ff       	jmp    4027d4 <format_string_loop.constprop.0+0x224>
  402dc4:	80 cd 40             	or     ch,0x40
  402dc7:	e9 d8 f9 ff ff       	jmp    4027a4 <format_string_loop.constprop.0+0x1f4>
  402dcc:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  402dd0:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  402dd4:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  402dd8:	e9 4d fb ff ff       	jmp    40292a <format_string_loop.constprop.0+0x37a>
  402ddd:	49 8b 77 08          	mov    rsi,QWORD PTR [r15+0x8]
  402de1:	48 8d 56 08          	lea    rdx,[rsi+0x8]
  402de5:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  402de9:	48 8b 36             	mov    rsi,QWORD PTR [rsi]
  402dec:	48 85 f6             	test   rsi,rsi
  402def:	0f 85 a5 fd ff ff    	jne    402b9a <format_string_loop.constprop.0+0x5ea>
  402df5:	41 89 c8             	mov    r8d,ecx
  402df8:	ba 05 00 00 00       	mov    edx,0x5
  402dfd:	b9 12 00 00 00       	mov    ecx,0x12
  402e02:	4c 89 e7             	mov    rdi,r12
  402e05:	48 8d 35 99 12 00 00 	lea    rsi,[rip+0x1299]        # 4040a5 <kb_readc+0x715>
  402e0c:	e8 9f e6 ff ff       	call   4014b0 <out_rev_>
  402e11:	e9 0a f9 ff ff       	jmp    402720 <format_string_loop.constprop.0+0x170>
  402e16:	4d 8b 47 08          	mov    r8,QWORD PTR [r15+0x8]
  402e1a:	49 8d 48 08          	lea    rcx,[r8+0x8]
  402e1e:	49 89 4f 08          	mov    QWORD PTR [r15+0x8],rcx
  402e22:	41 8b 08             	mov    ecx,DWORD PTR [r8]
  402e25:	44 8d 46 01          	lea    r8d,[rsi+0x1]
  402e29:	45 89 44 24 18       	mov    DWORD PTR [r12+0x18],r8d
  402e2e:	39 fe                	cmp    esi,edi
  402e30:	0f 82 fb fc ff ff    	jb     402b31 <format_string_loop.constprop.0+0x581>
  402e36:	c7 44 24 08 01 00 00 	mov    DWORD PTR [rsp+0x8],0x1
  402e3d:	00 
  402e3e:	bd 02 00 00 00       	mov    ebp,0x2
  402e43:	41 89 d6             	mov    r14d,edx
  402e46:	3b 54 24 08          	cmp    edx,DWORD PTR [rsp+0x8]
  402e4a:	77 26                	ja     402e72 <format_string_loop.constprop.0+0x8c2>
  402e4c:	e9 cf f8 ff ff       	jmp    402720 <format_string_loop.constprop.0+0x170>
  402e51:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  402e58:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  402e5d:	bf 20 00 00 00       	mov    edi,0x20
  402e62:	ff d1                	call   rcx
  402e64:	8d 45 01             	lea    eax,[rbp+0x1]
  402e67:	41 39 ee             	cmp    r14d,ebp
  402e6a:	0f 86 b0 f8 ff ff    	jbe    402720 <format_string_loop.constprop.0+0x170>
  402e70:	89 c5                	mov    ebp,eax
  402e72:	41 8b 44 24 18       	mov    eax,DWORD PTR [r12+0x18]
  402e77:	8d 48 01             	lea    ecx,[rax+0x1]
  402e7a:	41 89 4c 24 18       	mov    DWORD PTR [r12+0x18],ecx
  402e7f:	41 3b 44 24 1c       	cmp    eax,DWORD PTR [r12+0x1c]
  402e84:	73 de                	jae    402e64 <format_string_loop.constprop.0+0x8b4>
  402e86:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  402e8a:	48 85 c9             	test   rcx,rcx
  402e8d:	75 c9                	jne    402e58 <format_string_loop.constprop.0+0x8a8>
  402e8f:	49 8b 54 24 10       	mov    rdx,QWORD PTR [r12+0x10]
  402e94:	c6 04 02 20          	mov    BYTE PTR [rdx+rax*1],0x20
  402e98:	eb ca                	jmp    402e64 <format_string_loop.constprop.0+0x8b4>
  402e9a:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  402e9e:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  402ea2:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  402ea6:	e9 dd fd ff ff       	jmp    402c88 <format_string_loop.constprop.0+0x6d8>
  402eab:	45 84 c9             	test   r9b,r9b
  402eae:	0f 84 52 04 00 00    	je     403306 <format_string_loop.constprop.0+0xd56>
  402eb4:	41 8d 7a ff          	lea    edi,[r10-0x1]
  402eb8:	e9 c7 fa ff ff       	jmp    402984 <format_string_loop.constprop.0+0x3d4>
  402ebd:	89 d1                	mov    ecx,edx
  402ebf:	83 c2 08             	add    edx,0x8
  402ec2:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  402ec6:	41 89 17             	mov    DWORD PTR [r15],edx
  402ec9:	e9 16 fc ff ff       	jmp    402ae4 <format_string_loop.constprop.0+0x534>
  402ece:	f6 c5 02             	test   ch,0x2
  402ed1:	0f 85 f3 00 00 00    	jne    402fca <format_string_loop.constprop.0+0xa1a>
  402ed7:	80 e5 04             	and    ch,0x4
  402eda:	0f 85 ea 00 00 00    	jne    402fca <format_string_loop.constprop.0+0xa1a>
  402ee0:	83 fa 2f             	cmp    edx,0x2f
  402ee3:	0f 87 ba 03 00 00    	ja     4032a3 <format_string_loop.constprop.0+0xcf3>
  402ee9:	89 d1                	mov    ecx,edx
  402eeb:	83 c2 08             	add    edx,0x8
  402eee:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  402ef2:	41 89 17             	mov    DWORD PTR [r15],edx
  402ef5:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  402ef8:	89 32                	mov    DWORD PTR [rdx],esi
  402efa:	e9 21 f8 ff ff       	jmp    402720 <format_string_loop.constprop.0+0x170>
  402eff:	83 fe 2f             	cmp    esi,0x2f
  402f02:	0f 87 b9 02 00 00    	ja     4031c1 <format_string_loop.constprop.0+0xc11>
  402f08:	89 f7                	mov    edi,esi
  402f0a:	83 c6 08             	add    esi,0x8
  402f0d:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  402f11:	41 89 37             	mov    DWORD PTR [r15],esi
  402f14:	48 83 ec 08          	sub    rsp,0x8
  402f18:	41 89 d1             	mov    r9d,edx
  402f1b:	44 89 d9             	mov    ecx,r11d
  402f1e:	31 d2                	xor    edx,edx
  402f20:	41 50                	push   r8
  402f22:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
  402f25:	45 89 d0             	mov    r8d,r10d
  402f28:	4c 89 e7             	mov    rdi,r12
  402f2b:	e8 c0 e6 ff ff       	call   4015f0 <print_integer>
  402f30:	41 58                	pop    r8
  402f32:	41 59                	pop    r9
  402f34:	e9 e7 f7 ff ff       	jmp    402720 <format_string_loop.constprop.0+0x170>
  402f39:	83 fe 2f             	cmp    esi,0x2f
  402f3c:	0f 87 6e 02 00 00    	ja     4031b0 <format_string_loop.constprop.0+0xc00>
  402f42:	89 f7                	mov    edi,esi
  402f44:	83 c6 08             	add    esi,0x8
  402f47:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  402f4b:	41 89 37             	mov    DWORD PTR [r15],esi
  402f4e:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
  402f51:	41 89 d1             	mov    r9d,edx
  402f54:	45 89 d0             	mov    r8d,r10d
  402f57:	4c 89 e7             	mov    rdi,r12
  402f5a:	48 89 f5             	mov    rbp,rsi
  402f5d:	48 f7 dd             	neg    rbp
  402f60:	48 0f 48 ee          	cmovs  rbp,rsi
  402f64:	48 83 ec 08          	sub    rsp,0x8
  402f68:	48 c1 ee 3f          	shr    rsi,0x3f
  402f6c:	51                   	push   rcx
  402f6d:	48 89 f2             	mov    rdx,rsi
  402f70:	44 89 d9             	mov    ecx,r11d
  402f73:	48 89 ee             	mov    rsi,rbp
  402f76:	e8 75 e6 ff ff       	call   4015f0 <print_integer>
  402f7b:	5d                   	pop    rbp
  402f7c:	41 5e                	pop    r14
  402f7e:	e9 9d f7 ff ff       	jmp    402720 <format_string_loop.constprop.0+0x170>
  402f83:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  402f88:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  402f8d:	bf 20 00 00 00       	mov    edi,0x20
  402f92:	ff d1                	call   rcx
  402f94:	8d 45 01             	lea    eax,[rbp+0x1]
  402f97:	41 39 ee             	cmp    r14d,ebp
  402f9a:	0f 84 80 f7 ff ff    	je     402720 <format_string_loop.constprop.0+0x170>
  402fa0:	89 c5                	mov    ebp,eax
  402fa2:	41 8b 44 24 18       	mov    eax,DWORD PTR [r12+0x18]
  402fa7:	8d 48 01             	lea    ecx,[rax+0x1]
  402faa:	41 89 4c 24 18       	mov    DWORD PTR [r12+0x18],ecx
  402faf:	41 3b 44 24 1c       	cmp    eax,DWORD PTR [r12+0x1c]
  402fb4:	73 de                	jae    402f94 <format_string_loop.constprop.0+0x9e4>
  402fb6:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  402fba:	48 85 c9             	test   rcx,rcx
  402fbd:	75 c9                	jne    402f88 <format_string_loop.constprop.0+0x9d8>
  402fbf:	49 8b 54 24 10       	mov    rdx,QWORD PTR [r12+0x10]
  402fc4:	c6 04 02 20          	mov    BYTE PTR [rdx+rax*1],0x20
  402fc8:	eb ca                	jmp    402f94 <format_string_loop.constprop.0+0x9e4>
  402fca:	83 fa 2f             	cmp    edx,0x2f
  402fcd:	0f 87 6d 02 00 00    	ja     403240 <format_string_loop.constprop.0+0xc90>
  402fd3:	89 d1                	mov    ecx,edx
  402fd5:	83 c2 08             	add    edx,0x8
  402fd8:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  402fdc:	41 89 17             	mov    DWORD PTR [r15],edx
  402fdf:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  402fe2:	89 f0                	mov    eax,esi
  402fe4:	48 89 02             	mov    QWORD PTR [rdx],rax
  402fe7:	e9 34 f7 ff ff       	jmp    402720 <format_string_loop.constprop.0+0x170>
  402fec:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402ff0:	49 8b 7c 24 10       	mov    rdi,QWORD PTR [r12+0x10]
  402ff5:	40 88 34 07          	mov    BYTE PTR [rdi+rax*1],sil
  402ff9:	e9 3e fa ff ff       	jmp    402a3c <format_string_loop.constprop.0+0x48c>
  402ffe:	83 fa 01             	cmp    edx,0x1
  403001:	0f 86 0c 03 00 00    	jbe    403313 <format_string_loop.constprop.0+0xd63>
  403007:	8d 42 01             	lea    eax,[rdx+0x1]
  40300a:	48 89 5c 24 10       	mov    QWORD PTR [rsp+0x10],rbx
  40300f:	41 be 02 00 00 00    	mov    r14d,0x2
  403015:	89 d3                	mov    ebx,edx
  403017:	89 44 24 08          	mov    DWORD PTR [rsp+0x8],eax
  40301b:	eb 32                	jmp    40304f <format_string_loop.constprop.0+0xa9f>
  40301d:	0f 1f 00             	nop    DWORD PTR [rax]
  403020:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
  403024:	48 85 c0             	test   rax,rax
  403027:	0f 84 8d 00 00 00    	je     4030ba <format_string_loop.constprop.0+0xb0a>
  40302d:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  403032:	bf 20 00 00 00       	mov    edi,0x20
  403037:	ff d0                	call   rax
  403039:	41 8b 74 24 18       	mov    esi,DWORD PTR [r12+0x18]
  40303e:	41 8b 7c 24 1c       	mov    edi,DWORD PTR [r12+0x1c]
  403043:	41 8d 46 01          	lea    eax,[r14+0x1]
  403047:	44 39 f3             	cmp    ebx,r14d
  40304a:	74 1a                	je     403066 <format_string_loop.constprop.0+0xab6>
  40304c:	41 89 c6             	mov    r14d,eax
  40304f:	8d 46 01             	lea    eax,[rsi+0x1]
  403052:	41 89 44 24 18       	mov    DWORD PTR [r12+0x18],eax
  403057:	39 fe                	cmp    esi,edi
  403059:	72 c5                	jb     403020 <format_string_loop.constprop.0+0xa70>
  40305b:	89 c6                	mov    esi,eax
  40305d:	41 8d 46 01          	lea    eax,[r14+0x1]
  403061:	44 39 f3             	cmp    ebx,r14d
  403064:	75 e6                	jne    40304c <format_string_loop.constprop.0+0xa9c>
  403066:	89 da                	mov    edx,ebx
  403068:	48 8b 5c 24 10       	mov    rbx,QWORD PTR [rsp+0x10]
  40306d:	41 8b 0f             	mov    ecx,DWORD PTR [r15]
  403070:	83 f9 2f             	cmp    ecx,0x2f
  403073:	0f 86 59 01 00 00    	jbe    4031d2 <format_string_loop.constprop.0+0xc22>
  403079:	4d 8b 47 08          	mov    r8,QWORD PTR [r15+0x8]
  40307d:	49 8d 48 08          	lea    rcx,[r8+0x8]
  403081:	49 89 4f 08          	mov    QWORD PTR [r15+0x8],rcx
  403085:	41 8b 08             	mov    ecx,DWORD PTR [r8]
  403088:	44 8d 46 01          	lea    r8d,[rsi+0x1]
  40308c:	45 89 44 24 18       	mov    DWORD PTR [r12+0x18],r8d
  403091:	39 fe                	cmp    esi,edi
  403093:	0f 83 87 f6 ff ff    	jae    402720 <format_string_loop.constprop.0+0x170>
  403099:	41 89 c8             	mov    r8d,ecx
  40309c:	0f be f9             	movsx  edi,cl
  40309f:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  4030a3:	48 85 c9             	test   rcx,rcx
  4030a6:	0f 85 a0 fa ff ff    	jne    402b4c <format_string_loop.constprop.0+0x59c>
  4030ac:	49 8b 4c 24 10       	mov    rcx,QWORD PTR [r12+0x10]
  4030b1:	44 88 04 31          	mov    BYTE PTR [rcx+rsi*1],r8b
  4030b5:	e9 a1 fa ff ff       	jmp    402b5b <format_string_loop.constprop.0+0x5ab>
  4030ba:	49 8b 44 24 10       	mov    rax,QWORD PTR [r12+0x10]
  4030bf:	c6 04 30 20          	mov    BYTE PTR [rax+rsi*1],0x20
  4030c3:	41 8b 74 24 18       	mov    esi,DWORD PTR [r12+0x18]
  4030c8:	41 8b 7c 24 1c       	mov    edi,DWORD PTR [r12+0x1c]
  4030cd:	e9 71 ff ff ff       	jmp    403043 <format_string_loop.constprop.0+0xa93>
  4030d2:	49 8b 4c 24 10       	mov    rcx,QWORD PTR [r12+0x10]
  4030d7:	c6 04 11 25          	mov    BYTE PTR [rcx+rdx*1],0x25
  4030db:	e9 40 f6 ff ff       	jmp    402720 <format_string_loop.constprop.0+0x170>
  4030e0:	49 8b 4c 24 10       	mov    rcx,QWORD PTR [r12+0x10]
  4030e5:	40 88 34 11          	mov    BYTE PTR [rcx+rdx*1],sil
  4030e9:	e9 32 f6 ff ff       	jmp    402720 <format_string_loop.constprop.0+0x170>
  4030ee:	44 8d 5f 01          	lea    r11d,[rdi+0x1]
  4030f2:	39 fa                	cmp    edx,edi
  4030f4:	0f 86 02 02 00 00    	jbe    4032fc <format_string_loop.constprop.0+0xd4c>
  4030fa:	8d 42 01             	lea    eax,[rdx+0x1]
  4030fd:	48 89 6c 24 08       	mov    QWORD PTR [rsp+0x8],rbp
  403102:	89 d5                	mov    ebp,edx
  403104:	48 89 5c 24 28       	mov    QWORD PTR [rsp+0x28],rbx
  403109:	44 89 db             	mov    ebx,r11d
  40310c:	89 44 24 10          	mov    DWORD PTR [rsp+0x10],eax
  403110:	44 89 54 24 20       	mov    DWORD PTR [rsp+0x20],r10d
  403115:	eb 1f                	jmp    403136 <format_string_loop.constprop.0+0xb86>
  403117:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40311e:	00 00 
  403120:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  403125:	bf 20 00 00 00       	mov    edi,0x20
  40312a:	41 ff d0             	call   r8
  40312d:	8d 4b 01             	lea    ecx,[rbx+0x1]
  403130:	39 dd                	cmp    ebp,ebx
  403132:	74 2f                	je     403163 <format_string_loop.constprop.0+0xbb3>
  403134:	89 cb                	mov    ebx,ecx
  403136:	41 8b 4c 24 18       	mov    ecx,DWORD PTR [r12+0x18]
  40313b:	8d 71 01             	lea    esi,[rcx+0x1]
  40313e:	41 89 74 24 18       	mov    DWORD PTR [r12+0x18],esi
  403143:	41 3b 4c 24 1c       	cmp    ecx,DWORD PTR [r12+0x1c]
  403148:	73 e3                	jae    40312d <format_string_loop.constprop.0+0xb7d>
  40314a:	4d 8b 04 24          	mov    r8,QWORD PTR [r12]
  40314e:	4d 85 c0             	test   r8,r8
  403151:	75 cd                	jne    403120 <format_string_loop.constprop.0+0xb70>
  403153:	49 8b 74 24 10       	mov    rsi,QWORD PTR [r12+0x10]
  403158:	c6 04 0e 20          	mov    BYTE PTR [rsi+rcx*1],0x20
  40315c:	8d 4b 01             	lea    ecx,[rbx+0x1]
  40315f:	39 dd                	cmp    ebp,ebx
  403161:	75 d1                	jne    403134 <format_string_loop.constprop.0+0xb84>
  403163:	89 ea                	mov    edx,ebp
  403165:	48 8b 6c 24 08       	mov    rbp,QWORD PTR [rsp+0x8]
  40316a:	44 8b 54 24 20       	mov    r10d,DWORD PTR [rsp+0x20]
  40316f:	48 8b 5c 24 28       	mov    rbx,QWORD PTR [rsp+0x28]
  403174:	44 0f b6 4d 00       	movzx  r9d,BYTE PTR [rbp+0x0]
  403179:	44 89 ce             	mov    esi,r9d
  40317c:	45 84 c9             	test   r9b,r9b
  40317f:	0f 84 9b f5 ff ff    	je     402720 <format_string_loop.constprop.0+0x170>
  403185:	45 85 f6             	test   r14d,r14d
  403188:	0f 94 44 24 08       	sete   BYTE PTR [rsp+0x8]
  40318d:	0f b6 44 24 08       	movzx  eax,BYTE PTR [rsp+0x8]
  403192:	45 85 d2             	test   r10d,r10d
  403195:	0f 85 57 f8 ff ff    	jne    4029f2 <format_string_loop.constprop.0+0x442>
  40319b:	84 c0                	test   al,al
  40319d:	0f 85 4f f8 ff ff    	jne    4029f2 <format_string_loop.constprop.0+0x442>
  4031a3:	e9 78 f5 ff ff       	jmp    402720 <format_string_loop.constprop.0+0x170>
  4031a8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4031af:	00 
  4031b0:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  4031b4:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  4031b8:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  4031bc:	e9 8d fd ff ff       	jmp    402f4e <format_string_loop.constprop.0+0x99e>
  4031c1:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  4031c5:	48 8d 4f 08          	lea    rcx,[rdi+0x8]
  4031c9:	49 89 4f 08          	mov    QWORD PTR [r15+0x8],rcx
  4031cd:	e9 42 fd ff ff       	jmp    402f14 <format_string_loop.constprop.0+0x964>
  4031d2:	41 89 c8             	mov    r8d,ecx
  4031d5:	83 c1 08             	add    ecx,0x8
  4031d8:	4d 03 47 10          	add    r8,QWORD PTR [r15+0x10]
  4031dc:	41 89 0f             	mov    DWORD PTR [r15],ecx
  4031df:	e9 a1 fe ff ff       	jmp    403085 <format_string_loop.constprop.0+0xad5>
  4031e4:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  4031e8:	48 8d 51 08          	lea    rdx,[rcx+0x8]
  4031ec:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  4031f0:	e9 50 fb ff ff       	jmp    402d45 <format_string_loop.constprop.0+0x795>
  4031f5:	f6 c1 80             	test   cl,0x80
  4031f8:	0f 84 8d 00 00 00    	je     40328b <format_string_loop.constprop.0+0xcdb>
  4031fe:	83 fe 2f             	cmp    esi,0x2f
  403201:	0f 87 e4 00 00 00    	ja     4032eb <format_string_loop.constprop.0+0xd3b>
  403207:	89 f7                	mov    edi,esi
  403209:	83 c6 08             	add    esi,0x8
  40320c:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  403210:	41 89 37             	mov    DWORD PTR [r15],esi
  403213:	0f bf 3f             	movsx  edi,WORD PTR [rdi]
  403216:	e9 0a f6 ff ff       	jmp    402825 <format_string_loop.constprop.0+0x275>
  40321b:	81 e1 80 00 00 00    	and    ecx,0x80
  403221:	74 3f                	je     403262 <format_string_loop.constprop.0+0xcb2>
  403223:	83 fe 2f             	cmp    esi,0x2f
  403226:	0f 87 ae 00 00 00    	ja     4032da <format_string_loop.constprop.0+0xd2a>
  40322c:	89 f1                	mov    ecx,esi
  40322e:	83 c6 08             	add    esi,0x8
  403231:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  403235:	41 89 37             	mov    DWORD PTR [r15],esi
  403238:	0f b7 31             	movzx  esi,WORD PTR [rcx]
  40323b:	e9 49 fb ff ff       	jmp    402d89 <format_string_loop.constprop.0+0x7d9>
  403240:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  403244:	48 8d 51 08          	lea    rdx,[rcx+0x8]
  403248:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  40324c:	e9 8e fd ff ff       	jmp    402fdf <format_string_loop.constprop.0+0xa2f>
  403251:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  403255:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  403259:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  40325d:	e9 c0 f5 ff ff       	jmp    402822 <format_string_loop.constprop.0+0x272>
  403262:	83 fe 2f             	cmp    esi,0x2f
  403265:	76 60                	jbe    4032c7 <format_string_loop.constprop.0+0xd17>
  403267:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  40326b:	48 8d 71 08          	lea    rsi,[rcx+0x8]
  40326f:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  403273:	8b 31                	mov    esi,DWORD PTR [rcx]
  403275:	e9 0f fb ff ff       	jmp    402d89 <format_string_loop.constprop.0+0x7d9>
  40327a:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  40327e:	48 8d 71 08          	lea    rsi,[rcx+0x8]
  403282:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  403286:	e9 fb fa ff ff       	jmp    402d86 <format_string_loop.constprop.0+0x7d6>
  40328b:	83 fe 2f             	cmp    esi,0x2f
  40328e:	76 24                	jbe    4032b4 <format_string_loop.constprop.0+0xd04>
  403290:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  403294:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  403298:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  40329c:	8b 3f                	mov    edi,DWORD PTR [rdi]
  40329e:	e9 82 f5 ff ff       	jmp    402825 <format_string_loop.constprop.0+0x275>
  4032a3:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  4032a7:	48 8d 51 08          	lea    rdx,[rcx+0x8]
  4032ab:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  4032af:	e9 41 fc ff ff       	jmp    402ef5 <format_string_loop.constprop.0+0x945>
  4032b4:	89 f7                	mov    edi,esi
  4032b6:	83 c6 08             	add    esi,0x8
  4032b9:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  4032bd:	41 89 37             	mov    DWORD PTR [r15],esi
  4032c0:	8b 3f                	mov    edi,DWORD PTR [rdi]
  4032c2:	e9 5e f5 ff ff       	jmp    402825 <format_string_loop.constprop.0+0x275>
  4032c7:	89 f1                	mov    ecx,esi
  4032c9:	83 c6 08             	add    esi,0x8
  4032cc:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  4032d0:	41 89 37             	mov    DWORD PTR [r15],esi
  4032d3:	8b 31                	mov    esi,DWORD PTR [rcx]
  4032d5:	e9 af fa ff ff       	jmp    402d89 <format_string_loop.constprop.0+0x7d9>
  4032da:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  4032de:	48 8d 71 08          	lea    rsi,[rcx+0x8]
  4032e2:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  4032e6:	e9 4d ff ff ff       	jmp    403238 <format_string_loop.constprop.0+0xc88>
  4032eb:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  4032ef:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  4032f3:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  4032f7:	e9 17 ff ff ff       	jmp    403213 <format_string_loop.constprop.0+0xc63>
  4032fc:	44 89 5c 24 10       	mov    DWORD PTR [rsp+0x10],r11d
  403301:	e9 73 fe ff ff       	jmp    403179 <format_string_loop.constprop.0+0xbc9>
  403306:	c7 44 24 10 00 00 00 	mov    DWORD PTR [rsp+0x10],0x0
  40330d:	00 
  40330e:	e9 95 f6 ff ff       	jmp    4029a8 <format_string_loop.constprop.0+0x3f8>
  403313:	c7 44 24 08 02 00 00 	mov    DWORD PTR [rsp+0x8],0x2
  40331a:	00 
  40331b:	e9 4d fd ff ff       	jmp    40306d <format_string_loop.constprop.0+0xabd>

0000000000403320 <vprintf>:
  403320:	f3 0f 1e fa          	endbr64 
  403324:	48 83 ec 28          	sub    rsp,0x28
  403328:	49 89 f8             	mov    r8,rdi
  40332b:	48 8d 05 6e e1 ff ff 	lea    rax,[rip+0xffffffffffffe16e]        # 4014a0 <putchar_wrapper>
  403332:	48 89 f2             	mov    rdx,rsi
  403335:	48 89 04 24          	mov    QWORD PTR [rsp],rax
  403339:	48 89 e7             	mov    rdi,rsp
  40333c:	4c 89 c6             	mov    rsi,r8
  40333f:	48 b8 00 00 00 00 ff 	movabs rax,0x7fffffff00000000
  403346:	ff ff 7f 
  403349:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
  403350:	00 00 
  403352:	48 c7 44 24 10 00 00 	mov    QWORD PTR [rsp+0x10],0x0
  403359:	00 00 
  40335b:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  403360:	e8 4b f2 ff ff       	call   4025b0 <format_string_loop.constprop.0>
  403365:	48 83 3c 24 00       	cmp    QWORD PTR [rsp],0x0
  40336a:	74 0c                	je     403378 <vprintf+0x58>
  40336c:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  403370:	48 83 c4 28          	add    rsp,0x28
  403374:	c3                   	ret    
  403375:	0f 1f 00             	nop    DWORD PTR [rax]
  403378:	8b 4c 24 1c          	mov    ecx,DWORD PTR [rsp+0x1c]
  40337c:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  403380:	85 c9                	test   ecx,ecx
  403382:	74 ec                	je     403370 <vprintf+0x50>
  403384:	48 8b 74 24 10       	mov    rsi,QWORD PTR [rsp+0x10]
  403389:	48 85 f6             	test   rsi,rsi
  40338c:	74 e2                	je     403370 <vprintf+0x50>
  40338e:	39 c1                	cmp    ecx,eax
  403390:	8d 51 ff             	lea    edx,[rcx-0x1]
  403393:	48 0f 47 d0          	cmova  rdx,rax
  403397:	c6 04 16 00          	mov    BYTE PTR [rsi+rdx*1],0x0
  40339b:	48 83 c4 28          	add    rsp,0x28
  40339f:	c3                   	ret    

00000000004033a0 <vsnprintf>:
  4033a0:	f3 0f 1e fa          	endbr64 
  4033a4:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
  4033a9:	48 83 ec 28          	sub    rsp,0x28
  4033ad:	49 89 d0             	mov    r8,rdx
  4033b0:	48 89 ca             	mov    rdx,rcx
  4033b3:	48 39 c6             	cmp    rsi,rax
  4033b6:	48 89 7c 24 10       	mov    QWORD PTR [rsp+0x10],rdi
  4033bb:	48 0f 47 f0          	cmova  rsi,rax
  4033bf:	31 c0                	xor    eax,eax
  4033c1:	48 85 ff             	test   rdi,rdi
  4033c4:	48 89 e7             	mov    rdi,rsp
  4033c7:	48 c7 04 24 00 00 00 	mov    QWORD PTR [rsp],0x0
  4033ce:	00 
  4033cf:	48 0f 44 f0          	cmove  rsi,rax
  4033d3:	c7 44 24 18 00 00 00 	mov    DWORD PTR [rsp+0x18],0x0
  4033da:	00 
  4033db:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
  4033e2:	00 00 
  4033e4:	89 74 24 1c          	mov    DWORD PTR [rsp+0x1c],esi
  4033e8:	4c 89 c6             	mov    rsi,r8
  4033eb:	e8 c0 f1 ff ff       	call   4025b0 <format_string_loop.constprop.0>
  4033f0:	48 83 3c 24 00       	cmp    QWORD PTR [rsp],0x0
  4033f5:	74 09                	je     403400 <vsnprintf+0x60>
  4033f7:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  4033fb:	48 83 c4 28          	add    rsp,0x28
  4033ff:	c3                   	ret    
  403400:	8b 4c 24 1c          	mov    ecx,DWORD PTR [rsp+0x1c]
  403404:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  403408:	85 c9                	test   ecx,ecx
  40340a:	74 ef                	je     4033fb <vsnprintf+0x5b>
  40340c:	48 8b 74 24 10       	mov    rsi,QWORD PTR [rsp+0x10]
  403411:	48 85 f6             	test   rsi,rsi
  403414:	74 e5                	je     4033fb <vsnprintf+0x5b>
  403416:	39 c1                	cmp    ecx,eax
  403418:	8d 51 ff             	lea    edx,[rcx-0x1]
  40341b:	48 0f 47 d0          	cmova  rdx,rax
  40341f:	c6 04 16 00          	mov    BYTE PTR [rsi+rdx*1],0x0
  403423:	48 83 c4 28          	add    rsp,0x28
  403427:	c3                   	ret    
  403428:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40342f:	00 

0000000000403430 <vsprintf>:
  403430:	f3 0f 1e fa          	endbr64 
  403434:	48 89 d1             	mov    rcx,rdx
  403437:	48 89 f2             	mov    rdx,rsi
  40343a:	be ff ff ff 7f       	mov    esi,0x7fffffff
  40343f:	e9 5c ff ff ff       	jmp    4033a0 <vsnprintf>
  403444:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40344b:	00 00 00 
  40344e:	66 90                	xchg   ax,ax

0000000000403450 <vfctprintf>:
  403450:	f3 0f 1e fa          	endbr64 
  403454:	48 83 ec 28          	sub    rsp,0x28
  403458:	49 89 f0             	mov    r8,rsi
  40345b:	48 89 d6             	mov    rsi,rdx
  40345e:	48 b8 00 00 00 00 ff 	movabs rax,0x7fffffff00000000
  403465:	ff ff 7f 
  403468:	48 89 3c 24          	mov    QWORD PTR [rsp],rdi
  40346c:	48 89 ca             	mov    rdx,rcx
  40346f:	48 89 e7             	mov    rdi,rsp
  403472:	4c 89 44 24 08       	mov    QWORD PTR [rsp+0x8],r8
  403477:	48 c7 44 24 10 00 00 	mov    QWORD PTR [rsp+0x10],0x0
  40347e:	00 00 
  403480:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  403485:	e8 26 f1 ff ff       	call   4025b0 <format_string_loop.constprop.0>
  40348a:	48 83 3c 24 00       	cmp    QWORD PTR [rsp],0x0
  40348f:	74 0f                	je     4034a0 <vfctprintf+0x50>
  403491:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  403495:	48 83 c4 28          	add    rsp,0x28
  403499:	c3                   	ret    
  40349a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4034a0:	8b 4c 24 1c          	mov    ecx,DWORD PTR [rsp+0x1c]
  4034a4:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  4034a8:	85 c9                	test   ecx,ecx
  4034aa:	74 e9                	je     403495 <vfctprintf+0x45>
  4034ac:	48 8b 74 24 10       	mov    rsi,QWORD PTR [rsp+0x10]
  4034b1:	48 85 f6             	test   rsi,rsi
  4034b4:	74 df                	je     403495 <vfctprintf+0x45>
  4034b6:	39 c1                	cmp    ecx,eax
  4034b8:	8d 51 ff             	lea    edx,[rcx-0x1]
  4034bb:	48 0f 47 d0          	cmova  rdx,rax
  4034bf:	c6 04 16 00          	mov    BYTE PTR [rsi+rdx*1],0x0
  4034c3:	48 83 c4 28          	add    rsp,0x28
  4034c7:	c3                   	ret    
  4034c8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4034cf:	00 

00000000004034d0 <printf>:
  4034d0:	f3 0f 1e fa          	endbr64 
  4034d4:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  4034db:	48 89 74 24 28       	mov    QWORD PTR [rsp+0x28],rsi
  4034e0:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
  4034e5:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  4034ea:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  4034ef:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  4034f4:	84 c0                	test   al,al
  4034f6:	74 37                	je     40352f <printf+0x5f>
  4034f8:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  4034fd:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  403502:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  403507:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  40350e:	00 
  40350f:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  403516:	00 
  403517:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  40351e:	00 
  40351f:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  403526:	00 
  403527:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  40352e:	00 
  40352f:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  403536:	00 
  403537:	48 8d 74 24 08       	lea    rsi,[rsp+0x8]
  40353c:	c7 44 24 08 08 00 00 	mov    DWORD PTR [rsp+0x8],0x8
  403543:	00 
  403544:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403549:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  40354e:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  403555:	00 
  403556:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  40355b:	e8 c0 fd ff ff       	call   403320 <vprintf>
  403560:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  403567:	c3                   	ret    
  403568:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40356f:	00 

0000000000403570 <sprintf>:
  403570:	f3 0f 1e fa          	endbr64 
  403574:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  40357b:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
  403580:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  403585:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  40358a:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  40358f:	84 c0                	test   al,al
  403591:	74 37                	je     4035ca <sprintf+0x5a>
  403593:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  403598:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  40359d:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  4035a2:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  4035a9:	00 
  4035aa:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  4035b1:	00 
  4035b2:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  4035b9:	00 
  4035ba:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  4035c1:	00 
  4035c2:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  4035c9:	00 
  4035ca:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  4035d1:	00 
  4035d2:	48 8d 54 24 08       	lea    rdx,[rsp+0x8]
  4035d7:	c7 44 24 08 10 00 00 	mov    DWORD PTR [rsp+0x8],0x10
  4035de:	00 
  4035df:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  4035e4:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  4035e9:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  4035f0:	00 
  4035f1:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  4035f6:	e8 35 fe ff ff       	call   403430 <vsprintf>
  4035fb:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  403602:	c3                   	ret    
  403603:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  40360a:	00 00 00 
  40360d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000403610 <snprintf>:
  403610:	f3 0f 1e fa          	endbr64 
  403614:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  40361b:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  403620:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  403625:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  40362a:	84 c0                	test   al,al
  40362c:	74 37                	je     403665 <snprintf+0x55>
  40362e:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  403633:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  403638:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  40363d:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  403644:	00 
  403645:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  40364c:	00 
  40364d:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  403654:	00 
  403655:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  40365c:	00 
  40365d:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  403664:	00 
  403665:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  40366c:	00 
  40366d:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
  403672:	c7 44 24 08 18 00 00 	mov    DWORD PTR [rsp+0x8],0x18
  403679:	00 
  40367a:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  40367f:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  403684:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  40368b:	00 
  40368c:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  403691:	e8 0a fd ff ff       	call   4033a0 <vsnprintf>
  403696:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  40369d:	c3                   	ret    
  40369e:	66 90                	xchg   ax,ax

00000000004036a0 <fctprintf>:
  4036a0:	f3 0f 1e fa          	endbr64 
  4036a4:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  4036ab:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  4036b0:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  4036b5:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  4036ba:	84 c0                	test   al,al
  4036bc:	74 37                	je     4036f5 <fctprintf+0x55>
  4036be:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  4036c3:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  4036c8:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  4036cd:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  4036d4:	00 
  4036d5:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  4036dc:	00 
  4036dd:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  4036e4:	00 
  4036e5:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  4036ec:	00 
  4036ed:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  4036f4:	00 
  4036f5:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  4036fc:	00 
  4036fd:	48 8d 4c 24 08       	lea    rcx,[rsp+0x8]
  403702:	c7 44 24 08 18 00 00 	mov    DWORD PTR [rsp+0x8],0x18
  403709:	00 
  40370a:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  40370f:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  403714:	c7 44 24 0c 30 00 00 	mov    DWORD PTR [rsp+0xc],0x30
  40371b:	00 
  40371c:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  403721:	e8 2a fd ff ff       	call   403450 <vfctprintf>
  403726:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  40372d:	c3                   	ret    
  40372e:	66 90                	xchg   ax,ax

0000000000403730 <putchar>:
  403730:	f3 0f 1e fa          	endbr64 
  403734:	41 54                	push   r12
  403736:	41 89 fc             	mov    r12d,edi
  403739:	40 0f be ff          	movsx  edi,dil
  40373d:	e8 0e 00 00 00       	call   403750 <putchar_>
  403742:	44 89 e0             	mov    eax,r12d
  403745:	41 5c                	pop    r12
  403747:	c3                   	ret    
  403748:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40374f:	00 

0000000000403750 <putchar_>:
  403750:	f3 0f 1e fa          	endbr64 
  403754:	48 83 ec 18          	sub    rsp,0x18
  403758:	ba 01 00 00 00       	mov    edx,0x1
  40375d:	31 c0                	xor    eax,eax
  40375f:	40 88 7c 24 0c       	mov    BYTE PTR [rsp+0xc],dil
  403764:	48 8d 74 24 0c       	lea    rsi,[rsp+0xc]
  403769:	bf 01 00 00 00       	mov    edi,0x1
  40376e:	e8 ed 00 00 00       	call   403860 <write>
  403773:	48 83 c4 18          	add    rsp,0x18
  403777:	c3                   	ret    
  403778:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40377f:	00 

0000000000403780 <reg_dev>:
  403780:	55                   	push   rbp
  403781:	48 89 e5             	mov    rbp,rsp
  403784:	b8 00 00 00 00       	mov    eax,0x0
  403789:	55                   	push   rbp
  40378a:	48 0f 05             	rex.W syscall 
  40378d:	5d                   	pop    rbp
  40378e:	c9                   	leave  
  40378f:	c3                   	ret    

0000000000403790 <dispose_dev>:
  403790:	55                   	push   rbp
  403791:	48 89 e5             	mov    rbp,rsp
  403794:	b8 01 00 00 00       	mov    eax,0x1
  403799:	55                   	push   rbp
  40379a:	48 0f 05             	rex.W syscall 
  40379d:	5d                   	pop    rbp
  40379e:	c9                   	leave  
  40379f:	c3                   	ret    

00000000004037a0 <reg_drv>:
  4037a0:	55                   	push   rbp
  4037a1:	48 89 e5             	mov    rbp,rsp
  4037a4:	b8 02 00 00 00       	mov    eax,0x2
  4037a9:	55                   	push   rbp
  4037aa:	48 0f 05             	rex.W syscall 
  4037ad:	5d                   	pop    rbp
  4037ae:	c9                   	leave  
  4037af:	c3                   	ret    

00000000004037b0 <dispose_drv>:
  4037b0:	55                   	push   rbp
  4037b1:	48 89 e5             	mov    rbp,rsp
  4037b4:	b8 03 00 00 00       	mov    eax,0x3
  4037b9:	55                   	push   rbp
  4037ba:	48 0f 05             	rex.W syscall 
  4037bd:	5d                   	pop    rbp
  4037be:	c9                   	leave  
  4037bf:	c3                   	ret    

00000000004037c0 <call_drvfunc>:
  4037c0:	55                   	push   rbp
  4037c1:	48 89 e5             	mov    rbp,rsp
  4037c4:	b8 04 00 00 00       	mov    eax,0x4
  4037c9:	55                   	push   rbp
  4037ca:	48 0f 05             	rex.W syscall 
  4037cd:	5d                   	pop    rbp
  4037ce:	c9                   	leave  
  4037cf:	c3                   	ret    

00000000004037d0 <req_mem>:
  4037d0:	55                   	push   rbp
  4037d1:	48 89 e5             	mov    rbp,rsp
  4037d4:	b8 05 00 00 00       	mov    eax,0x5
  4037d9:	55                   	push   rbp
  4037da:	48 0f 05             	rex.W syscall 
  4037dd:	5d                   	pop    rbp
  4037de:	c9                   	leave  
  4037df:	c3                   	ret    

00000000004037e0 <free_mem>:
  4037e0:	55                   	push   rbp
  4037e1:	48 89 e5             	mov    rbp,rsp
  4037e4:	b8 06 00 00 00       	mov    eax,0x6
  4037e9:	55                   	push   rbp
  4037ea:	48 0f 05             	rex.W syscall 
  4037ed:	5d                   	pop    rbp
  4037ee:	c9                   	leave  
  4037ef:	c3                   	ret    

00000000004037f0 <reg_proc>:
  4037f0:	55                   	push   rbp
  4037f1:	48 89 e5             	mov    rbp,rsp
  4037f4:	b8 07 00 00 00       	mov    eax,0x7
  4037f9:	55                   	push   rbp
  4037fa:	48 0f 05             	rex.W syscall 
  4037fd:	5d                   	pop    rbp
  4037fe:	c9                   	leave  
  4037ff:	c3                   	ret    

0000000000403800 <del_proc>:
  403800:	55                   	push   rbp
  403801:	48 89 e5             	mov    rbp,rsp
  403804:	b8 08 00 00 00       	mov    eax,0x8
  403809:	55                   	push   rbp
  40380a:	48 0f 05             	rex.W syscall 
  40380d:	5d                   	pop    rbp
  40380e:	c9                   	leave  
  40380f:	c3                   	ret    

0000000000403810 <get_proc_addr>:
  403810:	55                   	push   rbp
  403811:	48 89 e5             	mov    rbp,rsp
  403814:	b8 09 00 00 00       	mov    eax,0x9
  403819:	55                   	push   rbp
  40381a:	48 0f 05             	rex.W syscall 
  40381d:	5d                   	pop    rbp
  40381e:	c9                   	leave  
  40381f:	c3                   	ret    

0000000000403820 <chk_vm>:
  403820:	55                   	push   rbp
  403821:	48 89 e5             	mov    rbp,rsp
  403824:	b8 0a 00 00 00       	mov    eax,0xa
  403829:	55                   	push   rbp
  40382a:	48 0f 05             	rex.W syscall 
  40382d:	5d                   	pop    rbp
  40382e:	c9                   	leave  
  40382f:	c3                   	ret    

0000000000403830 <open>:
  403830:	55                   	push   rbp
  403831:	48 89 e5             	mov    rbp,rsp
  403834:	b8 0b 00 00 00       	mov    eax,0xb
  403839:	55                   	push   rbp
  40383a:	48 0f 05             	rex.W syscall 
  40383d:	5d                   	pop    rbp
  40383e:	c9                   	leave  
  40383f:	c3                   	ret    

0000000000403840 <close>:
  403840:	55                   	push   rbp
  403841:	48 89 e5             	mov    rbp,rsp
  403844:	b8 0c 00 00 00       	mov    eax,0xc
  403849:	55                   	push   rbp
  40384a:	48 0f 05             	rex.W syscall 
  40384d:	5d                   	pop    rbp
  40384e:	c9                   	leave  
  40384f:	c3                   	ret    

0000000000403850 <read>:
  403850:	55                   	push   rbp
  403851:	48 89 e5             	mov    rbp,rsp
  403854:	b8 0d 00 00 00       	mov    eax,0xd
  403859:	55                   	push   rbp
  40385a:	48 0f 05             	rex.W syscall 
  40385d:	5d                   	pop    rbp
  40385e:	c9                   	leave  
  40385f:	c3                   	ret    

0000000000403860 <write>:
  403860:	55                   	push   rbp
  403861:	48 89 e5             	mov    rbp,rsp
  403864:	b8 0e 00 00 00       	mov    eax,0xe
  403869:	55                   	push   rbp
  40386a:	48 0f 05             	rex.W syscall 
  40386d:	5d                   	pop    rbp
  40386e:	c9                   	leave  
  40386f:	c3                   	ret    

0000000000403870 <seek>:
  403870:	55                   	push   rbp
  403871:	48 89 e5             	mov    rbp,rsp
  403874:	b8 0f 00 00 00       	mov    eax,0xf
  403879:	55                   	push   rbp
  40387a:	48 0f 05             	rex.W syscall 
  40387d:	5d                   	pop    rbp
  40387e:	c9                   	leave  
  40387f:	c3                   	ret    

0000000000403880 <tell>:
  403880:	55                   	push   rbp
  403881:	48 89 e5             	mov    rbp,rsp
  403884:	b8 10 00 00 00       	mov    eax,0x10
  403889:	55                   	push   rbp
  40388a:	48 0f 05             	rex.W syscall 
  40388d:	5d                   	pop    rbp
  40388e:	c9                   	leave  
  40388f:	c3                   	ret    

0000000000403890 <reg_vol>:
  403890:	55                   	push   rbp
  403891:	48 89 e5             	mov    rbp,rsp
  403894:	b8 11 00 00 00       	mov    eax,0x11
  403899:	55                   	push   rbp
  40389a:	48 0f 05             	rex.W syscall 
  40389d:	5d                   	pop    rbp
  40389e:	c9                   	leave  
  40389f:	c3                   	ret    

00000000004038a0 <free_vol>:
  4038a0:	55                   	push   rbp
  4038a1:	48 89 e5             	mov    rbp,rsp
  4038a4:	b8 12 00 00 00       	mov    eax,0x12
  4038a9:	55                   	push   rbp
  4038aa:	48 0f 05             	rex.W syscall 
  4038ad:	5d                   	pop    rbp
  4038ae:	c9                   	leave  
  4038af:	c3                   	ret    

00000000004038b0 <exec>:
  4038b0:	55                   	push   rbp
  4038b1:	48 89 e5             	mov    rbp,rsp
  4038b4:	b8 13 00 00 00       	mov    eax,0x13
  4038b9:	55                   	push   rbp
  4038ba:	48 0f 05             	rex.W syscall 
  4038bd:	5d                   	pop    rbp
  4038be:	c9                   	leave  
  4038bf:	c3                   	ret    

00000000004038c0 <exit>:
  4038c0:	55                   	push   rbp
  4038c1:	48 89 e5             	mov    rbp,rsp
  4038c4:	b8 14 00 00 00       	mov    eax,0x14
  4038c9:	55                   	push   rbp
  4038ca:	48 0f 05             	rex.W syscall 
  4038cd:	5d                   	pop    rbp
  4038ce:	c9                   	leave  
  4038cf:	c3                   	ret    

00000000004038d0 <call>:
  4038d0:	55                   	push   rbp
  4038d1:	48 89 e5             	mov    rbp,rsp
  4038d4:	b8 15 00 00 00       	mov    eax,0x15
  4038d9:	55                   	push   rbp
  4038da:	48 0f 05             	rex.W syscall 
  4038dd:	5d                   	pop    rbp
  4038de:	c9                   	leave  
  4038df:	c3                   	ret    

00000000004038e0 <mkfifo>:
  4038e0:	55                   	push   rbp
  4038e1:	48 89 e5             	mov    rbp,rsp
  4038e4:	b8 16 00 00 00       	mov    eax,0x16
  4038e9:	55                   	push   rbp
  4038ea:	48 0f 05             	rex.W syscall 
  4038ed:	5d                   	pop    rbp
  4038ee:	c9                   	leave  
  4038ef:	c3                   	ret    

00000000004038f0 <brk>:
  4038f0:	55                   	push   rbp
  4038f1:	48 89 e5             	mov    rbp,rsp
  4038f4:	b8 17 00 00 00       	mov    eax,0x17
  4038f9:	55                   	push   rbp
  4038fa:	48 0f 05             	rex.W syscall 
  4038fd:	5d                   	pop    rbp
  4038fe:	c9                   	leave  
  4038ff:	c3                   	ret    

0000000000403900 <free>:
  403900:	55                   	push   rbp
  403901:	48 89 e5             	mov    rbp,rsp
  403904:	b8 18 00 00 00       	mov    eax,0x18
  403909:	55                   	push   rbp
  40390a:	48 0f 05             	rex.W syscall 
  40390d:	5d                   	pop    rbp
  40390e:	c9                   	leave  
  40390f:	c3                   	ret    

0000000000403910 <find_dev>:
  403910:	55                   	push   rbp
  403911:	48 89 e5             	mov    rbp,rsp
  403914:	b8 19 00 00 00       	mov    eax,0x19
  403919:	55                   	push   rbp
  40391a:	48 0f 05             	rex.W syscall 
  40391d:	5d                   	pop    rbp
  40391e:	c9                   	leave  
  40391f:	c3                   	ret    

0000000000403920 <operate_dev>:
  403920:	55                   	push   rbp
  403921:	48 89 e5             	mov    rbp,rsp
  403924:	b8 1a 00 00 00       	mov    eax,0x1a
  403929:	55                   	push   rbp
  40392a:	48 0f 05             	rex.W syscall 
  40392d:	5d                   	pop    rbp
  40392e:	c9                   	leave  
  40392f:	c3                   	ret    

0000000000403930 <fork>:
  403930:	55                   	push   rbp
  403931:	48 89 e5             	mov    rbp,rsp
  403934:	b8 1b 00 00 00       	mov    eax,0x1b
  403939:	55                   	push   rbp
  40393a:	48 0f 05             	rex.W syscall 
  40393d:	5d                   	pop    rbp
  40393e:	c9                   	leave  
  40393f:	c3                   	ret    

0000000000403940 <execve>:
  403940:	55                   	push   rbp
  403941:	48 89 e5             	mov    rbp,rsp
  403944:	b8 1c 00 00 00       	mov    eax,0x1c
  403949:	55                   	push   rbp
  40394a:	48 0f 05             	rex.W syscall 
  40394d:	5d                   	pop    rbp
  40394e:	c9                   	leave  
  40394f:	c3                   	ret    

0000000000403950 <waitpid>:
  403950:	55                   	push   rbp
  403951:	48 89 e5             	mov    rbp,rsp
  403954:	b8 1d 00 00 00       	mov    eax,0x1d
  403959:	55                   	push   rbp
  40395a:	48 0f 05             	rex.W syscall 
  40395d:	5d                   	pop    rbp
  40395e:	c9                   	leave  
  40395f:	c3                   	ret    

0000000000403960 <mmap>:
  403960:	55                   	push   rbp
  403961:	48 89 e5             	mov    rbp,rsp
  403964:	b8 1e 00 00 00       	mov    eax,0x1e
  403969:	55                   	push   rbp
  40396a:	48 0f 05             	rex.W syscall 
  40396d:	5d                   	pop    rbp
  40396e:	c9                   	leave  
  40396f:	c3                   	ret    

0000000000403970 <munmap>:
  403970:	55                   	push   rbp
  403971:	48 89 e5             	mov    rbp,rsp
  403974:	b8 1f 00 00 00       	mov    eax,0x1f
  403979:	55                   	push   rbp
  40397a:	48 0f 05             	rex.W syscall 
  40397d:	5d                   	pop    rbp
  40397e:	c9                   	leave  
  40397f:	c3                   	ret    

0000000000403980 <mknod>:
  403980:	55                   	push   rbp
  403981:	48 89 e5             	mov    rbp,rsp
  403984:	b8 21 00 00 00       	mov    eax,0x21
  403989:	55                   	push   rbp
  40398a:	48 0f 05             	rex.W syscall 
  40398d:	5d                   	pop    rbp
  40398e:	c9                   	leave  
  40398f:	c3                   	ret    

0000000000403990 <kb_readc>:
  403990:	55                   	push   rbp
  403991:	48 89 e5             	mov    rbp,rsp
  403994:	b8 64 00 00 00       	mov    eax,0x64
  403999:	55                   	push   rbp
  40399a:	48 0f 05             	rex.W syscall 
  40399d:	5d                   	pop    rbp
  40399e:	c9                   	leave  
  40399f:	c3                   	ret    
