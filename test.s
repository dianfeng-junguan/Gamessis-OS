
bin/test.elf:     file format elf64-x86-64


Disassembly of section .text:

0000000000401000 <__main>:
  401000:	f3 0f 1e fa          	endbr64 
  401004:	55                   	push   rbp
  401005:	48 89 e5             	mov    rbp,rsp
  401008:	90                   	nop
  401009:	5d                   	pop    rbp
  40100a:	c3                   	ret    

000000000040100b <__stack_chk_fail>:
  40100b:	f3 0f 1e fa          	endbr64 
  40100f:	55                   	push   rbp
  401010:	48 89 e5             	mov    rbp,rsp
  401013:	90                   	nop
  401014:	5d                   	pop    rbp
  401015:	c3                   	ret    

0000000000401016 <main>:
  401016:	f3 0f 1e fa          	endbr64 
  40101a:	55                   	push   rbp
  40101b:	48 89 e5             	mov    rbp,rsp
  40101e:	48 81 ec b0 00 00 00 	sub    rsp,0xb0
  401025:	89 bd 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edi
  40102b:	48 89 b5 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],rsi
  401032:	48 8b 05 cf 6f 00 00 	mov    rax,QWORD PTR [rip+0x6fcf]        # 408008 <as>
  401039:	48 89 c7             	mov    rdi,rax
  40103c:	e8 df 01 00 00       	call   401220 <puts>
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
  4010c7:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  4010ce:	ba 80 00 00 00       	mov    edx,0x80
  4010d3:	be 00 00 00 00       	mov    esi,0x0
  4010d8:	48 89 c7             	mov    rdi,rax
  4010db:	e8 e0 01 00 00       	call   4012c0 <memset>
  4010e0:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  4010e7:	48 8d 05 25 4f 00 00 	lea    rax,[rip+0x4f25]        # 406013 <kb_readc+0x104b>
  4010ee:	48 89 c7             	mov    rdi,rax
  4010f1:	b8 00 00 00 00       	mov    eax,0x0
  4010f6:	e8 f5 24 00 00       	call   4035f0 <printf>
  4010fb:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  401102:	48 89 c7             	mov    rdi,rax
  401105:	b8 00 00 00 00       	mov    eax,0x0
  40110a:	e8 71 01 00 00       	call   401280 <gets>
  40110f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  401112:	48 98                	cdqe   
  401114:	c6 84 05 70 ff ff ff 	mov    BYTE PTR [rbp+rax*1-0x90],0x0
  40111b:	00 
  40111c:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  401123:	48 89 c7             	mov    rdi,rax
  401126:	e8 f5 00 00 00       	call   401220 <puts>
  40112b:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  401132:	48 8d 15 e2 4e 00 00 	lea    rdx,[rip+0x4ee2]        # 40601b <kb_readc+0x1053>
  401139:	48 89 d6             	mov    rsi,rdx
  40113c:	48 89 c7             	mov    rdi,rax
  40113f:	e8 0c 02 00 00       	call   401350 <strcmpk>
  401144:	85 c0                	test   eax,eax
  401146:	75 14                	jne    40115c <main+0x146>
  401148:	48 8d 05 d4 4e 00 00 	lea    rax,[rip+0x4ed4]        # 406023 <kb_readc+0x105b>
  40114f:	48 89 c7             	mov    rdi,rax
  401152:	e8 c9 00 00 00       	call   401220 <puts>
  401157:	e9 6b ff ff ff       	jmp    4010c7 <main+0xb1>
  40115c:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  401163:	48 8d 15 cb 4e 00 00 	lea    rdx,[rip+0x4ecb]        # 406035 <kb_readc+0x106d>
  40116a:	48 89 d6             	mov    rsi,rdx
  40116d:	48 89 c7             	mov    rdi,rax
  401170:	e8 db 01 00 00       	call   401350 <strcmpk>
  401175:	85 c0                	test   eax,eax
  401177:	0f 84 92 00 00 00    	je     40120f <main+0x1f9>
  40117d:	48 8d 05 b6 4e 00 00 	lea    rax,[rip+0x4eb6]        # 40603a <kb_readc+0x1072>
  401184:	48 89 c7             	mov    rdi,rax
  401187:	e8 94 00 00 00       	call   401220 <puts>
  40118c:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  401193:	e8 10 3a 00 00       	call   404ba8 <fork>
  401198:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  40119b:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  40119f:	75 50                	jne    4011f1 <main+0x1db>
  4011a1:	48 8d 05 a7 4e 00 00 	lea    rax,[rip+0x4ea7]        # 40604f <kb_readc+0x1087>
  4011a8:	48 89 c7             	mov    rdi,rax
  4011ab:	e8 70 00 00 00       	call   401220 <puts>
  4011b0:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  4011b7:	ba 00 00 00 00       	mov    edx,0x0
  4011bc:	be 00 00 00 00       	mov    esi,0x0
  4011c1:	48 89 c7             	mov    rdi,rax
  4011c4:	e8 8f 3a 00 00       	call   404c58 <execve>
  4011c9:	83 f8 ff             	cmp    eax,0xffffffff
  4011cc:	75 23                	jne    4011f1 <main+0x1db>
  4011ce:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
  4011d5:	48 89 c6             	mov    rsi,rax
  4011d8:	48 8d 05 88 4e 00 00 	lea    rax,[rip+0x4e88]        # 406067 <kb_readc+0x109f>
  4011df:	48 89 c7             	mov    rdi,rax
  4011e2:	b8 00 00 00 00       	mov    eax,0x0
  4011e7:	e8 04 24 00 00       	call   4035f0 <printf>
  4011ec:	e9 d6 fe ff ff       	jmp    4010c7 <main+0xb1>
  4011f1:	c7 85 6c ff ff ff 00 	mov    DWORD PTR [rbp-0x94],0x0
  4011f8:	00 00 00 
  4011fb:	48 8d 85 6c ff ff ff 	lea    rax,[rbp-0x94]
  401202:	48 89 c7             	mov    rdi,rax
  401205:	e8 fe 3a 00 00       	call   404d08 <wait>
  40120a:	e9 b8 fe ff ff       	jmp    4010c7 <main+0xb1>
  40120f:	90                   	nop
  401210:	b8 00 00 00 00       	mov    eax,0x0
  401215:	c9                   	leave  
  401216:	c3                   	ret    
  401217:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40121e:	00 00 

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
  401238:	e8 93 26 00 00       	call   4038d0 <putchar>
  40123d:	41 89 dc             	mov    r12d,ebx
  401240:	48 83 c3 01          	add    rbx,0x1
  401244:	0f be 7c 1d 00       	movsx  edi,BYTE PTR [rbp+rbx*1+0x0]
  401249:	40 84 ff             	test   dil,dil
  40124c:	75 ea                	jne    401238 <puts+0x18>
  40124e:	bf 0a 00 00 00       	mov    edi,0xa
  401253:	e8 78 26 00 00       	call   4038d0 <putchar>
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
  401272:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  401279:	00 00 00 
  40127c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000401280 <gets>:
  401280:	f3 0f 1e fa          	endbr64 
  401284:	41 54                	push   r12
  401286:	49 89 fc             	mov    r12,rdi
  401289:	eb 09                	jmp    401294 <gets+0x14>
  40128b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  401290:	49 83 c4 01          	add    r12,0x1
  401294:	41 0f be 34 24       	movsx  esi,BYTE PTR [r12]
  401299:	31 c0                	xor    eax,eax
  40129b:	ba 01 00 00 00       	mov    edx,0x1
  4012a0:	bf 01 00 00 00       	mov    edi,0x1
  4012a5:	e8 5e 2f 00 00       	call   404208 <read>
  4012aa:	41 80 3c 24 0a       	cmp    BYTE PTR [r12],0xa
  4012af:	75 df                	jne    401290 <gets+0x10>
  4012b1:	4c 89 e0             	mov    rax,r12
  4012b4:	41 c6 04 24 00       	mov    BYTE PTR [r12],0x0
  4012b9:	41 5c                	pop    r12
  4012bb:	c3                   	ret    
  4012bc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

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
  401344:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  40134b:	00 00 00 
  40134e:	66 90                	xchg   ax,ax

0000000000401350 <strcmpk>:
  401350:	f3 0f 1e fa          	endbr64 
  401354:	48 39 f7             	cmp    rdi,rsi
  401357:	74 34                	je     40138d <strcmpk+0x3d>
  401359:	48 85 ff             	test   rdi,rdi
  40135c:	74 38                	je     401396 <strcmpk+0x46>
  40135e:	48 85 f6             	test   rsi,rsi
  401361:	74 33                	je     401396 <strcmpk+0x46>
  401363:	0f b6 17             	movzx  edx,BYTE PTR [rdi]
  401366:	0f be 0e             	movsx  ecx,BYTE PTR [rsi]
  401369:	38 ca                	cmp    dl,cl
  40136b:	75 23                	jne    401390 <strcmpk+0x40>
  40136d:	b8 01 00 00 00       	mov    eax,0x1
  401372:	eb 15                	jmp    401389 <strcmpk+0x39>
  401374:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401378:	0f b6 14 07          	movzx  edx,BYTE PTR [rdi+rax*1]
  40137c:	48 83 c0 01          	add    rax,0x1
  401380:	0f be 4c 06 ff       	movsx  ecx,BYTE PTR [rsi+rax*1-0x1]
  401385:	38 ca                	cmp    dl,cl
  401387:	75 07                	jne    401390 <strcmpk+0x40>
  401389:	84 d2                	test   dl,dl
  40138b:	75 eb                	jne    401378 <strcmpk+0x28>
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
  4013b6:	66 0f 57 05 52 4f 00 	xorpd  xmm0,XMMWORD PTR [rip+0x4f52]        # 406310 <powers_of_10+0x90>
  4013bd:	00 
  4013be:	f2 48 0f 2c c8       	cvttsd2si rcx,xmm0
  4013c3:	66 0f ef d2          	pxor   xmm2,xmm2
  4013c7:	66 0f 28 c8          	movapd xmm1,xmm0
  4013cb:	89 f2                	mov    edx,esi
  4013cd:	4c 8d 05 ac 4e 00 00 	lea    r8,[rip+0x4eac]        # 406280 <powers_of_10>
  4013d4:	f2 41 0f 10 1c d0    	movsd  xmm3,QWORD PTR [r8+rdx*8]
  4013da:	f2 48 0f 2a d1       	cvtsi2sd xmm2,rcx
  4013df:	f2 0f 5c ca          	subsd  xmm1,xmm2
  4013e3:	66 0f ef d2          	pxor   xmm2,xmm2
  4013e7:	f2 0f 59 cb          	mulsd  xmm1,xmm3
  4013eb:	f2 48 0f 2c d1       	cvttsd2si rdx,xmm1
  4013f0:	f2 48 0f 2a d2       	cvtsi2sd xmm2,rdx
  4013f5:	f2 0f 5c ca          	subsd  xmm1,xmm2
  4013f9:	f2 0f 10 15 1f 4f 00 	movsd  xmm2,QWORD PTR [rip+0x4f1f]        # 406320 <powers_of_10+0xa0>
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
  401498:	e9 53 24 00 00       	jmp    4038f0 <putchar_>
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
  401546:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
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
  4015d4:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
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
  4015f5:	48 83 ec 38          	sub    rsp,0x38
  4015f9:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  401600:	00 00 
  401602:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
  401607:	31 c0                	xor    eax,eax
  401609:	44 8b 44 24 70       	mov    r8d,DWORD PTR [rsp+0x70]
  40160e:	48 85 f6             	test   rsi,rsi
  401611:	0f 85 51 01 00 00    	jne    401768 <print_integer+0x188>
  401617:	41 f7 c0 00 08 00 00 	test   r8d,0x800
  40161e:	0f 85 1c 02 00 00    	jne    401840 <print_integer+0x260>
  401624:	c6 04 24 30          	mov    BYTE PTR [rsp],0x30
  401628:	41 83 e0 ef          	and    r8d,0xffffffef
  40162c:	bf 01 00 00 00       	mov    edi,0x1
  401631:	41 bd 01 00 00 00    	mov    r13d,0x1
  401637:	41 f6 c0 02          	test   r8b,0x2
  40163b:	0f 85 97 01 00 00    	jne    4017d8 <print_integer+0x1f8>
  401641:	44 89 c0             	mov    eax,r8d
  401644:	83 e0 01             	and    eax,0x1
  401647:	45 85 c9             	test   r9d,r9d
  40164a:	0f 84 88 01 00 00    	je     4017d8 <print_integer+0x1f8>
  401650:	85 c0                	test   eax,eax
  401652:	0f 84 80 01 00 00    	je     4017d8 <print_integer+0x1f8>
  401658:	84 db                	test   bl,bl
  40165a:	0f 85 80 02 00 00    	jne    4018e0 <print_integer+0x300>
  401660:	41 f6 c0 0c          	test   r8b,0xc
  401664:	0f 85 76 02 00 00    	jne    4018e0 <print_integer+0x300>
  40166a:	45 39 cd             	cmp    r13d,r9d
  40166d:	0f 83 65 01 00 00    	jae    4017d8 <print_integer+0x1f8>
  401673:	40 84 ff             	test   dil,dil
  401676:	0f 84 5c 01 00 00    	je     4017d8 <print_integer+0x1f8>
  40167c:	48 89 e6             	mov    rsi,rsp
  40167f:	44 89 e8             	mov    eax,r13d
  401682:	44 89 ea             	mov    edx,r13d
  401685:	48 01 f0             	add    rax,rsi
  401688:	eb 0a                	jmp    401694 <print_integer+0xb4>
  40168a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  401690:	84 c9                	test   cl,cl
  401692:	74 15                	je     4016a9 <print_integer+0xc9>
  401694:	83 c2 01             	add    edx,0x1
  401697:	c6 00 30             	mov    BYTE PTR [rax],0x30
  40169a:	83 fa 1f             	cmp    edx,0x1f
  40169d:	0f 96 c1             	setbe  cl
  4016a0:	48 83 c0 01          	add    rax,0x1
  4016a4:	44 39 ca             	cmp    edx,r9d
  4016a7:	72 e7                	jb     401690 <print_integer+0xb0>
  4016a9:	41 39 d3             	cmp    r11d,edx
  4016ac:	76 26                	jbe    4016d4 <print_integer+0xf4>
  4016ae:	84 c9                	test   cl,cl
  4016b0:	74 22                	je     4016d4 <print_integer+0xf4>
  4016b2:	89 d0                	mov    eax,edx
  4016b4:	48 01 f0             	add    rax,rsi
  4016b7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4016be:	00 00 
  4016c0:	83 c2 01             	add    edx,0x1
  4016c3:	c6 00 30             	mov    BYTE PTR [rax],0x30
  4016c6:	48 83 c0 01          	add    rax,0x1
  4016ca:	41 39 d3             	cmp    r11d,edx
  4016cd:	76 05                	jbe    4016d4 <print_integer+0xf4>
  4016cf:	83 fa 1f             	cmp    edx,0x1f
  4016d2:	76 ec                	jbe    4016c0 <print_integer+0xe0>
  4016d4:	41 39 d5             	cmp    r13d,edx
  4016d7:	40 0f 92 c7          	setb   dil
  4016db:	41 80 fc 08          	cmp    r12b,0x8
  4016df:	0f 94 c0             	sete   al
  4016e2:	40 20 f8             	and    al,dil
  4016e5:	74 06                	je     4016ed <print_integer+0x10d>
  4016e7:	41 83 e0 ef          	and    r8d,0xffffffef
  4016eb:	89 c7                	mov    edi,eax
  4016ed:	41 f7 c0 10 20 00 00 	test   r8d,0x2010
  4016f4:	0f 84 2a 01 00 00    	je     401824 <print_integer+0x244>
  4016fa:	41 f7 c0 00 08 00 00 	test   r8d,0x800
  401701:	0f 84 f1 00 00 00    	je     4017f8 <print_integer+0x218>
  401707:	83 fa 1f             	cmp    edx,0x1f
  40170a:	0f 96 c0             	setbe  al
  40170d:	41 80 fc 10          	cmp    r12b,0x10
  401711:	0f 84 d9 01 00 00    	je     4018f0 <print_integer+0x310>
  401717:	41 80 fc 02          	cmp    r12b,0x2
  40171b:	75 0d                	jne    40172a <print_integer+0x14a>
  40171d:	84 c0                	test   al,al
  40171f:	74 09                	je     40172a <print_integer+0x14a>
  401721:	89 d0                	mov    eax,edx
  401723:	83 c2 01             	add    edx,0x1
  401726:	c6 04 04 62          	mov    BYTE PTR [rsp+rax*1],0x62
  40172a:	83 fa 20             	cmp    edx,0x20
  40172d:	0f 85 a3 01 00 00    	jne    4018d6 <print_integer+0x2f6>
  401733:	44 89 c9             	mov    ecx,r9d
  401736:	48 89 ef             	mov    rdi,rbp
  401739:	e8 62 fd ff ff       	call   4014a0 <out_rev_>
  40173e:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
  401743:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
  40174a:	00 00 
  40174c:	0f 85 06 02 00 00    	jne    401958 <print_integer+0x378>
  401752:	48 83 c4 38          	add    rsp,0x38
  401756:	5b                   	pop    rbx
  401757:	5d                   	pop    rbp
  401758:	41 5c                	pop    r12
  40175a:	41 5d                	pop    r13
  40175c:	41 5e                	pop    r14
  40175e:	41 5f                	pop    r15
  401760:	c3                   	ret    
  401761:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401768:	44 89 c0             	mov    eax,r8d
  40176b:	44 0f b6 d1          	movzx  r10d,cl
  40176f:	4c 8d 7c 24 ff       	lea    r15,[rsp-0x1]
  401774:	b9 01 00 00 00       	mov    ecx,0x1
  401779:	83 e0 20             	and    eax,0x20
  40177c:	83 f8 01             	cmp    eax,0x1
  40177f:	45 19 f6             	sbb    r14d,r14d
  401782:	41 83 e6 20          	and    r14d,0x20
  401786:	41 83 c6 37          	add    r14d,0x37
  40178a:	eb 07                	jmp    401793 <print_integer+0x1b3>
  40178c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401790:	48 89 c6             	mov    rsi,rax
  401793:	31 d2                	xor    edx,edx
  401795:	48 89 f0             	mov    rax,rsi
  401798:	49 f7 f2             	div    r10
  40179b:	44 8d 6a 30          	lea    r13d,[rdx+0x30]
  40179f:	48 83 fa 09          	cmp    rdx,0x9
  4017a3:	41 8d 3c 16          	lea    edi,[r14+rdx*1]
  4017a7:	41 0f 46 fd          	cmovbe edi,r13d
  4017ab:	83 f9 1f             	cmp    ecx,0x1f
  4017ae:	41 89 cd             	mov    r13d,ecx
  4017b1:	0f 96 c2             	setbe  dl
  4017b4:	41 88 3c 0f          	mov    BYTE PTR [r15+rcx*1],dil
  4017b8:	89 d7                	mov    edi,edx
  4017ba:	48 83 c1 01          	add    rcx,0x1
  4017be:	4c 39 d6             	cmp    rsi,r10
  4017c1:	0f 82 70 fe ff ff    	jb     401637 <print_integer+0x57>
  4017c7:	84 d2                	test   dl,dl
  4017c9:	75 c5                	jne    401790 <print_integer+0x1b0>
  4017cb:	41 f6 c0 02          	test   r8b,0x2
  4017cf:	0f 84 6c fe ff ff    	je     401641 <print_integer+0x61>
  4017d5:	0f 1f 00             	nop    DWORD PTR [rax]
  4017d8:	45 39 dd             	cmp    r13d,r11d
  4017db:	44 89 ea             	mov    edx,r13d
  4017de:	48 89 e6             	mov    rsi,rsp
  4017e1:	0f 92 c0             	setb   al
  4017e4:	40 20 c7             	and    dil,al
  4017e7:	0f 85 c5 fe ff ff    	jne    4016b2 <print_integer+0xd2>
  4017ed:	e9 fb fe ff ff       	jmp    4016ed <print_integer+0x10d>
  4017f2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4017f8:	85 d2                	test   edx,edx
  4017fa:	0f 85 80 00 00 00    	jne    401880 <print_integer+0x2a0>
  401800:	41 80 fc 10          	cmp    r12b,0x10
  401804:	0f 84 10 01 00 00    	je     40191a <print_integer+0x33a>
  40180a:	41 80 fc 02          	cmp    r12b,0x2
  40180e:	0f 85 28 01 00 00    	jne    40193c <print_integer+0x35c>
  401814:	c6 04 24 62          	mov    BYTE PTR [rsp],0x62
  401818:	b8 01 00 00 00       	mov    eax,0x1
  40181d:	c6 04 04 30          	mov    BYTE PTR [rsp+rax*1],0x30
  401821:	8d 50 01             	lea    edx,[rax+0x1]
  401824:	83 fa 20             	cmp    edx,0x20
  401827:	0f 84 06 ff ff ff    	je     401733 <print_integer+0x153>
  40182d:	84 db                	test   bl,bl
  40182f:	74 2f                	je     401860 <print_integer+0x280>
  401831:	89 d0                	mov    eax,edx
  401833:	83 c2 01             	add    edx,0x1
  401836:	c6 04 04 2d          	mov    BYTE PTR [rsp+rax*1],0x2d
  40183a:	e9 f4 fe ff ff       	jmp    401733 <print_integer+0x153>
  40183f:	90                   	nop
  401840:	44 89 c0             	mov    eax,r8d
  401843:	45 31 ed             	xor    r13d,r13d
  401846:	41 83 e0 ef          	and    r8d,0xffffffef
  40184a:	80 f9 10             	cmp    cl,0x10
  40184d:	44 0f 45 c0          	cmovne r8d,eax
  401851:	bf 01 00 00 00       	mov    edi,0x1
  401856:	e9 dc fd ff ff       	jmp    401637 <print_integer+0x57>
  40185b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  401860:	41 f6 c0 04          	test   r8b,0x4
  401864:	75 62                	jne    4018c8 <print_integer+0x2e8>
  401866:	41 f6 c0 08          	test   r8b,0x8
  40186a:	0f 84 c3 fe ff ff    	je     401733 <print_integer+0x153>
  401870:	89 d0                	mov    eax,edx
  401872:	83 c2 01             	add    edx,0x1
  401875:	c6 04 04 20          	mov    BYTE PTR [rsp+rax*1],0x20
  401879:	e9 b5 fe ff ff       	jmp    401733 <print_integer+0x153>
  40187e:	66 90                	xchg   ax,ax
  401880:	41 39 d3             	cmp    r11d,edx
  401883:	74 09                	je     40188e <print_integer+0x2ae>
  401885:	44 39 ca             	cmp    edx,r9d
  401888:	0f 85 79 fe ff ff    	jne    401707 <print_integer+0x127>
  40188e:	40 84 ff             	test   dil,dil
  401891:	0f 84 70 fe ff ff    	je     401707 <print_integer+0x127>
  401897:	89 d0                	mov    eax,edx
  401899:	83 e8 01             	sub    eax,0x1
  40189c:	0f 84 5e ff ff ff    	je     401800 <print_integer+0x220>
  4018a2:	b9 04 00 01 00       	mov    ecx,0x10004
  4018a7:	4c 0f a3 e1          	bt     rcx,r12
  4018ab:	0f 83 ac 00 00 00    	jae    40195d <print_integer+0x37d>
  4018b1:	41 39 c5             	cmp    r13d,eax
  4018b4:	0f 83 a3 00 00 00    	jae    40195d <print_integer+0x37d>
  4018ba:	83 ea 02             	sub    edx,0x2
  4018bd:	e9 45 fe ff ff       	jmp    401707 <print_integer+0x127>
  4018c2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4018c8:	89 d0                	mov    eax,edx
  4018ca:	83 c2 01             	add    edx,0x1
  4018cd:	c6 04 04 2b          	mov    BYTE PTR [rsp+rax*1],0x2b
  4018d1:	e9 5d fe ff ff       	jmp    401733 <print_integer+0x153>
  4018d6:	89 d0                	mov    eax,edx
  4018d8:	e9 40 ff ff ff       	jmp    40181d <print_integer+0x23d>
  4018dd:	0f 1f 00             	nop    DWORD PTR [rax]
  4018e0:	41 83 e9 01          	sub    r9d,0x1
  4018e4:	e9 81 fd ff ff       	jmp    40166a <print_integer+0x8a>
  4018e9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4018f0:	44 89 c1             	mov    ecx,r8d
  4018f3:	83 e1 20             	and    ecx,0x20
  4018f6:	75 0c                	jne    401904 <print_integer+0x324>
  4018f8:	84 c0                	test   al,al
  4018fa:	75 4e                	jne    40194a <print_integer+0x36a>
  4018fc:	85 c9                	test   ecx,ecx
  4018fe:	0f 84 26 fe ff ff    	je     40172a <print_integer+0x14a>
  401904:	84 c0                	test   al,al
  401906:	0f 84 1e fe ff ff    	je     40172a <print_integer+0x14a>
  40190c:	89 d0                	mov    eax,edx
  40190e:	83 c2 01             	add    edx,0x1
  401911:	c6 04 04 58          	mov    BYTE PTR [rsp+rax*1],0x58
  401915:	e9 10 fe ff ff       	jmp    40172a <print_integer+0x14a>
  40191a:	41 f6 c0 20          	test   r8b,0x20
  40191e:	75 0e                	jne    40192e <print_integer+0x34e>
  401920:	c6 04 24 78          	mov    BYTE PTR [rsp],0x78
  401924:	b8 01 00 00 00       	mov    eax,0x1
  401929:	e9 ef fe ff ff       	jmp    40181d <print_integer+0x23d>
  40192e:	c6 04 24 58          	mov    BYTE PTR [rsp],0x58
  401932:	b8 01 00 00 00       	mov    eax,0x1
  401937:	e9 e1 fe ff ff       	jmp    40181d <print_integer+0x23d>
  40193c:	c6 04 24 30          	mov    BYTE PTR [rsp],0x30
  401940:	ba 01 00 00 00       	mov    edx,0x1
  401945:	e9 e3 fe ff ff       	jmp    40182d <print_integer+0x24d>
  40194a:	89 d0                	mov    eax,edx
  40194c:	83 c2 01             	add    edx,0x1
  40194f:	c6 04 04 78          	mov    BYTE PTR [rsp+rax*1],0x78
  401953:	e9 d2 fd ff ff       	jmp    40172a <print_integer+0x14a>
  401958:	e8 ae f6 ff ff       	call   40100b <__stack_chk_fail>
  40195d:	89 c2                	mov    edx,eax
  40195f:	e9 a3 fd ff ff       	jmp    401707 <print_integer+0x127>
  401964:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  40196b:	00 00 00 
  40196e:	66 90                	xchg   ax,ax

