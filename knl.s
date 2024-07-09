
bin/gmsknl.elf:     file format elf64-x86-64


Disassembly of section .text:

0000000000232380 <init_int>:
  232380:	f3 0f 1e fa          	endbr64 
  232384:	55                   	push   rbp
  232385:	48 89 e5             	mov    rbp,rsp
  232388:	48 83 ec 10          	sub    rsp,0x10
  23238c:	b8 00 27 23 00       	mov    eax,0x232700
  232391:	b9 00 8e 00 00       	mov    ecx,0x8e00
  232396:	ba 08 00 00 00       	mov    edx,0x8
  23239b:	89 c6                	mov    esi,eax
  23239d:	bf 00 00 00 00       	mov    edi,0x0
  2323a2:	e8 d2 02 00 00       	call   232679 <set_gate>
  2323a7:	b8 19 27 23 00       	mov    eax,0x232719
  2323ac:	b9 00 8e 00 00       	mov    ecx,0x8e00
  2323b1:	ba 08 00 00 00       	mov    edx,0x8
  2323b6:	89 c6                	mov    esi,eax
  2323b8:	bf 01 00 00 00       	mov    edi,0x1
  2323bd:	e8 b7 02 00 00       	call   232679 <set_gate>
  2323c2:	b8 32 27 23 00       	mov    eax,0x232732
  2323c7:	b9 00 8e 00 00       	mov    ecx,0x8e00
  2323cc:	ba 08 00 00 00       	mov    edx,0x8
  2323d1:	89 c6                	mov    esi,eax
  2323d3:	bf 02 00 00 00       	mov    edi,0x2
  2323d8:	e8 9c 02 00 00       	call   232679 <set_gate>
  2323dd:	b8 4b 27 23 00       	mov    eax,0x23274b
  2323e2:	b9 00 8e 00 00       	mov    ecx,0x8e00
  2323e7:	ba 08 00 00 00       	mov    edx,0x8
  2323ec:	89 c6                	mov    esi,eax
  2323ee:	bf 03 00 00 00       	mov    edi,0x3
  2323f3:	e8 81 02 00 00       	call   232679 <set_gate>
  2323f8:	b8 64 27 23 00       	mov    eax,0x232764
  2323fd:	b9 00 8e 00 00       	mov    ecx,0x8e00
  232402:	ba 08 00 00 00       	mov    edx,0x8
  232407:	89 c6                	mov    esi,eax
  232409:	bf 04 00 00 00       	mov    edi,0x4
  23240e:	e8 66 02 00 00       	call   232679 <set_gate>
  232413:	b8 7d 27 23 00       	mov    eax,0x23277d
  232418:	b9 00 8e 00 00       	mov    ecx,0x8e00
  23241d:	ba 08 00 00 00       	mov    edx,0x8
  232422:	89 c6                	mov    esi,eax
  232424:	bf 05 00 00 00       	mov    edi,0x5
  232429:	e8 4b 02 00 00       	call   232679 <set_gate>
  23242e:	b8 96 27 23 00       	mov    eax,0x232796
  232433:	b9 00 8e 00 00       	mov    ecx,0x8e00
  232438:	ba 08 00 00 00       	mov    edx,0x8
  23243d:	89 c6                	mov    esi,eax
  23243f:	bf 06 00 00 00       	mov    edi,0x6
  232444:	e8 30 02 00 00       	call   232679 <set_gate>
  232449:	b8 b9 27 23 00       	mov    eax,0x2327b9
  23244e:	b9 00 8e 00 00       	mov    ecx,0x8e00
  232453:	ba 08 00 00 00       	mov    edx,0x8
  232458:	89 c6                	mov    esi,eax
  23245a:	bf 07 00 00 00       	mov    edi,0x7
  23245f:	e8 15 02 00 00       	call   232679 <set_gate>
  232464:	b8 d2 27 23 00       	mov    eax,0x2327d2
  232469:	b9 00 8e 00 00       	mov    ecx,0x8e00
  23246e:	ba 08 00 00 00       	mov    edx,0x8
  232473:	89 c6                	mov    esi,eax
  232475:	bf 08 00 00 00       	mov    edi,0x8
  23247a:	e8 fa 01 00 00       	call   232679 <set_gate>
  23247f:	b8 eb 27 23 00       	mov    eax,0x2327eb
  232484:	b9 00 8e 00 00       	mov    ecx,0x8e00
  232489:	ba 08 00 00 00       	mov    edx,0x8
  23248e:	89 c6                	mov    esi,eax
  232490:	bf 09 00 00 00       	mov    edi,0x9
  232495:	e8 df 01 00 00       	call   232679 <set_gate>
  23249a:	b8 02 28 23 00       	mov    eax,0x232802
  23249f:	b9 00 8e 00 00       	mov    ecx,0x8e00
  2324a4:	ba 08 00 00 00       	mov    edx,0x8
  2324a9:	89 c6                	mov    esi,eax
  2324ab:	bf 0a 00 00 00       	mov    edi,0xa
  2324b0:	e8 c4 01 00 00       	call   232679 <set_gate>
  2324b5:	b8 1b 28 23 00       	mov    eax,0x23281b
  2324ba:	b9 00 8e 00 00       	mov    ecx,0x8e00
  2324bf:	ba 08 00 00 00       	mov    edx,0x8
  2324c4:	89 c6                	mov    esi,eax
  2324c6:	bf 0b 00 00 00       	mov    edi,0xb
  2324cb:	e8 a9 01 00 00       	call   232679 <set_gate>
  2324d0:	b8 34 28 23 00       	mov    eax,0x232834
  2324d5:	b9 00 8e 00 00       	mov    ecx,0x8e00
  2324da:	ba 08 00 00 00       	mov    edx,0x8
  2324df:	89 c6                	mov    esi,eax
  2324e1:	bf 0c 00 00 00       	mov    edi,0xc
  2324e6:	e8 8e 01 00 00       	call   232679 <set_gate>
  2324eb:	b8 4d 28 23 00       	mov    eax,0x23284d
  2324f0:	b9 00 8e 00 00       	mov    ecx,0x8e00
  2324f5:	ba 08 00 00 00       	mov    edx,0x8
  2324fa:	89 c6                	mov    esi,eax
  2324fc:	bf 0d 00 00 00       	mov    edi,0xd
  232501:	e8 73 01 00 00       	call   232679 <set_gate>
  232506:	b8 65 37 23 00       	mov    eax,0x233765
  23250b:	b9 00 8e 00 00       	mov    ecx,0x8e00
  232510:	ba 08 00 00 00       	mov    edx,0x8
  232515:	89 c6                	mov    esi,eax
  232517:	bf 0e 00 00 00       	mov    edi,0xe
  23251c:	e8 58 01 00 00       	call   232679 <set_gate>
  232521:	b8 32 27 23 00       	mov    eax,0x232732
  232526:	b9 00 8e 00 00       	mov    ecx,0x8e00
  23252b:	ba 08 00 00 00       	mov    edx,0x8
  232530:	89 c6                	mov    esi,eax
  232532:	bf 0f 00 00 00       	mov    edi,0xf
  232537:	e8 3d 01 00 00       	call   232679 <set_gate>
  23253c:	b8 72 28 23 00       	mov    eax,0x232872
  232541:	b9 00 8e 00 00       	mov    ecx,0x8e00
  232546:	ba 08 00 00 00       	mov    edx,0x8
  23254b:	89 c6                	mov    esi,eax
  23254d:	bf 10 00 00 00       	mov    edi,0x10
  232552:	e8 22 01 00 00       	call   232679 <set_gate>
  232557:	c7 45 fc 11 00 00 00 	mov    DWORD PTR [rbp-0x4],0x11
  23255e:	eb 22                	jmp    232582 <init_int+0x202>
  232560:	b8 32 27 23 00       	mov    eax,0x232732
  232565:	89 c6                	mov    esi,eax
  232567:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23256a:	0f b6 c0             	movzx  eax,al
  23256d:	b9 00 8e 00 00       	mov    ecx,0x8e00
  232572:	ba 08 00 00 00       	mov    edx,0x8
  232577:	89 c7                	mov    edi,eax
  232579:	e8 fb 00 00 00       	call   232679 <set_gate>
  23257e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  232582:	83 7d fc 2f          	cmp    DWORD PTR [rbp-0x4],0x2f
  232586:	7e d8                	jle    232560 <init_int+0x1e0>
  232588:	b8 66 7d 23 00       	mov    eax,0x237d66
  23258d:	b9 00 8f 00 00       	mov    ecx,0x8f00
  232592:	ba 08 00 00 00       	mov    edx,0x8
  232597:	89 c6                	mov    esi,eax
  232599:	bf 21 00 00 00       	mov    edi,0x21
  23259e:	e8 d6 00 00 00       	call   232679 <set_gate>
  2325a3:	b8 d0 71 23 00       	mov    eax,0x2371d0
  2325a8:	b9 00 8e 00 00       	mov    ecx,0x8e00
  2325ad:	ba 08 00 00 00       	mov    edx,0x8
  2325b2:	89 c6                	mov    esi,eax
  2325b4:	bf 20 00 00 00       	mov    edi,0x20
  2325b9:	e8 bb 00 00 00       	call   232679 <set_gate>
  2325be:	b8 30 8c 23 00       	mov    eax,0x238c30
  2325c3:	b9 00 8e 00 00       	mov    ecx,0x8e00
  2325c8:	ba 08 00 00 00       	mov    edx,0x8
  2325cd:	89 c6                	mov    esi,eax
  2325cf:	bf 2e 00 00 00       	mov    edi,0x2e
  2325d4:	e8 a0 00 00 00       	call   232679 <set_gate>
  2325d9:	b8 f0 7b 23 00       	mov    eax,0x237bf0
  2325de:	b9 00 8f 00 00       	mov    ecx,0x8f00
  2325e3:	ba 08 00 00 00       	mov    edx,0x8
  2325e8:	89 c6                	mov    esi,eax
  2325ea:	bf 80 00 00 00       	mov    edi,0x80
  2325ef:	e8 85 00 00 00       	call   232679 <set_gate>
  2325f4:	be 11 00 00 00       	mov    esi,0x11
  2325f9:	bf 20 00 00 00       	mov    edi,0x20
  2325fe:	e8 ed 48 00 00       	call   236ef0 <outb>
  232603:	be 11 00 00 00       	mov    esi,0x11
  232608:	bf a0 00 00 00       	mov    edi,0xa0
  23260d:	e8 de 48 00 00       	call   236ef0 <outb>
  232612:	be 20 00 00 00       	mov    esi,0x20
  232617:	bf 21 00 00 00       	mov    edi,0x21
  23261c:	e8 cf 48 00 00       	call   236ef0 <outb>
  232621:	be 28 00 00 00       	mov    esi,0x28
  232626:	bf a1 00 00 00       	mov    edi,0xa1
  23262b:	e8 c0 48 00 00       	call   236ef0 <outb>
  232630:	be 04 00 00 00       	mov    esi,0x4
  232635:	bf 21 00 00 00       	mov    edi,0x21
  23263a:	e8 b1 48 00 00       	call   236ef0 <outb>
  23263f:	be 02 00 00 00       	mov    esi,0x2
  232644:	bf a1 00 00 00       	mov    edi,0xa1
  232649:	e8 a2 48 00 00       	call   236ef0 <outb>
  23264e:	be 01 00 00 00       	mov    esi,0x1
  232653:	bf 21 00 00 00       	mov    edi,0x21
  232658:	e8 93 48 00 00       	call   236ef0 <outb>
  23265d:	be 01 00 00 00       	mov    esi,0x1
  232662:	bf a1 00 00 00       	mov    edi,0xa1
  232667:	e8 84 48 00 00       	call   236ef0 <outb>
  23266c:	b8 00 00 00 00       	mov    eax,0x0
  232671:	e8 bf 48 00 00       	call   236f35 <turn_on_int>
  232676:	90                   	nop
  232677:	c9                   	leave  
  232678:	c3                   	ret    

0000000000232679 <set_gate>:
  232679:	f3 0f 1e fa          	endbr64 
  23267d:	55                   	push   rbp
  23267e:	48 89 e5             	mov    rbp,rsp
  232681:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  232684:	89 c8                	mov    eax,ecx
  232686:	89 f9                	mov    ecx,edi
  232688:	88 4d fc             	mov    BYTE PTR [rbp-0x4],cl
  23268b:	66 89 55 f4          	mov    WORD PTR [rbp-0xc],dx
  23268f:	66 89 45 f0          	mov    WORD PTR [rbp-0x10],ax
  232693:	48 8b 15 06 ea fc ff 	mov    rdx,QWORD PTR [rip+0xfffffffffffcea06]        # 2010a0 <idt>
  23269a:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  23269e:	48 c1 e0 03          	shl    rax,0x3
  2326a2:	48 01 d0             	add    rax,rdx
  2326a5:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  2326a8:	66 89 10             	mov    WORD PTR [rax],dx
  2326ab:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  2326ae:	c1 e8 10             	shr    eax,0x10
  2326b1:	89 c2                	mov    edx,eax
  2326b3:	48 8b 0d e6 e9 fc ff 	mov    rcx,QWORD PTR [rip+0xfffffffffffce9e6]        # 2010a0 <idt>
  2326ba:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  2326be:	48 c1 e0 03          	shl    rax,0x3
  2326c2:	48 01 c8             	add    rax,rcx
  2326c5:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
  2326c9:	48 8b 15 d0 e9 fc ff 	mov    rdx,QWORD PTR [rip+0xfffffffffffce9d0]        # 2010a0 <idt>
  2326d0:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  2326d4:	48 c1 e0 03          	shl    rax,0x3
  2326d8:	48 01 c2             	add    rdx,rax
  2326db:	0f b7 45 f0          	movzx  eax,WORD PTR [rbp-0x10]
  2326df:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
  2326e3:	48 8b 15 b6 e9 fc ff 	mov    rdx,QWORD PTR [rip+0xfffffffffffce9b6]        # 2010a0 <idt>
  2326ea:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  2326ee:	48 c1 e0 03          	shl    rax,0x3
  2326f2:	48 01 c2             	add    rdx,rax
  2326f5:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  2326f9:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
  2326fd:	90                   	nop
  2326fe:	5d                   	pop    rbp
  2326ff:	c3                   	ret    

0000000000232700 <divide_err>:
  232700:	f3 0f 1e fa          	endbr64 
  232704:	55                   	push   rbp
  232705:	48 89 e5             	mov    rbp,rsp
  232708:	fa                   	cli    
  232709:	b8 00 00 00 00       	mov    eax,0x0
  23270e:	e8 16 48 00 00       	call   236f29 <eoi>
  232713:	fb                   	sti    
  232714:	c9                   	leave  
  232715:	cf                   	iret   
  232716:	90                   	nop
  232717:	5d                   	pop    rbp
  232718:	c3                   	ret    

0000000000232719 <debug>:
  232719:	f3 0f 1e fa          	endbr64 
  23271d:	55                   	push   rbp
  23271e:	48 89 e5             	mov    rbp,rsp
  232721:	fa                   	cli    
  232722:	b8 00 00 00 00       	mov    eax,0x0
  232727:	e8 fd 47 00 00       	call   236f29 <eoi>
  23272c:	fb                   	sti    
  23272d:	c9                   	leave  
  23272e:	cf                   	iret   
  23272f:	90                   	nop
  232730:	5d                   	pop    rbp
  232731:	c3                   	ret    

0000000000232732 <default_int_proc>:
  232732:	f3 0f 1e fa          	endbr64 
  232736:	55                   	push   rbp
  232737:	48 89 e5             	mov    rbp,rsp
  23273a:	fa                   	cli    
  23273b:	b8 00 00 00 00       	mov    eax,0x0
  232740:	e8 e4 47 00 00       	call   236f29 <eoi>
  232745:	fb                   	sti    
  232746:	c9                   	leave  
  232747:	cf                   	iret   
  232748:	90                   	nop
  232749:	5d                   	pop    rbp
  23274a:	c3                   	ret    

000000000023274b <breakpoint>:
  23274b:	f3 0f 1e fa          	endbr64 
  23274f:	55                   	push   rbp
  232750:	48 89 e5             	mov    rbp,rsp
  232753:	fa                   	cli    
  232754:	b8 00 00 00 00       	mov    eax,0x0
  232759:	e8 cb 47 00 00       	call   236f29 <eoi>
  23275e:	fb                   	sti    
  23275f:	c9                   	leave  
  232760:	cf                   	iret   
  232761:	90                   	nop
  232762:	5d                   	pop    rbp
  232763:	c3                   	ret    

0000000000232764 <overflow>:
  232764:	f3 0f 1e fa          	endbr64 
  232768:	55                   	push   rbp
  232769:	48 89 e5             	mov    rbp,rsp
  23276c:	fa                   	cli    
  23276d:	b8 00 00 00 00       	mov    eax,0x0
  232772:	e8 b2 47 00 00       	call   236f29 <eoi>
  232777:	fb                   	sti    
  232778:	c9                   	leave  
  232779:	cf                   	iret   
  23277a:	90                   	nop
  23277b:	5d                   	pop    rbp
  23277c:	c3                   	ret    

000000000023277d <bounds>:
  23277d:	f3 0f 1e fa          	endbr64 
  232781:	55                   	push   rbp
  232782:	48 89 e5             	mov    rbp,rsp
  232785:	fa                   	cli    
  232786:	b8 00 00 00 00       	mov    eax,0x0
  23278b:	e8 99 47 00 00       	call   236f29 <eoi>
  232790:	fb                   	sti    
  232791:	c9                   	leave  
  232792:	cf                   	iret   
  232793:	90                   	nop
  232794:	5d                   	pop    rbp
  232795:	c3                   	ret    

0000000000232796 <undefined_operator>:
  232796:	f3 0f 1e fa          	endbr64 
  23279a:	55                   	push   rbp
  23279b:	48 89 e5             	mov    rbp,rsp
  23279e:	b8 00 00 00 00       	mov    eax,0x0
  2327a3:	e8 81 47 00 00       	call   236f29 <eoi>
  2327a8:	b8 00 00 00 00       	mov    eax,0x0
  2327ad:	e8 a2 47 00 00       	call   236f54 <report_back_trace_of_err>
  2327b2:	eb fe                	jmp    2327b2 <undefined_operator+0x1c>
  2327b4:	c9                   	leave  
  2327b5:	cf                   	iret   
  2327b6:	90                   	nop
  2327b7:	5d                   	pop    rbp
  2327b8:	c3                   	ret    

00000000002327b9 <coprocessor_notexist>:
  2327b9:	f3 0f 1e fa          	endbr64 
  2327bd:	55                   	push   rbp
  2327be:	48 89 e5             	mov    rbp,rsp
  2327c1:	fa                   	cli    
  2327c2:	b8 00 00 00 00       	mov    eax,0x0
  2327c7:	e8 5d 47 00 00       	call   236f29 <eoi>
  2327cc:	fb                   	sti    
  2327cd:	c9                   	leave  
  2327ce:	cf                   	iret   
  2327cf:	90                   	nop
  2327d0:	5d                   	pop    rbp
  2327d1:	c3                   	ret    

00000000002327d2 <double_ints>:
  2327d2:	f3 0f 1e fa          	endbr64 
  2327d6:	55                   	push   rbp
  2327d7:	48 89 e5             	mov    rbp,rsp
  2327da:	fa                   	cli    
  2327db:	b8 00 00 00 00       	mov    eax,0x0
  2327e0:	e8 44 47 00 00       	call   236f29 <eoi>
  2327e5:	fb                   	sti    
  2327e6:	c9                   	leave  
  2327e7:	cf                   	iret   
  2327e8:	90                   	nop
  2327e9:	5d                   	pop    rbp
  2327ea:	c3                   	ret    

00000000002327eb <coprocessor_seg_overbound>:
  2327eb:	f3 0f 1e fa          	endbr64 
  2327ef:	55                   	push   rbp
  2327f0:	48 89 e5             	mov    rbp,rsp
  2327f3:	b8 00 00 00 00       	mov    eax,0x0
  2327f8:	e8 2c 47 00 00       	call   236f29 <eoi>
  2327fd:	c9                   	leave  
  2327fe:	cf                   	iret   
  2327ff:	90                   	nop
  232800:	5d                   	pop    rbp
  232801:	c3                   	ret    

0000000000232802 <invalid_tss>:
  232802:	f3 0f 1e fa          	endbr64 
  232806:	55                   	push   rbp
  232807:	48 89 e5             	mov    rbp,rsp
  23280a:	fa                   	cli    
  23280b:	b8 00 00 00 00       	mov    eax,0x0
  232810:	e8 14 47 00 00       	call   236f29 <eoi>
  232815:	fb                   	sti    
  232816:	c9                   	leave  
  232817:	cf                   	iret   
  232818:	90                   	nop
  232819:	5d                   	pop    rbp
  23281a:	c3                   	ret    

000000000023281b <segment_notexist>:
  23281b:	f3 0f 1e fa          	endbr64 
  23281f:	55                   	push   rbp
  232820:	48 89 e5             	mov    rbp,rsp
  232823:	fa                   	cli    
  232824:	b8 00 00 00 00       	mov    eax,0x0
  232829:	e8 fb 46 00 00       	call   236f29 <eoi>
  23282e:	fb                   	sti    
  23282f:	c9                   	leave  
  232830:	cf                   	iret   
  232831:	90                   	nop
  232832:	5d                   	pop    rbp
  232833:	c3                   	ret    

0000000000232834 <stackseg_overbound>:
  232834:	f3 0f 1e fa          	endbr64 
  232838:	55                   	push   rbp
  232839:	48 89 e5             	mov    rbp,rsp
  23283c:	fa                   	cli    
  23283d:	b8 00 00 00 00       	mov    eax,0x0
  232842:	e8 e2 46 00 00       	call   236f29 <eoi>
  232847:	fb                   	sti    
  232848:	c9                   	leave  
  232849:	cf                   	iret   
  23284a:	90                   	nop
  23284b:	5d                   	pop    rbp
  23284c:	c3                   	ret    

000000000023284d <general_protect>:
  23284d:	f3 0f 1e fa          	endbr64 
  232851:	55                   	push   rbp
  232852:	48 89 e5             	mov    rbp,rsp
  232855:	48 83 ec 10          	sub    rsp,0x10
  232859:	fa                   	cli    
  23285a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  232861:	b8 00 00 00 00       	mov    eax,0x0
  232866:	e8 be 46 00 00       	call   236f29 <eoi>
  23286b:	eb fe                	jmp    23286b <general_protect+0x1e>
  23286d:	c9                   	leave  
  23286e:	cf                   	iret   
  23286f:	90                   	nop
  232870:	c9                   	leave  
  232871:	c3                   	ret    

0000000000232872 <coprocessor_err>:
  232872:	f3 0f 1e fa          	endbr64 
  232876:	55                   	push   rbp
  232877:	48 89 e5             	mov    rbp,rsp
  23287a:	fa                   	cli    
  23287b:	b8 00 00 00 00       	mov    eax,0x0
  232880:	e8 a4 46 00 00       	call   236f29 <eoi>
  232885:	fb                   	sti    
  232886:	c9                   	leave  
  232887:	cf                   	iret   
  232888:	90                   	nop
  232889:	5d                   	pop    rbp
  23288a:	c3                   	ret    

000000000023288b <syscall>:
  23288b:	f3 0f 1e fa          	endbr64 
  23288f:	55                   	push   rbp
  232890:	48 89 e5             	mov    rbp,rsp
  232893:	48 83 ec 20          	sub    rsp,0x20
  232897:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  23289a:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  23289d:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  2328a0:	89 4d f0             	mov    DWORD PTR [rbp-0x10],ecx
  2328a3:	44 89 45 ec          	mov    DWORD PTR [rbp-0x14],r8d
  2328a7:	44 89 4d e8          	mov    DWORD PTR [rbp-0x18],r9d
  2328ab:	83 7d fc 64          	cmp    DWORD PTR [rbp-0x4],0x64
  2328af:	0f 87 14 02 00 00    	ja     232ac9 <syscall+0x23e>
  2328b5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2328b8:	48 8b 04 c5 00 be 23 	mov    rax,QWORD PTR [rax*8+0x23be00]
  2328bf:	00 
  2328c0:	3e ff e0             	notrack jmp rax
  2328c3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  2328c6:	48 98                	cdqe   
  2328c8:	48 89 c7             	mov    rdi,rax
  2328cb:	e8 1e 26 00 00       	call   234eee <reg_device>
  2328d0:	e9 f4 01 00 00       	jmp    232ac9 <syscall+0x23e>
  2328d5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  2328d8:	89 c7                	mov    edi,eax
  2328da:	e8 6e 30 00 00       	call   23594d <dispose_device>
  2328df:	e9 e5 01 00 00       	jmp    232ac9 <syscall+0x23e>
  2328e4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  2328e7:	48 98                	cdqe   
  2328e9:	48 89 c7             	mov    rdi,rax
  2328ec:	e8 e5 28 00 00       	call   2351d6 <reg_driver>
  2328f1:	e9 d3 01 00 00       	jmp    232ac9 <syscall+0x23e>
  2328f6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  2328f9:	48 98                	cdqe   
  2328fb:	48 89 c7             	mov    rdi,rax
  2328fe:	e8 e8 30 00 00       	call   2359eb <dispose_driver>
  232903:	e9 c1 01 00 00       	jmp    232ac9 <syscall+0x23e>
  232908:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  23290b:	48 98                	cdqe   
  23290d:	48 89 c2             	mov    rdx,rax
  232910:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  232913:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  232916:	89 ce                	mov    esi,ecx
  232918:	89 c7                	mov    edi,eax
  23291a:	e8 d7 2d 00 00       	call   2356f6 <call_drv_func>
  23291f:	e9 a5 01 00 00       	jmp    232ac9 <syscall+0x23e>
  232924:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  232927:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  23292a:	89 d6                	mov    esi,edx
  23292c:	89 c7                	mov    edi,eax
  23292e:	e8 a7 11 00 00       	call   233ada <req_page_at>
  232933:	e9 91 01 00 00       	jmp    232ac9 <syscall+0x23e>
  232938:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  23293b:	48 98                	cdqe   
  23293d:	48 89 c7             	mov    rdi,rax
  232940:	e8 30 10 00 00       	call   233975 <free_page>
  232945:	e9 7f 01 00 00       	jmp    232ac9 <syscall+0x23e>
  23294a:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  23294d:	48 98                	cdqe   
  23294f:	48 89 c2             	mov    rdx,rax
  232952:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  232955:	48 98                	cdqe   
  232957:	48 89 c1             	mov    rcx,rax
  23295a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  23295d:	48 89 ce             	mov    rsi,rcx
  232960:	89 c7                	mov    edi,eax
  232962:	e8 82 41 00 00       	call   236ae9 <reg_proc>
  232967:	e9 5d 01 00 00       	jmp    232ac9 <syscall+0x23e>
  23296c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  23296f:	89 c7                	mov    edi,eax
  232971:	e8 53 3f 00 00       	call   2368c9 <del_proc>
  232976:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  232979:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  23297c:	89 d6                	mov    esi,edx
  23297e:	89 c7                	mov    edi,eax
  232980:	e8 17 12 00 00       	call   233b9c <chk_vm>
  232985:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  232988:	48 98                	cdqe   
  23298a:	48 89 c2             	mov    rdx,rax
  23298d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  232990:	89 c6                	mov    esi,eax
  232992:	48 89 d7             	mov    rdi,rdx
  232995:	e8 e6 15 00 00       	call   233f80 <sys_open>
  23299a:	e9 2a 01 00 00       	jmp    232ac9 <syscall+0x23e>
  23299f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  2329a2:	89 c7                	mov    edi,eax
  2329a4:	e8 a0 1a 00 00       	call   234449 <sys_close>
  2329a9:	e9 1b 01 00 00       	jmp    232ac9 <syscall+0x23e>
  2329ae:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  2329b1:	48 98                	cdqe   
  2329b3:	48 89 c1             	mov    rcx,rax
  2329b6:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  2329b9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  2329bc:	48 89 ce             	mov    rsi,rcx
  2329bf:	89 c7                	mov    edi,eax
  2329c1:	e8 99 1b 00 00       	call   23455f <sys_read>
  2329c6:	e9 fe 00 00 00       	jmp    232ac9 <syscall+0x23e>
  2329cb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  2329ce:	48 98                	cdqe   
  2329d0:	48 89 c1             	mov    rcx,rax
  2329d3:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  2329d6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  2329d9:	48 89 ce             	mov    rsi,rcx
  2329dc:	89 c7                	mov    edi,eax
  2329de:	e8 eb 1a 00 00       	call   2344ce <sys_write>
  2329e3:	e9 e1 00 00 00       	jmp    232ac9 <syscall+0x23e>
  2329e8:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  2329eb:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  2329ee:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  2329f1:	89 ce                	mov    esi,ecx
  2329f3:	89 c7                	mov    edi,eax
  2329f5:	e8 f6 1b 00 00       	call   2345f0 <sys_seek>
  2329fa:	e9 ca 00 00 00       	jmp    232ac9 <syscall+0x23e>
  2329ff:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  232a02:	89 c7                	mov    edi,eax
  232a04:	e8 2e 1c 00 00       	call   234637 <sys_tell>
  232a09:	e9 bb 00 00 00       	jmp    232ac9 <syscall+0x23e>
  232a0e:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  232a11:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  232a14:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  232a17:	89 ce                	mov    esi,ecx
  232a19:	89 c7                	mov    edi,eax
  232a1b:	b8 00 00 00 00       	mov    eax,0x0
  232a20:	e8 50 14 00 00       	call   233e75 <reg_vol>
  232a25:	e9 9f 00 00 00       	jmp    232ac9 <syscall+0x23e>
  232a2a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  232a2d:	89 c7                	mov    edi,eax
  232a2f:	b8 00 00 00 00       	mov    eax,0x0
  232a34:	e8 20 14 00 00       	call   233e59 <free_vol>
  232a39:	e9 8b 00 00 00       	jmp    232ac9 <syscall+0x23e>
  232a3e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  232a41:	48 98                	cdqe   
  232a43:	48 89 c7             	mov    rdi,rax
  232a46:	e8 f7 47 00 00       	call   237242 <execute>
  232a4b:	eb 7c                	jmp    232ac9 <syscall+0x23e>
  232a4d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  232a50:	89 c7                	mov    edi,eax
  232a52:	e8 71 40 00 00       	call   236ac8 <sys_exit>
  232a57:	eb 70                	jmp    232ac9 <syscall+0x23e>
  232a59:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  232a5c:	48 98                	cdqe   
  232a5e:	48 89 c7             	mov    rdi,rax
  232a61:	e8 d7 48 00 00       	call   23733d <exec_call>
  232a66:	eb 61                	jmp    232ac9 <syscall+0x23e>
  232a68:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  232a6b:	89 c7                	mov    edi,eax
  232a6d:	e8 88 12 00 00       	call   233cfa <sys_mkfifo>
  232a72:	eb 55                	jmp    232ac9 <syscall+0x23e>
  232a74:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  232a77:	89 c7                	mov    edi,eax
  232a79:	e8 27 42 00 00       	call   236ca5 <sys_malloc>
  232a7e:	eb 49                	jmp    232ac9 <syscall+0x23e>
  232a80:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  232a83:	89 c7                	mov    edi,eax
  232a85:	e8 a9 43 00 00       	call   236e33 <sys_free>
  232a8a:	eb 3d                	jmp    232ac9 <syscall+0x23e>
  232a8c:	b8 00 00 00 00       	mov    eax,0x0
  232a91:	e8 a7 53 00 00       	call   237e3d <sys_getkbc>
  232a96:	0f be c0             	movsx  eax,al
  232a99:	eb 2e                	jmp    232ac9 <syscall+0x23e>
  232a9b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  232a9e:	48 98                	cdqe   
  232aa0:	48 89 c7             	mov    rdi,rax
  232aa3:	e8 7e 28 00 00       	call   235326 <sys_find_dev>
  232aa8:	eb 1f                	jmp    232ac9 <syscall+0x23e>
  232aaa:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  232aad:	48 98                	cdqe   
  232aaf:	48 89 c2             	mov    rdx,rax
  232ab2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  232ab5:	48 98                	cdqe   
  232ab7:	48 89 c1             	mov    rcx,rax
  232aba:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  232abd:	89 c6                	mov    esi,eax
  232abf:	48 89 cf             	mov    rdi,rcx
  232ac2:	e8 f1 28 00 00       	call   2353b8 <sys_operate_dev>
  232ac7:	eb 00                	jmp    232ac9 <syscall+0x23e>
  232ac9:	c9                   	leave  
  232aca:	c3                   	ret    

0000000000232acb <main>:
  232acb:	f3 0f 1e fa          	endbr64 
  232acf:	55                   	push   rbp
  232ad0:	48 89 e5             	mov    rbp,rsp
  232ad3:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  232ad7:	48 89 7d 88          	mov    QWORD PTR [rbp-0x78],rdi
  232adb:	48 89 75 80          	mov    QWORD PTR [rbp-0x80],rsi
  232adf:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  232ae3:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  232ae7:	b8 00 00 00 00       	mov    eax,0x0
  232aec:	e8 42 06 00 00       	call   233133 <init_logging>
  232af1:	b8 d6 50 52 e8       	mov    eax,0xe85250d6
  232af6:	48 39 45 88          	cmp    QWORD PTR [rbp-0x78],rax
  232afa:	74 0f                	je     232b0b <main+0x40>
  232afc:	bf 28 c1 23 00       	mov    edi,0x23c128
  232b01:	b8 00 00 00 00       	mov    eax,0x0
  232b06:	e8 35 08 00 00       	call   233340 <printf>
  232b0b:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  232b0f:	8b 00                	mov    eax,DWORD PTR [rax]
  232b11:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
  232b14:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  232b17:	89 c6                	mov    esi,eax
  232b19:	bf 52 c1 23 00       	mov    edi,0x23c152
  232b1e:	b8 00 00 00 00       	mov    eax,0x0
  232b23:	e8 18 08 00 00       	call   233340 <printf>
  232b28:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  232b2c:	48 83 c0 08          	add    rax,0x8
  232b30:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  232b34:	e9 2d 05 00 00       	jmp    233066 <main+0x59b>
  232b39:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  232b3d:	8b 50 04             	mov    edx,DWORD PTR [rax+0x4]
  232b40:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  232b44:	8b 00                	mov    eax,DWORD PTR [rax]
  232b46:	89 c6                	mov    esi,eax
  232b48:	bf 6b c1 23 00       	mov    edi,0x23c16b
  232b4d:	b8 00 00 00 00       	mov    eax,0x0
  232b52:	e8 e9 07 00 00       	call   233340 <printf>
  232b57:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  232b5b:	8b 00                	mov    eax,DWORD PTR [rax]
  232b5d:	83 f8 08             	cmp    eax,0x8
  232b60:	0f 87 ed 04 00 00    	ja     233053 <main+0x588>
  232b66:	89 c0                	mov    eax,eax
  232b68:	48 8b 04 c5 e0 c2 23 	mov    rax,QWORD PTR [rax*8+0x23c2e0]
  232b6f:	00 
  232b70:	3e ff e0             	notrack jmp rax
  232b73:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  232b77:	48 83 c0 08          	add    rax,0x8
  232b7b:	48 89 c6             	mov    rsi,rax
  232b7e:	bf 80 c1 23 00       	mov    edi,0x23c180
  232b83:	b8 00 00 00 00       	mov    eax,0x0
  232b88:	e8 b3 07 00 00       	call   233340 <printf>
  232b8d:	e9 c1 04 00 00       	jmp    233053 <main+0x588>
  232b92:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  232b96:	48 83 c0 08          	add    rax,0x8
  232b9a:	48 89 c6             	mov    rsi,rax
  232b9d:	bf 93 c1 23 00       	mov    edi,0x23c193
  232ba2:	b8 00 00 00 00       	mov    eax,0x0
  232ba7:	e8 94 07 00 00       	call   233340 <printf>
  232bac:	e9 a2 04 00 00       	jmp    233053 <main+0x588>
  232bb1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  232bb5:	48 8d 48 10          	lea    rcx,[rax+0x10]
  232bb9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  232bbd:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  232bc0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  232bc4:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  232bc7:	89 c6                	mov    esi,eax
  232bc9:	bf b0 c1 23 00       	mov    edi,0x23c1b0
  232bce:	b8 00 00 00 00       	mov    eax,0x0
  232bd3:	e8 68 07 00 00       	call   233340 <printf>
  232bd8:	e9 76 04 00 00       	jmp    233053 <main+0x588>
  232bdd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  232be1:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  232be4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  232be8:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  232beb:	89 c6                	mov    esi,eax
  232bed:	bf d8 c1 23 00       	mov    edi,0x23c1d8
  232bf2:	b8 00 00 00 00       	mov    eax,0x0
  232bf7:	e8 44 07 00 00       	call   233340 <printf>
  232bfc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  232c00:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  232c03:	89 c7                	mov    edi,eax
  232c05:	e8 c6 09 00 00       	call   2335d0 <set_high_mem_base>
  232c0a:	e9 44 04 00 00       	jmp    233053 <main+0x588>
  232c0f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  232c13:	8b 48 10             	mov    ecx,DWORD PTR [rax+0x10]
  232c16:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  232c1a:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  232c1d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  232c21:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  232c24:	89 c6                	mov    esi,eax
  232c26:	bf fc c1 23 00       	mov    edi,0x23c1fc
  232c2b:	b8 00 00 00 00       	mov    eax,0x0
  232c30:	e8 0b 07 00 00       	call   233340 <printf>
  232c35:	e9 19 04 00 00       	jmp    233053 <main+0x588>
  232c3a:	bf 14 c2 23 00       	mov    edi,0x23c214
  232c3f:	b8 00 00 00 00       	mov    eax,0x0
  232c44:	e8 f7 06 00 00       	call   233340 <printf>
  232c49:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  232c4d:	48 83 c0 10          	add    rax,0x10
  232c51:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  232c55:	e9 fe 00 00 00       	jmp    232d58 <main+0x28d>
  232c5a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  232c5e:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  232c61:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  232c65:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  232c69:	89 c7                	mov    edi,eax
  232c6b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  232c6f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  232c73:	48 c1 e8 20          	shr    rax,0x20
  232c77:	89 c1                	mov    ecx,eax
  232c79:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  232c7d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  232c80:	89 c6                	mov    esi,eax
  232c82:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  232c86:	48 8b 00             	mov    rax,QWORD PTR [rax]
  232c89:	48 c1 e8 20          	shr    rax,0x20
  232c8d:	41 89 d1             	mov    r9d,edx
  232c90:	41 89 f8             	mov    r8d,edi
  232c93:	89 f2                	mov    edx,esi
  232c95:	89 c6                	mov    esi,eax
  232c97:	bf 20 c2 23 00       	mov    edi,0x23c220
  232c9c:	b8 00 00 00 00       	mov    eax,0x0
  232ca1:	e8 9a 06 00 00       	call   233340 <printf>
  232ca6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  232caa:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  232cad:	89 c2                	mov    edx,eax
  232caf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  232cb3:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  232cb7:	89 c1                	mov    ecx,eax
  232cb9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  232cbd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  232cc0:	89 ce                	mov    esi,ecx
  232cc2:	89 c7                	mov    edi,eax
  232cc4:	e8 1e 09 00 00       	call   2335e7 <set_mem_area>
  232cc9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  232ccd:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  232cd0:	83 f8 05             	cmp    eax,0x5
  232cd3:	74 4e                	je     232d23 <main+0x258>
  232cd5:	83 f8 05             	cmp    eax,0x5
  232cd8:	77 5a                	ja     232d34 <main+0x269>
  232cda:	83 f8 04             	cmp    eax,0x4
  232cdd:	74 33                	je     232d12 <main+0x247>
  232cdf:	83 f8 04             	cmp    eax,0x4
  232ce2:	77 50                	ja     232d34 <main+0x269>
  232ce4:	83 f8 01             	cmp    eax,0x1
  232ce7:	74 07                	je     232cf0 <main+0x225>
  232ce9:	83 f8 03             	cmp    eax,0x3
  232cec:	74 13                	je     232d01 <main+0x236>
  232cee:	eb 44                	jmp    232d34 <main+0x269>
  232cf0:	bf 53 c2 23 00       	mov    edi,0x23c253
  232cf5:	b8 00 00 00 00       	mov    eax,0x0
  232cfa:	e8 41 06 00 00       	call   233340 <printf>
  232cff:	eb 43                	jmp    232d44 <main+0x279>
  232d01:	bf 62 c2 23 00       	mov    edi,0x23c262
  232d06:	b8 00 00 00 00       	mov    eax,0x0
  232d0b:	e8 30 06 00 00       	call   233340 <printf>
  232d10:	eb 32                	jmp    232d44 <main+0x279>
  232d12:	bf 70 c2 23 00       	mov    edi,0x23c270
  232d17:	b8 00 00 00 00       	mov    eax,0x0
  232d1c:	e8 1f 06 00 00       	call   233340 <printf>
  232d21:	eb 21                	jmp    232d44 <main+0x279>
  232d23:	bf a0 c2 23 00       	mov    edi,0x23c2a0
  232d28:	b8 00 00 00 00       	mov    eax,0x0
  232d2d:	e8 0e 06 00 00       	call   233340 <printf>
  232d32:	eb 10                	jmp    232d44 <main+0x279>
  232d34:	bf ae c2 23 00       	mov    edi,0x23c2ae
  232d39:	b8 00 00 00 00       	mov    eax,0x0
  232d3e:	e8 fd 05 00 00       	call   233340 <printf>
  232d43:	90                   	nop
  232d44:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  232d48:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  232d4b:	89 c2                	mov    edx,eax
  232d4d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  232d51:	48 01 d0             	add    rax,rdx
  232d54:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  232d58:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  232d5c:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  232d5f:	89 c2                	mov    edx,eax
  232d61:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  232d65:	48 01 d0             	add    rax,rdx
  232d68:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  232d6c:	0f 82 e8 fe ff ff    	jb     232c5a <main+0x18f>
  232d72:	e9 dc 02 00 00       	jmp    233053 <main+0x588>
  232d77:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  232d7b:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  232d7f:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  232d83:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  232d87:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  232d8b:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  232d8f:	0f b6 40 1d          	movzx  eax,BYTE PTR [rax+0x1d]
  232d93:	0f b6 c0             	movzx  eax,al
  232d96:	83 f8 02             	cmp    eax,0x2
  232d99:	0f 84 5a 01 00 00    	je     232ef9 <main+0x42e>
  232d9f:	83 f8 02             	cmp    eax,0x2
  232da2:	0f 8f 5a 01 00 00    	jg     232f02 <main+0x437>
  232da8:	85 c0                	test   eax,eax
  232daa:	74 0e                	je     232dba <main+0x2ef>
  232dac:	83 f8 01             	cmp    eax,0x1
  232daf:	0f 84 15 01 00 00    	je     232eca <main+0x3ff>
  232db5:	e9 48 01 00 00       	jmp    232f02 <main+0x437>
  232dba:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  232dbe:	48 83 c0 22          	add    rax,0x22
  232dc2:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  232dc6:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  232dcd:	c7 45 e4 00 00 04 00 	mov    DWORD PTR [rbp-0x1c],0x40000
  232dd4:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  232ddb:	e9 d4 00 00 00       	jmp    232eb4 <main+0x3e9>
  232de0:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  232de3:	48 89 d0             	mov    rax,rdx
  232de6:	48 01 c0             	add    rax,rax
  232de9:	48 01 c2             	add    rdx,rax
  232dec:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  232df0:	48 01 d0             	add    rax,rdx
  232df3:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  232df7:	0f b6 c0             	movzx  eax,al
  232dfa:	ba ff 00 00 00       	mov    edx,0xff
  232dff:	89 d1                	mov    ecx,edx
  232e01:	29 c1                	sub    ecx,eax
  232e03:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  232e06:	48 89 d0             	mov    rax,rdx
  232e09:	48 01 c0             	add    rax,rax
  232e0c:	48 01 c2             	add    rdx,rax
  232e0f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  232e13:	48 01 d0             	add    rax,rdx
  232e16:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  232e1a:	0f b6 d0             	movzx  edx,al
  232e1d:	b8 ff 00 00 00       	mov    eax,0xff
  232e22:	29 d0                	sub    eax,edx
  232e24:	89 ce                	mov    esi,ecx
  232e26:	0f af f0             	imul   esi,eax
  232e29:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  232e2c:	48 89 d0             	mov    rax,rdx
  232e2f:	48 01 c0             	add    rax,rax
  232e32:	48 01 c2             	add    rdx,rax
  232e35:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  232e39:	48 01 d0             	add    rax,rdx
  232e3c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  232e3f:	0f b6 c8             	movzx  ecx,al
  232e42:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  232e45:	48 89 d0             	mov    rax,rdx
  232e48:	48 01 c0             	add    rax,rax
  232e4b:	48 01 c2             	add    rdx,rax
  232e4e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  232e52:	48 01 d0             	add    rax,rdx
  232e55:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  232e58:	0f b6 c0             	movzx  eax,al
  232e5b:	0f af c1             	imul   eax,ecx
  232e5e:	01 c6                	add    esi,eax
  232e60:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  232e63:	48 89 d0             	mov    rax,rdx
  232e66:	48 01 c0             	add    rax,rax
  232e69:	48 01 c2             	add    rdx,rax
  232e6c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  232e70:	48 01 d0             	add    rax,rdx
  232e73:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  232e77:	0f b6 c8             	movzx  ecx,al
  232e7a:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  232e7d:	48 89 d0             	mov    rax,rdx
  232e80:	48 01 c0             	add    rax,rax
  232e83:	48 01 c2             	add    rdx,rax
  232e86:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  232e8a:	48 01 d0             	add    rax,rdx
  232e8d:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  232e91:	0f b6 c0             	movzx  eax,al
  232e94:	0f af c1             	imul   eax,ecx
  232e97:	01 f0                	add    eax,esi
  232e99:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
  232e9c:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  232e9f:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  232ea2:	73 0c                	jae    232eb0 <main+0x3e5>
  232ea4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  232ea7:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  232eaa:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  232ead:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
  232eb0:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  232eb4:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  232eb8:	0f b7 40 20          	movzx  eax,WORD PTR [rax+0x20]
  232ebc:	0f b7 c0             	movzx  eax,ax
  232ebf:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  232ec2:	0f 82 18 ff ff ff    	jb     232de0 <main+0x315>
  232ec8:	eb 40                	jmp    232f0a <main+0x43f>
  232eca:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  232ece:	0f b6 40 25          	movzx  eax,BYTE PTR [rax+0x25]
  232ed2:	0f b6 c0             	movzx  eax,al
  232ed5:	ba 01 00 00 00       	mov    edx,0x1
  232eda:	89 c1                	mov    ecx,eax
  232edc:	d3 e2                	shl    edx,cl
  232ede:	89 d0                	mov    eax,edx
  232ee0:	8d 50 ff             	lea    edx,[rax-0x1]
  232ee3:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  232ee7:	0f b6 40 24          	movzx  eax,BYTE PTR [rax+0x24]
  232eeb:	0f b6 c0             	movzx  eax,al
  232eee:	89 c1                	mov    ecx,eax
  232ef0:	d3 e2                	shl    edx,cl
  232ef2:	89 d0                	mov    eax,edx
  232ef4:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  232ef7:	eb 11                	jmp    232f0a <main+0x43f>
  232ef9:	c7 45 ec 5c 01 00 00 	mov    DWORD PTR [rbp-0x14],0x15c
  232f00:	eb 08                	jmp    232f0a <main+0x43f>
  232f02:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  232f09:	90                   	nop
  232f0a:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  232f11:	e9 20 01 00 00       	jmp    233036 <main+0x56b>
  232f16:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  232f1a:	0f b6 40 1c          	movzx  eax,BYTE PTR [rax+0x1c]
  232f1e:	0f b6 c0             	movzx  eax,al
  232f21:	83 f8 20             	cmp    eax,0x20
  232f24:	0f 84 db 00 00 00    	je     233005 <main+0x53a>
  232f2a:	83 f8 20             	cmp    eax,0x20
  232f2d:	0f 8f ff 00 00 00    	jg     233032 <main+0x567>
  232f33:	83 f8 18             	cmp    eax,0x18
  232f36:	0f 84 83 00 00 00    	je     232fbf <main+0x4f4>
  232f3c:	83 f8 18             	cmp    eax,0x18
  232f3f:	0f 8f ed 00 00 00    	jg     233032 <main+0x567>
  232f45:	83 f8 08             	cmp    eax,0x8
  232f48:	74 17                	je     232f61 <main+0x496>
  232f4a:	83 f8 08             	cmp    eax,0x8
  232f4d:	0f 8c df 00 00 00    	jl     233032 <main+0x567>
  232f53:	83 e8 0f             	sub    eax,0xf
  232f56:	83 f8 01             	cmp    eax,0x1
  232f59:	0f 87 d3 00 00 00    	ja     233032 <main+0x567>
  232f5f:	eb 2e                	jmp    232f8f <main+0x4c4>
  232f61:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  232f65:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  232f68:	0f af 45 e8          	imul   eax,DWORD PTR [rbp-0x18]
  232f6c:	89 c2                	mov    edx,eax
  232f6e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  232f71:	48 01 c2             	add    rdx,rax
  232f74:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  232f78:	48 01 d0             	add    rax,rdx
  232f7b:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  232f7f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  232f82:	89 c2                	mov    edx,eax
  232f84:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  232f88:	88 10                	mov    BYTE PTR [rax],dl
  232f8a:	e9 a3 00 00 00       	jmp    233032 <main+0x567>
  232f8f:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  232f93:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  232f96:	0f af 45 e8          	imul   eax,DWORD PTR [rbp-0x18]
  232f9a:	89 c2                	mov    edx,eax
  232f9c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  232f9f:	01 c0                	add    eax,eax
  232fa1:	89 c0                	mov    eax,eax
  232fa3:	48 01 c2             	add    rdx,rax
  232fa6:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  232faa:	48 01 d0             	add    rax,rdx
  232fad:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
  232fb1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  232fb4:	89 c2                	mov    edx,eax
  232fb6:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  232fba:	66 89 10             	mov    WORD PTR [rax],dx
  232fbd:	eb 73                	jmp    233032 <main+0x567>
  232fbf:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  232fc3:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  232fc6:	0f af 45 e8          	imul   eax,DWORD PTR [rbp-0x18]
  232fca:	89 c1                	mov    ecx,eax
  232fcc:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  232fcf:	89 d0                	mov    eax,edx
  232fd1:	01 c0                	add    eax,eax
  232fd3:	01 d0                	add    eax,edx
  232fd5:	89 c0                	mov    eax,eax
  232fd7:	48 8d 14 01          	lea    rdx,[rcx+rax*1]
  232fdb:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  232fdf:	48 01 d0             	add    rax,rdx
  232fe2:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  232fe6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  232fe9:	25 ff ff ff 00       	and    eax,0xffffff
  232fee:	89 c2                	mov    edx,eax
  232ff0:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  232ff4:	8b 00                	mov    eax,DWORD PTR [rax]
  232ff6:	25 00 00 00 ff       	and    eax,0xff000000
  232ffb:	09 c2                	or     edx,eax
  232ffd:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  233001:	89 10                	mov    DWORD PTR [rax],edx
  233003:	eb 2d                	jmp    233032 <main+0x567>
  233005:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  233009:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  23300c:	0f af 45 e8          	imul   eax,DWORD PTR [rbp-0x18]
  233010:	89 c2                	mov    edx,eax
  233012:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  233015:	c1 e0 02             	shl    eax,0x2
  233018:	89 c0                	mov    eax,eax
  23301a:	48 01 c2             	add    rdx,rax
  23301d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  233021:	48 01 d0             	add    rax,rdx
  233024:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
  233028:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  23302c:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  23302f:	89 10                	mov    DWORD PTR [rax],edx
  233031:	90                   	nop
  233032:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  233036:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  23303a:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  23303d:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  233040:	73 10                	jae    233052 <main+0x587>
  233042:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  233046:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  233049:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  23304c:	0f 82 c4 fe ff ff    	jb     232f16 <main+0x44b>
  233052:	90                   	nop
  233053:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  233057:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  23305a:	83 c0 07             	add    eax,0x7
  23305d:	89 c0                	mov    eax,eax
  23305f:	83 e0 f8             	and    eax,0xfffffff8
  233062:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
  233066:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23306a:	8b 00                	mov    eax,DWORD PTR [rax]
  23306c:	85 c0                	test   eax,eax
  23306e:	0f 85 c5 fa ff ff    	jne    232b39 <main+0x6e>
  233074:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  233078:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  23307b:	83 c0 07             	add    eax,0x7
  23307e:	89 c0                	mov    eax,eax
  233080:	83 e0 f8             	and    eax,0xfffffff8
  233083:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
  233087:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23308b:	89 c0                	mov    eax,eax
  23308d:	48 2b 45 80          	sub    rax,QWORD PTR [rbp-0x80]
  233091:	48 89 c6             	mov    rsi,rax
  233094:	bf bc c2 23 00       	mov    edi,0x23c2bc
  233099:	b8 00 00 00 00       	mov    eax,0x0
  23309e:	e8 9d 02 00 00       	call   233340 <printf>
  2330a3:	b8 75 04 00 00       	mov    eax,0x475
  2330a8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  2330ab:	88 45 d3             	mov    BYTE PTR [rbp-0x2d],al
  2330ae:	0f be 45 d3          	movsx  eax,BYTE PTR [rbp-0x2d]
  2330b2:	89 c6                	mov    esi,eax
  2330b4:	bf d1 c2 23 00       	mov    edi,0x23c2d1
  2330b9:	b8 00 00 00 00       	mov    eax,0x0
  2330be:	e8 7d 02 00 00       	call   233340 <printf>
  2330c3:	b8 00 00 00 00       	mov    eax,0x0
  2330c8:	e8 52 04 00 00       	call   23351f <init_paging>
  2330cd:	b8 00 00 00 00       	mov    eax,0x0
  2330d2:	e8 a6 3e 00 00       	call   236f7d <init_gdt>
  2330d7:	b8 00 00 00 00       	mov    eax,0x0
  2330dc:	e8 9f f2 ff ff       	call   232380 <init_int>
  2330e1:	b8 00 00 00 00       	mov    eax,0x0
  2330e6:	e8 b1 07 00 00       	call   23389c <init_memory>
  2330eb:	b8 00 00 00 00       	mov    eax,0x0
  2330f0:	e8 df 1d 00 00       	call   234ed4 <init_drvdev_man>
  2330f5:	b8 00 00 00 00       	mov    eax,0x0
  2330fa:	e8 c0 2c 00 00       	call   235dbf <init_proc>
  2330ff:	b8 00 00 00 00       	mov    eax,0x0
  233104:	e8 29 7a 00 00       	call   23ab32 <init_tty>
  233109:	b8 00 00 00 00       	mov    eax,0x0
  23310e:	e8 34 4c 00 00       	call   237d47 <init_kb>
  233113:	b8 00 00 00 00       	mov    eax,0x0
  233118:	e8 84 4d 00 00       	call   237ea1 <init_disk>
  23311d:	b8 00 00 00 00       	mov    eax,0x0
  233122:	e8 46 1d 00 00       	call   234e6d <init_vfs>
  233127:	c7 05 af 8a 00 00 00 	mov    DWORD PTR [rip+0x8aaf],0x0        # 23bbe0 <manage_proc_lock>
  23312e:	00 00 00 
  233131:	eb fe                	jmp    233131 <main+0x666>

0000000000233133 <init_logging>:
  233133:	f3 0f 1e fa          	endbr64 
  233137:	55                   	push   rbp
  233138:	48 89 e5             	mov    rbp,rsp
  23313b:	48 c7 05 62 df fc ff 	mov    QWORD PTR [rip+0xfffffffffffcdf62],0xb8000        # 2010a8 <video>
  233142:	00 80 0b 00 
  233146:	c7 05 60 df fc ff 00 	mov    DWORD PTR [rip+0xfffffffffffcdf60],0x0        # 2010b0 <xpos>
  23314d:	00 00 00 
  233150:	c7 05 5a df fc ff 00 	mov    DWORD PTR [rip+0xfffffffffffcdf5a],0x0        # 2010b4 <ypos>
  233157:	00 00 00 
  23315a:	90                   	nop
  23315b:	5d                   	pop    rbp
  23315c:	c3                   	ret    

000000000023315d <itoa>:
  23315d:	f3 0f 1e fa          	endbr64 
  233161:	55                   	push   rbp
  233162:	48 89 e5             	mov    rbp,rsp
  233165:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  233169:	89 75 c4             	mov    DWORD PTR [rbp-0x3c],esi
  23316c:	89 55 c0             	mov    DWORD PTR [rbp-0x40],edx
  23316f:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  233173:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  233177:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  23317a:	48 98                	cdqe   
  23317c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  233180:	c7 45 dc 0a 00 00 00 	mov    DWORD PTR [rbp-0x24],0xa
  233187:	83 7d c4 64          	cmp    DWORD PTR [rbp-0x3c],0x64
  23318b:	75 27                	jne    2331b4 <itoa+0x57>
  23318d:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
  233191:	79 21                	jns    2331b4 <itoa+0x57>
  233193:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  233197:	48 8d 50 01          	lea    rdx,[rax+0x1]
  23319b:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  23319f:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
  2331a2:	48 83 45 c8 01       	add    QWORD PTR [rbp-0x38],0x1
  2331a7:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  2331aa:	f7 d8                	neg    eax
  2331ac:	48 98                	cdqe   
  2331ae:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  2331b2:	eb 0d                	jmp    2331c1 <itoa+0x64>
  2331b4:	83 7d c4 78          	cmp    DWORD PTR [rbp-0x3c],0x78
  2331b8:	75 07                	jne    2331c1 <itoa+0x64>
  2331ba:	c7 45 dc 10 00 00 00 	mov    DWORD PTR [rbp-0x24],0x10
  2331c1:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  2331c4:	48 63 c8             	movsxd rcx,eax
  2331c7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  2331cb:	ba 00 00 00 00       	mov    edx,0x0
  2331d0:	48 f7 f1             	div    rcx
  2331d3:	48 89 d0             	mov    rax,rdx
  2331d6:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
  2331d9:	83 7d d8 09          	cmp    DWORD PTR [rbp-0x28],0x9
  2331dd:	7f 0a                	jg     2331e9 <itoa+0x8c>
  2331df:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  2331e2:	83 c0 30             	add    eax,0x30
  2331e5:	89 c1                	mov    ecx,eax
  2331e7:	eb 08                	jmp    2331f1 <itoa+0x94>
  2331e9:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  2331ec:	83 c0 57             	add    eax,0x57
  2331ef:	89 c1                	mov    ecx,eax
  2331f1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2331f5:	48 8d 50 01          	lea    rdx,[rax+0x1]
  2331f9:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  2331fd:	88 08                	mov    BYTE PTR [rax],cl
  2331ff:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  233202:	48 63 f0             	movsxd rsi,eax
  233205:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  233209:	ba 00 00 00 00       	mov    edx,0x0
  23320e:	48 f7 f6             	div    rsi
  233211:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  233215:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  23321a:	75 a5                	jne    2331c1 <itoa+0x64>
  23321c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  233220:	c6 00 00             	mov    BYTE PTR [rax],0x0
  233223:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  233227:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  23322b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23322f:	48 83 e8 01          	sub    rax,0x1
  233233:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  233237:	eb 2b                	jmp    233264 <itoa+0x107>
  233239:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  23323d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  233240:	88 45 d7             	mov    BYTE PTR [rbp-0x29],al
  233243:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  233247:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  23324a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  23324e:	88 10                	mov    BYTE PTR [rax],dl
  233250:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  233254:	0f b6 55 d7          	movzx  edx,BYTE PTR [rbp-0x29]
  233258:	88 10                	mov    BYTE PTR [rax],dl
  23325a:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  23325f:	48 83 6d e8 01       	sub    QWORD PTR [rbp-0x18],0x1
  233264:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  233268:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
  23326c:	72 cb                	jb     233239 <itoa+0xdc>
  23326e:	90                   	nop
  23326f:	90                   	nop
  233270:	5d                   	pop    rbp
  233271:	c3                   	ret    

0000000000233272 <putchar>:
  233272:	f3 0f 1e fa          	endbr64 
  233276:	55                   	push   rbp
  233277:	48 89 e5             	mov    rbp,rsp
  23327a:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  23327d:	83 7d fc 0a          	cmp    DWORD PTR [rbp-0x4],0xa
  233281:	74 06                	je     233289 <putchar+0x17>
  233283:	83 7d fc 0d          	cmp    DWORD PTR [rbp-0x4],0xd
  233287:	75 38                	jne    2332c1 <putchar+0x4f>
  233289:	90                   	nop
  23328a:	eb 01                	jmp    23328d <putchar+0x1b>
  23328c:	90                   	nop
  23328d:	c7 05 19 de fc ff 00 	mov    DWORD PTR [rip+0xfffffffffffcde19],0x0        # 2010b0 <xpos>
  233294:	00 00 00 
  233297:	8b 05 17 de fc ff    	mov    eax,DWORD PTR [rip+0xfffffffffffcde17]        # 2010b4 <ypos>
  23329d:	83 c0 01             	add    eax,0x1
  2332a0:	89 05 0e de fc ff    	mov    DWORD PTR [rip+0xfffffffffffcde0e],eax        # 2010b4 <ypos>
  2332a6:	8b 05 08 de fc ff    	mov    eax,DWORD PTR [rip+0xfffffffffffcde08]        # 2010b4 <ypos>
  2332ac:	83 f8 17             	cmp    eax,0x17
  2332af:	0f 8e 88 00 00 00    	jle    23333d <putchar+0xcb>
  2332b5:	c7 05 f5 dd fc ff 00 	mov    DWORD PTR [rip+0xfffffffffffcddf5],0x0        # 2010b4 <ypos>
  2332bc:	00 00 00 
  2332bf:	eb 7c                	jmp    23333d <putchar+0xcb>
  2332c1:	48 8b 0d e0 dd fc ff 	mov    rcx,QWORD PTR [rip+0xfffffffffffcdde0]        # 2010a8 <video>
  2332c8:	8b 15 e6 dd fc ff    	mov    edx,DWORD PTR [rip+0xfffffffffffcdde6]        # 2010b4 <ypos>
  2332ce:	89 d0                	mov    eax,edx
  2332d0:	c1 e0 02             	shl    eax,0x2
  2332d3:	01 d0                	add    eax,edx
  2332d5:	c1 e0 04             	shl    eax,0x4
  2332d8:	89 c2                	mov    edx,eax
  2332da:	8b 05 d0 dd fc ff    	mov    eax,DWORD PTR [rip+0xfffffffffffcddd0]        # 2010b0 <xpos>
  2332e0:	01 d0                	add    eax,edx
  2332e2:	01 c0                	add    eax,eax
  2332e4:	48 98                	cdqe   
  2332e6:	48 01 c8             	add    rax,rcx
  2332e9:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  2332ec:	88 10                	mov    BYTE PTR [rax],dl
  2332ee:	48 8b 0d b3 dd fc ff 	mov    rcx,QWORD PTR [rip+0xfffffffffffcddb3]        # 2010a8 <video>
  2332f5:	8b 15 b9 dd fc ff    	mov    edx,DWORD PTR [rip+0xfffffffffffcddb9]        # 2010b4 <ypos>
  2332fb:	89 d0                	mov    eax,edx
  2332fd:	c1 e0 02             	shl    eax,0x2
  233300:	01 d0                	add    eax,edx
  233302:	c1 e0 04             	shl    eax,0x4
  233305:	89 c2                	mov    edx,eax
  233307:	8b 05 a3 dd fc ff    	mov    eax,DWORD PTR [rip+0xfffffffffffcdda3]        # 2010b0 <xpos>
  23330d:	01 d0                	add    eax,edx
  23330f:	01 c0                	add    eax,eax
  233311:	48 98                	cdqe   
  233313:	48 83 c0 01          	add    rax,0x1
  233317:	48 01 c8             	add    rax,rcx
  23331a:	c6 00 07             	mov    BYTE PTR [rax],0x7
  23331d:	8b 05 8d dd fc ff    	mov    eax,DWORD PTR [rip+0xfffffffffffcdd8d]        # 2010b0 <xpos>
  233323:	83 c0 01             	add    eax,0x1
  233326:	89 05 84 dd fc ff    	mov    DWORD PTR [rip+0xfffffffffffcdd84],eax        # 2010b0 <xpos>
  23332c:	8b 05 7e dd fc ff    	mov    eax,DWORD PTR [rip+0xfffffffffffcdd7e]        # 2010b0 <xpos>
  233332:	83 f8 4f             	cmp    eax,0x4f
  233335:	0f 8f 51 ff ff ff    	jg     23328c <putchar+0x1a>
  23333b:	eb 01                	jmp    23333e <putchar+0xcc>
  23333d:	90                   	nop
  23333e:	5d                   	pop    rbp
  23333f:	c3                   	ret    

0000000000233340 <printf>:
  233340:	f3 0f 1e fa          	endbr64 
  233344:	55                   	push   rbp
  233345:	48 89 e5             	mov    rbp,rsp
  233348:	48 81 ec f0 00 00 00 	sub    rsp,0xf0
  23334f:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
  233356:	48 89 b5 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rsi
  23335d:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  233364:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  23336b:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  233372:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  233379:	84 c0                	test   al,al
  23337b:	74 20                	je     23339d <printf+0x5d>
  23337d:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  233381:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  233385:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  233389:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  23338d:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  233391:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  233395:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  233399:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7
  23339d:	48 8d 85 18 ff ff ff 	lea    rax,[rbp-0xe8]
  2333a4:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
  2333ab:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x8
  2333b2:	08 
  2333b3:	e9 38 01 00 00       	jmp    2334f0 <printf+0x1b0>
  2333b8:	83 bd 3c ff ff ff 25 	cmp    DWORD PTR [rbp-0xc4],0x25
  2333bf:	74 12                	je     2333d3 <printf+0x93>
  2333c1:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  2333c7:	89 c7                	mov    edi,eax
  2333c9:	e8 a4 fe ff ff       	call   233272 <putchar>
  2333ce:	e9 1d 01 00 00       	jmp    2334f0 <printf+0x1b0>
  2333d3:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  2333da:	48 8d 50 01          	lea    rdx,[rax+0x1]
  2333de:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  2333e5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  2333e8:	0f be c0             	movsx  eax,al
  2333eb:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
  2333f1:	83 bd 3c ff ff ff 78 	cmp    DWORD PTR [rbp-0xc4],0x78
  2333f8:	74 3a                	je     233434 <printf+0xf4>
  2333fa:	83 bd 3c ff ff ff 78 	cmp    DWORD PTR [rbp-0xc4],0x78
  233401:	0f 8f cd 00 00 00    	jg     2334d4 <printf+0x194>
  233407:	83 bd 3c ff ff ff 75 	cmp    DWORD PTR [rbp-0xc4],0x75
  23340e:	74 24                	je     233434 <printf+0xf4>
  233410:	83 bd 3c ff ff ff 75 	cmp    DWORD PTR [rbp-0xc4],0x75
  233417:	0f 8f b7 00 00 00    	jg     2334d4 <printf+0x194>
  23341d:	83 bd 3c ff ff ff 64 	cmp    DWORD PTR [rbp-0xc4],0x64
  233424:	74 0e                	je     233434 <printf+0xf4>
  233426:	83 bd 3c ff ff ff 73 	cmp    DWORD PTR [rbp-0xc4],0x73
  23342d:	74 40                	je     23346f <printf+0x12f>
  23342f:	e9 a0 00 00 00       	jmp    2334d4 <printf+0x194>
  233434:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  23343b:	48 8d 50 08          	lea    rdx,[rax+0x8]
  23343f:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  233446:	8b 10                	mov    edx,DWORD PTR [rax]
  233448:	8b 8d 3c ff ff ff    	mov    ecx,DWORD PTR [rbp-0xc4]
  23344e:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  233455:	89 ce                	mov    esi,ecx
  233457:	48 89 c7             	mov    rdi,rax
  23345a:	e8 fe fc ff ff       	call   23315d <itoa>
  23345f:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  233466:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
  23346d:	eb 34                	jmp    2334a3 <printf+0x163>
  23346f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  233476:	48 8d 50 08          	lea    rdx,[rax+0x8]
  23347a:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  233481:	48 8b 00             	mov    rax,QWORD PTR [rax]
  233484:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
  23348b:	48 83 bd 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],0x0
  233492:	00 
  233493:	75 0d                	jne    2334a2 <printf+0x162>
  233495:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x23c328
  23349c:	28 c3 23 00 
  2334a0:	eb 22                	jmp    2334c4 <printf+0x184>
  2334a2:	90                   	nop
  2334a3:	eb 1f                	jmp    2334c4 <printf+0x184>
  2334a5:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  2334ac:	48 8d 50 01          	lea    rdx,[rax+0x1]
  2334b0:	48 89 95 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rdx
  2334b7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  2334ba:	0f be c0             	movsx  eax,al
  2334bd:	89 c7                	mov    edi,eax
  2334bf:	e8 ae fd ff ff       	call   233272 <putchar>
  2334c4:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  2334cb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  2334ce:	84 c0                	test   al,al
  2334d0:	75 d3                	jne    2334a5 <printf+0x165>
  2334d2:	eb 1c                	jmp    2334f0 <printf+0x1b0>
  2334d4:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  2334db:	48 8d 50 08          	lea    rdx,[rax+0x8]
  2334df:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  2334e6:	8b 00                	mov    eax,DWORD PTR [rax]
  2334e8:	89 c7                	mov    edi,eax
  2334ea:	e8 83 fd ff ff       	call   233272 <putchar>
  2334ef:	90                   	nop
  2334f0:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  2334f7:	48 8d 50 01          	lea    rdx,[rax+0x1]
  2334fb:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  233502:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  233505:	0f be c0             	movsx  eax,al
  233508:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
  23350e:	83 bd 3c ff ff ff 00 	cmp    DWORD PTR [rbp-0xc4],0x0
  233515:	0f 85 9d fe ff ff    	jne    2333b8 <printf+0x78>
  23351b:	90                   	nop
  23351c:	90                   	nop
  23351d:	c9                   	leave  
  23351e:	c3                   	ret    

000000000023351f <init_paging>:
  23351f:	f3 0f 1e fa          	endbr64 
  233523:	55                   	push   rbp
  233524:	48 89 e5             	mov    rbp,rsp
  233527:	48 83 ec 20          	sub    rsp,0x20
  23352b:	c7 45 fc 00 10 10 00 	mov    DWORD PTR [rbp-0x4],0x101000
  233532:	48 8b 05 af 86 00 00 	mov    rax,QWORD PTR [rip+0x86af]        # 23bbe8 <page_index>
  233539:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  23353d:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  233544:	eb 6a                	jmp    2335b0 <init_paging+0x91>
  233546:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  233549:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  23354c:	48 63 d2             	movsxd rdx,edx
  23354f:	48 8d 0c 95 00 00 00 	lea    rcx,[rdx*4+0x0]
  233556:	00 
  233557:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  23355b:	48 01 d1             	add    rcx,rdx
  23355e:	ba 03 00 00 00       	mov    edx,0x3
  233563:	89 c6                	mov    esi,eax
  233565:	48 89 cf             	mov    rdi,rcx
  233568:	e8 dc 04 00 00       	call   233a49 <set_page_item>
  23356d:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  233574:	eb 2d                	jmp    2335a3 <init_paging+0x84>
  233576:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  233579:	c1 e0 0a             	shl    eax,0xa
  23357c:	89 c2                	mov    edx,eax
  23357e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  233581:	01 d0                	add    eax,edx
  233583:	c1 e0 0c             	shl    eax,0xc
  233586:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  233589:	48 89 d1             	mov    rcx,rdx
  23358c:	ba 03 00 00 00       	mov    edx,0x3
  233591:	89 c6                	mov    esi,eax
  233593:	48 89 cf             	mov    rdi,rcx
  233596:	e8 ae 04 00 00       	call   233a49 <set_page_item>
  23359b:	83 45 fc 04          	add    DWORD PTR [rbp-0x4],0x4
  23359f:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  2335a3:	81 7d f4 ff 03 00 00 	cmp    DWORD PTR [rbp-0xc],0x3ff
  2335aa:	7e ca                	jle    233576 <init_paging+0x57>
  2335ac:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  2335b0:	81 7d f8 ff 00 00 00 	cmp    DWORD PTR [rbp-0x8],0xff
  2335b7:	7e 8d                	jle    233546 <init_paging+0x27>
  2335b9:	8b 05 29 86 00 00    	mov    eax,DWORD PTR [rip+0x8629]        # 23bbe8 <page_index>
  2335bf:	0f 22 d8             	mov    cr3,rax
  2335c2:	0f 20 c0             	mov    rax,cr0
  2335c5:	0d 00 00 00 80       	or     eax,0x80000000
  2335ca:	0f 22 c0             	mov    cr0,rax
  2335cd:	90                   	nop
  2335ce:	c9                   	leave  
  2335cf:	c3                   	ret    

00000000002335d0 <set_high_mem_base>:
  2335d0:	f3 0f 1e fa          	endbr64 
  2335d4:	55                   	push   rbp
  2335d5:	48 89 e5             	mov    rbp,rsp
  2335d8:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  2335db:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2335de:	89 05 14 86 00 00    	mov    DWORD PTR [rip+0x8614],eax        # 23bbf8 <high_mem_base>
  2335e4:	90                   	nop
  2335e5:	5d                   	pop    rbp
  2335e6:	c3                   	ret    

00000000002335e7 <set_mem_area>:
  2335e7:	f3 0f 1e fa          	endbr64 
  2335eb:	55                   	push   rbp
  2335ec:	48 89 e5             	mov    rbp,rsp
  2335ef:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  2335f2:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  2335f5:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  2335f8:	8b 05 d2 dc fc ff    	mov    eax,DWORD PTR [rip+0xfffffffffffcdcd2]        # 2012d0 <mmap_t_i>
  2335fe:	48 63 d0             	movsxd rdx,eax
  233601:	48 89 d0             	mov    rax,rdx
  233604:	48 01 c0             	add    rax,rax
  233607:	48 01 d0             	add    rax,rdx
  23360a:	48 c1 e0 02          	shl    rax,0x2
  23360e:	48 8d 90 e0 11 20 00 	lea    rdx,[rax+0x2011e0]
  233615:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  233618:	89 02                	mov    DWORD PTR [rdx],eax
  23361a:	8b 05 b0 dc fc ff    	mov    eax,DWORD PTR [rip+0xfffffffffffcdcb0]        # 2012d0 <mmap_t_i>
  233620:	48 63 d0             	movsxd rdx,eax
  233623:	48 89 d0             	mov    rax,rdx
  233626:	48 01 c0             	add    rax,rax
  233629:	48 01 d0             	add    rax,rdx
  23362c:	48 c1 e0 02          	shl    rax,0x2
  233630:	48 8d 90 e4 11 20 00 	lea    rdx,[rax+0x2011e4]
  233637:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  23363a:	89 02                	mov    DWORD PTR [rdx],eax
  23363c:	8b 05 8e dc fc ff    	mov    eax,DWORD PTR [rip+0xfffffffffffcdc8e]        # 2012d0 <mmap_t_i>
  233642:	8d 50 01             	lea    edx,[rax+0x1]
  233645:	89 15 85 dc fc ff    	mov    DWORD PTR [rip+0xfffffffffffcdc85],edx        # 2012d0 <mmap_t_i>
  23364b:	48 63 d0             	movsxd rdx,eax
  23364e:	48 89 d0             	mov    rax,rdx
  233651:	48 01 c0             	add    rax,rax
  233654:	48 01 d0             	add    rax,rdx
  233657:	48 c1 e0 02          	shl    rax,0x2
  23365b:	48 8d 90 e8 11 20 00 	lea    rdx,[rax+0x2011e8]
  233662:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  233665:	89 02                	mov    DWORD PTR [rdx],eax
  233667:	90                   	nop
  233668:	5d                   	pop    rbp
  233669:	c3                   	ret    

000000000023366a <vmalloc>:
  23366a:	f3 0f 1e fa          	endbr64 
  23366e:	55                   	push   rbp
  23366f:	48 89 e5             	mov    rbp,rsp
  233672:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  233679:	eb 74                	jmp    2336ef <vmalloc+0x85>
  23367b:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  233682:	eb 61                	jmp    2336e5 <vmalloc+0x7b>
  233684:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  233687:	48 98                	cdqe   
  233689:	8b 14 85 c0 11 20 00 	mov    edx,DWORD PTR [rax*4+0x2011c0]
  233690:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  233693:	be 01 00 00 00       	mov    esi,0x1
  233698:	89 c1                	mov    ecx,eax
  23369a:	d3 e6                	shl    esi,cl
  23369c:	89 f0                	mov    eax,esi
  23369e:	21 d0                	and    eax,edx
  2336a0:	85 c0                	test   eax,eax
  2336a2:	75 3d                	jne    2336e1 <vmalloc+0x77>
  2336a4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2336a7:	48 98                	cdqe   
  2336a9:	8b 14 85 c0 11 20 00 	mov    edx,DWORD PTR [rax*4+0x2011c0]
  2336b0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  2336b3:	be 01 00 00 00       	mov    esi,0x1
  2336b8:	89 c1                	mov    ecx,eax
  2336ba:	d3 e6                	shl    esi,cl
  2336bc:	89 f0                	mov    eax,esi
  2336be:	09 c2                	or     edx,eax
  2336c0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2336c3:	48 98                	cdqe   
  2336c5:	89 14 85 c0 11 20 00 	mov    DWORD PTR [rax*4+0x2011c0],edx
  2336cc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2336cf:	c1 e0 05             	shl    eax,0x5
  2336d2:	89 c2                	mov    edx,eax
  2336d4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  2336d7:	01 d0                	add    eax,edx
  2336d9:	83 c0 20             	add    eax,0x20
  2336dc:	c1 e0 0c             	shl    eax,0xc
  2336df:	eb 14                	jmp    2336f5 <vmalloc+0x8b>
  2336e1:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  2336e5:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  2336e9:	7e 99                	jle    233684 <vmalloc+0x1a>
  2336eb:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  2336ef:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  2336f3:	7e 86                	jle    23367b <vmalloc+0x11>
  2336f5:	5d                   	pop    rbp
  2336f6:	c3                   	ret    

00000000002336f7 <vmfree>:
  2336f7:	f3 0f 1e fa          	endbr64 
  2336fb:	55                   	push   rbp
  2336fc:	48 89 e5             	mov    rbp,rsp
  2336ff:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  233702:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  233705:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  23370b:	85 c0                	test   eax,eax
  23370d:	0f 48 c2             	cmovs  eax,edx
  233710:	c1 f8 0c             	sar    eax,0xc
  233713:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  233716:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  233719:	8d 50 1f             	lea    edx,[rax+0x1f]
  23371c:	85 c0                	test   eax,eax
  23371e:	0f 48 c2             	cmovs  eax,edx
  233721:	c1 f8 05             	sar    eax,0x5
  233724:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  233727:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23372a:	99                   	cdq    
  23372b:	c1 ea 1b             	shr    edx,0x1b
  23372e:	01 d0                	add    eax,edx
  233730:	83 e0 1f             	and    eax,0x1f
  233733:	29 d0                	sub    eax,edx
  233735:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  233738:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  23373b:	48 98                	cdqe   
  23373d:	8b 14 85 c0 11 20 00 	mov    edx,DWORD PTR [rax*4+0x2011c0]
  233744:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  233747:	be 01 00 00 00       	mov    esi,0x1
  23374c:	89 c1                	mov    ecx,eax
  23374e:	d3 e6                	shl    esi,cl
  233750:	89 f0                	mov    eax,esi
  233752:	f7 d0                	not    eax
  233754:	21 c2                	and    edx,eax
  233756:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  233759:	48 98                	cdqe   
  23375b:	89 14 85 c0 11 20 00 	mov    DWORD PTR [rax*4+0x2011c0],edx
  233762:	90                   	nop
  233763:	5d                   	pop    rbp
  233764:	c3                   	ret    

0000000000233765 <page_err>:
  233765:	f3 0f 1e fa          	endbr64 
  233769:	55                   	push   rbp
  23376a:	48 89 e5             	mov    rbp,rsp
  23376d:	48 83 ec 30          	sub    rsp,0x30
  233771:	fa                   	cli    
  233772:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  233779:	00 
  23377a:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  233781:	00 
  233782:	67 48 8b 45 04       	mov    rax,QWORD PTR [ebp+0x4]
  233787:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  23378b:	0f 20 d0             	mov    rax,cr2
  23378e:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  233792:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  233796:	83 e0 01             	and    eax,0x1
  233799:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
  23379c:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  2337a0:	0f 85 e3 00 00 00    	jne    233889 <page_err+0x124>
  2337a6:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  2337ad:	00 
  2337ae:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  2337b5:	00 
  2337b6:	0f 20 d8             	mov    rax,cr3
  2337b9:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  2337bd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  2337c1:	48 c1 e8 16          	shr    rax,0x16
  2337c5:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  2337cc:	00 
  2337cd:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  2337d1:	48 01 d0             	add    rax,rdx
  2337d4:	8b 00                	mov    eax,DWORD PTR [rax]
  2337d6:	83 e0 01             	and    eax,0x1
  2337d9:	85 c0                	test   eax,eax
  2337db:	75 34                	jne    233811 <page_err+0xac>
  2337dd:	b8 00 00 00 00       	mov    eax,0x0
  2337e2:	e8 83 fe ff ff       	call   23366a <vmalloc>
  2337e7:	48 98                	cdqe   
  2337e9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  2337ed:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2337f1:	89 c2                	mov    edx,eax
  2337f3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  2337f7:	48 c1 e8 16          	shr    rax,0x16
  2337fb:	48 8d 0c 85 00 00 00 	lea    rcx,[rax*4+0x0]
  233802:	00 
  233803:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  233807:	48 01 c8             	add    rax,rcx
  23380a:	83 ca 05             	or     edx,0x5
  23380d:	89 10                	mov    DWORD PTR [rax],edx
  23380f:	eb 24                	jmp    233835 <page_err+0xd0>
  233811:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  233815:	48 c1 e8 16          	shr    rax,0x16
  233819:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  233820:	00 
  233821:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  233825:	48 01 d0             	add    rax,rdx
  233828:	8b 00                	mov    eax,DWORD PTR [rax]
  23382a:	89 c0                	mov    eax,eax
  23382c:	25 00 f0 ff ff       	and    eax,0xfffff000
  233831:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  233835:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  233839:	25 ff ff 3f 00       	and    eax,0x3fffff
  23383e:	48 c1 e8 0c          	shr    rax,0xc
  233842:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
  233845:	b8 00 00 00 00       	mov    eax,0x0
  23384a:	e8 7c 00 00 00       	call   2338cb <req_a_page>
  23384f:	89 c7                	mov    edi,eax
  233851:	e8 e0 01 00 00       	call   233a36 <get_phyaddr>
  233856:	83 c8 05             	or     eax,0x5
  233859:	89 c1                	mov    ecx,eax
  23385b:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  23385e:	48 98                	cdqe   
  233860:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  233867:	00 
  233868:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23386c:	48 01 d0             	add    rax,rdx
  23386f:	8b 10                	mov    edx,DWORD PTR [rax]
  233871:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  233874:	48 98                	cdqe   
  233876:	48 8d 34 85 00 00 00 	lea    rsi,[rax*4+0x0]
  23387d:	00 
  23387e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  233882:	48 01 f0             	add    rax,rsi
  233885:	09 ca                	or     edx,ecx
  233887:	89 10                	mov    DWORD PTR [rax],edx
  233889:	b8 00 00 00 00       	mov    eax,0x0
  23388e:	e8 96 36 00 00       	call   236f29 <eoi>
  233893:	fb                   	sti    
  233894:	c9                   	leave  
  233895:	83 c4 04             	add    esp,0x4
  233898:	cf                   	iret   
  233899:	90                   	nop
  23389a:	c9                   	leave  
  23389b:	c3                   	ret    

000000000023389c <init_memory>:
  23389c:	f3 0f 1e fa          	endbr64 
  2338a0:	55                   	push   rbp
  2338a1:	48 89 e5             	mov    rbp,rsp
  2338a4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  2338ab:	eb 14                	jmp    2338c1 <init_memory+0x25>
  2338ad:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2338b0:	48 98                	cdqe   
  2338b2:	c7 04 85 c0 10 20 00 	mov    DWORD PTR [rax*4+0x2010c0],0xffffffff
  2338b9:	ff ff ff ff 
  2338bd:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  2338c1:	83 7d fc 07          	cmp    DWORD PTR [rbp-0x4],0x7
  2338c5:	7e e6                	jle    2338ad <init_memory+0x11>
  2338c7:	90                   	nop
  2338c8:	90                   	nop
  2338c9:	5d                   	pop    rbp
  2338ca:	c3                   	ret    

00000000002338cb <req_a_page>:
  2338cb:	f3 0f 1e fa          	endbr64 
  2338cf:	55                   	push   rbp
  2338d0:	48 89 e5             	mov    rbp,rsp
  2338d3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  2338da:	e9 8a 00 00 00       	jmp    233969 <req_a_page+0x9e>
  2338df:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  2338e6:	eb 77                	jmp    23395f <req_a_page+0x94>
  2338e8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2338eb:	48 98                	cdqe   
  2338ed:	8b 14 85 c0 10 20 00 	mov    edx,DWORD PTR [rax*4+0x2010c0]
  2338f4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  2338f7:	be 01 00 00 00       	mov    esi,0x1
  2338fc:	89 c1                	mov    ecx,eax
  2338fe:	d3 e6                	shl    esi,cl
  233900:	89 f0                	mov    eax,esi
  233902:	21 d0                	and    eax,edx
  233904:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  233907:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23390a:	c1 e0 05             	shl    eax,0x5
  23390d:	89 c2                	mov    edx,eax
  23390f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  233912:	01 d0                	add    eax,edx
  233914:	c1 e0 0c             	shl    eax,0xc
  233917:	3d ff ff 0f 00       	cmp    eax,0xfffff
  23391c:	7e 3d                	jle    23395b <req_a_page+0x90>
  23391e:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  233922:	75 37                	jne    23395b <req_a_page+0x90>
  233924:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  233927:	48 98                	cdqe   
  233929:	8b 14 85 c0 10 20 00 	mov    edx,DWORD PTR [rax*4+0x2010c0]
  233930:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  233933:	be 01 00 00 00       	mov    esi,0x1
  233938:	89 c1                	mov    ecx,eax
  23393a:	d3 e6                	shl    esi,cl
  23393c:	89 f0                	mov    eax,esi
  23393e:	09 c2                	or     edx,eax
  233940:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  233943:	48 98                	cdqe   
  233945:	89 14 85 c0 10 20 00 	mov    DWORD PTR [rax*4+0x2010c0],edx
  23394c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23394f:	c1 e0 05             	shl    eax,0x5
  233952:	89 c2                	mov    edx,eax
  233954:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  233957:	01 d0                	add    eax,edx
  233959:	eb 18                	jmp    233973 <req_a_page+0xa8>
  23395b:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  23395f:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  233963:	7e 83                	jle    2338e8 <req_a_page+0x1d>
  233965:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  233969:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  23396d:	0f 8e 6c ff ff ff    	jle    2338df <req_a_page+0x14>
  233973:	5d                   	pop    rbp
  233974:	c3                   	ret    

0000000000233975 <free_page>:
  233975:	f3 0f 1e fa          	endbr64 
  233979:	55                   	push   rbp
  23397a:	48 89 e5             	mov    rbp,rsp
  23397d:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  233981:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  233985:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  23398b:	85 c0                	test   eax,eax
  23398d:	0f 48 c2             	cmovs  eax,edx
  233990:	c1 f8 0c             	sar    eax,0xc
  233993:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  233996:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  233999:	8d 50 1f             	lea    edx,[rax+0x1f]
  23399c:	85 c0                	test   eax,eax
  23399e:	0f 48 c2             	cmovs  eax,edx
  2339a1:	c1 f8 05             	sar    eax,0x5
  2339a4:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  2339a7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2339aa:	99                   	cdq    
  2339ab:	c1 ea 1b             	shr    edx,0x1b
  2339ae:	01 d0                	add    eax,edx
  2339b0:	83 e0 1f             	and    eax,0x1f
  2339b3:	29 d0                	sub    eax,edx
  2339b5:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  2339b8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  2339bb:	48 98                	cdqe   
  2339bd:	8b 14 85 c0 10 20 00 	mov    edx,DWORD PTR [rax*4+0x2010c0]
  2339c4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  2339c7:	be 01 00 00 00       	mov    esi,0x1
  2339cc:	89 c1                	mov    ecx,eax
  2339ce:	d3 e6                	shl    esi,cl
  2339d0:	89 f0                	mov    eax,esi
  2339d2:	f7 d0                	not    eax
  2339d4:	21 c2                	and    edx,eax
  2339d6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  2339d9:	48 98                	cdqe   
  2339db:	89 14 85 c0 10 20 00 	mov    DWORD PTR [rax*4+0x2010c0],edx
  2339e2:	90                   	nop
  2339e3:	5d                   	pop    rbp
  2339e4:	c3                   	ret    

00000000002339e5 <check_page>:
  2339e5:	f3 0f 1e fa          	endbr64 
  2339e9:	55                   	push   rbp
  2339ea:	48 89 e5             	mov    rbp,rsp
  2339ed:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  2339f0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  2339f3:	8d 50 1f             	lea    edx,[rax+0x1f]
  2339f6:	85 c0                	test   eax,eax
  2339f8:	0f 48 c2             	cmovs  eax,edx
  2339fb:	c1 f8 05             	sar    eax,0x5
  2339fe:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  233a01:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  233a04:	99                   	cdq    
  233a05:	c1 ea 1b             	shr    edx,0x1b
  233a08:	01 d0                	add    eax,edx
  233a0a:	83 e0 1f             	and    eax,0x1f
  233a0d:	29 d0                	sub    eax,edx
  233a0f:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  233a12:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  233a15:	48 98                	cdqe   
  233a17:	8b 14 85 c0 10 20 00 	mov    edx,DWORD PTR [rax*4+0x2010c0]
  233a1e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  233a21:	be 01 00 00 00       	mov    esi,0x1
  233a26:	89 c1                	mov    ecx,eax
  233a28:	d3 e6                	shl    esi,cl
  233a2a:	89 f0                	mov    eax,esi
  233a2c:	21 d0                	and    eax,edx
  233a2e:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  233a31:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  233a34:	5d                   	pop    rbp
  233a35:	c3                   	ret    

0000000000233a36 <get_phyaddr>:
  233a36:	f3 0f 1e fa          	endbr64 
  233a3a:	55                   	push   rbp
  233a3b:	48 89 e5             	mov    rbp,rsp
  233a3e:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  233a41:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  233a44:	c1 e0 0c             	shl    eax,0xc
  233a47:	5d                   	pop    rbp
  233a48:	c3                   	ret    

0000000000233a49 <set_page_item>:
  233a49:	f3 0f 1e fa          	endbr64 
  233a4d:	55                   	push   rbp
  233a4e:	48 89 e5             	mov    rbp,rsp
  233a51:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  233a55:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  233a58:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
  233a5b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  233a5f:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  233a65:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  233a69:	8b 10                	mov    edx,DWORD PTR [rax]
  233a6b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  233a6e:	25 00 f0 ff ff       	and    eax,0xfffff000
  233a73:	09 c2                	or     edx,eax
  233a75:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  233a79:	89 10                	mov    DWORD PTR [rax],edx
  233a7b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  233a7f:	8b 10                	mov    edx,DWORD PTR [rax]
  233a81:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  233a84:	09 c2                	or     edx,eax
  233a86:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  233a8a:	89 10                	mov    DWORD PTR [rax],edx
  233a8c:	90                   	nop
  233a8d:	5d                   	pop    rbp
  233a8e:	c3                   	ret    

0000000000233a8f <set_4mb_pde>:
  233a8f:	f3 0f 1e fa          	endbr64 
  233a93:	55                   	push   rbp
  233a94:	48 89 e5             	mov    rbp,rsp
  233a97:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  233a9b:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  233a9e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  233aa2:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  233aa8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  233aac:	8b 00                	mov    eax,DWORD PTR [rax]
  233aae:	0d 81 10 00 00       	or     eax,0x1081
  233ab3:	89 c2                	mov    edx,eax
  233ab5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  233ab9:	89 10                	mov    DWORD PTR [rax],edx
  233abb:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  233abe:	25 00 00 c0 ff       	and    eax,0xffc00000
  233ac3:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  233ac6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  233aca:	8b 00                	mov    eax,DWORD PTR [rax]
  233acc:	0b 45 fc             	or     eax,DWORD PTR [rbp-0x4]
  233acf:	89 c2                	mov    edx,eax
  233ad1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  233ad5:	89 10                	mov    DWORD PTR [rax],edx
  233ad7:	90                   	nop
  233ad8:	5d                   	pop    rbp
  233ad9:	c3                   	ret    

0000000000233ada <req_page_at>:
  233ada:	f3 0f 1e fa          	endbr64 
  233ade:	55                   	push   rbp
  233adf:	48 89 e5             	mov    rbp,rsp
  233ae2:	48 83 ec 20          	sub    rsp,0x20
  233ae6:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  233ae9:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  233aec:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  233af0:	75 16                	jne    233b08 <req_page_at+0x2e>
  233af2:	b8 00 00 00 00       	mov    eax,0x0
  233af7:	e8 cf fd ff ff       	call   2338cb <req_a_page>
  233afc:	89 c7                	mov    edi,eax
  233afe:	e8 33 ff ff ff       	call   233a36 <get_phyaddr>
  233b03:	e9 92 00 00 00       	jmp    233b9a <req_page_at+0xc0>
  233b08:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  233b0b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  233b0e:	89 d6                	mov    esi,edx
  233b10:	89 c7                	mov    edi,eax
  233b12:	e8 42 01 00 00       	call   233c59 <is_pgs_ava>
  233b17:	85 c0                	test   eax,eax
  233b19:	75 07                	jne    233b22 <req_page_at+0x48>
  233b1b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  233b20:	eb 78                	jmp    233b9a <req_page_at+0xc0>
  233b22:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  233b25:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  233b2b:	85 c0                	test   eax,eax
  233b2d:	0f 48 c2             	cmovs  eax,edx
  233b30:	c1 f8 0c             	sar    eax,0xc
  233b33:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  233b36:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  233b39:	8d 50 1f             	lea    edx,[rax+0x1f]
  233b3c:	85 c0                	test   eax,eax
  233b3e:	0f 48 c2             	cmovs  eax,edx
  233b41:	c1 f8 05             	sar    eax,0x5
  233b44:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  233b47:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  233b4a:	99                   	cdq    
  233b4b:	c1 ea 1b             	shr    edx,0x1b
  233b4e:	01 d0                	add    eax,edx
  233b50:	83 e0 1f             	and    eax,0x1f
  233b53:	29 d0                	sub    eax,edx
  233b55:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
  233b58:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  233b5f:	eb 2c                	jmp    233b8d <req_page_at+0xb3>
  233b61:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  233b64:	48 98                	cdqe   
  233b66:	8b 14 85 c0 10 20 00 	mov    edx,DWORD PTR [rax*4+0x2010c0]
  233b6d:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  233b70:	be 01 00 00 00       	mov    esi,0x1
  233b75:	89 c1                	mov    ecx,eax
  233b77:	d3 e6                	shl    esi,cl
  233b79:	89 f0                	mov    eax,esi
  233b7b:	09 c2                	or     edx,eax
  233b7d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  233b80:	48 98                	cdqe   
  233b82:	89 14 85 c0 10 20 00 	mov    DWORD PTR [rax*4+0x2010c0],edx
  233b89:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  233b8d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  233b90:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  233b93:	7c cc                	jl     233b61 <req_page_at+0x87>
  233b95:	b8 00 00 00 00       	mov    eax,0x0
  233b9a:	c9                   	leave  
  233b9b:	c3                   	ret    

0000000000233b9c <chk_vm>:
  233b9c:	f3 0f 1e fa          	endbr64 
  233ba0:	55                   	push   rbp
  233ba1:	48 89 e5             	mov    rbp,rsp
  233ba4:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  233ba7:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  233baa:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  233bb1:	00 
  233bb2:	0f 20 d8             	mov    rax,cr3
  233bb5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  233bb9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  233bbc:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  233bc2:	85 c0                	test   eax,eax
  233bc4:	0f 48 c2             	cmovs  eax,edx
  233bc7:	c1 f8 16             	sar    eax,0x16
  233bca:	48 98                	cdqe   
  233bcc:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  233bd3:	00 
  233bd4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  233bd8:	48 01 d0             	add    rax,rdx
  233bdb:	8b 00                	mov    eax,DWORD PTR [rax]
  233bdd:	89 c0                	mov    eax,eax
  233bdf:	25 00 f0 ff ff       	and    eax,0xfffff000
  233be4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  233be8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  233beb:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  233bf1:	85 c0                	test   eax,eax
  233bf3:	0f 48 c2             	cmovs  eax,edx
  233bf6:	c1 f8 16             	sar    eax,0x16
  233bf9:	48 98                	cdqe   
  233bfb:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  233c02:	00 
  233c03:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  233c07:	48 01 d0             	add    rax,rdx
  233c0a:	8b 00                	mov    eax,DWORD PTR [rax]
  233c0c:	83 e0 01             	and    eax,0x1
  233c0f:	85 c0                	test   eax,eax
  233c11:	74 38                	je     233c4b <chk_vm+0xaf>
  233c13:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  233c16:	99                   	cdq    
  233c17:	c1 ea 0a             	shr    edx,0xa
  233c1a:	01 d0                	add    eax,edx
  233c1c:	25 ff ff 3f 00       	and    eax,0x3fffff
  233c21:	29 d0                	sub    eax,edx
  233c23:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  233c29:	85 c0                	test   eax,eax
  233c2b:	0f 48 c2             	cmovs  eax,edx
  233c2e:	c1 f8 0c             	sar    eax,0xc
  233c31:	48 98                	cdqe   
  233c33:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  233c3a:	00 
  233c3b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  233c3f:	48 01 d0             	add    rax,rdx
  233c42:	8b 00                	mov    eax,DWORD PTR [rax]
  233c44:	83 e0 01             	and    eax,0x1
  233c47:	85 c0                	test   eax,eax
  233c49:	75 07                	jne    233c52 <chk_vm+0xb6>
  233c4b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  233c50:	eb 05                	jmp    233c57 <chk_vm+0xbb>
  233c52:	b8 00 00 00 00       	mov    eax,0x0
  233c57:	5d                   	pop    rbp
  233c58:	c3                   	ret    

0000000000233c59 <is_pgs_ava>:
  233c59:	f3 0f 1e fa          	endbr64 
  233c5d:	55                   	push   rbp
  233c5e:	48 89 e5             	mov    rbp,rsp
  233c61:	48 83 ec 18          	sub    rsp,0x18
  233c65:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  233c68:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  233c6b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  233c6e:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  233c74:	85 c0                	test   eax,eax
  233c76:	0f 48 c2             	cmovs  eax,edx
  233c79:	c1 f8 0c             	sar    eax,0xc
  233c7c:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  233c7f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  233c86:	eb 1e                	jmp    233ca6 <is_pgs_ava+0x4d>
  233c88:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  233c8b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  233c8e:	01 d0                	add    eax,edx
  233c90:	89 c7                	mov    edi,eax
  233c92:	e8 4e fd ff ff       	call   2339e5 <check_page>
  233c97:	85 c0                	test   eax,eax
  233c99:	74 07                	je     233ca2 <is_pgs_ava+0x49>
  233c9b:	b8 00 00 00 00       	mov    eax,0x0
  233ca0:	eb 11                	jmp    233cb3 <is_pgs_ava+0x5a>
  233ca2:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  233ca6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  233ca9:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  233cac:	7c da                	jl     233c88 <is_pgs_ava+0x2f>
  233cae:	b8 01 00 00 00       	mov    eax,0x1
  233cb3:	c9                   	leave  
  233cb4:	c3                   	ret    

0000000000233cb5 <setup_sys_vol>:
  233cb5:	f3 0f 1e fa          	endbr64 
  233cb9:	55                   	push   rbp
  233cba:	48 89 e5             	mov    rbp,rsp
  233cbd:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  233cc1:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  233cc5:	c6 05 14 d6 fc ff 43 	mov    BYTE PTR [rip+0xfffffffffffcd614],0x43        # 2012e0 <vols>
  233ccc:	c6 05 0e d6 fc ff 00 	mov    BYTE PTR [rip+0xfffffffffffcd60e],0x0        # 2012e1 <vols+0x1>
  233cd3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  233cd7:	48 89 05 0a d6 fc ff 	mov    QWORD PTR [rip+0xfffffffffffcd60a],rax        # 2012e8 <vols+0x8>
  233cde:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  233ce2:	48 89 05 07 d6 fc ff 	mov    QWORD PTR [rip+0xfffffffffffcd607],rax        # 2012f0 <vols+0x10>
  233ce9:	c7 05 0d d6 fc ff 01 	mov    DWORD PTR [rip+0xfffffffffffcd60d],0x1        # 201300 <vols+0x20>
  233cf0:	00 00 00 
  233cf3:	b8 00 00 00 00       	mov    eax,0x0
  233cf8:	5d                   	pop    rbp
  233cf9:	c3                   	ret    

0000000000233cfa <sys_mkfifo>:
  233cfa:	f3 0f 1e fa          	endbr64 
  233cfe:	55                   	push   rbp
  233cff:	48 89 e5             	mov    rbp,rsp
  233d02:	48 83 ec 20          	sub    rsp,0x20
  233d06:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  233d09:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  233d10:	eb 38                	jmp    233d4a <sys_mkfifo+0x50>
  233d12:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  233d15:	48 98                	cdqe   
  233d17:	48 c1 e0 04          	shl    rax,0x4
  233d1b:	48 05 0c 2f 20 00    	add    rax,0x202f0c
  233d21:	8b 00                	mov    eax,DWORD PTR [rax]
  233d23:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  233d26:	75 1e                	jne    233d46 <sys_mkfifo+0x4c>
  233d28:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  233d2b:	48 98                	cdqe   
  233d2d:	48 c1 e0 04          	shl    rax,0x4
  233d31:	48 05 08 2f 20 00    	add    rax,0x202f08
  233d37:	8b 00                	mov    eax,DWORD PTR [rax]
  233d39:	83 f8 01             	cmp    eax,0x1
  233d3c:	75 08                	jne    233d46 <sys_mkfifo+0x4c>
  233d3e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  233d41:	e9 a6 00 00 00       	jmp    233dec <sys_mkfifo+0xf2>
  233d46:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  233d4a:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  233d4e:	7e c2                	jle    233d12 <sys_mkfifo+0x18>
  233d50:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  233d57:	e9 81 00 00 00       	jmp    233ddd <sys_mkfifo+0xe3>
  233d5c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  233d5f:	48 98                	cdqe   
  233d61:	48 c1 e0 04          	shl    rax,0x4
  233d65:	48 05 08 2f 20 00    	add    rax,0x202f08
  233d6b:	8b 00                	mov    eax,DWORD PTR [rax]
  233d6d:	85 c0                	test   eax,eax
  233d6f:	75 68                	jne    233dd9 <sys_mkfifo+0xdf>
  233d71:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  233d74:	48 98                	cdqe   
  233d76:	48 c1 e0 04          	shl    rax,0x4
  233d7a:	48 05 08 2f 20 00    	add    rax,0x202f08
  233d80:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
  233d86:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  233d89:	48 98                	cdqe   
  233d8b:	48 c1 e0 04          	shl    rax,0x4
  233d8f:	48 8d 90 0c 2f 20 00 	lea    rdx,[rax+0x202f0c]
  233d96:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  233d99:	89 02                	mov    DWORD PTR [rdx],eax
  233d9b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  233d9e:	48 98                	cdqe   
  233da0:	48 c1 e0 04          	shl    rax,0x4
  233da4:	48 05 04 2f 20 00    	add    rax,0x202f04
  233daa:	c7 00 00 10 00 00    	mov    DWORD PTR [rax],0x1000
  233db0:	b8 00 00 00 00       	mov    eax,0x0
  233db5:	e8 11 fb ff ff       	call   2338cb <req_a_page>
  233dba:	89 c7                	mov    edi,eax
  233dbc:	e8 75 fc ff ff       	call   233a36 <get_phyaddr>
  233dc1:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  233dc4:	48 63 d2             	movsxd rdx,edx
  233dc7:	48 c1 e2 04          	shl    rdx,0x4
  233dcb:	48 81 c2 00 2f 20 00 	add    rdx,0x202f00
  233dd2:	89 02                	mov    DWORD PTR [rdx],eax
  233dd4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  233dd7:	eb 13                	jmp    233dec <sys_mkfifo+0xf2>
  233dd9:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  233ddd:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  233de1:	0f 8e 75 ff ff ff    	jle    233d5c <sys_mkfifo+0x62>
  233de7:	b8 ff ff ff ff       	mov    eax,0xffffffff
  233dec:	c9                   	leave  
  233ded:	c3                   	ret    

0000000000233dee <sys_rmfifo>:
  233dee:	f3 0f 1e fa          	endbr64 
  233df2:	55                   	push   rbp
  233df3:	48 89 e5             	mov    rbp,rsp
  233df6:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  233df9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  233e00:	eb 4a                	jmp    233e4c <sys_rmfifo+0x5e>
  233e02:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  233e05:	48 98                	cdqe   
  233e07:	48 c1 e0 04          	shl    rax,0x4
  233e0b:	48 05 0c 2f 20 00    	add    rax,0x202f0c
  233e11:	8b 00                	mov    eax,DWORD PTR [rax]
  233e13:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  233e16:	75 30                	jne    233e48 <sys_rmfifo+0x5a>
  233e18:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  233e1b:	48 98                	cdqe   
  233e1d:	48 c1 e0 04          	shl    rax,0x4
  233e21:	48 05 08 2f 20 00    	add    rax,0x202f08
  233e27:	8b 00                	mov    eax,DWORD PTR [rax]
  233e29:	83 f8 01             	cmp    eax,0x1
  233e2c:	75 1a                	jne    233e48 <sys_rmfifo+0x5a>
  233e2e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  233e31:	48 98                	cdqe   
  233e33:	48 c1 e0 04          	shl    rax,0x4
  233e37:	48 05 08 2f 20 00    	add    rax,0x202f08
  233e3d:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  233e43:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  233e46:	eb 0f                	jmp    233e57 <sys_rmfifo+0x69>
  233e48:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  233e4c:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  233e50:	7e b0                	jle    233e02 <sys_rmfifo+0x14>
  233e52:	b8 ff ff ff ff       	mov    eax,0xffffffff
  233e57:	5d                   	pop    rbp
  233e58:	c3                   	ret    

0000000000233e59 <free_vol>:
  233e59:	f3 0f 1e fa          	endbr64 
  233e5d:	55                   	push   rbp
  233e5e:	48 89 e5             	mov    rbp,rsp
  233e61:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  233e64:	c7 05 92 d4 fc ff 00 	mov    DWORD PTR [rip+0xfffffffffffcd492],0x0        # 201300 <vols+0x20>
  233e6b:	00 00 00 
  233e6e:	b8 00 00 00 00       	mov    eax,0x0
  233e73:	5d                   	pop    rbp
  233e74:	c3                   	ret    

0000000000233e75 <reg_vol>:
  233e75:	f3 0f 1e fa          	endbr64 
  233e79:	55                   	push   rbp
  233e7a:	48 89 e5             	mov    rbp,rsp
  233e7d:	48 83 ec 20          	sub    rsp,0x20
  233e81:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  233e84:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  233e87:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  233e8b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  233e92:	e9 d8 00 00 00       	jmp    233f6f <reg_vol+0xfa>
  233e97:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  233e9a:	48 63 d0             	movsxd rdx,eax
  233e9d:	48 89 d0             	mov    rax,rdx
  233ea0:	48 c1 e0 02          	shl    rax,0x2
  233ea4:	48 01 d0             	add    rax,rdx
  233ea7:	48 c1 e0 03          	shl    rax,0x3
  233eab:	48 05 00 13 20 00    	add    rax,0x201300
  233eb1:	8b 00                	mov    eax,DWORD PTR [rax]
  233eb3:	85 c0                	test   eax,eax
  233eb5:	0f 85 b0 00 00 00    	jne    233f6b <reg_vol+0xf6>
  233ebb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  233ebe:	48 63 d0             	movsxd rdx,eax
  233ec1:	48 89 d0             	mov    rax,rdx
  233ec4:	48 c1 e0 02          	shl    rax,0x2
  233ec8:	48 01 d0             	add    rax,rdx
  233ecb:	48 c1 e0 03          	shl    rax,0x3
  233ecf:	48 05 00 13 20 00    	add    rax,0x201300
  233ed5:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
  233edb:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  233ede:	48 63 d0             	movsxd rdx,eax
  233ee1:	48 89 d0             	mov    rax,rdx
  233ee4:	48 01 c0             	add    rax,rax
  233ee7:	48 01 d0             	add    rax,rdx
  233eea:	48 c1 e0 03          	shl    rax,0x3
  233eee:	48 8d 88 20 34 20 00 	lea    rcx,[rax+0x203420]
  233ef5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  233ef8:	48 63 d0             	movsxd rdx,eax
  233efb:	48 89 d0             	mov    rax,rdx
  233efe:	48 c1 e0 02          	shl    rax,0x2
  233f02:	48 01 d0             	add    rax,rdx
  233f05:	48 c1 e0 03          	shl    rax,0x3
  233f09:	48 05 f8 12 20 00    	add    rax,0x2012f8
  233f0f:	48 89 08             	mov    QWORD PTR [rax],rcx
  233f12:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  233f15:	89 c7                	mov    edi,eax
  233f17:	e8 0c 1b 00 00       	call   235a28 <get_drv>
  233f1c:	48 89 c2             	mov    rdx,rax
  233f1f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  233f22:	48 63 c8             	movsxd rcx,eax
  233f25:	48 89 c8             	mov    rax,rcx
  233f28:	48 c1 e0 02          	shl    rax,0x2
  233f2c:	48 01 c8             	add    rax,rcx
  233f2f:	48 c1 e0 03          	shl    rax,0x3
  233f33:	48 05 e8 12 20 00    	add    rax,0x2012e8
  233f39:	48 89 10             	mov    QWORD PTR [rax],rdx
  233f3c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  233f3f:	48 63 d0             	movsxd rdx,eax
  233f42:	48 89 d0             	mov    rax,rdx
  233f45:	48 c1 e0 02          	shl    rax,0x2
  233f49:	48 01 d0             	add    rax,rdx
  233f4c:	48 c1 e0 03          	shl    rax,0x3
  233f50:	48 8d 90 e0 12 20 00 	lea    rdx,[rax+0x2012e0]
  233f57:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  233f5b:	48 89 c6             	mov    rsi,rax
  233f5e:	48 89 d7             	mov    rdi,rdx
  233f61:	e8 f4 73 00 00       	call   23b35a <strcpy>
  233f66:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  233f69:	eb 13                	jmp    233f7e <reg_vol+0x109>
  233f6b:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  233f6f:	83 7d fc 19          	cmp    DWORD PTR [rbp-0x4],0x19
  233f73:	0f 8e 1e ff ff ff    	jle    233e97 <reg_vol+0x22>
  233f79:	b8 ff ff ff ff       	mov    eax,0xffffffff
  233f7e:	c9                   	leave  
  233f7f:	c3                   	ret    

0000000000233f80 <sys_open>:
  233f80:	f3 0f 1e fa          	endbr64 
  233f84:	55                   	push   rbp
  233f85:	48 89 e5             	mov    rbp,rsp
  233f88:	53                   	push   rbx
  233f89:	48 81 ec 28 02 00 00 	sub    rsp,0x228
  233f90:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
  233f97:	89 b5 d4 fd ff ff    	mov    DWORD PTR [rbp-0x22c],esi
  233f9d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  233fa4:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
  233fab:	eb 20                	jmp    233fcd <sys_open+0x4d>
  233fad:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  233fb0:	48 63 d0             	movsxd rdx,eax
  233fb3:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  233fba:	48 01 d0             	add    rax,rdx
  233fbd:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  233fc0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  233fc3:	48 98                	cdqe   
  233fc5:	88 54 05 c0          	mov    BYTE PTR [rbp+rax*1-0x40],dl
  233fc9:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  233fcd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  233fd0:	48 63 d0             	movsxd rdx,eax
  233fd3:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  233fda:	48 01 d0             	add    rax,rdx
  233fdd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  233fe0:	3c 2f                	cmp    al,0x2f
  233fe2:	74 06                	je     233fea <sys_open+0x6a>
  233fe4:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  233fe8:	7e c3                	jle    233fad <sys_open+0x2d>
  233fea:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  233fed:	48 98                	cdqe   
  233fef:	c6 44 05 c0 00       	mov    BYTE PTR [rbp+rax*1-0x40],0x0
  233ff4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  233ff7:	48 98                	cdqe   
  233ff9:	48 8d 50 01          	lea    rdx,[rax+0x1]
  233ffd:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  234004:	48 01 d0             	add    rax,rdx
  234007:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23400a:	84 c0                	test   al,al
  23400c:	75 0a                	jne    234018 <sys_open+0x98>
  23400e:	b8 fe ff ff ff       	mov    eax,0xfffffffe
  234013:	e9 2b 04 00 00       	jmp    234443 <sys_open+0x4c3>
  234018:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  23401b:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
  23401e:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  234025:	eb 52                	jmp    234079 <sys_open+0xf9>
  234027:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  23402a:	48 63 d0             	movsxd rdx,eax
  23402d:	48 89 d0             	mov    rax,rdx
  234030:	48 c1 e0 02          	shl    rax,0x2
  234034:	48 01 d0             	add    rax,rdx
  234037:	48 c1 e0 03          	shl    rax,0x3
  23403b:	48 05 00 13 20 00    	add    rax,0x201300
  234041:	8b 00                	mov    eax,DWORD PTR [rax]
  234043:	85 c0                	test   eax,eax
  234045:	74 2e                	je     234075 <sys_open+0xf5>
  234047:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  23404a:	48 63 d0             	movsxd rdx,eax
  23404d:	48 89 d0             	mov    rax,rdx
  234050:	48 c1 e0 02          	shl    rax,0x2
  234054:	48 01 d0             	add    rax,rdx
  234057:	48 c1 e0 03          	shl    rax,0x3
  23405b:	48 8d 90 e0 12 20 00 	lea    rdx,[rax+0x2012e0]
  234062:	48 8d 45 c0          	lea    rax,[rbp-0x40]
  234066:	48 89 c6             	mov    rsi,rax
  234069:	48 89 d7             	mov    rdi,rdx
  23406c:	e8 89 74 00 00       	call   23b4fa <strcmp>
  234071:	85 c0                	test   eax,eax
  234073:	74 0c                	je     234081 <sys_open+0x101>
  234075:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  234079:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  23407d:	7e a8                	jle    234027 <sys_open+0xa7>
  23407f:	eb 01                	jmp    234082 <sys_open+0x102>
  234081:	90                   	nop
  234082:	83 7d ec 1a          	cmp    DWORD PTR [rbp-0x14],0x1a
  234086:	75 0a                	jne    234092 <sys_open+0x112>
  234088:	b8 ff ff ff ff       	mov    eax,0xffffffff
  23408d:	e9 b1 03 00 00       	jmp    234443 <sys_open+0x4c3>
  234092:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
  234099:	b8 00 00 00 00       	mov    eax,0x0
  23409e:	b9 17 00 00 00       	mov    ecx,0x17
  2340a3:	48 89 d7             	mov    rdi,rdx
  2340a6:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  2340a9:	48 89 fa             	mov    rdx,rdi
  2340ac:	89 02                	mov    DWORD PTR [rdx],eax
  2340ae:	48 83 c2 04          	add    rdx,0x4
  2340b2:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  2340b5:	48 98                	cdqe   
  2340b7:	48 8d 50 01          	lea    rdx,[rax+0x1]
  2340bb:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  2340c2:	48 01 d0             	add    rax,rdx
  2340c5:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
  2340cc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  2340cf:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
  2340d2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  2340d5:	48 63 d0             	movsxd rdx,eax
  2340d8:	48 89 d0             	mov    rax,rdx
  2340db:	48 c1 e0 02          	shl    rax,0x2
  2340df:	48 01 d0             	add    rax,rdx
  2340e2:	48 c1 e0 03          	shl    rax,0x3
  2340e6:	48 05 f8 12 20 00    	add    rax,0x2012f8
  2340ec:	48 8b 00             	mov    rax,QWORD PTR [rax]
  2340ef:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  2340f3:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  2340f6:	48 98                	cdqe   
  2340f8:	48 8d 48 01          	lea    rcx,[rax+0x1]
  2340fc:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  234103:	48 01 c1             	add    rcx,rax
  234106:	48 8d 85 40 fe ff ff 	lea    rax,[rbp-0x1c0]
  23410d:	ff b5 f8 fe ff ff    	push   QWORD PTR [rbp-0x108]
  234113:	ff b5 f0 fe ff ff    	push   QWORD PTR [rbp-0x110]
  234119:	ff b5 e8 fe ff ff    	push   QWORD PTR [rbp-0x118]
  23411f:	ff b5 e0 fe ff ff    	push   QWORD PTR [rbp-0x120]
  234125:	ff b5 d8 fe ff ff    	push   QWORD PTR [rbp-0x128]
  23412b:	ff b5 d0 fe ff ff    	push   QWORD PTR [rbp-0x130]
  234131:	ff b5 c8 fe ff ff    	push   QWORD PTR [rbp-0x138]
  234137:	ff b5 c0 fe ff ff    	push   QWORD PTR [rbp-0x140]
  23413d:	ff b5 b8 fe ff ff    	push   QWORD PTR [rbp-0x148]
  234143:	ff b5 b0 fe ff ff    	push   QWORD PTR [rbp-0x150]
  234149:	ff b5 a8 fe ff ff    	push   QWORD PTR [rbp-0x158]
  23414f:	ff b5 a0 fe ff ff    	push   QWORD PTR [rbp-0x160]
  234155:	48 89 c6             	mov    rsi,rax
  234158:	48 89 cf             	mov    rdi,rcx
  23415b:	ff d2                	call   rdx
  23415d:	48 83 c4 60          	add    rsp,0x60
  234161:	83 f8 ff             	cmp    eax,0xffffffff
  234164:	75 49                	jne    2341af <sys_open+0x22f>
  234166:	8b 85 d4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x22c]
  23416c:	83 e0 02             	and    eax,0x2
  23416f:	85 c0                	test   eax,eax
  234171:	74 32                	je     2341a5 <sys_open+0x225>
  234173:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  234176:	48 63 d0             	movsxd rdx,eax
  234179:	48 89 d0             	mov    rax,rdx
  23417c:	48 c1 e0 02          	shl    rax,0x2
  234180:	48 01 d0             	add    rax,rdx
  234183:	48 c1 e0 03          	shl    rax,0x3
  234187:	48 05 f0 12 20 00    	add    rax,0x2012f0
  23418d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  234190:	48 8b 50 4c          	mov    rdx,QWORD PTR [rax+0x4c]
  234194:	48 8d 85 00 ff ff ff 	lea    rax,[rbp-0x100]
  23419b:	48 89 c7             	mov    rdi,rax
  23419e:	ff d2                	call   rdx
  2341a0:	e9 9e 02 00 00       	jmp    234443 <sys_open+0x4c3>
  2341a5:	b8 ff ff ff ff       	mov    eax,0xffffffff
  2341aa:	e9 94 02 00 00       	jmp    234443 <sys_open+0x4c3>
  2341af:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
  2341b6:	48 8b 95 48 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b8]
  2341bd:	48 89 85 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],rax
  2341c4:	48 89 95 e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdx
  2341cb:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
  2341d2:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
  2341d9:	48 89 85 f0 fd ff ff 	mov    QWORD PTR [rbp-0x210],rax
  2341e0:	48 89 95 f8 fd ff ff 	mov    QWORD PTR [rbp-0x208],rdx
  2341e7:	48 8b 85 60 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1a0]
  2341ee:	48 8b 95 68 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x198]
  2341f5:	48 89 85 00 fe ff ff 	mov    QWORD PTR [rbp-0x200],rax
  2341fc:	48 89 95 08 fe ff ff 	mov    QWORD PTR [rbp-0x1f8],rdx
  234203:	48 8b 85 70 fe ff ff 	mov    rax,QWORD PTR [rbp-0x190]
  23420a:	48 8b 95 78 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x188]
  234211:	48 89 85 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rax
  234218:	48 89 95 18 fe ff ff 	mov    QWORD PTR [rbp-0x1e8],rdx
  23421f:	48 8b 85 80 fe ff ff 	mov    rax,QWORD PTR [rbp-0x180]
  234226:	48 8b 95 88 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x178]
  23422d:	48 89 85 20 fe ff ff 	mov    QWORD PTR [rbp-0x1e0],rax
  234234:	48 89 95 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rdx
  23423b:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
  234242:	48 8b 95 98 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x168]
  234249:	48 89 85 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],rax
  234250:	48 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdx
  234257:	c7 45 e8 ff ff ff ff 	mov    DWORD PTR [rbp-0x18],0xffffffff
  23425e:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  234265:	eb 5c                	jmp    2342c3 <sys_open+0x343>
  234267:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  23426a:	48 63 d0             	movsxd rdx,eax
  23426d:	48 89 d0             	mov    rax,rdx
  234270:	48 01 c0             	add    rax,rax
  234273:	48 01 d0             	add    rax,rdx
  234276:	48 c1 e0 05          	shl    rax,0x5
  23427a:	48 05 08 17 20 00    	add    rax,0x201708
  234280:	8b 00                	mov    eax,DWORD PTR [rax]
  234282:	39 45 e0             	cmp    DWORD PTR [rbp-0x20],eax
  234285:	75 38                	jne    2342bf <sys_open+0x33f>
  234287:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  23428a:	48 63 d0             	movsxd rdx,eax
  23428d:	48 89 d0             	mov    rax,rdx
  234290:	48 01 c0             	add    rax,rax
  234293:	48 01 d0             	add    rax,rdx
  234296:	48 c1 e0 05          	shl    rax,0x5
  23429a:	48 05 14 17 20 00    	add    rax,0x201714
  2342a0:	8b 10                	mov    edx,DWORD PTR [rax]
  2342a2:	8b 85 f4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x20c]
  2342a8:	39 c2                	cmp    edx,eax
  2342aa:	75 13                	jne    2342bf <sys_open+0x33f>
  2342ac:	83 bd d4 fd ff ff 02 	cmp    DWORD PTR [rbp-0x22c],0x2
  2342b3:	75 0a                	jne    2342bf <sys_open+0x33f>
  2342b5:	b8 ff ff ff ff       	mov    eax,0xffffffff
  2342ba:	e9 84 01 00 00       	jmp    234443 <sys_open+0x4c3>
  2342bf:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  2342c3:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  2342c7:	7e 9e                	jle    234267 <sys_open+0x2e7>
  2342c9:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  2342d0:	eb 2b                	jmp    2342fd <sys_open+0x37d>
  2342d2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  2342d5:	48 63 d0             	movsxd rdx,eax
  2342d8:	48 89 d0             	mov    rax,rdx
  2342db:	48 01 c0             	add    rax,rax
  2342de:	48 01 d0             	add    rax,rdx
  2342e1:	48 c1 e0 05          	shl    rax,0x5
  2342e5:	48 05 04 17 20 00    	add    rax,0x201704
  2342eb:	8b 00                	mov    eax,DWORD PTR [rax]
  2342ed:	85 c0                	test   eax,eax
  2342ef:	75 08                	jne    2342f9 <sys_open+0x379>
  2342f1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  2342f4:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  2342f7:	eb 0a                	jmp    234303 <sys_open+0x383>
  2342f9:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  2342fd:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  234301:	7e cf                	jle    2342d2 <sys_open+0x352>
  234303:	83 7d e8 ff          	cmp    DWORD PTR [rbp-0x18],0xffffffff
  234307:	75 0a                	jne    234313 <sys_open+0x393>
  234309:	b8 ff ff ff ff       	mov    eax,0xffffffff
  23430e:	e9 30 01 00 00       	jmp    234443 <sys_open+0x4c3>
  234313:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  234316:	48 63 d0             	movsxd rdx,eax
  234319:	48 89 d0             	mov    rax,rdx
  23431c:	48 01 c0             	add    rax,rax
  23431f:	48 01 d0             	add    rax,rdx
  234322:	48 c1 e0 05          	shl    rax,0x5
  234326:	48 05 00 17 20 00    	add    rax,0x201700
  23432c:	48 8b 8d e0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x220]
  234333:	48 8b 9d e8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x218]
  23433a:	48 89 08             	mov    QWORD PTR [rax],rcx
  23433d:	48 89 58 08          	mov    QWORD PTR [rax+0x8],rbx
  234341:	48 8b 8d f0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x210]
  234348:	48 8b 9d f8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x208]
  23434f:	48 89 48 10          	mov    QWORD PTR [rax+0x10],rcx
  234353:	48 89 58 18          	mov    QWORD PTR [rax+0x18],rbx
  234357:	48 8b 8d 00 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x200]
  23435e:	48 8b 9d 08 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1f8]
  234365:	48 89 48 20          	mov    QWORD PTR [rax+0x20],rcx
  234369:	48 89 58 28          	mov    QWORD PTR [rax+0x28],rbx
  23436d:	48 8b 8d 10 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1f0]
  234374:	48 8b 9d 18 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1e8]
  23437b:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
  23437f:	48 89 58 38          	mov    QWORD PTR [rax+0x38],rbx
  234383:	48 8b 8d 20 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1e0]
  23438a:	48 8b 9d 28 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1d8]
  234391:	48 89 48 40          	mov    QWORD PTR [rax+0x40],rcx
  234395:	48 89 58 48          	mov    QWORD PTR [rax+0x48],rbx
  234399:	48 8b 8d 30 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1d0]
  2343a0:	48 8b 9d 38 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1c8]
  2343a7:	48 89 48 50          	mov    QWORD PTR [rax+0x50],rcx
  2343ab:	48 89 58 58          	mov    QWORD PTR [rax+0x58],rbx
  2343af:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  2343b2:	48 63 d0             	movsxd rdx,eax
  2343b5:	48 89 d0             	mov    rax,rdx
  2343b8:	48 01 c0             	add    rax,rax
  2343bb:	48 01 d0             	add    rax,rdx
  2343be:	48 c1 e0 05          	shl    rax,0x5
  2343c2:	48 8d 90 00 17 20 00 	lea    rdx,[rax+0x201700]
  2343c9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  2343cc:	89 02                	mov    DWORD PTR [rdx],eax
  2343ce:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  2343d1:	48 63 d0             	movsxd rdx,eax
  2343d4:	48 89 d0             	mov    rax,rdx
  2343d7:	48 01 c0             	add    rax,rax
  2343da:	48 01 d0             	add    rax,rdx
  2343dd:	48 c1 e0 05          	shl    rax,0x5
  2343e1:	48 05 0c 17 20 00    	add    rax,0x20170c
  2343e7:	8b 00                	mov    eax,DWORD PTR [rax]
  2343e9:	8d 48 01             	lea    ecx,[rax+0x1]
  2343ec:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  2343ef:	48 63 d0             	movsxd rdx,eax
  2343f2:	48 89 d0             	mov    rax,rdx
  2343f5:	48 01 c0             	add    rax,rax
  2343f8:	48 01 d0             	add    rax,rdx
  2343fb:	48 c1 e0 05          	shl    rax,0x5
  2343ff:	48 05 0c 17 20 00    	add    rax,0x20170c
  234405:	89 08                	mov    DWORD PTR [rax],ecx
  234407:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  23440a:	48 63 d0             	movsxd rdx,eax
  23440d:	48 89 d0             	mov    rax,rdx
  234410:	48 01 c0             	add    rax,rax
  234413:	48 01 d0             	add    rax,rdx
  234416:	48 c1 e0 05          	shl    rax,0x5
  23441a:	48 05 00 17 20 00    	add    rax,0x201700
  234420:	48 89 c7             	mov    rdi,rax
  234423:	e8 15 26 00 00       	call   236a3d <add_proc_openf>
  234428:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  23442b:	48 63 d0             	movsxd rdx,eax
  23442e:	48 89 d0             	mov    rax,rdx
  234431:	48 01 c0             	add    rax,rax
  234434:	48 01 d0             	add    rax,rdx
  234437:	48 c1 e0 05          	shl    rax,0x5
  23443b:	48 05 00 17 20 00    	add    rax,0x201700
  234441:	8b 00                	mov    eax,DWORD PTR [rax]
  234443:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  234447:	c9                   	leave  
  234448:	c3                   	ret    

0000000000234449 <sys_close>:
  234449:	f3 0f 1e fa          	endbr64 
  23444d:	55                   	push   rbp
  23444e:	48 89 e5             	mov    rbp,rsp
  234451:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  234454:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  23445b:	eb 64                	jmp    2344c1 <sys_close+0x78>
  23445d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  234460:	48 63 d0             	movsxd rdx,eax
  234463:	48 89 d0             	mov    rax,rdx
  234466:	48 01 c0             	add    rax,rax
  234469:	48 01 d0             	add    rax,rdx
  23446c:	48 c1 e0 05          	shl    rax,0x5
  234470:	48 05 00 17 20 00    	add    rax,0x201700
  234476:	8b 00                	mov    eax,DWORD PTR [rax]
  234478:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  23447b:	75 40                	jne    2344bd <sys_close+0x74>
  23447d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  234480:	48 63 d0             	movsxd rdx,eax
  234483:	48 89 d0             	mov    rax,rdx
  234486:	48 01 c0             	add    rax,rax
  234489:	48 01 d0             	add    rax,rdx
  23448c:	48 c1 e0 05          	shl    rax,0x5
  234490:	48 05 0c 17 20 00    	add    rax,0x20170c
  234496:	8b 00                	mov    eax,DWORD PTR [rax]
  234498:	8d 48 ff             	lea    ecx,[rax-0x1]
  23449b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23449e:	48 63 d0             	movsxd rdx,eax
  2344a1:	48 89 d0             	mov    rax,rdx
  2344a4:	48 01 c0             	add    rax,rax
  2344a7:	48 01 d0             	add    rax,rdx
  2344aa:	48 c1 e0 05          	shl    rax,0x5
  2344ae:	48 05 0c 17 20 00    	add    rax,0x20170c
  2344b4:	89 08                	mov    DWORD PTR [rax],ecx
  2344b6:	b8 00 00 00 00       	mov    eax,0x0
  2344bb:	eb 0f                	jmp    2344cc <sys_close+0x83>
  2344bd:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  2344c1:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  2344c5:	7e 96                	jle    23445d <sys_close+0x14>
  2344c7:	b8 ff ff ff ff       	mov    eax,0xffffffff
  2344cc:	5d                   	pop    rbp
  2344cd:	c3                   	ret    

00000000002344ce <sys_write>:
  2344ce:	f3 0f 1e fa          	endbr64 
  2344d2:	55                   	push   rbp
  2344d3:	48 89 e5             	mov    rbp,rsp
  2344d6:	48 83 ec 20          	sub    rsp,0x20
  2344da:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  2344dd:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  2344e1:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
  2344e4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  2344e7:	89 c7                	mov    edi,eax
  2344e9:	e8 7d 01 00 00       	call   23466b <get_vfs_entry>
  2344ee:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  2344f2:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  2344f7:	75 07                	jne    234500 <sys_write+0x32>
  2344f9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  2344fe:	eb 5d                	jmp    23455d <sys_write+0x8f>
  234500:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  234504:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  234507:	85 c0                	test   eax,eax
  234509:	75 18                	jne    234523 <sys_write+0x55>
  23450b:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  23450e:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  234512:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  234516:	48 89 ce             	mov    rsi,rcx
  234519:	48 89 c7             	mov    rdi,rax
  23451c:	e8 66 03 00 00       	call   234887 <vfs_write_file>
  234521:	eb 3a                	jmp    23455d <sys_write+0x8f>
  234523:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  234527:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  23452a:	83 f8 01             	cmp    eax,0x1
  23452d:	75 29                	jne    234558 <sys_write+0x8a>
  23452f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  234533:	48 89 c7             	mov    rdi,rax
  234536:	e8 5a 04 00 00       	call   234995 <get_according_bnr>
  23453b:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  23453e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  234542:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  234545:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  234548:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  23454c:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  23454f:	89 c7                	mov    edi,eax
  234551:	e8 25 08 00 00       	call   234d7b <write_block>
  234556:	eb 05                	jmp    23455d <sys_write+0x8f>
  234558:	b8 ff ff ff ff       	mov    eax,0xffffffff
  23455d:	c9                   	leave  
  23455e:	c3                   	ret    

000000000023455f <sys_read>:
  23455f:	f3 0f 1e fa          	endbr64 
  234563:	55                   	push   rbp
  234564:	48 89 e5             	mov    rbp,rsp
  234567:	48 83 ec 20          	sub    rsp,0x20
  23456b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  23456e:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  234572:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
  234575:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  234578:	89 c7                	mov    edi,eax
  23457a:	e8 ec 00 00 00       	call   23466b <get_vfs_entry>
  23457f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  234583:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  234588:	75 07                	jne    234591 <sys_read+0x32>
  23458a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  23458f:	eb 5d                	jmp    2345ee <sys_read+0x8f>
  234591:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  234595:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  234598:	85 c0                	test   eax,eax
  23459a:	75 18                	jne    2345b4 <sys_read+0x55>
  23459c:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  23459f:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  2345a3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2345a7:	48 89 ce             	mov    rsi,rcx
  2345aa:	48 89 c7             	mov    rdi,rax
  2345ad:	e8 36 02 00 00       	call   2347e8 <vfs_read_file>
  2345b2:	eb 3a                	jmp    2345ee <sys_read+0x8f>
  2345b4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2345b8:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  2345bb:	83 f8 01             	cmp    eax,0x1
  2345be:	75 29                	jne    2345e9 <sys_read+0x8a>
  2345c0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2345c4:	48 89 c7             	mov    rdi,rax
  2345c7:	e8 c9 03 00 00       	call   234995 <get_according_bnr>
  2345cc:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  2345cf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2345d3:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  2345d6:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  2345d9:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  2345dd:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  2345e0:	89 c7                	mov    edi,eax
  2345e2:	e8 11 08 00 00       	call   234df8 <read_block>
  2345e7:	eb 05                	jmp    2345ee <sys_read+0x8f>
  2345e9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  2345ee:	c9                   	leave  
  2345ef:	c3                   	ret    

00000000002345f0 <sys_seek>:
  2345f0:	f3 0f 1e fa          	endbr64 
  2345f4:	55                   	push   rbp
  2345f5:	48 89 e5             	mov    rbp,rsp
  2345f8:	48 83 ec 20          	sub    rsp,0x20
  2345fc:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  2345ff:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  234602:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  234605:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  234608:	89 c7                	mov    edi,eax
  23460a:	e8 5c 00 00 00       	call   23466b <get_vfs_entry>
  23460f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  234613:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  234618:	75 07                	jne    234621 <sys_seek+0x31>
  23461a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  23461f:	eb 14                	jmp    234635 <sys_seek+0x45>
  234621:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  234624:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  234627:	01 c2                	add    edx,eax
  234629:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23462d:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
  234630:	b8 00 00 00 00       	mov    eax,0x0
  234635:	c9                   	leave  
  234636:	c3                   	ret    

0000000000234637 <sys_tell>:
  234637:	f3 0f 1e fa          	endbr64 
  23463b:	55                   	push   rbp
  23463c:	48 89 e5             	mov    rbp,rsp
  23463f:	48 83 ec 20          	sub    rsp,0x20
  234643:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  234646:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  234649:	89 c7                	mov    edi,eax
  23464b:	e8 1b 00 00 00       	call   23466b <get_vfs_entry>
  234650:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  234654:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  234659:	75 07                	jne    234662 <sys_tell+0x2b>
  23465b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  234660:	eb 07                	jmp    234669 <sys_tell+0x32>
  234662:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  234666:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  234669:	c9                   	leave  
  23466a:	c3                   	ret    

000000000023466b <get_vfs_entry>:
  23466b:	f3 0f 1e fa          	endbr64 
  23466f:	55                   	push   rbp
  234670:	48 89 e5             	mov    rbp,rsp
  234673:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  234676:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  23467d:	eb 3f                	jmp    2346be <get_vfs_entry+0x53>
  23467f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  234682:	48 63 d0             	movsxd rdx,eax
  234685:	48 89 d0             	mov    rax,rdx
  234688:	48 01 c0             	add    rax,rax
  23468b:	48 01 d0             	add    rax,rdx
  23468e:	48 c1 e0 05          	shl    rax,0x5
  234692:	48 05 00 17 20 00    	add    rax,0x201700
  234698:	8b 00                	mov    eax,DWORD PTR [rax]
  23469a:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  23469d:	75 1b                	jne    2346ba <get_vfs_entry+0x4f>
  23469f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2346a2:	48 63 d0             	movsxd rdx,eax
  2346a5:	48 89 d0             	mov    rax,rdx
  2346a8:	48 01 c0             	add    rax,rax
  2346ab:	48 01 d0             	add    rax,rdx
  2346ae:	48 c1 e0 05          	shl    rax,0x5
  2346b2:	48 05 00 17 20 00    	add    rax,0x201700
  2346b8:	eb 0f                	jmp    2346c9 <get_vfs_entry+0x5e>
  2346ba:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  2346be:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  2346c2:	7e bb                	jle    23467f <get_vfs_entry+0x14>
  2346c4:	b8 00 00 00 00       	mov    eax,0x0
  2346c9:	5d                   	pop    rbp
  2346ca:	c3                   	ret    

00000000002346cb <brelse>:
  2346cb:	f3 0f 1e fa          	endbr64 
  2346cf:	55                   	push   rbp
  2346d0:	48 89 e5             	mov    rbp,rsp
  2346d3:	48 83 ec 10          	sub    rsp,0x10
  2346d7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  2346db:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2346df:	48 89 c7             	mov    rdi,rax
  2346e2:	e8 a1 04 00 00       	call   234b88 <wait_on_buf>
  2346e7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2346eb:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  2346ef:	84 c0                	test   al,al
  2346f1:	75 07                	jne    2346fa <brelse+0x2f>
  2346f3:	b8 ff ff ff ff       	mov    eax,0xffffffff
  2346f8:	eb 31                	jmp    23472b <brelse+0x60>
  2346fa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2346fe:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  234702:	8d 50 ff             	lea    edx,[rax-0x1]
  234705:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  234709:	88 50 14             	mov    BYTE PTR [rax+0x14],dl
  23470c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  234710:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  234714:	84 c0                	test   al,al
  234716:	75 0e                	jne    234726 <brelse+0x5b>
  234718:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23471c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  23471f:	89 c7                	mov    edi,eax
  234721:	e8 d1 ef ff ff       	call   2336f7 <vmfree>
  234726:	b8 00 00 00 00       	mov    eax,0x0
  23472b:	c9                   	leave  
  23472c:	c3                   	ret    

000000000023472d <bread>:
  23472d:	f3 0f 1e fa          	endbr64 
  234731:	55                   	push   rbp
  234732:	48 89 e5             	mov    rbp,rsp
  234735:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  23473c:	89 bd 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],edi
  234742:	89 b5 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],esi
  234748:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  23474e:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  234754:	89 d6                	mov    esi,edx
  234756:	89 c7                	mov    edi,eax
  234758:	e8 78 02 00 00       	call   2349d5 <get_buf>
  23475d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  234761:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  234766:	75 09                	jne    234771 <bread+0x44>
  234768:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  23476f:	eb 75                	jmp    2347e6 <bread+0xb9>
  234771:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  234775:	0f b6 40 12          	movzx  eax,BYTE PTR [rax+0x12]
  234779:	84 c0                	test   al,al
  23477b:	75 65                	jne    2347e2 <bread+0xb5>
  23477d:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  234783:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
  234786:	c7 45 d8 02 00 00 00 	mov    DWORD PTR [rbp-0x28],0x2
  23478d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  234791:	48 8b 00             	mov    rax,QWORD PTR [rax]
  234794:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
  23479a:	c7 85 48 ff ff ff 00 	mov    DWORD PTR [rbp-0xb8],0x200
  2347a1:	02 00 00 
  2347a4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2347a8:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  2347ac:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
  2347b2:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  2347b9:	00 00 00 
  2347bc:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  2347c3:	48 89 c7             	mov    rdi,rax
  2347c6:	e8 84 12 00 00       	call   235a4f <make_request>
  2347cb:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  2347ce:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  2347d1:	89 c7                	mov    edi,eax
  2347d3:	e8 8a 15 00 00       	call   235d62 <wait_on_req>
  2347d8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  2347db:	89 c7                	mov    edi,eax
  2347dd:	e8 b0 15 00 00       	call   235d92 <clear_req>
  2347e2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2347e6:	c9                   	leave  
  2347e7:	c3                   	ret    

00000000002347e8 <vfs_read_file>:
  2347e8:	f3 0f 1e fa          	endbr64 
  2347ec:	55                   	push   rbp
  2347ed:	48 89 e5             	mov    rbp,rsp
  2347f0:	48 83 ec 40          	sub    rsp,0x40
  2347f4:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  2347f8:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  2347fc:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
  2347ff:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  234803:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  234806:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  234809:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  23480d:	48 89 c7             	mov    rdi,rax
  234810:	e8 80 01 00 00       	call   234995 <get_according_bnr>
  234815:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  234818:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  23481b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23481e:	89 d6                	mov    esi,edx
  234820:	89 c7                	mov    edi,eax
  234822:	e8 06 ff ff ff       	call   23472d <bread>
  234827:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  23482b:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  23482e:	ba 00 02 00 00       	mov    edx,0x200
  234833:	39 d0                	cmp    eax,edx
  234835:	0f 4f c2             	cmovg  eax,edx
  234838:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  23483b:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  23483e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  234842:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  234845:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  234849:	48 89 ce             	mov    rsi,rcx
  23484c:	48 89 c7             	mov    rdi,rax
  23484f:	e8 08 6a 00 00       	call   23b25c <memcpy>
  234854:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
  23485b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  23485f:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  234862:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  234865:	01 c2                	add    edx,eax
  234867:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  23486b:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
  23486e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  234872:	48 89 c7             	mov    rdi,rax
  234875:	e8 51 fe ff ff       	call   2346cb <brelse>
  23487a:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  23487e:	7f 89                	jg     234809 <vfs_read_file+0x21>
  234880:	b8 00 00 00 00       	mov    eax,0x0
  234885:	c9                   	leave  
  234886:	c3                   	ret    

0000000000234887 <vfs_write_file>:
  234887:	f3 0f 1e fa          	endbr64 
  23488b:	55                   	push   rbp
  23488c:	48 89 e5             	mov    rbp,rsp
  23488f:	48 83 ec 40          	sub    rsp,0x40
  234893:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  234897:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  23489b:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
  23489e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  2348a2:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  2348a5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  2348a8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  2348ac:	48 89 c7             	mov    rdi,rax
  2348af:	e8 e1 00 00 00       	call   234995 <get_according_bnr>
  2348b4:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  2348b7:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  2348ba:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2348bd:	89 d6                	mov    esi,edx
  2348bf:	89 c7                	mov    edi,eax
  2348c1:	e8 0f 01 00 00       	call   2349d5 <get_buf>
  2348c6:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  2348ca:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  2348cd:	ba 00 02 00 00       	mov    edx,0x200
  2348d2:	39 d0                	cmp    eax,edx
  2348d4:	0f 4f c2             	cmovg  eax,edx
  2348d7:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  2348da:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  2348dd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  2348e1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  2348e4:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  2348e8:	48 89 ce             	mov    rsi,rcx
  2348eb:	48 89 c7             	mov    rdi,rax
  2348ee:	e8 69 69 00 00       	call   23b25c <memcpy>
  2348f3:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
  2348fa:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  2348fe:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  234901:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  234904:	01 c2                	add    edx,eax
  234906:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  23490a:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
  23490d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  234911:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
  234915:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  234919:	48 89 c7             	mov    rdi,rax
  23491c:	e8 aa fd ff ff       	call   2346cb <brelse>
  234921:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  234925:	7f 81                	jg     2348a8 <vfs_write_file+0x21>
  234927:	b8 00 00 00 00       	mov    eax,0x0
  23492c:	c9                   	leave  
  23492d:	c3                   	ret    

000000000023492e <vfs_seek_file>:
  23492e:	f3 0f 1e fa          	endbr64 
  234932:	55                   	push   rbp
  234933:	48 89 e5             	mov    rbp,rsp
  234936:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  23493a:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  23493d:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
  234940:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  234944:	74 20                	je     234966 <vfs_seek_file+0x38>
  234946:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  23494a:	7f 3f                	jg     23498b <vfs_seek_file+0x5d>
  23494c:	83 7d f0 00          	cmp    DWORD PTR [rbp-0x10],0x0
  234950:	74 08                	je     23495a <vfs_seek_file+0x2c>
  234952:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  234956:	74 23                	je     23497b <vfs_seek_file+0x4d>
  234958:	eb 31                	jmp    23498b <vfs_seek_file+0x5d>
  23495a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23495e:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  234961:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
  234964:	eb 26                	jmp    23498c <vfs_seek_file+0x5e>
  234966:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23496a:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  23496d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  234970:	01 c2                	add    edx,eax
  234972:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  234976:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
  234979:	eb 11                	jmp    23498c <vfs_seek_file+0x5e>
  23497b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23497f:	8b 50 18             	mov    edx,DWORD PTR [rax+0x18]
  234982:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  234986:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
  234989:	eb 01                	jmp    23498c <vfs_seek_file+0x5e>
  23498b:	90                   	nop
  23498c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  234990:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  234993:	5d                   	pop    rbp
  234994:	c3                   	ret    

0000000000234995 <get_according_bnr>:
  234995:	f3 0f 1e fa          	endbr64 
  234999:	55                   	push   rbp
  23499a:	48 89 e5             	mov    rbp,rsp
  23499d:	48 83 ec 10          	sub    rsp,0x10
  2349a1:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  2349a5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2349a9:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  2349ac:	48 63 d0             	movsxd rdx,eax
  2349af:	48 89 d0             	mov    rax,rdx
  2349b2:	48 c1 e0 02          	shl    rax,0x2
  2349b6:	48 01 d0             	add    rax,rdx
  2349b9:	48 c1 e0 03          	shl    rax,0x3
  2349bd:	48 05 f8 12 20 00    	add    rax,0x2012f8
  2349c3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  2349c6:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  2349ca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2349ce:	48 89 c7             	mov    rdi,rax
  2349d1:	ff d2                	call   rdx
  2349d3:	c9                   	leave  
  2349d4:	c3                   	ret    

00000000002349d5 <get_buf>:
  2349d5:	f3 0f 1e fa          	endbr64 
  2349d9:	55                   	push   rbp
  2349da:	48 89 e5             	mov    rbp,rsp
  2349dd:	48 83 ec 20          	sub    rsp,0x20
  2349e1:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  2349e4:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  2349e7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  2349ee:	e9 b9 00 00 00       	jmp    234aac <get_buf+0xd7>
  2349f3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2349f6:	48 98                	cdqe   
  2349f8:	48 c1 e0 06          	shl    rax,0x6
  2349fc:	48 05 30 37 20 00    	add    rax,0x203730
  234a02:	0f b7 00             	movzx  eax,WORD PTR [rax]
  234a05:	0f b7 c0             	movzx  eax,ax
  234a08:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  234a0b:	0f 85 97 00 00 00    	jne    234aa8 <get_buf+0xd3>
  234a11:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  234a14:	48 98                	cdqe   
  234a16:	48 c1 e0 06          	shl    rax,0x6
  234a1a:	48 05 28 37 20 00    	add    rax,0x203728
  234a20:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  234a23:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  234a26:	48 98                	cdqe   
  234a28:	48 39 c2             	cmp    rdx,rax
  234a2b:	75 7b                	jne    234aa8 <get_buf+0xd3>
  234a2d:	90                   	nop
  234a2e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  234a31:	48 98                	cdqe   
  234a33:	48 c1 e0 06          	shl    rax,0x6
  234a37:	48 05 20 37 20 00    	add    rax,0x203720
  234a3d:	48 89 c7             	mov    rdi,rax
  234a40:	e8 43 01 00 00       	call   234b88 <wait_on_buf>
  234a45:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  234a48:	48 98                	cdqe   
  234a4a:	48 c1 e0 06          	shl    rax,0x6
  234a4e:	48 05 34 37 20 00    	add    rax,0x203734
  234a54:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  234a57:	84 c0                	test   al,al
  234a59:	74 02                	je     234a5d <get_buf+0x88>
  234a5b:	eb d1                	jmp    234a2e <get_buf+0x59>
  234a5d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  234a60:	48 98                	cdqe   
  234a62:	48 c1 e0 06          	shl    rax,0x6
  234a66:	48 05 30 37 20 00    	add    rax,0x203730
  234a6c:	0f b7 00             	movzx  eax,WORD PTR [rax]
  234a6f:	0f b7 c0             	movzx  eax,ax
  234a72:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  234a75:	75 30                	jne    234aa7 <get_buf+0xd2>
  234a77:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  234a7a:	48 98                	cdqe   
  234a7c:	48 c1 e0 06          	shl    rax,0x6
  234a80:	48 05 28 37 20 00    	add    rax,0x203728
  234a86:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  234a89:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  234a8c:	48 98                	cdqe   
  234a8e:	48 39 c2             	cmp    rdx,rax
  234a91:	75 14                	jne    234aa7 <get_buf+0xd2>
  234a93:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  234a96:	48 98                	cdqe   
  234a98:	48 c1 e0 06          	shl    rax,0x6
  234a9c:	48 05 20 37 20 00    	add    rax,0x203720
  234aa2:	e9 df 00 00 00       	jmp    234b86 <get_buf+0x1b1>
  234aa7:	90                   	nop
  234aa8:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  234aac:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  234ab0:	0f 8e 3d ff ff ff    	jle    2349f3 <get_buf+0x1e>
  234ab6:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  234abd:	e9 ba 00 00 00       	jmp    234b7c <get_buf+0x1a7>
  234ac2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  234ac5:	48 98                	cdqe   
  234ac7:	48 c1 e0 06          	shl    rax,0x6
  234acb:	48 05 34 37 20 00    	add    rax,0x203734
  234ad1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  234ad4:	84 c0                	test   al,al
  234ad6:	0f 85 9c 00 00 00    	jne    234b78 <get_buf+0x1a3>
  234adc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  234adf:	48 98                	cdqe   
  234ae1:	48 c1 e0 06          	shl    rax,0x6
  234ae5:	48 05 33 37 20 00    	add    rax,0x203733
  234aeb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  234aee:	84 c0                	test   al,al
  234af0:	74 2e                	je     234b20 <get_buf+0x14b>
  234af2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  234af5:	48 98                	cdqe   
  234af7:	48 c1 e0 06          	shl    rax,0x6
  234afb:	48 05 20 37 20 00    	add    rax,0x203720
  234b01:	48 89 c7             	mov    rdi,rax
  234b04:	e8 2e 02 00 00       	call   234d37 <sync_buf>
  234b09:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  234b0c:	48 98                	cdqe   
  234b0e:	48 c1 e0 06          	shl    rax,0x6
  234b12:	48 05 20 37 20 00    	add    rax,0x203720
  234b18:	48 89 c7             	mov    rdi,rax
  234b1b:	e8 68 00 00 00       	call   234b88 <wait_on_buf>
  234b20:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  234b23:	48 98                	cdqe   
  234b25:	48 c1 e0 06          	shl    rax,0x6
  234b29:	48 05 34 37 20 00    	add    rax,0x203734
  234b2f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  234b32:	8d 50 01             	lea    edx,[rax+0x1]
  234b35:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  234b38:	48 98                	cdqe   
  234b3a:	48 c1 e0 06          	shl    rax,0x6
  234b3e:	48 05 34 37 20 00    	add    rax,0x203734
  234b44:	88 10                	mov    BYTE PTR [rax],dl
  234b46:	b8 00 00 00 00       	mov    eax,0x0
  234b4b:	e8 1a eb ff ff       	call   23366a <vmalloc>
  234b50:	48 98                	cdqe   
  234b52:	48 89 c2             	mov    rdx,rax
  234b55:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  234b58:	48 98                	cdqe   
  234b5a:	48 c1 e0 06          	shl    rax,0x6
  234b5e:	48 05 20 37 20 00    	add    rax,0x203720
  234b64:	48 89 10             	mov    QWORD PTR [rax],rdx
  234b67:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  234b6a:	48 98                	cdqe   
  234b6c:	48 c1 e0 06          	shl    rax,0x6
  234b70:	48 05 20 37 20 00    	add    rax,0x203720
  234b76:	eb 0e                	jmp    234b86 <get_buf+0x1b1>
  234b78:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  234b7c:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  234b80:	0f 8e 3c ff ff ff    	jle    234ac2 <get_buf+0xed>
  234b86:	c9                   	leave  
  234b87:	c3                   	ret    

0000000000234b88 <wait_on_buf>:
  234b88:	f3 0f 1e fa          	endbr64 
  234b8c:	55                   	push   rbp
  234b8d:	48 89 e5             	mov    rbp,rsp
  234b90:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  234b94:	90                   	nop
  234b95:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  234b99:	0f b6 40 15          	movzx  eax,BYTE PTR [rax+0x15]
  234b9d:	84 c0                	test   al,al
  234b9f:	75 f4                	jne    234b95 <wait_on_buf+0xd>
  234ba1:	90                   	nop
  234ba2:	90                   	nop
  234ba3:	5d                   	pop    rbp
  234ba4:	c3                   	ret    

0000000000234ba5 <scan_dev>:
  234ba5:	f3 0f 1e fa          	endbr64 
  234ba9:	55                   	push   rbp
  234baa:	48 89 e5             	mov    rbp,rsp
  234bad:	48 83 ec 40          	sub    rsp,0x40
  234bb1:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
  234bb4:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  234bb7:	89 c7                	mov    edi,eax
  234bb9:	e8 3c 0e 00 00       	call   2359fa <get_dev>
  234bbe:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  234bc2:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  234bc5:	be 00 00 00 00       	mov    esi,0x0
  234bca:	89 c7                	mov    edi,eax
  234bcc:	e8 5c fb ff ff       	call   23472d <bread>
  234bd1:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  234bd5:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  234bda:	75 0a                	jne    234be6 <scan_dev+0x41>
  234bdc:	b8 ff ff ff ff       	mov    eax,0xffffffff
  234be1:	e9 4f 01 00 00       	jmp    234d35 <scan_dev+0x190>
  234be6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  234bea:	48 8b 00             	mov    rax,QWORD PTR [rax]
  234bed:	48 05 be 01 00 00    	add    rax,0x1be
  234bf3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  234bf7:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  234bfe:	e9 17 01 00 00       	jmp    234d1a <scan_dev+0x175>
  234c03:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  234c07:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  234c0a:	0f b6 d0             	movzx  edx,al
  234c0d:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  234c11:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  234c14:	48 63 c8             	movsxd rcx,eax
  234c17:	48 89 c8             	mov    rax,rcx
  234c1a:	48 01 c0             	add    rax,rax
  234c1d:	48 01 c8             	add    rax,rcx
  234c20:	48 c1 e0 02          	shl    rax,0x2
  234c24:	48 01 f0             	add    rax,rsi
  234c27:	48 83 c0 40          	add    rax,0x40
  234c2b:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
  234c2e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  234c32:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  234c35:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
  234c38:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  234c3c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  234c3f:	48 63 d0             	movsxd rdx,eax
  234c42:	48 89 d0             	mov    rax,rdx
  234c45:	48 01 c0             	add    rax,rax
  234c48:	48 01 d0             	add    rax,rdx
  234c4b:	48 c1 e0 02          	shl    rax,0x2
  234c4f:	48 01 c8             	add    rax,rcx
  234c52:	48 8d 50 40          	lea    rdx,[rax+0x40]
  234c56:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  234c59:	89 02                	mov    DWORD PTR [rdx],eax
  234c5b:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  234c62:	eb 68                	jmp    234ccc <scan_dev+0x127>
  234c64:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  234c67:	48 63 d0             	movsxd rdx,eax
  234c6a:	48 89 d0             	mov    rax,rdx
  234c6d:	48 01 c0             	add    rax,rax
  234c70:	48 01 d0             	add    rax,rdx
  234c73:	48 c1 e0 03          	shl    rax,0x3
  234c77:	48 05 20 34 20 00    	add    rax,0x203420
  234c7d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  234c80:	48 85 c0             	test   rax,rax
  234c83:	74 43                	je     234cc8 <scan_dev+0x123>
  234c85:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  234c88:	48 63 d0             	movsxd rdx,eax
  234c8b:	48 89 d0             	mov    rax,rdx
  234c8e:	48 01 c0             	add    rax,rax
  234c91:	48 01 d0             	add    rax,rdx
  234c94:	48 c1 e0 03          	shl    rax,0x3
  234c98:	48 05 20 34 20 00    	add    rax,0x203420
  234c9e:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  234ca1:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  234ca4:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  234ca7:	89 d6                	mov    esi,edx
  234ca9:	89 c7                	mov    edi,eax
  234cab:	ff d1                	call   rcx
  234cad:	85 c0                	test   eax,eax
  234caf:	75 17                	jne    234cc8 <scan_dev+0x123>
  234cb1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  234cb5:	48 8d 50 14          	lea    rdx,[rax+0x14]
  234cb9:	8b 4d f0             	mov    ecx,DWORD PTR [rbp-0x10]
  234cbc:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  234cbf:	89 ce                	mov    esi,ecx
  234cc1:	89 c7                	mov    edi,eax
  234cc3:	e8 ad f1 ff ff       	call   233e75 <reg_vol>
  234cc8:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  234ccc:	83 7d f0 1f          	cmp    DWORD PTR [rbp-0x10],0x1f
  234cd0:	7e 92                	jle    234c64 <scan_dev+0xbf>
  234cd2:	83 7d f0 20          	cmp    DWORD PTR [rbp-0x10],0x20
  234cd6:	75 0f                	jne    234ce7 <scan_dev+0x142>
  234cd8:	bf 30 c3 23 00       	mov    edi,0x23c330
  234cdd:	b8 00 00 00 00       	mov    eax,0x0
  234ce2:	e8 59 e6 ff ff       	call   233340 <printf>
  234ce7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  234ceb:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  234cee:	89 c1                	mov    ecx,eax
  234cf0:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  234cf4:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  234cf7:	48 63 d0             	movsxd rdx,eax
  234cfa:	48 89 d0             	mov    rax,rdx
  234cfd:	48 01 c0             	add    rax,rax
  234d00:	48 01 d0             	add    rax,rdx
  234d03:	48 c1 e0 02          	shl    rax,0x2
  234d07:	48 01 f0             	add    rax,rsi
  234d0a:	48 83 c0 40          	add    rax,0x40
  234d0e:	89 48 04             	mov    DWORD PTR [rax+0x4],ecx
  234d11:	48 83 45 f8 10       	add    QWORD PTR [rbp-0x8],0x10
  234d16:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  234d1a:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  234d1e:	0f 8e df fe ff ff    	jle    234c03 <scan_dev+0x5e>
  234d24:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  234d28:	48 89 c7             	mov    rdi,rax
  234d2b:	e8 9b f9 ff ff       	call   2346cb <brelse>
  234d30:	b8 00 00 00 00       	mov    eax,0x0
  234d35:	c9                   	leave  
  234d36:	c3                   	ret    

0000000000234d37 <sync_buf>:
  234d37:	f3 0f 1e fa          	endbr64 
  234d3b:	55                   	push   rbp
  234d3c:	48 89 e5             	mov    rbp,rsp
  234d3f:	48 83 ec 20          	sub    rsp,0x20
  234d43:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  234d47:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  234d4b:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
  234d4f:	0f b7 c0             	movzx  eax,ax
  234d52:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  234d55:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  234d59:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  234d5d:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  234d60:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  234d64:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  234d67:	8b 75 f8             	mov    esi,DWORD PTR [rbp-0x8]
  234d6a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  234d6d:	b9 00 02 00 00       	mov    ecx,0x200
  234d72:	89 c7                	mov    edi,eax
  234d74:	e8 02 00 00 00       	call   234d7b <write_block>
  234d79:	c9                   	leave  
  234d7a:	c3                   	ret    

0000000000234d7b <write_block>:
  234d7b:	f3 0f 1e fa          	endbr64 
  234d7f:	55                   	push   rbp
  234d80:	48 89 e5             	mov    rbp,rsp
  234d83:	48 83 ec 30          	sub    rsp,0x30
  234d87:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  234d8a:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  234d8d:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  234d91:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
  234d94:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  234d97:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  234d9a:	89 d6                	mov    esi,edx
  234d9c:	89 c7                	mov    edi,eax
  234d9e:	e8 32 fc ff ff       	call   2349d5 <get_buf>
  234da3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  234da7:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  234daa:	ba 00 02 00 00       	mov    edx,0x200
  234daf:	39 d0                	cmp    eax,edx
  234db1:	0f 4f c2             	cmovg  eax,edx
  234db4:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  234db7:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  234dba:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  234dbe:	48 8b 00             	mov    rax,QWORD PTR [rax]
  234dc1:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  234dc5:	48 89 ce             	mov    rsi,rcx
  234dc8:	48 89 c7             	mov    rdi,rax
  234dcb:	e8 8c 64 00 00       	call   23b25c <memcpy>
  234dd0:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
  234dd7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  234ddb:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
  234ddf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  234de3:	48 89 c7             	mov    rdi,rax
  234de6:	e8 e0 f8 ff ff       	call   2346cb <brelse>
  234deb:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  234def:	7f a3                	jg     234d94 <write_block+0x19>
  234df1:	b8 00 00 00 00       	mov    eax,0x0
  234df6:	c9                   	leave  
  234df7:	c3                   	ret    

0000000000234df8 <read_block>:
  234df8:	f3 0f 1e fa          	endbr64 
  234dfc:	55                   	push   rbp
  234dfd:	48 89 e5             	mov    rbp,rsp
  234e00:	48 83 ec 30          	sub    rsp,0x30
  234e04:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  234e07:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  234e0a:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  234e0e:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
  234e11:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  234e14:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  234e17:	89 d6                	mov    esi,edx
  234e19:	89 c7                	mov    edi,eax
  234e1b:	e8 0d f9 ff ff       	call   23472d <bread>
  234e20:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  234e24:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  234e27:	ba 00 02 00 00       	mov    edx,0x200
  234e2c:	39 d0                	cmp    eax,edx
  234e2e:	0f 4f c2             	cmovg  eax,edx
  234e31:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  234e34:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  234e37:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  234e3b:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  234e3e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  234e42:	48 89 ce             	mov    rsi,rcx
  234e45:	48 89 c7             	mov    rdi,rax
  234e48:	e8 0f 64 00 00       	call   23b25c <memcpy>
  234e4d:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
  234e54:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  234e58:	48 89 c7             	mov    rdi,rax
  234e5b:	e8 6b f8 ff ff       	call   2346cb <brelse>
  234e60:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  234e64:	7f ab                	jg     234e11 <read_block+0x19>
  234e66:	b8 00 00 00 00       	mov    eax,0x0
  234e6b:	c9                   	leave  
  234e6c:	c3                   	ret    

0000000000234e6d <init_vfs>:
  234e6d:	f3 0f 1e fa          	endbr64 
  234e71:	55                   	push   rbp
  234e72:	48 89 e5             	mov    rbp,rsp
  234e75:	48 83 ec 10          	sub    rsp,0x10
  234e79:	48 8b 05 a0 46 fd ff 	mov    rax,QWORD PTR [rip+0xfffffffffffd46a0]        # 209520 <dev_tree>
  234e80:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  234e84:	eb 40                	jmp    234ec6 <init_vfs+0x59>
  234e86:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  234e8a:	48 2d 20 3f 20 00    	sub    rax,0x203f20
  234e90:	48 c1 f8 02          	sar    rax,0x2
  234e94:	48 89 c2             	mov    rdx,rax
  234e97:	48 b8 19 9c 8f c1 f9 	movabs rax,0x8f9c18f9c18f9c19
  234e9e:	18 9c 8f 
  234ea1:	48 0f af c2          	imul   rax,rdx
  234ea5:	89 c7                	mov    edi,eax
  234ea7:	e8 f9 fc ff ff       	call   234ba5 <scan_dev>
  234eac:	85 c0                	test   eax,eax
  234eae:	74 07                	je     234eb7 <init_vfs+0x4a>
  234eb0:	b8 ff ff ff ff       	mov    eax,0xffffffff
  234eb5:	eb 1b                	jmp    234ed2 <init_vfs+0x65>
  234eb7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  234ebb:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  234ec2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  234ec6:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  234ecb:	75 b9                	jne    234e86 <init_vfs+0x19>
  234ecd:	b8 00 00 00 00       	mov    eax,0x0
  234ed2:	c9                   	leave  
  234ed3:	c3                   	ret    

0000000000234ed4 <init_drvdev_man>:
  234ed4:	f3 0f 1e fa          	endbr64 
  234ed8:	55                   	push   rbp
  234ed9:	48 89 e5             	mov    rbp,rsp
  234edc:	90                   	nop
  234edd:	5d                   	pop    rbp
  234ede:	c3                   	ret    

0000000000234edf <load_driver>:
  234edf:	f3 0f 1e fa          	endbr64 
  234ee3:	55                   	push   rbp
  234ee4:	48 89 e5             	mov    rbp,rsp
  234ee7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  234eeb:	90                   	nop
  234eec:	5d                   	pop    rbp
  234eed:	c3                   	ret    

0000000000234eee <reg_device>:
  234eee:	f3 0f 1e fa          	endbr64 
  234ef2:	55                   	push   rbp
  234ef3:	48 89 e5             	mov    rbp,rsp
  234ef6:	53                   	push   rbx
  234ef7:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
  234efb:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  234f02:	e9 42 01 00 00       	jmp    235049 <reg_device+0x15b>
  234f07:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  234f0a:	48 63 d0             	movsxd rdx,eax
  234f0d:	48 89 d0             	mov    rax,rdx
  234f10:	48 c1 e0 02          	shl    rax,0x2
  234f14:	48 01 d0             	add    rax,rdx
  234f17:	48 c1 e0 02          	shl    rax,0x2
  234f1b:	48 01 d0             	add    rax,rdx
  234f1e:	48 c1 e0 03          	shl    rax,0x3
  234f22:	48 05 30 3f 20 00    	add    rax,0x203f30
  234f28:	8b 00                	mov    eax,DWORD PTR [rax]
  234f2a:	85 c0                	test   eax,eax
  234f2c:	0f 85 13 01 00 00    	jne    235045 <reg_device+0x157>
  234f32:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  234f35:	48 63 d0             	movsxd rdx,eax
  234f38:	48 89 d0             	mov    rax,rdx
  234f3b:	48 c1 e0 02          	shl    rax,0x2
  234f3f:	48 01 d0             	add    rax,rdx
  234f42:	48 c1 e0 02          	shl    rax,0x2
  234f46:	48 01 d0             	add    rax,rdx
  234f49:	48 c1 e0 03          	shl    rax,0x3
  234f4d:	48 8d 90 20 3f 20 00 	lea    rdx,[rax+0x203f20]
  234f54:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  234f58:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  234f5b:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  234f5f:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  234f62:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  234f66:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  234f6a:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  234f6e:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  234f72:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  234f76:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  234f7a:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  234f7e:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  234f82:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  234f86:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  234f8a:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  234f8e:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  234f92:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  234f96:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  234f9a:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  234f9e:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  234fa2:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  234fa6:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  234faa:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  234fae:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  234fb2:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  234fb6:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  234fba:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  234fbe:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  234fc2:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  234fc6:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  234fca:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  234fce:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  234fd2:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  234fd6:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  234fdd:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  234fe4:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  234feb:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  234ff2:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  234ff9:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  235000:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  235007:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  23500e:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
  235015:	48 89 82 a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rax
  23501c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  23501f:	48 63 d0             	movsxd rdx,eax
  235022:	48 89 d0             	mov    rax,rdx
  235025:	48 c1 e0 02          	shl    rax,0x2
  235029:	48 01 d0             	add    rax,rdx
  23502c:	48 c1 e0 02          	shl    rax,0x2
  235030:	48 01 d0             	add    rax,rdx
  235033:	48 c1 e0 03          	shl    rax,0x3
  235037:	48 05 30 3f 20 00    	add    rax,0x203f30
  23503d:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
  235043:	eb 0e                	jmp    235053 <reg_device+0x165>
  235045:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  235049:	83 7d f4 3f          	cmp    DWORD PTR [rbp-0xc],0x3f
  23504d:	0f 8e b4 fe ff ff    	jle    234f07 <reg_device+0x19>
  235053:	83 7d f4 40          	cmp    DWORD PTR [rbp-0xc],0x40
  235057:	75 0a                	jne    235063 <reg_device+0x175>
  235059:	b8 ff ff ff ff       	mov    eax,0xffffffff
  23505e:	e9 6d 01 00 00       	jmp    2351d0 <reg_device+0x2e2>
  235063:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  23506a:	00 
  23506b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  23506e:	48 63 d0             	movsxd rdx,eax
  235071:	48 89 d0             	mov    rax,rdx
  235074:	48 c1 e0 02          	shl    rax,0x2
  235078:	48 01 d0             	add    rax,rdx
  23507b:	48 c1 e0 02          	shl    rax,0x2
  23507f:	48 01 d0             	add    rax,rdx
  235082:	48 c1 e0 03          	shl    rax,0x3
  235086:	48 05 20 3f 20 00    	add    rax,0x203f20
  23508c:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  235090:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  235094:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  235097:	83 f8 03             	cmp    eax,0x3
  23509a:	74 3b                	je     2350d7 <reg_device+0x1e9>
  23509c:	83 f8 03             	cmp    eax,0x3
  23509f:	7f 4b                	jg     2350ec <reg_device+0x1fe>
  2350a1:	83 f8 01             	cmp    eax,0x1
  2350a4:	74 07                	je     2350ad <reg_device+0x1bf>
  2350a6:	83 f8 02             	cmp    eax,0x2
  2350a9:	74 17                	je     2350c2 <reg_device+0x1d4>
  2350ab:	eb 3f                	jmp    2350ec <reg_device+0x1fe>
  2350ad:	48 8b 05 6c 44 fd ff 	mov    rax,QWORD PTR [rip+0xfffffffffffd446c]        # 209520 <dev_tree>
  2350b4:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  2350b8:	48 c7 45 e0 20 95 20 	mov    QWORD PTR [rbp-0x20],0x209520
  2350bf:	00 
  2350c0:	eb 34                	jmp    2350f6 <reg_device+0x208>
  2350c2:	48 8b 05 5f 44 fd ff 	mov    rax,QWORD PTR [rip+0xfffffffffffd445f]        # 209528 <dev_tree+0x8>
  2350c9:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  2350cd:	48 c7 45 e0 28 95 20 	mov    QWORD PTR [rbp-0x20],0x209528
  2350d4:	00 
  2350d5:	eb 1f                	jmp    2350f6 <reg_device+0x208>
  2350d7:	48 8b 05 52 44 fd ff 	mov    rax,QWORD PTR [rip+0xfffffffffffd4452]        # 209530 <dev_tree+0x10>
  2350de:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  2350e2:	48 c7 45 e0 30 95 20 	mov    QWORD PTR [rbp-0x20],0x209530
  2350e9:	00 
  2350ea:	eb 0a                	jmp    2350f6 <reg_device+0x208>
  2350ec:	b8 ff ff ff ff       	mov    eax,0xffffffff
  2350f1:	e9 da 00 00 00       	jmp    2351d0 <reg_device+0x2e2>
  2350f6:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  2350fb:	75 2b                	jne    235128 <reg_device+0x23a>
  2350fd:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  235101:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  235105:	48 89 10             	mov    QWORD PTR [rax],rdx
  235108:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  23510c:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x0
  235113:	00 00 00 00 
  235117:	eb 3d                	jmp    235156 <reg_device+0x268>
  235119:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  23511d:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  235124:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  235128:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  23512c:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  235133:	48 85 c0             	test   rax,rax
  235136:	75 e1                	jne    235119 <reg_device+0x22b>
  235138:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  23513c:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  235140:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
  235147:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  23514b:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  23514f:	48 89 90 98 00 00 00 	mov    QWORD PTR [rax+0x98],rdx
  235156:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  23515a:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x0
  235161:	00 00 00 00 
  235165:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  235169:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  23516c:	83 f8 04             	cmp    eax,0x4
  23516f:	74 3b                	je     2351ac <reg_device+0x2be>
  235171:	83 f8 04             	cmp    eax,0x4
  235174:	7f 56                	jg     2351cc <reg_device+0x2de>
  235176:	83 f8 03             	cmp    eax,0x3
  235179:	74 21                	je     23519c <reg_device+0x2ae>
  23517b:	83 f8 03             	cmp    eax,0x3
  23517e:	7f 4c                	jg     2351cc <reg_device+0x2de>
  235180:	83 f8 01             	cmp    eax,0x1
  235183:	74 07                	je     23518c <reg_device+0x29e>
  235185:	83 f8 02             	cmp    eax,0x2
  235188:	74 32                	je     2351bc <reg_device+0x2ce>
  23518a:	eb 40                	jmp    2351cc <reg_device+0x2de>
  23518c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  235190:	c7 80 a0 00 00 00 00 	mov    DWORD PTR [rax+0xa0],0x0
  235197:	00 00 00 
  23519a:	eb 31                	jmp    2351cd <reg_device+0x2df>
  23519c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  2351a0:	c7 80 a0 00 00 00 02 	mov    DWORD PTR [rax+0xa0],0x2
  2351a7:	00 00 00 
  2351aa:	eb 21                	jmp    2351cd <reg_device+0x2df>
  2351ac:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  2351b0:	c7 80 a0 00 00 00 03 	mov    DWORD PTR [rax+0xa0],0x3
  2351b7:	00 00 00 
  2351ba:	eb 11                	jmp    2351cd <reg_device+0x2df>
  2351bc:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  2351c0:	c7 80 a0 00 00 00 01 	mov    DWORD PTR [rax+0xa0],0x1
  2351c7:	00 00 00 
  2351ca:	eb 01                	jmp    2351cd <reg_device+0x2df>
  2351cc:	90                   	nop
  2351cd:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  2351d0:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  2351d4:	c9                   	leave  
  2351d5:	c3                   	ret    

00000000002351d6 <reg_driver>:
  2351d6:	f3 0f 1e fa          	endbr64 
  2351da:	55                   	push   rbp
  2351db:	48 89 e5             	mov    rbp,rsp
  2351de:	53                   	push   rbx
  2351df:	48 89 7d e0          	mov    QWORD PTR [rbp-0x20],rdi
  2351e3:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  2351ea:	e9 22 01 00 00       	jmp    235311 <reg_driver+0x13b>
  2351ef:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  2351f2:	48 63 d0             	movsxd rdx,eax
  2351f5:	48 89 d0             	mov    rax,rdx
  2351f8:	48 c1 e0 02          	shl    rax,0x2
  2351fc:	48 01 d0             	add    rax,rdx
  2351ff:	48 c1 e0 05          	shl    rax,0x5
  235203:	48 05 20 69 20 00    	add    rax,0x206920
  235209:	8b 00                	mov    eax,DWORD PTR [rax]
  23520b:	85 c0                	test   eax,eax
  23520d:	0f 85 fa 00 00 00    	jne    23530d <reg_driver+0x137>
  235213:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  235216:	48 63 d0             	movsxd rdx,eax
  235219:	48 89 d0             	mov    rax,rdx
  23521c:	48 c1 e0 02          	shl    rax,0x2
  235220:	48 01 d0             	add    rax,rdx
  235223:	48 c1 e0 05          	shl    rax,0x5
  235227:	48 8d 90 20 69 20 00 	lea    rdx,[rax+0x206920]
  23522e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  235232:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  235235:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  235239:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  23523c:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  235240:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  235244:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  235248:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  23524c:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  235250:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  235254:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  235258:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  23525c:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  235260:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  235264:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  235268:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  23526c:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  235270:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  235274:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  235278:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  23527c:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  235280:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  235284:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  235288:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  23528c:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  235290:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  235294:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  235298:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  23529c:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  2352a0:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  2352a4:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  2352a8:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  2352ac:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  2352b0:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  2352b7:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  2352be:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  2352c5:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  2352cc:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  2352d3:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  2352da:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  2352e1:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  2352e8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  2352eb:	48 63 d0             	movsxd rdx,eax
  2352ee:	48 89 d0             	mov    rax,rdx
  2352f1:	48 c1 e0 02          	shl    rax,0x2
  2352f5:	48 01 d0             	add    rax,rdx
  2352f8:	48 c1 e0 05          	shl    rax,0x5
  2352fc:	48 05 20 69 20 00    	add    rax,0x206920
  235302:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
  235308:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  23530b:	eb 13                	jmp    235320 <reg_driver+0x14a>
  23530d:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  235311:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  235315:	0f 8e d4 fe ff ff    	jle    2351ef <reg_driver+0x19>
  23531b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  235320:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  235324:	c9                   	leave  
  235325:	c3                   	ret    

0000000000235326 <sys_find_dev>:
  235326:	f3 0f 1e fa          	endbr64 
  23532a:	55                   	push   rbp
  23532b:	48 89 e5             	mov    rbp,rsp
  23532e:	48 83 ec 20          	sub    rsp,0x20
  235332:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  235336:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  23533d:	eb 6c                	jmp    2353ab <sys_find_dev+0x85>
  23533f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  235342:	48 63 d0             	movsxd rdx,eax
  235345:	48 89 d0             	mov    rax,rdx
  235348:	48 c1 e0 02          	shl    rax,0x2
  23534c:	48 01 d0             	add    rax,rdx
  23534f:	48 c1 e0 02          	shl    rax,0x2
  235353:	48 01 d0             	add    rax,rdx
  235356:	48 c1 e0 03          	shl    rax,0x3
  23535a:	48 05 30 3f 20 00    	add    rax,0x203f30
  235360:	8b 00                	mov    eax,DWORD PTR [rax]
  235362:	85 c0                	test   eax,eax
  235364:	74 41                	je     2353a7 <sys_find_dev+0x81>
  235366:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  235369:	48 63 d0             	movsxd rdx,eax
  23536c:	48 89 d0             	mov    rax,rdx
  23536f:	48 c1 e0 02          	shl    rax,0x2
  235373:	48 01 d0             	add    rax,rdx
  235376:	48 c1 e0 02          	shl    rax,0x2
  23537a:	48 01 d0             	add    rax,rdx
  23537d:	48 c1 e0 03          	shl    rax,0x3
  235381:	48 83 c0 10          	add    rax,0x10
  235385:	48 05 20 3f 20 00    	add    rax,0x203f20
  23538b:	48 8d 50 04          	lea    rdx,[rax+0x4]
  23538f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  235393:	48 89 d6             	mov    rsi,rdx
  235396:	48 89 c7             	mov    rdi,rax
  235399:	e8 5c 61 00 00       	call   23b4fa <strcmp>
  23539e:	85 c0                	test   eax,eax
  2353a0:	75 05                	jne    2353a7 <sys_find_dev+0x81>
  2353a2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2353a5:	eb 0f                	jmp    2353b6 <sys_find_dev+0x90>
  2353a7:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  2353ab:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  2353af:	7e 8e                	jle    23533f <sys_find_dev+0x19>
  2353b1:	b8 ff ff ff ff       	mov    eax,0xffffffff
  2353b6:	c9                   	leave  
  2353b7:	c3                   	ret    

00000000002353b8 <sys_operate_dev>:
  2353b8:	f3 0f 1e fa          	endbr64 
  2353bc:	55                   	push   rbp
  2353bd:	48 89 e5             	mov    rbp,rsp
  2353c0:	48 83 ec 30          	sub    rsp,0x30
  2353c4:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  2353c8:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  2353cb:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  2353cf:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  2353d6:	eb 67                	jmp    23543f <sys_operate_dev+0x87>
  2353d8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2353db:	48 63 d0             	movsxd rdx,eax
  2353de:	48 89 d0             	mov    rax,rdx
  2353e1:	48 c1 e0 02          	shl    rax,0x2
  2353e5:	48 01 d0             	add    rax,rdx
  2353e8:	48 c1 e0 02          	shl    rax,0x2
  2353ec:	48 01 d0             	add    rax,rdx
  2353ef:	48 c1 e0 03          	shl    rax,0x3
  2353f3:	48 05 30 3f 20 00    	add    rax,0x203f30
  2353f9:	8b 00                	mov    eax,DWORD PTR [rax]
  2353fb:	85 c0                	test   eax,eax
  2353fd:	74 3c                	je     23543b <sys_operate_dev+0x83>
  2353ff:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  235402:	48 63 d0             	movsxd rdx,eax
  235405:	48 89 d0             	mov    rax,rdx
  235408:	48 c1 e0 02          	shl    rax,0x2
  23540c:	48 01 d0             	add    rax,rdx
  23540f:	48 c1 e0 02          	shl    rax,0x2
  235413:	48 01 d0             	add    rax,rdx
  235416:	48 c1 e0 03          	shl    rax,0x3
  23541a:	48 83 c0 10          	add    rax,0x10
  23541e:	48 05 20 3f 20 00    	add    rax,0x203f20
  235424:	48 8d 50 04          	lea    rdx,[rax+0x4]
  235428:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  23542c:	48 89 d6             	mov    rsi,rdx
  23542f:	48 89 c7             	mov    rdi,rax
  235432:	e8 c3 60 00 00       	call   23b4fa <strcmp>
  235437:	85 c0                	test   eax,eax
  235439:	74 0c                	je     235447 <sys_operate_dev+0x8f>
  23543b:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  23543f:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  235443:	7e 93                	jle    2353d8 <sys_operate_dev+0x20>
  235445:	eb 01                	jmp    235448 <sys_operate_dev+0x90>
  235447:	90                   	nop
  235448:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  23544c:	75 0a                	jne    235458 <sys_operate_dev+0xa0>
  23544e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  235453:	e9 9c 02 00 00       	jmp    2356f4 <sys_operate_dev+0x33c>
  235458:	83 7d e4 0b          	cmp    DWORD PTR [rbp-0x1c],0xb
  23545c:	0f 87 8d 02 00 00    	ja     2356ef <sys_operate_dev+0x337>
  235462:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  235465:	48 8b 04 c5 50 c3 23 	mov    rax,QWORD PTR [rax*8+0x23c350]
  23546c:	00 
  23546d:	3e ff e0             	notrack jmp rax
  235470:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  235473:	48 63 d0             	movsxd rdx,eax
  235476:	48 89 d0             	mov    rax,rdx
  235479:	48 c1 e0 02          	shl    rax,0x2
  23547d:	48 01 d0             	add    rax,rdx
  235480:	48 c1 e0 02          	shl    rax,0x2
  235484:	48 01 d0             	add    rax,rdx
  235487:	48 c1 e0 03          	shl    rax,0x3
  23548b:	48 05 98 3f 20 00    	add    rax,0x203f98
  235491:	48 8b 00             	mov    rax,QWORD PTR [rax]
  235494:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  235498:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  23549c:	48 89 c7             	mov    rdi,rax
  23549f:	ff d2                	call   rdx
  2354a1:	e9 4e 02 00 00       	jmp    2356f4 <sys_operate_dev+0x33c>
  2354a6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2354a9:	48 63 d0             	movsxd rdx,eax
  2354ac:	48 89 d0             	mov    rax,rdx
  2354af:	48 c1 e0 02          	shl    rax,0x2
  2354b3:	48 01 d0             	add    rax,rdx
  2354b6:	48 c1 e0 02          	shl    rax,0x2
  2354ba:	48 01 d0             	add    rax,rdx
  2354bd:	48 c1 e0 03          	shl    rax,0x3
  2354c1:	48 05 98 3f 20 00    	add    rax,0x203f98
  2354c7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  2354ca:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  2354ce:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  2354d2:	48 89 c7             	mov    rdi,rax
  2354d5:	ff d2                	call   rdx
  2354d7:	e9 18 02 00 00       	jmp    2356f4 <sys_operate_dev+0x33c>
  2354dc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2354df:	48 63 d0             	movsxd rdx,eax
  2354e2:	48 89 d0             	mov    rax,rdx
  2354e5:	48 c1 e0 02          	shl    rax,0x2
  2354e9:	48 01 d0             	add    rax,rdx
  2354ec:	48 c1 e0 02          	shl    rax,0x2
  2354f0:	48 01 d0             	add    rax,rdx
  2354f3:	48 c1 e0 03          	shl    rax,0x3
  2354f7:	48 05 98 3f 20 00    	add    rax,0x203f98
  2354fd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  235500:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  235504:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  235508:	48 89 c7             	mov    rdi,rax
  23550b:	ff d2                	call   rdx
  23550d:	e9 e2 01 00 00       	jmp    2356f4 <sys_operate_dev+0x33c>
  235512:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  235515:	48 63 d0             	movsxd rdx,eax
  235518:	48 89 d0             	mov    rax,rdx
  23551b:	48 c1 e0 02          	shl    rax,0x2
  23551f:	48 01 d0             	add    rax,rdx
  235522:	48 c1 e0 02          	shl    rax,0x2
  235526:	48 01 d0             	add    rax,rdx
  235529:	48 c1 e0 03          	shl    rax,0x3
  23552d:	48 05 98 3f 20 00    	add    rax,0x203f98
  235533:	48 8b 00             	mov    rax,QWORD PTR [rax]
  235536:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  23553a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  23553e:	48 89 c7             	mov    rdi,rax
  235541:	ff d2                	call   rdx
  235543:	e9 ac 01 00 00       	jmp    2356f4 <sys_operate_dev+0x33c>
  235548:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23554b:	48 63 d0             	movsxd rdx,eax
  23554e:	48 89 d0             	mov    rax,rdx
  235551:	48 c1 e0 02          	shl    rax,0x2
  235555:	48 01 d0             	add    rax,rdx
  235558:	48 c1 e0 02          	shl    rax,0x2
  23555c:	48 01 d0             	add    rax,rdx
  23555f:	48 c1 e0 03          	shl    rax,0x3
  235563:	48 05 98 3f 20 00    	add    rax,0x203f98
  235569:	48 8b 00             	mov    rax,QWORD PTR [rax]
  23556c:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  235570:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  235574:	48 89 c7             	mov    rdi,rax
  235577:	ff d2                	call   rdx
  235579:	e9 76 01 00 00       	jmp    2356f4 <sys_operate_dev+0x33c>
  23557e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  235581:	48 63 d0             	movsxd rdx,eax
  235584:	48 89 d0             	mov    rax,rdx
  235587:	48 c1 e0 02          	shl    rax,0x2
  23558b:	48 01 d0             	add    rax,rdx
  23558e:	48 c1 e0 02          	shl    rax,0x2
  235592:	48 01 d0             	add    rax,rdx
  235595:	48 c1 e0 03          	shl    rax,0x3
  235599:	48 05 98 3f 20 00    	add    rax,0x203f98
  23559f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  2355a2:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
  2355a6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  2355aa:	48 89 c7             	mov    rdi,rax
  2355ad:	ff d2                	call   rdx
  2355af:	e9 40 01 00 00       	jmp    2356f4 <sys_operate_dev+0x33c>
  2355b4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2355b7:	48 63 d0             	movsxd rdx,eax
  2355ba:	48 89 d0             	mov    rax,rdx
  2355bd:	48 c1 e0 02          	shl    rax,0x2
  2355c1:	48 01 d0             	add    rax,rdx
  2355c4:	48 c1 e0 02          	shl    rax,0x2
  2355c8:	48 01 d0             	add    rax,rdx
  2355cb:	48 c1 e0 03          	shl    rax,0x3
  2355cf:	48 05 98 3f 20 00    	add    rax,0x203f98
  2355d5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  2355d8:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
  2355dc:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  2355e0:	48 89 c7             	mov    rdi,rax
  2355e3:	ff d2                	call   rdx
  2355e5:	e9 0a 01 00 00       	jmp    2356f4 <sys_operate_dev+0x33c>
  2355ea:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2355ed:	48 63 d0             	movsxd rdx,eax
  2355f0:	48 89 d0             	mov    rax,rdx
  2355f3:	48 c1 e0 02          	shl    rax,0x2
  2355f7:	48 01 d0             	add    rax,rdx
  2355fa:	48 c1 e0 02          	shl    rax,0x2
  2355fe:	48 01 d0             	add    rax,rdx
  235601:	48 c1 e0 03          	shl    rax,0x3
  235605:	48 05 98 3f 20 00    	add    rax,0x203f98
  23560b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  23560e:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  235612:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  235616:	48 89 c7             	mov    rdi,rax
  235619:	ff d2                	call   rdx
  23561b:	e9 d4 00 00 00       	jmp    2356f4 <sys_operate_dev+0x33c>
  235620:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  235623:	48 63 d0             	movsxd rdx,eax
  235626:	48 89 d0             	mov    rax,rdx
  235629:	48 c1 e0 02          	shl    rax,0x2
  23562d:	48 01 d0             	add    rax,rdx
  235630:	48 c1 e0 02          	shl    rax,0x2
  235634:	48 01 d0             	add    rax,rdx
  235637:	48 c1 e0 03          	shl    rax,0x3
  23563b:	48 05 98 3f 20 00    	add    rax,0x203f98
  235641:	48 8b 00             	mov    rax,QWORD PTR [rax]
  235644:	48 8b 50 48          	mov    rdx,QWORD PTR [rax+0x48]
  235648:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  23564c:	48 89 c7             	mov    rdi,rax
  23564f:	ff d2                	call   rdx
  235651:	e9 9e 00 00 00       	jmp    2356f4 <sys_operate_dev+0x33c>
  235656:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  235659:	48 63 d0             	movsxd rdx,eax
  23565c:	48 89 d0             	mov    rax,rdx
  23565f:	48 c1 e0 02          	shl    rax,0x2
  235663:	48 01 d0             	add    rax,rdx
  235666:	48 c1 e0 02          	shl    rax,0x2
  23566a:	48 01 d0             	add    rax,rdx
  23566d:	48 c1 e0 03          	shl    rax,0x3
  235671:	48 05 98 3f 20 00    	add    rax,0x203f98
  235677:	48 8b 00             	mov    rax,QWORD PTR [rax]
  23567a:	48 8b 50 50          	mov    rdx,QWORD PTR [rax+0x50]
  23567e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  235682:	48 89 c7             	mov    rdi,rax
  235685:	ff d2                	call   rdx
  235687:	eb 6b                	jmp    2356f4 <sys_operate_dev+0x33c>
  235689:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23568c:	48 63 d0             	movsxd rdx,eax
  23568f:	48 89 d0             	mov    rax,rdx
  235692:	48 c1 e0 02          	shl    rax,0x2
  235696:	48 01 d0             	add    rax,rdx
  235699:	48 c1 e0 02          	shl    rax,0x2
  23569d:	48 01 d0             	add    rax,rdx
  2356a0:	48 c1 e0 03          	shl    rax,0x3
  2356a4:	48 05 98 3f 20 00    	add    rax,0x203f98
  2356aa:	48 8b 00             	mov    rax,QWORD PTR [rax]
  2356ad:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  2356b1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  2356b5:	48 89 c7             	mov    rdi,rax
  2356b8:	ff d2                	call   rdx
  2356ba:	eb 38                	jmp    2356f4 <sys_operate_dev+0x33c>
  2356bc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2356bf:	48 63 d0             	movsxd rdx,eax
  2356c2:	48 89 d0             	mov    rax,rdx
  2356c5:	48 c1 e0 02          	shl    rax,0x2
  2356c9:	48 01 d0             	add    rax,rdx
  2356cc:	48 c1 e0 02          	shl    rax,0x2
  2356d0:	48 01 d0             	add    rax,rdx
  2356d3:	48 c1 e0 03          	shl    rax,0x3
  2356d7:	48 05 98 3f 20 00    	add    rax,0x203f98
  2356dd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  2356e0:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
  2356e4:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  2356e8:	48 89 c7             	mov    rdi,rax
  2356eb:	ff d2                	call   rdx
  2356ed:	eb 05                	jmp    2356f4 <sys_operate_dev+0x33c>
  2356ef:	b8 ff ff ff ff       	mov    eax,0xffffffff
  2356f4:	c9                   	leave  
  2356f5:	c3                   	ret    

00000000002356f6 <call_drv_func>:
  2356f6:	f3 0f 1e fa          	endbr64 
  2356fa:	55                   	push   rbp
  2356fb:	48 89 e5             	mov    rbp,rsp
  2356fe:	48 83 ec 10          	sub    rsp,0x10
  235702:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  235705:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  235708:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  23570c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23570f:	48 63 d0             	movsxd rdx,eax
  235712:	48 89 d0             	mov    rax,rdx
  235715:	48 c1 e0 02          	shl    rax,0x2
  235719:	48 01 d0             	add    rax,rdx
  23571c:	48 c1 e0 05          	shl    rax,0x5
  235720:	48 05 20 69 20 00    	add    rax,0x206920
  235726:	8b 00                	mov    eax,DWORD PTR [rax]
  235728:	85 c0                	test   eax,eax
  23572a:	75 0a                	jne    235736 <call_drv_func+0x40>
  23572c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  235731:	e9 15 02 00 00       	jmp    23594b <call_drv_func+0x255>
  235736:	83 7d f8 0b          	cmp    DWORD PTR [rbp-0x8],0xb
  23573a:	0f 87 06 02 00 00    	ja     235946 <call_drv_func+0x250>
  235740:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  235743:	48 8b 04 c5 b0 c3 23 	mov    rax,QWORD PTR [rax*8+0x23c3b0]
  23574a:	00 
  23574b:	3e ff e0             	notrack jmp rax
  23574e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  235751:	48 63 d0             	movsxd rdx,eax
  235754:	48 89 d0             	mov    rax,rdx
  235757:	48 c1 e0 02          	shl    rax,0x2
  23575b:	48 01 d0             	add    rax,rdx
  23575e:	48 c1 e0 05          	shl    rax,0x5
  235762:	48 05 28 69 20 00    	add    rax,0x206928
  235768:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  23576b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  23576f:	48 89 c7             	mov    rdi,rax
  235772:	ff d2                	call   rdx
  235774:	e9 d2 01 00 00       	jmp    23594b <call_drv_func+0x255>
  235779:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23577c:	48 63 d0             	movsxd rdx,eax
  23577f:	48 89 d0             	mov    rax,rdx
  235782:	48 c1 e0 02          	shl    rax,0x2
  235786:	48 01 d0             	add    rax,rdx
  235789:	48 c1 e0 05          	shl    rax,0x5
  23578d:	48 05 30 69 20 00    	add    rax,0x206930
  235793:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  235796:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  23579a:	48 89 c7             	mov    rdi,rax
  23579d:	ff d2                	call   rdx
  23579f:	e9 a7 01 00 00       	jmp    23594b <call_drv_func+0x255>
  2357a4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2357a7:	48 63 d0             	movsxd rdx,eax
  2357aa:	48 89 d0             	mov    rax,rdx
  2357ad:	48 c1 e0 02          	shl    rax,0x2
  2357b1:	48 01 d0             	add    rax,rdx
  2357b4:	48 c1 e0 05          	shl    rax,0x5
  2357b8:	48 05 38 69 20 00    	add    rax,0x206938
  2357be:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  2357c1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  2357c5:	48 89 c7             	mov    rdi,rax
  2357c8:	ff d2                	call   rdx
  2357ca:	e9 7c 01 00 00       	jmp    23594b <call_drv_func+0x255>
  2357cf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2357d2:	48 63 d0             	movsxd rdx,eax
  2357d5:	48 89 d0             	mov    rax,rdx
  2357d8:	48 c1 e0 02          	shl    rax,0x2
  2357dc:	48 01 d0             	add    rax,rdx
  2357df:	48 c1 e0 05          	shl    rax,0x5
  2357e3:	48 05 40 69 20 00    	add    rax,0x206940
  2357e9:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  2357ec:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  2357f0:	48 89 c7             	mov    rdi,rax
  2357f3:	ff d2                	call   rdx
  2357f5:	e9 51 01 00 00       	jmp    23594b <call_drv_func+0x255>
  2357fa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2357fd:	48 63 d0             	movsxd rdx,eax
  235800:	48 89 d0             	mov    rax,rdx
  235803:	48 c1 e0 02          	shl    rax,0x2
  235807:	48 01 d0             	add    rax,rdx
  23580a:	48 c1 e0 05          	shl    rax,0x5
  23580e:	48 05 48 69 20 00    	add    rax,0x206948
  235814:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  235817:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  23581b:	48 89 c7             	mov    rdi,rax
  23581e:	ff d2                	call   rdx
  235820:	e9 26 01 00 00       	jmp    23594b <call_drv_func+0x255>
  235825:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  235828:	48 63 d0             	movsxd rdx,eax
  23582b:	48 89 d0             	mov    rax,rdx
  23582e:	48 c1 e0 02          	shl    rax,0x2
  235832:	48 01 d0             	add    rax,rdx
  235835:	48 c1 e0 05          	shl    rax,0x5
  235839:	48 05 50 69 20 00    	add    rax,0x206950
  23583f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  235842:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  235846:	48 89 c7             	mov    rdi,rax
  235849:	ff d2                	call   rdx
  23584b:	e9 fb 00 00 00       	jmp    23594b <call_drv_func+0x255>
  235850:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  235853:	48 63 d0             	movsxd rdx,eax
  235856:	48 89 d0             	mov    rax,rdx
  235859:	48 c1 e0 02          	shl    rax,0x2
  23585d:	48 01 d0             	add    rax,rdx
  235860:	48 c1 e0 05          	shl    rax,0x5
  235864:	48 05 58 69 20 00    	add    rax,0x206958
  23586a:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  23586d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  235871:	48 89 c7             	mov    rdi,rax
  235874:	ff d2                	call   rdx
  235876:	e9 d0 00 00 00       	jmp    23594b <call_drv_func+0x255>
  23587b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23587e:	48 63 d0             	movsxd rdx,eax
  235881:	48 89 d0             	mov    rax,rdx
  235884:	48 c1 e0 02          	shl    rax,0x2
  235888:	48 01 d0             	add    rax,rdx
  23588b:	48 c1 e0 05          	shl    rax,0x5
  23588f:	48 05 60 69 20 00    	add    rax,0x206960
  235895:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  235898:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  23589c:	48 89 c7             	mov    rdi,rax
  23589f:	ff d2                	call   rdx
  2358a1:	e9 a5 00 00 00       	jmp    23594b <call_drv_func+0x255>
  2358a6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2358a9:	48 63 d0             	movsxd rdx,eax
  2358ac:	48 89 d0             	mov    rax,rdx
  2358af:	48 c1 e0 02          	shl    rax,0x2
  2358b3:	48 01 d0             	add    rax,rdx
  2358b6:	48 c1 e0 05          	shl    rax,0x5
  2358ba:	48 05 68 69 20 00    	add    rax,0x206968
  2358c0:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  2358c3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  2358c7:	48 89 c7             	mov    rdi,rax
  2358ca:	ff d2                	call   rdx
  2358cc:	eb 7d                	jmp    23594b <call_drv_func+0x255>
  2358ce:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2358d1:	48 63 d0             	movsxd rdx,eax
  2358d4:	48 89 d0             	mov    rax,rdx
  2358d7:	48 c1 e0 02          	shl    rax,0x2
  2358db:	48 01 d0             	add    rax,rdx
  2358de:	48 c1 e0 05          	shl    rax,0x5
  2358e2:	48 05 70 69 20 00    	add    rax,0x206970
  2358e8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  2358eb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  2358ef:	48 89 c7             	mov    rdi,rax
  2358f2:	ff d2                	call   rdx
  2358f4:	eb 55                	jmp    23594b <call_drv_func+0x255>
  2358f6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2358f9:	48 63 d0             	movsxd rdx,eax
  2358fc:	48 89 d0             	mov    rax,rdx
  2358ff:	48 c1 e0 02          	shl    rax,0x2
  235903:	48 01 d0             	add    rax,rdx
  235906:	48 c1 e0 05          	shl    rax,0x5
  23590a:	48 05 78 69 20 00    	add    rax,0x206978
  235910:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  235913:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  235917:	48 89 c7             	mov    rdi,rax
  23591a:	ff d2                	call   rdx
  23591c:	eb 2d                	jmp    23594b <call_drv_func+0x255>
  23591e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  235921:	48 63 d0             	movsxd rdx,eax
  235924:	48 89 d0             	mov    rax,rdx
  235927:	48 c1 e0 02          	shl    rax,0x2
  23592b:	48 01 d0             	add    rax,rdx
  23592e:	48 c1 e0 05          	shl    rax,0x5
  235932:	48 05 80 69 20 00    	add    rax,0x206980
  235938:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  23593b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  23593f:	48 89 c7             	mov    rdi,rax
  235942:	ff d2                	call   rdx
  235944:	eb 05                	jmp    23594b <call_drv_func+0x255>
  235946:	b8 ff ff ff ff       	mov    eax,0xffffffff
  23594b:	c9                   	leave  
  23594c:	c3                   	ret    

000000000023594d <dispose_device>:
  23594d:	f3 0f 1e fa          	endbr64 
  235951:	55                   	push   rbp
  235952:	48 89 e5             	mov    rbp,rsp
  235955:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  235958:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  23595b:	48 63 d0             	movsxd rdx,eax
  23595e:	48 89 d0             	mov    rax,rdx
  235961:	48 c1 e0 02          	shl    rax,0x2
  235965:	48 01 d0             	add    rax,rdx
  235968:	48 c1 e0 02          	shl    rax,0x2
  23596c:	48 01 d0             	add    rax,rdx
  23596f:	48 c1 e0 03          	shl    rax,0x3
  235973:	48 05 30 3f 20 00    	add    rax,0x203f30
  235979:	8b 00                	mov    eax,DWORD PTR [rax]
  23597b:	83 f8 01             	cmp    eax,0x1
  23597e:	74 07                	je     235987 <dispose_device+0x3a>
  235980:	b8 ff ff ff ff       	mov    eax,0xffffffff
  235985:	eb 62                	jmp    2359e9 <dispose_device+0x9c>
  235987:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  23598a:	48 63 d0             	movsxd rdx,eax
  23598d:	48 89 d0             	mov    rax,rdx
  235990:	48 c1 e0 02          	shl    rax,0x2
  235994:	48 01 d0             	add    rax,rdx
  235997:	48 c1 e0 02          	shl    rax,0x2
  23599b:	48 01 d0             	add    rax,rdx
  23599e:	48 c1 e0 03          	shl    rax,0x3
  2359a2:	48 05 20 3f 20 00    	add    rax,0x203f20
  2359a8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  2359ac:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2359b0:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  2359b7:	48 85 c0             	test   rax,rax
  2359ba:	74 1d                	je     2359d9 <dispose_device+0x8c>
  2359bc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2359c0:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  2359c7:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  2359cb:	48 8b 92 90 00 00 00 	mov    rdx,QWORD PTR [rdx+0x90]
  2359d2:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
  2359d9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2359dd:	c7 40 10 00 00 00 00 	mov    DWORD PTR [rax+0x10],0x0
  2359e4:	b8 00 00 00 00       	mov    eax,0x0
  2359e9:	5d                   	pop    rbp
  2359ea:	c3                   	ret    

00000000002359eb <dispose_driver>:
  2359eb:	f3 0f 1e fa          	endbr64 
  2359ef:	55                   	push   rbp
  2359f0:	48 89 e5             	mov    rbp,rsp
  2359f3:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  2359f7:	90                   	nop
  2359f8:	5d                   	pop    rbp
  2359f9:	c3                   	ret    

00000000002359fa <get_dev>:
  2359fa:	f3 0f 1e fa          	endbr64 
  2359fe:	55                   	push   rbp
  2359ff:	48 89 e5             	mov    rbp,rsp
  235a02:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  235a05:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  235a08:	48 63 d0             	movsxd rdx,eax
  235a0b:	48 89 d0             	mov    rax,rdx
  235a0e:	48 c1 e0 02          	shl    rax,0x2
  235a12:	48 01 d0             	add    rax,rdx
  235a15:	48 c1 e0 02          	shl    rax,0x2
  235a19:	48 01 d0             	add    rax,rdx
  235a1c:	48 c1 e0 03          	shl    rax,0x3
  235a20:	48 05 20 3f 20 00    	add    rax,0x203f20
  235a26:	5d                   	pop    rbp
  235a27:	c3                   	ret    

0000000000235a28 <get_drv>:
  235a28:	f3 0f 1e fa          	endbr64 
  235a2c:	55                   	push   rbp
  235a2d:	48 89 e5             	mov    rbp,rsp
  235a30:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  235a33:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  235a36:	48 63 d0             	movsxd rdx,eax
  235a39:	48 89 d0             	mov    rax,rdx
  235a3c:	48 c1 e0 02          	shl    rax,0x2
  235a40:	48 01 d0             	add    rax,rdx
  235a43:	48 c1 e0 05          	shl    rax,0x5
  235a47:	48 05 20 69 20 00    	add    rax,0x206920
  235a4d:	5d                   	pop    rbp
  235a4e:	c3                   	ret    

0000000000235a4f <make_request>:
  235a4f:	f3 0f 1e fa          	endbr64 
  235a53:	55                   	push   rbp
  235a54:	48 89 e5             	mov    rbp,rsp
  235a57:	53                   	push   rbx
  235a58:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
  235a5c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  235a63:	eb 23                	jmp    235a88 <make_request+0x39>
  235a65:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  235a68:	48 63 d0             	movsxd rdx,eax
  235a6b:	48 89 d0             	mov    rax,rdx
  235a6e:	48 01 c0             	add    rax,rax
  235a71:	48 01 d0             	add    rax,rdx
  235a74:	48 c1 e0 06          	shl    rax,0x6
  235a78:	48 05 cc 7d 20 00    	add    rax,0x207dcc
  235a7e:	8b 00                	mov    eax,DWORD PTR [rax]
  235a80:	85 c0                	test   eax,eax
  235a82:	74 0c                	je     235a90 <make_request+0x41>
  235a84:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  235a88:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  235a8c:	7e d7                	jle    235a65 <make_request+0x16>
  235a8e:	eb 01                	jmp    235a91 <make_request+0x42>
  235a90:	90                   	nop
  235a91:	83 7d f4 20          	cmp    DWORD PTR [rbp-0xc],0x20
  235a95:	75 0a                	jne    235aa1 <make_request+0x52>
  235a97:	b8 ff ff ff ff       	mov    eax,0xffffffff
  235a9c:	e9 e7 01 00 00       	jmp    235c88 <make_request+0x239>
  235aa1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  235aa4:	48 63 d0             	movsxd rdx,eax
  235aa7:	48 89 d0             	mov    rax,rdx
  235aaa:	48 01 c0             	add    rax,rax
  235aad:	48 01 d0             	add    rax,rdx
  235ab0:	48 c1 e0 06          	shl    rax,0x6
  235ab4:	48 8d 90 20 7d 20 00 	lea    rdx,[rax+0x207d20]
  235abb:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  235abf:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  235ac2:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  235ac6:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  235ac9:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  235acd:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  235ad1:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  235ad5:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  235ad9:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  235add:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  235ae1:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  235ae5:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  235ae9:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  235aed:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  235af1:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  235af5:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  235af9:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  235afd:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  235b01:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  235b05:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  235b09:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  235b0d:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  235b11:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  235b15:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  235b19:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  235b1d:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  235b21:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  235b25:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  235b29:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  235b2d:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  235b31:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  235b35:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  235b39:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  235b3d:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  235b44:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  235b4b:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  235b52:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  235b59:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  235b60:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  235b67:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  235b6e:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  235b75:	48 8b 88 a0 00 00 00 	mov    rcx,QWORD PTR [rax+0xa0]
  235b7c:	48 8b 98 a8 00 00 00 	mov    rbx,QWORD PTR [rax+0xa8]
  235b83:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  235b8a:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  235b91:	48 8b 88 b0 00 00 00 	mov    rcx,QWORD PTR [rax+0xb0]
  235b98:	48 8b 98 b8 00 00 00 	mov    rbx,QWORD PTR [rax+0xb8]
  235b9f:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  235ba6:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
  235bad:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  235bb1:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  235bb7:	48 63 d0             	movsxd rdx,eax
  235bba:	48 89 d0             	mov    rax,rdx
  235bbd:	48 c1 e0 02          	shl    rax,0x2
  235bc1:	48 01 d0             	add    rax,rdx
  235bc4:	48 c1 e0 02          	shl    rax,0x2
  235bc8:	48 01 d0             	add    rax,rdx
  235bcb:	48 c1 e0 03          	shl    rax,0x3
  235bcf:	48 05 20 3f 20 00    	add    rax,0x203f20
  235bd5:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  235bd9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  235bdd:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  235be4:	48 85 c0             	test   rax,rax
  235be7:	75 27                	jne    235c10 <make_request+0x1c1>
  235be9:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  235bec:	48 63 d0             	movsxd rdx,eax
  235bef:	48 89 d0             	mov    rax,rdx
  235bf2:	48 01 c0             	add    rax,rax
  235bf5:	48 01 d0             	add    rax,rdx
  235bf8:	48 c1 e0 06          	shl    rax,0x6
  235bfc:	48 8d 90 20 7d 20 00 	lea    rdx,[rax+0x207d20]
  235c03:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  235c07:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
  235c0e:	eb 75                	jmp    235c85 <make_request+0x236>
  235c10:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  235c14:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  235c1b:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  235c1f:	eb 0f                	jmp    235c30 <make_request+0x1e1>
  235c21:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  235c25:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  235c2c:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  235c30:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  235c34:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  235c3b:	48 85 c0             	test   rax,rax
  235c3e:	75 e1                	jne    235c21 <make_request+0x1d2>
  235c40:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  235c43:	48 63 d0             	movsxd rdx,eax
  235c46:	48 89 d0             	mov    rax,rdx
  235c49:	48 01 c0             	add    rax,rax
  235c4c:	48 01 d0             	add    rax,rdx
  235c4f:	48 c1 e0 06          	shl    rax,0x6
  235c53:	48 8d 90 20 7d 20 00 	lea    rdx,[rax+0x207d20]
  235c5a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  235c5e:	48 89 90 b8 00 00 00 	mov    QWORD PTR [rax+0xb8],rdx
  235c65:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  235c68:	48 63 d0             	movsxd rdx,eax
  235c6b:	48 89 d0             	mov    rax,rdx
  235c6e:	48 01 c0             	add    rax,rax
  235c71:	48 01 d0             	add    rax,rdx
  235c74:	48 c1 e0 06          	shl    rax,0x6
  235c78:	48 05 d8 7d 20 00    	add    rax,0x207dd8
  235c7e:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
  235c85:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  235c88:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  235c8c:	c9                   	leave  
  235c8d:	c3                   	ret    

0000000000235c8e <do_req>:
  235c8e:	f3 0f 1e fa          	endbr64 
  235c92:	55                   	push   rbp
  235c93:	48 89 e5             	mov    rbp,rsp
  235c96:	48 83 ec 10          	sub    rsp,0x10
  235c9a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  235ca1:	e9 ab 00 00 00       	jmp    235d51 <do_req+0xc3>
  235ca6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  235ca9:	48 98                	cdqe   
  235cab:	48 8b 04 c5 20 95 20 	mov    rax,QWORD PTR [rax*8+0x209520]
  235cb2:	00 
  235cb3:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  235cb7:	e9 86 00 00 00       	jmp    235d42 <do_req+0xb4>
  235cbc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  235cc0:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  235cc7:	48 85 c0             	test   rax,rax
  235cca:	75 67                	jne    235d33 <do_req+0xa5>
  235ccc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  235cd0:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  235cd7:	48 85 c0             	test   rax,rax
  235cda:	74 57                	je     235d33 <do_req+0xa5>
  235cdc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  235ce0:	48 8b 90 88 00 00 00 	mov    rdx,QWORD PTR [rax+0x88]
  235ce7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  235ceb:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
  235cf2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  235cf6:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  235cfd:	48 8b 90 b8 00 00 00 	mov    rdx,QWORD PTR [rax+0xb8]
  235d04:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  235d08:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
  235d0f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  235d13:	8b 80 a0 00 00 00    	mov    eax,DWORD PTR [rax+0xa0]
  235d19:	48 98                	cdqe   
  235d1b:	48 8b 14 c5 00 bc 23 	mov    rdx,QWORD PTR [rax*8+0x23bc00]
  235d22:	00 
  235d23:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  235d27:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  235d2e:	48 89 c7             	mov    rdi,rax
  235d31:	ff d2                	call   rdx
  235d33:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  235d37:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  235d3e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  235d42:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  235d47:	0f 85 6f ff ff ff    	jne    235cbc <do_req+0x2e>
  235d4d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  235d51:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  235d55:	0f 8e 4b ff ff ff    	jle    235ca6 <do_req+0x18>
  235d5b:	b8 00 00 00 00       	mov    eax,0x0
  235d60:	c9                   	leave  
  235d61:	c3                   	ret    

0000000000235d62 <wait_on_req>:
  235d62:	f3 0f 1e fa          	endbr64 
  235d66:	55                   	push   rbp
  235d67:	48 89 e5             	mov    rbp,rsp
  235d6a:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  235d6d:	90                   	nop
  235d6e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  235d71:	48 63 d0             	movsxd rdx,eax
  235d74:	48 89 d0             	mov    rax,rdx
  235d77:	48 01 c0             	add    rax,rax
  235d7a:	48 01 d0             	add    rax,rdx
  235d7d:	48 c1 e0 06          	shl    rax,0x6
  235d81:	48 05 cc 7d 20 00    	add    rax,0x207dcc
  235d87:	8b 00                	mov    eax,DWORD PTR [rax]
  235d89:	83 f8 03             	cmp    eax,0x3
  235d8c:	75 e0                	jne    235d6e <wait_on_req+0xc>
  235d8e:	90                   	nop
  235d8f:	90                   	nop
  235d90:	5d                   	pop    rbp
  235d91:	c3                   	ret    

0000000000235d92 <clear_req>:
  235d92:	f3 0f 1e fa          	endbr64 
  235d96:	55                   	push   rbp
  235d97:	48 89 e5             	mov    rbp,rsp
  235d9a:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  235d9d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  235da0:	48 63 d0             	movsxd rdx,eax
  235da3:	48 89 d0             	mov    rax,rdx
  235da6:	48 01 c0             	add    rax,rax
  235da9:	48 01 d0             	add    rax,rdx
  235dac:	48 c1 e0 06          	shl    rax,0x6
  235db0:	48 05 cc 7d 20 00    	add    rax,0x207dcc
  235db6:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  235dbc:	90                   	nop
  235dbd:	5d                   	pop    rbp
  235dbe:	c3                   	ret    

0000000000235dbf <init_proc>:
  235dbf:	f3 0f 1e fa          	endbr64 
  235dc3:	55                   	push   rbp
  235dc4:	48 89 e5             	mov    rbp,rsp
  235dc7:	48 83 ec 10          	sub    rsp,0x10
  235dcb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  235dd2:	eb 4c                	jmp    235e20 <init_proc+0x61>
  235dd4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  235dd7:	48 98                	cdqe   
  235dd9:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  235de0:	48 05 40 95 20 00    	add    rax,0x209540
  235de6:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
  235dec:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  235def:	48 98                	cdqe   
  235df1:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  235df8:	48 05 44 95 20 00    	add    rax,0x209544
  235dfe:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
  235e04:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  235e07:	48 98                	cdqe   
  235e09:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  235e10:	48 05 a0 95 20 00    	add    rax,0x2095a0
  235e16:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
  235e1c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  235e20:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  235e24:	7e ae                	jle    235dd4 <init_proc+0x15>
  235e26:	c7 05 e0 d2 fd ff 00 	mov    DWORD PTR [rip+0xfffffffffffdd2e0],0x0        # 213110 <cur_proc>
  235e2d:	00 00 00 
  235e30:	c7 05 da d2 fd ff 01 	mov    DWORD PTR [rip+0xfffffffffffdd2da],0x1        # 213114 <pidd>
  235e37:	00 00 00 
  235e3a:	b8 00 00 00 00       	mov    eax,0x0
  235e3f:	e8 38 00 00 00       	call   235e7c <create_proc>
  235e44:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  235e47:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  235e4a:	48 98                	cdqe   
  235e4c:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  235e53:	48 05 44 95 20 00    	add    rax,0x209544
  235e59:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
  235e5f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  235e62:	83 c0 03             	add    eax,0x3
  235e65:	c1 e0 04             	shl    eax,0x4
  235e68:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  235e6b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  235e6e:	01 c0                	add    eax,eax
  235e70:	83 c0 05             	add    eax,0x5
  235e73:	c1 e0 03             	shl    eax,0x3
  235e76:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  235e79:	90                   	nop
  235e7a:	c9                   	leave  
  235e7b:	c3                   	ret    

0000000000235e7c <create_proc>:
  235e7c:	f3 0f 1e fa          	endbr64 
  235e80:	55                   	push   rbp
  235e81:	48 89 e5             	mov    rbp,rsp
  235e84:	48 83 ec 10          	sub    rsp,0x10
  235e88:	b8 00 00 00 00       	mov    eax,0x0
  235e8d:	e8 7d 00 00 00       	call   235f0f <req_proc>
  235e92:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  235e95:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  235e99:	75 07                	jne    235ea2 <create_proc+0x26>
  235e9b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  235ea0:	eb 6b                	jmp    235f0d <create_proc+0x91>
  235ea2:	c7 45 f8 ff fb 09 00 	mov    DWORD PTR [rbp-0x8],0x9fbff
  235ea9:	89 65 f8             	mov    DWORD PTR [rbp-0x8],esp
  235eac:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  235eaf:	48 98                	cdqe   
  235eb1:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  235eb4:	52                   	push   rdx
  235eb5:	6a 00                	push   0x0
  235eb7:	6a 00                	push   0x0
  235eb9:	6a 00                	push   0x0
  235ebb:	6a 00                	push   0x0
  235ebd:	50                   	push   rax
  235ebe:	6a 17                	push   0x17
  235ec0:	6a 17                	push   0x17
  235ec2:	6a 17                	push   0x17
  235ec4:	6a 17                	push   0x17
  235ec6:	41 b9 0f 00 00 00    	mov    r9d,0xf
  235ecc:	41 b8 17 00 00 00    	mov    r8d,0x17
  235ed2:	b9 00 00 00 00       	mov    ecx,0x0
  235ed7:	ba 00 00 00 00       	mov    edx,0x0
  235edc:	be 00 00 00 00       	mov    esi,0x0
  235ee1:	bf 00 00 00 00       	mov    edi,0x0
  235ee6:	e8 f0 00 00 00       	call   235fdb <set_proc>
  235eeb:	48 83 c4 50          	add    rsp,0x50
  235eef:	ba 5f 62 23 00       	mov    edx,0x23625f
  235ef4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  235ef7:	48 98                	cdqe   
  235ef9:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  235f00:	48 05 10 97 20 00    	add    rax,0x209710
  235f06:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
  235f0a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  235f0d:	c9                   	leave  
  235f0e:	c3                   	ret    

0000000000235f0f <req_proc>:
  235f0f:	f3 0f 1e fa          	endbr64 
  235f13:	55                   	push   rbp
  235f14:	48 89 e5             	mov    rbp,rsp
  235f17:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  235f1e:	eb 04                	jmp    235f24 <req_proc+0x15>
  235f20:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  235f24:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  235f27:	48 98                	cdqe   
  235f29:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  235f30:	48 05 40 95 20 00    	add    rax,0x209540
  235f36:	8b 00                	mov    eax,DWORD PTR [rax]
  235f38:	83 f8 ff             	cmp    eax,0xffffffff
  235f3b:	74 1f                	je     235f5c <req_proc+0x4d>
  235f3d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  235f40:	48 98                	cdqe   
  235f42:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  235f49:	48 05 44 95 20 00    	add    rax,0x209544
  235f4f:	8b 00                	mov    eax,DWORD PTR [rax]
  235f51:	83 f8 03             	cmp    eax,0x3
  235f54:	74 06                	je     235f5c <req_proc+0x4d>
  235f56:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  235f5a:	7e c4                	jle    235f20 <req_proc+0x11>
  235f5c:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  235f60:	7e 07                	jle    235f69 <req_proc+0x5a>
  235f62:	b8 ff ff ff ff       	mov    eax,0xffffffff
  235f67:	eb 70                	jmp    235fd9 <req_proc+0xca>
  235f69:	8b 05 a5 d1 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdd1a5]        # 213114 <pidd>
  235f6f:	8d 50 01             	lea    edx,[rax+0x1]
  235f72:	89 15 9c d1 fd ff    	mov    DWORD PTR [rip+0xfffffffffffdd19c],edx        # 213114 <pidd>
  235f78:	89 c2                	mov    edx,eax
  235f7a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  235f7d:	48 98                	cdqe   
  235f7f:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  235f86:	48 05 40 95 20 00    	add    rax,0x209540
  235f8c:	89 10                	mov    DWORD PTR [rax],edx
  235f8e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  235f91:	48 98                	cdqe   
  235f93:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  235f9a:	48 05 44 95 20 00    	add    rax,0x209544
  235fa0:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
  235fa6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  235fa9:	48 98                	cdqe   
  235fab:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  235fb2:	48 05 48 95 20 00    	add    rax,0x209548
  235fb8:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  235fbe:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  235fc1:	48 98                	cdqe   
  235fc3:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  235fca:	48 05 4c 95 20 00    	add    rax,0x20954c
  235fd0:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  235fd6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  235fd9:	5d                   	pop    rbp
  235fda:	c3                   	ret    

0000000000235fdb <set_proc>:
  235fdb:	f3 0f 1e fa          	endbr64 
  235fdf:	55                   	push   rbp
  235fe0:	48 89 e5             	mov    rbp,rsp
  235fe3:	48 83 ec 40          	sub    rsp,0x40
  235fe7:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  235feb:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  235fef:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  235ff3:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  235ff7:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
  235ffb:	4c 89 4d c0          	mov    QWORD PTR [rbp-0x40],r9
  235fff:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  236002:	48 98                	cdqe   
  236004:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  23600b:	48 05 40 95 20 00    	add    rax,0x209540
  236011:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  236015:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236019:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  23601d:	48 89 90 ec 01 00 00 	mov    QWORD PTR [rax+0x1ec],rdx
  236024:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236028:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  23602c:	48 89 90 04 02 00 00 	mov    QWORD PTR [rax+0x204],rdx
  236033:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236037:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  23603b:	48 89 90 f4 01 00 00 	mov    QWORD PTR [rax+0x1f4],rdx
  236042:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236046:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  23604a:	48 89 90 fc 01 00 00 	mov    QWORD PTR [rax+0x1fc],rdx
  236051:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236055:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  236059:	48 89 90 2c 02 00 00 	mov    QWORD PTR [rax+0x22c],rdx
  236060:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236064:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  236068:	48 89 90 34 02 00 00 	mov    QWORD PTR [rax+0x234],rdx
  23606f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236073:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  236077:	48 89 90 3c 02 00 00 	mov    QWORD PTR [rax+0x23c],rdx
  23607e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236082:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  236086:	48 89 90 ac 01 00 00 	mov    QWORD PTR [rax+0x1ac],rdx
  23608d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236091:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  236095:	48 89 90 bc 01 00 00 	mov    QWORD PTR [rax+0x1bc],rdx
  23609c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2360a0:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  2360a4:	48 89 90 cc 01 00 00 	mov    QWORD PTR [rax+0x1cc],rdx
  2360ab:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2360af:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  2360b3:	48 89 90 44 02 00 00 	mov    QWORD PTR [rax+0x244],rdx
  2360ba:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2360be:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  2360c2:	48 89 90 4c 02 00 00 	mov    QWORD PTR [rax+0x24c],rdx
  2360c9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2360cd:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  2360d1:	48 89 90 54 02 00 00 	mov    QWORD PTR [rax+0x254],rdx
  2360d8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2360dc:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  2360e0:	48 89 90 0c 02 00 00 	mov    QWORD PTR [rax+0x20c],rdx
  2360e7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2360eb:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  2360ef:	48 89 90 a4 01 00 00 	mov    QWORD PTR [rax+0x1a4],rdx
  2360f6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2360fa:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  2360fe:	48 89 90 b4 01 00 00 	mov    QWORD PTR [rax+0x1b4],rdx
  236105:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236109:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  23610d:	48 89 90 c4 01 00 00 	mov    QWORD PTR [rax+0x1c4],rdx
  236114:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236118:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
  23611c:	48 89 90 14 02 00 00 	mov    QWORD PTR [rax+0x214],rdx
  236123:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236127:	48 8b 55 40          	mov    rdx,QWORD PTR [rbp+0x40]
  23612b:	48 89 90 1c 02 00 00 	mov    QWORD PTR [rax+0x21c],rdx
  236132:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236136:	48 8b 55 48          	mov    rdx,QWORD PTR [rbp+0x48]
  23613a:	48 89 90 24 02 00 00 	mov    QWORD PTR [rax+0x224],rdx
  236141:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236145:	48 c7 80 e4 01 00 00 	mov    QWORD PTR [rax+0x1e4],0x202
  23614c:	02 02 00 00 
  236150:	ba 5f 62 23 00       	mov    edx,0x23625f
  236155:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236159:	48 89 90 dc 01 00 00 	mov    QWORD PTR [rax+0x1dc],rdx
  236160:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236164:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  236168:	48 89 90 34 02 00 00 	mov    QWORD PTR [rax+0x234],rdx
  23616f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236173:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  236177:	48 89 90 44 02 00 00 	mov    QWORD PTR [rax+0x244],rdx
  23617e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236182:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  236186:	48 89 90 2c 02 00 00 	mov    QWORD PTR [rax+0x22c],rdx
  23618d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236191:	48 c7 80 d4 01 00 00 	mov    QWORD PTR [rax+0x1d4],0x100000
  236198:	00 00 10 00 
  23619c:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  23619f:	83 c0 03             	add    eax,0x3
  2361a2:	c1 e0 04             	shl    eax,0x4
  2361a5:	48 63 d0             	movsxd rdx,eax
  2361a8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2361ac:	48 89 90 5c 02 00 00 	mov    QWORD PTR [rax+0x25c],rdx
  2361b3:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  2361b6:	01 c0                	add    eax,eax
  2361b8:	83 c0 05             	add    eax,0x5
  2361bb:	89 c2                	mov    edx,eax
  2361bd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2361c1:	48 05 9c 01 00 00    	add    rax,0x19c
  2361c7:	89 d1                	mov    ecx,edx
  2361c9:	ba 89 00 00 00       	mov    edx,0x89
  2361ce:	be ff ff 00 00       	mov    esi,0xffff
  2361d3:	89 c7                	mov    edi,eax
  2361d5:	e8 e7 0d 00 00       	call   236fc1 <fill_desc>
  2361da:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  2361dd:	83 c0 03             	add    eax,0x3
  2361e0:	01 c0                	add    eax,eax
  2361e2:	89 c2                	mov    edx,eax
  2361e4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2361e8:	48 83 c0 34          	add    rax,0x34
  2361ec:	89 d1                	mov    ecx,edx
  2361ee:	ba 82 00 00 00       	mov    edx,0x82
  2361f3:	be 28 00 00 00       	mov    esi,0x28
  2361f8:	89 c7                	mov    edi,eax
  2361fa:	e8 c2 0d 00 00       	call   236fc1 <fill_desc>
  2361ff:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236203:	48 83 c0 34          	add    rax,0x34
  236207:	48 89 c1             	mov    rcx,rax
  23620a:	ba fe cf 00 00       	mov    edx,0xcffe
  23620f:	be ff ff ff ff       	mov    esi,0xffffffff
  236214:	bf 00 00 00 00       	mov    edi,0x0
  236219:	e8 d1 0e 00 00       	call   2370ef <fill_ldt_desc>
  23621e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236222:	48 83 c0 3c          	add    rax,0x3c
  236226:	48 89 c1             	mov    rcx,rax
  236229:	ba f2 cf 00 00       	mov    edx,0xcff2
  23622e:	be ff ff ff ff       	mov    esi,0xffffffff
  236233:	bf 00 00 00 00       	mov    edi,0x0
  236238:	e8 b2 0e 00 00       	call   2370ef <fill_ldt_desc>
  23623d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236241:	48 83 c0 44          	add    rax,0x44
  236245:	48 89 c1             	mov    rcx,rax
  236248:	ba f6 00 00 00       	mov    edx,0xf6
  23624d:	be 00 10 00 00       	mov    esi,0x1000
  236252:	bf 00 f0 bf 01       	mov    edi,0x1bff000
  236257:	e8 93 0e 00 00       	call   2370ef <fill_ldt_desc>
  23625c:	90                   	nop
  23625d:	c9                   	leave  
  23625e:	c3                   	ret    

000000000023625f <proc_zero>:
  23625f:	f3 0f 1e fa          	endbr64 
  236263:	55                   	push   rbp
  236264:	48 89 e5             	mov    rbp,rsp
  236267:	eb fe                	jmp    236267 <proc_zero+0x8>

0000000000236269 <manage_proc>:
  236269:	f3 0f 1e fa          	endbr64 
  23626d:	55                   	push   rbp
  23626e:	48 89 e5             	mov    rbp,rsp
  236271:	48 83 ec 10          	sub    rsp,0x10
  236275:	8b 05 95 ce fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdce95]        # 213110 <cur_proc>
  23627b:	83 f8 ff             	cmp    eax,0xffffffff
  23627e:	74 2d                	je     2362ad <manage_proc+0x44>
  236280:	8b 05 8a ce fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdce8a]        # 213110 <cur_proc>
  236286:	48 63 d0             	movsxd rdx,eax
  236289:	48 69 d2 6c 02 00 00 	imul   rdx,rdx,0x26c
  236290:	48 81 c2 48 95 20 00 	add    rdx,0x209548
  236297:	8b 12                	mov    edx,DWORD PTR [rdx]
  236299:	83 c2 01             	add    edx,0x1
  23629c:	48 98                	cdqe   
  23629e:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  2362a5:	48 05 48 95 20 00    	add    rax,0x209548
  2362ab:	89 10                	mov    DWORD PTR [rax],edx
  2362ad:	8b 05 5d ce fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdce5d]        # 213110 <cur_proc>
  2362b3:	83 f8 ff             	cmp    eax,0xffffffff
  2362b6:	74 3c                	je     2362f4 <manage_proc+0x8b>
  2362b8:	8b 05 52 ce fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdce52]        # 213110 <cur_proc>
  2362be:	48 98                	cdqe   
  2362c0:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  2362c7:	48 05 48 95 20 00    	add    rax,0x209548
  2362cd:	8b 00                	mov    eax,DWORD PTR [rax]
  2362cf:	83 f8 01             	cmp    eax,0x1
  2362d2:	77 20                	ja     2362f4 <manage_proc+0x8b>
  2362d4:	8b 05 36 ce fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdce36]        # 213110 <cur_proc>
  2362da:	48 98                	cdqe   
  2362dc:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  2362e3:	48 05 44 95 20 00    	add    rax,0x209544
  2362e9:	8b 00                	mov    eax,DWORD PTR [rax]
  2362eb:	83 f8 01             	cmp    eax,0x1
  2362ee:	0f 84 90 00 00 00    	je     236384 <manage_proc+0x11b>
  2362f4:	8b 05 16 ce fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdce16]        # 213110 <cur_proc>
  2362fa:	83 f8 ff             	cmp    eax,0xffffffff
  2362fd:	74 1b                	je     23631a <manage_proc+0xb1>
  2362ff:	8b 05 0b ce fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdce0b]        # 213110 <cur_proc>
  236305:	48 98                	cdqe   
  236307:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  23630e:	48 05 48 95 20 00    	add    rax,0x209548
  236314:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  23631a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  236321:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  236328:	eb 41                	jmp    23636b <manage_proc+0x102>
  23632a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23632d:	48 98                	cdqe   
  23632f:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  236336:	48 05 40 95 20 00    	add    rax,0x209540
  23633c:	8b 00                	mov    eax,DWORD PTR [rax]
  23633e:	83 f8 ff             	cmp    eax,0xffffffff
  236341:	74 24                	je     236367 <manage_proc+0xfe>
  236343:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  236346:	48 98                	cdqe   
  236348:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  23634f:	48 05 44 95 20 00    	add    rax,0x209544
  236355:	8b 00                	mov    eax,DWORD PTR [rax]
  236357:	83 f8 01             	cmp    eax,0x1
  23635a:	75 0b                	jne    236367 <manage_proc+0xfe>
  23635c:	8b 05 ae cd fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdcdae]        # 213110 <cur_proc>
  236362:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  236365:	75 0c                	jne    236373 <manage_proc+0x10a>
  236367:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  23636b:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  23636f:	7e b9                	jle    23632a <manage_proc+0xc1>
  236371:	eb 01                	jmp    236374 <manage_proc+0x10b>
  236373:	90                   	nop
  236374:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  236378:	7f 0d                	jg     236387 <manage_proc+0x11e>
  23637a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23637d:	89 c7                	mov    edi,eax
  23637f:	e8 06 00 00 00       	call   23638a <switch_proc_tss>
  236384:	90                   	nop
  236385:	eb 01                	jmp    236388 <manage_proc+0x11f>
  236387:	90                   	nop
  236388:	c9                   	leave  
  236389:	c3                   	ret    

000000000023638a <switch_proc_tss>:
  23638a:	f3 0f 1e fa          	endbr64 
  23638e:	55                   	push   rbp
  23638f:	48 89 e5             	mov    rbp,rsp
  236392:	48 83 ec 20          	sub    rsp,0x20
  236396:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  236399:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  23639c:	01 c0                	add    eax,eax
  23639e:	83 c0 05             	add    eax,0x5
  2363a1:	c1 e0 03             	shl    eax,0x3
  2363a4:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  2363a7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  2363aa:	89 05 60 cd fd ff    	mov    DWORD PTR [rip+0xfffffffffffdcd60],eax        # 213110 <cur_proc>
  2363b0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2363b3:	89 c7                	mov    edi,eax
  2363b5:	e8 41 57 00 00       	call   23bafb <switch_proc_asm>
  2363ba:	90                   	nop
  2363bb:	c9                   	leave  
  2363bc:	c3                   	ret    

00000000002363bd <switch_proc>:
  2363bd:	f3 0f 1e fa          	endbr64 
  2363c1:	55                   	push   rbp
  2363c2:	48 89 e5             	mov    rbp,rsp
  2363c5:	48 81 ec 80 02 00 00 	sub    rsp,0x280
  2363cc:	89 bd 8c fd ff ff    	mov    DWORD PTR [rbp-0x274],edi
  2363d2:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  2363d8:	48 98                	cdqe   
  2363da:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  2363e1:	48 8d 90 40 95 20 00 	lea    rdx,[rax+0x209540]
  2363e8:	48 8d 85 90 fd ff ff 	lea    rax,[rbp-0x270]
  2363ef:	b9 4d 00 00 00       	mov    ecx,0x4d
  2363f4:	48 89 c7             	mov    rdi,rax
  2363f7:	48 89 d6             	mov    rsi,rdx
  2363fa:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
  2363fd:	48 89 f2             	mov    rdx,rsi
  236400:	48 89 f8             	mov    rax,rdi
  236403:	8b 0a                	mov    ecx,DWORD PTR [rdx]
  236405:	89 08                	mov    DWORD PTR [rax],ecx
  236407:	8b 05 03 cd fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdcd03]        # 213110 <cur_proc>
  23640d:	48 98                	cdqe   
  23640f:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  236416:	48 05 90 01 00 00    	add    rax,0x190
  23641c:	48 05 40 95 20 00    	add    rax,0x209540
  236422:	48 83 c0 0c          	add    rax,0xc
  236426:	48 89 c7             	mov    rdi,rax
  236429:	e8 69 00 00 00       	call   236497 <save_context>
  23642e:	b8 5f 62 23 00       	mov    eax,0x23625f
  236433:	48 89 05 e2 32 fd ff 	mov    QWORD PTR [rip+0xfffffffffffd32e2],rax        # 20971c <task+0x1dc>
  23643a:	48 c7 05 cf 32 fd ff 	mov    QWORD PTR [rip+0xfffffffffffd32cf],0x100000        # 209714 <task+0x1d4>
  236441:	00 00 10 00 
  236445:	48 c7 05 d4 32 fd ff 	mov    QWORD PTR [rip+0xfffffffffffd32d4],0x202        # 209724 <task+0x1e4>
  23644c:	02 02 00 00 
  236450:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  236456:	89 05 b4 cc fd ff    	mov    DWORD PTR [rip+0xfffffffffffdccb4],eax        # 213110 <cur_proc>
  23645c:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  236462:	01 c0                	add    eax,eax
  236464:	83 c0 05             	add    eax,0x5
  236467:	c1 e0 03             	shl    eax,0x3
  23646a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  23646d:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  236473:	48 98                	cdqe   
  236475:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  23647c:	48 05 90 01 00 00    	add    rax,0x190
  236482:	48 05 40 95 20 00    	add    rax,0x209540
  236488:	48 83 c0 0c          	add    rax,0xc
  23648c:	48 89 c7             	mov    rdi,rax
  23648f:	e8 84 56 00 00       	call   23bb18 <switch_to>
  236494:	90                   	nop
  236495:	c9                   	leave  
  236496:	c3                   	ret    

0000000000236497 <save_context>:
  236497:	f3 0f 1e fa          	endbr64 
  23649b:	55                   	push   rbp
  23649c:	48 89 e5             	mov    rbp,rsp
  23649f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  2364a3:	48 8b 15 d6 cb fd ff 	mov    rdx,QWORD PTR [rip+0xfffffffffffdcbd6]        # 213080 <scene_saver+0x40>
  2364aa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2364ae:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
  2364b2:	48 8b 15 d7 cb fd ff 	mov    rdx,QWORD PTR [rip+0xfffffffffffdcbd7]        # 213090 <scene_saver+0x50>
  2364b9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2364bd:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
  2364c1:	48 8b 15 e0 cb fd ff 	mov    rdx,QWORD PTR [rip+0xfffffffffffdcbe0]        # 2130a8 <scene_saver+0x68>
  2364c8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2364cc:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
  2364d0:	48 8b 15 c1 cb fd ff 	mov    rdx,QWORD PTR [rip+0xfffffffffffdcbc1]        # 213098 <scene_saver+0x58>
  2364d7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2364db:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
  2364df:	48 8b 15 ba cb fd ff 	mov    rdx,QWORD PTR [rip+0xfffffffffffdcbba]        # 2130a0 <scene_saver+0x60>
  2364e6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2364ea:	48 89 50 60          	mov    QWORD PTR [rax+0x60],rdx
  2364ee:	48 8b 15 cb cb fd ff 	mov    rdx,QWORD PTR [rip+0xfffffffffffdcbcb]        # 2130c0 <scene_saver+0x80>
  2364f5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2364f9:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
  236500:	48 8b 15 c1 cb fd ff 	mov    rdx,QWORD PTR [rip+0xfffffffffffdcbc1]        # 2130c8 <scene_saver+0x88>
  236507:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23650b:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
  236512:	48 8b 15 6f cb fd ff 	mov    rdx,QWORD PTR [rip+0xfffffffffffdcb6f]        # 213088 <scene_saver+0x48>
  236519:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23651d:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
  236521:	48 8b 15 88 cb fd ff 	mov    rdx,QWORD PTR [rip+0xfffffffffffdcb88]        # 2130b0 <scene_saver+0x70>
  236528:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23652c:	48 89 50 70          	mov    QWORD PTR [rax+0x70],rdx
  236530:	48 8b 15 81 cb fd ff 	mov    rdx,QWORD PTR [rip+0xfffffffffffdcb81]        # 2130b8 <scene_saver+0x78>
  236537:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23653b:	48 89 50 78          	mov    QWORD PTR [rax+0x78],rdx
  23653f:	90                   	nop
  236540:	5d                   	pop    rbp
  236541:	c3                   	ret    

0000000000236542 <palloc>:
  236542:	f3 0f 1e fa          	endbr64 
  236546:	55                   	push   rbp
  236547:	48 89 e5             	mov    rbp,rsp
  23654a:	48 83 ec 60          	sub    rsp,0x60
  23654e:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  236551:	89 75 a8             	mov    DWORD PTR [rbp-0x58],esi
  236554:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  236557:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  23655d:	85 c0                	test   eax,eax
  23655f:	0f 48 c2             	cmovs  eax,edx
  236562:	c1 f8 0c             	sar    eax,0xc
  236565:	89 c1                	mov    ecx,eax
  236567:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  23656a:	99                   	cdq    
  23656b:	c1 ea 14             	shr    edx,0x14
  23656e:	01 d0                	add    eax,edx
  236570:	25 ff 0f 00 00       	and    eax,0xfff
  236575:	29 d0                	sub    eax,edx
  236577:	01 c8                	add    eax,ecx
  236579:	85 c0                	test   eax,eax
  23657b:	0f 95 c0             	setne  al
  23657e:	0f b6 c0             	movzx  eax,al
  236581:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  236584:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  23658b:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  236592:	00 
  236593:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  236596:	48 98                	cdqe   
  236598:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  23659f:	48 05 00 97 20 00    	add    rax,0x209700
  2365a5:	48 8b 40 14          	mov    rax,QWORD PTR [rax+0x14]
  2365a9:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  2365ad:	48 83 45 e8 04       	add    QWORD PTR [rbp-0x18],0x4
  2365b2:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x1
  2365b9:	e9 39 02 00 00       	jmp    2367f7 <palloc+0x2b5>
  2365be:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  2365c2:	8b 00                	mov    eax,DWORD PTR [rax]
  2365c4:	89 c0                	mov    eax,eax
  2365c6:	25 00 f0 ff ff       	and    eax,0xfffff000
  2365cb:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  2365cf:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
  2365d6:	e9 06 02 00 00       	jmp    2367e1 <palloc+0x29f>
  2365db:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  2365df:	8b 00                	mov    eax,DWORD PTR [rax]
  2365e1:	83 e0 01             	and    eax,0x1
  2365e4:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
  2365e7:	83 7d d0 00          	cmp    DWORD PTR [rbp-0x30],0x0
  2365eb:	0f 85 e7 01 00 00    	jne    2367d8 <palloc+0x296>
  2365f1:	b8 00 00 00 00       	mov    eax,0x0
  2365f6:	e8 d0 d2 ff ff       	call   2338cb <req_a_page>
  2365fb:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
  2365fe:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  236602:	0f 85 b9 00 00 00    	jne    2366c1 <palloc+0x17f>
  236608:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  23660b:	48 98                	cdqe   
  23660d:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  236614:	48 05 84 95 20 00    	add    rax,0x209584
  23661a:	0f b7 00             	movzx  eax,WORD PTR [rax]
  23661d:	0f b7 c0             	movzx  eax,ax
  236620:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
  236623:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  236626:	48 98                	cdqe   
  236628:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  23662f:	48 05 80 95 20 00    	add    rax,0x209580
  236635:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  236639:	0f b7 c0             	movzx  eax,ax
  23663c:	c1 e0 10             	shl    eax,0x10
  23663f:	25 00 00 0f 00       	and    eax,0xf0000
  236644:	01 45 b8             	add    DWORD PTR [rbp-0x48],eax
  236647:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  23664a:	01 45 b8             	add    DWORD PTR [rbp-0x48],eax
  23664d:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  236650:	89 c2                	mov    edx,eax
  236652:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  236655:	48 98                	cdqe   
  236657:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  23665e:	48 05 84 95 20 00    	add    rax,0x209584
  236664:	66 89 10             	mov    WORD PTR [rax],dx
  236667:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  23666a:	48 98                	cdqe   
  23666c:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  236673:	48 05 80 95 20 00    	add    rax,0x209580
  236679:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  23667d:	0f b7 c0             	movzx  eax,ax
  236680:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
  236683:	81 65 b4 f0 ff 00 00 	and    DWORD PTR [rbp-0x4c],0xfff0
  23668a:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  23668d:	c1 e8 10             	shr    eax,0x10
  236690:	83 e0 0f             	and    eax,0xf
  236693:	89 c2                	mov    edx,eax
  236695:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  236698:	01 d0                	add    eax,edx
  23669a:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
  23669d:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  2366a0:	89 c2                	mov    edx,eax
  2366a2:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  2366a5:	48 98                	cdqe   
  2366a7:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  2366ae:	48 05 80 95 20 00    	add    rax,0x209580
  2366b4:	66 89 50 09          	mov    WORD PTR [rax+0x9],dx
  2366b8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  2366bc:	e9 48 01 00 00       	jmp    236809 <palloc+0x2c7>
  2366c1:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  2366c4:	89 c7                	mov    edi,eax
  2366c6:	e8 6b d3 ff ff       	call   233a36 <get_phyaddr>
  2366cb:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
  2366ce:	8b 4d c8             	mov    ecx,DWORD PTR [rbp-0x38]
  2366d1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  2366d5:	ba 07 00 00 00       	mov    edx,0x7
  2366da:	89 ce                	mov    esi,ecx
  2366dc:	48 89 c7             	mov    rdi,rax
  2366df:	e8 65 d3 ff ff       	call   233a49 <set_page_item>
  2366e4:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  2366e7:	c1 e0 0a             	shl    eax,0xa
  2366ea:	89 c2                	mov    edx,eax
  2366ec:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  2366ef:	01 d0                	add    eax,edx
  2366f1:	c1 e0 0c             	shl    eax,0xc
  2366f4:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
  2366f7:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  2366fc:	75 12                	jne    236710 <palloc+0x1ce>
  2366fe:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  236701:	48 98                	cdqe   
  236703:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  236707:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  23670a:	89 05 08 ca fd ff    	mov    DWORD PTR [rip+0xfffffffffffdca08],eax        # 213118 <palloc_paddr>
  236710:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  236714:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  236718:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  23671c:	0f 85 b6 00 00 00    	jne    2367d8 <palloc+0x296>
  236722:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  236725:	48 98                	cdqe   
  236727:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  23672e:	48 05 84 95 20 00    	add    rax,0x209584
  236734:	0f b7 00             	movzx  eax,WORD PTR [rax]
  236737:	0f b7 c0             	movzx  eax,ax
  23673a:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
  23673d:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  236740:	48 98                	cdqe   
  236742:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  236749:	48 05 80 95 20 00    	add    rax,0x209580
  23674f:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  236753:	0f b7 c0             	movzx  eax,ax
  236756:	c1 e0 10             	shl    eax,0x10
  236759:	25 00 00 0f 00       	and    eax,0xf0000
  23675e:	01 45 c0             	add    DWORD PTR [rbp-0x40],eax
  236761:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  236764:	01 45 c0             	add    DWORD PTR [rbp-0x40],eax
  236767:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  23676a:	89 c2                	mov    edx,eax
  23676c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  23676f:	48 98                	cdqe   
  236771:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  236778:	48 05 84 95 20 00    	add    rax,0x209584
  23677e:	66 89 10             	mov    WORD PTR [rax],dx
  236781:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  236784:	48 98                	cdqe   
  236786:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  23678d:	48 05 80 95 20 00    	add    rax,0x209580
  236793:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  236797:	0f b7 c0             	movzx  eax,ax
  23679a:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
  23679d:	81 65 bc f0 ff 00 00 	and    DWORD PTR [rbp-0x44],0xfff0
  2367a4:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  2367a7:	c1 e8 10             	shr    eax,0x10
  2367aa:	83 e0 0f             	and    eax,0xf
  2367ad:	89 c2                	mov    edx,eax
  2367af:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  2367b2:	01 d0                	add    eax,edx
  2367b4:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
  2367b7:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  2367ba:	89 c2                	mov    edx,eax
  2367bc:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  2367bf:	48 98                	cdqe   
  2367c1:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  2367c8:	48 05 80 95 20 00    	add    rax,0x209580
  2367ce:	66 89 50 09          	mov    WORD PTR [rax+0x9],dx
  2367d2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  2367d6:	eb 31                	jmp    236809 <palloc+0x2c7>
  2367d8:	48 83 45 d8 04       	add    QWORD PTR [rbp-0x28],0x4
  2367dd:	83 45 d4 01          	add    DWORD PTR [rbp-0x2c],0x1
  2367e1:	81 7d d4 ff 03 00 00 	cmp    DWORD PTR [rbp-0x2c],0x3ff
  2367e8:	0f 8e ed fd ff ff    	jle    2365db <palloc+0x99>
  2367ee:	48 83 45 e8 04       	add    QWORD PTR [rbp-0x18],0x4
  2367f3:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
  2367f7:	81 7d e4 ff 03 00 00 	cmp    DWORD PTR [rbp-0x1c],0x3ff
  2367fe:	0f 8e ba fd ff ff    	jle    2365be <palloc+0x7c>
  236804:	b8 00 00 00 00       	mov    eax,0x0
  236809:	c9                   	leave  
  23680a:	c3                   	ret    

000000000023680b <malloc>:
  23680b:	f3 0f 1e fa          	endbr64 
  23680f:	55                   	push   rbp
  236810:	48 89 e5             	mov    rbp,rsp
  236813:	48 83 ec 10          	sub    rsp,0x10
  236817:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  23681a:	8b 05 f0 c8 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdc8f0]        # 213110 <cur_proc>
  236820:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  236823:	89 d6                	mov    esi,edx
  236825:	89 c7                	mov    edi,eax
  236827:	e8 16 fd ff ff       	call   236542 <palloc>
  23682c:	c9                   	leave  
  23682d:	c3                   	ret    

000000000023682e <proc_end>:
  23682e:	f3 0f 1e fa          	endbr64 
  236832:	55                   	push   rbp
  236833:	48 89 e5             	mov    rbp,rsp
  236836:	48 83 ec 10          	sub    rsp,0x10
  23683a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  23683d:	48 8b 05 08 2f fd ff 	mov    rax,QWORD PTR [rip+0xfffffffffffd2f08]        # 20974c <task+0x20c>
  236844:	48 89 c4             	mov    rsp,rax
  236847:	8b 05 c3 c8 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdc8c3]        # 213110 <cur_proc>
  23684d:	89 c7                	mov    edi,eax
  23684f:	e8 75 00 00 00       	call   2368c9 <del_proc>
  236854:	8b 05 b6 c8 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdc8b6]        # 213110 <cur_proc>
  23685a:	48 98                	cdqe   
  23685c:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  236863:	48 05 a0 95 20 00    	add    rax,0x2095a0
  236869:	8b 00                	mov    eax,DWORD PTR [rax]
  23686b:	83 f8 ff             	cmp    eax,0xffffffff
  23686e:	74 4c                	je     2368bc <proc_end+0x8e>
  236870:	8b 05 9a c8 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdc89a]        # 213110 <cur_proc>
  236876:	48 98                	cdqe   
  236878:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  23687f:	48 05 a0 95 20 00    	add    rax,0x2095a0
  236885:	8b 00                	mov    eax,DWORD PTR [rax]
  236887:	89 c0                	mov    eax,eax
  236889:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  236890:	48 05 44 95 20 00    	add    rax,0x209544
  236896:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
  23689c:	8b 05 6e c8 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdc86e]        # 213110 <cur_proc>
  2368a2:	48 98                	cdqe   
  2368a4:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  2368ab:	48 05 a0 95 20 00    	add    rax,0x2095a0
  2368b1:	8b 00                	mov    eax,DWORD PTR [rax]
  2368b3:	89 c7                	mov    edi,eax
  2368b5:	e8 d0 fa ff ff       	call   23638a <switch_proc_tss>
  2368ba:	eb 0a                	jmp    2368c6 <proc_end+0x98>
  2368bc:	bf 00 00 00 00       	mov    edi,0x0
  2368c1:	e8 c4 fa ff ff       	call   23638a <switch_proc_tss>
  2368c6:	90                   	nop
  2368c7:	c9                   	leave  
  2368c8:	c3                   	ret    

00000000002368c9 <del_proc>:
  2368c9:	f3 0f 1e fa          	endbr64 
  2368cd:	55                   	push   rbp
  2368ce:	48 89 e5             	mov    rbp,rsp
  2368d1:	48 83 ec 30          	sub    rsp,0x30
  2368d5:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  2368d8:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  2368db:	48 98                	cdqe   
  2368dd:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  2368e4:	48 05 44 95 20 00    	add    rax,0x209544
  2368ea:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
  2368f0:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  2368f3:	48 98                	cdqe   
  2368f5:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  2368fc:	48 05 40 95 20 00    	add    rax,0x209540
  236902:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
  236908:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  23690b:	48 98                	cdqe   
  23690d:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  236914:	48 05 00 97 20 00    	add    rax,0x209700
  23691a:	48 8b 40 14          	mov    rax,QWORD PTR [rax+0x14]
  23691e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  236922:	48 83 45 f8 04       	add    QWORD PTR [rbp-0x8],0x4
  236927:	eb 63                	jmp    23698c <del_proc+0xc3>
  236929:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23692d:	8b 00                	mov    eax,DWORD PTR [rax]
  23692f:	89 c0                	mov    eax,eax
  236931:	25 00 f0 ff ff       	and    eax,0xfffff000
  236936:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  23693a:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  236941:	eb 30                	jmp    236973 <del_proc+0xaa>
  236943:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  236947:	8b 00                	mov    eax,DWORD PTR [rax]
  236949:	83 e0 01             	and    eax,0x1
  23694c:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  23694f:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  236953:	74 15                	je     23696a <del_proc+0xa1>
  236955:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  236959:	8b 00                	mov    eax,DWORD PTR [rax]
  23695b:	89 c0                	mov    eax,eax
  23695d:	25 00 f0 ff ff       	and    eax,0xfffff000
  236962:	48 89 c7             	mov    rdi,rax
  236965:	e8 0b d0 ff ff       	call   233975 <free_page>
  23696a:	48 83 45 f0 04       	add    QWORD PTR [rbp-0x10],0x4
  23696f:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  236973:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  23697a:	7e c7                	jle    236943 <del_proc+0x7a>
  23697c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  236980:	89 c7                	mov    edi,eax
  236982:	e8 70 cd ff ff       	call   2336f7 <vmfree>
  236987:	48 83 45 f8 04       	add    QWORD PTR [rbp-0x8],0x4
  23698c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236990:	8b 00                	mov    eax,DWORD PTR [rax]
  236992:	83 e0 01             	and    eax,0x1
  236995:	85 c0                	test   eax,eax
  236997:	75 90                	jne    236929 <del_proc+0x60>
  236999:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23699d:	89 c7                	mov    edi,eax
  23699f:	e8 53 cd ff ff       	call   2336f7 <vmfree>
  2369a4:	90                   	nop
  2369a5:	c9                   	leave  
  2369a6:	c3                   	ret    

00000000002369a7 <set_proc_stat>:
  2369a7:	f3 0f 1e fa          	endbr64 
  2369ab:	55                   	push   rbp
  2369ac:	48 89 e5             	mov    rbp,rsp
  2369af:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  2369b2:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  2369b5:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  2369b9:	75 07                	jne    2369c2 <set_proc_stat+0x1b>
  2369bb:	b8 ff ff ff ff       	mov    eax,0xffffffff
  2369c0:	eb 79                	jmp    236a3b <set_proc_stat+0x94>
  2369c2:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  2369c9:	eb 04                	jmp    2369cf <set_proc_stat+0x28>
  2369cb:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  2369cf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2369d2:	48 98                	cdqe   
  2369d4:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  2369db:	48 05 40 95 20 00    	add    rax,0x209540
  2369e1:	8b 10                	mov    edx,DWORD PTR [rax]
  2369e3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  2369e6:	39 c2                	cmp    edx,eax
  2369e8:	75 e1                	jne    2369cb <set_proc_stat+0x24>
  2369ea:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  2369ee:	75 07                	jne    2369f7 <set_proc_stat+0x50>
  2369f0:	b8 ff ff ff ff       	mov    eax,0xffffffff
  2369f5:	eb 44                	jmp    236a3b <set_proc_stat+0x94>
  2369f7:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  2369fa:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  2369fd:	48 63 d2             	movsxd rdx,edx
  236a00:	48 69 d2 6c 02 00 00 	imul   rdx,rdx,0x26c
  236a07:	48 81 c2 44 95 20 00 	add    rdx,0x209544
  236a0e:	89 02                	mov    DWORD PTR [rdx],eax
  236a10:	8b 05 fa c6 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdc6fa]        # 213110 <cur_proc>
  236a16:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  236a19:	75 1b                	jne    236a36 <set_proc_stat+0x8f>
  236a1b:	8b 05 ef c6 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdc6ef]        # 213110 <cur_proc>
  236a21:	48 98                	cdqe   
  236a23:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  236a2a:	48 05 48 95 20 00    	add    rax,0x209548
  236a30:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
  236a36:	b8 00 00 00 00       	mov    eax,0x0
  236a3b:	5d                   	pop    rbp
  236a3c:	c3                   	ret    

0000000000236a3d <add_proc_openf>:
  236a3d:	f3 0f 1e fa          	endbr64 
  236a41:	55                   	push   rbp
  236a42:	48 89 e5             	mov    rbp,rsp
  236a45:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  236a49:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  236a50:	eb 69                	jmp    236abb <add_proc_openf+0x7e>
  236a52:	8b 05 b8 c6 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdc6b8]        # 213110 <cur_proc>
  236a58:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  236a5b:	48 63 d2             	movsxd rdx,edx
  236a5e:	48 83 c2 12          	add    rdx,0x12
  236a62:	48 98                	cdqe   
  236a64:	48 c1 e2 03          	shl    rdx,0x3
  236a68:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  236a6f:	48 01 d0             	add    rax,rdx
  236a72:	48 05 40 95 20 00    	add    rax,0x209540
  236a78:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  236a7c:	48 85 c0             	test   rax,rax
  236a7f:	75 36                	jne    236ab7 <add_proc_openf+0x7a>
  236a81:	8b 05 89 c6 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdc689]        # 213110 <cur_proc>
  236a87:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  236a8a:	48 63 d2             	movsxd rdx,edx
  236a8d:	48 83 c2 12          	add    rdx,0x12
  236a91:	48 98                	cdqe   
  236a93:	48 c1 e2 03          	shl    rdx,0x3
  236a97:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  236a9e:	48 01 d0             	add    rax,rdx
  236aa1:	48 8d 90 40 95 20 00 	lea    rdx,[rax+0x209540]
  236aa8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  236aac:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
  236ab0:	b8 00 00 00 00       	mov    eax,0x0
  236ab5:	eb 0f                	jmp    236ac6 <add_proc_openf+0x89>
  236ab7:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  236abb:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  236abf:	7e 91                	jle    236a52 <add_proc_openf+0x15>
  236ac1:	b8 ff ff ff ff       	mov    eax,0xffffffff
  236ac6:	5d                   	pop    rbp
  236ac7:	c3                   	ret    

0000000000236ac8 <sys_exit>:
  236ac8:	f3 0f 1e fa          	endbr64 
  236acc:	55                   	push   rbp
  236acd:	48 89 e5             	mov    rbp,rsp
  236ad0:	48 83 ec 10          	sub    rsp,0x10
  236ad4:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  236ad7:	8b 05 33 c6 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdc633]        # 213110 <cur_proc>
  236add:	89 c7                	mov    edi,eax
  236adf:	e8 e5 fd ff ff       	call   2368c9 <del_proc>
  236ae4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  236ae7:	c9                   	leave  
  236ae8:	c3                   	ret    

0000000000236ae9 <reg_proc>:
  236ae9:	f3 0f 1e fa          	endbr64 
  236aed:	55                   	push   rbp
  236aee:	48 89 e5             	mov    rbp,rsp
  236af1:	48 83 ec 40          	sub    rsp,0x40
  236af5:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  236af8:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  236afc:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  236b00:	b8 00 00 00 00       	mov    eax,0x0
  236b05:	e8 05 f4 ff ff       	call   235f0f <req_proc>
  236b0a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  236b0d:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  236b11:	75 0a                	jne    236b1d <reg_proc+0x34>
  236b13:	b8 ff ff ff ff       	mov    eax,0xffffffff
  236b18:	e9 86 01 00 00       	jmp    236ca3 <reg_proc+0x1ba>
  236b1d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  236b20:	50                   	push   rax
  236b21:	6a 00                	push   0x0
  236b23:	6a 00                	push   0x0
  236b25:	6a 00                	push   0x0
  236b27:	6a 00                	push   0x0
  236b29:	68 fc ff bf 01       	push   0x1bffffc
  236b2e:	6a 10                	push   0x10
  236b30:	6a 10                	push   0x10
  236b32:	6a 10                	push   0x10
  236b34:	6a 10                	push   0x10
  236b36:	41 b9 08 00 00 00    	mov    r9d,0x8
  236b3c:	41 b8 10 00 00 00    	mov    r8d,0x10
  236b42:	b9 00 00 00 00       	mov    ecx,0x0
  236b47:	ba 00 00 00 00       	mov    edx,0x0
  236b4c:	be 00 00 00 00       	mov    esi,0x0
  236b51:	bf 00 00 00 00       	mov    edi,0x0
  236b56:	e8 80 f4 ff ff       	call   235fdb <set_proc>
  236b5b:	48 83 c4 50          	add    rsp,0x50
  236b5f:	b8 00 00 00 00       	mov    eax,0x0
  236b64:	e8 01 cb ff ff       	call   23366a <vmalloc>
  236b69:	48 98                	cdqe   
  236b6b:	48 89 c2             	mov    rdx,rax
  236b6e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  236b71:	48 98                	cdqe   
  236b73:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  236b7a:	48 05 c0 95 20 00    	add    rax,0x2095c0
  236b80:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx
  236b84:	b8 00 00 00 00       	mov    eax,0x0
  236b89:	e8 dc ca ff ff       	call   23366a <vmalloc>
  236b8e:	48 98                	cdqe   
  236b90:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  236b94:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  236b97:	48 98                	cdqe   
  236b99:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  236ba0:	48 05 c0 95 20 00    	add    rax,0x2095c0
  236ba6:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  236baa:	c7 00 07 10 10 00    	mov    DWORD PTR [rax],0x101007
  236bb0:	b8 00 00 00 00       	mov    eax,0x0
  236bb5:	e8 b0 ca ff ff       	call   23366a <vmalloc>
  236bba:	48 98                	cdqe   
  236bbc:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  236bc0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  236bc4:	83 c8 07             	or     eax,0x7
  236bc7:	89 c2                	mov    edx,eax
  236bc9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  236bcc:	48 98                	cdqe   
  236bce:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  236bd5:	48 05 c0 95 20 00    	add    rax,0x2095c0
  236bdb:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  236bdf:	48 83 c0 18          	add    rax,0x18
  236be3:	89 10                	mov    DWORD PTR [rax],edx
  236be5:	b8 00 00 00 00       	mov    eax,0x0
  236bea:	e8 dc cc ff ff       	call   2338cb <req_a_page>
  236bef:	89 c7                	mov    edi,eax
  236bf1:	e8 40 ce ff ff       	call   233a36 <get_phyaddr>
  236bf6:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  236bfa:	48 81 c2 fc 0f 00 00 	add    rdx,0xffc
  236c01:	83 c8 07             	or     eax,0x7
  236c04:	89 02                	mov    DWORD PTR [rdx],eax
  236c06:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  236c09:	48 98                	cdqe   
  236c0b:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  236c12:	48 05 c0 95 20 00    	add    rax,0x2095c0
  236c18:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  236c1c:	48 89 c2             	mov    rdx,rax
  236c1f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  236c22:	48 98                	cdqe   
  236c24:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  236c2b:	48 05 00 97 20 00    	add    rax,0x209700
  236c31:	48 89 50 14          	mov    QWORD PTR [rax+0x14],rdx
  236c35:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  236c38:	48 98                	cdqe   
  236c3a:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  236c41:	48 05 44 95 20 00    	add    rax,0x209544
  236c47:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
  236c4d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  236c50:	48 98                	cdqe   
  236c52:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  236c59:	48 8d 90 c0 95 20 00 	lea    rdx,[rax+0x2095c0]
  236c60:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  236c64:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
  236c68:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  236c6b:	48 98                	cdqe   
  236c6d:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  236c74:	48 8d 90 d0 95 20 00 	lea    rdx,[rax+0x2095d0]
  236c7b:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  236c7f:	48 89 42 04          	mov    QWORD PTR [rdx+0x4],rax
  236c83:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  236c86:	48 98                	cdqe   
  236c88:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  236c8b:	48 63 d2             	movsxd rdx,edx
  236c8e:	48 69 d2 6c 02 00 00 	imul   rdx,rdx,0x26c
  236c95:	48 81 c2 10 97 20 00 	add    rdx,0x209710
  236c9c:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
  236ca0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  236ca3:	c9                   	leave  
  236ca4:	c3                   	ret    

0000000000236ca5 <sys_malloc>:
  236ca5:	f3 0f 1e fa          	endbr64 
  236ca9:	55                   	push   rbp
  236caa:	48 89 e5             	mov    rbp,rsp
  236cad:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
  236cb0:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  236cb3:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  236cb9:	85 c0                	test   eax,eax
  236cbb:	0f 48 c2             	cmovs  eax,edx
  236cbe:	c1 f8 0c             	sar    eax,0xc
  236cc1:	89 c1                	mov    ecx,eax
  236cc3:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  236cc6:	99                   	cdq    
  236cc7:	c1 ea 14             	shr    edx,0x14
  236cca:	01 d0                	add    eax,edx
  236ccc:	25 ff 0f 00 00       	and    eax,0xfff
  236cd1:	29 d0                	sub    eax,edx
  236cd3:	01 c8                	add    eax,ecx
  236cd5:	85 c0                	test   eax,eax
  236cd7:	0f 95 c0             	setne  al
  236cda:	0f b6 c0             	movzx  eax,al
  236cdd:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  236ce0:	8b 05 2a c4 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdc42a]        # 213110 <cur_proc>
  236ce6:	48 98                	cdqe   
  236ce8:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  236cef:	48 05 54 95 20 00    	add    rax,0x209554
  236cf5:	8b 00                	mov    eax,DWORD PTR [rax]
  236cf7:	48 98                	cdqe   
  236cf9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  236cfd:	eb 0c                	jmp    236d0b <sys_malloc+0x66>
  236cff:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236d03:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  236d07:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  236d0b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236d0f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  236d13:	48 85 c0             	test   rax,rax
  236d16:	74 16                	je     236d2e <sys_malloc+0x89>
  236d18:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236d1c:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  236d1f:	85 c0                	test   eax,eax
  236d21:	75 0b                	jne    236d2e <sys_malloc+0x89>
  236d23:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236d27:	8b 00                	mov    eax,DWORD PTR [rax]
  236d29:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  236d2c:	7e d1                	jle    236cff <sys_malloc+0x5a>
  236d2e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236d32:	8b 00                	mov    eax,DWORD PTR [rax]
  236d34:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  236d37:	7e 7f                	jle    236db8 <sys_malloc+0x113>
  236d39:	8b 05 d1 c3 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdc3d1]        # 213110 <cur_proc>
  236d3f:	48 98                	cdqe   
  236d41:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  236d48:	48 05 58 95 20 00    	add    rax,0x209558
  236d4e:	8b 10                	mov    edx,DWORD PTR [rax]
  236d50:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  236d53:	c1 e0 0c             	shl    eax,0xc
  236d56:	01 d0                	add    eax,edx
  236d58:	3d ff ff ef 01       	cmp    eax,0x1efffff
  236d5d:	7e 0a                	jle    236d69 <sys_malloc+0xc4>
  236d5f:	b8 00 00 00 00       	mov    eax,0x0
  236d64:	e9 c8 00 00 00       	jmp    236e31 <sys_malloc+0x18c>
  236d69:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236d6d:	8b 10                	mov    edx,DWORD PTR [rax]
  236d6f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  236d72:	29 d0                	sub    eax,edx
  236d74:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
  236d77:	8b 05 93 c3 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdc393]        # 213110 <cur_proc>
  236d7d:	48 98                	cdqe   
  236d7f:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  236d86:	48 05 58 95 20 00    	add    rax,0x209558
  236d8c:	8b 00                	mov    eax,DWORD PTR [rax]
  236d8e:	48 98                	cdqe   
  236d90:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  236d94:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  236d9b:	eb 13                	jmp    236db0 <sys_malloc+0x10b>
  236d9d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  236da1:	c6 00 00             	mov    BYTE PTR [rax],0x0
  236da4:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  236dab:	00 
  236dac:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  236db0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  236db3:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  236db6:	7c e5                	jl     236d9d <sys_malloc+0xf8>
  236db8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236dbc:	8b 00                	mov    eax,DWORD PTR [rax]
  236dbe:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  236dc1:	7d 59                	jge    236e1c <sys_malloc+0x177>
  236dc3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236dc7:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
  236dcb:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  236dce:	83 c0 01             	add    eax,0x1
  236dd1:	c1 e0 0c             	shl    eax,0xc
  236dd4:	48 98                	cdqe   
  236dd6:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
  236dda:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  236dde:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  236de2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236de6:	8b 00                	mov    eax,DWORD PTR [rax]
  236de8:	2b 45 e8             	sub    eax,DWORD PTR [rbp-0x18]
  236deb:	8d 50 ff             	lea    edx,[rax-0x1]
  236dee:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  236df2:	89 10                	mov    DWORD PTR [rax],edx
  236df4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236df8:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  236dfc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  236e00:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
  236e04:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  236e08:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  236e0c:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
  236e10:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236e14:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  236e18:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
  236e1c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236e20:	c7 40 04 01 00 00 00 	mov    DWORD PTR [rax+0x4],0x1
  236e27:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236e2b:	48 05 00 10 00 00    	add    rax,0x1000
  236e31:	5d                   	pop    rbp
  236e32:	c3                   	ret    

0000000000236e33 <sys_free>:
  236e33:	f3 0f 1e fa          	endbr64 
  236e37:	55                   	push   rbp
  236e38:	48 89 e5             	mov    rbp,rsp
  236e3b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  236e3e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  236e41:	2d 00 10 00 00       	sub    eax,0x1000
  236e46:	48 98                	cdqe   
  236e48:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  236e4c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  236e50:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
  236e57:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  236e5b:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  236e5f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  236e63:	eb 2e                	jmp    236e93 <sys_free+0x60>
  236e65:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236e69:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  236e6c:	85 c0                	test   eax,eax
  236e6e:	75 2c                	jne    236e9c <sys_free+0x69>
  236e70:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  236e74:	8b 10                	mov    edx,DWORD PTR [rax]
  236e76:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236e7a:	8b 00                	mov    eax,DWORD PTR [rax]
  236e7c:	83 c0 01             	add    eax,0x1
  236e7f:	01 c2                	add    edx,eax
  236e81:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  236e85:	89 10                	mov    DWORD PTR [rax],edx
  236e87:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236e8b:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  236e8f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  236e93:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  236e98:	75 cb                	jne    236e65 <sys_free+0x32>
  236e9a:	eb 01                	jmp    236e9d <sys_free+0x6a>
  236e9c:	90                   	nop
  236e9d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  236ea1:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  236ea5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  236ea9:	eb 2e                	jmp    236ed9 <sys_free+0xa6>
  236eab:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236eaf:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  236eb2:	85 c0                	test   eax,eax
  236eb4:	75 2c                	jne    236ee2 <sys_free+0xaf>
  236eb6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236eba:	8b 10                	mov    edx,DWORD PTR [rax]
  236ebc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  236ec0:	8b 00                	mov    eax,DWORD PTR [rax]
  236ec2:	83 c0 01             	add    eax,0x1
  236ec5:	01 c2                	add    edx,eax
  236ec7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236ecb:	89 10                	mov    DWORD PTR [rax],edx
  236ecd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  236ed1:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  236ed5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  236ed9:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  236ede:	75 cb                	jne    236eab <sys_free+0x78>
  236ee0:	eb 01                	jmp    236ee3 <sys_free+0xb0>
  236ee2:	90                   	nop
  236ee3:	b8 00 00 00 00       	mov    eax,0x0
  236ee8:	5d                   	pop    rbp
  236ee9:	c3                   	ret    
  236eea:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000236ef0 <outb>:
  236ef0:	66 8b 54 24 04       	mov    dx,WORD PTR [rsp+0x4]
  236ef5:	8a 44 24 08          	mov    al,BYTE PTR [rsp+0x8]
  236ef9:	ee                   	out    dx,al
  236efa:	e8 31 00 00 00       	call   236f30 <io_delay>
  236eff:	c3                   	ret    

0000000000236f00 <outw>:
  236f00:	66 8b 54 24 04       	mov    dx,WORD PTR [rsp+0x4]
  236f05:	66 8b 44 24 08       	mov    ax,WORD PTR [rsp+0x8]
  236f0a:	66 ef                	out    dx,ax
  236f0c:	90                   	nop
  236f0d:	90                   	nop
  236f0e:	90                   	nop
  236f0f:	c3                   	ret    

0000000000236f10 <inb>:
  236f10:	31 c0                	xor    eax,eax
  236f12:	66 8b 54 24 04       	mov    dx,WORD PTR [rsp+0x4]
  236f17:	ec                   	in     al,dx
  236f18:	90                   	nop
  236f19:	90                   	nop
  236f1a:	90                   	nop
  236f1b:	c3                   	ret    

0000000000236f1c <inw>:
  236f1c:	31 c0                	xor    eax,eax
  236f1e:	66 8b 54 24 04       	mov    dx,WORD PTR [rsp+0x4]
  236f23:	66 ed                	in     ax,dx
  236f25:	90                   	nop
  236f26:	90                   	nop
  236f27:	90                   	nop
  236f28:	c3                   	ret    

0000000000236f29 <eoi>:
  236f29:	b0 20                	mov    al,0x20
  236f2b:	e6 a0                	out    0xa0,al
  236f2d:	e6 20                	out    0x20,al
  236f2f:	c3                   	ret    

0000000000236f30 <io_delay>:
  236f30:	90                   	nop
  236f31:	90                   	nop
  236f32:	90                   	nop
  236f33:	90                   	nop
  236f34:	c3                   	ret    

0000000000236f35 <turn_on_int>:
  236f35:	b0 f8                	mov    al,0xf8
  236f37:	e6 21                	out    0x21,al
  236f39:	e8 f2 ff ff ff       	call   236f30 <io_delay>
  236f3e:	b0 af                	mov    al,0xaf
  236f40:	e6 a1                	out    0xa1,al
  236f42:	e8 e9 ff ff ff       	call   236f30 <io_delay>
  236f47:	0f 01 1d f0 6e 23 00 	lidt   [rip+0x236ef0]        # 46de3e <dev_stdout+0x2313de>
  236f4e:	90                   	nop
  236f4f:	90                   	nop
  236f50:	90                   	nop
  236f51:	90                   	nop
  236f52:	fb                   	sti    
  236f53:	c3                   	ret    

0000000000236f54 <report_back_trace_of_err>:
  236f54:	8b 44 24 04          	mov    eax,DWORD PTR [rsp+0x4]
  236f58:	50                   	push   rax
  236f59:	68 f0 6e 23 00       	push   0x236ef0
  236f5e:	83 c4 08             	add    esp,0x8
  236f61:	c3                   	ret    

0000000000236f62 <bt_msg>:
  236f62:	65 72 72             	gs jb  236fd7 <fill_desc+0x16>
  236f65:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  236f66:	72 20                	jb     236f88 <init_gdt+0xb>
  236f68:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  236f69:	63 63 75             	movsxd esp,DWORD PTR [rbx+0x75]
  236f6c:	72 73                	jb     236fe1 <fill_desc+0x20>
  236f6e:	20 61 74             	and    BYTE PTR [rcx+0x74],ah
  236f71:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR [rip+0x6e5c78]        # 91cbef <dev_stdout+0x6e018f>

0000000000236f77 <idtptr>:
  236f77:	f8                   	clc    
  236f78:	07                   	(bad)  
  236f79:	00 00                	add    BYTE PTR [rax],al
	...

0000000000236f7d <init_gdt>:
  236f7d:	f3 0f 1e fa          	endbr64 
  236f81:	55                   	push   rbp
  236f82:	48 89 e5             	mov    rbp,rsp
  236f85:	b9 01 00 00 00       	mov    ecx,0x1
  236f8a:	ba 9e cf 00 00       	mov    edx,0xcf9e
  236f8f:	be ff ff ff ff       	mov    esi,0xffffffff
  236f94:	bf 00 00 00 00       	mov    edi,0x0
  236f99:	e8 23 00 00 00       	call   236fc1 <fill_desc>
  236f9e:	b9 02 00 00 00       	mov    ecx,0x2
  236fa3:	ba 92 cf 00 00       	mov    edx,0xcf92
  236fa8:	be ff ff ff ff       	mov    esi,0xffffffff
  236fad:	bf 00 00 00 00       	mov    edi,0x0
  236fb2:	e8 0a 00 00 00       	call   236fc1 <fill_desc>
  236fb7:	0f 01 15 6a a0 fc ff 	lgdt   [rip+0xfffffffffffca06a]        # 201028 <gdtptr>
  236fbe:	90                   	nop
  236fbf:	5d                   	pop    rbp
  236fc0:	c3                   	ret    

0000000000236fc1 <fill_desc>:
  236fc1:	f3 0f 1e fa          	endbr64 
  236fc5:	55                   	push   rbp
  236fc6:	48 89 e5             	mov    rbp,rsp
  236fc9:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  236fcc:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  236fcf:	89 d0                	mov    eax,edx
  236fd1:	89 4d f0             	mov    DWORD PTR [rbp-0x10],ecx
  236fd4:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
  236fd8:	48 8b 15 41 4c 00 00 	mov    rdx,QWORD PTR [rip+0x4c41]        # 23bc20 <gdt>
  236fdf:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  236fe2:	48 c1 e0 03          	shl    rax,0x3
  236fe6:	48 01 d0             	add    rax,rdx
  236fe9:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  236fec:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
  236ff0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  236ff3:	c1 e8 10             	shr    eax,0x10
  236ff6:	89 c1                	mov    ecx,eax
  236ff8:	48 8b 15 21 4c 00 00 	mov    rdx,QWORD PTR [rip+0x4c21]        # 23bc20 <gdt>
  236fff:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  237002:	48 c1 e0 03          	shl    rax,0x3
  237006:	48 01 d0             	add    rax,rdx
  237009:	89 ca                	mov    edx,ecx
  23700b:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
  23700e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  237011:	c1 e8 18             	shr    eax,0x18
  237014:	89 c1                	mov    ecx,eax
  237016:	48 8b 15 03 4c 00 00 	mov    rdx,QWORD PTR [rip+0x4c03]        # 23bc20 <gdt>
  23701d:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  237020:	48 c1 e0 03          	shl    rax,0x3
  237024:	48 01 d0             	add    rax,rdx
  237027:	89 ca                	mov    edx,ecx
  237029:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
  23702c:	48 8b 15 ed 4b 00 00 	mov    rdx,QWORD PTR [rip+0x4bed]        # 23bc20 <gdt>
  237033:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  237036:	48 c1 e0 03          	shl    rax,0x3
  23703a:	48 01 d0             	add    rax,rdx
  23703d:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  237040:	66 89 10             	mov    WORD PTR [rax],dx
  237043:	48 8b 15 d6 4b 00 00 	mov    rdx,QWORD PTR [rip+0x4bd6]        # 23bc20 <gdt>
  23704a:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  23704d:	48 c1 e0 03          	shl    rax,0x3
  237051:	48 01 c2             	add    rdx,rax
  237054:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  237058:	66 89 42 05          	mov    WORD PTR [rdx+0x5],ax
  23705c:	90                   	nop
  23705d:	5d                   	pop    rbp
  23705e:	c3                   	ret    

000000000023705f <fill_gate>:
  23705f:	f3 0f 1e fa          	endbr64 
  237063:	55                   	push   rbp
  237064:	48 89 e5             	mov    rbp,rsp
  237067:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  23706a:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  23706d:	89 c8                	mov    eax,ecx
  23706f:	66 89 55 e4          	mov    WORD PTR [rbp-0x1c],dx
  237073:	66 89 45 e0          	mov    WORD PTR [rbp-0x20],ax
  237077:	48 8b 05 a2 4b 00 00 	mov    rax,QWORD PTR [rip+0x4ba2]        # 23bc20 <gdt>
  23707e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  237082:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  237085:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  23708c:	00 
  23708d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  237091:	48 01 d0             	add    rax,rdx
  237094:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  237097:	66 89 10             	mov    WORD PTR [rax],dx
  23709a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  23709d:	c1 e8 10             	shr    eax,0x10
  2370a0:	89 c2                	mov    edx,eax
  2370a2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  2370a5:	48 8d 0c c5 00 00 00 	lea    rcx,[rax*8+0x0]
  2370ac:	00 
  2370ad:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2370b1:	48 01 c8             	add    rax,rcx
  2370b4:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
  2370b8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  2370bb:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  2370c2:	00 
  2370c3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2370c7:	48 01 c2             	add    rdx,rax
  2370ca:	0f b7 45 e4          	movzx  eax,WORD PTR [rbp-0x1c]
  2370ce:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
  2370d2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  2370d5:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  2370dc:	00 
  2370dd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2370e1:	48 01 c2             	add    rdx,rax
  2370e4:	0f b7 45 e0          	movzx  eax,WORD PTR [rbp-0x20]
  2370e8:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
  2370ec:	90                   	nop
  2370ed:	5d                   	pop    rbp
  2370ee:	c3                   	ret    

00000000002370ef <fill_ldt_desc>:
  2370ef:	f3 0f 1e fa          	endbr64 
  2370f3:	55                   	push   rbp
  2370f4:	48 89 e5             	mov    rbp,rsp
  2370f7:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  2370fa:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  2370fd:	89 d0                	mov    eax,edx
  2370ff:	48 89 4d e8          	mov    QWORD PTR [rbp-0x18],rcx
  237103:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
  237107:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23710a:	89 c2                	mov    edx,eax
  23710c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  237110:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
  237114:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  237117:	c1 e8 10             	shr    eax,0x10
  23711a:	89 c2                	mov    edx,eax
  23711c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  237120:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
  237123:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  237126:	c1 e8 18             	shr    eax,0x18
  237129:	89 c2                	mov    edx,eax
  23712b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  23712f:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
  237132:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  237135:	89 c2                	mov    edx,eax
  237137:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  23713b:	66 89 10             	mov    WORD PTR [rax],dx
  23713e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  237141:	c1 e8 10             	shr    eax,0x10
  237144:	c1 e0 08             	shl    eax,0x8
  237147:	66 25 00 0f          	and    ax,0xf00
  23714b:	66 0b 45 f4          	or     ax,WORD PTR [rbp-0xc]
  23714f:	89 c2                	mov    edx,eax
  237151:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  237155:	66 89 50 05          	mov    WORD PTR [rax+0x5],dx
  237159:	90                   	nop
  23715a:	5d                   	pop    rbp
  23715b:	c3                   	ret    
  23715c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000237160 <fill_desc>:
  237160:	8b 44 24 04          	mov    eax,DWORD PTR [rsp+0x4]
  237164:	8b 5c 24 08          	mov    ebx,DWORD PTR [rsp+0x8]
  237168:	8b 4c 24 0c          	mov    ecx,DWORD PTR [rsp+0xc]
  23716c:	8b 54 24 10          	mov    edx,DWORD PTR [rsp+0x10]
  237170:	be 00 60 00 00       	mov    esi,0x6000
  237175:	c1 e2 03             	shl    edx,0x3
  237178:	01 d6                	add    esi,edx
  23717a:	66 89 1e             	mov    WORD PTR [rsi],bx
  23717d:	66 89 46 02          	mov    WORD PTR [rsi+0x2],ax
  237181:	c1 e8 10             	shr    eax,0x10
  237184:	88 46 04             	mov    BYTE PTR [rsi+0x4],al
  237187:	c1 eb 10             	shr    ebx,0x10
  23718a:	88 5e 06             	mov    BYTE PTR [rsi+0x6],bl
  23718d:	88 66 07             	mov    BYTE PTR [rsi+0x7],ah
  237190:	09 4e 05             	or     DWORD PTR [rsi+0x5],ecx
  237193:	c3                   	ret    

0000000000237194 <clock_c>:
  237194:	f3 0f 1e fa          	endbr64 
  237198:	55                   	push   rbp
  237199:	48 89 e5             	mov    rbp,rsp
  23719c:	b8 00 00 00 00       	mov    eax,0x0
  2371a1:	e8 6b 10 00 00       	call   238211 <execute_request>
  2371a6:	b8 00 00 00 00       	mov    eax,0x0
  2371ab:	e8 de ea ff ff       	call   235c8e <do_req>
  2371b0:	8b 05 2a 4a 00 00    	mov    eax,DWORD PTR [rip+0x4a2a]        # 23bbe0 <manage_proc_lock>
  2371b6:	85 c0                	test   eax,eax
  2371b8:	75 0a                	jne    2371c4 <clock_c+0x30>
  2371ba:	b8 00 00 00 00       	mov    eax,0x0
  2371bf:	e8 a5 f0 ff ff       	call   236269 <manage_proc>
  2371c4:	90                   	nop
  2371c5:	5d                   	pop    rbp
  2371c6:	c3                   	ret    
  2371c7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  2371ce:	00 00 

00000000002371d0 <clock>:
  2371d0:	83 3d e0 bb 23 00 00 	cmp    DWORD PTR [rip+0x23bbe0],0x0        # 472db7 <dev_stdout+0x236357>
  2371d7:	75 5d                	jne    237236 <clock.normal_part>
  2371d9:	60                   	(bad)  
  2371da:	b9 08 00 00 00       	mov    ecx,0x8
  2371df:	89 e6                	mov    esi,esp
  2371e1:	bf 40 30 21 00       	mov    edi,0x213040
  2371e6:	83 c7 44             	add    edi,0x44

00000000002371e9 <clock.saver_loop>:
  2371e9:	8b 1e                	mov    ebx,DWORD PTR [rsi]
  2371eb:	89 1f                	mov    DWORD PTR [rdi],ebx
  2371ed:	83 c6 04             	add    esi,0x4
  2371f0:	83 ef 04             	sub    edi,0x4
  2371f3:	e2 f4                	loop   2371e9 <clock.saver_loop>
  2371f5:	61                   	(bad)  
  2371f6:	bf 40 30 21 00       	mov    edi,0x213040
  2371fb:	8b 04 24             	mov    eax,DWORD PTR [rsp]
  2371fe:	89 47 20             	mov    DWORD PTR [rdi+0x20],eax
  237201:	9c                   	pushf  
  237202:	5b                   	pop    rbx
  237203:	81 cb 00 02 00 00    	or     ebx,0x200
  237209:	89 5f 24             	mov    DWORD PTR [rdi+0x24],ebx
  23720c:	66 8c c0             	mov    ax,es
  23720f:	66 89 47 48          	mov    WORD PTR [rdi+0x48],ax
  237213:	66 8c c8             	mov    ax,cs
  237216:	66 89 47 4c          	mov    WORD PTR [rdi+0x4c],ax
  23721a:	66 8c d0             	mov    ax,ss
  23721d:	66 89 47 50          	mov    WORD PTR [rdi+0x50],ax
  237221:	66 8c d8             	mov    ax,ds
  237224:	66 89 47 54          	mov    WORD PTR [rdi+0x54],ax
  237228:	66 8c e0             	mov    ax,fs
  23722b:	66 89 47 58          	mov    WORD PTR [rdi+0x58],ax
  23722f:	66 8c e8             	mov    ax,gs
  237232:	66 89 47 5c          	mov    WORD PTR [rdi+0x5c],ax

0000000000237236 <clock.normal_part>:
  237236:	b0 20                	mov    al,0x20
  237238:	e6 a0                	out    0xa0,al
  23723a:	e6 20                	out    0x20,al
  23723c:	e8 57 ff ff ff       	call   237198 <clock_c+0x4>
  237241:	cf                   	iret   

0000000000237242 <execute>:
  237242:	f3 0f 1e fa          	endbr64 
  237246:	55                   	push   rbp
  237247:	48 89 e5             	mov    rbp,rsp
  23724a:	48 83 ec 30          	sub    rsp,0x30
  23724e:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  237252:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  237259:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
  237260:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  237264:	be 01 00 00 00       	mov    esi,0x1
  237269:	48 89 c7             	mov    rdi,rax
  23726c:	e8 0f cd ff ff       	call   233f80 <sys_open>
  237271:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  237274:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  237278:	75 0a                	jne    237284 <execute+0x42>
  23727a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  23727f:	e9 b7 00 00 00       	jmp    23733b <execute+0xf9>
  237284:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  237288:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  23728c:	eb 05                	jmp    237293 <execute+0x51>
  23728e:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  237293:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  237297:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23729a:	84 c0                	test   al,al
  23729c:	75 f0                	jne    23728e <execute+0x4c>
  23729e:	eb 05                	jmp    2372a5 <execute+0x63>
  2372a0:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  2372a5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  2372a9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  2372ac:	3c 2f                	cmp    al,0x2f
  2372ae:	74 0a                	je     2372ba <execute+0x78>
  2372b0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  2372b4:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  2372b8:	77 e6                	ja     2372a0 <execute+0x5e>
  2372ba:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  2372be:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  2372c2:	76 2f                	jbe    2372f3 <execute+0xb1>
  2372c4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  2372c8:	c6 00 00             	mov    BYTE PTR [rax],0x0
  2372cb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  2372cf:	be 01 00 00 00       	mov    esi,0x1
  2372d4:	48 89 c7             	mov    rdi,rax
  2372d7:	e8 a4 cc ff ff       	call   233f80 <sys_open>
  2372dc:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  2372df:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  2372e3:	75 07                	jne    2372ec <execute+0xaa>
  2372e5:	b8 ff ff ff ff       	mov    eax,0xffffffff
  2372ea:	eb 4f                	jmp    23733b <execute+0xf9>
  2372ec:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  2372f0:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
  2372f3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  2372f6:	48 63 d0             	movsxd rdx,eax
  2372f9:	48 89 d0             	mov    rax,rdx
  2372fc:	48 01 c0             	add    rax,rax
  2372ff:	48 01 d0             	add    rax,rdx
  237302:	48 c1 e0 05          	shl    rax,0x5
  237306:	48 8d 90 00 17 20 00 	lea    rdx,[rax+0x201700]
  23730d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  237310:	48 63 c8             	movsxd rcx,eax
  237313:	48 89 c8             	mov    rax,rcx
  237316:	48 01 c0             	add    rax,rax
  237319:	48 01 c8             	add    rax,rcx
  23731c:	48 c1 e0 05          	shl    rax,0x5
  237320:	48 05 00 17 20 00    	add    rax,0x201700
  237326:	b9 a5 73 23 00       	mov    ecx,0x2373a5
  23732b:	48 89 c6             	mov    rsi,rax
  23732e:	89 cf                	mov    edi,ecx
  237330:	e8 b4 f7 ff ff       	call   236ae9 <reg_proc>
  237335:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  237338:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  23733b:	c9                   	leave  
  23733c:	c3                   	ret    

000000000023733d <exec_call>:
  23733d:	f3 0f 1e fa          	endbr64 
  237341:	55                   	push   rbp
  237342:	48 89 e5             	mov    rbp,rsp
  237345:	48 83 ec 20          	sub    rsp,0x20
  237349:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  23734d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  237351:	48 89 c7             	mov    rdi,rax
  237354:	e8 e9 fe ff ff       	call   237242 <execute>
  237359:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  23735c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23735f:	01 c0                	add    eax,eax
  237361:	83 c0 05             	add    eax,0x5
  237364:	c1 e0 03             	shl    eax,0x3
  237367:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  23736a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23736d:	89 c7                	mov    edi,eax
  23736f:	e8 16 f0 ff ff       	call   23638a <switch_proc_tss>
  237374:	90                   	nop
  237375:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  237378:	48 98                	cdqe   
  23737a:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  237381:	48 05 40 95 20 00    	add    rax,0x209540
  237387:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  23738a:	83 f8 03             	cmp    eax,0x3
  23738d:	75 e6                	jne    237375 <exec_call+0x38>
  23738f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  237392:	48 98                	cdqe   
  237394:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  23739b:	48 05 50 95 20 00    	add    rax,0x209550
  2373a1:	8b 00                	mov    eax,DWORD PTR [rax]
  2373a3:	c9                   	leave  
  2373a4:	c3                   	ret    

00000000002373a5 <proc_start>:
  2373a5:	f3 0f 1e fa          	endbr64 
  2373a9:	55                   	push   rbp
  2373aa:	48 89 e5             	mov    rbp,rsp
  2373ad:	8b 05 5d bd fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdbd5d]        # 213110 <cur_proc>
  2373b3:	48 98                	cdqe   
  2373b5:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  2373bc:	48 05 40 95 20 00    	add    rax,0x209540
  2373c2:	48 89 c7             	mov    rdi,rax
  2373c5:	e8 1a 00 00 00       	call   2373e4 <load_pe>
  2373ca:	8b 05 40 bd fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdbd40]        # 213110 <cur_proc>
  2373d0:	89 c7                	mov    edi,eax
  2373d2:	e8 f2 f4 ff ff       	call   2368c9 <del_proc>
  2373d7:	bf 00 00 00 00       	mov    edi,0x0
  2373dc:	e8 a9 ef ff ff       	call   23638a <switch_proc_tss>
  2373e1:	90                   	nop
  2373e2:	5d                   	pop    rbp
  2373e3:	c3                   	ret    

00000000002373e4 <load_pe>:
  2373e4:	f3 0f 1e fa          	endbr64 
  2373e8:	55                   	push   rbp
  2373e9:	48 89 e5             	mov    rbp,rsp
  2373ec:	48 81 ec c0 02 00 00 	sub    rsp,0x2c0
  2373f3:	48 89 bd 48 fd ff ff 	mov    QWORD PTR [rbp-0x2b8],rdi
  2373fa:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  237401:	48 8b 80 94 00 00 00 	mov    rax,QWORD PTR [rax+0x94]
  237408:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
  23740c:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  237410:	8b 00                	mov    eax,DWORD PTR [rax]
  237412:	89 45 94             	mov    DWORD PTR [rbp-0x6c],eax
  237415:	48 8d 8d 70 fe ff ff 	lea    rcx,[rbp-0x190]
  23741c:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  23741f:	ba 44 00 00 00       	mov    edx,0x44
  237424:	48 89 ce             	mov    rsi,rcx
  237427:	89 c7                	mov    edi,eax
  237429:	e8 31 d1 ff ff       	call   23455f <sys_read>
  23742e:	48 8b 85 ac fe ff ff 	mov    rax,QWORD PTR [rbp-0x154]
  237435:	89 c1                	mov    ecx,eax
  237437:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  23743a:	ba 00 00 00 00       	mov    edx,0x0
  23743f:	89 ce                	mov    esi,ecx
  237441:	89 c7                	mov    edi,eax
  237443:	e8 a8 d1 ff ff       	call   2345f0 <sys_seek>
  237448:	48 8d 8d 70 fd ff ff 	lea    rcx,[rbp-0x290]
  23744f:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  237452:	ba f8 00 00 00       	mov    edx,0xf8
  237457:	48 89 ce             	mov    rsi,rcx
  23745a:	89 c7                	mov    edi,eax
  23745c:	e8 fe d0 ff ff       	call   23455f <sys_read>
  237461:	8b 85 a4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x25c]
  237467:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  23746a:	8b 85 c0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x240]
  237470:	c1 e8 0c             	shr    eax,0xc
  237473:	89 45 90             	mov    DWORD PTR [rbp-0x70],eax
  237476:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  237479:	c1 e8 16             	shr    eax,0x16
  23747c:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
  23747f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  237482:	25 ff ff 3f 00       	and    eax,0x3fffff
  237487:	c1 e8 0c             	shr    eax,0xc
  23748a:	89 45 88             	mov    DWORD PTR [rbp-0x78],eax
  23748d:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  237494:	48 8b 90 84 00 00 00 	mov    rdx,QWORD PTR [rax+0x84]
  23749b:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
  23749e:	48 98                	cdqe   
  2374a0:	48 c1 e0 02          	shl    rax,0x2
  2374a4:	48 01 d0             	add    rax,rdx
  2374a7:	8b 00                	mov    eax,DWORD PTR [rax]
  2374a9:	89 c0                	mov    eax,eax
  2374ab:	25 00 f0 ff ff       	and    eax,0xfffff000
  2374b0:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
  2374b4:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  2374bb:	eb 48                	jmp    237505 <load_pe+0x121>
  2374bd:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  2374c0:	99                   	cdq    
  2374c1:	c1 ea 16             	shr    edx,0x16
  2374c4:	01 d0                	add    eax,edx
  2374c6:	25 ff 03 00 00       	and    eax,0x3ff
  2374cb:	29 d0                	sub    eax,edx
  2374cd:	89 c2                	mov    edx,eax
  2374cf:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
  2374d2:	01 d0                	add    eax,edx
  2374d4:	48 98                	cdqe   
  2374d6:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  2374dd:	00 
  2374de:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  2374e2:	48 01 d0             	add    rax,rdx
  2374e5:	8b 00                	mov    eax,DWORD PTR [rax]
  2374e7:	83 e0 01             	and    eax,0x1
  2374ea:	85 c0                	test   eax,eax
  2374ec:	74 13                	je     237501 <load_pe+0x11d>
  2374ee:	48 83 7d 80 00       	cmp    QWORD PTR [rbp-0x80],0x0
  2374f3:	74 0c                	je     237501 <load_pe+0x11d>
  2374f5:	81 45 fc 00 10 00 00 	add    DWORD PTR [rbp-0x4],0x1000
  2374fc:	e9 75 ff ff ff       	jmp    237476 <load_pe+0x92>
  237501:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  237505:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  237508:	3b 45 90             	cmp    eax,DWORD PTR [rbp-0x70]
  23750b:	7c b0                	jl     2374bd <load_pe+0xd9>
  23750d:	90                   	nop
  23750e:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  237511:	ba 00 00 00 00       	mov    edx,0x0
  237516:	be 00 00 00 00       	mov    esi,0x0
  23751b:	89 c7                	mov    edi,eax
  23751d:	e8 ce d0 ff ff       	call   2345f0 <sys_seek>
  237522:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  237525:	48 89 c1             	mov    rcx,rax
  237528:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  23752b:	ba 00 10 00 00       	mov    edx,0x1000
  237530:	48 89 ce             	mov    rsi,rcx
  237533:	89 c7                	mov    edi,eax
  237535:	e8 25 d0 ff ff       	call   23455f <sys_read>
  23753a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23753d:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
  237544:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  237547:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  23754e:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  237552:	48 01 d0             	add    rax,rdx
  237555:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  23755c:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  237563:	48 83 c0 04          	add    rax,0x4
  237567:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
  23756e:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  237575:	8b 40 50             	mov    eax,DWORD PTR [rax+0x50]
  237578:	89 85 64 ff ff ff    	mov    DWORD PTR [rbp-0x9c],eax
  23757e:	8b 85 64 ff ff ff    	mov    eax,DWORD PTR [rbp-0x9c]
  237584:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  23758a:	85 c0                	test   eax,eax
  23758c:	0f 48 c2             	cmovs  eax,edx
  23758f:	c1 f8 0c             	sar    eax,0xc
  237592:	89 85 60 ff ff ff    	mov    DWORD PTR [rbp-0xa0],eax
  237598:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  23759f:	8b 50 28             	mov    edx,DWORD PTR [rax+0x28]
  2375a2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2375a5:	01 d0                	add    eax,edx
  2375a7:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
  2375ad:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  2375b3:	8d 90 ff 03 00 00    	lea    edx,[rax+0x3ff]
  2375b9:	85 c0                	test   eax,eax
  2375bb:	0f 48 c2             	cmovs  eax,edx
  2375be:	c1 f8 0a             	sar    eax,0xa
  2375c1:	89 c1                	mov    ecx,eax
  2375c3:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  2375c9:	99                   	cdq    
  2375ca:	c1 ea 16             	shr    edx,0x16
  2375cd:	01 d0                	add    eax,edx
  2375cf:	25 ff 03 00 00       	and    eax,0x3ff
  2375d4:	29 d0                	sub    eax,edx
  2375d6:	01 c8                	add    eax,ecx
  2375d8:	85 c0                	test   eax,eax
  2375da:	0f 95 c0             	setne  al
  2375dd:	0f b6 c0             	movzx  eax,al
  2375e0:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
  2375e6:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  2375ec:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  2375f2:	85 c0                	test   eax,eax
  2375f4:	0f 48 c2             	cmovs  eax,edx
  2375f7:	c1 f8 16             	sar    eax,0x16
  2375fa:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
  237600:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  237607:	89 c0                	mov    eax,eax
  237609:	48 05 f8 00 00 00    	add    rax,0xf8
  23760f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  237613:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  23761a:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  23761e:	0f b7 d0             	movzx  edx,ax
  237621:	89 d0                	mov    eax,edx
  237623:	c1 e0 02             	shl    eax,0x2
  237626:	01 d0                	add    eax,edx
  237628:	c1 e0 03             	shl    eax,0x3
  23762b:	05 3c 01 00 00       	add    eax,0x13c
  237630:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
  237636:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  23763d:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  237640:	89 85 4c ff ff ff    	mov    DWORD PTR [rbp-0xb4],eax
  237646:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  23764c:	99                   	cdq    
  23764d:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  237653:	89 d0                	mov    eax,edx
  237655:	85 c0                	test   eax,eax
  237657:	74 23                	je     23767c <load_pe+0x298>
  237659:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  23765f:	99                   	cdq    
  237660:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  237666:	89 d1                	mov    ecx,edx
  237668:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  23766e:	29 c8                	sub    eax,ecx
  237670:	89 c2                	mov    edx,eax
  237672:	8b 85 4c ff ff ff    	mov    eax,DWORD PTR [rbp-0xb4]
  237678:	01 d0                	add    eax,edx
  23767a:	eb 06                	jmp    237682 <load_pe+0x29e>
  23767c:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  237682:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
  237688:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  23768f:	eb 68                	jmp    2376f9 <load_pe+0x315>
  237691:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  237695:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  237698:	25 00 00 00 02       	and    eax,0x2000000
  23769d:	89 85 bc fe ff ff    	mov    DWORD PTR [rbp-0x144],eax
  2376a3:	83 bd bc fe ff ff 00 	cmp    DWORD PTR [rbp-0x144],0x0
  2376aa:	75 43                	jne    2376ef <load_pe+0x30b>
  2376ac:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  2376b0:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  2376b3:	89 c1                	mov    ecx,eax
  2376b5:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  2376b8:	ba 00 00 00 00       	mov    edx,0x0
  2376bd:	89 ce                	mov    esi,ecx
  2376bf:	89 c7                	mov    edi,eax
  2376c1:	e8 2a cf ff ff       	call   2345f0 <sys_seek>
  2376c6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  2376ca:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  2376cd:	89 c2                	mov    edx,eax
  2376cf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  2376d3:	8b 48 0c             	mov    ecx,DWORD PTR [rax+0xc]
  2376d6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2376d9:	01 c8                	add    eax,ecx
  2376db:	89 c0                	mov    eax,eax
  2376dd:	48 89 c1             	mov    rcx,rax
  2376e0:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  2376e3:	48 89 ce             	mov    rsi,rcx
  2376e6:	89 c7                	mov    edi,eax
  2376e8:	e8 72 ce ff ff       	call   23455f <sys_read>
  2376ed:	eb 01                	jmp    2376f0 <load_pe+0x30c>
  2376ef:	90                   	nop
  2376f0:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  2376f4:	48 83 45 f0 28       	add    QWORD PTR [rbp-0x10],0x28
  2376f9:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  237700:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  237704:	0f b7 c0             	movzx  eax,ax
  237707:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  23770a:	7c 85                	jl     237691 <load_pe+0x2ad>
  23770c:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  237713:	48 83 e8 80          	sub    rax,0xffffffffffffff80
  237717:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
  23771e:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  237725:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  237728:	85 c0                	test   eax,eax
  23772a:	0f 84 71 02 00 00    	je     2379a1 <load_pe+0x5bd>
  237730:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  237737:	8b 10                	mov    edx,DWORD PTR [rax]
  237739:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23773c:	01 d0                	add    eax,edx
  23773e:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
  237744:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  23774a:	48 98                	cdqe   
  23774c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  237750:	e9 3e 02 00 00       	jmp    237993 <load_pe+0x5af>
  237755:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  237759:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  23775c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23775f:	01 d0                	add    eax,edx
  237761:	89 c0                	mov    eax,eax
  237763:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
  23776a:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  237771:	be 10 c4 23 00       	mov    esi,0x23c410
  237776:	48 89 c7             	mov    rdi,rax
  237779:	e8 7c 3d 00 00       	call   23b4fa <strcmp>
  23777e:	85 c0                	test   eax,eax
  237780:	75 09                	jne    23778b <load_pe+0x3a7>
  237782:	c7 45 dc 00 00 c0 01 	mov    DWORD PTR [rbp-0x24],0x1c00000
  237789:	eb 25                	jmp    2377b0 <load_pe+0x3cc>
  23778b:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  237792:	48 89 c7             	mov    rdi,rax
  237795:	e8 4a fc ff ff       	call   2373e4 <load_pe>
  23779a:	89 85 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],eax
  2377a0:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  2377a6:	89 c7                	mov    edi,eax
  2377a8:	e8 c9 03 00 00       	call   237b76 <get_module_addr>
  2377ad:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
  2377b0:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  2377b3:	48 98                	cdqe   
  2377b5:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
  2377bc:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  2377bf:	48 63 d0             	movsxd rdx,eax
  2377c2:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  2377c9:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  2377cd:	48 01 d0             	add    rax,rdx
  2377d0:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
  2377d7:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  2377de:	8b 50 78             	mov    edx,DWORD PTR [rax+0x78]
  2377e1:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  2377e4:	01 d0                	add    eax,edx
  2377e6:	89 c0                	mov    eax,eax
  2377e8:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  2377ef:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  2377f6:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  2377f9:	89 85 0c ff ff ff    	mov    DWORD PTR [rbp-0xf4],eax
  2377ff:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  237806:	8b 50 20             	mov    edx,DWORD PTR [rax+0x20]
  237809:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  23780c:	01 d0                	add    eax,edx
  23780e:	89 c0                	mov    eax,eax
  237810:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
  237817:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  23781e:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  237821:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  237824:	01 d0                	add    eax,edx
  237826:	89 c0                	mov    eax,eax
  237828:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
  23782f:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  237836:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  237839:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  23783c:	01 d0                	add    eax,edx
  23783e:	89 c0                	mov    eax,eax
  237840:	48 89 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rax
  237847:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  23784e:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  237851:	89 85 ec fe ff ff    	mov    DWORD PTR [rbp-0x114],eax
  237857:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  23785b:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  23785e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  237861:	01 d0                	add    eax,edx
  237863:	89 c0                	mov    eax,eax
  237865:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  237869:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  23786d:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  237870:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  237873:	01 d0                	add    eax,edx
  237875:	89 c0                	mov    eax,eax
  237877:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
  23787b:	e9 00 01 00 00       	jmp    237980 <load_pe+0x59c>
  237880:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  237884:	8b 00                	mov    eax,DWORD PTR [rax]
  237886:	85 c0                	test   eax,eax
  237888:	79 43                	jns    2378cd <load_pe+0x4e9>
  23788a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  23788e:	8b 00                	mov    eax,DWORD PTR [rax]
  237890:	25 ff ff ff 7f       	and    eax,0x7fffffff
  237895:	2b 85 ec fe ff ff    	sub    eax,DWORD PTR [rbp-0x114]
  23789b:	89 85 d8 fe ff ff    	mov    DWORD PTR [rbp-0x128],eax
  2378a1:	8b 85 d8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x128]
  2378a7:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  2378ae:	00 
  2378af:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  2378b6:	48 01 d0             	add    rax,rdx
  2378b9:	8b 10                	mov    edx,DWORD PTR [rax]
  2378bb:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  2378be:	01 d0                	add    eax,edx
  2378c0:	89 c2                	mov    edx,eax
  2378c2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  2378c6:	89 10                	mov    DWORD PTR [rax],edx
  2378c8:	e9 a9 00 00 00       	jmp    237976 <load_pe+0x592>
  2378cd:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  2378d1:	8b 00                	mov    eax,DWORD PTR [rax]
  2378d3:	89 c0                	mov    eax,eax
  2378d5:	48 89 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rax
  2378dc:	48 83 85 e0 fe ff ff 	add    QWORD PTR [rbp-0x120],0x2
  2378e3:	02 
  2378e4:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
  2378eb:	eb 7a                	jmp    237967 <load_pe+0x583>
  2378ed:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  2378f0:	48 98                	cdqe   
  2378f2:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  2378f9:	00 
  2378fa:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  237901:	48 01 d0             	add    rax,rdx
  237904:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  237907:	48 8b 85 e0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x120]
  23790e:	48 89 d6             	mov    rsi,rdx
  237911:	48 89 c7             	mov    rdi,rax
  237914:	e8 e1 3b 00 00       	call   23b4fa <strcmp>
  237919:	85 c0                	test   eax,eax
  23791b:	75 46                	jne    237963 <load_pe+0x57f>
  23791d:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  237920:	48 98                	cdqe   
  237922:	48 8d 14 00          	lea    rdx,[rax+rax*1]
  237926:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  23792d:	48 01 d0             	add    rax,rdx
  237930:	0f b7 00             	movzx  eax,WORD PTR [rax]
  237933:	98                   	cwde   
  237934:	89 85 dc fe ff ff    	mov    DWORD PTR [rbp-0x124],eax
  23793a:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
  237940:	48 98                	cdqe   
  237942:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  237949:	00 
  23794a:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  237951:	48 01 d0             	add    rax,rdx
  237954:	8b 10                	mov    edx,DWORD PTR [rax]
  237956:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  237959:	01 d0                	add    eax,edx
  23795b:	89 c2                	mov    edx,eax
  23795d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  237961:	89 10                	mov    DWORD PTR [rax],edx
  237963:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
  237967:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  23796a:	3b 85 0c ff ff ff    	cmp    eax,DWORD PTR [rbp-0xf4]
  237970:	0f 8c 77 ff ff ff    	jl     2378ed <load_pe+0x509>
  237976:	48 83 45 d0 04       	add    QWORD PTR [rbp-0x30],0x4
  23797b:	48 83 45 c8 08       	add    QWORD PTR [rbp-0x38],0x8
  237980:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  237984:	8b 00                	mov    eax,DWORD PTR [rax]
  237986:	85 c0                	test   eax,eax
  237988:	0f 85 f2 fe ff ff    	jne    237880 <load_pe+0x49c>
  23798e:	48 83 45 e0 14       	add    QWORD PTR [rbp-0x20],0x14
  237993:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  237997:	8b 00                	mov    eax,DWORD PTR [rax]
  237999:	85 c0                	test   eax,eax
  23799b:	0f 85 b4 fd ff ff    	jne    237755 <load_pe+0x371>
  2379a1:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  2379a8:	00 
  2379a9:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  2379b0:	8b 80 a4 00 00 00    	mov    eax,DWORD PTR [rax+0xa4]
  2379b6:	85 c0                	test   eax,eax
  2379b8:	0f 84 e8 00 00 00    	je     237aa6 <load_pe+0x6c2>
  2379be:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  2379c5:	8b 90 a0 00 00 00    	mov    edx,DWORD PTR [rax+0xa0]
  2379cb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2379ce:	01 d0                	add    eax,edx
  2379d0:	89 c0                	mov    eax,eax
  2379d2:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  2379d6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  2379da:	48 83 c0 40          	add    rax,0x40
  2379de:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  2379e2:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  2379e6:	48 83 c0 02          	add    rax,0x2
  2379ea:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
  2379ee:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  2379f5:	8b 40 34             	mov    eax,DWORD PTR [rax+0x34]
  2379f8:	89 85 d4 fe ff ff    	mov    DWORD PTR [rbp-0x12c],eax
  2379fe:	e9 95 00 00 00       	jmp    237a98 <load_pe+0x6b4>
  237a03:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  237a07:	8b 10                	mov    edx,DWORD PTR [rax]
  237a09:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  237a0c:	01 d0                	add    eax,edx
  237a0e:	89 85 d0 fe ff ff    	mov    DWORD PTR [rbp-0x130],eax
  237a14:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
  237a1b:	eb 59                	jmp    237a76 <load_pe+0x692>
  237a1d:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  237a21:	0f b7 00             	movzx  eax,WORD PTR [rax]
  237a24:	66 85 c0             	test   ax,ax
  237a27:	74 48                	je     237a71 <load_pe+0x68d>
  237a29:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  237a2d:	0f b7 00             	movzx  eax,WORD PTR [rax]
  237a30:	0f b7 d0             	movzx  edx,ax
  237a33:	8b 85 d0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x130]
  237a39:	01 d0                	add    eax,edx
  237a3b:	48 98                	cdqe   
  237a3d:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
  237a44:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  237a4b:	8b 00                	mov    eax,DWORD PTR [rax]
  237a4d:	2b 85 d4 fe ff ff    	sub    eax,DWORD PTR [rbp-0x12c]
  237a53:	89 c2                	mov    edx,eax
  237a55:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  237a58:	01 d0                	add    eax,edx
  237a5a:	89 c2                	mov    edx,eax
  237a5c:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  237a63:	89 10                	mov    DWORD PTR [rax],edx
  237a65:	48 83 45 b0 04       	add    QWORD PTR [rbp-0x50],0x4
  237a6a:	48 83 45 a8 04       	add    QWORD PTR [rbp-0x58],0x4
  237a6f:	eb 01                	jmp    237a72 <load_pe+0x68e>
  237a71:	90                   	nop
  237a72:	83 45 a4 01          	add    DWORD PTR [rbp-0x5c],0x1
  237a76:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  237a7a:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  237a7d:	c1 e8 02             	shr    eax,0x2
  237a80:	89 c2                	mov    edx,eax
  237a82:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  237a85:	39 c2                	cmp    edx,eax
  237a87:	77 94                	ja     237a1d <load_pe+0x639>
  237a89:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  237a8d:	05 00 10 00 00       	add    eax,0x1000
  237a92:	48 98                	cdqe   
  237a94:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
  237a98:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  237a9c:	8b 00                	mov    eax,DWORD PTR [rax]
  237a9e:	85 c0                	test   eax,eax
  237aa0:	0f 85 5d ff ff ff    	jne    237a03 <load_pe+0x61f>
  237aa6:	c7 85 50 fd ff ff 00 	mov    DWORD PTR [rbp-0x2b0],0x0
  237aad:	00 00 00 
  237ab0:	c7 85 54 fd ff ff 00 	mov    DWORD PTR [rbp-0x2ac],0x0
  237ab7:	00 00 00 
  237aba:	48 c7 85 58 fd ff ff 	mov    QWORD PTR [rbp-0x2a8],0x0
  237ac1:	00 00 00 00 
  237ac5:	48 c7 85 60 fd ff ff 	mov    QWORD PTR [rbp-0x2a0],0x0
  237acc:	00 00 00 00 
  237ad0:	48 8d 85 50 fd ff ff 	lea    rax,[rbp-0x2b0]
  237ad7:	ba 18 00 00 00       	mov    edx,0x18
  237adc:	48 89 c6             	mov    rsi,rax
  237adf:	bf 00 00 00 01       	mov    edi,0x1000000
  237ae4:	e8 73 37 00 00       	call   23b25c <memcpy>
  237ae9:	8b 05 21 b6 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdb621]        # 213110 <cur_proc>
  237aef:	48 98                	cdqe   
  237af1:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  237af8:	48 05 50 95 20 00    	add    rax,0x209550
  237afe:	c7 40 04 00 00 00 01 	mov    DWORD PTR [rax+0x4],0x1000000
  237b05:	8b 05 05 b6 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdb605]        # 213110 <cur_proc>
  237b0b:	48 98                	cdqe   
  237b0d:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  237b14:	48 05 50 95 20 00    	add    rax,0x209550
  237b1a:	c7 40 08 00 10 00 01 	mov    DWORD PTR [rax+0x8],0x1001000
  237b21:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  237b27:	48 98                	cdqe   
  237b29:	48 89 85 c0 fe ff ff 	mov    QWORD PTR [rbp-0x140],rax
  237b30:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
  237b37:	be 00 00 00 00       	mov    esi,0x0
  237b3c:	bf 00 00 00 00       	mov    edi,0x0
  237b41:	ff d0                	call   rax
  237b43:	8b 15 c7 b5 fd ff    	mov    edx,DWORD PTR [rip+0xfffffffffffdb5c7]        # 213110 <cur_proc>
  237b49:	89 c1                	mov    ecx,eax
  237b4b:	48 63 c2             	movsxd rax,edx
  237b4e:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  237b55:	48 05 50 95 20 00    	add    rax,0x209550
  237b5b:	89 08                	mov    DWORD PTR [rax],ecx
  237b5d:	8b 05 ad b5 fd ff    	mov    eax,DWORD PTR [rip+0xfffffffffffdb5ad]        # 213110 <cur_proc>
  237b63:	48 98                	cdqe   
  237b65:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  237b6c:	48 05 50 95 20 00    	add    rax,0x209550
  237b72:	8b 00                	mov    eax,DWORD PTR [rax]
  237b74:	c9                   	leave  
  237b75:	c3                   	ret    

0000000000237b76 <get_module_addr>:
  237b76:	f3 0f 1e fa          	endbr64 
  237b7a:	55                   	push   rbp
  237b7b:	48 89 e5             	mov    rbp,rsp
  237b7e:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  237b81:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  237b84:	48 98                	cdqe   
  237b86:	8b 04 c5 20 5d 22 00 	mov    eax,DWORD PTR [rax*8+0x225d20]
  237b8d:	5d                   	pop    rbp
  237b8e:	c3                   	ret    

0000000000237b8f <dispose_library>:
  237b8f:	f3 0f 1e fa          	endbr64 
  237b93:	55                   	push   rbp
  237b94:	48 89 e5             	mov    rbp,rsp
  237b97:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  237b9a:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  237b9e:	78 09                	js     237ba9 <dispose_library+0x1a>
  237ba0:	81 7d fc ff 00 00 00 	cmp    DWORD PTR [rbp-0x4],0xff
  237ba7:	7e 07                	jle    237bb0 <dispose_library+0x21>
  237ba9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  237bae:	eb 1d                	jmp    237bcd <dispose_library+0x3e>
  237bb0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  237bb3:	48 98                	cdqe   
  237bb5:	48 69 c0 2c 01 00 00 	imul   rax,rax,0x12c
  237bbc:	48 05 28 31 21 00    	add    rax,0x213128
  237bc2:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  237bc8:	b8 00 00 00 00       	mov    eax,0x0
  237bcd:	5d                   	pop    rbp
  237bce:	c3                   	ret    

0000000000237bcf <sys_insmod>:
  237bcf:	f3 0f 1e fa          	endbr64 
  237bd3:	55                   	push   rbp
  237bd4:	48 89 e5             	mov    rbp,rsp
  237bd7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  237bdb:	90                   	nop
  237bdc:	5d                   	pop    rbp
  237bdd:	c3                   	ret    

0000000000237bde <sys_rmmod>:
  237bde:	f3 0f 1e fa          	endbr64 
  237be2:	55                   	push   rbp
  237be3:	48 89 e5             	mov    rbp,rsp
  237be6:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  237bea:	90                   	nop
  237beb:	5d                   	pop    rbp
  237bec:	c3                   	ret    
  237bed:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000237bf0 <_syscall>:
  237bf0:	57                   	push   rdi
  237bf1:	56                   	push   rsi
  237bf2:	52                   	push   rdx
  237bf3:	51                   	push   rcx
  237bf4:	53                   	push   rbx
  237bf5:	50                   	push   rax
  237bf6:	e8 94 ac ff ff       	call   23288f <syscall+0x4>
  237bfb:	83 c4 18             	add    esp,0x18
  237bfe:	cf                   	iret   

0000000000237bff <shift>:
  237bff:	f3 0f 1e fa          	endbr64 
  237c03:	55                   	push   rbp
  237c04:	48 89 e5             	mov    rbp,rsp
  237c07:	0f b6 05 1f ef fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffeef1f]        # 226b2d <k_shift>
  237c0e:	84 c0                	test   al,al
  237c10:	0f 94 c0             	sete   al
  237c13:	88 05 14 ef fe ff    	mov    BYTE PTR [rip+0xfffffffffffeef14],al        # 226b2d <k_shift>
  237c19:	90                   	nop
  237c1a:	5d                   	pop    rbp
  237c1b:	c3                   	ret    

0000000000237c1c <ctrl>:
  237c1c:	f3 0f 1e fa          	endbr64 
  237c20:	55                   	push   rbp
  237c21:	48 89 e5             	mov    rbp,rsp
  237c24:	0f b6 05 03 ef fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffeef03]        # 226b2e <k_ctrl>
  237c2b:	84 c0                	test   al,al
  237c2d:	0f 94 c0             	sete   al
  237c30:	88 05 f8 ee fe ff    	mov    BYTE PTR [rip+0xfffffffffffeeef8],al        # 226b2e <k_ctrl>
  237c36:	90                   	nop
  237c37:	5d                   	pop    rbp
  237c38:	c3                   	ret    

0000000000237c39 <capslock>:
  237c39:	f3 0f 1e fa          	endbr64 
  237c3d:	55                   	push   rbp
  237c3e:	48 89 e5             	mov    rbp,rsp
  237c41:	0f b6 05 e7 ee fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffeeee7]        # 226b2f <k_capslock>
  237c48:	84 c0                	test   al,al
  237c4a:	0f 94 c0             	sete   al
  237c4d:	88 05 dc ee fe ff    	mov    BYTE PTR [rip+0xfffffffffffeeedc],al        # 226b2f <k_capslock>
  237c53:	90                   	nop
  237c54:	5d                   	pop    rbp
  237c55:	c3                   	ret    

0000000000237c56 <to_ascii>:
  237c56:	f3 0f 1e fa          	endbr64 
  237c5a:	55                   	push   rbp
  237c5b:	48 89 e5             	mov    rbp,rsp
  237c5e:	89 f8                	mov    eax,edi
  237c60:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
  237c63:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  237c6a:	e9 c7 00 00 00       	jmp    237d36 <to_ascii+0xe0>
  237c6f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  237c72:	48 63 d0             	movsxd rdx,eax
  237c75:	48 89 d0             	mov    rax,rdx
  237c78:	48 c1 e0 02          	shl    rax,0x2
  237c7c:	48 01 d0             	add    rax,rdx
  237c7f:	48 05 82 c5 23 00    	add    rax,0x23c582
  237c85:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  237c88:	38 45 ec             	cmp    BYTE PTR [rbp-0x14],al
  237c8b:	0f 85 a1 00 00 00    	jne    237d32 <to_ascii+0xdc>
  237c91:	0f b6 05 97 ee fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffeee97]        # 226b2f <k_capslock>
  237c98:	84 c0                	test   al,al
  237c9a:	74 55                	je     237cf1 <to_ascii+0x9b>
  237c9c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  237c9f:	48 63 d0             	movsxd rdx,eax
  237ca2:	48 89 d0             	mov    rax,rdx
  237ca5:	48 c1 e0 02          	shl    rax,0x2
  237ca9:	48 01 d0             	add    rax,rdx
  237cac:	48 05 80 c5 23 00    	add    rax,0x23c580
  237cb2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  237cb5:	3c 60                	cmp    al,0x60
  237cb7:	7e 38                	jle    237cf1 <to_ascii+0x9b>
  237cb9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  237cbc:	48 63 d0             	movsxd rdx,eax
  237cbf:	48 89 d0             	mov    rax,rdx
  237cc2:	48 c1 e0 02          	shl    rax,0x2
  237cc6:	48 01 d0             	add    rax,rdx
  237cc9:	48 05 80 c5 23 00    	add    rax,0x23c580
  237ccf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  237cd2:	3c 7a                	cmp    al,0x7a
  237cd4:	7f 1b                	jg     237cf1 <to_ascii+0x9b>
  237cd6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  237cd9:	48 63 d0             	movsxd rdx,eax
  237cdc:	48 89 d0             	mov    rax,rdx
  237cdf:	48 c1 e0 02          	shl    rax,0x2
  237ce3:	48 01 d0             	add    rax,rdx
  237ce6:	48 05 81 c5 23 00    	add    rax,0x23c581
  237cec:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  237cef:	eb 54                	jmp    237d45 <to_ascii+0xef>
  237cf1:	0f b6 05 35 ee fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffeee35]        # 226b2d <k_shift>
  237cf8:	84 c0                	test   al,al
  237cfa:	74 1b                	je     237d17 <to_ascii+0xc1>
  237cfc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  237cff:	48 63 d0             	movsxd rdx,eax
  237d02:	48 89 d0             	mov    rax,rdx
  237d05:	48 c1 e0 02          	shl    rax,0x2
  237d09:	48 01 d0             	add    rax,rdx
  237d0c:	48 05 81 c5 23 00    	add    rax,0x23c581
  237d12:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  237d15:	eb 2e                	jmp    237d45 <to_ascii+0xef>
  237d17:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  237d1a:	48 63 d0             	movsxd rdx,eax
  237d1d:	48 89 d0             	mov    rax,rdx
  237d20:	48 c1 e0 02          	shl    rax,0x2
  237d24:	48 01 d0             	add    rax,rdx
  237d27:	48 05 80 c5 23 00    	add    rax,0x23c580
  237d2d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  237d30:	eb 13                	jmp    237d45 <to_ascii+0xef>
  237d32:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  237d36:	83 7d fc 5d          	cmp    DWORD PTR [rbp-0x4],0x5d
  237d3a:	0f 8e 2f ff ff ff    	jle    237c6f <to_ascii+0x19>
  237d40:	b8 00 00 00 00       	mov    eax,0x0
  237d45:	5d                   	pop    rbp
  237d46:	c3                   	ret    

0000000000237d47 <init_kb>:
  237d47:	f3 0f 1e fa          	endbr64 
  237d4b:	55                   	push   rbp
  237d4c:	48 89 e5             	mov    rbp,rsp
  237d4f:	bf c0 c4 23 00       	mov    edi,0x23c4c0
  237d54:	e8 95 d1 ff ff       	call   234eee <reg_device>
  237d59:	bf 20 c4 23 00       	mov    edi,0x23c420
  237d5e:	e8 73 d4 ff ff       	call   2351d6 <reg_driver>
  237d63:	90                   	nop
  237d64:	5d                   	pop    rbp
  237d65:	c3                   	ret    

0000000000237d66 <key_proc>:
  237d66:	f3 0f 1e fa          	endbr64 
  237d6a:	55                   	push   rbp
  237d6b:	48 89 e5             	mov    rbp,rsp
  237d6e:	48 83 ec 10          	sub    rsp,0x10
  237d72:	c6 45 fd 00          	mov    BYTE PTR [rbp-0x3],0x0
  237d76:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
  237d7a:	c6 45 fe 00          	mov    BYTE PTR [rbp-0x2],0x0
  237d7e:	bf 60 00 00 00       	mov    edi,0x60
  237d83:	e8 88 f1 ff ff       	call   236f10 <inb>
  237d88:	88 45 fd             	mov    BYTE PTR [rbp-0x3],al
  237d8b:	0f b6 45 fd          	movzx  eax,BYTE PTR [rbp-0x3]
  237d8f:	0f be c0             	movsx  eax,al
  237d92:	89 c7                	mov    edi,eax
  237d94:	e8 bd fe ff ff       	call   237c56 <to_ascii>
  237d99:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
  237d9c:	80 7d fd e0          	cmp    BYTE PTR [rbp-0x3],0xe0
  237da0:	74 06                	je     237da8 <key_proc+0x42>
  237da2:	80 7d fd e1          	cmp    BYTE PTR [rbp-0x3],0xe1
  237da6:	75 1e                	jne    237dc6 <key_proc+0x60>
  237da8:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  237dac:	0f be c0             	movsx  eax,al
  237daf:	89 c7                	mov    edi,eax
  237db1:	e8 a0 fe ff ff       	call   237c56 <to_ascii>
  237db6:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
  237db9:	bf 60 00 00 00       	mov    edi,0x60
  237dbe:	e8 4d f1 ff ff       	call   236f10 <inb>
  237dc3:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
  237dc6:	0f b6 45 fd          	movzx  eax,BYTE PTR [rbp-0x3]
  237dca:	88 45 fa             	mov    BYTE PTR [rbp-0x6],al
  237dcd:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  237dd1:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
  237dd4:	0f b6 45 fe          	movzx  eax,BYTE PTR [rbp-0x2]
  237dd8:	88 45 f8             	mov    BYTE PTR [rbp-0x8],al
  237ddb:	8b 15 5b 3e 00 00    	mov    edx,DWORD PTR [rip+0x3e5b]        # 23bc3c <key_bufq+0xc>
  237de1:	8b 05 51 3e 00 00    	mov    eax,DWORD PTR [rip+0x3e51]        # 23bc38 <key_bufq+0x8>
  237de7:	39 c2                	cmp    edx,eax
  237de9:	74 43                	je     237e2e <key_proc+0xc8>
  237deb:	48 8b 0d 3e 3e 00 00 	mov    rcx,QWORD PTR [rip+0x3e3e]        # 23bc30 <key_bufq>
  237df2:	8b 05 44 3e 00 00    	mov    eax,DWORD PTR [rip+0x3e44]        # 23bc3c <key_bufq+0xc>
  237df8:	48 63 d0             	movsxd rdx,eax
  237dfb:	48 89 d0             	mov    rax,rdx
  237dfe:	48 c1 e0 02          	shl    rax,0x2
  237e02:	48 01 d0             	add    rax,rdx
  237e05:	48 01 c8             	add    rax,rcx
  237e08:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  237e0b:	89 10                	mov    DWORD PTR [rax],edx
  237e0d:	0f b6 55 fc          	movzx  edx,BYTE PTR [rbp-0x4]
  237e11:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
  237e14:	8b 05 22 3e 00 00    	mov    eax,DWORD PTR [rip+0x3e22]        # 23bc3c <key_bufq+0xc>
  237e1a:	83 c0 01             	add    eax,0x1
  237e1d:	8b 0d 1d 3e 00 00    	mov    ecx,DWORD PTR [rip+0x3e1d]        # 23bc40 <key_bufq+0x10>
  237e23:	99                   	cdq    
  237e24:	f7 f9                	idiv   ecx
  237e26:	89 d0                	mov    eax,edx
  237e28:	89 05 0e 3e 00 00    	mov    DWORD PTR [rip+0x3e0e],eax        # 23bc3c <key_bufq+0xc>
  237e2e:	b8 00 00 00 00       	mov    eax,0x0
  237e33:	e8 f1 f0 ff ff       	call   236f29 <eoi>
  237e38:	c9                   	leave  
  237e39:	cf                   	iret   
  237e3a:	90                   	nop
  237e3b:	c9                   	leave  
  237e3c:	c3                   	ret    

0000000000237e3d <sys_getkbc>:
  237e3d:	f3 0f 1e fa          	endbr64 
  237e41:	55                   	push   rbp
  237e42:	48 89 e5             	mov    rbp,rsp
  237e45:	8b 15 f1 3d 00 00    	mov    edx,DWORD PTR [rip+0x3df1]        # 23bc3c <key_bufq+0xc>
  237e4b:	8b 05 e7 3d 00 00    	mov    eax,DWORD PTR [rip+0x3de7]        # 23bc38 <key_bufq+0x8>
  237e51:	39 c2                	cmp    edx,eax
  237e53:	75 07                	jne    237e5c <sys_getkbc+0x1f>
  237e55:	b8 ff ff ff ff       	mov    eax,0xffffffff
  237e5a:	eb 43                	jmp    237e9f <sys_getkbc+0x62>
  237e5c:	8b 05 da 3d 00 00    	mov    eax,DWORD PTR [rip+0x3dda]        # 23bc3c <key_bufq+0xc>
  237e62:	48 63 d0             	movsxd rdx,eax
  237e65:	48 89 d0             	mov    rax,rdx
  237e68:	48 c1 e0 02          	shl    rax,0x2
  237e6c:	48 01 d0             	add    rax,rdx
  237e6f:	48 05 20 61 22 00    	add    rax,0x226120
  237e75:	8b 10                	mov    edx,DWORD PTR [rax]
  237e77:	89 55 fb             	mov    DWORD PTR [rbp-0x5],edx
  237e7a:	0f b6 40 04          	movzx  eax,BYTE PTR [rax+0x4]
  237e7e:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
  237e81:	8b 05 b5 3d 00 00    	mov    eax,DWORD PTR [rip+0x3db5]        # 23bc3c <key_bufq+0xc>
  237e87:	83 c0 01             	add    eax,0x1
  237e8a:	8b 0d b0 3d 00 00    	mov    ecx,DWORD PTR [rip+0x3db0]        # 23bc40 <key_bufq+0x10>
  237e90:	99                   	cdq    
  237e91:	f7 f9                	idiv   ecx
  237e93:	89 d0                	mov    eax,edx
  237e95:	89 05 a1 3d 00 00    	mov    DWORD PTR [rip+0x3da1],eax        # 23bc3c <key_bufq+0xc>
  237e9b:	0f b6 45 fb          	movzx  eax,BYTE PTR [rbp-0x5]
  237e9f:	5d                   	pop    rbp
  237ea0:	c3                   	ret    

0000000000237ea1 <init_disk>:
  237ea1:	f3 0f 1e fa          	endbr64 
  237ea5:	55                   	push   rbp
  237ea6:	48 89 e5             	mov    rbp,rsp
  237ea9:	b8 00 00 00 00       	mov    eax,0x0
  237eae:	e8 8d 09 00 00       	call   238840 <hd_iterate>
  237eb3:	b8 00 00 00 00       	mov    eax,0x0
  237eb8:	5d                   	pop    rbp
  237eb9:	c3                   	ret    

0000000000237eba <disk_int_handler_c>:
  237eba:	f3 0f 1e fa          	endbr64 
  237ebe:	55                   	push   rbp
  237ebf:	48 89 e5             	mov    rbp,rsp
  237ec2:	48 83 ec 20          	sub    rsp,0x20
  237ec6:	48 8b 05 73 19 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1973]        # 229840 <running_req>
  237ecd:	48 85 c0             	test   rax,rax
  237ed0:	75 0a                	jne    237edc <disk_int_handler_c+0x22>
  237ed2:	b8 01 00 00 00       	mov    eax,0x1
  237ed7:	e9 a3 01 00 00       	jmp    23807f <disk_int_handler_c+0x1c5>
  237edc:	48 8b 05 5d 19 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff195d]        # 229840 <running_req>
  237ee3:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  237ee7:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  237eeb:	c7 45 f4 f0 01 00 00 	mov    DWORD PTR [rbp-0xc],0x1f0
  237ef2:	48 8b 05 47 19 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1947]        # 229840 <running_req>
  237ef9:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  237efc:	83 f8 02             	cmp    eax,0x2
  237eff:	74 0f                	je     237f10 <disk_int_handler_c+0x56>
  237f01:	48 8b 05 38 19 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1938]        # 229840 <running_req>
  237f08:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  237f0b:	83 f8 03             	cmp    eax,0x3
  237f0e:	75 07                	jne    237f17 <disk_int_handler_c+0x5d>
  237f10:	c7 45 f4 70 01 00 00 	mov    DWORD PTR [rbp-0xc],0x170
  237f17:	48 8b 05 22 19 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1922]        # 229840 <running_req>
  237f1e:	8b 00                	mov    eax,DWORD PTR [rax]
  237f20:	85 c0                	test   eax,eax
  237f22:	75 42                	jne    237f66 <disk_int_handler_c+0xac>
  237f24:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  237f2b:	eb 22                	jmp    237f4f <disk_int_handler_c+0x95>
  237f2d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  237f30:	0f b7 c0             	movzx  eax,ax
  237f33:	89 c7                	mov    edi,eax
  237f35:	e8 e2 ef ff ff       	call   236f1c <inw>
  237f3a:	89 c2                	mov    edx,eax
  237f3c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  237f40:	48 8d 48 02          	lea    rcx,[rax+0x2]
  237f44:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  237f48:	66 89 10             	mov    WORD PTR [rax],dx
  237f4b:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  237f4f:	48 8b 05 ea 18 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff18ea]        # 229840 <running_req>
  237f56:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  237f59:	c1 e0 08             	shl    eax,0x8
  237f5c:	39 45 f0             	cmp    DWORD PTR [rbp-0x10],eax
  237f5f:	7c cc                	jl     237f2d <disk_int_handler_c+0x73>
  237f61:	e9 ca 00 00 00       	jmp    238030 <disk_int_handler_c+0x176>
  237f66:	48 8b 05 d3 18 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff18d3]        # 229840 <running_req>
  237f6d:	8b 00                	mov    eax,DWORD PTR [rax]
  237f6f:	83 f8 01             	cmp    eax,0x1
  237f72:	75 42                	jne    237fb6 <disk_int_handler_c+0xfc>
  237f74:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  237f7b:	eb 25                	jmp    237fa2 <disk_int_handler_c+0xe8>
  237f7d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  237f81:	48 8d 50 02          	lea    rdx,[rax+0x2]
  237f85:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  237f89:	0f b7 00             	movzx  eax,WORD PTR [rax]
  237f8c:	0f b7 d0             	movzx  edx,ax
  237f8f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  237f92:	0f b7 c0             	movzx  eax,ax
  237f95:	89 d6                	mov    esi,edx
  237f97:	89 c7                	mov    edi,eax
  237f99:	e8 62 ef ff ff       	call   236f00 <outw>
  237f9e:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  237fa2:	48 8b 05 97 18 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1897]        # 229840 <running_req>
  237fa9:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  237fac:	c1 e0 08             	shl    eax,0x8
  237faf:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  237fb2:	7c c9                	jl     237f7d <disk_int_handler_c+0xc3>
  237fb4:	eb 7a                	jmp    238030 <disk_int_handler_c+0x176>
  237fb6:	48 8b 05 83 18 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1883]        # 229840 <running_req>
  237fbd:	8b 00                	mov    eax,DWORD PTR [rax]
  237fbf:	83 f8 02             	cmp    eax,0x2
  237fc2:	75 34                	jne    237ff8 <disk_int_handler_c+0x13e>
  237fc4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  237fc7:	83 c0 07             	add    eax,0x7
  237fca:	0f b6 c0             	movzx  eax,al
  237fcd:	89 c7                	mov    edi,eax
  237fcf:	e8 3c ef ff ff       	call   236f10 <inb>
  237fd4:	88 45 e7             	mov    BYTE PTR [rbp-0x19],al
  237fd7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  237fda:	0f b7 c0             	movzx  eax,ax
  237fdd:	89 c7                	mov    edi,eax
  237fdf:	e8 38 ef ff ff       	call   236f1c <inw>
  237fe4:	66 89 45 e4          	mov    WORD PTR [rbp-0x1c],ax
  237fe8:	48 8b 05 51 18 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1851]        # 229840 <running_req>
  237fef:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  237ff6:	eb 38                	jmp    238030 <disk_int_handler_c+0x176>
  237ff8:	48 8b 05 41 18 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1841]        # 229840 <running_req>
  237fff:	8b 00                	mov    eax,DWORD PTR [rax]
  238001:	83 f8 03             	cmp    eax,0x3
  238004:	75 2a                	jne    238030 <disk_int_handler_c+0x176>
  238006:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  238009:	83 c0 07             	add    eax,0x7
  23800c:	0f b6 c0             	movzx  eax,al
  23800f:	89 c7                	mov    edi,eax
  238011:	e8 fa ee ff ff       	call   236f10 <inb>
  238016:	0f b6 c0             	movzx  eax,al
  238019:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  23801c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  23801f:	89 c6                	mov    esi,eax
  238021:	bf 56 c7 23 00       	mov    edi,0x23c756
  238026:	b8 00 00 00 00       	mov    eax,0x0
  23802b:	e8 10 b3 ff ff       	call   233340 <printf>
  238030:	48 8b 05 09 18 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1809]        # 229840 <running_req>
  238037:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
  23803e:	48 8b 05 fb 17 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff17fb]        # 229840 <running_req>
  238045:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  238049:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  238050:	00 00 00 
  238053:	48 8b 05 ee 17 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff17ee]        # 229848 <running_devman_req>
  23805a:	c7 80 ac 00 00 00 03 	mov    DWORD PTR [rax+0xac],0x3
  238061:	00 00 00 
  238064:	48 c7 05 d9 17 ff ff 	mov    QWORD PTR [rip+0xffffffffffff17d9],0x0        # 229848 <running_devman_req>
  23806b:	00 00 00 00 
  23806f:	48 c7 05 c6 17 ff ff 	mov    QWORD PTR [rip+0xffffffffffff17c6],0x0        # 229840 <running_req>
  238076:	00 00 00 00 
  23807a:	b8 00 00 00 00       	mov    eax,0x0
  23807f:	c9                   	leave  
  238080:	c3                   	ret    

0000000000238081 <check_dreq_stat>:
  238081:	f3 0f 1e fa          	endbr64 
  238085:	55                   	push   rbp
  238086:	48 89 e5             	mov    rbp,rsp
  238089:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  23808c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23808f:	48 63 d0             	movsxd rdx,eax
  238092:	48 89 d0             	mov    rax,rdx
  238095:	48 01 c0             	add    rax,rax
  238098:	48 01 d0             	add    rax,rdx
  23809b:	48 c1 e0 04          	shl    rax,0x4
  23809f:	48 05 5c 6b 22 00    	add    rax,0x226b5c
  2380a5:	8b 00                	mov    eax,DWORD PTR [rax]
  2380a7:	5d                   	pop    rbp
  2380a8:	c3                   	ret    

00000000002380a9 <request>:
  2380a9:	f3 0f 1e fa          	endbr64 
  2380ad:	55                   	push   rbp
  2380ae:	48 89 e5             	mov    rbp,rsp
  2380b1:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  2380b4:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  2380b7:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  2380ba:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  2380bd:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
  2380c1:	8b 05 ad 17 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff17ad]        # 229874 <tail>
  2380c7:	83 c0 01             	add    eax,0x1
  2380ca:	48 63 d0             	movsxd rdx,eax
  2380cd:	48 69 d2 89 88 88 88 	imul   rdx,rdx,0xffffffff88888889
  2380d4:	48 c1 ea 20          	shr    rdx,0x20
  2380d8:	01 c2                	add    edx,eax
  2380da:	c1 fa 07             	sar    edx,0x7
  2380dd:	89 c1                	mov    ecx,eax
  2380df:	c1 f9 1f             	sar    ecx,0x1f
  2380e2:	29 ca                	sub    edx,ecx
  2380e4:	69 ca f0 00 00 00    	imul   ecx,edx,0xf0
  2380ea:	29 c8                	sub    eax,ecx
  2380ec:	89 c2                	mov    edx,eax
  2380ee:	8b 05 7c 17 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff177c]        # 229870 <head>
  2380f4:	39 c2                	cmp    edx,eax
  2380f6:	75 0a                	jne    238102 <request+0x59>
  2380f8:	b8 ff ff ff ff       	mov    eax,0xffffffff
  2380fd:	e9 0d 01 00 00       	jmp    23820f <request+0x166>
  238102:	8b 05 6c 17 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff176c]        # 229874 <tail>
  238108:	48 63 d0             	movsxd rdx,eax
  23810b:	48 89 d0             	mov    rax,rdx
  23810e:	48 01 c0             	add    rax,rax
  238111:	48 01 d0             	add    rax,rdx
  238114:	48 c1 e0 04          	shl    rax,0x4
  238118:	48 8d 90 44 6b 22 00 	lea    rdx,[rax+0x226b44]
  23811f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  238122:	89 02                	mov    DWORD PTR [rdx],eax
  238124:	8b 05 4a 17 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff174a]        # 229874 <tail>
  23812a:	48 63 d0             	movsxd rdx,eax
  23812d:	48 89 d0             	mov    rax,rdx
  238130:	48 01 c0             	add    rax,rax
  238133:	48 01 d0             	add    rax,rdx
  238136:	48 c1 e0 04          	shl    rax,0x4
  23813a:	48 8d 90 40 6b 22 00 	lea    rdx,[rax+0x226b40]
  238141:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  238144:	89 02                	mov    DWORD PTR [rdx],eax
  238146:	8b 05 28 17 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff1728]        # 229874 <tail>
  23814c:	48 63 d0             	movsxd rdx,eax
  23814f:	48 89 d0             	mov    rax,rdx
  238152:	48 01 c0             	add    rax,rax
  238155:	48 01 d0             	add    rax,rdx
  238158:	48 c1 e0 04          	shl    rax,0x4
  23815c:	48 8d 90 48 6b 22 00 	lea    rdx,[rax+0x226b48]
  238163:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  238166:	89 02                	mov    DWORD PTR [rdx],eax
  238168:	8b 05 06 17 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff1706]        # 229874 <tail>
  23816e:	48 63 d0             	movsxd rdx,eax
  238171:	48 89 d0             	mov    rax,rdx
  238174:	48 01 c0             	add    rax,rax
  238177:	48 01 d0             	add    rax,rdx
  23817a:	48 c1 e0 04          	shl    rax,0x4
  23817e:	48 8d 90 4c 6b 22 00 	lea    rdx,[rax+0x226b4c]
  238185:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  238188:	89 02                	mov    DWORD PTR [rdx],eax
  23818a:	8b 05 e4 16 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff16e4]        # 229874 <tail>
  238190:	48 63 d0             	movsxd rdx,eax
  238193:	48 89 d0             	mov    rax,rdx
  238196:	48 01 c0             	add    rax,rax
  238199:	48 01 d0             	add    rax,rdx
  23819c:	48 c1 e0 04          	shl    rax,0x4
  2381a0:	48 05 5c 6b 22 00    	add    rax,0x226b5c
  2381a6:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
  2381ac:	8b 05 c2 16 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff16c2]        # 229874 <tail>
  2381b2:	48 63 d0             	movsxd rdx,eax
  2381b5:	48 89 d0             	mov    rax,rdx
  2381b8:	48 01 c0             	add    rax,rax
  2381bb:	48 01 d0             	add    rax,rdx
  2381be:	48 c1 e0 04          	shl    rax,0x4
  2381c2:	48 8d 90 50 6b 22 00 	lea    rdx,[rax+0x226b50]
  2381c9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  2381cd:	48 89 02             	mov    QWORD PTR [rdx],rax
  2381d0:	8b 05 9e 16 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff169e]        # 229874 <tail>
  2381d6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  2381d9:	8b 05 95 16 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff1695]        # 229874 <tail>
  2381df:	8d 50 01             	lea    edx,[rax+0x1]
  2381e2:	48 63 c2             	movsxd rax,edx
  2381e5:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  2381ec:	48 c1 e8 20          	shr    rax,0x20
  2381f0:	01 d0                	add    eax,edx
  2381f2:	c1 f8 07             	sar    eax,0x7
  2381f5:	89 d1                	mov    ecx,edx
  2381f7:	c1 f9 1f             	sar    ecx,0x1f
  2381fa:	29 c8                	sub    eax,ecx
  2381fc:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  238202:	89 d0                	mov    eax,edx
  238204:	29 c8                	sub    eax,ecx
  238206:	89 05 68 16 ff ff    	mov    DWORD PTR [rip+0xffffffffffff1668],eax        # 229874 <tail>
  23820c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23820f:	5d                   	pop    rbp
  238210:	c3                   	ret    

0000000000238211 <execute_request>:
  238211:	f3 0f 1e fa          	endbr64 
  238215:	55                   	push   rbp
  238216:	48 89 e5             	mov    rbp,rsp
  238219:	48 83 ec 10          	sub    rsp,0x10
  23821d:	48 8b 05 1c 16 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff161c]        # 229840 <running_req>
  238224:	48 85 c0             	test   rax,rax
  238227:	74 6a                	je     238293 <execute_request+0x82>
  238229:	48 8b 05 10 16 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1610]        # 229840 <running_req>
  238230:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  238233:	83 c2 01             	add    edx,0x1
  238236:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
  238239:	48 8b 05 00 16 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1600]        # 229840 <running_req>
  238240:	8b 00                	mov    eax,DWORD PTR [rax]
  238242:	83 f8 02             	cmp    eax,0x2
  238245:	74 0a                	je     238251 <execute_request+0x40>
  238247:	b8 02 00 00 00       	mov    eax,0x2
  23824c:	e9 b4 01 00 00       	jmp    238405 <execute_request+0x1f4>
  238251:	48 8b 05 e8 15 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff15e8]        # 229840 <running_req>
  238258:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  23825b:	83 f8 0a             	cmp    eax,0xa
  23825e:	7e 29                	jle    238289 <execute_request+0x78>
  238260:	48 8b 05 d9 15 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff15d9]        # 229840 <running_req>
  238267:	c7 40 20 02 00 00 00 	mov    DWORD PTR [rax+0x20],0x2
  23826e:	48 8b 05 cb 15 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff15cb]        # 229840 <running_req>
  238275:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
  23827c:	48 c7 05 b9 15 ff ff 	mov    QWORD PTR [rip+0xffffffffffff15b9],0x0        # 229840 <running_req>
  238283:	00 00 00 00 
  238287:	eb 0a                	jmp    238293 <execute_request+0x82>
  238289:	b8 02 00 00 00       	mov    eax,0x2
  23828e:	e9 72 01 00 00       	jmp    238405 <execute_request+0x1f4>
  238293:	8b 15 d7 15 ff ff    	mov    edx,DWORD PTR [rip+0xffffffffffff15d7]        # 229870 <head>
  238299:	8b 05 d5 15 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff15d5]        # 229874 <tail>
  23829f:	39 c2                	cmp    edx,eax
  2382a1:	75 0a                	jne    2382ad <execute_request+0x9c>
  2382a3:	b8 01 00 00 00       	mov    eax,0x1
  2382a8:	e9 58 01 00 00       	jmp    238405 <execute_request+0x1f4>
  2382ad:	8b 05 bd 15 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff15bd]        # 229870 <head>
  2382b3:	48 63 d0             	movsxd rdx,eax
  2382b6:	48 89 d0             	mov    rax,rdx
  2382b9:	48 01 c0             	add    rax,rax
  2382bc:	48 01 d0             	add    rax,rdx
  2382bf:	48 c1 e0 04          	shl    rax,0x4
  2382c3:	48 05 40 6b 22 00    	add    rax,0x226b40
  2382c9:	48 89 05 70 15 ff ff 	mov    QWORD PTR [rip+0xffffffffffff1570],rax        # 229840 <running_req>
  2382d0:	8b 05 9a 15 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff159a]        # 229870 <head>
  2382d6:	8d 50 01             	lea    edx,[rax+0x1]
  2382d9:	48 63 c2             	movsxd rax,edx
  2382dc:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  2382e3:	48 c1 e8 20          	shr    rax,0x20
  2382e7:	01 d0                	add    eax,edx
  2382e9:	c1 f8 07             	sar    eax,0x7
  2382ec:	89 d1                	mov    ecx,edx
  2382ee:	c1 f9 1f             	sar    ecx,0x1f
  2382f1:	29 c8                	sub    eax,ecx
  2382f3:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  2382f9:	89 d0                	mov    eax,edx
  2382fb:	29 c8                	sub    eax,ecx
  2382fd:	89 05 6d 15 ff ff    	mov    DWORD PTR [rip+0xffffffffffff156d],eax        # 229870 <head>
  238303:	48 8b 05 36 15 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1536]        # 229840 <running_req>
  23830a:	c7 40 1c 02 00 00 00 	mov    DWORD PTR [rax+0x1c],0x2
  238311:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  238318:	48 8b 05 21 15 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1521]        # 229840 <running_req>
  23831f:	8b 00                	mov    eax,DWORD PTR [rax]
  238321:	83 f8 03             	cmp    eax,0x3
  238324:	0f 84 ad 00 00 00    	je     2383d7 <execute_request+0x1c6>
  23832a:	83 f8 03             	cmp    eax,0x3
  23832d:	0f 8f bf 00 00 00    	jg     2383f2 <execute_request+0x1e1>
  238333:	83 f8 02             	cmp    eax,0x2
  238336:	0f 84 85 00 00 00    	je     2383c1 <execute_request+0x1b0>
  23833c:	83 f8 02             	cmp    eax,0x2
  23833f:	0f 8f ad 00 00 00    	jg     2383f2 <execute_request+0x1e1>
  238345:	85 c0                	test   eax,eax
  238347:	74 0a                	je     238353 <execute_request+0x142>
  238349:	83 f8 01             	cmp    eax,0x1
  23834c:	74 3c                	je     23838a <execute_request+0x179>
  23834e:	e9 9f 00 00 00       	jmp    2383f2 <execute_request+0x1e1>
  238353:	48 8b 05 e6 14 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff14e6]        # 229840 <running_req>
  23835a:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  23835e:	48 8b 05 db 14 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff14db]        # 229840 <running_req>
  238365:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  238368:	48 8b 05 d1 14 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff14d1]        # 229840 <running_req>
  23836f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  238372:	89 c6                	mov    esi,eax
  238374:	48 8b 05 c5 14 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff14c5]        # 229840 <running_req>
  23837b:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  23837e:	89 c7                	mov    edi,eax
  238380:	e8 a7 00 00 00       	call   23842c <async_read_disk>
  238385:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  238388:	eb 69                	jmp    2383f3 <execute_request+0x1e2>
  23838a:	48 8b 05 af 14 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff14af]        # 229840 <running_req>
  238391:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  238395:	48 8b 05 a4 14 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff14a4]        # 229840 <running_req>
  23839c:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  23839f:	48 8b 05 9a 14 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff149a]        # 229840 <running_req>
  2383a6:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  2383a9:	89 c6                	mov    esi,eax
  2383ab:	48 8b 05 8e 14 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff148e]        # 229840 <running_req>
  2383b2:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  2383b5:	89 c7                	mov    edi,eax
  2383b7:	e8 88 01 00 00       	call   238544 <async_write_disk>
  2383bc:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  2383bf:	eb 32                	jmp    2383f3 <execute_request+0x1e2>
  2383c1:	48 8b 05 78 14 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1478]        # 229840 <running_req>
  2383c8:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  2383cb:	89 c7                	mov    edi,eax
  2383cd:	e8 77 06 00 00       	call   238a49 <async_check_disk>
  2383d2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  2383d5:	eb 1c                	jmp    2383f3 <execute_request+0x1e2>
  2383d7:	48 8b 05 62 14 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1462]        # 229840 <running_req>
  2383de:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  2383e1:	89 c7                	mov    edi,eax
  2383e3:	b8 00 00 00 00       	mov    eax,0x0
  2383e8:	e8 1a 00 00 00       	call   238407 <async_reset_disk>
  2383ed:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  2383f0:	eb 01                	jmp    2383f3 <execute_request+0x1e2>
  2383f2:	90                   	nop
  2383f3:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  2383f7:	75 07                	jne    238400 <execute_request+0x1ef>
  2383f9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  2383fe:	eb 05                	jmp    238405 <execute_request+0x1f4>
  238400:	b8 00 00 00 00       	mov    eax,0x0
  238405:	c9                   	leave  
  238406:	c3                   	ret    

0000000000238407 <async_reset_disk>:
  238407:	f3 0f 1e fa          	endbr64 
  23840b:	55                   	push   rbp
  23840c:	48 89 e5             	mov    rbp,rsp
  23840f:	48 83 ec 10          	sub    rsp,0x10
  238413:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  238416:	be 0c 00 00 00       	mov    esi,0xc
  23841b:	bf f6 03 00 00       	mov    edi,0x3f6
  238420:	e8 cb ea ff ff       	call   236ef0 <outb>
  238425:	b8 00 00 00 00       	mov    eax,0x0
  23842a:	c9                   	leave  
  23842b:	c3                   	ret    

000000000023842c <async_read_disk>:
  23842c:	f3 0f 1e fa          	endbr64 
  238430:	55                   	push   rbp
  238431:	48 89 e5             	mov    rbp,rsp
  238434:	48 83 ec 30          	sub    rsp,0x30
  238438:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  23843b:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  23843e:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  238441:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
  238445:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
  23844b:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  238452:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  238456:	74 06                	je     23845e <async_read_disk+0x32>
  238458:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  23845c:	75 06                	jne    238464 <async_read_disk+0x38>
  23845e:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
  238464:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  238468:	74 06                	je     238470 <async_read_disk+0x44>
  23846a:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  23846e:	75 07                	jne    238477 <async_read_disk+0x4b>
  238470:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
  238477:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  23847a:	0f b6 d0             	movzx  edx,al
  23847d:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  238481:	83 c0 02             	add    eax,0x2
  238484:	0f b7 c0             	movzx  eax,ax
  238487:	89 d6                	mov    esi,edx
  238489:	89 c7                	mov    edi,eax
  23848b:	e8 60 ea ff ff       	call   236ef0 <outb>
  238490:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  238493:	0f b6 d0             	movzx  edx,al
  238496:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  23849a:	83 c0 03             	add    eax,0x3
  23849d:	0f b7 c0             	movzx  eax,ax
  2384a0:	89 d6                	mov    esi,edx
  2384a2:	89 c7                	mov    edi,eax
  2384a4:	e8 47 ea ff ff       	call   236ef0 <outb>
  2384a9:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  2384ac:	c1 e8 08             	shr    eax,0x8
  2384af:	0f b6 d0             	movzx  edx,al
  2384b2:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  2384b6:	83 c0 04             	add    eax,0x4
  2384b9:	0f b7 c0             	movzx  eax,ax
  2384bc:	89 d6                	mov    esi,edx
  2384be:	89 c7                	mov    edi,eax
  2384c0:	e8 2b ea ff ff       	call   236ef0 <outb>
  2384c5:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  2384c8:	c1 e8 10             	shr    eax,0x10
  2384cb:	0f b6 d0             	movzx  edx,al
  2384ce:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  2384d2:	83 c0 05             	add    eax,0x5
  2384d5:	0f b7 c0             	movzx  eax,ax
  2384d8:	89 d6                	mov    esi,edx
  2384da:	89 c7                	mov    edi,eax
  2384dc:	e8 0f ea ff ff       	call   236ef0 <outb>
  2384e1:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  2384e5:	74 07                	je     2384ee <async_read_disk+0xc2>
  2384e7:	b8 10 00 00 00       	mov    eax,0x10
  2384ec:	eb 05                	jmp    2384f3 <async_read_disk+0xc7>
  2384ee:	b8 00 00 00 00       	mov    eax,0x0
  2384f3:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
  2384f6:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  2384f9:	c1 e8 18             	shr    eax,0x18
  2384fc:	83 e0 0f             	and    eax,0xf
  2384ff:	89 c2                	mov    edx,eax
  238501:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  238505:	09 d0                	or     eax,edx
  238507:	83 c8 e0             	or     eax,0xffffffe0
  23850a:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
  23850d:	0f b6 45 f6          	movzx  eax,BYTE PTR [rbp-0xa]
  238511:	0f b6 d0             	movzx  edx,al
  238514:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  238518:	83 c0 06             	add    eax,0x6
  23851b:	0f b7 c0             	movzx  eax,ax
  23851e:	89 d6                	mov    esi,edx
  238520:	89 c7                	mov    edi,eax
  238522:	e8 c9 e9 ff ff       	call   236ef0 <outb>
  238527:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  23852b:	83 c0 07             	add    eax,0x7
  23852e:	0f b7 c0             	movzx  eax,ax
  238531:	be 20 00 00 00       	mov    esi,0x20
  238536:	89 c7                	mov    edi,eax
  238538:	e8 b3 e9 ff ff       	call   236ef0 <outb>
  23853d:	b8 00 00 00 00       	mov    eax,0x0
  238542:	c9                   	leave  
  238543:	c3                   	ret    

0000000000238544 <async_write_disk>:
  238544:	f3 0f 1e fa          	endbr64 
  238548:	55                   	push   rbp
  238549:	48 89 e5             	mov    rbp,rsp
  23854c:	48 83 ec 30          	sub    rsp,0x30
  238550:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  238553:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  238556:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  238559:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
  23855d:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
  238563:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  23856a:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  23856e:	74 06                	je     238576 <async_write_disk+0x32>
  238570:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  238574:	75 06                	jne    23857c <async_write_disk+0x38>
  238576:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
  23857c:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  238580:	74 06                	je     238588 <async_write_disk+0x44>
  238582:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  238586:	75 07                	jne    23858f <async_write_disk+0x4b>
  238588:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
  23858f:	bf f7 00 00 00       	mov    edi,0xf7
  238594:	e8 77 e9 ff ff       	call   236f10 <inb>
  238599:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
  23859c:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  2385a0:	83 e0 01             	and    eax,0x1
  2385a3:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
  2385a6:	80 7d f6 00          	cmp    BYTE PTR [rbp-0xa],0x0
  2385aa:	74 0a                	je     2385b6 <async_write_disk+0x72>
  2385ac:	b8 ff ff ff ff       	mov    eax,0xffffffff
  2385b1:	e9 d5 00 00 00       	jmp    23868b <async_write_disk+0x147>
  2385b6:	80 65 f7 88          	and    BYTE PTR [rbp-0x9],0x88
  2385ba:	80 7d f7 08          	cmp    BYTE PTR [rbp-0x9],0x8
  2385be:	74 02                	je     2385c2 <async_write_disk+0x7e>
  2385c0:	eb cd                	jmp    23858f <async_write_disk+0x4b>
  2385c2:	90                   	nop
  2385c3:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  2385c6:	0f b6 d0             	movzx  edx,al
  2385c9:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  2385cd:	83 c0 02             	add    eax,0x2
  2385d0:	0f b7 c0             	movzx  eax,ax
  2385d3:	89 d6                	mov    esi,edx
  2385d5:	89 c7                	mov    edi,eax
  2385d7:	e8 14 e9 ff ff       	call   236ef0 <outb>
  2385dc:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  2385df:	0f b6 d0             	movzx  edx,al
  2385e2:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  2385e6:	83 c0 03             	add    eax,0x3
  2385e9:	0f b7 c0             	movzx  eax,ax
  2385ec:	89 d6                	mov    esi,edx
  2385ee:	89 c7                	mov    edi,eax
  2385f0:	e8 fb e8 ff ff       	call   236ef0 <outb>
  2385f5:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  2385f8:	c1 e8 08             	shr    eax,0x8
  2385fb:	0f b6 d0             	movzx  edx,al
  2385fe:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  238602:	83 c0 04             	add    eax,0x4
  238605:	0f b7 c0             	movzx  eax,ax
  238608:	89 d6                	mov    esi,edx
  23860a:	89 c7                	mov    edi,eax
  23860c:	e8 df e8 ff ff       	call   236ef0 <outb>
  238611:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  238614:	c1 e8 10             	shr    eax,0x10
  238617:	0f b6 d0             	movzx  edx,al
  23861a:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  23861e:	83 c0 05             	add    eax,0x5
  238621:	0f b7 c0             	movzx  eax,ax
  238624:	89 d6                	mov    esi,edx
  238626:	89 c7                	mov    edi,eax
  238628:	e8 c3 e8 ff ff       	call   236ef0 <outb>
  23862d:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  238631:	74 07                	je     23863a <async_write_disk+0xf6>
  238633:	b8 10 00 00 00       	mov    eax,0x10
  238638:	eb 05                	jmp    23863f <async_write_disk+0xfb>
  23863a:	b8 00 00 00 00       	mov    eax,0x0
  23863f:	88 45 f5             	mov    BYTE PTR [rbp-0xb],al
  238642:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  238645:	c1 e8 18             	shr    eax,0x18
  238648:	83 e0 0f             	and    eax,0xf
  23864b:	89 c2                	mov    edx,eax
  23864d:	0f b6 45 f5          	movzx  eax,BYTE PTR [rbp-0xb]
  238651:	09 d0                	or     eax,edx
  238653:	83 c8 e0             	or     eax,0xffffffe0
  238656:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
  238659:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  23865d:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  238661:	83 c0 06             	add    eax,0x6
  238664:	0f b7 c0             	movzx  eax,ax
  238667:	89 d6                	mov    esi,edx
  238669:	89 c7                	mov    edi,eax
  23866b:	e8 80 e8 ff ff       	call   236ef0 <outb>
  238670:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  238674:	83 c0 07             	add    eax,0x7
  238677:	0f b7 c0             	movzx  eax,ax
  23867a:	be 30 00 00 00       	mov    esi,0x30
  23867f:	89 c7                	mov    edi,eax
  238681:	e8 6a e8 ff ff       	call   236ef0 <outb>
  238686:	b8 00 00 00 00       	mov    eax,0x0
  23868b:	c9                   	leave  
  23868c:	c3                   	ret    

000000000023868d <read_disk>:
  23868d:	f3 0f 1e fa          	endbr64 
  238691:	55                   	push   rbp
  238692:	48 89 e5             	mov    rbp,rsp
  238695:	48 83 ec 20          	sub    rsp,0x20
  238699:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  23869d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  2386a1:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  2386a4:	48 98                	cdqe   
  2386a6:	48 89 c2             	mov    rdx,rax
  2386a9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  2386ad:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  2386b0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  2386b4:	8b 00                	mov    eax,DWORD PTR [rax]
  2386b6:	89 ce                	mov    esi,ecx
  2386b8:	89 c7                	mov    edi,eax
  2386ba:	e8 7c 05 00 00       	call   238c3b <read_disk_asm>
  2386bf:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  2386c2:	48 8b 05 77 11 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1177]        # 229840 <running_req>
  2386c9:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
  2386d0:	48 8b 05 69 11 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1169]        # 229840 <running_req>
  2386d7:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  2386db:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  2386e2:	00 00 00 
  2386e5:	48 c7 05 50 11 ff ff 	mov    QWORD PTR [rip+0xffffffffffff1150],0x0        # 229840 <running_req>
  2386ec:	00 00 00 00 
  2386f0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2386f3:	c9                   	leave  
  2386f4:	c3                   	ret    

00000000002386f5 <write_disk>:
  2386f5:	f3 0f 1e fa          	endbr64 
  2386f9:	55                   	push   rbp
  2386fa:	48 89 e5             	mov    rbp,rsp
  2386fd:	48 83 ec 20          	sub    rsp,0x20
  238701:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  238705:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  238709:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  23870c:	48 98                	cdqe   
  23870e:	48 89 c2             	mov    rdx,rax
  238711:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  238715:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  238718:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  23871c:	8b 00                	mov    eax,DWORD PTR [rax]
  23871e:	89 ce                	mov    esi,ecx
  238720:	89 c7                	mov    edi,eax
  238722:	e8 8c 05 00 00       	call   238cb3 <write_disk_asm>
  238727:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  23872a:	48 8b 05 0f 11 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff110f]        # 229840 <running_req>
  238731:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
  238738:	48 8b 05 01 11 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff1101]        # 229840 <running_req>
  23873f:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  238743:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  23874a:	00 00 00 
  23874d:	48 c7 05 e8 10 ff ff 	mov    QWORD PTR [rip+0xffffffffffff10e8],0x0        # 229840 <running_req>
  238754:	00 00 00 00 
  238758:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23875b:	c9                   	leave  
  23875c:	c3                   	ret    

000000000023875d <chk_result>:
  23875d:	f3 0f 1e fa          	endbr64 
  238761:	55                   	push   rbp
  238762:	48 89 e5             	mov    rbp,rsp
  238765:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  238768:	90                   	nop
  238769:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23876c:	48 63 d0             	movsxd rdx,eax
  23876f:	48 89 d0             	mov    rax,rdx
  238772:	48 01 c0             	add    rax,rax
  238775:	48 01 d0             	add    rax,rdx
  238778:	48 c1 e0 04          	shl    rax,0x4
  23877c:	48 05 5c 6b 22 00    	add    rax,0x226b5c
  238782:	8b 00                	mov    eax,DWORD PTR [rax]
  238784:	83 f8 03             	cmp    eax,0x3
  238787:	75 e0                	jne    238769 <chk_result+0xc>
  238789:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23878c:	48 63 d0             	movsxd rdx,eax
  23878f:	48 89 d0             	mov    rax,rdx
  238792:	48 01 c0             	add    rax,rax
  238795:	48 01 d0             	add    rax,rdx
  238798:	48 c1 e0 04          	shl    rax,0x4
  23879c:	48 05 60 6b 22 00    	add    rax,0x226b60
  2387a2:	8b 00                	mov    eax,DWORD PTR [rax]
  2387a4:	83 f8 01             	cmp    eax,0x1
  2387a7:	0f 94 c0             	sete   al
  2387aa:	0f b6 c0             	movzx  eax,al
  2387ad:	5d                   	pop    rbp
  2387ae:	c3                   	ret    

00000000002387af <disk_existent>:
  2387af:	f3 0f 1e fa          	endbr64 
  2387b3:	55                   	push   rbp
  2387b4:	48 89 e5             	mov    rbp,rsp
  2387b7:	48 83 ec 10          	sub    rsp,0x10
  2387bb:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  2387be:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  2387c2:	74 5f                	je     238823 <disk_existent+0x74>
  2387c4:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  2387c8:	7f 6e                	jg     238838 <disk_existent+0x89>
  2387ca:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  2387ce:	74 3e                	je     23880e <disk_existent+0x5f>
  2387d0:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  2387d4:	7f 62                	jg     238838 <disk_existent+0x89>
  2387d6:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  2387da:	74 08                	je     2387e4 <disk_existent+0x35>
  2387dc:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
  2387e0:	74 17                	je     2387f9 <disk_existent+0x4a>
  2387e2:	eb 54                	jmp    238838 <disk_existent+0x89>
  2387e4:	bf 74 c7 23 00       	mov    edi,0x23c774
  2387e9:	e8 38 cb ff ff       	call   235326 <sys_find_dev>
  2387ee:	83 f8 ff             	cmp    eax,0xffffffff
  2387f1:	0f 95 c0             	setne  al
  2387f4:	0f b6 c0             	movzx  eax,al
  2387f7:	eb 45                	jmp    23883e <disk_existent+0x8f>
  2387f9:	bf 78 c7 23 00       	mov    edi,0x23c778
  2387fe:	e8 23 cb ff ff       	call   235326 <sys_find_dev>
  238803:	83 f8 ff             	cmp    eax,0xffffffff
  238806:	0f 95 c0             	setne  al
  238809:	0f b6 c0             	movzx  eax,al
  23880c:	eb 30                	jmp    23883e <disk_existent+0x8f>
  23880e:	bf 7c c7 23 00       	mov    edi,0x23c77c
  238813:	e8 0e cb ff ff       	call   235326 <sys_find_dev>
  238818:	83 f8 ff             	cmp    eax,0xffffffff
  23881b:	0f 95 c0             	setne  al
  23881e:	0f b6 c0             	movzx  eax,al
  238821:	eb 1b                	jmp    23883e <disk_existent+0x8f>
  238823:	bf 80 c7 23 00       	mov    edi,0x23c780
  238828:	e8 f9 ca ff ff       	call   235326 <sys_find_dev>
  23882d:	83 f8 ff             	cmp    eax,0xffffffff
  238830:	0f 95 c0             	setne  al
  238833:	0f b6 c0             	movzx  eax,al
  238836:	eb 06                	jmp    23883e <disk_existent+0x8f>
  238838:	90                   	nop
  238839:	b8 00 00 00 00       	mov    eax,0x0
  23883e:	c9                   	leave  
  23883f:	c3                   	ret    

0000000000238840 <hd_iterate>:
  238840:	f3 0f 1e fa          	endbr64 
  238844:	55                   	push   rbp
  238845:	48 89 e5             	mov    rbp,rsp
  238848:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  23884f:	41 b8 00 00 00 00    	mov    r8d,0x0
  238855:	b9 01 00 00 00       	mov    ecx,0x1
  23885a:	ba 00 00 00 00       	mov    edx,0x0
  23885f:	be 02 00 00 00       	mov    esi,0x2
  238864:	bf 00 00 00 00       	mov    edi,0x0
  238869:	e8 3b f8 ff ff       	call   2380a9 <request>
  23886e:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
  238871:	41 b8 00 00 00 00    	mov    r8d,0x0
  238877:	b9 01 00 00 00       	mov    ecx,0x1
  23887c:	ba 00 00 00 00       	mov    edx,0x0
  238881:	be 02 00 00 00       	mov    esi,0x2
  238886:	bf 01 00 00 00       	mov    edi,0x1
  23888b:	e8 19 f8 ff ff       	call   2380a9 <request>
  238890:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
  238893:	41 b8 00 00 00 00    	mov    r8d,0x0
  238899:	b9 01 00 00 00       	mov    ecx,0x1
  23889e:	ba 00 00 00 00       	mov    edx,0x0
  2388a3:	be 02 00 00 00       	mov    esi,0x2
  2388a8:	bf 02 00 00 00       	mov    edi,0x2
  2388ad:	e8 f7 f7 ff ff       	call   2380a9 <request>
  2388b2:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
  2388b5:	41 b8 00 00 00 00    	mov    r8d,0x0
  2388bb:	b9 01 00 00 00       	mov    ecx,0x1
  2388c0:	ba 00 00 00 00       	mov    edx,0x0
  2388c5:	be 02 00 00 00       	mov    esi,0x2
  2388ca:	bf 03 00 00 00       	mov    edi,0x3
  2388cf:	e8 d5 f7 ff ff       	call   2380a9 <request>
  2388d4:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
  2388d7:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  2388de:	e9 5a 01 00 00       	jmp    238a3d <hd_iterate+0x1fd>
  2388e3:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  2388e7:	74 3b                	je     238924 <hd_iterate+0xe4>
  2388e9:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  2388ed:	7f 3e                	jg     23892d <hd_iterate+0xed>
  2388ef:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  2388f3:	74 26                	je     23891b <hd_iterate+0xdb>
  2388f5:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  2388f9:	7f 32                	jg     23892d <hd_iterate+0xed>
  2388fb:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  2388ff:	74 08                	je     238909 <hd_iterate+0xc9>
  238901:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  238905:	74 0b                	je     238912 <hd_iterate+0xd2>
  238907:	eb 24                	jmp    23892d <hd_iterate+0xed>
  238909:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  238910:	eb 25                	jmp    238937 <hd_iterate+0xf7>
  238912:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [rbp-0x10],0x1
  238919:	eb 1c                	jmp    238937 <hd_iterate+0xf7>
  23891b:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [rbp-0x10],0x2
  238922:	eb 13                	jmp    238937 <hd_iterate+0xf7>
  238924:	c7 45 f0 03 00 00 00 	mov    DWORD PTR [rbp-0x10],0x3
  23892b:	eb 0a                	jmp    238937 <hd_iterate+0xf7>
  23892d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  238932:	e9 10 01 00 00       	jmp    238a47 <hd_iterate+0x207>
  238937:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  23893a:	48 98                	cdqe   
  23893c:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  238940:	89 c7                	mov    edi,eax
  238942:	e8 16 fe ff ff       	call   23875d <chk_result>
  238947:	85 c0                	test   eax,eax
  238949:	74 6d                	je     2389b8 <hd_iterate+0x178>
  23894b:	48 8d 95 20 ff ff ff 	lea    rdx,[rbp-0xe0]
  238952:	b8 00 00 00 00       	mov    eax,0x0
  238957:	b9 15 00 00 00       	mov    ecx,0x15
  23895c:	48 89 d7             	mov    rdi,rdx
  23895f:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  238962:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  238965:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  23896b:	c7 85 28 ff ff ff 01 	mov    DWORD PTR [rbp-0xd8],0x1
  238972:	00 00 00 
  238975:	c7 85 2c ff ff ff 01 	mov    DWORD PTR [rbp-0xd4],0x1
  23897c:	00 00 00 
  23897f:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  238983:	7f 07                	jg     23898c <hd_iterate+0x14c>
  238985:	b8 f0 01 00 00       	mov    eax,0x1f0
  23898a:	eb 05                	jmp    238991 <hd_iterate+0x151>
  23898c:	b8 70 01 00 00       	mov    eax,0x170
  238991:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
  238997:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  23899e:	48 89 c7             	mov    rdi,rax
  2389a1:	e8 48 c5 ff ff       	call   234eee <reg_device>
  2389a6:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  2389a9:	48 63 d2             	movsxd rdx,edx
  2389ac:	89 04 95 60 98 22 00 	mov    DWORD PTR [rdx*4+0x229860],eax
  2389b3:	e9 81 00 00 00       	jmp    238a39 <hd_iterate+0x1f9>
  2389b8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  2389bb:	48 98                	cdqe   
  2389bd:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  2389c1:	89 c7                	mov    edi,eax
  2389c3:	e8 95 fd ff ff       	call   23875d <chk_result>
  2389c8:	85 c0                	test   eax,eax
  2389ca:	75 6d                	jne    238a39 <hd_iterate+0x1f9>
  2389cc:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  2389d0:	74 3e                	je     238a10 <hd_iterate+0x1d0>
  2389d2:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  2389d6:	7f 41                	jg     238a19 <hd_iterate+0x1d9>
  2389d8:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  2389dc:	74 28                	je     238a06 <hd_iterate+0x1c6>
  2389de:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  2389e2:	7f 35                	jg     238a19 <hd_iterate+0x1d9>
  2389e4:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  2389e8:	74 08                	je     2389f2 <hd_iterate+0x1b2>
  2389ea:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  2389ee:	74 0c                	je     2389fc <hd_iterate+0x1bc>
  2389f0:	eb 27                	jmp    238a19 <hd_iterate+0x1d9>
  2389f2:	48 c7 45 f8 74 c7 23 	mov    QWORD PTR [rbp-0x8],0x23c774
  2389f9:	00 
  2389fa:	eb 1d                	jmp    238a19 <hd_iterate+0x1d9>
  2389fc:	48 c7 45 f8 78 c7 23 	mov    QWORD PTR [rbp-0x8],0x23c778
  238a03:	00 
  238a04:	eb 13                	jmp    238a19 <hd_iterate+0x1d9>
  238a06:	48 c7 45 f8 7c c7 23 	mov    QWORD PTR [rbp-0x8],0x23c77c
  238a0d:	00 
  238a0e:	eb 09                	jmp    238a19 <hd_iterate+0x1d9>
  238a10:	48 c7 45 f8 80 c7 23 	mov    QWORD PTR [rbp-0x8],0x23c780
  238a17:	00 
  238a18:	90                   	nop
  238a19:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  238a1d:	48 89 c7             	mov    rdi,rax
  238a20:	e8 01 c9 ff ff       	call   235326 <sys_find_dev>
  238a25:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  238a28:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  238a2b:	89 c7                	mov    edi,eax
  238a2d:	e8 c8 cf ff ff       	call   2359fa <get_dev>
  238a32:	89 c7                	mov    edi,eax
  238a34:	e8 14 cf ff ff       	call   23594d <dispose_device>
  238a39:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  238a3d:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  238a41:	0f 8e 9c fe ff ff    	jle    2388e3 <hd_iterate+0xa3>
  238a47:	c9                   	leave  
  238a48:	c3                   	ret    

0000000000238a49 <async_check_disk>:
  238a49:	f3 0f 1e fa          	endbr64 
  238a4d:	55                   	push   rbp
  238a4e:	48 89 e5             	mov    rbp,rsp
  238a51:	48 83 ec 20          	sub    rsp,0x20
  238a55:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  238a58:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
  238a5e:	66 c7 45 fc e0 00    	mov    WORD PTR [rbp-0x4],0xe0
  238a64:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  238a68:	74 06                	je     238a70 <async_check_disk+0x27>
  238a6a:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  238a6e:	75 06                	jne    238a76 <async_check_disk+0x2d>
  238a70:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
  238a76:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  238a7a:	74 06                	je     238a82 <async_check_disk+0x39>
  238a7c:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  238a80:	75 06                	jne    238a88 <async_check_disk+0x3f>
  238a82:	66 c7 45 fc f0 00    	mov    WORD PTR [rbp-0x4],0xf0
  238a88:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  238a8c:	83 c0 02             	add    eax,0x2
  238a8f:	0f b7 c0             	movzx  eax,ax
  238a92:	be 01 00 00 00       	mov    esi,0x1
  238a97:	89 c7                	mov    edi,eax
  238a99:	e8 52 e4 ff ff       	call   236ef0 <outb>
  238a9e:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  238aa2:	83 c0 03             	add    eax,0x3
  238aa5:	0f b7 c0             	movzx  eax,ax
  238aa8:	be 00 00 00 00       	mov    esi,0x0
  238aad:	89 c7                	mov    edi,eax
  238aaf:	e8 3c e4 ff ff       	call   236ef0 <outb>
  238ab4:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  238ab8:	83 c0 04             	add    eax,0x4
  238abb:	0f b7 c0             	movzx  eax,ax
  238abe:	be 00 00 00 00       	mov    esi,0x0
  238ac3:	89 c7                	mov    edi,eax
  238ac5:	e8 26 e4 ff ff       	call   236ef0 <outb>
  238aca:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  238ace:	83 c0 05             	add    eax,0x5
  238ad1:	0f b7 c0             	movzx  eax,ax
  238ad4:	be 00 00 00 00       	mov    esi,0x0
  238ad9:	89 c7                	mov    edi,eax
  238adb:	e8 10 e4 ff ff       	call   236ef0 <outb>
  238ae0:	0f b7 45 fc          	movzx  eax,WORD PTR [rbp-0x4]
  238ae4:	0f b6 d0             	movzx  edx,al
  238ae7:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  238aeb:	83 c0 06             	add    eax,0x6
  238aee:	0f b7 c0             	movzx  eax,ax
  238af1:	89 d6                	mov    esi,edx
  238af3:	89 c7                	mov    edi,eax
  238af5:	e8 f6 e3 ff ff       	call   236ef0 <outb>
  238afa:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  238afe:	83 c0 07             	add    eax,0x7
  238b01:	0f b7 c0             	movzx  eax,ax
  238b04:	be 90 00 00 00       	mov    esi,0x90
  238b09:	89 c7                	mov    edi,eax
  238b0b:	e8 e0 e3 ff ff       	call   236ef0 <outb>
  238b10:	b8 00 00 00 00       	mov    eax,0x0
  238b15:	c9                   	leave  
  238b16:	c3                   	ret    

0000000000238b17 <hd_do_req>:
  238b17:	f3 0f 1e fa          	endbr64 
  238b1b:	55                   	push   rbp
  238b1c:	48 89 e5             	mov    rbp,rsp
  238b1f:	48 83 ec 18          	sub    rsp,0x18
  238b23:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  238b27:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  238b2e:	eb 04                	jmp    238b34 <hd_do_req+0x1d>
  238b30:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  238b34:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  238b37:	48 98                	cdqe   
  238b39:	8b 14 85 60 98 22 00 	mov    edx,DWORD PTR [rax*4+0x229860]
  238b40:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  238b44:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  238b4a:	39 c2                	cmp    edx,eax
  238b4c:	75 e2                	jne    238b30 <hd_do_req+0x19>
  238b4e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  238b52:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  238b58:	83 f8 04             	cmp    eax,0x4
  238b5b:	74 72                	je     238bcf <hd_do_req+0xb8>
  238b5d:	83 f8 04             	cmp    eax,0x4
  238b60:	0f 8f 96 00 00 00    	jg     238bfc <hd_do_req+0xe5>
  238b66:	83 f8 02             	cmp    eax,0x2
  238b69:	74 0a                	je     238b75 <hd_do_req+0x5e>
  238b6b:	83 f8 03             	cmp    eax,0x3
  238b6e:	74 32                	je     238ba2 <hd_do_req+0x8b>
  238b70:	e9 87 00 00 00       	jmp    238bfc <hd_do_req+0xe5>
  238b75:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  238b79:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  238b7c:	48 98                	cdqe   
  238b7e:	48 89 c6             	mov    rsi,rax
  238b81:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  238b85:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  238b88:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  238b8c:	8b 10                	mov    edx,DWORD PTR [rax]
  238b8e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  238b91:	49 89 f0             	mov    r8,rsi
  238b94:	be 00 00 00 00       	mov    esi,0x0
  238b99:	89 c7                	mov    edi,eax
  238b9b:	e8 09 f5 ff ff       	call   2380a9 <request>
  238ba0:	eb 61                	jmp    238c03 <hd_do_req+0xec>
  238ba2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  238ba6:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  238ba9:	48 98                	cdqe   
  238bab:	48 89 c6             	mov    rsi,rax
  238bae:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  238bb2:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  238bb5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  238bb9:	8b 10                	mov    edx,DWORD PTR [rax]
  238bbb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  238bbe:	49 89 f0             	mov    r8,rsi
  238bc1:	be 01 00 00 00       	mov    esi,0x1
  238bc6:	89 c7                	mov    edi,eax
  238bc8:	e8 dc f4 ff ff       	call   2380a9 <request>
  238bcd:	eb 34                	jmp    238c03 <hd_do_req+0xec>
  238bcf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  238bd3:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  238bd6:	48 98                	cdqe   
  238bd8:	48 89 c6             	mov    rsi,rax
  238bdb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  238bdf:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  238be2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  238be6:	8b 10                	mov    edx,DWORD PTR [rax]
  238be8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  238beb:	49 89 f0             	mov    r8,rsi
  238bee:	be 02 00 00 00       	mov    esi,0x2
  238bf3:	89 c7                	mov    edi,eax
  238bf5:	e8 af f4 ff ff       	call   2380a9 <request>
  238bfa:	eb 07                	jmp    238c03 <hd_do_req+0xec>
  238bfc:	b8 ff ff ff ff       	mov    eax,0xffffffff
  238c01:	eb 1e                	jmp    238c21 <hd_do_req+0x10a>
  238c03:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  238c07:	c7 80 ac 00 00 00 02 	mov    DWORD PTR [rax+0xac],0x2
  238c0e:	00 00 00 
  238c11:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  238c15:	48 89 05 2c 0c ff ff 	mov    QWORD PTR [rip+0xffffffffffff0c2c],rax        # 229848 <running_devman_req>
  238c1c:	b8 00 00 00 00       	mov    eax,0x0
  238c21:	c9                   	leave  
  238c22:	c3                   	ret    
  238c23:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  238c2a:	00 00 00 
  238c2d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000238c30 <disk_int_handler>:
  238c30:	e8 f8 e2 ff ff       	call   236f2d <eoi+0x4>
  238c35:	e8 84 f2 ff ff       	call   237ebe <disk_int_handler_c+0x4>
  238c3a:	cf                   	iret   

0000000000238c3b <read_disk_asm>:
  238c3b:	55                   	push   rbp
  238c3c:	89 e5                	mov    ebp,esp
  238c3e:	66 ba f7 01          	mov    dx,0x1f7
  238c42:	31 c9                	xor    ecx,ecx
  238c44:	8b 44 24 08          	mov    eax,DWORD PTR [rsp+0x8]
  238c48:	8b 4c 24 0c          	mov    ecx,DWORD PTR [rsp+0xc]
  238c4c:	8b 5c 24 10          	mov    ebx,DWORD PTR [rsp+0x10]
  238c50:	89 c6                	mov    esi,eax
  238c52:	66 ba f2 01          	mov    dx,0x1f2
  238c56:	88 c8                	mov    al,cl
  238c58:	ee                   	out    dx,al
  238c59:	66 ba f3 01          	mov    dx,0x1f3
  238c5d:	89 f0                	mov    eax,esi
  238c5f:	ee                   	out    dx,al
  238c60:	66 42 c1 e8 08       	rex.X shr ax,0x8
  238c65:	ee                   	out    dx,al
  238c66:	66 42 c1 e8 08       	rex.X shr ax,0x8
  238c6b:	ee                   	out    dx,al
  238c6c:	66 42                	data16 rex.X
  238c6e:	66 c1 e8 08          	shr    ax,0x8
  238c72:	24 0f                	and    al,0xf
  238c74:	0c e0                	or     al,0xe0
  238c76:	ee                   	out    dx,al
  238c77:	66 42 b0 20          	data16 rex.X mov al,0x20
  238c7b:	ee                   	out    dx,al

0000000000238c7c <read_disk_asm.wait>:
  238c7c:	90                   	nop
  238c7d:	ec                   	in     al,dx
  238c7e:	24 88                	and    al,0x88
  238c80:	3c 08                	cmp    al,0x8
  238c82:	75 f8                	jne    238c7c <read_disk_asm.wait>
  238c84:	66 89 d7             	mov    di,dx
  238c87:	89 c8                	mov    eax,ecx
  238c89:	66 b9 00 01          	mov    cx,0x100
  238c8d:	66 f7 e1             	mul    cx
  238c90:	89 c1                	mov    ecx,eax
  238c92:	66 ba f0 01          	mov    dx,0x1f0

0000000000238c96 <read_disk_asm.read>:
  238c96:	66 ed                	in     ax,dx
  238c98:	66 89 03             	mov    WORD PTR [rbx],ax
  238c9b:	83 c3 02             	add    ebx,0x2
  238c9e:	e2 f6                	loop   238c96 <read_disk_asm.read>
  238ca0:	c9                   	leave  
  238ca1:	b8 00 00 00 00       	mov    eax,0x0
  238ca6:	c3                   	ret    

0000000000238ca7 <read_disk_asm.err_disk_reading>:
  238ca7:	66 ba f1 01          	mov    dx,0x1f1
  238cab:	31 c0                	xor    eax,eax
  238cad:	66 ed                	in     ax,dx
  238caf:	89 ec                	mov    esp,ebp
  238cb1:	5d                   	pop    rbp
  238cb2:	c3                   	ret    

0000000000238cb3 <write_disk_asm>:
  238cb3:	55                   	push   rbp
  238cb4:	89 e5                	mov    ebp,esp
  238cb6:	8b 44 24 08          	mov    eax,DWORD PTR [rsp+0x8]
  238cba:	8b 4c 24 0c          	mov    ecx,DWORD PTR [rsp+0xc]
  238cbe:	8b 5c 24 10          	mov    ebx,DWORD PTR [rsp+0x10]
  238cc2:	50                   	push   rax
  238cc3:	66 ba f2 01          	mov    dx,0x1f2
  238cc7:	88 c8                	mov    al,cl
  238cc9:	ee                   	out    dx,al
  238cca:	58                   	pop    rax
  238ccb:	66 ba f3 01          	mov    dx,0x1f3
  238ccf:	ee                   	out    dx,al
  238cd0:	c1 e8 08             	shr    eax,0x8
  238cd3:	66 ba f4 01          	mov    dx,0x1f4
  238cd7:	ee                   	out    dx,al
  238cd8:	c1 e8 08             	shr    eax,0x8
  238cdb:	66 ba f5 01          	mov    dx,0x1f5
  238cdf:	ee                   	out    dx,al
  238ce0:	c1 e8 08             	shr    eax,0x8
  238ce3:	24 0f                	and    al,0xf
  238ce5:	0c e0                	or     al,0xe0
  238ce7:	66 ba f6 01          	mov    dx,0x1f6
  238ceb:	ee                   	out    dx,al
  238cec:	66 ba f7 01          	mov    dx,0x1f7
  238cf0:	b0 30                	mov    al,0x30
  238cf2:	ee                   	out    dx,al

0000000000238cf3 <write_disk_asm.not_ready2>:
  238cf3:	90                   	nop
  238cf4:	ec                   	in     al,dx
  238cf5:	24 88                	and    al,0x88
  238cf7:	3c 08                	cmp    al,0x8
  238cf9:	75 f8                	jne    238cf3 <write_disk_asm.not_ready2>
  238cfb:	89 c8                	mov    eax,ecx
  238cfd:	66 b9 00 01          	mov    cx,0x100
  238d01:	66 f7 e1             	mul    cx
  238d04:	89 c1                	mov    ecx,eax
  238d06:	66 ba f0 01          	mov    dx,0x1f0

0000000000238d0a <write_disk_asm.go_on_write>:
  238d0a:	66 8b 03             	mov    ax,WORD PTR [rbx]
  238d0d:	66 ef                	out    dx,ax
  238d0f:	83 c3 02             	add    ebx,0x2
  238d12:	e2 f6                	loop   238d0a <write_disk_asm.go_on_write>
  238d14:	89 ec                	mov    esp,ebp
  238d16:	5d                   	pop    rbp
  238d17:	c3                   	ret    

0000000000238d18 <init_fat16>:
  238d18:	f3 0f 1e fa          	endbr64 
  238d1c:	55                   	push   rbp
  238d1d:	48 89 e5             	mov    rbp,rsp
  238d20:	48 81 ec c0 00 00 00 	sub    rsp,0xc0
  238d27:	bf 40 c8 23 00       	mov    edi,0x23c840
  238d2c:	e8 bd c1 ff ff       	call   234eee <reg_device>
  238d31:	bf a0 c7 23 00       	mov    edi,0x23c7a0
  238d36:	e8 9b c4 ff ff       	call   2351d6 <reg_driver>
  238d3b:	89 05 a3 8d ff ff    	mov    DWORD PTR [rip+0xffffffffffff8da3],eax        # 231ae4 <fat16_drvi>
  238d41:	48 8d 85 40 ff ff ff 	lea    rax,[rbp-0xc0]
  238d48:	48 89 c7             	mov    rdi,rax
  238d4b:	e8 26 00 00 00       	call   238d76 <load>
  238d50:	8b 0d 8e 8d ff ff    	mov    ecx,DWORD PTR [rip+0xffffffffffff8d8e]        # 231ae4 <fat16_drvi>
  238d56:	8b 05 f4 0a ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff0af4]        # 229850 <disk_drvi>
  238d5c:	ba e8 c8 23 00       	mov    edx,0x23c8e8
  238d61:	89 ce                	mov    esi,ecx
  238d63:	89 c7                	mov    edi,eax
  238d65:	b8 00 00 00 00       	mov    eax,0x0
  238d6a:	e8 06 b1 ff ff       	call   233e75 <reg_vol>
  238d6f:	b8 00 00 00 00       	mov    eax,0x0
  238d74:	c9                   	leave  
  238d75:	c3                   	ret    

0000000000238d76 <load>:
  238d76:	f3 0f 1e fa          	endbr64 
  238d7a:	55                   	push   rbp
  238d7b:	48 89 e5             	mov    rbp,rsp
  238d7e:	48 83 ec 20          	sub    rsp,0x20
  238d82:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  238d86:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
  238d8d:	ba 01 00 00 00       	mov    edx,0x1
  238d92:	be 00 00 00 00       	mov    esi,0x0
  238d97:	bf 80 98 22 00       	mov    edi,0x229880
  238d9c:	e8 61 0b 00 00       	call   239902 <read_sec>
  238da1:	0f b7 05 ee 0a ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff0aee]        # 229896 <superblock+0x16>
  238da8:	0f b7 d0             	movzx  edx,ax
  238dab:	0f b7 05 dc 0a ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff0adc]        # 22988e <superblock+0xe>
  238db2:	0f b7 c0             	movzx  eax,ax
  238db5:	89 c6                	mov    esi,eax
  238db7:	bf e0 da 22 00       	mov    edi,0x22dae0
  238dbc:	e8 41 0b 00 00       	call   239902 <read_sec>
  238dc1:	0f b7 05 c6 0a ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff0ac6]        # 22988e <superblock+0xe>
  238dc8:	0f b7 c8             	movzx  ecx,ax
  238dcb:	0f b7 05 c4 0a ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff0ac4]        # 229896 <superblock+0x16>
  238dd2:	0f b7 d0             	movzx  edx,ax
  238dd5:	0f b6 05 b4 0a ff ff 	movzx  eax,BYTE PTR [rip+0xffffffffffff0ab4]        # 229890 <superblock+0x10>
  238ddc:	0f b6 c0             	movzx  eax,al
  238ddf:	0f af c2             	imul   eax,edx
  238de2:	01 c8                	add    eax,ecx
  238de4:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  238de7:	0f b7 05 a3 0a ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff0aa3]        # 229891 <superblock+0x11>
  238dee:	0f b7 c0             	movzx  eax,ax
  238df1:	48 c1 e0 05          	shl    rax,0x5
  238df5:	0f b7 15 8f 0a ff ff 	movzx  edx,WORD PTR [rip+0xffffffffffff0a8f]        # 22988b <superblock+0xb>
  238dfc:	0f b7 ca             	movzx  ecx,dx
  238dff:	ba 00 00 00 00       	mov    edx,0x0
  238e04:	48 f7 f1             	div    rcx
  238e07:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  238e0a:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  238e0d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  238e10:	89 c6                	mov    esi,eax
  238e12:	bf c0 98 22 00       	mov    edi,0x2298c0
  238e17:	e8 e6 0a 00 00       	call   239902 <read_sec>
  238e1c:	66 c7 05 b5 4a ff ff 	mov    WORD PTR [rip+0xffffffffffff4ab5],0x0        # 22d8da <cur_dir+0x1a>
  238e23:	00 00 
  238e25:	0f b7 05 62 0a ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff0a62]        # 22988e <superblock+0xe>
  238e2c:	0f b7 c0             	movzx  eax,ax
  238e2f:	83 c0 3e             	add    eax,0x3e
  238e32:	89 05 88 2f 00 00    	mov    DWORD PTR [rip+0x2f88],eax        # 23bdc0 <clu_sec_balance>
  238e38:	c7 05 9e 8c ff ff 00 	mov    DWORD PTR [rip+0xffffffffffff8c9e],0x0        # 231ae0 <dir_depth>
  238e3f:	00 00 00 
  238e42:	b8 00 00 00 00       	mov    eax,0x0
  238e47:	c9                   	leave  
  238e48:	c3                   	ret    

0000000000238e49 <verify_name>:
  238e49:	f3 0f 1e fa          	endbr64 
  238e4d:	55                   	push   rbp
  238e4e:	48 89 e5             	mov    rbp,rsp
  238e51:	48 83 ec 70          	sub    rsp,0x70
  238e55:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  238e59:	48 b8 61 62 63 64 65 	movabs rax,0x6867666564636261
  238e60:	66 67 68 
  238e63:	48 ba 69 6a 6b 6c 6d 	movabs rdx,0x706f6e6d6c6b6a69
  238e6a:	6e 6f 70 
  238e6d:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  238e71:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  238e75:	48 b8 71 72 73 74 75 	movabs rax,0x7877767574737271
  238e7c:	76 77 78 
  238e7f:	48 ba 79 7a 41 42 43 	movabs rdx,0x4645444342417a79
  238e86:	44 45 46 
  238e89:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  238e8d:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  238e91:	48 b8 47 48 49 4a 4b 	movabs rax,0x4e4d4c4b4a494847
  238e98:	4c 4d 4e 
  238e9b:	48 ba 4f 50 51 52 53 	movabs rdx,0x565554535251504f
  238ea2:	54 55 56 
  238ea5:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  238ea9:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  238ead:	48 b8 57 58 59 5a 30 	movabs rax,0x333231305a595857
  238eb4:	31 32 33 
  238eb7:	48 ba 34 35 36 37 38 	movabs rdx,0x2f2c393837363534
  238ebe:	39 2c 2f 
  238ec1:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  238ec5:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  238ec9:	c7 45 e0 21 5b 5d 7c 	mov    DWORD PTR [rbp-0x20],0x7c5d5b21
  238ed0:	66 c7 45 e4 2b 00    	mov    WORD PTR [rbp-0x1c],0x2b
  238ed6:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  238eda:	48 89 c7             	mov    rdi,rax
  238edd:	e8 97 26 00 00       	call   23b579 <strlen>
  238ee2:	83 f8 0b             	cmp    eax,0xb
  238ee5:	7f 10                	jg     238ef7 <verify_name+0xae>
  238ee7:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  238eeb:	48 89 c7             	mov    rdi,rax
  238eee:	e8 86 26 00 00       	call   23b579 <strlen>
  238ef3:	85 c0                	test   eax,eax
  238ef5:	75 0a                	jne    238f01 <verify_name+0xb8>
  238ef7:	b8 00 00 00 00       	mov    eax,0x0
  238efc:	e9 b3 01 00 00       	jmp    2390b4 <verify_name+0x26b>
  238f01:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  238f08:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  238f0f:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  238f16:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [rbp-0x18],0x1
  238f1d:	eb 6b                	jmp    238f8a <verify_name+0x141>
  238f1f:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  238f26:	eb 22                	jmp    238f4a <verify_name+0x101>
  238f28:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  238f2b:	48 63 d0             	movsxd rdx,eax
  238f2e:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  238f32:	48 01 d0             	add    rax,rdx
  238f35:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  238f38:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  238f3b:	48 98                	cdqe   
  238f3d:	0f b6 44 05 a0       	movzx  eax,BYTE PTR [rbp+rax*1-0x60]
  238f42:	38 c2                	cmp    dl,al
  238f44:	74 0e                	je     238f54 <verify_name+0x10b>
  238f46:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  238f4a:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  238f4d:	83 f8 45             	cmp    eax,0x45
  238f50:	76 d6                	jbe    238f28 <verify_name+0xdf>
  238f52:	eb 01                	jmp    238f55 <verify_name+0x10c>
  238f54:	90                   	nop
  238f55:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  238f58:	83 f8 45             	cmp    eax,0x45
  238f5b:	76 0a                	jbe    238f67 <verify_name+0x11e>
  238f5d:	b8 00 00 00 00       	mov    eax,0x0
  238f62:	e9 4d 01 00 00       	jmp    2390b4 <verify_name+0x26b>
  238f67:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  238f6a:	48 63 d0             	movsxd rdx,eax
  238f6d:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  238f71:	48 01 d0             	add    rax,rdx
  238f74:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  238f77:	3c 20                	cmp    al,0x20
  238f79:	74 07                	je     238f82 <verify_name+0x139>
  238f7b:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [rbp-0xc],0x1
  238f82:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  238f86:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  238f8a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  238f8d:	48 63 d0             	movsxd rdx,eax
  238f90:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  238f94:	48 01 d0             	add    rax,rdx
  238f97:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  238f9a:	3c 2e                	cmp    al,0x2e
  238f9c:	74 18                	je     238fb6 <verify_name+0x16d>
  238f9e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  238fa1:	48 63 d0             	movsxd rdx,eax
  238fa4:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  238fa8:	48 01 d0             	add    rax,rdx
  238fab:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  238fae:	84 c0                	test   al,al
  238fb0:	0f 85 69 ff ff ff    	jne    238f1f <verify_name+0xd6>
  238fb6:	83 7d fc 08          	cmp    DWORD PTR [rbp-0x4],0x8
  238fba:	7f 06                	jg     238fc2 <verify_name+0x179>
  238fbc:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  238fc0:	75 0a                	jne    238fcc <verify_name+0x183>
  238fc2:	b8 00 00 00 00       	mov    eax,0x0
  238fc7:	e9 e8 00 00 00       	jmp    2390b4 <verify_name+0x26b>
  238fcc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  238fcf:	48 63 d0             	movsxd rdx,eax
  238fd2:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  238fd6:	48 01 d0             	add    rax,rdx
  238fd9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  238fdc:	84 c0                	test   al,al
  238fde:	75 0a                	jne    238fea <verify_name+0x1a1>
  238fe0:	b8 01 00 00 00       	mov    eax,0x1
  238fe5:	e9 ca 00 00 00       	jmp    2390b4 <verify_name+0x26b>
  238fea:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  238ff1:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  238ff8:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  238ffc:	e9 83 00 00 00       	jmp    239084 <verify_name+0x23b>
  239001:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  239008:	eb 22                	jmp    23902c <verify_name+0x1e3>
  23900a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  23900d:	48 63 d0             	movsxd rdx,eax
  239010:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  239014:	48 01 d0             	add    rax,rdx
  239017:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  23901a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  23901d:	48 98                	cdqe   
  23901f:	0f b6 44 05 a0       	movzx  eax,BYTE PTR [rbp+rax*1-0x60]
  239024:	38 c2                	cmp    dl,al
  239026:	74 0e                	je     239036 <verify_name+0x1ed>
  239028:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  23902c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  23902f:	83 f8 45             	cmp    eax,0x45
  239032:	76 d6                	jbe    23900a <verify_name+0x1c1>
  239034:	eb 01                	jmp    239037 <verify_name+0x1ee>
  239036:	90                   	nop
  239037:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  23903a:	83 f8 45             	cmp    eax,0x45
  23903d:	76 07                	jbe    239046 <verify_name+0x1fd>
  23903f:	b8 00 00 00 00       	mov    eax,0x0
  239044:	eb 6e                	jmp    2390b4 <verify_name+0x26b>
  239046:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  239049:	48 63 d0             	movsxd rdx,eax
  23904c:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  239050:	48 01 d0             	add    rax,rdx
  239053:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  239056:	3c 20                	cmp    al,0x20
  239058:	74 07                	je     239061 <verify_name+0x218>
  23905a:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [rbp-0xc],0x1
  239061:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  239064:	48 63 d0             	movsxd rdx,eax
  239067:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  23906b:	48 01 d0             	add    rax,rdx
  23906e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  239071:	3c 2e                	cmp    al,0x2e
  239073:	75 07                	jne    23907c <verify_name+0x233>
  239075:	b8 00 00 00 00       	mov    eax,0x0
  23907a:	eb 38                	jmp    2390b4 <verify_name+0x26b>
  23907c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  239080:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  239084:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  239087:	48 63 d0             	movsxd rdx,eax
  23908a:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  23908e:	48 01 d0             	add    rax,rdx
  239091:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  239094:	84 c0                	test   al,al
  239096:	0f 85 65 ff ff ff    	jne    239001 <verify_name+0x1b8>
  23909c:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  2390a0:	7f 06                	jg     2390a8 <verify_name+0x25f>
  2390a2:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  2390a6:	75 07                	jne    2390af <verify_name+0x266>
  2390a8:	b8 00 00 00 00       	mov    eax,0x0
  2390ad:	eb 05                	jmp    2390b4 <verify_name+0x26b>
  2390af:	b8 01 00 00 00       	mov    eax,0x1
  2390b4:	c9                   	leave  
  2390b5:	c3                   	ret    

00000000002390b6 <format_name>:
  2390b6:	f3 0f 1e fa          	endbr64 
  2390ba:	55                   	push   rbp
  2390bb:	48 89 e5             	mov    rbp,rsp
  2390be:	48 83 ec 30          	sub    rsp,0x30
  2390c2:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  2390c6:	48 b8 20 20 20 20 20 	movabs rax,0x2020202020202020
  2390cd:	20 20 20 
  2390d0:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  2390d4:	c7 45 f0 20 20 20 00 	mov    DWORD PTR [rbp-0x10],0x202020
  2390db:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  2390e2:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  2390e9:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  2390f0:	e9 9b 00 00 00       	jmp    239190 <format_name+0xda>
  2390f5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  2390f8:	48 63 d0             	movsxd rdx,eax
  2390fb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  2390ff:	48 01 d0             	add    rax,rdx
  239102:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  239105:	3c 60                	cmp    al,0x60
  239107:	7e 3e                	jle    239147 <format_name+0x91>
  239109:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  23910c:	48 63 d0             	movsxd rdx,eax
  23910f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  239113:	48 01 d0             	add    rax,rdx
  239116:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  239119:	3c 7a                	cmp    al,0x7a
  23911b:	7f 2a                	jg     239147 <format_name+0x91>
  23911d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  239120:	48 63 d0             	movsxd rdx,eax
  239123:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  239127:	48 01 d0             	add    rax,rdx
  23912a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23912d:	8d 48 e0             	lea    ecx,[rax-0x20]
  239130:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  239133:	8d 50 01             	lea    edx,[rax+0x1]
  239136:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  239139:	89 ca                	mov    edx,ecx
  23913b:	48 98                	cdqe   
  23913d:	88 54 05 e8          	mov    BYTE PTR [rbp+rax*1-0x18],dl
  239141:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  239145:	eb 45                	jmp    23918c <format_name+0xd6>
  239147:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  23914a:	48 63 d0             	movsxd rdx,eax
  23914d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  239151:	48 01 d0             	add    rax,rdx
  239154:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  239157:	3c 2e                	cmp    al,0x2e
  239159:	75 0d                	jne    239168 <format_name+0xb2>
  23915b:	b8 08 00 00 00       	mov    eax,0x8
  239160:	2b 45 f8             	sub    eax,DWORD PTR [rbp-0x8]
  239163:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
  239166:	eb 24                	jmp    23918c <format_name+0xd6>
  239168:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  23916b:	48 63 d0             	movsxd rdx,eax
  23916e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  239172:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  239176:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  239179:	8d 50 01             	lea    edx,[rax+0x1]
  23917c:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  23917f:	0f b6 11             	movzx  edx,BYTE PTR [rcx]
  239182:	48 98                	cdqe   
  239184:	88 54 05 e8          	mov    BYTE PTR [rbp+rax*1-0x18],dl
  239188:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  23918c:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  239190:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  239193:	48 63 d0             	movsxd rdx,eax
  239196:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  23919a:	48 01 d0             	add    rax,rdx
  23919d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  2391a0:	84 c0                	test   al,al
  2391a2:	0f 85 4d ff ff ff    	jne    2390f5 <format_name+0x3f>
  2391a8:	c6 45 f4 00          	mov    BYTE PTR [rbp-0xc],0x0
  2391ac:	48 8d 55 e8          	lea    rdx,[rbp-0x18]
  2391b0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  2391b4:	48 89 d6             	mov    rsi,rdx
  2391b7:	48 89 c7             	mov    rdi,rax
  2391ba:	e8 9b 21 00 00       	call   23b35a <strcpy>
  2391bf:	90                   	nop
  2391c0:	c9                   	leave  
  2391c1:	c3                   	ret    

00000000002391c2 <req_cluster>:
  2391c2:	f3 0f 1e fa          	endbr64 
  2391c6:	55                   	push   rbp
  2391c7:	48 89 e5             	mov    rbp,rsp
  2391ca:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [rbp-0x4],0x3
  2391d1:	eb 2a                	jmp    2391fd <req_cluster+0x3b>
  2391d3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2391d6:	48 98                	cdqe   
  2391d8:	0f b7 84 00 e0 da 22 	movzx  eax,WORD PTR [rax+rax*1+0x22dae0]
  2391df:	00 
  2391e0:	66 85 c0             	test   ax,ax
  2391e3:	75 14                	jne    2391f9 <req_cluster+0x37>
  2391e5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2391e8:	48 98                	cdqe   
  2391ea:	66 c7 84 00 e0 da 22 	mov    WORD PTR [rax+rax*1+0x22dae0],0xffff
  2391f1:	00 ff ff 
  2391f4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2391f7:	eb 13                	jmp    23920c <req_cluster+0x4a>
  2391f9:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  2391fd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  239200:	3d ff 1f 00 00       	cmp    eax,0x1fff
  239205:	76 cc                	jbe    2391d3 <req_cluster+0x11>
  239207:	b8 ff ff ff ff       	mov    eax,0xffffffff
  23920c:	5d                   	pop    rbp
  23920d:	c3                   	ret    

000000000023920e <write_sec>:
  23920e:	f3 0f 1e fa          	endbr64 
  239212:	55                   	push   rbp
  239213:	48 89 e5             	mov    rbp,rsp
  239216:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
  23921d:	48 89 bd 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rdi
  239224:	89 b5 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],esi
  23922a:	89 95 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],edx
  239230:	48 8d 95 40 ff ff ff 	lea    rdx,[rbp-0xc0]
  239237:	b8 00 00 00 00       	mov    eax,0x0
  23923c:	b9 18 00 00 00       	mov    ecx,0x18
  239241:	48 89 d7             	mov    rdi,rdx
  239244:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  239247:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
  23924e:	89 85 48 ff ff ff    	mov    DWORD PTR [rbp-0xb8],eax
  239254:	8b 85 34 ff ff ff    	mov    eax,DWORD PTR [rbp-0xcc]
  23925a:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
  239260:	8b 85 30 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd0]
  239266:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
  23926c:	48 8b 15 c5 2a 00 00 	mov    rdx,QWORD PTR [rip+0x2ac5]        # 23bd38 <drv_disk+0x18>
  239273:	48 8d 85 40 ff ff ff 	lea    rax,[rbp-0xc0]
  23927a:	48 89 c7             	mov    rdi,rax
  23927d:	ff d2                	call   rdx
  23927f:	c9                   	leave  
  239280:	c3                   	ret    

0000000000239281 <set_attr>:
  239281:	f3 0f 1e fa          	endbr64 
  239285:	55                   	push   rbp
  239286:	48 89 e5             	mov    rbp,rsp
  239289:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  23928d:	89 f0                	mov    eax,esi
  23928f:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
  239292:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  239296:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  23929a:	0a 45 f4             	or     al,BYTE PTR [rbp-0xc]
  23929d:	89 c2                	mov    edx,eax
  23929f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  2392a3:	88 50 0b             	mov    BYTE PTR [rax+0xb],dl
  2392a6:	90                   	nop
  2392a7:	5d                   	pop    rbp
  2392a8:	c3                   	ret    

00000000002392a9 <update_fat_and_root>:
  2392a9:	f3 0f 1e fa          	endbr64 
  2392ad:	55                   	push   rbp
  2392ae:	48 89 e5             	mov    rbp,rsp
  2392b1:	48 83 ec 10          	sub    rsp,0x10
  2392b5:	0f b7 05 d2 05 ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff05d2]        # 22988e <superblock+0xe>
  2392bc:	0f b7 c8             	movzx  ecx,ax
  2392bf:	0f b7 05 d0 05 ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff05d0]        # 229896 <superblock+0x16>
  2392c6:	0f b7 d0             	movzx  edx,ax
  2392c9:	0f b6 05 c0 05 ff ff 	movzx  eax,BYTE PTR [rip+0xffffffffffff05c0]        # 229890 <superblock+0x10>
  2392d0:	0f b6 c0             	movzx  eax,al
  2392d3:	0f af c2             	imul   eax,edx
  2392d6:	01 c8                	add    eax,ecx
  2392d8:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  2392db:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2392de:	ba 00 40 00 00       	mov    edx,0x4000
  2392e3:	89 c6                	mov    esi,eax
  2392e5:	bf c0 98 22 00       	mov    edi,0x2298c0
  2392ea:	e8 1f ff ff ff       	call   23920e <write_sec>
  2392ef:	0f b7 05 98 05 ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff0598]        # 22988e <superblock+0xe>
  2392f6:	0f b7 c0             	movzx  eax,ax
  2392f9:	ba 00 40 00 00       	mov    edx,0x4000
  2392fe:	89 c6                	mov    esi,eax
  239300:	bf e0 da 22 00       	mov    edi,0x22dae0
  239305:	e8 04 ff ff ff       	call   23920e <write_sec>
  23930a:	90                   	nop
  23930b:	c9                   	leave  
  23930c:	c3                   	ret    

000000000023930d <add_dot_and_ddot_dir>:
  23930d:	f3 0f 1e fa          	endbr64 
  239311:	55                   	push   rbp
  239312:	48 89 e5             	mov    rbp,rsp
  239315:	48 83 ec 10          	sub    rsp,0x10
  239319:	0f b7 45 2a          	movzx  eax,WORD PTR [rbp+0x2a]
  23931d:	0f b7 c0             	movzx  eax,ax
  239320:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  239323:	0f b6 05 63 05 ff ff 	movzx  eax,BYTE PTR [rip+0xffffffffffff0563]        # 22988d <superblock+0xd>
  23932a:	0f b6 c0             	movzx  eax,al
  23932d:	8b 0d 8d 2a 00 00    	mov    ecx,DWORD PTR [rip+0x2a8d]        # 23bdc0 <clu_sec_balance>
  239333:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  239336:	01 d1                	add    ecx,edx
  239338:	89 c2                	mov    edx,eax
  23933a:	89 ce                	mov    esi,ecx
  23933c:	bf e0 d8 22 00       	mov    edi,0x22d8e0
  239341:	e8 bc 05 00 00       	call   239902 <read_sec>
  239346:	be ea c8 23 00       	mov    esi,0x23c8ea
  23934b:	bf e0 d8 22 00       	mov    edi,0x22d8e0
  239350:	e8 05 20 00 00       	call   23b35a <strcpy>
  239355:	be f3 c8 23 00       	mov    esi,0x23c8f3
  23935a:	bf e8 d8 22 00       	mov    edi,0x22d8e8
  23935f:	e8 f6 1f 00 00       	call   23b35a <strcpy>
  239364:	0f b7 45 2a          	movzx  eax,WORD PTR [rbp+0x2a]
  239368:	66 89 05 8b 45 ff ff 	mov    WORD PTR [rip+0xffffffffffff458b],ax        # 22d8fa <a_clu_of_dir+0x1a>
  23936f:	c7 05 83 45 ff ff 00 	mov    DWORD PTR [rip+0xffffffffffff4583],0x0        # 22d8fc <a_clu_of_dir+0x1c>
  239376:	00 00 00 
  239379:	be 10 00 00 00       	mov    esi,0x10
  23937e:	bf e0 d8 22 00       	mov    edi,0x22d8e0
  239383:	e8 f9 fe ff ff       	call   239281 <set_attr>
  239388:	be f7 c8 23 00       	mov    esi,0x23c8f7
  23938d:	bf 00 d9 22 00       	mov    edi,0x22d900
  239392:	e8 c3 1f 00 00       	call   23b35a <strcpy>
  239397:	be f3 c8 23 00       	mov    esi,0x23c8f3
  23939c:	bf 08 d9 22 00       	mov    edi,0x22d908
  2393a1:	e8 b4 1f 00 00       	call   23b35a <strcpy>
  2393a6:	0f b7 05 2d 45 ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff452d]        # 22d8da <cur_dir+0x1a>
  2393ad:	66 89 05 66 45 ff ff 	mov    WORD PTR [rip+0xffffffffffff4566],ax        # 22d91a <a_clu_of_dir+0x3a>
  2393b4:	c7 05 5e 45 ff ff 00 	mov    DWORD PTR [rip+0xffffffffffff455e],0x0        # 22d91c <a_clu_of_dir+0x3c>
  2393bb:	00 00 00 
  2393be:	be 10 00 00 00       	mov    esi,0x10
  2393c3:	bf 00 d9 22 00       	mov    edi,0x22d900
  2393c8:	e8 b4 fe ff ff       	call   239281 <set_attr>
  2393cd:	8b 15 ed 29 00 00    	mov    edx,DWORD PTR [rip+0x29ed]        # 23bdc0 <clu_sec_balance>
  2393d3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2393d6:	01 d0                	add    eax,edx
  2393d8:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  2393db:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  2393de:	ba 00 02 00 00       	mov    edx,0x200
  2393e3:	89 c6                	mov    esi,eax
  2393e5:	bf e0 d8 22 00       	mov    edi,0x22d8e0
  2393ea:	e8 1f fe ff ff       	call   23920e <write_sec>
  2393ef:	90                   	nop
  2393f0:	c9                   	leave  
  2393f1:	c3                   	ret    

00000000002393f2 <translate_attr>:
  2393f2:	f3 0f 1e fa          	endbr64 
  2393f6:	55                   	push   rbp
  2393f7:	48 89 e5             	mov    rbp,rsp
  2393fa:	89 f8                	mov    eax,edi
  2393fc:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  239400:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
  239403:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  239407:	83 e0 01             	and    eax,0x1
  23940a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  23940d:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  239411:	74 0b                	je     23941e <translate_attr+0x2c>
  239413:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  239417:	48 83 c0 01          	add    rax,0x1
  23941b:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
  23941e:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  239422:	83 e0 02             	and    eax,0x2
  239425:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  239428:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  23942c:	74 0b                	je     239439 <translate_attr+0x47>
  23942e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  239432:	48 83 c0 02          	add    rax,0x2
  239436:	c6 00 68             	mov    BYTE PTR [rax],0x68
  239439:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  23943d:	83 e0 04             	and    eax,0x4
  239440:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  239443:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  239447:	74 0b                	je     239454 <translate_attr+0x62>
  239449:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  23944d:	48 83 c0 04          	add    rax,0x4
  239451:	c6 00 73             	mov    BYTE PTR [rax],0x73
  239454:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  239458:	83 e0 08             	and    eax,0x8
  23945b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  23945e:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  239462:	74 0b                	je     23946f <translate_attr+0x7d>
  239464:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  239468:	48 83 c0 03          	add    rax,0x3
  23946c:	c6 00 76             	mov    BYTE PTR [rax],0x76
  23946f:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  239473:	83 e0 10             	and    eax,0x10
  239476:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  239479:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  23947d:	74 0b                	je     23948a <translate_attr+0x98>
  23947f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  239483:	48 83 c0 03          	add    rax,0x3
  239487:	c6 00 64             	mov    BYTE PTR [rax],0x64
  23948a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  23948e:	48 83 c0 05          	add    rax,0x5
  239492:	c6 00 00             	mov    BYTE PTR [rax],0x0
  239495:	90                   	nop
  239496:	5d                   	pop    rbp
  239497:	c3                   	ret    

0000000000239498 <extend_cluster>:
  239498:	f3 0f 1e fa          	endbr64 
  23949c:	55                   	push   rbp
  23949d:	48 89 e5             	mov    rbp,rsp
  2394a0:	48 83 ec 18          	sub    rsp,0x18
  2394a4:	89 f8                	mov    eax,edi
  2394a6:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
  2394aa:	b8 00 00 00 00       	mov    eax,0x0
  2394af:	e8 0e fd ff ff       	call   2391c2 <req_cluster>
  2394b4:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  2394b7:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  2394bb:	75 07                	jne    2394c4 <extend_cluster+0x2c>
  2394bd:	b8 ff ff ff ff       	mov    eax,0xffffffff
  2394c2:	eb 16                	jmp    2394da <extend_cluster+0x42>
  2394c4:	0f bf 45 ec          	movsx  eax,WORD PTR [rbp-0x14]
  2394c8:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  2394cb:	48 98                	cdqe   
  2394cd:	66 89 94 00 e0 da 22 	mov    WORD PTR [rax+rax*1+0x22dae0],dx
  2394d4:	00 
  2394d5:	b8 00 00 00 00       	mov    eax,0x0
  2394da:	c9                   	leave  
  2394db:	c3                   	ret    

00000000002394dc <touch>:
  2394dc:	f3 0f 1e fa          	endbr64 
  2394e0:	55                   	push   rbp
  2394e1:	48 89 e5             	mov    rbp,rsp
  2394e4:	48 83 ec 60          	sub    rsp,0x60
  2394e8:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  2394ec:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  2394f0:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  2394f4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  2394f8:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  2394fc:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  2394ff:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
  239503:	c7 45 ec 10 00 00 00 	mov    DWORD PTR [rbp-0x14],0x10
  23950a:	48 c7 45 e0 e0 d8 22 	mov    QWORD PTR [rbp-0x20],0x22d8e0
  239511:	00 
  239512:	0f b6 05 74 03 ff ff 	movzx  eax,BYTE PTR [rip+0xffffffffffff0374]        # 22988d <superblock+0xd>
  239519:	0f b6 c0             	movzx  eax,al
  23951c:	0f b7 55 ca          	movzx  edx,WORD PTR [rbp-0x36]
  239520:	0f b7 ca             	movzx  ecx,dx
  239523:	8b 15 97 28 00 00    	mov    edx,DWORD PTR [rip+0x2897]        # 23bdc0 <clu_sec_balance>
  239529:	01 d1                	add    ecx,edx
  23952b:	89 c2                	mov    edx,eax
  23952d:	89 ce                	mov    esi,ecx
  23952f:	bf e0 d8 22 00       	mov    edi,0x22d8e0
  239534:	e8 c9 03 00 00       	call   239902 <read_sec>
  239539:	0f b7 45 ca          	movzx  eax,WORD PTR [rbp-0x36]
  23953d:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
  239541:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  239548:	e9 2e 01 00 00       	jmp    23967b <touch+0x19f>
  23954d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  239550:	48 98                	cdqe   
  239552:	48 c1 e0 05          	shl    rax,0x5
  239556:	48 89 c2             	mov    rdx,rax
  239559:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  23955d:	48 01 d0             	add    rax,rdx
  239560:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  239563:	3c e5                	cmp    al,0xe5
  239565:	74 1e                	je     239585 <touch+0xa9>
  239567:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  23956a:	48 98                	cdqe   
  23956c:	48 c1 e0 05          	shl    rax,0x5
  239570:	48 89 c2             	mov    rdx,rax
  239573:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  239577:	48 01 d0             	add    rax,rdx
  23957a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23957d:	84 c0                	test   al,al
  23957f:	0f 85 f2 00 00 00    	jne    239677 <touch+0x19b>
  239585:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  239589:	48 89 c7             	mov    rdi,rax
  23958c:	e8 25 fb ff ff       	call   2390b6 <format_name>
  239591:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  239594:	48 98                	cdqe   
  239596:	48 c1 e0 05          	shl    rax,0x5
  23959a:	48 89 c2             	mov    rdx,rax
  23959d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  2395a1:	48 01 d0             	add    rax,rdx
  2395a4:	48 89 c1             	mov    rcx,rax
  2395a7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  2395ab:	ba 0b 00 00 00       	mov    edx,0xb
  2395b0:	48 89 c6             	mov    rsi,rax
  2395b3:	48 89 cf             	mov    rdi,rcx
  2395b6:	e8 a1 1c 00 00       	call   23b25c <memcpy>
  2395bb:	b8 00 00 00 00       	mov    eax,0x0
  2395c0:	e8 fd fb ff ff       	call   2391c2 <req_cluster>
  2395c5:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
  2395c8:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  2395cc:	75 0a                	jne    2395d8 <touch+0xfc>
  2395ce:	b8 ff ff ff ff       	mov    eax,0xffffffff
  2395d3:	e9 fc 00 00 00       	jmp    2396d4 <touch+0x1f8>
  2395d8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  2395db:	48 98                	cdqe   
  2395dd:	48 c1 e0 05          	shl    rax,0x5
  2395e1:	48 89 c2             	mov    rdx,rax
  2395e4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  2395e8:	48 01 d0             	add    rax,rdx
  2395eb:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  2395ee:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
  2395f2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  2395f5:	48 98                	cdqe   
  2395f7:	48 c1 e0 05          	shl    rax,0x5
  2395fb:	48 89 c2             	mov    rdx,rax
  2395fe:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  239602:	48 01 d0             	add    rax,rdx
  239605:	be 20 00 00 00       	mov    esi,0x20
  23960a:	48 89 c7             	mov    rdi,rax
  23960d:	e8 6f fc ff ff       	call   239281 <set_attr>
  239612:	0f b7 05 72 02 ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff0272]        # 22988b <superblock+0xb>
  239619:	0f b7 d0             	movzx  edx,ax
  23961c:	0f b6 05 6a 02 ff ff 	movzx  eax,BYTE PTR [rip+0xffffffffffff026a]        # 22988d <superblock+0xd>
  239623:	0f b6 c0             	movzx  eax,al
  239626:	0f af d0             	imul   edx,eax
  239629:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  23962c:	48 98                	cdqe   
  23962e:	48 c1 e0 05          	shl    rax,0x5
  239632:	48 89 c1             	mov    rcx,rax
  239635:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  239639:	48 01 c8             	add    rax,rcx
  23963c:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
  23963f:	0f b7 05 45 02 ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff0245]        # 22988b <superblock+0xb>
  239646:	0f b7 d0             	movzx  edx,ax
  239649:	0f b6 05 3d 02 ff ff 	movzx  eax,BYTE PTR [rip+0xffffffffffff023d]        # 22988d <superblock+0xd>
  239650:	0f b6 c0             	movzx  eax,al
  239653:	0f af d0             	imul   edx,eax
  239656:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  23965a:	8b 05 60 27 00 00    	mov    eax,DWORD PTR [rip+0x2760]        # 23bdc0 <clu_sec_balance>
  239660:	01 c1                	add    ecx,eax
  239662:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  239666:	89 ce                	mov    esi,ecx
  239668:	48 89 c7             	mov    rdi,rax
  23966b:	e8 9e fb ff ff       	call   23920e <write_sec>
  239670:	b8 ff ff ff ff       	mov    eax,0xffffffff
  239675:	eb 5d                	jmp    2396d4 <touch+0x1f8>
  239677:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  23967b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  23967e:	3b 45 ec             	cmp    eax,DWORD PTR [rbp-0x14]
  239681:	0f 8c c6 fe ff ff    	jl     23954d <touch+0x71>
  239687:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  23968c:	77 36                	ja     2396c4 <touch+0x1e8>
  23968e:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  239692:	48 98                	cdqe   
  239694:	0f b7 84 00 e0 da 22 	movzx  eax,WORD PTR [rax+rax*1+0x22dae0]
  23969b:	00 
  23969c:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
  2396a0:	0f b6 05 e6 01 ff ff 	movzx  eax,BYTE PTR [rip+0xffffffffffff01e6]        # 22988d <superblock+0xd>
  2396a7:	0f b6 d0             	movzx  edx,al
  2396aa:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  2396ae:	8b 05 0c 27 00 00    	mov    eax,DWORD PTR [rip+0x270c]        # 23bdc0 <clu_sec_balance>
  2396b4:	01 c1                	add    ecx,eax
  2396b6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  2396ba:	89 ce                	mov    esi,ecx
  2396bc:	48 89 c7             	mov    rdi,rax
  2396bf:	e8 3e 02 00 00       	call   239902 <read_sec>
  2396c4:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  2396c9:	0f 86 72 fe ff ff    	jbe    239541 <touch+0x65>
  2396cf:	b8 00 00 00 00       	mov    eax,0x0
  2396d4:	c9                   	leave  
  2396d5:	c3                   	ret    

00000000002396d6 <mkdir>:
  2396d6:	f3 0f 1e fa          	endbr64 
  2396da:	55                   	push   rbp
  2396db:	48 89 e5             	mov    rbp,rsp
  2396de:	48 83 ec 50          	sub    rsp,0x50
  2396e2:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  2396e6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  2396ea:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  2396ee:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  2396f2:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  2396f6:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  2396f9:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
  2396fd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  239701:	48 89 c7             	mov    rdi,rax
  239704:	e8 ad f9 ff ff       	call   2390b6 <format_name>
  239709:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  23970d:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
  239711:	0f b6 05 75 01 ff ff 	movzx  eax,BYTE PTR [rip+0xffffffffffff0175]        # 22988d <superblock+0xd>
  239718:	0f b6 c0             	movzx  eax,al
  23971b:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  23971f:	8b 15 9b 26 00 00    	mov    edx,DWORD PTR [rip+0x269b]        # 23bdc0 <clu_sec_balance>
  239725:	01 d1                	add    ecx,edx
  239727:	89 c2                	mov    edx,eax
  239729:	89 ce                	mov    esi,ecx
  23972b:	bf e0 d8 22 00       	mov    edi,0x22d8e0
  239730:	e8 cd 01 00 00       	call   239902 <read_sec>
  239735:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  23973c:	e9 8c 01 00 00       	jmp    2398cd <mkdir+0x1f7>
  239741:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  239744:	48 98                	cdqe   
  239746:	48 c1 e0 05          	shl    rax,0x5
  23974a:	48 05 fa d8 22 00    	add    rax,0x22d8fa
  239750:	0f b7 00             	movzx  eax,WORD PTR [rax]
  239753:	66 85 c0             	test   ax,ax
  239756:	74 30                	je     239788 <mkdir+0xb2>
  239758:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  23975b:	48 98                	cdqe   
  23975d:	48 c1 e0 05          	shl    rax,0x5
  239761:	48 05 c0 98 22 00    	add    rax,0x2298c0
  239767:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23976a:	3c e5                	cmp    al,0xe5
  23976c:	74 1a                	je     239788 <mkdir+0xb2>
  23976e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  239771:	48 98                	cdqe   
  239773:	48 c1 e0 05          	shl    rax,0x5
  239777:	48 05 c0 98 22 00    	add    rax,0x2298c0
  23977d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  239780:	84 c0                	test   al,al
  239782:	0f 85 41 01 00 00    	jne    2398c9 <mkdir+0x1f3>
  239788:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  23978b:	48 98                	cdqe   
  23978d:	48 c1 e0 05          	shl    rax,0x5
  239791:	48 05 e0 d8 22 00    	add    rax,0x22d8e0
  239797:	ba 20 00 00 00       	mov    edx,0x20
  23979c:	be 00 00 00 00       	mov    esi,0x0
  2397a1:	48 89 c7             	mov    rdi,rax
  2397a4:	e8 62 1b 00 00       	call   23b30b <memset>
  2397a9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  2397ac:	48 98                	cdqe   
  2397ae:	48 c1 e0 05          	shl    rax,0x5
  2397b2:	48 05 e0 d8 22 00    	add    rax,0x22d8e0
  2397b8:	ba 0b 00 00 00       	mov    edx,0xb
  2397bd:	be 20 00 00 00       	mov    esi,0x20
  2397c2:	48 89 c7             	mov    rdi,rax
  2397c5:	e8 41 1b 00 00       	call   23b30b <memset>
  2397ca:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  2397cd:	48 98                	cdqe   
  2397cf:	48 c1 e0 05          	shl    rax,0x5
  2397d3:	48 8d 90 e0 d8 22 00 	lea    rdx,[rax+0x22d8e0]
  2397da:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  2397de:	48 89 c6             	mov    rsi,rax
  2397e1:	48 89 d7             	mov    rdi,rdx
  2397e4:	e8 71 1b 00 00       	call   23b35a <strcpy>
  2397e9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  2397ed:	48 89 c7             	mov    rdi,rax
  2397f0:	e8 84 1d 00 00       	call   23b579 <strlen>
  2397f5:	48 63 d0             	movsxd rdx,eax
  2397f8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  2397fb:	48 98                	cdqe   
  2397fd:	48 c1 e0 05          	shl    rax,0x5
  239801:	48 01 d0             	add    rax,rdx
  239804:	48 05 e0 d8 22 00    	add    rax,0x22d8e0
  23980a:	c6 00 20             	mov    BYTE PTR [rax],0x20
  23980d:	b8 00 00 00 00       	mov    eax,0x0
  239812:	e8 ab f9 ff ff       	call   2391c2 <req_cluster>
  239817:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  23981a:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  23981e:	75 0a                	jne    23982a <mkdir+0x154>
  239820:	b8 ff ff ff ff       	mov    eax,0xffffffff
  239825:	e9 d6 00 00 00       	jmp    239900 <mkdir+0x22a>
  23982a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  23982d:	89 c2                	mov    edx,eax
  23982f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  239832:	48 98                	cdqe   
  239834:	48 c1 e0 05          	shl    rax,0x5
  239838:	48 05 fa d8 22 00    	add    rax,0x22d8fa
  23983e:	66 89 10             	mov    WORD PTR [rax],dx
  239841:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  239844:	48 98                	cdqe   
  239846:	48 c1 e0 05          	shl    rax,0x5
  23984a:	48 05 e0 d8 22 00    	add    rax,0x22d8e0
  239850:	be 10 00 00 00       	mov    esi,0x10
  239855:	48 89 c7             	mov    rdi,rax
  239858:	e8 24 fa ff ff       	call   239281 <set_attr>
  23985d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  239860:	48 98                	cdqe   
  239862:	48 c1 e0 05          	shl    rax,0x5
  239866:	48 05 fc d8 22 00    	add    rax,0x22d8fc
  23986c:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  239872:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  239875:	48 98                	cdqe   
  239877:	48 c1 e0 05          	shl    rax,0x5
  23987b:	48 05 e0 d8 22 00    	add    rax,0x22d8e0
  239881:	ff 70 18             	push   QWORD PTR [rax+0x18]
  239884:	ff 70 10             	push   QWORD PTR [rax+0x10]
  239887:	ff 70 08             	push   QWORD PTR [rax+0x8]
  23988a:	ff 30                	push   QWORD PTR [rax]
  23988c:	e8 7c fa ff ff       	call   23930d <add_dot_and_ddot_dir>
  239891:	48 83 c4 20          	add    rsp,0x20
  239895:	0f b7 55 fe          	movzx  edx,WORD PTR [rbp-0x2]
  239899:	8b 05 21 25 00 00    	mov    eax,DWORD PTR [rip+0x2521]        # 23bdc0 <clu_sec_balance>
  23989f:	01 d0                	add    eax,edx
  2398a1:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  2398a4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  2398a7:	ba 00 02 00 00       	mov    edx,0x200
  2398ac:	89 c6                	mov    esi,eax
  2398ae:	bf e0 d8 22 00       	mov    edi,0x22d8e0
  2398b3:	e8 56 f9 ff ff       	call   23920e <write_sec>
  2398b8:	b8 00 00 00 00       	mov    eax,0x0
  2398bd:	e8 e7 f9 ff ff       	call   2392a9 <update_fat_and_root>
  2398c2:	b8 00 00 00 00       	mov    eax,0x0
  2398c7:	eb 37                	jmp    239900 <mkdir+0x22a>
  2398c9:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  2398cd:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  2398d1:	0f 8e 6a fe ff ff    	jle    239741 <mkdir+0x6b>
  2398d7:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  2398dc:	77 12                	ja     2398f0 <mkdir+0x21a>
  2398de:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  2398e2:	48 98                	cdqe   
  2398e4:	0f b7 84 00 e0 da 22 	movzx  eax,WORD PTR [rax+rax*1+0x22dae0]
  2398eb:	00 
  2398ec:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
  2398f0:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  2398f5:	0f 86 16 fe ff ff    	jbe    239711 <mkdir+0x3b>
  2398fb:	b8 ff ff ff ff       	mov    eax,0xffffffff
  239900:	c9                   	leave  
  239901:	c3                   	ret    

0000000000239902 <read_sec>:
  239902:	f3 0f 1e fa          	endbr64 
  239906:	55                   	push   rbp
  239907:	48 89 e5             	mov    rbp,rsp
  23990a:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  239911:	48 89 bd 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rdi
  239918:	89 b5 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],esi
  23991e:	89 95 20 ff ff ff    	mov    DWORD PTR [rbp-0xe0],edx
  239924:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  23992b:	b8 00 00 00 00       	mov    eax,0x0
  239930:	b9 18 00 00 00       	mov    ecx,0x18
  239935:	48 89 d7             	mov    rdi,rdx
  239938:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  23993b:	8b 85 24 ff ff ff    	mov    eax,DWORD PTR [rbp-0xdc]
  239941:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
  239947:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  23994e:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
  239954:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  23995b:	00 00 00 
  23995e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  239965:	eb 3e                	jmp    2399a5 <read_sec+0xa3>
  239967:	48 8b 15 ca 23 00 00 	mov    rdx,QWORD PTR [rip+0x23ca]        # 23bd38 <drv_disk+0x18>
  23996e:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  239975:	48 89 c7             	mov    rdi,rax
  239978:	ff d2                	call   rdx
  23997a:	8b 95 34 ff ff ff    	mov    edx,DWORD PTR [rbp-0xcc]
  239980:	0f b7 05 04 ff fe ff 	movzx  eax,WORD PTR [rip+0xfffffffffffeff04]        # 22988b <superblock+0xb>
  239987:	0f b7 c0             	movzx  eax,ax
  23998a:	01 d0                	add    eax,edx
  23998c:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
  239992:	8b 85 30 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd0]
  239998:	83 c0 01             	add    eax,0x1
  23999b:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
  2399a1:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  2399a5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  2399a8:	3b 85 20 ff ff ff    	cmp    eax,DWORD PTR [rbp-0xe0]
  2399ae:	7c b7                	jl     239967 <read_sec+0x65>
  2399b0:	b8 00 00 00 00       	mov    eax,0x0
  2399b5:	c9                   	leave  
  2399b6:	c3                   	ret    

00000000002399b7 <rm>:
  2399b7:	f3 0f 1e fa          	endbr64 
  2399bb:	55                   	push   rbp
  2399bc:	48 89 e5             	mov    rbp,rsp
  2399bf:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  2399c6:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  2399cd:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  2399d4:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  2399d8:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  2399dc:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
  2399e3:	b8 00 00 00 00       	mov    eax,0x0
  2399e8:	b9 18 00 00 00       	mov    ecx,0x18
  2399ed:	48 89 d7             	mov    rdi,rdx
  2399f0:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  2399f3:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  2399fa:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
  239a01:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
  239a08:	48 8d 85 00 ff ff ff 	lea    rax,[rbp-0x100]
  239a0f:	48 89 c7             	mov    rdi,rax
  239a12:	e8 07 0a 00 00       	call   23a41e <get_entry>
  239a17:	83 f8 ff             	cmp    eax,0xffffffff
  239a1a:	75 0a                	jne    239a26 <rm+0x6f>
  239a1c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  239a21:	e9 a8 01 00 00       	jmp    239bce <rm+0x217>
  239a26:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  239a2c:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
  239a30:	48 c7 45 e0 e0 d8 22 	mov    QWORD PTR [rbp-0x20],0x22d8e0
  239a37:	00 
  239a38:	0f b6 05 4e fe fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffefe4e]        # 22988d <superblock+0xd>
  239a3f:	0f b6 c0             	movzx  eax,al
  239a42:	0f b7 55 da          	movzx  edx,WORD PTR [rbp-0x26]
  239a46:	0f b7 ca             	movzx  ecx,dx
  239a49:	8b 15 71 23 00 00    	mov    edx,DWORD PTR [rip+0x2371]        # 23bdc0 <clu_sec_balance>
  239a4f:	01 d1                	add    ecx,edx
  239a51:	89 c2                	mov    edx,eax
  239a53:	89 ce                	mov    esi,ecx
  239a55:	bf e0 d8 22 00       	mov    edi,0x22d8e0
  239a5a:	e8 a3 fe ff ff       	call   239902 <read_sec>
  239a5f:	48 c7 45 e0 e0 d8 22 	mov    QWORD PTR [rbp-0x20],0x22d8e0
  239a66:	00 
  239a67:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  239a6b:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
  239a6f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  239a76:	e9 89 00 00 00       	jmp    239b04 <rm+0x14d>
  239a7b:	0f b6 05 0b fe fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffefe0b]        # 22988d <superblock+0xd>
  239a82:	0f b6 d0             	movzx  edx,al
  239a85:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  239a89:	8b 05 31 23 00 00    	mov    eax,DWORD PTR [rip+0x2331]        # 23bdc0 <clu_sec_balance>
  239a8f:	01 c1                	add    ecx,eax
  239a91:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  239a95:	89 ce                	mov    esi,ecx
  239a97:	48 89 c7             	mov    rdi,rax
  239a9a:	e8 63 fe ff ff       	call   239902 <read_sec>
  239a9f:	eb 44                	jmp    239ae5 <rm+0x12e>
  239aa1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  239aa4:	48 98                	cdqe   
  239aa6:	48 c1 e0 05          	shl    rax,0x5
  239aaa:	48 89 c2             	mov    rdx,rax
  239aad:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  239ab1:	48 01 d0             	add    rax,rdx
  239ab4:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  239ab8:	0f b7 d0             	movzx  edx,ax
  239abb:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  239ac2:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  239ac5:	39 c2                	cmp    edx,eax
  239ac7:	75 18                	jne    239ae1 <rm+0x12a>
  239ac9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  239acc:	48 98                	cdqe   
  239ace:	48 c1 e0 05          	shl    rax,0x5
  239ad2:	48 89 c2             	mov    rdx,rax
  239ad5:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  239ad9:	48 01 d0             	add    rax,rdx
  239adc:	c6 00 e5             	mov    BYTE PTR [rax],0xe5
  239adf:	eb 2f                	jmp    239b10 <rm+0x159>
  239ae1:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  239ae5:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  239ae9:	7e b6                	jle    239aa1 <rm+0xea>
  239aeb:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  239af0:	77 12                	ja     239b04 <rm+0x14d>
  239af2:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  239af6:	48 98                	cdqe   
  239af8:	0f b7 84 00 e0 da 22 	movzx  eax,WORD PTR [rax+rax*1+0x22dae0]
  239aff:	00 
  239b00:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
  239b04:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  239b09:	0f 86 6c ff ff ff    	jbe    239a7b <rm+0xc4>
  239b0f:	90                   	nop
  239b10:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  239b13:	48 98                	cdqe   
  239b15:	48 c1 e0 05          	shl    rax,0x5
  239b19:	48 89 c2             	mov    rdx,rax
  239b1c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  239b20:	48 01 d0             	add    rax,rdx
  239b23:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  239b27:	66 89 45 f6          	mov    WORD PTR [rbp-0xa],ax
  239b2b:	66 83 7d f6 f6       	cmp    WORD PTR [rbp-0xa],0xfff6
  239b30:	77 10                	ja     239b42 <rm+0x18b>
  239b32:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  239b36:	48 98                	cdqe   
  239b38:	0f b7 84 00 e0 da 22 	movzx  eax,WORD PTR [rax+rax*1+0x22dae0]
  239b3f:	00 
  239b40:	eb 05                	jmp    239b47 <rm+0x190>
  239b42:	b8 ff ff ff ff       	mov    eax,0xffffffff
  239b47:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
  239b4b:	eb 2a                	jmp    239b77 <rm+0x1c0>
  239b4d:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  239b51:	48 98                	cdqe   
  239b53:	66 c7 84 00 e0 da 22 	mov    WORD PTR [rax+rax*1+0x22dae0],0x0
  239b5a:	00 00 00 
  239b5d:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  239b61:	66 89 45 f6          	mov    WORD PTR [rbp-0xa],ax
  239b65:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  239b69:	48 98                	cdqe   
  239b6b:	0f b7 84 00 e0 da 22 	movzx  eax,WORD PTR [rax+rax*1+0x22dae0]
  239b72:	00 
  239b73:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
  239b77:	66 83 7d f4 f6       	cmp    WORD PTR [rbp-0xc],0xfff6
  239b7c:	76 cf                	jbe    239b4d <rm+0x196>
  239b7e:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  239b82:	48 98                	cdqe   
  239b84:	66 c7 84 00 e0 da 22 	mov    WORD PTR [rax+rax*1+0x22dae0],0x0
  239b8b:	00 00 00 
  239b8e:	0f b6 05 f8 fc fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffefcf8]        # 22988d <superblock+0xd>
  239b95:	0f b6 d0             	movzx  edx,al
  239b98:	0f b7 05 ec fc fe ff 	movzx  eax,WORD PTR [rip+0xfffffffffffefcec]        # 22988b <superblock+0xb>
  239b9f:	0f b7 c0             	movzx  eax,ax
  239ba2:	0f af d0             	imul   edx,eax
  239ba5:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  239ba9:	8b 05 11 22 00 00    	mov    eax,DWORD PTR [rip+0x2211]        # 23bdc0 <clu_sec_balance>
  239baf:	01 c1                	add    ecx,eax
  239bb1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  239bb5:	89 ce                	mov    esi,ecx
  239bb7:	48 89 c7             	mov    rdi,rax
  239bba:	e8 4f f6 ff ff       	call   23920e <write_sec>
  239bbf:	b8 00 00 00 00       	mov    eax,0x0
  239bc4:	e8 e0 f6 ff ff       	call   2392a9 <update_fat_and_root>
  239bc9:	b8 00 00 00 00       	mov    eax,0x0
  239bce:	c9                   	leave  
  239bcf:	c3                   	ret    

0000000000239bd0 <find>:
  239bd0:	f3 0f 1e fa          	endbr64 
  239bd4:	55                   	push   rbp
  239bd5:	48 89 e5             	mov    rbp,rsp
  239bd8:	48 83 ec 30          	sub    rsp,0x30
  239bdc:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  239be0:	c7 45 fc 00 02 00 00 	mov    DWORD PTR [rbp-0x4],0x200
  239be7:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  239bee:	48 c7 45 f0 e0 d8 22 	mov    QWORD PTR [rbp-0x10],0x22d8e0
  239bf5:	00 
  239bf6:	0f b7 05 dd 3c ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff3cdd]        # 22d8da <cur_dir+0x1a>
  239bfd:	66 89 45 ee          	mov    WORD PTR [rbp-0x12],ax
  239c01:	0f b7 05 d2 3c ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff3cd2]        # 22d8da <cur_dir+0x1a>
  239c08:	66 85 c0             	test   ax,ax
  239c0b:	75 0a                	jne    239c17 <find+0x47>
  239c0d:	48 c7 45 f0 c0 98 22 	mov    QWORD PTR [rbp-0x10],0x2298c0
  239c14:	00 
  239c15:	eb 2b                	jmp    239c42 <find+0x72>
  239c17:	c7 45 fc 10 00 00 00 	mov    DWORD PTR [rbp-0x4],0x10
  239c1e:	0f b6 05 68 fc fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffefc68]        # 22988d <superblock+0xd>
  239c25:	0f b6 d0             	movzx  edx,al
  239c28:	0f b7 4d ee          	movzx  ecx,WORD PTR [rbp-0x12]
  239c2c:	8b 05 8e 21 00 00    	mov    eax,DWORD PTR [rip+0x218e]        # 23bdc0 <clu_sec_balance>
  239c32:	01 c1                	add    ecx,eax
  239c34:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  239c38:	89 ce                	mov    esi,ecx
  239c3a:	48 89 c7             	mov    rdi,rax
  239c3d:	e8 c0 fc ff ff       	call   239902 <read_sec>
  239c42:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  239c49:	eb 57                	jmp    239ca2 <find+0xd2>
  239c4b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  239c4e:	48 98                	cdqe   
  239c50:	48 c1 e0 05          	shl    rax,0x5
  239c54:	48 89 c2             	mov    rdx,rax
  239c57:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  239c5b:	48 01 d0             	add    rax,rdx
  239c5e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  239c61:	84 c0                	test   al,al
  239c63:	74 38                	je     239c9d <find+0xcd>
  239c65:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  239c68:	48 98                	cdqe   
  239c6a:	48 c1 e0 05          	shl    rax,0x5
  239c6e:	48 89 c2             	mov    rdx,rax
  239c71:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  239c75:	48 01 d0             	add    rax,rdx
  239c78:	48 89 c1             	mov    rcx,rax
  239c7b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  239c7f:	ba 0b 00 00 00       	mov    edx,0xb
  239c84:	48 89 c6             	mov    rsi,rax
  239c87:	48 89 cf             	mov    rdi,rcx
  239c8a:	e8 17 16 00 00       	call   23b2a6 <memcmp>
  239c8f:	85 c0                	test   eax,eax
  239c91:	75 0b                	jne    239c9e <find+0xce>
  239c93:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  239c96:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  239c99:	01 d0                	add    eax,edx
  239c9b:	eb 71                	jmp    239d0e <find+0x13e>
  239c9d:	90                   	nop
  239c9e:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  239ca2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  239ca5:	3b 45 fc             	cmp    eax,DWORD PTR [rbp-0x4]
  239ca8:	7c a1                	jl     239c4b <find+0x7b>
  239caa:	0f b7 05 29 3c ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff3c29]        # 22d8da <cur_dir+0x1a>
  239cb1:	66 85 c0             	test   ax,ax
  239cb4:	75 07                	jne    239cbd <find+0xed>
  239cb6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  239cbb:	eb 51                	jmp    239d0e <find+0x13e>
  239cbd:	66 83 7d ee f6       	cmp    WORD PTR [rbp-0x12],0xfff6
  239cc2:	77 3a                	ja     239cfe <find+0x12e>
  239cc4:	83 45 f8 10          	add    DWORD PTR [rbp-0x8],0x10
  239cc8:	0f b7 45 ee          	movzx  eax,WORD PTR [rbp-0x12]
  239ccc:	48 98                	cdqe   
  239cce:	0f b7 84 00 e0 da 22 	movzx  eax,WORD PTR [rax+rax*1+0x22dae0]
  239cd5:	00 
  239cd6:	66 89 45 ee          	mov    WORD PTR [rbp-0x12],ax
  239cda:	0f b6 05 ac fb fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffefbac]        # 22988d <superblock+0xd>
  239ce1:	0f b6 d0             	movzx  edx,al
  239ce4:	0f b7 4d ee          	movzx  ecx,WORD PTR [rbp-0x12]
  239ce8:	8b 05 d2 20 00 00    	mov    eax,DWORD PTR [rip+0x20d2]        # 23bdc0 <clu_sec_balance>
  239cee:	01 c1                	add    ecx,eax
  239cf0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  239cf4:	89 ce                	mov    esi,ecx
  239cf6:	48 89 c7             	mov    rdi,rax
  239cf9:	e8 04 fc ff ff       	call   239902 <read_sec>
  239cfe:	66 83 7d ee f6       	cmp    WORD PTR [rbp-0x12],0xfff6
  239d03:	0f 86 39 ff ff ff    	jbe    239c42 <find+0x72>
  239d09:	b8 ff ff ff ff       	mov    eax,0xffffffff
  239d0e:	c9                   	leave  
  239d0f:	c3                   	ret    

0000000000239d10 <read_file_byname>:
  239d10:	f3 0f 1e fa          	endbr64 
  239d14:	55                   	push   rbp
  239d15:	48 89 e5             	mov    rbp,rsp
  239d18:	41 57                	push   r15
  239d1a:	41 56                	push   r14
  239d1c:	41 55                	push   r13
  239d1e:	41 54                	push   r12
  239d20:	53                   	push   rbx
  239d21:	48 81 ec 88 00 00 00 	sub    rsp,0x88
  239d28:	48 89 bd 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdi
  239d2f:	48 89 b5 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rsi
  239d36:	89 95 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edx
  239d3c:	89 8d 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],ecx
  239d42:	48 89 e0             	mov    rax,rsp
  239d45:	48 89 c3             	mov    rbx,rax
  239d48:	bf 00 00 00 00       	mov    edi,0x0
  239d4d:	e8 7e fe ff ff       	call   239bd0 <find>
  239d52:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
  239d55:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  239d59:	74 09                	je     239d64 <read_file_byname+0x54>
  239d5b:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  239d62:	79 0a                	jns    239d6e <read_file_byname+0x5e>
  239d64:	b8 ff ff ff ff       	mov    eax,0xffffffff
  239d69:	e9 ea 02 00 00       	jmp    23a058 <read_file_byname+0x348>
  239d6e:	c7 45 b0 00 02 00 00 	mov    DWORD PTR [rbp-0x50],0x200
  239d75:	48 c7 45 c0 c0 98 22 	mov    QWORD PTR [rbp-0x40],0x2298c0
  239d7c:	00 
  239d7d:	c7 45 bc 01 00 00 00 	mov    DWORD PTR [rbp-0x44],0x1
  239d84:	0f b7 05 4f 3b ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff3b4f]        # 22d8da <cur_dir+0x1a>
  239d8b:	66 85 c0             	test   ax,ax
  239d8e:	74 40                	je     239dd0 <read_file_byname+0xc0>
  239d90:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
  239d97:	c7 45 b0 10 00 00 00 	mov    DWORD PTR [rbp-0x50],0x10
  239d9e:	0f b6 05 e8 fa fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffefae8]        # 22988d <superblock+0xd>
  239da5:	0f b6 c0             	movzx  eax,al
  239da8:	0f b7 15 2b 3b ff ff 	movzx  edx,WORD PTR [rip+0xffffffffffff3b2b]        # 22d8da <cur_dir+0x1a>
  239daf:	0f b7 ca             	movzx  ecx,dx
  239db2:	8b 15 08 20 00 00    	mov    edx,DWORD PTR [rip+0x2008]        # 23bdc0 <clu_sec_balance>
  239db8:	01 d1                	add    ecx,edx
  239dba:	89 c2                	mov    edx,eax
  239dbc:	89 ce                	mov    esi,ecx
  239dbe:	bf e0 d8 22 00       	mov    edi,0x22d8e0
  239dc3:	e8 3a fb ff ff       	call   239902 <read_sec>
  239dc8:	48 c7 45 c0 e0 d8 22 	mov    QWORD PTR [rbp-0x40],0x22d8e0
  239dcf:	00 
  239dd0:	0f b7 05 03 3b ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff3b03]        # 22d8da <cur_dir+0x1a>
  239dd7:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
  239ddb:	eb 41                	jmp    239e1e <read_file_byname+0x10e>
  239ddd:	83 6d cc 10          	sub    DWORD PTR [rbp-0x34],0x10
  239de1:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  239de6:	77 36                	ja     239e1e <read_file_byname+0x10e>
  239de8:	0f b7 45 ba          	movzx  eax,WORD PTR [rbp-0x46]
  239dec:	48 98                	cdqe   
  239dee:	0f b7 84 00 e0 da 22 	movzx  eax,WORD PTR [rax+rax*1+0x22dae0]
  239df5:	00 
  239df6:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
  239dfa:	0f b6 05 8c fa fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffefa8c]        # 22988d <superblock+0xd>
  239e01:	0f b6 d0             	movzx  edx,al
  239e04:	0f b7 4d ba          	movzx  ecx,WORD PTR [rbp-0x46]
  239e08:	8b 05 b2 1f 00 00    	mov    eax,DWORD PTR [rip+0x1fb2]        # 23bdc0 <clu_sec_balance>
  239e0e:	01 c1                	add    ecx,eax
  239e10:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  239e14:	89 ce                	mov    esi,ecx
  239e16:	48 89 c7             	mov    rdi,rax
  239e19:	e8 e4 fa ff ff       	call   239902 <read_sec>
  239e1e:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  239e22:	75 0d                	jne    239e31 <read_file_byname+0x121>
  239e24:	83 7d cc 0f          	cmp    DWORD PTR [rbp-0x34],0xf
  239e28:	7e 07                	jle    239e31 <read_file_byname+0x121>
  239e2a:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  239e2f:	76 ac                	jbe    239ddd <read_file_byname+0xcd>
  239e31:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  239e34:	48 98                	cdqe   
  239e36:	48 c1 e0 05          	shl    rax,0x5
  239e3a:	48 89 c2             	mov    rdx,rax
  239e3d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  239e41:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  239e45:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  239e48:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  239e4c:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  239e53:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  239e5a:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  239e5e:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  239e62:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
  239e66:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
  239e6a:	0f b7 45 8a          	movzx  eax,WORD PTR [rbp-0x76]
  239e6e:	0f b7 c0             	movzx  eax,ax
  239e71:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
  239e74:	0f b7 05 10 fa fe ff 	movzx  eax,WORD PTR [rip+0xfffffffffffefa10]        # 22988b <superblock+0xb>
  239e7b:	0f b7 d0             	movzx  edx,ax
  239e7e:	0f b6 05 08 fa fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffefa08]        # 22988d <superblock+0xd>
  239e85:	0f b6 c0             	movzx  eax,al
  239e88:	0f af c2             	imul   eax,edx
  239e8b:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
  239e8e:	eb 25                	jmp    239eb5 <read_file_byname+0x1a5>
  239e90:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  239e93:	29 85 5c ff ff ff    	sub    DWORD PTR [rbp-0xa4],eax
  239e99:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  239e9c:	48 98                	cdqe   
  239e9e:	0f b7 84 00 e0 da 22 	movzx  eax,WORD PTR [rax+rax*1+0x22dae0]
  239ea5:	00 
  239ea6:	98                   	cwde   
  239ea7:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
  239eaa:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  239eb0:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  239eb3:	7c 0d                	jl     239ec2 <read_file_byname+0x1b2>
  239eb5:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  239ebb:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  239ebe:	7d d0                	jge    239e90 <read_file_byname+0x180>
  239ec0:	eb 01                	jmp    239ec3 <read_file_byname+0x1b3>
  239ec2:	90                   	nop
  239ec3:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  239eca:	7e 15                	jle    239ee1 <read_file_byname+0x1d1>
  239ecc:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  239ed2:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  239ed5:	7c 0a                	jl     239ee1 <read_file_byname+0x1d1>
  239ed7:	b8 ff ff ff ff       	mov    eax,0xffffffff
  239edc:	e9 77 01 00 00       	jmp    23a058 <read_file_byname+0x348>
  239ee1:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  239ee4:	48 63 d0             	movsxd rdx,eax
  239ee7:	48 83 ea 01          	sub    rdx,0x1
  239eeb:	48 89 55 a0          	mov    QWORD PTR [rbp-0x60],rdx
  239eef:	48 63 d0             	movsxd rdx,eax
  239ef2:	49 89 d6             	mov    r14,rdx
  239ef5:	41 bf 00 00 00 00    	mov    r15d,0x0
  239efb:	48 63 d0             	movsxd rdx,eax
  239efe:	49 89 d4             	mov    r12,rdx
  239f01:	41 bd 00 00 00 00    	mov    r13d,0x0
  239f07:	48 98                	cdqe   
  239f09:	ba 10 00 00 00       	mov    edx,0x10
  239f0e:	48 83 ea 01          	sub    rdx,0x1
  239f12:	48 01 d0             	add    rax,rdx
  239f15:	be 10 00 00 00       	mov    esi,0x10
  239f1a:	ba 00 00 00 00       	mov    edx,0x0
  239f1f:	48 f7 f6             	div    rsi
  239f22:	48 6b c0 10          	imul   rax,rax,0x10
  239f26:	48 89 c1             	mov    rcx,rax
  239f29:	48 81 e1 00 f0 ff ff 	and    rcx,0xfffffffffffff000
  239f30:	48 89 e2             	mov    rdx,rsp
  239f33:	48 29 ca             	sub    rdx,rcx
  239f36:	48 39 d4             	cmp    rsp,rdx
  239f39:	74 12                	je     239f4d <read_file_byname+0x23d>
  239f3b:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
  239f42:	48 83 8c 24 f8 0f 00 	or     QWORD PTR [rsp+0xff8],0x0
  239f49:	00 00 
  239f4b:	eb e9                	jmp    239f36 <read_file_byname+0x226>
  239f4d:	48 89 c2             	mov    rdx,rax
  239f50:	81 e2 ff 0f 00 00    	and    edx,0xfff
  239f56:	48 29 d4             	sub    rsp,rdx
  239f59:	48 89 c2             	mov    rdx,rax
  239f5c:	81 e2 ff 0f 00 00    	and    edx,0xfff
  239f62:	48 85 d2             	test   rdx,rdx
  239f65:	74 10                	je     239f77 <read_file_byname+0x267>
  239f67:	25 ff 0f 00 00       	and    eax,0xfff
  239f6c:	48 83 e8 08          	sub    rax,0x8
  239f70:	48 01 e0             	add    rax,rsp
  239f73:	48 83 08 00          	or     QWORD PTR [rax],0x0
  239f77:	48 89 e0             	mov    rax,rsp
  239f7a:	48 83 c0 00          	add    rax,0x0
  239f7e:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
  239f82:	0f b6 05 04 f9 fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffef904]        # 22988d <superblock+0xd>
  239f89:	0f b6 d0             	movzx  edx,al
  239f8c:	8b 0d 2e 1e 00 00    	mov    ecx,DWORD PTR [rip+0x1e2e]        # 23bdc0 <clu_sec_balance>
  239f92:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  239f95:	01 c1                	add    ecx,eax
  239f97:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  239f9b:	89 ce                	mov    esi,ecx
  239f9d:	48 89 c7             	mov    rdi,rax
  239fa0:	e8 5d f9 ff ff       	call   239902 <read_sec>
  239fa5:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  239fa8:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  239fae:	89 c2                	mov    edx,eax
  239fb0:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  239fb6:	48 63 c8             	movsxd rcx,eax
  239fb9:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  239fbd:	48 01 c1             	add    rcx,rax
  239fc0:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  239fc7:	48 89 ce             	mov    rsi,rcx
  239fca:	48 89 c7             	mov    rdi,rax
  239fcd:	e8 8a 12 00 00       	call   23b25c <memcpy>
  239fd2:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  239fd5:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  239fdb:	48 98                	cdqe   
  239fdd:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
  239fe4:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  239fe7:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  239fed:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
  239ff3:	eb 4c                	jmp    23a041 <read_file_byname+0x331>
  239ff5:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  239ff8:	48 98                	cdqe   
  239ffa:	0f b7 84 00 e0 da 22 	movzx  eax,WORD PTR [rax+rax*1+0x22dae0]
  23a001:	00 
  23a002:	98                   	cwde   
  23a003:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
  23a006:	0f b6 05 80 f8 fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffef880]        # 22988d <superblock+0xd>
  23a00d:	0f b6 d0             	movzx  edx,al
  23a010:	8b 0d aa 1d 00 00    	mov    ecx,DWORD PTR [rip+0x1daa]        # 23bdc0 <clu_sec_balance>
  23a016:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  23a019:	01 c1                	add    ecx,eax
  23a01b:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  23a022:	89 ce                	mov    esi,ecx
  23a024:	48 89 c7             	mov    rdi,rax
  23a027:	e8 d6 f8 ff ff       	call   239902 <read_sec>
  23a02c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  23a02f:	48 98                	cdqe   
  23a031:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
  23a038:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  23a03b:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
  23a041:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  23a048:	7f 09                	jg     23a053 <read_file_byname+0x343>
  23a04a:	83 bd 58 ff ff ff 00 	cmp    DWORD PTR [rbp-0xa8],0x0
  23a051:	7f a2                	jg     239ff5 <read_file_byname+0x2e5>
  23a053:	b8 00 00 00 00       	mov    eax,0x0
  23a058:	48 89 dc             	mov    rsp,rbx
  23a05b:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
  23a05f:	5b                   	pop    rbx
  23a060:	41 5c                	pop    r12
  23a062:	41 5d                	pop    r13
  23a064:	41 5e                	pop    r14
  23a066:	41 5f                	pop    r15
  23a068:	5d                   	pop    rbp
  23a069:	c3                   	ret    

000000000023a06a <write_file_byname>:
  23a06a:	f3 0f 1e fa          	endbr64 
  23a06e:	55                   	push   rbp
  23a06f:	48 89 e5             	mov    rbp,rsp
  23a072:	41 57                	push   r15
  23a074:	41 56                	push   r14
  23a076:	41 55                	push   r13
  23a078:	41 54                	push   r12
  23a07a:	53                   	push   rbx
  23a07b:	48 81 ec 88 00 00 00 	sub    rsp,0x88
  23a082:	48 89 bd 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdi
  23a089:	48 89 b5 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rsi
  23a090:	89 95 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edx
  23a096:	89 8d 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],ecx
  23a09c:	48 89 e0             	mov    rax,rsp
  23a09f:	48 89 c3             	mov    rbx,rax
  23a0a2:	bf 00 00 00 00       	mov    edi,0x0
  23a0a7:	e8 24 fb ff ff       	call   239bd0 <find>
  23a0ac:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
  23a0af:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  23a0b3:	74 09                	je     23a0be <write_file_byname+0x54>
  23a0b5:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  23a0bc:	79 0a                	jns    23a0c8 <write_file_byname+0x5e>
  23a0be:	b8 ff ff ff ff       	mov    eax,0xffffffff
  23a0c3:	e9 1e 03 00 00       	jmp    23a3e6 <write_file_byname+0x37c>
  23a0c8:	c7 45 b0 00 02 00 00 	mov    DWORD PTR [rbp-0x50],0x200
  23a0cf:	48 c7 45 c0 c0 98 22 	mov    QWORD PTR [rbp-0x40],0x2298c0
  23a0d6:	00 
  23a0d7:	c7 45 bc 01 00 00 00 	mov    DWORD PTR [rbp-0x44],0x1
  23a0de:	0f b7 05 f5 37 ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff37f5]        # 22d8da <cur_dir+0x1a>
  23a0e5:	66 85 c0             	test   ax,ax
  23a0e8:	74 40                	je     23a12a <write_file_byname+0xc0>
  23a0ea:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
  23a0f1:	c7 45 b0 10 00 00 00 	mov    DWORD PTR [rbp-0x50],0x10
  23a0f8:	0f b6 05 8e f7 fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffef78e]        # 22988d <superblock+0xd>
  23a0ff:	0f b6 c0             	movzx  eax,al
  23a102:	0f b7 15 d1 37 ff ff 	movzx  edx,WORD PTR [rip+0xffffffffffff37d1]        # 22d8da <cur_dir+0x1a>
  23a109:	0f b7 ca             	movzx  ecx,dx
  23a10c:	8b 15 ae 1c 00 00    	mov    edx,DWORD PTR [rip+0x1cae]        # 23bdc0 <clu_sec_balance>
  23a112:	01 d1                	add    ecx,edx
  23a114:	89 c2                	mov    edx,eax
  23a116:	89 ce                	mov    esi,ecx
  23a118:	bf e0 d8 22 00       	mov    edi,0x22d8e0
  23a11d:	e8 e0 f7 ff ff       	call   239902 <read_sec>
  23a122:	48 c7 45 c0 e0 d8 22 	mov    QWORD PTR [rbp-0x40],0x22d8e0
  23a129:	00 
  23a12a:	0f b7 05 a9 37 ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff37a9]        # 22d8da <cur_dir+0x1a>
  23a131:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
  23a135:	eb 41                	jmp    23a178 <write_file_byname+0x10e>
  23a137:	83 6d cc 10          	sub    DWORD PTR [rbp-0x34],0x10
  23a13b:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  23a140:	77 36                	ja     23a178 <write_file_byname+0x10e>
  23a142:	0f b7 45 ba          	movzx  eax,WORD PTR [rbp-0x46]
  23a146:	48 98                	cdqe   
  23a148:	0f b7 84 00 e0 da 22 	movzx  eax,WORD PTR [rax+rax*1+0x22dae0]
  23a14f:	00 
  23a150:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
  23a154:	0f b6 05 32 f7 fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffef732]        # 22988d <superblock+0xd>
  23a15b:	0f b6 d0             	movzx  edx,al
  23a15e:	0f b7 4d ba          	movzx  ecx,WORD PTR [rbp-0x46]
  23a162:	8b 05 58 1c 00 00    	mov    eax,DWORD PTR [rip+0x1c58]        # 23bdc0 <clu_sec_balance>
  23a168:	01 c1                	add    ecx,eax
  23a16a:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  23a16e:	89 ce                	mov    esi,ecx
  23a170:	48 89 c7             	mov    rdi,rax
  23a173:	e8 8a f7 ff ff       	call   239902 <read_sec>
  23a178:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  23a17c:	75 0d                	jne    23a18b <write_file_byname+0x121>
  23a17e:	83 7d cc 0f          	cmp    DWORD PTR [rbp-0x34],0xf
  23a182:	7e 07                	jle    23a18b <write_file_byname+0x121>
  23a184:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  23a189:	76 ac                	jbe    23a137 <write_file_byname+0xcd>
  23a18b:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  23a18e:	48 98                	cdqe   
  23a190:	48 c1 e0 05          	shl    rax,0x5
  23a194:	48 89 c2             	mov    rdx,rax
  23a197:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  23a19b:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  23a19f:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  23a1a2:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  23a1a6:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  23a1ad:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  23a1b4:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  23a1b8:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  23a1bc:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
  23a1c0:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
  23a1c4:	0f b7 45 8a          	movzx  eax,WORD PTR [rbp-0x76]
  23a1c8:	0f b7 c0             	movzx  eax,ax
  23a1cb:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
  23a1ce:	0f b7 05 b6 f6 fe ff 	movzx  eax,WORD PTR [rip+0xfffffffffffef6b6]        # 22988b <superblock+0xb>
  23a1d5:	0f b7 d0             	movzx  edx,ax
  23a1d8:	0f b6 05 ae f6 fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffef6ae]        # 22988d <superblock+0xd>
  23a1df:	0f b6 c0             	movzx  eax,al
  23a1e2:	0f af c2             	imul   eax,edx
  23a1e5:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
  23a1e8:	eb 25                	jmp    23a20f <write_file_byname+0x1a5>
  23a1ea:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  23a1ed:	29 85 5c ff ff ff    	sub    DWORD PTR [rbp-0xa4],eax
  23a1f3:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  23a1f9:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  23a1fc:	7c 1e                	jl     23a21c <write_file_byname+0x1b2>
  23a1fe:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  23a201:	48 98                	cdqe   
  23a203:	0f b7 84 00 e0 da 22 	movzx  eax,WORD PTR [rax+rax*1+0x22dae0]
  23a20a:	00 
  23a20b:	98                   	cwde   
  23a20c:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
  23a20f:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  23a215:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  23a218:	7d d0                	jge    23a1ea <write_file_byname+0x180>
  23a21a:	eb 01                	jmp    23a21d <write_file_byname+0x1b3>
  23a21c:	90                   	nop
  23a21d:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  23a224:	7e 15                	jle    23a23b <write_file_byname+0x1d1>
  23a226:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  23a22c:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  23a22f:	7c 0a                	jl     23a23b <write_file_byname+0x1d1>
  23a231:	b8 ff ff ff ff       	mov    eax,0xffffffff
  23a236:	e9 ab 01 00 00       	jmp    23a3e6 <write_file_byname+0x37c>
  23a23b:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  23a23e:	48 63 d0             	movsxd rdx,eax
  23a241:	48 83 ea 01          	sub    rdx,0x1
  23a245:	48 89 55 a0          	mov    QWORD PTR [rbp-0x60],rdx
  23a249:	48 63 d0             	movsxd rdx,eax
  23a24c:	49 89 d6             	mov    r14,rdx
  23a24f:	41 bf 00 00 00 00    	mov    r15d,0x0
  23a255:	48 63 d0             	movsxd rdx,eax
  23a258:	49 89 d4             	mov    r12,rdx
  23a25b:	41 bd 00 00 00 00    	mov    r13d,0x0
  23a261:	48 98                	cdqe   
  23a263:	ba 10 00 00 00       	mov    edx,0x10
  23a268:	48 83 ea 01          	sub    rdx,0x1
  23a26c:	48 01 d0             	add    rax,rdx
  23a26f:	be 10 00 00 00       	mov    esi,0x10
  23a274:	ba 00 00 00 00       	mov    edx,0x0
  23a279:	48 f7 f6             	div    rsi
  23a27c:	48 6b c0 10          	imul   rax,rax,0x10
  23a280:	48 89 c1             	mov    rcx,rax
  23a283:	48 81 e1 00 f0 ff ff 	and    rcx,0xfffffffffffff000
  23a28a:	48 89 e2             	mov    rdx,rsp
  23a28d:	48 29 ca             	sub    rdx,rcx
  23a290:	48 39 d4             	cmp    rsp,rdx
  23a293:	74 12                	je     23a2a7 <write_file_byname+0x23d>
  23a295:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
  23a29c:	48 83 8c 24 f8 0f 00 	or     QWORD PTR [rsp+0xff8],0x0
  23a2a3:	00 00 
  23a2a5:	eb e9                	jmp    23a290 <write_file_byname+0x226>
  23a2a7:	48 89 c2             	mov    rdx,rax
  23a2aa:	81 e2 ff 0f 00 00    	and    edx,0xfff
  23a2b0:	48 29 d4             	sub    rsp,rdx
  23a2b3:	48 89 c2             	mov    rdx,rax
  23a2b6:	81 e2 ff 0f 00 00    	and    edx,0xfff
  23a2bc:	48 85 d2             	test   rdx,rdx
  23a2bf:	74 10                	je     23a2d1 <write_file_byname+0x267>
  23a2c1:	25 ff 0f 00 00       	and    eax,0xfff
  23a2c6:	48 83 e8 08          	sub    rax,0x8
  23a2ca:	48 01 e0             	add    rax,rsp
  23a2cd:	48 83 08 00          	or     QWORD PTR [rax],0x0
  23a2d1:	48 89 e0             	mov    rax,rsp
  23a2d4:	48 83 c0 00          	add    rax,0x0
  23a2d8:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
  23a2dc:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  23a2e3:	0f 8e a2 00 00 00    	jle    23a38b <write_file_byname+0x321>
  23a2e9:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  23a2ec:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  23a2f2:	89 c2                	mov    edx,eax
  23a2f4:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  23a2fa:	48 63 c8             	movsxd rcx,eax
  23a2fd:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  23a301:	48 01 c1             	add    rcx,rax
  23a304:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  23a30b:	48 89 c6             	mov    rsi,rax
  23a30e:	48 89 cf             	mov    rdi,rcx
  23a311:	e8 46 0f 00 00       	call   23b25c <memcpy>
  23a316:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  23a319:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  23a31f:	89 c2                	mov    edx,eax
  23a321:	8b 4d b4             	mov    ecx,DWORD PTR [rbp-0x4c]
  23a324:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  23a328:	89 ce                	mov    esi,ecx
  23a32a:	48 89 c7             	mov    rdi,rax
  23a32d:	e8 dc ee ff ff       	call   23920e <write_sec>
  23a332:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  23a335:	48 98                	cdqe   
  23a337:	0f b7 84 00 e0 da 22 	movzx  eax,WORD PTR [rax+rax*1+0x22dae0]
  23a33e:	00 
  23a33f:	98                   	cwde   
  23a340:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
  23a343:	eb 46                	jmp    23a38b <write_file_byname+0x321>
  23a345:	8b 15 75 1a 00 00    	mov    edx,DWORD PTR [rip+0x1a75]        # 23bdc0 <clu_sec_balance>
  23a34b:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  23a34e:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  23a351:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  23a354:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  23a35b:	89 ce                	mov    esi,ecx
  23a35d:	48 89 c7             	mov    rdi,rax
  23a360:	e8 a9 ee ff ff       	call   23920e <write_sec>
  23a365:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  23a368:	48 98                	cdqe   
  23a36a:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
  23a371:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  23a374:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
  23a37a:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  23a37d:	48 98                	cdqe   
  23a37f:	0f b7 84 00 e0 da 22 	movzx  eax,WORD PTR [rax+rax*1+0x22dae0]
  23a386:	00 
  23a387:	98                   	cwde   
  23a388:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
  23a38b:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  23a392:	7f 0b                	jg     23a39f <write_file_byname+0x335>
  23a394:	8b 85 58 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa8]
  23a39a:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  23a39d:	7d a6                	jge    23a345 <write_file_byname+0x2db>
  23a39f:	83 bd 58 ff ff ff 00 	cmp    DWORD PTR [rbp-0xa8],0x0
  23a3a6:	7e 39                	jle    23a3e1 <write_file_byname+0x377>
  23a3a8:	8b 95 58 ff ff ff    	mov    edx,DWORD PTR [rbp-0xa8]
  23a3ae:	48 8b 8d 60 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa0]
  23a3b5:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  23a3b9:	48 89 ce             	mov    rsi,rcx
  23a3bc:	48 89 c7             	mov    rdi,rax
  23a3bf:	e8 98 0e 00 00       	call   23b25c <memcpy>
  23a3c4:	8b 15 f6 19 00 00    	mov    edx,DWORD PTR [rip+0x19f6]        # 23bdc0 <clu_sec_balance>
  23a3ca:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  23a3cd:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  23a3d0:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  23a3d3:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  23a3d7:	89 ce                	mov    esi,ecx
  23a3d9:	48 89 c7             	mov    rdi,rax
  23a3dc:	e8 2d ee ff ff       	call   23920e <write_sec>
  23a3e1:	b8 00 00 00 00       	mov    eax,0x0
  23a3e6:	48 89 dc             	mov    rsp,rbx
  23a3e9:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
  23a3ed:	5b                   	pop    rbx
  23a3ee:	41 5c                	pop    r12
  23a3f0:	41 5d                	pop    r13
  23a3f2:	41 5e                	pop    r14
  23a3f4:	41 5f                	pop    r15
  23a3f6:	5d                   	pop    rbp
  23a3f7:	c3                   	ret    

000000000023a3f8 <file_exist>:
  23a3f8:	f3 0f 1e fa          	endbr64 
  23a3fc:	55                   	push   rbp
  23a3fd:	48 89 e5             	mov    rbp,rsp
  23a400:	0f b6 45 10          	movzx  eax,BYTE PTR [rbp+0x10]
  23a404:	3c e5                	cmp    al,0xe5
  23a406:	74 08                	je     23a410 <file_exist+0x18>
  23a408:	0f b6 45 10          	movzx  eax,BYTE PTR [rbp+0x10]
  23a40c:	84 c0                	test   al,al
  23a40e:	75 07                	jne    23a417 <file_exist+0x1f>
  23a410:	b8 00 00 00 00       	mov    eax,0x0
  23a415:	eb 05                	jmp    23a41c <file_exist+0x24>
  23a417:	b8 01 00 00 00       	mov    eax,0x1
  23a41c:	5d                   	pop    rbp
  23a41d:	c3                   	ret    

000000000023a41e <get_entry>:
  23a41e:	f3 0f 1e fa          	endbr64 
  23a422:	55                   	push   rbp
  23a423:	48 89 e5             	mov    rbp,rsp
  23a426:	53                   	push   rbx
  23a427:	48 81 ec e8 00 00 00 	sub    rsp,0xe8
  23a42e:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
  23a435:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  23a43c:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  23a440:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  23a444:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  23a44b:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  23a452:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  23a455:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
  23a459:	c6 45 90 e5          	mov    BYTE PTR [rbp-0x70],0xe5
  23a45d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  23a461:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  23a465:	c7 45 dc ff ff ff ff 	mov    DWORD PTR [rbp-0x24],0xffffffff
  23a46c:	e9 2c 01 00 00       	jmp    23a59d <get_entry+0x17f>
  23a471:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  23a475:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23a478:	3c 2f                	cmp    al,0x2f
  23a47a:	0f 85 18 01 00 00    	jne    23a598 <get_entry+0x17a>
  23a480:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  23a484:	48 2b 45 e0          	sub    rax,QWORD PTR [rbp-0x20]
  23a488:	48 83 f8 0b          	cmp    rax,0xb
  23a48c:	7e 0a                	jle    23a498 <get_entry+0x7a>
  23a48e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  23a493:	e9 50 02 00 00       	jmp    23a6e8 <get_entry+0x2ca>
  23a498:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  23a49c:	48 2b 45 e0          	sub    rax,QWORD PTR [rbp-0x20]
  23a4a0:	89 c2                	mov    edx,eax
  23a4a2:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  23a4a6:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  23a4ad:	48 89 ce             	mov    rsi,rcx
  23a4b0:	48 89 c7             	mov    rdi,rax
  23a4b3:	e8 a4 0d 00 00       	call   23b25c <memcpy>
  23a4b8:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  23a4bc:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  23a4c0:	48 89 05 f9 33 ff ff 	mov    QWORD PTR [rip+0xffffffffffff33f9],rax        # 22d8c0 <cur_dir>
  23a4c7:	48 89 15 fa 33 ff ff 	mov    QWORD PTR [rip+0xffffffffffff33fa],rdx        # 22d8c8 <cur_dir+0x8>
  23a4ce:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  23a4d2:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  23a4d6:	48 89 05 f3 33 ff ff 	mov    QWORD PTR [rip+0xffffffffffff33f3],rax        # 22d8d0 <cur_dir+0x10>
  23a4dd:	48 89 15 f4 33 ff ff 	mov    QWORD PTR [rip+0xffffffffffff33f4],rdx        # 22d8d8 <cur_dir+0x18>
  23a4e4:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  23a4eb:	48 89 c7             	mov    rdi,rax
  23a4ee:	e8 c3 eb ff ff       	call   2390b6 <format_name>
  23a4f3:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  23a4fa:	48 89 c7             	mov    rdi,rax
  23a4fd:	e8 ce f6 ff ff       	call   239bd0 <find>
  23a502:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
  23a505:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  23a509:	75 0a                	jne    23a515 <get_entry+0xf7>
  23a50b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  23a510:	e9 d3 01 00 00       	jmp    23a6e8 <get_entry+0x2ca>
  23a515:	0f b7 05 be 33 ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff33be]        # 22d8da <cur_dir+0x1a>
  23a51c:	66 85 c0             	test   ax,ax
  23a51f:	75 31                	jne    23a552 <get_entry+0x134>
  23a521:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  23a524:	48 98                	cdqe   
  23a526:	48 c1 e0 05          	shl    rax,0x5
  23a52a:	48 8d 88 c0 98 22 00 	lea    rcx,[rax+0x2298c0]
  23a531:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  23a534:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  23a538:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  23a53c:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  23a540:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  23a544:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  23a548:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  23a54c:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  23a550:	eb 3a                	jmp    23a58c <get_entry+0x16e>
  23a552:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  23a555:	99                   	cdq    
  23a556:	c1 ea 1c             	shr    edx,0x1c
  23a559:	01 d0                	add    eax,edx
  23a55b:	83 e0 0f             	and    eax,0xf
  23a55e:	29 d0                	sub    eax,edx
  23a560:	48 98                	cdqe   
  23a562:	48 c1 e0 05          	shl    rax,0x5
  23a566:	48 8d 88 e0 d8 22 00 	lea    rcx,[rax+0x22d8e0]
  23a56d:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  23a570:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  23a574:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  23a578:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  23a57c:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  23a580:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  23a584:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  23a588:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  23a58c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  23a590:	48 83 c0 01          	add    rax,0x1
  23a594:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  23a598:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  23a59d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  23a5a1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23a5a4:	84 c0                	test   al,al
  23a5a6:	0f 85 c5 fe ff ff    	jne    23a471 <get_entry+0x53>
  23a5ac:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  23a5b0:	48 89 c7             	mov    rdi,rax
  23a5b3:	e8 fe ea ff ff       	call   2390b6 <format_name>
  23a5b8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  23a5bc:	48 89 c7             	mov    rdi,rax
  23a5bf:	e8 0c f6 ff ff       	call   239bd0 <find>
  23a5c4:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
  23a5c7:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  23a5cb:	75 0a                	jne    23a5d7 <get_entry+0x1b9>
  23a5cd:	b8 ff ff ff ff       	mov    eax,0xffffffff
  23a5d2:	e9 11 01 00 00       	jmp    23a6e8 <get_entry+0x2ca>
  23a5d7:	0f b7 05 fc 32 ff ff 	movzx  eax,WORD PTR [rip+0xffffffffffff32fc]        # 22d8da <cur_dir+0x1a>
  23a5de:	66 85 c0             	test   ax,ax
  23a5e1:	75 31                	jne    23a614 <get_entry+0x1f6>
  23a5e3:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  23a5e6:	48 98                	cdqe   
  23a5e8:	48 c1 e0 05          	shl    rax,0x5
  23a5ec:	48 8d 88 c0 98 22 00 	lea    rcx,[rax+0x2298c0]
  23a5f3:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  23a5f6:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  23a5fa:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  23a5fe:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  23a602:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  23a606:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  23a60a:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  23a60e:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  23a612:	eb 3a                	jmp    23a64e <get_entry+0x230>
  23a614:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  23a617:	99                   	cdq    
  23a618:	c1 ea 1c             	shr    edx,0x1c
  23a61b:	01 d0                	add    eax,edx
  23a61d:	83 e0 0f             	and    eax,0xf
  23a620:	29 d0                	sub    eax,edx
  23a622:	48 98                	cdqe   
  23a624:	48 c1 e0 05          	shl    rax,0x5
  23a628:	48 8d 88 e0 d8 22 00 	lea    rcx,[rax+0x22d8e0]
  23a62f:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  23a632:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  23a636:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  23a63a:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  23a63e:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  23a642:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  23a646:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  23a64a:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  23a64e:	0f b7 45 aa          	movzx  eax,WORD PTR [rbp-0x56]
  23a652:	0f b7 c0             	movzx  eax,ax
  23a655:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
  23a65b:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  23a662:	48 8b 8d 30 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xd0]
  23a669:	48 8b 9d 38 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xc8]
  23a670:	48 89 48 28          	mov    QWORD PTR [rax+0x28],rcx
  23a674:	48 89 58 30          	mov    QWORD PTR [rax+0x30],rbx
  23a678:	48 8b 8d 40 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xc0]
  23a67f:	48 8b 9d 48 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xb8]
  23a686:	48 89 48 38          	mov    QWORD PTR [rax+0x38],rcx
  23a68a:	48 89 58 40          	mov    QWORD PTR [rax+0x40],rbx
  23a68e:	48 8b 8d 50 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xb0]
  23a695:	48 8b 9d 58 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xa8]
  23a69c:	48 89 48 48          	mov    QWORD PTR [rax+0x48],rcx
  23a6a0:	48 89 58 50          	mov    QWORD PTR [rax+0x50],rbx
  23a6a4:	48 8b 8d 60 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa0]
  23a6ab:	48 8b 9d 68 ff ff ff 	mov    rbx,QWORD PTR [rbp-0x98]
  23a6b2:	48 89 48 58          	mov    QWORD PTR [rax+0x58],rcx
  23a6b6:	48 89 58 60          	mov    QWORD PTR [rax+0x60],rbx
  23a6ba:	48 8b 8d 70 ff ff ff 	mov    rcx,QWORD PTR [rbp-0x90]
  23a6c1:	48 8b 9d 78 ff ff ff 	mov    rbx,QWORD PTR [rbp-0x88]
  23a6c8:	48 89 48 68          	mov    QWORD PTR [rax+0x68],rcx
  23a6cc:	48 89 58 70          	mov    QWORD PTR [rax+0x70],rbx
  23a6d0:	48 8b 4d 80          	mov    rcx,QWORD PTR [rbp-0x80]
  23a6d4:	48 8b 5d 88          	mov    rbx,QWORD PTR [rbp-0x78]
  23a6d8:	48 89 48 78          	mov    QWORD PTR [rax+0x78],rcx
  23a6dc:	48 89 98 80 00 00 00 	mov    QWORD PTR [rax+0x80],rbx
  23a6e3:	b8 00 00 00 00       	mov    eax,0x0
  23a6e8:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  23a6ec:	c9                   	leave  
  23a6ed:	c3                   	ret    

000000000023a6ee <get_fname>:
  23a6ee:	f3 0f 1e fa          	endbr64 
  23a6f2:	55                   	push   rbp
  23a6f3:	48 89 e5             	mov    rbp,rsp
  23a6f6:	48 83 ec 20          	sub    rsp,0x20
  23a6fa:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  23a6fe:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  23a702:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  23a706:	be 2f 00 00 00       	mov    esi,0x2f
  23a70b:	48 89 c7             	mov    rdi,rax
  23a70e:	e8 8b 0c 00 00       	call   23b39e <strtok>
  23a713:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  23a717:	eb 1b                	jmp    23a734 <get_fname+0x46>
  23a719:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  23a71d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  23a721:	be 2f 00 00 00       	mov    esi,0x2f
  23a726:	bf 00 00 00 00       	mov    edi,0x0
  23a72b:	e8 6e 0c 00 00       	call   23b39e <strtok>
  23a730:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  23a734:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  23a739:	75 de                	jne    23a719 <get_fname+0x2b>
  23a73b:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  23a73f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  23a743:	48 89 d6             	mov    rsi,rdx
  23a746:	48 89 c7             	mov    rdi,rax
  23a749:	e8 0c 0c 00 00       	call   23b35a <strcpy>
  23a74e:	90                   	nop
  23a74f:	c9                   	leave  
  23a750:	c3                   	ret    

000000000023a751 <read_file>:
  23a751:	f3 0f 1e fa          	endbr64 
  23a755:	55                   	push   rbp
  23a756:	48 89 e5             	mov    rbp,rsp
  23a759:	48 83 ec 60          	sub    rsp,0x60
  23a75d:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  23a761:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  23a765:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  23a768:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
  23a76b:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  23a76f:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  23a772:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  23a775:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  23a779:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  23a77c:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
  23a780:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  23a784:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  23a787:	48 98                	cdqe   
  23a789:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  23a78d:	0f b7 05 f7 f0 fe ff 	movzx  eax,WORD PTR [rip+0xfffffffffffef0f7]        # 22988b <superblock+0xb>
  23a794:	0f b7 f0             	movzx  esi,ax
  23a797:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  23a79a:	99                   	cdq    
  23a79b:	f7 fe                	idiv   esi
  23a79d:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
  23a7a0:	0f b7 05 e4 f0 fe ff 	movzx  eax,WORD PTR [rip+0xfffffffffffef0e4]        # 22988b <superblock+0xb>
  23a7a7:	0f b7 c8             	movzx  ecx,ax
  23a7aa:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  23a7ad:	99                   	cdq    
  23a7ae:	f7 f9                	idiv   ecx
  23a7b0:	89 d0                	mov    eax,edx
  23a7b2:	85 c0                	test   eax,eax
  23a7b4:	0f 95 c0             	setne  al
  23a7b7:	0f b6 c0             	movzx  eax,al
  23a7ba:	01 45 dc             	add    DWORD PTR [rbp-0x24],eax
  23a7bd:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  23a7c4:	0f b7 45 ca          	movzx  eax,WORD PTR [rbp-0x36]
  23a7c8:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
  23a7cc:	0f b7 05 b8 f0 fe ff 	movzx  eax,WORD PTR [rip+0xfffffffffffef0b8]        # 22988b <superblock+0xb>
  23a7d3:	0f b7 f8             	movzx  edi,ax
  23a7d6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23a7d9:	99                   	cdq    
  23a7da:	f7 ff                	idiv   edi
  23a7dc:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
  23a7df:	eb 16                	jmp    23a7f7 <read_file+0xa6>
  23a7e1:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  23a7e5:	48 98                	cdqe   
  23a7e7:	0f b7 84 00 e0 da 22 	movzx  eax,WORD PTR [rax+rax*1+0x22dae0]
  23a7ee:	00 
  23a7ef:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
  23a7f3:	83 6d e4 01          	sub    DWORD PTR [rbp-0x1c],0x1
  23a7f7:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  23a7fc:	77 06                	ja     23a804 <read_file+0xb3>
  23a7fe:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  23a802:	7f dd                	jg     23a7e1 <read_file+0x90>
  23a804:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  23a808:	7e 0a                	jle    23a814 <read_file+0xc3>
  23a80a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  23a80f:	e9 cd 00 00 00       	jmp    23a8e1 <read_file+0x190>
  23a814:	0f b7 05 70 f0 fe ff 	movzx  eax,WORD PTR [rip+0xfffffffffffef070]        # 22988b <superblock+0xb>
  23a81b:	0f b7 c8             	movzx  ecx,ax
  23a81e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23a821:	99                   	cdq    
  23a822:	f7 f9                	idiv   ecx
  23a824:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  23a827:	0f b6 05 5f f0 fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffef05f]        # 22988d <superblock+0xd>
  23a82e:	0f b6 d0             	movzx  edx,al
  23a831:	0f b7 05 53 f0 fe ff 	movzx  eax,WORD PTR [rip+0xfffffffffffef053]        # 22988b <superblock+0xb>
  23a838:	0f b7 c0             	movzx  eax,ax
  23a83b:	0f af c2             	imul   eax,edx
  23a83e:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
  23a841:	e9 89 00 00 00       	jmp    23a8cf <read_file+0x17e>
  23a846:	0f b6 05 40 f0 fe ff 	movzx  eax,BYTE PTR [rip+0xfffffffffffef040]        # 22988d <superblock+0xd>
  23a84d:	0f b6 c0             	movzx  eax,al
  23a850:	0f b7 4d ea          	movzx  ecx,WORD PTR [rbp-0x16]
  23a854:	8b 15 66 15 00 00    	mov    edx,DWORD PTR [rip+0x1566]        # 23bdc0 <clu_sec_balance>
  23a85a:	01 d1                	add    ecx,edx
  23a85c:	89 c2                	mov    edx,eax
  23a85e:	89 ce                	mov    esi,ecx
  23a860:	bf 00 1b 23 00       	mov    edi,0x231b00
  23a865:	e8 98 f0 ff ff       	call   239902 <read_sec>
  23a86a:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  23a86d:	2b 45 fc             	sub    eax,DWORD PTR [rbp-0x4]
  23a870:	8b 55 e0             	mov    edx,DWORD PTR [rbp-0x20]
  23a873:	39 c2                	cmp    edx,eax
  23a875:	0f 4e c2             	cmovle eax,edx
  23a878:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
  23a87b:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  23a87e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23a881:	48 98                	cdqe   
  23a883:	48 8d 88 00 1b 23 00 	lea    rcx,[rax+0x231b00]
  23a88a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  23a88e:	48 89 ce             	mov    rsi,rcx
  23a891:	48 89 c7             	mov    rdi,rax
  23a894:	e8 c3 09 00 00       	call   23b25c <memcpy>
  23a899:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  23a89d:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  23a8a0:	2b 45 fc             	sub    eax,DWORD PTR [rbp-0x4]
  23a8a3:	48 98                	cdqe   
  23a8a5:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
  23a8a9:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  23a8ad:	7e 07                	jle    23a8b6 <read_file+0x165>
  23a8af:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  23a8b6:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  23a8ba:	48 98                	cdqe   
  23a8bc:	0f b7 84 00 e0 da 22 	movzx  eax,WORD PTR [rax+rax*1+0x22dae0]
  23a8c3:	00 
  23a8c4:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
  23a8c8:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  23a8cd:	77 0e                	ja     23a8dd <read_file+0x18c>
  23a8cf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  23a8d2:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  23a8d5:	0f 8c 6b ff ff ff    	jl     23a846 <read_file+0xf5>
  23a8db:	eb 01                	jmp    23a8de <read_file+0x18d>
  23a8dd:	90                   	nop
  23a8de:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  23a8e1:	c9                   	leave  
  23a8e2:	c3                   	ret    

000000000023a8e3 <write_file>:
  23a8e3:	f3 0f 1e fa          	endbr64 
  23a8e7:	55                   	push   rbp
  23a8e8:	48 89 e5             	mov    rbp,rsp
  23a8eb:	48 83 ec 50          	sub    rsp,0x50
  23a8ef:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  23a8f3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  23a8f7:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  23a8fa:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
  23a8fd:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  23a901:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  23a904:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  23a907:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  23a90b:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  23a90e:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
  23a912:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  23a916:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  23a919:	48 98                	cdqe   
  23a91b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  23a91f:	0f b7 05 65 ef fe ff 	movzx  eax,WORD PTR [rip+0xfffffffffffeef65]        # 22988b <superblock+0xb>
  23a926:	0f b7 f0             	movzx  esi,ax
  23a929:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23a92c:	99                   	cdq    
  23a92d:	f7 fe                	idiv   esi
  23a92f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  23a932:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  23a935:	8d 90 ff 01 00 00    	lea    edx,[rax+0x1ff]
  23a93b:	85 c0                	test   eax,eax
  23a93d:	0f 48 c2             	cmovs  eax,edx
  23a940:	c1 f8 09             	sar    eax,0x9
  23a943:	89 c1                	mov    ecx,eax
  23a945:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  23a948:	99                   	cdq    
  23a949:	c1 ea 17             	shr    edx,0x17
  23a94c:	01 d0                	add    eax,edx
  23a94e:	25 ff 01 00 00       	and    eax,0x1ff
  23a953:	29 d0                	sub    eax,edx
  23a955:	01 c8                	add    eax,ecx
  23a957:	85 c0                	test   eax,eax
  23a959:	0f 95 c0             	setne  al
  23a95c:	0f b6 c0             	movzx  eax,al
  23a95f:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
  23a962:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  23a969:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  23a96d:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
  23a971:	eb 16                	jmp    23a989 <write_file+0xa6>
  23a973:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  23a977:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  23a97b:	48 98                	cdqe   
  23a97d:	0f b7 84 00 e0 da 22 	movzx  eax,WORD PTR [rax+rax*1+0x22dae0]
  23a984:	00 
  23a985:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
  23a989:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  23a98e:	77 06                	ja     23a996 <write_file+0xb3>
  23a990:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  23a994:	7f dd                	jg     23a973 <write_file+0x90>
  23a996:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  23a99a:	7e 52                	jle    23a9ee <write_file+0x10b>
  23a99c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  23a9a1:	eb 59                	jmp    23a9fc <write_file+0x119>
  23a9a3:	0f b7 55 ea          	movzx  edx,WORD PTR [rbp-0x16]
  23a9a7:	8b 05 13 14 00 00    	mov    eax,DWORD PTR [rip+0x1413]        # 23bdc0 <clu_sec_balance>
  23a9ad:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  23a9b0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  23a9b4:	ba 01 00 00 00       	mov    edx,0x1
  23a9b9:	89 ce                	mov    esi,ecx
  23a9bb:	48 89 c7             	mov    rdi,rax
  23a9be:	e8 4b e8 ff ff       	call   23920e <write_sec>
  23a9c3:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  23a9c7:	0f b7 05 bd ee fe ff 	movzx  eax,WORD PTR [rip+0xfffffffffffeeebd]        # 22988b <superblock+0xb>
  23a9ce:	0f b7 c0             	movzx  eax,ax
  23a9d1:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
  23a9d5:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  23a9d9:	48 98                	cdqe   
  23a9db:	0f b7 84 00 e0 da 22 	movzx  eax,WORD PTR [rax+rax*1+0x22dae0]
  23a9e2:	00 
  23a9e3:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
  23a9e7:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  23a9ec:	77 0a                	ja     23a9f8 <write_file+0x115>
  23a9ee:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  23a9f1:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  23a9f4:	7c ad                	jl     23a9a3 <write_file+0xc0>
  23a9f6:	eb 01                	jmp    23a9f9 <write_file+0x116>
  23a9f8:	90                   	nop
  23a9f9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  23a9fc:	c9                   	leave  
  23a9fd:	c3                   	ret    

000000000023a9fe <scrdown>:
  23a9fe:	f3 0f 1e fa          	endbr64 
  23aa02:	55                   	push   rbp
  23aa03:	48 89 e5             	mov    rbp,rsp
  23aa06:	48 8b 05 03 75 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff7503]        # 231f10 <vpage_base>
  23aa0d:	48 05 a0 00 00 00    	add    rax,0xa0
  23aa13:	48 89 05 f6 74 ff ff 	mov    QWORD PTR [rip+0xffffffffffff74f6],rax        # 231f10 <vpage_base>
  23aa1a:	8b 05 f8 74 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff74f8]        # 231f18 <page_boffset>
  23aa20:	05 a0 00 00 00       	add    eax,0xa0
  23aa25:	89 05 ed 74 ff ff    	mov    DWORD PTR [rip+0xffffffffffff74ed],eax        # 231f18 <page_boffset>
  23aa2b:	48 8b 15 de 74 ff ff 	mov    rdx,QWORD PTR [rip+0xffffffffffff74de]        # 231f10 <vpage_base>
  23aa32:	48 8b 05 cf 74 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff74cf]        # 231f08 <video_end>
  23aa39:	48 39 c2             	cmp    rdx,rax
  23aa3c:	72 0e                	jb     23aa4c <scrdown+0x4e>
  23aa3e:	48 8b 05 bb 74 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff74bb]        # 231f00 <video_base>
  23aa45:	48 89 05 c4 74 ff ff 	mov    QWORD PTR [rip+0xffffffffffff74c4],rax        # 231f10 <vpage_base>
  23aa4c:	b8 00 00 00 00       	mov    eax,0x0
  23aa51:	e8 6a 00 00 00       	call   23aac0 <set_origin>
  23aa56:	90                   	nop
  23aa57:	5d                   	pop    rbp
  23aa58:	c3                   	ret    

000000000023aa59 <scrup>:
  23aa59:	f3 0f 1e fa          	endbr64 
  23aa5d:	55                   	push   rbp
  23aa5e:	48 89 e5             	mov    rbp,rsp
  23aa61:	8b 05 b1 74 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff74b1]        # 231f18 <page_boffset>
  23aa67:	85 c0                	test   eax,eax
  23aa69:	75 24                	jne    23aa8f <scrup+0x36>
  23aa6b:	c7 05 a3 74 ff ff 00 	mov    DWORD PTR [rip+0xffffffffffff74a3],0x0        # 231f18 <page_boffset>
  23aa72:	00 00 00 
  23aa75:	48 8b 05 84 74 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff7484]        # 231f00 <video_base>
  23aa7c:	48 89 05 8d 74 ff ff 	mov    QWORD PTR [rip+0xffffffffffff748d],rax        # 231f10 <vpage_base>
  23aa83:	b8 00 00 00 00       	mov    eax,0x0
  23aa88:	e8 33 00 00 00       	call   23aac0 <set_origin>
  23aa8d:	eb 2f                	jmp    23aabe <scrup+0x65>
  23aa8f:	48 8b 05 7a 74 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff747a]        # 231f10 <vpage_base>
  23aa96:	48 2d a0 00 00 00    	sub    rax,0xa0
  23aa9c:	48 89 05 6d 74 ff ff 	mov    QWORD PTR [rip+0xffffffffffff746d],rax        # 231f10 <vpage_base>
  23aaa3:	8b 05 6f 74 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff746f]        # 231f18 <page_boffset>
  23aaa9:	2d a0 00 00 00       	sub    eax,0xa0
  23aaae:	89 05 64 74 ff ff    	mov    DWORD PTR [rip+0xffffffffffff7464],eax        # 231f18 <page_boffset>
  23aab4:	b8 00 00 00 00       	mov    eax,0x0
  23aab9:	e8 02 00 00 00       	call   23aac0 <set_origin>
  23aabe:	5d                   	pop    rbp
  23aabf:	c3                   	ret    

000000000023aac0 <set_origin>:
  23aac0:	f3 0f 1e fa          	endbr64 
  23aac4:	55                   	push   rbp
  23aac5:	48 89 e5             	mov    rbp,rsp
  23aac8:	fa                   	cli    
  23aac9:	8b 05 59 74 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff7459]        # 231f28 <port_reg_index>
  23aacf:	0f b7 c0             	movzx  eax,ax
  23aad2:	be 0c 00 00 00       	mov    esi,0xc
  23aad7:	89 c7                	mov    edi,eax
  23aad9:	e8 12 c4 ff ff       	call   236ef0 <outb>
  23aade:	8b 05 34 74 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff7434]        # 231f18 <page_boffset>
  23aae4:	c1 e8 09             	shr    eax,0x9
  23aae7:	0f b6 d0             	movzx  edx,al
  23aaea:	8b 05 3c 74 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff743c]        # 231f2c <port_reg_v>
  23aaf0:	0f b7 c0             	movzx  eax,ax
  23aaf3:	89 d6                	mov    esi,edx
  23aaf5:	89 c7                	mov    edi,eax
  23aaf7:	e8 f4 c3 ff ff       	call   236ef0 <outb>
  23aafc:	8b 05 26 74 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff7426]        # 231f28 <port_reg_index>
  23ab02:	0f b7 c0             	movzx  eax,ax
  23ab05:	be 0d 00 00 00       	mov    esi,0xd
  23ab0a:	89 c7                	mov    edi,eax
  23ab0c:	e8 df c3 ff ff       	call   236ef0 <outb>
  23ab11:	8b 05 01 74 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff7401]        # 231f18 <page_boffset>
  23ab17:	d1 e8                	shr    eax,1
  23ab19:	0f b6 d0             	movzx  edx,al
  23ab1c:	8b 05 0a 74 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff740a]        # 231f2c <port_reg_v>
  23ab22:	0f b7 c0             	movzx  eax,ax
  23ab25:	89 d6                	mov    esi,edx
  23ab27:	89 c7                	mov    edi,eax
  23ab29:	e8 c2 c3 ff ff       	call   236ef0 <outb>
  23ab2e:	fb                   	sti    
  23ab2f:	90                   	nop
  23ab30:	5d                   	pop    rbp
  23ab31:	c3                   	ret    

000000000023ab32 <init_tty>:
  23ab32:	f3 0f 1e fa          	endbr64 
  23ab36:	55                   	push   rbp
  23ab37:	48 89 e5             	mov    rbp,rsp
  23ab3a:	48 83 ec 10          	sub    rsp,0x10
  23ab3e:	be 08 cb 23 00       	mov    esi,0x23cb08
  23ab43:	bf b4 c9 23 00       	mov    edi,0x23c9b4
  23ab48:	e8 0d 08 00 00       	call   23b35a <strcpy>
  23ab4d:	be 0d cb 23 00       	mov    esi,0x23cb0d
  23ab52:	bf 74 ca 23 00       	mov    edi,0x23ca74
  23ab57:	e8 fe 07 00 00       	call   23b35a <strcpy>
  23ab5c:	bf 00 c9 23 00       	mov    edi,0x23c900
  23ab61:	e8 70 a6 ff ff       	call   2351d6 <reg_driver>
  23ab66:	bf a0 c9 23 00       	mov    edi,0x23c9a0
  23ab6b:	e8 7e a3 ff ff       	call   234eee <reg_device>
  23ab70:	bf 60 ca 23 00       	mov    edi,0x23ca60
  23ab75:	e8 74 a3 ff ff       	call   234eee <reg_device>
  23ab7a:	48 c7 45 f8 00 00 02 	mov    QWORD PTR [rbp-0x8],0x20000
  23ab81:	00 
  23ab82:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23ab86:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23ab89:	3c 07                	cmp    al,0x7
  23ab8b:	75 36                	jne    23abc3 <init_tty+0x91>
  23ab8d:	c7 05 85 73 ff ff 00 	mov    DWORD PTR [rip+0xffffffffffff7385],0x0        # 231f1c <video_mode>
  23ab94:	00 00 00 
  23ab97:	48 c7 05 5e 73 ff ff 	mov    QWORD PTR [rip+0xffffffffffff735e],0xb0000        # 231f00 <video_base>
  23ab9e:	00 00 0b 00 
  23aba2:	48 c7 05 5b 73 ff ff 	mov    QWORD PTR [rip+0xffffffffffff735b],0xb7fff        # 231f08 <video_end>
  23aba9:	ff 7f 0b 00 
  23abad:	c7 05 71 73 ff ff b4 	mov    DWORD PTR [rip+0xffffffffffff7371],0x3b4        # 231f28 <port_reg_index>
  23abb4:	03 00 00 
  23abb7:	c7 05 6b 73 ff ff b5 	mov    DWORD PTR [rip+0xffffffffffff736b],0x3b5        # 231f2c <port_reg_v>
  23abbe:	03 00 00 
  23abc1:	eb 61                	jmp    23ac24 <init_tty+0xf2>
  23abc3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23abc7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23abca:	3c 03                	cmp    al,0x3
  23abcc:	77 36                	ja     23ac04 <init_tty+0xd2>
  23abce:	c7 05 44 73 ff ff 01 	mov    DWORD PTR [rip+0xffffffffffff7344],0x1        # 231f1c <video_mode>
  23abd5:	00 00 00 
  23abd8:	48 c7 05 1d 73 ff ff 	mov    QWORD PTR [rip+0xffffffffffff731d],0xb8000        # 231f00 <video_base>
  23abdf:	00 80 0b 00 
  23abe3:	48 c7 05 1a 73 ff ff 	mov    QWORD PTR [rip+0xffffffffffff731a],0xbffff        # 231f08 <video_end>
  23abea:	ff ff 0b 00 
  23abee:	c7 05 30 73 ff ff d4 	mov    DWORD PTR [rip+0xffffffffffff7330],0x3d4        # 231f28 <port_reg_index>
  23abf5:	03 00 00 
  23abf8:	c7 05 2a 73 ff ff d5 	mov    DWORD PTR [rip+0xffffffffffff732a],0x3d5        # 231f2c <port_reg_v>
  23abff:	03 00 00 
  23ac02:	eb 20                	jmp    23ac24 <init_tty+0xf2>
  23ac04:	c7 05 0e 73 ff ff 02 	mov    DWORD PTR [rip+0xffffffffffff730e],0x2        # 231f1c <video_mode>
  23ac0b:	00 00 00 
  23ac0e:	48 c7 05 e7 72 ff ff 	mov    QWORD PTR [rip+0xffffffffffff72e7],0xa0000        # 231f00 <video_base>
  23ac15:	00 00 0a 00 
  23ac19:	48 c7 05 e4 72 ff ff 	mov    QWORD PTR [rip+0xffffffffffff72e4],0xaffff        # 231f08 <video_end>
  23ac20:	ff ff 0a 00 
  23ac24:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23ac28:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23ac2b:	3c 01                	cmp    al,0x1
  23ac2d:	77 0f                	ja     23ac3e <init_tty+0x10c>
  23ac2f:	c7 05 eb 72 ff ff 28 	mov    DWORD PTR [rip+0xffffffffffff72eb],0x28        # 231f24 <line_chs>
  23ac36:	00 00 00 
  23ac39:	e9 91 00 00 00       	jmp    23accf <init_tty+0x19d>
  23ac3e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23ac42:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23ac45:	3c 03                	cmp    al,0x3
  23ac47:	76 0b                	jbe    23ac54 <init_tty+0x122>
  23ac49:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23ac4d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23ac50:	3c 07                	cmp    al,0x7
  23ac52:	75 0c                	jne    23ac60 <init_tty+0x12e>
  23ac54:	c7 05 c6 72 ff ff 50 	mov    DWORD PTR [rip+0xffffffffffff72c6],0x50        # 231f24 <line_chs>
  23ac5b:	00 00 00 
  23ac5e:	eb 6f                	jmp    23accf <init_tty+0x19d>
  23ac60:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23ac64:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23ac67:	3c 05                	cmp    al,0x5
  23ac69:	76 16                	jbe    23ac81 <init_tty+0x14f>
  23ac6b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23ac6f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23ac72:	3c 09                	cmp    al,0x9
  23ac74:	74 0b                	je     23ac81 <init_tty+0x14f>
  23ac76:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23ac7a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23ac7d:	3c 0d                	cmp    al,0xd
  23ac7f:	75 0c                	jne    23ac8d <init_tty+0x15b>
  23ac81:	c7 05 99 72 ff ff 40 	mov    DWORD PTR [rip+0xffffffffffff7299],0x140        # 231f24 <line_chs>
  23ac88:	01 00 00 
  23ac8b:	eb 42                	jmp    23accf <init_tty+0x19d>
  23ac8d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23ac91:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23ac94:	3c 06                	cmp    al,0x6
  23ac96:	74 16                	je     23acae <init_tty+0x17c>
  23ac98:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23ac9c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23ac9f:	3c 0a                	cmp    al,0xa
  23aca1:	74 0b                	je     23acae <init_tty+0x17c>
  23aca3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23aca7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23acaa:	3c 0d                	cmp    al,0xd
  23acac:	76 0c                	jbe    23acba <init_tty+0x188>
  23acae:	c7 05 6c 72 ff ff 80 	mov    DWORD PTR [rip+0xffffffffffff726c],0x280        # 231f24 <line_chs>
  23acb5:	02 00 00 
  23acb8:	eb 15                	jmp    23accf <init_tty+0x19d>
  23acba:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23acbe:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23acc1:	3c 08                	cmp    al,0x8
  23acc3:	75 0a                	jne    23accf <init_tty+0x19d>
  23acc5:	c7 05 55 72 ff ff a0 	mov    DWORD PTR [rip+0xffffffffffff7255],0xa0        # 231f24 <line_chs>
  23accc:	00 00 00 
  23accf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23acd3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23acd6:	0f b6 c0             	movzx  eax,al
  23acd9:	83 f8 14             	cmp    eax,0x14
  23acdc:	77 61                	ja     23ad3f <init_tty+0x20d>
  23acde:	89 c0                	mov    eax,eax
  23ace0:	48 8b 04 c5 18 cb 23 	mov    rax,QWORD PTR [rax*8+0x23cb18]
  23ace7:	00 
  23ace8:	3e ff e0             	notrack jmp rax
  23aceb:	c7 05 3b 72 ff ff e8 	mov    DWORD PTR [rip+0xffffffffffff723b],0x3e8        # 231f30 <vpage_size>
  23acf2:	03 00 00 
  23acf5:	eb 49                	jmp    23ad40 <init_tty+0x20e>
  23acf7:	c7 05 2f 72 ff ff d0 	mov    DWORD PTR [rip+0xffffffffffff722f],0x7d0        # 231f30 <vpage_size>
  23acfe:	07 00 00 
  23ad01:	eb 3d                	jmp    23ad40 <init_tty+0x20e>
  23ad03:	c7 05 23 72 ff ff 00 	mov    DWORD PTR [rip+0xffffffffffff7223],0xfa00        # 231f30 <vpage_size>
  23ad0a:	fa 00 00 
  23ad0d:	eb 31                	jmp    23ad40 <init_tty+0x20e>
  23ad0f:	c7 05 17 72 ff ff 00 	mov    DWORD PTR [rip+0xffffffffffff7217],0x1f400        # 231f30 <vpage_size>
  23ad16:	f4 01 00 
  23ad19:	eb 25                	jmp    23ad40 <init_tty+0x20e>
  23ad1b:	c7 05 0b 72 ff ff 00 	mov    DWORD PTR [rip+0xffffffffffff720b],0x7d00        # 231f30 <vpage_size>
  23ad22:	7d 00 00 
  23ad25:	eb 19                	jmp    23ad40 <init_tty+0x20e>
  23ad27:	c7 05 ff 71 ff ff 00 	mov    DWORD PTR [rip+0xffffffffffff71ff],0x36b00        # 231f30 <vpage_size>
  23ad2e:	6b 03 00 
  23ad31:	eb 0d                	jmp    23ad40 <init_tty+0x20e>
  23ad33:	c7 05 f3 71 ff ff 00 	mov    DWORD PTR [rip+0xffffffffffff71f3],0x4b000        # 231f30 <vpage_size>
  23ad3a:	b0 04 00 
  23ad3d:	eb 01                	jmp    23ad40 <init_tty+0x20e>
  23ad3f:	90                   	nop
  23ad40:	48 8b 05 b9 71 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff71b9]        # 231f00 <video_base>
  23ad47:	48 89 05 7a 10 00 00 	mov    QWORD PTR [rip+0x107a],rax        # 23bdc8 <m_ptr>
  23ad4e:	c7 05 c0 71 ff ff 00 	mov    DWORD PTR [rip+0xffffffffffff71c0],0x0        # 231f18 <page_boffset>
  23ad55:	00 00 00 
  23ad58:	48 8b 05 a1 71 ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff71a1]        # 231f00 <video_base>
  23ad5f:	48 89 05 aa 71 ff ff 	mov    QWORD PTR [rip+0xffffffffffff71aa],rax        # 231f10 <vpage_base>
  23ad66:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  23ad6b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23ad6f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23ad72:	0f b6 c0             	movzx  eax,al
  23ad75:	89 05 a5 71 ff ff    	mov    DWORD PTR [rip+0xffffffffffff71a5],eax        # 231f20 <vpage>
  23ad7b:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  23ad80:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23ad84:	48 8d 50 01          	lea    rdx,[rax+0x1]
  23ad88:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  23ad8c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23ad8f:	0f b6 c0             	movzx  eax,al
  23ad92:	89 05 a4 71 ff ff    	mov    DWORD PTR [rip+0xffffffffffff71a4],eax        # 231f3c <stline>
  23ad98:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23ad9c:	48 8d 50 01          	lea    rdx,[rax+0x1]
  23ada0:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  23ada4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23ada7:	0f b6 c0             	movzx  eax,al
  23adaa:	89 05 90 71 ff ff    	mov    DWORD PTR [rip+0xffffffffffff7190],eax        # 231f40 <endline>
  23adb0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23adb4:	48 8d 50 01          	lea    rdx,[rax+0x1]
  23adb8:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  23adbc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23adbf:	0f b6 c0             	movzx  eax,al
  23adc2:	89 05 70 71 ff ff    	mov    DWORD PTR [rip+0xffffffffffff7170],eax        # 231f38 <videoy>
  23adc8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23adcc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23adcf:	0f b6 c0             	movzx  eax,al
  23add2:	89 05 5c 71 ff ff    	mov    DWORD PTR [rip+0xffffffffffff715c],eax        # 231f34 <videox>
  23add8:	90                   	nop
  23add9:	c9                   	leave  
  23adda:	c3                   	ret    

000000000023addb <seek_tty>:
  23addb:	f3 0f 1e fa          	endbr64 
  23addf:	55                   	push   rbp
  23ade0:	48 89 e5             	mov    rbp,rsp
  23ade3:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  23ade7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  23adeb:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  23adee:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  23adf1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23adf4:	05 00 c0 05 00       	add    eax,0x5c000
  23adf9:	01 c0                	add    eax,eax
  23adfb:	48 98                	cdqe   
  23adfd:	48 89 05 c4 0f 00 00 	mov    QWORD PTR [rip+0xfc4],rax        # 23bdc8 <m_ptr>
  23ae04:	90                   	nop
  23ae05:	5d                   	pop    rbp
  23ae06:	c3                   	ret    

000000000023ae07 <tell_monitor>:
  23ae07:	f3 0f 1e fa          	endbr64 
  23ae0b:	55                   	push   rbp
  23ae0c:	48 89 e5             	mov    rbp,rsp
  23ae0f:	48 8b 05 b2 0f 00 00 	mov    rax,QWORD PTR [rip+0xfb2]        # 23bdc8 <m_ptr>
  23ae16:	48 8b 15 e3 70 ff ff 	mov    rdx,QWORD PTR [rip+0xffffffffffff70e3]        # 231f00 <video_base>
  23ae1d:	48 29 d0             	sub    rax,rdx
  23ae20:	48 89 c2             	mov    rdx,rax
  23ae23:	48 c1 ea 3f          	shr    rdx,0x3f
  23ae27:	48 01 d0             	add    rax,rdx
  23ae2a:	48 d1 f8             	sar    rax,1
  23ae2d:	5d                   	pop    rbp
  23ae2e:	c3                   	ret    

000000000023ae2f <del_ch>:
  23ae2f:	f3 0f 1e fa          	endbr64 
  23ae33:	55                   	push   rbp
  23ae34:	48 89 e5             	mov    rbp,rsp
  23ae37:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
  23ae3e:	48 8b 05 83 0f 00 00 	mov    rax,QWORD PTR [rip+0xf83]        # 23bdc8 <m_ptr>
  23ae45:	48 83 e8 02          	sub    rax,0x2
  23ae49:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  23ae4d:	b8 00 00 00 00       	mov    eax,0x0
  23ae52:	e8 b0 ff ff ff       	call   23ae07 <tell_monitor>
  23ae57:	89 c2                	mov    edx,eax
  23ae59:	48 63 c2             	movsxd rax,edx
  23ae5c:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  23ae63:	48 c1 e8 20          	shr    rax,0x20
  23ae67:	c1 f8 05             	sar    eax,0x5
  23ae6a:	89 d1                	mov    ecx,edx
  23ae6c:	c1 f9 1f             	sar    ecx,0x1f
  23ae6f:	29 c8                	sub    eax,ecx
  23ae71:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  23ae74:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  23ae77:	89 c8                	mov    eax,ecx
  23ae79:	c1 e0 02             	shl    eax,0x2
  23ae7c:	01 c8                	add    eax,ecx
  23ae7e:	c1 e0 04             	shl    eax,0x4
  23ae81:	29 c2                	sub    edx,eax
  23ae83:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  23ae86:	eb 17                	jmp    23ae9f <del_ch+0x70>
  23ae88:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23ae8c:	0f b6 50 02          	movzx  edx,BYTE PTR [rax+0x2]
  23ae90:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23ae94:	88 10                	mov    BYTE PTR [rax],dl
  23ae96:	48 83 45 f8 02       	add    QWORD PTR [rbp-0x8],0x2
  23ae9b:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  23ae9f:	83 7d f4 4e          	cmp    DWORD PTR [rbp-0xc],0x4e
  23aea3:	7e e3                	jle    23ae88 <del_ch+0x59>
  23aea5:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  23aeac:	b8 00 00 00 00       	mov    eax,0x0
  23aeb1:	b9 18 00 00 00       	mov    ecx,0x18
  23aeb6:	48 89 d7             	mov    rdi,rdx
  23aeb9:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  23aebc:	b8 00 00 00 00       	mov    eax,0x0
  23aec1:	e8 41 ff ff ff       	call   23ae07 <tell_monitor>
  23aec6:	83 e8 01             	sub    eax,0x1
  23aec9:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
  23aecf:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  23aed6:	48 89 c7             	mov    rdi,rax
  23aed9:	e8 fd fe ff ff       	call   23addb <seek_tty>
  23aede:	b8 00 00 00 00       	mov    eax,0x0
  23aee3:	e8 03 00 00 00       	call   23aeeb <set_cur>
  23aee8:	90                   	nop
  23aee9:	c9                   	leave  
  23aeea:	c3                   	ret    

000000000023aeeb <set_cur>:
  23aeeb:	f3 0f 1e fa          	endbr64 
  23aeef:	55                   	push   rbp
  23aef0:	48 89 e5             	mov    rbp,rsp
  23aef3:	fa                   	cli    
  23aef4:	8b 05 2e 70 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff702e]        # 231f28 <port_reg_index>
  23aefa:	0f b7 c0             	movzx  eax,ax
  23aefd:	be 0e 00 00 00       	mov    esi,0xe
  23af02:	89 c7                	mov    edi,eax
  23af04:	e8 e7 bf ff ff       	call   236ef0 <outb>
  23af09:	48 8b 05 b8 0e 00 00 	mov    rax,QWORD PTR [rip+0xeb8]        # 23bdc8 <m_ptr>
  23af10:	48 8b 15 e9 6f ff ff 	mov    rdx,QWORD PTR [rip+0xffffffffffff6fe9]        # 231f00 <video_base>
  23af17:	48 29 d0             	sub    rax,rdx
  23af1a:	48 c1 f8 09          	sar    rax,0x9
  23af1e:	0f b6 d0             	movzx  edx,al
  23af21:	8b 05 05 70 ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff7005]        # 231f2c <port_reg_v>
  23af27:	0f b7 c0             	movzx  eax,ax
  23af2a:	89 d6                	mov    esi,edx
  23af2c:	89 c7                	mov    edi,eax
  23af2e:	e8 bd bf ff ff       	call   236ef0 <outb>
  23af33:	8b 05 ef 6f ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6fef]        # 231f28 <port_reg_index>
  23af39:	0f b7 c0             	movzx  eax,ax
  23af3c:	be 0f 00 00 00       	mov    esi,0xf
  23af41:	89 c7                	mov    edi,eax
  23af43:	e8 a8 bf ff ff       	call   236ef0 <outb>
  23af48:	48 8b 05 79 0e 00 00 	mov    rax,QWORD PTR [rip+0xe79]        # 23bdc8 <m_ptr>
  23af4f:	48 8b 15 aa 6f ff ff 	mov    rdx,QWORD PTR [rip+0xffffffffffff6faa]        # 231f00 <video_base>
  23af56:	48 29 d0             	sub    rax,rdx
  23af59:	48 d1 f8             	sar    rax,1
  23af5c:	0f b6 d0             	movzx  edx,al
  23af5f:	8b 05 c7 6f ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6fc7]        # 231f2c <port_reg_v>
  23af65:	0f b7 c0             	movzx  eax,ax
  23af68:	89 d6                	mov    esi,edx
  23af6a:	89 c7                	mov    edi,eax
  23af6c:	e8 7f bf ff ff       	call   236ef0 <outb>
  23af71:	fb                   	sti    
  23af72:	90                   	nop
  23af73:	5d                   	pop    rbp
  23af74:	c3                   	ret    

000000000023af75 <read_tty>:
  23af75:	f3 0f 1e fa          	endbr64 
  23af79:	55                   	push   rbp
  23af7a:	48 89 e5             	mov    rbp,rsp
  23af7d:	48 83 ec 20          	sub    rsp,0x20
  23af81:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  23af85:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  23af89:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  23af8c:	48 98                	cdqe   
  23af8e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  23af92:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  23af96:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  23af99:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
  23af9c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  23afa3:	eb 4a                	jmp    23afef <read_tty+0x7a>
  23afa5:	48 8b 15 1c 0e 00 00 	mov    rdx,QWORD PTR [rip+0xe1c]        # 23bdc8 <m_ptr>
  23afac:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23afb0:	48 8d 48 01          	lea    rcx,[rax+0x1]
  23afb4:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  23afb8:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  23afbb:	88 10                	mov    BYTE PTR [rax],dl
  23afbd:	48 8b 05 04 0e 00 00 	mov    rax,QWORD PTR [rip+0xe04]        # 23bdc8 <m_ptr>
  23afc4:	48 3d ff ff 0b 00    	cmp    rax,0xbffff
  23afca:	75 0d                	jne    23afd9 <read_tty+0x64>
  23afcc:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  23afd0:	7e 07                	jle    23afd9 <read_tty+0x64>
  23afd2:	b8 01 00 00 00       	mov    eax,0x1
  23afd7:	eb 2d                	jmp    23b006 <read_tty+0x91>
  23afd9:	48 8b 05 e8 0d 00 00 	mov    rax,QWORD PTR [rip+0xde8]        # 23bdc8 <m_ptr>
  23afe0:	48 83 c0 02          	add    rax,0x2
  23afe4:	48 89 05 dd 0d 00 00 	mov    QWORD PTR [rip+0xddd],rax        # 23bdc8 <m_ptr>
  23afeb:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  23afef:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  23aff2:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  23aff5:	7c ae                	jl     23afa5 <read_tty+0x30>
  23aff7:	b8 00 00 00 00       	mov    eax,0x0
  23affc:	e8 ea fe ff ff       	call   23aeeb <set_cur>
  23b001:	b8 00 00 00 00       	mov    eax,0x0
  23b006:	c9                   	leave  
  23b007:	c3                   	ret    

000000000023b008 <write_tty>:
  23b008:	f3 0f 1e fa          	endbr64 
  23b00c:	55                   	push   rbp
  23b00d:	48 89 e5             	mov    rbp,rsp
  23b010:	48 83 ec 30          	sub    rsp,0x30
  23b014:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  23b018:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  23b01c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  23b01f:	48 98                	cdqe   
  23b021:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  23b025:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  23b029:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  23b02c:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
  23b02f:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  23b036:	e9 0b 01 00 00       	jmp    23b146 <write_tty+0x13e>
  23b03b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23b03f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23b042:	3c 0a                	cmp    al,0xa
  23b044:	75 50                	jne    23b096 <write_tty+0x8e>
  23b046:	48 8b 05 7b 0d 00 00 	mov    rax,QWORD PTR [rip+0xd7b]        # 23bdc8 <m_ptr>
  23b04d:	48 2d 00 80 0b 00    	sub    rax,0xb8000
  23b053:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  23b056:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  23b059:	89 c2                	mov    edx,eax
  23b05b:	b8 cd cc cc cc       	mov    eax,0xcccccccd
  23b060:	48 0f af c2          	imul   rax,rdx
  23b064:	48 c1 e8 20          	shr    rax,0x20
  23b068:	c1 e8 07             	shr    eax,0x7
  23b06b:	8d 50 01             	lea    edx,[rax+0x1]
  23b06e:	89 d0                	mov    eax,edx
  23b070:	c1 e0 02             	shl    eax,0x2
  23b073:	01 d0                	add    eax,edx
  23b075:	c1 e0 05             	shl    eax,0x5
  23b078:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  23b07b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  23b07e:	05 00 80 0b 00       	add    eax,0xb8000
  23b083:	89 c0                	mov    eax,eax
  23b085:	48 89 05 3c 0d 00 00 	mov    QWORD PTR [rip+0xd3c],rax        # 23bdc8 <m_ptr>
  23b08c:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  23b091:	e9 ac 00 00 00       	jmp    23b142 <write_tty+0x13a>
  23b096:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23b09a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23b09d:	84 c0                	test   al,al
  23b09f:	0f 84 af 00 00 00    	je     23b154 <write_tty+0x14c>
  23b0a5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23b0a9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23b0ac:	3c 08                	cmp    al,0x8
  23b0ae:	75 1e                	jne    23b0ce <write_tty+0xc6>
  23b0b0:	48 8b 05 11 0d 00 00 	mov    rax,QWORD PTR [rip+0xd11]        # 23bdc8 <m_ptr>
  23b0b7:	48 83 e8 02          	sub    rax,0x2
  23b0bb:	48 89 05 06 0d 00 00 	mov    QWORD PTR [rip+0xd06],rax        # 23bdc8 <m_ptr>
  23b0c2:	48 8b 05 ff 0c 00 00 	mov    rax,QWORD PTR [rip+0xcff]        # 23bdc8 <m_ptr>
  23b0c9:	c6 00 00             	mov    BYTE PTR [rax],0x0
  23b0cc:	eb 3e                	jmp    23b10c <write_tty+0x104>
  23b0ce:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  23b0d2:	48 8d 42 01          	lea    rax,[rdx+0x1]
  23b0d6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  23b0da:	48 8b 05 e7 0c 00 00 	mov    rax,QWORD PTR [rip+0xce7]        # 23bdc8 <m_ptr>
  23b0e1:	48 8d 48 01          	lea    rcx,[rax+0x1]
  23b0e5:	48 89 0d dc 0c 00 00 	mov    QWORD PTR [rip+0xcdc],rcx        # 23bdc8 <m_ptr>
  23b0ec:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  23b0ef:	88 10                	mov    BYTE PTR [rax],dl
  23b0f1:	48 8b 05 d0 0c 00 00 	mov    rax,QWORD PTR [rip+0xcd0]        # 23bdc8 <m_ptr>
  23b0f8:	48 8d 50 01          	lea    rdx,[rax+0x1]
  23b0fc:	48 89 15 c5 0c 00 00 	mov    QWORD PTR [rip+0xcc5],rdx        # 23bdc8 <m_ptr>
  23b103:	0f b6 15 c6 0c 00 00 	movzx  edx,BYTE PTR [rip+0xcc6]        # 23bdd0 <m_color>
  23b10a:	88 10                	mov    BYTE PTR [rax],dl
  23b10c:	48 8b 05 b5 0c 00 00 	mov    rax,QWORD PTR [rip+0xcb5]        # 23bdc8 <m_ptr>
  23b113:	48 8b 0d f6 6d ff ff 	mov    rcx,QWORD PTR [rip+0xffffffffffff6df6]        # 231f10 <vpage_base>
  23b11a:	48 29 c8             	sub    rax,rcx
  23b11d:	48 89 c2             	mov    rdx,rax
  23b120:	8b 05 0a 6e ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6e0a]        # 231f30 <vpage_size>
  23b126:	8b 0d f8 6d ff ff    	mov    ecx,DWORD PTR [rip+0xffffffffffff6df8]        # 231f24 <line_chs>
  23b12c:	29 c8                	sub    eax,ecx
  23b12e:	01 c0                	add    eax,eax
  23b130:	48 98                	cdqe   
  23b132:	48 39 c2             	cmp    rdx,rax
  23b135:	7c 0b                	jl     23b142 <write_tty+0x13a>
  23b137:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  23b13b:	7e 05                	jle    23b142 <write_tty+0x13a>
  23b13d:	e8 bc f8 ff ff       	call   23a9fe <scrdown>
  23b142:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  23b146:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  23b149:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  23b14c:	0f 8c e9 fe ff ff    	jl     23b03b <write_tty+0x33>
  23b152:	eb 01                	jmp    23b155 <write_tty+0x14d>
  23b154:	90                   	nop
  23b155:	b8 00 00 00 00       	mov    eax,0x0
  23b15a:	e8 8c fd ff ff       	call   23aeeb <set_cur>
  23b15f:	b8 00 00 00 00       	mov    eax,0x0
  23b164:	c9                   	leave  
  23b165:	c3                   	ret    

000000000023b166 <cls>:
  23b166:	f3 0f 1e fa          	endbr64 
  23b16a:	55                   	push   rbp
  23b16b:	48 89 e5             	mov    rbp,rsp
  23b16e:	48 83 ec 20          	sub    rsp,0x20
  23b172:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  23b176:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  23b17d:	eb 16                	jmp    23b195 <cls+0x2f>
  23b17f:	48 8b 15 8a 6d ff ff 	mov    rdx,QWORD PTR [rip+0xffffffffffff6d8a]        # 231f10 <vpage_base>
  23b186:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23b189:	48 98                	cdqe   
  23b18b:	48 01 d0             	add    rax,rdx
  23b18e:	c6 00 00             	mov    BYTE PTR [rax],0x0
  23b191:	83 45 fc 02          	add    DWORD PTR [rbp-0x4],0x2
  23b195:	8b 05 95 6d ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6d95]        # 231f30 <vpage_size>
  23b19b:	01 c0                	add    eax,eax
  23b19d:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  23b1a0:	7c dd                	jl     23b17f <cls+0x19>
  23b1a2:	48 8b 05 67 6d ff ff 	mov    rax,QWORD PTR [rip+0xffffffffffff6d67]        # 231f10 <vpage_base>
  23b1a9:	48 89 05 18 0c 00 00 	mov    QWORD PTR [rip+0xc18],rax        # 23bdc8 <m_ptr>
  23b1b0:	b8 00 00 00 00       	mov    eax,0x0
  23b1b5:	e8 31 fd ff ff       	call   23aeeb <set_cur>
  23b1ba:	90                   	nop
  23b1bb:	c9                   	leave  
  23b1bc:	c3                   	ret    

000000000023b1bd <set_color>:
  23b1bd:	f3 0f 1e fa          	endbr64 
  23b1c1:	55                   	push   rbp
  23b1c2:	48 89 e5             	mov    rbp,rsp
  23b1c5:	89 f8                	mov    eax,edi
  23b1c7:	88 45 fc             	mov    BYTE PTR [rbp-0x4],al
  23b1ca:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  23b1ce:	88 05 fc 0b 00 00    	mov    BYTE PTR [rip+0xbfc],al        # 23bdd0 <m_color>
  23b1d4:	90                   	nop
  23b1d5:	5d                   	pop    rbp
  23b1d6:	c3                   	ret    

000000000023b1d7 <tty_do_req>:
  23b1d7:	f3 0f 1e fa          	endbr64 
  23b1db:	55                   	push   rbp
  23b1dc:	48 89 e5             	mov    rbp,rsp
  23b1df:	48 83 ec 10          	sub    rsp,0x10
  23b1e3:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  23b1e7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23b1eb:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  23b1f1:	83 f8 0d             	cmp    eax,0xd
  23b1f4:	74 45                	je     23b23b <tty_do_req+0x64>
  23b1f6:	83 f8 0d             	cmp    eax,0xd
  23b1f9:	7f 53                	jg     23b24e <tty_do_req+0x77>
  23b1fb:	83 f8 0c             	cmp    eax,0xc
  23b1fe:	74 2d                	je     23b22d <tty_do_req+0x56>
  23b200:	83 f8 0c             	cmp    eax,0xc
  23b203:	7f 49                	jg     23b24e <tty_do_req+0x77>
  23b205:	83 f8 02             	cmp    eax,0x2
  23b208:	74 07                	je     23b211 <tty_do_req+0x3a>
  23b20a:	83 f8 03             	cmp    eax,0x3
  23b20d:	74 10                	je     23b21f <tty_do_req+0x48>
  23b20f:	eb 3d                	jmp    23b24e <tty_do_req+0x77>
  23b211:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23b215:	48 89 c7             	mov    rdi,rax
  23b218:	e8 58 fd ff ff       	call   23af75 <read_tty>
  23b21d:	eb 36                	jmp    23b255 <tty_do_req+0x7e>
  23b21f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23b223:	48 89 c7             	mov    rdi,rax
  23b226:	e8 dd fd ff ff       	call   23b008 <write_tty>
  23b22b:	eb 28                	jmp    23b255 <tty_do_req+0x7e>
  23b22d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23b231:	48 89 c7             	mov    rdi,rax
  23b234:	e8 a2 fb ff ff       	call   23addb <seek_tty>
  23b239:	eb 1a                	jmp    23b255 <tty_do_req+0x7e>
  23b23b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23b23f:	48 89 c7             	mov    rdi,rax
  23b242:	b8 00 00 00 00       	mov    eax,0x0
  23b247:	e8 bb fb ff ff       	call   23ae07 <tell_monitor>
  23b24c:	eb 07                	jmp    23b255 <tty_do_req+0x7e>
  23b24e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  23b253:	eb 05                	jmp    23b25a <tty_do_req+0x83>
  23b255:	b8 00 00 00 00       	mov    eax,0x0
  23b25a:	c9                   	leave  
  23b25b:	c3                   	ret    

000000000023b25c <memcpy>:
  23b25c:	f3 0f 1e fa          	endbr64 
  23b260:	55                   	push   rbp
  23b261:	48 89 e5             	mov    rbp,rsp
  23b264:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  23b268:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  23b26c:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
  23b26f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  23b273:	c6 00 ff             	mov    BYTE PTR [rax],0xff
  23b276:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  23b27d:	eb 1b                	jmp    23b29a <memcpy+0x3e>
  23b27f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  23b283:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  23b286:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  23b28a:	88 10                	mov    BYTE PTR [rax],dl
  23b28c:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  23b291:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
  23b296:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  23b29a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23b29d:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
  23b2a0:	77 dd                	ja     23b27f <memcpy+0x23>
  23b2a2:	90                   	nop
  23b2a3:	90                   	nop
  23b2a4:	5d                   	pop    rbp
  23b2a5:	c3                   	ret    

000000000023b2a6 <memcmp>:
  23b2a6:	f3 0f 1e fa          	endbr64 
  23b2aa:	55                   	push   rbp
  23b2ab:	48 89 e5             	mov    rbp,rsp
  23b2ae:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  23b2b2:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  23b2b6:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
  23b2b9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  23b2c0:	eb 3a                	jmp    23b2fc <memcmp+0x56>
  23b2c2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  23b2c6:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  23b2c9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  23b2cd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23b2d0:	38 c2                	cmp    dl,al
  23b2d2:	74 1a                	je     23b2ee <memcmp+0x48>
  23b2d4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  23b2d8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23b2db:	0f b6 d0             	movzx  edx,al
  23b2de:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  23b2e2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23b2e5:	0f b6 c8             	movzx  ecx,al
  23b2e8:	89 d0                	mov    eax,edx
  23b2ea:	29 c8                	sub    eax,ecx
  23b2ec:	eb 1b                	jmp    23b309 <memcmp+0x63>
  23b2ee:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  23b2f3:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
  23b2f8:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  23b2fc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23b2ff:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  23b302:	7c be                	jl     23b2c2 <memcmp+0x1c>
  23b304:	b8 00 00 00 00       	mov    eax,0x0
  23b309:	5d                   	pop    rbp
  23b30a:	c3                   	ret    

000000000023b30b <memset>:
  23b30b:	f3 0f 1e fa          	endbr64 
  23b30f:	55                   	push   rbp
  23b310:	48 89 e5             	mov    rbp,rsp
  23b313:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  23b317:	89 f0                	mov    eax,esi
  23b319:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
  23b31c:	88 45 e4             	mov    BYTE PTR [rbp-0x1c],al
  23b31f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  23b326:	eb 16                	jmp    23b33e <memset+0x33>
  23b328:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  23b32c:	48 8d 50 01          	lea    rdx,[rax+0x1]
  23b330:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  23b334:	0f b6 55 e4          	movzx  edx,BYTE PTR [rbp-0x1c]
  23b338:	88 10                	mov    BYTE PTR [rax],dl
  23b33a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  23b33e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23b341:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  23b344:	72 e2                	jb     23b328 <memset+0x1d>
  23b346:	90                   	nop
  23b347:	90                   	nop
  23b348:	5d                   	pop    rbp
  23b349:	c3                   	ret    

000000000023b34a <get_mem_size>:
  23b34a:	f3 0f 1e fa          	endbr64 
  23b34e:	55                   	push   rbp
  23b34f:	48 89 e5             	mov    rbp,rsp
  23b352:	8b 05 ec 6b ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6bec]        # 231f44 <mem_end>
  23b358:	5d                   	pop    rbp
  23b359:	c3                   	ret    

000000000023b35a <strcpy>:
  23b35a:	f3 0f 1e fa          	endbr64 
  23b35e:	55                   	push   rbp
  23b35f:	48 89 e5             	mov    rbp,rsp
  23b362:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  23b366:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  23b36a:	eb 1d                	jmp    23b389 <strcpy+0x2f>
  23b36c:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  23b370:	48 8d 42 01          	lea    rax,[rdx+0x1]
  23b374:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  23b378:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23b37c:	48 8d 48 01          	lea    rcx,[rax+0x1]
  23b380:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  23b384:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  23b387:	88 10                	mov    BYTE PTR [rax],dl
  23b389:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  23b38d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23b390:	84 c0                	test   al,al
  23b392:	75 d8                	jne    23b36c <strcpy+0x12>
  23b394:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23b398:	c6 00 00             	mov    BYTE PTR [rax],0x0
  23b39b:	90                   	nop
  23b39c:	5d                   	pop    rbp
  23b39d:	c3                   	ret    

000000000023b39e <strtok>:
  23b39e:	f3 0f 1e fa          	endbr64 
  23b3a2:	55                   	push   rbp
  23b3a3:	48 89 e5             	mov    rbp,rsp
  23b3a6:	48 83 ec 30          	sub    rsp,0x30
  23b3aa:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  23b3ae:	89 f0                	mov    eax,esi
  23b3b0:	88 45 d4             	mov    BYTE PTR [rbp-0x2c],al
  23b3b3:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  23b3b8:	0f 84 9c 00 00 00    	je     23b45a <strtok+0xbc>
  23b3be:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  23b3c2:	48 89 c6             	mov    rsi,rax
  23b3c5:	bf 60 1f 23 00       	mov    edi,0x231f60
  23b3ca:	e8 8b ff ff ff       	call   23b35a <strcpy>
  23b3cf:	48 c7 45 e8 60 1f 23 	mov    QWORD PTR [rbp-0x18],0x231f60
  23b3d6:	00 
  23b3d7:	c7 05 7f 6d ff ff 00 	mov    DWORD PTR [rip+0xffffffffffff6d7f],0x0        # 232160 <tokptr>
  23b3de:	00 00 00 
  23b3e1:	eb 1c                	jmp    23b3ff <strtok+0x61>
  23b3e3:	8b 05 77 6d ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6d77]        # 232160 <tokptr>
  23b3e9:	83 c0 01             	add    eax,0x1
  23b3ec:	99                   	cdq    
  23b3ed:	c1 ea 17             	shr    edx,0x17
  23b3f0:	01 d0                	add    eax,edx
  23b3f2:	25 ff 01 00 00       	and    eax,0x1ff
  23b3f7:	29 d0                	sub    eax,edx
  23b3f9:	89 05 61 6d ff ff    	mov    DWORD PTR [rip+0xffffffffffff6d61],eax        # 232160 <tokptr>
  23b3ff:	8b 05 5b 6d ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6d5b]        # 232160 <tokptr>
  23b405:	48 98                	cdqe   
  23b407:	0f b6 80 60 1f 23 00 	movzx  eax,BYTE PTR [rax+0x231f60]
  23b40e:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  23b411:	74 13                	je     23b426 <strtok+0x88>
  23b413:	8b 05 47 6d ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6d47]        # 232160 <tokptr>
  23b419:	48 98                	cdqe   
  23b41b:	0f b6 80 60 1f 23 00 	movzx  eax,BYTE PTR [rax+0x231f60]
  23b422:	84 c0                	test   al,al
  23b424:	75 bd                	jne    23b3e3 <strtok+0x45>
  23b426:	8b 05 34 6d ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6d34]        # 232160 <tokptr>
  23b42c:	48 98                	cdqe   
  23b42e:	c6 80 60 1f 23 00 00 	mov    BYTE PTR [rax+0x231f60],0x0
  23b435:	8b 05 25 6d ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6d25]        # 232160 <tokptr>
  23b43b:	83 c0 01             	add    eax,0x1
  23b43e:	99                   	cdq    
  23b43f:	c1 ea 17             	shr    edx,0x17
  23b442:	01 d0                	add    eax,edx
  23b444:	25 ff 01 00 00       	and    eax,0x1ff
  23b449:	29 d0                	sub    eax,edx
  23b44b:	89 05 0f 6d ff ff    	mov    DWORD PTR [rip+0xffffffffffff6d0f],eax        # 232160 <tokptr>
  23b451:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  23b455:	e9 9e 00 00 00       	jmp    23b4f8 <strtok+0x15a>
  23b45a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  23b461:	8b 05 f9 6c ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6cf9]        # 232160 <tokptr>
  23b467:	48 98                	cdqe   
  23b469:	48 05 60 1f 23 00    	add    rax,0x231f60
  23b46f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  23b473:	eb 20                	jmp    23b495 <strtok+0xf7>
  23b475:	8b 05 e5 6c ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6ce5]        # 232160 <tokptr>
  23b47b:	83 c0 01             	add    eax,0x1
  23b47e:	99                   	cdq    
  23b47f:	c1 ea 17             	shr    edx,0x17
  23b482:	01 d0                	add    eax,edx
  23b484:	25 ff 01 00 00       	and    eax,0x1ff
  23b489:	29 d0                	sub    eax,edx
  23b48b:	89 05 cf 6c ff ff    	mov    DWORD PTR [rip+0xffffffffffff6ccf],eax        # 232160 <tokptr>
  23b491:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  23b495:	8b 05 c5 6c ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6cc5]        # 232160 <tokptr>
  23b49b:	48 98                	cdqe   
  23b49d:	0f b6 80 60 1f 23 00 	movzx  eax,BYTE PTR [rax+0x231f60]
  23b4a4:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  23b4a7:	74 13                	je     23b4bc <strtok+0x11e>
  23b4a9:	8b 05 b1 6c ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6cb1]        # 232160 <tokptr>
  23b4af:	48 98                	cdqe   
  23b4b1:	0f b6 80 60 1f 23 00 	movzx  eax,BYTE PTR [rax+0x231f60]
  23b4b8:	84 c0                	test   al,al
  23b4ba:	75 b9                	jne    23b475 <strtok+0xd7>
  23b4bc:	8b 05 9e 6c ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6c9e]        # 232160 <tokptr>
  23b4c2:	48 98                	cdqe   
  23b4c4:	c6 80 60 1f 23 00 00 	mov    BYTE PTR [rax+0x231f60],0x0
  23b4cb:	8b 05 8f 6c ff ff    	mov    eax,DWORD PTR [rip+0xffffffffffff6c8f]        # 232160 <tokptr>
  23b4d1:	83 c0 01             	add    eax,0x1
  23b4d4:	99                   	cdq    
  23b4d5:	c1 ea 17             	shr    edx,0x17
  23b4d8:	01 d0                	add    eax,edx
  23b4da:	25 ff 01 00 00       	and    eax,0x1ff
  23b4df:	29 d0                	sub    eax,edx
  23b4e1:	89 05 79 6c ff ff    	mov    DWORD PTR [rip+0xffffffffffff6c79],eax        # 232160 <tokptr>
  23b4e7:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  23b4eb:	74 06                	je     23b4f3 <strtok+0x155>
  23b4ed:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  23b4f1:	eb 05                	jmp    23b4f8 <strtok+0x15a>
  23b4f3:	b8 00 00 00 00       	mov    eax,0x0
  23b4f8:	c9                   	leave  
  23b4f9:	c3                   	ret    

000000000023b4fa <strcmp>:
  23b4fa:	f3 0f 1e fa          	endbr64 
  23b4fe:	55                   	push   rbp
  23b4ff:	48 89 e5             	mov    rbp,rsp
  23b502:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  23b506:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  23b50a:	eb 3c                	jmp    23b548 <strcmp+0x4e>
  23b50c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23b510:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  23b513:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  23b517:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23b51a:	38 c2                	cmp    dl,al
  23b51c:	7e 07                	jle    23b525 <strcmp+0x2b>
  23b51e:	b8 01 00 00 00       	mov    eax,0x1
  23b523:	eb 52                	jmp    23b577 <strcmp+0x7d>
  23b525:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23b529:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  23b52c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  23b530:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23b533:	38 c2                	cmp    dl,al
  23b535:	7d 07                	jge    23b53e <strcmp+0x44>
  23b537:	b8 ff ff ff ff       	mov    eax,0xffffffff
  23b53c:	eb 39                	jmp    23b577 <strcmp+0x7d>
  23b53e:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  23b543:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  23b548:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23b54c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23b54f:	84 c0                	test   al,al
  23b551:	74 0b                	je     23b55e <strcmp+0x64>
  23b553:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  23b557:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23b55a:	84 c0                	test   al,al
  23b55c:	75 ae                	jne    23b50c <strcmp+0x12>
  23b55e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23b562:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  23b565:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  23b569:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23b56c:	38 c2                	cmp    dl,al
  23b56e:	75 07                	jne    23b577 <strcmp+0x7d>
  23b570:	b8 00 00 00 00       	mov    eax,0x0
  23b575:	eb 00                	jmp    23b577 <strcmp+0x7d>
  23b577:	5d                   	pop    rbp
  23b578:	c3                   	ret    

000000000023b579 <strlen>:
  23b579:	f3 0f 1e fa          	endbr64 
  23b57d:	55                   	push   rbp
  23b57e:	48 89 e5             	mov    rbp,rsp
  23b581:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  23b585:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  23b58c:	eb 09                	jmp    23b597 <strlen+0x1e>
  23b58e:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  23b593:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  23b597:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  23b59b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23b59e:	84 c0                	test   al,al
  23b5a0:	75 ec                	jne    23b58e <strlen+0x15>
  23b5a2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23b5a5:	5d                   	pop    rbp
  23b5a6:	c3                   	ret    

000000000023b5a7 <sprintf>:
  23b5a7:	f3 0f 1e fa          	endbr64 
  23b5ab:	55                   	push   rbp
  23b5ac:	48 89 e5             	mov    rbp,rsp
  23b5af:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  23b5b6:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  23b5bd:	48 89 b5 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rsi
  23b5c4:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  23b5cb:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  23b5d2:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  23b5d9:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  23b5e0:	84 c0                	test   al,al
  23b5e2:	74 20                	je     23b604 <sprintf+0x5d>
  23b5e4:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  23b5e8:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  23b5ec:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  23b5f0:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  23b5f4:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  23b5f8:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  23b5fc:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  23b600:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7
  23b604:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  23b60b:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
  23b612:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  23b619:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
  23b620:	c7 85 3c ff ff ff 00 	mov    DWORD PTR [rbp-0xc4],0x0
  23b627:	00 00 00 
  23b62a:	eb 39                	jmp    23b665 <sprintf+0xbe>
  23b62c:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  23b633:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23b636:	3c 25                	cmp    al,0x25
  23b638:	75 15                	jne    23b64f <sprintf+0xa8>
  23b63a:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  23b641:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23b644:	3c 25                	cmp    al,0x25
  23b646:	74 07                	je     23b64f <sprintf+0xa8>
  23b648:	83 85 3c ff ff ff 01 	add    DWORD PTR [rbp-0xc4],0x1
  23b64f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  23b656:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
  23b65d:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  23b664:	01 
  23b665:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  23b66c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23b66f:	3c 0a                	cmp    al,0xa
  23b671:	75 b9                	jne    23b62c <sprintf+0x85>
  23b673:	c7 85 08 ff ff ff 10 	mov    DWORD PTR [rbp-0xf8],0x10
  23b67a:	00 00 00 
  23b67d:	c7 85 0c ff ff ff 30 	mov    DWORD PTR [rbp-0xf4],0x30
  23b684:	00 00 00 
  23b687:	48 8d 45 10          	lea    rax,[rbp+0x10]
  23b68b:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  23b692:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  23b699:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
  23b6a0:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  23b6a7:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
  23b6ae:	e9 e2 01 00 00       	jmp    23b895 <sprintf+0x2ee>
  23b6b3:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  23b6ba:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23b6bd:	3c 25                	cmp    al,0x25
  23b6bf:	0f 85 aa 01 00 00    	jne    23b86f <sprintf+0x2c8>
  23b6c5:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  23b6cc:	48 83 c0 01          	add    rax,0x1
  23b6d0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23b6d3:	84 c0                	test   al,al
  23b6d5:	0f 84 94 01 00 00    	je     23b86f <sprintf+0x2c8>
  23b6db:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  23b6e2:	01 
  23b6e3:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  23b6ea:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23b6ed:	3c 78                	cmp    al,0x78
  23b6ef:	75 64                	jne    23b755 <sprintf+0x1ae>
  23b6f1:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  23b6f7:	83 f8 2f             	cmp    eax,0x2f
  23b6fa:	77 23                	ja     23b71f <sprintf+0x178>
  23b6fc:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  23b703:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  23b709:	89 d2                	mov    edx,edx
  23b70b:	48 01 d0             	add    rax,rdx
  23b70e:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  23b714:	83 c2 08             	add    edx,0x8
  23b717:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  23b71d:	eb 12                	jmp    23b731 <sprintf+0x18a>
  23b71f:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  23b726:	48 8d 50 08          	lea    rdx,[rax+0x8]
  23b72a:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  23b731:	8b 00                	mov    eax,DWORD PTR [rax]
  23b733:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  23b739:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
  23b73f:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  23b746:	89 d6                	mov    esi,edx
  23b748:	48 89 c7             	mov    rdi,rax
  23b74b:	e8 4e 02 00 00       	call   23b99e <sprint_hex>
  23b750:	e9 38 01 00 00       	jmp    23b88d <sprintf+0x2e6>
  23b755:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  23b75c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23b75f:	3c 73                	cmp    al,0x73
  23b761:	75 68                	jne    23b7cb <sprintf+0x224>
  23b763:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  23b769:	83 f8 2f             	cmp    eax,0x2f
  23b76c:	77 23                	ja     23b791 <sprintf+0x1ea>
  23b76e:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  23b775:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  23b77b:	89 d2                	mov    edx,edx
  23b77d:	48 01 d0             	add    rax,rdx
  23b780:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  23b786:	83 c2 08             	add    edx,0x8
  23b789:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  23b78f:	eb 12                	jmp    23b7a3 <sprintf+0x1fc>
  23b791:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  23b798:	48 8d 50 08          	lea    rdx,[rax+0x8]
  23b79c:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  23b7a3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  23b7a6:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
  23b7ad:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
  23b7b4:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  23b7bb:	48 89 d6             	mov    rsi,rdx
  23b7be:	48 89 c7             	mov    rdi,rax
  23b7c1:	e8 5a 02 00 00       	call   23ba20 <sprintn>
  23b7c6:	e9 c2 00 00 00       	jmp    23b88d <sprintf+0x2e6>
  23b7cb:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  23b7d2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23b7d5:	3c 64                	cmp    al,0x64
  23b7d7:	75 66                	jne    23b83f <sprintf+0x298>
  23b7d9:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  23b7df:	83 f8 2f             	cmp    eax,0x2f
  23b7e2:	77 23                	ja     23b807 <sprintf+0x260>
  23b7e4:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  23b7eb:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  23b7f1:	89 d2                	mov    edx,edx
  23b7f3:	48 01 d0             	add    rax,rdx
  23b7f6:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  23b7fc:	83 c2 08             	add    edx,0x8
  23b7ff:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  23b805:	eb 12                	jmp    23b819 <sprintf+0x272>
  23b807:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  23b80e:	48 8d 50 08          	lea    rdx,[rax+0x8]
  23b812:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  23b819:	48 8b 00             	mov    rax,QWORD PTR [rax]
  23b81c:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
  23b823:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  23b82a:	89 c2                	mov    edx,eax
  23b82c:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  23b833:	89 d6                	mov    esi,edx
  23b835:	48 89 c7             	mov    rdi,rax
  23b838:	e8 ad 00 00 00       	call   23b8ea <sprint_decimal>
  23b83d:	eb 4e                	jmp    23b88d <sprintf+0x2e6>
  23b83f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  23b846:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23b849:	3c 63                	cmp    al,0x63
  23b84b:	75 02                	jne    23b84f <sprintf+0x2a8>
  23b84d:	0f 0b                	ud2    
  23b84f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  23b856:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23b859:	0f be d0             	movsx  edx,al
  23b85c:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  23b863:	89 d6                	mov    esi,edx
  23b865:	48 89 c7             	mov    rdi,rax
  23b868:	e8 3e 00 00 00       	call   23b8ab <sprintchar>
  23b86d:	eb 1e                	jmp    23b88d <sprintf+0x2e6>
  23b86f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  23b876:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23b879:	0f be d0             	movsx  edx,al
  23b87c:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  23b883:	89 d6                	mov    esi,edx
  23b885:	48 89 c7             	mov    rdi,rax
  23b888:	e8 1e 00 00 00       	call   23b8ab <sprintchar>
  23b88d:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  23b894:	01 
  23b895:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  23b89c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23b89f:	84 c0                	test   al,al
  23b8a1:	0f 85 0c fe ff ff    	jne    23b6b3 <sprintf+0x10c>
  23b8a7:	90                   	nop
  23b8a8:	90                   	nop
  23b8a9:	c9                   	leave  
  23b8aa:	c3                   	ret    

000000000023b8ab <sprintchar>:
  23b8ab:	f3 0f 1e fa          	endbr64 
  23b8af:	55                   	push   rbp
  23b8b0:	48 89 e5             	mov    rbp,rsp
  23b8b3:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  23b8b7:	89 f0                	mov    eax,esi
  23b8b9:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
  23b8bc:	eb 05                	jmp    23b8c3 <sprintchar+0x18>
  23b8be:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  23b8c3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23b8c7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23b8ca:	84 c0                	test   al,al
  23b8cc:	75 f0                	jne    23b8be <sprintchar+0x13>
  23b8ce:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23b8d2:	48 8d 50 01          	lea    rdx,[rax+0x1]
  23b8d6:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  23b8da:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  23b8de:	88 10                	mov    BYTE PTR [rax],dl
  23b8e0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23b8e4:	c6 00 00             	mov    BYTE PTR [rax],0x0
  23b8e7:	90                   	nop
  23b8e8:	5d                   	pop    rbp
  23b8e9:	c3                   	ret    

000000000023b8ea <sprint_decimal>:
  23b8ea:	f3 0f 1e fa          	endbr64 
  23b8ee:	55                   	push   rbp
  23b8ef:	48 89 e5             	mov    rbp,rsp
  23b8f2:	48 83 ec 30          	sub    rsp,0x30
  23b8f6:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  23b8fa:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
  23b8fd:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  23b904:	eb 65                	jmp    23b96b <sprint_decimal+0x81>
  23b906:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  23b909:	48 63 c2             	movsxd rax,edx
  23b90c:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  23b913:	48 c1 e8 20          	shr    rax,0x20
  23b917:	c1 f8 02             	sar    eax,0x2
  23b91a:	89 d6                	mov    esi,edx
  23b91c:	c1 fe 1f             	sar    esi,0x1f
  23b91f:	29 f0                	sub    eax,esi
  23b921:	89 c1                	mov    ecx,eax
  23b923:	89 c8                	mov    eax,ecx
  23b925:	c1 e0 02             	shl    eax,0x2
  23b928:	01 c8                	add    eax,ecx
  23b92a:	01 c0                	add    eax,eax
  23b92c:	89 d1                	mov    ecx,edx
  23b92e:	29 c1                	sub    ecx,eax
  23b930:	89 c8                	mov    eax,ecx
  23b932:	83 c0 30             	add    eax,0x30
  23b935:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
  23b938:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23b93b:	8d 50 01             	lea    edx,[rax+0x1]
  23b93e:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  23b941:	48 98                	cdqe   
  23b943:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  23b947:	88 54 05 e0          	mov    BYTE PTR [rbp+rax*1-0x20],dl
  23b94b:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  23b94e:	48 63 d0             	movsxd rdx,eax
  23b951:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
  23b958:	48 c1 ea 20          	shr    rdx,0x20
  23b95c:	c1 fa 02             	sar    edx,0x2
  23b95f:	c1 f8 1f             	sar    eax,0x1f
  23b962:	89 c1                	mov    ecx,eax
  23b964:	89 d0                	mov    eax,edx
  23b966:	29 c8                	sub    eax,ecx
  23b968:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
  23b96b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23b96e:	83 f8 0f             	cmp    eax,0xf
  23b971:	76 93                	jbe    23b906 <sprint_decimal+0x1c>
  23b973:	eb 1f                	jmp    23b994 <sprint_decimal+0xaa>
  23b975:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  23b979:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23b97c:	48 98                	cdqe   
  23b97e:	0f b6 44 05 e0       	movzx  eax,BYTE PTR [rbp+rax*1-0x20]
  23b983:	0f be d0             	movsx  edx,al
  23b986:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  23b98a:	89 d6                	mov    esi,edx
  23b98c:	48 89 c7             	mov    rdi,rax
  23b98f:	e8 17 ff ff ff       	call   23b8ab <sprintchar>
  23b994:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  23b998:	7f db                	jg     23b975 <sprint_decimal+0x8b>
  23b99a:	90                   	nop
  23b99b:	90                   	nop
  23b99c:	c9                   	leave  
  23b99d:	c3                   	ret    

000000000023b99e <sprint_hex>:
  23b99e:	f3 0f 1e fa          	endbr64 
  23b9a2:	55                   	push   rbp
  23b9a3:	48 89 e5             	mov    rbp,rsp
  23b9a6:	48 83 ec 20          	sub    rsp,0x20
  23b9aa:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  23b9ae:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  23b9b1:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  23b9b8:	eb 35                	jmp    23b9ef <sprint_hex+0x51>
  23b9ba:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  23b9bd:	83 e0 0f             	and    eax,0xf
  23b9c0:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
  23b9c3:	80 7d fb 09          	cmp    BYTE PTR [rbp-0x5],0x9
  23b9c7:	76 06                	jbe    23b9cf <sprint_hex+0x31>
  23b9c9:	80 45 fb 57          	add    BYTE PTR [rbp-0x5],0x57
  23b9cd:	eb 04                	jmp    23b9d3 <sprint_hex+0x35>
  23b9cf:	80 45 fb 30          	add    BYTE PTR [rbp-0x5],0x30
  23b9d3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23b9d6:	8d 50 01             	lea    edx,[rax+0x1]
  23b9d9:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  23b9dc:	48 98                	cdqe   
  23b9de:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  23b9e2:	88 54 05 f1          	mov    BYTE PTR [rbp+rax*1-0xf],dl
  23b9e6:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  23b9e9:	c1 e8 04             	shr    eax,0x4
  23b9ec:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
  23b9ef:	83 7d fc 09          	cmp    DWORD PTR [rbp-0x4],0x9
  23b9f3:	7e c5                	jle    23b9ba <sprint_hex+0x1c>
  23b9f5:	eb 1f                	jmp    23ba16 <sprint_hex+0x78>
  23b9f7:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  23b9fb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  23b9fe:	48 98                	cdqe   
  23ba00:	0f b6 44 05 f1       	movzx  eax,BYTE PTR [rbp+rax*1-0xf]
  23ba05:	0f be d0             	movsx  edx,al
  23ba08:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  23ba0c:	89 d6                	mov    esi,edx
  23ba0e:	48 89 c7             	mov    rdi,rax
  23ba11:	e8 95 fe ff ff       	call   23b8ab <sprintchar>
  23ba16:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  23ba1a:	7f db                	jg     23b9f7 <sprint_hex+0x59>
  23ba1c:	90                   	nop
  23ba1d:	90                   	nop
  23ba1e:	c9                   	leave  
  23ba1f:	c3                   	ret    

000000000023ba20 <sprintn>:
  23ba20:	f3 0f 1e fa          	endbr64 
  23ba24:	55                   	push   rbp
  23ba25:	48 89 e5             	mov    rbp,rsp
  23ba28:	48 83 ec 10          	sub    rsp,0x10
  23ba2c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  23ba30:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  23ba34:	eb 20                	jmp    23ba56 <sprintn+0x36>
  23ba36:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  23ba3a:	48 8d 50 01          	lea    rdx,[rax+0x1]
  23ba3e:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  23ba42:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23ba45:	0f be d0             	movsx  edx,al
  23ba48:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  23ba4c:	89 d6                	mov    esi,edx
  23ba4e:	48 89 c7             	mov    rdi,rax
  23ba51:	e8 55 fe ff ff       	call   23b8ab <sprintchar>
  23ba56:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  23ba5a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  23ba5d:	84 c0                	test   al,al
  23ba5f:	75 d5                	jne    23ba36 <sprintn+0x16>
  23ba61:	90                   	nop
  23ba62:	90                   	nop
  23ba63:	c9                   	leave  
  23ba64:	c3                   	ret    
  23ba65:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  23ba6c:	00 00 00 
  23ba6f:	90                   	nop

000000000023ba70 <create_zero>:
  23ba70:	e8 9e a4 ff ff       	call   235f13 <req_proc+0x4>
  23ba75:	83 f8 ff             	cmp    eax,0xffffffff
  23ba78:	74 1d                	je     23ba97 <create_zero.retu>
  23ba7a:	50                   	push   rax
  23ba7b:	53                   	push   rbx
  23ba7c:	51                   	push   rcx
  23ba7d:	52                   	push   rdx
  23ba7e:	06                   	(bad)  
  23ba7f:	0e                   	(bad)  
  23ba80:	16                   	(bad)  
  23ba81:	1e                   	(bad)  
  23ba82:	0f a0                	push   fs
  23ba84:	0f a8                	push   gs
  23ba86:	54                   	push   rsp
  23ba87:	55                   	push   rbp
  23ba88:	56                   	push   rsi
  23ba89:	57                   	push   rdi
  23ba8a:	9c                   	pushf  
  23ba8b:	50                   	push   rax
  23ba8c:	e8 4e a5 ff ff       	call   235fdf <set_proc+0x4>
  23ba91:	8b 04 24             	mov    eax,DWORD PTR [rsp]
  23ba94:	83 c4 40             	add    esp,0x40

000000000023ba97 <create_zero.retu>:
  23ba97:	c3                   	ret    

000000000023ba98 <fill_desc>:
  23ba98:	55                   	push   rbp
  23ba99:	89 e5                	mov    ebp,esp
  23ba9b:	8b 45 14             	mov    eax,DWORD PTR [rbp+0x14]
  23ba9e:	8b 5d 10             	mov    ebx,DWORD PTR [rbp+0x10]
  23baa1:	8b 4d 0c             	mov    ecx,DWORD PTR [rbp+0xc]
  23baa4:	8b 55 08             	mov    edx,DWORD PTR [rbp+0x8]
  23baa7:	be 70 ba 23 00       	mov    esi,0x23ba70
  23baac:	c7 05 70 ba 23 00 00 	mov    DWORD PTR [rip+0x23ba70],0x0        # 477526 <dev_stdout+0x23aac6>
  23bab3:	00 00 00 
  23bab6:	c7 05 70 ba 23 00 00 	mov    DWORD PTR [rip+0x23ba70],0x0        # 477530 <dev_stdout+0x23aad0>
  23babd:	00 00 00 
  23bac0:	66 89 0e             	mov    WORD PTR [rsi],cx
  23bac3:	c1 e9 10             	shr    ecx,0x10
  23bac6:	66 89 56 02          	mov    WORD PTR [rsi+0x2],dx
  23baca:	c1 ea 10             	shr    edx,0x10
  23bacd:	88 56 04             	mov    BYTE PTR [rsi+0x4],dl
  23bad0:	66 c1 ea 08          	shr    dx,0x8
  23bad4:	88 56 07             	mov    BYTE PTR [rsi+0x7],dl
  23bad7:	66 89 5e 05          	mov    WORD PTR [rsi+0x5],bx
  23badb:	8b 7e 04             	mov    edi,DWORD PTR [rsi+0x4]
  23bade:	c1 e1 08             	shl    ecx,0x8
  23bae1:	09 cf                	or     edi,ecx
  23bae3:	89 7e 04             	mov    DWORD PTR [rsi+0x4],edi
  23bae6:	8b 15 70 ba 23 00    	mov    edx,DWORD PTR [rip+0x23ba70]        # 47755c <dev_stdout+0x23aafc>
  23baec:	89 10                	mov    DWORD PTR [rax],edx
  23baee:	8b 15 70 ba 23 00    	mov    edx,DWORD PTR [rip+0x23ba70]        # 477564 <dev_stdout+0x23ab04>
  23baf4:	89 50 04             	mov    DWORD PTR [rax+0x4],edx
  23baf7:	89 ec                	mov    esp,ebp
  23baf9:	5d                   	pop    rbp
  23bafa:	c3                   	ret    

000000000023bafb <switch_proc_asm>:
  23bafb:	66 8b 44 24 04       	mov    ax,WORD PTR [rsp+0x4]
  23bb00:	66 a3 70 ba 23 00 c7 	movabs ds:0xba7005c70023ba70,ax
  23bb07:	05 70 ba 
  23bb0a:	23 00                	and    eax,DWORD PTR [rax]
  23bb0c:	00 00                	add    BYTE PTR [rax],al
	...

000000000023bb10 <switch_proc_asm.ljmp>:
  23bb10:	ea                   	(bad)  
  23bb11:	00 00                	add    BYTE PTR [rax],al
  23bb13:	00 00                	add    BYTE PTR [rax],al
  23bb15:	00 00                	add    BYTE PTR [rax],al
  23bb17:	c3                   	ret    

000000000023bb18 <switch_to>:
  23bb18:	8b 74 24 04          	mov    esi,DWORD PTR [rsp+0x4]
  23bb1c:	8b 5e 20             	mov    ebx,DWORD PTR [rsi+0x20]
  23bb1f:	bf 70 ba 23 00       	mov    edi,0x23ba70
  23bb24:	89 5f 01             	mov    DWORD PTR [rdi+0x1],ebx
  23bb27:	8b 46 38             	mov    eax,DWORD PTR [rsi+0x38]
  23bb2a:	89 c1                	mov    ecx,eax
  23bb2c:	83 e9 04             	sub    ecx,0x4
  23bb2f:	89 19                	mov    DWORD PTR [rcx],ebx
  23bb31:	50                   	push   rax
  23bb32:	89 f5                	mov    ebp,esi
  23bb34:	83 c5 28             	add    ebp,0x28
  23bb37:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  23bb3a:	50                   	push   rax
  23bb3b:	83 c5 04             	add    ebp,0x4
  23bb3e:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  23bb41:	50                   	push   rax
  23bb42:	83 c5 04             	add    ebp,0x4
  23bb45:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  23bb48:	50                   	push   rax
  23bb49:	83 c5 04             	add    ebp,0x4
  23bb4c:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  23bb4f:	50                   	push   rax
  23bb50:	83 c5 04             	add    ebp,0x4
  23bb53:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  23bb56:	50                   	push   rax
  23bb57:	83 c5 04             	add    ebp,0x4
  23bb5a:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  23bb5d:	50                   	push   rax
  23bb5e:	83 c5 04             	add    ebp,0x4
  23bb61:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  23bb64:	50                   	push   rax
  23bb65:	83 c5 04             	add    ebp,0x4
  23bb68:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  23bb6b:	50                   	push   rax
  23bb6c:	83 c5 04             	add    ebp,0x4
  23bb6f:	8b 46 1c             	mov    eax,DWORD PTR [rsi+0x1c]
  23bb72:	0f 22 d8             	mov    cr3,rax
  23bb75:	8b 46 24             	mov    eax,DWORD PTR [rsi+0x24]
  23bb78:	50                   	push   rax
  23bb79:	9d                   	popf   
  23bb7a:	61                   	(bad)  
  23bb7b:	5c                   	pop    rsp

000000000023bb7c <switch_to.leap>:
  23bb7c:	ea                   	(bad)  
  23bb7d:	00 00                	add    BYTE PTR [rax],al
  23bb7f:	00 00                	add    BYTE PTR [rax],al
  23bb81:	08 00                	or     BYTE PTR [rax],al

000000000023bb83 <save_context>:
  23bb83:	60                   	(bad)  
  23bb84:	8b 44 24 24          	mov    eax,DWORD PTR [rsp+0x24]
  23bb88:	83 c0 44             	add    eax,0x44
  23bb8b:	b9 08 00 00 00       	mov    ecx,0x8
  23bb90:	89 e7                	mov    edi,esp

000000000023bb92 <save_context.loops>:
  23bb92:	8b 17                	mov    edx,DWORD PTR [rdi]
  23bb94:	89 10                	mov    DWORD PTR [rax],edx
  23bb96:	83 c7 04             	add    edi,0x4
  23bb99:	83 e8 04             	sub    eax,0x4
  23bb9c:	e2 f4                	loop   23bb92 <save_context.loops>
  23bb9e:	61                   	(bad)  
  23bb9f:	9c                   	pushf  
  23bba0:	5b                   	pop    rbx
  23bba1:	8b 44 24 04          	mov    eax,DWORD PTR [rsp+0x4]
  23bba5:	89 58 24             	mov    DWORD PTR [rax+0x24],ebx
  23bba8:	8b 1c 24             	mov    ebx,DWORD PTR [rsp]
  23bbab:	89 58 20             	mov    DWORD PTR [rax+0x20],ebx
  23bbae:	c3                   	ret    

000000000023bbaf <move_to_user_mode>:
  23bbaf:	66 b8 20 00          	mov    ax,0x20
  23bbb3:	8e d8                	mov    ds,eax
  23bbb5:	8e c0                	mov    es,eax
  23bbb7:	8e e8                	mov    gs,eax
  23bbb9:	6a 20                	push   0x20
  23bbbb:	54                   	push   rsp
  23bbbc:	9c                   	pushf  
  23bbbd:	6a 18                	push   0x18
  23bbbf:	68 70 ba 23 00       	push   0x23ba70
  23bbc4:	cf                   	iret   

000000000023bbc5 <move_to_user_mode.done>:
  23bbc5:	c3                   	ret    

000000000023bbc6 <desc>:
	...
