
bin/gmsknl.elf:     file format elf64-x86-64


Disassembly of section .entry:

0000000000103000 <init32>:
  103000:	fa                   	cli    
  103001:	b8 76 30 10 00       	mov    eax,0x103076
  103006:	83 c0 02             	add    eax,0x2
  103009:	c7 00 4e 30 10 00    	mov    DWORD PTR [rax],0x10304e
  10300f:	66 0f 01 15 76 30 10 	data16 lgdt [rip+0x103076]        # 20608d <dev_stdout+0xc75cd>
  103016:	00 

0000000000103017 <switch_cs>:
  103017:	66 b8 10 00          	mov    ax,0x10
  10301b:	8e d8                	mov    ds,eax
  10301d:	8e d0                	mov    ss,eax
  10301f:	8e c0                	mov    es,eax
  103021:	8e e8                	mov    gs,eax
  103023:	8e e0                	mov    fs,eax
  103025:	bc 00 7e 00 00       	mov    esp,0x7e00
  10302a:	b9 80 00 00 c0       	mov    ecx,0xc0000080
  10302f:	0f 32                	rdmsr  
  103031:	0f ba e8 08          	bts    eax,0x8
  103035:	0f 30                	wrmsr  
  103037:	0f 20 c0             	mov    rax,cr0
  10303a:	0f ba e8 00          	bts    eax,0x0
  10303e:	0f 22 c0             	mov    cr0,rax
  103041:	53                   	push   rbx
  103042:	68 d6 50 52 e8       	push   0xffffffffe85250d6
  103047:	b8 eb 4a 13 00       	mov    eax,0x134aeb
  10304c:	ff e0                	jmp    rax

000000000010304e <gdt64>:
	...
  10305a:	00 98 20 00 00 00    	add    BYTE PTR [rax+0x20],bl
  103060:	00 00                	add    BYTE PTR [rax],al
  103062:	00 92 00 00 00 00    	add    BYTE PTR [rdx+0x0],dl
  103068:	00 00                	add    BYTE PTR [rax],al
  10306a:	00 f8                	add    al,bh
  10306c:	20 00                	and    BYTE PTR [rax],al
  10306e:	00 00                	add    BYTE PTR [rax],al
  103070:	00 00                	add    BYTE PTR [rax],al
  103072:	00 f2                	add    dl,dh
	...

0000000000103076 <gdtptr>:
  103076:	27                   	(bad)  
  103077:	00 00                	add    BYTE PTR [rax],al
  103079:	30 10                	xor    BYTE PTR [rax],dl
  10307b:	00 00                	add    BYTE PTR [rax],al
  10307d:	00 00                	add    BYTE PTR [rax],al
	...

bin/gmsknl.elf:     file format elf64-x86-64


Disassembly of section .text:

00000000001343a0 <init_int>:
  1343a0:	f3 0f 1e fa          	endbr64 
  1343a4:	55                   	push   rbp
  1343a5:	48 89 e5             	mov    rbp,rsp
  1343a8:	48 83 ec 10          	sub    rsp,0x10
  1343ac:	b8 20 47 13 00       	mov    eax,0x134720
  1343b1:	b9 00 8e 00 00       	mov    ecx,0x8e00
  1343b6:	ba 08 00 00 00       	mov    edx,0x8
  1343bb:	89 c6                	mov    esi,eax
  1343bd:	bf 00 00 00 00       	mov    edi,0x0
  1343c2:	e8 d2 02 00 00       	call   134699 <set_gate>
  1343c7:	b8 39 47 13 00       	mov    eax,0x134739
  1343cc:	b9 00 8e 00 00       	mov    ecx,0x8e00
  1343d1:	ba 08 00 00 00       	mov    edx,0x8
  1343d6:	89 c6                	mov    esi,eax
  1343d8:	bf 01 00 00 00       	mov    edi,0x1
  1343dd:	e8 b7 02 00 00       	call   134699 <set_gate>
  1343e2:	b8 52 47 13 00       	mov    eax,0x134752
  1343e7:	b9 00 8e 00 00       	mov    ecx,0x8e00
  1343ec:	ba 08 00 00 00       	mov    edx,0x8
  1343f1:	89 c6                	mov    esi,eax
  1343f3:	bf 02 00 00 00       	mov    edi,0x2
  1343f8:	e8 9c 02 00 00       	call   134699 <set_gate>
  1343fd:	b8 6b 47 13 00       	mov    eax,0x13476b
  134402:	b9 00 8e 00 00       	mov    ecx,0x8e00
  134407:	ba 08 00 00 00       	mov    edx,0x8
  13440c:	89 c6                	mov    esi,eax
  13440e:	bf 03 00 00 00       	mov    edi,0x3
  134413:	e8 81 02 00 00       	call   134699 <set_gate>
  134418:	b8 84 47 13 00       	mov    eax,0x134784
  13441d:	b9 00 8e 00 00       	mov    ecx,0x8e00
  134422:	ba 08 00 00 00       	mov    edx,0x8
  134427:	89 c6                	mov    esi,eax
  134429:	bf 04 00 00 00       	mov    edi,0x4
  13442e:	e8 66 02 00 00       	call   134699 <set_gate>
  134433:	b8 9d 47 13 00       	mov    eax,0x13479d
  134438:	b9 00 8e 00 00       	mov    ecx,0x8e00
  13443d:	ba 08 00 00 00       	mov    edx,0x8
  134442:	89 c6                	mov    esi,eax
  134444:	bf 05 00 00 00       	mov    edi,0x5
  134449:	e8 4b 02 00 00       	call   134699 <set_gate>
  13444e:	b8 b6 47 13 00       	mov    eax,0x1347b6
  134453:	b9 00 8e 00 00       	mov    ecx,0x8e00
  134458:	ba 08 00 00 00       	mov    edx,0x8
  13445d:	89 c6                	mov    esi,eax
  13445f:	bf 06 00 00 00       	mov    edi,0x6
  134464:	e8 30 02 00 00       	call   134699 <set_gate>
  134469:	b8 d9 47 13 00       	mov    eax,0x1347d9
  13446e:	b9 00 8e 00 00       	mov    ecx,0x8e00
  134473:	ba 08 00 00 00       	mov    edx,0x8
  134478:	89 c6                	mov    esi,eax
  13447a:	bf 07 00 00 00       	mov    edi,0x7
  13447f:	e8 15 02 00 00       	call   134699 <set_gate>
  134484:	b8 f2 47 13 00       	mov    eax,0x1347f2
  134489:	b9 00 8e 00 00       	mov    ecx,0x8e00
  13448e:	ba 08 00 00 00       	mov    edx,0x8
  134493:	89 c6                	mov    esi,eax
  134495:	bf 08 00 00 00       	mov    edi,0x8
  13449a:	e8 fa 01 00 00       	call   134699 <set_gate>
  13449f:	b8 0b 48 13 00       	mov    eax,0x13480b
  1344a4:	b9 00 8e 00 00       	mov    ecx,0x8e00
  1344a9:	ba 08 00 00 00       	mov    edx,0x8
  1344ae:	89 c6                	mov    esi,eax
  1344b0:	bf 09 00 00 00       	mov    edi,0x9
  1344b5:	e8 df 01 00 00       	call   134699 <set_gate>
  1344ba:	b8 22 48 13 00       	mov    eax,0x134822
  1344bf:	b9 00 8e 00 00       	mov    ecx,0x8e00
  1344c4:	ba 08 00 00 00       	mov    edx,0x8
  1344c9:	89 c6                	mov    esi,eax
  1344cb:	bf 0a 00 00 00       	mov    edi,0xa
  1344d0:	e8 c4 01 00 00       	call   134699 <set_gate>
  1344d5:	b8 3b 48 13 00       	mov    eax,0x13483b
  1344da:	b9 00 8e 00 00       	mov    ecx,0x8e00
  1344df:	ba 08 00 00 00       	mov    edx,0x8
  1344e4:	89 c6                	mov    esi,eax
  1344e6:	bf 0b 00 00 00       	mov    edi,0xb
  1344eb:	e8 a9 01 00 00       	call   134699 <set_gate>
  1344f0:	b8 54 48 13 00       	mov    eax,0x134854
  1344f5:	b9 00 8e 00 00       	mov    ecx,0x8e00
  1344fa:	ba 08 00 00 00       	mov    edx,0x8
  1344ff:	89 c6                	mov    esi,eax
  134501:	bf 0c 00 00 00       	mov    edi,0xc
  134506:	e8 8e 01 00 00       	call   134699 <set_gate>
  13450b:	b8 6d 48 13 00       	mov    eax,0x13486d
  134510:	b9 00 8e 00 00       	mov    ecx,0x8e00
  134515:	ba 08 00 00 00       	mov    edx,0x8
  13451a:	89 c6                	mov    esi,eax
  13451c:	bf 0d 00 00 00       	mov    edi,0xd
  134521:	e8 73 01 00 00       	call   134699 <set_gate>
  134526:	b8 4d 57 13 00       	mov    eax,0x13574d
  13452b:	b9 00 8e 00 00       	mov    ecx,0x8e00
  134530:	ba 08 00 00 00       	mov    edx,0x8
  134535:	89 c6                	mov    esi,eax
  134537:	bf 0e 00 00 00       	mov    edi,0xe
  13453c:	e8 58 01 00 00       	call   134699 <set_gate>
  134541:	b8 52 47 13 00       	mov    eax,0x134752
  134546:	b9 00 8e 00 00       	mov    ecx,0x8e00
  13454b:	ba 08 00 00 00       	mov    edx,0x8
  134550:	89 c6                	mov    esi,eax
  134552:	bf 0f 00 00 00       	mov    edi,0xf
  134557:	e8 3d 01 00 00       	call   134699 <set_gate>
  13455c:	b8 92 48 13 00       	mov    eax,0x134892
  134561:	b9 00 8e 00 00       	mov    ecx,0x8e00
  134566:	ba 08 00 00 00       	mov    edx,0x8
  13456b:	89 c6                	mov    esi,eax
  13456d:	bf 10 00 00 00       	mov    edi,0x10
  134572:	e8 22 01 00 00       	call   134699 <set_gate>
  134577:	c7 45 fc 11 00 00 00 	mov    DWORD PTR [rbp-0x4],0x11
  13457e:	eb 22                	jmp    1345a2 <init_int+0x202>
  134580:	b8 52 47 13 00       	mov    eax,0x134752
  134585:	89 c6                	mov    esi,eax
  134587:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13458a:	0f b6 c0             	movzx  eax,al
  13458d:	b9 00 8e 00 00       	mov    ecx,0x8e00
  134592:	ba 08 00 00 00       	mov    edx,0x8
  134597:	89 c7                	mov    edi,eax
  134599:	e8 fb 00 00 00       	call   134699 <set_gate>
  13459e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  1345a2:	83 7d fc 2f          	cmp    DWORD PTR [rbp-0x4],0x2f
  1345a6:	7e d8                	jle    134580 <init_int+0x1e0>
  1345a8:	b8 b6 9d 13 00       	mov    eax,0x139db6
  1345ad:	b9 00 8f 00 00       	mov    ecx,0x8f00
  1345b2:	ba 08 00 00 00       	mov    edx,0x8
  1345b7:	89 c6                	mov    esi,eax
  1345b9:	bf 21 00 00 00       	mov    edi,0x21
  1345be:	e8 d6 00 00 00       	call   134699 <set_gate>
  1345c3:	b8 20 92 13 00       	mov    eax,0x139220
  1345c8:	b9 00 8e 00 00       	mov    ecx,0x8e00
  1345cd:	ba 08 00 00 00       	mov    edx,0x8
  1345d2:	89 c6                	mov    esi,eax
  1345d4:	bf 20 00 00 00       	mov    edi,0x20
  1345d9:	e8 bb 00 00 00       	call   134699 <set_gate>
  1345de:	b8 80 ac 13 00       	mov    eax,0x13ac80
  1345e3:	b9 00 8e 00 00       	mov    ecx,0x8e00
  1345e8:	ba 08 00 00 00       	mov    edx,0x8
  1345ed:	89 c6                	mov    esi,eax
  1345ef:	bf 2e 00 00 00       	mov    edi,0x2e
  1345f4:	e8 a0 00 00 00       	call   134699 <set_gate>
  1345f9:	b8 40 9c 13 00       	mov    eax,0x139c40
  1345fe:	b9 00 8f 00 00       	mov    ecx,0x8f00
  134603:	ba 08 00 00 00       	mov    edx,0x8
  134608:	89 c6                	mov    esi,eax
  13460a:	bf 80 00 00 00       	mov    edi,0x80
  13460f:	e8 85 00 00 00       	call   134699 <set_gate>
  134614:	be 11 00 00 00       	mov    esi,0x11
  134619:	bf 20 00 00 00       	mov    edi,0x20
  13461e:	e8 1d 49 00 00       	call   138f40 <outb>
  134623:	be 11 00 00 00       	mov    esi,0x11
  134628:	bf a0 00 00 00       	mov    edi,0xa0
  13462d:	e8 0e 49 00 00       	call   138f40 <outb>
  134632:	be 20 00 00 00       	mov    esi,0x20
  134637:	bf 21 00 00 00       	mov    edi,0x21
  13463c:	e8 ff 48 00 00       	call   138f40 <outb>
  134641:	be 28 00 00 00       	mov    esi,0x28
  134646:	bf a1 00 00 00       	mov    edi,0xa1
  13464b:	e8 f0 48 00 00       	call   138f40 <outb>
  134650:	be 04 00 00 00       	mov    esi,0x4
  134655:	bf 21 00 00 00       	mov    edi,0x21
  13465a:	e8 e1 48 00 00       	call   138f40 <outb>
  13465f:	be 02 00 00 00       	mov    esi,0x2
  134664:	bf a1 00 00 00       	mov    edi,0xa1
  134669:	e8 d2 48 00 00       	call   138f40 <outb>
  13466e:	be 01 00 00 00       	mov    esi,0x1
  134673:	bf 21 00 00 00       	mov    edi,0x21
  134678:	e8 c3 48 00 00       	call   138f40 <outb>
  13467d:	be 01 00 00 00       	mov    esi,0x1
  134682:	bf a1 00 00 00       	mov    edi,0xa1
  134687:	e8 b4 48 00 00       	call   138f40 <outb>
  13468c:	b8 00 00 00 00       	mov    eax,0x0
  134691:	e8 ef 48 00 00       	call   138f85 <turn_on_int>
  134696:	90                   	nop
  134697:	c9                   	leave  
  134698:	c3                   	ret    

0000000000134699 <set_gate>:
  134699:	f3 0f 1e fa          	endbr64 
  13469d:	55                   	push   rbp
  13469e:	48 89 e5             	mov    rbp,rsp
  1346a1:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  1346a4:	89 c8                	mov    eax,ecx
  1346a6:	89 f9                	mov    ecx,edi
  1346a8:	88 4d fc             	mov    BYTE PTR [rbp-0x4],cl
  1346ab:	66 89 55 f4          	mov    WORD PTR [rbp-0xc],dx
  1346af:	66 89 45 f0          	mov    WORD PTR [rbp-0x10],ax
  1346b3:	48 8b 15 06 ea fc ff 	mov    rdx,QWORD PTR [rip+0xfffffffffffcea06]        # 1030c0 <idt>
  1346ba:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  1346be:	48 c1 e0 03          	shl    rax,0x3
  1346c2:	48 01 d0             	add    rax,rdx
  1346c5:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  1346c8:	66 89 10             	mov    WORD PTR [rax],dx
  1346cb:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  1346ce:	c1 e8 10             	shr    eax,0x10
  1346d1:	89 c2                	mov    edx,eax
  1346d3:	48 8b 0d e6 e9 fc ff 	mov    rcx,QWORD PTR [rip+0xfffffffffffce9e6]        # 1030c0 <idt>
  1346da:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  1346de:	48 c1 e0 03          	shl    rax,0x3
  1346e2:	48 01 c8             	add    rax,rcx
  1346e5:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
  1346e9:	48 8b 15 d0 e9 fc ff 	mov    rdx,QWORD PTR [rip+0xfffffffffffce9d0]        # 1030c0 <idt>
  1346f0:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  1346f4:	48 c1 e0 03          	shl    rax,0x3
  1346f8:	48 01 c2             	add    rdx,rax
  1346fb:	0f b7 45 f0          	movzx  eax,WORD PTR [rbp-0x10]
  1346ff:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
  134703:	48 8b 15 b6 e9 fc ff 	mov    rdx,QWORD PTR [rip+0xfffffffffffce9b6]        # 1030c0 <idt>
  13470a:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  13470e:	48 c1 e0 03          	shl    rax,0x3
  134712:	48 01 c2             	add    rdx,rax
  134715:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  134719:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
  13471d:	90                   	nop
  13471e:	5d                   	pop    rbp
  13471f:	c3                   	ret    

0000000000134720 <divide_err>:
  134720:	f3 0f 1e fa          	endbr64 
  134724:	55                   	push   rbp
  134725:	48 89 e5             	mov    rbp,rsp
  134728:	fa                   	cli    
  134729:	b8 00 00 00 00       	mov    eax,0x0
  13472e:	e8 46 48 00 00       	call   138f79 <eoi>
  134733:	fb                   	sti    
  134734:	c9                   	leave  
  134735:	cf                   	iret   
  134736:	90                   	nop
  134737:	5d                   	pop    rbp
  134738:	c3                   	ret    

0000000000134739 <debug>:
  134739:	f3 0f 1e fa          	endbr64 
  13473d:	55                   	push   rbp
  13473e:	48 89 e5             	mov    rbp,rsp
  134741:	fa                   	cli    
  134742:	b8 00 00 00 00       	mov    eax,0x0
  134747:	e8 2d 48 00 00       	call   138f79 <eoi>
  13474c:	fb                   	sti    
  13474d:	c9                   	leave  
  13474e:	cf                   	iret   
  13474f:	90                   	nop
  134750:	5d                   	pop    rbp
  134751:	c3                   	ret    

0000000000134752 <default_int_proc>:
  134752:	f3 0f 1e fa          	endbr64 
  134756:	55                   	push   rbp
  134757:	48 89 e5             	mov    rbp,rsp
  13475a:	fa                   	cli    
  13475b:	b8 00 00 00 00       	mov    eax,0x0
  134760:	e8 14 48 00 00       	call   138f79 <eoi>
  134765:	fb                   	sti    
  134766:	c9                   	leave  
  134767:	cf                   	iret   
  134768:	90                   	nop
  134769:	5d                   	pop    rbp
  13476a:	c3                   	ret    

000000000013476b <breakpoint>:
  13476b:	f3 0f 1e fa          	endbr64 
  13476f:	55                   	push   rbp
  134770:	48 89 e5             	mov    rbp,rsp
  134773:	fa                   	cli    
  134774:	b8 00 00 00 00       	mov    eax,0x0
  134779:	e8 fb 47 00 00       	call   138f79 <eoi>
  13477e:	fb                   	sti    
  13477f:	c9                   	leave  
  134780:	cf                   	iret   
  134781:	90                   	nop
  134782:	5d                   	pop    rbp
  134783:	c3                   	ret    

0000000000134784 <overflow>:
  134784:	f3 0f 1e fa          	endbr64 
  134788:	55                   	push   rbp
  134789:	48 89 e5             	mov    rbp,rsp
  13478c:	fa                   	cli    
  13478d:	b8 00 00 00 00       	mov    eax,0x0
  134792:	e8 e2 47 00 00       	call   138f79 <eoi>
  134797:	fb                   	sti    
  134798:	c9                   	leave  
  134799:	cf                   	iret   
  13479a:	90                   	nop
  13479b:	5d                   	pop    rbp
  13479c:	c3                   	ret    

000000000013479d <bounds>:
  13479d:	f3 0f 1e fa          	endbr64 
  1347a1:	55                   	push   rbp
  1347a2:	48 89 e5             	mov    rbp,rsp
  1347a5:	fa                   	cli    
  1347a6:	b8 00 00 00 00       	mov    eax,0x0
  1347ab:	e8 c9 47 00 00       	call   138f79 <eoi>
  1347b0:	fb                   	sti    
  1347b1:	c9                   	leave  
  1347b2:	cf                   	iret   
  1347b3:	90                   	nop
  1347b4:	5d                   	pop    rbp
  1347b5:	c3                   	ret    

00000000001347b6 <undefined_operator>:
  1347b6:	f3 0f 1e fa          	endbr64 
  1347ba:	55                   	push   rbp
  1347bb:	48 89 e5             	mov    rbp,rsp
  1347be:	b8 00 00 00 00       	mov    eax,0x0
  1347c3:	e8 b1 47 00 00       	call   138f79 <eoi>
  1347c8:	b8 00 00 00 00       	mov    eax,0x0
  1347cd:	e8 d2 47 00 00       	call   138fa4 <report_back_trace_of_err>
  1347d2:	eb fe                	jmp    1347d2 <undefined_operator+0x1c>
  1347d4:	c9                   	leave  
  1347d5:	cf                   	iret   
  1347d6:	90                   	nop
  1347d7:	5d                   	pop    rbp
  1347d8:	c3                   	ret    

00000000001347d9 <coprocessor_notexist>:
  1347d9:	f3 0f 1e fa          	endbr64 
  1347dd:	55                   	push   rbp
  1347de:	48 89 e5             	mov    rbp,rsp
  1347e1:	fa                   	cli    
  1347e2:	b8 00 00 00 00       	mov    eax,0x0
  1347e7:	e8 8d 47 00 00       	call   138f79 <eoi>
  1347ec:	fb                   	sti    
  1347ed:	c9                   	leave  
  1347ee:	cf                   	iret   
  1347ef:	90                   	nop
  1347f0:	5d                   	pop    rbp
  1347f1:	c3                   	ret    

00000000001347f2 <double_ints>:
  1347f2:	f3 0f 1e fa          	endbr64 
  1347f6:	55                   	push   rbp
  1347f7:	48 89 e5             	mov    rbp,rsp
  1347fa:	fa                   	cli    
  1347fb:	b8 00 00 00 00       	mov    eax,0x0
  134800:	e8 74 47 00 00       	call   138f79 <eoi>
  134805:	fb                   	sti    
  134806:	c9                   	leave  
  134807:	cf                   	iret   
  134808:	90                   	nop
  134809:	5d                   	pop    rbp
  13480a:	c3                   	ret    

000000000013480b <coprocessor_seg_overbound>:
  13480b:	f3 0f 1e fa          	endbr64 
  13480f:	55                   	push   rbp
  134810:	48 89 e5             	mov    rbp,rsp
  134813:	b8 00 00 00 00       	mov    eax,0x0
  134818:	e8 5c 47 00 00       	call   138f79 <eoi>
  13481d:	c9                   	leave  
  13481e:	cf                   	iret   
  13481f:	90                   	nop
  134820:	5d                   	pop    rbp
  134821:	c3                   	ret    

0000000000134822 <invalid_tss>:
  134822:	f3 0f 1e fa          	endbr64 
  134826:	55                   	push   rbp
  134827:	48 89 e5             	mov    rbp,rsp
  13482a:	fa                   	cli    
  13482b:	b8 00 00 00 00       	mov    eax,0x0
  134830:	e8 44 47 00 00       	call   138f79 <eoi>
  134835:	fb                   	sti    
  134836:	c9                   	leave  
  134837:	cf                   	iret   
  134838:	90                   	nop
  134839:	5d                   	pop    rbp
  13483a:	c3                   	ret    

000000000013483b <segment_notexist>:
  13483b:	f3 0f 1e fa          	endbr64 
  13483f:	55                   	push   rbp
  134840:	48 89 e5             	mov    rbp,rsp
  134843:	fa                   	cli    
  134844:	b8 00 00 00 00       	mov    eax,0x0
  134849:	e8 2b 47 00 00       	call   138f79 <eoi>
  13484e:	fb                   	sti    
  13484f:	c9                   	leave  
  134850:	cf                   	iret   
  134851:	90                   	nop
  134852:	5d                   	pop    rbp
  134853:	c3                   	ret    

0000000000134854 <stackseg_overbound>:
  134854:	f3 0f 1e fa          	endbr64 
  134858:	55                   	push   rbp
  134859:	48 89 e5             	mov    rbp,rsp
  13485c:	fa                   	cli    
  13485d:	b8 00 00 00 00       	mov    eax,0x0
  134862:	e8 12 47 00 00       	call   138f79 <eoi>
  134867:	fb                   	sti    
  134868:	c9                   	leave  
  134869:	cf                   	iret   
  13486a:	90                   	nop
  13486b:	5d                   	pop    rbp
  13486c:	c3                   	ret    

000000000013486d <general_protect>:
  13486d:	f3 0f 1e fa          	endbr64 
  134871:	55                   	push   rbp
  134872:	48 89 e5             	mov    rbp,rsp
  134875:	48 83 ec 10          	sub    rsp,0x10
  134879:	fa                   	cli    
  13487a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  134881:	b8 00 00 00 00       	mov    eax,0x0
  134886:	e8 ee 46 00 00       	call   138f79 <eoi>
  13488b:	eb fe                	jmp    13488b <general_protect+0x1e>
  13488d:	c9                   	leave  
  13488e:	cf                   	iret   
  13488f:	90                   	nop
  134890:	c9                   	leave  
  134891:	c3                   	ret    

0000000000134892 <coprocessor_err>:
  134892:	f3 0f 1e fa          	endbr64 
  134896:	55                   	push   rbp
  134897:	48 89 e5             	mov    rbp,rsp
  13489a:	fa                   	cli    
  13489b:	b8 00 00 00 00       	mov    eax,0x0
  1348a0:	e8 d4 46 00 00       	call   138f79 <eoi>
  1348a5:	fb                   	sti    
  1348a6:	c9                   	leave  
  1348a7:	cf                   	iret   
  1348a8:	90                   	nop
  1348a9:	5d                   	pop    rbp
  1348aa:	c3                   	ret    

00000000001348ab <syscall>:
  1348ab:	f3 0f 1e fa          	endbr64 
  1348af:	55                   	push   rbp
  1348b0:	48 89 e5             	mov    rbp,rsp
  1348b3:	48 83 ec 20          	sub    rsp,0x20
  1348b7:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  1348ba:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  1348bd:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  1348c0:	89 4d f0             	mov    DWORD PTR [rbp-0x10],ecx
  1348c3:	44 89 45 ec          	mov    DWORD PTR [rbp-0x14],r8d
  1348c7:	44 89 4d e8          	mov    DWORD PTR [rbp-0x18],r9d
  1348cb:	83 7d fc 64          	cmp    DWORD PTR [rbp-0x4],0x64
  1348cf:	0f 87 14 02 00 00    	ja     134ae9 <syscall+0x23e>
  1348d5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1348d8:	48 8b 04 c5 60 de 13 	mov    rax,QWORD PTR [rax*8+0x13de60]
  1348df:	00 
  1348e0:	3e ff e0             	notrack jmp rax
  1348e3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  1348e6:	48 98                	cdqe   
  1348e8:	48 89 c7             	mov    rdi,rax
  1348eb:	e8 50 26 00 00       	call   136f40 <reg_device>
  1348f0:	e9 f4 01 00 00       	jmp    134ae9 <syscall+0x23e>
  1348f5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  1348f8:	89 c7                	mov    edi,eax
  1348fa:	e8 a0 30 00 00       	call   13799f <dispose_device>
  1348ff:	e9 e5 01 00 00       	jmp    134ae9 <syscall+0x23e>
  134904:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  134907:	48 98                	cdqe   
  134909:	48 89 c7             	mov    rdi,rax
  13490c:	e8 17 29 00 00       	call   137228 <reg_driver>
  134911:	e9 d3 01 00 00       	jmp    134ae9 <syscall+0x23e>
  134916:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  134919:	48 98                	cdqe   
  13491b:	48 89 c7             	mov    rdi,rax
  13491e:	e8 1a 31 00 00       	call   137a3d <dispose_driver>
  134923:	e9 c1 01 00 00       	jmp    134ae9 <syscall+0x23e>
  134928:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  13492b:	48 98                	cdqe   
  13492d:	48 89 c2             	mov    rdx,rax
  134930:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  134933:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  134936:	89 ce                	mov    esi,ecx
  134938:	89 c7                	mov    edi,eax
  13493a:	e8 09 2e 00 00       	call   137748 <call_drv_func>
  13493f:	e9 a5 01 00 00       	jmp    134ae9 <syscall+0x23e>
  134944:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  134947:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13494a:	89 d6                	mov    esi,edx
  13494c:	89 c7                	mov    edi,eax
  13494e:	e8 d9 11 00 00       	call   135b2c <req_page_at>
  134953:	e9 91 01 00 00       	jmp    134ae9 <syscall+0x23e>
  134958:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13495b:	48 98                	cdqe   
  13495d:	48 89 c7             	mov    rdi,rax
  134960:	e8 f8 0f 00 00       	call   13595d <free_page>
  134965:	e9 7f 01 00 00       	jmp    134ae9 <syscall+0x23e>
  13496a:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  13496d:	48 98                	cdqe   
  13496f:	48 89 c2             	mov    rdx,rax
  134972:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  134975:	48 98                	cdqe   
  134977:	48 89 c1             	mov    rcx,rax
  13497a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13497d:	48 89 ce             	mov    rsi,rcx
  134980:	89 c7                	mov    edi,eax
  134982:	e8 b5 41 00 00       	call   138b3c <reg_proc>
  134987:	e9 5d 01 00 00       	jmp    134ae9 <syscall+0x23e>
  13498c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13498f:	89 c7                	mov    edi,eax
  134991:	e8 85 3f 00 00       	call   13891b <del_proc>
  134996:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  134999:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13499c:	89 d6                	mov    esi,edx
  13499e:	89 c7                	mov    edi,eax
  1349a0:	e8 49 12 00 00       	call   135bee <chk_vm>
  1349a5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  1349a8:	48 98                	cdqe   
  1349aa:	48 89 c2             	mov    rdx,rax
  1349ad:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  1349b0:	89 c6                	mov    esi,eax
  1349b2:	48 89 d7             	mov    rdi,rdx
  1349b5:	e8 18 16 00 00       	call   135fd2 <sys_open>
  1349ba:	e9 2a 01 00 00       	jmp    134ae9 <syscall+0x23e>
  1349bf:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  1349c2:	89 c7                	mov    edi,eax
  1349c4:	e8 d2 1a 00 00       	call   13649b <sys_close>
  1349c9:	e9 1b 01 00 00       	jmp    134ae9 <syscall+0x23e>
  1349ce:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  1349d1:	48 98                	cdqe   
  1349d3:	48 89 c1             	mov    rcx,rax
  1349d6:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  1349d9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  1349dc:	48 89 ce             	mov    rsi,rcx
  1349df:	89 c7                	mov    edi,eax
  1349e1:	e8 cb 1b 00 00       	call   1365b1 <sys_read>
  1349e6:	e9 fe 00 00 00       	jmp    134ae9 <syscall+0x23e>
  1349eb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  1349ee:	48 98                	cdqe   
  1349f0:	48 89 c1             	mov    rcx,rax
  1349f3:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  1349f6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  1349f9:	48 89 ce             	mov    rsi,rcx
  1349fc:	89 c7                	mov    edi,eax
  1349fe:	e8 1d 1b 00 00       	call   136520 <sys_write>
  134a03:	e9 e1 00 00 00       	jmp    134ae9 <syscall+0x23e>
  134a08:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  134a0b:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  134a0e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  134a11:	89 ce                	mov    esi,ecx
  134a13:	89 c7                	mov    edi,eax
  134a15:	e8 28 1c 00 00       	call   136642 <sys_seek>
  134a1a:	e9 ca 00 00 00       	jmp    134ae9 <syscall+0x23e>
  134a1f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  134a22:	89 c7                	mov    edi,eax
  134a24:	e8 60 1c 00 00       	call   136689 <sys_tell>
  134a29:	e9 bb 00 00 00       	jmp    134ae9 <syscall+0x23e>
  134a2e:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  134a31:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  134a34:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  134a37:	89 ce                	mov    esi,ecx
  134a39:	89 c7                	mov    edi,eax
  134a3b:	b8 00 00 00 00       	mov    eax,0x0
  134a40:	e8 82 14 00 00       	call   135ec7 <reg_vol>
  134a45:	e9 9f 00 00 00       	jmp    134ae9 <syscall+0x23e>
  134a4a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  134a4d:	89 c7                	mov    edi,eax
  134a4f:	b8 00 00 00 00       	mov    eax,0x0
  134a54:	e8 52 14 00 00       	call   135eab <free_vol>
  134a59:	e9 8b 00 00 00       	jmp    134ae9 <syscall+0x23e>
  134a5e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  134a61:	48 98                	cdqe   
  134a63:	48 89 c7             	mov    rdi,rax
  134a66:	e8 27 48 00 00       	call   139292 <execute>
  134a6b:	eb 7c                	jmp    134ae9 <syscall+0x23e>
  134a6d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  134a70:	89 c7                	mov    edi,eax
  134a72:	e8 a4 40 00 00       	call   138b1b <sys_exit>
  134a77:	eb 70                	jmp    134ae9 <syscall+0x23e>
  134a79:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  134a7c:	48 98                	cdqe   
  134a7e:	48 89 c7             	mov    rdi,rax
  134a81:	e8 07 49 00 00       	call   13938d <exec_call>
  134a86:	eb 61                	jmp    134ae9 <syscall+0x23e>
  134a88:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  134a8b:	89 c7                	mov    edi,eax
  134a8d:	e8 ba 12 00 00       	call   135d4c <sys_mkfifo>
  134a92:	eb 55                	jmp    134ae9 <syscall+0x23e>
  134a94:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  134a97:	89 c7                	mov    edi,eax
  134a99:	e8 5a 42 00 00       	call   138cf8 <sys_malloc>
  134a9e:	eb 49                	jmp    134ae9 <syscall+0x23e>
  134aa0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  134aa3:	89 c7                	mov    edi,eax
  134aa5:	e8 dc 43 00 00       	call   138e86 <sys_free>
  134aaa:	eb 3d                	jmp    134ae9 <syscall+0x23e>
  134aac:	b8 00 00 00 00       	mov    eax,0x0
  134ab1:	e8 d7 53 00 00       	call   139e8d <sys_getkbc>
  134ab6:	0f be c0             	movsx  eax,al
  134ab9:	eb 2e                	jmp    134ae9 <syscall+0x23e>
  134abb:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  134abe:	48 98                	cdqe   
  134ac0:	48 89 c7             	mov    rdi,rax
  134ac3:	e8 b0 28 00 00       	call   137378 <sys_find_dev>
  134ac8:	eb 1f                	jmp    134ae9 <syscall+0x23e>
  134aca:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  134acd:	48 98                	cdqe   
  134acf:	48 89 c2             	mov    rdx,rax
  134ad2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  134ad5:	48 98                	cdqe   
  134ad7:	48 89 c1             	mov    rcx,rax
  134ada:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  134add:	89 c6                	mov    esi,eax
  134adf:	48 89 cf             	mov    rdi,rcx
  134ae2:	e8 23 29 00 00       	call   13740a <sys_operate_dev>
  134ae7:	eb 00                	jmp    134ae9 <syscall+0x23e>
  134ae9:	c9                   	leave  
  134aea:	c3                   	ret    

0000000000134aeb <main>:
  134aeb:	f3 0f 1e fa          	endbr64 
  134aef:	55                   	push   rbp
  134af0:	48 89 e5             	mov    rbp,rsp
  134af3:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  134af7:	48 89 7d 88          	mov    QWORD PTR [rbp-0x78],rdi
  134afb:	48 89 75 80          	mov    QWORD PTR [rbp-0x80],rsi
  134aff:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  134b03:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  134b07:	b8 00 00 00 00       	mov    eax,0x0
  134b0c:	e8 42 06 00 00       	call   135153 <init_logging>
  134b11:	b8 d6 50 52 e8       	mov    eax,0xe85250d6
  134b16:	48 39 45 88          	cmp    QWORD PTR [rbp-0x78],rax
  134b1a:	74 0f                	je     134b2b <main+0x40>
  134b1c:	bf 88 e1 13 00       	mov    edi,0x13e188
  134b21:	b8 00 00 00 00       	mov    eax,0x0
  134b26:	e8 35 08 00 00       	call   135360 <printf>
  134b2b:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  134b2f:	8b 00                	mov    eax,DWORD PTR [rax]
  134b31:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
  134b34:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  134b37:	89 c6                	mov    esi,eax
  134b39:	bf b2 e1 13 00       	mov    edi,0x13e1b2
  134b3e:	b8 00 00 00 00       	mov    eax,0x0
  134b43:	e8 18 08 00 00       	call   135360 <printf>
  134b48:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  134b4c:	48 83 c0 08          	add    rax,0x8
  134b50:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  134b54:	e9 2d 05 00 00       	jmp    135086 <main+0x59b>
  134b59:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  134b5d:	8b 50 04             	mov    edx,DWORD PTR [rax+0x4]
  134b60:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  134b64:	8b 00                	mov    eax,DWORD PTR [rax]
  134b66:	89 c6                	mov    esi,eax
  134b68:	bf cb e1 13 00       	mov    edi,0x13e1cb
  134b6d:	b8 00 00 00 00       	mov    eax,0x0
  134b72:	e8 e9 07 00 00       	call   135360 <printf>
  134b77:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  134b7b:	8b 00                	mov    eax,DWORD PTR [rax]
  134b7d:	83 f8 08             	cmp    eax,0x8
  134b80:	0f 87 ed 04 00 00    	ja     135073 <main+0x588>
  134b86:	89 c0                	mov    eax,eax
  134b88:	48 8b 04 c5 40 e3 13 	mov    rax,QWORD PTR [rax*8+0x13e340]
  134b8f:	00 
  134b90:	3e ff e0             	notrack jmp rax
  134b93:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  134b97:	48 83 c0 08          	add    rax,0x8
  134b9b:	48 89 c6             	mov    rsi,rax
  134b9e:	bf e0 e1 13 00       	mov    edi,0x13e1e0
  134ba3:	b8 00 00 00 00       	mov    eax,0x0
  134ba8:	e8 b3 07 00 00       	call   135360 <printf>
  134bad:	e9 c1 04 00 00       	jmp    135073 <main+0x588>
  134bb2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  134bb6:	48 83 c0 08          	add    rax,0x8
  134bba:	48 89 c6             	mov    rsi,rax
  134bbd:	bf f3 e1 13 00       	mov    edi,0x13e1f3
  134bc2:	b8 00 00 00 00       	mov    eax,0x0
  134bc7:	e8 94 07 00 00       	call   135360 <printf>
  134bcc:	e9 a2 04 00 00       	jmp    135073 <main+0x588>
  134bd1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  134bd5:	48 8d 48 10          	lea    rcx,[rax+0x10]
  134bd9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  134bdd:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  134be0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  134be4:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  134be7:	89 c6                	mov    esi,eax
  134be9:	bf 10 e2 13 00       	mov    edi,0x13e210
  134bee:	b8 00 00 00 00       	mov    eax,0x0
  134bf3:	e8 68 07 00 00       	call   135360 <printf>
  134bf8:	e9 76 04 00 00       	jmp    135073 <main+0x588>
  134bfd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  134c01:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  134c04:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  134c08:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  134c0b:	89 c6                	mov    esi,eax
  134c0d:	bf 38 e2 13 00       	mov    edi,0x13e238
  134c12:	b8 00 00 00 00       	mov    eax,0x0
  134c17:	e8 44 07 00 00       	call   135360 <printf>
  134c1c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  134c20:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  134c23:	89 c7                	mov    edi,eax
  134c25:	e8 8e 09 00 00       	call   1355b8 <set_high_mem_base>
  134c2a:	e9 44 04 00 00       	jmp    135073 <main+0x588>
  134c2f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  134c33:	8b 48 10             	mov    ecx,DWORD PTR [rax+0x10]
  134c36:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  134c3a:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  134c3d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  134c41:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  134c44:	89 c6                	mov    esi,eax
  134c46:	bf 5c e2 13 00       	mov    edi,0x13e25c
  134c4b:	b8 00 00 00 00       	mov    eax,0x0
  134c50:	e8 0b 07 00 00       	call   135360 <printf>
  134c55:	e9 19 04 00 00       	jmp    135073 <main+0x588>
  134c5a:	bf 74 e2 13 00       	mov    edi,0x13e274
  134c5f:	b8 00 00 00 00       	mov    eax,0x0
  134c64:	e8 f7 06 00 00       	call   135360 <printf>
  134c69:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  134c6d:	48 83 c0 10          	add    rax,0x10
  134c71:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  134c75:	e9 fe 00 00 00       	jmp    134d78 <main+0x28d>
  134c7a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  134c7e:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  134c81:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  134c85:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  134c89:	89 c7                	mov    edi,eax
  134c8b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  134c8f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  134c93:	48 c1 e8 20          	shr    rax,0x20
  134c97:	89 c1                	mov    ecx,eax
  134c99:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  134c9d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  134ca0:	89 c6                	mov    esi,eax
  134ca2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  134ca6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  134ca9:	48 c1 e8 20          	shr    rax,0x20
  134cad:	41 89 d1             	mov    r9d,edx
  134cb0:	41 89 f8             	mov    r8d,edi
  134cb3:	89 f2                	mov    edx,esi
  134cb5:	89 c6                	mov    esi,eax
  134cb7:	bf 80 e2 13 00       	mov    edi,0x13e280
  134cbc:	b8 00 00 00 00       	mov    eax,0x0
  134cc1:	e8 9a 06 00 00       	call   135360 <printf>
  134cc6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  134cca:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  134ccd:	89 c2                	mov    edx,eax
  134ccf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  134cd3:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  134cd7:	89 c1                	mov    ecx,eax
  134cd9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  134cdd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  134ce0:	89 ce                	mov    esi,ecx
  134ce2:	89 c7                	mov    edi,eax
  134ce4:	e8 e6 08 00 00       	call   1355cf <set_mem_area>
  134ce9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  134ced:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  134cf0:	83 f8 05             	cmp    eax,0x5
  134cf3:	74 4e                	je     134d43 <main+0x258>
  134cf5:	83 f8 05             	cmp    eax,0x5
  134cf8:	77 5a                	ja     134d54 <main+0x269>
  134cfa:	83 f8 04             	cmp    eax,0x4
  134cfd:	74 33                	je     134d32 <main+0x247>
  134cff:	83 f8 04             	cmp    eax,0x4
  134d02:	77 50                	ja     134d54 <main+0x269>
  134d04:	83 f8 01             	cmp    eax,0x1
  134d07:	74 07                	je     134d10 <main+0x225>
  134d09:	83 f8 03             	cmp    eax,0x3
  134d0c:	74 13                	je     134d21 <main+0x236>
  134d0e:	eb 44                	jmp    134d54 <main+0x269>
  134d10:	bf b3 e2 13 00       	mov    edi,0x13e2b3
  134d15:	b8 00 00 00 00       	mov    eax,0x0
  134d1a:	e8 41 06 00 00       	call   135360 <printf>
  134d1f:	eb 43                	jmp    134d64 <main+0x279>
  134d21:	bf c2 e2 13 00       	mov    edi,0x13e2c2
  134d26:	b8 00 00 00 00       	mov    eax,0x0
  134d2b:	e8 30 06 00 00       	call   135360 <printf>
  134d30:	eb 32                	jmp    134d64 <main+0x279>
  134d32:	bf d0 e2 13 00       	mov    edi,0x13e2d0
  134d37:	b8 00 00 00 00       	mov    eax,0x0
  134d3c:	e8 1f 06 00 00       	call   135360 <printf>
  134d41:	eb 21                	jmp    134d64 <main+0x279>
  134d43:	bf 00 e3 13 00       	mov    edi,0x13e300
  134d48:	b8 00 00 00 00       	mov    eax,0x0
  134d4d:	e8 0e 06 00 00       	call   135360 <printf>
  134d52:	eb 10                	jmp    134d64 <main+0x279>
  134d54:	bf 0e e3 13 00       	mov    edi,0x13e30e
  134d59:	b8 00 00 00 00       	mov    eax,0x0
  134d5e:	e8 fd 05 00 00       	call   135360 <printf>
  134d63:	90                   	nop
  134d64:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  134d68:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  134d6b:	89 c2                	mov    edx,eax
  134d6d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  134d71:	48 01 d0             	add    rax,rdx
  134d74:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  134d78:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  134d7c:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  134d7f:	89 c2                	mov    edx,eax
  134d81:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  134d85:	48 01 d0             	add    rax,rdx
  134d88:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  134d8c:	0f 82 e8 fe ff ff    	jb     134c7a <main+0x18f>
  134d92:	e9 dc 02 00 00       	jmp    135073 <main+0x588>
  134d97:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  134d9b:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  134d9f:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  134da3:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  134da7:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  134dab:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  134daf:	0f b6 40 1d          	movzx  eax,BYTE PTR [rax+0x1d]
  134db3:	0f b6 c0             	movzx  eax,al
  134db6:	83 f8 02             	cmp    eax,0x2
  134db9:	0f 84 5a 01 00 00    	je     134f19 <main+0x42e>
  134dbf:	83 f8 02             	cmp    eax,0x2
  134dc2:	0f 8f 5a 01 00 00    	jg     134f22 <main+0x437>
  134dc8:	85 c0                	test   eax,eax
  134dca:	74 0e                	je     134dda <main+0x2ef>
  134dcc:	83 f8 01             	cmp    eax,0x1
  134dcf:	0f 84 15 01 00 00    	je     134eea <main+0x3ff>
  134dd5:	e9 48 01 00 00       	jmp    134f22 <main+0x437>
  134dda:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  134dde:	48 83 c0 22          	add    rax,0x22
  134de2:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  134de6:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  134ded:	c7 45 e4 00 00 04 00 	mov    DWORD PTR [rbp-0x1c],0x40000
  134df4:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  134dfb:	e9 d4 00 00 00       	jmp    134ed4 <main+0x3e9>
  134e00:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  134e03:	48 89 d0             	mov    rax,rdx
  134e06:	48 01 c0             	add    rax,rax
  134e09:	48 01 c2             	add    rdx,rax
  134e0c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  134e10:	48 01 d0             	add    rax,rdx
  134e13:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  134e17:	0f b6 c0             	movzx  eax,al
  134e1a:	ba ff 00 00 00       	mov    edx,0xff
  134e1f:	89 d1                	mov    ecx,edx
  134e21:	29 c1                	sub    ecx,eax
  134e23:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  134e26:	48 89 d0             	mov    rax,rdx
  134e29:	48 01 c0             	add    rax,rax
  134e2c:	48 01 c2             	add    rdx,rax
  134e2f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  134e33:	48 01 d0             	add    rax,rdx
  134e36:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  134e3a:	0f b6 d0             	movzx  edx,al
  134e3d:	b8 ff 00 00 00       	mov    eax,0xff
  134e42:	29 d0                	sub    eax,edx
  134e44:	89 ce                	mov    esi,ecx
  134e46:	0f af f0             	imul   esi,eax
  134e49:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  134e4c:	48 89 d0             	mov    rax,rdx
  134e4f:	48 01 c0             	add    rax,rax
  134e52:	48 01 c2             	add    rdx,rax
  134e55:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  134e59:	48 01 d0             	add    rax,rdx
  134e5c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  134e5f:	0f b6 c8             	movzx  ecx,al
  134e62:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  134e65:	48 89 d0             	mov    rax,rdx
  134e68:	48 01 c0             	add    rax,rax
  134e6b:	48 01 c2             	add    rdx,rax
  134e6e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  134e72:	48 01 d0             	add    rax,rdx
  134e75:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  134e78:	0f b6 c0             	movzx  eax,al
  134e7b:	0f af c1             	imul   eax,ecx
  134e7e:	01 c6                	add    esi,eax
  134e80:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  134e83:	48 89 d0             	mov    rax,rdx
  134e86:	48 01 c0             	add    rax,rax
  134e89:	48 01 c2             	add    rdx,rax
  134e8c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  134e90:	48 01 d0             	add    rax,rdx
  134e93:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  134e97:	0f b6 c8             	movzx  ecx,al
  134e9a:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  134e9d:	48 89 d0             	mov    rax,rdx
  134ea0:	48 01 c0             	add    rax,rax
  134ea3:	48 01 c2             	add    rdx,rax
  134ea6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  134eaa:	48 01 d0             	add    rax,rdx
  134ead:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  134eb1:	0f b6 c0             	movzx  eax,al
  134eb4:	0f af c1             	imul   eax,ecx
  134eb7:	01 f0                	add    eax,esi
  134eb9:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
  134ebc:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  134ebf:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  134ec2:	73 0c                	jae    134ed0 <main+0x3e5>
  134ec4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  134ec7:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  134eca:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  134ecd:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
  134ed0:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  134ed4:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  134ed8:	0f b7 40 20          	movzx  eax,WORD PTR [rax+0x20]
  134edc:	0f b7 c0             	movzx  eax,ax
  134edf:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  134ee2:	0f 82 18 ff ff ff    	jb     134e00 <main+0x315>
  134ee8:	eb 40                	jmp    134f2a <main+0x43f>
  134eea:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  134eee:	0f b6 40 25          	movzx  eax,BYTE PTR [rax+0x25]
  134ef2:	0f b6 c0             	movzx  eax,al
  134ef5:	ba 01 00 00 00       	mov    edx,0x1
  134efa:	89 c1                	mov    ecx,eax
  134efc:	d3 e2                	shl    edx,cl
  134efe:	89 d0                	mov    eax,edx
  134f00:	8d 50 ff             	lea    edx,[rax-0x1]
  134f03:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  134f07:	0f b6 40 24          	movzx  eax,BYTE PTR [rax+0x24]
  134f0b:	0f b6 c0             	movzx  eax,al
  134f0e:	89 c1                	mov    ecx,eax
  134f10:	d3 e2                	shl    edx,cl
  134f12:	89 d0                	mov    eax,edx
  134f14:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  134f17:	eb 11                	jmp    134f2a <main+0x43f>
  134f19:	c7 45 ec 5c 01 00 00 	mov    DWORD PTR [rbp-0x14],0x15c
  134f20:	eb 08                	jmp    134f2a <main+0x43f>
  134f22:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  134f29:	90                   	nop
  134f2a:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  134f31:	e9 20 01 00 00       	jmp    135056 <main+0x56b>
  134f36:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  134f3a:	0f b6 40 1c          	movzx  eax,BYTE PTR [rax+0x1c]
  134f3e:	0f b6 c0             	movzx  eax,al
  134f41:	83 f8 20             	cmp    eax,0x20
  134f44:	0f 84 db 00 00 00    	je     135025 <main+0x53a>
  134f4a:	83 f8 20             	cmp    eax,0x20
  134f4d:	0f 8f ff 00 00 00    	jg     135052 <main+0x567>
  134f53:	83 f8 18             	cmp    eax,0x18
  134f56:	0f 84 83 00 00 00    	je     134fdf <main+0x4f4>
  134f5c:	83 f8 18             	cmp    eax,0x18
  134f5f:	0f 8f ed 00 00 00    	jg     135052 <main+0x567>
  134f65:	83 f8 08             	cmp    eax,0x8
  134f68:	74 17                	je     134f81 <main+0x496>
  134f6a:	83 f8 08             	cmp    eax,0x8
  134f6d:	0f 8c df 00 00 00    	jl     135052 <main+0x567>
  134f73:	83 e8 0f             	sub    eax,0xf
  134f76:	83 f8 01             	cmp    eax,0x1
  134f79:	0f 87 d3 00 00 00    	ja     135052 <main+0x567>
  134f7f:	eb 2e                	jmp    134faf <main+0x4c4>
  134f81:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  134f85:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  134f88:	0f af 45 e8          	imul   eax,DWORD PTR [rbp-0x18]
  134f8c:	89 c2                	mov    edx,eax
  134f8e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  134f91:	48 01 c2             	add    rdx,rax
  134f94:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  134f98:	48 01 d0             	add    rax,rdx
  134f9b:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  134f9f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  134fa2:	89 c2                	mov    edx,eax
  134fa4:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  134fa8:	88 10                	mov    BYTE PTR [rax],dl
  134faa:	e9 a3 00 00 00       	jmp    135052 <main+0x567>
  134faf:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  134fb3:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  134fb6:	0f af 45 e8          	imul   eax,DWORD PTR [rbp-0x18]
  134fba:	89 c2                	mov    edx,eax
  134fbc:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  134fbf:	01 c0                	add    eax,eax
  134fc1:	89 c0                	mov    eax,eax
  134fc3:	48 01 c2             	add    rdx,rax
  134fc6:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  134fca:	48 01 d0             	add    rax,rdx
  134fcd:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
  134fd1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  134fd4:	89 c2                	mov    edx,eax
  134fd6:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  134fda:	66 89 10             	mov    WORD PTR [rax],dx
  134fdd:	eb 73                	jmp    135052 <main+0x567>
  134fdf:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  134fe3:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  134fe6:	0f af 45 e8          	imul   eax,DWORD PTR [rbp-0x18]
  134fea:	89 c1                	mov    ecx,eax
  134fec:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  134fef:	89 d0                	mov    eax,edx
  134ff1:	01 c0                	add    eax,eax
  134ff3:	01 d0                	add    eax,edx
  134ff5:	89 c0                	mov    eax,eax
  134ff7:	48 8d 14 01          	lea    rdx,[rcx+rax*1]
  134ffb:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  134fff:	48 01 d0             	add    rax,rdx
  135002:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  135006:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  135009:	25 ff ff ff 00       	and    eax,0xffffff
  13500e:	89 c2                	mov    edx,eax
  135010:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  135014:	8b 00                	mov    eax,DWORD PTR [rax]
  135016:	25 00 00 00 ff       	and    eax,0xff000000
  13501b:	09 c2                	or     edx,eax
  13501d:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  135021:	89 10                	mov    DWORD PTR [rax],edx
  135023:	eb 2d                	jmp    135052 <main+0x567>
  135025:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  135029:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  13502c:	0f af 45 e8          	imul   eax,DWORD PTR [rbp-0x18]
  135030:	89 c2                	mov    edx,eax
  135032:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  135035:	c1 e0 02             	shl    eax,0x2
  135038:	89 c0                	mov    eax,eax
  13503a:	48 01 c2             	add    rdx,rax
  13503d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  135041:	48 01 d0             	add    rax,rdx
  135044:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
  135048:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  13504c:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  13504f:	89 10                	mov    DWORD PTR [rax],edx
  135051:	90                   	nop
  135052:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  135056:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  13505a:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  13505d:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  135060:	73 10                	jae    135072 <main+0x587>
  135062:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  135066:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  135069:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  13506c:	0f 82 c4 fe ff ff    	jb     134f36 <main+0x44b>
  135072:	90                   	nop
  135073:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  135077:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  13507a:	83 c0 07             	add    eax,0x7
  13507d:	89 c0                	mov    eax,eax
  13507f:	83 e0 f8             	and    eax,0xfffffff8
  135082:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
  135086:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13508a:	8b 00                	mov    eax,DWORD PTR [rax]
  13508c:	85 c0                	test   eax,eax
  13508e:	0f 85 c5 fa ff ff    	jne    134b59 <main+0x6e>
  135094:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  135098:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  13509b:	83 c0 07             	add    eax,0x7
  13509e:	89 c0                	mov    eax,eax
  1350a0:	83 e0 f8             	and    eax,0xfffffff8
  1350a3:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
  1350a7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1350ab:	89 c0                	mov    eax,eax
  1350ad:	48 2b 45 80          	sub    rax,QWORD PTR [rbp-0x80]
  1350b1:	48 89 c6             	mov    rsi,rax
  1350b4:	bf 1c e3 13 00       	mov    edi,0x13e31c
  1350b9:	b8 00 00 00 00       	mov    eax,0x0
  1350be:	e8 9d 02 00 00       	call   135360 <printf>
  1350c3:	b8 75 04 00 00       	mov    eax,0x475
  1350c8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  1350cb:	88 45 d3             	mov    BYTE PTR [rbp-0x2d],al
  1350ce:	0f be 45 d3          	movsx  eax,BYTE PTR [rbp-0x2d]
  1350d2:	89 c6                	mov    esi,eax
  1350d4:	bf 31 e3 13 00       	mov    edi,0x13e331
  1350d9:	b8 00 00 00 00       	mov    eax,0x0
  1350de:	e8 7d 02 00 00       	call   135360 <printf>
  1350e3:	b8 00 00 00 00       	mov    eax,0x0
  1350e8:	e8 52 04 00 00       	call   13553f <init_paging>
  1350ed:	b8 00 00 00 00       	mov    eax,0x0
  1350f2:	e8 d6 3e 00 00       	call   138fcd <init_gdt>
  1350f7:	b8 00 00 00 00       	mov    eax,0x0
  1350fc:	e8 9f f2 ff ff       	call   1343a0 <init_int>
  135101:	b8 00 00 00 00       	mov    eax,0x0
  135106:	e8 79 07 00 00       	call   135884 <init_memory>
  13510b:	b8 00 00 00 00       	mov    eax,0x0
  135110:	e8 11 1e 00 00       	call   136f26 <init_drvdev_man>
  135115:	b8 00 00 00 00       	mov    eax,0x0
  13511a:	e8 f2 2c 00 00       	call   137e11 <init_proc>
  13511f:	b8 00 00 00 00       	mov    eax,0x0
  135124:	e8 59 7a 00 00       	call   13cb82 <init_tty>
  135129:	b8 00 00 00 00       	mov    eax,0x0
  13512e:	e8 64 4c 00 00       	call   139d97 <init_kb>
  135133:	b8 00 00 00 00       	mov    eax,0x0
  135138:	e8 b4 4d 00 00       	call   139ef1 <init_disk>
  13513d:	b8 00 00 00 00       	mov    eax,0x0
  135142:	e8 78 1d 00 00       	call   136ebf <init_vfs>
  135147:	c7 05 cf 8a 00 00 00 	mov    DWORD PTR [rip+0x8acf],0x0        # 13dc20 <manage_proc_lock>
  13514e:	00 00 00 
  135151:	eb fe                	jmp    135151 <main+0x666>

0000000000135153 <init_logging>:
  135153:	f3 0f 1e fa          	endbr64 
  135157:	55                   	push   rbp
  135158:	48 89 e5             	mov    rbp,rsp
  13515b:	48 c7 05 62 df fc ff 	mov    QWORD PTR [rip+0xfffffffffffcdf62],0xb8000        # 1030c8 <video>
  135162:	00 80 0b 00 
  135166:	c7 05 60 df fc ff 00 	mov    DWORD PTR [rip+0xfffffffffffcdf60],0x0        # 1030d0 <xpos>
  13516d:	00 00 00 
  135170:	c7 05 5a df fc ff 00 	mov    DWORD PTR [rip+0xfffffffffffcdf5a],0x0        # 1030d4 <ypos>
  135177:	00 00 00 
  13517a:	90                   	nop
  13517b:	5d                   	pop    rbp
  13517c:	c3                   	ret    

000000000013517d <itoa>:
  13517d:	f3 0f 1e fa          	endbr64 
  135181:	55                   	push   rbp
  135182:	48 89 e5             	mov    rbp,rsp
  135185:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  135189:	89 75 c4             	mov    DWORD PTR [rbp-0x3c],esi
  13518c:	89 55 c0             	mov    DWORD PTR [rbp-0x40],edx
  13518f:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  135193:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  135197:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  13519a:	48 98                	cdqe   
  13519c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  1351a0:	c7 45 dc 0a 00 00 00 	mov    DWORD PTR [rbp-0x24],0xa
  1351a7:	83 7d c4 64          	cmp    DWORD PTR [rbp-0x3c],0x64
  1351ab:	75 27                	jne    1351d4 <itoa+0x57>
  1351ad:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
  1351b1:	79 21                	jns    1351d4 <itoa+0x57>
  1351b3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1351b7:	48 8d 50 01          	lea    rdx,[rax+0x1]
  1351bb:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  1351bf:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
  1351c2:	48 83 45 c8 01       	add    QWORD PTR [rbp-0x38],0x1
  1351c7:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  1351ca:	f7 d8                	neg    eax
  1351cc:	48 98                	cdqe   
  1351ce:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  1351d2:	eb 0d                	jmp    1351e1 <itoa+0x64>
  1351d4:	83 7d c4 78          	cmp    DWORD PTR [rbp-0x3c],0x78
  1351d8:	75 07                	jne    1351e1 <itoa+0x64>
  1351da:	c7 45 dc 10 00 00 00 	mov    DWORD PTR [rbp-0x24],0x10
  1351e1:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  1351e4:	48 63 c8             	movsxd rcx,eax
  1351e7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  1351eb:	ba 00 00 00 00       	mov    edx,0x0
  1351f0:	48 f7 f1             	div    rcx
  1351f3:	48 89 d0             	mov    rax,rdx
  1351f6:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
  1351f9:	83 7d d8 09          	cmp    DWORD PTR [rbp-0x28],0x9
  1351fd:	7f 0a                	jg     135209 <itoa+0x8c>
  1351ff:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  135202:	83 c0 30             	add    eax,0x30
  135205:	89 c1                	mov    ecx,eax
  135207:	eb 08                	jmp    135211 <itoa+0x94>
  135209:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  13520c:	83 c0 57             	add    eax,0x57
  13520f:	89 c1                	mov    ecx,eax
  135211:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  135215:	48 8d 50 01          	lea    rdx,[rax+0x1]
  135219:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  13521d:	88 08                	mov    BYTE PTR [rax],cl
  13521f:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  135222:	48 63 f0             	movsxd rsi,eax
  135225:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  135229:	ba 00 00 00 00       	mov    edx,0x0
  13522e:	48 f7 f6             	div    rsi
  135231:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  135235:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  13523a:	75 a5                	jne    1351e1 <itoa+0x64>
  13523c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  135240:	c6 00 00             	mov    BYTE PTR [rax],0x0
  135243:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  135247:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  13524b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13524f:	48 83 e8 01          	sub    rax,0x1
  135253:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  135257:	eb 2b                	jmp    135284 <itoa+0x107>
  135259:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  13525d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  135260:	88 45 d7             	mov    BYTE PTR [rbp-0x29],al
  135263:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  135267:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  13526a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  13526e:	88 10                	mov    BYTE PTR [rax],dl
  135270:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  135274:	0f b6 55 d7          	movzx  edx,BYTE PTR [rbp-0x29]
  135278:	88 10                	mov    BYTE PTR [rax],dl
  13527a:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  13527f:	48 83 6d e8 01       	sub    QWORD PTR [rbp-0x18],0x1
  135284:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  135288:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
  13528c:	72 cb                	jb     135259 <itoa+0xdc>
  13528e:	90                   	nop
  13528f:	90                   	nop
  135290:	5d                   	pop    rbp
  135291:	c3                   	ret    

0000000000135292 <putchar>:
  135292:	f3 0f 1e fa          	endbr64 
  135296:	55                   	push   rbp
  135297:	48 89 e5             	mov    rbp,rsp
  13529a:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  13529d:	83 7d fc 0a          	cmp    DWORD PTR [rbp-0x4],0xa
  1352a1:	74 06                	je     1352a9 <putchar+0x17>
  1352a3:	83 7d fc 0d          	cmp    DWORD PTR [rbp-0x4],0xd
  1352a7:	75 38                	jne    1352e1 <putchar+0x4f>
  1352a9:	90                   	nop
  1352aa:	eb 01                	jmp    1352ad <putchar+0x1b>
  1352ac:	90                   	nop
  1352ad:	c7 05 19 de fc ff 00 	mov    DWORD PTR [rip+0xfffffffffffcde19],0x0        # 1030d0 <xpos>
  1352b4:	00 00 00 
  1352b7:	8b 05 17 de fc ff    	mov    eax,DWORD PTR [rip+0xfffffffffffcde17]        # 1030d4 <ypos>
  1352bd:	83 c0 01             	add    eax,0x1
  1352c0:	89 05 0e de fc ff    	mov    DWORD PTR [rip+0xfffffffffffcde0e],eax        # 1030d4 <ypos>
  1352c6:	8b 05 08 de fc ff    	mov    eax,DWORD PTR [rip+0xfffffffffffcde08]        # 1030d4 <ypos>
  1352cc:	83 f8 17             	cmp    eax,0x17
  1352cf:	0f 8e 88 00 00 00    	jle    13535d <putchar+0xcb>
  1352d5:	c7 05 f5 dd fc ff 00 	mov    DWORD PTR [rip+0xfffffffffffcddf5],0x0        # 1030d4 <ypos>
  1352dc:	00 00 00 
  1352df:	eb 7c                	jmp    13535d <putchar+0xcb>
  1352e1:	48 8b 0d e0 dd fc ff 	mov    rcx,QWORD PTR [rip+0xfffffffffffcdde0]        # 1030c8 <video>
  1352e8:	8b 15 e6 dd fc ff    	mov    edx,DWORD PTR [rip+0xfffffffffffcdde6]        # 1030d4 <ypos>
  1352ee:	89 d0                	mov    eax,edx
  1352f0:	c1 e0 02             	shl    eax,0x2
  1352f3:	01 d0                	add    eax,edx
  1352f5:	c1 e0 04             	shl    eax,0x4
  1352f8:	89 c2                	mov    edx,eax
  1352fa:	8b 05 d0 dd fc ff    	mov    eax,DWORD PTR [rip+0xfffffffffffcddd0]        # 1030d0 <xpos>
  135300:	01 d0                	add    eax,edx
  135302:	01 c0                	add    eax,eax
  135304:	48 98                	cdqe   
  135306:	48 01 c8             	add    rax,rcx
  135309:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  13530c:	88 10                	mov    BYTE PTR [rax],dl
  13530e:	48 8b 0d b3 dd fc ff 	mov    rcx,QWORD PTR [rip+0xfffffffffffcddb3]        # 1030c8 <video>
  135315:	8b 15 b9 dd fc ff    	mov    edx,DWORD PTR [rip+0xfffffffffffcddb9]        # 1030d4 <ypos>
  13531b:	89 d0                	mov    eax,edx
  13531d:	c1 e0 02             	shl    eax,0x2
  135320:	01 d0                	add    eax,edx
  135322:	c1 e0 04             	shl    eax,0x4
  135325:	89 c2                	mov    edx,eax
  135327:	8b 05 a3 dd fc ff    	mov    eax,DWORD PTR [rip+0xfffffffffffcdda3]        # 1030d0 <xpos>
  13532d:	01 d0                	add    eax,edx
  13532f:	01 c0                	add    eax,eax
  135331:	48 98                	cdqe   
  135333:	48 83 c0 01          	add    rax,0x1
  135337:	48 01 c8             	add    rax,rcx
  13533a:	c6 00 07             	mov    BYTE PTR [rax],0x7
  13533d:	8b 05 8d dd fc ff    	mov    eax,DWORD PTR [rip+0xfffffffffffcdd8d]        # 1030d0 <xpos>
  135343:	83 c0 01             	add    eax,0x1
  135346:	89 05 84 dd fc ff    	mov    DWORD PTR [rip+0xfffffffffffcdd84],eax        # 1030d0 <xpos>
  13534c:	8b 05 7e dd fc ff    	mov    eax,DWORD PTR [rip+0xfffffffffffcdd7e]        # 1030d0 <xpos>
  135352:	83 f8 4f             	cmp    eax,0x4f
  135355:	0f 8f 51 ff ff ff    	jg     1352ac <putchar+0x1a>
  13535b:	eb 01                	jmp    13535e <putchar+0xcc>
  13535d:	90                   	nop
  13535e:	5d                   	pop    rbp
  13535f:	c3                   	ret    

0000000000135360 <printf>:
  135360:	f3 0f 1e fa          	endbr64 
  135364:	55                   	push   rbp
  135365:	48 89 e5             	mov    rbp,rsp
  135368:	48 81 ec f0 00 00 00 	sub    rsp,0xf0
  13536f:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
  135376:	48 89 b5 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rsi
  13537d:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  135384:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  13538b:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  135392:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  135399:	84 c0                	test   al,al
  13539b:	74 20                	je     1353bd <printf+0x5d>
  13539d:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  1353a1:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  1353a5:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  1353a9:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  1353ad:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  1353b1:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  1353b5:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  1353b9:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7
  1353bd:	48 8d 85 18 ff ff ff 	lea    rax,[rbp-0xe8]
  1353c4:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
  1353cb:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x8
  1353d2:	08 
  1353d3:	e9 38 01 00 00       	jmp    135510 <printf+0x1b0>
  1353d8:	83 bd 3c ff ff ff 25 	cmp    DWORD PTR [rbp-0xc4],0x25
  1353df:	74 12                	je     1353f3 <printf+0x93>
  1353e1:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  1353e7:	89 c7                	mov    edi,eax
  1353e9:	e8 a4 fe ff ff       	call   135292 <putchar>
  1353ee:	e9 1d 01 00 00       	jmp    135510 <printf+0x1b0>
  1353f3:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  1353fa:	48 8d 50 01          	lea    rdx,[rax+0x1]
  1353fe:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  135405:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  135408:	0f be c0             	movsx  eax,al
  13540b:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
  135411:	83 bd 3c ff ff ff 78 	cmp    DWORD PTR [rbp-0xc4],0x78
  135418:	74 3a                	je     135454 <printf+0xf4>
  13541a:	83 bd 3c ff ff ff 78 	cmp    DWORD PTR [rbp-0xc4],0x78
  135421:	0f 8f cd 00 00 00    	jg     1354f4 <printf+0x194>
  135427:	83 bd 3c ff ff ff 75 	cmp    DWORD PTR [rbp-0xc4],0x75
  13542e:	74 24                	je     135454 <printf+0xf4>
  135430:	83 bd 3c ff ff ff 75 	cmp    DWORD PTR [rbp-0xc4],0x75
  135437:	0f 8f b7 00 00 00    	jg     1354f4 <printf+0x194>
  13543d:	83 bd 3c ff ff ff 64 	cmp    DWORD PTR [rbp-0xc4],0x64
  135444:	74 0e                	je     135454 <printf+0xf4>
  135446:	83 bd 3c ff ff ff 73 	cmp    DWORD PTR [rbp-0xc4],0x73
  13544d:	74 40                	je     13548f <printf+0x12f>
  13544f:	e9 a0 00 00 00       	jmp    1354f4 <printf+0x194>
  135454:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  13545b:	48 8d 50 08          	lea    rdx,[rax+0x8]
  13545f:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  135466:	8b 10                	mov    edx,DWORD PTR [rax]
  135468:	8b 8d 3c ff ff ff    	mov    ecx,DWORD PTR [rbp-0xc4]
  13546e:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  135475:	89 ce                	mov    esi,ecx
  135477:	48 89 c7             	mov    rdi,rax
  13547a:	e8 fe fc ff ff       	call   13517d <itoa>
  13547f:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  135486:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
  13548d:	eb 34                	jmp    1354c3 <printf+0x163>
  13548f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  135496:	48 8d 50 08          	lea    rdx,[rax+0x8]
  13549a:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  1354a1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  1354a4:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
  1354ab:	48 83 bd 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],0x0
  1354b2:	00 
  1354b3:	75 0d                	jne    1354c2 <printf+0x162>
  1354b5:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x13e388
  1354bc:	88 e3 13 00 
  1354c0:	eb 22                	jmp    1354e4 <printf+0x184>
  1354c2:	90                   	nop
  1354c3:	eb 1f                	jmp    1354e4 <printf+0x184>
  1354c5:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  1354cc:	48 8d 50 01          	lea    rdx,[rax+0x1]
  1354d0:	48 89 95 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rdx
  1354d7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  1354da:	0f be c0             	movsx  eax,al
  1354dd:	89 c7                	mov    edi,eax
  1354df:	e8 ae fd ff ff       	call   135292 <putchar>
  1354e4:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  1354eb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  1354ee:	84 c0                	test   al,al
  1354f0:	75 d3                	jne    1354c5 <printf+0x165>
  1354f2:	eb 1c                	jmp    135510 <printf+0x1b0>
  1354f4:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  1354fb:	48 8d 50 08          	lea    rdx,[rax+0x8]
  1354ff:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  135506:	8b 00                	mov    eax,DWORD PTR [rax]
  135508:	89 c7                	mov    edi,eax
  13550a:	e8 83 fd ff ff       	call   135292 <putchar>
  13550f:	90                   	nop
  135510:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  135517:	48 8d 50 01          	lea    rdx,[rax+0x1]
  13551b:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  135522:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  135525:	0f be c0             	movsx  eax,al
  135528:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
  13552e:	83 bd 3c ff ff ff 00 	cmp    DWORD PTR [rbp-0xc4],0x0
  135535:	0f 85 9d fe ff ff    	jne    1353d8 <printf+0x78>
  13553b:	90                   	nop
  13553c:	90                   	nop
  13553d:	c9                   	leave  
  13553e:	c3                   	ret    

000000000013553f <init_paging>:
  13553f:	f3 0f 1e fa          	endbr64 
  135543:	55                   	push   rbp
  135544:	48 89 e5             	mov    rbp,rsp
  135547:	48 8b 05 ea 86 00 00 	mov    rax,QWORD PTR [rip+0x86ea]        # 13dc38 <pml4>
  13554e:	ba 07 00 00 00       	mov    edx,0x7
  135553:	be 00 10 10 00       	mov    esi,0x101000
  135558:	48 89 c7             	mov    rdi,rax
  13555b:	e8 d1 04 00 00       	call   135a31 <set_page_item>
  135560:	48 8b 05 d9 86 00 00 	mov    rax,QWORD PTR [rip+0x86d9]        # 13dc40 <pdpt>
  135567:	ba 02 00 00 00       	mov    edx,0x2
  13556c:	be 00 00 00 40       	mov    esi,0x40000000
  135571:	48 89 c7             	mov    rdi,rax
  135574:	e8 09 05 00 00       	call   135a82 <set_1gb_pdpt>
  135579:	48 8b 05 c0 86 00 00 	mov    rax,QWORD PTR [rip+0x86c0]        # 13dc40 <pdpt>
  135580:	48 83 c0 08          	add    rax,0x8
  135584:	ba 07 00 00 00       	mov    edx,0x7
  135589:	be 00 20 10 00       	mov    esi,0x102000
  13558e:	48 89 c7             	mov    rdi,rax
  135591:	e8 9b 04 00 00       	call   135a31 <set_page_item>
  135596:	0f 20 e0             	mov    rax,cr4
  135599:	48 83 c8 05          	or     rax,0x5
  13559d:	0f 22 e0             	mov    cr4,rax
  1355a0:	48 8b 05 91 86 00 00 	mov    rax,QWORD PTR [rip+0x8691]        # 13dc38 <pml4>
  1355a7:	0f 22 e0             	mov    cr4,rax
  1355aa:	0f 20 c0             	mov    rax,cr0
  1355ad:	0d 00 00 00 80       	or     eax,0x80000000
  1355b2:	0f 22 c0             	mov    cr0,rax
  1355b5:	90                   	nop
  1355b6:	5d                   	pop    rbp
  1355b7:	c3                   	ret    

00000000001355b8 <set_high_mem_base>:
  1355b8:	f3 0f 1e fa          	endbr64 
  1355bc:	55                   	push   rbp
  1355bd:	48 89 e5             	mov    rbp,rsp
  1355c0:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  1355c3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1355c6:	89 05 84 86 00 00    	mov    DWORD PTR [rip+0x8684],eax        # 13dc50 <high_mem_base>
  1355cc:	90                   	nop
  1355cd:	5d                   	pop    rbp
  1355ce:	c3                   	ret    

00000000001355cf <set_mem_area>:
  1355cf:	f3 0f 1e fa          	endbr64 
  1355d3:	55                   	push   rbp
  1355d4:	48 89 e5             	mov    rbp,rsp
  1355d7:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  1355da:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  1355dd:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  1355e0:	8b 05 0a dd fc ff    	mov    eax,DWORD PTR [rip+0xfffffffffffcdd0a]        # 1032f0 <mmap_t_i>
  1355e6:	48 63 d0             	movsxd rdx,eax
  1355e9:	48 89 d0             	mov    rax,rdx
  1355ec:	48 01 c0             	add    rax,rax
  1355ef:	48 01 d0             	add    rax,rdx
  1355f2:	48 c1 e0 02          	shl    rax,0x2
  1355f6:	48 8d 90 00 32 10 00 	lea    rdx,[rax+0x103200]
  1355fd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  135600:	89 02                	mov    DWORD PTR [rdx],eax
  135602:	8b 05 e8 dc fc ff    	mov    eax,DWORD PTR [rip+0xfffffffffffcdce8]        # 1032f0 <mmap_t_i>
  135608:	48 63 d0             	movsxd rdx,eax
  13560b:	48 89 d0             	mov    rax,rdx
  13560e:	48 01 c0             	add    rax,rax
  135611:	48 01 d0             	add    rax,rdx
  135614:	48 c1 e0 02          	shl    rax,0x2
  135618:	48 8d 90 04 32 10 00 	lea    rdx,[rax+0x103204]
  13561f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  135622:	89 02                	mov    DWORD PTR [rdx],eax
  135624:	8b 05 c6 dc fc ff    	mov    eax,DWORD PTR [rip+0xfffffffffffcdcc6]        # 1032f0 <mmap_t_i>
  13562a:	8d 50 01             	lea    edx,[rax+0x1]
  13562d:	89 15 bd dc fc ff    	mov    DWORD PTR [rip+0xfffffffffffcdcbd],edx        # 1032f0 <mmap_t_i>
  135633:	48 63 d0             	movsxd rdx,eax
  135636:	48 89 d0             	mov    rax,rdx
  135639:	48 01 c0             	add    rax,rax
  13563c:	48 01 d0             	add    rax,rdx
  13563f:	48 c1 e0 02          	shl    rax,0x2
  135643:	48 8d 90 08 32 10 00 	lea    rdx,[rax+0x103208]
  13564a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  13564d:	89 02                	mov    DWORD PTR [rdx],eax
  13564f:	90                   	nop
  135650:	5d                   	pop    rbp
  135651:	c3                   	ret    

0000000000135652 <vmalloc>:
  135652:	f3 0f 1e fa          	endbr64 
  135656:	55                   	push   rbp
  135657:	48 89 e5             	mov    rbp,rsp
  13565a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  135661:	eb 74                	jmp    1356d7 <vmalloc+0x85>
  135663:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  13566a:	eb 61                	jmp    1356cd <vmalloc+0x7b>
  13566c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13566f:	48 98                	cdqe   
  135671:	8b 14 85 e0 31 10 00 	mov    edx,DWORD PTR [rax*4+0x1031e0]
  135678:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13567b:	be 01 00 00 00       	mov    esi,0x1
  135680:	89 c1                	mov    ecx,eax
  135682:	d3 e6                	shl    esi,cl
  135684:	89 f0                	mov    eax,esi
  135686:	21 d0                	and    eax,edx
  135688:	85 c0                	test   eax,eax
  13568a:	75 3d                	jne    1356c9 <vmalloc+0x77>
  13568c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13568f:	48 98                	cdqe   
  135691:	8b 14 85 e0 31 10 00 	mov    edx,DWORD PTR [rax*4+0x1031e0]
  135698:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13569b:	be 01 00 00 00       	mov    esi,0x1
  1356a0:	89 c1                	mov    ecx,eax
  1356a2:	d3 e6                	shl    esi,cl
  1356a4:	89 f0                	mov    eax,esi
  1356a6:	09 c2                	or     edx,eax
  1356a8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1356ab:	48 98                	cdqe   
  1356ad:	89 14 85 e0 31 10 00 	mov    DWORD PTR [rax*4+0x1031e0],edx
  1356b4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1356b7:	c1 e0 05             	shl    eax,0x5
  1356ba:	89 c2                	mov    edx,eax
  1356bc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  1356bf:	01 d0                	add    eax,edx
  1356c1:	83 c0 20             	add    eax,0x20
  1356c4:	c1 e0 0c             	shl    eax,0xc
  1356c7:	eb 14                	jmp    1356dd <vmalloc+0x8b>
  1356c9:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  1356cd:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  1356d1:	7e 99                	jle    13566c <vmalloc+0x1a>
  1356d3:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  1356d7:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  1356db:	7e 86                	jle    135663 <vmalloc+0x11>
  1356dd:	5d                   	pop    rbp
  1356de:	c3                   	ret    

00000000001356df <vmfree>:
  1356df:	f3 0f 1e fa          	endbr64 
  1356e3:	55                   	push   rbp
  1356e4:	48 89 e5             	mov    rbp,rsp
  1356e7:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  1356ea:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  1356ed:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  1356f3:	85 c0                	test   eax,eax
  1356f5:	0f 48 c2             	cmovs  eax,edx
  1356f8:	c1 f8 0c             	sar    eax,0xc
  1356fb:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  1356fe:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  135701:	8d 50 1f             	lea    edx,[rax+0x1f]
  135704:	85 c0                	test   eax,eax
  135706:	0f 48 c2             	cmovs  eax,edx
  135709:	c1 f8 05             	sar    eax,0x5
  13570c:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  13570f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  135712:	99                   	cdq    
  135713:	c1 ea 1b             	shr    edx,0x1b
  135716:	01 d0                	add    eax,edx
  135718:	83 e0 1f             	and    eax,0x1f
  13571b:	29 d0                	sub    eax,edx
  13571d:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  135720:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  135723:	48 98                	cdqe   
  135725:	8b 14 85 e0 31 10 00 	mov    edx,DWORD PTR [rax*4+0x1031e0]
  13572c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  13572f:	be 01 00 00 00       	mov    esi,0x1
  135734:	89 c1                	mov    ecx,eax
  135736:	d3 e6                	shl    esi,cl
  135738:	89 f0                	mov    eax,esi
  13573a:	f7 d0                	not    eax
  13573c:	21 c2                	and    edx,eax
  13573e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  135741:	48 98                	cdqe   
  135743:	89 14 85 e0 31 10 00 	mov    DWORD PTR [rax*4+0x1031e0],edx
  13574a:	90                   	nop
  13574b:	5d                   	pop    rbp
  13574c:	c3                   	ret    

000000000013574d <page_err>:
  13574d:	f3 0f 1e fa          	endbr64 
  135751:	55                   	push   rbp
  135752:	48 89 e5             	mov    rbp,rsp
  135755:	48 83 ec 30          	sub    rsp,0x30
  135759:	fa                   	cli    
  13575a:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  135761:	00 
  135762:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  135769:	00 
  13576a:	67 48 8b 45 04       	mov    rax,QWORD PTR [ebp+0x4]
  13576f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  135773:	0f 20 d0             	mov    rax,cr2
  135776:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  13577a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  13577e:	83 e0 01             	and    eax,0x1
  135781:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
  135784:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  135788:	0f 85 e3 00 00 00    	jne    135871 <page_err+0x124>
  13578e:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  135795:	00 
  135796:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  13579d:	00 
  13579e:	0f 20 d8             	mov    rax,cr3
  1357a1:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  1357a5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  1357a9:	48 c1 e8 16          	shr    rax,0x16
  1357ad:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  1357b4:	00 
  1357b5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  1357b9:	48 01 d0             	add    rax,rdx
  1357bc:	8b 00                	mov    eax,DWORD PTR [rax]
  1357be:	83 e0 01             	and    eax,0x1
  1357c1:	85 c0                	test   eax,eax
  1357c3:	75 34                	jne    1357f9 <page_err+0xac>
  1357c5:	b8 00 00 00 00       	mov    eax,0x0
  1357ca:	e8 83 fe ff ff       	call   135652 <vmalloc>
  1357cf:	48 98                	cdqe   
  1357d1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  1357d5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1357d9:	89 c2                	mov    edx,eax
  1357db:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  1357df:	48 c1 e8 16          	shr    rax,0x16
  1357e3:	48 8d 0c 85 00 00 00 	lea    rcx,[rax*4+0x0]
  1357ea:	00 
  1357eb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  1357ef:	48 01 c8             	add    rax,rcx
  1357f2:	83 ca 05             	or     edx,0x5
  1357f5:	89 10                	mov    DWORD PTR [rax],edx
  1357f7:	eb 24                	jmp    13581d <page_err+0xd0>
  1357f9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  1357fd:	48 c1 e8 16          	shr    rax,0x16
  135801:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  135808:	00 
  135809:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  13580d:	48 01 d0             	add    rax,rdx
  135810:	8b 00                	mov    eax,DWORD PTR [rax]
  135812:	89 c0                	mov    eax,eax
  135814:	25 00 f0 ff ff       	and    eax,0xfffff000
  135819:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  13581d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  135821:	25 ff ff 3f 00       	and    eax,0x3fffff
  135826:	48 c1 e8 0c          	shr    rax,0xc
  13582a:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
  13582d:	b8 00 00 00 00       	mov    eax,0x0
  135832:	e8 7c 00 00 00       	call   1358b3 <req_a_page>
  135837:	89 c7                	mov    edi,eax
  135839:	e8 e0 01 00 00       	call   135a1e <get_phyaddr>
  13583e:	83 c8 05             	or     eax,0x5
  135841:	89 c1                	mov    ecx,eax
  135843:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  135846:	48 98                	cdqe   
  135848:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  13584f:	00 
  135850:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  135854:	48 01 d0             	add    rax,rdx
  135857:	8b 10                	mov    edx,DWORD PTR [rax]
  135859:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  13585c:	48 98                	cdqe   
  13585e:	48 8d 34 85 00 00 00 	lea    rsi,[rax*4+0x0]
  135865:	00 
  135866:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13586a:	48 01 f0             	add    rax,rsi
  13586d:	09 ca                	or     edx,ecx
  13586f:	89 10                	mov    DWORD PTR [rax],edx
  135871:	b8 00 00 00 00       	mov    eax,0x0
  135876:	e8 fe 36 00 00       	call   138f79 <eoi>
  13587b:	fb                   	sti    
  13587c:	c9                   	leave  
  13587d:	83 c4 04             	add    esp,0x4
  135880:	cf                   	iret   
  135881:	90                   	nop
  135882:	c9                   	leave  
  135883:	c3                   	ret    

0000000000135884 <init_memory>:
  135884:	f3 0f 1e fa          	endbr64 
  135888:	55                   	push   rbp
  135889:	48 89 e5             	mov    rbp,rsp
  13588c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  135893:	eb 14                	jmp    1358a9 <init_memory+0x25>
  135895:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  135898:	48 98                	cdqe   
  13589a:	c7 04 85 e0 30 10 00 	mov    DWORD PTR [rax*4+0x1030e0],0xffffffff
  1358a1:	ff ff ff ff 
  1358a5:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  1358a9:	83 7d fc 07          	cmp    DWORD PTR [rbp-0x4],0x7
  1358ad:	7e e6                	jle    135895 <init_memory+0x11>
  1358af:	90                   	nop
  1358b0:	90                   	nop
  1358b1:	5d                   	pop    rbp
  1358b2:	c3                   	ret    

00000000001358b3 <req_a_page>:
  1358b3:	f3 0f 1e fa          	endbr64 
  1358b7:	55                   	push   rbp
  1358b8:	48 89 e5             	mov    rbp,rsp
  1358bb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  1358c2:	e9 8a 00 00 00       	jmp    135951 <req_a_page+0x9e>
  1358c7:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  1358ce:	eb 77                	jmp    135947 <req_a_page+0x94>
  1358d0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1358d3:	48 98                	cdqe   
  1358d5:	8b 14 85 e0 30 10 00 	mov    edx,DWORD PTR [rax*4+0x1030e0]
  1358dc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  1358df:	be 01 00 00 00       	mov    esi,0x1
  1358e4:	89 c1                	mov    ecx,eax
  1358e6:	d3 e6                	shl    esi,cl
  1358e8:	89 f0                	mov    eax,esi
  1358ea:	21 d0                	and    eax,edx
  1358ec:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  1358ef:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1358f2:	c1 e0 05             	shl    eax,0x5
  1358f5:	89 c2                	mov    edx,eax
  1358f7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  1358fa:	01 d0                	add    eax,edx
  1358fc:	c1 e0 0c             	shl    eax,0xc
  1358ff:	3d ff ff 0f 00       	cmp    eax,0xfffff
  135904:	7e 3d                	jle    135943 <req_a_page+0x90>
  135906:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  13590a:	75 37                	jne    135943 <req_a_page+0x90>
  13590c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13590f:	48 98                	cdqe   
  135911:	8b 14 85 e0 30 10 00 	mov    edx,DWORD PTR [rax*4+0x1030e0]
  135918:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13591b:	be 01 00 00 00       	mov    esi,0x1
  135920:	89 c1                	mov    ecx,eax
  135922:	d3 e6                	shl    esi,cl
  135924:	89 f0                	mov    eax,esi
  135926:	09 c2                	or     edx,eax
  135928:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13592b:	48 98                	cdqe   
  13592d:	89 14 85 e0 30 10 00 	mov    DWORD PTR [rax*4+0x1030e0],edx
  135934:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  135937:	c1 e0 05             	shl    eax,0x5
  13593a:	89 c2                	mov    edx,eax
  13593c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13593f:	01 d0                	add    eax,edx
  135941:	eb 18                	jmp    13595b <req_a_page+0xa8>
  135943:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  135947:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  13594b:	7e 83                	jle    1358d0 <req_a_page+0x1d>
  13594d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  135951:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  135955:	0f 8e 6c ff ff ff    	jle    1358c7 <req_a_page+0x14>
  13595b:	5d                   	pop    rbp
  13595c:	c3                   	ret    

000000000013595d <free_page>:
  13595d:	f3 0f 1e fa          	endbr64 
  135961:	55                   	push   rbp
  135962:	48 89 e5             	mov    rbp,rsp
  135965:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  135969:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13596d:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  135973:	85 c0                	test   eax,eax
  135975:	0f 48 c2             	cmovs  eax,edx
  135978:	c1 f8 0c             	sar    eax,0xc
  13597b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  13597e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  135981:	8d 50 1f             	lea    edx,[rax+0x1f]
  135984:	85 c0                	test   eax,eax
  135986:	0f 48 c2             	cmovs  eax,edx
  135989:	c1 f8 05             	sar    eax,0x5
  13598c:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  13598f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  135992:	99                   	cdq    
  135993:	c1 ea 1b             	shr    edx,0x1b
  135996:	01 d0                	add    eax,edx
  135998:	83 e0 1f             	and    eax,0x1f
  13599b:	29 d0                	sub    eax,edx
  13599d:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  1359a0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  1359a3:	48 98                	cdqe   
  1359a5:	8b 14 85 e0 30 10 00 	mov    edx,DWORD PTR [rax*4+0x1030e0]
  1359ac:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  1359af:	be 01 00 00 00       	mov    esi,0x1
  1359b4:	89 c1                	mov    ecx,eax
  1359b6:	d3 e6                	shl    esi,cl
  1359b8:	89 f0                	mov    eax,esi
  1359ba:	f7 d0                	not    eax
  1359bc:	21 c2                	and    edx,eax
  1359be:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  1359c1:	48 98                	cdqe   
  1359c3:	89 14 85 e0 30 10 00 	mov    DWORD PTR [rax*4+0x1030e0],edx
  1359ca:	90                   	nop
  1359cb:	5d                   	pop    rbp
  1359cc:	c3                   	ret    

00000000001359cd <check_page>:
  1359cd:	f3 0f 1e fa          	endbr64 
  1359d1:	55                   	push   rbp
  1359d2:	48 89 e5             	mov    rbp,rsp
  1359d5:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  1359d8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  1359db:	8d 50 1f             	lea    edx,[rax+0x1f]
  1359de:	85 c0                	test   eax,eax
  1359e0:	0f 48 c2             	cmovs  eax,edx
  1359e3:	c1 f8 05             	sar    eax,0x5
  1359e6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  1359e9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  1359ec:	99                   	cdq    
  1359ed:	c1 ea 1b             	shr    edx,0x1b
  1359f0:	01 d0                	add    eax,edx
  1359f2:	83 e0 1f             	and    eax,0x1f
  1359f5:	29 d0                	sub    eax,edx
  1359f7:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  1359fa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1359fd:	48 98                	cdqe   
  1359ff:	8b 14 85 e0 30 10 00 	mov    edx,DWORD PTR [rax*4+0x1030e0]
  135a06:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  135a09:	be 01 00 00 00       	mov    esi,0x1
  135a0e:	89 c1                	mov    ecx,eax
  135a10:	d3 e6                	shl    esi,cl
  135a12:	89 f0                	mov    eax,esi
  135a14:	21 d0                	and    eax,edx
  135a16:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  135a19:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  135a1c:	5d                   	pop    rbp
  135a1d:	c3                   	ret    

0000000000135a1e <get_phyaddr>:
  135a1e:	f3 0f 1e fa          	endbr64 
  135a22:	55                   	push   rbp
  135a23:	48 89 e5             	mov    rbp,rsp
  135a26:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  135a29:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  135a2c:	c1 e0 0c             	shl    eax,0xc
  135a2f:	5d                   	pop    rbp
  135a30:	c3                   	ret    

0000000000135a31 <set_page_item>:
  135a31:	f3 0f 1e fa          	endbr64 
  135a35:	55                   	push   rbp
  135a36:	48 89 e5             	mov    rbp,rsp
  135a39:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  135a3d:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  135a40:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
  135a43:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  135a47:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
  135a4e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  135a52:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  135a55:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  135a58:	89 c0                	mov    eax,eax
  135a5a:	25 00 f0 ff ff       	and    eax,0xfffff000
  135a5f:	48 09 c2             	or     rdx,rax
  135a62:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  135a66:	48 89 10             	mov    QWORD PTR [rax],rdx
  135a69:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  135a6d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  135a70:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  135a73:	48 98                	cdqe   
  135a75:	48 09 c2             	or     rdx,rax
  135a78:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  135a7c:	48 89 10             	mov    QWORD PTR [rax],rdx
  135a7f:	90                   	nop
  135a80:	5d                   	pop    rbp
  135a81:	c3                   	ret    

0000000000135a82 <set_1gb_pdpt>:
  135a82:	f3 0f 1e fa          	endbr64 
  135a86:	55                   	push   rbp
  135a87:	48 89 e5             	mov    rbp,rsp
  135a8a:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  135a8e:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  135a91:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
  135a94:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  135a98:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
  135a9f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  135aa3:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  135aa6:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  135aa9:	0c 81                	or     al,0x81
  135aab:	89 c0                	mov    eax,eax
  135aad:	48 09 c2             	or     rdx,rax
  135ab0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  135ab4:	48 89 10             	mov    QWORD PTR [rax],rdx
  135ab7:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  135aba:	25 00 00 00 c0       	and    eax,0xc0000000
  135abf:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  135ac2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  135ac6:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  135ac9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  135acc:	48 09 c2             	or     rdx,rax
  135acf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  135ad3:	48 89 10             	mov    QWORD PTR [rax],rdx
  135ad6:	90                   	nop
  135ad7:	5d                   	pop    rbp
  135ad8:	c3                   	ret    

0000000000135ad9 <set_2mb_pde>:
  135ad9:	f3 0f 1e fa          	endbr64 
  135add:	55                   	push   rbp
  135ade:	48 89 e5             	mov    rbp,rsp
  135ae1:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  135ae5:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  135ae8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  135aec:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
  135af3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  135af7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  135afa:	48 0d 81 10 00 00    	or     rax,0x1081
  135b00:	48 89 c2             	mov    rdx,rax
  135b03:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  135b07:	48 89 10             	mov    QWORD PTR [rax],rdx
  135b0a:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  135b0d:	25 00 00 c0 ff       	and    eax,0xffc00000
  135b12:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  135b15:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  135b19:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  135b1c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  135b1f:	48 09 c2             	or     rdx,rax
  135b22:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  135b26:	48 89 10             	mov    QWORD PTR [rax],rdx
  135b29:	90                   	nop
  135b2a:	5d                   	pop    rbp
  135b2b:	c3                   	ret    

0000000000135b2c <req_page_at>:
  135b2c:	f3 0f 1e fa          	endbr64 
  135b30:	55                   	push   rbp
  135b31:	48 89 e5             	mov    rbp,rsp
  135b34:	48 83 ec 20          	sub    rsp,0x20
  135b38:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  135b3b:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  135b3e:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  135b42:	75 16                	jne    135b5a <req_page_at+0x2e>
  135b44:	b8 00 00 00 00       	mov    eax,0x0
  135b49:	e8 65 fd ff ff       	call   1358b3 <req_a_page>
  135b4e:	89 c7                	mov    edi,eax
  135b50:	e8 c9 fe ff ff       	call   135a1e <get_phyaddr>
  135b55:	e9 92 00 00 00       	jmp    135bec <req_page_at+0xc0>
  135b5a:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  135b5d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  135b60:	89 d6                	mov    esi,edx
  135b62:	89 c7                	mov    edi,eax
  135b64:	e8 42 01 00 00       	call   135cab <is_pgs_ava>
  135b69:	85 c0                	test   eax,eax
  135b6b:	75 07                	jne    135b74 <req_page_at+0x48>
  135b6d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  135b72:	eb 78                	jmp    135bec <req_page_at+0xc0>
  135b74:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  135b77:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  135b7d:	85 c0                	test   eax,eax
  135b7f:	0f 48 c2             	cmovs  eax,edx
  135b82:	c1 f8 0c             	sar    eax,0xc
  135b85:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  135b88:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  135b8b:	8d 50 1f             	lea    edx,[rax+0x1f]
  135b8e:	85 c0                	test   eax,eax
  135b90:	0f 48 c2             	cmovs  eax,edx
  135b93:	c1 f8 05             	sar    eax,0x5
  135b96:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  135b99:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  135b9c:	99                   	cdq    
  135b9d:	c1 ea 1b             	shr    edx,0x1b
  135ba0:	01 d0                	add    eax,edx
  135ba2:	83 e0 1f             	and    eax,0x1f
  135ba5:	29 d0                	sub    eax,edx
  135ba7:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
  135baa:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  135bb1:	eb 2c                	jmp    135bdf <req_page_at+0xb3>
  135bb3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  135bb6:	48 98                	cdqe   
  135bb8:	8b 14 85 e0 30 10 00 	mov    edx,DWORD PTR [rax*4+0x1030e0]
  135bbf:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  135bc2:	be 01 00 00 00       	mov    esi,0x1
  135bc7:	89 c1                	mov    ecx,eax
  135bc9:	d3 e6                	shl    esi,cl
  135bcb:	89 f0                	mov    eax,esi
  135bcd:	09 c2                	or     edx,eax
  135bcf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  135bd2:	48 98                	cdqe   
  135bd4:	89 14 85 e0 30 10 00 	mov    DWORD PTR [rax*4+0x1030e0],edx
  135bdb:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  135bdf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  135be2:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  135be5:	7c cc                	jl     135bb3 <req_page_at+0x87>
  135be7:	b8 00 00 00 00       	mov    eax,0x0
  135bec:	c9                   	leave  
  135bed:	c3                   	ret    

0000000000135bee <chk_vm>:
  135bee:	f3 0f 1e fa          	endbr64 
  135bf2:	55                   	push   rbp
  135bf3:	48 89 e5             	mov    rbp,rsp
  135bf6:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  135bf9:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  135bfc:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  135c03:	00 
  135c04:	0f 20 d8             	mov    rax,cr3
  135c07:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  135c0b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  135c0e:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  135c14:	85 c0                	test   eax,eax
  135c16:	0f 48 c2             	cmovs  eax,edx
  135c19:	c1 f8 16             	sar    eax,0x16
  135c1c:	48 98                	cdqe   
  135c1e:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  135c25:	00 
  135c26:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  135c2a:	48 01 d0             	add    rax,rdx
  135c2d:	8b 00                	mov    eax,DWORD PTR [rax]
  135c2f:	89 c0                	mov    eax,eax
  135c31:	25 00 f0 ff ff       	and    eax,0xfffff000
  135c36:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  135c3a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  135c3d:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  135c43:	85 c0                	test   eax,eax
  135c45:	0f 48 c2             	cmovs  eax,edx
  135c48:	c1 f8 16             	sar    eax,0x16
  135c4b:	48 98                	cdqe   
  135c4d:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  135c54:	00 
  135c55:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  135c59:	48 01 d0             	add    rax,rdx
  135c5c:	8b 00                	mov    eax,DWORD PTR [rax]
  135c5e:	83 e0 01             	and    eax,0x1
  135c61:	85 c0                	test   eax,eax
  135c63:	74 38                	je     135c9d <chk_vm+0xaf>
  135c65:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  135c68:	99                   	cdq    
  135c69:	c1 ea 0a             	shr    edx,0xa
  135c6c:	01 d0                	add    eax,edx
  135c6e:	25 ff ff 3f 00       	and    eax,0x3fffff
  135c73:	29 d0                	sub    eax,edx
  135c75:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  135c7b:	85 c0                	test   eax,eax
  135c7d:	0f 48 c2             	cmovs  eax,edx
  135c80:	c1 f8 0c             	sar    eax,0xc
  135c83:	48 98                	cdqe   
  135c85:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  135c8c:	00 
  135c8d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  135c91:	48 01 d0             	add    rax,rdx
  135c94:	8b 00                	mov    eax,DWORD PTR [rax]
  135c96:	83 e0 01             	and    eax,0x1
  135c99:	85 c0                	test   eax,eax
  135c9b:	75 07                	jne    135ca4 <chk_vm+0xb6>
  135c9d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  135ca2:	eb 05                	jmp    135ca9 <chk_vm+0xbb>
  135ca4:	b8 00 00 00 00       	mov    eax,0x0
  135ca9:	5d                   	pop    rbp
  135caa:	c3                   	ret    

0000000000135cab <is_pgs_ava>:
  135cab:	f3 0f 1e fa          	endbr64 
  135caf:	55                   	push   rbp
  135cb0:	48 89 e5             	mov    rbp,rsp
  135cb3:	48 83 ec 18          	sub    rsp,0x18
  135cb7:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  135cba:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  135cbd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  135cc0:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  135cc6:	85 c0                	test   eax,eax
  135cc8:	0f 48 c2             	cmovs  eax,edx
  135ccb:	c1 f8 0c             	sar    eax,0xc
  135cce:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  135cd1:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  135cd8:	eb 1e                	jmp    135cf8 <is_pgs_ava+0x4d>
  135cda:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  135cdd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  135ce0:	01 d0                	add    eax,edx
  135ce2:	89 c7                	mov    edi,eax
  135ce4:	e8 e4 fc ff ff       	call   1359cd <check_page>
  135ce9:	85 c0                	test   eax,eax
  135ceb:	74 07                	je     135cf4 <is_pgs_ava+0x49>
  135ced:	b8 00 00 00 00       	mov    eax,0x0
  135cf2:	eb 11                	jmp    135d05 <is_pgs_ava+0x5a>
  135cf4:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  135cf8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  135cfb:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  135cfe:	7c da                	jl     135cda <is_pgs_ava+0x2f>
  135d00:	b8 01 00 00 00       	mov    eax,0x1
  135d05:	c9                   	leave  
  135d06:	c3                   	ret    

0000000000135d07 <setup_sys_vol>:
  135d07:	f3 0f 1e fa          	endbr64 
  135d0b:	55                   	push   rbp
  135d0c:	48 89 e5             	mov    rbp,rsp
  135d0f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  135d13:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  135d17:	c6 05 e2 d5 fc ff 43 	mov    BYTE PTR [rip+0xfffffffffffcd5e2],0x43        # 103300 <vols>
  135d1e:	c6 05 dc d5 fc ff 00 	mov    BYTE PTR [rip+0xfffffffffffcd5dc],0x0        # 103301 <vols+0x1>
  135d25:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  135d29:	48 89 05 d8 d5 fc ff 	mov    QWORD PTR [rip+0xfffffffffffcd5d8],rax        # 103308 <vols+0x8>
  135d30:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  135d34:	48 89 05 d5 d5 fc ff 	mov    QWORD PTR [rip+0xfffffffffffcd5d5],rax        # 103310 <vols+0x10>
  135d3b:	c7 05 db d5 fc ff 01 	mov    DWORD PTR [rip+0xfffffffffffcd5db],0x1        # 103320 <vols+0x20>
  135d42:	00 00 00 
  135d45:	b8 00 00 00 00       	mov    eax,0x0
  135d4a:	5d                   	pop    rbp
  135d4b:	c3                   	ret    

0000000000135d4c <sys_mkfifo>:
  135d4c:	f3 0f 1e fa          	endbr64 
  135d50:	55                   	push   rbp
  135d51:	48 89 e5             	mov    rbp,rsp
  135d54:	48 83 ec 20          	sub    rsp,0x20
  135d58:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  135d5b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  135d62:	eb 38                	jmp    135d9c <sys_mkfifo+0x50>
  135d64:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  135d67:	48 98                	cdqe   
  135d69:	48 c1 e0 04          	shl    rax,0x4
  135d6d:	48 05 2c 4f 10 00    	add    rax,0x104f2c
  135d73:	8b 00                	mov    eax,DWORD PTR [rax]
  135d75:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  135d78:	75 1e                	jne    135d98 <sys_mkfifo+0x4c>
  135d7a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  135d7d:	48 98                	cdqe   
  135d7f:	48 c1 e0 04          	shl    rax,0x4
  135d83:	48 05 28 4f 10 00    	add    rax,0x104f28
  135d89:	8b 00                	mov    eax,DWORD PTR [rax]
  135d8b:	83 f8 01             	cmp    eax,0x1
  135d8e:	75 08                	jne    135d98 <sys_mkfifo+0x4c>
  135d90:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  135d93:	e9 a6 00 00 00       	jmp    135e3e <sys_mkfifo+0xf2>
  135d98:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  135d9c:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  135da0:	7e c2                	jle    135d64 <sys_mkfifo+0x18>
  135da2:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  135da9:	e9 81 00 00 00       	jmp    135e2f <sys_mkfifo+0xe3>
  135dae:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  135db1:	48 98                	cdqe   
  135db3:	48 c1 e0 04          	shl    rax,0x4
  135db7:	48 05 28 4f 10 00    	add    rax,0x104f28
  135dbd:	8b 00                	mov    eax,DWORD PTR [rax]
  135dbf:	85 c0                	test   eax,eax
  135dc1:	75 68                	jne    135e2b <sys_mkfifo+0xdf>
  135dc3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  135dc6:	48 98                	cdqe   
  135dc8:	48 c1 e0 04          	shl    rax,0x4
  135dcc:	48 05 28 4f 10 00    	add    rax,0x104f28
  135dd2:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
  135dd8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  135ddb:	48 98                	cdqe   
  135ddd:	48 c1 e0 04          	shl    rax,0x4
  135de1:	48 8d 90 2c 4f 10 00 	lea    rdx,[rax+0x104f2c]
  135de8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  135deb:	89 02                	mov    DWORD PTR [rdx],eax
  135ded:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  135df0:	48 98                	cdqe   
  135df2:	48 c1 e0 04          	shl    rax,0x4
  135df6:	48 05 24 4f 10 00    	add    rax,0x104f24
  135dfc:	c7 00 00 10 00 00    	mov    DWORD PTR [rax],0x1000
  135e02:	b8 00 00 00 00       	mov    eax,0x0
  135e07:	e8 a7 fa ff ff       	call   1358b3 <req_a_page>
  135e0c:	89 c7                	mov    edi,eax
  135e0e:	e8 0b fc ff ff       	call   135a1e <get_phyaddr>
  135e13:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  135e16:	48 63 d2             	movsxd rdx,edx
  135e19:	48 c1 e2 04          	shl    rdx,0x4
  135e1d:	48 81 c2 20 4f 10 00 	add    rdx,0x104f20
  135e24:	89 02                	mov    DWORD PTR [rdx],eax
  135e26:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  135e29:	eb 13                	jmp    135e3e <sys_mkfifo+0xf2>
  135e2b:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  135e2f:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  135e33:	0f 8e 75 ff ff ff    	jle    135dae <sys_mkfifo+0x62>
  135e39:	b8 ff ff ff ff       	mov    eax,0xffffffff
  135e3e:	c9                   	leave  
  135e3f:	c3                   	ret    

0000000000135e40 <sys_rmfifo>:
  135e40:	f3 0f 1e fa          	endbr64 
  135e44:	55                   	push   rbp
  135e45:	48 89 e5             	mov    rbp,rsp
  135e48:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  135e4b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  135e52:	eb 4a                	jmp    135e9e <sys_rmfifo+0x5e>
  135e54:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  135e57:	48 98                	cdqe   
  135e59:	48 c1 e0 04          	shl    rax,0x4
  135e5d:	48 05 2c 4f 10 00    	add    rax,0x104f2c
  135e63:	8b 00                	mov    eax,DWORD PTR [rax]
  135e65:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  135e68:	75 30                	jne    135e9a <sys_rmfifo+0x5a>
  135e6a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  135e6d:	48 98                	cdqe   
  135e6f:	48 c1 e0 04          	shl    rax,0x4
  135e73:	48 05 28 4f 10 00    	add    rax,0x104f28
  135e79:	8b 00                	mov    eax,DWORD PTR [rax]
  135e7b:	83 f8 01             	cmp    eax,0x1
  135e7e:	75 1a                	jne    135e9a <sys_rmfifo+0x5a>
  135e80:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  135e83:	48 98                	cdqe   
  135e85:	48 c1 e0 04          	shl    rax,0x4
  135e89:	48 05 28 4f 10 00    	add    rax,0x104f28
  135e8f:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  135e95:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  135e98:	eb 0f                	jmp    135ea9 <sys_rmfifo+0x69>
  135e9a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  135e9e:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  135ea2:	7e b0                	jle    135e54 <sys_rmfifo+0x14>
  135ea4:	b8 ff ff ff ff       	mov    eax,0xffffffff
  135ea9:	5d                   	pop    rbp
  135eaa:	c3                   	ret    

0000000000135eab <free_vol>:
  135eab:	f3 0f 1e fa          	endbr64 
  135eaf:	55                   	push   rbp
  135eb0:	48 89 e5             	mov    rbp,rsp
  135eb3:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  135eb6:	c7 05 60 d4 fc ff 00 	mov    DWORD PTR [rip+0xfffffffffffcd460],0x0        # 103320 <vols+0x20>
  135ebd:	00 00 00 
  135ec0:	b8 00 00 00 00       	mov    eax,0x0
  135ec5:	5d                   	pop    rbp
  135ec6:	c3                   	ret    

0000000000135ec7 <reg_vol>:
  135ec7:	f3 0f 1e fa          	endbr64 
  135ecb:	55                   	push   rbp
  135ecc:	48 89 e5             	mov    rbp,rsp
  135ecf:	48 83 ec 20          	sub    rsp,0x20
  135ed3:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  135ed6:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  135ed9:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  135edd:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  135ee4:	e9 d8 00 00 00       	jmp    135fc1 <reg_vol+0xfa>
  135ee9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  135eec:	48 63 d0             	movsxd rdx,eax
  135eef:	48 89 d0             	mov    rax,rdx
  135ef2:	48 c1 e0 02          	shl    rax,0x2
  135ef6:	48 01 d0             	add    rax,rdx
  135ef9:	48 c1 e0 03          	shl    rax,0x3
  135efd:	48 05 20 33 10 00    	add    rax,0x103320
  135f03:	8b 00                	mov    eax,DWORD PTR [rax]
  135f05:	85 c0                	test   eax,eax
  135f07:	0f 85 b0 00 00 00    	jne    135fbd <reg_vol+0xf6>
  135f0d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  135f10:	48 63 d0             	movsxd rdx,eax
  135f13:	48 89 d0             	mov    rax,rdx
  135f16:	48 c1 e0 02          	shl    rax,0x2
  135f1a:	48 01 d0             	add    rax,rdx
  135f1d:	48 c1 e0 03          	shl    rax,0x3
  135f21:	48 05 20 33 10 00    	add    rax,0x103320
  135f27:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
  135f2d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  135f30:	48 63 d0             	movsxd rdx,eax
  135f33:	48 89 d0             	mov    rax,rdx
  135f36:	48 01 c0             	add    rax,rax
  135f39:	48 01 d0             	add    rax,rdx
  135f3c:	48 c1 e0 03          	shl    rax,0x3
  135f40:	48 8d 88 40 54 10 00 	lea    rcx,[rax+0x105440]
  135f47:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  135f4a:	48 63 d0             	movsxd rdx,eax
  135f4d:	48 89 d0             	mov    rax,rdx
  135f50:	48 c1 e0 02          	shl    rax,0x2
  135f54:	48 01 d0             	add    rax,rdx
  135f57:	48 c1 e0 03          	shl    rax,0x3
  135f5b:	48 05 18 33 10 00    	add    rax,0x103318
  135f61:	48 89 08             	mov    QWORD PTR [rax],rcx
  135f64:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  135f67:	89 c7                	mov    edi,eax
  135f69:	e8 0c 1b 00 00       	call   137a7a <get_drv>
  135f6e:	48 89 c2             	mov    rdx,rax
  135f71:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  135f74:	48 63 c8             	movsxd rcx,eax
  135f77:	48 89 c8             	mov    rax,rcx
  135f7a:	48 c1 e0 02          	shl    rax,0x2
  135f7e:	48 01 c8             	add    rax,rcx
  135f81:	48 c1 e0 03          	shl    rax,0x3
  135f85:	48 05 08 33 10 00    	add    rax,0x103308
  135f8b:	48 89 10             	mov    QWORD PTR [rax],rdx
  135f8e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  135f91:	48 63 d0             	movsxd rdx,eax
  135f94:	48 89 d0             	mov    rax,rdx
  135f97:	48 c1 e0 02          	shl    rax,0x2
  135f9b:	48 01 d0             	add    rax,rdx
  135f9e:	48 c1 e0 03          	shl    rax,0x3
  135fa2:	48 8d 90 00 33 10 00 	lea    rdx,[rax+0x103300]
  135fa9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  135fad:	48 89 c6             	mov    rsi,rax
  135fb0:	48 89 d7             	mov    rdi,rdx
  135fb3:	e8 f2 73 00 00       	call   13d3aa <strcpy>
  135fb8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  135fbb:	eb 13                	jmp    135fd0 <reg_vol+0x109>
  135fbd:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  135fc1:	83 7d fc 19          	cmp    DWORD PTR [rbp-0x4],0x19
  135fc5:	0f 8e 1e ff ff ff    	jle    135ee9 <reg_vol+0x22>
  135fcb:	b8 ff ff ff ff       	mov    eax,0xffffffff
  135fd0:	c9                   	leave  
  135fd1:	c3                   	ret    

0000000000135fd2 <sys_open>:
  135fd2:	f3 0f 1e fa          	endbr64 
  135fd6:	55                   	push   rbp
  135fd7:	48 89 e5             	mov    rbp,rsp
  135fda:	53                   	push   rbx
  135fdb:	48 81 ec 28 02 00 00 	sub    rsp,0x228
  135fe2:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
  135fe9:	89 b5 d4 fd ff ff    	mov    DWORD PTR [rbp-0x22c],esi
  135fef:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  135ff6:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
  135ffd:	eb 20                	jmp    13601f <sys_open+0x4d>
  135fff:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  136002:	48 63 d0             	movsxd rdx,eax
  136005:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  13600c:	48 01 d0             	add    rax,rdx
  13600f:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  136012:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  136015:	48 98                	cdqe   
  136017:	88 54 05 c0          	mov    BYTE PTR [rbp+rax*1-0x40],dl
  13601b:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  13601f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  136022:	48 63 d0             	movsxd rdx,eax
  136025:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  13602c:	48 01 d0             	add    rax,rdx
  13602f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  136032:	3c 2f                	cmp    al,0x2f
  136034:	74 06                	je     13603c <sys_open+0x6a>
  136036:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  13603a:	7e c3                	jle    135fff <sys_open+0x2d>
  13603c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  13603f:	48 98                	cdqe   
  136041:	c6 44 05 c0 00       	mov    BYTE PTR [rbp+rax*1-0x40],0x0
  136046:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  136049:	48 98                	cdqe   
  13604b:	48 8d 50 01          	lea    rdx,[rax+0x1]
  13604f:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  136056:	48 01 d0             	add    rax,rdx
  136059:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13605c:	84 c0                	test   al,al
  13605e:	75 0a                	jne    13606a <sys_open+0x98>
  136060:	b8 fe ff ff ff       	mov    eax,0xfffffffe
  136065:	e9 2b 04 00 00       	jmp    136495 <sys_open+0x4c3>
  13606a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  13606d:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
  136070:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  136077:	eb 52                	jmp    1360cb <sys_open+0xf9>
  136079:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  13607c:	48 63 d0             	movsxd rdx,eax
  13607f:	48 89 d0             	mov    rax,rdx
  136082:	48 c1 e0 02          	shl    rax,0x2
  136086:	48 01 d0             	add    rax,rdx
  136089:	48 c1 e0 03          	shl    rax,0x3
  13608d:	48 05 20 33 10 00    	add    rax,0x103320
  136093:	8b 00                	mov    eax,DWORD PTR [rax]
  136095:	85 c0                	test   eax,eax
  136097:	74 2e                	je     1360c7 <sys_open+0xf5>
  136099:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  13609c:	48 63 d0             	movsxd rdx,eax
  13609f:	48 89 d0             	mov    rax,rdx
  1360a2:	48 c1 e0 02          	shl    rax,0x2
  1360a6:	48 01 d0             	add    rax,rdx
  1360a9:	48 c1 e0 03          	shl    rax,0x3
  1360ad:	48 8d 90 00 33 10 00 	lea    rdx,[rax+0x103300]
  1360b4:	48 8d 45 c0          	lea    rax,[rbp-0x40]
  1360b8:	48 89 c6             	mov    rsi,rax
  1360bb:	48 89 d7             	mov    rdi,rdx
  1360be:	e8 87 74 00 00       	call   13d54a <strcmp>
  1360c3:	85 c0                	test   eax,eax
  1360c5:	74 0c                	je     1360d3 <sys_open+0x101>
  1360c7:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  1360cb:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  1360cf:	7e a8                	jle    136079 <sys_open+0xa7>
  1360d1:	eb 01                	jmp    1360d4 <sys_open+0x102>
  1360d3:	90                   	nop
  1360d4:	83 7d ec 1a          	cmp    DWORD PTR [rbp-0x14],0x1a
  1360d8:	75 0a                	jne    1360e4 <sys_open+0x112>
  1360da:	b8 ff ff ff ff       	mov    eax,0xffffffff
  1360df:	e9 b1 03 00 00       	jmp    136495 <sys_open+0x4c3>
  1360e4:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
  1360eb:	b8 00 00 00 00       	mov    eax,0x0
  1360f0:	b9 17 00 00 00       	mov    ecx,0x17
  1360f5:	48 89 d7             	mov    rdi,rdx
  1360f8:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  1360fb:	48 89 fa             	mov    rdx,rdi
  1360fe:	89 02                	mov    DWORD PTR [rdx],eax
  136100:	48 83 c2 04          	add    rdx,0x4
  136104:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  136107:	48 98                	cdqe   
  136109:	48 8d 50 01          	lea    rdx,[rax+0x1]
  13610d:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  136114:	48 01 d0             	add    rax,rdx
  136117:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
  13611e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  136121:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
  136124:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  136127:	48 63 d0             	movsxd rdx,eax
  13612a:	48 89 d0             	mov    rax,rdx
  13612d:	48 c1 e0 02          	shl    rax,0x2
  136131:	48 01 d0             	add    rax,rdx
  136134:	48 c1 e0 03          	shl    rax,0x3
  136138:	48 05 18 33 10 00    	add    rax,0x103318
  13613e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  136141:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  136145:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  136148:	48 98                	cdqe   
  13614a:	48 8d 48 01          	lea    rcx,[rax+0x1]
  13614e:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  136155:	48 01 c1             	add    rcx,rax
  136158:	48 8d 85 40 fe ff ff 	lea    rax,[rbp-0x1c0]
  13615f:	ff b5 f8 fe ff ff    	push   QWORD PTR [rbp-0x108]
  136165:	ff b5 f0 fe ff ff    	push   QWORD PTR [rbp-0x110]
  13616b:	ff b5 e8 fe ff ff    	push   QWORD PTR [rbp-0x118]
  136171:	ff b5 e0 fe ff ff    	push   QWORD PTR [rbp-0x120]
  136177:	ff b5 d8 fe ff ff    	push   QWORD PTR [rbp-0x128]
  13617d:	ff b5 d0 fe ff ff    	push   QWORD PTR [rbp-0x130]
  136183:	ff b5 c8 fe ff ff    	push   QWORD PTR [rbp-0x138]
  136189:	ff b5 c0 fe ff ff    	push   QWORD PTR [rbp-0x140]
  13618f:	ff b5 b8 fe ff ff    	push   QWORD PTR [rbp-0x148]
  136195:	ff b5 b0 fe ff ff    	push   QWORD PTR [rbp-0x150]
  13619b:	ff b5 a8 fe ff ff    	push   QWORD PTR [rbp-0x158]
  1361a1:	ff b5 a0 fe ff ff    	push   QWORD PTR [rbp-0x160]
  1361a7:	48 89 c6             	mov    rsi,rax
  1361aa:	48 89 cf             	mov    rdi,rcx
  1361ad:	ff d2                	call   rdx
  1361af:	48 83 c4 60          	add    rsp,0x60
  1361b3:	83 f8 ff             	cmp    eax,0xffffffff
  1361b6:	75 49                	jne    136201 <sys_open+0x22f>
  1361b8:	8b 85 d4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x22c]
  1361be:	83 e0 02             	and    eax,0x2
  1361c1:	85 c0                	test   eax,eax
  1361c3:	74 32                	je     1361f7 <sys_open+0x225>
  1361c5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  1361c8:	48 63 d0             	movsxd rdx,eax
  1361cb:	48 89 d0             	mov    rax,rdx
  1361ce:	48 c1 e0 02          	shl    rax,0x2
  1361d2:	48 01 d0             	add    rax,rdx
  1361d5:	48 c1 e0 03          	shl    rax,0x3
  1361d9:	48 05 10 33 10 00    	add    rax,0x103310
  1361df:	48 8b 00             	mov    rax,QWORD PTR [rax]
  1361e2:	48 8b 50 4c          	mov    rdx,QWORD PTR [rax+0x4c]
  1361e6:	48 8d 85 00 ff ff ff 	lea    rax,[rbp-0x100]
  1361ed:	48 89 c7             	mov    rdi,rax
  1361f0:	ff d2                	call   rdx
  1361f2:	e9 9e 02 00 00       	jmp    136495 <sys_open+0x4c3>
  1361f7:	b8 ff ff ff ff       	mov    eax,0xffffffff
  1361fc:	e9 94 02 00 00       	jmp    136495 <sys_open+0x4c3>
  136201:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
  136208:	48 8b 95 48 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b8]
  13620f:	48 89 85 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],rax
  136216:	48 89 95 e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdx
  13621d:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
  136224:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
  13622b:	48 89 85 f0 fd ff ff 	mov    QWORD PTR [rbp-0x210],rax
  136232:	48 89 95 f8 fd ff ff 	mov    QWORD PTR [rbp-0x208],rdx
  136239:	48 8b 85 60 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1a0]
  136240:	48 8b 95 68 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x198]
  136247:	48 89 85 00 fe ff ff 	mov    QWORD PTR [rbp-0x200],rax
  13624e:	48 89 95 08 fe ff ff 	mov    QWORD PTR [rbp-0x1f8],rdx
  136255:	48 8b 85 70 fe ff ff 	mov    rax,QWORD PTR [rbp-0x190]
  13625c:	48 8b 95 78 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x188]
  136263:	48 89 85 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rax
  13626a:	48 89 95 18 fe ff ff 	mov    QWORD PTR [rbp-0x1e8],rdx
  136271:	48 8b 85 80 fe ff ff 	mov    rax,QWORD PTR [rbp-0x180]
  136278:	48 8b 95 88 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x178]
  13627f:	48 89 85 20 fe ff ff 	mov    QWORD PTR [rbp-0x1e0],rax
  136286:	48 89 95 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rdx
  13628d:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
  136294:	48 8b 95 98 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x168]
  13629b:	48 89 85 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],rax
  1362a2:	48 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdx
  1362a9:	c7 45 e8 ff ff ff ff 	mov    DWORD PTR [rbp-0x18],0xffffffff
  1362b0:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  1362b7:	eb 5c                	jmp    136315 <sys_open+0x343>
  1362b9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  1362bc:	48 63 d0             	movsxd rdx,eax
  1362bf:	48 89 d0             	mov    rax,rdx
  1362c2:	48 01 c0             	add    rax,rax
  1362c5:	48 01 d0             	add    rax,rdx
  1362c8:	48 c1 e0 05          	shl    rax,0x5
  1362cc:	48 05 28 37 10 00    	add    rax,0x103728
  1362d2:	8b 00                	mov    eax,DWORD PTR [rax]
  1362d4:	39 45 e0             	cmp    DWORD PTR [rbp-0x20],eax
  1362d7:	75 38                	jne    136311 <sys_open+0x33f>
  1362d9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  1362dc:	48 63 d0             	movsxd rdx,eax
  1362df:	48 89 d0             	mov    rax,rdx
  1362e2:	48 01 c0             	add    rax,rax
  1362e5:	48 01 d0             	add    rax,rdx
  1362e8:	48 c1 e0 05          	shl    rax,0x5
  1362ec:	48 05 34 37 10 00    	add    rax,0x103734
  1362f2:	8b 10                	mov    edx,DWORD PTR [rax]
  1362f4:	8b 85 f4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x20c]
  1362fa:	39 c2                	cmp    edx,eax
  1362fc:	75 13                	jne    136311 <sys_open+0x33f>
  1362fe:	83 bd d4 fd ff ff 02 	cmp    DWORD PTR [rbp-0x22c],0x2
  136305:	75 0a                	jne    136311 <sys_open+0x33f>
  136307:	b8 ff ff ff ff       	mov    eax,0xffffffff
  13630c:	e9 84 01 00 00       	jmp    136495 <sys_open+0x4c3>
  136311:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  136315:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  136319:	7e 9e                	jle    1362b9 <sys_open+0x2e7>
  13631b:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  136322:	eb 2b                	jmp    13634f <sys_open+0x37d>
  136324:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  136327:	48 63 d0             	movsxd rdx,eax
  13632a:	48 89 d0             	mov    rax,rdx
  13632d:	48 01 c0             	add    rax,rax
  136330:	48 01 d0             	add    rax,rdx
  136333:	48 c1 e0 05          	shl    rax,0x5
  136337:	48 05 24 37 10 00    	add    rax,0x103724
  13633d:	8b 00                	mov    eax,DWORD PTR [rax]
  13633f:	85 c0                	test   eax,eax
  136341:	75 08                	jne    13634b <sys_open+0x379>
  136343:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  136346:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  136349:	eb 0a                	jmp    136355 <sys_open+0x383>
  13634b:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  13634f:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  136353:	7e cf                	jle    136324 <sys_open+0x352>
  136355:	83 7d e8 ff          	cmp    DWORD PTR [rbp-0x18],0xffffffff
  136359:	75 0a                	jne    136365 <sys_open+0x393>
  13635b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  136360:	e9 30 01 00 00       	jmp    136495 <sys_open+0x4c3>
  136365:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  136368:	48 63 d0             	movsxd rdx,eax
  13636b:	48 89 d0             	mov    rax,rdx
  13636e:	48 01 c0             	add    rax,rax
  136371:	48 01 d0             	add    rax,rdx
  136374:	48 c1 e0 05          	shl    rax,0x5
  136378:	48 05 20 37 10 00    	add    rax,0x103720
  13637e:	48 8b 8d e0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x220]
  136385:	48 8b 9d e8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x218]
  13638c:	48 89 08             	mov    QWORD PTR [rax],rcx
  13638f:	48 89 58 08          	mov    QWORD PTR [rax+0x8],rbx
  136393:	48 8b 8d f0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x210]
  13639a:	48 8b 9d f8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x208]
  1363a1:	48 89 48 10          	mov    QWORD PTR [rax+0x10],rcx
  1363a5:	48 89 58 18          	mov    QWORD PTR [rax+0x18],rbx
  1363a9:	48 8b 8d 00 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x200]
  1363b0:	48 8b 9d 08 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1f8]
  1363b7:	48 89 48 20          	mov    QWORD PTR [rax+0x20],rcx
  1363bb:	48 89 58 28          	mov    QWORD PTR [rax+0x28],rbx
  1363bf:	48 8b 8d 10 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1f0]
  1363c6:	48 8b 9d 18 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1e8]
  1363cd:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
  1363d1:	48 89 58 38          	mov    QWORD PTR [rax+0x38],rbx
  1363d5:	48 8b 8d 20 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1e0]
  1363dc:	48 8b 9d 28 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1d8]
  1363e3:	48 89 48 40          	mov    QWORD PTR [rax+0x40],rcx
  1363e7:	48 89 58 48          	mov    QWORD PTR [rax+0x48],rbx
  1363eb:	48 8b 8d 30 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1d0]
  1363f2:	48 8b 9d 38 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1c8]
  1363f9:	48 89 48 50          	mov    QWORD PTR [rax+0x50],rcx
  1363fd:	48 89 58 58          	mov    QWORD PTR [rax+0x58],rbx
  136401:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  136404:	48 63 d0             	movsxd rdx,eax
  136407:	48 89 d0             	mov    rax,rdx
  13640a:	48 01 c0             	add    rax,rax
  13640d:	48 01 d0             	add    rax,rdx
  136410:	48 c1 e0 05          	shl    rax,0x5
  136414:	48 8d 90 20 37 10 00 	lea    rdx,[rax+0x103720]
  13641b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  13641e:	89 02                	mov    DWORD PTR [rdx],eax
  136420:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  136423:	48 63 d0             	movsxd rdx,eax
  136426:	48 89 d0             	mov    rax,rdx
  136429:	48 01 c0             	add    rax,rax
  13642c:	48 01 d0             	add    rax,rdx
  13642f:	48 c1 e0 05          	shl    rax,0x5
  136433:	48 05 2c 37 10 00    	add    rax,0x10372c
  136439:	8b 00                	mov    eax,DWORD PTR [rax]
  13643b:	8d 48 01             	lea    ecx,[rax+0x1]
  13643e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  136441:	48 63 d0             	movsxd rdx,eax
  136444:	48 89 d0             	mov    rax,rdx
  136447:	48 01 c0             	add    rax,rax
  13644a:	48 01 d0             	add    rax,rdx
  13644d:	48 c1 e0 05          	shl    rax,0x5
  136451:	48 05 2c 37 10 00    	add    rax,0x10372c
  136457:	89 08                	mov    DWORD PTR [rax],ecx
  136459:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  13645c:	48 63 d0             	movsxd rdx,eax
  13645f:	48 89 d0             	mov    rax,rdx
  136462:	48 01 c0             	add    rax,rax
  136465:	48 01 d0             	add    rax,rdx
  136468:	48 c1 e0 05          	shl    rax,0x5
  13646c:	48 05 20 37 10 00    	add    rax,0x103720
  136472:	48 89 c7             	mov    rdi,rax
  136475:	e8 16 26 00 00       	call   138a90 <add_proc_openf>
  13647a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  13647d:	48 63 d0             	movsxd rdx,eax
  136480:	48 89 d0             	mov    rax,rdx
  136483:	48 01 c0             	add    rax,rax
  136486:	48 01 d0             	add    rax,rdx
  136489:	48 c1 e0 05          	shl    rax,0x5
  13648d:	48 05 20 37 10 00    	add    rax,0x103720
  136493:	8b 00                	mov    eax,DWORD PTR [rax]
  136495:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  136499:	c9                   	leave  
  13649a:	c3                   	ret    

000000000013649b <sys_close>:
  13649b:	f3 0f 1e fa          	endbr64 
  13649f:	55                   	push   rbp
  1364a0:	48 89 e5             	mov    rbp,rsp
  1364a3:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  1364a6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  1364ad:	eb 64                	jmp    136513 <sys_close+0x78>
  1364af:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1364b2:	48 63 d0             	movsxd rdx,eax
  1364b5:	48 89 d0             	mov    rax,rdx
  1364b8:	48 01 c0             	add    rax,rax
  1364bb:	48 01 d0             	add    rax,rdx
  1364be:	48 c1 e0 05          	shl    rax,0x5
  1364c2:	48 05 20 37 10 00    	add    rax,0x103720
  1364c8:	8b 00                	mov    eax,DWORD PTR [rax]
  1364ca:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  1364cd:	75 40                	jne    13650f <sys_close+0x74>
  1364cf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1364d2:	48 63 d0             	movsxd rdx,eax
  1364d5:	48 89 d0             	mov    rax,rdx
  1364d8:	48 01 c0             	add    rax,rax
  1364db:	48 01 d0             	add    rax,rdx
  1364de:	48 c1 e0 05          	shl    rax,0x5
  1364e2:	48 05 2c 37 10 00    	add    rax,0x10372c
  1364e8:	8b 00                	mov    eax,DWORD PTR [rax]
  1364ea:	8d 48 ff             	lea    ecx,[rax-0x1]
  1364ed:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1364f0:	48 63 d0             	movsxd rdx,eax
  1364f3:	48 89 d0             	mov    rax,rdx
  1364f6:	48 01 c0             	add    rax,rax
  1364f9:	48 01 d0             	add    rax,rdx
  1364fc:	48 c1 e0 05          	shl    rax,0x5
  136500:	48 05 2c 37 10 00    	add    rax,0x10372c
  136506:	89 08                	mov    DWORD PTR [rax],ecx
  136508:	b8 00 00 00 00       	mov    eax,0x0
  13650d:	eb 0f                	jmp    13651e <sys_close+0x83>
  13650f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  136513:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  136517:	7e 96                	jle    1364af <sys_close+0x14>
  136519:	b8 ff ff ff ff       	mov    eax,0xffffffff
  13651e:	5d                   	pop    rbp
  13651f:	c3                   	ret    

0000000000136520 <sys_write>:
  136520:	f3 0f 1e fa          	endbr64 
  136524:	55                   	push   rbp
  136525:	48 89 e5             	mov    rbp,rsp
  136528:	48 83 ec 20          	sub    rsp,0x20
  13652c:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  13652f:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  136533:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
  136536:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  136539:	89 c7                	mov    edi,eax
  13653b:	e8 7d 01 00 00       	call   1366bd <get_vfs_entry>
  136540:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  136544:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  136549:	75 07                	jne    136552 <sys_write+0x32>
  13654b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  136550:	eb 5d                	jmp    1365af <sys_write+0x8f>
  136552:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  136556:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  136559:	85 c0                	test   eax,eax
  13655b:	75 18                	jne    136575 <sys_write+0x55>
  13655d:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  136560:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  136564:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  136568:	48 89 ce             	mov    rsi,rcx
  13656b:	48 89 c7             	mov    rdi,rax
  13656e:	e8 66 03 00 00       	call   1368d9 <vfs_write_file>
  136573:	eb 3a                	jmp    1365af <sys_write+0x8f>
  136575:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  136579:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  13657c:	83 f8 01             	cmp    eax,0x1
  13657f:	75 29                	jne    1365aa <sys_write+0x8a>
  136581:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  136585:	48 89 c7             	mov    rdi,rax
  136588:	e8 5a 04 00 00       	call   1369e7 <get_according_bnr>
  13658d:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  136590:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  136594:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  136597:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  13659a:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  13659e:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  1365a1:	89 c7                	mov    edi,eax
  1365a3:	e8 25 08 00 00       	call   136dcd <write_block>
  1365a8:	eb 05                	jmp    1365af <sys_write+0x8f>
  1365aa:	b8 ff ff ff ff       	mov    eax,0xffffffff
  1365af:	c9                   	leave  
  1365b0:	c3                   	ret    

00000000001365b1 <sys_read>:
  1365b1:	f3 0f 1e fa          	endbr64 
  1365b5:	55                   	push   rbp
  1365b6:	48 89 e5             	mov    rbp,rsp
  1365b9:	48 83 ec 20          	sub    rsp,0x20
  1365bd:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  1365c0:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  1365c4:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
  1365c7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  1365ca:	89 c7                	mov    edi,eax
  1365cc:	e8 ec 00 00 00       	call   1366bd <get_vfs_entry>
  1365d1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  1365d5:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  1365da:	75 07                	jne    1365e3 <sys_read+0x32>
  1365dc:	b8 ff ff ff ff       	mov    eax,0xffffffff
  1365e1:	eb 5d                	jmp    136640 <sys_read+0x8f>
  1365e3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1365e7:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  1365ea:	85 c0                	test   eax,eax
  1365ec:	75 18                	jne    136606 <sys_read+0x55>
  1365ee:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  1365f1:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  1365f5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1365f9:	48 89 ce             	mov    rsi,rcx
  1365fc:	48 89 c7             	mov    rdi,rax
  1365ff:	e8 36 02 00 00       	call   13683a <vfs_read_file>
  136604:	eb 3a                	jmp    136640 <sys_read+0x8f>
  136606:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13660a:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  13660d:	83 f8 01             	cmp    eax,0x1
  136610:	75 29                	jne    13663b <sys_read+0x8a>
  136612:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  136616:	48 89 c7             	mov    rdi,rax
  136619:	e8 c9 03 00 00       	call   1369e7 <get_according_bnr>
  13661e:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  136621:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  136625:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  136628:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  13662b:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  13662f:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  136632:	89 c7                	mov    edi,eax
  136634:	e8 11 08 00 00       	call   136e4a <read_block>
  136639:	eb 05                	jmp    136640 <sys_read+0x8f>
  13663b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  136640:	c9                   	leave  
  136641:	c3                   	ret    

0000000000136642 <sys_seek>:
  136642:	f3 0f 1e fa          	endbr64 
  136646:	55                   	push   rbp
  136647:	48 89 e5             	mov    rbp,rsp
  13664a:	48 83 ec 20          	sub    rsp,0x20
  13664e:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  136651:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  136654:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  136657:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  13665a:	89 c7                	mov    edi,eax
  13665c:	e8 5c 00 00 00       	call   1366bd <get_vfs_entry>
  136661:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  136665:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  13666a:	75 07                	jne    136673 <sys_seek+0x31>
  13666c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  136671:	eb 14                	jmp    136687 <sys_seek+0x45>
  136673:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  136676:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  136679:	01 c2                	add    edx,eax
  13667b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13667f:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
  136682:	b8 00 00 00 00       	mov    eax,0x0
  136687:	c9                   	leave  
  136688:	c3                   	ret    

0000000000136689 <sys_tell>:
  136689:	f3 0f 1e fa          	endbr64 
  13668d:	55                   	push   rbp
  13668e:	48 89 e5             	mov    rbp,rsp
  136691:	48 83 ec 20          	sub    rsp,0x20
  136695:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  136698:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  13669b:	89 c7                	mov    edi,eax
  13669d:	e8 1b 00 00 00       	call   1366bd <get_vfs_entry>
  1366a2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  1366a6:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  1366ab:	75 07                	jne    1366b4 <sys_tell+0x2b>
  1366ad:	b8 ff ff ff ff       	mov    eax,0xffffffff
  1366b2:	eb 07                	jmp    1366bb <sys_tell+0x32>
  1366b4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1366b8:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  1366bb:	c9                   	leave  
  1366bc:	c3                   	ret    

00000000001366bd <get_vfs_entry>:
  1366bd:	f3 0f 1e fa          	endbr64 
  1366c1:	55                   	push   rbp
  1366c2:	48 89 e5             	mov    rbp,rsp
  1366c5:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  1366c8:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  1366cf:	eb 3f                	jmp    136710 <get_vfs_entry+0x53>
  1366d1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1366d4:	48 63 d0             	movsxd rdx,eax
  1366d7:	48 89 d0             	mov    rax,rdx
  1366da:	48 01 c0             	add    rax,rax
  1366dd:	48 01 d0             	add    rax,rdx
  1366e0:	48 c1 e0 05          	shl    rax,0x5
  1366e4:	48 05 20 37 10 00    	add    rax,0x103720
  1366ea:	8b 00                	mov    eax,DWORD PTR [rax]
  1366ec:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  1366ef:	75 1b                	jne    13670c <get_vfs_entry+0x4f>
  1366f1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1366f4:	48 63 d0             	movsxd rdx,eax
  1366f7:	48 89 d0             	mov    rax,rdx
  1366fa:	48 01 c0             	add    rax,rax
  1366fd:	48 01 d0             	add    rax,rdx
  136700:	48 c1 e0 05          	shl    rax,0x5
  136704:	48 05 20 37 10 00    	add    rax,0x103720
  13670a:	eb 0f                	jmp    13671b <get_vfs_entry+0x5e>
  13670c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  136710:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  136714:	7e bb                	jle    1366d1 <get_vfs_entry+0x14>
  136716:	b8 00 00 00 00       	mov    eax,0x0
  13671b:	5d                   	pop    rbp
  13671c:	c3                   	ret    

000000000013671d <brelse>:
  13671d:	f3 0f 1e fa          	endbr64 
  136721:	55                   	push   rbp
  136722:	48 89 e5             	mov    rbp,rsp
  136725:	48 83 ec 10          	sub    rsp,0x10
  136729:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  13672d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  136731:	48 89 c7             	mov    rdi,rax
  136734:	e8 a1 04 00 00       	call   136bda <wait_on_buf>
  136739:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13673d:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  136741:	84 c0                	test   al,al
  136743:	75 07                	jne    13674c <brelse+0x2f>
  136745:	b8 ff ff ff ff       	mov    eax,0xffffffff
  13674a:	eb 31                	jmp    13677d <brelse+0x60>
  13674c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  136750:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  136754:	8d 50 ff             	lea    edx,[rax-0x1]
  136757:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13675b:	88 50 14             	mov    BYTE PTR [rax+0x14],dl
  13675e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  136762:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  136766:	84 c0                	test   al,al
  136768:	75 0e                	jne    136778 <brelse+0x5b>
  13676a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13676e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  136771:	89 c7                	mov    edi,eax
  136773:	e8 67 ef ff ff       	call   1356df <vmfree>
  136778:	b8 00 00 00 00       	mov    eax,0x0
  13677d:	c9                   	leave  
  13677e:	c3                   	ret    

000000000013677f <bread>:
  13677f:	f3 0f 1e fa          	endbr64 
  136783:	55                   	push   rbp
  136784:	48 89 e5             	mov    rbp,rsp
  136787:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  13678e:	89 bd 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],edi
  136794:	89 b5 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],esi
  13679a:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  1367a0:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  1367a6:	89 d6                	mov    esi,edx
  1367a8:	89 c7                	mov    edi,eax
  1367aa:	e8 78 02 00 00       	call   136a27 <get_buf>
  1367af:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  1367b3:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  1367b8:	75 09                	jne    1367c3 <bread+0x44>
  1367ba:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  1367c1:	eb 75                	jmp    136838 <bread+0xb9>
  1367c3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1367c7:	0f b6 40 12          	movzx  eax,BYTE PTR [rax+0x12]
  1367cb:	84 c0                	test   al,al
  1367cd:	75 65                	jne    136834 <bread+0xb5>
  1367cf:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  1367d5:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
  1367d8:	c7 45 d8 02 00 00 00 	mov    DWORD PTR [rbp-0x28],0x2
  1367df:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1367e3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  1367e6:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
  1367ec:	c7 85 48 ff ff ff 00 	mov    DWORD PTR [rbp-0xb8],0x200
  1367f3:	02 00 00 
  1367f6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1367fa:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  1367fe:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
  136804:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  13680b:	00 00 00 
  13680e:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  136815:	48 89 c7             	mov    rdi,rax
  136818:	e8 84 12 00 00       	call   137aa1 <make_request>
  13681d:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  136820:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  136823:	89 c7                	mov    edi,eax
  136825:	e8 8a 15 00 00       	call   137db4 <wait_on_req>
  13682a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  13682d:	89 c7                	mov    edi,eax
  13682f:	e8 b0 15 00 00       	call   137de4 <clear_req>
  136834:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  136838:	c9                   	leave  
  136839:	c3                   	ret    

000000000013683a <vfs_read_file>:
  13683a:	f3 0f 1e fa          	endbr64 
  13683e:	55                   	push   rbp
  13683f:	48 89 e5             	mov    rbp,rsp
  136842:	48 83 ec 40          	sub    rsp,0x40
  136846:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  13684a:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  13684e:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
  136851:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  136855:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  136858:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  13685b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  13685f:	48 89 c7             	mov    rdi,rax
  136862:	e8 80 01 00 00       	call   1369e7 <get_according_bnr>
  136867:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  13686a:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  13686d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  136870:	89 d6                	mov    esi,edx
  136872:	89 c7                	mov    edi,eax
  136874:	e8 06 ff ff ff       	call   13677f <bread>
  136879:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  13687d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  136880:	ba 00 02 00 00       	mov    edx,0x200
  136885:	39 d0                	cmp    eax,edx
  136887:	0f 4f c2             	cmovg  eax,edx
  13688a:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  13688d:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  136890:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  136894:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  136897:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  13689b:	48 89 ce             	mov    rsi,rcx
  13689e:	48 89 c7             	mov    rdi,rax
  1368a1:	e8 06 6a 00 00       	call   13d2ac <memcpy>
  1368a6:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
  1368ad:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  1368b1:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  1368b4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  1368b7:	01 c2                	add    edx,eax
  1368b9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  1368bd:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
  1368c0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  1368c4:	48 89 c7             	mov    rdi,rax
  1368c7:	e8 51 fe ff ff       	call   13671d <brelse>
  1368cc:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  1368d0:	7f 89                	jg     13685b <vfs_read_file+0x21>
  1368d2:	b8 00 00 00 00       	mov    eax,0x0
  1368d7:	c9                   	leave  
  1368d8:	c3                   	ret    

00000000001368d9 <vfs_write_file>:
  1368d9:	f3 0f 1e fa          	endbr64 
  1368dd:	55                   	push   rbp
  1368de:	48 89 e5             	mov    rbp,rsp
  1368e1:	48 83 ec 40          	sub    rsp,0x40
  1368e5:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  1368e9:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  1368ed:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
  1368f0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  1368f4:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  1368f7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  1368fa:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  1368fe:	48 89 c7             	mov    rdi,rax
  136901:	e8 e1 00 00 00       	call   1369e7 <get_according_bnr>
  136906:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  136909:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  13690c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13690f:	89 d6                	mov    esi,edx
  136911:	89 c7                	mov    edi,eax
  136913:	e8 0f 01 00 00       	call   136a27 <get_buf>
  136918:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  13691c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  13691f:	ba 00 02 00 00       	mov    edx,0x200
  136924:	39 d0                	cmp    eax,edx
  136926:	0f 4f c2             	cmovg  eax,edx
  136929:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  13692c:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  13692f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  136933:	48 8b 00             	mov    rax,QWORD PTR [rax]
  136936:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  13693a:	48 89 ce             	mov    rsi,rcx
  13693d:	48 89 c7             	mov    rdi,rax
  136940:	e8 67 69 00 00       	call   13d2ac <memcpy>
  136945:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
  13694c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  136950:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  136953:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  136956:	01 c2                	add    edx,eax
  136958:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  13695c:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
  13695f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  136963:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
  136967:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  13696b:	48 89 c7             	mov    rdi,rax
  13696e:	e8 aa fd ff ff       	call   13671d <brelse>
  136973:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  136977:	7f 81                	jg     1368fa <vfs_write_file+0x21>
  136979:	b8 00 00 00 00       	mov    eax,0x0
  13697e:	c9                   	leave  
  13697f:	c3                   	ret    

0000000000136980 <vfs_seek_file>:
  136980:	f3 0f 1e fa          	endbr64 
  136984:	55                   	push   rbp
  136985:	48 89 e5             	mov    rbp,rsp
  136988:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  13698c:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  13698f:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
  136992:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  136996:	74 20                	je     1369b8 <vfs_seek_file+0x38>
  136998:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  13699c:	7f 3f                	jg     1369dd <vfs_seek_file+0x5d>
  13699e:	83 7d f0 00          	cmp    DWORD PTR [rbp-0x10],0x0
  1369a2:	74 08                	je     1369ac <vfs_seek_file+0x2c>
  1369a4:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  1369a8:	74 23                	je     1369cd <vfs_seek_file+0x4d>
  1369aa:	eb 31                	jmp    1369dd <vfs_seek_file+0x5d>
  1369ac:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1369b0:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  1369b3:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
  1369b6:	eb 26                	jmp    1369de <vfs_seek_file+0x5e>
  1369b8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1369bc:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  1369bf:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  1369c2:	01 c2                	add    edx,eax
  1369c4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1369c8:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
  1369cb:	eb 11                	jmp    1369de <vfs_seek_file+0x5e>
  1369cd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1369d1:	8b 50 18             	mov    edx,DWORD PTR [rax+0x18]
  1369d4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1369d8:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
  1369db:	eb 01                	jmp    1369de <vfs_seek_file+0x5e>
  1369dd:	90                   	nop
  1369de:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1369e2:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  1369e5:	5d                   	pop    rbp
  1369e6:	c3                   	ret    

00000000001369e7 <get_according_bnr>:
  1369e7:	f3 0f 1e fa          	endbr64 
  1369eb:	55                   	push   rbp
  1369ec:	48 89 e5             	mov    rbp,rsp
  1369ef:	48 83 ec 10          	sub    rsp,0x10
  1369f3:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  1369f7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1369fb:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  1369fe:	48 63 d0             	movsxd rdx,eax
  136a01:	48 89 d0             	mov    rax,rdx
  136a04:	48 c1 e0 02          	shl    rax,0x2
  136a08:	48 01 d0             	add    rax,rdx
  136a0b:	48 c1 e0 03          	shl    rax,0x3
  136a0f:	48 05 18 33 10 00    	add    rax,0x103318
  136a15:	48 8b 00             	mov    rax,QWORD PTR [rax]
  136a18:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  136a1c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  136a20:	48 89 c7             	mov    rdi,rax
  136a23:	ff d2                	call   rdx
  136a25:	c9                   	leave  
  136a26:	c3                   	ret    

0000000000136a27 <get_buf>:
  136a27:	f3 0f 1e fa          	endbr64 
  136a2b:	55                   	push   rbp
  136a2c:	48 89 e5             	mov    rbp,rsp
  136a2f:	48 83 ec 20          	sub    rsp,0x20
  136a33:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  136a36:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  136a39:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  136a40:	e9 b9 00 00 00       	jmp    136afe <get_buf+0xd7>
  136a45:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  136a48:	48 98                	cdqe   
  136a4a:	48 c1 e0 06          	shl    rax,0x6
  136a4e:	48 05 50 57 10 00    	add    rax,0x105750
  136a54:	0f b7 00             	movzx  eax,WORD PTR [rax]
  136a57:	0f b7 c0             	movzx  eax,ax
  136a5a:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  136a5d:	0f 85 97 00 00 00    	jne    136afa <get_buf+0xd3>
  136a63:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  136a66:	48 98                	cdqe   
  136a68:	48 c1 e0 06          	shl    rax,0x6
  136a6c:	48 05 48 57 10 00    	add    rax,0x105748
  136a72:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  136a75:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  136a78:	48 98                	cdqe   
  136a7a:	48 39 c2             	cmp    rdx,rax
  136a7d:	75 7b                	jne    136afa <get_buf+0xd3>
  136a7f:	90                   	nop
  136a80:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  136a83:	48 98                	cdqe   
  136a85:	48 c1 e0 06          	shl    rax,0x6
  136a89:	48 05 40 57 10 00    	add    rax,0x105740
  136a8f:	48 89 c7             	mov    rdi,rax
  136a92:	e8 43 01 00 00       	call   136bda <wait_on_buf>
  136a97:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  136a9a:	48 98                	cdqe   
  136a9c:	48 c1 e0 06          	shl    rax,0x6
  136aa0:	48 05 54 57 10 00    	add    rax,0x105754
  136aa6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  136aa9:	84 c0                	test   al,al
  136aab:	74 02                	je     136aaf <get_buf+0x88>
  136aad:	eb d1                	jmp    136a80 <get_buf+0x59>
  136aaf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  136ab2:	48 98                	cdqe   
  136ab4:	48 c1 e0 06          	shl    rax,0x6
  136ab8:	48 05 50 57 10 00    	add    rax,0x105750
  136abe:	0f b7 00             	movzx  eax,WORD PTR [rax]
  136ac1:	0f b7 c0             	movzx  eax,ax
  136ac4:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  136ac7:	75 30                	jne    136af9 <get_buf+0xd2>
  136ac9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  136acc:	48 98                	cdqe   
  136ace:	48 c1 e0 06          	shl    rax,0x6
  136ad2:	48 05 48 57 10 00    	add    rax,0x105748
  136ad8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  136adb:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  136ade:	48 98                	cdqe   
  136ae0:	48 39 c2             	cmp    rdx,rax
  136ae3:	75 14                	jne    136af9 <get_buf+0xd2>
  136ae5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  136ae8:	48 98                	cdqe   
  136aea:	48 c1 e0 06          	shl    rax,0x6
  136aee:	48 05 40 57 10 00    	add    rax,0x105740
  136af4:	e9 df 00 00 00       	jmp    136bd8 <get_buf+0x1b1>
  136af9:	90                   	nop
  136afa:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  136afe:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  136b02:	0f 8e 3d ff ff ff    	jle    136a45 <get_buf+0x1e>
  136b08:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  136b0f:	e9 ba 00 00 00       	jmp    136bce <get_buf+0x1a7>
  136b14:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  136b17:	48 98                	cdqe   
  136b19:	48 c1 e0 06          	shl    rax,0x6
  136b1d:	48 05 54 57 10 00    	add    rax,0x105754
  136b23:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  136b26:	84 c0                	test   al,al
  136b28:	0f 85 9c 00 00 00    	jne    136bca <get_buf+0x1a3>
  136b2e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  136b31:	48 98                	cdqe   
  136b33:	48 c1 e0 06          	shl    rax,0x6
  136b37:	48 05 53 57 10 00    	add    rax,0x105753
  136b3d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  136b40:	84 c0                	test   al,al
  136b42:	74 2e                	je     136b72 <get_buf+0x14b>
  136b44:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  136b47:	48 98                	cdqe   
  136b49:	48 c1 e0 06          	shl    rax,0x6
  136b4d:	48 05 40 57 10 00    	add    rax,0x105740
  136b53:	48 89 c7             	mov    rdi,rax
  136b56:	e8 2e 02 00 00       	call   136d89 <sync_buf>
  136b5b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  136b5e:	48 98                	cdqe   
  136b60:	48 c1 e0 06          	shl    rax,0x6
  136b64:	48 05 40 57 10 00    	add    rax,0x105740
  136b6a:	48 89 c7             	mov    rdi,rax
  136b6d:	e8 68 00 00 00       	call   136bda <wait_on_buf>
  136b72:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  136b75:	48 98                	cdqe   
  136b77:	48 c1 e0 06          	shl    rax,0x6
  136b7b:	48 05 54 57 10 00    	add    rax,0x105754
  136b81:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  136b84:	8d 50 01             	lea    edx,[rax+0x1]
  136b87:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  136b8a:	48 98                	cdqe   
  136b8c:	48 c1 e0 06          	shl    rax,0x6
  136b90:	48 05 54 57 10 00    	add    rax,0x105754
  136b96:	88 10                	mov    BYTE PTR [rax],dl
  136b98:	b8 00 00 00 00       	mov    eax,0x0
  136b9d:	e8 b0 ea ff ff       	call   135652 <vmalloc>
  136ba2:	48 98                	cdqe   
  136ba4:	48 89 c2             	mov    rdx,rax
  136ba7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  136baa:	48 98                	cdqe   
  136bac:	48 c1 e0 06          	shl    rax,0x6
  136bb0:	48 05 40 57 10 00    	add    rax,0x105740
  136bb6:	48 89 10             	mov    QWORD PTR [rax],rdx
  136bb9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  136bbc:	48 98                	cdqe   
  136bbe:	48 c1 e0 06          	shl    rax,0x6
  136bc2:	48 05 40 57 10 00    	add    rax,0x105740
  136bc8:	eb 0e                	jmp    136bd8 <get_buf+0x1b1>
  136bca:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  136bce:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  136bd2:	0f 8e 3c ff ff ff    	jle    136b14 <get_buf+0xed>
  136bd8:	c9                   	leave  
  136bd9:	c3                   	ret    

0000000000136bda <wait_on_buf>:
  136bda:	f3 0f 1e fa          	endbr64 
  136bde:	55                   	push   rbp
  136bdf:	48 89 e5             	mov    rbp,rsp
  136be2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  136be6:	90                   	nop
  136be7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  136beb:	0f b6 40 15          	movzx  eax,BYTE PTR [rax+0x15]
  136bef:	84 c0                	test   al,al
  136bf1:	75 f4                	jne    136be7 <wait_on_buf+0xd>
  136bf3:	90                   	nop
  136bf4:	90                   	nop
  136bf5:	5d                   	pop    rbp
  136bf6:	c3                   	ret    

0000000000136bf7 <scan_dev>:
  136bf7:	f3 0f 1e fa          	endbr64 
  136bfb:	55                   	push   rbp
  136bfc:	48 89 e5             	mov    rbp,rsp
  136bff:	48 83 ec 40          	sub    rsp,0x40
  136c03:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
  136c06:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  136c09:	89 c7                	mov    edi,eax
  136c0b:	e8 3c 0e 00 00       	call   137a4c <get_dev>
  136c10:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  136c14:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  136c17:	be 00 00 00 00       	mov    esi,0x0
  136c1c:	89 c7                	mov    edi,eax
  136c1e:	e8 5c fb ff ff       	call   13677f <bread>
  136c23:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  136c27:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  136c2c:	75 0a                	jne    136c38 <scan_dev+0x41>
  136c2e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  136c33:	e9 4f 01 00 00       	jmp    136d87 <scan_dev+0x190>
  136c38:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  136c3c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  136c3f:	48 05 be 01 00 00    	add    rax,0x1be
  136c45:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  136c49:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  136c50:	e9 17 01 00 00       	jmp    136d6c <scan_dev+0x175>
  136c55:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  136c59:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  136c5c:	0f b6 d0             	movzx  edx,al
  136c5f:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  136c63:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  136c66:	48 63 c8             	movsxd rcx,eax
  136c69:	48 89 c8             	mov    rax,rcx
  136c6c:	48 01 c0             	add    rax,rax
  136c6f:	48 01 c8             	add    rax,rcx
  136c72:	48 c1 e0 02          	shl    rax,0x2
  136c76:	48 01 f0             	add    rax,rsi
  136c79:	48 83 c0 40          	add    rax,0x40
  136c7d:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
  136c80:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  136c84:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  136c87:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
  136c8a:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  136c8e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  136c91:	48 63 d0             	movsxd rdx,eax
  136c94:	48 89 d0             	mov    rax,rdx
  136c97:	48 01 c0             	add    rax,rax
  136c9a:	48 01 d0             	add    rax,rdx
  136c9d:	48 c1 e0 02          	shl    rax,0x2
  136ca1:	48 01 c8             	add    rax,rcx
  136ca4:	48 8d 50 40          	lea    rdx,[rax+0x40]
  136ca8:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  136cab:	89 02                	mov    DWORD PTR [rdx],eax
  136cad:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  136cb4:	eb 68                	jmp    136d1e <scan_dev+0x127>
  136cb6:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  136cb9:	48 63 d0             	movsxd rdx,eax
  136cbc:	48 89 d0             	mov    rax,rdx
  136cbf:	48 01 c0             	add    rax,rax
  136cc2:	48 01 d0             	add    rax,rdx
  136cc5:	48 c1 e0 03          	shl    rax,0x3
  136cc9:	48 05 40 54 10 00    	add    rax,0x105440
  136ccf:	48 8b 00             	mov    rax,QWORD PTR [rax]
  136cd2:	48 85 c0             	test   rax,rax
  136cd5:	74 43                	je     136d1a <scan_dev+0x123>
  136cd7:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  136cda:	48 63 d0             	movsxd rdx,eax
  136cdd:	48 89 d0             	mov    rax,rdx
  136ce0:	48 01 c0             	add    rax,rax
  136ce3:	48 01 d0             	add    rax,rdx
  136ce6:	48 c1 e0 03          	shl    rax,0x3
  136cea:	48 05 40 54 10 00    	add    rax,0x105440
  136cf0:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  136cf3:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  136cf6:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  136cf9:	89 d6                	mov    esi,edx
  136cfb:	89 c7                	mov    edi,eax
  136cfd:	ff d1                	call   rcx
  136cff:	85 c0                	test   eax,eax
  136d01:	75 17                	jne    136d1a <scan_dev+0x123>
  136d03:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  136d07:	48 8d 50 14          	lea    rdx,[rax+0x14]
  136d0b:	8b 4d f0             	mov    ecx,DWORD PTR [rbp-0x10]
  136d0e:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  136d11:	89 ce                	mov    esi,ecx
  136d13:	89 c7                	mov    edi,eax
  136d15:	e8 ad f1 ff ff       	call   135ec7 <reg_vol>
  136d1a:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  136d1e:	83 7d f0 1f          	cmp    DWORD PTR [rbp-0x10],0x1f
  136d22:	7e 92                	jle    136cb6 <scan_dev+0xbf>
  136d24:	83 7d f0 20          	cmp    DWORD PTR [rbp-0x10],0x20
  136d28:	75 0f                	jne    136d39 <scan_dev+0x142>
  136d2a:	bf 90 e3 13 00       	mov    edi,0x13e390
  136d2f:	b8 00 00 00 00       	mov    eax,0x0
  136d34:	e8 27 e6 ff ff       	call   135360 <printf>
  136d39:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  136d3d:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  136d40:	89 c1                	mov    ecx,eax
  136d42:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  136d46:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  136d49:	48 63 d0             	movsxd rdx,eax
  136d4c:	48 89 d0             	mov    rax,rdx
  136d4f:	48 01 c0             	add    rax,rax
  136d52:	48 01 d0             	add    rax,rdx
  136d55:	48 c1 e0 02          	shl    rax,0x2
  136d59:	48 01 f0             	add    rax,rsi
  136d5c:	48 83 c0 40          	add    rax,0x40
  136d60:	89 48 04             	mov    DWORD PTR [rax+0x4],ecx
  136d63:	48 83 45 f8 10       	add    QWORD PTR [rbp-0x8],0x10
  136d68:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  136d6c:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  136d70:	0f 8e df fe ff ff    	jle    136c55 <scan_dev+0x5e>
  136d76:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  136d7a:	48 89 c7             	mov    rdi,rax
  136d7d:	e8 9b f9 ff ff       	call   13671d <brelse>
  136d82:	b8 00 00 00 00       	mov    eax,0x0
  136d87:	c9                   	leave  
  136d88:	c3                   	ret    

0000000000136d89 <sync_buf>:
  136d89:	f3 0f 1e fa          	endbr64 
  136d8d:	55                   	push   rbp
  136d8e:	48 89 e5             	mov    rbp,rsp
  136d91:	48 83 ec 20          	sub    rsp,0x20
  136d95:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  136d99:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  136d9d:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
  136da1:	0f b7 c0             	movzx  eax,ax
  136da4:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  136da7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  136dab:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  136daf:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  136db2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  136db6:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  136db9:	8b 75 f8             	mov    esi,DWORD PTR [rbp-0x8]
  136dbc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  136dbf:	b9 00 02 00 00       	mov    ecx,0x200
  136dc4:	89 c7                	mov    edi,eax
  136dc6:	e8 02 00 00 00       	call   136dcd <write_block>
  136dcb:	c9                   	leave  
  136dcc:	c3                   	ret    

0000000000136dcd <write_block>:
  136dcd:	f3 0f 1e fa          	endbr64 
  136dd1:	55                   	push   rbp
  136dd2:	48 89 e5             	mov    rbp,rsp
  136dd5:	48 83 ec 30          	sub    rsp,0x30
  136dd9:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  136ddc:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  136ddf:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  136de3:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
  136de6:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  136de9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  136dec:	89 d6                	mov    esi,edx
  136dee:	89 c7                	mov    edi,eax
  136df0:	e8 32 fc ff ff       	call   136a27 <get_buf>
  136df5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  136df9:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  136dfc:	ba 00 02 00 00       	mov    edx,0x200
  136e01:	39 d0                	cmp    eax,edx
  136e03:	0f 4f c2             	cmovg  eax,edx
  136e06:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  136e09:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  136e0c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  136e10:	48 8b 00             	mov    rax,QWORD PTR [rax]
  136e13:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  136e17:	48 89 ce             	mov    rsi,rcx
  136e1a:	48 89 c7             	mov    rdi,rax
  136e1d:	e8 8a 64 00 00       	call   13d2ac <memcpy>
  136e22:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
  136e29:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  136e2d:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
  136e31:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  136e35:	48 89 c7             	mov    rdi,rax
  136e38:	e8 e0 f8 ff ff       	call   13671d <brelse>
  136e3d:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  136e41:	7f a3                	jg     136de6 <write_block+0x19>
  136e43:	b8 00 00 00 00       	mov    eax,0x0
  136e48:	c9                   	leave  
  136e49:	c3                   	ret    

0000000000136e4a <read_block>:
  136e4a:	f3 0f 1e fa          	endbr64 
  136e4e:	55                   	push   rbp
  136e4f:	48 89 e5             	mov    rbp,rsp
  136e52:	48 83 ec 30          	sub    rsp,0x30
  136e56:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  136e59:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  136e5c:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  136e60:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
  136e63:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  136e66:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  136e69:	89 d6                	mov    esi,edx
  136e6b:	89 c7                	mov    edi,eax
  136e6d:	e8 0d f9 ff ff       	call   13677f <bread>
  136e72:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  136e76:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  136e79:	ba 00 02 00 00       	mov    edx,0x200
  136e7e:	39 d0                	cmp    eax,edx
  136e80:	0f 4f c2             	cmovg  eax,edx
  136e83:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  136e86:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  136e89:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  136e8d:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  136e90:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  136e94:	48 89 ce             	mov    rsi,rcx
  136e97:	48 89 c7             	mov    rdi,rax
  136e9a:	e8 0d 64 00 00       	call   13d2ac <memcpy>
  136e9f:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
  136ea6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  136eaa:	48 89 c7             	mov    rdi,rax
  136ead:	e8 6b f8 ff ff       	call   13671d <brelse>
  136eb2:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  136eb6:	7f ab                	jg     136e63 <read_block+0x19>
  136eb8:	b8 00 00 00 00       	mov    eax,0x0
  136ebd:	c9                   	leave  
  136ebe:	c3                   	ret    

0000000000136ebf <init_vfs>:
  136ebf:	f3 0f 1e fa          	endbr64 
  136ec3:	55                   	push   rbp
  136ec4:	48 89 e5             	mov    rbp,rsp
  136ec7:	48 83 ec 10          	sub    rsp,0x10
  136ecb:	48 8b 05 6e 46 fd ff 	mov    rax,QWORD PTR [rip+0xfffffffffffd466e]        # 10b540 <dev_tree>
  136ed2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  136ed6:	eb 40                	jmp    136f18 <init_vfs+0x59>
  136ed8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  136edc:	48 2d 40 5f 10 00    	sub    rax,0x105f40
  136ee2:	48 c1 f8 02          	sar    rax,0x2
  136ee6:	48 89 c2             	mov    rdx,rax
  136ee9:	48 b8 19 9c 8f c1 f9 	movabs rax,0x8f9c18f9c18f9c19
  136ef0:	18 9c 8f 
  136ef3:	48 0f af c2          	imul   rax,rdx
  136ef7:	89 c7                	mov    edi,eax
  136ef9:	e8 f9 fc ff ff       	call   136bf7 <scan_dev>
  136efe:	85 c0                	test   eax,eax
  136f00:	74 07                	je     136f09 <init_vfs+0x4a>
  136f02:	b8 ff ff ff ff       	mov    eax,0xffffffff
  136f07:	eb 1b                	jmp    136f24 <init_vfs+0x65>
  136f09:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  136f0d:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  136f14:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  136f18:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  136f1d:	75 b9                	jne    136ed8 <init_vfs+0x19>
  136f1f:	b8 00 00 00 00       	mov    eax,0x0
  136f24:	c9                   	leave  
  136f25:	c3                   	ret    

0000000000136f26 <init_drvdev_man>:
  136f26:	f3 0f 1e fa          	endbr64 
  136f2a:	55                   	push   rbp
  136f2b:	48 89 e5             	mov    rbp,rsp
  136f2e:	90                   	nop
  136f2f:	5d                   	pop    rbp
  136f30:	c3                   	ret    

0000000000136f31 <load_driver>:
  136f31:	f3 0f 1e fa          	endbr64 
  136f35:	55                   	push   rbp
  136f36:	48 89 e5             	mov    rbp,rsp
  136f39:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  136f3d:	90                   	nop
  136f3e:	5d                   	pop    rbp
  136f3f:	c3                   	ret    

0000000000136f40 <reg_device>:
  136f40:	f3 0f 1e fa          	endbr64 
  136f44:	55                   	push   rbp
  136f45:	48 89 e5             	mov    rbp,rsp
  136f48:	53                   	push   rbx
  136f49:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
  136f4d:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  136f54:	e9 42 01 00 00       	jmp    13709b <reg_device+0x15b>
  136f59:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  136f5c:	48 63 d0             	movsxd rdx,eax
  136f5f:	48 89 d0             	mov    rax,rdx
  136f62:	48 c1 e0 02          	shl    rax,0x2
  136f66:	48 01 d0             	add    rax,rdx
  136f69:	48 c1 e0 02          	shl    rax,0x2
  136f6d:	48 01 d0             	add    rax,rdx
  136f70:	48 c1 e0 03          	shl    rax,0x3
  136f74:	48 05 50 5f 10 00    	add    rax,0x105f50
  136f7a:	8b 00                	mov    eax,DWORD PTR [rax]
  136f7c:	85 c0                	test   eax,eax
  136f7e:	0f 85 13 01 00 00    	jne    137097 <reg_device+0x157>
  136f84:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  136f87:	48 63 d0             	movsxd rdx,eax
  136f8a:	48 89 d0             	mov    rax,rdx
  136f8d:	48 c1 e0 02          	shl    rax,0x2
  136f91:	48 01 d0             	add    rax,rdx
  136f94:	48 c1 e0 02          	shl    rax,0x2
  136f98:	48 01 d0             	add    rax,rdx
  136f9b:	48 c1 e0 03          	shl    rax,0x3
  136f9f:	48 8d 90 40 5f 10 00 	lea    rdx,[rax+0x105f40]
  136fa6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  136faa:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  136fad:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  136fb1:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  136fb4:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  136fb8:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  136fbc:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  136fc0:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  136fc4:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  136fc8:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  136fcc:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  136fd0:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  136fd4:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  136fd8:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  136fdc:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  136fe0:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  136fe4:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  136fe8:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  136fec:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  136ff0:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  136ff4:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  136ff8:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  136ffc:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  137000:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  137004:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  137008:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  13700c:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  137010:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  137014:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  137018:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  13701c:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  137020:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  137024:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  137028:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  13702f:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  137036:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  13703d:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  137044:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  13704b:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  137052:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  137059:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  137060:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
  137067:	48 89 82 a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rax
  13706e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  137071:	48 63 d0             	movsxd rdx,eax
  137074:	48 89 d0             	mov    rax,rdx
  137077:	48 c1 e0 02          	shl    rax,0x2
  13707b:	48 01 d0             	add    rax,rdx
  13707e:	48 c1 e0 02          	shl    rax,0x2
  137082:	48 01 d0             	add    rax,rdx
  137085:	48 c1 e0 03          	shl    rax,0x3
  137089:	48 05 50 5f 10 00    	add    rax,0x105f50
  13708f:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
  137095:	eb 0e                	jmp    1370a5 <reg_device+0x165>
  137097:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  13709b:	83 7d f4 3f          	cmp    DWORD PTR [rbp-0xc],0x3f
  13709f:	0f 8e b4 fe ff ff    	jle    136f59 <reg_device+0x19>
  1370a5:	83 7d f4 40          	cmp    DWORD PTR [rbp-0xc],0x40
  1370a9:	75 0a                	jne    1370b5 <reg_device+0x175>
  1370ab:	b8 ff ff ff ff       	mov    eax,0xffffffff
  1370b0:	e9 6d 01 00 00       	jmp    137222 <reg_device+0x2e2>
  1370b5:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  1370bc:	00 
  1370bd:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  1370c0:	48 63 d0             	movsxd rdx,eax
  1370c3:	48 89 d0             	mov    rax,rdx
  1370c6:	48 c1 e0 02          	shl    rax,0x2
  1370ca:	48 01 d0             	add    rax,rdx
  1370cd:	48 c1 e0 02          	shl    rax,0x2
  1370d1:	48 01 d0             	add    rax,rdx
  1370d4:	48 c1 e0 03          	shl    rax,0x3
  1370d8:	48 05 40 5f 10 00    	add    rax,0x105f40
  1370de:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  1370e2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  1370e6:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  1370e9:	83 f8 03             	cmp    eax,0x3
  1370ec:	74 3b                	je     137129 <reg_device+0x1e9>
  1370ee:	83 f8 03             	cmp    eax,0x3
  1370f1:	7f 4b                	jg     13713e <reg_device+0x1fe>
  1370f3:	83 f8 01             	cmp    eax,0x1
  1370f6:	74 07                	je     1370ff <reg_device+0x1bf>
  1370f8:	83 f8 02             	cmp    eax,0x2
  1370fb:	74 17                	je     137114 <reg_device+0x1d4>
  1370fd:	eb 3f                	jmp    13713e <reg_device+0x1fe>
  1370ff:	48 8b 05 3a 44 fd ff 	mov    rax,QWORD PTR [rip+0xfffffffffffd443a]        # 10b540 <dev_tree>
  137106:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  13710a:	48 c7 45 e0 40 b5 10 	mov    QWORD PTR [rbp-0x20],0x10b540
  137111:	00 
  137112:	eb 34                	jmp    137148 <reg_device+0x208>
  137114:	48 8b 05 2d 44 fd ff 	mov    rax,QWORD PTR [rip+0xfffffffffffd442d]        # 10b548 <dev_tree+0x8>
  13711b:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  13711f:	48 c7 45 e0 48 b5 10 	mov    QWORD PTR [rbp-0x20],0x10b548
  137126:	00 
  137127:	eb 1f                	jmp    137148 <reg_device+0x208>
  137129:	48 8b 05 20 44 fd ff 	mov    rax,QWORD PTR [rip+0xfffffffffffd4420]        # 10b550 <dev_tree+0x10>
  137130:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  137134:	48 c7 45 e0 50 b5 10 	mov    QWORD PTR [rbp-0x20],0x10b550
  13713b:	00 
  13713c:	eb 0a                	jmp    137148 <reg_device+0x208>
  13713e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  137143:	e9 da 00 00 00       	jmp    137222 <reg_device+0x2e2>
  137148:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  13714d:	75 2b                	jne    13717a <reg_device+0x23a>
  13714f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  137153:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  137157:	48 89 10             	mov    QWORD PTR [rax],rdx
  13715a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  13715e:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x0
  137165:	00 00 00 00 
  137169:	eb 3d                	jmp    1371a8 <reg_device+0x268>
  13716b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13716f:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  137176:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  13717a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13717e:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  137185:	48 85 c0             	test   rax,rax
  137188:	75 e1                	jne    13716b <reg_device+0x22b>
  13718a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13718e:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  137192:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
  137199:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  13719d:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  1371a1:	48 89 90 98 00 00 00 	mov    QWORD PTR [rax+0x98],rdx
  1371a8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  1371ac:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x0
  1371b3:	00 00 00 00 
  1371b7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  1371bb:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  1371be:	83 f8 04             	cmp    eax,0x4
  1371c1:	74 3b                	je     1371fe <reg_device+0x2be>
  1371c3:	83 f8 04             	cmp    eax,0x4
  1371c6:	7f 56                	jg     13721e <reg_device+0x2de>
  1371c8:	83 f8 03             	cmp    eax,0x3
  1371cb:	74 21                	je     1371ee <reg_device+0x2ae>
  1371cd:	83 f8 03             	cmp    eax,0x3
  1371d0:	7f 4c                	jg     13721e <reg_device+0x2de>
  1371d2:	83 f8 01             	cmp    eax,0x1
  1371d5:	74 07                	je     1371de <reg_device+0x29e>
  1371d7:	83 f8 02             	cmp    eax,0x2
  1371da:	74 32                	je     13720e <reg_device+0x2ce>
  1371dc:	eb 40                	jmp    13721e <reg_device+0x2de>
  1371de:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  1371e2:	c7 80 a0 00 00 00 00 	mov    DWORD PTR [rax+0xa0],0x0
  1371e9:	00 00 00 
  1371ec:	eb 31                	jmp    13721f <reg_device+0x2df>
  1371ee:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  1371f2:	c7 80 a0 00 00 00 02 	mov    DWORD PTR [rax+0xa0],0x2
  1371f9:	00 00 00 
  1371fc:	eb 21                	jmp    13721f <reg_device+0x2df>
  1371fe:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  137202:	c7 80 a0 00 00 00 03 	mov    DWORD PTR [rax+0xa0],0x3
  137209:	00 00 00 
  13720c:	eb 11                	jmp    13721f <reg_device+0x2df>
  13720e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  137212:	c7 80 a0 00 00 00 01 	mov    DWORD PTR [rax+0xa0],0x1
  137219:	00 00 00 
  13721c:	eb 01                	jmp    13721f <reg_device+0x2df>
  13721e:	90                   	nop
  13721f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  137222:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  137226:	c9                   	leave  
  137227:	c3                   	ret    

0000000000137228 <reg_driver>:
  137228:	f3 0f 1e fa          	endbr64 
  13722c:	55                   	push   rbp
  13722d:	48 89 e5             	mov    rbp,rsp
  137230:	53                   	push   rbx
  137231:	48 89 7d e0          	mov    QWORD PTR [rbp-0x20],rdi
  137235:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  13723c:	e9 22 01 00 00       	jmp    137363 <reg_driver+0x13b>
  137241:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  137244:	48 63 d0             	movsxd rdx,eax
  137247:	48 89 d0             	mov    rax,rdx
  13724a:	48 c1 e0 02          	shl    rax,0x2
  13724e:	48 01 d0             	add    rax,rdx
  137251:	48 c1 e0 05          	shl    rax,0x5
  137255:	48 05 40 89 10 00    	add    rax,0x108940
  13725b:	8b 00                	mov    eax,DWORD PTR [rax]
  13725d:	85 c0                	test   eax,eax
  13725f:	0f 85 fa 00 00 00    	jne    13735f <reg_driver+0x137>
  137265:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  137268:	48 63 d0             	movsxd rdx,eax
  13726b:	48 89 d0             	mov    rax,rdx
  13726e:	48 c1 e0 02          	shl    rax,0x2
  137272:	48 01 d0             	add    rax,rdx
  137275:	48 c1 e0 05          	shl    rax,0x5
  137279:	48 8d 90 40 89 10 00 	lea    rdx,[rax+0x108940]
  137280:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  137284:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  137287:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  13728b:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  13728e:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  137292:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  137296:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  13729a:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  13729e:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  1372a2:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  1372a6:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  1372aa:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  1372ae:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  1372b2:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  1372b6:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  1372ba:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  1372be:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  1372c2:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  1372c6:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  1372ca:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  1372ce:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  1372d2:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  1372d6:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  1372da:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  1372de:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  1372e2:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  1372e6:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  1372ea:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  1372ee:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  1372f2:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  1372f6:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  1372fa:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  1372fe:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  137302:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  137309:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  137310:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  137317:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  13731e:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  137325:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  13732c:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  137333:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  13733a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  13733d:	48 63 d0             	movsxd rdx,eax
  137340:	48 89 d0             	mov    rax,rdx
  137343:	48 c1 e0 02          	shl    rax,0x2
  137347:	48 01 d0             	add    rax,rdx
  13734a:	48 c1 e0 05          	shl    rax,0x5
  13734e:	48 05 40 89 10 00    	add    rax,0x108940
  137354:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
  13735a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  13735d:	eb 13                	jmp    137372 <reg_driver+0x14a>
  13735f:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  137363:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  137367:	0f 8e d4 fe ff ff    	jle    137241 <reg_driver+0x19>
  13736d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  137372:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  137376:	c9                   	leave  
  137377:	c3                   	ret    

0000000000137378 <sys_find_dev>:
  137378:	f3 0f 1e fa          	endbr64 
  13737c:	55                   	push   rbp
  13737d:	48 89 e5             	mov    rbp,rsp
  137380:	48 83 ec 20          	sub    rsp,0x20
  137384:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  137388:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  13738f:	eb 6c                	jmp    1373fd <sys_find_dev+0x85>
  137391:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  137394:	48 63 d0             	movsxd rdx,eax
  137397:	48 89 d0             	mov    rax,rdx
  13739a:	48 c1 e0 02          	shl    rax,0x2
  13739e:	48 01 d0             	add    rax,rdx
  1373a1:	48 c1 e0 02          	shl    rax,0x2
  1373a5:	48 01 d0             	add    rax,rdx
  1373a8:	48 c1 e0 03          	shl    rax,0x3
  1373ac:	48 05 50 5f 10 00    	add    rax,0x105f50
  1373b2:	8b 00                	mov    eax,DWORD PTR [rax]
  1373b4:	85 c0                	test   eax,eax
  1373b6:	74 41                	je     1373f9 <sys_find_dev+0x81>
  1373b8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1373bb:	48 63 d0             	movsxd rdx,eax
  1373be:	48 89 d0             	mov    rax,rdx
  1373c1:	48 c1 e0 02          	shl    rax,0x2
  1373c5:	48 01 d0             	add    rax,rdx
  1373c8:	48 c1 e0 02          	shl    rax,0x2
  1373cc:	48 01 d0             	add    rax,rdx
  1373cf:	48 c1 e0 03          	shl    rax,0x3
  1373d3:	48 83 c0 10          	add    rax,0x10
  1373d7:	48 05 40 5f 10 00    	add    rax,0x105f40
  1373dd:	48 8d 50 04          	lea    rdx,[rax+0x4]
  1373e1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  1373e5:	48 89 d6             	mov    rsi,rdx
  1373e8:	48 89 c7             	mov    rdi,rax
  1373eb:	e8 5a 61 00 00       	call   13d54a <strcmp>
  1373f0:	85 c0                	test   eax,eax
  1373f2:	75 05                	jne    1373f9 <sys_find_dev+0x81>
  1373f4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1373f7:	eb 0f                	jmp    137408 <sys_find_dev+0x90>
  1373f9:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  1373fd:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  137401:	7e 8e                	jle    137391 <sys_find_dev+0x19>
  137403:	b8 ff ff ff ff       	mov    eax,0xffffffff
  137408:	c9                   	leave  
  137409:	c3                   	ret    

000000000013740a <sys_operate_dev>:
  13740a:	f3 0f 1e fa          	endbr64 
  13740e:	55                   	push   rbp
  13740f:	48 89 e5             	mov    rbp,rsp
  137412:	48 83 ec 30          	sub    rsp,0x30
  137416:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  13741a:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  13741d:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  137421:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  137428:	eb 67                	jmp    137491 <sys_operate_dev+0x87>
  13742a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13742d:	48 63 d0             	movsxd rdx,eax
  137430:	48 89 d0             	mov    rax,rdx
  137433:	48 c1 e0 02          	shl    rax,0x2
  137437:	48 01 d0             	add    rax,rdx
  13743a:	48 c1 e0 02          	shl    rax,0x2
  13743e:	48 01 d0             	add    rax,rdx
  137441:	48 c1 e0 03          	shl    rax,0x3
  137445:	48 05 50 5f 10 00    	add    rax,0x105f50
  13744b:	8b 00                	mov    eax,DWORD PTR [rax]
  13744d:	85 c0                	test   eax,eax
  13744f:	74 3c                	je     13748d <sys_operate_dev+0x83>
  137451:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  137454:	48 63 d0             	movsxd rdx,eax
  137457:	48 89 d0             	mov    rax,rdx
  13745a:	48 c1 e0 02          	shl    rax,0x2
  13745e:	48 01 d0             	add    rax,rdx
  137461:	48 c1 e0 02          	shl    rax,0x2
  137465:	48 01 d0             	add    rax,rdx
  137468:	48 c1 e0 03          	shl    rax,0x3
  13746c:	48 83 c0 10          	add    rax,0x10
  137470:	48 05 40 5f 10 00    	add    rax,0x105f40
  137476:	48 8d 50 04          	lea    rdx,[rax+0x4]
  13747a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13747e:	48 89 d6             	mov    rsi,rdx
  137481:	48 89 c7             	mov    rdi,rax
  137484:	e8 c1 60 00 00       	call   13d54a <strcmp>
  137489:	85 c0                	test   eax,eax
  13748b:	74 0c                	je     137499 <sys_operate_dev+0x8f>
  13748d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  137491:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  137495:	7e 93                	jle    13742a <sys_operate_dev+0x20>
  137497:	eb 01                	jmp    13749a <sys_operate_dev+0x90>
  137499:	90                   	nop
  13749a:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  13749e:	75 0a                	jne    1374aa <sys_operate_dev+0xa0>
  1374a0:	b8 ff ff ff ff       	mov    eax,0xffffffff
  1374a5:	e9 9c 02 00 00       	jmp    137746 <sys_operate_dev+0x33c>
  1374aa:	83 7d e4 0b          	cmp    DWORD PTR [rbp-0x1c],0xb
  1374ae:	0f 87 8d 02 00 00    	ja     137741 <sys_operate_dev+0x337>
  1374b4:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  1374b7:	48 8b 04 c5 b0 e3 13 	mov    rax,QWORD PTR [rax*8+0x13e3b0]
  1374be:	00 
  1374bf:	3e ff e0             	notrack jmp rax
  1374c2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1374c5:	48 63 d0             	movsxd rdx,eax
  1374c8:	48 89 d0             	mov    rax,rdx
  1374cb:	48 c1 e0 02          	shl    rax,0x2
  1374cf:	48 01 d0             	add    rax,rdx
  1374d2:	48 c1 e0 02          	shl    rax,0x2
  1374d6:	48 01 d0             	add    rax,rdx
  1374d9:	48 c1 e0 03          	shl    rax,0x3
  1374dd:	48 05 b8 5f 10 00    	add    rax,0x105fb8
  1374e3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  1374e6:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  1374ea:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  1374ee:	48 89 c7             	mov    rdi,rax
  1374f1:	ff d2                	call   rdx
  1374f3:	e9 4e 02 00 00       	jmp    137746 <sys_operate_dev+0x33c>
  1374f8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1374fb:	48 63 d0             	movsxd rdx,eax
  1374fe:	48 89 d0             	mov    rax,rdx
  137501:	48 c1 e0 02          	shl    rax,0x2
  137505:	48 01 d0             	add    rax,rdx
  137508:	48 c1 e0 02          	shl    rax,0x2
  13750c:	48 01 d0             	add    rax,rdx
  13750f:	48 c1 e0 03          	shl    rax,0x3
  137513:	48 05 b8 5f 10 00    	add    rax,0x105fb8
  137519:	48 8b 00             	mov    rax,QWORD PTR [rax]
  13751c:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  137520:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  137524:	48 89 c7             	mov    rdi,rax
  137527:	ff d2                	call   rdx
  137529:	e9 18 02 00 00       	jmp    137746 <sys_operate_dev+0x33c>
  13752e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  137531:	48 63 d0             	movsxd rdx,eax
  137534:	48 89 d0             	mov    rax,rdx
  137537:	48 c1 e0 02          	shl    rax,0x2
  13753b:	48 01 d0             	add    rax,rdx
  13753e:	48 c1 e0 02          	shl    rax,0x2
  137542:	48 01 d0             	add    rax,rdx
  137545:	48 c1 e0 03          	shl    rax,0x3
  137549:	48 05 b8 5f 10 00    	add    rax,0x105fb8
  13754f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  137552:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  137556:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  13755a:	48 89 c7             	mov    rdi,rax
  13755d:	ff d2                	call   rdx
  13755f:	e9 e2 01 00 00       	jmp    137746 <sys_operate_dev+0x33c>
  137564:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  137567:	48 63 d0             	movsxd rdx,eax
  13756a:	48 89 d0             	mov    rax,rdx
  13756d:	48 c1 e0 02          	shl    rax,0x2
  137571:	48 01 d0             	add    rax,rdx
  137574:	48 c1 e0 02          	shl    rax,0x2
  137578:	48 01 d0             	add    rax,rdx
  13757b:	48 c1 e0 03          	shl    rax,0x3
  13757f:	48 05 b8 5f 10 00    	add    rax,0x105fb8
  137585:	48 8b 00             	mov    rax,QWORD PTR [rax]
  137588:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  13758c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  137590:	48 89 c7             	mov    rdi,rax
  137593:	ff d2                	call   rdx
  137595:	e9 ac 01 00 00       	jmp    137746 <sys_operate_dev+0x33c>
  13759a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13759d:	48 63 d0             	movsxd rdx,eax
  1375a0:	48 89 d0             	mov    rax,rdx
  1375a3:	48 c1 e0 02          	shl    rax,0x2
  1375a7:	48 01 d0             	add    rax,rdx
  1375aa:	48 c1 e0 02          	shl    rax,0x2
  1375ae:	48 01 d0             	add    rax,rdx
  1375b1:	48 c1 e0 03          	shl    rax,0x3
  1375b5:	48 05 b8 5f 10 00    	add    rax,0x105fb8
  1375bb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  1375be:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  1375c2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  1375c6:	48 89 c7             	mov    rdi,rax
  1375c9:	ff d2                	call   rdx
  1375cb:	e9 76 01 00 00       	jmp    137746 <sys_operate_dev+0x33c>
  1375d0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1375d3:	48 63 d0             	movsxd rdx,eax
  1375d6:	48 89 d0             	mov    rax,rdx
  1375d9:	48 c1 e0 02          	shl    rax,0x2
  1375dd:	48 01 d0             	add    rax,rdx
  1375e0:	48 c1 e0 02          	shl    rax,0x2
  1375e4:	48 01 d0             	add    rax,rdx
  1375e7:	48 c1 e0 03          	shl    rax,0x3
  1375eb:	48 05 b8 5f 10 00    	add    rax,0x105fb8
  1375f1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  1375f4:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
  1375f8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  1375fc:	48 89 c7             	mov    rdi,rax
  1375ff:	ff d2                	call   rdx
  137601:	e9 40 01 00 00       	jmp    137746 <sys_operate_dev+0x33c>
  137606:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  137609:	48 63 d0             	movsxd rdx,eax
  13760c:	48 89 d0             	mov    rax,rdx
  13760f:	48 c1 e0 02          	shl    rax,0x2
  137613:	48 01 d0             	add    rax,rdx
  137616:	48 c1 e0 02          	shl    rax,0x2
  13761a:	48 01 d0             	add    rax,rdx
  13761d:	48 c1 e0 03          	shl    rax,0x3
  137621:	48 05 b8 5f 10 00    	add    rax,0x105fb8
  137627:	48 8b 00             	mov    rax,QWORD PTR [rax]
  13762a:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
  13762e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  137632:	48 89 c7             	mov    rdi,rax
  137635:	ff d2                	call   rdx
  137637:	e9 0a 01 00 00       	jmp    137746 <sys_operate_dev+0x33c>
  13763c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13763f:	48 63 d0             	movsxd rdx,eax
  137642:	48 89 d0             	mov    rax,rdx
  137645:	48 c1 e0 02          	shl    rax,0x2
  137649:	48 01 d0             	add    rax,rdx
  13764c:	48 c1 e0 02          	shl    rax,0x2
  137650:	48 01 d0             	add    rax,rdx
  137653:	48 c1 e0 03          	shl    rax,0x3
  137657:	48 05 b8 5f 10 00    	add    rax,0x105fb8
  13765d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  137660:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  137664:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  137668:	48 89 c7             	mov    rdi,rax
  13766b:	ff d2                	call   rdx
  13766d:	e9 d4 00 00 00       	jmp    137746 <sys_operate_dev+0x33c>
  137672:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  137675:	48 63 d0             	movsxd rdx,eax
  137678:	48 89 d0             	mov    rax,rdx
  13767b:	48 c1 e0 02          	shl    rax,0x2
  13767f:	48 01 d0             	add    rax,rdx
  137682:	48 c1 e0 02          	shl    rax,0x2
  137686:	48 01 d0             	add    rax,rdx
  137689:	48 c1 e0 03          	shl    rax,0x3
  13768d:	48 05 b8 5f 10 00    	add    rax,0x105fb8
  137693:	48 8b 00             	mov    rax,QWORD PTR [rax]
  137696:	48 8b 50 48          	mov    rdx,QWORD PTR [rax+0x48]
  13769a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  13769e:	48 89 c7             	mov    rdi,rax
  1376a1:	ff d2                	call   rdx
  1376a3:	e9 9e 00 00 00       	jmp    137746 <sys_operate_dev+0x33c>
  1376a8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1376ab:	48 63 d0             	movsxd rdx,eax
  1376ae:	48 89 d0             	mov    rax,rdx
  1376b1:	48 c1 e0 02          	shl    rax,0x2
  1376b5:	48 01 d0             	add    rax,rdx
  1376b8:	48 c1 e0 02          	shl    rax,0x2
  1376bc:	48 01 d0             	add    rax,rdx
  1376bf:	48 c1 e0 03          	shl    rax,0x3
  1376c3:	48 05 b8 5f 10 00    	add    rax,0x105fb8
  1376c9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  1376cc:	48 8b 50 50          	mov    rdx,QWORD PTR [rax+0x50]
  1376d0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  1376d4:	48 89 c7             	mov    rdi,rax
  1376d7:	ff d2                	call   rdx
  1376d9:	eb 6b                	jmp    137746 <sys_operate_dev+0x33c>
  1376db:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1376de:	48 63 d0             	movsxd rdx,eax
  1376e1:	48 89 d0             	mov    rax,rdx
  1376e4:	48 c1 e0 02          	shl    rax,0x2
  1376e8:	48 01 d0             	add    rax,rdx
  1376eb:	48 c1 e0 02          	shl    rax,0x2
  1376ef:	48 01 d0             	add    rax,rdx
  1376f2:	48 c1 e0 03          	shl    rax,0x3
  1376f6:	48 05 b8 5f 10 00    	add    rax,0x105fb8
  1376fc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  1376ff:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  137703:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  137707:	48 89 c7             	mov    rdi,rax
  13770a:	ff d2                	call   rdx
  13770c:	eb 38                	jmp    137746 <sys_operate_dev+0x33c>
  13770e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  137711:	48 63 d0             	movsxd rdx,eax
  137714:	48 89 d0             	mov    rax,rdx
  137717:	48 c1 e0 02          	shl    rax,0x2
  13771b:	48 01 d0             	add    rax,rdx
  13771e:	48 c1 e0 02          	shl    rax,0x2
  137722:	48 01 d0             	add    rax,rdx
  137725:	48 c1 e0 03          	shl    rax,0x3
  137729:	48 05 b8 5f 10 00    	add    rax,0x105fb8
  13772f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  137732:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
  137736:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  13773a:	48 89 c7             	mov    rdi,rax
  13773d:	ff d2                	call   rdx
  13773f:	eb 05                	jmp    137746 <sys_operate_dev+0x33c>
  137741:	b8 ff ff ff ff       	mov    eax,0xffffffff
  137746:	c9                   	leave  
  137747:	c3                   	ret    

0000000000137748 <call_drv_func>:
  137748:	f3 0f 1e fa          	endbr64 
  13774c:	55                   	push   rbp
  13774d:	48 89 e5             	mov    rbp,rsp
  137750:	48 83 ec 10          	sub    rsp,0x10
  137754:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  137757:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  13775a:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  13775e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  137761:	48 63 d0             	movsxd rdx,eax
  137764:	48 89 d0             	mov    rax,rdx
  137767:	48 c1 e0 02          	shl    rax,0x2
  13776b:	48 01 d0             	add    rax,rdx
  13776e:	48 c1 e0 05          	shl    rax,0x5
  137772:	48 05 40 89 10 00    	add    rax,0x108940
  137778:	8b 00                	mov    eax,DWORD PTR [rax]
  13777a:	85 c0                	test   eax,eax
  13777c:	75 0a                	jne    137788 <call_drv_func+0x40>
  13777e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  137783:	e9 15 02 00 00       	jmp    13799d <call_drv_func+0x255>
  137788:	83 7d f8 0b          	cmp    DWORD PTR [rbp-0x8],0xb
  13778c:	0f 87 06 02 00 00    	ja     137998 <call_drv_func+0x250>
  137792:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  137795:	48 8b 04 c5 10 e4 13 	mov    rax,QWORD PTR [rax*8+0x13e410]
  13779c:	00 
  13779d:	3e ff e0             	notrack jmp rax
  1377a0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1377a3:	48 63 d0             	movsxd rdx,eax
  1377a6:	48 89 d0             	mov    rax,rdx
  1377a9:	48 c1 e0 02          	shl    rax,0x2
  1377ad:	48 01 d0             	add    rax,rdx
  1377b0:	48 c1 e0 05          	shl    rax,0x5
  1377b4:	48 05 48 89 10 00    	add    rax,0x108948
  1377ba:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  1377bd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  1377c1:	48 89 c7             	mov    rdi,rax
  1377c4:	ff d2                	call   rdx
  1377c6:	e9 d2 01 00 00       	jmp    13799d <call_drv_func+0x255>
  1377cb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1377ce:	48 63 d0             	movsxd rdx,eax
  1377d1:	48 89 d0             	mov    rax,rdx
  1377d4:	48 c1 e0 02          	shl    rax,0x2
  1377d8:	48 01 d0             	add    rax,rdx
  1377db:	48 c1 e0 05          	shl    rax,0x5
  1377df:	48 05 50 89 10 00    	add    rax,0x108950
  1377e5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  1377e8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  1377ec:	48 89 c7             	mov    rdi,rax
  1377ef:	ff d2                	call   rdx
  1377f1:	e9 a7 01 00 00       	jmp    13799d <call_drv_func+0x255>
  1377f6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1377f9:	48 63 d0             	movsxd rdx,eax
  1377fc:	48 89 d0             	mov    rax,rdx
  1377ff:	48 c1 e0 02          	shl    rax,0x2
  137803:	48 01 d0             	add    rax,rdx
  137806:	48 c1 e0 05          	shl    rax,0x5
  13780a:	48 05 58 89 10 00    	add    rax,0x108958
  137810:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  137813:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  137817:	48 89 c7             	mov    rdi,rax
  13781a:	ff d2                	call   rdx
  13781c:	e9 7c 01 00 00       	jmp    13799d <call_drv_func+0x255>
  137821:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  137824:	48 63 d0             	movsxd rdx,eax
  137827:	48 89 d0             	mov    rax,rdx
  13782a:	48 c1 e0 02          	shl    rax,0x2
  13782e:	48 01 d0             	add    rax,rdx
  137831:	48 c1 e0 05          	shl    rax,0x5
  137835:	48 05 60 89 10 00    	add    rax,0x108960
  13783b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  13783e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  137842:	48 89 c7             	mov    rdi,rax
  137845:	ff d2                	call   rdx
  137847:	e9 51 01 00 00       	jmp    13799d <call_drv_func+0x255>
  13784c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13784f:	48 63 d0             	movsxd rdx,eax
  137852:	48 89 d0             	mov    rax,rdx
  137855:	48 c1 e0 02          	shl    rax,0x2
  137859:	48 01 d0             	add    rax,rdx
  13785c:	48 c1 e0 05          	shl    rax,0x5
  137860:	48 05 68 89 10 00    	add    rax,0x108968
  137866:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  137869:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  13786d:	48 89 c7             	mov    rdi,rax
  137870:	ff d2                	call   rdx
  137872:	e9 26 01 00 00       	jmp    13799d <call_drv_func+0x255>
  137877:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13787a:	48 63 d0             	movsxd rdx,eax
  13787d:	48 89 d0             	mov    rax,rdx
  137880:	48 c1 e0 02          	shl    rax,0x2
  137884:	48 01 d0             	add    rax,rdx
  137887:	48 c1 e0 05          	shl    rax,0x5
  13788b:	48 05 70 89 10 00    	add    rax,0x108970
  137891:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  137894:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  137898:	48 89 c7             	mov    rdi,rax
  13789b:	ff d2                	call   rdx
  13789d:	e9 fb 00 00 00       	jmp    13799d <call_drv_func+0x255>
  1378a2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1378a5:	48 63 d0             	movsxd rdx,eax
  1378a8:	48 89 d0             	mov    rax,rdx
  1378ab:	48 c1 e0 02          	shl    rax,0x2
  1378af:	48 01 d0             	add    rax,rdx
  1378b2:	48 c1 e0 05          	shl    rax,0x5
  1378b6:	48 05 78 89 10 00    	add    rax,0x108978
  1378bc:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  1378bf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  1378c3:	48 89 c7             	mov    rdi,rax
  1378c6:	ff d2                	call   rdx
  1378c8:	e9 d0 00 00 00       	jmp    13799d <call_drv_func+0x255>
  1378cd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1378d0:	48 63 d0             	movsxd rdx,eax
  1378d3:	48 89 d0             	mov    rax,rdx
  1378d6:	48 c1 e0 02          	shl    rax,0x2
  1378da:	48 01 d0             	add    rax,rdx
  1378dd:	48 c1 e0 05          	shl    rax,0x5
  1378e1:	48 05 80 89 10 00    	add    rax,0x108980
  1378e7:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  1378ea:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  1378ee:	48 89 c7             	mov    rdi,rax
  1378f1:	ff d2                	call   rdx
  1378f3:	e9 a5 00 00 00       	jmp    13799d <call_drv_func+0x255>
  1378f8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1378fb:	48 63 d0             	movsxd rdx,eax
  1378fe:	48 89 d0             	mov    rax,rdx
  137901:	48 c1 e0 02          	shl    rax,0x2
  137905:	48 01 d0             	add    rax,rdx
  137908:	48 c1 e0 05          	shl    rax,0x5
  13790c:	48 05 88 89 10 00    	add    rax,0x108988
  137912:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  137915:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  137919:	48 89 c7             	mov    rdi,rax
  13791c:	ff d2                	call   rdx
  13791e:	eb 7d                	jmp    13799d <call_drv_func+0x255>
  137920:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  137923:	48 63 d0             	movsxd rdx,eax
  137926:	48 89 d0             	mov    rax,rdx
  137929:	48 c1 e0 02          	shl    rax,0x2
  13792d:	48 01 d0             	add    rax,rdx
  137930:	48 c1 e0 05          	shl    rax,0x5
  137934:	48 05 90 89 10 00    	add    rax,0x108990
  13793a:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  13793d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  137941:	48 89 c7             	mov    rdi,rax
  137944:	ff d2                	call   rdx
  137946:	eb 55                	jmp    13799d <call_drv_func+0x255>
  137948:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13794b:	48 63 d0             	movsxd rdx,eax
  13794e:	48 89 d0             	mov    rax,rdx
  137951:	48 c1 e0 02          	shl    rax,0x2
  137955:	48 01 d0             	add    rax,rdx
  137958:	48 c1 e0 05          	shl    rax,0x5
  13795c:	48 05 98 89 10 00    	add    rax,0x108998
  137962:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  137965:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  137969:	48 89 c7             	mov    rdi,rax
  13796c:	ff d2                	call   rdx
  13796e:	eb 2d                	jmp    13799d <call_drv_func+0x255>
  137970:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  137973:	48 63 d0             	movsxd rdx,eax
  137976:	48 89 d0             	mov    rax,rdx
  137979:	48 c1 e0 02          	shl    rax,0x2
  13797d:	48 01 d0             	add    rax,rdx
  137980:	48 c1 e0 05          	shl    rax,0x5
  137984:	48 05 a0 89 10 00    	add    rax,0x1089a0
  13798a:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  13798d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  137991:	48 89 c7             	mov    rdi,rax
  137994:	ff d2                	call   rdx
  137996:	eb 05                	jmp    13799d <call_drv_func+0x255>
  137998:	b8 ff ff ff ff       	mov    eax,0xffffffff
  13799d:	c9                   	leave  
  13799e:	c3                   	ret    

000000000013799f <dispose_device>:
  13799f:	f3 0f 1e fa          	endbr64 
  1379a3:	55                   	push   rbp
  1379a4:	48 89 e5             	mov    rbp,rsp
  1379a7:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  1379aa:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  1379ad:	48 63 d0             	movsxd rdx,eax
  1379b0:	48 89 d0             	mov    rax,rdx
  1379b3:	48 c1 e0 02          	shl    rax,0x2
  1379b7:	48 01 d0             	add    rax,rdx
  1379ba:	48 c1 e0 02          	shl    rax,0x2
  1379be:	48 01 d0             	add    rax,rdx
  1379c1:	48 c1 e0 03          	shl    rax,0x3
  1379c5:	48 05 50 5f 10 00    	add    rax,0x105f50
  1379cb:	8b 00                	mov    eax,DWORD PTR [rax]
  1379cd:	83 f8 01             	cmp    eax,0x1
  1379d0:	74 07                	je     1379d9 <dispose_device+0x3a>
  1379d2:	b8 ff ff ff ff       	mov    eax,0xffffffff
  1379d7:	eb 62                	jmp    137a3b <dispose_device+0x9c>
  1379d9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  1379dc:	48 63 d0             	movsxd rdx,eax
  1379df:	48 89 d0             	mov    rax,rdx
  1379e2:	48 c1 e0 02          	shl    rax,0x2
  1379e6:	48 01 d0             	add    rax,rdx
  1379e9:	48 c1 e0 02          	shl    rax,0x2
  1379ed:	48 01 d0             	add    rax,rdx
  1379f0:	48 c1 e0 03          	shl    rax,0x3
  1379f4:	48 05 40 5f 10 00    	add    rax,0x105f40
  1379fa:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  1379fe:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  137a02:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  137a09:	48 85 c0             	test   rax,rax
  137a0c:	74 1d                	je     137a2b <dispose_device+0x8c>
  137a0e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  137a12:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  137a19:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  137a1d:	48 8b 92 90 00 00 00 	mov    rdx,QWORD PTR [rdx+0x90]
  137a24:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
  137a2b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  137a2f:	c7 40 10 00 00 00 00 	mov    DWORD PTR [rax+0x10],0x0
  137a36:	b8 00 00 00 00       	mov    eax,0x0
  137a3b:	5d                   	pop    rbp
  137a3c:	c3                   	ret    

0000000000137a3d <dispose_driver>:
  137a3d:	f3 0f 1e fa          	endbr64 
  137a41:	55                   	push   rbp
  137a42:	48 89 e5             	mov    rbp,rsp
  137a45:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  137a49:	90                   	nop
  137a4a:	5d                   	pop    rbp
  137a4b:	c3                   	ret    

0000000000137a4c <get_dev>:
  137a4c:	f3 0f 1e fa          	endbr64 
  137a50:	55                   	push   rbp
  137a51:	48 89 e5             	mov    rbp,rsp
  137a54:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  137a57:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  137a5a:	48 63 d0             	movsxd rdx,eax
  137a5d:	48 89 d0             	mov    rax,rdx
  137a60:	48 c1 e0 02          	shl    rax,0x2
  137a64:	48 01 d0             	add    rax,rdx
  137a67:	48 c1 e0 02          	shl    rax,0x2
  137a6b:	48 01 d0             	add    rax,rdx
  137a6e:	48 c1 e0 03          	shl    rax,0x3
  137a72:	48 05 40 5f 10 00    	add    rax,0x105f40
  137a78:	5d                   	pop    rbp
  137a79:	c3                   	ret    

0000000000137a7a <get_drv>:
  137a7a:	f3 0f 1e fa          	endbr64 
  137a7e:	55                   	push   rbp
  137a7f:	48 89 e5             	mov    rbp,rsp
  137a82:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  137a85:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  137a88:	48 63 d0             	movsxd rdx,eax
  137a8b:	48 89 d0             	mov    rax,rdx
  137a8e:	48 c1 e0 02          	shl    rax,0x2
  137a92:	48 01 d0             	add    rax,rdx
  137a95:	48 c1 e0 05          	shl    rax,0x5
  137a99:	48 05 40 89 10 00    	add    rax,0x108940
  137a9f:	5d                   	pop    rbp
  137aa0:	c3                   	ret    

0000000000137aa1 <make_request>:
  137aa1:	f3 0f 1e fa          	endbr64 
  137aa5:	55                   	push   rbp
  137aa6:	48 89 e5             	mov    rbp,rsp
  137aa9:	53                   	push   rbx
  137aaa:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
  137aae:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  137ab5:	eb 23                	jmp    137ada <make_request+0x39>
  137ab7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  137aba:	48 63 d0             	movsxd rdx,eax
  137abd:	48 89 d0             	mov    rax,rdx
  137ac0:	48 01 c0             	add    rax,rax
  137ac3:	48 01 d0             	add    rax,rdx
  137ac6:	48 c1 e0 06          	shl    rax,0x6
  137aca:	48 05 ec 9d 10 00    	add    rax,0x109dec
  137ad0:	8b 00                	mov    eax,DWORD PTR [rax]
  137ad2:	85 c0                	test   eax,eax
  137ad4:	74 0c                	je     137ae2 <make_request+0x41>
  137ad6:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  137ada:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  137ade:	7e d7                	jle    137ab7 <make_request+0x16>
  137ae0:	eb 01                	jmp    137ae3 <make_request+0x42>
  137ae2:	90                   	nop
  137ae3:	83 7d f4 20          	cmp    DWORD PTR [rbp-0xc],0x20
  137ae7:	75 0a                	jne    137af3 <make_request+0x52>
  137ae9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  137aee:	e9 e7 01 00 00       	jmp    137cda <make_request+0x239>
  137af3:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  137af6:	48 63 d0             	movsxd rdx,eax
  137af9:	48 89 d0             	mov    rax,rdx
  137afc:	48 01 c0             	add    rax,rax
  137aff:	48 01 d0             	add    rax,rdx
  137b02:	48 c1 e0 06          	shl    rax,0x6
  137b06:	48 8d 90 40 9d 10 00 	lea    rdx,[rax+0x109d40]
  137b0d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  137b11:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  137b14:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  137b18:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  137b1b:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  137b1f:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  137b23:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  137b27:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  137b2b:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  137b2f:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  137b33:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  137b37:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  137b3b:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  137b3f:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  137b43:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  137b47:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  137b4b:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  137b4f:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  137b53:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  137b57:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  137b5b:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  137b5f:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  137b63:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  137b67:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  137b6b:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  137b6f:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  137b73:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  137b77:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  137b7b:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  137b7f:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  137b83:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  137b87:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  137b8b:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  137b8f:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  137b96:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  137b9d:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  137ba4:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  137bab:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  137bb2:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  137bb9:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  137bc0:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  137bc7:	48 8b 88 a0 00 00 00 	mov    rcx,QWORD PTR [rax+0xa0]
  137bce:	48 8b 98 a8 00 00 00 	mov    rbx,QWORD PTR [rax+0xa8]
  137bd5:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  137bdc:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  137be3:	48 8b 88 b0 00 00 00 	mov    rcx,QWORD PTR [rax+0xb0]
  137bea:	48 8b 98 b8 00 00 00 	mov    rbx,QWORD PTR [rax+0xb8]
  137bf1:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  137bf8:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
  137bff:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  137c03:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  137c09:	48 63 d0             	movsxd rdx,eax
  137c0c:	48 89 d0             	mov    rax,rdx
  137c0f:	48 c1 e0 02          	shl    rax,0x2
  137c13:	48 01 d0             	add    rax,rdx
  137c16:	48 c1 e0 02          	shl    rax,0x2
  137c1a:	48 01 d0             	add    rax,rdx
  137c1d:	48 c1 e0 03          	shl    rax,0x3
  137c21:	48 05 40 5f 10 00    	add    rax,0x105f40
  137c27:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  137c2b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  137c2f:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  137c36:	48 85 c0             	test   rax,rax
  137c39:	75 27                	jne    137c62 <make_request+0x1c1>
  137c3b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  137c3e:	48 63 d0             	movsxd rdx,eax
  137c41:	48 89 d0             	mov    rax,rdx
  137c44:	48 01 c0             	add    rax,rax
  137c47:	48 01 d0             	add    rax,rdx
  137c4a:	48 c1 e0 06          	shl    rax,0x6
  137c4e:	48 8d 90 40 9d 10 00 	lea    rdx,[rax+0x109d40]
  137c55:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  137c59:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
  137c60:	eb 75                	jmp    137cd7 <make_request+0x236>
  137c62:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  137c66:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  137c6d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  137c71:	eb 0f                	jmp    137c82 <make_request+0x1e1>
  137c73:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  137c77:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  137c7e:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  137c82:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  137c86:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  137c8d:	48 85 c0             	test   rax,rax
  137c90:	75 e1                	jne    137c73 <make_request+0x1d2>
  137c92:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  137c95:	48 63 d0             	movsxd rdx,eax
  137c98:	48 89 d0             	mov    rax,rdx
  137c9b:	48 01 c0             	add    rax,rax
  137c9e:	48 01 d0             	add    rax,rdx
  137ca1:	48 c1 e0 06          	shl    rax,0x6
  137ca5:	48 8d 90 40 9d 10 00 	lea    rdx,[rax+0x109d40]
  137cac:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  137cb0:	48 89 90 b8 00 00 00 	mov    QWORD PTR [rax+0xb8],rdx
  137cb7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  137cba:	48 63 d0             	movsxd rdx,eax
  137cbd:	48 89 d0             	mov    rax,rdx
  137cc0:	48 01 c0             	add    rax,rax
  137cc3:	48 01 d0             	add    rax,rdx
  137cc6:	48 c1 e0 06          	shl    rax,0x6
  137cca:	48 05 f8 9d 10 00    	add    rax,0x109df8
  137cd0:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
  137cd7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  137cda:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  137cde:	c9                   	leave  
  137cdf:	c3                   	ret    

0000000000137ce0 <do_req>:
  137ce0:	f3 0f 1e fa          	endbr64 
  137ce4:	55                   	push   rbp
  137ce5:	48 89 e5             	mov    rbp,rsp
  137ce8:	48 83 ec 10          	sub    rsp,0x10
  137cec:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  137cf3:	e9 ab 00 00 00       	jmp    137da3 <do_req+0xc3>
  137cf8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  137cfb:	48 98                	cdqe   
  137cfd:	48 8b 04 c5 40 b5 10 	mov    rax,QWORD PTR [rax*8+0x10b540]
  137d04:	00 
  137d05:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  137d09:	e9 86 00 00 00       	jmp    137d94 <do_req+0xb4>
  137d0e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  137d12:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  137d19:	48 85 c0             	test   rax,rax
  137d1c:	75 67                	jne    137d85 <do_req+0xa5>
  137d1e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  137d22:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  137d29:	48 85 c0             	test   rax,rax
  137d2c:	74 57                	je     137d85 <do_req+0xa5>
  137d2e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  137d32:	48 8b 90 88 00 00 00 	mov    rdx,QWORD PTR [rax+0x88]
  137d39:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  137d3d:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
  137d44:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  137d48:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  137d4f:	48 8b 90 b8 00 00 00 	mov    rdx,QWORD PTR [rax+0xb8]
  137d56:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  137d5a:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
  137d61:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  137d65:	8b 80 a0 00 00 00    	mov    eax,DWORD PTR [rax+0xa0]
  137d6b:	48 98                	cdqe   
  137d6d:	48 8b 14 c5 60 dc 13 	mov    rdx,QWORD PTR [rax*8+0x13dc60]
  137d74:	00 
  137d75:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  137d79:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  137d80:	48 89 c7             	mov    rdi,rax
  137d83:	ff d2                	call   rdx
  137d85:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  137d89:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  137d90:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  137d94:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  137d99:	0f 85 6f ff ff ff    	jne    137d0e <do_req+0x2e>
  137d9f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  137da3:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  137da7:	0f 8e 4b ff ff ff    	jle    137cf8 <do_req+0x18>
  137dad:	b8 00 00 00 00       	mov    eax,0x0
  137db2:	c9                   	leave  
  137db3:	c3                   	ret    

0000000000137db4 <wait_on_req>:
  137db4:	f3 0f 1e fa          	endbr64 
  137db8:	55                   	push   rbp
  137db9:	48 89 e5             	mov    rbp,rsp
  137dbc:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  137dbf:	90                   	nop
  137dc0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  137dc3:	48 63 d0             	movsxd rdx,eax
  137dc6:	48 89 d0             	mov    rax,rdx
  137dc9:	48 01 c0             	add    rax,rax
  137dcc:	48 01 d0             	add    rax,rdx
  137dcf:	48 c1 e0 06          	shl    rax,0x6
  137dd3:	48 05 ec 9d 10 00    	add    rax,0x109dec
  137dd9:	8b 00                	mov    eax,DWORD PTR [rax]
  137ddb:	83 f8 03             	cmp    eax,0x3
  137dde:	75 e0                	jne    137dc0 <wait_on_req+0xc>
  137de0:	90                   	nop
  137de1:	90                   	nop
  137de2:	5d                   	pop    rbp
  137de3:	c3                   	ret    

0000000000137de4 <clear_req>:
  137de4:	f3 0f 1e fa          	endbr64 
  137de8:	55                   	push   rbp
  137de9:	48 89 e5             	mov    rbp,rsp
  137dec:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  137def:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  137df2:	48 63 d0             	movsxd rdx,eax
  137df5:	48 89 d0             	mov    rax,rdx
  137df8:	48 01 c0             	add    rax,rax
  137dfb:	48 01 d0             	add    rax,rdx
  137dfe:	48 c1 e0 06          	shl    rax,0x6
  137e02:	48 05 ec 9d 10 00    	add    rax,0x109dec
  137e08:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  137e0e:	90                   	nop
  137e0f:	5d                   	pop    rbp
  137e10:	c3                   	ret    

0000000000137e11 <init_proc>:
  137e11:	f3 0f 1e fa          	endbr64 
  137e15:	55                   	push   rbp
  137e16:	48 89 e5             	mov    rbp,rsp
  137e19:	48 83 ec 10          	sub    rsp,0x10
  137e1d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  137e24:	eb 4c                	jmp    137e72 <init_proc+0x61>
  137e26:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  137e29:	48 98                	cdqe   
  137e2b:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  137e32:	48 05 60 b5 10 00    	add    rax,0x10b560
  137e38:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
  137e3e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  137e41:	48 98                	cdqe   
  137e43:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  137e4a:	48 05 64 b5 10 00    	add    rax,0x10b564
  137e50:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
  137e56:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  137e59:	48 98                	cdqe   
  137e5b:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  137e62:	48 05 c0 b5 10 00    	add    rax,0x10b5c0
  137e68:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
  137e6e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  137e72:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  137e76:	7e ae                	jle    137e26 <init_proc+0x15>
  137e78:	c7 05 ae d2 fd ff 00 	mov    DWORD PTR [rip+0xfffffffffffdd2ae],0x0        # 115130 <cur_proc>
  137e7f:	00 00 00 
  137e82:	c7 05 a8 d2 fd ff 01 	mov    DWORD PTR [rip+0xfffffffffffdd2a8],0x1        # 115134 <pidd>
  137e89:	00 00 00 
  137e8c:	b8 00 00 00 00       	mov    eax,0x0
  137e91:	e8 38 00 00 00       	call   137ece <create_proc>
  137e96:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  137e99:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  137e9c:	48 98                	cdqe   
  137e9e:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  137ea5:	48 05 64 b5 10 00    	add    rax,0x10b564
  137eab:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
  137eb1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  137eb4:	83 c0 03             	add    eax,0x3
  137eb7:	c1 e0 04             	shl    eax,0x4
  137eba:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  137ebd:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  137ec0:	01 c0                	add    eax,eax
  137ec2:	83 c0 05             	add    eax,0x5
  137ec5:	c1 e0 03             	shl    eax,0x3
  137ec8:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  137ecb:	90                   	nop
  137ecc:	c9                   	leave  
  137ecd:	c3                   	ret    

0000000000137ece <create_proc>:
  137ece:	f3 0f 1e fa          	endbr64 
  137ed2:	55                   	push   rbp
  137ed3:	48 89 e5             	mov    rbp,rsp
  137ed6:	48 83 ec 10          	sub    rsp,0x10
  137eda:	b8 00 00 00 00       	mov    eax,0x0
  137edf:	e8 7d 00 00 00       	call   137f61 <req_proc>
  137ee4:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  137ee7:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  137eeb:	75 07                	jne    137ef4 <create_proc+0x26>
  137eed:	b8 ff ff ff ff       	mov    eax,0xffffffff
  137ef2:	eb 6b                	jmp    137f5f <create_proc+0x91>
  137ef4:	c7 45 f8 ff fb 09 00 	mov    DWORD PTR [rbp-0x8],0x9fbff
  137efb:	89 65 f8             	mov    DWORD PTR [rbp-0x8],esp
  137efe:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  137f01:	48 98                	cdqe   
  137f03:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  137f06:	52                   	push   rdx
  137f07:	6a 00                	push   0x0
  137f09:	6a 00                	push   0x0
  137f0b:	6a 00                	push   0x0
  137f0d:	6a 00                	push   0x0
  137f0f:	50                   	push   rax
  137f10:	6a 17                	push   0x17
  137f12:	6a 17                	push   0x17
  137f14:	6a 17                	push   0x17
  137f16:	6a 17                	push   0x17
  137f18:	41 b9 0f 00 00 00    	mov    r9d,0xf
  137f1e:	41 b8 17 00 00 00    	mov    r8d,0x17
  137f24:	b9 00 00 00 00       	mov    ecx,0x0
  137f29:	ba 00 00 00 00       	mov    edx,0x0
  137f2e:	be 00 00 00 00       	mov    esi,0x0
  137f33:	bf 00 00 00 00       	mov    edi,0x0
  137f38:	e8 f0 00 00 00       	call   13802d <set_proc>
  137f3d:	48 83 c4 50          	add    rsp,0x50
  137f41:	ba b1 82 13 00       	mov    edx,0x1382b1
  137f46:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  137f49:	48 98                	cdqe   
  137f4b:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  137f52:	48 05 30 b7 10 00    	add    rax,0x10b730
  137f58:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
  137f5c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  137f5f:	c9                   	leave  
  137f60:	c3                   	ret    

0000000000137f61 <req_proc>:
  137f61:	f3 0f 1e fa          	endbr64 
  137f65:	55                   	push   rbp
  137f66:	48 89 e5             	mov    rbp,rsp
  137f69:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  137f70:	eb 04                	jmp    137f76 <req_proc+0x15>
  137f72:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  137f76:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  137f79:	48 98                	cdqe   
  137f7b:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  137f82:	48 05 60 b5 10 00    	add    rax,0x10b560
  137f88:	8b 00                	mov    eax,DWORD PTR [rax]
  137f8a:	83 f8 ff             	cmp    eax,0xffffffff
  137f8d:	74 1f                	je     137fae <req_proc+0x4d>
  137f8f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  137f92:	48 98                	cdqe   
  137f94:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  137f9b:	48 05 64 b5 10 00    	add    rax,0x10b564
  137fa1:	8b 00                	mov    eax,DWORD PTR [rax]
  137fa3:	83 f8 03             	cmp    eax,0x3
  137fa6:	74 06                	je     137fae <req_proc+0x4d>
  137fa8:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  137fac:	7e c4                	jle    137f72 <req_proc+0x11>
  137fae:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  137fb2:	7e 07                	jle    137fbb <req_proc+0x5a>
  137fb4:	b8 ff ff ff ff       	mov    eax,0xffffffff
  137fb9:	eb 70                	jmp    13802b <req_proc+0xca>
  137fbb:	8b 05 73 d1 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdd173]        # 115134 <pidd>
  137fc1:	8d 50 01             	lea    edx,[rax+0x1]
  137fc4:	89 15 6a d1 fd ff    	mov    DWORD PTR [rip+0xfffffffffffdd16a],edx        # 115134 <pidd>
  137fca:	89 c2                	mov    edx,eax
  137fcc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  137fcf:	48 98                	cdqe   
  137fd1:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  137fd8:	48 05 60 b5 10 00    	add    rax,0x10b560
  137fde:	89 10                	mov    DWORD PTR [rax],edx
  137fe0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  137fe3:	48 98                	cdqe   
  137fe5:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  137fec:	48 05 64 b5 10 00    	add    rax,0x10b564
  137ff2:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
  137ff8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  137ffb:	48 98                	cdqe   
  137ffd:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  138004:	48 05 68 b5 10 00    	add    rax,0x10b568
  13800a:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  138010:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  138013:	48 98                	cdqe   
  138015:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  13801c:	48 05 6c b5 10 00    	add    rax,0x10b56c
  138022:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  138028:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13802b:	5d                   	pop    rbp
  13802c:	c3                   	ret    

000000000013802d <set_proc>:
  13802d:	f3 0f 1e fa          	endbr64 
  138031:	55                   	push   rbp
  138032:	48 89 e5             	mov    rbp,rsp
  138035:	48 83 ec 40          	sub    rsp,0x40
  138039:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  13803d:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  138041:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  138045:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  138049:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
  13804d:	4c 89 4d c0          	mov    QWORD PTR [rbp-0x40],r9
  138051:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  138054:	48 98                	cdqe   
  138056:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  13805d:	48 05 60 b5 10 00    	add    rax,0x10b560
  138063:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  138067:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13806b:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  13806f:	48 89 90 ec 01 00 00 	mov    QWORD PTR [rax+0x1ec],rdx
  138076:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13807a:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  13807e:	48 89 90 04 02 00 00 	mov    QWORD PTR [rax+0x204],rdx
  138085:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138089:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  13808d:	48 89 90 f4 01 00 00 	mov    QWORD PTR [rax+0x1f4],rdx
  138094:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138098:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  13809c:	48 89 90 fc 01 00 00 	mov    QWORD PTR [rax+0x1fc],rdx
  1380a3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1380a7:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  1380ab:	48 89 90 2c 02 00 00 	mov    QWORD PTR [rax+0x22c],rdx
  1380b2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1380b6:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  1380ba:	48 89 90 34 02 00 00 	mov    QWORD PTR [rax+0x234],rdx
  1380c1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1380c5:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  1380c9:	48 89 90 3c 02 00 00 	mov    QWORD PTR [rax+0x23c],rdx
  1380d0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1380d4:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  1380d8:	48 89 90 ac 01 00 00 	mov    QWORD PTR [rax+0x1ac],rdx
  1380df:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1380e3:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  1380e7:	48 89 90 bc 01 00 00 	mov    QWORD PTR [rax+0x1bc],rdx
  1380ee:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1380f2:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  1380f6:	48 89 90 cc 01 00 00 	mov    QWORD PTR [rax+0x1cc],rdx
  1380fd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138101:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  138105:	48 89 90 44 02 00 00 	mov    QWORD PTR [rax+0x244],rdx
  13810c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138110:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  138114:	48 89 90 4c 02 00 00 	mov    QWORD PTR [rax+0x24c],rdx
  13811b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13811f:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  138123:	48 89 90 54 02 00 00 	mov    QWORD PTR [rax+0x254],rdx
  13812a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13812e:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  138132:	48 89 90 0c 02 00 00 	mov    QWORD PTR [rax+0x20c],rdx
  138139:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13813d:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  138141:	48 89 90 a4 01 00 00 	mov    QWORD PTR [rax+0x1a4],rdx
  138148:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13814c:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  138150:	48 89 90 b4 01 00 00 	mov    QWORD PTR [rax+0x1b4],rdx
  138157:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13815b:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  13815f:	48 89 90 c4 01 00 00 	mov    QWORD PTR [rax+0x1c4],rdx
  138166:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13816a:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
  13816e:	48 89 90 14 02 00 00 	mov    QWORD PTR [rax+0x214],rdx
  138175:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138179:	48 8b 55 40          	mov    rdx,QWORD PTR [rbp+0x40]
  13817d:	48 89 90 1c 02 00 00 	mov    QWORD PTR [rax+0x21c],rdx
  138184:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138188:	48 8b 55 48          	mov    rdx,QWORD PTR [rbp+0x48]
  13818c:	48 89 90 24 02 00 00 	mov    QWORD PTR [rax+0x224],rdx
  138193:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138197:	48 c7 80 e4 01 00 00 	mov    QWORD PTR [rax+0x1e4],0x202
  13819e:	02 02 00 00 
  1381a2:	ba b1 82 13 00       	mov    edx,0x1382b1
  1381a7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1381ab:	48 89 90 dc 01 00 00 	mov    QWORD PTR [rax+0x1dc],rdx
  1381b2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1381b6:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  1381ba:	48 89 90 34 02 00 00 	mov    QWORD PTR [rax+0x234],rdx
  1381c1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1381c5:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  1381c9:	48 89 90 44 02 00 00 	mov    QWORD PTR [rax+0x244],rdx
  1381d0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1381d4:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  1381d8:	48 89 90 2c 02 00 00 	mov    QWORD PTR [rax+0x22c],rdx
  1381df:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1381e3:	48 c7 80 d4 01 00 00 	mov    QWORD PTR [rax+0x1d4],0x1000
  1381ea:	00 10 00 00 
  1381ee:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  1381f1:	83 c0 03             	add    eax,0x3
  1381f4:	c1 e0 04             	shl    eax,0x4
  1381f7:	48 63 d0             	movsxd rdx,eax
  1381fa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1381fe:	48 89 90 5c 02 00 00 	mov    QWORD PTR [rax+0x25c],rdx
  138205:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  138208:	01 c0                	add    eax,eax
  13820a:	83 c0 05             	add    eax,0x5
  13820d:	89 c2                	mov    edx,eax
  13820f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138213:	48 05 9c 01 00 00    	add    rax,0x19c
  138219:	89 d1                	mov    ecx,edx
  13821b:	ba 89 00 00 00       	mov    edx,0x89
  138220:	be ff ff 00 00       	mov    esi,0xffff
  138225:	89 c7                	mov    edi,eax
  138227:	e8 e5 0d 00 00       	call   139011 <fill_desc>
  13822c:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  13822f:	83 c0 03             	add    eax,0x3
  138232:	01 c0                	add    eax,eax
  138234:	89 c2                	mov    edx,eax
  138236:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13823a:	48 83 c0 34          	add    rax,0x34
  13823e:	89 d1                	mov    ecx,edx
  138240:	ba 82 00 00 00       	mov    edx,0x82
  138245:	be 28 00 00 00       	mov    esi,0x28
  13824a:	89 c7                	mov    edi,eax
  13824c:	e8 c0 0d 00 00       	call   139011 <fill_desc>
  138251:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138255:	48 83 c0 34          	add    rax,0x34
  138259:	48 89 c1             	mov    rcx,rax
  13825c:	ba fe cf 00 00       	mov    edx,0xcffe
  138261:	be ff ff ff ff       	mov    esi,0xffffffff
  138266:	bf 00 00 00 00       	mov    edi,0x0
  13826b:	e8 cf 0e 00 00       	call   13913f <fill_ldt_desc>
  138270:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138274:	48 83 c0 3c          	add    rax,0x3c
  138278:	48 89 c1             	mov    rcx,rax
  13827b:	ba f2 cf 00 00       	mov    edx,0xcff2
  138280:	be ff ff ff ff       	mov    esi,0xffffffff
  138285:	bf 00 00 00 00       	mov    edi,0x0
  13828a:	e8 b0 0e 00 00       	call   13913f <fill_ldt_desc>
  13828f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138293:	48 83 c0 44          	add    rax,0x44
  138297:	48 89 c1             	mov    rcx,rax
  13829a:	ba f6 00 00 00       	mov    edx,0xf6
  13829f:	be 00 10 00 00       	mov    esi,0x1000
  1382a4:	bf 00 f0 bf 01       	mov    edi,0x1bff000
  1382a9:	e8 91 0e 00 00       	call   13913f <fill_ldt_desc>
  1382ae:	90                   	nop
  1382af:	c9                   	leave  
  1382b0:	c3                   	ret    

00000000001382b1 <proc_zero>:
  1382b1:	f3 0f 1e fa          	endbr64 
  1382b5:	55                   	push   rbp
  1382b6:	48 89 e5             	mov    rbp,rsp
  1382b9:	eb fe                	jmp    1382b9 <proc_zero+0x8>

00000000001382bb <manage_proc>:
  1382bb:	f3 0f 1e fa          	endbr64 
  1382bf:	55                   	push   rbp
  1382c0:	48 89 e5             	mov    rbp,rsp
  1382c3:	48 83 ec 10          	sub    rsp,0x10
  1382c7:	8b 05 63 ce fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdce63]        # 115130 <cur_proc>
  1382cd:	83 f8 ff             	cmp    eax,0xffffffff
  1382d0:	74 2d                	je     1382ff <manage_proc+0x44>
  1382d2:	8b 05 58 ce fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdce58]        # 115130 <cur_proc>
  1382d8:	48 63 d0             	movsxd rdx,eax
  1382db:	48 69 d2 6c 02 00 00 	imul   rdx,rdx,0x26c
  1382e2:	48 81 c2 68 b5 10 00 	add    rdx,0x10b568
  1382e9:	8b 12                	mov    edx,DWORD PTR [rdx]
  1382eb:	83 c2 01             	add    edx,0x1
  1382ee:	48 98                	cdqe   
  1382f0:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  1382f7:	48 05 68 b5 10 00    	add    rax,0x10b568
  1382fd:	89 10                	mov    DWORD PTR [rax],edx
  1382ff:	8b 05 2b ce fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdce2b]        # 115130 <cur_proc>
  138305:	83 f8 ff             	cmp    eax,0xffffffff
  138308:	74 3c                	je     138346 <manage_proc+0x8b>
  13830a:	8b 05 20 ce fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdce20]        # 115130 <cur_proc>
  138310:	48 98                	cdqe   
  138312:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  138319:	48 05 68 b5 10 00    	add    rax,0x10b568
  13831f:	8b 00                	mov    eax,DWORD PTR [rax]
  138321:	83 f8 01             	cmp    eax,0x1
  138324:	77 20                	ja     138346 <manage_proc+0x8b>
  138326:	8b 05 04 ce fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdce04]        # 115130 <cur_proc>
  13832c:	48 98                	cdqe   
  13832e:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  138335:	48 05 64 b5 10 00    	add    rax,0x10b564
  13833b:	8b 00                	mov    eax,DWORD PTR [rax]
  13833d:	83 f8 01             	cmp    eax,0x1
  138340:	0f 84 90 00 00 00    	je     1383d6 <manage_proc+0x11b>
  138346:	8b 05 e4 cd fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdcde4]        # 115130 <cur_proc>
  13834c:	83 f8 ff             	cmp    eax,0xffffffff
  13834f:	74 1b                	je     13836c <manage_proc+0xb1>
  138351:	8b 05 d9 cd fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdcdd9]        # 115130 <cur_proc>
  138357:	48 98                	cdqe   
  138359:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  138360:	48 05 68 b5 10 00    	add    rax,0x10b568
  138366:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  13836c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  138373:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  13837a:	eb 41                	jmp    1383bd <manage_proc+0x102>
  13837c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13837f:	48 98                	cdqe   
  138381:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  138388:	48 05 60 b5 10 00    	add    rax,0x10b560
  13838e:	8b 00                	mov    eax,DWORD PTR [rax]
  138390:	83 f8 ff             	cmp    eax,0xffffffff
  138393:	74 24                	je     1383b9 <manage_proc+0xfe>
  138395:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  138398:	48 98                	cdqe   
  13839a:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  1383a1:	48 05 64 b5 10 00    	add    rax,0x10b564
  1383a7:	8b 00                	mov    eax,DWORD PTR [rax]
  1383a9:	83 f8 01             	cmp    eax,0x1
  1383ac:	75 0b                	jne    1383b9 <manage_proc+0xfe>
  1383ae:	8b 05 7c cd fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdcd7c]        # 115130 <cur_proc>
  1383b4:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  1383b7:	75 0c                	jne    1383c5 <manage_proc+0x10a>
  1383b9:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  1383bd:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  1383c1:	7e b9                	jle    13837c <manage_proc+0xc1>
  1383c3:	eb 01                	jmp    1383c6 <manage_proc+0x10b>
  1383c5:	90                   	nop
  1383c6:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  1383ca:	7f 0d                	jg     1383d9 <manage_proc+0x11e>
  1383cc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1383cf:	89 c7                	mov    edi,eax
  1383d1:	e8 06 00 00 00       	call   1383dc <switch_proc_tss>
  1383d6:	90                   	nop
  1383d7:	eb 01                	jmp    1383da <manage_proc+0x11f>
  1383d9:	90                   	nop
  1383da:	c9                   	leave  
  1383db:	c3                   	ret    

00000000001383dc <switch_proc_tss>:
  1383dc:	f3 0f 1e fa          	endbr64 
  1383e0:	55                   	push   rbp
  1383e1:	48 89 e5             	mov    rbp,rsp
  1383e4:	48 83 ec 20          	sub    rsp,0x20
  1383e8:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  1383eb:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  1383ee:	01 c0                	add    eax,eax
  1383f0:	83 c0 05             	add    eax,0x5
  1383f3:	c1 e0 03             	shl    eax,0x3
  1383f6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  1383f9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  1383fc:	89 05 2e cd fd ff    	mov    DWORD PTR [rip+0xfffffffffffdcd2e],eax        # 115130 <cur_proc>
  138402:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  138405:	89 c7                	mov    edi,eax
  138407:	e8 3f 57 00 00       	call   13db4b <switch_proc_asm>
  13840c:	90                   	nop
  13840d:	c9                   	leave  
  13840e:	c3                   	ret    

000000000013840f <switch_proc>:
  13840f:	f3 0f 1e fa          	endbr64 
  138413:	55                   	push   rbp
  138414:	48 89 e5             	mov    rbp,rsp
  138417:	48 81 ec 80 02 00 00 	sub    rsp,0x280
  13841e:	89 bd 8c fd ff ff    	mov    DWORD PTR [rbp-0x274],edi
  138424:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  13842a:	48 98                	cdqe   
  13842c:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  138433:	48 8d 90 60 b5 10 00 	lea    rdx,[rax+0x10b560]
  13843a:	48 8d 85 90 fd ff ff 	lea    rax,[rbp-0x270]
  138441:	b9 4d 00 00 00       	mov    ecx,0x4d
  138446:	48 89 c7             	mov    rdi,rax
  138449:	48 89 d6             	mov    rsi,rdx
  13844c:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
  13844f:	48 89 f2             	mov    rdx,rsi
  138452:	48 89 f8             	mov    rax,rdi
  138455:	8b 0a                	mov    ecx,DWORD PTR [rdx]
  138457:	89 08                	mov    DWORD PTR [rax],ecx
  138459:	8b 05 d1 cc fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdccd1]        # 115130 <cur_proc>
  13845f:	48 98                	cdqe   
  138461:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  138468:	48 05 90 01 00 00    	add    rax,0x190
  13846e:	48 05 60 b5 10 00    	add    rax,0x10b560
  138474:	48 83 c0 0c          	add    rax,0xc
  138478:	48 89 c7             	mov    rdi,rax
  13847b:	e8 69 00 00 00       	call   1384e9 <save_context>
  138480:	b8 b1 82 13 00       	mov    eax,0x1382b1
  138485:	48 89 05 b0 32 fd ff 	mov    QWORD PTR [rip+0xfffffffffffd32b0],rax        # 10b73c <task+0x1dc>
  13848c:	48 c7 05 9d 32 fd ff 	mov    QWORD PTR [rip+0xfffffffffffd329d],0x1000        # 10b734 <task+0x1d4>
  138493:	00 10 00 00 
  138497:	48 c7 05 a2 32 fd ff 	mov    QWORD PTR [rip+0xfffffffffffd32a2],0x202        # 10b744 <task+0x1e4>
  13849e:	02 02 00 00 
  1384a2:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  1384a8:	89 05 82 cc fd ff    	mov    DWORD PTR [rip+0xfffffffffffdcc82],eax        # 115130 <cur_proc>
  1384ae:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  1384b4:	01 c0                	add    eax,eax
  1384b6:	83 c0 05             	add    eax,0x5
  1384b9:	c1 e0 03             	shl    eax,0x3
  1384bc:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  1384bf:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  1384c5:	48 98                	cdqe   
  1384c7:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  1384ce:	48 05 90 01 00 00    	add    rax,0x190
  1384d4:	48 05 60 b5 10 00    	add    rax,0x10b560
  1384da:	48 83 c0 0c          	add    rax,0xc
  1384de:	48 89 c7             	mov    rdi,rax
  1384e1:	e8 82 56 00 00       	call   13db68 <switch_to>
  1384e6:	90                   	nop
  1384e7:	c9                   	leave  
  1384e8:	c3                   	ret    

00000000001384e9 <save_context>:
  1384e9:	f3 0f 1e fa          	endbr64 
  1384ed:	55                   	push   rbp
  1384ee:	48 89 e5             	mov    rbp,rsp
  1384f1:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  1384f5:	48 8b 15 a4 cb fd ff 	mov    rdx,QWORD PTR [rip+0xfffffffffffdcba4]        # 1150a0 <scene_saver+0x40>
  1384fc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138500:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
  138504:	48 8b 15 a5 cb fd ff 	mov    rdx,QWORD PTR [rip+0xfffffffffffdcba5]        # 1150b0 <scene_saver+0x50>
  13850b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13850f:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
  138513:	48 8b 15 ae cb fd ff 	mov    rdx,QWORD PTR [rip+0xfffffffffffdcbae]        # 1150c8 <scene_saver+0x68>
  13851a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13851e:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
  138522:	48 8b 15 8f cb fd ff 	mov    rdx,QWORD PTR [rip+0xfffffffffffdcb8f]        # 1150b8 <scene_saver+0x58>
  138529:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13852d:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
  138531:	48 8b 15 88 cb fd ff 	mov    rdx,QWORD PTR [rip+0xfffffffffffdcb88]        # 1150c0 <scene_saver+0x60>
  138538:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13853c:	48 89 50 60          	mov    QWORD PTR [rax+0x60],rdx
  138540:	48 8b 15 99 cb fd ff 	mov    rdx,QWORD PTR [rip+0xfffffffffffdcb99]        # 1150e0 <scene_saver+0x80>
  138547:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13854b:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
  138552:	48 8b 15 8f cb fd ff 	mov    rdx,QWORD PTR [rip+0xfffffffffffdcb8f]        # 1150e8 <scene_saver+0x88>
  138559:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13855d:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
  138564:	48 8b 15 3d cb fd ff 	mov    rdx,QWORD PTR [rip+0xfffffffffffdcb3d]        # 1150a8 <scene_saver+0x48>
  13856b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13856f:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
  138573:	48 8b 15 56 cb fd ff 	mov    rdx,QWORD PTR [rip+0xfffffffffffdcb56]        # 1150d0 <scene_saver+0x70>
  13857a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13857e:	48 89 50 70          	mov    QWORD PTR [rax+0x70],rdx
  138582:	48 8b 15 4f cb fd ff 	mov    rdx,QWORD PTR [rip+0xfffffffffffdcb4f]        # 1150d8 <scene_saver+0x78>
  138589:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13858d:	48 89 50 78          	mov    QWORD PTR [rax+0x78],rdx
  138591:	90                   	nop
  138592:	5d                   	pop    rbp
  138593:	c3                   	ret    

0000000000138594 <palloc>:
  138594:	f3 0f 1e fa          	endbr64 
  138598:	55                   	push   rbp
  138599:	48 89 e5             	mov    rbp,rsp
  13859c:	48 83 ec 60          	sub    rsp,0x60
  1385a0:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  1385a3:	89 75 a8             	mov    DWORD PTR [rbp-0x58],esi
  1385a6:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  1385a9:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  1385af:	85 c0                	test   eax,eax
  1385b1:	0f 48 c2             	cmovs  eax,edx
  1385b4:	c1 f8 0c             	sar    eax,0xc
  1385b7:	89 c1                	mov    ecx,eax
  1385b9:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  1385bc:	99                   	cdq    
  1385bd:	c1 ea 14             	shr    edx,0x14
  1385c0:	01 d0                	add    eax,edx
  1385c2:	25 ff 0f 00 00       	and    eax,0xfff
  1385c7:	29 d0                	sub    eax,edx
  1385c9:	01 c8                	add    eax,ecx
  1385cb:	85 c0                	test   eax,eax
  1385cd:	0f 95 c0             	setne  al
  1385d0:	0f b6 c0             	movzx  eax,al
  1385d3:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  1385d6:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  1385dd:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  1385e4:	00 
  1385e5:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  1385e8:	48 98                	cdqe   
  1385ea:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  1385f1:	48 05 20 b7 10 00    	add    rax,0x10b720
  1385f7:	48 8b 40 14          	mov    rax,QWORD PTR [rax+0x14]
  1385fb:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  1385ff:	48 83 45 e8 08       	add    QWORD PTR [rbp-0x18],0x8
  138604:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x1
  13860b:	e9 39 02 00 00       	jmp    138849 <palloc+0x2b5>
  138610:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  138614:	48 8b 00             	mov    rax,QWORD PTR [rax]
  138617:	25 00 f0 ff ff       	and    eax,0xfffff000
  13861c:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  138620:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
  138627:	e9 07 02 00 00       	jmp    138833 <palloc+0x29f>
  13862c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  138630:	48 8b 00             	mov    rax,QWORD PTR [rax]
  138633:	83 e0 01             	and    eax,0x1
  138636:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
  138639:	83 7d d0 00          	cmp    DWORD PTR [rbp-0x30],0x0
  13863d:	0f 85 e7 01 00 00    	jne    13882a <palloc+0x296>
  138643:	b8 00 00 00 00       	mov    eax,0x0
  138648:	e8 66 d2 ff ff       	call   1358b3 <req_a_page>
  13864d:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
  138650:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  138654:	0f 85 b9 00 00 00    	jne    138713 <palloc+0x17f>
  13865a:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  13865d:	48 98                	cdqe   
  13865f:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  138666:	48 05 a4 b5 10 00    	add    rax,0x10b5a4
  13866c:	0f b7 00             	movzx  eax,WORD PTR [rax]
  13866f:	0f b7 c0             	movzx  eax,ax
  138672:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
  138675:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  138678:	48 98                	cdqe   
  13867a:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  138681:	48 05 a0 b5 10 00    	add    rax,0x10b5a0
  138687:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  13868b:	0f b7 c0             	movzx  eax,ax
  13868e:	c1 e0 10             	shl    eax,0x10
  138691:	25 00 00 0f 00       	and    eax,0xf0000
  138696:	01 45 b8             	add    DWORD PTR [rbp-0x48],eax
  138699:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13869c:	01 45 b8             	add    DWORD PTR [rbp-0x48],eax
  13869f:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  1386a2:	89 c2                	mov    edx,eax
  1386a4:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  1386a7:	48 98                	cdqe   
  1386a9:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  1386b0:	48 05 a4 b5 10 00    	add    rax,0x10b5a4
  1386b6:	66 89 10             	mov    WORD PTR [rax],dx
  1386b9:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  1386bc:	48 98                	cdqe   
  1386be:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  1386c5:	48 05 a0 b5 10 00    	add    rax,0x10b5a0
  1386cb:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  1386cf:	0f b7 c0             	movzx  eax,ax
  1386d2:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
  1386d5:	81 65 b4 f0 ff 00 00 	and    DWORD PTR [rbp-0x4c],0xfff0
  1386dc:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  1386df:	c1 e8 10             	shr    eax,0x10
  1386e2:	83 e0 0f             	and    eax,0xf
  1386e5:	89 c2                	mov    edx,eax
  1386e7:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  1386ea:	01 d0                	add    eax,edx
  1386ec:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
  1386ef:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  1386f2:	89 c2                	mov    edx,eax
  1386f4:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  1386f7:	48 98                	cdqe   
  1386f9:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  138700:	48 05 a0 b5 10 00    	add    rax,0x10b5a0
  138706:	66 89 50 09          	mov    WORD PTR [rax+0x9],dx
  13870a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  13870e:	e9 48 01 00 00       	jmp    13885b <palloc+0x2c7>
  138713:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  138716:	89 c7                	mov    edi,eax
  138718:	e8 01 d3 ff ff       	call   135a1e <get_phyaddr>
  13871d:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
  138720:	8b 4d c8             	mov    ecx,DWORD PTR [rbp-0x38]
  138723:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  138727:	ba 07 00 00 00       	mov    edx,0x7
  13872c:	89 ce                	mov    esi,ecx
  13872e:	48 89 c7             	mov    rdi,rax
  138731:	e8 fb d2 ff ff       	call   135a31 <set_page_item>
  138736:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  138739:	c1 e0 0a             	shl    eax,0xa
  13873c:	89 c2                	mov    edx,eax
  13873e:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  138741:	01 d0                	add    eax,edx
  138743:	c1 e0 0c             	shl    eax,0xc
  138746:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
  138749:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  13874e:	75 12                	jne    138762 <palloc+0x1ce>
  138750:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  138753:	48 98                	cdqe   
  138755:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  138759:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  13875c:	89 05 d6 c9 fd ff    	mov    DWORD PTR [rip+0xfffffffffffdc9d6],eax        # 115138 <palloc_paddr>
  138762:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  138766:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  13876a:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  13876e:	0f 85 b6 00 00 00    	jne    13882a <palloc+0x296>
  138774:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  138777:	48 98                	cdqe   
  138779:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  138780:	48 05 a4 b5 10 00    	add    rax,0x10b5a4
  138786:	0f b7 00             	movzx  eax,WORD PTR [rax]
  138789:	0f b7 c0             	movzx  eax,ax
  13878c:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
  13878f:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  138792:	48 98                	cdqe   
  138794:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  13879b:	48 05 a0 b5 10 00    	add    rax,0x10b5a0
  1387a1:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  1387a5:	0f b7 c0             	movzx  eax,ax
  1387a8:	c1 e0 10             	shl    eax,0x10
  1387ab:	25 00 00 0f 00       	and    eax,0xf0000
  1387b0:	01 45 c0             	add    DWORD PTR [rbp-0x40],eax
  1387b3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  1387b6:	01 45 c0             	add    DWORD PTR [rbp-0x40],eax
  1387b9:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  1387bc:	89 c2                	mov    edx,eax
  1387be:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  1387c1:	48 98                	cdqe   
  1387c3:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  1387ca:	48 05 a4 b5 10 00    	add    rax,0x10b5a4
  1387d0:	66 89 10             	mov    WORD PTR [rax],dx
  1387d3:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  1387d6:	48 98                	cdqe   
  1387d8:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  1387df:	48 05 a0 b5 10 00    	add    rax,0x10b5a0
  1387e5:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  1387e9:	0f b7 c0             	movzx  eax,ax
  1387ec:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
  1387ef:	81 65 bc f0 ff 00 00 	and    DWORD PTR [rbp-0x44],0xfff0
  1387f6:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  1387f9:	c1 e8 10             	shr    eax,0x10
  1387fc:	83 e0 0f             	and    eax,0xf
  1387ff:	89 c2                	mov    edx,eax
  138801:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  138804:	01 d0                	add    eax,edx
  138806:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
  138809:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  13880c:	89 c2                	mov    edx,eax
  13880e:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  138811:	48 98                	cdqe   
  138813:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  13881a:	48 05 a0 b5 10 00    	add    rax,0x10b5a0
  138820:	66 89 50 09          	mov    WORD PTR [rax+0x9],dx
  138824:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  138828:	eb 31                	jmp    13885b <palloc+0x2c7>
  13882a:	48 83 45 d8 08       	add    QWORD PTR [rbp-0x28],0x8
  13882f:	83 45 d4 01          	add    DWORD PTR [rbp-0x2c],0x1
  138833:	81 7d d4 ff 03 00 00 	cmp    DWORD PTR [rbp-0x2c],0x3ff
  13883a:	0f 8e ec fd ff ff    	jle    13862c <palloc+0x98>
  138840:	48 83 45 e8 08       	add    QWORD PTR [rbp-0x18],0x8
  138845:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
  138849:	81 7d e4 ff 03 00 00 	cmp    DWORD PTR [rbp-0x1c],0x3ff
  138850:	0f 8e ba fd ff ff    	jle    138610 <palloc+0x7c>
  138856:	b8 00 00 00 00       	mov    eax,0x0
  13885b:	c9                   	leave  
  13885c:	c3                   	ret    

000000000013885d <malloc>:
  13885d:	f3 0f 1e fa          	endbr64 
  138861:	55                   	push   rbp
  138862:	48 89 e5             	mov    rbp,rsp
  138865:	48 83 ec 10          	sub    rsp,0x10
  138869:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  13886c:	8b 05 be c8 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdc8be]        # 115130 <cur_proc>
  138872:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  138875:	89 d6                	mov    esi,edx
  138877:	89 c7                	mov    edi,eax
  138879:	e8 16 fd ff ff       	call   138594 <palloc>
  13887e:	c9                   	leave  
  13887f:	c3                   	ret    

0000000000138880 <proc_end>:
  138880:	f3 0f 1e fa          	endbr64 
  138884:	55                   	push   rbp
  138885:	48 89 e5             	mov    rbp,rsp
  138888:	48 83 ec 10          	sub    rsp,0x10
  13888c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  13888f:	48 8b 05 d6 2e fd ff 	mov    rax,QWORD PTR [rip+0xfffffffffffd2ed6]        # 10b76c <task+0x20c>
  138896:	48 89 c4             	mov    rsp,rax
  138899:	8b 05 91 c8 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdc891]        # 115130 <cur_proc>
  13889f:	89 c7                	mov    edi,eax
  1388a1:	e8 75 00 00 00       	call   13891b <del_proc>
  1388a6:	8b 05 84 c8 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdc884]        # 115130 <cur_proc>
  1388ac:	48 98                	cdqe   
  1388ae:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  1388b5:	48 05 c0 b5 10 00    	add    rax,0x10b5c0
  1388bb:	8b 00                	mov    eax,DWORD PTR [rax]
  1388bd:	83 f8 ff             	cmp    eax,0xffffffff
  1388c0:	74 4c                	je     13890e <proc_end+0x8e>
  1388c2:	8b 05 68 c8 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdc868]        # 115130 <cur_proc>
  1388c8:	48 98                	cdqe   
  1388ca:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  1388d1:	48 05 c0 b5 10 00    	add    rax,0x10b5c0
  1388d7:	8b 00                	mov    eax,DWORD PTR [rax]
  1388d9:	89 c0                	mov    eax,eax
  1388db:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  1388e2:	48 05 64 b5 10 00    	add    rax,0x10b564
  1388e8:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
  1388ee:	8b 05 3c c8 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdc83c]        # 115130 <cur_proc>
  1388f4:	48 98                	cdqe   
  1388f6:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  1388fd:	48 05 c0 b5 10 00    	add    rax,0x10b5c0
  138903:	8b 00                	mov    eax,DWORD PTR [rax]
  138905:	89 c7                	mov    edi,eax
  138907:	e8 d0 fa ff ff       	call   1383dc <switch_proc_tss>
  13890c:	eb 0a                	jmp    138918 <proc_end+0x98>
  13890e:	bf 00 00 00 00       	mov    edi,0x0
  138913:	e8 c4 fa ff ff       	call   1383dc <switch_proc_tss>
  138918:	90                   	nop
  138919:	c9                   	leave  
  13891a:	c3                   	ret    

000000000013891b <del_proc>:
  13891b:	f3 0f 1e fa          	endbr64 
  13891f:	55                   	push   rbp
  138920:	48 89 e5             	mov    rbp,rsp
  138923:	48 83 ec 30          	sub    rsp,0x30
  138927:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  13892a:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  13892d:	48 98                	cdqe   
  13892f:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  138936:	48 05 64 b5 10 00    	add    rax,0x10b564
  13893c:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
  138942:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  138945:	48 98                	cdqe   
  138947:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  13894e:	48 05 60 b5 10 00    	add    rax,0x10b560
  138954:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
  13895a:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  13895d:	48 98                	cdqe   
  13895f:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  138966:	48 05 20 b7 10 00    	add    rax,0x10b720
  13896c:	48 8b 40 14          	mov    rax,QWORD PTR [rax+0x14]
  138970:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  138974:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
  138979:	eb 62                	jmp    1389dd <del_proc+0xc2>
  13897b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13897f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  138982:	25 00 f0 ff ff       	and    eax,0xfffff000
  138987:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  13898b:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  138992:	eb 30                	jmp    1389c4 <del_proc+0xa9>
  138994:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  138998:	48 8b 00             	mov    rax,QWORD PTR [rax]
  13899b:	83 e0 01             	and    eax,0x1
  13899e:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  1389a1:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  1389a5:	74 14                	je     1389bb <del_proc+0xa0>
  1389a7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  1389ab:	48 8b 00             	mov    rax,QWORD PTR [rax]
  1389ae:	25 00 f0 ff ff       	and    eax,0xfffff000
  1389b3:	48 89 c7             	mov    rdi,rax
  1389b6:	e8 a2 cf ff ff       	call   13595d <free_page>
  1389bb:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
  1389c0:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  1389c4:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  1389cb:	7e c7                	jle    138994 <del_proc+0x79>
  1389cd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  1389d1:	89 c7                	mov    edi,eax
  1389d3:	e8 07 cd ff ff       	call   1356df <vmfree>
  1389d8:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
  1389dd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1389e1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  1389e4:	83 e0 01             	and    eax,0x1
  1389e7:	48 85 c0             	test   rax,rax
  1389ea:	75 8f                	jne    13897b <del_proc+0x60>
  1389ec:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1389f0:	89 c7                	mov    edi,eax
  1389f2:	e8 e8 cc ff ff       	call   1356df <vmfree>
  1389f7:	90                   	nop
  1389f8:	c9                   	leave  
  1389f9:	c3                   	ret    

00000000001389fa <set_proc_stat>:
  1389fa:	f3 0f 1e fa          	endbr64 
  1389fe:	55                   	push   rbp
  1389ff:	48 89 e5             	mov    rbp,rsp
  138a02:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  138a05:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  138a08:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  138a0c:	75 07                	jne    138a15 <set_proc_stat+0x1b>
  138a0e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  138a13:	eb 79                	jmp    138a8e <set_proc_stat+0x94>
  138a15:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  138a1c:	eb 04                	jmp    138a22 <set_proc_stat+0x28>
  138a1e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  138a22:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  138a25:	48 98                	cdqe   
  138a27:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  138a2e:	48 05 60 b5 10 00    	add    rax,0x10b560
  138a34:	8b 10                	mov    edx,DWORD PTR [rax]
  138a36:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  138a39:	39 c2                	cmp    edx,eax
  138a3b:	75 e1                	jne    138a1e <set_proc_stat+0x24>
  138a3d:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  138a41:	75 07                	jne    138a4a <set_proc_stat+0x50>
  138a43:	b8 ff ff ff ff       	mov    eax,0xffffffff
  138a48:	eb 44                	jmp    138a8e <set_proc_stat+0x94>
  138a4a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  138a4d:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  138a50:	48 63 d2             	movsxd rdx,edx
  138a53:	48 69 d2 6c 02 00 00 	imul   rdx,rdx,0x26c
  138a5a:	48 81 c2 64 b5 10 00 	add    rdx,0x10b564
  138a61:	89 02                	mov    DWORD PTR [rdx],eax
  138a63:	8b 05 c7 c6 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdc6c7]        # 115130 <cur_proc>
  138a69:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  138a6c:	75 1b                	jne    138a89 <set_proc_stat+0x8f>
  138a6e:	8b 05 bc c6 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdc6bc]        # 115130 <cur_proc>
  138a74:	48 98                	cdqe   
  138a76:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  138a7d:	48 05 68 b5 10 00    	add    rax,0x10b568
  138a83:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
  138a89:	b8 00 00 00 00       	mov    eax,0x0
  138a8e:	5d                   	pop    rbp
  138a8f:	c3                   	ret    

0000000000138a90 <add_proc_openf>:
  138a90:	f3 0f 1e fa          	endbr64 
  138a94:	55                   	push   rbp
  138a95:	48 89 e5             	mov    rbp,rsp
  138a98:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  138a9c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  138aa3:	eb 69                	jmp    138b0e <add_proc_openf+0x7e>
  138aa5:	8b 05 85 c6 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdc685]        # 115130 <cur_proc>
  138aab:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  138aae:	48 63 d2             	movsxd rdx,edx
  138ab1:	48 83 c2 12          	add    rdx,0x12
  138ab5:	48 98                	cdqe   
  138ab7:	48 c1 e2 03          	shl    rdx,0x3
  138abb:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  138ac2:	48 01 d0             	add    rax,rdx
  138ac5:	48 05 60 b5 10 00    	add    rax,0x10b560
  138acb:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  138acf:	48 85 c0             	test   rax,rax
  138ad2:	75 36                	jne    138b0a <add_proc_openf+0x7a>
  138ad4:	8b 05 56 c6 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdc656]        # 115130 <cur_proc>
  138ada:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  138add:	48 63 d2             	movsxd rdx,edx
  138ae0:	48 83 c2 12          	add    rdx,0x12
  138ae4:	48 98                	cdqe   
  138ae6:	48 c1 e2 03          	shl    rdx,0x3
  138aea:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  138af1:	48 01 d0             	add    rax,rdx
  138af4:	48 8d 90 60 b5 10 00 	lea    rdx,[rax+0x10b560]
  138afb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  138aff:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
  138b03:	b8 00 00 00 00       	mov    eax,0x0
  138b08:	eb 0f                	jmp    138b19 <add_proc_openf+0x89>
  138b0a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  138b0e:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  138b12:	7e 91                	jle    138aa5 <add_proc_openf+0x15>
  138b14:	b8 ff ff ff ff       	mov    eax,0xffffffff
  138b19:	5d                   	pop    rbp
  138b1a:	c3                   	ret    

0000000000138b1b <sys_exit>:
  138b1b:	f3 0f 1e fa          	endbr64 
  138b1f:	55                   	push   rbp
  138b20:	48 89 e5             	mov    rbp,rsp
  138b23:	48 83 ec 10          	sub    rsp,0x10
  138b27:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  138b2a:	8b 05 00 c6 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdc600]        # 115130 <cur_proc>
  138b30:	89 c7                	mov    edi,eax
  138b32:	e8 e4 fd ff ff       	call   13891b <del_proc>
  138b37:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  138b3a:	c9                   	leave  
  138b3b:	c3                   	ret    

0000000000138b3c <reg_proc>:
  138b3c:	f3 0f 1e fa          	endbr64 
  138b40:	55                   	push   rbp
  138b41:	48 89 e5             	mov    rbp,rsp
  138b44:	48 83 ec 40          	sub    rsp,0x40
  138b48:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  138b4b:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  138b4f:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  138b53:	b8 00 00 00 00       	mov    eax,0x0
  138b58:	e8 04 f4 ff ff       	call   137f61 <req_proc>
  138b5d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  138b60:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  138b64:	75 0a                	jne    138b70 <reg_proc+0x34>
  138b66:	b8 ff ff ff ff       	mov    eax,0xffffffff
  138b6b:	e9 86 01 00 00       	jmp    138cf6 <reg_proc+0x1ba>
  138b70:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  138b73:	50                   	push   rax
  138b74:	6a 00                	push   0x0
  138b76:	6a 00                	push   0x0
  138b78:	6a 00                	push   0x0
  138b7a:	6a 00                	push   0x0
  138b7c:	68 fc ff bf 01       	push   0x1bffffc
  138b81:	6a 10                	push   0x10
  138b83:	6a 10                	push   0x10
  138b85:	6a 10                	push   0x10
  138b87:	6a 10                	push   0x10
  138b89:	41 b9 08 00 00 00    	mov    r9d,0x8
  138b8f:	41 b8 10 00 00 00    	mov    r8d,0x10
  138b95:	b9 00 00 00 00       	mov    ecx,0x0
  138b9a:	ba 00 00 00 00       	mov    edx,0x0
  138b9f:	be 00 00 00 00       	mov    esi,0x0
  138ba4:	bf 00 00 00 00       	mov    edi,0x0
  138ba9:	e8 7f f4 ff ff       	call   13802d <set_proc>
  138bae:	48 83 c4 50          	add    rsp,0x50
  138bb2:	b8 00 00 00 00       	mov    eax,0x0
  138bb7:	e8 96 ca ff ff       	call   135652 <vmalloc>
  138bbc:	48 98                	cdqe   
  138bbe:	48 89 c2             	mov    rdx,rax
  138bc1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  138bc4:	48 98                	cdqe   
  138bc6:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  138bcd:	48 05 e0 b5 10 00    	add    rax,0x10b5e0
  138bd3:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx
  138bd7:	b8 00 00 00 00       	mov    eax,0x0
  138bdc:	e8 71 ca ff ff       	call   135652 <vmalloc>
  138be1:	48 98                	cdqe   
  138be3:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  138be7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  138bea:	48 98                	cdqe   
  138bec:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  138bf3:	48 05 e0 b5 10 00    	add    rax,0x10b5e0
  138bf9:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  138bfd:	c7 00 07 20 00 00    	mov    DWORD PTR [rax],0x2007
  138c03:	b8 00 00 00 00       	mov    eax,0x0
  138c08:	e8 45 ca ff ff       	call   135652 <vmalloc>
  138c0d:	48 98                	cdqe   
  138c0f:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  138c13:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  138c17:	83 c8 07             	or     eax,0x7
  138c1a:	89 c2                	mov    edx,eax
  138c1c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  138c1f:	48 98                	cdqe   
  138c21:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  138c28:	48 05 e0 b5 10 00    	add    rax,0x10b5e0
  138c2e:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  138c32:	48 83 c0 18          	add    rax,0x18
  138c36:	89 10                	mov    DWORD PTR [rax],edx
  138c38:	b8 00 00 00 00       	mov    eax,0x0
  138c3d:	e8 71 cc ff ff       	call   1358b3 <req_a_page>
  138c42:	89 c7                	mov    edi,eax
  138c44:	e8 d5 cd ff ff       	call   135a1e <get_phyaddr>
  138c49:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  138c4d:	48 81 c2 fc 0f 00 00 	add    rdx,0xffc
  138c54:	83 c8 07             	or     eax,0x7
  138c57:	89 02                	mov    DWORD PTR [rdx],eax
  138c59:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  138c5c:	48 98                	cdqe   
  138c5e:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  138c65:	48 05 e0 b5 10 00    	add    rax,0x10b5e0
  138c6b:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  138c6f:	48 89 c2             	mov    rdx,rax
  138c72:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  138c75:	48 98                	cdqe   
  138c77:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  138c7e:	48 05 20 b7 10 00    	add    rax,0x10b720
  138c84:	48 89 50 14          	mov    QWORD PTR [rax+0x14],rdx
  138c88:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  138c8b:	48 98                	cdqe   
  138c8d:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  138c94:	48 05 64 b5 10 00    	add    rax,0x10b564
  138c9a:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
  138ca0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  138ca3:	48 98                	cdqe   
  138ca5:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  138cac:	48 8d 90 e0 b5 10 00 	lea    rdx,[rax+0x10b5e0]
  138cb3:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  138cb7:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
  138cbb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  138cbe:	48 98                	cdqe   
  138cc0:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  138cc7:	48 8d 90 f0 b5 10 00 	lea    rdx,[rax+0x10b5f0]
  138cce:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  138cd2:	48 89 42 04          	mov    QWORD PTR [rdx+0x4],rax
  138cd6:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  138cd9:	48 98                	cdqe   
  138cdb:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  138cde:	48 63 d2             	movsxd rdx,edx
  138ce1:	48 69 d2 6c 02 00 00 	imul   rdx,rdx,0x26c
  138ce8:	48 81 c2 30 b7 10 00 	add    rdx,0x10b730
  138cef:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
  138cf3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  138cf6:	c9                   	leave  
  138cf7:	c3                   	ret    

0000000000138cf8 <sys_malloc>:
  138cf8:	f3 0f 1e fa          	endbr64 
  138cfc:	55                   	push   rbp
  138cfd:	48 89 e5             	mov    rbp,rsp
  138d00:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
  138d03:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  138d06:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  138d0c:	85 c0                	test   eax,eax
  138d0e:	0f 48 c2             	cmovs  eax,edx
  138d11:	c1 f8 0c             	sar    eax,0xc
  138d14:	89 c1                	mov    ecx,eax
  138d16:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  138d19:	99                   	cdq    
  138d1a:	c1 ea 14             	shr    edx,0x14
  138d1d:	01 d0                	add    eax,edx
  138d1f:	25 ff 0f 00 00       	and    eax,0xfff
  138d24:	29 d0                	sub    eax,edx
  138d26:	01 c8                	add    eax,ecx
  138d28:	85 c0                	test   eax,eax
  138d2a:	0f 95 c0             	setne  al
  138d2d:	0f b6 c0             	movzx  eax,al
  138d30:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  138d33:	8b 05 f7 c3 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdc3f7]        # 115130 <cur_proc>
  138d39:	48 98                	cdqe   
  138d3b:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  138d42:	48 05 74 b5 10 00    	add    rax,0x10b574
  138d48:	8b 00                	mov    eax,DWORD PTR [rax]
  138d4a:	48 98                	cdqe   
  138d4c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  138d50:	eb 0c                	jmp    138d5e <sys_malloc+0x66>
  138d52:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138d56:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  138d5a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  138d5e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138d62:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  138d66:	48 85 c0             	test   rax,rax
  138d69:	74 16                	je     138d81 <sys_malloc+0x89>
  138d6b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138d6f:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  138d72:	85 c0                	test   eax,eax
  138d74:	75 0b                	jne    138d81 <sys_malloc+0x89>
  138d76:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138d7a:	8b 00                	mov    eax,DWORD PTR [rax]
  138d7c:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  138d7f:	7e d1                	jle    138d52 <sys_malloc+0x5a>
  138d81:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138d85:	8b 00                	mov    eax,DWORD PTR [rax]
  138d87:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  138d8a:	7e 7f                	jle    138e0b <sys_malloc+0x113>
  138d8c:	8b 05 9e c3 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdc39e]        # 115130 <cur_proc>
  138d92:	48 98                	cdqe   
  138d94:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  138d9b:	48 05 78 b5 10 00    	add    rax,0x10b578
  138da1:	8b 10                	mov    edx,DWORD PTR [rax]
  138da3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  138da6:	c1 e0 0c             	shl    eax,0xc
  138da9:	01 d0                	add    eax,edx
  138dab:	3d ff ff ef 01       	cmp    eax,0x1efffff
  138db0:	7e 0a                	jle    138dbc <sys_malloc+0xc4>
  138db2:	b8 00 00 00 00       	mov    eax,0x0
  138db7:	e9 c8 00 00 00       	jmp    138e84 <sys_malloc+0x18c>
  138dbc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138dc0:	8b 10                	mov    edx,DWORD PTR [rax]
  138dc2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  138dc5:	29 d0                	sub    eax,edx
  138dc7:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
  138dca:	8b 05 60 c3 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdc360]        # 115130 <cur_proc>
  138dd0:	48 98                	cdqe   
  138dd2:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  138dd9:	48 05 78 b5 10 00    	add    rax,0x10b578
  138ddf:	8b 00                	mov    eax,DWORD PTR [rax]
  138de1:	48 98                	cdqe   
  138de3:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  138de7:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  138dee:	eb 13                	jmp    138e03 <sys_malloc+0x10b>
  138df0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  138df4:	c6 00 00             	mov    BYTE PTR [rax],0x0
  138df7:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  138dfe:	00 
  138dff:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  138e03:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  138e06:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  138e09:	7c e5                	jl     138df0 <sys_malloc+0xf8>
  138e0b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138e0f:	8b 00                	mov    eax,DWORD PTR [rax]
  138e11:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  138e14:	7d 59                	jge    138e6f <sys_malloc+0x177>
  138e16:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138e1a:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  138e1e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  138e21:	83 c0 01             	add    eax,0x1
  138e24:	c1 e0 0c             	shl    eax,0xc
  138e27:	48 98                	cdqe   
  138e29:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
  138e2d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  138e31:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  138e35:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138e39:	8b 00                	mov    eax,DWORD PTR [rax]
  138e3b:	2b 45 e8             	sub    eax,DWORD PTR [rbp-0x18]
  138e3e:	8d 50 ff             	lea    edx,[rax-0x1]
  138e41:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  138e45:	89 10                	mov    DWORD PTR [rax],edx
  138e47:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138e4b:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  138e4f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  138e53:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
  138e57:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  138e5b:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  138e5f:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
  138e63:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138e67:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  138e6b:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
  138e6f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138e73:	c7 40 04 01 00 00 00 	mov    DWORD PTR [rax+0x4],0x1
  138e7a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138e7e:	48 05 00 10 00 00    	add    rax,0x1000
  138e84:	5d                   	pop    rbp
  138e85:	c3                   	ret    

0000000000138e86 <sys_free>:
  138e86:	f3 0f 1e fa          	endbr64 
  138e8a:	55                   	push   rbp
  138e8b:	48 89 e5             	mov    rbp,rsp
  138e8e:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  138e91:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  138e94:	2d 00 10 00 00       	sub    eax,0x1000
  138e99:	48 98                	cdqe   
  138e9b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  138e9f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  138ea3:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
  138eaa:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  138eae:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  138eb2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  138eb6:	eb 2e                	jmp    138ee6 <sys_free+0x60>
  138eb8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138ebc:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  138ebf:	85 c0                	test   eax,eax
  138ec1:	75 2c                	jne    138eef <sys_free+0x69>
  138ec3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  138ec7:	8b 10                	mov    edx,DWORD PTR [rax]
  138ec9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138ecd:	8b 00                	mov    eax,DWORD PTR [rax]
  138ecf:	83 c0 01             	add    eax,0x1
  138ed2:	01 c2                	add    edx,eax
  138ed4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  138ed8:	89 10                	mov    DWORD PTR [rax],edx
  138eda:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138ede:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  138ee2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  138ee6:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  138eeb:	75 cb                	jne    138eb8 <sys_free+0x32>
  138eed:	eb 01                	jmp    138ef0 <sys_free+0x6a>
  138eef:	90                   	nop
  138ef0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  138ef4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  138ef8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  138efc:	eb 2e                	jmp    138f2c <sys_free+0xa6>
  138efe:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138f02:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  138f05:	85 c0                	test   eax,eax
  138f07:	75 2c                	jne    138f35 <sys_free+0xaf>
  138f09:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138f0d:	8b 10                	mov    edx,DWORD PTR [rax]
  138f0f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  138f13:	8b 00                	mov    eax,DWORD PTR [rax]
  138f15:	83 c0 01             	add    eax,0x1
  138f18:	01 c2                	add    edx,eax
  138f1a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138f1e:	89 10                	mov    DWORD PTR [rax],edx
  138f20:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  138f24:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  138f28:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  138f2c:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  138f31:	75 cb                	jne    138efe <sys_free+0x78>
  138f33:	eb 01                	jmp    138f36 <sys_free+0xb0>
  138f35:	90                   	nop
  138f36:	b8 00 00 00 00       	mov    eax,0x0
  138f3b:	5d                   	pop    rbp
  138f3c:	c3                   	ret    
  138f3d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000138f40 <outb>:
  138f40:	66 8b 54 24 04       	mov    dx,WORD PTR [rsp+0x4]
  138f45:	8a 44 24 08          	mov    al,BYTE PTR [rsp+0x8]
  138f49:	ee                   	out    dx,al
  138f4a:	e8 31 00 00 00       	call   138f80 <io_delay>
  138f4f:	c3                   	ret    

0000000000138f50 <outw>:
  138f50:	66 8b 54 24 04       	mov    dx,WORD PTR [rsp+0x4]
  138f55:	66 8b 44 24 08       	mov    ax,WORD PTR [rsp+0x8]
  138f5a:	66 ef                	out    dx,ax
  138f5c:	90                   	nop
  138f5d:	90                   	nop
  138f5e:	90                   	nop
  138f5f:	c3                   	ret    

0000000000138f60 <inb>:
  138f60:	31 c0                	xor    eax,eax
  138f62:	66 8b 54 24 04       	mov    dx,WORD PTR [rsp+0x4]
  138f67:	ec                   	in     al,dx
  138f68:	90                   	nop
  138f69:	90                   	nop
  138f6a:	90                   	nop
  138f6b:	c3                   	ret    

0000000000138f6c <inw>:
  138f6c:	31 c0                	xor    eax,eax
  138f6e:	66 8b 54 24 04       	mov    dx,WORD PTR [rsp+0x4]
  138f73:	66 ed                	in     ax,dx
  138f75:	90                   	nop
  138f76:	90                   	nop
  138f77:	90                   	nop
  138f78:	c3                   	ret    

0000000000138f79 <eoi>:
  138f79:	b0 20                	mov    al,0x20
  138f7b:	e6 a0                	out    0xa0,al
  138f7d:	e6 20                	out    0x20,al
  138f7f:	c3                   	ret    

0000000000138f80 <io_delay>:
  138f80:	90                   	nop
  138f81:	90                   	nop
  138f82:	90                   	nop
  138f83:	90                   	nop
  138f84:	c3                   	ret    

0000000000138f85 <turn_on_int>:
  138f85:	b0 f8                	mov    al,0xf8
  138f87:	e6 21                	out    0x21,al
  138f89:	e8 f2 ff ff ff       	call   138f80 <io_delay>
  138f8e:	b0 af                	mov    al,0xaf
  138f90:	e6 a1                	out    0xa1,al
  138f92:	e8 e9 ff ff ff       	call   138f80 <io_delay>
  138f97:	0f 01 1d 40 8f 13 00 	lidt   [rip+0x138f40]        # 271ede <dev_stdout+0x13341e>
  138f9e:	90                   	nop
  138f9f:	90                   	nop
  138fa0:	90                   	nop
  138fa1:	90                   	nop
  138fa2:	fb                   	sti    
  138fa3:	c3                   	ret    

0000000000138fa4 <report_back_trace_of_err>:
  138fa4:	8b 44 24 04          	mov    eax,DWORD PTR [rsp+0x4]
  138fa8:	50                   	push   rax
  138fa9:	68 40 8f 13 00       	push   0x138f40
  138fae:	83 c4 08             	add    esp,0x8
  138fb1:	c3                   	ret    

0000000000138fb2 <bt_msg>:
  138fb2:	65 72 72             	gs jb  139027 <fill_desc+0x16>
  138fb5:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  138fb6:	72 20                	jb     138fd8 <init_gdt+0xb>
  138fb8:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  138fb9:	63 63 75             	movsxd esp,DWORD PTR [rbx+0x75]
  138fbc:	72 73                	jb     139031 <fill_desc+0x20>
  138fbe:	20 61 74             	and    BYTE PTR [rcx+0x74],ah
  138fc1:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR [rip+0x6e5c78]        # 81ec3f <dev_stdout+0x6e017f>

0000000000138fc7 <idtptr>:
  138fc7:	f8                   	clc    
  138fc8:	07                   	(bad)  
  138fc9:	00 00                	add    BYTE PTR [rax],al
	...

0000000000138fcd <init_gdt>:
  138fcd:	f3 0f 1e fa          	endbr64 
  138fd1:	55                   	push   rbp
  138fd2:	48 89 e5             	mov    rbp,rsp
  138fd5:	b9 01 00 00 00       	mov    ecx,0x1
  138fda:	ba 9e cf 00 00       	mov    edx,0xcf9e
  138fdf:	be ff ff ff ff       	mov    esi,0xffffffff
  138fe4:	bf 00 00 00 00       	mov    edi,0x0
  138fe9:	e8 23 00 00 00       	call   139011 <fill_desc>
  138fee:	b9 02 00 00 00       	mov    ecx,0x2
  138ff3:	ba 92 cf 00 00       	mov    edx,0xcf92
  138ff8:	be ff ff ff ff       	mov    esi,0xffffffff
  138ffd:	bf 00 00 00 00       	mov    edi,0x0
  139002:	e8 0a 00 00 00       	call   139011 <fill_desc>
  139007:	0f 01 15 68 a0 fc ff 	lgdt   [rip+0xfffffffffffca068]        # 103076 <gdtptr>
  13900e:	90                   	nop
  13900f:	5d                   	pop    rbp
  139010:	c3                   	ret    

0000000000139011 <fill_desc>:
  139011:	f3 0f 1e fa          	endbr64 
  139015:	55                   	push   rbp
  139016:	48 89 e5             	mov    rbp,rsp
  139019:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  13901c:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  13901f:	89 d0                	mov    eax,edx
  139021:	89 4d f0             	mov    DWORD PTR [rbp-0x10],ecx
  139024:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
  139028:	48 8b 15 51 4c 00 00 	mov    rdx,QWORD PTR [rip+0x4c51]        # 13dc80 <gdt>
  13902f:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  139032:	48 c1 e0 03          	shl    rax,0x3
  139036:	48 01 d0             	add    rax,rdx
  139039:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  13903c:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
  139040:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  139043:	c1 e8 10             	shr    eax,0x10
  139046:	89 c1                	mov    ecx,eax
  139048:	48 8b 15 31 4c 00 00 	mov    rdx,QWORD PTR [rip+0x4c31]        # 13dc80 <gdt>
  13904f:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  139052:	48 c1 e0 03          	shl    rax,0x3
  139056:	48 01 d0             	add    rax,rdx
  139059:	89 ca                	mov    edx,ecx
  13905b:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
  13905e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  139061:	c1 e8 18             	shr    eax,0x18
  139064:	89 c1                	mov    ecx,eax
  139066:	48 8b 15 13 4c 00 00 	mov    rdx,QWORD PTR [rip+0x4c13]        # 13dc80 <gdt>
  13906d:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  139070:	48 c1 e0 03          	shl    rax,0x3
  139074:	48 01 d0             	add    rax,rdx
  139077:	89 ca                	mov    edx,ecx
  139079:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
  13907c:	48 8b 15 fd 4b 00 00 	mov    rdx,QWORD PTR [rip+0x4bfd]        # 13dc80 <gdt>
  139083:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  139086:	48 c1 e0 03          	shl    rax,0x3
  13908a:	48 01 d0             	add    rax,rdx
  13908d:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  139090:	66 89 10             	mov    WORD PTR [rax],dx
  139093:	48 8b 15 e6 4b 00 00 	mov    rdx,QWORD PTR [rip+0x4be6]        # 13dc80 <gdt>
  13909a:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  13909d:	48 c1 e0 03          	shl    rax,0x3
  1390a1:	48 01 c2             	add    rdx,rax
  1390a4:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  1390a8:	66 89 42 05          	mov    WORD PTR [rdx+0x5],ax
  1390ac:	90                   	nop
  1390ad:	5d                   	pop    rbp
  1390ae:	c3                   	ret    

00000000001390af <fill_gate>:
  1390af:	f3 0f 1e fa          	endbr64 
  1390b3:	55                   	push   rbp
  1390b4:	48 89 e5             	mov    rbp,rsp
  1390b7:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  1390ba:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  1390bd:	89 c8                	mov    eax,ecx
  1390bf:	66 89 55 e4          	mov    WORD PTR [rbp-0x1c],dx
  1390c3:	66 89 45 e0          	mov    WORD PTR [rbp-0x20],ax
  1390c7:	48 8b 05 b2 4b 00 00 	mov    rax,QWORD PTR [rip+0x4bb2]        # 13dc80 <gdt>
  1390ce:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  1390d2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  1390d5:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  1390dc:	00 
  1390dd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  1390e1:	48 01 d0             	add    rax,rdx
  1390e4:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  1390e7:	66 89 10             	mov    WORD PTR [rax],dx
  1390ea:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  1390ed:	c1 e8 10             	shr    eax,0x10
  1390f0:	89 c2                	mov    edx,eax
  1390f2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  1390f5:	48 8d 0c c5 00 00 00 	lea    rcx,[rax*8+0x0]
  1390fc:	00 
  1390fd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  139101:	48 01 c8             	add    rax,rcx
  139104:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
  139108:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  13910b:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  139112:	00 
  139113:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  139117:	48 01 c2             	add    rdx,rax
  13911a:	0f b7 45 e4          	movzx  eax,WORD PTR [rbp-0x1c]
  13911e:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
  139122:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  139125:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  13912c:	00 
  13912d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  139131:	48 01 c2             	add    rdx,rax
  139134:	0f b7 45 e0          	movzx  eax,WORD PTR [rbp-0x20]
  139138:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
  13913c:	90                   	nop
  13913d:	5d                   	pop    rbp
  13913e:	c3                   	ret    

000000000013913f <fill_ldt_desc>:
  13913f:	f3 0f 1e fa          	endbr64 
  139143:	55                   	push   rbp
  139144:	48 89 e5             	mov    rbp,rsp
  139147:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  13914a:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  13914d:	89 d0                	mov    eax,edx
  13914f:	48 89 4d e8          	mov    QWORD PTR [rbp-0x18],rcx
  139153:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
  139157:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13915a:	89 c2                	mov    edx,eax
  13915c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  139160:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
  139164:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  139167:	c1 e8 10             	shr    eax,0x10
  13916a:	89 c2                	mov    edx,eax
  13916c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  139170:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
  139173:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  139176:	c1 e8 18             	shr    eax,0x18
  139179:	89 c2                	mov    edx,eax
  13917b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13917f:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
  139182:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  139185:	89 c2                	mov    edx,eax
  139187:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13918b:	66 89 10             	mov    WORD PTR [rax],dx
  13918e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  139191:	c1 e8 10             	shr    eax,0x10
  139194:	c1 e0 08             	shl    eax,0x8
  139197:	66 25 00 0f          	and    ax,0xf00
  13919b:	66 0b 45 f4          	or     ax,WORD PTR [rbp-0xc]
  13919f:	89 c2                	mov    edx,eax
  1391a1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  1391a5:	66 89 50 05          	mov    WORD PTR [rax+0x5],dx
  1391a9:	90                   	nop
  1391aa:	5d                   	pop    rbp
  1391ab:	c3                   	ret    
  1391ac:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

00000000001391b0 <fill_desc>:
  1391b0:	8b 44 24 04          	mov    eax,DWORD PTR [rsp+0x4]
  1391b4:	8b 5c 24 08          	mov    ebx,DWORD PTR [rsp+0x8]
  1391b8:	8b 4c 24 0c          	mov    ecx,DWORD PTR [rsp+0xc]
  1391bc:	8b 54 24 10          	mov    edx,DWORD PTR [rsp+0x10]
  1391c0:	be 00 60 00 00       	mov    esi,0x6000
  1391c5:	c1 e2 03             	shl    edx,0x3
  1391c8:	01 d6                	add    esi,edx
  1391ca:	66 89 1e             	mov    WORD PTR [rsi],bx
  1391cd:	66 89 46 02          	mov    WORD PTR [rsi+0x2],ax
  1391d1:	c1 e8 10             	shr    eax,0x10
  1391d4:	88 46 04             	mov    BYTE PTR [rsi+0x4],al
  1391d7:	c1 eb 10             	shr    ebx,0x10
  1391da:	88 5e 06             	mov    BYTE PTR [rsi+0x6],bl
  1391dd:	88 66 07             	mov    BYTE PTR [rsi+0x7],ah
  1391e0:	09 4e 05             	or     DWORD PTR [rsi+0x5],ecx
  1391e3:	c3                   	ret    

00000000001391e4 <clock_c>:
  1391e4:	f3 0f 1e fa          	endbr64 
  1391e8:	55                   	push   rbp
  1391e9:	48 89 e5             	mov    rbp,rsp
  1391ec:	b8 00 00 00 00       	mov    eax,0x0
  1391f1:	e8 6b 10 00 00       	call   13a261 <execute_request>
  1391f6:	b8 00 00 00 00       	mov    eax,0x0
  1391fb:	e8 e0 ea ff ff       	call   137ce0 <do_req>
  139200:	8b 05 1a 4a 00 00    	mov    eax,DWORD PTR [rip+0x4a1a]        # 13dc20 <manage_proc_lock>
  139206:	85 c0                	test   eax,eax
  139208:	75 0a                	jne    139214 <clock_c+0x30>
  13920a:	b8 00 00 00 00       	mov    eax,0x0
  13920f:	e8 a7 f0 ff ff       	call   1382bb <manage_proc>
  139214:	90                   	nop
  139215:	5d                   	pop    rbp
  139216:	c3                   	ret    
  139217:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  13921e:	00 00 

0000000000139220 <clock>:
  139220:	83 3d 20 dc 13 00 00 	cmp    DWORD PTR [rip+0x13dc20],0x0        # 276e47 <dev_stdout+0x138387>
  139227:	75 5d                	jne    139286 <clock.normal_part>
  139229:	60                   	(bad)  
  13922a:	b9 08 00 00 00       	mov    ecx,0x8
  13922f:	89 e6                	mov    esi,esp
  139231:	bf 60 50 11 00       	mov    edi,0x115060
  139236:	83 c7 44             	add    edi,0x44

0000000000139239 <clock.saver_loop>:
  139239:	8b 1e                	mov    ebx,DWORD PTR [rsi]
  13923b:	89 1f                	mov    DWORD PTR [rdi],ebx
  13923d:	83 c6 04             	add    esi,0x4
  139240:	83 ef 04             	sub    edi,0x4
  139243:	e2 f4                	loop   139239 <clock.saver_loop>
  139245:	61                   	(bad)  
  139246:	bf 60 50 11 00       	mov    edi,0x115060
  13924b:	8b 04 24             	mov    eax,DWORD PTR [rsp]
  13924e:	89 47 20             	mov    DWORD PTR [rdi+0x20],eax
  139251:	9c                   	pushf  
  139252:	5b                   	pop    rbx
  139253:	81 cb 00 02 00 00    	or     ebx,0x200
  139259:	89 5f 24             	mov    DWORD PTR [rdi+0x24],ebx
  13925c:	66 8c c0             	mov    ax,es
  13925f:	66 89 47 48          	mov    WORD PTR [rdi+0x48],ax
  139263:	66 8c c8             	mov    ax,cs
  139266:	66 89 47 4c          	mov    WORD PTR [rdi+0x4c],ax
  13926a:	66 8c d0             	mov    ax,ss
  13926d:	66 89 47 50          	mov    WORD PTR [rdi+0x50],ax
  139271:	66 8c d8             	mov    ax,ds
  139274:	66 89 47 54          	mov    WORD PTR [rdi+0x54],ax
  139278:	66 8c e0             	mov    ax,fs
  13927b:	66 89 47 58          	mov    WORD PTR [rdi+0x58],ax
  13927f:	66 8c e8             	mov    ax,gs
  139282:	66 89 47 5c          	mov    WORD PTR [rdi+0x5c],ax

0000000000139286 <clock.normal_part>:
  139286:	b0 20                	mov    al,0x20
  139288:	e6 a0                	out    0xa0,al
  13928a:	e6 20                	out    0x20,al
  13928c:	e8 57 ff ff ff       	call   1391e8 <clock_c+0x4>
  139291:	cf                   	iret   

0000000000139292 <execute>:
  139292:	f3 0f 1e fa          	endbr64 
  139296:	55                   	push   rbp
  139297:	48 89 e5             	mov    rbp,rsp
  13929a:	48 83 ec 30          	sub    rsp,0x30
  13929e:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  1392a2:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  1392a9:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
  1392b0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  1392b4:	be 01 00 00 00       	mov    esi,0x1
  1392b9:	48 89 c7             	mov    rdi,rax
  1392bc:	e8 11 cd ff ff       	call   135fd2 <sys_open>
  1392c1:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  1392c4:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  1392c8:	75 0a                	jne    1392d4 <execute+0x42>
  1392ca:	b8 ff ff ff ff       	mov    eax,0xffffffff
  1392cf:	e9 b7 00 00 00       	jmp    13938b <execute+0xf9>
  1392d4:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  1392d8:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  1392dc:	eb 05                	jmp    1392e3 <execute+0x51>
  1392de:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  1392e3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  1392e7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  1392ea:	84 c0                	test   al,al
  1392ec:	75 f0                	jne    1392de <execute+0x4c>
  1392ee:	eb 05                	jmp    1392f5 <execute+0x63>
  1392f0:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  1392f5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  1392f9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  1392fc:	3c 2f                	cmp    al,0x2f
  1392fe:	74 0a                	je     13930a <execute+0x78>
  139300:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  139304:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  139308:	77 e6                	ja     1392f0 <execute+0x5e>
  13930a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  13930e:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  139312:	76 2f                	jbe    139343 <execute+0xb1>
  139314:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  139318:	c6 00 00             	mov    BYTE PTR [rax],0x0
  13931b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  13931f:	be 01 00 00 00       	mov    esi,0x1
  139324:	48 89 c7             	mov    rdi,rax
  139327:	e8 a6 cc ff ff       	call   135fd2 <sys_open>
  13932c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  13932f:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  139333:	75 07                	jne    13933c <execute+0xaa>
  139335:	b8 ff ff ff ff       	mov    eax,0xffffffff
  13933a:	eb 4f                	jmp    13938b <execute+0xf9>
  13933c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  139340:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
  139343:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  139346:	48 63 d0             	movsxd rdx,eax
  139349:	48 89 d0             	mov    rax,rdx
  13934c:	48 01 c0             	add    rax,rax
  13934f:	48 01 d0             	add    rax,rdx
  139352:	48 c1 e0 05          	shl    rax,0x5
  139356:	48 8d 90 20 37 10 00 	lea    rdx,[rax+0x103720]
  13935d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  139360:	48 63 c8             	movsxd rcx,eax
  139363:	48 89 c8             	mov    rax,rcx
  139366:	48 01 c0             	add    rax,rax
  139369:	48 01 c8             	add    rax,rcx
  13936c:	48 c1 e0 05          	shl    rax,0x5
  139370:	48 05 20 37 10 00    	add    rax,0x103720
  139376:	b9 f5 93 13 00       	mov    ecx,0x1393f5
  13937b:	48 89 c6             	mov    rsi,rax
  13937e:	89 cf                	mov    edi,ecx
  139380:	e8 b7 f7 ff ff       	call   138b3c <reg_proc>
  139385:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  139388:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  13938b:	c9                   	leave  
  13938c:	c3                   	ret    

000000000013938d <exec_call>:
  13938d:	f3 0f 1e fa          	endbr64 
  139391:	55                   	push   rbp
  139392:	48 89 e5             	mov    rbp,rsp
  139395:	48 83 ec 20          	sub    rsp,0x20
  139399:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  13939d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  1393a1:	48 89 c7             	mov    rdi,rax
  1393a4:	e8 e9 fe ff ff       	call   139292 <execute>
  1393a9:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  1393ac:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1393af:	01 c0                	add    eax,eax
  1393b1:	83 c0 05             	add    eax,0x5
  1393b4:	c1 e0 03             	shl    eax,0x3
  1393b7:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  1393ba:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1393bd:	89 c7                	mov    edi,eax
  1393bf:	e8 18 f0 ff ff       	call   1383dc <switch_proc_tss>
  1393c4:	90                   	nop
  1393c5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1393c8:	48 98                	cdqe   
  1393ca:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  1393d1:	48 05 60 b5 10 00    	add    rax,0x10b560
  1393d7:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  1393da:	83 f8 03             	cmp    eax,0x3
  1393dd:	75 e6                	jne    1393c5 <exec_call+0x38>
  1393df:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1393e2:	48 98                	cdqe   
  1393e4:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  1393eb:	48 05 70 b5 10 00    	add    rax,0x10b570
  1393f1:	8b 00                	mov    eax,DWORD PTR [rax]
  1393f3:	c9                   	leave  
  1393f4:	c3                   	ret    

00000000001393f5 <proc_start>:
  1393f5:	f3 0f 1e fa          	endbr64 
  1393f9:	55                   	push   rbp
  1393fa:	48 89 e5             	mov    rbp,rsp
  1393fd:	8b 05 2d bd fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdbd2d]        # 115130 <cur_proc>
  139403:	48 98                	cdqe   
  139405:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  13940c:	48 05 60 b5 10 00    	add    rax,0x10b560
  139412:	48 89 c7             	mov    rdi,rax
  139415:	e8 1a 00 00 00       	call   139434 <load_pe>
  13941a:	8b 05 10 bd fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdbd10]        # 115130 <cur_proc>
  139420:	89 c7                	mov    edi,eax
  139422:	e8 f4 f4 ff ff       	call   13891b <del_proc>
  139427:	bf 00 00 00 00       	mov    edi,0x0
  13942c:	e8 ab ef ff ff       	call   1383dc <switch_proc_tss>
  139431:	90                   	nop
  139432:	5d                   	pop    rbp
  139433:	c3                   	ret    

0000000000139434 <load_pe>:
  139434:	f3 0f 1e fa          	endbr64 
  139438:	55                   	push   rbp
  139439:	48 89 e5             	mov    rbp,rsp
  13943c:	48 81 ec c0 02 00 00 	sub    rsp,0x2c0
  139443:	48 89 bd 48 fd ff ff 	mov    QWORD PTR [rbp-0x2b8],rdi
  13944a:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  139451:	48 8b 80 94 00 00 00 	mov    rax,QWORD PTR [rax+0x94]
  139458:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
  13945c:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  139460:	8b 00                	mov    eax,DWORD PTR [rax]
  139462:	89 45 94             	mov    DWORD PTR [rbp-0x6c],eax
  139465:	48 8d 8d 70 fe ff ff 	lea    rcx,[rbp-0x190]
  13946c:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  13946f:	ba 44 00 00 00       	mov    edx,0x44
  139474:	48 89 ce             	mov    rsi,rcx
  139477:	89 c7                	mov    edi,eax
  139479:	e8 33 d1 ff ff       	call   1365b1 <sys_read>
  13947e:	48 8b 85 ac fe ff ff 	mov    rax,QWORD PTR [rbp-0x154]
  139485:	89 c1                	mov    ecx,eax
  139487:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  13948a:	ba 00 00 00 00       	mov    edx,0x0
  13948f:	89 ce                	mov    esi,ecx
  139491:	89 c7                	mov    edi,eax
  139493:	e8 aa d1 ff ff       	call   136642 <sys_seek>
  139498:	48 8d 8d 70 fd ff ff 	lea    rcx,[rbp-0x290]
  13949f:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  1394a2:	ba f8 00 00 00       	mov    edx,0xf8
  1394a7:	48 89 ce             	mov    rsi,rcx
  1394aa:	89 c7                	mov    edi,eax
  1394ac:	e8 00 d1 ff ff       	call   1365b1 <sys_read>
  1394b1:	8b 85 a4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x25c]
  1394b7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  1394ba:	8b 85 c0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x240]
  1394c0:	c1 e8 0c             	shr    eax,0xc
  1394c3:	89 45 90             	mov    DWORD PTR [rbp-0x70],eax
  1394c6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1394c9:	c1 e8 16             	shr    eax,0x16
  1394cc:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
  1394cf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1394d2:	25 ff ff 3f 00       	and    eax,0x3fffff
  1394d7:	c1 e8 0c             	shr    eax,0xc
  1394da:	89 45 88             	mov    DWORD PTR [rbp-0x78],eax
  1394dd:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  1394e4:	48 8b 90 84 00 00 00 	mov    rdx,QWORD PTR [rax+0x84]
  1394eb:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
  1394ee:	48 98                	cdqe   
  1394f0:	48 c1 e0 02          	shl    rax,0x2
  1394f4:	48 01 d0             	add    rax,rdx
  1394f7:	8b 00                	mov    eax,DWORD PTR [rax]
  1394f9:	89 c0                	mov    eax,eax
  1394fb:	25 00 f0 ff ff       	and    eax,0xfffff000
  139500:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
  139504:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  13950b:	eb 48                	jmp    139555 <load_pe+0x121>
  13950d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  139510:	99                   	cdq    
  139511:	c1 ea 16             	shr    edx,0x16
  139514:	01 d0                	add    eax,edx
  139516:	25 ff 03 00 00       	and    eax,0x3ff
  13951b:	29 d0                	sub    eax,edx
  13951d:	89 c2                	mov    edx,eax
  13951f:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
  139522:	01 d0                	add    eax,edx
  139524:	48 98                	cdqe   
  139526:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  13952d:	00 
  13952e:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  139532:	48 01 d0             	add    rax,rdx
  139535:	8b 00                	mov    eax,DWORD PTR [rax]
  139537:	83 e0 01             	and    eax,0x1
  13953a:	85 c0                	test   eax,eax
  13953c:	74 13                	je     139551 <load_pe+0x11d>
  13953e:	48 83 7d 80 00       	cmp    QWORD PTR [rbp-0x80],0x0
  139543:	74 0c                	je     139551 <load_pe+0x11d>
  139545:	81 45 fc 00 10 00 00 	add    DWORD PTR [rbp-0x4],0x1000
  13954c:	e9 75 ff ff ff       	jmp    1394c6 <load_pe+0x92>
  139551:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  139555:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  139558:	3b 45 90             	cmp    eax,DWORD PTR [rbp-0x70]
  13955b:	7c b0                	jl     13950d <load_pe+0xd9>
  13955d:	90                   	nop
  13955e:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  139561:	ba 00 00 00 00       	mov    edx,0x0
  139566:	be 00 00 00 00       	mov    esi,0x0
  13956b:	89 c7                	mov    edi,eax
  13956d:	e8 d0 d0 ff ff       	call   136642 <sys_seek>
  139572:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  139575:	48 89 c1             	mov    rcx,rax
  139578:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  13957b:	ba 00 10 00 00       	mov    edx,0x1000
  139580:	48 89 ce             	mov    rsi,rcx
  139583:	89 c7                	mov    edi,eax
  139585:	e8 27 d0 ff ff       	call   1365b1 <sys_read>
  13958a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13958d:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
  139594:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  139597:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  13959e:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  1395a2:	48 01 d0             	add    rax,rdx
  1395a5:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  1395ac:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  1395b3:	48 83 c0 04          	add    rax,0x4
  1395b7:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
  1395be:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  1395c5:	8b 40 50             	mov    eax,DWORD PTR [rax+0x50]
  1395c8:	89 85 64 ff ff ff    	mov    DWORD PTR [rbp-0x9c],eax
  1395ce:	8b 85 64 ff ff ff    	mov    eax,DWORD PTR [rbp-0x9c]
  1395d4:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  1395da:	85 c0                	test   eax,eax
  1395dc:	0f 48 c2             	cmovs  eax,edx
  1395df:	c1 f8 0c             	sar    eax,0xc
  1395e2:	89 85 60 ff ff ff    	mov    DWORD PTR [rbp-0xa0],eax
  1395e8:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  1395ef:	8b 50 28             	mov    edx,DWORD PTR [rax+0x28]
  1395f2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1395f5:	01 d0                	add    eax,edx
  1395f7:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
  1395fd:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  139603:	8d 90 ff 03 00 00    	lea    edx,[rax+0x3ff]
  139609:	85 c0                	test   eax,eax
  13960b:	0f 48 c2             	cmovs  eax,edx
  13960e:	c1 f8 0a             	sar    eax,0xa
  139611:	89 c1                	mov    ecx,eax
  139613:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  139619:	99                   	cdq    
  13961a:	c1 ea 16             	shr    edx,0x16
  13961d:	01 d0                	add    eax,edx
  13961f:	25 ff 03 00 00       	and    eax,0x3ff
  139624:	29 d0                	sub    eax,edx
  139626:	01 c8                	add    eax,ecx
  139628:	85 c0                	test   eax,eax
  13962a:	0f 95 c0             	setne  al
  13962d:	0f b6 c0             	movzx  eax,al
  139630:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
  139636:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  13963c:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  139642:	85 c0                	test   eax,eax
  139644:	0f 48 c2             	cmovs  eax,edx
  139647:	c1 f8 16             	sar    eax,0x16
  13964a:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
  139650:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  139657:	89 c0                	mov    eax,eax
  139659:	48 05 f8 00 00 00    	add    rax,0xf8
  13965f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  139663:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  13966a:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  13966e:	0f b7 d0             	movzx  edx,ax
  139671:	89 d0                	mov    eax,edx
  139673:	c1 e0 02             	shl    eax,0x2
  139676:	01 d0                	add    eax,edx
  139678:	c1 e0 03             	shl    eax,0x3
  13967b:	05 3c 01 00 00       	add    eax,0x13c
  139680:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
  139686:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  13968d:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  139690:	89 85 4c ff ff ff    	mov    DWORD PTR [rbp-0xb4],eax
  139696:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  13969c:	99                   	cdq    
  13969d:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  1396a3:	89 d0                	mov    eax,edx
  1396a5:	85 c0                	test   eax,eax
  1396a7:	74 23                	je     1396cc <load_pe+0x298>
  1396a9:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  1396af:	99                   	cdq    
  1396b0:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  1396b6:	89 d1                	mov    ecx,edx
  1396b8:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  1396be:	29 c8                	sub    eax,ecx
  1396c0:	89 c2                	mov    edx,eax
  1396c2:	8b 85 4c ff ff ff    	mov    eax,DWORD PTR [rbp-0xb4]
  1396c8:	01 d0                	add    eax,edx
  1396ca:	eb 06                	jmp    1396d2 <load_pe+0x29e>
  1396cc:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  1396d2:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
  1396d8:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  1396df:	eb 68                	jmp    139749 <load_pe+0x315>
  1396e1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  1396e5:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  1396e8:	25 00 00 00 02       	and    eax,0x2000000
  1396ed:	89 85 bc fe ff ff    	mov    DWORD PTR [rbp-0x144],eax
  1396f3:	83 bd bc fe ff ff 00 	cmp    DWORD PTR [rbp-0x144],0x0
  1396fa:	75 43                	jne    13973f <load_pe+0x30b>
  1396fc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  139700:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  139703:	89 c1                	mov    ecx,eax
  139705:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  139708:	ba 00 00 00 00       	mov    edx,0x0
  13970d:	89 ce                	mov    esi,ecx
  13970f:	89 c7                	mov    edi,eax
  139711:	e8 2c cf ff ff       	call   136642 <sys_seek>
  139716:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  13971a:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  13971d:	89 c2                	mov    edx,eax
  13971f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  139723:	8b 48 0c             	mov    ecx,DWORD PTR [rax+0xc]
  139726:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  139729:	01 c8                	add    eax,ecx
  13972b:	89 c0                	mov    eax,eax
  13972d:	48 89 c1             	mov    rcx,rax
  139730:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  139733:	48 89 ce             	mov    rsi,rcx
  139736:	89 c7                	mov    edi,eax
  139738:	e8 74 ce ff ff       	call   1365b1 <sys_read>
  13973d:	eb 01                	jmp    139740 <load_pe+0x30c>
  13973f:	90                   	nop
  139740:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  139744:	48 83 45 f0 28       	add    QWORD PTR [rbp-0x10],0x28
  139749:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  139750:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  139754:	0f b7 c0             	movzx  eax,ax
  139757:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  13975a:	7c 85                	jl     1396e1 <load_pe+0x2ad>
  13975c:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  139763:	48 83 e8 80          	sub    rax,0xffffffffffffff80
  139767:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
  13976e:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  139775:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  139778:	85 c0                	test   eax,eax
  13977a:	0f 84 71 02 00 00    	je     1399f1 <load_pe+0x5bd>
  139780:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  139787:	8b 10                	mov    edx,DWORD PTR [rax]
  139789:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13978c:	01 d0                	add    eax,edx
  13978e:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
  139794:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  13979a:	48 98                	cdqe   
  13979c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  1397a0:	e9 3e 02 00 00       	jmp    1399e3 <load_pe+0x5af>
  1397a5:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  1397a9:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  1397ac:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1397af:	01 d0                	add    eax,edx
  1397b1:	89 c0                	mov    eax,eax
  1397b3:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
  1397ba:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  1397c1:	be 70 e4 13 00       	mov    esi,0x13e470
  1397c6:	48 89 c7             	mov    rdi,rax
  1397c9:	e8 7c 3d 00 00       	call   13d54a <strcmp>
  1397ce:	85 c0                	test   eax,eax
  1397d0:	75 09                	jne    1397db <load_pe+0x3a7>
  1397d2:	c7 45 dc 00 00 c0 01 	mov    DWORD PTR [rbp-0x24],0x1c00000
  1397d9:	eb 25                	jmp    139800 <load_pe+0x3cc>
  1397db:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  1397e2:	48 89 c7             	mov    rdi,rax
  1397e5:	e8 4a fc ff ff       	call   139434 <load_pe>
  1397ea:	89 85 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],eax
  1397f0:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  1397f6:	89 c7                	mov    edi,eax
  1397f8:	e8 c9 03 00 00       	call   139bc6 <get_module_addr>
  1397fd:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
  139800:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  139803:	48 98                	cdqe   
  139805:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
  13980c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  13980f:	48 63 d0             	movsxd rdx,eax
  139812:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  139819:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  13981d:	48 01 d0             	add    rax,rdx
  139820:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
  139827:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  13982e:	8b 50 78             	mov    edx,DWORD PTR [rax+0x78]
  139831:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  139834:	01 d0                	add    eax,edx
  139836:	89 c0                	mov    eax,eax
  139838:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  13983f:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  139846:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  139849:	89 85 0c ff ff ff    	mov    DWORD PTR [rbp-0xf4],eax
  13984f:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  139856:	8b 50 20             	mov    edx,DWORD PTR [rax+0x20]
  139859:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  13985c:	01 d0                	add    eax,edx
  13985e:	89 c0                	mov    eax,eax
  139860:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
  139867:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  13986e:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  139871:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  139874:	01 d0                	add    eax,edx
  139876:	89 c0                	mov    eax,eax
  139878:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
  13987f:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  139886:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  139889:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  13988c:	01 d0                	add    eax,edx
  13988e:	89 c0                	mov    eax,eax
  139890:	48 89 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rax
  139897:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  13989e:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  1398a1:	89 85 ec fe ff ff    	mov    DWORD PTR [rbp-0x114],eax
  1398a7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  1398ab:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  1398ae:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1398b1:	01 d0                	add    eax,edx
  1398b3:	89 c0                	mov    eax,eax
  1398b5:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  1398b9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  1398bd:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  1398c0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  1398c3:	01 d0                	add    eax,edx
  1398c5:	89 c0                	mov    eax,eax
  1398c7:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  1398cb:	e9 00 01 00 00       	jmp    1399d0 <load_pe+0x59c>
  1398d0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  1398d4:	8b 00                	mov    eax,DWORD PTR [rax]
  1398d6:	85 c0                	test   eax,eax
  1398d8:	79 43                	jns    13991d <load_pe+0x4e9>
  1398da:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  1398de:	8b 00                	mov    eax,DWORD PTR [rax]
  1398e0:	25 ff ff ff 7f       	and    eax,0x7fffffff
  1398e5:	2b 85 ec fe ff ff    	sub    eax,DWORD PTR [rbp-0x114]
  1398eb:	89 85 d8 fe ff ff    	mov    DWORD PTR [rbp-0x128],eax
  1398f1:	8b 85 d8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x128]
  1398f7:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  1398fe:	00 
  1398ff:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  139906:	48 01 d0             	add    rax,rdx
  139909:	8b 10                	mov    edx,DWORD PTR [rax]
  13990b:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  13990e:	01 d0                	add    eax,edx
  139910:	89 c2                	mov    edx,eax
  139912:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  139916:	89 10                	mov    DWORD PTR [rax],edx
  139918:	e9 a9 00 00 00       	jmp    1399c6 <load_pe+0x592>
  13991d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  139921:	8b 00                	mov    eax,DWORD PTR [rax]
  139923:	89 c0                	mov    eax,eax
  139925:	48 89 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rax
  13992c:	48 83 85 e0 fe ff ff 	add    QWORD PTR [rbp-0x120],0x2
  139933:	02 
  139934:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
  13993b:	eb 7a                	jmp    1399b7 <load_pe+0x583>
  13993d:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  139940:	48 98                	cdqe   
  139942:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  139949:	00 
  13994a:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  139951:	48 01 d0             	add    rax,rdx
  139954:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  139957:	48 8b 85 e0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x120]
  13995e:	48 89 d6             	mov    rsi,rdx
  139961:	48 89 c7             	mov    rdi,rax
  139964:	e8 e1 3b 00 00       	call   13d54a <strcmp>
  139969:	85 c0                	test   eax,eax
  13996b:	75 46                	jne    1399b3 <load_pe+0x57f>
  13996d:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  139970:	48 98                	cdqe   
  139972:	48 8d 14 00          	lea    rdx,[rax+rax*1]
  139976:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  13997d:	48 01 d0             	add    rax,rdx
  139980:	0f b7 00             	movzx  eax,WORD PTR [rax]
  139983:	98                   	cwde   
  139984:	89 85 dc fe ff ff    	mov    DWORD PTR [rbp-0x124],eax
  13998a:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
  139990:	48 98                	cdqe   
  139992:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  139999:	00 
  13999a:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  1399a1:	48 01 d0             	add    rax,rdx
  1399a4:	8b 10                	mov    edx,DWORD PTR [rax]
  1399a6:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  1399a9:	01 d0                	add    eax,edx
  1399ab:	89 c2                	mov    edx,eax
  1399ad:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  1399b1:	89 10                	mov    DWORD PTR [rax],edx
  1399b3:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
  1399b7:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  1399ba:	3b 85 0c ff ff ff    	cmp    eax,DWORD PTR [rbp-0xf4]
  1399c0:	0f 8c 77 ff ff ff    	jl     13993d <load_pe+0x509>
  1399c6:	48 83 45 d0 04       	add    QWORD PTR [rbp-0x30],0x4
  1399cb:	48 83 45 c8 08       	add    QWORD PTR [rbp-0x38],0x8
  1399d0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  1399d4:	8b 00                	mov    eax,DWORD PTR [rax]
  1399d6:	85 c0                	test   eax,eax
  1399d8:	0f 85 f2 fe ff ff    	jne    1398d0 <load_pe+0x49c>
  1399de:	48 83 45 e0 14       	add    QWORD PTR [rbp-0x20],0x14
  1399e3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  1399e7:	8b 00                	mov    eax,DWORD PTR [rax]
  1399e9:	85 c0                	test   eax,eax
  1399eb:	0f 85 b4 fd ff ff    	jne    1397a5 <load_pe+0x371>
  1399f1:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  1399f8:	00 
  1399f9:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  139a00:	8b 80 a4 00 00 00    	mov    eax,DWORD PTR [rax+0xa4]
  139a06:	85 c0                	test   eax,eax
  139a08:	0f 84 e8 00 00 00    	je     139af6 <load_pe+0x6c2>
  139a0e:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  139a15:	8b 90 a0 00 00 00    	mov    edx,DWORD PTR [rax+0xa0]
  139a1b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  139a1e:	01 d0                	add    eax,edx
  139a20:	89 c0                	mov    eax,eax
  139a22:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  139a26:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  139a2a:	48 83 c0 40          	add    rax,0x40
  139a2e:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  139a32:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  139a36:	48 83 c0 02          	add    rax,0x2
  139a3a:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
  139a3e:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  139a45:	8b 40 34             	mov    eax,DWORD PTR [rax+0x34]
  139a48:	89 85 d4 fe ff ff    	mov    DWORD PTR [rbp-0x12c],eax
  139a4e:	e9 95 00 00 00       	jmp    139ae8 <load_pe+0x6b4>
  139a53:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  139a57:	8b 10                	mov    edx,DWORD PTR [rax]
  139a59:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  139a5c:	01 d0                	add    eax,edx
  139a5e:	89 85 d0 fe ff ff    	mov    DWORD PTR [rbp-0x130],eax
  139a64:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
  139a6b:	eb 59                	jmp    139ac6 <load_pe+0x692>
  139a6d:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  139a71:	0f b7 00             	movzx  eax,WORD PTR [rax]
  139a74:	66 85 c0             	test   ax,ax
  139a77:	74 48                	je     139ac1 <load_pe+0x68d>
  139a79:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  139a7d:	0f b7 00             	movzx  eax,WORD PTR [rax]
  139a80:	0f b7 d0             	movzx  edx,ax
  139a83:	8b 85 d0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x130]
  139a89:	01 d0                	add    eax,edx
  139a8b:	48 98                	cdqe   
  139a8d:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
  139a94:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  139a9b:	8b 00                	mov    eax,DWORD PTR [rax]
  139a9d:	2b 85 d4 fe ff ff    	sub    eax,DWORD PTR [rbp-0x12c]
  139aa3:	89 c2                	mov    edx,eax
  139aa5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  139aa8:	01 d0                	add    eax,edx
  139aaa:	89 c2                	mov    edx,eax
  139aac:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  139ab3:	89 10                	mov    DWORD PTR [rax],edx
  139ab5:	48 83 45 b0 04       	add    QWORD PTR [rbp-0x50],0x4
  139aba:	48 83 45 a8 04       	add    QWORD PTR [rbp-0x58],0x4
  139abf:	eb 01                	jmp    139ac2 <load_pe+0x68e>
  139ac1:	90                   	nop
  139ac2:	83 45 a4 01          	add    DWORD PTR [rbp-0x5c],0x1
  139ac6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  139aca:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  139acd:	c1 e8 02             	shr    eax,0x2
  139ad0:	89 c2                	mov    edx,eax
  139ad2:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  139ad5:	39 c2                	cmp    edx,eax
  139ad7:	77 94                	ja     139a6d <load_pe+0x639>
  139ad9:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  139add:	05 00 10 00 00       	add    eax,0x1000
  139ae2:	48 98                	cdqe   
  139ae4:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  139ae8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  139aec:	8b 00                	mov    eax,DWORD PTR [rax]
  139aee:	85 c0                	test   eax,eax
  139af0:	0f 85 5d ff ff ff    	jne    139a53 <load_pe+0x61f>
  139af6:	c7 85 50 fd ff ff 00 	mov    DWORD PTR [rbp-0x2b0],0x0
  139afd:	00 00 00 
  139b00:	c7 85 54 fd ff ff 00 	mov    DWORD PTR [rbp-0x2ac],0x0
  139b07:	00 00 00 
  139b0a:	48 c7 85 58 fd ff ff 	mov    QWORD PTR [rbp-0x2a8],0x0
  139b11:	00 00 00 00 
  139b15:	48 c7 85 60 fd ff ff 	mov    QWORD PTR [rbp-0x2a0],0x0
  139b1c:	00 00 00 00 
  139b20:	48 8d 85 50 fd ff ff 	lea    rax,[rbp-0x2b0]
  139b27:	ba 18 00 00 00       	mov    edx,0x18
  139b2c:	48 89 c6             	mov    rsi,rax
  139b2f:	bf 00 00 00 01       	mov    edi,0x1000000
  139b34:	e8 73 37 00 00       	call   13d2ac <memcpy>
  139b39:	8b 05 f1 b5 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdb5f1]        # 115130 <cur_proc>
  139b3f:	48 98                	cdqe   
  139b41:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  139b48:	48 05 70 b5 10 00    	add    rax,0x10b570
  139b4e:	c7 40 04 00 00 00 01 	mov    DWORD PTR [rax+0x4],0x1000000
  139b55:	8b 05 d5 b5 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdb5d5]        # 115130 <cur_proc>
  139b5b:	48 98                	cdqe   
  139b5d:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  139b64:	48 05 70 b5 10 00    	add    rax,0x10b570
  139b6a:	c7 40 08 00 10 00 01 	mov    DWORD PTR [rax+0x8],0x1001000
  139b71:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  139b77:	48 98                	cdqe   
  139b79:	48 89 85 c0 fe ff ff 	mov    QWORD PTR [rbp-0x140],rax
  139b80:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
  139b87:	be 00 00 00 00       	mov    esi,0x0
  139b8c:	bf 00 00 00 00       	mov    edi,0x0
  139b91:	ff d0                	call   rax
  139b93:	8b 15 97 b5 fd ff    	mov    edx,DWORD PTR [rip+0xfffffffffffdb597]        # 115130 <cur_proc>
  139b99:	89 c1                	mov    ecx,eax
  139b9b:	48 63 c2             	movsxd rax,edx
  139b9e:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  139ba5:	48 05 70 b5 10 00    	add    rax,0x10b570
  139bab:	89 08                	mov    DWORD PTR [rax],ecx
  139bad:	8b 05 7d b5 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdb57d]        # 115130 <cur_proc>
  139bb3:	48 98                	cdqe   
  139bb5:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  139bbc:	48 05 70 b5 10 00    	add    rax,0x10b570
  139bc2:	8b 00                	mov    eax,DWORD PTR [rax]
  139bc4:	c9                   	leave  
  139bc5:	c3                   	ret    

0000000000139bc6 <get_module_addr>:
  139bc6:	f3 0f 1e fa          	endbr64 
  139bca:	55                   	push   rbp
  139bcb:	48 89 e5             	mov    rbp,rsp
  139bce:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  139bd1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  139bd4:	48 98                	cdqe   
  139bd6:	8b 04 c5 40 7d 12 00 	mov    eax,DWORD PTR [rax*8+0x127d40]
  139bdd:	5d                   	pop    rbp
  139bde:	c3                   	ret    

0000000000139bdf <dispose_library>:
  139bdf:	f3 0f 1e fa          	endbr64 
  139be3:	55                   	push   rbp
  139be4:	48 89 e5             	mov    rbp,rsp
  139be7:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  139bea:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  139bee:	78 09                	js     139bf9 <dispose_library+0x1a>
  139bf0:	81 7d fc ff 00 00 00 	cmp    DWORD PTR [rbp-0x4],0xff
  139bf7:	7e 07                	jle    139c00 <dispose_library+0x21>
  139bf9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  139bfe:	eb 1d                	jmp    139c1d <dispose_library+0x3e>
  139c00:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  139c03:	48 98                	cdqe   
  139c05:	48 69 c0 2c 01 00 00 	imul   rax,rax,0x12c
  139c0c:	48 05 48 51 11 00    	add    rax,0x115148
  139c12:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  139c18:	b8 00 00 00 00       	mov    eax,0x0
  139c1d:	5d                   	pop    rbp
  139c1e:	c3                   	ret    

0000000000139c1f <sys_insmod>:
  139c1f:	f3 0f 1e fa          	endbr64 
  139c23:	55                   	push   rbp
  139c24:	48 89 e5             	mov    rbp,rsp
  139c27:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  139c2b:	90                   	nop
  139c2c:	5d                   	pop    rbp
  139c2d:	c3                   	ret    

0000000000139c2e <sys_rmmod>:
  139c2e:	f3 0f 1e fa          	endbr64 
  139c32:	55                   	push   rbp
  139c33:	48 89 e5             	mov    rbp,rsp
  139c36:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  139c3a:	90                   	nop
  139c3b:	5d                   	pop    rbp
  139c3c:	c3                   	ret    
  139c3d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000139c40 <_syscall>:
  139c40:	57                   	push   rdi
  139c41:	56                   	push   rsi
  139c42:	52                   	push   rdx
  139c43:	51                   	push   rcx
  139c44:	53                   	push   rbx
  139c45:	50                   	push   rax
  139c46:	e8 64 ac ff ff       	call   1348af <syscall+0x4>
  139c4b:	83 c4 18             	add    esp,0x18
  139c4e:	cf                   	iret   

0000000000139c4f <shift>:
  139c4f:	f3 0f 1e fa          	endbr64 
  139c53:	55                   	push   rbp
  139c54:	48 89 e5             	mov    rbp,rsp
  139c57:	0f b6 05 ef ee fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffeeeef]        # 128b4d <k_shift>
  139c5e:	84 c0                	test   al,al
  139c60:	0f 94 c0             	sete   al
  139c63:	88 05 e4 ee fe ff    	mov    BYTE PTR [rip+0xfffffffffffeeee4],al        # 128b4d <k_shift>
  139c69:	90                   	nop
  139c6a:	5d                   	pop    rbp
  139c6b:	c3                   	ret    

0000000000139c6c <ctrl>:
  139c6c:	f3 0f 1e fa          	endbr64 
  139c70:	55                   	push   rbp
  139c71:	48 89 e5             	mov    rbp,rsp
  139c74:	0f b6 05 d3 ee fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffeeed3]        # 128b4e <k_ctrl>
  139c7b:	84 c0                	test   al,al
  139c7d:	0f 94 c0             	sete   al
  139c80:	88 05 c8 ee fe ff    	mov    BYTE PTR [rip+0xfffffffffffeeec8],al        # 128b4e <k_ctrl>
  139c86:	90                   	nop
  139c87:	5d                   	pop    rbp
  139c88:	c3                   	ret    

0000000000139c89 <capslock>:
  139c89:	f3 0f 1e fa          	endbr64 
  139c8d:	55                   	push   rbp
  139c8e:	48 89 e5             	mov    rbp,rsp
  139c91:	0f b6 05 b7 ee fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffeeeb7]        # 128b4f <k_capslock>
  139c98:	84 c0                	test   al,al
  139c9a:	0f 94 c0             	sete   al
  139c9d:	88 05 ac ee fe ff    	mov    BYTE PTR [rip+0xfffffffffffeeeac],al        # 128b4f <k_capslock>
  139ca3:	90                   	nop
  139ca4:	5d                   	pop    rbp
  139ca5:	c3                   	ret    

0000000000139ca6 <to_ascii>:
  139ca6:	f3 0f 1e fa          	endbr64 
  139caa:	55                   	push   rbp
  139cab:	48 89 e5             	mov    rbp,rsp
  139cae:	89 f8                	mov    eax,edi
  139cb0:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
  139cb3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  139cba:	e9 c7 00 00 00       	jmp    139d86 <to_ascii+0xe0>
  139cbf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  139cc2:	48 63 d0             	movsxd rdx,eax
  139cc5:	48 89 d0             	mov    rax,rdx
  139cc8:	48 c1 e0 02          	shl    rax,0x2
  139ccc:	48 01 d0             	add    rax,rdx
  139ccf:	48 05 e2 e5 13 00    	add    rax,0x13e5e2
  139cd5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  139cd8:	38 45 ec             	cmp    BYTE PTR [rbp-0x14],al
  139cdb:	0f 85 a1 00 00 00    	jne    139d82 <to_ascii+0xdc>
  139ce1:	0f b6 05 67 ee fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffeee67]        # 128b4f <k_capslock>
  139ce8:	84 c0                	test   al,al
  139cea:	74 55                	je     139d41 <to_ascii+0x9b>
  139cec:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  139cef:	48 63 d0             	movsxd rdx,eax
  139cf2:	48 89 d0             	mov    rax,rdx
  139cf5:	48 c1 e0 02          	shl    rax,0x2
  139cf9:	48 01 d0             	add    rax,rdx
  139cfc:	48 05 e0 e5 13 00    	add    rax,0x13e5e0
  139d02:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  139d05:	3c 60                	cmp    al,0x60
  139d07:	7e 38                	jle    139d41 <to_ascii+0x9b>
  139d09:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  139d0c:	48 63 d0             	movsxd rdx,eax
  139d0f:	48 89 d0             	mov    rax,rdx
  139d12:	48 c1 e0 02          	shl    rax,0x2
  139d16:	48 01 d0             	add    rax,rdx
  139d19:	48 05 e0 e5 13 00    	add    rax,0x13e5e0
  139d1f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  139d22:	3c 7a                	cmp    al,0x7a
  139d24:	7f 1b                	jg     139d41 <to_ascii+0x9b>
  139d26:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  139d29:	48 63 d0             	movsxd rdx,eax
  139d2c:	48 89 d0             	mov    rax,rdx
  139d2f:	48 c1 e0 02          	shl    rax,0x2
  139d33:	48 01 d0             	add    rax,rdx
  139d36:	48 05 e1 e5 13 00    	add    rax,0x13e5e1
  139d3c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  139d3f:	eb 54                	jmp    139d95 <to_ascii+0xef>
  139d41:	0f b6 05 05 ee fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffeee05]        # 128b4d <k_shift>
  139d48:	84 c0                	test   al,al
  139d4a:	74 1b                	je     139d67 <to_ascii+0xc1>
  139d4c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  139d4f:	48 63 d0             	movsxd rdx,eax
  139d52:	48 89 d0             	mov    rax,rdx
  139d55:	48 c1 e0 02          	shl    rax,0x2
  139d59:	48 01 d0             	add    rax,rdx
  139d5c:	48 05 e1 e5 13 00    	add    rax,0x13e5e1
  139d62:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  139d65:	eb 2e                	jmp    139d95 <to_ascii+0xef>
  139d67:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  139d6a:	48 63 d0             	movsxd rdx,eax
  139d6d:	48 89 d0             	mov    rax,rdx
  139d70:	48 c1 e0 02          	shl    rax,0x2
  139d74:	48 01 d0             	add    rax,rdx
  139d77:	48 05 e0 e5 13 00    	add    rax,0x13e5e0
  139d7d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  139d80:	eb 13                	jmp    139d95 <to_ascii+0xef>
  139d82:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  139d86:	83 7d fc 5d          	cmp    DWORD PTR [rbp-0x4],0x5d
  139d8a:	0f 8e 2f ff ff ff    	jle    139cbf <to_ascii+0x19>
  139d90:	b8 00 00 00 00       	mov    eax,0x0
  139d95:	5d                   	pop    rbp
  139d96:	c3                   	ret    

0000000000139d97 <init_kb>:
  139d97:	f3 0f 1e fa          	endbr64 
  139d9b:	55                   	push   rbp
  139d9c:	48 89 e5             	mov    rbp,rsp
  139d9f:	bf 20 e5 13 00       	mov    edi,0x13e520
  139da4:	e8 97 d1 ff ff       	call   136f40 <reg_device>
  139da9:	bf 80 e4 13 00       	mov    edi,0x13e480
  139dae:	e8 75 d4 ff ff       	call   137228 <reg_driver>
  139db3:	90                   	nop
  139db4:	5d                   	pop    rbp
  139db5:	c3                   	ret    

0000000000139db6 <key_proc>:
  139db6:	f3 0f 1e fa          	endbr64 
  139dba:	55                   	push   rbp
  139dbb:	48 89 e5             	mov    rbp,rsp
  139dbe:	48 83 ec 10          	sub    rsp,0x10
  139dc2:	c6 45 fd 00          	mov    BYTE PTR [rbp-0x3],0x0
  139dc6:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
  139dca:	c6 45 fe 00          	mov    BYTE PTR [rbp-0x2],0x0
  139dce:	bf 60 00 00 00       	mov    edi,0x60
  139dd3:	e8 88 f1 ff ff       	call   138f60 <inb>
  139dd8:	88 45 fd             	mov    BYTE PTR [rbp-0x3],al
  139ddb:	0f b6 45 fd          	movzx  eax,BYTE PTR [rbp-0x3]
  139ddf:	0f be c0             	movsx  eax,al
  139de2:	89 c7                	mov    edi,eax
  139de4:	e8 bd fe ff ff       	call   139ca6 <to_ascii>
  139de9:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
  139dec:	80 7d fd e0          	cmp    BYTE PTR [rbp-0x3],0xe0
  139df0:	74 06                	je     139df8 <key_proc+0x42>
  139df2:	80 7d fd e1          	cmp    BYTE PTR [rbp-0x3],0xe1
  139df6:	75 1e                	jne    139e16 <key_proc+0x60>
  139df8:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  139dfc:	0f be c0             	movsx  eax,al
  139dff:	89 c7                	mov    edi,eax
  139e01:	e8 a0 fe ff ff       	call   139ca6 <to_ascii>
  139e06:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
  139e09:	bf 60 00 00 00       	mov    edi,0x60
  139e0e:	e8 4d f1 ff ff       	call   138f60 <inb>
  139e13:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
  139e16:	0f b6 45 fd          	movzx  eax,BYTE PTR [rbp-0x3]
  139e1a:	88 45 fa             	mov    BYTE PTR [rbp-0x6],al
  139e1d:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  139e21:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
  139e24:	0f b6 45 fe          	movzx  eax,BYTE PTR [rbp-0x2]
  139e28:	88 45 f8             	mov    BYTE PTR [rbp-0x8],al
  139e2b:	8b 15 6b 3e 00 00    	mov    edx,DWORD PTR [rip+0x3e6b]        # 13dc9c <key_bufq+0xc>
  139e31:	8b 05 61 3e 00 00    	mov    eax,DWORD PTR [rip+0x3e61]        # 13dc98 <key_bufq+0x8>
  139e37:	39 c2                	cmp    edx,eax
  139e39:	74 43                	je     139e7e <key_proc+0xc8>
  139e3b:	48 8b 0d 4e 3e 00 00 	mov    rcx,QWORD PTR [rip+0x3e4e]        # 13dc90 <key_bufq>
  139e42:	8b 05 54 3e 00 00    	mov    eax,DWORD PTR [rip+0x3e54]        # 13dc9c <key_bufq+0xc>
  139e48:	48 63 d0             	movsxd rdx,eax
  139e4b:	48 89 d0             	mov    rax,rdx
  139e4e:	48 c1 e0 02          	shl    rax,0x2
  139e52:	48 01 d0             	add    rax,rdx
  139e55:	48 01 c8             	add    rax,rcx
  139e58:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  139e5b:	89 10                	mov    DWORD PTR [rax],edx
  139e5d:	0f b6 55 fc          	movzx  edx,BYTE PTR [rbp-0x4]
  139e61:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
  139e64:	8b 05 32 3e 00 00    	mov    eax,DWORD PTR [rip+0x3e32]        # 13dc9c <key_bufq+0xc>
  139e6a:	83 c0 01             	add    eax,0x1
  139e6d:	8b 0d 2d 3e 00 00    	mov    ecx,DWORD PTR [rip+0x3e2d]        # 13dca0 <key_bufq+0x10>
  139e73:	99                   	cdq    
  139e74:	f7 f9                	idiv   ecx
  139e76:	89 d0                	mov    eax,edx
  139e78:	89 05 1e 3e 00 00    	mov    DWORD PTR [rip+0x3e1e],eax        # 13dc9c <key_bufq+0xc>
  139e7e:	b8 00 00 00 00       	mov    eax,0x0
  139e83:	e8 f1 f0 ff ff       	call   138f79 <eoi>
  139e88:	c9                   	leave  
  139e89:	cf                   	iret   
  139e8a:	90                   	nop
  139e8b:	c9                   	leave  
  139e8c:	c3                   	ret    

0000000000139e8d <sys_getkbc>:
  139e8d:	f3 0f 1e fa          	endbr64 
  139e91:	55                   	push   rbp
  139e92:	48 89 e5             	mov    rbp,rsp
  139e95:	8b 15 01 3e 00 00    	mov    edx,DWORD PTR [rip+0x3e01]        # 13dc9c <key_bufq+0xc>
  139e9b:	8b 05 f7 3d 00 00    	mov    eax,DWORD PTR [rip+0x3df7]        # 13dc98 <key_bufq+0x8>
  139ea1:	39 c2                	cmp    edx,eax
  139ea3:	75 07                	jne    139eac <sys_getkbc+0x1f>
  139ea5:	b8 ff ff ff ff       	mov    eax,0xffffffff
  139eaa:	eb 43                	jmp    139eef <sys_getkbc+0x62>
  139eac:	8b 05 ea 3d 00 00    	mov    eax,DWORD PTR [rip+0x3dea]        # 13dc9c <key_bufq+0xc>
  139eb2:	48 63 d0             	movsxd rdx,eax
  139eb5:	48 89 d0             	mov    rax,rdx
  139eb8:	48 c1 e0 02          	shl    rax,0x2
  139ebc:	48 01 d0             	add    rax,rdx
  139ebf:	48 05 40 81 12 00    	add    rax,0x128140
  139ec5:	8b 10                	mov    edx,DWORD PTR [rax]
  139ec7:	89 55 fb             	mov    DWORD PTR [rbp-0x5],edx
  139eca:	0f b6 40 04          	movzx  eax,BYTE PTR [rax+0x4]
  139ece:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
  139ed1:	8b 05 c5 3d 00 00    	mov    eax,DWORD PTR [rip+0x3dc5]        # 13dc9c <key_bufq+0xc>
  139ed7:	83 c0 01             	add    eax,0x1
  139eda:	8b 0d c0 3d 00 00    	mov    ecx,DWORD PTR [rip+0x3dc0]        # 13dca0 <key_bufq+0x10>
  139ee0:	99                   	cdq    
  139ee1:	f7 f9                	idiv   ecx
  139ee3:	89 d0                	mov    eax,edx
  139ee5:	89 05 b1 3d 00 00    	mov    DWORD PTR [rip+0x3db1],eax        # 13dc9c <key_bufq+0xc>
  139eeb:	0f b6 45 fb          	movzx  eax,BYTE PTR [rbp-0x5]
  139eef:	5d                   	pop    rbp
  139ef0:	c3                   	ret    

0000000000139ef1 <init_disk>:
  139ef1:	f3 0f 1e fa          	endbr64 
  139ef5:	55                   	push   rbp
  139ef6:	48 89 e5             	mov    rbp,rsp
  139ef9:	b8 00 00 00 00       	mov    eax,0x0
  139efe:	e8 8d 09 00 00       	call   13a890 <hd_iterate>
  139f03:	b8 00 00 00 00       	mov    eax,0x0
  139f08:	5d                   	pop    rbp
  139f09:	c3                   	ret    

0000000000139f0a <disk_int_handler_c>:
  139f0a:	f3 0f 1e fa          	endbr64 
  139f0e:	55                   	push   rbp
  139f0f:	48 89 e5             	mov    rbp,rsp
  139f12:	48 83 ec 20          	sub    rsp,0x20
  139f16:	48 8b 05 43 19 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1943]        # 12b860 <running_req>
  139f1d:	48 85 c0             	test   rax,rax
  139f20:	75 0a                	jne    139f2c <disk_int_handler_c+0x22>
  139f22:	b8 01 00 00 00       	mov    eax,0x1
  139f27:	e9 a3 01 00 00       	jmp    13a0cf <disk_int_handler_c+0x1c5>
  139f2c:	48 8b 05 2d 19 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff192d]        # 12b860 <running_req>
  139f33:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  139f37:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  139f3b:	c7 45 f4 f0 01 00 00 	mov    DWORD PTR [rbp-0xc],0x1f0
  139f42:	48 8b 05 17 19 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1917]        # 12b860 <running_req>
  139f49:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  139f4c:	83 f8 02             	cmp    eax,0x2
  139f4f:	74 0f                	je     139f60 <disk_int_handler_c+0x56>
  139f51:	48 8b 05 08 19 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1908]        # 12b860 <running_req>
  139f58:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  139f5b:	83 f8 03             	cmp    eax,0x3
  139f5e:	75 07                	jne    139f67 <disk_int_handler_c+0x5d>
  139f60:	c7 45 f4 70 01 00 00 	mov    DWORD PTR [rbp-0xc],0x170
  139f67:	48 8b 05 f2 18 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff18f2]        # 12b860 <running_req>
  139f6e:	8b 00                	mov    eax,DWORD PTR [rax]
  139f70:	85 c0                	test   eax,eax
  139f72:	75 42                	jne    139fb6 <disk_int_handler_c+0xac>
  139f74:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  139f7b:	eb 22                	jmp    139f9f <disk_int_handler_c+0x95>
  139f7d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  139f80:	0f b7 c0             	movzx  eax,ax
  139f83:	89 c7                	mov    edi,eax
  139f85:	e8 e2 ef ff ff       	call   138f6c <inw>
  139f8a:	89 c2                	mov    edx,eax
  139f8c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  139f90:	48 8d 48 02          	lea    rcx,[rax+0x2]
  139f94:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  139f98:	66 89 10             	mov    WORD PTR [rax],dx
  139f9b:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  139f9f:	48 8b 05 ba 18 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff18ba]        # 12b860 <running_req>
  139fa6:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  139fa9:	c1 e0 08             	shl    eax,0x8
  139fac:	39 45 f0             	cmp    DWORD PTR [rbp-0x10],eax
  139faf:	7c cc                	jl     139f7d <disk_int_handler_c+0x73>
  139fb1:	e9 ca 00 00 00       	jmp    13a080 <disk_int_handler_c+0x176>
  139fb6:	48 8b 05 a3 18 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff18a3]        # 12b860 <running_req>
  139fbd:	8b 00                	mov    eax,DWORD PTR [rax]
  139fbf:	83 f8 01             	cmp    eax,0x1
  139fc2:	75 42                	jne    13a006 <disk_int_handler_c+0xfc>
  139fc4:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  139fcb:	eb 25                	jmp    139ff2 <disk_int_handler_c+0xe8>
  139fcd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  139fd1:	48 8d 50 02          	lea    rdx,[rax+0x2]
  139fd5:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  139fd9:	0f b7 00             	movzx  eax,WORD PTR [rax]
  139fdc:	0f b7 d0             	movzx  edx,ax
  139fdf:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  139fe2:	0f b7 c0             	movzx  eax,ax
  139fe5:	89 d6                	mov    esi,edx
  139fe7:	89 c7                	mov    edi,eax
  139fe9:	e8 62 ef ff ff       	call   138f50 <outw>
  139fee:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  139ff2:	48 8b 05 67 18 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1867]        # 12b860 <running_req>
  139ff9:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  139ffc:	c1 e0 08             	shl    eax,0x8
  139fff:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  13a002:	7c c9                	jl     139fcd <disk_int_handler_c+0xc3>
  13a004:	eb 7a                	jmp    13a080 <disk_int_handler_c+0x176>
  13a006:	48 8b 05 53 18 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1853]        # 12b860 <running_req>
  13a00d:	8b 00                	mov    eax,DWORD PTR [rax]
  13a00f:	83 f8 02             	cmp    eax,0x2
  13a012:	75 34                	jne    13a048 <disk_int_handler_c+0x13e>
  13a014:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  13a017:	83 c0 07             	add    eax,0x7
  13a01a:	0f b6 c0             	movzx  eax,al
  13a01d:	89 c7                	mov    edi,eax
  13a01f:	e8 3c ef ff ff       	call   138f60 <inb>
  13a024:	88 45 e7             	mov    BYTE PTR [rbp-0x19],al
  13a027:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  13a02a:	0f b7 c0             	movzx  eax,ax
  13a02d:	89 c7                	mov    edi,eax
  13a02f:	e8 38 ef ff ff       	call   138f6c <inw>
  13a034:	66 89 45 e4          	mov    WORD PTR [rbp-0x1c],ax
  13a038:	48 8b 05 21 18 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1821]        # 12b860 <running_req>
  13a03f:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  13a046:	eb 38                	jmp    13a080 <disk_int_handler_c+0x176>
  13a048:	48 8b 05 11 18 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1811]        # 12b860 <running_req>
  13a04f:	8b 00                	mov    eax,DWORD PTR [rax]
  13a051:	83 f8 03             	cmp    eax,0x3
  13a054:	75 2a                	jne    13a080 <disk_int_handler_c+0x176>
  13a056:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  13a059:	83 c0 07             	add    eax,0x7
  13a05c:	0f b6 c0             	movzx  eax,al
  13a05f:	89 c7                	mov    edi,eax
  13a061:	e8 fa ee ff ff       	call   138f60 <inb>
  13a066:	0f b6 c0             	movzx  eax,al
  13a069:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  13a06c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  13a06f:	89 c6                	mov    esi,eax
  13a071:	bf b6 e7 13 00       	mov    edi,0x13e7b6
  13a076:	b8 00 00 00 00       	mov    eax,0x0
  13a07b:	e8 e0 b2 ff ff       	call   135360 <printf>
  13a080:	48 8b 05 d9 17 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff17d9]        # 12b860 <running_req>
  13a087:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
  13a08e:	48 8b 05 cb 17 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff17cb]        # 12b860 <running_req>
  13a095:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  13a099:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  13a0a0:	00 00 00 
  13a0a3:	48 8b 05 be 17 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff17be]        # 12b868 <running_devman_req>
  13a0aa:	c7 80 ac 00 00 00 03 	mov    DWORD PTR [rax+0xac],0x3
  13a0b1:	00 00 00 
  13a0b4:	48 c7 05 a9 17 ff ff 	mov    QWORD PTR [rip+0xffffffffffff17a9],0x0        # 12b868 <running_devman_req>
  13a0bb:	00 00 00 00 
  13a0bf:	48 c7 05 96 17 ff ff 	mov    QWORD PTR [rip+0xffffffffffff1796],0x0        # 12b860 <running_req>
  13a0c6:	00 00 00 00 
  13a0ca:	b8 00 00 00 00       	mov    eax,0x0
  13a0cf:	c9                   	leave  
  13a0d0:	c3                   	ret    

000000000013a0d1 <check_dreq_stat>:
  13a0d1:	f3 0f 1e fa          	endbr64 
  13a0d5:	55                   	push   rbp
  13a0d6:	48 89 e5             	mov    rbp,rsp
  13a0d9:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  13a0dc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13a0df:	48 63 d0             	movsxd rdx,eax
  13a0e2:	48 89 d0             	mov    rax,rdx
  13a0e5:	48 01 c0             	add    rax,rax
  13a0e8:	48 01 d0             	add    rax,rdx
  13a0eb:	48 c1 e0 04          	shl    rax,0x4
  13a0ef:	48 05 7c 8b 12 00    	add    rax,0x128b7c
  13a0f5:	8b 00                	mov    eax,DWORD PTR [rax]
  13a0f7:	5d                   	pop    rbp
  13a0f8:	c3                   	ret    

000000000013a0f9 <request>:
  13a0f9:	f3 0f 1e fa          	endbr64 
  13a0fd:	55                   	push   rbp
  13a0fe:	48 89 e5             	mov    rbp,rsp
  13a101:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  13a104:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  13a107:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  13a10a:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  13a10d:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
  13a111:	8b 05 7d 17 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff177d]        # 12b894 <tail>
  13a117:	83 c0 01             	add    eax,0x1
  13a11a:	48 63 d0             	movsxd rdx,eax
  13a11d:	48 69 d2 89 88 88 88 	imul   rdx,rdx,0xffffffff88888889
  13a124:	48 c1 ea 20          	shr    rdx,0x20
  13a128:	01 c2                	add    edx,eax
  13a12a:	c1 fa 07             	sar    edx,0x7
  13a12d:	89 c1                	mov    ecx,eax
  13a12f:	c1 f9 1f             	sar    ecx,0x1f
  13a132:	29 ca                	sub    edx,ecx
  13a134:	69 ca f0 00 00 00    	imul   ecx,edx,0xf0
  13a13a:	29 c8                	sub    eax,ecx
  13a13c:	89 c2                	mov    edx,eax
  13a13e:	8b 05 4c 17 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff174c]        # 12b890 <head>
  13a144:	39 c2                	cmp    edx,eax
  13a146:	75 0a                	jne    13a152 <request+0x59>
  13a148:	b8 ff ff ff ff       	mov    eax,0xffffffff
  13a14d:	e9 0d 01 00 00       	jmp    13a25f <request+0x166>
  13a152:	8b 05 3c 17 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff173c]        # 12b894 <tail>
  13a158:	48 63 d0             	movsxd rdx,eax
  13a15b:	48 89 d0             	mov    rax,rdx
  13a15e:	48 01 c0             	add    rax,rax
  13a161:	48 01 d0             	add    rax,rdx
  13a164:	48 c1 e0 04          	shl    rax,0x4
  13a168:	48 8d 90 64 8b 12 00 	lea    rdx,[rax+0x128b64]
  13a16f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  13a172:	89 02                	mov    DWORD PTR [rdx],eax
  13a174:	8b 05 1a 17 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff171a]        # 12b894 <tail>
  13a17a:	48 63 d0             	movsxd rdx,eax
  13a17d:	48 89 d0             	mov    rax,rdx
  13a180:	48 01 c0             	add    rax,rax
  13a183:	48 01 d0             	add    rax,rdx
  13a186:	48 c1 e0 04          	shl    rax,0x4
  13a18a:	48 8d 90 60 8b 12 00 	lea    rdx,[rax+0x128b60]
  13a191:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  13a194:	89 02                	mov    DWORD PTR [rdx],eax
  13a196:	8b 05 f8 16 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff16f8]        # 12b894 <tail>
  13a19c:	48 63 d0             	movsxd rdx,eax
  13a19f:	48 89 d0             	mov    rax,rdx
  13a1a2:	48 01 c0             	add    rax,rax
  13a1a5:	48 01 d0             	add    rax,rdx
  13a1a8:	48 c1 e0 04          	shl    rax,0x4
  13a1ac:	48 8d 90 68 8b 12 00 	lea    rdx,[rax+0x128b68]
  13a1b3:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  13a1b6:	89 02                	mov    DWORD PTR [rdx],eax
  13a1b8:	8b 05 d6 16 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff16d6]        # 12b894 <tail>
  13a1be:	48 63 d0             	movsxd rdx,eax
  13a1c1:	48 89 d0             	mov    rax,rdx
  13a1c4:	48 01 c0             	add    rax,rax
  13a1c7:	48 01 d0             	add    rax,rdx
  13a1ca:	48 c1 e0 04          	shl    rax,0x4
  13a1ce:	48 8d 90 6c 8b 12 00 	lea    rdx,[rax+0x128b6c]
  13a1d5:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  13a1d8:	89 02                	mov    DWORD PTR [rdx],eax
  13a1da:	8b 05 b4 16 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff16b4]        # 12b894 <tail>
  13a1e0:	48 63 d0             	movsxd rdx,eax
  13a1e3:	48 89 d0             	mov    rax,rdx
  13a1e6:	48 01 c0             	add    rax,rax
  13a1e9:	48 01 d0             	add    rax,rdx
  13a1ec:	48 c1 e0 04          	shl    rax,0x4
  13a1f0:	48 05 7c 8b 12 00    	add    rax,0x128b7c
  13a1f6:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
  13a1fc:	8b 05 92 16 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff1692]        # 12b894 <tail>
  13a202:	48 63 d0             	movsxd rdx,eax
  13a205:	48 89 d0             	mov    rax,rdx
  13a208:	48 01 c0             	add    rax,rax
  13a20b:	48 01 d0             	add    rax,rdx
  13a20e:	48 c1 e0 04          	shl    rax,0x4
  13a212:	48 8d 90 70 8b 12 00 	lea    rdx,[rax+0x128b70]
  13a219:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  13a21d:	48 89 02             	mov    QWORD PTR [rdx],rax
  13a220:	8b 05 6e 16 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff166e]        # 12b894 <tail>
  13a226:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  13a229:	8b 05 65 16 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff1665]        # 12b894 <tail>
  13a22f:	8d 50 01             	lea    edx,[rax+0x1]
  13a232:	48 63 c2             	movsxd rax,edx
  13a235:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  13a23c:	48 c1 e8 20          	shr    rax,0x20
  13a240:	01 d0                	add    eax,edx
  13a242:	c1 f8 07             	sar    eax,0x7
  13a245:	89 d1                	mov    ecx,edx
  13a247:	c1 f9 1f             	sar    ecx,0x1f
  13a24a:	29 c8                	sub    eax,ecx
  13a24c:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  13a252:	89 d0                	mov    eax,edx
  13a254:	29 c8                	sub    eax,ecx
  13a256:	89 05 38 16 ff ff    	mov    DWORD PTR [rip+0xffffffffffff1638],eax        # 12b894 <tail>
  13a25c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13a25f:	5d                   	pop    rbp
  13a260:	c3                   	ret    

000000000013a261 <execute_request>:
  13a261:	f3 0f 1e fa          	endbr64 
  13a265:	55                   	push   rbp
  13a266:	48 89 e5             	mov    rbp,rsp
  13a269:	48 83 ec 10          	sub    rsp,0x10
  13a26d:	48 8b 05 ec 15 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff15ec]        # 12b860 <running_req>
  13a274:	48 85 c0             	test   rax,rax
  13a277:	74 6a                	je     13a2e3 <execute_request+0x82>
  13a279:	48 8b 05 e0 15 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff15e0]        # 12b860 <running_req>
  13a280:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  13a283:	83 c2 01             	add    edx,0x1
  13a286:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
  13a289:	48 8b 05 d0 15 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff15d0]        # 12b860 <running_req>
  13a290:	8b 00                	mov    eax,DWORD PTR [rax]
  13a292:	83 f8 02             	cmp    eax,0x2
  13a295:	74 0a                	je     13a2a1 <execute_request+0x40>
  13a297:	b8 02 00 00 00       	mov    eax,0x2
  13a29c:	e9 b4 01 00 00       	jmp    13a455 <execute_request+0x1f4>
  13a2a1:	48 8b 05 b8 15 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff15b8]        # 12b860 <running_req>
  13a2a8:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  13a2ab:	83 f8 0a             	cmp    eax,0xa
  13a2ae:	7e 29                	jle    13a2d9 <execute_request+0x78>
  13a2b0:	48 8b 05 a9 15 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff15a9]        # 12b860 <running_req>
  13a2b7:	c7 40 20 02 00 00 00 	mov    DWORD PTR [rax+0x20],0x2
  13a2be:	48 8b 05 9b 15 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff159b]        # 12b860 <running_req>
  13a2c5:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
  13a2cc:	48 c7 05 89 15 ff ff 	mov    QWORD PTR [rip+0xffffffffffff1589],0x0        # 12b860 <running_req>
  13a2d3:	00 00 00 00 
  13a2d7:	eb 0a                	jmp    13a2e3 <execute_request+0x82>
  13a2d9:	b8 02 00 00 00       	mov    eax,0x2
  13a2de:	e9 72 01 00 00       	jmp    13a455 <execute_request+0x1f4>
  13a2e3:	8b 15 a7 15 ff ff    	mov    edx,DWORD PTR [rip+0xffffffffffff15a7]        # 12b890 <head>
  13a2e9:	8b 05 a5 15 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff15a5]        # 12b894 <tail>
  13a2ef:	39 c2                	cmp    edx,eax
  13a2f1:	75 0a                	jne    13a2fd <execute_request+0x9c>
  13a2f3:	b8 01 00 00 00       	mov    eax,0x1
  13a2f8:	e9 58 01 00 00       	jmp    13a455 <execute_request+0x1f4>
  13a2fd:	8b 05 8d 15 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff158d]        # 12b890 <head>
  13a303:	48 63 d0             	movsxd rdx,eax
  13a306:	48 89 d0             	mov    rax,rdx
  13a309:	48 01 c0             	add    rax,rax
  13a30c:	48 01 d0             	add    rax,rdx
  13a30f:	48 c1 e0 04          	shl    rax,0x4
  13a313:	48 05 60 8b 12 00    	add    rax,0x128b60
  13a319:	48 89 05 40 15 ff ff 	mov    QWORD PTR [rip+0xffffffffffff1540],rax        # 12b860 <running_req>
  13a320:	8b 05 6a 15 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff156a]        # 12b890 <head>
  13a326:	8d 50 01             	lea    edx,[rax+0x1]
  13a329:	48 63 c2             	movsxd rax,edx
  13a32c:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  13a333:	48 c1 e8 20          	shr    rax,0x20
  13a337:	01 d0                	add    eax,edx
  13a339:	c1 f8 07             	sar    eax,0x7
  13a33c:	89 d1                	mov    ecx,edx
  13a33e:	c1 f9 1f             	sar    ecx,0x1f
  13a341:	29 c8                	sub    eax,ecx
  13a343:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  13a349:	89 d0                	mov    eax,edx
  13a34b:	29 c8                	sub    eax,ecx
  13a34d:	89 05 3d 15 ff ff    	mov    DWORD PTR [rip+0xffffffffffff153d],eax        # 12b890 <head>
  13a353:	48 8b 05 06 15 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1506]        # 12b860 <running_req>
  13a35a:	c7 40 1c 02 00 00 00 	mov    DWORD PTR [rax+0x1c],0x2
  13a361:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  13a368:	48 8b 05 f1 14 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff14f1]        # 12b860 <running_req>
  13a36f:	8b 00                	mov    eax,DWORD PTR [rax]
  13a371:	83 f8 03             	cmp    eax,0x3
  13a374:	0f 84 ad 00 00 00    	je     13a427 <execute_request+0x1c6>
  13a37a:	83 f8 03             	cmp    eax,0x3
  13a37d:	0f 8f bf 00 00 00    	jg     13a442 <execute_request+0x1e1>
  13a383:	83 f8 02             	cmp    eax,0x2
  13a386:	0f 84 85 00 00 00    	je     13a411 <execute_request+0x1b0>
  13a38c:	83 f8 02             	cmp    eax,0x2
  13a38f:	0f 8f ad 00 00 00    	jg     13a442 <execute_request+0x1e1>
  13a395:	85 c0                	test   eax,eax
  13a397:	74 0a                	je     13a3a3 <execute_request+0x142>
  13a399:	83 f8 01             	cmp    eax,0x1
  13a39c:	74 3c                	je     13a3da <execute_request+0x179>
  13a39e:	e9 9f 00 00 00       	jmp    13a442 <execute_request+0x1e1>
  13a3a3:	48 8b 05 b6 14 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff14b6]        # 12b860 <running_req>
  13a3aa:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  13a3ae:	48 8b 05 ab 14 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff14ab]        # 12b860 <running_req>
  13a3b5:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  13a3b8:	48 8b 05 a1 14 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff14a1]        # 12b860 <running_req>
  13a3bf:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  13a3c2:	89 c6                	mov    esi,eax
  13a3c4:	48 8b 05 95 14 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1495]        # 12b860 <running_req>
  13a3cb:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  13a3ce:	89 c7                	mov    edi,eax
  13a3d0:	e8 a7 00 00 00       	call   13a47c <async_read_disk>
  13a3d5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  13a3d8:	eb 69                	jmp    13a443 <execute_request+0x1e2>
  13a3da:	48 8b 05 7f 14 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff147f]        # 12b860 <running_req>
  13a3e1:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  13a3e5:	48 8b 05 74 14 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1474]        # 12b860 <running_req>
  13a3ec:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  13a3ef:	48 8b 05 6a 14 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff146a]        # 12b860 <running_req>
  13a3f6:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  13a3f9:	89 c6                	mov    esi,eax
  13a3fb:	48 8b 05 5e 14 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff145e]        # 12b860 <running_req>
  13a402:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  13a405:	89 c7                	mov    edi,eax
  13a407:	e8 88 01 00 00       	call   13a594 <async_write_disk>
  13a40c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  13a40f:	eb 32                	jmp    13a443 <execute_request+0x1e2>
  13a411:	48 8b 05 48 14 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1448]        # 12b860 <running_req>
  13a418:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  13a41b:	89 c7                	mov    edi,eax
  13a41d:	e8 77 06 00 00       	call   13aa99 <async_check_disk>
  13a422:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  13a425:	eb 1c                	jmp    13a443 <execute_request+0x1e2>
  13a427:	48 8b 05 32 14 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1432]        # 12b860 <running_req>
  13a42e:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  13a431:	89 c7                	mov    edi,eax
  13a433:	b8 00 00 00 00       	mov    eax,0x0
  13a438:	e8 1a 00 00 00       	call   13a457 <async_reset_disk>
  13a43d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  13a440:	eb 01                	jmp    13a443 <execute_request+0x1e2>
  13a442:	90                   	nop
  13a443:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  13a447:	75 07                	jne    13a450 <execute_request+0x1ef>
  13a449:	b8 ff ff ff ff       	mov    eax,0xffffffff
  13a44e:	eb 05                	jmp    13a455 <execute_request+0x1f4>
  13a450:	b8 00 00 00 00       	mov    eax,0x0
  13a455:	c9                   	leave  
  13a456:	c3                   	ret    

000000000013a457 <async_reset_disk>:
  13a457:	f3 0f 1e fa          	endbr64 
  13a45b:	55                   	push   rbp
  13a45c:	48 89 e5             	mov    rbp,rsp
  13a45f:	48 83 ec 10          	sub    rsp,0x10
  13a463:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  13a466:	be 0c 00 00 00       	mov    esi,0xc
  13a46b:	bf f6 03 00 00       	mov    edi,0x3f6
  13a470:	e8 cb ea ff ff       	call   138f40 <outb>
  13a475:	b8 00 00 00 00       	mov    eax,0x0
  13a47a:	c9                   	leave  
  13a47b:	c3                   	ret    

000000000013a47c <async_read_disk>:
  13a47c:	f3 0f 1e fa          	endbr64 
  13a480:	55                   	push   rbp
  13a481:	48 89 e5             	mov    rbp,rsp
  13a484:	48 83 ec 30          	sub    rsp,0x30
  13a488:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  13a48b:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  13a48e:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  13a491:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
  13a495:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
  13a49b:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  13a4a2:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  13a4a6:	74 06                	je     13a4ae <async_read_disk+0x32>
  13a4a8:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  13a4ac:	75 06                	jne    13a4b4 <async_read_disk+0x38>
  13a4ae:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
  13a4b4:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  13a4b8:	74 06                	je     13a4c0 <async_read_disk+0x44>
  13a4ba:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  13a4be:	75 07                	jne    13a4c7 <async_read_disk+0x4b>
  13a4c0:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
  13a4c7:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  13a4ca:	0f b6 d0             	movzx  edx,al
  13a4cd:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  13a4d1:	83 c0 02             	add    eax,0x2
  13a4d4:	0f b7 c0             	movzx  eax,ax
  13a4d7:	89 d6                	mov    esi,edx
  13a4d9:	89 c7                	mov    edi,eax
  13a4db:	e8 60 ea ff ff       	call   138f40 <outb>
  13a4e0:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  13a4e3:	0f b6 d0             	movzx  edx,al
  13a4e6:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  13a4ea:	83 c0 03             	add    eax,0x3
  13a4ed:	0f b7 c0             	movzx  eax,ax
  13a4f0:	89 d6                	mov    esi,edx
  13a4f2:	89 c7                	mov    edi,eax
  13a4f4:	e8 47 ea ff ff       	call   138f40 <outb>
  13a4f9:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  13a4fc:	c1 e8 08             	shr    eax,0x8
  13a4ff:	0f b6 d0             	movzx  edx,al
  13a502:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  13a506:	83 c0 04             	add    eax,0x4
  13a509:	0f b7 c0             	movzx  eax,ax
  13a50c:	89 d6                	mov    esi,edx
  13a50e:	89 c7                	mov    edi,eax
  13a510:	e8 2b ea ff ff       	call   138f40 <outb>
  13a515:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  13a518:	c1 e8 10             	shr    eax,0x10
  13a51b:	0f b6 d0             	movzx  edx,al
  13a51e:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  13a522:	83 c0 05             	add    eax,0x5
  13a525:	0f b7 c0             	movzx  eax,ax
  13a528:	89 d6                	mov    esi,edx
  13a52a:	89 c7                	mov    edi,eax
  13a52c:	e8 0f ea ff ff       	call   138f40 <outb>
  13a531:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  13a535:	74 07                	je     13a53e <async_read_disk+0xc2>
  13a537:	b8 10 00 00 00       	mov    eax,0x10
  13a53c:	eb 05                	jmp    13a543 <async_read_disk+0xc7>
  13a53e:	b8 00 00 00 00       	mov    eax,0x0
  13a543:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
  13a546:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  13a549:	c1 e8 18             	shr    eax,0x18
  13a54c:	83 e0 0f             	and    eax,0xf
  13a54f:	89 c2                	mov    edx,eax
  13a551:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  13a555:	09 d0                	or     eax,edx
  13a557:	83 c8 e0             	or     eax,0xffffffe0
  13a55a:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
  13a55d:	0f b6 45 f6          	movzx  eax,BYTE PTR [rbp-0xa]
  13a561:	0f b6 d0             	movzx  edx,al
  13a564:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  13a568:	83 c0 06             	add    eax,0x6
  13a56b:	0f b7 c0             	movzx  eax,ax
  13a56e:	89 d6                	mov    esi,edx
  13a570:	89 c7                	mov    edi,eax
  13a572:	e8 c9 e9 ff ff       	call   138f40 <outb>
  13a577:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  13a57b:	83 c0 07             	add    eax,0x7
  13a57e:	0f b7 c0             	movzx  eax,ax
  13a581:	be 20 00 00 00       	mov    esi,0x20
  13a586:	89 c7                	mov    edi,eax
  13a588:	e8 b3 e9 ff ff       	call   138f40 <outb>
  13a58d:	b8 00 00 00 00       	mov    eax,0x0
  13a592:	c9                   	leave  
  13a593:	c3                   	ret    

000000000013a594 <async_write_disk>:
  13a594:	f3 0f 1e fa          	endbr64 
  13a598:	55                   	push   rbp
  13a599:	48 89 e5             	mov    rbp,rsp
  13a59c:	48 83 ec 30          	sub    rsp,0x30
  13a5a0:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  13a5a3:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  13a5a6:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  13a5a9:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
  13a5ad:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
  13a5b3:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  13a5ba:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  13a5be:	74 06                	je     13a5c6 <async_write_disk+0x32>
  13a5c0:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  13a5c4:	75 06                	jne    13a5cc <async_write_disk+0x38>
  13a5c6:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
  13a5cc:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  13a5d0:	74 06                	je     13a5d8 <async_write_disk+0x44>
  13a5d2:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  13a5d6:	75 07                	jne    13a5df <async_write_disk+0x4b>
  13a5d8:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
  13a5df:	bf f7 00 00 00       	mov    edi,0xf7
  13a5e4:	e8 77 e9 ff ff       	call   138f60 <inb>
  13a5e9:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
  13a5ec:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  13a5f0:	83 e0 01             	and    eax,0x1
  13a5f3:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
  13a5f6:	80 7d f6 00          	cmp    BYTE PTR [rbp-0xa],0x0
  13a5fa:	74 0a                	je     13a606 <async_write_disk+0x72>
  13a5fc:	b8 ff ff ff ff       	mov    eax,0xffffffff
  13a601:	e9 d5 00 00 00       	jmp    13a6db <async_write_disk+0x147>
  13a606:	80 65 f7 88          	and    BYTE PTR [rbp-0x9],0x88
  13a60a:	80 7d f7 08          	cmp    BYTE PTR [rbp-0x9],0x8
  13a60e:	74 02                	je     13a612 <async_write_disk+0x7e>
  13a610:	eb cd                	jmp    13a5df <async_write_disk+0x4b>
  13a612:	90                   	nop
  13a613:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  13a616:	0f b6 d0             	movzx  edx,al
  13a619:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  13a61d:	83 c0 02             	add    eax,0x2
  13a620:	0f b7 c0             	movzx  eax,ax
  13a623:	89 d6                	mov    esi,edx
  13a625:	89 c7                	mov    edi,eax
  13a627:	e8 14 e9 ff ff       	call   138f40 <outb>
  13a62c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  13a62f:	0f b6 d0             	movzx  edx,al
  13a632:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  13a636:	83 c0 03             	add    eax,0x3
  13a639:	0f b7 c0             	movzx  eax,ax
  13a63c:	89 d6                	mov    esi,edx
  13a63e:	89 c7                	mov    edi,eax
  13a640:	e8 fb e8 ff ff       	call   138f40 <outb>
  13a645:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  13a648:	c1 e8 08             	shr    eax,0x8
  13a64b:	0f b6 d0             	movzx  edx,al
  13a64e:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  13a652:	83 c0 04             	add    eax,0x4
  13a655:	0f b7 c0             	movzx  eax,ax
  13a658:	89 d6                	mov    esi,edx
  13a65a:	89 c7                	mov    edi,eax
  13a65c:	e8 df e8 ff ff       	call   138f40 <outb>
  13a661:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  13a664:	c1 e8 10             	shr    eax,0x10
  13a667:	0f b6 d0             	movzx  edx,al
  13a66a:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  13a66e:	83 c0 05             	add    eax,0x5
  13a671:	0f b7 c0             	movzx  eax,ax
  13a674:	89 d6                	mov    esi,edx
  13a676:	89 c7                	mov    edi,eax
  13a678:	e8 c3 e8 ff ff       	call   138f40 <outb>
  13a67d:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  13a681:	74 07                	je     13a68a <async_write_disk+0xf6>
  13a683:	b8 10 00 00 00       	mov    eax,0x10
  13a688:	eb 05                	jmp    13a68f <async_write_disk+0xfb>
  13a68a:	b8 00 00 00 00       	mov    eax,0x0
  13a68f:	88 45 f5             	mov    BYTE PTR [rbp-0xb],al
  13a692:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  13a695:	c1 e8 18             	shr    eax,0x18
  13a698:	83 e0 0f             	and    eax,0xf
  13a69b:	89 c2                	mov    edx,eax
  13a69d:	0f b6 45 f5          	movzx  eax,BYTE PTR [rbp-0xb]
  13a6a1:	09 d0                	or     eax,edx
  13a6a3:	83 c8 e0             	or     eax,0xffffffe0
  13a6a6:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
  13a6a9:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  13a6ad:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  13a6b1:	83 c0 06             	add    eax,0x6
  13a6b4:	0f b7 c0             	movzx  eax,ax
  13a6b7:	89 d6                	mov    esi,edx
  13a6b9:	89 c7                	mov    edi,eax
  13a6bb:	e8 80 e8 ff ff       	call   138f40 <outb>
  13a6c0:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  13a6c4:	83 c0 07             	add    eax,0x7
  13a6c7:	0f b7 c0             	movzx  eax,ax
  13a6ca:	be 30 00 00 00       	mov    esi,0x30
  13a6cf:	89 c7                	mov    edi,eax
  13a6d1:	e8 6a e8 ff ff       	call   138f40 <outb>
  13a6d6:	b8 00 00 00 00       	mov    eax,0x0
  13a6db:	c9                   	leave  
  13a6dc:	c3                   	ret    

000000000013a6dd <read_disk>:
  13a6dd:	f3 0f 1e fa          	endbr64 
  13a6e1:	55                   	push   rbp
  13a6e2:	48 89 e5             	mov    rbp,rsp
  13a6e5:	48 83 ec 20          	sub    rsp,0x20
  13a6e9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  13a6ed:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13a6f1:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  13a6f4:	48 98                	cdqe   
  13a6f6:	48 89 c2             	mov    rdx,rax
  13a6f9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13a6fd:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  13a700:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13a704:	8b 00                	mov    eax,DWORD PTR [rax]
  13a706:	89 ce                	mov    esi,ecx
  13a708:	89 c7                	mov    edi,eax
  13a70a:	e8 7c 05 00 00       	call   13ac8b <read_disk_asm>
  13a70f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  13a712:	48 8b 05 47 11 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1147]        # 12b860 <running_req>
  13a719:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
  13a720:	48 8b 05 39 11 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1139]        # 12b860 <running_req>
  13a727:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  13a72b:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  13a732:	00 00 00 
  13a735:	48 c7 05 20 11 ff ff 	mov    QWORD PTR [rip+0xffffffffffff1120],0x0        # 12b860 <running_req>
  13a73c:	00 00 00 00 
  13a740:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13a743:	c9                   	leave  
  13a744:	c3                   	ret    

000000000013a745 <write_disk>:
  13a745:	f3 0f 1e fa          	endbr64 
  13a749:	55                   	push   rbp
  13a74a:	48 89 e5             	mov    rbp,rsp
  13a74d:	48 83 ec 20          	sub    rsp,0x20
  13a751:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  13a755:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13a759:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  13a75c:	48 98                	cdqe   
  13a75e:	48 89 c2             	mov    rdx,rax
  13a761:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13a765:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  13a768:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13a76c:	8b 00                	mov    eax,DWORD PTR [rax]
  13a76e:	89 ce                	mov    esi,ecx
  13a770:	89 c7                	mov    edi,eax
  13a772:	e8 8c 05 00 00       	call   13ad03 <write_disk_asm>
  13a777:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  13a77a:	48 8b 05 df 10 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff10df]        # 12b860 <running_req>
  13a781:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
  13a788:	48 8b 05 d1 10 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff10d1]        # 12b860 <running_req>
  13a78f:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  13a793:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  13a79a:	00 00 00 
  13a79d:	48 c7 05 b8 10 ff ff 	mov    QWORD PTR [rip+0xffffffffffff10b8],0x0        # 12b860 <running_req>
  13a7a4:	00 00 00 00 
  13a7a8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13a7ab:	c9                   	leave  
  13a7ac:	c3                   	ret    

000000000013a7ad <chk_result>:
  13a7ad:	f3 0f 1e fa          	endbr64 
  13a7b1:	55                   	push   rbp
  13a7b2:	48 89 e5             	mov    rbp,rsp
  13a7b5:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  13a7b8:	90                   	nop
  13a7b9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13a7bc:	48 63 d0             	movsxd rdx,eax
  13a7bf:	48 89 d0             	mov    rax,rdx
  13a7c2:	48 01 c0             	add    rax,rax
  13a7c5:	48 01 d0             	add    rax,rdx
  13a7c8:	48 c1 e0 04          	shl    rax,0x4
  13a7cc:	48 05 7c 8b 12 00    	add    rax,0x128b7c
  13a7d2:	8b 00                	mov    eax,DWORD PTR [rax]
  13a7d4:	83 f8 03             	cmp    eax,0x3
  13a7d7:	75 e0                	jne    13a7b9 <chk_result+0xc>
  13a7d9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13a7dc:	48 63 d0             	movsxd rdx,eax
  13a7df:	48 89 d0             	mov    rax,rdx
  13a7e2:	48 01 c0             	add    rax,rax
  13a7e5:	48 01 d0             	add    rax,rdx
  13a7e8:	48 c1 e0 04          	shl    rax,0x4
  13a7ec:	48 05 80 8b 12 00    	add    rax,0x128b80
  13a7f2:	8b 00                	mov    eax,DWORD PTR [rax]
  13a7f4:	83 f8 01             	cmp    eax,0x1
  13a7f7:	0f 94 c0             	sete   al
  13a7fa:	0f b6 c0             	movzx  eax,al
  13a7fd:	5d                   	pop    rbp
  13a7fe:	c3                   	ret    

000000000013a7ff <disk_existent>:
  13a7ff:	f3 0f 1e fa          	endbr64 
  13a803:	55                   	push   rbp
  13a804:	48 89 e5             	mov    rbp,rsp
  13a807:	48 83 ec 10          	sub    rsp,0x10
  13a80b:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  13a80e:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  13a812:	74 5f                	je     13a873 <disk_existent+0x74>
  13a814:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  13a818:	7f 6e                	jg     13a888 <disk_existent+0x89>
  13a81a:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  13a81e:	74 3e                	je     13a85e <disk_existent+0x5f>
  13a820:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  13a824:	7f 62                	jg     13a888 <disk_existent+0x89>
  13a826:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  13a82a:	74 08                	je     13a834 <disk_existent+0x35>
  13a82c:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
  13a830:	74 17                	je     13a849 <disk_existent+0x4a>
  13a832:	eb 54                	jmp    13a888 <disk_existent+0x89>
  13a834:	bf d4 e7 13 00       	mov    edi,0x13e7d4
  13a839:	e8 3a cb ff ff       	call   137378 <sys_find_dev>
  13a83e:	83 f8 ff             	cmp    eax,0xffffffff
  13a841:	0f 95 c0             	setne  al
  13a844:	0f b6 c0             	movzx  eax,al
  13a847:	eb 45                	jmp    13a88e <disk_existent+0x8f>
  13a849:	bf d8 e7 13 00       	mov    edi,0x13e7d8
  13a84e:	e8 25 cb ff ff       	call   137378 <sys_find_dev>
  13a853:	83 f8 ff             	cmp    eax,0xffffffff
  13a856:	0f 95 c0             	setne  al
  13a859:	0f b6 c0             	movzx  eax,al
  13a85c:	eb 30                	jmp    13a88e <disk_existent+0x8f>
  13a85e:	bf dc e7 13 00       	mov    edi,0x13e7dc
  13a863:	e8 10 cb ff ff       	call   137378 <sys_find_dev>
  13a868:	83 f8 ff             	cmp    eax,0xffffffff
  13a86b:	0f 95 c0             	setne  al
  13a86e:	0f b6 c0             	movzx  eax,al
  13a871:	eb 1b                	jmp    13a88e <disk_existent+0x8f>
  13a873:	bf e0 e7 13 00       	mov    edi,0x13e7e0
  13a878:	e8 fb ca ff ff       	call   137378 <sys_find_dev>
  13a87d:	83 f8 ff             	cmp    eax,0xffffffff
  13a880:	0f 95 c0             	setne  al
  13a883:	0f b6 c0             	movzx  eax,al
  13a886:	eb 06                	jmp    13a88e <disk_existent+0x8f>
  13a888:	90                   	nop
  13a889:	b8 00 00 00 00       	mov    eax,0x0
  13a88e:	c9                   	leave  
  13a88f:	c3                   	ret    

000000000013a890 <hd_iterate>:
  13a890:	f3 0f 1e fa          	endbr64 
  13a894:	55                   	push   rbp
  13a895:	48 89 e5             	mov    rbp,rsp
  13a898:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  13a89f:	41 b8 00 00 00 00    	mov    r8d,0x0
  13a8a5:	b9 01 00 00 00       	mov    ecx,0x1
  13a8aa:	ba 00 00 00 00       	mov    edx,0x0
  13a8af:	be 02 00 00 00       	mov    esi,0x2
  13a8b4:	bf 00 00 00 00       	mov    edi,0x0
  13a8b9:	e8 3b f8 ff ff       	call   13a0f9 <request>
  13a8be:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
  13a8c1:	41 b8 00 00 00 00    	mov    r8d,0x0
  13a8c7:	b9 01 00 00 00       	mov    ecx,0x1
  13a8cc:	ba 00 00 00 00       	mov    edx,0x0
  13a8d1:	be 02 00 00 00       	mov    esi,0x2
  13a8d6:	bf 01 00 00 00       	mov    edi,0x1
  13a8db:	e8 19 f8 ff ff       	call   13a0f9 <request>
  13a8e0:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
  13a8e3:	41 b8 00 00 00 00    	mov    r8d,0x0
  13a8e9:	b9 01 00 00 00       	mov    ecx,0x1
  13a8ee:	ba 00 00 00 00       	mov    edx,0x0
  13a8f3:	be 02 00 00 00       	mov    esi,0x2
  13a8f8:	bf 02 00 00 00       	mov    edi,0x2
  13a8fd:	e8 f7 f7 ff ff       	call   13a0f9 <request>
  13a902:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
  13a905:	41 b8 00 00 00 00    	mov    r8d,0x0
  13a90b:	b9 01 00 00 00       	mov    ecx,0x1
  13a910:	ba 00 00 00 00       	mov    edx,0x0
  13a915:	be 02 00 00 00       	mov    esi,0x2
  13a91a:	bf 03 00 00 00       	mov    edi,0x3
  13a91f:	e8 d5 f7 ff ff       	call   13a0f9 <request>
  13a924:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
  13a927:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  13a92e:	e9 5a 01 00 00       	jmp    13aa8d <hd_iterate+0x1fd>
  13a933:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  13a937:	74 3b                	je     13a974 <hd_iterate+0xe4>
  13a939:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  13a93d:	7f 3e                	jg     13a97d <hd_iterate+0xed>
  13a93f:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  13a943:	74 26                	je     13a96b <hd_iterate+0xdb>
  13a945:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  13a949:	7f 32                	jg     13a97d <hd_iterate+0xed>
  13a94b:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  13a94f:	74 08                	je     13a959 <hd_iterate+0xc9>
  13a951:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  13a955:	74 0b                	je     13a962 <hd_iterate+0xd2>
  13a957:	eb 24                	jmp    13a97d <hd_iterate+0xed>
  13a959:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  13a960:	eb 25                	jmp    13a987 <hd_iterate+0xf7>
  13a962:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [rbp-0x10],0x1
  13a969:	eb 1c                	jmp    13a987 <hd_iterate+0xf7>
  13a96b:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [rbp-0x10],0x2
  13a972:	eb 13                	jmp    13a987 <hd_iterate+0xf7>
  13a974:	c7 45 f0 03 00 00 00 	mov    DWORD PTR [rbp-0x10],0x3
  13a97b:	eb 0a                	jmp    13a987 <hd_iterate+0xf7>
  13a97d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  13a982:	e9 10 01 00 00       	jmp    13aa97 <hd_iterate+0x207>
  13a987:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  13a98a:	48 98                	cdqe   
  13a98c:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  13a990:	89 c7                	mov    edi,eax
  13a992:	e8 16 fe ff ff       	call   13a7ad <chk_result>
  13a997:	85 c0                	test   eax,eax
  13a999:	74 6d                	je     13aa08 <hd_iterate+0x178>
  13a99b:	48 8d 95 20 ff ff ff 	lea    rdx,[rbp-0xe0]
  13a9a2:	b8 00 00 00 00       	mov    eax,0x0
  13a9a7:	b9 15 00 00 00       	mov    ecx,0x15
  13a9ac:	48 89 d7             	mov    rdi,rdx
  13a9af:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  13a9b2:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  13a9b5:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  13a9bb:	c7 85 28 ff ff ff 01 	mov    DWORD PTR [rbp-0xd8],0x1
  13a9c2:	00 00 00 
  13a9c5:	c7 85 2c ff ff ff 01 	mov    DWORD PTR [rbp-0xd4],0x1
  13a9cc:	00 00 00 
  13a9cf:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  13a9d3:	7f 07                	jg     13a9dc <hd_iterate+0x14c>
  13a9d5:	b8 f0 01 00 00       	mov    eax,0x1f0
  13a9da:	eb 05                	jmp    13a9e1 <hd_iterate+0x151>
  13a9dc:	b8 70 01 00 00       	mov    eax,0x170
  13a9e1:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
  13a9e7:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  13a9ee:	48 89 c7             	mov    rdi,rax
  13a9f1:	e8 4a c5 ff ff       	call   136f40 <reg_device>
  13a9f6:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  13a9f9:	48 63 d2             	movsxd rdx,edx
  13a9fc:	89 04 95 80 b8 12 00 	mov    DWORD PTR [rdx*4+0x12b880],eax
  13aa03:	e9 81 00 00 00       	jmp    13aa89 <hd_iterate+0x1f9>
  13aa08:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  13aa0b:	48 98                	cdqe   
  13aa0d:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  13aa11:	89 c7                	mov    edi,eax
  13aa13:	e8 95 fd ff ff       	call   13a7ad <chk_result>
  13aa18:	85 c0                	test   eax,eax
  13aa1a:	75 6d                	jne    13aa89 <hd_iterate+0x1f9>
  13aa1c:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  13aa20:	74 3e                	je     13aa60 <hd_iterate+0x1d0>
  13aa22:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  13aa26:	7f 41                	jg     13aa69 <hd_iterate+0x1d9>
  13aa28:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  13aa2c:	74 28                	je     13aa56 <hd_iterate+0x1c6>
  13aa2e:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  13aa32:	7f 35                	jg     13aa69 <hd_iterate+0x1d9>
  13aa34:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  13aa38:	74 08                	je     13aa42 <hd_iterate+0x1b2>
  13aa3a:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  13aa3e:	74 0c                	je     13aa4c <hd_iterate+0x1bc>
  13aa40:	eb 27                	jmp    13aa69 <hd_iterate+0x1d9>
  13aa42:	48 c7 45 f8 d4 e7 13 	mov    QWORD PTR [rbp-0x8],0x13e7d4
  13aa49:	00 
  13aa4a:	eb 1d                	jmp    13aa69 <hd_iterate+0x1d9>
  13aa4c:	48 c7 45 f8 d8 e7 13 	mov    QWORD PTR [rbp-0x8],0x13e7d8
  13aa53:	00 
  13aa54:	eb 13                	jmp    13aa69 <hd_iterate+0x1d9>
  13aa56:	48 c7 45 f8 dc e7 13 	mov    QWORD PTR [rbp-0x8],0x13e7dc
  13aa5d:	00 
  13aa5e:	eb 09                	jmp    13aa69 <hd_iterate+0x1d9>
  13aa60:	48 c7 45 f8 e0 e7 13 	mov    QWORD PTR [rbp-0x8],0x13e7e0
  13aa67:	00 
  13aa68:	90                   	nop
  13aa69:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13aa6d:	48 89 c7             	mov    rdi,rax
  13aa70:	e8 03 c9 ff ff       	call   137378 <sys_find_dev>
  13aa75:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  13aa78:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  13aa7b:	89 c7                	mov    edi,eax
  13aa7d:	e8 ca cf ff ff       	call   137a4c <get_dev>
  13aa82:	89 c7                	mov    edi,eax
  13aa84:	e8 16 cf ff ff       	call   13799f <dispose_device>
  13aa89:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  13aa8d:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  13aa91:	0f 8e 9c fe ff ff    	jle    13a933 <hd_iterate+0xa3>
  13aa97:	c9                   	leave  
  13aa98:	c3                   	ret    

000000000013aa99 <async_check_disk>:
  13aa99:	f3 0f 1e fa          	endbr64 
  13aa9d:	55                   	push   rbp
  13aa9e:	48 89 e5             	mov    rbp,rsp
  13aaa1:	48 83 ec 20          	sub    rsp,0x20
  13aaa5:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  13aaa8:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
  13aaae:	66 c7 45 fc e0 00    	mov    WORD PTR [rbp-0x4],0xe0
  13aab4:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  13aab8:	74 06                	je     13aac0 <async_check_disk+0x27>
  13aaba:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  13aabe:	75 06                	jne    13aac6 <async_check_disk+0x2d>
  13aac0:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
  13aac6:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  13aaca:	74 06                	je     13aad2 <async_check_disk+0x39>
  13aacc:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  13aad0:	75 06                	jne    13aad8 <async_check_disk+0x3f>
  13aad2:	66 c7 45 fc f0 00    	mov    WORD PTR [rbp-0x4],0xf0
  13aad8:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  13aadc:	83 c0 02             	add    eax,0x2
  13aadf:	0f b7 c0             	movzx  eax,ax
  13aae2:	be 01 00 00 00       	mov    esi,0x1
  13aae7:	89 c7                	mov    edi,eax
  13aae9:	e8 52 e4 ff ff       	call   138f40 <outb>
  13aaee:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  13aaf2:	83 c0 03             	add    eax,0x3
  13aaf5:	0f b7 c0             	movzx  eax,ax
  13aaf8:	be 00 00 00 00       	mov    esi,0x0
  13aafd:	89 c7                	mov    edi,eax
  13aaff:	e8 3c e4 ff ff       	call   138f40 <outb>
  13ab04:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  13ab08:	83 c0 04             	add    eax,0x4
  13ab0b:	0f b7 c0             	movzx  eax,ax
  13ab0e:	be 00 00 00 00       	mov    esi,0x0
  13ab13:	89 c7                	mov    edi,eax
  13ab15:	e8 26 e4 ff ff       	call   138f40 <outb>
  13ab1a:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  13ab1e:	83 c0 05             	add    eax,0x5
  13ab21:	0f b7 c0             	movzx  eax,ax
  13ab24:	be 00 00 00 00       	mov    esi,0x0
  13ab29:	89 c7                	mov    edi,eax
  13ab2b:	e8 10 e4 ff ff       	call   138f40 <outb>
  13ab30:	0f b7 45 fc          	movzx  eax,WORD PTR [rbp-0x4]
  13ab34:	0f b6 d0             	movzx  edx,al
  13ab37:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  13ab3b:	83 c0 06             	add    eax,0x6
  13ab3e:	0f b7 c0             	movzx  eax,ax
  13ab41:	89 d6                	mov    esi,edx
  13ab43:	89 c7                	mov    edi,eax
  13ab45:	e8 f6 e3 ff ff       	call   138f40 <outb>
  13ab4a:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  13ab4e:	83 c0 07             	add    eax,0x7
  13ab51:	0f b7 c0             	movzx  eax,ax
  13ab54:	be 90 00 00 00       	mov    esi,0x90
  13ab59:	89 c7                	mov    edi,eax
  13ab5b:	e8 e0 e3 ff ff       	call   138f40 <outb>
  13ab60:	b8 00 00 00 00       	mov    eax,0x0
  13ab65:	c9                   	leave  
  13ab66:	c3                   	ret    

000000000013ab67 <hd_do_req>:
  13ab67:	f3 0f 1e fa          	endbr64 
  13ab6b:	55                   	push   rbp
  13ab6c:	48 89 e5             	mov    rbp,rsp
  13ab6f:	48 83 ec 18          	sub    rsp,0x18
  13ab73:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  13ab77:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  13ab7e:	eb 04                	jmp    13ab84 <hd_do_req+0x1d>
  13ab80:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  13ab84:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13ab87:	48 98                	cdqe   
  13ab89:	8b 14 85 80 b8 12 00 	mov    edx,DWORD PTR [rax*4+0x12b880]
  13ab90:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13ab94:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  13ab9a:	39 c2                	cmp    edx,eax
  13ab9c:	75 e2                	jne    13ab80 <hd_do_req+0x19>
  13ab9e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13aba2:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  13aba8:	83 f8 04             	cmp    eax,0x4
  13abab:	74 72                	je     13ac1f <hd_do_req+0xb8>
  13abad:	83 f8 04             	cmp    eax,0x4
  13abb0:	0f 8f 96 00 00 00    	jg     13ac4c <hd_do_req+0xe5>
  13abb6:	83 f8 02             	cmp    eax,0x2
  13abb9:	74 0a                	je     13abc5 <hd_do_req+0x5e>
  13abbb:	83 f8 03             	cmp    eax,0x3
  13abbe:	74 32                	je     13abf2 <hd_do_req+0x8b>
  13abc0:	e9 87 00 00 00       	jmp    13ac4c <hd_do_req+0xe5>
  13abc5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13abc9:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  13abcc:	48 98                	cdqe   
  13abce:	48 89 c6             	mov    rsi,rax
  13abd1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13abd5:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  13abd8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13abdc:	8b 10                	mov    edx,DWORD PTR [rax]
  13abde:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13abe1:	49 89 f0             	mov    r8,rsi
  13abe4:	be 00 00 00 00       	mov    esi,0x0
  13abe9:	89 c7                	mov    edi,eax
  13abeb:	e8 09 f5 ff ff       	call   13a0f9 <request>
  13abf0:	eb 61                	jmp    13ac53 <hd_do_req+0xec>
  13abf2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13abf6:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  13abf9:	48 98                	cdqe   
  13abfb:	48 89 c6             	mov    rsi,rax
  13abfe:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13ac02:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  13ac05:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13ac09:	8b 10                	mov    edx,DWORD PTR [rax]
  13ac0b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13ac0e:	49 89 f0             	mov    r8,rsi
  13ac11:	be 01 00 00 00       	mov    esi,0x1
  13ac16:	89 c7                	mov    edi,eax
  13ac18:	e8 dc f4 ff ff       	call   13a0f9 <request>
  13ac1d:	eb 34                	jmp    13ac53 <hd_do_req+0xec>
  13ac1f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13ac23:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  13ac26:	48 98                	cdqe   
  13ac28:	48 89 c6             	mov    rsi,rax
  13ac2b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13ac2f:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  13ac32:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13ac36:	8b 10                	mov    edx,DWORD PTR [rax]
  13ac38:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13ac3b:	49 89 f0             	mov    r8,rsi
  13ac3e:	be 02 00 00 00       	mov    esi,0x2
  13ac43:	89 c7                	mov    edi,eax
  13ac45:	e8 af f4 ff ff       	call   13a0f9 <request>
  13ac4a:	eb 07                	jmp    13ac53 <hd_do_req+0xec>
  13ac4c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  13ac51:	eb 1e                	jmp    13ac71 <hd_do_req+0x10a>
  13ac53:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13ac57:	c7 80 ac 00 00 00 02 	mov    DWORD PTR [rax+0xac],0x2
  13ac5e:	00 00 00 
  13ac61:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13ac65:	48 89 05 fc 0b ff ff 	mov    QWORD PTR [rip+0xffffffffffff0bfc],rax        # 12b868 <running_devman_req>
  13ac6c:	b8 00 00 00 00       	mov    eax,0x0
  13ac71:	c9                   	leave  
  13ac72:	c3                   	ret    
  13ac73:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  13ac7a:	00 00 00 
  13ac7d:	0f 1f 00             	nop    DWORD PTR [rax]

000000000013ac80 <disk_int_handler>:
  13ac80:	e8 f8 e2 ff ff       	call   138f7d <eoi+0x4>
  13ac85:	e8 84 f2 ff ff       	call   139f0e <disk_int_handler_c+0x4>
  13ac8a:	cf                   	iret   

000000000013ac8b <read_disk_asm>:
  13ac8b:	55                   	push   rbp
  13ac8c:	89 e5                	mov    ebp,esp
  13ac8e:	66 ba f7 01          	mov    dx,0x1f7
  13ac92:	31 c9                	xor    ecx,ecx
  13ac94:	8b 44 24 08          	mov    eax,DWORD PTR [rsp+0x8]
  13ac98:	8b 4c 24 0c          	mov    ecx,DWORD PTR [rsp+0xc]
  13ac9c:	8b 5c 24 10          	mov    ebx,DWORD PTR [rsp+0x10]
  13aca0:	89 c6                	mov    esi,eax
  13aca2:	66 ba f2 01          	mov    dx,0x1f2
  13aca6:	88 c8                	mov    al,cl
  13aca8:	ee                   	out    dx,al
  13aca9:	66 ba f3 01          	mov    dx,0x1f3
  13acad:	89 f0                	mov    eax,esi
  13acaf:	ee                   	out    dx,al
  13acb0:	66 42 c1 e8 08       	rex.X shr ax,0x8
  13acb5:	ee                   	out    dx,al
  13acb6:	66 42 c1 e8 08       	rex.X shr ax,0x8
  13acbb:	ee                   	out    dx,al
  13acbc:	66 42                	data16 rex.X
  13acbe:	66 c1 e8 08          	shr    ax,0x8
  13acc2:	24 0f                	and    al,0xf
  13acc4:	0c e0                	or     al,0xe0
  13acc6:	ee                   	out    dx,al
  13acc7:	66 42 b0 20          	data16 rex.X mov al,0x20
  13accb:	ee                   	out    dx,al

000000000013accc <read_disk_asm.wait>:
  13accc:	90                   	nop
  13accd:	ec                   	in     al,dx
  13acce:	24 88                	and    al,0x88
  13acd0:	3c 08                	cmp    al,0x8
  13acd2:	75 f8                	jne    13accc <read_disk_asm.wait>
  13acd4:	66 89 d7             	mov    di,dx
  13acd7:	89 c8                	mov    eax,ecx
  13acd9:	66 b9 00 01          	mov    cx,0x100
  13acdd:	66 f7 e1             	mul    cx
  13ace0:	89 c1                	mov    ecx,eax
  13ace2:	66 ba f0 01          	mov    dx,0x1f0

000000000013ace6 <read_disk_asm.read>:
  13ace6:	66 ed                	in     ax,dx
  13ace8:	66 89 03             	mov    WORD PTR [rbx],ax
  13aceb:	83 c3 02             	add    ebx,0x2
  13acee:	e2 f6                	loop   13ace6 <read_disk_asm.read>
  13acf0:	c9                   	leave  
  13acf1:	b8 00 00 00 00       	mov    eax,0x0
  13acf6:	c3                   	ret    

000000000013acf7 <read_disk_asm.err_disk_reading>:
  13acf7:	66 ba f1 01          	mov    dx,0x1f1
  13acfb:	31 c0                	xor    eax,eax
  13acfd:	66 ed                	in     ax,dx
  13acff:	89 ec                	mov    esp,ebp
  13ad01:	5d                   	pop    rbp
  13ad02:	c3                   	ret    

000000000013ad03 <write_disk_asm>:
  13ad03:	55                   	push   rbp
  13ad04:	89 e5                	mov    ebp,esp
  13ad06:	8b 44 24 08          	mov    eax,DWORD PTR [rsp+0x8]
  13ad0a:	8b 4c 24 0c          	mov    ecx,DWORD PTR [rsp+0xc]
  13ad0e:	8b 5c 24 10          	mov    ebx,DWORD PTR [rsp+0x10]
  13ad12:	50                   	push   rax
  13ad13:	66 ba f2 01          	mov    dx,0x1f2
  13ad17:	88 c8                	mov    al,cl
  13ad19:	ee                   	out    dx,al
  13ad1a:	58                   	pop    rax
  13ad1b:	66 ba f3 01          	mov    dx,0x1f3
  13ad1f:	ee                   	out    dx,al
  13ad20:	c1 e8 08             	shr    eax,0x8
  13ad23:	66 ba f4 01          	mov    dx,0x1f4
  13ad27:	ee                   	out    dx,al
  13ad28:	c1 e8 08             	shr    eax,0x8
  13ad2b:	66 ba f5 01          	mov    dx,0x1f5
  13ad2f:	ee                   	out    dx,al
  13ad30:	c1 e8 08             	shr    eax,0x8
  13ad33:	24 0f                	and    al,0xf
  13ad35:	0c e0                	or     al,0xe0
  13ad37:	66 ba f6 01          	mov    dx,0x1f6
  13ad3b:	ee                   	out    dx,al
  13ad3c:	66 ba f7 01          	mov    dx,0x1f7
  13ad40:	b0 30                	mov    al,0x30
  13ad42:	ee                   	out    dx,al

000000000013ad43 <write_disk_asm.not_ready2>:
  13ad43:	90                   	nop
  13ad44:	ec                   	in     al,dx
  13ad45:	24 88                	and    al,0x88
  13ad47:	3c 08                	cmp    al,0x8
  13ad49:	75 f8                	jne    13ad43 <write_disk_asm.not_ready2>
  13ad4b:	89 c8                	mov    eax,ecx
  13ad4d:	66 b9 00 01          	mov    cx,0x100
  13ad51:	66 f7 e1             	mul    cx
  13ad54:	89 c1                	mov    ecx,eax
  13ad56:	66 ba f0 01          	mov    dx,0x1f0

000000000013ad5a <write_disk_asm.go_on_write>:
  13ad5a:	66 8b 03             	mov    ax,WORD PTR [rbx]
  13ad5d:	66 ef                	out    dx,ax
  13ad5f:	83 c3 02             	add    ebx,0x2
  13ad62:	e2 f6                	loop   13ad5a <write_disk_asm.go_on_write>
  13ad64:	89 ec                	mov    esp,ebp
  13ad66:	5d                   	pop    rbp
  13ad67:	c3                   	ret    

000000000013ad68 <init_fat16>:
  13ad68:	f3 0f 1e fa          	endbr64 
  13ad6c:	55                   	push   rbp
  13ad6d:	48 89 e5             	mov    rbp,rsp
  13ad70:	48 81 ec c0 00 00 00 	sub    rsp,0xc0
  13ad77:	bf a0 e8 13 00       	mov    edi,0x13e8a0
  13ad7c:	e8 bf c1 ff ff       	call   136f40 <reg_device>
  13ad81:	bf 00 e8 13 00       	mov    edi,0x13e800
  13ad86:	e8 9d c4 ff ff       	call   137228 <reg_driver>
  13ad8b:	89 05 73 8d ff ff    	mov    DWORD PTR [rip+0xffffffffffff8d73],eax        # 133b04 <fat16_drvi>
  13ad91:	48 8d 85 40 ff ff ff 	lea    rax,[rbp-0xc0]
  13ad98:	48 89 c7             	mov    rdi,rax
  13ad9b:	e8 26 00 00 00       	call   13adc6 <load>
  13ada0:	8b 0d 5e 8d ff ff    	mov    ecx,DWORD PTR [rip+0xffffffffffff8d5e]        # 133b04 <fat16_drvi>
  13ada6:	8b 05 c4 0a ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff0ac4]        # 12b870 <disk_drvi>
  13adac:	ba 48 e9 13 00       	mov    edx,0x13e948
  13adb1:	89 ce                	mov    esi,ecx
  13adb3:	89 c7                	mov    edi,eax
  13adb5:	b8 00 00 00 00       	mov    eax,0x0
  13adba:	e8 08 b1 ff ff       	call   135ec7 <reg_vol>
  13adbf:	b8 00 00 00 00       	mov    eax,0x0
  13adc4:	c9                   	leave  
  13adc5:	c3                   	ret    

000000000013adc6 <load>:
  13adc6:	f3 0f 1e fa          	endbr64 
  13adca:	55                   	push   rbp
  13adcb:	48 89 e5             	mov    rbp,rsp
  13adce:	48 83 ec 20          	sub    rsp,0x20
  13add2:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  13add6:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
  13addd:	ba 01 00 00 00       	mov    edx,0x1
  13ade2:	be 00 00 00 00       	mov    esi,0x0
  13ade7:	bf a0 b8 12 00       	mov    edi,0x12b8a0
  13adec:	e8 61 0b 00 00       	call   13b952 <read_sec>
  13adf1:	0f b7 05 be 0a ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff0abe]        # 12b8b6 <superblock+0x16>
  13adf8:	0f b7 d0             	movzx  edx,ax
  13adfb:	0f b7 05 ac 0a ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff0aac]        # 12b8ae <superblock+0xe>
  13ae02:	0f b7 c0             	movzx  eax,ax
  13ae05:	89 c6                	mov    esi,eax
  13ae07:	bf 00 fb 12 00       	mov    edi,0x12fb00
  13ae0c:	e8 41 0b 00 00       	call   13b952 <read_sec>
  13ae11:	0f b7 05 96 0a ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff0a96]        # 12b8ae <superblock+0xe>
  13ae18:	0f b7 c8             	movzx  ecx,ax
  13ae1b:	0f b7 05 94 0a ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff0a94]        # 12b8b6 <superblock+0x16>
  13ae22:	0f b7 d0             	movzx  edx,ax
  13ae25:	0f b6 05 84 0a ff ff 	movzx  eax,BYTE PTR [rip+0xffffffffffff0a84]        # 12b8b0 <superblock+0x10>
  13ae2c:	0f b6 c0             	movzx  eax,al
  13ae2f:	0f af c2             	imul   eax,edx
  13ae32:	01 c8                	add    eax,ecx
  13ae34:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  13ae37:	0f b7 05 73 0a ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff0a73]        # 12b8b1 <superblock+0x11>
  13ae3e:	0f b7 c0             	movzx  eax,ax
  13ae41:	48 c1 e0 05          	shl    rax,0x5
  13ae45:	0f b7 15 5f 0a ff ff 	movzx  edx,WORD PTR [rip+0xffffffffffff0a5f]        # 12b8ab <superblock+0xb>
  13ae4c:	0f b7 ca             	movzx  ecx,dx
  13ae4f:	ba 00 00 00 00       	mov    edx,0x0
  13ae54:	48 f7 f1             	div    rcx
  13ae57:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  13ae5a:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  13ae5d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13ae60:	89 c6                	mov    esi,eax
  13ae62:	bf e0 b8 12 00       	mov    edi,0x12b8e0
  13ae67:	e8 e6 0a 00 00       	call   13b952 <read_sec>
  13ae6c:	66 c7 05 85 4a ff ff 	mov    WORD PTR [rip+0xffffffffffff4a85],0x0        # 12f8fa <cur_dir+0x1a>
  13ae73:	00 00 
  13ae75:	0f b7 05 32 0a ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff0a32]        # 12b8ae <superblock+0xe>
  13ae7c:	0f b7 c0             	movzx  eax,ax
  13ae7f:	83 c0 3e             	add    eax,0x3e
  13ae82:	89 05 98 2f 00 00    	mov    DWORD PTR [rip+0x2f98],eax        # 13de20 <clu_sec_balance>
  13ae88:	c7 05 6e 8c ff ff 00 	mov    DWORD PTR [rip+0xffffffffffff8c6e],0x0        # 133b00 <dir_depth>
  13ae8f:	00 00 00 
  13ae92:	b8 00 00 00 00       	mov    eax,0x0
  13ae97:	c9                   	leave  
  13ae98:	c3                   	ret    

000000000013ae99 <verify_name>:
  13ae99:	f3 0f 1e fa          	endbr64 
  13ae9d:	55                   	push   rbp
  13ae9e:	48 89 e5             	mov    rbp,rsp
  13aea1:	48 83 ec 70          	sub    rsp,0x70
  13aea5:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  13aea9:	48 b8 61 62 63 64 65 	movabs rax,0x6867666564636261
  13aeb0:	66 67 68 
  13aeb3:	48 ba 69 6a 6b 6c 6d 	movabs rdx,0x706f6e6d6c6b6a69
  13aeba:	6e 6f 70 
  13aebd:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  13aec1:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  13aec5:	48 b8 71 72 73 74 75 	movabs rax,0x7877767574737271
  13aecc:	76 77 78 
  13aecf:	48 ba 79 7a 41 42 43 	movabs rdx,0x4645444342417a79
  13aed6:	44 45 46 
  13aed9:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  13aedd:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  13aee1:	48 b8 47 48 49 4a 4b 	movabs rax,0x4e4d4c4b4a494847
  13aee8:	4c 4d 4e 
  13aeeb:	48 ba 4f 50 51 52 53 	movabs rdx,0x565554535251504f
  13aef2:	54 55 56 
  13aef5:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  13aef9:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  13aefd:	48 b8 57 58 59 5a 30 	movabs rax,0x333231305a595857
  13af04:	31 32 33 
  13af07:	48 ba 34 35 36 37 38 	movabs rdx,0x2f2c393837363534
  13af0e:	39 2c 2f 
  13af11:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  13af15:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  13af19:	c7 45 e0 21 5b 5d 7c 	mov    DWORD PTR [rbp-0x20],0x7c5d5b21
  13af20:	66 c7 45 e4 2b 00    	mov    WORD PTR [rbp-0x1c],0x2b
  13af26:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  13af2a:	48 89 c7             	mov    rdi,rax
  13af2d:	e8 97 26 00 00       	call   13d5c9 <strlen>
  13af32:	83 f8 0b             	cmp    eax,0xb
  13af35:	7f 10                	jg     13af47 <verify_name+0xae>
  13af37:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  13af3b:	48 89 c7             	mov    rdi,rax
  13af3e:	e8 86 26 00 00       	call   13d5c9 <strlen>
  13af43:	85 c0                	test   eax,eax
  13af45:	75 0a                	jne    13af51 <verify_name+0xb8>
  13af47:	b8 00 00 00 00       	mov    eax,0x0
  13af4c:	e9 b3 01 00 00       	jmp    13b104 <verify_name+0x26b>
  13af51:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  13af58:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  13af5f:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  13af66:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [rbp-0x18],0x1
  13af6d:	eb 6b                	jmp    13afda <verify_name+0x141>
  13af6f:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  13af76:	eb 22                	jmp    13af9a <verify_name+0x101>
  13af78:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13af7b:	48 63 d0             	movsxd rdx,eax
  13af7e:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  13af82:	48 01 d0             	add    rax,rdx
  13af85:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  13af88:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  13af8b:	48 98                	cdqe   
  13af8d:	0f b6 44 05 a0       	movzx  eax,BYTE PTR [rbp+rax*1-0x60]
  13af92:	38 c2                	cmp    dl,al
  13af94:	74 0e                	je     13afa4 <verify_name+0x10b>
  13af96:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  13af9a:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  13af9d:	83 f8 45             	cmp    eax,0x45
  13afa0:	76 d6                	jbe    13af78 <verify_name+0xdf>
  13afa2:	eb 01                	jmp    13afa5 <verify_name+0x10c>
  13afa4:	90                   	nop
  13afa5:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  13afa8:	83 f8 45             	cmp    eax,0x45
  13afab:	76 0a                	jbe    13afb7 <verify_name+0x11e>
  13afad:	b8 00 00 00 00       	mov    eax,0x0
  13afb2:	e9 4d 01 00 00       	jmp    13b104 <verify_name+0x26b>
  13afb7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13afba:	48 63 d0             	movsxd rdx,eax
  13afbd:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  13afc1:	48 01 d0             	add    rax,rdx
  13afc4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13afc7:	3c 20                	cmp    al,0x20
  13afc9:	74 07                	je     13afd2 <verify_name+0x139>
  13afcb:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [rbp-0xc],0x1
  13afd2:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  13afd6:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  13afda:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13afdd:	48 63 d0             	movsxd rdx,eax
  13afe0:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  13afe4:	48 01 d0             	add    rax,rdx
  13afe7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13afea:	3c 2e                	cmp    al,0x2e
  13afec:	74 18                	je     13b006 <verify_name+0x16d>
  13afee:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13aff1:	48 63 d0             	movsxd rdx,eax
  13aff4:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  13aff8:	48 01 d0             	add    rax,rdx
  13affb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13affe:	84 c0                	test   al,al
  13b000:	0f 85 69 ff ff ff    	jne    13af6f <verify_name+0xd6>
  13b006:	83 7d fc 08          	cmp    DWORD PTR [rbp-0x4],0x8
  13b00a:	7f 06                	jg     13b012 <verify_name+0x179>
  13b00c:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  13b010:	75 0a                	jne    13b01c <verify_name+0x183>
  13b012:	b8 00 00 00 00       	mov    eax,0x0
  13b017:	e9 e8 00 00 00       	jmp    13b104 <verify_name+0x26b>
  13b01c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13b01f:	48 63 d0             	movsxd rdx,eax
  13b022:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  13b026:	48 01 d0             	add    rax,rdx
  13b029:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13b02c:	84 c0                	test   al,al
  13b02e:	75 0a                	jne    13b03a <verify_name+0x1a1>
  13b030:	b8 01 00 00 00       	mov    eax,0x1
  13b035:	e9 ca 00 00 00       	jmp    13b104 <verify_name+0x26b>
  13b03a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  13b041:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  13b048:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  13b04c:	e9 83 00 00 00       	jmp    13b0d4 <verify_name+0x23b>
  13b051:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  13b058:	eb 22                	jmp    13b07c <verify_name+0x1e3>
  13b05a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13b05d:	48 63 d0             	movsxd rdx,eax
  13b060:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  13b064:	48 01 d0             	add    rax,rdx
  13b067:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  13b06a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  13b06d:	48 98                	cdqe   
  13b06f:	0f b6 44 05 a0       	movzx  eax,BYTE PTR [rbp+rax*1-0x60]
  13b074:	38 c2                	cmp    dl,al
  13b076:	74 0e                	je     13b086 <verify_name+0x1ed>
  13b078:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  13b07c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  13b07f:	83 f8 45             	cmp    eax,0x45
  13b082:	76 d6                	jbe    13b05a <verify_name+0x1c1>
  13b084:	eb 01                	jmp    13b087 <verify_name+0x1ee>
  13b086:	90                   	nop
  13b087:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  13b08a:	83 f8 45             	cmp    eax,0x45
  13b08d:	76 07                	jbe    13b096 <verify_name+0x1fd>
  13b08f:	b8 00 00 00 00       	mov    eax,0x0
  13b094:	eb 6e                	jmp    13b104 <verify_name+0x26b>
  13b096:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13b099:	48 63 d0             	movsxd rdx,eax
  13b09c:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  13b0a0:	48 01 d0             	add    rax,rdx
  13b0a3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13b0a6:	3c 20                	cmp    al,0x20
  13b0a8:	74 07                	je     13b0b1 <verify_name+0x218>
  13b0aa:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [rbp-0xc],0x1
  13b0b1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13b0b4:	48 63 d0             	movsxd rdx,eax
  13b0b7:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  13b0bb:	48 01 d0             	add    rax,rdx
  13b0be:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13b0c1:	3c 2e                	cmp    al,0x2e
  13b0c3:	75 07                	jne    13b0cc <verify_name+0x233>
  13b0c5:	b8 00 00 00 00       	mov    eax,0x0
  13b0ca:	eb 38                	jmp    13b104 <verify_name+0x26b>
  13b0cc:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  13b0d0:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  13b0d4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13b0d7:	48 63 d0             	movsxd rdx,eax
  13b0da:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  13b0de:	48 01 d0             	add    rax,rdx
  13b0e1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13b0e4:	84 c0                	test   al,al
  13b0e6:	0f 85 65 ff ff ff    	jne    13b051 <verify_name+0x1b8>
  13b0ec:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  13b0f0:	7f 06                	jg     13b0f8 <verify_name+0x25f>
  13b0f2:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  13b0f6:	75 07                	jne    13b0ff <verify_name+0x266>
  13b0f8:	b8 00 00 00 00       	mov    eax,0x0
  13b0fd:	eb 05                	jmp    13b104 <verify_name+0x26b>
  13b0ff:	b8 01 00 00 00       	mov    eax,0x1
  13b104:	c9                   	leave  
  13b105:	c3                   	ret    

000000000013b106 <format_name>:
  13b106:	f3 0f 1e fa          	endbr64 
  13b10a:	55                   	push   rbp
  13b10b:	48 89 e5             	mov    rbp,rsp
  13b10e:	48 83 ec 30          	sub    rsp,0x30
  13b112:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  13b116:	48 b8 20 20 20 20 20 	movabs rax,0x2020202020202020
  13b11d:	20 20 20 
  13b120:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  13b124:	c7 45 f0 20 20 20 00 	mov    DWORD PTR [rbp-0x10],0x202020
  13b12b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  13b132:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  13b139:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  13b140:	e9 9b 00 00 00       	jmp    13b1e0 <format_name+0xda>
  13b145:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  13b148:	48 63 d0             	movsxd rdx,eax
  13b14b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  13b14f:	48 01 d0             	add    rax,rdx
  13b152:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13b155:	3c 60                	cmp    al,0x60
  13b157:	7e 3e                	jle    13b197 <format_name+0x91>
  13b159:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  13b15c:	48 63 d0             	movsxd rdx,eax
  13b15f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  13b163:	48 01 d0             	add    rax,rdx
  13b166:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13b169:	3c 7a                	cmp    al,0x7a
  13b16b:	7f 2a                	jg     13b197 <format_name+0x91>
  13b16d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  13b170:	48 63 d0             	movsxd rdx,eax
  13b173:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  13b177:	48 01 d0             	add    rax,rdx
  13b17a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13b17d:	8d 48 e0             	lea    ecx,[rax-0x20]
  13b180:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13b183:	8d 50 01             	lea    edx,[rax+0x1]
  13b186:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  13b189:	89 ca                	mov    edx,ecx
  13b18b:	48 98                	cdqe   
  13b18d:	88 54 05 e8          	mov    BYTE PTR [rbp+rax*1-0x18],dl
  13b191:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  13b195:	eb 45                	jmp    13b1dc <format_name+0xd6>
  13b197:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  13b19a:	48 63 d0             	movsxd rdx,eax
  13b19d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  13b1a1:	48 01 d0             	add    rax,rdx
  13b1a4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13b1a7:	3c 2e                	cmp    al,0x2e
  13b1a9:	75 0d                	jne    13b1b8 <format_name+0xb2>
  13b1ab:	b8 08 00 00 00       	mov    eax,0x8
  13b1b0:	2b 45 f8             	sub    eax,DWORD PTR [rbp-0x8]
  13b1b3:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
  13b1b6:	eb 24                	jmp    13b1dc <format_name+0xd6>
  13b1b8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  13b1bb:	48 63 d0             	movsxd rdx,eax
  13b1be:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  13b1c2:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  13b1c6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13b1c9:	8d 50 01             	lea    edx,[rax+0x1]
  13b1cc:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  13b1cf:	0f b6 11             	movzx  edx,BYTE PTR [rcx]
  13b1d2:	48 98                	cdqe   
  13b1d4:	88 54 05 e8          	mov    BYTE PTR [rbp+rax*1-0x18],dl
  13b1d8:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  13b1dc:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  13b1e0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  13b1e3:	48 63 d0             	movsxd rdx,eax
  13b1e6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  13b1ea:	48 01 d0             	add    rax,rdx
  13b1ed:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13b1f0:	84 c0                	test   al,al
  13b1f2:	0f 85 4d ff ff ff    	jne    13b145 <format_name+0x3f>
  13b1f8:	c6 45 f4 00          	mov    BYTE PTR [rbp-0xc],0x0
  13b1fc:	48 8d 55 e8          	lea    rdx,[rbp-0x18]
  13b200:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  13b204:	48 89 d6             	mov    rsi,rdx
  13b207:	48 89 c7             	mov    rdi,rax
  13b20a:	e8 9b 21 00 00       	call   13d3aa <strcpy>
  13b20f:	90                   	nop
  13b210:	c9                   	leave  
  13b211:	c3                   	ret    

000000000013b212 <req_cluster>:
  13b212:	f3 0f 1e fa          	endbr64 
  13b216:	55                   	push   rbp
  13b217:	48 89 e5             	mov    rbp,rsp
  13b21a:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [rbp-0x4],0x3
  13b221:	eb 2a                	jmp    13b24d <req_cluster+0x3b>
  13b223:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13b226:	48 98                	cdqe   
  13b228:	0f b7 84 00 00 fb 12 	movzx  eax,WORD PTR [rax+rax*1+0x12fb00]
  13b22f:	00 
  13b230:	66 85 c0             	test   ax,ax
  13b233:	75 14                	jne    13b249 <req_cluster+0x37>
  13b235:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13b238:	48 98                	cdqe   
  13b23a:	66 c7 84 00 00 fb 12 	mov    WORD PTR [rax+rax*1+0x12fb00],0xffff
  13b241:	00 ff ff 
  13b244:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13b247:	eb 13                	jmp    13b25c <req_cluster+0x4a>
  13b249:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  13b24d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13b250:	3d ff 1f 00 00       	cmp    eax,0x1fff
  13b255:	76 cc                	jbe    13b223 <req_cluster+0x11>
  13b257:	b8 ff ff ff ff       	mov    eax,0xffffffff
  13b25c:	5d                   	pop    rbp
  13b25d:	c3                   	ret    

000000000013b25e <write_sec>:
  13b25e:	f3 0f 1e fa          	endbr64 
  13b262:	55                   	push   rbp
  13b263:	48 89 e5             	mov    rbp,rsp
  13b266:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
  13b26d:	48 89 bd 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rdi
  13b274:	89 b5 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],esi
  13b27a:	89 95 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],edx
  13b280:	48 8d 95 40 ff ff ff 	lea    rdx,[rbp-0xc0]
  13b287:	b8 00 00 00 00       	mov    eax,0x0
  13b28c:	b9 18 00 00 00       	mov    ecx,0x18
  13b291:	48 89 d7             	mov    rdi,rdx
  13b294:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  13b297:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
  13b29e:	89 85 48 ff ff ff    	mov    DWORD PTR [rbp-0xb8],eax
  13b2a4:	8b 85 34 ff ff ff    	mov    eax,DWORD PTR [rbp-0xcc]
  13b2aa:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
  13b2b0:	8b 85 30 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd0]
  13b2b6:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
  13b2bc:	48 8b 15 d5 2a 00 00 	mov    rdx,QWORD PTR [rip+0x2ad5]        # 13dd98 <drv_disk+0x18>
  13b2c3:	48 8d 85 40 ff ff ff 	lea    rax,[rbp-0xc0]
  13b2ca:	48 89 c7             	mov    rdi,rax
  13b2cd:	ff d2                	call   rdx
  13b2cf:	c9                   	leave  
  13b2d0:	c3                   	ret    

000000000013b2d1 <set_attr>:
  13b2d1:	f3 0f 1e fa          	endbr64 
  13b2d5:	55                   	push   rbp
  13b2d6:	48 89 e5             	mov    rbp,rsp
  13b2d9:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  13b2dd:	89 f0                	mov    eax,esi
  13b2df:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
  13b2e2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13b2e6:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  13b2ea:	0a 45 f4             	or     al,BYTE PTR [rbp-0xc]
  13b2ed:	89 c2                	mov    edx,eax
  13b2ef:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13b2f3:	88 50 0b             	mov    BYTE PTR [rax+0xb],dl
  13b2f6:	90                   	nop
  13b2f7:	5d                   	pop    rbp
  13b2f8:	c3                   	ret    

000000000013b2f9 <update_fat_and_root>:
  13b2f9:	f3 0f 1e fa          	endbr64 
  13b2fd:	55                   	push   rbp
  13b2fe:	48 89 e5             	mov    rbp,rsp
  13b301:	48 83 ec 10          	sub    rsp,0x10
  13b305:	0f b7 05 a2 05 ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff05a2]        # 12b8ae <superblock+0xe>
  13b30c:	0f b7 c8             	movzx  ecx,ax
  13b30f:	0f b7 05 a0 05 ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff05a0]        # 12b8b6 <superblock+0x16>
  13b316:	0f b7 d0             	movzx  edx,ax
  13b319:	0f b6 05 90 05 ff ff 	movzx  eax,BYTE PTR [rip+0xffffffffffff0590]        # 12b8b0 <superblock+0x10>
  13b320:	0f b6 c0             	movzx  eax,al
  13b323:	0f af c2             	imul   eax,edx
  13b326:	01 c8                	add    eax,ecx
  13b328:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  13b32b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13b32e:	ba 00 40 00 00       	mov    edx,0x4000
  13b333:	89 c6                	mov    esi,eax
  13b335:	bf e0 b8 12 00       	mov    edi,0x12b8e0
  13b33a:	e8 1f ff ff ff       	call   13b25e <write_sec>
  13b33f:	0f b7 05 68 05 ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff0568]        # 12b8ae <superblock+0xe>
  13b346:	0f b7 c0             	movzx  eax,ax
  13b349:	ba 00 40 00 00       	mov    edx,0x4000
  13b34e:	89 c6                	mov    esi,eax
  13b350:	bf 00 fb 12 00       	mov    edi,0x12fb00
  13b355:	e8 04 ff ff ff       	call   13b25e <write_sec>
  13b35a:	90                   	nop
  13b35b:	c9                   	leave  
  13b35c:	c3                   	ret    

000000000013b35d <add_dot_and_ddot_dir>:
  13b35d:	f3 0f 1e fa          	endbr64 
  13b361:	55                   	push   rbp
  13b362:	48 89 e5             	mov    rbp,rsp
  13b365:	48 83 ec 10          	sub    rsp,0x10
  13b369:	0f b7 45 2a          	movzx  eax,WORD PTR [rbp+0x2a]
  13b36d:	0f b7 c0             	movzx  eax,ax
  13b370:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  13b373:	0f b6 05 33 05 ff ff 	movzx  eax,BYTE PTR [rip+0xffffffffffff0533]        # 12b8ad <superblock+0xd>
  13b37a:	0f b6 c0             	movzx  eax,al
  13b37d:	8b 0d 9d 2a 00 00    	mov    ecx,DWORD PTR [rip+0x2a9d]        # 13de20 <clu_sec_balance>
  13b383:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  13b386:	01 d1                	add    ecx,edx
  13b388:	89 c2                	mov    edx,eax
  13b38a:	89 ce                	mov    esi,ecx
  13b38c:	bf 00 f9 12 00       	mov    edi,0x12f900
  13b391:	e8 bc 05 00 00       	call   13b952 <read_sec>
  13b396:	be 4a e9 13 00       	mov    esi,0x13e94a
  13b39b:	bf 00 f9 12 00       	mov    edi,0x12f900
  13b3a0:	e8 05 20 00 00       	call   13d3aa <strcpy>
  13b3a5:	be 53 e9 13 00       	mov    esi,0x13e953
  13b3aa:	bf 08 f9 12 00       	mov    edi,0x12f908
  13b3af:	e8 f6 1f 00 00       	call   13d3aa <strcpy>
  13b3b4:	0f b7 45 2a          	movzx  eax,WORD PTR [rbp+0x2a]
  13b3b8:	66 89 05 5b 45 ff ff 	mov    WORD PTR [rip+0xffffffffffff455b],ax        # 12f91a <a_clu_of_dir+0x1a>
  13b3bf:	c7 05 53 45 ff ff 00 	mov    DWORD PTR [rip+0xffffffffffff4553],0x0        # 12f91c <a_clu_of_dir+0x1c>
  13b3c6:	00 00 00 
  13b3c9:	be 10 00 00 00       	mov    esi,0x10
  13b3ce:	bf 00 f9 12 00       	mov    edi,0x12f900
  13b3d3:	e8 f9 fe ff ff       	call   13b2d1 <set_attr>
  13b3d8:	be 57 e9 13 00       	mov    esi,0x13e957
  13b3dd:	bf 20 f9 12 00       	mov    edi,0x12f920
  13b3e2:	e8 c3 1f 00 00       	call   13d3aa <strcpy>
  13b3e7:	be 53 e9 13 00       	mov    esi,0x13e953
  13b3ec:	bf 28 f9 12 00       	mov    edi,0x12f928
  13b3f1:	e8 b4 1f 00 00       	call   13d3aa <strcpy>
  13b3f6:	0f b7 05 fd 44 ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff44fd]        # 12f8fa <cur_dir+0x1a>
  13b3fd:	66 89 05 36 45 ff ff 	mov    WORD PTR [rip+0xffffffffffff4536],ax        # 12f93a <a_clu_of_dir+0x3a>
  13b404:	c7 05 2e 45 ff ff 00 	mov    DWORD PTR [rip+0xffffffffffff452e],0x0        # 12f93c <a_clu_of_dir+0x3c>
  13b40b:	00 00 00 
  13b40e:	be 10 00 00 00       	mov    esi,0x10
  13b413:	bf 20 f9 12 00       	mov    edi,0x12f920
  13b418:	e8 b4 fe ff ff       	call   13b2d1 <set_attr>
  13b41d:	8b 15 fd 29 00 00    	mov    edx,DWORD PTR [rip+0x29fd]        # 13de20 <clu_sec_balance>
  13b423:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13b426:	01 d0                	add    eax,edx
  13b428:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  13b42b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13b42e:	ba 00 02 00 00       	mov    edx,0x200
  13b433:	89 c6                	mov    esi,eax
  13b435:	bf 00 f9 12 00       	mov    edi,0x12f900
  13b43a:	e8 1f fe ff ff       	call   13b25e <write_sec>
  13b43f:	90                   	nop
  13b440:	c9                   	leave  
  13b441:	c3                   	ret    

000000000013b442 <translate_attr>:
  13b442:	f3 0f 1e fa          	endbr64 
  13b446:	55                   	push   rbp
  13b447:	48 89 e5             	mov    rbp,rsp
  13b44a:	89 f8                	mov    eax,edi
  13b44c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  13b450:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
  13b453:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  13b457:	83 e0 01             	and    eax,0x1
  13b45a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  13b45d:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  13b461:	74 0b                	je     13b46e <translate_attr+0x2c>
  13b463:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  13b467:	48 83 c0 01          	add    rax,0x1
  13b46b:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
  13b46e:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  13b472:	83 e0 02             	and    eax,0x2
  13b475:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  13b478:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  13b47c:	74 0b                	je     13b489 <translate_attr+0x47>
  13b47e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  13b482:	48 83 c0 02          	add    rax,0x2
  13b486:	c6 00 68             	mov    BYTE PTR [rax],0x68
  13b489:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  13b48d:	83 e0 04             	and    eax,0x4
  13b490:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  13b493:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  13b497:	74 0b                	je     13b4a4 <translate_attr+0x62>
  13b499:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  13b49d:	48 83 c0 04          	add    rax,0x4
  13b4a1:	c6 00 73             	mov    BYTE PTR [rax],0x73
  13b4a4:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  13b4a8:	83 e0 08             	and    eax,0x8
  13b4ab:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  13b4ae:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  13b4b2:	74 0b                	je     13b4bf <translate_attr+0x7d>
  13b4b4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  13b4b8:	48 83 c0 03          	add    rax,0x3
  13b4bc:	c6 00 76             	mov    BYTE PTR [rax],0x76
  13b4bf:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  13b4c3:	83 e0 10             	and    eax,0x10
  13b4c6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  13b4c9:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  13b4cd:	74 0b                	je     13b4da <translate_attr+0x98>
  13b4cf:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  13b4d3:	48 83 c0 03          	add    rax,0x3
  13b4d7:	c6 00 64             	mov    BYTE PTR [rax],0x64
  13b4da:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  13b4de:	48 83 c0 05          	add    rax,0x5
  13b4e2:	c6 00 00             	mov    BYTE PTR [rax],0x0
  13b4e5:	90                   	nop
  13b4e6:	5d                   	pop    rbp
  13b4e7:	c3                   	ret    

000000000013b4e8 <extend_cluster>:
  13b4e8:	f3 0f 1e fa          	endbr64 
  13b4ec:	55                   	push   rbp
  13b4ed:	48 89 e5             	mov    rbp,rsp
  13b4f0:	48 83 ec 18          	sub    rsp,0x18
  13b4f4:	89 f8                	mov    eax,edi
  13b4f6:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
  13b4fa:	b8 00 00 00 00       	mov    eax,0x0
  13b4ff:	e8 0e fd ff ff       	call   13b212 <req_cluster>
  13b504:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  13b507:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  13b50b:	75 07                	jne    13b514 <extend_cluster+0x2c>
  13b50d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  13b512:	eb 16                	jmp    13b52a <extend_cluster+0x42>
  13b514:	0f bf 45 ec          	movsx  eax,WORD PTR [rbp-0x14]
  13b518:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  13b51b:	48 98                	cdqe   
  13b51d:	66 89 94 00 00 fb 12 	mov    WORD PTR [rax+rax*1+0x12fb00],dx
  13b524:	00 
  13b525:	b8 00 00 00 00       	mov    eax,0x0
  13b52a:	c9                   	leave  
  13b52b:	c3                   	ret    

000000000013b52c <touch>:
  13b52c:	f3 0f 1e fa          	endbr64 
  13b530:	55                   	push   rbp
  13b531:	48 89 e5             	mov    rbp,rsp
  13b534:	48 83 ec 60          	sub    rsp,0x60
  13b538:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  13b53c:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  13b540:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  13b544:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  13b548:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  13b54c:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  13b54f:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
  13b553:	c7 45 ec 10 00 00 00 	mov    DWORD PTR [rbp-0x14],0x10
  13b55a:	48 c7 45 e0 00 f9 12 	mov    QWORD PTR [rbp-0x20],0x12f900
  13b561:	00 
  13b562:	0f b6 05 44 03 ff ff 	movzx  eax,BYTE PTR [rip+0xffffffffffff0344]        # 12b8ad <superblock+0xd>
  13b569:	0f b6 c0             	movzx  eax,al
  13b56c:	0f b7 55 ca          	movzx  edx,WORD PTR [rbp-0x36]
  13b570:	0f b7 ca             	movzx  ecx,dx
  13b573:	8b 15 a7 28 00 00    	mov    edx,DWORD PTR [rip+0x28a7]        # 13de20 <clu_sec_balance>
  13b579:	01 d1                	add    ecx,edx
  13b57b:	89 c2                	mov    edx,eax
  13b57d:	89 ce                	mov    esi,ecx
  13b57f:	bf 00 f9 12 00       	mov    edi,0x12f900
  13b584:	e8 c9 03 00 00       	call   13b952 <read_sec>
  13b589:	0f b7 45 ca          	movzx  eax,WORD PTR [rbp-0x36]
  13b58d:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
  13b591:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  13b598:	e9 2e 01 00 00       	jmp    13b6cb <touch+0x19f>
  13b59d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13b5a0:	48 98                	cdqe   
  13b5a2:	48 c1 e0 05          	shl    rax,0x5
  13b5a6:	48 89 c2             	mov    rdx,rax
  13b5a9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  13b5ad:	48 01 d0             	add    rax,rdx
  13b5b0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13b5b3:	3c e5                	cmp    al,0xe5
  13b5b5:	74 1e                	je     13b5d5 <touch+0xa9>
  13b5b7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13b5ba:	48 98                	cdqe   
  13b5bc:	48 c1 e0 05          	shl    rax,0x5
  13b5c0:	48 89 c2             	mov    rdx,rax
  13b5c3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  13b5c7:	48 01 d0             	add    rax,rdx
  13b5ca:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13b5cd:	84 c0                	test   al,al
  13b5cf:	0f 85 f2 00 00 00    	jne    13b6c7 <touch+0x19b>
  13b5d5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  13b5d9:	48 89 c7             	mov    rdi,rax
  13b5dc:	e8 25 fb ff ff       	call   13b106 <format_name>
  13b5e1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13b5e4:	48 98                	cdqe   
  13b5e6:	48 c1 e0 05          	shl    rax,0x5
  13b5ea:	48 89 c2             	mov    rdx,rax
  13b5ed:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  13b5f1:	48 01 d0             	add    rax,rdx
  13b5f4:	48 89 c1             	mov    rcx,rax
  13b5f7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  13b5fb:	ba 0b 00 00 00       	mov    edx,0xb
  13b600:	48 89 c6             	mov    rsi,rax
  13b603:	48 89 cf             	mov    rdi,rcx
  13b606:	e8 a1 1c 00 00       	call   13d2ac <memcpy>
  13b60b:	b8 00 00 00 00       	mov    eax,0x0
  13b610:	e8 fd fb ff ff       	call   13b212 <req_cluster>
  13b615:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
  13b618:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  13b61c:	75 0a                	jne    13b628 <touch+0xfc>
  13b61e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  13b623:	e9 fc 00 00 00       	jmp    13b724 <touch+0x1f8>
  13b628:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13b62b:	48 98                	cdqe   
  13b62d:	48 c1 e0 05          	shl    rax,0x5
  13b631:	48 89 c2             	mov    rdx,rax
  13b634:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  13b638:	48 01 d0             	add    rax,rdx
  13b63b:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  13b63e:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
  13b642:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13b645:	48 98                	cdqe   
  13b647:	48 c1 e0 05          	shl    rax,0x5
  13b64b:	48 89 c2             	mov    rdx,rax
  13b64e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  13b652:	48 01 d0             	add    rax,rdx
  13b655:	be 20 00 00 00       	mov    esi,0x20
  13b65a:	48 89 c7             	mov    rdi,rax
  13b65d:	e8 6f fc ff ff       	call   13b2d1 <set_attr>
  13b662:	0f b7 05 42 02 ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff0242]        # 12b8ab <superblock+0xb>
  13b669:	0f b7 d0             	movzx  edx,ax
  13b66c:	0f b6 05 3a 02 ff ff 	movzx  eax,BYTE PTR [rip+0xffffffffffff023a]        # 12b8ad <superblock+0xd>
  13b673:	0f b6 c0             	movzx  eax,al
  13b676:	0f af d0             	imul   edx,eax
  13b679:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13b67c:	48 98                	cdqe   
  13b67e:	48 c1 e0 05          	shl    rax,0x5
  13b682:	48 89 c1             	mov    rcx,rax
  13b685:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  13b689:	48 01 c8             	add    rax,rcx
  13b68c:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
  13b68f:	0f b7 05 15 02 ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff0215]        # 12b8ab <superblock+0xb>
  13b696:	0f b7 d0             	movzx  edx,ax
  13b699:	0f b6 05 0d 02 ff ff 	movzx  eax,BYTE PTR [rip+0xffffffffffff020d]        # 12b8ad <superblock+0xd>
  13b6a0:	0f b6 c0             	movzx  eax,al
  13b6a3:	0f af d0             	imul   edx,eax
  13b6a6:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  13b6aa:	8b 05 70 27 00 00    	mov    eax,DWORD PTR [rip+0x2770]        # 13de20 <clu_sec_balance>
  13b6b0:	01 c1                	add    ecx,eax
  13b6b2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  13b6b6:	89 ce                	mov    esi,ecx
  13b6b8:	48 89 c7             	mov    rdi,rax
  13b6bb:	e8 9e fb ff ff       	call   13b25e <write_sec>
  13b6c0:	b8 ff ff ff ff       	mov    eax,0xffffffff
  13b6c5:	eb 5d                	jmp    13b724 <touch+0x1f8>
  13b6c7:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  13b6cb:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13b6ce:	3b 45 ec             	cmp    eax,DWORD PTR [rbp-0x14]
  13b6d1:	0f 8c c6 fe ff ff    	jl     13b59d <touch+0x71>
  13b6d7:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  13b6dc:	77 36                	ja     13b714 <touch+0x1e8>
  13b6de:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  13b6e2:	48 98                	cdqe   
  13b6e4:	0f b7 84 00 00 fb 12 	movzx  eax,WORD PTR [rax+rax*1+0x12fb00]
  13b6eb:	00 
  13b6ec:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
  13b6f0:	0f b6 05 b6 01 ff ff 	movzx  eax,BYTE PTR [rip+0xffffffffffff01b6]        # 12b8ad <superblock+0xd>
  13b6f7:	0f b6 d0             	movzx  edx,al
  13b6fa:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  13b6fe:	8b 05 1c 27 00 00    	mov    eax,DWORD PTR [rip+0x271c]        # 13de20 <clu_sec_balance>
  13b704:	01 c1                	add    ecx,eax
  13b706:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  13b70a:	89 ce                	mov    esi,ecx
  13b70c:	48 89 c7             	mov    rdi,rax
  13b70f:	e8 3e 02 00 00       	call   13b952 <read_sec>
  13b714:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  13b719:	0f 86 72 fe ff ff    	jbe    13b591 <touch+0x65>
  13b71f:	b8 00 00 00 00       	mov    eax,0x0
  13b724:	c9                   	leave  
  13b725:	c3                   	ret    

000000000013b726 <mkdir>:
  13b726:	f3 0f 1e fa          	endbr64 
  13b72a:	55                   	push   rbp
  13b72b:	48 89 e5             	mov    rbp,rsp
  13b72e:	48 83 ec 50          	sub    rsp,0x50
  13b732:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  13b736:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  13b73a:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  13b73e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  13b742:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  13b746:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  13b749:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
  13b74d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  13b751:	48 89 c7             	mov    rdi,rax
  13b754:	e8 ad f9 ff ff       	call   13b106 <format_name>
  13b759:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  13b75d:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
  13b761:	0f b6 05 45 01 ff ff 	movzx  eax,BYTE PTR [rip+0xffffffffffff0145]        # 12b8ad <superblock+0xd>
  13b768:	0f b6 c0             	movzx  eax,al
  13b76b:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  13b76f:	8b 15 ab 26 00 00    	mov    edx,DWORD PTR [rip+0x26ab]        # 13de20 <clu_sec_balance>
  13b775:	01 d1                	add    ecx,edx
  13b777:	89 c2                	mov    edx,eax
  13b779:	89 ce                	mov    esi,ecx
  13b77b:	bf 00 f9 12 00       	mov    edi,0x12f900
  13b780:	e8 cd 01 00 00       	call   13b952 <read_sec>
  13b785:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  13b78c:	e9 8c 01 00 00       	jmp    13b91d <mkdir+0x1f7>
  13b791:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13b794:	48 98                	cdqe   
  13b796:	48 c1 e0 05          	shl    rax,0x5
  13b79a:	48 05 1a f9 12 00    	add    rax,0x12f91a
  13b7a0:	0f b7 00             	movzx  eax,WORD PTR [rax]
  13b7a3:	66 85 c0             	test   ax,ax
  13b7a6:	74 30                	je     13b7d8 <mkdir+0xb2>
  13b7a8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13b7ab:	48 98                	cdqe   
  13b7ad:	48 c1 e0 05          	shl    rax,0x5
  13b7b1:	48 05 e0 b8 12 00    	add    rax,0x12b8e0
  13b7b7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13b7ba:	3c e5                	cmp    al,0xe5
  13b7bc:	74 1a                	je     13b7d8 <mkdir+0xb2>
  13b7be:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13b7c1:	48 98                	cdqe   
  13b7c3:	48 c1 e0 05          	shl    rax,0x5
  13b7c7:	48 05 e0 b8 12 00    	add    rax,0x12b8e0
  13b7cd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13b7d0:	84 c0                	test   al,al
  13b7d2:	0f 85 41 01 00 00    	jne    13b919 <mkdir+0x1f3>
  13b7d8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13b7db:	48 98                	cdqe   
  13b7dd:	48 c1 e0 05          	shl    rax,0x5
  13b7e1:	48 05 00 f9 12 00    	add    rax,0x12f900
  13b7e7:	ba 20 00 00 00       	mov    edx,0x20
  13b7ec:	be 00 00 00 00       	mov    esi,0x0
  13b7f1:	48 89 c7             	mov    rdi,rax
  13b7f4:	e8 62 1b 00 00       	call   13d35b <memset>
  13b7f9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13b7fc:	48 98                	cdqe   
  13b7fe:	48 c1 e0 05          	shl    rax,0x5
  13b802:	48 05 00 f9 12 00    	add    rax,0x12f900
  13b808:	ba 0b 00 00 00       	mov    edx,0xb
  13b80d:	be 20 00 00 00       	mov    esi,0x20
  13b812:	48 89 c7             	mov    rdi,rax
  13b815:	e8 41 1b 00 00       	call   13d35b <memset>
  13b81a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13b81d:	48 98                	cdqe   
  13b81f:	48 c1 e0 05          	shl    rax,0x5
  13b823:	48 8d 90 00 f9 12 00 	lea    rdx,[rax+0x12f900]
  13b82a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  13b82e:	48 89 c6             	mov    rsi,rax
  13b831:	48 89 d7             	mov    rdi,rdx
  13b834:	e8 71 1b 00 00       	call   13d3aa <strcpy>
  13b839:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  13b83d:	48 89 c7             	mov    rdi,rax
  13b840:	e8 84 1d 00 00       	call   13d5c9 <strlen>
  13b845:	48 63 d0             	movsxd rdx,eax
  13b848:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13b84b:	48 98                	cdqe   
  13b84d:	48 c1 e0 05          	shl    rax,0x5
  13b851:	48 01 d0             	add    rax,rdx
  13b854:	48 05 00 f9 12 00    	add    rax,0x12f900
  13b85a:	c6 00 20             	mov    BYTE PTR [rax],0x20
  13b85d:	b8 00 00 00 00       	mov    eax,0x0
  13b862:	e8 ab f9 ff ff       	call   13b212 <req_cluster>
  13b867:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  13b86a:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  13b86e:	75 0a                	jne    13b87a <mkdir+0x154>
  13b870:	b8 ff ff ff ff       	mov    eax,0xffffffff
  13b875:	e9 d6 00 00 00       	jmp    13b950 <mkdir+0x22a>
  13b87a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  13b87d:	89 c2                	mov    edx,eax
  13b87f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13b882:	48 98                	cdqe   
  13b884:	48 c1 e0 05          	shl    rax,0x5
  13b888:	48 05 1a f9 12 00    	add    rax,0x12f91a
  13b88e:	66 89 10             	mov    WORD PTR [rax],dx
  13b891:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13b894:	48 98                	cdqe   
  13b896:	48 c1 e0 05          	shl    rax,0x5
  13b89a:	48 05 00 f9 12 00    	add    rax,0x12f900
  13b8a0:	be 10 00 00 00       	mov    esi,0x10
  13b8a5:	48 89 c7             	mov    rdi,rax
  13b8a8:	e8 24 fa ff ff       	call   13b2d1 <set_attr>
  13b8ad:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13b8b0:	48 98                	cdqe   
  13b8b2:	48 c1 e0 05          	shl    rax,0x5
  13b8b6:	48 05 1c f9 12 00    	add    rax,0x12f91c
  13b8bc:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  13b8c2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13b8c5:	48 98                	cdqe   
  13b8c7:	48 c1 e0 05          	shl    rax,0x5
  13b8cb:	48 05 00 f9 12 00    	add    rax,0x12f900
  13b8d1:	ff 70 18             	push   QWORD PTR [rax+0x18]
  13b8d4:	ff 70 10             	push   QWORD PTR [rax+0x10]
  13b8d7:	ff 70 08             	push   QWORD PTR [rax+0x8]
  13b8da:	ff 30                	push   QWORD PTR [rax]
  13b8dc:	e8 7c fa ff ff       	call   13b35d <add_dot_and_ddot_dir>
  13b8e1:	48 83 c4 20          	add    rsp,0x20
  13b8e5:	0f b7 55 fe          	movzx  edx,WORD PTR [rbp-0x2]
  13b8e9:	8b 05 31 25 00 00    	mov    eax,DWORD PTR [rip+0x2531]        # 13de20 <clu_sec_balance>
  13b8ef:	01 d0                	add    eax,edx
  13b8f1:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  13b8f4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  13b8f7:	ba 00 02 00 00       	mov    edx,0x200
  13b8fc:	89 c6                	mov    esi,eax
  13b8fe:	bf 00 f9 12 00       	mov    edi,0x12f900
  13b903:	e8 56 f9 ff ff       	call   13b25e <write_sec>
  13b908:	b8 00 00 00 00       	mov    eax,0x0
  13b90d:	e8 e7 f9 ff ff       	call   13b2f9 <update_fat_and_root>
  13b912:	b8 00 00 00 00       	mov    eax,0x0
  13b917:	eb 37                	jmp    13b950 <mkdir+0x22a>
  13b919:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  13b91d:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  13b921:	0f 8e 6a fe ff ff    	jle    13b791 <mkdir+0x6b>
  13b927:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  13b92c:	77 12                	ja     13b940 <mkdir+0x21a>
  13b92e:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  13b932:	48 98                	cdqe   
  13b934:	0f b7 84 00 00 fb 12 	movzx  eax,WORD PTR [rax+rax*1+0x12fb00]
  13b93b:	00 
  13b93c:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
  13b940:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  13b945:	0f 86 16 fe ff ff    	jbe    13b761 <mkdir+0x3b>
  13b94b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  13b950:	c9                   	leave  
  13b951:	c3                   	ret    

000000000013b952 <read_sec>:
  13b952:	f3 0f 1e fa          	endbr64 
  13b956:	55                   	push   rbp
  13b957:	48 89 e5             	mov    rbp,rsp
  13b95a:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  13b961:	48 89 bd 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rdi
  13b968:	89 b5 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],esi
  13b96e:	89 95 20 ff ff ff    	mov    DWORD PTR [rbp-0xe0],edx
  13b974:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  13b97b:	b8 00 00 00 00       	mov    eax,0x0
  13b980:	b9 18 00 00 00       	mov    ecx,0x18
  13b985:	48 89 d7             	mov    rdi,rdx
  13b988:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  13b98b:	8b 85 24 ff ff ff    	mov    eax,DWORD PTR [rbp-0xdc]
  13b991:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
  13b997:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  13b99e:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
  13b9a4:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  13b9ab:	00 00 00 
  13b9ae:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  13b9b5:	eb 3e                	jmp    13b9f5 <read_sec+0xa3>
  13b9b7:	48 8b 15 da 23 00 00 	mov    rdx,QWORD PTR [rip+0x23da]        # 13dd98 <drv_disk+0x18>
  13b9be:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  13b9c5:	48 89 c7             	mov    rdi,rax
  13b9c8:	ff d2                	call   rdx
  13b9ca:	8b 95 34 ff ff ff    	mov    edx,DWORD PTR [rbp-0xcc]
  13b9d0:	0f b7 05 d4 fe fe ff 	movzx  eax,WORD PTR [rip+0xfffffffffffefed4]        # 12b8ab <superblock+0xb>
  13b9d7:	0f b7 c0             	movzx  eax,ax
  13b9da:	01 d0                	add    eax,edx
  13b9dc:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
  13b9e2:	8b 85 30 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd0]
  13b9e8:	83 c0 01             	add    eax,0x1
  13b9eb:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
  13b9f1:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  13b9f5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13b9f8:	3b 85 20 ff ff ff    	cmp    eax,DWORD PTR [rbp-0xe0]
  13b9fe:	7c b7                	jl     13b9b7 <read_sec+0x65>
  13ba00:	b8 00 00 00 00       	mov    eax,0x0
  13ba05:	c9                   	leave  
  13ba06:	c3                   	ret    

000000000013ba07 <rm>:
  13ba07:	f3 0f 1e fa          	endbr64 
  13ba0b:	55                   	push   rbp
  13ba0c:	48 89 e5             	mov    rbp,rsp
  13ba0f:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  13ba16:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  13ba1d:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  13ba24:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  13ba28:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  13ba2c:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
  13ba33:	b8 00 00 00 00       	mov    eax,0x0
  13ba38:	b9 18 00 00 00       	mov    ecx,0x18
  13ba3d:	48 89 d7             	mov    rdi,rdx
  13ba40:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  13ba43:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  13ba4a:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
  13ba51:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
  13ba58:	48 8d 85 00 ff ff ff 	lea    rax,[rbp-0x100]
  13ba5f:	48 89 c7             	mov    rdi,rax
  13ba62:	e8 07 0a 00 00       	call   13c46e <get_entry>
  13ba67:	83 f8 ff             	cmp    eax,0xffffffff
  13ba6a:	75 0a                	jne    13ba76 <rm+0x6f>
  13ba6c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  13ba71:	e9 a8 01 00 00       	jmp    13bc1e <rm+0x217>
  13ba76:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  13ba7c:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
  13ba80:	48 c7 45 e0 00 f9 12 	mov    QWORD PTR [rbp-0x20],0x12f900
  13ba87:	00 
  13ba88:	0f b6 05 1e fe fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffefe1e]        # 12b8ad <superblock+0xd>
  13ba8f:	0f b6 c0             	movzx  eax,al
  13ba92:	0f b7 55 da          	movzx  edx,WORD PTR [rbp-0x26]
  13ba96:	0f b7 ca             	movzx  ecx,dx
  13ba99:	8b 15 81 23 00 00    	mov    edx,DWORD PTR [rip+0x2381]        # 13de20 <clu_sec_balance>
  13ba9f:	01 d1                	add    ecx,edx
  13baa1:	89 c2                	mov    edx,eax
  13baa3:	89 ce                	mov    esi,ecx
  13baa5:	bf 00 f9 12 00       	mov    edi,0x12f900
  13baaa:	e8 a3 fe ff ff       	call   13b952 <read_sec>
  13baaf:	48 c7 45 e0 00 f9 12 	mov    QWORD PTR [rbp-0x20],0x12f900
  13bab6:	00 
  13bab7:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  13babb:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
  13babf:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  13bac6:	e9 89 00 00 00       	jmp    13bb54 <rm+0x14d>
  13bacb:	0f b6 05 db fd fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffefddb]        # 12b8ad <superblock+0xd>
  13bad2:	0f b6 d0             	movzx  edx,al
  13bad5:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  13bad9:	8b 05 41 23 00 00    	mov    eax,DWORD PTR [rip+0x2341]        # 13de20 <clu_sec_balance>
  13badf:	01 c1                	add    ecx,eax
  13bae1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  13bae5:	89 ce                	mov    esi,ecx
  13bae7:	48 89 c7             	mov    rdi,rax
  13baea:	e8 63 fe ff ff       	call   13b952 <read_sec>
  13baef:	eb 44                	jmp    13bb35 <rm+0x12e>
  13baf1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13baf4:	48 98                	cdqe   
  13baf6:	48 c1 e0 05          	shl    rax,0x5
  13bafa:	48 89 c2             	mov    rdx,rax
  13bafd:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  13bb01:	48 01 d0             	add    rax,rdx
  13bb04:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  13bb08:	0f b7 d0             	movzx  edx,ax
  13bb0b:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  13bb12:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  13bb15:	39 c2                	cmp    edx,eax
  13bb17:	75 18                	jne    13bb31 <rm+0x12a>
  13bb19:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13bb1c:	48 98                	cdqe   
  13bb1e:	48 c1 e0 05          	shl    rax,0x5
  13bb22:	48 89 c2             	mov    rdx,rax
  13bb25:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  13bb29:	48 01 d0             	add    rax,rdx
  13bb2c:	c6 00 e5             	mov    BYTE PTR [rax],0xe5
  13bb2f:	eb 2f                	jmp    13bb60 <rm+0x159>
  13bb31:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  13bb35:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  13bb39:	7e b6                	jle    13baf1 <rm+0xea>
  13bb3b:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  13bb40:	77 12                	ja     13bb54 <rm+0x14d>
  13bb42:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  13bb46:	48 98                	cdqe   
  13bb48:	0f b7 84 00 00 fb 12 	movzx  eax,WORD PTR [rax+rax*1+0x12fb00]
  13bb4f:	00 
  13bb50:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
  13bb54:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  13bb59:	0f 86 6c ff ff ff    	jbe    13bacb <rm+0xc4>
  13bb5f:	90                   	nop
  13bb60:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  13bb63:	48 98                	cdqe   
  13bb65:	48 c1 e0 05          	shl    rax,0x5
  13bb69:	48 89 c2             	mov    rdx,rax
  13bb6c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  13bb70:	48 01 d0             	add    rax,rdx
  13bb73:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  13bb77:	66 89 45 f6          	mov    WORD PTR [rbp-0xa],ax
  13bb7b:	66 83 7d f6 f6       	cmp    WORD PTR [rbp-0xa],0xfff6
  13bb80:	77 10                	ja     13bb92 <rm+0x18b>
  13bb82:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  13bb86:	48 98                	cdqe   
  13bb88:	0f b7 84 00 00 fb 12 	movzx  eax,WORD PTR [rax+rax*1+0x12fb00]
  13bb8f:	00 
  13bb90:	eb 05                	jmp    13bb97 <rm+0x190>
  13bb92:	b8 ff ff ff ff       	mov    eax,0xffffffff
  13bb97:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
  13bb9b:	eb 2a                	jmp    13bbc7 <rm+0x1c0>
  13bb9d:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  13bba1:	48 98                	cdqe   
  13bba3:	66 c7 84 00 00 fb 12 	mov    WORD PTR [rax+rax*1+0x12fb00],0x0
  13bbaa:	00 00 00 
  13bbad:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  13bbb1:	66 89 45 f6          	mov    WORD PTR [rbp-0xa],ax
  13bbb5:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  13bbb9:	48 98                	cdqe   
  13bbbb:	0f b7 84 00 00 fb 12 	movzx  eax,WORD PTR [rax+rax*1+0x12fb00]
  13bbc2:	00 
  13bbc3:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
  13bbc7:	66 83 7d f4 f6       	cmp    WORD PTR [rbp-0xc],0xfff6
  13bbcc:	76 cf                	jbe    13bb9d <rm+0x196>
  13bbce:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  13bbd2:	48 98                	cdqe   
  13bbd4:	66 c7 84 00 00 fb 12 	mov    WORD PTR [rax+rax*1+0x12fb00],0x0
  13bbdb:	00 00 00 
  13bbde:	0f b6 05 c8 fc fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffefcc8]        # 12b8ad <superblock+0xd>
  13bbe5:	0f b6 d0             	movzx  edx,al
  13bbe8:	0f b7 05 bc fc fe ff 	movzx  eax,WORD PTR [rip+0xfffffffffffefcbc]        # 12b8ab <superblock+0xb>
  13bbef:	0f b7 c0             	movzx  eax,ax
  13bbf2:	0f af d0             	imul   edx,eax
  13bbf5:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  13bbf9:	8b 05 21 22 00 00    	mov    eax,DWORD PTR [rip+0x2221]        # 13de20 <clu_sec_balance>
  13bbff:	01 c1                	add    ecx,eax
  13bc01:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  13bc05:	89 ce                	mov    esi,ecx
  13bc07:	48 89 c7             	mov    rdi,rax
  13bc0a:	e8 4f f6 ff ff       	call   13b25e <write_sec>
  13bc0f:	b8 00 00 00 00       	mov    eax,0x0
  13bc14:	e8 e0 f6 ff ff       	call   13b2f9 <update_fat_and_root>
  13bc19:	b8 00 00 00 00       	mov    eax,0x0
  13bc1e:	c9                   	leave  
  13bc1f:	c3                   	ret    

000000000013bc20 <find>:
  13bc20:	f3 0f 1e fa          	endbr64 
  13bc24:	55                   	push   rbp
  13bc25:	48 89 e5             	mov    rbp,rsp
  13bc28:	48 83 ec 30          	sub    rsp,0x30
  13bc2c:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  13bc30:	c7 45 fc 00 02 00 00 	mov    DWORD PTR [rbp-0x4],0x200
  13bc37:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  13bc3e:	48 c7 45 f0 00 f9 12 	mov    QWORD PTR [rbp-0x10],0x12f900
  13bc45:	00 
  13bc46:	0f b7 05 ad 3c ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff3cad]        # 12f8fa <cur_dir+0x1a>
  13bc4d:	66 89 45 ee          	mov    WORD PTR [rbp-0x12],ax
  13bc51:	0f b7 05 a2 3c ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff3ca2]        # 12f8fa <cur_dir+0x1a>
  13bc58:	66 85 c0             	test   ax,ax
  13bc5b:	75 0a                	jne    13bc67 <find+0x47>
  13bc5d:	48 c7 45 f0 e0 b8 12 	mov    QWORD PTR [rbp-0x10],0x12b8e0
  13bc64:	00 
  13bc65:	eb 2b                	jmp    13bc92 <find+0x72>
  13bc67:	c7 45 fc 10 00 00 00 	mov    DWORD PTR [rbp-0x4],0x10
  13bc6e:	0f b6 05 38 fc fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffefc38]        # 12b8ad <superblock+0xd>
  13bc75:	0f b6 d0             	movzx  edx,al
  13bc78:	0f b7 4d ee          	movzx  ecx,WORD PTR [rbp-0x12]
  13bc7c:	8b 05 9e 21 00 00    	mov    eax,DWORD PTR [rip+0x219e]        # 13de20 <clu_sec_balance>
  13bc82:	01 c1                	add    ecx,eax
  13bc84:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  13bc88:	89 ce                	mov    esi,ecx
  13bc8a:	48 89 c7             	mov    rdi,rax
  13bc8d:	e8 c0 fc ff ff       	call   13b952 <read_sec>
  13bc92:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  13bc99:	eb 57                	jmp    13bcf2 <find+0xd2>
  13bc9b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  13bc9e:	48 98                	cdqe   
  13bca0:	48 c1 e0 05          	shl    rax,0x5
  13bca4:	48 89 c2             	mov    rdx,rax
  13bca7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  13bcab:	48 01 d0             	add    rax,rdx
  13bcae:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13bcb1:	84 c0                	test   al,al
  13bcb3:	74 38                	je     13bced <find+0xcd>
  13bcb5:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  13bcb8:	48 98                	cdqe   
  13bcba:	48 c1 e0 05          	shl    rax,0x5
  13bcbe:	48 89 c2             	mov    rdx,rax
  13bcc1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  13bcc5:	48 01 d0             	add    rax,rdx
  13bcc8:	48 89 c1             	mov    rcx,rax
  13bccb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  13bccf:	ba 0b 00 00 00       	mov    edx,0xb
  13bcd4:	48 89 c6             	mov    rsi,rax
  13bcd7:	48 89 cf             	mov    rdi,rcx
  13bcda:	e8 17 16 00 00       	call   13d2f6 <memcmp>
  13bcdf:	85 c0                	test   eax,eax
  13bce1:	75 0b                	jne    13bcee <find+0xce>
  13bce3:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  13bce6:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  13bce9:	01 d0                	add    eax,edx
  13bceb:	eb 71                	jmp    13bd5e <find+0x13e>
  13bced:	90                   	nop
  13bcee:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  13bcf2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  13bcf5:	3b 45 fc             	cmp    eax,DWORD PTR [rbp-0x4]
  13bcf8:	7c a1                	jl     13bc9b <find+0x7b>
  13bcfa:	0f b7 05 f9 3b ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff3bf9]        # 12f8fa <cur_dir+0x1a>
  13bd01:	66 85 c0             	test   ax,ax
  13bd04:	75 07                	jne    13bd0d <find+0xed>
  13bd06:	b8 ff ff ff ff       	mov    eax,0xffffffff
  13bd0b:	eb 51                	jmp    13bd5e <find+0x13e>
  13bd0d:	66 83 7d ee f6       	cmp    WORD PTR [rbp-0x12],0xfff6
  13bd12:	77 3a                	ja     13bd4e <find+0x12e>
  13bd14:	83 45 f8 10          	add    DWORD PTR [rbp-0x8],0x10
  13bd18:	0f b7 45 ee          	movzx  eax,WORD PTR [rbp-0x12]
  13bd1c:	48 98                	cdqe   
  13bd1e:	0f b7 84 00 00 fb 12 	movzx  eax,WORD PTR [rax+rax*1+0x12fb00]
  13bd25:	00 
  13bd26:	66 89 45 ee          	mov    WORD PTR [rbp-0x12],ax
  13bd2a:	0f b6 05 7c fb fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffefb7c]        # 12b8ad <superblock+0xd>
  13bd31:	0f b6 d0             	movzx  edx,al
  13bd34:	0f b7 4d ee          	movzx  ecx,WORD PTR [rbp-0x12]
  13bd38:	8b 05 e2 20 00 00    	mov    eax,DWORD PTR [rip+0x20e2]        # 13de20 <clu_sec_balance>
  13bd3e:	01 c1                	add    ecx,eax
  13bd40:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  13bd44:	89 ce                	mov    esi,ecx
  13bd46:	48 89 c7             	mov    rdi,rax
  13bd49:	e8 04 fc ff ff       	call   13b952 <read_sec>
  13bd4e:	66 83 7d ee f6       	cmp    WORD PTR [rbp-0x12],0xfff6
  13bd53:	0f 86 39 ff ff ff    	jbe    13bc92 <find+0x72>
  13bd59:	b8 ff ff ff ff       	mov    eax,0xffffffff
  13bd5e:	c9                   	leave  
  13bd5f:	c3                   	ret    

000000000013bd60 <read_file_byname>:
  13bd60:	f3 0f 1e fa          	endbr64 
  13bd64:	55                   	push   rbp
  13bd65:	48 89 e5             	mov    rbp,rsp
  13bd68:	41 57                	push   r15
  13bd6a:	41 56                	push   r14
  13bd6c:	41 55                	push   r13
  13bd6e:	41 54                	push   r12
  13bd70:	53                   	push   rbx
  13bd71:	48 81 ec 88 00 00 00 	sub    rsp,0x88
  13bd78:	48 89 bd 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdi
  13bd7f:	48 89 b5 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rsi
  13bd86:	89 95 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edx
  13bd8c:	89 8d 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],ecx
  13bd92:	48 89 e0             	mov    rax,rsp
  13bd95:	48 89 c3             	mov    rbx,rax
  13bd98:	bf 00 00 00 00       	mov    edi,0x0
  13bd9d:	e8 7e fe ff ff       	call   13bc20 <find>
  13bda2:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
  13bda5:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  13bda9:	74 09                	je     13bdb4 <read_file_byname+0x54>
  13bdab:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  13bdb2:	79 0a                	jns    13bdbe <read_file_byname+0x5e>
  13bdb4:	b8 ff ff ff ff       	mov    eax,0xffffffff
  13bdb9:	e9 ea 02 00 00       	jmp    13c0a8 <read_file_byname+0x348>
  13bdbe:	c7 45 b0 00 02 00 00 	mov    DWORD PTR [rbp-0x50],0x200
  13bdc5:	48 c7 45 c0 e0 b8 12 	mov    QWORD PTR [rbp-0x40],0x12b8e0
  13bdcc:	00 
  13bdcd:	c7 45 bc 01 00 00 00 	mov    DWORD PTR [rbp-0x44],0x1
  13bdd4:	0f b7 05 1f 3b ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff3b1f]        # 12f8fa <cur_dir+0x1a>
  13bddb:	66 85 c0             	test   ax,ax
  13bdde:	74 40                	je     13be20 <read_file_byname+0xc0>
  13bde0:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
  13bde7:	c7 45 b0 10 00 00 00 	mov    DWORD PTR [rbp-0x50],0x10
  13bdee:	0f b6 05 b8 fa fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffefab8]        # 12b8ad <superblock+0xd>
  13bdf5:	0f b6 c0             	movzx  eax,al
  13bdf8:	0f b7 15 fb 3a ff ff 	movzx  edx,WORD PTR [rip+0xffffffffffff3afb]        # 12f8fa <cur_dir+0x1a>
  13bdff:	0f b7 ca             	movzx  ecx,dx
  13be02:	8b 15 18 20 00 00    	mov    edx,DWORD PTR [rip+0x2018]        # 13de20 <clu_sec_balance>
  13be08:	01 d1                	add    ecx,edx
  13be0a:	89 c2                	mov    edx,eax
  13be0c:	89 ce                	mov    esi,ecx
  13be0e:	bf 00 f9 12 00       	mov    edi,0x12f900
  13be13:	e8 3a fb ff ff       	call   13b952 <read_sec>
  13be18:	48 c7 45 c0 00 f9 12 	mov    QWORD PTR [rbp-0x40],0x12f900
  13be1f:	00 
  13be20:	0f b7 05 d3 3a ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff3ad3]        # 12f8fa <cur_dir+0x1a>
  13be27:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
  13be2b:	eb 41                	jmp    13be6e <read_file_byname+0x10e>
  13be2d:	83 6d cc 10          	sub    DWORD PTR [rbp-0x34],0x10
  13be31:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  13be36:	77 36                	ja     13be6e <read_file_byname+0x10e>
  13be38:	0f b7 45 ba          	movzx  eax,WORD PTR [rbp-0x46]
  13be3c:	48 98                	cdqe   
  13be3e:	0f b7 84 00 00 fb 12 	movzx  eax,WORD PTR [rax+rax*1+0x12fb00]
  13be45:	00 
  13be46:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
  13be4a:	0f b6 05 5c fa fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffefa5c]        # 12b8ad <superblock+0xd>
  13be51:	0f b6 d0             	movzx  edx,al
  13be54:	0f b7 4d ba          	movzx  ecx,WORD PTR [rbp-0x46]
  13be58:	8b 05 c2 1f 00 00    	mov    eax,DWORD PTR [rip+0x1fc2]        # 13de20 <clu_sec_balance>
  13be5e:	01 c1                	add    ecx,eax
  13be60:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  13be64:	89 ce                	mov    esi,ecx
  13be66:	48 89 c7             	mov    rdi,rax
  13be69:	e8 e4 fa ff ff       	call   13b952 <read_sec>
  13be6e:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  13be72:	75 0d                	jne    13be81 <read_file_byname+0x121>
  13be74:	83 7d cc 0f          	cmp    DWORD PTR [rbp-0x34],0xf
  13be78:	7e 07                	jle    13be81 <read_file_byname+0x121>
  13be7a:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  13be7f:	76 ac                	jbe    13be2d <read_file_byname+0xcd>
  13be81:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  13be84:	48 98                	cdqe   
  13be86:	48 c1 e0 05          	shl    rax,0x5
  13be8a:	48 89 c2             	mov    rdx,rax
  13be8d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  13be91:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  13be95:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  13be98:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  13be9c:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  13bea3:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  13beaa:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  13beae:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  13beb2:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
  13beb6:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
  13beba:	0f b7 45 8a          	movzx  eax,WORD PTR [rbp-0x76]
  13bebe:	0f b7 c0             	movzx  eax,ax
  13bec1:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
  13bec4:	0f b7 05 e0 f9 fe ff 	movzx  eax,WORD PTR [rip+0xfffffffffffef9e0]        # 12b8ab <superblock+0xb>
  13becb:	0f b7 d0             	movzx  edx,ax
  13bece:	0f b6 05 d8 f9 fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffef9d8]        # 12b8ad <superblock+0xd>
  13bed5:	0f b6 c0             	movzx  eax,al
  13bed8:	0f af c2             	imul   eax,edx
  13bedb:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
  13bede:	eb 25                	jmp    13bf05 <read_file_byname+0x1a5>
  13bee0:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  13bee3:	29 85 5c ff ff ff    	sub    DWORD PTR [rbp-0xa4],eax
  13bee9:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  13beec:	48 98                	cdqe   
  13beee:	0f b7 84 00 00 fb 12 	movzx  eax,WORD PTR [rax+rax*1+0x12fb00]
  13bef5:	00 
  13bef6:	98                   	cwde   
  13bef7:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
  13befa:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  13bf00:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  13bf03:	7c 0d                	jl     13bf12 <read_file_byname+0x1b2>
  13bf05:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  13bf0b:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  13bf0e:	7d d0                	jge    13bee0 <read_file_byname+0x180>
  13bf10:	eb 01                	jmp    13bf13 <read_file_byname+0x1b3>
  13bf12:	90                   	nop
  13bf13:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  13bf1a:	7e 15                	jle    13bf31 <read_file_byname+0x1d1>
  13bf1c:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  13bf22:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  13bf25:	7c 0a                	jl     13bf31 <read_file_byname+0x1d1>
  13bf27:	b8 ff ff ff ff       	mov    eax,0xffffffff
  13bf2c:	e9 77 01 00 00       	jmp    13c0a8 <read_file_byname+0x348>
  13bf31:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  13bf34:	48 63 d0             	movsxd rdx,eax
  13bf37:	48 83 ea 01          	sub    rdx,0x1
  13bf3b:	48 89 55 a0          	mov    QWORD PTR [rbp-0x60],rdx
  13bf3f:	48 63 d0             	movsxd rdx,eax
  13bf42:	49 89 d6             	mov    r14,rdx
  13bf45:	41 bf 00 00 00 00    	mov    r15d,0x0
  13bf4b:	48 63 d0             	movsxd rdx,eax
  13bf4e:	49 89 d4             	mov    r12,rdx
  13bf51:	41 bd 00 00 00 00    	mov    r13d,0x0
  13bf57:	48 98                	cdqe   
  13bf59:	ba 10 00 00 00       	mov    edx,0x10
  13bf5e:	48 83 ea 01          	sub    rdx,0x1
  13bf62:	48 01 d0             	add    rax,rdx
  13bf65:	be 10 00 00 00       	mov    esi,0x10
  13bf6a:	ba 00 00 00 00       	mov    edx,0x0
  13bf6f:	48 f7 f6             	div    rsi
  13bf72:	48 6b c0 10          	imul   rax,rax,0x10
  13bf76:	48 89 c1             	mov    rcx,rax
  13bf79:	48 81 e1 00 f0 ff ff 	and    rcx,0xfffffffffffff000
  13bf80:	48 89 e2             	mov    rdx,rsp
  13bf83:	48 29 ca             	sub    rdx,rcx
  13bf86:	48 39 d4             	cmp    rsp,rdx
  13bf89:	74 12                	je     13bf9d <read_file_byname+0x23d>
  13bf8b:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
  13bf92:	48 83 8c 24 f8 0f 00 	or     QWORD PTR [rsp+0xff8],0x0
  13bf99:	00 00 
  13bf9b:	eb e9                	jmp    13bf86 <read_file_byname+0x226>
  13bf9d:	48 89 c2             	mov    rdx,rax
  13bfa0:	81 e2 ff 0f 00 00    	and    edx,0xfff
  13bfa6:	48 29 d4             	sub    rsp,rdx
  13bfa9:	48 89 c2             	mov    rdx,rax
  13bfac:	81 e2 ff 0f 00 00    	and    edx,0xfff
  13bfb2:	48 85 d2             	test   rdx,rdx
  13bfb5:	74 10                	je     13bfc7 <read_file_byname+0x267>
  13bfb7:	25 ff 0f 00 00       	and    eax,0xfff
  13bfbc:	48 83 e8 08          	sub    rax,0x8
  13bfc0:	48 01 e0             	add    rax,rsp
  13bfc3:	48 83 08 00          	or     QWORD PTR [rax],0x0
  13bfc7:	48 89 e0             	mov    rax,rsp
  13bfca:	48 83 c0 00          	add    rax,0x0
  13bfce:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
  13bfd2:	0f b6 05 d4 f8 fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffef8d4]        # 12b8ad <superblock+0xd>
  13bfd9:	0f b6 d0             	movzx  edx,al
  13bfdc:	8b 0d 3e 1e 00 00    	mov    ecx,DWORD PTR [rip+0x1e3e]        # 13de20 <clu_sec_balance>
  13bfe2:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  13bfe5:	01 c1                	add    ecx,eax
  13bfe7:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  13bfeb:	89 ce                	mov    esi,ecx
  13bfed:	48 89 c7             	mov    rdi,rax
  13bff0:	e8 5d f9 ff ff       	call   13b952 <read_sec>
  13bff5:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  13bff8:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  13bffe:	89 c2                	mov    edx,eax
  13c000:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  13c006:	48 63 c8             	movsxd rcx,eax
  13c009:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  13c00d:	48 01 c1             	add    rcx,rax
  13c010:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  13c017:	48 89 ce             	mov    rsi,rcx
  13c01a:	48 89 c7             	mov    rdi,rax
  13c01d:	e8 8a 12 00 00       	call   13d2ac <memcpy>
  13c022:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  13c025:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  13c02b:	48 98                	cdqe   
  13c02d:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
  13c034:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  13c037:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  13c03d:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
  13c043:	eb 4c                	jmp    13c091 <read_file_byname+0x331>
  13c045:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  13c048:	48 98                	cdqe   
  13c04a:	0f b7 84 00 00 fb 12 	movzx  eax,WORD PTR [rax+rax*1+0x12fb00]
  13c051:	00 
  13c052:	98                   	cwde   
  13c053:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
  13c056:	0f b6 05 50 f8 fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffef850]        # 12b8ad <superblock+0xd>
  13c05d:	0f b6 d0             	movzx  edx,al
  13c060:	8b 0d ba 1d 00 00    	mov    ecx,DWORD PTR [rip+0x1dba]        # 13de20 <clu_sec_balance>
  13c066:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  13c069:	01 c1                	add    ecx,eax
  13c06b:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  13c072:	89 ce                	mov    esi,ecx
  13c074:	48 89 c7             	mov    rdi,rax
  13c077:	e8 d6 f8 ff ff       	call   13b952 <read_sec>
  13c07c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  13c07f:	48 98                	cdqe   
  13c081:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
  13c088:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  13c08b:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
  13c091:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  13c098:	7f 09                	jg     13c0a3 <read_file_byname+0x343>
  13c09a:	83 bd 58 ff ff ff 00 	cmp    DWORD PTR [rbp-0xa8],0x0
  13c0a1:	7f a2                	jg     13c045 <read_file_byname+0x2e5>
  13c0a3:	b8 00 00 00 00       	mov    eax,0x0
  13c0a8:	48 89 dc             	mov    rsp,rbx
  13c0ab:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
  13c0af:	5b                   	pop    rbx
  13c0b0:	41 5c                	pop    r12
  13c0b2:	41 5d                	pop    r13
  13c0b4:	41 5e                	pop    r14
  13c0b6:	41 5f                	pop    r15
  13c0b8:	5d                   	pop    rbp
  13c0b9:	c3                   	ret    

000000000013c0ba <write_file_byname>:
  13c0ba:	f3 0f 1e fa          	endbr64 
  13c0be:	55                   	push   rbp
  13c0bf:	48 89 e5             	mov    rbp,rsp
  13c0c2:	41 57                	push   r15
  13c0c4:	41 56                	push   r14
  13c0c6:	41 55                	push   r13
  13c0c8:	41 54                	push   r12
  13c0ca:	53                   	push   rbx
  13c0cb:	48 81 ec 88 00 00 00 	sub    rsp,0x88
  13c0d2:	48 89 bd 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdi
  13c0d9:	48 89 b5 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rsi
  13c0e0:	89 95 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edx
  13c0e6:	89 8d 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],ecx
  13c0ec:	48 89 e0             	mov    rax,rsp
  13c0ef:	48 89 c3             	mov    rbx,rax
  13c0f2:	bf 00 00 00 00       	mov    edi,0x0
  13c0f7:	e8 24 fb ff ff       	call   13bc20 <find>
  13c0fc:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
  13c0ff:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  13c103:	74 09                	je     13c10e <write_file_byname+0x54>
  13c105:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  13c10c:	79 0a                	jns    13c118 <write_file_byname+0x5e>
  13c10e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  13c113:	e9 1e 03 00 00       	jmp    13c436 <write_file_byname+0x37c>
  13c118:	c7 45 b0 00 02 00 00 	mov    DWORD PTR [rbp-0x50],0x200
  13c11f:	48 c7 45 c0 e0 b8 12 	mov    QWORD PTR [rbp-0x40],0x12b8e0
  13c126:	00 
  13c127:	c7 45 bc 01 00 00 00 	mov    DWORD PTR [rbp-0x44],0x1
  13c12e:	0f b7 05 c5 37 ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff37c5]        # 12f8fa <cur_dir+0x1a>
  13c135:	66 85 c0             	test   ax,ax
  13c138:	74 40                	je     13c17a <write_file_byname+0xc0>
  13c13a:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
  13c141:	c7 45 b0 10 00 00 00 	mov    DWORD PTR [rbp-0x50],0x10
  13c148:	0f b6 05 5e f7 fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffef75e]        # 12b8ad <superblock+0xd>
  13c14f:	0f b6 c0             	movzx  eax,al
  13c152:	0f b7 15 a1 37 ff ff 	movzx  edx,WORD PTR [rip+0xffffffffffff37a1]        # 12f8fa <cur_dir+0x1a>
  13c159:	0f b7 ca             	movzx  ecx,dx
  13c15c:	8b 15 be 1c 00 00    	mov    edx,DWORD PTR [rip+0x1cbe]        # 13de20 <clu_sec_balance>
  13c162:	01 d1                	add    ecx,edx
  13c164:	89 c2                	mov    edx,eax
  13c166:	89 ce                	mov    esi,ecx
  13c168:	bf 00 f9 12 00       	mov    edi,0x12f900
  13c16d:	e8 e0 f7 ff ff       	call   13b952 <read_sec>
  13c172:	48 c7 45 c0 00 f9 12 	mov    QWORD PTR [rbp-0x40],0x12f900
  13c179:	00 
  13c17a:	0f b7 05 79 37 ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff3779]        # 12f8fa <cur_dir+0x1a>
  13c181:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
  13c185:	eb 41                	jmp    13c1c8 <write_file_byname+0x10e>
  13c187:	83 6d cc 10          	sub    DWORD PTR [rbp-0x34],0x10
  13c18b:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  13c190:	77 36                	ja     13c1c8 <write_file_byname+0x10e>
  13c192:	0f b7 45 ba          	movzx  eax,WORD PTR [rbp-0x46]
  13c196:	48 98                	cdqe   
  13c198:	0f b7 84 00 00 fb 12 	movzx  eax,WORD PTR [rax+rax*1+0x12fb00]
  13c19f:	00 
  13c1a0:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
  13c1a4:	0f b6 05 02 f7 fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffef702]        # 12b8ad <superblock+0xd>
  13c1ab:	0f b6 d0             	movzx  edx,al
  13c1ae:	0f b7 4d ba          	movzx  ecx,WORD PTR [rbp-0x46]
  13c1b2:	8b 05 68 1c 00 00    	mov    eax,DWORD PTR [rip+0x1c68]        # 13de20 <clu_sec_balance>
  13c1b8:	01 c1                	add    ecx,eax
  13c1ba:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  13c1be:	89 ce                	mov    esi,ecx
  13c1c0:	48 89 c7             	mov    rdi,rax
  13c1c3:	e8 8a f7 ff ff       	call   13b952 <read_sec>
  13c1c8:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  13c1cc:	75 0d                	jne    13c1db <write_file_byname+0x121>
  13c1ce:	83 7d cc 0f          	cmp    DWORD PTR [rbp-0x34],0xf
  13c1d2:	7e 07                	jle    13c1db <write_file_byname+0x121>
  13c1d4:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  13c1d9:	76 ac                	jbe    13c187 <write_file_byname+0xcd>
  13c1db:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  13c1de:	48 98                	cdqe   
  13c1e0:	48 c1 e0 05          	shl    rax,0x5
  13c1e4:	48 89 c2             	mov    rdx,rax
  13c1e7:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  13c1eb:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  13c1ef:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  13c1f2:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  13c1f6:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  13c1fd:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  13c204:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  13c208:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  13c20c:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
  13c210:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
  13c214:	0f b7 45 8a          	movzx  eax,WORD PTR [rbp-0x76]
  13c218:	0f b7 c0             	movzx  eax,ax
  13c21b:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
  13c21e:	0f b7 05 86 f6 fe ff 	movzx  eax,WORD PTR [rip+0xfffffffffffef686]        # 12b8ab <superblock+0xb>
  13c225:	0f b7 d0             	movzx  edx,ax
  13c228:	0f b6 05 7e f6 fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffef67e]        # 12b8ad <superblock+0xd>
  13c22f:	0f b6 c0             	movzx  eax,al
  13c232:	0f af c2             	imul   eax,edx
  13c235:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
  13c238:	eb 25                	jmp    13c25f <write_file_byname+0x1a5>
  13c23a:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  13c23d:	29 85 5c ff ff ff    	sub    DWORD PTR [rbp-0xa4],eax
  13c243:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  13c249:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  13c24c:	7c 1e                	jl     13c26c <write_file_byname+0x1b2>
  13c24e:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  13c251:	48 98                	cdqe   
  13c253:	0f b7 84 00 00 fb 12 	movzx  eax,WORD PTR [rax+rax*1+0x12fb00]
  13c25a:	00 
  13c25b:	98                   	cwde   
  13c25c:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
  13c25f:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  13c265:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  13c268:	7d d0                	jge    13c23a <write_file_byname+0x180>
  13c26a:	eb 01                	jmp    13c26d <write_file_byname+0x1b3>
  13c26c:	90                   	nop
  13c26d:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  13c274:	7e 15                	jle    13c28b <write_file_byname+0x1d1>
  13c276:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  13c27c:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  13c27f:	7c 0a                	jl     13c28b <write_file_byname+0x1d1>
  13c281:	b8 ff ff ff ff       	mov    eax,0xffffffff
  13c286:	e9 ab 01 00 00       	jmp    13c436 <write_file_byname+0x37c>
  13c28b:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  13c28e:	48 63 d0             	movsxd rdx,eax
  13c291:	48 83 ea 01          	sub    rdx,0x1
  13c295:	48 89 55 a0          	mov    QWORD PTR [rbp-0x60],rdx
  13c299:	48 63 d0             	movsxd rdx,eax
  13c29c:	49 89 d6             	mov    r14,rdx
  13c29f:	41 bf 00 00 00 00    	mov    r15d,0x0
  13c2a5:	48 63 d0             	movsxd rdx,eax
  13c2a8:	49 89 d4             	mov    r12,rdx
  13c2ab:	41 bd 00 00 00 00    	mov    r13d,0x0
  13c2b1:	48 98                	cdqe   
  13c2b3:	ba 10 00 00 00       	mov    edx,0x10
  13c2b8:	48 83 ea 01          	sub    rdx,0x1
  13c2bc:	48 01 d0             	add    rax,rdx
  13c2bf:	be 10 00 00 00       	mov    esi,0x10
  13c2c4:	ba 00 00 00 00       	mov    edx,0x0
  13c2c9:	48 f7 f6             	div    rsi
  13c2cc:	48 6b c0 10          	imul   rax,rax,0x10
  13c2d0:	48 89 c1             	mov    rcx,rax
  13c2d3:	48 81 e1 00 f0 ff ff 	and    rcx,0xfffffffffffff000
  13c2da:	48 89 e2             	mov    rdx,rsp
  13c2dd:	48 29 ca             	sub    rdx,rcx
  13c2e0:	48 39 d4             	cmp    rsp,rdx
  13c2e3:	74 12                	je     13c2f7 <write_file_byname+0x23d>
  13c2e5:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
  13c2ec:	48 83 8c 24 f8 0f 00 	or     QWORD PTR [rsp+0xff8],0x0
  13c2f3:	00 00 
  13c2f5:	eb e9                	jmp    13c2e0 <write_file_byname+0x226>
  13c2f7:	48 89 c2             	mov    rdx,rax
  13c2fa:	81 e2 ff 0f 00 00    	and    edx,0xfff
  13c300:	48 29 d4             	sub    rsp,rdx
  13c303:	48 89 c2             	mov    rdx,rax
  13c306:	81 e2 ff 0f 00 00    	and    edx,0xfff
  13c30c:	48 85 d2             	test   rdx,rdx
  13c30f:	74 10                	je     13c321 <write_file_byname+0x267>
  13c311:	25 ff 0f 00 00       	and    eax,0xfff
  13c316:	48 83 e8 08          	sub    rax,0x8
  13c31a:	48 01 e0             	add    rax,rsp
  13c31d:	48 83 08 00          	or     QWORD PTR [rax],0x0
  13c321:	48 89 e0             	mov    rax,rsp
  13c324:	48 83 c0 00          	add    rax,0x0
  13c328:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
  13c32c:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  13c333:	0f 8e a2 00 00 00    	jle    13c3db <write_file_byname+0x321>
  13c339:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  13c33c:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  13c342:	89 c2                	mov    edx,eax
  13c344:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  13c34a:	48 63 c8             	movsxd rcx,eax
  13c34d:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  13c351:	48 01 c1             	add    rcx,rax
  13c354:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  13c35b:	48 89 c6             	mov    rsi,rax
  13c35e:	48 89 cf             	mov    rdi,rcx
  13c361:	e8 46 0f 00 00       	call   13d2ac <memcpy>
  13c366:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  13c369:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  13c36f:	89 c2                	mov    edx,eax
  13c371:	8b 4d b4             	mov    ecx,DWORD PTR [rbp-0x4c]
  13c374:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  13c378:	89 ce                	mov    esi,ecx
  13c37a:	48 89 c7             	mov    rdi,rax
  13c37d:	e8 dc ee ff ff       	call   13b25e <write_sec>
  13c382:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  13c385:	48 98                	cdqe   
  13c387:	0f b7 84 00 00 fb 12 	movzx  eax,WORD PTR [rax+rax*1+0x12fb00]
  13c38e:	00 
  13c38f:	98                   	cwde   
  13c390:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
  13c393:	eb 46                	jmp    13c3db <write_file_byname+0x321>
  13c395:	8b 15 85 1a 00 00    	mov    edx,DWORD PTR [rip+0x1a85]        # 13de20 <clu_sec_balance>
  13c39b:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  13c39e:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  13c3a1:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  13c3a4:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  13c3ab:	89 ce                	mov    esi,ecx
  13c3ad:	48 89 c7             	mov    rdi,rax
  13c3b0:	e8 a9 ee ff ff       	call   13b25e <write_sec>
  13c3b5:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  13c3b8:	48 98                	cdqe   
  13c3ba:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
  13c3c1:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  13c3c4:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
  13c3ca:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  13c3cd:	48 98                	cdqe   
  13c3cf:	0f b7 84 00 00 fb 12 	movzx  eax,WORD PTR [rax+rax*1+0x12fb00]
  13c3d6:	00 
  13c3d7:	98                   	cwde   
  13c3d8:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
  13c3db:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  13c3e2:	7f 0b                	jg     13c3ef <write_file_byname+0x335>
  13c3e4:	8b 85 58 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa8]
  13c3ea:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  13c3ed:	7d a6                	jge    13c395 <write_file_byname+0x2db>
  13c3ef:	83 bd 58 ff ff ff 00 	cmp    DWORD PTR [rbp-0xa8],0x0
  13c3f6:	7e 39                	jle    13c431 <write_file_byname+0x377>
  13c3f8:	8b 95 58 ff ff ff    	mov    edx,DWORD PTR [rbp-0xa8]
  13c3fe:	48 8b 8d 60 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa0]
  13c405:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  13c409:	48 89 ce             	mov    rsi,rcx
  13c40c:	48 89 c7             	mov    rdi,rax
  13c40f:	e8 98 0e 00 00       	call   13d2ac <memcpy>
  13c414:	8b 15 06 1a 00 00    	mov    edx,DWORD PTR [rip+0x1a06]        # 13de20 <clu_sec_balance>
  13c41a:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  13c41d:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  13c420:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  13c423:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  13c427:	89 ce                	mov    esi,ecx
  13c429:	48 89 c7             	mov    rdi,rax
  13c42c:	e8 2d ee ff ff       	call   13b25e <write_sec>
  13c431:	b8 00 00 00 00       	mov    eax,0x0
  13c436:	48 89 dc             	mov    rsp,rbx
  13c439:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
  13c43d:	5b                   	pop    rbx
  13c43e:	41 5c                	pop    r12
  13c440:	41 5d                	pop    r13
  13c442:	41 5e                	pop    r14
  13c444:	41 5f                	pop    r15
  13c446:	5d                   	pop    rbp
  13c447:	c3                   	ret    

000000000013c448 <file_exist>:
  13c448:	f3 0f 1e fa          	endbr64 
  13c44c:	55                   	push   rbp
  13c44d:	48 89 e5             	mov    rbp,rsp
  13c450:	0f b6 45 10          	movzx  eax,BYTE PTR [rbp+0x10]
  13c454:	3c e5                	cmp    al,0xe5
  13c456:	74 08                	je     13c460 <file_exist+0x18>
  13c458:	0f b6 45 10          	movzx  eax,BYTE PTR [rbp+0x10]
  13c45c:	84 c0                	test   al,al
  13c45e:	75 07                	jne    13c467 <file_exist+0x1f>
  13c460:	b8 00 00 00 00       	mov    eax,0x0
  13c465:	eb 05                	jmp    13c46c <file_exist+0x24>
  13c467:	b8 01 00 00 00       	mov    eax,0x1
  13c46c:	5d                   	pop    rbp
  13c46d:	c3                   	ret    

000000000013c46e <get_entry>:
  13c46e:	f3 0f 1e fa          	endbr64 
  13c472:	55                   	push   rbp
  13c473:	48 89 e5             	mov    rbp,rsp
  13c476:	53                   	push   rbx
  13c477:	48 81 ec e8 00 00 00 	sub    rsp,0xe8
  13c47e:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
  13c485:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  13c48c:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  13c490:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  13c494:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  13c49b:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  13c4a2:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  13c4a5:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
  13c4a9:	c6 45 90 e5          	mov    BYTE PTR [rbp-0x70],0xe5
  13c4ad:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13c4b1:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  13c4b5:	c7 45 dc ff ff ff ff 	mov    DWORD PTR [rbp-0x24],0xffffffff
  13c4bc:	e9 2c 01 00 00       	jmp    13c5ed <get_entry+0x17f>
  13c4c1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13c4c5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13c4c8:	3c 2f                	cmp    al,0x2f
  13c4ca:	0f 85 18 01 00 00    	jne    13c5e8 <get_entry+0x17a>
  13c4d0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13c4d4:	48 2b 45 e0          	sub    rax,QWORD PTR [rbp-0x20]
  13c4d8:	48 83 f8 0b          	cmp    rax,0xb
  13c4dc:	7e 0a                	jle    13c4e8 <get_entry+0x7a>
  13c4de:	b8 ff ff ff ff       	mov    eax,0xffffffff
  13c4e3:	e9 50 02 00 00       	jmp    13c738 <get_entry+0x2ca>
  13c4e8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13c4ec:	48 2b 45 e0          	sub    rax,QWORD PTR [rbp-0x20]
  13c4f0:	89 c2                	mov    edx,eax
  13c4f2:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  13c4f6:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  13c4fd:	48 89 ce             	mov    rsi,rcx
  13c500:	48 89 c7             	mov    rdi,rax
  13c503:	e8 a4 0d 00 00       	call   13d2ac <memcpy>
  13c508:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  13c50c:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  13c510:	48 89 05 c9 33 ff ff 	mov    QWORD PTR [rip+0xffffffffffff33c9],rax        # 12f8e0 <cur_dir>
  13c517:	48 89 15 ca 33 ff ff 	mov    QWORD PTR [rip+0xffffffffffff33ca],rdx        # 12f8e8 <cur_dir+0x8>
  13c51e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  13c522:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  13c526:	48 89 05 c3 33 ff ff 	mov    QWORD PTR [rip+0xffffffffffff33c3],rax        # 12f8f0 <cur_dir+0x10>
  13c52d:	48 89 15 c4 33 ff ff 	mov    QWORD PTR [rip+0xffffffffffff33c4],rdx        # 12f8f8 <cur_dir+0x18>
  13c534:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  13c53b:	48 89 c7             	mov    rdi,rax
  13c53e:	e8 c3 eb ff ff       	call   13b106 <format_name>
  13c543:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  13c54a:	48 89 c7             	mov    rdi,rax
  13c54d:	e8 ce f6 ff ff       	call   13bc20 <find>
  13c552:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
  13c555:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  13c559:	75 0a                	jne    13c565 <get_entry+0xf7>
  13c55b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  13c560:	e9 d3 01 00 00       	jmp    13c738 <get_entry+0x2ca>
  13c565:	0f b7 05 8e 33 ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff338e]        # 12f8fa <cur_dir+0x1a>
  13c56c:	66 85 c0             	test   ax,ax
  13c56f:	75 31                	jne    13c5a2 <get_entry+0x134>
  13c571:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  13c574:	48 98                	cdqe   
  13c576:	48 c1 e0 05          	shl    rax,0x5
  13c57a:	48 8d 88 e0 b8 12 00 	lea    rcx,[rax+0x12b8e0]
  13c581:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  13c584:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  13c588:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  13c58c:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  13c590:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  13c594:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  13c598:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  13c59c:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  13c5a0:	eb 3a                	jmp    13c5dc <get_entry+0x16e>
  13c5a2:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  13c5a5:	99                   	cdq    
  13c5a6:	c1 ea 1c             	shr    edx,0x1c
  13c5a9:	01 d0                	add    eax,edx
  13c5ab:	83 e0 0f             	and    eax,0xf
  13c5ae:	29 d0                	sub    eax,edx
  13c5b0:	48 98                	cdqe   
  13c5b2:	48 c1 e0 05          	shl    rax,0x5
  13c5b6:	48 8d 88 00 f9 12 00 	lea    rcx,[rax+0x12f900]
  13c5bd:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  13c5c0:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  13c5c4:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  13c5c8:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  13c5cc:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  13c5d0:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  13c5d4:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  13c5d8:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  13c5dc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13c5e0:	48 83 c0 01          	add    rax,0x1
  13c5e4:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  13c5e8:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  13c5ed:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13c5f1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13c5f4:	84 c0                	test   al,al
  13c5f6:	0f 85 c5 fe ff ff    	jne    13c4c1 <get_entry+0x53>
  13c5fc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  13c600:	48 89 c7             	mov    rdi,rax
  13c603:	e8 fe ea ff ff       	call   13b106 <format_name>
  13c608:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  13c60c:	48 89 c7             	mov    rdi,rax
  13c60f:	e8 0c f6 ff ff       	call   13bc20 <find>
  13c614:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
  13c617:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  13c61b:	75 0a                	jne    13c627 <get_entry+0x1b9>
  13c61d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  13c622:	e9 11 01 00 00       	jmp    13c738 <get_entry+0x2ca>
  13c627:	0f b7 05 cc 32 ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff32cc]        # 12f8fa <cur_dir+0x1a>
  13c62e:	66 85 c0             	test   ax,ax
  13c631:	75 31                	jne    13c664 <get_entry+0x1f6>
  13c633:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  13c636:	48 98                	cdqe   
  13c638:	48 c1 e0 05          	shl    rax,0x5
  13c63c:	48 8d 88 e0 b8 12 00 	lea    rcx,[rax+0x12b8e0]
  13c643:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  13c646:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  13c64a:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  13c64e:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  13c652:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  13c656:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  13c65a:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  13c65e:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  13c662:	eb 3a                	jmp    13c69e <get_entry+0x230>
  13c664:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  13c667:	99                   	cdq    
  13c668:	c1 ea 1c             	shr    edx,0x1c
  13c66b:	01 d0                	add    eax,edx
  13c66d:	83 e0 0f             	and    eax,0xf
  13c670:	29 d0                	sub    eax,edx
  13c672:	48 98                	cdqe   
  13c674:	48 c1 e0 05          	shl    rax,0x5
  13c678:	48 8d 88 00 f9 12 00 	lea    rcx,[rax+0x12f900]
  13c67f:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  13c682:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  13c686:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  13c68a:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  13c68e:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  13c692:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  13c696:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  13c69a:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  13c69e:	0f b7 45 aa          	movzx  eax,WORD PTR [rbp-0x56]
  13c6a2:	0f b7 c0             	movzx  eax,ax
  13c6a5:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
  13c6ab:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  13c6b2:	48 8b 8d 30 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xd0]
  13c6b9:	48 8b 9d 38 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xc8]
  13c6c0:	48 89 48 28          	mov    QWORD PTR [rax+0x28],rcx
  13c6c4:	48 89 58 30          	mov    QWORD PTR [rax+0x30],rbx
  13c6c8:	48 8b 8d 40 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xc0]
  13c6cf:	48 8b 9d 48 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xb8]
  13c6d6:	48 89 48 38          	mov    QWORD PTR [rax+0x38],rcx
  13c6da:	48 89 58 40          	mov    QWORD PTR [rax+0x40],rbx
  13c6de:	48 8b 8d 50 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xb0]
  13c6e5:	48 8b 9d 58 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xa8]
  13c6ec:	48 89 48 48          	mov    QWORD PTR [rax+0x48],rcx
  13c6f0:	48 89 58 50          	mov    QWORD PTR [rax+0x50],rbx
  13c6f4:	48 8b 8d 60 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa0]
  13c6fb:	48 8b 9d 68 ff ff ff 	mov    rbx,QWORD PTR [rbp-0x98]
  13c702:	48 89 48 58          	mov    QWORD PTR [rax+0x58],rcx
  13c706:	48 89 58 60          	mov    QWORD PTR [rax+0x60],rbx
  13c70a:	48 8b 8d 70 ff ff ff 	mov    rcx,QWORD PTR [rbp-0x90]
  13c711:	48 8b 9d 78 ff ff ff 	mov    rbx,QWORD PTR [rbp-0x88]
  13c718:	48 89 48 68          	mov    QWORD PTR [rax+0x68],rcx
  13c71c:	48 89 58 70          	mov    QWORD PTR [rax+0x70],rbx
  13c720:	48 8b 4d 80          	mov    rcx,QWORD PTR [rbp-0x80]
  13c724:	48 8b 5d 88          	mov    rbx,QWORD PTR [rbp-0x78]
  13c728:	48 89 48 78          	mov    QWORD PTR [rax+0x78],rcx
  13c72c:	48 89 98 80 00 00 00 	mov    QWORD PTR [rax+0x80],rbx
  13c733:	b8 00 00 00 00       	mov    eax,0x0
  13c738:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  13c73c:	c9                   	leave  
  13c73d:	c3                   	ret    

000000000013c73e <get_fname>:
  13c73e:	f3 0f 1e fa          	endbr64 
  13c742:	55                   	push   rbp
  13c743:	48 89 e5             	mov    rbp,rsp
  13c746:	48 83 ec 20          	sub    rsp,0x20
  13c74a:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  13c74e:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  13c752:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13c756:	be 2f 00 00 00       	mov    esi,0x2f
  13c75b:	48 89 c7             	mov    rdi,rax
  13c75e:	e8 8b 0c 00 00       	call   13d3ee <strtok>
  13c763:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  13c767:	eb 1b                	jmp    13c784 <get_fname+0x46>
  13c769:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  13c76d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  13c771:	be 2f 00 00 00       	mov    esi,0x2f
  13c776:	bf 00 00 00 00       	mov    edi,0x0
  13c77b:	e8 6e 0c 00 00       	call   13d3ee <strtok>
  13c780:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  13c784:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  13c789:	75 de                	jne    13c769 <get_fname+0x2b>
  13c78b:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  13c78f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  13c793:	48 89 d6             	mov    rsi,rdx
  13c796:	48 89 c7             	mov    rdi,rax
  13c799:	e8 0c 0c 00 00       	call   13d3aa <strcpy>
  13c79e:	90                   	nop
  13c79f:	c9                   	leave  
  13c7a0:	c3                   	ret    

000000000013c7a1 <read_file>:
  13c7a1:	f3 0f 1e fa          	endbr64 
  13c7a5:	55                   	push   rbp
  13c7a6:	48 89 e5             	mov    rbp,rsp
  13c7a9:	48 83 ec 60          	sub    rsp,0x60
  13c7ad:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  13c7b1:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  13c7b5:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  13c7b8:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
  13c7bb:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  13c7bf:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  13c7c2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  13c7c5:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  13c7c9:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  13c7cc:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
  13c7d0:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  13c7d4:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  13c7d7:	48 98                	cdqe   
  13c7d9:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  13c7dd:	0f b7 05 c7 f0 fe ff 	movzx  eax,WORD PTR [rip+0xfffffffffffef0c7]        # 12b8ab <superblock+0xb>
  13c7e4:	0f b7 f0             	movzx  esi,ax
  13c7e7:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  13c7ea:	99                   	cdq    
  13c7eb:	f7 fe                	idiv   esi
  13c7ed:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
  13c7f0:	0f b7 05 b4 f0 fe ff 	movzx  eax,WORD PTR [rip+0xfffffffffffef0b4]        # 12b8ab <superblock+0xb>
  13c7f7:	0f b7 c8             	movzx  ecx,ax
  13c7fa:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  13c7fd:	99                   	cdq    
  13c7fe:	f7 f9                	idiv   ecx
  13c800:	89 d0                	mov    eax,edx
  13c802:	85 c0                	test   eax,eax
  13c804:	0f 95 c0             	setne  al
  13c807:	0f b6 c0             	movzx  eax,al
  13c80a:	01 45 dc             	add    DWORD PTR [rbp-0x24],eax
  13c80d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  13c814:	0f b7 45 ca          	movzx  eax,WORD PTR [rbp-0x36]
  13c818:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
  13c81c:	0f b7 05 88 f0 fe ff 	movzx  eax,WORD PTR [rip+0xfffffffffffef088]        # 12b8ab <superblock+0xb>
  13c823:	0f b7 f8             	movzx  edi,ax
  13c826:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13c829:	99                   	cdq    
  13c82a:	f7 ff                	idiv   edi
  13c82c:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
  13c82f:	eb 16                	jmp    13c847 <read_file+0xa6>
  13c831:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  13c835:	48 98                	cdqe   
  13c837:	0f b7 84 00 00 fb 12 	movzx  eax,WORD PTR [rax+rax*1+0x12fb00]
  13c83e:	00 
  13c83f:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
  13c843:	83 6d e4 01          	sub    DWORD PTR [rbp-0x1c],0x1
  13c847:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  13c84c:	77 06                	ja     13c854 <read_file+0xb3>
  13c84e:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  13c852:	7f dd                	jg     13c831 <read_file+0x90>
  13c854:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  13c858:	7e 0a                	jle    13c864 <read_file+0xc3>
  13c85a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  13c85f:	e9 cd 00 00 00       	jmp    13c931 <read_file+0x190>
  13c864:	0f b7 05 40 f0 fe ff 	movzx  eax,WORD PTR [rip+0xfffffffffffef040]        # 12b8ab <superblock+0xb>
  13c86b:	0f b7 c8             	movzx  ecx,ax
  13c86e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13c871:	99                   	cdq    
  13c872:	f7 f9                	idiv   ecx
  13c874:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  13c877:	0f b6 05 2f f0 fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffef02f]        # 12b8ad <superblock+0xd>
  13c87e:	0f b6 d0             	movzx  edx,al
  13c881:	0f b7 05 23 f0 fe ff 	movzx  eax,WORD PTR [rip+0xfffffffffffef023]        # 12b8ab <superblock+0xb>
  13c888:	0f b7 c0             	movzx  eax,ax
  13c88b:	0f af c2             	imul   eax,edx
  13c88e:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
  13c891:	e9 89 00 00 00       	jmp    13c91f <read_file+0x17e>
  13c896:	0f b6 05 10 f0 fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffef010]        # 12b8ad <superblock+0xd>
  13c89d:	0f b6 c0             	movzx  eax,al
  13c8a0:	0f b7 4d ea          	movzx  ecx,WORD PTR [rbp-0x16]
  13c8a4:	8b 15 76 15 00 00    	mov    edx,DWORD PTR [rip+0x1576]        # 13de20 <clu_sec_balance>
  13c8aa:	01 d1                	add    ecx,edx
  13c8ac:	89 c2                	mov    edx,eax
  13c8ae:	89 ce                	mov    esi,ecx
  13c8b0:	bf 20 3b 13 00       	mov    edi,0x133b20
  13c8b5:	e8 98 f0 ff ff       	call   13b952 <read_sec>
  13c8ba:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  13c8bd:	2b 45 fc             	sub    eax,DWORD PTR [rbp-0x4]
  13c8c0:	8b 55 e0             	mov    edx,DWORD PTR [rbp-0x20]
  13c8c3:	39 c2                	cmp    edx,eax
  13c8c5:	0f 4e c2             	cmovle eax,edx
  13c8c8:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
  13c8cb:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  13c8ce:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13c8d1:	48 98                	cdqe   
  13c8d3:	48 8d 88 20 3b 13 00 	lea    rcx,[rax+0x133b20]
  13c8da:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  13c8de:	48 89 ce             	mov    rsi,rcx
  13c8e1:	48 89 c7             	mov    rdi,rax
  13c8e4:	e8 c3 09 00 00       	call   13d2ac <memcpy>
  13c8e9:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  13c8ed:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  13c8f0:	2b 45 fc             	sub    eax,DWORD PTR [rbp-0x4]
  13c8f3:	48 98                	cdqe   
  13c8f5:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
  13c8f9:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  13c8fd:	7e 07                	jle    13c906 <read_file+0x165>
  13c8ff:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  13c906:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  13c90a:	48 98                	cdqe   
  13c90c:	0f b7 84 00 00 fb 12 	movzx  eax,WORD PTR [rax+rax*1+0x12fb00]
  13c913:	00 
  13c914:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
  13c918:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  13c91d:	77 0e                	ja     13c92d <read_file+0x18c>
  13c91f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  13c922:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  13c925:	0f 8c 6b ff ff ff    	jl     13c896 <read_file+0xf5>
  13c92b:	eb 01                	jmp    13c92e <read_file+0x18d>
  13c92d:	90                   	nop
  13c92e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  13c931:	c9                   	leave  
  13c932:	c3                   	ret    

000000000013c933 <write_file>:
  13c933:	f3 0f 1e fa          	endbr64 
  13c937:	55                   	push   rbp
  13c938:	48 89 e5             	mov    rbp,rsp
  13c93b:	48 83 ec 50          	sub    rsp,0x50
  13c93f:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  13c943:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  13c947:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  13c94a:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
  13c94d:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  13c951:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  13c954:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  13c957:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  13c95b:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  13c95e:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
  13c962:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  13c966:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  13c969:	48 98                	cdqe   
  13c96b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  13c96f:	0f b7 05 35 ef fe ff 	movzx  eax,WORD PTR [rip+0xfffffffffffeef35]        # 12b8ab <superblock+0xb>
  13c976:	0f b7 f0             	movzx  esi,ax
  13c979:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13c97c:	99                   	cdq    
  13c97d:	f7 fe                	idiv   esi
  13c97f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  13c982:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  13c985:	8d 90 ff 01 00 00    	lea    edx,[rax+0x1ff]
  13c98b:	85 c0                	test   eax,eax
  13c98d:	0f 48 c2             	cmovs  eax,edx
  13c990:	c1 f8 09             	sar    eax,0x9
  13c993:	89 c1                	mov    ecx,eax
  13c995:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  13c998:	99                   	cdq    
  13c999:	c1 ea 17             	shr    edx,0x17
  13c99c:	01 d0                	add    eax,edx
  13c99e:	25 ff 01 00 00       	and    eax,0x1ff
  13c9a3:	29 d0                	sub    eax,edx
  13c9a5:	01 c8                	add    eax,ecx
  13c9a7:	85 c0                	test   eax,eax
  13c9a9:	0f 95 c0             	setne  al
  13c9ac:	0f b6 c0             	movzx  eax,al
  13c9af:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
  13c9b2:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  13c9b9:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  13c9bd:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
  13c9c1:	eb 16                	jmp    13c9d9 <write_file+0xa6>
  13c9c3:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  13c9c7:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  13c9cb:	48 98                	cdqe   
  13c9cd:	0f b7 84 00 00 fb 12 	movzx  eax,WORD PTR [rax+rax*1+0x12fb00]
  13c9d4:	00 
  13c9d5:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
  13c9d9:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  13c9de:	77 06                	ja     13c9e6 <write_file+0xb3>
  13c9e0:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  13c9e4:	7f dd                	jg     13c9c3 <write_file+0x90>
  13c9e6:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  13c9ea:	7e 52                	jle    13ca3e <write_file+0x10b>
  13c9ec:	b8 ff ff ff ff       	mov    eax,0xffffffff
  13c9f1:	eb 59                	jmp    13ca4c <write_file+0x119>
  13c9f3:	0f b7 55 ea          	movzx  edx,WORD PTR [rbp-0x16]
  13c9f7:	8b 05 23 14 00 00    	mov    eax,DWORD PTR [rip+0x1423]        # 13de20 <clu_sec_balance>
  13c9fd:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  13ca00:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  13ca04:	ba 01 00 00 00       	mov    edx,0x1
  13ca09:	89 ce                	mov    esi,ecx
  13ca0b:	48 89 c7             	mov    rdi,rax
  13ca0e:	e8 4b e8 ff ff       	call   13b25e <write_sec>
  13ca13:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  13ca17:	0f b7 05 8d ee fe ff 	movzx  eax,WORD PTR [rip+0xfffffffffffeee8d]        # 12b8ab <superblock+0xb>
  13ca1e:	0f b7 c0             	movzx  eax,ax
  13ca21:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
  13ca25:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  13ca29:	48 98                	cdqe   
  13ca2b:	0f b7 84 00 00 fb 12 	movzx  eax,WORD PTR [rax+rax*1+0x12fb00]
  13ca32:	00 
  13ca33:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
  13ca37:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  13ca3c:	77 0a                	ja     13ca48 <write_file+0x115>
  13ca3e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  13ca41:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  13ca44:	7c ad                	jl     13c9f3 <write_file+0xc0>
  13ca46:	eb 01                	jmp    13ca49 <write_file+0x116>
  13ca48:	90                   	nop
  13ca49:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  13ca4c:	c9                   	leave  
  13ca4d:	c3                   	ret    

000000000013ca4e <scrdown>:
  13ca4e:	f3 0f 1e fa          	endbr64 
  13ca52:	55                   	push   rbp
  13ca53:	48 89 e5             	mov    rbp,rsp
  13ca56:	48 8b 05 d3 74 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff74d3]        # 133f30 <vpage_base>
  13ca5d:	48 05 a0 00 00 00    	add    rax,0xa0
  13ca63:	48 89 05 c6 74 ff ff 	mov    QWORD PTR [rip+0xffffffffffff74c6],rax        # 133f30 <vpage_base>
  13ca6a:	8b 05 c8 74 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff74c8]        # 133f38 <page_boffset>
  13ca70:	05 a0 00 00 00       	add    eax,0xa0
  13ca75:	89 05 bd 74 ff ff    	mov    DWORD PTR [rip+0xffffffffffff74bd],eax        # 133f38 <page_boffset>
  13ca7b:	48 8b 15 ae 74 ff ff 	mov    rdx,QWORD PTR [rip+0xffffffffffff74ae]        # 133f30 <vpage_base>
  13ca82:	48 8b 05 9f 74 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff749f]        # 133f28 <video_end>
  13ca89:	48 39 c2             	cmp    rdx,rax
  13ca8c:	72 0e                	jb     13ca9c <scrdown+0x4e>
  13ca8e:	48 8b 05 8b 74 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff748b]        # 133f20 <video_base>
  13ca95:	48 89 05 94 74 ff ff 	mov    QWORD PTR [rip+0xffffffffffff7494],rax        # 133f30 <vpage_base>
  13ca9c:	b8 00 00 00 00       	mov    eax,0x0
  13caa1:	e8 6a 00 00 00       	call   13cb10 <set_origin>
  13caa6:	90                   	nop
  13caa7:	5d                   	pop    rbp
  13caa8:	c3                   	ret    

000000000013caa9 <scrup>:
  13caa9:	f3 0f 1e fa          	endbr64 
  13caad:	55                   	push   rbp
  13caae:	48 89 e5             	mov    rbp,rsp
  13cab1:	8b 05 81 74 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff7481]        # 133f38 <page_boffset>
  13cab7:	85 c0                	test   eax,eax
  13cab9:	75 24                	jne    13cadf <scrup+0x36>
  13cabb:	c7 05 73 74 ff ff 00 	mov    DWORD PTR [rip+0xffffffffffff7473],0x0        # 133f38 <page_boffset>
  13cac2:	00 00 00 
  13cac5:	48 8b 05 54 74 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff7454]        # 133f20 <video_base>
  13cacc:	48 89 05 5d 74 ff ff 	mov    QWORD PTR [rip+0xffffffffffff745d],rax        # 133f30 <vpage_base>
  13cad3:	b8 00 00 00 00       	mov    eax,0x0
  13cad8:	e8 33 00 00 00       	call   13cb10 <set_origin>
  13cadd:	eb 2f                	jmp    13cb0e <scrup+0x65>
  13cadf:	48 8b 05 4a 74 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff744a]        # 133f30 <vpage_base>
  13cae6:	48 2d a0 00 00 00    	sub    rax,0xa0
  13caec:	48 89 05 3d 74 ff ff 	mov    QWORD PTR [rip+0xffffffffffff743d],rax        # 133f30 <vpage_base>
  13caf3:	8b 05 3f 74 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff743f]        # 133f38 <page_boffset>
  13caf9:	2d a0 00 00 00       	sub    eax,0xa0
  13cafe:	89 05 34 74 ff ff    	mov    DWORD PTR [rip+0xffffffffffff7434],eax        # 133f38 <page_boffset>
  13cb04:	b8 00 00 00 00       	mov    eax,0x0
  13cb09:	e8 02 00 00 00       	call   13cb10 <set_origin>
  13cb0e:	5d                   	pop    rbp
  13cb0f:	c3                   	ret    

000000000013cb10 <set_origin>:
  13cb10:	f3 0f 1e fa          	endbr64 
  13cb14:	55                   	push   rbp
  13cb15:	48 89 e5             	mov    rbp,rsp
  13cb18:	fa                   	cli    
  13cb19:	8b 05 29 74 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff7429]        # 133f48 <port_reg_index>
  13cb1f:	0f b7 c0             	movzx  eax,ax
  13cb22:	be 0c 00 00 00       	mov    esi,0xc
  13cb27:	89 c7                	mov    edi,eax
  13cb29:	e8 12 c4 ff ff       	call   138f40 <outb>
  13cb2e:	8b 05 04 74 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff7404]        # 133f38 <page_boffset>
  13cb34:	c1 e8 09             	shr    eax,0x9
  13cb37:	0f b6 d0             	movzx  edx,al
  13cb3a:	8b 05 0c 74 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff740c]        # 133f4c <port_reg_v>
  13cb40:	0f b7 c0             	movzx  eax,ax
  13cb43:	89 d6                	mov    esi,edx
  13cb45:	89 c7                	mov    edi,eax
  13cb47:	e8 f4 c3 ff ff       	call   138f40 <outb>
  13cb4c:	8b 05 f6 73 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff73f6]        # 133f48 <port_reg_index>
  13cb52:	0f b7 c0             	movzx  eax,ax
  13cb55:	be 0d 00 00 00       	mov    esi,0xd
  13cb5a:	89 c7                	mov    edi,eax
  13cb5c:	e8 df c3 ff ff       	call   138f40 <outb>
  13cb61:	8b 05 d1 73 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff73d1]        # 133f38 <page_boffset>
  13cb67:	d1 e8                	shr    eax,1
  13cb69:	0f b6 d0             	movzx  edx,al
  13cb6c:	8b 05 da 73 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff73da]        # 133f4c <port_reg_v>
  13cb72:	0f b7 c0             	movzx  eax,ax
  13cb75:	89 d6                	mov    esi,edx
  13cb77:	89 c7                	mov    edi,eax
  13cb79:	e8 c2 c3 ff ff       	call   138f40 <outb>
  13cb7e:	fb                   	sti    
  13cb7f:	90                   	nop
  13cb80:	5d                   	pop    rbp
  13cb81:	c3                   	ret    

000000000013cb82 <init_tty>:
  13cb82:	f3 0f 1e fa          	endbr64 
  13cb86:	55                   	push   rbp
  13cb87:	48 89 e5             	mov    rbp,rsp
  13cb8a:	48 83 ec 10          	sub    rsp,0x10
  13cb8e:	be 68 eb 13 00       	mov    esi,0x13eb68
  13cb93:	bf 14 ea 13 00       	mov    edi,0x13ea14
  13cb98:	e8 0d 08 00 00       	call   13d3aa <strcpy>
  13cb9d:	be 6d eb 13 00       	mov    esi,0x13eb6d
  13cba2:	bf d4 ea 13 00       	mov    edi,0x13ead4
  13cba7:	e8 fe 07 00 00       	call   13d3aa <strcpy>
  13cbac:	bf 60 e9 13 00       	mov    edi,0x13e960
  13cbb1:	e8 72 a6 ff ff       	call   137228 <reg_driver>
  13cbb6:	bf 00 ea 13 00       	mov    edi,0x13ea00
  13cbbb:	e8 80 a3 ff ff       	call   136f40 <reg_device>
  13cbc0:	bf c0 ea 13 00       	mov    edi,0x13eac0
  13cbc5:	e8 76 a3 ff ff       	call   136f40 <reg_device>
  13cbca:	48 c7 45 f8 00 00 02 	mov    QWORD PTR [rbp-0x8],0x20000
  13cbd1:	00 
  13cbd2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13cbd6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13cbd9:	3c 07                	cmp    al,0x7
  13cbdb:	75 36                	jne    13cc13 <init_tty+0x91>
  13cbdd:	c7 05 55 73 ff ff 00 	mov    DWORD PTR [rip+0xffffffffffff7355],0x0        # 133f3c <video_mode>
  13cbe4:	00 00 00 
  13cbe7:	48 c7 05 2e 73 ff ff 	mov    QWORD PTR [rip+0xffffffffffff732e],0xb0000        # 133f20 <video_base>
  13cbee:	00 00 0b 00 
  13cbf2:	48 c7 05 2b 73 ff ff 	mov    QWORD PTR [rip+0xffffffffffff732b],0xb7fff        # 133f28 <video_end>
  13cbf9:	ff 7f 0b 00 
  13cbfd:	c7 05 41 73 ff ff b4 	mov    DWORD PTR [rip+0xffffffffffff7341],0x3b4        # 133f48 <port_reg_index>
  13cc04:	03 00 00 
  13cc07:	c7 05 3b 73 ff ff b5 	mov    DWORD PTR [rip+0xffffffffffff733b],0x3b5        # 133f4c <port_reg_v>
  13cc0e:	03 00 00 
  13cc11:	eb 61                	jmp    13cc74 <init_tty+0xf2>
  13cc13:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13cc17:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13cc1a:	3c 03                	cmp    al,0x3
  13cc1c:	77 36                	ja     13cc54 <init_tty+0xd2>
  13cc1e:	c7 05 14 73 ff ff 01 	mov    DWORD PTR [rip+0xffffffffffff7314],0x1        # 133f3c <video_mode>
  13cc25:	00 00 00 
  13cc28:	48 c7 05 ed 72 ff ff 	mov    QWORD PTR [rip+0xffffffffffff72ed],0xb8000        # 133f20 <video_base>
  13cc2f:	00 80 0b 00 
  13cc33:	48 c7 05 ea 72 ff ff 	mov    QWORD PTR [rip+0xffffffffffff72ea],0xbffff        # 133f28 <video_end>
  13cc3a:	ff ff 0b 00 
  13cc3e:	c7 05 00 73 ff ff d4 	mov    DWORD PTR [rip+0xffffffffffff7300],0x3d4        # 133f48 <port_reg_index>
  13cc45:	03 00 00 
  13cc48:	c7 05 fa 72 ff ff d5 	mov    DWORD PTR [rip+0xffffffffffff72fa],0x3d5        # 133f4c <port_reg_v>
  13cc4f:	03 00 00 
  13cc52:	eb 20                	jmp    13cc74 <init_tty+0xf2>
  13cc54:	c7 05 de 72 ff ff 02 	mov    DWORD PTR [rip+0xffffffffffff72de],0x2        # 133f3c <video_mode>
  13cc5b:	00 00 00 
  13cc5e:	48 c7 05 b7 72 ff ff 	mov    QWORD PTR [rip+0xffffffffffff72b7],0xa0000        # 133f20 <video_base>
  13cc65:	00 00 0a 00 
  13cc69:	48 c7 05 b4 72 ff ff 	mov    QWORD PTR [rip+0xffffffffffff72b4],0xaffff        # 133f28 <video_end>
  13cc70:	ff ff 0a 00 
  13cc74:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13cc78:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13cc7b:	3c 01                	cmp    al,0x1
  13cc7d:	77 0f                	ja     13cc8e <init_tty+0x10c>
  13cc7f:	c7 05 bb 72 ff ff 28 	mov    DWORD PTR [rip+0xffffffffffff72bb],0x28        # 133f44 <line_chs>
  13cc86:	00 00 00 
  13cc89:	e9 91 00 00 00       	jmp    13cd1f <init_tty+0x19d>
  13cc8e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13cc92:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13cc95:	3c 03                	cmp    al,0x3
  13cc97:	76 0b                	jbe    13cca4 <init_tty+0x122>
  13cc99:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13cc9d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13cca0:	3c 07                	cmp    al,0x7
  13cca2:	75 0c                	jne    13ccb0 <init_tty+0x12e>
  13cca4:	c7 05 96 72 ff ff 50 	mov    DWORD PTR [rip+0xffffffffffff7296],0x50        # 133f44 <line_chs>
  13ccab:	00 00 00 
  13ccae:	eb 6f                	jmp    13cd1f <init_tty+0x19d>
  13ccb0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13ccb4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13ccb7:	3c 05                	cmp    al,0x5
  13ccb9:	76 16                	jbe    13ccd1 <init_tty+0x14f>
  13ccbb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13ccbf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13ccc2:	3c 09                	cmp    al,0x9
  13ccc4:	74 0b                	je     13ccd1 <init_tty+0x14f>
  13ccc6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13ccca:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13cccd:	3c 0d                	cmp    al,0xd
  13cccf:	75 0c                	jne    13ccdd <init_tty+0x15b>
  13ccd1:	c7 05 69 72 ff ff 40 	mov    DWORD PTR [rip+0xffffffffffff7269],0x140        # 133f44 <line_chs>
  13ccd8:	01 00 00 
  13ccdb:	eb 42                	jmp    13cd1f <init_tty+0x19d>
  13ccdd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13cce1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13cce4:	3c 06                	cmp    al,0x6
  13cce6:	74 16                	je     13ccfe <init_tty+0x17c>
  13cce8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13ccec:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13ccef:	3c 0a                	cmp    al,0xa
  13ccf1:	74 0b                	je     13ccfe <init_tty+0x17c>
  13ccf3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13ccf7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13ccfa:	3c 0d                	cmp    al,0xd
  13ccfc:	76 0c                	jbe    13cd0a <init_tty+0x188>
  13ccfe:	c7 05 3c 72 ff ff 80 	mov    DWORD PTR [rip+0xffffffffffff723c],0x280        # 133f44 <line_chs>
  13cd05:	02 00 00 
  13cd08:	eb 15                	jmp    13cd1f <init_tty+0x19d>
  13cd0a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13cd0e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13cd11:	3c 08                	cmp    al,0x8
  13cd13:	75 0a                	jne    13cd1f <init_tty+0x19d>
  13cd15:	c7 05 25 72 ff ff a0 	mov    DWORD PTR [rip+0xffffffffffff7225],0xa0        # 133f44 <line_chs>
  13cd1c:	00 00 00 
  13cd1f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13cd23:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13cd26:	0f b6 c0             	movzx  eax,al
  13cd29:	83 f8 14             	cmp    eax,0x14
  13cd2c:	77 61                	ja     13cd8f <init_tty+0x20d>
  13cd2e:	89 c0                	mov    eax,eax
  13cd30:	48 8b 04 c5 78 eb 13 	mov    rax,QWORD PTR [rax*8+0x13eb78]
  13cd37:	00 
  13cd38:	3e ff e0             	notrack jmp rax
  13cd3b:	c7 05 0b 72 ff ff e8 	mov    DWORD PTR [rip+0xffffffffffff720b],0x3e8        # 133f50 <vpage_size>
  13cd42:	03 00 00 
  13cd45:	eb 49                	jmp    13cd90 <init_tty+0x20e>
  13cd47:	c7 05 ff 71 ff ff d0 	mov    DWORD PTR [rip+0xffffffffffff71ff],0x7d0        # 133f50 <vpage_size>
  13cd4e:	07 00 00 
  13cd51:	eb 3d                	jmp    13cd90 <init_tty+0x20e>
  13cd53:	c7 05 f3 71 ff ff 00 	mov    DWORD PTR [rip+0xffffffffffff71f3],0xfa00        # 133f50 <vpage_size>
  13cd5a:	fa 00 00 
  13cd5d:	eb 31                	jmp    13cd90 <init_tty+0x20e>
  13cd5f:	c7 05 e7 71 ff ff 00 	mov    DWORD PTR [rip+0xffffffffffff71e7],0x1f400        # 133f50 <vpage_size>
  13cd66:	f4 01 00 
  13cd69:	eb 25                	jmp    13cd90 <init_tty+0x20e>
  13cd6b:	c7 05 db 71 ff ff 00 	mov    DWORD PTR [rip+0xffffffffffff71db],0x7d00        # 133f50 <vpage_size>
  13cd72:	7d 00 00 
  13cd75:	eb 19                	jmp    13cd90 <init_tty+0x20e>
  13cd77:	c7 05 cf 71 ff ff 00 	mov    DWORD PTR [rip+0xffffffffffff71cf],0x36b00        # 133f50 <vpage_size>
  13cd7e:	6b 03 00 
  13cd81:	eb 0d                	jmp    13cd90 <init_tty+0x20e>
  13cd83:	c7 05 c3 71 ff ff 00 	mov    DWORD PTR [rip+0xffffffffffff71c3],0x4b000        # 133f50 <vpage_size>
  13cd8a:	b0 04 00 
  13cd8d:	eb 01                	jmp    13cd90 <init_tty+0x20e>
  13cd8f:	90                   	nop
  13cd90:	48 8b 05 89 71 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff7189]        # 133f20 <video_base>
  13cd97:	48 89 05 8a 10 00 00 	mov    QWORD PTR [rip+0x108a],rax        # 13de28 <m_ptr>
  13cd9e:	c7 05 90 71 ff ff 00 	mov    DWORD PTR [rip+0xffffffffffff7190],0x0        # 133f38 <page_boffset>
  13cda5:	00 00 00 
  13cda8:	48 8b 05 71 71 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff7171]        # 133f20 <video_base>
  13cdaf:	48 89 05 7a 71 ff ff 	mov    QWORD PTR [rip+0xffffffffffff717a],rax        # 133f30 <vpage_base>
  13cdb6:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  13cdbb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13cdbf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13cdc2:	0f b6 c0             	movzx  eax,al
  13cdc5:	89 05 75 71 ff ff    	mov    DWORD PTR [rip+0xffffffffffff7175],eax        # 133f40 <vpage>
  13cdcb:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  13cdd0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13cdd4:	48 8d 50 01          	lea    rdx,[rax+0x1]
  13cdd8:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  13cddc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13cddf:	0f b6 c0             	movzx  eax,al
  13cde2:	89 05 74 71 ff ff    	mov    DWORD PTR [rip+0xffffffffffff7174],eax        # 133f5c <stline>
  13cde8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13cdec:	48 8d 50 01          	lea    rdx,[rax+0x1]
  13cdf0:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  13cdf4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13cdf7:	0f b6 c0             	movzx  eax,al
  13cdfa:	89 05 60 71 ff ff    	mov    DWORD PTR [rip+0xffffffffffff7160],eax        # 133f60 <endline>
  13ce00:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13ce04:	48 8d 50 01          	lea    rdx,[rax+0x1]
  13ce08:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  13ce0c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13ce0f:	0f b6 c0             	movzx  eax,al
  13ce12:	89 05 40 71 ff ff    	mov    DWORD PTR [rip+0xffffffffffff7140],eax        # 133f58 <videoy>
  13ce18:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13ce1c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13ce1f:	0f b6 c0             	movzx  eax,al
  13ce22:	89 05 2c 71 ff ff    	mov    DWORD PTR [rip+0xffffffffffff712c],eax        # 133f54 <videox>
  13ce28:	90                   	nop
  13ce29:	c9                   	leave  
  13ce2a:	c3                   	ret    

000000000013ce2b <seek_tty>:
  13ce2b:	f3 0f 1e fa          	endbr64 
  13ce2f:	55                   	push   rbp
  13ce30:	48 89 e5             	mov    rbp,rsp
  13ce33:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  13ce37:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13ce3b:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  13ce3e:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  13ce41:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13ce44:	05 00 c0 05 00       	add    eax,0x5c000
  13ce49:	01 c0                	add    eax,eax
  13ce4b:	48 98                	cdqe   
  13ce4d:	48 89 05 d4 0f 00 00 	mov    QWORD PTR [rip+0xfd4],rax        # 13de28 <m_ptr>
  13ce54:	90                   	nop
  13ce55:	5d                   	pop    rbp
  13ce56:	c3                   	ret    

000000000013ce57 <tell_monitor>:
  13ce57:	f3 0f 1e fa          	endbr64 
  13ce5b:	55                   	push   rbp
  13ce5c:	48 89 e5             	mov    rbp,rsp
  13ce5f:	48 8b 05 c2 0f 00 00 	mov    rax,QWORD PTR [rip+0xfc2]        # 13de28 <m_ptr>
  13ce66:	48 8b 15 b3 70 ff ff 	mov    rdx,QWORD PTR [rip+0xffffffffffff70b3]        # 133f20 <video_base>
  13ce6d:	48 29 d0             	sub    rax,rdx
  13ce70:	48 89 c2             	mov    rdx,rax
  13ce73:	48 c1 ea 3f          	shr    rdx,0x3f
  13ce77:	48 01 d0             	add    rax,rdx
  13ce7a:	48 d1 f8             	sar    rax,1
  13ce7d:	5d                   	pop    rbp
  13ce7e:	c3                   	ret    

000000000013ce7f <del_ch>:
  13ce7f:	f3 0f 1e fa          	endbr64 
  13ce83:	55                   	push   rbp
  13ce84:	48 89 e5             	mov    rbp,rsp
  13ce87:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
  13ce8e:	48 8b 05 93 0f 00 00 	mov    rax,QWORD PTR [rip+0xf93]        # 13de28 <m_ptr>
  13ce95:	48 83 e8 02          	sub    rax,0x2
  13ce99:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  13ce9d:	b8 00 00 00 00       	mov    eax,0x0
  13cea2:	e8 b0 ff ff ff       	call   13ce57 <tell_monitor>
  13cea7:	89 c2                	mov    edx,eax
  13cea9:	48 63 c2             	movsxd rax,edx
  13ceac:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  13ceb3:	48 c1 e8 20          	shr    rax,0x20
  13ceb7:	c1 f8 05             	sar    eax,0x5
  13ceba:	89 d1                	mov    ecx,edx
  13cebc:	c1 f9 1f             	sar    ecx,0x1f
  13cebf:	29 c8                	sub    eax,ecx
  13cec1:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  13cec4:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  13cec7:	89 c8                	mov    eax,ecx
  13cec9:	c1 e0 02             	shl    eax,0x2
  13cecc:	01 c8                	add    eax,ecx
  13cece:	c1 e0 04             	shl    eax,0x4
  13ced1:	29 c2                	sub    edx,eax
  13ced3:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  13ced6:	eb 17                	jmp    13ceef <del_ch+0x70>
  13ced8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13cedc:	0f b6 50 02          	movzx  edx,BYTE PTR [rax+0x2]
  13cee0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13cee4:	88 10                	mov    BYTE PTR [rax],dl
  13cee6:	48 83 45 f8 02       	add    QWORD PTR [rbp-0x8],0x2
  13ceeb:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  13ceef:	83 7d f4 4e          	cmp    DWORD PTR [rbp-0xc],0x4e
  13cef3:	7e e3                	jle    13ced8 <del_ch+0x59>
  13cef5:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  13cefc:	b8 00 00 00 00       	mov    eax,0x0
  13cf01:	b9 18 00 00 00       	mov    ecx,0x18
  13cf06:	48 89 d7             	mov    rdi,rdx
  13cf09:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  13cf0c:	b8 00 00 00 00       	mov    eax,0x0
  13cf11:	e8 41 ff ff ff       	call   13ce57 <tell_monitor>
  13cf16:	83 e8 01             	sub    eax,0x1
  13cf19:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
  13cf1f:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  13cf26:	48 89 c7             	mov    rdi,rax
  13cf29:	e8 fd fe ff ff       	call   13ce2b <seek_tty>
  13cf2e:	b8 00 00 00 00       	mov    eax,0x0
  13cf33:	e8 03 00 00 00       	call   13cf3b <set_cur>
  13cf38:	90                   	nop
  13cf39:	c9                   	leave  
  13cf3a:	c3                   	ret    

000000000013cf3b <set_cur>:
  13cf3b:	f3 0f 1e fa          	endbr64 
  13cf3f:	55                   	push   rbp
  13cf40:	48 89 e5             	mov    rbp,rsp
  13cf43:	fa                   	cli    
  13cf44:	8b 05 fe 6f ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6ffe]        # 133f48 <port_reg_index>
  13cf4a:	0f b7 c0             	movzx  eax,ax
  13cf4d:	be 0e 00 00 00       	mov    esi,0xe
  13cf52:	89 c7                	mov    edi,eax
  13cf54:	e8 e7 bf ff ff       	call   138f40 <outb>
  13cf59:	48 8b 05 c8 0e 00 00 	mov    rax,QWORD PTR [rip+0xec8]        # 13de28 <m_ptr>
  13cf60:	48 8b 15 b9 6f ff ff 	mov    rdx,QWORD PTR [rip+0xffffffffffff6fb9]        # 133f20 <video_base>
  13cf67:	48 29 d0             	sub    rax,rdx
  13cf6a:	48 c1 f8 09          	sar    rax,0x9
  13cf6e:	0f b6 d0             	movzx  edx,al
  13cf71:	8b 05 d5 6f ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6fd5]        # 133f4c <port_reg_v>
  13cf77:	0f b7 c0             	movzx  eax,ax
  13cf7a:	89 d6                	mov    esi,edx
  13cf7c:	89 c7                	mov    edi,eax
  13cf7e:	e8 bd bf ff ff       	call   138f40 <outb>
  13cf83:	8b 05 bf 6f ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6fbf]        # 133f48 <port_reg_index>
  13cf89:	0f b7 c0             	movzx  eax,ax
  13cf8c:	be 0f 00 00 00       	mov    esi,0xf
  13cf91:	89 c7                	mov    edi,eax
  13cf93:	e8 a8 bf ff ff       	call   138f40 <outb>
  13cf98:	48 8b 05 89 0e 00 00 	mov    rax,QWORD PTR [rip+0xe89]        # 13de28 <m_ptr>
  13cf9f:	48 8b 15 7a 6f ff ff 	mov    rdx,QWORD PTR [rip+0xffffffffffff6f7a]        # 133f20 <video_base>
  13cfa6:	48 29 d0             	sub    rax,rdx
  13cfa9:	48 d1 f8             	sar    rax,1
  13cfac:	0f b6 d0             	movzx  edx,al
  13cfaf:	8b 05 97 6f ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6f97]        # 133f4c <port_reg_v>
  13cfb5:	0f b7 c0             	movzx  eax,ax
  13cfb8:	89 d6                	mov    esi,edx
  13cfba:	89 c7                	mov    edi,eax
  13cfbc:	e8 7f bf ff ff       	call   138f40 <outb>
  13cfc1:	fb                   	sti    
  13cfc2:	90                   	nop
  13cfc3:	5d                   	pop    rbp
  13cfc4:	c3                   	ret    

000000000013cfc5 <read_tty>:
  13cfc5:	f3 0f 1e fa          	endbr64 
  13cfc9:	55                   	push   rbp
  13cfca:	48 89 e5             	mov    rbp,rsp
  13cfcd:	48 83 ec 20          	sub    rsp,0x20
  13cfd1:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  13cfd5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13cfd9:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  13cfdc:	48 98                	cdqe   
  13cfde:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  13cfe2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13cfe6:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  13cfe9:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
  13cfec:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  13cff3:	eb 4a                	jmp    13d03f <read_tty+0x7a>
  13cff5:	48 8b 15 2c 0e 00 00 	mov    rdx,QWORD PTR [rip+0xe2c]        # 13de28 <m_ptr>
  13cffc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13d000:	48 8d 48 01          	lea    rcx,[rax+0x1]
  13d004:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  13d008:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  13d00b:	88 10                	mov    BYTE PTR [rax],dl
  13d00d:	48 8b 05 14 0e 00 00 	mov    rax,QWORD PTR [rip+0xe14]        # 13de28 <m_ptr>
  13d014:	48 3d ff ff 0b 00    	cmp    rax,0xbffff
  13d01a:	75 0d                	jne    13d029 <read_tty+0x64>
  13d01c:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  13d020:	7e 07                	jle    13d029 <read_tty+0x64>
  13d022:	b8 01 00 00 00       	mov    eax,0x1
  13d027:	eb 2d                	jmp    13d056 <read_tty+0x91>
  13d029:	48 8b 05 f8 0d 00 00 	mov    rax,QWORD PTR [rip+0xdf8]        # 13de28 <m_ptr>
  13d030:	48 83 c0 02          	add    rax,0x2
  13d034:	48 89 05 ed 0d 00 00 	mov    QWORD PTR [rip+0xded],rax        # 13de28 <m_ptr>
  13d03b:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  13d03f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  13d042:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  13d045:	7c ae                	jl     13cff5 <read_tty+0x30>
  13d047:	b8 00 00 00 00       	mov    eax,0x0
  13d04c:	e8 ea fe ff ff       	call   13cf3b <set_cur>
  13d051:	b8 00 00 00 00       	mov    eax,0x0
  13d056:	c9                   	leave  
  13d057:	c3                   	ret    

000000000013d058 <write_tty>:
  13d058:	f3 0f 1e fa          	endbr64 
  13d05c:	55                   	push   rbp
  13d05d:	48 89 e5             	mov    rbp,rsp
  13d060:	48 83 ec 30          	sub    rsp,0x30
  13d064:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  13d068:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  13d06c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  13d06f:	48 98                	cdqe   
  13d071:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  13d075:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  13d079:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  13d07c:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
  13d07f:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  13d086:	e9 0b 01 00 00       	jmp    13d196 <write_tty+0x13e>
  13d08b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13d08f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13d092:	3c 0a                	cmp    al,0xa
  13d094:	75 50                	jne    13d0e6 <write_tty+0x8e>
  13d096:	48 8b 05 8b 0d 00 00 	mov    rax,QWORD PTR [rip+0xd8b]        # 13de28 <m_ptr>
  13d09d:	48 2d 00 80 0b 00    	sub    rax,0xb8000
  13d0a3:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  13d0a6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  13d0a9:	89 c2                	mov    edx,eax
  13d0ab:	b8 cd cc cc cc       	mov    eax,0xcccccccd
  13d0b0:	48 0f af c2          	imul   rax,rdx
  13d0b4:	48 c1 e8 20          	shr    rax,0x20
  13d0b8:	c1 e8 07             	shr    eax,0x7
  13d0bb:	8d 50 01             	lea    edx,[rax+0x1]
  13d0be:	89 d0                	mov    eax,edx
  13d0c0:	c1 e0 02             	shl    eax,0x2
  13d0c3:	01 d0                	add    eax,edx
  13d0c5:	c1 e0 05             	shl    eax,0x5
  13d0c8:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  13d0cb:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  13d0ce:	05 00 80 0b 00       	add    eax,0xb8000
  13d0d3:	89 c0                	mov    eax,eax
  13d0d5:	48 89 05 4c 0d 00 00 	mov    QWORD PTR [rip+0xd4c],rax        # 13de28 <m_ptr>
  13d0dc:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  13d0e1:	e9 ac 00 00 00       	jmp    13d192 <write_tty+0x13a>
  13d0e6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13d0ea:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13d0ed:	84 c0                	test   al,al
  13d0ef:	0f 84 af 00 00 00    	je     13d1a4 <write_tty+0x14c>
  13d0f5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13d0f9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13d0fc:	3c 08                	cmp    al,0x8
  13d0fe:	75 1e                	jne    13d11e <write_tty+0xc6>
  13d100:	48 8b 05 21 0d 00 00 	mov    rax,QWORD PTR [rip+0xd21]        # 13de28 <m_ptr>
  13d107:	48 83 e8 02          	sub    rax,0x2
  13d10b:	48 89 05 16 0d 00 00 	mov    QWORD PTR [rip+0xd16],rax        # 13de28 <m_ptr>
  13d112:	48 8b 05 0f 0d 00 00 	mov    rax,QWORD PTR [rip+0xd0f]        # 13de28 <m_ptr>
  13d119:	c6 00 00             	mov    BYTE PTR [rax],0x0
  13d11c:	eb 3e                	jmp    13d15c <write_tty+0x104>
  13d11e:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  13d122:	48 8d 42 01          	lea    rax,[rdx+0x1]
  13d126:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  13d12a:	48 8b 05 f7 0c 00 00 	mov    rax,QWORD PTR [rip+0xcf7]        # 13de28 <m_ptr>
  13d131:	48 8d 48 01          	lea    rcx,[rax+0x1]
  13d135:	48 89 0d ec 0c 00 00 	mov    QWORD PTR [rip+0xcec],rcx        # 13de28 <m_ptr>
  13d13c:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  13d13f:	88 10                	mov    BYTE PTR [rax],dl
  13d141:	48 8b 05 e0 0c 00 00 	mov    rax,QWORD PTR [rip+0xce0]        # 13de28 <m_ptr>
  13d148:	48 8d 50 01          	lea    rdx,[rax+0x1]
  13d14c:	48 89 15 d5 0c 00 00 	mov    QWORD PTR [rip+0xcd5],rdx        # 13de28 <m_ptr>
  13d153:	0f b6 15 d6 0c 00 00 	movzx  edx,BYTE PTR [rip+0xcd6]        # 13de30 <m_color>
  13d15a:	88 10                	mov    BYTE PTR [rax],dl
  13d15c:	48 8b 05 c5 0c 00 00 	mov    rax,QWORD PTR [rip+0xcc5]        # 13de28 <m_ptr>
  13d163:	48 8b 0d c6 6d ff ff 	mov    rcx,QWORD PTR [rip+0xffffffffffff6dc6]        # 133f30 <vpage_base>
  13d16a:	48 29 c8             	sub    rax,rcx
  13d16d:	48 89 c2             	mov    rdx,rax
  13d170:	8b 05 da 6d ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6dda]        # 133f50 <vpage_size>
  13d176:	8b 0d c8 6d ff ff    	mov    ecx,DWORD PTR [rip+0xffffffffffff6dc8]        # 133f44 <line_chs>
  13d17c:	29 c8                	sub    eax,ecx
  13d17e:	01 c0                	add    eax,eax
  13d180:	48 98                	cdqe   
  13d182:	48 39 c2             	cmp    rdx,rax
  13d185:	7c 0b                	jl     13d192 <write_tty+0x13a>
  13d187:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  13d18b:	7e 05                	jle    13d192 <write_tty+0x13a>
  13d18d:	e8 bc f8 ff ff       	call   13ca4e <scrdown>
  13d192:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  13d196:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  13d199:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  13d19c:	0f 8c e9 fe ff ff    	jl     13d08b <write_tty+0x33>
  13d1a2:	eb 01                	jmp    13d1a5 <write_tty+0x14d>
  13d1a4:	90                   	nop
  13d1a5:	b8 00 00 00 00       	mov    eax,0x0
  13d1aa:	e8 8c fd ff ff       	call   13cf3b <set_cur>
  13d1af:	b8 00 00 00 00       	mov    eax,0x0
  13d1b4:	c9                   	leave  
  13d1b5:	c3                   	ret    

000000000013d1b6 <cls>:
  13d1b6:	f3 0f 1e fa          	endbr64 
  13d1ba:	55                   	push   rbp
  13d1bb:	48 89 e5             	mov    rbp,rsp
  13d1be:	48 83 ec 20          	sub    rsp,0x20
  13d1c2:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  13d1c6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  13d1cd:	eb 16                	jmp    13d1e5 <cls+0x2f>
  13d1cf:	48 8b 15 5a 6d ff ff 	mov    rdx,QWORD PTR [rip+0xffffffffffff6d5a]        # 133f30 <vpage_base>
  13d1d6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13d1d9:	48 98                	cdqe   
  13d1db:	48 01 d0             	add    rax,rdx
  13d1de:	c6 00 00             	mov    BYTE PTR [rax],0x0
  13d1e1:	83 45 fc 02          	add    DWORD PTR [rbp-0x4],0x2
  13d1e5:	8b 05 65 6d ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6d65]        # 133f50 <vpage_size>
  13d1eb:	01 c0                	add    eax,eax
  13d1ed:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  13d1f0:	7c dd                	jl     13d1cf <cls+0x19>
  13d1f2:	48 8b 05 37 6d ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff6d37]        # 133f30 <vpage_base>
  13d1f9:	48 89 05 28 0c 00 00 	mov    QWORD PTR [rip+0xc28],rax        # 13de28 <m_ptr>
  13d200:	b8 00 00 00 00       	mov    eax,0x0
  13d205:	e8 31 fd ff ff       	call   13cf3b <set_cur>
  13d20a:	90                   	nop
  13d20b:	c9                   	leave  
  13d20c:	c3                   	ret    

000000000013d20d <set_color>:
  13d20d:	f3 0f 1e fa          	endbr64 
  13d211:	55                   	push   rbp
  13d212:	48 89 e5             	mov    rbp,rsp
  13d215:	89 f8                	mov    eax,edi
  13d217:	88 45 fc             	mov    BYTE PTR [rbp-0x4],al
  13d21a:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  13d21e:	88 05 0c 0c 00 00    	mov    BYTE PTR [rip+0xc0c],al        # 13de30 <m_color>
  13d224:	90                   	nop
  13d225:	5d                   	pop    rbp
  13d226:	c3                   	ret    

000000000013d227 <tty_do_req>:
  13d227:	f3 0f 1e fa          	endbr64 
  13d22b:	55                   	push   rbp
  13d22c:	48 89 e5             	mov    rbp,rsp
  13d22f:	48 83 ec 10          	sub    rsp,0x10
  13d233:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  13d237:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13d23b:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  13d241:	83 f8 0d             	cmp    eax,0xd
  13d244:	74 45                	je     13d28b <tty_do_req+0x64>
  13d246:	83 f8 0d             	cmp    eax,0xd
  13d249:	7f 53                	jg     13d29e <tty_do_req+0x77>
  13d24b:	83 f8 0c             	cmp    eax,0xc
  13d24e:	74 2d                	je     13d27d <tty_do_req+0x56>
  13d250:	83 f8 0c             	cmp    eax,0xc
  13d253:	7f 49                	jg     13d29e <tty_do_req+0x77>
  13d255:	83 f8 02             	cmp    eax,0x2
  13d258:	74 07                	je     13d261 <tty_do_req+0x3a>
  13d25a:	83 f8 03             	cmp    eax,0x3
  13d25d:	74 10                	je     13d26f <tty_do_req+0x48>
  13d25f:	eb 3d                	jmp    13d29e <tty_do_req+0x77>
  13d261:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13d265:	48 89 c7             	mov    rdi,rax
  13d268:	e8 58 fd ff ff       	call   13cfc5 <read_tty>
  13d26d:	eb 36                	jmp    13d2a5 <tty_do_req+0x7e>
  13d26f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13d273:	48 89 c7             	mov    rdi,rax
  13d276:	e8 dd fd ff ff       	call   13d058 <write_tty>
  13d27b:	eb 28                	jmp    13d2a5 <tty_do_req+0x7e>
  13d27d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13d281:	48 89 c7             	mov    rdi,rax
  13d284:	e8 a2 fb ff ff       	call   13ce2b <seek_tty>
  13d289:	eb 1a                	jmp    13d2a5 <tty_do_req+0x7e>
  13d28b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13d28f:	48 89 c7             	mov    rdi,rax
  13d292:	b8 00 00 00 00       	mov    eax,0x0
  13d297:	e8 bb fb ff ff       	call   13ce57 <tell_monitor>
  13d29c:	eb 07                	jmp    13d2a5 <tty_do_req+0x7e>
  13d29e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  13d2a3:	eb 05                	jmp    13d2aa <tty_do_req+0x83>
  13d2a5:	b8 00 00 00 00       	mov    eax,0x0
  13d2aa:	c9                   	leave  
  13d2ab:	c3                   	ret    

000000000013d2ac <memcpy>:
  13d2ac:	f3 0f 1e fa          	endbr64 
  13d2b0:	55                   	push   rbp
  13d2b1:	48 89 e5             	mov    rbp,rsp
  13d2b4:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  13d2b8:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  13d2bc:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
  13d2bf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13d2c3:	c6 00 ff             	mov    BYTE PTR [rax],0xff
  13d2c6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  13d2cd:	eb 1b                	jmp    13d2ea <memcpy+0x3e>
  13d2cf:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  13d2d3:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  13d2d6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13d2da:	88 10                	mov    BYTE PTR [rax],dl
  13d2dc:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  13d2e1:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
  13d2e6:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  13d2ea:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13d2ed:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
  13d2f0:	77 dd                	ja     13d2cf <memcpy+0x23>
  13d2f2:	90                   	nop
  13d2f3:	90                   	nop
  13d2f4:	5d                   	pop    rbp
  13d2f5:	c3                   	ret    

000000000013d2f6 <memcmp>:
  13d2f6:	f3 0f 1e fa          	endbr64 
  13d2fa:	55                   	push   rbp
  13d2fb:	48 89 e5             	mov    rbp,rsp
  13d2fe:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  13d302:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  13d306:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
  13d309:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  13d310:	eb 3a                	jmp    13d34c <memcmp+0x56>
  13d312:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13d316:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  13d319:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  13d31d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13d320:	38 c2                	cmp    dl,al
  13d322:	74 1a                	je     13d33e <memcmp+0x48>
  13d324:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13d328:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13d32b:	0f b6 d0             	movzx  edx,al
  13d32e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  13d332:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13d335:	0f b6 c8             	movzx  ecx,al
  13d338:	89 d0                	mov    eax,edx
  13d33a:	29 c8                	sub    eax,ecx
  13d33c:	eb 1b                	jmp    13d359 <memcmp+0x63>
  13d33e:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  13d343:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
  13d348:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  13d34c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13d34f:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  13d352:	7c be                	jl     13d312 <memcmp+0x1c>
  13d354:	b8 00 00 00 00       	mov    eax,0x0
  13d359:	5d                   	pop    rbp
  13d35a:	c3                   	ret    

000000000013d35b <memset>:
  13d35b:	f3 0f 1e fa          	endbr64 
  13d35f:	55                   	push   rbp
  13d360:	48 89 e5             	mov    rbp,rsp
  13d363:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  13d367:	89 f0                	mov    eax,esi
  13d369:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
  13d36c:	88 45 e4             	mov    BYTE PTR [rbp-0x1c],al
  13d36f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  13d376:	eb 16                	jmp    13d38e <memset+0x33>
  13d378:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13d37c:	48 8d 50 01          	lea    rdx,[rax+0x1]
  13d380:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  13d384:	0f b6 55 e4          	movzx  edx,BYTE PTR [rbp-0x1c]
  13d388:	88 10                	mov    BYTE PTR [rax],dl
  13d38a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  13d38e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13d391:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  13d394:	72 e2                	jb     13d378 <memset+0x1d>
  13d396:	90                   	nop
  13d397:	90                   	nop
  13d398:	5d                   	pop    rbp
  13d399:	c3                   	ret    

000000000013d39a <get_mem_size>:
  13d39a:	f3 0f 1e fa          	endbr64 
  13d39e:	55                   	push   rbp
  13d39f:	48 89 e5             	mov    rbp,rsp
  13d3a2:	8b 05 bc 6b ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6bbc]        # 133f64 <mem_end>
  13d3a8:	5d                   	pop    rbp
  13d3a9:	c3                   	ret    

000000000013d3aa <strcpy>:
  13d3aa:	f3 0f 1e fa          	endbr64 
  13d3ae:	55                   	push   rbp
  13d3af:	48 89 e5             	mov    rbp,rsp
  13d3b2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  13d3b6:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  13d3ba:	eb 1d                	jmp    13d3d9 <strcpy+0x2f>
  13d3bc:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  13d3c0:	48 8d 42 01          	lea    rax,[rdx+0x1]
  13d3c4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  13d3c8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13d3cc:	48 8d 48 01          	lea    rcx,[rax+0x1]
  13d3d0:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  13d3d4:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  13d3d7:	88 10                	mov    BYTE PTR [rax],dl
  13d3d9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  13d3dd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13d3e0:	84 c0                	test   al,al
  13d3e2:	75 d8                	jne    13d3bc <strcpy+0x12>
  13d3e4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13d3e8:	c6 00 00             	mov    BYTE PTR [rax],0x0
  13d3eb:	90                   	nop
  13d3ec:	5d                   	pop    rbp
  13d3ed:	c3                   	ret    

000000000013d3ee <strtok>:
  13d3ee:	f3 0f 1e fa          	endbr64 
  13d3f2:	55                   	push   rbp
  13d3f3:	48 89 e5             	mov    rbp,rsp
  13d3f6:	48 83 ec 30          	sub    rsp,0x30
  13d3fa:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  13d3fe:	89 f0                	mov    eax,esi
  13d400:	88 45 d4             	mov    BYTE PTR [rbp-0x2c],al
  13d403:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  13d408:	0f 84 9c 00 00 00    	je     13d4aa <strtok+0xbc>
  13d40e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  13d412:	48 89 c6             	mov    rsi,rax
  13d415:	bf 80 3f 13 00       	mov    edi,0x133f80
  13d41a:	e8 8b ff ff ff       	call   13d3aa <strcpy>
  13d41f:	48 c7 45 e8 80 3f 13 	mov    QWORD PTR [rbp-0x18],0x133f80
  13d426:	00 
  13d427:	c7 05 4f 6d ff ff 00 	mov    DWORD PTR [rip+0xffffffffffff6d4f],0x0        # 134180 <tokptr>
  13d42e:	00 00 00 
  13d431:	eb 1c                	jmp    13d44f <strtok+0x61>
  13d433:	8b 05 47 6d ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6d47]        # 134180 <tokptr>
  13d439:	83 c0 01             	add    eax,0x1
  13d43c:	99                   	cdq    
  13d43d:	c1 ea 17             	shr    edx,0x17
  13d440:	01 d0                	add    eax,edx
  13d442:	25 ff 01 00 00       	and    eax,0x1ff
  13d447:	29 d0                	sub    eax,edx
  13d449:	89 05 31 6d ff ff    	mov    DWORD PTR [rip+0xffffffffffff6d31],eax        # 134180 <tokptr>
  13d44f:	8b 05 2b 6d ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6d2b]        # 134180 <tokptr>
  13d455:	48 98                	cdqe   
  13d457:	0f b6 80 80 3f 13 00 	movzx  eax,BYTE PTR [rax+0x133f80]
  13d45e:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  13d461:	74 13                	je     13d476 <strtok+0x88>
  13d463:	8b 05 17 6d ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6d17]        # 134180 <tokptr>
  13d469:	48 98                	cdqe   
  13d46b:	0f b6 80 80 3f 13 00 	movzx  eax,BYTE PTR [rax+0x133f80]
  13d472:	84 c0                	test   al,al
  13d474:	75 bd                	jne    13d433 <strtok+0x45>
  13d476:	8b 05 04 6d ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6d04]        # 134180 <tokptr>
  13d47c:	48 98                	cdqe   
  13d47e:	c6 80 80 3f 13 00 00 	mov    BYTE PTR [rax+0x133f80],0x0
  13d485:	8b 05 f5 6c ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6cf5]        # 134180 <tokptr>
  13d48b:	83 c0 01             	add    eax,0x1
  13d48e:	99                   	cdq    
  13d48f:	c1 ea 17             	shr    edx,0x17
  13d492:	01 d0                	add    eax,edx
  13d494:	25 ff 01 00 00       	and    eax,0x1ff
  13d499:	29 d0                	sub    eax,edx
  13d49b:	89 05 df 6c ff ff    	mov    DWORD PTR [rip+0xffffffffffff6cdf],eax        # 134180 <tokptr>
  13d4a1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13d4a5:	e9 9e 00 00 00       	jmp    13d548 <strtok+0x15a>
  13d4aa:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  13d4b1:	8b 05 c9 6c ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6cc9]        # 134180 <tokptr>
  13d4b7:	48 98                	cdqe   
  13d4b9:	48 05 80 3f 13 00    	add    rax,0x133f80
  13d4bf:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  13d4c3:	eb 20                	jmp    13d4e5 <strtok+0xf7>
  13d4c5:	8b 05 b5 6c ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6cb5]        # 134180 <tokptr>
  13d4cb:	83 c0 01             	add    eax,0x1
  13d4ce:	99                   	cdq    
  13d4cf:	c1 ea 17             	shr    edx,0x17
  13d4d2:	01 d0                	add    eax,edx
  13d4d4:	25 ff 01 00 00       	and    eax,0x1ff
  13d4d9:	29 d0                	sub    eax,edx
  13d4db:	89 05 9f 6c ff ff    	mov    DWORD PTR [rip+0xffffffffffff6c9f],eax        # 134180 <tokptr>
  13d4e1:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  13d4e5:	8b 05 95 6c ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6c95]        # 134180 <tokptr>
  13d4eb:	48 98                	cdqe   
  13d4ed:	0f b6 80 80 3f 13 00 	movzx  eax,BYTE PTR [rax+0x133f80]
  13d4f4:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  13d4f7:	74 13                	je     13d50c <strtok+0x11e>
  13d4f9:	8b 05 81 6c ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6c81]        # 134180 <tokptr>
  13d4ff:	48 98                	cdqe   
  13d501:	0f b6 80 80 3f 13 00 	movzx  eax,BYTE PTR [rax+0x133f80]
  13d508:	84 c0                	test   al,al
  13d50a:	75 b9                	jne    13d4c5 <strtok+0xd7>
  13d50c:	8b 05 6e 6c ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6c6e]        # 134180 <tokptr>
  13d512:	48 98                	cdqe   
  13d514:	c6 80 80 3f 13 00 00 	mov    BYTE PTR [rax+0x133f80],0x0
  13d51b:	8b 05 5f 6c ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6c5f]        # 134180 <tokptr>
  13d521:	83 c0 01             	add    eax,0x1
  13d524:	99                   	cdq    
  13d525:	c1 ea 17             	shr    edx,0x17
  13d528:	01 d0                	add    eax,edx
  13d52a:	25 ff 01 00 00       	and    eax,0x1ff
  13d52f:	29 d0                	sub    eax,edx
  13d531:	89 05 49 6c ff ff    	mov    DWORD PTR [rip+0xffffffffffff6c49],eax        # 134180 <tokptr>
  13d537:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  13d53b:	74 06                	je     13d543 <strtok+0x155>
  13d53d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  13d541:	eb 05                	jmp    13d548 <strtok+0x15a>
  13d543:	b8 00 00 00 00       	mov    eax,0x0
  13d548:	c9                   	leave  
  13d549:	c3                   	ret    

000000000013d54a <strcmp>:
  13d54a:	f3 0f 1e fa          	endbr64 
  13d54e:	55                   	push   rbp
  13d54f:	48 89 e5             	mov    rbp,rsp
  13d552:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  13d556:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  13d55a:	eb 3c                	jmp    13d598 <strcmp+0x4e>
  13d55c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13d560:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  13d563:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  13d567:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13d56a:	38 c2                	cmp    dl,al
  13d56c:	7e 07                	jle    13d575 <strcmp+0x2b>
  13d56e:	b8 01 00 00 00       	mov    eax,0x1
  13d573:	eb 52                	jmp    13d5c7 <strcmp+0x7d>
  13d575:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13d579:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  13d57c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  13d580:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13d583:	38 c2                	cmp    dl,al
  13d585:	7d 07                	jge    13d58e <strcmp+0x44>
  13d587:	b8 ff ff ff ff       	mov    eax,0xffffffff
  13d58c:	eb 39                	jmp    13d5c7 <strcmp+0x7d>
  13d58e:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  13d593:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  13d598:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13d59c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13d59f:	84 c0                	test   al,al
  13d5a1:	74 0b                	je     13d5ae <strcmp+0x64>
  13d5a3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  13d5a7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13d5aa:	84 c0                	test   al,al
  13d5ac:	75 ae                	jne    13d55c <strcmp+0x12>
  13d5ae:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13d5b2:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  13d5b5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  13d5b9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13d5bc:	38 c2                	cmp    dl,al
  13d5be:	75 07                	jne    13d5c7 <strcmp+0x7d>
  13d5c0:	b8 00 00 00 00       	mov    eax,0x0
  13d5c5:	eb 00                	jmp    13d5c7 <strcmp+0x7d>
  13d5c7:	5d                   	pop    rbp
  13d5c8:	c3                   	ret    

000000000013d5c9 <strlen>:
  13d5c9:	f3 0f 1e fa          	endbr64 
  13d5cd:	55                   	push   rbp
  13d5ce:	48 89 e5             	mov    rbp,rsp
  13d5d1:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  13d5d5:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  13d5dc:	eb 09                	jmp    13d5e7 <strlen+0x1e>
  13d5de:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  13d5e3:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  13d5e7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13d5eb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13d5ee:	84 c0                	test   al,al
  13d5f0:	75 ec                	jne    13d5de <strlen+0x15>
  13d5f2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13d5f5:	5d                   	pop    rbp
  13d5f6:	c3                   	ret    

000000000013d5f7 <sprintf>:
  13d5f7:	f3 0f 1e fa          	endbr64 
  13d5fb:	55                   	push   rbp
  13d5fc:	48 89 e5             	mov    rbp,rsp
  13d5ff:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  13d606:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  13d60d:	48 89 b5 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rsi
  13d614:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  13d61b:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  13d622:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  13d629:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  13d630:	84 c0                	test   al,al
  13d632:	74 20                	je     13d654 <sprintf+0x5d>
  13d634:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  13d638:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  13d63c:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  13d640:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  13d644:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  13d648:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  13d64c:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  13d650:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7
  13d654:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  13d65b:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
  13d662:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  13d669:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
  13d670:	c7 85 3c ff ff ff 00 	mov    DWORD PTR [rbp-0xc4],0x0
  13d677:	00 00 00 
  13d67a:	eb 39                	jmp    13d6b5 <sprintf+0xbe>
  13d67c:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  13d683:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13d686:	3c 25                	cmp    al,0x25
  13d688:	75 15                	jne    13d69f <sprintf+0xa8>
  13d68a:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  13d691:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13d694:	3c 25                	cmp    al,0x25
  13d696:	74 07                	je     13d69f <sprintf+0xa8>
  13d698:	83 85 3c ff ff ff 01 	add    DWORD PTR [rbp-0xc4],0x1
  13d69f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  13d6a6:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
  13d6ad:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  13d6b4:	01 
  13d6b5:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  13d6bc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13d6bf:	3c 0a                	cmp    al,0xa
  13d6c1:	75 b9                	jne    13d67c <sprintf+0x85>
  13d6c3:	c7 85 08 ff ff ff 10 	mov    DWORD PTR [rbp-0xf8],0x10
  13d6ca:	00 00 00 
  13d6cd:	c7 85 0c ff ff ff 30 	mov    DWORD PTR [rbp-0xf4],0x30
  13d6d4:	00 00 00 
  13d6d7:	48 8d 45 10          	lea    rax,[rbp+0x10]
  13d6db:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  13d6e2:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  13d6e9:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
  13d6f0:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  13d6f7:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
  13d6fe:	e9 e2 01 00 00       	jmp    13d8e5 <sprintf+0x2ee>
  13d703:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  13d70a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13d70d:	3c 25                	cmp    al,0x25
  13d70f:	0f 85 aa 01 00 00    	jne    13d8bf <sprintf+0x2c8>
  13d715:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  13d71c:	48 83 c0 01          	add    rax,0x1
  13d720:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13d723:	84 c0                	test   al,al
  13d725:	0f 84 94 01 00 00    	je     13d8bf <sprintf+0x2c8>
  13d72b:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  13d732:	01 
  13d733:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  13d73a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13d73d:	3c 78                	cmp    al,0x78
  13d73f:	75 64                	jne    13d7a5 <sprintf+0x1ae>
  13d741:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  13d747:	83 f8 2f             	cmp    eax,0x2f
  13d74a:	77 23                	ja     13d76f <sprintf+0x178>
  13d74c:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  13d753:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  13d759:	89 d2                	mov    edx,edx
  13d75b:	48 01 d0             	add    rax,rdx
  13d75e:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  13d764:	83 c2 08             	add    edx,0x8
  13d767:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  13d76d:	eb 12                	jmp    13d781 <sprintf+0x18a>
  13d76f:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  13d776:	48 8d 50 08          	lea    rdx,[rax+0x8]
  13d77a:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  13d781:	8b 00                	mov    eax,DWORD PTR [rax]
  13d783:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  13d789:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
  13d78f:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  13d796:	89 d6                	mov    esi,edx
  13d798:	48 89 c7             	mov    rdi,rax
  13d79b:	e8 4e 02 00 00       	call   13d9ee <sprint_hex>
  13d7a0:	e9 38 01 00 00       	jmp    13d8dd <sprintf+0x2e6>
  13d7a5:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  13d7ac:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13d7af:	3c 73                	cmp    al,0x73
  13d7b1:	75 68                	jne    13d81b <sprintf+0x224>
  13d7b3:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  13d7b9:	83 f8 2f             	cmp    eax,0x2f
  13d7bc:	77 23                	ja     13d7e1 <sprintf+0x1ea>
  13d7be:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  13d7c5:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  13d7cb:	89 d2                	mov    edx,edx
  13d7cd:	48 01 d0             	add    rax,rdx
  13d7d0:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  13d7d6:	83 c2 08             	add    edx,0x8
  13d7d9:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  13d7df:	eb 12                	jmp    13d7f3 <sprintf+0x1fc>
  13d7e1:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  13d7e8:	48 8d 50 08          	lea    rdx,[rax+0x8]
  13d7ec:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  13d7f3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  13d7f6:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
  13d7fd:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
  13d804:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  13d80b:	48 89 d6             	mov    rsi,rdx
  13d80e:	48 89 c7             	mov    rdi,rax
  13d811:	e8 5a 02 00 00       	call   13da70 <sprintn>
  13d816:	e9 c2 00 00 00       	jmp    13d8dd <sprintf+0x2e6>
  13d81b:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  13d822:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13d825:	3c 64                	cmp    al,0x64
  13d827:	75 66                	jne    13d88f <sprintf+0x298>
  13d829:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  13d82f:	83 f8 2f             	cmp    eax,0x2f
  13d832:	77 23                	ja     13d857 <sprintf+0x260>
  13d834:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  13d83b:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  13d841:	89 d2                	mov    edx,edx
  13d843:	48 01 d0             	add    rax,rdx
  13d846:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  13d84c:	83 c2 08             	add    edx,0x8
  13d84f:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  13d855:	eb 12                	jmp    13d869 <sprintf+0x272>
  13d857:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  13d85e:	48 8d 50 08          	lea    rdx,[rax+0x8]
  13d862:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  13d869:	48 8b 00             	mov    rax,QWORD PTR [rax]
  13d86c:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
  13d873:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  13d87a:	89 c2                	mov    edx,eax
  13d87c:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  13d883:	89 d6                	mov    esi,edx
  13d885:	48 89 c7             	mov    rdi,rax
  13d888:	e8 ad 00 00 00       	call   13d93a <sprint_decimal>
  13d88d:	eb 4e                	jmp    13d8dd <sprintf+0x2e6>
  13d88f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  13d896:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13d899:	3c 63                	cmp    al,0x63
  13d89b:	75 02                	jne    13d89f <sprintf+0x2a8>
  13d89d:	0f 0b                	ud2    
  13d89f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  13d8a6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13d8a9:	0f be d0             	movsx  edx,al
  13d8ac:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  13d8b3:	89 d6                	mov    esi,edx
  13d8b5:	48 89 c7             	mov    rdi,rax
  13d8b8:	e8 3e 00 00 00       	call   13d8fb <sprintchar>
  13d8bd:	eb 1e                	jmp    13d8dd <sprintf+0x2e6>
  13d8bf:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  13d8c6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13d8c9:	0f be d0             	movsx  edx,al
  13d8cc:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  13d8d3:	89 d6                	mov    esi,edx
  13d8d5:	48 89 c7             	mov    rdi,rax
  13d8d8:	e8 1e 00 00 00       	call   13d8fb <sprintchar>
  13d8dd:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  13d8e4:	01 
  13d8e5:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  13d8ec:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13d8ef:	84 c0                	test   al,al
  13d8f1:	0f 85 0c fe ff ff    	jne    13d703 <sprintf+0x10c>
  13d8f7:	90                   	nop
  13d8f8:	90                   	nop
  13d8f9:	c9                   	leave  
  13d8fa:	c3                   	ret    

000000000013d8fb <sprintchar>:
  13d8fb:	f3 0f 1e fa          	endbr64 
  13d8ff:	55                   	push   rbp
  13d900:	48 89 e5             	mov    rbp,rsp
  13d903:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  13d907:	89 f0                	mov    eax,esi
  13d909:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
  13d90c:	eb 05                	jmp    13d913 <sprintchar+0x18>
  13d90e:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  13d913:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13d917:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13d91a:	84 c0                	test   al,al
  13d91c:	75 f0                	jne    13d90e <sprintchar+0x13>
  13d91e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13d922:	48 8d 50 01          	lea    rdx,[rax+0x1]
  13d926:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  13d92a:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  13d92e:	88 10                	mov    BYTE PTR [rax],dl
  13d930:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13d934:	c6 00 00             	mov    BYTE PTR [rax],0x0
  13d937:	90                   	nop
  13d938:	5d                   	pop    rbp
  13d939:	c3                   	ret    

000000000013d93a <sprint_decimal>:
  13d93a:	f3 0f 1e fa          	endbr64 
  13d93e:	55                   	push   rbp
  13d93f:	48 89 e5             	mov    rbp,rsp
  13d942:	48 83 ec 30          	sub    rsp,0x30
  13d946:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  13d94a:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
  13d94d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  13d954:	eb 65                	jmp    13d9bb <sprint_decimal+0x81>
  13d956:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  13d959:	48 63 c2             	movsxd rax,edx
  13d95c:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  13d963:	48 c1 e8 20          	shr    rax,0x20
  13d967:	c1 f8 02             	sar    eax,0x2
  13d96a:	89 d6                	mov    esi,edx
  13d96c:	c1 fe 1f             	sar    esi,0x1f
  13d96f:	29 f0                	sub    eax,esi
  13d971:	89 c1                	mov    ecx,eax
  13d973:	89 c8                	mov    eax,ecx
  13d975:	c1 e0 02             	shl    eax,0x2
  13d978:	01 c8                	add    eax,ecx
  13d97a:	01 c0                	add    eax,eax
  13d97c:	89 d1                	mov    ecx,edx
  13d97e:	29 c1                	sub    ecx,eax
  13d980:	89 c8                	mov    eax,ecx
  13d982:	83 c0 30             	add    eax,0x30
  13d985:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
  13d988:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13d98b:	8d 50 01             	lea    edx,[rax+0x1]
  13d98e:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  13d991:	48 98                	cdqe   
  13d993:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  13d997:	88 54 05 e0          	mov    BYTE PTR [rbp+rax*1-0x20],dl
  13d99b:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  13d99e:	48 63 d0             	movsxd rdx,eax
  13d9a1:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
  13d9a8:	48 c1 ea 20          	shr    rdx,0x20
  13d9ac:	c1 fa 02             	sar    edx,0x2
  13d9af:	c1 f8 1f             	sar    eax,0x1f
  13d9b2:	89 c1                	mov    ecx,eax
  13d9b4:	89 d0                	mov    eax,edx
  13d9b6:	29 c8                	sub    eax,ecx
  13d9b8:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
  13d9bb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13d9be:	83 f8 0f             	cmp    eax,0xf
  13d9c1:	76 93                	jbe    13d956 <sprint_decimal+0x1c>
  13d9c3:	eb 1f                	jmp    13d9e4 <sprint_decimal+0xaa>
  13d9c5:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  13d9c9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13d9cc:	48 98                	cdqe   
  13d9ce:	0f b6 44 05 e0       	movzx  eax,BYTE PTR [rbp+rax*1-0x20]
  13d9d3:	0f be d0             	movsx  edx,al
  13d9d6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  13d9da:	89 d6                	mov    esi,edx
  13d9dc:	48 89 c7             	mov    rdi,rax
  13d9df:	e8 17 ff ff ff       	call   13d8fb <sprintchar>
  13d9e4:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  13d9e8:	7f db                	jg     13d9c5 <sprint_decimal+0x8b>
  13d9ea:	90                   	nop
  13d9eb:	90                   	nop
  13d9ec:	c9                   	leave  
  13d9ed:	c3                   	ret    

000000000013d9ee <sprint_hex>:
  13d9ee:	f3 0f 1e fa          	endbr64 
  13d9f2:	55                   	push   rbp
  13d9f3:	48 89 e5             	mov    rbp,rsp
  13d9f6:	48 83 ec 20          	sub    rsp,0x20
  13d9fa:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  13d9fe:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  13da01:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  13da08:	eb 35                	jmp    13da3f <sprint_hex+0x51>
  13da0a:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  13da0d:	83 e0 0f             	and    eax,0xf
  13da10:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
  13da13:	80 7d fb 09          	cmp    BYTE PTR [rbp-0x5],0x9
  13da17:	76 06                	jbe    13da1f <sprint_hex+0x31>
  13da19:	80 45 fb 57          	add    BYTE PTR [rbp-0x5],0x57
  13da1d:	eb 04                	jmp    13da23 <sprint_hex+0x35>
  13da1f:	80 45 fb 30          	add    BYTE PTR [rbp-0x5],0x30
  13da23:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13da26:	8d 50 01             	lea    edx,[rax+0x1]
  13da29:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  13da2c:	48 98                	cdqe   
  13da2e:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  13da32:	88 54 05 f1          	mov    BYTE PTR [rbp+rax*1-0xf],dl
  13da36:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  13da39:	c1 e8 04             	shr    eax,0x4
  13da3c:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
  13da3f:	83 7d fc 09          	cmp    DWORD PTR [rbp-0x4],0x9
  13da43:	7e c5                	jle    13da0a <sprint_hex+0x1c>
  13da45:	eb 1f                	jmp    13da66 <sprint_hex+0x78>
  13da47:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  13da4b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  13da4e:	48 98                	cdqe   
  13da50:	0f b6 44 05 f1       	movzx  eax,BYTE PTR [rbp+rax*1-0xf]
  13da55:	0f be d0             	movsx  edx,al
  13da58:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  13da5c:	89 d6                	mov    esi,edx
  13da5e:	48 89 c7             	mov    rdi,rax
  13da61:	e8 95 fe ff ff       	call   13d8fb <sprintchar>
  13da66:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  13da6a:	7f db                	jg     13da47 <sprint_hex+0x59>
  13da6c:	90                   	nop
  13da6d:	90                   	nop
  13da6e:	c9                   	leave  
  13da6f:	c3                   	ret    

000000000013da70 <sprintn>:
  13da70:	f3 0f 1e fa          	endbr64 
  13da74:	55                   	push   rbp
  13da75:	48 89 e5             	mov    rbp,rsp
  13da78:	48 83 ec 10          	sub    rsp,0x10
  13da7c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  13da80:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  13da84:	eb 20                	jmp    13daa6 <sprintn+0x36>
  13da86:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  13da8a:	48 8d 50 01          	lea    rdx,[rax+0x1]
  13da8e:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  13da92:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13da95:	0f be d0             	movsx  edx,al
  13da98:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  13da9c:	89 d6                	mov    esi,edx
  13da9e:	48 89 c7             	mov    rdi,rax
  13daa1:	e8 55 fe ff ff       	call   13d8fb <sprintchar>
  13daa6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  13daaa:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  13daad:	84 c0                	test   al,al
  13daaf:	75 d5                	jne    13da86 <sprintn+0x16>
  13dab1:	90                   	nop
  13dab2:	90                   	nop
  13dab3:	c9                   	leave  
  13dab4:	c3                   	ret    
  13dab5:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  13dabc:	00 00 00 
  13dabf:	90                   	nop

000000000013dac0 <create_zero>:
  13dac0:	e8 a0 a4 ff ff       	call   137f65 <req_proc+0x4>
  13dac5:	83 f8 ff             	cmp    eax,0xffffffff
  13dac8:	74 1d                	je     13dae7 <create_zero.retu>
  13daca:	50                   	push   rax
  13dacb:	53                   	push   rbx
  13dacc:	51                   	push   rcx
  13dacd:	52                   	push   rdx
  13dace:	06                   	(bad)  
  13dacf:	0e                   	(bad)  
  13dad0:	16                   	(bad)  
  13dad1:	1e                   	(bad)  
  13dad2:	0f a0                	push   fs
  13dad4:	0f a8                	push   gs
  13dad6:	54                   	push   rsp
  13dad7:	55                   	push   rbp
  13dad8:	56                   	push   rsi
  13dad9:	57                   	push   rdi
  13dada:	9c                   	pushf  
  13dadb:	50                   	push   rax
  13dadc:	e8 50 a5 ff ff       	call   138031 <set_proc+0x4>
  13dae1:	8b 04 24             	mov    eax,DWORD PTR [rsp]
  13dae4:	83 c4 40             	add    esp,0x40

000000000013dae7 <create_zero.retu>:
  13dae7:	c3                   	ret    

000000000013dae8 <fill_desc>:
  13dae8:	55                   	push   rbp
  13dae9:	89 e5                	mov    ebp,esp
  13daeb:	8b 45 14             	mov    eax,DWORD PTR [rbp+0x14]
  13daee:	8b 5d 10             	mov    ebx,DWORD PTR [rbp+0x10]
  13daf1:	8b 4d 0c             	mov    ecx,DWORD PTR [rbp+0xc]
  13daf4:	8b 55 08             	mov    edx,DWORD PTR [rbp+0x8]
  13daf7:	be c0 da 13 00       	mov    esi,0x13dac0
  13dafc:	c7 05 c0 da 13 00 00 	mov    DWORD PTR [rip+0x13dac0],0x0        # 27b5c6 <dev_stdout+0x13cb06>
  13db03:	00 00 00 
  13db06:	c7 05 c0 da 13 00 00 	mov    DWORD PTR [rip+0x13dac0],0x0        # 27b5d0 <dev_stdout+0x13cb10>
  13db0d:	00 00 00 
  13db10:	66 89 0e             	mov    WORD PTR [rsi],cx
  13db13:	c1 e9 10             	shr    ecx,0x10
  13db16:	66 89 56 02          	mov    WORD PTR [rsi+0x2],dx
  13db1a:	c1 ea 10             	shr    edx,0x10
  13db1d:	88 56 04             	mov    BYTE PTR [rsi+0x4],dl
  13db20:	66 c1 ea 08          	shr    dx,0x8
  13db24:	88 56 07             	mov    BYTE PTR [rsi+0x7],dl
  13db27:	66 89 5e 05          	mov    WORD PTR [rsi+0x5],bx
  13db2b:	8b 7e 04             	mov    edi,DWORD PTR [rsi+0x4]
  13db2e:	c1 e1 08             	shl    ecx,0x8
  13db31:	09 cf                	or     edi,ecx
  13db33:	89 7e 04             	mov    DWORD PTR [rsi+0x4],edi
  13db36:	8b 15 c0 da 13 00    	mov    edx,DWORD PTR [rip+0x13dac0]        # 27b5fc <dev_stdout+0x13cb3c>
  13db3c:	89 10                	mov    DWORD PTR [rax],edx
  13db3e:	8b 15 c0 da 13 00    	mov    edx,DWORD PTR [rip+0x13dac0]        # 27b604 <dev_stdout+0x13cb44>
  13db44:	89 50 04             	mov    DWORD PTR [rax+0x4],edx
  13db47:	89 ec                	mov    esp,ebp
  13db49:	5d                   	pop    rbp
  13db4a:	c3                   	ret    

000000000013db4b <switch_proc_asm>:
  13db4b:	66 8b 44 24 04       	mov    ax,WORD PTR [rsp+0x4]
  13db50:	66 a3 c0 da 13 00 c7 	movabs ds:0xdac005c70013dac0,ax
  13db57:	05 c0 da 
  13db5a:	13 00                	adc    eax,DWORD PTR [rax]
  13db5c:	00 00                	add    BYTE PTR [rax],al
	...

000000000013db60 <switch_proc_asm.ljmp>:
  13db60:	ea                   	(bad)  
  13db61:	00 00                	add    BYTE PTR [rax],al
  13db63:	00 00                	add    BYTE PTR [rax],al
  13db65:	00 00                	add    BYTE PTR [rax],al
  13db67:	c3                   	ret    

000000000013db68 <switch_to>:
  13db68:	8b 74 24 04          	mov    esi,DWORD PTR [rsp+0x4]
  13db6c:	8b 5e 20             	mov    ebx,DWORD PTR [rsi+0x20]
  13db6f:	bf c0 da 13 00       	mov    edi,0x13dac0
  13db74:	89 5f 01             	mov    DWORD PTR [rdi+0x1],ebx
  13db77:	8b 46 38             	mov    eax,DWORD PTR [rsi+0x38]
  13db7a:	89 c1                	mov    ecx,eax
  13db7c:	83 e9 04             	sub    ecx,0x4
  13db7f:	89 19                	mov    DWORD PTR [rcx],ebx
  13db81:	50                   	push   rax
  13db82:	89 f5                	mov    ebp,esi
  13db84:	83 c5 28             	add    ebp,0x28
  13db87:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  13db8a:	50                   	push   rax
  13db8b:	83 c5 04             	add    ebp,0x4
  13db8e:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  13db91:	50                   	push   rax
  13db92:	83 c5 04             	add    ebp,0x4
  13db95:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  13db98:	50                   	push   rax
  13db99:	83 c5 04             	add    ebp,0x4
  13db9c:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  13db9f:	50                   	push   rax
  13dba0:	83 c5 04             	add    ebp,0x4
  13dba3:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  13dba6:	50                   	push   rax
  13dba7:	83 c5 04             	add    ebp,0x4
  13dbaa:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  13dbad:	50                   	push   rax
  13dbae:	83 c5 04             	add    ebp,0x4
  13dbb1:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  13dbb4:	50                   	push   rax
  13dbb5:	83 c5 04             	add    ebp,0x4
  13dbb8:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  13dbbb:	50                   	push   rax
  13dbbc:	83 c5 04             	add    ebp,0x4
  13dbbf:	8b 46 1c             	mov    eax,DWORD PTR [rsi+0x1c]
  13dbc2:	0f 22 d8             	mov    cr3,rax
  13dbc5:	8b 46 24             	mov    eax,DWORD PTR [rsi+0x24]
  13dbc8:	50                   	push   rax
  13dbc9:	9d                   	popf   
  13dbca:	61                   	(bad)  
  13dbcb:	5c                   	pop    rsp

000000000013dbcc <switch_to.leap>:
  13dbcc:	ea                   	(bad)  
  13dbcd:	00 00                	add    BYTE PTR [rax],al
  13dbcf:	00 00                	add    BYTE PTR [rax],al
  13dbd1:	08 00                	or     BYTE PTR [rax],al

000000000013dbd3 <save_context>:
  13dbd3:	60                   	(bad)  
  13dbd4:	8b 44 24 24          	mov    eax,DWORD PTR [rsp+0x24]
  13dbd8:	83 c0 44             	add    eax,0x44
  13dbdb:	b9 08 00 00 00       	mov    ecx,0x8
  13dbe0:	89 e7                	mov    edi,esp

000000000013dbe2 <save_context.loops>:
  13dbe2:	8b 17                	mov    edx,DWORD PTR [rdi]
  13dbe4:	89 10                	mov    DWORD PTR [rax],edx
  13dbe6:	83 c7 04             	add    edi,0x4
  13dbe9:	83 e8 04             	sub    eax,0x4
  13dbec:	e2 f4                	loop   13dbe2 <save_context.loops>
  13dbee:	61                   	(bad)  
  13dbef:	9c                   	pushf  
  13dbf0:	5b                   	pop    rbx
  13dbf1:	8b 44 24 04          	mov    eax,DWORD PTR [rsp+0x4]
  13dbf5:	89 58 24             	mov    DWORD PTR [rax+0x24],ebx
  13dbf8:	8b 1c 24             	mov    ebx,DWORD PTR [rsp]
  13dbfb:	89 58 20             	mov    DWORD PTR [rax+0x20],ebx
  13dbfe:	c3                   	ret    

000000000013dbff <move_to_user_mode>:
  13dbff:	66 b8 20 00          	mov    ax,0x20
  13dc03:	8e d8                	mov    ds,eax
  13dc05:	8e c0                	mov    es,eax
  13dc07:	8e e8                	mov    gs,eax
  13dc09:	6a 20                	push   0x20
  13dc0b:	54                   	push   rsp
  13dc0c:	9c                   	pushf  
  13dc0d:	6a 18                	push   0x18
  13dc0f:	68 c0 da 13 00       	push   0x13dac0
  13dc14:	cf                   	iret   

000000000013dc15 <move_to_user_mode.done>:
  13dc15:	c3                   	ret    

000000000013dc16 <desc>:
	...