0000000000401970 <print_broken_up_decimal.isra.0>:
  401970:	41 56                	push   r14
  401972:	49 89 ca             	mov    r10,rcx
  401975:	41 89 d3             	mov    r11d,edx
  401978:	41 55                	push   r13
  40197a:	45 89 c5             	mov    r13d,r8d
  40197d:	41 54                	push   r12
  40197f:	55                   	push   rbp
  401980:	53                   	push   rbx
  401981:	44 8b 44 24 30       	mov    r8d,DWORD PTR [rsp+0x30]
  401986:	48 8b 6c 24 38       	mov    rbp,QWORD PTR [rsp+0x38]
  40198b:	8b 4c 24 40          	mov    ecx,DWORD PTR [rsp+0x40]
  40198f:	45 85 ed             	test   r13d,r13d
  401992:	0f 84 90 00 00 00    	je     401a28 <print_broken_up_decimal.isra.0+0xb8>
  401998:	44 89 c0             	mov    eax,r8d
  40199b:	25 10 10 00 00       	and    eax,0x1010
  4019a0:	3d 00 10 00 00       	cmp    eax,0x1000
  4019a5:	0f 84 05 02 00 00    	je     401bb0 <print_broken_up_decimal.isra.0+0x240>
  4019ab:	41 89 cc             	mov    r12d,ecx
  4019ae:	89 cb                	mov    ebx,ecx
  4019b0:	42 8d 4c 29 ff       	lea    ecx,[rcx+r13*1-0x1]
  4019b5:	49 bd 67 66 66 66 66 	movabs r13,0x6666666666666667
  4019bc:	66 66 66 
  4019bf:	49 01 ec             	add    r12,rbp
  4019c2:	eb 43                	jmp    401a07 <print_broken_up_decimal.isra.0+0x97>
  4019c4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  4019c8:	48 89 f0             	mov    rax,rsi
  4019cb:	41 89 ce             	mov    r14d,ecx
  4019ce:	49 83 c4 01          	add    r12,0x1
  4019d2:	49 f7 ed             	imul   r13
  4019d5:	48 89 f0             	mov    rax,rsi
  4019d8:	41 29 de             	sub    r14d,ebx
  4019db:	83 c3 01             	add    ebx,0x1
  4019de:	48 c1 f8 3f          	sar    rax,0x3f
  4019e2:	48 c1 fa 02          	sar    rdx,0x2
  4019e6:	48 29 c2             	sub    rdx,rax
  4019e9:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  4019ed:	48 01 c0             	add    rax,rax
  4019f0:	48 29 c6             	sub    rsi,rax
  4019f3:	83 c6 30             	add    esi,0x30
  4019f6:	41 88 74 24 ff       	mov    BYTE PTR [r12-0x1],sil
  4019fb:	48 89 d6             	mov    rsi,rdx
  4019fe:	48 85 d2             	test   rdx,rdx
  401a01:	0f 84 f9 00 00 00    	je     401b00 <print_broken_up_decimal.isra.0+0x190>
  401a07:	83 fb 20             	cmp    ebx,0x20
  401a0a:	75 bc                	jne    4019c8 <print_broken_up_decimal.isra.0+0x58>
  401a0c:	44 89 c0             	mov    eax,r8d
  401a0f:	83 e0 03             	and    eax,0x3
  401a12:	83 f8 01             	cmp    eax,0x1
  401a15:	0f 84 35 01 00 00    	je     401b50 <print_broken_up_decimal.isra.0+0x1e0>
  401a1b:	ba 20 00 00 00       	mov    edx,0x20
  401a20:	e9 7d 00 00 00       	jmp    401aa2 <print_broken_up_decimal.isra.0+0x132>
  401a25:	0f 1f 00             	nop    DWORD PTR [rax]
  401a28:	41 f6 c0 10          	test   r8b,0x10
  401a2c:	0f 85 8e 00 00 00    	jne    401ac0 <print_broken_up_decimal.isra.0+0x150>
  401a32:	48 bb 67 66 66 66 66 	movabs rbx,0x6666666666666667
  401a39:	66 66 66 
  401a3c:	89 ce                	mov    esi,ecx
  401a3e:	48 01 ee             	add    rsi,rbp
  401a41:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401a48:	83 f9 20             	cmp    ecx,0x20
  401a4b:	74 bf                	je     401a0c <print_broken_up_decimal.isra.0+0x9c>
  401a4d:	48 89 f8             	mov    rax,rdi
  401a50:	83 c1 01             	add    ecx,0x1
  401a53:	48 83 c6 01          	add    rsi,0x1
  401a57:	48 f7 eb             	imul   rbx
  401a5a:	48 89 f8             	mov    rax,rdi
  401a5d:	48 c1 f8 3f          	sar    rax,0x3f
  401a61:	48 c1 fa 02          	sar    rdx,0x2
  401a65:	48 29 c2             	sub    rdx,rax
  401a68:	48 8d 04 92          	lea    rax,[rdx+rdx*4]
  401a6c:	48 01 c0             	add    rax,rax
  401a6f:	48 29 c7             	sub    rdi,rax
  401a72:	83 c7 30             	add    edi,0x30
  401a75:	40 88 7e ff          	mov    BYTE PTR [rsi-0x1],dil
  401a79:	48 89 d7             	mov    rdi,rdx
  401a7c:	48 85 d2             	test   rdx,rdx
  401a7f:	75 c7                	jne    401a48 <print_broken_up_decimal.isra.0+0xd8>
  401a81:	44 89 c0             	mov    eax,r8d
  401a84:	83 e0 03             	and    eax,0x3
  401a87:	83 f8 01             	cmp    eax,0x1
  401a8a:	0f 84 b8 01 00 00    	je     401c48 <print_broken_up_decimal.isra.0+0x2d8>
  401a90:	83 f9 20             	cmp    ecx,0x20
  401a93:	74 86                	je     401a1b <print_broken_up_decimal.isra.0+0xab>
  401a95:	45 84 db             	test   r11b,r11b
  401a98:	74 46                	je     401ae0 <print_broken_up_decimal.isra.0+0x170>
  401a9a:	c6 44 0d 00 2d       	mov    BYTE PTR [rbp+rcx*1+0x0],0x2d
  401a9f:	8d 51 01             	lea    edx,[rcx+0x1]
  401aa2:	5b                   	pop    rbx
  401aa3:	48 89 ee             	mov    rsi,rbp
  401aa6:	44 89 c9             	mov    ecx,r9d
  401aa9:	5d                   	pop    rbp
  401aaa:	4c 89 d7             	mov    rdi,r10
  401aad:	41 5c                	pop    r12
  401aaf:	41 5d                	pop    r13
  401ab1:	41 5e                	pop    r14
  401ab3:	e9 e8 f9 ff ff       	jmp    4014a0 <out_rev_>
  401ab8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  401abf:	00 
  401ac0:	83 f9 20             	cmp    ecx,0x20
  401ac3:	0f 84 43 ff ff ff    	je     401a0c <print_broken_up_decimal.isra.0+0x9c>
  401ac9:	89 c8                	mov    eax,ecx
  401acb:	83 c1 01             	add    ecx,0x1
  401ace:	c6 44 05 00 2e       	mov    BYTE PTR [rbp+rax*1+0x0],0x2e
  401ad3:	e9 5a ff ff ff       	jmp    401a32 <print_broken_up_decimal.isra.0+0xc2>
  401ad8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  401adf:	00 
  401ae0:	41 f6 c0 04          	test   r8b,0x4
  401ae4:	0f 85 3e 01 00 00    	jne    401c28 <print_broken_up_decimal.isra.0+0x2b8>
  401aea:	89 ca                	mov    edx,ecx
  401aec:	41 f6 c0 08          	test   r8b,0x8
  401af0:	74 b0                	je     401aa2 <print_broken_up_decimal.isra.0+0x132>
  401af2:	c6 44 0d 00 20       	mov    BYTE PTR [rbp+rcx*1+0x0],0x20
  401af7:	83 c2 01             	add    edx,0x1
  401afa:	eb a6                	jmp    401aa2 <print_broken_up_decimal.isra.0+0x132>
  401afc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401b00:	83 fb 1f             	cmp    ebx,0x1f
  401b03:	77 13                	ja     401b18 <print_broken_up_decimal.isra.0+0x1a8>
  401b05:	45 85 f6             	test   r14d,r14d
  401b08:	89 d8                	mov    eax,ebx
  401b0a:	0f 95 c2             	setne  dl
  401b0d:	48 01 e8             	add    rax,rbp
  401b10:	84 d2                	test   dl,dl
  401b12:	75 20                	jne    401b34 <print_broken_up_decimal.isra.0+0x1c4>
  401b14:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  401b18:	83 fb 20             	cmp    ebx,0x20
  401b1b:	0f 84 eb fe ff ff    	je     401a0c <print_broken_up_decimal.isra.0+0x9c>
  401b21:	c6 44 1d 00 2e       	mov    BYTE PTR [rbp+rbx*1+0x0],0x2e
  401b26:	8d 4b 01             	lea    ecx,[rbx+0x1]
  401b29:	e9 04 ff ff ff       	jmp    401a32 <print_broken_up_decimal.isra.0+0xc2>
  401b2e:	66 90                	xchg   ax,ax
  401b30:	39 ca                	cmp    edx,ecx
  401b32:	74 e4                	je     401b18 <print_broken_up_decimal.isra.0+0x1a8>
  401b34:	89 da                	mov    edx,ebx
  401b36:	83 c3 01             	add    ebx,0x1
  401b39:	c6 00 30             	mov    BYTE PTR [rax],0x30
  401b3c:	48 83 c0 01          	add    rax,0x1
  401b40:	83 fb 1f             	cmp    ebx,0x1f
  401b43:	76 eb                	jbe    401b30 <print_broken_up_decimal.isra.0+0x1c0>
  401b45:	eb d1                	jmp    401b18 <print_broken_up_decimal.isra.0+0x1a8>
  401b47:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  401b4e:	00 00 
  401b50:	45 85 c9             	test   r9d,r9d
  401b53:	0f 84 c2 fe ff ff    	je     401a1b <print_broken_up_decimal.isra.0+0xab>
  401b59:	31 d2                	xor    edx,edx
  401b5b:	b9 20 00 00 00       	mov    ecx,0x20
  401b60:	45 84 db             	test   r11b,r11b
  401b63:	0f 85 cf 00 00 00    	jne    401c38 <print_broken_up_decimal.isra.0+0x2c8>
  401b69:	41 f6 c0 0c          	test   r8b,0xc
  401b6d:	0f 85 c5 00 00 00    	jne    401c38 <print_broken_up_decimal.isra.0+0x2c8>
  401b73:	44 39 c9             	cmp    ecx,r9d
  401b76:	0f 83 14 ff ff ff    	jae    401a90 <print_broken_up_decimal.isra.0+0x120>
  401b7c:	89 c8                	mov    eax,ecx
  401b7e:	48 01 e8             	add    rax,rbp
  401b81:	84 d2                	test   dl,dl
  401b83:	0f 84 07 ff ff ff    	je     401a90 <print_broken_up_decimal.isra.0+0x120>
  401b89:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401b90:	83 c1 01             	add    ecx,0x1
  401b93:	c6 00 30             	mov    BYTE PTR [rax],0x30
  401b96:	48 83 c0 01          	add    rax,0x1
  401b9a:	44 39 c9             	cmp    ecx,r9d
  401b9d:	0f 83 ed fe ff ff    	jae    401a90 <print_broken_up_decimal.isra.0+0x120>
  401ba3:	83 f9 1f             	cmp    ecx,0x1f
  401ba6:	76 e8                	jbe    401b90 <print_broken_up_decimal.isra.0+0x220>
  401ba8:	e9 e3 fe ff ff       	jmp    401a90 <print_broken_up_decimal.isra.0+0x120>
  401bad:	0f 1f 00             	nop    DWORD PTR [rax]
  401bb0:	48 85 f6             	test   rsi,rsi
  401bb3:	0f 8e 79 fe ff ff    	jle    401a32 <print_broken_up_decimal.isra.0+0xc2>
  401bb9:	48 bb cd cc cc cc cc 	movabs rbx,0xcccccccccccccccd
  401bc0:	cc cc cc 
  401bc3:	48 89 f0             	mov    rax,rsi
  401bc6:	48 ba 98 99 99 99 99 	movabs rdx,0x1999999999999998
  401bcd:	99 99 19 
  401bd0:	48 0f af c3          	imul   rax,rbx
  401bd4:	48 01 d0             	add    rax,rdx
  401bd7:	48 d1 c8             	ror    rax,1
  401bda:	48 39 d0             	cmp    rax,rdx
  401bdd:	0f 87 c8 fd ff ff    	ja     4019ab <print_broken_up_decimal.isra.0+0x3b>
  401be3:	49 be 99 99 99 99 99 	movabs r14,0x1999999999999999
  401bea:	99 99 19 
  401bed:	0f 1f 00             	nop    DWORD PTR [rax]
  401bf0:	48 89 f0             	mov    rax,rsi
  401bf3:	49 89 f4             	mov    r12,rsi
  401bf6:	41 83 ed 01          	sub    r13d,0x1
  401bfa:	48 f7 e3             	mul    rbx
  401bfd:	48 89 d6             	mov    rsi,rdx
  401c00:	48 c1 ee 03          	shr    rsi,0x3
  401c04:	48 89 f0             	mov    rax,rsi
  401c07:	48 0f af c3          	imul   rax,rbx
  401c0b:	48 d1 c8             	ror    rax,1
  401c0e:	4c 39 f0             	cmp    rax,r14
  401c11:	76 dd                	jbe    401bf0 <print_broken_up_decimal.isra.0+0x280>
  401c13:	49 83 fc 09          	cmp    r12,0x9
  401c17:	0f 8f 8e fd ff ff    	jg     4019ab <print_broken_up_decimal.isra.0+0x3b>
  401c1d:	e9 10 fe ff ff       	jmp    401a32 <print_broken_up_decimal.isra.0+0xc2>
  401c22:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  401c28:	c6 44 0d 00 2b       	mov    BYTE PTR [rbp+rcx*1+0x0],0x2b
  401c2d:	8d 51 01             	lea    edx,[rcx+0x1]
  401c30:	e9 6d fe ff ff       	jmp    401aa2 <print_broken_up_decimal.isra.0+0x132>
  401c35:	0f 1f 00             	nop    DWORD PTR [rax]
  401c38:	41 83 e9 01          	sub    r9d,0x1
  401c3c:	e9 32 ff ff ff       	jmp    401b73 <print_broken_up_decimal.isra.0+0x203>
  401c41:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  401c48:	45 85 c9             	test   r9d,r9d
  401c4b:	0f 84 3f fe ff ff    	je     401a90 <print_broken_up_decimal.isra.0+0x120>
  401c51:	83 f9 1f             	cmp    ecx,0x1f
  401c54:	0f 96 c2             	setbe  dl
  401c57:	e9 04 ff ff ff       	jmp    401b60 <print_broken_up_decimal.isra.0+0x1f0>
  401c5c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000401c60 <print_exponential_number>:
  401c60:	41 57                	push   r15
  401c62:	41 89 f2             	mov    r10d,esi
  401c65:	41 89 cf             	mov    r15d,ecx
  401c68:	4d 89 c3             	mov    r11,r8
  401c6b:	41 56                	push   r14
  401c6d:	41 55                	push   r13
  401c6f:	41 54                	push   r12
  401c71:	49 89 fc             	mov    r12,rdi
  401c74:	55                   	push   rbp
  401c75:	89 d5                	mov    ebp,edx
  401c77:	66 48 0f 7e c2       	movq   rdx,xmm0
  401c7c:	53                   	push   rbx
  401c7d:	48 83 ec 38          	sub    rsp,0x38
  401c81:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  401c88:	00 00 
  401c8a:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
  401c8f:	31 c0                	xor    eax,eax
  401c91:	48 c1 ea 3f          	shr    rdx,0x3f
  401c95:	74 08                	je     401c9f <print_exponential_number+0x3f>
  401c97:	66 0f 57 05 71 46 00 	xorpd  xmm0,XMMWORD PTR [rip+0x4671]        # 406310 <powers_of_10+0x90>
  401c9e:	00 
  401c9f:	44 89 f9             	mov    ecx,r15d
  401ca2:	66 0f ef db          	pxor   xmm3,xmm3
  401ca6:	81 e1 00 10 00 00    	and    ecx,0x1000
  401cac:	66 0f 2e c3          	ucomisd xmm0,xmm3
  401cb0:	0f 8a aa 00 00 00    	jp     401d60 <print_exponential_number+0x100>
  401cb6:	0f 85 a4 00 00 00    	jne    401d60 <print_exponential_number+0x100>
  401cbc:	85 c9                	test   ecx,ecx
  401cbe:	0f 85 7c 02 00 00    	jne    401f40 <print_exponential_number+0x2e0>
  401cc4:	48 85 d2             	test   rdx,rdx
  401cc7:	0f 84 11 07 00 00    	je     4023de <print_exponential_number+0x77e>
  401ccd:	31 c0                	xor    eax,eax
  401ccf:	31 db                	xor    ebx,ebx
  401cd1:	66 0f 57 05 37 46 00 	xorpd  xmm0,XMMWORD PTR [rip+0x4637]        # 406310 <powers_of_10+0x90>
  401cd8:	00 
  401cd9:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  401cde:	44 89 d6             	mov    esi,r10d
  401ce1:	88 44 24 0c          	mov    BYTE PTR [rsp+0xc],al
  401ce5:	e8 b6 f6 ff ff       	call   4013a0 <get_components>
  401cea:	0f b6 44 24 0c       	movzx  eax,BYTE PTR [rsp+0xc]
  401cef:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  401cf4:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  401cf9:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  401cfe:	84 c0                	test   al,al
  401d00:	0f 84 1a 03 00 00    	je     402020 <print_exponential_number+0x3c0>
  401d06:	41 f7 c7 00 10 00 00 	test   r15d,0x1000
  401d0d:	74 09                	je     401d18 <print_exponential_number+0xb8>
  401d0f:	83 fb ff             	cmp    ebx,0xffffffff
  401d12:	0f 8d 58 05 00 00    	jge    402270 <print_exponential_number+0x610>
  401d18:	85 ed                	test   ebp,ebp
  401d1a:	0f 84 40 03 00 00    	je     402060 <print_exponential_number+0x400>
  401d20:	48 83 ec 08          	sub    rsp,0x8
  401d24:	45 89 d0             	mov    r8d,r10d
  401d27:	4c 89 e1             	mov    rcx,r12
  401d2a:	41 51                	push   r9
  401d2c:	41 89 e9             	mov    r9d,ebp
  401d2f:	41 53                	push   r11
  401d31:	41 57                	push   r15
  401d33:	e8 38 fc ff ff       	call   401970 <print_broken_up_decimal.isra.0>
  401d38:	48 83 c4 20          	add    rsp,0x20
  401d3c:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
  401d41:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
  401d48:	00 00 
  401d4a:	0f 85 89 06 00 00    	jne    4023d9 <print_exponential_number+0x779>
  401d50:	48 83 c4 38          	add    rsp,0x38
  401d54:	5b                   	pop    rbx
  401d55:	5d                   	pop    rbp
  401d56:	41 5c                	pop    r12
  401d58:	41 5d                	pop    r13
  401d5a:	41 5e                	pop    r14
  401d5c:	41 5f                	pop    r15
  401d5e:	c3                   	ret    
  401d5f:	90                   	nop
  401d60:	66 48 0f 7e c6       	movq   rsi,xmm0
  401d65:	f2 0f 10 2d e3 45 00 	movsd  xmm5,QWORD PTR [rip+0x45e3]        # 406350 <powers_of_10+0xd0>
  401d6c:	00 
  401d6d:	48 b8 ff ff ff ff ff 	movabs rax,0xfffffffffffff
  401d74:	ff 0f 00 
  401d77:	48 bf 00 00 00 00 00 	movabs rdi,0x3ff0000000000000
  401d7e:	00 f0 3f 
  401d81:	48 21 f0             	and    rax,rsi
  401d84:	f2 0f 10 15 b4 45 00 	movsd  xmm2,QWORD PTR [rip+0x45b4]        # 406340 <powers_of_10+0xc0>
  401d8b:	00 
  401d8c:	48 c1 ee 34          	shr    rsi,0x34
  401d90:	48 09 f8             	or     rax,rdi
  401d93:	81 e6 ff 07 00 00    	and    esi,0x7ff
  401d99:	66 48 0f 6e c8       	movq   xmm1,rax
  401d9e:	f2 0f 5c 0d 92 45 00 	subsd  xmm1,QWORD PTR [rip+0x4592]        # 406338 <powers_of_10+0xb8>
  401da5:	00 
  401da6:	81 ee ff 03 00 00    	sub    esi,0x3ff
  401dac:	f2 0f 59 d1          	mulsd  xmm2,xmm1
  401db0:	66 0f 28 e1          	movapd xmm4,xmm1
  401db4:	f2 0f 59 e1          	mulsd  xmm4,xmm1
  401db8:	f2 0f 58 15 88 45 00 	addsd  xmm2,QWORD PTR [rip+0x4588]        # 406348 <powers_of_10+0xc8>
  401dbf:	00 
  401dc0:	f2 0f 59 ec          	mulsd  xmm5,xmm4
  401dc4:	f2 0f 59 cc          	mulsd  xmm1,xmm4
  401dc8:	f2 0f 59 0d 88 45 00 	mulsd  xmm1,QWORD PTR [rip+0x4588]        # 406358 <powers_of_10+0xd8>
  401dcf:	00 
  401dd0:	f2 0f 5c d5          	subsd  xmm2,xmm5
  401dd4:	f2 0f 58 ca          	addsd  xmm1,xmm2
  401dd8:	66 0f ef d2          	pxor   xmm2,xmm2
  401ddc:	f2 0f 2a d6          	cvtsi2sd xmm2,esi
  401de0:	f2 0f 59 15 78 45 00 	mulsd  xmm2,QWORD PTR [rip+0x4578]        # 406360 <powers_of_10+0xe0>
  401de7:	00 
  401de8:	f2 0f 58 ca          	addsd  xmm1,xmm2
  401dec:	66 0f 2f cb          	comisd xmm1,xmm3
  401df0:	f2 0f 2c d9          	cvttsd2si ebx,xmm1
  401df4:	73 18                	jae    401e0e <print_exponential_number+0x1ae>
  401df6:	66 0f ef d2          	pxor   xmm2,xmm2
  401dfa:	f2 0f 2a d3          	cvtsi2sd xmm2,ebx
  401dfe:	66 0f 2e ca          	ucomisd xmm1,xmm2
  401e02:	0f 8a 98 04 00 00    	jp     4022a0 <print_exponential_number+0x640>
  401e08:	0f 85 92 04 00 00    	jne    4022a0 <print_exponential_number+0x640>
  401e0e:	81 fb cc fe ff ff    	cmp    ebx,0xfffffecc
  401e14:	0f 84 16 05 00 00    	je     402330 <print_exponential_number+0x6d0>
  401e1a:	66 0f ef d2          	pxor   xmm2,xmm2
  401e1e:	f2 0f 10 0d 42 45 00 	movsd  xmm1,QWORD PTR [rip+0x4542]        # 406368 <powers_of_10+0xe8>
  401e25:	00 
  401e26:	66 0f ef e4          	pxor   xmm4,xmm4
  401e2a:	f2 0f 2a d3          	cvtsi2sd xmm2,ebx
  401e2e:	f2 0f 59 ca          	mulsd  xmm1,xmm2
  401e32:	f2 0f 58 0d e6 44 00 	addsd  xmm1,QWORD PTR [rip+0x44e6]        # 406320 <powers_of_10+0xa0>
  401e39:	00 
  401e3a:	f2 0f 2c c1          	cvttsd2si eax,xmm1
  401e3e:	66 0f 2f cb          	comisd xmm1,xmm3
  401e42:	f2 0f 2a e0          	cvtsi2sd xmm4,eax
  401e46:	73 10                	jae    401e58 <print_exponential_number+0x1f8>
  401e48:	66 0f 2e cc          	ucomisd xmm1,xmm4
  401e4c:	0f 8a ce 04 00 00    	jp     402320 <print_exponential_number+0x6c0>
  401e52:	0f 85 c8 04 00 00    	jne    402320 <print_exponential_number+0x6c0>
  401e58:	f2 0f 59 25 18 45 00 	mulsd  xmm4,QWORD PTR [rip+0x4518]        # 406378 <powers_of_10+0xf8>
  401e5f:	00 
  401e60:	f2 0f 10 35 20 45 00 	movsd  xmm6,QWORD PTR [rip+0x4520]        # 406388 <powers_of_10+0x108>
  401e67:	00 
  401e68:	48 98                	cdqe   
  401e6a:	f2 0f 59 15 fe 44 00 	mulsd  xmm2,QWORD PTR [rip+0x44fe]        # 406370 <powers_of_10+0xf0>
  401e71:	00 
  401e72:	48 05 ff 03 00 00    	add    rax,0x3ff
  401e78:	48 c1 e0 34          	shl    rax,0x34
  401e7c:	66 48 0f 6e f8       	movq   xmm7,rax
  401e81:	f2 0f 5c d4          	subsd  xmm2,xmm4
  401e85:	66 0f 28 da          	movapd xmm3,xmm2
  401e89:	66 0f 28 ca          	movapd xmm1,xmm2
  401e8d:	f2 0f 59 da          	mulsd  xmm3,xmm2
  401e91:	f2 0f 58 ca          	addsd  xmm1,xmm2
  401e95:	66 0f 28 eb          	movapd xmm5,xmm3
  401e99:	f2 0f 5e 2d df 44 00 	divsd  xmm5,QWORD PTR [rip+0x44df]        # 406380 <powers_of_10+0x100>
  401ea0:	00 
  401ea1:	f2 0f 58 ee          	addsd  xmm5,xmm6
  401ea5:	66 0f 28 e3          	movapd xmm4,xmm3
  401ea9:	f2 0f 5e e5          	divsd  xmm4,xmm5
  401ead:	f2 0f 58 25 db 44 00 	addsd  xmm4,QWORD PTR [rip+0x44db]        # 406390 <powers_of_10+0x110>
  401eb4:	00 
  401eb5:	f2 0f 5e dc          	divsd  xmm3,xmm4
  401eb9:	f2 0f 10 25 d7 44 00 	movsd  xmm4,QWORD PTR [rip+0x44d7]        # 406398 <powers_of_10+0x118>
  401ec0:	00 
  401ec1:	f2 0f 5c e2          	subsd  xmm4,xmm2
  401ec5:	f2 0f 58 dc          	addsd  xmm3,xmm4
  401ec9:	f2 0f 5e cb          	divsd  xmm1,xmm3
  401ecd:	f2 0f 58 0d cb 44 00 	addsd  xmm1,QWORD PTR [rip+0x44cb]        # 4063a0 <powers_of_10+0x120>
  401ed4:	00 
  401ed5:	f2 0f 59 cf          	mulsd  xmm1,xmm7
  401ed9:	66 0f 2f c8          	comisd xmm1,xmm0
  401edd:	0f 87 7d 03 00 00    	ja     402260 <print_exponential_number+0x600>
  401ee3:	8d 43 11             	lea    eax,[rbx+0x11]
  401ee6:	31 f6                	xor    esi,esi
  401ee8:	83 f8 22             	cmp    eax,0x22
  401eeb:	77 1a                	ja     401f07 <print_exponential_number+0x2a7>
  401eed:	89 d8                	mov    eax,ebx
  401eef:	48 8d 35 8a 43 00 00 	lea    rsi,[rip+0x438a]        # 406280 <powers_of_10>
  401ef6:	f7 d8                	neg    eax
  401ef8:	0f 48 c3             	cmovs  eax,ebx
  401efb:	48 98                	cdqe   
  401efd:	f2 0f 10 0c c6       	movsd  xmm1,QWORD PTR [rsi+rax*8]
  401f02:	be 01 00 00 00       	mov    esi,0x1
  401f07:	89 d8                	mov    eax,ebx
  401f09:	c1 e8 1f             	shr    eax,0x1f
  401f0c:	21 c6                	and    esi,eax
  401f0e:	85 db                	test   ebx,ebx
  401f10:	40 0f 94 c7          	sete   dil
  401f14:	31 c0                	xor    eax,eax
  401f16:	85 c9                	test   ecx,ecx
  401f18:	74 5f                	je     401f79 <print_exponential_number+0x319>
  401f1a:	45 85 d2             	test   r10d,r10d
  401f1d:	b8 01 00 00 00       	mov    eax,0x1
  401f22:	41 0f 45 c2          	cmovne eax,r10d
  401f26:	39 c3                	cmp    ebx,eax
  401f28:	0f 9c c0             	setl   al
  401f2b:	83 fb fc             	cmp    ebx,0xfffffffc
  401f2e:	0f 9d c1             	setge  cl
  401f31:	21 c8                	and    eax,ecx
  401f33:	09 c7                	or     edi,eax
  401f35:	eb 23                	jmp    401f5a <print_exponential_number+0x2fa>
  401f37:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  401f3e:	00 00 
  401f40:	45 85 d2             	test   r10d,r10d
  401f43:	b8 01 00 00 00       	mov    eax,0x1
  401f48:	bf 01 00 00 00       	mov    edi,0x1
  401f4d:	41 0f 45 c2          	cmovne eax,r10d
  401f51:	85 c0                	test   eax,eax
  401f53:	0f 9f c0             	setg   al
  401f56:	31 f6                	xor    esi,esi
  401f58:	31 db                	xor    ebx,ebx
  401f5a:	41 83 ea 01          	sub    r10d,0x1
  401f5e:	44 89 d1             	mov    ecx,r10d
  401f61:	29 d9                	sub    ecx,ebx
  401f63:	84 c0                	test   al,al
  401f65:	44 0f 45 d1          	cmovne r10d,ecx
  401f69:	31 c9                	xor    ecx,ecx
  401f6b:	45 85 d2             	test   r10d,r10d
  401f6e:	44 0f 48 d1          	cmovs  r10d,ecx
  401f72:	41 81 cf 00 08 00 00 	or     r15d,0x800
  401f79:	40 84 ff             	test   dil,dil
  401f7c:	0f 85 c6 02 00 00    	jne    402248 <print_exponential_number+0x5e8>
  401f82:	44 89 d1             	mov    ecx,r10d
  401f85:	29 d9                	sub    ecx,ebx
  401f87:	40 84 f6             	test   sil,sil
  401f8a:	0f 84 28 02 00 00    	je     4021b8 <print_exponential_number+0x558>
  401f90:	66 0f 28 d0          	movapd xmm2,xmm0
  401f94:	f2 0f 59 d1          	mulsd  xmm2,xmm1
  401f98:	81 f9 32 01 00 00    	cmp    ecx,0x132
  401f9e:	0f 8f ac 03 00 00    	jg     402350 <print_exponential_number+0x6f0>
  401fa4:	f2 48 0f 2c fa       	cvttsd2si rdi,xmm2
  401fa9:	66 0f ef d2          	pxor   xmm2,xmm2
  401fad:	66 0f 28 d9          	movapd xmm3,xmm1
  401fb1:	44 89 d1             	mov    ecx,r10d
  401fb4:	48 8d 35 c5 42 00 00 	lea    rsi,[rip+0x42c5]        # 406280 <powers_of_10>
  401fbb:	f2 48 0f 2a d7       	cvtsi2sd xmm2,rdi
  401fc0:	f2 0f 5e d1          	divsd  xmm2,xmm1
  401fc4:	f2 0f 5c c2          	subsd  xmm0,xmm2
  401fc8:	f2 0f 10 14 ce       	movsd  xmm2,QWORD PTR [rsi+rcx*8]
  401fcd:	f2 0f 59 da          	mulsd  xmm3,xmm2
  401fd1:	f2 0f 59 c3          	mulsd  xmm0,xmm3
  401fd5:	f2 48 0f 2c c8       	cvttsd2si rcx,xmm0
  401fda:	66 0f ef c9          	pxor   xmm1,xmm1
  401fde:	31 f6                	xor    esi,esi
  401fe0:	f2 48 0f 2a c9       	cvtsi2sd xmm1,rcx
  401fe5:	f2 0f 5c c1          	subsd  xmm0,xmm1
  401fe9:	66 0f 2f 05 2f 43 00 	comisd xmm0,QWORD PTR [rip+0x432f]        # 406320 <powers_of_10+0xa0>
  401ff0:	00 
  401ff1:	40 0f 93 c6          	setae  sil
  401ff5:	48 01 ce             	add    rsi,rcx
  401ff8:	66 0f 2e 05 20 43 00 	ucomisd xmm0,QWORD PTR [rip+0x4320]        # 406320 <powers_of_10+0xa0>
  401fff:	00 
  402000:	7a 06                	jp     402008 <print_exponential_number+0x3a8>
  402002:	75 04                	jne    402008 <print_exponential_number+0x3a8>
  402004:	48 83 e6 fe          	and    rsi,0xfffffffffffffffe
  402008:	66 0f ef c0          	pxor   xmm0,xmm0
  40200c:	f2 48 0f 2a c6       	cvtsi2sd xmm0,rsi
  402011:	66 0f 2f c2          	comisd xmm0,xmm2
  402015:	72 06                	jb     40201d <print_exponential_number+0x3bd>
  402017:	48 83 c7 01          	add    rdi,0x1
  40201b:	31 f6                	xor    esi,esi
  40201d:	83 e2 01             	and    edx,0x1
  402020:	48 83 ff 09          	cmp    rdi,0x9
  402024:	7e 0a                	jle    402030 <print_exponential_number+0x3d0>
  402026:	83 c3 01             	add    ebx,0x1
  402029:	31 f6                	xor    esi,esi
  40202b:	bf 01 00 00 00       	mov    edi,0x1
  402030:	45 89 fe             	mov    r14d,r15d
  402033:	8d 4b 63             	lea    ecx,[rbx+0x63]
  402036:	41 83 e6 02          	and    r14d,0x2
  40203a:	81 f9 c6 00 00 00    	cmp    ecx,0xc6
  402040:	77 46                	ja     402088 <print_exponential_number+0x428>
  402042:	45 85 f6             	test   r14d,r14d
  402045:	0f 85 c5 02 00 00    	jne    402310 <print_exponential_number+0x6b0>
  40204b:	41 be 04 00 00 00    	mov    r14d,0x4
  402051:	e9 68 02 00 00       	jmp    4022be <print_exponential_number+0x65e>
  402056:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  40205d:	00 00 00 
  402060:	48 83 ec 08          	sub    rsp,0x8
  402064:	45 89 d0             	mov    r8d,r10d
  402067:	4c 89 e1             	mov    rcx,r12
  40206a:	41 51                	push   r9
  40206c:	45 31 c9             	xor    r9d,r9d
  40206f:	41 53                	push   r11
  402071:	41 57                	push   r15
  402073:	e8 f8 f8 ff ff       	call   401970 <print_broken_up_decimal.isra.0>
  402078:	48 83 c4 20          	add    rsp,0x20
  40207c:	e9 bb fc ff ff       	jmp    401d3c <print_exponential_number+0xdc>
  402081:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  402088:	45 85 f6             	test   r14d,r14d
  40208b:	0f 84 27 02 00 00    	je     4022b8 <print_exponential_number+0x658>
  402091:	b8 04 00 00 00       	mov    eax,0x4
  402096:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  40209a:	48 83 ec 08          	sub    rsp,0x8
  40209e:	45 89 d0             	mov    r8d,r10d
  4020a1:	4c 89 e1             	mov    rcx,r12
  4020a4:	41 51                	push   r9
  4020a6:	45 31 c9             	xor    r9d,r9d
  4020a9:	45 8b 6c 24 18       	mov    r13d,DWORD PTR [r12+0x18]
  4020ae:	41 53                	push   r11
  4020b0:	41 57                	push   r15
  4020b2:	e8 b9 f8 ff ff       	call   401970 <print_broken_up_decimal.isra.0>
  4020b7:	8b 44 24 2c          	mov    eax,DWORD PTR [rsp+0x2c]
  4020bb:	48 83 c4 20          	add    rsp,0x20
  4020bf:	41 83 e7 20          	and    r15d,0x20
  4020c3:	41 8b 4c 24 18       	mov    ecx,DWORD PTR [r12+0x18]
  4020c8:	41 83 ff 01          	cmp    r15d,0x1
  4020cc:	19 d2                	sbb    edx,edx
  4020ce:	8d 71 01             	lea    esi,[rcx+0x1]
  4020d1:	83 e2 20             	and    edx,0x20
  4020d4:	41 89 74 24 18       	mov    DWORD PTR [r12+0x18],esi
  4020d9:	83 c2 45             	add    edx,0x45
  4020dc:	41 83 ff 01          	cmp    r15d,0x1
  4020e0:	19 ff                	sbb    edi,edi
  4020e2:	83 e7 20             	and    edi,0x20
  4020e5:	83 c7 45             	add    edi,0x45
  4020e8:	41 3b 4c 24 1c       	cmp    ecx,DWORD PTR [r12+0x1c]
  4020ed:	73 1d                	jae    40210c <print_exponential_number+0x4ac>
  4020ef:	4d 8b 04 24          	mov    r8,QWORD PTR [r12]
  4020f3:	4d 85 c0             	test   r8,r8
  4020f6:	0f 84 c4 02 00 00    	je     4023c0 <print_exponential_number+0x760>
  4020fc:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
  402100:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  402105:	41 ff d0             	call   r8
  402108:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
  40210c:	48 63 d3             	movsxd rdx,ebx
  40210f:	41 89 da             	mov    r10d,ebx
  402112:	41 89 c1             	mov    r9d,eax
  402115:	b9 0a 00 00 00       	mov    ecx,0xa
  40211a:	48 89 d6             	mov    rsi,rdx
  40211d:	41 c1 ea 1f          	shr    r10d,0x1f
  402121:	4c 89 e7             	mov    rdi,r12
  402124:	48 f7 de             	neg    rsi
  402127:	85 db                	test   ebx,ebx
  402129:	48 0f 4f f2          	cmovg  rsi,rdx
  40212d:	48 83 ec 08          	sub    rsp,0x8
  402131:	44 89 d2             	mov    edx,r10d
  402134:	45 31 c0             	xor    r8d,r8d
  402137:	6a 05                	push   0x5
  402139:	e8 a2 f4 ff ff       	call   4015e0 <print_integer>
  40213e:	58                   	pop    rax
  40213f:	5a                   	pop    rdx
  402140:	45 85 f6             	test   r14d,r14d
  402143:	0f 84 f3 fb ff ff    	je     401d3c <print_exponential_number+0xdc>
  402149:	41 8b 44 24 18       	mov    eax,DWORD PTR [r12+0x18]
  40214e:	89 c2                	mov    edx,eax
  402150:	44 29 ea             	sub    edx,r13d
  402153:	39 d5                	cmp    ebp,edx
  402155:	0f 86 e1 fb ff ff    	jbe    401d3c <print_exponential_number+0xdc>
  40215b:	8d 48 01             	lea    ecx,[rax+0x1]
  40215e:	83 c2 01             	add    edx,0x1
  402161:	41 89 4c 24 18       	mov    DWORD PTR [r12+0x18],ecx
  402166:	41 39 44 24 1c       	cmp    DWORD PTR [r12+0x1c],eax
  40216b:	0f 86 1f 02 00 00    	jbe    402390 <print_exponential_number+0x730>
  402171:	49 8b 14 24          	mov    rdx,QWORD PTR [r12]
  402175:	48 85 d2             	test   rdx,rdx
  402178:	0f 84 22 02 00 00    	je     4023a0 <print_exponential_number+0x740>
  40217e:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  402183:	bf 20 00 00 00       	mov    edi,0x20
  402188:	ff d2                	call   rdx
  40218a:	41 8b 44 24 18       	mov    eax,DWORD PTR [r12+0x18]
  40218f:	89 c2                	mov    edx,eax
  402191:	44 29 ea             	sub    edx,r13d
  402194:	eb bd                	jmp    402153 <print_exponential_number+0x4f3>
  402196:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  40219d:	00 00 00 
  4021a0:	85 c9                	test   ecx,ecx
  4021a2:	0f 85 28 02 00 00    	jne    4023d0 <print_exponential_number+0x770>
  4021a8:	41 8d 8a 34 01 00 00 	lea    ecx,[r10+0x134]
  4021af:	31 c0                	xor    eax,eax
  4021b1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4021b8:	66 0f 28 d0          	movapd xmm2,xmm0
  4021bc:	f2 0f 5e d1          	divsd  xmm2,xmm1
  4021c0:	81 f9 32 01 00 00    	cmp    ecx,0x132
  4021c6:	0f 8f 84 01 00 00    	jg     402350 <print_exponential_number+0x6f0>
  4021cc:	f2 48 0f 2c fa       	cvttsd2si rdi,xmm2
  4021d1:	66 0f ef d2          	pxor   xmm2,xmm2
  4021d5:	44 89 d1             	mov    ecx,r10d
  4021d8:	48 8d 35 a1 40 00 00 	lea    rsi,[rip+0x40a1]        # 406280 <powers_of_10>
  4021df:	f2 48 0f 2a d7       	cvtsi2sd xmm2,rdi
  4021e4:	f2 0f 59 d1          	mulsd  xmm2,xmm1
  4021e8:	f2 0f 5c c2          	subsd  xmm0,xmm2
  4021ec:	f2 0f 10 14 ce       	movsd  xmm2,QWORD PTR [rsi+rcx*8]
  4021f1:	66 48 0f 7e c9       	movq   rcx,xmm1
  4021f6:	48 c1 e9 34          	shr    rcx,0x34
  4021fa:	81 e1 ff 07 00 00    	and    ecx,0x7ff
  402200:	81 e9 ff 03 00 00    	sub    ecx,0x3ff
  402206:	89 ce                	mov    esi,ecx
  402208:	f7 de                	neg    esi
  40220a:	0f 48 f1             	cmovs  esi,ecx
  40220d:	66 48 0f 7e d1       	movq   rcx,xmm2
  402212:	48 c1 e9 34          	shr    rcx,0x34
  402216:	81 e1 ff 07 00 00    	and    ecx,0x7ff
  40221c:	81 e9 ff 03 00 00    	sub    ecx,0x3ff
  402222:	41 89 c8             	mov    r8d,ecx
  402225:	41 f7 d8             	neg    r8d
  402228:	41 0f 49 c8          	cmovns ecx,r8d
  40222c:	39 ce                	cmp    esi,ecx
  40222e:	0f 8f 7c 01 00 00    	jg     4023b0 <print_exponential_number+0x750>
  402234:	66 0f 28 da          	movapd xmm3,xmm2
  402238:	f2 0f 5e d9          	divsd  xmm3,xmm1
  40223c:	e9 90 fd ff ff       	jmp    401fd1 <print_exponential_number+0x371>
  402241:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  402248:	48 85 d2             	test   rdx,rdx
  40224b:	0f 84 88 fa ff ff    	je     401cd9 <print_exponential_number+0x79>
  402251:	e9 7b fa ff ff       	jmp    401cd1 <print_exponential_number+0x71>
  402256:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  40225d:	00 00 00 
  402260:	f2 0f 5e ce          	divsd  xmm1,xmm6
  402264:	83 eb 01             	sub    ebx,0x1
  402267:	e9 77 fc ff ff       	jmp    401ee3 <print_exponential_number+0x283>
  40226c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402270:	83 c3 01             	add    ebx,0x1
  402273:	66 0f ef c0          	pxor   xmm0,xmm0
  402277:	48 8d 05 02 40 00 00 	lea    rax,[rip+0x4002]        # 406280 <powers_of_10>
  40227e:	48 63 db             	movsxd rbx,ebx
  402281:	f2 48 0f 2a c7       	cvtsi2sd xmm0,rdi
  402286:	66 0f 2e 04 d8       	ucomisd xmm0,QWORD PTR [rax+rbx*8]
  40228b:	0f 8a 87 fa ff ff    	jp     401d18 <print_exponential_number+0xb8>
  402291:	0f 85 81 fa ff ff    	jne    401d18 <print_exponential_number+0xb8>
  402297:	41 83 ea 01          	sub    r10d,0x1
  40229b:	e9 78 fa ff ff       	jmp    401d18 <print_exponential_number+0xb8>
  4022a0:	83 eb 01             	sub    ebx,0x1
  4022a3:	81 fb cc fe ff ff    	cmp    ebx,0xfffffecc
  4022a9:	0f 85 6b fb ff ff    	jne    401e1a <print_exponential_number+0x1ba>
  4022af:	eb 7f                	jmp    402330 <print_exponential_number+0x6d0>
  4022b1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4022b8:	41 be 05 00 00 00    	mov    r14d,0x5
  4022be:	89 e9                	mov    ecx,ebp
  4022c0:	45 31 c0             	xor    r8d,r8d
  4022c3:	88 44 24 0c          	mov    BYTE PTR [rsp+0xc],al
  4022c7:	45 8b 6c 24 18       	mov    r13d,DWORD PTR [r12+0x18]
  4022cc:	44 29 f1             	sub    ecx,r14d
  4022cf:	44 39 f5             	cmp    ebp,r14d
  4022d2:	41 0f 46 c8          	cmovbe ecx,r8d
  4022d6:	48 83 ec 08          	sub    rsp,0x8
  4022da:	45 89 d0             	mov    r8d,r10d
  4022dd:	41 51                	push   r9
  4022df:	41 53                	push   r11
  4022e1:	41 89 c9             	mov    r9d,ecx
  4022e4:	4c 89 e1             	mov    rcx,r12
  4022e7:	41 57                	push   r15
  4022e9:	e8 82 f6 ff ff       	call   401970 <print_broken_up_decimal.isra.0>
  4022ee:	0f b6 44 24 2c       	movzx  eax,BYTE PTR [rsp+0x2c]
  4022f3:	48 83 c4 20          	add    rsp,0x20
  4022f7:	84 c0                	test   al,al
  4022f9:	0f 85 3d fa ff ff    	jne    401d3c <print_exponential_number+0xdc>
  4022ff:	41 8d 46 ff          	lea    eax,[r14-0x1]
  402303:	45 31 f6             	xor    r14d,r14d
  402306:	e9 b4 fd ff ff       	jmp    4020bf <print_exponential_number+0x45f>
  40230b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  402310:	b8 03 00 00 00       	mov    eax,0x3
  402315:	e9 7c fd ff ff       	jmp    402096 <print_exponential_number+0x436>
  40231a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  402320:	83 e8 01             	sub    eax,0x1
  402323:	66 0f ef e4          	pxor   xmm4,xmm4
  402327:	f2 0f 2a e0          	cvtsi2sd xmm4,eax
  40232b:	e9 28 fb ff ff       	jmp    401e58 <print_exponential_number+0x1f8>
  402330:	f2 0f 10 0d f8 3f 00 	movsd  xmm1,QWORD PTR [rip+0x3ff8]        # 406330 <powers_of_10+0xb0>
  402337:	00 
  402338:	66 0f 2f c8          	comisd xmm1,xmm0
  40233c:	0f 86 5e fe ff ff    	jbe    4021a0 <print_exponential_number+0x540>
  402342:	f2 0f 10 0d de 3f 00 	movsd  xmm1,QWORD PTR [rip+0x3fde]        # 406328 <powers_of_10+0xa8>
  402349:	00 
  40234a:	e9 15 ff ff ff       	jmp    402264 <print_exponential_number+0x604>
  40234f:	90                   	nop
  402350:	48 85 d2             	test   rdx,rdx
  402353:	74 08                	je     40235d <print_exponential_number+0x6fd>
  402355:	66 0f 57 15 b3 3f 00 	xorpd  xmm2,XMMWORD PTR [rip+0x3fb3]        # 406310 <powers_of_10+0x90>
  40235c:	00 
  40235d:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  402362:	44 89 d6             	mov    esi,r10d
  402365:	66 0f 28 c2          	movapd xmm0,xmm2
  402369:	88 44 24 0c          	mov    BYTE PTR [rsp+0xc],al
  40236d:	e8 2e f0 ff ff       	call   4013a0 <get_components>
  402372:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  402377:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  40237c:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  402381:	0f b6 44 24 0c       	movzx  eax,BYTE PTR [rsp+0xc]
  402386:	e9 95 fc ff ff       	jmp    402020 <print_exponential_number+0x3c0>
  40238b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  402390:	89 c8                	mov    eax,ecx
  402392:	e9 bc fd ff ff       	jmp    402153 <print_exponential_number+0x4f3>
  402397:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  40239e:	00 00 
  4023a0:	49 8b 54 24 10       	mov    rdx,QWORD PTR [r12+0x10]
  4023a5:	c6 04 02 20          	mov    BYTE PTR [rdx+rax*1],0x20
  4023a9:	e9 9b fd ff ff       	jmp    402149 <print_exponential_number+0x4e9>
  4023ae:	66 90                	xchg   ax,ax
  4023b0:	f2 0f 5e ca          	divsd  xmm1,xmm2
  4023b4:	f2 0f 5e c1          	divsd  xmm0,xmm1
  4023b8:	e9 18 fc ff ff       	jmp    401fd5 <print_exponential_number+0x375>
  4023bd:	0f 1f 00             	nop    DWORD PTR [rax]
  4023c0:	49 8b 74 24 10       	mov    rsi,QWORD PTR [r12+0x10]
  4023c5:	88 14 0e             	mov    BYTE PTR [rsi+rcx*1],dl
  4023c8:	e9 3f fd ff ff       	jmp    40210c <print_exponential_number+0x4ac>
  4023cd:	0f 1f 00             	nop    DWORD PTR [rax]
  4023d0:	31 ff                	xor    edi,edi
  4023d2:	31 f6                	xor    esi,esi
  4023d4:	e9 41 fb ff ff       	jmp    401f1a <print_exponential_number+0x2ba>
  4023d9:	e8 2d ec ff ff       	call   40100b <__stack_chk_fail>
  4023de:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  4023e3:	44 89 d6             	mov    esi,r10d
  4023e6:	31 db                	xor    ebx,ebx
  4023e8:	e8 b3 ef ff ff       	call   4013a0 <get_components>
  4023ed:	48 8b 7c 24 10       	mov    rdi,QWORD PTR [rsp+0x10]
  4023f2:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
  4023f7:	31 c0                	xor    eax,eax
  4023f9:	0f b6 54 24 20       	movzx  edx,BYTE PTR [rsp+0x20]
  4023fe:	e9 1d fc ff ff       	jmp    402020 <print_exponential_number+0x3c0>
  402403:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  40240a:	00 00 00 
  40240d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000402410 <print_floating_point>:
  402410:	41 54                	push   r12
  402412:	41 89 d4             	mov    r12d,edx
  402415:	55                   	push   rbp
  402416:	48 89 fd             	mov    rbp,rdi
  402419:	48 83 ec 68          	sub    rsp,0x68
  40241d:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  402424:	00 00 
  402426:	48 89 44 24 58       	mov    QWORD PTR [rsp+0x58],rax
  40242b:	31 c0                	xor    eax,eax
  40242d:	66 0f 2e c0          	ucomisd xmm0,xmm0
  402431:	0f 8a 61 01 00 00    	jp     402598 <print_floating_point+0x188>
  402437:	f2 0f 10 0d 69 3f 00 	movsd  xmm1,QWORD PTR [rip+0x3f69]        # 4063a8 <powers_of_10+0x128>
  40243e:	00 
  40243f:	66 0f 2f c8          	comisd xmm1,xmm0
  402443:	0f 87 c7 01 00 00    	ja     402610 <print_floating_point+0x200>
  402449:	66 0f 2f 05 5f 3f 00 	comisd xmm0,QWORD PTR [rip+0x3f5f]        # 4063b0 <powers_of_10+0x130>
  402450:	00 
  402451:	0f 87 a9 00 00 00    	ja     402500 <print_floating_point+0xf0>
  402457:	45 84 c0             	test   r8b,r8b
  40245a:	0f 85 f0 00 00 00    	jne    402550 <print_floating_point+0x140>
  402460:	66 0f 2f 05 50 3f 00 	comisd xmm0,QWORD PTR [rip+0x3f50]        # 4063b8 <powers_of_10+0x138>
  402467:	00 
  402468:	0f 87 82 01 00 00    	ja     4025f0 <print_floating_point+0x1e0>
  40246e:	f2 0f 10 0d 4a 3f 00 	movsd  xmm1,QWORD PTR [rip+0x3f4a]        # 4063c0 <powers_of_10+0x140>
  402475:	00 
  402476:	66 0f 2f c8          	comisd xmm1,xmm0
  40247a:	0f 87 70 01 00 00    	ja     4025f0 <print_floating_point+0x1e0>
  402480:	41 89 c9             	mov    r9d,ecx
  402483:	41 81 e1 00 08 00 00 	and    r9d,0x800
  40248a:	0f 85 b0 01 00 00    	jne    402640 <print_floating_point+0x230>
  402490:	be 06 00 00 00       	mov    esi,0x6
  402495:	48 8d 7c 24 10       	lea    rdi,[rsp+0x10]
  40249a:	89 4c 24 0c          	mov    DWORD PTR [rsp+0xc],ecx
  40249e:	89 74 24 08          	mov    DWORD PTR [rsp+0x8],esi
  4024a2:	e8 f9 ee ff ff       	call   4013a0 <get_components>
  4024a7:	48 83 ec 08          	sub    rsp,0x8
  4024ab:	41 51                	push   r9
  4024ad:	45 89 e1             	mov    r9d,r12d
  4024b0:	48 8d 44 24 40       	lea    rax,[rsp+0x40]
  4024b5:	50                   	push   rax
  4024b6:	8b 4c 24 24          	mov    ecx,DWORD PTR [rsp+0x24]
  4024ba:	51                   	push   rcx
  4024bb:	44 8b 44 24 28       	mov    r8d,DWORD PTR [rsp+0x28]
  4024c0:	48 89 e9             	mov    rcx,rbp
  4024c3:	0f b6 54 24 40       	movzx  edx,BYTE PTR [rsp+0x40]
  4024c8:	48 8b 74 24 38       	mov    rsi,QWORD PTR [rsp+0x38]
  4024cd:	48 8b 7c 24 30       	mov    rdi,QWORD PTR [rsp+0x30]
  4024d2:	e8 99 f4 ff ff       	call   401970 <print_broken_up_decimal.isra.0>
  4024d7:	48 83 c4 20          	add    rsp,0x20
  4024db:	48 8b 44 24 58       	mov    rax,QWORD PTR [rsp+0x58]
  4024e0:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
  4024e7:	00 00 
  4024e9:	0f 85 67 01 00 00    	jne    402656 <print_floating_point+0x246>
  4024ef:	48 83 c4 68          	add    rsp,0x68
  4024f3:	5d                   	pop    rbp
  4024f4:	41 5c                	pop    r12
  4024f6:	c3                   	ret    
  4024f7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4024fe:	00 00 
  402500:	89 c8                	mov    eax,ecx
  402502:	48 8d 35 78 3b 00 00 	lea    rsi,[rip+0x3b78]        # 406081 <kb_readc+0x10b9>
  402509:	83 e0 04             	and    eax,0x4
  40250c:	83 f8 01             	cmp    eax,0x1
  40250f:	19 d2                	sbb    edx,edx
  402511:	83 c2 04             	add    edx,0x4
  402514:	85 c0                	test   eax,eax
  402516:	48 8d 05 5f 3b 00 00 	lea    rax,[rip+0x3b5f]        # 40607c <kb_readc+0x10b4>
  40251d:	48 0f 45 f0          	cmovne rsi,rax
  402521:	48 8b 44 24 58       	mov    rax,QWORD PTR [rsp+0x58]
  402526:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
  40252d:	00 00 
  40252f:	0f 85 21 01 00 00    	jne    402656 <print_floating_point+0x246>
  402535:	48 83 c4 68          	add    rsp,0x68
  402539:	41 89 c8             	mov    r8d,ecx
  40253c:	48 89 ef             	mov    rdi,rbp
  40253f:	44 89 e1             	mov    ecx,r12d
  402542:	5d                   	pop    rbp
  402543:	41 5c                	pop    r12
  402545:	e9 56 ef ff ff       	jmp    4014a0 <out_rev_>
  40254a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  402550:	41 89 c9             	mov    r9d,ecx
  402553:	41 81 e1 00 08 00 00 	and    r9d,0x800
  40255a:	74 74                	je     4025d0 <print_floating_point+0x1c0>
  40255c:	b8 01 00 00 00       	mov    eax,0x1
  402561:	45 31 c9             	xor    r9d,r9d
  402564:	83 fe 11             	cmp    esi,0x11
  402567:	76 6c                	jbe    4025d5 <print_floating_point+0x1c5>
  402569:	48 8d 54 24 2f       	lea    rdx,[rsp+0x2f]
  40256e:	66 90                	xchg   ax,ax
  402570:	41 89 c1             	mov    r9d,eax
  402573:	c6 04 02 30          	mov    BYTE PTR [rdx+rax*1],0x30
  402577:	83 ee 01             	sub    esi,0x1
  40257a:	48 83 c0 01          	add    rax,0x1
  40257e:	41 83 f9 1f          	cmp    r9d,0x1f
  402582:	77 05                	ja     402589 <print_floating_point+0x179>
  402584:	83 fe 11             	cmp    esi,0x11
  402587:	77 e7                	ja     402570 <print_floating_point+0x160>
  402589:	45 84 c0             	test   r8b,r8b
  40258c:	0f 84 03 ff ff ff    	je     402495 <print_floating_point+0x85>
  402592:	eb 41                	jmp    4025d5 <print_floating_point+0x1c5>
  402594:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402598:	48 8b 44 24 58       	mov    rax,QWORD PTR [rsp+0x58]
  40259d:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
  4025a4:	00 00 
  4025a6:	0f 85 aa 00 00 00    	jne    402656 <print_floating_point+0x246>
  4025ac:	48 83 c4 68          	add    rsp,0x68
  4025b0:	41 89 c8             	mov    r8d,ecx
  4025b3:	89 d1                	mov    ecx,edx
  4025b5:	48 89 ef             	mov    rdi,rbp
  4025b8:	ba 03 00 00 00       	mov    edx,0x3
  4025bd:	5d                   	pop    rbp
  4025be:	48 8d 35 c0 3a 00 00 	lea    rsi,[rip+0x3ac0]        # 406085 <kb_readc+0x10bd>
  4025c5:	41 5c                	pop    r12
  4025c7:	e9 d4 ee ff ff       	jmp    4014a0 <out_rev_>
  4025cc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  4025d0:	be 06 00 00 00       	mov    esi,0x6
  4025d5:	4c 8d 44 24 30       	lea    r8,[rsp+0x30]
  4025da:	44 89 e2             	mov    edx,r12d
  4025dd:	48 89 ef             	mov    rdi,rbp
  4025e0:	e8 7b f6 ff ff       	call   401c60 <print_exponential_number>
  4025e5:	e9 f1 fe ff ff       	jmp    4024db <print_floating_point+0xcb>
  4025ea:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4025f0:	45 31 c9             	xor    r9d,r9d
  4025f3:	4c 8d 44 24 30       	lea    r8,[rsp+0x30]
  4025f8:	44 89 e2             	mov    edx,r12d
  4025fb:	48 89 ef             	mov    rdi,rbp
  4025fe:	e8 5d f6 ff ff       	call   401c60 <print_exponential_number>
  402603:	e9 d3 fe ff ff       	jmp    4024db <print_floating_point+0xcb>
  402608:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40260f:	00 
  402610:	48 8b 44 24 58       	mov    rax,QWORD PTR [rsp+0x58]
  402615:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
  40261c:	00 00 
  40261e:	75 36                	jne    402656 <print_floating_point+0x246>
  402620:	48 83 c4 68          	add    rsp,0x68
  402624:	41 89 c8             	mov    r8d,ecx
  402627:	89 d1                	mov    ecx,edx
  402629:	48 89 ef             	mov    rdi,rbp
  40262c:	ba 04 00 00 00       	mov    edx,0x4
  402631:	5d                   	pop    rbp
  402632:	48 8d 35 50 3a 00 00 	lea    rsi,[rip+0x3a50]        # 406089 <kb_readc+0x10c1>
  402639:	41 5c                	pop    r12
  40263b:	e9 60 ee ff ff       	jmp    4014a0 <out_rev_>
  402640:	b8 01 00 00 00       	mov    eax,0x1
  402645:	45 31 c9             	xor    r9d,r9d
  402648:	83 fe 11             	cmp    esi,0x11
  40264b:	0f 87 18 ff ff ff    	ja     402569 <print_floating_point+0x159>
  402651:	e9 3f fe ff ff       	jmp    402495 <print_floating_point+0x85>
  402656:	e8 b0 e9 ff ff       	call   40100b <__stack_chk_fail>
  40265b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000402660 <format_string_loop.constprop.0>:
  402660:	41 57                	push   r15
  402662:	49 89 d7             	mov    r15,rdx
  402665:	41 56                	push   r14
  402667:	41 55                	push   r13
  402669:	41 54                	push   r12
  40266b:	55                   	push   rbp
  40266c:	53                   	push   rbx
  40266d:	48 83 ec 38          	sub    rsp,0x38
  402671:	0f b6 16             	movzx  edx,BYTE PTR [rsi]
  402674:	84 d2                	test   dl,dl
  402676:	0f 84 5f 01 00 00    	je     4027db <format_string_loop.constprop.0+0x17b>
  40267c:	49 89 fc             	mov    r12,rdi
  40267f:	48 89 f3             	mov    rbx,rsi
  402682:	4c 8d 2d 13 3a 00 00 	lea    r13,[rip+0x3a13]        # 40609c <kb_readc+0x10d4>
  402689:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  402690:	4c 8d 73 01          	lea    r14,[rbx+0x1]
  402694:	80 fa 25             	cmp    dl,0x25
  402697:	0f 85 d3 05 00 00    	jne    402c70 <format_string_loop.constprop.0+0x610>
  40269d:	0f be 73 01          	movsx  esi,BYTE PTR [rbx+0x1]
  4026a1:	40 84 f6             	test   sil,sil
  4026a4:	0f 84 31 01 00 00    	je     4027db <format_string_loop.constprop.0+0x17b>
  4026aa:	31 c9                	xor    ecx,ecx
  4026ac:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  4026b0:	8d 46 e0             	lea    eax,[rsi-0x20]
  4026b3:	49 8d 5e 01          	lea    rbx,[r14+0x1]
  4026b7:	3c 10                	cmp    al,0x10
  4026b9:	77 15                	ja     4026d0 <format_string_loop.constprop.0+0x70>
  4026bb:	0f b6 c0             	movzx  eax,al
  4026be:	49 63 44 85 00       	movsxd rax,DWORD PTR [r13+rax*4+0x0]
  4026c3:	4c 01 e8             	add    rax,r13
  4026c6:	3e ff e0             	notrack jmp rax
  4026c9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  4026d0:	8d 56 d0             	lea    edx,[rsi-0x30]
  4026d3:	80 fa 09             	cmp    dl,0x9
  4026d6:	ba 00 00 00 00       	mov    edx,0x0
  4026db:	76 47                	jbe    402724 <format_string_loop.constprop.0+0xc4>
  4026dd:	40 80 fe 2a          	cmp    sil,0x2a
  4026e1:	0f 84 e1 05 00 00    	je     402cc8 <format_string_loop.constprop.0+0x668>
  4026e7:	45 31 d2             	xor    r10d,r10d
  4026ea:	40 80 fe 2e          	cmp    sil,0x2e
  4026ee:	74 51                	je     402741 <format_string_loop.constprop.0+0xe1>
  4026f0:	8d 7e 98             	lea    edi,[rsi-0x68]
  4026f3:	49 8d 5e 01          	lea    rbx,[r14+0x1]
  4026f7:	40 80 ff 12          	cmp    dil,0x12
  4026fb:	0f 87 7f 00 00 00    	ja     402780 <format_string_loop.constprop.0+0x120>
  402701:	4c 8d 05 d8 39 00 00 	lea    r8,[rip+0x39d8]        # 4060e0 <kb_readc+0x1118>
  402708:	40 0f b6 ff          	movzx  edi,dil
  40270c:	49 63 3c b8          	movsxd rdi,DWORD PTR [r8+rdi*4]
  402710:	4c 01 c7             	add    rdi,r8
  402713:	3e ff e7             	notrack jmp rdi
  402716:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  40271d:	00 00 00 
  402720:	48 83 c3 01          	add    rbx,0x1
  402724:	8d 04 92             	lea    eax,[rdx+rdx*4]
  402727:	49 89 de             	mov    r14,rbx
  40272a:	8d 54 46 d0          	lea    edx,[rsi+rax*2-0x30]
  40272e:	0f be 33             	movsx  esi,BYTE PTR [rbx]
  402731:	8d 46 d0             	lea    eax,[rsi-0x30]
  402734:	3c 09                	cmp    al,0x9
  402736:	76 e8                	jbe    402720 <format_string_loop.constprop.0+0xc0>
  402738:	45 31 d2             	xor    r10d,r10d
  40273b:	40 80 fe 2e          	cmp    sil,0x2e
  40273f:	75 af                	jne    4026f0 <format_string_loop.constprop.0+0x90>
  402741:	41 0f be 76 01       	movsx  esi,BYTE PTR [r14+0x1]
  402746:	80 cd 08             	or     ch,0x8
  402749:	40 84 f6             	test   sil,sil
  40274c:	0f 84 89 00 00 00    	je     4027db <format_string_loop.constprop.0+0x17b>
  402752:	44 8d 46 d0          	lea    r8d,[rsi-0x30]
  402756:	49 8d 7e 01          	lea    rdi,[r14+0x1]
  40275a:	41 80 f8 09          	cmp    r8b,0x9
  40275e:	0f 86 44 05 00 00    	jbe    402ca8 <format_string_loop.constprop.0+0x648>
  402764:	40 80 fe 2a          	cmp    sil,0x2a
  402768:	0f 84 b2 05 00 00    	je     402d20 <format_string_loop.constprop.0+0x6c0>
  40276e:	49 89 fe             	mov    r14,rdi
  402771:	8d 7e 98             	lea    edi,[rsi-0x68]
  402774:	49 8d 5e 01          	lea    rbx,[r14+0x1]
  402778:	40 80 ff 12          	cmp    dil,0x12
  40277c:	76 83                	jbe    402701 <format_string_loop.constprop.0+0xa1>
  40277e:	66 90                	xchg   ax,ax
  402780:	8d 7e db             	lea    edi,[rsi-0x25]
  402783:	40 80 ff 53          	cmp    dil,0x53
  402787:	77 17                	ja     4027a0 <format_string_loop.constprop.0+0x140>
  402789:	48 8d 05 9c 39 00 00 	lea    rax,[rip+0x399c]        # 40612c <kb_readc+0x1164>
  402790:	40 0f b6 ff          	movzx  edi,dil
  402794:	48 63 3c b8          	movsxd rdi,DWORD PTR [rax+rdi*4]
  402798:	48 01 c7             	add    rdi,rax
  40279b:	3e ff e7             	notrack jmp rdi
  40279e:	66 90                	xchg   ax,ax
  4027a0:	41 8b 54 24 18       	mov    edx,DWORD PTR [r12+0x18]
  4027a5:	8d 4a 01             	lea    ecx,[rdx+0x1]
  4027a8:	41 89 4c 24 18       	mov    DWORD PTR [r12+0x18],ecx
  4027ad:	41 3b 54 24 1c       	cmp    edx,DWORD PTR [r12+0x1c]
  4027b2:	73 1c                	jae    4027d0 <format_string_loop.constprop.0+0x170>
  4027b4:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  4027b8:	48 85 c9             	test   rcx,rcx
  4027bb:	0f 84 cf 09 00 00    	je     403190 <format_string_loop.constprop.0+0xb30>
  4027c1:	4d 8b 44 24 08       	mov    r8,QWORD PTR [r12+0x8]
  4027c6:	40 0f be fe          	movsx  edi,sil
  4027ca:	4c 89 c6             	mov    rsi,r8
  4027cd:	ff d1                	call   rcx
  4027cf:	90                   	nop
  4027d0:	0f b6 13             	movzx  edx,BYTE PTR [rbx]
  4027d3:	84 d2                	test   dl,dl
  4027d5:	0f 85 b5 fe ff ff    	jne    402690 <format_string_loop.constprop.0+0x30>
  4027db:	48 83 c4 38          	add    rsp,0x38
  4027df:	5b                   	pop    rbx
  4027e0:	5d                   	pop    rbp
  4027e1:	41 5c                	pop    r12
  4027e3:	41 5d                	pop    r13
  4027e5:	41 5e                	pop    r14
  4027e7:	41 5f                	pop    r15
  4027e9:	c3                   	ret    
  4027ea:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4027f0:	83 c9 02             	or     ecx,0x2
  4027f3:	0f be 33             	movsx  esi,BYTE PTR [rbx]
  4027f6:	49 89 de             	mov    r14,rbx
  4027f9:	e9 b2 fe ff ff       	jmp    4026b0 <format_string_loop.constprop.0+0x50>
  4027fe:	66 90                	xchg   ax,ax
  402800:	83 c9 04             	or     ecx,0x4
  402803:	eb ee                	jmp    4027f3 <format_string_loop.constprop.0+0x193>
  402805:	0f 1f 00             	nop    DWORD PTR [rax]
  402808:	83 c9 10             	or     ecx,0x10
  40280b:	eb e6                	jmp    4027f3 <format_string_loop.constprop.0+0x193>
  40280d:	0f 1f 00             	nop    DWORD PTR [rax]
  402810:	83 c9 08             	or     ecx,0x8
  402813:	eb de                	jmp    4027f3 <format_string_loop.constprop.0+0x193>
  402815:	0f 1f 00             	nop    DWORD PTR [rax]
  402818:	83 c9 01             	or     ecx,0x1
  40281b:	eb d6                	jmp    4027f3 <format_string_loop.constprop.0+0x193>
  40281d:	0f 1f 00             	nop    DWORD PTR [rax]
  402820:	41 0f b6 76 01       	movzx  esi,BYTE PTR [r14+0x1]
  402825:	80 cd 02             	or     ch,0x2
  402828:	40 84 f6             	test   sil,sil
  40282b:	74 ae                	je     4027db <format_string_loop.constprop.0+0x17b>
  40282d:	48 83 c3 01          	add    rbx,0x1
  402831:	e9 4a ff ff ff       	jmp    402780 <format_string_loop.constprop.0+0x120>
  402836:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  40283d:	00 00 00 
  402840:	40 80 fe 64          	cmp    sil,0x64
  402844:	0f 84 2a 06 00 00    	je     402e74 <format_string_loop.constprop.0+0x814>
  40284a:	40 80 fe 69          	cmp    sil,0x69
  40284e:	0f 84 20 06 00 00    	je     402e74 <format_string_loop.constprop.0+0x814>
  402854:	89 f7                	mov    edi,esi
  402856:	83 e7 df             	and    edi,0xffffffdf
  402859:	40 80 ff 58          	cmp    dil,0x58
  40285d:	0f 84 f6 05 00 00    	je     402e59 <format_string_loop.constprop.0+0x7f9>
  402863:	41 bb 08 00 00 00    	mov    r11d,0x8
  402869:	40 80 fe 6f          	cmp    sil,0x6f
  40286d:	74 15                	je     402884 <format_string_loop.constprop.0+0x224>
  40286f:	41 bb 02 00 00 00    	mov    r11d,0x2
  402875:	40 80 fe 62          	cmp    sil,0x62
  402879:	74 09                	je     402884 <format_string_loop.constprop.0+0x224>
  40287b:	83 e1 ef             	and    ecx,0xffffffef
  40287e:	41 bb 0a 00 00 00    	mov    r11d,0xa
  402884:	89 ce                	mov    esi,ecx
  402886:	83 e6 fe             	and    esi,0xfffffffe
  402889:	f6 c5 08             	test   ch,0x8
  40288c:	0f 45 ce             	cmovne ecx,esi
  40288f:	41 8b 37             	mov    esi,DWORD PTR [r15]
  402892:	89 cf                	mov    edi,ecx
  402894:	81 e7 00 04 00 00    	and    edi,0x400
  40289a:	f6 c5 40             	test   ch,0x40
  40289d:	0f 84 5d 05 00 00    	je     402e00 <format_string_loop.constprop.0+0x7a0>
  4028a3:	85 ff                	test   edi,edi
  4028a5:	0f 85 3e 07 00 00    	jne    402fe9 <format_string_loop.constprop.0+0x989>
  4028ab:	f6 c5 02             	test   ch,0x2
  4028ae:	0f 85 35 07 00 00    	jne    402fe9 <format_string_loop.constprop.0+0x989>
  4028b4:	f6 c1 40             	test   cl,0x40
  4028b7:	0f 84 e8 09 00 00    	je     4032a5 <format_string_loop.constprop.0+0xc45>
  4028bd:	83 fe 2f             	cmp    esi,0x2f
  4028c0:	0f 87 3b 0a 00 00    	ja     403301 <format_string_loop.constprop.0+0xca1>
  4028c6:	89 f7                	mov    edi,esi
  4028c8:	83 c6 08             	add    esi,0x8
  4028cb:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  4028cf:	41 89 37             	mov    DWORD PTR [r15],esi
  4028d2:	0f be 3f             	movsx  edi,BYTE PTR [rdi]
  4028d5:	4c 63 c7             	movsxd r8,edi
  4028d8:	41 89 fe             	mov    r14d,edi
  4028db:	41 89 d1             	mov    r9d,edx
  4028de:	4c 89 c6             	mov    rsi,r8
  4028e1:	41 c1 ee 1f          	shr    r14d,0x1f
  4028e5:	48 f7 de             	neg    rsi
  4028e8:	85 ff                	test   edi,edi
  4028ea:	44 89 f2             	mov    edx,r14d
  4028ed:	4c 89 e7             	mov    rdi,r12
  4028f0:	49 0f 4f f0          	cmovg  rsi,r8
  4028f4:	48 83 ec 08          	sub    rsp,0x8
  4028f8:	45 89 d0             	mov    r8d,r10d
  4028fb:	51                   	push   rcx
  4028fc:	44 89 d9             	mov    ecx,r11d
  4028ff:	e8 dc ec ff ff       	call   4015e0 <print_integer>
  402904:	41 5a                	pop    r10
  402906:	41 5b                	pop    r11
  402908:	e9 c3 fe ff ff       	jmp    4027d0 <format_string_loop.constprop.0+0x170>
  40290d:	41 0f b6 76 01       	movzx  esi,BYTE PTR [r14+0x1]
  402912:	40 84 f6             	test   sil,sil
  402915:	0f 84 c0 fe ff ff    	je     4027db <format_string_loop.constprop.0+0x17b>
  40291b:	40 80 fe 68          	cmp    sil,0x68
  40291f:	0f 84 3b 04 00 00    	je     402d60 <format_string_loop.constprop.0+0x700>
  402925:	80 c9 80             	or     cl,0x80
  402928:	48 83 c3 01          	add    rbx,0x1
  40292c:	e9 4f fe ff ff       	jmp    402780 <format_string_loop.constprop.0+0x120>
  402931:	41 0f b6 76 01       	movzx  esi,BYTE PTR [r14+0x1]
  402936:	40 84 f6             	test   sil,sil
  402939:	0f 84 9c fe ff ff    	je     4027db <format_string_loop.constprop.0+0x17b>
  40293f:	40 80 fe 6c          	cmp    sil,0x6c
  402943:	0f 84 31 04 00 00    	je     402d7a <format_string_loop.constprop.0+0x71a>
  402949:	80 cd 02             	or     ch,0x2
  40294c:	48 83 c3 01          	add    rbx,0x1
  402950:	e9 2b fe ff ff       	jmp    402780 <format_string_loop.constprop.0+0x120>
  402955:	41 89 f0             	mov    r8d,esi
  402958:	89 cf                	mov    edi,ecx
  40295a:	41 83 e0 df          	and    r8d,0xffffffdf
  40295e:	81 cf 00 10 00 00    	or     edi,0x1000
  402964:	41 80 f8 47          	cmp    r8b,0x47
  402968:	0f 44 cf             	cmove  ecx,edi
  40296b:	83 e6 fd             	and    esi,0xfffffffd
  40296e:	89 cf                	mov    edi,ecx
  402970:	83 cf 20             	or     edi,0x20
  402973:	40 80 fe 45          	cmp    sil,0x45
  402977:	41 8b 77 04          	mov    esi,DWORD PTR [r15+0x4]
  40297b:	0f 44 cf             	cmove  ecx,edi
  40297e:	81 fe af 00 00 00    	cmp    esi,0xaf
  402984:	0f 87 06 04 00 00    	ja     402d90 <format_string_loop.constprop.0+0x730>
  40298a:	89 f7                	mov    edi,esi
  40298c:	83 c6 10             	add    esi,0x10
  40298f:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  402993:	41 89 77 04          	mov    DWORD PTR [r15+0x4],esi
  402997:	f2 0f 10 07          	movsd  xmm0,QWORD PTR [rdi]
  40299b:	41 b8 01 00 00 00    	mov    r8d,0x1
  4029a1:	44 89 d6             	mov    esi,r10d
  4029a4:	4c 89 e7             	mov    rdi,r12
  4029a7:	e8 64 fa ff ff       	call   402410 <print_floating_point>
  4029ac:	e9 1f fe ff ff       	jmp    4027d0 <format_string_loop.constprop.0+0x170>
  4029b1:	89 cf                	mov    edi,ecx
  4029b3:	83 cf 20             	or     edi,0x20
  4029b6:	40 80 fe 46          	cmp    sil,0x46
  4029ba:	41 8b 77 04          	mov    esi,DWORD PTR [r15+0x4]
  4029be:	0f 44 cf             	cmove  ecx,edi
  4029c1:	81 fe af 00 00 00    	cmp    esi,0xaf
  4029c7:	0f 87 af 04 00 00    	ja     402e7c <format_string_loop.constprop.0+0x81c>
  4029cd:	89 f7                	mov    edi,esi
  4029cf:	83 c6 10             	add    esi,0x10
  4029d2:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  4029d6:	41 89 77 04          	mov    DWORD PTR [r15+0x4],esi
  4029da:	f2 0f 10 07          	movsd  xmm0,QWORD PTR [rdi]
  4029de:	45 31 c0             	xor    r8d,r8d
  4029e1:	44 89 d6             	mov    esi,r10d
  4029e4:	4c 89 e7             	mov    rdi,r12
  4029e7:	e8 24 fa ff ff       	call   402410 <print_floating_point>
  4029ec:	e9 df fd ff ff       	jmp    4027d0 <format_string_loop.constprop.0+0x170>
  4029f1:	41 8b 37             	mov    esi,DWORD PTR [r15]
  4029f4:	83 fe 2f             	cmp    esi,0x2f
  4029f7:	0f 87 a4 03 00 00    	ja     402da1 <format_string_loop.constprop.0+0x741>
  4029fd:	89 f7                	mov    edi,esi
  4029ff:	83 c6 08             	add    esi,0x8
  402a02:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  402a06:	41 89 37             	mov    DWORD PTR [r15],esi
  402a09:	48 8b 2f             	mov    rbp,QWORD PTR [rdi]
  402a0c:	48 85 ed             	test   rbp,rbp
  402a0f:	0f 84 a4 03 00 00    	je     402db9 <format_string_loop.constprop.0+0x759>
  402a15:	44 0f b6 4d 00       	movzx  r9d,BYTE PTR [rbp+0x0]
  402a1a:	44 89 ce             	mov    esi,r9d
  402a1d:	45 85 d2             	test   r10d,r10d
  402a20:	0f 85 35 05 00 00    	jne    402f5b <format_string_loop.constprop.0+0x8fb>
  402a26:	bf fe ff ff 7f       	mov    edi,0x7ffffffe
  402a2b:	45 84 c9             	test   r9b,r9b
  402a2e:	0f 84 82 09 00 00    	je     4033b6 <format_string_loop.constprop.0+0xd56>
  402a34:	83 c7 01             	add    edi,0x1
  402a37:	49 89 ee             	mov    r14,rbp
  402a3a:	48 01 ef             	add    rdi,rbp
  402a3d:	eb 06                	jmp    402a45 <format_string_loop.constprop.0+0x3e5>
  402a3f:	90                   	nop
  402a40:	49 39 fe             	cmp    r14,rdi
  402a43:	74 0a                	je     402a4f <format_string_loop.constprop.0+0x3ef>
  402a45:	49 83 c6 01          	add    r14,0x1
  402a49:	41 80 3e 00          	cmp    BYTE PTR [r14],0x0
  402a4d:	75 f1                	jne    402a40 <format_string_loop.constprop.0+0x3e0>
  402a4f:	44 89 f0             	mov    eax,r14d
  402a52:	29 e8                	sub    eax,ebp
  402a54:	89 44 24 10          	mov    DWORD PTR [rsp+0x10],eax
  402a58:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  402a5c:	41 89 ce             	mov    r14d,ecx
  402a5f:	44 39 d0             	cmp    eax,r10d
  402a62:	89 c7                	mov    edi,eax
  402a64:	41 0f 47 fa          	cmova  edi,r10d
  402a68:	41 81 e6 00 08 00 00 	and    r14d,0x800
  402a6f:	0f 44 f8             	cmove  edi,eax
  402a72:	83 e1 02             	and    ecx,0x2
  402a75:	89 4c 24 1c          	mov    DWORD PTR [rsp+0x1c],ecx
  402a79:	89 7c 24 10          	mov    DWORD PTR [rsp+0x10],edi
  402a7d:	0f 84 1b 07 00 00    	je     40319e <format_string_loop.constprop.0+0xb3e>
  402a83:	45 84 c9             	test   r9b,r9b
  402a86:	0f 84 92 00 00 00    	je     402b1e <format_string_loop.constprop.0+0x4be>
  402a8c:	45 85 f6             	test   r14d,r14d
  402a8f:	0f 94 44 24 08       	sete   BYTE PTR [rsp+0x8]
  402a94:	0f b6 44 24 08       	movzx  eax,BYTE PTR [rsp+0x8]
  402a99:	45 85 d2             	test   r10d,r10d
  402a9c:	75 04                	jne    402aa2 <format_string_loop.constprop.0+0x442>
  402a9e:	84 c0                	test   al,al
  402aa0:	74 7c                	je     402b1e <format_string_loop.constprop.0+0x4be>
  402aa2:	4c 89 7c 24 20       	mov    QWORD PTR [rsp+0x20],r15
  402aa7:	49 89 ee             	mov    r14,rbp
  402aaa:	41 89 d7             	mov    r15d,edx
  402aad:	48 89 5c 24 28       	mov    QWORD PTR [rsp+0x28],rbx
  402ab2:	44 89 d3             	mov    ebx,r10d
  402ab5:	0f 1f 00             	nop    DWORD PTR [rax]
  402ab8:	41 8b 44 24 18       	mov    eax,DWORD PTR [r12+0x18]
  402abd:	49 83 c6 01          	add    r14,0x1
  402ac1:	8d 78 01             	lea    edi,[rax+0x1]
  402ac4:	41 89 7c 24 18       	mov    DWORD PTR [r12+0x18],edi
  402ac9:	41 3b 44 24 1c       	cmp    eax,DWORD PTR [r12+0x1c]
  402ace:	73 1c                	jae    402aec <format_string_loop.constprop.0+0x48c>
  402ad0:	4d 8b 04 24          	mov    r8,QWORD PTR [r12]
  402ad4:	4d 85 c0             	test   r8,r8
  402ad7:	0f 84 c3 05 00 00    	je     4030a0 <format_string_loop.constprop.0+0xa40>
  402add:	4d 8b 4c 24 08       	mov    r9,QWORD PTR [r12+0x8]
  402ae2:	40 0f be fe          	movsx  edi,sil
  402ae6:	4c 89 ce             	mov    rsi,r9
  402ae9:	41 ff d0             	call   r8
  402aec:	41 0f b6 36          	movzx  esi,BYTE PTR [r14]
  402af0:	40 84 f6             	test   sil,sil
  402af3:	74 10                	je     402b05 <format_string_loop.constprop.0+0x4a5>
  402af5:	89 d8                	mov    eax,ebx
  402af7:	44 29 f0             	sub    eax,r14d
  402afa:	01 e8                	add    eax,ebp
  402afc:	75 ba                	jne    402ab8 <format_string_loop.constprop.0+0x458>
  402afe:	80 7c 24 08 00       	cmp    BYTE PTR [rsp+0x8],0x0
  402b03:	75 b3                	jne    402ab8 <format_string_loop.constprop.0+0x458>
  402b05:	8b 4c 24 1c          	mov    ecx,DWORD PTR [rsp+0x1c]
  402b09:	44 89 fa             	mov    edx,r15d
  402b0c:	48 8b 5c 24 28       	mov    rbx,QWORD PTR [rsp+0x28]
  402b11:	4c 8b 7c 24 20       	mov    r15,QWORD PTR [rsp+0x20]
  402b16:	85 c9                	test   ecx,ecx
  402b18:	0f 84 b2 fc ff ff    	je     4027d0 <format_string_loop.constprop.0+0x170>
  402b1e:	8b 44 24 10          	mov    eax,DWORD PTR [rsp+0x10]
  402b22:	41 89 d6             	mov    r14d,edx
  402b25:	8d 68 01             	lea    ebp,[rax+0x1]
  402b28:	39 c2                	cmp    edx,eax
  402b2a:	0f 87 22 05 00 00    	ja     403052 <format_string_loop.constprop.0+0x9f2>
  402b30:	e9 9b fc ff ff       	jmp    4027d0 <format_string_loop.constprop.0+0x170>
  402b35:	0f 1f 00             	nop    DWORD PTR [rax]
  402b38:	41 8b 54 24 18       	mov    edx,DWORD PTR [r12+0x18]
  402b3d:	8d 4a 01             	lea    ecx,[rdx+0x1]
  402b40:	41 89 4c 24 18       	mov    DWORD PTR [r12+0x18],ecx
  402b45:	41 3b 54 24 1c       	cmp    edx,DWORD PTR [r12+0x1c]
  402b4a:	0f 83 80 fc ff ff    	jae    4027d0 <format_string_loop.constprop.0+0x170>
  402b50:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  402b54:	48 85 c9             	test   rcx,rcx
  402b57:	0f 84 25 06 00 00    	je     403182 <format_string_loop.constprop.0+0xb22>
  402b5d:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  402b62:	bf 25 00 00 00       	mov    edi,0x25
  402b67:	ff d1                	call   rcx
  402b69:	e9 62 fc ff ff       	jmp    4027d0 <format_string_loop.constprop.0+0x170>
  402b6e:	41 8b 74 24 18       	mov    esi,DWORD PTR [r12+0x18]
  402b73:	41 8b 17             	mov    edx,DWORD PTR [r15]
  402b76:	f6 c1 40             	test   cl,0x40
  402b79:	0f 84 58 02 00 00    	je     402dd7 <format_string_loop.constprop.0+0x777>
  402b7f:	83 fa 2f             	cmp    edx,0x2f
  402b82:	0f 86 e5 03 00 00    	jbe    402f6d <format_string_loop.constprop.0+0x90d>
  402b88:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  402b8c:	48 8d 51 08          	lea    rdx,[rcx+0x8]
  402b90:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  402b94:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  402b97:	40 88 32             	mov    BYTE PTR [rdx],sil
  402b9a:	e9 31 fc ff ff       	jmp    4027d0 <format_string_loop.constprop.0+0x170>
  402b9f:	83 e1 02             	and    ecx,0x2
  402ba2:	41 8b 74 24 18       	mov    esi,DWORD PTR [r12+0x18]
  402ba7:	41 8b 7c 24 1c       	mov    edi,DWORD PTR [r12+0x1c]
  402bac:	89 cd                	mov    ebp,ecx
  402bae:	0f 84 fa 04 00 00    	je     4030ae <format_string_loop.constprop.0+0xa4e>
  402bb4:	41 8b 0f             	mov    ecx,DWORD PTR [r15]
  402bb7:	83 f9 2f             	cmp    ecx,0x2f
  402bba:	0f 87 06 03 00 00    	ja     402ec6 <format_string_loop.constprop.0+0x866>
  402bc0:	41 89 c8             	mov    r8d,ecx
  402bc3:	83 c1 08             	add    ecx,0x8
  402bc6:	4d 03 47 10          	add    r8,QWORD PTR [r15+0x10]
  402bca:	41 89 0f             	mov    DWORD PTR [r15],ecx
  402bcd:	41 8b 08             	mov    ecx,DWORD PTR [r8]
  402bd0:	44 8d 46 01          	lea    r8d,[rsi+0x1]
  402bd4:	45 89 44 24 18       	mov    DWORD PTR [r12+0x18],r8d
  402bd9:	39 fe                	cmp    esi,edi
  402bdb:	0f 83 05 03 00 00    	jae    402ee6 <format_string_loop.constprop.0+0x886>
  402be1:	41 89 c8             	mov    r8d,ecx
  402be4:	0f be f9             	movsx  edi,cl
  402be7:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  402beb:	c7 44 24 08 01 00 00 	mov    DWORD PTR [rsp+0x8],0x1
  402bf2:	00 
  402bf3:	48 85 c9             	test   rcx,rcx
  402bf6:	0f 84 60 05 00 00    	je     40315c <format_string_loop.constprop.0+0xafc>
  402bfc:	89 54 24 10          	mov    DWORD PTR [rsp+0x10],edx
  402c00:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  402c05:	ff d1                	call   rcx
  402c07:	8b 54 24 10          	mov    edx,DWORD PTR [rsp+0x10]
  402c0b:	85 ed                	test   ebp,ebp
  402c0d:	0f 84 bd fb ff ff    	je     4027d0 <format_string_loop.constprop.0+0x170>
  402c13:	8b 44 24 08          	mov    eax,DWORD PTR [rsp+0x8]
  402c17:	8d 68 01             	lea    ebp,[rax+0x1]
  402c1a:	e9 d4 02 00 00       	jmp    402ef3 <format_string_loop.constprop.0+0x893>
  402c1f:	90                   	nop
  402c20:	41 8b 17             	mov    edx,DWORD PTR [r15]
  402c23:	81 c9 01 20 00 00    	or     ecx,0x2001
  402c29:	83 fa 2f             	cmp    edx,0x2f
  402c2c:	0f 87 5b 02 00 00    	ja     402e8d <format_string_loop.constprop.0+0x82d>
  402c32:	89 d6                	mov    esi,edx
  402c34:	83 c2 08             	add    edx,0x8
  402c37:	49 03 77 10          	add    rsi,QWORD PTR [r15+0x10]
  402c3b:	41 89 17             	mov    DWORD PTR [r15],edx
  402c3e:	48 8b 36             	mov    rsi,QWORD PTR [rsi]
  402c41:	48 85 f6             	test   rsi,rsi
  402c44:	0f 84 5b 02 00 00    	je     402ea5 <format_string_loop.constprop.0+0x845>
  402c4a:	48 83 ec 08          	sub    rsp,0x8
  402c4e:	31 d2                	xor    edx,edx
  402c50:	41 b9 12 00 00 00    	mov    r9d,0x12
  402c56:	45 89 d0             	mov    r8d,r10d
  402c59:	51                   	push   rcx
  402c5a:	4c 89 e7             	mov    rdi,r12
  402c5d:	b9 10 00 00 00       	mov    ecx,0x10
  402c62:	e8 79 e9 ff ff       	call   4015e0 <print_integer>
  402c67:	58                   	pop    rax
  402c68:	5a                   	pop    rdx
  402c69:	e9 62 fb ff ff       	jmp    4027d0 <format_string_loop.constprop.0+0x170>
  402c6e:	66 90                	xchg   ax,ax
  402c70:	41 8b 4c 24 18       	mov    ecx,DWORD PTR [r12+0x18]
  402c75:	8d 71 01             	lea    esi,[rcx+0x1]
  402c78:	41 89 74 24 18       	mov    DWORD PTR [r12+0x18],esi
  402c7d:	41 3b 4c 24 1c       	cmp    ecx,DWORD PTR [r12+0x1c]
  402c82:	73 18                	jae    402c9c <format_string_loop.constprop.0+0x63c>
  402c84:	4d 8b 04 24          	mov    r8,QWORD PTR [r12]
  402c88:	4d 85 c0             	test   r8,r8
  402c8b:	0f 84 7f 00 00 00    	je     402d10 <format_string_loop.constprop.0+0x6b0>
  402c91:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  402c96:	0f be fa             	movsx  edi,dl
  402c99:	41 ff d0             	call   r8
  402c9c:	4c 89 f3             	mov    rbx,r14
  402c9f:	e9 2c fb ff ff       	jmp    4027d0 <format_string_loop.constprop.0+0x170>
  402ca4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402ca8:	43 8d 04 92          	lea    eax,[r10+r10*4]
  402cac:	48 83 c7 01          	add    rdi,0x1
  402cb0:	44 8d 54 46 d0       	lea    r10d,[rsi+rax*2-0x30]
  402cb5:	0f be 37             	movsx  esi,BYTE PTR [rdi]
  402cb8:	8d 46 d0             	lea    eax,[rsi-0x30]
  402cbb:	3c 09                	cmp    al,0x9
  402cbd:	76 e9                	jbe    402ca8 <format_string_loop.constprop.0+0x648>
  402cbf:	e9 aa fa ff ff       	jmp    40276e <format_string_loop.constprop.0+0x10e>
  402cc4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402cc8:	41 8b 17             	mov    edx,DWORD PTR [r15]
  402ccb:	83 fa 2f             	cmp    edx,0x2f
  402cce:	77 30                	ja     402d00 <format_string_loop.constprop.0+0x6a0>
  402cd0:	89 d6                	mov    esi,edx
  402cd2:	83 c2 08             	add    edx,0x8
  402cd5:	49 03 77 10          	add    rsi,QWORD PTR [r15+0x10]
  402cd9:	41 89 17             	mov    DWORD PTR [r15],edx
  402cdc:	8b 16                	mov    edx,DWORD PTR [rsi]
  402cde:	85 d2                	test   edx,edx
  402ce0:	79 05                	jns    402ce7 <format_string_loop.constprop.0+0x687>
  402ce2:	83 c9 02             	or     ecx,0x2
  402ce5:	f7 da                	neg    edx
  402ce7:	41 0f b6 76 01       	movzx  esi,BYTE PTR [r14+0x1]
  402cec:	40 84 f6             	test   sil,sil
  402cef:	0f 84 e6 fa ff ff    	je     4027db <format_string_loop.constprop.0+0x17b>
  402cf5:	49 89 de             	mov    r14,rbx
  402cf8:	e9 ea f9 ff ff       	jmp    4026e7 <format_string_loop.constprop.0+0x87>
  402cfd:	0f 1f 00             	nop    DWORD PTR [rax]
  402d00:	49 8b 77 08          	mov    rsi,QWORD PTR [r15+0x8]
  402d04:	48 8d 56 08          	lea    rdx,[rsi+0x8]
  402d08:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  402d0c:	eb ce                	jmp    402cdc <format_string_loop.constprop.0+0x67c>
  402d0e:	66 90                	xchg   ax,ax
  402d10:	49 8b 74 24 10       	mov    rsi,QWORD PTR [r12+0x10]
  402d15:	88 14 0e             	mov    BYTE PTR [rsi+rcx*1],dl
  402d18:	e9 7f ff ff ff       	jmp    402c9c <format_string_loop.constprop.0+0x63c>
  402d1d:	0f 1f 00             	nop    DWORD PTR [rax]
  402d20:	41 8b 37             	mov    esi,DWORD PTR [r15]
  402d23:	83 fe 2f             	cmp    esi,0x2f
  402d26:	0f 87 1e 02 00 00    	ja     402f4a <format_string_loop.constprop.0+0x8ea>
  402d2c:	89 f7                	mov    edi,esi
  402d2e:	83 c6 08             	add    esi,0x8
  402d31:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  402d35:	41 89 37             	mov    DWORD PTR [r15],esi
  402d38:	44 8b 17             	mov    r10d,DWORD PTR [rdi]
  402d3b:	31 f6                	xor    esi,esi
  402d3d:	49 8d 7e 02          	lea    rdi,[r14+0x2]
  402d41:	45 85 d2             	test   r10d,r10d
  402d44:	44 0f 48 d6          	cmovs  r10d,esi
  402d48:	41 0f b6 76 02       	movzx  esi,BYTE PTR [r14+0x2]
  402d4d:	40 84 f6             	test   sil,sil
  402d50:	0f 85 18 fa ff ff    	jne    40276e <format_string_loop.constprop.0+0x10e>
  402d56:	e9 80 fa ff ff       	jmp    4027db <format_string_loop.constprop.0+0x17b>
  402d5b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  402d60:	41 0f b6 76 02       	movzx  esi,BYTE PTR [r14+0x2]
  402d65:	80 c9 c0             	or     cl,0xc0
  402d68:	40 84 f6             	test   sil,sil
  402d6b:	0f 84 6a fa ff ff    	je     4027db <format_string_loop.constprop.0+0x17b>
  402d71:	49 8d 5e 03          	lea    rbx,[r14+0x3]
  402d75:	e9 06 fa ff ff       	jmp    402780 <format_string_loop.constprop.0+0x120>
  402d7a:	41 0f b6 76 02       	movzx  esi,BYTE PTR [r14+0x2]
  402d7f:	80 cd 06             	or     ch,0x6
  402d82:	40 84 f6             	test   sil,sil
  402d85:	75 ea                	jne    402d71 <format_string_loop.constprop.0+0x711>
  402d87:	e9 4f fa ff ff       	jmp    4027db <format_string_loop.constprop.0+0x17b>
  402d8c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  402d90:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  402d94:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  402d98:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  402d9c:	e9 f6 fb ff ff       	jmp    402997 <format_string_loop.constprop.0+0x337>
  402da1:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  402da5:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  402da9:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  402dad:	48 8b 2f             	mov    rbp,QWORD PTR [rdi]
  402db0:	48 85 ed             	test   rbp,rbp
  402db3:	0f 85 5c fc ff ff    	jne    402a15 <format_string_loop.constprop.0+0x3b5>
  402db9:	41 89 c8             	mov    r8d,ecx
  402dbc:	48 8d 35 cb 32 00 00 	lea    rsi,[rip+0x32cb]        # 40608e <kb_readc+0x10c6>
  402dc3:	89 d1                	mov    ecx,edx
  402dc5:	4c 89 e7             	mov    rdi,r12
  402dc8:	ba 06 00 00 00       	mov    edx,0x6
  402dcd:	e8 ce e6 ff ff       	call   4014a0 <out_rev_>
  402dd2:	e9 f9 f9 ff ff       	jmp    4027d0 <format_string_loop.constprop.0+0x170>
  402dd7:	f6 c1 80             	test   cl,0x80
  402dda:	0f 84 9e 01 00 00    	je     402f7e <format_string_loop.constprop.0+0x91e>
  402de0:	83 fa 2f             	cmp    edx,0x2f
  402de3:	0f 87 ab 04 00 00    	ja     403294 <format_string_loop.constprop.0+0xc34>
  402de9:	89 d1                	mov    ecx,edx
  402deb:	83 c2 08             	add    edx,0x8
  402dee:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  402df2:	41 89 17             	mov    DWORD PTR [r15],edx
  402df5:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  402df8:	66 89 32             	mov    WORD PTR [rdx],si
  402dfb:	e9 d0 f9 ff ff       	jmp    4027d0 <format_string_loop.constprop.0+0x170>
  402e00:	41 89 c8             	mov    r8d,ecx
  402e03:	41 83 e0 f3          	and    r8d,0xfffffff3
  402e07:	85 ff                	test   edi,edi
  402e09:	0f 85 a0 01 00 00    	jne    402faf <format_string_loop.constprop.0+0x94f>
  402e0f:	f6 c5 02             	test   ch,0x2
  402e12:	0f 85 97 01 00 00    	jne    402faf <format_string_loop.constprop.0+0x94f>
  402e18:	f6 c1 40             	test   cl,0x40
  402e1b:	0f 84 aa 04 00 00    	je     4032cb <format_string_loop.constprop.0+0xc6b>
  402e21:	83 fe 2f             	cmp    esi,0x2f
  402e24:	0f 87 00 05 00 00    	ja     40332a <format_string_loop.constprop.0+0xcca>
  402e2a:	89 f1                	mov    ecx,esi
  402e2c:	83 c6 08             	add    esi,0x8
  402e2f:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  402e33:	41 89 37             	mov    DWORD PTR [r15],esi
  402e36:	0f b6 31             	movzx  esi,BYTE PTR [rcx]
  402e39:	48 83 ec 08          	sub    rsp,0x8
  402e3d:	41 89 d1             	mov    r9d,edx
  402e40:	4c 89 e7             	mov    rdi,r12
  402e43:	44 89 d9             	mov    ecx,r11d
  402e46:	41 50                	push   r8
  402e48:	31 d2                	xor    edx,edx
  402e4a:	45 89 d0             	mov    r8d,r10d
  402e4d:	e8 8e e7 ff ff       	call   4015e0 <print_integer>
  402e52:	5e                   	pop    rsi
  402e53:	5f                   	pop    rdi
  402e54:	e9 77 f9 ff ff       	jmp    4027d0 <format_string_loop.constprop.0+0x170>
  402e59:	89 cf                	mov    edi,ecx
  402e5b:	83 c9 20             	or     ecx,0x20
  402e5e:	40 80 fe 58          	cmp    sil,0x58
  402e62:	41 bb 10 00 00 00    	mov    r11d,0x10
  402e68:	89 cd                	mov    ebp,ecx
  402e6a:	89 f9                	mov    ecx,edi
  402e6c:	0f 44 cd             	cmove  ecx,ebp
  402e6f:	e9 10 fa ff ff       	jmp    402884 <format_string_loop.constprop.0+0x224>
  402e74:	80 cd 40             	or     ch,0x40
  402e77:	e9 d8 f9 ff ff       	jmp    402854 <format_string_loop.constprop.0+0x1f4>
  402e7c:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  402e80:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  402e84:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  402e88:	e9 4d fb ff ff       	jmp    4029da <format_string_loop.constprop.0+0x37a>
  402e8d:	49 8b 77 08          	mov    rsi,QWORD PTR [r15+0x8]
  402e91:	48 8d 56 08          	lea    rdx,[rsi+0x8]
  402e95:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  402e99:	48 8b 36             	mov    rsi,QWORD PTR [rsi]
  402e9c:	48 85 f6             	test   rsi,rsi
  402e9f:	0f 85 a5 fd ff ff    	jne    402c4a <format_string_loop.constprop.0+0x5ea>
  402ea5:	41 89 c8             	mov    r8d,ecx
  402ea8:	ba 05 00 00 00       	mov    edx,0x5
  402ead:	b9 12 00 00 00       	mov    ecx,0x12
  402eb2:	4c 89 e7             	mov    rdi,r12
  402eb5:	48 8d 35 d9 31 00 00 	lea    rsi,[rip+0x31d9]        # 406095 <kb_readc+0x10cd>
  402ebc:	e8 df e5 ff ff       	call   4014a0 <out_rev_>
  402ec1:	e9 0a f9 ff ff       	jmp    4027d0 <format_string_loop.constprop.0+0x170>
  402ec6:	4d 8b 47 08          	mov    r8,QWORD PTR [r15+0x8]
  402eca:	49 8d 48 08          	lea    rcx,[r8+0x8]
  402ece:	49 89 4f 08          	mov    QWORD PTR [r15+0x8],rcx
  402ed2:	41 8b 08             	mov    ecx,DWORD PTR [r8]
  402ed5:	44 8d 46 01          	lea    r8d,[rsi+0x1]
  402ed9:	45 89 44 24 18       	mov    DWORD PTR [r12+0x18],r8d
  402ede:	39 fe                	cmp    esi,edi
  402ee0:	0f 82 fb fc ff ff    	jb     402be1 <format_string_loop.constprop.0+0x581>
  402ee6:	c7 44 24 08 01 00 00 	mov    DWORD PTR [rsp+0x8],0x1
  402eed:	00 
  402eee:	bd 02 00 00 00       	mov    ebp,0x2
  402ef3:	41 89 d6             	mov    r14d,edx
  402ef6:	3b 54 24 08          	cmp    edx,DWORD PTR [rsp+0x8]
  402efa:	77 26                	ja     402f22 <format_string_loop.constprop.0+0x8c2>
  402efc:	e9 cf f8 ff ff       	jmp    4027d0 <format_string_loop.constprop.0+0x170>
  402f01:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
  402f08:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  402f0d:	bf 20 00 00 00       	mov    edi,0x20
  402f12:	ff d1                	call   rcx
  402f14:	8d 45 01             	lea    eax,[rbp+0x1]
  402f17:	41 39 ee             	cmp    r14d,ebp
  402f1a:	0f 86 b0 f8 ff ff    	jbe    4027d0 <format_string_loop.constprop.0+0x170>
  402f20:	89 c5                	mov    ebp,eax
  402f22:	41 8b 44 24 18       	mov    eax,DWORD PTR [r12+0x18]
  402f27:	8d 48 01             	lea    ecx,[rax+0x1]
  402f2a:	41 89 4c 24 18       	mov    DWORD PTR [r12+0x18],ecx
  402f2f:	41 3b 44 24 1c       	cmp    eax,DWORD PTR [r12+0x1c]
  402f34:	73 de                	jae    402f14 <format_string_loop.constprop.0+0x8b4>
  402f36:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  402f3a:	48 85 c9             	test   rcx,rcx
  402f3d:	75 c9                	jne    402f08 <format_string_loop.constprop.0+0x8a8>
  402f3f:	49 8b 54 24 10       	mov    rdx,QWORD PTR [r12+0x10]
  402f44:	c6 04 02 20          	mov    BYTE PTR [rdx+rax*1],0x20
  402f48:	eb ca                	jmp    402f14 <format_string_loop.constprop.0+0x8b4>
  402f4a:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  402f4e:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  402f52:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  402f56:	e9 dd fd ff ff       	jmp    402d38 <format_string_loop.constprop.0+0x6d8>
  402f5b:	45 84 c9             	test   r9b,r9b
  402f5e:	0f 84 52 04 00 00    	je     4033b6 <format_string_loop.constprop.0+0xd56>
  402f64:	41 8d 7a ff          	lea    edi,[r10-0x1]
  402f68:	e9 c7 fa ff ff       	jmp    402a34 <format_string_loop.constprop.0+0x3d4>
  402f6d:	89 d1                	mov    ecx,edx
  402f6f:	83 c2 08             	add    edx,0x8
  402f72:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  402f76:	41 89 17             	mov    DWORD PTR [r15],edx
  402f79:	e9 16 fc ff ff       	jmp    402b94 <format_string_loop.constprop.0+0x534>
  402f7e:	f6 c5 02             	test   ch,0x2
  402f81:	0f 85 f3 00 00 00    	jne    40307a <format_string_loop.constprop.0+0xa1a>
  402f87:	80 e5 04             	and    ch,0x4
  402f8a:	0f 85 ea 00 00 00    	jne    40307a <format_string_loop.constprop.0+0xa1a>
  402f90:	83 fa 2f             	cmp    edx,0x2f
  402f93:	0f 87 ba 03 00 00    	ja     403353 <format_string_loop.constprop.0+0xcf3>
  402f99:	89 d1                	mov    ecx,edx
  402f9b:	83 c2 08             	add    edx,0x8
  402f9e:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  402fa2:	41 89 17             	mov    DWORD PTR [r15],edx
  402fa5:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  402fa8:	89 32                	mov    DWORD PTR [rdx],esi
  402faa:	e9 21 f8 ff ff       	jmp    4027d0 <format_string_loop.constprop.0+0x170>
  402faf:	83 fe 2f             	cmp    esi,0x2f
  402fb2:	0f 87 b9 02 00 00    	ja     403271 <format_string_loop.constprop.0+0xc11>
  402fb8:	89 f7                	mov    edi,esi
  402fba:	83 c6 08             	add    esi,0x8
  402fbd:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  402fc1:	41 89 37             	mov    DWORD PTR [r15],esi
  402fc4:	48 83 ec 08          	sub    rsp,0x8
  402fc8:	41 89 d1             	mov    r9d,edx
  402fcb:	44 89 d9             	mov    ecx,r11d
  402fce:	31 d2                	xor    edx,edx
  402fd0:	41 50                	push   r8
  402fd2:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
  402fd5:	45 89 d0             	mov    r8d,r10d
  402fd8:	4c 89 e7             	mov    rdi,r12
  402fdb:	e8 00 e6 ff ff       	call   4015e0 <print_integer>
  402fe0:	41 58                	pop    r8
  402fe2:	41 59                	pop    r9
  402fe4:	e9 e7 f7 ff ff       	jmp    4027d0 <format_string_loop.constprop.0+0x170>
  402fe9:	83 fe 2f             	cmp    esi,0x2f
  402fec:	0f 87 6e 02 00 00    	ja     403260 <format_string_loop.constprop.0+0xc00>
  402ff2:	89 f7                	mov    edi,esi
  402ff4:	83 c6 08             	add    esi,0x8
  402ff7:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  402ffb:	41 89 37             	mov    DWORD PTR [r15],esi
  402ffe:	48 8b 37             	mov    rsi,QWORD PTR [rdi]
  403001:	41 89 d1             	mov    r9d,edx
  403004:	45 89 d0             	mov    r8d,r10d
  403007:	4c 89 e7             	mov    rdi,r12
  40300a:	48 89 f5             	mov    rbp,rsi
  40300d:	48 f7 dd             	neg    rbp
  403010:	48 0f 48 ee          	cmovs  rbp,rsi
  403014:	48 83 ec 08          	sub    rsp,0x8
  403018:	48 c1 ee 3f          	shr    rsi,0x3f
  40301c:	51                   	push   rcx
  40301d:	48 89 f2             	mov    rdx,rsi
  403020:	44 89 d9             	mov    ecx,r11d
  403023:	48 89 ee             	mov    rsi,rbp
  403026:	e8 b5 e5 ff ff       	call   4015e0 <print_integer>
  40302b:	5d                   	pop    rbp
  40302c:	41 5e                	pop    r14
  40302e:	e9 9d f7 ff ff       	jmp    4027d0 <format_string_loop.constprop.0+0x170>
  403033:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  403038:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  40303d:	bf 20 00 00 00       	mov    edi,0x20
  403042:	ff d1                	call   rcx
  403044:	8d 45 01             	lea    eax,[rbp+0x1]
  403047:	41 39 ee             	cmp    r14d,ebp
  40304a:	0f 84 80 f7 ff ff    	je     4027d0 <format_string_loop.constprop.0+0x170>
  403050:	89 c5                	mov    ebp,eax
  403052:	41 8b 44 24 18       	mov    eax,DWORD PTR [r12+0x18]
  403057:	8d 48 01             	lea    ecx,[rax+0x1]
  40305a:	41 89 4c 24 18       	mov    DWORD PTR [r12+0x18],ecx
  40305f:	41 3b 44 24 1c       	cmp    eax,DWORD PTR [r12+0x1c]
  403064:	73 de                	jae    403044 <format_string_loop.constprop.0+0x9e4>
  403066:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  40306a:	48 85 c9             	test   rcx,rcx
  40306d:	75 c9                	jne    403038 <format_string_loop.constprop.0+0x9d8>
  40306f:	49 8b 54 24 10       	mov    rdx,QWORD PTR [r12+0x10]
  403074:	c6 04 02 20          	mov    BYTE PTR [rdx+rax*1],0x20
  403078:	eb ca                	jmp    403044 <format_string_loop.constprop.0+0x9e4>
  40307a:	83 fa 2f             	cmp    edx,0x2f
  40307d:	0f 87 6d 02 00 00    	ja     4032f0 <format_string_loop.constprop.0+0xc90>
  403083:	89 d1                	mov    ecx,edx
  403085:	83 c2 08             	add    edx,0x8
  403088:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  40308c:	41 89 17             	mov    DWORD PTR [r15],edx
  40308f:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
  403092:	89 f0                	mov    eax,esi
  403094:	48 89 02             	mov    QWORD PTR [rdx],rax
  403097:	e9 34 f7 ff ff       	jmp    4027d0 <format_string_loop.constprop.0+0x170>
  40309c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
  4030a0:	49 8b 7c 24 10       	mov    rdi,QWORD PTR [r12+0x10]
  4030a5:	40 88 34 07          	mov    BYTE PTR [rdi+rax*1],sil
  4030a9:	e9 3e fa ff ff       	jmp    402aec <format_string_loop.constprop.0+0x48c>
  4030ae:	83 fa 01             	cmp    edx,0x1
  4030b1:	0f 86 0c 03 00 00    	jbe    4033c3 <format_string_loop.constprop.0+0xd63>
  4030b7:	8d 42 01             	lea    eax,[rdx+0x1]
  4030ba:	48 89 5c 24 10       	mov    QWORD PTR [rsp+0x10],rbx
  4030bf:	41 be 02 00 00 00    	mov    r14d,0x2
  4030c5:	89 d3                	mov    ebx,edx
  4030c7:	89 44 24 08          	mov    DWORD PTR [rsp+0x8],eax
  4030cb:	eb 32                	jmp    4030ff <format_string_loop.constprop.0+0xa9f>
  4030cd:	0f 1f 00             	nop    DWORD PTR [rax]
  4030d0:	49 8b 04 24          	mov    rax,QWORD PTR [r12]
  4030d4:	48 85 c0             	test   rax,rax
  4030d7:	0f 84 8d 00 00 00    	je     40316a <format_string_loop.constprop.0+0xb0a>
  4030dd:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  4030e2:	bf 20 00 00 00       	mov    edi,0x20
  4030e7:	ff d0                	call   rax
  4030e9:	41 8b 74 24 18       	mov    esi,DWORD PTR [r12+0x18]
  4030ee:	41 8b 7c 24 1c       	mov    edi,DWORD PTR [r12+0x1c]
  4030f3:	41 8d 46 01          	lea    eax,[r14+0x1]
  4030f7:	44 39 f3             	cmp    ebx,r14d
  4030fa:	74 1a                	je     403116 <format_string_loop.constprop.0+0xab6>
  4030fc:	41 89 c6             	mov    r14d,eax
  4030ff:	8d 46 01             	lea    eax,[rsi+0x1]
  403102:	41 89 44 24 18       	mov    DWORD PTR [r12+0x18],eax
  403107:	39 fe                	cmp    esi,edi
  403109:	72 c5                	jb     4030d0 <format_string_loop.constprop.0+0xa70>
  40310b:	89 c6                	mov    esi,eax
  40310d:	41 8d 46 01          	lea    eax,[r14+0x1]
  403111:	44 39 f3             	cmp    ebx,r14d
  403114:	75 e6                	jne    4030fc <format_string_loop.constprop.0+0xa9c>
  403116:	89 da                	mov    edx,ebx
  403118:	48 8b 5c 24 10       	mov    rbx,QWORD PTR [rsp+0x10]
  40311d:	41 8b 0f             	mov    ecx,DWORD PTR [r15]
  403120:	83 f9 2f             	cmp    ecx,0x2f
  403123:	0f 86 59 01 00 00    	jbe    403282 <format_string_loop.constprop.0+0xc22>
  403129:	4d 8b 47 08          	mov    r8,QWORD PTR [r15+0x8]
  40312d:	49 8d 48 08          	lea    rcx,[r8+0x8]
  403131:	49 89 4f 08          	mov    QWORD PTR [r15+0x8],rcx
  403135:	41 8b 08             	mov    ecx,DWORD PTR [r8]
  403138:	44 8d 46 01          	lea    r8d,[rsi+0x1]
  40313c:	45 89 44 24 18       	mov    DWORD PTR [r12+0x18],r8d
  403141:	39 fe                	cmp    esi,edi
  403143:	0f 83 87 f6 ff ff    	jae    4027d0 <format_string_loop.constprop.0+0x170>
  403149:	41 89 c8             	mov    r8d,ecx
  40314c:	0f be f9             	movsx  edi,cl
  40314f:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
  403153:	48 85 c9             	test   rcx,rcx
  403156:	0f 85 a0 fa ff ff    	jne    402bfc <format_string_loop.constprop.0+0x59c>
  40315c:	49 8b 4c 24 10       	mov    rcx,QWORD PTR [r12+0x10]
  403161:	44 88 04 31          	mov    BYTE PTR [rcx+rsi*1],r8b
  403165:	e9 a1 fa ff ff       	jmp    402c0b <format_string_loop.constprop.0+0x5ab>
  40316a:	49 8b 44 24 10       	mov    rax,QWORD PTR [r12+0x10]
  40316f:	c6 04 30 20          	mov    BYTE PTR [rax+rsi*1],0x20
  403173:	41 8b 74 24 18       	mov    esi,DWORD PTR [r12+0x18]
  403178:	41 8b 7c 24 1c       	mov    edi,DWORD PTR [r12+0x1c]
  40317d:	e9 71 ff ff ff       	jmp    4030f3 <format_string_loop.constprop.0+0xa93>
  403182:	49 8b 4c 24 10       	mov    rcx,QWORD PTR [r12+0x10]
  403187:	c6 04 11 25          	mov    BYTE PTR [rcx+rdx*1],0x25
  40318b:	e9 40 f6 ff ff       	jmp    4027d0 <format_string_loop.constprop.0+0x170>
  403190:	49 8b 4c 24 10       	mov    rcx,QWORD PTR [r12+0x10]
  403195:	40 88 34 11          	mov    BYTE PTR [rcx+rdx*1],sil
  403199:	e9 32 f6 ff ff       	jmp    4027d0 <format_string_loop.constprop.0+0x170>
  40319e:	44 8d 5f 01          	lea    r11d,[rdi+0x1]
  4031a2:	39 fa                	cmp    edx,edi
  4031a4:	0f 86 02 02 00 00    	jbe    4033ac <format_string_loop.constprop.0+0xd4c>
  4031aa:	8d 42 01             	lea    eax,[rdx+0x1]
  4031ad:	48 89 6c 24 08       	mov    QWORD PTR [rsp+0x8],rbp
  4031b2:	89 d5                	mov    ebp,edx
  4031b4:	48 89 5c 24 28       	mov    QWORD PTR [rsp+0x28],rbx
  4031b9:	44 89 db             	mov    ebx,r11d
  4031bc:	89 44 24 10          	mov    DWORD PTR [rsp+0x10],eax
  4031c0:	44 89 54 24 20       	mov    DWORD PTR [rsp+0x20],r10d
  4031c5:	eb 1f                	jmp    4031e6 <format_string_loop.constprop.0+0xb86>
  4031c7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  4031ce:	00 00 
  4031d0:	49 8b 74 24 08       	mov    rsi,QWORD PTR [r12+0x8]
  4031d5:	bf 20 00 00 00       	mov    edi,0x20
  4031da:	41 ff d0             	call   r8
  4031dd:	8d 4b 01             	lea    ecx,[rbx+0x1]
  4031e0:	39 dd                	cmp    ebp,ebx
  4031e2:	74 2f                	je     403213 <format_string_loop.constprop.0+0xbb3>
  4031e4:	89 cb                	mov    ebx,ecx
  4031e6:	41 8b 4c 24 18       	mov    ecx,DWORD PTR [r12+0x18]
  4031eb:	8d 71 01             	lea    esi,[rcx+0x1]
  4031ee:	41 89 74 24 18       	mov    DWORD PTR [r12+0x18],esi
  4031f3:	41 3b 4c 24 1c       	cmp    ecx,DWORD PTR [r12+0x1c]
  4031f8:	73 e3                	jae    4031dd <format_string_loop.constprop.0+0xb7d>
  4031fa:	4d 8b 04 24          	mov    r8,QWORD PTR [r12]
  4031fe:	4d 85 c0             	test   r8,r8
  403201:	75 cd                	jne    4031d0 <format_string_loop.constprop.0+0xb70>
  403203:	49 8b 74 24 10       	mov    rsi,QWORD PTR [r12+0x10]
  403208:	c6 04 0e 20          	mov    BYTE PTR [rsi+rcx*1],0x20
  40320c:	8d 4b 01             	lea    ecx,[rbx+0x1]
  40320f:	39 dd                	cmp    ebp,ebx
  403211:	75 d1                	jne    4031e4 <format_string_loop.constprop.0+0xb84>
  403213:	89 ea                	mov    edx,ebp
  403215:	48 8b 6c 24 08       	mov    rbp,QWORD PTR [rsp+0x8]
  40321a:	44 8b 54 24 20       	mov    r10d,DWORD PTR [rsp+0x20]
  40321f:	48 8b 5c 24 28       	mov    rbx,QWORD PTR [rsp+0x28]
  403224:	44 0f b6 4d 00       	movzx  r9d,BYTE PTR [rbp+0x0]
  403229:	44 89 ce             	mov    esi,r9d
  40322c:	45 84 c9             	test   r9b,r9b
  40322f:	0f 84 9b f5 ff ff    	je     4027d0 <format_string_loop.constprop.0+0x170>
  403235:	45 85 f6             	test   r14d,r14d
  403238:	0f 94 44 24 08       	sete   BYTE PTR [rsp+0x8]
  40323d:	0f b6 44 24 08       	movzx  eax,BYTE PTR [rsp+0x8]
  403242:	45 85 d2             	test   r10d,r10d
  403245:	0f 85 57 f8 ff ff    	jne    402aa2 <format_string_loop.constprop.0+0x442>
  40324b:	84 c0                	test   al,al
  40324d:	0f 85 4f f8 ff ff    	jne    402aa2 <format_string_loop.constprop.0+0x442>
  403253:	e9 78 f5 ff ff       	jmp    4027d0 <format_string_loop.constprop.0+0x170>
  403258:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40325f:	00 
  403260:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  403264:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  403268:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  40326c:	e9 8d fd ff ff       	jmp    402ffe <format_string_loop.constprop.0+0x99e>
  403271:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  403275:	48 8d 4f 08          	lea    rcx,[rdi+0x8]
  403279:	49 89 4f 08          	mov    QWORD PTR [r15+0x8],rcx
  40327d:	e9 42 fd ff ff       	jmp    402fc4 <format_string_loop.constprop.0+0x964>
  403282:	41 89 c8             	mov    r8d,ecx
  403285:	83 c1 08             	add    ecx,0x8
  403288:	4d 03 47 10          	add    r8,QWORD PTR [r15+0x10]
  40328c:	41 89 0f             	mov    DWORD PTR [r15],ecx
  40328f:	e9 a1 fe ff ff       	jmp    403135 <format_string_loop.constprop.0+0xad5>
  403294:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  403298:	48 8d 51 08          	lea    rdx,[rcx+0x8]
  40329c:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  4032a0:	e9 50 fb ff ff       	jmp    402df5 <format_string_loop.constprop.0+0x795>
  4032a5:	f6 c1 80             	test   cl,0x80
  4032a8:	0f 84 8d 00 00 00    	je     40333b <format_string_loop.constprop.0+0xcdb>
  4032ae:	83 fe 2f             	cmp    esi,0x2f
  4032b1:	0f 87 e4 00 00 00    	ja     40339b <format_string_loop.constprop.0+0xd3b>
  4032b7:	89 f7                	mov    edi,esi
  4032b9:	83 c6 08             	add    esi,0x8
  4032bc:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  4032c0:	41 89 37             	mov    DWORD PTR [r15],esi
  4032c3:	0f bf 3f             	movsx  edi,WORD PTR [rdi]
  4032c6:	e9 0a f6 ff ff       	jmp    4028d5 <format_string_loop.constprop.0+0x275>
  4032cb:	81 e1 80 00 00 00    	and    ecx,0x80
  4032d1:	74 3f                	je     403312 <format_string_loop.constprop.0+0xcb2>
  4032d3:	83 fe 2f             	cmp    esi,0x2f
  4032d6:	0f 87 ae 00 00 00    	ja     40338a <format_string_loop.constprop.0+0xd2a>
  4032dc:	89 f1                	mov    ecx,esi
  4032de:	83 c6 08             	add    esi,0x8
  4032e1:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  4032e5:	41 89 37             	mov    DWORD PTR [r15],esi
  4032e8:	0f b7 31             	movzx  esi,WORD PTR [rcx]
  4032eb:	e9 49 fb ff ff       	jmp    402e39 <format_string_loop.constprop.0+0x7d9>
  4032f0:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  4032f4:	48 8d 51 08          	lea    rdx,[rcx+0x8]
  4032f8:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  4032fc:	e9 8e fd ff ff       	jmp    40308f <format_string_loop.constprop.0+0xa2f>
  403301:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  403305:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  403309:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  40330d:	e9 c0 f5 ff ff       	jmp    4028d2 <format_string_loop.constprop.0+0x272>
  403312:	83 fe 2f             	cmp    esi,0x2f
  403315:	76 60                	jbe    403377 <format_string_loop.constprop.0+0xd17>
  403317:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  40331b:	48 8d 71 08          	lea    rsi,[rcx+0x8]
  40331f:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  403323:	8b 31                	mov    esi,DWORD PTR [rcx]
  403325:	e9 0f fb ff ff       	jmp    402e39 <format_string_loop.constprop.0+0x7d9>
  40332a:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  40332e:	48 8d 71 08          	lea    rsi,[rcx+0x8]
  403332:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  403336:	e9 fb fa ff ff       	jmp    402e36 <format_string_loop.constprop.0+0x7d6>
  40333b:	83 fe 2f             	cmp    esi,0x2f
  40333e:	76 24                	jbe    403364 <format_string_loop.constprop.0+0xd04>
  403340:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  403344:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  403348:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  40334c:	8b 3f                	mov    edi,DWORD PTR [rdi]
  40334e:	e9 82 f5 ff ff       	jmp    4028d5 <format_string_loop.constprop.0+0x275>
  403353:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  403357:	48 8d 51 08          	lea    rdx,[rcx+0x8]
  40335b:	49 89 57 08          	mov    QWORD PTR [r15+0x8],rdx
  40335f:	e9 41 fc ff ff       	jmp    402fa5 <format_string_loop.constprop.0+0x945>
  403364:	89 f7                	mov    edi,esi
  403366:	83 c6 08             	add    esi,0x8
  403369:	49 03 7f 10          	add    rdi,QWORD PTR [r15+0x10]
  40336d:	41 89 37             	mov    DWORD PTR [r15],esi
  403370:	8b 3f                	mov    edi,DWORD PTR [rdi]
  403372:	e9 5e f5 ff ff       	jmp    4028d5 <format_string_loop.constprop.0+0x275>
  403377:	89 f1                	mov    ecx,esi
  403379:	83 c6 08             	add    esi,0x8
  40337c:	49 03 4f 10          	add    rcx,QWORD PTR [r15+0x10]
  403380:	41 89 37             	mov    DWORD PTR [r15],esi
  403383:	8b 31                	mov    esi,DWORD PTR [rcx]
  403385:	e9 af fa ff ff       	jmp    402e39 <format_string_loop.constprop.0+0x7d9>
  40338a:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
  40338e:	48 8d 71 08          	lea    rsi,[rcx+0x8]
  403392:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  403396:	e9 4d ff ff ff       	jmp    4032e8 <format_string_loop.constprop.0+0xc88>
  40339b:	49 8b 7f 08          	mov    rdi,QWORD PTR [r15+0x8]
  40339f:	48 8d 77 08          	lea    rsi,[rdi+0x8]
  4033a3:	49 89 77 08          	mov    QWORD PTR [r15+0x8],rsi
  4033a7:	e9 17 ff ff ff       	jmp    4032c3 <format_string_loop.constprop.0+0xc63>
  4033ac:	44 89 5c 24 10       	mov    DWORD PTR [rsp+0x10],r11d
  4033b1:	e9 73 fe ff ff       	jmp    403229 <format_string_loop.constprop.0+0xbc9>
  4033b6:	c7 44 24 10 00 00 00 	mov    DWORD PTR [rsp+0x10],0x0
  4033bd:	00 
  4033be:	e9 95 f6 ff ff       	jmp    402a58 <format_string_loop.constprop.0+0x3f8>
  4033c3:	c7 44 24 08 02 00 00 	mov    DWORD PTR [rsp+0x8],0x2
  4033ca:	00 
  4033cb:	e9 4d fd ff ff       	jmp    40311d <format_string_loop.constprop.0+0xabd>

