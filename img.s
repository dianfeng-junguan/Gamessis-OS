
bin/gmsknl.img:     file format elf64-x86-64


Disassembly of section .text:

0000000000108070 <init64>:
  108070:	b8 00 80 ff ff       	mov    $0xffff8000,%eax
  108075:	48 c1 e0 20          	shl    $0x20,%rax
  108079:	48 01 c4             	add    %rax,%rsp
  10807c:	48 01 c5             	add    %rax,%rbp
  10807f:	53                   	push   %rbx
  108080:	48 8b 1c 25 02 50 10 	mov    0x105002,%rbx
  108087:	00 
  108088:	48 09 d8             	or     %rbx,%rax
  10808b:	48 89 04 25 02 50 10 	mov    %rax,0x105002
  108092:	00 
  108093:	b8 00 50 10 00       	mov    $0x105000,%eax
  108098:	0f 01 10             	lgdt   (%rax)
  10809b:	5b                   	pop    %rbx
  10809c:	48 31 c0             	xor    %rax,%rax
  10809f:	48 b8 ab 80 10 00 00 	movabs $0x1080ab,%rax
  1080a6:	00 00 00 
  1080a9:	50                   	push   %rax
  1080aa:	c3                   	ret    

00000000001080ab <do_reloc>:
  1080ab:	f3 0f 1e fa          	endbr64 
  1080af:	55                   	push   %rbp
  1080b0:	48 89 e5             	mov    %rsp,%rbp
  1080b3:	48 83 ec 70          	sub    $0x70,%rsp
  1080b7:	89 7d 9c             	mov    %edi,-0x64(%rbp)
  1080ba:	48 89 75 90          	mov    %rsi,-0x70(%rbp)
  1080be:	48 b8 c3 81 10 00 00 	movabs $0x1081c3,%rax
  1080c5:	00 00 00 
  1080c8:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  1080cc:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  1080d0:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  1080d4:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  1080d8:	0f b7 40 38          	movzwl 0x38(%rax),%eax
  1080dc:	66 89 45 c6          	mov    %ax,-0x3a(%rbp)
  1080e0:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  1080e4:	0f b7 40 36          	movzwl 0x36(%rax),%eax
  1080e8:	66 89 45 c4          	mov    %ax,-0x3c(%rbp)
  1080ec:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  1080f0:	48 8b 50 28          	mov    0x28(%rax),%rdx
  1080f4:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  1080f8:	48 01 d0             	add    %rdx,%rax
  1080fb:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
  1080ff:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  108103:	48 8b 50 20          	mov    0x20(%rax),%rdx
  108107:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  10810b:	48 01 d0             	add    %rdx,%rax
  10810e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  108112:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
  108119:	eb 71                	jmp    10818c <do_reloc+0xe1>
  10811b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  10811f:	48 8b 40 08          	mov    0x8(%rax),%rax
  108123:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
  108127:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  10812b:	48 8b 40 20          	mov    0x20(%rax),%rax
  10812f:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
  108133:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  108137:	48 8b 40 10          	mov    0x10(%rax),%rax
  10813b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  10813f:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  108143:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  108147:	48 01 d0             	add    %rdx,%rax
  10814a:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  10814e:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
  108155:	eb 21                	jmp    108178 <do_reloc+0xcd>
  108157:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  10815b:	48 8d 42 01          	lea    0x1(%rdx),%rax
  10815f:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  108163:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  108167:	48 8d 48 01          	lea    0x1(%rax),%rcx
  10816b:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  10816f:	0f b6 12             	movzbl (%rdx),%edx
  108172:	88 10                	mov    %dl,(%rax)
  108174:	83 45 dc 01          	addl   $0x1,-0x24(%rbp)
  108178:	8b 45 dc             	mov    -0x24(%rbp),%eax
  10817b:	48 98                	cltq   
  10817d:	48 39 45 a0          	cmp    %rax,-0x60(%rbp)
  108181:	77 d4                	ja     108157 <do_reloc+0xac>
  108183:	48 83 45 f8 38       	addq   $0x38,-0x8(%rbp)
  108188:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
  10818c:	0f b7 45 c6          	movzwl -0x3a(%rbp),%eax
  108190:	39 45 f4             	cmp    %eax,-0xc(%rbp)
  108193:	7c 86                	jl     10811b <do_reloc+0x70>
  108195:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  108199:	48 8b 40 18          	mov    0x18(%rax),%rax
  10819d:	48 ba 00 00 00 00 00 	movabs $0xffff800000000000,%rdx
  1081a4:	80 ff ff 
  1081a7:	48 09 d0             	or     %rdx,%rax
  1081aa:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
  1081ae:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  1081b2:	8b 45 9c             	mov    -0x64(%rbp),%eax
  1081b5:	48 8b 4d b0          	mov    -0x50(%rbp),%rcx
  1081b9:	48 89 d6             	mov    %rdx,%rsi
  1081bc:	89 c7                	mov    %eax,%edi
  1081be:	ff d1                	call   *%rcx
  1081c0:	90                   	nop
  1081c1:	c9                   	leave  
  1081c2:	c3                   	ret    