00000000004033d0 <vprintf>:
  4033d0:	f3 0f 1e fa          	endbr64 
  4033d4:	48 83 ec 38          	sub    rsp,0x38
  4033d8:	49 89 f8             	mov    r8,rdi
  4033db:	48 89 f2             	mov    rdx,rsi
  4033de:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  4033e5:	00 00 
  4033e7:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
  4033ec:	48 8d 05 9d e0 ff ff 	lea    rax,[rip+0xffffffffffffe09d]        # 401490 <putchar_wrapper>
  4033f3:	48 89 e7             	mov    rdi,rsp
  4033f6:	4c 89 c6             	mov    rsi,r8
  4033f9:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
  403400:	00 00 
  403402:	48 c7 44 24 10 00 00 	mov    QWORD PTR [rsp+0x10],0x0
  403409:	00 00 
  40340b:	48 89 04 24          	mov    QWORD PTR [rsp],rax
  40340f:	48 b8 00 00 00 00 ff 	movabs rax,0x7fffffff00000000
  403416:	ff ff 7f 
  403419:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  40341e:	e8 3d f2 ff ff       	call   402660 <format_string_loop.constprop.0>
  403423:	48 83 3c 24 00       	cmp    QWORD PTR [rsp],0x0
  403428:	74 1e                	je     403448 <vprintf+0x78>
  40342a:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  40342e:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  403433:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  40343a:	00 00 
  40343c:	75 2f                	jne    40346d <vprintf+0x9d>
  40343e:	48 83 c4 38          	add    rsp,0x38
  403442:	c3                   	ret    
  403443:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  403448:	8b 4c 24 1c          	mov    ecx,DWORD PTR [rsp+0x1c]
  40344c:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  403450:	85 c9                	test   ecx,ecx
  403452:	74 da                	je     40342e <vprintf+0x5e>
  403454:	48 8b 74 24 10       	mov    rsi,QWORD PTR [rsp+0x10]
  403459:	48 85 f6             	test   rsi,rsi
  40345c:	74 d0                	je     40342e <vprintf+0x5e>
  40345e:	8d 51 ff             	lea    edx,[rcx-0x1]
  403461:	39 c1                	cmp    ecx,eax
  403463:	48 0f 47 d0          	cmova  rdx,rax
  403467:	c6 04 16 00          	mov    BYTE PTR [rsi+rdx*1],0x0
  40346b:	eb c1                	jmp    40342e <vprintf+0x5e>
  40346d:	e8 99 db ff ff       	call   40100b <__stack_chk_fail>
  403472:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  403479:	00 00 00 
  40347c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000403480 <vsnprintf>:
  403480:	f3 0f 1e fa          	endbr64 
  403484:	48 83 ec 38          	sub    rsp,0x38
  403488:	49 89 d0             	mov    r8,rdx
  40348b:	48 89 ca             	mov    rdx,rcx
  40348e:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  403495:	00 00 
  403497:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
  40349c:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
  4034a1:	48 89 7c 24 10       	mov    QWORD PTR [rsp+0x10],rdi
  4034a6:	48 c7 04 24 00 00 00 	mov    QWORD PTR [rsp],0x0
  4034ad:	00 
  4034ae:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
  4034b5:	00 00 
  4034b7:	c7 44 24 18 00 00 00 	mov    DWORD PTR [rsp+0x18],0x0
  4034be:	00 
  4034bf:	48 39 c6             	cmp    rsi,rax
  4034c2:	48 0f 47 f0          	cmova  rsi,rax
  4034c6:	31 c0                	xor    eax,eax
  4034c8:	48 85 ff             	test   rdi,rdi
  4034cb:	48 89 e7             	mov    rdi,rsp
  4034ce:	48 0f 44 f0          	cmove  rsi,rax
  4034d2:	89 74 24 1c          	mov    DWORD PTR [rsp+0x1c],esi
  4034d6:	4c 89 c6             	mov    rsi,r8
  4034d9:	e8 82 f1 ff ff       	call   402660 <format_string_loop.constprop.0>
  4034de:	48 83 3c 24 00       	cmp    QWORD PTR [rsp],0x0
  4034e3:	74 1b                	je     403500 <vsnprintf+0x80>
  4034e5:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  4034e9:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  4034ee:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  4034f5:	00 00 
  4034f7:	75 2c                	jne    403525 <vsnprintf+0xa5>
  4034f9:	48 83 c4 38          	add    rsp,0x38
  4034fd:	c3                   	ret    
  4034fe:	66 90                	xchg   ax,ax
  403500:	8b 4c 24 1c          	mov    ecx,DWORD PTR [rsp+0x1c]
  403504:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  403508:	85 c9                	test   ecx,ecx
  40350a:	74 dd                	je     4034e9 <vsnprintf+0x69>
  40350c:	48 8b 74 24 10       	mov    rsi,QWORD PTR [rsp+0x10]
  403511:	48 85 f6             	test   rsi,rsi
  403514:	74 d3                	je     4034e9 <vsnprintf+0x69>
  403516:	8d 51 ff             	lea    edx,[rcx-0x1]
  403519:	39 c1                	cmp    ecx,eax
  40351b:	48 0f 47 d0          	cmova  rdx,rax
  40351f:	c6 04 16 00          	mov    BYTE PTR [rsi+rdx*1],0x0
  403523:	eb c4                	jmp    4034e9 <vsnprintf+0x69>
  403525:	e8 e1 da ff ff       	call   40100b <__stack_chk_fail>
  40352a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000403530 <vsprintf>:
  403530:	f3 0f 1e fa          	endbr64 
  403534:	48 89 d1             	mov    rcx,rdx
  403537:	48 89 f2             	mov    rdx,rsi
  40353a:	be ff ff ff 7f       	mov    esi,0x7fffffff
  40353f:	e9 3c ff ff ff       	jmp    403480 <vsnprintf>
  403544:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  40354b:	00 00 00 
  40354e:	66 90                	xchg   ax,ax

0000000000403550 <vfctprintf>:
  403550:	f3 0f 1e fa          	endbr64 
  403554:	48 83 ec 38          	sub    rsp,0x38
  403558:	49 89 f0             	mov    r8,rsi
  40355b:	48 89 d6             	mov    rsi,rdx
  40355e:	48 89 ca             	mov    rdx,rcx
  403561:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  403568:	00 00 
  40356a:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
  40356f:	31 c0                	xor    eax,eax
  403571:	48 89 3c 24          	mov    QWORD PTR [rsp],rdi
  403575:	48 89 e7             	mov    rdi,rsp
  403578:	48 b8 00 00 00 00 ff 	movabs rax,0x7fffffff00000000
  40357f:	ff ff 7f 
  403582:	4c 89 44 24 08       	mov    QWORD PTR [rsp+0x8],r8
  403587:	48 c7 44 24 10 00 00 	mov    QWORD PTR [rsp+0x10],0x0
  40358e:	00 00 
  403590:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  403595:	e8 c6 f0 ff ff       	call   402660 <format_string_loop.constprop.0>
  40359a:	48 83 3c 24 00       	cmp    QWORD PTR [rsp],0x0
  40359f:	74 1f                	je     4035c0 <vfctprintf+0x70>
  4035a1:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  4035a5:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
  4035aa:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  4035b1:	00 00 
  4035b3:	75 30                	jne    4035e5 <vfctprintf+0x95>
  4035b5:	48 83 c4 38          	add    rsp,0x38
  4035b9:	c3                   	ret    
  4035ba:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
  4035c0:	8b 4c 24 1c          	mov    ecx,DWORD PTR [rsp+0x1c]
  4035c4:	8b 44 24 18          	mov    eax,DWORD PTR [rsp+0x18]
  4035c8:	85 c9                	test   ecx,ecx
  4035ca:	74 d9                	je     4035a5 <vfctprintf+0x55>
  4035cc:	48 8b 74 24 10       	mov    rsi,QWORD PTR [rsp+0x10]
  4035d1:	48 85 f6             	test   rsi,rsi
  4035d4:	74 cf                	je     4035a5 <vfctprintf+0x55>
  4035d6:	8d 51 ff             	lea    edx,[rcx-0x1]
  4035d9:	39 c1                	cmp    ecx,eax
  4035db:	48 0f 47 d0          	cmova  rdx,rax
  4035df:	c6 04 16 00          	mov    BYTE PTR [rsi+rdx*1],0x0
  4035e3:	eb c0                	jmp    4035a5 <vfctprintf+0x55>
  4035e5:	e8 21 da ff ff       	call   40100b <__stack_chk_fail>
  4035ea:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000004035f0 <printf>:
  4035f0:	f3 0f 1e fa          	endbr64 
  4035f4:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  4035fb:	48 89 74 24 28       	mov    QWORD PTR [rsp+0x28],rsi
  403600:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
  403605:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  40360a:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  40360f:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  403614:	84 c0                	test   al,al
  403616:	74 37                	je     40364f <printf+0x5f>
  403618:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  40361d:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  403622:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  403627:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  40362e:	00 
  40362f:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  403636:	00 
  403637:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  40363e:	00 
  40363f:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  403646:	00 
  403647:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  40364e:	00 
  40364f:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  403656:	00 00 
  403658:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  40365d:	31 c0                	xor    eax,eax
  40365f:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  403666:	00 
  403667:	48 89 e6             	mov    rsi,rsp
  40366a:	c7 04 24 08 00 00 00 	mov    DWORD PTR [rsp],0x8
  403671:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
  403676:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  40367b:	c7 44 24 04 30 00 00 	mov    DWORD PTR [rsp+0x4],0x30
  403682:	00 
  403683:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403688:	e8 43 fd ff ff       	call   4033d0 <vprintf>
  40368d:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
  403692:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  403699:	00 00 
  40369b:	75 08                	jne    4036a5 <printf+0xb5>
  40369d:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  4036a4:	c3                   	ret    
  4036a5:	e8 61 d9 ff ff       	call   40100b <__stack_chk_fail>
  4036aa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000004036b0 <sprintf>:
  4036b0:	f3 0f 1e fa          	endbr64 
  4036b4:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  4036bb:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
  4036c0:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  4036c5:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  4036ca:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  4036cf:	84 c0                	test   al,al
  4036d1:	74 37                	je     40370a <sprintf+0x5a>
  4036d3:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  4036d8:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  4036dd:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  4036e2:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  4036e9:	00 
  4036ea:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  4036f1:	00 
  4036f2:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  4036f9:	00 
  4036fa:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  403701:	00 
  403702:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  403709:	00 
  40370a:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  403711:	00 00 
  403713:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  403718:	31 c0                	xor    eax,eax
  40371a:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  403721:	00 
  403722:	48 89 e2             	mov    rdx,rsp
  403725:	c7 04 24 10 00 00 00 	mov    DWORD PTR [rsp],0x10
  40372c:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
  403731:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  403736:	c7 44 24 04 30 00 00 	mov    DWORD PTR [rsp+0x4],0x30
  40373d:	00 
  40373e:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  403743:	e8 e8 fd ff ff       	call   403530 <vsprintf>
  403748:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
  40374d:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  403754:	00 00 
  403756:	75 08                	jne    403760 <sprintf+0xb0>
  403758:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  40375f:	c3                   	ret    
  403760:	e8 a6 d8 ff ff       	call   40100b <__stack_chk_fail>
  403765:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  40376c:	00 00 00 
  40376f:	90                   	nop

0000000000403770 <snprintf>:
  403770:	f3 0f 1e fa          	endbr64 
  403774:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  40377b:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  403780:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  403785:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  40378a:	84 c0                	test   al,al
  40378c:	74 37                	je     4037c5 <snprintf+0x55>
  40378e:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  403793:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  403798:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  40379d:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  4037a4:	00 
  4037a5:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  4037ac:	00 
  4037ad:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  4037b4:	00 
  4037b5:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  4037bc:	00 
  4037bd:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  4037c4:	00 
  4037c5:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  4037cc:	00 00 
  4037ce:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  4037d3:	31 c0                	xor    eax,eax
  4037d5:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  4037dc:	00 
  4037dd:	48 89 e1             	mov    rcx,rsp
  4037e0:	c7 04 24 18 00 00 00 	mov    DWORD PTR [rsp],0x18
  4037e7:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
  4037ec:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  4037f1:	c7 44 24 04 30 00 00 	mov    DWORD PTR [rsp+0x4],0x30
  4037f8:	00 
  4037f9:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  4037fe:	e8 7d fc ff ff       	call   403480 <vsnprintf>
  403803:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
  403808:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  40380f:	00 00 
  403811:	75 08                	jne    40381b <snprintf+0xab>
  403813:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  40381a:	c3                   	ret    
  40381b:	e8 eb d7 ff ff       	call   40100b <__stack_chk_fail>

0000000000403820 <fctprintf>:
  403820:	f3 0f 1e fa          	endbr64 
  403824:	48 81 ec d8 00 00 00 	sub    rsp,0xd8
  40382b:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
  403830:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
  403835:	4c 89 4c 24 48       	mov    QWORD PTR [rsp+0x48],r9
  40383a:	84 c0                	test   al,al
  40383c:	74 37                	je     403875 <fctprintf+0x55>
  40383e:	0f 29 44 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm0
  403843:	0f 29 4c 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm1
  403848:	0f 29 54 24 70       	movaps XMMWORD PTR [rsp+0x70],xmm2
  40384d:	0f 29 9c 24 80 00 00 	movaps XMMWORD PTR [rsp+0x80],xmm3
  403854:	00 
  403855:	0f 29 a4 24 90 00 00 	movaps XMMWORD PTR [rsp+0x90],xmm4
  40385c:	00 
  40385d:	0f 29 ac 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm5
  403864:	00 
  403865:	0f 29 b4 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm6
  40386c:	00 
  40386d:	0f 29 bc 24 c0 00 00 	movaps XMMWORD PTR [rsp+0xc0],xmm7
  403874:	00 
  403875:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  40387c:	00 00 
  40387e:	48 89 44 24 18       	mov    QWORD PTR [rsp+0x18],rax
  403883:	31 c0                	xor    eax,eax
  403885:	48 8d 84 24 e0 00 00 	lea    rax,[rsp+0xe0]
  40388c:	00 
  40388d:	48 89 e1             	mov    rcx,rsp
  403890:	c7 04 24 18 00 00 00 	mov    DWORD PTR [rsp],0x18
  403897:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
  40389c:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
  4038a1:	c7 44 24 04 30 00 00 	mov    DWORD PTR [rsp+0x4],0x30
  4038a8:	00 
  4038a9:	48 89 44 24 10       	mov    QWORD PTR [rsp+0x10],rax
  4038ae:	e8 9d fc ff ff       	call   403550 <vfctprintf>
  4038b3:	48 8b 54 24 18       	mov    rdx,QWORD PTR [rsp+0x18]
  4038b8:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  4038bf:	00 00 
  4038c1:	75 08                	jne    4038cb <fctprintf+0xab>
  4038c3:	48 81 c4 d8 00 00 00 	add    rsp,0xd8
  4038ca:	c3                   	ret    
  4038cb:	e8 3b d7 ff ff       	call   40100b <__stack_chk_fail>

00000000004038d0 <putchar>:
  4038d0:	f3 0f 1e fa          	endbr64 
  4038d4:	41 54                	push   r12
  4038d6:	41 89 fc             	mov    r12d,edi
  4038d9:	40 0f be ff          	movsx  edi,dil
  4038dd:	e8 0e 00 00 00       	call   4038f0 <putchar_>
  4038e2:	44 89 e0             	mov    eax,r12d
  4038e5:	41 5c                	pop    r12
  4038e7:	c3                   	ret    
  4038e8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  4038ef:	00 

00000000004038f0 <putchar_>:
  4038f0:	f3 0f 1e fa          	endbr64 
  4038f4:	48 83 ec 18          	sub    rsp,0x18
  4038f8:	ba 01 00 00 00       	mov    edx,0x1
  4038fd:	31 c0                	xor    eax,eax
  4038ff:	40 88 7c 24 0c       	mov    BYTE PTR [rsp+0xc],dil
  403904:	48 8d 74 24 0c       	lea    rsi,[rsp+0xc]
  403909:	bf 01 00 00 00       	mov    edi,0x1
  40390e:	e8 a5 09 00 00       	call   4042b8 <write>
  403913:	48 83 c4 18          	add    rsp,0x18
  403917:	c3                   	ret    

0000000000403918 <reg_dev>:
  403918:	f3 0f 1e fa          	endbr64 
  40391c:	55                   	push   rbp
  40391d:	48 89 e5             	mov    rbp,rsp
  403920:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  403924:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  403928:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  40392c:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  403930:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  403934:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  403938:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  40393c:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  403943:	00 00 
  403945:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  403949:	31 c0                	xor    eax,eax
  40394b:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  403952:	00 
  403953:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  403957:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  40395b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  40395f:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  403963:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  403967:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  40396b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  40396f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  403973:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  403977:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  40397b:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  40397f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  403983:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  403987:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  40398b:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  40398f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  403993:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  403997:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  40399b:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  40399f:	48 0f 05             	rex.W syscall 
  4039a2:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  4039a9:	00 
  4039aa:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  4039ae:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  4039b2:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  4039b6:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  4039bd:	00 00 
  4039bf:	74 05                	je     4039c6 <reg_dev+0xae>
  4039c1:	e8 45 d6 ff ff       	call   40100b <__stack_chk_fail>
  4039c6:	c9                   	leave  
  4039c7:	c3                   	ret    

00000000004039c8 <dispose_dev>:
  4039c8:	f3 0f 1e fa          	endbr64 
  4039cc:	55                   	push   rbp
  4039cd:	48 89 e5             	mov    rbp,rsp
  4039d0:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  4039d4:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  4039d8:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  4039dc:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  4039e0:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  4039e4:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  4039e8:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  4039ec:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  4039f3:	00 00 
  4039f5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  4039f9:	31 c0                	xor    eax,eax
  4039fb:	48 c7 45 c0 01 00 00 	mov    QWORD PTR [rbp-0x40],0x1
  403a02:	00 
  403a03:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  403a07:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  403a0b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  403a0f:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  403a13:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  403a17:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  403a1b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  403a1f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  403a23:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  403a27:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  403a2b:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  403a2f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  403a33:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  403a37:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  403a3b:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  403a3f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  403a43:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  403a47:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  403a4b:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  403a4f:	48 0f 05             	rex.W syscall 
  403a52:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  403a59:	00 
  403a5a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  403a5e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  403a62:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  403a66:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  403a6d:	00 00 
  403a6f:	74 05                	je     403a76 <dispose_dev+0xae>
  403a71:	e8 95 d5 ff ff       	call   40100b <__stack_chk_fail>
  403a76:	c9                   	leave  
  403a77:	c3                   	ret    

0000000000403a78 <reg_drv>:
  403a78:	f3 0f 1e fa          	endbr64 
  403a7c:	55                   	push   rbp
  403a7d:	48 89 e5             	mov    rbp,rsp
  403a80:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  403a84:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  403a88:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  403a8c:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  403a90:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  403a94:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  403a98:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  403a9c:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  403aa3:	00 00 
  403aa5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  403aa9:	31 c0                	xor    eax,eax
  403aab:	48 c7 45 c0 02 00 00 	mov    QWORD PTR [rbp-0x40],0x2
  403ab2:	00 
  403ab3:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  403ab7:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  403abb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  403abf:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  403ac3:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  403ac7:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  403acb:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  403acf:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  403ad3:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  403ad7:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  403adb:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  403adf:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  403ae3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  403ae7:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  403aeb:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  403aef:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  403af3:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  403af7:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  403afb:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  403aff:	48 0f 05             	rex.W syscall 
  403b02:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  403b09:	00 
  403b0a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  403b0e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  403b12:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  403b16:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  403b1d:	00 00 
  403b1f:	74 05                	je     403b26 <reg_drv+0xae>
  403b21:	e8 e5 d4 ff ff       	call   40100b <__stack_chk_fail>
  403b26:	c9                   	leave  
  403b27:	c3                   	ret    

0000000000403b28 <dispose_drv>:
  403b28:	f3 0f 1e fa          	endbr64 
  403b2c:	55                   	push   rbp
  403b2d:	48 89 e5             	mov    rbp,rsp
  403b30:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  403b34:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  403b38:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  403b3c:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  403b40:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  403b44:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  403b48:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  403b4c:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  403b53:	00 00 
  403b55:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  403b59:	31 c0                	xor    eax,eax
  403b5b:	48 c7 45 c0 03 00 00 	mov    QWORD PTR [rbp-0x40],0x3
  403b62:	00 
  403b63:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  403b67:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  403b6b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  403b6f:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  403b73:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  403b77:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  403b7b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  403b7f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  403b83:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  403b87:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  403b8b:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  403b8f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  403b93:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  403b97:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  403b9b:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  403b9f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  403ba3:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  403ba7:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  403bab:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  403baf:	48 0f 05             	rex.W syscall 
  403bb2:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  403bb9:	00 
  403bba:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  403bbe:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  403bc2:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  403bc6:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  403bcd:	00 00 
  403bcf:	74 05                	je     403bd6 <dispose_drv+0xae>
  403bd1:	e8 35 d4 ff ff       	call   40100b <__stack_chk_fail>
  403bd6:	c9                   	leave  
  403bd7:	c3                   	ret    

0000000000403bd8 <call_drvfunc>:
  403bd8:	f3 0f 1e fa          	endbr64 
  403bdc:	55                   	push   rbp
  403bdd:	48 89 e5             	mov    rbp,rsp
  403be0:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  403be4:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  403be8:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  403bec:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  403bf0:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  403bf4:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  403bf8:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  403bfc:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  403c03:	00 00 
  403c05:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  403c09:	31 c0                	xor    eax,eax
  403c0b:	48 c7 45 c0 04 00 00 	mov    QWORD PTR [rbp-0x40],0x4
  403c12:	00 
  403c13:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  403c17:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  403c1b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  403c1f:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  403c23:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  403c27:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  403c2b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  403c2f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  403c33:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  403c37:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  403c3b:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  403c3f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  403c43:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  403c47:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  403c4b:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  403c4f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  403c53:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  403c57:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  403c5b:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  403c5f:	48 0f 05             	rex.W syscall 
  403c62:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  403c69:	00 
  403c6a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  403c6e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  403c72:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  403c76:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  403c7d:	00 00 
  403c7f:	74 05                	je     403c86 <call_drvfunc+0xae>
  403c81:	e8 85 d3 ff ff       	call   40100b <__stack_chk_fail>
  403c86:	c9                   	leave  
  403c87:	c3                   	ret    

0000000000403c88 <req_mem>:
  403c88:	f3 0f 1e fa          	endbr64 
  403c8c:	55                   	push   rbp
  403c8d:	48 89 e5             	mov    rbp,rsp
  403c90:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  403c94:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  403c98:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  403c9c:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  403ca0:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  403ca4:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  403ca8:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  403cac:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  403cb3:	00 00 
  403cb5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  403cb9:	31 c0                	xor    eax,eax
  403cbb:	48 c7 45 c0 05 00 00 	mov    QWORD PTR [rbp-0x40],0x5
  403cc2:	00 
  403cc3:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  403cc7:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  403ccb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  403ccf:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  403cd3:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  403cd7:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  403cdb:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  403cdf:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  403ce3:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  403ce7:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  403ceb:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  403cef:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  403cf3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  403cf7:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  403cfb:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  403cff:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  403d03:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  403d07:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  403d0b:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  403d0f:	48 0f 05             	rex.W syscall 
  403d12:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  403d19:	00 
  403d1a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  403d1e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  403d22:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  403d26:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  403d2d:	00 00 
  403d2f:	74 05                	je     403d36 <req_mem+0xae>
  403d31:	e8 d5 d2 ff ff       	call   40100b <__stack_chk_fail>
  403d36:	c9                   	leave  
  403d37:	c3                   	ret    

0000000000403d38 <free_mem>:
  403d38:	f3 0f 1e fa          	endbr64 
  403d3c:	55                   	push   rbp
  403d3d:	48 89 e5             	mov    rbp,rsp
  403d40:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  403d44:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  403d48:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  403d4c:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  403d50:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  403d54:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  403d58:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  403d5c:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  403d63:	00 00 
  403d65:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  403d69:	31 c0                	xor    eax,eax
  403d6b:	48 c7 45 c0 06 00 00 	mov    QWORD PTR [rbp-0x40],0x6
  403d72:	00 
  403d73:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  403d77:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  403d7b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  403d7f:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  403d83:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  403d87:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  403d8b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  403d8f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  403d93:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  403d97:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  403d9b:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  403d9f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  403da3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  403da7:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  403dab:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  403daf:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  403db3:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  403db7:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  403dbb:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  403dbf:	48 0f 05             	rex.W syscall 
  403dc2:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  403dc9:	00 
  403dca:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  403dce:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  403dd2:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  403dd6:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  403ddd:	00 00 
  403ddf:	74 05                	je     403de6 <free_mem+0xae>
  403de1:	e8 25 d2 ff ff       	call   40100b <__stack_chk_fail>
  403de6:	c9                   	leave  
  403de7:	c3                   	ret    

0000000000403de8 <reg_proc>:
  403de8:	f3 0f 1e fa          	endbr64 
  403dec:	55                   	push   rbp
  403ded:	48 89 e5             	mov    rbp,rsp
  403df0:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  403df4:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  403df8:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  403dfc:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  403e00:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  403e04:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  403e08:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  403e0c:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  403e13:	00 00 
  403e15:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  403e19:	31 c0                	xor    eax,eax
  403e1b:	48 c7 45 c0 07 00 00 	mov    QWORD PTR [rbp-0x40],0x7
  403e22:	00 
  403e23:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  403e27:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  403e2b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  403e2f:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  403e33:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  403e37:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  403e3b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  403e3f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  403e43:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  403e47:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  403e4b:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  403e4f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  403e53:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  403e57:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  403e5b:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  403e5f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  403e63:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  403e67:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  403e6b:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  403e6f:	48 0f 05             	rex.W syscall 
  403e72:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  403e79:	00 
  403e7a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  403e7e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  403e82:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  403e86:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  403e8d:	00 00 
  403e8f:	74 05                	je     403e96 <reg_proc+0xae>
  403e91:	e8 75 d1 ff ff       	call   40100b <__stack_chk_fail>
  403e96:	c9                   	leave  
  403e97:	c3                   	ret    

0000000000403e98 <del_proc>:
  403e98:	f3 0f 1e fa          	endbr64 
  403e9c:	55                   	push   rbp
  403e9d:	48 89 e5             	mov    rbp,rsp
  403ea0:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  403ea4:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  403ea8:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  403eac:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  403eb0:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  403eb4:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  403eb8:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  403ebc:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  403ec3:	00 00 
  403ec5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  403ec9:	31 c0                	xor    eax,eax
  403ecb:	48 c7 45 c0 08 00 00 	mov    QWORD PTR [rbp-0x40],0x8
  403ed2:	00 
  403ed3:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  403ed7:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  403edb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  403edf:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  403ee3:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  403ee7:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  403eeb:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  403eef:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  403ef3:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  403ef7:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  403efb:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  403eff:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  403f03:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  403f07:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  403f0b:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  403f0f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  403f13:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  403f17:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  403f1b:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  403f1f:	48 0f 05             	rex.W syscall 
  403f22:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  403f29:	00 
  403f2a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  403f2e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  403f32:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  403f36:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  403f3d:	00 00 
  403f3f:	74 05                	je     403f46 <del_proc+0xae>
  403f41:	e8 c5 d0 ff ff       	call   40100b <__stack_chk_fail>
  403f46:	c9                   	leave  
  403f47:	c3                   	ret    

0000000000403f48 <get_proc_addr>:
  403f48:	f3 0f 1e fa          	endbr64 
  403f4c:	55                   	push   rbp
  403f4d:	48 89 e5             	mov    rbp,rsp
  403f50:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  403f54:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  403f58:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  403f5c:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  403f60:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  403f64:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  403f68:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  403f6c:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  403f73:	00 00 
  403f75:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  403f79:	31 c0                	xor    eax,eax
  403f7b:	48 c7 45 c0 09 00 00 	mov    QWORD PTR [rbp-0x40],0x9
  403f82:	00 
  403f83:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  403f87:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  403f8b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  403f8f:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  403f93:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  403f97:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  403f9b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  403f9f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  403fa3:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  403fa7:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  403fab:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  403faf:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  403fb3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  403fb7:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  403fbb:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  403fbf:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  403fc3:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  403fc7:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  403fcb:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  403fcf:	48 0f 05             	rex.W syscall 
  403fd2:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  403fd9:	00 
  403fda:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  403fde:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  403fe2:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  403fe6:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  403fed:	00 00 
  403fef:	74 05                	je     403ff6 <get_proc_addr+0xae>
  403ff1:	e8 15 d0 ff ff       	call   40100b <__stack_chk_fail>
  403ff6:	c9                   	leave  
  403ff7:	c3                   	ret    

0000000000403ff8 <chk_vm>:
  403ff8:	f3 0f 1e fa          	endbr64 
  403ffc:	55                   	push   rbp
  403ffd:	48 89 e5             	mov    rbp,rsp
  404000:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  404004:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  404008:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  40400c:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  404010:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  404014:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  404018:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  40401c:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  404023:	00 00 
  404025:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  404029:	31 c0                	xor    eax,eax
  40402b:	48 c7 45 c0 0a 00 00 	mov    QWORD PTR [rbp-0x40],0xa
  404032:	00 
  404033:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  404037:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  40403b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  40403f:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  404043:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  404047:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  40404b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  40404f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  404053:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  404057:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  40405b:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  40405f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  404063:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  404067:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  40406b:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  40406f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  404073:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  404077:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  40407b:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  40407f:	48 0f 05             	rex.W syscall 
  404082:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  404089:	00 
  40408a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  40408e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  404092:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  404096:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  40409d:	00 00 
  40409f:	74 05                	je     4040a6 <chk_vm+0xae>
  4040a1:	e8 65 cf ff ff       	call   40100b <__stack_chk_fail>
  4040a6:	c9                   	leave  
  4040a7:	c3                   	ret    

00000000004040a8 <open>:
  4040a8:	f3 0f 1e fa          	endbr64 
  4040ac:	55                   	push   rbp
  4040ad:	48 89 e5             	mov    rbp,rsp
  4040b0:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  4040b4:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  4040b8:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  4040bc:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  4040c0:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  4040c4:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  4040c8:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  4040cc:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  4040d3:	00 00 
  4040d5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  4040d9:	31 c0                	xor    eax,eax
  4040db:	48 c7 45 c0 0b 00 00 	mov    QWORD PTR [rbp-0x40],0xb
  4040e2:	00 
  4040e3:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  4040e7:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  4040eb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  4040ef:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  4040f3:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  4040f7:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  4040fb:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  4040ff:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  404103:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  404107:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  40410b:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  40410f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  404113:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  404117:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  40411b:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  40411f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  404123:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  404127:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  40412b:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  40412f:	48 0f 05             	rex.W syscall 
  404132:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  404139:	00 
  40413a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  40413e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  404142:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  404146:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  40414d:	00 00 
  40414f:	74 05                	je     404156 <open+0xae>
  404151:	e8 b5 ce ff ff       	call   40100b <__stack_chk_fail>
  404156:	c9                   	leave  
  404157:	c3                   	ret    

0000000000404158 <close>:
  404158:	f3 0f 1e fa          	endbr64 
  40415c:	55                   	push   rbp
  40415d:	48 89 e5             	mov    rbp,rsp
  404160:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  404164:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  404168:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  40416c:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  404170:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  404174:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  404178:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  40417c:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  404183:	00 00 
  404185:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  404189:	31 c0                	xor    eax,eax
  40418b:	48 c7 45 c0 0c 00 00 	mov    QWORD PTR [rbp-0x40],0xc
  404192:	00 
  404193:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  404197:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  40419b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  40419f:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  4041a3:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  4041a7:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  4041ab:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  4041af:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  4041b3:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  4041b7:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  4041bb:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  4041bf:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  4041c3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  4041c7:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  4041cb:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  4041cf:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  4041d3:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  4041d7:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  4041db:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  4041df:	48 0f 05             	rex.W syscall 
  4041e2:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  4041e9:	00 
  4041ea:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  4041ee:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  4041f2:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  4041f6:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  4041fd:	00 00 
  4041ff:	74 05                	je     404206 <close+0xae>
  404201:	e8 05 ce ff ff       	call   40100b <__stack_chk_fail>
  404206:	c9                   	leave  
  404207:	c3                   	ret    

0000000000404208 <read>:
  404208:	f3 0f 1e fa          	endbr64 
  40420c:	55                   	push   rbp
  40420d:	48 89 e5             	mov    rbp,rsp
  404210:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  404214:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  404218:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  40421c:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  404220:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  404224:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  404228:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  40422c:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  404233:	00 00 
  404235:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  404239:	31 c0                	xor    eax,eax
  40423b:	48 c7 45 c0 0d 00 00 	mov    QWORD PTR [rbp-0x40],0xd
  404242:	00 
  404243:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  404247:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  40424b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  40424f:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  404253:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  404257:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  40425b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  40425f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  404263:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  404267:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  40426b:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  40426f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  404273:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  404277:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  40427b:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  40427f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  404283:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  404287:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  40428b:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  40428f:	48 0f 05             	rex.W syscall 
  404292:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  404299:	00 
  40429a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  40429e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  4042a2:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  4042a6:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  4042ad:	00 00 
  4042af:	74 05                	je     4042b6 <read+0xae>
  4042b1:	e8 55 cd ff ff       	call   40100b <__stack_chk_fail>
  4042b6:	c9                   	leave  
  4042b7:	c3                   	ret    

00000000004042b8 <write>:
  4042b8:	f3 0f 1e fa          	endbr64 
  4042bc:	55                   	push   rbp
  4042bd:	48 89 e5             	mov    rbp,rsp
  4042c0:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  4042c4:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  4042c8:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  4042cc:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  4042d0:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  4042d4:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  4042d8:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  4042dc:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  4042e3:	00 00 
  4042e5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  4042e9:	31 c0                	xor    eax,eax
  4042eb:	48 c7 45 c0 0e 00 00 	mov    QWORD PTR [rbp-0x40],0xe
  4042f2:	00 
  4042f3:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  4042f7:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  4042fb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  4042ff:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  404303:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  404307:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  40430b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  40430f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  404313:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  404317:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  40431b:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  40431f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  404323:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  404327:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  40432b:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  40432f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  404333:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  404337:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  40433b:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  40433f:	48 0f 05             	rex.W syscall 
  404342:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  404349:	00 
  40434a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  40434e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  404352:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  404356:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  40435d:	00 00 
  40435f:	74 05                	je     404366 <write+0xae>
  404361:	e8 a5 cc ff ff       	call   40100b <__stack_chk_fail>
  404366:	c9                   	leave  
  404367:	c3                   	ret    

0000000000404368 <seek>:
  404368:	f3 0f 1e fa          	endbr64 
  40436c:	55                   	push   rbp
  40436d:	48 89 e5             	mov    rbp,rsp
  404370:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  404374:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  404378:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  40437c:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  404380:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  404384:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  404388:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  40438c:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  404393:	00 00 
  404395:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  404399:	31 c0                	xor    eax,eax
  40439b:	48 c7 45 c0 0f 00 00 	mov    QWORD PTR [rbp-0x40],0xf
  4043a2:	00 
  4043a3:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  4043a7:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  4043ab:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  4043af:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  4043b3:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  4043b7:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  4043bb:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  4043bf:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  4043c3:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  4043c7:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  4043cb:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  4043cf:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  4043d3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  4043d7:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  4043db:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  4043df:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  4043e3:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  4043e7:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  4043eb:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  4043ef:	48 0f 05             	rex.W syscall 
  4043f2:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  4043f9:	00 
  4043fa:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  4043fe:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  404402:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  404406:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  40440d:	00 00 
  40440f:	74 05                	je     404416 <seek+0xae>
  404411:	e8 f5 cb ff ff       	call   40100b <__stack_chk_fail>
  404416:	c9                   	leave  
  404417:	c3                   	ret    

0000000000404418 <tell>:
  404418:	f3 0f 1e fa          	endbr64 
  40441c:	55                   	push   rbp
  40441d:	48 89 e5             	mov    rbp,rsp
  404420:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  404424:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  404428:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  40442c:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  404430:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  404434:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  404438:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  40443c:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  404443:	00 00 
  404445:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  404449:	31 c0                	xor    eax,eax
  40444b:	48 c7 45 c0 10 00 00 	mov    QWORD PTR [rbp-0x40],0x10
  404452:	00 
  404453:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  404457:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  40445b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  40445f:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  404463:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  404467:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  40446b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  40446f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  404473:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  404477:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  40447b:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  40447f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  404483:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  404487:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  40448b:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  40448f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  404493:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  404497:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  40449b:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  40449f:	48 0f 05             	rex.W syscall 
  4044a2:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  4044a9:	00 
  4044aa:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  4044ae:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  4044b2:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  4044b6:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  4044bd:	00 00 
  4044bf:	74 05                	je     4044c6 <tell+0xae>
  4044c1:	e8 45 cb ff ff       	call   40100b <__stack_chk_fail>
  4044c6:	c9                   	leave  
  4044c7:	c3                   	ret    

00000000004044c8 <reg_vol>:
  4044c8:	f3 0f 1e fa          	endbr64 
  4044cc:	55                   	push   rbp
  4044cd:	48 89 e5             	mov    rbp,rsp
  4044d0:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  4044d4:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  4044d8:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  4044dc:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  4044e0:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  4044e4:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  4044e8:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  4044ec:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  4044f3:	00 00 
  4044f5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  4044f9:	31 c0                	xor    eax,eax
  4044fb:	48 c7 45 c0 11 00 00 	mov    QWORD PTR [rbp-0x40],0x11
  404502:	00 
  404503:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  404507:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  40450b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  40450f:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  404513:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  404517:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  40451b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  40451f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  404523:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  404527:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  40452b:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  40452f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  404533:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  404537:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  40453b:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  40453f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  404543:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  404547:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  40454b:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  40454f:	48 0f 05             	rex.W syscall 
  404552:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  404559:	00 
  40455a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  40455e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  404562:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  404566:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  40456d:	00 00 
  40456f:	74 05                	je     404576 <reg_vol+0xae>
  404571:	e8 95 ca ff ff       	call   40100b <__stack_chk_fail>
  404576:	c9                   	leave  
  404577:	c3                   	ret    

0000000000404578 <free_vol>:
  404578:	f3 0f 1e fa          	endbr64 
  40457c:	55                   	push   rbp
  40457d:	48 89 e5             	mov    rbp,rsp
  404580:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  404584:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  404588:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  40458c:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  404590:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  404594:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  404598:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  40459c:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  4045a3:	00 00 
  4045a5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  4045a9:	31 c0                	xor    eax,eax
  4045ab:	48 c7 45 c0 12 00 00 	mov    QWORD PTR [rbp-0x40],0x12
  4045b2:	00 
  4045b3:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  4045b7:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  4045bb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  4045bf:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  4045c3:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  4045c7:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  4045cb:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  4045cf:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  4045d3:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  4045d7:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  4045db:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  4045df:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  4045e3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  4045e7:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  4045eb:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  4045ef:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  4045f3:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  4045f7:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  4045fb:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  4045ff:	48 0f 05             	rex.W syscall 
  404602:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  404609:	00 
  40460a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  40460e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  404612:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  404616:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  40461d:	00 00 
  40461f:	74 05                	je     404626 <free_vol+0xae>
  404621:	e8 e5 c9 ff ff       	call   40100b <__stack_chk_fail>
  404626:	c9                   	leave  
  404627:	c3                   	ret    

0000000000404628 <exec>:
  404628:	f3 0f 1e fa          	endbr64 
  40462c:	55                   	push   rbp
  40462d:	48 89 e5             	mov    rbp,rsp
  404630:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  404634:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  404638:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  40463c:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  404640:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  404644:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  404648:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  40464c:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  404653:	00 00 
  404655:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  404659:	31 c0                	xor    eax,eax
  40465b:	48 c7 45 c0 13 00 00 	mov    QWORD PTR [rbp-0x40],0x13
  404662:	00 
  404663:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  404667:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  40466b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  40466f:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  404673:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  404677:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  40467b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  40467f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  404683:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  404687:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  40468b:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  40468f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  404693:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  404697:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  40469b:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  40469f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  4046a3:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  4046a7:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  4046ab:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  4046af:	48 0f 05             	rex.W syscall 
  4046b2:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  4046b9:	00 
  4046ba:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  4046be:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  4046c2:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  4046c6:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  4046cd:	00 00 
  4046cf:	74 05                	je     4046d6 <exec+0xae>
  4046d1:	e8 35 c9 ff ff       	call   40100b <__stack_chk_fail>
  4046d6:	c9                   	leave  
  4046d7:	c3                   	ret    

00000000004046d8 <exit>:
  4046d8:	f3 0f 1e fa          	endbr64 
  4046dc:	55                   	push   rbp
  4046dd:	48 89 e5             	mov    rbp,rsp
  4046e0:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  4046e4:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  4046e8:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  4046ec:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  4046f0:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  4046f4:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  4046f8:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  4046fc:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  404703:	00 00 
  404705:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  404709:	31 c0                	xor    eax,eax
  40470b:	48 c7 45 c0 14 00 00 	mov    QWORD PTR [rbp-0x40],0x14
  404712:	00 
  404713:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  404717:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  40471b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  40471f:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  404723:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  404727:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  40472b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  40472f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  404733:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  404737:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  40473b:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  40473f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  404743:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  404747:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  40474b:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  40474f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  404753:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  404757:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  40475b:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  40475f:	48 0f 05             	rex.W syscall 
  404762:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  404769:	00 
  40476a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  40476e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  404772:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  404776:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  40477d:	00 00 
  40477f:	74 05                	je     404786 <exit+0xae>
  404781:	e8 85 c8 ff ff       	call   40100b <__stack_chk_fail>
  404786:	c9                   	leave  
  404787:	c3                   	ret    

0000000000404788 <call>:
  404788:	f3 0f 1e fa          	endbr64 
  40478c:	55                   	push   rbp
  40478d:	48 89 e5             	mov    rbp,rsp
  404790:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  404794:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  404798:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  40479c:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  4047a0:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  4047a4:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  4047a8:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  4047ac:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  4047b3:	00 00 
  4047b5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  4047b9:	31 c0                	xor    eax,eax
  4047bb:	48 c7 45 c0 15 00 00 	mov    QWORD PTR [rbp-0x40],0x15
  4047c2:	00 
  4047c3:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  4047c7:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  4047cb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  4047cf:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  4047d3:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  4047d7:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  4047db:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  4047df:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  4047e3:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  4047e7:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  4047eb:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  4047ef:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  4047f3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  4047f7:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  4047fb:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  4047ff:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  404803:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  404807:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  40480b:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  40480f:	48 0f 05             	rex.W syscall 
  404812:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  404819:	00 
  40481a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  40481e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  404822:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  404826:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  40482d:	00 00 
  40482f:	74 05                	je     404836 <call+0xae>
  404831:	e8 d5 c7 ff ff       	call   40100b <__stack_chk_fail>
  404836:	c9                   	leave  
  404837:	c3                   	ret    

0000000000404838 <mkfifo>:
  404838:	f3 0f 1e fa          	endbr64 
  40483c:	55                   	push   rbp
  40483d:	48 89 e5             	mov    rbp,rsp
  404840:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  404844:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  404848:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  40484c:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  404850:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  404854:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  404858:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  40485c:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  404863:	00 00 
  404865:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  404869:	31 c0                	xor    eax,eax
  40486b:	48 c7 45 c0 16 00 00 	mov    QWORD PTR [rbp-0x40],0x16
  404872:	00 
  404873:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  404877:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  40487b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  40487f:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  404883:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  404887:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  40488b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  40488f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  404893:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  404897:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  40489b:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  40489f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  4048a3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  4048a7:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  4048ab:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  4048af:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  4048b3:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  4048b7:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  4048bb:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  4048bf:	48 0f 05             	rex.W syscall 
  4048c2:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  4048c9:	00 
  4048ca:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  4048ce:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  4048d2:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  4048d6:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  4048dd:	00 00 
  4048df:	74 05                	je     4048e6 <mkfifo+0xae>
  4048e1:	e8 25 c7 ff ff       	call   40100b <__stack_chk_fail>
  4048e6:	c9                   	leave  
  4048e7:	c3                   	ret    

00000000004048e8 <brk>:
  4048e8:	f3 0f 1e fa          	endbr64 
  4048ec:	55                   	push   rbp
  4048ed:	48 89 e5             	mov    rbp,rsp
  4048f0:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  4048f4:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  4048f8:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  4048fc:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  404900:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  404904:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  404908:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  40490c:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  404913:	00 00 
  404915:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  404919:	31 c0                	xor    eax,eax
  40491b:	48 c7 45 c0 17 00 00 	mov    QWORD PTR [rbp-0x40],0x17
  404922:	00 
  404923:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  404927:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  40492b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  40492f:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  404933:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  404937:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  40493b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  40493f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  404943:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  404947:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  40494b:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  40494f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  404953:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  404957:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  40495b:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  40495f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  404963:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  404967:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  40496b:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  40496f:	48 0f 05             	rex.W syscall 
  404972:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  404979:	00 
  40497a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  40497e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  404982:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  404986:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  40498d:	00 00 
  40498f:	74 05                	je     404996 <brk+0xae>
  404991:	e8 75 c6 ff ff       	call   40100b <__stack_chk_fail>
  404996:	c9                   	leave  
  404997:	c3                   	ret    

0000000000404998 <free>:
  404998:	f3 0f 1e fa          	endbr64 
  40499c:	55                   	push   rbp
  40499d:	48 89 e5             	mov    rbp,rsp
  4049a0:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  4049a4:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  4049a8:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  4049ac:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  4049b0:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  4049b4:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  4049b8:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  4049bc:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  4049c3:	00 00 
  4049c5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  4049c9:	31 c0                	xor    eax,eax
  4049cb:	48 c7 45 c0 18 00 00 	mov    QWORD PTR [rbp-0x40],0x18
  4049d2:	00 
  4049d3:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  4049d7:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  4049db:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  4049df:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  4049e3:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  4049e7:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  4049eb:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  4049ef:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  4049f3:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  4049f7:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  4049fb:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  4049ff:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  404a03:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  404a07:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  404a0b:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  404a0f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  404a13:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  404a17:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  404a1b:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  404a1f:	48 0f 05             	rex.W syscall 
  404a22:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  404a29:	00 
  404a2a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  404a2e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  404a32:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  404a36:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  404a3d:	00 00 
  404a3f:	74 05                	je     404a46 <free+0xae>
  404a41:	e8 c5 c5 ff ff       	call   40100b <__stack_chk_fail>
  404a46:	c9                   	leave  
  404a47:	c3                   	ret    

0000000000404a48 <find_dev>:
  404a48:	f3 0f 1e fa          	endbr64 
  404a4c:	55                   	push   rbp
  404a4d:	48 89 e5             	mov    rbp,rsp
  404a50:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  404a54:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  404a58:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  404a5c:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  404a60:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  404a64:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  404a68:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  404a6c:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  404a73:	00 00 
  404a75:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  404a79:	31 c0                	xor    eax,eax
  404a7b:	48 c7 45 c0 19 00 00 	mov    QWORD PTR [rbp-0x40],0x19
  404a82:	00 
  404a83:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  404a87:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  404a8b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  404a8f:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  404a93:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  404a97:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  404a9b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  404a9f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  404aa3:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  404aa7:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  404aab:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  404aaf:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  404ab3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  404ab7:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  404abb:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  404abf:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  404ac3:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  404ac7:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  404acb:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  404acf:	48 0f 05             	rex.W syscall 
  404ad2:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  404ad9:	00 
  404ada:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  404ade:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  404ae2:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  404ae6:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  404aed:	00 00 
  404aef:	74 05                	je     404af6 <find_dev+0xae>
  404af1:	e8 15 c5 ff ff       	call   40100b <__stack_chk_fail>
  404af6:	c9                   	leave  
  404af7:	c3                   	ret    

0000000000404af8 <operate_dev>:
  404af8:	f3 0f 1e fa          	endbr64 
  404afc:	55                   	push   rbp
  404afd:	48 89 e5             	mov    rbp,rsp
  404b00:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  404b04:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  404b08:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  404b0c:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  404b10:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  404b14:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  404b18:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  404b1c:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  404b23:	00 00 
  404b25:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  404b29:	31 c0                	xor    eax,eax
  404b2b:	48 c7 45 c0 1a 00 00 	mov    QWORD PTR [rbp-0x40],0x1a
  404b32:	00 
  404b33:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  404b37:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  404b3b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  404b3f:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  404b43:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  404b47:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  404b4b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  404b4f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  404b53:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  404b57:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  404b5b:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  404b5f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  404b63:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  404b67:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  404b6b:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  404b6f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  404b73:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  404b77:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  404b7b:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  404b7f:	48 0f 05             	rex.W syscall 
  404b82:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  404b89:	00 
  404b8a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  404b8e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  404b92:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  404b96:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  404b9d:	00 00 
  404b9f:	74 05                	je     404ba6 <operate_dev+0xae>
  404ba1:	e8 65 c4 ff ff       	call   40100b <__stack_chk_fail>
  404ba6:	c9                   	leave  
  404ba7:	c3                   	ret    

0000000000404ba8 <fork>:
  404ba8:	f3 0f 1e fa          	endbr64 
  404bac:	55                   	push   rbp
  404bad:	48 89 e5             	mov    rbp,rsp
  404bb0:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  404bb4:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  404bb8:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  404bbc:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  404bc0:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  404bc4:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  404bc8:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  404bcc:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  404bd3:	00 00 
  404bd5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  404bd9:	31 c0                	xor    eax,eax
  404bdb:	48 c7 45 c0 1b 00 00 	mov    QWORD PTR [rbp-0x40],0x1b
  404be2:	00 
  404be3:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  404be7:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  404beb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  404bef:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  404bf3:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  404bf7:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  404bfb:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  404bff:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  404c03:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  404c07:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  404c0b:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  404c0f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  404c13:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  404c17:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  404c1b:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  404c1f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  404c23:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  404c27:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  404c2b:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  404c2f:	48 0f 05             	rex.W syscall 
  404c32:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  404c39:	00 
  404c3a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  404c3e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  404c42:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  404c46:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  404c4d:	00 00 
  404c4f:	74 05                	je     404c56 <fork+0xae>
  404c51:	e8 b5 c3 ff ff       	call   40100b <__stack_chk_fail>
  404c56:	c9                   	leave  
  404c57:	c3                   	ret    

0000000000404c58 <execve>:
  404c58:	f3 0f 1e fa          	endbr64 
  404c5c:	55                   	push   rbp
  404c5d:	48 89 e5             	mov    rbp,rsp
  404c60:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  404c64:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  404c68:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  404c6c:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  404c70:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  404c74:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  404c78:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  404c7c:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  404c83:	00 00 
  404c85:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  404c89:	31 c0                	xor    eax,eax
  404c8b:	48 c7 45 c0 1c 00 00 	mov    QWORD PTR [rbp-0x40],0x1c
  404c92:	00 
  404c93:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  404c97:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  404c9b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  404c9f:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  404ca3:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  404ca7:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  404cab:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  404caf:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  404cb3:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  404cb7:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  404cbb:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  404cbf:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  404cc3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  404cc7:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  404ccb:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  404ccf:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  404cd3:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  404cd7:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  404cdb:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  404cdf:	48 0f 05             	rex.W syscall 
  404ce2:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  404ce9:	00 
  404cea:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  404cee:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  404cf2:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  404cf6:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  404cfd:	00 00 
  404cff:	74 05                	je     404d06 <execve+0xae>
  404d01:	e8 05 c3 ff ff       	call   40100b <__stack_chk_fail>
  404d06:	c9                   	leave  
  404d07:	c3                   	ret    

0000000000404d08 <wait>:
  404d08:	f3 0f 1e fa          	endbr64 
  404d0c:	55                   	push   rbp
  404d0d:	48 89 e5             	mov    rbp,rsp
  404d10:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  404d14:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  404d18:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  404d1c:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  404d20:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  404d24:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  404d28:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  404d2c:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  404d33:	00 00 
  404d35:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  404d39:	31 c0                	xor    eax,eax
  404d3b:	48 c7 45 c0 1d 00 00 	mov    QWORD PTR [rbp-0x40],0x1d
  404d42:	00 
  404d43:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  404d47:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  404d4b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  404d4f:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  404d53:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  404d57:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  404d5b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  404d5f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  404d63:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  404d67:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  404d6b:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  404d6f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  404d73:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  404d77:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  404d7b:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  404d7f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  404d83:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  404d87:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  404d8b:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  404d8f:	48 0f 05             	rex.W syscall 
  404d92:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  404d99:	00 
  404d9a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  404d9e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  404da2:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  404da6:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  404dad:	00 00 
  404daf:	74 05                	je     404db6 <wait+0xae>
  404db1:	e8 55 c2 ff ff       	call   40100b <__stack_chk_fail>
  404db6:	c9                   	leave  
  404db7:	c3                   	ret    

0000000000404db8 <mmap>:
  404db8:	f3 0f 1e fa          	endbr64 
  404dbc:	55                   	push   rbp
  404dbd:	48 89 e5             	mov    rbp,rsp
  404dc0:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  404dc4:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  404dc8:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  404dcc:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  404dd0:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  404dd4:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  404dd8:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  404ddc:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  404de3:	00 00 
  404de5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  404de9:	31 c0                	xor    eax,eax
  404deb:	48 c7 45 c0 1e 00 00 	mov    QWORD PTR [rbp-0x40],0x1e
  404df2:	00 
  404df3:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  404df7:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  404dfb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  404dff:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  404e03:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  404e07:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  404e0b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  404e0f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  404e13:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  404e17:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  404e1b:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  404e1f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  404e23:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  404e27:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  404e2b:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  404e2f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  404e33:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  404e37:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  404e3b:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  404e3f:	48 0f 05             	rex.W syscall 
  404e42:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  404e49:	00 
  404e4a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  404e4e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  404e52:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  404e56:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  404e5d:	00 00 
  404e5f:	74 05                	je     404e66 <mmap+0xae>
  404e61:	e8 a5 c1 ff ff       	call   40100b <__stack_chk_fail>
  404e66:	c9                   	leave  
  404e67:	c3                   	ret    

0000000000404e68 <munmap>:
  404e68:	f3 0f 1e fa          	endbr64 
  404e6c:	55                   	push   rbp
  404e6d:	48 89 e5             	mov    rbp,rsp
  404e70:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  404e74:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  404e78:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  404e7c:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  404e80:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  404e84:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  404e88:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  404e8c:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  404e93:	00 00 
  404e95:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  404e99:	31 c0                	xor    eax,eax
  404e9b:	48 c7 45 c0 1f 00 00 	mov    QWORD PTR [rbp-0x40],0x1f
  404ea2:	00 
  404ea3:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  404ea7:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  404eab:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  404eaf:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  404eb3:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  404eb7:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  404ebb:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  404ebf:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  404ec3:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  404ec7:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  404ecb:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  404ecf:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  404ed3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  404ed7:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  404edb:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  404edf:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  404ee3:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  404ee7:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  404eeb:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  404eef:	48 0f 05             	rex.W syscall 
  404ef2:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  404ef9:	00 
  404efa:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  404efe:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  404f02:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  404f06:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  404f0d:	00 00 
  404f0f:	74 05                	je     404f16 <munmap+0xae>
  404f11:	e8 f5 c0 ff ff       	call   40100b <__stack_chk_fail>
  404f16:	c9                   	leave  
  404f17:	c3                   	ret    

0000000000404f18 <mknod>:
  404f18:	f3 0f 1e fa          	endbr64 
  404f1c:	55                   	push   rbp
  404f1d:	48 89 e5             	mov    rbp,rsp
  404f20:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  404f24:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  404f28:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  404f2c:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  404f30:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  404f34:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  404f38:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  404f3c:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  404f43:	00 00 
  404f45:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  404f49:	31 c0                	xor    eax,eax
  404f4b:	48 c7 45 c0 21 00 00 	mov    QWORD PTR [rbp-0x40],0x21
  404f52:	00 
  404f53:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  404f57:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  404f5b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  404f5f:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  404f63:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  404f67:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  404f6b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  404f6f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  404f73:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  404f77:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  404f7b:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  404f7f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  404f83:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  404f87:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  404f8b:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  404f8f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  404f93:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  404f97:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  404f9b:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  404f9f:	48 0f 05             	rex.W syscall 
  404fa2:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  404fa9:	00 
  404faa:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  404fae:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  404fb2:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  404fb6:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  404fbd:	00 00 
  404fbf:	74 05                	je     404fc6 <mknod+0xae>
  404fc1:	e8 45 c0 ff ff       	call   40100b <__stack_chk_fail>
  404fc6:	c9                   	leave  
  404fc7:	c3                   	ret    

0000000000404fc8 <kb_readc>:
  404fc8:	f3 0f 1e fa          	endbr64 
  404fcc:	55                   	push   rbp
  404fcd:	48 89 e5             	mov    rbp,rsp
  404fd0:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  404fd4:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  404fd8:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
  404fdc:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  404fe0:	48 89 4d 90          	mov    QWORD PTR [rbp-0x70],rcx
  404fe4:	4c 89 45 88          	mov    QWORD PTR [rbp-0x78],r8
  404fe8:	4c 89 4d 80          	mov    QWORD PTR [rbp-0x80],r9
  404fec:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  404ff3:	00 00 
  404ff5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  404ff9:	31 c0                	xor    eax,eax
  404ffb:	48 c7 45 c0 64 00 00 	mov    QWORD PTR [rbp-0x40],0x64
  405002:	00 
  405003:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  405007:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  40500b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  40500f:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  405013:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  405017:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  40501b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  40501f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  405023:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  405027:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  40502b:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  40502f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  405033:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  405037:	48 8b 7d c8          	mov    rdi,QWORD PTR [rbp-0x38]
  40503b:	48 8b 75 d0          	mov    rsi,QWORD PTR [rbp-0x30]
  40503f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  405043:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  405047:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  40504b:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  40504f:	48 0f 05             	rex.W syscall 
  405052:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  405059:	00 
  40505a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  40505e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  405062:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  405066:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
  40506d:	00 00 
  40506f:	74 05                	je     405076 <kb_readc+0xae>
  405071:	e8 95 bf ff ff       	call   40100b <__stack_chk_fail>
  405076:	c9                   	leave  
  405077:	c3                   	ret    
